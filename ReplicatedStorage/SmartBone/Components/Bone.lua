



--!native
local dependencies: Instance = script.Parent.Parent:WaitForChild("Dependencies")
local config = require(dependencies:WaitForChild("Config"))
local gizmo = require(dependencies:WaitForChild("Gizmo"))
local utilities = require(dependencies:WaitForChild("Utilities"))

if game:GetService("RunService"):IsStudio() or config.ALLOW_LIVE_GAME_DEBUG then
	gizmo.Init()
end

local constraints: Instance = script.Parent:WaitForChild("Constraints")
local axisConstraint = require(constraints:WaitForChild("AxisConstraint"))
local collisionConstraint = require(constraints:WaitForChild("CollisionConstraint"))
local distanceConstraint = require(constraints:WaitForChild("DistanceConstraint"))
local frictionConstraint = require(constraints:WaitForChild("FrictionConstraint"))
local ropeConstraint = require(constraints:WaitForChild("RopeConstraint"))
local rotationConstraint = require(constraints:WaitForChild("RotationConstraint"))
local springConstraint = require(constraints:WaitForChild("SpringConstraint"))
local utilitiesSb_assert_cb = utilities.SB_ASSERT_CB
local utilitiesSb_verbose_log = utilities.SB_VERBOSE_LOG

local function IsNaN(p1)
	if p1 ~= p1 then
		return true
	end

	return false
end

local t1: {[any]: any} = {}

local function QueryTransformedWorldCFrameNonSmartbone(p2)
	debug.profilebegin("QueryTransformedWorldCFrameNonSmartbone")

	local v25 = t1[p2]

	if v25 and v25.Frame == shared.FrameCounter then
		return v25.CFrame
	end

	v25 = p2.Parent

	local v26

	if v25:IsA("Bone") then
		v26 = QueryTransformedWorldCFrameNonSmartbone(v25)
	else
		v26 = v25.CFrame
	end

	v25 = v26 * p2.TransformedCFrame
	t1[p2] = { Frame = shared.FrameCounter, CFrame = v25 }
	debug.profileend()

	return v25
end
local function QueryTransformedWorldCFrame(p3, p4)
	debug.profilebegin("QueryTransformedWorldCFrame")
	p4.SolvedAnimatedCFrame = true

	local parentIndex = p4.ParentIndex
	local bone = p4.Bone

	if parentIndex < 1 then
		debug.profileend()

		return (QueryTransformedWorldCFrameNonSmartbone(bone))
	end

	local v31 = p3.Bones[parentIndex]

	if not v31.SolvedAnimatedCFrame then
		v31.AnimatedWorldCFrame = QueryTransformedWorldCFrame(p3, v31)
	end

	debug.profileend()

	return v31.AnimatedWorldCFrame * bone.TransformedCFrame
end
local function ClipVector(p5, p6, p7)
	return p5 * (Vector3.new(1, 1, 1) - p7) + p6 * p7
end
local function GetFriction(p8, p9)
	local currentPhysicalProperties = p8.CurrentPhysicalProperties
	local v38 = p9.CurrentPhysicalProperties
	local currentPhysicalPropertiesFrictionWeight = currentPhysicalProperties.FrictionWeight
	local frictionWeight = v38.FrictionWeight

	return (currentPhysicalProperties.Friction * currentPhysicalPropertiesFrictionWeight + v38.Friction * frictionWeight) / (currentPhysicalPropertiesFrictionWeight + frictionWeight)
