



local module: {[any]: any} = {}
local t2: {[any]: any} = {}
local LocalPlayer = game.Players.LocalPlayer
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local lighting: Lighting = game:GetService("Lighting")
local textChatService: TextChatService = game:GetService("TextChatService")
local contentProvider: ContentProvider = game:GetService("ContentProvider")
local debris: Debris = game:GetService("Debris")
local CurrentCamera: Camera = workspace.CurrentCamera
local animation = require(replicatedStorage.Animation)
local audioService = require(replicatedStorage.AudioService)
local effects = require(replicatedStorage.Effects)
local network = require(script.Parent.Parent.Network)
local transition = require(script.Parent.Parent.Transition)
local duelMenu = require(script.Parent.Parent.DuelMenu)
local loreMenu = require(script.Parent.Parent.LoreMenu)
local maid = require(replicatedStorage.Maid)
local networkClient = network.client
local networkInvokeServer = network.InvokeServer
local networkFireServer = network.FireServer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local effect = playerGui:WaitForChild("VisGui").Effect
local dialog2 = playerGui:WaitForChild("Dialog2")
local CFrame = nil
local oldHeadCFrames = require(script.Parent.OldHeadCFrames)
local t3: {[any]: any} = {}

local function FaceHolderSet(p1, p2)
	local faceHolder = p1:FindFirstChild("FaceHolder")

	if not faceHolder then
		warn("FaceHolderSet: no face holder")

		return
	end

	local foundChild = faceHolder:FindFirstChild(p2)

	if not foundChild then
		warn("FaceHolderSet: no face")

		return
	end

	for _, v in pairs(faceHolder:GetChildren()) do
		if v:IsA("Decal") then
			v.Transparency = 0.999
		end
	end

	foundChild.Transparency = 0
end
local function ApplyValues(p3, p4)
	for k, v in pairs(p4) do
		p3[k] = v
	end
end
function NewerCircle(parent, p6)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = UDim2.fromScale(0, 0)
	imageLabel.Parent = parent

	for k, v in pairs(p6) do
		imageLabel[k] = v
	end

	return imageLabel
end

local t4: {[any]: any} = {}

local function PreloadTech(p7, p8: {[any]: any})
	if typeof(p8) == "string" then
		p8 = { p8 }
	end

	local t5: {[any]: any} = {}

	for _, v in ipairs(p8) do
		if not t4[v] then
			t4[v] = true

			local v84 = UDim2.fromOffset(1, 1)
			local v85 = UDim2.fromScale(-1, -1)
			local v86 = NewerCircle(p7, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Size = v84,
				Position = v85,
				Image = v
			})

			table.insert(t5, v86)
		end
	end

	task.spawn(function()
		task.wait(1)

		for _, v in ipairs(t5) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
local function PreloadAssets(p9)
	contentProvider:PreloadAsync(p9)
end
local function PreloadAnimations(p10)
	local t6: {[any]: any} = {}

	for _, v in pairs(p10) do
		local animation2: Animation = Instance.new("Animation")

		animation2.AnimationId = v
		table.insert(t6, animation2)
	end

	task.spawn(function()
		contentProvider:PreloadAsync(t6)

		for _, v in pairs(t6) do
			v:Destroy()
		end
	end)
end
local function LoadAnimation(p11, animationId, _)
	local animator = p11:FindFirstChild("Animator")
	local animation3: Animation = Instance.new("Animation")

	animation3.AnimationId = animationId

	local animationTrack = (animator or p11):LoadAnimation(animation3)

	animationTrack:GetMarkerReachedSignal("Pause"):Connect(function()
		animationTrack:AdjustSpeed(0)
	end)
	animationTrack:GetMarkerReachedSignal("FaceHolderSet"):Connect(function(p14)
		FaceHolderSet(p11.Parent, p14)
	end)
	animationTrack:GetMarkerReachedSignal("ShowDialog"):Connect(function(p15)
		print("ShowDialogMarker")
		module.ShowDialog(p15)
	end)
	animationTrack:GetMarkerReachedSignal("CloseDialog"):Connect(function(p16)
		print("CloseDialogMarker")
		module.CloseDialog(p16)
	end)
	animationTrack:GetMarkerReachedSignal("InvisDialog"):Connect(function()
		module.ToggleDialogVisible(false)
	end)
	animationTrack:GetMarkerReachedSignal("UninvisDialog"):Connect(function()
		module.ToggleDialogVisible(true)
	end)

	for k, _ in pairs(module) do
		if k ~= "ShowDialog" and k ~= "CloseDialog" then
			animationTrack:GetMarkerReachedSignal(k):Connect(function(p17)
				print(k)
				print(p17)

				if string.find(p17, ",") then
					local parts = string.split(p17, ",")

					module[k](nil, unpack(parts))

					return
				end

				module[k](nil, p17)
			end)
		end
	end

	animation3:Destroy()

	return animationTrack
end
local function PlayAnimation(p18, p19, p20)
	local v104 = LoadAnimation(p18, p19, p20)

	v104:Play(p20 or 0)

	return v104
end
local function CreateDummyDuelist(p21)
	local clone = p21:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	p21.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false

	return clone
end
local function CreateDummyFromDummy(p22)
	local clone = p22:Clone()

	if clone:FindFirstChild("Head") and clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	clone.Parent = workspace

	if clone:FindFirstChild("HumanoidRootPart") then
		clone.HumanoidRootPart.Anchored = false
	end

	if clone:FindFirstChild("Humanoid") then
		clone:FindFirstChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	end

	return clone
end
local function CreateDummyFromDummyStatic(p23)
	local clone = p23:Clone()

	if clone:FindFirstChild("Head") and clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	clone.Parent = workspace

	if clone:FindFirstChild("HumanoidRootPart") then
		clone.HumanoidRootPart.Anchored = true
	end

	if clone:FindFirstChild("Humanoid") then
		clone:FindFirstChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)

		for _, v in pairs(clone:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Massless = true
			end
		end
	end

	return clone
end
local function LookTowards(p24, p25)
	if not p25 or not p24 then
		return
	end

	if not p25.HumanoidRootPart or not p24.HumanoidRootPart then
		warn("Missing HumanoidRootPart for" .. p25.Name)

		return
	end

	local HumanoidRootPartPosition = p24.HumanoidRootPart.Position
	local v116 = CFrame.lookAt(HumanoidRootPartPosition, HumanoidRootPartPosition + (HumanoidRootPartPosition - p25.HumanoidRootPart.Position).Unit * Vector3.new(1, 0, 1), p24.PrimaryPart.CFrame.UpVector)
	local v117 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793)

	animation.AnimateAsync(p24.HumanoidRootPart, { CFrame = v116 * v117 }, 0.5, "Out", "Quad")
end
local function LookTowardsPart(p26, p27)
	local v120 = p26.HumanoidRootPart.Position
	local v121 = CFrame.lookAt(v120, v120 + (v120 - p27.Position).Unit * Vector3.new(1, 0, 1), p26.PrimaryPart.CFrame.UpVector)
	local v122 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793)

	animation.AnimateAsync(p26.HumanoidRootPart, { CFrame = v121 * v122 }, 0.5, "Out", "Quad")
end

LookTowardsPart = function(p28)
	local foundChild = workspace.Markers:FindFirstChild(p28)

	if not foundChild then
		warn("No marker: " .. p28)

		return
	end

	CFrame = CurrentCamera.CFrame
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = foundChild.CFrame
end

local function MoveCamera(p29, p30)
	local foundChild = workspace.Markers:FindFirstChild(p29)

	if not foundChild then
		warn("No marker: " .. p29)

		return
	end

	animation.AnimateAsync(CurrentCamera, { CFrame = foundChild.CFrame }, p30 or 0.8, "InOut", "Quad")
end
local function SetCamera(p31)
	local foundChild = workspace.Markers:FindFirstChild(p31)

	if not foundChild then
		warn("No marker: " .. p31)

		return
	end

	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = foundChild.CFrame
end
local function FocusCamera(p32, p33, p34)
	local animationAnimateAsync = animation.AnimateAsync
	local cFrame = CFrame.new(p32.Position + p32.CFrame.LookVector * (p34 or 25), p32.Position)

	animationAnimateAsync(CurrentCamera, { CFrame = cFrame }, p33 or 1.2, "InOut", "Quad")
end
local function ResetCamera()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end
end
local function TurnOnBlackBars(p35, p36)
	dialog2.BlackBarTop.Position = UDim2.fromScale(0, -0.1)
	dialog2.BlackBarBot.Position = UDim2.fromScale(0, 1.1)
	dialog2.BlackBarTop.Visible = true
	dialog2.BlackBarBot.Visible = true

	local animationAnimateAsync = animation.AnimateAsync
	local dialog2BlackBarTop = dialog2.BlackBarTop
	local v140 = UDim2.fromScale(0, 0)

	animationAnimateAsync(dialog2BlackBarTop, { Position = v140 }, p35, "InOut", "Quad")

	local animateAsync = animation.AnimateAsync
	local dialog2BlackBarBot = dialog2.BlackBarBot

	v140 = UDim2.fromScale(0, 1)
	animateAsync(dialog2BlackBarBot, { Position = v140 }, p35, "InOut", "Quad")
	animation.AnimateAsync(CurrentCamera, { FieldOfView = p36 }, p35, "InOut", "Quad")
end
function module.TurnOnBlackBars(_, p38, p39)
	TurnOnBlackBars(p38, p39)
end
local function turnOffBlackBars(p40)
	dialog2.BlackBarTop.Position = UDim2.fromScale(0, 0)
	dialog2.BlackBarBot.Position = UDim2.fromScale(0, 1)

	local animationAnimateAsync = animation.AnimateAsync
	local dialog2BlackBarTop = dialog2.BlackBarTop
	local v149 = UDim2.fromScale(0, -0.1)

	animationAnimateAsync(dialog2BlackBarTop, { Position = v149 }, p40, "InOut", "Quad")

	local animateAsync = animation.AnimateAsync
	local dialog2BlackBarBot = dialog2.BlackBarBot

	v149 = UDim2.fromScale(0, 1.1)
	animateAsync(dialog2BlackBarBot, { Position = v149 }, p40, "InOut", "Quad")
	task.spawn(function()
		animation.AnimateAsync(CurrentCamera, { FieldOfView = 70 }, p40, "InOut", "Quad")
		dialog2.BlackBarTop.Visible = false
		dialog2.BlackBarBot.Visible = false
	end)
end

module.TurnOffBlackBars = turnOffBlackBars

function module.PlayAnimation(p41, p42)
	LoadAnimation(p41.Humanoid, p42, nil):Play(0)
end
function module.PlayNPCAnimation(_, p44, p45)
	local Humanoid = p44.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	LoadAnimation(Humanoid, p45, nil):Play(0)
end
function module.PlayIdleAnimation(p46, p47)
	local Humanoid = p46.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	LoadAnimation(Humanoid, p47, nil):Play(0)
end
function module.ChangeFace(p48, texture)
	local v167 = p48.Head:FindFirstChild("face") or p48.Head:FindFirstChild("Decal")

	if not v167 then
		print("No face")

		return
	end

	v167.Texture = texture
end
function module.ChangeFaceHolder(p50, p51)
	FaceHolderSet(p50, p51)
end
function module.ChangeFaceAnimation(p52, p53, p54)
	FaceHolderSet(p52, p53)

	local Humanoid = p52.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	LoadAnimation(Humanoid, p54, nil):Play(0)
end
function module.ChangeFaceNPC(_, p56, p57)
	if not t2[p56] then
		warn("No NPC with name " .. p56 .. " in storage found")

		return
	end

	local v179 = t2[p56].Head:FindFirstChild("face") or t2[p56].Head:FindFirstChild("Decal")

	if not v179 then
		print("No face")

		return
	end

	v179.Texture = "rbxassetid://" .. p57
end
function module.MoveNPC(_, p59, p60)
	if not t2[p59] then
		warn("No NPC with name " .. p59 .. " in storage found")

		return
	end

	if not workspace.Markers[p60] then
		warn("No Marker found for " .. p60)

		return
	end

	t2[p59].Humanoid:MoveTo(workspace.Markers[p60].Position, workspace.Markers[p60])
end
function module.MovePlayer(_, p62)
	game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.Markers[p62].Position, workspace.Markers[p62])
end
function module.Nerd(p63)
	LoadAnimation(p63.Humanoid, "rbxassetid://103079678303656", nil):Play(0)
	p63.Head.face.Texture = "rbxassetid://929592474"
	task.delay(0.75, function()
		p63.Glasses.Handle.Transparency = 0.999
		p63.WhiteGlasses.Handle.Transparency = 0
		audioService.PlaySound("Shine")
	end)
