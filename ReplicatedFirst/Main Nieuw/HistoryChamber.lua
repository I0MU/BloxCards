



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")

local animation = require(replicatedStorage.Animation)
local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkClient = network.client
local contextualize = require(script.Parent.Contextualize)
local storyProgress = require(script.Parent.StoryProgress)
local maid = require(replicatedStorage.Maid)
local utils = require(game.ReplicatedStorage.Utils)
local networkInvokeServer = network.InvokeServer
local teleportService: TeleportService = game:GetService("TeleportService")
local spr = require(replicatedStorage.spr)
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local historyChamber = LocalPlayer.PlayerGui:WaitForChild("HistoryChamber")
local window = historyChamber:WaitForChild("Window")
local startWindow = historyChamber:WaitForChild("StartWindow")
local templates = window.Parent.Templates

local function isTestServer()
	return utils.IsPBE() or game.PlaceId == 5932060432
end

local worlds = require(replicatedStorage.Worlds)
local n1: number = 1

local function Select(p1: number)
	if p1 > #worlds + 1 then
		p1 = 1
	end

	if p1 <= 0 then
		p1 = #worlds + 1
	end

	local v39 = worlds[p1]

	if p1 ~= #worlds + 1 then
		window.StoryTitle.Text = v39.Name
		window.StorySubTitle.Text = v39.Subtitle
		window.Travel.Visible = true
	else
		window.StoryTitle.Text = ""
		window.StorySubTitle.Text = ""
		window.Travel.Visible = false
	end

	local animationAnimateAsync = animation.AnimateAsync
	local windowWorldHolder = window.WorldHolder
	local v42 = UDim2.fromScale((p1 - 1) * -1, 0.45)

	animationAnimateAsync(windowWorldHolder, { Position = v42 }, 0.5, "Out", "Quart")

	local v43 = window.TimelineHolder[n1]
	local animateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(0, 255, 213)

	animateAsync(v43, { BackgroundColor3 = color3 }, 0.5, "Out", "Quart")
	v43.Time.Visible = false
	n1 = p1
	v43 = window.TimelineHolder[n1]

	local v46 = animation.AnimateAsync
	local color32 = Color3.fromRGB(255, 255, 255)

	v46(v43, { BackgroundColor3 = color32 }, 0.5, "Out", "Quart")
	v43.Time.Visible = true

	if not v39 then
		return
	end

	if v39.Run then
		if data.AllRunData()[v39.Run] then
			window.Travel.Text = "Continue"

			return
		end

		window.Travel.Text = "Play"

		return
	end

	window.Travel.Text = "Travel"
end

window.Forward.MouseButton1Click:Connect(function()
	Select(n1 + 1)
	audioService.PlaySound("Draw")
end)
window.Back.MouseButton1Click:Connect(function()
	Select(n1 - 1)
	audioService.PlaySound("Draw")
end)

local u27: boolean = false
local u28: boolean = false

local function openHistoryChamber()
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible then
		return
	end

	if not u28 then
		networkClient.UpdateStatsData()

		if data.GetQuestStats().StoryProgress < 2 then
			networkClient.WarningMsg("Obtain a license to use the History Cannon.")

			return
		end

		u28 = true
	end

	teleportService:SetTeleportGui(replicatedStorage.RunLoadingScreen)
	audioService.PlaySound("click1")
	task.spawn(handy.Hide)
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()

	if not u27 and data.Level() >= 5 then
		u27 = true
		startWindow.HistoryChamber.Requirement.Visible = false
		startWindow.HistoryChamber.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end

	Select(n1)
	historyChamber.Enabled = true
	window.Visible = true
	transition.ToggleBlack(-1, 0.3)
end

networkClient.OpenHistoryChamber = openHistoryChamber

local function HideHistoryChamber()
	if historyChamber.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	historyChamber.Enabled = false
	window.Visible = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
end

startWindow.Exit.MouseButton1Click:Connect(HideHistoryChamber)

local function GoToStart()
	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	window.Visible = false
	startWindow.Visible = true
	transition.ToggleBlack(-1, 0.3)
end

window.Exit.MouseButton1Click:Connect(HideHistoryChamber)
startWindow.HistoryChamber.MouseButton1Click:Connect(function()
	if not u27 then
		audioService.PlaySound("click_002")

		return
	end

	audioService.PlaySound("GAMESTART")
	transition.ToggleBlack(1, 0.3)
	window.Visible = true
	startWindow.Visible = false
	transition.ToggleBlack(-1, 0.3)
end)
startWindow.Story.MouseButton1Click:Connect(function()
	if utils.IsPBE() or game.PlaceId == 5932060432 then
		audioService.PlaySound("GAMESTART")
		historyChamber.Enabled = false
		networkClient.UpdateStatsData()

		local v48 = data.GetQuestStats()

		transition.ToggleBlack(1, 0.3)
		transition.HideBattleBack()
		task.wait(1)
		storyProgress[v48.StoryProgress]()

		return
	end

	networkClient.WarningMsg("Coming soon :)")
end)
startWindow.HistoryCores.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	networkClient.OpenHCQ()
end)
window.HistoryCores.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	networkClient.OpenHCQ()
end)

