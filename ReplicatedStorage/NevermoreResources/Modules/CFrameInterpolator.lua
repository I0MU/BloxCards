



local cFrameFromAxisAngle = CFrame.fromAxisAngle
local components = CFrame.new().components
local inverse = CFrame.new().inverse
local vector3New = Vector3.new
local mathAcos = math.acos
local mathSqrt = math.sqrt

return function(p1, p2)
	local v9 = inverse(p1)
	local v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21 = components(v9 * p2)
	local n1 = (v13 + v17 + v21 - 1) / 2
	local u23 = vector3New(v20 - v18, v15 - v19, v16 - v14)
	local n2 = p2.p - p1.p

	if n1 >= 0.999 then
		return 0, function(p3)
			return p1 + n2 * p3
		end
	end

	local n3

	if n1 <= -0.999 then
		n3 = 3.141592653589793

		local n4 = (v13 + 1) / 2
		local n5 = (v17 + 1) / 2
		local n6 = (v21 + 1) / 2

		if not (n4 > n5) or not (n4 > n6) then
			if not (n5 > n6) then
				if n6 < 0.001 then
					u23 = Vector3.new(0.70710677, 0.70710677, 0)
				else
					local v29 = mathSqrt(n6)

					u23 = vector3New((v19 + v15) / 4 / v29, (v20 + v18) / 4 / v29, v29)
				end
			elseif n5 < 0.001 then
				u23 = Vector3.new(0.70710677, 0, 0.70710677)
			else
				local v30 = mathSqrt(n5)

				u23 = vector3New((v16 + v14) / 4 / v30, v30, (v20 + v18) / 4 / v30)
			end
		elseif n4 < 0.001 then
			u23 = Vector3.new(0, 0.70710677, 0.70710677)
		else
			local v31 = mathSqrt(n4)

			u23 = vector3New(v31, (v16 + v14) / 4 / v31, (v19 + v15) / 4 / v31)
		end
	else
		n3 = mathAcos(n1)
	end

	return n3, function(p4)
		local v34 = cFrameFromAxisAngle(u23, n3 * p4)

		return p1 * v34 + n2 * p4
	end
end
