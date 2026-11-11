



local testEnum = require(script.Parent.TestEnum)
local testSession = require(script.Parent.TestSession)
local lifecycleHooks = require(script.Parent.LifecycleHooks)

local function wrapExpectContextWithPublicApi(p1)
	return (setmetatable({
		extend = function(...)
			p1:extend(...)
		end
	}, {
		__call = function(_, ...)
			return p1:startExpectationChain(...)
		end
	}))
end

local module: {[any]: any} = {
	environment = {}
}

function module.runPlan(p3)
	local v8 = testSession.new(p3)
	local v9 = lifecycleHooks.new()

	v8.hasFocusNodes = #p3:findNodes(function(p4)
		return p4.modifier == testEnum.NodeModifier.Focus
	end) > 0
	module.runPlanNode(v8, p3, v9)

	return v8:finalize()
end
function module.runPlanNode(p5, p6, p7)
	local function runCallback(p8, p9)
		local u32: boolean = true
		local u33 = nil

		_G.__TESTEZ_RUNNING_TEST__ = true

		local u34 = p9 or ""
		local v35 = getfenv(p8)

		for k, v in pairs(module.environment) do
			v35[k] = v
		end

		function v35.fail(p10: string)
			if p10 == nil then
				p10 = "fail() was called."
			end

			u32 = false

			local v53 = u34
			local debugTraceback = debug.traceback
			local text: string = tostring(p10)
			local v56 = debugTraceback(text, 2)

			u33 = v53 .. v56
		end

		v35.expect = wrapExpectContextWithPublicApi(p5:getExpectationContext())

		local v38 = p5:getContext()

		local v39, v40 = xpcall(function()
			p8(v38)
		end, function(p11)
			local v58 = u34
			local debugTraceback = debug.traceback
			local text: string = tostring(p11)
			local v61 = debugTraceback(text, 2)

			return v58 .. v61
		end)

		if not v39 then
			u32 = false
			u33 = v40
		end

		_G.__TESTEZ_RUNNING_TEST__ = nil

		return u32, u33
	end
	local function runNode(p12)
		for _, v in ipairs(p7:getBeforeEachHooks()) do
			local v44, v45 = runCallback(v, "beforeEach hook: ")

			if not v44 then
				return false, v45
			end
		end

		local v46, v47 = runCallback(p12.callback)

		for _, v in ipairs(p7:getAfterEachHooks()) do
			local v50, v51 = runCallback(v, "afterEach hook: ")

			if not v50 then
				if not v46 then
					return false, v47 .. "\nWhile cleaning up the failed test another error was found:\n" .. v51
				end

				return false, v51
			end
		end

		if not v46 then
			return false, v47
		end

		return true, nil
	end

	p7:pushHooksFrom(p6)

	local u15: boolean = false

	for _, v in ipairs(p7:getBeforeAllHooks()) do
		local v18, v19 = runCallback(v, "beforeAll hook: ")

		if not v18 then
			p5:addDummyError("beforeAll", v19)
			u15 = true
		end
	end

	if not u15 then
		for _, v in ipairs(p6.children) do
			if v.type == testEnum.NodeType.It then
				p5:pushNode(v)

				if p5:shouldSkip() then
					p5:setSkipped()
				else
					local v22, v23 = runNode(v)

					if v22 then
						p5:setSuccess()
					else
						p5:setError(v23)
					end
				end

				p5:popNode()
			elseif v.type == testEnum.NodeType.Describe then
				p5:pushNode(v)
				module.runPlanNode(p5, v, p7)

				if v.loadError then
					p5:setError("Error during planning: " .. v.loadError)
				else
					p5:setStatusFromChildren()
				end

				p5:popNode()
			end
		end
	end

	for _, v in ipairs(p7:getAfterAllHooks()) do
		local v26, v27 = runCallback(v, "afterAll hook: ")

		if not v26 then
			p5:addDummyError("afterAll", v27)
		end
	end

	p7:popHooks()
end

return module
