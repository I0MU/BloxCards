



local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end

return function(p2, p3, p4)
	debug.profilebegin("Rope Constraint")

	local v6 = p4.Bones[p2.ParentIndex]

	if v6 then
		local n1 = p3 - v6.Position
		local v8 = if n1.Magnitude == 0 then Vector3.new(0, 0, 0) else n1.Unit
		local v9 = math.min(n1.Magnitude, p2.FreeLength)

		n1 = v6.Position + v8 * v9
		debug.profileend()

		return n1
	end

	debug.profileend()
end
