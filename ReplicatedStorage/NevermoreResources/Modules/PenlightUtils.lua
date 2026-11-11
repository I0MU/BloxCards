



local stringFormat = string.format
local stringGsub = string.gsub
local stringByte = string.byte
local osClock = os.clock
local v5 = print
local tableInsert = table.insert
local t1: {[any]: any} = {}

setmetatable({}, {
	__index = function(...)
		error("[Penlight] - Debug is not implimented.")
	end
})

local tableUnpack = table.unpack
local module: {[any]: any} = { _VERSION = "1.1.0", dir_separator = _G.package.config:sub(1, 1) }

function module.printf(p1, ...)
	module.assert_string(1, p1)
	module.fprintf(v5, p1, ...)
end
local function import_symbol(p2, p3, p4, p5)
	if rawget(p2, p3) and p3 ~= "_M" and p3 ~= "_NAME" and p3 ~= "_PACKAGE" and p3 ~= "_VERSION" then
		module.printf("warning: '%s.%s' overrides existing symbol\n", p5, p3)
	end

	rawset(p2, p3, p4)
end
local function lookup_lib(p6, p7)
	for k, v in pairs(p6) do
		if v == p7 then
			return k
		end
	end

	return "?"
end

local t3: {[any]: any} = {}

function module.import(p8, p9)
	local v28 = p9 or _G
	local v29 = p8 or module

	if type(v29) == "string" then
		v29 = require(v29)
	end

	local v30 = lookup_lib(v28, v29)

	if t3[v29] then
		return
	end

	t3[v29] = v30

	for k, v in pairs(v29) do
		import_symbol(v28, k, v, v30)
	end
end

module.patterns = {
	FLOAT = "[%+%-%d]%d*%.?%d*[eE]?[%+%-]?%d*",
	INTEGER = "[+%-%d]%d*",
	IDEN = "[%a_][%w_]*",
	FILE = "[%a%.\\][:%][%w%._%-\\]*"
}

