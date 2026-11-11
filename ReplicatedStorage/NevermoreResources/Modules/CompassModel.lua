



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "CompassModel"

function module.GetRotationDirection(p1, p2)
	local n1 = math.abs(p2 - p1) % 6.283185307179586
	local v5 = math.min(6.283185307179586 - n1, n1)

	return if (p2 - p1 + 6.283185307179586) % 6.283185307179586 < 3.141592653589793 then 1 else -1, v5
end
function module.GetCameraRotation(p3, p4)
	return math.atan2(p3.X - p4.X, p3.Z - p4.Z) + 3.141592653589793
end
function module.new(p5)
	local object = setmetatable({}, module)

	object.Camera = p5 or error("No camera")
	object.SmoothnessFactor = 4
	object.RealAngle = 0
	object.Angle = 0
	object.LastUpdatePoint = tick()

	return object
end
function module.Step(p6)
	local timestamp = tick()
	local n1 = timestamp - p6.LastUpdatePoint
	local realAngle = module.GetCameraRotation(p6.Camera.CoordinateFrame, p6.Camera.Focus)

	p6.RealAngle = realAngle

	local v14, v15 = module.GetRotationDirection(p6.Angle, realAngle)

	p6.Angle = math.abs((p6.Angle + v14 * v15 * n1 * p6.SmoothnessFactor) % 6.283185307179586)
	p6.LastUpdatePoint = timestamp

	return p6.Angle, p6.RealAngle
end
function module.GetAngle(p7)
	return p7.Angle
end
function module.GetRealAngle(p8)
	return p8.RealAngle
end
function module.SetSmoothnessFactor(p9, smoothnessFactor)
	local typeName: string = type(smoothnessFactor)

	assert(typeName == "number")
	p9.SmoothnessFactor = smoothnessFactor
end
function module.GetRelativeAngle(p11, p12)
	return (module.GetCameraRotation(p11.Camera.CoordinateFrame, p12))
end
function module.GetPercentPosition(p13, p14, p15)
	local n1 = (p13:GetAngle() - (p14 - p15 / 2)) / p15
	local n2 = 6.283185307179586 / p15
	local n3 = n2 / 2

	if n1 < -n3 + p15 / 2 then
		return n1 + n2
	end

	if n3 < n1 then
		return n1 - n2
	end

	return n1
end

return module
