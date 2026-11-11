



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local iCompass = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("ICompass")
local object = setmetatable({}, iCompass)

object.__index = object
object.ClassName = "StripCompass"

function object.new(p1, p2)
	local v6 = iCompass.new(p1, p2)

	return (setmetatable(v6, object))
end
function object.GetPosition(_, p4)
	return UDim2.new(p4, 0, 0.5, 0)
end

return object