end
local function SolveWind(p10, p11)
	local settings = p11.Settings
	local settingsWindType = settings.WindType

	if settingsWindType == "Sine" or settingsWindType == "Noise" or settingsWindType == "Hybrid" then
		local windOffset = p11.WindOffset
		local v46 = os.clock()
		local n1 = windOffset + (v46 - p10.HeirarchyLength * 0.2 + (p10.TransformOffset.Position - p11.Root.WorldPosition).Magnitude * 0.2) * settings.WindInfluence
		local v48 = nil

		local function GetNoise(p12, p13, p14, p15)
			local v194 = math.noise(p12, p13, p14)

			v194 = math.clamp(v194, -1, 1)

			if p15 then
				v194 ^= 2
			end

			return v194
		end
		local function SampleGust()
			return math.sin(n1 * 1) * 0.3 + 0.7
		end
		local function SampleSin()
			local n5 = settings.WindStrength ^ 0.8
			local n2 = settings.WindSpeed * 2
			local n3 = math.sin(n1 * n5) ^ 2
			local n4 = math.cos(n1 * n5) ^ 2

			return settings.WindDirection * ((n3 + (n4 - n3) * n4) * n2)
		end

		v46 = function(p16, p17)
			local v201 = p16 or 0
			local n1 = settings.WindStrength ^ 0.8
			local n2 = settings.WindSpeed * 2
			local windOffset = p11.WindOffset
			local v205 = math.noise(n1, 0, windOffset)

			v205 = math.clamp(v205, -1, 1)

			if p17 then
				v205 ^= 2
			end

			local v206 = math.noise(0, n1, windOffset)

			v206 = math.clamp(v206, -1, 1)

			if p17 then
				v206 ^= 2
			end

			local v207 = math.noise(windOffset, 0, n1)

			v207 = math.clamp(v207, -1, 1)

			if p17 then
				v207 ^= 2
			end

			local settingsWindDirection = settings.WindDirection
			local vector3 = Vector3.new(v205 * (n2 + v201), v206 * (n2 + v201), v207 * (n2 + v201))

			return settingsWindDirection * vector3
		end

		if settings.WindType == "Sine" then
			local n2 = settings.WindStrength ^ 0.8
			local n3 = settings.WindSpeed * 2
			local n4 = math.sin(n1 * n2) ^ 2
			local n5 = math.cos(n1 * n2) ^ 2
			local n6 = settings.WindDirection * ((n4 + (n5 - n4) * n5) * n3)
			local sine = math.sin(n1 * 1)

			v48 = n6 * (sine * 0.3 + 0.7)
		elseif settings.WindType == "Noise" then
			local v58 = v46(0, true)
			local sine = math.sin(n1 * 1)

			v48 = v58 * (sine * 0.3 + 0.7)
		elseif settings.WindType == "Hybrid" then
			local n7 = settings.WindStrength ^ 0.8
			local n8 = settings.WindSpeed * 2
			local n9 = math.sin(n1 * n7) ^ 2
			local n10 = math.cos(n1 * n7) ^ 2
			local n11 = settings.WindDirection * ((n9 + (n10 - n9) * n10) * n8)
			local sine = math.sin(n1 * 1)

			n7 = v46(0.5, true)

			local sine2 = math.sin(n1 * 1)

			v48 = (n11 * (sine * 0.3 + 0.7) + n7 * (sine2 * 0.3 + 0.7)) * 0.5
		end

		local v67 = math.max(p10.FreeLength, 0.01)
		local n12 = settings.WindInfluence * (settings.WindStrength * 0.01)
		local v69 = math.clamp(p10.HeirarchyLength, 1, 10)

		return v48 / v67 * (n12 * (v69 * 0.1)) * p10.Weight
	end

	return Vector3.new(0, 0, 0)
end

local module: {[any]: any} = {}

module.__index = module

