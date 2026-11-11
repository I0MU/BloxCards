



local testPlanner = require(script.Parent.TestPlanner)
local testRunner = require(script.Parent.TestRunner)
local textReporter = require(script.Parent.Reporters.TextReporter)

local function stripSpecSuffix(p1)
	return (p1:gsub("%.spec$", ""))
end
local function isSpecScript(p2)
	return p2:IsA("ModuleScript") and p2.Name:match("%.spec$")
end
local function getPath(p3, p4)
	local v12 = p4 or game
	local t1: {[any]: any} = {}
	local v14 = p3

	if v14.Name == "init.spec" then
		v14 = v14.Parent
	end

	while v14 ~= nil and v14 ~= v12 do
		local replacedText = v14.Name:gsub("%.spec$", "")

		table.insert(t1, replacedText)
		v14 = v14.Parent
	end

	local replacedText2 = v12.Name:gsub("%.spec$", "")

	table.insert(t1, replacedText2)

	return t1
end
local function toStringPath(p5)
	local s1 = ""
	local u19: boolean = true

	for _, v in ipairs(p5) do
		if u19 then
			s1 = v
			u19 = false
		else
			s1 = v .. " " .. s1
		end
	end

	return s1
end

return {
	getModulesImpl = function(_, p7, p8, p9)
		local t2 = p8 or {}
		local v27 = p9 or p7
		local v28 = v27:IsA("ModuleScript")

		if v28 then
			v28 = v27.Name:match("%.spec$")
		end

		if v28 then
			local v29 = require(v27)
			local v30 = getPath(v27, p7)
			local s1 = ""
			local u32: boolean = true

			for _, v in ipairs(v30) do
				if u32 then
					s1 = v
					u32 = false
				else
					s1 = v .. " " .. s1
				end
			end

			local lowerText = s1:lower()

			table.insert(t2, { method = v29, path = v30, pathStringForSorting = lowerText })
		end
	end,
	getModules = function(p10, p11)
		local t3: {[any]: any} = {}

		p10:getModulesImpl(p11, t3)

		for _, v in ipairs(p11:GetDescendants()) do
			p10:getModulesImpl(p11, t3, v)
		end

		return t3
	end,
	run = function(p12, p13, p14, p15)
		local t4 = p15 or {}
		local v46 = t4.showTimingInfo or false
		local testNamePattern = t4.testNamePattern
		local t5 = t4.extraEnvironment or {}

		if type(p13) ~= "table" then
			local v49 = ("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(p13)))

			error(v49, 2)
		end

		local timestamp = tick()
		local t6: {[any]: any} = {}

		for _, v in ipairs(p13) do
			local v54 = p12:getModules(v)

			for _, iterValue in ipairs(v54) do
				table.insert(t6, iterValue)
			end
		end

		local timestamp2 = tick()
		local v58 = testPlanner.createPlan(t6, testNamePattern, t5)
		local timestamp3 = tick()

		t5 = testRunner.runPlan(v58)

		local timestamp4 = tick();

		(p14 or textReporter).report(t5)

		local timestamp5 = tick()

		if v46 then
			local v62 = ("Took %f seconds to locate test modules"):format(timestamp2 - timestamp)
			local v63 = ("Took %f seconds to create test plan"):format(timestamp3 - timestamp2)
			local v64 = ("Took %f seconds to run tests"):format(timestamp4 - timestamp3)

			print(table.concat({
				v62,
				v63,
				v64,
				("Took %f seconds to report tests"):format(timestamp5 - timestamp4)
			}, "\n"))
		end

		return t5
	end
}
