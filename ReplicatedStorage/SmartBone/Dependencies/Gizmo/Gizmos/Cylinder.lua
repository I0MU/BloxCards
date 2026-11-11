



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

	local n1 = p7.Position + p7.UpVector * (p9 * 0.5)
	local n2 = p7.Position - p7.UpVector * (p9 * 0.5)
	local v16 = CFrame.lookAt(n1, n1 + p7.UpVector)
	local v17 = CFrame.lookAt(n2, n2 - p7.UpVector)
	local v18 = nil
	local v19 = nil
	local v20 = nil
	local v21 = nil

	for i = 0, 360, math.floor(360 / p10) do
		local v23 = math.rad(i)
		local sine = math.sin(v23)
		local v25 = math.rad(i)
		local cosine = math.cos(v25)

		cosine = p7.LookVector * (cosine * p8) + p7.RightVector * (sine * p8)

		local n3 = v16.Position + cosine
		local n4 = v17.Position + cosine

		ceive.Ray:Draw(n3, n4)

		if not v18 then
			v18 = n3
			v19 = n4
			v20 = n3
			v21 = n4
		else
			ceive.Ray:Draw(v18, n3)
			ceive.Ray:Draw(v19, n4)
			v18 = n3
			v19 = n4
		end
	end

	ceive.Ray:Draw(v18, v20)
	ceive.Ray:Draw(v19, v21)
end
function module.Create(p11, p12, p13, p14, p15)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p12,
		Radius = p13,
		Length = p14,
		Subdivisions = p15,
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
	p16:Draw(p17.Transform, p17.Radius, p17.Length, p17.Subdivisions)
end

return module
