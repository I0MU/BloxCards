--[[ ServerScriptService/Handlers/Shophandlers  (ModuleScript)
NEW MODULE. Create it as a ModuleScript named "Shophandlers" inside ServerScriptService/Handlers
(next to Datahandlers / Deckhandlers). Server.lua picks it up automatically.

Answers the shop calls the client makes while it loads (Shop.lua, RobuxService.lua).
Before this existed they returned nil, and Shop.lua crashed at `v157[v158.currentpacknumber]`.

Anything marked PLACEHOLDER / ASSUMED is a stand-in until the real shop phase is built.
Nothing here spends or grants anything: purchases (PurchaseCardPack, BuySleeve, ...) are still unhandled.
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ShopHandlers = {}

-- ---------------------------------------------------------------------------------------------
-- Pack list
-- ---------------------------------------------------------------------------------------------
-- The client reads pack.Cards (list of card names) for the sidebar "% collected" and pack contents,
-- but ReplicatedStorage.Packs leaves it empty for library-based packs. Build it from each pack's
-- Library module, using the same rules CardLibrary uses to tag cards with a pack:
--   card counts if the pack has no FilterFunc or FilterFunc(card) is true,
--   and (rarity ~= "Token" or card.InPacks).
-- Packs that already list Cards by name keep their list.
-- Functions (FilterFunc) can't cross a remote, so they are stripped from the copy.
local cachedPacks

local function buildPacks()
	local ok, Packs = pcall(function()
		return require(ReplicatedStorage:WaitForChild("Packs"))
	end)
	if not ok then
		warn("[Shophandlers] Could not require Packs:", Packs)
		return {}
	end

	local list = {}
	for i, pack in ipairs(Packs) do
		local copy = {}
		for k, v in pairs(pack) do
			if type(v) ~= "function" then
				copy[k] = v
			end
		end

		local cards = {}
		if type(pack.Cards) == "table" and #pack.Cards > 0 then
			for _, name in ipairs(pack.Cards) do
				cards[#cards + 1] = name
			end
		elseif typeof(pack.Library) == "Instance" and pack.Library:IsA("ModuleScript") then
			local libOk, library = pcall(require, pack.Library)
			if libOk and type(library) == "table" then
				for name, card in pairs(library) do
					if type(card) == "table" then
						local passes = pack.FilterFunc == nil or pack.FilterFunc(card)
						if passes and (card.Rarity ~= "Token" or card.InPacks) then
							cards[#cards + 1] = name
						end
					end
				end
				table.sort(cards)
			else
				warn("[Shophandlers] Could not require library for pack", tostring(pack.Name), library)
			end
		end
		copy.Cards = cards
		list[i] = copy
	end

	-- "Variety Pack" = every card in every non-alt pack.
	for _, pack in ipairs(list) do
		if pack.Name == "Variety Pack" and #pack.Cards == 0 then
			local seen = {}
			for _, other in ipairs(list) do
				if other ~= pack and not other.AltPack then
					for _, name in ipairs(other.Cards) do
						if not seen[name] then
							seen[name] = true
							pack.Cards[#pack.Cards + 1] = name
						end
					end
				end
			end
			table.sort(pack.Cards)
		end
	end

	return list
end

function ShopHandlers.Init(Network, PlayerData)
	-- Full pack list. The client hides Hidden packs itself unless the player holds a ticket for them.
	Network.OnInvoke("GetPacksForSale", function()
		if not cachedPacks then
			cachedPacks = buildPacks()
		end
		return cachedPacks
	end)

	-- Odds shown in the pack sidebar tooltip: list of { label, weight }.
	-- PLACEHOLDER / ASSUMED weights.
	Network.OnInvoke("GetOdds", function()
		return {
			{ "Common", 70 },
			{ "Uncommon", 20 },
			{ "Rare", 8 },
			{ "Epic", 1.5 },
			{ "Legendary", 0.5 },
		}
	end)
	-- Foil chance is shown as 1 / this number (10 -> "10%"). PLACEHOLDER / ASSUMED.
	Network.OnInvoke("GetFoilPercent", function()
		return 10
	end)

	-- Robux offers / bundles / prebuilt decks / setups / event shops: nothing for sale yet.
	-- The client loops over these with pairs(), so empty tables are the safe default. PLACEHOLDER.
	Network.OnInvoke("GetCurrentOffers", function()
		return {}
	end)
	Network.OnInvoke("GetCurrentSetups", function()
		return {}
	end)
	Network.OnInvoke("GetCurrentPrebuilts", function()
		return {}
	end)
	Network.OnInvoke("GetCurrentEventItems", function()
		return {}
	end)
	Network.OnInvoke("GetEventShops", function()
		return {}
	end)

	-- Client asks whether an offer should be listed for this player (e.g. not already bought).
	-- A fresh profile owns nothing, so everything is valid. PLACEHOLDER.
	Network.OnInvoke("OfferValid", function()
		return true
	end)

	-- Art Box is region-restricted in the original game; allow it everywhere here.
	Network.OnInvoke("CanUseArtBox", function()
		return true
	end)

	-- Main Nieuw calls this once at startup (quest reset for the day/night cycle); result is ignored.
	-- PLACEHOLDER no-op until quests are implemented.
	Network.OnInvoke("ResetQuest", function() end)

	-- MainOffers.BargainsAd (the "new cards" ad on the shop start page) reads these at load.
	-- NewCards = list of card names to cycle through; Robux / BloxBux = prices shown on its buttons.
	-- PLACEHOLDER: empty card list and zero prices until the rotating shop exists.
	-- Player list / duel menu: empty lists of live battles and bots (client loops over them with pairs()).
	-- PLACEHOLDER until battles and bots are implemented.
	Network.OnInvoke("GetBattles", function()
		return {}
	end)
	Network.OnInvoke("GetBots", function()
		return {}
	end)

	Network.OnInvoke("GetOfferDatas", function()
		return { NewCards = {}, Robux = 0, BloxBux = 0 }
	end)
end

return ShopHandlers