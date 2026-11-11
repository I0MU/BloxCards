



local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end

return function(p2, p3, p4)
	debug.profilebegin("Rotation Constraint")

	local v6 = p4.Bones[p2.ParentIndex]

	if not v6 then
		debug.profileend()

		return p3
	end

	local v7 = p4.Bones[v6.ParentIndex]

	if not v7 then
		debug.profileend()

		return p3
	end

	local rotationLimit = v6.RotationLimit
	local v9 = v6.Position
	local n1 = v6.Position - v7.Position
	local v11 = if n1.Magnitude == 0 then Vector3.new(0, 0, 0) else n1.Unit
	local magnitude = (p3 - v9).Magnitude

	n1 = p3 - v9
	v7 = if n1.Magnitude == 0 then Vector3.new(0, 0, 0) else n1.Unit

	if rotationLimit >= 180 then
		debug.profileend()

		return p3
	end

	if rotationLimit <= 0 then
		debug.profileend()

		return v9 + v11 * magnitude
	end

	local v13 = math.rad(p2.RotationLimit)
	local v14 = v11:Dot(v7)

	n1 = math.acos(v14)

	local n2

	if v13 <= n1 then
		local v16 = v11:Cross(v7)

		n2 = CFrame.fromAxisAngle(if v16.Magnitude == 0 then Vector3.new(0, 0, 0) else v16.Unit, v13) * v11
	else
		n2 = v7
	end

	debug.profileend()

	return v9 + n2 * magnitude
end
