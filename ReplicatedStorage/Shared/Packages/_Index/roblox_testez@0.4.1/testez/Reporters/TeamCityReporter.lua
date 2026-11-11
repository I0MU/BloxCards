



local testService: TestService = game:GetService("TestService")
local testEnum = require(script.Parent.Parent.TestEnum)

local function teamCityEscape(p1)
	local v13 = string.gsub(p1, "([]|'[])", "|%1")

	v13 = string.gsub(v13, "\r", "|r")

	return (string.gsub(v13, "\n", "|n"))
end
local function teamCityEnterSuite(p2)
	local stringFormat = string.format
	local v16 = string.gsub(p2, "([]|'[])", "|%1")

	v16 = string.gsub(v16, "\r", "|r")
	v16 = string.gsub(v16, "\n", "|n")

	return stringFormat("##teamcity[testSuiteStarted name='%s']", v16)
end
local function teamCityLeaveSuite(p3)
	local stringFormat = string.format
	local v19 = string.gsub(p3, "([]|'[])", "|%1")

	v19 = string.gsub(v19, "\r", "|r")
	v19 = string.gsub(v19, "\n", "|n")

	return stringFormat("##teamcity[testSuiteFinished name='%s']", v19)
end
local function teamCityEnterCase(p4)
	local stringFormat = string.format
	local v22 = string.gsub(p4, "([]|'[])", "|%1")

	v22 = string.gsub(v22, "\r", "|r")
	v22 = string.gsub(v22, "\n", "|n")

	return stringFormat("##teamcity[testStarted name='%s']", v22)
end
local function teamCityLeaveCase(p5)
	local stringFormat = string.format
	local v25 = string.gsub(p5, "([]|'[])", "|%1")

	v25 = string.gsub(v25, "\r", "|r")
	v25 = string.gsub(v25, "\n", "|n")

	return stringFormat("##teamcity[testFinished name='%s']", v25)
end
local function teamCityFailCase(p6, p7)
	local stringFormat = string.format
	local v29 = string.gsub(p6, "([]|'[])", "|%1")

	v29 = string.gsub(v29, "\r", "|r")
	v29 = string.gsub(v29, "\n", "|n")

	local v30 = string.gsub(p7, "([]|'[])", "|%1")

	v30 = string.gsub(v30, "\r", "|r")
	v30 = string.gsub(v30, "\n", "|n")

	return stringFormat("##teamcity[testFailed name='%s' message='%s']", v29, v30)
end
local function reportNode(p8, p9, p10)
	local t1 = p9 or {}

	if p8.status == testEnum.TestStatus.Skipped then
		return t1
	end

	if p8.planNode.type == testEnum.NodeType.Describe then
		table.insert(t1, teamCityEnterSuite(p8.planNode.phrase))

		for _, v in ipairs(p8.children) do
			reportNode(v, t1, (p10 or 0) + 1)
		end

		table.insert(t1, teamCityLeaveSuite(p8.planNode.phrase))

		return
	end

	table.insert(t1, teamCityEnterCase(p8.planNode.phrase))

	if p8.status == testEnum.TestStatus.Failure then
		table.insert(t1, teamCityFailCase(p8.planNode.phrase, table.concat(p8.errors, "\n")))
	end

	table.insert(t1, teamCityLeaveCase(p8.planNode.phrase))
end
local function reportRoot(p11)
	local t2: {[any]: any} = {}

	for _, v in ipairs(p11.children) do
		reportNode(v, t2, 0)
	end

	return t2
end
local function report(p12)
	local v42 = reportRoot(p12)

	return table.concat(v42, "\n")
end

return {
	report = function(p13)
		local v44 = reportRoot(p13)
		local v45 = table.concat(v44, "\n")

		print(table.concat({
			"Test results:",
			v45,
			("%d passed, %d failed, %d skipped"):format(p13.successCount, p13.failureCount, p13.skippedCount)
		}, "\n"))

		if p13.failureCount > 0 then
			print(("%d test nodes reported failures."):format(p13.failureCount))
		end

		if #p13.errors > 0 then
			print("Errors reported by tests:")
			print("")

			for _, v in ipairs(p13.errors) do
				testService:Error(v)
				print("")
			end
		end
	end
}
