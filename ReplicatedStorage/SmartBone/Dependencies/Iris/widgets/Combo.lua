



require(script.Parent.Parent.Types)

return function(p1, p2)
	local function onSelectionChange(p3)
		if type(p3.state.index.value) == "boolean" then
			p3.state.index:set(not p3.state.index.value)

			return
		end

		p3.state.index:set(p3.arguments.Index)
	end

	local widgetConstructor = p1.WidgetConstructor

	local v5 = p2.EVENTS.click(function(p10)
		return p10.Instance.SelectableButton
	end)

	local v6 = p2.EVENTS.rightClick(function(p11)
		return p11.Instance.SelectableButton
	end)

	local v7 = p2.EVENTS.doubleClick(function(p12)
		return p12.Instance.SelectableButton
	end)

	local v8 = p2.EVENTS.ctrlClick(function(p13)
		return p13.Instance.SelectableButton
	end)

	local v9 = p2.EVENTS.hover(function(p14)
		return p14.Instance.SelectableButton
	end)

	widgetConstructor("Selectable", {
		hasState = true,
		hasChildren = false,
		Args = { Text = 1, Index = 2, NoClick = 3 },
		Events = {
			selected = {
				Init = function(_)
				end,
				Get = function(p5)
					return p5.lastSelectedTick == p1._cycleTick
				end
			},
			unselected = {
				Init = function(_)
				end,
				Get = function(p7)
					return p7.lastUnselectedTick == p1._cycleTick
				end
			},
			active = {
				Init = function(_)
				end,
				Get = function(p9)
					return p9.state.index.value == p9.arguments.Index
				end
			},
			clicked = v5,
			rightClicked = v6,
			doubleClicked = v7,
			ctrlClicked = v8,
			hovered = v9
		},
		Generate = function(p15)
			local iris_Selectable: Frame = Instance.new("Frame")

			iris_Selectable.Name = "Iris_Selectable"
			iris_Selectable.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, p1._config.TextSize))
			iris_Selectable.AutomaticSize = Enum.AutomaticSize.None
			iris_Selectable.BackgroundTransparency = 1
			iris_Selectable.BorderSizePixel = 0
			iris_Selectable.ZIndex = p15.ZIndex
			iris_Selectable.LayoutOrder = p15.ZIndex

			local selectableButton: TextButton = Instance.new("TextButton")

			selectableButton.Name = "SelectableButton"
			selectableButton.Size = UDim2.new(1, 0, 1, p1._config.ItemSpacing.Y - 1)

			local uDim2FromOffset = UDim2.fromOffset
			local v33 = bit32.rshift(p1._config.ItemSpacing.Y, 1)

			selectableButton.Position = uDim2FromOffset(0, -v33)
			selectableButton.BackgroundColor3 = p1._config.HeaderColor
			selectableButton.ZIndex = p15.ZIndex + 1
			selectableButton.LayoutOrder = p15.ZIndex + 1
			p2.applyFrameStyle(selectableButton)
			p2.applyTextStyle(selectableButton)
			p15.ButtonColors = {
				ButtonTransparency = 1,
				ButtonColor = p1._config.HeaderColor,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderActiveColor,
				ButtonActiveTransparency = p1._config.HeaderActiveTransparency
			}
			p2.applyInteractionHighlights(selectableButton, selectableButton, p15.ButtonColors)
			selectableButton.MouseButton1Click:Connect(function()
				if p15.arguments.NoClick == true then
					return
				end

				local v89 = p15

				if type(v89.state.index.value) == "boolean" then
					v89.state.index:set(not v89.state.index.value)

					return
				end

				v89.state.index:set(v89.arguments.Index)
			end)
			selectableButton.Parent = iris_Selectable

			return iris_Selectable
		end,
		Update = function(p16)
			p16.Instance.SelectableButton.Text = p16.arguments.Text or "Selectable"
		end,
		Discard = function(p17)
			p17.Instance:Destroy()
			p2.discardState(p17)
		end,
		GenerateState = function(p18)
			if p18.state.index == nil then
				if p18.arguments.Index ~= nil then
					error("a shared state index is required for Selectables with an Index argument", 5)
				end

				p18.state.index = p1._widgetState(p18, "index", false)
			end
		end,
		UpdateState = function(p19)
			local selectableButton = p19.Instance.SelectableButton

			if p19.state.index.value == (p19.arguments.Index or true) then
				p19.ButtonColors.ButtonTransparency = p1._config.HeaderTransparency
				selectableButton.BackgroundTransparency = p1._config.HeaderTransparency
				p19.lastSelectedTick = p1._cycleTick + 1

				return
			end

			p19.ButtonColors.ButtonTransparency = 1
			selectableButton.BackgroundTransparency = 1
			p19.lastUnselectedTick = p1._cycleTick + 1
		end
	})

	local u10: boolean = false
	local n1 = -1
	local u12 = nil

	local function UpdateChildContainerTransform(p20)
		local previewContainer = p20.Instance.PreviewContainer
		local previewContainerPreviewLabel = previewContainer.PreviewLabel
		local childContainer = p20.ChildContainer
		local n1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
		local popupBorderSize = p1._config.PopupBorderSize
		local v45 = math.min(p20.ComboChildrenHeight, 8)
		local n2 = n1 * v45 - popupBorderSize * 2 + 3 * p1._config.FramePadding.Y
		local uDim = UDim.new(0, previewContainer.AbsoluteSize.X - popupBorderSize * 2)

		childContainer.Size = UDim2.new(uDim, UDim.new(0, n2))

		if previewContainerPreviewLabel.AbsolutePosition.Y + n1 + n2 > childContainer.Parent.AbsoluteSize.Y then
			childContainer.Position = UDim2.new(0, previewContainerPreviewLabel.AbsolutePosition.X + popupBorderSize, 0, previewContainerPreviewLabel.AbsolutePosition.Y - popupBorderSize - n2)

			return
		end

		childContainer.Position = UDim2.new(0, previewContainerPreviewLabel.AbsolutePosition.X + popupBorderSize, 0, previewContainerPreviewLabel.AbsolutePosition.Y + n1 + popupBorderSize)
	end

	p2.UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.Touch then
			if u10 == false then
				return
			end

			if n1 == p1._cycleTick then
				return
			end

			local v49 = p2.getMouseLocation()
			local childContainer = u12.ChildContainer
			local childContainerAbsolutePosition = childContainer.AbsolutePosition
			local vector2 = Vector2.new(0, u12.LabelHeight)

			if not p2.isPosInsideRect(v49, childContainerAbsolutePosition - vector2, childContainer.AbsolutePosition + childContainer.AbsoluteSize) then
				u12.state.isOpened:set(false)
			end

			return
		end
	end)

	local v14 = p1.WidgetConstructor

	local v15 = p2.EVENTS.click(function(p26)
		return p26.Instance
	end)

	local v16 = p2.EVENTS.hover(function(p27)
		return p27.Instance
	end)

	v14("Combo", {
		hasState = true,
		hasChildren = true,
		Args = { Text = 1, NoButton = 2, NoPreview = 3 },
		Events = {
			opened = {
				Init = function(_)
				end,
				Get = function(p23)
					return p23.lastOpenedTick == p1._cycleTick
				end
			},
			closed = {
				Init = function(_)
				end,
				Get = function(p25)
					return p25.lastClosedTick == p1._cycleTick
				end
			},
			clicked = v15,
			hovered = v16
		},
		Generate = function(p28)
			local n1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y

			p28.ComboChildrenHeight = 0

			local iris_Combo: Frame = Instance.new("Frame")

			iris_Combo.Name = "Iris_Combo"
			iris_Combo.Size = UDim2.fromScale(1, 0)
			iris_Combo.AutomaticSize = Enum.AutomaticSize.Y
			iris_Combo.BackgroundTransparency = 1
			iris_Combo.BorderSizePixel = 0
			iris_Combo.ZIndex = p28.ZIndex
			iris_Combo.LayoutOrder = p28.ZIndex
			p2.UIListLayout(iris_Combo, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.Y + 1))

			local previewContainer: TextButton = Instance.new("TextButton")

			previewContainer.Name = "PreviewContainer"
			previewContainer.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
			previewContainer.AutomaticSize = Enum.AutomaticSize.Y
			previewContainer.BackgroundTransparency = 1
			previewContainer.Text = ""
			previewContainer.ZIndex = p28.ZIndex + 2
			previewContainer.LayoutOrder = p28.ZIndex + 2
			previewContainer.AutoButtonColor = false
			p2.applyFrameStyle(previewContainer, true, true)
			p2.UIListLayout(previewContainer, Enum.FillDirection.Horizontal, UDim.new(0, 0))
			previewContainer.Parent = iris_Combo

			local previewLabel: TextLabel = Instance.new("TextLabel")

			previewLabel.Name = "PreviewLabel"
			previewLabel.Size = UDim2.new(1, 0, 0, 0)
			previewLabel.AutomaticSize = Enum.AutomaticSize.Y
			previewLabel.BackgroundColor3 = p1._config.FrameBgColor
			previewLabel.BackgroundTransparency = p1._config.FrameBgTransparency
			previewLabel.BorderSizePixel = 0
			previewLabel.ZIndex = p28.ZIndex + 3
			previewLabel.LayoutOrder = p28.ZIndex + 3
			p2.applyTextStyle(previewLabel)
			p2.UIPadding(previewLabel, p1._config.FramePadding)
			previewLabel.Parent = previewContainer

			local dropdownButton: TextLabel = Instance.new("TextLabel")

			dropdownButton.Name = "DropdownButton"
			dropdownButton.Size = UDim2.new(0, n1, 0, n1)
			dropdownButton.BorderSizePixel = 0
			dropdownButton.BackgroundColor3 = p1._config.ButtonColor
			dropdownButton.BackgroundTransparency = p1._config.ButtonTransparency
			dropdownButton.Text = ""
			dropdownButton.ZIndex = p28.ZIndex + 4
			dropdownButton.LayoutOrder = p28.ZIndex + 4

			local rounded = math.round(n1 * 0.2)
			local n2 = n1 - rounded * 2
			local dropdown: ImageLabel = Instance.new("ImageLabel")

			dropdown.Name = "Dropdown"
			dropdown.Size = UDim2.fromOffset(n2, n2)
			dropdown.Position = UDim2.fromOffset(rounded, rounded)
			dropdown.BackgroundTransparency = 1
			dropdown.BorderSizePixel = 0
			dropdown.ImageColor3 = p1._config.TextColor
			dropdown.ImageTransparency = p1._config.TextTransparency
			dropdown.ZIndex = p28.ZIndex + 5
			dropdown.LayoutOrder = p28.ZIndex + 5
			dropdown.Parent = dropdownButton
			dropdownButton.Parent = previewContainer
			p2.applyInteractionHighlightsWithMultiHighlightee(previewContainer, {
				{
					previewLabel,
					{
						ButtonColor = p1._config.FrameBgColor,
						ButtonTransparency = p1._config.FrameBgTransparency,
						ButtonHoveredColor = p1._config.FrameBgHoveredColor,
						ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
						ButtonActiveColor = p1._config.FrameBgActiveColor,
						ButtonActiveTransparency = p1._config.FrameBgActiveTransparency
					}
				},
				{
					dropdownButton,
					{
						ButtonColor = p1._config.ButtonColor,
						ButtonTransparency = p1._config.ButtonTransparency,
						ButtonHoveredColor = p1._config.ButtonHoveredColor,
						ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
						ButtonActiveColor = p1._config.ButtonHoveredColor,
						ButtonActiveTransparency = p1._config.ButtonHoveredColor
					}
				}
			})
			previewContainer.InputBegan:Connect(function(input: InputObject)
				if u10 and u12 ~= p28 then
				elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					p28.state.isOpened:set(not p28.state.isOpened.value)
				end
			end)

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.Size = UDim2.fromOffset(0, n1)
			textLabel.AutomaticSize = Enum.AutomaticSize.X
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p28.ZIndex + 5
			textLabel.LayoutOrder = p28.ZIndex + 5
			p2.applyTextStyle(textLabel)
			textLabel.Parent = iris_Combo

			local childContainer: ScrollingFrame = Instance.new("ScrollingFrame")

			childContainer.Name = "ChildContainer"
			childContainer.BackgroundColor3 = p1._config.WindowBgColor
			childContainer.BackgroundTransparency = p1._config.WindowBgTransparency
			childContainer.BorderSizePixel = 0
			childContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
			childContainer.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
			childContainer.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
			childContainer.ScrollBarThickness = p1._config.ScrollbarSize
			childContainer.CanvasSize = UDim2.fromScale(0, 0)
			childContainer.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			childContainer.ZIndex = p28.ZIndex + 6
			childContainer.LayoutOrder = p28.ZIndex + 6
			childContainer.ClipsDescendants = true
			p2.UIStroke(childContainer, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
			p2.UIPadding(childContainer, Vector2.new(2, 2 * p1._config.FramePadding.Y))

			local v70 = p2.UIListLayout(childContainer, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))

			v70.VerticalAlignment = Enum.VerticalAlignment.Top

			local v71 = p1._rootInstance

			if v71 then
				v71 = p1._rootInstance:WaitForChild("PopupScreenGui")
			end

			childContainer.Parent = v71
			p28.ChildContainer = childContainer

			return iris_Combo
		end,
		Update = function(p30)
			local instance = p30.Instance
			local previewContainer = instance.PreviewContainer
			local previewContainerPreviewLabel = previewContainer.PreviewLabel
			local previewContainerDropdownButton = previewContainer.DropdownButton

			instance.TextLabel.Text = p30.arguments.Text or "Combo"

			if p30.arguments.NoButton then
				previewContainerDropdownButton.Visible = false
				previewContainerPreviewLabel.Size = UDim2.new(1, 0, 0, 0)
			else
				previewContainerDropdownButton.Visible = true
				previewContainerPreviewLabel.Size = UDim2.new(1, -(p1._config.TextSize + 2 * p1._config.FramePadding.Y), 0, 0)
			end

			if p30.arguments.NoPreview then
				previewContainerPreviewLabel.Visible = false
				previewContainer.Size = UDim2.new(0, 0, 0, 0)
				previewContainer.AutomaticSize = Enum.AutomaticSize.X

				return
			end

			previewContainerPreviewLabel.Visible = true
			previewContainer.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
			previewContainer.AutomaticSize = Enum.AutomaticSize.Y
		end,
		ChildAdded = function(p31, p32)
			if p32.type == "Selectable" then
				p31.ComboChildrenHeight = p31.ComboChildrenHeight + 1
			else
				p31.ComboChildrenHeight = p31.ComboChildrenHeight + 10
			end

			UpdateChildContainerTransform(p31)

			return p31.ChildContainer
		end,
		ChildDiscarded = function(p33, p34)
			if p34.type == "Selectable" then
				p33.ComboChildrenHeight = p33.ComboChildrenHeight - 1

				return
			end

			p33.ComboChildrenHeight = p33.ComboChildrenHeight - 10
		end,
		GenerateState = function(p35)
			if p35.state.index == nil then
				p35.state.index = p1._widgetState(p35, "index", "No Selection")
			end

			p35.state.index:onChange(function()
				if p35.state.isOpened.value then
					p35.state.isOpened:set(false)
				end
			end)

			if p35.state.isOpened == nil then
				p35.state.isOpened = p1._widgetState(p35, "isOpened", false)
			end
		end,
		UpdateState = function(p36)
			local previewContainer = p36.Instance.PreviewContainer
			local previewContainerPreviewLabel = previewContainer.PreviewLabel
			local dropdown = previewContainer.DropdownButton.Dropdown
			local childContainer = p36.ChildContainer

			if p36.state.isOpened.value then
				u10 = true
				u12 = p36
				n1 = p1._cycleTick
				p36.lastOpenedTick = p1._cycleTick + 1
				dropdown.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
				childContainer.Visible = true
				UpdateChildContainerTransform(p36)
			else
				if u10 then
					u10 = false
					u12 = nil
					p36.lastClosedTick = p1._cycleTick + 1
				end

				dropdown.Image = p2.ICONS.DOWN_POINTING_TRIANGLE
				childContainer.Visible = false
			end

			local value = p36.state.index.value

			previewContainerPreviewLabel.Text = if typeof(value) == "EnumItem" then value.Name else tostring(value)
		end,
		Discard = function(p37)
			p37.Instance:Destroy()
			p2.discardState(p37)
		end
	})
end
