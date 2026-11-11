





local t1: {[any]: any} = {
	4791348,
	49739323,
	2389916,
	20934271,
	15886026,
	1164788914,
	263971981,
	17848325,
	3040792683
}
local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local tweenService: TweenService = game:GetService("TweenService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local animation = require(replicatedStorage.Animation)
local contextualize = require(script.Parent.Contextualize)
local handy = require(script.Parent.Handy)
local shop = require(script.Parent.Shop)
local nonGameCard = require(script.Parent.NonGameCard)
local transition = require(script.Parent.Transition)
local foilEffect = require(game.ReplicatedStorage.FoilEffect)

require(script.Parent.HistoryChamberQuests)

local battleTutorial = require(game.ReplicatedStorage.BattleTutorial)
local handyHandy = handy.handy
local questMenu = visGui:WaitForChild("QuestMenu")
local starterQuests = visGui:WaitForChild("StarterQuests")
local ugcEvent = visGui:WaitForChild("UGCEvent")
local dwInfoEvent = visGui:WaitForChild("DWInfoEvent")
local anniversaryEvent = visGui:WaitForChild("AnniversaryEvent")
local balance = visGui:WaitForChild("QuestMenu"):WaitForChild("Title"):WaitForChild("Balance")

require(game.ReplicatedStorage.Packs)
game:GetService("Chat")

local u22: boolean = false
local s1: string = ""
local effects = require(game.ReplicatedStorage.Effects)
local v25 = require(replicatedStorage.Maid).new()
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local data = require(script.Parent.Data)
local dataUpdateCashMoney = data.UpdateCashMoney
local audioService = require(game.ReplicatedStorage.AudioService)
local utils = require(replicatedStorage.Utils)
local utilsSetZIndex = utils.SetZIndex
local utilsLerp = utils.Lerp
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

require(game.ReplicatedStorage.Sleeves)

local nevermore = require(script.Parent.Nevermore)
local nevermorePaperRipple = nevermore.PaperRipple
local nevermoreScrollingFrame = nevermore.ScrollingFrame
local config = require(replicatedStorage.CONFIG)
local configCardzindex = config.CARDZINDEX
local configCardsize = config.CARDSIZE
local configClr = config.CLR

time()

local buttons = questMenu.Menu.Buttons
local questHolders = questMenu.Menu.QuestHolders
local s2 = "Login"
local radialModule = require(script.RadialModule)
local allQuests = require(replicatedStorage.Quest.AllQuests)
local allDailyQuests = require(game.ReplicatedStorage.Quest.AllDailyQuests)
local allSpecialQuests = require(replicatedStorage.Quest.AllSpecialQuests)
local weeklyRewards = require(replicatedStorage.Quest.WeeklyRewards)
local t2: {[any]: any} = {}
local loginRewards = require(replicatedStorage.LoginRewards)
local t3: {[any]: any} = {}
local t4 = {
	Goldfish = 0,
	Easy = 0.2,
	Medium = 0.4,
	Hard = 0.6,
	Insane = 0.8,
	Nightmare = 1
}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}
local t9 = {}
t4 = { "Objective", "Bar" }
t4 = 6

local n1: number = 0
local t10: {[any]: any} = {}
local n2 = time() + 8
local n3: number = 0
local n4: number = 1
local n5: number = 1
local t11 = {}
local n6 = 0
local u69: boolean = false
local u70: boolean = false
local u71 = nil
local u72 = nil

local function isTestServer()
	return game.PlaceId == 7105900056
end

for k, v in pairs(allQuests) do
	for k2, iterValue in pairs(v) do
		t2[k2] = iterValue
		iterValue.Category = k
	end
end

for _, v in pairs(allQuests) do
	for k, iterValue2 in pairs(v) do
		if iterValue2.Requirement and v[iterValue2.Requirement] then
			v[iterValue2.Requirement].Unlocks = k
		end
	end
end

function playerNext()
	repeat
		runService.RenderStepped:Wait()

		local v125 = n2
		local v126 = time()
	until v125 <= v126

	if #t10 > 0 then
		visGui.QuestMessage.Visible = true

		local v127 = t10[1][1]
		local v128 = t10[1][2]
		local v129 = t10[1][4]

		t10[1][3]:Destroy()

		if v129 == "Single" then
			visGui.QuestMessage.Table.Visible = false
			visGui.QuestMessage.Single.Visible = true
			visGui.QuestMessage.Single.Desc.Text = v127
		else
			visGui.QuestMessage.Single.Visible = false
			visGui.QuestMessage.Table.Visible = true
		end

		table.remove(t10, 1)
		countdown(100, v128)

		return
	end

	visGui.QuestMessage.Visible = false
end
function countdown(p1, p2)
	n2 = time() + p2

	local radialModuleNew = radialModule.new
	local radial = visGui.QuestMessage.Radial
	local color3 = Color3.fromRGB(0, 0, 0)
	local color32 = Color3.fromRGB(255, 255, 255)

	u71 = radialModuleNew(radial, "6553408336", {
		BackgroundTransparency = 1,
		BackgroundType = "TransAndColor",
		ProgressTransparency = 0.1,
		BackgroundColor = color3,
		ProgressColor = color32
	})
	u71.Config.ImageColor = Color3.fromRGB(255, 214, 0)
	u71:Update()
	u72 = u71:TweenProgress(p1, p2)
	u71.Callback = playerNext
end

visGui.QuestMessage.Radial.TextButton.MouseButton1Click:Connect(function()
	local n1 = u72[3].Value / 100

	n2 = time() + (1 - n1)

	if u72 ~= nil then
		u72[1]:Cancel()
		u72[2]:Disconnect()
		u72[3]:Destroy()
		u71:SetProgress(n1 * 100)
		u72 = u71:TweenProgress(100, 1 - n1)
	end
end)

local module: {[any]: any} = {
	createMessage = function(p3, p4)
		n1 += 1

		local clone = script.MessageQueue:Clone()

		clone.ZIndex = clone.ZIndex - n1
		clone.Parent = visGui.QuestMessage.Messages

		local typeName: string = type(p3)

		table.insert(t10, {
			p3,
			p4,
			clone,
			if typeName == "table" then "Table" else "Single"
		})
		runService.RenderStepped:Wait()

		if #t10 <= 1 or n2 <= time() then
			coroutine.resume(coroutine.create(function()
				playerNext()
			end))
		end
	end,
	playSound = function(p5, p6)
		print(p5, "added aginst", p6)
		script.NewDaily:Play()
	end
}

local function getDailyQuestInfo(p7)
	for _, v in pairs(allDailyQuests) do
		for k, iterValue in pairs(v) do
			if k == p7 then
				return iterValue
			end
		end
	end
end
function networkClient.CloseQuestMenu()
	if questMenu.Visible == false then
		return
	end

	transition.ToggleBlur(1, 0.1)
	questMenu.Visible = false
	transition.HideBattleBack()
	transition.ToggleBlur(-1, 0.1)
end

networkClient.createMessage = module.createMessage
networkClient.PlayDailySound = module.playSound

