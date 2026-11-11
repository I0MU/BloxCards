



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("CameraState")

local module: {[any]: any} = { ClassName = "SummedCamera", Mode = "World" }

function module.new(p1, p2)
	local object = setmetatable({}, module)

	object._CameraA = p1 or error("No CameraA")
	object._CameraB = p2 or error("No CameraB")

	return object
end
function module.SetMode(p3, mode)
	local u8: boolean = true

	if mode ~= "World" then
		u8 = mode == "Relative"
	end

	assert(u8)
	p3.Mode = mode

	return p3
end
function module.__add(p5, p6)
	return module.new(p5, p6):SetMode(p5.Mode)
end
function module.__sub(p7, p8)
	if p8 == p7._CameraA then
		return p7._CameraA
	end

	if p8 == p7._CameraB then
		return p7._CameraB
	end

	error("Unable to subtract successfully")
end
function module.__index(p9, p10)
	if p10 ~= "State" and p10 ~= "CameraState" and p10 ~= "Camera" then
		if p10 == "CameraA" then
			return p9._CameraA.CameraState or p9._CameraA
		end

		if p10 == "CameraB" then
			return p9._CameraB.CameraState or p9._CameraB
		end

		return module[p10]
	end

	if p9.Mode == "World" then
		return p9.CameraA + p9.CameraB
	end

	local n1 = p9.CameraA + p9.CameraB

	n1.qPosition = p9.CameraA.CoordinateFrame * p9.CameraB.qPosition

	return n1
end

return module
