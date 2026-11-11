



--!native
local dot = Vector3.new().Dot
local cross = Vector3.new().Cross
local mathClamp = math.clamp

local function SafeUnit(p1)
	if p1.Magnitude == 0 then
		return Vector3.new(0, 0, 0)
	end

	return p1.Unit
end
local function ClosestPointOnLineSegment(p2, p3, p4)
	local n1 = p3 - p2
	local v14 = dot(p4 - p2, n1)
	local v15 = dot(n1, n1)
	local v16 = mathClamp(v14 / v15, 0, 1)

	return p2 + v16 * n1
end
local function ProjectOnPlane(p5, p6, p7)
	local v20 = (p7 - p5):Dot(p6)

	return p7 - v20 * p6
end
local function SameSide(p8, p9, p10, p11)
	local v25 = cross(p11 - p10, p8 - p10)
	local v26 = cross(p11 - p10, p9 - p10)

	if dot(v25, v26) >= 0 then
		return true
	end

	return false
end
local function PointInTriangle(p12, p13, p14, p15)
	local v31 = cross(p15 - p14, p12 - p14)
	local v32 = cross(p15 - p14, p13 - p14)

	if dot(v31, v32) >= 0 and dot(cross(p15 - p13, p12 - p13), (cross(p15 - p13, p14 - p13))) >= 0 and dot(cross(p14 - p13, p12 - p13), (cross(p14 - p13, p15 - p13))) >= 0 then
		return true
	end

	return false
end

return function(p16, p17, p18, p19)
	debug.profilebegin("Triangle")

	local n1 = p17 - p16
	local v38 = dot(p19 - p16, n1)
	local v39 = dot(n1, n1)

	v39 = mathClamp(v38 / v39, 0, 1)

	local n2 = p16 + v39 * n1
	local n3 = p18 - p17

	v39 = dot(p19 - p17, n3)

	local v42 = dot(n3, n3)

	v42 = mathClamp(v39 / v42, 0, 1)
	n1 = p17 + v42 * n3
	v38 = p16 - p18
	v42 = dot(p19 - p18, v38)

	local v43 = dot(v38, v38)

	v43 = mathClamp(v42 / v43, 0, 1)
	n3 = p18 + v43 * v38
	v39 = cross(p17 - p16, p18 - p16)
	v38 = if v39.Magnitude == 0 then Vector3.new(0, 0, 0) else v39.Unit

	local v44 = (p19 - (p16 + p17 + p18) * 0.3333):Dot(v38)
	local v45 = cross(p18 - p17, p19 - p17)
	local v46 = cross(p18 - p17, p16 - p17)

	if dot(v45, v46) >= 0 and dot(cross(p18 - p16, p19 - p16), (cross(p18 - p16, p17 - p16))) >= 0 and dot(cross(p17 - p16, p19 - p16), (cross(p17 - p16, p18 - p16))) >= 0 then
		debug.profileend()

		return p19 - v44 * v38, v38
	end

	local magnitude = (n2 - p19).Magnitude
	local v48 = (n1 - p19).Magnitude
	local v49 = (n3 - p19).Magnitude

	v46 = math.min(magnitude, v48, v49)

	if v46 == magnitude then
		debug.profileend()

		return n2, v38
	end

	if v46 == v48 then
		debug.profileend()

		return n1, v38
	end

	if v46 == v49 then
		debug.profileend()

		return n3, v38
	end

	debug.profileend()

	return p19, v38
end