local dailyProgress = LocalPlayer.PlayerGui:WaitForChild("DailyProgress")
local notiFrame = dailyProgress.Template.NotiFrame

function networkClient.DailyNotification(p8)
	dailyProgress.Enabled = true

	local v149 = getDailyQuestInfo(p8.Index)

	if v149 then
		local v150 = math.clamp(p8.Amount / v149.Amount, 0, 1)
		local clone = notiFrame:Clone()

		clone.Bar.Backdrop.Progress.Size = UDim2.fromScale(v150, 1)

		if v150 == 1 then
			clone.Complete.Visible = true
		end

		clone.Desc.Text = v149.Description
		clone.Bar.Percent.Text = math.clamp(p8.Amount, 0, v149.Amount) .. "/" .. v149.Amount
		clone.Parent = dailyProgress.Holder
		clone.Visible = true
		animation.AnimateAsync(clone, { GroupTransparency = 0 }, 0.5, "Out", "Quad")
		spawn(function()
			task.wait(5)
			animation.Animate(clone, { GroupTransparency = 1 }, 0.5, "Out", "Quad")
			clone:Destroy()
		end)
	end
end
function hideInside(p9)
	for _, v in pairs(p9:GetChildren()) do
		v.Visible = false
	end
end
function showInside(p10)
	for _, v in pairs(p10:GetChildren()) do
		v.Visible = true
	end
end
function updateData(p11)
	local v159 = networkInvokeServer("GetQuestInfo")

	if p11 then
		repeat
			v159 = networkInvokeServer("GetQuestInfo")
		until v159
	end

	n6 = networkInvokeServer("GetServerDate")
	t6 = v159[1]
	t5 = v159[2]
	t7 = v159[3]
	t8 = v159[6]
	t9 = v159[7]
	data.SetQuestStatsData(t6)
end
function networkClient.UpdateStatsData()
	t6 = networkInvokeServer("GetQuestInfo")[1]
	data.SetQuestStatsData(t6)
end
function networkClient.UpdateQuestMenu()
	update()
end

local n7 = 0

updateData(true)

for k, _ in pairs(loginRewards) do
	if loginRewards[k].Order == 1 then
		t11 = k
	end

	n5 += 1

	if t8[k] and n6 ~= t8[k][1] and t8[k][2] < #loginRewards[k].Calendar and loginRewards[k].EventEndDate > os.time() then
		print(loginRewards[k].EventName .. " End Time: " .. loginRewards[k].EventEndDate)

		local timestamp = os.time()

		print("Client Time: " .. timestamp)
		n7 += 1
	end
end

if n7 >= 1 then
	handyHandy.Quest.New.Visible = true
else
	handyHandy.Quest.New.Visible = false
end

local n8: number = n5 - 1
local n9: number = n8

print("Total active calendars:" .. n9)
n7 = function(p12, p13, p14, _)
	p12.Bar.Backdrop.Progress.Size = UDim2.fromScale(p13 / p14, 1)
	p12.Bar.Percent.Text = p13 .. "/" .. p14
end

local function calculateStatAndAmount(p16, p17)
	local n1 = 0
	local n2 = 0

	if typeof(p17.Stat) == "table" then
		for k, v in pairs(p17.Stat) do
			if not p16[k] then
				p16[k] = 0
			end

			n1 = math.min(p16[k], v) + n1
			n2 = v + n2
		end

		return n1, n2
	end

	return p16[p17.Stat], p17.Amount
end

local t13: {[any]: any} = {
	Easy = "rbxassetid://12220641249",
	Medium = "rbxassetid://12220641380",
	Hard = "rbxassetid://12220641462",
	Insane = "rbxassetid://12220641594",
	Legendary = "rbxassetid://12220641732"
}
local color3 = Color3.fromRGB(162, 162, 162)
local color33 = Color3.fromRGB(122, 208, 109)
local color34 = Color3.fromRGB(77, 198, 198)
local color35 = Color3.fromRGB(240, 125, 225)
local color36 = Color3.fromRGB(255, 186, 75)
local t14: {[any]: any} = {
	Easy = color3,
	Medium = color33,
	Hard = color34,
	Insane = color35,
	Legendary = color36
}

local function createQuest(name, p19, _)
	local n1 = 0
	local v174, v175 = calculateStatAndAmount(t6, p19)

	if t5 and t5[name] and v174 then
		n1 = math.min(v174 / v175, 1)
	end

	local clone = questHolders.TemplateQuest:Clone()

	clone.Name = name
	clone.LayoutOrder = p19.DefaultSort + 1000
	clone.QuestName.Text = p19.Name
	clone.QuestDesc.Text = p19.Goal

	if p19.Rewards then
		if p19.Category == "Metaverse" then
			local v177 = nil

			for k, _ in pairs(p19.Rewards.Cards) do
				v177 = k
			end

			local v180 = cardLibrary[v177]

			clone.Reward.Visible = true
			clone.Reward.CardReward.Visible = true
			clone.Reward.CardReward.Image = "rbxassetid://" .. cardLibrary[v177].Id
			clone.Reward.Label.Text = v180.Name
			nonGameCard.BindInspect(clone.Reward.CardReward, v180)
		else
			clone.Reward.Visible = true

			if not t13[p19.Difficulty] then
				warn(p19.Name .. " has no proper difficulty")
				p19.Difficulty = "Medium"
			end

			if p19.Category == "Progression" then
				local v181 = config.EVENTCURRENCYIMAGE["History Core"]

				clone.Reward.Misc.Image = "rbxassetid://" .. v181
				clone.Reward.Misc.Visible = true
				clone.Reward.BackgroundColor3 = Color3.fromRGB(170, 50, 170)
				clone.ColorShadow.BackgroundColor3 = Color3.fromRGB(170, 50, 170)
				clone.Reward.UIStroke.Color = Color3.fromRGB(170, 50, 170)
			else
				clone.Reward.Misc.Image = t13[p19.Difficulty]
				clone.Reward.Misc.Visible = true
				clone.Reward.BackgroundColor3 = t14[p19.Difficulty]
				clone.ColorShadow.BackgroundColor3 = t14[p19.Difficulty]
				clone.Reward.UIStroke.Color = t14[p19.Difficulty]
			end

			clone.Reward.Label.Text = ""
			clone.Reward.MouseEnter:Connect(function()
				audioService.PlaySound("click2")
				animation.AnimateAsync(clone.Reward.UIStroke, { Thickness = 4 }, 0.5, "Out", "Quint")
			end)
			clone.Reward.MouseLeave:Connect(function()
				animation.AnimateAsync(clone.Reward.UIStroke, { Thickness = 0 }, 0.5, "Out", "Quint")
			end)
			clone.Reward.MouseButton1Down:Connect(function()
				networkClient.QuickShowRewards(p19.Rewards)
			end)
		end
	end

	if n1 >= 1 or t5[name] and not t5[name][3] and t5[name][1][2] ~= -1 then
		clone.Bar.Visible = false

		if t5[name] and not t5[name][3] then
			connection = clone.Complete
			connection.Visible = true
			connection = clone.Reward
			connection = connection.Done
			connection.Visible = true
			connection = p19.DefaultSort + 10000
			clone.LayoutOrder = connection
			connection = clone.Complete
			connection.Text = "Completed!" .. (p19.Unlocks and " [Unlocked: " .. allQuests[s2][p19.Unlocks].Name .. "]" or "")
		else
			if not p19.CantRedeem then
				clone.Redeem.Visible = true
			end

			clone.LayoutOrder = p19.DefaultSort

			local connection = nil

			connection = clone.Redeem.MouseButton1Click:Connect(function()
				if u22 then
					return
				end

				if networkInvokeServer("QuestAward", name) then
					if p19.Rewards then
						clone.Redeem.Visible = false
						clone.Complete.Visible = true
						clone.LayoutOrder = p19.DefaultSort + 10000
						clone.Complete.Text = "Completed!" .. (p19.Unlocks and " [Unlocked: " .. allQuests[s2][p19.Unlocks].Name .. "]" or "")
						clone.Reward.Done.Visible = true
						networkClient.ShowRewards(p19.Rewards)
						connection:Disconnect()
					end

					if p19.Unlocks then
						update()
					end
				end
			end)
		end
	else
		connection = v174 / v175
		clone.Bar.Backdrop.Progress.Size = UDim2.fromScale(connection, 1)
		clone.Bar.Percent.Text = v174 .. "/" .. v175
		connection = clone.Bar
		connection.Visible = true
		connection = p19.Unlocks

		if connection then
			clone.Unlocks.Text = "Unlocks quest: " .. allQuests[s2][connection].Name
			clone.Unlocks.Visible = true
		else
			clone.Unlocks.Visible = false
		end
	end

	clone.Visible = true

	return clone
