



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
replicatedStorage("CameraState")

local v2 = replicatedStorage("SummedCamera")
local module: {[any]: any} = { ClassName = "CustomCameraEffect" }

function module.new(p1)
	local object = setmetatable({}, module)

	object.RetrieveState = p1 or error()

	return object
end
function module.__add(p2, p3)
	return v2.new(p2, p3)
end
function module.__index(p4, p5)
	if p5 == "State" or p5 == "CameraState" or p5 == "Camera" then
		return p4.RetrieveState()
	end

	return module[p5]
end

return module
