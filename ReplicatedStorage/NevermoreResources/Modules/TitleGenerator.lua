



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("qSystems")
local v3 = replicatedStorage("qGUI")

replicatedStorage("Maid")

local make = v2.Make

local function GenerateTitle(parent, p2, p3, p4)
	local t1: {[any]: any} = {
		Height = 90,
		ZIndex = 10,
		LifeTime = 3,
		AnimationTime = 1,
		ShadowTransparency = 0.9,
		BarTransparency = 0.3,
		BarHeight = 4,
		ExpandFactor = 8,
		LabelHeight = 20
	}
	local v11 = make("Frame", {
		Archivable = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "TitleContainer",
		ZIndex = 10,
		ClipsDescendants = true
	})

	v11.Parent = parent

	local t2: {[any]: any} = {}
	local u13 = p2:upper()
	local n1 = 0

	for i = 1, #u13 do
		local substring = u13:sub(i, i)

		if substring == " " then
			n1 += 10
		else
			local v17 = make("TextLabel", {
				Archivable = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Font = "Arial",
				FontSize = "Size36",
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextXAlignment = "Left",
				ZIndex = 10,
				Name = "MiddleLabel" .. substring,
				Parent = v11,
				Size = UDim2.new(0, 0, 1, 0),
				Text = substring,
				TextColor3 = Color3.new(1, 1, 1)
			})

			if i % 2 == 0 then
				v17.Position = UDim2.new(0, 0, 0.5, -45)
			else
				v17.Position = UDim2.new(1, 0, 0.5, -45)
			end

			local uDim2 = UDim2.new(0.25, n1, 0, 0)

			delay(1 * (i / #u13 / 2), function()
				v17:TweenPosition(uDim2, "Out", "Quad", 0.5, true)
				v3.TweenTransparency(v17, { TextTransparency = 0, TextStrokeTransparency = 0.9 }, 0.5, true)
			end)
			n1 = n1 + v17.TextBounds.X + 5
			t2[#t2 + 1] = v17
		end
	end

	local n2 = n1
	local t3: {[any]: any} = {}

	if p3 then
		local v21 = p3:upper()
		local n3 = 0

		for i = 1, #v21 do
			local substring2 = v21:sub(i, i)

			if substring2 == " " then
				n3 += 5
			else
				local v25 = make("TextLabel", {
					Archivable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Font = "Arial",
					FontSize = "Size14",
					TextStrokeTransparency = 1,
					TextTransparency = 1,
					TextXAlignment = "Left",
					ZIndex = 10,
					Name = "TopLabel" .. substring2,
					Parent = v11,
					Size = UDim2.new(0, 0, 0, 20),
					Text = substring2,
					TextColor3 = Color3.new(1, 1, 1)
				})

				v25.Position = UDim2.new(1, 0, 0, 0)

				local uDim2 = UDim2.new(0.1875, n3, 0, 0)

				delay(1 * (i / #v21 / 2), function()
					v25:TweenPosition(uDim2, "Out", "Quad", 0.5, true)
					v3.TweenTransparency(v25, { TextTransparency = 0, TextStrokeTransparency = 0.9 }, 0.5, true)
				end)
				n3 = n3 + v25.TextBounds.X + 3
				t3[#t3 + 1] = v25
			end
		end
	end

	local t4: {[any]: any} = {}

	if p4 then
		local v28 = p4:upper()
		local n4 = 0

		for i = #v28, 1, -1 do
			local substring3 = v28:sub(i, i)

			if substring3 == " " then
				n4 += 5
			else
				local v32 = make("TextLabel", {
					Archivable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Font = "Arial",
					FontSize = "Size14",
					TextStrokeTransparency = 1,
					TextTransparency = 1,
					TextXAlignment = "Right",
					ZIndex = 10,
					Name = "BottomLabel" .. substring3,
					Parent = v11,
					Size = UDim2.new(0, 0, 0, 20),
					Text = substring3,
					TextColor3 = Color3.new(1, 1, 1)
				})

				v32.Position = UDim2.new(0, 0, 1, -20)

				local uDim2 = UDim2.new(0.8125, -n4, 1, -20)

				delay(1 * ((#v28 - i) / #v28 / 2), function()
					v32:TweenPosition(uDim2, "Out", "Quad", 0.5, true)
					v3.TweenTransparency(v32, { TextTransparency = 0, TextStrokeTransparency = 0.9 }, 0.5, true)
				end)
				n4 = n4 + v32.TextBounds.X + 3
				t4[#t4 + 1] = v32
			end
		end
	end

	local v34 = make("Frame", {
		Archivable = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "TopDecoration",
		ZIndex = 10,
		BackgroundColor3 = Color3.new(1, 1, 1),
		Parent = v11,
		Position = UDim2.new(0.125, 0, 0, 20),
		Size = UDim2.new(0.75, 0, 0, 4)
	})
	local v35 = make("Frame", {
		Archivable = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "BottomDecoration",
		ZIndex = 10,
		BackgroundColor3 = Color3.new(1, 1, 1),
		Parent = v11,
		Position = UDim2.new(0.125, 0, 1, -24),
		Size = UDim2.new(0.75, 0, 0, 4)
	})

	v3.TweenTransparency(v34, { BackgroundTransparency = 0.3 }, 1, true)
	v3.TweenTransparency(v35, { BackgroundTransparency = 0.3 }, 1, true)
	v11.Size = UDim2.new(0, n2 * 2, 0, 0)
	v11.Position = UDim2.new(0.5, -n2, 0.5, -45)

	local uDim2 = UDim2.new(0, n2 * 2, 0, 90)
	local uDim22 = UDim2.new(0.5, -n2, 0.5, -90)

	v11:TweenSizeAndPosition(uDim2, uDim22, "Out", "Quad", 1, true)
	delay(3, function()
		v3.TweenTransparency(v34, { BackgroundTransparency = 1 }, 1, true)
		v3.TweenTransparency(v35, { BackgroundTransparency = 1 }, 1, true)

		local uDim23 = UDim2.new(0, n2 * 2, 0, 720)
		local uDim24 = UDim2.new(0.5, -n2, 0.5, -405)

		v11:TweenSizeAndPosition(uDim23, uDim24, "In", "Quad", 1, true)
		v34:TweenSizeAndPosition(UDim2.new(1, 0, 0, 0), UDim2.new(0, 0, 0.25, 20), "Out", "Quad", 1)
		v35:TweenSizeAndPosition(UDim2.new(1, 0, 0, 0), UDim2.new(0, 0, 0.75, -24), "Out", "Quad", 1)

		for k, v in pairs(t2) do
			delay(1 * (k / #u13 / 2), function()
				local uDim25 = UDim2.new(if k % 2 == 0 then 1 else 0, 0, 0, 0)

				v:TweenPosition(uDim25, "In", "Quad", 0.5, true)
				v3.TweenTransparency(v, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.5, true)
			end)
		end

		for k, v in pairs(t3) do
			delay(1 * (k / #u13 / 2), function()
				if v:IsDescendantOf(game) then
					v:TweenPosition(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.5, true)
					v3.TweenTransparency(v, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.5, true)
				end
			end)
		end

		for k, v in pairs(t4) do
			delay(1 * (k / #u13 / 2), function()
				if v:IsDescendantOf(game) then
					v:TweenPosition(UDim2.new(1, 0, 1, -20), "In", "Quad", 0.5, true)
					v3.TweenTransparency(v, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.5, true)
				end
			end)
		end

		wait(1)

		for _, v in pairs(t2) do
			v:Destroy()
		end

		for _, v in pairs(t3) do
			v:Destroy()
		end

		v34:Destroy()
		v35:Destroy()
		v11:Destroy()
	end)
end

return { GenerateTitle = GenerateTitle, generateTitle = GenerateTitle }
