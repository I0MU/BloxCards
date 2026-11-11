



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local v4 = replicatedStorage("qMath")
local getRotationInXZPlane = replicatedStorage("qCFrame").GetRotationInXZPlane
local clampNumber = v4.ClampNumber
local lerpNumber = v4.LerpNumber
local module: {[any]: any} = {
	ClassName = "PushCamera",
	_MaxY = 1.3962634015954636,
	_MinY = -1.3962634015954636,
	_AngleXZ0 = 0,
	_AngleY = 0,
	FadeBackTime = 0.5,
	DefaultAngleXZ0 = 0,
	_LastUpdateTime = -1,
	PushBackAfter = 0.5
}

function module.new()
	return (setmetatable({}, module))
end
function module.RotateXY(p1, p2)
	p1.AngleX = p1.AngleX + p2.x
	p1.AngleY = p1.AngleY + p2.y
end
function module.StopRotateBack(p3)
	p3.CoordinateFrame = p3.CoordinateFrame
end
function module.Reset(p4)
	p4.LastUpdateTime = 0
end
function module.__add(p5, p6)
	return v3.new(p5, p6)
end
function module.__newindex(p7, p8, p9)
	if p8 == "CoordinateFrame" then
		local v18 = getRotationInXZPlane(p9)

		p7.AngleXZ = math.atan2(v18.lookVector.x, v18.lookVector.z) + 3.141592653589793

		local v19 = v18:toObjectSpace(p9)

		p7.AngleY = math.asin(v19.lookVector.y)

		return
	end

	if p8 == "DefaultCoordinateFrame" then
		local v20 = getRotationInXZPlane(p9)

		p7.DefaultAngleXZ0 = math.atan2(v20.lookVector.x, v20.lookVector.z) + 3.141592653589793

		local v21 = v20:toObjectSpace(p9)

		p7.AngleY = math.asin(v21.lookVector.y)

		return
	end

	if p8 == "AngleY" then
		p7._AngleY = clampNumber(p9, p7.MinY, p7.MaxY)

		return
	end

	if p8 == "AngleX" or p8 == "AngleXZ" then
		p7.LastUpdateTime = tick()
		p7._AngleXZ0 = p9

		return
	end

	if p8 == "MaxY" then
		assert(p9 > p7.MinY, "MaxY must be greater than MinY")
		p7._MaxY = p9
		p7.AngleY = p7.AngleY

		return
	end

	if p8 == "MinY" then
		assert(p9 < p7.MinY, "MinY must be less than MeeeaxY")
		p7._MaxY = p9
		p7.AngleY = p7.AngleY

		return
	end

	if p8 == "LastUpdateTime" then
		p7._LastUpdateTime = p9

		return
	end

	if module[p8] == nil then
		error(p8 .. " is not a valid member or PushCamera")

		return
	end

	rawset(p7, p8, p9)
end
function module.__index(p10, p11)
	if p11 == "State" or p11 == "CameraState" or p11 == "Camera" then
		local v24 = v2.new()

		v24.CoordinateFrame = p10.CoordinateFrame

		return v24
	end

	if p11 == "LastUpdateTime" then
		return p10._LastUpdateTime
	end

	if p11 == "LookVector" then
		return p10.Rotation.lookVector
	end

	if p11 == "CoordinateFrame" then
		local angles = p10.Angles
		local v26 = CFrame.Angles(0, p10.AngleXZ, 0)
		local v27 = CFrame.Angles(p10.AngleY, 0, 0)

		return v26 * v27
	end

	if p11 == "AngleY" then
		return p10._AngleY
	end

	if p11 == "PushBackDelta" then
		return tick() - p10.LastUpdateTime - p10.PushBackAfter
	end

	if p11 == "PercentFaded" then
		return clampNumber(p10.PushBackDelta / p10.FadeBackTime, 0, 1)
	end

	if p11 == "PercentFadedCurved" then
		return p10.PercentFaded ^ 2
	end

	if p11 == "AngleX" or p11 == "AngleXZ" then
		return lerpNumber(p10._AngleXZ0, p10.DefaultAngleXZ0, p10.PercentFadedCurved)
	end

	if p11 == "MaxY" then
		return p10._MaxY
	end

	if p11 == "MinY" then
		return p10._MinY
	end

	return module[p11]
end

return module
