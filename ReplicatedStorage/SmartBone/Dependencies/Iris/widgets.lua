



require(script.Parent.Types)

local t1: {[any]: any} = {}

return function(p1)
	t1.GuiService = game:GetService("GuiService")
	t1.RunService = game:GetService("RunService")
	t1.UserInputService = game:GetService("UserInputService")
	t1.ContextActionService = game:GetService("ContextActionService")
	t1.TextService = game:GetService("TextService")
	t1.ICONS = {
		RIGHT_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_right.png",
		DOWN_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_down.png",
		MULTIPLICATION_SIGN = "rbxasset://textures/AnimationEditor/icon_close.png",
		BOTTOM_RIGHT_CORNER = "◢",
		CHECK_MARK = "rbxasset://textures/AnimationEditor/icon_checkmark.png",
		ALPHA_BACKGROUND_TEXTURE = "rbxasset://textures/meshPartFallback.png"
	}
	t1.GuiInset = t1.GuiService:GetGuiInset()
	t1.IS_STUDIO = t1.RunService:IsStudio()

	function t1.getTime()
		if t1.IS_STUDIO then
			return os.clock()
		end

		return time()
	end
	function t1.getMouseLocation()
		return t1.UserInputService:GetMouseLocation() - t1.GuiInset
	end
	function t1.findBestWindowPosForPopup(p2, p3, p4, p5)
		local n1

		if not (p2.X + p3.X + 20 > p5.X) then
			n1 = p2 + Vector2.new(20, 0)
		elseif p2.Y + p3.Y + 20 > p5.Y then
			local vector2 = Vector2.new(0, -(20 + p3.Y))

			n1 = p2 + vector2
		else
			n1 = p2 + Vector2.new(0, 20)
		end

		local vector2New = Vector2.new
		local v11 = math.min(n1.X + p3.X, p5.X)
		local v12 = math.max(v11 - p3.X, p4.X)
		local v13 = math.min(n1.Y + p3.Y, p5.Y)
		local v14 = math.max(v13 - p3.Y, p4.Y)

		return (vector2New(v12, v14))
	end
	function t1.isPosInsideRect(p6, p7, p8)
		return p6.X > p7.X and p6.X < p8.X and p6.Y > p7.Y and p6.Y < p8.Y
	end
	function t1.extend(p9, p10)
		local v20 = table.clone(p9)

		for iterFirst, iterSecond in p10 do
			v20[iterFirst] = iterSecond
		end

		return v20
	end
	function t1.UIPadding(parent, p12)
		local uiPadding: UIPadding = Instance.new("UIPadding")

		uiPadding.PaddingLeft = UDim.new(0, p12.X)
		uiPadding.PaddingRight = UDim.new(0, p12.X)
		uiPadding.PaddingTop = UDim.new(0, p12.Y)
		uiPadding.PaddingBottom = UDim.new(0, p12.Y)
		uiPadding.Parent = parent

		return uiPadding
	end
	function t1.UIListLayout(parent, fillDirection, padding)
		local uiListLayout: UIListLayout = Instance.new("UIListLayout")

		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Padding = padding
		uiListLayout.FillDirection = fillDirection
		uiListLayout.Parent = parent

		return uiListLayout
	end
	function t1.UIStroke(parent, thickness, p18, transparency)
		local uiStroke: UIStroke = Instance.new("UIStroke")

		uiStroke.Thickness = thickness
		uiStroke.Color = p18
		uiStroke.Transparency = transparency
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Parent = parent

		return uiStroke
	end
	function t1.UICorner(parent, p21)
		local uiCorner: UICorner = Instance.new("UICorner")

		uiCorner.CornerRadius = UDim.new(if p21 then 0 else 1, p21 or 0)
		uiCorner.Parent = parent

		return uiCorner
	end
	function t1.UISizeConstraint(parent, p23, p24)
		local uiSizeConstraint: UISizeConstraint = Instance.new("UISizeConstraint")

		uiSizeConstraint.MinSize = p23 or uiSizeConstraint.MinSize
		uiSizeConstraint.MaxSize = p24 or uiSizeConstraint.MaxSize
		uiSizeConstraint.Parent = parent

		return uiSizeConstraint
	end
	function t1.UIReference(parent, value, name)
		local objectValue: ObjectValue = Instance.new("ObjectValue")

		objectValue.Name = name
		objectValue.Value = value
		objectValue.Parent = parent

		return objectValue
	end
	function t1.getScreenSizeForWindow(p28)
		if p28.usesScreenGUI then
			return p28.Instance.AbsoluteSize
		end

		local InstanceParent = p28.Instance.Parent

		if InstanceParent:IsA("GuiBase2d") then
			return InstanceParent.AbsoluteSize
		end

		if InstanceParent.Parent:IsA("GuiBase2d") then
			return InstanceParent.AbsoluteSize
		end

		return workspace.CurrentCamera.ViewportSize
	end

	local getTextBoundsParams: GetTextBoundsParams = Instance.new("GetTextBoundsParams")

	getTextBoundsParams.Font = p1._config.TextFont
	getTextBoundsParams.Size = p1._config.TextSize
	getTextBoundsParams.Width = math.huge

	function t1.calculateTextSize(text, width)
		if width then
			getTextBoundsParams.Width = width
		end

		getTextBoundsParams.Text = text

		local v50 = t1.TextService:GetTextBoundsAsync(getTextBoundsParams)

		if width then
			getTextBoundsParams.Width = math.huge
		end

		return v50
	end
	function t1.applyTextStyle(p31)
		p31.FontFace = p1._config.TextFont
		p31.TextSize = p1._config.TextSize
		p31.TextColor3 = p1._config.TextColor
		p31.TextTransparency = p1._config.TextTransparency
		p31.TextXAlignment = Enum.TextXAlignment.Left
		p31.AutoLocalize = false
		p31.RichText = false
	end
	function t1.applyInteractionHighlights(p32, p33, p34)
		local u55: boolean = false

		p32.MouseEnter:Connect(function()
			p33.BackgroundColor3 = p34.ButtonHoveredColor
			p33.BackgroundTransparency = p34.ButtonHoveredTransparency
			u55 = false
		end)
		p32.MouseLeave:Connect(function()
			p33.BackgroundColor3 = p34.ButtonColor
			p33.BackgroundTransparency = p34.ButtonTransparency
			u55 = true
		end)
		p32.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1 then
				p33.BackgroundColor3 = p34.ButtonActiveColor
				p33.BackgroundTransparency = p34.ButtonActiveTransparency

				return
			end
		end)
		p32.InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1) and not u55 then
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					p33.BackgroundColor3 = p34.ButtonHoveredColor
					p33.BackgroundTransparency = p34.ButtonHoveredTransparency
				end

				if input.UserInputType == Enum.UserInputType.Gamepad1 then
					p33.BackgroundColor3 = p34.ButtonColor
					p33.BackgroundTransparency = p34.ButtonTransparency
				end

				return
			end
		end)
		p32.SelectionImageObject = p1.SelectionImageObject
	end
	function t1.applyInteractionHighlightsWithMultiHighlightee(p37, p38)
		local u58: boolean = false

		p37.MouseEnter:Connect(function()
			for iterFirst, iterSecond in p38 do
				iterSecond[1].BackgroundColor3 = iterSecond[2].ButtonHoveredColor
				iterSecond[1].BackgroundTransparency = iterSecond[2].ButtonHoveredTransparency
				u58 = false
			end
		end)
		p37.MouseLeave:Connect(function()
			for iterFirst, iterSecond in p38 do
				iterSecond[1].BackgroundColor3 = iterSecond[2].ButtonColor
				iterSecond[1].BackgroundTransparency = iterSecond[2].ButtonTransparency
				u58 = true
			end
		end)
		p37.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1 then
				for iterFirst, iterSecond in p38 do
					iterSecond[1].BackgroundColor3 = iterSecond[2].ButtonActiveColor
					iterSecond[1].BackgroundTransparency = iterSecond[2].ButtonActiveTransparency
				end

				return
			end
		end)
		p37.InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1) and not u58 then
				for iterFirst, iterSecond in p38 do
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						iterSecond[1].BackgroundColor3 = iterSecond[2].ButtonHoveredColor
						iterSecond[1].BackgroundTransparency = iterSecond[2].ButtonHoveredTransparency
					end

					if input.UserInputType == Enum.UserInputType.Gamepad1 then
						iterSecond[1].BackgroundColor3 = iterSecond[2].ButtonColor
						iterSecond[1].BackgroundTransparency = iterSecond[2].ButtonTransparency
					end
				end

				return
			end
		end)
		p37.SelectionImageObject = p1.SelectionImageObject
	end
	function t1.applyTextInteractionHighlights(p41, p42, p43)
		local u62: boolean = false

		p41.MouseEnter:Connect(function()
			p42.TextColor3 = p43.ButtonHoveredColor
			p42.TextTransparency = p43.ButtonHoveredTransparency
			u62 = false
		end)
		p41.MouseLeave:Connect(function()
			p42.TextColor3 = p43.ButtonColor
			p42.TextTransparency = p43.ButtonTransparency
			u62 = true
		end)
		p41.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1 then
				p42.TextColor3 = p43.ButtonActiveColor
				p42.TextTransparency = p43.ButtonActiveTransparency

				return
			end
		end)
		p41.InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Gamepad1) and not u62 then
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					p42.TextColor3 = p43.ButtonHoveredColor
					p42.TextTransparency = p43.ButtonHoveredTransparency
				end

				if input.UserInputType == Enum.UserInputType.Gamepad1 then
					p42.TextColor3 = p43.ButtonColor
					p42.TextTransparency = p43.ButtonTransparency
				end

				return
			end
		end)
		p41.SelectionImageObject = p1.SelectionImageObject
	end
	function t1.applyFrameStyle(parent, p47, p48)
		local framePadding = p1._config.FramePadding
		local frameBorderSize = p1._config.FrameBorderSize
		local borderColor = p1._config.BorderColor
		local buttonTransparency = p1._config.ButtonTransparency
		local frameRounding = p1._config.FrameRounding

		if frameBorderSize > 0 and frameRounding > 0 then
			parent.BorderSizePixel = 0

			local uiStroke: UIStroke = Instance.new("UIStroke")

			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke.Transparency = buttonTransparency
			uiStroke.Thickness = frameBorderSize
			uiStroke.Color = borderColor
			t1.UICorner(parent, frameRounding)
			uiStroke.Parent = parent

			if not p47 then
				t1.UIPadding(parent, p1._config.FramePadding)

				return
			end
		elseif frameBorderSize < 1 and frameRounding > 0 then
			parent.BorderSizePixel = 0
			t1.UICorner(parent, frameRounding)

			if not p47 then
				t1.UIPadding(parent, p1._config.FramePadding)

				return
			end
		elseif frameRounding < 1 then
			parent.BorderSizePixel = frameBorderSize
			parent.BorderColor3 = borderColor
			parent.BorderMode = Enum.BorderMode.Inset

			if not p47 then
				local uiPadding = t1.UIPadding
				local vector2 = Vector2.new(frameBorderSize, frameBorderSize)

				uiPadding(parent, framePadding - vector2)

				return
			end

			if not p48 then
				local uIPadding = t1.UIPadding
				local vector2 = Vector2.new(frameBorderSize, frameBorderSize)

				uIPadding(parent, -vector2)
			end
		end
	end
	function t1.discardState(p49)
		for iterFirst, iterSecond in p49.state, nil, nil do
			iterSecond.ConnectedWidgets[p49.ID] = nil
		end
	end

	t1.EVENTS = {
		hover = function(p50)
			return {
				Init = function(p51)
					local v100 = p50(p51)

					v100.MouseEnter:Connect(function()
						p51.isHoveredEvent = true
					end)
					v100.MouseLeave:Connect(function()
						p51.isHoveredEvent = false
					end)
					p51.isHoveredEvent = false
				end,
				Get = function(p52)
					return p52.isHoveredEvent
				end
			}
		end,
		click = function(p53)
			return {
				Init = function(p54)
					local v103 = p53(p54)

					p54.lastClickedTick = -1
					v103.MouseButton1Click:Connect(function()
						p54.lastClickedTick = p1._cycleTick + 1
					end)
				end,
				Get = function(p55)
					return p55.lastClickedTick == p1._cycleTick
				end
			}
		end,
		rightClick = function(p56)
			return {
				Init = function(p57)
					local v106 = p56(p57)

					p57.lastRightClickedTick = -1
					v106.MouseButton2Click:Connect(function()
						p57.lastRightClickedTick = p1._cycleTick + 1
					end)
				end,
				Get = function(p58)
					return p58.lastRightClickedTick == p1._cycleTick
				end
			}
		end,
		doubleClick = function(p59)
			return {
				Init = function(p60)
					local v109 = p59(p60)

					p60.lastClickedTime = -1
					p60.lastClickedPosition = Vector2.zero
					p60.lastDoubleClickedTick = -1
					v109.MouseButton1Down:Connect(function(p61, p62)
						local v120 = t1.getTime()

						if v120 - p60.lastClickedTime < p1._config.MouseDoubleClickTime and (Vector2.new(p61, p62) - p60.lastClickedPosition).Magnitude < p1._config.MouseDoubleClickMaxDist then
							p60.lastDoubleClickedTick = p1._cycleTick + 1

							return
						end

						p60.lastClickedTime = v120
						p60.lastClickedPosition = Vector2.new(p61, p62)
					end)
				end,
				Get = function(p63)
					return p63.lastDoubleClickedTick == p1._cycleTick
				end
			}
		end,
		ctrlClick = function(p64)
			return {
				Init = function(p65)
					local v112 = p64(p65)

					p65.lastCtrlClickedTick = -1
					v112.MouseButton1Click:Connect(function()
						if t1.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or t1.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
							p65.lastCtrlClickedTick = p1._cycleTick + 1
						end
					end)
				end,
				Get = function(p66)
					return p66.lastCtrlClickedTick == p1._cycleTick
				end
			}
		end,
		shortcut = function(p67)
			return {
				Init = function(p68)
					local v115, v116 = p67(p68)

					p68.lastShortcutTick = -1
					t1.ContextActionService:BindAction(p68.ID, function(_, p70, p71)
						if p70 == Enum.UserInputState.Begin and p71:IsModifierKeyDown(v116) then
							p68.lastShortcutTick = p1._cycleTick + 1
						end
					end, false, v115)
				end,
				Get = function(p72)
					return p72.lastShortcutTick == p1._cycleTick
				end
			}
		end
	}
	require(script.Root)(p1, t1)
	require(script.Window)(p1, t1)
	require(script.Menu)(p1, t1)
	require(script.Format)(p1, t1)
	require(script.Text)(p1, t1)
	require(script.Button)(p1, t1)
	require(script.Checkbox)(p1, t1)
	require(script.RadioButton)(p1, t1)
	require(script.Tree)(p1, t1)
	require(script.Input)(p1, t1)
	require(script.Combo)(p1, t1)
	require(script.Table)(p1, t1)
end
