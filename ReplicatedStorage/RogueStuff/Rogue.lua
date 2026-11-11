



local LocalPlayer = game.Players.LocalPlayer
local v2 = game:GetService("ReplicatedFirst")["Main Nieuw"]
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local rogueStuff: Instance = replicatedStorage:WaitForChild("RogueStuff")
local modes = require(rogueStuff.Modes)
local events = require(rogueStuff.Events)
local encounters = require(rogueStuff.Encounters)
local network = require(v2.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local animation = require(replicatedStorage.Animation)
local audioService = require(replicatedStorage.AudioService)
local visualNovel = require(replicatedStorage.VisualNovel)
local effects = require(replicatedStorage.Effects)
local transition = require(v2.Transition)
local data = require(v2.Data)
local nonGameCard = require(v2.NonGameCard)
local handy = require(v2.Handy)
local maid = require(replicatedStorage.Maid)

game:GetService("Chat")
game:GetService("TeleportService"):SetTeleportGui(replicatedStorage:WaitForChild("RunLoadingScreen"))

local rogue = LocalPlayer.PlayerGui:WaitForChild("Rogue")
local cardWindow = rogue:WaitForChild("CardWindow")
local eventWindow = rogue:WaitForChild("EventWindow")
local encounterWindow = rogue:WaitForChild("EncounterWindow")
local CurrentCamera: Camera = workspace.CurrentCamera
local cardLibrary = require(replicatedStorage.CardLibrary)
local t1 = {}

local function UpdateRunCamera(_, p2)
	if not workspace:FindFirstChild("ROGUE_PLACEHOLDER") then
		return
	end

	if not workspace.ROGUE_PLACEHOLDER:FindFirstChild(t1.Mode) then
		return
	end

	local v50 = workspace.ROGUE_PLACEHOLDER[t1.Mode]

	if v50 and v50:FindFirstChild("CameraAngles") and v50.CameraAngles:FindFirstChild(t1.Floor) then
		CurrentCamera.CameraType = "Scriptable"

		if not p2 then
			animation.Animate(CurrentCamera, { CFrame = v50.CameraAngles[t1.Floor].CFrame }, 1, "InOut", "Quad")
		end

		CurrentCamera.CFrame = v50.CameraAngles[t1.Floor].CFrame
	end
end
function networkClient.InitRunCamera()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	LocalPlayer.PlayerGui.RunLoadingScreen.Enabled = false
	audioService.ChangeSong("City Trek Menu")

	local clone

	if not workspace:FindFirstChild("ROGUE_PLACEHOLDER") then
		local rogue_placeholder: Folder = Instance.new("Folder")

		rogue_placeholder.Parent = workspace
		rogue_placeholder.Name = "ROGUE_PLACEHOLDER"
		clone = rogueStuff.Models[t1.Mode]:Clone()
		clone.Parent = rogue_placeholder
	elseif not workspace.ROGUE_PLACEHOLDER:FindFirstChild(t1.Mode) then
		workspace.ROGUE_PLACEHOLDER:ClearAllChildren()
		clone = rogueStuff.Models[t1.Mode]:Clone()
		clone.Parent = workspace.ROGUE_PLACEHOLDER
	else
		clone = workspace.ROGUE_PLACEHOLDER:FindFirstChild(t1.Mode)
	end

	if clone and clone:FindFirstChild("CameraAngles") and clone.CameraAngles:FindFirstChild(t1.Floor) then
		CurrentCamera.CameraType = "Scriptable"
		CurrentCamera.CFrame = clone.CameraAngles[t1.Floor].CFrame
	end
end
function networkClient.UpdateRunData(p3)
	t1 = p3
	rogue.Functional.LifeFrame.Life.Text = "Life: " .. t1.Life
	rogue.Functional.EnemiesDefeatedFrame.EnemiesDefeated.Text = "Enemies remaining: " .. #t1.Layout - (t1.Floor - (if t1.Current == "Battle" or t1.Current == "Bucket" then 1 else 0))
end
local function ApplyValues(p4, p5)
	for k, v in pairs(p5) do
		p4[k] = v
	end
end
function NewerCircle(parent, p7)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = UDim2.new()
	imageLabel.Parent = parent

	for k, v in pairs(p7) do
		imageLabel[k] = v
	end

	return imageLabel
end
local function PreloadTech(p8, p9)
	local t2: {[any]: any} = {}

	for _, v in pairs(p9) do
		local v68 = NewerCircle(p8, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, -36),
			Image = v
		})

		table.insert(t2, v68)
	end

	task.spawn(function()
		task.wait(1)

		for _, v in pairs(t2) do
			v:Destroy()
		end
	end)
