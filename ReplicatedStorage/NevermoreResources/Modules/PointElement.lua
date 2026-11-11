



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local iCompassElement = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ICompassElement")
local object = setmetatable({}, iCompassElement)

object.__index = object
object.ClassName = "PointElement"

function object.new(p1, p2, p3)
	local v7 = iCompassElement.new(p1)
	local object2 = setmetatable(v7, object)

	object2:SetPart(p3)
	object2.SetTransparency = p2 or error("No SetTransparency")

	return object2
end
function object.SetPart(p4, p5)
	p4.Part = p5 or error("No part")

	local v11 = p5:IsA("BasePart")

	assert(v11, "Part must be a base part")
end
function object.CalculatePercentPosition(p6, p7)
	local v14 = p7:GetRelativeAngle(p6.Part.Position)

	return p7:GetPercentPosition(v14, p6.ThetaVisible)
end

return object
