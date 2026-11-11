



local s1: string = "Menu"
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

require(replicatedStorage.CardLibrary)

local raids = require(replicatedStorage.Raids)
local raidMenu = require(script.Parent.RaidMenu)
local doomspireCutscenes = require(replicatedStorage.DoomspireRelated.DoomspireCutscenes)
local animation = require(replicatedStorage.Animation)

game:GetService("Chat")

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkClient = network.client

require(script.Parent.Contextualize)

local packs = require(replicatedStorage.Packs)
local dsa2StoryMenu = require(script.Parent.DSA2StoryMenu)
local cardLibrary = (function()
	local real = require(replicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()
local foilEffect = require(replicatedStorage.FoilEffect)
local config = require(replicatedStorage.CONFIG)
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local doomspireMenu = LocalPlayer.PlayerGui:WaitForChild("DoomspireMenu")
local menu = doomspireMenu:WaitForChild("Menu")
local raid = doomspireMenu:WaitForChild("Raid")
local rewardsHolder = raid.Info.Rewards.RewardsHolder
local stories = doomspireMenu:WaitForChild("Stories")
local templates = doomspireMenu:WaitForChild("Templates")
local templateReward = templates:WaitForChild("TemplateReward")
local spr = require(replicatedStorage.spr)

local function SetHoverOfObjects(p1, p2)
	for _, v in pairs(p1) do
		local vSize = v.Size

		v.MouseEnter:Connect(function()
			audioService.PlaySound(p2)
			spr.stop(v)

			local sprTarget = spr.target
			local v170 = UDim2.fromScale(vSize.X.Scale * 1.02, vSize.Y.Scale * 1.02)

			sprTarget(v, 0.5, 8, { Size = v170 })
		end)
		v.MouseLeave:Connect(function()
			spr.stop(v)
			spr.target(v, 0.5, 8, { Size = vSize })
		end)
	end
end

local children = menu.Buttons:GetChildren()

SetHoverOfObjects(children, "click_001")
SetHoverOfObjects({ menu.Story, doomspireMenu.Window.Exit, menu.Act2 }, "click_001")

local u32 = nil
local u33 = nil
local u34 = nil
local t1: {[any]: any} = {
	R = "DSRedRaid",
	B = "DSBlueRaid",
	G = "DSGreenRaid",
	Y = "DSYellowRaid"
}

local function UpdatePercent()
	networkClient.UpdateStatsData()

	local v62 = data.GetQuestStats()
	local n1: number = 0
	local n2 = 0

	for k, v in pairs(t1) do
		n1 += 3

		if v62["BOT_PLAYS_" .. v] > 0 or v62["BOT_PLAYS_" .. v .. "EX"] > 0 then
			stories.StoryFrame.StoryHolder["DS_" .. k .. "_1"].Visible = true

			local v67 = math.min(v62["BOT_WINS_" .. v] + v62["BOT_WINS_" .. v .. "EX"], 2)

			n2 += v67 + 1

			if v67 > 0 then
				for i = 1, v67 do
					if i == 1 then
						stories.StoryFrame.StoryHolder["DS_" .. k .. "_" .. i + 1].Visible = true
						stories.StoryFrame.StoryHolder["DS_" .. k .. "_" .. i + 2].Visible = true
					else
						stories.StoryFrame.StoryHolder["DS_" .. k .. "_" .. i + 2].Visible = true
						stories.StoryFrame.StoryHolder["DS_" .. k .. "_" .. i + 3].Visible = true
						stories.StoryFrame.StoryHolder["DS_" .. k .. "_" .. i + 4].Visible = true
					end
				end
			end
		end
	end

	menu.Percent.Text = math.round(n2 / n1 * 100) .. "%"

	if n2 / n1 == 1 then
		stories.StoryFrame.StoryHolder.DS_N_1.Visible = true
		network.FireServer("RedeemDoomspireStoryAct1")
	end
end
local function FormatChance(p3)
	return (string.format("%.3f", p3):gsub("%.?0+$", ""))
end
local function AddReward(p4, list, parent)
	print(p4)

	if p4 == "Cards" then
		local u73: boolean = false
		local n1: number = 0

		for _, _ in pairs(list) do
			n1 += 1
		end

		if n1 >= 40 then
			u73 = true
		end

		if n1 >= 150 then
			local clone = templateReward:Clone()

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
			local v80 = cardLibrary[k]

			if not v80 then
				warn(k .. " Is not a valid card index")
			end

			local clone = templateReward:Clone()
			local foil = v80.Foil

			clone.Parent = parent
			clone.Amount.Text = v .. "x"
			clone.Label.Text = v80.Name

			if v > 1 then
				for _, iterValue in pairs(clone.MultipleReward:GetChildren()) do
					if foil and not u73 then
						foilEffect(iterValue, v80.LibraryIndex)
					end

					iterValue.Image = "rbxassetid://" .. v80.Id
				end

				clone.MultipleReward.Visible = true
			else
				if foil and not u73 then
					foilEffect(clone.CardReward, v80.LibraryIndex)
				end

				clone.CardReward.Image = "rbxassetid://" .. v80.Id
				clone.CardReward.Visible = true
			end

			if u32.RewardRates and u32.RewardRates[k] then
				local cloneDropRate = clone.DropRate
				local replacedText = string.format("%.3f", u32.RewardRates[k] * 100):gsub("%.?0+$", "")

				cloneDropRate.Text = tostring(replacedText) .. "%"
			end

			clone.Visible = true
		end
	elseif p4 == "Preconstructed" then
		local clone = templateReward:Clone()

		clone.Parent = parent
		clone.Amount.Text = ""
		clone.Label.Text = "Preconstructed Deck: " .. list
		clone.Misc.Image = "rbxassetid://14598050755"
		clone.Misc.Size = UDim2.fromScale(0.505, 0.855)
		clone.Misc.Position = UDim2.fromScale(0.2, 0)
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p4 == "Sleeves" then
	elseif p4 == "Packs" then
		for k, v in pairs(list) do
			local u90: boolean = false
			local v91 = nil

			for _, iterValue2 in pairs(packs) do
				local parts = string.split(k, "-Foil")

				if k == iterValue2.Name then
					v91 = iterValue2
				end

				if iterValue2.Name == parts[1] and string.find(k, "-Foil") then
					v91 = iterValue2
					u90 = true
				end
			end

			if v91 then
				local clone = templateReward:Clone()

				clone.Parent = parent
				clone.Amount.Text = v .. "x"

				if u90 then
					clone.Label.Text = string.split(v91.Name, "-Foil")[1] .. " ★ (" .. v .. ")"
				else
					clone.Label.Text = v91.Name .. " (" .. v .. ")"
				end

				clone.TicketImage.Visible = true

				if u90 then
					foilEffect(clone.TicketImage)
				end

				if v > 1 then
					for _, iterValue3 in pairs(clone.MultipleReward:GetChildren()) do
						iterValue3.Image = "rbxassetid://" .. v91.CardPackId

						if u90 then
							foilEffect(iterValue3)
						end
					end

					clone.MultipleReward.Visible = true
				else
					clone.CardReward.Image = "rbxassetid://" .. v91.CardPackId
					clone.CardReward.Visible = true

					if u90 then
						foilEffect(clone.CardReward)
					end
				end

				if u32.RewardRates and u32.RewardRates[k] then
					local dropRate = clone.DropRate
					local replacedText = string.format("%.3f", u32.RewardRates[k] * 100):gsub("%.?0+$", "")

					dropRate.Text = tostring(replacedText) .. "%"
				end

				clone.Visible = true
			end
		end
	elseif p4 == "BloxBux" and list ~= 0 then
		local clone = templateReward:Clone()

		clone.Parent = parent
		clone.Amount.Text = ""
		clone.Label.Text = list .. " BB"
		clone.Misc.Image = "rbxassetid://475466844"
		clone.Misc.Rotation = -3
		clone.Misc.BackgroundTransparency = 1
		clone.Misc.Visible = true
		clone.Visible = true
	elseif p4 == "Ranks" then
		for _, v in pairs(list) do
			local clone = templateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = v
			clone.Misc.Image = "rbxassetid://9483401524"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true

			if u32.RewardRates and u32.RewardRates[v] then
				local v104 = clone.DropRate
				local replacedText = string.format("%.3f", u32.RewardRates[v] * 100):gsub("%.?0+$", "")

				v104.Text = tostring(replacedText) .. "%"
			end
		end
	elseif p4 == "Charms" then
		if list[1] > 0 then
			local clone = templateReward:Clone()

			clone.Parent = parent
			clone.Amount.Text = ""
			clone.Label.Text = list[1] .. "x Rabbit Charms"
			clone.Misc.Image = "rbxassetid://9546583984"
			clone.Misc.BackgroundTransparency = 1
			clone.Misc.Visible = true
			clone.Visible = true
		end

		if list[2] > 0 then
			local clone = templateReward:Clone()

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
		if p4 == "EventCurrency" or p4 == "Currency" then
			for k, v in pairs(list) do
				local clone = templateReward:Clone()

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
				end)
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true
			end

			return
		end

		if p4 == "BattleBackground" then
			for _, v in pairs(list) do
				local clone = templateReward:Clone()

				clone.Parent = parent
				clone.Amount.Text = ""
				clone.Label.Text = v
				clone.Misc.Image = "rbxassetid://82724795023332"
				clone.Misc.BackgroundTransparency = 1
				clone.Misc.Visible = true
				clone.Visible = true

				if u32.RewardRates and u32.RewardRates[v] then
					local v116 = clone.DropRate
					local replacedText = string.format("%.3f", u32.RewardRates[v] * 100):gsub("%.?0+$", "")

					v116.Text = tostring(replacedText) .. "%"
				end
			end
		end
	end
end
local function SetupRewardMenu(p7)
	for _, v in pairs(rewardsHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(p7) do
		AddReward(k, v, rewardsHolder)
	end
end

local u40: boolean = false

local function HideDoomspireRaids()
	if doomspireMenu.Enabled == false then
		return
	end

	transition.ToggleBlack(1, 0.3)
	doomspireMenu.Enabled = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
	u40 = false
end
local function GoToMenu()
	s1 = "Menu"
	menu.Visible = true
	menu.Position = UDim2.fromScale(0, 0.15)
	raid.Visible = false
	stories.Visible = false
	u33 = nil
end

doomspireMenu.Window.Exit.MouseButton1Click:Connect(function()
	if u40 then
		return
	end

	audioService.PlaySound("click1")

	if s1 == "Menu" then
		HideDoomspireRaids()
	elseif s1 == "Raid" then
		u40 = true
		s1 = "Menu"
		u32 = nil
		u33 = nil
		u34 = nil
		raid.Hardmode.TextLabel.Text = ""
		raid.Position = UDim2.fromScale(0, 1)

		local animationAnimateAsync = animation.AnimateAsync
		local v124 = UDim2.fromScale(0, -1.5)

		animationAnimateAsync(raid, { Position = v124 }, 0.6, "Out", "Quart")
		menu.Visible = true
		menu.Position = UDim2.fromScale(0, -1)

		local animationAnimate = animation.Animate

		v124 = UDim2.fromScale(0, 0.15)
		animationAnimate(menu, { Position = v124 }, 0.6, "Out", "Quart")
		raid.Visible = false
		u40 = false
	elseif s1 == "Stories" then
		u40 = true
		s1 = "Menu"
		stories.Position = UDim2.fromScale(0, 0.15)

		local animateAsync = animation.AnimateAsync
		local v127 = UDim2.fromScale(0, -1.5)

		animateAsync(stories, { Position = v127 }, 0.6, "Out", "Quart")
		menu.Visible = true
		menu.Position = UDim2.fromScale(0, -1)

		local animate = animation.Animate

		v127 = UDim2.fromScale(0, 0.15)
		animate(menu, { Position = v127 }, 0.6, "Out", "Quart")
		stories.Visible = false
		u40 = false
	end
end)

local function GoToRaid(p8, p9)
	local v131 = raids[p8].Stages.Normal

	if p9 == true then
		v131 = raids[p8].Stages.Extreme
	end

	if not v131 then
		return
	end

	if u40 then
		return
	end

	local v132 = raids[p8]

	raid.Hardmode.Visible = if raids[p8].Stages.Extreme then true else false
	audioService.PlaySound("click1")
	u32 = v131
	u33 = p8
	raid.Info.Title.Text = v132.Name or p8
	raid.Info.Description.Text = v132.Description or "TODO: give this raid a description, ctrl f this sentence."
	SetupRewardMenu(v131.Rewards)

	if s1 == "Menu" then
		s1 = "Raid"
		u40 = true
		menu.Position = UDim2.fromScale(0, 0.15)

		local animationAnimateAsync = animation.AnimateAsync
		local v134 = UDim2.fromScale(0, 1)

		animationAnimateAsync(menu, { Position = v134 }, 0.6, "Out", "Quart")
		raid.Visible = true
		raid.Position = UDim2.fromScale(0, -1)

		local animationAnimate = animation.Animate

		v134 = UDim2.fromScale(0, 1)
		animationAnimate(raid, { Position = v134 }, 0.6, "Out", "Quart")
		menu.Visible = false
		u40 = false
	end
end

menu.Story.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	u40 = true
	s1 = "Stories"
	menu.Position = UDim2.fromScale(0, 0.15)

	local animationAnimateAsync = animation.AnimateAsync
	local v137 = UDim2.fromScale(0, 1)

	animationAnimateAsync(menu, { Position = v137 }, 0.6, "Out", "Quart")
	stories.Visible = true
	stories.Position = UDim2.fromScale(0, -1)

	local animationAnimate = animation.Animate

	v137 = UDim2.fromScale(0, 0.15)
	animationAnimate(stories, { Position = v137 }, 0.6, "Out", "Quart")
	menu.Visible = false
	u40 = false
end)
menu.Act2.MouseButton1Click:Connect(function()
	networkClient.UpdateStatsData()

	local v139 = data.GetQuestStats()

	if v139.ViewedVN_DS_N_1 and v139.ViewedVN_DS_N_1 == 0 and v139.SkippedAct1Warning == 0 then
		doomspireMenu.Act2Warning.Visible = true

		return
	end

	doomspireMenu.Enabled = false
	dsa2StoryMenu.OpenDSA2StoryMenu()
end)
doomspireMenu.Act2Warning.Deny.MouseButton1Click:Connect(function()
	doomspireMenu.Act2Warning.Visible = false
end)
doomspireMenu.Act2Warning.Confirm.MouseButton1Click:Connect(function()
	network.FireServer("RedeemSkippedAct1")
	doomspireMenu.Act2Warning.Visible = false
	doomspireMenu.Enabled = false
	dsa2StoryMenu.OpenDSA2StoryMenu()
end)

for k, v in pairs({ "UNIT_4_FORGEMASTER", "Prince Wonktooth", "The Animus", "Thyyrinyr" }) do
	local v46 = menu.Buttons[k]

	v46.Title.Text = v
	v46.MouseButton1Click:Connect(function()
		GoToRaid(v)
	end)
end

raid.Hardmode.MouseButton1Click:Connect(function()
	if u34 then
		GoToRaid(u34)
		u34 = nil
		raid.Hardmode.TextLabel.Text = ""

		return
	end

	if not raids[u33].Stages.Extreme then
		return
	end

	u34 = u33
	GoToRaid(u33, true)
	raid.Hardmode.TextLabel.Text = "X"
end)

local u47: boolean = false

local function StartDoomspireRaid(_)
	if u47 then
		return
	end

	u47 = true
	audioService.PlaySound("GAMESTART")
	task.wait(1)
	transition.ToggleBlack(1, 0.3)

	local v141 = u33
	local text: string = tostring(LocalPlayer.userId)
	local t2: {[any]: any} = {
		Parent = true,
		QuickIntro = true,
		Name = v141,
		userId = -999999 - text,
		Duelist = u32.Duelist,
		RaidBattle = u32
	}

	networkClient.UpdateStatsData()
	raidMenu.SetLastViewed(u33, "Doomspire")
	v141 = data.GetQuestStats()

	local v144 = raids[u33]

	doomspireMenu.Enabled = false

	if v141["BOT_PLAYS_" .. v144.Stages.Normal.Duelist] == 0 and v141["BOT_PLAYS_" .. v144.Stages.Extreme.Duelist] == 0 then
		visualNovel.Start(v144.Cutscene)
	end

	network.FireServer("RequestBattle", t2)
	s1 = "Menu"
	menu.Visible = true
	menu.Position = UDim2.fromScale(0, 0.15)
	raid.Visible = false
	stories.Visible = false
	u33 = nil
	transition.HideBattleBack()
	u47 = false
end

raid.Battle.MouseButton1Click:Connect(function()
	StartDoomspireRaid(u33)
end)

local u49: boolean = false

local function CreateStoryTemplate(name, p12)
	local clone = templates.StoryTemplate:Clone()

	clone.Title.Text = p12.Title
	clone.Subtitle.Text = p12.Subtitle
	clone.Picture.Image = "rbxassetid://" .. cardLibrary[p12.Card].Id
	clone.LayoutOrder = p12.LayoutOrder
	clone.BackgroundColor3 = p12.Color
	clone.Name = name
	clone.Play.MouseButton1Click:Connect(function()
		if u49 then
			return
		end

		u49 = true
		transition.ToggleBlack(1, 0.3)
		doomspireMenu.Enabled = false
		transition.ToggleBlack(-1, 0.6)
		visualNovel.Start(name)

		local transitionChangeBattleBackground = transition.ChangeBattleBackground
		local v172 = data.CurrentBackgroundName()

		transitionChangeBattleBackground(v172 or "")
		audioService.ChangeSong("IntroDoomspire", { Volume = 0.7 })
		doomspireMenu.Enabled = true
		transition.ToggleBlack(-1, 0.6)
		u49 = false
	end)
	clone.Parent = stories.StoryFrame.StoryHolder
end

for k, v in pairs(doomspireCutscenes) do
	CreateStoryTemplate(k, v)
end

local function openDoomspireRaids(p13)
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)

	if p13 then
		transition.ChangeBattleBackground("LoomingSpire")
	else
		transition.ShowNewBattleBack("LoomingSpire")
	end

	task.spawn(handy.Hide)
	UpdatePercent()
	audioService.ChangeSong("IntroDoomspire", { Volume = 0.7 })
	networkClient.UpdateStatsData()

	local v149 = data.GetQuestStats()

	if v149.ViewedDoomspireStory and v149.ViewedDoomspireStory == 0 then
		network.FireServer("RedeemViewedDoomspireStory")
	end

	doomspireMenu.Enabled = true
	u34 = nil
	raid.Hardmode.TextLabel.Text = ""
	transition.ToggleBlack(-1, 0.3)
