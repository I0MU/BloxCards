



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
function module.Draw(p7, cFrame, radius)
	local ceive = p7.Ceive

	if not ceive.Enabled then
		return
	end

	local sphereHandleAdornment = p7.Request("SphereHandleAdornment")

	sphereHandleAdornment.Color3 = p7.Propertys.Color3
	sphereHandleAdornment.Transparency = p7.Propertys.Transparency
	sphereHandleAdornment.CFrame = cFrame
	sphereHandleAdornment.Radius = radius
	sphereHandleAdornment.AlwaysOnTop = p7.Propertys.AlwaysOnTop
	sphereHandleAdornment.ZIndex = 1
	sphereHandleAdornment.Adornee = workspaceTerrain
	sphereHandleAdornment.Parent = workspaceTerrain
	ceive.ActiveInstances = ceive.ActiveInstances + 1
	p7.Register(sphereHandleAdornment)
end
function module.Create(p10, p11, p12)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p11,
		Radius = p12,
		AlwaysOnTop = p10.Propertys.AlwaysOnTop,
		Transparency = p10.Propertys.Transparency,
		Color3 = p10.Propertys.Color3
	}

	p10.Retain(p10, t2)

	return t2
end
function module.Update(p13, p14)
	local ceive = p13.Ceive

	ceive.PushProperty("AlwaysOnTop", p14.AlwaysOnTop)
	ceive.PushProperty("Transparency", p14.Transparency)
	ceive.PushProperty("Color3", p14.Color3)
	p13:Draw(p14.Transform, p14.Radius)
end

return module
