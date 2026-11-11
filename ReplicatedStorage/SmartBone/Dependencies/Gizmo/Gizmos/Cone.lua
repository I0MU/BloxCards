



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

	local v14 = CFrame.Angles(-1.5707963267948966, 0, 0)
	local n1 = p7 * v14

	v14 = n1.Position + n1.UpVector * (p9 * 0.5)

	local n2 = n1.Position + -n1.UpVector * (p9 * 0.5)
	local v17 = CFrame.lookAt(v14, v14 + n1.UpVector)
	local v18 = CFrame.lookAt(n2, n2 - n1.UpVector)
	local v19 = nil
	local v20 = nil

	for i = 0, 360, math.floor(360 / p10) do
		local v22 = math.rad(i)
		local sine = math.sin(v22)
		local v24 = math.rad(i)
		local cosine = math.cos(v24)
		local n3 = v18.Position + (n1.LookVector * (cosine * p8) + n1.RightVector * (sine * p8))

		if not v19 then
			v19 = n3
			v20 = n3
			ceive.Ray:Draw(n3, v17.Position)
		else
			ceive.Ray:Draw(n3, v17.Position)
			ceive.Ray:Draw(v19, n3)
			v19 = n3
		end
	end

	ceive.Ray:Draw(v19, v20)
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
