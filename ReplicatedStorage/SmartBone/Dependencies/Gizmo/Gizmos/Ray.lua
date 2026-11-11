



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
function module.Draw(p6, p7, p8)
	local ceive = p6.Ceive

	if not ceive.Enabled then
		return
	end

	if p6.Propertys.AlwaysOnTop then
		ceive.AOTWireframeHandle:AddLine(p7, p8)
	else
		ceive.WireframeHandle:AddLine(p7, p8)
	end

	local v12 = p6.Ceive

	v12.ActiveRays = v12.ActiveRays + 1
	p6.Ceive.ScheduleCleaning()
end
function module.Create(p9, p10, p11)
	local t2: {[any]: any} = {
		Enabled = true,
		Destroy = false,
		Origin = p10,
		End = p11,
		AlwaysOnTop = p9.Propertys.AlwaysOnTop,
		Transparency = p9.Propertys.Transparency,
		Color3 = p9.Propertys.Color3
	}

	p9.Retain(p9, t2)

	return t2
end
function module.Update(p12, p13)
	local ceive = p12.Ceive

	ceive.PushProperty("AlwaysOnTop", p13.AlwaysOnTop)
	ceive.PushProperty("Transparency", p13.Transparency)
	ceive.PushProperty("Color3", p13.Color3)
	p12:Draw(p13.Origin, p13.End)
end

return module