end
function module.Nerd2(p64)
	local animator = p64.Humanoid.Animator

	animation.AnimateAsync(p64.Glasses.Handle, { Transparency = 0 }, 0.5, "Out", "Quad")
	animation.AnimateAsync(p64.WhiteGlasses.Handle, { Transparency = 0.999 }, 0.5, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local HumanoidRootPart = p64.HumanoidRootPart
	local v190 = CFrame.lookAt(p64.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position * Vector3.new(1, 0, 1) + p64.HumanoidRootPart.Position * Vector3.new(0, 1, 0))

	animationAnimateAsync(HumanoidRootPart, { CFrame = v190 }, 0.2, "Out", "Quart")
	animation.AnimateAsync(p64.Torso.Neck, { C0 = oldHeadCFrames[p64] }, 0.35, "Out", "Quart")
end
function module.Angry(p65)
	for _, v in pairs({
		p65.Head,
		p65["Left Leg"],
		p65["Right Leg"],
		p65["Left Arm"],
		p65["Right Arm"]
		}) do
		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(255, 106, 106)

		animationAnimateAsync(v, { Color = color3 }, 1, "InOut", "Quart")
	end

	audioService.PlaySound("FireballImpact")
	p65.Smoke.ParticleEmitter.Enabled = true
	p65.Smoke.ParticleEmitter.Rate = 1
end
function module.SuperAngry(p66)
	for _, v in pairs({
		p66.Head,
		p66["Left Leg"],
		p66["Right Leg"],
		p66["Left Arm"],
		p66["Right Arm"]
		}) do
		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(255, 37, 37)

		animationAnimateAsync(v, { Color = color3 }, 1, "InOut", "Quart")
	end

	audioService.PlaySound("FireballImpact")
	p66.Smoke.ParticleEmitter.Enabled = true
	p66.Smoke.ParticleEmitter.Rate = 50
end
function module.UnAngry(p67, p68)
	task.spawn(function()
		if p68 then
			task.wait(p68)
		end

		for _, v in pairs({
			p67.Head,
			p67["Left Leg"],
			p67["Right Leg"],
			p67["Left Arm"],
			p67["Right Arm"]
			}) do
			local animationAnimateAsync = animation.AnimateAsync
			local color3 = Color3.fromRGB(254, 243, 187)

			animationAnimateAsync(v, { Color = color3 }, 3, "Out", "Quart")
		end

		p67.Smoke.ParticleEmitter.Enabled = false
	end)
end
function module.WalkToPoint(p69, p70)
	local clone = p69:Clone()

	clone.HumanoidRootPart.Position = p69.HumanoidRootPart.Position
	clone.Parent = workspace
	p69.Parent = replicatedStorage.Trash

	local Humanoid = clone.Humanoid

	clone.HumanoidRootPart.Anchored = false
	LoadAnimation(Humanoid, "http://www.roblox.com/asset/?id=180426354", nil):Play(0)
	Humanoid:MoveTo(p70)
	task.spawn(function()
		task.wait(2.5)
		clone:Destroy()
	end)
end
function module.EnableBoombox(p71)
	local boombox = workspace.WorldElements:FindFirstChild("Boombox")

	if not boombox then
		return
	end

	if boombox.ProximityPrompt.Enabled then
		return
	end

	boombox.ProximityPrompt.Triggered:Connect(function(_)
		module.StartDialogWithNPC(p71, "EasyMage_Y")
	end)
	boombox.ProximityPrompt.Enabled = true
end
function module.TurnOffBoombox(p73)
	local boombox = workspace.WorldElements:FindFirstChild("Boombox")

	if not boombox then
		return
	end

	audioService.DimSongs()

	local animator = p73.Humanoid.Animator

	for _, v in pairs(boombox.Particles:GetChildren()) do
		v.Enabled = false
	end

	audioService.PlaySound("button.wav")
	boombox.Boombox.Song:Pause()

	for _, v in pairs(animator:GetPlayingAnimationTracks()) do
		v:AdjustSpeed(0)
	end
end
function module.YukiRage(p74)
	local Humanoid = p74.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	audioService.PlaySound("Bane")
	audioService.PlaySound("GiantLaser")
	p74.Head.face.Texture = "rbxassetid://83151028911479"
	LoadAnimation(Humanoid, "rbxassetid://73523999691680", nil):Play(0)

	for _, v in pairs(p74.Particle:GetChildren()) do
		v.Enabled = true
	end

	effects.YukiWhiteFlash(dialog2.Effect)
end
function module.YukiRerage(p75)
	local Humanoid = p75.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	audioService.PlaySound("Bane")
	audioService.PlaySound("GiantLaser")
	LoadAnimation(Humanoid, "rbxassetid://73523999691680", nil):Play(0)
	effects.YukiWhiteFlash(dialog2.Effect)
end
function module.TurnTowardsPlayer(p76)
	local animationAnimateAsync = animation.AnimateAsync
	local HumanoidRootPart = p76.HumanoidRootPart
	local v229 = CFrame.lookAt(p76.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position * Vector3.new(1, 0, 1) + p76.HumanoidRootPart.Position * Vector3.new(0, 1, 0))

	animationAnimateAsync(HumanoidRootPart, { CFrame = v229 }, 0.2, "Out", "Quart")
	animation.AnimateAsync(p76.Torso.Neck, { C0 = oldHeadCFrames[p76] }, 0.35, "Out", "Quart")
end
function module.TurnDummyTowardsPlayer(_, p78)
	local animationAnimateAsync = animation.AnimateAsync
	local HumanoidRootPart = t2[p78].HumanoidRootPart
	local v234 = CFrame.lookAt(t2[p78].HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position * Vector3.new(1, 0, 1) + t2[p78].HumanoidRootPart.Position * Vector3.new(0, 1, 0))

	animationAnimateAsync(HumanoidRootPart, { CFrame = v234 }, 0.2, "Out", "Quart")
	animation.AnimateAsync(t2[p78].Torso.Neck, { C0 = oldHeadCFrames[t2[p78]] }, 0.35, "Out", "Quart")
end
function module.ResetYuki(p79)
	audioService.UndimSongs()
	task.spawn(function()
		local Humanoid = p79.Humanoid
		local humanoidAnimator = Humanoid.Animator

		task.wait(5)
		p79.Head.face.Texture = "http://www.roblox.com/asset/?id=1502844907"

		for _, v in pairs(humanoidAnimator:GetPlayingAnimationTracks()) do
			v:Stop()
		end

		LoadAnimation(Humanoid, "rbxassetid://111985851943652", nil):Play(0)

		for _, v in pairs(p79.Particle:GetChildren()) do
			v.Enabled = false
		end

		local boombox = workspace.WorldElements:FindFirstChild("Boombox")

		if not boombox then
			return
		end

		for _, v in pairs(boombox.Particles:GetChildren()) do
			v.Enabled = true
		end

		boombox.Boombox.Song:Play()
	end)
end
function module.RenPhoneRing(p80)
	audioService.DimSongs()

	local v237 = p80.Phone["phone ring"]

	p80.Phone.phone:Play()
	v237:Play()
end
function module.RenPhoneRecieve(p81)
	audioService.UndimSongs()

	local v239 = p81.Phone["phone ring"]

	p81.Phone.phone:Pause()
	v239:Pause()
	audioService.PlaySound("fabric")
	audioService.PlaySound("button.wav")
	p81.Head.face.Texture = "rbxassetid://97802679481122"

	local Humanoid = p81.Humanoid
	local humanoidAnimator = Humanoid.Animator
	local renCall = LoadAnimation(Humanoid, "rbxassetid://100784876956097", nil)

	renCall:Play(0)
	t2.RenCall = renCall
	v239 = oldHeadCFrames[p81]
	oldHeadCFrames[p81] = p81.Torso.Neck.C0
	animation.AnimateAsync(p81.Torso.Neck, { C0 = v239 }, 0.35, "Out", "Quart")
end
function module.RenHangUp(p82)
	audioService.PlaySound("button.wav")

	if t2.RenCall then
		t2.RenCall:Stop()
	end

	local v244 = oldHeadCFrames[p82]

	oldHeadCFrames[p82] = p82.Torso.Neck.C0
	animation.AnimateAsync(p82.Torso.Neck, { C0 = v244 }, 0.35, "Out", "Quart")
	p82.Head.face.Texture = "rbxassetid://135283372655937"
end
function module.IrisLaugh(p83)
	p83.Head.face.Texture = "rbxassetid://76742524282963"

	if not t2["Iris Fangirl_laugh"] then
		local v246 = LoadAnimation(p83.Humanoid, "rbxassetid://102025751467277", nil)

		v246:Play(0)
		v246.DidLoop:Connect(function()
			p83.HumanoidRootPart.Sound:Play()
		end)
		t2["Iris Fangirl_laugh"] = v246
	else
		t2["Iris Fangirl_laugh"]:Play()
	end

	p83.HumanoidRootPart.Sound:Play()
end
local function GetDuelistsForIris()
	local t7: {[any]: any} = {}

	for _, v in pairs(workspace.Duelists:GetChildren()) do
		if v.Name == "Mac Iris Enjoyer" or v.Name == "Jonesy" or v.Name == "Bobert" then
			table.insert(t7, v)
		end
	end

	return t7
end
function module.IrisCallout(p84)
	local Humanoid = p84.Humanoid
	local humanoidAnimator = Humanoid.Animator

	t2["Iris Fangirl_laugh"]:Stop()

	if not t2["Iris Fangirl_call"] then
		local v253 = LoadAnimation(Humanoid, "rbxassetid://112071580689812", nil)

		v253:Play(0)
		t2["Iris Fangirl_call"] = v253
	else
		t2["Iris Fangirl_call"]:Play()
	end

	local v254 = GetDuelistsForIris()

	for _, v in pairs(v254) do
		if not oldHeadCFrames[v] then
			oldHeadCFrames[v] = v.Torso.Neck.C0
		end

		local animationAnimateAsync = animation.AnimateAsync
		local neck = v.Torso.Neck
		local v259 = oldHeadCFrames[v]
		local cFrameAngles = CFrame.Angles
		local v261 = (v.Head.Position - p84.PrimaryPart.Position).Unit:Cross(v.PrimaryPart.CFrame.LookVector)
		local cFrame = cFrameAngles(0, 0, v261.Y)

		animationAnimateAsync(neck, { C0 = v259 * cFrame }, 0.35, "Out", "Quart")
		textChatService:DisplayBubble(v.Head, "?")
	end
end
function module.IrisLaugh2(p85)
	module.IrisLaugh(p85)
	t2["Iris Fangirl_call"]:Stop()

	local v264 = GetDuelistsForIris()

	for _, v in pairs(v264) do
		if oldHeadCFrames[v] then
			task.spawn(function()
				for _ = 1, 3 do
					textChatService:DisplayBubble(v.Head, "Hahahahahahahahaha!")
				end
			end)
		end
	end

	audioService.PlaySound("Laugh Track")
end
function module.IrisStopLaugh(_)
	local v268 = GetDuelistsForIris()

	for _, v in pairs(v268) do
		if oldHeadCFrames[v] then
			animation.AnimateAsync(v.Torso.Neck, { C0 = oldHeadCFrames[v] }, 0.35, "Out", "Quart")
		end
	end

	t2["Iris Fangirl_laugh"]:Stop()
end
function module.ShowLicense(p87)
	audioService.DimSongs()
	audioService.PlaySound("secret")

	local colo_ShowLicense = LoadAnimation(p87.Humanoid, "rbxassetid://98844576253370", nil)

	colo_ShowLicense:Play(0)
	t2.Colo_ShowLicense = colo_ShowLicense

	local connection = nil

	connection = colo_ShowLicense:GetMarkerReachedSignal("Pause"):Connect(function()
		colo_ShowLicense:AdjustSpeed(0)
		connection:Disconnect()
	end)

	local card = p87.Card
	local n1 = p87.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
	local cardSize = card.Size

	card.Size = Vector3.new(0, 0, 0)
	card.Position = p87.HumanoidRootPart.Position

	for _, v in pairs(card.Particles:GetChildren()) do
		v.Enabled = true
	end

	t2.Colo_Tween = animation.AnimateAsync(card, { Position = n1, Size = cardSize }, 1.25, "Out", "Quart")
	t2.Colo_Spin = true
	task.spawn(function()
		while t2.Colo_Spin do
			local v622 = game:GetService("RunService").RenderStepped:Wait()
			local cardCFrame = card.CFrame
			local v624 = CFrame.Angles(0, 0, 3.141592653589793 * v622)

			card.CFrame = cardCFrame * v624
		end
	end)
end
function module.HideLicense(p88)
	if t2.Colo_Tween then
		t2.Colo_Tween:Cancel()
	end

	local card = p88.Card

	card.Position = p88.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
	audioService.UndimSongs()
	t2.Colo_ShowLicense:Stop()

	for _, v in pairs(card.Particles:GetChildren()) do
		v.Enabled = false
	end

	t2.Colo_Spin = false
end
function module.RazarStealsLicense(p89)
	local card = p89.Card
	local clone = workspace.Duelists.Razar1:Clone()

	clone.Humanoid.WalkSpeed = 30
	clone.Head.NPCIcon.Enabled = false
	workspace.Duelists.Razar1.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false
	t2.Razar = clone
	clone.Humanoid:MoveTo(card.Position, card)
	workspace.WorldElements.BloxParkBoundary.CanCollide = false
	task.spawn(function()
		for _ = 1, 10 do
			textChatService:DisplayBubble(clone.Head, "EZ")
			task.wait(0.2)
		end
	end)

	local connection = nil

	connection = clone.Humanoid.MoveToFinished:Connect(function(_)
		for _, v in pairs(clone.HumanoidRootPart.Particles:GetChildren()) do
			v.Enabled = true
		end

		clone.Humanoid.WalkSpeed = 45
		card.Parent = replicatedStorage.Trash
		audioService.PlaySound("skull_kid_laugh")
		audioService.PlaySound("Pop")
		task.spawn(function()
			audioService.ChangeSong("Lobby", { Volume = 0 })
		end)
		connection:Disconnect()
		clone.Humanoid:MoveTo(workspace.Markers.RazarIndicator1.Position, workspace.Markers.RazarIndicator1)
		connection = clone.Humanoid.MoveToFinished:Connect(function(_)
			clone.HumanoidRootPart.CFrame = workspace.Markers.RazarIndicator2.CFrame

			for _, v in pairs(clone.HumanoidRootPart.Particles:GetChildren()) do
				v.Enabled = false
			end

			module.ShowDialog("Scene4")
			connection:Disconnect()
			connection = nil
		end)
	end)
	PreloadAnimations({
		"rbxassetid://117583398492688",
		"rbxassetid://94393527043094",
		"rbxassetid://115226264650238",
		"rbxassetid://107038020000472"
	})
end
function module.ColoEyePopout(p92)
	p92["Flabbergasted Eyes"].Handle.Transparency = 0
	p92.Head.face2.Transparency = 0
	p92.Head.face.Transparency = 0.99
	audioService.PlaySound("GlassBreak1")
	effects.ShakeDialog(dialog2.Effect)
	task.spawn(function()
		audioService.UndimSongs()
		audioService.ChangeSong("Chase", { Volume = 0.4 })
	end)
end
function module.ColoScared(p93)
	t2.Colo_ShowLicense:Stop()

	local colo_Scared = LoadAnimation(p93.Humanoid, "rbxassetid://138495363593154", nil)

	colo_Scared:Play(0)
	t2.Colo_Scared = colo_Scared

	if oldHeadCFrames[p93] then
		animation.AnimateAsync(p93.Torso.Neck, { C0 = oldHeadCFrames[p93] }, 0.35, "Out", "Quart")
	end
end
function module.ColoWaveHi(p94)
	LoadAnimation(p94.Humanoid, "rbxassetid://118025645002486", nil):Play(0)
end
function module.PreloadAnimations(_, p96)
	PreloadAnimations(p96)
end
function module.RunToRazar(p97)
	p97["Flabbergasted Eyes"].Handle.Transparency = 1
	p97.Head.face2.Transparency = 0.99
	p97.Head.face.Transparency = 0
	t2.Colo_Scared:Stop()

	local clone = p97:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	p97.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false
	t2.Colo = clone

	local t8: {[any]: any} = {
		workspace.Markers.PathfindingMarker1,
		workspace.Markers.PathfindingMarker2,
		workspace.Markers.PathfindingMarker3,
		workspace.Markers.PathfindingMarker4
	}
	local Character = game.Players.LocalPlayer.Character

	clone.Humanoid.WalkSpeed = 50
	Character.Humanoid.WalkSpeed = 44
	task.spawn(function()
		clone.Humanoid:MoveTo(workspace.Markers.PathfindingMarker0.Position, workspace.Markers.PathfindingMarker0)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.PathfindingMarker1.Position, workspace.Markers.PathfindingMarker1)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.PathfindingMarker2.Position, workspace.Markers.PathfindingMarker2)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.PathfindingMarker3.Position, workspace.Markers.PathfindingMarker3)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.PathfindingMarker4.Position, workspace.Markers.PathfindingMarker4)
		clone.Humanoid.MoveToFinished:Wait()
		LookTowards(clone, t2.Razar)
		module.ShowDialog("Scene9")
	end)
	task.spawn(function()
		Character.Humanoid:MoveTo(workspace.Markers.PathfindingMarker0.Position, workspace.Markers.PathfindingMarker0)
		Character.Humanoid.MoveToFinished:Wait()
		Character.Humanoid:MoveTo(workspace.Markers.PathfindingMarker1.Position, workspace.Markers.PathfindingMarker1)
		Character.Humanoid.MoveToFinished:Wait()
		Character.Humanoid:MoveTo(workspace.Markers.PathfindingMarker2.Position, workspace.Markers.PathfindingMarker2)
		Character.Humanoid.MoveToFinished:Wait()
		Character.Humanoid:MoveTo(workspace.Markers.PathfindingMarker3.Position, workspace.Markers.PathfindingMarker3)
		Character.Humanoid.MoveToFinished:Wait()
		LookTowards(Character, t2.Razar)
	end)
end
function module.RazarLaugh(_)
	TurnOnBlackBars(1, 45)

	local razar = t2.Razar
	local razar_Laugh = LoadAnimation(razar.Humanoid, "rbxassetid://117583398492688", nil)

	razar_Laugh:Play(0)
	t2.Razar_Laugh = razar_Laugh
	FaceHolderSet(razar, "laugh")
	audioService.PlaySound("skull_kid_laugh")
