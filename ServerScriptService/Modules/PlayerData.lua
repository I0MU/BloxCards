--[[ ServerScriptService/Modules/PlayerData  (ModuleScript)
Loads/saves each player's profile (DataStore, retries, session lock, autosave) and
converts it into the numbered array the client's Data module expects.

Profile fields (server side, named)      -> client array slot
  money 1 | sleeve 2 | storage 3 | wins 4 | losses 5 | sleeves 6 | (7 unused) | luck 8
  rankTable 9 | redeemedCodes 10 | deckNames 11 | newCards 12 | settings 13 | packTickets 14
  runData 15 | questStats 16 | tournamentDeck 17 | tournamentSideboard 18 | levelUpData 19
  eventCurrency 20 | factionScore 21 | eventPurchases 22 | antiFarm 23 | (backup 24)
  ownedPacks 25 | backgrounds 26 | background 27 | purchases 31 | boostTimers 32

storage[cardName] = { ["0"] = copies owned, ["<slot>"] = copies in that deck slot }
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")

local Config = require(script.Parent.Config)
local Network = require(script.Parent.Network)
local DeckUtil = require(script.Parent.DeckUtil)

local PlayerData = {}

-- GetDataStore throws in a place that isn't published (e.g. a local .rbxl in Studio).
-- Don't let that kill the module: leave store nil and let load/save handle it.
local store
do
	local okStore, storeOrErr = pcall(function()
		return DataStoreService:GetDataStore(Config.DATASTORE_NAME)
	end)
	if okStore then
		store = storeOrErr
	else
		warn("[PlayerData] DataStore unavailable: " .. tostring(storeOrErr))
	end
end
local profiles = {} -- [Player] = { data = table, loaded = bool, noSave = bool, dirty = bool }
local LOCK_TIMEOUT = 300 -- seconds before another server's lock is considered dead

-- FASTER LOAD: Wait() used to poll every 0.1s, so every client call that arrived before the profile finished loading (LoadData and now ~10 other
-- startup calls fired together) could answer up to 0.1s late. Callers now sleep and are woken the instant the profile is ready (or the player leaves).
local waiters = {} -- [Player] = { resume functions }

local function wake(player)
	local list = waiters[player]
	if list then
		waiters[player] = nil
		for _, resume in ipairs(list) do
			resume()
		end
	end
end

local function deepCopy(t)
	if type(t) ~= "table" then
		return t
	end
	local out = {}
	for k, v in pairs(t) do
		out[k] = deepCopy(v)
	end
	return out
end

local function template()
	return {
		money = Config.DEFAULT_MONEY,
		sleeve = Config.DEFAULT_SLEEVE,
		storage = {},
		wins = 0,
		losses = 0,
		sleeves = { Config.DEFAULT_SLEEVE },
		luck = { 0, 0 },
		rankTable = { "balanced", 1, {} },
		redeemedCodes = {},
		deckNames = { ["1"] = "Deck 1" },
		currentDeckSlot = 1,
		newCards = {},
		settings = deepCopy(Config.DEFAULT_SETTINGS),
		packTickets = {}, -- [packName] = tickets owned (the client indexes it by pack name)
		runData = {},
		questStats = { FirstTimeViewedDeckBuilder = 0, FirstTimeViewedShop = 0, FirstTimeViewedQuests = 0, GotStarterDeck = 0 },
		tournamentDeck = {},
		tournamentSideboard = {},
		levelUpData = {},
		eventCurrency = 0,
		factionScore = { "", 0, 0 }, -- { faction name, score, season id }; the client indexes it like this
		eventPurchases = {},
		antiFarm = 0,
		ownedPacks = {},
		backgrounds = { Config.DEFAULT_BACKGROUND },
		background = Config.DEFAULT_BACKGROUND,
		purchases = {},
		boostTimers = {},
		level = 1,
		xp = 0,
		chosenStarter = false,
	}
end

-- Fill in any fields missing from saved data (so new fields can be added later safely).
-- Only settings/questStats are merged key-by-key; other tables (decks, storage...) are left alone.
local function reconcile(data, tmpl)
	for k, v in pairs(tmpl) do
		if data[k] == nil then
			data[k] = deepCopy(v)
		end
	end
	-- packTickets used to default to the number 0; the client needs a { [packName] = count } table.
	if type(data.packTickets) ~= "table" then
		data.packTickets = {}
	end
	-- factionScore used to default to the number 0; the client needs { faction name, score, season id }.
	if type(data.factionScore) ~= "table" then
		data.factionScore = { "", 0, 0 }
	end
	for _, field in ipairs({ "settings", "questStats" }) do
		for k, v in pairs(tmpl[field]) do
			if data[field][k] == nil then
				data[field][k] = v
			end
		end
	end
end

---------------------------------------------------------------------- DataStore

local function keyFor(player)
	return "Player_" .. player.UserId
end

local function loadAsync(player)
	if not store then
		return false
	end
	local key = keyFor(player)
	for attempt = 1, 8 do
		local locked = false
		local ok, result = pcall(function()
			return store:UpdateAsync(key, function(old)
				if old and old.lock and old.lock.jobId ~= game.JobId and os.time() - old.lock.time < LOCK_TIMEOUT then
					locked = true
					return nil -- cancel: another server owns this player
				end
				locked = false
				old = old or {}
				old.lock = { jobId = game.JobId, time = os.time() }
				return old
			end)
		end)
		if ok and not locked then
			return true, result and result.data
		end
		if not ok then
			warn(("[PlayerData] Load attempt %d failed for %s: %s"):format(attempt, player.Name, tostring(result)))
			if RunService:IsStudio() then
				return false -- don't spend ~90s retrying in Studio; onPlayerAdded falls back to a temporary profile
			end
		end
		task.wait(locked and 6 or math.min(2 ^ attempt, 15))
		if not player.Parent then
			return false
		end
	end
	return false
end

local function saveAsync(player, release)
	local profile = profiles[player]
	if not profile or not profile.loaded or profile.noSave or not store then
		return true
	end
	local key = keyFor(player)
	for attempt = 1, 5 do
		local ok, err = pcall(function()
			store:UpdateAsync(key, function(old)
				old = old or {}
				if old.lock and old.lock.jobId ~= game.JobId and os.time() - old.lock.time < LOCK_TIMEOUT then
					return nil -- lock was taken by another server; don't overwrite
				end
				old.data = profile.data
				old.lock = (not release) and { jobId = game.JobId, time = os.time() } or nil
				return old
			end)
		end)
		if ok then
			profile.dirty = false
			return true
		end
		warn(("[PlayerData] Save attempt %d failed for %s: %s"):format(attempt, player.Name, tostring(err)))
		task.wait(attempt * 2)
	end
	return false
end

----------------------------------------------------------------------- Lifecycle

local function onPlayerAdded(player)
	if profiles[player] then
		return
	end
	local profile = { data = nil, loaded = false, noSave = false, dirty = false }
	profiles[player] = profile

	local ok, saved = loadAsync(player)
	if not player.Parent then
		profiles[player] = nil
		wake(player)
		return
	end

	if not ok then
		if RunService:IsStudio() then
			warn("[PlayerData] Could not reach DataStore in Studio; using a temporary profile (NOT saved). Enable 'API Services' in Game Settings > Security.")
			profile.noSave = true
		else
			profiles[player] = nil
			wake(player)
			player:Kick("Your data could not be loaded. Please rejoin in a moment.")
			return
		end
	end

	local data = saved or {}
	reconcile(data, template())
	if Config.UNLOCK_ALL_CARDS then
		DeckUtil.UnlockAll(data)
	end
	profile.data = data
	profile.loaded = true
	wake(player)
end

local function onPlayerRemoving(player)
	local profile = profiles[player]
	if profile and profile.loaded then
		saveAsync(player, true)
	end
	profiles[player] = nil
	wake(player)
end

function PlayerData.Start()
	Players.PlayerAdded:Connect(function(p)
		task.spawn(onPlayerAdded, p)
	end)
	Players.PlayerRemoving:Connect(onPlayerRemoving)
	for _, p in ipairs(Players:GetPlayers()) do
		task.spawn(onPlayerAdded, p)
	end

	task.spawn(function()
		while true do
			task.wait(Config.AUTOSAVE_INTERVAL)
			for player in pairs(profiles) do
				task.spawn(saveAsync, player, false)
			end
		end
	end)

	game:BindToClose(function()
		if RunService:IsStudio() then
			task.wait(1)
		end
		local pending = 0
		for player in pairs(profiles) do
			pending += 1
			task.spawn(function()
				saveAsync(player, true)
				pending -= 1
			end)
		end
		local t = os.clock()
		while pending > 0 and os.clock() - t < 25 do
			task.wait(0.1)
		end
	end)
end

-------------------------------------------------------------------------- API

-- Yields until the player's data is loaded (or they leave / timeout). Returns the data table or nil.
function PlayerData.Wait(player, timeout)
	local deadline = os.clock() + (timeout or 60)
	while true do
		local profile = profiles[player]
		if profile and profile.loaded then
			return profile.data
		end
		if not player.Parent or os.clock() >= deadline then
			return nil
		end

		-- sleep until wake() (load finished / player left), with a safety re-check every 5s in case a wake was ever missed
		local thread = coroutine.running()
		local resumed = false
		local function resume()
			if not resumed then
				resumed = true
				task.spawn(thread)
			end
		end
		local list = waiters[player]
		if not list then
			list = {}
			waiters[player] = list
		end
		list[#list + 1] = resume
		task.delay(math.min(deadline - os.clock(), 5), resume)
		coroutine.yield()
	end
end

-- Non-yielding: returns the data table if already loaded.
function PlayerData.Get(player)
	local profile = profiles[player]
	return profile and profile.loaded and profile.data or nil
end

function PlayerData.MarkDirty(player)
	local profile = profiles[player]
	if profile then
		profile.dirty = true
	end
end

function PlayerData.Save(player)
	return saveAsync(player, false)
end

function PlayerData.FindByName(name)
	if type(name) ~= "string" then
		return nil
	end
	local p = Players:FindFirstChild(name)
	if p and p:IsA("Player") then
		return p
	end
	return nil
end

-- Builds the numbered array the client's Data module reads.
function PlayerData.ToClientArray(player)
	local d = PlayerData.Get(player)
	if not d then
		return nil
	end
	return {
		d.money, -- 1
		d.sleeve, -- 2
		deepCopy(d.storage), -- 3
		d.wins, -- 4
		d.losses, -- 5
		deepCopy(d.sleeves), -- 6
		false, -- 7 (unused by the client code I've seen)
		deepCopy(d.luck), -- 8
		deepCopy(d.rankTable), -- 9
		deepCopy(d.redeemedCodes), -- 10
		deepCopy(d.deckNames), -- 11
		deepCopy(d.newCards), -- 12
		deepCopy(d.settings), -- 13
		deepCopy(d.packTickets), -- 14
		deepCopy(d.runData), -- 15
		deepCopy(d.questStats), -- 16
		deepCopy(d.tournamentDeck), -- 17
		deepCopy(d.tournamentSideboard), -- 18
		deepCopy(d.levelUpData), -- 19
		d.eventCurrency, -- 20
		d.factionScore, -- 21
		deepCopy(d.eventPurchases), -- 22
		d.antiFarm, -- 23
		{}, -- 24 (BackupData, client-side only)
		deepCopy(d.ownedPacks), -- 25
		deepCopy(d.backgrounds), -- 26
		d.background, -- 27
		false, -- 28
		false, -- 29
		false, -- 30
		deepCopy(d.purchases), -- 31
		deepCopy(d.boostTimers), -- 32
	}
end

-- Push the full array to the client (client handler: "SetData").
function PlayerData.PushAll(player)
	local arr = PlayerData.ToClientArray(player)
	if arr then
		Network.Send(player, "SetData", arr)
	end
end

function PlayerData.SetMoney(player, amount)
	local d = PlayerData.Get(player)
	if not d then
		return
	end
	d.money = math.max(0, math.floor(amount))
	PlayerData.MarkDirty(player)
	Network.Send(player, "MoneyUpdate", d.money)
end

function PlayerData.AddMoney(player, delta)
	local d = PlayerData.Get(player)
	if d then
		PlayerData.SetMoney(player, d.money + delta)
	end
end

PlayerData.DeepCopy = deepCopy

return PlayerData