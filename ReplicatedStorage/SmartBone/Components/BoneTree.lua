



--!native
local random = Random.new(1029410295159813)
local lighting: Lighting = game:GetService("Lighting")
local dependencies: Instance = script.Parent.Parent:WaitForChild("Dependencies")

require(script.Parent:WaitForChild("Bone"))

local config = require(dependencies:WaitForChild("Config"))
local defaultObjectSettings = require(dependencies:WaitForChild("DefaultObjectSettings"))
local gizmo = require(dependencies:WaitForChild("Gizmo"))
local utilities = require(dependencies:WaitForChild("Utilities"))

if game:GetService("RunService"):IsStudio() or config.ALLOW_LIVE_GAME_DEBUG then
	gizmo.Init()
end

local utilitiesSb_verbose_log = utilities.SB_VERBOSE_LOG

local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function map(p2, p3, p4, p5, p6, p7)
	local n1 = (p2 - p3) / (p4 - p3) * (p6 - p5) + p5

	if not p7 then
		return n1
	end

	if p5 < p6 then
		return p5 < (p6 > n1 and n1 or p6) and (p6 > n1 and n1 or p6) or p5
	end

	return p6 < (p5 > n1 and n1 or p5) and (p5 > n1 and n1 or p5) or p6
end

local module: {[any]: any} = {}

module.__index = module

function module.new(p8, rootPart)
	local object = setmetatable({
		UpdateRate = 0,
		InView = true,
		AccumulatedDelta = 0,
		Destroyed = false,
		FirstSkipUpdate = false,
		Force = Vector3.new(0, 0, 0),
		ObjectMove = Vector3.new(0, 0, 0),
		ObjectVelocity = Vector3.new(0, 0, 0),
		ObjectAcceleration = Vector3.new(0, 0, 0),
		WindOffset = random:NextNumber(0, 1000000),
		Root = p8:IsA("Bone") and p8 or nil,
		RootPart = rootPart,
		RootPartSize = rootPart.Size,
		Bones = {},
		Settings = {},
		BoundingBoxCFrame = rootPart.CFrame,
		BoundingBoxSize = rootPart.Size,
		ObjectPreviousPosition = rootPart.Position
	}, module)

	object.DestroyConnection = rootPart.AncestryChanged:Connect(function()
		if not rootPart:IsDescendantOf(game) then
			object.Destroyed = true
		end
	end)
	object.AttributeConnection = rootPart.AttributeChanged:Connect(function(p10)
		object.Settings[p10] = rootPart:GetAttribute(p10) or defaultObjectSettings[p10]
	end)

	return object
end
function module.UpdateBoundingBox(p11)
	debug.profilebegin("BoneTree::UpdateBoundingBox")

	if not p11.InView then
		p11.BoundingBoxCFrame = p11.RootPart.CFrame
		p11.BoundingBoxSize = p11.RootPart.Size
		debug.profileend()

		return
	end

	local vectorValue = Vector3.new(inf, inf, inf)
	local vectorValue2 = Vector3.new(-inf, -inf, -inf)

	debug.profilebegin("Max Min Bones")

	for iterFirst, iterSecond in p11.Bones, nil, nil do
		debug.profilebegin("Max Min Bone")

		local v28 = iterSecond.Position

		vectorValue = vectorValue:Min(v28)
		vectorValue2 = vectorValue2:Max(v28)
		debug.profileend()
	end

	debug.profileend()
	p11.BoundingBoxCFrame = CFrame.new((vectorValue + vectorValue2) / 2)
	p11.BoundingBoxSize = p11.RootPartSize:Max(vectorValue2 - vectorValue)
	debug.profileend()
end
function module.UpdateThrottling(p12, p13)
	debug.profilebegin("BoneTree::UpdateThrottling")

	local settings = p12.Settings
	local magnitude = (p13 - workspace.CurrentCamera.CFrame.Position).Magnitude

	if magnitude > settings.ActivationDistance then
		p12.UpdateRate = 0
		debug.profileend()

		return
	end

	local settingsThrottleDistance = settings.ThrottleDistance
	local n1 = (magnitude - settingsThrottleDistance) / (settings.ActivationDistance - settingsThrottleDistance) * 1 + 0

	p12.UpdateRate = settings.UpdateRate * (1 - (if (n1 < 1 and n1 or 1) > 0 then n1 < 1 and n1 or 1 else 0))
	debug.profileend()
