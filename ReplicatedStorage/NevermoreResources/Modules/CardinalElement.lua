



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local iCompassElement = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ICompassElement")
local object = setmetatable({}, iCompassElement)

object.__index = object
object.ClassName = "CardinalElement"

function object.new(p1, p2, p3)
	local v7 = iCompassElement.new(p1)
	local object2 = setmetatable(v7, object)

	object2:SetAngle(p3)
	object2.SetTransparency = p2 or error("No SetTransparency")

	return object2
end
function object.SetAngle(p4, angle)
	local typeName: string = type(angle)

	assert(typeName == "number", "Angle must be a number!")
	p4.Angle = angle
end
function object.CalculatePercentPosition(p6, p7)
	return p7:GetPercentPosition(p6.Angle, p6.ThetaVisible)
end

return object
