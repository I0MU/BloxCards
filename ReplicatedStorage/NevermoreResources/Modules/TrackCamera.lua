



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local module: {[any]: any} = { ClassName = "TrackCamera", FieldOfView = 0 }

function module.new(cameraSubject)
	local object = setmetatable({}, module)

	object.CameraSubject = cameraSubject

	return object
end
function module.__add(p2, p3)
	return v3.new(p2, p3)
end
function module.__newindex(p4, p5, p6)
	if p5 == "CameraSubject" then
		local u12: boolean = true

		if type(p6) ~= "userdata" then
			u12 = type(p6) == "nil"
		end

		assert(u12, "CameraSubject must be a ROBLOX Model or ROBLOX Part or nil")
		rawset(p4, p5, p6)

		return
	end

	if p5 == "FieldOfView" then
		rawset(p4, p5, p6)

		return
	end

	error(p5 .. " is not a valid member of TrackCamera")
end
function module.__index(p7, p8)
	if p8 == "State" or p8 == "CameraState" or p8 == "Camera" then
		local cameraSubject = p7.CameraSubject
		local v16 = v2.new()

		v16.FieldOfView = p7.FieldOfView

		if cameraSubject then
			if cameraSubject:IsA("Model") then
				v16.CoordinateFrame = cameraSubject:GetPrimaryPartCFrame()

				return v16
			end

			if cameraSubject:IsA("BasePart") then
				v16.CoordinateFrame = cameraSubject.CFrame
			end

			return v16
		end

		return v16
	end

	return module[p8]
end

return module
