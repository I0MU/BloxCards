



local module: {[any]: any} = {}
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local animation = require(replicatedStorage.Animation)
local transition = require(script.Parent.Parent.Transition)
local network = require(script.Parent.Parent.Network)
local networkClient = network.client
local audioService = require(replicatedStorage.AudioService)
local handy = require(script.Parent.Parent.Handy)
local data = require(script.Parent.Parent.Data)
local spr = require(replicatedStorage.spr)
local raidMenu = require(script.Parent.Parent.RaidMenu)
local umberlordMenu = require(script.Parent.Parent.UmberlordMenu)
local simulatorMenu = require(script.Parent.Parent.SimulatorMenu)
local utils = require(game.ReplicatedStorage.Utils)
local storyProgress = require(script.Parent.Parent.StoryProgress)
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local historyChamber = LocalPlayer.PlayerGui:WaitForChild("HistoryChamber")

historyChamber:WaitForChild("Window")

function networkClient.ReturnToRunMenu(p1)
	module[p1]()
end
local function isTestServer()
	return utils.IsPBE() or game.PlaceId == 5932060432
end

local legacyContent = historyChamber:WaitForChild("LegacyContent")
local legacyContentWorldSelector = legacyContent.WorldSelector
local challengeSelect = historyChamber:WaitForChild("ChallengeSelect")
local challengeSelectChallengeSelector = challengeSelect.ChallengeSelector
local color3 = Color3.fromRGB(184, 60, 255)
local color32 = Color3.fromRGB(255, 202, 44)
local color33 = Color3.fromRGB(191, 69, 13)
local color34 = Color3.fromRGB(173, 18, 18)
local color35 = Color3.fromRGB(82, 173, 22)
local color36 = Color3.fromRGB(38, 17, 48)

local function ShowPlaceDetails(p4, p5, p6)
	local newPlace = PlayerGui.VisGui.NewPlace

	newPlace.Title.Text = p4
	newPlace.Subtitle.Text = p5
	newPlace.Author.Text = p6

	for _, v in pairs(newPlace:GetChildren()) do
		v.TextTransparency = 1
		task.spawn(function()
			animation.Animate(v, { TextTransparency = 0 }, 0.8, "Out", "Quint")
			task.wait(1)
			animation.Animate(v, { TextTransparency = 1 }, 0.8, "In", "Quint")
		end)
	end

	task.spawn(function()
		newPlace.Visible = true
		task.wait(2.5)
		newPlace.Visible = false
	end)
end
local function TeleportMachine(p7, p8, p9, p10, p11)
	transition.ToggleBlackColor(Color3.fromRGB(255, 255, 255))
	audioService.PlaySound(p11)
	transition.ToggleBlack(1, 0.5)
	transition.HideBattleBack()
	LocalPlayer.Character:SetPrimaryPartCFrame(p10)
	historyChamber.Enabled = false
	transition.ToggleBlack(-1, 0.5)
	ShowPlaceDetails(p7, p8, p9)
	transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
	handy.Show()
	handy.Expand()
end

legacyContentWorldSelector.LunarImpact.MouseButton1Click:Connect(function()
	legacyContent.Visible = false
	TeleportMachine("Javion", "Lunar Impact Site", "", replicatedStorage.CaishenTeleport.CFrame, "Teleport")
end)
legacyContentWorldSelector.TemporalHalo.MouseButton1Click:Connect(function()
	legacyContent.Visible = false
	TeleportMachine("The Temporal Halo", "???", "", replicatedStorage.TemporalHaloTeleport.CFrame, "Teleport")
end)
legacyContent.MouseButton1Click:Connect(function()
	legacyContent.Visible = false
end)
module["Legacy Worlds"] = function()
	legacyContent.Visible = true
end

