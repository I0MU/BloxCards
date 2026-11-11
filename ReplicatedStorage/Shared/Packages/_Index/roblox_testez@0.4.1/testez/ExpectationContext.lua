



local expectation = require(script.Parent.Expectation)
local expectationCheckMatcherNameCollisions = expectation.checkMatcherNameCollisions

local function copy(p1)
	local t2: {[any]: any} = {}

	for k, v in pairs(p1) do
		t2[k] = v
	end

	return t2
end

local module: {[any]: any} = {}

module.__index = module

function module.new(p2)
	local t3

	if p2 then
		t3 = {}

		for k, v in pairs(p2._extensions) do
			t3[k] = v
		end
	end

	if not p2 or not t3 then
		t3 = {}
	end

	return (setmetatable({ _extensions = t3 }, module))
end
function module.startExpectationChain(p3, ...)
	return expectation.new(...):extend(p3._extensions)
end
function module.extend(p4, p5)
	for k, v in pairs(p5) do
		assert(p4._extensions[k] == nil, string.format("Cannot reassign %q in expect.extend", k))

		local v18 = expectationCheckMatcherNameCollisions(k)

		assert(v18, string.format("Cannot overwrite matcher %q; it already exists", k))
		p4._extensions[k] = v
	end
end

return module