end
function module.RazarShowCard(_)
	audioService.DimSongs()
	audioService.PlaySound("secret")

	local razar = t2.Razar
	local Humanoid = razar.Humanoid

	t2.Razar_Laugh:Stop()

	local razar_ShowLicense = LoadAnimation(Humanoid, "rbxassetid://98844576253370", nil)

	razar_ShowLicense:Play(0)
	t2.Razar_ShowLicense = razar_ShowLicense

	local connection = nil

	connection = razar_ShowLicense:GetMarkerReachedSignal("Pause"):Connect(function()
		razar_ShowLicense:AdjustSpeed(0)
		connection:Disconnect()
	end)

	local razarCard = razar.Card
	local n1 = razar.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
	local razarCardSize = razarCard.Size

	razarCard.Size = Vector3.new(0, 0, 0)
	razarCard.Position = razar.HumanoidRootPart.Position

	for _, v in pairs(razarCard.Particles:GetChildren()) do
		v.Enabled = true
	end

	t2.Razar_Tween = animation.AnimateAsync(razarCard, { Position = n1, Size = razarCardSize }, 1.25, "Out", "Quart")
	t2.Razar_Spin = true
	task.spawn(function()
		while t2.Razar_Spin do
			local v629 = game:GetService("RunService").RenderStepped:Wait()
			local razarCardCFrame = razarCard.CFrame
			local v631 = CFrame.Angles(0, 0, 3.141592653589793 * v629)

			razarCard.CFrame = razarCardCFrame * v631
		end
	end)
end
function module.RazarHideLicense(_)
	local razar = t2.Razar

	if t2.Razar_Tween then
		t2.Razar_Tween:Cancel()
	end

	local razarCard = razar.Card

	razarCard.Position = razar.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
	audioService.UndimSongs()
	t2.Razar_ShowLicense:Stop()

	for _, v in pairs(razarCard.Particles:GetChildren()) do
		v.Enabled = false
	end

	t2.Razar_Spin = false
	FaceHolderSet(t2.Razar, "default")
end
function module.RazarSad1(_)
	FaceHolderSet(t2.Razar, "sad")
end
function module.RazarSad2(_)
	local razar_Sad = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://94393527043094", 0.4)

	razar_Sad:Play(0.4)
	t2.Razar_Sad = razar_Sad
end
function module.RazarUnsad(_)
	t2.Razar_Sad:Stop()
end
function module.RazarGiveCard()
	local razar = t2.Razar
	local colo = t2.Colo
	local Humanoid = colo.Humanoid

	colo.Humanoid.WalkSpeed = 16
	razar.Humanoid.WalkSpeed = 16
	task.spawn(function()
		razar.Humanoid:MoveTo(workspace.Markers.PathfindingMarker4.Position)
		razar.Humanoid.MoveToFinished:Wait()
		audioService.PlaySound("Pop")
		task.spawn(function()
			audioService.ChangeSong("Lobby", { Volume = 0 })
		end)

		local colo_Hold = LoadAnimation(Humanoid, "rbxassetid://101226723006078", nil)

		colo_Hold:Play(0)
		t2.Colo_Hold = colo_Hold
		colo.CardInHand.Transparency = 0
		colo.CardInHand.Decal1.Transparency = 0
		colo.CardInHand.Decal2.Transparency = 0
		turnOffBlackBars(1)
		razar.Humanoid:MoveTo(workspace.Markers.RazarIndicator3.Position, workspace.Markers.RazarIndicator3)
		razar.Humanoid.MoveToFinished:Wait()
		module.ShowDialog("Scene25")
	end)
end
function module.ColoWave()
	LoadAnimation(t2.Colo.Humanoid, "rbxassetid://128968950784630", nil):Play(0)
end
function module.ColoTurnToPlayer()
	LookTowards(t2.Colo, LocalPlayer.Character)
end
function module.ColoGiveItem()
end
function module.ShowRazarCard()
	task.spawn(function()
		effects.ShowRazarCard(dialog2.Effect)
	end)
	task.delay(0.5, function()
		local razar = t2.Razar

		razar.HumanoidRootPart.CFrame = workspace.Markers.RazarIndicator4.CFrame

		local razar_Idle = LoadAnimation(razar.Humanoid, "rbxassetid://117583398492688", nil)

		razar_Idle:Play(0)
		t2.Razar_Idle = razar_Idle
		FaceHolderSet(t2.Razar, "laugh")
	end)
end
function module.HideRazarCard()
	for _, v in pairs(dialog2.Effect:GetChildren()) do
		v:Destroy()
	end

	TurnOnBlackBars(0.5, 45)
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = workspace.Markers.RazarIndicator5.CFrame
	audioService.PlaySound("skull_kid_laugh")
	task.spawn(function()
		audioService.ChangeSong("Chase", { Volume = 0.4 })
	end)
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.RazarIndicator6.CFrame }, 1, "InOut", "Quart")

	local colo_Scared = LoadAnimation(t2.Colo.Humanoid, "rbxassetid://138495363593154", nil)

	colo_Scared:Play(0)
	t2.Colo_Scared = colo_Scared
	FaceHolderSet(t2.Razar, "laugh")
	LookTowards(t2.Colo, t2.Razar)
	LookTowards(LocalPlayer.Character, t2.Razar)
	effects.ShakeDialog(dialog2.Effect)
end
function module.PrecutRazarFace()
	local Humanoid = t2.Razar.Humanoid

	if t2.Razar_Idle then
		t2.Razar_Idle:Stop()
	end

	local razar_dance1 = LoadAnimation(Humanoid, "rbxassetid://115226264650238", 0.2)

	razar_dance1:Play(0.2)
	t2.Razar_dance1 = razar_dance1
	FaceHolderSet(t2.Razar, "default")
	CurrentCamera.CFrame = workspace.Markers.RazarIndicator6.CFrame
end
function module.CutCameraToMarker(_, p105)
	local foundChild = workspace.Markers:FindFirstChild(p105)

	if not foundChild then
		return
	end

	CurrentCamera.CFrame = foundChild.CFrame
end
function module.TransitionCameraToMarker(_, p107)
	local foundChild = workspace.Markers:FindFirstChild(p107)

	if not foundChild then
		return
	end

	animation.AnimateAsync(CurrentCamera, { CFrame = foundChild.CFrame }, 0.2, "Out", "Quad")
end
function module.CutRazarFace()
	CurrentCamera.CFrame = workspace.Markers.RazarIndicator8.CFrame

	local razar = t2.Razar

	FaceHolderSet(t2.Razar, "bigsmile")
	effects.ShakeDialog(dialog2.Effect)
	audioService.PlaySound("Chomp")
end
function module.RazarVictory()
	local Humanoid = t2.Razar.Humanoid

	t2.Razar_dance1:Stop()
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.RazarIndicator6.CFrame }, 0.5, "Out", "Quad")

	local razar_dance2 = LoadAnimation(Humanoid, "rbxassetid://107038020000472", 0.1)

	razar_dance2:Play(0.1)
	t2.Razar_dance2 = razar_dance2
	task.delay(0.1, function()
		FaceHolderSet(t2.Razar, "default")
		task.wait(0.4)
		audioService.PlaySound("Shine")
	end)
end
function module.RazarGoesInCannon()
	local razar = t2.Razar

	t2.Razar_dance2:Stop()
	task.spawn(function()
		razar.Humanoid:MoveTo(razar.HumanoidRootPart.Position + razar.HumanoidRootPart.CFrame.LookVector * 3)
		razar.Humanoid.MoveToFinished:Wait()
		debris:AddItem(razar, 1.2)
		t2.Colo_Scared:Stop()
		t2.Colo_Hold:Stop()

		local colo = t2.Colo

		colo.CardInHand.Transparency = 1
		colo.CardInHand.Decal1.Transparency = 1
		colo.CardInHand.Decal2.Transparency = 1
		colo.Head.face.Transparency = 0.99
		colo.Head.face2.Transparency = 0.99
		colo.Head.face3.Transparency = 0

		local animationAnimateAsync = animation.AnimateAsync
		local dialog2Window = dialog2.Window
		local v638 = UDim2.fromScale(0.5, 1.5)

		animationAnimateAsync(dialog2Window, { Position = v638 }, 0.5, "Out", "Quart")
		networkClient.DoHistoryCannonAnimation()

		local animateAsync = animation.AnimateAsync
		local window = dialog2.Window

		v638 = UDim2.fromScale(0.5, 0.95)
		animateAsync(window, { Position = v638 }, 0.5, "Out", "Quart")
		task.spawn(function()
			audioService.ChangeSong("Lobby")
		end)
		module.ShowDialog("Scene39")
	end)
end
function module.EndColoTest()
	networkInvokeServer("QuestAward", "HonoraryArchaeologist", true)
end
function module.EndDogeQuest()
	networkInvokeServer("QuestAward", "DogeQuest", true)
end
function module.OpenDuelMenu()
	duelMenu.OpenDuelMenu("World")
end
function module.OpenLoreMenu()
	loreMenu.OpenMenu()
end
function module.OpenHistoryChamber()
	task.spawn(function()
		networkClient.OpenHistoryChamber()
	end)
end
function module.OpenPuzzleMenu()
	networkClient.ReturnToPuzzleMenu()
end
function module.OpenCafeMenu(_, p109, p110, p111, p112, p113, p114, p115)
	networkClient.ReturnToCafeMenu(p109, p110, p111, p112, p113, p114, p115)
end
function module.FadeBlackUpdate()
	transition.ToggleBlack(1, 0.3)
	task.wait(1)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.Update()
	networkClient.UpdateWorld()
end
function module.PurchaseCard(_, p117)
	print("PurchaseCard called")
	print(p117)

	local v347 = networkInvokeServer("PurchaseCardFromNPC", p117)

	task.spawn(function()
		if v347 == true then
			task.wait(1)
			print("PurchaseFinish")
			module.ShowDialog("PurchaseFinish")

			return
		end

		task.wait(1)
		print("PurchaseFail")
		module.ShowDialog("PurchaseFail")
	end)
end
function module.ProgressQuest(_, p119)
	networkInvokeServer("ProgressNPCQuest", p119)
end
function module.ProgressNonNPCQuest(_, p121)
	networkInvokeServer("ProgressNonNPCQuest", p121)
end
function module.ProgressNonNPCQuestTo(_, p123, p124)
	networkInvokeServer("ProgressNonNPCQuestTo", p123, p124)
	print("progressed quest to")
	print(p124)
end
function module.ResetQuest(_, p126)
	networkInvokeServer("ResetQuest", p126)
end
function module.ResetStoryProgress(_, _)
	networkInvokeServer("DebugResetStoryProgressSpecific", {
		StoryProgress = 0,
		BOT_WINS_EasyMage_R = 0,
		BOT_WINS_EasyMage_G = 0,
		BOT_WINS_EasyMage_Y = 0,
		BOT_WINS_Colo = 0,
		SavedTitano = 0,
		HasGravityCoil = 0,
		SpawnNoobloxxer = 0,
		HasVIPShirt = 0,
		NinjaFoundG = 0,
		NinjaFoundT = 0,
		NinjaFoundS = 0,
		AllNinjaFound = 0,
		FinishSpeech = 0,
		FinishPostSpeech = 0,
		PostTelamonBattle = 0,
		FinishAct1 = 0,
		StartAct2 = 0,
		BOT_WINS_act1_xxshadowslayerxx = 0,
		BOT_WINS_act1_Noobloxxer = 0,
		BOT_WINS_act1_Blockhead = 0,
		BOT_PLAYS_Act1StoryRaid = 0,
		BOT_WINS_Act1StoryRaid = 0,
		NightTime = 0,
		BOT_WINS_demonninjaduelist = 0,
		NPCQuestColoTalkedTo = 0,
		StoryProgress2 = 0
	})
	transition.ToggleBlack(1, 1)
	task.wait(1)
	audioService.PlaySound("BigDoorOpen")
	networkClient.UpdateWorld()
	task.wait(2)
	transition.ToggleBlack(-1, 2)
end
local function emoteCaught(p129)
	local emote = p129.Head:FindFirstChild("Emote")

	if not emote then
		emote = replicatedStorage.UI.Emote:Clone()
		emote.Parent = p129.Head
	end

	emote.ImageLabel.Position = UDim2.fromScale(0, 0.5)
	emote.ImageLabel.ImageColor3 = Color3.fromRGB(255, 0, 0)
	emote.ImageLabel.ImageTransparency = 1
	emote.ImageLabel.Visible = true
	audioService.PlaySound("toon beep")
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local emoteImageLabel = emote.ImageLabel
		local color3 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(emoteImageLabel, { ImageColor3 = color3 }, 1.2, "Out", "Linear")

		local animationAnimate = animation.Animate
		local imageLabel = emote.ImageLabel
		local v646 = UDim2.fromScale(0, 0)

		animationAnimate(imageLabel, { ImageTransparency = 0, Position = v646 }, 0.5, "Out", "Quart")
		task.wait(1)

		local animate = animation.Animate
		local v648 = emote.ImageLabel

		v646 = UDim2.fromScale(0, 0.5)
		animate(v648, { ImageTransparency = 1, Position = v646 }, 0.5, "In", "Quart")
		emote.ImageLabel.Visible = false
	end)
end

module.EmoteCaught = emoteCaught

function module.PostMageStart(p130)
	TurnOnBlackBars(0.5, 55)
	LookTowards(LocalPlayer.Character, p130)
	emoteCaught(LocalPlayer.Character)
end
local function PostMageFunc(p131, p132, p133)
	transition.ToggleBlack(1, 0.3)
	turnOffBlackBars(0.5)
	p131:Destroy()
	networkFireServer("QuestAward", "StarterDeck" .. p132 .. "_" .. p133, true)
	task.wait(0.5)
	transition.ToggleBlack(-1, 0.3)
end
local function PreloadStartingAnimations()
	PreloadAnimations({
		"rbxassetid://139652873750230",
		"rbxassetid://73523999691680",
		"rbxassetid://107579583567894",
		"rbxassetid://83862134498065",
		"rbxassetid://86459655977880",
		"rbxassetid://111096951754245"
	})
end
local function TalkToMage(_, p135)
	transition.ToggleBlack(1, 0.3)
	networkInvokeServer("QuestAward", "TalkToMage")
	PreloadAnimations({
		"rbxassetid://139652873750230",
		"rbxassetid://73523999691680",
		"rbxassetid://107579583567894",
		"rbxassetid://83862134498065",
		"rbxassetid://86459655977880",
		"rbxassetid://111096951754245"
	})
	networkClient.UpdateWorld()
	networkClient.MuteWorld()

	local v367 = nil

	if p135 == "R" then
		v367 = "G"
	elseif p135 == "G" then
		v367 = "B"
	elseif p135 == "B" then
		v367 = "Y"
	elseif p135 == "Y" then
		v367 = "R"
	end

	local s1: string = "TCI_" .. v367
	local foundChild = workspace.Markers:FindFirstChild(s1)

	if not foundChild then
		warn("No marker: " .. s1)
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = foundChild.CFrame
	end

	TurnOnBlackBars(0.5, 50)
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.TalkToBouncer(_)
	transition.ToggleBlack(1, 0.3)
	networkInvokeServer("QuestAward", "TalkToMage")
	PreloadAnimations({
		"rbxassetid://139652873750230",
		"rbxassetid://73523999691680",
		"rbxassetid://107579583567894",
		"rbxassetid://83862134498065",
		"rbxassetid://86459655977880",
		"rbxassetid://111096951754245"
	})
	networkClient.UpdateWorld()
	networkClient.MuteWorld()

	local tci_r = workspace.Markers:FindFirstChild("TCI_R")

	if not tci_r then
		warn("No marker: TCI_R")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = tci_r.CFrame
	end

	TurnOnBlackBars(0.5, 50)
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end

for _, v in pairs({ "R", "G", "B", "Y" }) do
	for i = 1, 3 do
		module["PostMage" .. v .. i] = function(p137)
			PostMageFunc(p137, v, i)
		end
	end

	module["TalkToMage" .. v] = function(p138)
		TalkToMage(p138, v)
	end
end

function module.MoveCamera(_, p140)
	MoveCamera(p140)
end
function module.SetCamera(_, p142)
	local foundChild = workspace.Markers:FindFirstChild(p142)

	if not foundChild then
		warn("No marker: " .. p142)

		return
	end

	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = foundChild.CFrame
