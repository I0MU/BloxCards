



local testService: TestService = game:GetService("TestService")
local testEnum = require(script.Parent.Parent.TestEnum)
local v3 = (" "):rep(3)

local function compareNodes(p1, p2)
	local lowerText = p1.planNode.phrase:lower()
	local lowerText2 = p2.planNode.phrase:lower()

	return lowerText < lowerText2
end

local t1: {[any]: any} = {
	[testEnum.TestStatus.Success] = "+",
	[testEnum.TestStatus.Failure] = "-",
	[testEnum.TestStatus.Skipped] = "~"
}

local function reportNode(p3, p4, p5)
	local t2 = p4 or {}
	local v17 = p5 or 0

	if p3.status == testEnum.TestStatus.Skipped then
		return t2
	end

	local v18

	if p3.status then
		v18 = ("%s[%s] %s"):format(v3:rep(v17), t1[p3.status] or "?", p3.planNode.phrase)
	else
		v18 = ("%s%s"):format(v3:rep(v17), p3.planNode.phrase)
	end

	table.insert(t2, v18)
	table.sort(p3.children, compareNodes)

	for _, v in ipairs(p3.children) do
		reportNode(v, t2, v17 + 1)
	end

	return t2
end
local function reportRoot(p6)
	local t3: {[any]: any} = {}

	table.sort(p6.children, compareNodes)

	for _, v in ipairs(p6.children) do
		reportNode(v, t3, 0)
	end

	return t3
end
local function report(p7)
	local v26 = reportRoot(p7)

	return table.concat(v26, "\n")
end

return {
	report = function(p8)
		local v28 = reportRoot(p8)
		local v29 = table.concat(v28, "\n")

		print(table.concat({
			"Test results:",
			v29,
			("%d passed, %d failed, %d skipped"):format(p8.successCount, p8.failureCount, p8.skippedCount)
		}, "\n"))

		if p8.failureCount > 0 then
			print(("%d test nodes reported failures."):format(p8.failureCount))
		end

		if #p8.errors > 0 then
			print("Errors reported by tests:")
			print("")

			for _, v in ipairs(p8.errors) do
				testService:Error(v)
				print("")
			end
		end
	end
}
