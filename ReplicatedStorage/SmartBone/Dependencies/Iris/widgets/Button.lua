



require(script.Parent.Parent.Types)

return function(p1, p2)
	local v3 = p2.EVENTS.click(function(p3)
		return p3.Instance
	end)

	local v4 = p2.EVENTS.rightClick(function(p4)
		return p4.Instance
	end)

	local v5 = p2.EVENTS.doubleClick(function(p5)
		return p5.Instance
	end)

	local v6 = p2.EVENTS.ctrlClick(function(p6)
		return p6.Instance
	end)

	local v7 = p2.EVENTS.hover(function(p7)
		return p7.Instance
	end)

	local t1: {[any]: any} = {
		hasState = false,
		hasChildren = false,
		Args = { Text = 1 },
		Events = {
			clicked = v3,
			rightClicked = v4,
			doubleClicked = v5,
			ctrlClicked = v6,
			hovered = v7
		},
		Generate = function(p8)
			local textButton: TextButton = Instance.new("TextButton")

			textButton.Size = UDim2.fromOffset(0, 0)
			textButton.BackgroundColor3 = p1._config.ButtonColor
			textButton.BackgroundTransparency = p1._config.ButtonTransparency
			textButton.AutoButtonColor = false
			p2.applyTextStyle(textButton)
			textButton.AutomaticSize = Enum.AutomaticSize.XY
			p2.applyFrameStyle(textButton)
			p2.applyInteractionHighlights(textButton, textButton, {
				ButtonColor = p1._config.ButtonColor,
				ButtonTransparency = p1._config.ButtonTransparency,
				ButtonHoveredColor = p1._config.ButtonHoveredColor,
				ButtonHoveredTransparency = p1._config.ButtonHoveredTransparency,
				ButtonActiveColor = p1._config.ButtonActiveColor,
				ButtonActiveTransparency = p1._config.ButtonActiveTransparency
			})
			textButton.ZIndex = p8.ZIndex
			textButton.LayoutOrder = p8.ZIndex

			return textButton
		end,
		Update = function(p9)
			p9.Instance.Text = p9.arguments.Text or "Button"
		end,
		Discard = function(p10)
			p10.Instance:Destroy()
		end
	}

	p2.abstractButton = t1
	p1.WidgetConstructor("Button", p2.extend(t1, {
		Generate = function(p11)
			local iris_Button = t1.Generate(p11)

			iris_Button.Name = "Iris_Button"

			return iris_Button
		end
	}))
	p1.WidgetConstructor("SmallButton", p2.extend(t1, {
		Generate = function(p12)
			local iris_SmallButton = t1.Generate(p12)

			iris_SmallButton.Name = "Iris_SmallButton"

			local uiPadding = iris_SmallButton.UIPadding

			uiPadding.PaddingLeft = UDim.new(0, 2)
			uiPadding.PaddingRight = UDim.new(0, 2)
			uiPadding.PaddingTop = UDim.new(0, 0)
			uiPadding.PaddingBottom = UDim.new(0, 0)

			return iris_SmallButton
		end
	}))
end
