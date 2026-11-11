



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
game:GetService("RunService")
require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)

require(script.Parent.Data)

local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
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

require(game.ReplicatedStorage.Maid)
require(game.ReplicatedStorage.FoilEffect)

local nonGameCard = require(script.Parent.NonGameCard)
local sleeves = require(script.Parent.Sleeves).sleeves

require(game.ReplicatedStorage.Packs)

local config = require(game.ReplicatedStorage.CONFIG)

require(script.Parent.Contextualize)
require(script.Parent.RobuxService)

local weeklySimulatorRewards = require(game.ReplicatedStorage.SimulatorMode.WeeklySimulatorRewards)
local effects = require(game.ReplicatedStorage.Effects)
local v16 = require(game.ReplicatedStorage.Maid).new()

require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local battleSimMenu = LocalPlayer.PlayerGui:WaitForChild("BattleSimMenu")
local menuHolder = battleSimMenu:WaitForChild("MenuHolder")
local templates = menuHolder.Parent.Templates

local function ConvertSecondsToStringDaysHoursMinutes(p1)
	if p1 >= 86400 then
		local floored = math.floor(p1 / 86400)
		local floored2 = math.floor(p1 % 86400 / 3600)

		return floored .. " Days " .. floored2 .. " Hours"
	end

	local floored = math.floor(p1 / 3600)
	local floored3 = math.floor(p1 % 3600 / 60)

	return floored .. " Hours " .. floored3 .. " Minutes"
end
local function UpdateMenu()
	local v30 = networkInvokeServer("GetQuestInfo")
	local weekModifiers = v30[9].WeekModifiers
	local weekEncounters = v30[9].WeekEncounters
	local stageReached = v30[9].StageReached
	local currentStage = v30[9].CurrentStage

	print(v30[9])
	v16:DoCleaning()

	for _, v in pairs(menuHolder.WeeklyRewards:GetChildren()) do
		if v:IsA("Frame") then
			local parts = string.split(v.Name, "Battle")
			local numberValue: number? = tonumber(parts[2])

			if stageReached >= numberValue and not v30[9].WeekRedeemed[numberValue] then
				v.Reward.BackgroundColor3 = Color3.fromRGB(117, 221, 124)
				v16:GiveTask(v.Reward.Button.MouseButton1Click:Connect(function()
					if networkInvokeServer("RedeemSimStageReward", numberValue) then
						UpdateMenu()
					end
				end))

				local timestamp = tick()
				local runService: RunService = game:GetService("RunService")

				v16:GiveTask(runService.RenderStepped:Connect(function()
					if tick() - timestamp > 1 and battleSimMenu.Enabled == true then
						timestamp = tick()
						effects.Pulse(battleSimMenu.Effect, nil, v.Reward.Button)
					end
				end))
			else
				v16:GiveTask(v.Reward.Button.MouseButton1Click:Connect(function()
					networkClient.QuickShowRewards(weeklySimulatorRewards[numberValue])
				end))

				if stageReached >= numberValue then
					v.Reward.IsClaimed.Visible = true
					v.Reward.BackgroundColor3 = Color3.fromRGB(10, 36, 74)
				else
					v.Reward.IsClaimed.Visible = false
					v.Reward.BackgroundColor3 = Color3.fromRGB(35, 123, 255)
				end
			end

			v.EnemyName.Text = weekEncounters[numberValue].EncounterName
			v.EnemyImage.Image = "rbxassetid://" .. tostring(weekEncounters[numberValue].EncounterImage)

			local v41 = cardLibrary[weekModifiers[numberValue]]

			if not v41 then
				warn("Mod does not exist as a card")

				return
			end

			v.ModFrame.Card.Image = "rbxassetid://" .. tostring(v41.Id)
			nonGameCard.BindInspect(v.ModFrame.Card, v41)
			v16:GiveTask(v.Start.MouseEnter:Connect(function()
				audioService.PlaySound("click2")
			end))

			if currentStage == numberValue - 1 then
				v.Start.Text = "Start Battle!"
				v.Start.BackgroundColor3 = Color3.fromRGB(42, 221, 78)
				v.Start.Frame.BackgroundColor3 = Color3.fromRGB(7, 89, 33)
				v16:GiveTask(v.Start.MouseButton1Click:Connect(function()
					audioService.PlaySound("click1")

					if networkInvokeServer("CheckDeckLegality", LocalPlayer, "SimMode") then
						local encounterName = weekEncounters[numberValue].EncounterName
						local text: string = tostring(LocalPlayer.userId)

						network.FireServer("RequestBattle", {
							Parent = true,
							QuickIntro = true,
							Name = encounterName,
							userId = -999999 - text,
							Duelist = weekEncounters[numberValue].Duelist,
							SimulationBattle = numberValue,
							ExtraData = { CustomBack = "BattleSimulator" }
						})
						battleSimMenu.Enabled = false
						transition.HideBattleBack()
						task.spawn(function()
							task.wait(10)

							if PlayerGui.VisGui.BattleNew.Visible == false then
								handy.Show()
							end
						end)
					end
				end))
				v.Reset.Visible = false
			elseif currentStage >= numberValue then
				v.Start.Text = "Completed!"
				v.Start.BackgroundColor3 = Color3.fromRGB(48, 53, 46)
				v.Start.Frame.BackgroundColor3 = Color3.fromRGB(25, 30, 24)
				v.Reset.Visible = true
				v16:GiveTask(v.Reset.MouseButton1Click:Connect(function()
					audioService.PlaySound("click1")

					if networkInvokeServer("ResetSimProgress", numberValue) then
						UpdateMenu()
					end
				end))
			else
				v.Start.Text = "Locked"
				v.Start.BackgroundColor3 = Color3.fromRGB(221, 42, 45)
				v.Start.Frame.BackgroundColor3 = Color3.fromRGB(221, 42, 45)
				v.Reset.Visible = false
			end
		end
	end

	local n1 = config.FIRST_TICK + config.WEEKLY_RESET_TICK * (v30[3].LastLoginWeek + 1)
	local menuHolderNextWeekTimer = menuHolder.NextWeekTimer
	local timestamp = os.time()
	local n2 = n1 - timestamp
	local s1

	if n2 >= 86400 then
		local floored = math.floor(n2 / 86400)
		local floored4 = math.floor(n2 % 86400 / 3600)

		s1 = floored .. " Days " .. floored4 .. " Hours"
	else
		local floored = math.floor(n2 / 3600)
		local floored5 = math.floor(n2 % 3600 / 60)

		s1 = floored .. " Hours " .. floored5 .. " Minutes"
	end

	menuHolderNextWeekTimer.Text = "New Simulation in: " .. s1
end
local function HideMenu()
	if battleSimMenu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	battleSimMenu.Enabled = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
end

battleSimMenu.ExplanationFrame.Deckbuilder.MouseButton1Click:Connect(function()
	if battleSimMenu.Enabled == false then
		return
	end

	battleSimMenu.Enabled = false
	networkClient.OpenDeckbuilder("Simulator")
end)
battleSimMenu.Title.Back.MouseButton1Click:Connect(HideMenu)

return {
	OpenMenu = function()
		audioService.PlaySound("click1")
		task.spawn(handy.Hide)
		UpdateMenu()
		transition.ToggleBlack(1, 0.3)
		transition.ShowBattleBack("BattleSimulator")
		audioService.ChangeSong("BattleSimMenu")
		battleSimMenu.Enabled = true
		transition.ToggleBlack(-1, 0.3)
	end,
	HideMenu = HideMenu
}
