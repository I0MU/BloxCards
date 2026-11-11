



local expectation = require(script.Expectation)
local testBootstrap = require(script.TestBootstrap)
local testEnum = require(script.TestEnum)
local testPlan = require(script.TestPlan)
local testPlanner = require(script.TestPlanner)
local testResults = require(script.TestResults)
local testRunner = require(script.TestRunner)
local testSession = require(script.TestSession)
local textReporter = require(script.Reporters.TextReporter)
local textReporterQuiet = require(script.Reporters.TextReporterQuiet)
local teamCityReporter = require(script.Reporters.TeamCityReporter)

return {
	run = function(p1, p2)
		local v14 = testBootstrap:getModules(p1)
		local v15 = testPlanner.createPlan(v14)
		local v16 = testRunner.runPlan(v15)

		p2(v16)
	end,
	Expectation = expectation,
	TestBootstrap = testBootstrap,
	TestEnum = testEnum,
	TestPlan = testPlan,
	TestPlanner = testPlanner,
	TestResults = testResults,
	TestRunner = testRunner,
	TestSession = testSession,
	Reporters = {
		TextReporter = textReporter,
		TextReporterQuiet = textReporterQuiet,
		TeamCityReporter = teamCityReporter
	}
}
