



local t1: {[any]: any} = {}
t1 = {}
local contextualize = require(script.Parent.Contextualize)

require(script.Parent.Transition)

local foilEffect = require(game.ReplicatedStorage.FoilEffect)
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
local animation = require(game.ReplicatedStorage.Animation)
local network = require(script.Parent.Network)
local updateCashMoney = require(script.Parent.Data).UpdateCashMoney
local config = require(game.ReplicatedStorage.CONFIG)

require(game.ReplicatedStorage.CopyTable)

local maid = require(game.ReplicatedStorage.Maid)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local packs = require(game.ReplicatedStorage.Packs)
local LocalPlayer = game.Players.LocalPlayer
local sleeves = require(script.Parent.Sleeves).sleeves
local rewards = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RewardsGui").Rewards
local rewardsRewardsHolder = rewards.RewardsHolder
local rewardsTemplate = rewards.Template
local v21 = maid.new()

local function AddReward(p1, list)
	if p1 == "Cards" then
		local u34: boolean = false
		local n1: number = 0

		for _, _ in pairs(list) do
			n1 += 1
		end

		if n1 >= 40 then
			u34 = true
		end

		if n1 >= 150 then
			local clone = rewardsTemplate:Clone()

			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = ""
			clone.Label.Text = "Over 150 different cards (we cannot show due to lag lol)"
			clone.Misc.Image = "rbxassetid://9483752842"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			return
		end

		for k, v in pairs(list) do
			local v41 = cardLibrary[k]

			if not v41 then
				warn(k .. " Is not a valid card index")
			end

			local clone = rewardsTemplate:Clone()
			local foil = v41.Foil

			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = v .. "x"
			clone.Label.Text = v41.Name

			if v > 1 then
				for _, iterValue in pairs(clone.MultipleReward:GetChildren()) do
					if foil and not u34 then
						foilEffect(iterValue, v41.LibraryIndex)
					end

					iterValue.Image = "rbxassetid://" .. v41.Id
				end

				clone.MultipleReward.Visible = true
			else
				if foil and not u34 then
					foilEffect(clone.CardReward, v41.LibraryIndex)
				end

				clone.CardReward.Image = "rbxassetid://" .. v41.Id
				clone.CardReward.Visible = true
			end

			nonGameCard.BindInspect(clone, v41)
			clone.Visible = true
			v21:GiveTask(clone)
		end
	elseif p1 == "Preconstructed" then
		local clone = rewardsTemplate:Clone()

		clone.Parent = rewardsRewardsHolder
		clone.Amount.Text = ""
		clone.Label.Text = "Preconstructed Deck: " .. list
		clone.Misc.Image = "rbxassetid://14598050755"
		clone.Misc.Size = UDim2.fromScale(0.505, 0.855)
		clone.Misc.Position = UDim2.fromScale(0.2, 0)
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p1 == "HiddenReward" then
		local clone = rewardsTemplate:Clone()

		clone.Parent = rewardsRewardsHolder
		clone.Amount.Text = ""
		clone.Label.Text = "Hidden Reward"
		clone.Misc.Image = "rbxassetid://15476451150"
		clone.Misc.Size = UDim2.fromScale(0.505, 0.855)
		clone.Misc.Position = UDim2.fromScale(0.2, 0)
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p1 == "Sleeves" then
		for _, v in pairs(list) do
			print(v)

			local clone = rewardsTemplate:Clone()

			print(sleeves[v])
			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = ""
			clone.Label.Text = "Sleeve"
			clone.CardReward.Image = "rbxassetid://" .. sleeves[v][1]
			clone.CardReward.Visible = true
			clone.Visible = true
		end
	elseif p1 == "Packs" then
		for k, v in pairs(list) do
			local u53: boolean = false
			local v54 = nil

			for _, iterValue2 in pairs(packs) do
				local parts = string.split(k, "-Foil")

				if k == iterValue2.Name then
					v54 = iterValue2
				end

				if iterValue2.Name == parts[1] and string.find(k, "-Foil") then
					v54 = iterValue2
					u53 = true
				end
			end

			if v54 then
				local clone = rewardsTemplate:Clone()

				clone.Parent = rewardsRewardsHolder
				clone.Amount.Text = v .. "x"

				if u53 then
					clone.Label.Text = string.split(v54.Name, "-Foil")[1] .. " ★ (" .. v .. ")"
				else
					clone.Label.Text = v54.Name .. " (" .. v .. ")"
				end

				clone.TicketImage.Visible = true

				if u53 then
					foilEffect(clone.TicketImage)
				end

				if v > 1 then
					for _, iterValue3 in pairs(clone.MultipleReward:GetChildren()) do
						iterValue3.Image = "rbxassetid://" .. v54.CardPackId

						if u53 then
							foilEffect(iterValue3)
						end
					end

					clone.MultipleReward.Visible = true
				else
					clone.CardReward.Image = "rbxassetid://" .. v54.CardPackId
					clone.CardReward.Visible = true

					if u53 then
						foilEffect(clone.CardReward)
					end
				end

				clone.Visible = true
				v21:GiveTask(clone)
			end
		end
	elseif p1 == "BloxBux" and list ~= 0 then
		local clone = rewardsTemplate:Clone()

		clone.Parent = rewardsRewardsHolder
		clone.Amount.Text = ""
		clone.Label.Text = list .. " BB"
		clone.Misc.Image = "rbxassetid://475466844"
		clone.Misc.Rotation = -3
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p1 == "Ranks" then
		for _, v in pairs(list) do
			local clone = rewardsTemplate:Clone()

			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = ""
			clone.Label.Text = v
			clone.Misc.Image = "rbxassetid://9483401524"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true
		end
	elseif p1 == "Charms" then
		if list[1] > 0 then
			local clone = rewardsTemplate:Clone()

			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = ""
			clone.Label.Text = list[1] .. "x Rabbit Charms"
			clone.Misc.Image = "rbxassetid://9546583984"
			clone.Misc.MouseEnter:connect(function()
				contextualize(clone.Misc, "Boosts the rate increase from battles and packs of getting your next foil from a pack!", nil, "RewardsGui")
			end)
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true
		end

		if list[2] > 0 then
			local clone = rewardsTemplate:Clone()

			clone.Parent = rewardsRewardsHolder
			clone.Amount.Text = ""
			clone.Label.Text = list[2] .. "x Clover"
			clone.Misc.Image = "rbxassetid://9546584078"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			return
		end
	else
		if p1 == "EventCurrency" or p1 == "Currency" then
			for k, v in pairs(list) do
				local clone = rewardsTemplate:Clone()

				clone.Parent = rewardsRewardsHolder
				clone.Amount.Text = v
				clone.Label.Text = k
				clone.Misc.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[k]
				clone.Misc.MouseEnter:connect(function()
					contextualize(clone.Misc, config.EVENTCURRENCYCONTEXT[k], nil, "RewardsGui")
				end)
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true
			end

			return
		end

		if p1 == "BattleBackground" then
			for _, v in pairs(list) do
				local clone = rewardsTemplate:Clone()

				clone.Parent = rewardsRewardsHolder
				clone.Amount.Text = ""
				clone.Label.Text = v
				clone.Misc.Image = "rbxassetid://82724795023332"
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true
			end
		end
	end
