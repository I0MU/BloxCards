



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local iCompass = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ICompass")
local object = setmetatable({}, iCompass)

object.__index = object
object.ClassName = "CircleCompass"

function object.new(p1, p2)
	local v6 = iCompass.new(p1, p2)
	local object2 = setmetatable(v6, object)

	object2:UpdateThetaCalculations()

	return object2
end
function object.UpdateThetaCalculations(p3)
	local absoluteSize = p3.Container.AbsoluteSize
	local absoluteSizeX = absoluteSize.X
	local absoluteSizeY = absoluteSize.Y
	local radius = absoluteSizeY / 2 + absoluteSizeX * absoluteSizeX / (8 * absoluteSizeY)
	local v13 = math.atan(2 * absoluteSizeY / absoluteSizeX)
	local n2 = (2 * absoluteSizeY + absoluteSizeX * absoluteSizeX / (2 * absoluteSizeY)) * v13 / radius

	p3.Radius = radius

	if p3.ThetaVisible ~= n2 then
		p3:SetThetaVisible(n2)
	end
end
function object.SetRadius(p4, p5)
	p4.Radius = tonumber(p5) or error("Radius is iether not sent or not a number")
end
function object.Draw(p6)
	local v18 = getmetatable(object)

	p6:UpdateThetaCalculations()
	v18.Draw(p6)
end
function object.GetPosition(p7, p8)
	local n1 = p7.ThetaVisible / 2 * (p8 - 0.5)
	local n2 = math.sin(n1) * p7.Radius
	local cosine = math.cos(n1)

	cosine = UDim2.new(0.5, n2, 0, p7.Radius - cosine * p7.Radius)

	return cosine, n1 * 180 / 3.141592653589793
end

return object
