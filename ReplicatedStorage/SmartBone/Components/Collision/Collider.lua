



local httpService: HttpService = game:GetService("HttpService")
local dependencies: Instance = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local colliders: Instance = script.Parent:WaitForChild("Colliders")
local box = require(colliders:WaitForChild("Box"))
local capsule = require(colliders:WaitForChild("Capsule"))
local cylinder = require(colliders:WaitForChild("Cylinder"))
local sphere = require(colliders:WaitForChild("Sphere"))
local parentDependencies: Instance = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local config = require(parentDependencies:WaitForChild("Config"))
local v10: Instance = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local sb_verbose_log = require(v10:WaitForChild("Utilities")).SB_VERBOSE_LOG
local gizmo = require(dependencies:WaitForChild("Gizmo"))

if game:GetService("RunService"):IsStudio() or config.ALLOW_LIVE_GAME_DEBUG or config.ALLOW_LIVE_GAME_DEBUG then
	gizmo.Init()
end

local module: {[any]: any} = {}

module.__index = module

function module.new()
	local cFrameIdentity = CFrame.identity
	local guid: string = httpService:GenerateGUID(false)

	return (setmetatable({
		Type = "Box",
		Scale = Vector3.new(0, 0, 0),
		Offset = Vector3.new(0, 0, 0),
		Rotation = Vector3.new(0, 0, 0),
		Radius = 0,
		PreviousScale = Vector3.new(0, 0, 0),
		PreviousOffset = Vector3.new(0, 0, 0),
		PreviousRotation = Vector3.new(0, 0, 0),
		PreviousObjectPosition = Vector3.new(0, 0, 0),
		PreviousObjectRotation = Vector3.new(0, 0, 0),
		m_Object = nil,
		InNarrowphase = false,
		Size = Vector3.new(0, 0, 0),
		Transform = cFrameIdentity,
		GUID = guid
	}, module))
end
function module.SetObject(p1, p2)
	p1.m_Object = p2
	p1:UpdateTransform()
end
function module.UpdateTransform(p3)
	debug.profilebegin("Update Transform")

	local m_Object = p3.m_Object
	local m_ObjectCFrame = m_Object.CFrame
	local m_ObjectSize = m_Object.Size
	local rotation = p3.Rotation
	local n1 = m_ObjectSize * p3.Offset
	local n2 = m_ObjectSize * p3.Scale
	local v25 = CFrame.Angles(rotation.X * 0.017453, rotation.Y * 0.017453, rotation.Z * 0.017453)
	local cFrame = CFrame.new(n1)

	p3.Transform = m_ObjectCFrame * cFrame * v25
	p3.Size = n2

	local v27 = math.max(n2.X, n2.Y, n2.Z)

	p3.Radius = math.sqrt((v27 * 0.5) ^ 2 * 2)
	debug.profileend()
end
function module.GetClosestPoint(p4, p5, p6)
	if p4.m_Object == nil then
		return
	end

	p4.InNarrowphase = false

	if (p5 - p4.Transform.Position).Magnitude - p6 > p4.Radius then
		return
	end

	debug.profilebegin("Narrowphase")
	p4.InNarrowphase = true

	local v31 = p4.Type
	local v32 = nil
	local v33 = nil
	local v34 = nil

	if v31 == "Box" then
		local v35, v36, v37 = box(p4.Transform, p4.Size, p5, p6)

		v32 = v35
		v33 = v36
		v34 = v37
	end

	if v31 == "Capsule" then
		local v38, v39, v40 = capsule(p4.Transform, p4.Size, p5, p6)

		v32 = v38
		v33 = v39
		v34 = v40
	end

	if v31 == "Sphere" then
		local v41, v42, v43 = sphere(p4.Transform, p4.Size, p5, p6)

		v32 = v41
		v33 = v42
		v34 = v43
	end

	if v31 == "Cylinder" then
		local v44, v45, v46 = cylinder(p4.Transform, p4.Size, p5, p6)

		v32 = v44
		v33 = v45
		v34 = v46
	end

	debug.profileend()

	return v32, v33, v34
end
function module.Step(p7)
	debug.profilebegin("Collider::Step")
	p7:UpdateTransform()
	debug.profileend()
end
function module.DrawDebug(p8, p9, p10, p11, p12, p13)
	local color3 = Color3.new(0.509803, 0.933333, 0.42745)
	local color32 = Color3.new(0.90196, 0.784313, 0.513725)
	local v56 = p8.Type
	local transform = p8.Transform
	local v58 = p8.Size

	if not p9.m_Awake and p12 then
		color3 = Color3.new(1, 0, 1)
	end

	if p8.InNarrowphase == false and p13 then
		color32 = Color3.new(0, 1, 1)
	end

	if p11 then
		gizmo.SetStyle(Color3.new(1, 0.3, 0.3), 0, false)
		gizmo.Sphere:Draw(transform, p8.Radius, 25, 360)
	end

	if v56 == "Box" then
		gizmo.SetStyle(color3, 0, false)
		gizmo.Box:Draw(transform, v58)

		if p10 then
			gizmo.SetStyle(color32, 0.75, false)
			gizmo.VolumeBox:Draw(transform, v58)
			gizmo.PushProperty("Transparency", 0)
		end
	elseif v56 == "Capsule" then
		local n1 = math.min(v58.Y, v58.Z) * 0.5
		local x = v58.X
		local v61 = CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
		local n2 = transform * v61

		gizmo.SetStyle(color3, 0, false)
		gizmo.Capsule:Draw(n2, n1, x, 15)

		if p10 then
			local n3 = n2.Position + n2.UpVector * (x * 0.5)
			local n4 = n2.Position - n2.UpVector * (x * 0.5)

			gizmo.SetStyle(color32, 0.75, false)
			gizmo.VolumeCylinder:Draw(transform, n1, x)

			local gizmoVolumeSphere = gizmo.VolumeSphere
			local cFrame = CFrame.new(n3)

			gizmoVolumeSphere:Draw(cFrame, n1)

			local volumeSphere = gizmo.VolumeSphere
			local cFrame2 = CFrame.new(n4)

			volumeSphere:Draw(cFrame2, n1)
			gizmo.PushProperty("Transparency", 0)
		end
	elseif v56 == "Sphere" then
		local n5 = math.min(v58.X, v58.Y, v58.Z) * 0.5

		gizmo.SetStyle(color3, 0, false)
		gizmo.Sphere:Draw(transform, n5, 15, 360)

		if p10 then
			gizmo.SetStyle(color32, 0.75, false)
			gizmo.VolumeSphere:Draw(transform, n5)
			gizmo.PushProperty("Transparency", 0)
		end
	elseif v56 == "Cylinder" then
		local n6 = math.min(v58.Y, v58.Z) * 0.5

		gizmo.SetStyle(color3, 0, false)

		local gizmoCylinder = gizmo.Cylinder
		local v72 = CFrame.Angles(0, 0, 1.5707963267948966)

		gizmoCylinder:Draw(transform * v72, n6, v58.X, 15)

		if p10 then
			gizmo.SetStyle(color32, 0.75, false)

			local gizmoVolumeCylinder = gizmo.VolumeCylinder
			local v74 = CFrame.Angles(0, -1.5707963267948966, 0)

			gizmoVolumeCylinder:Draw(transform * v74, n6, v58.X, 0, 360)
			gizmo.PushProperty("Transparency", 0)
		end

		return
	end
end
function module.Destroy(p14)
	local v76 = ("Collider destroying, object: %*"):format(p14.m_Object)

	sb_verbose_log(v76)
	setmetatable(p14, nil)
end

return module