end
local function findDailyQuest(p21)
	for _, v in pairs(allDailyQuests) do
		for k, iterValue in pairs(v) do
			if k == p21 then
				return iterValue
			end
		end
	end
end

for _, v in pairs(questHolders.NewDailyFrame.ChallengeHolder:GetChildren()) do
	if v:IsA("GuiObject") then
		v.MouseEnter:Connect(function()
			audioService.PlaySound("locksoft")
			animation.AnimateAsync(v.UIStroke, { Thickness = 4 }, 0.5, "Out", "Quint")
		end)
		v.MouseLeave:Connect(function()
			animation.AnimateAsync(v.UIStroke, { Thickness = 0 }, 0.5, "Out", "Quint")
		end)
		v:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
			v.UIStroke.Color = v.BackgroundColor3
		end)
	end
end

function update()
	updateData()
	questHolders.BackgroundColor3 = buttons.Buttons:FindFirstChild(s2).BackgroundColor3

	for _, v in pairs(questHolders.QuestHolder.ActualHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	questHolders.QuestHolder.CompleteQuestsNotif.Visible = false

	if allQuests[s2] then
		questHolders.NewDailyFrame.Visible = false
		questHolders.LoginFrame.Visible = false
		questHolders.QuestHolder.Visible = true

		local animationAnimateAsync = animation.AnimateAsync
		local foundChild = buttons.Buttons:FindFirstChild(s2)

		animationAnimateAsync(questHolders, { ImageColor3 = foundChild.BackgroundColor3 }, 1, "Out", "Quint")

		local backgroundColor3 = buttons.ButtonBackDrops:FindFirstChild(s2).BackgroundColor3

		for k, v in pairs(allQuests[s2]) do
			if not v.Requirement or t5[v.Requirement] and t5[v.Requirement][1][2] ~= -1 and not t5[v.Requirement][3] then
				local v194 = createQuest(k, v, backgroundColor3)

				v194.Parent = questHolders.QuestHolder.ActualHolder
			end
		end

		if #questHolders.QuestHolder.ActualHolder:GetChildren() <= 1 then
			questHolders.QuestHolder.CompleteQuestsNotif.Visible = true
		end

		questHolders.Visible = true

		local uiGridLayout = questHolders.QuestHolder.ActualHolder.UIGridLayout
		local n1: number = #questHolders.QuestHolder.ActualHolder:GetChildren()

		if n1 > 6 then
			local questHoldersQuestHolder = questHolders.QuestHolder
			local uDim2FromScale = UDim2.fromScale
			local v199 = math.min(n1 / 12 * 2, 20)

			questHoldersQuestHolder.CanvasSize = uDim2FromScale(0, v199)
		else
			questHolders.QuestHolder.CanvasSize = UDim2.fromScale(0, 1)
		end
	elseif s2 == "Daily" then
		local animateAsync = animation.AnimateAsync
		local foundChild = buttons.Buttons:FindFirstChild(s2)

		animateAsync(questHolders, { ImageColor3 = foundChild.BackgroundColor3 }, 1, "Out", "Quint")

		local challengeHolder = questHolders.NewDailyFrame.ChallengeHolder

		v25:DoCleaning()

		for k, v in pairs(t7.Redeemed) do
			if k * 5 <= t7.Completed and not v then
				challengeHolder["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(117, 221, 124)
				v25:GiveTask(challengeHolder["Challenge" .. k].Button.MouseButton1Click:Connect(function()
					if u22 then
						return
					end

					if networkInvokeServer("RedeemWeekly", k) then
						update()
					end
				end))

				local timestamp = tick()
				local runService2: RunService = game:GetService("RunService")

				v25:GiveTask(runService2.RenderStepped:Connect(function()
					if tick() - timestamp > 1 and questHolders.NewDailyFrame.Visible == true and questMenu.visible == true then
						timestamp = tick()
						effects.Pulse(visGui.Effect, nil, challengeHolder["Challenge" .. k].Button)
					end
				end))
			else
				v25:GiveTask(challengeHolder["Challenge" .. k].Button.MouseButton1Click:Connect(function()
					networkClient.QuickShowRewards(weeklyRewards[k])
				end))

				if k * 5 <= t7.Completed then
					challengeHolder["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(0, 81, 255)
				else
					challengeHolder["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(0, 176, 255)
				end
			end
		end

		questHolders.NewDailyFrame.ChallengeProgress.BarProgress.Size = UDim2.fromScale(t7.Completed / 25, 1)

		for _, v in pairs(questHolders.NewDailyFrame.DailyHolder.Holder:GetChildren()) do
			if v:IsA("GuiObject") then
				v:Destroy()
			end
		end

		if #t7.Dailys == 0 then
			questHolders.NewDailyFrame.AllDone.Visible = true
		else
			questHolders.NewDailyFrame.AllDone.Visible = false

			for _, v in pairs(t7.Dailys) do
				local clone = questHolders.NewDailyFrame.Templates.TemplateDaily:Clone()
				local v212 = findDailyQuest(v.Index)

				if v.Amount >= v212.Amount then
					clone.Redeem.Visible = true
					clone.Bar.Visible = false
					clone.Redeem.MouseButton1Click:Connect(function()
						if u22 then
							return
						end

						if networkInvokeServer("RedeemDaily", v.Index) then
							effects.BloxBux(visGui.Effect, clone.Redeem, balance, nil, v.Reward.BloxBux)
							update()
						end
					end)
				else
					clone.Redeem.Visible = false
					clone.Bar.Visible = true
					clone.Bar.Percent.Text = v.Amount .. "/" .. v212.Amount
					clone.Bar.Backdrop.Progress.Size = UDim2.fromScale(v.Amount / v212.Amount, 1)
				end

				clone.Reward.Label.Text = v.Reward.BloxBux .. " BB"
				clone.Reward.BackgroundColor3 = v.Reward.BloxBux < 150 and Color3.fromRGB(0, 176, 255) or Color3.fromRGB(255, 107, 70)
				clone.QuestDesc.Text = v212.Description
				clone.Parent = questHolders.NewDailyFrame.DailyHolder.Holder
				clone.Visible = true
			end
		end

		questHolders.NewDailyFrame.Visible = true
		questHolders.LoginFrame.Visible = false
		questHolders.QuestHolder.Visible = false
	else
		local n2: number = n3 * 5 + 1

		for _, v in pairs(questHolders.LoginFrame.Rewards:GetChildren()) do
			timestamp = loginRewards

			if timestamp then
				timestamp = v.Name
			end

			if timestamp and timestamp ~= "UIListLayout" then
				timestamp = loginRewards[t11].Calendar[n2]

				if timestamp ~= nil then
					timestamp = v.Preview
					timestamp.Image = "rbxassetid://" .. loginRewards[t11].Calendar[n2].RewardImage
					timestamp = v.RewardCount
					timestamp.Text = "X" .. loginRewards[t11].Calendar[n2].RewardAmount
					timestamp = v.RewardCount
					timestamp = timestamp.Back
					timestamp.Text = "X" .. loginRewards[t11].Calendar[n2].RewardAmount
					timestamp = loginRewards[t11].Calendar[n2]
					timestamp = timestamp.IsFoil

					if timestamp == true then
						timestamp = foilEffect
						timestamp(v.Preview)
					else
						timestamp = pairs

						for iterFirst, iterSecond in timestamp(v.Preview:GetChildren()) do
							iterSecond:Destroy()
						end
					end

					timestamp = v.DayCount
					timestamp.Text = "Day " .. n2
					timestamp = v.DayCount
					timestamp = timestamp.Back
					timestamp.Text = "Day " .. n2
					timestamp = t8[t11][2]

					if timestamp then
						timestamp = t8[t11][2]
					end

					if not timestamp or not (n2 <= timestamp) then
						timestamp = v.Preview
						timestamp.ImageColor3 = Color3.fromRGB(255, 255, 255)
						timestamp = v.ClaimedText
						timestamp.Text = " "
						timestamp = v.ClaimedText
						timestamp = timestamp.Back
						timestamp.Text = " "
					else
						timestamp = v.Preview
						timestamp.ImageColor3 = Color3.fromRGB(25, 25, 25)
						timestamp = v.ClaimedText
						timestamp.Text = "Claimed!"
						timestamp = v.ClaimedText
						timestamp = timestamp.Back
						timestamp.Text = "Claimed!"
					end

					timestamp = #loginRewards[t11].Calendar[n2].Reward.Cards

					if timestamp then
						timestamp = nil

						for k, _ in pairs(loginRewards[t11].Calendar[n2].Reward.Cards) do
							timestamp = k
						end

						local v220 = cardLibrary[timestamp]

						if v220 then
							v.InspectBinding:ClearAllChildren()
							timestamp = Instance.new("ImageLabel")
							timestamp.Position = v.InspectBinding.Position
							timestamp.Size = v.InspectBinding.Size
							timestamp.BackgroundTransparency = 1
							timestamp.Image = " "
							timestamp.Parent = v.InspectBinding
							nonGameCard.BindInspect(timestamp, v220)
						else
							v.InspectBinding:ClearAllChildren()
						end
					end

					n2 += 1

					continue
				end
			end

			timestamp = loginRewards

			if timestamp then
				timestamp = v.Name
			end

			if timestamp and timestamp ~= "UIListLayout" then
				timestamp = v.Preview
				timestamp.Image = "rbxassetid:// "
				timestamp = v.RewardCount
				timestamp.Text = ""
				timestamp = v.RewardCount
				timestamp = timestamp.Back
				timestamp.Text = ""
				timestamp = v.DayCount
				timestamp.Text = ""
				timestamp = v.DayCount
				timestamp = timestamp.Back
				timestamp.Text = ""
			end
		end

		timestamp = t11

		local backgroundColor = loginRewards[timestamp].BackgroundColor

		timestamp = "Quint"
		animation.AnimateAsync(questHolders, { ImageColor3 = backgroundColor }, 1, "Out", timestamp)
		timestamp = t11
		questHolders.LoginFrame.ChangeCalendar.TextLabel.Text = " " .. loginRewards[timestamp].EventName .. " "
		timestamp = t11
		questHolders.LoginFrame.ChangeCalendar.TextLabel.Back.Text = " " .. loginRewards[timestamp].EventName .. " "
		timestamp = t11
		questHolders.LoginFrame.EventBanner.Image = "rbxassetid://" .. loginRewards[timestamp].EventBannerImage
		questHolders.LoginFrame.BannerCount.Text = n4 .. "/" .. n8
		questHolders.LoginFrame.BannerCount.Back.Text = n4 .. "/" .. n8
		questHolders.NewDailyFrame.Visible = false
		questHolders.QuestHolder.Visible = false
		questHolders.LoginFrame.Visible = true
	end

	local n5: number = 0

	for k, _ in pairs(loginRewards) do
		if t8[k] and t8[k][1] ~= n6 and t8[k][2] < #loginRewards[k].Calendar and loginRewards[k].EventEndDate > os.time() then
			n5 += 1
		end
	end

	if n5 >= 1 then
		handyHandy.Quest.New.Visible = true
	else
		handyHandy.Quest.New.Visible = false
	end

	for _, v in pairs(buttons.Buttons:GetChildren()) do
		local notification = v:FindFirstChild("Notification")

		if notification then
			notification.Visible = false
		end
	end

	for k, v in pairs(allQuests) do
		if buttons.Buttons:FindFirstChild(k) then
			for k3, iterValue in pairs(v) do
				local n7 = 0
				local v233, v234 = calculateStatAndAmount(t6, iterValue)

				if t5 and t5[k3] and v233 then
					n7 = v233 / v234
				end

				if t5[k3] and t5[k3][3] and t5[k3][1][2] ~= -1 and n7 >= 1 then
					buttons.Buttons[k].Notification.Visible = true
				end
			end
		end
	end

	for _, v in pairs(t7.Dailys) do
		local v237 = findDailyQuest(v.Index)

		if v.Amount >= v237.Amount then
			buttons.Buttons.Daily.Notification.Visible = true
		end
	end
end
function pressDown(p22)
	if p22 and p22.Parent and (t3[p22] == nil or t3[p22] ~= nil and t3[p22] <= time()) and s2 ~= p22.Parent.Name then
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true, 0.05)
		local v240: Tween = tweenService:Create(p22, tweenInfo, { Position = p22.Position + UDim2.new(0, 0, 0.07, 0) })

		t3[p22] = time() + 0.3
		v240:Play()
		script.ClickSound:Play()
	end
end
function shake(p23)
	if not p23:IsA("Frame") and (t3[p23] == nil or t3[p23] ~= nil and t3[p23] <= time()) then
		p23.ImageColor3 = Color3.new(1, 0, 0)
		p23.Parent.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
		p23.Parent.Background.Value.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
		script.DeniedSound:Play()
		t3[p23] = time() + 0.55

		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		local v243: Tween = tweenService:Create(p23, tweenInfo, { Position = p23.Position + UDim2.new(0.1, 0, 0, 0.05) })

		v243:Play()
		v243.Completed:Wait()

		local tweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

		v243 = tweenService:Create(p23, tweenInfo2, { Position = p23.Position - UDim2.new(0.2, 0, 0, 0) })
		v243:Play()
		v243.Completed:Wait()

		local tweenInfo3 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

		v243 = tweenService:Create(p23, tweenInfo3, { Position = p23.Position + UDim2.new(0.1, 0, 0, 0) })
		v243:Play()
		v243.Completed:Wait()
		task.wait(0.15)
		p23.ImageColor3 = Color3.new(0, 0, 0)
		p23.Parent.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		p23.Parent.Background.Value.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
end

for _, v in pairs(buttons.Buttons:GetChildren()) do
	if v:FindFirstChild("Click") then
		v.Click.MouseButton1Click:Connect(function()
			if u22 and s1 ~= v.Name then
				return
			end

			if v.Name == "None" or s2 == v.Name then
				shake(v.Icon)
				script.DeniedSound:Play()

				return
			end

			pressDown(v.Icon)
			s2 = v.Name
			update()
		end)
	end
end

function UpdateStarterQuests()
	updateData()

	local u246: boolean = false
	local n1: number = 0

	for _, v in pairs(starterQuests.StarterQuestHolder:GetChildren()) do
		if v:IsA("Frame") and allSpecialQuests[v.Name] then
			local n2 = 0
			local v251, v252 = calculateStatAndAmount(t6, allSpecialQuests[v.Name])

			if v251 then
				n2 = v251 / v252
			end

			if n2 >= 1 then
				if not t9[v.Name] then
					if v.ClaimButton then
						u246 = true
						v.ClaimButton.Visible = true

						local connection = nil

						connection = v.ClaimButton.MouseButton1Click:Connect(function()
							if networkInvokeServer("SpecialQuestAward", v.Name) and allSpecialQuests[v.Name].Rewards then
								UpdateStarterQuests()
								v.ClaimButton.Text = "Completed!"
								v.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
								connection:Disconnect()
							end
						end)
					end
				elseif v.ClaimButton then
					n1 += 1
					v.ClaimButton.Visible = true
					v.ClaimButton.Text = "Completed!"
					v.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
				end
			elseif v.ClaimButton then
				v.ClaimButton.Visible = false
			end
		end
	end

	local starterQuestsCompleteStarterQuests = starterQuests.CompleteStarterQuests

	if allSpecialQuests[starterQuestsCompleteStarterQuests.Name] then
		local n3 = 0
		local v256, v257 = calculateStatAndAmount(t6, allSpecialQuests[starterQuestsCompleteStarterQuests.Name])

		if v256 then
			n3 = v256 / v257
		end

		if n3 >= 1 then
			if not t9[starterQuestsCompleteStarterQuests.Name] then
				if starterQuestsCompleteStarterQuests.ClaimButton then
					u246 = true
					starterQuestsCompleteStarterQuests.ClaimButton.Visible = true

					local connection = nil

					connection = starterQuestsCompleteStarterQuests.ClaimButton.MouseButton1Click:Connect(function()
						if networkInvokeServer("SpecialQuestAward", starterQuestsCompleteStarterQuests.Name) and allSpecialQuests[starterQuestsCompleteStarterQuests.Name].Rewards then
							UpdateStarterQuests()
							starterQuestsCompleteStarterQuests.ClaimButton.Text = "Completed!"
							starterQuestsCompleteStarterQuests.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
							connection:Disconnect()
						end
					end)
				end
			elseif starterQuestsCompleteStarterQuests.ClaimButton then
				n1 += 1
				starterQuestsCompleteStarterQuests.ClaimButton.Visible = true
				starterQuestsCompleteStarterQuests.ClaimButton.Text = "Completed!"
				starterQuestsCompleteStarterQuests.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
			end
		else
			connection = starterQuestsCompleteStarterQuests.ClaimButton

			if connection then
				connection = starterQuestsCompleteStarterQuests.ClaimButton
				connection.Visible = false
			end
		end
	end

	if n1 >= 7 then
		u69 = true
		handyHandy.StarterQuests.Visible = false

		return
	end

	if u246 == true then
		handyHandy.StarterQuests.New.Visible = true

		return
	end

	handyHandy.StarterQuests.New.Visible = false
end

for _, v in pairs(starterQuests.StarterQuestHolder:GetChildren()) do
	local scrollingFrame = v:FindFirstChild("ScrollingFrame")

	if scrollingFrame then
		local n10: number = 1
		local n11: number = #scrollingFrame:GetChildren() - 1
		local clone = starterQuests.Templates.PageFrame:Clone()

		clone.Parent = v

		for i = 2, n11 do
			local clone2 = clone.PageHolder.Page1:Clone()

			clone2.Name = "Page" .. i
			clone2.Parent = clone.PageHolder
		end

		clone.Right.MouseButton1Click:Connect(function()
			clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			if n10 == n11 then
				n10 = 1
				clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(0, 255, 234)
				animation.AnimateAsync(scrollingFrame, { CanvasPosition = Vector2.new(0, 0) }, 0.5, "Out", "Quart")

				return
			end

			n10 += 1
			clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

			local animationAnimateAsync = animation.AnimateAsync
			local vector2 = Vector2.new(scrollingFrame.AbsoluteWindowSize.X * (n10 - 1), 0)

			animationAnimateAsync(scrollingFrame, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")
		end)
		clone.Left.MouseButton1Click:Connect(function()
			clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			if n10 == 1 then
				n10 = n11
				clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

				local animationAnimateAsync = animation.AnimateAsync
				local vector2 = Vector2.new(scrollingFrame.AbsoluteWindowSize.X * (n10 - 1), 0)

				animationAnimateAsync(scrollingFrame, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")

				return
			end

			n10 -= 1
			clone.PageHolder["Page" .. n10].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

			local animateAsync = animation.AnimateAsync
			local vector2 = Vector2.new(scrollingFrame.AbsoluteWindowSize.X * (n10 - 1), 0)

			animateAsync(scrollingFrame, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")
		end)
		clone.PageHolder.Page1.BackgroundColor3 = Color3.fromRGB(0, 255, 234)
		clone.Visible = true
	end
end

for _, v in pairs(ugcEvent.HelpHolder:GetChildren()) do
	local scrollingFrame2 = v:FindFirstChild("ScrollingFrame")

	if scrollingFrame2 then
		local n12: number = 1
		local n13: number = #scrollingFrame2:GetChildren() - 1
		local clone = ugcEvent.Templates.PageFrame:Clone()

		clone.Parent = v

		for i = 2, n13 do
			local clone3 = clone.PageHolder.Page1:Clone()

			clone3.Name = "Page" .. i
			clone3.Parent = clone.PageHolder
		end

		clone.Right.MouseButton1Click:Connect(function()
			clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			if n12 == n13 then
				n12 = 1
				clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(0, 255, 234)
				animation.AnimateAsync(scrollingFrame2, { CanvasPosition = Vector2.new(0, 0) }, 0.5, "Out", "Quart")

				return
			end

			n12 += 1
			clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

			local animationAnimateAsync = animation.AnimateAsync
			local vector2 = Vector2.new(scrollingFrame2.AbsoluteWindowSize.X * (n12 - 1), 0)

			animationAnimateAsync(scrollingFrame2, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")
		end)
		clone.Left.MouseButton1Click:Connect(function()
			clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			if n12 == 1 then
				n12 = n13
				clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

				local animationAnimateAsync = animation.AnimateAsync
				local vector2 = Vector2.new(scrollingFrame2.AbsoluteWindowSize.X * (n12 - 1), 0)

				animationAnimateAsync(scrollingFrame2, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")

				return
			end

			n12 -= 1
			clone.PageHolder["Page" .. n12].BackgroundColor3 = Color3.fromRGB(0, 255, 234)

			local animateAsync = animation.AnimateAsync
			local vector2 = Vector2.new(scrollingFrame2.AbsoluteWindowSize.X * (n12 - 1), 0)

			animateAsync(scrollingFrame2, { CanvasPosition = vector2 }, 0.5, "Out", "Quart")
		end)
		clone.PageHolder.Page1.BackgroundColor3 = Color3.fromRGB(0, 255, 234)
		clone.Visible = true
	end
end

function UpdateLimitedQuests()
	updateData()

	local u271: boolean = false
	local n1: number = 0

	for _, v in pairs(ugcEvent.TaskHolder:GetChildren()) do
		if v:IsA("Frame") and allSpecialQuests[v.Name] then
			local n2 = 0
			local v276, v277 = calculateStatAndAmount(t6, allSpecialQuests[v.Name])

			if v276 then
				n2 = v276 / v277
			end

			if n2 >= 1 then
				if not t9[v.Name] then
					if v.ClaimButton then
						u271 = true
						v.ClaimButton.Text = "Claim Reward!"
						v.ClaimButton.BackgroundColor3 = Color3.fromRGB(72, 229, 82)
						v.ClaimButton.Visible = true

						local connection = nil

						connection = v.ClaimButton.MouseButton1Click:Connect(function()
							if networkInvokeServer("SpecialQuestAward", v.Name) and allSpecialQuests[v.Name].Rewards then
								v.ClaimButton.Text = "Completed!"
								v.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
								connection:Disconnect()
							end
						end)
					end
				elseif v.ClaimButton then
					n1 += 1
					v.ClaimButton.Visible = true
					v.ClaimButton.Text = "Completed!"
					v.ClaimButton.BackgroundColor3 = Color3.fromRGB(68, 74, 63)
				end
			elseif v.ClaimButton then
				v.ClaimButton.Visible = false
			end
		end
	end

	if u271 == true then
		handyHandy.LimitedEvent.New.Visible = true

		return
	end

	handyHandy.LimitedEvent.New.Visible = false
end

nonGameCard.BindInspect(starterQuests.CompleteStarterQuests["Travelling Student"], cardLibrary[starterQuests.CompleteStarterQuests["Travelling Student"].Name])
nonGameCard.BindInspect(dwInfoEvent.InfoHolder.GearPreviews.DSCard1, cardLibrary["A War of All Against All"])
nonGameCard.BindInspect(dwInfoEvent.InfoHolder.GearPreviews.DSCard2, cardLibrary["Queen Celes"])
nonGameCard.BindInspect(dwInfoEvent.InfoHolder.GearPreviews.DSCard3, cardLibrary["Out the Dark Ages"])
nonGameCard.BindInspect(anniversaryEvent.InfoHolder.GearPreviews.DSCard1, cardLibrary["Grimclaw the Unholy-10Y"])
nonGameCard.BindInspect(anniversaryEvent.InfoHolder.GearPreviews.DSCard2, cardLibrary["Tempted by Redemption-10Y"])
nonGameCard.BindInspect(anniversaryEvent.InfoHolder.GearPreviews.DSCard3, cardLibrary["Unspeakable Summoning-10Y"])

local function StartQuestTutorial()
	u22 = true
	battleTutorial.SetSpritesheet("rbxassetid://121407898586909", 3)
	battleTutorial.SetFace(9)
	battleTutorial.SetVisible(true)
	battleTutorial.ShowText("Hey! I see you've found your quests menu.")
	battleTutorial.ShowText("This is where Archeological Duelists get given tasks to complete by the higher ups, with rewards for completing those tasks!")

	local effectsBriecreategui = effects.briecreategui
	local color37 = Color3.fromRGB(0, 0, 0)
	local color38 = Color3.fromRGB(255, 0, 0)

	effectsBriecreategui("borderguh", "Border", UDim2.new(0.88, 0, 0.76, 0), UDim2.new(0.1, 0, 0.22, 0), UDim2.new(0.1, 0, 0.22, 0), 0, 0, color37, 1, 0, 1000, color38, 10)
	s2 = "Login"
	update()
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("This menu shows any active login events, you get given free stuff just for showing up and claiming it! Isn't that super cool?")
	battleTutorial.ShowText("Let's look at the Daily menu next.", true)
	effects.briedestroygui("borderguh", 0)

	local v282 = effects.briecreategui
	local color39 = Color3.fromRGB(0, 0, 0)

	v282("arrow", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.5, 0, 0.35, 0), UDim2.new(0.04, 0, 0.35, 0), 0, 1, color39, 1, 0.5, 1001)
	s1 = "Daily"

	repeat
		task.wait(0.1)
	until s2 == "Daily"

	effects.briedestroygui("arrow", 0.5)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("This is the daily quests menu.")
	battleTutorial.SetFace(3)
	battleTutorial.ShowText("Every couple of hours, you'll get a few random tasks to complete in exchange for some BloxBux!")
	battleTutorial.SetFace(2)

	local v284 = effects.briecreategui
	local color310 = Color3.fromRGB(0, 0, 0)
	local color311 = Color3.fromRGB(255, 0, 0)

	v284("borderguh2", "Border", UDim2.new(0.8, 0, 0.25, 0), UDim2.new(0, 0, 0, 0), UDim2.new(0.15, 0, 0.18, 0), 0, 0, color310, 1, 0, 1000, color311, 10)
	battleTutorial.ShowText("Complete enough tasks in a week, and you'll even get some special weekly rewards!")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Let's look at the Feats menu next.", true)
	effects.briedestroygui("borderguh2", 0)

	local v287 = effects.briecreategui
	local color312 = Color3.fromRGB(0, 0, 0)

	v287("arrow2", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.5, 0, 0.35, 0), UDim2.new(0.04, 0, 0.66, 0), 0, 1, color312, 1, 0.5, 1001)
	s1 = "Achievements"

	repeat
		task.wait(0.1)
	until s2 == "Achievements"

	effects.briedestroygui("arrow2", 0.5)
	battleTutorial.SetFace(3)
	battleTutorial.ShowText("The Feats and Story menus where you can see your general quests, You can earn Bloxbux, Cards and more from these!")
	battleTutorial.ShowText("Card quests get unlocked when you complete the quest for getting to level 7, you'll be able to earn a bunch of unique cards there!")

	local v289 = effects.briecreategui
	local color313 = Color3.fromRGB(0, 0, 0)

	v289("arrow3", "rbxassetid://103896382515633", UDim2.new(0.09, 1, 0.18, 1), UDim2.new(0.5, 0, 0.35, 0), UDim2.new(0.04, 0, 0.87, 0), 0, 1, color313, 1, 0.5, 1001)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Lets go to the Cores tab now!", true)
	s1 = "Progression"

	repeat
		task.wait(0.1)
	until s2 == "Progression"

	effects.briedestroygui("arrow3", 0.5)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Finally, the Cores menu is where you can view quests that reward History Cores! They're worth a lot of BloxBux!")
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Some quests will unlock more quests, so complete as many as you can! Good luck!")
	networkFireServer("FirstTimeViewProgress", "Quests")
	networkClient.UpdateStatsData()
	battleTutorial.SetVisible(false)
	u22 = false
end

questHolders.LoginFrame.ForwardCalendar.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	n4 = if n4 == n8 then 1 else n4 + 1

	local n1: number = 1

	for k, _ in pairs(loginRewards) do
		if n4 == loginRewards[k].Order then
			t11 = k
		end

		n1 += 1
	end

	n3 = 0
	update()
end)
questHolders.LoginFrame.BackCalendar.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	n4 = if n4 == 1 then n8 else n4 - 1

	local n1: number = 1

	for k, _ in pairs(loginRewards) do
		if n4 == loginRewards[k].Order then
			t11 = k
		end

		n1 += 1
	end

	n3 = 0
	update()
end)
questHolders.LoginFrame.ClaimButton.MouseButton1Click:Connect(function()
	if u22 then
		return
	end

	local v297, v298 = networkInvokeServer("ClaimLoginReward", t11)

	update()
end)
questHolders.LoginFrame.Back.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")

	if n3 == 0 then
		for i = 1, #loginRewards[t11].Calendar do
			if i * 5 >= #loginRewards[t11].Calendar then
				n3 = i - 1

				break
			end
		end
	else
		n3 -= 1
	end

	update()
end)
questHolders.LoginFrame.Forward.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	n3 = if (n3 + 1) * 5 < #loginRewards[t11].Calendar then n3 + 1 else 0
	update()
end)
handyHandy.Quest.MouseEnter:connect(function()
	contextualize(handyHandy.Quest, "Claim dailies, log-in events, quests and rewards!", nil)
end)
handyHandy.Quest.MouseButton1Down:connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() then
		return
	end

	if handy.GlobalDebounce == true then
		return
	end

	handy.GlobalDebounce = true
	audioService.PlaySound("lock")
	networkClient.UpdateStatsData()

	local v300 = data.GetQuestStats()

	task.spawn(handy.Hide)
	update()
	transition.ToggleBlack(1, 0.3)
	questMenu.Visible = true
	transition.ShowBattleBack()
	transition.ToggleBlack(-1, 0.3)

	if config.TUTOR_LADY_ENABLED and v300.FirstTimeViewedQuests == 0 then
		StartQuestTutorial()
	end

	handy.GlobalDebounce = false
end)
handyHandy.StarterQuests.MouseEnter:connect(function()
	contextualize(handyHandy.StarterQuests, "Tasks and rewards for new players! ", nil)
end)
handyHandy.StarterQuests.MouseButton1Down:connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() then
		return
	end

	audioService.PlaySound("lock")
	handy.Hide()
	starterQuests.Visible = true
	UpdateStarterQuests()
end)
starterQuests.Close.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	starterQuests.Visible = false
	UpdateStarterQuests()
	handy.Show()
	handy.Expand()
