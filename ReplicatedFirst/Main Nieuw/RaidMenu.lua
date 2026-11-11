



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")

local runService: RunService = game:GetService("RunService")

require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkClient = network.client
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
local maid = require(game.ReplicatedStorage.Maid)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local nonGameCard = require(script.Parent.NonGameCard)
local sleeves = require(script.Parent.Sleeves).sleeves
local packs = require(game.ReplicatedStorage.Packs)
local config = require(game.ReplicatedStorage.CONFIG)
local contextualize = require(script.Parent.Contextualize)
local robuxService = require(script.Parent.RobuxService)

require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local raidMenu = LocalPlayer.PlayerGui:WaitForChild("RaidMenu")
local window = raidMenu:WaitForChild("Window")
local templates = window.Parent.Templates
local templatesTemplateReward = templates.TemplateReward
local rewardsHolder = window.SelectedInfo.Rewards.RewardsHolder
local raidRewardsMenu = LocalPlayer.PlayerGui:WaitForChild("RaidRewardsMenu")
local raidRewardsMenuWindow = raidRewardsMenu:WaitForChild("Window")
local raidRewardsMenuWindowRewards = raidRewardsMenuWindow.Rewards
local v29 = maid.new()
local u30 = nil
local u31: boolean = false
local u32 = nil
local u33 = nil
local u34 = nil
local raids = require(replicatedStorage.Raids)

local function FormatChance(p1)
	return (string.format("%.3f", p1):gsub("%.?0+$", ""))
