



require(script.Parent.Parent.Types)

return function(p1, p2)
	local u3: boolean = false
	local u4 = nil
	local t1: {[any]: any} = {}

	local function EmptyMenuStack(p3)
		for i = #t1, p3 and p3 + 1 or 1, -1 do
			local v15 = t1[i]

			v15.state.isOpened:set(false)
			v15.Instance.BackgroundColor3 = p1._config.HeaderColor
			v15.Instance.BackgroundTransparency = 1
			table.remove(t1, i)
		end

		if #t1 == 0 then
			u3 = false
			u4 = nil
		end
	end
	local function UpdateChildContainerTransform(p4)
		local u17: boolean = p4.parentWidget.type == "Menu"
		local instance = p4.Instance
		local childContainer = p4.ChildContainer
		local uDim2FromOffset = UDim2.fromOffset
		local v21 = math.max(childContainer.AbsoluteSize.X, instance.AbsoluteSize.X)
		local v22 = math.max(childContainer.AbsoluteSize.Y, instance.AbsoluteSize.Y)

		childContainer.Size = uDim2FromOffset(v21, v22)

		if childContainer.Parent == nil then
			return
		end

		local absolutePosition = instance.AbsolutePosition
		local absoluteSize = instance.AbsoluteSize
		local childContainerAbsoluteSize = childContainer.AbsoluteSize
		local popupBorderSize = p1._config.PopupBorderSize
		local v27 = childContainer.Parent.AbsoluteSize
		local n1 = absolutePosition.X + popupBorderSize

		if p4.parentWidget.type == "Menu" then
			n1 = if absolutePosition.X + childContainerAbsoluteSize.X > v27.X then absolutePosition.X - popupBorderSize - (u17 and childContainerAbsoluteSize.X or 0) else absolutePosition.X + popupBorderSize + (u17 and absoluteSize.X or 0)
		end

		childContainer.Position = UDim2.fromOffset(n1, if absolutePosition.Y + childContainerAbsoluteSize.Y > v27.Y then absolutePosition.Y - popupBorderSize - childContainerAbsoluteSize.Y + (u17 and absoluteSize.Y or 0) else absolutePosition.Y + popupBorderSize + (if u17 then 0 else absoluteSize.Y))
	end

	p2.UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
			if u3 == false then
				return
			end

			if u4 == nil then
				return
			end

			local u30: boolean = false
			local v31 = p2.getMouseLocation()

			for key, value2 in t1 do
				for iterFirst, value in { value2.ChildContainer, value2.Instance }, nil, nil do
					local valueAbsolutePosition = value.AbsolutePosition

					if p2.isPosInsideRect(v31, valueAbsolutePosition, valueAbsolutePosition + value.AbsoluteSize) then
						u30 = true

						break
					end
				end
			end

			if not u30 then
				EmptyMenuStack()
			end

			return
		end
	end)
	p1.WidgetConstructor("MenuBar", {
		hasState = false,
		hasChildren = true,
		Args = {},
		Events = {},
		Generate = function(p6)
			local menuBar: Frame = Instance.new("Frame")

			menuBar.Name = "MenuBar"
			menuBar.Size = UDim2.fromScale(1, 0)
			menuBar.AutomaticSize = Enum.AutomaticSize.Y
			menuBar.BackgroundColor3 = p1._config.MenubarBgColor
			menuBar.BackgroundTransparency = p1._config.MenubarBgTransparency
			menuBar.BorderSizePixel = 0
			menuBar.ZIndex = p6.ZIndex
			menuBar.LayoutOrder = p6.ZIndex
			menuBar.ClipsDescendants = true
			p2.UIPadding(menuBar, Vector2.new(p1._config.ItemSpacing.X, 2))

			local v39 = p2.UIListLayout(menuBar, Enum.FillDirection.Horizontal, UDim.new())

			v39.VerticalAlignment = Enum.VerticalAlignment.Center

			return menuBar
		end,
		Update = function(p7)
			local parentWidget = p7.parentWidget

			if parentWidget.type == "Window" then
				local parent = parentWidget.Instance and parentWidget.Instance:FindFirstChild("WindowButton")

				if parent then
					p7.Instance.Parent = parent

					local n1: number = #p1._postCycleCallbacks + 1
					local n2 = p1._cycleTick + 1

					p1._postCycleCallbacks[n1] = function()
						if p1._cycleTick == n2 then
							p1._widgets.Window.Update(parentWidget)
							p1._postCycleCallbacks[n1] = nil
						end
					end
				end

				return
			end

			if parentWidget.type == "Root" then
				return
			end

			error("The MenuBar was not created directly under a window or root.")
		end,
		ChildAdded = function(p8)
			return p8.Instance
		end,
		Discard = function(p9)
			local parentWidget = p9.parentWidget

			p9.Instance:Destroy()
			p1._widgets.Window.Update(parentWidget)
		end
	})

	local widgetConstructor = p1.WidgetConstructor

	local v9 = p2.EVENTS.click(function(p10)
		return p10.Instance
	end)

	local v10 = p2.EVENTS.hover(function(p11)
		return p11.Instance
	end)

	widgetConstructor("Menu", {
		hasState = true,
		hasChildren = true,
		Args = { Text = 1 },
		Events = {
			clicked = v9,
			hovered = v10,
			opened = {
				Init = function(_)
				end,
				Get = function(p13)
					return p13.lastOpenedTick == p1._cycleTick
				end
			},
			closed = {
				Init = function(_)
				end,
				Get = function(p15)
					return p15.lastClosedTick == p1._cycleTick
				end
			}
		},
		Generate = function(p16)
			p16.ButtonColors = {
				ButtonTransparency = 1,
				ButtonColor = p1._config.HeaderColor,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderHoveredColor,
				ButtonActiveTransparency = p1._config.HeaderHoveredTransparency
			}

			local textButton

			if p16.parentWidget.type == "Menu" then
				textButton = Instance.new("TextButton")
				textButton.Name = "Menu"
				textButton.BackgroundColor3 = p1._config.HeaderColor
				textButton.BackgroundTransparency = 1
				textButton.BorderSizePixel = 0
				textButton.Size = UDim2.fromScale(1, 0)
				textButton.Text = ""
				textButton.AutomaticSize = Enum.AutomaticSize.Y
				textButton.ZIndex = p16.ZIndex
				textButton.LayoutOrder = p16.ZIndex
				textButton.AutoButtonColor = false

				local v57 = p2.UIPadding(textButton, p1._config.FramePadding)

				v57.PaddingTop = v57.PaddingTop - UDim.new(0, 1)

				local v58 = p2.UIListLayout(textButton, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

				v58.VerticalAlignment = Enum.VerticalAlignment.Center

				local textLabel: TextLabel = Instance.new("TextLabel")

				textLabel.Name = "TextLabel"
				textLabel.AnchorPoint = Vector2.new(0, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.ZIndex = p16.ZIndex + 2
				textLabel.LayoutOrder = p16.ZIndex + 2
				textLabel.AutomaticSize = Enum.AutomaticSize.XY
				p2.applyTextStyle(textLabel)
				textLabel.Parent = textButton
				v57 = p1._config.TextSize + 2 * p1._config.FramePadding.Y

				local rounded = math.round(v57 * 0.2)
				local n1 = v57 - rounded * 2
				local icon: ImageLabel = Instance.new("ImageLabel")

				icon.Name = "Icon"
				icon.Size = UDim2.fromOffset(n1, n1)
				icon.BackgroundTransparency = 1
				icon.BorderSizePixel = 0
				icon.ImageColor3 = p1._config.TextColor
				icon.ImageTransparency = p1._config.TextTransparency
				icon.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
				icon.ZIndex = p16.ZIndex + 3
				icon.LayoutOrder = p16.ZIndex + 3
				icon.Parent = textButton
			else
				textButton = Instance.new("TextButton")
				textButton.Name = "Menu"
				textButton.Size = UDim2.fromScale(0, 0)
				textButton.AutomaticSize = Enum.AutomaticSize.XY
				textButton.BackgroundColor3 = p1._config.HeaderColor
				textButton.BackgroundTransparency = 1
				textButton.BorderSizePixel = 0
				textButton.Text = ""
				textButton.LayoutOrder = p16.ZIndex
				textButton.ZIndex = p16.ZIndex
				textButton.AutoButtonColor = false
				textButton.ClipsDescendants = true
				p2.applyTextStyle(textButton)
				p2.UIPadding(textButton, Vector2.new(p1._config.ItemSpacing.X, p1._config.FramePadding.Y))
			end

			p2.applyInteractionHighlights(textButton, textButton, p16.ButtonColors)
			textButton.MouseButton1Click:Connect(function()
				local u107: boolean = if #t1 <= 1 then not p16.state.isOpened.value else true

				p16.state.isOpened:set(u107)
				u3 = u107
				u4 = u107 and p16 or nil

				if not (#t1 <= 1) then
					return
				end

				if u107 then
					table.insert(t1, p16)

					return
				end

				table.remove(t1)
			end)
			textButton.MouseEnter:Connect(function()
				if u3 and u4 and u4 ~= p16 then
					local v108 = table.find(t1, p16.parentWidget)

					EmptyMenuStack(v108)
					p16.state.isOpened:set(true)
					u4 = p16
					u3 = true
					table.insert(t1, p16)
				end
			end)

			local childContainer: ScrollingFrame = Instance.new("ScrollingFrame")

			childContainer.Name = "ChildContainer"
			childContainer.BackgroundColor3 = p1._config.WindowBgColor
			childContainer.BackgroundTransparency = p1._config.WindowBgTransparency
			childContainer.BorderSizePixel = 0
			childContainer.Size = UDim2.fromOffset(0, 0)
			childContainer.AutomaticSize = Enum.AutomaticSize.XY
			childContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
			childContainer.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
			childContainer.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
			childContainer.ScrollBarThickness = p1._config.ScrollbarSize
			childContainer.CanvasSize = UDim2.fromScale(0, 0)
			childContainer.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			childContainer.ZIndex = p16.ZIndex + 6
			childContainer.LayoutOrder = p16.ZIndex + 6
			childContainer.ClipsDescendants = true

			local v64 = p2.UIListLayout(childContainer, Enum.FillDirection.Vertical, UDim.new(0, 1))

			v64.VerticalAlignment = Enum.VerticalAlignment.Top
			childContainer.Parent = p1._rootInstance and p1._rootInstance:FindFirstChild("PopupScreenGui")
			p16.ChildContainer = childContainer
			p2.UIStroke(childContainer, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
			p2.UIPadding(childContainer, Vector2.new(2, p1._config.WindowPadding.Y - p1._config.ItemSpacing.Y))

			return textButton
		end,
		Update = function(p17)
			local instance = p17.Instance

			(if p17.parentWidget.type == "Menu" then instance.TextLabel else instance).Text = p17.arguments.Text or "Menu"
		end,
		ChildAdded = function(p18, _)
			UpdateChildContainerTransform(p18)

			return p18.ChildContainer
		end,
		ChildDiscarded = function(p20, _)
			UpdateChildContainerTransform(p20)
		end,
		GenerateState = function(p22)
			if p22.state.isOpened == nil then
				p22.state.isOpened = p1._widgetState(p22, "isOpened", false)
			end
		end,
		UpdateState = function(p23)
			local childContainer = p23.ChildContainer

			if p23.state.isOpened.value then
				p23.lastOpenedTick = p1._cycleTick + 1
				p23.ButtonColors.ButtonTransparency = p1._config.HeaderTransparency
				childContainer.Visible = true
				UpdateChildContainerTransform(p23)

				return
			end

			p23.lastClosedTick = p1._cycleTick + 1
			p23.ButtonColors.ButtonTransparency = 1
			childContainer.Visible = false
		end,
		Discard = function(p24)
			p24.Instance:Destroy()
			p2.discardState(p24)
		end
	})

	local v11 = p1.WidgetConstructor

	v10 = p2.EVENTS.click(function(p25)
		return p25.Instance
	end)
	v9 = p2.EVENTS.hover(function(p26)
		return p26.Instance
	end)
	v11("MenuItem", {
		hasState = false,
		hasChildren = false,
		Args = { Text = 1, KeyCode = 2, ModifierKey = 3 },
		Events = { clicked = v10, hovered = v9 },
		Generate = function(p27)
			local menuItem: TextButton = Instance.new("TextButton")

			menuItem.Name = "MenuItem"
			menuItem.BackgroundTransparency = 1
			menuItem.BorderSizePixel = 0
			menuItem.Size = UDim2.fromScale(1, 0)
			menuItem.Text = ""
			menuItem.AutomaticSize = Enum.AutomaticSize.Y
			menuItem.ZIndex = p27.ZIndex
			menuItem.LayoutOrder = p27.ZIndex
			menuItem.AutoButtonColor = false

			local v79 = p2.UIPadding(menuItem, p1._config.FramePadding)

			v79.PaddingTop = v79.PaddingTop - UDim.new(0, 1)
			p2.UIListLayout(menuItem, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))
			p2.applyInteractionHighlights(menuItem, menuItem, {
				ButtonTransparency = 1,
				ButtonColor = p1._config.HeaderColor,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderHoveredColor,
				ButtonActiveTransparency = p1._config.HeaderHoveredTransparency
			})
			menuItem.MouseButton1Click:Connect(function()
				EmptyMenuStack()
			end)
			menuItem.MouseEnter:Connect(function()
				local parentWidget = p27.parentWidget

				if u3 and u4 and parentWidget ~= u4 then
					local v110 = table.find(t1, parentWidget)

					EmptyMenuStack(v110)
					u4 = parentWidget
					u3 = true
				end
			end)

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.AnchorPoint = Vector2.new(0, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p27.ZIndex + 2
			textLabel.LayoutOrder = p27.ZIndex + 2
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyTextStyle(textLabel)
			textLabel.Parent = menuItem

			local shortcut: TextLabel = Instance.new("TextLabel")

			shortcut.Name = "Shortcut"
			shortcut.AnchorPoint = Vector2.new(0, 0)
			shortcut.BackgroundTransparency = 1
			shortcut.BorderSizePixel = 0
			shortcut.ZIndex = p27.ZIndex + 3
			shortcut.LayoutOrder = p27.ZIndex + 3
			shortcut.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyTextStyle(shortcut)
			shortcut.Text = ""
			shortcut.TextColor3 = p1._config.TextDisabledColor
			shortcut.TextTransparency = p1._config.TextDisabledTransparency
			shortcut.Parent = menuItem

			return menuItem
		end,
		Update = function(p28)
			local instance = p28.Instance
			local shortcut = instance.Shortcut

			instance.TextLabel.Text = p28.arguments.Text

			if p28.arguments.KeyCode then
				shortcut.Text = p28.arguments.ModifierKey.Name .. " + " .. p28.arguments.KeyCode.Name
			end
		end,
		Discard = function(p29)
			p29.Instance:Destroy()
		end
	})

	local v12 = p1.WidgetConstructor

	v10 = p2.EVENTS.hover(function(p34)
		return p34.Instance
	end)
	v12("MenuToggle", {
		hasState = true,
		hasChildren = false,
		Args = { Text = 1, KeyCode = 2, ModifierKey = 3 },
		Events = {
			checked = {
				Init = function(_)
				end,
				Get = function(p31)
					return p31.lastCheckedTick == p1._cycleTick
				end
			},
			unchecked = {
				Init = function(_)
				end,
				Get = function(p33)
					return p33.lastUncheckedTick == p1._cycleTick
				end
			},
			hovered = v10
		},
		Generate = function(p35)
			local menuItem: TextButton = Instance.new("TextButton")

			menuItem.Name = "MenuItem"
			menuItem.BackgroundTransparency = 1
			menuItem.BorderSizePixel = 0
			menuItem.Size = UDim2.fromScale(1, 0)
			menuItem.Text = ""
			menuItem.AutomaticSize = Enum.AutomaticSize.Y
			menuItem.ZIndex = p35.ZIndex
			menuItem.LayoutOrder = p35.ZIndex
			menuItem.AutoButtonColor = false

			local v93 = p2.UIPadding(menuItem, p1._config.FramePadding)

			v93.PaddingTop = v93.PaddingTop - UDim.new(0, 1)

			local v94 = p2.UIListLayout(menuItem, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

			v94.VerticalAlignment = Enum.VerticalAlignment.Center
			p2.applyInteractionHighlights(menuItem, menuItem, {
				ButtonTransparency = 1,
				ButtonColor = p1._config.HeaderColor,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderHoveredColor,
				ButtonActiveTransparency = p1._config.HeaderHoveredTransparency
			})
			menuItem.MouseButton1Click:Connect(function()
				p35.state.isChecked:set(not p35.state.isChecked.value)
				EmptyMenuStack()
			end)
			menuItem.MouseEnter:Connect(function()
				local parentWidget = p35.parentWidget

				if u3 and u4 and parentWidget ~= u4 then
					local v112 = table.find(t1, parentWidget)

					EmptyMenuStack(v112)
					u4 = parentWidget
					u3 = true
				end
			end)

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.AnchorPoint = Vector2.new(0, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p35.ZIndex + 2
			textLabel.LayoutOrder = p35.ZIndex + 2
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyTextStyle(textLabel)
			textLabel.Parent = menuItem

			local shortcut: TextLabel = Instance.new("TextLabel")

			shortcut.Name = "Shortcut"
			shortcut.AnchorPoint = Vector2.new(0, 0)
			shortcut.BackgroundTransparency = 1
			shortcut.BorderSizePixel = 0
			shortcut.ZIndex = p35.ZIndex + 3
			shortcut.LayoutOrder = p35.ZIndex + 3
			shortcut.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyTextStyle(shortcut)
			shortcut.Text = ""
			shortcut.TextColor3 = p1._config.TextDisabledColor
			shortcut.TextTransparency = p1._config.TextDisabledTransparency
			shortcut.Parent = menuItem
			v93 = p1._config.TextSize + 2 * p1._config.FramePadding.Y

			local rounded = math.round(v93 * 0.2)
			local n1 = v93 - rounded * 2
			local icon: ImageLabel = Instance.new("ImageLabel")

			icon.Name = "Icon"
			icon.Size = UDim2.fromOffset(n1, n1)
			icon.BackgroundTransparency = 1
			icon.BorderSizePixel = 0
			icon.ImageColor3 = p1._config.TextColor
			icon.ImageTransparency = p1._config.TextTransparency
			icon.Image = p2.ICONS.CHECK_MARK
			icon.ZIndex = p35.ZIndex + 4
			icon.LayoutOrder = p35.ZIndex + 4
			icon.Parent = menuItem

			return menuItem
		end,
		GenerateState = function(p36)
			if p36.state.isChecked == nil then
				p36.state.isChecked = p1._widgetState(p36, "isChecked", false)
			end
		end,
		Update = function(p37)
			local instance = p37.Instance
			local shortcut = instance.Shortcut

			instance.TextLabel.Text = p37.arguments.Text

			if p37.arguments.KeyCode then
				shortcut.Text = p37.arguments.ModifierKey.Name .. " + " .. p37.arguments.KeyCode.Name
			end
		end,
		UpdateState = function(p38)
			local icon = p38.Instance.Icon

			if p38.state.isChecked.value then
				icon.Image = p2.ICONS.CHECK_MARK
				p38.lastCheckedTick = p1._cycleTick + 1

				return
			end

			icon.Image = ""
			p38.lastUncheckedTick = p1._cycleTick + 1
		end,
		Discard = function(p39)
			p39.Instance:Destroy()
			p2.discardState(p39)
		end
	})
end
