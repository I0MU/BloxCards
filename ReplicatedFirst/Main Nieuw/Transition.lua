print("Loading " .. script.Name)

local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local top = LocalPlayer.PlayerGui:WaitForChild("Top")
local visGuiBattleNew = visGui.BattleNew
local data = require(script.Parent.Data)
local CurrentCamera: Camera = workspace.CurrentCamera
local stepped = game:GetService("RunService").Stepped
local visGuiBattleBack = visGui.BattleBack
local visGuiBattleBackBack = visGuiBattleBack.Back
local clone = visGuiBattleBack.ImageHolder.Tile:Clone()
local color3 = Color3.fromRGB(207, 220, 241)
local t1: {[any]: any} = {}
local savedCameraCFrame = nil
local battleback: Instance = game:GetService("ReplicatedStorage"):WaitForChild("Battleback")
local cameraPart = battleback:WaitForChild("CameraPart")
local battlebackCameraPart: Instance = battleback:WaitForChild("CameraPart")
local u17: boolean = false
local u18 = false
local skies: Instance = game:GetService("Lighting"):WaitForChild("Skies")
local Battle = nil
local sky = game:GetService("Lighting"):FindFirstChild("Sky")
local exposureCompensation = game.Lighting.ExposureCompensation
local clockTime = game.Lighting.ClockTime
local fogStart = game.Lighting.FogStart
local ambient = game.Lighting.Ambient
local outdoorAmbient = game.Lighting.OutdoorAmbient
local colorShift_Bottom = game.Lighting.ColorShift_Bottom
local colorShift_Top = game.Lighting.ColorShift_Top
local shadowSoftness = game.Lighting.ShadowSoftness
local environmentDiffuseScale = game.Lighting.EnvironmentDiffuseScale
local brightness = game.Lighting.Brightness
local environmentSpecularScale = game.Lighting.EnvironmentSpecularScale
local AtmosphereColor = game.Lighting.Atmosphere.Color
local haze = game.Lighting.Atmosphere.Haze
local lightingProfiles = require(game.Lighting.LightingProfiles)
local default: {[any]: any} = {
	ExposureCompensation = exposureCompensation,
	ClockTime = clockTime,
	FogStart = fogStart,
	Ambient = ambient,
	OutdoorAmbient = outdoorAmbient,
	ColorShift_Bottom = colorShift_Bottom,
	ColorShift_Top = colorShift_Top,
	ShadowSoftness = shadowSoftness,
	EnvironmentDiffuseScale = environmentDiffuseScale,
	Brightness = brightness,
	EnvironmentSpecularScale = environmentSpecularScale,
	AtmosphereColor = AtmosphereColor,
	AtmosphereHaze = haze
}

lightingProfiles.Default = default

local t3 = default
local u38 = nil
local s1 = ""
local colorCorrection = game.Lighting.ColorCorrection
local topBlack = top.Black
local topSplash = top.Splash
local splashImage = top.Splash.SplashImage
local animation = require(game.ReplicatedStorage.Animation)

customscalings = require(script.Parent.CustomScalings).customscalings

local inspection = require(script.Parent.Inspection)

local function has_property(p1, p2)
	local clone2 = p1:Clone()

	clone2:ClearAllChildren()

	return (pcall(function()
		return clone2[p2]
	end))
end

local module: {[any]: any} = {
	Blacktive = false,
	SplashImg = false,
	Blurtive = 0,
	ToggleBlackColor = function(backgroundColor3)
		topBlack.BackgroundColor3 = backgroundColor3
	end
}

function module.ToggleBlack(p4, p5)
	repeat
		task.wait()
	until not module.Blacktive

	module.Blacktive = true

	local v62 = p5 or 0.1

	if p4 == 1 then
		topBlack.Visible = true
		animation.Animate(topBlack, { BackgroundTransparency = 0 }, v62, "Out", "Quad")
	elseif p4 == -1 then
		animation.Animate(topBlack, { BackgroundTransparency = 1 }, v62, "In", "Quad")
		topBlack.Visible = false
	end

	module.Blacktive = false
end
function module.ToggleBlackPartyWaiter(p6)
	topBlack.PartyWait.Visible = p6
end

