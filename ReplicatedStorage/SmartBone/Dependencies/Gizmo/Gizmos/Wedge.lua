



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
	local u18 = nil
	local u19 = nil
	local u20 = nil
	local u21 = nil;

	(function(p10, p11, p12)
		local n1 = v13 + (p10 - p11 + p12)
		local n2 = v13 + (p10 + p11 + p12)
		local n3 = v13 + (p10 - p11 - p12)
		local n4 = v13 + (p10 + p11 - p12)

		u18 = n1
		u19 = n2
		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)

		if p9 ~= false then
			ceive.Ray:Draw(n2, n3)
		end

		ceive.Ray:Draw(n3, n4)
	end)(-n2, n3, n4);
	(function(p13, p14, p15)
		local n1 = v13 + (p13 - p14 + p15)
		local n2 = v13 + (p13 + p14 + p15)
		local n3 = v13 + (-p13 - p14 + p15)
		local n4 = v13 + (-p13 + p14 + p15)

		u20 = n1
		u21 = n2
		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)

		if p9 ~= false then
			ceive.Ray:Draw(n2, n3)
		end

		ceive.Ray:Draw(n3, n4)
	end)(n2, n3, -n4)
	ceive.Ray:Draw(u18, u20)
	ceive.Ray:Draw(u19, u21)

	if p9 ~= false then
		ceive.Ray:Draw(u19, u20)
	end
end
function module.Create(p16, p17, p18, p19)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Transform = p17,
		Size = p18,
		DrawTriangles = p19,
		AlwaysOnTop = p16.Propertys.AlwaysOnTop,
		Transparency = p16.Propertys.Transparency,
		Color3 = p16.Propertys.Color3
	}

	p16.Retain(p16, t2)

	return t2
end
function module.Update(p20, p21)
	local ceive = p20.Ceive

	ceive.PushProperty("AlwaysOnTop", p21.AlwaysOnTop)
	ceive.PushProperty("Transparency", p21.Transparency)
	ceive.PushProperty("Color3", p21.Color3)
	p20:Draw(p21.Transform, p21.Size, p21.DrawTriangles)
end

return module
