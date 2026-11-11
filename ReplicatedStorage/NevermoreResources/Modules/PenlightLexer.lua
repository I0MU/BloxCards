



local coroutineYield = coroutine.yield
local coroutineWrap = coroutine.wrap
local stringFind = string.find
local stringSub = string.sub
local tableInsert = table.insert

local function assert_arg(p1, p2, p3)
	local typeName: string = type(p2)

	if p3 ~= typeName then
		error("argument " .. p1 .. " must be " .. p3, 2)
	end
end

local u7 = nil
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil

local function tdump(p4)
	return coroutineYield(p4, p4)
end
local function ndump(p5: number?, p6)
	if p6 and p6.number then
		p5 = tonumber(p5)
	end

	return coroutineYield("number", p5)
end
local function sdump(p7, p8)
	if p8 and p8.string then
		p7 = p7:sub(2, -2)
	end

	return coroutineYield("string", p7)
end
local function sdump_l(p9, p10)
	if p10 and p10.string then
		p9 = p9:sub(3, -3)
	end

	return coroutineYield("string", p9)
end
local function chdump(p11, p12)
	if p12 and p12.string then
		p11 = p11:sub(2, -2)
	end

	return coroutineYield("char", p11)
end
local function cdump(p13)
	return coroutineYield("comment", p13)
end
local function wsdump(p14)
	return coroutineYield("space", p14)
end
local function pdump(p15)
	return coroutineYield("prepro", p15)
end
local function plain_vdump(p16)
	return coroutineYield("iden", p16)
end
local function lua_vdump(p17)
	if u10[p17] then
		return coroutineYield("keyword", p17)
	end

	return coroutineYield("iden", p17)
end
local function cpp_vdump(p18)
	if u11[p18] then
		return coroutineYield("keyword", p18)
	end

	return coroutineYield("iden", p18)
end

local module: {[any]: any} = {}

function module.scan(p19, p20, p21, p22)
	local u49 = false

	if type(p19) ~= "string" then
		u49 = p19
	end

	local t2 = p21 or { space = true }
	local t3 = p22 or { number = true, string = true }

	if t2 then
		if t2.space then
			t2[wsdump] = true
		end

		if t2.comments then
			t2[cdump] = true
		end
	end

	if not p20 then
		u7 = {
			{ "^%s+", wsdump },
			{ "^0x[%da-fA-F]+", ndump },
			{ "^[%a_][%w_]*", plain_vdump },
			{ "^[%+%-]?%d+%.?%d*[eE][%+%-]?%d+", ndump },
			{ "^[%+%-]?%d+%.?%d*", ndump },
			{ "^((['\"])%2)", sdump },
			{ "^(['\\\"]).-\\\\%1", sdump },
			{ "^(['\\\"]).-[^\\]%1", sdump },
			{ "^.", tdump }
		}
		p20 = u7
	end

	return coroutineWrap(function()
		local v101 = nil
		local n1: number = 1

		if u49 then
			p19 = u49:read() .. "\n"
		end

		local n2: number = #p19
		local n3 = 1

		while true do
			for _, v in ipairs(p20) do
				local v107 = v[2]
				local v108, v109 = stringFind(p19, v[1], n3)
				local v110 = v108
				local v111 = v109

				if v110 then
					local v112 = stringSub(p19, v110, v111)

					n3 = v111 + 1

					if not t2 or not t2[v107] then
						module.finished = n2 < n3

						local v113, v114 = v107(v112, t3)

						v101 = v113
					end

					if v101 then
						local typeName: string = type(v101)

						if typeName == "table" then
							coroutineYield("", "")

							for _, iterValue in ipairs(v101) do
								coroutineYield(iterValue[1], iterValue[2])
							end
						elseif typeName == "string" then
							local v118, v119 = stringFind(p19, v101, n3)
							local v120 = v118
							local v121 = v119

							if v120 then
								local v122 = stringSub(p19, v120, v121)

								n3 = v121 + 1
								coroutineYield("", v122)
							else
								coroutineYield("", "")
								n3 = n2 + 1
							end
						else
							coroutineYield(n1, n3)
						end
					end

					if not (n2 < n3) then
						break
					end

					if not u49 then
						return
					end

					n1 += 1
					p19 = u49:read()

					if not p19 then
						return
					end

					p19 ..= "\n"
					n3 = 1
					n2 = #p19

					break
				end
			end

			continue
		end
	end)
end
local function isstring(p23)
	return type(p23) == "string"
end
function module.insert(p24, p25, p26)
	if not p25 then
		return
	end

	local t4

	if type(p25) == "string" and type(p26) == "string" then
		t4 = { { p25, p26 } }
	elseif type(p25) == "function" then
		t4 = {}

		for iterFirst, iterSecond in p25() do
			tableInsert(t4, { iterFirst, iterSecond })
		end
	else
		t4 = p25
	end

	p24(t4)
end
function module.getline(p27)
	local v61, v62 = p27(".-\n")

	return v62
end
function module.lineno(p28)
	return p28(0)
end
function module.getrest(p29)
	local v65, v66 = p29(".+")

	return v66
end
function module.get_keywords()
	if not u10 then
		u10 = {
			["and"] = true,
			["break"] = true,
			["do"] = true,
			["else"] = true,
			["elseif"] = true,
			["end"] = true,
			["false"] = true,
			["for"] = true,
			["function"] = true,
			["if"] = true,
			["in"] = true,
			["local"] = true,
			["nil"] = true,
			["not"] = true,
			["or"] = true,
			["repeat"] = true,
			["return"] = true,
			["then"] = true,
			["true"] = true,
			["until"] = true,
			["while"] = true
		}
	end

	return u10
