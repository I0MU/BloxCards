--[[ ServerScriptService/Modules/DeckUtil  (ModuleScript)
Deck helpers. Decks live inside card storage:
  storage[card]["0"]      = copies owned
  storage[card]["<slot>"] = copies of that card in deck slot <slot>
A deck table (what the client sends/receives) is { [cardName] = count }.
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(script.Parent.Config)

local DeckUtil = {}

local library -- loaded lazily; false if it couldn't be required
local function getLibrary()
	if library == nil then
		local module = ReplicatedStorage:FindFirstChild("CardLibrary")
		if module then
			local ok, result = pcall(require, module)
			library = ok and result or false
			if not ok then
				warn("[DeckUtil] Could not require CardLibrary; card names won't be validated:", result)
			end
		else
			library = false
		end
	end
	return library
end

function DeckUtil.GetCard(name)
	local lib = getLibrary()
	if lib then
		local card = lib[name]
		if type(card) == "table" and card.Rarity then
			return card
		end
		return nil
	end
	return nil
end

function DeckUtil.LibraryAvailable()
	return getLibrary() ~= false
end

-- Returns the raw CardLibrary table, or nil if it couldn't be loaded.
function DeckUtil.GetLibrary()
	return getLibrary() or nil
end

function DeckUtil.Owned(data, card)
	local entry = data.storage[card]
	return entry and entry["0"] or 0
end

function DeckUtil.GetDeck(data, slot)
	slot = tostring(slot)
	local deck = {}
	for card, entry in pairs(data.storage) do
		local n = entry[slot]
		if n and n > 0 then
			deck[card] = n
		end
	end
	return deck
end

function DeckUtil.Count(deck)
	local total = 0
	for _, n in pairs(deck) do
		total += n
	end
	return total
end

-- Takes whatever the client sent and returns a clean deck: known cards only, integer counts,
-- not more than owned, within rarity limits (grouping alt arts with their Original),
-- and at most DECK_SIZE cards total.
function DeckUtil.Sanitize(data, rawDeck)
	local clean = {}
	if type(rawDeck) ~= "table" then
		return clean
	end

	local names = {}
	for card, n in pairs(rawDeck) do
		if type(card) == "string" and type(n) == "number" and n >= 1 then
			table.insert(names, card)
		end
	end
	table.sort(names)

	local groupTotals = {}
	local total = 0
	local lib = getLibrary()

	for _, card in ipairs(names) do
		local want = math.floor(rawDeck[card])
		local owned = DeckUtil.Owned(data, card)
		local info = DeckUtil.GetCard(card)

		if lib and not info then
			continue -- unknown card name
		end

		want = math.min(want, owned, Config.DECK_SIZE - total)

		if info then
			local group = info.Original or card
			local limit = Config.RARITY_LIMITS[info.Rarity] or 0
			local used = groupTotals[group] or 0
			want = math.min(want, limit - used)
			if want > 0 then
				groupTotals[group] = used + want
			end
		end

		if want > 0 then
			clean[card] = want
			total += want
		end
	end
	return clean
end

-- Writes `deck` into the slot, clearing whatever was there before.
function DeckUtil.SetDeck(data, slot, deck)
	slot = tostring(slot)
	for _, entry in pairs(data.storage) do
		entry[slot] = nil
	end
	for card, n in pairs(deck) do
		local entry = data.storage[card]
		if entry then
			entry[slot] = n
		end
	end
end

function DeckUtil.ClearSlot(data, slot)
	slot = tostring(slot)
	for _, entry in pairs(data.storage) do
		entry[slot] = nil
	end
end

function DeckUtil.IsLegal(deck)
	return DeckUtil.Count(deck) == Config.DECK_SIZE
end

-- Tops the player's inventory up to a full playset (Config.RARITY_LIMITS copies) of every card in the
-- library, foils and alt arts included. Tokens that can't be pulled from packs are skipped; rarities without
-- a limit entry get 1. Only raises counts, never lowers them, and doesn't flag cards as "new".
function DeckUtil.UnlockAll(data)
	local lib = getLibrary()
	if not lib then
		warn("[DeckUtil] UnlockAll skipped: CardLibrary couldn't be loaded")
		return 0
	end
	local storage = data.storage
	local changed = 0
	for name, card in pairs(lib) do
		if type(name) == "string" and type(card) == "table" and card.Rarity then
			local want = Config.RARITY_LIMITS[card.Rarity]
			if want == nil then
				want = 1
			elseif want == 0 then
				want = card.InPacks and 1 or 0
			end
			if want > 0 then
				local entry = storage[name]
				if not entry then
					entry = { ["0"] = 0 }
					storage[name] = entry
				end
				if (entry["0"] or 0) < want then
					entry["0"] = want
					changed += 1
				end
			end
		end
	end
	return changed
end

-- Gives copies of a card to the player's inventory (the "0" count).
function DeckUtil.GiveCard(data, card, amount)
	local entry = data.storage[card]
	if not entry then
		entry = { ["0"] = 0 }
		data.storage[card] = entry
	end
	entry["0"] = (entry["0"] or 0) + amount
	data.newCards[card] = true
end

return DeckUtil