



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local v4 = replicatedStorage("qMath")
local getRotationInXZPlane = replicatedStorage("qCFrame").GetRotationInXZPlane
local clampNumber = v4.ClampNumber
local module: {[any]: any} = {
	ClassName = "RotatedCamera",
	_MaxY = 1.3962634015954636,
	_MinY = -1.3962634015954636,
	_AngleXZ = 0,
	_AngleY = 0
}

function module.new()
	return (setmetatable({}, module))
end
function module.RotateXY(p1, p2)
	p1.AngleX = p1.AngleX + p2.x
	p1.AngleY = p1.AngleY + p2.y
end
function module.__add(p3, p4)
	return v3.new(p3, p4)
end
function module.__newindex(p5, p6, p7)
	if p6 == "CoordinateFrame" then
		local v15 = getRotationInXZPlane(p7)

		p5.AngleXZ = math.atan2(v15.lookVector.x, v15.lookVector.z) + 3.141592653589793

		local v16 = v15:toObjectSpace(p7)

		p5.AngleY = math.asin(v16.lookVector.y)

		return
	end

	if p6 == "AngleY" then
		p5._AngleY = clampNumber(p7, p5.MinY, p5.MaxY)

		return
	end

	if p6 == "AngleX" or p6 == "AngleXZ" then
		p5._AngleXZ = p7

		return
	end

	if p6 == "MaxY" then
		assert(p7 > p5.MinY, "MaxY must be greater than MinY")
		p5._MaxY = p7
		p5.AngleY = p5.AngleY

		return
	end

	if p6 == "MinY" then
		assert(p7 < p5.MinY, "MinY must be less than MeeeaxY")
		p5._MaxY = p7
		p5.AngleY = p5.AngleY

		return
	end

	if module[p6] == nil then
		error(p6 .. " is not a valid member or RotatedCamera")

		return
	end

	rawset(p5, p6, p7)
end
function module.__index(p8, p9)
	if p9 == "State" or p9 == "CameraState" or p9 == "Camera" then
		local v19 = v2.new()

		v19.CoordinateFrame = p8.CoordinateFrame

		return v19
	end

	if p9 == "LookVector" then
		return p8.Rotation.lookVector
	end

	if p9 == "CoordinateFrame" then
		local angles = p8.Angles
		local v21 = CFrame.Angles(0, p8.AngleXZ, 0)
		local v22 = CFrame.Angles(p8.AngleY, 0, 0)

		return v21 * v22
	end

	if p9 == "AngleY" then
		return p8._AngleY
	end

	if p9 == "AngleX" or p9 == "AngleXZ" then
		return p8._AngleXZ
	end

	if p9 == "MaxY" then
		return p8._MaxY
	end

	if p9 == "MinY" then
		return p8._MinY
	end

	return module[p9]
end

return module
