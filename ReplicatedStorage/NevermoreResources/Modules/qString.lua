



local function CompareStrings(p1, p2)
	local lowerText = string.lower(p1)
	local lowerText2 = string.lower(p2)

	return lowerText == lowerText2
end
local function CompareCutFirst(p3, p4)
	local substring = string.lower(p3):sub(1, #p4)
	local lowerText = string.lower(p4)

	return substring == lowerText
end
local function CutoutPrefix(p5, p6)
	return p5:sub(#p6 + 1)
end

local t1: {[any]: any} = {}

setmetatable(t1, { __mode = "k" })

local function BreakString(p7, list)
	local v25 = list
	local v26 = list

	if type(list) ~= "string" then
		if t1[list] then
			v25 = t1[list]
			v26 = list[1]
		else
			local s1: string = "["

			for _, v in pairs(list) do
				if #v == 1 then
					s1 = s1 .. "%" .. v
					v26 = v
				else
					error("A Seperator must be 1 character, it was " .. #v .. " characters long.")
				end
			end

			v25 = s1 .. "]"
			t1[list] = v25
		end
	elseif #list ~= 1 then
		error("Seperator must be 1  character, it was " .. #list .. " characters long.")
	end

	local t2: {[any]: any} = {}

	for iterValue in string.gmatch(p7 .. v26, ".-" .. v25) do
		if not (#iterValue <= 1) then
			t2[#t2 + 1] = iterValue:sub(1, #iterValue - 1)
		end
	end

	return t2
end
local function TrimString(p9, p10)
	local v34 = p10 or "%s"

	return (p9:gsub("^" .. v34 .. "*(.-)" .. v34 .. "*$", "%1"))
end
local function TrimStringFront(p11, p12)
	local v37 = p12 or "%s"

	return (p11:gsub("^" .. v37 .. "*(.-)" .. v37 .. "*", "%1"))
end
local function GetRestOfSemiTokenizedString(p13, list, p15)
	local n1: number = 0
	local n2: number = 0
	local v43 = list
	local v44 = list

	if type(list) ~= "string" then
		if t1[list] then
			v43 = t1[list]
			v44 = list[1]
		else
			local s1: string = "["

			for _, v in pairs(list) do
				if #v == 1 then
					s1 = s1 .. "%" .. v
					v44 = v
				else
					error("A Seperator must be 1 character, it was " .. #v .. " characters long.")
				end
			end

			v43 = s1 .. "]"
			t1[list] = v43
		end
	elseif #list ~= 1 then
		error("Seperator must be 1  character, it was " .. #list .. " characters long.")
	end

	for iterValue in string.gmatch(p13 .. v44, ".-" .. v43) do
		if not (#iterValue <= 1) then
			n2 += #iterValue
			n1 += 1

			if p15 <= n1 then
				local v49 = v43 or "%s"

				return (p13:sub(n2):gsub("^" .. v49 .. "*(.-)" .. v49 .. "*", "%1"))
			end
		else
			n2 += 1
		end
	end
end
local function IsWhitespace(p16)
	local v51 = string.match(p16, "[%s]+")

	return p16 == v51
end
local function DumbElipseLimit(p17: string, p18)
	if p18 < #p17 then
		p17 = p17:sub(1, p18 - 3) .. "..."
	end

	return p17
end
local function CheckNumOfCharacterInString(p19, p20)
	local n1: number = 0

	for iterValue in string.gmatch(p19, p20) do
		n1 += 1
	end

	return n1
end
local function GetRomanNumeral(p22)
	if type(p22) == "number" then
		local t3: {[any]: any} = {
			1000,
			900,
			500,
			400,
			100,
			90,
			50,
			40,
			10,
			9,
			5,
			4,
			1
		}
		local t4: {[any]: any} = {
			"M",
			"CM",
			"D",
			"CD",
			"C",
			"XC",
			"L",
			"XL",
			"X",
			"IX",
			"V",
			"IV",
			"I"
		}
		local s1: string = ""

		if p22 < 0 or p22 >= 4000 then
			return nil
		end

		if p22 == 0 then
			return "N"
		end

		for i = 1, 13 do
			while p22 >= t3[i] do
				p22 -= t3[i]
				s1 ..= t4[i]
			end
		end

		return s1
	end

	if type(p22 == "string") then
		local upperText = string.upper(p22)
		local t5: {[any]: any} = {
			I = 1,
			V = 5,
			X = 10,
			L = 50,
			C = 100,
			D = 500,
			M = 1000
		}
		local t6: {[any]: any} = { I = 1, X = 10, C = 100 }

		if upperText == "N" then
			return 0
		end

		local n1: number = 0

		for iterValue in string.gmatch(upperText, "V") do
			n1 += 1
		end

		if not (n1 >= 2) then
			local n2: number = 0

			for iterValue2 in string.gmatch(upperText, "L") do
				n2 += 1
			end

			if not (n2 >= 2) then
				local n3: number = 0

				for iterValue3 in string.gmatch(upperText, "D") do
					n3 += 1
				end

				if n3 >= 2 then
					print("Rule 4")

					return nil
				end

				local s2 = "Z"
				local n4: number = 1

				for i = 1, #upperText do
					local v75 = string.sub(upperText, i, i)

					if not t5[v75] then
						print("Invalid Numeral")

						return nil
					end

					if v75 == s2 then
						n4 += 1

						if n4 >= 4 then
							print("Rule 4 (Second check)")

							return nil
						end
					else
						n4 = 1
					end

					s2 = v75
				end

				local n5: number = 1
				local t7: {[any]: any} = {}
				local n6 = 1000

				while n5 <= #upperText do
					local v79 = string.sub(upperText, n5, n5)
					local v80 = t5[v79]

					if n6 < v80 then
						print("Rule 3")

						return nil
					end

					if n5 <= #upperText - 1 then
						local v81 = string.sub(upperText, n5 + 1, n5 + 1)
						local v82 = t5[v81]

						if v80 < v82 then
							if not t6[v79] or v82 > v80 * 10 then
								print("Rule 3 (Second check)")

								return nil
							end

							local n7: number = 0

							for iterValue4 in string.gmatch(upperText, v79) do
								n7 += 1
							end

							if n7 > 3 then
								print("Rule 3 (Second check)")

								return nil
							end

							n6 = v80 - 1
							v80 = v82 - v80
							n5 += 1
						end
					end

					t7[#t7 + 1] = v80
					n5 += 1
				end

				for i = 1, #t7 - 1 do
					print(i .. " : " .. t7[i])

					if t7[i] < t7[i + 1] then
						print("Rule 5")

						return nil
					end
				end

				local n8 = 0

				for _, v in pairs(t7) do
					n8 += v
				end

				return n8
			end

			print("Rule 4")

			return nil
		end

		print("Rule 4")

		return nil
	end
end

return {
	CompareStrings = CompareStrings,
	compareStrings = CompareStrings,
	compare_strings = CompareStrings,
	Compare = CompareStrings,
	compare = CompareStrings,
	CompareCutFirst = CompareCutFirst,
	compareCutFirst = CompareCutFirst,
	compare_cut_first = CompareCutFirst,
	breakString = BreakString,
	BreakString = BreakString,
	break_string = BreakString,
	TrimString = TrimString,
	trimString = TrimString,
	trim_string = TrimString,
	TrimStringFront = TrimStringFront,
	trimStringFront = TrimStringFront,
	trim_stream_front = TrimStringFront,
	GetRestOfSemiTokenizedString = GetRestOfSemiTokenizedString,
	getRestOfSemiTokenizedString = GetRestOfSemiTokenizedString,
	get_rest_of_semi_tokenized_string = GetRestOfSemiTokenizedString,
	isWhitespace = IsWhitespace,
	IsWhitespace = IsWhitespace,
	is_whitespace = IsWhitespace,
	DumbElipseLimit = DumbElipseLimit,
	dumbElipseLimit = DumbElipseLimit,
	CheckNumOfCharacterInString = CheckNumOfCharacterInString,
	checkNumOfCharacterInString = CheckNumOfCharacterInString,
	CommaValue = function(p21)
		local v90 = p21

		repeat
			local v91, v92 = string.gsub(v90, "^(-?%d+)(%d%d%d)", "%1,%2")

			v90 = v91
		until v92 == 0

		return v90
	end,
	GetRomanNumeral = GetRomanNumeral,
	getRomanNumeral = GetRomanNumeral
}
