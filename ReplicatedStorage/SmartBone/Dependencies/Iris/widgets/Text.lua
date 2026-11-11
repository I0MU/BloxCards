



require(script.Parent.Parent.Types)

return function(p1, p2)
	local widgetConstructor = p1.WidgetConstructor

	local v4 = p2.EVENTS.hover(function(p3)
		return p3.Instance
	end)

	widgetConstructor("Text", {
		hasState = false,
		hasChildren = false,
		Args = { Text = 1, Wrapped = 2, Color = 3, RichText = 4 },
		Events = { hovered = v4 },
		Generate = function(p4)
			local iris_Text: TextLabel = Instance.new("TextLabel")

			iris_Text.Name = "Iris_Text"
			iris_Text.Size = UDim2.fromOffset(0, 0)
			iris_Text.BackgroundTransparency = 1
			iris_Text.BorderSizePixel = 0
			iris_Text.ZIndex = p4.ZIndex
			iris_Text.LayoutOrder = p4.ZIndex
			iris_Text.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyTextStyle(iris_Text)
			p2.UIPadding(iris_Text, Vector2.new(0, 2))

			return iris_Text
		end,
		Update = function(p5)
			local instance = p5.Instance

			if p5.arguments.Text == nil then
				error("Iris.Text Text Argument is required", 5)
			end

			if p5.arguments.Wrapped then
				instance.TextWrapped = true
			else
				instance.TextWrapped = false
			end

			if p5.arguments.Color then
				instance.TextColor3 = p5.arguments.Color
			else
				instance.TextColor3 = p1._config.TextColor
			end

			if p5.arguments.RichText then
				instance.RichText = true
			else
				instance.RichText = false
			end

			instance.Text = p5.arguments.Text
		end,
		Discard = function(p6)
			p6.Instance:Destroy()
		end
	})

	local v5 = p1.WidgetConstructor

	v4 = p2.EVENTS.hover(function(p7)
		return p7.Instance
	end)
	v5("SeparatorText", {
		hasState = false,
		hasChildren = false,
		Args = { Text = 1 },
		Events = { hovered = v4 },
		Generate = function(p8)
			local iris_SeparatorText: Frame = Instance.new("Frame")

			iris_SeparatorText.Name = "Iris_SeparatorText"
			iris_SeparatorText.Size = UDim2.fromScale(1, 0)
			iris_SeparatorText.BackgroundTransparency = 1
			iris_SeparatorText.BorderSizePixel = 0
			iris_SeparatorText.AutomaticSize = Enum.AutomaticSize.Y
			iris_SeparatorText.ZIndex = p8.ZIndex
			iris_SeparatorText.LayoutOrder = p8.ZIndex
			iris_SeparatorText.ClipsDescendants = true
			p2.UIPadding(iris_SeparatorText, Vector2.new(0, p1._config.SeparatorTextPadding.Y))
			p2.UIListLayout(iris_SeparatorText, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemSpacing.X))
			iris_SeparatorText.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.ZIndex = p8.ZIndex + 1
			textLabel.LayoutOrder = p8.ZIndex + 1
			p2.applyTextStyle(textLabel)
			textLabel.Parent = iris_SeparatorText

			local left: Frame = Instance.new("Frame")

			left.Name = "Left"
			left.AnchorPoint = Vector2.new(1, 0.5)
			left.BackgroundColor3 = p1._config.SeparatorColor
			left.BackgroundTransparency = p1._config.SeparatorTransparency
			left.BorderSizePixel = 0
			left.Size = UDim2.fromOffset(p1._config.SeparatorTextPadding.X - p1._config.ItemSpacing.X, p1._config.SeparatorTextBorderSize)
			left.ZIndex = p8.ZIndex
			left.LayoutOrder = p8.ZIndex
			left.Parent = iris_SeparatorText

			local right: Frame = Instance.new("Frame")

			right.Name = "Right"
			right.AnchorPoint = Vector2.new(1, 0.5)
			right.BackgroundColor3 = p1._config.SeparatorColor
			right.BackgroundTransparency = p1._config.SeparatorTransparency
			right.BorderSizePixel = 0
			right.Size = UDim2.new(1, 0, 0, p1._config.SeparatorTextBorderSize)
			right.ZIndex = p8.ZIndex + 2
			right.LayoutOrder = p8.ZIndex + 2
			right.Parent = iris_SeparatorText

			return iris_SeparatorText
		end,
		Update = function(p9)
			local textLabel = p9.Instance.TextLabel

			if p9.arguments.Text == nil then
				error("Iris.Text Text Argument is required", 5)
			end

			textLabel.Text = p9.arguments.Text
		end,
		Discard = function(p10)
			p10.Instance:Destroy()
		end
	})
end
