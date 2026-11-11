



local testEnum = require(script.Parent.TestEnum)
local testResults = require(script.Parent.TestResults)
local context = require(script.Parent.Context)
local expectationContext = require(script.Parent.ExpectationContext)
local module: {[any]: any} = {}

module.__index = module

function module.new(p1)
	local t2: {[any]: any} = {
		hasFocusNodes = false,
		results = testResults.new(p1),
		nodeStack = {},
		contextStack = {},
		expectationContextStack = {}
	}

	setmetatable(t2, module)

	return t2
end
function module.calculateTotals(p2)
	local results = p2.results

	results.successCount = 0
	results.failureCount = 0
	results.skippedCount = 0
	results:visitAllNodes(function(p3)
		local status = p3.status

		if p3.planNode.type == testEnum.NodeType.It then
			if status == testEnum.TestStatus.Success then
				results.successCount = results.successCount + 1
			elseif status == testEnum.TestStatus.Failure then
				results.failureCount = results.failureCount + 1
			elseif status == testEnum.TestStatus.Skipped then
				results.skippedCount = results.skippedCount + 1
			end

			return
		end
	end)
end
function module.gatherErrors(p4)
	local results = p4.results

	results.errors = {}
	results:visitAllNodes(function(p5)
		if #p5.errors > 0 then
			for _, v in ipairs(p5.errors) do
				table.insert(results.errors, v)
			end
		end
	end)
end
function module.finalize(p6)
	if #p6.nodeStack ~= 0 then
		error("Cannot finalize TestResults with nodes still on the stack!", 2)
	end

	p6:calculateTotals()
	p6:gatherErrors()

	return p6.results
end
function module.pushNode(p7, p8)
	local v15 = testResults.createNode(p8)

	table.insert((p7.nodeStack[#p7.nodeStack] or p7.results).children, v15)
	table.insert(p7.nodeStack, v15)

	local v16 = context.new(p7.contextStack[#p7.contextStack])

	table.insert(p7.contextStack, v16)
	v16 = expectationContext.new(p7.expectationContextStack[#p7.expectationContextStack])
	table.insert(p7.expectationContextStack, v16)
end
function module.popNode(p9)
	assert(#p9.nodeStack > 0, "Tried to pop from an empty node stack!")
	table.remove(p9.nodeStack, #p9.nodeStack)
	table.remove(p9.contextStack, #p9.contextStack)
	table.remove(p9.expectationContextStack, #p9.expectationContextStack)
end
function module.getContext(p10)
	assert(#p10.contextStack > 0, "Tried to get context from an empty stack!")

	return p10.contextStack[#p10.contextStack]
end
function module.getExpectationContext(p11)
	assert(#p11.expectationContextStack > 0, "Tried to get expectationContext from an empty stack!")

	return p11.expectationContextStack[#p11.expectationContextStack]
end
function module.shouldSkip(p12)
	if p12.hasFocusNodes then
		for i = #p12.nodeStack, 1, -1 do
			local v22 = p12.nodeStack[i]

			if v22.planNode.modifier == testEnum.NodeModifier.Skip then
				return true
			end

			if v22.planNode.modifier == testEnum.NodeModifier.Focus then
				return false
			end
		end

		return true
	end

	for i = #p12.nodeStack, 1, -1 do
		if p12.nodeStack[i].planNode.modifier == testEnum.NodeModifier.Skip then
			return true
		end
	end

	return false
end
function module.setSuccess(p13)
	assert(#p13.nodeStack > 0, "Attempting to set success status on empty stack")
	p13.nodeStack[#p13.nodeStack].status = testEnum.TestStatus.Success
end
function module.setSkipped(p14)
	assert(#p14.nodeStack > 0, "Attempting to set skipped status on empty stack")
	p14.nodeStack[#p14.nodeStack].status = testEnum.TestStatus.Skipped
end
function module.setError(p15, p16)
	assert(#p15.nodeStack > 0, "Attempting to set error status on empty stack")

	local v28 = p15.nodeStack[#p15.nodeStack]

	v28.status = testEnum.TestStatus.Failure
	table.insert(v28.errors, p16)
end
function module.addDummyError(p17, p18, p19)
	p17:pushNode({ type = testEnum.NodeType.It, phrase = p18 })
	p17:setError(p19)
	p17:popNode()
	p17.nodeStack[#p17.nodeStack].status = testEnum.TestStatus.Failure
end
function module.setStatusFromChildren(p20)
	assert(#p20.nodeStack > 0, "Attempting to set status from children on empty stack")

	local v33 = p20.nodeStack[#p20.nodeStack]
	local v34 = testEnum.TestStatus.Success
	local u35: boolean = true

	for _, v in ipairs(v33.children) do
		if v.status ~= testEnum.TestStatus.Skipped then
			u35 = false

			if v.status == testEnum.TestStatus.Failure then
				v34 = testEnum.TestStatus.Failure
			end
		end
	end

	if u35 then
		v34 = testEnum.TestStatus.Skipped
	end

	v33.status = v34
end

return module
