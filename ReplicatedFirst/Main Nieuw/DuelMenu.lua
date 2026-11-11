



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
require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local duelMenu = LocalPlayer.PlayerGui:WaitForChild("DuelMenu")
local window = duelMenu:WaitForChild("Window")
local templates = window.Parent.Templates
local u17 = nil
local u18: boolean = false

local function SetupDuelMenu(p1)
	local v24 = networkInvokeServer("GetBots")

	networkClient.UpdateStatsData()

	local v25 = data.GetQuestStats()

	for _, v in pairs(window.BotSelect:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for k, v in pairs(v24) do
		if v.Info and v.Info.BotCategory and p1 == v.Info.BotCategory and (v25["BOT_WINS_" .. k] and v25["BOT_WINS_" .. k] > 0 or p1 == "Queue") then
			print("Meets bot condition")

			local clone = templates.TemplateBotButton:Clone()

			clone.Name = k
			clone.BotName.Text = v.Info.Name
			clone.Parent = window.BotSelect

			if not v.Info.Level then
				clone.LevelIndicator.Visible = false
			elseif v.Info.MaxLevel then
				local level = clone.LevelIndicator.Level
				local text: string = tostring(v.Info.Level)
				local text2: string = tostring(v.Info.MaxLevel)

				level.Text = "Lvl " .. text .. "-" .. text2
			else
				clone.LevelIndicator.Level.Text = "Lvl " .. tostring(v.Info.Level)
			end

			if v.Info.Color then
				clone.BackgroundColor3 = v.Info.Color
			end

			if v.Info.BotIcon then
				clone.Icon.Image = "rbxassetid://" .. v.Info.BotIcon
			end

			clone.MouseButton1Click:Connect(function()
				if u18 then
					return
				end

				u18 = true
				audioService.PlaySound("click1")

				local name = v.Info.Name
				local text: string = tostring(LocalPlayer.userId)

				network.FireServer("RequestBattle", {
					Parent = true,
					QuickIntro = true,
					Name = name,
					userId = -999999 - text,
					Duelist = k
				})
				duelMenu.Enabled = false
				window.Visible = false
				transition.HideBattleBack()
				task.wait(1)
				u18 = false
			end)
			clone.Visible = true
		end
	end
end
local function HideDuelMenu()
	if duelMenu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	duelMenu.Enabled = false
	window.Visible = false
	u17 = nil
	window.Start.Visible = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
end

for _, v in pairs(window.BotTypes:GetChildren()) do
	if v:IsA("GuiObject") then
		v.MouseButton1Click:Connect(function()
			audioService.PlaySound("click1")
			SetupDuelMenu(v.Name)
		end)
	end
end

window.Exit.MouseButton1Click:Connect(HideDuelMenu)

return {
	OpenDuelMenu = function(p2)
		if not handy.Visible then
			return
		end

		audioService.PlaySound("click1")
		task.spawn(handy.Hide)
		transition.ToggleBlack(1, 0.3)
		transition.ShowBattleBack()
		SetupDuelMenu(p2)
		duelMenu.Enabled = true
		window.Visible = true
		transition.ToggleBlack(-1, 0.3)
	end,
	HideDuelMenu = HideDuelMenu
}
