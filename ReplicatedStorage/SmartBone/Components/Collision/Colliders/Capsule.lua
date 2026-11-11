



--!native
local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function solve(p2, p3, p4, p5)
	local v9 = (p5 - p2):Dot(p3)
	local v10 = math.clamp(v9, -p4, p4)

	return p2 + p3 * v10
end
local function ClosestPointFunc(p6, p7, p8, p9)
	local v15 = p6.Position
	local upVector = p6.UpVector
	local n1 = p7 * 0.5
	local v18 = (p9 - v15):Dot(upVector)
	local v19 = math.clamp(v18, -n1, n1)
	local n2 = v15 + upVector * v19

	n1 = p9 - n2

	local v21 = if n1.Magnitude == 0 then Vector3.new(0, 0, 0) else n1.Unit

	return p8 >= (n2 - p9).Magnitude, n2 + v21 * p8, v21
end

return function(p10, p11, p12, p13)
	debug.profilebegin("Capsule Testing")

	local n1 = math.min(p11.Y, p11.Z) * 0.5
	local x = p11.X
	local v28 = CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
	local n2 = p10 * v28
	local v30 = n2.Position
	local upVector = n2.UpVector
	local n3 = x * 0.5
	local v33 = (p12 - v30):Dot(upVector)
	local v34 = math.clamp(v33, -n3, n3)
	local n4 = v30 + upVector * v34

	n3 = p12 - n4

	local v36 = if n3.Magnitude == 0 then Vector3.new(0, 0, 0) else n3.Unit

	v28 = n1 >= (n4 - p12).Magnitude

	local n5 = n4 + v36 * n1
	local v38 = v36

	if v28 then
		return v28, n5, v38
	end

	v28 = p13 > (n5 - p12).Magnitude
	debug.profileend()

	return v28, n5, v38
end
