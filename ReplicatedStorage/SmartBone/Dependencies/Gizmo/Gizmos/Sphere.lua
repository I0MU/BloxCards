



local module: {[any]: any} = {}

module.__index = module

function module.Init(ceive, propertys, request, release, retain)
	local object = setmetatable({}, module)

	object.Ceive = ceive
	object.Propertys = propertys
	object.Request = request
	object.Release = release
	object.Retain = retain

	return object
end
function module.Draw(p6, p7, p8, p9, p10)
	local ceive = p6.Ceive

	if not ceive.Enabled then
		return
	end

	ceive.Circle:Draw(p7, p8, p9, p10)

	local ceiveCircle = ceive.Circle
	local v15 = CFrame.Angles(0, 1.5707963267948966, 0)

	ceiveCircle:Draw(p7 * v15, p8, p9, p10)

	local circle = ceive.Circle

	v15 = CFrame.Angles(1.5707963267948966, 0, 0)
	circle:Draw(p7 * v15, p8, p9, p10)
end
function module.Create(p11, p12, p13, p14, p15)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p12,
		Radius = p13,
		Subdivisions = p14,
		Angle = p15,
		AlwaysOnTop = p11.Propertys.AlwaysOnTop,
		Transparency = p11.Propertys.Transparency,
		Color3 = p11.Propertys.Color3
	}

	p11.Retain(p11, t2)

	return t2
end
function module.Update(p16, p17)
	local ceive = p16.Ceive

	ceive.PushProperty("AlwaysOnTop", p17.AlwaysOnTop)
	ceive.PushProperty("Transparency", p17.Transparency)
	ceive.PushProperty("Color3", p17.Color3)
	p16:Draw(p17.Transform, p17.Radius, p17.Subdivisions, p17.Angle)
end

return module
