local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("UserInputService")

local contextActionService: ContextActionService = game:GetService("ContextActionService")
local Camera = workspace.Camera
local data = require(script.Parent.Data)
local quest = require(script.Parent.Quest)

require(script.Parent.Shop)
require(script.Parent.Draft)
require(script.Parent.Rewards)
require(script.Parent.Cutscene)
require(script.Parent.News)
require(script.Parent.HistoryChamber)
require(script.Parent.Movie)

local copyTable = require(replicatedStorage.CopyTable)
local audioService = require(game.ReplicatedStorage.AudioService)

require(script.IconModule)

local messageService = require(script.MessageService)
local messages = require(script.MessageService.Messages)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local animation = require(game.ReplicatedStorage.Animation)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local transition = require(script.Parent.Transition)
local inspection = require(script.Parent.Inspection)
local nonGameCard = require(script.Parent.NonGameCard)
local cardLibrary = require(game.ReplicatedStorage:WaitForChild("CardLibrary"))
local cardLibUpdate = require(game.ReplicatedStorage:WaitForChild("CardLibUpdate"))
local dialog2 = require(script.Parent.Dialog2)
local maid = require(game.ReplicatedStorage.Maid)

require(script.Parent.Stats)
require(script.Parent.Party)
require(script.Parent.ClientAnalytics)

local config = require(replicatedStorage.CONFIG)

require(script.Parent.DoomspireRaids)
require(script.Parent.Settings)
require(script.Parent.SonicMovement)
require(script.Parent.Interactables)

local promise = require(replicatedStorage.Promise)
local scrollListMenu = require(script.Parent.ScrollListMenu)
local umberlordMenu = require(script.Parent.UmberlordMenu)
local simulatorMenu = require(script.Parent.SimulatorMenu)

require(script.Parent.InviteMenu)

local visualNovel = require(replicatedStorage.VisualNovel)
local CurrentCamera: Camera = workspace.CurrentCamera
local cameraModule = require(game.ReplicatedStorage.CameraModule)

local v32 = cameraModule.new(Enum.RenderPriority.Camera.Value, function(p1)
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)

v32:Start()
require(game.ReplicatedStorage.Face)
networkClient.AutoCost = require(game.ReplicatedStorage.AutoCost)

local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local visGui = playerGui:WaitForChild("VisGui")
local visGuiBattleNew = visGui.BattleNew
local v37 = visGui.HandyHolder.PlayerList.ScrollHolder.ScrollBit.Scaler["Ratings Aren't Broken"]

require(script.Parent.allcards)

local visGuiBattleNewHand = visGuiBattleNew.Hand
local visGuiBattleNewEnemyHand = visGuiBattleNew.EnemyHand
local u40: boolean = false

function networkClient.IsTestServer()
	local u113: boolean = true

	if game.PlaceId ~= 7201471205 then
		u113 = true

		if game.PlaceId ~= 7105900056 then
			u113 = game.PlaceId == 76533654173173
		end
	end

	return u113
end

if networkClient.IsTestServer() then
	require(script.TestServer)
end

