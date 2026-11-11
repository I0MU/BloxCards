



require(script.Parent.Parent.Types)

return function(p1, p2)
	local function getValueByIndex(p5, p6, p7)
		if typeof(p5) == "number" then
			return p5
		end

		if typeof(p5) == "Vector2" then
			if p6 == 1 then
				return p5.X
			end

			if p6 == 2 then
				return p5.Y
			end
		elseif typeof(p5) == "Vector3" then
			if p6 == 1 then
				return p5.X
			end

			if p6 == 2 then
				return p5.Y
			end

			if p6 == 3 then
				return p5.Z
			end
		elseif typeof(p5) == "UDim" then
			if p6 == 1 then
				return p5.Scale
			end

			if p6 == 2 then
				return p5.Offset
			end
		elseif typeof(p5) == "UDim2" then
			if p6 == 1 then
				return p5.X.Scale
			end

			if p6 == 2 then
				return p5.X.Offset
			end

			if p6 == 3 then
				return p5.Y.Scale
			end

			if p6 == 4 then
				return p5.Y.Offset
			end
		elseif typeof(p5) == "Color3" then
			local t7: {[any]: any} = if p7.UseHSV then { p5:ToHSV() } else { p5.R, p5.G, p5.B }

			if p6 == 1 then
				return t7[1]
			end

			if p6 == 2 then
				return t7[2]
			end

			if p6 == 3 then
				return t7[3]
			end
		elseif typeof(p5) == "Rect" then
			if p6 == 1 then
				return p5.Min.X
			end

			if p6 == 2 then
				return p5.Min.Y
			end

			if p6 == 3 then
				return p5.Max.X
			end

			if p6 == 4 then
				return p5.Max.Y
			end
		elseif typeof(p5) == "table" then
			return p5[p6]
		end

		local typeName: string = typeof(p5)
		local v39 = ("Incorrect datatype or value: %* %* %*"):format(p5, typeName, p6)

		error(v39)
	end
	local function updateValueByIndex(p8, p9, p10, p11)
		if typeof(p8) == "number" then
			return p10
		end

		if typeof(p8) == "Vector2" then
			if p9 == 1 then
				return Vector2.new(p10, p8.Y)
			end

			if p9 == 2 then
				return Vector2.new(p8.X, p10)
			end
		elseif typeof(p8) == "Vector3" then
			if p9 == 1 then
				local vector3 = Vector3.new(p10, p8.Y, p8.Z)

				return vector3
			end

			if p9 == 2 then
				local vector3 = Vector3.new(p8.X, p10, p8.Z)

				return vector3
			end

			if p9 == 3 then
				local vector3 = Vector3.new(p8.X, p8.Y, p10)

				return vector3
			end
		elseif typeof(p8) == "UDim" then
			if p9 == 1 then
				return UDim.new(p10, p8.Offset)
			end

			if p9 == 2 then
				return UDim.new(p8.Scale, p10)
			end
		elseif typeof(p8) == "UDim2" then
			if p9 == 1 then
				local uDim2New = UDim2.new
				local uDim = UDim.new(p10, p8.X.Offset)

				return uDim2New(uDim, p8.Y)
			end

			if p9 == 2 then
				local v49 = UDim2.new
				local uDim = UDim.new(p8.X.Scale, p10)

				return v49(uDim, p8.Y)
			end

			if p9 == 3 then
				return UDim2.new(p8.X, UDim.new(p10, p8.Y.Offset))
			end

			if p9 == 4 then
				return UDim2.new(p8.X, UDim.new(p8.Y.Scale, p10))
			end
		elseif typeof(p8) == "Rect" then
			if p9 == 1 then
				local rectNew = Rect.new
				local vector2 = Vector2.new(p10, p8.Min.Y)

				return rectNew(vector2, p8.Max)
			end

			if p9 == 2 then
				local v53 = Rect.new
				local vector2 = Vector2.new(p8.Min.X, p10)

				return v53(vector2, p8.Max)
			end

			if p9 == 3 then
				return Rect.new(p8.Min, Vector2.new(p10, p8.Max.Y))
			end

			if p9 == 4 then
				return Rect.new(p8.Min, Vector2.new(p8.Max.X, p10))
			end
		elseif typeof(p8) == "Color3" then
			if p11.UseHSV then
				local v55, v56, v57 = p8:ToHSV()

				if p9 == 1 then
					return Color3.fromHSV(p10, v56, v57)
				end

				if p9 == 2 then
					return Color3.fromHSV(v55, p10, v57)
				end

				if p9 == 3 then
					return Color3.fromHSV(v55, v56, p10)
				end
			end

			if p9 == 1 then
				return Color3.new(p10, p8.G, p8.B)
			end

			if p9 == 2 then
				return Color3.new(p8.R, p10, p8.B)
			end

			if p9 == 3 then
				return Color3.new(p8.R, p8.G, p10)
			end
		end

		local typeName: string = typeof(p8)
		local v59 = ("Incorrect datatype or value %* %* %*"):format(p8, typeName, p9)

		error(v59)
	end
	local function generateButtons(p12, parent, p14, p15)
		local n1 = p14 + (2 * p1._config.ItemInnerSpacing.X + p15 * 2)
		local v65 = p2.abstractButton.Generate(p12)

		v65.Name = "SubButton"
		v65.ZIndex = p12.ZIndex + 5
		v65.LayoutOrder = p12.ZIndex + 5
		v65.TextXAlignment = Enum.TextXAlignment.Center
		v65.Text = "-"
		v65.Size = UDim2.fromOffset(p1._config.TextSize + 2 * p1._config.FramePadding.Y, p1._config.TextSize)
		v65.Parent = parent
		v65.MouseButton1Click:Connect(function()
			local isKeyDown = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
			local v134 = p12.arguments.Increment and getValueByIndex(p12.arguments.Increment, 1, p12.arguments) or 1
			local n1 = p12.state.number.value - v134 * (if isKeyDown then 100 else 1)

			if p12.arguments.Min ~= nil then
				n1 = math.max(n1, getValueByIndex(p12.arguments.Min, 1, p12.arguments))
			end

			if p12.arguments.Max ~= nil then
				n1 = math.min(n1, getValueByIndex(p12.arguments.Max, 1, p12.arguments))
			end

			p12.state.number:set(n1)
			p12.lastNumberChangedTick = p1._cycleTick + 1
		end)
		v65 = p2.abstractButton.Generate(p12)
		v65.Name = "AddButton"
		v65.ZIndex = p12.ZIndex + 6
		v65.LayoutOrder = p12.ZIndex + 6
		v65.TextXAlignment = Enum.TextXAlignment.Center
		v65.Text = "+"
		v65.Size = UDim2.fromOffset(p1._config.TextSize + 2 * p1._config.FramePadding.Y, p1._config.TextSize)
		v65.Parent = parent
		v65.MouseButton1Click:Connect(function()
			local isKeyDown = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
			local v137 = p12.arguments.Increment and getValueByIndex(p12.arguments.Increment, 1, p12.arguments) or 1
			local n1 = p12.state.number.value + v137 * (if isKeyDown then 100 else 1)

			if p12.arguments.Min ~= nil then
				n1 = math.max(n1, getValueByIndex(p12.arguments.Min, 1, p12.arguments))
			end

			if p12.arguments.Max ~= nil then
				n1 = math.min(n1, getValueByIndex(p12.arguments.Max, 1, p12.arguments))
			end

			p12.state.number:set(n1)
			p12.lastNumberChangedTick = p1._cycleTick + 1
		end)

		return n1
	end

	local t1: {[any]: any} = {
		Init = function(_)
		end,
		Get = function(p4)
			return p4.lastNumberChangedTick == p1._cycleTick
		end
	}

	local t2: {[any]: any} = {
		Num = { "" },
		Vector2 = { "X: ", "Y: " },
		Vector3 = { "X: ", "Y: ", "Z: " },
		UDim = { "", "" },
		UDim2 = { "", "", "", "" },
		Color3_RGB = { "R: ", "G: ", "B: " },
		Color3_HSV = { "H: ", "S: ", "V: " },
		Color4_RGB = { "R: ", "G: ", "B: ", "T: " },
		Color4_HSV = { "H: ", "S: ", "V: ", "T: " },
		Rect = { "X: ", "Y: ", "X: ", "Y: " }
	}
	local t3: {[any]: any} = {
		Num = { 0 },
		Vector2 = { 0, 0 },
		Vector3 = { 0, 0, 0 },
		UDim = { 3, 0 },
		UDim2 = { 3, 0, 3, 0 },
		Color3 = { 0, 0, 0 },
		Color4 = { 0, 0, 0, 0 },
		Rect = { 0, 0, 0, 0 }
	}

	local function generateInputScalar(p16, p17, p18)
		local v71 = p2.EVENTS.hover(function(p19)
			return p19.Instance
		end)

		return {
			hasState = true,
			hasChildren = false,
			Args = { Text = 1, Increment = 2, Min = 3, Max = 4, Format = 5 },
			Events = { numberChanged = t1, hovered = v71 },
			Generate = function(p20)
				local frame: Frame = Instance.new("Frame")

				frame.Name = "Iris_Input" .. p16
				frame.Size = UDim2.fromScale(1, 0)
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.ZIndex = p20.ZIndex
				frame.LayoutOrder = p20.ZIndex
				frame.AutomaticSize = Enum.AutomaticSize.Y
				p2.UIListLayout(frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

				local n1 = 0
				local n2 = p1._config.TextSize + 2 * p1._config.FramePadding.Y

				if p17 == 1 then
					n1 = generateButtons(p20, frame, n1, n2)
				end

				local uDim = UDim.new(p1._config.ContentWidth.Scale / p17, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (p17 - 1) - n1) / p17)
				local uDim2 = UDim.new(uDim.Scale * (p17 - 1), uDim.Offset * (p17 - 1) + p1._config.ItemInnerSpacing.X * (p17 - 1) + n1)

				n1 = p1._config.ContentWidth - uDim2

				for i = 1, p17 do
					local textBox: TextBox = Instance.new("TextBox")

					textBox.Name = "InputField" .. tostring(i)
					textBox.ZIndex = p20.ZIndex + i
					textBox.LayoutOrder = p20.ZIndex + i

					if i == p17 then
						textBox.Size = UDim2.new(n1, UDim.new())
					else
						textBox.Size = UDim2.new(uDim, UDim.new())
					end

					textBox.AutomaticSize = Enum.AutomaticSize.Y
					textBox.BackgroundColor3 = p1._config.FrameBgColor
					textBox.BackgroundTransparency = p1._config.FrameBgTransparency
					textBox.ClearTextOnFocus = false
					textBox.TextTruncate = Enum.TextTruncate.AtEnd
					textBox.ClipsDescendants = true
					p2.applyFrameStyle(textBox)
					p2.applyTextStyle(textBox)
					p2.UISizeConstraint(textBox, Vector2.new(1, 0))
					textBox.Parent = frame
					textBox.FocusLost:Connect(function()
						local numberValue = tonumber(textBox.Text:match("-?%d*%.?%d*"))

						if numberValue ~= nil then
							if p20.arguments.Min ~= nil then
								numberValue = math.max(numberValue, getValueByIndex(p20.arguments.Min, i, p20.arguments))
							end

							if p20.arguments.Max ~= nil then
								numberValue = math.min(numberValue, getValueByIndex(p20.arguments.Max, i, p20.arguments))
							end

							if p20.arguments.Increment then
								local v274 = getValueByIndex(p20.arguments.Increment, i, p20.arguments)
								local rounded = math.round(numberValue / v274)
								local v276 = getValueByIndex(p20.arguments.Increment, i, p20.arguments)

								numberValue = rounded * v276
							end

							p20.state.number:set(updateValueByIndex(p20.state.number.value, i, numberValue, p20.arguments))
							p20.lastNumberChangedTick = p1._cycleTick + 1
						end

						local v277 = p20.arguments.Format[i] or p20.arguments.Format[1]

						if p20.arguments.Prefix then
							v277 = p20.arguments.Prefix[i] .. v277
						end

						textBox.Text = string.format(v277, getValueByIndex(p20.state.number.value, i, p20.arguments))
						p20.state.editingText:set(0)
					end)
					textBox.Focused:Connect(function()
						textBox.CursorPosition = #textBox.Text + 1
						textBox.SelectionStart = 1
						p20.state.editingText:set(i)
					end)
				end

				local textLabel: TextLabel = Instance.new("TextLabel")

				textLabel.Name = "TextLabel"
				textLabel.Size = UDim2.fromOffset(0, n2)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.ZIndex = p20.ZIndex + 7
				textLabel.LayoutOrder = p20.ZIndex + 7
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				p2.applyTextStyle(textLabel)
				textLabel.Parent = frame

				return frame
			end,
			Update = function(p21)
				local instance = p21.Instance

				instance.TextLabel.Text = p21.arguments.Text or ("Input %*"):format(p16)

				if p17 == 1 then
					instance.SubButton.Visible = not p21.arguments.NoButtons
					instance.AddButton.Visible = not p21.arguments.NoButtons
				end

				if p21.arguments.Format and typeof(p21.arguments.Format) ~= "table" then
					p21.arguments.Format = { p21.arguments.Format }

					return
				end

				local t10: {[any]: any} = {}

				for i = 1, p17 do
					local v153 = t3[p16][i]

					if p21.arguments.Increment then
						local v154 = getValueByIndex(p21.arguments.Increment, i, p21.arguments)
						local v155 = math.log10(if v154 == 0 then 1 else v154)
						local roundedUp = math.ceil(-v155)

						v153 = math.max(v153, roundedUp, v153)
					end

					if p21.arguments.Max then
						local v157 = getValueByIndex(p21.arguments.Max, i, p21.arguments)
						local v158 = math.log10(if v157 == 0 then 1 else v157)
						local roundedUp = math.ceil(-v158)

						v153 = math.max(v153, roundedUp, v153)
					end

					if p21.arguments.Min then
						local v160 = getValueByIndex(p21.arguments.Min, i, p21.arguments)
						local v161 = math.log10(if v160 == 0 then 1 else v160)
						local roundedUp = math.ceil(-v161)

						v153 = math.max(v153, roundedUp, v153)
					end

					if v153 > 0 then
						t10[i] = ("%%.%*f"):format(v153)
					else
						t10[i] = "%d"
					end
				end

				p21.arguments.Format = t10
				p21.arguments.Prefix = t2[p16]
			end,
			Discard = function(p22)
				p22.Instance:Destroy()
				p2.discardState(p22)
			end,
			GenerateState = function(p23)
				if p23.state.number == nil then
					p23.state.number = p1._widgetState(p23, "number", p18)
				end

				if p23.state.editingText == nil then
					p23.state.editingText = p1._widgetState(p23, "editingText", 0)
				end
			end,
			UpdateState = function(p24)
				local instance = p24.Instance

				for i = 1, p17 do
					local text: string = tostring(i)
					local foundChild = instance:FindFirstChild("InputField" .. text)
					local v170 = p24.arguments.Format[i] or p24.arguments.Format[1]

					if p24.arguments.Prefix then
						v170 = p24.arguments.Prefix[i] .. v170
					end

					foundChild.Text = string.format(v170, getValueByIndex(p24.state.number.value, i, p24.arguments))
				end
			end
		}
	end

	local n1 = 0
	local u11: boolean = false
	local u12 = nil
	local n2 = 0
	local s1 = ""
	local t4: {[any]: any} = {
		Num = { 1 },
		Vector2 = { 1, 1 },
		Vector3 = { 1, 1, 1 },
		UDim = { 0.01, 1 },
		UDim2 = { 0.01, 1, 0.01, 1 },
		Color3 = { 1, 1, 1 },
		Color4 = { 1, 1, 1, 1 },
		Rect = { 1, 1, 1, 1 }
	}

	local function updateActiveDrag()
		local x = p2.getMouseLocation().X
		local n5 = x - n1

		n1 = x

		if u11 == false then
			return
		end

		if u12 == nil then
			return
		end

		local v74 = u12.state.number

		if s1 == "Color3" or s1 == "Color4" then
			v74 = u12.state.color

			if n2 == 4 then
				v74 = u12.state.transparency
			end
		end

		local v75 = u12.arguments.Increment and getValueByIndex(u12.arguments.Increment, n2, u12.arguments) or t4[s1][n2]
		local n6: number = if not p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not p2.UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 1 else 10
		local n3: number = if not p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) and not p2.UserInputService:IsKeyDown(Enum.KeyCode.RightAlt) then 1 else 0.1
		local n4 = getValueByIndex(v74.value, n2, u12.arguments) + n5 * (v75 * n6 * n3 * (if s1 == "Color3" or s1 == "Color4" then 5 else 1))

		if u12.arguments.Min ~= nil then
			n4 = math.max(n4, getValueByIndex(u12.arguments.Min, n2, u12.arguments))
		end

		if u12.arguments.Max ~= nil then
			n4 = math.min(n4, getValueByIndex(u12.arguments.Max, n2, u12.arguments))
		end

		v74:set(updateValueByIndex(v74.value, n2, n4, u12.arguments))
		u12.lastNumberChangedTick = p1._cycleTick + 1
	end
	local function DragMouseDown(p25, p26, p27, p28, p29)
		local v84 = p2.getTime()
		local u85: boolean = v84 - p25.lastClickedTime < p1._config.MouseDoubleClickTime
		local isKeyDown = p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)

		if u85 and (Vector2.new(p28, p29) - p25.lastClickedPosition).Magnitude < p1._config.MouseDoubleClickMaxDist or isKeyDown then
			p25.state.editingText:set(p27)

			return
		end

		p25.lastClickedTime = v84
		p25.lastClickedPosition = Vector2.new(p28, p29)
		u11 = true
		u12 = p25
		n2 = p27
		s1 = p26
		updateActiveDrag()
	end

	p2.UserInputService.InputChanged:Connect(updateActiveDrag)
	p2.UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and u11 then
			u11 = false
			u12 = nil
			n2 = 0
		end
	end)

	local function generateDragScalar(p31, p32, p33)
		local v91 = p2.EVENTS.hover(function(p34)
			return p34.Instance
		end)

		return {
			hasState = true,
			hasChildren = false,
			Args = { Text = 1, Increment = 2, Min = 3, Max = 4, Format = 5 },
			Events = { numberChanged = t1, hovered = v91 },
			Generate = function(p35)
				p35.lastClickedTime = -1
				p35.lastClickedPosition = Vector2.zero

				local frame: Frame = Instance.new("Frame")

				frame.Name = "Iris_Drag" .. p31
				frame.Size = UDim2.fromScale(1, 0)
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.ZIndex = p35.ZIndex
				frame.LayoutOrder = p35.ZIndex
				frame.AutomaticSize = Enum.AutomaticSize.Y
				p2.UIListLayout(frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

				local n1 = 0
				local n2 = p1._config.TextSize + 2 * p1._config.FramePadding.Y

				if p31 == "Color3" or p31 == "Color4" then
					n1 += p1._config.ItemInnerSpacing.X + n2

					local colorBox: ImageLabel = Instance.new("ImageLabel")

					colorBox.Name = "ColorBox"
					colorBox.BorderSizePixel = 0
					colorBox.Size = UDim2.fromOffset(n2, n2)
					colorBox.ZIndex = p35.ZIndex + 5
					colorBox.LayoutOrder = p35.ZIndex + 5
					colorBox.Image = p2.ICONS.ALPHA_BACKGROUND_TEXTURE
					colorBox.ImageTransparency = 1
					p2.applyFrameStyle(colorBox, true, true)
					colorBox.Parent = frame
				end

				local uDim = UDim.new(p1._config.ContentWidth.Scale / p32, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (p32 - 1) - n1) / p32)
				local uDim3 = UDim.new(uDim.Scale * (p32 - 1), uDim.Offset * (p32 - 1) + p1._config.ItemInnerSpacing.X * (p32 - 1) + n1)

				n1 = p1._config.ContentWidth - uDim3

				for i = 1, p32 do
					local textButton: TextButton = Instance.new("TextButton")

					textButton.Name = "DragField" .. tostring(i)
					textButton.ZIndex = p35.ZIndex + i
					textButton.LayoutOrder = p35.ZIndex + i

					if i == p32 then
						textButton.Size = UDim2.new(n1, UDim.new())
					else
						textButton.Size = UDim2.new(uDim, UDim.new())
					end

					textButton.AutomaticSize = Enum.AutomaticSize.Y
					textButton.BackgroundColor3 = p1._config.FrameBgColor
					textButton.BackgroundTransparency = p1._config.FrameBgTransparency
					textButton.AutoButtonColor = false
					textButton.Text = ""
					textButton.ClipsDescendants = true
					p2.applyFrameStyle(textButton)
					p2.applyTextStyle(textButton)
					p2.UISizeConstraint(textButton, Vector2.new(1, 0))
					textButton.TextXAlignment = Enum.TextXAlignment.Center
					textButton.Parent = frame
					p2.applyInteractionHighlights(textButton, textButton, {
						ButtonColor = p1._config.FrameBgColor,
						ButtonTransparency = p1._config.FrameBgTransparency,
						ButtonHoveredColor = p1._config.FrameBgHoveredColor,
						ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
						ButtonActiveColor = p1._config.FrameBgActiveColor,
						ButtonActiveTransparency = p1._config.FrameBgActiveTransparency
					})

					local inputField: TextBox = Instance.new("TextBox")

					inputField.Name = "InputField"
					inputField.ZIndex = p35.ZIndex + 5
					inputField.LayoutOrder = p35.ZIndex + 2
					inputField.Size = UDim2.new(1, 0, 1, 0)
					inputField.BackgroundTransparency = 1
					inputField.ClearTextOnFocus = false
					inputField.TextTruncate = Enum.TextTruncate.AtEnd
					inputField.ClipsDescendants = true
					inputField.Visible = false
					p2.applyFrameStyle(inputField, true)
					p2.applyTextStyle(inputField)
					inputField.Parent = textButton
					inputField.FocusLost:Connect(function()
						local numberValue = tonumber(inputField.Text:match("-?%d*%.?%d*"))
						local v279 = p35.state.number

						if p31 == "Color4" and i == 4 then
							v279 = p35.state.transparency
						elseif p31 == "Color3" or p31 == "Color4" then
							v279 = p35.state.color
						end

						if numberValue ~= nil then
							if p31 == "Color3" or p31 == "Color4" and not p35.arguments.UseFloats then
								numberValue /= 255
							end

							if p35.arguments.Min ~= nil then
								numberValue = math.max(numberValue, getValueByIndex(p35.arguments.Min, i, p35.arguments))
							end

							if p35.arguments.Max ~= nil then
								numberValue = math.min(numberValue, getValueByIndex(p35.arguments.Max, i, p35.arguments))
							end

							if p35.arguments.Increment then
								local v280 = getValueByIndex(p35.arguments.Increment, i, p35.arguments)
								local rounded = math.round(numberValue / v280)
								local v282 = getValueByIndex(p35.arguments.Increment, i, p35.arguments)

								numberValue = rounded * v282
							end

							v279:set(updateValueByIndex(v279.value, i, numberValue, p35.arguments))
							p35.lastNumberChangedTick = p1._cycleTick + 1
						end

						local v283 = getValueByIndex(v279.value, i, p35.arguments)

						if p31 == "Color3" or p31 == "Color4" and not p35.arguments.UseFloats then
							v283 = math.round(v283 * 255)
						end

						local v284 = p35.arguments.Format[i] or p35.arguments.Format[1]

						if p35.arguments.Prefix then
							v284 = p35.arguments.Prefix[i] .. v284
						end

						inputField.Text = string.format(v284, v283)
						p35.state.editingText:set(0)
						inputField:ReleaseFocus(true)
					end)
					inputField.Focused:Connect(function()
						inputField.CursorPosition = #inputField.Text + 1
						inputField.SelectionStart = 1
						p35.state.editingText:set(i)
					end)
					textButton.MouseButton1Down:Connect(function(x: number, y: number)
						DragMouseDown(p35, p31, i, x, y)
					end)
				end

				local textLabel: TextLabel = Instance.new("TextLabel")

				textLabel.Name = "TextLabel"
				textLabel.Size = UDim2.fromOffset(0, n2)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.ZIndex = p35.ZIndex + 5
				textLabel.LayoutOrder = p35.ZIndex + 5
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				p2.applyTextStyle(textLabel)
				textLabel.Parent = frame

				return frame
			end,
			Update = function(p38)
				p38.Instance.TextLabel.Text = p38.arguments.Text or ("Drag %*"):format(p31)

				if p38.arguments.Format and typeof(p38.arguments.Format) ~= "table" then
					p38.arguments.Format = { p38.arguments.Format }
				elseif not p38.arguments.Format then
					local t11: {[any]: any} = {}

					for i = 1, p32 do
						local v186 = t3[p31][i]

						if p38.arguments.Increment then
							local v187 = getValueByIndex(p38.arguments.Increment, i, p38.arguments)
							local v188 = math.log10(if v187 == 0 then 1 else v187)
							local roundedUp = math.ceil(-v188)

							v186 = math.max(v186, roundedUp, v186)
						end

						if p38.arguments.Max then
							local v190 = getValueByIndex(p38.arguments.Max, i, p38.arguments)
							local v191 = math.log10(if v190 == 0 then 1 else v190)
							local roundedUp = math.ceil(-v191)

							v186 = math.max(v186, roundedUp, v186)
						end

						if p38.arguments.Min then
							local v193 = getValueByIndex(p38.arguments.Min, i, p38.arguments)
							local v194 = math.log10(if v193 == 0 then 1 else v193)
							local roundedUp = math.ceil(-v194)

							v186 = math.max(v186, roundedUp, v186)
						end

						if v186 > 0 then
							t11[i] = ("%%.%*f"):format(v186)
						else
							t11[i] = "%d"
						end
					end

					p38.arguments.Format = t11
					p38.arguments.Prefix = t2[p31]
				end
			end,
			Discard = function(p39)
				p39.Instance:Destroy()
				p2.discardState(p39)
			end,
			GenerateState = function(p40)
				if p40.state.number == nil then
					p40.state.number = p1._widgetState(p40, "number", p33)
				end

				if p40.state.editingText == nil then
					p40.state.editingText = p1._widgetState(p40, "editingText", false)
				end
			end,
			UpdateState = function(p41)
				local instance = p41.Instance

				for i = 1, p32 do
					local v201 = p41.state.number

					if p31 == "Color3" or p31 == "Color4" then
						v201 = p41.state.color

						if i == 4 then
							v201 = p41.state.transparency
						end
					end

					local text: string = tostring(i)
					local foundChild = instance:FindFirstChild("DragField" .. text)
					local foundChildInputField = foundChild.InputField
					local v205 = getValueByIndex(v201.value, i, p41.arguments)

					if (p31 == "Color3" or p31 == "Color4") and not p41.arguments.UseFloats then
						v205 = math.round(v205 * 255)
					end

					local v206 = p41.arguments.Format[i] or p41.arguments.Format[1]

					if p41.arguments.Prefix then
						v206 = p41.arguments.Prefix[i] .. v206
					end

					foundChild.Text = string.format(v206, v205)
					foundChildInputField.Text = tostring(v205)

					if i == p41.state.editingText.value then
						foundChildInputField.Visible = true
						foundChildInputField:CaptureFocus()
						foundChild.TextTransparency = 1
					else
						foundChildInputField.Visible = false
						foundChild.TextTransparency = p1._config.TextTransparency
					end
				end

				if p31 == "Color3" or p31 == "Color4" then
					local colorBox = instance.ColorBox

					colorBox.BackgroundColor3 = p41.state.color.value

					if p31 == "Color4" then
						colorBox.ImageTransparency = 1 - p41.state.transparency.value
					end
				end
			end
		}
	end
	local function generateColorDragScalar(p42, ...)
		local t8: {[any]: any} = { ... }
		local v94 = generateDragScalar(p42, if p42 == "Color4" then 4 else 3, t8[1])

		return p2.extend(v94, {
			Args = { Text = 1, UseFloats = 2, UseHSV = 3, Format = 4 },
			Update = function(p43)
				p43.Instance.TextLabel.Text = p43.arguments.Text or ("Drag %*"):format(p42)

				if p43.arguments.Format and typeof(p43.arguments.Format) ~= "table" then
					p43.arguments.Format = { p43.arguments.Format }
				else
					if p43.arguments.UseFloats then
						p43.arguments.Format = { "%.3f" }
					else
						p43.arguments.Format = { "%d" }
					end

					p43.arguments.Prefix = t2[p42 .. (if p43.arguments.UseHSV then "_HSV" else "_RGB")]
				end

				p43.arguments.Min = { 0, 0, 0, 0 }
				p43.arguments.Max = { 1, 1, 1, 1 }
				p43.arguments.Increment = { 0.001, 0.001, 0.001, 0.001 }

				if p43.state then
					p1._widgets[p43.type].UpdateState(p43)
				end
			end,
			GenerateState = function(p44)
				if p44.state.color == nil then
					p44.state.color = p1._widgetState(p44, "color", t8[1])
				end

				if p42 == "Color4" and p44.state.transparency == nil then
					p44.state.transparency = p1._widgetState(p44, "transparency", t8[2])
				end

				if p44.state.editingText == nil then
					p44.state.editingText = p1._widgetState(p44, "editingText", false)
				end
			end
		})
	end

	local u20: boolean = false
	local u21 = nil
	local n3 = 0
	local s2 = ""
	local t5: {[any]: any} = {
		Num = { 0 },
		Vector2 = { 0, 0 },
		Vector3 = { 0, 0, 0 },
		UDim = { 0, 0 },
		UDim2 = { 0, 0, 0, 0 },
		Rect = { 0, 0, 0, 0 }
	}
	local t6: {[any]: any} = {
		Num = { 100 },
		Vector2 = { 100, 100 },
		Vector3 = { 100, 100, 100 },
		UDim = { 1, 960 },
		UDim2 = { 1, 960, 1, 960 },
		Rect = { 960, 960, 960, 960 }
	}

	local function updateActiveSlider()
		if u20 == false then
			return
		end

		if u21 == nil then
			return
		end

		local v95 = u21.Instance
		local text: string = tostring(n3)
		local foundChild = v95:FindFirstChild("SliderField" .. text)

		v95 = u21.arguments.Increment and getValueByIndex(u21.arguments.Increment, n3, u21.arguments) or t4[s2][n3]

		local v98 = u21.arguments.Min and getValueByIndex(u21.arguments.Min, n3, u21.arguments) or t5[s2][n3]
		local v99 = u21.arguments.Max and getValueByIndex(u21.arguments.Max, n3, u21.arguments) or t6[s2][n3]
		local x = p1._config.FramePadding.X
		local floored = math.floor(((if v95 < 1 then 0 else 1) + v99 - v98) / v95)
		local v102 = p2.getMouseLocation()
		local floored2 = math.floor((v102.X - (foundChild.AbsolutePosition.X + x)) / (foundChild.AbsoluteSize.X - x * 2) * floored)
		local v104 = math.clamp(floored2 * v95 + v98, v98, v99)

		u21.state.number:set(updateValueByIndex(u21.state.number.value, n3, v104, u21.arguments))
		u21.lastNumberChangedTick = p1._cycleTick + 1
	end
	local function SliderMouseDown(p45, p46, p47)
		if p2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or p2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
			p45.state.editingText:set(p47)

			return
		end

		u20 = true
		u21 = p45
		n3 = p47
		s2 = p46
		updateActiveSlider()
	end

	p2.UserInputService.InputChanged:Connect(updateActiveSlider)
	p2.UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and u20 then
			u20 = false
			u21 = nil
			n3 = 0
			s2 = ""
		end
	end)

	local function generateSliderScalar(p49, p50, p51, ...)
		local v112 = p2.EVENTS.hover(function(p52)
			return p52.Instance
		end)

		return {
			hasState = true,
			hasChildren = false,
			Args = { Text = 1, Increment = 2, Min = 3, Max = 4, Format = 5 },
			Events = { numberChanged = t1, hovered = v112 },
			Generate = function(p53)
				local frame: Frame = Instance.new("Frame")

				frame.Name = "Iris_Slider" .. p49
				frame.Size = UDim2.fromScale(1, 0)
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.ZIndex = p53.ZIndex
				frame.LayoutOrder = p53.ZIndex
				frame.AutomaticSize = Enum.AutomaticSize.Y
				p2.UIListLayout(frame, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

				local n1 = p1._config.TextSize + 2 * p1._config.FramePadding.Y
				local uDim = UDim.new(p1._config.ContentWidth.Scale / p50, (p1._config.ContentWidth.Offset - p1._config.ItemInnerSpacing.X * (p50 - 1)) / p50)
				local uDim4 = UDim.new(uDim.Scale * (p50 - 1), uDim.Offset * (p50 - 1) + p1._config.ItemInnerSpacing.X * (p50 - 1))
				local n2 = p1._config.ContentWidth - uDim4

				for i = 1, p50 do
					local textButton: TextButton = Instance.new("TextButton")

					textButton.Name = "SliderField" .. tostring(i)
					textButton.ZIndex = p53.ZIndex + i
					textButton.LayoutOrder = p53.ZIndex + i

					if i == p50 then
						textButton.Size = UDim2.new(n2, UDim.new())
					else
						textButton.Size = UDim2.new(uDim, UDim.new())
					end

					textButton.AutomaticSize = Enum.AutomaticSize.Y
					textButton.BackgroundColor3 = p1._config.FrameBgColor
					textButton.BackgroundTransparency = p1._config.FrameBgTransparency
					textButton.AutoButtonColor = false
					textButton.Text = ""
					textButton.ClipsDescendants = true
					p2.applyFrameStyle(textButton)
					p2.applyTextStyle(textButton)
					p2.UISizeConstraint(textButton, Vector2.new(1, 0))
					textButton.Parent = frame

					local overlayText: TextLabel = Instance.new("TextLabel")

					overlayText.Name = "OverlayText"
					overlayText.Size = UDim2.fromScale(1, 1)
					overlayText.BackgroundTransparency = 1
					overlayText.BorderSizePixel = 0
					overlayText.ZIndex = p53.ZIndex + 10
					overlayText.ClipsDescendants = true
					p2.applyTextStyle(overlayText)
					overlayText.TextXAlignment = Enum.TextXAlignment.Center
					overlayText.Parent = textButton
					p2.applyInteractionHighlights(textButton, textButton, {
						ButtonColor = p1._config.FrameBgColor,
						ButtonTransparency = p1._config.FrameBgTransparency,
						ButtonHoveredColor = p1._config.FrameBgHoveredColor,
						ButtonHoveredTransparency = p1._config.FrameBgHoveredTransparency,
						ButtonActiveColor = p1._config.FrameBgActiveColor,
						ButtonActiveTransparency = p1._config.FrameBgActiveTransparency
					})

					local inputField: TextBox = Instance.new("TextBox")

					inputField.Name = "InputField"
					inputField.ZIndex = p53.ZIndex + 5
					inputField.LayoutOrder = p53.ZIndex + 2
					inputField.Size = UDim2.new(1, 0, 1, 0)
					inputField.BackgroundTransparency = 1
					inputField.ClearTextOnFocus = false
					inputField.TextTruncate = Enum.TextTruncate.AtEnd
					inputField.ClipsDescendants = true
					inputField.Visible = false
					p2.applyFrameStyle(inputField, true)
					p2.applyTextStyle(inputField)
					inputField.Parent = textButton
					inputField.FocusLost:Connect(function()
						local numberValue = tonumber(inputField.Text:match("-?%d*%.?%d*"))

						if numberValue ~= nil then
							if p53.arguments.Min ~= nil then
								numberValue = math.max(numberValue, getValueByIndex(p53.arguments.Min, i, p53.arguments))
							end

							if p53.arguments.Max ~= nil then
								numberValue = math.min(numberValue, getValueByIndex(p53.arguments.Max, i, p53.arguments))
							end

							if p53.arguments.Increment then
								local v288 = getValueByIndex(p53.arguments.Increment, i, p53.arguments)
								local rounded = math.round(numberValue / v288)
								local v290 = getValueByIndex(p53.arguments.Increment, i, p53.arguments)

								numberValue = rounded * v290
							end

							p53.state.number:set(updateValueByIndex(p53.state.number.value, i, numberValue, p53.arguments))
							p53.lastNumberChangedTick = p1._cycleTick + 1
						end

						local v291 = p53.arguments.Format[i] or p53.arguments.Format[1]

						if p53.arguments.Prefix then
							v291 = p53.arguments.Prefix[i] .. v291
						end

						inputField.Text = string.format(v291, getValueByIndex(p53.state.number.value, i, p53.arguments))
						p53.state.editingText:set(0)
						inputField:ReleaseFocus(true)
					end)
					inputField.Focused:Connect(function()
						inputField.CursorPosition = #inputField.Text + 1
						inputField.SelectionStart = 1
						p53.state.editingText:set(i)
					end)
					textButton.MouseButton1Down:Connect(function()
						SliderMouseDown(p53, p49, i)
					end)

					local grabBar: Frame = Instance.new("Frame")

					grabBar.Name = "GrabBar"
					grabBar.ZIndex = p53.ZIndex + 5
					grabBar.LayoutOrder = p53.ZIndex + 5
					grabBar.AnchorPoint = Vector2.new(0, 0.5)
					grabBar.Position = UDim2.new(0, 0, 0.5, 0)
					grabBar.BorderSizePixel = 0
					grabBar.BackgroundColor3 = p1._config.SliderGrabColor
					grabBar.Transparency = p1._config.SliderGrabTransparency

					if p1._config.GrabRounding > 0 then
						p2.UICorner(grabBar, p1._config.GrabRounding)
					end

					grabBar.Parent = textButton
				end

				local textLabel: TextLabel = Instance.new("TextLabel")

				textLabel.Name = "TextLabel"
				textLabel.Size = UDim2.fromOffset(0, n1)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.ZIndex = p53.ZIndex + 5
				textLabel.LayoutOrder = p53.ZIndex + 5
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				p2.applyTextStyle(textLabel)
				textLabel.Parent = frame

				return frame
			end,
			Update = function(p54)
				local instance = p54.Instance

				instance.TextLabel.Text = p54.arguments.Text or ("Slider %*"):format(p49)

				if p54.arguments.Format and typeof(p54.arguments.Format) ~= "table" then
					p54.arguments.Format = { p54.arguments.Format }
				else
					local t12: {[any]: any} = {}

					for i = 1, p50 do
						local v227 = t3[p49][i]

						if p54.arguments.Increment then
							local v228 = getValueByIndex(p54.arguments.Increment, i, p54.arguments)
							local v229 = math.log10(if v228 == 0 then 1 else v228)
							local roundedUp = math.ceil(-v229)

							v227 = math.max(v227, roundedUp, v227)
						end

						if p54.arguments.Max then
							local v231 = getValueByIndex(p54.arguments.Max, i, p54.arguments)
							local v232 = math.log10(if v231 == 0 then 1 else v231)
							local roundedUp = math.ceil(-v232)

							v227 = math.max(v227, roundedUp, v227)
						end

						if p54.arguments.Min then
							local v234 = getValueByIndex(p54.arguments.Min, i, p54.arguments)
							local v235 = math.log10(if v234 == 0 then 1 else v234)
							local roundedUp = math.ceil(-v235)

							v227 = math.max(v227, roundedUp, v227)
						end

						if v227 > 0 then
							t12[i] = ("%%.%*f"):format(v227)
						else
							t12[i] = "%d"
						end
					end

					p54.arguments.Format = t12
					p54.arguments.Prefix = t2[p49]
				end

				for i = 1, p50 do
					local text: string = tostring(i)
					local foundChild = instance:FindFirstChild("SliderField" .. text)
					local foundChildGrabBar = foundChild.GrabBar
					local v241 = p54.arguments.Increment and getValueByIndex(p54.arguments.Increment, i, p54.arguments) or t4[p49][i]
					local v242 = p54.arguments.Min and getValueByIndex(p54.arguments.Min, i, p54.arguments) or t5[p49][i]
					local v243 = p54.arguments.Max and getValueByIndex(p54.arguments.Max, i, p54.arguments) or t6[p49][i]
					local floored = math.floor((v243 + 1 - v242) / v241)
					local v245 = math.max(1 / floored, p1._config.GrabMinSize / foundChild.AbsoluteSize.X)

					foundChildGrabBar.Size = UDim2.new(v245, 0, 1, 0)
				end
			end,
			Discard = function(p55)
				p55.Instance:Destroy()
				p2.discardState(p55)
			end,
			GenerateState = function(p56)
				if p56.state.number == nil then
					p56.state.number = p1._widgetState(p56, "number", p51)
				end

				if p56.state.editingText == nil then
					p56.state.editingText = p1._widgetState(p56, "editingText", false)
				end
			end,
			UpdateState = function(p57)
				local instance = p57.Instance

				for i = 1, p50 do
					local text: string = tostring(i)
					local foundChild = instance:FindFirstChild("SliderField" .. text)
					local foundChildInputField = foundChild.InputField
					local foundChildOverlayText = foundChild.OverlayText
					local foundChildGrabBar = foundChild.GrabBar
					local v256 = getValueByIndex(p57.state.number.value, i, p57.arguments)
					local v257 = p57.arguments.Format[i] or p57.arguments.Format[1]

					if p57.arguments.Prefix then
						v257 = p57.arguments.Prefix[i] .. v257
					end

					foundChildOverlayText.Text = string.format(v257, v256)
					foundChildInputField.Text = tostring(v256)
					v257 = p57.arguments.Increment and getValueByIndex(p57.arguments.Increment, i, p57.arguments) or t4[p49][i]

					local v258 = p57.arguments.Min and getValueByIndex(p57.arguments.Min, i, p57.arguments) or t5[p49][i]
					local v259 = p57.arguments.Max and getValueByIndex(p57.arguments.Max, i, p57.arguments) or t6[p49][i]
					local x = p1._config.FramePadding.X
					local floored = math.floor(((if v257 < 1 then 0 else 1) + v259 - v258) / v257)
					local n1 = 1 - foundChildGrabBar.AbsoluteSize.X / (foundChild.AbsoluteSize.X - x * 2)
					local floored3 = math.floor((v256 - v258) / (v259 - v258) * floored)
					local v264 = math.clamp(floored3 / floored, 0, n1)

					foundChildGrabBar.Position = UDim2.new(v264, 0, 0.5, 0)

					if i == p57.state.editingText.value then
						foundChildInputField.Visible = true
						foundChildOverlayText.Visible = false
						foundChildGrabBar.Visible = false
						foundChildInputField:CaptureFocus()
					else
						foundChildInputField.Visible = false
						foundChildOverlayText.Visible = true
						foundChildGrabBar.Visible = true
					end
				end
			end
		}
	end
	local function generateEnumSliderScalar(p58, p59)
		local v115 = generateSliderScalar("Enum", 1, p59.Value)
		local t9: {[any]: any} = { string }

		for iterFirst, iterSecond in p58:GetEnumItems() do
			t9[iterSecond.Value] = iterSecond.Name
		end

		return p2.extend(v115, {
			Args = { Text = 1 },
			Update = function(p60)
				local instance = p60.Instance

				instance.TextLabel.Text = p60.arguments.Text or "Input Enum"
				p60.arguments.Increment = 1
				p60.arguments.Min = 0
				p60.arguments.Max = #p58:GetEnumItems() - 1

				local sliderField1 = instance:FindFirstChild("SliderField1")
				local sliderField1GrabBar = sliderField1.GrabBar
				local enumItems = p58:GetEnumItems()
				local floored = math.floor(#enumItems)
				local v271 = math.max(1 / floored, p1._config.GrabMinSize / sliderField1.AbsoluteSize.X)

				sliderField1GrabBar.Size = UDim2.new(v271, 0, 1, 0)
			end,
			GenerateState = function(p61)
				if p61.state.number == nil then
					p61.state.number = p1._widgetState(p61, "number", p59.Value)
				end

				if p61.state.enumItem == nil then
					p61.state.enumItem = p1._widgetState(p61, "enumItem", p59)
				end

				if p61.state.editingText == nil then
					p61.state.editingText = p1._widgetState(p61, "editingText", false)
				end
			end
		})
	end

	generateEnumSliderScalar = generateInputScalar("Num", 1, 0)
	generateEnumSliderScalar.Args.NoButtons = 6
	p1.WidgetConstructor("InputNum", generateEnumSliderScalar)
	p1.WidgetConstructor("InputVector2", generateInputScalar("Vector2", 2, Vector2.zero))
	p1.WidgetConstructor("InputVector3", generateInputScalar("Vector3", 3, Vector3.new(0, 0, 0)))
	p1.WidgetConstructor("InputUDim", generateInputScalar("UDim", 2, UDim.new()))
	p1.WidgetConstructor("InputUDim2", generateInputScalar("UDim2", 4, UDim2.new()))
	p1.WidgetConstructor("InputRect", generateInputScalar("Rect", 4, Rect.new(0, 0, 0, 0)))
	p1.WidgetConstructor("DragNum", generateDragScalar("Num", 1, 0))
	p1.WidgetConstructor("DragVector2", generateDragScalar("Vector2", 2, Vector2.zero))
	p1.WidgetConstructor("DragVector3", generateDragScalar("Vector3", 3, Vector3.new(0, 0, 0)))
	p1.WidgetConstructor("DragUDim", generateDragScalar("UDim", 2, UDim.new()))
	p1.WidgetConstructor("DragUDim2", generateDragScalar("UDim2", 4, UDim2.new()))
	p1.WidgetConstructor("DragRect", generateDragScalar("Rect", 4, Rect.new(0, 0, 0, 0)))
	p1.WidgetConstructor("InputColor3", generateColorDragScalar("Color3", Color3.fromRGB(0, 0, 0)))

	local widgetConstructor = p1.WidgetConstructor
	local color3 = Color3.fromRGB(0, 0, 0)

	widgetConstructor("InputColor4", generateColorDragScalar("Color4", color3, 0))
	p1.WidgetConstructor("SliderNum", generateSliderScalar("Num", 1, 0))
	p1.WidgetConstructor("SliderVector2", generateSliderScalar("Vector2", 2, Vector2.zero))
	p1.WidgetConstructor("SliderVector3", generateSliderScalar("Vector3", 3, Vector3.new(0, 0, 0)))
	p1.WidgetConstructor("SliderUDim", generateSliderScalar("UDim", 2, UDim.new()))
	p1.WidgetConstructor("SliderUDim2", generateSliderScalar("UDim2", 4, UDim2.new()))
	p1.WidgetConstructor("SliderRect", generateSliderScalar("Rect", 4, Rect.new(0, 0, 0, 0)))

	local v32 = p1.WidgetConstructor

	local v33 = p2.EVENTS.hover(function(p64)
		return p64.Instance
	end)

	v32("InputText", {
		hasState = true,
		hasChildren = false,
		Args = { Text = 1, TextHint = 2 },
		Events = {
			textChanged = {
				Init = function(p62)
					p62.lastTextchangeTick = 0
				end,
				Get = function(p63)
					return p63.lastTextchangeTick == p1._cycleTick
				end
			},
			hovered = v33
		},
		Generate = function(p65)
			local iris_InputText: Frame = Instance.new("Frame")

			iris_InputText.Name = "Iris_InputText"
			iris_InputText.Size = UDim2.new(p1._config.ContentWidth, UDim.new(0, 0))
			iris_InputText.BackgroundTransparency = 1
			iris_InputText.BorderSizePixel = 0
			iris_InputText.ZIndex = p65.ZIndex
			iris_InputText.LayoutOrder = p65.ZIndex
			iris_InputText.AutomaticSize = Enum.AutomaticSize.Y
			p2.UIListLayout(iris_InputText, Enum.FillDirection.Horizontal, UDim.new(0, p1._config.ItemInnerSpacing.X))

			local inputField: TextBox = Instance.new("TextBox")

			inputField.Name = "InputField"
			inputField.Size = UDim2.new(1, 0, 0, 0)
			inputField.AutomaticSize = Enum.AutomaticSize.Y
			inputField.BackgroundColor3 = p1._config.FrameBgColor
			inputField.BackgroundTransparency = p1._config.FrameBgTransparency
			inputField.Text = ""
			inputField.PlaceholderColor3 = p1._config.TextDisabledColor
			inputField.TextTruncate = Enum.TextTruncate.AtEnd
			inputField.ClearTextOnFocus = false
			inputField.ZIndex = p65.ZIndex + 1
			inputField.LayoutOrder = p65.ZIndex + 1
			inputField.ClipsDescendants = true
			p2.applyFrameStyle(inputField)
			p2.applyTextStyle(inputField)
			p2.UISizeConstraint(inputField, Vector2.new(1, 0))
			inputField.Parent = iris_InputText
			inputField.FocusLost:Connect(function()
				p65.state.text:set(inputField.Text)
				p65.lastTextchangeTick = p1._cycleTick + 1
			end)

			local n1 = p1._config.TextSize + p1._config.FramePadding.Y * 2
			local textLabel: TextLabel = Instance.new("TextLabel")

			textLabel.Name = "TextLabel"
			textLabel.Size = UDim2.fromOffset(0, n1)
			textLabel.AutomaticSize = Enum.AutomaticSize.X
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.ZIndex = p65.ZIndex + 4
			textLabel.LayoutOrder = p65.ZIndex + 4
			p2.applyTextStyle(textLabel)
			textLabel.Parent = iris_InputText

			return iris_InputText
		end,
		Update = function(p66)
			local instance = p66.Instance
			local inputField = instance.InputField

			instance.TextLabel.Text = p66.arguments.Text or "Input Text"
			inputField.PlaceholderText = p66.arguments.TextHint or ""
		end,
		Discard = function(p67)
			p67.Instance:Destroy()
			p2.discardState(p67)
		end,
		GenerateState = function(p68)
			if p68.state.text == nil then
				p68.state.text = p1._widgetState(p68, "text", "")
			end
		end,
		UpdateState = function(p69)
			p69.Instance.InputField.Text = p69.state.text.value
		end
	})
end