end)

function OpenStarterQuests()
	starterQuests.Visible = true
	UpdateStarterQuests()
end

networkClient.OpenStarterQuests = OpenStarterQuests
handyHandy.LimitedEvent.MouseEnter:connect(function()
	contextualize(handyHandy.LimitedEvent, "Check out the 10th Anniversary Event!", nil)
end)
handyHandy.LimitedEvent.MouseButton1Down:connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() then
		return
	end

	audioService.PlaySound("lock")
	handy.Hide()
	anniversaryEvent.Visible = true
end)
ugcEvent.Close.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	ugcEvent.Visible = false
	UpdateLimitedQuests()
	handy.Show()
	handy.Expand()
end)
handyHandy.Tournament.MouseEnter:connect(function()
	contextualize(handyHandy.Tournament, "Go here to join the active tournament in this server!", nil)
end)
handyHandy.DSPrepEvent.MouseEnter:connect(function()
	contextualize(handyHandy.DSPrepEvent, "Find out more about the new expansion!", nil)
end)
handyHandy.DSPrepEvent.MouseButton1Down:connect(function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() then
		return
	end

	audioService.PlaySound("lock")
	handy.Hide()
	dwInfoEvent.Visible = true
end)
dwInfoEvent.Close.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	dwInfoEvent.Visible = false
	handy.Show()
	handy.Expand()