local blur = game.Lighting.Blur

function module.ToggleBlur(p7, p8)
	repeat
		task.wait()
	until module.Blurtive == 0

	module.Blurtive = module.Blurtive + 1

	local v66 = p8 or 0.125

	if p7 == 1 then
		animation.AnimateAsync(blur, { Size = 24 }, v66, "Out", "Quad").Completed:Connect(function()
			module.Blurtive = module.Blurtive - 1
		end)
	elseif p7 == -1 then
		animation.AnimateAsync(blur, { Size = 0 }, v66, "In", "Quad").Completed:Connect(function()
			module.Blurtive = module.Blurtive - 1
		end)
	end
end
local function ToggleSplashImage(image)
	topSplash.Image = image
end
function module.ToggleSplash(p10, p11)
	repeat
		task.wait()
	until not module.SplashImg

	module.SplashImg = true

	local v70 = p11 or 0.1

	if p10 == 1 then
		topSplash.Visible = true
		splashImage.Visible = true
		animation.AnimateAsync(topSplash, { BackgroundTransparency = 0 }, v70, "Out", "Quad")
		animation.AnimateAsync(splashImage, { ImageTransparency = 0 }, v70, "Out", "Quad")
		task.wait(1)
		animation.AnimateAsync(topSplash, { BackgroundTransparency = 1 }, v70, "In", "Quad")
		animation.AnimateAsync(splashImage, { ImageTransparency = 1 }, v70, "Out", "Quad")
	elseif p10 == -1 then
		topSplash.Visible = false
		splashImage.Visible = false
	end

	module.SplashImg = false
end
function module.ApplyBattleBackColor(imageColor3)
	color3 = imageColor3

	for _, v in pairs(t1) do
		v.ImageColor3 = imageColor3
	end