local travelFunctions = require(script.TravelFunctions)

local function Travel()
	local v49 = worlds[n1]

	if not v49 then
		return
	end

	if travelFunctions[v49.Name] then
		travelFunctions[v49.Name]()
	end
end

local u34: boolean = false

window.Travel.MouseButton1Click:Connect(function()
	if u34 then
		return
	end

	u34 = true
	audioService.PlaySound("click1")

	local v50 = worlds[n1]

	if v50 and travelFunctions[v50.Name] then
		travelFunctions[v50.Name]()
	end

	task.wait(1)
	u34 = false
end);
(function(p2, p3)
	for _, v in pairs(p2) do
		local vSize = v.Size

		v.MouseEnter:Connect(function()
			audioService.PlaySound(p3)
			spr.stop(v)

			local sprTarget = spr.target
			local v69 = UDim2.fromScale(vSize.X.Scale * 1.025, vSize.Y.Scale * 1.025)

			sprTarget(v, 0.5, 8, { Size = v69 })
		end)
		v.MouseLeave:Connect(function()
			spr.stop(v)
			spr.target(v, 0.5, 8, { Size = vSize })
		end)
	end
end)({
	startWindow.HistoryChamber,
	startWindow.HistoryCores,
	startWindow.Story,
	window.Exit,
	window.Travel,
	window.Back,
	window.Forward,
	window.Parent.LegacyContent.WorldSelector.TemporalHalo,
	window.Parent.LegacyContent.WorldSelector.LunarImpact
}, "click_001")
handyHandy.HistoryChamber.MouseEnter:connect(function()
	contextualize(handyHandy.HistoryChamber, "Play through the stories of packs and alternate Single-player game modes!")
end)

local u35 = nil

GoToStart = function(p4)
	networkClient.SetSetSpawn(p4)
end

local storyMaid = maid.new()

networkClient.StoryMaid = storyMaid

local function returnFromStory(p5, p6)
	if not handy.Visible() and not p6 then
		return
	end

	u35 = true

	local u59: boolean = false

	handy.Hide()
	handy.DisableTaskButtons(false)
	networkClient.SetSetSpawn(nil)
	handyHandy.HistoryChamber.Title.Text = "Travel"
	task.spawn(function()
		networkClient.DoHistoryCannonPortalAnimation()
		u59 = true
	end)
	inWorld = false
	storyMaid:Destroy()
	networkInvokeServer("ResetQuest", "NightTime")
	task.wait(0.6)
	transition.SwitchWorldSky("Sky")
	transition.SwitchCurrentLighting("Default")

	if LocalPlayer.Character then
		LocalPlayer.Character:PivotTo(workspace.Spawns.SpawnLocation.CFrame * CFrame.new(0, 2, 0))
	end

	repeat
		task.wait(0.1)
	until u59 == true

	task.spawn(function()
		audioService.SetLobbyTheme("Lobby")
		audioService.ChangeSong("Lobby")
		transition.ToggleBlack(-1, 0.3)
		transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
	end)

	if not p5 then
		handy.Show()
	end

	u35 = false
end

networkClient.ReturnFromStory = returnFromStory

function networkClient.SetStoryData(p7)
	inWorld = true
	handyHandy.HistoryChamber.Title.Text = "Return"
	handy.DisableTaskButtons(true)

	if p7.SpawnLocation then
		networkClient.SetSetSpawn(p7.SpawnLocation)
	end

	if p7.Sky then
		transition.SwitchWorldSky(p7.Sky)
	end

	if p7.LightingProfile then
		transition.SwitchCurrentLighting(p7.LightingProfile)
	end
end

handyHandy.HistoryChamber.MouseButton1Click:Connect(function()
	if u35 then
		return
	end

	if not handy.Visible() then
		return
	end

	if not inWorld then
		openHistoryChamber()

		return
	end

	returnFromStory()
end);
(function()
	local n1: number = #worlds

	for k, v in pairs(worlds) do
		local clone = templates.World:Clone()

		clone.Parent = window.WorldHolder
		clone.LayoutOrder = k
		clone.ImageLabel.Image = v.Image
		clone.Visible = true

		local clone2 = templates.TimelinePoint:Clone()

		clone2.Parent = window.TimelineHolder
		clone2.Visible = true
		clone2.Time.Text = v.Time
		clone2.Name = k
	end

	local clone3 = templates.LastWorld:Clone()

	clone3.Parent = window.WorldHolder
	clone3.LayoutOrder = n1 + 1
	clone3.Visible = true

	local clone4 = templates.TimelinePoint:Clone()

	clone4.Parent = window.TimelineHolder
	clone4.Visible = true
	clone4.Time.Text = "???"
	clone4.Name = n1 + 1
	Select(1)
end)()

return {}