end
local function AddReward(p2, list, parent, p5)
	print(p2)

	if p2 == "Cards" then
		local u48: boolean = false
		local n1: number = 0

		for _, _ in pairs(list) do
			n1 += 1
		end

		if n1 >= 40 then
			u48 = true
		end

		if n1 >= 150 then
			local clone = templatesTemplateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = "Over 150 different cards (we cannot show due to lag lol)"
			clone.Misc.Image = "rbxassetid://9483752842"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			return
		end

		for k, v in pairs(list) do
			local v55 = cardLibrary[k]

			if not v55 then
				warn(k .. " Is not a valid card index")
			end

			local clone = templatesTemplateReward:Clone()
			local foil = v55.Foil

			clone.Parent = parent
			clone.Amount.Text = v .. "x"
			clone.Label.Text = v55.Name

			if v > 1 then
				for _, iterValue in pairs(clone.MultipleReward:GetChildren()) do
					if foil and not u48 then
						foilEffect(iterValue, v55.LibraryIndex)
					end

					iterValue.Image = "rbxassetid://" .. v55.Id
				end

				clone.MultipleReward.Visible = true
			else
				if foil and not u48 then
					foilEffect(clone.CardReward, v55.LibraryIndex)
				end

				clone.CardReward.Image = "rbxassetid://" .. v55.Id
				clone.CardReward.Visible = true
			end

			if p5 and u32.Stages[u30] and u32.Stages[u30].RewardRates and u32.Stages[u30].RewardRates[k] then
				local cloneDropRate = clone.DropRate
				local replacedText = string.format("%.3f", u32.Stages[u30].RewardRates[k] * 100):gsub("%.?0+$", "")

				cloneDropRate.Text = tostring(replacedText) .. "%"
			end

			nonGameCard.BindInspect(clone, v55)
			clone.Visible = true
			v29:GiveTask(clone)
		end
	elseif p2 == "Preconstructed" then
		local clone = templatesTemplateReward:Clone()

		clone.Parent = parent
		clone.Amount.Text = ""
		clone.Label.Text = "Preconstructed Deck: " .. list
		clone.Misc.Image = "rbxassetid://14598050755"
		clone.Misc.Size = UDim2.fromScale(0.505, 0.855)
		clone.Misc.Position = UDim2.fromScale(0.2, 0)
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p2 == "Sleeves" then
		for _, v in pairs(list) do
			print(v)

			local clone = templatesTemplateReward:Clone()

			print(sleeves[v])
			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = "Sleeve"
			clone.CardReward.Image = "rbxassetid://" .. sleeves[v][1]
			clone.CardReward.Visible = true
			clone.Visible = true

			if p5 and u32.Stages[u30] and u32.Stages[u30].RewardRates and u32.Stages[u30].RewardRates[v] then
				local dropRate = clone.DropRate
				local replacedText = string.format("%.3f", u32.Stages[u30].RewardRates[v] * 100):gsub("%.?0+$", "")

				dropRate.Text = tostring(replacedText) .. "%"
			end
		end
	elseif p2 == "Packs" then
		for k, v in pairs(list) do
			local u70: boolean = false
			local v71 = nil

			for _, iterValue2 in pairs(packs) do
				local parts = string.split(k, "-Foil")

				if k == iterValue2.Name then
					v71 = iterValue2
				end

				if iterValue2.Name == parts[1] and string.find(k, "-Foil") then
					v71 = iterValue2
					u70 = true
				end
			end

			if v71 then
				local clone = templatesTemplateReward:Clone()

				clone.Parent = parent
				clone.Amount.Text = v .. "x"

				if u70 then
					clone.Label.Text = string.split(v71.Name, "-Foil")[1] .. " ★ (" .. v .. ")"
				else
					clone.Label.Text = v71.Name .. " (" .. v .. ")"
				end

				clone.TicketImage.Visible = true

				if u70 then
					foilEffect(clone.TicketImage)
				end

				if v > 1 then
					for _, iterValue3 in pairs(clone.MultipleReward:GetChildren()) do
						iterValue3.Image = "rbxassetid://" .. v71.CardPackId

						if u70 then
							foilEffect(iterValue3)
						end
					end

					clone.MultipleReward.Visible = true
				else
					clone.CardReward.Image = "rbxassetid://" .. v71.CardPackId
					clone.CardReward.Visible = true

					if u70 then
						foilEffect(clone.CardReward)
					end
				end

				if p5 and u32.Stages[u30] and u32.Stages[u30].RewardRates and u32.Stages[u30].RewardRates[k] then
					local v78 = clone.DropRate
					local replacedText = string.format("%.3f", u32.Stages[u30].RewardRates[k] * 100):gsub("%.?0+$", "")

					v78.Text = tostring(replacedText) .. "%"
				end

				clone.Visible = true
				v29:GiveTask(clone)
			end
		end
	elseif p2 == "BloxBux" and list ~= 0 then
		local clone = templatesTemplateReward:Clone()

		clone.Parent = parent
		clone.Amount.Text = ""
		clone.Label.Text = list .. " BB"
		clone.Misc.Image = "rbxassetid://475466844"
		clone.Misc.Rotation = -3
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p2 == "Ranks" then
		for _, v in pairs(list) do
			local clone = templatesTemplateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = v
			clone.Misc.Image = "rbxassetid://9483401524"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			if p5 and u32.Stages[u30] and u32.Stages[u30].RewardRates and u32.Stages[u30].RewardRates[v] then
				local v84 = clone.DropRate
				local replacedText = string.format("%.3f", u32.Stages[u30].RewardRates[v] * 100):gsub("%.?0+$", "")

				v84.Text = tostring(replacedText) .. "%"
			end
		end
	elseif p2 == "Charms" then
		if list[1] > 0 then
			local clone = templatesTemplateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = list[1] .. "x Rabbit Charms"
			clone.Misc.Image = "rbxassetid://9546583984"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true
		end

		if list[2] > 0 then
			local clone = templatesTemplateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = list[2] .. "x Clover"
			clone.Misc.Image = "rbxassetid://9546584078"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			return
		end
	else
		if p2 == "EventCurrency" or p2 == "Currency" then
			for k, v in pairs(list) do
				local clone = templatesTemplateReward:Clone()

				clone.Parent = parent

				if parent == rewardsHolder then
					local cloneAmount = clone.Amount
					local rounded = math.round(v * 1.5)

					cloneAmount.Text = v .. "-" .. rounded
				else
					clone.Amount.Text = v
				end

				clone.Label.Text = k
				clone.Misc.Image = "rbxassetid://" .. config.EVENTCURRENCYIMAGE[k]
				clone.Misc.MouseEnter:connect(function()
					contextualize(clone.Misc, config.EVENTCURRENCYCONTEXT[k])
				end)
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true
			end

			return
		end

		if p2 == "BattleBackground" then
			for _, v in pairs(list) do
				local clone = templatesTemplateReward:Clone()

				clone.Parent = parent
				clone.Amount.Text = ""
				clone.Label.Text = v
				clone.Misc.Image = "rbxassetid://82724795023332"
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true

				if p5 and u32.Stages[u30] and u32.Stages[u30].RewardRates and u32.Stages[u30].RewardRates[v] then
					local v96 = clone.DropRate
					local replacedText = string.format("%.3f", u32.Stages[u30].RewardRates[v] * 100):gsub("%.?0+$", "")

					v96.Text = tostring(replacedText) .. "%"
				end
			end
		end
	end
