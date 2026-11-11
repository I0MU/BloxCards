



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
function module.Draw(p7, cFrame, radius, height)
	local ceive = p7.Ceive

	if not ceive.Enabled then
		return
	end

	local coneHandleAdornment = p7.Request("ConeHandleAdornment")

	coneHandleAdornment.Color3 = p7.Propertys.Color3
	coneHandleAdornment.Transparency = p7.Propertys.Transparency
	coneHandleAdornment.CFrame = cFrame
	coneHandleAdornment.AlwaysOnTop = p7.Propertys.AlwaysOnTop
	coneHandleAdornment.ZIndex = 1
	coneHandleAdornment.Height = height
	coneHandleAdornment.Radius = radius
	coneHandleAdornment.Adornee = workspaceTerrain
	coneHandleAdornment.Parent = workspaceTerrain
	ceive.ActiveInstances = ceive.ActiveInstances + 1
	p7.Register(coneHandleAdornment)
end
function module.Create(p11, p12, p13, p14)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p12,
		Radius = p13,
		Length = p14,
		AlwaysOnTop = p11.Propertys.AlwaysOnTop,
		Transparency = p11.Propertys.Transparency,
		Color3 = p11.Propertys.Color3
	}

	p11.Retain(p11, t2)

	return t2
end
function module.Update(p15, p16)
	local ceive = p15.Ceive

	ceive.PushProperty("AlwaysOnTop", p16.AlwaysOnTop)
	ceive.PushProperty("Transparency", p16.Transparency)
	ceive.PushProperty("Color3", p16.Color3)
	p15:Draw(p16.Transform, p16.Radius, p16.Length)
end

return module
