



local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function ClosestPointFunc(p2, p3, p4)
	local v7 = p2:pointToObjectSpace(p4)
	local x = p3.x
	local y = p3.y
	local z = p3.z
	local v11 = v7.x
	local v12 = v7.y
	local v13 = v7.z

	v7 = math.clamp(v11, -x * 0.5, x * 0.5)

	local v14 = math.clamp(v12, -y * 0.5, y * 0.5)
	local v15 = math.clamp(v13, -z * 0.5, z * 0.5)

	if v7 == v11 and v14 == v12 and v15 == v13 then
		local n1 = v11 - x * 0.5
		local n2 = v12 - y * 0.5
		local n3 = v13 - z * 0.5
		local n4 = -v11 - x * 0.5
		local n5 = -v12 - y * 0.5
		local n6 = -v13 - z * 0.5
		local v22 = math.max(n1, n2, n3, n4, n5, n6)

		if v22 == n1 then
			local vector3 = Vector3.new(x * 0.5, v12, v13)

			return true, p2 * vector3, p2.XVector
		end

		if v22 == n2 then
			local vector3 = Vector3.new(v11, y * 0.5, v13)

			return true, p2 * vector3, p2.YVector
		end

		if v22 == n3 then
			local vector3 = Vector3.new(v11, v12, z * 0.5)

			return true, p2 * vector3, p2.ZVector
		end

		if v22 == n4 then
			local vector3 = Vector3.new(-x * 0.5, v12, v13)

			return true, p2 * vector3, -p2.XVector
		end

		if v22 == n5 then
			local vector3 = Vector3.new(v11, -y * 0.5, v13)

			return true, p2 * vector3, -p2.YVector
		end

		if v22 == n6 then
			local vector3 = Vector3.new(v11, v12, -z * 0.5)

			return true, p2 * vector3, -p2.ZVector
		end

		warn("CLOSEST POINT ON BOX FAIL")

		return false, p2.Position, Vector3.new(0, 0, 0)
	end

	local vector3 = Vector3.new(v7, v14, v15)
	local n7 = p2 * vector3
	local n8 = p4 - n7

	return false, n7, if n8.Magnitude == 0 then Vector3.new(0, 0, 0) else n8.Unit
end

return function(p5, p6, p7, p8)
	debug.profilebegin("Box Testing")

	local v36, v37, v38 = ClosestPointFunc(p5, p6, p7)

	if v36 then
		return v36, v37, v38
	end

	local u39: boolean = p8 > (v37 - p7).Magnitude

	debug.profileend()

	return u39, v37, v38
end
