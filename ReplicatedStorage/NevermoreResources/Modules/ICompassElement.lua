



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "ICompassElement"
module.PercentSolid = 0.8
module.ThetaVisible = 1.5707963267948966

function module.new(p1)
	local object = setmetatable({}, module)

	object.Gui = p1 or error("No GUI")
	object.PercentPosition = 0
	object.Position = UDim2.new()
	object.Rotation = 0

	return object
end
function module.GetGui(p2)
	return p2.Gui
end
function module.SetPosition(p3, p4)
	p3.Position = p4 or error("No position sent")
end
function module.SetPercentSolid(p5, p6)
	p5.PercentSolid = tonumber(p6) or error("No or invalid PercentSolid sent")
end
function module.SetThetaVisible(p7, p8)
	p7.ThetaVisible = tostring(p8) or error("No or invalid ThetaVisible sent")
end
function module.CalculateTransparency(p9)
	local n1 = (math.abs(0.5 - p9.PercentPosition) - p9.PercentSolid / 2) / ((1 - p9.PercentSolid) / 2)

	if n1 >= 1 then
		return 1
	end

	if n1 <= 0 then
		return 0
	end

	return n1 ^ 2
end
function module.SetPercentPosition(p10, percentPosition)
	local typeName: string = type(percentPosition)

	assert(typeName == "number", "Percent must be a number")
	p10.PercentPosition = percentPosition
end
function module.SetRotation(p12, rotation)
	p12.Rotation = rotation
end
function module.GetPercentPosition(p14)
	return p14.PercentPosition
end
function module.Draw(p15)
	p15:SetTransparency(p15:CalculateTransparency())

	local absoluteSize = p15.Gui.AbsoluteSize
	local gui = p15.Gui
	local v22 = p15.Position
	local uDim2 = UDim2.new(0, -absoluteSize.X / 2, 0, -absoluteSize.Y / 2)

	gui.Position = v22 + uDim2
	p15.Gui.Rotation = p15.Rotation
end
function module.SetTransparency(_, _)
	error("No set transparency")
end
function module.CalculatePercentPosition(_, _)
	error("CalculatePosition not overriden")
end

return module
