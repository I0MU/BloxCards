



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

	local floored = math.floor(p10 / p9)
	local v16 = nil
	local v17 = nil
	local n1: number = 0

	for i = 0, p10, floored do
		local v20 = math.rad(i)
		local sine = math.sin(v20)
		local v22 = math.rad(i)
		local cosine = math.cos(v22)

		cosine = p7.Position + (p7.UpVector * (cosine * p8) + p7.RightVector * (sine * p8))

		if v16 == nil then
			v16 = cosine
			v17 = cosine
		else
			ceive.Ray:Draw(v16, cosine)
			v16 = cosine
		end

		n1 = i
	end

	if n1 ~= p10 then
		local v24 = math.rad(p10)
		local sine2 = math.sin(v24)
		local v26 = math.rad(p10)
		local cosine2 = math.cos(v26)

		ceive.Ray:Draw(v16, p7.Position + (p7.UpVector * (cosine2 * p8) + p7.RightVector * (sine2 * p8)))
	end

	if p11 ~= false then
		ceive.Ray:Draw(v16, v17)
	end

	return v16
end
function module.Create(p12, p13, p14, p15, p16, p17)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p13,
		Radius = p14,
		Subdivisions = p15,
		Angle = p16,
		ConnectToStart = p17,
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
	p18:Draw(p19.Transform, p19.Radius, p19.Subdivisions, p19.Angle, p19.ConnectToStart)
end

return module
