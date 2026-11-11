



require(script.Parent.Types)

return function(p1)
	local v2 = p1.State(true)
	local v3 = p1.State(false)
	local v4 = p1.State(false)
	local v5 = p1.State(false)
	local v6 = p1.State(false)
	local v7 = p1.State(false)

	local function helpMarker(p2)
		p1.PushConfig({ TextColor = p1._config.TextDisabledColor })

		local v25 = p1.Text({ "(?)" })

		p1.PopConfig()
		p1.PushConfig({ ContentWidth = UDim.new(0, 350) })

		if v25.hovered() then
			p1.Tooltip({ p2 })
		end

		p1.PopConfig()
	end

	local t1: {[any]: any} = {
		"Basic",
		"Tree",
		"CollapsingHeader",
		"Group",
		"Indent",
		"Input",
		"MultiInput",
		"InputText",
		"Tooltip",
		"Selectable",
		"Combo"
	}

	local function recursiveTree()
		if p1.Tree({ "Recursive Tree" }).state.isUncollapsed.value then
			recursiveTree()
		end

		p1.End()
	end
	local function recursiveWindow(p3)
		local window = p1.Window
		local v28 = p1.State(Vector2.new(175, 100))

		window({ "Recursive Window" }, { size = v28, isOpened = p3 })

		local v29 = p1.Checkbox({ "Recurse Again" })

		p1.End()

		if v29.isChecked.value then
			recursiveWindow(v29.isChecked)
		end
	end
	local function runtimeInfo()
		local v30 = p1.Window({ "Runtime Info" }, { isOpened = v4 })
		local _lastVDOM = p1.Internal._lastVDOM
		local _states = p1.Internal._states
		local v33 = p1.State(3)
		local v34 = p1.State(0)
		local v35 = p1.State(os.clock())

		p1.SameLine()
		p1.InputNum({
			"",
			[p1.Args.InputNum.Format] = "%d Seconds",
			[p1.Args.InputNum.Max] = 10
		}, { number = v33 })

		if p1.Button({ "Disable" }).clicked() then
			p1.Disabled = true

			local taskDelay = task.delay
			local v37 = v33:get()

			taskDelay(v37, function()
				p1.Disabled = false
			end)
		end

		p1.End()
		v33 = os.clock()
		v34.value = v34.value + (v33 - v35.value - v34.value) * 0.2
		v35.value = v33
		p1.Text({ string.format("Average %.3f ms/frame (%.1f FPS)", v34.value * 1000, 1 / v34.value) })
		p1.Text({ string.format("Window Position: (%d, %d), Window Size: (%d, %d)", v30.position.value.X, v30.position.value.Y, v30.size.value.X, v30.size.value.Y) })
		p1.SameLine()
		p1.Text({ "Enter an ID to learn more about it." })
		helpMarker("every widget and state has an ID which Iris tracks to remember which widget is which. below lists all widgets and states, with their respective IDs")
		p1.End()
		p1.PushConfig({ ItemWidth = UDim.new(1, -150) })

		local inputText = p1.InputText
		local v39 = p1.State(v30.ID)
		local value = inputText({ "ID field" }, { text = v39 }).text.value

		p1.PopConfig()
		p1.Indent()
		v35 = _lastVDOM[value]
		v34 = _states[value]

		if v35 then
			p1.Table({ 1, [p1.Args.Table.RowBg] = false })
			p1.Text({ string.format("The ID, \"%s\", is a widget", value) })
			p1.NextRow()
			p1.Text({ string.format("Widget is type: %s", v35.type) })
			p1.NextRow()

			local tree = p1.Tree
			local v42 = p1.State(true)

			tree({ "Widget has Args:" }, { isUncollapsed = v42 })

			for iterFirst, iterSecond in v35.arguments, nil, nil do
				local v45 = p1.Text
				local text: string = tostring(iterSecond)

				v45({ iterFirst .. " - " .. text })
			end

			p1.End()
			p1.NextRow()

			if v35.state then
				local v47 = p1.Tree
				local v48 = p1.State(true)

				v47({ "Widget has State:" }, { isUncollapsed = v48 })

				for iterFirst2, iterSecond2 in v35.state, nil, nil do
					local v51 = p1.Text
					local text2: string = tostring(iterSecond2.value)

					v51({ iterFirst2 .. " - " .. text2 })
				end

				p1.End()
			end

			p1.End()
		elseif v34 then
			p1.Table({ 1, [p1.Args.Table.RowBg] = false })
			p1.Text({ string.format("The ID, \"%s\", is a state", value) })
			p1.NextRow()

			local v53 = p1.Text
			local stringFormat = string.format
			local typeName: string = typeof(v34.value)
			local text: string = tostring(v34.value)

			v53({ stringFormat("Value is type: %s, Value = %s", typeName, text) })
			p1.NextRow()

			local v57 = p1.Tree
			local v58 = p1.State(true)

			v57({ "state has connected widgets:" }, { isUncollapsed = v58 })

			for iterFirst3, iterSecond3 in v34.ConnectedWidgets, nil, nil do
				p1.Text({ iterFirst3 .. " - " .. iterSecond3.type })
			end

			p1.End()
			p1.NextRow()
			p1.Text({ string.format("state has: %d connected functions", #v34.ConnectedFunctions) })
			p1.End()
		else
			p1.Text({ string.format("The ID, \"%s\", is not a state or widget", value) })
		end

		p1.End()

		if p1.Tree({ "Widgets" }).isUncollapsed.value then
			local n1: number = 0
			local s1: string = ""

			for iterFirst4, iterSecond4 in _lastVDOM do
				n1 += 1
				s1 = s1 .. "\n" .. iterSecond4.ID .. " - " .. iterSecond4.type
			end

			p1.Text({ "Number of Widgets: " .. n1 })
			p1.Text({ s1 })
		end

		p1.End()

		if p1.Tree({ "States" }).isUncollapsed.value then
			local n2: number = 0
			local s2: string = ""

			for iterFirst5, iterSecond5 in _states do
				n2 += 1

				local text: string = tostring(iterSecond5.value)

				s2 = s2 .. "\n" .. iterFirst5 .. " - " .. text
			end

			p1.Text({ "Number of States: " .. n2 })
			p1.Text({ s2 })
		end

		p1.End()
		p1.End()
	end
	local function recursiveMenu()
		if p1.Menu({ "Recursive" }).state.isOpened.value then
			p1.MenuItem({ "New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl })
			p1.MenuItem({ "Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl })
			p1.MenuItem({ "Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl })
			p1.Separator()
			p1.MenuToggle({ "Autosave" })
			p1.MenuToggle({ "Checked" })
			p1.Separator()
			p1.Menu({ "Options" })
			p1.MenuItem({ "Red" })
			p1.MenuItem({ "Yellow" })
			p1.MenuItem({ "Green" })
			p1.MenuItem({ "Blue" })
			p1.Separator()
			recursiveMenu()
			p1.End()
		end

		p1.End()
	end
	local function mainMenuBar()
		p1.MenuBar()
		p1.Menu({ "File" })
		p1.MenuItem({ "New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl })
		p1.MenuItem({ "Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl })
		p1.MenuItem({ "Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl })
		recursiveMenu()
		p1.MenuItem({ "Quit", Enum.KeyCode.Q, Enum.ModifierKey.Alt })
		p1.End()
		p1.Menu({ "Examples" })
		p1.MenuToggle({ "Recursive Window" }, { isChecked = v3 })
		p1.MenuToggle({ "Windowless" }, { isChecked = v6 })
		p1.MenuToggle({ "Main Menu Bar" }, { isChecked = v7 })
		p1.End()
		p1.Menu({ "Tools" })
		p1.MenuToggle({ "Runtime Info" }, { isChecked = v4 })
		p1.MenuToggle({ "Style Editor" }, { isChecked = v5 })
		p1.End()
		p1.End()
	end
	local function mainMenuBarExample()
		local absoluteSize = p1.Internal._rootWidget.Instance.PseudoWindowScreenGui.AbsoluteSize

		mainMenuBar()
	end

	local u16 = nil

	u16 = function()
		local v71 = p1.State(1)

		local t3: {[any]: any} = {
			{
				"Sizing",
				function()
					local v169 = p1.State({})

					if p1.Button({ "Update Config" }).clicked() then
						p1.UpdateGlobalConfig(v169:get())
						v169:set({})
					end

					for iterFirst, value in {
						{ "ItemWidth", nil, UDim.new(), UDim.new(1, 200) },
						{ "ContentWidth", nil, UDim.new(), UDim.new(1, 200) }
					}, nil, nil do
						local sliderUDim = p1.SliderUDim
						local tableUnpack = table.unpack
						local v174 = p1.WeakState(p1._config[value[1]])
						local v175 = sliderUDim({ tableUnpack(value) }, { number = v174 })

						if v175.numberChanged() then
							local v176 = v169:get()

							v176[value[1]] = v175.number:get()
						end
					end

					for iterFirst2, value2 in {
						{ "WindowPadding", nil, Vector2.zero, Vector2.one * 20 },
						{ "WindowResizePadding", nil, Vector2.zero, Vector2.one * 20 },
						{ "FramePadding", nil, Vector2.zero, Vector2.one * 20 },
						{ "ItemSpacing", nil, Vector2.zero, Vector2.one * 20 },
						{ "ItemInnerSpacing", nil, Vector2.zero, Vector2.one * 20 },
						{ "CellPadding", nil, Vector2.zero, Vector2.one * 20 },
						{ "DisplaySafeAreaPadding", nil, Vector2.zero, Vector2.one * 20 }
					}, nil, nil do
						local sliderVector2 = p1.SliderVector2
						local v180 = table.unpack
						local v181 = p1.WeakState(p1._config[value2[1]])
						local v182 = sliderVector2({ v180(value2) }, { number = v181 })

						if v182.numberChanged() then
							local v183 = v169:get()

							v183[value2[1]] = v182.number:get()
						end
					end

					for iterFirst3, value3 in {
						{ "TextSize", 1, 4, 20 },
						{ "FrameBorderSize", 0.1, 0, 1 },
						{ "FrameRounding", 1, 0, 12 },
						{ "GrabRounding", 1, 0, 12 },
						{ "WindowBorderSize", 0.1, 0, 1 },
						{ "PopupBorderSize", 0.1, 0, 1 },
						{ "PopupRounding", 1, 0, 12 },
						{ "ScrollbarSize", 1, 0, 20 },
						{ "GrabMinSize", 1, 0, 20 }
					}, nil, nil do
						local sliderNum = p1.SliderNum
						local v187 = table.unpack
						local v188 = p1.WeakState(p1._config[value3[1]])
						local v189 = sliderNum({ v187(value3) }, { number = v188 })

						if v189.numberChanged() then
							local v190 = v169:get()

							v190[value3[1]] = v189.number:get()
						end
					end

					for iterFirst4, value4 in { "WindowTitleAlign" }, nil, nil do
						local comboEnum = p1.ComboEnum
						local v194 = p1.WeakState(p1._config[value4])
						local v195 = comboEnum({ value4 }, { index = v194 }, p1._config[value4].EnumType)

						if v195.closed() then
							local updateGlobalConfig = p1.UpdateGlobalConfig
							local v197 = v195.index:get()

							updateGlobalConfig({ [value4] = v197 })
						end
					end
				end
			},
			{
				"Colors",
				function()
					local v198 = p1.State({})

					if p1.Button({ "Update Config" }).clicked() then
						p1.UpdateGlobalConfig(v198:get())
						v198:set({})
					end

					for iterFirst, value in { "BorderColor", "BorderActiveColor" }, nil, nil do
						local inputColor3 = p1.InputColor3
						local v202 = p1.WeakState(p1._config[value])
						local v203 = inputColor3({ value }, { color = v202 })

						if v203.numberChanged() then
							local updateGlobalConfig = p1.UpdateGlobalConfig
							local v205 = v203.color:get()

							updateGlobalConfig({ [value] = v205 })
						end
					end

					for iterFirst2, value2 in {
						"Text",
						"TextDisabled",
						"WindowBg",
						"ScrollbarGrab",
						"TitleBg",
						"TitleBgActive",
						"TitleBgCollapsed",
						"MenubarBg",
						"FrameBg",
						"FrameBgHovered",
						"FrameBgActive",
						"Button",
						"ButtonHovered",
						"ButtonActive",
						"SliderGrab",
						"SliderGrabActive",
						"Header",
						"HeaderHovered",
						"HeaderActive",
						"SelectionImageObject",
						"SelectionImageObjectBorder",
						"TableBorderStrong",
						"TableBorderLight",
						"TableRowBg",
						"TableRowBgAlt",
						"NavWindowingHighlight",
						"NavWindowingDimBg",
						"Separator",
						"CheckMark"
					}, nil, nil do
						local inputColor4 = p1.InputColor4
						local v209 = p1.WeakState(p1._config[value2 .. "Color"])
						local v210 = p1.WeakState(p1._config[value2 .. "Transparency"])
						local v211 = inputColor4({ value2 }, { color = v209, transparency = v210 })

						if v211.numberChanged() then
							local v212 = v198:get()

							v212[value2 .. "Color"] = v211.color:get()
							v212 = v198:get()
							v212[value2 .. "Transparency"] = v211.transparency:get()
						end
					end
				end
			}
		}

		p1.Window({ "Style Editor" }, { isOpened = v5 })
		p1.Text({ "Customize the look of Iris in realtime." })
		p1.SameLine()

		if p1.SmallButton({ "Light Theme" }).clicked() then
			p1.UpdateGlobalConfig(p1.TemplateConfig.colorLight)
		end

		if p1.SmallButton({ "Dark Theme" }).clicked() then
			p1.UpdateGlobalConfig(p1.TemplateConfig.colorDark)
		end

		p1.End()
		p1.SameLine()

		if p1.SmallButton({ "Classic Size" }).clicked() then
			p1.UpdateGlobalConfig(p1.TemplateConfig.sizeDefault)
		end

		if p1.SmallButton({ "Larger Size" }).clicked() then
			p1.UpdateGlobalConfig(p1.TemplateConfig.sizeClear)
		end

		p1.End()

		if p1.SmallButton({ "Reset Everything" }).clicked() then
			p1.UpdateGlobalConfig(p1.TemplateConfig.colorDark)
			p1.UpdateGlobalConfig(p1.TemplateConfig.sizeDefault)
		end

		p1.Separator()
		p1.SameLine()

		for i, v in ipairs(t3) do
			p1.RadioButton({ v[1], i }, { index = v71 })
		end

		p1.End()

		local v75 = v71:get()

		t3[v75][2]()
		p1.End()
	end

	local function widgetEventInteractivity()
		p1.CollapsingHeader({ "Widget Event Interactivity" })

		local v76 = p1.State(0)

		if p1.Button({ "Click to increase Number" }).clicked() then
			local v77 = v76:get()

			v76:set(v77 + 1)
		end

		local v78 = p1.Text
		local v79 = v76:get()

		v78({ "The Number is: " .. v79 })
		p1.Separator()
		v76 = p1.State(false)
		v78 = p1.State("clicked")
		p1.SameLine()
		p1.RadioButton({ "clicked", "clicked" }, { index = v78 })
		p1.RadioButton({ "rightClicked", "rightClicked" }, { index = v78 })
		p1.RadioButton({ "doubleClicked", "doubleClicked" }, { index = v78 })
		p1.RadioButton({ "ctrlClicked", "ctrlClicked" }, { index = v78 })
		p1.End()
		p1.SameLine()

		local button = p1.Button
		local v81 = v78:get()
		local v82 = button({ v81 .. " to reveal text" })
		local v83 = v78:get()

		if v82[v83]() then
			local v84 = v76:get()

			v76:set(not v84)
		end

		if v76:get() then
			p1.Text({ "Here i am!" })
		end

		p1.End()
		p1.Separator()
		v78 = p1.State(0)
		p1.SameLine()

		if p1.Button({ "Click to show text for 20 frames" }).clicked() then
			v78:set(20)
		end

		if v78:get() > 0 then
			p1.Text({ "Here i am!" })
		end

		p1.End()

		local v85 = v78:get()

		v83 = math.max(0, v85 - 1)
		v78:set(v83)

		local v86 = p1.Text

		v81 = v78:get()
		v86({ "Text Timer: " .. v81 })
		v78 = p1.Checkbox({ "Event-tracked checkbox" })
		p1.Indent()
		v86 = p1.Text

		local text: string = tostring(v78.unchecked())

		v86({ "unchecked: " .. text })
		v86 = p1.Text

		local text3: string = tostring(v78.checked())

		v86({ "checked: " .. text3 })
		p1.End()
		p1.SameLine()

		if p1.Button({ "Hover over me" }).hovered() then
			p1.Text({ "The button is hovered" })
		end

		p1.End()
		p1.End()
	end
	local function widgetStateInteractivity()
		p1.CollapsingHeader({ "Widget State Interactivity" })

		local v89 = p1.Checkbox({ "Widget-Generated State" })

		p1.Text({ (("isChecked: %*\n"):format(v89.state.isChecked.value)) })
		v89 = p1.State(false)

		local v90 = p1.Checkbox({ "User-Generated State" }, { isChecked = v89 })

		p1.Text({ (("isChecked: %*\n"):format(v90.state.isChecked.value)) })
		v90 = p1.Checkbox({ "Widget Coupled State" })

		local v91 = p1.Checkbox({ "Coupled to above Checkbox" }, { isChecked = v90.state.isChecked })

		p1.Text({ (("isChecked: %*\n"):format(v91.state.isChecked.value)) })
		v90 = p1.State(false)
		p1.Checkbox({ "Widget and Code Coupled State" }, { isChecked = v90 })

		if p1.Button({ "Click to toggle above checkbox" }).clicked() then
			local v92 = v90:get()

			v90:set(not v92)
		end

		p1.Text({ (("isChecked: %*\n"):format(v90.value)) })
		v90 = p1.State(true)
		v89 = p1.ComputedState(v90, function(p4)
			return not p4
		end)
		p1.Checkbox({ "ComputedState (dynamic coupling)" }, { isChecked = v90 })
		p1.Checkbox({ "Inverted of above checkbox" }, { isChecked = v89 })
		p1.Text({ (("isChecked: %*\n"):format(v89.value)) })
		p1.End()
	end
	local function dynamicStyle()
		p1.CollapsingHeader({ "Dynamic Styles" })

		local v93 = p1.State(0)

		p1.SameLine()

		if p1.Button({ "Change Color" }).clicked() then
			v93:set(math.random())
		end

		local text = p1.Text
		local v95 = v93:get()
		local floored = math.floor(v95 * 255)

		text({ "Hue: " .. floored })
		helpMarker("Using PushConfig with a changing value, this can be done with any config field")
		p1.End()

		local pushConfig = p1.PushConfig
		local color3FromHSV = Color3.fromHSV
		local v99 = v93:get()
		local color3 = color3FromHSV(v99, 1, 1)

		pushConfig({ TextColor = color3 })
		p1.Text({ "Text with a unique and changable color" })
		p1.PopConfig()
		p1.End()
	end
	local function tablesDemo()
		local v101 = p1.State(false)

		p1.CollapsingHeader({ "Tables & Columns" }, { isUncollapsed = v101 })

		if v101.value == false then
			p1.End()

			return
		end

		p1.SameLine()
		p1.Text({ "Table using NextRow and NextColumn syntax:" })
		helpMarker("calling Iris.NextRow() in the outer loop, and Iris.NextColumn()in the inner loop")
		p1.End()
		p1.Table({ 3 })

		for i = 1, 4 do
			p1.NextRow()

			for j = 1, 3 do
				p1.NextColumn()
				p1.Text({ (("Row: %*, Column: %*"):format(i, j)) })
			end
		end

		p1.End()
		p1.Text({ "" })
		p1.SameLine()
		p1.Text({ "Table using NextColumn only syntax:" })
		helpMarker("only calling Iris.NextColumn() in the inner loop, the result is identical")
		p1.End()
		p1.Table({ 2 })

		for i = 1, 4 do
			for j = 1, 2 do
				p1.NextColumn()
				p1.Text({ (("Row: %*, Column: %*"):format(i, j)) })
			end
		end

		p1.End()
		p1.Separator()

		local v106 = p1.State(false)
		local v107 = p1.State(false)
		local v108 = p1.State(true)
		local v109 = p1.State(true)
		local v110 = p1.State(3)

		p1.Text({ "Table with Customizable Arguments" })
		p1.Table({
			4,
			[p1.Args.Table.RowBg] = v106.value,
			[p1.Args.Table.BordersOuter] = v107.value,
			[p1.Args.Table.BordersInner] = v108.value
		})

		for i = 1, v110:get() do
			for j = 1, 4 do
				p1.NextColumn()

				if v109.value then
					p1.Button({ (("Month: %*, Week: %*"):format(i, j)) })
				else
					p1.Text({ (("Month: %*, Week: %*"):format(i, j)) })
				end
			end
		end

		p1.End()
		p1.Checkbox({ "RowBg" }, { isChecked = v106 })
		p1.Checkbox({ "BordersOuter" }, { isChecked = v107 })
		p1.Checkbox({ "BordersInner" }, { isChecked = v108 })
		p1.SameLine()
		p1.RadioButton({ "Buttons", true }, { index = v109 })
		p1.RadioButton({ "Text", false }, { index = v109 })
		p1.End()
		p1.InputNum({
			"Number of rows",
			[p1.Args.InputNum.Min] = 0,
			[p1.Args.InputNum.Max] = 100,
			[p1.Args.InputNum.Format] = "%d"
		}, { number = v110 })
		p1.End()
	end
	local function layoutDemo()
		p1.CollapsingHeader({ "Widget Layout" })
		p1.Tree({ "Content Width" })

		local v113 = p1.State(50)
		local v114 = p1.State(Enum.Axis.X)

		p1.Text({ "The Content Width is a size property which determines the width of input fields." })
		p1.SameLine()
		p1.Text({ "By default the value is UDim.new(0.65, 0)" })
		helpMarker("This is the default value from Dear ImGui.\nIt is 65% of the window width.")
		p1.End()
		p1.Text({ "This works well, but sometimes we know how wide elements are going to be and want to maximise the space." })
		p1.Text({ "Therefore, we can use Iris.PushConfig() to change the width" })
		p1.Separator()
		p1.SameLine()
		p1.Text({ "Content Width = 150 pixels" })
		helpMarker("UDim.new(0, 150)")
		p1.End()
		p1.PushConfig({ ContentWidth = UDim.new(0, 150) })
		p1.DragNum({ "number", 1, 0, 100 }, { number = v113 })
		p1.ComboEnum({ "axis" }, { index = v114 }, Enum.Axis)
		p1.PopConfig()
		p1.SameLine()
		p1.Text({ "Content Width = 50% window width" })
		helpMarker("UDim.new(0.5, 0)")
		p1.End()
		p1.PushConfig({ ContentWidth = UDim.new(0.5, 0) })
		p1.DragNum({ "number", 1, 0, 100 }, { number = v113 })
		p1.ComboEnum({ "axis" }, { index = v114 }, Enum.Axis)
		p1.PopConfig()
		p1.SameLine()
		p1.Text({ "Content Width = -150 pixels from the right side" })
		helpMarker("UDim.new(1, -150)")
		p1.End()
		p1.PushConfig({ ContentWidth = UDim.new(1, -150) })
		p1.DragNum({ "number", 1, 0, 100 }, { number = v113 })
		p1.InputEnum({ "axis" }, { index = v114 }, Enum.Axis)
		p1.PopConfig()
		p1.End()
		p1.End()
	end
	local function windowlessDemo()
		p1.PushConfig({ ItemWidth = UDim.new(0, 150) })
		p1.SameLine()
		p1.TextWrapped({ "Windowless widgets" })
		helpMarker("Widgets which are placed outside of a window will appear on the top left side of the screen.")
		p1.End()
		p1.Button({})
		p1.Tree({})
		p1.InputText({})
		p1.End()
		p1.PopConfig()
	end

	local t2: {[any]: any} = {
		Basic = function()
			p1.Tree({ "Basic" })
			p1.SeparatorText({ "Basic" })

			local v115 = p1.State(1)

			p1.Button({ "Button" })
			p1.SmallButton({ "SmallButton" })
			p1.Text({ "Text" })
			p1.TextWrapped({ string.rep("Text Wrapped ", 5) })
			p1.TextColored({ "Colored Text", Color3.fromRGB(255, 128, 0) })
			p1.Text({
				"Rich Text: <b>bold text</b> <i>italic text</i> <u>underline text</u> <s>strikethrough text</s> <font color= \"rgb(240, 40, 10)\">red text</font> <font size=\"32\">bigger text</font>",
				true,
				nil,
				true
			})
			p1.SameLine()
			p1.RadioButton({ "Index '1'", 1 }, { index = v115 })
			p1.RadioButton({ "Index 'two'", "two" }, { index = v115 })

			if p1.RadioButton({ "Index 'false'", false }, { index = v115 }).active() == false and p1.SmallButton({ "Select last" }).clicked() then
				v115:set(false)
			end

			p1.End()

			local v116 = p1.Text
			local text: string = tostring(v115.value)

			v116({ "The Index is: " .. text })
			p1.SeparatorText({ "Inputs" })
			p1.InputNum({})
			p1.DragNum({})
			p1.SliderNum({})
			p1.End()
		end,
		Tree = function()
			p1.Tree({ "Trees" })
			p1.Tree({ "Tree using SpanAvailWidth", [p1.Args.Tree.SpanAvailWidth] = true })
			helpMarker("SpanAvailWidth determines if the Tree is selectable from its entire with, or only the text area")
			p1.End()

			local v118 = p1.Tree({ "Tree with Children" })

			p1.Text({ "Im inside the first tree!" })
			p1.Button({ "Im a button inside the first tree!" })
			p1.Tree({ "Im a tree inside the first tree!" })
			p1.Text({ "I am the innermost text!" })
			p1.End()
			p1.End()
			p1.Checkbox({ "Toggle above tree" }, { isChecked = v118.state.isUncollapsed })
			p1.End()
		end,
		CollapsingHeader = function()
			p1.Tree({ "Collapsing Headers" })
			p1.CollapsingHeader({ "A header" })
			p1.Text({ "This is under the first header!" })
			p1.End()

			local v119 = p1.State(true)

			p1.CollapsingHeader({ "Another header" }, { isUncollapsed = v119 })

			if p1.Button({ "Shhh... secret button!" }).clicked() then
				v119:set(true)
			end

			p1.End()
			p1.End()
		end,
		Group = function()
			p1.Tree({ "Groups" })
			p1.SameLine()
			p1.Group()
			p1.Text({ "I am in group A" })
			p1.Button({ "Im also in A" })
			p1.End()
			p1.Separator()
			p1.Group()
			p1.Text({ "I am in group B" })
			p1.Button({ "Im also in B" })
			p1.Button({ "Also group B" })

			for _ = 1, 3 do
				p1.End()
			end
		end,
		Indent = function()
			p1.Tree({ "Indents" })
			p1.Text({ "Not Indented" })
			p1.Indent()
			p1.Text({ "Indented" })
			p1.Indent({ 7 })
			p1.Text({ "Indented by 7 more pixels" })
			p1.End()
			p1.Indent({ -7 })
			p1.Text({ "Indented by 7 less pixels" })

			for _ = 1, 3 do
				p1.End()
			end
		end,
		Input = function()
			p1.Tree({ "Input" })

			local v122 = p1.State(false)
			local v123 = p1.State(false)
			local v124 = p1.State(0)
			local v125 = p1.State(100)
			local v126 = p1.State(1)
			local v127 = p1.State("%d")

			p1.PushConfig({ ContentWidth = UDim.new(1, -120) })

			local v128 = p1.InputNum({
				"Input Number",
				[p1.Args.InputNum.NoButtons] = v123.value,
				[p1.Args.InputNum.Min] = v124.value,
				[p1.Args.InputNum.Max] = v125.value,
				[p1.Args.InputNum.Increment] = v126.value,
				[p1.Args.InputNum.Format] = { v127.value }
			})

			p1.PopConfig()
			p1.Text({ "The Value is: " .. v128.number.value })

			if p1.Button({ "Randomize Number" }).clicked() then
				v128.number:set(math.random(1, 99))
			end

			v128 = p1.Checkbox({ "NoField" }, { isChecked = v122 })
			v127 = p1.Checkbox({ "NoButtons" }, { isChecked = v123 })

			if v128.checked() and v127.isChecked.value == true then
				v127.isChecked:set(false)
			end

			if v127.checked() and v128.isChecked.value == true then
				v128.isChecked:set(false)
			end

			p1.PushConfig({ ContentWidth = UDim.new(1, -120) })
			p1.InputVector2({ "InputVector2" })
			p1.InputVector3({ "InputVector3" })
			p1.InputUDim({ "InputUDim" })
			p1.InputUDim2({ "InputUDim2" })
			v128 = p1.State(false)
			v127 = p1.State(false)

			local v129 = p1.State(Color3.new())
			local v130 = p1.State(0)

			p1.SliderNum({ "Transparency", 0.01, 0, 1 }, { number = v130 })

			local inputColor3 = p1.InputColor3
			local v132 = v128:get()

			inputColor3({ "InputColor3", v132, v127:get() }, { color = v129 })

			local inputColor4 = p1.InputColor4

			v132 = v128:get()
			inputColor4({ "InputColor4", v132, v127:get() }, { color = v129, transparency = v130 })
			p1.SameLine()

			local text = p1.Text
			local v135 = v129:get()

			text({ v135:ToHex() })
			p1.Checkbox({ "Use Floats" }, { isChecked = v128 })
			p1.Checkbox({ "Use HSV" }, { isChecked = v127 })
			p1.End()
			p1.PopConfig()
			p1.Separator()
			p1.SameLine()
			p1.Text({ "Slider Numbers" })
			helpMarker("ctrl + click slider number widgets to input a number")
			p1.End()
			p1.PushConfig({ ContentWidth = UDim.new(1, -120) })
			p1.SliderNum({ "Slide Int", 1, 1, 8 })
			p1.SliderNum({ "Slide Float", 0.01, 0, 100 })
			p1.SliderNum({ "Small Numbers", 0.001, -2, 1, "%f radians" })
			p1.SliderNum({
				"Odd Ranges",
				0.001,
				-3.141592653589793,
				3.141592653589793,
				"%f radians"
			})
			p1.SliderNum({ "Big Numbers", 10000, 100000, 10000000 })
			p1.SliderNum({ "Few Numbers", 1, 0, 3 })
			p1.PopConfig()
			p1.Separator()
			p1.SameLine()
			p1.Text({ "Drag Numbers" })
			helpMarker("ctrl + click or double click drag number widgets to input a number, hold shift/alt while dragging to increase/decrease speed")
			p1.End()
			p1.PushConfig({ ContentWidth = UDim.new(1, -120) })
			p1.DragNum({ "Drag Int" })
			p1.DragNum({ "Slide Float", 0.001, -10, 10 })
			p1.DragNum({ "Percentage", 1, 0, 100, "%d %%" })
			p1.PopConfig()
			p1.End()
		end,
		InputText = function()
			p1.Tree({ "Input Text" })
			p1.PushConfig({ ContentWidth = UDim.new(0, 250) })

			local v136 = p1.InputText({ "Input Text Test", [p1.Args.InputText.TextHint] = "Input Text here" })

			p1.PopConfig()
			p1.Text({ "The text is: " .. v136.text.value })
			p1.End()
		end,
		MultiInput = function()
			p1.Tree({ "Multi-Component Input" })

			local v137 = p1.State(Vector2.new())
			local v138 = p1.State((Vector3.new()))
			local v139 = p1.State(UDim.new())
			local v140 = p1.State(UDim2.new())
			local v141 = p1.State(Color3.new())
			local v142 = p1.State(Rect.new(0, 0))

			p1.SeparatorText({ "Input" })
			p1.InputVector2({}, { number = v137 })
			p1.InputVector3({}, { number = v138 })
			p1.InputUDim({}, { number = v139 })
			p1.InputUDim2({}, { number = v140 })
			p1.InputRect({}, { number = v142 })
			p1.SeparatorText({ "Drag" })
			p1.DragVector2({}, { number = v137 })
			p1.DragVector3({}, { number = v138 })
			p1.DragUDim({}, { number = v139 })
			p1.DragUDim2({}, { number = v140 })
			p1.DragRect({}, { number = v142 })
			p1.SeparatorText({ "Slider" })
			p1.SliderVector2({}, { number = v137 })
			p1.SliderVector3({}, { number = v138 })
			p1.SliderUDim({}, { number = v139 })
			p1.SliderUDim2({}, { number = v140 })
			p1.SliderRect({}, { number = v142 })
			p1.SeparatorText({ "Color" })
			p1.InputColor3({}, { color = v141 })
			p1.InputColor4({}, { color = v141 })
			p1.End()
		end,
		Tooltip = function()
			p1.PushConfig({ ContentWidth = UDim.new(0, 250) })
			p1.Tree({ "Tooltip" })

			if p1.Text({ "Hover over me to reveal a tooltip" }).hovered() then
				p1.Tooltip({ "I am some helpful tooltip text" })
			end

			local v143 = p1.State("Hello ")
			local v144 = p1.State(1)

			if p1.InputNum({ "# of repeat", 1, 1, 50 }, { number = v144 }).numberChanged() then
				v143:set(string.rep("Hello ", v144:get()))
			end

			if p1.Checkbox({ "Show dynamic text tooltip" }).isChecked.value then
				p1.Tooltip({ v143:get() })
			end

			p1.End()
			p1.PopConfig()
		end,
		Selectable = function()
			p1.Tree({ "Selectable" })

			local v145 = p1.State(2)

			p1.Selectable({ "Selectable #1", 1 }, { index = v145 })
			p1.Selectable({ "Selectable #2", 2 }, { index = v145 })

			if p1.Selectable({ "Double click Selectable", 3, true }, { index = v145 }).doubleClicked() then
				v145:set(3)
			end

			p1.Selectable({ "Impossible to select", 4, true }, { index = v145 })

			if p1.Button({ "Select last" }).clicked() then
				v145:set(4)
			end

			p1.Selectable({ "Independent Selectable" })
			p1.End()
		end,
		Combo = function()
			p1.Tree({ "Combo" })
			p1.PushConfig({ ContentWidth = UDim.new(1, -120) })

			local v146 = p1.State("No Selection")

			p1.SameLine()

			local v147 = p1.Checkbox({ "No Preview" })
			local v148 = p1.Checkbox({ "No Button" })

			if v147.checked() and v148.isChecked.value == true then
				v148.isChecked:set(false)
			end

			if v148.checked() and v147.isChecked.value == true then
				v147.isChecked:set(false)
			end

			p1.End()

			local combo = p1.Combo
			local v150 = v148.isChecked:get()

			combo({ "Basic Usage", v150, v147.isChecked:get() }, { index = v146 })
			p1.Selectable({ "Select 1", "One" }, { index = v146 })
			p1.Selectable({ "Select 2", "Two" }, { index = v146 })
			p1.Selectable({ "Select 3", "Three" }, { index = v146 })
			p1.End()
			p1.ComboArray({ "Using ComboArray" }, { index = "No Selection" }, { "Red", "Green", "Blue" })
			v148 = p1.State("7 AM")
			p1.Combo({ "Combo with Inner widgets" }, { index = v148 })
			p1.Tree({ "Morning Shifts" })
			p1.Selectable({ "Shift at 7 AM", "7 AM" }, { index = v148 })
			p1.Selectable({ "Shift at 11 AM", "11 AM" }, { index = v148 })
			p1.Selectable({ "Shist at 3 PM", "3 PM" }, { index = v148 })
			p1.End()
			p1.Tree({ "Night Shifts" })
			p1.Selectable({ "Shift at 6 PM", "6 PM" }, { index = v148 })
			p1.Selectable({ "Shift at 9 PM", "9 PM" }, { index = v148 })
			p1.End()
			p1.End()

			local text = p1.Text
			local v152 = p1.ComboEnum({ "Using ComboEnum" }, { index = Enum.UserInputState.Begin }, Enum.UserInputState).index:get()

			text({ "Selected: " .. v152.Name })
			p1.PopConfig()
			p1.End()
		end
	}

	return function()
		local v153 = p1.State(false)
		local v154 = p1.State(false)
		local v155 = p1.State(false)
		local v156 = p1.State(true)
		local v157 = p1.State(false)
		local v158 = p1.State(false)
		local v159 = p1.State(false)
		local v160 = p1.State(false)
		local v161 = p1.State(false)

		if v2.value == false then
			p1.Checkbox({ "Open main window" }, { isChecked = v2 })

			return
		end

		local window = p1.Window
		local t4: {[any]: any} = {
			"Iris Demo Window",
			[p1.Args.Window.NoTitleBar] = v153.value,
			[p1.Args.Window.NoBackground] = v154.value,
			[p1.Args.Window.NoCollapse] = v155.value,
			[p1.Args.Window.NoClose] = v156.value,
			[p1.Args.Window.NoMove] = v157.value,
			[p1.Args.Window.NoScrollbar] = v158.value,
			[p1.Args.Window.NoResize] = v159.value,
			[p1.Args.Window.NoNav] = v160.value,
			[p1.Args.Window.NoMenu] = v161.value
		}
		local v164 = p1.State(Vector2.new(600, 550))
		local v165 = p1.State(Vector2.new(100, 25))

		window(t4, { size = v164, position = v165, isOpened = v2 })
		mainMenuBar()
		p1.Text({ "Iris says hello. (2.1.1)" })
		p1.CollapsingHeader({ "Window Options" })
		p1.Table({ 3, false, false, false })
		p1.NextColumn()
		p1.Checkbox({ "NoTitleBar" }, { isChecked = v153 })
		p1.NextColumn()
		p1.Checkbox({ "NoBackground" }, { isChecked = v154 })
		p1.NextColumn()
		p1.Checkbox({ "NoCollapse" }, { isChecked = v155 })
		p1.NextColumn()
		p1.Checkbox({ "NoClose" }, { isChecked = v156 })
		p1.NextColumn()
		p1.Checkbox({ "NoMove" }, { isChecked = v157 })
		p1.NextColumn()
		p1.Checkbox({ "NoScrollbar" }, { isChecked = v158 })
		p1.NextColumn()
		p1.Checkbox({ "NoResize" }, { isChecked = v159 })
		p1.NextColumn()
		p1.Checkbox({ "NoNav" }, { isChecked = v160 })
		p1.NextColumn()
		p1.Checkbox({ "NoMenu" }, { isChecked = v161 })
		p1.End()
		p1.End()
		widgetEventInteractivity()
		widgetStateInteractivity()
		p1.CollapsingHeader({ "Recursive Tree" })

		if p1.Tree({ "Recursive Tree" }).state.isUncollapsed.value then
			recursiveTree()
		end

		p1.End()
		p1.End()
		dynamicStyle()
		p1.Separator()
		p1.CollapsingHeader({ "Widgets" })

		for key, value in t1 do
			t2[value]()
		end

		p1.End()
		tablesDemo()
		layoutDemo()
		p1.End()

		if v3.value then
			recursiveWindow(v3)
		end

		if v4.value then
			runtimeInfo()
		end

		if v5.value then
			u16()
		end

		if v6.value then
			windowlessDemo()
		end

		if v7.value then
			local absoluteSize = p1.Internal._rootWidget.Instance.PseudoWindowScreenGui.AbsoluteSize

			mainMenuBar()
		end
	end
end
