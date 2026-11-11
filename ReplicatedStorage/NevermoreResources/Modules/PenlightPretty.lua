



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local tableInsert = table.insert
local tableConcat = table.concat
local penlightLexer = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("PenlightLexer")

local function assert_arg(p1, p2, p3, p4, p5, p6)
	local typeName: string = type(p2)

	if p3 ~= typeName then
		local typeName2: string = type(p2)
		local v27 = ("argument %d expected a '%s', got a '%s'"):format(p1, p3, typeName2)

		error(v27, p6 or 2)
	end

	if p4 and not p4(p2) then
		local v28 = ("argument %d: '%s' %s"):format(p1, p2, p5)

		error(v28, p6 or 2)
	end
end
local function load(p7, p8, _, p10)
	local v33 = nil
	local v34 = nil

	if type(p7) == "string" then
		local v35, v36 = loadstring(p7, p8)

		v33 = v35
		v34 = v36
	else
		error("[Penlight] - Something happened, but lua51_load is not supported")
	end

	if v33 and p10 then
		setfenv(v33, p10)
	end

	return v33, v34
end
local function save_string_index()
	local v37 = getmetatable("")

	if v37 then
		v37.old__index = v37.__index
		v37.__index = nil
	end

	return v37
end
local function restore_string_index(p11)
	if p11 then
		p11.__index = p11.old__index
	end
end
local function quote_if_necessary(p16: string)
	if not p16 then
		return ""
	end

	if p16:find(" ") then
		p16 = "\"" .. p16 .. "\""
	end

	return p16
end

local u10 = nil

local function is_identifier(p17)
	local u41 = false

	if type(p17) == "string" then
		u41 = p17:find("^[%a_][%w_]*$") and not u10[p17]
	end

	return u41
end

local module: {[any]: any} = {
	read = function(p12)
		assert_arg(1, p12, "string")

		if p12:find("^%s*%-%-") then
			p12 = p12:gsub("%-%-.-\n", "")
		end

		if not p12:find("^%s*%b{}%s*$") then
			return nil, "not a Lua table"
		end

		if p12:find("[^'\"%w_]function[^'\"%w_]") then
			for iterFirst, iterSecond in penlightLexer.lua(p12), nil, nil do
				if iterFirst == "keyword" then
					return nil, "cannot have functions in table definition"
				end
			end
		end

		local v45, v46 = load("return " .. p12, "tbl", "t", {})

		if not v45 then
			return nil, v46
		end

		local v47 = save_string_index()
		local ok, result = pcall(v45)

		restore_string_index(v47)

		if ok then
			return result
		end

		return nil, result
	end,
	load = function(p13, p14, p15)
		local t4 = p14 or {}

		if p15 then
			for iterFirst, iterSecond in penlightLexer.lua(p13), nil, nil do
				if iterFirst == "keyword" and (iterSecond == "for" or iterSecond == "repeat" or iterSecond == "function" or iterSecond == "goto") then
					return nil, "looping not allowed"
				end
			end
		end

		local v56, v57 = load(p13, "tbl", "t", t4)

		if not v56 then
			return nil, v57
		end

		local v58 = p15 and save_string_index()
		local ok, result = pcall(v56)

		restore_string_index(v58)

		if not ok then
			return nil, result
		end

		return t4
	end
}

local function quote(p18)
	if type(p18) == "table" then
		return module.write(p18, "")
	end

	return ("%q"):format((tostring(p18)))
end
local function index(p19, p20)
	if not p19 then
		p20 = quote(p20)
	end

	return "[" .. p20 .. "]"
end
local function write(p21, p22, p23)
	if type(p21) == "table" then
		if not u10 then
			u10 = penlightLexer.get_keywords()
		end

		local s1: string = " = "

		if p22 == "" then
			s1 = "="
		end

		local u68 = p22 or "  "
		local t5: {[any]: any} = {}
		local s2: string = ""
		local t6: {[any]: any} = {}

		local function put(p24)
			if #p24 > 0 then
				s2 ..= p24
			end
		end
		local function putln(p25)
			if #s2 > 0 then
				s2 ..= p25
				tableInsert(t5, s2)
				s2 = ""

				return
			end

			tableInsert(t5, p25)
		end
		local function eat_last_comma()
			local n1: number = #t5

			if t5[n1]:sub(-1, -1) == "," then
				t5[n1] = t5[n1]:sub(1, -2)
			end
		end

		local u75 = nil

		u75 = function(p26, p27, p28)
			local typeName: string = type(p26)

			if typeName ~= "string" and typeName ~= "table" then
				local text: string = tostring(p26)
				local v95 = quote_if_necessary(text)

				putln(v95 .. ",")

				return
			end

			if typeName == "string" then
				if p26:find("\n") then
					putln("[[\n" .. p26 .. "]],")

					return
				end

				local v96 = quote(p26)

				putln(v96 .. ",")

				return
			end

			if typeName ~= "table" then
				local text: string = tostring(p26)

				putln(text .. ",")

				return
			end

			if t6[p26] then
				putln("<cycle>,")

				return
			end

			t6[p26] = true

			local s2: string = p28 .. u68

			putln("{")

			local t7: {[any]: any} = {}

			if not p23 then
				for i, v in ipairs(p26) do
					put(p28)
					u75(v, p28, s2)
					t7[i] = true
				end
			end

			for k, v in pairs(p26) do
				local u104: boolean = type(k) == "number"

				if p23 then
					local text: string = tostring(k)
					local v106 = index(u104, text)

					put(p28 .. v106 .. s1)
					u75(v, p28, s2)
				elseif not u104 or not t7[k] then
					if u104 or not is_identifier(k) then
						k = index(u104, k)
					end

					put(p28 .. k .. s1)
					u75(v, p28, s2)
				end
			end

			t6[p26] = nil
			eat_last_comma()
			putln(p27 .. "},")
		end
		u75(p21, "", u68)
		eat_last_comma()

		return tableConcat(t5, if #u68 > 0 then "\n" else "")
	end

	local text: string = tostring(p21)

	if type(p21) == "string" then
		return quote(p21)
	end

	return text, "not a table"
end

module.write = write
module.Write = write
module.tableToString = write
module.TableToString = write

local t2: {[any]: any} = { "B", "KiB", "MiB", "GiB" }
local t3: {[any]: any} = { "", "K", "M", "B" }
local u18 = nil

u18 = function(p29)
	local floored = math.floor(p29 / 1000)

	if floored > 0 then
		return u18(floored) .. "," .. p29 % 1000
	end

	return (tostring(p29))
end

function module.number(p30, p31, p32)
	if p31 == "T" then
		return u18(p30)
	end

	local n1
	local v83

	if p31 == "M" then
		n1 = 1024
		v83 = t2
	else
		n1 = 1000
		v83 = t3
	end

	local n2 = n1
	local n3: number = 1

	while p30 >= n2 and n3 <= #v83 do
		n2 *= n1
		n3 += 1
	end

	local n4 = n2 / n1

	if n3 > #v83 then
		n3 -= 1
		n4 /= n1
	end

	if n3 > 1 then
		return ("%." .. (p32 or 1) .. "f%s"):format(p30 / n4, v83[n3] or "duh")
	end

	return p30 .. v83[1]
end

return module
