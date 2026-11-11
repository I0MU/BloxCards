



local workspaceTerrain: Terrain = workspace.Terrain
local module: {[any]: any} = {}

module.__index = module

function module.Init(ceive, propertys, request, release, retain, register)
	local object = setmetatable({}, module)

	object.Ceive = ceive
	object.Propertys = propertys
	object.Request = request
	object.Release = release
	object.Retain = retain
	object.Register = register

	return object
end
function module.Draw(p7, cFrame, radius, height, p11, p12)
	local ceive = p7.Ceive

	if not ceive.Enabled then
		return
	end

	local cylinderHandleAdornment = p7.Request("CylinderHandleAdornment")

	cylinderHandleAdornment.Color3 = p7.Propertys.Color3
	cylinderHandleAdornment.Transparency = p7.Propertys.Transparency
	cylinderHandleAdornment.CFrame = cFrame
	cylinderHandleAdornment.Height = height
	cylinderHandleAdornment.Radius = radius
	cylinderHandleAdornment.InnerRadius = p11 or 0
	cylinderHandleAdornment.Angle = p12 or 360
	cylinderHandleAdornment.AlwaysOnTop = p7.Propertys.AlwaysOnTop
	cylinderHandleAdornment.ZIndex = 1
	cylinderHandleAdornment.Adornee = workspaceTerrain
	cylinderHandleAdornment.Parent = workspaceTerrain
	ceive.ActiveInstances = ceive.ActiveInstances + 1
	p7.Register(cylinderHandleAdornment)
end
function module.Create(p13, p14, p15, p16, p17, p18)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p14,
		Radius = p15,
		Length = p16,
		InnerRadius = p17 or 0,
		Angle = p18 or 360,
		AlwaysOnTop = p13.Propertys.AlwaysOnTop,
		Transparency = p13.Propertys.Transparency,
		Color3 = p13.Propertys.Color3
	}

	p13.Retain(p13, t2)

	return t2
end
function module.Update(p19, p20)
	local ceive = p19.Ceive

	ceive.PushProperty("AlwaysOnTop", p20.AlwaysOnTop)
	ceive.PushProperty("Transparency", p20.Transparency)
	ceive.PushProperty("Color3", p20.Color3)
	p19:Draw(p20.Transform, p20.Radius, p20.Length, p20.InnerRadius, p20.Angle)
end

return module