end
function module.PlaySound(_, p144)
	audioService.PlaySound(p144)
end
function module.StopSound(_, p146)
	audioService.StopSound(p146)
end
function module.PlaySoundConditions(_, p148, p149)
	if string.find(p149, ":") then
		string.gsub(p149, ":", ",")
	end

	audioService.PlaySound(p148, { p149 })
end
function module.ChangeSong(_, p151)
	audioService.ChangeSong(p151)
end
function module.ChangeSongStart(_, p153)
	audioService.ChangeSong(p153, { TimePosition = 0 })
end
function module.ResetCamera()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	turnOffBlackBars(0.5)
end
function module.ResetCameraAndUnmuteWorld()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	networkClient.UnmuteWorld()
	turnOffBlackBars(0.5)
end
function module.MuteWorld()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.ProfessorsRunToColo()
	local lumiaire = replicatedStorage.WorldElementsStorage.Duelists.Lumiaire
	local clone = lumiaire:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	lumiaire.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false

	local scholar = replicatedStorage.WorldElementsStorage.Duelists.Scholar
	local clone2 = scholar:Clone()

	if clone2.Head:FindFirstChild("NPCIcon") then
		clone2.Head.NPCIcon.Enabled = false
	end

	scholar.Parent = replicatedStorage.Trash
	clone2.Parent = workspace
	clone2.HumanoidRootPart.Anchored = false
	t2.Lumi = clone
	t2.Schol = clone2
	clone.Humanoid.WalkSpeed = 40
	clone2.Humanoid.WalkSpeed = 40
	TurnOnBlackBars(0.5, 50)
	task.spawn(function()
		clone.Humanoid:MoveTo(workspace.Markers.ProfM1.Position, workspace.Markers.ProfM1)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.ProfM2.Position, workspace.Markers.ProfM2)
		clone.Humanoid.MoveToFinished:Wait()
		clone.Humanoid:MoveTo(workspace.Markers.ProfM3L.Position, workspace.Markers.ProfM3L)
		clone.Humanoid.MoveToFinished:Wait()
		LookTowards(clone, t2.Colo)
		module.ShowDialog("Scene42")
	end)
	task.spawn(function()
		clone2.Humanoid:MoveTo(workspace.Markers.ProfM1.Position, workspace.Markers.ProfM1)
		clone2.Humanoid.MoveToFinished:Wait()
		clone2.Humanoid:MoveTo(workspace.Markers.ProfM2.Position, workspace.Markers.ProfM2)
		clone2.Humanoid.MoveToFinished:Wait()
		clone2.Humanoid:MoveTo(workspace.Markers.ProfM3S.Position, workspace.Markers.ProfM3S)
		clone2.Humanoid.MoveToFinished:Wait()
		LookTowards(clone2, t2.Colo)
	end)
end
function module.ColoNotice()
	emoteCaught(t2.Colo)
	LookTowards(t2.Colo, t2.Lumi)
end
function module.ColoSweat(_, rate)
	local sweat = t2.Colo.Head.HairAttachment.Sweat

	if rate == 0 then
		sweat.Enabled = false

		return
	end

	audioService.PlaySound("Squeaky")
	sweat.Enabled = true
	sweat.Rate = rate
	effects.ShakeDialog(dialog2.Effect)
end
function module.ScholIdle(_)
	local schol_idle = LoadAnimation(t2.Schol.Humanoid, "rbxassetid://113062484139933", nil)

	schol_idle:Play(0)
	t2.Schol_idle = schol_idle
	audioService.PlaySound("fabric")
end
function module.LumiLaugh()
	audioService.PlaySound("PixieLaugh2")
	LoadAnimation(t2.Lumi.Humanoid, "rbxassetid://83844598536435", nil):Play(0)
end
function module.ProfessorsRunOff()
	local lumi = t2.Lumi
	local schol = t2.Schol

	schol.Humanoid.WalkSpeed = 80
	lumi.Humanoid.WalkSpeed = 65
	LookTowards(LocalPlayer.Character, t2.Colo)
	task.spawn(function()
		t2.Lumi_Wave:Stop()
		lumi.Humanoid:MoveTo(workspace.Markers.ProfM4.Position, workspace.Markers.ProfM4)
		lumi.Humanoid.MoveToFinished:Wait()
		lumi.Humanoid:MoveTo(workspace.Markers.ProfM5.Position, workspace.Markers.ProfM5)
		lumi.Humanoid.MoveToFinished:Wait()
		lumi:Destroy()
	end)
	task.spawn(function()
		t2.Schol_idle:Stop()
		schol.Humanoid:MoveTo(workspace.Markers.ProfM4.Position, workspace.Markers.ProfM4)
		schol.Humanoid.MoveToFinished:Wait()
		schol.Humanoid:MoveTo(workspace.Markers.ProfM5.Position, workspace.Markers.ProfM5)
		schol.Humanoid.MoveToFinished:Wait()
		schol:Destroy()
	end)
end
function module.LumiWaveAtPlayer()
	audioService.PlaySound("toonybeep")
	LookTowards(t2.Lumi, LocalPlayer.Character)
	LookTowards(LocalPlayer.Character, t2.Lumi)

	local lumi_Wave = LoadAnimation(t2.Lumi.Humanoid, "rbxassetid://111816780427521", nil)

	lumi_Wave:Play(0)
	t2.Lumi_Wave = lumi_Wave
end
function module.LookAtCharacter(_, p158, p159)
	LookTowards(p158 and t2[p158] or LocalPlayer.Character, p159 and t2[p159] or LocalPlayer.Character)
end
function module.ColoJump()
	LoadAnimation(t2.Colo.Humanoid, "rbxassetid://102790555019101", nil):Play(0)
	audioService.PlaySound("toon beep")
end
function module.ChangeColorCorrection(_, p161)
	lighting.CutsceneCorrection.Enabled = true
	animation.AnimateAsync(lighting.CutsceneCorrection, p161, 0.5, "InOut", "Quad")
end
function module.ResetColorCorrection()
	task.spawn(function()
		local animationAnimate = animation.Animate
		local lightingCutsceneCorrection = lighting.CutsceneCorrection
		local color3 = Color3.fromRGB(255, 255, 255)

		animationAnimate(lightingCutsceneCorrection, { Brightness = 0, Contrast = 0, Saturation = 0, TintColor = color3 }, 0.5, "InOut", "Quad")
		lighting.CutsceneCorrection.Enabled = false
	end)
end
function module.CleanUpColoTest()
	transition.ToggleBlack(1, 0.3)
	t2.Colo:Destroy()
	networkClient.UpdateWorld()
	networkClient.UnmuteWorld()
	turnOffBlackBars(0.5)
	transition.ToggleBlack(-1, 0.3)
end
function module.SetUpFirstCannonDialog(_)
	local colo3 = workspace.Duelists.Colo3
	local clone = colo3:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	colo3.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false
	t2.Colo = clone
	t2.Colo.HumanoidRootPart.CFrame = workspace.Markers.RazarIndicator3.CFrame
	LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Markers.SideOfCannon.CFrame
	networkClient.MuteWorld()

	local colo_typing = LoadAnimation(t2.Colo.Humanoid, "rbxassetid://75635890255855", nil)

	colo_typing:Play(0)
	t2.Colo_typing = colo_typing
	TurnOnBlackBars(0.8, 50)
	transition.ToggleBlack(-1, 0.3)
end
function module.EmoteCaughtDummy(_, p164)
	emoteCaught(t2[p164])
end
function module.ColoStopTyping(_)
	t2.Colo_typing:Stop()
	LookTowards(t2.Colo, LocalPlayer.Character)
	audioService.PlaySound("button.wav")
end
function module.EnterCannonWithColo()
	transition.ToggleBlack(1, 0.3)

	local cannonEntranceCamera = workspace.Markers:FindFirstChild("CannonEntranceCamera")

	if not cannonEntranceCamera then
		warn("No marker: CannonEntranceCamera")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = cannonEntranceCamera.CFrame
	end

	transition.ToggleBlack(-1, 0.3)

	local colo = t2.Colo
	local Character = game.Players.LocalPlayer.Character

	colo.HumanoidRootPart.CFrame = workspace.Markers.CannonStairEntrance.CFrame
	Character.HumanoidRootPart.CFrame = workspace.Markers.CannonStairEntrance.CFrame
	colo.Humanoid.WalkSpeed = 16
	Character.Humanoid.WalkSpeed = 10
	task.spawn(function()
		colo.Humanoid:MoveTo(workspace.Markers.InsideCannon.Position, workspace.Markers.InsideCannon)
		colo.Humanoid.MoveToFinished:Wait()
		audioService.PlaySound("Vent")
		colo:Destroy()
	end)
	task.spawn(function()
		Character.Humanoid:MoveTo(workspace.Markers.InsideCannon.Position, workspace.Markers.InsideCannon)
		Character.Humanoid.MoveToFinished:Wait()
		audioService.PlaySound("Vent")
		Character.HumanoidRootPart.CFrame = workspace.Markers.PathfindingMarker1.CFrame
		module.ShowDialog("Scene5")
	end)
end
function module.Annoyed()
	audioService.PlaySound("Jealousy")
end
function module.InnerRageborne(p166)
	TurnOnBlackBars(1, 45)

	local eyeGlint = p166.EyeGlint
	local decal = p166.EyeGlint.Decal

	decal.Transparency = 1
	audioService.DimSongs()
	audioService.PlaySound("Bane")
	task.spawn(function()
		animation.AnimateAsync(eyeGlint, { Rotation = eyeGlint.Rotation + Vector3.new(720, 0, 0) }, 2, "InOut", "Quart")
	end)
	task.spawn(function()
		lighting.CutsceneCorrection.Enabled = true

		local animationAnimateAsync = animation.AnimateAsync
		local lightingCutsceneCorrection = lighting.CutsceneCorrection
		local color3 = Color3.fromRGB(121, 25, 26)

		animationAnimateAsync(lightingCutsceneCorrection, { Brightness = 0, Contrast = 0, Saturation = 1, TintColor = color3 }, 0.5, "InOut", "Quad")
	end)
	task.wait(0.1)
	task.spawn(function()
		animation.AnimateAsync(decal, { Transparency = 0 }, 0.1, "InOut", "Quint")
		task.wait(1)
		animation.AnimateAsync(decal, { Transparency = 1 }, 1, "InOut", "Quint")
		task.wait(0.25)
	end)
end
function module.IcePrep(p167)
	p167.Ice.ParticleEmitter.Enabled = true
	p167.Ice.ParticleEmitter.Rate = 20
	p167.Head.face.Texture = "rbxassetid://398670843"
	TurnOnBlackBars(1, 45)
	audioService.DimSongs()
	audioService.PlaySound("IceSound")
	task.spawn(function()
		lighting.CutsceneCorrection.Enabled = true

		local animationAnimateAsync = animation.AnimateAsync
		local lightingCutsceneCorrection = lighting.CutsceneCorrection
		local color3 = Color3.fromRGB(10, 101, 121)

		animationAnimateAsync(lightingCutsceneCorrection, { Brightness = 0, Contrast = 0, Saturation = 1, TintColor = color3 }, 0.5, "InOut", "Quad")
	end)
	task.wait(0.1)
	task.spawn(function()
		task.wait(1)
		p167.Ice.ParticleEmitter.Enabled = false
		task.wait(1)
		p167.Head.face.Texture = "rbxassetid://26619042"
	end)
end
function module.GenericCleanUp()
	local animationAnimate = animation.Animate
	local lightingCutsceneCorrection = lighting.CutsceneCorrection
	local color3 = Color3.fromRGB(255, 255, 255)

	animationAnimate(lightingCutsceneCorrection, { Brightness = 0, Contrast = 0, Saturation = 0, TintColor = color3 }, 1, "InOut", "Quad")
	lighting.CutsceneCorrection.Enabled = false
	turnOffBlackBars(1)
	audioService.UndimSongs()
end
local function GoToAct1()
	networkClient.SetStoryData({
		Sky = "Act1Sky",
		SpawnLocation = "Act1SpawnLocation",
		LightingProfile = "Act1"
	})

	local robloxHQSpawn = workspace.Markers.PersistantSpawns.RobloxHQSpawn

	CurrentCamera.CFrame = robloxHQSpawn.Parent.RobloxHQSpawnCamera.CFrame
	LocalPlayer.Character.Humanoid.Sit = true
	LocalPlayer.Character.HumanoidRootPart.CFrame = robloxHQSpawn.CFrame
	LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = robloxHQSpawn.CFrame.LookVector * 50 + robloxHQSpawn.CFrame.UpVector * 100
	networkClient.UnmuteWorld()
	networkClient.EnterZone("Robloxia", "2164 BC")
	audioService.SetLobbyTheme("Act1Area")
	audioService.ChangeSong("Act1Area")
end
function module.HistoryCannonToAct1()
	local animationAnimateAsync = animation.AnimateAsync
	local dialog2Window = dialog2.Window
	local v429 = UDim2.fromScale(0.5, 1.5)

	animationAnimateAsync(dialog2Window, { Position = v429 }, 0.5, "Out", "Quart")
	networkClient.DoHistoryCannonAnimationFull(function()
	end)
	GoToAct1()

	if replicatedStorage.Trash:FindFirstChild("Colo3") then
		replicatedStorage.Trash.Colo3.Parent = workspace.Duelists
	end

	turnOffBlackBars(0.5)
	task.delay(3, function()
		LocalPlayer.Character.Humanoid.Sit = false
		module.AutoStartDialog(require(replicatedStorage.Dialogue.Act1IntroDialog))
	end)
end

networkClient.HistoryCannonToAct1 = module.HistoryCannonToAct1

local function SetDescendantCollisionGroup(p168)
	if p168:IsA("BasePart") then
		p168.CollisionGroup = "Characters"
	end
end

local pathfindingService: PathfindingService = game:GetService("PathfindingService")

local function FollowPlayer()
	if not LocalPlayer.Character then
		return
	end

	local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if not humanoidRootPart then
		return
	end

	local path: Path = pathfindingService:CreatePath()

	path:ComputeAsync(humanoidRootPart.Position, humanoidRootPart.Position - humanoidRootPart.CFrame.LookVector * 6)

	return path
end

local runService: RunService = game:GetService("RunService")
local u59 = nil