end
function module.lua(p30, p31, p32)
	module.get_keywords()

	if not u8 then
		u8 = {
			{ "^%s+", wsdump },
			{ "^0x[%da-fA-F]+", ndump },
			{ "^[%a_][%w_]*", lua_vdump },
			{ "^%d+%.?%d*[eE][%+%-]?%d+", ndump },
			{ "^%d+%.?%d*", ndump },
			{ "^((['\"])%2)", sdump },
			{ "^(['\\\"]).-\\\\%1", sdump },
			{ "^(['\\\"]).-[^\\]%1", sdump },
			{ "^%-%-%[%[.-%]%]", cdump },
			{ "^%-%-.-\n", cdump },
			{ "^%[%[.-%]%]", sdump_l },
			{ "^==", tdump },
			{ "^~=", tdump },
			{ "^<=", tdump },
			{ "^>=", tdump },
			{ "^%.%.%.", tdump },
			{ "^%.%.", tdump },
			{ "^.", tdump }
		}
	end

	return module.scan(p30, u8, p31 or { space = true, comments = true }, p32)
end
function module.cpp(p33, p34, p35)
	if not u11 then
		u11 = {
			class = true,
			["break"] = true,
			["do"] = true,
			sizeof = true,
			["else"] = true,
			continue = true,
			struct = true,
			["false"] = true,
			["for"] = true,
			public = true,
			void = true,
			private = true,
			protected = true,
			["goto"] = true,
			["if"] = true,
			static = true,
			const = true,
			typedef = true,
			enum = true,
			char = true,
			int = true,
			bool = true,
			long = true,
			float = true,
			["true"] = true,
			delete = true,
			double = true,
			["while"] = true,
			new = true,
			namespace = true,
			try = true,
			catch = true,
			switch = true,
			case = true,
			extern = true,
			["return"] = true,
			default = true,
			unsigned = true,
			signed = true,
			union = true,
			volatile = true,
			register = true,
			short = true
		}
	end

	if not u9 then
		u9 = {
			{ "^%s+", wsdump },
			{ "^#.-[^\\]\n", pdump },
			{ "^0x[%da-fA-F]+", ndump },
			{ "^[%a_][%w_]*", cpp_vdump },
			{ "^%d+%.?%d*[eE][%+%-]?%d+", ndump },
			{ "^%d+%.?%d*", ndump },
			{ "^((['\"])%2)", sdump },
			{ "^(['\\\"]).-[^\\]%1", chdump },
			{ "^//.-\n", cdump },
			{ "^/%*.-%*/", cdump },
			{ "^==", tdump },
			{ "^!=", tdump },
			{ "^<=", tdump },
			{ "^>=", tdump },
			{ "^->", tdump },
			{ "^&&", tdump },
			{ "^||", tdump },
			{ "^%+%+", tdump },
			{ "^%-%-", tdump },
			{ "^%+=", tdump },
			{ "^%-=", tdump },
			{ "^%*=", tdump },
			{ "^/=", tdump },
			{ "^|=", tdump },
			{ "^%^=", tdump },
			{ "^::", tdump },
			{ "^.", tdump }
		}
	end

	return module.scan(p33, u9, p34 or { comments = true }, p35)
end
function module.get_separated_list(p36, p37, p38)
	local u76 = p37 or ")"
	local t5: {[any]: any} = {}
	local n1: number = 1
	local t6: {[any]: any} = {}

	local function tappend(p39, p40, p41)
		tableInsert(p39, { p40, p41 or p40 })
	end

	local v81: (...any) -> ...any = if u76 == "\n" then function(p42, p43)
		local u128 = false

		if p42 == "space" then
			u128 = p43:find("\n")
		end

		return u128
	end else function(p44)
		return p44 == u76
	end

	while true do
		local v82, v83 = p36()
		local v84 = v82
		local v85 = v83

		if not v84 then
			break
		end

		local t7

		if not v81(v84, v85) or n1 ~= 1 then
			if v84 == "(" then
				n1 += 1
				tableInsert(t6, { "(", nil or "(" })
			elseif v84 == ")" then
				n1 -= 1

				if n1 == 0 then
					tableInsert(t5, t6)
					t7 = { v84, v85 }

					return t5, t7
				end

				tableInsert(t6, { ")", nil or ")" })
			elseif v84 == (p38 or ",") and n1 == 1 then
				tableInsert(t5, t6)
				t6 = {}
			else
				tableInsert(t6, { v84, v85 or v84 })
			end

			continue
		end

		tableInsert(t5, t6)
		t7 = { v84, v85 }

		return t5, t7
	end

	return nil, "EOS"
end
function module.skipws(p45)
	local v88, v89 = p45()

	while v88 == "space" do
		local v90, v91 = p45()

		v88 = v90
		v89 = v91
	end

	return v88, v89
end

local skipws = module.skipws

function module.expecting(p46, p47, p48)
	if type(p46) ~= "function" then
		error("argument " .. 1 .. " must be " .. "function", 2)
	end

	if type(p47) ~= "string" then
		error("argument " .. 2 .. " must be " .. "string", 2)
	end

	local v95
	local v96

	if p48 then
		local v97, v98 = p46()

		v95 = v97
		v96 = v98
	else
		local v99, v100 = skipws(p46)

		v95 = v99
		v96 = v100
	end

	if v95 ~= p47 then
		error("expecting " .. p47, 2)
	end

	return v96
end

return module
