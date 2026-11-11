



require(script.Parent.Parent.Types)

return function(p1, p2)
	p1.WidgetConstructor("Separator", {
		hasState = false,
		hasChildren = false,
		Args = {},
		Events = {},
		Generate = function(p3)
			local iris_Separator: Frame = Instance.new("Frame")

			iris_Separator.Name = "Iris_Separator"
			iris_Separator.BackgroundColor3 = p1._config.SeparatorColor
			iris_Separator.BackgroundTransparency = p1._config.SeparatorTransparency
			iris_Separator.BorderSizePixel = 0

			if p3.parentWidget.type == "SameLine" then
				iris_Separator.Size = UDim2.new(0, 1, 1, 0)
			else
				iris_Separator.Size = UDim2.new(1, 0, 0, 1)
			end

			iris_Separator.ZIndex = p3.ZIndex
			iris_Separator.LayoutOrder = p3.ZIndex
			p2.UIListLayout(iris_Separator, Enum.FillDirection.Vertical, UDim.new(0, 0))

			return iris_Separator
		end,
		Update = function(_)
		end,
		Discard = function(p5)
			p5.Instance:Destroy()
		end
	})
	p1.WidgetConstructor("Indent", {
		hasState = false,
		hasChildren = true,
		Args = { Width = 1 },
		Events = {},
		Generate = function(p6)
			local iris_Indent: Frame = Instance.new("Frame")

			iris_Indent.Name = "Iris_Indent"
			iris_Indent.BackgroundTransparency = 1
			iris_Indent.BorderSizePixel = 0
			iris_Indent.Size = UDim2.fromScale(1, 0)
			iris_Indent.AutomaticSize = Enum.AutomaticSize.Y
			iris_Indent.ZIndex = p6.ZIndex
			iris_Indent.LayoutOrder = p6.ZIndex
			p2.UIListLayout(iris_Indent, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
			p2.UIPadding(iris_Indent, Vector2.new(0, 0))

			return iris_Indent
		end,
		Update = function(p7)
			p7.Instance.UIPadding.PaddingLeft = UDim.new(0, if p7.arguments.Width then p7.arguments.Width else p1._config.IndentSpacing)
		end,
		Discard = function(p8)
			p8.Instance:Destroy()
		end,
		ChildAdded = function(p9, _)
			return p9.Instance
		end
	})
	p1.WidgetConstructor("SameLine", {
		hasState = false,
		hasChildren = true,
		Args = { Width = 1, VerticalAlignment = 2 },
		Events = {},
		Generate = function(p11)
			local iris_SameLine: Frame = Instance.new("Frame")

			iris_SameLine.Name = "Iris_SameLine"
			iris_SameLine.BackgroundTransparency = 1
			iris_SameLine.BorderSizePixel = 0
			iris_SameLine.Size = UDim2.fromScale(1, 0)
			iris_SameLine.AutomaticSize = Enum.AutomaticSize.Y
			iris_SameLine.ZIndex = p11.ZIndex
			iris_SameLine.LayoutOrder = p11.ZIndex
			p2.UIListLayout(iris_SameLine, Enum.FillDirection.Horizontal, UDim.new(0, 0))

			return iris_SameLine
		end,
		Update = function(p12)
			local uiListLayout = p12.Instance.UIListLayout

			uiListLayout.Padding = UDim.new(0, if p12.arguments.Width then p12.arguments.Width else p1._config.ItemSpacing.X)

			if p12.arguments.VerticalAlignment then
				uiListLayout.VerticalAlignment = p12.arguments.VerticalAlignment

				return
			end

			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		end,
		Discard = function(p13)
			p13.Instance:Destroy()
		end,
		ChildAdded = function(p14, _)
			return p14.Instance
		end
	})
	p1.WidgetConstructor("Group", {
		hasState = false,
		hasChildren = true,
		Args = {},
		Events = {},
		Generate = function(p16)
			local iris_Group: Frame = Instance.new("Frame")

			iris_Group.Name = "Iris_Group"
			iris_Group.BackgroundTransparency = 1
			iris_Group.BorderSizePixel = 0
			iris_Group.Size = UDim2.fromOffset(0, 0)
			iris_Group.AutomaticSize = Enum.AutomaticSize.XY
			iris_Group.ZIndex = p16.ZIndex
			iris_Group.LayoutOrder = p16.ZIndex
			iris_Group.ClipsDescendants = true
			p2.UIListLayout(iris_Group, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.X))

			return iris_Group
		end,
		Update = function(_)
		end,
		Discard = function(p18)
			p18.Instance:Destroy()
		end,
		ChildAdded = function(p19, _)
			return p19.Instance
		end
	})
end