local t2: {[any]: any} = {
	["Zanzel, Perfected"] = { Name = "Zanzel, Perfected", Color = color3, Order = 5, Icon = "" },
	Telamon = {
		Name = "Telamon",
		Color = color32,
		Requirement = "FinishAct1",
		RequirementAmount = 1,
		RequirementText = "Locked: Complete Story Act 1",
		Order = 0,
		Icon = ""
	},
	Wraiths = {
		Name = "Wraiths of Injustice",
		Color = color33,
		Requirement = "BOT_WINS_DS2S_Injustice",
		RequirementAmount = 1,
		RequirementText = "Locked: Complete Doomspire Act 2: Chapter 7",
		Order = 1,
		Icon = ""
	},
	Invasion = {
		Name = "Imperium Invasion",
		Color = color34,
		Requirement = "BOT_WINS_DS2S_Invasion",
		RequirementAmount = 1,
		RequirementText = "Locked: Complete Doomspire Act 2: Chapter 11",
		Order = 2,
		Icon = ""
	},
	Deidre = {
		Name = "Vengeful Machine",
		Color = color35,
		Requirement = "BOT_WINS_DS2S_Deidre",
		RequirementAmount = 1,
		RequirementText = "Locked: Complete Doomspire Act 2: Chapter 12",
		Order = 3,
		Icon = ""
	},
	["The Grand Overseer"] = {
		Name = "The Grand Overseer",
		Color = color36,
		Requirement = "BOT_WINS_DS2S_Nyarl1",
		RequirementAmount = 1,
		RequirementText = "Locked: Complete Doomspire Act 2: Chapter 13",
		Order = 4,
		Icon = ""
	}
}

