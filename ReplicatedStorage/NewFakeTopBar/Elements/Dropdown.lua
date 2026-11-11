



return function(p1)
	local dropdown: Frame = Instance.new("Frame")

	dropdown.Name = "Dropdown"
	dropdown.AutomaticSize = Enum.AutomaticSize.XY
	dropdown.BackgroundTransparency = 1
	dropdown.BorderSizePixel = 0
	dropdown.AnchorPoint = Vector2.new(0.5, 0)
	dropdown.Position = UDim2.new(0.5, 0, 1, 10)
	dropdown.ZIndex = -2
	dropdown.ClipsDescendants = true
	dropdown.Parent = p1.widget

	local dropdownCorner: UICorner = Instance.new("UICorner")

	dropdownCorner.Name = "DropdownCorner"
	dropdownCorner.CornerRadius = UDim.new(0, 10)
	dropdownCorner.Parent = dropdown

	local dropdownScroller: ScrollingFrame = Instance.new("ScrollingFrame")

	dropdownScroller.Name = "DropdownScroller"
	dropdownScroller.AutomaticSize = Enum.AutomaticSize.X
	dropdownScroller.BackgroundTransparency = 1
	dropdownScroller.BorderSizePixel = 0
	dropdownScroller.AnchorPoint = Vector2.new(0, 0)
	dropdownScroller.Position = UDim2.new(0, 0, 0, 0)
	dropdownScroller.ZIndex = -1
	dropdownScroller.ClipsDescendants = true
	dropdownScroller.Visible = true
	dropdownScroller.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	dropdownScroller.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	dropdownScroller.Active = false
	dropdownScroller.ScrollingEnabled = true
	dropdownScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
	dropdownScroller.ScrollBarThickness = 5
	dropdownScroller.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	dropdownScroller.ScrollBarImageTransparency = 0.8
	dropdownScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
	dropdownScroller.Selectable = false
	dropdownScroller.Active = true
	dropdownScroller.Parent = dropdown

	local dropdownPadding: UIPadding = Instance.new("UIPadding")

	dropdownPadding.Name = "DropdownPadding"
	dropdownPadding.PaddingTop = UDim.new(0, 8)
	dropdownPadding.PaddingBottom = UDim.new(0, 8)
	dropdownPadding.Parent = dropdownScroller

	local dropdownList: UIListLayout = Instance.new("UIListLayout")

	dropdownList.Name = "DropdownList"
	dropdownList.FillDirection = Enum.FillDirection.Vertical
	dropdownList.SortOrder = Enum.SortOrder.LayoutOrder
	dropdownList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	dropdownList.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	dropdownList.Parent = dropdownScroller

	local dropdownJanitor = p1.dropdownJanitor
	local iconModule = require(p1.iconModule)

	p1.dropdownChildAdded:Connect(function(p2)
		local v15, v16 = p2:modifyTheme({
			{ "Widget", "BorderSize", 0 },
			{ "IconCorners", "CornerRadius", UDim.new(0, 4) },
			{ "Widget", "MinimumWidth", 190 },
			{ "Widget", "MinimumHeight", 56 },
			{ "IconLabel", "TextSize", 19 },
			{ "PaddingLeft", "Size", UDim2.fromOffset(25, 0) },
			{ "Notice", "Position", UDim2.new(1, -24, 0, 5) },
			{ "ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Left },
			{ "Selection", "Size", UDim2.new(1, -8, 1, -8) },
			{ "Selection", "Position", UDim2.new(0, 4, 0, 4) }
		})

		task.defer(function()
			p2.joinJanitor:add(function()
				p2:removeModification(v16)
			end)
		end)
	end)
	p1.dropdownSet:Connect(function(p3)
		for _, v in pairs(p1.dropdownIcons) do
			iconModule.getIconByUID(v):destroy()
		end

		local n1: number = #p3

		if type(p3) == "table" then
			for _, v in pairs(p3) do
				v:joinDropdown(p1)
			end
		end
	end)

	local utility = require(script.Parent.Parent.Utility)

	dropdownJanitor:add(p1.toggled:Connect(function()
		utility.setVisible(dropdown, p1.isSelected, "InternalDropdown")
	end))
	utility.setVisible(dropdown, p1.isSelected, "InternalDropdown")

	local n1: number = 0
	local u11: boolean = false

	local function updateMaxIcons()
		n1 += 1

		if u11 then
			return
		end

		local v23: number = n1

		u11 = true
		task.defer(function()
			u11 = false

			if n1 ~= v23 then
				updateMaxIcons()
			end
		end)

		local maxIcons: any = dropdown:GetAttribute("MaxIcons")

		if not maxIcons then
			return
		end

		local t1: {[any]: any} = {}

		for _, v in pairs(dropdownScroller:GetChildren()) do
			if v:IsA("GuiObject") then
				table.insert(t1, { v, v.AbsolutePosition.Y })
			end
		end

		table.sort(t1, function(p4, p5)
			return p4[2] < p5[2]
		end)

		local n2 = 0
		local u29: boolean = false

		for i = 1, maxIcons do
			local v31 = t1[i]

			if not v31 then
				break
			end

			local v32 = v31[1]

			n2 += v32.AbsoluteSize.Y

			local widgetUID = v32:GetAttribute("WidgetUID")

			v32 = widgetUID and iconModule.getIconByUID(widgetUID)

			if v32 then
				local v34 = nil

				if not u29 then
					u29 = true
					v34 = p1:getInstance("ClickRegion")
				end

				local v35 = v32:getInstance("ClickRegion")

				v35.NextSelectionUp = v34
			end
		end

		dropdownScroller.Size = UDim2.fromOffset(0, n2 + dropdownPadding.PaddingTop.Offset + dropdownPadding.PaddingBottom.Offset)
	end

	local v13: RBXScriptSignal = dropdownScroller:GetPropertyChangedSignal("AbsoluteCanvasSize")

	dropdownJanitor:add(v13:Connect(updateMaxIcons))
	dropdownJanitor:add(dropdownScroller.ChildAdded:Connect(updateMaxIcons))
	dropdownJanitor:add(dropdownScroller.ChildRemoved:Connect(updateMaxIcons))
	v13 = dropdown:GetAttributeChangedSignal("MaxIcons")
	dropdownJanitor:add(v13:Connect(updateMaxIcons))
	dropdownJanitor:add(p1.childThemeModified:Connect(updateMaxIcons))
	updateMaxIcons()

	return dropdown
end
