



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

	local v13 = CFrame.lookAt(p7, p7 + p8)
	local n1 = p9 * Vector3.new(1, 1, 0) * 0.5;

	(function(p10, p11, p12)
		local n1 = p7 + (p10 - p11 + p12)
		local n2 = p7 + (p10 + p11 + p12)
		local n3 = p7 + (-p10 - p11 + p12)
		local n4 = p7 + (-p10 + p11 + p12)

		ceive.Ray:Draw(n1, n2)
		ceive.Ray:Draw(n1, n3)
		ceive.Ray:Draw(n2, n4)
		ceive.Ray:Draw(n2, n3)
		ceive.Ray:Draw(n3, n4)
	end)(v13.UpVector * n1.Y, v13.RightVector * n1.X, v13.LookVector * n1.Z)
end
function module.Create(p13, p14, p15, p16)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Position = p14,
		Normal = p15,
		Size = p16,
		AlwaysOnTop = p13.Propertys.AlwaysOnTop,
		Transparency = p13.Propertys.Transparency,
		Color3 = p13.Propertys.Color3
	}

	p13.Retain(p13, t2)

	return t2
end
function module.Update(p17, p18)
	local ceive = p17.Ceive

	ceive.PushProperty("AlwaysOnTop", p18.AlwaysOnTop)
	ceive.PushProperty("Transparency", p18.Transparency)
	ceive.PushProperty("Color3", p18.Color3)
	p17:Draw(p18.Position, p18.Normal, p18.Size)
end

return module
