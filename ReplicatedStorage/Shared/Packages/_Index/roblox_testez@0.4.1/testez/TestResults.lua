



local testEnum = require(script.Parent.TestEnum)
local success = testEnum.TestStatus.Success
local failure = testEnum.TestStatus.Failure
local skipped = testEnum.TestStatus.Skipped
local module: {[any]: any} = {}

module.__index = module

function module.new(p1)
	local t3: {[any]: any} = {
		successCount = 0,
		failureCount = 0,
		skippedCount = 0,
		planNode = p1,
		children = {},
		errors = {}
	}

	setmetatable(t3, module)

	return t3
end
function module.createNode(p2)
	return {
		status = nil,
		planNode = p2,
		children = {},
		errors = {}
	}
end
function module.visitAllNodes(p3, p4, p5)
	for _, v in ipairs((p5 or p3).children) do
		p4(v)
		p3:visitAllNodes(p4, v)
	end
end

local t2: {[any]: any} = { [success] = "+", [failure] = "-", [skipped] = "~" }

function module.visualize(p6, p7, p8)
	local v18 = p8 or 0
	local t4: {[any]: any} = {}

	for _, v in ipairs((p7 or p6).children) do
		if v.planNode.type == testEnum.NodeType.It then
			local v22 = ("%s[%s] %s"):format((" "):rep(3 * v18), t2[v.status] or "?", v.planNode.phrase)

			if v.messages and #v.messages > 0 then
				local v23 = (" "):rep(3 * v18)
				local tableConcat = table.concat
				local vMessages = v.messages
				local v26 = (" "):rep(3 * v18)
				local v27 = tableConcat(vMessages, "\n " .. v26)

				v22 = v22 .. "\n " .. v23 .. v27
			end

			table.insert(t4, v22)
		else
			local v28 = ("%s%s"):format((" "):rep(3 * v18), v.planNode.phrase or "")

			if v.status then
				local v29 = (" (%s)"):format(v.status)

				v28 ..= v29
			end

			table.insert(t4, v28)

			if #v.children > 0 then
				local v30 = p6:visualize(v, v18 + 1)

				table.insert(t4, v30)
			end
		end
	end

	return table.concat(t4, "\n")
end

return module
