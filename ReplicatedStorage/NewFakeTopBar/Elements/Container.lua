



return function(p1)
	local guiService: GuiService = game:GetService("GuiService")
	local isOldTopbar = p1.isOldTopbar
	local v4 = guiService:GetGuiInset()
	local v5: boolean = guiService:IsTenFootInterface()
	local n1 = if isOldTopbar then 12 else v4.Y - 46

	if v5 then
		n1 = 10
	end

	local topbarStandard: ScreenGui = Instance.new("ScreenGui")

	topbarStandard:SetAttribute("StartInset", n1)
	topbarStandard.Name = "TopbarStandard"
	topbarStandard.Enabled = true
	topbarStandard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	topbarStandard.IgnoreGuiInset = true
	topbarStandard.ResetOnSpawn = false
	topbarStandard.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets

	local t1: {[any]: any} = {}

	t1[topbarStandard.Name] = topbarStandard
	topbarStandard.DisplayOrder = p1.baseDisplayOrder
	p1.baseDisplayOrderChanged:Connect(function()
		topbarStandard.DisplayOrder = p1.baseDisplayOrder
	end)

	local holders: Frame = Instance.new("Frame")
	local n2: number = if isOldTopbar then 2 else 0
	local n3: number = -2

	if v5 then
		n2 += 13
		n3 = 50
	end

	holders.Name = "Holders"
	holders.BackgroundTransparency = 1
	holders.Position = UDim2.new(0, 0, 0, n2)
	holders.Size = UDim2.new(1, 0, 1, n3)
	holders.Visible = true
	holders.ZIndex = 1
	holders.Parent = topbarStandard

	local clone: Instance = topbarStandard:Clone()
	local cloneHolders = clone.Holders
	local guiService2: GuiService = game:GetService("GuiService")

	clone.Name = "TopbarCentered"
	clone.ScreenInsets = Enum.ScreenInsets.None
	p1.baseDisplayOrderChanged:Connect(function()
		clone.DisplayOrder = p1.baseDisplayOrder
	end)
	t1[clone.Name] = clone
	guiService2:GetPropertyChangedSignal("TopbarInset"):Connect(function()
		cloneHolders.Size = UDim2.new(1, 0, 0, guiService2.TopbarInset.Height + n3)
	end)
	cloneHolders.Size = UDim2.new(1, 0, 0, guiService2.TopbarInset.Height + n3)

	local clone2: Instance = topbarStandard:Clone()

	clone2.Name = clone2.Name .. "Clipped"
	clone2.DisplayOrder = clone2.DisplayOrder + 1
	p1.baseDisplayOrderChanged:Connect(function()
		clone2.DisplayOrder = p1.baseDisplayOrder + 1
	end)
	t1[clone2.Name] = clone2

	local clone3: Instance = clone:Clone()

	clone3.Name = clone3.Name .. "Clipped"
	clone3.DisplayOrder = clone3.DisplayOrder + 1
	p1.baseDisplayOrderChanged:Connect(function()
		clone3.DisplayOrder = p1.baseDisplayOrder + 1
	end)
	t1[clone3.Name] = clone3

	if isOldTopbar then
		task.defer(function()
			guiService2:GetPropertyChangedSignal("MenuIsOpen"):Connect(function()
				if guiService2.MenuIsOpen then
					p1.setTopbarEnabled(false, true)

					return
				end

				p1.setTopbarEnabled()
			end)

			if guiService2.MenuIsOpen then
				p1.setTopbarEnabled(false, true)

				return
			end

			p1.setTopbarEnabled()
		end)
	end

	local left: ScrollingFrame = Instance.new("ScrollingFrame")

	left:SetAttribute("IsAHolder", true)
	left.Name = "Left"
	left.Position = UDim2.fromOffset(n1, 0)
	left.Size = UDim2.new(1, -24, 1, 0)
	left.BackgroundTransparency = 1
	left.Visible = true
	left.ZIndex = 1
	left.Active = false
	left.ClipsDescendants = true
	left.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	left.CanvasSize = UDim2.new(0, 0, 1, -1)
	left.AutomaticCanvasSize = Enum.AutomaticSize.X
	left.ScrollingDirection = Enum.ScrollingDirection.X
	left.ScrollBarThickness = 0
	left.BorderSizePixel = 0
	left.Selectable = false
	left.ScrollingEnabled = false
	left.ElasticBehavior = Enum.ElasticBehavior.Never
	left.Parent = holders

	local uiListLayout: UIListLayout = Instance.new("UIListLayout")

	uiListLayout.Padding = UDim.new(0, n1)
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	uiListLayout.Parent = left

	local clone4: Instance = left:Clone()

	clone4.ScrollingEnabled = false
	clone4.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	clone4.Name = "Center"
	clone4.Parent = cloneHolders

	local clone5: Instance = left:Clone()

	clone5.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	clone5.Name = "Right"
	clone5.AnchorPoint = Vector2.new(1, 0)
	clone5.Position = UDim2.new(1, -12, 0, 0)
	clone5.Parent = holders

	return t1
end
