



local LocalPlayer = game.Players.LocalPlayer
local tweenService: TweenService = game:GetService("TweenService")
local cardLibrary = (function()
	local real = require(game.ReplicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()
local nonGameCard = require(script.Parent.NonGameCard)
local data = require(script.Parent.Data)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioService = require(replicatedStorage.AudioService)
local animation = require(game.ReplicatedStorage.Animation)
local replicatedStorage2: ReplicatedStorage = game:GetService("ReplicatedStorage")
local effects = require(replicatedStorage2.Effects)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local unpackScreen = visGui:WaitForChild("UnpackScreen")
local unpackScreenUnpack = unpackScreen.Unpack
local unpackScreenUnpackSummary = unpackScreen.UnpackSummary
local unpackScreenTemplates = unpackScreen.Templates
local unpackScreenClose = unpackScreen.Close
local unpackScreenSkip = unpackScreen.Skip
local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local t3 = {}
local t4: {[any]: any} = {}
local t5 = {}
local t6: {[any]: any} = {}
local t7 = {}
local n1 = 0
local n2: number = 0
local u32: boolean = false
local color3 = Color3.fromRGB(0, 255, 217)
local color32 = Color3.fromRGB(251, 255, 0)
local color33 = Color3.fromRGB(255, 0, 208)
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
local tweenInfo2 = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

local function CopyTable(p1)
	local t14: {[any]: any} = {}

	for k, v in pairs(p1) do
		t14[k] = v
	end

	return t14
end
local function ShuffleTable(p2)
	local t15: {[any]: any} = {}

	for k, v in pairs(p2) do
		t15[k] = v
	end

	local t16: {[any]: any} = {}
	local n1: number = 1

	repeat
		local randomNumber = math.random(1, #t15)

		t16[n1] = t15[randomNumber]
		table.remove(t15, randomNumber)
		n1 += 1
	until #t15 == 0

	return t16
end

local preventAutoVisible = visGui.OmniShop.Unpack.PreventAutoVisible
local unpackedHolder = preventAutoVisible.PackXY.PackYY.UnpackedHolder
local preventAutoVisibleParticles = preventAutoVisible.Particles

function UnpackExplosion(p3, p4, p5, p6, p7)
	local v76 = p7 or preventAutoVisibleParticles

	spawn(function()
		local renderStepped = game:GetService("RunService").RenderStepped
		local t20: {[any]: any} = {}
		local t21: {[any]: any} = {}

		for i = 1, p4 do
			local frame: Frame = Instance.new("Frame")

			frame.ZIndex = p3.ZIndex + 2
			frame.SizeConstraint = "RelativeYY"
			frame.Size = UDim2.new(0.04, 0, 0.04, 0)

			local randomNumber = math.random()
			local n1 = (p3.AbsolutePosition.X + p3.AbsoluteSize.X * randomNumber) / visGui.AbsoluteSize.X
			local n2 = (p3.AbsolutePosition.Y + p3.AbsoluteSize.Y) / visGui.AbsoluteSize.Y

			if p6 then
				n1 = p6.X / visGui.AbsoluteSize.X
				n2 = p6.Y / visGui.AbsoluteSize.Y
			end

			frame.Position = UDim2.new(n1, 0, n2, 0)
			frame.BorderSizePixel = 0
			frame.BackgroundColor3 = p5
			frame.BackgroundTransparency = 1
			frame.Parent = v76

			local randomNumber2 = math.random()

			t20[i] = {
				frame,
				{ (randomNumber2 + 1) * 1.2, (randomNumber - 0.5) * 0.66 }
			}
		end

		local n3 = 0

		repeat
			local v180 = renderStepped:wait()

			n3 += v180

			for _, v in pairs(t20) do
				local v183 = v[1]
				local v184 = v[2]

				v183.BackgroundTransparency = v183.BackgroundTransparency - v180 * 1 * 10
				v183.Position = UDim2.new(v183.Position.X.Scale + v184[2] * v180 * 1, 0, v183.Position.Y.Scale - v184[1] * v180 * 1, 0)
				v184[1] = v184[1] - 7 * v180 * 1
			end
		until n3 > 2

		for _, v in pairs(t20) do
			v[1]:Destroy()
		end
	end)
end

local t8: {[any]: any} = { 100, Color3.fromRGB(255, 255, 255) }
local t9: {[any]: any} = { 40, Color3.fromRGB(255, 217, 0) }
local t10: {[any]: any} = { 10, Color3.fromRGB(8, 0, 255) }
local t11: {[any]: any} = { 20, Color3.fromRGB(255, 0, 0) }
local t12: {[any]: any} = { Legendary = 7174851840, Epic = 7174851885, Rare = 7174851748 }

local function ChangePackTransparency(p8, imageTransparency)
	p8.Top.ImageTransparency = imageTransparency
	p8.Top.Picture.ImageTransparency = imageTransparency
	p8.Bottom.ImageTransparency = imageTransparency
	p8.Bottom.Picture.ImageTransparency = imageTransparency
	p8.ImageTransparency = imageTransparency
end
local function ApplyFoilStroke(parent)
	local uiStroke: UIStroke = Instance.new("UIStroke")

	uiStroke.Parent = parent
	uiStroke.Thickness = 4

	local v81: Tween = tweenService:Create(uiStroke, tweenInfo, { Color = color3 })
	local v82: Tween = tweenService:Create(uiStroke, tweenInfo, { Color = color32 })
	local v83: Tween = tweenService:Create(uiStroke, tweenInfo, { Color = color33 })
	local v84: Tween = tweenService:Create(uiStroke, tweenInfo2, { Thickness = 12, Transparency = 0.3 })
	local v85: Tween = tweenService:Create(uiStroke, tweenInfo2, { Thickness = 3, Transparency = 0.1 })

	task.spawn(function()
		while uiStroke do
			v81:Play()
			v81.Completed:Wait()
			v82:Play()
			v82.Completed:Wait()
			v83:Play()
			v83.Completed:Wait()
		end
	end)
	task.spawn(function()
		while uiStroke do
			v84:Play()
			v84.Completed:Wait()
			v85:Play()
			v85.Completed:Wait()
		end
	end)
end
local function ApplyNewStroke(parent)
	local uiStroke: UIStroke = Instance.new("UIStroke")

	uiStroke.Parent = parent
	uiStroke.Thickness = 4
	uiStroke.Color = Color3.fromRGB(255, 220, 23)

	local v88: Tween = tweenService:Create(uiStroke, tweenInfo2, { Thickness = 6 })
	local v89: Tween = tweenService:Create(uiStroke, tweenInfo2, { Thickness = 2 })

	task.spawn(function()
		while uiStroke do
			v88:Play()
			v88.Completed:Wait()
			v89:Play()
			v89.Completed:Wait()
		end
	end)
end
local function TweenInSkipButton()
	unpackScreenSkip.Visible = true

	local unpackScreenSkipPosition = unpackScreenSkip.Position
	local v91 = unpackScreenSkip
	local v92 = v91.Position
	local v93 = UDim2.fromScale(0, 1)

	v91.Position = v92 + v93
	unpackScreenSkip:TweenPosition(unpackScreenSkipPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
end
local function CheckIfPackIsFoil(p12, p13)
	for i = (p12 - 1) * p13 + 1, (p12 - 1) * p13 + p13 do
		if cardLibrary[t7[i]].Foil then
			return true
		end
	end

	return false
end
local function CheckIfPackIsNew(p14, p15, p16)
	for i = (p14 - 1) * p16 + 1, (p14 - 1) * p16 + p16 do
		if p15[t7[i]] then
			return true
		end
	end

	return false
end
local function GetCardFromPackAndIndex(p17, p18, p19)
	return t7[(p17 - 1) * p19 + p18]
end
local function NewThing(parent)
	local new: ImageLabel = Instance.new("ImageLabel")

	new.Name = "New"
	new.Image = "rbxassetid://485595241"
	new.BackgroundTransparency = 1
	new.ImageTransparency = 0.2
	new.SizeConstraint = "RelativeXX"
	new.Size = UDim2.new(0.5, 0, 0.5, 0)
	new.Position = UDim2.new(-0.1, 0, -0.05, 0)
	new.Visible = true
	new.Rotation = -10
	new.Parent = parent
	new.ZIndex = parent.ZIndex + 1

	return new
end
local function AddLabel(parent, text, layoutOrder)
	local clone = unpackScreenTemplates.Label:Clone()

	clone.Parent = parent
	clone.Text = text
	clone.LayoutOrder = layoutOrder
	clone.Visible = true
	clone.BackgroundTransparency = 0
	audioService.PlaySound("UI-MouseOver Pop HD")
	animation.AnimateAsync(clone, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
end
local function ShowPackSummary()
	for _, v in pairs(unpackScreen.Packs:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for _, v in pairs(unpackScreenUnpack.PackHolderSkeleton:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	n2 = 0
	n1 = 0
	t2 = {}
	t1 = {}
	local t17: {[any]: any} = {
		Common = 1,
		Uncommon = 100,
		Rare = 1000,
		Epic = 10000,
		Legendary = 100000
	}
	local t18: {[any]: any} = {
		Foil = 0,
		["New Card"] = 0,
		Legendary = 0,
		Epic = 0,
		Rare = 0,
		Uncommon = 0,
		Common = 0
	}
	local t19: {[any]: any} = {
		Foil = 1,
		["New Card"] = 2,
		Legendary = 3,
		Epic = 4,
		Rare = 5,
		Uncommon = 6,
		Common = 7
	}

	unpackScreenUnpack.Visible = false

	local n3: number = 1

	for k, v in pairs(t4) do
		local v120 = cardLibrary[k]

		for _ = 1, v do
			local clone = unpackScreenTemplates.Skeleton:Clone()

			clone.Parent = unpackScreenUnpackSummary.ScrollingFrame.CardHolder
			clone.Image = "rbxassetid://" .. v120.Id
			clone.Visible = true
			clone.LayoutOrder = (n3 + t17[v120.Rarity] + (if t5[k] then 1000000 else 0) + (if v120.Foil then 10000000 else 0)) * -1
			nonGameCard.BindInspect(clone, v120)

			local rarity = v120.Rarity

			t18[rarity] = t18[rarity] + 1

			if v120.Foil then
				t18.Foil = t18.Foil + 1
				foilEffect(clone, v120.LibraryIndex)
			end

			if t5[k] then
				NewThing(clone)
				t18["New Card"] = t18["New Card"] + 1
			end
		end

		n3 += 1
	end

	unpackScreenUnpackSummary.Visible = true

	for k, v in pairs(t18) do
		if v > 0 then
			local unpackScreenUnpackSummarySummary = unpackScreenUnpackSummary.Summary
			local text: string = tostring(v)

			AddLabel(unpackScreenUnpackSummarySummary, text .. " " .. k .. (if v > 1 then "s" else "") .. (if k == "Foil" or k == "New Card" then "!" else ""), t19[k])
			task.wait(0.2)
		end
	end

	unpackScreenUnpackSummary.Close.Visible = true

	local unpackScreenUnpackSummaryClose = unpackScreenUnpackSummary.Close
	local ClosePosition = unpackScreenUnpackSummary.Close.Position
	local v130 = UDim2.fromScale(0, 1)

	unpackScreenUnpackSummaryClose.Position = ClosePosition + v130

	local close = unpackScreenUnpackSummary.Close

	v130 = unpackScreenUnpackSummary.Close.Position

	local v132 = UDim2.fromScale(0, 1)

	close:TweenPosition(v130 - v132, "Out", "Quart", 1)
end

unpackScreenClose.MouseButton1Click:Connect(function()
	unpackScreen.Cards:ClearAllChildren()
	n2 += 1
	unpackScreenClose.Visible = false
	u32 = false

	if n2 == n1 then
		ShowPackSummary()

		return
	end

	unpackScreenSkip.Visible = true

	local unpackScreenSkipPosition = unpackScreenSkip.Position
	local v134 = unpackScreenSkip
	local v135 = v134.Position
	local v136 = UDim2.fromScale(0, 1)

	v134.Position = v135 + v136
	unpackScreenSkip:TweenPosition(unpackScreenSkipPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)

	for _, v in pairs(t2) do
		if v then
			local vPosition = v.Position
			local v140 = UDim2.fromScale(0, 1)

			v:TweenPosition(vPosition - v140, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
			task.wait(0.01)
		end
	end
end)

local t13: {[any]: any} = { Foil = t8, Legendary = t9, Rare = t10, Epic = t11 }

local function DestroyAnythingInsideMeThatIsAGuiObject(p28)
	for _, v in pairs(p28:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end
end

unpackScreenUnpackSummary.Close.MouseButton1Click:Connect(function()
	DestroyAnythingInsideMeThatIsAGuiObject(unpackScreenUnpackSummary.ScrollingFrame.CardHolder)
	DestroyAnythingInsideMeThatIsAGuiObject(unpackScreenUnpackSummary.Summary)
	t3 = {}
	t5 = {}
	t6 = {}
	t4 = {}
	t7 = {}
	unpackScreenUnpackSummary.Visible = false
	unpackScreenUnpackSummary.Close.Visible = false
	unpackScreen.Visible = true
end)
unpackScreenSkip.MouseButton1Click:Connect(function()
	if u32 then
		return
	end

	unpackScreenSkip.Visible = false
	ShowPackSummary()
end)

return {
	ShowPacks = function(p24, p25, p26, p27)
		local u148
		local u149

		t3 = p24

		for k, v in pairs(p24) do
			t4[k] = v

			for _ = 1, v do
				table.insert(t6, k)
			end
		end

		for k, v in pairs(p25) do
			t4[k] = v

			for _ = 1, v do
				table.insert(t6, k)
			end
		end

		t5 = p25
		t7 = ShuffleTable(t6)
		n1 = #t7 / p27
		unpackScreenUnpack.Reminder.Visible = true
		print(p27)
		print(n1)

		for _, v in pairs(unpackScreenUnpack.PackHolderSkeleton:GetChildren()) do
			if v:IsA("GuiObject") then
				v:Destroy()
			end
		end

		for _ = 1, n1 do
			local clone = unpackScreenTemplates.PackSkeleton:Clone()

			clone.Top.ImageTransparency = 1
			clone.Top.Picture.ImageTransparency = 1
			clone.Bottom.ImageTransparency = 1
			clone.Bottom.Picture.ImageTransparency = 1
			clone.ImageTransparency = 1
			clone.Parent = unpackScreenUnpack.PackHolderSkeleton
			clone.Visible = true
			table.insert(t1, clone)
		end

		unpackScreenUnpack.PackHolderSkeleton.Visible = true
		unpackScreenUnpack.Visible = true
		unpackScreen.Visible = true

		for i = 1, n1 do
			local clone2 = unpackScreenTemplates.PackSkeleton:Clone()

			clone2.Top.ImageTransparency = 0
			clone2.Top.Picture.ImageTransparency = 0
			clone2.Bottom.ImageTransparency = 0
			clone2.Bottom.Picture.ImageTransparency = 0
			clone2.ImageTransparency = 0
			clone2.Parent = unpackScreen.Packs
			clone2.Visible = true
			clone2.Top.Picture.Image = "rbxassetid://" .. p26
			clone2.Bottom.Picture.Image = "rbxassetid://" .. p26

			local v162
			local v162
			local v163

			for j = (i - 1) * p27 + 1, (i - 1) * p27 + p27 do
				if not cardLibrary[t7[j]].Foil then
					continue
				end

				if true then
					audioService.PlaySound("incoming foil")
					ApplyFoilStroke(clone2)
				else
					for k = (i - 1) * p27 + 1, (i - 1) * p27 + p27 do
						if p25[t7[k]] then
							if true then
								ApplyNewStroke(clone2)
							end

							clone2.Top.ImageTransparency = 0
							clone2.Bottom.ImageTransparency = 0
							audioService.PlaySound("Draw")
							v162 = UDim2.fromOffset(t1[i].AbsoluteSize.X, t1[i].AbsoluteSize.Y)
							v163 = UDim2.fromOffset(t1[i].AbsolutePosition.X, t1[i].AbsolutePosition.Y)
							clone2:TweenSizeAndPosition(v162, v163, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
							t2[i] = clone2
							clone2.ZIndex = clone2.ZIndex + 1
							clone2.MouseButton1Click:Connect(function()
								if u32 then
									return
								end

								local n1: number = 0

								u32 = true
								unpackScreenUnpack.Reminder.Visible = false
								unpackScreenSkip.Visible = false
								audioService.PlaySound("UI-MouseOver Pop HD")

								local clone2Top = clone2.Top
								local v189 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

								clone2Top:TweenPosition(v189, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.7)

								for _, v in pairs(t2) do
									if v ~= clone2 then
										task.wait(0.05)

										local vPosition = v.Position
										local v193 = UDim2.fromScale(0, 1)

										v:TweenPosition(vPosition + v193, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.5)
									end
								end

								task.wait(0.7)

								for i2 = 1, p27 do
									task.spawn(function()
										local clone3 = unpackScreenTemplates.Skeleton:Clone()
										local u198: boolean = false
										local uDim2FromOffset = UDim2.fromOffset
										local unpackScreenUnpackCardSkeleton = unpackScreenUnpack.CardSkeleton
										local text: string = tostring(i2)
										local x = unpackScreenUnpackCardSkeleton[text].AbsolutePosition.X
										local cardSkeleton = unpackScreenUnpack.CardSkeleton
										local text2: string = tostring(i2)
										local uDim2 = uDim2FromOffset(x, cardSkeleton[text2].AbsolutePosition.Y)
										local v206 = t7[(i - 1) * p27 + i2]
										local v207 = p25[v206]
										local foil = cardLibrary[v206].Foil

										if foil then
											networkClient.Preload({ "rbxassetid://" .. cardLibrary[v206].Id, "rbxassetid://5661901654" })
											ApplyFoilStroke(clone3)
										elseif v207 then
											ApplyNewStroke(clone3)
										end

										clone3.Parent = unpackScreen.Cards
										clone3.Size = UDim2.fromOffset(clone2.AbsoluteSize.X, clone2.AbsoluteSize.Y)
										clone3.Position = UDim2.fromOffset(clone2.AbsolutePosition.X, clone2.AbsolutePosition.Y)
										clone3.Image = "rbxassetid://" .. data.CurrentSleeveId()
										clone3.Visible = true
										audioService.PlaySound("Swoosh")

										local clone3Position = clone3.Position
										local v210 = UDim2.fromOffset(0, -unpackScreen.AbsoluteSize.Y)

										clone3:TweenPosition(clone3Position + v210, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
										task.wait(0.7)

										local v211 = UDim2.fromOffset
										local v212 = unpackScreenUnpack.CardSkeleton
										local text3: string = tostring(i2)
										local v214 = v212[text3].AbsoluteSize.X
										local v215 = unpackScreenUnpack.CardSkeleton
										local text4: string = tostring(i2)
										local v217 = v211(v214, v215[text4].AbsoluteSize.Y)

										clone3:TweenSizeAndPosition(v217, uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.4)
										wait(0.4)
										clone3.Position = uDim2

										local v218 = cardLibrary[v206]
										local t22: {[any]: any} = {
											LibraryIndex = v206,
											Name = v218.Name,
											Id = v218.Id,
											Color = v218.Color,
											Rarity = v218.Rarity
										}

										clone3.MouseEnter:Connect(function()
											if u198 then
												return
											end

											u198 = true

											local v220 = UDim2.fromOffset(clone3.AbsoluteSize.X, clone3.AbsoluteSize.Y)
											local v221 = UDim2.fromOffset(0, v220.Y.Offset)
											local v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)

											clone3:TweenSizeAndPosition(v221, uDim2 + v222, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.25)
											task.wait(0.3)
											audioService.PlaySound("Draw")

											if clone3:FindFirstChild("UIStroke") then
												clone3.UIStroke:Destroy()
											end

											clone3.Image = "rbxassetid://" .. v218.Id

											if v207 then
												NewThing(clone3)
											end

											if foil then
												foilEffect(clone3, v206)
												effects.Foil(visGui.Effect, clone3)
												UnpackExplosion(clone3, unpack(t13.Foil))
											end

											if t13[t22.Rarity] then
												UnpackExplosion(clone3, unpack(t13[t22.Rarity]))
											end

											if t12[t22.Rarity] then
												audioService.PlaySound(t12[t22.Rarity])
											end

											nonGameCard.BindInspect(clone3, v218)
											v221 = UDim2.fromOffset(v220.X.Offset, v220.Y.Offset)
											v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)
											clone3:TweenSizeAndPosition(v221, uDim2 - v222, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
											task.wait(0.25)
											clone3.Position = uDim2
											n1 += 1

											if n1 == p27 then
												local unpackScreenClosePosition = unpackScreenClose.Position
												local v224 = unpackScreenClose
												local v225 = v224.Position
												local v226 = UDim2.fromScale(0, 1)

												v224.Position = v225 + v226
												unpackScreenClose.Visible = true
												unpackScreenClose:TweenPosition(unpackScreenClosePosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
											end
										end)
									end)
									task.wait(0.1)
								end

								local clone2Position = clone2.Position
								local v196 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

								clone2:TweenPosition(clone2Position + v196, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
								task.wait(0.5)
								clone2:Destroy()
								t2[i] = nil
							end)
							task.wait(0.05)
						end
					end

					u149 = false
				end

				do
					clone2.Top.ImageTransparency = 0
					clone2.Bottom.ImageTransparency = 0
					audioService.PlaySound("Draw")
					v162 = UDim2.fromOffset(t1[i].AbsoluteSize.X, t1[i].AbsoluteSize.Y)
					v163 = UDim2.fromOffset(t1[i].AbsolutePosition.X, t1[i].AbsolutePosition.Y)
					clone2:TweenSizeAndPosition(v162, v163, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
					t2[i] = clone2
					clone2.ZIndex = clone2.ZIndex + 1
					clone2.MouseButton1Click:Connect(function()
						if u32 then
							return
						end

						local n1: number = 0

						u32 = true
						unpackScreenUnpack.Reminder.Visible = false
						unpackScreenSkip.Visible = false
						audioService.PlaySound("UI-MouseOver Pop HD")

						local clone2Top = clone2.Top
						local v189 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

						clone2Top:TweenPosition(v189, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.7)

						for _, v in pairs(t2) do
							if v ~= clone2 then
								task.wait(0.05)

								local vPosition = v.Position
								local v193 = UDim2.fromScale(0, 1)

								v:TweenPosition(vPosition + v193, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.5)
							end
						end

						task.wait(0.7)

						for i2 = 1, p27 do
							task.spawn(function()
								local clone3 = unpackScreenTemplates.Skeleton:Clone()
								local u198: boolean = false
								local uDim2FromOffset = UDim2.fromOffset
								local unpackScreenUnpackCardSkeleton = unpackScreenUnpack.CardSkeleton
								local text: string = tostring(i2)
								local x = unpackScreenUnpackCardSkeleton[text].AbsolutePosition.X
								local cardSkeleton = unpackScreenUnpack.CardSkeleton
								local text2: string = tostring(i2)
								local uDim2 = uDim2FromOffset(x, cardSkeleton[text2].AbsolutePosition.Y)
								local v206 = t7[(i - 1) * p27 + i2]
								local v207 = p25[v206]
								local foil = cardLibrary[v206].Foil

								if foil then
									networkClient.Preload({ "rbxassetid://" .. cardLibrary[v206].Id, "rbxassetid://5661901654" })
									ApplyFoilStroke(clone3)
								elseif v207 then
									ApplyNewStroke(clone3)
								end

								clone3.Parent = unpackScreen.Cards
								clone3.Size = UDim2.fromOffset(clone2.AbsoluteSize.X, clone2.AbsoluteSize.Y)
								clone3.Position = UDim2.fromOffset(clone2.AbsolutePosition.X, clone2.AbsolutePosition.Y)
								clone3.Image = "rbxassetid://" .. data.CurrentSleeveId()
								clone3.Visible = true
								audioService.PlaySound("Swoosh")

								local clone3Position = clone3.Position
								local v210 = UDim2.fromOffset(0, -unpackScreen.AbsoluteSize.Y)

								clone3:TweenPosition(clone3Position + v210, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
								task.wait(0.7)

								local v211 = UDim2.fromOffset
								local v212 = unpackScreenUnpack.CardSkeleton
								local text3: string = tostring(i2)
								local v214 = v212[text3].AbsoluteSize.X
								local v215 = unpackScreenUnpack.CardSkeleton
								local text4: string = tostring(i2)
								local v217 = v211(v214, v215[text4].AbsoluteSize.Y)

								clone3:TweenSizeAndPosition(v217, uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.4)
								wait(0.4)
								clone3.Position = uDim2

								local v218 = cardLibrary[v206]
								local t22: {[any]: any} = {
									LibraryIndex = v206,
									Name = v218.Name,
									Id = v218.Id,
									Color = v218.Color,
									Rarity = v218.Rarity
								}

								clone3.MouseEnter:Connect(function()
									if u198 then
										return
									end

									u198 = true

									local v220 = UDim2.fromOffset(clone3.AbsoluteSize.X, clone3.AbsoluteSize.Y)
									local v221 = UDim2.fromOffset(0, v220.Y.Offset)
									local v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)

									clone3:TweenSizeAndPosition(v221, uDim2 + v222, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.25)
									task.wait(0.3)
									audioService.PlaySound("Draw")

									if clone3:FindFirstChild("UIStroke") then
										clone3.UIStroke:Destroy()
									end

									clone3.Image = "rbxassetid://" .. v218.Id

									if v207 then
										NewThing(clone3)
									end

									if foil then
										foilEffect(clone3, v206)
										effects.Foil(visGui.Effect, clone3)
										UnpackExplosion(clone3, unpack(t13.Foil))
									end

									if t13[t22.Rarity] then
										UnpackExplosion(clone3, unpack(t13[t22.Rarity]))
									end

									if t12[t22.Rarity] then
										audioService.PlaySound(t12[t22.Rarity])
									end

									nonGameCard.BindInspect(clone3, v218)
									v221 = UDim2.fromOffset(v220.X.Offset, v220.Y.Offset)
									v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)
									clone3:TweenSizeAndPosition(v221, uDim2 - v222, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
									task.wait(0.25)
									clone3.Position = uDim2
									n1 += 1

									if n1 == p27 then
										local unpackScreenClosePosition = unpackScreenClose.Position
										local v224 = unpackScreenClose
										local v225 = v224.Position
										local v226 = UDim2.fromScale(0, 1)

										v224.Position = v225 + v226
										unpackScreenClose.Visible = true
										unpackScreenClose:TweenPosition(unpackScreenClosePosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
									end
								end)
							end)
							task.wait(0.1)
						end

						local clone2Position = clone2.Position
						local v196 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

						clone2:TweenPosition(clone2Position + v196, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
						task.wait(0.5)
						clone2:Destroy()
						t2[i] = nil
					end)
					task.wait(0.05)
				end
			end

			u148 = false

			local v163

			if true then
				audioService.PlaySound("incoming foil")
				ApplyFoilStroke(clone2)
			else
				for k = (i - 1) * p27 + 1, (i - 1) * p27 + p27 do
					if p25[t7[k]] then
						if true then
							ApplyNewStroke(clone2)
						end

						clone2.Top.ImageTransparency = 0
						clone2.Bottom.ImageTransparency = 0
						audioService.PlaySound("Draw")
						v162 = UDim2.fromOffset(t1[i].AbsoluteSize.X, t1[i].AbsoluteSize.Y)
						v163 = UDim2.fromOffset(t1[i].AbsolutePosition.X, t1[i].AbsolutePosition.Y)
						clone2:TweenSizeAndPosition(v162, v163, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
						t2[i] = clone2
						clone2.ZIndex = clone2.ZIndex + 1
						clone2.MouseButton1Click:Connect(function()
							if u32 then
								return
							end

							local n1: number = 0

							u32 = true
							unpackScreenUnpack.Reminder.Visible = false
							unpackScreenSkip.Visible = false
							audioService.PlaySound("UI-MouseOver Pop HD")

							local clone2Top = clone2.Top
							local v189 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

							clone2Top:TweenPosition(v189, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.7)

							for _, v in pairs(t2) do
								if v ~= clone2 then
									task.wait(0.05)

									local vPosition = v.Position
									local v193 = UDim2.fromScale(0, 1)

									v:TweenPosition(vPosition + v193, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.5)
								end
							end

							task.wait(0.7)

							for i2 = 1, p27 do
								task.spawn(function()
									local clone3 = unpackScreenTemplates.Skeleton:Clone()
									local u198: boolean = false
									local uDim2FromOffset = UDim2.fromOffset
									local unpackScreenUnpackCardSkeleton = unpackScreenUnpack.CardSkeleton
									local text: string = tostring(i2)
									local x = unpackScreenUnpackCardSkeleton[text].AbsolutePosition.X
									local cardSkeleton = unpackScreenUnpack.CardSkeleton
									local text2: string = tostring(i2)
									local uDim2 = uDim2FromOffset(x, cardSkeleton[text2].AbsolutePosition.Y)
									local v206 = t7[(i - 1) * p27 + i2]
									local v207 = p25[v206]
									local foil = cardLibrary[v206].Foil

									if foil then
										networkClient.Preload({ "rbxassetid://" .. cardLibrary[v206].Id, "rbxassetid://5661901654" })
										ApplyFoilStroke(clone3)
									elseif v207 then
										ApplyNewStroke(clone3)
									end

									clone3.Parent = unpackScreen.Cards
									clone3.Size = UDim2.fromOffset(clone2.AbsoluteSize.X, clone2.AbsoluteSize.Y)
									clone3.Position = UDim2.fromOffset(clone2.AbsolutePosition.X, clone2.AbsolutePosition.Y)
									clone3.Image = "rbxassetid://" .. data.CurrentSleeveId()
									clone3.Visible = true
									audioService.PlaySound("Swoosh")

									local clone3Position = clone3.Position
									local v210 = UDim2.fromOffset(0, -unpackScreen.AbsoluteSize.Y)

									clone3:TweenPosition(clone3Position + v210, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
									task.wait(0.7)

									local v211 = UDim2.fromOffset
									local v212 = unpackScreenUnpack.CardSkeleton
									local text3: string = tostring(i2)
									local v214 = v212[text3].AbsoluteSize.X
									local v215 = unpackScreenUnpack.CardSkeleton
									local text4: string = tostring(i2)
									local v217 = v211(v214, v215[text4].AbsoluteSize.Y)

									clone3:TweenSizeAndPosition(v217, uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.4)
									wait(0.4)
									clone3.Position = uDim2

									local v218 = cardLibrary[v206]
									local t22: {[any]: any} = {
										LibraryIndex = v206,
										Name = v218.Name,
										Id = v218.Id,
										Color = v218.Color,
										Rarity = v218.Rarity
									}

									clone3.MouseEnter:Connect(function()
										if u198 then
											return
										end

										u198 = true

										local v220 = UDim2.fromOffset(clone3.AbsoluteSize.X, clone3.AbsoluteSize.Y)
										local v221 = UDim2.fromOffset(0, v220.Y.Offset)
										local v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)

										clone3:TweenSizeAndPosition(v221, uDim2 + v222, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.25)
										task.wait(0.3)
										audioService.PlaySound("Draw")

										if clone3:FindFirstChild("UIStroke") then
											clone3.UIStroke:Destroy()
										end

										clone3.Image = "rbxassetid://" .. v218.Id

										if v207 then
											NewThing(clone3)
										end

										if foil then
											foilEffect(clone3, v206)
											effects.Foil(visGui.Effect, clone3)
											UnpackExplosion(clone3, unpack(t13.Foil))
										end

										if t13[t22.Rarity] then
											UnpackExplosion(clone3, unpack(t13[t22.Rarity]))
										end

										if t12[t22.Rarity] then
											audioService.PlaySound(t12[t22.Rarity])
										end

										nonGameCard.BindInspect(clone3, v218)
										v221 = UDim2.fromOffset(v220.X.Offset, v220.Y.Offset)
										v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)
										clone3:TweenSizeAndPosition(v221, uDim2 - v222, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
										task.wait(0.25)
										clone3.Position = uDim2
										n1 += 1

										if n1 == p27 then
											local unpackScreenClosePosition = unpackScreenClose.Position
											local v224 = unpackScreenClose
											local v225 = v224.Position
											local v226 = UDim2.fromScale(0, 1)

											v224.Position = v225 + v226
											unpackScreenClose.Visible = true
											unpackScreenClose:TweenPosition(unpackScreenClosePosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
										end
									end)
								end)
								task.wait(0.1)
							end

							local clone2Position = clone2.Position
							local v196 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

							clone2:TweenPosition(clone2Position + v196, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
							task.wait(0.5)
							clone2:Destroy()
							t2[i] = nil
						end)
						task.wait(0.05)
					end
				end

				u149 = false
			end

			do
				clone2.Top.ImageTransparency = 0
				clone2.Bottom.ImageTransparency = 0
				audioService.PlaySound("Draw")

				local v162 = UDim2.fromOffset(t1[i].AbsoluteSize.X, t1[i].AbsoluteSize.Y)
				local v163 = UDim2.fromOffset(t1[i].AbsolutePosition.X, t1[i].AbsolutePosition.Y)

				clone2:TweenSizeAndPosition(v162, v163, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
				t2[i] = clone2
				clone2.ZIndex = clone2.ZIndex + 1
				clone2.MouseButton1Click:Connect(function()
					if u32 then
						return
					end

					local n1: number = 0

					u32 = true
					unpackScreenUnpack.Reminder.Visible = false
					unpackScreenSkip.Visible = false
					audioService.PlaySound("UI-MouseOver Pop HD")

					local clone2Top = clone2.Top
					local v189 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

					clone2Top:TweenPosition(v189, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.7)

					for _, v in pairs(t2) do
						if v ~= clone2 then
							task.wait(0.05)

							local vPosition = v.Position
							local v193 = UDim2.fromScale(0, 1)

							v:TweenPosition(vPosition + v193, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.5)
						end
					end

					task.wait(0.7)

					for i2 = 1, p27 do
						task.spawn(function()
							local clone3 = unpackScreenTemplates.Skeleton:Clone()
							local u198: boolean = false
							local uDim2FromOffset = UDim2.fromOffset
							local unpackScreenUnpackCardSkeleton = unpackScreenUnpack.CardSkeleton
							local text: string = tostring(i2)
							local x = unpackScreenUnpackCardSkeleton[text].AbsolutePosition.X
							local cardSkeleton = unpackScreenUnpack.CardSkeleton
							local text2: string = tostring(i2)
							local uDim2 = uDim2FromOffset(x, cardSkeleton[text2].AbsolutePosition.Y)
							local v206 = t7[(i - 1) * p27 + i2]
							local v207 = p25[v206]
							local foil = cardLibrary[v206].Foil

							if foil then
								networkClient.Preload({ "rbxassetid://" .. cardLibrary[v206].Id, "rbxassetid://5661901654" })
								ApplyFoilStroke(clone3)
							elseif v207 then
								ApplyNewStroke(clone3)
							end

							clone3.Parent = unpackScreen.Cards
							clone3.Size = UDim2.fromOffset(clone2.AbsoluteSize.X, clone2.AbsoluteSize.Y)
							clone3.Position = UDim2.fromOffset(clone2.AbsolutePosition.X, clone2.AbsolutePosition.Y)
							clone3.Image = "rbxassetid://" .. data.CurrentSleeveId()
							clone3.Visible = true
							audioService.PlaySound("Swoosh")

							local clone3Position = clone3.Position
							local v210 = UDim2.fromOffset(0, -unpackScreen.AbsoluteSize.Y)

							clone3:TweenPosition(clone3Position + v210, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
							task.wait(0.7)

							local v211 = UDim2.fromOffset
							local v212 = unpackScreenUnpack.CardSkeleton
							local text3: string = tostring(i2)
							local v214 = v212[text3].AbsoluteSize.X
							local v215 = unpackScreenUnpack.CardSkeleton
							local text4: string = tostring(i2)
							local v217 = v211(v214, v215[text4].AbsoluteSize.Y)

							clone3:TweenSizeAndPosition(v217, uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.4)
							wait(0.4)
							clone3.Position = uDim2

							local v218 = cardLibrary[v206]
							local t22: {[any]: any} = {
								LibraryIndex = v206,
								Name = v218.Name,
								Id = v218.Id,
								Color = v218.Color,
								Rarity = v218.Rarity
							}

							clone3.MouseEnter:Connect(function()
								if u198 then
									return
								end

								u198 = true

								local v220 = UDim2.fromOffset(clone3.AbsoluteSize.X, clone3.AbsoluteSize.Y)
								local v221 = UDim2.fromOffset(0, v220.Y.Offset)
								local v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)

								clone3:TweenSizeAndPosition(v221, uDim2 + v222, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.25)
								task.wait(0.3)
								audioService.PlaySound("Draw")

								if clone3:FindFirstChild("UIStroke") then
									clone3.UIStroke:Destroy()
								end

								clone3.Image = "rbxassetid://" .. v218.Id

								if v207 then
									NewThing(clone3)
								end

								if foil then
									foilEffect(clone3, v206)
									effects.Foil(visGui.Effect, clone3)
									UnpackExplosion(clone3, unpack(t13.Foil))
								end

								if t13[t22.Rarity] then
									UnpackExplosion(clone3, unpack(t13[t22.Rarity]))
								end

								if t12[t22.Rarity] then
									audioService.PlaySound(t12[t22.Rarity])
								end

								nonGameCard.BindInspect(clone3, v218)
								v221 = UDim2.fromOffset(v220.X.Offset, v220.Y.Offset)
								v222 = UDim2.fromOffset(clone3.AbsoluteSize.X / 2, 0)
								clone3:TweenSizeAndPosition(v221, uDim2 - v222, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
								task.wait(0.25)
								clone3.Position = uDim2
								n1 += 1

								if n1 == p27 then
									local unpackScreenClosePosition = unpackScreenClose.Position
									local v224 = unpackScreenClose
									local v225 = v224.Position
									local v226 = UDim2.fromScale(0, 1)

									v224.Position = v225 + v226
									unpackScreenClose.Visible = true
									unpackScreenClose:TweenPosition(unpackScreenClosePosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
								end
							end)
						end)
						task.wait(0.1)
					end

					local clone2Position = clone2.Position
					local v196 = UDim2.fromOffset(0, unpackScreen.AbsoluteSize.Y)

					clone2:TweenPosition(clone2Position + v196, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
					task.wait(0.5)
					clone2:Destroy()
					t2[i] = nil
				end)
				task.wait(0.05)
			end
		end

		unpackScreenSkip.Visible = true

		local unpackScreenSkipPosition = unpackScreenSkip.Position
		local v167 = unpackScreenSkip
		local v168 = v167.Position
		local v169 = UDim2.fromScale(0, 1)

		v167.Position = v168 + v169
		unpackScreenSkip:TweenPosition(unpackScreenSkipPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
	end
}
