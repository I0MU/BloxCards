



require(script.Parent.Parent.Types)

return function(p1, p2)
	local function relocateTooltips()
		if p1._rootInstance == nil then
			return
		end

		local popupScreenGui = p1._rootInstance:FindFirstChild("PopupScreenGui")

		if not popupScreenGui then
			return
		end

		local popupScreenGuiTooltipContainer = popupScreenGui.TooltipContainer
		local v25 = p2.getMouseLocation()
		local v26 = p2.findBestWindowPosForPopup(v25, popupScreenGuiTooltipContainer.AbsoluteSize, p1._config.DisplaySafeAreaPadding, popupScreenGui.AbsoluteSize)

		popupScreenGuiTooltipContainer.Position = UDim2.fromOffset(v26.X, v26.Y)
	end

	p2.UserInputService.InputChanged:Connect(relocateTooltips)
	p1.WidgetConstructor("Tooltip", {
		hasState = false,
		hasChildren = false,
		Args = { Text = 1 },
		Events = {},
		Generate = function(p3)
			p3.parentWidget = p1._rootWidget

			local iris_Tooltip: Frame = Instance.new("Frame")

			iris_Tooltip.Name = "Iris_Tooltip"
			iris_Tooltip.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
			iris_Tooltip.AutomaticSize = Enum.AutomaticSize.Y
			iris_Tooltip.BorderSizePixel = 0
			iris_Tooltip.BackgroundTransparency = 1
			iris_Tooltip.ZIndex = p3.ZIndex + 1
			iris_Tooltip.LayoutOrder = p3.ZIndex + 1

			local tooltipText: TextLabel = Instance.new("TextLabel")

			tooltipText.Name = "TooltipText"
			tooltipText.Size = UDim2.fromOffset(0, 0)
			tooltipText.AutomaticSize = Enum.AutomaticSize.XY
			tooltipText.BackgroundColor3 = p1._config.WindowBgColor
			tooltipText.BackgroundTransparency = p1._config.WindowBgTransparency
			tooltipText.BorderSizePixel = p1._config.PopupBorderSize
			tooltipText.TextWrapped = true
			tooltipText.ZIndex = p3.ZIndex + 1
			tooltipText.LayoutOrder = p3.ZIndex + 1
			p2.applyTextStyle(tooltipText)
			p2.UIStroke(tooltipText, p1._config.WindowBorderSize, p1._config.BorderActiveColor, p1._config.BorderActiveTransparency)
			p2.UIPadding(tooltipText, p1._config.WindowPadding)

			if p1._config.PopupRounding > 0 then
				p2.UICorner(tooltipText, p1._config.PopupRounding)
			end

			tooltipText.Parent = iris_Tooltip

			return iris_Tooltip
		end,
		Update = function(p4)
			local tooltipText = p4.Instance.TooltipText

			if p4.arguments.Text == nil then
				error("Iris.Text Text Argument is required", 5)
			end

			tooltipText.Text = p4.arguments.Text
			relocateTooltips()
		end,
		Discard = function(p5)
			p5.Instance:Destroy()
		end
	})

	local n1: number = 0
	local u5 = nil
	local u6: boolean = false
	local u7 = nil
	local u8 = nil
	local u9: boolean = false
	local u10: boolean = false
	local u11: boolean = false
	local top = Enum.TopBottom.Top
	local left = Enum.LeftRight.Left
	local u14 = nil
	local u15 = nil
	local u16: boolean = false
	local t1: {[any]: any} = {}

	local function quickSwapWindows()
		if p1._config.UseScreenGUIs == false then
			return
		end

		local n1 = 65535
		local v34 = nil

		for key, value in t1 do
			if value.state.isOpened.value and not value.arguments.NoNav and value.Instance:IsA("ScreenGui") then
				local displayOrder = value.Instance.DisplayOrder

				if n1 > displayOrder then
					n1 = displayOrder
					v34 = value
				end
			end
		end

		if v34.state.isUncollapsed.value == false then
			v34.state.isUncollapsed:set(true)
		end

		p1.SetFocusedWindow(v34)
	end
	local function fitSizeToWindowBounds(p6, p7)
		local vector2 = Vector2.new(p6.state.position.value.X, p6.state.position.value.Y)
		local n1 = (p1._config.TextSize + p1._config.FramePadding.Y * 2) * 2
		local v42 = p2.getScreenSizeForWindow(p6)
		local vector22 = Vector2.new(p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.X, p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.Y)
		local n2 = v42 - vector2 - vector22
		local vector2New = Vector2.new
		local x = p7.X
		local v47 = math.max(n2.X, n1)
		local v48 = math.clamp(x, n1, v47)
		local y = p7.Y
		local v50 = math.max(n2.Y, n1)
		local v51 = math.clamp(y, n1, v50)

		return vector2New(v48, v51)
	end
	local function fitPositionToWindowBounds(p8, p9)
		local instance = p8.Instance
		local v55 = p2.getScreenSizeForWindow(p8)
		local vector2 = Vector2.new(p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.X, p1._config.WindowBorderSize + p1._config.DisplaySafeAreaPadding.Y)
		local vector2New = Vector2.new
		local x = p9.X
		local vector2X = vector2.X
		local v60 = math.max(vector2.X, v55.X - instance.WindowButton.AbsoluteSize.X - vector2.X)
		local v61 = math.clamp(x, vector2X, v60)
		local y = p9.Y
		local vector2Y = vector2.Y
		local v64 = math.max(vector2.Y, v55.Y - instance.WindowButton.AbsoluteSize.Y - vector2.Y)
		local v65 = math.clamp(y, vector2Y, v64)

		return vector2New(v61, v65)
	end
	function p1.SetFocusedWindow(p10)
		if p10 == u15 then
			return
		end

		if u16 and u15 ~= nil then
			if t1[u15.ID] then
				local windowButton = u15.Instance.WindowButton
				local windowButtonTitleBar = windowButton.TitleBar

				if u15.state.isUncollapsed.value then
					windowButtonTitleBar.BackgroundColor3 = p1._config.TitleBgColor
					windowButtonTitleBar.BackgroundTransparency = p1._config.TitleBgTransparency
				else
					windowButtonTitleBar.BackgroundColor3 = p1._config.TitleBgCollapsedColor
					windowButtonTitleBar.BackgroundTransparency = p1._config.TitleBgCollapsedTransparency
				end

				windowButton.UIStroke.Color = p1._config.BorderColor
			end

			u16 = false
			u15 = nil
		end

		if p10 == nil then
			return
		end

		u16 = true
		u15 = p10

		local instance = p10.Instance
		local instanceWindowButton = instance.WindowButton
		local titleBar = instanceWindowButton.TitleBar

		titleBar.BackgroundColor3 = p1._config.TitleBgActiveColor
		titleBar.BackgroundTransparency = p1._config.TitleBgActiveTransparency
		instanceWindowButton.UIStroke.Color = p1._config.BorderActiveColor
		n1 += 1

		if p10.usesScreenGUI then
			instance.DisplayOrder = n1 + p1._config.DisplayOrderOffset
		end

		if p10.state.isUncollapsed.value == false then
			p10.state.isUncollapsed:set(true)
		end

		if not p2.GuiService.SelectedObject then
			return
		end

		if titleBar.Visible then
			p2.GuiService:Select(titleBar)

			return
		end

		p2.GuiService:Select(instance.ChildContainer)
	end

	p2.UserInputService.InputBegan:Connect(function(input, p12)
		if not p12 and input.UserInputType == Enum.UserInputType.MouseButton1 then
			p1.SetFocusedWindow(nil)
		end

		if input.KeyCode == Enum.KeyCode.Tab and (not not p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or not not p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
			quickSwapWindows()
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 and u10 and not u11 and u16 and u15 then
			local n1 = p2.getMouseLocation() - (u15.state.position.value + u15.state.size.value * 0.5)
			local n2 = math.abs(n1.X) * u15.state.size.value.Y
			local absoluteValue = math.abs(n1.Y)

			if n2 >= absoluteValue * u15.state.size.value.X then
				top = Enum.TopBottom.Center
				left = if math.sign(n1.X) == -1 then Enum.LeftRight.Left else Enum.LeftRight.Right
			else
				left = Enum.LeftRight.Center
				top = if math.sign(n1.Y) == -1 then Enum.TopBottom.Top else Enum.TopBottom.Bottom
			end

			u9 = true
			u8 = u15
		end
	end)
	p2.UserInputService.TouchTapInWorld:Connect(function(_, p14)
		if not p14 then
			p1.SetFocusedWindow(nil)
		end
	end)
	p2.UserInputService.InputChanged:Connect(function(input)
		if u6 and u5 then
			local vector2

			if input.UserInputType == Enum.UserInputType.Touch then
				local inputPosition = input.Position

				vector2 = Vector2.new(inputPosition.X, inputPosition.Y)
			else
				vector2 = p2.getMouseLocation()
			end

			local windowButton = u5.Instance.WindowButton
			local v83 = fitPositionToWindowBounds(u5, vector2 - u7)

			windowButton.Position = UDim2.fromOffset(v83.X, v83.Y)
			u5.state.position.value = v83
		end

		if u9 and u8 and u8.arguments.NoResize ~= true then
			local v84 = u8.Instance.WindowButton
			local vector2 = Vector2.new(v84.Position.X.Offset, v84.Position.Y.Offset)
			local vector23 = Vector2.new(v84.Size.X.Offset, v84.Size.Y.Offset)
			local v87 = if input.UserInputType == Enum.UserInputType.Touch then input.Delta else p2.getMouseLocation() - u14
			local vector24 = Vector2.new(if left == Enum.LeftRight.Left then v87.X else 0, if top == Enum.TopBottom.Top then v87.Y else 0)
			local vector25 = Vector2.new(if left == Enum.LeftRight.Left then -v87.X else if left == Enum.LeftRight.Right then v87.X else 0, if top == Enum.TopBottom.Top then -v87.Y else if top == Enum.TopBottom.Bottom then v87.Y else 0)

			v87 = fitSizeToWindowBounds(u8, vector23 + vector25)

			local v90 = fitPositionToWindowBounds(u8, vector2 + vector24)

			v84.Size = UDim2.fromOffset(v87.X, v87.Y)
			u8.state.size.value = v87
			v84.Position = UDim2.fromOffset(v90.X, v90.Y)
			u8.state.position.value = v90
		end

		u14 = p2.getMouseLocation()
	end)
	p2.UserInputService.InputEnded:Connect(function(input, _)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and u6 and u5 then
			local windowButton = u5.Instance.WindowButton

			u6 = false
			u5.state.position:set(Vector2.new(windowButton.Position.X.Offset, windowButton.Position.Y.Offset))
		end

		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and u9 and u8 then
			u9 = false
			u8.state.size:set(u8.Instance.WindowButton.AbsoluteSize)
		end

		if input.KeyCode == Enum.KeyCode.ButtonX then
			quickSwapWindows()
		end
	end)

	local widgetConstructor = p1.WidgetConstructor

	local v22 = p2.EVENTS.hover(function(p26)
		return p26.Instance.WindowButton
	end)

	widgetConstructor("Window", {
		hasState = true,
		hasChildren = true,
		Args = {
			Title = 1,
			NoTitleBar = 2,
			NoBackground = 3,
			NoCollapse = 4,
			NoClose = 5,
			NoMove = 6,
			NoScrollbar = 7,
			NoResize = 8,
			NoNav = 9,
			NoMenu = 10
		},
		Events = {
			closed = {
				Init = function(_)
				end,
				Get = function(p19)
					return p19.lastClosedTick == p1._cycleTick
				end
			},
			opened = {
				Init = function(_)
				end,
				Get = function(p21)
					return p21.lastOpenedTick == p1._cycleTick
				end
			},
			collapsed = {
				Init = function(_)
				end,
				Get = function(p23)
					return p23.lastCollapsedTick == p1._cycleTick
				end
			},
			uncollapsed = {
				Init = function(_)
				end,
				Get = function(p25)
					return p25.lastUncollapsedTick == p1._cycleTick
				end
			},
			hovered = v22
		},
		Generate = function(p27)
			p27.parentWidget = p1._rootWidget
			p27.usesScreenGUI = p1._config.UseScreenGUIs
			t1[p27.ID] = p27

			local screenGui

			if p27.usesScreenGUI then
				screenGui = Instance.new("ScreenGui")
				screenGui.ResetOnSpawn = false
				screenGui.DisplayOrder = p1._config.DisplayOrderOffset
				screenGui.IgnoreGuiInset = p1._config.IgnoreGuiInset
			else
				screenGui = Instance.new("Folder")
			end

			screenGui.Name = "Iris_Window"

			local windowButton: TextButton = Instance.new("TextButton")

			windowButton.Name = "WindowButton"
			windowButton.Size = UDim2.fromOffset(0, 0)
			windowButton.BackgroundTransparency = 1
			windowButton.BorderSizePixel = 0
			windowButton.Text = ""
			windowButton.ClipsDescendants = false
			windowButton.AutoButtonColor = false
			windowButton.Selectable = false
			windowButton.SelectionImageObject = p1.SelectionImageObject
			windowButton.ZIndex = p27.ZIndex + 1
			windowButton.LayoutOrder = p27.ZIndex + 1
			windowButton.SelectionGroup = true
			windowButton.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			windowButton.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			windowButton.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			windowButton.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			p2.UIStroke(windowButton, p1._config.WindowBorderSize, p1._config.BorderColor, p1._config.BorderTransparency)
			windowButton.Parent = screenGui
			windowButton.InputBegan:Connect(function(input: InputObject)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Keyboard then
					return
				end

				if p27.state.isUncollapsed.value then
					p1.SetFocusedWindow(p27)
				end

				if not p27.arguments.NoMove and input.UserInputType == Enum.UserInputType.MouseButton1 then
					u5 = p27
					u6 = true
					u7 = p2.getMouseLocation() - p27.state.position.value
				end
			end)

			local childContainer: ScrollingFrame = Instance.new("ScrollingFrame")

			childContainer.Name = "ChildContainer"
			childContainer.Size = UDim2.fromScale(1, 1)
			childContainer.Position = UDim2.fromOffset(0, 0)
			childContainer.BackgroundColor3 = p1._config.WindowBgColor
			childContainer.BackgroundTransparency = p1._config.WindowBgTransparency
			childContainer.BorderSizePixel = 0
			childContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
			childContainer.ScrollBarImageTransparency = p1._config.ScrollbarGrabTransparency
			childContainer.ScrollBarImageColor3 = p1._config.ScrollbarGrabColor
			childContainer.CanvasSize = UDim2.fromScale(0, 1)
			childContainer.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			childContainer.ZIndex = p27.ZIndex + 3
			childContainer.LayoutOrder = p27.ZIndex + 3
			childContainer.ClipsDescendants = true
			p2.UIPadding(childContainer, p1._config.WindowPadding)
			childContainer.Parent = windowButton
			childContainer:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				p27.state.scrollDistance.value = childContainer.CanvasPosition.Y
			end)
			childContainer.InputBegan:Connect(function(input: InputObject)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Keyboard then
				elseif p27.state.isUncollapsed.value then
					p1.SetFocusedWindow(p27)
				end
			end)

			local terminatingFrame: Frame = Instance.new("Frame")

			terminatingFrame.Name = "TerminatingFrame"
			terminatingFrame.Size = UDim2.fromOffset(0, p1._config.WindowPadding.Y + p1._config.FramePadding.Y)
			terminatingFrame.BackgroundTransparency = 1
			terminatingFrame.BorderSizePixel = 0
			terminatingFrame.LayoutOrder = 2147483632

			local v108 = p2.UIListLayout(childContainer, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))

			v108.VerticalAlignment = Enum.VerticalAlignment.Top
			terminatingFrame.Parent = childContainer

			local titleBar: Frame = Instance.new("Frame")

			titleBar.Name = "TitleBar"
			titleBar.Size = UDim2.fromScale(1, 0)
			titleBar.AutomaticSize = Enum.AutomaticSize.Y
			titleBar.BorderSizePixel = 0
			titleBar.ZIndex = p27.ZIndex + 1
			titleBar.LayoutOrder = p27.ZIndex + 1
			titleBar.ClipsDescendants = true
			titleBar.Parent = windowButton
			titleBar.InputBegan:Connect(function(input: InputObject)
				if input.UserInputType == Enum.UserInputType.Touch and not p27.arguments.NoMove then
					u5 = p27
					u6 = true

					local inputPosition: Vector3 = input.Position

					u7 = Vector2.new(inputPosition.X, inputPosition.Y) - p27.state.position.value
				end
			end)

			local n1 = p1._config.TextSize + (p1._config.FramePadding.Y - 1) * 2
			local collapseButton: TextButton = Instance.new("TextButton")

			collapseButton.Name = "CollapseButton"
			collapseButton.AnchorPoint = Vector2.new(0, 0.5)
			collapseButton.Size = UDim2.fromOffset(n1, n1)
			collapseButton.Position = UDim2.new(0, p1._config.FramePadding.X + 1, 0.5, 0)
			collapseButton.AutomaticSize = Enum.AutomaticSize.None
			collapseButton.BackgroundTransparency = 1
			collapseButton.BorderSizePixel = 0
			collapseButton.AutoButtonColor = false
			collapseButton.Text = ""
			collapseButton.ZIndex = p27.ZIndex + 4
			p2.UICorner(collapseButton)
			collapseButton.Parent = titleBar
			collapseButton.MouseButton1Click:Connect(function()
				p27.state.isUncollapsed:set(not p27.state.isUncollapsed.value)
			end)
			p2.applyInteractionHighlights(collapseButton, collapseButton, {
				ButtonTransparency = 1,
				ButtonColor = p1._config.ButtonColor,
				ButtonHoveredColor = p1._config.ButtonHoveredColor,
				ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
				ButtonActiveColor = p1._config.ButtonActiveColor,
				ButtonActiveTransparency = p1._config.ButtonActiveTransparency
			})

			local arrow: ImageLabel = Instance.new("ImageLabel")

			arrow.Name = "Arrow"
			arrow.AnchorPoint = Vector2.new(0.5, 0.5)

			local uDim2FromOffset = UDim2.fromOffset
			local floored = math.floor(n1 * 0.7)
			local floored2 = math.floor(n1 * 0.7)

			arrow.Size = uDim2FromOffset(floored, floored2)
			arrow.Position = UDim2.fromScale(0.5, 0.5)
			arrow.BackgroundTransparency = 1
			arrow.BorderSizePixel = 0
			arrow.Image = p2.ICONS.MULTIPLICATION_SIGN
			arrow.ImageColor3 = p1._config.TextColor
			arrow.ImageTransparency = p1._config.TextTransparency
			arrow.ZIndex = p27.ZIndex + 5
			arrow.Parent = collapseButton

			local closeButton: TextButton = Instance.new("TextButton")

			closeButton.Name = "CloseButton"
			closeButton.AnchorPoint = Vector2.new(1, 0.5)
			closeButton.Size = UDim2.fromOffset(n1, n1)
			closeButton.Position = UDim2.new(1, -(p1._config.FramePadding.X + 1), 0.5, 0)
			closeButton.AutomaticSize = Enum.AutomaticSize.None
			closeButton.BackgroundTransparency = 1
			closeButton.BorderSizePixel = 0
			closeButton.Text = ""
			closeButton.ZIndex = p27.ZIndex + 4
			closeButton.AutoButtonColor = false
			p2.UICorner(closeButton)
			closeButton.MouseButton1Click:Connect(function()
				p27.state.isOpened:set(false)
			end)
			p2.applyInteractionHighlights(closeButton, closeButton, {
				ButtonTransparency = 1,
				ButtonColor = p1._config.ButtonColor,
				ButtonHoveredColor = p1._config.ButtonHoveredColor,
				ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
				ButtonActiveColor = p1._config.ButtonActiveColor,
				ButtonActiveTransparency = p1._config.ButtonActiveTransparency
			})
			closeButton.Parent = titleBar

			local icon: ImageLabel = Instance.new("ImageLabel")

			icon.Name = "Icon"
			icon.AnchorPoint = Vector2.new(0.5, 0.5)

			local v118 = UDim2.fromOffset
			local floored3 = math.floor(n1 * 0.7)
			local floored4 = math.floor(n1 * 0.7)

			icon.Size = v118(floored3, floored4)
			icon.Position = UDim2.fromScale(0.5, 0.5)
			icon.BackgroundTransparency = 1
			icon.BorderSizePixel = 0
			icon.Image = p2.ICONS.MULTIPLICATION_SIGN
			icon.ImageColor3 = p1._config.TextColor
			icon.ImageTransparency = p1._config.TextTransparency
			icon.ZIndex = p27.ZIndex + 5
			icon.Parent = closeButton

			local n2 = if p1._config.WindowTitleAlign == Enum.LeftRight.Left then 0 else if p1._config.WindowTitleAlign == Enum.LeftRight.Center then 0.5 else 1
			local title: TextLabel = Instance.new("TextLabel")

			title.Name = "Title"
			title.AnchorPoint = Vector2.new(n2, 0)
			title.Position = UDim2.fromScale(n2, 0)
			title.AutomaticSize = Enum.AutomaticSize.XY
			title.BorderSizePixel = 0
			title.BackgroundTransparency = 1
			title.ZIndex = p27.ZIndex + 3
			p2.applyTextStyle(title)
			p2.UIPadding(title, p1._config.FramePadding)
			title.Parent = titleBar
			n2 = p1._config.TextSize + p1._config.FramePadding.X

			local resizeGrip: TextButton = Instance.new("TextButton")

			resizeGrip.Name = "ResizeGrip"
			resizeGrip.AnchorPoint = Vector2.new(1, 1)
			resizeGrip.Size = UDim2.fromOffset(n2, n2)
			resizeGrip.Position = UDim2.fromScale(1, 1)
			resizeGrip.AutoButtonColor = false
			resizeGrip.BorderSizePixel = 0
			resizeGrip.BackgroundTransparency = 1
			resizeGrip.Text = p2.ICONS.BOTTOM_RIGHT_CORNER
			resizeGrip.TextSize = n2
			resizeGrip.TextColor3 = p1._config.ButtonColor
			resizeGrip.TextTransparency = p1._config.ButtonTransparency
			resizeGrip.LineHeight = 1.1
			resizeGrip.Selectable = false
			resizeGrip.ZIndex = p27.ZIndex + 3
			resizeGrip.Parent = windowButton
			p2.applyTextInteractionHighlights(resizeGrip, resizeGrip, {
				ButtonColor = p1._config.ButtonColor,
				ButtonTransparency = p1._config.ButtonTransparency,
				ButtonHoveredColor = p1._config.ButtonHoveredColor,
				ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
				ButtonActiveColor = p1._config.ButtonActiveColor,
				ButtonActiveTransparency = p1._config.ButtonActiveTransparency
			})
			resizeGrip.MouseButton1Down:Connect(function()
				if not u16 or u15 ~= p27 then
					p1.SetFocusedWindow(p27)
				end

				u9 = true
				top = Enum.TopBottom.Bottom
				left = Enum.LeftRight.Right
				u8 = p27
			end)

			local resizeBorder: TextButton = Instance.new("TextButton")

			resizeBorder.Name = "ResizeBorder"
			resizeBorder.Size = UDim2.new(1, p1._config.WindowResizePadding.X * 2, 1, p1._config.WindowResizePadding.Y * 2)
			resizeBorder.Position = UDim2.fromOffset(-p1._config.WindowResizePadding.X, -p1._config.WindowResizePadding.Y)
			resizeBorder.BackgroundTransparency = 1
			resizeBorder.BorderSizePixel = 0
			resizeBorder.Text = ""
			resizeBorder.AutoButtonColor = false
			resizeBorder.Active = true
			resizeBorder.Selectable = false
			resizeBorder.ZIndex = p27.ZIndex
			resizeBorder.LayoutOrder = p27.ZIndex
			resizeBorder.ClipsDescendants = false
			resizeBorder.Parent = windowButton
			resizeBorder.MouseEnter:Connect(function()
				if u15 == p27 then
					u10 = true
				end
			end)
			resizeBorder.MouseLeave:Connect(function()
				if u15 == p27 then
					u10 = false
				end
			end)
			windowButton.MouseEnter:Connect(function()
				if u15 == p27 then
					u11 = true
				end
			end)
			windowButton.MouseLeave:Connect(function()
				if u15 == p27 then
					u11 = false
				end
			end)

			return screenGui
		end,
		Update = function(p31)
			local windowButton = p31.Instance.WindowButton
			local windowButtonTitleBar = windowButton.TitleBar
			local windowButtonTitleBarTitle = windowButtonTitleBar.Title
			local menuBar = windowButton:FindFirstChild("MenuBar")
			local windowButtonChildContainer = windowButton.ChildContainer
			local windowButtonResizeGrip = windowButton.ResizeGrip
			local n1 = 0
			local n2 = 0

			if p31.arguments.NoResize == true then
				windowButtonResizeGrip.Visible = false
			else
				windowButtonResizeGrip.Visible = true
			end

			if p31.arguments.NoScrollbar then
				windowButtonChildContainer.ScrollBarThickness = 0
			else
				windowButtonChildContainer.ScrollBarThickness = p1._config.ScrollbarSize
			end

			if p31.arguments.NoTitleBar then
				windowButtonTitleBar.Visible = false
			else
				windowButtonTitleBar.Visible = true

				local y = windowButtonTitleBar.AbsoluteSize.Y

				n1 += y
				n2 += y
			end

			if menuBar then
				if p31.arguments.NoMenu then
					menuBar.Visible = false
				else
					menuBar.Visible = true
					n1 += menuBar.AbsoluteSize.Y
				end

				menuBar.Position = UDim2.fromOffset(0, n2)
			end

			if p31.arguments.NoBackground then
				windowButtonChildContainer.BackgroundTransparency = 1
			else
				windowButtonChildContainer.BackgroundTransparency = p1._config.WindowBgTransparency
			end

			n2 = p1._config.FramePadding.X + p1._config.TextSize + p1._config.FramePadding.X * 2

			if p31.arguments.NoCollapse then
				windowButtonTitleBar.CollapseButton.Visible = false
				windowButtonTitleBar.Title.UIPadding.PaddingLeft = UDim.new(0, p1._config.FramePadding.X)
			else
				windowButtonTitleBar.CollapseButton.Visible = true
				windowButtonTitleBar.Title.UIPadding.PaddingLeft = UDim.new(0, n2)
			end

			if p31.arguments.NoClose then
				windowButtonTitleBar.CloseButton.Visible = false
				windowButtonTitleBar.Title.UIPadding.PaddingRight = UDim.new(0, p1._config.FramePadding.X)
			else
				windowButtonTitleBar.CloseButton.Visible = true
				windowButtonTitleBar.Title.UIPadding.PaddingRight = UDim.new(0, n2)
			end

			windowButtonChildContainer.Size = UDim2.new(1, 0, 1, -n1)
			windowButtonChildContainer.CanvasSize = UDim2.new(0, 0, 1, -n1)
			windowButtonChildContainer.Position = UDim2.fromOffset(0, n1)
			windowButtonTitleBarTitle.Text = p31.arguments.Title or ""
		end,
		Discard = function(p32)
			if p32 == u15 then
				u15 = nil
				u16 = false
			end

			if p32 == u5 then
				u5 = nil
				u6 = false
			end

			if p32 == u8 then
				u8 = nil
				u9 = false
			end

			t1[p32.ID] = nil
			p32.Instance:Destroy()
			p2.discardState(p32)
		end,
		ChildAdded = function(p33)
			return p33.Instance.WindowButton.ChildContainer
		end,
		UpdateState = function(p34)
			local value = p34.state.size.value
			local v139 = p34.state.position.value
			local v140 = p34.state.isUncollapsed.value
			local v141 = p34.state.isOpened.value
			local v142 = p34.state.scrollDistance.value
			local instance = p34.Instance
			local windowButton = instance.WindowButton
			local windowButtonTitleBar = windowButton.TitleBar
			local windowButtonChildContainer = windowButton.ChildContainer
			local windowButtonResizeGrip = windowButton.ResizeGrip

			windowButton.Size = UDim2.fromOffset(value.X, value.Y)
			windowButton.Position = UDim2.fromOffset(v139.X, v139.Y)

			if v141 then
				if p34.usesScreenGUI then
					instance.Enabled = true
				end

				windowButton.Visible = true
				p34.lastOpenedTick = p1._cycleTick + 1
			else
				if p34.usesScreenGUI then
					instance.Enabled = false
				end

				windowButton.Visible = false
				p34.lastClosedTick = p1._cycleTick + 1
			end

			if v140 then
				windowButtonTitleBar.CollapseButton.Arrow.Image = p2.ICONS.DOWN_POINTING_TRIANGLE
				windowButtonChildContainer.Visible = true

				if p34.arguments.NoResize ~= true then
					windowButtonResizeGrip.Visible = true
				end

				windowButton.AutomaticSize = Enum.AutomaticSize.None
				p34.lastUncollapsedTick = p1._cycleTick + 1
			else
				local y = windowButtonTitleBar.AbsoluteSize.Y

				windowButtonTitleBar.CollapseButton.Arrow.Image = p2.ICONS.RIGHT_POINTING_TRIANGLE
				windowButtonChildContainer.Visible = false
				windowButtonResizeGrip.Visible = false
				windowButton.Size = UDim2.fromOffset(value.X, y)
				p34.lastCollapsedTick = p1._cycleTick + 1
			end

			if v141 and v140 then
				p1.SetFocusedWindow(p34)
			else
				windowButtonTitleBar.BackgroundColor3 = p1._config.TitleBgCollapsedColor
				windowButtonTitleBar.BackgroundTransparency = p1._config.TitleBgCollapsedTransparency
				windowButton.UIStroke.Color = p1._config.BorderColor
				p1.SetFocusedWindow(nil)
			end

			if v142 and v142 ~= 0 then
				local n1: number = #p1._postCycleCallbacks + 1
				local n2 = p1._cycleTick + 1

				p1._postCycleCallbacks[n1] = function()
					if p1._cycleTick == n2 then
						windowButtonChildContainer.CanvasPosition = Vector2.new(0, v142)
						p1._postCycleCallbacks[n1] = nil
					end
				end
			end
		end,
		GenerateState = function(p35)
			if p35.state.size == nil then
				p35.state.size = p1._widgetState(p35, "size", Vector2.new(400, 300))
			end

			if p35.state.position == nil then
				local state = p35.state
				local _widgetState = p1._widgetState
				local vector2

				if u16 and u15 then
					vector2 = u15.state.position.value + Vector2.new(15, 45)
				else
					vector2 = Vector2.new(150, 250)
				end

				state.position = _widgetState(p35, "position", vector2)
			end

			p35.state.position.value = fitPositionToWindowBounds(p35, p35.state.position.value)
			p35.state.size.value = fitSizeToWindowBounds(p35, p35.state.size.value)

			if p35.state.isUncollapsed == nil then
				p35.state.isUncollapsed = p1._widgetState(p35, "isUncollapsed", true)
			end

			if p35.state.isOpened == nil then
				p35.state.isOpened = p1._widgetState(p35, "isOpened", true)
			end

			if p35.state.scrollDistance == nil then
				p35.state.scrollDistance = p1._widgetState(p35, "scrollDistance", 0)
			end
		end
	})
end
