



--!native
local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function solve(p2, p3, p4, p5)
	local v10 = (p5 - p2):Dot(p3)

	v10 = math.clamp(v10, -p4, p4)

	return p2 + p3 * v10, v10
end
local function ProjectOnPlane(p6, p7, p8)
	local v14 = (p8 - p6):Dot(p7)

	return p8 - v14 * p7
end
local function ClosestPointFunc(p9, p10, p11)
	local n1 = math.min(p10.Y, p10.Z) * 0.5
	local n2 = p10.X * 0.5
	local v20 = p9.Position
	local rightVector = p9.RightVector
	local v22 = (p11 - v20):Dot(rightVector)

	v22 = math.clamp(v22, -n2, n2)

	local n3 = v20 + rightVector * v22
	local v24 = v22

	v20 = p9.Position + -p9.RightVector * n2

	local n4 = p9.Position + p9.RightVector * n2
	local n5 = -p9.RightVector
	local v27 = p9.RightVector
	local v28 = (p11 - v20):Dot(n5)
	local v29 = (p11 - n4):Dot(v27)

	local function GetFinalProj(p12, p13)
		local n2 = p12 - p13
		local v53 = if n2.Magnitude == 0 then Vector3.new(0, 0, 0) else n2.Unit
		local v54 = math.min((p12 - p13).Magnitude, n1)

		return p13 + v53 * v54
	end

	local n6 = p11 - v28 * n5
	local n7 = n6 - v20
	local v33 = if n7.Magnitude == 0 then Vector3.new(0, 0, 0) else n7.Unit
	local v34 = math.min((n6 - v20).Magnitude, n1)
	local n8 = v20 + v33 * v34

	n6 = p11 - v29 * v27
	v33 = n6 - n4
	v20 = if v33.Magnitude == 0 then Vector3.new(0, 0, 0) else v33.Unit

	local v36 = math.min((n6 - n4).Magnitude, n1)
	local n9 = n4 + v20 * v36

	n6 = p11 - n3
	n4 = if n6.Magnitude == 0 then Vector3.new(0, 0, 0) else n6.Unit
	n6 = n1 >= (n3 - p11).Magnitude
	GetFinalProj = n3 + n4 * n1

	local magnitude = (n9 - p11).Magnitude
	local v39 = (n8 - p11).Magnitude

	v36 = math.min(magnitude, v39, (GetFinalProj - p11).Magnitude)

	if v24 == n2 or v36 == magnitude then
		local n10 = p11 - n9

		return (if n10.Magnitude == 0 then Vector3.new(0, 0, 0) else n10.Unit):Dot(v27) < 0, n9, v27
	end

	if v24 == -n2 or v36 == v39 then
		local n11 = p11 - n8

		return (if n11.Magnitude == 0 then Vector3.new(0, 0, 0) else n11.Unit):Dot(n5) < 0, n8, n5
	end

	return n6, GetFinalProj, n4
end

return function(p14, p15, p16, p17)
	debug.profilebegin("Cylinder Testing")

	local v46, v47, v48 = ClosestPointFunc(p14, p15, p16)

	if v46 then
		return v46, v47, v48
	end

	local u49: boolean = p17 > (v47 - p16).Magnitude

	debug.profileend()

	return u49, v47, v48
end
