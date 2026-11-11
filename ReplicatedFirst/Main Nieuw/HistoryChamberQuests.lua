



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game.Players.LocalPlayer.PlayerGui
local audioService = require(replicatedStorage.AudioService)
local animation = require(replicatedStorage.Animation)

require(replicatedStorage.CardLibrary)
require(script.Parent.NonGameCard)

local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local allQuests = require(replicatedStorage.Quest.AllQuests)
local data = require(script.Parent.Data)
local config = require(replicatedStorage.CONFIG)
local playerGuiHistoryChamberQuests = PlayerGui.HistoryChamberQuests
local questHolder = playerGuiHistoryChamberQuests.QuestWindow.QuestHolder
local playerGuiHistoryChamberQuestsClose = playerGuiHistoryChamberQuests.Close
local u15 = nil
local u16 = nil
local t1: {[any]: any} = {
	Easy = "rbxassetid://12220641249",
	Medium = "rbxassetid://12220641380",
	Hard = "rbxassetid://12220641462",
	Insane = "rbxassetid://12220641594",
	Legendary = "rbxassetid://12220641732"
}
local color3 = Color3.fromRGB(162, 162, 162)
local color32 = Color3.fromRGB(122, 208, 109)
local color33 = Color3.fromRGB(77, 198, 198)
local color34 = Color3.fromRGB(240, 125, 225)
local color35 = Color3.fromRGB(255, 186, 75)
local t2 = {
	Easy = color3,
	Medium = color32,
	Hard = color33,
	Insane = color34,
	Legendary = color35
}

t2 = function(p1, p2, p3)
	p1.Bar.Backdrop.Progress.Size = UDim2.fromScale(p2 / p3, 1)
	p1.Bar.Percent.Text = p2 .. "/" .. p3
end

function UpdateData(p4)
	local v30 = networkInvokeServer("GetQuestInfo")

	if p4 then
		repeat
			v30 = networkInvokeServer("GetQuestInfo")
		until v30
	end

	u15 = v30[1]
	u16 = v30[2]
	data.SetQuestStatsData(u15)
end
local function calculateStatAndAmount(p5, p6)
	local n1 = 0
	local n2 = 0

	if typeof(p6.Stat) == "table" then
		for k, v in pairs(p6.Stat) do
			if not p5[k] then
				p5[k] = 0
			end

			n1 = math.min(p5[k], v) + n1
			n2 = v + n2
		end

		return n1, n2
	end

	return p5[p6.Stat], p6.Amount
end
local function createQuest(name, p8)
	local n1 = 0
	local v40, v41 = calculateStatAndAmount(u15, p8)

	if u16 and u16[name] and v40 then
		n1 = math.min(v40 / v41, 1)
	end

	local clone = questHolder.TemplateQuest:Clone()

	clone.Name = name
	clone.LayoutOrder = p8.DefaultSort
	clone.QuestName.Text = p8.Name
	clone.QuestDesc.Text = p8.Goal

	if p8.Rewards then
		clone.Reward.Visible = true

		if not t1[p8.Difficulty] then
			warn(p8.Name .. " has no proper difficulty")
			p8.Difficulty = "Medium"
		end

		local v43 = config.EVENTCURRENCYIMAGE["History Core"]

		clone.Reward.Misc.Image = "rbxassetid://" .. v43
		clone.Reward.Misc.Visible = true
		clone.Reward.BackgroundColor3 = Color3.fromRGB(60, 40, 60)
		clone.Reward.Misc.ImageColor3 = Color3.fromRGB(75, 75, 75)
		clone.Reward.Label.Text = ""
		clone.Reward.MouseEnter:Connect(function()
			audioService.PlaySound("click2")
		end)
		clone.Reward.MouseButton1Down:Connect(function()
			networkClient.QuickShowRewards(p8.Rewards)
		end)
	end

	if n1 >= 1 or not u16[name][3] and u16[name][1][2] ~= -1 then
		clone.Bar.Visible = false

		if u16[name] and not u16[name][3] then
			connection = clone.Complete
			connection.Visible = true
			connection = clone.Reward
			connection.BackgroundColor3 = Color3.fromRGB(170, 50, 170)
			connection = clone.Reward
			connection = connection.Misc
			connection.ImageColor3 = Color3.fromRGB(255, 255, 255)
			connection = clone.Complete
			connection.Text = "Completed!" .. (p8.Unlocks and " [Unlocked: " .. allQuests.Progression[p8.Unlocks].Name .. "]" or "")
		else
			if not p8.CantRedeem then
				clone.Redeem.Visible = true
			end

			clone.LayoutOrder = p8.DefaultSort

			local connection = nil

			connection = clone.Redeem.MouseButton1Click:Connect(function()
				if networkInvokeServer("QuestAward", name) and p8.Rewards then
					clone.Redeem.Visible = false
					clone.Complete.Visible = true
					clone.Complete.Text = "Completed!" .. (p8.Unlocks and " [Unlocked: " .. allQuests.Progression[p8.Unlocks].Name .. "]" or "")
					clone.Reward.BackgroundColor3 = Color3.fromRGB(170, 50, 170)
					clone.Reward.Misc.ImageColor3 = Color3.fromRGB(255, 255, 255)
					networkClient.ShowRewards(p8.Rewards)
					connection:Disconnect()
				end
			end)
		end
	else
		connection = v40 / v41
		clone.Bar.Backdrop.Progress.Size = UDim2.fromScale(connection, 1)
		clone.Bar.Percent.Text = v40 .. "/" .. v41
		connection = clone.Bar
		connection.Visible = true
	end

	clone.Visible = true

	return clone
end
function networkClient.OpenHCQ()
	UpdateData()

	for _, v in pairs(questHolder.ActualHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(allQuests.Progression) do
		if not v.Requirement or u16[v.Requirement] and u16[v.Requirement][1][2] ~= -1 and not u16[v.Requirement][3] then
			local v48 = createQuest(k, v)

			v48.Parent = questHolder.ActualHolder
		end
	end

	playerGuiHistoryChamberQuestsClose.BackgroundTransparency = 1
	animation.AnimateAsync(playerGuiHistoryChamberQuestsClose, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
	playerGuiHistoryChamberQuests.Enabled = true
end

playerGuiHistoryChamberQuestsClose.MouseButton1Click:Connect(function()
	playerGuiHistoryChamberQuests.Enabled = false
end)

return {}
