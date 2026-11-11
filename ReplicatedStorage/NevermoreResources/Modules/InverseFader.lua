



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
replicatedStorage("CameraState")

local v2 = replicatedStorage("SummedCamera")
local module: {[any]: any} = { ClassName = "InverseFader" }

function module.new(p1, p2)
	local object = setmetatable({}, module)

	object.Camera = p1 or error()
	object.Fader = p2 or error()

	return object
end
function module.__add(p3, p4)
	return v2.new(p3, p4)
end
function module.__index(p5, p6)
	if p6 == "State" or p6 == "CameraState" or p6 == "Camera" then
		return (p5.Camera.CameraState or p5.Camera) * (1 - p5.Fader.Value)
	end

	return module[p6]
end

return module
