



local t1: {[any]: any} = {
	to = true,
	be = true,
	been = true,
	have = true,
	was = true,
	at = true
}
local t2: {[any]: any} = { never = true }

local function assertLevel(p1, p2, p3)
	if not p1 then
		error(p2 or "Assertion failed!", (p3 or 1) + 1)
	end
end
local function bindSelf(p4, p5)
	return function(p6, ...)
		if p6 == p4 then
			return p5(p4, ...)
		end

		return p5(p4, p6, ...)
	end
end
local function formatMessage(p7, p8, p9)
	if p7 then
		return p8
	end

	return p9
end

local module: {[any]: any} = {}

function module.new(p10)
	local t4: {[any]: any} = {
		successCondition = true,
		condition = false,
		value = p10,
		matchers = {},
		_boundMatchers = {}
	}

	setmetatable(t4, module)

	local a = t4.a

	function t4.a(p11, ...)
		if p11 == t4 then
			return a(t4, ...)
		end

		return a(t4, p11, ...)
	end

	t4.an = t4.a

	local ok = t4.ok

	function t4.ok(p12, ...)
		if p12 == t4 then
			return ok(t4, ...)
		end

		return ok(t4, p12, ...)
	end

	local equal = t4.equal

	function t4.equal(p13, ...)
		if p13 == t4 then
			return equal(t4, ...)
		end

		return equal(t4, p13, ...)
	end

	local throw = t4.throw

	function t4.throw(p14, ...)
		if p14 == t4 then
			return throw(t4, ...)
		end

		return throw(t4, p14, ...)
	end

	local near = t4.near

	function t4.near(p15, ...)
		if p15 == t4 then
			return near(t4, ...)
		end

		return near(t4, p15, ...)
	end

	return t4
end
function module.checkMatcherNameCollisions(p16)
	if not t1[p16] and not t2[p16] and not module[p16] then
		return true
	end

	return false
end
function module.extend(p17, p18)
	p17.matchers = p18 or {}

	for k, v in pairs(p17.matchers) do
		local function v27(_, ...)
			local v85 = v(p17.value, ...)

			if v85.pass ~= p17.successCondition then
				error(v85.message or "Assertion failed!", (3 or 1) + 1)
			end

			p17:_resetModifiers()

			return p17
		end

		p17._boundMatchers[k] = function(p20, ...)
			if p20 == p17 then
				return v27(p17, ...)
			end

			return v27(p17, p20, ...)
		end
	end

	return p17
end
function module.__index(p21, p22)
	if t1[p22] then
		return p21
	end

	if t2[p22] then
		local v30 = module.new(p21.value):extend(p21.matchers)

		v30.successCondition = not p21.successCondition

		return v30
	end

	if p21._boundMatchers[p22] then
		return p21._boundMatchers[p22]
	end

	return module[p22]
end
function module._resetModifiers(p23)
	p23.successCondition = true
end
function module.a(p24, p25)
	local typeName: string = type(p24.value)
	local u35: boolean = p25 == typeName == p24.successCondition
	local successCondition = p24.successCondition
	local text: string = tostring(p24.value)
	local typeName2: string = type(p24.value)
	local v39 = ("Expected value of type %q, got value %q of type %s"):format(p25, text, typeName2)
	local text2: string = tostring(p24.value)
	local typeName3: string = type(p24.value)
	local v42 = ("Expected value not of type %q, got value %q of type %s"):format(p25, text2, typeName3)

	if not u35 then
		error((if successCondition then v39 else v42) or "Assertion failed!", (3 or 1) + 1)
	end

	p24:_resetModifiers()

	return p24
end

module.an = module.a

function module.ok(p26)
	local u44: boolean = p26.value ~= nil == p26.successCondition
	local successCondition = p26.successCondition
	local v46 = ("Expected value %q to be non-nil"):format((tostring(p26.value)))
	local v47 = ("Expected value %q to be nil"):format((tostring(p26.value)))

	if not u44 then
		error((if successCondition then v46 else v47) or "Assertion failed!", (3 or 1) + 1)
	end

	p26:_resetModifiers()

	return p26
end
function module.equal(p27, p28)
	local u50: boolean = p28 == p27.value == p27.successCondition
	local successCondition = p27.successCondition
	local text: string = tostring(p28)
	local typeName: string = type(p28)
	local text3: string = tostring(p27.value)
	local typeName4: string = type(p27.value)
	local v56 = ("Expected value %q (%s), got %q (%s) instead"):format(text, typeName, text3, typeName4)
	local text4: string = tostring(p28)
	local typeName5: string = type(p28)
	local v59 = ("Expected anything but value %q (%s)"):format(text4, typeName5)

	if not u50 then
		error((if successCondition then v56 else v59) or "Assertion failed!", (3 or 1) + 1)
	end

	p27:_resetModifiers()

	return p27
end
function module.near(p29, p30, p31)
	local typeName: string = type(p29.value)

	assert(typeName == "number", "Expectation value must be a number to use 'near'")

	local typeName6: string = type(p30)

	assert(typeName6 == "number", "otherValue must be a number")

	local u65: boolean = true

	if type(p31) ~= "number" then
		u65 = p31 == nil
	end

	assert(u65, "limit must be a number or nil")

	local v66 = p31 or 1E-7
	local absoluteValue = math.abs(p29.value - p30)
	local u68: boolean = v66 >= absoluteValue == p29.successCondition
	local successCondition = p29.successCondition
	local v70 = ("Expected value to be near %f (within %f) but got %f instead"):format(p30, v66, p29.value)
	local v71 = ("Expected value to not be near %f (within %f) but got %f instead"):format(p30, v66, p29.value)

	if not u68 then
		error((if successCondition then v70 else v71) or "Assertion failed!", (3 or 1) + 1)
	end

	p29:_resetModifiers()

	return p29
end
function module.throw(p32, p33)
	local ok, result = pcall(p32.value)
	local u76: boolean = ok ~= p32.successCondition

	if p33 and not ok then
		u76 = if p32.successCondition then result:find(p33, 1, true) ~= nil else result:find(p33, 1, true) == nil
	end

	local v77 = if p33 then if p32.successCondition then ("Expected function to throw an error containing %q, but it %s"):format(p33, result and ("threw: %s"):format(result) or "did not throw.") else ("Expected function to never throw an error containing %q, but it threw: %s"):format(p33, (tostring(result))) else if p32.successCondition then "Expected function to throw an error, but it did not throw." else ("Expected function to succeed, but it threw an error: %s"):format((tostring(result)))

	if not u76 then
		error(v77 or "Assertion failed!", (3 or 1) + 1)
	end

	p32:_resetModifiers()

	return p32
end

return module