local function CreateFollowingDummy(p169)
	local v434 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = v434:WaitForChild("Humanoid")

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	else
		t2.FollowingDummyMaid = maid.new()
	end

	if oldHeadCFrames[p169] then
		p169.Torso.Neck.C0 = oldHeadCFrames[p169]
		oldHeadCFrames[p169] = nil
	end

	local clone = p169:Clone()

	for iterFirst, iterSecond in clone:GetDescendants() do
		if iterSecond:IsA("BasePart") then
			iterSecond.CollisionGroup = "Characters"
		end
	end

	clone.HumanoidRootPart.Anchored = false
	clone.HumanoidRootPart.CFrame = v434.HumanoidRootPart.CFrame
	clone.Parent = workspace

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	if clone.HumanoidRootPart:FindFirstChild("ProximityPrompt") then
		clone.HumanoidRootPart.ProximityPrompt:Destroy()
	end

	local timestamp = tick()
	local u440: boolean = false

	t2.FollowingDummyMaid:GiveTask(runService.Stepped:Connect(function()
		if LocalPlayer.Character then
			local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				pathfindingService:CreatePath():ComputeAsync(humanoidRootPart.Position, humanoidRootPart.Position - humanoidRootPart.CFrame.LookVector * 6)
			end
		end

		local v659

		if not LocalPlayer.Character then
			v659 = nil
		else
			local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart then
				v659 = nil
			else
				local path: Path = pathfindingService:CreatePath()

				path:ComputeAsync(humanoidRootPart.Position, humanoidRootPart.Position - humanoidRootPart.CFrame.LookVector * 6)
				v659 = path
			end
		end

		if not v659 then
			return
		end

		if not clone.Parent or not LocalPlayer.Character then
			return
		end

		for _, v in pairs(v659:GetWaypoints()) do
			clone.Humanoid:MoveTo(v.Position)
		end

		local n1 = LocalPlayer.Character.HumanoidRootPart.Position.Magnitude - clone.HumanoidRootPart.Position.Magnitude

		if (n1 >= 35 or n1 <= -35) and not u59 then
			u59 = true
			clone.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
			task.wait(2)
			u59 = false
		end

		if tick() - timestamp >= 0.5 then
			local humanoidRootPart = clone:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart then
				return
			end

			local n2 = humanoidRootPart.CFrame.LookVector * 5
			local humanoidRootPartPosition = humanoidRootPart.Position
			local raycastParams = RaycastParams.new()

			raycastParams.FilterDescendantsInstances = { clone, LocalPlayer.Character }
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude

			if workspace:Raycast(humanoidRootPartPosition, n2, raycastParams) and not u440 then
				u440 = true
				clone.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				task.delay(2, function()
					u440 = false
				end)
			end

			return
		end
	end))
	t2.FollowingDummyMaid:GiveTask(clone)
	t2.FollowingDummyMaid:GiveTask(v434.Humanoid.Died:Connect(function()
		t2.FollowingDummyMaid:Destroy()
	end))

	local followingDummyMaid = t2.FollowingDummyMaid
	local v442 = humanoid:GetPropertyChangedSignal("WalkSpeed")

	followingDummyMaid:GiveTask(v442:Connect(function()
		clone.Humanoid.WalkSpeed = v434.Humanoid.WalkSpeed
	end))
	clone.Humanoid.WalkSpeed = v434.Humanoid.WalkSpeed

	return clone
end
local function FollowYou_xxdemonninjaxx(p170)
	local u444

	if not p170 then
		u444 = CreateFollowingDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummy)
	else
		u444 = CreateFollowingDummy(replicatedStorage.Dummies.xxdemonninjaxxTitano_dummy)
	end

	local followingDummyMaid = t2.FollowingDummyMaid
	local v446 = LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed")

	followingDummyMaid:GiveTask(v446:Connect(function()
		u444.Humanoid.Jump = true

		if LocalPlayer.Character.Humanoid.WalkSpeed > 17 then
			u444.Animate.walk.WalkAnim.AnimationId = "rbxassetid://122817144718393"
		else
			u444.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354"
		end

		u444.Humanoid.WalkSpeed = LocalPlayer.Character.Humanoid.WalkSpeed
	end))
	u444.Humanoid.Jump = true

	if LocalPlayer.Character.Humanoid.WalkSpeed > 17 then
		u444.Animate.walk.WalkAnim.AnimationId = "rbxassetid://122817144718393"
	else
		u444.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354"
	end

	u444.Humanoid.WalkSpeed = LocalPlayer.Character.Humanoid.WalkSpeed
end
local function xdnFollowYou(p171)
	FollowYou_xxdemonninjaxx(p171)
	networkClient.StoryMaid:GiveTask(LocalPlayer.CharacterAdded:Connect(function()
		FollowYou_xxdemonninjaxx(p171)
	end))
	networkClient.StoryMaid:GiveTask(t2.FollowingDummyMaid)
end

networkClient.XdnFollowYou = xdnFollowYou

function module.AcceptHideAndSeek()
	transition.ToggleBlack(1, 0.3)
	networkInvokeServer("QuestAward", "TalkToXDNFirstTime")
	networkClient.UpdateWorld()
	xdnFollowYou()
	task.wait(0.5)
	transition.ToggleBlack(-1, 0.3)
end
function module.StartBlockheadScene()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	end

	t2.xdn = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummy)

	local testDummy = workspace.Duelists.TestDummy
	local clone = testDummy:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	testDummy.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false
	t2.td = clone

	local blockhead = workspace.Duelists.Blockhead
	local clone3 = blockhead:Clone()

	if clone3.Head:FindFirstChild("NPCIcon") then
		clone3.Head.NPCIcon.Enabled = false
	end

	blockhead.Parent = replicatedStorage.Trash
	clone3.Parent = workspace
	clone3.HumanoidRootPart.Anchored = false
	t2.bh = clone3
	t2.xdn:PivotTo(workspace.Markers.SaveTitano_D.CFrame)
	LocalPlayer.Character:PivotTo(workspace.Markers.SaveTitano_P.CFrame)

	local v452 = LoadAnimation(t2.td.Humanoid, "rbxassetid://131222813546257", nil)

	v452:Play(0)
	t2.td_kick = v452
	v452 = LoadAnimation(t2.bh.Humanoid, "rbxassetid://131222813546257", nil)
	v452:Play(0)
	t2.bh_kick = v452
	PreloadAnimations({
		"rbxassetid://75635890255855",
		"rbxassetid://113650844528567",
		"rbxassetid://102790555019101"
	})
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.BlockheadStopBullying()
	t2.td_kick:Stop()
	t2.bh_kick:Stop()

	local v453 = LoadAnimation(t2.xdn.Humanoid, "rbxassetid://75635890255855", 0.2)

	v453:Play(0.2)
	t2.xdn_arms = v453
end
function module.BlockheadTurnAround()
	LookTowards(t2.td, t2.xdn)
	LookTowards(t2.bh, t2.xdn)
end
function module.BlockheadGetAngry()
	for _, v in pairs(t2.xdn.Torso.RedGlow:GetChildren()) do
		v.Enabled = true
	end

	audioService.PlaySound("Bone Break")
end
function module.BlockheadPrepKick()
	t2.xdn.Humanoid.WalkSpeed = 6
	t2.xdn_arms:Stop()
	task.spawn(function()
		t2.xdn.Humanoid:MoveTo(t2.td.HumanoidRootPart.Position + t2.td.HumanoidRootPart.CFrame.LookVector * 2)
		t2.xdn.Humanoid.MoveToFinished:Wait()
		audioService.PlaySound("body_impact")
		t2.td.Humanoid.Sit = true
		t2.td.HumanoidRootPart.AssemblyLinearVelocity = t2.td.HumanoidRootPart.CFrame.LookVector * -50 + t2.td.HumanoidRootPart.CFrame.UpVector * 50
		debris:AddItem(t2.td, 1.5)
		module.ShowDialog("Scene8")
	end)
end
function module.BlockheadLaugh()
	audioService.PlaySound("JevilLaugh")
	LoadAnimation(t2.td.Humanoid, "rbxassetid://83844598536435", nil):Play(0)
end
function module.BlockheadLooksAtEachOther()
	LookTowards(t2.xdn, t2.bh)
	LookTowards(t2.bh, t2.xdn)
end
function module.BlockheadGetAngryer()
	t2.xdn.Torso.RedGlow.PointLight.Brightness = 10
	audioService.PlaySound("NinjaEffect2")
	t2.xdn_arms:Play()
end
function module.BlockheadGetAngryist()
	t2.xdn.Torso.RedGlow.PointLight.Brightness = 20
	audioService.PlaySound("NinjaEffect3")
	audioService.PlaySound("Shine")
	effects.ShakeDialog(dialog2.Effect)

	local v456 = LoadAnimation(t2.xdn.Humanoid, "rbxassetid://113650844528567", 0.2)

	v456:Play(0.2)
	t2.xdn_point = v456
	t2.xdn_arms:Stop()
	turnOffBlackBars(0.5)
end
function module.BlockheadJump()
	LoadAnimation(t2.td.Humanoid, "rbxassetid://102790555019101", nil):Play(0)
	audioService.PlaySound("toon beep")
end
function module.BlockheadCleanup()
	task.delay(3, function()
		t2.xdn_arms:Stop()
		t2.xdn:Destroy()
		t2.td:Destroy()
		t2.bh:Destroy()
		replicatedStorage.Trash.TestDummy.Parent = workspace.Duelists
		replicatedStorage.Trash.Blockhead.Parent = workspace.Duelists
		xdnFollowYou()
	end)
end
function module.npcCrossArms(p172)
	local v458 = LoadAnimation(p172.Humanoid, "rbxassetid://75635890255855", 0.2)

	v458:Play(0.2)
	t2.npc_cross = v458
end
function module.StartTitanoScene()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	end

	TurnOnBlackBars(0.1, 50)
	t2.xdn = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummy)
	t2.xdn:PivotTo(workspace.Markers.SaveTitano_D.CFrame)

	local titano2 = workspace.Duelists.Titano2
	local clone = titano2:Clone()

	if clone.Head:FindFirstChild("NPCIcon") then
		clone.Head.NPCIcon.Enabled = false
	end

	titano2.Parent = replicatedStorage.Trash
	clone.Parent = workspace
	clone.HumanoidRootPart.Anchored = false
	t2.Titano = clone

	local titano_idle = LoadAnimation(t2.Titano.Humanoid, "rbxassetid://110414633890979", nil)

	titano_idle:Play(0)
	t2.Titano_idle = titano_idle
	LocalPlayer.Character:PivotTo(workspace.Markers.SaveTitano_P.CFrame)
	PreloadAnimations({ "rbxassetid://71950179359888" })
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.xdnJump()
	LoadAnimation(t2.xdn.Humanoid, "rbxassetid://102790555019101", nil):Play(0)
	audioService.PlaySound("toon beep")
end
function module.xdnStepForward()
	t2.xdn.Humanoid:MoveTo(t2.xdn.HumanoidRootPart.Position + t2.xdn.HumanoidRootPart.CFrame.LookVector * 3)
end
function module.TitanoJump()
	audioService.PlaySound("toon beep")
	t2.Titano_idle:Stop()
	LoadAnimation(t2.Titano.Humanoid, "rbxassetid://71950179359888", nil):Play(0)
	task.delay(0.5, function()
		audioService.PlaySound("MeebCallChu")
	end)
end
function module.TitanoCleanup()
	transition.ToggleBlack(1, 0.3)
	networkInvokeServer("QuestAward", "SaveTitano")
	networkClient.UnmuteWorld()
	networkClient.UpdateWorld()
	turnOffBlackBars(0.1)
	xdnFollowYou(true)
	t2.xdn:Destroy()
	t2.Titano:Destroy()
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.MeeboidCultistGravityCoil(p173)
	for _, v in pairs(p173.Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	local v465 = LoadAnimation(p173.Humanoid, "rbxassetid://93415885878434", 0.2)

	v465:Play(0.2)
	t2.coil = v465
	p173.Coil.Transparency = 0
	audioService.PlaySound("GravCoil")
end
function module.MeeboidCultistCleanUp()
	transition.ToggleBlack(1, 0.3)
	t2.coil:Stop()
	networkInvokeServer("QuestAward", "GetGravityCoil")
	networkClient.UpdateWorld()
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.ShadowSlayerBattleStart()
	t2.ShadowClones = CreateDummyFromDummy(replicatedStorage.Dummies.ShadowslayerClones)
	audioService.PlaySound("NinjaEffect2")
end
function module.ShadowSlayerBattleCleanup()
	audioService.PlaySound("NinjaSummon2")
	task.delay(3, function()
		t2.ShadowClones:Destroy()
	end)
end
function module.NinjaGFound()
	networkInvokeServer("QuestAward", "FindNinjaG")
	networkInvokeServer("QuestAward", "FindAllNinja")
end
function module.NinjaTFound()
	networkInvokeServer("QuestAward", "FindNinjaT")
	networkInvokeServer("QuestAward", "FindAllNinja")
end
function module.NinjaSFound()
	networkInvokeServer("QuestAward", "FindNinjaS")
	networkInvokeServer("QuestAward", "FindAllNinja")
end
function module.SpawnNoobloxxer()
	networkInvokeServer("QuestAward", "VIPShirtNeeded")
	networkClient.UpdateWorld()
end
function module.GetVIPShirt()
	local LocalPlayerName: Instance = workspace:FindFirstChild(LocalPlayer.Name)

	if LocalPlayerName then
		local parent: Instance = LocalPlayerName:FindFirstChild("Torso") or LocalPlayerName:FindFirstChild("UpperTorso")
		local decal: Decal = Instance.new("Decal")

		decal.Texture = "rbxassetid://25897004"
		decal.Parent = parent
	end

	networkInvokeServer("QuestAward", "VIPShirtObtained")
	networkClient.UpdateWorld()
end
function module.SeesawSetup(p174)
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	end

	t2.xdn = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxxTitano_dummy)
	t2.xdn:PivotTo(workspace.Markers.SeesawD.CFrame)

	local v470 = LoadAnimation(t2.xdn.Humanoid, "rbxassetid://93415885878434", 0.2)

	v470:Play(0.2)
	t2.xdn_hold = v470
	LocalPlayer.Character:PivotTo(workspace.Markers.SeesawP.CFrame)
	t2.xdn.Humanoid.JumpPower = 150
	t2.xdn.Coil.Transparency = 0
	CurrentCamera.CFrame = workspace.Markers.SeesawC.CFrame

	if p174.Torso:FindFirstChild("ProximityPrompt") then
		p174.Torso.ProximityPrompt.Enabled = false
	end

	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	audioService.PlaySound("GravCoil")
end
function module.SeesawJump(p175)
	LocalPlayer.Character.HumanoidRootPart.Anchored = true
	t2.xdn_hold:Stop()
	audioService.PlaySound("jump")
	task.spawn(function()
		local v669 = LoadAnimation(t2.xdn.Humanoid, "rbxassetid://114908295440501", 0.2)

		v669:Play(0.2)
		animation.Animate(t2.xdn.HumanoidRootPart, { CFrame = workspace.Markers.SeesawD2.CFrame * CFrame.new(0, 50, 0) }, 1, "Out", "Quart")
		animation.Animate(t2.xdn.HumanoidRootPart, { CFrame = workspace.Markers.SeesawD2.CFrame }, 0.7, "In", "Quad")
		v669:Stop()
		LocalPlayer.Character.HumanoidRootPart.Anchored = false
		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 200, 0)
		audioService.PlaySound("HammerImpact")
		task.delay(1, function()
			t2.xdn:Destroy()
			xdnFollowYou(true)

			if p175.Torso:FindFirstChild("ProximityPrompt") then
				p175.Torso.ProximityPrompt.Enabled = true
			end

			if workspace:FindFirstChild("xxdemonninjaxxTitano_dummy") then
				audioService.PlaySound("MeebCallUp")
				textChatService:DisplayBubble(workspace.xxdemonninjaxxTitano_dummy.Titano.TitanoHead, "meeeeep  o v o")
			end
		end)
	end)
end
function module.Act1IntroSetup()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act1IntroP.CFrame)

	local act1IntroCamA = workspace.Markers:FindFirstChild("Act1IntroCamA")

	if not act1IntroCamA then
		warn("No marker: Act1IntroCamA")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = act1IntroCamA.CFrame
	end

	TurnOnBlackBars(0.1, 50)

	local colo = CreateDummyFromDummy(replicatedStorage.Dummies.Colo_A1)

	colo.HumanoidRootPart.CFrame = workspace.Markers.ColoIntro1Spawn.CFrame
	colo.Humanoid.WalkSpeed = 9
	t2.Colo = colo
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.Act1IntroCleanup()
	task.wait(0.6)
	transition.ToggleBlack(1, 0.3)
	networkClient.UnmuteWorld()
	turnOffBlackBars(0.1)
	t2.Colo:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.NinjaTrioSetup(_)
	transition.ToggleBlack(1, 0.3)

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	end

	local dnj = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxxTitano_dummy)

	dnj.HumanoidRootPart.CFrame = workspace.Markers.dnjNTSpawn.CFrame
	dnj.Humanoid.WalkSpeed = 16
	t2.Dnj = dnj
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.Ninja1Logout(_)
	workspace.Duelists.xxdarksamuraixx3.Parent = replicatedStorage.Trash
	audioService.PlaySound("splat.wav")
