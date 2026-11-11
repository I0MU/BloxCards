



require(script.Parent.Contextualize)

local transition = require(script.Parent.Transition)

require(game.ReplicatedStorage.FoilEffect)

local utils = require(game.ReplicatedStorage.Utils)
local handy = require(script.Parent.Handy)
local customScalings = require(script.Parent.CustomScalings)
local nonGameCard = require(script.Parent.NonGameCard)
local audioService = require(game.ReplicatedStorage.AudioService)
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

require(game.ReplicatedStorage.Animation)

local network = require(script.Parent.Network)
local updateCashMoney = require(script.Parent.Data).UpdateCashMoney
local config = require(game.ReplicatedStorage.CONFIG)
local copyTable = require(game.ReplicatedStorage.CopyTable)
local maid = require(game.ReplicatedStorage.Maid)
local utilsSetZIndex = utils.SetZIndex
local utilsLerp = utils.Lerp
local handyHandy = handy.handy
local customScalingsCustomscalings = customScalings.customscalings
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local configCardzindex = config.CARDZINDEX
local configCardsize = config.CARDSIZE
local configClr = config.CLR
local draftMenu = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui"):WaitForChild("DraftMenu")
local draftMenuBucketTemplate = draftMenu.BucketTemplate
local draftMenuCardWindow = draftMenu.CardWindow
local draftMenuCardWindowPosition = draftMenuCardWindow.Position