end
function networkClient.ShowNewRunCard(p10)
	local v70 = cardLibrary[p10]

	task.spawn(function()
		local clone = LocalPlayer.PlayerGui.VisGui.ShowCard:Clone()

		clone.Parent = LocalPlayer.PlayerGui.VisGui.Effect
		clone.Position = UDim2.fromScale(-0.2, 0.5)
		clone.Visible = true
		clone.CardImage.Image = "rbxassetid://" .. data.CurrentSleeveId()
		audioService.PlaySound("Draw")

		local animationAnimateAsync = animation.AnimateAsync
		local v169 = UDim2.fromScale(0.075, 0.5)

		animationAnimateAsync(clone, { Position = v169 }, 0.4, "Out", "Quad")
		task.wait(0.2)

		local animationAnimate = animation.Animate
		local cloneCardImage = clone.CardImage

		v169 = UDim2.fromScale(0, 1)
		animationAnimate(cloneCardImage, { Size = v169 }, 0.4, "Out", "Quart")
		clone.CardImage.Image = "rbxassetid://" .. v70.Id

		local animate = animation.Animate
		local cardImage = clone.CardImage

		v169 = UDim2.fromScale(1, 1)
		animate(cardImage, { Size = v169 }, 0.25, "In", "Quart")

		if v70.Archetype == "Treasure" then
			audioService.PlaySound("secret")
		elseif v70.Archetype == "Lesser Treasure" then
			audioService.PlaySound("Target Or Select Low")
		end

		task.wait(1.5)

		local v174 = animation.Animate

		v169 = UDim2.fromScale(-0.2, 0.5)
		v174(clone, { Position = v169 }, 0.3, "Out", "Quad")
		clone:Destroy()
	end)
	task.wait(0.3)
end
function networkClient.ShowRemovedRunCard(p11)
	local v72 = cardLibrary[p11]

	task.spawn(function()
		local clone = LocalPlayer.PlayerGui.VisGui.ShowCard:Clone()

		clone.Parent = LocalPlayer.PlayerGui.VisGui.Effect
		clone.Position = UDim2.fromScale(-0.2, 0.5)
		clone.Visible = true
		clone.CardImage.Image = "rbxassetid://" .. v72.Id
		audioService.PlaySound("Draw")

		local animationAnimateAsync = animation.AnimateAsync
		local v177 = UDim2.fromScale(0.075, 0.5)

		animationAnimateAsync(clone, { Position = v177 }, 0.4, "Out", "Quad")
		task.wait(0.2)
		clone.CardImage.Image = "rbxassetid://" .. v72.Id
		task.wait(1)
		effects.SelfFire(LocalPlayer.PlayerGui.VisGui.Effect, clone, clone, "")
		audioService.PlaySound("Destroyed")
		animation.Animate(clone.CardImage, { ImageTransparency = 1 }, 1, "Out", "Quad")
		clone:Destroy()
	end)
	task.wait(0.3)
end
local function runGoBack()
	rogue.Enabled = false
	rogue.RunRewards.Visible = false
	transition.ToggleBlack(1, 0.3)

	if game:GetService("RunService"):IsStudio() then
		CurrentCamera.CameraType = "Custom"
		CurrentCamera.CameraSubject = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
		task.wait(0.7)
		rogue.Enabled = false
		rogue.RunRewards.Visible = false
		transition.ToggleBlack(-1, 0.3)
		handy.Show()

		return
	end

	networkFireServer("RunTeleportBack")
end

rogue.Functional.GoBack.MouseButton1Click:Connect(runGoBack)
networkClient.RunGoBack = runGoBack

local function CleanBuckets()
	for i = 1, 3 do
		local parent = cardWindow.Buckets["BucketTemplate_" .. i]

		parent.Container["Card" .. 1].Visible = false
		parent.Container["Card" .. 1].Parent = parent
		parent["Card" .. 1].Parent = parent.Container
		parent.Container["Card" .. 2].Visible = false
		parent.Container["Card" .. 2].Parent = parent
		parent["Card" .. 2].Parent = parent.Container
		parent.Container["Card" .. 3].Visible = false
		parent.Container["Card" .. 3].Parent = parent
		parent["Card" .. 3].Parent = parent.Container
	end