end
local function SelectStage(p6)
	print("Selected stage " .. p6)

	if not u32.Stages[p6] then
		warn("Stage " .. p6 .. " Does not exist for Raid " .. u32.Name)

		return
	end

	u30 = p6
	window.Start.Visible = true

	local rewards = u32.Stages[u30].Rewards

	for _, v in pairs(rewardsHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(rewards) do
		AddReward(k, v, rewardsHolder, true)
	end
end
local function SetupRaidMenu(p7)
	if not raids[p7] then
		warn("No raid found with RaidIndex " .. p7)

		return
	end

	u32 = raids[p7]

	for _, v in pairs(window.DifficultySelect:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	window.RaidTitle.Text = u32.Name
	window.SelectedInfo.MainInfo.Description.Text = u32.Description
	u33 = p7
	u34 = nil

	for k, v in pairs(u32.Stages) do
		local clone = templates.TemplateDifficultyButton:Clone()

		clone.Name = k
		clone.Parent = window.DifficultySelect
		clone.Text = k

		if v.ButtonColor then
			clone.BackgroundColor3 = v.ButtonColor
		end

		clone.MouseButton1Click:Connect(function()
			if u31 then
				return
			end

			u31 = true
			audioService.PlaySound("click1")
			SelectStage(clone.Name)
			task.wait(1)
			u31 = false
		end)
		clone.Visible = true
	end
end
local function OpenRaidMenu(p8)
	if not handy.Visible then
		return
	end

	audioService.PlaySound("click1")
	task.spawn(handy.Hide)
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	SetupRaidMenu(p8)
	raidMenu.Enabled = true
	window.Visible = true
	transition.ToggleBlack(-1, 0.3)
end
local function SetupRewardMenu(p9)
	for _, v in pairs(raidRewardsMenuWindowRewards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(p9) do
		AddReward(k, v, raidRewardsMenuWindowRewards)
	end
end
function networkClient.OpenRewardsMenu(p10, p11)
	print("Got To RewardsOpen Function")
	transition.ShowBattleBack()
	SetupRewardMenu(p10)

	if p11 then
		raidRewardsMenuWindow.RaidTitle.Text = "Raid Failed..."
	else
		raidRewardsMenuWindow.RaidTitle.Text = "Raid Completed!"
	end

	raidRewardsMenu.Enabled = true
	raidRewardsMenuWindow.Visible = true
	transition.ToggleBlack(-1, 0.3)
end

window.Exit.MouseButton1Click:Connect(function()
	if raidMenu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	raidMenu.Enabled = false
	window.Visible = false

	for _, v in pairs(rewardsHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	u30 = nil
	window.Start.Visible = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
end)
raidRewardsMenuWindow.Return.MouseButton1Click:Connect(function()
	if raidRewardsMenu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	raidRewardsMenu.Enabled = false
	raidRewardsMenuWindow.Visible = false

	for _, v in pairs(raidRewardsMenuWindowRewards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	u30 = nil

	if u33 == nil or networkClient.IsSubPlayer() then
		window.Start.Visible = false
		transition.HideBattleBack()
		transition.ToggleBlack(-1, 0.3)
		audioService.ChangeSong("Lobby")
		handy.Show()
		networkClient.SetControlsEnabled(true)
	else
		if not u34 then
			OpenRaidMenu(u33)

			return
		end

		if u34 == "Doomspire" then
			networkClient.OpenDSRaidFromRewardsMenu(u33)

			return
		end
	end
end)
window.Start.MouseButton1Click:Connect(function()
	if not window.Start.Visible == true then
		return
	end

	if not u32 or not u32.Stages[u30] then
		return
	end

	audioService.PlaySound("click1")

	local name = u32.Name
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Parent = true,
		QuickIntro = true,
		Name = name,
		userId = -999999 - text,
		Duelist = u32.Stages[u30].Duelist,
		RaidBattle = u32.Stages[u30]
	})
	raidMenu.Enabled = false
	window.Visible = false

	for _, v in pairs(rewardsHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	u30 = nil
	window.Start.Visible = false
	transition.HideBattleBack()
end)
window.BoosterFrame.OpenBuy.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	window.BuyBoosts.Visible = true
end)
window.BuyBoosts.Exit.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	window.BuyBoosts.Visible = false
end)
spawn(function()
	repeat
		task.wait(0.2)
	until robuxService.Products.Ready == true

	for _, v in pairs(window.BuyBoosts.BoostTypes.BoostHolder:GetChildren()) do
		if v:IsA("ImageLabel") then
			local numberValue: number? = tonumber(v.Name)
			local v129 = robuxService.Products.RaidBoost.Ids[numberValue]

			if v129 then
				local infos = robuxService.Products.RaidBoost.Infos
				local text: string = tostring(v129)
				local v132 = infos[text]

				v.BuyButton.Text = v132.VendorString
				v.Description.Text = v132.Duration .. " hr"
				v.BuyButton.MouseButton1Click:connect(function()
					if not network.InvokeServer("CanUseArtBox") then
						networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

						return
					end

					game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, v129)
				end)
			end
		end
	end
end)

local function ConvertSecondsToStringDaysHoursMinutes(p14)
	local floored = math.floor(p14 / 3600)
	local floored2 = math.floor(p14 % 3600 / 60)
	local n1 = p14 % 60

	if floored < 10 then
		floored = "0" .. floored
	end

	if n1 < 10 then
		n1 = "0" .. n1
	end

	if floored2 < 10 then
		floored2 = "0" .. floored2
	end

	return floored .. ":" .. floored2 .. ":" .. n1
end

runService.RenderStepped:Connect(function()
	local v137 = data.GetRaidBoostTimer()

	if v137 and v137 >= os.time() then
		local timer = window.BoosterFrame.Timer
		local timestamp = os.time()
		local n1 = v137 - timestamp
		local floored = math.floor(n1 / 3600)
		local floored3 = math.floor(n1 % 3600 / 60)
		local n2 = n1 % 60

		if floored < 10 then
			floored = "0" .. floored
		end

		if n2 < 10 then
			n2 = "0" .. n2
		end

		if floored3 < 10 then
			floored3 = "0" .. floored3
		end

		timer.Text = floored .. ":" .. floored3 .. ":" .. n2

		return
	end

	window.BoosterFrame.Timer.Text = "00:00:00"
end)

return {
	OpenRaidMenu = OpenRaidMenu,
	OpenRaidMenu = OpenRaidMenu,
	SetLastViewed = function(p12, p13)
		u33 = p12
		u34 = p13
	end
}
