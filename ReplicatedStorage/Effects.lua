_G.__NoFaces = _G.__NoFaces or function(container)
	local cards = {}

	for _, child in ipairs(container:GetChildren()) do
		if not child:FindFirstChild("DumbFace") then
			table.insert(cards, child)
		end
	end

	-- FIX: effects that sweep a field (Bobaman1's shots, balls, ...) go from RIGHT to LEFT (they followed creation order before)
	table.sort(cards, function(a, b)
		local ax, bx = 0, 0
		pcall(function()
			ax, bx = a.AbsolutePosition.X, b.AbsolutePosition.X
		end)
		if ax ~= bx then
			return ax > bx
		end
		return (a.LayoutOrder or 0) > (b.LayoutOrder or 0)
	end)

	return cards
end

-- FIX (Bobaman1): sweep animations can also be thrown at ONE fighter (the server sends the target when it deals the damage fighter by fighter,
-- so each fighter takes its damage when its own shot hits). Without a target the whole field is swept right to left.
_G.__SweepTargets = _G.__SweepTargets or function(container, target)
	if typeof(target) == "Instance" and target:IsA("GuiObject") and target.Parent then
		return { target }
	end

	return _G.__NoFaces(container)
end




local module: {[any]: any} = {}

for _, v in ipairs(script:GetChildren()) do
	if v:IsA("ModuleScript") then
		local v4 = require(v)

		for k, iterValue in pairs(v4) do
			if module[k] == nil then
				module[k] = iterValue
			else
				warn("Duplicate effect name:", k, "in", v.Name)
			end
		end
	end
end

local function v7(p1)
	if game:GetService("RunService"):IsStudio() then
		print(p1)
	end
end

local effectsService = require(game.ReplicatedStorage.EffectsService)
local effectsServiceWaitX = effectsService.waitX
local effectsServiceApplyValues = effectsService.ApplyValues
local effectsServiceSetCardZIndex = effectsService.setCardZIndex
local effectsServiceSpritesheet = effectsService.Spritesheet
local effectsServiceFadeChildren = effectsService.FadeChildren
local effectsServiceSpeakText = effectsService.SpeakText
local effectsServiceSpeak = effectsService.Speak
local effectsServiceSpeakOther = effectsService.SpeakOther
local effectsServiceSpeakAlly = effectsService.SpeakAlly
local effectsServiceSpeakEnemyField = effectsService.SpeakEnemyField
local effectsServicePulse = effectsService.Pulse
local effectsServiceVortex = effectsService.Vortex
local effectsServiceFlagSelf = effectsService.FlagSelf
local effectsServiceFlagEffect = effectsService.FlagEffect
local effectsServiceThrow = effectsService.Throw
local effectsServiceBreath = effectsService.Breath
local effectsServiceBreathAttack = effectsService.BreathAttack
local effectsServiceBreathSelf = effectsService.BreathSelf
local effectsServiceBreathEngulf = effectsService.BreathEngulf
local effectsServiceBreathAlly = effectsService.BreathAlly
local effectsServiceBreathEnemy = effectsService.BreathEnemy
local effectsServiceBreathInverse = effectsService.BreathInverse
local effectsServiceBreathReverse = effectsService.BreathReverse
local effectsServiceBreathAllyHand = effectsService.BreathAllyHand
local effectsServiceBreathEnemyHand = effectsService.BreathEnemyHand
local effectsServiceBreathimages = effectsService.breathimages
local effectsServiceEmit = effectsService.Emit
local effectsServiceNew = effectsService.New
local effectsServiceNewCircle = effectsService.NewCircle
local effectsServiceNewerCircle = effectsService.NewerCircle
local effectsServiceNewCard = effectsService.NewCard
local effectsServiceNewText = effectsService.NewText
local effectsServiceNewParticle = effectsService.NewParticle
local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
local effectsServiceTweenProperty = effectsService.TweenProperty
local effectsServicePreloadImages = effectsService.preloadImages
local effectsServicePreloadTech = effectsService.PreloadTech
local effectsServicePreloadClientTech = effectsService.PreloadClientTech
local uDim2New = UDim2.new
local vector2New = Vector2.new

game:GetService("ContentProvider")

local tweenService: TweenService = game:GetService("TweenService")
local runService: RunService = game:GetService("RunService")
local stepped = game:GetService("RunService").Stepped
local mathRandom = math.random

local function GetWeightedRandom(p2)
	return (mathRandom() - 0.5) * p2
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs
local animation = require(game.ReplicatedStorage.Animation)

require(game.ReplicatedStorage.CopyTable)
require(game.ReplicatedStorage.FoilEffect)

local function CenterPos(p3)
	local uDim2 = UDim2.new(0, p3.AbsolutePosition.X, 0, p3.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p3.AbsoluteSize.X * 0.5, 0, p3.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function UDim2toVector2(p4)
	return Vector2.new(p4.AbsolutePosition.X + p4.AbsoluteSize.X / 2, p4.AbsolutePosition.Y + p4.AbsoluteSize.Y / 2)
end

UDim2toVector2 = function(p5)
	return vector2New(p5.Position.X.Offset, p5.Position.Y.Offset)
end

local function getVector3(p6, p7)
	if p7 then
		local vector3 = Vector3.new(p6.AbsolutePosition.X + p7.X.Offset + p6.AbsoluteSize.X / 2, p6.AbsolutePosition.Y + p7.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p6.AbsolutePosition.X + p6.AbsoluteSize.X / 2, p6.AbsolutePosition.Y, 0)

	return vector3
end
local function Angle(p8, p9)
	return (math.atan2(p9.Y - p8.Y, p9.X - p8.X))
end
local function randomPosOnTarget(p10)
	local y = p10.AbsolutePosition.Y
	local n1 = p10.AbsolutePosition.Y + p10.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p10.AbsolutePosition.X, p10.AbsolutePosition.X + p10.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
local function NewTweenProperty(p11, p12, p13, p14, p15, p16, p17)
	local v125 = Enum.EasingStyle[p16]
	local v126 = Enum.EasingDirection[p17 or "Out"]

	if not p11 or not p12 or not p11:IsA("Instance") then
		warn("Invalid object or property.")

		return
	end

	local tweenInfo = TweenInfo.new(p15, v125, v126)

	v126 = tweenService:Create(p11, tweenInfo, { [p12] = p14 })
	p11[p12] = p13
	v126:Play()
	v126.Completed:Wait()
	v126:Destroy()
end

NewTweenProperty = function(p18, p19, p20, p21)
	if not p18 or not p18.Parent then
		return nil
	end

	local ok, result = pcall(function()
		local tweenInfo = TweenInfo.new(p21, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

		return tweenService:Create(p18, tweenInfo, { Size = p19, Position = p20 })
	end)

	if ok and result then
		result:Play()

		return result
	end

	return nil
end

local function returnField(p22)
	if p22 == "" then
		return "", "Enemy"
	end

	if p22 == "Enemy" then
		return "Enemy", ""
	end
end
function FindColor(p23, p24)
	if p24 == "Red" then
		return p23.Red
	end

	if p24 == "Green" then
		return p23.Green
	end

	if p24 == "Blue" then
		return p23.Blue
	end

	if p24 == "Yellow" then
		return p23.Yellow
	end

	return p23.Yellow
end
function module.Generic(p25, p26, p27, text, _)
	if not p26 then
		return
	end

	if not p27 then
		return
	end

	local n1 = vector2New(p26.Position.X.Offset, p26.Position.Y.Offset) + p26.AbsoluteSize / 2
	local uDim2 = UDim2.new(0, n1.x, 0, n1.y)
	local n2 = vector2New(p27.Position.X.Offset, p27.Position.Y.Offset) + p27.AbsoluteSize / 2
	local uDim23 = UDim2.new(0, n2.x, 0, n2.y)
	local textLabel: TextLabel = Instance.new("TextLabel", p25)

	textLabel.Text = text
	textLabel.Position = uDim2
	textLabel.TextTransparency = 1
	textLabel:TweenPosition(uDim23, "In", "Quad", 0.264, true)
	wait(0.528)
	effectsService.Shake(p27, p27.Position, 0.26666666666666666, 0.1)
	textLabel:Destroy()
end
function module.EffectTriggered(_, p31, _, _, p34)
	if not p31 then
		return
	end

	local n1 = vector2New(p31.Position.X.Offset, p31.Position.Y.Offset) + p31.AbsoluteSize / 2
	local v153 = uDim2New(0.2, 0, 0.2, 0)
	local v154 = uDim2New(0.6, 0, 0.6, 0)
	local v155 = effectsServiceNewCircle(p31, {
		ZIndex = 10000,
		ImageTransparency = 0.5,
		Position = v153,
		Size = v154
	})
	local absoluteSize = p31.AbsoluteSize
	local n2 = math.max(absoluteSize.X, absoluteSize.Y) * 1.1
	local v158 = uDim2New(0, n2, 0, n2)
	local v159 = uDim2New(0.5, -n2 * 0.5, 0.5, -n2 * 0.5)

	v155:TweenSizeAndPosition(v158, v159, "Out", "Quad", 0.4, true)
	wait(0.2 / p34)
	spawn(function()
		wait(0.12 / p34)
		effectsService.TweenProperty(v155, "ImageTransparency", 0.5, 1, 0.08000000000000002)
		v155:Destroy()
	end)
end
function module.briecreategui(name, image, p37, p38, p39, rotation, _, backgroundColor3, p43, p44, zIndex, p46, thickness, aspectRatio)
	local tutorialIndicators = game.Players.LocalPlayer.PlayerGui:FindFirstChild("VisGui"):FindFirstChild("TutorialIndicators")
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.Name = name
	imageLabel.Parent = tutorialIndicators
	imageLabel.Image = image
	imageLabel.ZIndex = zIndex

	if image == "Border" then
		imageLabel.ImageTransparency = 1
	else
		imageLabel.ImageTransparency = 0
	end

	imageLabel.Size = p37
	imageLabel.Rotation = rotation
	imageLabel.Position = p38
	imageLabel.BackgroundTransparency = 1
	imageLabel.BackgroundColor3 = backgroundColor3
	animation.AnimateAsync(imageLabel, { BackgroundTransparency = p43, Position = p39 }, p44, "Out", "Quad")

	if aspectRatio then
		local brieRatio: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		brieRatio.Parent = imageLabel
		brieRatio.Name = "BrieRatio"
		brieRatio.AspectRatio = aspectRatio
	end

	if image == "Border" then
		local brieBorder: UIStroke = Instance.new("UIStroke")

		brieBorder.Parent = imageLabel
		brieBorder.Name = "BrieBorder"
		brieBorder.ApplyStrokeMode = 1
		brieBorder.Color = p46
		brieBorder.Thickness = thickness
	end
end
function module.briedestroygui(p49, p50)
	task.spawn(function()
		local foundChild = game.Players.LocalPlayer.PlayerGui:FindFirstChild("VisGui"):FindFirstChild("TutorialIndicators"):FindFirstChild(p49)

		if p50 > 0 then
			animation.AnimateAsync(foundChild, { ImageTransparency = 1, BackgroundTransparency = 1 }, p50, "Out", "Quad")
			task.wait(p50)
		end

		foundChild:Destroy()
	end)
end
function module.briealtergui(p51, p52, p53, p54, p55, p56, p57, p58)
	local foundChild = game.Players.LocalPlayer.PlayerGui:FindFirstChild("VisGui"):FindFirstChild("TutorialIndicators"):FindFirstChild(p51)

	animation.Animate(foundChild, {
		Position = p52,
		Size = p53,
		Rotation = p54,
		Transparency = p55,
		BackgroundColor3 = p56,
		BackgroundTransparency = p57
	}, p58, "InOut", "Quad")
end
local function GetRandomPointInCircle(p59, p60, p61)
	local random = Random.new()
	local n1 = math.random() * 2 * 3.141592653589793
	local v194 = random:NextNumber(p61 or 0, 1)
	local squareRoot = math.sqrt(v194)
	local n2 = p59 * squareRoot
	local offset = p60.X.Offset
	local cosine = math.cos(n1)
	local v199 = p60.Y.Offset
	local sine = math.sin(n1)

	return UDim2.fromOffset(offset + n2 * cosine, v199 + n2 * sine)
end
local function GetRandomPointInCircleInRange(p62, p63, p64)
	local v204 = UDim2.fromOffset(p62.AbsoluteSize.X / 2, p62.AbsoluteSize.Y / 2)

	return (GetRandomPointInCircle(p63, v204, p64))
end
function module.CircleTest(_, _, p67, _)
	animation.AnimateAsync(p67, { Rotation = 1080 }, 10, "Out", "Linear")

	for _ = 1, 50 do
		if not p67.Parent then
			break
		end

		local v210 = UDim2.fromOffset(p67.AbsoluteSize.X * 0.5, p67.AbsoluteSize.X * 0.5)
		local v211 = UDim2.fromOffset(p67.AbsoluteSize.X / 2, p67.AbsoluteSize.Y / 2)
		local v212 = GetRandomPointInCircle(p67.AbsoluteSize.X, v211, 0.5)
		local n1 = p67.ZIndex + 1
		local randomNumber = math.random(-20, 20)
		local v215 = effectsServiceNewerCircle(p67, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://10270776441",
			Size = v210,
			Position = v212,
			ZIndex = n1,
			Rotation = randomNumber
		})

		task.delay(2, function()
			if v215 and v215.Parent then
				v215:Destroy()
			end
		end)
		task.wait(0.1)
	end
end
local function CreateRing(p69, p70, p71, p72)
	for i = 1, 3 do
		task.spawn(function()
			local v3365 = p72

			if typeof(p72) == "table" then
				v3365 = p72[i]
			end

			local v3366 = p71

			if typeof(p71) == "table" then
				v3366 = p71[i]
			end

			local v3367 = UDim2.fromOffset(p70.AbsoluteSize.Y, p70.AbsoluteSize.Y)
			local v3368 = p70
			local uDim2 = UDim2.new(0, v3368.AbsolutePosition.X, 0, v3368.AbsolutePosition.Y)
			local uDim24 = UDim2.new(0, v3368.AbsoluteSize.X * 0.5, 0, v3368.AbsoluteSize.Y * 0.5)
			local v3371 = effectsServiceNewerCircle(p69, {
				ImageTransparency = 1,
				BackgroundTransparency = 1,
				Size = v3367,
				Position = uDim2 + uDim24
			})

			animation.AnimateAsync(v3371, { Rotation = 980 - i * 100 }, 1, "Out", "Quad")

			local u3372: boolean = false

			task.spawn(function()
				task.wait(0.5)
				u3372 = true
			end)

			while not u3372 do
				local v3373 = UDim2.fromOffset(p70.AbsoluteSize.X * 0.4, p70.AbsoluteSize.X * 0.4)
				local v3374 = UDim2.fromOffset(v3371.AbsoluteSize.X / 2, v3371.AbsoluteSize.Y / 2)
				local v3375 = GetRandomPointInCircle(p70.AbsoluteSize.X, v3374, 0.7 - i * 0.1)
				local v3376 = effectsServiceNewerCircle(v3371, {
					BackgroundTransparency = 1,
					Size = v3373,
					Position = v3375,
					Image = v3366,
					ImageColor3 = v3365,
					ZIndex = p70.ZIndex + 10000 - i
				})

				task.spawn(function()
					task.wait(0.5)
					animation.Animate(v3376, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
					v3376:Destroy()
				end)
				task.wait(0.01)
			end

			task.wait(0.6)
			v3371:Destroy()
		end)
		task.wait(0.1)
	end
end
local function DropOffHelper(_, p74, _, p76)
	local t7 = p76 or {}
	local v226 = p74.Position
	local v227 = t7.SlideDistance or 40
	local v228 = t7.DropDistance or 25
	local v229 = t7.BounceDistance or -8
	local v230 = t7.SlideTime or 0.35
	local v231 = t7.DropTime or 0.12
	local v232 = t7.BounceTime or 0.08
	local v233 = t7.SettleTime or 0.08
	local t8 = t7.WobbleSequence or { 6, -4, 2, 0 }
	local t9 = t7.WobbleTimes or { 0.06, 0.06, 0.05, 0.05 }
	local slideSound = t7.SlideSound
	local impactSound = t7.ImpactSound

	p74.Position = t7.EntryOffset or UDim2.new(1.3, -p74.AbsoluteSize.X, 0.5, -p74.AbsoluteSize.Y / 2)
	p74.Rotation = 0

	local v238 = slideSound and audioServicePlaySound(slideSound)

	if v238 then
		v238:Play()
	end

	local animationAnimate = animation.Animate
	local v240 = UDim2.fromOffset(v227, 0)

	animationAnimate(p74, { Position = v226 + v240 }, v230, "Out", "Back")
	task.delay(v230, function()
		local animationAnimate = animation.Animate
		local v3378 = UDim2.fromOffset(v227, v228)

		animationAnimate(p74, { Position = v226 + v3378 }, v231, "In", "Quad")

		if impactSound then
			if type(impactSound) == "table" then
				local randomNumber = math.random(1, #impactSound)

				audioServicePlaySound(impactSound[randomNumber])
			else
				audioServicePlaySound(impactSound)
			end
		end

		task.delay(v231, function()
			local animationAnimate = animation.Animate
			local v4138 = UDim2.fromOffset(v227 / 4, v229)

			animationAnimate(p74, { Position = v226 + v4138 }, v232, "Out", "Quad")
			task.delay(v232, function()
				animation.Animate(p74, { Position = v226 }, v233, "Out", "Quad")

				local function doWobble(p77)
					if p77 > #t8 then
						return
					end

					animation.Animate(p74, { Rotation = t8[p77] }, t9[p77], "Out", "Quad")
					task.delay(t9[p77], function()
						doWobble(p77 + 1)
					end)
				end

				doWobble(1)
			end)
		end)
	end)
end
function module.BigCard(p78, p79, _, _)
	local n1 = p79.ZIndex + 10500
	local color3 = Color3.fromRGB(255, 255, 255)
	local image = p79.Image
	local v248 = uDim2New(0, p79.AbsoluteSize.X * 2, 0, p79.AbsoluteSize.Y * 2)
	local uDim2 = UDim2.new(0, p79.AbsolutePosition.X, 0, p79.AbsolutePosition.Y)
	local uDim25 = UDim2.new(0, p79.AbsoluteSize.X * 0.5, 0, p79.AbsoluteSize.Y * 0.5)
	local v251 = effectsServiceNewerCircle(p78, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = n1,
		ImageColor3 = color3,
		Image = image,
		Size = v248,
		Position = uDim2 + uDim25
	})

	task.spawn(function()
		local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
		local t108: {[any]: any} = { Color3.fromRGB(179, 167, 138), Color3.fromRGB(218, 215, 204) }
		local v3382 = UDim2.fromOffset(p79.AbsoluteSize.X * 0.6, p79.AbsoluteSize.X * 0.6)

		effectsServiceBreath(p78, p79, p79, {
			Strength = 500,
			ZIndex = -99999,
			Time = 0.2,
			Projectile = effectsServiceBreathimagesSmoke,
			Color = t108,
			Size = v3382
		})
	end)
	task.spawn(function()
		task.wait(0.2)
		audioServicePlaySound("HammerImpact")
		effectsService.ShakeSync(p79, p79.Position, 0.15, 0.05)
	end)
	v251:Destroy()
end
function module.SmallCard(p82, p83, p84)
	local uDim2 = UDim2.new(0.5, -p83.AbsoluteSize.X / 2, 0.5, -p83.AbsoluteSize.Y - 5)

	DropOffHelper(p82, p83, p84, {
		SlideDistance = 0,
		DropDistance = 14,
		BounceDistance = 0,
		SlideTime = 0,
		DropTime = 0.1,
		BounceTime = 0,
		SettleTime = 0.05,
		SlideSound = "clothpat1",
		EntryOffset = uDim2,
		WobbleSequence = { 4, -4, 0 },
		WobbleTimes = { 0.03, 0.03, 0.05 },
		ImpactSound = { "button.wav", "Rubber band sling shot.wav", "swoosh.wav" }
	})
end
function module.SummonPanic(p85, p86, p87)
	local uDim2 = UDim2.new(0.5, -p86.AbsoluteSize.X / 2, 0.5, -p86.AbsoluteSize.Y - 5)

	DropOffHelper(p85, p86, p87, {
		SlideDistance = 0,
		DropDistance = 15,
		BounceDistance = 0,
		SlideTime = 0,
		DropTime = 0.12,
		BounceTime = 0,
		SettleTime = 0.05,
		SlideSound = "crowdpanic",
		ImpactSound = "button.wav",
		EntryOffset = uDim2,
		WobbleSequence = {
			10,
			-8,
			6,
			-4,
			2,
			-1,
			0
		},
		WobbleTimes = {
			0.06,
			0.06,
			0.05,
			0.05,
			0.04,
			0.03,
			0.03
		}
	})
end
function module.BlipParticle(p88, _, parent, p91)
	local t10 = p91 or {}
	local v265 = t10.Image or "rbxassetid://13677494989"
	local v266 = t10.ImageColor3 or Color3.fromRGB(255, 57, 57)
	local v267 = t10.Size or UDim2.fromScale(0.95, 0.95)
	local v268 = t10.Position or UDim2.fromScale(0.5, 0.5)
	local v269 = t10.ZIndexOffset or 10001
	local v270 = t10.ImageRectSize or Vector2.new(341.3, 341.3)
	local v271 = t10.FrameCount or 9
	local v272 = t10.FrameDelay or 0.068
	local v273 = effectsServiceNewerCircle(p88, {
		BackgroundTransparency = 1,
		Image = v265,
		ZIndex = parent.ZIndex + v269,
		Size = v267,
		Position = v268,
		ImageColor3 = v266,
		ImageTransparency = t10.ImageTransparency or 0,
		Rotation = t10.Rotation or 0,
		ImageRectSize = v270
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v273
	v273.Parent = parent
	task.spawn(function()
		for i = 1, v271 do
			local vector2New = Vector2.new
			local n1 = (i + 2) % 3 * v270.X
			local floored = math.floor((i - 1) / 3)

			v273.ImageRectOffset = vector2New(n1, floored * v270.Y)
			task.wait(v272)
		end

		v273:Destroy()
	end)
end
function module.CardTargeted(p92, _, p94, _, _)
	effectsServicePreloadTech(p92, { "rbxassetid://13677494989", "rbxassetid://475727835" })
	task.spawn(function()
		module.BlipParticle(p92, p94, p94)
	end)

	local n1 = p94.ZIndex + 10000
	local uDim2 = UDim2.new(0, p94.AbsoluteSize.X / 1.5, 0, p94.AbsoluteSize.X / 1.5)
	local uDim26 = UDim2.new(0, p94.AbsolutePosition.X + p94.AbsoluteSize.X / 2, 0, p94.AbsolutePosition.Y + p94.AbsoluteSize.Y / 2)
	local v283 = effectsServiceNewerCircle(p92, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://475727835",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim26
	})

	v283.ImageTransparency = 0
	task.wait(0.32000000000000006)
	task.spawn(function()
		effectsService.TweenProperty(v283, "ImageTransparency", 0, 1, 0.26666666666666666)
		v283:Destroy()
	end)
	task.wait(0.13333333333333333)
end
function Healthy(parent, p98)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://12072054746"
	imageLabel.Size = uDim2New()
	imageLabel.Parent = parent
	effectsServiceApplyValues(imageLabel, p98)

	return imageLabel
end
function module.Heal(_, _, p101, _, p103)
	local u292 = p103 or 1

	spawn(function()
		for i = 1, 6 do
			spawn(function()
				local randomNumber = math.random()
				local randomNumber2 = math.random()
				local n1 = 0.5 - (mathRandom() - 0.5) * 0.4
				local n2 = 0.4 + math.random() * 0.2
				local roundedUp = math.ceil((0.33 + randomNumber2 * 0.25) * 0.8 / 0.018 / u292)
				local n3 = 0.6 + math.random() * 0.4
				local v4145 = uDim2New(n1, 0, n3, 0)
				local n4 = p101.ZIndex + 10001
				local color3 = Color3.fromRGB(75, 255, 75)
				local v4148 = uDim2New(n2, 0, n2, 0)
				local v4149 = Healthy(p101, {
					Name = "Plus",
					ImageTransparency = 1,
					SizeConstraint = "RelativeXX",
					ZIndex = n4,
					ImageColor3 = color3,
					Size = v4148,
					Position = v4145
				})

				uDim2New()

				for i2 = 1, roundedUp do
					v4149.ImageTransparency = 1 - math.sin(i2 / roundedUp * 3.1415)

					local n5 = n2 * (1 - v4149.ImageTransparency) + n2 / 2 * (1 - i2 / roundedUp)

					v4149.Size = uDim2New(n5, 0, n5, 0)

					local timestamp = tick()
					local cosine = math.cos(randomNumber * 3.14 + timestamp * 1.5)

					v4149.Position = uDim2New(n1 - n2 / 2 + cosine * 0.1, 0, n3 - i2 / roundedUp, 0)
					stepped:wait()
				end

				v4149:Destroy()
				audioServicePlaySound("Heal", {
					Volume = 0.08,
					Pitch = i / 8 * 5 + 0.4,
					PlaybackSpeed = 1 * ((u292 - 1) / 5 + 1)
				})
			end)

			local randomNumber = math.random()

			wait(randomNumber * 0.8 * 0.1 / u292)
		end
	end)
end

local t2: {[any]: any} = {
	claws = { "rbxgameasset://Images/claw" },
	lightings = {
		"rbxgameasset://Images/lighting_a",
		"rbxgameasset://Images/lighting_b",
		"rbxgameasset://Images/lighting_c",
		"rbxgameasset://Images/lighting_d"
	},
	gradient = { "rbxassetid://245854775" }
}

function module.Damage(_, _, p106, _, p108)
	local u298 = p108 or 1

	audioService.PlaySound("Hurt", { PlaybackSpeed = 1 * ((u298 - 1) / 5 + 1) })
	spawn(function()
		spawn(function()
			for i = 1, 4 do
				spawn(function()
					local n1: number = 0.8 - (i - 1) / 2 * 0.4
					local v4427 = uDim2New(n1 - 0.05, 0, 0.1, 0)
					local n2 = p106.ZIndex + 10001
					local color3 = Color3.fromRGB(250, 82, 16)
					local v4430 = uDim2New(0.1, 0, 0.5, 0)
					local v4431 = t2.gradient[1]
					local color32 = Color3.fromRGB(163, 35, 26)
					local v4433 = effectsServiceNewCircle(p106, {
						Name = "Line",
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ImageTransparency = 1,
						SizeConstraint = "RelativeXX",
						ZIndex = n2,
						BackgroundColor3 = color3,
						Size = v4430,
						Position = v4427,
						Image = v4431,
						ImageColor3 = color32
					})
					local v4434 = uDim2New(0.1, 0, 0.2, 0)
					local v4435 = uDim2New(n1 - 0.05, 0, 0.8, 0)
					local n3 = 0.4 / u298

					if v4433 and v4433.Parent then
						local ok, result = pcall(function()
							local tweenInfo = TweenInfo.new(n3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

							return tweenService:Create(v4433, tweenInfo, { Size = v4434, Position = v4435 })
						end)

						if ok and result then
							result:Play()
						end
					end

					for i2 = 0, 32 do
						if not v4433.Parent then
							break
						end

						v4433.BackgroundTransparency = 1 - math.sin(i2 / 32 * 3.1415)
						v4433.ImageTransparency = v4433.BackgroundTransparency * 0.5
						stepped:Wait()
					end

					if v4433.Parent then
						v4433:Destroy()
					end
				end)
			end
		end)
		wait(0.26666666666666666 / u298)
	end)
end
function module.Strengthen(_, _, p111, _, p113)
	local u304 = p113 or 1

	audioService.PlaySound("Power Up", { PlaybackSpeed = 1 * ((u304 - 1) / 5 + 1) })
	spawn(function()
		for _ = 1, 2 do
			spawn(function()
				for i = 1, 5 do
					wait(0.1 / u304)
					spawn(function()
						local n1: number = 0.8 - (i - 1) / 2 * 0.3
						local roundedUp = math.ceil(31.11111111111111 / u304)
						local v4442 = uDim2New(n1 - 0.035, 0, 0.8, 0)
						local n2 = p111.ZIndex + 10001
						local color3 = Color3.fromRGB(245, 177, 7)
						local v4445 = uDim2New(0.07, 0, 0.28, 0)
						local v4446 = t2.gradient[1]
						local color33 = Color3.fromRGB(255, 128, 0)
						local v4448 = effectsServiceNewCircle(p111, {
							Name = "Line",
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							ImageTransparency = 1,
							SizeConstraint = "RelativeXX",
							ZIndex = n2,
							BackgroundColor3 = color3,
							Size = v4445,
							Position = v4442,
							Image = v4446,
							ImageColor3 = color33
						})
						local v4449 = uDim2New(0.07, 0, 0.28, 0)
						local v4450 = uDim2New(n1 - 0.035, 0, -0.2, 0)
						local n3 = 0.36000000000000004 / u304

						if v4448 and v4448.Parent then
							local ok, result = pcall(function()
								local tweenInfo = TweenInfo.new(n3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

								return tweenService:Create(v4448, tweenInfo, { Size = v4449, Position = v4450 })
							end)

							if ok and result then
								result:Play()
							end
						end

						for i2 = 0, roundedUp do
							if not v4448.Parent then
								break
							end

							v4448.BackgroundTransparency = 1 - math.sin(i2 / roundedUp * 3.1415)
							v4448.ImageTransparency = v4448.BackgroundTransparency * 0.25
							stepped:Wait()
						end

						if v4448.Parent then
							v4448:Destroy()
						end
					end)
				end
			end)
			wait(0.26666666666666666 / u304)
		end
	end)
	wait(0.128 / u304)
end
function module.Weaken(_, _, p116, _, p118)
	local u310 = p118 or 1

	audioService.PlaySound("Power Down", { PlaybackSpeed = 1 * ((u310 - 1) / 5 + 1) })
	spawn(function()
		for _ = 1, 2 do
			spawn(function()
				for i = 1, 3 do
					wait(0.1 / u310)
					spawn(function()
						local n1: number = 0.8 - (i - 1) / 2 * 0.6
						local roundedUp = math.ceil(31.11111111111111 / u310)
						local v4457 = uDim2New(n1 - 0.03, 0, 0.1, 0)
						local n2 = p116.ZIndex + 10001
						local color3 = Color3.fromRGB(9, 137, 207)
						local v4460 = uDim2New(0.06, 0, 0.21, 0)
						local v4461 = t2.gradient[1]
						local color34 = Color3.fromRGB(0, 255, 255)
						local v4463 = effectsServiceNewCircle(p116, {
							Name = "Line",
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							ImageTransparency = 1,
							SizeConstraint = "RelativeXX",
							ZIndex = n2,
							BackgroundColor3 = color3,
							Size = v4460,
							Position = v4457,
							Image = v4461,
							ImageColor3 = color34
						})
						local v4464 = uDim2New(0.06, 0, 0.24, 0)
						local v4465 = uDim2New(n1 - 0.03, 0, 0.8, 0)
						local n3 = 0.36000000000000004 / u310

						if v4463 and v4463.Parent then
							local ok, result = pcall(function()
								local tweenInfo = TweenInfo.new(n3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

								return tweenService:Create(v4463, tweenInfo, { Size = v4464, Position = v4465 })
							end)

							if ok and result then
								result:Play()
							end
						end

						for i2 = 0, roundedUp do
							if not v4463.Parent then
								break
							end

							v4463.BackgroundTransparency = 1 - math.sin(i2 / roundedUp * 3.1415)
							v4463.ImageTransparency = v4463.BackgroundTransparency * 0.5
							stepped:Wait()
						end

						if v4463.Parent then
							v4463:Destroy()
						end
					end)
				end
			end)
			wait(0.26666666666666666 / u310)
		end
	end)
	wait(0.128 / u310)
end
function module.GenericLifegain(p119, p120, p121, p122)
	local n1 = p122 * -1
	local n2 = 1.2

	if n1 and typeof(n1) == "number" then
		n2 = n1 / 2000 + 1

		if n2 > 3 then
			n2 = 3
		end
	end

	spawn(function()
		local n1 = p121.ZIndex + 20500
		local color3 = Color3.fromRGB(255, 51, 51)
		local v3393 = uDim2New(0, 50, 0, 50)
		local v3394 = p120
		local uDim2 = UDim2.new(0, v3394.AbsolutePosition.X, 0, v3394.AbsolutePosition.Y)
		local uDim27 = UDim2.new(0, v3394.AbsoluteSize.X * 0.5, 0, v3394.AbsoluteSize.Y * 0.5)
		local v3397 = effectsServiceNewerCircle(p119, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://6644618187",
			ZIndex = n1,
			ImageColor3 = color3,
			Size = v3393,
			Position = uDim2 + uDim27
		})

		task.spawn(function()
			local t138: {[any]: any} = { Color3.fromRGB(6, 240, 2), Color3.fromRGB(90, 217, 43) }
			local v4158 = UDim2.fromOffset(v3397.AbsoluteSize.X * n2, v3397.AbsoluteSize.X * n2)

			effectsServiceBreath(p119, v3397, v3397, {
				Projectile = "rbxassetid://12072054746",
				Time = 0.9,
				Color = t138,
				Size = v4158,
				Strength = n2 * 30
			})
		end)

		local animationAnimate = animation.Animate
		local v3399 = p121
		local uDim28 = UDim2.new(0, v3399.AbsolutePosition.X, 0, v3399.AbsolutePosition.Y)
		local uDim29 = UDim2.new(0, v3399.AbsoluteSize.X * 0.5, 0, v3399.AbsoluteSize.Y * 0.5)

		animationAnimate(v3397, { Position = uDim28 + uDim29 }, 1, "InOut", "Exponential")
		v3397:Destroy()

		for i = 1, 6 do
			spawn(function()
				local randomNumber = math.random()
				local randomNumber3 = math.random()
				local n1 = 0.5 - (mathRandom() - 0.5) * 0.4
				local n6 = 0.4 + math.random() * 0.2
				local roundedUp = math.ceil((0.33 + randomNumber3 * 0.25) * 0.8 / 0.018)
				local n3 = 0.6 + math.random() * 0.4
				local v4165 = uDim2New(n1, 0, n3, 0)
				local n4 = p121.ZIndex + 10001
				local color35 = Color3.fromRGB(75, 255, 75)
				local v4168 = uDim2New(n6, 0, n6, 0)
				local v4169 = Healthy(p121, {
					Name = "Plus",
					ImageTransparency = 1,
					SizeConstraint = "RelativeXX",
					ZIndex = n4,
					ImageColor3 = color35,
					Size = v4168,
					Position = v4165
				})

				uDim2New()

				for i2 = 1, roundedUp do
					v4169.ImageTransparency = 1 - math.sin(i2 / roundedUp * 3.1415)

					local n5 = n6 * (1 - v4169.ImageTransparency) + n6 / 2 * (1 - i2 / roundedUp)

					v4169.Size = uDim2New(n5, 0, n5, 0)

					local timestamp = tick()
					local cosine = math.cos(randomNumber * 3.14 + timestamp * 1.5)

					v4169.Position = uDim2New(n1 - n6 / 2 + cosine * 0.1, 0, n3 - i2 / roundedUp, 0)
					stepped:wait()
				end

				v4169:Destroy()

				if n2 >= 1.3 then
					audioServicePlaySound("Heal", { Volume = 0.1, Pitch = i / 8 * 5 + 0.2 })

					return
				end

				audioServicePlaySound("Heal", { Volume = 0.08, Pitch = i / 8 * 5 + 0.4 })
			end)

			local randomNumber = math.random()

			wait(randomNumber * 0.8 * 0.1)
		end
	end)
	task.wait(0.2)
end
function module.Overload(p123, p124, p125, _)
	local x = workspace.CurrentCamera.ViewportSize.X
	local squareRoot = math.sqrt((p125.AbsolutePosition.Y - p124.AbsolutePosition.Y) ^ 2 + (p125.AbsolutePosition.X - p124.AbsolutePosition.X) ^ 2)
	local v323 = UDim2.fromOffset(p124.AbsolutePosition.X, p124.AbsolutePosition.Y)
	local n1: number = if p124.AbsolutePosition.Y >= p125.AbsolutePosition.Y then 1 else -1

	effectsServiceSetCardZIndex(p124, p124.ZIndex + 99999)
	audioServicePlaySound("Sword Swing")

	local animationAnimate = animation.Animate
	local v326 = p125.Size
	local v327 = p125.Position
	local randomNumber = math.random(80, 100)

	animationAnimate(p124, { Size = v326, Position = v327, Rotation = randomNumber * n1 }, squareRoot / (x * 2), "Out", "Linear")

	local color3 = Color3.fromRGB(255, 255, 255)
	local v330 = UDim2.fromOffset(p125.AbsoluteSize.X * 2, p125.AbsoluteSize.X * 2)
	local uDim2 = UDim2.new(0, p125.AbsolutePosition.X, 0, p125.AbsolutePosition.Y)
	local uDim210 = UDim2.new(0, p125.AbsoluteSize.X * 0.5, 0, p125.AbsoluteSize.Y * 0.5)
	local randomNumber4 = math.random(0, 180)
	local v334 = effectsServiceNewerCircle(p123, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://16689218037",
		ImageColor3 = color3,
		Size = v330,
		Position = uDim2 + uDim210,
		Rotation = randomNumber4,
		ZIndex = p124.ZIndex + 1
	})

	task.spawn(function()
		effectsServiceSpritesheet(v334, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
		v334:Destroy()
	end)
	audioServicePlaySound("body_impact")
	effectsService.ShakeSync(p125, p125.Position, 0.2, 0.1)

	local animationAnimateAsync = animation.AnimateAsync
	local v336 = p124.Position
	local v337 = UDim2.fromOffset(0, p124.AbsoluteSize.Y / 2 * n1)

	animationAnimateAsync(p124, { Position = v336 - v337, Rotation = p124.Rotation + 180 }, 0.6, "Out", "Quart")
	task.wait(0.1)
	effectsServiceSetCardZIndex(p124, p124.ZIndex - 99999)
	task.spawn(function()
		task.wait(2)

		if p124 then
			animation.AnimateAsync(p124, { Rotation = 0, Position = v323 }, 0.1, "Out", "Quart")
		end
	end)
end
function module.SuperOverload(p127, p128, p129, _)
	local x = workspace.CurrentCamera.ViewportSize.X
	local squareRoot = math.sqrt((p129.AbsolutePosition.Y - p128.AbsolutePosition.Y) ^ 2 + (p129.AbsolutePosition.X - p128.AbsolutePosition.X) ^ 2)
	local n1: number = if p128.AbsolutePosition.Y >= p129.AbsolutePosition.Y then 1 else -1
	local vector3 = Vector3.new(p128.AbsolutePosition.X + p128.AbsoluteSize.X / 2, p128.AbsolutePosition.Y, 0)
	local vector32 = Vector3.new(p129.AbsolutePosition.X + p129.AbsoluteSize.X / 2, p129.AbsolutePosition.Y, 0)

	effectsServiceSetCardZIndex(p128, p128.ZIndex + 99999)
	audioServicePlaySound("DBZ Heavy Kick")

	local animationAnimate = animation.Animate
	local v348 = p129.Size
	local v349 = UDim2.fromOffset(-p128.AbsoluteSize.X / 2, p128.AbsoluteSize.Y / 2)
	local v350 = p129.Position
	local v351 = math.atan2(vector32.Y - vector3.Y, vector32.X - vector3.X)
	local v352 = math.deg(v351)

	animationAnimate(p128, { Size = v348 + v349, Position = v350, Rotation = v352 + 90 }, squareRoot / (x * 4), "In", "Quad")

	local color3 = Color3.fromRGB(255, 255, 255)
	local v354 = UDim2.fromOffset(p129.AbsoluteSize.X * 1.5, p129.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p129.AbsolutePosition.X, 0, p129.AbsolutePosition.Y)
	local uDim211 = UDim2.new(0, p129.AbsoluteSize.X * 0.5, 0, p129.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(0, 180)
	local v358 = effectsServiceNewerCircle(p127, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://16689218037",
		ImageColor3 = color3,
		Size = v354,
		Position = uDim2 + uDim211,
		Rotation = randomNumber,
		ZIndex = p128.ZIndex + 1
	})

	task.spawn(function()
		effectsServiceSpritesheet(v358, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
		v358:Destroy()
	end)
	audioServicePlaySound("bigexplosion")
	audioServicePlaySound("body_impact")
	effectsService.ShakeBattle(p127, 0.2, 0.05)
	effectsService.ShakeSync(p129, p129.Position, 0.2, 0.1)
	p128.Size = p129.Size

	local animationAnimateAsync = animation.AnimateAsync

	v352 = p129.Position
	v351 = UDim2.fromOffset(0, p128.AbsoluteSize.Y * n1)
	animationAnimateAsync(p128, { Position = v352 - v351, Rotation = p128.Rotation + 180 }, 0.6, "Out", "Quart")
	task.wait(0.3)
	effectsServiceSetCardZIndex(p128, p128.ZIndex - 99999)
end
function module.GenericBurn(p131, p132, p133, p134)
	local n1 = 1.2

	if p134 and typeof(p134) == "number" then
		n1 = p134 / 2000 + 1

		if n1 > 3 then
			n1 = 3
		end
	end

	task.spawn(function()
		local n2 = p133.ZIndex + 20500
		local color3 = Color3.fromRGB(255, 51, 51)
		local v3406 = uDim2New(0, 50, 0, 50)
		local v3407 = p132
		local uDim2 = UDim2.new(0, v3407.AbsolutePosition.X, 0, v3407.AbsolutePosition.Y)
		local uDim212 = UDim2.new(0, v3407.AbsoluteSize.X * 0.5, 0, v3407.AbsoluteSize.Y * 0.5)
		local v3410 = effectsServiceNewerCircle(p131, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://6644618187",
			ZIndex = n2,
			ImageColor3 = color3,
			Size = v3406,
			Position = uDim2 + uDim212
		})

		task.spawn(function()
			local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
			local t139: {[any]: any} = { Color3.fromRGB(240, 99, 43), Color3.fromRGB(217, 66, 39) }
			local v4176 = UDim2.fromOffset(v3410.AbsoluteSize.X * n1, v3410.AbsoluteSize.X * n1)

			effectsServiceBreath(p131, v3410, v3410, {
				Time = 0.9,
				Projectile = effectsServiceBreathimagesFire,
				Color = t139,
				Size = v4176,
				Strength = n1 * 80
			})
		end)

		local animationAnimate = animation.Animate
		local v3412 = p133
		local uDim213 = UDim2.new(0, v3412.AbsolutePosition.X, 0, v3412.AbsolutePosition.Y)
		local uDim214 = UDim2.new(0, v3412.AbsoluteSize.X * 0.5, 0, v3412.AbsoluteSize.Y * 0.5)

		animationAnimate(v3410, { Position = uDim213 + uDim214 }, 1, "InOut", "Exponential")
		v3410:Destroy()

		if n1 >= 1.3 then
			audioServicePlaySound("FireBreath")
		else
			audioServicePlaySound("immolate")
		end

		for _ = 1, 3 do
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(100, 150)
			local v3418 = color3FromRGB(255, randomNumber, 53)
			local uDim215 = UDim2.new(0, p133.AbsoluteSize.X * 1.7, 0, p133.AbsoluteSize.X * 1.7)
			local v3420 = effectsServiceNewerCircle(p131, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://11517935503",
				ZIndex = 1000001,
				ImageColor3 = v3418,
				Size = uDim215,
				Position = p133 and UDim2.new(0, p133.AbsolutePosition.X, 0, p133.AbsolutePosition.Y) + UDim2.new(0, p133.AbsoluteSize.X * 0.5, 0, p133.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
				Rotation = math.random(0, 180)
			})

			task.spawn(function()
				effectsServiceSpritesheet(v3420, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
				v3420:Destroy()
			end)
			task.wait(0.04)
		end
	end)
	task.spawn(function()
		task.wait(1.1)
		effectsService.ShakeInOut(p133, p133.Position, 0.4, n1 / 100000)
	end)
end
function module.Seance(p135, _, _, p138)
	local v369 = p135.Parent.BattleNew["Virtual" .. p138 .. "Graveyard"]
	local color3 = Color3.fromRGB(0, 13, 255)
	local v371 = uDim2New(0, 0, 0, 0)
	local v372 = effectsServiceNewerCircle(p135, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v371,
		Position = v369 and UDim2.new(0, v369.AbsolutePosition.X, 0, v369.AbsolutePosition.Y) + UDim2.new(0, v369.AbsoluteSize.X * 0.5, 0, v369.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color36 = Color3.fromRGB(255, 213, 0)

	v371 = uDim2New(0, 0, 0, 0)

	local v374 = effectsServiceNewerCircle(p135, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000000,
		ImageColor3 = color36,
		Size = v371,
		Position = v369 and UDim2.new(0, v369.AbsolutePosition.X, 0, v369.AbsolutePosition.Y) + UDim2.new(0, v369.AbsoluteSize.X * 0.5, 0, v369.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})

	audioServicePlaySound("seance")

	local animationAnimateAsync = animation.AnimateAsync
	local v376 = UDim2.fromOffset(v369.AbsoluteSize.Y * 1.9, v369.AbsoluteSize.Y * 1.9)

	animationAnimateAsync(v374, { ImageTransparency = 1, Size = v376 }, 0.5, "Out", "Quint")
	task.wait(0.1)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v3422 = UDim2.fromOffset(v369.AbsoluteSize.Y * 2, v369.AbsoluteSize.Y * 2)

		animationAnimate(v372, { ImageTransparency = 1, Size = v3422 }, 0.7, "Out", "Quint")
		v372:Destroy()
		v374:Destroy()
	end)
	task.wait(0.4)
end
function module.SeanceAsync(p139, _, _, p142)
	local s1

	if p142 == "" then
		s1 = ""
	elseif p142 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local v383 = p139.Parent.BattleNew["Virtual" .. s1 .. "Graveyard"]

	task.spawn(function()
		local color3 = Color3.fromRGB(0, 13, 255)
		local v3424 = uDim2New(0, 0, 0, 0)
		local v3425 = effectsServiceNewerCircle(p139, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000001,
			ImageColor3 = color3,
			Size = v3424,
			Position = v383 and UDim2.new(0, v383.AbsolutePosition.X, 0, v383.AbsolutePosition.Y) + UDim2.new(0, v383.AbsoluteSize.X * 0.5, 0, v383.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color37 = Color3.fromRGB(255, 213, 0)
		local v3427 = uDim2New(0, 0, 0, 0)
		local v3428 = effectsServiceNewerCircle(p139, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000000,
			ImageColor3 = color37,
			Size = v3427,
			Position = v383 and UDim2.new(0, v383.AbsolutePosition.X, 0, v383.AbsolutePosition.Y) + UDim2.new(0, v383.AbsoluteSize.X * 0.5, 0, v383.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})

		audioServicePlaySound("seance")

		local animationAnimateAsync = animation.AnimateAsync
		local v3430 = UDim2.fromOffset(v383.AbsoluteSize.Y * 1.9, v383.AbsoluteSize.Y * 1.9)

		animationAnimateAsync(v3428, { ImageTransparency = 1, Size = v3430 }, 0.5, "Out", "Quint")
		task.wait(0.1)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local v4178 = UDim2.fromOffset(v383.AbsoluteSize.Y * 2, v383.AbsoluteSize.Y * 2)

			animationAnimate(v3425, { ImageTransparency = 1, Size = v4178 }, 0.7, "Out", "Quint")
			v3425:Destroy()
			v3428:Destroy()
		end)
		task.wait(0.4)
	end)
end
function module.SeanceAsyncOpponent(p143, _, _, p146)
	local s1

	if p146 == "" then
		s1 = "Enemy"
	elseif p146 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v390 = p143.Parent.BattleNew["Virtual" .. s1 .. "Graveyard"]

	task.spawn(function()
		local color3 = Color3.fromRGB(0, 13, 255)
		local v3432 = uDim2New(0, 0, 0, 0)
		local v3433 = effectsServiceNewerCircle(p143, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000001,
			ImageColor3 = color3,
			Size = v3432,
			Position = v390 and UDim2.new(0, v390.AbsolutePosition.X, 0, v390.AbsolutePosition.Y) + UDim2.new(0, v390.AbsoluteSize.X * 0.5, 0, v390.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color38 = Color3.fromRGB(255, 213, 0)
		local v3435 = uDim2New(0, 0, 0, 0)
		local v3436 = effectsServiceNewerCircle(p143, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000000,
			ImageColor3 = color38,
			Size = v3435,
			Position = v390 and UDim2.new(0, v390.AbsolutePosition.X, 0, v390.AbsolutePosition.Y) + UDim2.new(0, v390.AbsoluteSize.X * 0.5, 0, v390.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})

		audioServicePlaySound("seance")

		local animationAnimateAsync = animation.AnimateAsync
		local v3438 = UDim2.fromOffset(v390.AbsoluteSize.Y * 1.9, v390.AbsoluteSize.Y * 1.9)

		animationAnimateAsync(v3436, { ImageTransparency = 1, Size = v3438 }, 0.5, "Out", "Quint")
		task.wait(0.1)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local v4180 = UDim2.fromOffset(v390.AbsoluteSize.Y * 2, v390.AbsoluteSize.Y * 2)

			animationAnimate(v3433, { ImageTransparency = 1, Size = v4180 }, 0.7, "Out", "Quint")
			v3433:Destroy()
			v3436:Destroy()
		end)
		task.wait(0.4)
	end)
end
function module.Liberate(p147, p148, _, _)
	task.wait(0.1)

	local v395 = UDim2.fromOffset(p148.AbsoluteSize.X * 1.4, p148.AbsoluteSize.X * 1.4)
	local uDim2 = UDim2.new(0, p148.AbsolutePosition.X, 0, p148.AbsolutePosition.Y)
	local uDim216 = UDim2.new(0, p148.AbsoluteSize.X * 0.5, 0, p148.AbsoluteSize.Y * 0.5)
	local v398 = effectsServiceNewerCircle(p147, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12670911812",
		Rotation = 90,
		Size = v395,
		Position = uDim2 + uDim216,
		ZIndex = p148.ZIndex + 10000
	})

	animation.AnimateAsync(v398, { ImageTransparency = 0 }, 0.3, "Out", "Quint")
	audioServicePlaySound("flag")

	if math.random(1, 2) == 1 then
		audioServicePlaySound("crowd1")
	else
		audioServicePlaySound("crowd2")
	end

	audioServicePlaySound("Swoosh")

	local animationAnimate = animation.Animate
	local v400 = v398.Position
	local v401 = UDim2.fromOffset(0, p148.AbsoluteSize.X * 0.9)

	animationAnimate(v398, { Rotation = 0, Position = v400 - v401 }, 0.4, "Out", "Quart")
	task.spawn(function()
		animation.Animate(v398, { ImageTransparency = 1, Rotation = -10 }, 1, "In", "Quart")
		v398:Destroy()
	end)
end
function module.Nurture(p151, _, p153, _)
	task.spawn(function()
		local color3 = Color3.fromRGB(0, 0, 0)
		local color39 = Color3.fromRGB(255, 255, 255)
		local n1 = p153.ZIndex + 100000
		local v3442 = uDim2New(0, p153.AbsoluteSize.X * 1.2, 0, p153.AbsoluteSize.X * 1.2)
		local v3443 = p153
		local uDim2 = UDim2.new(0, v3443.AbsolutePosition.X, 0, v3443.AbsolutePosition.Y)
		local uDim217 = UDim2.new(0, v3443.AbsoluteSize.X * 0.5, 0, v3443.AbsoluteSize.Y * 0.5)

		v3443 = UDim2.fromOffset(0, p153.AbsoluteSize.Y / 1.7)

		local v3446 = effectsServiceNewerCircle(p151, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://13883717405",
			BackgroundColor3 = color3,
			ImageColor3 = color39,
			ZIndex = n1,
			Size = v3442,
			Position = uDim2 + uDim217 - v3443,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local color310 = Color3.fromRGB(255, 69, 103)
		local v3448 = UDim2.fromOffset(p153.AbsoluteSize.X * 0.4, p153.AbsoluteSize.X * 0.4)

		effectsServiceBreath(p151, p153, p153, {
			Projectile = "rbxassetid://241778280",
			Strength = 10,
			Speed = 0.6,
			EasingStyle = "Quad",
			Time = 0.6,
			Rotation = 0,
			Color = color310,
			Size = v3448,
			Range = p153
		})
		animation.AnimateAsync(v3446, { ImageTransparency = 0 }, 0.3, "Out", "Quart")

		for _ = 1, 2 do
			for j = 1, 9 do
				local vector2New = Vector2.new
				local floored = math.floor((j - 1) / 3)

				v3446.ImageRectOffset = vector2New((j + 2) % 3 * 341.3, floored * 341.3)

				if j == 4 then
					audioServicePlaySound("toon beep")
					task.wait(0.03)
				end

				task.wait(0.03)
			end
		end

		animation.Animate(v3446, { ImageTransparency = 1 }, 0.3, "Out", "Quart")
		v3446:Destroy()
	end)
end
function module.NurtureAsync(p155, _, p157, _)
	task.spawn(function()
		local color3 = Color3.fromRGB(0, 0, 0)
		local color311 = Color3.fromRGB(255, 255, 255)
		local n1 = p157.ZIndex + 100000
		local v3456 = uDim2New(0, p157.AbsoluteSize.X * 1.2, 0, p157.AbsoluteSize.X * 1.2)
		local v3457 = p157
		local uDim2 = UDim2.new(0, v3457.AbsolutePosition.X, 0, v3457.AbsolutePosition.Y)
		local uDim218 = UDim2.new(0, v3457.AbsoluteSize.X * 0.5, 0, v3457.AbsoluteSize.Y * 0.5)

		v3457 = UDim2.fromOffset(0, p157.AbsoluteSize.Y / 1.7)

		local v3460 = effectsServiceNewerCircle(p155, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://13883717405",
			BackgroundColor3 = color3,
			ImageColor3 = color311,
			ZIndex = n1,
			Size = v3456,
			Position = uDim2 + uDim218 - v3457,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local color312 = Color3.fromRGB(255, 69, 103)
		local v3462 = UDim2.fromOffset(p157.AbsoluteSize.X * 0.4, p157.AbsoluteSize.X * 0.4)

		effectsServiceBreath(p155, p157, p157, {
			Projectile = "rbxassetid://241778280",
			Strength = 10,
			Speed = 0.6,
			EasingStyle = "Quad",
			Time = 0.6,
			Rotation = 0,
			Color = color312,
			Size = v3462,
			Range = p157
		})
		animation.AnimateAsync(v3460, { ImageTransparency = 0 }, 0.3, "Out", "Quart")

		for _ = 1, 2 do
			for j = 1, 9 do
				local vector2New = Vector2.new
				local floored = math.floor((j - 1) / 3)

				v3460.ImageRectOffset = vector2New((j + 2) % 3 * 341.3, floored * 341.3)

				if j == 4 then
					task.wait(0.03)
				end

				task.wait(0.03)
			end
		end

		animation.Animate(v3460, { ImageTransparency = 1 }, 0.3, "Out", "Quart")
		v3460:Destroy()
	end)
end
function module.Charge(_, p160)
	effectsServicePreloadClientTech({ "rbxassetid://530309078" })
	task.spawn(function()
		local t109: {[any]: any} = { x = 566, y = 128 }
		local parent = effectsService.New("Frame")({
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 10000,
			Parent = p160,
			Size = UDim2.new(1, 0, 1, 0)
		})
		local v3469 = effectsService.New("ImageLabel")
		local v3470 = uDim2New(-1, 0, 0.25, 0)
		local v3471 = uDim2New(0.9, 0, 0.20353356890459365, 0)
		local v3472 = v3469({
			Name = "Charge",
			Image = "rbxassetid://530309078",
			BackgroundTransparency = 1,
			ZIndex = 10000,
			Position = v3470,
			Size = v3471,
			Parent = parent
		})
		local v3473 = uDim2New(0.05, 0, 0.25, 0)

		v3472:TweenPosition(v3473, "Out", "Linear", 0.2, true)
		task.wait(0.4)

		for _ = 1, 9 do
			v3472.Visible = not v3472.Visible
			task.wait(0.025)
		end

		parent:Destroy()
	end)
	task.wait(0.4)
end
function module.Fatigue(p161, p162, p163, p164)
	if p164 >= 1000 then
		module.FireBreathLarge(p161, p162, p163)

		return
	end

	if p164 >= 400 then
		module.FireBreath(p161, p162, p163)

		return
	end

	module.FireBreathSmall(p161, p162, p163)
end
function module.Foil(p165, p166, _)
	wait(0.1)

	for _ = 1, 4 do
		local color3 = Color3.fromRGB(0, 0, 0)
		local n1 = p166.ZIndex + 10000
		local v422 = uDim2New(0, p166.AbsoluteSize.X / 2, 0, p166.AbsoluteSize.X / 2)
		local v423 = uDim2New(0, p166.AbsolutePosition.X + p166.AbsoluteSize.X / 2, 0, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y / 2)
		local v424 = effectsServiceNewerCircle(p165, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://5661901654",
			ImageTransparency = 0,
			BackgroundColor3 = color3,
			ZIndex = n1,
			Size = v422,
			Position = v423
		})

		spawn(function()
			local uDim2New = UDim2.new
			local x = p166.AbsolutePosition.X
			local v3477 = p166.AbsoluteSize.X
			local randomNumber = math.random(10, 40)
			local y = p166.AbsolutePosition.Y
			local v3480 = p166.AbsoluteSize.X
			local randomNumber5 = math.random(10, 40)
			local uDim2 = uDim2New(0, x + v3477 / (randomNumber * 0.1), 0, y + v3480 / (randomNumber5 * 0.1))

			v424:TweenPosition(uDim2, "Out", "Quint", 2.2)

			local effectsServiceTweenProperty = effectsService.TweenProperty
			local randomNumber6 = math.random(-180, 180)

			effectsServiceTweenProperty(v424, "Rotation", 0, randomNumber6, 2)
		end)
		spawn(function()
			effectsService.TweenProperty(v424, "ImageTransparency", 0, 1, 2)
			wait(2)
			v424:Destroy()
		end)

		local randomNumber = math.random(1, 3)

		audioService.PlaySound("Foil" .. randomNumber)
	end
end
function module.Freeze(p168, p169, p170, p171)
	local zIndex = p170.ZIndex
	local v431 = uDim2New(1, 0, 1, 0)
	local v432 = uDim2New(0.5, 0, 0.5, 0)
	local v433 = effectsServiceNewerCircle(p170, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://6662592019",
		Visible = true,
		ZIndex = zIndex,
		Size = v431,
		Position = v432
	})

	audioService.PlaySound("Freeze")
	task.spawn(function()
		local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
		local imageColor3 = p170.ImageColor3
		local color3 = Color3.fromRGB(115, 255, 216)

		effectsServiceNewTweenProperty(p170, "ImageColor3", imageColor3, color3, 0.5, "Quad")
	end)
	task.spawn(function()
		effectsService.NewTweenProperty(v433, "ImageTransparency", 1, 0.5, 0.5, "Quad")
	end)
	task.spawn(function()
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3 = Color3.fromRGB(167, 255, 245)
		local color313 = Color3.fromRGB(125, 199, 255)
		local color314 = Color3.fromRGB(161, 199, 240)
		local color315 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathEngulf(p168, p169, p170, p171, 50, effectsServiceBreathimagesIce, "IceBreath", 0.5, color3, color313, color314, color315, 1.2, 0.9)
	end)
	task.spawn(function()
		while true do
			if p170:FindFirstChild("LockImage") then
				break
			end

			runService.Heartbeat:Wait()
		end

		while true do
			if not p170:FindFirstChild("LockImage") then
				break
			end

			runService.Heartbeat:Wait()
		end

		local v3493 = p171
		local s1

		if v3493 == "" then
			s1 = "Enemy"
		elseif v3493 == "Enemy" then
			s1 = ""
		else
			s1 = nil
		end

		for _, _ in pairs(_G.__NoFaces(p168.Parent.BattleNew[s1 .. "Field"])) do
			task.spawn(function()
				audioService.PlaySound("Unfreeze")

				local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
				local imageColor3 = p170.ImageColor3
				local color3 = Color3.fromRGB(255, 255, 255)

				effectsServiceNewTweenProperty(p170, "ImageColor3", imageColor3, color3, 0.5, "Quad")
				effectsService.NewTweenProperty(v433, "ImageTransparency", 0.5, 1, 0.5, "Quad")
				task.wait(0.5)
				v433:Destroy()
			end)
		end
	end)
end
function module.gaster(_, _, p174, _)
	if not p174 then return end
	local v438 = p174.Size

	if p174 and p174.Parent then
		p174:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
	end

	spawn(function()
		if p174 and p174.Parent then
			effectsService.NewTweenProperty(p174, "Rotation", 0, 720, 0.5, "Quad")
		end
	end)
	audioService.PlaySound("Gaster Fade")
	spawn(function()
		wait(2)

		if not p174 or not p174.Parent then
			return
		end

		audioService.PlaySound("FastSplat")

		if p174 and p174.Parent then
			p174:TweenSize(v438, "In", "Quad", 0.5, true)
		end

		spawn(function()
			if p174 and p174.Parent then
				effectsService.NewTweenProperty(p174, "Rotation", 720, 0, 0.5, "Quad")
			end
		end)
	end)
end
function module.FieldSwipe(p176, p177, _, p179)
	local s1

	if p179 == "" then
		s1 = "Enemy"
	elseif p179 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v445 = p176.Parent.BattleNew["Virtual" .. s1 .. "Field"]

	spawn(function()
		local n1 = p177.ZIndex + 10000
		local v3499 = uDim2New(0, v445.AbsoluteSize.X, 0, v445.AbsoluteSize.Y / 4)
		local randomNumber = math.random(-10, 10)
		local v3501 = v445
		local uDim2 = UDim2.new(0, v3501.AbsolutePosition.X, 0, v3501.AbsolutePosition.Y)
		local uDim219 = UDim2.new(0, v3501.AbsoluteSize.X * 0.5, 0, v3501.AbsoluteSize.Y * 0.5)
		local color3 = Color3.fromRGB(111, 255, 111)
		local v3505 = effectsServiceNewerCircle(p176, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://6662213548",
			Visible = true,
			ZIndex = n1,
			Size = v3499,
			Rotation = randomNumber,
			Position = uDim2 + uDim219,
			ImageColor3 = color3
		})

		audioService.PlaySound("MidSlash")
		spawn(function()
			effectsService.Shake(v3505, v3505.Position, 0.2, 0.2)
		end)
		effectsServiceWaitX(1)
		effectsService.NewTweenProperty(v3505, "ImageTransparency", 0, 1, 0.7, "Quint")
		effectsServiceWaitX(0.7)
		v3505:Destroy()
	end)
	effectsServiceWaitX(0.3)
end
function module.Train(p180, p181, p182, _)
	audioServicePlaySound("SpecialFighter")

	local color3 = Color3.fromRGB(255, 255, 255)
	local v451 = UDim2.fromOffset(p182.AbsoluteSize.X * 1.7, p182.AbsoluteSize.X * 1.7)
	local uDim2 = UDim2.new(0, p182.AbsolutePosition.X, 0, p182.AbsolutePosition.Y)
	local uDim220 = UDim2.new(0, p182.AbsoluteSize.X * 0.5, 0, p182.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(0, 180)
	local v455 = effectsServiceNewerCircle(p180, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://16785158666",
		ImageColor3 = color3,
		Size = v451,
		Position = uDim2 + uDim220,
		Rotation = randomNumber,
		ZIndex = p181.ZIndex + 1
	})

	effectsService.ShakeSync(p182, p182.Position, 0.2, 0.05)
	task.spawn(function()
		effectsServiceSpritesheet(v455, Vector2.new(128, 128), { 8, 8 }, 4, 22, 48)
		v455:Destroy()
	end)
end
function module.ROBLOXianReborn(p184, p185, p186, _)
	task.spawn(function()
		audioServicePlaySound("AcolyteSound soft")
		task.wait(0.8)
		audioServicePlaySound("heaven release")
	end)
	task.spawn(function()
		effectsService.ShakeBattleSync(p184, 0.8, 0.01)
	end)
	task.spawn(function()
		if not p186 or not p186.Parent then
			return
		end

		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local t110: {[any]: any} = { p186 }

		for _, v in ipairs(p186:GetDescendants()) do
			table.insert(t110, v)
		end

		local t111: {[any]: any} = {}

		for _, v in ipairs(t110) do
			local t112: {[any]: any} = {}

			if v:IsA("GuiObject") then
				t112.BackgroundTransparency = v.BackgroundTransparency
			end

			if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
				t112.TextTransparency = v.TextTransparency
				t112.TextStrokeTransparency = v.TextStrokeTransparency
			elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
				t112.ImageTransparency = v.ImageTransparency
			end

			if v:IsA("UIStroke") then
				t112.Transparency = v.Transparency
			end

			if next(t112) then
				t111[v] = t112
			end
		end

		for k, v in pairs(t111) do
			if k.Parent then
				local t113: {[any]: any} = {}

				for iterKey in pairs(v) do
					t113[iterKey] = 1
				end

				tweenService:Create(k, tweenInfo, t113):Play()
			end
		end

		task.wait(0.5)
		task.wait(2)

		local tweenInfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

		for k, v in pairs(t111) do
			if k.Parent then
				tweenService:Create(k, tweenInfo2, v):Play()
			end
		end
	end)

	local t11: {[any]: any} = {
		"rbxassetid://106557889830097",
		"rbxassetid://126119052564766",
		"rbxassetid://130765226877193",
		"rbxassetid://70548491035931",
		"rbxassetid://110446933915726",
		"rbxassetid://71383767047959"
	}

	effectsServicePreloadTech(p184, t11)

	if not p186 or not p186.Parent then
		return
	end

	local n1 = p186.AbsoluteSize.X * 1.75

	local function getTargetCenter()
		return UDim2.new(p186.Position.X.Scale, p186.Position.X.Offset + p186.Size.X.Offset / 2, p186.Position.Y.Scale, p186.Position.Y.Offset + p186.Size.Y.Offset / 2)
	end

	local color3 = Color3.fromRGB(255, 255, 255)
	local v464 = t11[1]
	local v465 = UDim2.fromOffset(n1, n1)
	local uDim2 = UDim2.new(p186.Position.X.Scale, p186.Position.X.Offset + p186.Size.X.Offset / 2, p186.Position.Y.Scale, p186.Position.Y.Offset + p186.Size.Y.Offset / 2)
	local v467 = effectsServiceNewerCircle(p184, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 0,
		ImageColor3 = color3,
		Image = v464,
		Size = v465,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = uDim2,
		ZIndex = p185.ZIndex + 1
	})
	local connection = nil

	connection = runService.RenderStepped:Connect(function()
		if not v467.Parent or not p186.Parent then
			connection:Disconnect()

			return
		end

		v467.Position = UDim2.new(p186.Position.X.Scale, p186.Position.X.Offset + p186.Size.X.Offset / 2, p186.Position.Y.Scale, p186.Position.Y.Offset + p186.Size.Y.Offset / 2)
		v467.Rotation = 0
	end)

	local vector2 = Vector2.new(341.3333333333333, 341.3333333333333)
	local vector22 = Vector2.new(vector2.X - 4, vector2.Y - 4)

	task.spawn(function()
		local v3521, v3522 = xpcall(function()
			for _, v in ipairs(t11) do
				if not v467.Parent or not p186.Parent then
					break
				end

				v467.Image = v
				v467.ImageRectSize = vector22
				v467.ImageRectOffset = Vector2.zero
				effectsServiceSpritesheet(v467, vector22, { 3, 3 }, 1, 9, 36, vector2)
			end
		end, debug.traceback)

		if connection then
			connection:Disconnect()
			connection = nil
		end

		if v467 and v467.Parent then
			v467:Destroy()
		end

		if not v3521 then
			warn("ROBLOXianReborn spritesheet error:", v3522)
		end
	end)
	task.wait(1.15)
end
local function v71(parent, p189)
	local playerCard = parent.Parent.BattleNew[p189 .. "PlayerSlot"]:FindFirstChild("PlayerCard")

	if not playerCard then
		return
	end

	local text = playerCard.Title.Text
	local foundChild = parent:FindFirstChild(text .. "Level")

	if not foundChild then
		foundChild = Instance.new("IntValue")
		foundChild.Name = text .. "Level"
		foundChild.Value = 1
		foundChild.Parent = parent
	end

	foundChild.Value = foundChild.Value + 1

	return text, foundChild.Value
end
local function v72(p190, _, _, p193)
	local v480, v481 = v71(p190, p193)

	if not v480 then
		return
	end

	local color3 = Color3.fromRGB(0, 0, 0)
	local v483 = UDim2.fromScale(1, 0.03)
	local v484 = UDim2.fromScale(0.5, 0)
	local color316 = Color3.fromRGB(255, 255, 255)
	local v486 = effectsServiceNewText(p190, {
		BackgroundTransparency = 0,
		ZIndex = 99999999,
		BackgroundColor3 = color3,
		Size = v483,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = v484,
		TextColor3 = color316,
		Text = v480 .. " has leveled up to Level " .. v481
	})

	audioServicePlaySound("victory.wav")
	task.delay(3, function()
		v486:Destroy()
	end)
end
function module.LevelUpBalls(p194, p195, p196, p197)
	local color3 = Color3.fromRGB(116, 218, 255)
	local color317 = Color3.fromRGB(225, 134, 255)
	local t12: {[any]: any} = { color3, color317, Color3.fromRGB(255, 225, 133) }

	v72(p194, p195, p196, p197)

	local v494 = UDim2.fromOffset(p196.AbsoluteSize.Y * 1.2, p196.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p196.AbsolutePosition.X, 0, p196.AbsolutePosition.Y)
	local uDim221 = UDim2.new(0, p196.AbsoluteSize.X * 0.5, 0, p196.AbsoluteSize.Y * 0.5)
	local v497 = effectsServiceNewerCircle(p194, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v494,
		Position = uDim2 + uDim221
	})

	for _ = 1, 15 do
		local randomNumber = math.random(1, #t12)
		local v500 = t12[randomNumber]
		local v501 = UDim2.fromOffset(p196.AbsoluteSize.X * 0.5, p196.AbsoluteSize.X * 0.5)
		local v502 = UDim2.fromScale(0.5, 0.5)
		local randomNumber7 = math.random(0, 180)
		local v504 = effectsServiceNewerCircle(v497, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.3,
			Image = "rbxassetid://511406127",
			ImageColor3 = v500,
			Size = v501,
			Position = v502,
			Rotation = randomNumber7,
			ZIndex = p196.ZIndex + 999999
		})
		local animationAnimateAsync = animation.AnimateAsync
		local v506 = UDim2.fromOffset(p196.AbsoluteSize.X * 0.15, p196.AbsoluteSize.X * 0.15)

		animationAnimateAsync(v504, { Size = v506 }, 1, "Out", "Bounce")
		task.delay(0.3, function()
			audioServicePlaySound("Clatter")
		end)

		local animateAsync = animation.AnimateAsync
		local v508 = UDim2.fromOffset(v497.AbsoluteSize.X / 2, v497.AbsoluteSize.Y / 2)
		local v509 = GetRandomPointInCircle(p196.AbsoluteSize.X, v508, 0.5)

		animateAsync(v504, { Position = v509 }, 0.8, "Out", "Quint")

		local taskWait = task.wait
		local randomNumber8 = math.random(1, 3)

		taskWait(randomNumber8 * 0.01)
	end

	task.delay(2, function()
		v497:Destroy()
	end)
end
function MoonwardEffect(p198, p199, _, _, p202, p203, p204, p205, p206, p207, p208, p209, p210)
	local u525 = p199 or p198

	if p198 and u525 then
		effectsServicePreloadTech(p198, p202)

		local v526 = UDim2.fromOffset(u525.AbsoluteSize.X * 1.1, u525.AbsoluteSize.X * 1.1)
		local v527 = u525
		local uDim2 = UDim2.new(0, v527.AbsolutePosition.X, 0, v527.AbsolutePosition.Y)
		local uDim222 = UDim2.new(0, v527.AbsoluteSize.X * 0.5, 0, v527.AbsoluteSize.Y * 0.5)
		local randomNumber = math.random(0, 360)
		local v531 = effectsServiceNewerCircle(p198, {
			BackgroundTransparency = 1,
			Image = p202,
			ImageTransparency = p208 or 0,
			Size = v526,
			Position = uDim2 + uDim222,
			Rotation = randomNumber,
			ZIndex = u525.ZIndex + 10000
		})
		local t13: {[any]: any} = {
			Time = p206 or 1,
			FlashTime = p207 or 0.2,
			Color = { p203, p204 },
			SizeMultiplier = p210 or 1,
			Transparency = p209 or 0.1,
			Rotation = p205 or 0
		}

		spawn(function()
			effectsServicePulse(p198, v531, t13)
		end)
		animation.AnimateAsync(v531, { ImageTransparency = p208 or 0 }, 0.5, "Out", "Quint")

		local animationAnimateAsync = animation.AnimateAsync
		local v534 = UDim2.fromOffset(u525.AbsoluteSize.X * 1.5, u525.AbsoluteSize.X * 1.5)

		animationAnimateAsync(v531, { Size = v534 }, 0.5, "Out", "Quint")
		animation.AnimateAsync(v531, { Rotation = p205 }, 1, "Out", "Quint")
		spawn(function()
			wait(0.25)

			local animationAnimateAsync = animation.AnimateAsync
			local v3524 = UDim2.fromOffset(u525.AbsoluteSize.X, u525.AbsoluteSize.X)

			animationAnimateAsync(v531, { Size = v3524 }, 0.75, "Out", "Quad")
			wait(0.25)
			animation.Animate(v531, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
			v531:Destroy()
		end)

		return
	end
end
function module.MoonwardRed(p211, p212, p213, p214)
	audioServicePlaySound("spawn05")

	local color3 = Color3.fromRGB(162, 164, 255)
	local color318 = Color3.fromRGB(235, 45, 75)
	local randomNumber = math.random(180, 360)

	MoonwardEffect(p211, p212, p213, p214, "rbxassetid://401214456", color3, color318, randomNumber, 1.25, 0.3, 0.25, 0.25, 1.75)
end
function module.MoonwardBlue(p215, p216, p217, p218)
	audioServicePlaySound("spawn05")

	local color3 = Color3.fromRGB(162, 164, 255)
	local color319 = Color3.fromRGB(39, 91, 211)
	local randomNumber = math.random(180, 360)

	MoonwardEffect(p215, p216, p217, p218, "rbxassetid://401214456", color3, color319, randomNumber, 1.25, 0.3, 0.25, 0.25, 1.75)
end
function module.MoonwardTerrain(p219, p220, p221, p222)
	if math.random(1, 2) == 1 then
		module.MoonwardBlue(p219, p220, p221, p222)

		return
	end

	module.MoonwardRed(p219, p220, p221, p222)
end
function module.Moonward(p223, p224, p225, p226)
	local v557 = p224 or p223

	if math.random(1, 2) == 1 then
		module.MoonwardBlue(p223, v557, p225, p226)

		return
	end

	module.MoonwardRed(p223, v557, p225, p226)
end
function module.EquipGear(p227, _, p229, _)
	task.spawn(function()
		task.wait()

		local color3 = Color3.fromRGB(255, 255, 255)
		local v3526 = UDim2.fromOffset(p229.AbsoluteSize.Y * 1.5, p229.AbsoluteSize.Y * 1.5)
		local v3527 = effectsServiceNewerCircle(p227, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.1,
			Image = "rbxassetid://16746947908",
			ZIndex = 1000001,
			ImageColor3 = color3,
			Size = v3526,
			Position = p229 and UDim2.new(0, p229.AbsolutePosition.X, 0, p229.AbsolutePosition.Y) + UDim2.new(0, p229.AbsoluteSize.X * 0.5, 0, p229.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local animationAnimate = animation.Animate
		local v3529 = UDim2.fromOffset(0, 0)

		animationAnimate(v3527, { ImageTransparency = 0.2, Size = v3529 }, 0.3, "InOut", "Quad")
		v3527.Image = "rbxassetid://511406127"
		audioServicePlaySound("gun equip")

		local animationAnimateAsync = animation.AnimateAsync

		v3529 = UDim2.fromOffset(p229.AbsoluteSize.Y * 1.25, p229.AbsoluteSize.Y * 1.25)
		animationAnimateAsync(v3527, { Size = v3529 }, 0.5, "Out", "Quad")
		task.delay(0.25, function()
			animation.Animate(v3527, { ImageTransparency = 1 }, 0.25, "Out", "Quad")
			v3527:Destroy()
		end)
	end)
end

local u73 = nil
local t3: {[any]: any} = {
	Red = { Color3.new(1, 0, 0), Color3.new(1, 0.3, 0) },
	Blue = { Color3.new(0, 1, 1), Color3.new(0, 0.3, 1) },
	Yellow = { Color3.new(1, 1, 0), Color3.new(1, 0.7, 0) },
	Purple = { Color3.new(1, 0, 1), Color3.new(0.5, 0, 1) },
	Green = { Color3.new(0, 1, 0), Color3.new(0, 0.7, 0.3) }
}

function makeParticle(p231, p232, p233)
	local frame: Frame = Instance.new("Frame", p231)

	frame.BackgroundTransparency = 0.3

	local uDim2New = UDim2.new
	local randomNumber = math.random()

	frame.Position = uDim2New(randomNumber, 0, 1, -u73 * 0.33)

	local v568 = t3[p232]
	local randomNumber9 = math.random(1, #t3[p232])

	frame.BackgroundColor3 = v568[randomNumber9]
	frame.BorderSizePixel = 0
	frame.Size = p233 or UDim2.new(0, u73 * 0.33, 0, u73 * 0.33)

	return frame
end
function makeParticleHolder(p234)
	local frame: Frame = Instance.new("Frame", p234)

	frame.ZIndex = p234.ZIndex + 1
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1

	return frame
end
function module.Fire(_, _, p237, p238)
	u73 = p237.AbsoluteSize.x

	local n1 = 0
	local t14: {[any]: any} = {}
	local v578 = makeParticleHolder(p237)
	local v579 = p237.Position

	repeat
		local v580 = stepped:wait()

		n1 += v580

		if #t14 < n1 * 30 and n1 < 0.4 then
			local v581 = makeParticle(p237, p238 or "Red")
			local randomNumber = math.random()

			table.insert(t14, { v581, randomNumber, tick() })
		end

		for k, v in pairs(t14) do
			local v585 = v[1]
			local rotation = v585.Rotation
			local timestamp = tick()
			local cosine = math.cos(timestamp * 3.141592653589793 * v580)

			v585.Rotation = rotation + cosine
			v585.Transparency = v585.Transparency + v580 * 1.25

			local v589 = v585.Position
			local uDim2New = UDim2.new
			local v591 = v[2]
			local timestamp2 = tick()
			local n2 = math.cos(v591 + timestamp2 + v[3] * 3.141592653589793 * 6) * (u73 / 128)
			local n3 = u73 * v580
			local timestamp3 = tick()
			local v596 = uDim2New(0, n2, 0, n3 + (timestamp3 - v[3] - v[2]))

			v585.Position = v589 - v596
			v589 = v585.Size

			local uDim2 = UDim2.new(0.1 * v580, 0, 0.1 * v580, 0)

			v585.Size = v589 - uDim2

			if v585.Transparency >= 1 then
				v585:Destroy()
				table.remove(t14, k)
			end
		end
	until n1 > 0.8 and #t14 < 1

	v578:Destroy()
end
local function ApplyEffectToEnemies(p239, p240, p241, p242)
	local v602 = module[p239]

	if not v602 then
		warn("Effect not found:", p239)

		return
	end

	for _, v in ipairs(_G.__NoFaces(p240.Parent.BattleNew[(if p242 == "" then "Enemy" else if p242 == "Enemy" then "" else nil) .. "Field"])) do
		task.spawn(v602, p240, p241, v, p242)
	end
end
function module.FreezeEnemy(p243, p244, _, p246)
	ApplyEffectToEnemies("Freeze", p243, p244, p246)
end
function module.Slash(p247, _, p249)
	local v612 = t2.claws[1]
	local n1 = p249.ZIndex + 10001
	local uDim2 = UDim2.new(0, p249.AbsoluteSize.X, 0, p249.AbsoluteSize.X)
	local uDim223 = UDim2.new(0, p249.AbsolutePosition.X - p249.AbsoluteSize.X / 2, 0, p249.AbsolutePosition.Y + p249.AbsoluteSize.X / 1.5)
	local v616 = effectsServiceNewCircle(p247, { Image = v612, ZIndex = n1, Size = uDim2, Position = uDim223 })
	local uDim224 = UDim2.new(0, p249.AbsolutePosition.X - p249.AbsoluteSize.X / 2, 0, p249.AbsolutePosition.Y + p249.AbsoluteSize.X / 3)

	v616:TweenPosition(uDim224, "Out", "Back", 0.16000000000000003, true)
	spawn(function()
		effectsService.Shake(p249, p249.Position, 0.16000000000000003, 0.3)
	end)
	spawn(function()
		wait(0.24)
		effectsService.TweenProperty(v616, "ImageTransparency", 0, 1, 0.32000000000000006)
		v616:Destroy()
	end)
	wait(0.26666666666666666)
end
function module.LaserPreFire(p250, p251, p252, _)
	local color3 = Color3.fromRGB(255, 255, 255)
	local v623 = UDim2.fromOffset(0.1, 0.1)
	local uDim2 = UDim2.new(0, p251.AbsolutePosition.X, 0, p251.AbsolutePosition.Y)
	local uDim225 = UDim2.new(0, p251.AbsoluteSize.X * 0.5, 0, p251.AbsoluteSize.Y * 0.5)
	local v626 = effectsServiceNewerCircle(p250, {
		Image = "rbxassetid://11927574847",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ImageColor3 = color3,
		Size = v623,
		Position = uDim2 + uDim225,
		ZIndex = p252.ZIndex + 10001
	})

	audioService.PlaySound("LargeLaserCharge")
	animation.AnimateAsync(v626, { ImageTransparency = 0 }, 0.4, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local v628 = UDim2.fromOffset(p251.AbsoluteSize.X * 6, p251.AbsoluteSize.X * 6)

	animationAnimateAsync(v626, { Size = v628 }, 0.8, "InOut", "Quad")
	animation.AnimateAsync(v626, { Rotation = v626.Rotation + 700 }, 5, "InOut", "Quad")
	effectsServiceWaitX(0.7)

	local animationAnimate = animation.Animate

	v628 = UDim2.fromScale(0, 0)
	animationAnimate(v626, { Size = v628 }, 1.5, "In", "Quint")
	v626:Destroy()
end
local function minmax(p254, p255)
	if p254 > p255 then
		return p254, p255
	end

	return p255, p254
end
local function CreateSpell(p256, p257, _, rotation, p260, p261)
	local transparency = p257.Transparency
	local v639 = uDim2New(0, p257.Size.X.Offset / 4, 0, p257.Size.Y.Offset / 4)
	local origin = p257.Origin
	local uDim2 = UDim2.new(0, origin.AbsolutePosition.X, 0, origin.AbsolutePosition.Y)
	local uDim226 = UDim2.new(0, origin.AbsoluteSize.X * 0.5, 0, origin.AbsoluteSize.Y * 0.5)
	local t15: {[any]: any} = {
		BackgroundTransparency = 1,
		Image = p261,
		ImageColor3 = p260,
		ImageTransparency = transparency,
		Size = v639,
		Position = uDim2 + uDim226
	}
	local v644 = p257.ZIndex or p257.Target.ZIndex
	local randomNumber = math.random(1, 4)

	t15.ZIndex = v644 + randomNumber + 10000
	t15.Rotation = rotation

	return (effectsServiceNewerCircle(p256, t15))
end
function module.ReverseFireBreath(p262, _, p264, _)
	effectsServicePreloadTech(p262, { "rbxassetid://243728206" })

	local v650 = UDim2.fromOffset(p264.AbsoluteSize.Y * 1.5, p264.AbsoluteSize.Y * 1.5)
	local uDim2 = UDim2.new(0, p264.AbsolutePosition.X, 0, p264.AbsolutePosition.Y)
	local uDim227 = UDim2.new(0, p264.AbsoluteSize.X * 0.5, 0, p264.AbsoluteSize.Y * 0.5)
	local v653 = effectsServiceNewerCircle(p262, { BackgroundTransparency = 1, Size = v650, Position = uDim2 + uDim227 })
	local t16: {[any]: any} = { Color3.fromRGB(104, 223, 215), Color3.fromRGB(255, 253, 211) }
	local v655 = UDim2.fromOffset(p264.AbsoluteSize.X * 0.4, p264.AbsoluteSize.X * 0.4)
	local t17: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 100,
		Speed = 0.6,
		EasingStyle = "Quad",
		Time = 0.6,
		Color = t16,
		Size = v655,
		Range = v653
	}

	effectsServiceEmit(p262, p264, t17)
	t17.Color = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(221, 240, 235) }
	effectsServiceEmit(p262, p264, t17)
	v653:Destroy()
end
function module.PulseGreen(p266, _, p268, _)
	local color3 = Color3.fromRGB(89, 134, 89)

	effectsServicePulse(p266, p268, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(80, 120, 73) },
		Transparency = 0.1
	})
end
function module.SelfPulseGreen(p270, p271, _, _)
	local color3 = Color3.fromRGB(89, 134, 89)

	effectsServicePulse(p270, p271, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(80, 120, 73) },
		Transparency = 0.1
	})
end
function module.PulseBlue(p274, _, p276, _)
	local color3 = Color3.fromRGB(0, 115, 255)

	effectsServicePulse(p274, p276, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(0, 49, 211) },
		Transparency = 0.1
	})
end
function module.SelfPulseBlue(p278, p279, _, _)
	local color3 = Color3.fromRGB(0, 115, 255)

	effectsServicePulse(p278, p279, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(0, 49, 211) },
		Transparency = 0.1
	})
end
function module.PulseYellow(p282, _, p284, _)
	local color3 = Color3.fromRGB(253, 255, 124)

	effectsServicePulse(p282, p284, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(208, 211, 24) },
		Transparency = 0.1
	})
end
function module.SelfPulseYellow(p286, p287, _, _)
	local color3 = Color3.fromRGB(253, 255, 124)

	effectsServicePulse(p286, p287, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(208, 211, 24) },
		Transparency = 0.1
	})
end
function module.PulseRed(p290, _, p292, _)
	local color3 = Color3.fromRGB(181, 0, 0)

	effectsServicePulse(p290, p292, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(255, 0, 0) },
		Transparency = 0.1
	})
end
function module.SelfPulseRed(p294, p295, _, _)
	local color3 = Color3.fromRGB(181, 0, 0)

	effectsServicePulse(p294, p295, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(255, 0, 0) },
		Transparency = 0.1
	})
end
function module.Oink(p298, p299, p300, p301)
	local t18: {[any]: any} = { "Pig Grunt", "Pig Grunt" }
	local t19: {[any]: any} = { "🐗", "🐷" }
	local color3 = Color3.fromRGB(107, 112, 124)
	local color320 = Color3.fromRGB(0, 0, 0)
	local color3FromRGB = Color3.fromRGB
	local randomNumber = math.random(1, #t19)
	local v707 = t19[randomNumber]
	local fredokaOne = Enum.Font.FredokaOne
	local t20: {[any]: any} = { color3, color320, color3FromRGB(253, 255, 253) }
	local randomNumber10 = math.random(1, #t20)
	local v711 = t20[randomNumber10]
	local randomNumber11 = math.random(-10, 10)
	local n1 = p299.ZIndex + 10000

	spawn(function()
		local randomNumber12 = math.random(1, #t18)

		audioServicePlaySound(t18[randomNumber12])
		wait(0.2)
	end)
	effectsServiceSpeak(p298, p299, p300, p301, {
		Text = v707,
		Font = fredokaOne,
		TextColor3 = v711,
		TextStrokeTransparency = 0,
		Rotation = randomNumber11,
		ZIndex = n1
	})
end
function module.CowBuff(p302, p303, p304, p305)
	local t21: {[any]: any} = { "MOO!", "μ!", "Moo.", "🐮", "🐄" }
	local t22: {[any]: any} = { "Moo", "Moo2" }
	local color3 = Color3.fromRGB(107, 112, 124)
	local color321 = Color3.fromRGB(0, 0, 0)
	local color3FromRGB = Color3.fromRGB
	local randomNumber = math.random(1, #t21)
	local v724 = t21[randomNumber]
	local fredokaOne = Enum.Font.FredokaOne
	local t23: {[any]: any} = { color3, color321, color3FromRGB(253, 255, 253) }
	local randomNumber13 = math.random(1, #t23)
	local v728 = t23[randomNumber13]
	local randomNumber14 = math.random(-10, 10)
	local t24: {[any]: any} = {
		Text = v724,
		Font = fredokaOne,
		TextColor3 = v728,
		TextStrokeTransparency = 0,
		Rotation = randomNumber14,
		ZIndex = p303.ZIndex + 10000
	}

	task.spawn(function()
		effectsServiceSpeak(p302, p303, p304, p305, t24, 0.2)

		local randomNumber15 = math.random(1, #t22)

		audioServicePlaySound(t22[randomNumber15])
	end)
	task.spawn(function()
		effectsService.Shake(p303, p303.Position, 0.1, 0.05)
	end)
	wait(0.15)
end
function module.CowMoo(p306, p307, p308, p309)
	local t25: {[any]: any} = { "Moo", "Moo2" }
	local t26: {[any]: any} = { "MOO!", "μ!", "Moo.", "🐮", "🐄" }
	local color3 = Color3.fromRGB(107, 112, 124)
	local color322 = Color3.fromRGB(0, 0, 0)
	local color3FromRGB = Color3.fromRGB
	local randomNumber = math.random(1, #t26)
	local v741 = t26[randomNumber]
	local fredokaOne = Enum.Font.FredokaOne
	local t27: {[any]: any} = { color3, color322, color3FromRGB(253, 255, 253) }
	local randomNumber16 = math.random(1, #t27)
	local v745 = t27[randomNumber16]
	local randomNumber17 = math.random(-10, 10)
	local n1 = p307.ZIndex + 10000

	spawn(function()
		local randomNumber18 = math.random(1, #t25)

		audioServicePlaySound(t25[randomNumber18])
		wait(0.2)
	end)
	effectsServiceSpeak(p306, p307, p308, p309, {
		Text = v741,
		Font = fredokaOne,
		TextColor3 = v745,
		TextStrokeTransparency = 0,
		Rotation = randomNumber17,
		ZIndex = n1
	})
end
function module.CowGone(p310, p311, p312, p313)
	local t28: {[any]: any} = { "μ", "Moo..", "mooooooooo" }
	local t29: {[any]: any} = { "MooGone" }
	local color3 = Color3.fromRGB(107, 112, 124)
	local color323 = Color3.fromRGB(0, 0, 0)
	local color3FromRGB = Color3.fromRGB
	local randomNumber = math.random(1, #t28)
	local v758 = t28[randomNumber]
	local fredokaOne = Enum.Font.FredokaOne
	local t30: {[any]: any} = { color3, color323, color3FromRGB(253, 255, 253) }
	local randomNumber19 = math.random(1, #t30)
	local v762 = t30[randomNumber19]
	local randomNumber20 = math.random(-10, 10)
	local n1 = p311.ZIndex + 10000

	task.wait(0.15)
	spawn(function()
		local randomNumber21 = math.random(1, #t29)

		audioServicePlaySound(t29[randomNumber21])
	end)
	effectsServiceSpeak(p310, p311, p312, p313, {
		Text = v758,
		Font = fredokaOne,
		TextColor3 = v762,
		TextStrokeTransparency = 0,
		Rotation = randomNumber20,
		ZIndex = n1
	})
end
function module.KorbloxGlowEffect(p314, _, p316, _)
	audioServicePlaySound("Korblox")

	local color3 = Color3.fromRGB(140, 170, 217)

	effectsServicePulse(p314, p316, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(0, 9, 138) },
		Transparency = 0.1,
		ZIndex = p316.ZIndex + 10000
	})
end
function module.KorbloxGlowSelf(p318, p319, _, _)
	audioServicePlaySound("Korblox")

	local color3 = Color3.fromRGB(140, 170, 217)

	effectsServicePulse(p318, p319, {
		Time = 1,
		FlashTime = 0.5,
		Color = { color3, Color3.fromRGB(0, 9, 138) },
		Transparency = 0.1,
		ZIndex = p319.ZIndex + 10000
	})
end
function module.DancePotionAlly(p322, p323, _, p325)
	local t31: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
	local t32: {[any]: any} = { "Applause", "CrowdCheer" }

	effectsServicePreloadTech(p322, { "rbxassetid://14353373241", "rbxassetid://13895587959" })
	audioService.DimSongs()
	audioServicePlaySound("DancePotion")

	local s1

	if p325 == "" then
		s1 = ""
	elseif p325 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	task.spawn(function()
		task.wait(0.25)
		audioServicePlaySound("bass.wav")
		task.wait(0.2)

		local randomNumber = math.random(1, #t31)

		audioServicePlaySound(t31[randomNumber])
		task.wait(1.05)

		local randomNumber22 = math.random(1, #t31)

		audioServicePlaySound(t31[randomNumber22])
		task.wait(0.2)

		local randomNumber23 = math.random(1, #t31)

		audioServicePlaySound(t31[randomNumber23])
		task.wait(0.4)

		local randomNumber24 = math.random(1, #t32)

		audioServicePlaySound(t32[randomNumber24])
	end)
	task.spawn(function()
		local uDim2 = UDim2.new(0, p323.AbsoluteSize.X * 1.6, 0, p323.AbsoluteSize.X * 1.6)
		local v3540 = uDim2New(0.5, 0, 0.5, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v3542 = effectsServiceNewerCircle(p322, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://14353373241",
			ZIndex = 100001,
			ImageTransparency = 0,
			Rotation = 0,
			Size = uDim2,
			Position = v3540,
			ImageColor3 = color3,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local t114: {[any]: any} = { Color3.fromRGB(234, 117, 255), Color3.fromRGB(255, 74, 225) }
		local v3544 = UDim2.fromOffset(v3542.AbsoluteSize.X * 0.6, v3542.AbsoluteSize.X * 0.6)

		effectsServiceEmit(p322, v3542, {
			Projectile = "rbxassetid://13895587959",
			Strength = 80,
			Speed = 0.4,
			EasingStyle = "Quad",
			ImageTransparency = 0,
			Time = 2.6,
			Color = t114,
			Size = v3544,
			Range = v3542
		})

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v3542.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3549 = Vector2.new
			local floored2 = math.floor((i - 1) / 3)

			v3542.ImageRectOffset = v3549((i + 2) % 3 * 341.3, floored2 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3552 = Vector2.new
			local floored3 = math.floor((i - 1) / 3)

			v3542.ImageRectOffset = v3552((i + 2) % 3 * 341.3, floored3 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3555 = Vector2.new
			local floored4 = math.floor((i - 1) / 3)

			v3542.ImageRectOffset = v3555((i + 2) % 3 * 341.3, floored4 * 341.3)
			task.wait(0.068)
		end

		v3542:Destroy()
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p323.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeSync(v, v.Position, 1, 0.002)

				if math.random(1, 2) == 1 then
				end

				animation.AnimateAsync(v, { Rotation = 22 }, 0.3, "Out", "Back")
				task.wait(0.3)
				animation.AnimateAsync(v, { Rotation = -18 }, 0.28, "InOut", "Quint")
				task.wait(0.28)
				animation.AnimateAsync(v, { Rotation = 12 }, 0.16, "Out", "Back")
				task.wait(0.16)
				animation.AnimateAsync(v, { Rotation = -22 }, 0.2, "Out", "Quart")
				task.wait(0.2)
				animation.AnimateAsync(v, { Rotation = 16 }, 0.14, "InOut", "Quint")
				task.wait(0.14)
				animation.AnimateAsync(v, { Rotation = -10 }, 0.12, "Out", "Back")
				task.wait(0.12)
				animation.AnimateAsync(v, { Rotation = 18 }, 0.18, "Out", "Quart")
				task.wait(0.18)
				animation.AnimateAsync(v, { Rotation = 0 }, 0.24, "Out", "Back")
				task.wait(0.24)

				local vSize = v.Size
				local vPosition = v.Position
				local v4188 = UDim2.fromOffset(v.AbsoluteSize.X * 2, v.AbsoluteSize.Y / 2)
				local v4189 = UDim2.fromOffset(v.AbsolutePosition.X - v.AbsoluteSize.X / 1.5, v.AbsolutePosition.Y + v.AbsoluteSize.Y / 3)

				animation.AnimateAsync(v, { Rotation = 0 }, 0.5, "Out", "Quart")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = v4188 }, 0.5, "InOut", "Quint")
				animation.AnimateAsync(v, { Position = v4189 }, 0.5, "InOut", "Quint")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = vSize }, 0.5, "Out", "Bounce")
				animation.AnimateAsync(v, { Position = vPosition }, 0.5, "Out", "Bounce")
				task.wait(0.1)
			end)
		end
	end)
	task.wait(2.5)
	audioService.UndimSongs()
end
function module.DancePotionEnemy(p326, p327, _, p329)
	local t33: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
	local t34: {[any]: any} = { "Applause", "CrowdCheer" }

	effectsServicePreloadTech(p326, { "rbxassetid://14353373241", "rbxassetid://13895587959" })
	audioService.DimSongs()
	audioServicePlaySound("DancePotion")

	local s1

	if p329 == "" then
		s1 = "Enemy"
	elseif p329 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	task.spawn(function()
		task.wait(0.25)
		audioServicePlaySound("bass.wav")
		task.wait(0.2)

		local randomNumber = math.random(1, #t33)

		audioServicePlaySound(t33[randomNumber])
		task.wait(1.05)

		local randomNumber25 = math.random(1, #t33)

		audioServicePlaySound(t33[randomNumber25])
		task.wait(0.2)

		local randomNumber26 = math.random(1, #t33)

		audioServicePlaySound(t33[randomNumber26])
		task.wait(0.4)

		local randomNumber27 = math.random(1, #t34)

		audioServicePlaySound(t34[randomNumber27])
	end)
	task.spawn(function()
		local uDim2 = UDim2.new(0, p327.AbsoluteSize.X * 1.6, 0, p327.AbsoluteSize.X * 1.6)
		local v3564 = uDim2New(0.5, 0, 0.5, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v3566 = effectsServiceNewerCircle(p326, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://14353373241",
			ZIndex = 100001,
			ImageTransparency = 0,
			Rotation = 0,
			Size = uDim2,
			Position = v3564,
			ImageColor3 = color3,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local t115: {[any]: any} = { Color3.fromRGB(234, 117, 255), Color3.fromRGB(255, 74, 225) }
		local v3568 = UDim2.fromOffset(v3566.AbsoluteSize.X * 0.6, v3566.AbsoluteSize.X * 0.6)

		effectsServiceEmit(p326, v3566, {
			Projectile = "rbxassetid://13895587959",
			Strength = 80,
			Speed = 0.4,
			EasingStyle = "Quad",
			ImageTransparency = 0,
			Time = 2.6,
			Color = t115,
			Size = v3568,
			Range = v3566
		})

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v3566.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3573 = Vector2.new
			local floored5 = math.floor((i - 1) / 3)

			v3566.ImageRectOffset = v3573((i + 2) % 3 * 341.3, floored5 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3576 = Vector2.new
			local floored6 = math.floor((i - 1) / 3)

			v3566.ImageRectOffset = v3576((i + 2) % 3 * 341.3, floored6 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3579 = Vector2.new
			local floored7 = math.floor((i - 1) / 3)

			v3566.ImageRectOffset = v3579((i + 2) % 3 * 341.3, floored7 * 341.3)
			task.wait(0.068)
		end

		v3566:Destroy()
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p327.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeSync(v, v.Position, 1, 0.002)

				if math.random(1, 2) == 1 then
				end

				animation.AnimateAsync(v, { Rotation = 22 }, 0.3, "Out", "Back")
				task.wait(0.3)
				animation.AnimateAsync(v, { Rotation = -18 }, 0.28, "InOut", "Quint")
				task.wait(0.28)
				animation.AnimateAsync(v, { Rotation = 12 }, 0.16, "Out", "Back")
				task.wait(0.16)
				animation.AnimateAsync(v, { Rotation = -22 }, 0.2, "Out", "Quart")
				task.wait(0.2)
				animation.AnimateAsync(v, { Rotation = 16 }, 0.14, "InOut", "Quint")
				task.wait(0.14)
				animation.AnimateAsync(v, { Rotation = -10 }, 0.12, "Out", "Back")
				task.wait(0.12)
				animation.AnimateAsync(v, { Rotation = 18 }, 0.18, "Out", "Quart")
				task.wait(0.18)
				animation.AnimateAsync(v, { Rotation = 0 }, 0.24, "Out", "Back")
				task.wait(0.24)

				local vSize = v.Size
				local vPosition = v.Position
				local v4192 = UDim2.fromOffset(v.AbsoluteSize.X * 2, v.AbsoluteSize.Y / 2)
				local v4193 = UDim2.fromOffset(v.AbsolutePosition.X - v.AbsoluteSize.X / 1.5, v.AbsolutePosition.Y + v.AbsoluteSize.Y / 3)

				animation.AnimateAsync(v, { Rotation = 0 }, 0.5, "Out", "Quart")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = v4192 }, 0.5, "InOut", "Quint")
				animation.AnimateAsync(v, { Position = v4193 }, 0.5, "InOut", "Quint")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = vSize }, 0.5, "Out", "Bounce")
				animation.AnimateAsync(v, { Position = vPosition }, 0.5, "Out", "Bounce")
				task.wait(0.1)
			end)
		end
	end)
	task.wait(2.5)
	audioService.UndimSongs()
end
function module.DancePotionAll(p330, p331, _, p333)
	local t35: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
	local t36: {[any]: any} = { "Applause", "CrowdCheer" }

	effectsServicePreloadTech(p330, { "rbxassetid://14353373241", "rbxassetid://13895587959" })
	audioService.DimSongs()
	audioServicePlaySound("DancePotion")

	local s1
	local s2

	if p333 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p333 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	effectsService.ShakeBattleSync(p330, 3, 0.04)
	task.spawn(function()
		task.wait(0.25)
		audioServicePlaySound("bass.wav")
		task.wait(0.2)

		local randomNumber = math.random(1, #t35)

		audioServicePlaySound(t35[randomNumber])
		task.wait(1.05)

		local randomNumber28 = math.random(1, #t35)

		audioServicePlaySound(t35[randomNumber28])
		task.wait(0.2)

		local randomNumber29 = math.random(1, #t35)

		audioServicePlaySound(t35[randomNumber29])
		task.wait(0.4)

		local randomNumber30 = math.random(1, #t36)

		audioServicePlaySound(t36[randomNumber30])
	end)
	task.spawn(function()
		local uDim2 = UDim2.new(0, p331.AbsoluteSize.X * 1.6, 0, p331.AbsoluteSize.X * 1.6)
		local v3588 = uDim2New(0.5, 0, 0.5, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v3590 = effectsServiceNewerCircle(p330, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://14353373241",
			ZIndex = 100001,
			ImageTransparency = 0,
			Rotation = 0,
			Size = uDim2,
			Position = v3588,
			ImageColor3 = color3,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local t116: {[any]: any} = { Color3.fromRGB(234, 117, 255), Color3.fromRGB(255, 74, 225) }
		local v3592 = UDim2.fromOffset(v3590.AbsoluteSize.X * 0.6, v3590.AbsoluteSize.X * 0.6)

		effectsServiceEmit(p330, v3590, {
			Projectile = "rbxassetid://13895587959",
			Strength = 80,
			Speed = 0.4,
			EasingStyle = "Quad",
			ImageTransparency = 0,
			Time = 2.6,
			Color = t116,
			Size = v3592,
			Range = v3590
		})

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v3590.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3597 = Vector2.new
			local floored8 = math.floor((i - 1) / 3)

			v3590.ImageRectOffset = v3597((i + 2) % 3 * 341.3, floored8 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3600 = Vector2.new
			local floored9 = math.floor((i - 1) / 3)

			v3590.ImageRectOffset = v3600((i + 2) % 3 * 341.3, floored9 * 341.3)
			task.wait(0.068)
		end

		for i = 1, 9 do
			local v3603 = Vector2.new
			local floored10 = math.floor((i - 1) / 3)

			v3590.ImageRectOffset = v3603((i + 2) % 3 * 341.3, floored10 * 341.3)
			task.wait(0.068)
		end

		v3590:Destroy()
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p331.Parent.Parent[s2 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeSync(v, v.Position, 1, 0.002)

				if math.random(1, 2) == 1 then
				end

				animation.AnimateAsync(v, { Rotation = 22 }, 0.3, "Out", "Back")
				task.wait(0.3)
				animation.AnimateAsync(v, { Rotation = -18 }, 0.28, "InOut", "Quint")
				task.wait(0.28)
				animation.AnimateAsync(v, { Rotation = 12 }, 0.16, "Out", "Back")
				task.wait(0.16)
				animation.AnimateAsync(v, { Rotation = -22 }, 0.2, "Out", "Quart")
				task.wait(0.2)
				animation.AnimateAsync(v, { Rotation = 16 }, 0.14, "InOut", "Quint")
				task.wait(0.14)
				animation.AnimateAsync(v, { Rotation = -10 }, 0.12, "Out", "Back")
				task.wait(0.12)
				animation.AnimateAsync(v, { Rotation = 18 }, 0.18, "Out", "Quart")
				task.wait(0.18)
				animation.AnimateAsync(v, { Rotation = 0 }, 0.24, "Out", "Back")
				task.wait(0.24)

				local vSize = v.Size
				local vPosition = v.Position
				local v4196 = UDim2.fromOffset(v.AbsoluteSize.X * 2, v.AbsoluteSize.Y / 2)
				local v4197 = UDim2.fromOffset(v.AbsolutePosition.X - v.AbsoluteSize.X / 1.5, v.AbsolutePosition.Y + v.AbsoluteSize.Y / 3)

				animation.AnimateAsync(v, { Rotation = 0 }, 0.5, "Out", "Quart")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = v4196 }, 0.5, "InOut", "Quint")
				animation.AnimateAsync(v, { Position = v4197 }, 0.5, "InOut", "Quint")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = vSize }, 0.5, "Out", "Bounce")
				animation.AnimateAsync(v, { Position = vPosition }, 0.5, "Out", "Bounce")
				task.wait(0.1)
			end)
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p331.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeSync(v, v.Position, 1, 0.002)

				if math.random(1, 2) == 1 then
				end

				animation.AnimateAsync(v, { Rotation = 22 }, 0.3, "Out", "Back")
				task.wait(0.3)
				animation.AnimateAsync(v, { Rotation = -18 }, 0.28, "InOut", "Quint")
				task.wait(0.28)
				animation.AnimateAsync(v, { Rotation = 12 }, 0.16, "Out", "Back")
				task.wait(0.16)
				animation.AnimateAsync(v, { Rotation = -22 }, 0.2, "Out", "Quart")
				task.wait(0.2)
				animation.AnimateAsync(v, { Rotation = 16 }, 0.14, "InOut", "Quint")
				task.wait(0.14)
				animation.AnimateAsync(v, { Rotation = -10 }, 0.12, "Out", "Back")
				task.wait(0.12)
				animation.AnimateAsync(v, { Rotation = 18 }, 0.18, "Out", "Quart")
				task.wait(0.18)
				animation.AnimateAsync(v, { Rotation = 0 }, 0.24, "Out", "Back")
				task.wait(0.24)

				local vSize = v.Size
				local vPosition = v.Position
				local v4200 = UDim2.fromOffset(v.AbsoluteSize.X * 2, v.AbsoluteSize.Y / 2)
				local v4201 = UDim2.fromOffset(v.AbsolutePosition.X - v.AbsoluteSize.X / 1.5, v.AbsolutePosition.Y + v.AbsoluteSize.Y / 3)

				animation.AnimateAsync(v, { Rotation = 0 }, 0.5, "Out", "Quart")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = v4200 }, 0.5, "InOut", "Quint")
				animation.AnimateAsync(v, { Position = v4201 }, 0.5, "InOut", "Quint")
				task.wait(0.25)
				animation.AnimateAsync(v, { Size = vSize }, 0.5, "Out", "Bounce")
				animation.AnimateAsync(v, { Position = vPosition }, 0.5, "Out", "Bounce")
				task.wait(0.1)
			end)
		end
	end)
	task.wait(2.5)
	audioService.UndimSongs()
end
function module.Reprieve(p334, _, _, _)
	spawn(function()
		if math.random(1, 1) == 1 then
			audioService.DimSongs()
			audioServicePlaySound("Vine Boom Damn")

			local v3609 = uDim2New(1, 0, 1, 0)
			local v3610 = uDim2New(0.5, 0, 0.5, 0)
			local v3611 = effectsServiceNewerCircle(p334, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://121839050715606",
				ZIndex = 10011,
				Size = v3609,
				Position = v3610
			})

			wait(0.4)
			animation.AnimateAsync(v3611, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Linear")
			spawn(function()
				wait(0.8)
				audioService.UndimSongs()
			end)
		end
	end)
end
function module.DoombringerExplosion(p338, p339, p340, p341, _)
	audioService.PlaySound("DoombringerScream")
	task.spawn(function()
		effectsService.ShakeIn(p339, p339.Position, 6.5, 0.005, 1)
	end)
	task.wait(6.1)

	local n1 = p340.ZIndex - 1
	local uDim2 = UDim2.new(0, p340.AbsoluteSize.X * 0.1, 0, p340.AbsoluteSize.X * 0.1)
	local uDim228 = UDim2.new(0, p340.AbsolutePosition.X + p340.AbsoluteSize.X / 2, 0, p340.AbsolutePosition.Y + p340.AbsoluteSize.Y / 2)
	local v811 = effectsServiceNewerCircle(p338, {
		Image = "rbxassetid://1057939773",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim228
	})

	audioService.PlaySound("Explosion")
	spawn(function()
		effectsService.ShakeBattleSync(p338, 4, 0.5)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3 = Color3.fromRGB(240, 99, 43)
		local color324 = Color3.fromRGB(217, 66, 39)
		local color325 = Color3.fromRGB(240, 191, 65)
		local color326 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathEngulf(p338, p339, p340, p341, 150, effectsServiceBreathimagesFire, "FireBreathLong", 0.8, color3, color324, color325, color326, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)

	local animationAnimate = animation.Animate
	local uDim229 = UDim2.new(0, p340.AbsoluteSize.X * 8.75, 0, p340.AbsoluteSize.X * 8.75)

	animationAnimate(v811, { Size = uDim229 }, 1, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v811, "ImageTransparency", 0, 1, 0.3)
		v811:Destroy()
	end)
	wait(0.3)
end
function module.DoppelSummon(p343, _, _, _)
	spawn(function()
		local clone = script.DoppelText:Clone()

		clone.Parent = p343

		local u3618: boolean = true

		task.spawn(function()
			while u3618 == true do
				for _, v in pairs(clone.text:GetChildren()) do
					local vector2New = Vector2.new
					local randomNumber = math.random(4, 6)
					local randomNumber31 = math.random(4, 6)

					v.AnchorPoint = vector2New(randomNumber / 10, randomNumber31 / 10)
				end

				task.wait(0.025)
			end
		end)
		audioServicePlaySound("DoppelSpawn")
		task.wait(1.5)
		u3618 = false
		clone.Visible = false
		task.wait(1)
		clone:Destroy()
	end)
end
function module.Nightmare(p347, _, _, _)
	spawn(function()
		if math.random(1, 100) == 1 then
			audioService.DimSongs()
			audioServicePlaySound("Vine Boom")

			local v3619 = uDim2New(1, 0, 1, 0)
			local v3620 = uDim2New(0.5, 0, 0.5, 0)
			local v3621 = effectsServiceNewerCircle(p347, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://8269192588",
				ZIndex = 10011,
				Size = v3619,
				Position = v3620
			})

			wait(0.4)
			animation.AnimateAsync(v3621, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Linear")
			spawn(function()
				wait(0.8)
				audioService.UndimSongs()
			end)
		end
	end)
end
function module.NightFright(p351, _, _, _)
	spawn(function()
		if math.random(1, 100) == 1 then
			audioService.DimSongs()
			audioServicePlaySound("Vine Boom")

			local v3622 = uDim2New(1, 0, 1, 0)
			local v3623 = uDim2New(0.5, 0, 0.5, 0)
			local v3624 = effectsServiceNewerCircle(p351, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://7963463182",
				ZIndex = 10011,
				Size = v3622,
				Position = v3623
			})

			wait(0.4)
			animation.AnimateAsync(v3624, { BackgroundTransparency = 1, ImageTransparency = 0.99 }, 1, "Out", "Linear")
			spawn(function()
				wait(0.8)
				audioService.UndimSongs()
			end)
		end
	end)
end
function module.ShadowRealm(p355, _, _, _)
	audioServicePlaySound("ShadowRealm")
	audioService.DimSongs()

	local y = p355.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local color3 = Color3.fromRGB(0, 0, 0)
	local v832 = uDim2New(1, 0, 1, 0)
	local v833 = uDim2New(0.5, 0, 0.5, 0)
	local v834 = effectsServiceNewerCircle(p355, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10010,
		BackgroundColor3 = color3,
		Size = v832,
		Position = v833
	})
	local color327 = Color3.fromRGB(0, 0, 0)
	local v836 = uDim2New(1.5, 0, 1.5, 0)
	local v837 = uDim2New(0.5, 0, 0.5, 0)
	local v838 = effectsServiceNewerCircle(p355, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10011,
		BackgroundColor3 = color327,
		Size = v836,
		Position = v837
	})

	animation.AnimateAsync(v834, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 0.4, "Out", "Linear")

	local v839 = uDim2New(0, 0, 0, 0)
	local v840 = uDim2New(0.5, 0, 0.5, 0)
	local color328 = Color3.fromRGB(39, 54, 120)
	local v842 = effectsServiceNewerCircle(p355, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://8562508382",
		ZIndex = 10011,
		Size = v839,
		Position = v840,
		ImageColor3 = color328
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v844 = uDim2New(0, y * 3, 0, y * 3)

	animationAnimateAsync(v842, { ImageTransparency = 0, Size = v844 }, 0.4, "Out", "Quint")
	animation.AnimateAsync(v842, { Rotation = 1080 }, 3, "Out", "Linear")
	v837 = { Color3.fromRGB(34, 31, 49), Color3.fromRGB(8, 32, 140) }
	v836 = UDim2.fromOffset(y * 0.5, y * 0.5)
	effectsServiceEmit(p355, v838, {
		Projectile = "rbxassetid://8661386995",
		Strength = 150,
		Speed = 2,
		Lifetime = 0.65,
		EasingStyle = "Quint",
		EasingDirection = "In",
		Time = 1,
		ZIndex = 10011,
		Color = v837,
		Size = v836,
		Range = v838
	})
	wait(1)

	local animateAsync = animation.AnimateAsync
	local v846 = UDim2.fromOffset(0, 0)

	animateAsync(v842, { Size = v846 }, 1, "In", "Quint")
	animation.Animate(v834, { BackgroundTransparency = 1 }, 1, "In", "Linear")
	audioService.UndimSongs()
	v834:Destroy()
	v838:Destroy()
	v842:Destroy()
end
function module.BloxBux(p359, p360, p361, _, p363)
	local n1 = math.clamp(p363, 0, 10000) + 1000
	local color3 = Color3.fromRGB(0, 0, 0)
	local v854 = uDim2New(0.4, 0, 0.4, 0)
	local v855 = effectsServiceNewerCircle(p359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3,
		Size = v854,
		Position = p360 and UDim2.new(0, p360.AbsolutePosition.X, 0, p360.AbsolutePosition.Y) + UDim2.new(0, p360.AbsoluteSize.X * 0.5, 0, p360.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color329 = Color3.fromRGB(0, 0, 0)
	local v857 = uDim2New(0, 0, 0, 0)
	local v858 = effectsServiceNewerCircle(p359, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		BackgroundColor3 = color329,
		Size = v857,
		Position = p360 and UDim2.new(0, p360.AbsolutePosition.X, 0, p360.AbsolutePosition.Y) + UDim2.new(0, p360.AbsoluteSize.X * 0.5, 0, p360.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
		ZIndex = p360 and p360.ZIndex + 10 or 10
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v860 = UDim2.fromOffset(v855.AbsoluteSize.Y, v855.AbsoluteSize.Y)

	animationAnimateAsync(v858, { Size = v860 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v858, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
	task.spawn(function()
		task.wait(0.5)
		v858:Destroy()
	end)
	audioServicePlaySound("gold01")

	if n1 > 1100 then
		audioServicePlaySound("gold02")

		if n1 > 1999 then
			audioServicePlaySound("crystal01")
		end
	end

	for _ = 1, math.ceil(n1 / 10000 * 60) do
		task.wait()

		local color330 = Color3.fromRGB(0, 0, 0)
		local v863 = UDim2.fromOffset(v855.AbsoluteSize.Y / 6, v855.AbsoluteSize.Y / 6)
		local v864 = effectsServiceNewerCircle(p359, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://475466844",
			ImageTransparency = 0,
			BackgroundColor3 = color330,
			Size = v863,
			Position = p360 and UDim2.new(0, p360.AbsolutePosition.X, 0, p360.AbsolutePosition.Y) + UDim2.new(0, p360.AbsoluteSize.X * 0.5, 0, p360.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
			ZIndex = p360 and p360.ZIndex + 10 or 10,
			Rotation = math.random(-30, 30)
		})
		local v865 = randomPosOnTarget(v855)

		task.spawn(function()
			animation.Animate(v864, { Position = v865 }, 0.5, "Out", "Quint")
			animation.AnimateAsync(v864, { Rotation = 0 }, 0.6, "In", "Quint")

			local animationAnimate = animation.Animate
			local uDim2 = UDim2.new(0, p361.AbsolutePosition.X, 0, p361.AbsolutePosition.Y)
			local uDim230 = UDim2.new(0, 0, 0, p361.AbsoluteSize.Y * 0.5)

			animationAnimate(v864, { Position = uDim2 + uDim230 }, 0.6, "In", "Quint")
			v864:Destroy()
			audioServicePlaySound("click2")
		end)
	end
end
-- FIX: the defeated-face explosion could be silent when its sound assets don't load in this place. This plays the sounds in
-- 'names' that load; if none of them do it falls back to 'fallbacks' and warns which asset ids failed.
function module.PlayLoadedSounds(names, fallbacks, volume)
	local fxFolder = nil
	local audioFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Audio")

	if audioFolder then
		fxFolder = audioFolder:FindFirstChild("Effects")
	end

	local localPlayer = game:GetService("Players").LocalPlayer

	local function tryPlay(name)
		local source = fxFolder and fxFolder:FindFirstChild(name, true)

		if not source or not source:IsA("Sound") or source.SoundId == "" then
			return false
		end

		local sound = Instance.new("Sound")

		sound.Name = name
		sound.SoundId = source.SoundId
		sound.Volume = (volume or 1) * (source.Volume > 0 and source.Volume or 1)
		sound.SoundGroup = game:GetService("SoundService"):FindFirstChild("VolumeGroup")
		sound.Parent = localPlayer

		local waited = 0

		while not sound.IsLoaded and waited < 1.2 do
			waited += task.wait(0.05)
		end

		if sound.IsLoaded and sound.TimeLength > 0 then
			sound:Play()
			game:GetService("Debris"):AddItem(sound, sound.TimeLength + 2)

			return true
		end

		warn("[Effects] explosion sound failed to load:", name, source.SoundId)
		sound:Destroy()

		return false
	end

	task.spawn(function()
		local results = {}
		local pending = #names

		for i, name in ipairs(names) do
			task.spawn(function()
				results[i] = tryPlay(name)
				pending -= 1
			end)
		end

		while pending > 0 do
			task.wait(0.05)
		end

		for _, played in pairs(results) do
			if played then
				return
			end
		end

		for _, name in ipairs(fallbacks or {}) do
			if tryPlay(name) then
				return
			end
		end
	end)
end
task.spawn(function()
	-- FIX: preload the explosion so it plays at the exact moment of the blast instead of after a load delay
	pcall(function()
		game:GetService("ContentProvider"):PreloadAsync({ "rbxassetid://10264050410" })
	end)
end)
function module.Lose(p364, p365, p366, _, _)
	local n1 = p366.ZIndex + 10000
	local uDim2 = UDim2.new(0, p365.AbsoluteSize.X * 10, 0, p365.AbsoluteSize.X * 10)
	local uDim231 = UDim2.new(0, p366.AbsolutePosition.X, 0, p366.AbsolutePosition.Y)
	local uDim232 = UDim2.new(0, p366.AbsoluteSize.X * 0.5, 0, p366.AbsoluteSize.Y * 0.5)
	local v875 = effectsServiceNewerCircle(p364, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5101723932",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim231 + uDim232
	})
	local color3 = Color3.fromRGB(0, 0, 0)
	local v877 = uDim2New(0.35, 0, 0.5, 0)
	local v878 = effectsServiceNewerCircle(p364, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3,
		Size = v877,
		Position = p366 and UDim2.new(0, p366.AbsolutePosition.X, 0, p366.AbsolutePosition.Y) + UDim2.new(0, p366.AbsoluteSize.X * 0.5, 0, p366.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})

	task.spawn(function()
		effectsService.Shake(p366, p366.Position, 1, 0.2)
	end)

	local animationAnimate = animation.Animate
	local uDim233 = UDim2.new(0, p366.AbsoluteSize.X / 10, 0, p366.AbsoluteSize.X / 10)

	animationAnimate(v875, { Size = uDim233 }, 1, "Out", "Quint")
	task.spawn(function()
		audioServicePlaySound("headexplosion") -- FIX: one correct, instant explosion sound (was scream + boom, loaded late)
		p366.Visible = false
		effectsService.ShakeBattle(p364, 0.3, 0.05)
	end)

	local t37: {[any]: any} = {
		{ Vector2.new(0, 0), UDim2.fromScale(0, 0) },
		{ Vector2.new(0.5, 0), UDim2.fromScale(0.5, 0) },
		{ Vector2.new(1, 0), UDim2.fromScale(1, 0) },
		{ Vector2.new(0, 0.5), UDim2.fromScale(0, 0.5) },
		{ Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5) },
		{ Vector2.new(1, 0.5), UDim2.fromScale(1, 0.5) },
		{ Vector2.new(0, 1), UDim2.fromScale(0, 1) },
		{ Vector2.new(0.5, 1), UDim2.fromScale(0.5, 1) },
		{ Vector2.new(1, 1), UDim2.fromScale(1, 1) },
		{ Vector2.new(0, 0.5), UDim2.fromScale(0, 0.5) },
		{ Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5) },
		{ Vector2.new(1, 0.5), UDim2.fromScale(1, 0.5) }
	}

	for i = 1, 12 do
		local randomNumber = math.random(8, 10)
		local color331 = Color3.fromRGB(0, 0, 0)
		local v885 = UDim2.fromOffset(v878.AbsoluteSize.Y / randomNumber, v878.AbsoluteSize.Y / randomNumber)
		local parent = effectsServiceNewerCircle(p364, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 11000,
			ClipsDescendants = true,
			BackgroundColor3 = color331,
			Size = v885,
			Position = p366 and UDim2.new(0, p366.AbsolutePosition.X, 0, p366.AbsolutePosition.Y) + UDim2.new(0, p366.AbsoluteSize.X * 0.5, 0, p366.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color332 = Color3.fromRGB(0, 0, 0)
		local image = p366.Back.Image
		local v889 = UDim2.fromOffset(p366.AbsoluteSize.X, p366.AbsoluteSize.Y)
		local v890 = effectsServiceNewerCircle(p364, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 11000,
			BackgroundColor3 = color332,
			Image = image,
			Size = v889
		})

		v890.Parent = parent
		v890.AnchorPoint = t37[i][1]
		v890.Position = t37[i][2]

		local v891 = randomPosOnTarget(v878)

		task.spawn(function()
			animation.Animate(parent, { Position = v891 }, 1.5, "Out", "Quint")
			animation.Animate(v890, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
			p366:Destroy()
			parent:Destroy()
			v875:Destroy()
			v878:Destroy()
		end)
	end
end
function module.Rage(_, _, _, _)
end
function module.EnterRage(p373, _, _, p376)
	audioServiceDimSongs()

	local color3 = Color3.fromRGB(204, 17, 17)
	local v901 = uDim2New(1, 0, 1, 0)
	local v902 = uDim2New(0.5, 0, 0.5, 0)
	local v903 = effectsServiceNewerCircle(p373, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		Name = "Rage",
		BackgroundColor3 = color3,
		Size = v901,
		Position = v902
	})

	task.spawn(function()
		animation.Animate(v903, { BackgroundTransparency = 0.5 }, 0.5, "Out", "Quart")
		animation.AnimateAsync(v903, { BackgroundTransparency = 1 }, 1, "In", "Quart")
	end)
	audioServicePlaySound("Bane")
	task.delay(1, function()
		audioServiceUndimSongs()
	end)

	if p373.Parent:FindFirstChild(p376 .. "Field") then
		for _, v in pairs(_G.__NoFaces(p373.Parent[p376 .. "Field"])) do
			if v:FindFirstChild("LockImage") then
				local animationAnimateAsync = animation.AnimateAsync
				local color333 = Color3.fromRGB(0, 0, 0)
				local color334 = Color3.fromRGB(255, 0, 0)

				animationAnimateAsync(v.LockImage.Amount, { TextColor3 = color333, TextStrokeColor3 = color334 }, 1, "Out", "Quart")
			end
		end
	end
end
function module.OpponentEnterRage(p377, p378, p379, p380: string)
	if p380 == "" then
		p380 = "Enemy"
	end

	if p380 == "Enemy" then
		p380 = ""
	end

	module.EnterRage(p377, p378, p379, p380)
end
function module.ExitRage(p381, _, _, p384)
	local children = p381.Parent.BattleNew[p384 .. "Effect"]:GetChildren()

	for _, v in pairs(children) do
		if v.Name == "Rage" then
			task.spawn(function()
				animation.Animate(v, { BackgroundTransparency = 1 }, 1, "Out", "Linear")
				v:Destroy()
			end)
		end
	end
end
function module.Mark(p385, _, parent)
	if parent:FindFirstChild("VisualMarked") then
		return
	end

	local visualMarked: Configuration = Instance.new("Configuration")

	visualMarked.Parent = parent
	visualMarked.Name = "VisualMarked"

	local n1 = parent.ZIndex + 1
	local v925 = UDim2.fromScale(0.8, 0.8)
	local v926 = UDim2.fromScale(0.5, 0.5)
	local color3 = Color3.fromRGB(176, 42, 42)
	local v928 = effectsServiceNewerCircle(p385, {
		Name = "Mark",
		BackgroundTransparency = 1,
		Image = "rbxassetid://10236705400",
		ImageTransparency = 0.3,
		Rotation = 180,
		ZIndex = n1,
		Size = v925,
		Position = v926,
		ImageColor3 = color3
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v928
	v928.Parent = parent
	task.spawn(function()
		animation.AnimateAsync(v928, { Rotation = 360 }, 1.5, "Out", "Quint")

		local t117: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(186, 0, 0) }

		audioServicePlaySound("dbzswordout")
		effectsServicePulse(p385, v928, { Time = 0.7, FlashTime = 0.4, Color = t117, Transparency = 0.1 })
	end)
end
function module.RemoveMark(p388, _, p390)
	local visualMarked = p390:FindFirstChild("VisualMarked")
	local mark = p390:FindFirstChild("Mark")

	if visualMarked and mark then
		task.spawn(function()
			if mark.Parent then
				animation.AnimateAsync(mark, { Rotation = -360, ImageTransparency = 1 }, 1.5, "Out", "Quint")
			end

			if mark.Parent then
				local color3 = Color3.fromRGB(255, 255, 255)

				effectsServicePulse(p388, mark, {
					Time = 0.7,
					FlashTime = 0.4,
					Transparency = 0.1,
					Color = { color3, Color3.fromRGB(186, 0, 0) }
				})
			end

			audioServicePlaySound("dbzswordout")
			task.wait(1.6)

			if visualMarked.Parent then
				visualMarked:Destroy()
			end

			if mark.Parent then
				mark:Destroy()
			end
		end)

		return
	end
end
function module.MarkSelf(p391, parent, _)
	local n1 = parent.ZIndex + 100
	local v939 = UDim2.fromScale(0.8, 0.8)
	local v940 = UDim2.fromScale(0.5, 0.5)
	local color3 = Color3.fromRGB(157, 157, 157)
	local v942 = effectsServiceNewerCircle(p391, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://10236705400",
		ImageTransparency = 0.3,
		Rotation = 180,
		ZIndex = n1,
		Size = v939,
		Position = v940,
		ImageColor3 = color3
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v942
	v942.Parent = parent
	task.spawn(function()
		animation.AnimateAsync(v942, { Rotation = 360 }, 1, "Out", "Quint")

		local t118: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(97, 97, 97) }

		audioServicePlaySound("dbzswordout")
		audioServicePlaySound("switch.wav")
		effectsServicePulse(p391, v942, { Time = 0.7, FlashTime = 0.4, Color = t118, Transparency = 0.1 })
	end)
	task.wait(0.8)
	v942:Destroy()
end
function module.MarkAlly(p394, _, parent)
	local n1 = parent.ZIndex + 100
	local v948 = UDim2.fromScale(0.8, 0.8)
	local v949 = UDim2.fromScale(0.5, 0.5)
	local color3 = Color3.fromRGB(157, 157, 157)
	local v951 = effectsServiceNewerCircle(p394, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://10236705400",
		ImageTransparency = 0.3,
		Rotation = 180,
		ZIndex = n1,
		Size = v948,
		Position = v949,
		ImageColor3 = color3
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v951
	v951.Parent = parent
	task.spawn(function()
		animation.AnimateAsync(v951, { Rotation = 360 }, 1, "Out", "Quint")

		local t119: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(97, 97, 97) }

		audioServicePlaySound("dbzswordout")
		audioServicePlaySound("switch.wav")
		effectsServicePulse(p394, v951, { Time = 0.7, FlashTime = 0.4, Color = t119, Transparency = 0.1 })
	end)
	task.wait(0.8)
	v951:Destroy()
end
function module.CatMark(p397, _, parent)
	local n1 = parent.ZIndex + 100
	local v957 = UDim2.fromScale(0.95, 0.95)
	local v958 = UDim2.fromScale(0.5, 0.5)
	local color3 = Color3.fromRGB(255, 0, 255)
	local v960 = effectsServiceNewerCircle(p397, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13487272639",
		ImageTransparency = 0,
		Rotation = 0,
		Name = "CatMark",
		ZIndex = n1,
		Size = v957,
		Position = v958,
		ImageColor3 = color3,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v960
	v960.Parent = parent
	audioServicePlaySound("toon beep")
	audioServicePlaySound("dbzswordout")
	task.spawn(function()
		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v960.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.08)
		end
	end)
end
function module.RemoveCatMark(_, _, p402)
	if not p402:FindFirstChild("CatMark") then
		return
	end

	audioServicePlaySound("toon beep")
	audioServicePlaySound("dbzswordout")
	task.spawn(function()
		for i = 1, 9 do
			local n1: number = 10 - i
			local vector2New = Vector2.new
			local floored = math.floor((n1 - 1) / 3)
			local vector2 = vector2New((n1 + 2) % 3 * 341.3, floored * 341.3)
			local catMark = p402:FindFirstChild("CatMark")

			catMark.ImageRectOffset = vector2
			task.wait(0.08)
		end

		p402:FindFirstChild("CatMark"):Destroy()
	end)
end
function module.LivingWorld(p403, _, _, p406)
	local guiObject = p403.Parent.BattleNew[p406 .. "Terrain"]:FindFirstChildWhichIsA("GuiObject")

	if not guiObject then
		audioServicePlaySound("splat.wav")

		return
	end

	local v970 = UDim2.fromOffset(guiObject.AbsoluteSize.Y * 1.4, guiObject.AbsoluteSize.Y * 1.4)
	local uDim2 = UDim2.new(0, guiObject.AbsolutePosition.X, 0, guiObject.AbsolutePosition.Y)
	local uDim234 = UDim2.new(0, guiObject.AbsoluteSize.X * 0.5, 0, guiObject.AbsoluteSize.Y * 0.5)
	local v973 = effectsServiceNewerCircle(p403, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v970,
		Position = uDim2 + uDim234
	})
	local color3 = Color3.fromRGB(190, 255, 180)
	local v975 = UDim2.fromOffset(0, 0)
	local uDim235 = UDim2.new(0, guiObject.AbsolutePosition.X, 0, guiObject.AbsolutePosition.Y)
	local uDim236 = UDim2.new(0, guiObject.AbsoluteSize.X * 0.5, 0, guiObject.AbsoluteSize.Y * 0.5)
	local v978 = effectsServiceNewerCircle(p403, {
		Image = "rbxassetid://10243727971",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = color3,
		Size = v975,
		Position = uDim235 + uDim236,
		ZIndex = guiObject.ZIndex + 14999
	})
	local color335 = Color3.fromRGB(0, 0, 0)
	local v980 = uDim2New(1, 0, 2, 0)
	local v981 = uDim2New(0.5, 0, 0.5, 0)
	local v982 = effectsServiceNewerCircle(p403, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color335,
		Size = v980,
		Position = v981
	})

	animation.AnimateAsync(v982, { BackgroundTransparency = 0.4 }, 0.3, "Out", "Quint")
	audioServicePlaySound("titan transformation")
	animation.AnimateAsync(v978, { Rotation = 720 }, 2, "Out", "Quint")

	local animationAnimate = animation.Animate
	local v984 = UDim2.fromOffset(guiObject.AbsoluteSize.Y * 2, guiObject.AbsoluteSize.Y * 2)

	animationAnimate(v978, { Size = v984 }, 0.5, "Out", "Quint")
	task.spawn(function()
		effectsService.ShakeBattle(p403, 3, 0.2)
	end)
	task.spawn(function()
		local t120: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(89, 255, 0) }
		local n1 = guiObject.ZIndex + 15000

		animation.AnimateAsync(v978, { ImageTransparency = 1 }, 2, "Out", "Linear")
		effectsServicePulse(p403, v978, {
			Time = 1.1,
			FlashTime = 0.6,
			Color = t120,
			Transparency = 0.1,
			SizeMultiplier = 2.5,
			ZIndex = n1
		})
	end)
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t121: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(183, 185, 179) }
		local v3645 = UDim2.fromOffset(guiObject.AbsoluteSize.X / 1.3, guiObject.AbsoluteSize.X / 1.3)

		effectsServiceBreath(p403, guiObject, v973, {
			Strength = 1000,
			Time = 1,
			Projectile = effectsServiceBreathimagesFire,
			Color = t121,
			Size = v3645
		})
		task.wait(0.5)
		animation.Animate(v982, { BackgroundTransparency = 1 }, 0.6, "Out", "Quint")
		v982:Destroy()
		v973:Destroy()
		v978:Destroy()
	end)
	task.wait(0.5)
end
function module.RootCause(p407, _, p409, _)
	for _ = 1, 5 do
		local color3 = Color3.fromRGB(65, 44, 26)
		local v991 = UDim2.fromOffset(p409.AbsoluteSize.X * 0.1, p409.AbsoluteSize.Y * 1.1)
		local uDim2 = UDim2.new(0, p409.AbsolutePosition.X, 0, p409.AbsolutePosition.Y)
		local uDim237 = UDim2.new(0, p409.AbsoluteSize.X * 0.5, 0, p409.AbsoluteSize.Y * 0.5)
		local n1 = p409.ZIndex + 10000
		local randomNumber = math.random(0, 360)
		local v996 = effectsServiceNewerCircle(p407, {
			BackgroundTransparency = 1,
			ImageColor3 = color3,
			Size = v991,
			Position = uDim2 + uDim237,
			ZIndex = n1,
			Rotation = randomNumber
		})

		task.spawn(function()
			task.wait(1)
			animation.Animate(v996, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		end)
	end

	audioServicePlaySound("MidSlash")
	effectsService.Shake(p409, p409.Position, 1, 0.1)
end
local function CutInHalf(parent)
	local frame: Frame = Instance.new("Frame")

	frame.Size = UDim2.fromScale(1, 1)
	frame.Position = UDim2.fromScale(0, 0.5)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Parent = parent

	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.ZIndex = parent.ZIndex
	imageLabel.Size = UDim2.fromScale(1, 1)
	imageLabel.Position = UDim2.fromScale(0, -0.5)
	imageLabel.Image = parent.Image
	imageLabel.BackgroundTransparency = 1
	imageLabel.Parent = frame
	parent.ImageTransparency = 1
end
local function GetRandomPositionFromRange(p412)
	local y = p412.AbsolutePosition.Y
	local n1 = p412.AbsolutePosition.Y + p412.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p412.AbsolutePosition.X, p412.AbsolutePosition.X + p412.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
function module.HeadExplode(p413, _, parent, _)
	audioServicePlaySound("finger snap")
	task.wait(0.4)
	audioServicePlaySound("headexplosion")
	task.spawn(function()
		effectsService.Shake(parent, parent.Position, 0.5, 0.2)
	end)
	CutInHalf(parent)

	local v1009 = UDim2.fromScale(1.2, 0.5)
	local v1010 = UDim2.fromScale(0.5, 0.25)
	local v1011 = effectsServiceNewerCircle(p413, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1009,
		Position = v1010
	})

	v1011.Parent = parent

	local u1012: boolean = true

	parent:GetPropertyChangedSignal("Parent"):Connect(function()
		if parent.Parent == nil then
			u1012 = false
		end
	end)
	task.wait(1)
end
function module.HeadExplodeAsync(p417, p418, _, p420)
	local children = p417.Parent.BattleNew[(if p420 == "" then "Enemy" else if p420 == "Enemy" then "" else nil) .. "Field"]:GetChildren()

	if #children > 0 then
		for _, v in pairs(children) do
			task.spawn(function()
				module.HeadExplode(p417, p418, v, p420)
			end)
			task.wait(0.1)
		end
	end

	task.wait(1)
end
function VagabondGlint(p421, p422, _, _, p425)
	audioServicePlaySound("bane end")

	local v1025 = UDim2.fromOffset(p422.AbsoluteSize.X * 0.8, p422.AbsoluteSize.X * 0.8)
	local uDim2 = UDim2.new(0, p422.AbsolutePosition.X, 0, p422.AbsolutePosition.Y)
	local uDim238 = UDim2.new(0, p422.AbsoluteSize.X * 0.5, 0, p422.AbsoluteSize.Y * 0.5)
	local v1028 = UDim2.fromOffset(0, p422.AbsoluteSize.Y / 8)
	local n1 = p422.ZIndex + 1
	local randomNumber = math.random(-180, 180)
	local v1031 = effectsServiceNewerCircle(p421, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v1025,
		Position = uDim2 + uDim238 - v1028,
		Image = p425,
		ZIndex = n1,
		Rotation = randomNumber
	})

	effectsService.ShakeSync(p422, p422.Position, 0.2, 0.1)
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 4)

		effectsServicePulse(p421, v1031, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	animation.AnimateAsync(v1031, { Rotation = v1031.Rotation + 360 }, 1.2, "Out", "Quint")
	task.wait(0.2)
	task.spawn(function()
		animation.Animate(v1031, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		v1031:Destroy()
	end)
end
function module.VagabondCothGlint(p426, p427, p428, p429)
	VagabondGlint(p426, p427, p428, p429, "rbxassetid://13389881858")
end
function module.VagabondRageGlint(p430, p431, p432, p433)
	VagabondGlint(p430, p431, p432, p433, "rbxassetid://13389882431")
end
function module.VagabondSoulmateGlint(p434, p435, p436, p437)
	VagabondGlint(p434, p435, p436, p437, "rbxassetid://13381832045")
end
function VagabondSoulSearch(p438, p439, _, p441, p442, p443)
	audioServicePlaySound("bane end")

	local v1050 = p438.Parent.BattleNew["Virtual" .. p441 .. "Deck"]
	local v1051 = UDim2.fromOffset(p439.AbsoluteSize.X * 0.8, p439.AbsoluteSize.X * 0.8)
	local uDim2 = UDim2.new(0, p439.AbsolutePosition.X, 0, p439.AbsolutePosition.Y)
	local uDim239 = UDim2.new(0, p439.AbsoluteSize.X * 0.5, 0, p439.AbsoluteSize.Y * 0.5)
	local v1054 = UDim2.fromOffset(0, p439.AbsoluteSize.Y / 8)
	local n1 = p439.ZIndex + 1
	local randomNumber = math.random(-180, 180)
	local v1057 = effectsServiceNewerCircle(p438, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v1051,
		Position = uDim2 + uDim239 - v1054,
		Image = p442,
		ZIndex = n1,
		Rotation = randomNumber
	})
	local v1058 = UDim2.fromOffset(v1050.AbsoluteSize.X * 0.8, v1050.AbsoluteSize.X * 0.8)
	local uDim240 = UDim2.new(0, v1050.AbsolutePosition.X, 0, v1050.AbsolutePosition.Y)
	local uDim241 = UDim2.new(0, v1050.AbsoluteSize.X * 0.5, 0, v1050.AbsoluteSize.Y * 0.5)
	local v1061 = UDim2.fromOffset(0, v1050.AbsoluteSize.Y / 8)
	local n2 = v1050.ZIndex + 1
	local randomNumber32 = math.random(-180, 180)
	local v1064 = effectsServiceNewerCircle(p438, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v1058,
		Position = uDim240 + uDim241 - v1061,
		Image = p443,
		ZIndex = n2,
		Rotation = randomNumber32
	})

	effectsService.ShakeSync(p439, p439.Position, 0.2, 0.1)
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 4)

		effectsServicePulse(p438, v1057, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 4)

		effectsServicePulse(p438, v1064, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	animation.AnimateAsync(v1057, { Rotation = v1057.Rotation + 360 }, 1.2, "Out", "Quint")
	animation.AnimateAsync(v1064, { Rotation = v1064.Rotation + 360 }, 1.2, "Out", "Quint")
	task.wait(0.2)
	task.spawn(function()
		animation.AnimateAsync(v1057, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		animation.Animate(v1064, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		v1057:Destroy()
		v1064:Destroy()
	end)
end
function module.VagabondCothSearch(p444, p445, p446, p447)
	VagabondSoulSearch(p444, p445, p446, p447, "rbxassetid://13389881858", "rbxassetid://13389882431")
end
function module.VagabondRageSearch(p448, p449, p450, p451)
	VagabondSoulSearch(p448, p449, p450, p451, "rbxassetid://13389882431", "rbxassetid://13389881858")
end
function module.RageborneEyeGlint(p452, p453, _, _)
	audioServicePlaySound("bane end")

	local v1077 = UDim2.fromOffset(p453.AbsoluteSize.X * 1.1, p453.AbsoluteSize.X * 1.1)
	local uDim2 = UDim2.new(0, p453.AbsolutePosition.X, 0, p453.AbsolutePosition.Y)
	local uDim242 = UDim2.new(0, p453.AbsoluteSize.X * 0.5, 0, p453.AbsoluteSize.Y * 0.5)
	local v1080 = UDim2.fromOffset(0, p453.AbsoluteSize.Y / 8)
	local n1 = p453.ZIndex + 1
	local randomNumber = math.random(-180, 180)
	local v1083 = effectsServiceNewerCircle(p452, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://10659029660",
		Size = v1077,
		Position = uDim2 + uDim242 - v1080,
		ZIndex = n1,
		Rotation = randomNumber
	})

	effectsService.ShakeSync(p453, p453.Position, 0.2, 0.1)
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 4)

		effectsServicePulse(p452, v1083, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	animation.AnimateAsync(v1083, { Rotation = v1083.Rotation + 360 }, 1.2, "Out", "Quint")
	task.wait(0.2)
	task.spawn(function()
		animation.Animate(v1083, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		v1083:Destroy()
	end)
end
function module.BlueborneEyeGlint(p456, p457, _, _)
	audioServicePlaySound("bane end")

	local v1088 = UDim2.fromOffset(p457.AbsoluteSize.X * 1.1, p457.AbsoluteSize.X * 1.1)
	local uDim2 = UDim2.new(0, p457.AbsolutePosition.X, 0, p457.AbsolutePosition.Y)
	local uDim243 = UDim2.new(0, p457.AbsoluteSize.X * 0.5, 0, p457.AbsoluteSize.Y * 0.5)
	local v1091 = UDim2.fromOffset(0, p457.AbsoluteSize.Y / 8)
	local n1 = p457.ZIndex + 1
	local randomNumber = math.random(-180, 180)
	local v1094 = effectsServiceNewerCircle(p456, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://14598245812",
		Size = v1088,
		Position = uDim2 + uDim243 - v1091,
		ZIndex = n1,
		Rotation = randomNumber
	})

	effectsService.ShakeSync(p457, p457.Position, 0.2, 0.1)
	task.spawn(function()
		local color3 = Color3.fromRGB(0, 26, 255)

		effectsServicePulse(p456, v1094, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	animation.AnimateAsync(v1094, { Rotation = v1094.Rotation + 360 }, 1.2, "Out", "Quint")
	task.wait(0.2)
	task.spawn(function()
		animation.Animate(v1094, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		v1094:Destroy()
	end)
end
function module.SoloLifeReset(p460, p461, _, _)
	audioServicePlaySound("bane end")

	local v1099 = UDim2.fromOffset(p461.AbsoluteSize.X * 1.1, p461.AbsoluteSize.X * 1.1)
	local uDim2 = UDim2.new(0, p461.AbsolutePosition.X, 0, p461.AbsolutePosition.Y)
	local uDim244 = UDim2.new(0, p461.AbsoluteSize.X * 0.5, 0, p461.AbsoluteSize.Y * 0.5)
	local v1102 = UDim2.fromOffset(0, p461.AbsoluteSize.Y / 8)
	local n1 = p461.ZIndex + 1
	local randomNumber = math.random(-180, 180)
	local v1105 = effectsServiceNewerCircle(p460, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://10659029660",
		Size = v1099,
		Position = uDim2 + uDim244 - v1102,
		ZIndex = n1,
		Rotation = randomNumber
	})

	effectsService.ShakeSync(p461, p461.Position, 0.2, 0.1)
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 4)

		effectsServicePulse(p460, v1105, {
			Time = 1.2,
			FlashTime = 0.6,
			Color = { color3, Color3.fromRGB(0, 0, 0) },
			Transparency = 0.1,
			SizeMultiplier = 1.2
		})
	end)
	animation.AnimateAsync(v1105, { Rotation = v1105.Rotation + 360 }, 1.2, "Out", "Quint")
	task.wait(0.2)
	task.spawn(function()
		animation.Animate(v1105, { ImageTransparency = 1 }, 1, "InOut", "Quint")
		v1105:Destroy()
	end)

	local color3 = Color3.fromRGB(255, 14, 18)
	local v1107 = UDim2.fromOffset(p461.AbsoluteSize.X * 0.1, p461.AbsoluteSize.X * 0.1)
	local uDim245 = UDim2.new(0, p461.AbsolutePosition.X, 0, p461.AbsolutePosition.Y)
	local uDim246 = UDim2.new(0, p461.AbsoluteSize.X * 0.5, 0, p461.AbsoluteSize.Y * 0.5)
	local v1110 = effectsServiceNewerCircle(p460, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://87336022407472",
		Rotation = 0,
		ImageColor3 = color3,
		Size = v1107,
		Position = uDim245 + uDim246,
		ZIndex = p461.ZIndex + 1
	})
	local animationAnimateAsync = animation.AnimateAsync

	v1102 = UDim2.fromOffset(p461.AbsoluteSize.X * 1.2, p461.AbsoluteSize.Y * 1.1)
	animationAnimateAsync(v1110, { Size = v1102 }, 1, "Out", "Quint")
	effectsService.ShakeSync(p461, p461.Position, 0.2, 0.1)
	audioServicePlaySound("EnergyCrackle")
	task.wait(0.2)
	task.spawn(function()
		while p461 do
			task.wait(3)

			local v3652 = p461
			local uDim247 = UDim2.new(0, v3652.AbsolutePosition.X, 0, v3652.AbsolutePosition.Y)
			local uDim248 = UDim2.new(0, v3652.AbsoluteSize.X * 0.5, 0, v3652.AbsoluteSize.Y * 0.5)

			v1110.Position = uDim247 + uDim248
			v1110.ZIndex = p461.ZIndex + 1
		end
	end)
end
local function CreateBlessingIcon(p464, parent, p466)
	if parent:FindFirstChild("Icon") then
		parent:FindFirstChild("Icon"):Destroy()
	end

	local v1115 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.5, parent.AbsoluteSize.X * 0.5)
	local v1116 = UDim2.fromScale(0.5, 0.5)
	local v1117 = effectsServiceNewerCircle(p464, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Name = "Icon",
		Size = v1115,
		Position = v1116,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ZIndex = parent.ZIndex + 1000,
		Image = p466
	})

	v1117.Parent = parent
	animation.AnimateAsync(v1117, { ImageTransparency = 0.4 }, 0.6, "Out", "Quint")
end
function module.AdretiBless(p467, p468)
	p468.Image = "rbxassetid://8717323465"
	p468.ImageColor3 = Color3.fromRGB(255, 244, 90)
	p468.ImageTransparency = 1
	p468.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p468, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local v1120 = UDim2.fromOffset(p468.AbsoluteSize.Y * 1.5, p468.AbsoluteSize.Y * 1.5)
	local uDim2 = UDim2.new(0, p468.AbsolutePosition.X, 0, p468.AbsolutePosition.Y)
	local uDim249 = UDim2.new(0, p468.AbsoluteSize.X * 0.5, 0, p468.AbsoluteSize.Y * 0.5)
	local v1123 = effectsServiceNewerCircle(p467, { BackgroundTransparency = 1, Size = v1120, Position = uDim2 + uDim249 })
	local t38: {[any]: any} = { Color3.fromRGB(104, 223, 215), Color3.fromRGB(255, 253, 211) }
	local v1125 = UDim2.fromOffset(p468.AbsoluteSize.X * 0.4, p468.AbsoluteSize.X * 0.4)

	CreateBlessingIcon(p467, p468, "rbxassetid://10664403297")

	local t39: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 45,
		Speed = 0.6,
		EasingStyle = "Quad",
		Time = 0.6,
		Color = t38,
		Size = v1125,
		Range = v1123
	}

	effectsServiceEmit(p467, p468, t39)
	t39.Color = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(221, 240, 235) }
	effectsServiceEmit(p467, p468, t39)
	v1123:Destroy()
end
function module.EldritchBless(p469, p470)
	p470.Image = "rbxassetid://8717323465"
	p470.ImageColor3 = Color3.fromRGB(255, 156, 56)
	p470.ImageTransparency = 1
	p470.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p470, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t40: {[any]: any} = { Color3.fromRGB(98, 217, 19), Color3.fromRGB(255, 200, 0) }
	local n1 = p470.ZIndex + 10000

	CreateBlessingIcon(p469, p470, "rbxassetid://10664403297")
	effectsServicePulse(p469, p470, {
		Time = 1,
		FlashTime = 0.5,
		Color = t40,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.HorrorBless(p471, p472)
	p472.Image = "rbxassetid://8717323465"
	p472.ImageColor3 = Color3.fromRGB(218, 25, 76)
	p472.ImageTransparency = 1
	p472.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p472, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t41: {[any]: any} = { Color3.fromRGB(217, 17, 20), Color3.fromRGB(255, 71, 80) }
	local n1 = p472.ZIndex + 10000

	CreateBlessingIcon(p471, p472, "rbxassetid://16090468340")
	effectsServicePulse(p471, p472, {
		Time = 1,
		FlashTime = 0.5,
		Color = t41,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.HumbleBless(p473, p474)
	p474.Image = "rbxassetid://8717323465"
	p474.ImageColor3 = Color3.fromRGB(27, 113, 218)
	p474.ImageTransparency = 1
	p474.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p474, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t42: {[any]: any} = { Color3.fromRGB(17, 97, 217), Color3.fromRGB(71, 169, 255) }
	local n1 = p474.ZIndex + 10000

	CreateBlessingIcon(p473, p474, "rbxassetid://16090469639")
	effectsServicePulse(p473, p474, {
		Time = 1,
		FlashTime = 0.5,
		Color = t42,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.FlourishBless(p475, p476)
	p476.Image = "rbxassetid://8717323465"
	p476.ImageColor3 = Color3.fromRGB(26, 218, 54)
	p476.ImageTransparency = 1
	p476.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p476, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t43: {[any]: any} = { Color3.fromRGB(18, 217, 81), Color3.fromRGB(66, 255, 154) }
	local n1 = p476.ZIndex + 10000

	CreateBlessingIcon(p475, p476, "rbxassetid://16090473070")
	effectsServicePulse(p475, p476, {
		Time = 1,
		FlashTime = 0.5,
		Color = t43,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.ExubBless(p477, p478)
	p478.Image = "rbxassetid://8717323465"
	p478.ImageColor3 = Color3.fromRGB(218, 180, 27)
	p478.ImageTransparency = 1
	p478.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p478, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t44: {[any]: any} = { Color3.fromRGB(217, 200, 16), Color3.fromRGB(236, 255, 66) }
	local n1 = p478.ZIndex + 10000

	CreateBlessingIcon(p477, p478, "rbxassetid://16090471709")
	effectsServicePulse(p477, p478, {
		Time = 1,
		FlashTime = 0.5,
		Color = t44,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.BountBless(p479, p480)
	p480.Image = "rbxassetid://8717323465"
	p480.ImageColor3 = Color3.fromRGB(143, 217, 111)
	p480.ImageTransparency = 1
	p480.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p480, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t45: {[any]: any} = { Color3.fromRGB(217, 200, 16), Color3.fromRGB(236, 255, 66) }
	local n1 = p480.ZIndex + 10000

	CreateBlessingIcon(p479, p480, "rbxassetid://8772271242")
	effectsServicePulse(p479, p480, {
		Time = 1,
		FlashTime = 0.5,
		Color = t45,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.SiderealBless(p481, p482)
	p482.Image = "rbxassetid://8717323465"
	p482.ImageColor3 = Color3.fromRGB(0, 234, 255)
	p482.ImageTransparency = 1
	p482.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p482, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local t46: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 247) }
	local n1 = p482.ZIndex + 10000

	CreateBlessingIcon(p481, p482, "rbxassetid://10664532319")
	effectsServicePulse(p481, p482, {
		Time = 1,
		FlashTime = 0.5,
		Color = t46,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.VengefulBless(p483, p484)
	p484.Image = "rbxassetid://8717323465"
	p484.ImageColor3 = Color3.fromRGB(255, 0, 4)
	p484.ImageTransparency = 1
	p484.Visible = true
	audioService.PlaySound("immolate")
	animation.AnimateAsync(p484, { ImageTransparency = 0.4 }, 1, "Out", "Quart")
	CreateBlessingIcon(p483, p484, "rbxassetid://4773247381")
	spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t122: {[any]: any} = { Color3.fromRGB(240, 141, 70), Color3.fromRGB(202, 91, 27) }
		local v3657 = UDim2.fromOffset(p484.AbsoluteSize.X / 1.1, p484.AbsoluteSize.X / 1.1)
		local t123: {[any]: any} = {
			Strength = 45,
			Time = 0.5,
			Projectile = effectsServiceBreathimagesFire,
			Color = t122,
			Size = v3657
		}

		effectsServiceBreath(p483, p484, p484, t123)
		t123.Color = { Color3.fromRGB(204, 82, 58), Color3.fromRGB(217, 72, 23) }
		t123.Size = UDim2.fromOffset(p484.AbsoluteSize.X / 1.5, p484.AbsoluteSize.X / 1.5)
		effectsServiceBreath(p483, p484, p484, t123)
	end)
end
function module.DoomedBless(p485, p486)
	p486.Image = "rbxassetid://8717323465"
	p486.ImageColor3 = Color3.fromRGB(161, 63, 185)
	p486.ImageTransparency = 1
	p486.Visible = true
	audioService.PlaySound("immolate")
	animation.AnimateAsync(p486, { ImageTransparency = 0.4 }, 1, "Out", "Quart")
	CreateBlessingIcon(p485, p486, "rbxassetid://12252907376")
	spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t124: {[any]: any} = { Color3.fromRGB(240, 141, 70), Color3.fromRGB(202, 91, 27) }
		local v3661 = UDim2.fromOffset(p486.AbsoluteSize.X / 1.1, p486.AbsoluteSize.X / 1.1)
		local t125: {[any]: any} = {
			Strength = 45,
			Time = 0.5,
			Projectile = effectsServiceBreathimagesFire,
			Color = t124,
			Size = v3661
		}

		effectsServiceBreath(p485, p486, p486, t125)
		t125.Color = { Color3.fromRGB(204, 82, 58), Color3.fromRGB(217, 72, 23) }
		t125.Size = UDim2.fromOffset(p486.AbsoluteSize.X / 1.5, p486.AbsoluteSize.X / 1.5)
		effectsServiceBreath(p485, p486, p486, t125)
	end)
end
function module.VirtuousBless(p487, p488)
	p488.Image = "rbxassetid://8717323465"
	p488.ImageColor3 = Color3.fromRGB(211, 245, 255)
	p488.ImageTransparency = 1
	p488.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p488, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local t47: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(180, 249, 255) }
	local n1 = p488.ZIndex + 10000

	CreateBlessingIcon(p487, p488, "rbxassetid://7178236237")
	effectsServicePulse(p487, p488, {
		Time = 1,
		FlashTime = 0.5,
		Color = t47,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.EclipseBless(p489, p490)
	p490.Image = "rbxassetid://8717323465"
	p490.ImageColor3 = Color3.fromRGB(0, 0, 0)
	p490.ImageTransparency = 1
	p490.Visible = true
	animation.AnimateAsync(p490, { ImageTransparency = 0.2 }, 1, "Out", "Quart")
	CreateBlessingIcon(p489, p490, "rbxassetid://10664403297")
	task.spawn(function()
		module.RageborneEyeGlint(p489, p490)
	end)
end
function module.OmniBless(p491, p492)
	p492.Image = "rbxassetid://8717323465"
	p492.ImageColor3 = Color3.fromRGB(52, 106, 91)
	p492.ImageTransparency = 1
	p492.Visible = true
	animation.AnimateAsync(p492, { ImageTransparency = 0.2 }, 1, "Out", "Quart")
	CreateBlessingIcon(p491, p492, "rbxassetid://6523858394")
	task.spawn(function()
		module.RageborneEyeGlint(p491, p492)
	end)
end
function module.DevastatingBless(p493, p494)
	p494.Image = "rbxassetid://8717323465"
	p494.ImageColor3 = Color3.fromRGB(222, 123, 255)
	p494.ImageTransparency = 1
	p494.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p494, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local v1169 = UDim2.fromOffset(p494.AbsoluteSize.Y * 1.2, p494.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p494.AbsolutePosition.X, 0, p494.AbsolutePosition.Y)
	local uDim250 = UDim2.new(0, p494.AbsoluteSize.X * 0.5, 0, p494.AbsoluteSize.Y * 0.5)
	local v1172 = effectsServiceNewerCircle(p493, { BackgroundTransparency = 1, Size = v1169, Position = uDim2 + uDim250 })
	local t48: {[any]: any} = { Color3.fromRGB(220, 196, 255), Color3.fromRGB(255, 255, 255) }
	local v1174 = UDim2.fromOffset(p494.AbsoluteSize.X * 0.4, p494.AbsoluteSize.X * 0.4)

	CreateBlessingIcon(p493, p494, "rbxassetid://71535806157902")

	local t49: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 45,
		Speed = 1,
		EasingStyle = "Quad",
		Time = 0.5,
		Color = t48,
		Size = v1174,
		Range = v1172
	}

	effectsServiceEmit(p493, p494, t49)
	t49.Color = { Color3.fromRGB(40, 0, 240), Color3.fromRGB(240, 240, 240) }
	effectsServiceEmit(p493, p494, t49)
	v1172:Destroy()
end
function module.ChaoticBless(p495, p496)
	p496.Image = "rbxassetid://8717323465"
	p496.ImageColor3 = Color3.fromRGB(29, 211, 141)
	p496.ImageTransparency = 1
	p496.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p496, { ImageTransparency = 0.2 }, 1, "Out", "Quart")
	CreateBlessingIcon(p495, p496, "rbxassetid://11436196")

	local v1178 = UDim2.fromOffset(p496.AbsoluteSize.Y * 1.2, p496.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p496.AbsolutePosition.X, 0, p496.AbsolutePosition.Y)
	local uDim251 = UDim2.new(0, p496.AbsoluteSize.X * 0.5, 0, p496.AbsoluteSize.Y * 0.5)
	local v1181 = effectsServiceNewerCircle(p495, { BackgroundTransparency = 1, Size = v1178, Position = uDim2 + uDim251 })
	local t50: {[any]: any} = { Color3.fromRGB(0, 17, 255), Color3.fromRGB(255, 255, 255) }
	local v1183 = UDim2.fromOffset(p496.AbsoluteSize.X * 0.4, p496.AbsoluteSize.X * 0.4)
	local t51: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 45,
		Speed = 1,
		EasingStyle = "Quad",
		Time = 0.5,
		Color = t50,
		Size = v1183,
		Range = v1181
	}

	effectsServiceEmit(p495, p496, t51)
	t51.Color = { Color3.fromRGB(240, 0, 0), Color3.fromRGB(240, 240, 240) }
	effectsServiceEmit(p495, p496, t51)
	v1181:Destroy()
end
function module.ScintillantBless(p497, p498)
	p498.Image = "rbxassetid://8717323465"
	p498.ImageColor3 = Color3.fromRGB(53, 208, 255)
	p498.ImageTransparency = 1
	p498.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p498, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local v1187 = UDim2.fromOffset(p498.AbsoluteSize.Y * 1.2, p498.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p498.AbsolutePosition.X, 0, p498.AbsolutePosition.Y)
	local uDim252 = UDim2.new(0, p498.AbsoluteSize.X * 0.5, 0, p498.AbsoluteSize.Y * 0.5)
	local v1190 = effectsServiceNewerCircle(p497, { BackgroundTransparency = 1, Size = v1187, Position = uDim2 + uDim252 })
	local t52: {[any]: any} = { Color3.fromRGB(0, 17, 255), Color3.fromRGB(255, 255, 255) }
	local v1192 = UDim2.fromOffset(p498.AbsoluteSize.X * 0.4, p498.AbsoluteSize.X * 0.4)

	CreateBlessingIcon(p497, p498, "rbxassetid://10664543174")

	local t53: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 45,
		Speed = 1,
		EasingStyle = "Quad",
		Time = 0.5,
		Color = t52,
		Size = v1192,
		Range = v1190
	}

	effectsServiceEmit(p497, p498, t53)
	t53.Color = { Color3.fromRGB(240, 0, 0), Color3.fromRGB(240, 240, 240) }
	effectsServiceEmit(p497, p498, t53)
	v1190:Destroy()
end
function module.ArtisanBless(p499, p500)
	p500.Image = "rbxassetid://8717323465"
	p500.ImageColor3 = Color3.fromRGB(76, 217, 0)
	p500.ImageTransparency = 1
	p500.Visible = true
	audioService.PlaySound("bless")
	animation.AnimateAsync(p500, { ImageTransparency = 0.3 }, 1, "Out", "Quart")

	local v1196 = UDim2.fromOffset(p500.AbsoluteSize.Y * 1.2, p500.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p500.AbsolutePosition.X, 0, p500.AbsolutePosition.Y)
	local uDim253 = UDim2.new(0, p500.AbsoluteSize.X * 0.5, 0, p500.AbsoluteSize.Y * 0.5)
	local v1199 = effectsServiceNewerCircle(p499, { BackgroundTransparency = 1, Size = v1196, Position = uDim2 + uDim253 })
	local t54: {[any]: any} = { Color3.fromRGB(0, 17, 255), Color3.fromRGB(255, 255, 255) }
	local v1201 = UDim2.fromOffset(p500.AbsoluteSize.X * 0.4, p500.AbsoluteSize.X * 0.4)

	CreateBlessingIcon(p499, p500, "rbxassetid://10915829692")

	local t55: {[any]: any} = {
		Projectile = "rbxassetid://243728206",
		Strength = 45,
		Speed = 1,
		EasingStyle = "Quad",
		Time = 0.5,
		Color = t54,
		Size = v1201,
		Range = v1199
	}

	effectsServiceEmit(p499, p500, t55)
	t55.Color = { Color3.fromRGB(240, 0, 0), Color3.fromRGB(240, 240, 240) }
	effectsServiceEmit(p499, p500, t55)
	v1199:Destroy()
end
function module.SnowmanBless(p501, p502)
	p502.Image = "rbxassetid://8717323465"
	p502.ImageColor3 = Color3.fromRGB(37, 215, 218)
	p502.ImageTransparency = 1
	p502.Visible = true
	audioService.PlaySound("bless")
	audioService.PlaySound("Unfreeze")
	animation.AnimateAsync(p502, { ImageTransparency = 0.4 }, 1, "Out", "Quart")

	local t56: {[any]: any} = { Color3.fromRGB(127, 217, 203), Color3.fromRGB(32, 214, 255) }
	local n1 = p502.ZIndex + 10000

	CreateBlessingIcon(p501, p502, "rbxassetid://484856424")
	effectsServicePulse(p501, p502, {
		Time = 1,
		FlashTime = 0.5,
		Color = t56,
		Transparency = 0.5,
		ZIndex = n1
	})
end
function module.Bliss(p503)
	local t57: {[any]: any} = {
		Vector2.new(682.6, 341.3),
		Vector2.new(0, 682.6),
		Vector2.new(341.3, 682.6),
		Vector2.new(682.6, 682.6)
	}

	effectsServicePreloadTech(p503, { "rbxassetid://12593465689", "rbxassetid://12593465895" })

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1210 = uDim2New(1, 0, 2, 0)
	local v1211 = uDim2New(0.5, 0, 0.5, 0)
	local v1212 = effectsServiceNewerCircle(p503, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100000,
		BackgroundColor3 = color3,
		Size = v1210,
		Position = v1211
	})

	animation.AnimateAsync(v1212, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quint")

	local color336 = Color3.fromRGB(255, 0, 255)
	local v1214 = uDim2New(0.5, 0, 0.5, 0)
	local v1215 = uDim2New(0.5, 0, 0.5, -36)
	local parent = effectsServiceNewerCircle(p503, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://12593465689",
		Rotation = -180,
		ImageColor3 = color336,
		Size = v1214,
		Position = v1215,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local color337 = Color3.fromRGB(255, 0, 255)
	local v1218 = uDim2New(0.35, 0, 0.35, 0)
	local v1219 = uDim2New(0.6, 0, 0.65, -36)
	local v1220 = effectsServiceNewerCircle(p503, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://12593465895",
		Rotation = -180,
		ImageColor3 = color337,
		Size = v1218,
		Position = v1219,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = parent

	local uiAspectRatioConstraint2: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint2.Parent = v1220
	audioServicePlaySound("insanity")
	animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
	animation.AnimateAsync(v1220, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
	animation.AnimateAsync(parent, { Rotation = -360 }, 0.7, "Out", "Quint")
	animation.AnimateAsync(v1220, { Rotation = -360 }, 0.7, "Out", "Quint")
	task.wait(0.1)

	for i = 1, 9 do
		local vector2New = Vector2.new
		local floored = math.floor((i - 1) / 3)
		local vector2 = vector2New((i + 2) % 3 * 341.3, floored * 341.3)

		parent.ImageRectOffset = vector2
		v1220.ImageRectOffset = vector2

		if i == 5 then
			audioServicePlaySound("toon beep")
		end

		if i == 7 then
			audioServicePlaySound("SmallSlash")
		end

		task.wait(0.08)
	end

	task.spawn(function()
		for i = 2, 10 do
			parent.ImageRectOffset = Vector2.new(i % 2 * 341.3 + 341.3, 682.6)
			task.wait(0.08)
		end
	end)
	task.spawn(function()
		for i = 1, 8 do
			v1220.ImageRectOffset = t57[(i + 3) % 4 + 1]

			if i == 2 or i == 6 then
				audioServicePlaySound("SmallSlash")
			end

			task.wait(0.08)
		end
	end)
	wait(0.6)
	animation.AnimateAsync(parent, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
	animation.AnimateAsync(v1220, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
	animation.Animate(v1212, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
	parent:Destroy()
	v1220:Destroy()
	v1212:Destroy()
end
function module.BlissClaw(p504, _, p506, _)
	effectsServicePreloadTech(p504, { "rbxassetid://12593440477" })
	task.spawn(function()
		local color3 = Color3.fromRGB(255, 0, 55)
		local v3666 = uDim2New(0.3, 0, 0.3, 0)
		local v3667 = p506
		local uDim2 = UDim2.new(0, v3667.AbsolutePosition.X, 0, v3667.AbsolutePosition.Y)
		local uDim254 = UDim2.new(0, v3667.AbsoluteSize.X * 0.5, 0, v3667.AbsoluteSize.Y * 0.5)
		local parent = effectsServiceNewerCircle(p504, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 100001,
			Image = "rbxassetid://12593440477",
			Rotation = -270,
			ImageColor3 = color3,
			Size = v3666,
			Position = uDim2 + uDim254,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		uiAspectRatioConstraint.Parent = parent
		animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
		animation.AnimateAsync(parent, { Rotation = -360 }, 0.7, "Out", "Quint")
		task.wait(0.1)

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			parent.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)

			if i == 5 then
				audioServicePlaySound("MidSlash")
				effectsService.ShakeSync(p506, p506.Position, 0.2, 0.1)
			end

			task.wait(0.08)
		end

		animation.Animate(parent, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
		parent:Destroy()
	end)
end
local function BlissTrigger(p508, p509, _, _, p512)
	effectsServicePreloadTech(p508, { "rbxassetid://12593413918" })
	task.spawn(function()
		local t126: {[any]: any} = {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 100001,
			Image = "rbxassetid://12593413918",
			Rotation = 0,
			ImageColor3 = p512 or Color3.fromRGB(238, 0, 255),
			Size = uDim2New(0, p509.AbsoluteSize.Y, 0, p509.AbsoluteSize.Y)
		}
		local v3676 = p509
		local uDim2 = UDim2.new(0, v3676.AbsolutePosition.X, 0, v3676.AbsolutePosition.Y)
		local uDim255 = UDim2.new(0, v3676.AbsoluteSize.X * 0.5, 0, v3676.AbsoluteSize.Y * 0.5)

		v3676 = UDim2.fromOffset(0, p509.AbsoluteSize.Y / 4)
		t126.Position = uDim2 + uDim255 - v3676
		t126.ImageRectSize = Vector2.new(341.3, 341.3)

		local parent = effectsServiceNewerCircle(p508, t126)
		local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		uiAspectRatioConstraint.Parent = parent
		animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
		task.wait(0.1)
		audioServicePlaySound("toonybeep")

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			parent.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.08)
		end

		animation.Animate(parent, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
		parent:Destroy()
	end)
	task.wait(0.65)
end
function module.BlissTrigger(p513, p514, p515, p516)
	BlissTrigger(p513, p514, p515, p516)
end
function module.BlissTriggerGreen(p517, p518, p519, p520)
	BlissTrigger(p517, p518, p519, p520, Color3.fromRGB(89, 255, 0))
end
function module.BlissTriggerRed(p521, p522, p523, p524)
	BlissTrigger(p521, p522, p523, p524, Color3.fromRGB(255, 0, 111))
end
function module.BlissTriggerOrange(p525, p526, p527, p528)
	BlissTrigger(p525, p526, p527, p528, Color3.fromRGB(255, 150, 2))
end
function module.BlissCutAllies(p529, _, _, p532)
	effectsServicePreloadTech(p529, { "rbxassetid://12593403011" })

	local s1

	if p532 == "" then
		s1 = ""
	elseif p532 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local v1258 = p529.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local color3 = Color3.fromRGB(255, 42, 152)
	local v1260 = uDim2New(0, v1258.AbsoluteSize.Y * 1.25, 0, v1258.AbsoluteSize.Y * 1.25)
	local v1261 = UDim2.fromOffset(v1258.AbsolutePosition.X, v1258.AbsolutePosition.Y + v1258.AbsoluteSize.Y / 2)
	local parent = effectsServiceNewerCircle(p529, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://12593403011",
		Rotation = -180,
		ImageColor3 = color3,
		Size = v1260,
		Position = v1261,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = parent
	animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.2, "Out", "Quart")
	animation.AnimateAsync(parent, { Rotation = -360 }, 0.7, "Out", "Quint")
	task.wait(0.1)

	for i = 1, 4 do
		for j = 1, 9 do
			if j == 7 then
				audioServicePlaySound("MidSlash")
			end

			local vector2New = Vector2.new
			local floored = math.floor((j - 1) / 3)

			parent.ImageRectOffset = vector2New((j + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.04)
		end

		if i < 4 then
			local animationAnimateAsync = animation.AnimateAsync
			local parentPosition = parent.Position
			local v1270 = UDim2.fromOffset(v1258.AbsoluteSize.X / 3, 0)

			animationAnimateAsync(parent, { Position = parentPosition + v1270 }, 0.36, "Out", "Quint")
		end
	end

	animation.Animate(parent, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
	parent:Destroy()
end
function module.OnDeathTrappedSpirit(p533, _, p535, p536)
	local v1275 = p533.Parent.BattleNew["Virtual" .. (if p536 == "" then "Enemy" else "") .. "Graveyard"]
	local v1276 = UDim2.fromOffset(p535.AbsoluteSize.X, p535.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p535.AbsolutePosition.X, 0, p535.AbsolutePosition.Y)
	local uDim256 = UDim2.new(0, p535.AbsoluteSize.X * 0.5, 0, p535.AbsoluteSize.Y * 0.5)
	local v1279 = effectsServiceNewerCircle(p533, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1276,
		Position = uDim2 + uDim256
	})
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t58: {[any]: any} = { Color3.fromRGB(111, 66, 130), Color3.fromRGB(173, 135, 194) }
	local v1282 = UDim2.fromOffset(p535.AbsoluteSize.X / 1.5, p535.AbsoluteSize.X / 1.5)
	local t59: {[any]: any} = {
		Strength = 50,
		Speed = 0.9,
		EasingStyle = "Quad",
		Time = 0.4,
		Projectile = effectsServiceBreathimagesFire,
		Color = t58,
		Size = v1282,
		Range = v1279
	}

	effectsServiceEmit(p533, v1275, t59)
	effectsServiceEmit(p533, v1275, t59)
	audioServicePlaySound("demise")

	local animationAnimate = animation.Animate
	local color3 = Color3.fromRGB(44, 27, 68)

	animationAnimate(p535, { ImageColor3 = color3 }, 0.4, "Out", "Quad")
	v1279:Destroy()
end
function module.AddTrappedSpirit(p537, p538, _, p540)
	local v1290 = p537.Parent.BattleNew["Virtual" .. (if p540 == "" then "Enemy" else "") .. "Graveyard"]
	local v1291 = UDim2.fromOffset(p538.AbsoluteSize.X, p538.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p538.AbsolutePosition.X, 0, p538.AbsolutePosition.Y)
	local uDim257 = UDim2.new(0, p538.AbsoluteSize.X * 0.5, 0, p538.AbsoluteSize.Y * 0.5)
	local v1294 = effectsServiceNewerCircle(p537, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1291,
		Position = uDim2 + uDim257
	})
	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	local t60: {[any]: any} = { Color3.fromRGB(111, 66, 130), Color3.fromRGB(173, 135, 194) }
	local v1297 = UDim2.fromOffset(p538.AbsoluteSize.X / 1.5, p538.AbsoluteSize.X / 1.5)

	effectsServiceEmit(p537, v1290, {
		Strength = 90,
		Speed = 0.9,
		EasingStyle = "Quad",
		Time = 0.5,
		Projectile = effectsServiceBreathimagesSmog,
		Color = t60,
		Size = v1297,
		Range = v1294
	})
	audioServicePlaySound("demise2")
	effectsService.ShakeSync(p538, p538.Position, 0.2, 0.1)
	task.wait(0.2)
	v1294:Destroy()
end
function module.InfernoRing(p541, p542, p543, p544)
	module.ReleaseTrappedSpirit(p541, p542, p543, p544)
	task.wait(0.4)
	p542.ImageColor3 = Color3.fromRGB(255, 57, 8)

	local animationAnimateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(p542, { ImageColor3 = color3 }, 1.2, "Out", "Quad")
	module.SelfFire(p541, p542, p542, p544)
	effectsService.ShakeSync(p542, p542.Position, 0.5, 0.2)
	task.wait(0.2)
end
function module.ReleaseTrappedSpirit(p545, p546, _, p548)
	local t61: {[any]: any} = {
		"rbxassetid://12994074709",
		"rbxassetid://12994075991",
		"rbxassetid://12994077735",
		"rbxassetid://12994078543",
		"rbxassetid://12994079323",
		"rbxassetid://12901318391",
		"rbxassetid://12994382422",
		"rbxassetid://12994383516"
	}
	local v1309 = p545.Parent.BattleNew["Virtual" .. (if p548 == "" then "Enemy" else "") .. "Graveyard"]

	audioServicePlaySound("spawn05")

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1311 = uDim2New(0.3, 0, 0.3, 0)
	local v1312 = effectsServiceNewerCircle(p545, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3,
		Size = v1311,
		Position = v1309 and UDim2.new(0, v1309.AbsolutePosition.X, 0, v1309.AbsolutePosition.Y) + UDim2.new(0, v1309.AbsoluteSize.X * 0.5, 0, v1309.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color338 = Color3.fromRGB(0, 0, 0)
	local v1314 = uDim2New(0, 0, 0, 0)
	local v1315 = effectsServiceNewerCircle(p545, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		BackgroundColor3 = color338,
		Size = v1314,
		Position = v1309 and UDim2.new(0, v1309.AbsolutePosition.X, 0, v1309.AbsolutePosition.Y) + UDim2.new(0, v1309.AbsoluteSize.X * 0.5, 0, v1309.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
		ZIndex = v1309 and v1309.ZIndex + 10 or 10
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1317 = UDim2.fromOffset(v1312.AbsoluteSize.Y * 2, v1312.AbsoluteSize.Y * 2)

	animationAnimateAsync(v1315, { Size = v1317 }, 0.3, "Out", "Quint")
	animation.AnimateAsync(v1315, { ImageTransparency = 1 }, 0.3, "Out", "Linear")
	task.spawn(function()
		task.wait(0.3)
		v1315:Destroy()
	end)
	task.spawn(function()
		task.wait(0.3)
		audioServicePlaySound("heaven release")
	end)

	for _ = 1, 18 do
		task.wait()

		local color339 = Color3.fromRGB(0, 0, 0)
		local randomNumber = math.random(#t61)
		local v1321 = t61[randomNumber]
		local v1322 = UDim2.fromOffset(v1312.AbsoluteSize.Y / 3, v1312.AbsoluteSize.Y / 3)
		local v1323 = effectsServiceNewerCircle(p545, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			BackgroundColor3 = color339,
			Image = v1321,
			Size = v1322,
			Position = v1309 and UDim2.new(0, v1309.AbsolutePosition.X, 0, v1309.AbsolutePosition.Y) + UDim2.new(0, v1309.AbsoluteSize.X * 0.5, 0, v1309.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
			ZIndex = p546.ZIndex + 100000,
			Rotation = math.random(-180, 180)
		})
		local v1324 = randomPosOnTarget(v1312)

		task.spawn(function()
			animation.AnimateAsync(v1323, { Position = v1324 }, 0.2, "Out", "Quad")
			animation.AnimateAsync(v1323, { Rotation = 180 }, 0.3, "In", "Quad")
			task.wait(0.25)

			local animationAnimate = animation.Animate
			local v3685 = p546
			local uDim2 = UDim2.new(0, v3685.AbsolutePosition.X, 0, v3685.AbsolutePosition.Y)
			local uDim258 = UDim2.new(0, v3685.AbsoluteSize.X * 0.5, 0, v3685.AbsoluteSize.Y * 0.5)

			animationAnimate(v1323, { Position = uDim2 + uDim258 }, 0.3, "In", "Quad")

			local animationAnimateAsync = animation.AnimateAsync
			local randomNumber33 = math.random(540, 900)

			animationAnimateAsync(v1323, { Rotation = randomNumber33 }, 0.3, "In", "Quad")
			v1323:Destroy()
		end)
	end
end
function module.CherryBlossomAllyBaseplate(p549, p550, _, p552)
	local t62: {[any]: any} = {
		"rbxassetid://12994074709",
		"rbxassetid://12994075991",
		"rbxassetid://12994077735",
		"rbxassetid://12994078543",
		"rbxassetid://12994079323",
		"rbxassetid://12901318391",
		"rbxassetid://12994382422",
		"rbxassetid://12994383516"
	}
	local v1330 = p549.Parent.BattleNew["Virtual" .. (if p552 == "" then "" else "") .. "Baseplate"]

	audioServicePlaySound("spawn05")

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1332 = uDim2New(0.3, 0, 0.3, 0)
	local v1333 = effectsServiceNewerCircle(p549, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3,
		Size = v1332,
		Position = v1330 and UDim2.new(0, v1330.AbsolutePosition.X, 0, v1330.AbsolutePosition.Y) + UDim2.new(0, v1330.AbsoluteSize.X * 0.5, 0, v1330.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color340 = Color3.fromRGB(0, 0, 0)
	local v1335 = uDim2New(0, 0, 0, 0)
	local v1336 = effectsServiceNewerCircle(p549, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		BackgroundColor3 = color340,
		Size = v1335,
		Position = v1330 and UDim2.new(0, v1330.AbsolutePosition.X, 0, v1330.AbsolutePosition.Y) + UDim2.new(0, v1330.AbsoluteSize.X * 0.5, 0, v1330.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
		ZIndex = v1330 and v1330.ZIndex + 10 or 10
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1338 = UDim2.fromOffset(v1333.AbsoluteSize.Y * 2, v1333.AbsoluteSize.Y * 2)

	animationAnimateAsync(v1336, { Size = v1338 }, 0.3, "Out", "Quint")
	animation.AnimateAsync(v1336, { ImageTransparency = 1 }, 0.3, "Out", "Linear")
	task.spawn(function()
		task.wait(0.3)
		v1336:Destroy()
	end)
	task.spawn(function()
		task.wait(0.3)
		audioServicePlaySound("heaven release")
	end)

	for _ = 1, 18 do
		task.wait()

		local color341 = Color3.fromRGB(0, 0, 0)
		local randomNumber = math.random(#t62)
		local v1342 = t62[randomNumber]
		local v1343 = UDim2.fromOffset(v1333.AbsoluteSize.Y / 3, v1333.AbsoluteSize.Y / 3)
		local v1344 = effectsServiceNewerCircle(p549, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			BackgroundColor3 = color341,
			Image = v1342,
			Size = v1343,
			Position = v1330 and UDim2.new(0, v1330.AbsolutePosition.X, 0, v1330.AbsolutePosition.Y) + UDim2.new(0, v1330.AbsoluteSize.X * 0.5, 0, v1330.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
			ZIndex = p550.ZIndex + 100000,
			Rotation = math.random(-180, 180)
		})
		local v1345 = randomPosOnTarget(v1333)

		task.spawn(function()
			animation.AnimateAsync(v1344, { Position = v1345 }, 0.2, "Out", "Quad")
			animation.AnimateAsync(v1344, { Rotation = 180 }, 0.3, "In", "Quad")
			task.wait(0.25)

			local animationAnimate = animation.Animate
			local v3691 = p550
			local uDim2 = UDim2.new(0, v3691.AbsolutePosition.X, 0, v3691.AbsolutePosition.Y)
			local uDim259 = UDim2.new(0, v3691.AbsoluteSize.X * 0.5, 0, v3691.AbsoluteSize.Y * 0.5)

			animationAnimate(v1344, { Position = uDim2 + uDim259 }, 0.3, "In", "Quad")

			local animationAnimateAsync = animation.AnimateAsync
			local randomNumber34 = math.random(540, 900)

			animationAnimateAsync(v1344, { Rotation = randomNumber34 }, 0.3, "In", "Quad")
			v1344:Destroy()
		end)
	end
end
function module.ReleaseTrappedSpiritDemonLord(p553, p554, _, p556)
	local v1350 = p553.Parent.BattleNew["Virtual" .. (if p556 == "" then "Enemy" else "") .. "Graveyard"]

	audioServicePlaySound("spawn05")
	audioServicePlaySound("SpecialFighter")

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1352 = uDim2New(0.3, 0, 0.3, 0)
	local v1353 = effectsServiceNewerCircle(p553, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3,
		Size = v1352,
		Position = v1350 and UDim2.new(0, v1350.AbsolutePosition.X, 0, v1350.AbsolutePosition.Y) + UDim2.new(0, v1350.AbsoluteSize.X * 0.5, 0, v1350.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color342 = Color3.fromRGB(97, 255, 79)
	local v1355 = uDim2New(0, 0, 0, 0)
	local v1356 = effectsServiceNewerCircle(p553, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://12109926337",
		ImageColor3 = color342,
		Size = v1355,
		Position = v1350 and UDim2.new(0, v1350.AbsolutePosition.X, 0, v1350.AbsolutePosition.Y) + UDim2.new(0, v1350.AbsoluteSize.X * 0.5, 0, v1350.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
		ZIndex = p554.ZIndex + 100000
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1358 = UDim2.fromOffset(v1353.AbsoluteSize.Y * 2, v1353.AbsoluteSize.Y * 2)

	animationAnimateAsync(v1356, { Size = v1358 }, 0.75, "Out", "Quart")
	animation.AnimateAsync(v1356, { ImageTransparency = 1, Rotation = 360 }, 0.75, "Out", "Linear")
	task.spawn(function()
		task.wait(0.5)
		v1356:Destroy()
	end)
	task.spawn(function()
		task.wait(0.25)
		audioServicePlaySound("heaven release")
	end)
end
local function Scratch(p557, _, p559, _, p561, p562, p563, p564)
	effectsServicePreloadTech(p557, { "rbxassetid://12187816291", "rbxassetid://12191928694" })

	local n1 = p559.ZIndex + 10000
	local v1368 = uDim2New(0, p559.AbsoluteSize.X * 1.6, 0, p559.AbsoluteSize.X * 1.6)
	local uDim2 = UDim2.new(0, p559.AbsolutePosition.X, 0, p559.AbsolutePosition.Y)
	local uDim260 = UDim2.new(0, p559.AbsoluteSize.X * 0.5, 0, p559.AbsoluteSize.Y * 0.5)
	local v1371 = effectsServiceNewerCircle(p557, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12187816291",
		Rotation = 315,
		ZIndex = n1,
		ImageColor3 = p562,
		Size = v1368,
		Position = uDim2 + uDim260
	})
	local v1372 = v1371.Position
	local v1373 = v1371.Position

	v1368 = UDim2.fromOffset(v1371.AbsoluteSize.X / 3.5, v1371.AbsoluteSize.X / 3.5)
	v1371.Position = v1373 - v1368

	local n2 = p559.ZIndex + 10000
	local v1375 = uDim2New(0, p559.AbsoluteSize.X * 1.15, 0, p559.AbsoluteSize.X * 1.15)

	v1372 = effectsServiceNewerCircle(p557, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12191928694",
		Rotation = -45,
		ZIndex = n2,
		ImageColor3 = p562,
		Size = v1375,
		Position = v1371.Position
	})
	audioServicePlaySound("dbzswordout")
	animation.AnimateAsync(v1372, { ImageTransparency = 0 }, 0.1 * p561, "Out", "Quart")
	animation.AnimateAsync(v1372, { Rotation = -10 }, 0.35 * p561, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v1377 = v1371.Position
	local v1378 = UDim2.fromOffset(v1371.AbsoluteSize.X / 3, v1371.AbsoluteSize.X / 3)

	animationAnimate(v1372, { Position = v1377 - v1378 }, 0.35 * p561, "Out", "Quart")
	animation.AnimateAsync(v1372, { Rotation = -45 }, 0.2 * p561, "In", "Quint")

	local animate = animation.Animate

	v1377 = v1371.Position
	v1378 = UDim2.fromOffset(v1371.AbsoluteSize.X / 4, v1371.AbsoluteSize.X / 4)
	animate(v1372, { Position = v1377 - v1378 }, 0.2 * p561, "In", "Quad")
	v1372:Destroy()

	if p561 == 1 then
		effectsService.ShakeBattleSync(p557, 0.5, 0.025)
		audioServicePlaySound(p564)
	else
		audioServicePlaySound(p563)
	end

	v1372 = p559.Position
	v1373 = p559.Position
	v1368 = UDim2.fromOffset(p559.AbsoluteSize.X / 3 * p561, p559.AbsoluteSize.X / 3 * p561)
	p559.Position = v1373 + v1368
	animation.AnimateAsync(p559, { Position = v1372 }, 0.45 * p561, "Out", "Quart")
	v1371.ImageTransparency = 0
	v1372 = v1371.Position
	v1373 = v1371.Position
	v1368 = UDim2.fromOffset(v1371.AbsoluteSize.X / 4, v1371.AbsoluteSize.X / 4)
	v1371.Position = v1373 - v1368

	local animationAnimateAsync = animation.AnimateAsync

	v1377 = UDim2.fromOffset(v1371.AbsoluteSize.X / 1.8, v1371.AbsoluteSize.X / 1.8)
	animationAnimateAsync(v1371, { Position = v1372 + v1377 }, 0.6 * p561, "Out", "Quint")
	task.wait(0.7 * p561)
	task.spawn(function()
		animation.Animate(v1371, { ImageTransparency = 1 }, 0.5 * p561, "Out", "Quad")
		v1371:Destroy()
	end)
end
function module.LargeScratch(p565, p566, p567, p568)
	local color3 = Color3.fromRGB(255, 255, 255)

	Scratch(p565, p566, p567, p568, 1, color3, "MidSlash", "LargeSlash")
end
function module.MidScratch(p569, p570, p571, p572)
	local color3 = Color3.fromRGB(255, 255, 255)

	Scratch(p569, p570, p571, p572, 0.8, color3, "MidSlash", "LargeSlash")
end
function module.MidScratchEffect(p573, p574, p575, _)
	module.MidScratch(p573, p574, p575, nil, nil)
end
function module.SmallScratch(p577, p578, p579, p580)
	local color3 = Color3.fromRGB(255, 255, 255)

	Scratch(p577, p578, p579, p580, 0.6, color3, "MidSlash", "LargeSlash")
end
function module.SmallScratchEffectAlly(p581, p582, _, p584)
	local s1
	local s2

	if p584 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p584 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1406 = p581.Parent.BattleNew["Virtual" .. s2 .. "Field"]

	for _, v in pairs(p581.Parent.BattleNew["Virtual" .. s1 .. "Field"]) do
		for _, iterValue in pairs(_G.__NoFaces(p581.Parent.BattleNew[v])) do
			spawn(function()
				module.SmallScratch(p581, p582, iterValue, nil, nil)
			end)
		end
	end
end
function module.LargeDemonLordScratch(p585, p586, p587, p588)
	local color3 = Color3.fromRGB(0, 255, 0)

	Scratch(p585, p586, p587, p588, 1, color3, "MidSlash", "LargeSlash")
end
function module.MidDemonLordScratch(p589, p590, p591, p592)
	local color3 = Color3.fromRGB(0, 255, 0)

	Scratch(p589, p590, p591, p592, 0.8, color3, "MidSlash", "LargeSlash")
end
function module.SmallDemonLordScratch(p593, p594, p595, p596)
	local color3 = Color3.fromRGB(0, 255, 0)

	Scratch(p593, p594, p595, p596, 0.6, color3, "MidSlash", "LargeSlash")
end
function module.LargeFloofyScratch(p597, p598, p599, p600)
	local color3 = Color3.fromRGB(195, 56, 255)

	Scratch(p597, p598, p599, p600, 1, color3, "MidSlash", "LargeSlash")
end
function module.MidFloofyScratch(p601, p602, p603, p604)
	local color3 = Color3.fromRGB(195, 56, 255)

	Scratch(p601, p602, p603, p604, 0.8, color3, "MidSlash", "LargeSlash")
end
function module.SmallFloofyScratch(p605, p606, p607, p608)
	local color3 = Color3.fromRGB(195, 56, 255)

	Scratch(p605, p606, p607, p608, 0.6, color3, "MidSlash", "LargeSlash")
end
function module.LargeStalkerScratch(p609, p610, p611, p612)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p609, p610, p611, p612, 1, color3, "ClawStrike", "ClawStrike")
end
function module.MidStalkerScratch(p613, p614, p615, p616)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p613, p614, p615, p616, 0.8, color3, "ClawStrike", "ClawStrike")
end
function module.SmallStalkerScratch(p617, p618, p619, p620)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p617, p618, p619, p620, 0.6, color3, "ClawStrike", "ClawStrike")
end
function module.LargeLycanScratch(p621, p622, p623, p624)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p621, p622, p623, p624, 1, color3, "MidSlash", "LargeSlash")
end
function module.MidLycanScratch(p625, p626, p627, p628)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p625, p626, p627, p628, 0.8, color3, "MidSlash", "LargeSlash")
end
function module.SmallLycanScratch(p629, p630, p631, p632)
	local color3 = Color3.fromRGB(124, 25, 26)

	Scratch(p629, p630, p631, p632, 0.6, color3, "MidSlash", "LargeSlash")
end
local function PierceUpward(p633, _, p635, _, p637, p638, p639, p640, p641, p642, _, p644, p645)
	local n1 = p635.ZIndex + 10000
	local v1485 = uDim2New(0, p635.AbsoluteSize.X * p639, 0, p635.AbsoluteSize.X * p639)
	local uDim2 = UDim2.new(0, p635.AbsolutePosition.X, 0, p635.AbsolutePosition.Y)
	local uDim261 = UDim2.new(0, p635.AbsoluteSize.X * 0.5, 0, p635.AbsoluteSize.Y * 0.5)
	local v1488 = UDim2.fromOffset(p635.AbsoluteSize.X / 2, 0)
	local parent = effectsServiceNewerCircle(p633, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = -45,
		ClipsDescendants = true,
		ZIndex = n1,
		Image = p638,
		Size = v1485,
		Position = uDim2 + uDim261 - v1488
	})
	local n2 = p635.ZIndex + 100000
	local v1491 = UDim2.fromScale(1, 1)
	local v1492 = UDim2.fromScale(0, 0)
	local v1493 = effectsServiceNewCircle(p633, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = n2,
		Image = p638,
		Size = v1491,
		Position = v1492,
		Parent = parent
	})
	local animationAnimate = animation.Animate
	local v1495 = parent.Position
	local v1496 = UDim2.fromOffset(p635.AbsoluteSize.X / p644, 0)

	animationAnimate(parent, { Rotation = 20, Position = v1495 - v1496 }, 0.35 * p637, "Out", "Quint")
	animation.AnimateAsync(parent, { Rotation = 0 }, 0.01, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync

	v1488 = UDim2.fromScale(0.6, 0)
	animationAnimateAsync(v1493, { Rotation = 0, Position = v1488 }, 0.125, "In", "Quint")

	local animate = animation.Animate

	v1495 = parent.Position
	v1496 = UDim2.fromOffset(p635.AbsoluteSize.X / 1.5, 0)
	animate(parent, { Rotation = 0, Position = v1495 + v1496 }, 0.125, "In", "Quint")

	if p637 == 1 then
		audioServicePlaySound(p641)
	else
		audioServicePlaySound(p640)
	end

	local animateAsync = animation.AnimateAsync

	v1495 = p635.Position
	v1496 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637, 0)
	animateAsync(p635, { Position = v1495 + v1496 }, 0.2 * p637, "Out", "Quint")

	local v1500 = animation.Animate

	v1495 = parent.Position
	v1496 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637, 0)
	v1500(parent, { Position = v1495 + v1496 }, 0.2 * p637, "Out", "Quint")

	local v1501 = animation.AnimateAsync

	v1495 = p635.Position
	v1496 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637, 0)
	v1501(p635, { Position = v1495 - v1496 }, 0.3 * p637, "Out", "Quart")

	local v1502 = animation.AnimateAsync

	v1488 = UDim2.fromScale(0.65, 0)
	v1502(v1493, { Rotation = 0, Position = v1488 }, 0.5, "In", "Quad")

	if p637 == 1 then
		local v1503 = animation.AnimateAsync
		local v1504 = parent.Position
		local v1505 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 4)
		local v1506 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637)

		v1503(parent, { Position = v1504 - v1505 - v1506 }, 0.4 * p645, "InOut", "Quart")

		local v1507 = animation.Animate

		v1506 = p635.Position
		v1505 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 4)
		v1504 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637)
		v1507(p635, { Position = v1506 - v1505 - v1504 }, 0.4 * p645, "InOut", "Quart")

		local v1508 = animation.AnimateAsync
		local v1509 = parent.Position

		v1506 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 2)
		v1508(parent, { Position = v1509 + v1506 }, 0.04 * p645, "In", "Quart")

		local v1510 = animation.Animate

		v1509 = p635.Position
		v1506 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 2)
		v1510(p635, { Position = v1509 + v1506 }, 0.05 * p645, "In", "Quart")

		local v1511 = p635.Position
		local v1512 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 4)

		p635.Position = v1511 + v1512
		v1512 = p635.Position

		local v1513 = UDim2.fromOffset(0, p635.AbsoluteSize.Y / 2)

		effectsService.ShakeSync(p635, v1512 - v1513, 0.2, 0.1)
		audioServicePlaySound(p642)

		local v1514 = animation.Animate

		v1506 = parent.Position
		v1505 = UDim2.fromOffset(parent.AbsoluteSize.X / 1.75, 0)
		v1514(parent, { Rotation = -60, Position = v1506 - v1505 }, 0.5 * p645, "Out", "Quint")
	else
		local v1515 = animation.Animate
		local parentPosition = parent.Position
		local v1517 = UDim2.fromOffset(p635.AbsoluteSize.X / 2 * p637, 0)

		v1515(parent, { Position = parentPosition - v1517 }, 0.3 * p637, "Out", "Quart")
	end

	task.spawn(function()
		animation.Animate(v1493, { ImageTransparency = 1 }, 0.3 * p637, "In", "Quint")
		parent:Destroy()
	end)
end
function module.LargeRedKatana(p646, p647, p648, p649)
	PierceUpward(p646, p647, p648, p649, 1, "rbxassetid://12985622752", 2, "SwordPierce", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.LargeBlueKatana(p650, p651, p652, p653)
	PierceUpward(p650, p651, p652, p653, 1, "rbxassetid://13033471954", 2, "SwordPierce", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.LargeKatana(p654, p655, p656, p657)
	PierceUpward(p654, p655, p656, p657, 1, "rbxassetid://13121689040", 2, "SwordPierce", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.LargeRedKatanaEffect(p658, p659, p660, _)
	module.LargeRedKatana(p658, p659, p660, nil, nil)
end
function module.LargeBlueKatanaEffect(p662, p663, p664, _)
	module.LargeBlueKatana(p662, p663, p664, nil, nil)
end
function module.LargeKatanaEffect(p666, p667, p668, _)
	module.LargeKatana(p666, p667, p668, nil, nil)
end
function module.MidRedKatana(p670, p671, p672, p673)
	PierceUpward(p670, p671, p672, p673, 0.7, "rbxassetid://13033477429", 2, "SwordHit", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.MidBlueKatana(p674, p675, p676, p677)
	PierceUpward(p674, p675, p676, p677, 0.7, "rbxassetid://13033469127", 2, "SwordHit", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.MidKatana(p678, p679, p680, p681)
	PierceUpward(p678, p679, p680, p681, 0.7, "rbxassetid://13121687611", 2, "SwordHit", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.MidRedKatanaEffect(p682, p683, p684, _)
	module.MidRedKatana(p682, p683, p684, nil, nil)
end
function module.MidBlueKatanaEffect(p686, p687, p688, _)
	module.MidBlueKatana(p686, p687, p688, nil, nil)
end
function module.MidKatanaEffect(p690, p691, p692, _)
	module.MidKatana(p690, p691, p692, nil, nil)
end
function module.MidRedKatanaEnemyHandSingle(p694, p695, p696, p697)
	local s1
	local s2

	if p697 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p697 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1572 = p694.Parent.BattleNew["Virtual" .. s1 .. "Hand"]

	v1572 = p694.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	spawn(function()
		module.MidRedKatana(p694, p695, p696, nil, nil)
	end)
end
function module.MidBlueKatanaEnemyHandSingle(p698, p699, p700, p701)
	local s1
	local s2

	if p701 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p701 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1579 = p698.Parent.BattleNew["Virtual" .. s1 .. "Hand"]

	v1579 = p698.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	spawn(function()
		module.MidBlueKatana(p698, p699, p700, nil, nil)
	end)
end
function module.MidKatanaEnemyHandSingle(p702, p703, p704, p705)
	local s1
	local s2

	if p705 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p705 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1586 = p702.Parent.BattleNew["Virtual" .. s1 .. "Hand"]

	v1586 = p702.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	spawn(function()
		module.MidKatana(p702, p703, p704, nil, nil)
	end)
end
function module.SmallRedKatana(p706, p707, p708, p709)
	PierceUpward(p706, p707, p708, p709, 0.5, "rbxassetid://13033477429", 2, "SwordImpact", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.SmallBlueKatana(p710, p711, p712, p713)
	PierceUpward(p710, p711, p712, p713, 0.5, "rbxassetid://13033469127", 2, "SwordImpact", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.SmallKatana(p714, p715, p716, p717)
	PierceUpward(p714, p715, p716, p717, 0.5, "rbxassetid://13121687611", 2, "SwordImpact", "SwordPierce", "LargeSlash", 100, 0.9, 0.8)
end
function module.Ransack(p718, _, _, p721, p722)
	local u1604 = p718.Parent.BattleNew["Virtual" .. p721 .. "Graveyard"]
	local u1605 = nil
	local n1: number = 0

	if p721 == "" then
		local v1607 = u1604
		local uDim2 = UDim2.new(0, v1607.AbsolutePosition.X, 0, v1607.AbsolutePosition.Y)
		local uDim262 = UDim2.new(0, v1607.AbsoluteSize.X * 0.5, 0, v1607.AbsoluteSize.Y * 0.5)

		v1607 = UDim2.fromOffset(u1604.AbsoluteSize.X, -u1604.AbsoluteSize.Y / 1.5)
		u1605 = uDim2 + uDim262 + v1607
	elseif p721 == "Enemy" then
		local v1610 = u1604
		local uDim2 = UDim2.new(0, v1610.AbsolutePosition.X, 0, v1610.AbsolutePosition.Y)
		local uDim263 = UDim2.new(0, v1610.AbsoluteSize.X * 0.5, 0, v1610.AbsoluteSize.Y * 0.5)

		v1610 = UDim2.fromOffset(u1604.AbsoluteSize.X, -u1604.AbsoluteSize.Y / 1.5)
		u1605 = uDim2 + uDim263 - v1610
		n1 = 180
	end

	task.spawn(function()
		for _ = 1, p722 do
			task.spawn(function()
				local color3 = Color3.fromRGB(0, 0, 0)
				local v4208 = uDim2New(0, u1604.AbsoluteSize.Y * 2, 0, u1604.AbsoluteSize.Y * 2)
				local v4209 = u1605
				local randomNumber = math.random(n1 + -20, n1 + 5)
				local parent = effectsServiceNewerCircle(p718, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ZIndex = 100001,
					Image = "rbxassetid://12593440477",
					BackgroundColor3 = color3,
					Size = v4208,
					Position = v4209,
					ImageRectSize = Vector2.new(341.3, 341.3),
					Rotation = randomNumber
				})
				local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

				uiAspectRatioConstraint.Parent = parent
				audioServicePlaySound("MidSlash")

				for i = 1, 9 do
					local vector2New = Vector2.new
					local floored = math.floor((i - 1) / 3)

					parent.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
					task.wait(0.04)
				end

				parent:Destroy()
			end)
			task.wait(0.08)
		end
	end)
end
function module.BritishClub(p723, _, p725, _)
	local n1 = p725.ZIndex + 10000
	local v1618 = uDim2New(0, p725.AbsoluteSize.X * 1.5, 0, p725.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p725.AbsolutePosition.X, 0, p725.AbsolutePosition.Y)
	local uDim264 = UDim2.new(0, p725.AbsoluteSize.X * 0.5, 0, p725.AbsoluteSize.Y * 0.5)
	local v1621 = UDim2.fromOffset(p725.AbsoluteSize.X * 1.5, 0)
	local v1622 = effectsServiceNewerCircle(p723, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://12414054370",
		Rotation = -170,
		ZIndex = n1,
		Size = v1618,
		Position = uDim2 + uDim264 - v1621
	})
	local v1623 = p725.Position

	animation.AnimateAsync(v1622, { Rotation = -180 }, 0.2, "Out", "Quint")
	task.wait(0.1)
	v1623 = function()
		audioServicePlaySound("Swoosh")

		local animationAnimate = animation.Animate
		local v3698 = v1622.Position
		local v3699 = UDim2.fromOffset(p725.AbsoluteSize.X, 0)

		animationAnimate(v1622, { Rotation = 10, Position = v3698 + v3699 }, 0.3, "In", "Quint")
		animation.AnimateAsync(v1622, { Rotation = 0 }, 0.2, "Out", "Quint")
		audioServicePlaySound("headexplosion")
		effectsService.Shake(p725, p725.Position, 0.3, 0.3)
	end
	v1623()
	animation.AnimateAsync(v1622, { Rotation = -160 }, 0.4, "InOut", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local uDim265 = UDim2.new(0, p725.AbsolutePosition.X, 0, p725.AbsolutePosition.Y)
	local uDim266 = UDim2.new(0, p725.AbsoluteSize.X * 0.5, 0, p725.AbsoluteSize.Y * 0.5)
	local v1627 = UDim2.fromOffset(p725.AbsoluteSize.X * 1.5, 0)

	animationAnimateAsync(v1622, { Position = uDim265 + uDim266 - v1627 }, 0.4, "InOut", "Quad")
	task.wait(0.35)
	v1623()
	task.spawn(function()
		animation.Animate(v1622, { ImageTransparency = 1 }, 0.3, "Out", "Quad")
		v1622:Destroy()
	end)
end
function module.Motorcycle(p727, p728, _, _)
	audioServicePlaySound("Rev up")

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t63: {[any]: any} = { Color3.fromRGB(145, 145, 145), Color3.fromRGB(66, 66, 66) }
	local v1634 = UDim2.fromOffset(p728.AbsoluteSize.Y / 3, p728.AbsoluteSize.Y / 3)
	local v1635 = UDim2.fromOffset(0, 0)
	local v1636 = UDim2.fromOffset(p728.AbsolutePosition.X + p728.AbsoluteSize.X / 4, p728.AbsolutePosition.Y + p728.AbsoluteSize.Y)
	local v1637 = effectsServiceNewerCircle(p727, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1635,
		Position = v1636
	})
	local v1638 = UDim2.fromOffset(p728.AbsoluteSize.Y / 1.5, p728.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, p728.AbsolutePosition.X, 0, p728.AbsolutePosition.Y)
	local uDim267 = UDim2.new(0, p728.AbsoluteSize.X * 0.5, 0, p728.AbsoluteSize.Y * 0.5)
	local v1641 = UDim2.fromOffset(p728.AbsoluteSize.X * 1.5, -p728.AbsoluteSize.Y / 4)
	local v1642 = effectsServiceNewerCircle(p727, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1638,
		Position = uDim2 + uDim267 - v1641
	})
	local t64: {[any]: any} = {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = t63,
		Size = v1634
	}

	task.spawn(function()
		effectsServiceBreath(p727, v1637, v1642, t64)

		if math.random(1, 100) == 1 then
			audioServicePlaySound("bad_to_bone")
		end
	end)

	local animationAnimate = animation.Animate

	v1641 = p728.Position

	local v1645 = UDim2.fromOffset(p728.AbsoluteSize.X / 4, p728.AbsoluteSize.X / 8)

	animationAnimate(p728, { Rotation = -30, Position = v1641 - v1645 }, 0.3, "Out", "Quint")

	local animate = animation.Animate

	v1641 = p728.Position
	v1645 = UDim2.fromOffset(p728.AbsoluteSize.X / 4, p728.AbsoluteSize.X / 8)
	animate(p728, { Rotation = 0, Position = v1641 + v1645 }, 0.3, "In", "Quint")
end
function module.Bicycle(p731, p732, _, _)
	audioServicePlaySound("Bell Sound")

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t65: {[any]: any} = { Color3.fromRGB(208, 208, 208), Color3.fromRGB(168, 168, 168) }
	local v1653 = UDim2.fromOffset(p732.AbsoluteSize.Y / 3, p732.AbsoluteSize.Y / 3)
	local v1654 = UDim2.fromOffset(0, 0)
	local v1655 = UDim2.fromOffset(p732.AbsolutePosition.X + p732.AbsoluteSize.X / 4, p732.AbsolutePosition.Y + p732.AbsoluteSize.Y)
	local v1656 = effectsServiceNewerCircle(p731, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1654,
		Position = v1655
	})
	local v1657 = UDim2.fromOffset(p732.AbsoluteSize.Y / 1.5, p732.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, p732.AbsolutePosition.X, 0, p732.AbsolutePosition.Y)
	local uDim268 = UDim2.new(0, p732.AbsoluteSize.X * 0.5, 0, p732.AbsoluteSize.Y * 0.5)
	local v1660 = UDim2.fromOffset(p732.AbsoluteSize.X * 1.5, -p732.AbsoluteSize.Y / 4)
	local v1661 = effectsServiceNewerCircle(p731, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1657,
		Position = uDim2 + uDim268 - v1660
	})
	local t66: {[any]: any} = {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = t65,
		Size = v1653
	}

	task.spawn(function()
		audioServicePlaySound("BicycleDing")
		effectsServiceBreath(p731, v1656, v1661, t66)
		task.wait(0.2)
		audioServicePlaySound("BicycleDing")

		if math.random(1, 100) == 1 then
			audioServicePlaySound("bad_to_bone")
		end
	end)

	local animationAnimate = animation.Animate

	v1660 = p732.Position

	local v1664 = UDim2.fromOffset(p732.AbsoluteSize.X / 4, p732.AbsoluteSize.X / 8)

	animationAnimate(p732, { Rotation = -30, Position = v1660 - v1664 }, 0.3, "Out", "Quint")
	audioServicePlaySound("BoardStop")

	local animate = animation.Animate

	v1660 = p732.Position
	v1664 = UDim2.fromOffset(p732.AbsoluteSize.X / 4, p732.AbsoluteSize.X / 8)
	animate(p732, { Rotation = 0, Position = v1660 + v1664 }, 0.3, "In", "Quint")
end
local function ScanGraveyard(p735, p736, _, p738, p739)
	if not p739 then
		p739 = Color3.fromRGB(255, 255, 255)
	end

	local v1671 = p735.Parent.BattleNew["Virtual" .. p738 .. "Graveyard"]
	local n1 = p736.ZIndex + 10000000
	local v1673 = uDim2New(0, p736.AbsoluteSize.X, 0, p736.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p736.AbsolutePosition.X, 0, p736.AbsolutePosition.Y)
	local uDim269 = UDim2.new(0, p736.AbsoluteSize.X * 0.5, 0, p736.AbsoluteSize.Y * 0.5)
	local v1676 = effectsServiceNewerCircle(p735, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12551054284",
		Rotation = 0,
		ZIndex = n1,
		Size = v1673,
		Position = uDim2 + uDim269
	})
	local n2 = p736.ZIndex + 10000001
	local v1678 = uDim2New(0, p736.AbsoluteSize.X, 0, p736.AbsoluteSize.X)
	local uDim270 = UDim2.new(0, p736.AbsolutePosition.X, 0, p736.AbsolutePosition.Y)
	local uDim271 = UDim2.new(0, p736.AbsoluteSize.X * 0.5, 0, p736.AbsoluteSize.Y * 0.5)
	local v1681 = effectsServiceNewerCircle(p735, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12551054359",
		Rotation = 0,
		ZIndex = n2,
		ImageColor3 = p739,
		Size = v1678,
		Position = uDim270 + uDim271
	})

	v1673 = v1676.ZIndex + 1
	audioServicePlaySound("scan")

	local animationAnimateAsync = animation.AnimateAsync
	local uDim272 = UDim2.new(0, v1671.AbsolutePosition.X, 0, v1671.AbsolutePosition.Y)
	local uDim273 = UDim2.new(0, v1671.AbsoluteSize.X * 0.5, 0, v1671.AbsoluteSize.Y * 0.5)

	animationAnimateAsync(v1676, { ImageTransparency = 0, Position = uDim272 + uDim273 }, 0.7, "Out", "Quart")

	local animateAsync = animation.AnimateAsync
	local uDim274 = UDim2.new(0, v1671.AbsolutePosition.X, 0, v1671.AbsolutePosition.Y)
	local uDim275 = UDim2.new(0, v1671.AbsoluteSize.X * 0.5, 0, v1671.AbsoluteSize.Y * 0.5)

	animateAsync(v1681, { ImageTransparency = 0, Position = uDim274 + uDim275 }, 0.7, "Out", "Quart")
	animation.AnimateAsync(v1676, { Rotation = 720 }, 2, "Out", "Linear")
	animation.AnimateAsync(v1681, { Rotation = -720 }, 2, "Out", "Linear")
	task.wait(1)
	audioServicePlaySound("scan complete")

	local t67: {[any]: any} = {
		Time = 1,
		FlashTime = 0.3,
		Transparency = 0.6,
		ZIndex = v1673,
		SizeMultiplier = 1.3,
		Color = p739
	}

	task.spawn(function()
		effectsServicePulse(p735, v1681, t67)
	end)
	task.spawn(function()
		animation.AnimateAsync(v1676, { ImageTransparency = 1 }, 1, "In", "Quart")
		animation.Animate(v1681, { ImageTransparency = 1 }, 1, "In", "Quart")
		v1676:Destroy()
		v1681:Destroy()
	end)
end
function module.ScanGraveyard(p740, p741, p742, p743)
	ScanGraveyard(p740, p741, p742, p743)
end
local function QuickScanGraveyard(p744, p745, _, p747, p748)
	if not p748 then
		p748 = Color3.fromRGB(255, 255, 255)
	end

	local v1698 = p744.Parent.BattleNew["Virtual" .. p747 .. "Graveyard"]
	local n1 = p745.ZIndex + 10000000
	local v1700 = uDim2New(0, p745.AbsoluteSize.X, 0, p745.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, v1698.AbsolutePosition.X, 0, v1698.AbsolutePosition.Y)
	local uDim276 = UDim2.new(0, v1698.AbsoluteSize.X * 0.5, 0, v1698.AbsoluteSize.Y * 0.5)
	local v1703 = effectsServiceNewerCircle(p744, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12551054284",
		Rotation = 0,
		ZIndex = n1,
		Size = v1700,
		Position = uDim2 + uDim276
	})
	local n2 = p745.ZIndex + 10000001
	local v1705 = uDim2New(0, p745.AbsoluteSize.X, 0, p745.AbsoluteSize.X)
	local uDim277 = UDim2.new(0, v1698.AbsolutePosition.X, 0, v1698.AbsolutePosition.Y)
	local uDim278 = UDim2.new(0, v1698.AbsoluteSize.X * 0.5, 0, v1698.AbsoluteSize.Y * 0.5)
	local v1708 = effectsServiceNewerCircle(p744, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12551054359",
		Rotation = 0,
		ZIndex = n2,
		ImageColor3 = p748,
		Size = v1705,
		Position = uDim277 + uDim278
	})
	local n3 = v1703.ZIndex + 1

	animation.AnimateAsync(v1703, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(v1708, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(v1703, { Rotation = 720 }, 1.5, "Out", "Linear")
	animation.AnimateAsync(v1708, { Rotation = -720 }, 1.5, "Out", "Linear")
	audioServicePlaySound("spawn05")

	local t68: {[any]: any} = {
		Time = 1,
		FlashTime = 0.3,
		Transparency = 0.6,
		ZIndex = n3,
		SizeMultiplier = 1.3,
		Color = p748
	}

	task.spawn(function()
		effectsServicePulse(p744, v1708, t68)
		animation.AnimateAsync(v1703, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		animation.Animate(v1708, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		v1703:Destroy()
		v1708:Destroy()
	end)
	task.wait(0.2)
end
function module.QuickScanGraveyard(p749, p750, p751, p752)
	QuickScanGraveyard(p749, p750, p751, p752)
end
function module.Datasurge(p753, p754, p755, p756)
	local v1719 = p753.Parent.BattleNew["Virtual" .. p756 .. "Graveyard"]
	local color3 = Color3.fromRGB(0, 229, 255)
	local v1721 = uDim2New(0, 0, 0, 0)
	local v1722 = effectsServiceNewerCircle(p753, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v1721,
		Position = v1719 and UDim2.new(0, v1719.AbsolutePosition.X, 0, v1719.AbsolutePosition.Y) + UDim2.new(0, v1719.AbsoluteSize.X * 0.5, 0, v1719.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color343 = Color3.fromRGB(0, 0, 255)

	v1721 = uDim2New(0, 0, 0, 0)

	local v1724 = effectsServiceNewerCircle(p753, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000000,
		ImageColor3 = color343,
		Size = v1721,
		Position = v1719 and UDim2.new(0, v1719.AbsolutePosition.X, 0, v1719.AbsolutePosition.Y) + UDim2.new(0, v1719.AbsoluteSize.X * 0.5, 0, v1719.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})

	task.spawn(function()
		QuickScanGraveyard(p753, p754, p755, p756, Color3.fromRGB(0, 229, 255))
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v1726 = UDim2.fromOffset(v1719.AbsoluteSize.Y * 1.9, v1719.AbsoluteSize.Y * 1.9)

	animationAnimateAsync(v1724, { ImageTransparency = 1, Size = v1726 }, 1, "Out", "Quint")
	task.wait(0.1)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v3701 = UDim2.fromOffset(v1719.AbsoluteSize.Y * 2, v1719.AbsoluteSize.Y * 2)

		animationAnimate(v1722, { ImageTransparency = 1, Size = v3701 }, 1, "Out", "Quint")
		v1722:Destroy()
		v1724:Destroy()
	end)
	task.wait(0.2)
end
function module.SingleInject(p757, _, p759, _)
	local t69: {[any]: any} = { Color3.fromRGB(82, 181, 85), Color3.fromRGB(51, 248, 20) }
	local v1732 = UDim2.fromOffset(p759.AbsoluteSize.X / 8, p759.AbsoluteSize.X / 8)

	audioServicePlaySound("wet")
	effectsServiceBreath(p757, p759, p759, {
		Projectile = "rbxassetid://511406127",
		Strength = 100,
		Time = 0.25,
		Speed = 0.35,
		Lifetime = 0.8,
		Transparency = 0.45,
		EasingStyle = "Quint",
		Color = t69,
		Size = v1732
	})
	effectsService.Shake(p759, p759.Position, 0.3, 0.1)

	if not p759:FindFirstChild("Zombified") then
		task.wait(0.4)
		audioServicePlaySound("recreation")

		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(90, 49, 170)

		animationAnimateAsync(p759, { ImageColor3 = color3 }, 0.5, "Out", "Quad")
		effectsService.ShakeSync(p759, p759.Position, 0.5, 0.15)
	end
end
function module.OldLadyShout(p761, p762, p763, p764)
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(-10, 10)
	local t70: {[any]: any} = {
		Text = "#$@?!",
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		Rotation = randomNumber,
		ZIndex = p762.ZIndex + 10000
	}

	if math.random(1, 2) == 1 then
		audioServicePlaySound("ladyscream")
	else
		audioServicePlaySound("ladyscream2")
	end

	effectsServiceSpeak(p761, p762, p763, p764, t70, 0.2)
end
function module.OldLadyShoutCar(p765, p766, p767, p768)
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(-10, 10)
	local t71: {[any]: any} = {
		Text = "#$@?!",
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		Rotation = randomNumber,
		ZIndex = p766.ZIndex + 10000
	}

	if math.random(1, 2) == 1 then
		audioServicePlaySound("ladyscream")
	else
		audioServicePlaySound("ladyscream2")
	end

	audioServicePlaySound("CarHorn")
	effectsServiceSpeak(p765, p766, p767, p768, t71, 0.2)
end
function module.AlexTransformGoodCheck(p769, p770, _, _)
	local t72: {[any]: any} = {
		"FastSplat",
		"Kerplunk.wav",
		"snap.wav",
		"bass.wav",
		"button.wav",
		"Short spring sound.wav",
		"Woosh"
	}
	local randomNumber = math.random(1, #t72)

	audioServicePlaySound(t72[randomNumber])
	p770.Rotation = math.random(-30, 30)
	animation.AnimateAsync(p770, { Rotation = 0 }, 0.5, "Out", "Quint")
	audioServicePlaySound("PreMagic")

	for i = 1, 2 do
		task.spawn(function()
			local n1 = p770.ZIndex + 100001
			local v3703 = UDim2.fromOffset(p770.AbsoluteSize.X, p770.AbsoluteSize.X)
			local v3704 = p770
			local uDim2 = UDim2.new(0, v3704.AbsolutePosition.X, 0, v3704.AbsolutePosition.Y)
			local uDim279 = UDim2.new(0, v3704.AbsoluteSize.X * 0.5, 0, v3704.AbsoluteSize.Y * 0.5)
			local randomNumber35 = math.random(0, 360)
			local v3708 = effectsServiceNewerCircle(p769, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v3703,
				Position = uDim2 + uDim279,
				Rotation = randomNumber35
			})

			v3704 = p770.ZIndex + 100001

			local v3709 = UDim2.fromOffset(p770.AbsoluteSize.X, p770.AbsoluteSize.X)
			local v3710 = p770
			local uDim280 = UDim2.new(0, v3710.AbsolutePosition.X, 0, v3710.AbsolutePosition.Y)
			local uDim281 = UDim2.new(0, v3710.AbsoluteSize.X * 0.5, 0, v3710.AbsoluteSize.Y * 0.5)
			local color3 = Color3.fromRGB(13, 255, 0)
			local v3714 = effectsServiceNewerCircle(p769, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3704,
				Size = v3709,
				Position = uDim280 + uDim281,
				Rotation = i * 90 + 180,
				ImageColor3 = color3
			})

			v3710 = p770.ZIndex + 100001

			local v3715 = UDim2.fromOffset(p770.AbsoluteSize.X, p770.AbsoluteSize.X)
			local v3716 = p770
			local uDim282 = UDim2.new(0, v3716.AbsolutePosition.X, 0, v3716.AbsolutePosition.Y)
			local uDim283 = UDim2.new(0, v3716.AbsoluteSize.X * 0.5, 0, v3716.AbsoluteSize.Y * 0.5)
			local color344 = Color3.fromRGB(120, 255, 105)
			local v3720 = effectsServiceNewerCircle(p769, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3710,
				Size = v3715,
				Position = uDim282 + uDim283,
				ImageColor3 = color344,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3716 = UDim2.fromOffset(p770.AbsoluteSize.Y * 1.5, p770.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v3708, { Size = v3716, Rotation = v3708.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v3716 = UDim2.fromOffset(p770.AbsoluteSize.Y * 1.1, p770.AbsoluteSize.Y * 1.1)
			animateAsync(v3714, { Size = v3716, Rotation = v3714.Rotation + 360 }, 1, "Out", "Quint")

			local v3723 = animation.AnimateAsync

			v3716 = UDim2.fromOffset(p770.AbsoluteSize.Y * 1.1, p770.AbsoluteSize.Y * 1.1)
			v3723(v3720, { Size = v3716, Rotation = v3720.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v3708, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v3714, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v3720, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v3708:Destroy()
				v3714:Destroy()
				v3720:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.AlexTransformGood(p773, p774, p775, p776)
	local t73: {[any]: any} = {
		"FastSplat",
		"Kerplunk.wav",
		"snap.wav",
		"bass.wav",
		"button.wav",
		"Short spring sound.wav",
		"Woosh"
	}
	local t74: {[any]: any} = {
		"*transforms*",
		"good night",
		"it's alexing time!",
		"let's go",
		"i ENJOY targeting",
		"gg, shake my hand",
		"haha i win"
	}
	local randomNumber = math.random(1, #t74)
	local v1765 = t74[randomNumber]
	local legacy = Enum.Font.Legacy
	local v1767 = UDim2.fromOffset(p774.AbsoluteSize.X * 1.5, p774.AbsoluteSize.Y / 3)
	local color3 = Color3.fromRGB(140, 255, 138)
	local randomNumber36 = math.random(-10, 10)
	local n1 = p774.ZIndex + 100002
	local randomNumber37 = math.random(1, #t73)

	audioServicePlaySound(t73[randomNumber37])

	local t75: {[any]: any} = {
		Text = v1765,
		Font = legacy,
		Size = v1767,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		Rotation = randomNumber36,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServiceSpeak(p773, p774, p775, p776, t75, 0.65)
	end)
	p774.Rotation = math.random(-30, 30)
	animation.AnimateAsync(p774, { Rotation = 0 }, 0.5, "Out", "Quint")
	task.wait(0.3)
	audioServicePlaySound("PreMagic")

	for i = 1, 2 do
		task.spawn(function()
			local n1 = p774.ZIndex + 100001
			local v3725 = UDim2.fromOffset(p774.AbsoluteSize.X, p774.AbsoluteSize.X)
			local v3726 = p774
			local uDim2 = UDim2.new(0, v3726.AbsolutePosition.X, 0, v3726.AbsolutePosition.Y)
			local uDim284 = UDim2.new(0, v3726.AbsoluteSize.X * 0.5, 0, v3726.AbsoluteSize.Y * 0.5)
			local randomNumber38 = math.random(0, 360)
			local v3730 = effectsServiceNewerCircle(p773, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v3725,
				Position = uDim2 + uDim284,
				Rotation = randomNumber38
			})

			v3726 = p774.ZIndex + 100001

			local v3731 = UDim2.fromOffset(p774.AbsoluteSize.X, p774.AbsoluteSize.X)
			local v3732 = p774
			local uDim285 = UDim2.new(0, v3732.AbsolutePosition.X, 0, v3732.AbsolutePosition.Y)
			local uDim286 = UDim2.new(0, v3732.AbsoluteSize.X * 0.5, 0, v3732.AbsoluteSize.Y * 0.5)
			local color345 = Color3.fromRGB(13, 255, 0)
			local v3736 = effectsServiceNewerCircle(p773, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3726,
				Size = v3731,
				Position = uDim285 + uDim286,
				Rotation = i * 90 + 180,
				ImageColor3 = color345
			})

			v3732 = p774.ZIndex + 100001

			local v3737 = UDim2.fromOffset(p774.AbsoluteSize.X, p774.AbsoluteSize.X)
			local v3738 = p774
			local uDim287 = UDim2.new(0, v3738.AbsolutePosition.X, 0, v3738.AbsolutePosition.Y)
			local uDim288 = UDim2.new(0, v3738.AbsoluteSize.X * 0.5, 0, v3738.AbsoluteSize.Y * 0.5)
			local color346 = Color3.fromRGB(120, 255, 105)
			local v3742 = effectsServiceNewerCircle(p773, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3732,
				Size = v3737,
				Position = uDim287 + uDim288,
				ImageColor3 = color346,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3738 = UDim2.fromOffset(p774.AbsoluteSize.Y * 1.5, p774.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v3730, { Size = v3738, Rotation = v3730.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v3738 = UDim2.fromOffset(p774.AbsoluteSize.Y * 1.1, p774.AbsoluteSize.Y * 1.1)
			animateAsync(v3736, { Size = v3738, Rotation = v3736.Rotation + 360 }, 1, "Out", "Quint")

			local v3745 = animation.AnimateAsync

			v3738 = UDim2.fromOffset(p774.AbsoluteSize.Y * 1.1, p774.AbsoluteSize.Y * 1.1)
			v3745(v3742, { Size = v3738, Rotation = v3742.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v3730, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v3736, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v3742, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v3730:Destroy()
				v3736:Destroy()
				v3742:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.AlexTransformBadCheck(p777, p778, _, _)
	local t76: {[any]: any} = {
		"FastSplat",
		"Kerplunk.wav",
		"snap.wav",
		"bass.wav",
		"button.wav",
		"Short spring sound.wav",
		"Woosh"
	}
	local randomNumber = math.random(1, #t76)

	audioServicePlaySound(t76[randomNumber])
	p778.Rotation = math.random(-30, 30)
	animation.AnimateAsync(p778, { Rotation = 0 }, 0.5, "Out", "Quint")
	audioServicePlaySound("PreMagic")

	for i = 1, 2 do
		task.spawn(function()
			local n1 = p778.ZIndex + 100001
			local v3747 = UDim2.fromOffset(p778.AbsoluteSize.X, p778.AbsoluteSize.X)
			local v3748 = p778
			local uDim2 = UDim2.new(0, v3748.AbsolutePosition.X, 0, v3748.AbsolutePosition.Y)
			local uDim289 = UDim2.new(0, v3748.AbsoluteSize.X * 0.5, 0, v3748.AbsoluteSize.Y * 0.5)
			local randomNumber39 = math.random(0, 360)
			local color3 = Color3.fromRGB(17, 38, 18)
			local v3753 = effectsServiceNewerCircle(p777, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v3747,
				Position = uDim2 + uDim289,
				Rotation = randomNumber39,
				ImageColor3 = color3
			})

			v3748 = p778.ZIndex + 100001

			local v3754 = UDim2.fromOffset(p778.AbsoluteSize.X, p778.AbsoluteSize.X)
			local v3755 = p778
			local uDim290 = UDim2.new(0, v3755.AbsolutePosition.X, 0, v3755.AbsolutePosition.Y)
			local uDim291 = UDim2.new(0, v3755.AbsoluteSize.X * 0.5, 0, v3755.AbsoluteSize.Y * 0.5)
			local color347 = Color3.fromRGB(6, 93, 0)
			local v3759 = effectsServiceNewerCircle(p777, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3748,
				Size = v3754,
				Position = uDim290 + uDim291,
				Rotation = i * 90 + 180,
				ImageColor3 = color347
			})

			v3755 = p778.ZIndex + 100001

			local v3760 = UDim2.fromOffset(p778.AbsoluteSize.X, p778.AbsoluteSize.X)
			local v3761 = p778
			local uDim292 = UDim2.new(0, v3761.AbsolutePosition.X, 0, v3761.AbsolutePosition.Y)
			local uDim293 = UDim2.new(0, v3761.AbsoluteSize.X * 0.5, 0, v3761.AbsoluteSize.Y * 0.5)
			local color348 = Color3.fromRGB(0, 48, 0)
			local v3765 = effectsServiceNewerCircle(p777, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3755,
				Size = v3760,
				Position = uDim292 + uDim293,
				ImageColor3 = color348,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3761 = UDim2.fromOffset(p778.AbsoluteSize.Y * 1.5, p778.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v3753, { Size = v3761, Rotation = v3753.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v3761 = UDim2.fromOffset(p778.AbsoluteSize.Y * 1.1, p778.AbsoluteSize.Y * 1.1)
			animateAsync(v3759, { Size = v3761, Rotation = v3759.Rotation + 360 }, 1, "Out", "Quint")

			local v3768 = animation.AnimateAsync

			v3761 = UDim2.fromOffset(p778.AbsoluteSize.Y * 1.1, p778.AbsoluteSize.Y * 1.1)
			v3768(v3765, { Size = v3761, Rotation = v3765.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v3753, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v3759, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v3765, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v3753:Destroy()
				v3759:Destroy()
				v3765:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.AlexTransformBad(p781, p782, p783, p784)
	local t77: {[any]: any} = {
		"FastSplat",
		"Kerplunk.wav",
		"snap.wav",
		"bass.wav",
		"button.wav",
		"Short spring sound.wav",
		"Woosh"
	}
	local t78: {[any]: any} = {
		"*transforms*",
		"bad night",
		"*GETS ANGRY*",
		"die.",
		"die n00b",
		"die nerd",
		"ggez",
		"I HATE LUNAR CARDS"
	}
	local randomNumber = math.random(1, #t78)
	local v1788 = t78[randomNumber]
	local legacy = Enum.Font.Legacy
	local v1790 = UDim2.fromOffset(p782.AbsoluteSize.X * 1.5, p782.AbsoluteSize.Y / 3)
	local color3 = Color3.fromRGB(162, 0, 0)
	local randomNumber40 = math.random(-10, 10)
	local n1 = p782.ZIndex + 100002
	local randomNumber41 = math.random(1, #t77)

	audioServicePlaySound(t77[randomNumber41])

	local t79: {[any]: any} = {
		Text = v1788,
		Font = legacy,
		Size = v1790,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		Rotation = randomNumber40,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServiceSpeak(p781, p782, p783, p784, t79, 0.65)
	end)
	p782.Rotation = math.random(-30, 30)
	animation.AnimateAsync(p782, { Rotation = 0 }, 0.5, "Out", "Quint")
	task.wait(0.3)
	audioServicePlaySound("Church Bell")

	for i = 1, 4 do
		task.spawn(function()
			local n1 = p782.ZIndex + 100001
			local v3770 = UDim2.fromOffset(p782.AbsoluteSize.X, p782.AbsoluteSize.X)
			local v3771 = p782
			local uDim2 = UDim2.new(0, v3771.AbsolutePosition.X, 0, v3771.AbsolutePosition.Y)
			local uDim294 = UDim2.new(0, v3771.AbsoluteSize.X * 0.5, 0, v3771.AbsoluteSize.Y * 0.5)
			local randomNumber42 = math.random(0, 360)
			local color349 = Color3.fromRGB(17, 38, 18)
			local v3776 = effectsServiceNewerCircle(p781, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v3770,
				Position = uDim2 + uDim294,
				Rotation = randomNumber42,
				ImageColor3 = color349
			})

			v3771 = p782.ZIndex + 100001

			local v3777 = UDim2.fromOffset(p782.AbsoluteSize.X, p782.AbsoluteSize.X)
			local v3778 = p782
			local uDim295 = UDim2.new(0, v3778.AbsolutePosition.X, 0, v3778.AbsolutePosition.Y)
			local uDim296 = UDim2.new(0, v3778.AbsoluteSize.X * 0.5, 0, v3778.AbsoluteSize.Y * 0.5)
			local color350 = Color3.fromRGB(6, 93, 0)
			local v3782 = effectsServiceNewerCircle(p781, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3771,
				Size = v3777,
				Position = uDim295 + uDim296,
				Rotation = i * 90 + 180,
				ImageColor3 = color350
			})

			v3778 = p782.ZIndex + 100001

			local v3783 = UDim2.fromOffset(p782.AbsoluteSize.X, p782.AbsoluteSize.X)
			local v3784 = p782
			local uDim297 = UDim2.new(0, v3784.AbsolutePosition.X, 0, v3784.AbsolutePosition.Y)
			local uDim298 = UDim2.new(0, v3784.AbsoluteSize.X * 0.5, 0, v3784.AbsoluteSize.Y * 0.5)
			local color351 = Color3.fromRGB(0, 48, 0)
			local v3788 = effectsServiceNewerCircle(p781, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3778,
				Size = v3783,
				Position = uDim297 + uDim298,
				ImageColor3 = color351,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3784 = UDim2.fromOffset(p782.AbsoluteSize.Y * 1.5, p782.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v3776, { Size = v3784, Rotation = v3776.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v3784 = UDim2.fromOffset(p782.AbsoluteSize.Y * 1.1, p782.AbsoluteSize.Y * 1.1)
			animateAsync(v3782, { Size = v3784, Rotation = v3782.Rotation + 360 }, 1, "Out", "Quint")

			local v3791 = animation.AnimateAsync

			v3784 = UDim2.fromOffset(p782.AbsoluteSize.Y * 1.1, p782.AbsoluteSize.Y * 1.1)
			v3791(v3788, { Size = v3784, Rotation = v3788.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v3776, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v3782, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v3788, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v3776:Destroy()
				v3782:Destroy()
				v3788:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.AdminAbuse(p785, p786, p787, p788)
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(236, 115, 115)
	local randomNumber = math.random(-10, 10)
	local t80: {[any]: any} = {
		Text = ";destroy",
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0.1,
		Rotation = randomNumber,
		ZIndex = p786.ZIndex + 10000
	}

	if math.random(1, 2) == 1 then
		audioServicePlaySound("snap.wav")
	else
		audioServicePlaySound("splat.wav")
	end

	effectsServiceSpeak(p785, p786, p787, p788, t80, 0.2)
end
function module.DestroyEnemyHandSingle(p789, p790, p791, p792)
	local s1
	local s2

	if p792 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p792 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1811 = p789.Parent.BattleNew["Virtual" .. s1 .. "Hand"]
	local v1812 = p789.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(236, 115, 115)
	local randomNumber = math.random(-10, 10)
	v1811 = {
		Text = ";destroy",
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0.1,
		Rotation = randomNumber,
		ZIndex = p790.ZIndex + 10000
	}

	if math.random(1, 2) == 1 then
		audioServicePlaySound("snap.wav")
	else
		audioServicePlaySound("splat.wav")
	end

	effectsServiceSpeak(p789, p790, p791, p792, v1811, 0.2)
	task.spawn(function()
		module.MidSlashEffect(p789, p790, p791, p792)
	end)
end
function module.Godmode(p793, p794, p795, p796)
	local t81: {[any]: any} = { "dodged", "dodging", ";forcefield", "*dodges*" }
	local randomNumber = math.random(1, #t81)
	local v1822 = t81[randomNumber]
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(169, 236, 203)
	local randomNumber43 = math.random(-10, 10)
	local t82: {[any]: any} = {
		Text = v1822,
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0.1,
		Rotation = randomNumber43,
		ZIndex = p794.ZIndex + 10000
	}
	local s1

	if p796 == "" then
		s1 = ""
	elseif p796 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local virtualField = p793.Parent.BattleNew.VirtualField

	if math.random(1, 2) == 1 then
		audioServicePlaySound("snap.wav")
	else
		audioServicePlaySound("splat.wav")
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p794.Parent.Parent[s1 .. "Field"])) do
			local vAbsolutePosition = v.AbsolutePosition
			local vAbsoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v4217 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
				local v4218 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
				local randomNumber44 = math.random(-15, 15)

				animationAnimateAsync(v, { Position = v4217, Size = v4218, Rotation = randomNumber44 }, 0.4, "Out", "Quint")
				task.wait(0.25)

				local animationAnimate = animation.Animate

				v4218 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
				v4217 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
				animationAnimate(v, { Rotation = 0, Position = v4218, Size = v4217 }, 0.4, "In", "Quint")
			end)
		end
	end)
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local color352 = Color3.fromRGB(110, 238, 108)

		animationAnimateAsync(virtualField, { BackgroundColor3 = color352 }, 0.5, "In", "Quint")
	end)
	effectsServiceSpeakAlly(p793, p794, p795, p796, t82, 0.5)
end
function module.Catlyn(p797, p798, _, _)
	effectsServicePreloadTech(p797, { "rbxassetid://13482994684", "rbxassetid://13482994871" })

	local v1834 = p798.Position
	local v1835 = p798.Size
	local absoluteSize = p797.Parent.AbsoluteSize
	local color3 = Color3.fromRGB(0, 0, 0)
	local v1838 = uDim2New(1, 0, 2, 0)
	local v1839 = uDim2New(0.5, 0, 0.5, 0)
	local v1840 = effectsServiceNewerCircle(p797, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100000,
		BackgroundColor3 = color3,
		Size = v1838,
		Position = v1839
	})

	effectsServiceSetCardZIndex(p798, p798.ZIndex + 99999)
	p798.Visible = false
	p798.Rotation = -360
	p798.Size = UDim2.fromOffset(p798.AbsoluteSize.X * 1.5, p798.AbsoluteSize.Y * 1.5)
	p798.Position = UDim2.fromOffset(absoluteSize.X / 2 - p798.AbsoluteSize.X / 2, absoluteSize.Y / 2 - p798.AbsoluteSize.Y / 2 - 36)
	animation.AnimateAsync(v1840, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quint")

	local color353 = Color3.fromRGB(121, 32, 255)
	local v1842 = uDim2New(0.5, 0, 0.5, 0)
	local color354 = Color3.fromRGB(255, 255, 255)
	local v1844 = uDim2New(0.5, 0, 0.5, -36)
	local parent = effectsServiceNewerCircle(p797, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://13482994684",
		Rotation = -70,
		BackgroundColor3 = color353,
		Size = v1842,
		ImageColor3 = color354,
		Position = v1844,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = parent
	audioServicePlaySound("insanity")
	animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
	task.spawn(function()
		task.wait(2.5)
		animation.AnimateAsync(parent, { Rotation = 370 }, 1.5, "InOut", "Quint")
		animation.AnimateAsync(p798, { Rotation = 10 }, 1.5, "InOut", "Quint")
		task.wait(0.75)
		p798.Visible = true
		parent.Visible = false
		audioServicePlaySound("toon beep")
		task.wait(0.5)
		animation.AnimateAsync(v1840, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
		animation.Animate(p798, { Rotation = 0, Position = v1834, Size = v1835 }, 1, "InOut", "Quart")
		parent:Destroy()
		v1840:Destroy()
	end)
	task.spawn(function()
		task.wait(0.2)
		audioServicePlaySound("wet")
		effectsService.ShakeSync(parent, parent.Position, 0.3, 0.05)
		task.wait(0.2)
		animation.AnimateAsync(parent, { Rotation = 10 }, 1, "InOut", "Quart")
	end)

	for i = 1, 14 do
		local n1: number = if i % 2 == 0 then 1 else 2
		local vector2New = Vector2.new
		local floored = math.floor((n1 - 1) / 3)

		parent.ImageRectOffset = vector2New((2 + n1) % 3 * 341.3, floored * 341.3)
		task.wait(0.08)
	end

	audioServicePlaySound("toonybeep")

	for i = 1, 9 do
		local v1852 = Vector2.new
		local floored11 = math.floor((i - 1) / 3)

		parent.ImageRectOffset = v1852((i + 2) % 3 * 341.3, floored11 * 341.3)
		task.wait(0.08)
	end

	audioServicePlaySound("recreation")

	for i = 2, 5 do
		local n2: number = if i % 2 == 0 then 8 else 9
		local v1856 = Vector2.new
		local floored12 = math.floor((n2 - 1) / 3)

		parent.ImageRectOffset = v1856((2 + n2) % 3 * 341.3, floored12 * 341.3)
		task.wait(0.08)
	end

	task.spawn(function()
		effectsService.ShakeInOut(parent, parent.Position, 0.6, 0.004)
	end)
	audioServicePlaySound("evillaugh")
	parent.Image = "rbxassetid://13482994871"

	for i = 1, 9 do
		local v1859 = Vector2.new
		local floored13 = math.floor((i - 1) / 3)

		parent.ImageRectOffset = v1859((i + 2) % 3 * 341.3, floored13 * 341.3)
		task.wait(0.08)
	end

	for i = 2, 12 do
		local n3: number = if i % 2 == 0 then 8 else 9
		local v1863 = Vector2.new
		local floored14 = math.floor((n3 - 1) / 3)

		parent.ImageRectOffset = v1863((2 + n3) % 3 * 341.3, floored14 * 341.3)
		task.wait(0.08)
	end

	task.wait(1)
	effectsServiceSetCardZIndex(p798, p798.ZIndex - 99999)
end
function module.owchieow(p801)
	effectsServicePreloadTech(p801, {
		"rbxassetid://13485602208",
		"rbxassetid://13485505682",
		"rbxassetid://13485506230"
	})
	audioServiceDimSongs()

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1867 = uDim2New(1, 0, 2, 0)
	local v1868 = uDim2New(0.5, 0, 0.5, 0)
	local v1869 = effectsServiceNewerCircle(p801, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100000,
		BackgroundColor3 = color3,
		Size = v1867,
		Position = v1868
	})

	animation.AnimateAsync(v1869, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quint")

	local color355 = Color3.fromRGB(255, 0, 255)
	local v1871 = uDim2New(0.5, 0, 0.5, 0)
	local v1872 = uDim2New(0.5, 0, 0.5, -36)
	local parent = effectsServiceNewerCircle(p801, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://13485602208",
		Rotation = 0,
		ImageColor3 = color355,
		Size = v1871,
		Position = v1872,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = parent
	animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
	task.wait(0.1)
	audioServicePlaySound("screaming")

	for i = 1, 9 do
		local vector2New = Vector2.new
		local floored = math.floor((i - 1) / 3)
		local vector2 = vector2New((i + 2) % 3 * 341.3, floored * 341.3)

		if i == 3 then
			audioServicePlaySound("click2")
		end

		if i > 8 or i % 3 == 0 then
			audioServicePlaySound("body_impact1")
		end

		parent.ImageRectOffset = vector2
		task.wait(0.08)
	end

	parent.Image = "rbxassetid://13485505682"

	for i = 1, 9 do
		local v1880 = Vector2.new
		local floored15 = math.floor((i - 1) / 3)
		local imageRectOffset = v1880((i + 2) % 3 * 341.3, floored15 * 341.3)

		if i == 6 then
			audioServicePlaySound("click2")
		end

		if i < 6 then
			audioServicePlaySound("body_impact")
		end

		parent.ImageRectOffset = imageRectOffset
		task.wait(0.08)
	end

	parent.Image = "rbxassetid://13485506230"
	task.spawn(function()
		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored16 = math.floor((i - 1) / 3)
			local vector2 = vector2New((i + 2) % 3 * 341.3, floored16 * 341.3)

			if i == 6 then
				audioServicePlaySound("recreation")
			end

			parent.ImageRectOffset = vector2
			task.wait(0.1)
		end
	end)
	task.wait(0.7)
	animation.AnimateAsync(parent, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
	animation.Animate(v1869, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
	audioServiceUndimSongs()
	parent:Destroy()
	v1869:Destroy()
end
function module.EgoCulling(parent, _, p804, _)
	local vector3 = Vector3.new(parent.Parent.AbsolutePosition.X + parent.Parent.AbsoluteSize.X / 2, parent.Parent.AbsolutePosition.Y + parent.Parent.AbsoluteSize.Y / 2, 0)
	local vector33 = Vector3.new(p804.AbsolutePosition.X + p804.AbsoluteSize.X / 2, p804.AbsolutePosition.Y + p804.AbsoluteSize.Y / 2, 0)
	local color3 = Color3.fromRGB(255, 255, 255)
	local v1890 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000000,
		ImageColor3 = color3
	})
	local color356 = Color3.fromRGB(0, 255, 255)
	local v1892 = UDim2.fromOffset(p804.AbsoluteSize.Y, p804.AbsoluteSize.Y)
	local v1893 = UDim2.fromScale(0.5, 0.5)
	local v1894 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000001,
		ImageColor3 = color356,
		Size = v1892,
		Position = v1893
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1896 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v1894, { ImageTransparency = 1, Size = v1896 }, 1, "Out", "Quart")
	audioServicePlaySound("heaven release")

	local magnitude = (vector33 - vector3).Magnitude
	local v1898 = math.atan2(vector3.Y - vector33.Y, vector3.X - vector33.X)

	v1890.Size = UDim2.new(0, magnitude, 0, p804.AbsoluteSize.X / 2)
	v1896 = CFrame.new(vector3, vector33).Position

	local cFrame = CFrame.new(vector3, vector33)

	v1893 = v1896 + cFrame.lookVector * magnitude / 2
	v1890.Position = UDim2.new(0, v1893.X, 0, v1893.Y)
	v1890.Rotation = math.deg(v1898)

	local clone = v1890:Clone()

	clone.Size = UDim2.fromOffset(magnitude, p804.AbsoluteSize.X / 1.5)
	clone.Parent = parent
	clone.ImageColor3 = Color3.fromRGB(0, 255, 255)
	clone.ZIndex = v1890.ZIndex - 1
	effectsService.ShakeSync(p804, p804.Position, 0.2, 0.1)
	audioServicePlaySound("Laser Pistol Fire")

	local animateAsync = animation.AnimateAsync
	local v1902 = UDim2.fromOffset(magnitude, 0)

	animateAsync(clone, { Size = v1902 }, 1, "Out", "Quart")

	local v1903 = animation.AnimateAsync

	v1902 = UDim2.fromOffset(magnitude, 0)
	v1903(v1890, { Size = v1902 }, 1, "Out", "Quart")
	task.wait(0.1)
	task.spawn(function()
		task.wait(0.9)
		v1894:Destroy()
		v1890:Destroy()
		clone:Destroy()
	end)
end
function module.Moonbeam(parent, p807, p808, _)
	effectsService.ShakeSync(p807, p807.Position, 0.4, 0.2)
	effectsService.ShakeSync(p808, p808.Position, 0.4, 0.2)
	audioServicePlaySound("Sweeping Beam")

	for _ = 1, 70 do
		local vector3 = Vector3.new(p807.AbsolutePosition.X + p807.AbsoluteSize.X / 2, p807.AbsolutePosition.Y + p807.AbsoluteSize.Y / 2, 0)
		local n1 = p808.AbsolutePosition.X + p808.AbsoluteSize.X / 2
		local randomNumber = math.random(-p808.AbsoluteSize.X / 8, p808.AbsoluteSize.X / 8)
		local n2 = p808.AbsolutePosition.Y + p808.AbsoluteSize.Y / 2
		local randomNumber45 = math.random(-p808.AbsoluteSize.Y / 8, p808.AbsoluteSize.Y / 8)
		local vector34 = Vector3.new(n1 + randomNumber, n2 + randomNumber45, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v1916 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000000,
			ImageColor3 = color3
		})
		local t83 = {
			BackgroundTransparency = 1,
			ImageTransparency = 0.8,
			Image = "rbxassetid://511406127",
			ZIndex = 1000001,
			ImageColor3 = math.random(1, 2) == 1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 0),
			Size = UDim2.fromOffset(p808.AbsoluteSize.Y, p808.AbsoluteSize.Y)
		}
		local uDim2 = UDim2.new(0, p807.AbsolutePosition.X, 0, p807.AbsolutePosition.Y)
		local uDim299 = UDim2.new(0, p807.AbsoluteSize.X * 0.5, 0, p807.AbsoluteSize.Y * 0.5)

		t83.Position = uDim2 + uDim299

		local v1920 = effectsServiceNewerCircle(parent, t83)
		local animationAnimateAsync = animation.AnimateAsync
		local v1922 = UDim2.fromOffset(0, 0)
		local color357 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v1920, { ImageTransparency = 1, Size = v1922, ImageColor3 = color357 }, 1, "Out", "Quart")

		local magnitude = (vector34 - vector3).Magnitude

		t83 = math.atan2(vector3.Y - vector34.Y, vector3.X - vector34.X)
		v1916.Size = UDim2.new(0, magnitude, 0, p808.AbsoluteSize.X / 2)
		v1922 = CFrame.new(vector3, vector34).Position

		local cFrame = CFrame.new(vector3, vector34)
		local n3 = v1922 + cFrame.lookVector * magnitude / 2

		v1916.Position = UDim2.new(0, n3.X, 0, n3.Y)
		v1916.Rotation = math.deg(t83)

		local clone = v1916:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p808.AbsoluteSize.X / 1.5)
		clone.Parent = parent
		clone.ImageColor3 = Color3.fromRGB(13, 255, 0)
		clone.ZIndex = v1916.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v1929 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v1929 }, 1, "Out", "Quart")

		local v1930 = animation.AnimateAsync

		v1929 = UDim2.fromOffset(magnitude, 0)
		v1930(v1916, { Size = v1929 }, 1, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.9)
			v1920:Destroy()
			v1916:Destroy()
			clone:Destroy()
		end)
	end
end

local t4: {[any]: any} = {
	"rbxassetid://569507523",
	"rbxassetid://278520320",
	"rbxassetid://7948615986"
}

function module.ApolloAttack(p810, p811, p812, _)
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p811.ZIndex + 99999
	local v1937 = UDim2.fromOffset(p811.AbsoluteSize.Y * 5, p811.AbsoluteSize.Y * 5)
	local uDim2 = UDim2.new(0, p811.AbsolutePosition.X, 0, p811.AbsolutePosition.Y)
	local uDim2100 = UDim2.new(0, p811.AbsoluteSize.X * 0.5, 0, p811.AbsoluteSize.Y * 0.5)
	local v1940 = effectsServiceNewerCircle(p810, {
		Image = "rbxassetid://7216856276",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1937,
		Position = uDim2 + uDim2100
	})

	animation.AnimateAsync(v1940, { ImageTransparency = 0 }, 0.3, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v1942 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v1940, { Size = v1942 }, 0.8, "In", "Quad")
	audioServicePlaySound("DBZ_Beam_Charge")
	task.wait(0.8)
	task.spawn(function()
		effectsService.ShakeInOut(p812, p812.Position, 1.45, 0.002)
	end)
	task.spawn(function()
		effectsService.ShakeInOut(p811, p811.Position, 1, 0.002)
	end)
	audioServicePlaySound("Large Beam")
	effectsService.ShakeBattleSync(p810, 0.5, 0.025)
	v1940 = UDim2.fromOffset(p812.AbsolutePosition.X + p812.AbsoluteSize.X / 1.1, p812.AbsolutePosition.Y)

	local v1943 = UDim2.fromOffset(p812.AbsolutePosition.X + p812.AbsoluteSize.X / 1.1, p812.AbsolutePosition.Y + p812.AbsoluteSize.Y)
	local uDim2101 = UDim2.new(0, p812.AbsoluteSize.X / 4, 0, p812.AbsoluteSize.X / 4)
	local v1945 = effectsServiceNewerCircle(p810, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2101,
		Position = v1940,
		ZIndex = p812.ZIndex + 1
	})
	local uDim2102 = UDim2.new(0, p812.AbsoluteSize.X / 4, 0, p812.AbsoluteSize.X / 4)
	local v1947 = effectsServiceNewerCircle(p810, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2102,
		Position = v1943,
		ZIndex = p812.ZIndex + 1
	})
	local animateAsync = animation.AnimateAsync
	local v1949 = UDim2.fromOffset(p812.AbsolutePosition.X + p812.AbsoluteSize.X / 2, p812.AbsolutePosition.Y + p812.AbsoluteSize.Y / 2)

	animateAsync(v1945, { Position = v1949 }, 1, "In", "Quad")

	local v1950 = animation.AnimateAsync

	v1949 = UDim2.fromOffset(p812.AbsolutePosition.X + p812.AbsoluteSize.X / 2, p812.AbsolutePosition.Y + p812.AbsoluteSize.Y / 2)
	v1950(v1947, { Position = v1949 }, 1, "In", "Quad")

	for i = 1, 2 do
		task.spawn(function()
			local v3802 = i == 1 and v1945 or v1947

			for _ = 1, 80 do
				local vector3 = Vector3.new(p811.AbsolutePosition.X + p811.AbsoluteSize.X / 2, p811.AbsolutePosition.Y + p811.AbsoluteSize.Y / 2, 0)
				local n1 = v3802.AbsolutePosition.X + v3802.AbsoluteSize.X / 2
				local randomNumber = math.random(-v3802.AbsoluteSize.X / 2, v3802.AbsoluteSize.X / 2)
				local n2 = v3802.AbsolutePosition.Y + v3802.AbsoluteSize.Y / 2
				local randomNumber46 = math.random(-v3802.AbsoluteSize.Y / 2, v3802.AbsoluteSize.Y / 2)
				local vector35 = Vector3.new(n1 + randomNumber, n2 + randomNumber46, 0)
				local color358 = Color3.fromRGB(255, 255, 255)
				local v3811 = effectsServiceNewerCircle(p810, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = "rbxassetid://511406127",
					ZIndex = 1000000,
					ImageColor3 = color358
				})
				local magnitude = (vector35 - vector3).Magnitude

				n2 = math.atan2(vector3.Y - vector35.Y, vector3.X - vector35.X)
				v3811.Size = UDim2.new(0, magnitude, 0, p812.AbsoluteSize.X / 2)

				local v3813 = CFrame.new(vector3, vector35).Position
				local cFrame = CFrame.new(vector3, vector35)
				local n3 = v3813 + cFrame.lookVector * magnitude / 2

				v3811.Position = UDim2.new(0, n3.X, 0, n3.Y)
				v3811.Rotation = math.deg(n2)

				local clone = v3811:Clone()

				clone.Size = UDim2.fromOffset(magnitude, p812.AbsoluteSize.X / 1.5)
				clone.Parent = p810

				if i == 1 then
					clone.ImageColor3 = Color3.fromRGB(255, 234, 0)
				else
					clone.ImageColor3 = Color3.fromRGB(0, 38, 255)
				end

				clone.ZIndex = v3811.ZIndex - 1

				local animationAnimateAsync = animation.AnimateAsync
				local v3818 = UDim2.fromOffset(magnitude, 0)

				animationAnimateAsync(clone, { Size = v3818 }, 0.2, "Out", "Quart")

				local animateAsync = animation.AnimateAsync

				v3818 = UDim2.fromOffset(magnitude, 0)
				animateAsync(v3811, { Size = v3818 }, 0.2, "Out", "Quart")
				task.wait(0.01)
				task.spawn(function()
					task.wait(0.2)
					v3811:Destroy()
					clone:Destroy()
				end)
			end
		end)
	end

	task.wait(1.5)
end

module.SmallApolloAttack = module.ApolloAttack
module.MidApolloAttack = module.ApolloAttack
module.LargeApolloAttack = module.ApolloAttack

function module.PartingWords(p814, p815, _, _)
	effectsServicePreloadTech(p814, { "rbxassetid://13527914688", "rbxassetid://5089147697" })
	audioServiceDimSongs()

	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p815.ZIndex + 99997
	local v1958 = uDim2New(1, 0, 2, 0)
	local v1959 = uDim2New(0.5, 0, 0.5, 0)
	local v1960 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1958,
		Position = v1959
	})
	local color359 = Color3.fromRGB(0, 0, 0)
	local n2 = p815.ZIndex + 100001
	local v1963 = uDim2New(1, 0, 0.3, 0)
	local v1964 = uDim2New(0.5, 0, 0.15, -36)
	local v1965 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		Rotation = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = color359,
		ZIndex = n2,
		Size = v1963,
		Position = v1964
	})
	local color360 = Color3.fromRGB(0, 0, 0)
	local n3 = p815.ZIndex + 100001
	local v1968 = uDim2New(1, 0, 0.3, 0)
	local v1969 = uDim2New(0.5, 0, 0.85, 0)
	local v1970 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		Rotation = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = color360,
		ZIndex = n3,
		Size = v1968,
		Position = v1969
	})

	audioServicePlaySound("Running Sound")
	animation.AnimateAsync(v1960, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quint")

	local color361 = Color3.fromRGB(0, 0, 0)
	local n4 = p815.ZIndex + 99998
	local v1973 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 4, p814.Parent.AbsoluteSize.Y / 4)
	local v1974 = uDim2New(0.5, 0, 0.6, 0)
	local v1975 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13527914688",
		ImageTransparency = 0,
		Rotation = 0,
		BackgroundColor3 = color361,
		ZIndex = n4,
		Size = v1973,
		Position = v1974,
		ImageRectSize = Vector2.new(512, 512)
	})
	local color362 = Color3.fromRGB(0, 0, 0)
	local n5 = p815.ZIndex + 99998
	local v1978 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 3.5, p814.Parent.AbsoluteSize.Y / 3.5)
	local v1979 = uDim2New(0.5, 0, 0.6, 0)
	local v1980 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13527914688",
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color362,
		ZIndex = n5,
		Size = v1978,
		Position = v1979,
		ImageRectSize = Vector2.new(512, 512),
		ImageRectOffset = Vector2.new(512, 0)
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1982 = uDim2New(0.5, 0, 0.05, -36)

	animationAnimateAsync(v1965, { Position = v1982 }, 3, "In", "Cubic")

	local animateAsync = animation.AnimateAsync

	v1982 = uDim2New(0.5, 0, 0.95, 0)
	animateAsync(v1970, { Position = v1982 }, 3, "In", "Cubic")

	local v1984 = animation.AnimateAsync

	v1982 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 2.8, p814.Parent.AbsoluteSize.Y / 2.8)
	v1984(v1975, { Size = v1982 }, 2, "In", "Quad")

	local v1985 = animation.AnimateAsync

	v1982 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 2.8, p814.Parent.AbsoluteSize.Y / 2.8)
	v1985(v1980, { Size = v1982 }, 2, "In", "Quad")
	task.spawn(function()
		task.wait(1.5)
		animation.AnimateAsync(v1975, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		animation.AnimateAsync(v1980, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
		task.wait(0.5)

		local animationAnimateAsync = animation.AnimateAsync
		local v3821 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 1.3, p814.Parent.AbsoluteSize.Y / 1.3)

		animationAnimateAsync(v1975, { Size = v3821 }, 1, "In", "Exponential")

		local animateAsync = animation.AnimateAsync

		v3821 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y / 1.3, p814.Parent.AbsoluteSize.Y / 1.3)
		animateAsync(v1980, { Size = v3821 }, 1, "In", "Exponential")
		task.wait(0.5)
		v1975.ImageRectOffset = Vector2.new(0, 512)
		animation.AnimateAsync(v1975, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
		animation.AnimateAsync(v1980, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
	end)
	task.wait(3)
	audioServicePlaySound("PreSlash")
	v1960.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	v1960.ZIndex = v1965.ZIndex - 1
	v1960.BackgroundTransparency = 0

	local color363 = Color3.fromRGB(0, 0, 0)
	local color364 = Color3.fromRGB(0, 0, 0)

	v1982 = p815.ZIndex + 100001

	local v1988 = UDim2.fromOffset(p814.Parent.AbsoluteSize.Y, p814.Parent.AbsoluteSize.Y)
	local v1989 = uDim2New(0.5, 0, 0.5, 0)

	v1969 = effectsServiceNewerCircle(p814, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5089147697",
		ImageTransparency = 0,
		Rotation = 0,
		BackgroundColor3 = color363,
		ImageColor3 = color364,
		ZIndex = v1982,
		Size = v1988,
		Position = v1989
	})
	v1969.Position = UDim2.fromOffset(v1969.AbsolutePosition.X + v1969.AbsoluteSize.X / 2 - v1969.AbsoluteSize.X / 8, v1969.AbsolutePosition.Y + v1969.AbsoluteSize.Y / 2 + v1969.AbsoluteSize.X / 8)

	local v1990 = animation.AnimateAsync
	local v1991 = UDim2.fromOffset(v1969.AbsolutePosition.X + v1969.AbsoluteSize.X / 2 + v1969.AbsoluteSize.X / 4, v1969.AbsolutePosition.Y + v1969.AbsoluteSize.Y / 2 - v1969.AbsoluteSize.X / 4)

	v1990(v1969, { Position = v1991 }, 0.5, "In", "Quint")
	task.wait(0.5)
	v1975:Destroy()
	v1969:Destroy()
	audioServicePlaySound("Girl Scream")
	audioServicePlaySound("headexplosion")
	v1960:Destroy()
	v1965:Destroy()
	v1970:Destroy()
	animation.AnimateAsync(v1969, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
	effectsService.ShakeBattleSync(p814, 0.2, 0.05)
	task.spawn(function()
		task.wait(0.5)
	end)
	audioServiceUndimSongs()
end
function module.BiggsWinAnimation(_, p819, _, _)
	audioServicePlaySound("Angelic Humming")

	local animationAnimate = animation.Animate
	local v1997 = UDim2.fromOffset(p819.AbsoluteSize.X * 3, p819.AbsoluteSize.Y * 3)
	local v1998 = UDim2.fromOffset(p819.AbsolutePosition.X - p819.AbsoluteSize.X * 1.5, p819.AbsolutePosition.Y - p819.AbsoluteSize.Y * 1.5)

	animationAnimate(p819, { ImageTransparency = 1, Size = v1997, Position = v1998 }, 5, "Out", "Quart")
end
function module.DeadRising(p822, p823, _, p825)
	effectsServicePreloadTech(p822, { "rbxassetid://245854775", "rbxassetid://13624260457" })

	local s1 = if p825 == "" then "Enemy" else if p825 == "Enemy" then "" else nil
	local zIndex = p823.ZIndex
	local absolutePosition = p823.AbsolutePosition
	local absoluteSize = p823.AbsoluteSize
	local y = p822.Parent.AbsoluteSize.Y
	local n1: number = if p823.AbsolutePosition.Y > y / 2 then 1 else 0
	local n2 = y * n1 + p823.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1)
	local v2010 = effectsServiceNewerCircle(p822, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://245854775",
		ImageColor3 = Color3.fromRGB(255, 221, 83),
		Rotation = if n1 == 1 then 180 else 0,
		ZIndex = p823.ZIndex + 100002,
		Size = UDim2.fromOffset(p823.AbsoluteSize.X * 1.25, p823.AbsoluteSize.Y * 5),
		Position = UDim2.fromOffset(p823.AbsolutePosition.X + p823.AbsoluteSize.X / 2, y * n1 + p823.AbsoluteSize.Y * (if n1 == 1 then 1 else -1))
	})

	p823.Position = UDim2.new(0, p823.AbsolutePosition.X, 0, n2)
	audioServiceDimSongs()
	effectsServiceSetCardZIndex(p823, p823.ZIndex + 99999)
	audioServicePlaySound("WellSFX")
	p823.Visible = true
	task.wait(0.5)
	audioServicePlaySound("Metal Crash 4 (SFX)")

	local animationAnimateAsync = animation.AnimateAsync
	local v2012 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimateAsync(p823, { Position = v2012 }, 1, "Out", "Quart")
	task.wait(0.15)
	animation.AnimateAsync(v2010, { ImageTransparency = 0 }, 0.6, "Out", "Quart")
	task.wait(0.85)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p823.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.5, 0.002)
			end)
		end
	end)
	animation.AnimateAsync(v2010, { ImageTransparency = 1 }, 1, "Out", "Quart")
	task.wait(1)
	v2010:Destroy()
	audioServiceUndimSongs()
	effectsServiceSetCardZIndex(p823, p823.ZIndex - 99999)
end
function module.Hatch(p826, p827, _, _)
	local v2017 = UDim2.fromOffset(p827.AbsoluteSize.Y * 1.2, p827.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p827.AbsolutePosition.X, 0, p827.AbsolutePosition.Y)
	local uDim2103 = UDim2.new(0, p827.AbsoluteSize.X * 0.5, 0, p827.AbsoluteSize.Y * 0.5)
	local v2020 = effectsServiceNewerCircle(p826, {
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Size = v2017,
		Position = uDim2 + uDim2103
	})
	local color3 = Color3.fromRGB(255, 255, 255)
	local v2022 = uDim2New(0, 0, 0, 0)
	local uDim2104 = UDim2.new(0, p827.AbsolutePosition.X, 0, p827.AbsolutePosition.Y)
	local uDim2105 = UDim2.new(0, p827.AbsoluteSize.X * 0.5, 0, p827.AbsoluteSize.Y * 0.5)
	local v2025 = effectsServiceNewerCircle(p826, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.5,
		Image = "rbxassetid://14195685749",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v2022,
		Position = uDim2104 + uDim2105
	})
	local color365 = Color3.fromRGB(255, 255, 255)

	v2017 = UDim2.fromOffset(p827.AbsoluteSize.X * 0.4, p827.AbsoluteSize.X * 0.4)
	animation.AnimateAsync(p827, { Rotation = -20 }, 0.2, "Out", "Quart")
	task.wait(0.1)
	audioServicePlaySound("crack")
	animation.AnimateAsync(p827, { Rotation = 20 }, 0.4, "InOut", "Quart")
	task.wait(0.3)
	audioServicePlaySound("crack")
	animation.AnimateAsync(p827, { Rotation = 0 }, 0.3, "Out", "Quart")
	task.wait(0.2)

	local v2027 = p827.Size

	v2022 = p827.Position

	local v2028 = UDim2.fromOffset(p827.AbsoluteSize.X * 2, p827.AbsoluteSize.Y / 2)
	local v2029 = UDim2.fromOffset(p827.AbsolutePosition.X - p827.AbsoluteSize.X / 2, p827.AbsolutePosition.Y + p827.AbsoluteSize.Y / 4)

	animation.AnimateAsync(p827, { Size = v2028 }, 0.3, "InOut", "Quint")
	animation.AnimateAsync(p827, { Position = v2029 }, 0.3, "InOut", "Quint")
	task.wait(0.2)
	animation.AnimateAsync(p827, { Size = v2027 }, 0.3, "Out", "Bounce")
	animation.AnimateAsync(p827, { Position = v2022 }, 0.3, "Out", "Bounce")
	task.wait(0.05)

	local t84: {[any]: any} = {
		Projectile = "rbxassetid://298984512",
		Strength = 10000,
		Speed = 1.2,
		EasingStyle = "Quint",
		Time = 0.2,
		Color = color365,
		Size = v2017,
		Range = v2020
	}

	task.spawn(function()
		audioServicePlaySound("Egg hatching")

		local animationAnimateAsync = animation.AnimateAsync
		local v3826 = UDim2.fromOffset(p827.AbsoluteSize.Y * 2, p827.AbsoluteSize.Y * 2)

		animationAnimateAsync(v2025, { Size = v3826 }, 0.8, "Out", "Quart")
		effectsServiceBreath(p826, p827, v2020, t84)
		task.wait(0.4)
		animation.AnimateAsync(v2025, { ImageTransparency = 1 }, 0.4, "Out", "Quart")
		task.wait(0.4)
		v2025:Destroy()
		v2020:Destroy()
	end)
end
function module.Printer(p830, p831, _, _)
	local v2035 = UDim2.fromOffset(p831.AbsoluteSize.Y * 1.2, p831.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p831.AbsolutePosition.X, 0, p831.AbsolutePosition.Y)
	local uDim2106 = UDim2.new(0, p831.AbsoluteSize.X * 0.5, 0, p831.AbsoluteSize.Y * 0.5)
	local v2038 = effectsServiceNewerCircle(p830, {
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Size = v2035,
		Position = uDim2 + uDim2106
	})
	local color3 = Color3.fromRGB(255, 255, 255)
	local v2040 = UDim2.fromOffset(p831.AbsoluteSize.X * 0.4, p831.AbsoluteSize.X * 0.4)

	animation.AnimateAsync(p831, { Rotation = -20 }, 0.2, "Out", "Quart")
	task.wait(0.1)
	audioServicePlaySound("crack")
	animation.AnimateAsync(p831, { Rotation = 20 }, 0.4, "InOut", "Quart")
	task.wait(0.3)
	audioServicePlaySound("crack")
	animation.AnimateAsync(p831, { Rotation = 0 }, 0.3, "Out", "Quart")
	task.wait(0.2)

	local v2041 = p831.Size

	v2035 = p831.Position

	local v2042 = UDim2.fromOffset(p831.AbsoluteSize.X * 2, p831.AbsoluteSize.Y / 2)
	local v2043 = UDim2.fromOffset(p831.AbsolutePosition.X - p831.AbsoluteSize.X / 2, p831.AbsolutePosition.Y + p831.AbsoluteSize.Y / 4)

	animation.AnimateAsync(p831, { Size = v2042 }, 0.3, "InOut", "Quint")
	animation.AnimateAsync(p831, { Position = v2043 }, 0.3, "InOut", "Quint")
	task.wait(0.2)
	animation.AnimateAsync(p831, { Size = v2041 }, 0.3, "Out", "Bounce")
	animation.AnimateAsync(p831, { Position = v2035 }, 0.3, "Out", "Bounce")
	task.wait(0.05)

	local t85: {[any]: any} = {
		Projectile = "rbxassetid://298984512",
		Strength = 10000,
		Speed = 1.2,
		EasingStyle = "Quint",
		Time = 0.2,
		Color = color3,
		Size = v2040,
		Range = v2038
	}

	task.spawn(function()
		audioServicePlaySound("Snub hatching")
		effectsServiceBreath(p830, p831, v2038, t85)
		task.wait(0.4)
		task.wait(0.4)
		v2038:Destroy()
	end)
end
function module.Soulbinder(p834, _, p836, _)
	local color3 = Color3.fromRGB(255, 255, 255)
	local v2050 = UDim2.fromOffset(p836.AbsoluteSize.Y * 1.2, p836.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p836.AbsolutePosition.X, 0, p836.AbsolutePosition.Y)
	local uDim2107 = UDim2.new(0, p836.AbsoluteSize.X * 0.5, 0, p836.AbsoluteSize.Y * 0.5)
	local v2053 = effectsServiceNewerCircle(p834, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://14195672776",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v2050,
		Position = uDim2 + uDim2107
	})

	audioServicePlaySound("FireBreath")

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t86: {[any]: any} = { Color3.fromRGB(56, 240, 56), Color3.fromRGB(45, 171, 39) }
	local v2056 = UDim2.fromOffset(p836.AbsoluteSize.X / 1.5, p836.AbsoluteSize.X / 1.5)
	local t87: {[any]: any} = {
		Strength = 200,
		Time = 0.3,
		Projectile = effectsServiceBreathimagesFire,
		Color = t86,
		Size = v2056
	}

	effectsServiceBreath(p834, p836, p836, t87)
	t87.Color = { Color3.fromRGB(32, 134, 25), Color3.fromRGB(40, 90, 37) }
	t87.Size = UDim2.fromOffset(p836.AbsoluteSize.X / 1.8, p836.AbsoluteSize.X / 1.8)
	effectsServiceBreath(p834, p836, p836, t87)
	task.wait(0.5)
	animation.AnimateAsync(v2053, { ImageTransparency = 0 }, 1, "In", "Quad")
	audioServicePlaySound("recreation")
	task.spawn(function()
		effectsService.ShakeInOut(v2053, v2053.Position, 0.75, 0.007)
	end)
	effectsService.ShakeInOut(p836, p836.Position, 0.75, 0.007)
	task.spawn(function()
		animation.Animate(v2053, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		v2053:Destroy()
	end)
end
function module.Whip(parent, p839, _, _)
	local n1 = 0
	local v2063 = nil

	for _, v in pairs(_G.__NoFaces(parent.Parent.BattleNew.Field)) do
		if n1 < v.AbsolutePosition.X then
			n1 = v.AbsolutePosition.X
			v2063 = v
		end
	end

	n1 = v2063
	audioServicePlaySound("Whip Crack")
	animation.AnimateAsync(p839, { Rotation = -10 }, 0.5, "Out", "Quart")
	task.wait(0.5)
	p839.Rotation = 10
	animation.AnimateAsync(p839, { Rotation = 0 }, 0.5, "Out", "Quart")

	local vector3 = Vector3.new(p839.AbsolutePosition.X + p839.AbsoluteSize.X / 2, p839.AbsolutePosition.Y + p839.AbsoluteSize.Y / 2, 0)
	local n2 = n1.AbsolutePosition.X + n1.AbsoluteSize.X / 2
	local randomNumber = math.random(-n1.AbsoluteSize.X / 2, n1.AbsoluteSize.X / 2)
	local n3 = n1.AbsolutePosition.Y + n1.AbsoluteSize.Y / 2
	local randomNumber47 = math.random(-n1.AbsoluteSize.Y / 2, n1.AbsoluteSize.Y / 2)
	local vector36 = Vector3.new(n2 + randomNumber, n3 + randomNumber47, 0)
	local color3 = Color3.fromRGB(0, 0, 0)
	local v2073 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		Image = "rbxassetid://511406127",
		ZIndex = 10000000,
		BackgroundColor3 = color3
	})
	local magnitude = (vector36 - vector3).Magnitude

	n3 = math.atan2(vector3.Y - vector36.Y, vector3.X - vector36.X)
	v2073.Size = UDim2.new(0, magnitude, 0, n1.AbsoluteSize.X / 3)

	local v2075 = CFrame.new(vector3, vector36).Position
	local cFrame = CFrame.new(vector3, vector36)
	local n4 = v2075 + cFrame.lookVector * magnitude / 2

	v2073.Position = UDim2.new(0, n4.X, 0, n4.Y)
	v2073.Rotation = math.deg(n3)

	local clone = v2073:Clone()

	clone.Size = UDim2.fromOffset(magnitude, n1.AbsoluteSize.X / 2)
	clone.Parent = parent
	clone.ZIndex = v2073.ZIndex - 1
	clone.BackgroundColor3 = Color3.fromRGB(0, 255, 17)

	local animationAnimateAsync = animation.AnimateAsync
	local v2080 = UDim2.fromOffset(magnitude, 0)

	animationAnimateAsync(clone, { Size = v2080 }, 0.2, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v2080 = UDim2.fromOffset(magnitude, 0)
	animateAsync(v2073, { Size = v2080 }, 0.2, "Out", "Quart")
	task.wait(0.01)
	task.spawn(function()
		task.wait(0.2)
		v2073:Destroy()
		clone:Destroy()
	end)
	effectsService.Shake(n1, n1.Position, 0.3, 0.1)
end
function module.CurvedBladeOfWinds(p842, _, p844, _)
	local color3 = Color3.fromRGB(75, 255, 35)
	local n1 = p844.ZIndex + 100001
	local v2088 = UDim2.fromOffset(p844.AbsoluteSize.X * 3, p844.AbsoluteSize.X * 3)
	local uDim2 = UDim2.new(0, p844.AbsolutePosition.X, 0, p844.AbsolutePosition.Y)
	local uDim2108 = UDim2.new(0, p844.AbsoluteSize.X * 0.5, 0, p844.AbsoluteSize.Y * 0.5)
	local v2091 = effectsServiceNewerCircle(p842, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://7216856402",
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v2088,
		Position = uDim2 + uDim2108
	})
	local animationAnimate = animation.Animate
	local v2093 = UDim2.fromOffset(0, 0)

	animationAnimate(v2091, { Rotation = 360, Size = v2093 }, 0.5, "In", "Quart")
	audioServicePlaySound("dbzswordout")
	audioServicePlaySound("demise2")
	v2093 = p844.ZIndex + 100001

	local v2094 = UDim2.fromOffset(p844.AbsoluteSize.X, p844.AbsoluteSize.X)
	local uDim2109 = UDim2.new(0, p844.AbsolutePosition.X, 0, p844.AbsolutePosition.Y)
	local uDim2110 = UDim2.new(0, p844.AbsoluteSize.X * 0.5, 0, p844.AbsoluteSize.Y * 0.5)
	local v2097 = effectsServiceNewerCircle(p842, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://3916186365",
		ZIndex = v2093,
		Size = v2094,
		Position = uDim2109 + uDim2110
	})

	effectsService.ShakeBattleSync(p842, 0.3, 0.025)

	local animationAnimateAsync = animation.AnimateAsync
	local v2099 = UDim2.fromOffset(p844.AbsoluteSize.Y * 1.5, p844.AbsoluteSize.Y * 1.5)

	animationAnimateAsync(v2097, { Rotation = 360, Size = v2099 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(0.5)
		animation.Animate(v2097, { ImageTransparency = 1 }, 1, "Out", "Quint")
		v2097:Destroy()
		v2091:Destroy()
	end)
end
function module.LannisAmulet(p846, _, p848, _)
	audioServicePlaySound("electricwindup")

	local color3 = Color3.fromRGB(95, 0, 95)
	local n1 = p848.ZIndex + 100001
	local v2106 = UDim2.fromOffset(p848.AbsoluteSize.X * 1.5, p848.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p848.AbsolutePosition.X, 0, p848.AbsolutePosition.Y)
	local uDim2111 = UDim2.new(0, p848.AbsoluteSize.X * 0.5, 0, p848.AbsoluteSize.Y * 0.5)
	local v2109 = effectsServiceNewerCircle(p846, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "http://www.roblox.com/asset/?id=7405798505",
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v2106,
		Position = uDim2 + uDim2111
	})

	p848.ImageTransparency = 1
	task.spawn(function()
		animation.AnimateAsync(v2109, { Rotation = 360 }, 3, "Out", "Quad")
		effectsService.Shake(v2109, v2109.Position, 2, 0.25)
		animation.AnimateAsync(v2109, { ImageTransparency = 1 }, 1, "Out", "Quad")
		animation.AnimateAsync(p848, { ImageTransparency = 0 }, 1, "Out", "Quad")
	end)

	for i = 1, 4 do
		task.spawn(function()
			local randomNumber = math.random(0, 180)
			local color366 = Color3.fromRGB(52, 0, 52)
			local n1 = p848.ZIndex + 100001
			local v3830 = UDim2.fromOffset(p848.AbsoluteSize.X * 0.4, p848.AbsoluteSize.Y * 0.4)
			local v3831 = p848
			local uDim2112 = UDim2.new(0, v3831.AbsolutePosition.X, 0, v3831.AbsolutePosition.Y)
			local uDim2113 = UDim2.new(0, v3831.AbsoluteSize.X * 0.5, 0, v3831.AbsoluteSize.Y * 0.5)
			local v3834 = effectsServiceNewerCircle(p846, {
				BackgroundTransparency = 0.3,
				ImageTransparency = 1,
				BorderSizePixel = 0,
				Image = "",
				BackgroundColor3 = color366,
				ZIndex = n1,
				Size = v3830,
				Position = uDim2112 + uDim2113,
				Rotation = randomNumber
			})
			local animationAnimate = animation.Animate
			local v3836 = v3834.Position
			local v3837 = UDim2.fromOffset(p848.AbsoluteSize.X * (if i % 2 == 0 then 1 else -1), p848.AbsoluteSize.X * (if i <= 2 then 1 else -1))

			animationAnimate(v3834, { Position = v3836 + v3837, Rotation = -randomNumber }, 1.5, "Out", "Quart")

			local animate = animation.Animate

			v3836 = p848

			local uDim2114 = UDim2.new(0, v3836.AbsolutePosition.X, 0, v3836.AbsolutePosition.Y)
			local uDim2115 = UDim2.new(0, v3836.AbsoluteSize.X * 0.5, 0, v3836.AbsoluteSize.Y * 0.5)

			animate(v3834, {
				BackgroundTransparency = 1,
				Position = uDim2114 + uDim2115,
				Rotation = randomNumber
			}, 1, "Out", "Quart")
			v3834:Destroy()
		end)
	end

	task.wait(1.5)
end
function module.FreeRaceReroll(p850, p851, p852, p853)
	local legacy = Enum.Font.Legacy
	local v2116 = UDim2.fromOffset(p851.AbsoluteSize.X * 2, p851.AbsoluteSize.X / 2)
	local color3 = Color3.fromRGB(255, 255, 255)
	local n1 = p851.ZIndex + 10000

	audioServicePlaySound("cashregister")
	effectsServiceSpeak(p850, p852, p852, p853, {
		Text = "Code Redeemed!",
		Font = legacy,
		Size = v2116,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		ZIndex = n1
	})
end
local function PowerUpTarget(p854, p855, p856, _, p858, p859, p860, p861, p862, p863)
	audioServicePlaySound(p859)
	audioServicePlaySound(p860)
	task.spawn(function()
		effectsService.ShakeInOut(p856, p856.Position, 1, 0.005)
	end)

	local n1 = p856.ZIndex + 100001
	local v2130 = UDim2.fromOffset(p855.AbsoluteSize.Y * p862, p855.AbsoluteSize.Y * p862)
	local uDim2 = UDim2.new(0, p856.AbsolutePosition.X, 0, p856.AbsolutePosition.Y)
	local uDim2116 = UDim2.new(0, p856.AbsoluteSize.X * 0.5, 0, p856.AbsoluteSize.Y * 0.5)
	local v2133 = UDim2.fromOffset(0, p856.AbsoluteSize.Y / 6)
	local v2134 = effectsServiceNewerCircle(p854, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.2,
		ImageColor3 = p858,
		Image = p861,
		ZIndex = n1,
		Size = v2130,
		Position = uDim2 + uDim2116 - v2133
	})
	local vector2 = Vector2.new(9999, 0)
	local vector23 = Vector2.new(-9999, 9999)
	local vector24 = Vector2.new(0, 0)
	local vector25 = Vector2.new(0, 0)

	task.spawn(function()
		for i = 1, p863 do
			if i % 2 == 0 then
				v2134.ImageRectOffset = vector2
				v2134.ImageRectSize = vector23
			else
				v2134.ImageRectOffset = vector24
				v2134.ImageRectSize = vector25
			end

			task.wait(0.03)
		end
	end)
	effectsService.ShakeBattleSync(p854, 0.3, 0.025)
	task.wait(1.25)
	task.spawn(function()
		animation.Animate(v2134, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
		v2134:Destroy()
	end)
	wait(0.1)
end
local function PowerUpSelf(p864, p865, _, _, p868, p869, p870, p871, p872, p873)
	audioServicePlaySound(p869)
	audioServicePlaySound(p870)
	task.spawn(function()
		effectsService.ShakeInOut(p865, p865.Position, p873 / 50, 0.005)
	end)

	local n1 = p865.ZIndex + 100001
	local v2150 = UDim2.fromOffset(p865.AbsoluteSize.Y * p872, p865.AbsoluteSize.Y * p872)
	local uDim2 = UDim2.new(0, p865.AbsolutePosition.X, 0, p865.AbsolutePosition.Y)
	local uDim2117 = UDim2.new(0, p865.AbsoluteSize.X * 0.5, 0, p865.AbsoluteSize.Y * 0.5)
	local v2153 = UDim2.fromOffset(0, p865.AbsoluteSize.Y / 6)
	local v2154 = effectsServiceNewerCircle(p864, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.2,
		ImageColor3 = p868,
		Image = p871,
		ZIndex = n1,
		Size = v2150,
		Position = uDim2 + uDim2117 - v2153
	})
	local vector2 = Vector2.new(9999, 0)
	local vector26 = Vector2.new(-9999, 9999)
	local vector27 = Vector2.new(0, 0)
	local vector28 = Vector2.new(0, 0)

	task.spawn(function()
		for i = 1, p873 do
			if i % 2 == 0 then
				v2154.ImageRectOffset = vector2
				v2154.ImageRectSize = vector26
			else
				v2154.ImageRectOffset = vector27
				v2154.ImageRectSize = vector28
			end

			task.wait(0.03)
		end
	end)
	task.wait(p873 / 50)
	task.spawn(function()
		animation.Animate(v2154, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
		v2154:Destroy()
	end)
	wait(0.1)
end
function module.ROrb(p874, p875, p876, p877)
	local color3 = Color3.fromRGB(255, 255, 90)

	PowerUpTarget(p874, p875, p876, p877, color3, "omnitrix transform", "GiantLaser", "rbxassetid://358965513", 1.3, 50)
end
function module.RedFury(p878, p879, p880, p881)
	local color3 = Color3.fromRGB(147, 12, 12)

	PowerUpTarget(p878, p879, p880, p881, color3, "omnitrix transform", "GiantLaser", "rbxassetid://358965513", 1.5, 45)
end
function module.Furious(p882, p883, p884, p885)
	local legacy = Enum.Font.Legacy
	local color3 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(-10, 10)
	local t88: {[any]: any} = {
		Text = "#$@?!",
		Font = legacy,
		TextColor3 = color3,
		TextStrokeTransparency = 0,
		Rotation = randomNumber,
		ZIndex = p883.ZIndex + 10000
	}

	task.spawn(function()
		effectsServiceSpeak(p882, p883, p884, p885, t88, 0.2)
	end)
	task.wait(0.2)

	local color367 = Color3.fromRGB(255, 255, 90)

	PowerUpSelf(p882, p883, p884, p885, color367, "omnitrix transform", "GiantLaser", "rbxassetid://358965513", 1.3, 50)
end
function module.PowerUpSelfRed(p886, p887, p888, p889)
	local color3 = Color3.fromRGB(220, 37, 37)

	PowerUpSelf(p886, p887, p888, p889, color3, "TransformYelling", "GiantLaser2", "rbxassetid://358965513", 1.25, 30)
end
function module.PowerUpSelfBlue(p890, p891, p892, p893)
	local color3 = Color3.fromRGB(18, 200, 220)

	PowerUpSelf(p890, p891, p892, p893, color3, "TransformYelling", "GiantLaser2", "rbxassetid://358965513", 1.25, 30)
end
function module.PowerUpSelfGreen(p894, p895, p896, p897)
	local color3 = Color3.fromRGB(54, 220, 28)

	PowerUpSelf(p894, p895, p896, p897, color3, "TransformYelling", "GiantLaser2", "rbxassetid://358965513", 1.25, 30)
end
function module.PowerUpSelfYellow(p898, p899, p900, p901)
	local color3 = Color3.fromRGB(220, 183, 0)

	PowerUpSelf(p898, p899, p900, p901, color3, "TransformYelling", "GiantLaser2", "rbxassetid://358965513", 1.25, 30)
end
function module.SubspaceTripminePlant(_, _, _, _)
	audioServicePlaySound("Tripmine")
end
function module.SubspaceTripmine(p906, p907, _, _)
	audioServicePlaySound("Tripmine")
	task.spawn(function()
		effectsService.ShakeInOut(p907, p907.Position, 1.5, 0.005)
	end)

	local color3 = Color3.fromRGB(255, 0, 251)
	local v2207 = uDim2New(0, 0, 0, 0)
	local uDim2 = UDim2.new(0, p907.AbsolutePosition.X, 0, p907.AbsolutePosition.Y)
	local uDim2118 = UDim2.new(0, p907.AbsoluteSize.X * 0.5, 0, p907.AbsoluteSize.Y * 0.5)
	local v2210 = effectsServiceNewerCircle(p906, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "http://www.roblox.com/asset/?id=249902641",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v2207,
		Position = uDim2 + uDim2118
	})
	local color368 = Color3.fromRGB(255, 0, 251)
	local v2212 = uDim2New(0, 0, 0, 0)
	local uDim2119 = UDim2.new(0, p907.AbsolutePosition.X, 0, p907.AbsolutePosition.Y)
	local uDim2120 = UDim2.new(0, p907.AbsoluteSize.X * 0.5, 0, p907.AbsoluteSize.Y * 0.5)
	local v2215 = effectsServiceNewerCircle(p906, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "http://www.roblox.com/asset/?id=249902641",
		ZIndex = 1000001,
		ImageColor3 = color368,
		Size = v2212,
		Position = uDim2119 + uDim2120
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2217 = UDim2.fromOffset(p907.AbsoluteSize.Y * 2, p907.AbsoluteSize.Y * 2)

	animationAnimateAsync(v2210, { ImageTransparency = 1, Size = v2217 }, 1, "InOut", "Quart")
	task.wait(0.5)

	local animateAsync = animation.AnimateAsync

	v2217 = UDim2.fromOffset(p907.AbsoluteSize.Y * 10, p907.AbsoluteSize.Y * 10)
	animateAsync(v2215, { Size = v2217 }, 3, "Out", "Quart")
	task.wait(1)
	task.spawn(function()
		animation.Animate(v2215, { ImageTransparency = 1 }, 2, "Out", "Quart")
		v2210:Destroy()
		v2215:Destroy()
	end)
end
function module.LuckyCoinPass(p910, _, p912, _)
	local color3 = Color3.fromRGB(255, 255, 255)
	local n1 = p912.ZIndex + 100001
	local v2225 = UDim2.fromOffset(p912.AbsoluteSize.Y, p912.AbsoluteSize.Y)
	local v2226 = UDim2.fromScale(0.5, 1.25)
	local v2227 = effectsServiceNewerCircle(p910, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://14298438246",
		Rotation = 180,
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v2225,
		Position = v2226
	})

	task.spawn(function()
		for _ = 1, 7 do
			local animationAnimate = animation.Animate
			local v3845 = UDim2.fromOffset(p912.AbsoluteSize.Y, 0)

			animationAnimate(v2227, { Size = v3845 }, 0.07, "Out", "Linear")

			local v3846 = v2227

			v3846.Rotation = v3846.Rotation + 180

			local animate = animation.Animate

			v3845 = UDim2.fromOffset(p912.AbsoluteSize.Y, p912.AbsoluteSize.Y)
			animate(v2227, { Size = v3845 }, 0.07, "Out", "Linear")
		end
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v2229 = UDim2.fromScale(0.5, 0.3)

	animationAnimateAsync(v2227, { Position = v2229 }, 0.75, "Out", "Quart")
	audioServicePlaySound("Toot")
	task.wait(0.25)
	audioServicePlaySound("BoomerangThrow")
	task.wait(0.25)

	local animationAnimate = animation.Animate

	v2229 = UDim2.fromScale(0.5, 0.5)
	animationAnimate(v2227, { Position = v2229 }, 0.5, "In", "Quart")
	audioServicePlaySound("Target Or Select")
	task.wait(0.5)
	task.spawn(function()
		animation.Animate(v2227, { ImageTransparency = 1 }, 0.75, "Out", "Quart")
		v2227:Destroy()
	end)
end
function module.LuckyCoinFail(p914, _, p916, _)
	local color3 = Color3.fromRGB(255, 255, 255)
	local n1 = p916.ZIndex + 100001
	local v2237 = UDim2.fromOffset(p916.AbsoluteSize.Y, p916.AbsoluteSize.Y)
	local v2238 = UDim2.fromScale(0.5, 1.25)
	local v2239 = effectsServiceNewerCircle(p914, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://14298438246",
		Rotation = 0,
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v2237,
		Position = v2238
	})

	task.spawn(function()
		for _ = 1, 7 do
			local animationAnimate = animation.Animate
			local v3850 = UDim2.fromOffset(p916.AbsoluteSize.Y, 0)

			animationAnimate(v2239, { Size = v3850 }, 0.07, "Out", "Linear")

			local v3851 = v2239

			v3851.Rotation = v3851.Rotation + 180

			local animate = animation.Animate

			v3850 = UDim2.fromOffset(p916.AbsoluteSize.Y, p916.AbsoluteSize.Y)
			animate(v2239, { Size = v3850 }, 0.07, "Out", "Linear")
		end
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v2241 = UDim2.fromScale(0.5, 0.3)

	animationAnimateAsync(v2239, { Position = v2241 }, 0.75, "Out", "Quart")
	audioServicePlaySound("Toot")
	task.wait(0.25)
	audioServicePlaySound("BoomerangThrow")
	task.wait(0.25)

	local animationAnimate = animation.Animate

	v2241 = UDim2.fromScale(0.5, 0.5)
	animationAnimate(v2239, { Position = v2241 }, 0.5, "In", "Quart")
	audioServicePlaySound("bane end")
	task.wait(0.5)
	task.spawn(function()
		animation.Animate(v2239, { ImageTransparency = 1 }, 0.75, "Out", "Quart")
		v2239:Destroy()
	end)
end

local t5: {[any]: any} = { ["."] = 0.2, ["!"] = 0.4, ["?"] = 0.4 }

local function EnemySpeech(parent, p919, p920, p921)
	local clone = game:GetService("ReplicatedStorage").UI.TextTemplate:Clone()

	clone.Parent = parent
	clone.Position = UDim2.fromOffset(p919.AbsolutePosition.X + p919.AbsoluteSize.X / 2, p919.AbsolutePosition.Y + p919.AbsoluteSize.Y)
	clone.Visible = true

	local v2248 = UDim2.fromOffset(p919.AbsolutePosition.X + p919.AbsoluteSize.X / 2 - clone.TextTail.AbsoluteSize.X / 2, p919.AbsolutePosition.Y + p919.AbsoluteSize.Y + clone.AbsoluteSize.Y)

	clone:TweenPosition(v2248, "Out", "Quart", 0.5)

	local replacedText = p920:gsub("<br%s*/>", "\n")

	replacedText:gsub("<[^<>]->", "")
	clone.Text = replacedText

	local n1: number = 0

	for iterFirst, iterSecond in utf8.graphemes(replacedText) do
		local substring = clone.ContentText:sub(iterFirst, iterSecond)

		n1 += 1
		clone.MaxVisibleGraphemes = n1

		if n1 % 2 == 0 then
			audioService.PlaySound(p921 or "clickfast.wav")
		end

		task.wait(t5[substring] or 0.02)
	end

	task.wait(1)
	task.spawn(function()
		animation.AnimateAsync(clone.TextTail, { ImageTransparency = 1 }, 1, "In", "Quart")
		animation.Animate(clone, { TextTransparency = 1, BackgroundTransparency = 1 }, 1, "In", "Quart")
		clone:Destroy()
	end)
end
function module.LostFamileyWin(p922, _, _, _)
	local textButton = p922.Parent.BattleNew.EnemyPlayerSlot:FindFirstChildWhichIsA("TextButton")

	EnemySpeech(p922, textButton, "What the... Willie? Oh man..! Smileys, retreat and get some enzyme here pronto!")
end
function module.Fire(p926, p927, p928, _)
	effectsServicePreloadTech(p926, effectsServiceBreathimages.fire)
	task.spawn(function()
		while p928 do
			local color3 = Color3.fromRGB(185, 83, 70)
			local color369 = Color3.fromRGB(238, 96, 24)
			local n1 = p927.ZIndex - 1
			local v3856 = uDim2New(0, p928.AbsoluteSize.X / 1.5, 0, p928.AbsoluteSize.X / 1.5)
			local v3857 = p928
			local uDim2 = UDim2.new(0, v3857.AbsolutePosition.X, 0, v3857.AbsolutePosition.Y)
			local uDim2121 = UDim2.new(0, v3857.AbsoluteSize.X * 0.5, 0, v3857.AbsoluteSize.Y * 0.5)
			local uDim2FromOffset = UDim2.fromOffset
			local randomNumber = math.random(p928.AbsoluteSize.X / 2 * -1, p928.AbsoluteSize.X / 2)

			v3857 = uDim2FromOffset(randomNumber, p928.AbsoluteSize.Y / 2)

			local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
			local randomNumber48 = math.random(1, #effectsServiceBreathimages.fire)
			local v3864 = effectsServiceBreathimagesFire[randomNumber48]
			local randomNumber49 = math.random(0, 360)
			local v3866 = effectsServiceNewerCircle(p926, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				BackgroundColor3 = color3,
				ImageColor3 = color369,
				ZIndex = n1,
				Size = v3856,
				Position = uDim2 + uDim2121 + v3857,
				Image = v3864,
				Rotation = randomNumber49
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v4222 = p928
				local uDim2122 = UDim2.new(0, v4222.AbsolutePosition.X, 0, v4222.AbsolutePosition.Y)
				local uDim2123 = UDim2.new(0, v4222.AbsoluteSize.X * 0.5, 0, v4222.AbsoluteSize.Y * 0.5)
				local uDim2FromOffset = UDim2.fromOffset
				local randomNumber50 = math.random(p928.AbsoluteSize.X / 4 * -1, p928.AbsoluteSize.X / 4)

				v4222 = uDim2FromOffset(randomNumber50, p928.AbsoluteSize.Y / 2)
				animationAnimate(v3866, { ImageTransparency = 1, Position = uDim2122 + uDim2123 - v4222 }, 2, "Out", "Quart")
				v3866:Destroy()
			end)
			task.wait(0.05)
		end
	end)
end
function module.Dizzy(p930, p931, _, _)
	effectsServicePreloadTech(p930, { "rbxassetid://13500189618" })
	audioServicePlaySound("Bonk")

	local color3 = Color3.fromRGB(240, 212, 55)
	local v2268 = UDim2.fromOffset(p931.AbsoluteSize.X, p931.AbsoluteSize.X)
	local v2269 = UDim2.fromOffset(p931.AbsoluteSize.Y * 3, p931.AbsoluteSize.Y * 2)
	local v2270 = UDim2.fromScale(0.5, 0.5)
	local v2271 = effectsServiceNewerCircle(p930, {
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Size = v2269,
		Position = v2270
	})

	effectsServiceBreath(p930, v2271, v2271, {
		Projectile = "rbxassetid://13500189618",
		Strength = 10,
		Time = 1,
		Lifetime = 1,
		Color = color3,
		Size = v2268
	})
	task.spawn(function()
		task.wait(1)
		v2271:Destroy()
	end)
end
function module.TurnOnParaseleneAmulet(p934, parent, _, _, _)
	local paraseleneAmuletIndicator = parent:FindFirstChild("ParaseleneAmuletIndicator")

	if not paraseleneAmuletIndicator then
		paraseleneAmuletIndicator = Instance.new("BoolValue")
		paraseleneAmuletIndicator.Name = "ParaseleneAmuletIndicator"
		paraseleneAmuletIndicator.Parent = parent
	end

	audioServicePlaySound("portal2")
	paraseleneAmuletIndicator.Value = true

	local animationAnimateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(112, 236, 255)

	animationAnimateAsync(parent, { ImageColor3 = color3 }, 1, "Out", "Quart")
	task.spawn(function()
		while paraseleneAmuletIndicator.Value == true and parent.Parent ~= nil do
			local color370 = Color3.fromRGB(185, 83, 70)
			local color371 = Color3.fromRGB(238, 238, 238)
			local n1 = parent.ZIndex + 100000
			local v3870 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.X)
			local v3871 = parent
			local uDim2 = UDim2.new(0, v3871.AbsolutePosition.X, 0, v3871.AbsolutePosition.Y)
			local uDim2124 = UDim2.new(0, v3871.AbsoluteSize.X * 0.5, 0, v3871.AbsoluteSize.Y * 0.5)
			local uDim2FromOffset = UDim2.fromOffset
			local randomNumber = math.random(parent.AbsoluteSize.X / 2 * -1, parent.AbsoluteSize.X / 2)

			v3871 = uDim2FromOffset(randomNumber, parent.AbsoluteSize.Y / 2)

			local randomNumber51 = math.random(0, 360)
			local v3877 = effectsServiceNewerCircle(p934, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://298984512",
				BackgroundColor3 = color370,
				ImageColor3 = color371,
				ZIndex = n1,
				Size = v3870,
				Position = uDim2 + uDim2124 + v3871,
				Rotation = randomNumber51
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v4228 = parent
				local uDim2125 = UDim2.new(0, v4228.AbsolutePosition.X, 0, v4228.AbsolutePosition.Y)
				local uDim2126 = UDim2.new(0, v4228.AbsoluteSize.X * 0.5, 0, v4228.AbsoluteSize.Y * 0.5)
				local uDim2FromOffset = UDim2.fromOffset
				local randomNumber52 = math.random(parent.AbsoluteSize.X / 4 * -1, parent.AbsoluteSize.X / 4)

				v4228 = uDim2FromOffset(randomNumber52, parent.AbsoluteSize.Y / 1.5)
				animationAnimate(v3877, { ImageTransparency = 1, Position = uDim2125 + uDim2126 - v4228 }, 3, "Out", "Quart")
				v3877:Destroy()
			end)
			task.wait(0.2)
		end
	end)
end
function module.TurnOffParaseleneAmulet(_, p940, _, _, _)
	local paraseleneAmuletIndicator = p940:FindFirstChild("ParaseleneAmuletIndicator")

	if paraseleneAmuletIndicator then
		paraseleneAmuletIndicator.Value = false

		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(136, 136, 136)

		animationAnimateAsync(p940, { ImageColor3 = color3 }, 1, "Out", "Quart")
	end
end
local function MusicPulse(parent, p945, _, _, p948, p949)
	effectsServicePreloadTech(parent, { "rbxassetid://2866648598" })

	local musicCount = parent:FindFirstChild("MusicCount")

	if not musicCount then
		musicCount = Instance.new("IntValue")
		musicCount.Name = "MusicCount"
		musicCount.Parent = parent
		musicCount.Value = 1
	end

	if not p948 then
		p948 = Color3.fromRGB(255, 255, 255)
	end

	local s1: string = if not p949 then "Pulse" else p949 .. tostring(musicCount.Value)

	audioServicePlaySound(s1)

	local v2296 = uDim2New(0, 0, 0, 0)
	local uDim2 = UDim2.new(0, p945.AbsolutePosition.X, 0, p945.AbsolutePosition.Y)
	local uDim2127 = UDim2.new(0, p945.AbsoluteSize.X * 0.5, 0, p945.AbsoluteSize.Y * 0.5)
	local v2299 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = p948,
		Size = v2296,
		Position = uDim2 + uDim2127
	})
	local v2300 = UDim2.fromOffset(p945.AbsoluteSize.Y / 4, p945.AbsoluteSize.Y / 4)
	local uDim2128 = UDim2.new(0, p945.AbsolutePosition.X, 0, p945.AbsolutePosition.Y)
	local uDim2129 = UDim2.new(0, p945.AbsoluteSize.X * 0.5, 0, p945.AbsoluteSize.Y * 0.5)
	local v2303 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = p948,
		Size = v2300,
		Position = uDim2128 + uDim2129
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2305 = UDim2.fromOffset(p945.AbsoluteSize.Y, p945.AbsoluteSize.Y)

	animationAnimateAsync(v2299, { Size = v2305 }, 1, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v2305 = UDim2.fromOffset(p945.AbsoluteSize.Y * 1.25, p945.AbsoluteSize.Y * 1.25)
	animateAsync(v2303, { Size = v2305 }, 1, "Out", "Quart")
	task.spawn(function()
		effectsService.Shake(p945, p945.Position, 0.25, 0.1)
	end)
	task.wait(0.1)
	task.spawn(function()
		task.wait(0.2)
		animation.AnimateAsync(v2299, { ImageTransparency = 1 }, 0.35, "Out", "Quart")
		animation.Animate(v2303, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		v2299:Destroy()
		v2303:Destroy()
	end)
	musicCount.Value = musicCount.Value + 1

	if musicCount.Value > 3 then
		musicCount.Value = 1
	end
end
function module.RedMusicPulse(p950, p951, p952, p953)
	local color3 = Color3.fromRGB(255, 0, 0)

	MusicPulse(p950, p951, p952, p953, color3, "guitar")
end
function module.BlueMusicPulse(p954, p955, p956, p957)
	local color3 = Color3.fromRGB(0, 0, 255)

	MusicPulse(p954, p955, p956, p957, color3, "piano")
end
function module.YellowMusicPulse(p958, p959, p960, p961)
	local color3 = Color3.fromRGB(255, 225, 0)

	MusicPulse(p958, p959, p960, p961, color3, "flute")
end
function module.GuitarMusicPulse(p962, p963, p964, p965)
	local color3 = Color3.fromRGB(237, 33, 255)

	MusicPulse(p962, p963, p964, p965, color3, "guitar")
end
function module.BoxMusicPulse(p966, p967, p968, p969)
	local color3 = Color3.fromRGB(255, 233, 69)

	MusicPulse(p966, p967, p968, p969, color3, "guitar")
end
local function MusicPulseAlly(parent, p971, _, p973, p974, p975)
	effectsServicePreloadTech(parent, {
		"rbxassetid://2866648598",
		"rbxassetid://13780950231",
		"rbxassetid://470648206",
		"rbxassetid://170813352"
	})

	local v2338 = parent.Parent.BattleNew[(if p973 == "" then "Enemy" else if p973 == "Enemy" then "" else nil) .. "Field"]
	local t89: {[any]: any} = {
		"rbxassetid://13780950231",
		"rbxassetid://470648206",
		"rbxassetid://170813352"
	}
	local musicCount = parent:FindFirstChild("MusicCount")

	if not musicCount then
		musicCount = Instance.new("IntValue")
		musicCount.Name = "MusicCount"
		musicCount.Parent = parent
		musicCount.Value = 1
	end

	if not p974 then
		p974 = Color3.fromRGB(255, 255, 255)
	end

	local s1: string = if not p975 then "Pulse" else p975 .. tostring(musicCount.Value)

	audioServicePlaySound(s1)

	local randomNumber = math.random(1, #t89)
	local v2343 = t89[randomNumber]
	local v2344 = uDim2New(0, 0, 0, 0)
	local v2345 = uDim2New(0.5, 0, 0.5, 0)
	local randomNumber53 = math.random(-30, 30)
	local v2347 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 1000001,
		ImageColor3 = p974,
		Image = v2343,
		Size = v2344,
		Position = v2345,
		Rotation = randomNumber53
	})
	local v2348 = UDim2.fromOffset(p971.AbsoluteSize.Y / 4, p971.AbsoluteSize.Y / 4)
	local v2349 = uDim2New(0.5, 0, 0.5, 0)
	local v2350 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = p974,
		Size = v2348,
		Position = v2349
	})

	v2349 = UDim2.fromOffset(p971.AbsoluteSize.Y / 4, p971.AbsoluteSize.Y / 4)
	v2348 = uDim2New(0.5, 0, 0.5, 0)

	local v2351 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = p974,
		Size = v2349,
		Position = v2348
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2353 = UDim2.fromOffset(p971.AbsoluteSize.Y * 1.25, p971.AbsoluteSize.Y * 1.25)

	animationAnimateAsync(v2347, { Size = v2353 }, 1, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v2353 = UDim2.fromOffset(p971.AbsoluteSize.Y * 1.75, p971.AbsoluteSize.Y * 1.75)
	animateAsync(v2350, { Size = v2353 }, 0.85, "Out", "Quart")

	local v2355 = animation.AnimateAsync

	v2353 = UDim2.fromOffset(p971.AbsoluteSize.Y * 2.25, p971.AbsoluteSize.Y * 2.25)
	v2355(v2351, { Size = v2353 }, 0.7, "Out", "Quart")
	task.wait(0.1)
	task.spawn(function()
		task.wait(0.2)
		animation.AnimateAsync(v2347, { ImageTransparency = 1 }, 0.3, "Out", "Quart")
		animation.AnimateAsync(v2350, { ImageTransparency = 1 }, 0.45, "Out", "Quart")
		animation.Animate(v2351, { ImageTransparency = 1 }, 0.6, "Out", "Quart")
		v2347:Destroy()
		v2350:Destroy()
		v2351:Destroy()
	end)
	musicCount.Value = musicCount.Value + 1

	if musicCount.Value > 3 then
		musicCount.Value = 1
	end
end
function module.RedMusicPulseAlly(p976, p977, p978, p979)
	local color3 = Color3.fromRGB(255, 0, 0)

	MusicPulseAlly(p976, p977, p978, p979, color3, "guitar")
end
function module.BlueMusicPulseAlly(p980, p981, p982, p983)
	local color3 = Color3.fromRGB(0, 0, 255)

	MusicPulseAlly(p980, p981, p982, p983, color3, "piano")
end
function module.YellowMusicPulseAlly(p984, p985, p986, p987)
	local color3 = Color3.fromRGB(255, 225, 0)

	MusicPulseAlly(p984, p985, p986, p987, color3, "flute")
end
function module.GuitarMusicPulseAlly(p988, p989, p990, p991)
	local color3 = Color3.fromRGB(237, 33, 255)

	MusicPulseAlly(p988, p989, p990, p991, color3, "guitar")
end
function module.BoxMusicPulseAlly(p992, p993, p994, p995)
	local color3 = Color3.fromRGB(255, 233, 69)

	MusicPulseAlly(p992, p993, p994, p995, color3, "guitar")
end
function module.TurnOnEncore(parent, _, _, p999, _)
	local v2386 = parent.Parent.BattleNew["Virtual" .. p999 .. "Field"]
	local foundChild = parent:FindFirstChild(p999 .. "EncoreIndicator")

	if not foundChild then
		foundChild = Instance.new("BoolValue")
		foundChild.Name = p999 .. "EncoreIndicator"
		foundChild.Parent = parent
	elseif foundChild.Value == true then
		return
	end

	foundChild.Value = true
	task.spawn(function()
		local n1: number = 1

		while foundChild.Parent == parent and foundChild.Value == true do
			local color3 = Color3.fromRGB(255, 0, 0)
			local color372 = Color3.fromRGB(0, 0, 255)
			local t127: {[any]: any} = { color3, color372, Color3.fromRGB(190, 165, 0) }
			local v3882 = t127[n1]
			local zIndex = v2386.ZIndex
			local v3884 = uDim2New(0, v2386.AbsoluteSize.X, 0, v2386.AbsoluteSize.Y)
			local v3885 = v2386
			local uDim2 = UDim2.new(0, v3885.AbsolutePosition.X, 0, v3885.AbsolutePosition.Y)
			local uDim2130 = UDim2.new(0, v3885.AbsoluteSize.X * 0.5, 0, v3885.AbsoluteSize.Y * 0.5)
			local v3888 = effectsServiceNewerCircle(parent, {
				BackgroundTransparency = 0.7,
				ImageTransparency = 1,
				BorderSizePixel = 0,
				BackgroundColor3 = v3882,
				ZIndex = zIndex,
				Size = v3884,
				Position = uDim2 + uDim2130,
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3885 = UDim2.fromOffset(v2386.AbsoluteSize.X * 1.05, v2386.AbsoluteSize.Y * 1.1)
			animationAnimateAsync(v3888, { BackgroundTransparency = 1, Size = v3885 }, 1, "Out", "Quart")
			n1 += 1
			audioServicePlaySound("kick-deep")

			if n1 > 3 then
				n1 = 1
			end

			task.wait(1)
			v3888:Destroy()
		end
	end)
end
function module.TurnOffEncore(p1001, _, _, p1004, _)
	local foundChild = p1001:FindFirstChild(p1004 .. "EncoreIndicator")

	if foundChild then
		foundChild.Value = false
	end
end
function module.WetShrapnel(p1006, p1007, parent, p1009)
	local n1 = parent.ZIndex + 100
	local v2399 = UDim2.fromScale(0.95, 0.95)
	local v2400 = UDim2.fromScale(0.5, 0.5)
	local color3 = Color3.fromRGB(255, 0, 255)
	local v2402 = effectsServiceNewerCircle(p1006, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13487272639",
		ImageTransparency = 0,
		Rotation = 0,
		ZIndex = n1,
		Size = v2399,
		Position = v2400,
		ImageColor3 = color3,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v2402
	v2402.Parent = parent
	audioServicePlaySound("toon beep")
	audioServicePlaySound("dbzswordout")
	task.spawn(function()
		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v2402.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.08)
		end
	end)
	task.wait(0.5)

	local s1

	if p1009 == "" then
		s1 = "Enemy"
	elseif p1009 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	effectsService.ShakeSync(parent, parent.Position, 0.2, 0.2)
	audioServicePlaySound("headexplosion")
	CutInHalf(parent)
	task.spawn(function()
		local color373 = Color3.fromRGB(0, 0, 0)
		local color374 = Color3.fromRGB(255, 0, 230)
		local n1 = parent.ZIndex + 100000
		local v3896 = uDim2New(0, parent.AbsoluteSize.Y * 1.1, 0, parent.AbsoluteSize.Y * 1.1)
		local v3897 = parent
		local uDim2 = UDim2.new(0, v3897.AbsolutePosition.X, 0, v3897.AbsolutePosition.Y)
		local uDim2131 = UDim2.new(0, v3897.AbsoluteSize.X * 0.5, 0, v3897.AbsoluteSize.Y * 0.5)

		v3897 = UDim2.fromOffset(0, parent.AbsoluteSize.Y / 2)

		local v3900 = effectsServiceNewerCircle(p1006, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://14738773403",
			Rotation = 90,
			BackgroundColor3 = color373,
			ImageColor3 = color374,
			ZIndex = n1,
			Size = v3896,
			Position = uDim2 + uDim2131 - v3897,
			ImageRectSize = Vector2.new(341.3, 341.3)
		})
		local uiAspectRatioConstraint3: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		uiAspectRatioConstraint3.Parent = v3900

		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v3900.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.05)
		end

		v3900:Destroy()
	end)
	task.wait(0.5)
	audioServicePlaySound("recreation")
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1007.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.25, 0.002)
			end)
		end
	end)
	task.wait(1.25)
	task.spawn(function()
		animation.Animate(v2402, { ImageTransparency = 1 }, 1, "Out", "Quart")
		v2402:Destroy()
	end)
end
function module.Criticism(p1010, p1011, _)
	audioServicePlaySound("Elevator Ding")
	audioServiceDimSongs()

	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p1011.ZIndex + 99999
	local v2411 = uDim2New(1, 0, 2, 0)
	local v2412 = uDim2New(0.5, 0, 0.5, 0)
	local v2413 = effectsServiceNewerCircle(p1010, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v2411,
		Position = v2412
	})

	effectsServiceSetCardZIndex(p1011, p1011.ZIndex + 99999)
	animation.AnimateAsync(v2413, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	task.wait(1)
	task.spawn(function()
		animation.Animate(v2413, { BackgroundTransparency = 1 }, 1, "Out", "Quart")
		v2413:Destroy()
		audioServiceUndimSongs()
		effectsServiceSetCardZIndex(p1011, p1011.ZIndex - 99999)
	end)
end
function module.Failsafe(p1013, p1014, _, _)
	effectsServiceSetCardZIndex(p1014, p1014.ZIndex + 99999)

	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p1014.ZIndex - 1
	local v2420 = uDim2New(1, 0, 2, 0)
	local v2421 = uDim2New(0.5, 0, 0.5, 0)
	local v2422 = effectsServiceNewerCircle(p1013, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v2420,
		Position = v2421
	})

	animation.AnimateAsync(v2422, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
	audioServicePlaySound("Nuke")
	task.wait(0.5)
	task.spawn(function()
		effectsService.ShakeInOut(p1014, p1014.Position, 2, 0.0025)
	end)

	local color375 = Color3.fromRGB(255, 255, 255)
	local v2424 = uDim2New(0, 0, 0, 0)
	local uDim2 = UDim2.new(0, p1014.AbsolutePosition.X, 0, p1014.AbsolutePosition.Y)
	local uDim2132 = UDim2.new(0, p1014.AbsoluteSize.X * 0.5, 0, p1014.AbsoluteSize.Y * 0.5)
	local v2427 = effectsServiceNewerCircle(p1013, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "http://www.roblox.com/asset/?id=249902641",
		ZIndex = 1000001,
		ImageColor3 = color375,
		Size = v2424,
		Position = uDim2 + uDim2132
	})

	task.wait(1)
	animation.AnimateAsync(v2422, { BackgroundTransparency = 1 }, 0.5, "Out", "Quad")
	effectsService.ShakeBattleSync(p1013, 2, 1)
	effectsServiceSetCardZIndex(p1014, p1014.ZIndex - 99999)

	local animationAnimateAsync = animation.AnimateAsync
	local v2429 = UDim2.fromOffset(p1014.AbsoluteSize.Y * 20, p1014.AbsoluteSize.Y * 20)

	animationAnimateAsync(v2427, { Size = v2429 }, 2, "Out", "Quart")
	task.wait(1)
	task.spawn(function()
		animation.Animate(v2427, { ImageTransparency = 1 }, 2, "Out", "Quart")
		v2427:Destroy()
		v2422:Destroy()
	end)
end
function module.StudlingWhistle(p1017, p1018, _, _, _, _)
	audioServicePlaySound("Whistle")

	local color3 = Color3.fromRGB(255, 47, 217)
	local v2437 = uDim2New(0, 0, 0, 0)
	local uDim2 = UDim2.new(0, p1018.AbsolutePosition.X, 0, p1018.AbsolutePosition.Y)
	local uDim2133 = UDim2.new(0, p1018.AbsoluteSize.X * 0.5, 0, p1018.AbsoluteSize.Y * 0.5)
	local v2440 = effectsServiceNewerCircle(p1017, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = color3,
		Size = v2437,
		Position = uDim2 + uDim2133
	})
	local color376 = Color3.fromRGB(255, 255, 255)
	local v2442 = UDim2.fromOffset(p1018.AbsoluteSize.Y / 4, p1018.AbsoluteSize.Y / 4)
	local uDim2134 = UDim2.new(0, p1018.AbsolutePosition.X, 0, p1018.AbsolutePosition.Y)
	local uDim2135 = UDim2.new(0, p1018.AbsoluteSize.X * 0.5, 0, p1018.AbsoluteSize.Y * 0.5)
	local v2445 = effectsServiceNewerCircle(p1017, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://2866648598",
		ZIndex = 1000001,
		ImageColor3 = color376,
		Size = v2442,
		Position = uDim2134 + uDim2135
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2447 = UDim2.fromOffset(p1018.AbsoluteSize.Y, p1018.AbsoluteSize.Y)

	animationAnimateAsync(v2440, { Size = v2447 }, 1, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v2447 = UDim2.fromOffset(p1018.AbsoluteSize.Y * 1.25, p1018.AbsoluteSize.Y * 1.25)
	animateAsync(v2445, { Size = v2447 }, 1, "Out", "Quart")
	task.spawn(function()
		effectsService.Shake(p1018, p1018.Position, 0.25, 0.1)
	end)
	task.wait(0.1)
	task.spawn(function()
		task.wait(0.2)
		animation.AnimateAsync(v2440, { ImageTransparency = 1 }, 0.35, "Out", "Quart")
		animation.Animate(v2445, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		v2440:Destroy()
		v2445:Destroy()
	end)
end
function module.MoneyCannon(p1023, p1024, p1025, _, _)
	audioServicePlaySound("LargeImpact")
	audioServicePlaySound("gold01")

	local v2454 = UDim2.fromOffset(p1025.AbsoluteSize.X / 2, p1025.AbsoluteSize.X / 1.8)

	effectsService.ShakeSync(p1024, p1024.Position, 0.25, 0.1)
	effectsServiceBreath(p1023, p1024, p1025, {
		Projectile = "rbxassetid://10658626571",
		Strength = 1000,
		Time = 0.3,
		Size = v2454
	})
	task.wait(0.2)
	effectsService.ShakeSync(p1025, p1025.Position, 0.5, 0.2)

	for _ = 1, 10 do
		audioServicePlaySound("crack")
		task.wait(0.03)
	end
end
function module.AncestryEnd(p1028, p1029, _, p1031, _)
	local n1: number = if p1031 == "" then 1 else 0
	local color3 = Color3.fromRGB(255, 255, 255)
	local v2463 = UDim2.fromOffset(p1029.AbsoluteSize.Y, p1029.AbsoluteSize.Y)
	local n2 = p1029.ZIndex + 100001
	local uDim2 = UDim2.new(0, p1029.AbsolutePosition.X, 0, p1029.AbsolutePosition.Y)
	local uDim2136 = UDim2.new(0, p1029.AbsoluteSize.X * 0.5, 0, p1029.AbsoluteSize.Y * 0.5)
	local v2467 = effectsServiceNewerCircle(p1028, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://6671852964",
		ImageTransparency = 1,
		ImageColor3 = color3,
		Size = v2463,
		ZIndex = n2,
		Position = uDim2 + uDim2136
	})

	audioServicePlaySound("demise2")
	animation.AnimateAsync(v2467, { Rotation = 720 }, 3, "Out", "Linear")
	animation.Animate(v2467, { ImageTransparency = 0 }, 0.5, "Out", "Quad")

	for _ = 1, 4 do
		audioServicePlaySound("demise")

		local v2469 = effectsServiceNewerCircle(p1028, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://245854775",
			ImageColor3 = Color3.fromRGB(255, 6, 10),
			Rotation = if n1 == 1 then 180 else 0,
			ZIndex = p1029.ZIndex + 100002,
			Size = UDim2.fromScale(1, 0.3),
			AnchorPoint = Vector2.new(0.5, n1),
			Position = UDim2.fromScale(0.5, n1)
		})
		local animationAnimateAsync = animation.AnimateAsync
		local uDim2FromScale = UDim2.fromScale
		local absoluteValue = math.abs(n1 - 1)
		local v2473 = uDim2FromScale(0.5, absoluteValue)

		animationAnimateAsync(v2469, { ImageTransparency = 1, Position = v2473 }, 1.5, "Out", "Quart")
		task.wait(0.1)
		task.spawn(function()
			task.wait(1)
			v2469:Destroy()
		end)
	end

	task.wait(0.5)
	animation.Animate(v2467, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
	v2467:Destroy()
end

local color3 = Color3.fromRGB(255, 0, 0)
local color377 = Color3.fromRGB(0, 255, 0)
local color378 = Color3.fromRGB(0, 0, 255)
local t6: {[any]: any} = { color3, color377, color378, Color3.fromRGB(255, 255, 0) }

function module.Traverse4(p1033, p1034, _, _, _)
	audioServicePlaySound("Earthquake Debris 5 (SFX)")
	effectsService.ShakeBattleSync(p1033, 0.3, 0.015)

	for _ = 1, 8 do
		audioServicePlaySound("Draw")

		for _ = 1, 16 do
			local n1 = p1034.ZIndex + 100000
			local uDim2 = UDim2.new(0, p1034.AbsoluteSize.X / 2.5, 0, p1034.AbsoluteSize.X / 2.5)
			local uDim2FromOffset = UDim2.fromOffset
			local randomNumber = math.random(0, p1033.Parent.AbsoluteSize.X)
			local v2485 = uDim2FromOffset(randomNumber, math.random(0, p1033.Parent.AbsoluteSize.Y))
			local randomNumber54 = math.random(0, 360)
			local v2487 = effectsServiceNewerCircle(p1033, {
				Image = "rbxassetid://15450836794",
				ImageTransparency = 0.2,
				ZIndex = n1,
				Size = uDim2,
				Position = v2485,
				Rotation = randomNumber54
			})
			local n2: number = 1

			if v2487.AbsolutePosition.X > p1033.Parent.AbsoluteSize.X / 2 then
				n2 = 3
			end

			if v2487.AbsolutePosition.Y > p1033.Parent.AbsoluteSize.Y / 2 then
				n2 += 1
			end

			v2487.ImageColor3 = t6[n2]
			task.spawn(function()
				task.spawn(function()
					effectsServiceSpritesheet(v2487, Vector2.new(256, 256), { 4, 4 }, 1, 16, 16)
				end)

				local animationAnimate = animation.Animate
				local v3908 = UDim2.fromScale(0.5, 0.5)

				animationAnimate(v2487, {
					ImageTransparency = 0.5,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = v3908
				}, 1.5, "In", "Quad")
				v2487:Destroy()
			end)
		end

		task.wait(0.15)
	end
end
function module.Fimbulvetr(p1038, _, p1040, _, _)
	audioServicePlaySound("Fimbulvetr")
	effectsServiceSetCardZIndex(p1040, p1040.ZIndex + 99999)

	local color379 = Color3.fromRGB(0, 0, 0)
	local n1 = p1040.ZIndex - 1
	local v2496 = uDim2New(1, 0, 2, 0)
	local v2497 = uDim2New(0.5, 0, 0.5, 0)
	local v2498 = effectsServiceNewerCircle(p1038, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color379,
		ZIndex = n1,
		Size = v2496,
		Position = v2497
	})

	for i = 1, 2 do
		local color380 = Color3.fromRGB(0, 0, 0)
		local n2 = p1040.ZIndex + 1
		local v2502 = UDim2.fromOffset(p1040.AbsoluteSize.Y, p1040.AbsoluteSize.Y)
		local uDim2 = UDim2.new(0, p1040.AbsolutePosition.X, 0, p1040.AbsolutePosition.Y)
		local uDim2137 = UDim2.new(0, p1040.AbsoluteSize.X * 0.5, 0, p1040.AbsoluteSize.Y * 0.5)
		local v2505 = effectsServiceNewerCircle(p1038, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15451200982",
			ImageTransparency = 0,
			BackgroundColor3 = color380,
			ZIndex = n2,
			Size = v2502,
			Position = uDim2 + uDim2137,
			Rotation = i * 180
		})

		task.spawn(function()
			effectsServiceSpritesheet(v2505, Vector2.new(256, 256), { 4, 4 }, 1, 16, 16)
			v2505:Destroy()
		end)
	end

	animation.AnimateAsync(v2498, { BackgroundTransparency = 0.1 }, 0.3, "Out", "Quad")
	task.wait(0.9)
	animation.Animate(v2498, { BackgroundTransparency = 1 }, 0.2, "Out", "Quad")

	local color381 = Color3.fromRGB(129, 244, 255)
	local v2507 = uDim2New(0, 0, 0, 0)
	local v2508 = effectsServiceNewerCircle(p1038, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000001,
		ImageColor3 = color381,
		Size = v2507,
		Position = p1040 and UDim2.new(0, p1040.AbsolutePosition.X, 0, p1040.AbsolutePosition.Y) + UDim2.new(0, p1040.AbsoluteSize.X * 0.5, 0, p1040.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local color382 = Color3.fromRGB(108, 255, 255)
	local v2510 = UDim2.fromOffset(p1040.AbsoluteSize.Y * 1.9, p1040.AbsoluteSize.Y * 1.9)
	local v2511 = effectsServiceNewerCircle(p1038, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://511406127",
		ZIndex = 1000000,
		ImageColor3 = color382,
		Size = v2510,
		Position = p1040 and UDim2.new(0, p1040.AbsolutePosition.X, 0, p1040.AbsolutePosition.Y) + UDim2.new(0, p1040.AbsoluteSize.X * 0.5, 0, p1040.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2513 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v2511, { ImageTransparency = 1, Size = v2513 }, 1, "Out", "Quint")
	task.wait(0.5)
	effectsService.ShakeSync(p1040, p1040.Position, 0.5, 0.1)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v3910 = UDim2.fromOffset(p1040.AbsoluteSize.Y * 2, p1040.AbsoluteSize.Y * 2)

		animationAnimate(v2508, { ImageTransparency = 1, Size = v3910 }, 2, "Out", "Quint")
		v2508:Destroy()
		v2511:Destroy()
	end)
	task.wait(0.4)
	v2498:Destroy()
	effectsServiceSetCardZIndex(p1040, p1040.ZIndex - 99999)
end
function module.Globus(p1043, p1044, _, _, _)
	audioServicePlaySound("bless")
	effectsServiceSetCardZIndex(p1044, p1044.ZIndex + 99999)

	local color383 = Color3.fromRGB(0, 0, 0)
	local n1 = p1044.ZIndex - 1
	local v2521 = uDim2New(1, 0, 2, 0)
	local v2522 = uDim2New(0.5, 0, 0.5, 0)
	local v2523 = effectsServiceNewerCircle(p1043, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color383,
		ZIndex = n1,
		Size = v2521,
		Position = v2522
	})

	animation.AnimateAsync(v2523, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
	audioServicePlaySound("Nuke")
	task.wait(0.5)
	task.spawn(function()
		effectsService.ShakeInOut(p1044, p1044.Position, 2, 0.0025)
	end)

	local color384 = Color3.fromRGB(255, 255, 255)
	local v2525 = uDim2New(0, 0, 0, 0)
	local uDim2 = UDim2.new(0, p1044.AbsolutePosition.X, 0, p1044.AbsolutePosition.Y)
	local uDim2138 = UDim2.new(0, p1044.AbsoluteSize.X * 0.5, 0, p1044.AbsoluteSize.Y * 0.5)
	local v2528 = effectsServiceNewerCircle(p1043, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "http://www.roblox.com/asset/?id=249902641",
		ZIndex = 1000001,
		ImageColor3 = color384,
		Size = v2525,
		Position = uDim2 + uDim2138
	})

	task.wait(1)
	animation.AnimateAsync(v2523, { BackgroundTransparency = 1 }, 0.5, "Out", "Quad")
	effectsService.ShakeBattleSync(p1043, 2, 1)
	effectsServiceSetCardZIndex(p1044, p1044.ZIndex - 99999)

	local animationAnimateAsync = animation.AnimateAsync
	local v2530 = UDim2.fromOffset(p1044.AbsoluteSize.Y * 10, p1044.AbsoluteSize.Y * 10)

	animationAnimateAsync(v2528, { Size = v2530 }, 2, "Out", "Quart")
	task.wait(1)
	task.spawn(function()
		animation.Animate(v2528, { ImageTransparency = 1 }, 2, "Out", "Quart")
		v2528:Destroy()
		v2523:Destroy()
	end)
end
function module.Nocere(_, _, _, _, _)
	audioServicePlaySound("Injure")
	audioServicePlaySound("Bone Break")
end
function module.WindUpPunch(p1053, p1054, p1055)
	local n1 = p1055.ZIndex + 10001
	local uDim2 = UDim2.new(0, p1055.AbsoluteSize.X * 2, 0, p1055.AbsoluteSize.X * 2)
	local uDim2139 = UDim2.new(0, p1055.AbsolutePosition.X + p1055.AbsoluteSize.X / 2, 0, p1055.AbsolutePosition.Y + p1055.AbsoluteSize.Y / 2)
	local v2542 = effectsServiceNewerCircle(p1053, {
		Image = "rbxassetid://5090109153",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2139
	})
	local uDim2140 = UDim2.new(0, p1055.AbsoluteSize.X * 3.3, 0, p1055.AbsoluteSize.X * 3.3)

	v2542:TweenSize(uDim2140, "Out", "Quad", 0.15, true)
	task.wait(0.15)

	local uDim2141 = UDim2.new(0, p1055.AbsoluteSize.X / 1.5, 0, p1055.AbsoluteSize.X / 1.5)

	v2542:TweenSize(uDim2141, "In", "Quad", 0.075, true)
	task.wait(0.075)
	audioService.PlaySound("DBZ Punch")

	local n2 = p1055.ZIndex + 10000
	local uDim2142 = UDim2.new(0, p1055.AbsoluteSize.X * 0.9, 0, p1055.AbsoluteSize.X * 0.9)
	local uDim2143 = UDim2.new(0, p1055.AbsolutePosition.X + p1055.AbsoluteSize.X / 2, 0, p1055.AbsolutePosition.Y + p1055.AbsoluteSize.Y / 2)
	local v2548 = effectsServiceNewerCircle(p1053, {
		Image = "rbxassetid://5090165303",
		ZIndex = n2,
		Size = uDim2142,
		Position = uDim2143
	})

	effectsService.ShakeBattle(p1053, 0.1, 0.025)

	local uDim2144 = UDim2.new(0, p1055.AbsoluteSize.X * 1.3, 0, p1055.AbsoluteSize.X * 1.3)

	v2548:TweenSize(uDim2144, "Out", "Quad", 0.075, true)
	spawn(function()
		effectsService.Shake(p1054, p1054.Position, 0.12, 0.1)
	end)
	spawn(function()
		effectsService.Shake(p1055, p1055.Position, 0.4, 0.5)
	end)
	spawn(function()
		effectsService.Shake(v2548, v2548.Position, 0.4, 0.5)
	end)
	spawn(function()
		effectsService.Shake(v2542, v2542.Position, 0.4, 0.5)
	end)
	spawn(function()
		wait(0.6400000000000001)
		effectsService.TweenProperty(v2542, "ImageTransparency", 0, 1, 0.4)
		v2542:Destroy()
	end)
	spawn(function()
		wait(0.8)
		effectsService.TweenProperty(v2548, "ImageTransparency", 0, 1, 0.4)
		v2548:Destroy()
	end)
end
local function TutorialDownRightArrowIndicator(p1056, p1057)
	if p1056:FindFirstChild("TutorialArrow") then
		p1056.TutorialArrow:Destroy()
	end

	local iconHolderSlotsVisual = p1056.Parent.BattleNew.IconHolderSlotsVisual
	local color385 = Color3.fromRGB(16, 255, 24)
	local v2554 = UDim2.fromOffset(iconHolderSlotsVisual.AbsoluteSize.X * 1.5, iconHolderSlotsVisual.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1057.AbsolutePosition.X, 0, p1057.AbsolutePosition.Y)
	local uDim2145 = UDim2.new(0, p1057.AbsoluteSize.X * 0.5, 0, p1057.AbsoluteSize.Y * 0.5)
	local v2557 = UDim2.fromOffset(iconHolderSlotsVisual.AbsoluteSize.X / 1.5, -iconHolderSlotsVisual.AbsoluteSize.X / 1.5)
	local v2558 = effectsServiceNewerCircle(p1056, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 45,
		ZIndex = 1000000,
		ImageColor3 = color385,
		Size = v2554,
		Position = uDim2 + uDim2145 + v2557
	})
	local color386 = Color3.fromRGB(20, 20, 20)
	local v2560 = UDim2.fromScale(1, 1)
	local v2561 = UDim2.fromScale(0.53, 0.47)
	local v2562 = effectsServiceNewerCircle(v2558, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 0,
		ZIndex = 999999,
		ImageColor3 = color386,
		Size = v2560,
		Position = v2561
	})
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

	v2561 = v2558.Position
	v2557 = UDim2.fromOffset(-v2558.AbsoluteSize.X / 3, v2558.AbsoluteSize.X / 3)

	local color387 = Color3.fromRGB(60, 255, 0)
	local v2565 = v2558.Position
	local v2566 = UDim2.fromOffset(-v2558.AbsoluteSize.X / 3, v2558.AbsoluteSize.X / 3)
	local color388 = Color3.fromRGB(255, 255, 255)
	local u2568 = tweenService:Create(v2558, tweenInfo, { Position = v2561 + v2557, ImageColor3 = color387 })
	local u2569 = tweenService:Create(v2558, tweenInfo, { Position = v2565 - v2566, ImageColor3 = color388 })

	u2568:Play()
	u2569:Play()
	v2554 = function()
		if u2568 then
			u2568:Cancel()
			u2568 = nil
		end

		if u2569 then
			u2569:Cancel()
			u2569 = nil
		end
	end
	v2558.Destroying:Connect(function()
		if u2568 then
			u2568:Cancel()
			u2568 = nil
		end

		if u2569 then
			u2569:Cancel()
			u2569 = nil
		end
	end)
	animation.AnimateAsync(v2558, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	animation.AnimateAsync(v2562, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
end
function module.TutorialStudsIndicator(p1058, _, _, _)
	audioService.PlaySound("ClickSound")
	TutorialDownRightArrowIndicator(p1058, p1058.Parent.BattleNew.IconHolderSlotsVisual)
end
local function TutorialRightArrowIndicator(p1062, p1063)
	if p1062:FindFirstChild("TutorialArrow") then
		p1062.TutorialArrow:Destroy()
	end

	local iconHolderSlotsVisual = p1062.Parent.BattleNew.IconHolderSlotsVisual
	local color389 = Color3.fromRGB(16, 255, 24)
	local v2578 = UDim2.fromOffset(iconHolderSlotsVisual.AbsoluteSize.X * 1.5, iconHolderSlotsVisual.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1063.AbsolutePosition.X, 0, p1063.AbsolutePosition.Y)
	local uDim2146 = UDim2.new(0, p1063.AbsoluteSize.X * 0.5, 0, p1063.AbsoluteSize.Y * 0.5)
	local v2581 = UDim2.fromOffset(iconHolderSlotsVisual.AbsoluteSize.X, 0)
	local v2582 = effectsServiceNewerCircle(p1062, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 90,
		ZIndex = 1000000,
		ImageColor3 = color389,
		Size = v2578,
		Position = uDim2 + uDim2146 + v2581
	})
	local color390 = Color3.fromRGB(20, 20, 20)
	local v2584 = UDim2.fromScale(1, 1)
	local v2585 = UDim2.fromScale(0.53, 0.47)
	local v2586 = effectsServiceNewerCircle(v2582, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 0,
		ZIndex = 999999,
		ImageColor3 = color390,
		Size = v2584,
		Position = v2585
	})
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

	v2585 = v2582.Position
	v2581 = UDim2.fromOffset(-v2582.AbsoluteSize.X / 3, 0)

	local color391 = Color3.fromRGB(60, 255, 0)
	local v2589 = v2582.Position
	local v2590 = UDim2.fromOffset(-v2582.AbsoluteSize.X / 3, 0)
	local color392 = Color3.fromRGB(255, 255, 255)
	local u2592 = tweenService:Create(v2582, tweenInfo, { Position = v2585 + v2581, ImageColor3 = color391 })
	local u2593 = tweenService:Create(v2582, tweenInfo, { Position = v2589 - v2590, ImageColor3 = color392 })

	u2592:Play()
	u2593:Play()
	v2578 = function()
		if u2592 then
			u2592:Cancel()
			u2592 = nil
		end

		if u2593 then
			u2593:Cancel()
			u2593 = nil
		end
	end
	v2582.Destroying:Connect(function()
		if u2592 then
			u2592:Cancel()
			u2592 = nil
		end

		if u2593 then
			u2593:Cancel()
			u2593 = nil
		end
	end)
	animation.AnimateAsync(v2582, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	animation.AnimateAsync(v2586, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
end
function module.TutorialBaseplateIndicator(p1064)
	audioService.PlaySound("ClickSound")
	TutorialRightArrowIndicator(p1064, p1064.Parent.BattleNew.VirtualBaseplate)
end
function module.TutorialPointerDrag(p1065, p1066, p1067, _)
	if p1065:FindFirstChild("TutorialArrow") then
		p1065.TutorialArrow:Destroy()
	end

	local color393 = Color3.fromRGB(255, 255, 255)
	local v2600 = UDim2.fromOffset(p1066.AbsoluteSize.X / 1.5, p1066.AbsoluteSize.X / 1.5)
	local uDim2 = UDim2.new(0, p1066.AbsolutePosition.X, 0, p1066.AbsolutePosition.Y)
	local uDim2147 = UDim2.new(0, p1066.AbsoluteSize.X * 0.5, 0, p1066.AbsoluteSize.Y * 0.5)
	local v2603 = effectsServiceNewerCircle(p1065, {
		Name = "TutorialArrow",
		Image = "rbxassetid://13778914609",
		ImageTransparency = 1,
		ZIndex = 1000001,
		ImageColor3 = color393,
		Size = v2600,
		Position = uDim2 + uDim2147
	})
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local uDim2148 = UDim2.new(0, p1067.AbsolutePosition.X, 0, p1067.AbsolutePosition.Y)
	local uDim2149 = UDim2.new(0, p1067.AbsoluteSize.X * 0.5, 0, p1067.AbsoluteSize.Y * 0.5)
	local u2607 = tweenService:Create(v2603, tweenInfo, { Position = uDim2148 + uDim2149 })
	local n1: number = 0

	local function playArrowLoop()
		if not v2603.Parent then
			return
		end

		n1 += 1

		if n1 % 2 == 1 then
			audioService.PlaySound("Target Or Select Low")
		end

		u2607:Play()
		u2607.Completed:Wait()

		if not v2603.Parent then
			return
		end

		local animationAnimate = animation.Animate
		local v3912 = UDim2.fromOffset(p1066.AbsoluteSize.X / 1.5, p1066.AbsoluteSize.X / 1.5)
		local color394 = Color3.fromRGB(255, 255, 255)

		animationAnimate(v2603, { Rotation = 0, Size = v3912, ImageColor3 = color394 }, 0.5, "Out", "Quad")

		if not v2603.Parent then
			return
		end

		animation.Animate(v2603, { ImageTransparency = 1 }, 0.5, "Out", "Quad")

		local v3914 = p1066
		local uDim2150 = UDim2.new(0, v3914.AbsolutePosition.X, 0, v3914.AbsolutePosition.Y)
		local uDim2151 = UDim2.new(0, v3914.AbsoluteSize.X * 0.5, 0, v3914.AbsoluteSize.Y * 0.5)

		v2603.Position = uDim2150 + uDim2151
		v2603.ImageTransparency = 0
		task.wait(0.3)

		if not v2603.Parent then
			return
		end

		v2603.Size = UDim2.fromOffset(p1066.AbsoluteSize.X / 1.7, p1066.AbsoluteSize.X / 1.7)
		v2603.Rotation = -10
		v2603.ImageColor3 = Color3.fromRGB(0, 255, 4)
		task.wait(0.3)
		playArrowLoop()
	end

	v2603.Destroying:Connect(function()
		if u2607 then
			u2607:Cancel()
			u2607 = nil
		end
	end)
	animation.AnimateAsync(v2603, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	task.spawn(function()
		task.wait(0.3)

		if not v2603.Parent then
			return
		end

		v2603.Size = UDim2.fromOffset(p1066.AbsoluteSize.X / 1.7, p1066.AbsoluteSize.X / 1.7)
		v2603.Rotation = -10
		v2603.ImageColor3 = Color3.fromRGB(0, 255, 4)
		playArrowLoop()
	end)
end
function module.TutorialPointerClick(p1069, p1070, p1071, _)
	if p1069:FindFirstChild("TutorialArrow") then
		p1069.TutorialArrow:Destroy()
	end

	local color395 = Color3.fromRGB(255, 255, 255)
	local v2615 = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.5, p1070.AbsoluteSize.X / 1.5)
	local uDim2 = UDim2.new(0, p1070.AbsolutePosition.X, 0, p1070.AbsolutePosition.Y)
	local uDim2152 = UDim2.new(0, p1070.AbsoluteSize.X * 0.5, 0, p1070.AbsoluteSize.Y * 0.5)
	local v2618 = effectsServiceNewerCircle(p1069, {
		Name = "TutorialArrow",
		Image = "rbxassetid://13778914609",
		ImageTransparency = 1,
		ZIndex = 1000001,
		ImageColor3 = color395,
		Size = v2615,
		Position = uDim2 + uDim2152
	})
	local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local uDim2153 = UDim2.new(0, p1071.AbsolutePosition.X, 0, p1071.AbsolutePosition.Y)
	local uDim2154 = UDim2.new(0, p1071.AbsoluteSize.X * 0.5, 0, p1071.AbsoluteSize.Y * 0.5)
	local u2622 = tweenService:Create(v2618, tweenInfo, { Position = uDim2153 + uDim2154 })

	local function playLoopSound()
		if v2618.Parent then
			audioService.PlaySound("Target Or Select Low")
		end
	end

	local n1: number = 0

	local function playArrowLoop()
		if not v2618.Parent then
			return
		end

		n1 += 1

		if n1 % 2 == 1 then
			audioService.PlaySound("Target Or Select Low")
		end

		u2622:Play()
		u2622.Completed:Wait()

		if not v2618.Parent then
			return
		end

		task.wait(0.3)
		v2618.Size = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.7, p1070.AbsoluteSize.X / 1.7)
		v2618.Rotation = -10
		v2618.ImageColor3 = Color3.fromRGB(0, 255, 4)

		local animationAnimate = animation.Animate
		local v3918 = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.5, p1070.AbsoluteSize.X / 1.5)
		local color396 = Color3.fromRGB(255, 255, 255)

		animationAnimate(v2618, { Rotation = 0, Size = v3918, ImageColor3 = color396 }, 0.5, "Out", "Quad")
		animation.Animate(v2618, { ImageTransparency = 1 }, 0.5, "Out", "Quad")

		local v3920 = p1070
		local uDim2155 = UDim2.new(0, v3920.AbsolutePosition.X, 0, v3920.AbsolutePosition.Y)
		local uDim2156 = UDim2.new(0, v3920.AbsoluteSize.X * 0.5, 0, v3920.AbsoluteSize.Y * 0.5)

		v2618.Position = uDim2155 + uDim2156
		v2618.ImageTransparency = 0
		task.wait(0.3)
		v2618.Size = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.7, p1070.AbsoluteSize.X / 1.7)
		v2618.Rotation = -10
		v2618.ImageColor3 = Color3.fromRGB(0, 255, 4)

		local animate = animation.Animate

		v3918 = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.5, p1070.AbsoluteSize.X / 1.5)

		local color397 = Color3.fromRGB(255, 255, 255)

		animate(v2618, { Rotation = 0, Size = v3918, ImageColor3 = color397 }, 0.5, "Out", "Quad")

		if v2618.Parent then
			playArrowLoop()
		end
	end

	v2618.Destroying:Connect(function()
		if u2622 then
			u2622:Cancel()
			u2622 = nil
		end
	end)
	animation.AnimateAsync(v2618, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	task.spawn(function()
		task.wait(0.3)
		v2618.Size = UDim2.fromOffset(p1070.AbsoluteSize.X / 1.7, p1070.AbsoluteSize.X / 1.7)
		v2618.Rotation = -10
		v2618.ImageColor3 = Color3.fromRGB(0, 255, 4)
		playArrowLoop()
	end)
end
function module.TutorialPointerClickOnce(p1073, p1074, _, _)
	if p1073:FindFirstChild("TutorialArrow") then
		p1073.TutorialArrow:Destroy()
	end

	local color398 = Color3.fromRGB(255, 255, 255)
	local v2631 = UDim2.fromOffset(p1074.AbsoluteSize.X / 1.5, p1074.AbsoluteSize.X / 1.5)
	local uDim2 = UDim2.new(0, p1074.AbsolutePosition.X, 0, p1074.AbsolutePosition.Y)
	local uDim2157 = UDim2.new(0, p1074.AbsoluteSize.X * 0.5, 0, p1074.AbsoluteSize.Y * 0.5)
	local v2634 = UDim2.fromOffset(p1074.AbsoluteSize.X / 6, p1074.AbsoluteSize.X / 6)
	local v2635 = effectsServiceNewerCircle(p1073, {
		Name = "TutorialArrow",
		Image = "rbxassetid://13778914609",
		ImageTransparency = 1,
		ZIndex = 1000001,
		ImageColor3 = color398,
		Size = v2631,
		Position = uDim2 + uDim2157 + v2634
	})
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local uDim2158 = UDim2.new(0, p1074.AbsolutePosition.X, 0, p1074.AbsolutePosition.Y)
	local uDim2159 = UDim2.new(0, p1074.AbsoluteSize.X * 0.5, 0, p1074.AbsoluteSize.Y * 0.5)

	v2634 = UDim2.fromOffset(p1074.AbsoluteSize.X / 6, p1074.AbsoluteSize.X / 6)

	local color399 = Color3.fromRGB(255, 255, 255)
	local u2640 = tweenService:Create(v2635, tweenInfo, {
		Rotation = 0,
		Position = uDim2158 + uDim2159 + v2634,
		ImageColor3 = color399,
		Size = v2635.Size
	})
	local u2641: boolean = true

	task.spawn(function()
		while u2641 and v2635.Parent do
			audioService.PlaySound("Target Or Select Low")
			task.wait(3)
		end
	end)
	u2640.Completed:Connect(function()
		if not v2635.Parent then
			return
		end

		v2635.Size = UDim2.fromOffset(p1074.AbsoluteSize.X / 1.7, p1074.AbsoluteSize.X / 1.7)
		v2635.Rotation = -10
		v2635.ImageColor3 = Color3.fromRGB(0, 255, 4)
		u2640:Play()
	end)
	v2635.Destroying:Connect(function()
		u2641 = false

		if u2640 then
			u2640:Cancel()
			u2640 = nil
		end
	end)
	animation.AnimateAsync(v2635, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	task.spawn(function()
		v2635.Size = UDim2.fromOffset(p1074.AbsoluteSize.X / 1.7, p1074.AbsoluteSize.X / 1.7)
		v2635.Rotation = -10
		v2635.ImageColor3 = Color3.fromRGB(0, 255, 4)
		u2640:Play()
	end)
end
local function TutorialDownArrowIndicator(p1077, p1078)
	if p1077:FindFirstChild("TutorialArrow") then
		p1077.TutorialArrow:Destroy()
	end

	local iconHolderSlotsVisual = p1077.Parent.BattleNew.IconHolderSlotsVisual
	local color3100 = Color3.fromRGB(16, 255, 24)
	local v2646 = UDim2.fromOffset(iconHolderSlotsVisual.AbsoluteSize.X * 1.5, iconHolderSlotsVisual.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1078.AbsolutePosition.X, 0, p1078.AbsolutePosition.Y)
	local uDim2160 = UDim2.new(0, p1078.AbsoluteSize.X * 0.5, 0, p1078.AbsoluteSize.Y * 0.5)
	local v2649 = UDim2.fromOffset(0, -iconHolderSlotsVisual.AbsoluteSize.X)
	local v2650 = effectsServiceNewerCircle(p1077, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 0,
		ZIndex = 1000000,
		ImageColor3 = color3100,
		Size = v2646,
		Position = uDim2 + uDim2160 + v2649
	})
	local color3101 = Color3.fromRGB(20, 20, 20)
	local v2652 = UDim2.fromScale(1, 1)
	local v2653 = UDim2.fromScale(0.53, 0.47)
	local v2654 = effectsServiceNewerCircle(v2650, {
		Name = "TutorialArrow",
		Image = "rbxassetid://7640051440",
		ImageTransparency = 1,
		Rotation = 0,
		ZIndex = 999999,
		ImageColor3 = color3101,
		Size = v2652,
		Position = v2653
	})
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

	v2653 = v2650.Position
	v2649 = UDim2.fromOffset(0, v2650.AbsoluteSize.X / 3)

	local color3102 = Color3.fromRGB(60, 255, 0)
	local v2657 = v2650.Position
	local v2658 = UDim2.fromOffset(0, v2650.AbsoluteSize.X / 3)
	local color3103 = Color3.fromRGB(255, 255, 255)
	local u2660 = tweenService:Create(v2650, tweenInfo, { Position = v2653 + v2649, ImageColor3 = color3102 })
	local u2661 = tweenService:Create(v2650, tweenInfo, { Position = v2657 - v2658, ImageColor3 = color3103 })

	u2660:Play()
	u2661:Play()
	v2646 = function()
		if u2660 then
			u2660:Cancel()
			u2660 = nil
		end

		if u2661 then
			u2661:Cancel()
			u2661 = nil
		end
	end
	v2650.Destroying:Connect(function()
		if u2660 then
			u2660:Cancel()
			u2660 = nil
		end

		if u2661 then
			u2661:Cancel()
			u2661 = nil
		end
	end)
	animation.AnimateAsync(v2650, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
	animation.AnimateAsync(v2654, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
end
function module.TutorialFieldIndicator(p1079)
	audioService.PlaySound("ClickSound")
	TutorialDownArrowIndicator(p1079, p1079.Parent.BattleNew.VirtualField)
end
function module.TutorialCancel(p1080)
	if p1080:FindFirstChild("TutorialArrow") then
		p1080.TutorialArrow:Destroy()
	end
end
function module.YukiWhiteFlash(p1081)
	local color3104 = Color3.fromRGB(255, 255, 255)
	local v2666 = uDim2New(1, 0, 2, 0)
	local v2667 = uDim2New(0.5, 0, 0.5, 0)
	local v2668 = effectsServiceNewerCircle(p1081, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		ZIndex = 0,
		Rotation = 0,
		BackgroundColor3 = color3104,
		Size = v2666,
		Position = v2667
	})

	task.spawn(function()
		animation.Animate(v2668, { BackgroundTransparency = 1 }, 1, "InOut", "Quad")
		v2668:Destroy()
	end)
	effectsService.ShakeSync(p1081.Parent.Window, p1081.Parent.Window.Position, 1, 0.1)
end
function module.UnlockPack(p1082, _, p1084, p1085, _)
	local color3105 = Color3.fromRGB(0, 0, 0)
	local n1 = p1084.ZIndex + 100000
	local v2676 = uDim2New(1, 0, 2, 0)
	local v2677 = uDim2New(0.5, 0, 0.5, 0)
	local v2678 = effectsServiceNewerCircle(p1082, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3105,
		ZIndex = n1,
		Size = v2676,
		Position = v2677
	})
	local n2 = p1084.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1084.AbsoluteSize.X * 10, 0, p1084.AbsoluteSize.X * 10)
	local uDim2161 = UDim2.new(0, p1084.AbsolutePosition.X, 0, p1084.AbsolutePosition.Y)
	local uDim2162 = UDim2.new(0, p1084.AbsoluteSize.X * 0.5, 0, p1084.AbsoluteSize.Y * 0.5)
	local v2683 = effectsServiceNewerCircle(p1082, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5101723932",
		ZIndex = n2,
		Size = uDim2,
		Position = uDim2161 + uDim2162
	})
	local color3106 = Color3.fromRGB(0, 0, 0)
	local v2685 = uDim2New(0.35, 0, 0.5, 0)
	local v2686 = effectsServiceNewerCircle(p1082, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3106,
		Size = v2685,
		Position = p1084 and UDim2.new(0, p1084.AbsolutePosition.X, 0, p1084.AbsolutePosition.Y) + UDim2.new(0, p1084.AbsoluteSize.X * 0.5, 0, p1084.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})

	task.spawn(function()
		effectsService.Shake(p1084, p1084.Position, 1, 0.2)
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local locked = p1084.Locked
	local color3107 = Color3.fromRGB(0, 0, 0)

	animationAnimateAsync(locked, { BackgroundTransparency = 0, ImageColor3 = color3107 }, 1, "Out", "Quint")

	local animateAsync = animation.AnimateAsync
	local uDim2163 = UDim2.new(0, p1084.AbsoluteSize.X / 10, 0, p1084.AbsoluteSize.X / 10)

	animateAsync(v2683, { Size = uDim2163 }, 1, "Out", "Quint")
	v2677 = {}

	for _ = 1, 4 do
		local color3108 = Color3.fromRGB(235, 17, 255)
		local n3 = p1084.ZIndex + 100001
		local v2695 = uDim2New(2, 0, 0, p1084.AbsoluteSize.X / 4)
		local uDim2164 = UDim2.new(0, p1084.AbsolutePosition.X, 0, p1084.AbsolutePosition.Y)
		local uDim2165 = UDim2.new(0, p1084.AbsoluteSize.X * 0.5, 0, p1084.AbsoluteSize.Y * 0.5)
		local uDim2FromOffset = UDim2.fromOffset
		local randomNumber = math.random(-10, 10)
		local v2700 = uDim2FromOffset(randomNumber, 0)
		local randomNumber55 = math.random(-30, 30)
		local v2702 = effectsServiceNewerCircle(p1082, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			BackgroundColor3 = color3108,
			ZIndex = n3,
			Size = v2695,
			Position = uDim2164 + uDim2165 + v2700,
			Rotation = randomNumber55
		})

		table.insert(v2677, v2702)

		local v2703 = animation.AnimateAsync
		local v2704 = uDim2New(2, 0, 0, p1084.AbsoluteSize.X / 32)

		v2703(v2702, { Size = v2704 }, 0.3, "Out", "Quint")
		audioServicePlaySound("Slashes")
		task.wait(0.1)
	end

	task.wait(0.1)

	for i = 1, 4 do
		animation.AnimateAsync(v2677[i], { Rotation = 135 }, 1.2, "In", "Exponential")
	end

	task.wait(0.4)
	audioServicePlaySound("chargein")
	task.wait(0.8)
	audioServicePlaySound("dbzswordout")

	for i = 1, 4 do
		v2677[i].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		v2678.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v2678.BackgroundTransparency = 0
	end

	task.wait(0.2)

	for i = 1, 4 do
		v2677[i]:Destroy()
	end

	v2686:Destroy()
	v2683:Destroy()
	p1084.Locked.Visible = false
	p1084.ImageColor3 = Color3.fromRGB(255, 255, 255)
	audioServicePlaySound("secret")
	audioServicePlaySound("Boom")
	task.spawn(function()
		local color3109 = Color3.fromRGB(180, 110, 197)
		local color3110 = Color3.fromRGB(197, 0, 232)
		local color3111 = Color3.fromRGB(255, 255, 255)
		local color3112 = Color3.fromRGB(222, 140, 255)

		effectsServiceBreathSelf(p1082, p1084, p1084, p1085, 125, "rbxassetid://4292970642", "Shard", 0.6, color3109, color3110, color3111, color3112, 0.3, 0.3)
	end)
	task.spawn(function()
		animation.Animate(v2678, { BackgroundTransparency = 1 }, 0.5, "Out", "Exponential")
		v2678:Destroy()
	end)
end
function module.ShakeDialog(p1087)
	effectsService.ShakeSync(p1087.Parent.Window, p1087.Parent.Window.Position, 0.5, 0.1)
end
function module.ShowRazarCard(p1088)
	local color3113 = Color3.fromRGB(0, 0, 0)
	local v2711 = uDim2New(1, 0, 2, 0)
	local v2712 = uDim2New(0.5, 0, 0.5, 0)
	local v2713 = effectsServiceNewerCircle(p1088, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = -2,
		Rotation = 0,
		BackgroundColor3 = color3113,
		Size = v2711,
		Position = v2712
	})

	animation.AnimateAsync(v2713, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
	v2712 = UDim2.fromOffset(p1088.Parent.AbsoluteSize.Y / 2, p1088.Parent.AbsoluteSize.Y / 2)
	v2711 = UDim2.fromScale(0.5, -0.5)
	v2713 = effectsServiceNewCard(p1088, {
		Image = "rbxassetid://97674151781393",
		ZIndex = -1,
		Size = v2712,
		Position = v2711
	})
	audioServicePlaySound("Draw")

	local animationAnimate = animation.Animate
	local v2715 = UDim2.fromScale(0.5, 0.3)
	local randomNumber = math.random(-10, 10)

	animationAnimate(v2713, { Position = v2715, Rotation = randomNumber }, 1, "Out", "Quart")
end
function module.DekkadSummon(p1089, parent, _, _)
	parent.Visible = true
	parent.ImageColor3 = Color3.fromRGB(12, 12, 12)

	local battleNew = p1089.Parent.BattleNew
	local v2722 = parent.Position
	local v2723 = uDim2New(0, parent.AbsoluteSize.X * 1.85, 0, parent.AbsoluteSize.X * 1.85)
	local v2724 = UDim2.fromOffset(parent.AbsoluteSize.X / 2 - 90, parent.AbsoluteSize.Y / 2)

	v2722 = effectsServiceNewerCircle(p1089, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10005,
		Image = "rbxassetid://12206796531",
		Rotation = -784,
		Size = v2723,
		Position = v2724,
		Parent = parent
	})

	local color3114 = Color3.fromRGB(0, 0, 0)
	local v2726 = uDim2New(1, 0, 2, 0)
	local v2727 = uDim2New(0.5, 0, 0.5, 0)
	local v2728 = effectsServiceNewerCircle(p1089, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10003,
		BackgroundColor3 = color3114,
		Size = v2726,
		Position = v2727
	})
	local v2729 = uDim2New(0, 10000, 0, 1000)
	local v2730 = uDim2New(0, -1750)
	local v2731 = effectsServiceNewerCircle(p1089, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		Image = "rbxassetid://78558574115986",
		Rotation = 340,
		Size = v2729,
		Position = v2730,
		Parent = parent
	})
	local v2732 = uDim2New(0, 10000, 0, 1000)
	local v2733 = uDim2New(0, 2550)

	v2724 = effectsServiceNewerCircle(p1089, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		Image = "rbxassetid://78558574115986",
		Rotation = 340,
		Size = v2732,
		Position = v2733,
		Parent = parent
	})
	animation.AnimateAsync(v2728, { BackgroundTransparency = 0.5 }, 0.5, "InOut", "Quint")
	animation.AnimateAsync(v2728, { BackgroundTransparency = 0 }, 1, "InOut", "Quad")
	audioServiceDimSongs(0.001)
	task.wait(1)
	audioServicePlaySound("PreSlash")
	audioServicePlaySound("unsheath")
	animation.AnimateAsync(v2722, { ImageTransparency = 0 }, 0.1, "InOut", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local uDim2 = UDim2.new(0, 0, 0, -parent.AbsolutePosition.Y * 1.8)

	animationAnimateAsync(v2722, { Position = uDim2 }, 1, "Out", "Quad")
	animation.AnimateAsync(v2722, { Rotation = 450 }, 1.5, "Out", "Quad")
	task.wait(0.1)
	animation.AnimateAsync(v2722, { ImageTransparency = 0 }, 0.8, "InOut", "Quad")
	task.wait(1.4)
	parent.ImageColor3 = Color3.fromRGB(255, 255, 255)

	local animateAsync = animation.AnimateAsync
	local v2737 = UDim2.fromOffset(parent.AbsoluteSize.X / 2 - 20, parent.AbsoluteSize.Y / 2)

	animateAsync(v2722, { Position = v2737 }, 0, "InOut", "Linear")
	animation.AnimateAsync(v2722, { Rotation = -784 }, 0, "Out", "Quad")
	animation.AnimateAsync(v2722, { ImageTransparency = 0 }, 0, "InOut", "Quad")
	audioServicePlaySound("LargeSlash")
	audioServicePlaySound("Thunder")
	animation.AnimateAsync(v2731, { ImageTransparency = 0 }, 0, "Out", "Linear")
	animation.AnimateAsync(v2724, { ImageTransparency = 0 }, 0, "Out", "Linear")
	animation.AnimateAsync(v2728, { BackgroundTransparency = 1 }, 0.1, "In", "Quad")
	effectsService.ShakeSync(v2731, v2731.Position, 0.5, 0.1)
	effectsService.ShakeSync(v2724, v2724.Position, 0.5, 0.1)
	audioServiceUndimSongs()
	task.wait(0.8)
	animation.AnimateAsync(v2731, { ImageTransparency = 1 }, 0.5, "InOut", "Sine")
	animation.AnimateAsync(v2724, { ImageTransparency = 1 }, 0.5, "InOut", "Sine")
	animation.AnimateAsync(v2722, { ImageTransparency = 1 }, 0.5, "InOut", "Sine")
	animation.AnimateAsync(v2722, { Rotation = -794 }, 0.5, "InOut", "Quad")
	task.wait(0.5)
	v2722:Destroy()
	v2728:Destroy()
	v2731:Destroy()
	v2724:Destroy()
end
function module.TerrorEffect(p1093, p1094, _, _)
	audioServiceDimSongs()

	local zIndex = p1094.ZIndex
	local absolutePosition = p1094.AbsolutePosition
	local absoluteSize = p1094.AbsoluteSize
	local color3115 = Color3.fromRGB(22, 22, 22)
	local n1 = p1094.ZIndex + 99998
	local v2747 = uDim2New(1, 0, 2, 0)
	local v2748 = uDim2New(0.5, 0, 0.5, 0)
	local v2749 = effectsServiceNewerCircle(p1093, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3115,
		ZIndex = n1,
		Size = v2747,
		Position = v2748
	})

	p1094.ImageTransparency = 1
	audioServicePlaySound("AnglerIdle", { TimePosition = 51 })
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t128: {[any]: any} = { Color3.fromRGB(20, 22, 21), Color3.fromRGB(6, 6, 6) }
		local v3931 = UDim2.fromOffset(p1094.AbsoluteSize.X * 1.2, p1094.AbsoluteSize.X * 1.2)

		effectsServiceBreath(p1093, p1094, p1094, {
			Strength = 50,
			Time = 2,
			Projectile = effectsServiceBreathimagesFire,
			Color = t128,
			Size = v3931
		})
	end)
	audioServicePlaySound("LightFlicker")
	animation.Animate(v2749, { BackgroundTransparency = 0.2 }, 0.2, "Out", "Quart")
	animation.Animate(v2749, { BackgroundTransparency = 0.9 }, 0.05, "Out", "Quart")
	audioServicePlaySound("LightFlicker")
	animation.Animate(v2749, { BackgroundTransparency = 0.4 }, 0.2, "Out", "Quart")
	animation.Animate(v2749, { BackgroundTransparency = 0.9 }, 0.05, "Out", "Quart")
	animation.Animate(v2749, { BackgroundTransparency = 1 }, 0.05, "Out", "Quart")
	task.wait(1)
	audioServiceUndimSongs()
	p1094.ImageTransparency = 0
	v2749:Destroy()
end
function module.VoidMassSummon(_, p1098, _, _)
	audioServicePlaySound("VoidMassSummon")
	p1098.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p1098, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.VoidMassEffect(p1101, p1102, _, p1104)
	audioServicePlaySound("VoidMassEffect")

	local v2758 = p1101.Parent.BattleNew["Virtual" .. p1104 .. "Graveyard"]
	local v2759 = UDim2.fromOffset(p1102.AbsoluteSize.X, p1102.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p1102.AbsolutePosition.X, 0, p1102.AbsolutePosition.Y)
	local uDim2166 = UDim2.new(0, p1102.AbsoluteSize.X * 0.5, 0, p1102.AbsoluteSize.Y * 0.5)
	local v2762 = effectsServiceNewerCircle(p1101, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2759,
		Position = uDim2 + uDim2166
	})
	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	local t90: {[any]: any} = { Color3.fromRGB(111, 66, 130), Color3.fromRGB(173, 135, 194) }
	local v2765 = UDim2.fromOffset(p1102.AbsoluteSize.X / 1.5, p1102.AbsoluteSize.X / 1.5)

	effectsServiceEmit(p1101, v2758, {
		Strength = 90,
		Speed = 0.9,
		EasingStyle = "Quad",
		Time = 0.5,
		Projectile = effectsServiceBreathimagesSmog,
		Color = t90,
		Size = v2765,
		Range = v2762
	})
	effectsService.ShakeSync(p1102, p1102.Position, 0.2, 0.1)
	task.wait(0.2)
	v2762:Destroy()
end
function module.VoidMassDeath(_, p1106, _, _)
	audioServicePlaySound("VoidMassDeath")
	p1106.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p1106, { Rotation = 0, Transparency = 1 }, 0.5, "Out", "Quint")
end
function module.GYRObotSummon(_, p1110, _, _)
	audioServicePlaySound("GYrobot")
	p1110.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p1110, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.MouseEffect(p1113, p1114, _, _)
	task.spawn(function()
		local color3116 = Color3.fromRGB(255, 255, 255)
		local v3933 = uDim2New(0, 20, 0, 20)
		local v3934 = UDim2.fromOffset(p1114.X, p1114.Y - 55)
		local v3935 = effectsServiceNewerCircle(p1113, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10500,
			Image = "",
			ImageColor3 = color3116,
			Size = v3933,
			Position = v3934
		})
		local t129: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(218, 215, 204) }
		local v3937 = UDim2.fromOffset(v3935.AbsoluteSize.X * 1, v3935.AbsoluteSize.X * 1)

		effectsServiceBreath(p1113, v3935, v3935, {
			Projectile = "rbxassetid://89021680003625",
			Strength = 10,
			ZIndex = 10500,
			Time = 0.1,
			Color = t129,
			Size = v3937
		})
		task.wait(0.2)
		v3935:Destroy()
	end)
end
function module.Draft(parent, p1118, _, _)
	local y = parent.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local n1 = p1118.ZIndex + 10000
	local color3117 = Color3.fromRGB(255, 0, 0)
	local v2785 = uDim2New(0, y * 8, 0, y * 2)
	local v2786 = uDim2New(0.5, 0, 0.8, 0)
	local v2787 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://88189783941561",
		Rotation = 0,
		ZIndex = n1,
		ImageColor3 = color3117,
		Size = v2785,
		Position = v2786,
		Parent = parent
	})
	local color3118 = Color3.fromRGB(255, 0, 0)
	local v2789 = UDim2.fromOffset(p1118.AbsoluteSize.X * 0.9, p1118.AbsoluteSize.Y * 0.7)
	local uDim2 = UDim2.new(0, p1118.AbsolutePosition.X, 0, p1118.AbsolutePosition.Y)
	local uDim2167 = UDim2.new(0, p1118.AbsoluteSize.X * 0.5, 0, p1118.AbsoluteSize.Y * 0.5)
	local v2792 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://127880278242720",
		Rotation = 0,
		ImageColor3 = color3118,
		Size = v2789,
		Position = uDim2 + uDim2167,
		ZIndex = p1118.ZIndex + 10001
	})

	animation.AnimateAsync(v2792, { ImageTransparency = 0 }, 0.3, "Out", "Quint")
	audioServicePlaySound("WarHorn", { Volume = 0.1 })
	audioServicePlaySound("WarCheer")
	animation.AnimateAsync(v2787, { ImageTransparency = 0.7 }, 0.8, "Out", "Quad")

	local animationAnimate = animation.Animate
	local v2794 = v2792.Position
	local v2795 = UDim2.fromOffset(0, p1118.AbsoluteSize.X * 0.9)

	animationAnimate(v2792, { Rotation = 0, Position = v2794 - v2795 }, 0.4, "Out", "Quart")
	task.spawn(function()
		animation.AnimateAsync(v2787, { ImageTransparency = 1 }, 0.8, "Out", "Quad")

		local animationAnimate = animation.Animate
		local v3939 = UDim2.fromOffset(p1118.AbsoluteSize.X * 1.1, p1118.AbsoluteSize.Y * 1)
		local color3119 = Color3.fromRGB(255, 150, 0)

		animationAnimate(v2792, { ImageTransparency = 1, Size = v3939, ImageColor3 = color3119 }, 1, "In", "Quart")
		v2792:Destroy()
		v2787:Destroy()
	end)
end
function module.DraftOpp(parent, p1122, _, _)
	local y = parent.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local n1 = p1122.ZIndex + 10002
	local color3120 = Color3.fromRGB(255, 0, 0)
	local v2803 = uDim2New(0, y * 8, 0, y * 2)
	local v2804 = uDim2New(0.5, 0, 0.23, 0)
	local v2805 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://88189783941561",
		Rotation = 180,
		ZIndex = n1,
		ImageColor3 = color3120,
		Size = v2803,
		Position = v2804,
		Parent = parent
	})
	local color3121 = Color3.fromRGB(255, 0, 0)
	local v2807 = UDim2.fromOffset(p1122.AbsoluteSize.X * 0.9, p1122.AbsoluteSize.Y * 0.7)
	local uDim2 = UDim2.new(0, p1122.AbsolutePosition.X, 0, p1122.AbsolutePosition.Y)
	local uDim2168 = UDim2.new(0, p1122.AbsoluteSize.X * 0.5, 0, p1122.AbsoluteSize.Y * 0.5)
	local v2810 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://127880278242720",
		Rotation = 0,
		ImageColor3 = color3121,
		Size = v2807,
		Position = uDim2 + uDim2168,
		ZIndex = p1122.ZIndex + 10001
	})

	animation.AnimateAsync(v2810, { ImageTransparency = 0 }, 0.3, "Out", "Quint")
	audioServicePlaySound("WarHorn", { Volume = 0.1 })
	audioServicePlaySound("WarCheer")
	animation.AnimateAsync(v2805, { ImageTransparency = 0.7 }, 0.8, "Out", "Quad")

	local animationAnimate = animation.Animate
	local v2812 = v2810.Position
	local v2813 = UDim2.fromOffset(0, p1122.AbsoluteSize.X * 0.9)

	animationAnimate(v2810, { Rotation = 0, Position = v2812 - v2813 }, 0.4, "Out", "Quart")
	task.spawn(function()
		animation.AnimateAsync(v2805, { ImageTransparency = 1 }, 0.8, "Out", "Quad")

		local animationAnimate = animation.Animate
		local v3942 = UDim2.fromOffset(p1122.AbsoluteSize.X * 1.1, p1122.AbsoluteSize.Y * 1)
		local color3122 = Color3.fromRGB(255, 150, 0)

		animationAnimate(v2810, { ImageTransparency = 1, Size = v3942, ImageColor3 = color3122 }, 1, "In", "Quart")
		v2810:Destroy()
		v2805:Destroy()
	end)
end
function module.DebtGain(p1125, p1126, _, p1128, p1129)
	local battleNew = p1125.Parent.BattleNew
	local u2820 = battleNew.VirtualBaseplate

	if p1128 == "Enemy" then
		u2820 = battleNew.VirtualEnemyBaseplate
	end

	local v2821 = UDim2.fromOffset(p1126.AbsoluteSize.X / 3, p1126.AbsoluteSize.X / 3)
	local color3123 = Color3.fromRGB(255, 0, 0)
	local color3124 = Color3.fromRGB(255, 255, 0)
	local color3125 = Color3.fromRGB(0, 255, 0)
	local t91: {[any]: any} = {
		Projectile = "rbxassetid://6755657357",
		Strength = 100,
		Time = 0.5,
		Size = v2821,
		Color = { color3123, color3124, color3125, Color3.fromRGB(0, 150, 255) }
	}
	local v2826 = UDim2.fromScale(2, 0.12)
	local v2827 = u2820
	local uDim2 = UDim2.new(0, v2827.AbsolutePosition.X, 0, v2827.AbsolutePosition.Y)
	local uDim2169 = UDim2.new(0, v2827.AbsoluteSize.X * 0.5, 0, v2827.AbsoluteSize.Y * 0.5)
	local n1 = p1126.ZIndex + 10002
	local color3126 = Color3.fromRGB(0, 0, 0)
	local v2832 = effectsServiceNewText(p1125, {
		BackgroundTransparency = 1,
		TextScaled = true,
		TextTransparency = 1,
		Size = v2826,
		Position = uDim2 + uDim2169,
		Text = p1129,
		ZIndex = n1,
		TextColor3 = color3126,
		Font = Enum.Font.Bodoni
	})

	if p1129 < 10 then
		audioServicePlaySound("cashregister", { PlaybackSpeed = 1 + 0.05 * p1129 })

		local animationAnimateAsync = animation.AnimateAsync
		local v2834 = u2820
		local color3127 = Color3.fromRGB(255, 244, 90)

		animationAnimateAsync(v2834, { BackgroundColor3 = color3127 }, 0.1, "Out", "Sine")
	elseif p1129 < 18 then
		audioServicePlaySound("cashregister")
		audioServicePlaySound("Forboding")
		audioServicePlaySound("FireBlast")

		local animateAsync = animation.AnimateAsync
		local v2837 = u2820
		local color3128 = Color3.fromRGB(255, 0, 0)

		animateAsync(v2837, { BackgroundColor3 = color3128 }, 0.1, "Out", "Sine")
	else
		audioServicePlaySound("cashregister")
		audioServicePlaySound("Forboding")
		audioServicePlaySound("FireBlast")
		audioServicePlaySound("Bell Sound")

		local v2839 = animation.AnimateAsync
		local v2840 = u2820
		local color3129 = Color3.fromRGB(100, 0, 0)

		v2839(v2840, { BackgroundColor3 = color3129 }, 0.1, "Out", "Sine")
	end

	animation.AnimateAsync(v2832, { TextTransparency = 0 }, 0.1, "Out", "Sine")
	task.spawn(function()
		effectsServiceBreath(p1125, u2820, u2820, t91)
	end)
	task.wait(0.1)

	local v2842 = animation.AnimateAsync
	local v2843 = u2820
	local color3130 = Color3.fromRGB(0, 0, 0)

	v2842(v2843, { BackgroundColor3 = color3130 }, 3, "Out", "Sine")
	animation.AnimateAsync(v2832, { TextTransparency = 1 }, 5, "Out", "Sine")
	task.spawn(function()
		task.wait(5)
		v2832:Destroy()
	end)
end
function module.DebtExplode(p1130, p1131, _, p1133, _)
	local battleNew = p1130.Parent.BattleNew
	local v2851 = battleNew.VirtualBaseplate

	if p1133 == "Enemy" then
		v2851 = battleNew.VirtualEnemyBaseplate
	end

	local color3131 = Color3.fromRGB(100, 0, 0)
	local v2853 = uDim2New(1, 0, 2, 0)
	local v2854 = uDim2New(0.5, 0, 0.5, 0)
	local v2855 = effectsServiceNewerCircle(p1130, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = -10000,
		BackgroundColor3 = color3131,
		Size = v2853,
		Position = v2854
	})
	local v2856 = UDim2.fromOffset(p1131.AbsoluteSize.X / 3, p1131.AbsoluteSize.X / 3)
	local color3132 = Color3.fromRGB(255, 0, 0)
	local color3133 = Color3.fromRGB(255, 255, 0)
	local color3134 = Color3.fromRGB(0, 255, 0)
	local t92 = {
		Projectile = "rbxassetid://6755657357",
		Strength = 100,
		Time = 0.5,
		Size = v2856,
		Color = { color3132, color3133, color3134, Color3.fromRGB(0, 150, 255) }
	}

	v2854 = UDim2.fromScale(2, 0.12)

	local uDim2 = UDim2.new(0, v2851.AbsolutePosition.X, 0, v2851.AbsolutePosition.Y)
	local uDim2170 = UDim2.new(0, v2851.AbsoluteSize.X * 0.5, 0, v2851.AbsoluteSize.Y * 0.5)

	v2853 = p1131.ZIndex + 10002

	local color3135 = Color3.fromRGB(0, 0, 0)

	t92 = effectsServiceNewText(p1130, {
		BackgroundTransparency = 1,
		TextScaled = true,
		Text = "0",
		TextTransparency = 1,
		Size = v2854,
		Position = uDim2 + uDim2170,
		ZIndex = v2853,
		TextColor3 = color3135,
		Font = Enum.Font.Bodoni
	})
	v2854 = UDim2.fromScale(2, 0.12)

	local uDim2171 = UDim2.new(0, v2851.AbsolutePosition.X, 0, v2851.AbsolutePosition.Y)
	local uDim2172 = UDim2.new(0, v2851.AbsoluteSize.X * 0.5, 0, v2851.AbsoluteSize.Y * 0.5)

	v2853 = p1131.ZIndex + 10002

	local color3136 = Color3.fromRGB(0, 0, 0)

	v2856 = effectsServiceNewText(p1130, {
		BackgroundTransparency = 1,
		TextScaled = true,
		Text = "0",
		TextTransparency = 1,
		Size = v2854,
		Position = uDim2171 + uDim2172,
		ZIndex = v2853,
		TextColor3 = color3136,
		Font = Enum.Font.Bodoni
	})
	audioServicePlaySound("cashregister")
	audioServicePlaySound("Forboding", { PlaybackSpeed = 0.3 })
	audioServicePlaySound("FireBlast")
	audioServicePlaySound("Bell Sound")

	local animationAnimateAsync = animation.AnimateAsync
	local color3137 = Color3.fromRGB(100, 0, 0)

	animationAnimateAsync(v2851, { BackgroundColor3 = color3137 }, 0.1, "Out", "Sine")
	animation.AnimateAsync(t92, { TextTransparency = 0 }, 0.1, "Out", "Sine")

	local animateAsync = animation.AnimateAsync
	local v2870 = UDim2.fromScale(4, 0.4)

	animateAsync(v2856, { TextTransparency = 0, Size = v2870 }, 2, "Out", "Sine")
	animation.AnimateAsync(v2855, { BackgroundTransparency = 0.5 }, 0.2, "Out", "Sine")
	audioServiceDimSongs(0.01)
	task.wait(0.2)
	animation.AnimateAsync(v2855, { BackgroundTransparency = 1 }, 1.8, "Out", "Sine")
	task.wait(1.8)
	audioServiceUndimSongs()
	v2855:Destroy()
	t92:Destroy()
	v2856:Destroy()
end
function module.DebtPay(p1135, p1136, _, p1138, p1139)
	local battleNew = p1135.Parent.BattleNew
	local v2877 = battleNew.VirtualBaseplate

	if p1138 == "Enemy" then
		v2877 = battleNew.VirtualEnemyBaseplate
	end

	local v2878 = UDim2.fromScale(2, 0.12)
	local uDim2 = UDim2.new(0, v2877.AbsolutePosition.X, 0, v2877.AbsolutePosition.Y)
	local uDim2173 = UDim2.new(0, v2877.AbsoluteSize.X * 0.5, 0, v2877.AbsoluteSize.Y * 0.5)
	local n1 = p1136.ZIndex + 10002
	local color3138 = Color3.fromRGB(0, 0, 0)
	local v2883 = effectsServiceNewText(p1135, {
		BackgroundTransparency = 1,
		TextScaled = true,
		TextTransparency = 1,
		Size = v2878,
		Position = uDim2 + uDim2173,
		Text = p1139,
		ZIndex = n1,
		TextColor3 = color3138,
		Font = Enum.Font.Bodoni
	})

	if p1139 == 0 then
		audioServicePlaySound("Coins ka-ching")
	else
		audioServicePlaySound("coins_pay", { PlaybackSpeed = 1 + 0.05 * p1139 })
	end

	local animationAnimateAsync = animation.AnimateAsync
	local color3139 = Color3.fromRGB(255, 244, 90)

	animationAnimateAsync(v2877, { BackgroundColor3 = color3139 }, 0.1, "Out", "Sine")
	animation.AnimateAsync(v2883, { TextTransparency = 0 }, 0.1, "Out", "Sine")
	task.wait(0.1)

	local animateAsync = animation.AnimateAsync
	local color3140 = Color3.fromRGB(0, 0, 0)

	animateAsync(v2877, { BackgroundColor3 = color3140 }, 3, "Out", "Sine")
	animation.AnimateAsync(v2883, { TextTransparency = 1 }, 3, "Out", "Sine")
	task.spawn(function()
		task.wait(3)
		v2883:Destroy()
	end)
end
function module.KingSlash(p1140, p1141, _, _)
	local v2892 = uDim2New(0, p1141.AbsoluteSize.X / 1.2, 0, p1141.AbsoluteSize.X / 1.2)
	local v2893 = uDim2New(0, 0, 0.5, 0)
	local v2894 = effectsServiceNewerCircle(p1140, {
		Image = "rbxassetid://95975283110061",
		ZIndex = 10000,
		ImageTransparency = 1,
		Size = v2892,
		Position = v2893
	})

	task.spawn(function()
		for _ = 1, 10 do
			task.spawn(function()
				local color3141 = Color3.fromRGB(255, 255, 20)
				local v4234 = uDim2New(0, p1141.AbsoluteSize.X * 2, 0, p1141.AbsoluteSize.X * 3)
				local v4235 = UDim2.fromOffset(v2894.AbsolutePosition.X + v2894.AbsoluteSize.X / 2, v2894.AbsolutePosition.Y + v2894.AbsoluteSize.Y / 2)
				local v4236 = effectsServiceNewerCircle(p1140, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					ZIndex = 10001,
					Image = "rbxassetid://5552526748",
					ImageColor3 = color3141,
					Size = v4234,
					Position = v4235
				})
				local color3142 = Color3.fromRGB(255, 20, 20)
				local v4238 = uDim2New(0, p1141.AbsoluteSize.X * 2.3, 0, p1141.AbsoluteSize.X * 3.3)
				local v4239 = UDim2.fromOffset(v2894.AbsolutePosition.X + v2894.AbsoluteSize.X / 2, v2894.AbsolutePosition.Y + v2894.AbsoluteSize.Y / 2)
				local v4240 = effectsServiceNewerCircle(p1140, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					ZIndex = 10000,
					Image = "rbxassetid://5552526748",
					ImageColor3 = color3142,
					Size = v4238,
					Position = v4239
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4242 = uDim2New(0, p1141.AbsoluteSize.X * 2, 0, p1141.AbsoluteSize.X * 4)
				local v4243 = UDim2.fromOffset(v2894.AbsolutePosition.X + v2894.AbsoluteSize.X / 2, v2894.AbsolutePosition.Y + v2894.AbsoluteSize.Y / 3)

				animationAnimateAsync(v4236, { ImageTransparency = 1, Size = v4242, Position = v4243 }, 1, "Out", "Exponential")

				local animateAsync = animation.AnimateAsync

				v4243 = uDim2New(0, p1141.AbsoluteSize.X * 2, 0, p1141.AbsoluteSize.X * 4.8)
				v4242 = UDim2.fromOffset(v2894.AbsolutePosition.X + v2894.AbsoluteSize.X / 2, v2894.AbsolutePosition.Y + v2894.AbsoluteSize.Y / 4)
				animateAsync(v4240, { ImageTransparency = 1, Size = v4243, Position = v4242 }, 1, "Out", "Exponential")
				task.wait(1)
				v4236:Destroy()
				v4240:Destroy()
			end)
			task.wait(0.02)
		end
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v2896 = uDim2New(1, 0, 0.5, 0)

	animationAnimateAsync(v2894, { Position = v2896 }, 0.3, "Out", "Linear")
	audioServicePlaySound("AttentionExplosion")
	task.wait(0.5)
end
function module.ShimmeringActive(p1144, parent, _, _)
	local zIndex = parent.ZIndex
	local absolutePosition = parent.AbsolutePosition
	local absoluteSize = parent.AbsoluteSize

	if parent:FindFirstChild("CoatShield") then
		return
	end

	local n1 = parent.ZIndex + 10500
	local color3143 = Color3.fromRGB(255, 255, 255)
	local v2906 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.8, parent.AbsoluteSize.Y * 0.5)
	local v2907 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)
	local coatShield = effectsServiceNewerCircle(p1144, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://395920626",
		ZIndex = n1,
		ImageColor3 = color3143,
		Size = v2906,
		Position = v2907,
		Parent = parent
	})

	coatShield.Name = "CoatShield"

	local t93: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(15, 146, 166) }

	task.spawn(function()
		animation.Animate(coatShield, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
	end)

	local t94: {[any]: any} = { Time = 1, FlashTime = 0.2, Color = t93, Transparency = 0.1 }

	task.spawn(function()
		audioServicePlaySound("Shield")
		effectsServicePulse(p1144, coatShield, t94)
	end)
	task.spawn(function()
		while parent do
			task.wait(0.1)
			coatShield.Position = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)
			coatShield.Size = UDim2.fromOffset(parent.AbsoluteSize.X * 0.8, parent.AbsoluteSize.Y * 0.5)
		end
	end)
end
function module.ShimmeringEnd(p1148, p1149, _, _)
	if p1149:FindFirstChild("CoatShield") then
		local coatShield = p1149:FindFirstChild("CoatShield")
		local t95: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(15, 146, 166) }

		task.spawn(function()
			animation.Animate(coatShield, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		end)
		task.spawn(function()
			task.wait(0.1)
			effectsService.ShakeSync(p1149, p1149.Position, 1.5, 0.15)
		end)

		local t96: {[any]: any} = { Time = 1, FlashTime = 0.2, Color = t95, Transparency = 0.1 }

		task.spawn(function()
			audioServicePlaySound("Parry")
			effectsServicePulse(p1148, coatShield, t96)
			coatShield:Destroy()
		end)

		return
	end
end
function module.TargetShieldActive(p1152, p1153, parent, _)
	local zIndex = parent.ZIndex
	local absolutePosition = parent.AbsolutePosition
	local absoluteSize = parent.AbsoluteSize

	if parent:FindFirstChild("CoatShield") then
		return
	end

	local n1 = parent.ZIndex + 10500
	local color3144 = Color3.fromRGB(255, 255, 255)
	local v2927 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.8, parent.AbsoluteSize.Y * 0.5)
	local v2928 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)
	local coatShield = effectsServiceNewerCircle(p1152, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://395920626",
		ZIndex = n1,
		ImageColor3 = color3144,
		Size = v2927,
		Position = v2928,
		Parent = parent
	})

	coatShield.Name = "CoatShield"

	local t97: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(15, 146, 166) }

	task.spawn(function()
		animation.Animate(coatShield, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
	end)

	local t98: {[any]: any} = { Time = 1, FlashTime = 0.2, Color = t97, Transparency = 0.1 }

	task.spawn(function()
		audioServicePlaySound("Shield")
		effectsServicePulse(p1152, coatShield, t98)
	end)
	task.spawn(function()
		while p1153 do
			task.wait(0.1)
			coatShield.Position = UDim2.fromOffset(p1153.AbsoluteSize.X / 2, p1153.AbsoluteSize.Y / 2)
			coatShield.Size = UDim2.fromOffset(p1153.AbsoluteSize.X * 0.8, p1153.AbsoluteSize.Y * 0.5)
		end
	end)
end
function module.ShieldEnd(p1156, _, p1158, _)
	if p1158:FindFirstChild("CoatShield") then
		local coatShield = p1158:FindFirstChild("CoatShield")
		local t99: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(15, 146, 166) }

		task.spawn(function()
			animation.Animate(coatShield, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		end)
		task.spawn(function()
			task.wait(0.1)
			effectsService.ShakeSync(p1158, p1158.Position, 1.5, 0.15)
		end)

		local t100: {[any]: any} = { Time = 1, FlashTime = 0.2, Color = t99, Transparency = 0.1 }

		task.spawn(function()
			audioServicePlaySound("Parry")
			effectsServicePulse(p1156, coatShield, t100)
			coatShield:Destroy()
		end)

		return
	end
end
function module.NyarlAttack(p1160, p1161, p1162, _)
	local color3145 = Color3.fromRGB(0, 0, 0)
	local v2944 = uDim2New(1, 0, 2, 0)
	local n1 = p1161.ZIndex + 10000
	local v2946 = uDim2New(0.5, 0, 0.5, 0)
	local v2947 = effectsServiceNewerCircle(p1160, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3145,
		Size = v2944,
		ZIndex = n1,
		Position = v2946
	})

	task.spawn(function()
		for i = 1, 3 do
			task.spawn(function()
				local randomNumber = math.random(3, 4)
				local randomNumber56 = math.random(3, 4)
				local randomNumber57 = math.random(0, 360)
				local n1 = p1162.ZIndex + 10003
				local v4249 = uDim2New(0, p1161.AbsoluteSize.Y * 0, 0, p1161.AbsoluteSize.X * 0)
				local color3146 = Color3.fromRGB(0, 0, 0)
				local v4251 = UDim2.fromOffset(p1162.AbsolutePosition.X + p1162.AbsoluteSize.X / 2, p1162.AbsolutePosition.Y + p1162.AbsoluteSize.Y / 2)
				local v4252 = effectsServiceNewerCircle(p1160, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Image = "rbxassetid://85085066051056",
					ZIndex = n1,
					Size = v4249,
					ImageColor3 = color3146,
					Position = v4251,
					Rotation = randomNumber57
				})

				task.wait(0.7)
				animation.AnimateAsync(v4252, { ImageTransparency = 0 }, 0, "In", "Quad")

				local animationAnimateAsync = animation.AnimateAsync
				local v4254 = uDim2New(0, p1161.AbsoluteSize.Y * randomNumber, 0, p1161.AbsoluteSize.X * randomNumber56)

				animationAnimateAsync(v4252, { Size = v4254 }, 0.1, "In", "Quad")
				task.wait(1 - i * 0.1)
				animation.AnimateAsync(v4252, { ImageTransparency = 1 }, 1, "In", "Quad")
			end)
			task.wait(0.1)
		end
	end)
	animation.AnimateAsync(v2947, { BackgroundTransparency = 0 }, 0.3, "In", "Quad")
	task.wait(0.7)
	audioServicePlaySound("headexplosion")
	CutInHalf(p1162)

	local animationAnimateAsync = animation.AnimateAsync
	local color3147 = Color3.fromRGB(0, 0, 255)

	animationAnimateAsync(v2947, { BackgroundColor3 = color3147 }, 0, "In", "Quad")
	task.wait(1)
	animation.AnimateAsync(v2947, { BackgroundTransparency = 1 }, 1, "In", "Quad")
end
function module.NyarlEffect1(p1164, p1165, p1166, _)
	task.spawn(function()
		local t130: {[any]: any} = {}
		local t131: {[any]: any} = {}
		local u3948 = nil
		local u3949: boolean = true
		local u3950: boolean = false
		local u3951: boolean = false

		local function cleanup(p1168)
			for i = #p1168, 1, -1 do
				local v4257 = p1168[i]

				p1168[i] = nil

				if v4257 then
					pcall(function()
						v4257:Destroy()
					end)
				end
			end
		end
		local function cleanupMain()
			if u3950 then
				return
			end

			u3950 = true
			cleanup(t130)
		end
		local function cleanupInner()
			if u3951 then
				return
			end

			u3951 = true
			u3949 = false
			cleanup(t131)
		end
		local function createMainCircle(p1169, p1170)
			local v4260 = effectsServiceNewerCircle(p1169, p1170)

			table.insert(t130, v4260)

			return v4260
		end
		local function createInnerCircle(p1171, p1172)
			local v4263 = effectsServiceNewerCircle(p1171, p1172)

			table.insert(t131, v4263)

			return v4263
		end

		local v3957, v3958 = xpcall(function()
			if not p1164 or not p1164.Parent or not p1166 or not p1166.Parent then
				return
			end

			p1165 = p1164.Parent.BattleNew.Virtual3DEnemyPositions.BossPosition

			if not p1165 or not p1165.Parent then
				return
			end

			local n1 = p1166.ZIndex + 1
			local uDim2 = UDim2.new(0, p1165.AbsoluteSize.X, 0, p1165.AbsoluteSize.X)
			local color3148 = Color3.fromRGB(0, 0, 255)
			local v4267 = UDim2.fromOffset(p1165.AbsolutePosition.X + p1165.AbsoluteSize.X / 2, p1165.AbsolutePosition.Y + p1165.AbsoluteSize.Y / 2)
			local v4268 = effectsServiceNewerCircle(p1164, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				Image = "rbxassetid://117402865936769",
				ZIndex = n1,
				Size = uDim2,
				ImageColor3 = color3148,
				Position = v4267
			})

			table.insert(t130, v4268)

			local n2 = p1166.ZIndex + 1
			local image = p1166.Image
			local uDim2174 = UDim2.new(0, p1166.AbsoluteSize.X, 0, p1166.AbsoluteSize.Y)
			local color3149 = Color3.fromRGB(0, 0, 255)
			local v4273 = UDim2.fromOffset(p1166.AbsolutePosition.X + p1166.AbsoluteSize.X / 2, p1166.AbsolutePosition.Y + p1166.AbsoluteSize.Y / 2)
			local parent = effectsServiceNewerCircle(p1164, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = n2,
				Image = image,
				Size = uDim2174,
				ImageColor3 = color3149,
				Position = v4273
			})

			table.insert(t130, parent)

			local color3150 = Color3.fromRGB(255, 255, 255)

			v4273 = uDim2New(0, p1166.AbsoluteSize.X, 0, p1166.AbsoluteSize.Y)
			n2 = UDim2.fromOffset(p1166.AbsoluteSize.X / 2, p1166.AbsoluteSize.Y / 2)

			local v4276 = effectsServiceNewerCircle(parent, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 10001,
				Image = "rbxassetid://71017541938581",
				Rotation = 0,
				ImageColor3 = color3150,
				Size = v4273,
				Position = n2,
				Parent = parent
			})

			table.insert(t130, v4276)
			task.spawn(function()
				local v4470, v4471 = xpcall(function()
					while v4276.Parent and not u3950 do
						effectsServiceSpritesheet(v4276, Vector2.new(128, 128), { 6, 5 }, 1, 6, 24)

						if v4276.Parent and not u3950 then
							task.wait()
						end
					end
				end, debug.traceback)

				if not v4470 then
					local text: string = tostring(v4471)

					warn("[NyarlEffect1:Static] " .. text)
				end
			end)
			u3948 = task.spawn(function()
				local v4473, v4474 = xpcall(function()
					if not u3949 or not p1166.Parent then
						return
					end

					local n1 = p1166.ZIndex + 1
					local image = p1166.Image
					local uDim2175 = UDim2.new(0, p1166.AbsoluteSize.X, 0, p1166.AbsoluteSize.Y)
					local color3151 = Color3.fromRGB(0, 0, 255)
					local v4490 = UDim2.fromOffset(p1166.AbsolutePosition.X + p1166.AbsoluteSize.X / 2, p1166.AbsolutePosition.Y + p1166.AbsoluteSize.Y / 2)
					local parent = effectsServiceNewerCircle(p1164, {
						BackgroundTransparency = 1,
						ImageTransparency = 1,
						ZIndex = n1,
						Image = image,
						Size = uDim2175,
						ImageColor3 = color3151,
						Position = v4490
					})

					table.insert(t131, parent)

					local color3152 = Color3.fromRGB(0, 0, 255)

					v4490 = uDim2New(0, p1166.AbsoluteSize.X, 0, p1166.AbsoluteSize.X)
					n1 = UDim2.fromOffset(p1166.AbsoluteSize.X / 2, p1166.AbsoluteSize.Y / 2)

					local v4493 = effectsServiceNewerCircle(parent, {
						BackgroundTransparency = 1,
						ImageTransparency = 1,
						ZIndex = 10001,
						Image = "rbxassetid://78332584272934",
						Rotation = 180,
						ImageColor3 = color3152,
						Size = v4490,
						Position = n1,
						Parent = parent
					})

					table.insert(t131, v4493)

					local color3153 = Color3.fromRGB(255, 255, 255)
					local v4495 = uDim2New(0, p1166.AbsoluteSize.X, 0, p1166.AbsoluteSize.Y)
					local v4496 = UDim2.fromOffset(p1166.AbsolutePosition.X + p1166.AbsoluteSize.X / 2, p1166.AbsolutePosition.Y + p1166.AbsoluteSize.Y / 2)
					local v4497 = effectsServiceNewerCircle(p1164, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						ZIndex = 10000,
						Image = "rbxassetid://131028068620594",
						ImageColor3 = color3153,
						Size = v4495,
						Position = v4496
					})

					table.insert(t131, v4497)
					task.spawn(function()
						local v4501, v4502 = xpcall(function()
							while v4493.Parent and u3949 do
								effectsServiceSpritesheet(v4493, Vector2.new(470, 470), { 2, 2 }, 1, 4, 2)

								if v4493.Parent and u3949 then
									task.wait()
								end
							end
						end, debug.traceback)

						if not v4501 then
							local text: string = tostring(v4502)

							warn("[NyarlEffect1:Eye] " .. text)
						end
					end)
					task.spawn(function()
						local v4504, v4505 = xpcall(function()
							while v4497.Parent and u3949 do
								effectsServiceSpritesheet(v4497, Vector2.new(321, 512), { 2, 2 }, 1, 4, 2)

								if v4497.Parent and u3949 then
									task.wait()
								end
							end
						end, debug.traceback)

						if not v4504 then
							local text: string = tostring(v4505)

							warn("[NyarlEffect1:Crack] " .. text)
						end
					end)

					if not u3949 then
						return
					end

					effectsService.ShakeSync(parent, parent.Position, 2, 0.5)

					if not u3949 or not v4493.Parent then
						return
					end

					local animationAnimateAsync = animation.AnimateAsync
					local v4499 = uDim2New(0, p1166.AbsoluteSize.X * 2, 0, p1166.AbsoluteSize.X * 2)

					animationAnimateAsync(v4493, { ImageTransparency = 0, Rotation = 0, Size = v4499 }, 1, "Out", "Quint")
					task.wait(2)

					if not u3949 or not parent.Parent then
						return
					end

					effectsService.ShakeSync(parent, parent.Position, 2, 0.5)

					if not u3949 or not v4493.Parent then
						return
					end

					local animateAsync = animation.AnimateAsync

					v4499 = uDim2New(0, p1166.AbsoluteSize.X * 3, 0, p1166.AbsoluteSize.X * 3)
					animateAsync(v4493, { ImageTransparency = 1, Rotation = 0, Size = v4499 }, 1, "Out", "Quint")

					if v4497.Parent then
						v4497:Destroy()
					end

					task.wait(1)
				end, debug.traceback)

				if not u3951 then
					u3951 = true
					u3949 = false
					cleanup(t131)
				end

				if not v4473 then
					local text: string = tostring(v4474)

					warn("[NyarlEffect1:Inner] " .. text)
				end
			end)
			audioServicePlaySound("Entry")
			audioServicePlaySound("ApocSummon")

			local animationAnimateAsync = animation.AnimateAsync
			local uDim2176 = UDim2.new(0, p1165.AbsoluteSize.X * 10, 0, p1165.AbsoluteSize.X * 10)

			animationAnimateAsync(v4268, { ImageTransparency = 1, Size = uDim2176 }, 2, "Out", "Quint")
			animation.AnimateAsync(parent, { ImageTransparency = 0 }, 2, "In", "Quad")
			animation.AnimateAsync(v4276, { ImageTransparency = 0.7 }, 2, "In", "Quad")
			task.wait(2)

			if not p1166.Parent then
				return
			end

			audioServicePlaySound("johnhit")
			effectsService.ShakeSync(p1166, p1166.Position, 1, 0.1)

			if not parent.Parent or not v4276.Parent then
				return
			end

			local animateAsync = animation.AnimateAsync
			local uDim2177 = UDim2.new(0, p1166.AbsoluteSize.X * 2, 0, p1166.AbsoluteSize.Y * 2)

			animateAsync(parent, { ImageTransparency = 1, Size = uDim2177 }, 0.3, "Out", "Quad")
			animation.AnimateAsync(v4276, { ImageTransparency = 1 }, 0.3, "Out", "Quad")
			task.wait(0.3)
		end, debug.traceback)

		u3950 = true
		cleanup(t130)

		if not v3957 then
			u3949 = false

			if not u3951 then
				u3951 = true
				u3949 = false
				cleanup(t131)
			end

			local text: string = tostring(v3958)

			warn("[NyarlEffect1:Main] " .. text)
		end
	end)
	task.wait(2)
end
function module.DespairDeath(p1173, p1174, p1175, _)
	local t101: {[any]: any} = {
		"rbxassetid://3959152627",
		"rbxassetid://528256033",
		"rbxassetid://4770542473",
		"rbxassetid://248294226"
	}

	task.wait(0.8)
	audioServicePlaySound("MagicShatter")
	audioServicePlaySound("AbsorbAmbience1")
	audioServicePlaySound("AbsorbRumble")
	task.spawn(function()
		local t132: {[any]: any} = { Color3.fromRGB(8, 15, 80), Color3.fromRGB(18, 0, 158) }
		local v3961 = UDim2.fromOffset(p1174.AbsoluteSize.X * 0.8, p1174.AbsoluteSize.X * 0.8)

		effectsServiceBreathReverse(p1173, p1175, p1174, {
			Strength = 150,
			Time = 14,
			Transparency = 0.7,
			AddtionalSpread = 0.015,
			Projectile = t101,
			Color = t132,
			Size = v3961
		})
	end)
	task.wait(4)
	audioServicePlaySound("MagicShatter2")
	task.spawn(function()
		task.wait(1)
		audioServicePlaySound("AbsorbAmbience2")
	end)
	task.spawn(function()
		local t133: {[any]: any} = { Color3.fromRGB(8, 15, 80), Color3.fromRGB(18, 0, 158) }
		local v3963 = UDim2.fromOffset(p1174.AbsoluteSize.X * 1.5, p1174.AbsoluteSize.X * 1.5)

		effectsServiceBreathReverse(p1173, p1175, p1174, {
			Strength = 200,
			Time = 10,
			Transparency = 0.7,
			AddtionalSpread = 0.05,
			Projectile = t101,
			Color = t133,
			Size = v3963
		})
	end)
	task.wait(4)
	effectsService.ShakeBattleSync(p1173, 6, 0.025, 5)
	audioServicePlaySound("MagicShatter3")
	task.spawn(function()
		local t134: {[any]: any} = { Color3.fromRGB(8, 15, 80), Color3.fromRGB(18, 0, 158) }
		local v3965 = UDim2.fromOffset(p1174.AbsoluteSize.X * 2.5, p1174.AbsoluteSize.X * 2.5)

		effectsServiceBreathReverse(p1173, p1175, p1174, {
			Strength = 300,
			Time = 4,
			Transparency = 0.7,
			AddtionalSpread = 0.15,
			Projectile = t101,
			Color = t134,
			Size = v3965
		})
	end)
	task.wait(4)
	audioServicePlaySound("MagicShatter2")
	task.wait(5.5)
	audioServicePlaySound("DespairExplode")
	task.wait(1.5)
	audioServicePlaySound("Twinkle")
	task.spawn(function()
		task.wait(3)
		audioServiceUndimSongs()
	end)
end
function module.ElementGive(p1177, p1178, _, _)
	local t102: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 90) }
	local v2964 = UDim2.fromOffset(p1178.AbsoluteSize.X * 0.3, p1178.AbsoluteSize.X * 0.3)
	local n1 = p1178.ZIndex + 10501

	audioServicePlaySound("elementgive", { Volume = 1.8 })
	effectsServiceBreath(p1177, p1178, p1178, {
		Projectile = "rbxassetid://494765336",
		Strength = 500,
		Time = 0.2,
		Color = t102,
		Size = v2964,
		ZIndex = n1
	})
	effectsService.ShakeSync(p1178, p1178.Position, 0.2, 0.2)
end
function module.ElementGive2(p1181, p1182, _, _)
	local t103: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 0, 90) }
	local v2971 = UDim2.fromOffset(p1182.AbsoluteSize.X * 0.3, p1182.AbsoluteSize.X * 0.3)
	local n1 = p1182.ZIndex + 10501
	local t104: {[any]: any} = { Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 0, 90) }
	local v2974 = UDim2.fromOffset(p1182.AbsoluteSize.X * 0.3, p1182.AbsoluteSize.X * 0.3)
	local n2 = p1182.ZIndex + 10501

	audioServicePlaySound("elementgive", { Volume = 1.8 })

	local t105: {[any]: any} = {
		Projectile = "rbxassetid://494765336",
		Strength = 500,
		Time = 0.2,
		Color = t104,
		Size = v2974,
		ZIndex = n2
	}

	effectsServiceBreath(p1181, p1182, p1182, t105)
	effectsService.ShakeSync(p1182, p1182.Position, 0.2, 0.2)
	task.wait(0.2)
	audioServicePlaySound("elementgive", { Volume = 1.8 })
	effectsServiceBreath(p1181, p1182, p1182, t105)
	effectsService.ShakeSync(p1182, p1182.Position, 0.2, 0.2)
	task.wait(0.2)
	audioServicePlaySound("elementgive", { Volume = 1.8, Pitch = 1.3 })
	effectsServiceBreath(p1181, p1182, p1182, {
		Projectile = "rbxassetid://494765336",
		Strength = 500,
		Time = 0.2,
		Color = t103,
		Size = v2971,
		ZIndex = n1
	})
	effectsService.ShakeSync(p1182, p1182.Position, 0.2, 0.2)
end
function module.AssassinMark(p1185, _, parent)
	local n1 = parent.ZIndex + 1
	local v2981 = UDim2.fromScale(0.8, 0.8)
	local v2982 = UDim2.fromScale(0.5, 0.5)
	local color3154 = Color3.fromRGB(255, 255, 255)
	local v2984 = effectsServiceNewerCircle(p1185, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://10236705400",
		ImageTransparency = 0.3,
		Rotation = 180,
		ZIndex = n1,
		Size = v2981,
		Position = v2982,
		ImageColor3 = color3154
	})
	local n2 = parent.ZIndex + 1
	local v2986 = UDim2.fromScale(1, 1)
	local v2987 = UDim2.fromScale(0.5, 0.5)
	local color3155 = Color3.fromRGB(255, 255, 255)
	local v2989 = effectsServiceNewerCircle(p1185, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://139201103061054",
		ImageTransparency = 0.4,
		Rotation = 180,
		ZIndex = n2,
		Size = v2986,
		Position = v2987,
		ImageColor3 = color3155
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v2989
	v2989.Parent = parent

	local uiAspectRatioConstraint4: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint4.Parent = v2984
	v2984.Parent = parent
	task.spawn(function()
		animation.AnimateAsync(v2984, { Rotation = 360 }, 1.5, "Out", "Quint")

		local t135: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0) }

		audioServicePlaySound("Scarytarget")
		effectsServicePulse(p1185, v2984, { Time = 0.7, FlashTime = 0.4, Color = t135, Transparency = 0.1 })
	end)
	task.spawn(function()
		for _ = 1, 60 do
			task.spawn(function()
				effectsServiceSpritesheet(v2989, Vector2.new(256, 256), { 7, 7 }, 1, 10, 9)
				effectsServiceSpritesheet(v2984, Vector2.new(256, 256), { 7, 7 }, 1, 10, 3)
				task.wait(3)
				v2989:Destroy()
			end)
			task.wait(math.random(0.2, 3))
		end
	end)
end
function module.StationEffect(p1188, p1189, _, _, p1192)
	task.spawn(function()
		for _ = 1, 13 do
			task.spawn(function()
				local randomNumber = math.random(50, 150)
				local randomNumber58 = math.random(40, 120)
				local randomNumber59 = math.random(-360, 360)
				local n1 = p1189.ZIndex - 1
				local uDim2 = UDim2.new(0, p1189.AbsoluteSize.X * 0.7, 0, p1189.AbsoluteSize.X * 0.7)
				local color3156 = Color3.fromRGB(211, 255, 255)
				local v4287 = UDim2.fromOffset(p1189.AbsolutePosition.X + p1189.AbsoluteSize.X / 2, p1189.AbsolutePosition.Y + p1189.AbsoluteSize.Y / 2)
				local v4288 = effectsServiceNewerCircle(p1188, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.8,
					Image = "rbxassetid://78807031729676",
					ZIndex = n1,
					Size = uDim2,
					ImageColor3 = color3156,
					Position = v4287
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4290 = UDim2.fromOffset((p1189.AbsolutePosition.X + p1189.AbsoluteSize.X / 2) * (randomNumber / 100), (p1189.AbsolutePosition.Y + p1189.AbsoluteSize.Y / 2) * 0.7 * (randomNumber58 / 100))

				animationAnimateAsync(v4288, { Position = v4290, Rotation = randomNumber59 }, 0.3, "Out", "Sine")
				task.wait(0.3)

				local animateAsync = animation.AnimateAsync

				v4290 = UDim2.fromOffset((p1189.AbsolutePosition.X + p1189.AbsoluteSize.X / 2) * (randomNumber / 100), (p1189.AbsolutePosition.Y + p1189.AbsoluteSize.Y / 2) * 2 * (randomNumber58 / 100))
				animateAsync(v4288, { ImageTransparency = 1, Position = v4290 }, 2, "In", "Sine")
				task.wait(2)
				v4288:Destroy()
			end)
		end
	end)
	task.spawn(function()
		local t136 = { "Stationed and Ready!", "Ready to go!", "Reporting for duty!" }
		local color3157 = Color3.fromRGB(211, 255, 255)
		local s1: string = "Radiobeep1"
		local v3972 = Enum.Font.Code

		if p1192 == "Outlaw" or p1192 == "Outlaw ★" then
			t136 = { "Howdy.", "You ready?", "Got it." }
			color3157 = Color3.fromRGB(255, 200, 2)
			s1 = "Radiobeep2"
		elseif p1192 == "Soldier" or p1192 == "Soldier ★" then
			t136 = { "Understood!", "Stationed!", "Ready for orders!" }
			color3157 = Color3.fromRGB(255, 255, 255)
			s1 = "Radiobeep1"
		elseif p1192 == "Paladin" or p1192 == "Paladin ★" then
			t136 = { "RAAAAGH", "GGRHGGGG", "AAAAAAAAAAAAA" }
			color3157 = Color3.fromRGB(255, 0, 0)
			s1 = "Radiobeep3"
		elseif p1192 == "Lookout" or p1192 == "Lookout ★" then
			t136 = { "I see em.", "Hmm..", "I'll keep watch." }
			color3157 = Color3.fromRGB(100, 100, 255)
			s1 = "Radiobeep1"
		elseif p1192 == "SupaSpeedster" or p1192 == "SupaSpeedster ★" then
			t136 = { "I'm here!!", "Let's go!!", "I got it!!" }
			color3157 = Color3.fromRGB(77, 77, 77)
			s1 = "Radiobeep2"
		elseif p1192 == "Destructor" or p1192 == "Destructor ★" then
			t136 = { "Lemme at em.", "Heads up!", "Can't beat me." }
			color3157 = Color3.fromRGB(167, 34, 34)
			s1 = "Radiobeep3"
		elseif p1192 == "TERMINATOR MK II" or p1192 == "TERMINATOR MK II ★" then
			t136 = { "...", "...", "..." }
			color3157 = Color3.fromRGB(48, 48, 24)
			s1 = "Radiobeep1"
		elseif p1192 == "Kindler" or p1192 == "Kindler ★" then
			t136 = { "They'll burn..", "Gonna go up in flames!", "World Ablaze." }
			color3157 = Color3.fromRGB(208, 48, 24)
			s1 = "Radiobeep2"
		elseif p1192 == "SIN" or p1192 == "SIN ★" then
			t136 = { "Doom.", "Ruin.", "No survivors." }
			color3157 = Color3.fromRGB(0, 0, 0)
			s1 = "Radiobeep3"
			v3972 = Enum.Font.Oswald
		elseif p1192 == "Mudsplatter" or p1192 == "Mudsplatter ★" then
			t136 = { "Geared up.", "No way they get past me.", "Your orders?" }
			color3157 = Color3.fromRGB(98, 51, 0)
			s1 = "Radiobeep1"
		elseif p1192 == "Mathematician" or p1192 == "Mathematician ★" then
			t136 = {
				"you stupid",
				"is bro einstein",
				"if (cardname == Mathematician) then Specifictext = {you stupid, is bro einstein, yeah} WordColour = Color3.fromRGB(98, 51, 99) Radiosound = Radiobeep1 end"
			}
			color3157 = Color3.fromRGB(98, 51, 99)
			s1 = "Radiobeep2"
		elseif p1192 == "Businessman" or p1192 == "Businessman ★" then
			t136 = { "Buy em out.", "Need some more?", "How about another?" }
			color3157 = Color3.fromRGB(255, 255, 189)
			s1 = "Radiobeep3"
		elseif p1192 == "Jean, Electric Savior" or p1192 == "Jean, Electric Savior ★" then
			t136 = {
				"YOU CAUSED ENOUGH HARM.",
				"THE STORM IS COMING...",
				"I'LL PIERCE YOUR SOUL!"
			}
			color3157 = Color3.fromRGB(25, 25, 255)
			s1 = "Radiobeep3"
		end

		local randomNumber = math.random(1, 3)
		local v3974 = t136[randomNumber]:upper()
		local v3975 = UDim2.fromScale(1, 0.1)
		local v3976 = UDim2.fromOffset(p1189.AbsolutePosition.X + p1189.AbsoluteSize.X / 2, p1189.AbsolutePosition.Y + p1189.AbsoluteSize.Y / 2)

		t136 = effectsServiceNewText(p1188, {
			BackgroundTransparency = 1,
			TextScaled = true,
			TextTransparency = 0,
			Size = v3975,
			Position = v3976,
			Text = v3974,
			ZIndex = p1189.ZIndex + 10001,
			TextColor3 = color3157,
			Font = v3972
		})
		audioServicePlaySound(s1, { Volume = 1.8 })

		local animationAnimateAsync = animation.AnimateAsync

		v3976 = uDim2New(0.5, 0, 0.5, 0)
		animationAnimateAsync(t136, { Position = v3976 }, 0.3, "Out", "Sine")
		task.wait(1)
		animation.AnimateAsync(t136, { TextTransparency = 1 }, 1, "In", "Sine")
		task.wait(1)
		t136:Destroy()
	end)
	audioServicePlaySound("Station", { Volume = 1.8 })
	effectsService.ShakeSync(p1189, p1189.Position, 0.2, 0.2)
end
function module.PursuedProc(p1193, p1194, _, _, _)
	task.spawn(function()
		local color3158 = Color3.fromRGB(10, 0, 0)
		local n1 = p1194.ZIndex - 1
		local v3980 = uDim2New(1, 0, 2, 0)
		local v3981 = uDim2New(0.5, 0, 0.5, 0)
		local v3982 = effectsServiceNewerCircle(p1193, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color3158,
			ZIndex = n1,
			Size = v3980,
			Position = v3981
		})

		animation.AnimateAsync(v3982, { BackgroundTransparency = 0.3 }, 0.2, "Out", "Quint")
		task.wait(1)
		animation.AnimateAsync(v3982, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		task.wait(1)
		v3982:Destroy()
	end)
	audioServicePlaySound("Gust", { Volume = 1.8 })
	effectsService.ShakeSync(p1194, p1194.Position, 0.5, 0.8)
	task.wait(0.5)
end
function module.PursuerSummon(p1198, p1199, _, _, p1202)
	p1199.Visible = false
	audioServiceDimSongs()

	local color3159 = Color3.fromRGB(10, 0, 0)
	local v3008 = uDim2New(1, 0, 2, 0)
	local v3009 = uDim2New(0.5, 0, 0.5, 0)
	local v3010 = effectsServiceNewerCircle(p1198, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3159,
		Size = v3008,
		Position = v3009
	})
	local image = p1199.Image
	local v3012 = uDim2New(0, p1199.AbsoluteSize.X, 0, p1199.AbsoluteSize.Y)
	local v3013 = UDim2.fromOffset(p1199.AbsolutePosition.X + p1199.AbsoluteSize.X / 2, p1199.AbsolutePosition.Y + p1199.AbsoluteSize.Y / 2)
	local v3014 = effectsServiceNewerCircle(p1198, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		Image = image,
		Size = v3012,
		Position = v3013
	})

	task.spawn(function()
		local color3160 = Color3.fromRGB(0, 0, 0)
		local v3984 = uDim2New(0.5, 0, 0.4, 0)
		local v3985 = uDim2New(0.5, 0, 1, 0)
		local v3986 = effectsServiceNewerCircle(p1198, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			ZIndex = 10005,
			BackgroundColor3 = color3160,
			Size = v3984,
			Position = v3985
		})
		local color3161 = Color3.fromRGB(255, 0, 0)
		local v3988 = uDim2New(0.515, 0, 0.42, 0)
		local v3989 = uDim2New(0.5, 0, 1, 0)
		local v3990 = effectsServiceNewerCircle(p1198, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			ZIndex = 10004,
			BackgroundColor3 = color3161,
			Size = v3988,
			Position = v3989
		})
		local v3991 = uDim2New(0.2, 0, 0.05, 0)
		local v3992 = uDim2New(0.5, 0, 0.85, 0)
		local color3162 = Color3.fromRGB(255, 255, 255)
		local v3994 = effectsServiceNewText(p1198, {
			BackgroundTransparency = 1,
			TextScaled = true,
			Text = "The killer is...",
			ZIndex = 10006,
			TextTransparency = 0,
			Size = v3991,
			Position = v3992,
			TextColor3 = color3162,
			Font = Enum.Font.Legacy
		})
		local v3995 = uDim2New(0.3, 0, 0.15, 0)
		local v3996 = uDim2New(0.5, 0, 0.93, 0)
		local color3163 = Color3.fromRGB(255, 0, 0)

		v3985 = effectsServiceNewText(p1198, {
			BackgroundTransparency = 1,
			TextScaled = true,
			ZIndex = 10006,
			TextTransparency = 0,
			Size = v3995,
			Position = v3996,
			Text = p1202,
			TextColor3 = color3163,
			Font = Enum.Font.Legacy
		})
		task.wait(2)
		animation.AnimateAsync(v3986, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		animation.AnimateAsync(v3990, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		animation.AnimateAsync(v3994, { TextTransparency = 1 }, 1, "Out", "Quint")
		animation.AnimateAsync(v3985, { TextTransparency = 1 }, 1, "Out", "Quint")
		task.wait(1)
		v3986:Destroy()
		v3990:Destroy()
		v3994:Destroy()
		v3985:Destroy()
	end)
	animation.AnimateAsync(v3010, { BackgroundTransparency = 0.3 }, 0.2, "Out", "Quint")
	animation.AnimateAsync(v3014, { ImageTransparency = 0 }, 2, "Out", "Quint")
	task.spawn(function()
		for _ = 1, 20 do
			task.spawn(function()
				local v4292 = uDim2New(0, p1199.AbsoluteSize.X * 1.5, 0, p1199.AbsoluteSize.X / 2)
				local v4293 = UDim2.fromOffset(p1199.AbsolutePosition.X + p1199.AbsoluteSize.X / 2, p1199.AbsolutePosition.Y + p1199.AbsoluteSize.Y / 2)
				local v4294 = effectsServiceNewerCircle(p1198, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.7,
					ZIndex = 10001,
					Image = "rbxassetid://117402865936769",
					Size = v4292,
					Position = v4293
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4296 = UDim2.fromOffset(p1199.AbsolutePosition.X + p1199.AbsoluteSize.X / 2, p1199.AbsolutePosition.Y - p1199.AbsolutePosition.Y / 4)
				local v4297 = uDim2New(0, p1199.AbsoluteSize.X * 4, 0, p1199.AbsoluteSize.X)

				animationAnimateAsync(v4294, { ImageTransparency = 1, Position = v4296, Size = v4297 }, 3, "Out", "Quint")
				task.wait(3)
				v4294:Destroy()
			end)
			task.wait(0.1)
		end
	end)
	audioServicePlaySound("Howl - Pursuer", { Volume = 1.8 })
	effectsService.ShakeSync(v3014, v3014.Position, 2, 1)
	task.wait(2)
	task.spawn(function()
		for _, v in pairs(p1199.Parent:GetChildren()) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.25, 0.002)
			end)
		end
	end)
	animation.AnimateAsync(v3010, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
	task.wait(1)
	v3010:Destroy()
	v3014:Destroy()
	p1199.Visible = true
	audioServiceUndimSongs()
end
function module.ArtfulDeath(p1203, p1204, _, _, _)
	task.wait(0.1)
	p1204.Visible = false

	local image = p1204.Image
	local v3021 = uDim2New(0, p1204.AbsoluteSize.X, 0, p1204.AbsoluteSize.Y)
	local v3022 = UDim2.fromOffset(p1204.AbsolutePosition.X + p1204.AbsoluteSize.X / 2, p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2)
	local v3023 = effectsServiceNewerCircle(p1203, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		Image = image,
		Size = v3021,
		Position = v3022
	})
	local v3024 = uDim2New(0, p1204.AbsoluteSize.X, 0, p1204.AbsoluteSize.X)
	local v3025 = UDim2.fromOffset((p1204.AbsolutePosition.X + p1204.AbsoluteSize.X / 2) * 5, p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2)
	local parent = effectsServiceNewerCircle(p1203, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		Image = "rbxassetid://28937264",
		Size = v3024,
		Position = v3025
	})
	local v3027 = uDim2New(0, p1204.AbsoluteSize.X, 0, p1204.AbsoluteSize.X)
	local v3028 = UDim2.fromOffset(0, 0)
	local v3029 = effectsServiceNewerCircle(p1203, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		Image = "rbxassetid://28937264",
		Rotation = 270,
		Size = v3027,
		Position = v3028,
		Parent = parent
	})

	audioServicePlaySound("BoomerangThrow", { Volume = 1 })

	local animationAnimateAsync = animation.AnimateAsync
	local v3031 = UDim2.fromOffset((p1204.AbsolutePosition.X + p1204.AbsoluteSize.X / 2) * 1.2, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * 0.9)

	animationAnimateAsync(parent, { Position = v3031 }, 1, "InOut", "Linear")

	local animateAsync = animation.AnimateAsync

	v3031 = UDim2.fromOffset(0, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * -0.4)
	animateAsync(v3029, { Rotation = 290, Position = v3031 }, 0.5, "Out", "Sine")
	task.wait(0.5)

	local v3033 = animation.AnimateAsync

	v3031 = UDim2.fromOffset(0, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * 0)
	v3033(v3029, { Rotation = 45, Position = v3031 }, 0.5, "In", "Sine")
	task.wait(0.5)

	local v3034 = animation.AnimateAsync

	v3031 = UDim2.fromOffset(0, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * -0.4)
	v3034(v3029, { Rotation = 0, ImageTransparency = 1, Position = v3031 }, 0.5, "Out", "Sine")

	local v3035 = animation.AnimateAsync

	v3031 = UDim2.fromOffset((p1204.AbsolutePosition.X + p1204.AbsoluteSize.X / 2) * 1.3, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * 0.85)
	v3035(parent, { Position = v3031 }, 0.5, "Out", "Sine")

	local v3036 = animation.AnimateAsync

	v3031 = UDim2.fromOffset(p1204.AbsolutePosition.X + p1204.AbsoluteSize.X / 2, (p1204.AbsolutePosition.Y + p1204.AbsoluteSize.Y / 2) * 1.3)
	v3036(v3023, { ImageTransparency = 1, Position = v3031 }, 1, "In", "Quint")
	audioServicePlaySound("Banana Slip Sound Effect", { Volume = 1.8 })
	task.wait(1)
	v3023:Destroy()
	parent:Destroy()
	v3029:Destroy()
end
function module.JohnPing(p1208, _, p1210, _, _)
	task.spawn(function()
		local n1 = p1210.ZIndex + 1
		local uDim2 = UDim2.new(0, p1210.AbsoluteSize.X, 0, p1210.AbsoluteSize.Y)
		local color3164 = Color3.fromRGB(100, 60, 200)
		local v4004 = UDim2.fromOffset(p1210.AbsolutePosition.X + p1210.AbsoluteSize.X / 2, p1210.AbsolutePosition.Y + p1210.AbsoluteSize.Y / 2)
		local v4005 = effectsServiceNewerCircle(p1208, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			Image = "rbxassetid://126300995880097",
			ZIndex = n1,
			Size = uDim2,
			ImageColor3 = color3164,
			Position = v4004
		})
		local animationAnimate = animation.Animate
		local uDim2178 = UDim2.new(0, p1210.AbsoluteSize.X * 1.4, 0, p1210.AbsoluteSize.Y * 1.4)

		animationAnimate(v4005, { ImageTransparency = 1, Size = uDim2178 }, 1, "Out", "Quart")
		task.wait(1)
		v4005:Destroy()
	end)
	task.spawn(function()
		for _ = 1, 3 do
			task.spawn(function()
				local randomNumber = math.random(80, 120)
				local randomNumber60 = math.random(80, 120)
				local randomNumber61 = math.random(-360, 360)
				local n1 = p1210.ZIndex + 1
				local uDim2 = UDim2.new(0, p1210.AbsoluteSize.X * 0.7, 0, p1210.AbsoluteSize.X * 0.1)
				local color3165 = Color3.fromRGB(100, 60, 200)
				local v4304 = UDim2.fromOffset(p1210.AbsolutePosition.X + p1210.AbsoluteSize.X / 2, p1210.AbsolutePosition.Y + p1210.AbsoluteSize.Y / 2)
				local v4305 = effectsServiceNewerCircle(p1208, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = "rbxassetid://117402865936769",
					ZIndex = n1,
					Size = uDim2,
					ImageColor3 = color3165,
					Position = v4304
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4307 = UDim2.fromOffset((p1210.AbsolutePosition.X + p1210.AbsoluteSize.X / 2) * (randomNumber / 100), (p1210.AbsolutePosition.Y + p1210.AbsoluteSize.Y / 2) * 0.7 * (randomNumber60 / 100))

				animationAnimateAsync(v4305, { ImageTransparency = 1, Position = v4307, Rotation = randomNumber61 }, 0.6, "Out", "Sine")
				task.wait(0.6)
				v4305:Destroy()
			end)
		end

		audioServicePlaySound("clock tick", { Volume = 0.3 })
	end)
end
function module.JohnSummon(p1213, p1214, _, _, _)
	p1214.Visible = false

	local image = p1214.Image
	local color3166 = Color3.fromRGB(50, 50, 50)
	local v3049 = uDim2New(0, p1214.AbsoluteSize.X, 0, p1214.AbsoluteSize.Y)
	local v3050 = UDim2.fromOffset(p1214.AbsolutePosition.X + p1214.AbsoluteSize.X / 2, (p1214.AbsolutePosition.Y + p1214.AbsoluteSize.Y / 2) * 1.6)
	local parent = effectsServiceNewerCircle(p1213, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		ClipsDescendants = true,
		Image = image,
		ImageColor3 = color3166,
		Size = v3049,
		Position = v3050
	})
	local color3167 = Color3.fromRGB(255, 255, 255)
	local v3053 = uDim2New(0, p1214.AbsoluteSize.X, 0, p1214.AbsoluteSize.Y)
	local v3054 = UDim2.fromOffset(p1214.AbsoluteSize.X / 2, p1214.AbsoluteSize.Y / 2)
	local v3055 = effectsServiceNewerCircle(p1213, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.8,
		ZIndex = 10001,
		Image = "rbxassetid://71017541938581",
		Rotation = 0,
		ImageColor3 = color3167,
		Size = v3053,
		Position = v3054,
		Parent = parent
	})
	local color3168 = Color3.fromRGB(0, 0, 0)
	local v3057 = uDim2New(1, 0, 2, 0)
	local v3058 = uDim2New(0.5, 0, 0.5, 0)
	local v3059 = effectsServiceNewerCircle(p1213, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3168,
		Size = v3057,
		Position = v3058
	})

	task.spawn(function()
		effectsServiceSpritesheet(v3055, Vector2.new(128, 128), { 6, 5 }, 1, 6, 24, nil, true)
	end)
	task.spawn(function()
		effectsServiceSpritesheet(v3055, Vector2.new(160, 40), { 6, 5 }, 1, 6, 13, nil, true)
	end)
	audioServiceDimSongs()
	task.spawn(function()
		for i = 1, 30 do
			audioServicePlaySound("Fnaf 1 Camera click", { PlaybackSpeed = i / 2 + 1 })
			task.wait(0.1)
		end
	end)
	animation.AnimateAsync(v3059, { BackgroundTransparency = 1 }, 4, "In", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v3061 = UDim2.fromOffset(p1214.AbsolutePosition.X + p1214.AbsoluteSize.X / 2, (p1214.AbsolutePosition.Y + p1214.AbsoluteSize.Y / 2) * 1.3)

	animationAnimateAsync(parent, { ImageTransparency = 0, Position = v3061 }, 3, "In", "Quad")
	task.wait(3)
	effectsService.ShakeSync(parent, parent.Position, 0.2, 0.1)
	animation.AnimateAsync(v3055, { ImageTransparency = 0 }, 0, "In", "Sine")
	audioServicePlaySound("white-noise-glitch-gfx")
	task.wait(0.2)
	animation.AnimateAsync(v3055, { ImageTransparency = 1 }, 0, "In", "Sine")
	task.wait(1)

	local animateAsync = animation.AnimateAsync

	v3061 = UDim2.fromOffset(p1214.AbsolutePosition.X + p1214.AbsoluteSize.X / 2, p1214.AbsolutePosition.Y + p1214.AbsoluteSize.Y / 2)
	animateAsync(parent, { Position = v3061 }, 2, "InOut", "Quad")
	task.wait(1.2)
	animation.AnimateAsync(v3055, { ImageTransparency = 0 }, 0, "In", "Sine")
	audioServicePlaySound("Fnaf 1 Camera click")
	task.wait(0.1)
	animation.AnimateAsync(v3055, { ImageTransparency = 1 }, 0, "In", "Sine")
	task.wait(0.3)
	animation.AnimateAsync(v3055, { ImageTransparency = 0 }, 0, "In", "Sine")
	audioServicePlaySound("Fnaf 1 Camera click", { PlaybackSpeed = 1.1 })
	task.wait(0.2)
	animation.AnimateAsync(v3055, { ImageTransparency = 1 }, 0, "In", "Sine")
	task.wait(0.2)

	local v3063 = animation.AnimateAsync
	local color3169 = Color3.fromRGB(255, 255, 255)

	v3063(parent, { ImageColor3 = color3169 }, 0.4, "In", "Sine")
	task.wait(0.4)
	audioServiceUndimSongs()
	parent:Destroy()
	v3055:Destroy()
	v3059:Destroy()
	p1214.Visible = true
end
function module.JohnAttack(p1218, _, parent, _, _)
	local n1 = parent.ZIndex + 1
	local color3170 = Color3.fromRGB(255, 255, 255)
	local v3072 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y)
	local v3073 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)
	local v3074 = effectsServiceNewerCircle(p1218, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://71017541938581",
		Rotation = 0,
		ZIndex = n1,
		ImageColor3 = color3170,
		Size = v3072,
		Position = v3073,
		Parent = parent
	})

	task.spawn(function()
		effectsServiceSpritesheet(v3074, Vector2.new(128, 128), { 6, 5 }, 1, 6, 24, nil, true)
	end)
	task.spawn(function()
		effectsServiceSpritesheet(v3074, Vector2.new(160, 40), { 6, 5 }, 1, 6, 13, nil, true)
	end)
	animation.AnimateAsync(v3074, { ImageTransparency = 0 }, 1, "In", "Quad")
	task.spawn(function()
		for i = 1, 10 do
			audioServicePlaySound("Fnaf 1 Camera click", { PlaybackSpeed = i + 1 })
			task.wait(0.1)
		end
	end)
	task.wait(1)
	effectsService.ShakeSync(parent, parent.Position, 0.2, 0.1)
	audioServicePlaySound("white-noise-glitch-gfx")
	task.wait(0.1)
	v3074:Destroy()
end
function module.JohnMelting(p1223, p1224, p1225, _)
	local n1 = p1225.ZIndex + 1
	local image = p1225.Image
	local v3081 = uDim2New(0, p1225.AbsoluteSize.X, 0, p1225.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p1225.AbsolutePosition.X, 0, p1225.AbsolutePosition.Y)
	local uDim2179 = UDim2.new(0, p1225.AbsoluteSize.X * 0.5, 0, p1225.AbsoluteSize.Y * 0.5)
	local v3084 = effectsServiceNewerCircle(p1223, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.8,
		ZIndex = n1,
		Image = image,
		Size = v3081,
		Position = uDim2 + uDim2179
	})

	task.spawn(function()
		effectsServiceSpritesheet(v3084, Vector2.new(128, 128), { 5, 5 }, 1, 24, 24, nil, true)
	end)
	task.spawn(function()
		for _ = 1, 25 do
			task.spawn(function()
				local n1 = p1225.ZIndex - 1
				local image = p1225.Image
				local v4310 = uDim2New(0, p1225.AbsoluteSize.X, 0, p1225.AbsoluteSize.Y)
				local v4311 = p1225
				local uDim2180 = UDim2.new(0, v4311.AbsolutePosition.X, 0, v4311.AbsolutePosition.Y)
				local uDim2181 = UDim2.new(0, v4311.AbsoluteSize.X * 0.5, 0, v4311.AbsoluteSize.Y * 0.5)
				local v4314 = effectsServiceNewerCircle(p1223, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ZIndex = n1,
					Image = image,
					Size = v4310,
					Position = uDim2180 + uDim2181
				})
				local animationAnimateAsync = animation.AnimateAsync

				v4311 = UDim2.fromOffset(p1225.AbsolutePosition.X * 1.2, p1225.AbsolutePosition.Y + p1225.AbsoluteSize.Y / 2)

				local color3171 = Color3.fromRGB(255, 20, 20)

				animationAnimateAsync(v4314, { ImageTransparency = 1, Position = v4311, ImageColor3 = color3171 }, 1, "Out", "Linear")
				task.wait(1)
				v4314:Destroy()
			end)
			task.wait(0.2)
		end
	end)

	if math.random(1, 2) == 1 then
		task.spawn(function()
			local randomNumber = math.random(-80, 40)
			local randomNumber62 = math.random(-40, 40)
			local randomNumber63 = math.random(0, 360)

			task.spawn(function()
				local t140: {[any]: any} = {
					"it's not just me right?",
					"seriously. i feel like i'm the butt of a joke.",
					"this is embarassing you know",
					"can you please just give up?",
					"what are you even doing here?",
					"i'm really sorry telamon."
				}
				local randomNumber64 = math.random(1, 6)
				local v4319 = t140[randomNumber64]
				local v4320 = uDim2New(0, p1224.AbsoluteSize.Y * 5, 0, p1224.AbsoluteSize.X * 5)
				local v4321 = uDim2New(0.5 + randomNumber / 200, 0, 0.5 + randomNumber62 / 200, 0)
				local parent = effectsServiceNewCircle(p1223, {
					ImageTransparency = 1,
					BackgroundTransparency = 1,
					Size = v4320,
					Position = v4321,
					Rotation = randomNumber63,
					ZIndex = p1224.ZIndex + 10001
				})

				for i = 1, #v4319 do
					local v4324 = UDim2.fromScale(3, 0.32)
					local uDim2FromOffset = UDim2.fromOffset
					local randomNumber65 = math.random(-10, 10)
					local randomNumber66 = math.random(-10, 10)
					local uDim2 = uDim2FromOffset(i * 50 + randomNumber65 * 0.03, 0 + randomNumber66 * 0.03)
					local substring = v4319:sub(i, i)
					local n1 = p1224.ZIndex + 10001
					local color3172 = Color3.fromRGB(100, 10, 255)
					local v4332 = effectsServiceNewText(p1223, {
						BackgroundTransparency = 1,
						TextTransparency = 0,
						Size = v4324,
						Position = uDim2,
						Text = substring,
						ZIndex = n1,
						TextColor3 = color3172,
						Font = Enum.Font.Garamond,
						Parent = parent
					})

					task.spawn(function()
						task.wait(5)
						animation.AnimateAsync(v4332, { TextTransparency = 1 }, 2, "Out", "Sine")
						task.wait(1)
						v4332:Destroy()
					end)
					task.wait(0.05)
				end

				task.spawn(function()
					task.wait(7)
					parent:Destroy()
				end)
			end)
			task.wait(math.random(1, 10))
		end)
	end

	task.spawn(function()
		task.wait(2)
		animation.AnimateAsync(v3084, { ImageTransparency = 1 }, 1, "Out", "Linear")
		task.wait(1)
		v3084:Destroy()
	end)
end
function module.JohnBackground(p1227, p1228, _, _)
	math.random(4, 4)

	local color3173 = Color3.fromRGB(23, 23, 25)
	local color3174 = Color3.fromRGB(23, 23, 0)
	local color3175 = Color3.fromRGB(0, 23, 25)
	local color3176 = Color3.fromRGB(23, 0, 25)
	local t106: {[any]: any} = { color3173, color3174, color3175, color3176, Color3.fromRGB(0, 0, 25) }
	local color3177 = Color3.fromRGB(255, 23, 25)
	local color3178 = Color3.fromRGB(23, 255, 0)
	local color3179 = Color3.fromRGB(100, 23, 255)
	local color3180 = Color3.fromRGB(23, 255, 255)
	t106 = {
		color3177,
		color3178,
		color3179,
		color3180,
		Color3.fromRGB(255, 150, 100)
	}
	local color3181 = Color3.fromRGB(0, 0, 25)
	local color3182 = Color3.fromRGB(0, 25, 0)
	local color3183 = Color3.fromRGB(25, 0, 25)
	local color3184 = Color3.fromRGB(0, 0, 0)
	t106 = {
		color3181,
		color3182,
		color3183,
		color3184,
		Color3.fromRGB(0, 10, 10)
	}
	local color3185 = Color3.fromRGB(23, 23, 25)
	local color3186 = Color3.fromRGB(100, 10, 255)
	local color3187 = Color3.fromRGB(0, 0, 0)

	local function v3105(p1231)
		for _ = 1, p1231 do
			task.spawn(function()
				local randomNumber = math.random(0, 100)
				local v4334 = uDim2New(0, p1228.AbsoluteSize.X * 5, 0, p1228.AbsoluteSize.X * 5)
				local v4335 = uDim2New(randomNumber / 100, 0, 1.2, 0)
				local v4336 = effectsServiceNewerCircle(p1227, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ZIndex = -9999,
					Image = "rbxassetid://126300995880097",
					ImageColor3 = color3186,
					Size = v4334,
					Position = v4335
				})
				local v4337 = uDim2New(0, p1228.AbsoluteSize.X * 4.8, 0, p1228.AbsoluteSize.X * 4.8)
				local v4338 = uDim2New(randomNumber / 100, 0, 1.2, 0)
				local v4339 = effectsServiceNewerCircle(p1227, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ZIndex = 10000,
					Image = "rbxassetid://126300995880097",
					ImageColor3 = color3187,
					Size = v4337,
					Position = v4338
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4341 = uDim2New(randomNumber / 100, 0, 0.5, 0)
				local v4342 = uDim2New(0, 0, 0, 0)

				animationAnimateAsync(v4336, { Position = v4341, Size = v4342 }, 4, "Out", "Sine")

				local animateAsync = animation.AnimateAsync

				v4342 = uDim2New(randomNumber / 100, 0, 0.5, 0)
				v4341 = uDim2New(0, 0, 0, 0)
				animateAsync(v4339, { Position = v4342, Size = v4341 }, 4, "Out", "Sine")
				task.wait(4)
				v4336:Destroy()
				v4339:Destroy()
			end)
			task.wait(0.2)
		end
	end

	task.spawn(function()
		task.wait(0.25)

		local v4017 = uDim2New(1, 0, 2, 0)
		local v4018 = uDim2New(0.5, 0, 0.5, 0)
		local v4019 = effectsServiceNewerCircle(p1227, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			ZIndex = -10000,
			BackgroundColor3 = color3185,
			Size = v4017,
			Position = v4018
		})
		local v4020 = uDim2New(1, 0, 2, 0)
		local v4021 = uDim2New(0.5, 0, 0.5, 0)
		local v4022 = effectsServiceNewerCircle(p1227, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			ZIndex = 10000,
			BackgroundColor3 = color3185,
			Size = v4020,
			Position = v4021
		})

		animation.AnimateAsync(v4022, { BackgroundTransparency = 1 }, 2, "Out", "Sine")
		task.wait(12.8)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
		task.wait(1.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
		task.wait(1.9)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
		task.wait(1.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
		task.wait(1.9)
		task.spawn(function()
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
		end)
		task.spawn(function()
			for i = 1, 12 do
				task.spawn(function()
					local v4476 = color3186

					if i % 2 == 1 then
						v4476 = color3185
					end

					local v4477 = uDim2New(0, p1228.AbsoluteSize.Y * 50, 0, p1228.AbsoluteSize.X * 50)
					local v4478 = uDim2New(0.5, 0, 0.5, 0)
					local v4479 = effectsServiceNewerCircle(p1227, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Image = "rbxassetid://126300995880097",
						ZIndex = -9000 - i,
						ImageColor3 = color3185,
						Size = v4477,
						Position = v4478
					})
					local animationAnimateAsync = animation.AnimateAsync
					local v4481 = uDim2New(0, 0, 0, 0)

					animationAnimateAsync(v4479, { Rotation = 360, Size = v4481, ImageColor3 = v4476 }, 2, "Out", "Sine")
					task.wait(4)
					v4479:Destroy()
				end)
				task.wait(0.4)
			end
		end)
		task.wait(6.1)
		animation.AnimateAsync(v4022, { BackgroundTransparency = 0 }, 0, "Out", "Sine")

		local animationAnimateAsync = animation.AnimateAsync
		local color3188 = Color3.fromRGB(0, 30, 100)

		animationAnimateAsync(v4019, { BackgroundColor3 = color3188 }, 0, "Out", "Sine")
		task.wait(0.2)
		animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 3, "Out", "Sine")
		animation.AnimateAsync(v4022, { BackgroundTransparency = 1 }, 0, "Out", "Sine")
		task.spawn(function()
			v3105(5)
			task.wait(1.2)
			v3105(10)
			task.wait(2)
			v3105(5)
			task.wait(1.2)
			v3105(10)
			task.wait(2)
			v3105(5)
			task.wait(1.2)
			v3105(10)
			task.wait(2)
			v3105(5)
			task.wait(1.2)
			v3105(10)
			task.wait(2)
		end)
		task.spawn(function()
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 0.3, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3186 }, 0, "Out", "Sine")
			task.wait(0.1)
			animation.AnimateAsync(v4019, { BackgroundColor3 = color3185 }, 1.9, "Out", "Sine")
			task.wait(1.9)
		end)
		task.wait(24.7)
	end)
end
function module.ParagonTrigger(p1232, p1233, _, _)
	task.spawn(function()
		local n1 = p1233.ZIndex + 1
		local image = p1233.Image
		local uDim2 = UDim2.new(0, p1233.AbsoluteSize.X, 0, p1233.AbsoluteSize.Y)
		local color3189 = Color3.fromRGB(255, 0, 0)
		local v4029 = UDim2.fromOffset(p1233.AbsolutePosition.X + p1233.AbsoluteSize.X / 2, p1233.AbsolutePosition.Y + p1233.AbsoluteSize.Y / 2)
		local v4030 = effectsServiceNewerCircle(p1232, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			ZIndex = n1,
			Image = image,
			Size = uDim2,
			ImageColor3 = color3189,
			Position = v4029
		})
		local color3190 = Color3.fromRGB(200, 0, 0)
		local v4032 = uDim2New(1, 0, 2, 0)
		local v4033 = uDim2New(0.5, 0, 0.5, 0)
		local v4034 = effectsServiceNewerCircle(p1232, {
			BackgroundTransparency = 0.5,
			ImageTransparency = 1,
			ZIndex = -10000,
			BackgroundColor3 = color3190,
			Size = v4032,
			Position = v4033
		})

		audioServicePlaySound("FireballImpact")
		animation.AnimateAsync(v4034, { BackgroundTransparency = 1 }, 2, "In", "Quad")

		local animationAnimate = animation.Animate
		local uDim2182 = UDim2.new(0, p1233.AbsoluteSize.X * 1.4, 0, p1233.AbsoluteSize.Y * 1.4)

		animationAnimate(v4030, { ImageTransparency = 1, Size = uDim2182 }, 2, "Out", "Quart")
		task.wait(2)
		v4034:Destroy()
		v4030:Destroy()
	end)
	effectsService.ShakeSync(p1233, p1233.Position, 0.2, 0.2)
	task.wait(0.4)
end
function module.DeidreSound1(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("EntranceOfGreat", { Volume = 2 })
		task.wait(3.5)
		audioServicePlaySound("Shine", { Volume = 2 })
		task.wait(0.8)
		audioServicePlaySound("Servo2", { Volume = 2 })
		task.wait(2)
		audioServicePlaySound("Shine", { Volume = 2 })
	end)
end
function module.DeidreSound2(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("CannonsFiring", { Volume = 1 })
	end)
end
function module.DeidreSound3(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("BeamFire", { Volume = 1 })
	end)
end
function module.DeidreSound4(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("BeamStage1Start", { Volume = 1 })
	end)
end
function module.DeidreSound5(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("BeamFire", { Volume = 1 })
	end)
end
function module.DeidreSound6(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("Parry", { Volume = 1 })
		audioServicePlaySound("Explosion", { Volume = 1 })
	end)
end
function module.DeidreSound7(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("Servo", { Volume = 1 })
		task.wait(1)
		audioServicePlaySound("Shine Charge", { Volume = 1 })
	end)
end
function module.NyarlSound1(_, _, _, _)
	task.spawn(function()
		task.wait(0.5)
		audioServicePlaySound("NyarlAppear", { Volume = 2 })
		task.wait(6.9)
		audioServicePlaySound("NyarlSwordManifest", { Volume = 2 })
		task.wait(2)
		audioServicePlaySound("NyarlSwordDraw", { Volume = 2 })
		task.wait(1.3)
		audioServicePlaySound("NyarlSwordSlash", { Volume = 2 })
	end)
end
function module.NyarlSound1Fast(_, _, _, _)
	task.spawn(function()
		task.wait(0.5)
		audioServicePlaySound("NyarlAppear", { Volume = 2 })
		task.wait(2)
		audioServicePlaySound("NyarlSwordManifest", { Volume = 2 })
		task.wait(2)
		audioServicePlaySound("NyarlSwordDraw", { Volume = 2 })
		task.wait(1.3)
		audioServicePlaySound("NyarlSwordSlash", { Volume = 2 })
	end)
end
function module.NyarlSound2(_, _, _, _)
	task.spawn(function()
		task.wait(0.5)
		audioServicePlaySound("NyarlAppear", { Volume = 1, PlaybackSpeed = 0.1 })
		audioServicePlaySound("AbsorbAmbience1", { Volume = 1, PlaybackSpeed = 0.1 })
		task.wait(3)
		audioServicePlaySound("NyarlMagicStatus", { Volume = 0.5, PlaybackSpeed = 0.3 })
		task.wait(7.5)
		audioService.StopSound("AbsorbAmbience1")
		task.wait(1.3)
		audioServicePlaySound("NyarlRoar", { Volume = 0.4, PlaybackSpeed = 2 })
	end)
end
function module.NyarlSound3(p1276, _, _, _)
	task.spawn(function()
		local color3191 = Color3.fromRGB(0, 0, 0)
		local v4038 = uDim2New(1, 0, 2, 0)
		local v4039 = uDim2New(0.5, 0, 0.5, 0)
		local v4040 = effectsServiceNewerCircle(p1276, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10000,
			BackgroundColor3 = color3191,
			Size = v4038,
			Position = v4039
		})

		audioServiceDimSongs()
		audioServicePlaySound("AbsorbAmbience1", { Volume = 1, PlaybackSpeed = 0.1 })
		task.wait(6)
		audioService.StopSound("AbsorbAmbience1")
		animation.AnimateAsync(v4040, { BackgroundTransparency = 0 }, 0, "Out", "Quart")
		task.wait(1)
		animation.AnimateAsync(v4040, { BackgroundTransparency = 1 }, 2, "Out", "Quart")
		audioServicePlaySound("NyarlDeathBlast", { Volume = 0.4, PlaybackSpeed = 1 })
		task.wait(3)
		audioServiceUndimSongs()
		v4040:Destroy()
	end)
end
function module.NyarlSound4(_, _, _, _)
	task.spawn(function()
		audioServiceDimSongs()
		audioServicePlaySound("NyarlBreak1")
		task.wait(2)
		audioServicePlaySound("Glassbreak")
		task.wait(2)
		audioServicePlaySound("NyarlShatter")
	end)
end
function module.NyarlSpeech(p1284, _, p1286)
	local u3161: boolean = false
	local n1: number = 0
	local n2: number = 0
	local u3164: boolean = false
	local v3165 = Enum.Font.Arimo

	for i = 1, #p1286 do
		n1 += 1

		if p1286:sub(i, i) == ">" then
			n1 = 0
			n2 += 1
		elseif p1286:sub(i, i) == "<" then
			u3164 = true
			v3165 = Enum.Font.Bodoni
		elseif p1286:sub(i, i) == "-" then
			u3164 = false
			v3165 = Enum.Font.Arimo
			task.wait(0.4)
		else
			local v3167 = UDim2.fromScale(0.1, 0.1)
			local v3168 = UDim2.fromScale(n1 * 0.06 * 0.33, n2 * 0.5 * 0.2 + 0.25)
			local substring = p1286:sub(i, i)
			local color3192 = Color3.fromRGB(255, 255, 255)
			local v3171 = effectsServiceNewText(p1284, {
				BackgroundTransparency = 1,
				ZIndex = 10001,
				TextTransparency = 0,
				Size = v3167,
				Position = v3168,
				Text = substring,
				TextColor3 = color3192,
				Font = v3165
			})

			effectsService.ShakeSync(v3171, v3171.Position, 1, 0.01)
			task.wait(0.1)

			if u3164 == true then
				local animationAnimateAsync = animation.AnimateAsync
				local color3193 = Color3.fromRGB(178, 55, 255)

				animationAnimateAsync(v3171, { TextColor3 = color3193 }, 1, "Out", "Quart")
			else
				local animateAsync = animation.AnimateAsync
				local color3194 = Color3.fromRGB(255, 0, 255)

				animateAsync(v3171, { TextColor3 = color3194 }, 1, "Out", "Quart")
			end

			task.spawn(function()
				while not u3161 do
					task.wait(0.1)

					if math.random(1, 10) == 1 then
						effectsService.ShakeSync(v3171, v3171.Position, 0.1, 0.001)
					end
				end

				task.wait(1)
				animation.AnimateAsync(v3171, { TextTransparency = 1 }, 1, "Out", "Quart")
				task.wait(1)
				v3171:Destroy()
			end)

			if p1286:sub(i, i) ~= " " then
				if u3164 == false then
					audioServicePlaySound("GrandOverseerTalk")
					task.wait(0.1)
				else
					audioServicePlaySound("GrandOverseerAltTalk")
				end
			end
		end
	end

	u3161 = true
	task.wait(0.1)
end
function module.NyarlSlash1(p1287, _, p1289, _)
	task.spawn(function()
		local uDim2 = UDim2.new(0, p1289.AbsoluteSize.X * 2, 0, p1289.AbsoluteSize.X * 2)
		local v4042 = p1289
		local uDim2183 = UDim2.new(0, v4042.AbsolutePosition.X, 0, v4042.AbsolutePosition.Y)
		local uDim2184 = UDim2.new(0, v4042.AbsoluteSize.X * 0.5, 0, v4042.AbsoluteSize.Y * 0.5)
		local v4045 = effectsServiceNewerCircle(p1287, {
			Image = "rbxassetid://128645745818266",
			ZIndex = 10000,
			ImageTransparency = 1,
			Rotation = 40,
			Size = uDim2,
			Position = uDim2183 + uDim2184
		})
		local uDim2185 = UDim2.new(0, p1289.AbsoluteSize.X * 2, 0, p1289.AbsoluteSize.X * 2)
		local v4047 = p1289
		local uDim2186 = UDim2.new(0, v4047.AbsolutePosition.X, 0, v4047.AbsolutePosition.Y)
		local uDim2187 = UDim2.new(0, v4047.AbsoluteSize.X * 0.5, 0, v4047.AbsoluteSize.Y * 0.5)
		local v4050 = effectsServiceNewerCircle(p1287, {
			Image = "rbxassetid://128645745818266",
			ZIndex = 10000,
			ImageTransparency = 1,
			Size = uDim2185,
			Position = uDim2186 + uDim2187
		})

		audioServicePlaySound("NyarlSwordSlash")
		animation.AnimateAsync(v4045, { ImageTransparency = 0, Rotation = 0 }, 0.5, "Out", "Quint")
		task.wait(0.5)
		animation.AnimateAsync(v4050, { ImageTransparency = 0 }, 0, "Out", "Quint")
		task.wait(0.1)

		local animationAnimateAsync = animation.AnimateAsync
		local uDim2188 = UDim2.new(0, p1289.AbsoluteSize.X * 3, 0, p1289.AbsoluteSize.X * 3)

		animationAnimateAsync(v4050, { ImageTransparency = 1, Size = uDim2188 }, 0.5, "Out", "Quint")
		animation.AnimateAsync(v4045, { ImageTransparency = 1 }, 1, "Out", "Quint")
		effectsService.Shake(p1289, p1289.Position, 0.4, 0.3)
		task.wait(1)
		v4045:Destroy()
		v4050:Destroy()
	end)
	task.wait(0.6)
end
function module.NyarlSlash2(p1291, _, _, p1294)
	task.spawn(function()
		task.spawn(function()
			local v4345 = p1294
			local s1

			if v4345 == "" then
				s1 = "Enemy"
			elseif v4345 == "Enemy" then
				s1 = ""
			else
				s1 = nil
			end

			local v4348 = p1291.Parent.BattleNew["Virtual" .. s1 .. "Field"]
			local v4349 = uDim2New(0, v4348.AbsoluteSize.X / 1.2, 0, v4348.AbsoluteSize.X / 1.2)
			local uDim2 = UDim2.new(0, v4348.AbsolutePosition.X, 0, v4348.AbsolutePosition.Y)
			local uDim2189 = UDim2.new(0, v4348.AbsoluteSize.X * 0.5, 0, v4348.AbsoluteSize.Y * 0.5)
			local v4352 = effectsServiceNewerCircle(p1291, {
				Image = "rbxassetid://95975283110061",
				ZIndex = 10000,
				ImageTransparency = 1,
				Rotation = 40,
				Size = v4349,
				Position = uDim2 + uDim2189
			})
			local v4353 = uDim2New(0, v4348.AbsoluteSize.X / 1.2, 0, v4348.AbsoluteSize.X / 1.2)
			local uDim2190 = UDim2.new(0, v4348.AbsolutePosition.X, 0, v4348.AbsolutePosition.Y)
			local uDim2191 = UDim2.new(0, v4348.AbsoluteSize.X * 0.5, 0, v4348.AbsoluteSize.Y * 0.5)
			local v4356 = effectsServiceNewerCircle(p1291, {
				Image = "rbxassetid://95262478093871",
				ZIndex = 10001,
				ImageTransparency = 1,
				Rotation = 40,
				Size = v4353,
				Position = uDim2190 + uDim2191
			})

			animation.AnimateAsync(v4352, { ImageTransparency = 0 }, 0, "Out", "Quint")
			animation.AnimateAsync(v4356, { ImageTransparency = 0 }, 0, "Out", "Quint")
			effectsService.ShakeSync(v4352, v4352.Position, 1, 0.1)
			effectsService.ShakeSync(v4356, v4356.Position, 4, 0.1)
			task.wait(2)
			animation.AnimateAsync(v4352, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v4356, { ImageTransparency = 1 }, 1, "Out", "Quint")
		end)
		audioServiceDimSongs()
		audioServicePlaySound("DespairExplode", { Volume = 0.5 })
		audioServicePlaySound("NyarlSwordSlash")
		task.wait(1)
		audioServiceUndimSongs()
	end)
end
function module.NyarlSlash3(p1295, _, p1297, _)
	task.spawn(function()
		for _ = 1, 1 do
			task.spawn(function()
				local randomNumber = math.random(0, 360)
				local uDim2 = UDim2.new(0, p1297.AbsoluteSize.X, 0, p1297.AbsoluteSize.X)
				local v4359 = p1297
				local uDim2192 = UDim2.new(0, v4359.AbsolutePosition.X, 0, v4359.AbsolutePosition.Y)
				local uDim2193 = UDim2.new(0, v4359.AbsoluteSize.X * 0.5, 0, v4359.AbsoluteSize.Y * 0.5)
				local v4362 = effectsServiceNewerCircle(p1295, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2,
					Position = uDim2192 + uDim2193,
					Rotation = randomNumber
				})
				local uDim2194 = UDim2.new(0, p1297.AbsoluteSize.X * 2, 0, p1297.AbsoluteSize.X * 2)
				local v4364 = p1297
				local uDim2195 = UDim2.new(0, v4364.AbsolutePosition.X, 0, v4364.AbsolutePosition.Y)
				local uDim2196 = UDim2.new(0, v4364.AbsoluteSize.X * 0.5, 0, v4364.AbsoluteSize.Y * 0.5)
				local v4367 = effectsServiceNewerCircle(p1295, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2194,
					Position = uDim2195 + uDim2196,
					Rotation = randomNumber + 30
				})

				animation.AnimateAsync(v4362, { ImageTransparency = 0, Rotation = randomNumber + 30 }, 0.1, "Out", "Quint")
				task.wait(0.1)
				animation.AnimateAsync(v4367, { ImageTransparency = 0 }, 0, "Out", "Quint")
				task.wait(0.1)

				local animationAnimateAsync = animation.AnimateAsync
				local uDim2197 = UDim2.new(0, p1297.AbsoluteSize.X * 3, 0, p1297.AbsoluteSize.X * 3)

				animationAnimateAsync(v4367, { ImageTransparency = 1, Size = uDim2197 }, 0.5, "Out", "Quint")
				animation.AnimateAsync(v4362, { ImageTransparency = 1 }, 1, "Out", "Quint")
				effectsService.Shake(p1297, p1297.Position, 0.1, 0.05)
				task.wait(1)
				v4362:Destroy()
				v4367:Destroy()
			end)
			task.wait(0.2)
			audioServicePlaySound("NyarlSwordSlash", { PlaybackSpeed = 1.5 })
		end
	end)
end
function module.NyarlMagic1(_, _, p1301, _)
	task.spawn(function()
		audioServicePlaySound("NyarlMagicBlast")
		effectsService.Shake(p1301, p1301.Position, 0.4, 0.3)
	end)
end
function module.NyarlMagicStatus(p1303, p1304, p1305, _)
	task.spawn(function()
		audioServicePlaySound("NyarlMagicStatus")

		local n1 = p1304.ZIndex - 1
		local uDim2 = UDim2.new(0, p1305.AbsoluteSize.X * 0.1, 0, p1305.AbsoluteSize.X * 0.1)
		local uDim2198 = UDim2.new(0, p1305.AbsolutePosition.X + p1305.AbsoluteSize.X / 2, 0, p1305.AbsolutePosition.Y + p1305.AbsoluteSize.Y / 2)
		local v4057 = effectsServiceNewerCircle(p1303, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim2198
		})
		local n2 = p1305.ZIndex - 1
		local uDim2199 = UDim2.new(0, p1305.AbsoluteSize.X * 0.1, 0, p1305.AbsoluteSize.X * 0.1)
		local uDim2200 = UDim2.new(0, p1305.AbsolutePosition.X + p1305.AbsoluteSize.X / 2, 0, p1305.AbsolutePosition.Y + p1305.AbsoluteSize.Y / 2)
		local v4061 = effectsServiceNewerCircle(p1303, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n2,
			Size = uDim2199,
			Position = uDim2200
		})
		local n3 = p1305.ZIndex - 1
		local uDim2201 = UDim2.new(0, p1305.AbsoluteSize.X * 0.1, 0, p1305.AbsoluteSize.X * 0.1)
		local uDim2202 = UDim2.new(0, p1305.AbsolutePosition.X + p1305.AbsoluteSize.X / 2, 0, p1305.AbsolutePosition.Y + p1305.AbsoluteSize.Y / 2)
		local v4065 = effectsServiceNewerCircle(p1303, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n3,
			Size = uDim2201,
			Position = uDim2202
		})

		effectsServiceWaitX(0.1)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2203 = UDim2.new(0, p1305.AbsoluteSize.X * 20, 0, p1305.AbsoluteSize.X * 20)

			animationAnimate(v4057, { Size = uDim2203 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4057, "ImageTransparency", 0, 1, 0.3)
				v4057:Destroy()
			end)
		end)
		task.wait(0.2)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2204 = UDim2.new(0, p1305.AbsoluteSize.X * 20, 0, p1305.AbsoluteSize.X * 20)

			animationAnimate(v4061, { Size = uDim2204 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4061, "ImageTransparency", 0, 1, 0.3)
				v4061:Destroy()
			end)
		end)
		task.wait(0.2)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2205 = UDim2.new(0, p1305.AbsoluteSize.X * 20, 0, p1305.AbsoluteSize.X * 20)

			animationAnimate(v4065, { Size = uDim2205 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4065, "ImageTransparency", 0, 1, 0.3)
				v4065:Destroy()
			end)
		end)
		wait(0.1)
	end)
end
function module.NyarlMagicStatusEvil(p1307, p1308, p1309, _)
	task.spawn(function()
		audioServicePlaySound("NyarlMagicStatusEvil")

		local n1 = p1308.ZIndex - 1
		local color3195 = Color3.fromRGB(0, 0, 255)
		local uDim2 = UDim2.new(0, p1309.AbsoluteSize.X * 0.1, 0, p1309.AbsoluteSize.X * 0.1)
		local uDim2206 = UDim2.new(0, p1309.AbsolutePosition.X + p1309.AbsoluteSize.X / 2, 0, p1309.AbsolutePosition.Y + p1309.AbsoluteSize.Y / 2)
		local v4070 = effectsServiceNewerCircle(p1307, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n1,
			ImageColor3 = color3195,
			Size = uDim2,
			Position = uDim2206
		})
		local n2 = p1309.ZIndex - 1
		local color3196 = Color3.fromRGB(0, 0, 255)
		local uDim2207 = UDim2.new(0, p1309.AbsoluteSize.X * 0.1, 0, p1309.AbsoluteSize.X * 0.1)
		local uDim2208 = UDim2.new(0, p1309.AbsolutePosition.X + p1309.AbsoluteSize.X / 2, 0, p1309.AbsolutePosition.Y + p1309.AbsoluteSize.Y / 2)
		local v4075 = effectsServiceNewerCircle(p1307, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n2,
			ImageColor3 = color3196,
			Size = uDim2207,
			Position = uDim2208
		})
		local n3 = p1309.ZIndex - 1
		local color3197 = Color3.fromRGB(0, 0, 255)
		local uDim2209 = UDim2.new(0, p1309.AbsoluteSize.X * 0.1, 0, p1309.AbsoluteSize.X * 0.1)
		local uDim2210 = UDim2.new(0, p1309.AbsolutePosition.X + p1309.AbsoluteSize.X / 2, 0, p1309.AbsolutePosition.Y + p1309.AbsoluteSize.Y / 2)
		local v4080 = effectsServiceNewerCircle(p1307, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n3,
			ImageColor3 = color3197,
			Size = uDim2209,
			Position = uDim2210
		})

		effectsServiceWaitX(0.1)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2211 = UDim2.new(0, p1309.AbsoluteSize.X * 20, 0, p1309.AbsoluteSize.X * 20)

			animationAnimate(v4070, { Size = uDim2211 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4070, "ImageTransparency", 0, 1, 0.3)
				v4070:Destroy()
			end)
		end)
		task.wait(0.2)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2212 = UDim2.new(0, p1309.AbsoluteSize.X * 20, 0, p1309.AbsoluteSize.X * 20)

			animationAnimate(v4075, { Size = uDim2212 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4075, "ImageTransparency", 0, 1, 0.3)
				v4075:Destroy()
			end)
		end)
		task.wait(0.2)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2213 = UDim2.new(0, p1309.AbsoluteSize.X * 20, 0, p1309.AbsoluteSize.X * 20)

			animationAnimate(v4080, { Size = uDim2213 }, 1.5, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4080, "ImageTransparency", 0, 1, 0.3)
				v4080:Destroy()
			end)
		end)
		wait(0.1)
	end)
end
function module.NyarlSlash4(p1311, _, p1313, _)
	task.spawn(function()
		for _ = 1, 3 do
			task.spawn(function()
				local randomNumber = math.random(0, 360)
				local uDim2 = UDim2.new(0, p1313.AbsoluteSize.X, 0, p1313.AbsoluteSize.X)
				local v4384 = p1313
				local uDim2214 = UDim2.new(0, v4384.AbsolutePosition.X, 0, v4384.AbsolutePosition.Y)
				local uDim2215 = UDim2.new(0, v4384.AbsoluteSize.X * 0.5, 0, v4384.AbsoluteSize.Y * 0.5)
				local v4387 = effectsServiceNewerCircle(p1311, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2,
					Position = uDim2214 + uDim2215,
					Rotation = randomNumber
				})
				local uDim2216 = UDim2.new(0, p1313.AbsoluteSize.X * 2, 0, p1313.AbsoluteSize.X * 2)
				local v4389 = p1313
				local uDim2217 = UDim2.new(0, v4389.AbsolutePosition.X, 0, v4389.AbsolutePosition.Y)
				local uDim2218 = UDim2.new(0, v4389.AbsoluteSize.X * 0.5, 0, v4389.AbsoluteSize.Y * 0.5)
				local v4392 = effectsServiceNewerCircle(p1311, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2216,
					Position = uDim2217 + uDim2218,
					Rotation = randomNumber + 30
				})

				animation.AnimateAsync(v4387, { ImageTransparency = 0, Rotation = randomNumber + 30 }, 0.1, "Out", "Quint")
				task.wait(0.1)
				animation.AnimateAsync(v4392, { ImageTransparency = 0 }, 0, "Out", "Quint")
				task.wait(0.1)

				local animationAnimateAsync = animation.AnimateAsync
				local uDim2219 = UDim2.new(0, p1313.AbsoluteSize.X * 3, 0, p1313.AbsoluteSize.X * 3)

				animationAnimateAsync(v4392, { ImageTransparency = 1, Size = uDim2219 }, 0.5, "Out", "Quint")
				animation.AnimateAsync(v4387, { ImageTransparency = 1 }, 1, "Out", "Quint")
				effectsService.Shake(p1313, p1313.Position, 0.1, 0.05)
				task.wait(1)
				v4387:Destroy()
				v4392:Destroy()
			end)
			task.spawn(function()
				local randomNumber = math.random(0, 360)
				local uDim2 = UDim2.new(0, p1313.AbsoluteSize.X, 0, p1313.AbsoluteSize.X)
				local v4397 = p1313
				local uDim2220 = UDim2.new(0, v4397.AbsolutePosition.X, 0, v4397.AbsolutePosition.Y)
				local uDim2221 = UDim2.new(0, v4397.AbsoluteSize.X * 0.5, 0, v4397.AbsoluteSize.Y * 0.5)
				local v4400 = effectsServiceNewerCircle(p1311, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2,
					Position = uDim2220 + uDim2221,
					Rotation = randomNumber
				})
				local uDim2222 = UDim2.new(0, p1313.AbsoluteSize.X * 2, 0, p1313.AbsoluteSize.X * 2)
				local v4402 = p1313
				local uDim2223 = UDim2.new(0, v4402.AbsolutePosition.X, 0, v4402.AbsolutePosition.Y)
				local uDim2224 = UDim2.new(0, v4402.AbsoluteSize.X * 0.5, 0, v4402.AbsoluteSize.Y * 0.5)
				local v4405 = effectsServiceNewerCircle(p1311, {
					Image = "rbxassetid://128645745818266",
					ZIndex = 10000,
					ImageTransparency = 1,
					Size = uDim2222,
					Position = uDim2223 + uDim2224,
					Rotation = randomNumber + 30
				})

				animation.AnimateAsync(v4400, { ImageTransparency = 0, Rotation = randomNumber + 30 }, 0.1, "Out", "Quint")
				task.wait(0.1)
				animation.AnimateAsync(v4405, { ImageTransparency = 0 }, 0, "Out", "Quint")
				task.wait(0.1)

				local animationAnimateAsync = animation.AnimateAsync
				local uDim2225 = UDim2.new(0, p1313.AbsoluteSize.X * 3, 0, p1313.AbsoluteSize.X * 3)

				animationAnimateAsync(v4405, { ImageTransparency = 1, Size = uDim2225 }, 0.5, "Out", "Quint")
				animation.AnimateAsync(v4400, { ImageTransparency = 1 }, 1, "Out", "Quint")
				effectsService.Shake(p1313, p1313.Position, 0.1, 0.05)
				task.wait(1)
				v4400:Destroy()
				v4405:Destroy()
			end)
			task.wait(0.1)
			audioServicePlaySound("NyarlSwordSlash", { PlaybackSpeed = 2 })
		end
	end)
end
function module.NyarlSlash5(p1315, _, _, p1318)
	task.spawn(function()
		task.spawn(function()
			local v4408 = p1318
			local s1

			if v4408 == "" then
				s1 = ""
			elseif v4408 == "Enemy" then
				s1 = "Enemy"
			else
				s1 = nil
			end

			local v4411 = p1315.Parent.BattleNew["Virtual" .. s1 .. "Field"]
			local v4412 = uDim2New(0, v4411.AbsoluteSize.X / 1.2, 0, v4411.AbsoluteSize.X / 1.2)
			local uDim2 = UDim2.new(0, v4411.AbsolutePosition.X, 0, v4411.AbsolutePosition.Y)
			local uDim2226 = UDim2.new(0, v4411.AbsoluteSize.X * 0.5, 0, v4411.AbsoluteSize.Y * 0.5)
			local v4415 = effectsServiceNewerCircle(p1315, {
				Image = "rbxassetid://95975283110061",
				ZIndex = 10000,
				ImageTransparency = 1,
				Rotation = 40,
				Size = v4412,
				Position = uDim2 + uDim2226
			})

			v4412 = uDim2New(0, v4411.AbsoluteSize.X / 1.2, 0, v4411.AbsoluteSize.X / 1.2)

			local uDim2227 = UDim2.new(0, v4411.AbsolutePosition.X, 0, v4411.AbsolutePosition.Y)
			local uDim2228 = UDim2.new(0, v4411.AbsoluteSize.X * 0.5, 0, v4411.AbsoluteSize.Y * 0.5)
			local v4418 = effectsServiceNewerCircle(p1315, {
				Image = "rbxassetid://95262478093871",
				ZIndex = 10001,
				ImageTransparency = 1,
				Rotation = 40,
				Size = v4412,
				Position = uDim2227 + uDim2228
			})

			animation.AnimateAsync(v4415, { ImageTransparency = 0 }, 0, "Out", "Quint")
			animation.AnimateAsync(v4418, { ImageTransparency = 0 }, 0, "Out", "Quint")
			effectsService.ShakeSync(v4415, v4415.Position, 1, 0.1)
			effectsService.ShakeSync(v4418, v4418.Position, 4, 0.1)
			task.wait(2)
			animation.AnimateAsync(v4415, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v4418, { ImageTransparency = 1 }, 1, "Out", "Quint")
		end)
		audioServiceDimSongs()
		audioServicePlaySound("DespairExplode", { Volume = 0.5 })
		audioServicePlaySound("NyarlSwordSlash")
		task.wait(1)
		audioServiceUndimSongs()
	end)
end
function module.NyarlMagic2(p1319, _, parent, _)
	local color3198 = Color3.fromRGB(0, 0, 255)
	local image = parent.Image
	local v3214 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y)
	local v3215 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)
	local v3216 = effectsServiceNewerCircle(p1319, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		ImageColor3 = color3198,
		Image = image,
		Size = v3214,
		Position = v3215,
		Parent = parent
	})
	local color3199 = Color3.fromRGB(0, 0, 255)
	local v3218 = uDim2New(0, v3216.AbsoluteSize.X, 0, v3216.AbsoluteSize.Y)
	local v3219 = UDim2.fromOffset(v3216.AbsoluteSize.X / 2, v3216.AbsoluteSize.Y / 2)
	local v3220 = effectsServiceNewerCircle(p1319, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.8,
		ZIndex = 10001,
		Image = "rbxassetid://71017541938581",
		Rotation = 0,
		ImageColor3 = color3199,
		Size = v3218,
		Position = v3219,
		Parent = parent
	})

	task.spawn(function()
		effectsServiceSpritesheet(v3220, Vector2.new(128, 128), { 6, 5 }, 1, 6, 24, nil, true)
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v3222 = uDim2New(0, parent.AbsoluteSize.X * 2, 0, parent.AbsoluteSize.Y * 2)

	animationAnimateAsync(v3216, { ImageTransparency = 1, Size = v3222 }, 1, "Out", "Quint")

	local animateAsync = animation.AnimateAsync

	v3222 = uDim2New(0, v3216.AbsoluteSize.X * 2, 0, v3216.AbsoluteSize.Y * 2)
	animateAsync(v3220, { ImageTransparency = 1, Size = v3222 }, 1, "Out", "Quint")
	audioServicePlaySound("NyarlMagicBlast")
	effectsService.ShakeSync(parent, parent.Position, 0.45, 0.1)
end
function module.NyarlMagic3(p1323, _, p1325, _)
	p1325.Visible = false
	task.spawn(function()
		local image = p1325.Image
		local v4083 = uDim2New(0, p1325.AbsoluteSize.X, 0, p1325.AbsoluteSize.Y)
		local v4084 = p1325
		local uDim2 = UDim2.new(0, v4084.AbsolutePosition.X, 0, v4084.AbsolutePosition.Y)
		local uDim2229 = UDim2.new(0, v4084.AbsoluteSize.X * 0.5, 0, v4084.AbsoluteSize.Y * 0.5)
		local parent = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			Image = image,
			Size = v4083,
			Position = uDim2 + uDim2229
		})
		local v4088 = p1325.Image

		v4084 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y / 3)

		local v4089 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 6)
		local v4090 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			ClipsDescendants = true,
			Image = v4088,
			Size = v4084,
			Position = v4089,
			Parent = parent
		})
		local parentImage = parent.Image
		local v4092 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y)
		local color3200 = Color3.fromRGB(255, 255, 255)
		local v4094 = UDim2.fromScale(0.5, 1.5)
		local v4095 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 10001,
			Image = parentImage,
			Size = v4092,
			ImageColor3 = color3200,
			Position = v4094,
			Parent = v4090
		})
		local v4096 = p1325.Image
		local v4097 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y / 3)
		local v4098 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 2)

		v4083 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			ClipsDescendants = true,
			Image = v4096,
			Size = v4097,
			Position = v4098,
			Parent = parent
		})

		local v4099 = p1325.Image
		local v4100 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y)
		local v4101 = UDim2.fromScale(0.5, 0.5)

		v4089 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 10001,
			Image = v4099,
			Size = v4100,
			Position = v4101,
			Parent = v4083
		})

		local v4102 = p1325.Image
		local v4103 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y / 3)
		local v4104 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 1.2)

		v4083 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			ClipsDescendants = true,
			Image = v4102,
			Size = v4103,
			Position = v4104,
			Parent = parent
		})

		local v4105 = p1325.Image

		v4104 = uDim2New(0, parent.AbsoluteSize.X, 0, parent.AbsoluteSize.Y)
		v4103 = UDim2.fromScale(0.5, -0.5)
		v4094 = effectsServiceNewerCircle(p1323, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 10001,
			Image = v4105,
			Size = v4104,
			Position = v4103,
			Parent = v4083
		})
		audioServicePlaySound("Twinkle", { PlaybackSpeed = 2 })

		local animationAnimateAsync = animation.AnimateAsync
		local color3201 = Color3.fromRGB(0, 0, 255)

		animationAnimateAsync(v4095, { ImageColor3 = color3201 }, 1, "In", "Quad")

		local animateAsync = animation.AnimateAsync
		local color3202 = Color3.fromRGB(0, 0, 255)

		animateAsync(v4089, { ImageColor3 = color3202 }, 1, "In", "Quad")

		local v4110 = animation.AnimateAsync
		local color3203 = Color3.fromRGB(0, 0, 255)

		v4110(v4094, { ImageColor3 = color3203 }, 1, "In", "Quad")

		local v4112 = animation.AnimateAsync
		local v4113 = UDim2.fromOffset(parent.AbsoluteSize.X / 0.9, parent.AbsoluteSize.Y / 12)

		v4112(v4090, { Position = v4113 }, 1, "In", "Quad")

		local v4114 = animation.AnimateAsync

		v4113 = UDim2.fromOffset(parent.AbsoluteSize.X / 6, parent.AbsoluteSize.Y / 1.1)
		v4114(v4083, { Position = v4113 }, 1, "In", "Quad")
		effectsService.ShakeSync(parent, parent.Position, 0.45, 0.1)
		task.wait(1)

		local v4115 = animation.AnimateAsync

		v4113 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 6)
		v4115(v4090, { Position = v4113 }, 0.4, "In", "Back")

		local v4116 = animation.AnimateAsync

		v4113 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.Y / 1.2)
		v4116(v4083, { Position = v4113 }, 0.4, "In", "Back")
		task.wait(0.4)

		local v4117 = animation.AnimateAsync
		local color3204 = Color3.fromRGB(255, 255, 255)

		v4117(v4095, { ImageColor3 = color3204 }, 1, "In", "Quad")

		local v4119 = animation.AnimateAsync
		local color3205 = Color3.fromRGB(255, 255, 255)

		v4119(v4089, { ImageColor3 = color3205 }, 1, "In", "Quad")

		local v4121 = animation.AnimateAsync
		local color3206 = Color3.fromRGB(255, 255, 255)

		v4121(v4094, { ImageColor3 = color3206 }, 1, "In", "Quad")
		effectsService.ShakeSync(parent, parent.Position, 1, 1)
		audioServicePlaySound("Injure")
		p1325.Visible = true
		parent:Destroy()
	end)
end
function module.NyarlMagic4(p1327, p1328, p1329, _)
	task.spawn(function()
		task.wait(1.75)
		audioServicePlaySound("LargeMagicEvil")

		local n1 = p1328.ZIndex - 1
		local color3207 = Color3.fromRGB(0, 0, 255)
		local uDim2 = UDim2.new(0, p1329.AbsoluteSize.X * 0.1, 0, p1329.AbsoluteSize.X * 0.1)
		local uDim2230 = UDim2.new(0, p1329.AbsolutePosition.X + p1329.AbsoluteSize.X / 2, 0, p1329.AbsolutePosition.Y + p1329.AbsoluteSize.Y / 2)
		local v4127 = effectsServiceNewerCircle(p1327, {
			Image = "rbxassetid://1057939773",
			ImageTransparency = 0.5,
			ZIndex = n1,
			ImageColor3 = color3207,
			Size = uDim2,
			Position = uDim2230
		})

		effectsServiceWaitX(0.1)
		task.spawn(function()
			local animationAnimate = animation.Animate
			local uDim2231 = UDim2.new(0, p1329.AbsoluteSize.X * 20, 0, p1329.AbsoluteSize.X * 20)

			animationAnimate(v4127, { Size = uDim2231 }, 2, "Out", "Quad")
			spawn(function()
				wait(0.1)
				effectsService.TweenProperty(v4127, "ImageTransparency", 0, 1, 0.3)
				v4127:Destroy()
			end)
		end)
		task.wait(0.2)
		wait(0.1)
	end)
end
function module.DespairInject(p1331, _, p1333, _)
	local t107: {[any]: any} = { Color3.fromRGB(22, 22, 30), Color3.fromRGB(40, 68, 248) }
	local v3237 = UDim2.fromOffset(p1333.AbsoluteSize.X / 8, p1333.AbsoluteSize.X / 8)

	audioServicePlaySound("wet")
	effectsServiceBreath(p1331, p1333, p1333, {
		Projectile = "rbxassetid://511406127",
		Strength = 100,
		Time = 0.25,
		Speed = 0.35,
		Lifetime = 0.8,
		Transparency = 0.45,
		EasingStyle = "Quint",
		Color = t107,
		Size = v3237
	})
	effectsService.Shake(p1333, p1333.Position, 0.3, 0.1)

	if not p1333:FindFirstChild("Zombified") then
		task.wait(0.4)
		audioServicePlaySound("recreation")
		effectsService.ShakeSync(p1333, p1333.Position, 0.5, 0.15)
	end
end
function module.DespairForm(p1335, _, p1337, _)
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t137: {[any]: any} = { Color3.fromRGB(9, 9, 9), Color3.fromRGB(14, 2, 53) }
		local uDim2 = UDim2.new(0, p1337.AbsoluteSize.X * 5, 0, p1337.AbsoluteSize.X * 5)

		effectsServiceBreath(p1335, p1337, p1337, {
			Strength = 40,
			Time = 1,
			Projectile = effectsServiceBreathimagesFire,
			Color = t137,
			Size = uDim2
		})
		task.wait(1)

		local v4131 = effectsServiceBreathimages.fire
		t137 = { Color3.fromRGB(9, 9, 9), Color3.fromRGB(14, 2, 53) }
		local uDim2232 = UDim2.new(0, p1337.AbsoluteSize.X * 15, 0, p1337.AbsoluteSize.X * 15)

		effectsServiceBreath(p1335, p1337, p1337, {
			Strength = 40,
			Time = 4,
			Projectile = v4131,
			Color = t137,
			Size = uDim2232
		})
	end)
	audioServicePlaySound("DespairExplode")
	effectsService.ShakeBattleSync(p1335, 4, 0.04)
	task.wait(1)
	audioServicePlaySound("DespairtepYell1")
	effectsService.ShakeSync(p1337, p1337.Position, 0.5, 0.15)
	task.wait(3)
end
function module.WinonaBeam(parent, _, p1341, _)
	local move = game.Players.LocalPlayer.PlayerGui:FindFirstChild("DodgeModeUI"):FindFirstChild("Move")

	audioServicePlaySound("Winona Beam")

	for _ = 1, 50 do
		local color3FromRGB = Color3.fromRGB
		local randomNumber = math.random(0, 255)
		local randomNumber67 = math.random(0, 255)
		local color3 = color3FromRGB(randomNumber, randomNumber67, math.random(0, 255))
		local vector3 = Vector3.new(move.AbsolutePosition.X + move.AbsoluteSize.X / 2, move.AbsolutePosition.Y + move.AbsoluteSize.Y / 2.5, 0)
		local n1 = p1341.AbsolutePosition.X + p1341.AbsoluteSize.X / 2
		local randomNumber68 = math.random(-p1341.AbsoluteSize.X / 8, p1341.AbsoluteSize.X / 8)
		local n2 = p1341.AbsolutePosition.Y + p1341.AbsoluteSize.Y / 2.5
		local randomNumber69 = math.random(-p1341.AbsoluteSize.Y / 8, p1341.AbsoluteSize.Y / 8)
		local vector37 = Vector3.new(n1 + randomNumber68, n2 + randomNumber69, 0)
		local color3208 = Color3.fromRGB(255, 255, 255)
		local v3259 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000000,
			ImageColor3 = color3208
		})
		local v3260 = UDim2.fromOffset(move.AbsoluteSize.Y * 0.6, move.AbsoluteSize.Y * 0.6)
		local uDim2 = UDim2.new(0, move.AbsolutePosition.X + move.AbsoluteSize.X / 2, 0, move.AbsolutePosition.Y + move.AbsoluteSize.Y / 2.5)
		local v3262 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.8,
			Image = "rbxassetid://511406127",
			ZIndex = 1000001,
			ImageColor3 = color3,
			Size = v3260,
			Position = uDim2
		})
		local animationAnimateAsync = animation.AnimateAsync
		local v3264 = UDim2.fromOffset(0, 0)
		local color3209 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v3262, { ImageTransparency = 1, Size = v3264, ImageColor3 = color3209 }, 0.6, "Out", "Quart")

		local magnitude = (vector37 - vector3).Magnitude
		local v3267 = math.atan2(vector3.Y - vector37.Y, vector3.X - vector37.X)

		v3259.Size = UDim2.new(0, magnitude, 0, p1341.AbsoluteSize.X / 2 * 0.6)
		v3264 = CFrame.new(vector3, vector37).Position

		local cFrame = CFrame.new(vector3, vector37)

		v3260 = v3264 + cFrame.lookVector * magnitude / 2
		v3259.Position = UDim2.new(0, v3260.X, 0, v3260.Y)
		v3259.Rotation = math.deg(v3267)

		local clone = v3259:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p1341.AbsoluteSize.X / 1.5 * 0.6)
		clone.Parent = parent
		clone.ImageColor3 = color3
		clone.ZIndex = v3259.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v3271 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v3271 }, 0.6, "Out", "Quart")

		local v3272 = animation.AnimateAsync

		v3271 = UDim2.fromOffset(magnitude, 0)
		v3272(v3259, { Size = v3271 }, 0.6, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.54)
			v3262:Destroy()
			v3259:Destroy()
			clone:Destroy()
		end)
	end
end
function module.TranscendentHurt(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("TranscendentDamaged")

		if math.random(1, 2) == 1 then
			task.wait(0.4)
			audioServicePlaySound("TranscendentHurt")
		end
	end)
end
function module.TranscendentDeath(p1347, _, _, _)
	task.spawn(function()
		local color3210 = Color3.fromRGB(255, 255, 255)
		local v4134 = uDim2New(1, 0, 2, 0)
		local v4135 = uDim2New(0.5, 0, 0.5, 0)
		local v4136 = effectsServiceNewerCircle(p1347, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10000,
			BackgroundColor3 = color3210,
			Size = v4134,
			Position = v4135
		})

		audioServiceDimSongs()
		audioServicePlaySound("TranscendentDamaged", { Volume = 2, PlaybackSpeed = 0.5 })
		task.wait(5)
		audioServicePlaySound("TranscendentHurt", { Volume = 2, PlaybackSpeed = 0.5 })
		audioServicePlaySound("TranscendentRoar", { Volume = 0.5, PlaybackSpeed = 0.1 })
		task.wait(5)
		audioServicePlaySound("TranscendentRoar", { Volume = 2, PlaybackSpeed = 0.2 })
		task.wait(10)
		audioService:StopSound("TranscendentRoar")
		audioServicePlaySound("TranscendentRoar", { Volume = 2, PlaybackSpeed = 0.5 })
		audioServicePlaySound("NyarlDeathBlast", { Volume = 0.4, PlaybackSpeed = 1 })
		animation.AnimateAsync(v4136, { BackgroundTransparency = 0 }, 0, "Out", "Quart")
		task.wait(1)
		animation.AnimateAsync(v4136, { BackgroundTransparency = 1 }, 3, "Out", "Quart")
		task.wait(3)
		v4136:Destroy()
		audioServiceUndimSongs()
	end)
end
function module.TranscendentTeleportOut(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("TranscendentTeleport")
		task.wait(0.4)
		audioServicePlaySound("TranscendentTeleportWoosh")
	end)
end
function module.TranscendentTeleportIn(_, _, _, _)
	task.spawn(function()
		audioServicePlaySound("TranscendentTeleportWoosh")
		task.wait(0.4)
		audioServicePlaySound("TranscendentTeleportReturn")
	end)
end
function module.TranscendentIntro(p1359, _, _, _)
	local bossPosition = p1359.Parent.BattleNew.Virtual3DEnemyPositions.BossPosition
	local color3211 = Color3.fromRGB(26, 26, 26)
	local v3295 = uDim2New(0, bossPosition.AbsoluteSize.X, 0, bossPosition.AbsoluteSize.Y)
	local v3296 = UDim2.fromOffset(bossPosition.AbsolutePosition.X + bossPosition.AbsoluteSize.X / 2, bossPosition.AbsolutePosition.Y + bossPosition.AbsoluteSize.Y / 2)
	local v3297 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100002,
		Image = "rbxassetid://116104742636685",
		ImageColor3 = color3211,
		Size = v3295,
		Position = v3296
	})
	local color3212 = Color3.fromRGB(255, 255, 255)
	local v3299 = uDim2New(0, bossPosition.AbsoluteSize.X, 0, bossPosition.AbsoluteSize.Y)
	local v3300 = UDim2.fromOffset(bossPosition.AbsolutePosition.X + bossPosition.AbsoluteSize.X / 2, bossPosition.AbsolutePosition.Y + bossPosition.AbsoluteSize.Y / 2)
	local v3301 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100003,
		Image = "rbxassetid://87336022407472",
		ImageColor3 = color3212,
		Size = v3299,
		Position = v3300
	})
	local color3213 = Color3.fromRGB(255, 255, 255)
	local v3303 = uDim2New(0, bossPosition.AbsoluteSize.X, 0, bossPosition.AbsoluteSize.Y)
	local v3304 = UDim2.fromOffset(bossPosition.AbsolutePosition.X + bossPosition.AbsoluteSize.X / 2, bossPosition.AbsolutePosition.Y + bossPosition.AbsoluteSize.Y / 2)
	local v3305 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100003,
		Image = "rbxassetid://18758031029",
		ImageColor3 = color3213,
		Size = v3303,
		Position = v3304
	})
	local color3214 = Color3.fromRGB(255, 255, 255)
	local v3307 = uDim2New(1, 0, 2, 0)
	local v3308 = uDim2New(0.5, 0, 0.5, 0)
	local v3309 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		ZIndex = 100001,
		BackgroundColor3 = color3214,
		Size = v3307,
		Position = v3308
	})
	local color3215 = Color3.fromRGB(0, 0, 0)
	local v3311 = uDim2New(0.35, 0, 0.5, 0)

	v3300 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 1,
		BackgroundColor3 = color3215,
		Size = v3311,
		Position = bossPosition and UDim2.new(0, bossPosition.AbsolutePosition.X, 0, bossPosition.AbsolutePosition.Y) + UDim2.new(0, bossPosition.AbsoluteSize.X * 0.5, 0, bossPosition.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
	})
	task.wait(1)
	animation.AnimateAsync(v3297, { ImageTransparency = 0 }, 0.8, "Out", "Quint")
	task.wait(2)
	task.spawn(function()
		effectsService.ShakeSync(v3297, v3297.Position, 0.3, 0.1)
	end)
	audioServicePlaySound("GlassCrack1")
	animation.Animate(v3301, { ImageTransparency = 0 }, 0.2, "Out", "Quint")
	task.wait(0.6)
	animation.AnimateAsync(v3301, { ImageTransparency = 1 }, 0.1, "Out", "Quint")
	task.spawn(function()
		effectsService.ShakeSync(v3297, v3297.Position, 0.3, 0.2)
	end)
	audioServicePlaySound("GlassCrack2")
	animation.Animate(v3305, { ImageTransparency = 0 }, 0.2, "Out", "Quint")
	task.wait(1)
	animation.AnimateAsync(v3305, { ImageTransparency = 1 }, 0.1, "Out", "Quint")
	v3297.Visible = false
	audioServicePlaySound("Boom")
	v3305 = {
		{ Vector2.new(0, 0), UDim2.fromScale(0, 0) },
		{ Vector2.new(0.5, 0), UDim2.fromScale(0.5, 0) },
		{ Vector2.new(1, 0), UDim2.fromScale(1, 0) },
		{ Vector2.new(0, 0.5), UDim2.fromScale(0, 0.5) },
		{ Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5) },
		{ Vector2.new(1, 0.5), UDim2.fromScale(1, 0.5) },
		{ Vector2.new(0, 1), UDim2.fromScale(0, 1) },
		{ Vector2.new(0.5, 1), UDim2.fromScale(0.5, 1) },
		{ Vector2.new(1, 1), UDim2.fromScale(1, 1) },
		{ Vector2.new(0, 0.5), UDim2.fromScale(0, 0.5) },
		{ Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5) },
		{ Vector2.new(1, 0.5), UDim2.fromScale(1, 0.5) }
	}

	for i = 1, 12 do
		local randomNumber = math.random(8, 10)
		local color3216 = Color3.fromRGB(0, 0, 0)
		local v3315 = UDim2.fromOffset(v3300.AbsoluteSize.Y / randomNumber, v3300.AbsoluteSize.Y / randomNumber)
		local parent = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 110000,
			ClipsDescendants = true,
			BackgroundColor3 = color3216,
			Size = v3315,
			Position = bossPosition and UDim2.new(0, bossPosition.AbsolutePosition.X, 0, bossPosition.AbsolutePosition.Y) + UDim2.new(0, bossPosition.AbsoluteSize.X * 0.5, 0, bossPosition.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color3217 = Color3.fromRGB(26, 26, 26)
		local color3218 = Color3.fromRGB(26, 26, 26)
		local v3319 = UDim2.fromOffset(bossPosition.AbsoluteSize.X, bossPosition.AbsoluteSize.Y)
		local v3320 = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://116104742636685",
			ImageTransparency = 0,
			ZIndex = 110000,
			BackgroundColor3 = color3217,
			ImageColor3 = color3218,
			Size = v3319
		})

		v3320.Parent = parent
		v3320.AnchorPoint = v3305[i][1]
		v3320.Position = v3305[i][2]

		local v3321 = randomPosOnTarget(v3300)

		task.spawn(function()
			animation.Animate(parent, { Position = v3321 }, 1.5, "Out", "Quint")
			animation.Animate(v3320, { ImageTransparency = 1 }, 1, "Out", "Quint")
			parent:Destroy()
		end)
	end

	task.wait(2.5)

	local virtualBaseplate = p1359.Parent.BattleNew.VirtualBaseplate
	local color3219 = Color3.fromRGB(0, 0, 0)
	local v3324 = uDim2New(0, virtualBaseplate.AbsoluteSize.X, 0, virtualBaseplate.AbsoluteSize.Y)
	local v3325 = UDim2.fromOffset(virtualBaseplate.AbsolutePosition.X, virtualBaseplate.AbsolutePosition.Y)
	local v3326 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100002,
		Image = "rbxassetid://116104742636685",
		ImageColor3 = color3219,
		Size = v3324,
		Position = v3325
	})
	local virtualDeck = p1359.Parent.BattleNew.VirtualDeck
	local color3220 = Color3.fromRGB(0, 0, 0)
	local v3329 = uDim2New(0, virtualDeck.AbsoluteSize.X, 0, virtualDeck.AbsoluteSize.Y)
	local v3330 = UDim2.fromOffset(virtualDeck.AbsolutePosition.X, virtualDeck.AbsolutePosition.Y)
	local v3331 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100002,
		Image = "rbxassetid://116104742636685",
		ImageColor3 = color3220,
		Size = v3329,
		Position = v3330
	})
	local color3221 = Color3.fromRGB(255, 255, 255)
	local v3333 = uDim2New(0.15, 0, 0.3, 0)
	local v3334 = UDim2.fromOffset(virtualBaseplate.AbsolutePosition.X, virtualBaseplate.AbsolutePosition.Y - 200)
	local v3335 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100003,
		Image = "rbxassetid://107064310129687",
		ImageColor3 = color3221,
		Size = v3333,
		Position = v3334
	})
	local color3222 = Color3.fromRGB(255, 255, 255)
	local v3337 = uDim2New(0.15, 0, 0.3, 0)
	local v3338 = UDim2.fromOffset(virtualDeck.AbsolutePosition.X, virtualDeck.AbsolutePosition.Y - 200)
	local v3339 = effectsServiceNewerCircle(p1359, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100003,
		Image = "rbxassetid://107064310129687",
		ImageColor3 = color3222,
		Size = v3337,
		Position = v3338
	})

	animation.Animate(v3326, { ImageTransparency = 0 }, 1, "Out", "Quint")
	audioServicePlaySound("TranscendentTeleportWoosh")
	animation.Animate(v3335, { ImageTransparency = 0 }, 0.4, "Out", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local v3341 = UDim2.fromOffset(virtualBaseplate.AbsolutePosition.X, virtualBaseplate.AbsolutePosition.Y + 100)

	animationAnimateAsync(v3335, { Position = v3341 }, 0.4, "Out", "Quint")
	audioServicePlaySound("LargePunch")
	task.wait(0.2)
	audioServicePlaySound("Boom")
	v3326.Visible = false

	for i = 1, 12 do
		local randomNumber70 = math.random(8, 10)
		local color3223 = Color3.fromRGB(0, 0, 0)
		local v3345 = UDim2.fromOffset(v3300.AbsoluteSize.Y / randomNumber70, v3300.AbsoluteSize.Y / randomNumber70)
		local v3346 = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 110000,
			ClipsDescendants = true,
			BackgroundColor3 = color3223,
			Size = v3345,
			Position = v3326 and UDim2.new(0, v3326.AbsolutePosition.X, 0, v3326.AbsolutePosition.Y) + UDim2.new(0, v3326.AbsoluteSize.X * 0.5, 0, v3326.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color3224 = Color3.fromRGB(26, 26, 26)
		local color3225 = Color3.fromRGB(26, 26, 26)
		local v3349 = UDim2.fromOffset(v3326.AbsoluteSize.X, v3326.AbsoluteSize.Y)
		local v3350 = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://116104742636685",
			ImageTransparency = 0,
			ZIndex = 110000,
			BackgroundColor3 = color3224,
			ImageColor3 = color3225,
			Size = v3349
		})

		v3350.Parent = v3346
		v3350.AnchorPoint = v3305[i][1]
		v3350.Position = v3305[i][2]

		local v3351 = randomPosOnTarget(v3300)

		task.spawn(function()
			animation.Animate(v3346, { Position = v3351 }, 1.5, "Out", "Quint")
			animation.Animate(v3350, { ImageTransparency = 1 }, 1, "Out", "Quint")
			v3346:Destroy()
		end)
	end

	task.wait(0.2)
	animation.Animate(v3335, { ImageTransparency = 1 }, 0.4, "Out", "Quint")
	animation.Animate(v3331, { ImageTransparency = 0 }, 1, "Out", "Quint")
	audioServicePlaySound("TranscendentTeleportWoosh")
	animation.Animate(v3339, { ImageTransparency = 0 }, 0.4, "Out", "Quint")

	local animateAsync = animation.AnimateAsync

	v3341 = UDim2.fromOffset(virtualDeck.AbsolutePosition.X, virtualDeck.AbsolutePosition.Y + 100)
	animateAsync(v3339, { Position = v3341 }, 0.4, "Out", "Quint")
	audioServicePlaySound("LargePunch")
	task.wait(0.2)
	audioServicePlaySound("Boom")
	v3331.Visible = false

	for i = 1, 12 do
		local randomNumber71 = math.random(8, 10)
		local color3226 = Color3.fromRGB(0, 0, 0)
		local v3356 = UDim2.fromOffset(v3300.AbsoluteSize.Y / randomNumber71, v3300.AbsoluteSize.Y / randomNumber71)
		local v3357 = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 110000,
			ClipsDescendants = true,
			BackgroundColor3 = color3226,
			Size = v3356,
			Position = v3331 and UDim2.new(0, v3331.AbsolutePosition.X, 0, v3331.AbsolutePosition.Y) + UDim2.new(0, v3331.AbsoluteSize.X * 0.5, 0, v3331.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0)
		})
		local color3227 = Color3.fromRGB(26, 26, 26)
		local color3228 = Color3.fromRGB(26, 26, 26)
		local v3360 = UDim2.fromOffset(v3331.AbsoluteSize.X, v3331.AbsoluteSize.Y)
		local v3361 = effectsServiceNewerCircle(p1359, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://116104742636685",
			ImageTransparency = 0,
			ZIndex = 110000,
			BackgroundColor3 = color3227,
			ImageColor3 = color3228,
			Size = v3360
		})

		v3361.Parent = v3357
		v3361.AnchorPoint = v3305[i][1]
		v3361.Position = v3305[i][2]

		local v3362 = randomPosOnTarget(v3300)

		task.spawn(function()
			animation.Animate(v3357, { Position = v3362 }, 1.5, "Out", "Quint")
			animation.Animate(v3361, { ImageTransparency = 1 }, 1, "Out", "Quint")
			v3357:Destroy()
		end)
	end

	task.wait(0.2)
	animation.Animate(v3339, { ImageTransparency = 1 }, 0.4, "Out", "Quint")
	task.spawn(function()
		task.wait(0.6)
		animation.Animate(v3309, { BackgroundTransparency = 1 }, 0.8, "Out", "Quint")
		task.spawn(function()
			local v4421 = UDim2.fromScale(0.4, 0.1)
			local v4422 = uDim2New(0.5, 0, 0.65, 0)
			local color3229 = Color3.fromRGB(255, 255, 255)
			local v4424 = effectsServiceNewText(p1359, {
				BackgroundTransparency = 1,
				TextScaled = true,
				Text = "Use WASD (or touch input) to move.",
				ZIndex = 10001,
				TextTransparency = 0,
				Size = v4421,
				Position = v4422,
				TextColor3 = color3229
			})

			task.wait(5)
			animation.AnimateAsync(v4424, { TextTransparency = 1 }, 1, "In", "Sine")
			task.wait(1)
			v4424:Destroy()
		end)
		audioServicePlaySound("NyarlAppear")
		task.wait(13.75)
		audioServicePlaySound("TranscendentRoar")
		task.wait(0.1)
		effectsService.ShakeBattle(p1359, 5, 0.025)
	end)
	task.wait(0.2)
	spawn(function()
		task.wait(2)
		v3297:Destroy()
		v3309:Destroy()
		v3331:Destroy()
		v3326:Destroy()
		v3335:Destroy()
		v3339:Destroy()
	end)
end

return module
