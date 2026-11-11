



return {
	BezierFactory = function(p1, p2, p3, p4)
		assert(p1, "[BezierFactory] - Need P1x to construct a Bezier Factory")
		assert(p2, "[BezierFactory] - Need P1y to construct a Bezier Factory")
		assert(p3, "[BezierFactory] - Need P2x to construct a Bezier Factory")
		assert(p4, "[BezierFactory] - Need P2y to construct a Bezier Factory")

		local function A(p5, p6)
			return 1 - 3 * p6 + 3 * p5
		end
		local function B(p7, p8)
			return 3 * p8 - 6 * p7
		end
		local function C(p9)
			return 3 * p9
		end
		local function CalculateBezier(p10, p11, p12)
			return (((1 - 3 * p12 + 3 * p11) * p10 + (3 * p12 - 6 * p11)) * p10 + 3 * p11) * p10
		end
		local function GetSlope(p13, p14, p15)
			return 3 * (1 - 3 * p15 + 3 * p14) * p13 * p13 + 2 * (3 * p15 - 6 * p14) * p13 + 3 * p14
		end
		local function GetTForX(p16)
			local v23 = p16

			for _ = 1, 4 do
				local v25 = p1
				local v26 = p3
				local n1 = 3 * (1 - 3 * v26 + 3 * v25) * v23 * v23 + 2 * (3 * v26 - 6 * v25) * v23 + 3 * v25

				if n1 == 0 then
					return v23
				end

				local v28 = p1
				local v29 = p3

				v23 -= ((((1 - 3 * v29 + 3 * v28) * v23 + (3 * v29 - 6 * v28)) * v23 + 3 * v28) * v23 - p16) / n1
			end

			return v23
		end

		return function(p17)
			local v31 = GetTForX(p17)
			local v32 = p2
			local v33 = p4

			return (((1 - 3 * v33 + 3 * v32) * v31 + (3 * v33 - 6 * v32)) * v31 + 3 * v32) * v31
		end
	end
}
