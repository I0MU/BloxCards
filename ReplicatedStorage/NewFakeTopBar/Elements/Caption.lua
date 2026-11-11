



return function(p1)
	local parent = p1:getInstance("ClickRegion")
	local caption: CanvasGroup = Instance.new("CanvasGroup")

	caption.Name = "Caption"
	caption.AnchorPoint = Vector2.new(0.5, 0)
	caption.BackgroundTransparency = 1
	caption.BorderSizePixel = 0
	caption.GroupTransparency = 1
	caption.Position = UDim2.fromOffset(0, 0)
	caption.Visible = true
	caption.ZIndex = 30
	caption.Parent = parent

	local box: Frame = Instance.new("Frame")

	box.Name = "Box"
	box.AutomaticSize = Enum.AutomaticSize.XY
	box.BackgroundColor3 = Color3.fromRGB(101, 102, 104)
	box.Position = UDim2.fromOffset(4, 7)
	box.ZIndex = 12
	box.Parent = caption

	local header: TextLabel = Instance.new("TextLabel")

	header.Name = "Header"
	header.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	header.Text = "Caption"
	header.TextColor3 = Color3.fromRGB(255, 255, 255)
	header.TextSize = 14
	header.TextTruncate = Enum.TextTruncate.None
	header.TextWrapped = false
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.AutomaticSize = Enum.AutomaticSize.X
	header.BackgroundTransparency = 1
	header.LayoutOrder = 1
	header.Size = UDim2.fromOffset(0, 16)
	header.ZIndex = 18
	header.Parent = box

	local layout: UIListLayout = Instance.new("UIListLayout")

	layout.Name = "Layout"
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = box

	local captionCorner: UICorner = Instance.new("UICorner")

	captionCorner.Name = "CaptionCorner"
	captionCorner.Parent = box

	local padding: UIPadding = Instance.new("UIPadding")

	padding.Name = "Padding"
	padding.PaddingBottom = UDim.new(0, 12)
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)
	padding.PaddingTop = UDim.new(0, 12)
	padding.Parent = box

	local hotkeys: Frame = Instance.new("Frame")

	hotkeys.Name = "Hotkeys"
	hotkeys.AutomaticSize = Enum.AutomaticSize.Y
	hotkeys.BackgroundTransparency = 1
	hotkeys.LayoutOrder = 3
	hotkeys.Size = UDim2.fromScale(1, 0)
	hotkeys.Visible = false
	hotkeys.Parent = box

	local layout1: UIListLayout = Instance.new("UIListLayout")

	layout1.Name = "Layout1"
	layout1.Padding = UDim.new(0, 6)
	layout1.FillDirection = Enum.FillDirection.Vertical
	layout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout1.HorizontalFlex = Enum.UIFlexAlignment.None
	layout1.ItemLineAlignment = Enum.ItemLineAlignment.Automatic
	layout1.VerticalFlex = Enum.UIFlexAlignment.None
	layout1.SortOrder = Enum.SortOrder.LayoutOrder
	layout1.Parent = hotkeys

	local key1: ImageLabel = Instance.new("ImageLabel")

	key1.Name = "Key1"
	key1.Image = "rbxasset://textures/ui/Controls/key_single.png"
	key1.ImageTransparency = 0.7
	key1.ScaleType = Enum.ScaleType.Slice
	key1.SliceCenter = Rect.new(5, 5, 23, 24)
	key1.AutomaticSize = Enum.AutomaticSize.X
	key1.BackgroundTransparency = 1
	key1.LayoutOrder = 1
	key1.Size = UDim2.fromOffset(0, 30)
	key1.ZIndex = 15
	key1.Parent = hotkeys

	local inset: UIPadding = Instance.new("UIPadding")

	inset.Name = "Inset"
	inset.PaddingLeft = UDim.new(0, 8)
	inset.PaddingRight = UDim.new(0, 8)
	inset.Parent = key1

	local labelContent: TextLabel = Instance.new("TextLabel")

	labelContent.AutoLocalize = false
	labelContent.Name = "LabelContent"
	labelContent.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	labelContent.Text = ""
	labelContent.TextColor3 = Color3.fromRGB(189, 190, 190)
	labelContent.TextSize = 14
	labelContent.AutomaticSize = Enum.AutomaticSize.X
	labelContent.BackgroundTransparency = 1
	labelContent.Position = UDim2.fromOffset(0, -1)
	labelContent.Size = UDim2.fromScale(1, 1)
	labelContent.ZIndex = 16
	labelContent.Parent = key1

	local caret: ImageLabel = Instance.new("ImageLabel")

	caret.Name = "Caret"
	caret.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png"
	caret.ImageColor3 = Color3.fromRGB(101, 102, 104)
	caret.ImageRectOffset = Vector2.new(260, 440)
	caret.ImageRectSize = Vector2.new(16, 8)
	caret.AnchorPoint = Vector2.new(0, 0.5)
	caret.BackgroundTransparency = 1
	caret.Position = UDim2.new(0, 0, 0, 4)
	caret.Rotation = 180
	caret.Size = UDim2.fromOffset(16, 8)
	caret.ZIndex = 12
	caret.Parent = caption

	local dropShadow: ImageLabel = Instance.new("ImageLabel")

	dropShadow.Name = "DropShadow"
	dropShadow.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png"
	dropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	dropShadow.ImageRectOffset = Vector2.new(217, 486)
	dropShadow.ImageRectSize = Vector2.new(25, 25)
	dropShadow.ImageTransparency = 0.45
	dropShadow.ScaleType = Enum.ScaleType.Slice
	dropShadow.SliceCenter = Rect.new(12, 12, 13, 13)
	dropShadow.BackgroundTransparency = 1
	dropShadow.Position = UDim2.fromOffset(0, 5)
	dropShadow.Size = UDim2.new(1, 0, 0, 48)
	dropShadow.Parent = caption
	box:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		dropShadow.Size = UDim2.new(1, 0, 0, box.AbsoluteSize.Y + 8)
	end)

	local captionJanitor = p1.captionJanitor
	local v17, v18 = p1:clipOutside(caption)

	v18.AutomaticSize = Enum.AutomaticSize.None

	local v19 = caption:GetPropertyChangedSignal("AbsoluteSize")

	captionJanitor:add(v19:Connect(function()
		local captionAbsoluteSize: Vector2 = caption.AbsoluteSize

		v18.Size = UDim2.fromOffset(captionAbsoluteSize.X, captionAbsoluteSize.Y)
	end))

	local captionAbsoluteSize: Vector2 = caption.AbsoluteSize

	v18.Size = UDim2.fromOffset(captionAbsoluteSize.X, captionAbsoluteSize.Y)

	local u21: boolean = false
	local v22 = caption.Box.Header
	local userInputService: UserInputService = game:GetService("UserInputService")

	v19 = function(p2)
		local userInputServiceKeyboardEnabled: boolean = userInputService.KeyboardEnabled
		local text = caption:GetAttribute("CaptionText") or ""
		local u47: boolean = text == "_hotkey_"

		if not userInputServiceKeyboardEnabled and u47 then
			p1:setCaption()

			return
		end

		v22.Text = text
		v22.Visible = not u47

		if p2 then
			labelContent.Text = p2.Name
			hotkeys.Visible = true
		end

		if not userInputServiceKeyboardEnabled then
			hotkeys.Visible = false
		end
	end
	caption:GetAttributeChangedSignal("CaptionText"):Connect(v19)

	local quad = Enum.EasingStyle.Quad
	local tweenInfo = TweenInfo.new(0.2, quad, Enum.EasingDirection.In)
	local tweenInfo2 = TweenInfo.new(0.2, quad, Enum.EasingDirection.Out)
	local tweenService: TweenService = game:GetService("TweenService")
	local runService: RunService = game:GetService("RunService")

	local function getCaptionPosition(p3)
		return UDim2.new(0.5, 0, 1, if if p3 == nil then u21 else p3 then 10 else 2)
	end
	local function updatePosition(p4)
		if not u21 then
			return
		end

		local v50 = if p4 == nil then u21 else p4
		local u51: boolean = not v50
		local uDim2 = UDim2.new(0.5, 0, 1, if if u51 == nil then u21 else u51 then 10 else 2)
		local uDim22 = UDim2.new(0.5, 0, 1, if if v50 == nil then u21 else v50 then 10 else 2)

		if v50 then
			caret.Position = UDim2.fromOffset(0, caret.Position.Y.Offset)
			caption.AutomaticSize = Enum.AutomaticSize.XY
			caption.Size = UDim2.fromOffset(32, 53)
		else
			local captionAbsoluteSize: Vector2 = caption.AbsoluteSize

			caption.AutomaticSize = Enum.AutomaticSize.Y
			caption.Size = UDim2.fromOffset(captionAbsoluteSize.X, captionAbsoluteSize.Y)
		end

		local u55 = nil

		local function updateCaret()
			local n1 = parent.AbsolutePosition.X - caption.AbsolutePosition.X + parent.AbsoluteSize.X / 2 - caret.AbsoluteSize.X / 2
			local offset = caret.Position.Y.Offset
			local v69 = UDim2.fromOffset(n1, offset)

			if u55 ~= n1 then
				u55 = n1
				caret.Position = UDim2.fromOffset(0, offset)
				task.wait()
			end

			caret.Position = v69
		end

		v18.Position = uDim2
		updateCaret()

		local v57: Tween = tweenService:Create(v18, v50 and tweenInfo or tweenInfo2, { Position = uDim22 })
		local connection = runService.Heartbeat:Connect(updateCaret)

		v57:Play()
		v57.Completed:Once(function()
			connection:Disconnect()
		end)
	end

	local v31 = parent:GetPropertyChangedSignal("AbsoluteSize")

	captionJanitor:add(v31:Connect(function()
		updatePosition()
	end))
	updatePosition(false)
	captionJanitor:add(p1.toggleKeyAdded:Connect(v19))

	for k, _ in pairs(p1.bindedToggleKeys) do
		local userInputServiceKeyboardEnabled: boolean = userInputService.KeyboardEnabled
		local text = caption:GetAttribute("CaptionText") or ""
		local u36: boolean = text == "_hotkey_"

		if not userInputServiceKeyboardEnabled and u36 then
			p1:setCaption()

			break
		end

		v22.Text = text
		v22.Visible = not u36

		if k then
			labelContent.Text = k.Name
			hotkeys.Visible = true
		end

		if userInputServiceKeyboardEnabled then
			break
		end

		hotkeys.Visible = false

		break
	end

	captionJanitor:add(p1.fakeToggleKeyChanged:Connect(v19))

	local fakeToggleKey = p1.fakeToggleKey

	if fakeToggleKey then
		local keyboardEnabled: boolean = userInputService.KeyboardEnabled
		local v39 = caption:GetAttribute("CaptionText") or ""
		local u40: boolean = v39 == "_hotkey_"

		if not keyboardEnabled and u40 then
			p1:setCaption()
		else
			v22.Text = v39
			v22.Visible = not u40

			if fakeToggleKey then
				labelContent.Text = fakeToggleKey.Name
				hotkeys.Visible = true
			end

			if not keyboardEnabled then
				hotkeys.Visible = false
			end
		end
	end

	local function setCaptionEnabled(p5: boolean)
		if p5 == u21 then
			return
		end

		local joinedFrame = p1.joinedFrame

		if joinedFrame and string.match(joinedFrame.Name, "Dropdown") then
			p5 = false
		end

		u21 = p5
		tweenService:Create(caption, p5 and tweenInfo or tweenInfo2, {
			GroupTransparency = if p5 then 0 else 1
		}):Play()
		updatePosition()

		local userInputServiceKeyboardEnabled: boolean = userInputService.KeyboardEnabled
		local text = caption:GetAttribute("CaptionText") or ""
		local u63: boolean = text == "_hotkey_"

		if not userInputServiceKeyboardEnabled and u63 then
			p1:setCaption()

			return
		end

		v22.Text = text
		v22.Visible = not u63

		if not userInputServiceKeyboardEnabled then
			hotkeys.Visible = false
		end
	end

	local iconModule = require(p1.iconModule)

	captionJanitor:add(p1.stateChanged:Connect(function(p6)
		if p6 == "Viewing" then
			local iconModuleCaptionLastClosedClock = iconModule.captionLastClosedClock
			local n1 = iconModuleCaptionLastClosedClock and os.clock() - iconModuleCaptionLastClosedClock or 999

			task.delay(if n1 < 0.3 then 0 else 0.5, function()
				if p1.activeState == "Viewing" then
					setCaptionEnabled(true)
				end
			end)

			return
		end

		iconModule.captionLastClosedClock = os.clock()
		setCaptionEnabled(false)
	end))

	return caption
end
