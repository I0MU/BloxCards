



return {
	rgbToHsl = function(p1, p2, p3)
		local v4 = math.max(p1, p2, p3)
		local v5 = math.min(p1, p2, p3)
		local v6 = nil
		local n1 = (v4 + v5) / 2
		local n2
		local n3

		if v4 == v5 then
			n2 = 0
			n3 = 0
		else
			local n4 = v4 - v5

			n3 = if n1 > 0.5 then n4 / (2 - v4 - v5) else n4 / (v4 + v5)

			if v4 == p1 then
				v6 = (p2 - p3) / n4

				if p2 < p3 then
					v6 += 6
				end
			elseif v4 == p2 then
				v6 = (p3 - p1) / n4 + 2
			elseif v4 == p3 then
				v6 = (p1 - p2) / n4 + 4
			end

			n2 = v6 / 6
		end

		return n2, n3, n1 or 255
	end,
	hslToRgb = function(p4, p5, p6)
		local v16
		local v18
		local v20

		if p5 == 0 then
			v16 = p6
			v18 = p6
			v20 = p6
		else
			local function hue2rgb(p7, p8, p9)
				if p9 < 0 then
					p9 += 1
				end

				if p9 > 1 then
					p9 -= 1
				end

				if p9 < 0.16666666666666666 then
					return p7 + (p8 - p7) * 6 * p9
				end

				if p9 < 0.5 then
					return p8
				end

				if p9 < 0.6666666666666666 then
					return p7 + (p8 - p7) * (0.6666666666666666 - p9) * 6
				end

				return p7
			end

			local n1 = if p6 < 0.5 then p6 * (1 + p5) else p6 + p5 - p6 * p5
			local n2 = 2 * p6 - n1
			local n3 = p4 + 0.3333333333333333

			if n3 < 0 then
				n3 += 1
			end

			if n3 > 1 then
				n3 -= 1
			end

			v16 = if n3 < 0.16666666666666666 then n2 + (n1 - n2) * 6 * n3 else if n3 < 0.5 then n1 else if n3 < 0.6666666666666666 then n2 + (n1 - n2) * (0.6666666666666666 - n3) * 6 else n2
			n3 = p4

			if n3 < 0 then
				n3 += 1
			end

			if n3 > 1 then
				n3 -= 1
			end

			v18 = if n3 < 0.16666666666666666 then n2 + (n1 - n2) * 6 * n3 else if n3 < 0.5 then n1 else if n3 < 0.6666666666666666 then n2 + (n1 - n2) * (0.6666666666666666 - n3) * 6 else n2
			n3 = p4 - 0.3333333333333333

			if n3 < 0 then
				n3 += 1
			end

			if n3 > 1 then
				n3 -= 1
			end

			v20 = if n3 < 0.16666666666666666 then n2 + (n1 - n2) * 6 * n3 else if n3 < 0.5 then n1 else if n3 < 0.6666666666666666 then n2 + (n1 - n2) * (0.6666666666666666 - n3) * 6 else n2
		end

		local v24 = math.max(v16, 0)
		local v25 = math.min(v24, 1)
		local v26 = math.max(v18, 0)

		v24 = math.min(v26, 1)
		v26 = math.max(v20, 0)

		local v27 = math.min(v26, 1)

		return v25, v24, v27
	end
}
