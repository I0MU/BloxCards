



local t1: {[any]: any} = {
	["{R}"] = "🔴 ",
	["{G}"] = "🟢 ",
	["{B}"] = "🔵 ",
	["{Y}"] = "🟡 ",
	["{W}"] = "⚪ ",
	["{C1}"] = "🅐 ",
	["{C2}"] = "🅑 ",
	["{C3}"] = "🅒 ",
	["{C4}"] = "🅓 "
}

function FormatText(p1, p2)
	local v4 = p1

	if string.match(v4, " Health%s") ~= nil then
		local parts = string.split(v4, " Health")
		local s1: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#5fff5f\">Health</font>"
		end

		for i = 1, #parts do
			s1 ..= parts[i]
		end

		v4 = s1
	end

	if string.match(v4, " health%s") ~= nil then
		local parts = string.split(v4, " health")
		local s2: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#5fff5f\">Health</font>"
		end

		for i = 1, #parts do
			s2 ..= parts[i]
		end

		v4 = s2
	end

	if string.match(v4, " Health%p") ~= nil then
		local parts = string.split(v4, " Health")
		local s3: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#5fff5f\">Health</font>"
		end

		for i = 1, #parts do
			s3 ..= parts[i]
		end

		v4 = s3
	end

	if string.match(v4, " health%p") ~= nil then
		local parts = string.split(v4, " health")
		local s4: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#5fff5f\">Health</font>"
		end

		for i = 1, #parts do
			s4 ..= parts[i]
		end

		v4 = s4
	end

	if string.match(v4, " Power%s") ~= nil then
		local parts = string.split(v4, " Power")
		local s5: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffb319\">Power</font>"
		end

		for i = 1, #parts do
			s5 ..= parts[i]
		end

		v4 = s5
	end

	if string.match(v4, " power%s") ~= nil then
		local parts = string.split(v4, " power")
		local s6: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffb319\">Power</font>"
		end

		for i = 1, #parts do
			s6 ..= parts[i]
		end

		v4 = s6
	end

	if string.match(v4, " Power%p") ~= nil then
		local parts = string.split(v4, "Power")
		local s7: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffb319\">Power</font>"
		end

		for i = 1, #parts do
			s7 ..= parts[i]
		end

		v4 = s7
	end

	if string.match(v4, " power%p") ~= nil then
		local parts = string.split(v4, " power")
		local s8: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffb319\">Power</font>"
		end

		for i = 1, #parts do
			s8 ..= parts[i]
		end

		v4 = s8
	end

	if string.match(v4, " Crit%s") ~= nil then
		local parts = string.split(v4, " Crit")
		local s9: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#9d03fc\">Crit</font>"
		end

		for i = 1, #parts do
			s9 ..= parts[i]
		end

		v4 = s9
	end

	if string.match(v4, " crit%s") ~= nil then
		local parts = string.split(v4, " crit")
		local s10: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#9d03fc\">Crit</font>"
		end

		for i = 1, #parts do
			s10 ..= parts[i]
		end

		v4 = s10
	end

	if string.match(v4, " Crit%p") ~= nil then
		local parts = string.split(v4, "Crit")
		local s11: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#9d03fc\">Crit</font>"
		end

		for i = 1, #parts do
			s11 ..= parts[i]
		end

		v4 = s11
	end

	if string.match(v4, " crit%p") ~= nil then
		local parts = string.split(v4, " crit")
		local s12: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#9d03fc\">Crit</font>"
		end

		for i = 1, #parts do
			s12 ..= parts[i]
		end

		v4 = s12
	end

	if string.match(v4, " Red%s") ~= nil then
		local parts = string.split(v4, " Red")
		local s13: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ff1919\">Red</font>"
		end

		for i = 1, #parts do
			s13 ..= parts[i]
		end

		v4 = s13
	end

	if string.match(v4, " red%s") ~= nil then
		local parts = string.split(v4, " red")
		local s14: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ff1919\">Red</font>"
		end

		for i = 1, #parts do
			s14 ..= parts[i]
		end

		v4 = s14
	end

	if string.match(v4, " Red%p") ~= nil then
		local parts = string.split(v4, " Red")
		local s15: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ff1919\">Red</font>"
		end

		for i = 1, #parts do
			s15 ..= parts[i]
		end

		v4 = s15
	end

	if string.match(v4, " red%p") ~= nil then
		local parts = string.split(v4, " red")
		local s16: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ff1919\">Red</font>"
		end

		for i = 1, #parts do
			s16 ..= parts[i]
		end

		v4 = s16
	end

	if string.match(v4, " Blue") ~= nil then
		local parts = string.split(v4, " Blue")
		local s17: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#4d49ff\">Blue</font>"
		end

		for i = 1, #parts do
			s17 ..= parts[i]
		end

		v4 = s17
	end

	if string.match(v4, " blue") ~= nil then
		local parts = string.split(v4, " blue")
		local s18: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#4d49ff\">Blue</font>"
		end

		for i = 1, #parts do
			s18 ..= parts[i]
		end

		v4 = s18
	end

	if string.match(v4, " Green") ~= nil then
		local parts = string.split(v4, " Green")
		local s19: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#19ff19\">Green</font>"
		end

		for i = 1, #parts do
			s19 ..= parts[i]
		end

		v4 = s19
	end

	if string.match(v4, " green") ~= nil then
		local parts = string.split(v4, " green")
		local s20: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#19ff19\">Green</font>"
		end

		for i = 1, #parts do
			s20 ..= parts[i]
		end

		v4 = s20
	end

	if string.match(v4, " Yellow") ~= nil then
		local parts = string.split(v4, " Yellow")
		local s21: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffff19\">Yellow</font>"
		end

		for i = 1, #parts do
			s21 ..= parts[i]
		end

		v4 = s21
	end

	if string.match(v4, " yellow") ~= nil then
		local parts = string.split(v4, " yellow")
		local s22: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#ffff19\">Yellow</font>"
		end

		for i = 1, #parts do
			s22 ..= parts[i]
		end

		v4 = s22
	end

	if string.match(v4, " Colourless") ~= nil then
		local parts = string.split(v4, " Colourless")
		local s23: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#b9b9b9\">Colourless</font>"
		end

		for i = 1, #parts do
			s23 ..= parts[i]
		end

		v4 = s23
	end

	if string.match(v4, " colourless") ~= nil then
		local parts = string.split(v4, " colourless")
		local s24: string = ""

		for i = 1, #parts - 1 do
			parts[i] = parts[i] .. " <font color=\"#b9b9b9\">Colourless</font>"
		end

		for i = 1, #parts do
			s24 ..= parts[i]
		end

		v4 = s24
	end

	if p2 then
		for k, v in pairs(t1) do
			if string.match(v4, k) ~= nil then
				local parts = string.split(v4, k)
				local s25: string = ""

				for i = 1, #parts - 1 do
					parts[i] = parts[i] .. v
				end

				for i = 1, #parts do
					s25 ..= parts[i]
				end

				v4 = s25
			end
		end

		return v4
	end

	local t2: {[any]: any} = {
		["{R}"] = "#ff1919",
		["{B}"] = "#4d49ff",
		["{Y}"] = "#ffff19",
		["{G}"] = "#19ff19",
		["{W}"] = "#b9b9b9"
	}

	for _, v in ipairs({ "{R}", "{B}", "{Y}", "{G}", "{W}" }) do
		if string.match(v4, v) ~= nil then
			local parts = string.split(v4, v)
			local s26: string = ""

			for i = 1, #parts - 1 do
				parts[i] = parts[i] .. "<font color=\"" .. t2[v] .. "\">" .. v .. "</font>"
			end

			for i = 1, #parts do
				s26 ..= parts[i]
			end

			v4 = s26
		end
	end

	return v4
end

return { FormatText = FormatText }
