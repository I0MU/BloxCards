



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local getRotationInXZPlane = replicatedStorage("qCFrame").GetRotationInXZPlane
local module: {[any]: any} = { ClassName = "XZPlaneLockCamera" }

function module.new(p1)
	local object = setmetatable({}, module)

	object.Camera = p1 or error("No camera")

	return object
end
function module.__add(p2, p3)
	return v3.new(p2, p3)
end
function module.__index(p4, p5)
	if p5 == "State" or p5 == "CameraState" or p5 == "Camera" then
		local v12 = p4.Camera.CameraState or p4.Camera
		local coordinateFrame = getRotationInXZPlane(v12.CoordinateFrame)
		local v14 = v2.new()

		v14.CoordinateFrame = coordinateFrame
		v14.FieldOfView = v12.FieldOfView

		return v14
	end

	return module[p5]
end

return module
