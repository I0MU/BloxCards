



local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end

return function(p2, p3, p4, p5)
	debug.profilebegin("Axis Constraint")

	local n1 = p5:Inverse() * p3
	local x = n1.X
	local y = n1.Y
	local z = n1.Z
	local xAxisLimits = p2.XAxisLimits
	local yAxisLimits = p2.YAxisLimits
	local zAxisLimits = p2.ZAxisLimits
	local n2 = xAxisLimits.Min + p2.Radius
	local n3 = n2 <= xAxisLimits.Max - p2.Radius and xAxisLimits.Max - p2.Radius or n2
	local n4 = yAxisLimits.Min + p2.Radius
	local n5 = n4 <= yAxisLimits.Max - p2.Radius and yAxisLimits.Max - p2.Radius or n4
	local n6 = zAxisLimits.Min + p2.Radius
	local n7 = n6 <= zAxisLimits.Max - p2.Radius and zAxisLimits.Max - p2.Radius or n6
	local n8 = (x < n2 and n2 or x > n3 and n3 or x) * (if p2.AxisLocked[1] then 0 else 1)
	local n9 = (y < n4 and n4 or y > n5 and n5 or y) * (if p2.AxisLocked[2] then 0 else 1)
	local n10 = (z < n6 and n6 or z > n7 and n7 or z) * (if p2.AxisLocked[3] then 0 else 1)
	local vector3 = Vector3.new(n8, n9, n10)
	local n11 = p5 * vector3
	local rightVector = p5.RightVector
	local upVector = p5.UpVector
	local lookVector = p5.LookVector
	local n12 = n11 - p4

	n2 = if n12.Magnitude == 0 then Vector3.new(0, 0, 0) else n12.Unit

	if n8 ~= n1.X then
		local v29 = rightVector:Dot(n2)

		p2:ClipVelocity(n11, v29 < 0 and -rightVector or rightVector)
	end

	if n9 ~= n1.Y then
		local v30 = upVector:Dot(n2)

		p2:ClipVelocity(n11, v30 < 0 and -upVector or upVector)
	end

	if n10 ~= n1.Z then
		local v31 = lookVector:Dot(n2)

		p2:ClipVelocity(n11, v31 > 0 and -lookVector or lookVector)
	end

	debug.profileend()

	return n11
end