end

local rewardsRewardsHolderPosition = rewardsRewardsHolder.Position
local rewardsEnd = rewards.End
local rewardsEndPosition = rewardsEnd.Position
local rewardsShop = rewards.Shop
local rewardsDeckBuilder = rewards.DeckBuilder
local rewardsShopPosition = rewardsShop.Position
local rewardsDeckBuilderPosition = rewardsDeckBuilder.Position
local rewardsShine = rewards.Shine

local function FillHolder(p3, p4)
	for _, v in pairs(rewardsRewardsHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	local v77 = table.clone(p3)

	print(v77)
	print(p4)

	if v77.Preconstructed then
		if v77.PreconExcluded then
			print("Has Precon Excluded")

			for k, _ in pairs(v77.Cards) do
				if not table.find(v77.PreconExcluded, k) then
					v77.Cards[k] = nil
				end
			end

			print(v77.Cards)
		else
			v77.Cards = nil
		end
	end

	if v77.Hidden and p4 == true then
		table.clear(v77)
		v77.HiddenReward = true
	end

	for k, v in pairs(v77) do
		AddReward(k, v)
	end

	rewardsRewardsHolder.CanvasPosition = Vector2.new(0, 0)

	if #rewardsRewardsHolder:GetChildren() > 9 then
		rewardsRewardsHolder.BackgroundTransparency = 0.2
		rewardsRewardsHolder.ScrollBarImageTransparency = 0
		rewardsRewardsHolder.ScrollingEnabled = true
		rewardsRewardsHolder.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top

		return
	end

	rewardsRewardsHolder.BackgroundTransparency = 1
	rewardsRewardsHolder.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	rewardsRewardsHolder.ScrollBarImageTransparency = 1
	rewardsRewardsHolder.ScrollingEnabled = false
end
function networkClient.ShowRewards(p5, p6)
	rewardsRewardsHolder.Position = UDim2.fromScale(0.5, -0.5)
	rewardsEnd.Position = UDim2.fromScale(0.5, 1.5)
	rewardsShop.Position = UDim2.fromScale(0.5, 1.5)
	rewardsDeckBuilder.Position = UDim2.fromScale(0.5, 1.5)
	rewardsShine.ImageTransparency = 1
	rewards.BackgroundTransparency = 1
	rewards.RewardText.Visible = true
	rewards.RewardText.TextTransparency = 1
	FillHolder(p5)
	rewardsEnd.Visible = true

	if p5.Packs then
		local u84 = nil

		for k, _ in pairs(p5.Packs) do
			u84 = k
		end

		if u84 then
			v21:GiveTask(rewardsShop.MouseButton1Click:Connect(function()
				rewards.Visible = false
				networkClient.DisplayPack(u84)
				v21:DoCleaning()
			end))

			if p6 then
				rewardsShop.Visible = false
			else
				rewardsShop.Visible = true
			end
		else
			rewardsShop.Visible = false
		end
	else
		u84 = rewardsShop
		u84.Visible = false
	end

	rewards.Visible = true
	animation.Animate(rewards, { BackgroundTransparency = 0.2 }, 0.6, "Out", "Quart")
	audioService.PlaySound("victory.wav")
	animation.AnimateAsync(rewardsShine, { Rotation = 3600 }, 90, "Out", "Linear")
	animation.AnimateAsync(rewardsShine, { ImageTransparency = 0.3 }, 1.5, "Out", "Quart")
	animation.AnimateAsync(rewards.RewardText, { TextTransparency = 0 }, 1.5, "Out", "Quart")
	rewardsRewardsHolder:TweenPosition(rewardsRewardsHolderPosition, "Out", "Quart", 1)
	task.wait(1)
	audioService.PlaySound("Summon")
	rewardsEnd:TweenPosition(rewardsEndPosition, "Out", "Quart", 1)
	rewardsShop:TweenPosition(rewardsShopPosition, "Out", "Quart", 1)
	rewardsDeckBuilder:TweenPosition(rewardsDeckBuilderPosition, "Out", "Quart", 1)
	v21:GiveTask(rewardsEnd.MouseButton1Click:Connect(function()
		rewards.Visible = false
		v21:DoCleaning()
	end))
end
function networkClient.QuickShowRewards(p7)
	rewardsRewardsHolder.Position = UDim2.fromScale(0.5, -0.5)
	rewardsEnd.Position = UDim2.fromScale(0.5, 1.5)
	rewardsShop.Position = UDim2.fromScale(0.5, 1.5)
	rewardsDeckBuilder.Position = UDim2.fromScale(0.5, 1.5)
	rewardsShine.ImageTransparency = 1
	rewards.BackgroundTransparency = 1
	rewards.RewardText.Visible = false
	FillHolder(p7, true)
	rewards.Visible = true
	rewardsRewardsHolder.CanvasPosition = Vector2.new(0, 0)
	animation.AnimateAsync(rewards, { BackgroundTransparency = 0.5 }, 0.5, "Out", "Quart")
	audioService.PlaySound("Door_unlock")
	rewardsRewardsHolder:TweenPosition(rewardsRewardsHolderPosition, "Out", "Quart", 0.6)
	rewardsEnd.Visible = true
	rewardsEnd:TweenPosition(rewardsEndPosition, "Out", "Quart", 0.6)
	rewardsEnd.TextLabel.Text = "Close"
	v21:GiveTask(rewardsEnd.MouseButton1Click:Connect(function()
		rewardsEnd.Visible = false
		rewards.Visible = false
		v21:DoCleaning()
	end))
end

return rewards
