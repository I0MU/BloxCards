



require(script.Parent.Parent.Types)

return function(p1, p2)
	local widgetConstructor = p1.WidgetConstructor

	local v4 = p2.EVENTS.hover(function(p7)
		return p7.Instance
	end)

	widgetConstructor("Checkbox", {
		hasState = true,
		hasChildren = false,
		Args = { Text = 1 },
		Events = {
			checked = {
				Init = function(_)
				end,
				Get = function(p4)
					return p4.lastCheckedTick == p1._cycleTick
				end
			},
			unchecked = {
				Init = function(_)
				end,
				Get = function(p6)
					return p6.lastUncheckedTick == p1._cycleTick
				end
			},
			hovered = v4
		},
		Generate = function(p8)
			local iris_Checkbox: TextButton = Instance.new("TextButton")

			iris_Checkbox.Name = "Iris_Checkbox"
			iris_Checkbox.BackgroundTransparency = 1
			iris_Checkbox.BorderSizePixel = 0
			iris_Checkbox.Size = UDim2.fromOffset(0, 0)
			iris_Checkbox.Text = ""
			iris_Checkbox.AutomaticSize = Enum.AutomaticSize.XY
			iris_Checkbox.ZIndex = p8.ZIndex
			iris_Checkbox.AutoButtonColor = false
			iris_Checkbox.LayoutOrder = p8.ZIndex

			local n1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
			local checkboxBox: Frame = Instance.new("Frame")

			checkboxBox.Name = "CheckboxBox"
			checkboxBox.Size = UDim2.fromOffset(n1, n1)
			checkboxBox.BackgroundColor3 = p1._config.FrameBgColor
			checkboxBox.BackgroundTransparency = p1._config.FrameBgTransparency
			checkboxBox.ZIndex = p8.ZIndex + 1
			checkboxBox.LayoutOrder = p8.ZIndex + 1
			p2.applyFrameStyle(checkboxBox, true)
			p2.applyInteractionHighlights(iris_Checkbox, checkboxBox, {
				ButtonColor = p1._config.FrameBgColor,
				ButtonTransparency = p1._config.FrameBgTransparency,
				ButtonHoveredColor = p1._config.FrameBgHoveredColor,
				ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
				ButtonActiveColor = p1._config.FrameBgActiveColor,
				ButtonActiveTransparency = p1._config.FrameBgActiveTransparency
			})
			checkboxBox.Parent = iris_Checkbox

			local roundedUp = math.ceil(n1 * 0.1)
			local n2 = n1 - roundedUp * 2
			local checkmark: ImageLabel = Instance.new("ImageLabel")

			checkmark.Name = "Checkmark"
			checkmark.Size = UDim2.fromOffset(n2, n2)
			checkmark.Position = UDim2.fromOffset(roundedUp, roundedUp)
			checkmark.BackgroundTransparency = 1
			checkmark.ImageColor3 = p1._config.CheckMarkColor
			checkmark.ImageTransparency = p1._config.CheckMarkTransparency
			checkmark.ScaleType = Enum.ScaleType.Fit
			checkmark.ZIndex = p8.ZIndex + 2
			checkmark.LayoutOrder = p8.ZIndex + 2
			checkmark.Parent = iris_Checkbox
			iris_Checkbox.MouseButton1Click:Connect(function()
				p8.state.isChecked:set(not p8.state.isChecked.value)
			end)

			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			p2.applyTextStyle(textLabel)
			textLabel.AnchorPoint = Vector2.new(0, 0.5)
			textLabel.Position = UDim2.new(0, n1 + p1._config.ItemInnerSpacing.X, 0.5, 0)
			textLabel.ZIndex = p8.ZIndex + 1
			textLabel.LayoutOrder = p8.ZIndex + 1
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.Parent = iris_Checkbox

			return iris_Checkbox
		end,
		Update = function(p9)
			p9.Instance.TextLabel.Text = p9.arguments.Text or "Checkbox"
		end,
		Discard = function(p10)
			p10.Instance:Destroy()
			p2.discardState(p10)
		end,
		GenerateState = function(p11)
			if p11.state.isChecked == nil then
				p11.state.isChecked = p1._widgetState(p11, "checked", false)
			end
		end,
		UpdateState = function(p12)
			local checkmark = p12.Instance.Checkmark

			if p12.state.isChecked.value then
				checkmark.Image = p2.ICONS.CHECK_MARK
				p12.lastCheckedTick = p1._cycleTick + 1

				return
			end

			checkmark.Image = ""
			p12.lastUncheckedTick = p1._cycleTick + 1
		end
	})
end
