--[[ ServerScriptService/Handlers/DataHandlers  (ModuleScript)
Player data loading + the small "info" calls the client makes right at startup.
]]
local ServerScriptService = game:GetService("ServerScriptService")
local Config = require(ServerScriptService:WaitForChild("Modules"):WaitForChild("Config"))

local DataHandlers = {}

function DataHandlers.Init(Network, PlayerData)
	-- The client calls this constantly (every deck load etc.), so it must be cheap and always current.
	Network.OnInvoke("LoadData", function(player)
		PlayerData.Wait(player)
		return PlayerData.ToClientArray(player)
	end)

	-- Data.lua feeds this into ApplyRankTable / Stats.ApplyRanks.
	-- PLACEHOLDER: single "balanced" category with one rank until the real rank system is defined.
	Network.OnInvoke("GetAllRanks", function(player)
		local d = PlayerData.Wait(player)
		if not d then
			return nil
		end
		return {
			level = d.level,
			rank = "Newbie",
			ranks = { balanced = { "Newbie" } },
			pp = {},
			fornext = { balanced = 0 },
		}
	end)
	Network.OnInvoke("GetSpecialRanks", function()
		return {}
	end)

	-- Client signals it noticed the level go up. Rewards are not implemented yet.
	Network.OnFire("LevelUp", function() end)
	Network.OnInvoke("CheckForLevelUp", function() end)

	Network.OnInvoke("GetServerType", function()
		if game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0 then
			return "VIPServer"
		end
		return "StandardServer"
	end)

	Network.OnInvoke("GetProducts", function()
		return {} -- PLACEHOLDER: Robux products list (shop phase)
	end)

	-- Quest menu data. The client reads [1] stats flags, [2] quests, [3] daily/weekly state, [6] login-reward
	-- progress, [7] starter-quest flags and [8] weekly-mod info. Everything except [1] is a safe empty default
	-- (quests/login rewards are not persisted yet), but the SHAPE matches what the client indexes, so the
	-- quest module no longer crashes on load.
	local FIRST_TICK, DAILY_TICK, WEEKLY_TICK = 1672916400, 28800, 604800
	local function serverDate()
		return tonumber(os.date("!%Y%m%d"))
	end
	Network.OnInvoke("GetServerDate", serverDate)

	local loginState = {}
	Network.OnInvoke("GetQuestInfo", function(player)
		local d = PlayerData.Wait(player)
		if not d then
			return nil
		end
		local now = os.time()
		local ok, rewards = pcall(function()
			return require(game:GetService("ReplicatedStorage"):WaitForChild("LoginRewards", 5))
		end)
		local login = {}
		if ok and type(rewards) == "table" then
			loginState[player] = loginState[player] or {}
			for name in pairs(rewards) do
				loginState[player][name] = loginState[player][name] or { 0, 0 } -- { last claim date, days claimed }
				login[name] = loginState[player][name]
			end
		end
		local daily = {
			Completed = 0,
			Redeemed = {},
			Dailys = {},
			LastLoginDay = math.floor((now - FIRST_TICK) / DAILY_TICK),
			LastLoginWeek = math.floor((now - FIRST_TICK) / WEEKLY_TICK),
		}
		return { PlayerData.DeepCopy(d.questStats), {}, daily, {}, {}, login, {}, {} }
	end)
	game:GetService("Players").PlayerRemoving:Connect(function(p)
		loginState[p] = nil
	end)

	-- Tutorial "first time seen" flags
	local firstTimeKeys = {
		DeckBuilder = "FirstTimeViewedDeckBuilder",
		Shop = "FirstTimeViewedShop",
		Quests = "FirstTimeViewedQuests",
	}
	Network.OnFire("FirstTimeViewProgress", function(player, which)
		local d = PlayerData.Get(player)
		local key = firstTimeKeys[which]
		if d and key then
			d.questStats[key] = 1
			PlayerData.MarkDirty(player)
		end
	end)

	-- Lookups by player name (used by pre/after-battle screens and the player list)
	local function lookup(name, fn)
		local p = PlayerData.FindByName(name)
		local d = p and PlayerData.Get(p)
		if d then
			return fn(d)
		end
		return nil
	end
	Network.OnInvoke("GetPlayerWinLoss", function(_, name)
		return lookup(name, function(d)
			return { d.wins, d.losses }
		end) or { 0, 0 }
	end)
	Network.OnInvoke("GetPlayerLevelFromName", function(_, name)
		return lookup(name, function(d)
			return d.level
		end) or 1
	end)
	Network.OnInvoke("GetPlayerExperienceFromName", function(_, name)
		return lookup(name, function(d)
			return d.xp
		end) or 0
	end)
	Network.OnInvoke("GetPlayerRankFromName", function(_, name)
		return lookup(name, function()
			return "Newbie"
		end)
	end)
	-- Factions. factionScore = { faction name, score, season id }; only counts as joined for the current season.
	local function currentFaction(d)
		local fs = d.factionScore
		if type(fs) == "table" and fs[3] == Config.FACTION_SEASON_ID and fs[1] ~= "" then
			return fs[1]
		end
		return nil
	end
	Network.OnInvoke("GetPlayerFactionFromName", function(_, name)
		return lookup(name, currentFaction)
	end)
	Network.OnInvoke("GetFactionSeasonID", function()
		return Config.FACTION_SEASON_ID
	end)
	Network.OnInvoke("JoinFaction", function(player, faction)
		local d = PlayerData.Get(player)
		if not d or type(faction) ~= "string" or not Config.FACTIONS[faction] then
			return false
		end
		if currentFaction(d) then
			return false -- already joined this season
		end
		d.factionScore = { faction, 0, Config.FACTION_SEASON_ID }
		d.questStats.JoinedDWFaction = 1
		PlayerData.MarkDirty(player)
		Network.Send(player, "SetFactionScore", PlayerData.DeepCopy(d.factionScore))
		return true
	end)

	-- Party.lua pings this once its UI is built. Parties aren't implemented server-side yet, so just accept it.
	Network.OnFire("PartyLoaded", function() end)

	-- Deck builder open/close pings; nothing to do server-side yet.
	Network.OnFire("EnterInventory", function() end)
	Network.OnFire("LeaveInventory", function() end)
end

return DataHandlers