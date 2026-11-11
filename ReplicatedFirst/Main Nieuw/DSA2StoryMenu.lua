



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
game:GetService("RunService")
require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client

require(game.ReplicatedStorage.CardLibrary)
require(game.ReplicatedStorage.Maid)
require(game.ReplicatedStorage.FoilEffect)
require(script.Parent.NonGameCard)

local sleeves = require(script.Parent.Sleeves).sleeves

require(game.ReplicatedStorage.Packs)
require(game.ReplicatedStorage.CONFIG)
require(script.Parent.Contextualize)
require(script.Parent.RobuxService)

local act2StoryStages = require(replicatedStorage.DoomspireRelated.Act2StoryStages)
local creditsHandler = require(script.Parent.CreditsHandler)

require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local dsa2Menu = LocalPlayer.PlayerGui:WaitForChild("DSA2Menu")
local menuHolder = dsa2Menu:WaitForChild("MenuHolder")
local templates = menuHolder.Parent.Templates
local s1 = ""
local u20 = nil
local u21: boolean = false

local function SetupStoryMenu()
	local battleback: Instance = workspace:FindFirstChild("Battleback")
	local backgroundTriggers = nil

	if battleback and battleback:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(battleback.BackgroundTriggers)
	end

	networkClient.UpdateStatsData()
	u20 = nil

	local v28 = data.GetQuestStats()

	for _, v in pairs(menuHolder.StoryHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(act2StoryStages) do
		if v.Requirement and (not v28[v.Requirement] or v28[v.Requirement] <= 0) then
			local clone = templates.TemplateLockedButton:Clone()

			clone.Parent = menuHolder.StoryHolder
			clone.MouseButton1Click:Connect(function()
				audioService.PlaySound("click3")
			end)
			clone.Name = k
			clone.LayoutOrder = v.Order
			clone.Visible = true
		else
			local clone

			if v.Type == "Story" or v.Type == "Credits" then
				clone = templates.TemplateStoryButton:Clone()
			else
				clone = templates.TemplateBattleButton:Clone()
			end

			clone.Name = k
			clone.BotName.Text = v.Name
			clone.Parent = menuHolder.StoryHolder
			clone.MouseButton1Click:Connect(function()
				if u21 then
					return
				end

				u21 = true
				audioService.PlaySound("click1")
				u20 = k

				if backgroundTriggers and type(backgroundTriggers.MoveStoryCamera) == "function" then
					backgroundTriggers.MoveStoryCamera(v.Location)
				end

				task.spawn(function()
					while u20 == k do
						if clone and clone.UIStroke.Transparency ~= 0 then
							clone.UIStroke.Transparency = 0
						end

						task.wait(0.1)
					end

					if clone then
						clone.UIStroke.Transparency = 1
					end
				end)
				task.wait(0.5)
				u21 = false
			end)
			clone.LayoutOrder = v.Order
			clone.Visible = true
		end
	end

	local children = menuHolder.StoryHolder:GetChildren()

	menuHolder.StoryHolder.CanvasSize = UDim2.new(0, 0, #children / 7, 0)
end
local function openDSA2StoryMenu()
	if networkClient.IsSubPlayer() then
		transition.ToggleBlack(1, 0.3)
		dsa2Menu.Enabled = false
		transition.HideBattleBack()
		transition.ToggleBlack(-1, 0.3)
		audioService.ChangeSong("Lobby")
		handy.Show()

		return
	end

	task.spawn(handy.Hide)
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack("DS2Story")
	transition.ChangeBattleBackground("DS2Story")
	SetupStoryMenu()
	dsa2Menu.Enabled = true
	menuHolder.Visible = true
	task.spawn(function()
		audioService.ChangeSong("DS2Title", { TimePosition = 0 })
	end)
	transition.ToggleBlack(-1, 0.3)
end

networkClient.OpenDSA2StoryMenu = openDSA2StoryMenu

local function HideDSA2StoryMenu()
	if dsa2Menu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	dsa2Menu.Enabled = false
	u20 = nil
	transition.ChangeBattleBackground("LoomingSpire")
	networkClient.OpenDoomspireRaids()
end
local function StartStoryChapter(p1)
	local v37 = act2StoryStages[p1]

	if v37.Type ~= "Battle" then
		if v37.Type == "Story" then
			transition.ToggleBlack(1, 0.3)
			dsa2Menu.Enabled = false

			local networkClientStartVNScene = networkClient.StartVNScene
			local text: string = tostring(v37.Scene)

			networkClientStartVNScene("DS2_" .. text)

			if not v37.HasBattle and PlayerGui:FindFirstChild("VisGui"):FindFirstChild("IntroNew").Visible ~= true then
				transition.ChangeBattleBackground("DS2Story")
				SetupStoryMenu()
				transition.ToggleBlack(-1, 0.3)

				return
			end
		elseif v37.Type == "Credits" then
			transition.ToggleBlack(1, 0.3)
			dsa2Menu.Enabled = false
			creditsHandler.PlayCredits()
		end

		return
	end

	if u21 then
		return
	end

	u21 = true
	audioService.PlaySound("click1")

	local name = v37.FightName or ""
	local text: string = tostring(LocalPlayer.userId)
	local text2: string = tostring(v37.Scene)

	network.FireServer("RequestBattle", {
		Parent = true,
		QuickIntro = true,
		Name = name,
		userId = -999999 - text,
		Duelist = "DS2S_" .. text2
	})
	dsa2Menu.Enabled = false
	menuHolder.Visible = false
	transition.HideBattleBack()
	task.wait(1)
	u21 = false
end

menuHolder.Start.MouseButton1Click:Connect(function()
	if u20 == nil or not act2StoryStages[u20] then
		return
	end

	if u20 == "VN13" or u20 == "Nyarlhotep" then
		networkClient.UpdateStatsData()

		local v43 = data.GetQuestStats()

		if v43.BOT_PLAYS_DS2S_Nyarl1 and v43.BOT_PLAYS_DS2S_Nyarl1 ~= 0 then
			StartStoryChapter(u20)

			return
		end

		dsa2Menu.FinaleWarning.Visible = true
		s1 = u20

		return
	end

	StartStoryChapter(u20)
end)
dsa2Menu.FinaleWarning.Deny.MouseButton1Click:Connect(function()
	dsa2Menu.FinaleWarning.Visible = false
end)
dsa2Menu.FinaleWarning.Confirm.MouseButton1Click:Connect(function()
	dsa2Menu.FinaleWarning.Visible = false
	StartStoryChapter(s1)
end)
dsa2Menu.Title.Back.MouseButton1Click:Connect(HideDSA2StoryMenu)

return {
	OpenDSA2StoryMenu = openDSA2StoryMenu,
	HideDSA2StoryMenu = HideDSA2StoryMenu
}