function module.escape(p10)
	module.assert_string(1, p10)

	return (p10:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1"))
end
function module.choose(p11, p12, p13)
	if p11 then
		return p12
	end

	return p13
end
function module.split(p14, p15: string, p16, p17)
	module.assert_string(1, p14)

	local stringFind = string.find
	local stringSub = string.sub
	local tableInsert = table.insert
	local n1 = 1
	local t5: {[any]: any} = {}

	if not p15 then
		p15 = "%s+"
	end

	if p15 == "" then
		return { p14 }
	end

	while true do
		local v46, v47 = stringFind(p14, p15, n1, p16)

		if not v46 then
			break
		end

		local v48 = stringSub(p14, n1, v46 - 1)

		tableInsert(t5, v48)

		if p17 and p17 == #t5 then
			t5[#t5] = stringSub(p14, n1)

			return t5
		end

		n1 = v47 + 1
	end

	local v49 = stringSub(p14, n1)

	if v49 ~= "" then
		tableInsert(t5, v49)
	end

	if #t5 == 1 and t5[1] == "" then
		return {}
	end

	return t5
end
function module.splitv(p18, p19)
	return tableUnpack(module.split(p18, p19))
end
function module.array_tostring(p20, p21, p22)
	local t6 = p21 or {}

	for i = 1, #p20 do
		t6[i] = (p22 or tostring)(p20[i], i)
	end

	return t6
end

if module.lua51 then
	function module.load(p23, p24, _, p26)
		local v61 = nil
		local v62 = nil

		if type(p23) == "string" then
			local v63, v64 = loadstring(p23, p24)

			v61 = v63
			v62 = v64
		else
			error("[Penlight] - Something happened, but lua51_load is not supported")
		end

		if v61 and p26 then
			setfenv(v61, p26)
		end

		return v61, v62
	end
else
	module.load = loadstring
end

if not table.pack then
	table.pack = _G.pack
end

if not rawget(_G, "pack") then
	_G.pack = table.pack
end

function module.memoize(p27)
	return (setmetatable({}, {
		__index = function(p28, p29, ...)
			local v118 = p27(p29, ...)

			p28[p29] = v118

			return v118
		end,
		__call = function(p30, p31)
			return p30[p31]
		end
	}))
end
function module.is_callable(p32)
	local u67 = true

	if type(p32) ~= "function" then
		u67 = getmetatable(p32)

		if u67 then
			u67 = getmetatable(p32).__call
		end
	end

	return u67
end
function module.is_type(p33, p34)
	if type(p34) == "string" then
		local typeName: string = type(p33)

		return p34 == typeName
	end

	local v71 = getmetatable(p33)

	return p34 == v71
end
function module.type(p35)
	local typeName: string = type(p35)

	if typeName == "table" or typeName == "userdata" then
		return getmetatable(p35)._name or "unknown " .. typeName
	end

	return typeName
end
function module.is_integer(p36)
	local roundedUp = math.ceil(p36)

	return p36 == roundedUp
end

module.stdmt = {
	List = { _name = "List" },
	Map = { _name = "Map" },
	Set = { _name = "Set" },
	MultiMap = { _name = "MultiMap" }
}

local t4: {[any]: any} = {}

function module.add_function_factory(p37, p38)
	t4[p37] = p38
end

module.string_lambda = module.memoize(function(p39)
	local raise = module.raise

	if not p39:find("^|") and not p39:find("_") then
		return raise("not a string lambda")
	end

	local v80, v81 = p39:match("|([^|]*)|(.+)")

	if p39:find("_") then
		v80 = "_"
		v81 = p39
	elseif not v80 then
		return raise("bad string lambda")
	end

	local v82, v83 = loadstring("return function(" .. v80 .. ") return " .. v81 .. " end")

	if not v82 then
		return raise(v83)
	end

	return (v82())
end)

local u14 = nil

function module.function_arg(p40, p41, p42: string)
	module.assert_arg(1, p40, "number")

	local typeName: string = type(p41)

	if typeName == "function" then
		return p41
	end

	if typeName == "string" then
		if not u14 then
			u14 = require("pl.operator").optable
		end

		local v88 = u14[p41]

		if v88 then
			return v88
		end

		local v89, v90 = module.string_lambda(p41)

		if not v89 then
			error(v90 .. ": " .. p41)
		end

		return v89
	end

	if typeName == "table" or typeName == "userdata" then
		local v91 = getmetatable(p41)

		if not v91 then
			error("not a callable object", 2)
		end

		local v92 = t4[v91]

		if not v92 then
			if not v91.__call then
				error("not a callable object", 2)
			end

			return p41
		end

		return v92(p41)
	end

	if not p42 then
		p42 = " must be callable"
	end

	if p40 > 0 then
		error("argument " .. p40 .. ": " .. p42, 2)

		return
	end

	error(p42, 2)
end
function module.bind1(p43, p44)
	local u95 = module.function_arg(1, p43)

	return function(...)
		return u95(p44, ...)
	end
end
function module.bind2(p45, p46)
	local u98 = module.function_arg(1, p45)

	return function(p47, ...)
		return u98(p47, p46, ...)
	end
end
function module.assert_arg(p48, p49, p50, p51, p52, p53)
	local typeName: string = type(p49)

	if p50 ~= typeName then
		local typeName2: string = type(p49)
		local v107 = ("argument %d expected a '%s', got a '%s'"):format(p48, p50, typeName2)

		error(v107, p53 or 2)
	end

	if p51 and not p51(p49) then
		local v108 = ("argument %d: '%s' %s"):format(p48, p49, p52)

		error(v108, p53 or 2)
	end
end
function module.assert_string(p54, p55)
	module.assert_arg(p54, p55, "string", nil, nil, 3)
end

local s1 = "default"

function module.on_error(p56)
	local t7: {[any]: any} = { default = 1, quit = 2, error = 3 }

	if t7[p56] then
		s1 = p56

		return
	end

	if s1 == "default" then
		s1 = "error"
	end

	local raise = module.raise
	local text: string = tostring(p56)

	raise("Bad argument expected string; 'default', 'quit', or 'error'. Got '" .. text .. "'")
end
function module.raise(p57)
	if s1 == "default" then
		return nil, p57
	end

	if s1 == "quit" then
		module.quit(p57)

		return
	end

	error(p57, 2)
end

local raise = module.raise

return module