end
function customscalings.FillBattleBack()
	visGuiBattleBack.ImageHolder:ClearAllChildren()

	for i = 0, math.ceil(visGui.AbsoluteSize.X / 750) do
		for j = 0, math.ceil((visGui.AbsoluteSize.Y + 60) / 750) do
			local clone3 = clone:Clone()

			clone3.Parent = visGuiBattleBack.ImageHolder
			clone3.Visible = true
			clone3.Position = UDim2.new(i, 0, j, 0)
			clone3.ZIndex = -1
			t1[#t1 + 1] = clone3
		end
	end

	local imageColor3 = color3

	color3 = imageColor3

	for _, v in pairs(t1) do
		v.ImageColor3 = imageColor3
	end
end

customscalings.FillBattleBack()

local function TweenBattleBackTransparency(p13, p14, p15, _)
	for _, v in pairs(t1) do
		animation.AnimateAsync(v, { ImageTransparency = p13 }, 0.33, p14, p15)
	end

	animation.Animate(visGuiBattleBackBack, { ImageTransparency = p13 }, 0.33, p14, p15)
end
local function ApplyBattleSky()
	if u18 then
		animation.AnimateAsync(game.Lighting.BattleCorrection, { Brightness = 0.15, Contrast = 0.5 }, 1, "Out", "Quart")

		return
	end

	animation.AnimateAsync(game.Lighting.BattleCorrection, { Brightness = 0.9, Contrast = 1 }, 1, "Out", "Quart")
end
function module.ApplyBattleBackColorTween(p17, p18)
	if not p17 then
		p17 = game:GetService("ReplicatedStorage").DefaultColor.Value
	end

	color3 = p17

	if p18 ~= nil then
		u18 = p18
	end

	ApplyBattleSky()

	for _, v in pairs(t1) do
		animation.AnimateAsync(v, { ImageColor3 = p17 }, 1, "Out", "Quint")
	end
end
function module.UpdateBattleBack(_, p20)
	local v92, v93 = math.modf(p20 / 300)
	local v94, v95 = math.modf((p20 + 25) / 300)
	local color32 = Color3.fromHSV(v93, 0.16666666666666666, 0.8333333333333334)

	color3 = color32

	for _, v in pairs(t1) do
		v.ImageColor3 = color32
	end

	visGuiBattleBackBack.ImageColor3 = Color3.fromHSV(v95, 0.16666666666666666, 0.6666666666666666)
end

local tweenService: TweenService = game:GetService("TweenService")
local CurrentCamera2: Camera = workspace.CurrentCamera
local mouse: Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local connection = nil
-- The camera sway creates a fresh 0.2s tween every frame. Keep the latest one so HideBattleBack can cancel it: without that a tween still in
-- flight kept pulling the camera toward the background's camera part AFTER the camera had been restored (wrong angle, sky flash).
local cameraTween = nil

-- FASTER OPEN: p22 ("covered") = the caller has the screen fully black already. The blur-in only exists to hide the camera snap, which the black
-- cover hides anyway, but ToggleBlur(-1) at the end waited for the whole 0.4s blur-in tween to finish first: 0.4s of dead time behind a black
-- screen. With p22 the blur is set to full instantly instead and the blur-out still plays on reveal like before.
function ShowNewBattleBack(p21, p22)
	if u17 then
		return
	end

	u17 = true
	if not p22 then
		module.ToggleBlur(1, 0.4)
	end
	savedCameraCFrame = CurrentCamera2.CFrame

	if p21 then
		u38 = game:GetService("ReplicatedStorage"):WaitForChild("Battleback" .. p21)
	elseif data.CurrentBackgroundName() then
		local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
		local v101 = data.CurrentBackgroundName()

		u38 = replicatedStorage:WaitForChild("Battleback" .. v101)
		p21 = data.CurrentBackgroundName()
	else
		u38 = battleback
	end

	s1 = u38.Name
	u38.Name = "Battleback"
	u38.Parent = workspace
	cameraPart = u38:FindFirstChild("CameraPart")

	if not cameraPart or not cameraPart.CFrame then
		cameraPart = battlebackCameraPart
	end

	local backgroundTriggers = nil

	if u38:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(u38.BackgroundTriggers)
	end

	if backgroundTriggers then
		backgroundTriggers.StartBattleBack()
	end

	if u38:FindFirstChild("DisableBackgroundCorrection") then
		game.Lighting.BattleCorrection.Enabled = false
	else
		game.Lighting.BattleCorrection.Enabled = true
	end

	if u38:FindFirstChild("CustomClockTime") then
		game.Lighting.ClockTime = u38:FindFirstChild("CustomClockTime").Value
	else
		game.Lighting.ClockTime = 0
	end

	if u38:FindFirstChild("DisableBackgroundExposure") then
		game.Lighting.ExposureCompensation = 0.1
	else
		game.Lighting.ExposureCompensation = 3
	end

	game.Lighting.FogStart = game.Lighting.FogEnd
	game.Lighting.Ambient = Color3.new(0.27451, 0.27451, 0.27451)
	game.Lighting.OutdoorAmbient = Color3.new(0.27451, 0.27451, 0.27451)
	game.Lighting.ColorShift_Top = Color3.new(0, 0, 0)
	game.Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)

	if u38:FindFirstChild("ChangeAtmosphereColor") then
		local atmosphere = game.Lighting.Atmosphere
		local color3New = Color3.new
		local n1 = u38:FindFirstChild("ChangeAtmosphereColor").Value.X / 255
		local n2 = u38:FindFirstChild("ChangeAtmosphereColor").Value.Y / 255
		local changeAtmosphereColor = u38:FindFirstChild("ChangeAtmosphereColor")

		atmosphere.Color = color3New(n1, n2, changeAtmosphereColor.Value.Z / 255)
	end

	if u38:FindFirstChild("ChangeAtmosphereHaze") then
		game.Lighting.Atmosphere.Haze = u38:FindFirstChild("ChangeAtmosphereHaze").Value
	end

	if u38:FindFirstChild("SetLightingProfile") then
		local v108 = u38:FindFirstChild("SetLightingProfile").Value
		local v109 = lightingProfiles[v108]

		if not v109 then
			warn("No new lighting profile: " .. v108)

			return
		end

		for k, v in pairs(v109) do
			if string.find(k, "Atmosphere") then
				local parts = string.split(k, "Atmosphere")

				game.Lighting.Atmosphere[parts[2]] = v
			else
				game.Lighting[k] = v
			end
		end
	end

	repeat
		task.wait()
		CurrentCamera2.CameraType = Enum.CameraType.Scriptable
	until CurrentCamera2.CameraType == Enum.CameraType.Scriptable

	sky.Parent = skies

	if p21 and skies:FindFirstChild("BattleSky" .. p21) then
		if Battle then
			Battle.Parent = skies
		end

		Battle = skies["BattleSky" .. p21]
	else
		if Battle then
			Battle.Parent = skies
		end

		Battle = skies.Battle
	end

	Battle.Parent = game.Lighting
	ApplyBattleSky()

	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local CurrentCamera3: Camera = workspace.CurrentCamera

	CurrentCamera2.CFrame = cameraPart.CFrame

	if not u38:FindFirstChild("DisableSway") then
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local cameraPartCFrame = cameraPart.CFrame
			local cFrameAngles = CFrame.Angles
			local v135 = math.rad((mouse.Y - mouse.ViewSizeY / 2) / mouse.ViewSizeY * -4)
			local v136 = math.rad((mouse.X - mouse.ViewSizeX / 2) / mouse.ViewSizeX * -4)
			local cFrame = cFrameAngles(v135, v136, 0)

			cameraTween = tweenService:Create(CurrentCamera2, tweenInfo, { CFrame = cameraPartCFrame * cFrame })

			cameraTween:Play()
		end)
	elseif connection then
		connection:Disconnect()
	end

	if p22 then
		blur.Size = 24
	end

	module.ToggleBlur(-1, 0.4)
