



require(script.Parent.Parent.Types)

return function(p1, p2)
	local t1: {[any]: any} = {
		hasState = true,
		hasChildren = true,
		Events = {
			collasped = {
				Init = function(_)
				end,
				Get = function(p4)
					return p4.lastCollapsedTick == p1._cycleTick
				end
			},
			uncollapsed = {
				Init = function(_)
				end,
				Get = function(p6)
					return p6.lastUncollapsedTick == p1._cycleTick
				end
			},
			hovered = p2.EVENTS.hover(function(p7)
				return p7.Instance
			end)
		},
		Discard = function(p8)
			p8.Instance:Destroy()
			p2.discardState(p8)
		end,
		ChildAdded = function(p9)
			local childContainer = p9.Instance.ChildContainer

			childContainer.Visible = p9.state.isUncollapsed.value

			return childContainer
		end,
		UpdateState = function(p10)
			local value = p10.state.isUncollapsed.value
			local instance = p10.Instance
			local childContainer = instance.ChildContainer

			instance.Header.Button.Arrow.Image = value and p2.ICONS.DOWN_POINTING_TRIANGLE or p2.ICONS.RIGHT_POINTING_TRIANGLE

			if value then
				p10.lastUncollapsedTick = p1._cycleTick + 1
			else
				p10.lastCollapsedTick = p1._cycleTick + 1
			end

			childContainer.Visible = value
		end,
		GenerateState = function(p11)
			if p11.state.isUncollapsed == nil then
				p11.state.isUncollapsed = p1._widgetState(p11, "isUncollapsed", false)
			end
		end
	}

	p1.WidgetConstructor("Tree", p2.extend(t1, {
		Args = { Text = 1, SpanAvailWidth = 2, NoIndent = 3 },
		Generate = function(p12)
			local iris_Tree: Frame = Instance.new("Frame")

			iris_Tree.Name = "Iris_Tree"
			iris_Tree.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
			iris_Tree.AutomaticSize = Enum.AutomaticSize.Y
			iris_Tree.BackgroundTransparency = 1
			iris_Tree.BorderSizePixel = 0
			iris_Tree.ZIndex = p12.ZIndex
			iris_Tree.LayoutOrder = p12.ZIndex
			p2.UIListLayout(iris_Tree, Enum.FillDirection.Vertical, UDim.new(0, 0))

			local childContainer: Frame = Instance.new("Frame")

			childContainer.Name = "ChildContainer"
			childContainer.Size = UDim2.fromScale(1, 0)
			childContainer.AutomaticSize = Enum.AutomaticSize.Y
			childContainer.BackgroundTransparency = 1
			childContainer.BorderSizePixel = 0
			childContainer.ZIndex = p12.ZIndex + 1
			childContainer.LayoutOrder = p12.ZIndex + 1
			childContainer.Visible = false
			p2.UIListLayout(childContainer, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))

			local v20 = p2.UIPadding(childContainer, Vector2.new(0, 0))

			v20.PaddingTop = UDim.new(0, p1._config.ItemSpacing.Y)
			childContainer.Parent = iris_Tree

			local header: Frame = Instance.new("Frame")

			header.Name = "Header"
			header.Size = UDim2.fromScale(1, 0)
			header.AutomaticSize = Enum.AutomaticSize.Y
			header.BackgroundTransparency = 1
			header.BorderSizePixel = 0
			header.ZIndex = p12.ZIndex
			header.LayoutOrder = p12.ZIndex
			header.Parent = iris_Tree

			local button: TextButton = Instance.new("TextButton")

			button.Name = "Button"
			button.BackgroundTransparency = 1
			button.BorderSizePixel = 0
			button.Text = ""
			button.ZIndex = p12.ZIndex
			button.LayoutOrder = p12.ZIndex
			button.AutoButtonColor = false

			local applyInteractionHighlights = p2.applyInteractionHighlights
			local color3 = Color3.fromRGB(0, 0, 0)

			applyInteractionHighlights(button, header, {
				ButtonTransparency = 1,
				ButtonColor = color3,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderActiveColor,
				ButtonActiveTransparency = p1._config.HeaderActiveTransparency
			})

			local v25 = p2.UIPadding(button, Vector2.zero)

			v25.PaddingLeft = UDim.new(0, p1._config.FramePadding.X)
			v25 = p2.UIListLayout(button, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.FramePadding.X))
			v25.VerticalAlignment = Enum.VerticalAlignment.Center
			button.Parent = header

			local arrow: ImageLabel = Instance.new("ImageLabel")

			arrow.Name = "Arrow"

			local uDim2FromOffset = UDim2.fromOffset
			local textSize = p1._config.TextSize
			local floored = math.floor(p1._config.TextSize * 0.7)

			arrow.Size = uDim2FromOffset(textSize, floored)
			arrow.BackgroundTransparency = 1
			arrow.BorderSizePixel = 0
			arrow.ImageColor3 = p1._config.TextColor
			arrow.ImageTransparency = p1._config.TextTransparency
			arrow.ScaleType = Enum.ScaleType.Fit
			arrow.ZIndex = p12.ZIndex
			arrow.LayoutOrder = p12.ZIndex
			arrow.Parent = button

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.Size = UDim2.fromOffset(0, 0)
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p12.ZIndex
			textLabel.LayoutOrder = p12.ZIndex

			local v31 = p2.UIPadding(textLabel, Vector2.new(0, 0))

			v31.PaddingRight = UDim.new(0, 21)
			p2.applyTextStyle(textLabel)
			textLabel.Parent = button
			button.MouseButton1Click:Connect(function()
				p12.state.isUncollapsed:set(not p12.state.isUncollapsed.value)
			end)

			return iris_Tree
		end,
		Update = function(p13)
			local instance = p13.Instance
			local button = instance.Header.Button
			local uiPadding = instance.ChildContainer.UIPadding

			button.TextLabel.Text = p13.arguments.Text or "Tree"

			if p13.arguments.SpanAvailWidth then
				button.AutomaticSize = Enum.AutomaticSize.Y
				button.Size = UDim2.fromScale(1, 0)
			else
				button.AutomaticSize = Enum.AutomaticSize.XY
				button.Size = UDim2.fromScale(0, 0)
			end

			if p13.arguments.NoIndent then
				uiPadding.PaddingLeft = UDim.new(0, 0)

				return
			end

			uiPadding.PaddingLeft = UDim.new(0, p1._config.IndentSpacing)
		end
	}))
	p1.WidgetConstructor("CollapsingHeader", p2.extend(t1, {
		Args = { Text = 1 },
		Generate = function(p14)
			local iris_CollapsingHeader: Frame = Instance.new("Frame")

			iris_CollapsingHeader.Name = "Iris_CollapsingHeader"
			iris_CollapsingHeader.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
			iris_CollapsingHeader.AutomaticSize = Enum.AutomaticSize.Y
			iris_CollapsingHeader.BackgroundTransparency = 1
			iris_CollapsingHeader.BorderSizePixel = 0
			iris_CollapsingHeader.ZIndex = p14.ZIndex
			iris_CollapsingHeader.LayoutOrder = p14.ZIndex
			p2.UIListLayout(iris_CollapsingHeader, Enum.FillDirection.Vertical, UDim.new(0, 0))

			local childContainer: Frame = Instance.new("Frame")

			childContainer.Name = "ChildContainer"
			childContainer.Size = UDim2.fromScale(1, 0)
			childContainer.AutomaticSize = Enum.AutomaticSize.Y
			childContainer.BackgroundTransparency = 1
			childContainer.BorderSizePixel = 0
			childContainer.ZIndex = p14.ZIndex + 1
			childContainer.LayoutOrder = p14.ZIndex + 1
			childContainer.Visible = false
			p2.UIListLayout(childContainer, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))

			local v39 = p2.UIPadding(childContainer, Vector2.new(0, 0))

			v39.PaddingTop = UDim.new(0, p1._config.ItemSpacing.Y)
			childContainer.Parent = iris_CollapsingHeader

			local header: Frame = Instance.new("Frame")

			header.Name = "Header"
			header.Size = UDim2.fromScale(1, 0)
			header.AutomaticSize = Enum.AutomaticSize.Y
			header.BackgroundTransparency = 1
			header.BorderSizePixel = 0
			header.ZIndex = p14.ZIndex
			header.LayoutOrder = p14.ZIndex
			header.Parent = iris_CollapsingHeader

			local button: TextButton = Instance.new("TextButton")

			button.Name = "Button"
			button.Size = UDim2.new(1, 2 * p1._config.FramePadding.X, 0, 0)
			button.Position = UDim2.fromOffset(-4, 0)
			button.AutomaticSize = Enum.AutomaticSize.Y
			button.BackgroundColor3 = p1._config.HeaderColor
			button.BackgroundTransparency = p1._config.HeaderTransparency
			button.BorderSizePixel = 0
			button.Text = ""
			button.ZIndex = p14.ZIndex
			button.LayoutOrder = p14.ZIndex
			button.AutoButtonColor = false
			button.ClipsDescendants = true
			p2.UIPadding(button, Vector2.new(2 * p1._config.FramePadding.X, p1._config.FramePadding.Y))
			p2.applyFrameStyle(button, true, true)

			local v42 = p2.UIListLayout(button, Enum.FillDirection.Horizontal, UDim.new(0, 2 * p1._config.FramePadding.X))

			v42.VerticalAlignment = Enum.VerticalAlignment.Center
			p2.applyInteractionHighlights(button, button, {
				ButtonColor = p1._config.HeaderColor,
				ButtonTransparency = p1._config.HeaderTransparency,
				ButtonHoveredColor = p1._config.HeaderHoveredColor,
				ButtonHoveredTransparency = p1._config.HeaderHoveredTransparency,
				ButtonActiveColor = p1._config.HeaderActiveColor,
				ButtonActiveTransparency = p1._config.HeaderActiveTransparency
			})
			button.Parent = header

			local arrow: ImageLabel = Instance.new("ImageLabel")

			arrow.Name = "Arrow"

			local uDim2FromOffset = UDim2.fromOffset
			local textSize = p1._config.TextSize
			local roundedUp = math.ceil(p1._config.TextSize * 0.8)

			arrow.Size = uDim2FromOffset(textSize, roundedUp)
			arrow.AutomaticSize = Enum.AutomaticSize.Y
			arrow.BackgroundTransparency = 1
			arrow.BorderSizePixel = 0
			arrow.ImageColor3 = p1._config.TextColor
			arrow.ImageTransparency = p1._config.TextTransparency
			arrow.ScaleType = Enum.ScaleType.Fit
			arrow.ZIndex = p14.ZIndex
			arrow.LayoutOrder = p14.ZIndex
			arrow.Parent = button

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.Size = UDim2.fromOffset(0, 0)
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p14.ZIndex
			textLabel.LayoutOrder = p14.ZIndex

			local v48 = p2.UIPadding(textLabel, Vector2.new(0, 0))

			v48.PaddingRight = UDim.new(0, 21)
			p2.applyTextStyle(textLabel)
			textLabel.Parent = button
			button.MouseButton1Click:Connect(function()
				p14.state.isUncollapsed:set(not p14.state.isUncollapsed.value)
			end)

			return iris_CollapsingHeader
		end,
		Update = function(p15)
			p15.Instance.Header.Button.TextLabel.Text = p15.arguments.Text or "Collapsing Header"
		end
	}))
end
