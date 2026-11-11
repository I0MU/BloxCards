



local testEnum = require(script.Parent.TestEnum)
local expectation = require(script.Parent.Expectation)

local function newEnvironment(p1, p2)
	local t3: {[any]: any} = {}

	if p2 then
		if type(p2) ~= "table" then
			local v10 = ("Bad argument #2 to newEnvironment. Expected table, got %s"):format((typeof(p2)))

			error(v10, 2)
		end

		for k, v in pairs(p2) do
			t3[k] = v
		end
	end

	local function addChild(p3, p4, p5, p6)
		local v74 = p1:addChild(p3, p5, p6)

		v74.callback = p4

		if p5 == testEnum.NodeType.Describe then
			v74:expand()
		end

		return v74
	end
	function t3.describeFOCUS(p7, p8)
		addChild(p7, p8, testEnum.NodeType.Describe, testEnum.NodeModifier.Focus)
	end
	function t3.describeSKIP(p9, p10)
		addChild(p9, p10, testEnum.NodeType.Describe, testEnum.NodeModifier.Skip)
	end
	function t3.describe(p11, p12, _)
		addChild(p11, p12, testEnum.NodeType.Describe, testEnum.NodeModifier.None)
	end
	function t3.itFOCUS(p14, p15)
		addChild(p14, p15, testEnum.NodeType.It, testEnum.NodeModifier.Focus)
	end
	function t3.itSKIP(p16, p17)
		addChild(p16, p17, testEnum.NodeType.It, testEnum.NodeModifier.Skip)
	end
	function t3.itFIXME(p18, p19)
		local v88 = addChild(p18, p19, testEnum.NodeType.It, testEnum.NodeModifier.Skip)

		warn("FIXME: broken test", v88:getFullName())
	end
	function t3.it(p20, p21, _)
		addChild(p20, p21, testEnum.NodeType.It, testEnum.NodeModifier.None)
	end

	local n1: number = 0

	for k, v in pairs({
		[testEnum.NodeType.BeforeAll] = "beforeAll",
		[testEnum.NodeType.AfterAll] = "afterAll",
		[testEnum.NodeType.BeforeEach] = "beforeEach",
		[testEnum.NodeType.AfterEach] = "afterEach"
	}) do
		t3[v] = function(p23)
			local v93 = v
			local text: string = tostring(n1)

			addChild(v93 .. "_" .. text, p23, k, testEnum.NodeModifier.None)
			n1 += 1
		end
	end

	function t3.FIXME(p24)
		local v96 = p1:getFullName()

		warn("FIXME: broken test", v96, p24 or "")
		p1.modifier = testEnum.NodeModifier.Skip
	end
	function t3.FOCUS()
		p1.modifier = testEnum.NodeModifier.Focus
	end
	function t3.SKIP()
		p1.modifier = testEnum.NodeModifier.Skip
	end
	function t3.HACK_NO_XPCALL()
		warn("HACK_NO_XPCALL is deprecated. It is now safe to yield in an xpcall, so this is no longer necessary. It can be safely deleted.")
	end

	t3.fit = t3.itFOCUS
	t3.xit = t3.itSKIP
	t3.fdescribe = t3.describeFOCUS
	t3.xdescribe = t3.describeSKIP
	t3.expect = setmetatable({
		extend = function(...)
			error("Cannot call \"expect.extend\" from within a \"describe\" node.")
		end
	}, {
		__call = function(_, ...)
			return expectation.new(...)
		end
	})

	return t3
end

local t1: {[any]: any} = {}

t1.__index = t1

function t1.new(p26, p27, p28, p29)
	local t4: {[any]: any} = {
		callback = nil,
		parent = nil,
		plan = p26,
		phrase = p27,
		type = p28,
		modifier = p29 or testEnum.NodeModifier.None,
		children = {}
	}

	t4.environment = newEnvironment(t4, p26.extraEnvironment)

	return (setmetatable(t4, t1))
end
local function getModifier(p30, p31, p32)
	if p31 and (p32 == nil or p32 == testEnum.NodeModifier.None) then
		if p30:match(p31) then
			return testEnum.NodeModifier.Focus
		end

		return testEnum.NodeModifier.Skip
	end

	return p32
end
function t1.addChild(p33, p34, p35, p36)
	if p35 == testEnum.NodeType.It then
		for _, v in pairs(p33.children) do
			if p34 == v.phrase then
				local v31 = v:getFullName()

				error("Duplicate it block found: " .. v31)
			end
		end
	end

	local v32 = p33:getFullName()

	v32 = getModifier(v32 .. " " .. p34, p33.plan.testNamePattern, p36)

	local v33 = t1.new(p33.plan, p34, p35, v32)

	v33.parent = p33
	table.insert(p33.children, v33)

	return v33
end
function t1.getFullName(p37)
	local v35 = p37.parent and p37.parent:getFullName()

	if v35 then
		return v35 .. " " .. p37.phrase
	end

	return p37.phrase
end
function t1.expand(p38)
	local v37 = getfenv(p38.callback)
	local object = setmetatable({}, { __index = v37 })

	for k, v in pairs(p38.environment) do
		object[k] = v
	end

	object.script = v37.script
	setfenv(p38.callback, object)

	local v41, v42 = xpcall(p38.callback, function(p39)
		local debugTraceback = debug.traceback
		local text: string = tostring(p39)

		return debugTraceback(text, 2)
	end)

	if not v41 then
		p38.loadError = v42
	end
end

local module: {[any]: any} = {}

module.__index = module

function module.new(p40, p41)
	return (setmetatable({
		children = {},
		testNamePattern = p40,
		extraEnvironment = p41
	}, module))
end
function module.addChild(p42, p43, p44, p45)
	local v49 = getModifier(p43, p42.testNamePattern, p45)

	v49 = t1.new(p42, p43, p44, v49)
	table.insert(p42.children, v49)

	return v49
end
function module.addRoot(p46, p47, p48)
	local v53 = p46

	for i = #p47, 1, -1 do
		local v55 = nil

		for _, v in ipairs(v53.children) do
			if v.phrase == p47[i] then
				v55 = v

				break
			end
		end

		if v55 == nil then
			v55 = v53:addChild(p47[i], testEnum.NodeType.Describe)
		end

		v53 = v55
	end

	v53.callback = p48
	v53:expand()
end
function module.visitAllNodes(p49, p50, p51, p52)
	local v62 = p52 or 0

	for _, v in ipairs((p51 or p49).children) do
		p50(v, v62)
		p49:visitAllNodes(p50, v, v62 + 1)
	end
end
function module.visualize(p53)
	local t5: {[any]: any} = {}

	p53:visitAllNodes(function(p54, p55)
		local v103 = (" "):rep(3 * p55)

		table.insert(t5, v103 .. p54.phrase)
	end)

	return table.concat(t5, "\n")
end
function module.findNodes(p56, p57)
	local t6: {[any]: any} = {}

	p56:visitAllNodes(function(p58)
		if p57(p58) then
			table.insert(t6, p58)
		end
	end)

	return t6
end

return module