end

local v33 = maid.new()

local function goToBuckets()
	transition.ToggleBlack(1, 0.3)
	CleanBuckets()
	rogue.Enabled = true
	rogue.Functional.Visible = true
	eventWindow.Visible = false
	encounterWindow.Visible = false
	cardWindow.Position = UDim2.fromScale(0.5, -0.5)

	local t3: {[any]: any} = {}

	for k, _ in pairs(t1.Buckets) do
		table.insert(t3, k)
	end

	for k, v in pairs(t3) do
		local v80 = t1.Buckets[v]
		local v81 = cardWindow.Buckets["BucketTemplate_" .. k]

		v81.Container.TextLabel.Text = v

		for i = 1, 3 do
			if v80[i] then
				local v83 = cardLibrary[v80[i]]

				v81.Container["Card" .. i].Visible = true
				v81.Container["Card" .. i].CardName.Text = v83.Name
				v81.Container["Card" .. i].CardImg.Image = "rbxassetid://" .. v83.Id
				v81.Container["Card" .. i].Gradient.NeutralGradient.Color = rogue["Color Gradients"][v83.Color .. "Gradient"].Color
				nonGameCard.BindInspect(v81.Container["Card" .. i], v83)
			else
				v81.Container["Card" .. i].Visible = true
				v81.Container["Card" .. i].CardName.Text = ""
				v81.Container["Card" .. i].CardImg.Image = ""
				v81.Container["Card" .. i].Gradient.NeutralGradient.Color = rogue["Color Gradients"].NoneGradient.Color
			end
		end

		v33:GiveTask(v81.Select.MouseButton1Click:Connect(function()
			audioService.PlaySound("Target Or Select")
			audioService.PlaySound("toon beep")

			local animationAnimateAsync = animation.AnimateAsync
			local container = v81.Container
			local v180 = UDim2.fromScale(0.5, -0.1)

			animationAnimateAsync(container, { Position = v180 }, 0.15, "Out", "Quad")
			task.wait(0.1)

			local animationAnimate = animation.Animate
			local v182 = v81.Container

			v180 = UDim2.fromScale(0.5, 0.025)
			animationAnimate(v182, { Position = v180 }, 0.15, "In", "Quart")
			task.wait(0.5)

			local animate = animation.Animate

			v180 = UDim2.fromScale(0.5, 1.5)
			animate(cardWindow, { Position = v180 }, 0.8, "Out", "Quart")
			networkFireServer("SelectBucket", t1.Mode, v)
			v33:DoCleaning()
		end))
	end

	cardWindow.Visible = true
	task.wait(0.7)
	transition.ToggleBlack(-1, 0.3)

	local animationAnimateAsync = animation.AnimateAsync
	local v85 = UDim2.fromScale(0.5, 0.5)

	animationAnimateAsync(cardWindow, { Position = v85 }, 1, "Out", "Quart")
end

networkClient.GoToBuckets = goToBuckets

