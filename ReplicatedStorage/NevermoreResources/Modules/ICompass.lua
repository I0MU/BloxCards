



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "ICompass"
module.PercentSolid = 0.8
module.ThetaVisible = 1.5707963267948966

function module.new(p1, p2)
	local object = setmetatable({}, module)

	object.CompassModel = p1 or error("No CompassModel")
	object.Container = p2 or error("No Container")
	object.Elements = {}

	return object
end
function module.SetPercentSolid(p3, p4)
	p3.PercentSolid = tonumber(p4) or error("No PercentSolid")

	for k, _ in pairs(p3.Elements) do
		k:SetPercentSolid(p3.PercentSolid)
	end
end
function module.SetThetaVisible(p5, p6)
	p5.ThetaVisible = tonumber(p6) or error("No or invalid ThetaVisible sent")
	assert(p6 > 0, "ThetaVisible must be > 0")

	for k, _ in pairs(p5.Elements) do
		k:SetThetaVisible(p5.ThetaVisible)
	end
end
function module.AddElement(p7, p8)
	assert(not p7.Elements[p8], "Element already added")
	p7.Elements[p8] = true
	p8:SetPercentSolid(p7.PercentSolid)
	p8:SetThetaVisible(p7.ThetaVisible)

	local v15 = p8:GetGui()

	v15.Parent = p7.Container
end
function module.GetPosition(_, _)
	error("GetPosition is not overridden yet")
end
function module.Draw(p11)
	p11.CompassModel:Step()

	for k, _ in pairs(p11.Elements) do
		local v21 = k:CalculatePercentPosition(p11.CompassModel)

		k:SetPercentPosition(v21)

		local v22, v23 = p11:GetPosition(v21)

		k:SetPosition(v22)

		if v23 then
			k:SetRotation(v23)
		end

		k:Draw()
	end
end

return module