end)
dwInfoEvent.InfoHolder.ShopInfo.ShopButton.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	dwInfoEvent.Visible = false
	shop.ShowShop("Demon Wars: The Conquerors")
end)
anniversaryEvent.InfoHolder.ShopInfo.QuestButton.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	LocalPlayer.Character:SetPrimaryPartCFrame(replicatedStorage.UGCTeleport.CFrame)
	anniversaryEvent.Visible = false
	handy.Show()
	handy.Expand()
end)
anniversaryEvent.InfoHolder.Info.ShopButton.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	anniversaryEvent.Visible = false
	shop.ShowEventShop()
end)
anniversaryEvent.InfoHolder.EventInfo.ShopButton.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	anniversaryEvent.Visible = false
	shop.ShowShop(nil, "Start")
end)
anniversaryEvent.Close.MouseButton1Down:connect(function()
	audioService.PlaySound("lock")
	anniversaryEvent.Visible = false
	handy.Show()
	handy.Expand()
end)
questMenu.Title.Back.MouseButton1Click:Connect(function()
	if u22 then
		return
	end

	if u70 then
		return
	end

	u70 = true
	audioService.PlaySound("lock")
	transition.ToggleBlack(1, 0.3)
	questMenu.Visible = false
	transition.HideBattleBack()
	task.wait(0.25)
	handy.Show()
	handy.Expand()
	task.wait(0.25)
	transition.ToggleBlack(-1, 0.3)
	task.wait(0.25)
	u70 = false
end)

