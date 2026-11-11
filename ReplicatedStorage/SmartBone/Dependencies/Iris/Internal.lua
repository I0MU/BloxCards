



require(script.Parent.Types)

return function(p1)
	local internal: {[any]: any} = {
		_started = false,
		_cycleTick = 0,
		_globalRefreshRequested = false,
		_localRefreshActive = false,
		_widgets = {},
		_widgetCount = 0,
		_stackIndex = 1,
		_rootInstance = nil
	}

	internal._rootWidget = {
		ID = "R",
		type = "Root",
		ZIndex = 0,
		Instance = internal._rootInstance
	}
	internal._lastWidget = internal._rootWidget
	internal._rootConfig = {}
	internal._config = internal._rootConfig
	internal._IDStack = { "R" }
	internal._usedIDs = {}
	internal._pushedId = nil
	internal._nextWidgetId = nil
	internal._states = {}
	internal._postCycleCallbacks = {}
	internal._connectedFunctions = {}
	internal._cycleCoroutine = coroutine.create(function()
		while true do
			for iterFirst, iterSecond in internal._connectedFunctions, nil, nil do
				debug.profilebegin("Iris/Connection")

				local ok, result = pcall(iterSecond)

				debug.profileend()

				if not ok then
					internal._stackIndex = 1
					coroutine.yield(false, result)
				end

				if internal._stackIndex ~= 1 then
					internal._stackIndex = 1
					error("Callback has too few calls to Iris.End()", 0)
				end
			end

			coroutine.yield(true)
		end
	end)

	local stateClass: {[any]: any} = {}

	stateClass.__index = stateClass

	function stateClass.get(p2)
		return p2.value
	end
	function stateClass.set(p3, p4)
		if p4 == p3.value then
			return p3.value
		end

		p3.value = p4

		for iterFirst, iterSecond in p3.ConnectedWidgets, nil, nil do
			internal._widgets[iterSecond.type].UpdateState(iterSecond)
		end

		for iterFirst2, iterSecond2 in p3.ConnectedFunctions, nil, nil do
			iterSecond2(p4)
		end

		return p3.value
	end
	function stateClass.onChange(p5, p6)
		table.insert(p5.ConnectedFunctions, p6)
	end

	internal.StateClass = stateClass

	function internal._cycle()
		if p1.Disabled then
			return
		end

		internal._rootWidget.lastCycleTick = internal._cycleTick

		if internal._rootInstance == nil or internal._rootInstance.Parent == nil then
			p1.ForceRefresh()
		end

		for iterFirst, iterSecond in internal._lastVDOM, nil, nil do
			if iterSecond.lastCycleTick ~= internal._cycleTick then
				internal._DiscardWidget(iterSecond)
			end
		end

		internal._lastVDOM = internal._VDOM
		internal._VDOM = internal._generateEmptyVDOM()
		task.spawn(function()
			for iterFirst, iterSecond in internal._postCycleCallbacks, nil, nil do
				iterSecond()
			end
		end)

		if internal._globalRefreshRequested then
			internal._generateSelectionImageObject()
			internal._globalRefreshRequested = false

			for iterFirst2, iterSecond2 in internal._lastVDOM, nil, nil do
				internal._DiscardWidget(iterSecond2)
			end

			internal._generateRootInstance()
			internal._lastVDOM = internal._generateEmptyVDOM()
		end

		local v21 = internal

		v21._cycleTick = v21._cycleTick + 1
		internal._widgetCount = 0
		table.clear(internal._usedIDs)

		if internal.parentInstance:IsA("GuiBase2d") and math.min(internal.parentInstance.AbsoluteSize.X, internal.parentInstance.AbsoluteSize.Y) < 100 then
			error("Iris Parent Instance is too small")
		end

		if (internal.parentInstance:IsA("GuiBase2d") or internal.parentInstance:IsA("CoreGui") or internal.parentInstance:IsA("PluginGui") or internal.parentInstance:IsA("PlayerGui")) == false then
			error("Iris Parent Instance cant contain GUI")
		end

		if game:GetService("RunService"):IsStudio() then
			for iterFirst3, iterSecond3 in internal._connectedFunctions, nil, nil do
				iterSecond3()
			end

			return
		end

		v21 = coroutine.status(internal._cycleCoroutine)

		if v21 == "suspended" then
			local v24, v25, v26 = coroutine.resume(internal._cycleCoroutine)

			if v25 == false then
				error(v26, 0)

				return
			end
		else
			if v21 == "running" then
				error("Iris cycleCoroutine took to long to yield. Connected functions should not yield.")

				return
			end

			error("unrecoverable state")
		end
	end
	function internal._NoOp()
	end
	function internal.WidgetConstructor(p7, p8)
		local t3: {[any]: any} = {
			All = {
				Required = {
					"Generate",
					"Discard",
					"Update",
					"Args",
					"Events",
					"hasChildren",
					"hasState"
				},
				Optional = {}
			},
			IfState = {
				Required = { "GenerateState", "UpdateState" },
				Optional = {}
			},
			IfChildren = {
				Required = { "ChildAdded" },
				Optional = { "ChildDiscarded" }
			}
		}
		local t4: {[any]: any} = {}

		for iterFirst, iterSecond in t3.All.Required, nil, nil do
			local u33: boolean = p8[iterSecond] ~= nil
			local v34 = ("field %* is missing from widget %*, it is required for all widgets"):format(iterSecond, p7)

			assert(u33, v34)
			t4[iterSecond] = p8[iterSecond]
		end

		for iterFirst2, iterSecond2 in t3.All.Optional, nil, nil do
			if p8[iterSecond2] == nil then
				t4[iterSecond2] = internal._NoOp
			else
				t4[iterSecond2] = p8[iterSecond2]
			end
		end

		if p8.hasState then
			for iterFirst3, iterSecond3 in t3.IfState.Required, nil, nil do
				local u39: boolean = p8[iterSecond3] ~= nil
				local v40 = ("field %* is missing from widget %*, it is required for all widgets with state"):format(iterSecond3, p7)

				assert(u39, v40)
				t4[iterSecond3] = p8[iterSecond3]
			end

			for iterFirst4, iterSecond4 in t3.IfState.Optional, nil, nil do
				if p8[iterSecond4] == nil then
					t4[iterSecond4] = internal._NoOp
				else
					t4[iterSecond4] = p8[iterSecond4]
				end
			end
		end

		if p8.hasChildren then
			for iterFirst5, iterSecond5 in t3.IfChildren.Required, nil, nil do
				local u45: boolean = p8[iterSecond5] ~= nil
				local v46 = ("field %* is missing from widget %*, it is required for all widgets with children"):format(iterSecond5, p7)

				assert(u45, v46)
				t4[iterSecond5] = p8[iterSecond5]
			end

			for iterFirst6, iterSecond6 in t3.IfChildren.Optional, nil, nil do
				if p8[iterSecond6] == nil then
					t4[iterSecond6] = internal._NoOp
				else
					t4[iterSecond6] = p8[iterSecond6]
				end
			end
		end

		internal._widgets[p7] = t4
		p1.Args[p7] = t4.Args
		t3 = {}

		for iterFirst7, iterSecond7 in t4.Args, nil, nil do
			t3[iterSecond7] = iterFirst7
		end

		t4.ArgNames = t3

		for iterFirst8, iterSecond8 in t4.Events, nil, nil do
			if p1.Events[iterFirst8] == nil then
				p1.Events[iterFirst8] = function()
					return internal._EventCall(internal._lastWidget, iterFirst8)
				end
			end
		end
	end
	function internal._Insert(p9, p10: {[any]: any}, p11)
		local v56 = nil
		local v57 = internal._getID(3)
		local v58 = internal._widgets[p9]
		local v59: {[any]: any} = internal

		v59._widgetCount = v59._widgetCount + 1

		if internal._VDOM[v57] then
			return internal._ContinueWidget(v57, p9)
		end

		v59 = {}

		if p10 ~= nil then
			if type(p10) ~= "table" then
				p10 = { p10 }
			end

			for iterFirst, iterSecond in p10 do
				v59[v58.ArgNames[iterFirst]] = iterSecond
			end
		end

		table.freeze(v59)

		if internal._lastVDOM[v57] and p9 == internal._lastVDOM[v57].type then
			if internal._localRefreshActive then
				internal._DiscardWidget(internal._lastVDOM[v57])
			else
				v56 = internal._lastVDOM[v57]
			end
		end

		if v56 == nil then
			v56 = internal._GenNewWidget(p9, v59, p11, v57)
		end

		if internal._deepCompare(v56.providedArguments, v59) == false then
			v56.arguments = internal._deepCopy(v59)
			v56.providedArguments = v59
			v58.Update(v56)
		end

		v56.lastCycleTick = internal._cycleTick

		if v58.hasChildren then
			local v62: {[any]: any} = internal

			v62._stackIndex = v62._stackIndex + 1
			internal._IDStack[internal._stackIndex] = v56.ID
		end

		internal._VDOM[v57] = v56
		internal._lastWidget = v56

		return v56
	end
	function internal._GenNewWidget(p12, p13, p14, id)
		local v67 = internal._IDStack[internal._stackIndex]
		local v68 = internal._widgets[p12]
		local t5: {[any]: any} = {}

		setmetatable(t5, t5)
		t5.ID = id
		t5.type = p12
		t5.parentWidget = internal._VDOM[v67]
		t5.trackedEvents = {}
		t5.ZIndex = t5.parentWidget.ZIndex + internal._widgetCount * 64 + internal._config.ZIndexOffset
		t5.Instance = v68.Generate(t5)
		t5.Instance.Parent = if internal._config.Parent then internal._config.Parent else internal._widgets[t5.parentWidget.type].ChildAdded(t5.parentWidget, t5)
		t5.providedArguments = p13
		t5.arguments = internal._deepCopy(p13)
		v68.Update(t5)

		local t6

		if v68.hasState then
			if p14 then
				for iterFirst, iterSecond in p14 do
					if type(iterSecond) ~= "table" or getmetatable(iterSecond) ~= internal.StateClass then
						p14[iterFirst] = internal._widgetState(t5, iterFirst, iterSecond)
					end
				end

				t5.state = p14

				for iterFirst2, iterSecond2 in p14 do
					iterSecond2.ConnectedWidgets[t5.ID] = t5
				end
			else
				t5.state = {}
			end

			v68.GenerateState(t5)
			v68.UpdateState(t5)
			t5.stateMT = {}
			setmetatable(t5.state, t5.stateMT)
			t5.__index = t5.state
			t6 = t5.stateMT
		else
			t6 = t5
		end

		function t6.__index(_, p17)
			return function()
				return internal._EventCall(t5, p17)
			end
		end

		return t5
	end
	function internal._ContinueWidget(p18, p19)
		local v78 = internal._VDOM[p18]

		if internal._widgets[p19].hasChildren then
			local v79: {[any]: any} = internal

			v79._stackIndex = v79._stackIndex + 1
			internal._IDStack[internal._stackIndex] = v78.ID
		end

		internal._lastWidget = v78

		return v78
	end
	function internal._DiscardWidget(p20)
		local parentWidget = p20.parentWidget

		if parentWidget then
			internal._widgets[parentWidget.type].ChildDiscarded(parentWidget, p20)
		end

		internal._widgets[p20.type].Discard(p20)
	end
	function internal._widgetState(p21, p22, p23)
		local s1: string = p21.ID .. p22

		if internal._states[s1] then
			internal._states[s1].ConnectedWidgets[p21.ID] = p21

			return internal._states[s1]
		end

		internal._states[s1] = {
			value = p23,
			ConnectedWidgets = { [p21.ID] = p21 },
			ConnectedFunctions = {}
		}
		setmetatable(internal._states[s1], internal.StateClass)

		return internal._states[s1]
	end
	function internal._EventCall(p24, p25)
		local v88 = internal._widgets[p24.type].Events[p25]
		local v89 = ("widget %* has no event of name %*"):format(p24.type, p25)

		assert(v88 ~= nil, v89)

		if p24.trackedEvents[p25] == nil then
			v88.Init(p24)
			p24.trackedEvents[p25] = true
		end

		return v88.Get(p24)
	end
	function internal._GetParentWidget()
		return internal._VDOM[internal._IDStack[internal._stackIndex]]
	end
	function internal._generateEmptyVDOM()
		return { R = internal._rootWidget }
	end
	function internal._generateRootInstance()
		internal._rootInstance = internal._widgets.Root.Generate(internal._widgets.Root)
		internal._rootInstance.Parent = internal.parentInstance
		internal._rootWidget.Instance = internal._rootInstance
	end
	function internal._generateSelectionImageObject()
		if internal.SelectionImageObject then
			internal.SelectionImageObject:Destroy()
		end

		local frame: Frame = Instance.new("Frame")

		frame.Position = UDim2.fromOffset(-1, -1)
		frame.Size = UDim2.new(1, 2, 1, 2)
		frame.BackgroundColor3 = internal._config.SelectionImageObjectColor
		frame.BackgroundTransparency = internal._config.SelectionImageObjectTransparency
		frame.BorderSizePixel = 0

		local uiStroke: UIStroke = Instance.new("UIStroke")

		uiStroke.Thickness = 1
		uiStroke.Color = internal._config.SelectionImageObjectBorderColor
		uiStroke.Transparency = internal._config.SelectionImageObjectBorderTransparency
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = frame

		local uiCorner: UICorner = Instance.new("UICorner")

		uiCorner.CornerRadius = UDim.new(0, 2)
		uiCorner.Parent = frame
		internal.SelectionImageObject = frame
	end
	function internal._getID(p26)
		if internal._nextWidgetId then
			local _nextWidgetId = internal._nextWidgetId

			internal._nextWidgetId = nil

			return _nextWidgetId
		end

		local n1 = 1 + (p26 or 1)
		local s1: string = ""
		local v97 = debug.info(n1, "l")

		while v97 ~= -1 and v97 ~= nil do
			s1 = s1 .. "+" .. v97
			n1 += 1
			v97 = debug.info(n1, "l")
		end

		if internal._usedIDs[s1] then
			local _usedIDs = internal._usedIDs

			_usedIDs[s1] = _usedIDs[s1] + 1
		else
			internal._usedIDs[s1] = 1
		end

		v97 = if internal._pushedId then internal._pushedId else internal._usedIDs[s1]

		return s1 .. ":" .. v97
	end
	function internal._deepCompare(p27, p28)
		for iterFirst, iterSecond in p27 do
			local v103 = p28[iterFirst]

			if type(iterSecond) == "table" then
				if not v103 or type(v103) ~= "table" then
					return false
				end

				if internal._deepCompare(iterSecond, v103) == false then
					return false
				end
			elseif type(iterSecond) ~= type(v103) or iterSecond ~= v103 then
				return false
			end
		end

		return true
	end
	function internal._deepCopy(p29)
		local t7: {[any]: any} = {}

		for k, v in pairs(p29) do
			if type(v) == "table" then
				v = internal._deepCopy(v)
			end

			t7[k] = v
		end

		return t7
	end

	internal._lastVDOM = internal._generateEmptyVDOM()
	internal._VDOM = internal._generateEmptyVDOM()
	p1.Internal = internal
	p1._config = internal._config

	return internal
end