function RedrawHolder(p1, p2, p3, p4, p5, p6)
	local n1 = p1.AbsolutePosition - draftMenu.AbsolutePosition
	local n2 = p1.AbsoluteSize.X / (p4 * 1 + p3)
	local children = p2:GetChildren()
	local v43 = n1.X
	local y = n1.Y
	local n3 = n2 * (1 + p3)
	local n4 = n3 / configCardsize.x * configCardsize.y

	if p6 and #children > p4 * p6 then
		local rounded = math.round((#children - p4 * p6) / p6)

		p6 = p6 + rounded + 2
	end

	if type(p5) == "function" then
		local v48, v49, v50 = p5(p1, p2, p3, p4)

		n2 = v48
		n3 = v49
		n4 = v50
	elseif p5 == "FitY" then
		n4 = p1.AbsoluteSize.Y
		n3 = n4 / configCardsize.y * configCardsize.x
		p3 = n3 / (p1.AbsoluteSize.X / p4)
		n2 = n3 / (1 + p3)
	elseif p5 == "Center" then
		n4 = p1.AbsoluteSize.Y
		n3 = n4 / configCardsize.y * configCardsize.x
		v43 += (p1.AbsoluteSize.X - ((#children - 1) * n2 + n3)) / 2
	elseif p5 == "CenterX" then
		v43 += (p1.AbsoluteSize.X - ((#children - 1) * n2 + n3)) / 2
	end

	local uDim2 = UDim2.new(0, n3, 0, n4)

	n3 = 0

	local n5 = if p5 == "Top" then 0 else (p1.AbsoluteSize.Y - n4) / 2

	if p5 == "TopOrder" then
		n5 = 0
		table.sort(children, function(p7, p8)
			return p7.AbsolutePosition.X < p8.AbsolutePosition.X
		end)
	end

	if p5 == "Bottom" then
		n5 = p1.AbsoluteSize.Y - n4
	end

	if p5 == "Grid" then
		local n6: number = 0
		local n7 = p1.AbsoluteSize.Y / (p6 * 1 + p3)

		for _, v in pairs(children) do
			local uDim22 = UDim2.new(0, v43 + n3 * n2, 0, y + 0 + 0 + n6 * n7)

			v:TweenSizeAndPosition(uDim2, uDim22, "Out", "Quint", 0.25, true)
			n3 += 1

			if p4 == n3 then
				n3 = 0
				n6 += 1
			end
		end

		return
	end

	for _, v in pairs(children) do
		local uDim23 = UDim2.new(0, v43 + n3 * n2, 0, y + n5 + 0)

		v:TweenSizeAndPosition(uDim2, uDim23, "Out", "Quint", 0.25, true)
		n3 += 1
	end
end
local function draftDeckRedraw()
	RedrawHolder(draftMenu.DeckWindow, draftMenu.DraftDeck, 0.4, 5, "Grid", 8)
end
local function cullDeckRedraw()
	RedrawHolder(draftMenu.CullWindow, draftMenu.CullDeck, 0, 12, "Grid", 5)
end

customScalingsCustomscalings.DraftDeckRedraw = draftDeckRedraw
customScalingsCustomscalings.CullDeckRedraw = cullDeckRedraw
draftMenu.DraftDeck.ChildAdded:Connect(draftDeckRedraw)
draftMenu.DraftDeck.ChildRemoved:Connect(draftDeckRedraw)
draftMenu.CullDeck.ChildAdded:Connect(cullDeckRedraw)
draftMenu.CullDeck.ChildRemoved:Connect(cullDeckRedraw)

function networkClient.ShowDraftMenu()
	task.spawn(handy.Hide)
	wait(0.3333333333333333)
	draftMenu.Visible = true
	transition.ToggleBlur(1, 0.5)
	task.spawn(transition.ShowBattleBack)
end

draftMenu.Title.Back.MouseButton1Click:Connect(function()
	draftMenu.Visible = false
	transition.ToggleBlur(-1, 0.5)
	task.spawn(transition.HideBattleBack)
	wait(0.3333333333333333)
	task.spawn(handy.Show)
end)

local v29 = maid.new()

function networkClient.InitalizeBuckets(p9)
	local n1: number = 0

	draftMenu.CullWindow.Visible = false
	v29:DoCleaning()

	for k, v in pairs(p9) do
		print("test" .. k)

		local n2: number = #v
		local clone = draftMenuBucketTemplate:Clone()

		v29:GiveTask(clone)
		clone.Parent = draftMenuCardWindow
		clone.Position = UDim2.fromScale(n1 * 0.333, 0)
		clone.Container.TextLabel.Text = k

		local t1 = {}

		t1 = copyTable(v)

		for i = 1, 3 do
			local v69 = cardLibrary[t1[i]]

			if not v69 then
				warn(t1[i] .. " is not an actual card key")
				v69 = cardLibrary.handhacktest
			end

			clone.Container["Card" .. i].CardName.Text = v69.Name
			clone.Container["Card" .. i].CardImg.Image = "rbxassetid://" .. v69.Id

			local clone2 = draftMenu["Color Gradients"][v69.Color .. "Gradient"]:Clone()

			clone2.Parent = clone.Container["Card" .. i].Gradient
			nonGameCard.BindInspect(clone.Container["Card" .. i], v69)
		end

		v29:GiveTask(clone.Select.MouseButton1Click:connect(function()
			v29:DoCleaning()
			draftMenuCardWindow.Position = UDim2.fromScale(-1, 0.567)
			audioService.PlaySound("Target Or Select")
			networkFireServer("SelectDraftBucket", k)
		end))
		clone.Visible = true
		n1 += 1
	end

	draftMenuCardWindow.Position = UDim2.fromScale(-1, 0.567)
	draftMenuCardWindow.Visible = true
	draftMenuCardWindow:TweenPosition(draftMenuCardWindowPosition, "Out", "Quint", 1, true)
	audioService.PlaySound("Swoosh")
end
function networkClient.AddDraftDeckCards(p10)
	for _, v in pairs(p10) do
		local v74 = cardLibrary[v]
		local imageLabel: ImageLabel = Instance.new("ImageLabel")

		imageLabel.Size = UDim2.fromOffset(0, 0)
		imageLabel.Position = UDim2.fromScale(1, 1)
		imageLabel.BorderSizePixel = 0
		imageLabel.Image = "rbxassetid://" .. v74.Id
		imageLabel.BackgroundTransparency = 1
		imageLabel.ZIndex = 3
		imageLabel.Name = v
		imageLabel.Parent = draftMenu.DraftDeck
		nonGameCard.BindInspect(imageLabel, v74)
		audioService.PlaySound("Draw")
		wait(0.1)
	end
end

local draftMenuCullWindow = draftMenu.CullWindow
local draftMenuCullWindowPosition = draftMenuCullWindow.Position

local function AddCardToDeck(p11, p12)
	if not p12[p11] then
		p12[p11] = 1

		return
	end

	p12[p11] = p12[p11] + 1
end
local function RemoveCardFromDeck(p13, p14)
	if not p14[p13] then
		warn("attempt to remove noncard")

		return
	end

	p14[p13] = p14[p13] - 1

	if p14[p13] == 0 then
		p14[p13] = nil
	end
end
function networkClient.InitalizeCulling(p15)
	v29:DoCleaning()

	local t2: {[any]: any} = {}
	local n1: number = 0

	draftMenuCardWindow.Visible = false
	draftMenuCullWindow.Position = UDim2.fromScale(-1, 0.562)
	draftMenuCullWindow.Visible = true
	draftMenuCullWindow:TweenPosition(draftMenuCullWindowPosition, "Out", "Quint", 0.8, true)
	wait(0.8)

	for k, v in pairs(p15) do
		for _ = 1, v do
			local v86 = cardLibrary[k]
			local imageButton: ImageButton = Instance.new("ImageButton")

			imageButton.Size = UDim2.fromOffset(0, 0)
			imageButton.Position = UDim2.fromScale(1, 1)
			imageButton.BorderSizePixel = 0
			imageButton.Image = "rbxassetid://" .. v86.Id
			imageButton.BackgroundTransparency = 1
			imageButton.ZIndex = 3

			local boolValue: BoolValue = Instance.new("BoolValue")

			boolValue.Parent = imageButton
			v29:GiveTask(boolValue.Changed:Connect(function()
				if boolValue.Value then
					n1 += 1

					local v97 = k
					local v98: {[any]: any} = t2

					if not v98[v97] then
						v98[v97] = 1
					else
						v98[v97] = v98[v97] + 1
					end

					imageButton.ImageColor3 = Color3.fromRGB(33, 33, 33)
					audioService.PlaySound("Kerplunk.wav")
				else
					audioService.PlaySound("UI-MouseOver Pop HD")
					n1 -= 1

					local v99 = k
					local v100: {[any]: any} = t2

					if not v100[v99] then
						warn("attempt to remove noncard")
					else
						v100[v99] = v100[v99] - 1

						if v100[v99] == 0 then
							v100[v99] = nil
						end
					end

					imageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
				end

				if not next(t2) then
					draftMenuCullWindow.RemoveCards.Text = "Remove no cards"

					return
				end

				draftMenuCullWindow.RemoveCards.Text = "Remove selected cards"
			end))
			v29:GiveTask(imageButton.MouseButton1Click:Connect(function()
				if n1 >= 8 and not boolValue.Value then
					audioService.PlaySound("clickfast.wav")

					return
				end

				boolValue.Value = not boolValue.Value
			end))
			v29:GiveTask(imageButton)
			imageButton.Parent = draftMenu.CullDeck
			nonGameCard.BindInspect(imageButton, v86)
			audioService.PlaySound("Draw")
			wait(0.05)
		end
	end

	v29:GiveTask(draftMenuCullWindow.RemoveCards.MouseButton1Click:connect(function()
		networkFireServer("CullDraftCards", t2)
	end))
end
function networkClient.FinishDraftDeck(p16)
	v29:DoCleaning()
	draftMenuCullWindow.Visible = false

	local t3: {[any]: any} = {}

	for k, v in pairs(p16) do
		for _ = 1, v do
			local k = draftMenu.DraftDeck:FindFirstChild(k)

			if k then
				k:Destroy()
				audioService.PlaySound("Destroyed")
			end
		end
	end
end

return {}
