



game:GetService("ProximityPromptService")

local contentProvider: ContentProvider = game:GetService("ContentProvider")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Players")

local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera: Camera = workspace.CurrentCamera
local v5 = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
local starterPlayerScripts = game:GetService("StarterPlayer").StarterPlayerScripts
local allCutsceneProfiles = require(script.AllCutsceneProfiles)
local effects = require(replicatedStorage.Effects)
local transition = require(script.Parent.Transition)
local u10 = nil
local audioService = require(replicatedStorage.AudioService)
local promise = require(replicatedStorage.Promise)
local animation = require(replicatedStorage.Animation)
local face = require(replicatedStorage.Face)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local handy = require(script.Parent.Handy).handy
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local effect = playerGui:WaitForChild("VisGui").Effect
local cutsceneStuff = playerGui:WaitForChild("CutsceneStuff")
local subtitles = cutsceneStuff:WaitForChild("Subtitles")
local subtitlesText = subtitles:WaitForChild("SubtitlesText")
local movies: Instance = replicatedStorage:WaitForChild("Movies")

local function Color3ToHex(p1)
	local floored = math.floor(p1.r * 255 + 0.5)
	local floored2 = math.floor(p1.g * 255 + 0.5)
	local floored3 = math.floor(p1.b * 255 + 0.5)

	return string.format("#%02X%02X%02X", floored, floored2, floored3)
end
local function ApplyValues(p2, p3)
	for k, v in pairs(p3) do
		p2[k] = v
	end
end
function NewerCircle(parent, p5)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = UDim2.fromScale(0, 0)
	imageLabel.Parent = parent

	for k, v in pairs(p5) do
		imageLabel[k] = v
	end

	return imageLabel
end

local t1: {[any]: any} = {}