if visGui.AbsoluteSize.X < 1366 then
	t4 = 4
	questMenu.Menu.Size = UDim2.new(1, 0, 0.85, 0)
	questMenu.Menu.Position = UDim2.new(0.5, 0, 0.49, 0)
	questMenu.Menu.QuestHolders.Size = UDim2.new(0.891, 0, 0.962, 0)
	questMenu.Menu.QuestHolders.Position = UDim2.new(0.1, 0, 0.503, 0)
	questMenu.Menu.Buttons.Size = UDim2.new(0.1, 0, 0.955, 0)
end

replicatedStorage.Quest.Table.UIListLayout.Padding = UDim.new(2 / (t4 * 10))

for _, v in pairs(replicatedStorage.Quest:GetChildren()) do
	if v:IsA("TextButton") then
		v.Size = UDim2.new(1, 0, 1 / (t4 + 2), 0)
	end
end

t4 = function(p24)
	if p24 >= 86400 then
		local floored = math.floor(p24 / 86400)
		local floored2 = math.floor(p24 % 86400 / 3600)

		return floored .. " Days " .. floored2 .. " Hours"
	end

	local floored = math.floor(p24 / 3600)
	local floored3 = math.floor(p24 % 3600 / 60)

	return floored .. " Hours " .. floored3 .. " Minutes"
