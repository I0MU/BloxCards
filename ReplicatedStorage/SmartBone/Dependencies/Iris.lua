



require(script.Types)

local module: {[any]: any} = {}
local v2 = require(script.Internal)(module)

module.Disabled = false
module.Args = {}
module.Events = {}

function module.HasInit()
	return v2._started
end
function module.Init(p1: Instance, p2)
	if p1 == nil then
		p1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	end

	if p2 == nil then
		p2 = game:GetService("RunService").Heartbeat
	end

	v2.parentInstance = p1
	assert(v2._started == false, "Iris.Init can only be called once.")
	v2._started = true
	v2._generateRootInstance()
	v2._generateSelectionImageObject()
	task.spawn(function()
		if typeof(p2) == "function" then
			while true do
				p2()
				v2._cycle()
			end
		end

		if p2 ~= nil then
			p2:Connect(function()
				v2._cycle()
			end)
		end
	end)

	return module
end
function module.Connect(_, p4)
	if v2._started == false then
		warn("Iris:Connect() was called before calling Iris.Init(), the connected function will never run")
	end

	table.insert(v2._connectedFunctions, p4)
end
function module.Append(p5)
	local v8 = v2._GetParentWidget()
	local v10

	if v2._config.Parent then
		v10 = v2._config.Parent
	else
		v10 = v2._widgets[v8.type].ChildAdded(v8, { type = "userInstance" })
	end

	p5.Parent = v10
end
function module.End()
	if v2._stackIndex == 1 then
		error("Callback has too many calls to Iris.End()", 2)
	end

	v2._IDStack[v2._stackIndex] = nil

	local v11 = v2

	v11._stackIndex = v11._stackIndex - 1
end
function module.ForceRefresh()
	v2._globalRefreshRequested = true
end
function module.UpdateGlobalConfig(p6)
	for iterFirst, iterSecond in p6 do
		v2._rootConfig[iterFirst] = iterSecond
	end

	module.ForceRefresh()
end
function module.PushConfig(p7)
	local v16 = module.State(-1)

	if v16.value == -1 then
		v16:set(p7)
	elseif v2._deepCompare(v16:get(), p7) == false then
		v2._localRefreshActive = true
		v16:set(p7)
	end

	v2._config = setmetatable(p7, { __index = v2._config })
end
function module.PopConfig()
	v2._localRefreshActive = false
	v2._config = getmetatable(v2._config).__index
end

module.TemplateConfig = require(script.config)
module.UpdateGlobalConfig(module.TemplateConfig.colorDark)
module.UpdateGlobalConfig(module.TemplateConfig.sizeDefault)
module.UpdateGlobalConfig(module.TemplateConfig.utilityDefault)
v2._globalRefreshRequested = false

function module.PushId(p8)
	local typeName: string = typeof(p8)

	assert(typeName == "string", "Iris expected Iris.PushId id to PushId to be a string.")
	v2._pushedId = tostring(p8)
end
function module.PopId()
	v2._pushedId = nil
end
function module.SetNextWidgetID(p9)
	v2._nextWidgetId = p9
end
function module.State(p10)
	local v21 = v2._getID(2)

	if v2._states[v21] then
		return v2._states[v21]
	end

	v2._states[v21] = {
		value = p10,
		ConnectedWidgets = {},
		ConnectedFunctions = {}
	}
	setmetatable(v2._states[v21], v2.StateClass)

	return v2._states[v21]
end
function module.WeakState(p11)
	local v23 = v2._getID(2)
	local t2
	local t3
	local t4

	if not v2._states[v23] then
		t2 = {}
		t3 = {}
		t4 = { value = p11, ConnectedWidgets = t2, ConnectedFunctions = t3 }
		v2._states[v23] = t4
		setmetatable(v2._states[v23], v2.StateClass)

		return v2._states[v23]
	end

	if #v2._states[v23].ConnectedWidgets == 0 then
		v2._states[v23] = nil
		t2 = {}
		t3 = {}
		t4 = { value = p11, ConnectedWidgets = t2, ConnectedFunctions = t3 }
		v2._states[v23] = t4
		setmetatable(v2._states[v23], v2.StateClass)

		return v2._states[v23]
	end

	return v2._states[v23]
end
function module.ComputedState(p12, p13)
	local v29 = v2._getID(2)

	if v2._states[v29] then
		return v2._states[v29]
	end

	v2._states[v29] = {
		value = p13(p12.value),
		ConnectedWidgets = {},
		ConnectedFunctions = {}
	}
	p12:onChange(function(p14)
		v2._states[v29]:set(p13(p14))
	end)
	setmetatable(v2._states[v29], v2.StateClass)

	return v2._states[v29]
end

module.ShowDemoWindow = require(script.demoWindow)(module)
require(script.widgets)(v2)
require(script.API)(module)

return module
