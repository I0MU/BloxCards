



--!native
local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function ClosestPointFunc(p2, p3, p4)
	local n1 = p4 - p2
	local v8 = if n1.Magnitude == 0 then Vector3.new(0, 0, 0) else n1.Unit

	return p3 >= (p2 - p4).Magnitude, p2 + v8 * p3, v8
end

return function(p5, p6, p7, p8)
	debug.profilebegin("Sphere Testing")

	local v13 = p5.Position
	local n1 = math.min(p6.X, p6.Y, p6.Z) * 0.5
	local n2 = p7 - v13
	local v16 = if n2.Magnitude == 0 then Vector3.new(0, 0, 0) else n2.Unit
	local u17: boolean = n1 >= (v13 - p7).Magnitude
	local n3 = v13 + v16 * n1
	local v19 = v16

	if u17 then
		return u17, n3, v19
	end

	u17 = p8 > (n3 - p7).Magnitude
	debug.profileend()

	return u17, n3, v19
end