end
runService.RenderStepped:Connect(function()
	local n1 = config.FIRST_TICK + config.DAILY_RESET_TICK * (t7.LastLoginDay + 1)
	local n2 = config.FIRST_TICK + config.WEEKLY_RESET_TICK * (t7.LastLoginWeek + 1)
	local refill = questHolders.NewDailyFrame.Refill
	local timestamp = os.time()
	local n3 = n1 - timestamp
	local s1: string = if n3 >= 86400 then math.floor(n3 / 86400) .. " Days " .. math.floor(n3 % 86400 / 3600) .. " Hours" else math.floor(n3 / 3600) .. " Hours " .. math.floor(n3 % 3600 / 60) .. " Minutes"

	refill.Text = "2 new daily quests in " .. s1

	local reset = questHolders.NewDailyFrame.Reset
	local timestamp2 = os.time()

	n3 = n2 - timestamp2
	s1 = if n3 >= 86400 then math.floor(n3 / 86400) .. " Days " .. math.floor(n3 % 86400 / 3600) .. " Hours" else math.floor(n3 / 3600) .. " Hours " .. math.floor(n3 % 3600 / 60) .. " Minutes"
	reset.Text = "Weekly challenge milestones reset in " .. s1

	if loginRewards and n4 and loginRewards[t11] then
		if t8[t11] == nil then
			networkClient.ClaimLoginRewardsBool = true
			questHolders.LoginFrame.ClaimButton.TextLabel.Text = "Claim Login Reward"
			questHolders.LoginFrame.ClaimButton.TextLabel.Back.Text = "Claim Login Reward"
			questHolders.LoginFrame.ClaimButton.BackgroundColor3 = Color3.fromRGB(220, 117, 229)
		elseif t8[t11][2] >= #loginRewards[t11].Calendar then
			questHolders.LoginFrame.ClaimButton.TextLabel.Text = "All Rewards Claimed!"
			questHolders.LoginFrame.ClaimButton.TextLabel.Back.Text = "All Rewards Claimed!"
			questHolders.LoginFrame.ClaimButton.BackgroundColor3 = Color3.fromRGB(71, 37, 74)
		elseif loginRewards[t11].EventEndDate < os.time() then
			questHolders.LoginFrame.ClaimButton.TextLabel.Text = "Event Ended!"
			questHolders.LoginFrame.ClaimButton.TextLabel.Back.Text = "Event Ended!"
			questHolders.LoginFrame.ClaimButton.BackgroundColor3 = Color3.fromRGB(71, 37, 74)
		elseif t8[t11][1] == n6 then
			local dateText = os.date("!*t")

			dateText = string.format("%d:%02d:%02d", (dateText.hour - 23) * -1, (dateText.min - 59) * -1, (dateText.sec - 59) * -1)
			questHolders.LoginFrame.ClaimButton.TextLabel.Text = "Next Login Reward: " .. dateText
			questHolders.LoginFrame.ClaimButton.TextLabel.Back.Text = "Next Login Reward: " .. dateText
			questHolders.LoginFrame.ClaimButton.BackgroundColor3 = Color3.fromRGB(71, 37, 74)
		else
			networkClient.ClaimLoginRewardsBool = true
			questHolders.LoginFrame.ClaimButton.TextLabel.Text = "Claim Login Reward"
			questHolders.LoginFrame.ClaimButton.TextLabel.Back.Text = "Claim Login Reward"
			questHolders.LoginFrame.ClaimButton.BackgroundColor3 = Color3.fromRGB(220, 117, 229)
		end

		local v315 = os.difftime(loginRewards[t11].EventEndDate, os.time())
		local floored = math.floor(v315 / 86400)
		local floored4 = math.floor(v315 % 86400 / 3600)
		local floored5 = math.floor(v315 % 3600 / 60)
		local floored6 = math.floor(v315 % 60)

		if floored >= 1 then
			questHolders.LoginFrame.EndDate.Text = "Ends in: " .. floored .. " Days"
			questHolders.LoginFrame.EndDate.Back.Text = "Ends in: " .. floored .. " Days"
		elseif v315 <= 0 then
			questHolders.LoginFrame.EndDate.Text = "Event has Ended."
			questHolders.LoginFrame.EndDate.Back.Text = "Event has Ended."
		else
			local formattedText = string.format("%d:%02d:%02d", floored4, floored5, floored6)

			questHolders.LoginFrame.EndDate.Text = "Ends in: " .. formattedText .. " "
			questHolders.LoginFrame.EndDate.Back.Text = "Ends in: " .. formattedText .. " "
		end

		for _, v in pairs(questHolders.DailyFrame.Cards:GetChildren()) do
			if t7[v.Name] and v:FindFirstChild("Tag") then
				local v323 = os.difftime(t7[v.Name][3], os.time())
				local floored7 = math.floor(v323 % 86400 / 3600)
				local floored8 = math.floor(v323 % 3600 / 60)
				local floored9 = math.floor(v323 % 60)
				local formattedText = string.format("%d:%02d:%02d", floored7, floored8, floored9)

				v.Tag.onTimer.Text = " " .. formattedText .. " "
				v.Tag.onTimer.Back.Text = " " .. formattedText .. " "
			end
		end
	end
end)
update()
UpdateStarterQuests()
UpdateLimitedQuests()
task.spawn(function()
	while u69 == false do
		task.wait(30)
		UpdateStarterQuests()
	end
end)
print("Finished loading " .. script.Name)

return module