end
function module.PreUpdate(p14, p15)
	debug.profilebegin("BoneTree::PreUpdate")

	local objectPreviousPosition = p14.RootPart.CFrame.Position
	local objectVelocity = p14.ObjectVelocity

	p14.ObjectMove = objectPreviousPosition - p14.ObjectPreviousPosition

	local v39 = p14.ObjectVelocity
	local n1 = p14.ObjectMove / p15 / 4
	local v41 = math.min(p15 * 10, 1)

	p14.ObjectVelocity = v39:Lerp(n1, v41)
	p14.ObjectAcceleration = (objectVelocity - p14.ObjectVelocity) * p15
	p14.ObjectPreviousPosition = objectPreviousPosition
	p14.RootPartSize = p14.RootPart.Size
	p14:UpdateThrottling(objectPreviousPosition)
	p14:UpdateBoundingBox()

	for iterFirst, iterSecond in p14.Bones, nil, nil do
		iterSecond:PreUpdate(p14)
	end

	debug.profileend()
end
function module.StepPhysics(p16, p17)
	debug.profilebegin("BoneTree::StepPhysics")

	local settings = p16.Settings
	local n1 = (settings.Gravity + settings.Force) * p17

	if settings.MatchWorkspaceWind == true then
		local workspaceGlobalWind: Vector3 = workspace.GlobalWind

		settings.WindDirection = if workspaceGlobalWind.Magnitude == 0 then Vector3.new(0, 0, 0) else workspaceGlobalWind.Unit
		settings.WindSpeed = workspaceGlobalWind.Magnitude
	else
		local v49 = lighting:GetAttribute("WindDirection") or defaultObjectSettings.WindDirection
		local windSpeed = lighting:GetAttribute("WindSpeed") or defaultObjectSettings.WindSpeed

		settings.WindDirection = if v49.Magnitude == 0 then Vector3.new(0, 0, 0) else v49.Unit
		settings.WindSpeed = windSpeed
	end

	settings.WindStrength = lighting:GetAttribute("WindStrength") or defaultObjectSettings.WindStrength

	for iterFirst, iterSecond in p16.Bones, nil, nil do
		iterSecond:StepPhysics(p16, n1, p17)
	end

	debug.profileend()
end
function module.Constrain(p18, p19, p20)
	debug.profilebegin("BoneTree::Constrain")

	for iterFirst, iterSecond in p18.Bones, nil, nil do
		iterSecond:Constrain(p18, p19, p20)
	end

	debug.profileend()
end
function module.SkipUpdate(p21)
	debug.profilebegin("BoneTree::SkipUpdate")

	for iterFirst, iterSecond in p21.Bones, nil, nil do
		iterSecond:SkipUpdate()
	end

	p21.FirstSkipUpdate = true
	debug.profileend()
end
function module.SolveTransform(p22, p23)
	debug.profilebegin("BoneTree::SolveTransform")

	for iterFirst, iterSecond in p22.Bones, nil, nil do
		iterSecond:SolveTransform(p22, p23)
	end

	p22.FirstSkipUpdate = false
	debug.profileend()
end
function module.ApplyTransform(p24)
	debug.profilebegin("BoneTree::ApplyTransform")

	for iterFirst, iterSecond in p24.Bones, nil, nil do
		iterSecond:ApplyTransform(p24)
	end

	debug.profileend()