local function LoadChallenges()
	for _, v in pairs(challengeSelectChallengeSelector:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end

	networkClient.UpdateStatsData()

	local v65 = data.GetQuestStats()

	print(v65)

	for _, v in pairs(t2) do
		local clone = challengeSelect.Templates.TemplateChallenge:Clone()

		clone.Parent = challengeSelectChallengeSelector
		clone.Name = v.Name

		if v.Requirement and (not v65 or v65[v.Requirement] < v.RequirementAmount) then
			clone.TextLabel.Text = v.RequirementText or "Locked"
			clone.BackgroundColor3 = Color3.new(v.Color.R * 0.2, v.Color.G * 0.2, v.Color.B * 0.2)
			clone.LayoutOrder = 9999
		else
			clone.TextLabel.Text = v.Name
			clone.BackgroundColor3 = v.Color
			clone.LayoutOrder = v.Order or 0
		end

		clone.Visible = true
		clone.MouseButton1Click:Connect(function()
			if v.Requirement and (not v65 or v65[v.Requirement] < v.RequirementAmount) then
				audioService.PlaySound("DeniedSound")

				return
			end

			challengeSelect.Visible = false
			raidMenu.OpenRaidMenu(v.Name)
			historyChamber.Enabled = false
		end)
	end
end

LoadChallenges()
challengeSelect.MouseButton1Click:Connect(function()
	challengeSelect.Visible = false
end)
module["Challenge Battles"] = function()
	LoadChallenges()
	challengeSelect.Visible = true
end

function module.Doomspire()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	historyChamber.Enabled = false
	networkClient.OpenDoomspireRaids(true)
end

module["Umberlords Trial"] = function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	historyChamber.Enabled = false
	transition.ToggleBlack(1, 0.3)
	transition.HideBattleBack()
	umberlordMenu.OpenMenu()
end
module["Battle Simulator"] = function()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	networkClient.UpdateStatsData()

	if data.GetQuestStats().FinishAct1 == 0 then
		networkClient.WarningMsg("You must complete Act 1 of the main story to access this!")

		return
	end

	historyChamber.Enabled = false
	transition.ToggleBlack(1, 0.3)
	transition.HideBattleBack()
	simulatorMenu.OpenMenu()
end
module["Quantum Quandary"] = function()
	networkClient.UpdateStatsData()

	local v69 = data.GetQuestStats()

	if not (v69.StoryProgress2 >= 1) then
		audioService.PlaySound("GAMESTART")
		historyChamber.Enabled = false
		transition.ToggleBlack(1, 0.3)
		transition.HideBattleBack()
		task.wait(1)
		storyProgress[v69.StoryProgress]()

		return
	end

	if v69.SideQuestProgress >= 3 then
		audioService.PlaySound("GAMESTART")
		historyChamber.Enabled = false
		transition.ToggleBlack(1, 0.3)
		transition.HideBattleBack()
		task.wait(1)
		storyProgress[4]()

		return
	end

	networkClient.WarningMsg("No timeline to travel to!")
end

local modes = require(replicatedStorage.RogueStuff.Modes)
local startingTreasures = modes["City Trek"].StartingTreasures
local cityTrekMenu = LocalPlayer.PlayerGui.CityTrekMenu
local cityTrekMenuCityTrekMenu = cityTrekMenu.CityTrekMenu
local u38 = nil
local u39 = nil
local u40 = nil
local u41 = nil
local u42: boolean = false

local function UpdateStartButton()
	if u38 and u40 then
		cityTrekMenuCityTrekMenu.StartButton.BackgroundColor3 = Color3.fromRGB(85, 205, 85)
		u42 = true
	end
end

for k, v in pairs(modes["City Trek"].Characters) do
	local clone = cityTrekMenu.Templates.CharacterTemplate:Clone()

	clone.Parent = cityTrekMenuCityTrekMenu.CharacterHolder
	clone.CharacterPortrait.Image = v.VNData.Images[1]
	clone.CharacterName.Text = v.Name
	clone.BackgroundColor3 = v.Color
	clone.LayoutOrder = v.LayoutOrder
	clone.MouseEnter:Connect(function()
		cityTrekMenuCityTrekMenu.CharacterTitle.Text = v.Name
		cityTrekMenuCityTrekMenu.CharacterSubtitle.Text = v.Subtitle
		audioService.PlaySound("click_001")
		clone.CharacterPortrait.ImageRectOffset = Vector2.new(0, 512)
	end)
	clone.MouseLeave:Connect(function()
		if clone == u39 then
			clone.CharacterPortrait.ImageRectOffset = Vector2.new(512, 512)
		else
			clone.CharacterPortrait.ImageRectOffset = Vector2.new(0, 0)
		end

		cityTrekMenuCityTrekMenu.CharacterTitle.Text = cityTrekMenuCityTrekMenu.CharacterTitle.SelectedText.Value
		cityTrekMenuCityTrekMenu.CharacterSubtitle.Text = cityTrekMenuCityTrekMenu.CharacterSubtitle.SelectedText.Value
	end)
	clone.MouseButton1Click:Connect(function()
		if u39 then
			u39.CharacterPortrait.ImageRectOffset = Vector2.new(0, 0)
			u39.UIStroke.Enabled = false
		end

		u39 = clone
		u38 = k
		cityTrekMenuCityTrekMenu.CharacterTitle.Text = v.Name
		cityTrekMenuCityTrekMenu.CharacterSubtitle.Text = v.Subtitle
		cityTrekMenuCityTrekMenu.CharacterTitle.SelectedText.Value = v.Name
		cityTrekMenuCityTrekMenu.CharacterSubtitle.SelectedText.Value = v.Subtitle
		audioService.PlaySound("character select")
		u39.UIStroke.Transparency = 1
		u39.UIStroke.Enabled = true

		if u38 and u40 then
			cityTrekMenuCityTrekMenu.StartButton.BackgroundColor3 = Color3.fromRGB(85, 205, 85)
			u42 = true
		end

		animation.Animate(u39.UIStroke, { Transparency = 0 }, 0.5, "Out", "Quart")
	end)
	clone.Name = v.Name
	clone.Visible = true
end

for k, v in pairs(startingTreasures) do
	local clone2 = cityTrekMenu.Templates.StartingGearTemplate:Clone()

	clone2.Parent = cityTrekMenuCityTrekMenu.StartingGearHolder
	clone2.Image = v.Icon
	clone2.LayoutOrder = v.LayoutOrder
	clone2.MouseEnter:Connect(function()
		cityTrekMenuCityTrekMenu.StartingGearTitle.Text = v.Name
		cityTrekMenuCityTrekMenu.StartingGearSubtitle.Text = v.Description
		audioService.PlaySound("click_001")
	end)
	clone2.MouseLeave:Connect(function()
		cityTrekMenuCityTrekMenu.StartingGearTitle.Text = cityTrekMenuCityTrekMenu.StartingGearTitle.SelectedText.Value
		cityTrekMenuCityTrekMenu.StartingGearSubtitle.Text = cityTrekMenuCityTrekMenu.StartingGearSubtitle.SelectedText.Value
	end)
	clone2.MouseButton1Click:Connect(function()
		if u41 then
			u41.UIStroke.Enabled = false
		end

		u41 = clone2
		u40 = k
		cityTrekMenuCityTrekMenu.StartingGearTitle.Text = v.Name
		cityTrekMenuCityTrekMenu.StartingGearTitle.SelectedText.Value = v.Name
		cityTrekMenuCityTrekMenu.StartingGearSubtitle.Text = v.Description
		cityTrekMenuCityTrekMenu.StartingGearSubtitle.SelectedText.Value = v.Description
		audioService.PlaySound("button.wav")
		u41.UIStroke.Transparency = 1
		u41.UIStroke.Enabled = true

		if u38 and u40 then
			cityTrekMenuCityTrekMenu.StartButton.BackgroundColor3 = Color3.fromRGB(85, 205, 85)
			u42 = true
		end

		animation.Animate(u41.UIStroke, { Transparency = 0 }, 0.5, "Out", "Quart")
	end)
	clone2.Visible = true
end

cityTrekMenuCityTrekMenu.StartButton.MouseButton1Click:Connect(function()
	if not u42 then
		return
	end

	u42 = false
	audioService.PlaySound("GAMESTART")
	task.wait(1)
	transition.ToggleBlack(1, 0.3)
	transition.HideBattleBack()
	cityTrekMenu.Enabled = false
	u42 = true
	network.FireServer("StartNewRogueRun", "City Trek", u38, u40)
end);
(function(p2, p3)
	for _, v in pairs(p2) do
		local vSize = v.Size

		v.MouseEnter:Connect(function()
			audioService.PlaySound(p3)
			spr.stop(v)

			local sprTarget = spr.target
			local v79 = UDim2.fromScale(vSize.X.Scale * 1.05, vSize.Y.Scale * 1.05)

			sprTarget(v, 0.5, 8, { Size = v79 })
		end)
		v.MouseLeave:Connect(function()
			spr.stop(v)
			spr.target(v, 0.5, 8, { Size = vSize })
		end)
	end
end)({ cityTrekMenuCityTrekMenu.Exit, cityTrekMenuCityTrekMenu.StartButton }, "click_001")
cityTrekMenuCityTrekMenu.Exit.MouseButton1Click:Connect(function()
	if game:GetService("ReplicatedStorage"):FindFirstChild("ReservedServer") then
		cityTrekMenu.Enabled = false
		network.FireServer("RunTeleportBack")

		return
	end

	cityTrekMenu.Enabled = false
	transition.ToggleBlack(1, 0.3)
	historyChamber.Enabled = true
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	audioService.Revert()
end)

local function UpdateCityTrekCharacterBadges()
	local v75 = network.InvokeServer("GetQuestInfo")[1]

	for _, v in pairs(cityTrekMenuCityTrekMenu.CharacterHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			if v75["Run_City Trek_RunsCompleted_" .. v.Name] > 0 then
				v.CompletionBadge.BackgroundTransparency = 0
				v.CompletionBadge.ImageLabel.ImageTransparency = 0
				v.CompletionBadge.UIStroke.Enabled = true
			end

			if v75["Run_City Trek_RunsCompletedHardcore_" .. v.Name] > 0 then
				v.HardcoreBadge.BackgroundTransparency = 0
				v.HardcoreBadge.ImageLabel.ImageTransparency = 0
				v.HardcoreBadge.UIStroke.Enabled = true
			end
		end
	end
end

module["City Trek"] = function()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	historyChamber.Enabled = false

	if data.AllRunData()["City Trek"] then
		transition.HideBattleBack()
		network.FireServer("RunTeleportPlayer", "City Trek")

		return
	end

	UpdateCityTrekCharacterBadges()
	audioService.ChangeSong("City Trek Menu")
	cityTrekMenu.Enabled = true
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
module["Restart Act 2 Quest"] = function()
	if data.GetQuestStats().StoryProgress2 >= 1 then
		network.InvokeServer("ResetQuest", "SideQuestProgress")
		networkClient.WarningMsg("Restarted progress!")

		return
	end

	networkClient.WarningMsg("Haven't gotten there yet!")
end

return module