end

module.ShowNewBattleBack = ShowNewBattleBack
module.ShowBattleBack = ShowNewBattleBack

function ChangeBattleBackground(p22)
	if s1 == "Battleback" .. p22 then
		return
	end

	u38.Name = s1

	local backgroundTriggers = nil

	if u38:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(u38.BackgroundTriggers)
	end

	if backgroundTriggers then
		backgroundTriggers.ResetBattleBack()
	end

	u38.Parent = game:GetService("ReplicatedStorage")

	if p22 then
		u38 = game:GetService("ReplicatedStorage"):WaitForChild("Battleback" .. p22)
	else
		u38 = battleback
	end

	s1 = u38.Name
	u38.Name = "Battleback"
	u38.Parent = workspace
	cameraPart = u38:FindFirstChild("CameraPart")

	if not cameraPart or not cameraPart.CFrame then
		cameraPart = battlebackCameraPart
	end

	local backgroundTriggers = nil

	if u38:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(u38.BackgroundTriggers)
	end

	if backgroundTriggers then
		backgroundTriggers.StartBattleBack()
	end

	if u38:FindFirstChild("DisableBackgroundCorrection") then
		game.Lighting.BattleCorrection.Enabled = false
	else
		game.Lighting.BattleCorrection.Enabled = true
	end

	if u38:FindFirstChild("CustomClockTime") then
		game.Lighting.ClockTime = u38:FindFirstChild("CustomClockTime").Value
	else
		game.Lighting.ClockTime = 0
	end

	if u38:FindFirstChild("DisableBackgroundExposure") then
		game.Lighting.ExposureCompensation = 0.1
	else
		game.Lighting.ExposureCompensation = 3
	end

	game.Lighting.FogStart = game.Lighting.FogEnd

	if p22 and skies:FindFirstChild("BattleSky" .. p22) then
		if Battle then
			Battle.Parent = skies
		end

		Battle = skies["BattleSky" .. p22]
	else
		if Battle then
			Battle.Parent = skies
		end

		Battle = skies.Battle
	end

	Battle.Parent = game.Lighting

	if connection then
		connection:Disconnect()
	end

	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local CurrentCamera4: Camera = workspace.CurrentCamera

	CurrentCamera2.CFrame = cameraPart.CFrame

	if not u38:FindFirstChild("DisableSway") then
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local cameraPartCFrame = cameraPart.CFrame
			local cFrameAngles = CFrame.Angles
			local v140 = math.rad((mouse.Y - mouse.ViewSizeY / 2) / mouse.ViewSizeY * -4)
			local v141 = math.rad((mouse.X - mouse.ViewSizeX / 2) / mouse.ViewSizeX * -4)
			local cFrame = cFrameAngles(v140, v141, 0)

			cameraTween = tweenService:Create(CurrentCamera2, tweenInfo, { CFrame = cameraPartCFrame * cFrame })

			cameraTween:Play()
		end)
	elseif connection then
		connection:Disconnect()

		return
	end