end
function module.Ninja2Logout(_)
	workspace.Duelists.xxshadowslayerxx4.Parent = replicatedStorage.Trash
	audioService.PlaySound("Kerplunk.wav")
end
function module.Ninja3Logout(_)
	workspace.Duelists.xxawesomeninjaxx3.Parent = replicatedStorage.Trash
	audioService.PlaySound("Leave")
end
function module.NinjaTrioCleanup(_)
	transition.ToggleBlack(1, 0.3)
	t2.Dnj:Destroy()
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	task.delay(2, function()
		module.AutoStartDialog(require(replicatedStorage.Dialogue.TelamonSpeechDialog))
	end)
end
function module.TelamonSpeechSetup()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()

	if t2.FollowingDummyMaid then
		t2.FollowingDummyMaid:Destroy()
	end

	LocalPlayer.Character:PivotTo(workspace.Markers.TelamonSpeechP.CFrame)

	local telamonSpeechCamA = workspace.Markers:FindFirstChild("TelamonSpeechCamA")

	if not telamonSpeechCamA then
		warn("No marker: TelamonSpeechCamA")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = telamonSpeechCamA.CFrame
	end

	TurnOnBlackBars(0.1, 50)
	t2.TelamonCrowdRandoms = {}
	t2.TelamonCrowdSpecials = {}

	for _, v in pairs(replicatedStorage.Dummies.TelamonCrowdDummies:GetChildren()) do
		local v484 = CreateDummyFromDummy(v)

		t2[v.Name] = v484
		v484.Humanoid.JumpPower = 40
		table.insert(t2.TelamonCrowdRandoms, v484)
	end

	for _, v in pairs(replicatedStorage.Dummies.TelamonCrowdDummiesSpecial:GetChildren()) do
		local v487 = CreateDummyFromDummy(v)

		t2[v.Name] = v487
		table.insert(t2.TelamonCrowdSpecials, v487)
	end

	local telamon = CreateDummyFromDummy(replicatedStorage.Dummies.Telamon)

	telamon.HumanoidRootPart.CFrame = workspace.Markers.TelamonSpeechSpeakerEntrance.CFrame
	telamon.Humanoid.WalkSpeed = 9
	t2.Telamon = telamon
	t2.Telamon_welcome = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://93795520291748")
	t2.Telamon_pullup = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://138242000039882")
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.TelamonColoTalks()
	local colo_lookleft = LoadAnimation(t2.Colo_dummy.Humanoid, "rbxassetid://103396173650465", nil)

	colo_lookleft:Play(0)
	t2.Colo_lookleft = colo_lookleft
end
function module.TelamonColoStopsTalking()
	t2.Colo_lookleft:Stop()
end
function module.TelamonSpeechCleanup()
	transition.ToggleBlack(1, 0.3)
	audioService.ChangeSong("Lobby")
	networkInvokeServer("QuestAward", "FinishSpeech")
	networkClient.UpdateWorld()
	turnOffBlackBars(0.1)

	for _, v in pairs(t2.TelamonCrowdRandoms) do
		v:Destroy()
	end

	for _, v in pairs(t2.TelamonCrowdSpecials) do
		v:Destroy()
	end

	t2.Telamon:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	task.delay(2, function()
		module.AutoStartDialog(require(replicatedStorage.Dialogue.PostSpeech))
	end)
end
function module.TelamonWalk()
	audioService.ChangeSong("Silence")
	CurrentCamera.CameraType = Enum.CameraType.Scriptable

	local Head = t2.Telamon.Head

	local connection = game:GetService("RunService").RenderStepped:Connect(function()
		if Head then
			CurrentCamera.CFrame = CFrame.new(Head.Position + Head.CFrame.RightVector * 15, Head.Position)
		end
	end)

	task.delay(0.5, function()
		audioService.PlaySound("walk")
	end)
	task.spawn(function()
		t2.Telamon.Humanoid:MoveTo(workspace.Markers.TelamonSpeechSpeaker.Position, workspace.Markers.TelamonSpeechSpeaker)
		t2.Telamon.Humanoid.MoveToFinished:Wait()
		connection:Disconnect()
		module.ShowDialog("TelamonWalkEnd")
	end)
end
function module.TelamonTurn()
	audioService.PlaySound("Stone Slide 1")
	FaceHolderSet(t2.Telamon, "tired")

	local Head = t2.Telamon.Head
	local n1 = Head.Position + Head.CFrame.RightVector * 25
	local animationAnimateAsync = animation.AnimateAsync
	local HumanoidRootPart = t2.Telamon.HumanoidRootPart
	local v501 = t2.Telamon.HumanoidRootPart.CFrame
	local v502 = CFrame.Angles(0, -1.5707963267948966, 0)

	animationAnimateAsync(HumanoidRootPart, { CFrame = v501 * v502 }, 1.2, "Out", "Quart")

	local animateAsync = animation.AnimateAsync
	local cFrame = CFrame.new(n1, Head.Position)

	animateAsync(CurrentCamera, { CFrame = cFrame }, 1.2, "Out", "Quad")
end
function module.TelamonReactionTired()
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.TelamonSpeechCamA.CFrame }, 0, "Out", "Linear")
end
function module.TelamonZoomIn()
	local Head = t2.Telamon.Head

	CurrentCamera.CFrame = CFrame.new(Head.Position + Head.CFrame.LookVector * 15, Head.Position)
end
function module.TelamonReactionTired2()
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.TelamonSpeechCamA.CFrame }, 0, "Out", "Linear")
	t2.Colo_lookleft:Play()
end
function module.TelamonEhem()
	t2.Colo_lookleft:Stop()
	effects.ShakeDialog(dialog2.Effect)

	local telamon_ehem = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://84857061741215", nil)

	telamon_ehem:Play(0)
	t2.Telamon_ehem = telamon_ehem
	FaceHolderSet(t2.Telamon, "annoyed")
	task.spawn(function()
		audioService.ChangeSong("A1C", { TimePosition = 0 })
	end)
end
function module.TelamonEhemZoomIn()
	local HumanoidRootPart = t2.Telamon.HumanoidRootPart

	CurrentCamera.CFrame = CFrame.new(HumanoidRootPart.Position + HumanoidRootPart.CFrame.LookVector * 15, HumanoidRootPart.Position)
end
function module.CelestialZoomIn()
	FocusCamera(t2.Celestial_dummy.HumanoidRootPart)
end
function module.TelamonZoomEnding()
	FocusCamera(t2.Telamon.HumanoidRootPart)
	task.wait(0.5)
	FaceHolderSet(t2.Telamon, "annoyed")

	local telamon_ehem = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://84857061741215", nil)

	telamon_ehem:Play(0)
	t2.Telamon_ehem = telamon_ehem
end
function module.TelamonWelcome()
	local HumanoidRootPart = t2.Telamon.HumanoidRootPart

	for _, v in pairs(HumanoidRootPart.Particles:GetChildren()) do
		v.Enabled = true
	end

	local animationAnimateAsync = animation.AnimateAsync
	local cFrame = CFrame.new(HumanoidRootPart.Position + HumanoidRootPart.CFrame.LookVector * 25, HumanoidRootPart.Position)

	animationAnimateAsync(CurrentCamera, { CFrame = cFrame }, 1.2, "InOut", "Quad")
	t2.Telamon_welcome:Play()
	t2.Telamon_ehem:Stop(0.5)
end
function module.TelamonReturnCamera()
	local HumanoidRootPart = t2.Telamon.HumanoidRootPart
	local animationAnimateAsync = animation.AnimateAsync
	local cFrame = CFrame.new(HumanoidRootPart.Position + HumanoidRootPart.CFrame.LookVector * 25, HumanoidRootPart.Position)

	animationAnimateAsync(CurrentCamera, { CFrame = cFrame }, 1.2, "InOut", "Quad")
end
function module.DropAnvil()
	local HumanoidRootPart = t2.Celestial_dummy.HumanoidRootPart

	audioService.PlaySound("finger snap")
	task.wait(0.2)
	audioService.PlaySound("CartoonFall")

	local clone = replicatedStorage.Dummies.Anvil:Clone()

	t2.Anvil = clone

	local clonePrimaryPart = clone.PrimaryPart

	clonePrimaryPart.CFrame = clonePrimaryPart.CFrame * CFrame.new(0, 1000, 0)
	clone.Parent = workspace
	animation.AnimateAsync(clone.PrimaryPart, { CFrame = clone.PrimaryPart.CFrame * CFrame.new(0, -1001, 0) }, 3, "Out", "Linear")
	task.delay(2.9, function()
		audioService.StopSound("CartoonFall")
		audioService.PlaySound("AnvilImpact")
		animation.AnimateAsync(HumanoidRootPart, { CFrame = HumanoidRootPart.CFrame * CFrame.new(0, -10, 0) }, 0.1, "Out", "Quart")
		task.wait(3)
		module.TelamonZoomEnding()
		module.ShowDialog("AnvilFinished")
	end)
end
function module.TelamonAudienceCheer()
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.TelamonSpeechCamA.CFrame }, 0, "Out", "Linear")

	local timestamp = tick()

	t2.Telamon_connection = game:GetService("RunService").RenderStepped:Connect(function()
		if tick() - timestamp >= 0.2 then
			timestamp = tick()

			local telamonCrowdRandoms = t2.TelamonCrowdRandoms
			local randomNumber = math.random(1, #t2.TelamonCrowdRandoms)

			telamonCrowdRandoms[randomNumber].Humanoid.Jump = true
		end
	end)
end
function module.TelamonAudienceStop()
	if t2.Telamon_connection then
		t2.Telamon_connection:Disconnect()
	end
end
function module.TelamonPullupTable()
	if t2.Telamon_connection then
		t2.Telamon_connection:Disconnect()
	end

	audioService.PlaySound("finger snap")

	local HumanoidRootPart = t2.Telamon.HumanoidRootPart

	for _, v in pairs(HumanoidRootPart.Particles:GetChildren()) do
		v.Enabled = false
	end

	local n1 = HumanoidRootPart.Position + HumanoidRootPart.CFrame.LookVector * 25

	CurrentCamera.CFrame = CFrame.new(n1, HumanoidRootPart.Position)

	local cFrame = CFrame.new(n1 + CurrentCamera.CFrame.RightVector * 12, HumanoidRootPart.Position + HumanoidRootPart.CFrame.RightVector * -12)

	animation.AnimateAsync(CurrentCamera, { CFrame = cFrame }, 1, "InOut", "Quad")
	t2.Telamon_pullup:Play()
	t2.Telamon_welcome:Stop(0.3)

	local clone = replicatedStorage.Dummies.RobloxHQTable:Clone()

	t2.Telamon_table = clone

	local clonePrimaryPart = clone.PrimaryPart

	clonePrimaryPart.CFrame = clonePrimaryPart.CFrame * CFrame.new(0, 20, 0)
	clone.Parent = workspace
	animation.AnimateAsync(clone.PrimaryPart, { CFrame = clone.PrimaryPart.CFrame * CFrame.new(0, -20, 0) }, 1, "Out", "Bounce")
	task.delay(0.45, function()
		audioService.PlaySound("PewImpact")
	end)
end
function module.TelamonShowItems()
	animation.AnimateAsync(CurrentCamera, { CFrame = workspace.Markers.TelamonTableC.CFrame }, 0.6, "InOut", "Quad")
	t2.Telamon_pullup:Stop(0.2)
	task.spawn(function()
		local clone = replicatedStorage.Dummies.NewHats.Alar:Clone()

		clone.Handle.Transparency = 1
		clone.Parent = workspace
		animation.AnimateAsync(clone.Handle, { Transparency = 0 }, 0.6, "Out", "Quart")
		t2.item1 = clone
		task.wait(0.2)

		local clone4 = replicatedStorage.Dummies.NewHats.Catseye:Clone()

		clone4.Handle.Transparency = 1
		clone4.Parent = workspace
		animation.AnimateAsync(clone4.Handle, { Transparency = 0 }, 0.6, "Out", "Quart")
		t2.item2 = clone4
		task.wait(0.2)

		local clone5 = replicatedStorage.Dummies.NewHats.Drakobloxxer:Clone()
		local Torso = clone5.Torso

		Torso.CFrame = Torso.CFrame * CFrame.new(0, 20, 0)
		clone5.Parent = workspace
		t2.item3 = clone5
		animation.AnimateAsync(clone5.PrimaryPart, { CFrame = clone5.PrimaryPart.CFrame * CFrame.new(0, -20, 0) }, 1, "Out", "Bounce")
		task.delay(0.45, function()
			audioService.PlaySound("splat.wav")
		end)
		t2.NewItems_Spin = true
		task.spawn(function()
			while t2.NewItems_Spin do
				local v679 = game:GetService("RunService").RenderStepped:Wait()
				local cloneHandle = clone.Handle
				local cFrame = clone.Handle.CFrame
				local v682 = CFrame.Angles(0, 3.141592653589793 * v679, 0)

				cloneHandle.CFrame = cFrame * v682

				local clone4Handle = clone4.Handle
				local v684 = clone4.Handle.CFrame

				v682 = CFrame.Angles(3.141592653589793 * v679, 0, 0)
				clone4Handle.CFrame = v684 * v682
			end
		end)
	end)
end
function module.TelamonHighlightItem1()
	local telamon_arms = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://75635890255855", 0.2)

	telamon_arms:Play(0.2)
	t2.Telamon_arms = telamon_arms

	local cFrame = CFrame.new(CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 6 + CurrentCamera.CFrame.RightVector * -6, t2.item1.Handle.Position)

	animation.AnimateAsync(CurrentCamera, { CFrame = cFrame }, 0.6, "InOut", "Quad")
end
function module.TelamonHighlightItem2()
	t2.Telamon_arms:Stop()

	local cFrame = CFrame.new(CurrentCamera.CFrame.Position + CurrentCamera.CFrame.RightVector * 6, t2.item2.Handle.Position)

	animation.AnimateAsync(CurrentCamera, { CFrame = cFrame }, 0.6, "InOut", "Quad")
end
function module.TelamonHighlightItem3()
	local cFrame = CFrame.new(CurrentCamera.CFrame.Position + CurrentCamera.CFrame.RightVector * 6, t2.item3.Torso.Position)

	animation.AnimateAsync(CurrentCamera, { CFrame = cFrame }, 0.6, "InOut", "Quad")
end
function module.CivPitTrap()
	if not LocalPlayer.Character then
		return
	end

	local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

	if not humanoid then
		return
	end

	local timestamp = tick()

	t2.CivPitTrapConnection = humanoid.Died:Connect(function()
		if tick() - timestamp < 60 then
			networkInvokeServer("QuestAward", "CivPitTrap", true)
		end

		t2.CivPitTrapConnection:Disconnect()
	end)
end
function module.PostSpeechSetup()
	local v534 = CreateDummyFromDummy(replicatedStorage.Dummies.Colo_A1)

	v534.HumanoidRootPart.CFrame = workspace.Markers.ColoA1TSpawn.CFrame
	v534.Humanoid.WalkSpeed = 16
	t2.Colo = v534
	v534 = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummy)
	v534.HumanoidRootPart.CFrame = workspace.Markers.dnjA1TSpawn.CFrame
	v534.Humanoid.WalkSpeed = 16
	t2.Dnj = v534
	v534 = CreateDummyFromDummy(replicatedStorage.Dummies.chillguy_dummy)
	v534.HumanoidRootPart.CFrame = workspace.Markers.chillguySpawn.CFrame
	v534.Humanoid.WalkSpeed = 16
	t2.chillguy = v534
	module.TurnDummyTowardsPlayer(nil, "Colo")
end
function module.chillguylookatcolo(_)
	LookTowards(t2.Colo, t2.chillguy)
	LookTowards(t2.chillguy, t2.Colo)
