



require(script.Parent.Parent.Types)

return function(p1, p2)
	local widgetConstructor = p1.WidgetConstructor

	local v4 = p2.EVENTS.hover(function(p9)
		return p9.Instance
	end)

	widgetConstructor("RadioButton", {
		hasState = true,
		hasChildren = false,
		Args = { Text = 1, Index = 2 },
		Events = {
			selected = {
				Init = function(_)
				end,
				Get = function(p4)
					return p4.lastSelectedTick == p1._cycleTick
				end
			},
			unselected = {
				Init = function(_)
				end,
				Get = function(p6)
					return p6.lastUnselectedTick == p1._cycleTick
				end
			},
			active = {
				Init = function(_)
				end,
				Get = function(p8)
					return p8.state.index.value == p8.arguments.Index
				end
			},
			hovered = v4
		},
		Generate = function(p10)
			local iris_RadioButton: TextButton = Instance.new("TextButton")

			iris_RadioButton.Name = "Iris_RadioButton"
			iris_RadioButton.BackgroundTransparency = 1
			iris_RadioButton.BorderSizePixel = 0
			iris_RadioButton.Size = UDim2.fromOffset(0, 0)
			iris_RadioButton.Text = ""
			iris_RadioButton.AutomaticSize = Enum.AutomaticSize.XY
			iris_RadioButton.ZIndex = p10.ZIndex
			iris_RadioButton.AutoButtonColor = false
			iris_RadioButton.LayoutOrder = p10.ZIndex

			local n1 = p1._config.TextSize + 2 * (p1._config.FramePadding.Y - 1)
			local button: Frame = Instance.new("Frame")

			button.Name = "Button"
			button.Size = UDim2.fromOffset(n1, n1)
			button.ZIndex = p10.ZIndex + 1
			button.LayoutOrder = p10.ZIndex + 1
			button.Parent = iris_RadioButton
			button.BackgroundColor3 = p1._config.FrameBgColor
			button.BackgroundTransparency = p1._config.FrameBgTransparency
			p2.UICorner(button)

			local circle: Frame = Instance.new("Frame")

			circle.Name = "Circle"
			circle.Position = UDim2.fromOffset(p1._config.FramePadding.Y, p1._config.FramePadding.Y)
			circle.Size = UDim2.fromOffset(p1._config.TextSize - 2, p1._config.TextSize - 2)
			circle.ZIndex = p10.ZIndex + 1
			circle.LayoutOrder = p10.ZIndex + 1
			circle.Parent = button
			circle.BackgroundColor3 = p1._config.CheckMarkColor
			circle.BackgroundTransparency = p1._config.CheckMarkTransparency
			p2.UICorner(circle)
			p2.applyInteractionHighlights(iris_RadioButton, button, {
				ButtonColor = p1._config.FrameBgColor,
				ButtonTransparency = p1._config.FrameBgTransparency,
				ButtonHoveredColor = p1._config.FrameBgHoveredColor,
				ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
				ButtonActiveColor = p1._config.FrameBgActiveColor,
				ButtonActiveTransparency = p1._config.FrameBgActiveTransparency
			})
			iris_RadioButton.MouseButton1Click:Connect(function()
				p10.state.index:set(p10.arguments.Index)
			end)

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			p2.applyTextStyle(textLabel)
			textLabel.Position = UDim2.new(0, n1 + p1._config.ItemInnerSpacing.X, 0.5, 0)
			textLabel.ZIndex = p10.ZIndex + 1
			textLabel.LayoutOrder = p10.ZIndex + 1
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.AnchorPoint = Vector2.new(0, 0.5)
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.Parent = iris_RadioButton

			return iris_RadioButton
		end,
		Update = function(p11)
			p11.Instance.TextLabel.Text = p11.arguments.Text or "Radio Button"

			if p11.state then
				p1._widgets[p11.type].UpdateState(p11)
			end
		end,
		Discard = function(p12)
			p12.Instance:Destroy()
			p2.discardState(p12)
		end,
		GenerateState = function(p13)
			if p13.state.index == nil then
				p13.state.index = p1._widgetState(p13, "index", p13.arguments.Value)
			end
		end,
		UpdateState = function(p14)
			local circle = p14.Instance.Button.Circle

			if p14.state.index.value == p14.arguments.Index then
				circle.BackgroundTransparency = p1._config.CheckMarkTransparency
				p14.lastSelectedTick = p1._cycleTick + 1

				return
			end

			circle.BackgroundTransparency = 1
			p14.lastUnselectedTick = p1._cycleTick + 1
		end
	})
end
