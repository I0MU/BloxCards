



return {
	GetNameColor = function(_, p2)
		local v3 = BrickColor.new("Bright violet").Color
		local v4 = BrickColor.new("Bright orange").Color
		local v5 = BrickColor.new("Bright yellow").Color
		local v6 = BrickColor.new("Light reddish violet").Color

		local function GetNameValue(p3)
			local n1 = 0

			for i = 1, #p3 do
				local v13 = string.sub(p3, i, i)
				local v14 = string.byte(v13)

				v13 = #p3 - i + 1

				if #p3 % 2 == 1 then
					v13 -= 1
				end

				if v13 % 4 >= 2 then
					v14 = -v14
				end

				n1 += v14
			end

			return n1
		end

		local t1: {[any]: any} = {
			Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
			Color3.new(0.00392156862745098, 0.6352941176470588, 1),
			Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
			v3,
			v4,
			v5,
			v6,
			BrickColor.new("Brick yellow").Color
		}

		local function ComputeNameColor(p4)
			local v16 = GetNameValue(p4)

			return t1[(v16 + 0) % #t1 + 1]
		end

		v6 = GetNameValue(p2)

		return t1[(v6 + 0) % #t1 + 1]
	end
}