function CenterPos(p2)
	local uDim2 = UDim2.new(0, p2.AbsolutePosition.X, 0, p2.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p2.AbsoluteSize.X * 0.5, 0, p2.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end

local Character = LocalPlayer.Character

if not Character then
	Character = LocalPlayer.CharacterAdded
	Character = Character:Wait()
end

local humanoid = Character:WaitForChild("Humanoid")
local humanoidRootPart = Character:WaitForChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:connect(function(p3)
	u40 = false
	Character = p3
	humanoid = p3:WaitForChild("Humanoid")
	humanoidRootPart = p3:WaitForChild("HumanoidRootPart")
end)
v37 = function(p4, p5, p6, p7, p8, p9)
	local tweenInfo = TweenInfo.new(p8, Enum.EasingStyle[p9], Enum.EasingDirection.Out)
	local v125: Tween = game:GetService("TweenService"):Create(p4, tweenInfo, { [p5] = p7 })

	p4[p5] = p6
	v125:Play()
	v125.Completed:Wait()
	v125:Destroy()
end

local visGuiDiscardHere = visGui.DiscardHere
local reminder: BoolValue = Instance.new("BoolValue")

reminder.Parent = visGuiBattleNew.VirtualBaseplate
reminder.Name = "Reminder"
reminder.Value = false

function networkClient.ReminderVisibility(p10)
	visGuiBattleNew.VirtualBaseplate.Reminder.Value = not p10
	visGuiBattleNew.VirtualBaseplate.BaseplateReminder.Visible = p10
end
function networkClient.CreateNotice(p11, p12, p13, p14, p15, p16)
	messageService.new(p11, p12, p13, p14, p15, p16)
end
function networkClient.TweenMessage(p17, p18, p19)
	local v136 = messages[p17]

	if not v136 then
		return
	end

	v136:Tween(p18, p19)
end
function networkClient.UpdateMessage(p20, p21, p22)
	local v140 = messages[p20]

	if not v140 then
		return
	end

	v140:Update(p21, p22)
end
function networkClient.PlayTestDebugPrint(p23)
	print(p23)
end

local tweenService: TweenService = game:GetService("TweenService")

local function characterCheck(player)
	if not player.Character then
		print("no character")
	end

	local Character2 = player.Character
	local humanoid = Character2:FindFirstChild("Humanoid")

	if not humanoid then
		print("nonplayer")
	end

	local humanoidRootPart = Character2:FindFirstChild("HumanoidRootPart")

	return Character2, humanoid, humanoidRootPart
end

contextActionService:BindAction("Skateboardin", function(p25, p26, _)
	if p26 ~= Enum.UserInputState.Begin or p25 ~= "Skateboardin" then
		return
	end

	if playerGui.Dialog2.Window.Visible then
		return
	end

	local player = LocalPlayer

	if not player.Character then
		print("no character")
	end

	local Character3 = player.Character
	local humanoid = Character3:FindFirstChild("Humanoid")

	if not humanoid then
		print("nonplayer")
	end

	local humanoidRootPart = Character3:FindFirstChild("HumanoidRootPart")

	audioService.PlaySound("Toot")
	u40 = not u40

	local clone = game.ReplicatedStorage["Skateboard Stuff"].LightWind:Clone()

	clone.Parent = workspace
	clone.Position = humanoidRootPart.Position

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local v155: Tween = tweenService:Create(clone, tweenInfo, {
		Size = Vector3.new(10, 6.8, 10),
		Transparency = 1,
		Orientation = Vector3.new(0, 270, 0)
	})

	v155:Play()
	v155.Completed:connect(function()
		clone:Destroy()
	end)

	if u40 and Character3:FindFirstChild("Torso") then
		humanoidRootPart.Running.SoundId = "rbxassetid://22917014"
	else
		humanoidRootPart.Running.SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3"
	end

	networkFireServer("Skateboard", u40)
end, true, Enum.KeyCode.R)

if game:GetService("UserInputService").TouchEnabled then
	local v48: Instance = contextActionService:GetButton("Skateboardin")

	v48.ImageTransparency = 0.5
	v48.ActionIcon.Image = "rbxassetid://7103121101"
	v48.Position = UDim2.new(0, 123, 0, 25)
end

networkClient.ChangeSong = audioService.ChangeSong

local t1: {[any]: any} = {
	Red = {
		Title = "Dominion",
		Description = "Red is the colour of power, ambition, and rage. Play strong fighters to dominate your opponent with fire and fury!",
		Card1 = "Ignis Mage",
		Card2 = "Redcliff Enforcer",
		Card3 = "Damaging26, Flaming Fighter",
		Card4 = "Jayson13"
	},
	Blue = {
		Title = "Intelligence",
		Description = "Blue is the colour of intellect, science, and control. Use tricks and traps to bend your opponent to your will!",
		Card1 = "Korblox General",
		Card2 = "Korblox Archer",
		Card3 = "SharpTH",
		Card4 = "IcyTea"
	},
	Green = {
		Title = "Vitality",
		Description = "Green is the colour of nature, growth, and primal forces. Gain lots of resources and use them to obtain victory!",
		Card1 = "Byte",
		Card2 = "Overseer Prophet",
		Card3 = "Overseer Drake",
		Card4 = "PolyHexV2"
	},
	Yellow = {
		Title = "Revel",
		Description = "Yellow is the colour of community, emotion, and art. Rush your opponent down with a swarm of a variety of fighters!",
		Card1 = "Shamrock Doge",
		Card2 = "Abraham Doge",
		Card3 = "Combine Garrison",
		Card4 = "Prestwick"
	}
}
local visGuiStarterDeck = visGui.StarterDeck
local visGuiStarterDeckDeckSelectWindow = visGuiStarterDeck.DeckSelectWindow
local visGuiStarterDeckBGs = visGuiStarterDeck.BGs
local visGuiStarterDeckColorHolder = visGuiStarterDeck.ColorHolder
local visGuiStarterDeckBGsNeutralGradient = visGuiStarterDeckBGs.NeutralGradient
local visGuiStarterDeckBigText = visGuiStarterDeck.BigText
local vName = nil

for _, v in pairs(visGuiStarterDeckColorHolder:GetChildren()) do
	if v:IsA("ImageButton") then
		v.MouseButton1Click:connect(function()
			audioService.PlaySound("Mouse Over (Light)")
			vName = v.Name

			if visGuiStarterDeckBGsNeutralGradient == visGuiStarterDeckBGs.NeutralGradient then
				visGuiStarterDeckBigText.Visible = false

				local animationAnimateAsync = animation.AnimateAsync
				local v157 = UDim2.fromScale(0.5, 0.1)

				animationAnimateAsync(visGuiStarterDeckColorHolder, { Position = v157 }, 0.5, "Out", "Quint")

				local animateAsync = animation.AnimateAsync

				v157 = UDim2.fromScale(0.5, 0.55)
				animateAsync(visGuiStarterDeckDeckSelectWindow, { Position = v157 }, 0.5, "Out", "Quint")
			else
				animation.AnimateAsync(visGuiStarterDeckBGsNeutralGradient, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
			end

			animation.AnimateAsync(visGuiStarterDeckBGs[v.Name .. "Gradient"], { BackgroundTransparency = 0 }, 0.5, "Out", "Quint")
			visGuiStarterDeckBGsNeutralGradient = visGuiStarterDeckBGs[v.Name .. "Gradient"]

			local v159 = t1[v.Name]

			visGuiStarterDeckDeckSelectWindow.DeckDescription.Text = v159.Description
			visGuiStarterDeckDeckSelectWindow.DeckName.Text = v159.Title

			for _, iterValue in pairs(visGuiStarterDeckDeckSelectWindow.DeckCards:GetChildren()) do
				iterValue.Parent = visGuiStarterDeckDeckSelectWindow.holder
				iterValue.Parent = visGuiStarterDeckDeckSelectWindow.DeckCards

				if iterValue:IsA("ImageLabel") then
					iterValue.Image = "rbxassetid://" .. cardLibrary[v159[iterValue.Name]].Id
					nonGameCard.BindInspect(iterValue, cardLibrary[v159[iterValue.Name]])
				end
			end
		end)
	end
end

visGuiStarterDeckDeckSelectWindow.SelectButton.MouseButton1Click:connect(function()
	if not vName then
		return
	end

	networkFireServer("ChooseStarterDeck", vName)
	vName = nil
	audioService.PlaySound("Target Or Select")
	transition.ToggleBlack(1)
	task.wait(0.5)
	visGuiStarterDeck.Visible = false
	visGuiStarterDeckBGsNeutralGradient = visGuiStarterDeckBGs.NeutralGradient
	networkClient.MoveCamera("CameraTutorial1")
	audioService.ChangeSong("Gran Turismo 6 - Garage")
	transition.ToggleBlack(-1)
	dialog2.Start(require(game.ReplicatedStorage.Dialogue.TutorialDialog))
	quest.OpenStarterQuests()
end)

local starterDeckSelection = playerGui:WaitForChild("StarterDeckSelection")
local starterDeckSelectionStarterFrame = starterDeckSelection.StarterFrame
local deckBoxTemplate = starterDeckSelection.Templates.DeckBoxTemplate
local cardTemplate = starterDeckSelection.Templates.CardTemplate

local function GetUnselectedStarterPosition(p28)
	return UDim2.fromScale(p28 * 0.2, 0.5)
end
local function GetSelectedStarterPosition(p29)
	return UDim2.fromScale((p29 - 1) * 0.1 + 0.35, 0.15)
end
local function GetStarterCardPosition(p30)
	return UDim2.fromScale((p30 - 1) * 0.2 + 0.3, 0.5)
end
local function ChangeStarterText(p31)
	starterDeckSelectionStarterFrame.Subtitles.SubtitlesText.Text = p31
	starterDeckSelectionStarterFrame.Subtitles.Position = UDim2.fromScale(0.5, 0.85)
	starterDeckSelectionStarterFrame.DeckReminder.Position = UDim2.fromScale(0.5, 0.81)

	local animationAnimateAsync = animation.AnimateAsync
	local starterDeckSelectionStarterFrameSubtitles = starterDeckSelectionStarterFrame.Subtitles
	local v168 = UDim2.fromScale(0.5, 0.832)

	animationAnimateAsync(starterDeckSelectionStarterFrameSubtitles, { Position = v168 }, 0.3, "Out", "Quart")

	local animateAsync = animation.AnimateAsync
	local starterDeckSelectionStarterFrameDeckReminder = starterDeckSelectionStarterFrame.DeckReminder

	v168 = UDim2.fromScale(0.5, 0.78)
	animateAsync(starterDeckSelectionStarterFrameDeckReminder, { Position = v168 }, 0.3, "Out", "Quart")
end
local function OpenStarterOptions()
	local u171 = nil
	local v172 = maid.new()

	starterDeckSelectionStarterFrame.Select.Position = UDim2.fromScale(0.5, 1.5)

	local t6: {[any]: any} = { "Red", "Green", "Blue", "Yellow" }
	local t7: {[any]: any} = {}

	local function SelectStarterOption(p32)
		if u171 == t6[p32] then
			return
		end

		u171 = t6[p32]
		ChangeStarterText(t1[t6[p32]].Description)

		for k, v in pairs(t7) do
			if k ~= p32 then
				local animationAnimateAsync = animation.AnimateAsync
				local v399 = UDim2.fromScale((k - 1) * 0.1 + 0.35, 0.15)
				local v400 = UDim2.fromScale(0.15, 0.15)

				animationAnimateAsync(v, { Rotation = 0, Position = v399, Size = v400 }, 0.2, "Out", "Quart")
			else
				local animateAsync = animation.AnimateAsync
				local v402 = UDim2.fromScale((k - 1) * 0.1 + 0.35, 0.15)
				local v403 = UDim2.fromScale(0.2, 0.2)

				animateAsync(v, { Rotation = 4, Position = v402, Size = v403 }, 0.2, "Out", "Quart")
			end
		end

		starterDeckSelectionStarterFrame.Select.TextLabel.Text = "Select " .. t1[t6[p32]].Title
		starterDeckSelectionStarterFrame.Select.Visible = true
		starterDeckSelectionStarterFrame.HighlightLabel.Visible = true
		starterDeckSelectionStarterFrame.Select.BackgroundColor3 = config.CLR[t6[p32]]
		audioService.PlaySound("35_misplace")

		for i = 1, 4 do
			audioService.PlaySound("Draw")

			if v172["Card" .. i] then
				v172["Card" .. i]:Destroy()
			end

			local clone = cardTemplate:Clone()

			v172["Card" .. i] = clone

			local v406 = cardLibrary[t1[t6[p32]]["Card" .. i]]

			clone.Size = UDim2.fromScale(0, 0)
			clone.Position = UDim2.fromScale((p32 - 1) * 0.1 + 0.35, 0.15)
			clone.Image = "rbxassetid://" .. v406.Id
			clone.Parent = starterDeckSelectionStarterFrame
			clone.Visible = true
			nonGameCard.BindInspect(clone, v406)

			local v407 = animation.AnimateAsync
			local v408 = UDim2.fromScale(i * 0.2, 0.5)
			local v409 = UDim2.fromScale(0.15, 0.4)

			v407(clone, {
				Position = v408,
				Size = v409,
				Rotation = if i % 2 == 0 then 2 else -2
			}, 0.5, "Out", "Quart")
			task.wait(0.1)
		end
	end

	for k, v in pairs(t6) do
		local clone = deckBoxTemplate:Clone()

		v172:GiveTask(clone)
		clone.Size = UDim2.fromScale(0.2, 0.9)
		clone.Position = UDim2.fromScale(0.5, -0.5)
		clone.Title.Text = t1[v].Title
		clone.BackgroundColor3 = config.CLR[v]
		table.insert(t7, clone)
		clone.Parent = starterDeckSelectionStarterFrame
		clone.Visible = true

		local animationAnimateAsync = animation.AnimateAsync
		local v180 = UDim2.fromScale(k * 0.2, 0.5)

		animationAnimateAsync(clone, { Position = v180 }, 1, "Out", "Quart")
		task.wait(0.1)
		audioService.PlaySound("35_misplace")

		local animateAsync = animation.AnimateAsync

		v180 = UDim2.fromScale(0.15, 0.5)
		animateAsync(clone, {
			Size = v180,
			Rotation = if k % 2 == 0 then 2 else -2
		}, 0.7, "Out", "Bounce")
	end

	task.wait(1)
	starterDeckSelectionStarterFrame.Subtitles.Visible = true
	starterDeckSelectionStarterFrame.DeckReminder.Visible = true
	ChangeStarterText("Select a deck to view its contents!")

	local v182 = animation.AnimateAsync
	local starterDeckSelectionStarterFrameSelect = starterDeckSelectionStarterFrame.Select
	local v184 = UDim2.fromScale(0.5, 0.95)

	v182(starterDeckSelectionStarterFrameSelect, { Position = v184 }, 1, "Out", "Quad")

	for k, v in pairs(t7) do
		v172:GiveTask(v.MouseButton1Click:Connect(function()
			SelectStarterOption(k)
		end))
	end

	v172:GiveTask(starterDeckSelectionStarterFrame.Select.MouseButton1Click:Connect(function()
		if not u171 then
			return
		end

		starterDeckSelectionStarterFrame.Select.Visible = false
		networkFireServer("ChooseStarterDeck", u171)
		audioService.PlaySound("Target Or Select")
		transition.ToggleBlack(1)
		starterDeckSelection.Enabled = false
		v172:Destroy()
		task.wait(0.5)
		networkClient.WarningMsg("A few moments later...")
		audioService.ChangeSong("Gran Turismo 6 - Garage")
		task.wait(1)
		inspection.Hide()
		networkClient.UpdateWorld()
		networkClient.StartCutscene("PreTutorial3")
		transition.ToggleBlack(-1)
		dialog2.Start(require(game.ReplicatedStorage.Dialogue.TutorialDialog))
	end))
end
function networkClient.FarseekerCutscene()
	handy.Hide()
	transition.ToggleBlack(1)
	task.wait(0.5)
	networkClient.MoveCamera("FarseekerCamera")
	transition.ToggleBlack(-1)

	local dialog2Start = dialog2.Start
	local farseekerDialog = require(game.ReplicatedStorage.Dialogue.FarseekerDialog)

	dialog2Start(farseekerDialog, workspace.Duelists["Farseeker Expeditioner Helper"])
end
function networkClient.OpenStarterChoice()
	task.spawn(function()
		audioService.ChangeSong("Daisuke Kawai-Weekend")
	end)
	networkClient.StartCutscene("PreTutorial2")
	task.spawn(function()
		audioService.ChangeSong("No Straight Roads - vs. DJ Subatomic Supernova")
	end)
	task.spawn(function()
		handy.Hide()
	end)
	starterDeckSelection.Enabled = true
	transition.ToggleBlack(-1)
	OpenStarterOptions()
end
function networkClient.MoveCamera(p33)
	local foundChild = replicatedStorage.CameraAngles:FindFirstChild(p33)

	if not foundChild then
		print("There is no camera angle", p33)

		return
	end

	transition.ToggleBlack(1)
	task.wait(0.7)
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = foundChild.CFrame
	transition.ToggleBlack(-1)
end
function networkClient.PanCamera(p34, p35)
	local foundChild = replicatedStorage.CameraAngles:FindFirstChild(p34)

	if not foundChild then
		print("There is no camera angle", p34)

		return
	end

	Camera.CameraType = Enum.CameraType.Scriptable

	local tweenService2: TweenService = game:GetService("TweenService")
	local v195 = p35 or TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

	tweenService2:Create(Camera, v195, { CFrame = foundChild.CFrame }):Play()
end
function networkClient.ResetCamera()
	Camera.CameraType = Enum.CameraType.Custom
end
local function LoadTournamentInfo()
	local v196 = networkInvokeServer("GetTournamentData")
	local tournamentDetails = visGui.TournamentInfo.TournamentDetails

	tournamentDetails.Back.Players:ClearAllChildren()
	tournamentDetails.Back.JoinTournament.Visible = false

	local uiListLayout: UIListLayout = Instance.new("UIListLayout")

	uiListLayout.Parent = tournamentDetails.Back.Players

	if v196 == nil then
		tournamentDetails.Back.Explanation.ExplanationText.Text = "A tournament is not currently active, check our socials to find out when one will be!"
		tournamentDetails.Back.ListType.ListText.Text = ""
	elseif v196.Round == 0 then
		tournamentDetails.Back.Explanation.ExplanationText.Text = "A tournament is starting! type jointournament in chat to sign up and compete for BB and unique rewards!"
		tournamentDetails.Back.ListType.ListText.Text = "Players:"

		local u199: boolean = false

		for k, _ in pairs(v196.Players) do
			local clone = tournamentDetails.Back.PlayersTextTemplate:Clone()

			if game.Players:FindFirstChild(k) then
				local k2 = game.Players:FindFirstChild(k)

				clone.Text = k .. "(" .. k2.DisplayName .. ")"
			else
				clone.Text = k
			end

			clone.Parent = tournamentDetails.Back.Players

			if k == LocalPlayer.Name then
				u199 = true
			end
		end

		if u199 == false then
			tournamentDetails.Back.JoinTournament.Visible = true

			return
		end
	else
		tournamentDetails.Back.Explanation.ExplanationText.Text = "A tournament is now taking place, The players below are currently fighting eachother in this round."
		tournamentDetails.Back.ListType.ListText.Text = "Battles:"

		for k, v in pairs(v196.Battles) do
			local clone = tournamentDetails.Back.PlayersTextTemplate:Clone()

			clone.Parent = tournamentDetails.Back.Players

			if v ~= "None" then
				if game.Players:FindFirstChild(k) and game.Players:FindFirstChild(v) then
					local displayName = game.Players:FindFirstChild(k).DisplayName
					local v2 = game.Players:FindFirstChild(v)

					clone.Text = k .. "(" .. displayName .. ") Vs. " .. v .. "(" .. v2.DisplayName .. ")"
				end

				clone.Text = k .. " Vs. " .. v
			elseif game.Players:FindFirstChild(k) then
				local k3 = game.Players:FindFirstChild(k)

				clone.Text = k .. "(" .. k3.DisplayName .. ") gets the bye."
			else
				clone.Text = k .. " gets the bye."
			end
		end
	end
end
function networkClient.ViewTournament()
	print("got here")
	LoadTournamentInfo()
	visGui.TournamentInfo.Visible = true
end
function networkClient.UpdateTournamentStatus(p36, _)
	if p36 == true then
		handyHandy.Tournament.Visible = true
		handyHandy.Tournament.New.Visible = true
	else
		handyHandy.Tournament.Visible = false
		handyHandy.Tournament.New.Visible = false
	end

	LoadTournamentInfo()
end

handyHandy.Tournament.MouseButton1Down:connect(function()
	handyHandy.Tournament.New.Visible = false
	LoadTournamentInfo()
	visGui.TournamentInfo.Visible = true
end)
visGui.TournamentInfo.TournamentDetails.TopBit.Back.MouseButton1Click:Connect(function()
	visGui.TournamentInfo.Visible = false
end)
visGui.TournamentInfo.TournamentDetails.Back.JoinTournament.MouseButton1Click:Connect(function()
	networkFireServer("JoinTournament", LocalPlayer)
	LoadTournamentInfo()
end)

local visGuiPreconstructedDeckSelector = visGui.PreconstructedDeckSelector
local visGuiPreconstructedDeckSelectorPosition = visGuiPreconstructedDeckSelector.Position
local visGuiPreconstructedDeckSelectorDontOverride = visGuiPreconstructedDeckSelector.DontOverride
local visGuiPreconstructedDeckSelectorDeckHolder = visGuiPreconstructedDeckSelector.DeckHolder
local v73 = maid.new()

function networkClient.OpenPreconstructedDeckMenu(p38)
	-- The slot count used to come from a fixed DeckSlots value (matching the old 10 deck limit). Players can have up to 100 decks now, so list
	-- the slots they actually have, in numeric order.
	local deckNames = networkInvokeServer("GetDeckName")
	local slots = {}

	if type(deckNames) == "table" then
		for k in pairs(deckNames) do
			local slotNumber = tonumber(k)

			if slotNumber then
				table.insert(slots, slotNumber)
			end
		end
	end

	table.sort(slots)
	audioService.PlaySound("Swoosh")

	for _, v in pairs(visGuiPreconstructedDeckSelectorDeckHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	for _, i in ipairs(slots) do
		local clone = visGuiPreconstructedDeckSelector.TemplateButton:Clone()

		clone.LayoutOrder = i
		clone.Parent = visGuiPreconstructedDeckSelectorDeckHolder

		local cloneDeckName = clone.DeckName

		cloneDeckName.Text = deckNames[tostring(i)] or ""
		v73:GiveTask(clone.MouseButton1Click:connect(function()
			networkFireServer("SaveDeck", p38, i, true)
			networkClient.ClosePreconstructedDeckMenu()
			audioService.PlaySound("Target Or Select")
			networkClient.UpdateDeckSlotDisplay(i)
		end))
		clone.Visible = true
	end

	v73:GiveTask(visGuiPreconstructedDeckSelectorDontOverride.MouseButton1Click:connect(function()
		networkClient.ClosePreconstructedDeckMenu()
		audioService.PlaySound("UI-MouseOver Pop HD")
	end))
	visGuiPreconstructedDeckSelector.Position = UDim2.fromScale(-0.5, 0.5)
	visGuiPreconstructedDeckSelector.Visible = true
	animation.AnimateAsync(visGuiPreconstructedDeckSelector, { Position = visGuiPreconstructedDeckSelectorPosition }, 0.5, "Out", "Quint")
end
function networkClient.ClosePreconstructedDeckMenu()
	v73:DoCleaning()
	visGuiPreconstructedDeckSelector.Visible = false
end
function networkClient.PuzzleBot(name)
	local text: string = tostring(LocalPlayer.userId)

	networkFireServer("RequestPuzzle", { Parent = true, Name = name, userId = -999999 - text })
end
function networkClient.PitTrap()
	spawn(function()
		task.wait(3)
		audioService.PlaySound("Gaster Fade")
		networkFireServer("SetCollisionOff")
	end)
end
function networkClient.TurnOnIndicationAnimation()
	for _, v in pairs({ visGuiBattleNew.TurnIndicator, visGuiBattleNew.TurnIndicatorEnemy }) do
		task.spawn(function()
			while visGuiBattleNew.Visible do
				animation.Animate(v.UIGradient, { Rotation = 360 }, 12, "InOut", "Sine")
				animation.Animate(v.UIGradient, { Rotation = 0 }, 12, "InOut", "Sine")
			end
		end)
	end
end
local function ShowPlaceDetails(p40, p41, p42)
	local visGuiNewPlace = visGui.NewPlace

	visGuiNewPlace.Title.Text = p40
	visGuiNewPlace.Subtitle.Text = p41
	visGuiNewPlace.Author.Text = p42

	for _, v in pairs(visGuiNewPlace:GetChildren()) do
		v.TextTransparency = 1
		task.spawn(function()
			animation.Animate(v, { TextTransparency = 0 }, 0.8, "Out", "Quint")
			task.wait(1)
			animation.Animate(v, { TextTransparency = 1 }, 0.8, "In", "Quint")
		end)
	end

	task.spawn(function()
		visGuiNewPlace.Visible = true
		wait(2.6)
		visGuiNewPlace.Visible = false
	end)
end
function networkClient.TeleportBackToSpawn()
	networkClient.EndCutscene()
	wait(0.5)
	LocalPlayer.Character.Humanoid.Sit = true
	LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 100, 0)
	audioService.PlaySound("splat.wav")
	audioService.PlaySound("Toot")
	LocalPlayer.Character:SetPrimaryPartCFrame(replicatedStorage.CameraAngles.CameraTutorial1.CFrame)
	networkFireServer("UnbanFromHell")
end
function networkClient.TeleportMachine(p43, p44, p45, p46, p47)
	transition.ToggleBlackColor(Color3.fromRGB(255, 255, 255))
	audioService.PlaySound(p47)
	transition.ToggleBlack(1)
	LocalPlayer.Character:SetPrimaryPartCFrame(p46)
	transition.ToggleBlack(-1)
	ShowPlaceDetails(p43, p44, p45)
	transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
end
function networkClient.RedeemCompensation()
	networkFireServer("RedeemCompensation")
end

local worldElements = require(script.Parent.WorldElements)
local worldElementsStorage = game:GetService("ReplicatedStorage").WorldElementsStorage
local children = workspace:WaitForChild("WorldElements"):GetChildren()

function networkClient.UpdateWorld()
	networkClient.UpdateStatsData()

	local v235 = data.GetQuestStats()

	for _, v in pairs(children) do
		v.Parent = workspace.WorldElements
	end

	for _, v in pairs(worldElements) do
		local u240: boolean = true
		local v241 = v.MinimumStatsFails or 0

		if v.Stats then
			for k, iterValue in pairs(v.Stats) do
				if not v235[k] then
					v235[k] = 0
				end

				if iterValue > v235[k] then
					if v241 > 0 then
						v241 -= 1
					else
						u240 = false
					end
				end
			end
		end

		if v.ReversedRequirementsStats then
			u240 = not u240
		end

		if v.StatsMustEqual then
			for k, iterValue2 in pairs(v.StatsMustEqual) do
				if not v235[k] then
					v235[k] = 0
				end

				if iterValue2 ~= v235[k] then
					u240 = false
				end
			end
		end

		if v.StatsMustBeLess then
			for k, iterValue3 in pairs(v.StatsMustBeLess) do
				if not v235[k] then
					v235[k] = 0
				end

				if iterValue3 < v235[k] then
					if v241 > 0 then
						v241 -= 1
					else
						u240 = false
					end
				end
			end
		end

		if v.ReversedRequirements then
			u240 = not u240
		end

		if u240 then
			if v.Duelists then
				for _, iterValue4 in pairs(v.Duelists) do
					if worldElementsStorage.Duelists:FindFirstChild(iterValue4) then
						worldElementsStorage.Duelists[iterValue4].Parent = workspace.Duelists
					end
				end
			end

			if v.Objects then
				for _, iterValue5 in pairs(v.Objects) do
					if worldElementsStorage.Objects:FindFirstChild(iterValue5) then
						worldElementsStorage.Objects[iterValue5].Parent = workspace.WorldElements
					end
				end
			end

			if v.RemoveDuelists then
				for _, iterValue6 in pairs(v.RemoveDuelists) do
					if workspace.Duelists:FindFirstChild(iterValue6) then
						workspace.Duelists[iterValue6].Parent = worldElementsStorage.Duelists
					end
				end
			end

			if v.RemoveObjects then
				for _, iterValue7 in pairs(v.RemoveObjects) do
					if workspace.WorldElements:FindFirstChild(iterValue7) then
						workspace.WorldElements[iterValue7].Parent = worldElementsStorage.Objects
					end
				end
			end
		else
			if v.Duelists then
				for _, iterValue8 in pairs(v.Duelists) do
					if workspace.Duelists:FindFirstChild(iterValue8) then
						workspace.Duelists[iterValue8].Parent = worldElementsStorage.Duelists
					end
				end
			end

			if v.Objects then
				for _, iterValue9 in pairs(v.Objects) do
					if workspace.WorldElements:FindFirstChild(iterValue9) then
						workspace.WorldElements[iterValue9].Parent = worldElementsStorage.Objects
					end
				end
			end
		end
	end

	networkClient.UpdateDuelists()
end

networkClient.UpdateWorld()
spawn(function()
	local vendorGuis = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VendorGuis")

	print("FactionJoin")

	for _, v in pairs(workspace.FactionJoin:GetChildren()) do
		v:WaitForChild("GuiPanel")

		local clone = vendorGuis.JoinButton:Clone()

		clone.Name = "FactionJoin"
		clone.Parent = v.GuiPanel.SurfaceGui
		clone.MouseButton1Click:connect(function()
			if networkClient.IsSubPlayer() then
				networkClient.WarningMsg("You cannot open this menu while in a party.")

				return
			end

			if not handy.Visible() then
				return
			end

			UpdateFactionButtons()
			visGui.FactionMenu.Visible = true
			handy.Hide()
		end)
	end
end)
visGui.FactionMenu.Close.MouseButton1Click:Connect(function()
	visGui.FactionMenu.Visible = false
	handy.Show()
end)

for _, v in pairs(visGui.FactionMenu:GetChildren()) do
	if v:IsA("Frame") then
		for _, iterValue in pairs(v:GetChildren()) do
			if iterValue:IsA("TextButton") then
				iterValue.MouseButton1Click:Connect(function()
					networkInvokeServer("JoinFaction", v.Name)
					UpdateFactionButtons()
				end)
			end
		end

		if v.Name ~= "InfoFrame" then
			v.MouseEnter:Connect(function()
				animation.AnimateAsync(v.BackgroundImage, { ImageTransparency = 0 }, 0.3, "Out", "Quad")
				animation.AnimateAsync(v.FactionColors, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.FactionInfo, { BackgroundTransparency = 0.65 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.ImageLabel, { ImageTransparency = 1 }, 0.3, "Out", "Quad")
			end)
			v.MouseLeave:Connect(function()
				animation.AnimateAsync(v.BackgroundImage, { ImageTransparency = 0.85 }, 0.3, "Out", "Quad")
				animation.AnimateAsync(v.FactionColors, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.FactionInfo, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.ImageLabel, { ImageTransparency = 0.05 }, 0.3, "Out", "Quad")
			end)
		end
	end
end

function UpdateFactionButtons()
	-- GetFactionScore is { faction name, score, season id }. It can be a plain number (older saves / no
	-- faction yet), and indexing a number is what crashed MainClient2 at load, so bail out unless it's a table.
	local v264 = data.GetFactionScore()

	if type(v264) ~= "table" then
		return
	end

	local seasonId = networkInvokeServer("GetFactionSeasonID")

	for _, v in pairs(visGui.FactionMenu:GetChildren()) do
		if v:IsA("Frame") then
			for _, iterValue in pairs(v:GetChildren()) do
				if iterValue:IsA("TextButton") and v264[3] == seasonId then
					if v264[1] == v.Name then
						iterValue.Text = "Joined!"
						iterValue.BackgroundColor3 = Color3.fromRGB(87, 100, 90)
					else
						iterValue.Visible = false
					end
				end
			end
		end
	end
end

UpdateFactionButtons()
visGui.DSPrepEvent.InfoHolder.PreconInfo.PreconButton.MouseButton1Click:Connect(function()
	visGui.DSPreconMenu.Visible = true
	visGui.DSPrepEvent.Visible = false
end)
visGui.DWInfoEvent.InfoHolder.EventInfo.FactionButton.MouseButton1Click:Connect(function()
	UpdateFactionButtons()
	visGui.FactionMenu.Visible = true
	visGui.DWInfoEvent.Visible = false
end)
visGui.DSPreconMenu.Close.MouseButton1Click:Connect(function()
	visGui.DSPreconMenu.Visible = false
	handy.Show()
end)

for _, v in pairs(visGui.DSPreconMenu:GetChildren()) do
	if v:IsA("Frame") then
		for _, iterValue2 in pairs(v:GetChildren()) do
			if iterValue2:IsA("TextButton") then
				iterValue2.MouseButton1Click:Connect(function()
					networkInvokeServer("ClaimDSPrecon", v.Name)
					UpdateDSPreconButtons()
				end)
			end
		end

		if v.Name ~= "InfoFrame" then
			v.MouseEnter:Connect(function()
				animation.AnimateAsync(v.BackgroundImage, { ImageTransparency = 0 }, 0.3, "Out", "Quad")
				animation.AnimateAsync(v.FactionColors, { BackgroundTransparency = 0 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.FactionInfo, { BackgroundTransparency = 0.65 }, 0.15, "Out", "Quad")
			end)
			v.MouseLeave:Connect(function()
				animation.AnimateAsync(v.BackgroundImage, { ImageTransparency = 0.85 }, 0.3, "Out", "Quad")
				animation.AnimateAsync(v.FactionColors, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")
				animation.AnimateAsync(v.FactionInfo, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")
			end)
		end
	end
end

function UpdateDSPreconButtons()
	networkClient.UpdateStatsData()

	local v269 = data.GetQuestStats()

	if not v269 then
		return
	end

	for _, v in pairs(visGui.DSPreconMenu:GetChildren()) do
		if v:IsA("Frame") then
			for _, iterValue in pairs(v:GetChildren()) do
				if iterValue:IsA("TextButton") and v269 and v269.ClaimedDSPrecon ~= 0 then
					iterValue.Visible = false
				end
			end
		end
	end

	if v269 and v269.JoinedDWFaction == 0 then
		visGui.DWInfoEvent.InfoHolder.EventInfo.FactionButton.New.Visible = true
		visGui.HandyHolder.HandyNew.DSPrepEvent.New.Visible = true
		visGui.HandyTouch.DSPrepEvent.New.Visible = true

		return
	end

	visGui.DWInfoEvent.InfoHolder.EventInfo.FactionButton.New.Visible = false
	visGui.HandyHolder.HandyNew.DSPrepEvent.New.Visible = false
	visGui.HandyTouch.DSPrepEvent.New.Visible = false
end

UpdateDSPreconButtons()

local topMsg = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopMsg")
local alertHolder = topMsg:WaitForChild("AlertHolder")
local alertText = topMsg:WaitForChild("Templates"):WaitForChild("AlertText")

function networkClient.WarningMsg(text)
	local clone = alertText:Clone()

	clone.Text = text
	clone.TextColor3 = Color3.fromRGB(255, 0, 0)
	clone.Parent = alertHolder
	clone.Visible = true
	audioService.PlaySound("Mouse Hover")
	task.spawn(function()
		task.wait(1.5)
		animation.AnimateAsync(clone.UIStroke, { Transparency = 1 }, 1, "Out", "Quad")
		animation.Animate(clone, { TextTransparency = 1 }, 1, "Out", "Quad")
		clone:Destroy()
	end)
end

local v89 = maid.new()

function networkClient.MuteWorld()
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= LocalPlayer then
			local Character4 = v.Character

			if Character4 then
				Character4.Parent = replicatedStorage.Muted
			end

			v89:GiveTask(v.CharacterAdded:Connect(function(p49)
				p49.Parent = replicatedStorage.Muted
			end))
		end
	end
end
function networkClient.UnmuteWorld()
	v89:DoCleaning()

	for _, v in pairs(replicatedStorage.Muted:GetChildren()) do
		v.Parent = workspace
	end
end
function networkClient.AddBattleBackParticles(p50, p51)
	local battleback: Instance = workspace:FindFirstChild("Battleback")
	local particleMultiplier: Instance = battleback:FindFirstChild("ParticleMultiplier")
	local backgroundTriggers = nil

	if battleback:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(battleback.BackgroundTriggers)
	end

	local v286 = p51

	if particleMultiplier then
		v286 = p51 * particleMultiplier.Value
	end

	if backgroundTriggers then
		backgroundTriggers.OnAddedParticles(p50, p51)
	end

	if battleback then
		if battleback:FindFirstChild("ParticlesGroup") then
			local particlesGroup: Instance = battleback:FindFirstChild("ParticlesGroup")

			for _, v in pairs(particlesGroup:GetChildren()) do
				local v290 = v[p50]

				v290.Rate = v290.Rate + v286
			end

			return
		end

		if not battleback:FindFirstChild("Particles") then
			return
		end

		local v291 = battleback.Particles[p50]

		v291.Rate = v291.Rate + v286

		return
	end
end
function networkClient.ResetBattleBackParticles()
	local battleback: Instance = workspace:FindFirstChild("Battleback")

	if battleback then
		if not battleback:FindFirstChild("Particles") then
			return
		end

		for _, v in pairs(battleback.Particles:GetChildren()) do
			if v.Name == "Neutral" then
				v.Rate = 20
			else
				v.Rate = 0
			end
		end

		return
	end
end

local color3 = Color3.fromRGB(55, 85, 255)
local color32 = Color3.fromRGB(255, 0, 55)
local color33 = Color3.fromRGB(0, 255, 55)
local color34 = Color3.fromRGB(255, 255, 55)
local color35 = Color3.fromRGB(255, 255, 255)
local t2: {[any]: any} = { Blue = "B", Red = "R", Green = "G", Yellow = "Y", Neutral = "C" }
local t3: {[any]: any} = { "Neutral", "Red", "Green", "Blue", "Yellow" }
local t4: {[any]: any} = {
	Blue = color3,
	Red = color32,
	Green = color33,
	Yellow = color34,
	Neutral = color35
}

function networkClient.AutoCostDeckCard(parent, p53, p54)
	local n1 = 0
	local n2: number = 0
	local autoCost = game.ReplicatedStorage.UI.AutoCost

	for _, v in pairs(p53) do
		n1 += v
		n2 += 1
	end

	if n1 <= 9 then
		local clone = autoCost.Buffer:Clone()

		clone.Parent = parent
	end

	if n1 == 0 then
		parent.TextHolder.CostText.Text = "Free"
		parent.TextHolder.CostText.ZIndex = parent.ZIndex + 1
		parent.TextHolder.CostText.Visible = true

		return parent
	end

	if p54 then
		n1 += 1
	end

	if n1 <= 10 then
		for _, v in pairs(t3) do
			if p53[v] then
				for _ = 1, p53[v] do
					local clone = autoCost.StudTemplate:Clone()

					clone.Parent = parent
					clone.ImageColor3 = t4[v]
					clone.ZIndex = parent.ZIndex + 1
					clone.Visible = true
				end
			end
		end
	else
		local s1: string = ""

		for _, v in pairs(t3) do
			if p53[v] then
				local floored = math.floor(t4[v].R * 255)
				local floored2 = math.floor(t4[v].G * 255)
				local floored3 = math.floor(t4[v].B * 255)

				s1 = s1 .. "<font color=\"rgb(" .. floored .. "," .. floored2 .. "," .. floored3 .. ")\">" .. p53[v] .. t2[v] .. "</font> "
			end
		end

		parent.TextHolder.CostText.Text = s1
		parent.TextHolder.CostText.ZIndex = parent.ZIndex + 1
		parent.TextHolder.CostText.Visible = true
	end

	if p54 and not parent:FindFirstChild("EndBuffer") then
		local clone = autoCost.Buffer:Clone()

		clone.Name = "EndBuffer"
		clone.Parent = parent
		clone.LayoutOrder = 2
	end
end
function networkClient.UpdateClientCardLibrary(p55)
	if type(cardLibUpdate.UpdateCardLibrary) == "function" then
		cardLibUpdate.UpdateCardLibrary(p55)

		return
	end

	warn("Client Update Card Library Function doesnt exist")
end

local debris: Debris = game:GetService("Debris")
local lighting: Lighting = game:GetService("Lighting")
local replicatedStorageEffectStorage = replicatedStorage.EffectStorage
local u101 = nil

local function doHistoryCannonPortalAnimation()
	local historyCannonDomain = replicatedStorage.SpecialEffects.HistoryCannonDomain

	historyCannonDomain.Parent = workspace
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = historyCannonDomain.CameraPart.CFrame
	audioService.PlaySound("Infinite Void")
	task.wait(0.5)
	animation.AnimateAsync(CurrentCamera, { FieldOfView = 120 }, 2, "Out", "Quart")
	transition.ToggleBlack(-1, 0.3)
	task.wait(1.7)
	animation.AnimateAsync(CurrentCamera, { FieldOfView = 10 }, 1.5, "In", "Quart")
	task.wait(1)
	networkClient.UpdateWorld()
	transition.ToggleBlack(1, 0.5)
	task.wait(1)
	CurrentCamera.FieldOfView = 70
	historyCannonDomain.Parent = replicatedStorage.SpecialEffects
	audioService.PlaySound("Teleport")
	task.spawn(function()
		transition.ToggleBlack(-1, 0.6)
		transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
	end)
	CurrentCamera.CameraType = Enum.CameraType.Custom
end

networkClient.DoHistoryCannonPortalAnimation = doHistoryCannonPortalAnimation

function networkClient.DoHistoryCannonAnimation()
	if u101 then
		return
	end

	u101 = true
	transition.ToggleBlack(1, 0.3)

	local currentCameraCFrame: CFrame = CurrentCamera.CFrame

	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = workspace.HistoryCannon.HistoryCannonCameraPart.CFrame

	local v318 = workspace.HistoryCannon.HistoryCannonTip.CFrame
	local historyCannonColor = workspace.HistoryCannon.HistoryCannonColor

	transition.ToggleBlack(-1, 0.3)

	local animationAnimateAsync = animation.AnimateAsync
	local color36 = Color3.fromRGB(255, 0, 0)

	animationAnimateAsync(historyCannonColor, { Color = color36 }, 2, "Out", "Quad")
	animation.AnimateAsync(lighting, { ExposureCompensation = -3 }, 2, "Out", "Quad")
	audioService.PlaySound("LaserChargeup")
	task.wait(2)
	lighting.ExposureCompensation = 2
	animation.AnimateAsync(lighting, { ExposureCompensation = 0 }, 1, "Out", "Quad")
	v32:Shake(cameraModule.Presets.Punch)
	audioService.PlaySound("GiantLaser")

	local animateAsync = animation.AnimateAsync
	local color37 = Color3.fromRGB(255, 255, 255)

	animateAsync(historyCannonColor, { Color = color37 }, 0.8, "Out", "Quad")

	local clone = replicatedStorageEffectStorage.Wind.LightWind:Clone()
	local v325 = CFrame.Angles(1.5707963267948966, 0, 0)

	clone.CFrame = v318 * v325
	clone.Position = clone.Position + Vector3.new(0, 2, 0)
	clone.Parent = workspace

	local v326 = animation.AnimateAsync
	local n1 = clone.Size * 20
	local cloneCFrame = clone.CFrame
	local v329 = CFrame.Angles(0, 0.7853981633974483, 0)
	local cFrame = CFrame.new(clone.CFrame.LookVector * 6)

	v326(clone, { Transparency = 1, Size = n1, CFrame = cloneCFrame * v329 * cFrame }, 1.5, "Out", "Quart")
	debris:AddItem(clone, 2)

	local clone2 = replicatedStorageEffectStorage.Wind.Shockwave:Clone()

	v325 = CFrame.Angles(1.5707963267948966, 0, 0)
	clone2.CFrame = v318 * v325
	clone2.Position = clone2.Position + Vector3.new(0, 2, 0)
	clone2.Parent = workspace

	local v332 = animation.AnimateAsync

	n1 = clone2.Size * 40

	local clone2CFrame = clone2.CFrame
	local v334 = CFrame.Angles(0, 0.7853981633974483, 0)

	v332(clone2, { Transparency = 1, Size = n1, CFrame = clone2CFrame * v334 }, 0.5, "Out", "Quart")
	debris:AddItem(clone2, 2)

	local clone3 = replicatedStorageEffectStorage.Wind.WindTunnel:Clone()

	v325 = CFrame.Angles(0, 3.141592653589793, 0)
	clone3.CFrame = v318 * v325
	clone3.Position = clone3.Position + Vector3.new(0, 1, 0)
	clone3.Parent = workspace

	local v336 = animation.AnimateAsync
	local n2 = clone3.Size * 2
	local vector3 = Vector3.new(0, 0, clone3.Size.Z * 15)
	local clone3CFrame = clone3.CFrame

	v334 = CFrame.Angles(0, 0, 1.5707963267948966)
	v336(clone3, { Transparency = 1, Size = n2 + vector3, CFrame = clone3CFrame * v334 }, 0.5, "Out", "Quad")
	debris:AddItem(clone3, 2)

	local historyChamberLaser = workspace.HistoryCannon.HistoryChamberLaser
	local historyChamberLaserSize = historyChamberLaser.Size

	historyChamberLaser.Transparency = 0
	animation.Animate(historyChamberLaser, { Size = Vector3.new(0, 0, 0), Transparency = 1 }, 1.5, "Out", "Quad")
	historyChamberLaser.Size = historyChamberLaserSize
	task.wait(1)
	transition.ToggleBlack(1, 0.3)
	networkClient.UpdateDuelists()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	transition.ToggleBlack(-1, 0.3)
	u101 = false
end
function networkClient.DoHistoryCannonAnimationFull(p56)
	if u101 then
		return
	end

	u101 = true
	transition.ToggleBlack(1, 0.3)

	local currentCameraCFrame: CFrame = CurrentCamera.CFrame

	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = workspace.HistoryCannon.HistoryCannonCameraPart.CFrame

	local v345 = workspace.HistoryCannon.HistoryCannonTip.CFrame
	local historyCannonColor = workspace.HistoryCannon.HistoryCannonColor

	transition.ToggleBlack(-1, 0.3)

	local animationAnimateAsync = animation.AnimateAsync
	local color38 = Color3.fromRGB(255, 0, 0)

	animationAnimateAsync(historyCannonColor, { Color = color38 }, 2, "Out", "Quad")
	animation.AnimateAsync(lighting, { ExposureCompensation = -3 }, 2, "Out", "Quad")
	audioService.PlaySound("LaserChargeup")
	task.wait(2)
	lighting.ExposureCompensation = 2
	animation.AnimateAsync(lighting, { ExposureCompensation = 0 }, 1, "Out", "Quad")
	v32:Shake(cameraModule.Presets.Punch)
	audioService.PlaySound("GiantLaser")

	local animateAsync = animation.AnimateAsync
	local color39 = Color3.fromRGB(255, 255, 255)

	animateAsync(historyCannonColor, { Color = color39 }, 0.8, "Out", "Quad")

	local clone = replicatedStorageEffectStorage.Wind.LightWind:Clone()
	local v352 = CFrame.Angles(1.5707963267948966, 0, 0)

	clone.CFrame = v345 * v352
	clone.Position = clone.Position + Vector3.new(0, 2, 0)
	clone.Parent = workspace

	local v353 = animation.AnimateAsync
	local n1 = clone.Size * 20
	local cloneCFrame = clone.CFrame
	local v356 = CFrame.Angles(0, 0.7853981633974483, 0)
	local cFrame = CFrame.new(clone.CFrame.LookVector * 6)

	v353(clone, { Transparency = 1, Size = n1, CFrame = cloneCFrame * v356 * cFrame }, 1.5, "Out", "Quart")
	debris:AddItem(clone, 2)

	local clone4 = replicatedStorageEffectStorage.Wind.Shockwave:Clone()

	v352 = CFrame.Angles(1.5707963267948966, 0, 0)
	clone4.CFrame = v345 * v352
	clone4.Position = clone4.Position + Vector3.new(0, 2, 0)
	clone4.Parent = workspace

	local v359 = animation.AnimateAsync

	n1 = clone4.Size * 40

	local clone4CFrame = clone4.CFrame
	local v361 = CFrame.Angles(0, 0.7853981633974483, 0)

	v359(clone4, { Transparency = 1, Size = n1, CFrame = clone4CFrame * v361 }, 0.5, "Out", "Quart")
	debris:AddItem(clone4, 2)

	local clone5 = replicatedStorageEffectStorage.Wind.WindTunnel:Clone()

	v352 = CFrame.Angles(0, 3.141592653589793, 0)
	clone5.CFrame = v345 * v352
	clone5.Position = clone5.Position + Vector3.new(0, 1, 0)
	clone5.Parent = workspace

	local v363 = animation.AnimateAsync
	local n2 = clone5.Size * 2
	local vector3 = Vector3.new(0, 0, clone5.Size.Z * 15)
	local clone5CFrame = clone5.CFrame

	v361 = CFrame.Angles(0, 0, 1.5707963267948966)
	v363(clone5, { Transparency = 1, Size = n2 + vector3, CFrame = clone5CFrame * v361 }, 0.5, "Out", "Quad")
	debris:AddItem(clone5, 2)

	local historyChamberLaser = workspace.HistoryCannon.HistoryChamberLaser
	local historyChamberLaserSize = historyChamberLaser.Size

	historyChamberLaser.Transparency = 0
	animation.Animate(historyChamberLaser, { Size = Vector3.new(0, 0, 0), Transparency = 1 }, 1.5, "Out", "Quad")
	historyChamberLaser.Size = historyChamberLaserSize
	task.wait(1)
	transition.ToggleBlackColor(Color3.fromRGB(255, 255, 255))
	transition.ToggleBlack(1, 0.3)

	if p56 then
		p56()
	end

	doHistoryCannonPortalAnimation()

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	u101 = false
end

local zoneFrame = playerGui:WaitForChild("NewZone"):WaitForChild("ZoneFrame")
local title = zoneFrame:WaitForChild("Title")
local subtitle = zoneFrame:WaitForChild("Subtitle")
local u106 = nil

function networkClient.EnterZone(text, p58)
	if u106 then
		u106:cancel()
	end

	title.TextTransparency = 1
	title.UIStroke.Transparency = 1
	title.Position = UDim2.fromScale(0, 0)
	subtitle.TextTransparency = 1
	subtitle.UIStroke.Transparency = 1
	subtitle.Position = UDim2.fromScale(0, 1)
	title.Text = text
	subtitle.Text = p58
	zoneFrame.Visible = true

	local animationAnimateAsync = animation.AnimateAsync
	local v373 = UDim2.fromScale(0, 0.2)

	animationAnimateAsync(title, { TextTransparency = 0, Position = v373 }, 1, "Out", "Quart")
	animation.AnimateAsync(title.UIStroke, { Transparency = 0 }, 1, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v373 = UDim2.fromScale(0, 0.725)
	animateAsync(subtitle, { TextTransparency = 0, Position = v373 }, 1, "Out", "Quart")
	animation.AnimateAsync(subtitle.UIStroke, { Transparency = 0 }, 1, "Out", "Quart")
	u106 = promise.new(function()
		local n1: number = 0

		for iterFirst, iterSecond in utf8.graphemes(p58) do
			n1 += 1
			subtitle.MaxVisibleGraphemes = n1
			task.wait(0.064)
		end

		task.wait(2.5)

		local animationAnimateAsync = animation.AnimateAsync
		local v415 = UDim2.fromScale(0, 0)

		animationAnimateAsync(title, { TextTransparency = 1, Position = v415 }, 0.5, "InOut", "Quart")
		animation.AnimateAsync(title.UIStroke, { Transparency = 1 }, 0.5, "InOut", "Quart")

		local animateAsync = animation.AnimateAsync

		v415 = UDim2.fromScale(0, 1)
		animateAsync(subtitle, { TextTransparency = 1, Position = v415 }, 0.5, "InOut", "Quart")
		animation.AnimateAsync(subtitle.UIStroke, { Transparency = 1 }, 0.5, "InOut", "Quart")
		task.wait(0.5)
		zoneFrame.Visible = false
	end)
end

local t5: {[any]: any} = { "R", "G", "B", "Y" }

local function ShowPostMageFightCutscene(p59)
	local v376 = copyTable(t5)

	table.remove(v376, table.find(v376, p59))
	networkClient.UpdateStatsData()

	local v377 = data.GetQuestStats()
	local v378 = nil

	for _, v in pairs(v376) do
		if v377["StarterDeckProgress_" .. v] and v377["StarterDeckProgress_" .. v] > 0 then
			v378 = v
		end
	end

	if not v378 then
		return
	end

	v376 = v377["StarterDeckProgress_" .. v378] or 1
	contextActionService:BindAction("freezeMovement", function()
		return Enum.ContextActionResult.Sink
	end, false, unpack(Enum.PlayerActions:GetEnumItems()))
	handy.Hide(nil, 0)
	transition.ToggleBlack(1, 0.3)

	local foundChild = workspace.Duelists:FindFirstChild("Tu_" .. v378)

	if not foundChild then
		foundChild = replicatedStorage.WorldElementsStorage.Duelists:FindFirstChild("Tu_" .. v378)
	end

	local clone = foundChild:Clone()

	clone.HumanoidRootPart.CFrame = workspace.Markers["EM_" .. p59 .. "_T"].CFrame
	clone.Head.NPCIcon:Destroy()
	clone.Parent = workspace
	Character.HumanoidRootPart.CFrame = workspace.Markers["EM_" .. p59 .. "_P"].CFrame
	transition.ToggleBlack(-1, 0.3)

	local dialog2Start = dialog2.Start
	local postMageDialog = require(game.ReplicatedStorage.Dialogue.PostMageDialog)

	dialog2Start(postMageDialog, clone, "Start_" .. v378 .. v376 .. "_1")
end

for _, v in pairs(t5) do
	networkClient["PostMageScene_" .. v] = function()
		ShowPostMageFightCutscene(v)
	end
end

function networkClient.PostBlockheadFight()
	if not workspace.Duelists:FindFirstChild("Titano2") then
		return
	end

	dialog2.StartDialogue(workspace.Duelists.Titano2)
end
function networkClient.PostNoobloxxerFight()
	if not workspace.Duelists:FindFirstChild("NoobloxxerDead") then
		return
	end

	dialog2.StartDialogue(workspace.Duelists.NoobloxxerDead)
end
function networkClient.PostshadowslayerFight()
	if not workspace.Duelists:FindFirstChild("xxshadowslayerxx2") then
		return
	end

	dialog2.StartDialogue(workspace.Duelists.xxshadowslayerxx2)
end
function networkClient.PostTelamonFight()
	local u385: boolean = false

	task.spawn(function()
		networkClient.ReturnFromStory(true, true)
		u385 = true
	end)

	repeat
		task.wait(0.1)
	until u385 == true

	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerA1EndSpawn.CFrame)
	dialog2.Start(require(replicatedStorage.Dialogue.Act1EndDialog))
end
function networkClient.PostNinjaFight()
	dialog2.Start(require(replicatedStorage.Dialogue.PostNinjaDialog))
end
function networkClient.PostRazarFight()
	dialog2.Start(require(replicatedStorage.Dialogue.PostRazarDialog))
end
function networkClient.PostRazarFightLose()
	dialog2.Start(require(replicatedStorage.Dialogue.PostRazarDialogLose))
end
function networkClient.ReturnToPuzzleMenu()
	scrollListMenu.OpenMenu("Puzzles")
end
function networkClient.ReturnToCafeMenu(p60, p61, p62, p63, p64, p65, p66)
	scrollListMenu.OpenMenu("Cafe", p60, p61, p62, p63, p64, p65, p66)
end
function networkClient.ReturnToUmberlordMenu()
	umberlordMenu.OpenMenu()
end
function networkClient.ReturnToSimulationMenu()
	simulatorMenu.OpenMenu()
end
function networkClient.StartVNScene(p67)
	if networkClient.IsSubPlayer() then
		handy.Hide()
	end

	visualNovel.Start(p67)
end

local v111 = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

function networkClient.SetControlsEnabled(p68)
	if p68 then
		v111:Enable()

		return
	end

	v111:Disable()
end

print("Finished loading " .. script.Name)

return true