end

module.ChangeBattleBackground = ChangeBattleBackground

function SetCameraPosition(p23)
	module.ToggleBlur(1, 0.4)
	savedCameraCFrame = CurrentCamera2.CFrame

	repeat
		task.wait()
		CurrentCamera2.CameraType = Enum.CameraType.Scriptable
	until CurrentCamera2.CameraType == Enum.CameraType.Scriptable

	local foundChild: Instance = game:GetService("ReplicatedStorage"):FindFirstChild("BackgroundCameras"):FindFirstChild(p23)

	if not foundChild then
		warn("Not a valid camera position")
	else
		CurrentCamera2.CFrame = foundChild.CFrame
	end

	module.ToggleBlur(-1, 0.4)
end

module.SetCameraPosition = SetCameraPosition

-- FASTER CLOSE: p27 ("covered") = the caller has the screen fully black already. The blur-in/out only hides the camera snap-back (the black cover
-- hides it anyway) and cost two blur waits, and the 0.33s battleback fade-out was a BLOCKING tween on layers that are hidden a moment later:
-- about 0.5s of dead time behind a black screen. With p27 the layers are just set to their final (transparent) state and the blur is left alone.
function module.HideBattleBack(p27)
	if not p27 then
		module.ToggleBlur(1, 0.1)
	end

	if u17 then
		u17 = false
		game.Lighting.BattleCorrection.Enabled = false
		Battle.Parent = skies
		Battle = nil
		sky.Parent = game.Lighting
	end

	for k, v in pairs(t3) do
		if string.find(k, "Atmosphere") then
			local parts = string.split(k, "Atmosphere")

			game.Lighting.Atmosphere[parts[2]] = v
		else
			game.Lighting[k] = v
		end
	end

	CurrentCamera2.CameraType = "Custom"
	CurrentCamera2.CameraSubject = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
	u38.Name = s1

	local backgroundTriggers = u38:FindFirstChild("BackgroundTriggers")

	if backgroundTriggers then
		require(backgroundTriggers).ResetBattleBack()
	end

	u38.Parent = game:GetService("ReplicatedStorage")

	if connection then
		connection:Disconnect()
	end

	if cameraTween then
		cameraTween:Cancel()

		cameraTween = nil
	end

	if p27 then
		for _, v in pairs(t1) do
			v.ImageTransparency = 1
		end

		visGuiBattleBackBack.ImageTransparency = 1
	else
		TweenBattleBackTransparency(1, "In", "Quad")
	end

	if savedCameraCFrame then
		CurrentCamera2.CFrame = savedCameraCFrame
	end

	visGuiBattleBack.Visible = false
	inspection.ClearStack()

	if not p27 then
		module.ToggleBlur(-1, 0.1)
	else
		-- covered: give the default camera script a few frames (about 50ms) to take the camera back from the Scriptable background camera BEFORE
		-- the caller reveals the screen, so the reveal doesn't show the camera mid-snap / the sky from the wrong angle
		for _ = 1, 3 do
			game:GetService("RunService").RenderStepped:Wait()
		end
	end
end
function module.SwitchWorldSky(p24)
	local foundChild = game.Lighting.WorldSkies:FindFirstChild(p24)

	if not foundChild then
		return
	end

	foundChild.Parent = game.Lighting
	sky.Parent = game.Lighting.WorldSkies
	sky = foundChild
end
function module.SwitchCurrentLighting(p25)
	local v129 = lightingProfiles[p25]

	if not v129 then
		warn("No new lighting profile: " .. p25)

		return
	end

	t3 = v129

	for k, v in pairs(t3) do
		if string.find(k, "Atmosphere") then
			local parts = string.split(k, "Atmosphere")

			game.Lighting.Atmosphere[parts[2]] = v
		else
			game.Lighting[k] = v
		end
	end
end
function module.BattleBackVisible()
	return visGuiBattleBack.Visible
end

print("Finished loading " .. script.Name)

return module