function module.new(p18, p19, rootPart)
	local v73 = p18.Parent:IsA("Bone")
	local v74 = p18.TransformedWorldCFrame:ToObjectSpace(v73 and p18.Parent.TransformedWorldCFrame or rootPart.CFrame):Inverse()
	local v75 = p18.TransformedCFrame:ToObjectSpace(p19.TransformedCFrame):Inverse()
	local object = setmetatable({
		Bone = p18,
		FreeLength = -1,
		Weight = 0.7,
		ParentIndex = -1,
		HeirarchyLength = 0,
		Transform = v74,
		LocalTransform = v75,
		RootPart = rootPart,
		RootBone = p19,
		Radius = 0,
		Friction = 0,
		RotationLimit = 0,
		Force = nil,
		Gravity = nil,
		SolvedAnimatedCFrame = false,
		HasChild = false,
		AnimatedWorldCFrame = p18.TransformedWorldCFrame,
		StartingCFrame = p18.TransformedCFrame,
		TransformOffset = CFrame.identity,
		LocalTransformOffset = CFrame.identity,
		RestPosition = Vector3.new(0, 0, 0),
		CalculatedWorldCFrame = p18.TransformedWorldCFrame,
		Position = p18.TransformedWorldCFrame.Position,
		LastPosition = p18.TransformedWorldCFrame.Position,
		WeldPosition = Vector3.new(0, 0, 0),
		ActiveWeld = false,
		RigidWeld = false,
		Anchored = false,
		AxisLocked = { false, false, false },
		XAxisLimits = NumberRange.new(-math.huge, math.huge),
		YAxisLimits = NumberRange.new(-math.huge, math.huge),
		ZAxisLimits = NumberRange.new(-math.huge, math.huge),
		FirstSkipUpdate = false,
		CollisionHits = {},
		CollisionsData = {}
	}, module)

	object.AttributeConnection = p18.AttributeChanged:Connect(function(_)
		for iterFirst, iterSecond in utilities.GatherBoneSettings(p18), nil, nil do
			object[iterFirst] = iterSecond ~= "¬" and iterSecond or nil
		end
	end)

	return object
end
function module.ClipVelocity(p22, p23, p24)
	p22.LastPosition = p22.LastPosition * (Vector3.new(1, 1, 1) - p24) + p23 * p24
end
function module.PreUpdate(p25, p26)
	debug.profilebegin("Bone::PreUpdate")

	local v82 = p26.Bones[1]
	local v83 = p26.Bones[p25.ParentIndex]

	p25.AnimatedWorldCFrame = QueryTransformedWorldCFrame(p26, p25)

	local smartWeld = p25.Bone:FindFirstChild("SmartWeld")

	p25.ActiveWeld = false

	if smartWeld and smartWeld:IsA("ObjectValue") then
		local smartWeldValue = smartWeld.Value
		local u86: boolean = true

		if smartWeld:GetAttribute("Rigid") ~= true then
			u86 = false
		end

		p25.RigidWeld = u86

		if smartWeldValue then
			if smartWeldValue:IsA("Attachment") then
				p25.WeldPosition = smartWeldValue.WorldPosition
				p25.ActiveWeld = true
			elseif smartWeldValue:IsA("BasePart") then
				p25.WeldPosition = smartWeldValue.Position
				p25.ActiveWeld = true
			end
		end
	end

	if p25.ParentIndex < 1 then
		p25.Anchored = true
	end

	if p25.Bone == p25.RootBone then
		local v87

		if p25.Bone.Parent:IsA("Bone") then
			v87 = QueryTransformedWorldCFrameNonSmartbone(p25.Bone.Parent)
		else
			v87 = p25.RootPart.CFrame
		end

		p25.TransformOffset = v87 * p25.Transform
	else
		p25.TransformOffset = v83.AnimatedWorldCFrame * p25.Transform
	end

	p25.LocalTransformOffset = v82.Bone.CFrame * p25.LocalTransform
	debug.profileend()
