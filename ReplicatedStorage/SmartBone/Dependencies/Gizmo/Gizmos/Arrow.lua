



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
function module.Draw(p6, p7, p8, p9, p10, p11)
	local ceive = p6.Ceive

	if not ceive.Enabled then
		return
	end

	ceive.Ray:Draw(p7, p8)

	local v15 = CFrame.lookAt(p8 + (p7 - p8).Unit * (p10 * 0.5), p8)

	ceive.Cone:Draw(v15, p9, p10, p11)
end
function module.Create(p12, p13, p14, p15, p16, p17)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Origin = p13,
		End = p14,
		Radius = p15,
		Length = p16,
		Subdivisions = p17,
		AlwaysOnTop = p12.Propertys.AlwaysOnTop,
		Transparency = p12.Propertys.Transparency,
		Color3 = p12.Propertys.Color3
	}

	p12.Retain(p12, t2)

	return t2
end
function module.Update(p18, p19)
	local ceive = p18.Ceive

	ceive.PushProperty("AlwaysOnTop", p19.AlwaysOnTop)
	ceive.PushProperty("Transparency", p19.Transparency)
	ceive.PushProperty("Color3", p19.Color3)
	p18:Draw(p19.Origin, p19.End, p19.Radius, p19.Length, p19.Subdivisions)
end

return module