function networkClient.GoToEvents()
	transition.ToggleBlack(1, 0.3)

	local floor = t1.Floor

	if workspace:FindFirstChild("ROGUE_PLACEHOLDER") and workspace.ROGUE_PLACEHOLDER:FindFirstChild(t1.Mode) then
		local v87 = workspace.ROGUE_PLACEHOLDER[t1.Mode]

		if v87 and v87:FindFirstChild("CameraAngles") and v87.CameraAngles:FindFirstChild(t1.Floor) then
			CurrentCamera.CameraType = "Scriptable"
			CurrentCamera.CFrame = v87.CameraAngles[t1.Floor].CFrame
		end
	end

	audioService.ChangeSong("City Trek Menu")
	rogue.Enabled = true
	rogue.Functional.Visible = true
	cardWindow.Visible = false
	encounterWindow.Visible = false
	eventWindow.GroupTransparency = 1
	eventWindow.Visible = true

	for _, v in pairs(eventWindow.Events:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	local n1: number = #t1.Layout[t1.Floor].Events

	for _, v in pairs(t1.Layout[t1.Floor].Events) do
		if events[v] then
			local clone = rogue.Templates.EventTemplate:Clone()

			clone.Icon.Image = "rbxassetid://14389191998"

			if events[v].Color then
				clone.Icon.ImageColor3 = events[v].Color
				clone.Title.TextColor3 = events[v].Color
			end

			clone.Title.Text = events[v].Name
			clone.Parent = eventWindow.Events
			clone.Size = UDim2.new(0, eventWindow.Events.AbsoluteSize.X / n1, 0.8, 0)
			clone.Visible = true
			task.spawn(function()
				task.wait(1)
				clone.MouseButton1Click:Connect(function()
					networkFireServer("SelectEvent", t1.Mode, v)
				end)
			end)
			clone.MouseEnter:Connect(function()
				audioService.PlaySound("click_001")
				animation.AnimateAsync(clone.Icon, { Rotation = 7 }, 0.5, "Out", "Quart")
			end)
			clone.MouseLeave:Connect(function()
				animation.AnimateAsync(clone.Icon, { Rotation = 0 }, 0.5, "Out", "Quart")
			end)
		end
	end

	transition.ToggleBlack(-1, 0.3)
	animation.AnimateAsync(eventWindow, { GroupTransparency = 0 }, 1, "In", "Quad")
end
function networkClient.GoToEncounter()
	UpdateRunCamera(t1.Floor)
	transition.ToggleBlack(-1, 0.3)
	rogue.Enabled = true
	rogue.Functional.Visible = true
	cardWindow.Visible = false
	eventWindow.Visible = false

	local v94 = encounters[t1.Layout[t1.Floor].Encounter]

	PreloadTech(rogue, { "rbxassetid://" .. v94.Icon })
	encounterWindow.TextLabel.Position = UDim2.fromScale(0.5, -0.1)
	encounterWindow.Encounter.Size = UDim2.fromScale(1, 1)
	encounterWindow.Encounter.ImageTransparency = 1
	encounterWindow.Encounter.CanvasGroup.GroupTransparency = 1
	encounterWindow.Encounter.CanvasGroup.Position = UDim2.fromScale(0, 1)
	encounterWindow.Encounter.Image = "rbxassetid://" .. v94.Icon
	encounterWindow.Visible = true

	local animationAnimate = animation.Animate
	local encounterWindowTextLabel = encounterWindow.TextLabel
	local v97 = UDim2.fromScale(0.5, 0.135)

	animationAnimate(encounterWindowTextLabel, { Position = v97 }, 1, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local encounterWindowEncounter = encounterWindow.Encounter

	v97 = UDim2.fromScale(0.5, 0.5)
	animationAnimateAsync(encounterWindowEncounter, { ImageTransparency = 0, Size = v97 }, 0.5, "In", "Quart")
	task.wait(0.25)
	audioService.PlaySound("new encounter")
	task.wait(1.25)

	local encounter = encounterWindow.Encounter
	local clone = rogue.Templates.TextTemplate:Clone()

	clone.Parent = encounterWindow
	clone.Position = UDim2.fromOffset(encounter.AbsolutePosition.X + encounter.AbsoluteSize.X / 2, encounter.AbsolutePosition.Y + encounter.AbsoluteSize.Y)
	clone.Visible = true
	v97 = UDim2.fromOffset(encounter.AbsolutePosition.X + encounter.AbsoluteSize.X / 2 - clone.TextTail.AbsoluteSize.X / 2, encounter.AbsolutePosition.Y + encounter.AbsoluteSize.Y + clone.AbsoluteSize.Y)
	clone:TweenPosition(v97, "Out", "Quart", 0.5)

	local replacedText = v94.PreBattleMessage:gsub("<br%s*/>", "\n")

	replacedText:gsub("<[^<>]->", "")
	clone.Text = replacedText
	audioService.PlaySound(v94.Sound or "click1")

	local n1: number = 0

	for iterFirst, iterSecond in utf8.graphemes(replacedText) do
		n1 += 1
		clone.MaxVisibleGraphemes = n1

		if n1 % 2 == 0 and n1 < replacedText:len() / 2 then
			audioService.PlaySound(v94.Sound or "click1")
		end

		task.wait(0.01)
	end

	task.wait(1)
	task.spawn(function()
		animation.AnimateAsync(clone.TextTail, { ImageTransparency = 1 }, 1, "In", "Quart")
		animation.Animate(clone, { TextTransparency = 1, BackgroundTransparency = 1 }, 1, "In", "Quart")
		clone:Destroy()
	end)
	task.wait(0.5)

	local animate = animation.Animate
	local canvasGroup = encounterWindow.Encounter.CanvasGroup
	local v108 = UDim2.fromScale(0, 1.05)

	animate(canvasGroup, { GroupTransparency = 0, Position = v108 }, 0.5, "Out", "Quart")
end
function networkClient.GoToCutscene()
	transition.ToggleBlack(1, 0.3)

	local cutscene = events[t1.CurrentEvent].Cutscene

	eventWindow.Visible = false
	rogue.Functional.Visible = false
	visualNovel.SetMainCharacterData(t1.Mode, t1.Character)
	task.wait(0.7)
	task.spawn(function()
		visualNovel.Start(cutscene)
		goToBuckets()
	end)
end

local cardTarget = rogue:WaitForChild("CardTarget")
local cardSelector = cardTarget:WaitForChild("Window"):WaitForChild("CardSelector")

function networkClient.OpenCardTarget(p12)
	local u111 = nil
	local u112 = nil

	for _, v in pairs(cardSelector:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	cardTarget.Window.SelectButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

	for _, v in pairs(p12) do
		local v117 = cardLibrary[v]
		local clone = rogue.Templates.CardTemplate:Clone()

		clone.Parent = cardSelector
		clone.Image = "rbxassetid://" .. v117.Id
		clone.MouseButton1Click:Connect(function()
			if not u111 then
				cardTarget.Window.SelectButton.BackgroundColor3 = Color3.fromRGB(100, 212, 104)
			end

			u111 = v

			if u112 then
				u112.Target.Visible = false
			end

			u112 = clone
			clone.Target.Visible = true
			audioService.PlaySound("UI-MouseOver Pop HD")
		end)
		nonGameCard.BindInspect(clone, v117)
		clone.Visible = true
	end

	local connection = nil

	connection = cardTarget.Window.SelectButton.MouseButton1Click:Connect(function()
		if not u111 then
			return
		end

		networkFireServer("SelectACardInRun", t1.Mode, u111)
		cardTarget.Visible = false
		connection:Disconnect()
	end)
	cardTarget.BackgroundTransparency = 1
	cardTarget.Visible = true
	animation.AnimateAsync(cardTarget, { BackgroundTransparency = 0.1 }, 1, "Out", "Quart")
end
function networkClient.DebugEnterBattle()
	rogue.DebugFrame.Visible = true
end

rogue.EncounterWindow.Encounter.CanvasGroup.ChallengeButton.MouseButton1Click:Connect(function()
	audioService.PlaySound("Ascend2")
	networkFireServer("EnterRunBattle", t1.Mode)
	rogue.Enabled = false
end)

if game.PlaceId == 7105900056 then
	rogue.EncounterWindow.Encounter.CanvasGroup.ChallengeButton.MouseButton2Click:Connect(function()
		rogue.DebugFrame.Visible = true
	end)

	local templateButton = rogue.DebugFrame.SetNextEncounter.TemplateButton

	for k, _ in pairs(encounters) do
		local clone = templateButton:Clone()

		clone.Text = k
		clone.Parent = rogue.DebugFrame.SetNextEncounter
		clone.Visible = true
		clone.MouseButton1Click:Connect(function()
			networkFireServer("DebugSetNextEncounter", clone.Text)
			rogue.DebugFrame.SetEncounterNote.Text = "Set next encounter to " .. clone.Text
		end)
	end
end

local connection = nil

local function HideDeck()
	if connection then
		connection:Disconnect()
	end

	rogue.BattleCardTable.Visible = false
end
local function ShowDeck(p13)
	local rogue = LocalPlayer.PlayerGui.Rogue
	local cardHolder = rogue.BattleCardTable.ScrollingFrame.CardHolder
	local cardTemplate = rogue.Templates.CardTemplate

	rogue.BattleCardTable.Detail.Text = "Your Deck"
	rogue.BattleCardTable.Select.Visible = false

	for _, v in pairs(cardHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	local n1 = cardHolder.AbsoluteSize.X / 8

	cardHolder.UIGridLayout.CellSize = UDim2.fromOffset(n1 - 6, n1 / 0.6333333333333333 - 6)
	rogue.BattleCardTable.Close.BackgroundTransparency = 1
	animation.AnimateAsync(rogue.BattleCardTable.Close, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quart")

	for k, v in pairs(p13) do
		local v129 = cardLibrary[k]

		if v129 and v129.Id then
			for _ = 1, v do
				local clone = cardTemplate:Clone()

				clone.Parent = cardHolder
				clone.Name = k
				clone.Image = "rbxassetid://" .. v129.Id
				clone.ZIndex = 10

				if v129.Archetype and v129.Archetype == "Starting Gear" then
					clone.LayoutOrder = 1
				elseif v129.Archetype and v129.Archetype == "Special" then
					clone.LayoutOrder = 2
				elseif v129.Archetype and v129.Archetype == "Treasure" then
					clone.LayoutOrder = 3
				elseif v129.Archetype and v129.Archetype == "Lesser Treasure" then
					clone.LayoutOrder = 4
				else
					clone.LayoutOrder = 5
				end

				nonGameCard.BindInspect(clone, v129)
				clone.Visible = true
			end
		end
	end

	rogue.BattleCardTable.Visible = true
	connection = rogue.BattleCardTable.Close.MouseButton1Click:Connect(HideDeck)
end
function networkClient.OpenMultipleCardTarget(p14, p15, p16)
	local rogue = LocalPlayer.PlayerGui.Rogue
	local cardHolder = rogue.BattleCardTable.ScrollingFrame.CardHolder
	local cardTemplate = rogue.Templates.CardTemplate

	rogue.BattleCardTable.Detail.Text = "Select up to " .. p15 .. " cards to " .. (p16 or "remove.")
	rogue.BattleCardTable.Select.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
	rogue.BattleCardTable.Select.Visible = true

	local t4: {[any]: any} = {}

	local function UpdateSelectButton()
		if not next(t4) then
			rogue.BattleCardTable.Select.BackgroundColor3 = Color3.fromRGB(69, 69, 69)

			return
		end

		rogue.BattleCardTable.Select.BackgroundColor3 = Color3.fromRGB(78, 167, 58)
	end

	for _, v in pairs(cardHolder:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	local n1 = cardHolder.AbsoluteSize.X / 8

	cardHolder.UIGridLayout.CellSize = UDim2.fromOffset(n1 - 6, n1 / 0.6333333333333333 - 6)
	rogue.BattleCardTable.Close.BackgroundTransparency = 1
	animation.AnimateAsync(rogue.BattleCardTable.Close, { BackgroundTransparency = 0.5 }, 0.5, "Out", "Quart")

	for k, v in pairs(p14) do
		for _ = 1, v do
			local v146 = cardLibrary[k]

			if v146 and v146.Id then
				local clone = cardTemplate:Clone()

				clone.Parent = cardHolder
				clone.Name = k
				clone.Image = "rbxassetid://" .. v146.Id
				clone.ZIndex = 10
				clone.LayoutOrder = 1
				nonGameCard.BindInspect(clone, v146)
				clone.Added.Changed:Connect(function()
					clone.Target.Visible = clone.Added.Value
				end)
				clone.MouseButton1Click:Connect(function()
					if clone.Added.Value == false then
						if #t4 >= p15 then
							audioService.PlaySound("Kerplunk.wav")

							return
						end

						table.insert(t4, k)
						clone.Added.Value = true
					else
						table.remove(t4, table.find(t4, k))
						clone.Added.Value = false
					end

					audioService.PlaySound("UI-MouseOver Pop HD")
					UpdateSelectButton()
				end)
				clone.Visible = true
			end
		end
	end

	rogue.BattleCardTable.Visible = true

	local connection = nil

	connection = rogue.BattleCardTable.Select.MouseButton1Click:Connect(function()
		if not next(t4) then
			return
		end

		networkFireServer("SelectCardsInRun", t1.Mode, t4)
		rogue.BattleCardTable.Visible = false
		connection:Disconnect()
	end)
end

rogue.Functional.ShowDeck.MouseButton1Click:Connect(function()
	audioService.PlaySound("Draw")
	ShowDeck(t1.Deck)
end)
rogue.DebugFrame.Win.MouseButton1Click:Connect(function()
	local numberValue: number? = tonumber(rogue.DebugFrame.Life.Text)

	networkFireServer("DebugRunWin", numberValue)
	rogue.DebugFrame.Visible = false
end)
rogue.DebugFrame.Lose.MouseButton1Click:Connect(function()
	networkFireServer("DebugRunLose")
	rogue.DebugFrame.Visible = false
end)

local rogueRunRewards = rogue.RunRewards
local u45: boolean = false

rogueRunRewards.BloxBux.Value.Changed:Connect(function()
	if not u45 then
		u45 = true
		task.spawn(function()
			audioService.PlaySound("clickfast.wav")
			task.wait(0.01)
			u45 = false
		end)
	end

	rogueRunRewards.BloxBux.Text = rogueRunRewards.BloxBux.Value.Value .. "ʙʙ"
end)

local function OpenResultsScreen(p17)
	transition.ToggleBlack(1, 0.3)
	UpdateRunCamera(t1.Floor)
	rogue.Enabled = true
	rogue.Functional.Visible = false
	eventWindow.Visible = false
	encounterWindow.Visible = false
	rogue.Functional.Visible = false
	rogueRunRewards.Title.Text = if p17.Victory then "Victory!" else "Defeat..."
	rogueRunRewards.Mode.Text = modes[t1.Mode].Name
	rogueRunRewards.Character.Text = modes[t1.Mode].Characters[t1.Character].Name
	rogueRunRewards.Exit.Visible = false
	rogueRunRewards.BloxBux.Value.Value = 0
	rogueRunRewards.BloxBux.Text = "0ʙʙ"

	for _, v in pairs(rogueRunRewards.Rewards:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	rogueRunRewards.Visible = true
	transition.ToggleBlack(-1, 0.3)
	task.wait(1)

	local n1 = 0

	for _, v in pairs(p17.Rewards) do
		local clone = rogueRunRewards.Templates.RewardTemplate:Clone()

		clone.Size = UDim2.fromScale(0.4, 0.1)
		clone.Title.Text = v[1]
		clone.Reward.Text = v[2]
		n1 += v[2]

		if v[3] then
			clone.BackgroundColor3 = v[3]
		end

		clone.Parent = rogueRunRewards.Rewards
		clone.Visible = true

		local animationAnimateAsync = animation.AnimateAsync
		local v158 = UDim2.fromScale(1, 0.1)

		animationAnimateAsync(clone, { Size = v158 }, 0.5, "Out", "Quart")
		audioService.PlaySound("PewImpact")
		task.wait(0.75)
	end

	task.wait(0.5)

	local value = math.clamp(n1, 0, 100000)

	animation.Animate(rogueRunRewards.BloxBux.Value, { Value = value }, value / 1000 * 2, "Out", "Quint")
	audioService.PlaySound("scan complete")
	rogueRunRewards.Exit.Visible = true
end

rogueRunRewards.Exit.MouseButton1Click:Connect(function()
	rogueRunRewards.Visible = false
	networkFireServer("EndRun", t1.Mode)
end)

function networkClient.GoToEndscreen()
	local v160 = networkInvokeServer("GetResultsTable", t1.Mode)

	OpenResultsScreen(v160)
end

local runLoadingScreen = LocalPlayer.PlayerGui.RunLoadingScreen

function networkClient.RunShowTeleportScreen(p18, p19)
	runLoadingScreen.Frame.BackgroundTransparency = 1
	runLoadingScreen.Frame.TextLabel.TextTransparency = 1
	runLoadingScreen.Frame.TextLabel2.TextTransparency = 1

	if p18 then
		runLoadingScreen.Frame.TextLabel.Text = p18
	end

	if p19 then
		runLoadingScreen.Frame.TextLabel2.Text = p19
	end

	runLoadingScreen.Enabled = true
	animation.AnimateAsync(runLoadingScreen.Frame, { BackgroundTransparency = 0 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(runLoadingScreen.Frame.TextLabel, { TextTransparency = 0 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(runLoadingScreen.Frame.TextLabel2, { TextTransparency = 0 }, 0.5, "Out", "Quart")
end
function networkClient.QueueShowTeleportScreen(p20, p21)
	networkClient.RunShowTeleportScreen(p20, p21)
end

return {}