end
function module.StepPhysics(p27, p28, p29, p30)
	debug.profilebegin("Bone::StepPhysics")

	if p27.Anchored then
		p27.LastPosition = p27.AnimatedWorldCFrame.Position
		p27.Position = p27.AnimatedWorldCFrame.Position
		debug.profileend()

		return
	end

	if p27.Force or p27.Gravity then
		p29 = ((p27.Gravity or p28.Settings.Gravity) + (p27.Force or p28.Settings.Force)) * p30
	end

	local settings = p28.Settings
	local n1 = p27.Position - p27.LastPosition
	local n2 = p28.ObjectAcceleration * settings.Inertia
	local v95 = SolveWind(p27, p28)

	p27.LastPosition = p27.Position
	p27.Position = p27.Position + (n1 * (1 - settings.Damping) + p29 + n2 + v95)
	debug.profileend()
end
function module.Constrain(p31, p32, p33, p34)
	debug.profilebegin("Bone::Constrain")

	if p31.Anchored then
		debug.profileend()

		return
	end

	local cFrame = p31.RootPart.CFrame
	local v101 = frictionConstraint(p31, p31.Position, p31.LastPosition)

	if #p33 ~= 0 then
		v101 = collisionConstraint(p31, v101, p33)
	end

	local v102 = if p32.Settings.Constraint == "Spring" then springConstraint(p31, v101, nil, p32, p34) else if p32.Settings.Constraint == "Distance" then distanceConstraint(p31, v101, p32) else if p32.Settings.Constraint == "Rope" then ropeConstraint(p31, v101, p32) else p31.AnimatedWorldCFrame.Position
	local v103 = axisConstraint(p31, v102, p31.LastPosition, cFrame)

	v102 = rotationConstraint(p31, v103, p32)

	if p31.ActiveWeld then
		if p31.RigidWeld then
			v102 = distanceConstraint(p31, p31.WeldPosition, p32)
		else
			v102 = springConstraint(p31, v102, p31.WeldPosition, p32, p34)
		end
	end

	p31.Friction = 0

	for iterFirst, iterSecond in p31.CollisionHits, nil, nil do
		local currentPhysicalProperties = p31.RootPart.CurrentPhysicalProperties
		local v107 = iterSecond.CurrentPhysicalProperties
		local currentPhysicalPropertiesFrictionWeight = currentPhysicalProperties.FrictionWeight
		local frictionWeight = v107.FrictionWeight

		p31.Friction = math.max((currentPhysicalProperties.Friction * currentPhysicalPropertiesFrictionWeight + v107.Friction * frictionWeight) / (currentPhysicalPropertiesFrictionWeight + frictionWeight), p31.Friction)
	end

	p31.Position = v102
	debug.profileend()
end
function module.SkipUpdate(p35)
	if p35.FirstSkipUpdate == false and config.RESET_TRANSFORM_ON_SKIP then
		utilitiesSb_verbose_log("Skipping bone, resetting transform.")
		p35.CalculatedWorldCFrame = p35.AnimatedWorldCFrame
		p35.FirstSkipUpdate = true
	end

	p35.Position = p35.Bone.WorldPosition
	p35.LastPosition = p35.Position
end
function module.SolveTransform(p36, p37, p38)
	debug.profilebegin("Bone::SolveTransform")

	if p36.ParentIndex < 1 then
		debug.profileend()

		return
	end

	p36.FirstSkipUpdate = false

	local v114 = p37.Bones[p36.ParentIndex]
	local bone = v114.Bone

	if v114 and bone then
		local transformOffset = v114.TransformOffset
		local n1 = utilities.GetRotationBetween(transformOffset.UpVector, p36.Position - v114.Position).Rotation * transformOffset.Rotation
		local v118 = math.min(1 - 0.00001 ^ p38, 1)

		if v114.ActiveWeld and v114.RigidWeld then
			v114.CalculatedWorldCFrame = CFrame.new(v114.Position) * n1
		else
			local boneWorldCFrame = bone.WorldCFrame
			local cFrame = CFrame.new(v114.Position)

			v114.CalculatedWorldCFrame = boneWorldCFrame:Lerp(cFrame * n1, v118)
		end

		local CalculatedWorldCFramePosition = v114.CalculatedWorldCFrame.Position

		utilitiesSb_assert_cb(CalculatedWorldCFramePosition == CalculatedWorldCFramePosition, warn, "If you see this report this as a bug, (NaN Calc world cframe)")
	end

	debug.profileend()