end
function module.DrawDebug(p25, p26, p27, p28, p29, p30, p31, p32, p33)
	debug.profilebegin("BoneTree::DrawDebug")

	local color3 = Color3.fromRGB(248, 168, 20)
	local color32 = Color3.fromRGB(76, 208, 223)
	local color33 = Color3.fromRGB(255, 89, 89)

	if p33 then
		local RootPartPosition = p25.RootPart.Position
		local vector3 = Vector3.new(0, p25.RootPart.Size.Y / 2 + 1, 0)
		local n1 = RootPartPosition + vector3

		gizmo.SetStyle(Color3.new(1, 0, 0), 0, true)
		gizmo.Arrow:Draw(n1, n1 + p25.ObjectMove, 0.025, 0.1, 6)
		gizmo.SetStyle(Color3.new(0, 1, 0), 0, true)
		gizmo.Arrow:Draw(n1, n1 + p25.ObjectVelocity, 0.025, 0.1, 6)
		gizmo.SetStyle(Color3.new(0, 0, 1), 0, true)
		gizmo.Arrow:Draw(n1, n1 + p25.ObjectAcceleration, 0.025, 0.1, 6)
	end

	gizmo.PushProperty("AlwaysOnTop", false)

	if p31 then
		gizmo.PushProperty("Color3", color32)
		gizmo.Box:Draw(p25.BoundingBoxCFrame, p25.BoundingBoxSize, true)
	end

	if p30 then
		gizmo.PushProperty("Color3", color32)
		gizmo.Box:Draw(p25.RootPart.CFrame, p25.RootPart.Size, true)
		gizmo.SetStyle(color33, 0.75, false)
		gizmo.VolumeBox:Draw(p25.RootPart.CFrame, p25.RootPart.Size)
		gizmo.PushProperty("Transparency", 0)
	end

	for iterFirst, iterSecond in p25.Bones, nil, nil do
		local TransformedWorldCFramePosition = iterSecond.Bone.TransformedWorldCFrame.Position
		local v86 = p25.Bones[iterSecond.ParentIndex]

		iterSecond:DrawDebug(p25, p26, p27, p28, p29, p32)

		if p27 and iterFirst ~= 1 then
			gizmo.PushProperty("Color3", color3)
			gizmo.Ray:Draw(v86.Bone.TransformedWorldCFrame.Position, TransformedWorldCFramePosition)
		end
	end

	debug.profileend()
end
function module.DrawOverlay(p34, p35)
	if config.DEBUG_OVERLAY_TREE_INFO or config.DEBUG_OVERLAY_TREE_OBJECTS then
		local v89 = p35.Text
		local v90 = ("Root Part: %*"):format(p34.RootPart.Name)

		v89(v90)
		v89 = p35.Text
		v90 = ("Root Bone: %*"):format(p34.Root.Name)
		v89(v90)
		v89 = p35.Text
		v90 = ("Root Part Size: %*"):format((string.format("%.3f, %.3f, %.3f", p34.RootPart.Size.X, p34.RootPart.Size.Y, p34.RootPart.Size.Z)))
		v89(v90)
	end

	if config.DEBUG_OVERLAY_TREE_INFO or config.DEBUG_OVERLAY_TREE_NUMERICS then
		local v91 = p35.Text
		local v92 = ("Update Rate: %*"):format((string.format("%.3f", p34.UpdateRate)))

		v91(v92)
		v91 = p35.Text
		v92 = ("In View: %*"):format(p34.InView)
		v91(v92)
		v91 = p35.Text
		v92 = ("Accumulated Delta: %*"):format((string.format("%.3f", p34.AccumulatedDelta)))
		v91(v92)
		v91 = p35.Text
		v92 = ("Force: %*"):format((string.format("%.3f, %.3f, %.3f", p34.Force.X, p34.Force.Y, p34.Force.Z)))
		v91(v92)
	end

	if config.DEBUG_OVERLAY_BONE then
		for iterFirst, iterSecond in p34.Bones, nil, nil do
			if config.DEBUG_OVERLAY_MAX_BONES > 0 and iterFirst >= config.DEBUG_OVERLAY_BONE_OFFSET + config.DEBUG_OVERLAY_MAX_BONES then
				break
			end

			if not (iterFirst < config.DEBUG_OVERLAY_BONE_OFFSET) then
				local begin = p35.Begin
				local v96 = ("Bone %*"):format(iterFirst)

				begin(v96, Color3.new(0.486275, 0.431373, 1), (Color3.new(1, 1, 1)))
				iterSecond:DrawOverlay(p35)
				p35.End()
			end
		end
	end
end
function module.Destroy(p36)
	utilitiesSb_verbose_log("Destroy BoneTree")
	task.synchronize()
	p36.DestroyConnection:Disconnect()
	p36.AttributeConnection:Disconnect()

	for iterFirst, iterSecond in p36.Bones, nil, nil do
		iterSecond:Destroy()
	end

	setmetatable(p36, nil)
	task.desynchronize()
end

return module
