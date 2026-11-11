



local t1: {[any]: any} = {}

t1.__index = t1
t1.ClassName = "MasterClock"

function t1.new(syncEvent, delayedRequestFunction)
	local t3: {[any]: any} = {}

	setmetatable(t3, t1)
	t3.SyncEvent = syncEvent
	t3.DelayedRequestFunction = delayedRequestFunction

	function t3.DelayedRequestFunction.OnServerInvoke(_, p4)
		return t3:HandleDelayRequest(p4)
	end

	t3.SyncEvent.OnServerEvent:connect(function(p5)
		t3.SyncEvent:FireClient(p5, t3:GetTime())
	end)
	spawn(function()
		while true do
			wait(5)
			t3:Sync()
		end
	end)

	return t3
end
function t1.GetTime(_)
	return workspace.DistributedGameTime
end
function t1.Sync(p7)
	local v16 = p7:GetTime()

	p7.SyncEvent:FireAllClients(v16)
end
function t1.HandleDelayRequest(p8, p9)
	return p8:GetTime() - p9
end
function t1.IsSynced(_)
	return true
end

local t2: {[any]: any} = {}

t2.__index = t2
t2.ClassName = "SlaveClock"

function t2.new(syncEvent, delayedRequestFunction)
	local t4: {[any]: any} = {}

	setmetatable(t4, t2)
	t4.SyncEvent = syncEvent
	t4.DelayedRequestFunction = delayedRequestFunction
	t4.Offset = -1
	t4.SyncEvent.OnClientEvent:connect(function(p13)
		t4:HandleSyncEvent(p13)
	end)
	t4.SyncEvent:FireServer()

	return t4
end
function t2.IsSynced(p14)
	return p14.Offset ~= -1
end
function t2.GetLocalTime(_)
	return workspace.DistributedGameTime
end
function t2.HandleSyncEvent(p16, p17)
	local n1 = p16:GetLocalTime() - p17
	local v28 = p16:GetLocalTime()

	v28 = p16:SendDelayRequest(v28)
	p16.Offset = (n1 - v28) / 2
	p16.OneWayDelay = (n1 + v28) / 2
end
function t2.SendDelayRequest(p18, p19)
	return p18.DelayedRequestFunction:InvokeServer(p19)
end
function t2.GetTime(p20)
	if p20.Offset == -1 then
		warn("[SlaveClock] - Offset is -1, may be unsynced clock!")
	end

	return p20:GetLocalTime() - p20.Offset
end

game:GetService("Players")

local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local nevermoreEngine = require(replicatedStorage:WaitForChild("NevermoreEngine"))
local timeSyncEvent = nevermoreEngine.GetRemoteEvent("TimeSyncEvent")
local v7 = nevermoreEngine.GetRemoteFunction("DelayedRequestEvent")

if runService:IsClient() and runService:IsServer() then
	local v8 = t1.new(timeSyncEvent, v7)

	timeSyncEvent.OnClientEvent:connect(function()
	end)
	print("[TimeSyncManager] - Studio mode enabled. MasterClock constructed.")

	return v8
end

if runService:IsClient() then
	local v9 = t2.new(timeSyncEvent, v7)

	print("[TimeSyncManager] - Client mode enabled. SlaveClock constructed.")

	return v9
end

local v10 = t1.new(timeSyncEvent, v7)

print("[TimeSyncManager] - Server mode enabled. MasterClock constructed.")

return v10
