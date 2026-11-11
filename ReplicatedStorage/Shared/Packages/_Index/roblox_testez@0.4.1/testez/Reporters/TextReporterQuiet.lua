



local testService: TestService = game:GetService("TestService")
local testEnum = require(script.Parent.Parent.TestEnum)
local v3 = (" "):rep(3)
local t1: {[any]: any} = {
	[testEnum.TestStatus.Success] = "+",
	[testEnum.TestStatus.Failure] = "-",
	[testEnum.TestStatus.Skipped] = "~"
}

local function reportNode(p1, p2, p3)
	local t2 = p2 or {}
	local v12 = p3 or 0

	if p1.status == testEnum.TestStatus.Skipped then
		return t2
	end

	local v13 = nil

	if p1.status ~= testEnum.TestStatus.Success then
		v13 = ("%s[%s] %s"):format(v3:rep(v12), t1[p1.status] or "?", p1.planNode.phrase)
	end

	table.insert(t2, v13)

	for _, v in ipairs(p1.children) do
		reportNode(v, t2, v12 + 1)
	end

	return t2
end
local function reportRoot(p4)
	local t3: {[any]: any} = {}

	for _, v in ipairs(p4.children) do
		reportNode(v, t3, 0)
	end

	return t3
end
local function report(p5)
	local v21 = reportRoot(p5)

	return table.concat(v21, "\n")
end

return {
	report = function(p6)
		local v23 = reportRoot(p6)
		local v24 = table.concat(v23, "\n")

		print(table.concat({
			"Test results:",
			v24,
			("%d passed, %d failed, %d skipped"):format(p6.successCount, p6.failureCount, p6.skippedCount)
		}, "\n"))

		if p6.failureCount > 0 then
			print(("%d test nodes reported failures."):format(p6.failureCount))
		end

		if #p6.errors > 0 then
			print("Errors reported by tests:")
			print("")

			for _, v in ipairs(p6.errors) do
				testService:Error(v)
				print("")
			end
		end
	end
}
