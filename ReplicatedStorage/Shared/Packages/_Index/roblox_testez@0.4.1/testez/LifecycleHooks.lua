



local testEnum = require(script.Parent.TestEnum)
local module: {[any]: any} = {}

module.__index = module

function module.new()
	return (setmetatable({
		_stack = {}
	}, module))
end
function module.getBeforeEachHooks(p1)
	local beforeEach = testEnum.NodeType.BeforeEach
	local t2: {[any]: any} = {}

	for _, v in ipairs(p1._stack) do
		for _, iterValue in ipairs(v[beforeEach]) do
			table.insert(t2, iterValue)
		end
	end

	return t2
end
function module.getAfterEachHooks(p2)
	local afterEach = testEnum.NodeType.AfterEach
	local t3: {[any]: any} = {}

	for _, v in ipairs(p2._stack) do
		for _, iterValue in ipairs(v[afterEach]) do
			table.insert(t3, 1, iterValue)
		end
	end

	return t3
end
function module.popHooks(p3)
	table.remove(p3._stack, #p3._stack)
end
function module.pushHooksFrom(p4, p5)
	assert(p5 ~= nil)

	local _stack = p4._stack
	local beforeAll = testEnum.NodeType.BeforeAll
	local v22 = p4:_getHooksOfType(p5.children, testEnum.NodeType.BeforeAll)
	local afterAll = testEnum.NodeType.AfterAll
	local v24 = p4:_getHooksOfType(p5.children, testEnum.NodeType.AfterAll)
	local beforeEach = testEnum.NodeType.BeforeEach
	local v26 = p4:_getHooksOfType(p5.children, testEnum.NodeType.BeforeEach)
	local afterEach = testEnum.NodeType.AfterEach
	local v28 = p4:_getHooksOfType(p5.children, testEnum.NodeType.AfterEach)

	table.insert(_stack, {
		[beforeAll] = v22,
		[afterAll] = v24,
		[beforeEach] = v26,
		[afterEach] = v28
	})
end
function module.getBeforeAllHooks(p6)
	return p6._stack[#p6._stack][testEnum.NodeType.BeforeAll]
end
function module.getAfterAllHooks(p7)
	return p7._stack[#p7._stack][testEnum.NodeType.AfterAll]
end
function module._getHooksOfType(_, p9, p10)
	local t4: {[any]: any} = {}

	for _, v in ipairs(p9) do
		if p10 == v.type then
			table.insert(t4, v.callback)
		end
	end

	return t4
end

return module