end
function module.ApplyTransform(p39, p40)
	debug.profilebegin("Bone::ApplyTransform")
	p39.SolvedAnimatedCFrame = false

	if p39.ParentIndex < 1 then
		debug.profileend()

		return
	end

	local v124 = p40.Bones[p39.ParentIndex]
	local bone = v124.Bone

	if v124 and bone then
		if v124.Anchored and p40.Settings.AnchorsRotate == false then
			bone.WorldCFrame = v124.TransformOffset
		else
			if v124.Anchored and p40.Settings.AnchorsRotate == true then
				bone.WorldCFrame = v124.TransformOffset * v124.CalculatedWorldCFrame.Rotation
				debug.profileend()

				return
			end

			if v124.Anchored then
				bone.WorldCFrame = v124.TransformOffset
				debug.profileend()

				return
			end

			bone.WorldCFrame = v124.CalculatedWorldCFrame
		end

		debug.profileend()

		return
	end

	debug.profileend()
end
function module.DrawDebug(p41, p42, p43, p44, p45, p46, p47)
	debug.profilebegin("Bone::DrawDebug")

	local color3 = Color3.fromRGB(255, 0, 0)
	local color32 = Color3.fromRGB(255, 94, 0)
	local color33 = Color3.fromRGB(234, 1, 255)
	local color34 = Color3.fromRGB(0, 255, 255)
	local color35 = Color3.fromRGB(255, 0, 0)
	local color36 = Color3.fromRGB(0, 255, 0)
	local color37 = Color3.fromRGB(0, 0, 255)
	local color38 = Color3.fromRGB(0, 183, 255)
	local color39 = Color3.fromRGB(255, 0, 0)
	local color310 = Color3.fromRGB(0, 255, 0)
	local color311 = Color3.fromRGB(0, 0, 255)
	local color312 = Color3.fromRGB(28, 41, 224)
	local color313 = Color3.fromRGB(255, 27, 27)
	local n1: number = 1
	local animatedWorldCFrame = p41.AnimatedWorldCFrame
	local animatedWorldCFramePosition = animatedWorldCFrame.Position
	local cFrame = CFrame.new(p41.Position)
	local cFrame2 = CFrame.new(p41.LastPosition)

	if p45 then
		gizmo.PushProperty("AlwaysOnTop", false)
		gizmo.PushProperty("Color3", color3)
		gizmo.Sphere:Draw(cFrame, p41.Radius, 10, 360)
		gizmo.PushProperty("Color3", color32)
		gizmo.Sphere:Draw(cFrame2, p41.Radius, 10, 360)
		gizmo.PushProperty("Color3", color33)
		gizmo.Ray:Draw(p41.Position, p41.LastPosition)
	end

	if p46 and not p41.Anchored then
		local v151 = p41.AxisLocked[1]
		local v152 = p41.AxisLocked[2]
		local v153 = p41.AxisLocked[3]
		local rootPart = p41.RootPart
		local v155 = rootPart.CFrame:PointToObjectSpace(animatedWorldCFramePosition)
		local rightVector = rootPart.CFrame.RightVector
		local upVector = rootPart.CFrame.UpVector
		local lookVector = rootPart.CFrame.LookVector

		if not v151 then
			gizmo.PushProperty("Color3", color39)
			gizmo.Arrow:Draw(animatedWorldCFramePosition - rightVector * 2, animatedWorldCFramePosition + rightVector * 2, 0.05, 0.15, 9)

			local n2 = p41.XAxisLimits.Max - v155.X

			gizmo.Plane:Draw(animatedWorldCFramePosition + rightVector * (p41.XAxisLimits.Min - v155.X), rightVector, Vector3.new(5, 5, 0))
			gizmo.Plane:Draw(animatedWorldCFramePosition + rightVector * n2, rightVector, Vector3.new(5, 5, 0))
		end

		if not v152 then
			gizmo.PushProperty("Color3", color310)
			gizmo.Arrow:Draw(animatedWorldCFramePosition - upVector * 2, animatedWorldCFramePosition + upVector * 2, 0.05, 0.15, 9)

			local n3 = p41.YAxisLimits.Max - v155.Y

			gizmo.Plane:Draw(animatedWorldCFramePosition + upVector * (p41.YAxisLimits.Min - v155.Y), upVector, Vector3.new(5, 5, 0))
			gizmo.Plane:Draw(animatedWorldCFramePosition + upVector * n3, upVector, Vector3.new(5, 5, 0))
		end

		if not v153 then
			gizmo.PushProperty("Color3", color311)
			gizmo.Arrow:Draw(animatedWorldCFramePosition - lookVector * 2, animatedWorldCFramePosition + lookVector * 2, 0.05, 0.15, 9)

			local n4 = p41.ZAxisLimits.Max - v155.Z

			gizmo.Plane:Draw(animatedWorldCFramePosition - lookVector * (p41.ZAxisLimits.Min - v155.Z), lookVector, Vector3.new(5, 5, 0))
			gizmo.Plane:Draw(animatedWorldCFramePosition - lookVector * n4, lookVector, Vector3.new(5, 5, 0))
		end
	end

	if p44 then
		gizmo.PushProperty("Color3", color34)
		gizmo.Sphere:Draw(animatedWorldCFrame, 0.08, 5, 360)
		gizmo.PushProperty("Color3", color35)
		gizmo.VolumeArrow:Draw(animatedWorldCFramePosition, animatedWorldCFramePosition + animatedWorldCFrame.LookVector * 0.25, 0.005, 0.015, 0.05, true)
		gizmo.PushProperty("Color3", color36)
		gizmo.VolumeArrow:Draw(animatedWorldCFramePosition, animatedWorldCFramePosition + animatedWorldCFrame.UpVector * 0.25, 0.005, 0.015, 0.05, true)
		gizmo.PushProperty("Color3", color37)
		gizmo.VolumeArrow:Draw(animatedWorldCFramePosition, animatedWorldCFramePosition + animatedWorldCFrame.RightVector * 0.25, 0.005, 0.015, 0.05, true)
	end

	if p43 and not p41.Anchored then
		for iterFirst, iterSecond in p41.CollisionsData, nil, nil do
			gizmo.PushProperty("Color3", color312)

			local gizmoSphere = gizmo.Sphere
			local cFrame3 = CFrame.new(iterSecond.ClosestPoint)

			gizmoSphere:Draw(cFrame3, 0.08, 5, 360)
			gizmo.PushProperty("Color3", color313)
			gizmo.Arrow:Draw(iterSecond.ClosestPoint, iterSecond.ClosestPoint + iterSecond.Normal * 0.5, 0.05, 0.15, 9)
		end
	end

	if p47 and p41.RotationLimit < 180 and p41.RotationLimit > 0 and p41.ParentIndex > 0 and p41.HasChild then
		local n5: number = 1
		local n6

		if p41.RotationLimit < 89.5 then
			local v168 = math.rad(p41.RotationLimit)
			local v169 = math.tan(v168)

			n6 = n1 * v169
		elseif p41.RotationLimit > 90 then
			n5 = -1

			local v170 = math.rad(180 - p41.RotationLimit)
			local v171 = math.tan(v170)

			n6 = n1 * v171
		else
			n1 = 0
			n6 = 5
		end

		local v172 = math.min(n6, 5)

		if v172 == 5 then
			n1 = 0
		end

		local n7 = (p41.Position - p42.Bones[p41.ParentIndex].Position).Unit * n5
		local v174 = CFrame.lookAt(animatedWorldCFramePosition + n7 * (n1 / 2), animatedWorldCFramePosition + -n7 * 500, animatedWorldCFrame.LookVector)

		gizmo.PushProperty("Color3", color38)
		gizmo.Cone:Draw(v174, v172, n1, 8 + v172 * 2)
	end

	debug.profileend()
