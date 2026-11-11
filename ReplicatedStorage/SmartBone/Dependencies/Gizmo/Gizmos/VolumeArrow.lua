



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
function module.Draw(p7, p8, p9, p10, p11, p12, p13)
	local ceive = p7.Ceive

	if not ceive.Enabled then
		return
	end

	local v17 = CFrame.lookAt(p9 - (p9 - p8).Unit * (p12 * 0.5), p9)

	if p13 == true then
		local v18 = v17.Position
		local magnitude = (v18 - p8).Magnitude
		local v20 = CFrame.lookAt((p8 + v18) * 0.5, p9)

		ceive.VolumeCylinder:Draw(v20, p10, magnitude)
	else
		ceive.Ray:Draw(p8, p9)
	end

	ceive.VolumeCone:Draw(v17, p11, p12)
end
function module.Create(p14, p15, p16, p17, p18, p19, p20)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Origin = p15,
		End = p16,
		CylinderRadius = p17,
		ConeRadius = p18,
		Length = p19,
		UseCylinder = p20,
		AlwaysOnTop = p14.Propertys.AlwaysOnTop,
		Transparency = p14.Propertys.Transparency,
		Color3 = p14.Propertys.Color3
	}

	p14.Retain(p14, t2)

	return t2
end
function module.Update(p21, p22)
	local ceive = p21.Ceive

	ceive.PushProperty("AlwaysOnTop", p22.AlwaysOnTop)
	ceive.PushProperty("Transparency", p22.Transparency)
	ceive.PushProperty("Color3", p22.Color3)
	p21:Draw(p22.Origin, p22.End, p22.Radius, p22.Length, p22.UseCylinder)
end

return module