end

networkClient.OpenDoomspireRaids = openDoomspireRaids

function networkClient.OpenDSRaidFromRewardsMenu(p14)
	openDoomspireRaids(true)
	task.wait(0.2)

	if u34 then
		GoToRaid(p14, true)

		return
	end

	GoToRaid(p14)
end
local function ConvertSecondsToStringDaysHoursMinutes(p15)
	local floored = math.floor(p15 / 3600)
	local floored2 = math.floor(p15 % 3600 / 60)
	local n1 = p15 % 60

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

local robuxService = require(script.Parent.RobuxService)
local runService: RunService = game:GetService("RunService")

doomspireMenu.BoosterFrame.OpenBuy.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	doomspireMenu.BuyBoosts.Visible = true
end)
doomspireMenu.BuyBoosts.Exit.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	doomspireMenu.BuyBoosts.Visible = false
end)
spawn(function()
	repeat
		task.wait(0.2)
	until robuxService.Products.Ready == true

	for _, v in pairs(doomspireMenu.BuyBoosts.BoostTypes.BoostHolder:GetChildren()) do
		if v:IsA("ImageLabel") then
			local numberValue: number? = tonumber(v.Name)
			local v158 = robuxService.Products.RaidBoost.Ids[numberValue]

			if v158 then
				local infos = robuxService.Products.RaidBoost.Infos
				local text: string = tostring(v158)
				local v161 = infos[text]

				v.BuyButton.Text = v161.VendorString
				v.Description.Text = v161.Duration .. " hr"
				v.BuyButton.MouseButton1Click:connect(function()
					if not network.InvokeServer("CanUseArtBox") then
						networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

						return
					end

					game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, v158)
				end)
			end
		end
	end
end)
runService.RenderStepped:Connect(function()
	local v162 = data.GetRaidBoostTimer()

	if v162 and v162 >= os.time() then
		local timer = doomspireMenu.BoosterFrame.Timer
		local timestamp = os.time()
		local n1 = v162 - timestamp
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

	doomspireMenu.BoosterFrame.Timer.Text = "00:00:00"
end)
PlayerGui.VisGui.DSPrepEvent.InfoHolder.ShopInfo.StoryButton.MouseButton1Click:Connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	PlayerGui.VisGui.DSPrepEvent.Visible = false
	openDoomspireRaids()
end)

return {}