end
function module.dnjApproach()
	t2.Dnj.Humanoid:MoveTo(workspace.Markers.A1TMove.Position, workspace.Markers.A1TMove)
	t2.Dnj.Humanoid.MoveToFinished:Wait()
	print("move to finished")
	LookTowards(t2.Colo, t2.Dnj)
	LookTowards(t2.Dnj, t2.Colo)
end
function module.PostSpeechCleanup()
	transition.ToggleBlack(1, 0.3)
	networkClient.UnmuteWorld()
	t2.Colo:Destroy()
	t2.chillguy:Destroy()
	t2.Dnj:Destroy()
	networkInvokeServer("QuestAward", "FinishPostSpeech")
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.BasementSetup()
	transition.ToggleBlack(1, 0.3)
	TurnOnBlackBars(0.1, 50)
	networkClient.MuteWorld()

	local alphaBrickRoomBegin = workspace.Markers:FindFirstChild("AlphaBrickRoomBegin")

	if not alphaBrickRoomBegin then
		warn("No marker: AlphaBrickRoomBegin")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = alphaBrickRoomBegin.CFrame
	end

	audioService.ChangeSong("Imperium 4")
	t2.Room = CreateDummyFromDummy(replicatedStorage.Dummies.Basement1Room)

	local colo = CreateDummyFromDummy(replicatedStorage.Dummies.ColoA1B)
	local a1bColo = workspace.Markers.A1bColo

	colo.HumanoidRootPart.CFrame = a1bColo.CFrame
	task.spawn(function()
		task.wait(1)
		colo.HumanoidRootPart.CFrame = a1bColo.CFrame
	end)
	t2.Colo = colo
	LocalPlayer.Character:PivotTo(workspace.Markers.Act1_BPlayerStart.CFrame)

	local dnj = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummyA1B)
	local a1bDnj = workspace.Markers.A1bDnj

	dnj.HumanoidRootPart.CFrame = a1bDnj.CFrame
	task.spawn(function()
		task.wait(1)
		dnj.HumanoidRootPart.CFrame = a1bDnj.CFrame
	end)
	t2.Dnj = dnj

	local razar = CreateDummyFromDummy(replicatedStorage.Dummies.RazarA1B)

	razar.HumanoidRootPart.CFrame = workspace.Markers.A1bRazar.CFrame
	t2.Razar = razar
	t2.AlphaBrick = CreateDummyFromDummy(replicatedStorage.Dummies.AlphaBrick)
	t2.WallToBreak = CreateDummyFromDummy(replicatedStorage.Dummies.WallToBreak)

	local telamon = CreateDummyFromDummy(replicatedStorage.Dummies.TelamonA1B)
	local a1bTelamon = workspace.Markers.A1bTelamon

	telamon.HumanoidRootPart.CFrame = a1bTelamon.CFrame
	t2.Telamon = telamon
	task.spawn(function()
		task.wait(1)
		telamon.HumanoidRootPart.CFrame = a1bTelamon.CFrame
		task.wait(1)
		telamon.HumanoidRootPart.CFrame = a1bTelamon.CFrame
		task.wait(1)
		telamon.HumanoidRootPart.CFrame = a1bTelamon.CFrame
	end)

	local celestial = CreateDummyFromDummy(replicatedStorage.Dummies.CelestialA1B)

	celestial.HumanoidRootPart.CFrame = workspace.Markers.A1bCelestial.CFrame
	t2.Celestial = celestial
	contentProvider:PreloadAsync({
		"rbxassetid://209714802",
		"rbxassetid://150070505",
		"rbxassetid://20909031",
		"rbxassetid://7075459",
		"rbxassetid://150070631",
		"rbxassetid://416829404",
		"rbxassetid://657217430",
		"rbxassetid://121282203745243",
		"rbxassetid://115778324488860",
		"rbxassetid://72415483936923",
		"rbxassetid://126397855277250",
		"rbxassetid://71892964504145",
		"rbxassetid://23219775",
		"rbxassetid://7076053"
	})
	PreloadTech(effect, {
		"rbxassetid://209714802",
		"rbxassetid://150070505",
		"rbxassetid://20909031",
		"rbxassetid://7075459",
		"rbxassetid://150070631",
		"rbxassetid://416829404",
		"rbxassetid://657217430",
		"rbxassetid://121282203745243",
		"rbxassetid://115778324488860",
		"rbxassetid://72415483936923",
		"rbxassetid://126397855277250",
		"rbxassetid://71892964504145",
		"rbxassetid://23219775",
		"rbxassetid://7076053"
	})
	t2.Colo_Basement = LoadAnimation(t2.Colo.Humanoid, "rbxassetid://" .. 112905691677668)
	t2.Brick_Basement = LoadAnimation(t2.AlphaBrick.AnimationController.Animator, "rbxassetid://" .. 125795633849729)
	t2.Razar_Basement = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://" .. 99278040311850)
	t2.Dnj_Basement = LoadAnimation(t2.Dnj.Humanoid, "rbxassetid://" .. 112886194832200)
	t2.Telamon_Basement = LoadAnimation(t2.Telamon.Humanoid, "rbxassetid://" .. 114679613360685)
	t2.Celestial_Basement = LoadAnimation(t2.Celestial.Humanoid, "rbxassetid://" .. 129730631916547)
	t2.Wall_Basement = LoadAnimation(t2.WallToBreak.AnimationController.Animator, "rbxassetid://" .. 118311216263350)
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	t2.Colo_Basement:Play()
	t2.Brick_Basement:Play()
	t2.Razar_Basement:Play()
	t2.Dnj_Basement:Play()
	t2.Telamon_Basement:Play()
	t2.Celestial_Basement:Play()
	t2.Wall_Basement:Play()
end
function module.SwitchBasement()
	t2.Room2 = CreateDummyFromDummy(replicatedStorage.Dummies.Basement2Room)
	t2.Room:Destroy()
end
function module.BasementCleanup()
	transition.ToggleBlack(1, 0.3)
	networkClient.UnmuteWorld()
	turnOffBlackBars(0.1)
	t2.Telamon:Destroy()
	t2.Colo:Destroy()
	t2.Dnj:Destroy()
	t2.Razar:Destroy()
	t2.AlphaBrick:Destroy()
	t2.Celestial:Destroy()
	t2.WallToBreak:Destroy()
	LocalPlayer.Character:PivotTo(workspace.Markers.BrickRoomEndP.CFrame)

	if t2.Room2 then
		t2.Room2:Destroy()
	end

	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
end
function module.RazarCutscene()
	local CurrentCamera2: Camera = workspace.CurrentCamera

	transition.ToggleBlack(1, 0.3)
	TurnOnBlackBars(0.1, 50)
	networkClient.MuteWorld()
	audioService.ChangeSong("Silence")

	local razar = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Razar)
	local cutsceneCam = CreateDummyFromDummyStatic(replicatedStorage.Dummies.CutsceneCamera1)
	local saRazar2 = workspace.Markers.SARazar2

	razar.HumanoidRootPart.CFrame = workspace.Markers.SARazar1.CFrame
	cutsceneCam.CutsceneCamera.CFrame = saRazar2.CFrame
	t2.Razar = razar
	t2.CutsceneCam = cutsceneCam
	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerChillMarker.CFrame)
	t2.Razar_cutscene_cam = LoadAnimation(t2.CutsceneCam.AnimationController, "rbxassetid://" .. 102563855644491)
	t2.Razar_cutscene = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://" .. 136695420569380)
	task.wait(1)
	CurrentCamera2.CameraType = Enum.CameraType.Scriptable
	runService:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function()
		CurrentCamera2.CFrame = cutsceneCam.Parts.CameraBit2.CFrame
		CurrentCamera2.FieldOfView = 30
	end)
	t2.Razar_cutscene:Play()
	t2.Razar_cutscene_cam:Play()
	task.wait(1)
	module.AutoStartDialog(require(replicatedStorage.Dialogue.RazarCutsceneDialog))
	transition.ToggleBlack(-1, 0.3)
end
function module.RazarCutsceneCleanup()
	transition.ToggleBlack(1, 0.3)

	local CurrentCamera3: Camera = workspace.CurrentCamera

	networkClient.UnmuteWorld()
	turnOffBlackBars(0.1)
	runService:UnbindFromRenderStep("CutsceneCamera")
	CurrentCamera3.FieldOfView = 70
	t2.Razar:Destroy()
	t2.CutsceneCam:Destroy()
	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerChillMarker.CFrame)
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
end
function module.RazarCutscene2()
	local CurrentCamera4: Camera = workspace.CurrentCamera

	transition.ToggleBlack(1, 0.3)
	TurnOnBlackBars(0.1, 50)
	networkClient.MuteWorld()
	audioService.ChangeSong(nil)

	local razar = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Razar)
	local cutsceneCam = CreateDummyFromDummyStatic(replicatedStorage.Dummies.CutsceneCamera1)
	local saRazar2 = workspace.Markers.SARazar2

	razar.HumanoidRootPart.CFrame = workspace.Markers.SARazar1.CFrame
	cutsceneCam.CutsceneCamera.CFrame = saRazar2.CFrame
	t2.Razar = razar
	t2.CutsceneCam = cutsceneCam
	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerChillMarker.CFrame)
	t2.Razar_cutscene_cam = LoadAnimation(t2.CutsceneCam.AnimationController, "rbxassetid://" .. 109773069351564)
	t2.Razar_cutscene = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://" .. 106155949940435)
	task.wait(1)
	CurrentCamera4.CameraType = Enum.CameraType.Scriptable
	runService:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function()
		CurrentCamera4.CFrame = cutsceneCam.Parts.CameraBit2.CFrame
		CurrentCamera4.FieldOfView = 30
	end)
	t2.Razar_cutscene:Play()
	t2.Razar_cutscene_cam:Play()
	task.wait(1)
	transition.ToggleBlack(-1, 0.3)
end
function module.BigPunch()
	module.CloseDialog()
	audioService.PlaySound("LargePunch")
	transition.ToggleBlack(1, 0)

	local CurrentCamera5: Camera = workspace.CurrentCamera

	runService:UnbindFromRenderStep("CutsceneCamera")
	t2.Razar:Destroy()
	t2.CutsceneCam:Destroy()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_TeiygenCutsceneChill.CFrame)
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
	module.ToggleDialogVisible(true)
	audioService.ChangeSong(nil)

	local razar = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Razar)
	local cutsceneCam = CreateDummyFromDummyStatic(replicatedStorage.Dummies.CutsceneCamera1)
	local teiygen = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Teiygen)
	local v561 = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Props.ChairRig)
	local phone = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Props.TeiygenPhone)

	razar.HumanoidRootPart.CFrame = workspace.Markers.Act2_TeiygenCutsceneRazar.CFrame
	cutsceneCam.CutsceneCamera.CFrame = workspace.Markers.Act2_TeiygenCutsceneCamera.CFrame
	teiygen.HumanoidRootPart.CFrame = workspace.Markers.Act2_TeiygenCutsceneTeiygen.CFrame
	v561.CutsceneCamera.CFrame = workspace.Markers.Act2_TeiygenCutsceneChair.CFrame
	phone.CutsceneCamera.CFrame = workspace.Markers.Act2_TeiygenCutscenePhone.CFrame
	t2.Razar = razar
	t2.Teiygen = teiygen
	t2.CutsceneCam = cutsceneCam
	t2.Phone = phone
	t2.chair = v561
	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerChillMarker.CFrame)
	t2.teiygen_cutscene_cam = LoadAnimation(t2.CutsceneCam.AnimationController, "rbxassetid://" .. 137570013481911)
	t2.teiygen_cutscene_razar = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://" .. 110387645528917)
	t2.teiygen_cutscene_teiygen = LoadAnimation(t2.Teiygen.Humanoid, "rbxassetid://" .. 110309782426997)
	t2.teiygen_cutscene_phone = LoadAnimation(t2.Phone.AnimationController, "rbxassetid://" .. 86967728276062)
	t2.teiygen_cutscene_chair = LoadAnimation(t2.chair.AnimationController, "rbxassetid://" .. 95141960260126)
	task.wait(1)
	CurrentCamera5.CameraType = Enum.CameraType.Scriptable
	runService:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function()
		CurrentCamera5.CFrame = cutsceneCam.Parts.CameraBit2.CFrame
		CurrentCamera5.FieldOfView = 30
	end)
	t2.teiygen_cutscene_cam:Play()
	t2.teiygen_cutscene_razar:Play()
	t2.teiygen_cutscene_teiygen:Play()
	t2.teiygen_cutscene_phone:Play()
	t2.teiygen_cutscene_chair:Play()
	task.wait(3)
	module.AutoStartDialog(require(replicatedStorage.Dialogue.RazarCutsceneDialog2))
	task.wait(1)
	transition.ToggleBlack(-1, 8)
end
function module.RazarCutsceneTeleport()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_TeiygenCutsceneSpawn.CFrame)
end
function module.RazarCutsceneUnTeleport()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_TeiygenCutsceneChill.CFrame)
end
function module.JohnCutsceneTeleport1()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_JohnCutscenePlayer.CFrame)
end
function module.JohnCutsceneTeleport2()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_JohnCutscenePlayer2.CFrame)
end
function module.TeiygenCutsceneCleanup()
	transition.ToggleBlack(1, 0.3)
	turnOffBlackBars(0.1)
	runService:UnbindFromRenderStep("CutsceneCamera")
	CurrentCamera.FieldOfView = 70
	t2.Razar:Destroy()
	t2.Teiygen:Destroy()
	t2.CutsceneCam:Destroy()
	t2.Phone:Destroy()
	t2.chair:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
	networkClient.SetStoryData({ SpawnLocation = "TeiygenSpawnPos" })
	networkClient.MuteWorld()
	audioService.SetLobbyTheme("HorrorTheme")
	audioService.ChangeSong("HorrorTheme")
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 3)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end

local n1: number = 0

function module.SearchRoom()
	module.CloseDialog()
	transition.ToggleBlack(1, 0.3)
	n1 += 1

	if n1 == 1 then
		audioService.PlaySound("AnvilImpact")
		task.wait(0.7)
		audioService.PlaySound("AnvilImpact")
		task.wait(0.7)
		audioService.PlaySound("AnvilImpact")
		task.wait(0.7)
		audioService.PlaySound("AnvilImpact")
		task.wait(0.7)
		audioService.PlaySound("DoorClose")
		transition.ToggleBlack(-1, 0.3)
		module.AutoStartDialog(require(replicatedStorage.Dialogue.SearchDialogue1))
	elseif n1 == 2 then
		audioService.PlaySound("dogbark")
		task.wait(1)
		audioService.PlaySound("Chomp")
		task.wait(1)
		audioService.PlaySound("CarHorn")
		transition.ToggleBlack(-1, 0.3)
		module.AutoStartDialog(require(replicatedStorage.Dialogue.SearchDialogue2))
	elseif n1 == 3 then
		audioService.PlaySound("incoming foil")
		task.wait(1)
		audioService.PlaySound("toon beep")
		task.wait(1)
		audioService.PlaySound("unsheath")
		networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 4)
		networkClient.UpdateWorld()
		task.wait(1)
		module.AutoStartDialog(require(replicatedStorage.Dialogue.SearchDialogue3))
		transition.ToggleBlack(-1, 0.3)
	elseif n1 == 4 then
		task.wait(1)
		transition.ToggleBlack(-1, 0.3)
		module.AutoStartDialog(require(replicatedStorage.Dialogue.SearchDialogue4))
	end
end
function module.BreakDoor()
	module.CloseDialog()
	transition.ToggleBlack(1, 0.3)
	audioService.PlaySound("CrowbarSwing")
	task.wait(0.3)
	audioService.PlaySound("Crowbar2")
	audioService.PlaySound("Crowbar3")
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 5)
	networkClient.UpdateWorld()
	task.wait(1)
	transition.ToggleBlack(-1, 0.3)