local function PreloadTech(p6, p7: {[any]: any})
	if typeof(p7) == "string" then
		p7 = { p7 }
	end

	local t3: {[any]: any} = {}

	for _, v in ipairs(p7) do
		if not t1[v] then
			t1[v] = true

			local v53 = UDim2.fromOffset(1, 1)
			local v54 = UDim2.fromScale(-1, -1)
			local v55 = NewerCircle(p6, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Size = v53,
				Position = v54,
				Image = v
			})

			table.insert(t3, v55)
		end
	end

	task.spawn(function()
		task.wait(1)

		for _, v in ipairs(t3) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
local function GetSubtitleString(p8)
	local s1: string = ""

	if u10 then
		s1 = "<b>[" .. u10.Name .. "]</b>"

		if u10.NameColor then
			local nameColor = u10.NameColor
			local floored = math.floor(nameColor.r * 255 + 0.5)
			local floored4 = math.floor(nameColor.g * 255 + 0.5)
			local floored5 = math.floor(nameColor.b * 255 + 0.5)

			s1 = "<font color=\"" .. string.format("#%02X%02X%02X", floored, floored4, floored5) .. "\">" .. s1 .. "</font>"
		end
	end

	return s1 .. " " .. p8
end
local function TurnOnBlackBars(p9, p10)
	cutsceneStuff.BlackBarTop.Position = UDim2.fromScale(0, 1)
	cutsceneStuff.BlackBarBot.Position = UDim2.fromScale(0, 1.1)
	cutsceneStuff.BlackBarTop.Visible = true
	cutsceneStuff.BlackBarBot.Visible = true

	local animationAnimateAsync = animation.AnimateAsync
	local cutsceneStuffBlackBarTop = cutsceneStuff.BlackBarTop
	local v66 = UDim2.fromScale(0, 0)

	animationAnimateAsync(cutsceneStuffBlackBarTop, { Position = v66 }, p9, "InOut", "Quad")

	local animateAsync = animation.AnimateAsync
	local cutsceneStuffBlackBarBot = cutsceneStuff.BlackBarBot

	v66 = UDim2.fromScale(0, 1)
	animateAsync(cutsceneStuffBlackBarBot, { Position = v66 }, p9, "InOut", "Quad")
	animation.AnimateAsync(CurrentCamera, { FieldOfView = p10 }, p9, "InOut", "Quad")
end
local function TurnOffBlackBars(p11)
	cutsceneStuff.BlackBarTop.Position = UDim2.fromScale(0, 0)
	cutsceneStuff.BlackBarBot.Position = UDim2.fromScale(0, 1)

	local animationAnimateAsync = animation.AnimateAsync
	local cutsceneStuffBlackBarTop = cutsceneStuff.BlackBarTop
	local v72 = UDim2.fromScale(0, -0.1)

	animationAnimateAsync(cutsceneStuffBlackBarTop, { Position = v72 }, p11, "InOut", "Quad")

	local animateAsync = animation.AnimateAsync
	local cutsceneStuffBlackBarBot = cutsceneStuff.BlackBarBot

	v72 = UDim2.fromScale(0, 1.1)
	animateAsync(cutsceneStuffBlackBarBot, { Position = v72 }, p11, "InOut", "Quad")
	task.spawn(function()
		animation.AnimateAsync(CurrentCamera, { FieldOfView = 70 }, p11, "InOut", "Quad")
		cutsceneStuff.BlackBarTop.Visible = false
		cutsceneStuff.BlackBarBot.Visible = false
	end)
end

local u33 = nil

local t2: {[any]: any} = {
	UIEffect = function(p12)
		if effects[p12] then
			effects[p12](playerGui.VisGui.Effect)
		end
	end,
	SetProfile = function(p13)
		if not p13 then
			u10 = nil
		end

		u10 = allCutsceneProfiles[p13]
	end,
	Subtitle = function(p14, _, _)
		local s1: string = ""

		if u10 then
			s1 = "<b>[" .. u10.Name .. "]</b>"

			if u10.NameColor then
				local nameColor = u10.NameColor
				local floored = math.floor(nameColor.r * 255 + 0.5)
				local floored6 = math.floor(nameColor.g * 255 + 0.5)
				local floored7 = math.floor(nameColor.b * 255 + 0.5)

				s1 = "<font color=\"" .. string.format("#%02X%02X%02X", floored, floored6, floored7) .. "\">" .. s1 .. "</font>"
			end
		end

		local text: string = s1 .. " " .. p14

		subtitlesText.Text = text

		local v86 = string.len(subtitlesText.ContentText)

		if u33 then
			u33:cancel()
		end

		u33 = promise.new(function(p17, _, _)
			local v155 = u10.Sound or "textblip"
			local n1 = string.len(u10.Name) + 2

			for iterFirst, iterSecond in utf8.graphemes(text) do
				n1 += 1
				subtitlesText.MaxVisibleGraphemes = n1

				if subtitlesText.MaxVisibleGraphemes < v86 and n1 % 2 == 0 then
					audioService.PlaySound(v155)
				end

				task.wait(0.032)
			end

			p17()
		end)
		subtitles.Position = UDim2.fromScale(0.5, 0.875)
		subtitles.Visible = true

		local animationAnimateAsync = animation.AnimateAsync
		local v88 = UDim2.fromScale(0.5, 0.85)

		animationAnimateAsync(subtitles, { Position = v88 }, 0.4, "Out", "Quart")
	end,
	UnsetSubtitle = function()
		subtitles.Visible = false
	end,
	Sound = function(p20)
		audioService.PlaySound(p20)
	end,
	TurnOnBlackScreen = function(p21)
		local transitionToggleBlack = transition.ToggleBlack
		local numberValue: number? = tonumber(p21)

		transitionToggleBlack(1, numberValue)
	end,
	TurnOffBlackScreen = function(p22)
		local transitionToggleBlack = transition.ToggleBlack
		local numberValue: number? = tonumber(p22)

		transitionToggleBlack(-1, numberValue)
	end,
	TurnOnBlackBars = function(p23)
		local numberValue: number? = tonumber(p23)

		TurnOnBlackBars(numberValue)
	end,
	TurnOffBlackBars = function(p24)
		local numberValue: number? = tonumber(p24)

		TurnOffBlackBars(numberValue)
	end,
	FaceCreate = function(p25, p26)
		local parts = string.split(p25, ",")

		face.CreateFace(p26, parts[1], parts[2])
	end,
	FaceBlink = function(p27, p28)
		if p27 then
			local parts = string.split(p27, ",")

			face.BlinkFace(p28, parts[1], parts[2])

			return
		end

		face.BlinkFace(p28)
	end,
	FaceChangeEyes = function(p29, p30)
		face.ChangeEyes(p30, p29)
	end,
	FaceChangeMouth = function(p31, p32)
		face.ChangeMouth(p32, p31)
	end,
	SetFOV = function(p33)
		local animationAnimateAsync = animation.AnimateAsync
		local numberValue: number? = tonumber(p33)

		animationAnimateAsync(CurrentCamera, { FieldOfView = numberValue }, 1, "InOut", "Quad")
	end
}

function networkClient.StartCutscene(p34)
	if not movies:FindFirstChild(p34) then
		return
	end

	local v114 = require(movies[p34])
	local foundChild = replicatedStorage.MoviePlacements:FindFirstChild(v114.Settings.CutscenePlacement or p34)

	print(p34)

	if not foundChild then
		warn("StartCutscene : You need a CutscenePlacement, refer to the folder : " .. p34)

		return
	end

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid.AutoRotate = false
	end

	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}
	local t6: {[any]: any} = {}
	local t7: {[any]: any} = {}
	local u121 = nil

	transition.ToggleBlack(1, 0.2)

	local t8: {[any]: any} = {}

	for _, v in pairs(v114.Rigs) do
		local animation2: Animation = Instance.new("Animation")

		animation2.AnimationId = "rbxassetid://" .. v.Id
		table.insert(t8, animation2)
	end

	contentProvider:PreloadAsync(t8, function()
		print("Loaded")
	end)

	if v114.Preload then
		contentProvider:PreloadAsync(v114.Preload)
	end

	for _, v in pairs(t8) do
		v:Destroy()
	end

	task.wait(0.2)
	networkClient.MuteWorld()
	v5:Disable()
	LocalPlayer.Character.Humanoid.AutoRotate = false
	TurnOnBlackBars(0, v114.Settings.FOV or 30)

	local bindableEvent: BindableEvent = Instance.new("BindableEvent")

	if v114.Settings.HideDuelists then
		for _, v in pairs(v114.Settings.HideDuelists) do
			local v = workspace.Duelists:FindFirstChild(v)

			if v then
				v.Parent = game.ReplicatedStorage.Trash
			end
		end
	end

	for _, v in pairs(v114.Rigs) do
		local Character = nil

		if v.IsPlayerCharacter then
			Character = LocalPlayer.Character
		elseif v.Camera then
			Character = replicatedStorage.MoviePlacements.CameraRig:Clone()
			u121 = Character
			u121.Parent = workspace
		elseif v.IsDummy then
			Character = replicatedStorage.Dummies:FindFirstChild(v.IsDummy)

			if not Character then
				warn("Attemping to rig an entity which doesn't exist: " .. v.IsDummy)
			end

			Character.Parent = workspace.Dummies
			table.insert(t7, Character)
		end

		local v135 = Character:FindFirstChild("Humanoid") or Character:FindFirstChild("AnimationController")

		if not v135 then
			warn("No controller for rig : " .. Character.Name)

			return
		end

		local animation3: Animation = Instance.new("Animation")

		animation3.AnimationId = "rbxassetid://" .. v.Id

		local animationTrack = v135:LoadAnimation(animation3)

		animationTrack.Priority = Enum.AnimationPriority.Action3

		local v138 = Character:FindFirstChild("HumanoidRootPart") or Character.PrimaryPart

		v138.Anchored = true
		Character:PivotTo(foundChild[v.CFrame].CFrame)

		if v.Face then
			local v139 = face.CreateFace(Character, v.Face.Eyes, v.Face.Mouth)

			table.insert(t6, v139)
			contentProvider:PreloadAsync(v.Face.Eyes, function()
				print("Loaded eyes")
			end)
			PreloadTech(effect, v.Face.Eyes)
			contentProvider:PreloadAsync(v.Face.Mouth, function()
				print("Loaded mouth")
			end)
			PreloadTech(effect, v.Face.Mouth)
		end

		table.insert(t5, v138)
		table.insert(t4, animationTrack)
	end

	CurrentCamera.FieldOfView = v114.Settings.FOV or 30
	CurrentCamera.CameraType = Enum.CameraType.Scriptable

	local cameraPart = u121.CameraPart
	local connection = nil
	local connection2 = nil
	local u143: boolean = false

	for key, value in t4 do
		value.KeyframeReached:Connect(function(p35)
			if p35 == "End" then
				transition.ToggleBlack(1, 0.2)
				subtitles.Visible = false
				connection:Disconnect()
				connection2:Disconnect()
				networkClient.UnmuteWorld()
				cutsceneStuff.Click.Visible = false
				CurrentCamera.CameraType = Enum.CameraType.Custom

				local humanoid2 = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

				if humanoid2 then
					workspace.CurrentCamera.CameraSubject = humanoid2
					humanoid2.AutoRotate = true
				end

				u121:Destroy()

				for _, v in pairs(t7) do
					v.Parent = replicatedStorage.Dummies
				end

				if v114.Settings.HideDuelists then
					for _, v in pairs(v114.Settings.HideDuelists) do
						local v = game.ReplicatedStorage.Trash:FindFirstChild(v)

						if v then
							v.Parent = workspace.Duelists
						end
					end
				end

				CurrentCamera.FieldOfView = 70

				for _, v in pairs(t4) do
					v:Stop()
					v:Destroy()
				end

				for _, v in pairs(t6) do
					v:Destroy()
				end

				v5:Enable()
				TurnOffBlackBars(0)
				bindableEvent:Fire()
			end
		end)

		for k, v in pairs(t2) do
			value:GetMarkerReachedSignal(k):Connect(function(p36)
				v(p36, t5[key].Parent, t4[key])
			end)
		end

		value:GetMarkerReachedSignal("Pause"):Connect(function(_)
			u143 = true
			cutsceneStuff.Continue.TextTransparency = 1
			cutsceneStuff.Continue.Visible = true
			animation.AnimateAsync(cutsceneStuff.Continue, { TextTransparency = 0 }, 0.5, "Out", "Quart")

			for k, v in pairs(v114.Rigs) do
				if not v.AlwaysPlaying then
					t4[k]:AdjustSpeed(0)
				else
					t4[k]:AdjustSpeed(1)
				end
			end
		end)
	end

	for _, v in pairs(t4) do
		v:Play()
	end

	connection = game:GetService("RunService").RenderStepped:Connect(function()
		CurrentCamera.CFrame = cameraPart.CFrame
	end)
	connection2 = cutsceneStuff.Click.MouseButton1Click:Connect(function()
		if u143 then
			for k, _ in pairs(v114.Rigs) do
				t4[k]:AdjustSpeed(1)
			end

			u143 = false
			cutsceneStuff.Continue.Visible = false
		end
	end)

	if v114.Settings.PlayerPlacement then
		LocalPlayer.Character:PivotTo(foundChild[v114.Settings.PlayerPlacement].CFrame)
	end

	transition.ToggleBlack(-1, 0.2)
	cutsceneStuff.Click.Visible = true
	bindableEvent.Event:Wait()
	bindableEvent:Destroy()
end

return {
	Server = {}
}
