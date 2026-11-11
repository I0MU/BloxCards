



local scriptParent: Instance = script.Parent
local u2 = nil
local u3 = nil
local u4 = nil
local u5 = nil
local u6: boolean = false
local t1: {[any]: any} = {}

local function c(p1)
	table.insert(t1, p1)
end
local function cleanup()
	for key, value in t1 do
		value:Disconnect()
	end
end

local u10 = nil

u10 = scriptParent:BindToMessage("Setup", function(p2, p3, p4)
	u2 = p2
	u3 = p3
	u4 = p4
	u5 = require(p4)
	u6 = true
	u10:Disconnect()
end)

repeat
	task.wait()
until u6

local collectionService: CollectionService = game:GetService("CollectionService")
local runService: RunService = game:GetService("RunService")
local v13 = u5.new()
local dependencies = u4.Dependencies
local debugUi = require(dependencies.DebugUi)
local iris = nil
local config = require(dependencies.Config)
local utilities = require(dependencies.Utilities)
local v19 = runService:IsStudio() or config.ALLOW_LIVE_GAME_DEBUG
local overlayEvent = u4:WaitForChild("OverlayEvent")
local u21: boolean = false

local t2: {[any]: any} = {
	Begin = function(...)
		overlayEvent:Fire("Begin", ...)
	end,
	End = function(...)
		overlayEvent:Fire("End", ...)
	end,
	Text = function(...)
		overlayEvent:Fire("Text", ...)
	end
}

shared.FrameCounter = 0

if v19 then
	iris = require(dependencies.Iris)

	if not iris.HasInit() then
		iris = iris.Init()
	end
end

scriptParent.Name = ("%* - %*"):format(u2.Name, v13.ID)
v13:LoadObject(u2)

for iterFirst, iterSecond in u3 do
	v13:LoadRawCollider(iterSecond[1], iterSecond[2])
end

local t3 = nil

if v19 then
	local v26 = iris.State(false)
	local v27 = iris.State(false)
	local v28 = iris.State(false)
	local v29 = iris.State(false)
	local v30 = iris.State(false)
	local v31 = iris.State(false)
	local v32 = iris.State(false)
	local v33 = iris.State(false)
	local v34 = iris.State(false)
	local v35 = iris.State(false)
	local v36 = iris.State(false)
	local v37 = iris.State(false)
	local v38 = iris.State(false)
	t3 = {
		DRAW_BONE = v26,
		DRAW_PHYSICAL_BONE = v27,
		DRAW_ROOT_PART = v28,
		DRAW_BOUNDING_BOX = v29,
		DRAW_AXIS_LIMITS = v30,
		DRAW_COLLIDERS = v31,
		DRAW_COLLIDER_INFLUENCE = v32,
		DRAW_COLLIDER_AWAKE = v33,
		DRAW_COLLIDER_BROADPHASE = v34,
		DRAW_FILL_COLLIDERS = v35,
		DRAW_CONTACTS = v36,
		DRAW_ROTATION_LIMITS = v37,
		DRAW_ACCELERATION_INFO = v38
	}
end

if v19 then
	iris:Connect(function()
		if u2:GetAttribute("Debug") ~= nil then
			debugUi(iris, v13, t3)
		end
	end)
end

local connection = collectionService:GetInstanceAddedSignal("SmartCollider"):Connect(function(p5)
	if not p5:IsA("BasePart") then
		return
	end

	local colliderKey = p5:GetAttribute("ColliderKey")
	local colliderKey2 = u2:GetAttribute("ColliderKey")
	local text: string = tostring(colliderKey)
	local text2: string = tostring(colliderKey2)

	if text ~= text2 then
		return
	end

	local v52 = utilities.GetCollider(p5)

	v13:LoadRawCollider(v52, p5)
end)

table.insert(t1, connection)

local v40 = scriptParent:BindToMessage("Destroy", function()
	u21 = true
end)

table.insert(t1, v40)
v40 = runService.Heartbeat:ConnectParallel(function(p6)
	local v54 = shared

	v54.FrameCounter = v54.FrameCounter + 1

	if shared.FrameCounter > 131072 then
		shared.FrameCounter = 0
	end

	v13:StepBoneTrees(p6)

	if not v13.ShouldDestroy and not u21 then
		if v19 and u2:GetAttribute("Debug") ~= nil then
			task.synchronize()

			local v55 = t3.DRAW_COLLIDERS:get()
			local v56 = t3.DRAW_CONTACTS:get()
			local v57 = t3.DRAW_PHYSICAL_BONE:get()
			local v58 = t3.DRAW_BONE:get()
			local v59 = t3.DRAW_AXIS_LIMITS:get()
			local v60 = t3.DRAW_ROOT_PART:get()
			local v61 = t3.DRAW_FILL_COLLIDERS:get()
			local v62 = t3.DRAW_COLLIDER_INFLUENCE:get()
			local v63 = t3.DRAW_COLLIDER_AWAKE:get()
			local v64 = t3.DRAW_COLLIDER_BROADPHASE:get()
			local v65 = t3.DRAW_BOUNDING_BOX:get()
			local v66 = t3.DRAW_ROTATION_LIMITS:get()

			v13:DrawDebug(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, t3.DRAW_ACCELERATION_INFO:get())
			v13:DrawOverlay(t2)
		end

		return
	end

	v13:Destroy()
	task.synchronize()

	for key, value in t1 do
		value:Disconnect()
	end

	scriptParent:Destroy()
end)
table.insert(t1, v40)