end
function module.JohnCutscene()
	local CurrentCamera6: Camera = workspace.CurrentCamera

	transition.ToggleBlack(1, 0.3)
	TurnOnBlackBars(0.1, 50)
	networkClient.MuteWorld()
	audioService.ChangeSong("Silence")

	local razar = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Razar)
	local teiygen = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Teiygen)
	local john = CreateDummyFromDummyStatic(replicatedStorage.Dummies.JohnDoe)
	local cutsceneCam = CreateDummyFromDummyStatic(replicatedStorage.Dummies.CutsceneCamera1)

	razar.HumanoidRootPart.CFrame = workspace.Markers.Act2_JohnCutsceneRazar.CFrame
	cutsceneCam.CutsceneCamera.CFrame = workspace.Markers.Act2_JohnCutsceneCamera.CFrame
	john.HumanoidRootPart.CFrame = workspace.Markers.Act2_JohnCutsceneJohn.CFrame
	teiygen.HumanoidRootPart.CFrame = workspace.Markers.Act2_JohnCutsceneTeiygen.CFrame
	t2.Razar = razar
	t2.CutsceneCam = cutsceneCam
	t2.John = john
	t2.Teiygen = teiygen
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 7)
	networkClient.UpdateWorld()
	task.wait(1)
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_JohnCutscenePlayer.CFrame)
	t2.john_cutscene_cam = LoadAnimation(t2.CutsceneCam.AnimationController, "rbxassetid://" .. 83823790656480)
	t2.john_cutscene_john = LoadAnimation(t2.John.Humanoid, "rbxassetid://" .. 135111239214560)
	t2.john_cutscene_razar = LoadAnimation(t2.Razar.Humanoid, "rbxassetid://" .. 137466891516902)
	t2.john_cutscene_teiygen = LoadAnimation(t2.Teiygen.Humanoid, "rbxassetid://" .. 77400587052017)
	task.wait(1)
	CurrentCamera6.CameraType = Enum.CameraType.Scriptable
	runService:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function()
		CurrentCamera6.CFrame = cutsceneCam.Parts.CameraBit2.CFrame
		CurrentCamera6.FieldOfView = 30
	end)
	t2.john_cutscene_cam:Play()
	t2.john_cutscene_john:Play()
	t2.john_cutscene_razar:Play()
	t2.john_cutscene_teiygen:Play()
	task.wait(1)
	module.AutoStartDialog(require(replicatedStorage.Dialogue.JohnCutsceneDialog))
	transition.ToggleBlack(-1, 0.3)
end
function module.JohnCutsceneCleanup()
	transition.ToggleBlack(1, 0.3)

	local CurrentCamera7: Camera = workspace.CurrentCamera

	turnOffBlackBars(0.1)
	runService:UnbindFromRenderStep("CutsceneCamera")
	CurrentCamera7.FieldOfView = 70
	t2.Teiygen:Destroy()
	t2.John:Destroy()
	t2.Razar:Destroy()
	t2.CutsceneCam:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 8)
	networkClient.UpdateWorld()
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.NinjaCutscene()
	local CurrentCamera8: Camera = workspace.CurrentCamera

	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()
	audioService.ChangeSong(nil)

	local demonninja = CreateDummyFromDummyStatic(replicatedStorage.Dummies.xxdemonninjaxx_dummy)
	local cutsceneCam = CreateDummyFromDummyStatic(replicatedStorage.Dummies.CutsceneCamera1)
	local act2_NinjaCutsceneCamera = workspace.Markers.Act2_NinjaCutsceneCamera

	demonninja.HumanoidRootPart.CFrame = workspace.Markers.Act2_NinjaCutscene.CFrame
	cutsceneCam.CutsceneCamera.CFrame = act2_NinjaCutsceneCamera.CFrame
	t2.Demonninja = demonninja
	t2.CutsceneCam = cutsceneCam
	t2.Demonninja_cutscene_cam = LoadAnimation(t2.CutsceneCam.AnimationController, "rbxassetid://" .. 107777900745840)
	t2.Demonninja_cutscene = LoadAnimation(t2.Demonninja.Humanoid, "rbxassetid://" .. 96463971141104)
	task.wait(1)
	CurrentCamera8.CameraType = Enum.CameraType.Scriptable
	runService:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function()
		CurrentCamera8.CFrame = cutsceneCam.Parts.CameraBit2.CFrame
		CurrentCamera8.FieldOfView = 30
	end)
	t2.Demonninja_cutscene:Play()
	t2.Demonninja_cutscene_cam:Play()
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_NinjaCutscenePlayer.CFrame)
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.NinjaCutsceneCleanup()
	transition.ToggleBlack(1, 0.3)

	local CurrentCamera9: Camera = workspace.CurrentCamera

	networkClient.UnmuteWorld()
	turnOffBlackBars(0.1)
	runService:UnbindFromRenderStep("CutsceneCamera")
	CurrentCamera9.FieldOfView = 70
	t2.Demonninja:Destroy()
	t2.CutsceneCam:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
end
function module.CafeRoomSetup()
	transition.ToggleBlack(1, 0.3)
	LocalPlayer.Character:PivotTo(workspace.Markers.CafeSpawnMarker.CFrame)
	audioService.SetLobbyTheme("CafeTheme")
	audioService.ChangeSong("CafeTheme")
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.CafeLeave()
	transition.ToggleBlack(1, 0.3)
	task.wait(1)
	LocalPlayer.Character:PivotTo(workspace.Markers.LibrarySpawnMarker.CFrame)
	audioService.SetLobbyTheme("Lobby")
	audioService.ChangeSong("Lobby")
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.Act1EndDialogSetup()
	transition.ToggleBlack(1, 0.3)
	networkClient.MuteWorld()
	transition.SwitchWorldSky("Sky")
	transition.SwitchCurrentLighting("Default")
	TurnOnBlackBars(0.1, 50)

	local dropdown = workspace.Markers:FindFirstChild("Dropdown")

	if not dropdown then
		warn("No marker: Dropdown")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = dropdown.CFrame
	end

	local colo = CreateDummyFromDummy(replicatedStorage.Dummies.Colo)

	colo.HumanoidRootPart.CFrame = workspace.Markers.ColoA1EndSpawn.CFrame
	t2.Colo = colo
	LocalPlayer.Character:PivotTo(workspace.Markers.PlayerA1EndSpawn.CFrame)

	local dnj = CreateDummyFromDummy(replicatedStorage.Dummies.xxdemonninjaxx_dummy)

	dnj.HumanoidRootPart.CFrame = workspace.Markers.DnjA1EndSpawn.CFrame
	t2.Dnj = dnj
	t2.Colo_Doomed = LoadAnimation(t2.Colo.Humanoid, "rbxassetid://" .. 134010350472380)
	task.wait(0.3)
	transition.ToggleBlack(-1, 0.3)
	t2.Colo_Doomed:Play()
end
function module.PopOutEyesColo(_, p183)
	if p183 == "true" then
		t2.Colo["Flabbergasted Eyes"].Handle.Transparency = 0
		effects.ShakeDialog(dialog2.Effect)

		return
	end

	t2.Colo["Flabbergasted Eyes"].Handle.Transparency = 1
end
function module.Act1EndDialogCleanup()
	transition.ToggleBlack(1, 0.3)
	t2.Colo:Destroy()
	t2.Dnj:Destroy()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	turnOffBlackBars(0.5)
	networkClient.UnmuteWorld()
	networkInvokeServer("QuestAward", "PostAct1Boss")
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.Act1EndColoTalk()
	networkInvokeServer("QuestAward", "FinishAct1")
	networkInvokeServer("QuestAward", "StartAct2")
	transition.ToggleBlack(1, 0.3)
	task.wait(1)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.Act1EndColoTalkAlt()
	networkInvokeServer("QuestAward", "StartAct2")
	transition.ToggleBlack(1, 0.3)
	task.wait(1)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.PhoneRing(p184)
	audioService.ChangeSong("Silence")
	p184.phone:Play()
end
function module.PhoneRecieve(p185)
	p185.phone:Pause()
	audioService.PlaySound("button.wav")
	audioService.ChangeSong("CallTheme")
end
function module.EndCall(_)
	audioService.ChangeSong("Silence")
	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 2)
	task.wait(1)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.PhoneEnd(p187)
	p187.phone:Pause()
	audioService.ChangeSong("Lobby")
end
function module.MidnightSetup()
	audioService.ChangeSong("Silence")
	transition.ToggleBlack(1, 1)
	task.wait(1)
	networkInvokeServer("ProgressNonNPCQuest", "NightTime")
	networkClient.MuteWorld()
	networkClient.SetStoryData({ SpawnLocation = "NightSpawnPos", Sky = "NightSky" })
	audioService.SetLobbyTheme("NightTheme")
	audioService.ChangeSong("NightTheme", { TimePosition = 0 })
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end
function module.Day2Setup()
	audioService.ChangeSong("Silence")
	transition.ToggleBlack(1, 3)
	task.wait(1)
	audioService.PlaySound("Sleepy")
	task.wait(5)
	networkInvokeServer("ProgressNonNPCQuestTo", "StoryProgress2", 2)
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
	module.CloseDialog()
	task.wait(1)
	audioService.PlaySound("MicrophoneDrop2")
	module.AutoStartDialog(require(replicatedStorage.Dialogue.WakeUpDialog1))
end
function module.TeiygenComputer()
	transition.ToggleBlack(1, 1)
	task.wait(1)

	local teiygen = CreateDummyFromDummyStatic(replicatedStorage.Dummies.Teiygen)

	teiygen.HumanoidRootPart.CFrame = workspace.Markers.Act2_TeiygenComputerTeiygen.CFrame
	LocalPlayer.Character:PivotTo(workspace.Markers.Act2_TeiygenComputerSpawn.CFrame)
	t2.Teiygen = teiygen
	t2.TeiygenAnimation = LoadAnimation(t2.Teiygen.Humanoid, "rbxassetid://" .. 115845768675422)
	transition.ToggleBlack(-1, 3)
	audioService.PlaySound("PanelTyping")
end
function module.TeiygenFallAsleep()
	audioService.ChangeSong("Silence")
	transition.ToggleBlack(1, 3)
	task.wait(3)
	networkInvokeServer("ProgressNonNPCQuest", "NightTime")
	networkClient.SetStoryData({
		Sky = "Act1Sky",
		SpawnLocation = "Act1SpawnLocation",
		LightingProfile = "Act1"
	})
	LocalPlayer.Character:PivotTo(workspace.Spawns.Act1SpawnLocation.CFrame * CFrame.new(0, 2, 0))
	audioService.SetLobbyTheme("NightTheme")
	audioService.ChangeSong("NightTheme", { TimePosition = 0 })
	task.wait(1)
	audioService.SetLobbyTheme("DreamTheme")
	audioService.ChangeSong("DreamTheme", { TimePosition = 0 })
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 6)
	t2.Teiygen:Destroy()
	networkClient.UpdateWorld()
	transition.ToggleBlack(-1, 3)
end
function module.TeiygenWakeUp()
	task.spawn(function()
		task.wait(1)
		audioService.PlaySound("CreepySound")
		task.wait(0.2)
		transition.ToggleBlack(1, 0)
		LocalPlayer.Character:PivotTo(workspace.Markers.Act2_TeiygenCutsceneSpawn.CFrame)
		audioService.StopSound("CreepySound")
		module.ToggleDialogVisible(false)
		audioService.ChangeSong("Silence")
		networkClient.SetStoryData({
			SpawnLocation = "TeiygenSpawnPos",
			Sky = "NightSky",
			LightingProfile = "Default"
		})
		task.wait(1)
		audioService.SetLobbyTheme("HorrorTheme")
		audioService.ChangeSong("HorrorTheme")
		networkClient.UpdateWorld()
		module.CloseDialog()
		transition.ToggleBlack(-1, 3)
	end)
end
function module.Act2SideQuestFinish()
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 10)
	module.CloseDialog()
	networkClient.ReturnFromStory(false, true)
end
function module.RazarLeave()
	transition.ToggleBlack(1, 1)
	task.wait(1)
	networkInvokeServer("ProgressNonNPCQuestTo", "SideQuestProgress", 11)
	networkClient.UpdateWorld()
	task.wait(1)
	transition.ToggleBlack(-1, 1)
end
function module.DateWithColo(p188)
	module.ToggleDialogVisible(false)
	transition.ToggleBlack(1, 1)
	task.wait(2)
	networkClient.MuteWorld()
	PreloadAnimations({
		"rbxassetid://123002005537118",
		"rbxassetid://86830578018340",
		"rbxassetid://108676575090647",
		"rbxassetid://70794530632645",
		"rbxassetid://104828892521505",
		"rbxassetid://77952334350076",
		"rbxassetid://91909174579615",
		"rbxassetid://83044619393174",
		"rbxassetid://116720042362087",
		"rbxassetid://94363459686568"
	})
	animation.AnimateAsync(p188.Torso.Neck, { C0 = oldHeadCFrames[p188] }, 0.35, "Out", "Quart")
	workspace.CurrentCamera.FieldOfView = 60

	local cafeCameraMarker = workspace.Markers:FindFirstChild("CafeCameraMarker")

	if not cafeCameraMarker then
		warn("No marker: CafeCameraMarker")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = cafeCameraMarker.CFrame
	end

	LocalPlayer.Character:PivotTo(workspace.Markers.CafeChillMarker.CFrame)
	transition.ToggleBlack(-1, 1)
	task.wait(1)
	module.ToggleDialogVisible(true)
end
function module.UndateWithColo(_)
	transition.ToggleBlack(1, 1)
	task.wait(1)
	CurrentCamera.FieldOfView = 70
	networkClient.UnmuteWorld()
	CurrentCamera.CameraType = Enum.CameraType.Custom

	local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		workspace.CurrentCamera.CameraSubject = humanoid
		humanoid.AutoRotate = true
	end

	LocalPlayer.Character:PivotTo(workspace.Markers.CafeSpawnMarker.CFrame)
	networkInvokeServer("ProgressNonNPCQuestTo", "StoryProgress2", 3)
	networkClient.UpdateWorld()
	task.wait(1)
	transition.ToggleBlack(-1, 1)
end
function module.ColoGetScared(p190, _)
	module.ShowDialog("Continue17")

	local cafeCameraMarker = workspace.Markers:FindFirstChild("CafeCameraMarker")

	if not cafeCameraMarker then
		warn("No marker: CafeCameraMarker")
	else
		CFrame = CurrentCamera.CFrame
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = cafeCameraMarker.CFrame
	end

	task.wait(0.7)
	module.ToggleDialogVisible(false)
	FaceHolderSet(p190, "horrified")

	local Humanoid = p190.Humanoid

	for _, v in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
	end

	LoadAnimation(Humanoid, "rbxassetid://77952334350076", nil):Play(0)
	audioService.PlaySound("Colo scream")
	task.wait(2)
	FaceHolderSet(p190, "pensive")
	task.wait(4)
	module.ToggleDialogVisible(true)
end

-- PATCH (Bouncer): mode buttons. Close the dialogue window, then start the chosen battle mode straight away.
function module.BouncerBattle(npc, mode)
	local duelist = "Bouncer"
	local botName = nil
	if npc then
		local dv = npc:FindFirstChild("Duelist")
		duelist = (dv and dv.Value) or npc.Name
		local bn = dv and dv:FindFirstChild("BotName")
		botName = bn and bn.Value
	end
	if module.CloseDialog then
		module.CloseDialog()
	end
	networkFireServer("RequestBattle", {
		Parent = true,
		Name = botName or duelist,
		Duelist = duelist,
		userId = -999999 - LocalPlayer.UserId,
		ExtraData = { Mode = mode },
	})
end

function module.BouncerDismiss()
	if module.CloseDialog then
		module.CloseDialog()
	end
	require(script.Parent.Parent.Handy).Show()
end

return module
