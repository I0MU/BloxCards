



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
function module.Draw(p6, p7, p8, p9)
	local ceive = p6.Ceive

	if not ceive.Enabled then
		return
	end

	local v13 = p7.Position
	local n1 = p8 * 0.5
	local n2 = p7.UpVector * n1.Y
	local n3 = p7.RightVector * n1.X
	local n4 = p7.LookVector * n1.Z

	n1 = function(p10, p11, p12)
		local n1 = v13 + (p10 - p11 + p12)
		local n2 = v13 + (p10 + p11 + p12)
		local n3 = v13 + (p10 - p11 - p12)
		local n4 = v13 + (p10 + p11 - p12)

		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)

		if p9 ~= false then
			ceive.Ray:Draw(n2, n3)
		end

		ceive.Ray:Draw(n3, n4)
	end

	local function CalculateZFace(p13, p14, p15)
		local n1 = v13 + (p13 - p14 + p15)
		local n2 = v13 + (p13 + p14 + p15)
		local n3 = v13 + (-p13 - p14 + p15)
		local n4 = v13 + (-p13 + p14 + p15)

		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)

		if p9 ~= false then
			ceive.Ray:Draw(n2, n3)
		end

		ceive.Ray:Draw(n3, n4)
	end
	local function CalculateXFace(p16, p17, p18)
		local n1 = v13 + (p16 - p17 - p18)
		local n2 = v13 + (p16 - p17 + p18)
		local n3 = v13 + (-p16 - p17 - p18)
		local n4 = v13 + (-p16 - p17 + p18)

		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)

		if p9 ~= false then
			ceive.Ray:Draw(n2, n3)
		end

		ceive.Ray:Draw(n3, n4)
	end

	CalculateXFace(n2, n3, n4)
	CalculateXFace(n2, -n3, n4)
	n1(n2, n3, n4)
	n1(-n2, n3, n4)
	CalculateZFace(n2, n3, n4)
	CalculateZFace(n2, n3, -n4)
end
function module.Create(p19, p20, p21, p22)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p20,
		Size = p21,
		DrawTriangles = p22,
		AlwaysOnTop = p19.Propertys.AlwaysOnTop,
		Transparency = p19.Propertys.Transparency,
		Color3 = p19.Propertys.Color3
	}

	p19.Retain(p19, t2)

	return t2
end
function module.Update(p23, p24)
	local ceive = p23.Ceive

	ceive.PushProperty("AlwaysOnTop", p24.AlwaysOnTop)
	ceive.PushProperty("Transparency", p24.Transparency)
	ceive.PushProperty("Color3", p24.Color3)
	p23:Draw(p24.Transform, p24.Size, p24.DrawTriangles)
end

return module
