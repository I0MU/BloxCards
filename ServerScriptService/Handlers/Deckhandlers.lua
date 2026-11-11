--[[ ServerScriptService/Handlers/DeckHandlers  (ModuleScript)
Deck slots: create / delete / rename / load / save / legality check, plus starter deck choice.
All ownership and limit checks happen here; the client's deck table is never trusted.
]]
local TextService = game:GetService("TextService")

local Config = require(script.Parent.Parent.Modules.Config)
local DeckUtil = require(script.Parent.Parent.Modules.DeckUtil)

local DeckHandlers = {}

function DeckHandlers.Init(Network, PlayerData)
	-- Returns the slot key ("1", "2"...) if it exists for this player, else nil.
	local function slotKey(d, raw)
		if raw == nil then
			return nil
		end
		local k = tostring(raw)
		return d.deckNames[k] and k or nil
	end

	local function lowestSlot(d)
		local best
		for k in pairs(d.deckNames) do
			local n = tonumber(k)
			if n and (not best or n < best) then
				best = n
			end
		end
		return best
	end

	Network.OnInvoke("GetCurrentDeckSlot", function(player)
		local d = PlayerData.Wait(player)
		if not d then
			return nil
		end
		if not d.deckNames[tostring(d.currentDeckSlot)] then
			d.currentDeckSlot = lowestSlot(d) or 1
		end
		return d.currentDeckSlot
	end)

	Network.OnInvoke("GetCurrentDeck", function(player)
		local d = PlayerData.Wait(player)
		if not d then
			return {}
		end
		return DeckUtil.GetDeck(d, d.currentDeckSlot)
	end)

	-- Picking a slot in the deck builder: loads it and makes it the current deck.
	Network.OnInvoke("GetDeck", function(player, slot)
		local d = PlayerData.Wait(player)
		if not d then
			return {}
		end
		local k = slotKey(d, slot)
		if not k then
			return DeckUtil.GetDeck(d, d.currentDeckSlot)
		end
		d.currentDeckSlot = tonumber(k)
		PlayerData.MarkDirty(player)
		return DeckUtil.GetDeck(d, k)
	end)

	-- Sent both via FireServer and InvokeServer by the client.
	-- Third arg is true when saving from the "preconstructed decks" menu; I treat it the same
	-- (still limited to cards the player owns) until I know how those decks should work.
	Network.On("SaveDeck", function(player, deck, slot)
		local d = PlayerData.Get(player)
		if not d then
			return false
		end
		local k = slotKey(d, slot)
		if not k then
			return false
		end
		DeckUtil.SetDeck(d, k, DeckUtil.Sanitize(d, deck))
		PlayerData.MarkDirty(player)
		return true
	end)

	-- No arg: { ["1"] = "Deck 1", ... }. With a slot: that deck's name.
	Network.OnInvoke("GetDeckName", function(player, slot)
		local d = PlayerData.Wait(player)
		if not d then
			return slot == nil and {} or ""
		end
		if slot == nil then
			return PlayerData.DeepCopy(d.deckNames)
		end
		return d.deckNames[tostring(slot)] or ""
	end)

	Network.OnInvoke("SaveDeckName", function(player, slot, newName)
		local d = PlayerData.Get(player)
		if not d then
			return ""
		end
		local k = slotKey(d, slot)
		if not k then
			return ""
		end
		local current = d.deckNames[k]
		if type(newName) ~= "string" then
			return current
		end
		newName = newName:gsub("^%s+", ""):gsub("%s+$", "")
		newName = newName:sub(1, Config.MAX_DECK_NAME_LENGTH)
		if newName == "" then
			return current
		end
		local ok, filtered = pcall(function()
			local result = TextService:FilterStringAsync(newName, player.UserId)
			return result:GetNonChatStringForBroadcastAsync()
		end)
		if not ok or filtered == "" then
			return current
		end
		d.deckNames[k] = filtered
		PlayerData.MarkDirty(player)
		return filtered
	end)

	Network.OnInvoke("CreateDeck", function(player)
		local d = PlayerData.Get(player)
		if not d then
			return false
		end
		local n
		for i = 1, Config.MAX_DECK_SLOTS do
			if not d.deckNames[tostring(i)] then
				n = i
				break
			end
		end
		if not n then
			return false
		end
		local name = "Deck " .. n
		d.deckNames[tostring(n)] = name
		PlayerData.MarkDirty(player)
		-- Client builds the slot button, saves its open deck, then loads the new (empty) one.
		Network.Send(player, "AddDeckSlot", n, name, false)
		return true
	end)

	-- Returns the slot number the client should open next (it does tonumber() on the result).
	Network.OnInvoke("DeleteDeck", function(player, slot)
		local d = PlayerData.Get(player)
		if not d then
			return false
		end
		local k = slotKey(d, slot)
		if not k then
			return false
		end
		local count = 0
		for _ in pairs(d.deckNames) do
			count += 1
		end
		if count <= 1 then
			return false -- always keep at least one deck
		end
		DeckUtil.ClearSlot(d, k)
		d.deckNames[k] = nil
		local nextSlot = lowestSlot(d)
		d.currentDeckSlot = nextSlot
		PlayerData.MarkDirty(player)
		return nextSlot
	end)

	-- (player, LocalPlayer, mode) -- the player argument from the client is ignored on purpose.
	Network.OnInvoke("CheckDeckLegality", function(player)
		local d = PlayerData.Get(player)
		if not d then
			return false
		end
		local deck = DeckUtil.GetDeck(d, d.currentDeckSlot)
		return DeckUtil.IsLegal(deck)
	end)

	---------------------------------------------------------------- Starter deck
	-- GUESS: the client only sends a color. If Config.STARTER_DECKS[color] isn't filled in,
	-- I build one from cards flagged StarterCard in that color (+ Neutral), 2 copies each.
	local COLORS = { Red = true, Blue = true, Green = true, Yellow = true }

	local function starterContents(color)
		local fromConfig = Config.STARTER_DECKS[color]
		if fromConfig then
			return fromConfig
		end
		local lib = DeckUtil.GetLibrary()
		local out = {}
		if not lib then
			return out
		end
		local names = {}
		for name, card in pairs(lib) do
			if type(card) == "table" and card.StarterCard and (card.Color == color or card.Color == "Neutral") then
				table.insert(names, name)
			end
		end
		table.sort(names)
		for _, name in ipairs(names) do
			local limit = Config.RARITY_LIMITS[lib[name].Rarity] or 0
			out[name] = math.min(2, limit)
		end
		return out
	end

	Network.OnFire("ChooseStarterDeck", function(player, color)
		local d = PlayerData.Get(player)
		if not d or d.chosenStarter or not COLORS[color] then
			return
		end
		d.chosenStarter = true
		d.questStats.GotStarterDeck = 1 -- the client's intro menu checks this flag
		for card, n in pairs(starterContents(color)) do
			DeckUtil.GiveCard(d, card, n)
		end
		local slot = tostring(lowestSlot(d) or 1)
		DeckUtil.SetDeck(d, slot, DeckUtil.Sanitize(d, starterContents(color)))
		d.currentDeckSlot = tonumber(slot)
		PlayerData.MarkDirty(player)
		PlayerData.PushAll(player)
	end)
end

return DeckHandlers