end
function module.DrawOverlay(p48, p49)
	local text = p49.Text
	local v178 = ("Bone: %*"):format(p48.Bone.Name)

	text(v178)

	if config.DEBUG_OVERLAY_BONE_INFO or config.DEBUG_OVERLAY_BONE_NUMERICS then
		local v179 = p49.Text
		local v180 = ("Free Length: %*"):format(p48.FreeLength)

		v179(v180)
		v179 = p49.Text
		v180 = ("Weight: %*"):format(p48.Weight)
		v179(v180)
		v179 = p49.Text
		v180 = ("Parent Index: %*"):format(p48.ParentIndex)
		v179(v180)
		v179 = p49.Text
		v180 = ("Heirarchy Length: %*"):format(p48.HeirarchyLength)
		v179(v180)
		v179 = p49.Text
		v180 = ("Radius: %*"):format(p48.Radius)
		v179(v180)
		v179 = p49.Text
		v180 = ("Friction: %*"):format(p48.Friction)
		v179(v180)
		v179 = p49.Text
		v180 = ("Rotation Limit: %*"):format(p48.RotationLimit)
		v179(v180)
	end

	if config.DEBUG_OVERLAY_BONE_INFO or config.DEBUG_OVERLAY_BONE_CONSTRAIN then
		local v181 = p49.Text
		local v182 = ("Anchored: %*"):format(p48.Anchored)

		v181(v182)
		v181 = p49.Text
		v182 = ("Axis Locked: %*, %*, %*"):format(p48.AxisLocked[1], p48.AxisLocked[2], p48.AxisLocked[3])
		v181(v182)
		v181 = p49.Text
		v182 = ("X Axis Limit: %*"):format(p48.XAxisLimits)
		v181(v182)
		v181 = p49.Text
		v182 = ("Y Axis Limit: %*"):format(p48.YAxisLimits)
		v181(v182)
		v181 = p49.Text
		v182 = ("Z Axis Limit: %*"):format(p48.ZAxisLimits)
		v181(v182)
	end

	if config.DEBUG_OVERLAY_BONE_INFO or config.DEBUG_OVERLAY_BONE_WELD then
		local v183 = p49.Text
		local v184 = ("Active Weld: %*"):format(p48.ActiveWeld)

		v183(v184)
		v183 = p49.Text
		v184 = ("Rigid Weld: %*"):format(p48.RigidWeld)
		v183(v184)
		v183 = p49.Text
		v184 = ("Weld Position: %*"):format((string.format("%.3f, %.3f, %.3f", p48.WeldPosition.X, p48.WeldPosition.Y, p48.WeldPosition.Z)))
		v183(v184)
	end

	if config.DEBUG_OVERLAY_BONE_INFO or config.DEBUG_OVERLAY_BONE_FORCES then
		local v185 = p48.Force and string.format("%.3f, %.3f, %.3f", p48.Force.X, p48.Force.Y, p48.Force.Z) or "-, -, -"
		local v186 = p48.Gravity and string.format("%.3f, %.3f, %.3f", p48.Gravity.X, p48.Gravity.Y, p48.Gravity.Z) or "-, -, -"
		local v187 = p49.Text
		local v188 = ("Force: %*"):format(v185)

		v187(v188)
		v187 = p49.Text
		v188 = ("Gravity: %*"):format(v186)
		v187(v188)
	end
end
function module.Destroy(p50)
	if config.RESET_BONE_ON_DESTROY then
		task.synchronize()
		p50.Bone.CFrame = p50.StartingCFrame
	end

	p50.AttributeConnection:Disconnect()
	setmetatable(p50, nil)
end

return module
