_G.__NoFaces = _G.__NoFaces or function(container)
	local cards = {}

	for _, child in ipairs(container:GetChildren()) do
		if not child:FindFirstChild("DumbFace") then
			table.insert(cards, child)
		end
	end

	return cards
end




local function v1(p1)
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
local effectsServiceThrow = effectsService.Throw
local effectsServiceFlagSelf = effectsService.FlagSelf
local effectsServiceFlagEffect = effectsService.FlagEffect
local effectsServiceBreath = effectsService.Breath
local effectsServiceBreathAttack = effectsService.BreathAttack
local effectsServiceBreathSelf = effectsService.BreathSelf
local effectsServiceBreathEngulf = effectsService.BreathEngulf
local effectsServiceBreathAlly = effectsService.BreathAlly
local effectsServiceBreathEnemy = effectsService.BreathEnemy
local effectsServiceBreathInverse = effectsService.BreathInverse
local effectsServiceBreathReverse = effectsService.BreathReverse
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
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local stepped = game:GetService("RunService").Stepped
local animation = require(replicatedStorage.Animation)

game:GetService("TweenService")
require(game.ReplicatedStorage.CopyTable)

local uDim2New = UDim2.new
local vector2New = Vector2.new
local mathRandom = math.random

local function v44(className)
	local v65 = Instance.new(className)

	return function(p3)
		for k, v in pairs(p3) do
			v65[k] = v
		end

		return v65
	end
end

local v45 = math.random

local function GetWeightedRandom(p4)
	return (v45() - 0.5) * p4
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs

local function returnField(p5)
	if p5 == "" then
		return "", "Enemy"
	end

	if p5 == "Enemy" then
		return "Enemy", ""
	end
end
local function Lerp(p6, p7, p8)
	return p6 * (1 - p8) + p7 * p8
end

Lerp = function(p9, p10)
	if p10 == 0 then
		return p9.Keypoints[1].Value
	end

	if p10 == 1 then
		return p9.Keypoints[#p9.Keypoints].Value
	end

	for i = 1, #p9.Keypoints - 1 do
		local v74 = p9.Keypoints[i]
		local v75 = p9.Keypoints[i + 1]

		if p10 >= v74.Time and p10 < v75.Time then
			local n1 = (p10 - v74.Time) / (v75.Time - v74.Time)

			return Color3.new((v75.Value.R - v74.Value.R) * n1 + v74.Value.R, (v75.Value.G - v74.Value.G) * n1 + v74.Value.G, (v75.Value.B - v74.Value.B) * n1 + v74.Value.B)
		end
	end
end

local function randomPosOnTarget(p11)
	local y = p11.AbsolutePosition.Y
	local n1 = p11.AbsolutePosition.Y + p11.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p11.AbsolutePosition.X, p11.AbsolutePosition.X + p11.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
local function CenterPos(p12)
	local uDim2 = UDim2.new(0, p12.AbsolutePosition.X, 0, p12.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p12.AbsoluteSize.X * 0.5, 0, p12.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function PlaySoundWithOptionalShake(p13, p14, p15, p16)
	if type(p13) == "table" then
		local randomNumber = math.random(1, #p13)

		p13 = p13[randomNumber]
	end

	audioServicePlaySound(p13)

	if p15 and p16 then
		spawn(function()
			effectsService.Shake(p14, p14.Position, p15, p16)
		end)
	end
end
local function PlayRandomSound(p17)
	local randomNumber = math.random(1, #p17)

	audioServicePlaySound(p17[randomNumber])
end

PlayRandomSound = function(p18, p19, p20, p21)
	PlaySoundWithOptionalShake(p18, p19, p20, p21)
end

local function ElementalEntrance(p22, p23, p24)
	local x = p22.Parent.BattleNew.AbsoluteSize.X
	local y = p22.Parent.BattleNew.AbsoluteSize.Y
	local v101 = p23.Position
	local v102 = p23.Size
	local tint = p24.tint
	local sounds = p24.sounds
	local projectile = p24.projectile
	local breathColors = p24.breathColors
	local v107 = p24.pointerOffset or x / 7

	p23.Size = UDim2.fromOffset(p23.AbsoluteSize.X * 1.3, p23.AbsoluteSize.Y * 1.3)
	p23.ImageColor3 = tint

	local v108 = uDim2New(1, 0, 2, 0)
	local v109 = uDim2New(0.5, 0, 0.5, 0)
	local v110 = effectsServiceNewerCircle(p22, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = tint,
		Size = v108,
		Position = v109,
		ZIndex = p23.ZIndex + 100000
	})

	effectsServiceSetCardZIndex(p23, p23.ZIndex + 100001)
	animation.AnimateAsync(v110, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 1, "Out", "Quint")

	for _, v in ipairs(sounds) do
		audioServicePlaySound(v)
	end

	local v113 = UDim2.fromOffset(x / 4, x / 4)
	local uDim2 = UDim2.new(0, v107, 1, 0)
	local v115 = effectsServiceNewerCircle(p22, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v113,
		Position = uDim2
	})

	v113 = UDim2.fromOffset(x / 4, x / 4)

	local uDim23 = UDim2.new(0.75, v107, 1, 0)
	local v117 = effectsServiceNewerCircle(p22, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v113,
		Position = uDim23
	})
	local v118 = UDim2.fromOffset(x / 8, x / 8)
	v107 = {
		Strength = 50,
		Time = 1,
		Lifetime = 1,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 3,
		Projectile = projectile,
		Color = breathColors,
		Size = v118,
		ZIndex = p23.ZIndex + 110000
	}
	effectsServiceBreath(p22, v115, v117, v107)
	effectsServiceBreath(p22, v117, v115, v107)
	p23.Position = UDim2.new(0, x / 2 - p23.AbsoluteSize.X / 2, 1, 0)

	local animationAnimateAsync = animation.AnimateAsync
	local v120 = p23.Position
	local v121 = UDim2.fromOffset(0, y / 2)
	local v122 = UDim2.fromOffset(0, p23.AbsoluteSize.Y / 2)
	local color3 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(p23, { Position = v120 - v121 - v122, ImageColor3 = color3 }, 1.5, "Out", "Quart")
	task.wait(1.5)
	animation.Animate(p23, { Position = v101, Size = v102 }, 0.5, "In", "Quint")
	spawn(function()
		animation.Animate(v110, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Linear")
		effectsServiceSetCardZIndex(p23, p23.ZIndex - 100001)
		v110:Destroy()
		v115:Destroy()
		v117:Destroy()
	end)
	audioServicePlaySound("HammerImpact")
	effectsService.ShakeBattle(p22, 0.5, 0.05)
end
local function SummonFadeInEffect(p25, p26, p27, p28)
	p26.ImageTransparency = 1

	local v128 = uDim2New(0, p26.AbsoluteSize.X, 0, 0)
	local v129 = UDim2.fromOffset(p26.AbsolutePosition.X + p26.AbsoluteSize.X / 2, p26.AbsolutePosition.Y)
	local parent = effectsServiceNewerCircle(p25, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10002,
		Image = "rbxassetid://7106615048",
		ClipsDescendants = true,
		ImageColor3 = p27,
		Size = v128,
		Position = v129
	})
	local image = p26.Image
	local v132 = uDim2New(0, p26.AbsoluteSize.X, 0, p26.AbsoluteSize.Y)
	local v133 = UDim2.fromOffset(p26.AbsoluteSize.X / 2, p26.AbsoluteSize.Y / 2)
	local v134 = effectsServiceNewerCircle(p25, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		ImageColor3 = p27,
		Image = image,
		Size = v132,
		Position = v133,
		Parent = parent
	})

	task.spawn(function()
		for _, v in ipairs(p28) do
			audioServicePlaySound(v)
		end
	end)
	animation.AnimateAsync(v134, { ImageTransparency = 0 }, 0.7, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(v134, { ImageColor3 = color3 }, 0.7, "In", "Quint")

	local animateAsync = animation.AnimateAsync
	local uDim2 = UDim2.new(0, p26.AbsolutePosition.X, 0, p26.AbsolutePosition.Y)
	local uDim24 = UDim2.new(0, p26.AbsoluteSize.X * 0.5, 0, p26.AbsoluteSize.Y * 0.5)

	animateAsync(parent, { Position = uDim2 + uDim24 }, 0.7, "In", "Quint")

	local v140 = animation.AnimateAsync
	local v141 = uDim2New(0, parent.AbsoluteSize.X, 0, p26.AbsoluteSize.Y)

	v140(parent, { Size = v141 }, 0.7, "In", "Quint")
	task.spawn(function()
		task.wait(0.7)
		p26.ImageTransparency = 0
		v134:Destroy()
		parent:Destroy()
	end)
end
local function SummonPortalCinematic(p29, p30, p31)
	local t2 = p31 or {}
	local v146 = t2.StarImage or "rbxassetid://8562508382"
	local v147 = t2.HoleImage or v146
	local v148 = t2.StarColor or Color3.fromRGB(47, 8, 176)
	local v149 = t2.HoleColor or Color3.fromRGB(50, 0, 75)
	local v150 = t2.StarTransparency or 0
	local v151 = t2.HoleTransparency or 0.1
	local v152 = t2.BlackoutStrength or 0.5
	local v153 = t2.EntrySound or "Black Hole"
	local v154 = t2.ImpactSound or "HammerImpact"
	local v155 = t2.BoltSound or "Bolt"
	local v156 = t2.DisableSounds or false
	local v157 = t2.SpinAmount or 1080
	local v158 = t2.HoleSpin or 1600
	local v159 = t2.SpinTime or 2.5
	local v160 = t2.EntryDelay or 1.5
	local v161 = t2.SizeMultiplier or 6
	local v162 = t2.CardPopScale or 1.5
	local v163 = t2.HoleExpandTime or 0.3
	local v164 = t2.HoleCollapseTime or 0.15
	local v165 = t2.CardPopTime or 0.2
	local v166 = t2.SettleTime or 0.4
	local v167 = t2.BigShakePower or 2
	local v168 = t2.BigShakeTime or 0.3
	local v169 = t2.SmallShakePower or 0.3
	local v170 = t2.SmallShakeTime or 0.025
	local onPreHole = t2.OnPreHole
	local onReveal = t2.OnReveal
	local v173 = p30.Position
	local absoluteSize = p30.AbsoluteSize
	local y = p29.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local v176 = uDim2New(1, 0, 2, 0)
	local v177 = uDim2New(0.5, 0, 0.5, 0)
	local v178 = effectsServiceNewerCircle(p29, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = v176,
		Position = v177
	})

	animation.AnimateAsync(v178, { BackgroundTransparency = v152 }, 0.5, "Out", "Quint")
	p30.Size = uDim2New(0, 0, 0, 0)
	p30.Rotation = 360
	p30.Position = UDim2.fromScale(2, 2)
	p30.Visible = false
	p30.AnchorPoint = Vector2.new(0.5, 0.5)

	local v179 = uDim2New(0, y, 0, y)
	local v180 = uDim2New(0.5, 0, 0.5, 0)

	v152 = effectsServiceNewerCircle(p29, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10002,
		ImageColor3 = v148,
		Image = v146,
		Size = v179,
		Position = v180
	})
	animation.AnimateAsync(v152, { ImageTransparency = v150 }, 0.25, "Out", "Quad")
	animation.AnimateAsync(v152, { Rotation = v157 }, v159, "Out", "Linear")

	if not v156 then
		audioServicePlaySound(v153)
	end

	if onPreHole then
		onPreHole(p29, p30, v152)
	end

	task.wait(v160)
	v180 = uDim2New(0, 0, 0, 0)
	v179 = uDim2New(0.5, 0, 0.5, 0)

	local v181 = effectsServiceNewerCircle(p29, {
		BackgroundTransparency = 1,
		ZIndex = 10003,
		ImageTransparency = v151,
		ImageColor3 = v149,
		Image = v147,
		Size = v180,
		Position = v179
	})

	animation.AnimateAsync(v181, { Rotation = v158 }, 1, "Out", "Linear")
	task.spawn(function()
		if not v156 then
			audioServicePlaySound(v155)
		end

		effectsService.ShakeBattle(p29, v167, v168)
	end)

	local animationAnimate = animation.Animate

	v180 = uDim2New(0, y * v161, 0, y * v161)
	animationAnimate(v181, { Size = v180 }, v163, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync

	v180 = uDim2New(0, 0, 0, 0)
	animationAnimateAsync(v181, { Size = v180 }, v164, "In", "Quint")

	local animateAsync = animation.AnimateAsync

	v180 = uDim2New(0, 0, 0, 0)
	animateAsync(v152, { Size = v180 }, v164, "In", "Quint")
	p30.Visible = true
	p30.Position = uDim2New(0.5, 0, 0.5, 0)

	if onReveal then
		onReveal(p29, p30)
	end

	local animate = animation.Animate

	v180 = UDim2.fromOffset(absoluteSize.X * v162, absoluteSize.Y * v162)
	animate(p30, { Size = v180 }, v165, "Out", "Quint")

	local v186 = animation.AnimateAsync

	v180 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	v186(p30, { Size = v180 }, v166, "In", "Quint")
	animation.AnimateAsync(p30, { AnchorPoint = Vector2.new(0, 0) }, v166, "In", "Quint")
	animation.AnimateAsync(p30, { Rotation = 0 }, v166, "In", "Quint")
	animation.Animate(p30, { Position = v173 }, v166, "In", "Quint")
	task.spawn(function()
		if not v156 then
			audioServicePlaySound(v154)
		end

		effectsService.ShakeBattle(p29, v169, v170)
		task.wait(0.4)
		v178:Destroy()
	end)
	animation.AnimateAsync(v178, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
end
local function CinematicOuterSummon(p32)
	local holder = p32.holder
	local origin = p32.origin
	local u190: boolean = p32.autoSettle ~= false
	local rotation = p32.entryRotation or -180
	local v192 = p32.spinAmount or 720
	local v193 = p32.dashTime or 1.9
	local v194 = p32.settleTime or 0.8
	local v195 = p32.overshootX or origin.AbsoluteSize.X
	local v196 = p32.overlayTransparency or 0.5
	local v197 = p32.overlayFadeTime or 0.5
	local v198 = p32.shakePower or 0.3
	local v199 = p32.shakeSpeed or 0.025
	local v200 = p32.entryOffset or UDim2.new(1, origin.AbsoluteSize.X * 2, 0, -origin.AbsoluteSize.Y * 2)
	local t3 = p32.entrySound or { "warp star" }
	local t4 = p32.impactSounds or { "HammerImpact", "Spell Card" }
	local particleProps = p32.particleProps
	local originPosition = origin.Position
	local v205 = nil

	if p32.useOverlay ~= false then
		local color3 = Color3.fromRGB(0, 0, 0)
		local v207 = uDim2New(1, 0, 2, 0)
		local v208 = uDim2New(0.5, 0, 0.5, 0)

		v205 = effectsServiceNewerCircle(holder, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10000,
			BackgroundColor3 = color3,
			Size = v207,
			Position = v208
		})
		animation.AnimateAsync(v205, { BackgroundTransparency = v196 }, v197, "Out", "Quint")
	end

	origin.Rotation = rotation
	origin.Position = v200

	for _, v in ipairs(t3) do
		audioServicePlaySound(v)
	end

	if particleProps then
		effectsServiceEmit(holder, origin, particleProps)
	end

	task.spawn(function()
		animation.AnimateAsync(origin, { Rotation = v192 }, v193, "In", "Quint")
	end)

	local animationAnimate = animation.Animate
	local v212 = UDim2.fromOffset(v195, 0)

	animationAnimate(origin, { Position = originPosition + v212 }, v193, "In", "Quint")

	if v205 then
		animation.AnimateAsync(v205, { BackgroundTransparency = 1 }, v197, "Out", "Quint")
	end

	for _, v in ipairs(t4) do
		audioServicePlaySound(v)
	end

	if v198 and v199 then
		spawn(function()
			effectsService.ShakeBattle(holder, v198, v199)
		end)
	end

	if u190 then
		animation.Animate(origin, { Position = originPosition }, v194, "Out", "Quint")
	end

	if v205 then
		v205:Destroy()
	end
end

local module: {[any]: any} = {
	TBHSummon = function(p33, p34, p35, p36)
		local patrickHand = Enum.Font.PatrickHand
		local color3 = Color3.fromRGB(140, 255, 120)
		local randomNumber = math.random(-10, 10)
		local n1 = p34.ZIndex + 10000

		spawn(function()
			audioServicePlaySound("Yippee")
		end)
		effectsServiceSpeak(p33, p34, p35, p36, {
			Text = "Yippee!",
			Font = patrickHand,
			TextColor3 = color3,
			TextStrokeTransparency = 0,
			Rotation = randomNumber,
			ZIndex = n1
		}, 0.3)
	end,
	IcyExpatriateSummon = function(p37, p38, _, _)
		p38.Visible = false
		audioServiceDimSongs(0.001)

		local color3 = Color3.fromRGB(0, 59, 155)
		local v228 = uDim2New(1, 0, 2, 0)
		local n1 = p38.ZIndex + 10000
		local v230 = uDim2New(0.5, 0, 0.5, 0)
		local v231 = effectsServiceNewerCircle(p37, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color3,
			Size = v228,
			ZIndex = n1,
			Position = v230
		})
		local n2 = p38.ZIndex + 10003
		local image = p38.Image
		local v234 = uDim2New(0, p38.AbsoluteSize.X, 0, p38.AbsoluteSize.Y)
		local color32 = Color3.fromRGB(0, 0, 0)
		local uDim2 = UDim2.new(0, p38.AbsolutePosition.X, 0, p38.AbsolutePosition.Y * -8)
		local v237 = effectsServiceNewerCircle(p37, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = n2,
			Image = image,
			Size = v234,
			ImageColor3 = color32,
			Position = uDim2
		})
		local t5: {[any]: any} = {
			"   NOT A DEVELOPER!",
			"     ICYTEA ISN'T A DEV",
			"DO YOU LIKE BLOX CARDS? :D"
		}
		local randomNumber = math.random(1, 3)

		v230 = t5[randomNumber]:upper()

		local u240: boolean = false

		animation.AnimateAsync(v231, { BackgroundTransparency = 0 }, 0.8, "Out", "Quart")

		for i = 1, #v230 do
			local v242 = UDim2.fromScale(2, 0.12)
			local v243 = UDim2.fromScale(i * 0.06 * 0.4 + 0.2, 0.2)
			local substring = v230:sub(i, i)
			local n3 = p38.ZIndex + 10001
			local color33 = Color3.fromRGB(0, 0, 0)
			local v247 = effectsServiceNewText(p37, {
				BackgroundTransparency = 1,
				TextScaled = true,
				TextTransparency = 1,
				Size = v242,
				Position = v243,
				Text = substring,
				ZIndex = n3,
				TextColor3 = color33,
				Font = Enum.Font.Bodoni
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v1474 = UDim2.fromScale(i * 0.06 * 0.5 + 0.04, 0.2)

				animationAnimate(v247, { TextTransparency = 0, Position = v1474 }, 0.3, "Out", "Quart")

				while not u240 do
					task.wait()
				end

				effectsService.ShakeSync(v247, v247.Position, 0.8, 0.05)
				task.wait(1)
				animation.AnimateAsync(v247, { TextTransparency = 1 }, 0.3, "Out", "Quart")
				task.wait(0.3)
				v247:Destroy()
			end)

			if v230:sub(i, i) ~= " " then
				audioServicePlaySound("clickfast.wav")
			end

			task.wait(0.06)
		end

		local animationAnimateAsync = animation.AnimateAsync
		local uDim25 = UDim2.new(0, p38.AbsolutePosition.X, 0, p38.AbsolutePosition.Y)
		local uDim26 = UDim2.new(0, p38.AbsoluteSize.X * 0.5, 0, p38.AbsoluteSize.Y * 0.5)

		animationAnimateAsync(v237, { Position = uDim25 + uDim26 }, 0.8, "In", "Quart")
		audioServicePlaySound("dbzenter")
		task.wait(0.7)
		audioServicePlaySound("big impact")
		task.wait(0.1)
		u240 = true
		task.wait(1.4)
		animation.AnimateAsync(v231, { BackgroundTransparency = 1 }, 0.7, "Out", "Quart")

		local animateAsync = animation.AnimateAsync
		local color34 = Color3.fromRGB(255, 255, 255)

		animateAsync(v237, { ImageColor3 = color34 }, 0.7, "Out", "Quart")
		task.wait(0.7)
		audioServiceUndimSongs()
		p38.Visible = true
		v231:Destroy()
		v237:Destroy()
	end,
	SadCat = function(p41, p42, p43, p44)
		local t6: {[any]: any} = { ":(" }
		local t7: {[any]: any} = { "meow" }
		local color3 = Color3.fromRGB(255, 71, 47)
		local color35 = Color3.fromRGB(130, 114, 255)
		local color36 = Color3.fromRGB(114, 255, 213)
		local color37 = Color3.fromRGB(156, 234, 255)
		local color38 = Color3.fromRGB(227, 114, 255)
		local color3FromRGB = Color3.fromRGB
		local randomNumber = math.random(1, #t6)
		local v266 = t6[randomNumber]
		local patrickHand = Enum.Font.PatrickHand
		local t8: {[any]: any} = {
			color3,
			color35,
			color36,
			color37,
			color38,
			color3FromRGB(140, 255, 120)
		}
		local randomNumber2 = math.random(1, #t8)
		local v270 = t8[randomNumber2]
		local randomNumber3 = math.random(-10, 10)
		local n1 = p42.ZIndex + 10000

		task.wait(0.1)
		task.spawn(function()
			local randomNumber4 = math.random(1, #t7)

			audioServicePlaySound(t7[randomNumber4])
		end)
		effectsServiceSpeak(p41, p42, p43, p44, {
			Text = v266,
			Font = patrickHand,
			TextColor3 = v270,
			TextStrokeTransparency = 0,
			Rotation = randomNumber3,
			ZIndex = n1
		})
	end,
	TenThousandStarsEffect = function(p1, p2, _, _, _)
		if not p1 or not p2 then
			return
		end
		local tweenService = game:GetService("TweenService")
		local base = p1.AbsolutePosition
		local cx = p2.AbsolutePosition.X - base.X + p2.AbsoluteSize.X * 0.5
		local cy = p2.AbsolutePosition.Y - base.Y + p2.AbsoluteSize.Y * 0.5
		local reach = math.max(p1.AbsoluteSize.X, p1.AbsoluteSize.Y) * 0.6
		pcall(audioServicePlaySound, "warp star")
		local stars = {}
		for i = 1, 140 do
			local size = math.random(14, 42)
			local s = Instance.new("TextLabel")
			s.BackgroundTransparency = 1
			s.Text = (i % 3 == 0) and "✦" or "★"
			s.Font = Enum.Font.GothamBold
			s.TextSize = size
			s.TextColor3 = (i % 2 == 0) and Color3.fromRGB(255, 226, 120) or Color3.fromRGB(255, 255, 255)
			s.TextTransparency = 1
			s.AnchorPoint = Vector2.new(0.5, 0.5)
			s.Size = UDim2.fromOffset(size * 1.5, size * 1.5)
			s.Position = UDim2.fromOffset(cx, cy)
			s.Rotation = math.random(0, 360)
			s.ZIndex = 10000
			s.Parent = p1
			table.insert(stars, s)
			local angle = math.random() * math.pi * 2
			local dist = reach * (0.2 + math.random() * 0.8)
			local goal = UDim2.fromOffset(cx + math.cos(angle) * dist, cy + math.sin(angle) * dist)
			task.delay(math.random() * 0.5, function()
				if not s.Parent then
					return
				end
				tweenService:Create(s, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
				tweenService:Create(s, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = goal, Rotation = s.Rotation + math.random(-180, 180) }):Play()
				task.delay(0.8, function()
					if s.Parent then
						tweenService:Create(s, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()
					end
				end)
			end)
		end
		task.wait(1.9)
		for _, s in ipairs(stars) do
			s:Destroy()
		end
	end,
	SummonLiiam = function(p45, p46, _, _)
		local t9: {[any]: any} = { Color3.fromRGB(223, 223, 223), Color3.fromRGB(187, 217, 217) }
		local v278 = UDim2.fromOffset(p46.AbsoluteSize.X * 0.6, p46.AbsoluteSize.X * 0.6)

		CinematicOuterSummon({
			spinAmount = 720,
			entryRotation = -180,
			holder = p45,
			origin = p46,
			entrySound = { "warp star" },
			impactSounds = { "warp impact" },
			particleProps = {
				Strength = 35,
				Speed = 0.25,
				EasingStyle = "Sine",
				Time = 2.25,
				Projectile = {
					"rbxassetid://78540121386034",
					"rbxassetid://106706459391766",
					"rbxassetid://71379329725316",
					"rbxassetid://106794808706970"
				},
				Color = t9,
				Size = v278,
				Range = p46
			}
		})
	end,
	NeutralRevealSummon = function(p49, p50, _, _)
		audioServiceDimSongs()

		local v283 = p50.Position
		local absoluteSize = p50.AbsoluteSize

		effectsServiceSetCardZIndex(p50, p50.ZIndex + 99999)
		p50.Visible = false

		local color3 = Color3.fromRGB(0, 0, 0)
		local n1 = p50.ZIndex - 1
		local v287 = uDim2New(1, 0, 2, 0)
		local v288 = uDim2New(0.5, 0, 0.5, 0)
		local v289 = effectsServiceNewerCircle(p49, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Rotation = 0,
			BackgroundColor3 = color3,
			ZIndex = n1,
			Size = v287,
			Position = v288
		})

		audioServicePlaySound("sacrifice_sting")
		audioServicePlaySound("clock")
		animation.AnimateAsync(v289, { BackgroundTransparency = 0.1 }, 0.3, "Out", "Quad")

		local t10: {[any]: any} = {}

		for i = 1, 10 do
			local color39 = Color3.fromRGB(255, 255, 255)
			local v293 = p50.Size
			local uDim2 = UDim2.new(0, p50.AbsolutePosition.X, 0, p50.AbsolutePosition.Y)
			local uDim27 = UDim2.new(0, p50.AbsoluteSize.X * 0.5, 0, p50.AbsoluteSize.Y * 0.5)
			local v296 = UDim2.fromOffset(p50.AbsoluteSize.X * 1.1 * (i - 1), 0)
			local v297 = effectsServiceNewerCircle(p49, {
				Image = "rbxassetid://90827927052241",
				ImageColor3 = color39,
				Size = v293,
				Position = uDim2 + uDim27 + v296,
				ZIndex = p50.ZIndex + 1
			})

			table.insert(t10, v297)
		end

		for i = 1, 2 do
			for _, v in pairs(t10) do
				local animationAnimateAsync = animation.AnimateAsync
				local vPosition = v.Position
				local v303 = UDim2.fromOffset(p50.AbsoluteSize.X * 1.1)

				animationAnimateAsync(v, { Position = vPosition - v303 }, 0.8, "Out", "Quart")
			end

			local animationAnimate = animation.Animate
			local v305 = t10[i]
			local color310 = Color3.fromRGB(204, 204, 204)

			animationAnimate(v305, { ImageTransparency = 1, ImageColor3 = color310 }, 0.8, "Out", "Quart")
		end

		p50.Visible = true

		for _, v in pairs(t10) do
			animation.AnimateAsync(v, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
		end

		audioServicePlaySound("heaven release")

		for _, v in pairs(t10) do
			v:Destroy()
		end

		task.spawn(function()
			animation.Animate(v289, { BackgroundTransparency = 1 }, 0.3, "Out", "Quad")
			v289:Destroy()
		end)
		effectsServiceSetCardZIndex(p50, p50.ZIndex - 99999)
		audioServiceUndimSongs()
	end,
	FrostySummon = function(p53, p54, _, _)
		audioService.DimSongs()

		local v315 = p54.Position
		local absoluteSize = p54.AbsoluteSize

		effectsServiceSetCardZIndex(p54, p54.ZIndex + 99999)

		local color3 = Color3.fromRGB(20, 35, 63)
		local n1 = p54.ZIndex - 1
		local v319 = uDim2New(1, 0, 2, 0)
		local v320 = uDim2New(0.5, 0, 0.5, 0)
		local v321 = effectsServiceNewerCircle(p53, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color3,
			ZIndex = n1,
			Size = v319,
			Position = v320
		})

		p54.Position = UDim2.new(v315.X.Scale, v315.X.Offset, 1, 0)
		p54.Rotation = 0
		audioServicePlaySound("bass.wav")
		task.spawn(function()
			local animationAnimateAsync = animation.AnimateAsync
			local v1477 = UDim2.fromOffset(0, 0)

			animationAnimateAsync(p54, { Rotation = 0, Position = v315 - v1477 }, 1.1, "Out", "Sine")
			task.wait(1.1)
			animation.AnimateAsync(p54, { Rotation = 0, Position = v315 }, 0.4, "Out", "Sine")
		end)
		task.spawn(function()
			animation.AnimateAsync(v321, { BackgroundTransparency = 0.35 }, 1.5, "Out", "Quad")
		end)
		audioServicePlaySound("Wind")

		local t11: {[any]: any} = {
			"rbxassetid://12805191197",
			"rbxassetid://12805192081",
			"rbxassetid://12805192997",
			"rbxassetid://12805220334"
		}
		local t12: {[any]: any} = { "rbxassetid://12805192997" }

		for _ = 1, 8 do
			for _ = 1, 2 do
				task.spawn(function()
					local randomNumber = math.random(80, 240)
					local randomNumber5 = math.random(18, 30)
					local randomNumber6 = math.random(0, 2)
					local v1481 = math.random() < 0.15 and t12 or t11
					local randomNumber7 = math.random(1, #v1481)
					local v1483 = v1481[randomNumber7]
					local randomNumber8 = math.random(220, 255)
					local randomNumber9 = math.random(170, 220)
					local randomNumber10 = math.random(0, p53.Parent.AbsoluteSize.Y)
					local n1 = p54.AbsoluteSize.X / 2.5 * (randomNumber / 100)
					local n2 = p54.ZIndex + 100000 + randomNumber6
					local v1489 = UDim2.fromOffset(n1, n1)
					local v1490 = UDim2.fromOffset(p53.Parent.AbsoluteSize.X, randomNumber10)
					local color311 = Color3.fromRGB(randomNumber9, 220, randomNumber8)
					local randomNumber11 = math.random(0, 360)
					local randomNumber12 = math.random(10, 35)
					local v1494 = effectsServiceNewerCircle(p53, {
						Image = v1483,
						ZIndex = n2,
						Size = v1489,
						Position = v1490,
						ImageColor3 = color311,
						Rotation = randomNumber11,
						ImageTransparency = randomNumber12 / 100
					})
					local randomNumber13 = math.random(-120, 120)
					local randomNumber14 = math.random(p53.Parent.AbsoluteSize.X, p53.Parent.AbsoluteSize.X * 1.6)
					local animationAnimate = animation.Animate
					local v1498 = v1494.Position
					local v1499 = UDim2.fromOffset(randomNumber14, randomNumber13)
					local rotation = v1494.Rotation
					local randomNumber15 = math.random(180, 720)

					animationAnimate(v1494, {
						ImageTransparency = 1,
						Position = v1498 - v1499,
						Rotation = rotation + randomNumber15
					}, randomNumber5 / 10, "Out", "Quad")
					v1494:Destroy()
				end)
			end

			task.wait(0.1)
		end

		task.spawn(function()
			task.wait(1.1)
			animation.Animate(v321, { BackgroundTransparency = 1 }, 0.2, "Out", "Quad")
			v321:Destroy()
		end)
		task.wait(1.3)
		effectsServiceSetCardZIndex(p54, p54.ZIndex - 99999)
		audioService.UndimSongs()
	end,
	SummonRedPortal = function(p57, p58, _, _)
		local color3 = Color3.fromRGB(189, 12, 12)
		local color312 = Color3.fromRGB(91, 0, 6)

		SummonPortalCinematic(p57, p58, {
			StarImage = "rbxassetid://18504998038",
			HoleImage = "rbxassetid://18504998038",
			StarTransparency = 0,
			HoleTransparency = 0.1,
			BlackoutStrength = 0.8,
			EntrySound = "ShadowRealm",
			ImpactSound = "HammerImpact",
			BoltSound = "electricwindup",
			DisableSounds = false,
			SpinAmount = 1080,
			HoleSpin = 1600,
			SpinTime = 2.25,
			EntryDelay = 1.25,
			SizeMultiplier = 8,
			CardPopScale = 1.5,
			HoleExpandTime = 0.3,
			HoleCollapseTime = 0.15,
			CardPopTime = 0.2,
			SettleTime = 0.4,
			BigShakePower = 1.5,
			BigShakeTime = 0.25,
			SmallShakePower = 0.25,
			SmallShakeTime = 0.02,
			OnPreHole = nil,
			OnReveal = nil,
			StarColor = color3,
			HoleColor = color312
		})
	end,
	SummonSlide = function(_, p62, _, _)
		local v336 = p62.Position
		local zIndex = p62.ZIndex

		p62.ZIndex = zIndex + 999

		local t13: {[any]: any} = { "Kerplunk.wav", "splat.wav", "button.wav", "snap.wav", "bass.wav" }

		p62.Position = UDim2.new(v336.X.Scale, v336.X.Offset, 1, 0)
		p62.Rotation = 0

		local n1 = v336.Y.Offset - 20
		local animationAnimateAsync = animation.AnimateAsync
		local uDim2 = UDim2.new(v336.X.Scale, v336.X.Offset, 0, n1)

		animationAnimateAsync(p62, { Rotation = 0, Position = uDim2 }, 0.35, "InOut", "Sine")
		task.wait(0.35)

		local n2 = 2 + math.random(0, 1)
		local n3 = 0

		for i = 1, n2 do
			local u345
			local randomNumber16

			if i == n2 then
				u345 = v336.Y.Offset
				randomNumber16 = 0
			else
				local randomNumber = math.random(4, 15)

				u345 = n1 + randomNumber * (if i % 2 == 0 then -1 else 1)
				randomNumber16 = math.random(-2, 2)
			end

			local n5 = math.random() * 0.06999999999999999 + 0.08

			task.delay(n3, function()
				audioServicePlaySound(t13[i] or t13[#t13])

				local animationAnimateAsync = animation.AnimateAsync
				local uDim28 = UDim2.new(v336.X.Scale, v336.X.Offset, 0, u345)

				animationAnimateAsync(p62, { Position = uDim28, Rotation = randomNumber16 }, n5, "InOut", "Cubic")
			end)
			n3 += n5
		end

		task.wait(n3 - 0.3)
		p62.ZIndex = zIndex
	end,
	SummonHopper = function(_, p66, _, _)
		local v353 = p66.Position
		local rotation = p66.Rotation
		local v355 = UDim2.fromOffset(p66.AbsoluteSize.X * 2.8, 0)

		p66.Position = v353 + v355
		p66.Rotation = rotation + 8

		local t14: {[any]: any} = { "Kerplunk.wav", "button.wav", "splat.wav", "snap.wav" }
		local n1 = 0

		for _, v in ipairs({
			{ x = 115, y = -200, rot = -8, time = 0.3, sound = 1 },
			{ x = 25, y = 10, rot = -5, time = 0.14 },
			{ x = 0, y = -95, rot = 8, time = 0.12, sound = 2 },
			{ x = -4, y = -35, rot = -6, time = 0.14, sound = 3 },
			{ x = 0, y = 0, rot = 0, time = 0.14, sound = 4 }
		}) do
			task.delay(n1, function()
				if v.sound then
					audioServicePlaySound(t14[v.sound])
				end

				local animationAnimateAsync = animation.AnimateAsync
				local v1505 = UDim2.fromOffset(v.x, v.y)

				animationAnimateAsync(p66, { Position = v353 + v1505, Rotation = rotation + v.rot }, v.time, "InOut", "Sine")
			end)
			n1 += v.time
		end

		task.wait(0.25)
	end,
	SummonFrolic = function(_, p70, _, _)
		local v364 = p70.Position
		local v365 = UDim2.fromOffset(p70.AbsoluteSize.X * 2.8, 0)

		p70.Position = v364 + v365
		p70.Rotation = 10

		local t15: {[any]: any} = { "Kerplunk.wav", "splat.wav", "button.wav", "snap.wav", "bass.wav" }
		local n1: number = 0

		for i, v in ipairs({
			{ x = 120, y = -26, rot = -14 },
			{ x = 70, y = 18, rot = 12 },
			{ x = 35, y = -14, rot = -8 },
			{ x = 12, y = 6, rot = 4 },
			{ x = 0, y = 0, rot = 0 }
		}) do
			task.delay(n1, function()
				audioServicePlaySound(t15[i] or t15[#t15])

				local animationAnimateAsync = animation.AnimateAsync
				local v1507 = UDim2.fromOffset(v.x, v.y)

				animationAnimateAsync(p70, { Position = v364 + v1507, Rotation = v.rot }, 0.16, "InOut", "Sine")
			end)
			n1 += 0.16
		end

		task.wait(0.25)
	end,
	SummonFlipping = function(_, p74, _, _)
		local v374 = p74.Position
		local rotation = p74.Rotation
		local v376 = UDim2.fromOffset(p74.AbsoluteSize.X * 2.8, 0)

		p74.Position = v374 + v376
		p74.Rotation = rotation

		local t16: {[any]: any} = { "Kerplunk.wav", "splat.wav", "button.wav", "snap.wav", "bass.wav" }
		local n1: number = 0

		for i, v in ipairs({
			{ x = 150, y = -30, rot = 90 },
			{ x = 75, y = 20, rot = 180 },
			{ x = 0, y = 0, rot = 360 }
		}) do
			task.delay(n1, function()
				audioServicePlaySound(t16[i] or t16[#t16])

				local animationAnimateAsync = animation.AnimateAsync
				local v1509 = UDim2.fromOffset(v.x, v.y)

				animationAnimateAsync(p74, { Position = v374 + v1509, Rotation = rotation + v.rot }, 0.25, "InOut", "Sine")
			end)
			n1 += 0.25
		end

		task.wait(0.25)
	end,
	IcyTeaSummon = function(p77, p78)
		local color3 = Color3.fromRGB(8, 7, 26)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color313 = Color3.fromRGB(65, 185, 240)

		ElementalEntrance(p77, p78, {
			tint = color3,
			sounds = { "Wind", "IceBreath", "Gust" },
			projectile = effectsServiceBreathimagesIce,
			breathColors = { color313, Color3.fromRGB(17, 81, 184) },
			pointerOffset = p77.Parent.BattleNew.AbsoluteSize.X / 7
		})
	end,
	EclipseSummon = function(p79, p80)
		local color3 = Color3.fromRGB(26, 7, 7)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color314 = Color3.fromRGB(240, 32, 13)

		ElementalEntrance(p79, p80, {
			tint = color3,
			sounds = { "fire ambience", "FireBreathLong", "EclipseYell" },
			projectile = effectsServiceBreathimagesFire,
			breathColors = { color314, Color3.fromRGB(189, 10, 10) },
			pointerOffset = p79.Parent.BattleNew.AbsoluteSize.X / 7
		})
	end,
	ChromafexSummon = function(p81, p82)
		local t17: {[any]: any} = { "Servo", "Servo2" }

		task.spawn(function()
			local color3 = Color3.fromRGB(26, 7, 7)
			local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
			local color315 = Color3.fromRGB(240, 32, 13)

			ElementalEntrance(p81, p82, {
				tint = color3,
				sounds = { "fire ambience", "FireBreathLong", "MechReady2" },
				projectile = effectsServiceBreathimagesFire,
				breathColors = { color315, Color3.fromRGB(189, 10, 10) },
				pointerOffset = p81.Parent.BattleNew.AbsoluteSize.X / 7
			})
		end)
		task.spawn(function()
			audioServicePlaySound("robotstep")
			task.wait(0.75)

			local randomNumber = math.random(1, #t17)

			audioServicePlaySound(t17[randomNumber])
			task.wait(0.75)
			audioServicePlaySound("robotnoise")
		end)
	end,
	SummonNibblex = function(p83, p84, _, _)
		local color3 = Color3.fromRGB(47, 8, 176)
		local color316 = Color3.fromRGB(50, 0, 75)

		SummonPortalCinematic(p83, p84, {
			StarImage = "rbxassetid://8562508382",
			HoleImage = "rbxassetid://8562508382",
			StarTransparency = 0,
			HoleTransparency = 0.1,
			BlackoutStrength = 0.75,
			EntrySound = "Black Hole",
			ImpactSound = "HammerImpact",
			BoltSound = "Bolt",
			DisableSounds = false,
			SpinAmount = 1080,
			HoleSpin = 1600,
			SpinTime = 2.5,
			EntryDelay = 1.5,
			SizeMultiplier = 6,
			CardPopScale = 1.5,
			HoleExpandTime = 0.3,
			HoleCollapseTime = 0.15,
			CardPopTime = 0.2,
			SettleTime = 0.4,
			BigShakePower = 2,
			BigShakeTime = 0.3,
			SmallShakePower = 0.3,
			SmallShakeTime = 0.025,
			OnPreHole = nil,
			OnReveal = nil,
			StarColor = color3,
			HoleColor = color316
		})
	end,
	SoulysmSummon = function(p87, p88)
		local color3 = Color3.fromRGB(26, 7, 7)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color317 = Color3.fromRGB(240, 32, 13)

		ElementalEntrance(p87, p88, {
			tint = color3,
			sounds = { "fire ambience", "FireBreathLong", "evillaugh" },
			projectile = effectsServiceBreathimagesFire,
			breathColors = { color317, Color3.fromRGB(189, 10, 10) },
			pointerOffset = p87.Parent.BattleNew.AbsoluteSize.X / 7
		})
	end,
	Soulful = function(p89, p90, _, p92)
		local s1 = if p92 == "" then "Enemy" else if p92 == "Enemy" then "" else nil
		local zIndex = p90.ZIndex
		local absolutePosition = p90.AbsolutePosition
		local absoluteSize = p90.AbsoluteSize
		local y = p89.Parent.AbsoluteSize.Y
		local n1: number = if p90.AbsolutePosition.Y < y / 2 then 1 else 0
		local n2 = y * n1 + p90.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1)

		p90.Rotation = -360
		p90.Position = UDim2.new(0, p90.AbsolutePosition.X, 0, n2)
		audioServiceDimSongs()
		audioServicePlaySound("Angelic Humming")

		local color3 = Color3.fromRGB(0, 0, 0)
		local n3 = p90.ZIndex + 99997
		local v418 = uDim2New(1, 0, 2, 0)
		local v419 = uDim2New(0.5, 0, 0.5, 0)

		n2 = effectsServiceNewerCircle(p89, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color3,
			ZIndex = n3,
			Size = v418,
			Position = v419
		})

		local color318 = Color3.fromRGB(255, 255, 255)
		local n4 = p90.ZIndex + 100000
		local v422 = uDim2New(0.125, 0, 5, 0)
		local uDim2 = UDim2.new(0, p90.AbsolutePosition.X, 0, p90.AbsolutePosition.Y)
		local uDim29 = UDim2.new(0, p90.AbsoluteSize.X * 0.5, 0, p90.AbsoluteSize.Y * 0.5)
		local v425 = effectsServiceNewerCircle(p89, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color318,
			ZIndex = n4,
			Size = v422,
			Position = uDim2 + uDim29
		})

		task.spawn(function()
			for _ = 1, 2 do
				audioServicePlaySound("Swoosh")
				animation.AnimateAsync(v425, { BackgroundTransparency = 0.8 }, 0.5, "Out", "Quart")
				v425.BackgroundTransparency = 0.4
				task.wait(0.55)
			end
		end)

		local animationAnimateAsync = animation.AnimateAsync
		local color319 = Color3.fromRGB(205, 254, 255)

		animationAnimateAsync(v425, { BackgroundColor3 = color319 }, 1.75, "Out", "Quart")
		animation.AnimateAsync(n2, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
		animation.AnimateAsync(v425, { BackgroundTransparency = 0.5 }, 0.4, "Out", "Quart")
		animation.AnimateAsync(p90, { Rotation = 360 }, 1.75, "Out", "Quint")
		effectsServiceSetCardZIndex(p90, p90.ZIndex + 99999)

		local animationAnimate = animation.Animate

		v422 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
		animationAnimate(p90, { Position = v422 }, 1.75, "Out", "Quad")
		audioServicePlaySound("warp impact")
		task.wait(0.1)
		effectsService.ShakeSync(p90, p90.Position, 0.5, 0.05)
		task.wait(0.15)
		task.spawn(function()
			for _, v in pairs(_G.__NoFaces(p90.Parent.Parent[s1 .. "Field"])) do
				task.spawn(function()
					effectsService.ShakeInOut(v, v.Position, 0.5, 0.002)
				end)
			end
		end)
		animation.AnimateAsync(n2, { BackgroundTransparency = 1 }, 0.35, "Out", "Quart")
		animation.AnimateAsync(v425, { BackgroundTransparency = 1 }, 0.55, "Out", "Quart")
		task.wait(0.9)
		audioServiceUndimSongs()
		n2:Destroy()
		v425:Destroy()
		effectsServiceSetCardZIndex(p90, p90.ZIndex - 99999)
	end
}

function module.SummonGrimclawSacred(p93, p94, p95, p96)
	audioService.DimSongs()

	local s1 = if p96 == "" then "Enemy" else if p96 == "Enemy" then "" else nil
	local zIndex = p94.ZIndex
	local absolutePosition = p94.AbsolutePosition
	local absoluteSize = p94.AbsoluteSize
	local y = p93.Parent.AbsoluteSize.Y
	local n1: number = if p94.AbsolutePosition.Y > y / 2 then 1 else 0

	p94.Position = UDim2.new(0, p94.AbsolutePosition.X, 0, y * n1 + p94.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	p94.Rotation = -720

	local color3 = Color3.fromRGB(11, 43, 14)
	local n2 = p94.ZIndex + 99998
	local v441 = uDim2New(1, 0, 2, 0)
	local v442 = uDim2New(0.5, 0, 0.5, 0)
	local v443 = effectsServiceNewerCircle(p93, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v441,
		Position = v442
	})

	animation.AnimateAsync(v443, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p94, p94.ZIndex + 99999)
	audioServicePlaySound("DragonRoar")
	animation.AnimateAsync(p94, {
		Rotation = 0,
		Position = UDim2.fromOffset(absolutePosition.X - absoluteSize.X / 2, absolutePosition.Y + p94.AbsoluteSize.Y / 2 * (if n1 == 1 then -0.5 else -1)),
		Size = UDim2.fromOffset(absoluteSize.X * 2, absoluteSize.Y * 2)
	}, 0.7, "Out", "Quint")
	task.wait(0.5)

	local animationAnimateAsync = animation.AnimateAsync
	local color320 = Color3.fromRGB(65, 236, 27)

	animationAnimateAsync(v443, { BackgroundTransparency = 1, BackgroundColor3 = color320 }, 1, "Out", "Quart")
	audioServicePlaySound("Swoosh")
	task.spawn(function()
		module.SelfPulseGreen(p93, p94, p95, nil, nil)
	end)

	local animationAnimate = animation.Animate
	local v447 = UDim2.fromOffset(absolutePosition.X + absoluteSize.X * 0.05, absolutePosition.Y + absoluteSize.Y * 0.05)
	local v448 = UDim2.fromOffset(absoluteSize.X * 0.9, absoluteSize.Y * 0.9)

	animationAnimate(p94, { Rotation = 0, Position = v447, Size = v448 }, 0.4, "In", "Quint")
	effectsServiceSetCardZIndex(p94, 1)
	task.spawn(function()
		for _, v in pairs(p94.Parent:GetChildren()) do
			if v ~= p94 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1825 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1826 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
					local randomNumber = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1825, Size = v1826, Rotation = randomNumber }, 0.4, "Out", "Quint")
					task.wait(0.25)

					local animationAnimate = animation.Animate

					v1826 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1825 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1826, Size = v1825 }, 0.4, "In", "Quint")
				end)
			end
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p94.Parent.Parent[s1 .. "Field"])) do
			local vAbsolutePosition = v.AbsolutePosition
			local vAbsoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1830 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
				local v1831 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
				local randomNumber = math.random(-15, 15)

				animationAnimateAsync(v, { Position = v1830, Size = v1831, Rotation = randomNumber }, 0.4, "Out", "Quint")
				task.wait(0.25)

				local animateAsync = animation.AnimateAsync

				v1831 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
				v1830 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
				animateAsync(v, { Rotation = 0, Position = v1831, Size = v1830 }, 0.4, "In", "Quint")
			end)
		end
	end)
	audioService.PlaySound("LargeImpact")
	audioService.UndimSongs()
	effectsService.ShakeBattleSync(p93, 0.15, 0.025)
	task.wait(1.1)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p94.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.5, 0.002)
			end)
		end
	end)

	local animateAsync = animation.AnimateAsync

	v448 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	v447 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animateAsync(p94, { Position = v448, Size = v447 }, 0.2, "Out", "Quart")
	task.wait(0.9)
	v443:Destroy()
	effectsServiceSetCardZIndex(p94, zIndex)
end
function module.SummonGrimclaw(p97, p98, _, p100)
	audioService.DimSongs()

	local s1

	if p100 == "" then
		s1 = "Enemy"
	elseif p100 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local x = p97.Parent.BattleNew.AbsoluteSize.X
	local y = p97.Parent.BattleNew.AbsoluteSize.Y
	local v458 = p98.Position
	local v459 = p98.Size

	p98.Size = UDim2.fromOffset(p98.AbsoluteSize.X * 1.3, p98.AbsoluteSize.Y * 1.3)
	p98.ImageColor3 = Color3.fromRGB(6, 26, 8)

	local color3 = Color3.fromRGB(11, 26, 8)
	local v461 = uDim2New(1, 0, 2, 0)
	local v462 = uDim2New(0.5, 0, 0.5, 0)
	local v463 = effectsServiceNewerCircle(p97, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		Size = v461,
		Position = v462,
		ZIndex = p98.ZIndex + 100000
	})

	effectsServiceSetCardZIndex(p98, p98.ZIndex + 100001)
	animation.AnimateAsync(v463, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 1, "Out", "Quint")
	audioServicePlaySound("fire ambience")
	audioServicePlaySound("FireBreathLong")
	audioServicePlaySound("DragonRoar")

	local v464 = UDim2.fromOffset(x / 4, x / 4)
	local uDim2 = UDim2.new(0, x / 8, 1, 0)
	local v466 = effectsServiceNewerCircle(p97, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v464,
		Position = uDim2
	})
	local v467 = UDim2.fromOffset(x / 4, x / 4)
	local uDim210 = UDim2.new(0.25, x / 8, 1, -x / 8)
	local v469 = effectsServiceNewerCircle(p97, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v467,
		Position = uDim210
	})
	local v470 = UDim2.fromOffset(x / 4, x / 4)
	local uDim211 = UDim2.new(0.5, x / 8, 1, -x / 8)
	local v472 = effectsServiceNewerCircle(p97, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v470,
		Position = uDim211
	})
	local v473 = UDim2.fromOffset(x / 4, x / 4)
	local uDim212 = UDim2.new(0.75, x / 8, 1, 0)
	local v475 = effectsServiceNewerCircle(p97, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v473,
		Position = uDim212
	})
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	v470 = { Color3.fromRGB(32, 180, 37), Color3.fromRGB(56, 184, 97) }
	local v477 = UDim2.fromOffset(x / 8, x / 8)
	v467 = {
		Strength = 40,
		Time = 1.5,
		Lifetime = 1.5,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 3,
		Projectile = effectsServiceBreathimagesFire,
		Color = v470,
		Size = v477,
		ZIndex = p98.ZIndex + 110000
	}
	effectsServiceBreath(p97, v469, v466, v467)
	effectsServiceBreath(p97, v472, v475, v467)
	effectsServiceBreath(p97, v466, v475, v467)
	effectsServiceBreath(p97, v475, v466, v467)
	p98.Position = UDim2.new(0, x / 2 - p98.AbsoluteSize.X / 2, 1, 0)

	local animationAnimateAsync = animation.AnimateAsync
	local v479 = p98.Position
	local v480 = UDim2.fromOffset(0, y / 2)
	local v481 = UDim2.fromOffset(0, p98.AbsoluteSize.Y / 2)
	local color321 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(p98, { Position = v479 - v480 - v481, ImageColor3 = color321 }, 2.5, "Out", "Quart")
	task.wait(2.5)
	animation.Animate(p98, { Position = v458, Size = v459 }, 0.5, "In", "Quint")
	audioServicePlaySound("HammerImpact")
	audioService.UndimSongs()
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p98.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.5, 0.002)
			end)
		end
	end)
	effectsService.ShakeBattle(p97, 0.1, 0.025)
	spawn(function()
		animation.Animate(v463, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Linear")
		effectsServiceSetCardZIndex(p98, p98.ZIndex - 100001)
		v463:Destroy()
		v466:Destroy()
		v469:Destroy()
		v472:Destroy()
		v475:Destroy()
	end)
end
function module.TheStalkerSummon(p101, p102, _, p104)
	local t18: {[any]: any} = { "StalkerCall1", "StalkerCall2", "StalkerCall3" }
	local s1 = if p104 == "" then "Enemy" else if p104 == "Enemy" then "" else nil
	local zIndex = p102.ZIndex
	local absolutePosition = p102.AbsolutePosition
	local absoluteSize = p102.AbsoluteSize
	local y = p101.Parent.AbsoluteSize.Y
	local n1: number = if p102.AbsolutePosition.Y > y / 2 then 1 else 0

	p102.Position = UDim2.new(0, p102.AbsolutePosition.X, 0, y * n1 + p102.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	audioServiceDimSongs()
	p102.ImageTransparency = 1

	local color3 = Color3.fromRGB(36, 7, 7)
	local n2 = p102.ZIndex + 99998
	local v496 = uDim2New(1, 0, 2, 0)
	local v497 = uDim2New(0.5, 0, 0.5, 0)
	local v498 = effectsServiceNewerCircle(p101, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v496,
		Position = v497
	})

	animation.AnimateAsync(v498, { BackgroundTransparency = 0.25 }, 1, "Out", "Quart")
	effectsServiceSetCardZIndex(p102, p102.ZIndex + 99999)
	task.spawn(function()
		task.wait(0.85)

		local randomNumber = math.random(1, #t18)

		audioServicePlaySound(t18[randomNumber])
	end)

	local animationAnimate = animation.Animate
	local v500 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimate(p102, { Position = v500 }, 1.25, "Out", "Quad")
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p102.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.1, 0.015)
			end)
		end
	end)

	local color322 = Color3.fromRGB(145, 20, 20)

	v500 = uDim2New(0, p102.AbsoluteSize.X, 0, 0)

	local v502 = UDim2.fromOffset(p102.AbsolutePosition.X + p102.AbsoluteSize.X / 2, p102.AbsolutePosition.Y)
	local parent = effectsServiceNewerCircle(p101, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10002,
		Image = "rbxassetid://7106615048",
		ClipsDescendants = true,
		ImageColor3 = color322,
		Size = v500,
		Position = v502
	})
	local color323 = Color3.fromRGB(117, 16, 16)
	local image = p102.Image

	v502 = uDim2New(0, p102.AbsoluteSize.X, 0, p102.AbsoluteSize.Y)
	v500 = UDim2.fromOffset(p102.AbsoluteSize.X / 2, p102.AbsoluteSize.Y / 2)

	local v506 = effectsServiceNewerCircle(p101, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		ImageColor3 = color323,
		Image = image,
		Size = v502,
		Position = v500,
		Parent = parent
	})

	animation.AnimateAsync(v506, { ImageTransparency = 0 }, 0.5, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local color324 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(v506, { ImageColor3 = color324 }, 0.5, "In", "Quint")

	local animateAsync = animation.AnimateAsync
	local uDim2 = UDim2.new(0, p102.AbsolutePosition.X, 0, p102.AbsolutePosition.Y)
	local uDim213 = UDim2.new(0, p102.AbsoluteSize.X * 0.5, 0, p102.AbsoluteSize.Y * 0.5)

	animateAsync(parent, { Position = uDim2 + uDim213 }, 0.5, "In", "Quint")

	local v512 = animation.AnimateAsync

	v502 = uDim2New(0, parent.AbsoluteSize.X, 0, p102.AbsoluteSize.Y)
	v512(parent, { Size = v502 }, 0.5, "In", "Quint")
	spawn(function()
		audioServiceUndimSongs()
		task.wait(0.2)
		p102.ImageTransparency = 0
		v506:Destroy()
		animation.AnimateAsync(v498, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
		audioServiceUndimSongs()
		effectsServiceSetCardZIndex(p102, p102.ZIndex - 99999)
		task.wait(1)
		v498:Destroy()
		parent:Destroy()
	end)
end
function module.TelamonSummon(p105, p106, _, p108)
	local t19: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
	local s1 = if p108 == "" then "Enemy" else if p108 == "Enemy" then "" else nil
	local zIndex = p106.ZIndex
	local absolutePosition = p106.AbsolutePosition
	local absoluteSize = p106.AbsoluteSize
	local y = p105.Parent.AbsoluteSize.Y
	local n1: number = if p106.AbsolutePosition.Y < y / 2 then 1 else 0
	local n2 = y * n1 + p106.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1)

	p106.Rotation = -360
	p106.Position = UDim2.new(0, p106.AbsolutePosition.X, 0, n2)
	audioServiceDimSongs()
	audioServicePlaySound("Angelic Humming")

	local color3 = Color3.fromRGB(0, 0, 0)
	local n3 = p106.ZIndex + 99997
	local v527 = uDim2New(1, 0, 2, 0)
	local v528 = uDim2New(0.5, 0, 0.5, 0)

	n2 = effectsServiceNewerCircle(p105, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n3,
		Size = v527,
		Position = v528
	})

	local color325 = Color3.fromRGB(255, 255, 255)
	local n4 = p106.ZIndex + 100000
	local v531 = uDim2New(0.125, 0, 5, 0)
	local uDim2 = UDim2.new(0, p106.AbsolutePosition.X, 0, p106.AbsolutePosition.Y)
	local uDim214 = UDim2.new(0, p106.AbsoluteSize.X * 0.5, 0, p106.AbsoluteSize.Y * 0.5)
	local v534 = effectsServiceNewerCircle(p105, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color325,
		ZIndex = n4,
		Size = v531,
		Position = uDim2 + uDim214
	})

	task.spawn(function()
		for _ = 1, 2 do
			audioServicePlaySound("Swoosh")
			animation.AnimateAsync(v534, { BackgroundTransparency = 0.8 }, 0.5, "Out", "Quart")
			v534.BackgroundTransparency = 0.4
			task.wait(0.6)
		end
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local color326 = Color3.fromRGB(255, 247, 187)

	animationAnimateAsync(v534, { BackgroundColor3 = color326 }, 2.5, "Out", "Quart")
	animation.AnimateAsync(n2, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
	animation.AnimateAsync(v534, { BackgroundTransparency = 0.5 }, 0.4, "Out", "Quart")
	animation.AnimateAsync(p106, { Rotation = 360 }, 2.5, "Out", "Quint")
	effectsServiceSetCardZIndex(p106, p106.ZIndex + 99999)

	local animationAnimate = animation.Animate

	v531 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	animationAnimate(p106, { Position = v531 }, 2.5, "Out", "Quad")
	audioServicePlaySound("John's Laugh")

	local randomNumber = math.random(1, #t19)

	audioServicePlaySound(t19[randomNumber])
	task.wait(0.1)
	effectsService.ShakeSync(p106, p106.Position, 1, 0.05)
	task.wait(0.15)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p106.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1, 0.002)
			end)
		end
	end)
	animation.AnimateAsync(n2, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(v534, { BackgroundTransparency = 1 }, 0.75, "Out", "Quart")
	task.wait(1)
	audioServiceUndimSongs()
	n2:Destroy()
	v534:Destroy()
	effectsServiceSetCardZIndex(p106, p106.ZIndex - 99999)
end
function module.NinaSummon(p109, p110, _, _)
	effectsServicePreloadTech(p109, { "rbxassetid://14829548718", "rbxassetid://14829548718" })
	audioServiceDimSongs()
	audioServicePlaySound("leaves")
	task.spawn(function()
		local color3 = Color3.fromRGB(0, 0, 0)
		local n1 = p110.ZIndex + 99998
		local v1537 = uDim2New(1, 0, 2, 0)
		local v1538 = uDim2New(0.5, 0, 0.5, 0)
		local v1539 = effectsServiceNewerCircle(p109, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color3,
			ZIndex = n1,
			Size = v1537,
			Position = v1538
		})
		local color327 = Color3.fromRGB(255, 255, 255)
		local n2 = p110.ZIndex + 100001
		local v1542 = uDim2New(1, 0, 2, 0)
		local v1543 = uDim2New(0.5, 0, 0.5, 0)
		local v1544 = effectsServiceNewerCircle(p109, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color327,
			ZIndex = n2,
			Size = v1542,
			Position = v1543
		})
		local n3 = p110.ZIndex + 99999
		local uDim2 = UDim2.new(0, p109.Parent.AbsoluteSize.Y, 0, p109.Parent.AbsoluteSize.Y)
		local v1547 = UDim2.fromScale(0.5, 0.65)
		local v1548 = effectsServiceNewerCircle(p109, {
			Image = "rbxassetid://14829548718",
			ImageTransparency = 1,
			Rotation = 160,
			ZIndex = n3,
			Size = uDim2,
			Position = v1547
		})

		animation.AnimateAsync(v1539, { BackgroundTransparency = 0.1 }, 0.3, "Out", "Quad")
		animation.AnimateAsync(v1548, { ImageTransparency = 0 }, 0.5, "Out", "Quart")
		task.wait(1)
		audioServicePlaySound("fabric")

		local animationAnimateAsync = animation.AnimateAsync
		local v1550 = UDim2.fromScale(0.5, 0.4)

		animationAnimateAsync(v1548, { Rotation = 180, Position = v1550 }, 1, "In", "Quad")
		task.wait(0.5)
		animation.AnimateAsync(v1544, { BackgroundTransparency = 0 }, 0.5, "Out", "Quad")
		task.wait(0.5)
		v1539:Destroy()
		v1548:Destroy()
		audioServicePlaySound("dbzswordout")
		v1547 = UDim2.fromOffset(p110.AbsoluteSize.Y * 1.5, p110.AbsoluteSize.Y * 1.5)

		local v1551 = p110
		local uDim215 = UDim2.new(0, v1551.AbsolutePosition.X, 0, v1551.AbsolutePosition.Y)
		local uDim216 = UDim2.new(0, v1551.AbsoluteSize.X * 0.5, 0, v1551.AbsoluteSize.Y * 0.5)

		v1551 = UDim2.fromOffset(p110.AbsoluteSize.X / 2)
		v1548 = effectsServiceNewerCircle(p109, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://14829548718",
			Rotation = -180,
			Size = v1547,
			Position = uDim215 + uDim216 + v1551,
			ZIndex = p110.ZIndex + 100000
		})
		animation.AnimateAsync(v1548, { Rotation = 10 }, 1, "Out", "Quint")
		animation.Animate(v1544, { BackgroundTransparency = 1 }, 1, "Out", "Quad")
		animation.AnimateAsync(v1548, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
		v1544:Destroy()
		task.wait(0.5)
		v1548:Destroy()
	end)

	for _ = 1, 15 do
		for _ = 1, 2 do
			local n1 = p110.ZIndex + 100000
			local uDim2 = UDim2.new(0, p110.AbsoluteSize.X / 2.5, 0, p110.AbsoluteSize.X / 2.5)
			local v547 = UDim2.fromOffset(p109.Parent.AbsoluteSize.X, math.random(0, p109.Parent.AbsoluteSize.Y))
			local color3 = Color3.fromRGB(70, 255, 70)
			local randomNumber = math.random(0, 360)
			local v550 = effectsServiceNewerCircle(p109, {
				Image = "rbxassetid://6602413638",
				ImageTransparency = 0.2,
				ZIndex = n1,
				Size = uDim2,
				Position = v547,
				ImageColor3 = color3,
				Rotation = randomNumber
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v1555 = v550.Position
				local uDim2FromOffset = UDim2.fromOffset
				local randomNumber17 = math.random(p109.Parent.AbsoluteSize.X, p109.Parent.AbsoluteSize.X * 1.5)
				local uDim2 = uDim2FromOffset(randomNumber17, 0)
				local randomNumber18 = math.random(0, 360)

				animationAnimate(v550, {
					ImageTransparency = 1,
					Position = v1555 - uDim2,
					Rotation = randomNumber18
				}, 3, "Out", "Quad")
				v550:Destroy()
			end)
		end

		task.wait(0.15)
	end

	audioServiceUndimSongs()
end
function module.SummonAzureless(p113, p114, _, _)
	local color3 = Color3.fromRGB(52, 22, 23)
	local v556 = uDim2New(1, 0, 2, 0)
	local v557 = uDim2New(0.5, 0, 0.5, 0)
	local v558 = effectsServiceNewerCircle(p113, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3,
		Size = v556,
		Position = v557
	})

	animation.AnimateAsync(v558, { BackgroundTransparency = 0.6 }, 2, "Out", "Quint")

	local v559 = p114.Size
	local absoluteSize = p114.AbsoluteSize

	v557 = p114.Position

	local uDim2 = UDim2.new(0, p114.AbsolutePosition.X, 0, p114.AbsolutePosition.Y)
	local uDim217 = UDim2.new(0, p114.AbsoluteSize.X * 0.5, 0, p114.AbsoluteSize.Y * 0.5)

	p114.Visible = false
	p114.Size = UDim2.fromOffset(p114.AbsoluteSize.X * 6, -p114.AbsoluteSize.X * 6)
	p114.Position = UDim2.fromScale(0.5, 0.5)
	audioServicePlaySound("LaserChargeup")

	local color328 = Color3.fromRGB(189, 55, 55)
	local v564 = uDim2New(0, absoluteSize.Y * 2.5, 0, absoluteSize.Y * 2.5)
	local v565 = effectsServiceNewerCircle(p113, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10001,
		Image = "rbxassetid://8573813156",
		ImageColor3 = color328,
		Size = v564,
		Position = uDim2 + uDim217
	})

	spawn(function()
		local color329 = Color3.fromRGB(255, 255, 255)

		effectsServicePulse(p113, v565, {
			Time = 0.5,
			FlashTime = 0.2,
			Color = { color329, Color3.fromRGB(166, 37, 37) },
			Transparency = 0.1
		})
	end)
	animation.AnimateAsync(v565, { ImageTransparency = 0 }, 0.5, "Out", "Linear")
	animation.AnimateAsync(v565, { Rotation = 180 }, 1.5, "Out", "Quint")

	local animationAnimate = animation.Animate
	local v567 = uDim2New(0, absoluteSize.Y, 0, absoluteSize.Y)

	animationAnimate(v565, { Size = v567 }, 1.5, "Out", "Quint")
	p114.Visible = true
	v565:Destroy()
	audioServicePlaySound("GiantLaser")
	animation.Animate(p114, { Size = v559, Position = v557 }, 0.1, "Out", "Quint")
	spawn(function()
		effectsService.ShakeBattle(p113, 0.3, 0.05)
	end)
	animation.AnimateAsync(v558, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
end
function module.FloralSummon(p117, p118, _, _)
	audioService.DimSongs()

	local v572 = p118.Size
	local v573 = p118.Position
	local anchorPoint = p118.AnchorPoint

	p118.AnchorPoint = Vector2.new(0.5, 0.5)

	local v575 = UDim2.fromOffset(v572.X.Offset / 2, v572.Y.Offset / 2)

	p118.Position = v573 + v575
	effectsServiceSetCardZIndex(p118, p118.ZIndex + 99999)

	local color3 = Color3.fromRGB(21, 63, 36)
	local n1 = p118.ZIndex - 1
	local v578 = uDim2New(1, 0, 2, 0)
	local v579 = uDim2New(0.5, 0, 0.5, 0)
	local v580 = effectsServiceNewerCircle(p117, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v578,
		Position = v579
	})

	audioServicePlaySound("Angelic Humming")
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local v1562 = UDim2.fromOffset(v572.X.Offset * 1.8, v572.Y.Offset * 1.8)

		animationAnimateAsync(p118, { Size = v1562 }, 1.1, "InOut", "Sine")
		task.wait(1.1)
		animation.AnimateAsync(p118, { Size = v572 }, 0.4, "InOut", "Sine")
	end)
	task.spawn(function()
		animation.AnimateAsync(v580, { BackgroundTransparency = 0.35 }, 1.5, "Out", "Quad")
	end)
	audioServicePlaySound("Wind")

	local t20: {[any]: any} = { "rbxassetid://71117491608621" }
	local t21: {[any]: any} = { "rbxassetid://71117491608621" }

	for _ = 1, 10 do
		for _ = 1, 2 do
			task.spawn(function()
				local randomNumber = math.random(80, 240)
				local randomNumber19 = math.random(18, 30)
				local randomNumber20 = math.random(0, 2)
				local v1566 = math.random() < 0.15 and t21 or t20
				local randomNumber21 = math.random(1, #v1566)
				local v1568 = v1566[randomNumber21]
				local randomNumber22 = math.random(0, p117.Parent.AbsoluteSize.Y)
				local n1 = v572.X.Offset / 2.5 * (randomNumber / 100)
				local n2 = p118.ZIndex + 100000 + randomNumber20
				local v1572 = UDim2.fromOffset(n1, n1)
				local v1573 = UDim2.fromOffset(p117.Parent.AbsoluteSize.X, randomNumber22)
				local color330 = Color3.fromRGB(255, 246, 143)
				local randomNumber23 = math.random(0, 360)
				local randomNumber24 = math.random(10, 35)
				local v1577 = effectsServiceNewerCircle(p117, {
					Image = v1568,
					ZIndex = n2,
					Size = v1572,
					Position = v1573,
					ImageColor3 = color330,
					Rotation = randomNumber23,
					ImageTransparency = randomNumber24 / 100
				})
				local randomNumber25 = math.random(-120, 120)
				local randomNumber26 = math.random(p117.Parent.AbsoluteSize.X, p117.Parent.AbsoluteSize.X * 1.6)
				local animationAnimate = animation.Animate
				local v1581 = v1577.Position
				local v1582 = UDim2.fromOffset(randomNumber26, randomNumber25)
				local rotation = v1577.Rotation
				local randomNumber27 = math.random(180, 720)

				animationAnimate(v1577, {
					ImageTransparency = 1,
					Position = v1581 - v1582,
					Rotation = rotation + randomNumber27
				}, randomNumber19 / 10, "Out", "Quad")
				v1577:Destroy()
			end)
		end

		task.wait(0.1)
	end

	task.spawn(function()
		task.wait(1.1)
		animation.Animate(v580, { BackgroundTransparency = 1 }, 0.2, "Out", "Quad")
		v580:Destroy()
	end)
	task.wait(1.3)
	p118.AnchorPoint = anchorPoint
	p118.Position = v573
	effectsServiceSetCardZIndex(p118, p118.ZIndex - 99999)
	audioService.UndimSongs()
end
function module.SummonTRex(p121, p122, p123, p124)
	audioService.DimSongs()

	local s1 = if p124 == "" then "Enemy" else if p124 == "Enemy" then "" else nil
	local zIndex = p122.ZIndex
	local absolutePosition = p122.AbsolutePosition
	local absoluteSize = p122.AbsoluteSize
	local y = p121.Parent.AbsoluteSize.Y
	local n1: number = if p122.AbsolutePosition.Y > y / 2 then 1 else 0

	p122.Position = UDim2.new(0, p122.AbsolutePosition.X, 0, y * n1 + p122.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	p122.Rotation = -600

	local color3 = Color3.fromRGB(43, 23, 0)
	local n2 = p122.ZIndex + 99998
	local v597 = uDim2New(1, 0, 2, 0)
	local v598 = uDim2New(0.5, 0, 0.5, 0)
	local v599 = effectsServiceNewerCircle(p121, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v597,
		Position = v598
	})

	animation.AnimateAsync(v599, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p122, p122.ZIndex + 99999)
	audioServicePlaySound("DragonRoar")
	animation.AnimateAsync(p122, {
		Rotation = 0,
		Position = UDim2.fromOffset(absolutePosition.X - absoluteSize.X / 2, absolutePosition.Y + p122.AbsoluteSize.Y / 2 * (if n1 == 1 then -0.5 else -1)),
		Size = UDim2.fromOffset(absoluteSize.X * 2, absoluteSize.Y * 2)
	}, 0.7, "Out", "Quint")
	task.wait(0.5)

	local animationAnimateAsync = animation.AnimateAsync
	local color331 = Color3.fromRGB(224, 236, 0)

	animationAnimateAsync(v599, { BackgroundTransparency = 1, BackgroundColor3 = color331 }, 1, "Out", "Quart")
	audioServicePlaySound("Swoosh")
	task.spawn(function()
		module.SelfPulseGreen(p121, p122, p123, nil, nil)
	end)

	local animationAnimate = animation.Animate
	local v603 = UDim2.fromOffset(absolutePosition.X + absoluteSize.X * 0.05, absolutePosition.Y + absoluteSize.Y * 0.05)
	local v604 = UDim2.fromOffset(absoluteSize.X * 0.9, absoluteSize.Y * 0.9)

	animationAnimate(p122, { Rotation = 0, Position = v603, Size = v604 }, 0.4, "In", "Quint")
	effectsServiceSetCardZIndex(p122, 1)
	task.spawn(function()
		for _, v in pairs(p122.Parent:GetChildren()) do
			if v ~= p122 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1835 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1836 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
					local randomNumber = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1835, Size = v1836, Rotation = randomNumber }, 0.4, "Out", "Quint")
					task.wait(0.25)

					local animationAnimate = animation.Animate

					v1836 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1835 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1836, Size = v1835 }, 0.4, "In", "Quint")
				end)
			end
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p122.Parent.Parent[s1 .. "Field"])) do
			local vAbsolutePosition = v.AbsolutePosition
			local vAbsoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1840 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
				local v1841 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
				local randomNumber = math.random(-15, 15)

				animationAnimateAsync(v, { Position = v1840, Size = v1841, Rotation = randomNumber }, 0.4, "Out", "Quint")
				task.wait(0.25)

				local animateAsync = animation.AnimateAsync

				v1841 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
				v1840 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
				animateAsync(v, { Rotation = 0, Position = v1841, Size = v1840 }, 0.4, "In", "Quint")
			end)
		end
	end)
	audioService.PlaySound("LargeImpact")
	audioService.UndimSongs()
	effectsService.ShakeBattleSync(p121, 0.15, 0.025)
	task.wait(1.1)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p122.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.5, 0.002)
			end)
		end
	end)

	local animateAsync = animation.AnimateAsync

	v604 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	v603 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animateAsync(p122, { Position = v604, Size = v603 }, 0.2, "Out", "Quart")
	task.wait(0.9)
	v599:Destroy()
	effectsServiceSetCardZIndex(p122, zIndex)
end
function module.SummonHallowPatriarch(p125, p126, p127, p128)
	audioService.DimSongs()

	local s1 = if p128 == "" then "Enemy" else if p128 == "Enemy" then "" else nil
	local zIndex = p126.ZIndex
	local absolutePosition = p126.AbsolutePosition
	local absoluteSize = p126.AbsoluteSize
	local y = p125.Parent.AbsoluteSize.Y
	local n1: number = if p126.AbsolutePosition.Y > y / 2 then 1 else 0

	p126.Position = UDim2.new(0, p126.AbsolutePosition.X, 0, y * n1 + p126.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	p126.Rotation = -720

	local color3 = Color3.fromRGB(43, 23, 0)
	local n2 = p126.ZIndex + 99998
	local v618 = uDim2New(1, 0, 2, 0)
	local v619 = uDim2New(0.5, 0, 0.5, 0)
	local v620 = effectsServiceNewerCircle(p125, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v618,
		Position = v619
	})

	animation.AnimateAsync(v620, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p126, p126.ZIndex + 99999)
	audioServicePlaySound("HallowLaugh2")
	animation.AnimateAsync(p126, {
		Rotation = 0,
		Position = UDim2.fromOffset(absolutePosition.X - absoluteSize.X / 2, absolutePosition.Y + p126.AbsoluteSize.Y / 2 * (if n1 == 1 then -0.5 else -1)),
		Size = UDim2.fromOffset(absoluteSize.X * 2, absoluteSize.Y * 2)
	}, 0.6, "Out", "Quint")
	task.wait(0.4)

	local animationAnimateAsync = animation.AnimateAsync
	local color332 = Color3.fromRGB(224, 236, 0)

	animationAnimateAsync(v620, { BackgroundTransparency = 1, BackgroundColor3 = color332 }, 1, "Out", "Quart")
	audioServicePlaySound("Swoosh")
	task.spawn(function()
		module.SelfPulseYellow(p125, p126, p127, nil, nil)
	end)

	local animationAnimate = animation.Animate
	local v624 = UDim2.fromOffset(absolutePosition.X + absoluteSize.X * 0.05, absolutePosition.Y + absoluteSize.Y * 0.05)
	local v625 = UDim2.fromOffset(absoluteSize.X * 0.9, absoluteSize.Y * 0.9)

	animationAnimate(p126, { Rotation = 0, Position = v624, Size = v625 }, 0.35, "In", "Quint")
	effectsServiceSetCardZIndex(p126, 1)
	task.spawn(function()
		for _, v in pairs(p126.Parent:GetChildren()) do
			if v ~= p126 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1845 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1846 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
					local randomNumber = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1845, Size = v1846, Rotation = randomNumber }, 0.3, "Out", "Quint")
					task.wait(0.25)

					local animationAnimate = animation.Animate

					v1846 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1845 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1846, Size = v1845 }, 0.3, "In", "Quint")
				end)
			end
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p126.Parent.Parent[s1 .. "Field"])) do
			local vAbsolutePosition = v.AbsolutePosition
			local vAbsoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1850 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
				local v1851 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
				local randomNumber = math.random(-15, 15)

				animationAnimateAsync(v, { Position = v1850, Size = v1851, Rotation = randomNumber }, 0.3, "Out", "Quint")
				task.wait(0.25)

				local animateAsync = animation.AnimateAsync

				v1851 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
				v1850 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
				animateAsync(v, { Rotation = 0, Position = v1851, Size = v1850 }, 0.3, "In", "Quint")
			end)
		end
	end)
	audioService.PlaySound("LargeImpact")
	audioService.PlaySound("PreSlash")
	effectsService.ShakeBattleSync(p125, 0.15, 0.025)
	task.wait(1.1)
	audioService.UndimSongs()
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p126.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.75, 0.002)
			end)
		end
	end)

	local animateAsync = animation.AnimateAsync

	v625 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	v624 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animateAsync(p126, { Position = v625, Size = v624 }, 0.2, "Out", "Quart")
	task.wait(0.8)
	v620:Destroy()
	effectsServiceSetCardZIndex(p126, zIndex)
end
function module.KingRichardSummon(p129, p130, p131, p132)
	effectsServicePreloadTech(p129, { "rbxassetid://58454662" })
	audioService.DimSongs()

	local color3 = Color3.fromRGB(31, 8, 8)
	local n1 = p130.ZIndex + 99998
	local v633 = uDim2New(1, 0, 2, 0)
	local v634 = uDim2New(0.5, 0, 0.5, 0)
	local v635 = effectsServiceNewerCircle(p129, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v633,
		Position = v634
	})
	local color333 = Color3.fromRGB(0, 0, 0)
	local n2 = p130.ZIndex + 99999
	local v638 = UDim2.fromOffset(p130.AbsoluteSize.Y * 4, p130.AbsoluteSize.Y * 4)
	local uDim2 = UDim2.new(0, p130.AbsolutePosition.X, 0, p130.AbsolutePosition.Y)
	local uDim218 = UDim2.new(0, p130.AbsoluteSize.X * 0.5, 0, p130.AbsoluteSize.Y * 0.5)
	local v641 = effectsServiceNewerCircle(p129, {
		Image = "rbxassetid://58454662",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color333,
		ZIndex = n2,
		Size = v638,
		Position = uDim2 + uDim218
	})
	local v642 = p130.Position

	v634 = p130.Size

	local uDim219 = UDim2.new(0, p130.AbsolutePosition.X, 0, p130.AbsolutePosition.Y)
	local uDim220 = UDim2.new(0, p130.AbsoluteSize.X * 0.5, 0, p130.AbsoluteSize.Y * 0.5)

	p130.Position = uDim219 + uDim220
	p130.Size = UDim2.fromOffset(0, 0)
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(v641, { ImageTransparency = 0 }, 0.25, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v646 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v641, { Size = v646 }, 0.5, "In", "Quart")
	p130.Visible = false
	animation.AnimateAsync(v635, { BackgroundTransparency = 0.3 }, 0.25, "Out", "Quint")
	task.wait(0.5)
	audioServicePlaySound("RedcliffYell")
	p130.Visible = true
	audioServicePlaySound("RedcliffCheer")
	effectsServiceSetCardZIndex(p130, p130.ZIndex + 99999)
	animation.AnimateAsync(p130, { Size = v634, Position = v642 }, 1, "Out", "Quart")
	effectsService.ShakeBattleSync(p129, 0.5, 0.03)

	for i = 1, 4 do
		task.spawn(function()
			local n1 = p130.ZIndex + 100001
			local v1606 = UDim2.fromOffset(p130.AbsoluteSize.X, p130.AbsoluteSize.X)
			local v1607 = p130
			local uDim221 = UDim2.new(0, v1607.AbsolutePosition.X, 0, v1607.AbsolutePosition.Y)
			local uDim222 = UDim2.new(0, v1607.AbsoluteSize.X * 0.5, 0, v1607.AbsoluteSize.Y * 0.5)
			local randomNumber = math.random(0, 360)
			local v1611 = effectsServiceNewerCircle(p129, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v1606,
				Position = uDim221 + uDim222,
				Rotation = randomNumber
			})

			v1607 = p130.ZIndex + 100001

			local v1612 = UDim2.fromOffset(p130.AbsoluteSize.X, p130.AbsoluteSize.X)
			local v1613 = p130
			local uDim223 = UDim2.new(0, v1613.AbsolutePosition.X, 0, v1613.AbsolutePosition.Y)
			local uDim224 = UDim2.new(0, v1613.AbsoluteSize.X * 0.5, 0, v1613.AbsoluteSize.Y * 0.5)
			local color334 = Color3.fromRGB(255, 0, 4)
			local v1617 = effectsServiceNewerCircle(p129, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v1607,
				Size = v1612,
				Position = uDim223 + uDim224,
				Rotation = i * 90 + 180,
				ImageColor3 = color334
			})

			v1613 = p130.ZIndex + 100001

			local v1618 = UDim2.fromOffset(p130.AbsoluteSize.X, p130.AbsoluteSize.X)
			local v1619 = p130
			local uDim225 = UDim2.new(0, v1619.AbsolutePosition.X, 0, v1619.AbsolutePosition.Y)
			local uDim226 = UDim2.new(0, v1619.AbsoluteSize.X * 0.5, 0, v1619.AbsoluteSize.Y * 0.5)
			local color335 = Color3.fromRGB(100, 15, 17)
			local v1623 = effectsServiceNewerCircle(p129, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v1613,
				Size = v1618,
				Position = uDim225 + uDim226,
				ImageColor3 = color335,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v1619 = UDim2.fromOffset(p130.AbsoluteSize.Y * 1.8, p130.AbsoluteSize.Y * 1.8)
			animationAnimateAsync(v1611, { Size = v1619, Rotation = v1611.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v1619 = UDim2.fromOffset(p130.AbsoluteSize.Y * 1.3, p130.AbsoluteSize.Y * 1.3)
			animateAsync(v1617, { Size = v1619, Rotation = v1617.Rotation + 360 }, 1, "Out", "Quint")

			local v1626 = animation.AnimateAsync

			v1619 = UDim2.fromOffset(p130.AbsoluteSize.Y * 1.3, p130.AbsoluteSize.Y * 1.3)
			v1626(v1623, { Size = v1619, Rotation = v1623.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v1611, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v1617, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v1623, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v1611:Destroy()
				v1617:Destroy()
				v1623:Destroy()
			end)
		end)
		task.wait(0.2)
	end

	audioService.UndimSongs()
	task.spawn(function()
		audioServicePlaySound("unsheath")

		local color336 = Color3.fromRGB(255, 255, 255)
		local color337 = Color3.fromRGB(166, 37, 37)

		effectsServiceFlagSelf(p129, p130, p131, p132, "rbxassetid://8652408406", 1.2, color336, color337, 360)
		animation.Animate(v635, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		v635:Destroy()
		effectsServiceSetCardZIndex(p130, p130.ZIndex - 99999)
	end)
end
function module.OverseerGodhandSummon(p133, p134, _, _)
	local color3 = Color3.fromRGB(14, 25, 16)
	local n1 = p134.ZIndex + 99998
	local v654 = uDim2New(1, 0, 2, 0)
	local v655 = uDim2New(0.5, 0, 0.5, 0)
	local v656 = effectsServiceNewerCircle(p133, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v654,
		Position = v655
	})

	effectsServiceSetCardZIndex(p134, p134.ZIndex + 100001)

	local v657 = p134.Position

	p134.Rotation = -90
	p134.Position = UDim2.new(1, p134.AbsoluteSize.X * 2, 0, -p134.AbsoluteSize.Y * 2)
	p134.Visible = true
	task.spawn(function()
		animation.AnimateAsync(v656, { BackgroundTransparency = 0.3 }, 0.3, "Out", "Quint")
		animation.AnimateAsync(p134, { Rotation = -360, Position = v657 }, 1, "InOut", "Quart")
		task.wait(0.2)
		audioServicePlaySound("Woosh")
		task.wait(0.3)
		effectsService.ShakeBattleSync(p133, 0.3, 0.03)
		task.wait(0.25)
		audioServicePlaySound("Punch Kit Beefy Hit 1 (SFX)")
		animation.AnimateAsync(v656, { BackgroundTransparency = 1 }, 0.3, "Out", "Quint")
		task.wait(0.1)
		audioServicePlaySound("StalkerScream1")
		effectsService.ShakeSync(p134, p134.Position, 0.3, 0.25)
		p134.Rotation = 0
		effectsServiceSetCardZIndex(p134, p134.ZIndex - 100001)
		task.wait(0.15)
		v656:Destroy()
		task.wait(0.5)
	end)
	task.wait(0.5)
end
function module.SummonDeathknight(p137, p138, p139, p140)
	audioService.DimSongs()
	wait(0.2)
	audioServicePlaySound("KorbloxDeathknight")

	local s1 = if p140 == "" then "Enemy" else if p140 == "Enemy" then "" else nil
	local zIndex = p138.ZIndex
	local absolutePosition = p138.AbsolutePosition
	local absoluteSize = p138.AbsoluteSize
	local y = p137.Parent.AbsoluteSize.Y
	local n1: number = if p138.AbsolutePosition.Y > y / 2 then 1 else 0

	p138.Position = UDim2.new(0, p138.AbsolutePosition.X, 0, y * n1 + p138.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	p138.Rotation = -360

	local color3 = Color3.fromRGB(5, 5, 43)
	local n2 = p138.ZIndex + 99998
	local v670 = uDim2New(1, 0, 2, 0)
	local v671 = uDim2New(0.5, 0, 0.5, 0)
	local v672 = effectsServiceNewerCircle(p137, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v670,
		Position = v671
	})

	animation.AnimateAsync(v672, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p138, p138.ZIndex + 99999)
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(p138, {
		Rotation = 0,
		Position = UDim2.fromOffset(absolutePosition.X - absoluteSize.X / 2, absolutePosition.Y + p138.AbsoluteSize.Y / 2 * (if n1 == 1 then -0.5 else -1)),
		Size = UDim2.fromOffset(absoluteSize.X * 2, absoluteSize.Y * 2)
	}, 0.7, "Out", "Quint")
	task.wait(0.5)

	local animationAnimateAsync = animation.AnimateAsync
	local color338 = Color3.fromRGB(65, 236, 27)

	animationAnimateAsync(v672, { BackgroundTransparency = 1, BackgroundColor3 = color338 }, 1, "Out", "Quart")
	audioServicePlaySound("Swoosh")
	task.spawn(function()
		module.SelfPulseBlue(p137, p138, p139, nil, nil)
	end)

	local animationAnimate = animation.Animate
	local v676 = UDim2.fromOffset(absolutePosition.X + absoluteSize.X * 0.05, absolutePosition.Y + absoluteSize.Y * 0.05)
	local v677 = UDim2.fromOffset(absoluteSize.X * 0.9, absoluteSize.Y * 0.9)

	animationAnimate(p138, { Rotation = 0, Position = v676, Size = v677 }, 0.4, "In", "Quint")
	effectsServiceSetCardZIndex(p138, 1)
	task.spawn(function()
		for _, v in pairs(p138.Parent:GetChildren()) do
			if v ~= p138 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1855 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1856 = UDim2.fromOffset(vAbsoluteSize.X * 1.35, vAbsoluteSize.Y * 1.35)
					local randomNumber = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1855, Size = v1856, Rotation = randomNumber }, 0.3, "Out", "Quint")
					task.wait(0.25)

					local animationAnimate = animation.Animate

					v1856 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1855 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1856, Size = v1855 }, 0.3, "In", "Quint")
				end)
			end
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p138.Parent.Parent[s1 .. "Field"])) do
			local vAbsolutePosition = v.AbsolutePosition
			local vAbsoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1860 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
				local v1861 = UDim2.fromOffset(vAbsoluteSize.X * 1.35, vAbsoluteSize.Y * 1.35)
				local randomNumber = math.random(-15, 15)

				animationAnimateAsync(v, { Position = v1860, Size = v1861, Rotation = randomNumber }, 0.3, "Out", "Quint")
				task.wait(0.25)

				local animateAsync = animation.AnimateAsync

				v1861 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
				v1860 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
				animateAsync(v, { Rotation = 0, Position = v1861, Size = v1860 }, 0.3, "In", "Quint")
			end)
		end
	end)
	audioService.PlaySound("LargeImpact")
	audioService.UndimSongs()
	effectsService.ShakeBattleSync(p137, 0.15, 0.025)
	task.wait(0.5)
	audioService.PlaySound("Korblox")
	task.wait(0.5)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p138.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1, 0.002)
			end)
		end
	end)

	local animateAsync = animation.AnimateAsync

	v677 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	v676 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animateAsync(p138, { Position = v677, Size = v676 }, 0.2, "Out", "Quart")
	task.wait(0.8)
	v672:Destroy()
	effectsServiceSetCardZIndex(p138, zIndex)
end
function module.SummonDogeDoge(p141, p142, p143, _)
	local zIndex = p142.ZIndex
	local absolutePosition = p142.AbsolutePosition
	local absoluteSize = p142.AbsoluteSize
	local y = p141.Parent.AbsoluteSize.Y
	local n1: number = if p142.AbsolutePosition.Y > y / 2 then 1 else 0

	p142.Position = UDim2.new(0, p142.AbsolutePosition.X, 0, y * n1 + p142.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	audioServiceDimSongs()
	audioServicePlaySound("ApplauseClapping")
	audioServicePlaySound("RoyalEntrance")

	local color3 = Color3.fromRGB(129, 97, 0)
	local n2 = p142.ZIndex + 99998
	local v690 = uDim2New(1, 0, 2, 0)
	local v691 = uDim2New(0.5, 0, 0.5, 0)
	local v692 = effectsServiceNewerCircle(p141, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v690,
		Position = v691
	})

	animation.AnimateAsync(v692, { BackgroundTransparency = 0.5 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p142, p142.ZIndex + 99999)

	local animationAnimate = animation.Animate
	local v694 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimate(p142, { Position = v694 }, 1.2, "Out", "Quad")
	animation.Animate(v692, { BackgroundTransparency = 1 }, 0.3, "Out", "Quart")
	module.DogeDogeBark(p141, p142, p143, nil, nil)
	task.wait(0.2)
	audioServiceUndimSongs()
	v692:Destroy()
	effectsServiceSetCardZIndex(p142, p142.ZIndex - 99999)
end
function module.ApocSummon(p145, p146, _, _)
	local color3 = Color3.fromRGB(66, 124, 76)

	SummonFadeInEffect(p145, p146, color3, { "Korblox", "ApocSummon" })
end
function module.MidasSummon(p149, p150, _, _)
	local color3 = Color3.fromRGB(147, 1, 1)

	SummonFadeInEffect(p149, p150, color3, { "Korblox", "BigDoorOpen" })
end
function module.XhartyrSummon(p153, p154, _, _)
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p154.ZIndex + 100000
	local v711 = uDim2New(1, 0, 2, 0)
	local v712 = uDim2New(0.5, 0, 0.5, 0)
	local v713 = effectsServiceNewerCircle(p153, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v711,
		Position = v712
	})

	p154.Visible = false
	animation.AnimateAsync(v713, { BackgroundTransparency = 0.2 }, 0.3, "Out", "Quint")

	local t22: {[any]: any} = {}

	for _ = 1, 4 do
		local color339 = Color3.fromRGB(255, 255, 255)
		local n2 = p154.ZIndex + 100001
		local v718 = uDim2New(2, 0, 0, p154.AbsoluteSize.X / 4)
		local uDim2 = UDim2.new(0, p154.AbsolutePosition.X, 0, p154.AbsolutePosition.Y)
		local uDim227 = UDim2.new(0, p154.AbsoluteSize.X * 0.5, 0, p154.AbsoluteSize.Y * 0.5)
		local uDim2FromOffset = UDim2.fromOffset
		local randomNumber = math.random(-10, 10)
		local v723 = uDim2FromOffset(randomNumber, 0)
		local randomNumber28 = math.random(-30, 30)
		local v725 = effectsServiceNewerCircle(p153, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			BackgroundColor3 = color339,
			ZIndex = n2,
			Size = v718,
			Position = uDim2 + uDim227 + v723,
			Rotation = randomNumber28
		})

		table.insert(t22, v725)

		local animationAnimateAsync = animation.AnimateAsync
		local v727 = uDim2New(2, 0, 0, p154.AbsoluteSize.X / 32)

		animationAnimateAsync(v725, { Size = v727 }, 0.3, "Out", "Quint")
		audioServicePlaySound("Slashes")
		task.wait(0.1)
	end

	task.wait(0.1)

	for i = 1, 4 do
		animation.AnimateAsync(t22[i], { Rotation = 135 }, 1.2, "In", "Exponential")
	end

	task.wait(0.4)
	audioServicePlaySound("chargein")
	task.wait(0.8)
	audioServicePlaySound("dbzswordout")

	for i = 1, 4 do
		t22[i].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		v713.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v713.BackgroundTransparency = 0
	end

	task.wait(0.2)

	for i = 1, 4 do
		t22[i]:Destroy()
	end

	v713:Destroy()
	p154.Visible = true

	local n3 = p154.ZIndex + 100001
	local v732 = UDim2.fromOffset(p154.AbsoluteSize.X, p154.AbsoluteSize.X)
	local uDim228 = UDim2.new(0, p154.AbsolutePosition.X, 0, p154.AbsolutePosition.Y)
	local uDim229 = UDim2.new(0, p154.AbsoluteSize.X * 0.5, 0, p154.AbsoluteSize.Y * 0.5)
	local v735 = effectsServiceNewerCircle(p153, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://3916186365",
		ZIndex = n3,
		Size = v732,
		Position = uDim228 + uDim229
	})

	effectsService.ShakeBattleSync(p153, 0.5, 0.03)

	local animateAsync = animation.AnimateAsync
	local v737 = UDim2.fromOffset(p154.AbsoluteSize.Y * 1.5, p154.AbsoluteSize.Y * 1.5)

	animateAsync(v735, { Rotation = 360, Size = v737 }, 1, "Out", "Quint")
	task.wait(0.5)
	animation.AnimateAsync(v735, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v735:Destroy()
	end)
end
function module.SummonPtenda(p157, p158, p159, _)
	local color3 = Color3.fromRGB(30, 52, 34)
	local v743 = uDim2New(1, 0, 2, 0)
	local v744 = uDim2New(0.5, 0, 0.5, 0)
	local v745 = effectsServiceNewerCircle(p157, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		Size = v743,
		Position = v744
	})

	animation.AnimateAsync(v745, { BackgroundTransparency = 0.6 }, 2, "Out", "Quint")

	local v746 = p158.Size
	local absoluteSize = p158.AbsoluteSize

	v744 = p158.Position

	local uDim2 = UDim2.new(0, p158.AbsolutePosition.X, 0, p158.AbsolutePosition.Y)
	local uDim230 = UDim2.new(0, p158.AbsoluteSize.X * 0.5, 0, p158.AbsoluteSize.Y * 0.5)
	local n1 = uDim2 + uDim230

	p158.Visible = false
	p158.Size = uDim2New(0, 0, 0, 0)
	p158.Position = n1
	p158.AnchorPoint = Vector2.new(0.5, 0.5)

	local color340 = Color3.fromRGB(66, 124, 76)
	local v752 = uDim2New(0, absoluteSize.Y * 1.5, 0, absoluteSize.Y * 1.5)
	local v753 = effectsServiceNewerCircle(p157, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10002,
		Image = "rbxassetid://8571751982",
		ImageColor3 = color340,
		Size = v752,
		Position = n1
	})

	spawn(function()
		wait(0.6)
		audioServicePlaySound("Entry")
	end)
	animation.AnimateAsync(v753, { ImageTransparency = 0 }, 0.5, "Out", "Linear")
	animation.AnimateAsync(v753, { Rotation = 480 }, 1.2, "In", "Quint")

	local animationAnimate = animation.Animate
	local v755 = uDim2New(0, absoluteSize.Y * 0.1, 0, absoluteSize.Y * 0.1)

	animationAnimate(v753, { Size = v755 }, 1.2, "In", "Quint")
	v753:Destroy()
	p158.Visible = true
	animation.Animate(p158, { Size = v746, Position = v744, AnchorPoint = Vector2.new(0, 0) }, 0.65, "Out", "Quint")
	spawn(function()
		wait(0.1)
		module.SelfPulseGreen(p157, p158, p159, nil, nil)
	end)
	animation.AnimateAsync(v745, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
	effectsService.ShakeBattle(p157, 0.3, 0.025)
end
function module.SummonIris(p161, p162, _, _)
	local t23: {[any]: any} = { Color3.fromRGB(223, 223, 223), Color3.fromRGB(187, 217, 217) }
	local v761 = UDim2.fromOffset(p162.AbsoluteSize.X * 0.4, p162.AbsoluteSize.X * 0.4)

	CinematicOuterSummon({
		spinAmount = 720,
		entryRotation = -180,
		holder = p161,
		origin = p162,
		particleProps = {
			Projectile = "rbxassetid://243728206",
			Strength = 25,
			Speed = 0.3,
			EasingStyle = "Quad",
			Time = 2.1,
			Color = t23,
			Size = v761,
			Range = p162
		}
	})
end
function module.ChairmanSummon(p165, p166, _, _)
	p166.ImageTransparency = 1

	local color3 = Color3.fromRGB(255, 255, 255)
	local n1 = p166.ZIndex + 1000001
	local v768 = UDim2.fromOffset(0, p166.AbsoluteSize.Y * 1.2)
	local v769 = UDim2.fromOffset(p166.AbsolutePosition.X + p166.AbsoluteSize.X + p166.AbsoluteSize.X, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y / 2)
	local v770 = effectsServiceNewerCircle(p165, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 0,
		Image = "rbxassetid://679750007",
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v768,
		Position = v769
	})
	local color341 = Color3.fromRGB(255, 255, 255)
	local image = p166.Image
	local v773 = UDim2.fromOffset(0, p166.AbsoluteSize.Y)
	local v774 = UDim2.fromOffset(p166.AbsolutePosition.X + p166.AbsoluteSize.X * 1.5, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y / 2)
	local v775 = effectsServiceNewerCircle(p165, {
		BackgroundTransparency = 1,
		ZIndex = 10001,
		Rotation = 0,
		ImageColor3 = color341,
		Image = image,
		Size = v773,
		Position = v774
	})
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	v769 = { Color3.fromRGB(217, 217, 217), Color3.fromRGB(182, 182, 182) }
	v768 = UDim2.fromOffset(p166.AbsoluteSize.Y / 3, p166.AbsoluteSize.Y / 3)

	local t24: {[any]: any} = {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = v769,
		Size = v768
	}
	local v778 = UDim2.fromOffset(0, 0)
	local v779 = UDim2.fromOffset(p166.AbsolutePosition.X + p166.AbsoluteSize.X / 4, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y)
	local v780 = effectsServiceNewerCircle(p165, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v778,
		Position = v779
	})
	local v781 = UDim2.fromOffset(p166.AbsoluteSize.Y / 1.5, p166.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, p166.AbsolutePosition.X, 0, p166.AbsolutePosition.Y)
	local uDim231 = UDim2.new(0, p166.AbsoluteSize.X * 0.5, 0, p166.AbsoluteSize.Y * 0.5)
	local v784 = UDim2.fromOffset(p166.AbsoluteSize.X * 1.1, -p166.AbsoluteSize.Y / 2)
	local v785 = effectsServiceNewerCircle(p165, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v781,
		Position = uDim2 + uDim231 - v784
	})

	audioServicePlaySound("DoorOpen")

	local animationAnimateAsync = animation.AnimateAsync
	local v787 = UDim2.fromOffset(p166.AbsoluteSize.X * 2.5, p166.AbsoluteSize.Y * 1.2)

	animationAnimateAsync(v770, { Size = v787 }, 1.5, "Out", "Quint")
	task.wait(0.5)

	if math.random(1, 2) == 1 then
		audioServicePlaySound("JevilLaugh")
	else
		audioServicePlaySound("JevilChuckle")
	end

	local animateAsync = animation.AnimateAsync

	v787 = UDim2.fromOffset(p166.AbsoluteSize.X, p166.AbsoluteSize.Y)

	local v789 = UDim2.fromOffset(p166.AbsolutePosition.X + p166.AbsoluteSize.X / 2, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y / 2)

	animateAsync(v775, { Rotation = 30, Size = v787, Position = v789 }, 1, "Out", "Quint")
	task.wait(0.25)
	audioServicePlaySound("TireScreech")
	task.spawn(function()
		effectsServiceBreath(p165, v780, v785, t24)
	end)
	task.wait(0.75)
	animation.AnimateAsync(v775, { Rotation = 0 }, 0.25, "Out", "Quint")
	task.wait(0.2)
	audioServicePlaySound("DoorClose")

	local v790 = animation.AnimateAsync

	v789 = UDim2.fromOffset(0, p166.AbsoluteSize.Y * 1.2)
	v787 = UDim2.fromOffset(p166.AbsolutePosition.X + p166.AbsoluteSize.X + p166.AbsoluteSize.X / 2, p166.AbsolutePosition.Y + p166.AbsoluteSize.Y / 2)
	v790(v770, { Size = v789, Position = v787 }, 1, "Out", "Quint")
	task.wait(1)
	p166.ImageTransparency = 0
	v775:Destroy()
	v770:Destroy()
end
function module.McKaylaSummon(p169, p170)
	local color3 = Color3.fromRGB(26, 7, 7)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color342 = Color3.fromRGB(240, 210, 92)

	ElementalEntrance(p169, p170, {
		tint = color3,
		sounds = { "fire ambience", "FireBreathLong", "crowd2" },
		projectile = effectsServiceBreathimagesFire,
		breathColors = { color342, Color3.fromRGB(217, 71, 22) },
		pointerOffset = p169.Parent.BattleNew.AbsoluteSize.X / 7
	})
end
function module.KingrinSummon(p171, p172, _, p174)
	local s1 = if p174 == "" then "Enemy" else if p174 == "Enemy" then "" else nil
	local zIndex = p172.ZIndex
	local absolutePosition = p172.AbsolutePosition
	local absoluteSize = p172.AbsoluteSize
	local y = p171.Parent.AbsoluteSize.Y
	local n1: number = if p172.AbsolutePosition.Y > y / 2 then 1 else 0

	p172.Position = UDim2.new(0, p172.AbsolutePosition.X, 0, y * n1 + p172.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	p172.Rotation = -180

	local color3 = Color3.fromRGB(43, 12, 12)
	local n2 = p172.ZIndex + 99998
	local v808 = uDim2New(1, 0, 2, 0)
	local v809 = uDim2New(0.5, 0, 0.5, 0)
	local v810 = effectsServiceNewerCircle(p171, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v808,
		Position = v809
	})

	animation.AnimateAsync(v810, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p172, p172.ZIndex + 99999)
	audioServicePlaySound("Laughter 2")
	animation.AnimateAsync(p172, {
		Rotation = 0,
		Position = UDim2.fromOffset(absolutePosition.X - absoluteSize.X / 2, absolutePosition.Y + p172.AbsoluteSize.Y / 2 * (if n1 == 1 then -1 else -1)),
		Size = UDim2.fromOffset(absoluteSize.X * 2, absoluteSize.Y * 2)
	}, 0.9, "Out", "Quint")
	task.wait(0.75)

	local animationAnimateAsync = animation.AnimateAsync
	local color343 = Color3.fromRGB(236, 192, 61)

	animationAnimateAsync(v810, { BackgroundTransparency = 1, BackgroundColor3 = color343 }, 1, "Out", "Quart")
	audioServicePlaySound("scan complete")

	local animationAnimate = animation.Animate
	local v814 = UDim2.fromOffset(absolutePosition.X + absoluteSize.X * 0.05, absolutePosition.Y + absoluteSize.Y * 0.05)
	local v815 = UDim2.fromOffset(absoluteSize.X * 0.9, absoluteSize.Y * 0.9)

	animationAnimate(p172, { Rotation = 0, Position = v814, Size = v815 }, 0.5, "In", "Quint")
	effectsServiceSetCardZIndex(p172, 1)
	task.spawn(function()
		for _, v in pairs(p172.Parent:GetChildren()) do
			if v ~= p172 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1865 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1866 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
					local randomNumber = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1865, Size = v1866, Rotation = randomNumber }, 0.5, "Out", "Quint")
					task.wait(0.3)

					local animationAnimate = animation.Animate

					v1866 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1865 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1866, Size = v1865 }, 0.5, "In", "Quint")
				end)
			end
		end

		for _, v in pairs(_G.__NoFaces(p172.Parent.Parent[s1 .. "Field"])) do
			local absolutePosition = v.AbsolutePosition
			local absoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1870 = UDim2.fromOffset(absolutePosition.X - absoluteSize.X * 0.25, absolutePosition.Y - absoluteSize.Y * 0.25)
				local v1871 = UDim2.fromOffset(absoluteSize.X * 1.5, absoluteSize.Y * 1.5)
				local randomNumber = math.random(-10, 10)

				animationAnimateAsync(v, { Position = v1870, Size = v1871, Rotation = randomNumber }, 0.5, "Out", "Quint")
				task.wait(0.3)

				local animationAnimate = animation.Animate

				v1871 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
				v1870 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
				animationAnimate(v, { Rotation = 0, Position = v1871, Size = v1870 }, 0.5, "In", "Quint")
			end)
		end
	end)
	audioServicePlaySound("LargeImpact")
	effectsService.ShakeBattleSync(p171, 0.2, 0.025)

	local animateAsync = animation.AnimateAsync

	v815 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	v814 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animateAsync(p172, { Position = v815, Size = v814 }, 0.2, "Out", "Quart")
	task.wait(1)
	v810:Destroy()
	effectsServiceSetCardZIndex(p172, zIndex)
end
function module.Fl00fySummon(p175, p176, _, _)
	local v821 = p176.Position
	local v822 = p176.Size
	local absoluteSize = p175.Parent.AbsoluteSize
	local color3 = Color3.fromRGB(0, 0, 0)
	local v825 = uDim2New(1, 0, 2, 0)
	local v826 = uDim2New(0.5, 0, 0.5, 0)
	local v827 = effectsServiceNewerCircle(p175, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100000,
		BackgroundColor3 = color3,
		Size = v825,
		Position = v826
	})

	effectsServiceSetCardZIndex(p176, p176.ZIndex + 99999)
	p176.Visible = false
	p176.Rotation = -360
	p176.Size = UDim2.fromOffset(p176.AbsoluteSize.X * 1.5, p176.AbsoluteSize.Y * 1.5)
	p176.Position = UDim2.fromOffset(absoluteSize.X / 2 - p176.AbsoluteSize.X / 2, absoluteSize.Y / 2 - p176.AbsoluteSize.Y / 2 - 36)
	animation.AnimateAsync(v827, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quint")

	local color344 = Color3.fromRGB(121, 32, 255)
	local v829 = uDim2New(0.5, 0, 0.5, 0)
	local color345 = Color3.fromRGB(255, 217, 3)
	local v831 = uDim2New(0.5, 0, 0.5, -36)
	local parent = effectsServiceNewerCircle(p175, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 100001,
		Image = "rbxassetid://12591294404",
		Rotation = -180,
		BackgroundColor3 = color344,
		Size = v829,
		ImageColor3 = color345,
		Position = v831,
		ImageRectSize = Vector2.new(256, 256)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = parent
	audioServicePlaySound("insanity")
	animation.AnimateAsync(parent, { ImageTransparency = 0 }, 0.4, "Out", "Quint")
	animation.AnimateAsync(parent, { Rotation = -360 }, 0.7, "Out", "Quint")
	task.spawn(function()
		task.wait(2)
		animation.AnimateAsync(parent, { Rotation = 0 }, 1.5, "InOut", "Quint")
		animation.AnimateAsync(p176, { Rotation = 10 }, 1.5, "InOut", "Quint")
		task.wait(0.75)
		p176.Visible = true
		parent.Visible = false
		audioServicePlaySound("toon beep")
		task.wait(0.5)
		animation.AnimateAsync(v827, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
		animation.Animate(p176, { Rotation = 0, Position = v821, Size = v822 }, 1, "InOut", "Quart")
		parent:Destroy()
		v827:Destroy()
	end)

	for i = 1, 16 do
		local vector2New = Vector2.new
		local floored = math.floor((i - 1) / 4)

		parent.ImageRectOffset = vector2New((i + 3) % 4 * 256, floored * 256)

		if i == 9 or i == 13 then
			audioServicePlaySound("Kerplunk.wav")
		end

		task.wait(0.08)
	end

	parent.Image = "rbxassetid://12593095734"

	for i = 1, 16 do
		local v838 = Vector2.new
		local floored2 = math.floor((i - 1) / 4)

		parent.ImageRectOffset = v838((i + 3) % 4 * 256, floored2 * 256)
		task.wait(0.08)

		if i == 7 then
			audioServicePlaySound("ui_hover")
		end

		if i >= 11 and i <= 13 then
			task.wait(0.04)
		end
	end

	task.wait(1.5)
	effectsServiceSetCardZIndex(p176, p176.ZIndex - 99999)
end
function module.CaitlinSummon(p179, p180, _, _)
	local v844 = p180.Position
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t25: {[any]: any} = { Color3.fromRGB(145, 145, 145), Color3.fromRGB(66, 66, 66) }
	local v847 = UDim2.fromOffset(p180.AbsoluteSize.Y / 3, p180.AbsoluteSize.Y / 3)
	local n1 = p180.ZIndex + 100002
	local color3 = Color3.fromRGB(0, 0, 0)
	local n2 = p180.ZIndex + 99999
	local v851 = uDim2New(1, 0, 2, 0)
	local v852 = uDim2New(0.5, 0, 0.5, 0)
	local v853 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v851,
		Position = v852
	})
	local n3 = p180.ZIndex + 110001
	local v855 = uDim2New(0, p180.AbsoluteSize.Y * 8, 0, p180.AbsoluteSize.Y * 8)
	local v856 = UDim2.fromScale(0.5, 1.4)
	local parent = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12561612561",
		Rotation = 10,
		ZIndex = n3,
		Size = v855,
		Position = v856
	})
	local n4 = p180.ZIndex + 100001
	local v859 = UDim2.fromScale(1, 1)
	local v860 = UDim2.fromScale(0.5, 0.5)
	local v861 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://12561612561",
		ZIndex = n4,
		Size = v859,
		Position = v860,
		Parent = parent
	})
	local n5 = p180.ZIndex + 10000
	local v863 = uDim2New(0, p180.AbsoluteSize.Y * 0.2, 0, p180.AbsoluteSize.Y * 0.2)
	local v864 = UDim2.fromScale(0.2, 0.7)

	v852 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12561612561",
		ZIndex = n5,
		Size = v863,
		Position = v864,
		Parent = parent
	})

	local n6 = p180.ZIndex + 10000
	local v866 = uDim2New(1, p180.AbsoluteSize.Y * 0.2, 1, p180.AbsoluteSize.Y * 0.2)
	local v867 = UDim2.fromScale(0.6, 3)

	v856 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12561612561",
		ZIndex = n6,
		Size = v866,
		Position = v867,
		Parent = v852
	})

	local n7 = p180.ZIndex + 10000
	local v869 = uDim2New(0, p180.AbsoluteSize.Y * 0.2, 0, p180.AbsoluteSize.Y * 0.2)
	local v870 = UDim2.fromScale(0.85, 0.7)

	v860 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12561612561",
		ZIndex = n7,
		Size = v869,
		Position = v870,
		Parent = parent
	})

	local n8 = p180.ZIndex + 10000
	local v872 = uDim2New(1, p180.AbsoluteSize.Y * 0.2, 1, p180.AbsoluteSize.Y * 0.2)
	local v873 = UDim2.fromScale(0.45, 3.5)

	v864 = effectsServiceNewerCircle(p179, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12561612561",
		ZIndex = n8,
		Size = v872,
		Position = v873,
		Parent = v860
	})
	effectsServiceSetCardZIndex(p180, v853.ZIndex + 1)

	local absoluteSize = p180.AbsoluteSize

	p180.Size = p180.Size + p180.Size
	p180.Rotation = 5

	local uDim2 = UDim2.new(0, parent.AbsolutePosition.X, 0, parent.AbsolutePosition.Y)
	local uDim232 = UDim2.new(0, parent.AbsoluteSize.X * 0.5, 0, parent.AbsoluteSize.Y * 0.5)
	local v877 = UDim2.fromOffset(0, p180.AbsoluteSize.Y)

	p180.Position = uDim2 + uDim232 - v877
	animation.AnimateAsync(v853, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quart")
	effectsService.ShakeSync(v861, v861.Position, 1, 0.05)

	local animationAnimateAsync = animation.AnimateAsync
	local v879 = UDim2.fromOffset(absoluteSize.X * 1.2, absoluteSize.Y * 1.2)
	local uDim233 = UDim2.new(0.5, 0, 0.5, -absoluteSize.Y)

	animationAnimateAsync(p180, { Rotation = -5, Size = v879, Position = uDim233 }, 1, "Out", "Quart")

	local t26: {[any]: any} = {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = t25,
		Size = v847,
		ZIndex = n1
	}

	effectsServiceBreath(p179, v852, v856, t26)
	effectsServiceBreath(p179, v860, v864, t26)
	audioServicePlaySound("motorbike")

	local animateAsync = animation.AnimateAsync

	v879 = uDim2New(0, absoluteSize.Y * 2.5, 0, absoluteSize.Y * 2.5)

	local v883 = UDim2.fromScale(0.5, 0.5)

	animateAsync(parent, { Rotation = -5, Size = v879, Position = v883 }, 1, "Out", "Quart")
	task.wait(0.9)
	animation.AnimateAsync(v853, { BackgroundTransparency = 1 }, 1, "Out", "Quart")
	task.spawn(function()
		animation.Animate(v861, { ImageTransparency = 1 }, 1, "Out", "Quart")
		parent:Destroy()
		v853:Destroy()
	end)
	audioServicePlaySound("toon beep")

	local v884 = animation.AnimateAsync

	v883 = UDim2.fromOffset(p180.AbsolutePosition.X, p180.AbsolutePosition.Y - p180.AbsoluteSize.Y / 3)
	v884(p180, { Rotation = 5, Position = v883 }, 0.5, "Out", "Quart")
	task.wait(0.4)

	local animationAnimate = animation.Animate

	v883 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animationAnimate(p180, { Rotation = 0, Size = v883, Position = v844 }, 0.5, "In", "Quint")
	audioServicePlaySound("HammerImpact")
	effectsService.ShakeBattle(p179, 0.1, 0.025)
	effectsServiceSetCardZIndex(p180, p180.ZIndex - 99999)
end
function module.Caitlin2Summon(p183, p184, _, _)
	p184.Visible = false
	audioServicePlaySound("motorbike")
	task.wait(0.2)
	audioServicePlaySound("scan complete")

	local color3 = Color3.fromRGB(0, 255, 255)
	local n1 = p184.ZIndex - 1
	local uDim2 = UDim2.new(0, p183.Parent.AbsoluteSize.X, 0, p184.AbsoluteSize.Y)
	local v893 = p184.Position
	local v894 = UDim2.fromOffset(p184.AbsoluteSize.X / 4)
	local v895 = effectsServiceNewCircle(p183, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		BorderSizePixel = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = uDim2,
		Position = v893 + v894
	})

	task.spawn(function()
		local animationAnimate = animation.Animate
		local v1648 = v895.Size
		local v1649 = UDim2.fromOffset(v895.AbsoluteSize.X / 1.1, 0)

		animationAnimate(v895, { BackgroundTransparency = 1, Size = v1648 - v1649 }, 0.6, "Out", "Quint")
		v895:Destroy()
	end)

	local v896 = p184.Position

	n1 = p184.Position
	v893 = UDim2.fromOffset(p184.AbsoluteSize.X / 8, 0)
	p184.Position = n1 - v893
	p184.Visible = true
	animation.Animate(p184, { Position = v896 }, 0.3, "Out", "Quart")
	task.wait(0.1)
	audioServicePlaySound("Earthquake Debris 5 (SFX)")
	effectsService.ShakeBattleSync(p183, 0.5, 0.025)

	for _ = 1, 10 do
		for _ = 1, 2 do
			local n2 = p184.ZIndex + 10000
			local uDim234 = UDim2.new(0, p184.AbsoluteSize.X, 0, p184.AbsoluteSize.X / 1.6)
			local v901 = UDim2.fromOffset(p183.Parent.AbsoluteSize.X, math.random(0, p183.Parent.AbsoluteSize.Y))
			local v902 = effectsServiceNewerCircle(p183, {
				Image = "rbxassetid://7216979191",
				ImageTransparency = 0.2,
				ZIndex = n2,
				Size = uDim234,
				Position = v901
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v1651 = v902.Position
				local uDim2FromOffset = UDim2.fromOffset
				local randomNumber = math.random(p183.Parent.AbsoluteSize.X / 1.5, p183.Parent.AbsoluteSize.X * 1.1)
				local uDim2 = uDim2FromOffset(randomNumber, 0)

				animationAnimate(v902, { ImageTransparency = 1, Position = v1651 - uDim2 }, 1, "Out", "Quart")
				v902:Destroy()
			end)
		end

		task.wait(0.02)
	end
end
function module.AstarossaSummon(p187, p188, _, p190)
	local s1 = if p190 == "" then "Enemy" else if p190 == "Enemy" then "" else nil
	local zIndex = p188.ZIndex
	local absolutePosition = p188.AbsolutePosition
	local absoluteSize = p188.AbsoluteSize
	local y = p187.Parent.AbsoluteSize.Y
	local n1: number = if p188.AbsolutePosition.Y > y / 2 then 1 else 0

	p188.Position = UDim2.new(0, p188.AbsolutePosition.X, 0, y * n1 + p188.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	audioServiceDimSongs(0.001)
	audioServicePlaySound("Wind Loop")
	audioServicePlaySound("walk")

	local color3 = Color3.fromRGB(0, 0, 0)
	local n2 = p188.ZIndex + 99998
	local v915 = uDim2New(1, 0, 2, 0)
	local v916 = uDim2New(0.5, 0, 0.5, 0)
	local v917 = effectsServiceNewerCircle(p187, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v915,
		Position = v916
	})

	animation.AnimateAsync(v917, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p188, p188.ZIndex + 99999)

	local animationAnimate = animation.Animate
	local v919 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimate(p188, { Position = v919 }, 3, "Out", "Quad")
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p188.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.25, 0.002)
			end)
		end
	end)
	audioServiceUndimSongs()
	animation.Animate(v917, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	task.wait(1)
	audioServiceUndimSongs()
	v917:Destroy()
	effectsServiceSetCardZIndex(p188, p188.ZIndex - 99999)
end
function module.Astarossa2Summon(p191, p192, _, p194)
	effectsServicePreloadTech(p191, { "rbxassetid://245854775", "rbxassetid://13624260457" })

	local s1 = if p194 == "" then "Enemy" else if p194 == "Enemy" then "" else nil
	local zIndex = p192.ZIndex
	local absolutePosition = p192.AbsolutePosition
	local absoluteSize = p192.AbsoluteSize
	local y = p191.Parent.AbsoluteSize.Y
	local n1: number = if p192.AbsolutePosition.Y > y / 2 then 1 else 0
	local n2 = y * n1 + p192.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1)
	local n3 = y * n1 + p192.AbsoluteSize.Y * (if n1 == 1 then 1 else -1)
	local v932 = effectsServiceNewerCircle(p191, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://245854775",
		ImageColor3 = Color3.fromRGB(255, 221, 83),
		Rotation = if n1 == 1 then 180 else 0,
		ZIndex = p192.ZIndex + 100002,
		Size = UDim2.fromOffset(p192.AbsoluteSize.X * 1.25, p192.AbsoluteSize.Y * 5),
		Position = UDim2.fromOffset(p192.AbsolutePosition.X + p192.AbsoluteSize.X / 2, n3)
	})
	local color3 = Color3.fromRGB(255, 255, 255)
	local n4 = p192.ZIndex + 1000001
	local v935 = UDim2.fromOffset(p192.AbsoluteSize.X * 2.5, p192.AbsoluteSize.X * 2.5)
	local v936 = UDim2.fromOffset(p192.AbsolutePosition.X + p192.AbsoluteSize.X / 2, n3)
	local v937 = effectsServiceNewerCircle(p191, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 90,
		Image = "rbxassetid://13624260457",
		ImageColor3 = color3,
		ZIndex = n4,
		Size = v935,
		Position = v936
	})

	p192.Position = UDim2.new(0, p192.AbsolutePosition.X, 0, n2)
	audioServiceDimSongs()

	local color346 = Color3.fromRGB(0, 0, 0)
	local n5 = p192.ZIndex + 99998
	local v940 = uDim2New(1, 0, 2, 0)
	local v941 = uDim2New(0.5, 0, 0.5, 0)

	n3 = effectsServiceNewerCircle(p191, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color346,
		ZIndex = n5,
		Size = v940,
		Position = v941
	})
	animation.AnimateAsync(n3, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p192, p192.ZIndex + 99999)
	audioServicePlaySound("Footsteps - Metal")
	p192.Visible = true
	task.wait(0.5)
	audioServicePlaySound("Metal Crash 4 (SFX)")

	local animationAnimateAsync = animation.AnimateAsync

	v941 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y + absoluteSize.Y / 3 * (if n1 == 0 then 4 else -1))
	animationAnimateAsync(v937, {
		Position = v941,
		Rotation = if n1 == 0 then 120 else 60
	}, 1.5, "Out", "Quint")

	local animateAsync = animation.AnimateAsync

	v941 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	animateAsync(p192, { Position = v941 }, 1, "Out", "Quart")
	task.wait(0.15)
	animation.AnimateAsync(v932, { ImageTransparency = 0 }, 0.6, "Out", "Quart")
	task.wait(0.85)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p192.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.5, 0.002)
			end)
		end
	end)
	animation.Animate(n3, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	animation.AnimateAsync(v937, { ImageTransparency = 1 }, 1, "Out", "Quart")
	animation.AnimateAsync(v932, { ImageTransparency = 1 }, 1, "Out", "Quart")
	task.wait(1)
	v932:Destroy()
	audioServiceUndimSongs()
	n3:Destroy()
	effectsServiceSetCardZIndex(p192, p192.ZIndex - 99999)
end
function module.ApolloSummon(p195, p196, _, _)
	local v948 = p196.Position
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p196.ZIndex + 10000
	local v951 = uDim2New(1, 0, 2, 0)
	local v952 = uDim2New(0.5, 0, 0.5, 0)
	local v953 = effectsServiceNewerCircle(p195, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v951,
		Position = v952
	})

	p196.Visible = false
	p196.Rotation = 180
	effectsServiceSetCardZIndex(p196, p196.ZIndex + 100001)
	animation.AnimateAsync(v953, { BackgroundTransparency = 0.4 }, 0.3, "Out", "Quint")
	audioServicePlaySound("portal")

	for _ = 1, 3 do
		task.wait(0.1)
		task.spawn(function()
			local color347 = Color3.fromRGB(62, 255, 223)
			local v1660 = UDim2.fromScale(0, 2)
			local v1661 = UDim2.fromOffset(p196.AbsoluteSize.X / 2)
			local v1662 = effectsServiceNewerCircle(p195, {
				Image = "rbxassetid://10248621823",
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				ImageColor3 = color347,
				Size = v1660,
				Position = v948 + v1661,
				ZIndex = p196.ZIndex - 1
			})

			task.spawn(function()
				for _ = 1, 30 do
					v1662.Rotation = v1662.Rotation + 180
					task.wait(0.1)
				end
			end)

			local animationAnimate = animation.Animate

			v1661 = UDim2.fromScale(0, 2)

			local v1664 = UDim2.fromOffset(p196.AbsoluteSize.X * 1.2)

			animationAnimate(v1662, { Size = v1661 + v1664 }, 1, "Out", "Quint")

			local animate = animation.Animate
			local v1666 = UDim2.fromScale(0, 2)

			animate(v1662, { Size = v1666 }, 1, "Out", "Quint")
			v1662:Destroy()
		end)
	end

	task.wait(0.2)
	p196.Visible = true
	task.spawn(function()
		for _ = 1, 3 do
			audioServicePlaySound("Swoosh")

			local v1668 = UDim2.fromScale(0, -1)

			p196.Position = v948 + v1668

			local animationAnimate = animation.Animate
			local v1670 = UDim2.fromScale(0, 1.5)

			animationAnimate(p196, { Position = v948 + v1670 }, 0.2, "Out", "Linear")
		end

		local v1671 = UDim2.fromScale(0, -1)

		p196.Position = v948 + v1671
		animation.Animate(p196, { Rotation = 0, Position = v948 }, 0.8, "Out", "Quart")
	end)
	task.wait(1.3)
	task.spawn(function()
		animation.Animate(v953, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		effectsServiceSetCardZIndex(p196, p196.ZIndex - 100001)
		v953:Destroy()
	end)
end
function module.ApolloFearless(p199, p200, _, _)
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p200.ZIndex + 99998
	local v961 = uDim2New(1, 0, 2, 0)
	local v962 = uDim2New(0.5, 0, 0.5, 0)
	local v963 = effectsServiceNewerCircle(p199, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v961,
		Position = v962
	})
	local color348 = Color3.fromRGB(0, 0, 0)
	local n2 = p200.ZIndex + 99999
	local v966 = UDim2.fromOffset(p200.AbsoluteSize.Y * 5, p200.AbsoluteSize.Y * 5)
	local uDim2 = UDim2.new(0, p200.AbsolutePosition.X, 0, p200.AbsolutePosition.Y)
	local uDim235 = UDim2.new(0, p200.AbsoluteSize.X * 0.5, 0, p200.AbsoluteSize.Y * 0.5)
	local v969 = effectsServiceNewerCircle(p199, {
		Image = "rbxassetid://7216856276",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color348,
		ZIndex = n2,
		Size = v966,
		Position = uDim2 + uDim235
	})
	local v970 = p200.Position

	v962 = p200.Size

	local uDim236 = UDim2.new(0, p200.AbsolutePosition.X, 0, p200.AbsolutePosition.Y)
	local uDim237 = UDim2.new(0, p200.AbsoluteSize.X * 0.5, 0, p200.AbsoluteSize.Y * 0.5)

	p200.Position = uDim236 + uDim237
	p200.Size = UDim2.fromOffset(0, 0)
	audioServicePlaySound("fearless")
	animation.AnimateAsync(v969, { ImageTransparency = 0 }, 0.3, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v974 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v969, { Size = v974 }, 0.6, "In", "Quad")
	p200.Visible = false
	animation.AnimateAsync(v963, { BackgroundTransparency = 0.2 }, 0.3, "Out", "Quint")
	task.wait(0.6)
	p200.Visible = true
	effectsServiceSetCardZIndex(p200, p200.ZIndex + 99999)
	animation.AnimateAsync(p200, { Size = v962, Position = v970 }, 1, "Out", "Quart")
	effectsService.ShakeBattleSync(p199, 0.5, 0.03)

	for i = 1, 5 do
		task.spawn(function()
			local n1 = p200.ZIndex + 100001
			local v1673 = UDim2.fromOffset(p200.AbsoluteSize.X, p200.AbsoluteSize.X)
			local v1674 = p200
			local uDim238 = UDim2.new(0, v1674.AbsolutePosition.X, 0, v1674.AbsolutePosition.Y)
			local uDim239 = UDim2.new(0, v1674.AbsoluteSize.X * 0.5, 0, v1674.AbsoluteSize.Y * 0.5)
			local randomNumber = math.random(0, 360)
			local v1678 = effectsServiceNewerCircle(p199, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v1673,
				Position = uDim238 + uDim239,
				Rotation = randomNumber
			})

			v1674 = p200.ZIndex + 100001

			local v1679 = UDim2.fromOffset(p200.AbsoluteSize.X, p200.AbsoluteSize.X)
			local v1680 = p200
			local uDim240 = UDim2.new(0, v1680.AbsolutePosition.X, 0, v1680.AbsolutePosition.Y)
			local uDim241 = UDim2.new(0, v1680.AbsoluteSize.X * 0.5, 0, v1680.AbsoluteSize.Y * 0.5)
			local color349 = Color3.fromRGB(255, 225, 0)
			local v1684 = effectsServiceNewerCircle(p199, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v1674,
				Size = v1679,
				Position = uDim240 + uDim241,
				Rotation = i * 90 + 180,
				ImageColor3 = color349
			})

			v1680 = p200.ZIndex + 100001

			local v1685 = UDim2.fromOffset(p200.AbsoluteSize.X, p200.AbsoluteSize.X)
			local v1686 = p200
			local uDim242 = UDim2.new(0, v1686.AbsolutePosition.X, 0, v1686.AbsolutePosition.Y)
			local uDim243 = UDim2.new(0, v1686.AbsoluteSize.X * 0.5, 0, v1686.AbsoluteSize.Y * 0.5)
			local color350 = Color3.fromRGB(0, 68, 255)
			local v1690 = effectsServiceNewerCircle(p199, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v1680,
				Size = v1685,
				Position = uDim242 + uDim243,
				ImageColor3 = color350,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v1686 = UDim2.fromOffset(p200.AbsoluteSize.Y * 1.8, p200.AbsoluteSize.Y * 1.8)
			animationAnimateAsync(v1678, { Size = v1686, Rotation = v1678.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v1686 = UDim2.fromOffset(p200.AbsoluteSize.Y * 1.3, p200.AbsoluteSize.Y * 1.3)
			animateAsync(v1684, { Size = v1686, Rotation = v1684.Rotation + 360 }, 1, "Out", "Quint")

			local v1693 = animation.AnimateAsync

			v1686 = UDim2.fromOffset(p200.AbsoluteSize.Y * 1.3, p200.AbsoluteSize.Y * 1.3)
			v1693(v1690, { Size = v1686, Rotation = v1690.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v1678, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v1684, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v1690, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v1678:Destroy()
				v1684:Destroy()
				v1690:Destroy()
			end)
		end)
		task.wait(0.2)
	end

	task.spawn(function()
		animation.Animate(v963, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		v963:Destroy()
		v969:Destroy()
		effectsServiceSetCardZIndex(p200, p200.ZIndex - 99999)
	end)
end
function module.ApateSummon(p203, p204, _, _)
	local v980 = p204.Position
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p204.ZIndex + 10000
	local v983 = uDim2New(1, 0, 2, 0)
	local v984 = uDim2New(0.5, 0, 0.5, 0)
	local v985 = effectsServiceNewerCircle(p203, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v983,
		Position = v984
	})

	p204.Visible = false
	p204.Rotation = 180
	effectsServiceSetCardZIndex(p204, p204.ZIndex + 100001)
	animation.AnimateAsync(v985, { BackgroundTransparency = 0.4 }, 0.3, "Out", "Quint")
	audioServicePlaySound("portal2")

	for _ = 1, 3 do
		task.wait(0.1)
		task.spawn(function()
			local color351 = Color3.fromRGB(108, 135, 255)
			local v1695 = UDim2.fromScale(0, 2)
			local v1696 = UDim2.fromOffset(p204.AbsoluteSize.X / 2)
			local v1697 = effectsServiceNewerCircle(p203, {
				Image = "rbxassetid://10248621823",
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				ImageColor3 = color351,
				Size = v1695,
				Position = v980 + v1696,
				ZIndex = p204.ZIndex - 1
			})

			task.spawn(function()
				for _ = 1, 30 do
					v1697.Rotation = v1697.Rotation + 180
					task.wait(0.1)
				end
			end)

			local animationAnimate = animation.Animate

			v1696 = UDim2.fromScale(0, 2)

			local v1699 = UDim2.fromOffset(p204.AbsoluteSize.X * 1.2)

			animationAnimate(v1697, { Size = v1696 + v1699 }, 1, "Out", "Quint")

			local animate = animation.Animate
			local v1701 = UDim2.fromScale(0, 2)

			animate(v1697, { Size = v1701 }, 1, "Out", "Quint")
			v1697:Destroy()
		end)
	end

	task.wait(0.2)
	p204.Visible = true
	task.spawn(function()
		for _ = 1, 3 do
			audioServicePlaySound("Swoosh")

			local v1703 = UDim2.fromScale(0, -1)

			p204.Position = v980 + v1703

			local animationAnimate = animation.Animate
			local v1705 = UDim2.fromScale(0, 1.5)

			animationAnimate(p204, { Position = v980 + v1705 }, 0.2, "Out", "Linear")
		end

		local v1706 = UDim2.fromScale(0, -1)

		p204.Position = v980 + v1706
		p204.Rotation = 0
		animation.Animate(p204, { Position = v980 }, 0.25, "In", "Linear")
		audioServicePlaySound("LargeImpact")
		effectsService.ShakeBattleSync(p203, 0.4, 0.025)
	end)
	task.wait(1.3)
	task.spawn(function()
		animation.Animate(v985, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		effectsServiceSetCardZIndex(p204, p204.ZIndex - 100001)
		v985:Destroy()
	end)
end
function module.SkewergleeSummon(p207, p208, _, _)
	effectsServicePreloadTech(p207, { "rbxassetid://14829550452" })
	audioServicePlaySound("giggle")

	local zIndex = p208.ZIndex
	local absolutePosition = p208.AbsolutePosition
	local absoluteSize = p208.AbsoluteSize
	local y = p207.Parent.AbsoluteSize.Y
	local n1: number = if p208.AbsolutePosition.Y > y / 2 then 1 else 0
	local n2 = y * n1 + p208.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1)
	local n3 = y * n1 + p208.AbsoluteSize.Y * (if n1 == 1 then 1 else -1)

	for i = 1, 4 do
		task.spawn(function()
			local color3 = Color3.fromRGB(255, 255, 255)
			local n4 = p208.ZIndex + 1000001
			local v1709 = UDim2.fromOffset(p208.AbsoluteSize.X, p208.AbsoluteSize.X)
			local v1710 = UDim2.fromOffset(p208.AbsolutePosition.X + p208.AbsoluteSize.X / 2, n3)
			local v1711 = effectsServiceNewerCircle(p207, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Rotation = 90,
				Image = "rbxassetid://14829550452",
				ImageColor3 = color3,
				ZIndex = n4,
				Size = v1709,
				Position = v1710,
				ImageRectSize = Vector2.new(512, 512)
			})

			if i ~= 1 then
				if i == 2 then
					v1711.ImageRectOffset = Vector2.new(512, 0)
				elseif i == 3 then
					v1711.ImageRectOffset = Vector2.new(0, 512)
				elseif i == 4 then
					v1711.ImageRectOffset = Vector2.new(512, 512)
				end
			end

			task.wait(0.25)

			local animationAnimateAsync = animation.AnimateAsync
			local uDim2FromOffset = UDim2.fromOffset
			local n2 = absolutePosition.X + p208.AbsoluteSize.X * (i - 2)
			local absolutePositionY = absolutePosition.Y
			local n5 = absoluteSize.Y / 1.5 * (if n1 == 0 then 2 else -1)
			local randomNumber = math.random(-100, 100)

			animationAnimateAsync(v1711, {
				Position = uDim2FromOffset(n2, absolutePositionY + (n5 + randomNumber)),
				Rotation = math.random(0, 270)
			}, 1.5, "Out", "Quint")
			task.wait(1)
			animation.AnimateAsync(v1711, { ImageTransparency = 1 }, 1, "Out", "Quart")
		end)
	end

	effectsServiceSetCardZIndex(p208, p208.ZIndex + 99999)
	p208.Position = UDim2.new(0, p208.AbsolutePosition.X, 0, n2)
	p208.Visible = true
	task.wait(0.25)
	audioServicePlaySound("collide.wav")

	local animationAnimateAsync = animation.AnimateAsync
	local v1000 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimateAsync(p208, { Position = v1000 }, 0.5, "Out", "Quad")
	task.wait(1)
	task.spawn(function()
		task.wait(1)
	end)
	effectsServiceSetCardZIndex(p208, p208.ZIndex - 99999)
end
function module.BiggsSummon(p211, p212, _, _)
	effectsServiceSetCardZIndex(p212, p212.ZIndex + 100001)

	local v1005 = p212.Position

	p212.Rotation = -90
	p212.Position = UDim2.new(1, p212.AbsoluteSize.X * 2, 0, -p212.AbsoluteSize.Y * 2)
	p212.Visible = true

	local animationAnimateAsync = animation.AnimateAsync
	local v1007 = UDim2.fromOffset(p212.AbsoluteSize.X * 2, 0)

	animationAnimateAsync(p212, { Rotation = -180, Position = v1005 + v1007 }, 1, "In", "Quart")
	task.wait(0.6)
	audioServicePlaySound("Woosh")
	task.wait(0.4)
	effectsService.ShakeBattleSync(p211, 0.3, 0.03)
	audioServicePlaySound("Punch Kit Beefy Hit 1 (SFX)")

	local animateAsync = animation.AnimateAsync

	v1007 = UDim2.fromOffset(p212.AbsoluteSize.X, -p212.AbsoluteSize.Y / 2)
	animateAsync(p212, { Rotation = -300, Position = v1005 + v1007 }, 0.5, "Out", "Quart")
	task.wait(0.3)
	animation.Animate(p212, { Rotation = -370, Position = v1005 }, 0.4, "InOut", "Quad")
	task.wait(0.1)
	animation.Animate(p212, { Rotation = -360 }, 0.2, "Out", "Quart")
	audioServicePlaySound("FastSplat")
	p212.Rotation = 0
	effectsServiceSetCardZIndex(p212, p212.ZIndex - 100001)
end
function module.ThecSummon(p215, p216, _, _)
	effectsServicePreloadTech(p215, {
		"rbxassetid://13623357066",
		"rbxassetid://13613038354",
		"rbxassetid://13613222363"
	})
	audioServiceDimSongs()
	p216.Visible = true

	local color3 = Color3.fromRGB(255, 255, 255)
	local n1 = p216.ZIndex + 100002
	local v1015 = UDim2.fromOffset(p216.AbsoluteSize.X / 2, p216.AbsoluteSize.X / 2)
	local uDim2 = UDim2.new(0, p216.AbsolutePosition.X, 0, p216.AbsolutePosition.Y)
	local uDim244 = UDim2.new(0, p216.AbsoluteSize.X * 0.5, 0, p216.AbsoluteSize.Y * 0.5)
	local v1018 = UDim2.fromOffset(0, p216.AbsoluteSize.Y / 4)
	local v1019 = effectsServiceNewerCircle(p215, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://13623357066",
		ImageColor3 = color3,
		ZIndex = n1,
		Size = v1015,
		Position = uDim2 + uDim244 - v1018
	})
	local v1020 = p216.Size
	local v1021 = p216.Position

	p216.Position = UDim2.fromOffset(p216.AbsolutePosition.X + p216.AbsoluteSize.X / 2, p216.AbsolutePosition.Y)
	p216.Size = UDim2.fromOffset(0, p216.AbsoluteSize.Y)
	audioServicePlaySound("Scary Sound 2")

	local color352 = Color3.fromRGB(0, 0, 0)
	local n2 = p216.ZIndex + 100000
	local v1024 = uDim2New(1, 0, 2, 0)
	local v1025 = uDim2New(0.5, 0, 0.5, 0)

	v1015 = effectsServiceNewerCircle(p215, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color352,
		ZIndex = n2,
		Size = v1024,
		Position = v1025
	})

	local color353 = Color3.fromRGB(255, 0, 0)
	local n3 = p216.ZIndex + 100000
	local v1028 = uDim2New(0, 0, 2, 0)
	local uDim245 = UDim2.new(0, p216.AbsolutePosition.X, 0, p216.AbsolutePosition.Y)
	local uDim246 = UDim2.new(0, p216.AbsoluteSize.X * 0.5, 0, p216.AbsoluteSize.Y * 0.5)
	local v1031 = effectsServiceNewerCircle(p215, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		BorderSizePixel = 0,
		BackgroundColor3 = color353,
		ZIndex = n3,
		Size = v1028,
		Position = uDim245 + uDim246
	})

	effectsServiceSetCardZIndex(p216, p216.ZIndex + 100001)
	animation.AnimateAsync(v1015, { BackgroundTransparency = 0 }, 0.3, "Out", "Quart")
	audioServicePlaySound("recreation")
	animation.AnimateAsync(v1019, { Rotation = 10 }, 1, "In", "Quart")

	local animationAnimate = animation.Animate
	local v1033 = UDim2.fromScale(0.01, 2)

	animationAnimate(v1031, { Size = v1033 }, 1, "In", "Quart")
	animation.AnimateAsync(v1019, { ImageTransparency = 1 }, 0.2, "Out", "Quart")
	animation.AnimateAsync(p216, { Size = v1020, Position = v1021 }, 0.5, "Out", "Quart")

	local animate = animation.Animate
	local v1035 = UDim2.fromScale(0, 2)
	local v1036 = UDim2.fromOffset(v1020.X.Offset, 0)

	animate(v1031, { Size = v1035 + v1036 }, 0.4, "Out", "Bounce")
	animation.AnimateAsync(v1031, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	animation.Animate(v1015, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	effectsServiceSetCardZIndex(p216, p216.ZIndex - 100001)
	v1031:Destroy()
	v1015:Destroy()
	v1019:Destroy()
	audioServiceUndimSongs()
end
function module.ClaymakerSummon(p219, p220, _, _)
	audioServicePlaySound("Ascend2")
	audioService.DimSongs()

	local absoluteSize = p220.AbsoluteSize

	p220.Visible = false

	local color3 = Color3.fromRGB(255, 255, 255)
	local v1043 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	local v1044 = effectsServiceNewerCircle(p219, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13293150658",
		ImageColor3 = color3,
		Size = v1043,
		Position = p220.Position,
		ZIndex = p220.ZIndex + 50
	})

	p220.Position = UDim2.new(p220.Position.X.Scale, p220.Position.X.Offset, -1, 0)
	p220.Visible = true

	local color354 = Color3.fromRGB(166, 109, 39)
	local v1046 = uDim2New(1, 0, 2, 0)
	local v1047 = uDim2New(0.5, 0, 0.5, 0)
	local v1048 = effectsServiceNewerCircle(p219, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90000,
		BackgroundColor3 = color354,
		Size = v1046,
		Position = v1047
	})

	animation.Animate(p220, { Position = p220.Position }, 0.9, "In", "Quad")
	task.delay(0.9, function()
		audioServicePlaySound("Boom")
		effectsService.ShakeBattleSync(p219, 0.4, 0.06)

		local n1 = absoluteSize.X / 3
		local n2 = absoluteSize.Y / 4

		for i = 1, 12 do
			local floored = math.floor((i - 1) / 3)
			local frame: Frame = Instance.new("Frame")

			frame.BackgroundTransparency = 1
			frame.ClipsDescendants = true
			frame.Size = UDim2.fromOffset(n1, n2)
			frame.Position = p220.Position
			frame.ZIndex = v1044.ZIndex + 100
			frame.Parent = p219

			local imageLabel: ImageLabel = Instance.new("ImageLabel")

			imageLabel.BackgroundTransparency = 1
			imageLabel.Image = v1044.Image
			imageLabel.ImageColor3 = v1044.ImageColor3
			imageLabel.Size = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
			imageLabel.Position = UDim2.fromOffset(-((i - 1) % 3) * n1, -floored * n2)
			imageLabel.ZIndex = frame.ZIndex
			imageLabel.Parent = frame

			local v1724 = randomPosOnTarget(v1048)

			task.spawn(function()
				animation.Animate(frame, { Position = v1724 }, 1.2, "Out", "Quint")
				animation.Animate(imageLabel, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
				task.delay(1.2, function()
					frame:Destroy()
				end)
			end)
		end

		v1044:Destroy()
	end)
	task.delay(2.2, function()
		v1048:Destroy()
		audioService.UndimSongs()
	end)
end
function module.AuteurSummon(p223, p224, _, p226)
	audioServiceDimSongs()
	audioServicePlaySound("sting_auteur")
	p224.Visible = true

	local s1
	local s2

	if p226 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p226 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local zIndex = p224.ZIndex
	local absolutePosition = p224.AbsolutePosition
	local absoluteSize = p224.AbsoluteSize
	local y = p223.Parent.AbsoluteSize.Y
	local n1: number = if p224.AbsolutePosition.Y > y / 2 then 1 else 0
	local n2 = y * n1 + p224.AbsoluteSize.Y * (if n1 == 1 then 1 else -1)

	p224.Position = UDim2.new(0, p224.AbsolutePosition.X, 0, y * n1 + p224.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))

	local color3 = Color3.fromRGB(0, 0, 0)
	local n3 = p224.ZIndex + 99998
	local v1063 = uDim2New(1, 0, 2, 0)
	local v1064 = uDim2New(0.5, 0, 0.5, 0)
	local v1065 = effectsServiceNewerCircle(p223, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n3,
		Size = v1063,
		Position = v1064
	})

	animation.AnimateAsync(v1065, { BackgroundTransparency = 0.2 }, 0.4, "Out", "Quart")
	effectsServiceSetCardZIndex(p224, p224.ZIndex + 99999)

	local t27: {[any]: any} = {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://11794599322",
		ImageColor3 = Color3.fromRGB(216, 216, 216),
		Rotation = if n1 == 1 then -40 else 220,
		ZIndex = p224.ZIndex + 100002,
		Size = UDim2.fromOffset(p224.AbsoluteSize.X * 3, p224.AbsoluteSize.X * 3)
	}
	local v1067 = UDim2.fromOffset(p224.AbsolutePosition.X + p224.AbsoluteSize.X / 2, 0)
	local v1068 = UDim2.fromScale(0, if n1 == 0 then -0.085 else 1.085)

	t27.Position = v1067 + v1068
	t27.AnchorPoint = Vector2.new(0.5, if n1 == 0 then 0 else 1)

	local v1069 = effectsServiceNewerCircle(p223, t27)

	task.spawn(function()
		effectsServiceSpritesheet(v1069, Vector2.new(128, 128), { 8, 8 }, 1, 64, 64)
		task.wait(1)
		v1069:Destroy()
	end)

	local t28: {[any]: any} = {}

	for i = 1, 8 do
		task.spawn(function()
			local n4: number = if i <= 4 then 4 else i - 4
			local color355 = Color3.fromRGB(55, 63, 216)
			local n5 = p224.ZIndex + 1000001
			local v1728 = UDim2.fromOffset(p224.AbsoluteSize.Y, p224.AbsoluteSize.Y)
			local v1729 = UDim2.fromOffset(p224.AbsolutePosition.X + p224.AbsoluteSize.X / 2, n2)
			local v1730 = effectsServiceNewerCircle(p223, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Rotation = 90,
				Image = "rbxassetid://17364186013",
				ImageColor3 = color355,
				ZIndex = n5,
				Size = v1728,
				Position = v1729
			})

			table.insert(t28, v1730)

			if n4 ~= 1 then
				if n4 == 2 then
					v1730.Image = "rbxassetid://18918707882"
				elseif n4 == 3 then
					v1730.Image = "rbxassetid://8598810246"
				elseif n4 == 4 then
					v1730.Image = "rbxassetid://17364186013"
				end
			end

			task.wait(0.25)

			local animationAnimateAsync = animation.AnimateAsync
			local uDim2FromOffset = UDim2.fromOffset
			local n3 = absolutePosition.X + p224.AbsoluteSize.X * (n4 - 2)
			local absolutePositionY = absolutePosition.Y
			local randomNumber = math.random(-200, -100)

			animationAnimateAsync(v1730, {
				Position = uDim2FromOffset(n3, absolutePositionY - ((if n1 == 0 then 2 else -1) + randomNumber)),
				Rotation = math.random(0, 180)
			}, 1.5, "Out", "Quint")
			task.wait(1)
			animation.AnimateAsync(v1730, { ImageTransparency = 1 }, 1, "Out", "Quart")
		end)
	end

	local animationAnimate = animation.Animate

	v1067 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
	animationAnimate(p224, { Position = v1067 }, 1.6, "InOut", "Quart")
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p224.Parent.Parent[s2 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1.25, 0.002)
			end)
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p224.Parent.Parent[s1 .. "Field"])) do
			if v ~= p224 then
				task.spawn(function()
					effectsService.ShakeInOut(v, v.Position, 1.25, 0.002)
				end)
			end
		end
	end)
	animation.Animate(v1065, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	task.wait(1)

	for _, v in pairs(t28) do
		v:Destroy()
	end

	audioServiceUndimSongs()
	v1065:Destroy()
	effectsServiceSetCardZIndex(p224, p224.ZIndex - 99999)
end
function module.PurifierSummon(p227, p228, _, p230)
	audioServiceDimSongs()
	p228.Visible = true
	audioServicePlaySound("purifier_sting")
	effectsServiceSetCardZIndex(p228, p228.ZIndex + 99999)

	local battleNew = p227.Parent.BattleNew
	local virtualEnemyTerrain = p227.Parent.BattleNew.VirtualEnemyTerrain
	local virtualTerrain = p227.Parent.BattleNew.VirtualTerrain
	local s1

	if p230 == "" then
		s1 = "Enemy"
	elseif p230 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local t29: {[any]: any} = {}
	local v1085 = p228.Position
	local absoluteSize = p228.AbsoluteSize

	audioServicePlaySound("PreSlash")
	p228.Position = UDim2.fromOffset(virtualEnemyTerrain.AbsolutePosition.X, -p228.AbsoluteSize.Y)

	local animationAnimateAsync = animation.AnimateAsync
	local v1088 = p228.Position
	local v1089 = UDim2.fromOffset(0, battleNew.AbsoluteSize.Y + p228.AbsoluteSize.Y * 1.5)

	animationAnimateAsync(p228, { Position = v1088 + v1089 }, 1, "Out", "Quart")
	task.spawn(function()
		for _ = 1, 14 do
			local color3 = Color3.fromRGB(255, 0, 0)
			local v1742 = p228.Size
			local v1743 = p228
			local uDim2 = UDim2.new(0, v1743.AbsolutePosition.X, 0, v1743.AbsolutePosition.Y)
			local uDim247 = UDim2.new(0, v1743.AbsoluteSize.X * 0.5, 0, v1743.AbsoluteSize.Y * 0.5)
			local v1746 = effectsServiceNewerCircle(p227, {
				Image = "rbxassetid://90827927052241",
				ImageColor3 = color3,
				Size = v1742,
				Position = uDim2 + uDim247,
				ZIndex = p228.ZIndex - 1,
				Rotation = p228.Rotation
			})

			animation.AnimateAsync(v1746, { ImageTransparency = 1 }, 1.1, "Out", "Quart")
			table.insert(t29, v1746)
			task.wait(0.1)
		end

		for _, v in pairs(t29) do
			v:Destroy()
		end
	end)
	task.wait(0.3)

	local n1 = p228.ZIndex + 10000
	local v1091 = UDim2.fromOffset(virtualEnemyTerrain.AbsoluteSize.Y * 4, virtualEnemyTerrain.AbsoluteSize.Y * 4)
	local uDim2 = UDim2.new(0, virtualEnemyTerrain.AbsolutePosition.X, 0, virtualEnemyTerrain.AbsolutePosition.Y)
	local uDim248 = UDim2.new(0, virtualEnemyTerrain.AbsoluteSize.X * 0.5, 0, virtualEnemyTerrain.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(-10, 10)
	local color3 = Color3.fromRGB(255, 0, 0)
	local v1096 = effectsServiceNewerCircle(p227, {
		Image = "rbxassetid://5089147697",
		ZIndex = n1,
		Size = v1091,
		Position = uDim2 + uDim248,
		Rotation = -45 + randomNumber,
		ImageColor3 = color3
	})

	task.spawn(function()
		effectsService.Shake(v1096, v1096.Position, 0.3, 0.1)
		task.wait(0.5)
		animation.Animate(v1096, { ImageTransparency = 1 }, 0.4, "Out", "Quart")
		v1096:Destroy()
	end)
	audioServicePlaySound("MidSlash")
	task.wait(0.8)
	audioServicePlaySound("PreSlash")
	p228.Position = UDim2.fromOffset(virtualTerrain.AbsolutePosition.X - virtualTerrain.AbsoluteSize.X / 2, battleNew.AbsoluteSize.Y)
	p228.Rotation = 45

	local animateAsync = animation.AnimateAsync

	v1088 = p228.Position
	v1089 = UDim2.fromOffset(0, battleNew.AbsoluteSize.Y + p228.AbsoluteSize.Y / 2)
	animateAsync(p228, { Rotation = 15, Position = v1088 - v1089 }, 0.8, "Out", "Quart")
	task.wait(0.3)

	local n2 = p228.ZIndex + 10000
	local v1099 = UDim2.fromOffset(virtualTerrain.AbsoluteSize.Y * 4, virtualTerrain.AbsoluteSize.Y * 4)
	local uDim249 = UDim2.new(0, virtualTerrain.AbsolutePosition.X, 0, virtualTerrain.AbsolutePosition.Y)
	local uDim250 = UDim2.new(0, virtualTerrain.AbsoluteSize.X * 0.5, 0, virtualTerrain.AbsoluteSize.Y * 0.5)
	local randomNumber29 = math.random(-10, 10)
	local color356 = Color3.fromRGB(255, 0, 0)
	local v1104 = effectsServiceNewerCircle(p227, {
		Image = "rbxassetid://5089147697",
		ZIndex = n2,
		Size = v1099,
		Position = uDim249 + uDim250,
		Rotation = -45 + randomNumber29,
		ImageColor3 = color356
	})

	task.spawn(function()
		effectsService.Shake(v1104, v1104.Position, 0.3, 0.1)
		task.wait(0.5)
		animation.Animate(v1104, { ImageTransparency = 1 }, 0.4, "Out", "Quart")
		v1104:Destroy()
	end)
	audioServicePlaySound("MidSlash")
	task.wait(0.5)
	animation.Animate(p228, { Rotation = -360, Position = v1085 }, 0.5, "In", "Quint")
	task.spawn(function()
		for _, v in pairs(p228.Parent:GetChildren()) do
			if v ~= p228 then
				local vAbsolutePosition = v.AbsolutePosition
				local vAbsoluteSize = v.AbsoluteSize

				task.spawn(function()
					local animationAnimateAsync = animation.AnimateAsync
					local v1877 = UDim2.fromOffset(vAbsolutePosition.X - vAbsoluteSize.X * 0.25, vAbsolutePosition.Y - vAbsoluteSize.Y * 0.25)
					local v1878 = UDim2.fromOffset(vAbsoluteSize.X * 1.5, vAbsoluteSize.Y * 1.5)
					local randomNumber30 = math.random(-10, 10)

					animationAnimateAsync(v, { Position = v1877, Size = v1878, Rotation = randomNumber30 }, 0.5, "Out", "Quint")
					task.wait(0.3)

					local animationAnimate = animation.Animate

					v1878 = UDim2.fromOffset(vAbsolutePosition.X, vAbsolutePosition.Y)
					v1877 = UDim2.fromOffset(vAbsoluteSize.X, vAbsoluteSize.Y)
					animationAnimate(v, { Rotation = 0, Position = v1878, Size = v1877 }, 0.5, "In", "Quint")
				end)
			end
		end

		for _, v in pairs(_G.__NoFaces(p228.Parent.Parent[s1 .. "Field"])) do
			local absolutePosition = v.AbsolutePosition
			local absoluteSize = v.AbsoluteSize

			task.spawn(function()
				local animationAnimateAsync = animation.AnimateAsync
				local v1882 = UDim2.fromOffset(absolutePosition.X - absoluteSize.X * 0.25, absolutePosition.Y - absoluteSize.Y * 0.25)
				local v1883 = UDim2.fromOffset(absoluteSize.X * 1.5, absoluteSize.Y * 1.5)
				local randomNumber31 = math.random(-10, 10)

				animationAnimateAsync(v, { Position = v1882, Size = v1883, Rotation = randomNumber31 }, 0.5, "Out", "Quint")
				task.wait(0.3)

				local animationAnimate = animation.Animate

				v1883 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)
				v1882 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
				animationAnimate(v, { Rotation = 0, Position = v1883, Size = v1882 }, 0.5, "In", "Quint")
			end)
		end
	end)
	audioServicePlaySound("LargeImpact")
	effectsService.ShakeBattleSync(p227, 0.2, 0.025)
	task.wait(0.5)
	effectsServiceSetCardZIndex(p228, p228.ZIndex - 99999)
	audioServiceUndimSongs()
end
function module.SacrificeSummon(p231, p232, _, _)
	audioServiceDimSongs()

	local v1109 = p232.Position
	local absoluteSize = p232.AbsoluteSize

	effectsServiceSetCardZIndex(p232, p232.ZIndex + 99999)
	p232.Visible = false

	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p232.ZIndex - 1
	local v1113 = uDim2New(1, 0, 2, 0)
	local v1114 = uDim2New(0.5, 0, 0.5, 0)
	local v1115 = effectsServiceNewerCircle(p231, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1113,
		Position = v1114
	})

	audioServicePlaySound("sacrifice_sting")
	audioServicePlaySound("clock")
	task.spawn(function()
		local n1 = p232.ZIndex + 1
		local v1758 = UDim2.fromOffset(p232.AbsoluteSize.Y, p232.AbsoluteSize.Y)
		local v1759 = UDim2.fromOffset(p232.AbsolutePosition.X + p232.AbsoluteSize.Y, p232.AbsolutePosition.Y)
		local v1760 = effectsServiceNewerCircle(p231, {
			Name = "Nicholas",
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://101922865995346",
			Rotation = 0,
			ZIndex = n1,
			Size = v1758,
			Position = v1759
		})
		local animationAnimateAsync = animation.AnimateAsync
		local v1762 = v1760.Position
		local v1763 = UDim2.fromOffset(v1760.AbsoluteSize.X / 2)

		animationAnimateAsync(v1760, { Position = v1762 - v1763 }, 3.5, "Out", "Linear")
		task.wait(0.5)
		animation.Animate(v1760, { ImageTransparency = 0.7 }, 2, "In", "Quad")
		animation.Animate(v1760, { ImageTransparency = 1 }, 1, "In", "Quad")
		v1760:Destroy()
	end)
	animation.AnimateAsync(v1115, { BackgroundTransparency = 0.1 }, 0.3, "Out", "Quad")

	local t30: {[any]: any} = {}

	for i = 1, 10 do
		local color357 = Color3.fromRGB(255, 255, 255)
		local v1119 = p232.Size
		local uDim2 = UDim2.new(0, p232.AbsolutePosition.X, 0, p232.AbsolutePosition.Y)
		local uDim251 = UDim2.new(0, p232.AbsoluteSize.X * 0.5, 0, p232.AbsoluteSize.Y * 0.5)
		local v1122 = UDim2.fromOffset(p232.AbsoluteSize.X * 1.1 * (i - 1), 0)
		local v1123 = effectsServiceNewerCircle(p231, {
			Image = "rbxassetid://90827927052241",
			ImageColor3 = color357,
			Size = v1119,
			Position = uDim2 + uDim251 + v1122,
			ZIndex = p232.ZIndex + 1
		})

		table.insert(t30, v1123)
	end

	for i = 1, 2 do
		for _, v in pairs(t30) do
			local animationAnimateAsync = animation.AnimateAsync
			local vPosition = v.Position
			local v1129 = UDim2.fromOffset(p232.AbsoluteSize.X * 1.1)

			animationAnimateAsync(v, { Position = vPosition - v1129 }, 0.8, "Out", "Quart")
		end

		local animationAnimate = animation.Animate
		local v1131 = t30[i]
		local color358 = Color3.fromRGB(50, 150, 50)

		animationAnimate(v1131, { ImageTransparency = 1, ImageColor3 = color358 }, 0.8, "Out", "Quart")
	end

	p232.Visible = true

	for _, v in pairs(t30) do
		animation.AnimateAsync(v, { ImageTransparency = 1 }, 0.5, "Out", "Quart")
	end

	audioServicePlaySound("leaves")

	for _ = 1, 8 do
		for _ = 1, 2 do
			local n2 = p232.ZIndex + 100000
			local uDim252 = UDim2.new(0, p232.AbsoluteSize.X / 2.5, 0, p232.AbsoluteSize.X / 2.5)
			local v1139 = UDim2.fromOffset(p231.Parent.AbsoluteSize.X, math.random(0, p231.Parent.AbsoluteSize.Y))
			local color359 = Color3.fromRGB(70, 255, 70)
			local randomNumber = math.random(0, 360)
			local v1142 = effectsServiceNewerCircle(p231, {
				Image = "rbxassetid://6602413638",
				ImageTransparency = 0.2,
				ZIndex = n2,
				Size = uDim252,
				Position = v1139,
				ImageColor3 = color359,
				Rotation = randomNumber
			})

			task.spawn(function()
				local animationAnimate = animation.Animate
				local v1765 = v1142.Position
				local uDim2FromOffset = UDim2.fromOffset
				local randomNumber32 = math.random(p231.Parent.AbsoluteSize.X, p231.Parent.AbsoluteSize.X * 1.5)
				local uDim2 = uDim2FromOffset(randomNumber32, 0)
				local randomNumber33 = math.random(0, 360)

				animationAnimate(v1142, {
					ImageTransparency = 1,
					Position = v1765 - uDim2,
					Rotation = randomNumber33
				}, 3, "Out", "Quad")
				v1142:Destroy()
			end)
		end

		task.wait(0.1)
	end

	for _, v in pairs(t30) do
		v:Destroy()
	end

	task.spawn(function()
		animation.Animate(v1115, { BackgroundTransparency = 1 }, 0.3, "Out", "Quad")
		v1115:Destroy()
	end)
	effectsServiceSetCardZIndex(p232, p232.ZIndex - 99999)
	audioServiceUndimSongs()
end
function module.BlackmooreSummon(p235, p236, _, _)
	audioServiceDimSongs()
	audioServicePlaySound("sting_evil")

	local virtualField = p235.Parent.BattleNew.VirtualField

	p236.Visible = true

	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p236.ZIndex - 1
	local v1152 = uDim2New(1, 0, 2, 0)
	local v1153 = uDim2New(0.5, 0, 0.5, 0)
	local v1154 = effectsServiceNewerCircle(p235, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1152,
		Position = v1153
	})

	task.wait(0.1)
	animation.AnimateAsync(v1154, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
	effectsServiceSetCardZIndex(p236, p236.ZIndex + 99999)

	local v1155 = p235.Parent.BattleNew.VirtualField
	local v1156 = p236.Position
	local absoluteSize = p236.AbsoluteSize

	p236.Size = uDim2New(0, 0, 0, 0)
	p236.Position = UDim2.fromScale(2, 2)
	p236.Visible = false
	p236.AnchorPoint = Vector2.new(0.5, 0.5)
	p236.ImageColor3 = Color3.fromRGB(0, 0, 0)
	p236.Visible = true
	p236.Position = uDim2New(0.5, 0, 0.5, 0)

	local animationAnimate = animation.Animate
	local v1159 = UDim2.fromOffset(absoluteSize.X * 1.4, absoluteSize.Y * 1.4)

	animationAnimate(p236, { Size = v1159 }, 0.8, "Out", "Quart")
	audioServicePlaySound("lightning_strike")

	local color360 = Color3.fromRGB(255, 255, 255)

	v1159 = UDim2.fromOffset(v1155.AbsoluteSize.X, v1155.AbsoluteSize.X)

	local v1161 = uDim2New(0.5, 0, 0.5, 0)
	local randomNumber = math.random(0, 180)
	local v1163 = effectsServiceNewerCircle(p235, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://11862032588",
		ImageColor3 = color360,
		Size = v1159,
		Position = v1161,
		Rotation = randomNumber,
		ZIndex = p236.ZIndex - 1
	})

	animation.AnimateAsync(v1163, { ImageTransparency = 0 }, 0.4, "Out", "Quad")
	task.spawn(function()
		effectsServiceSpritesheet(v1163, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
		animation.Animate(v1163, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v1163:Destroy()
	end)
	v1154.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	v1154.BackgroundTransparency = 0
	p236.Size = UDim2.fromOffset(absoluteSize.X * 1.6, absoluteSize.Y * 1.6)
	p236.ImageColor3 = Color3.fromRGB(255, 255, 255)

	local animationAnimateAsync = animation.AnimateAsync
	local v1165 = UDim2.fromOffset(absoluteSize.X * 1.4, absoluteSize.Y * 1.4)

	animationAnimateAsync(p236, { Size = v1165 }, 1, "Out", "Quart")
	animation.AnimateAsync(v1154, { BackgroundTransparency = 1 }, 1, "Out", "Quad")
	task.wait(1)
	audioServicePlaySound("evil_laugh")

	local u1166 = nil
	local u1167 = nil

	task.spawn(function()
		local v1770 = UDim2.fromOffset(p236.AbsoluteSize.X / 1.5, p236.AbsoluteSize.Y / 1.5)
		local v1771 = p236
		local uDim2 = UDim2.new(0, v1771.AbsolutePosition.X, 0, v1771.AbsolutePosition.Y)
		local uDim253 = UDim2.new(0, v1771.AbsoluteSize.X * 0.5, 0, v1771.AbsoluteSize.Y * 0.5)

		u1166 = effectsServiceNewCard(p235, {
			Image = "rbxassetid://137009539383461",
			Size = v1770,
			Position = uDim2 + uDim253,
			ZIndex = p236.ZIndex - 1
		})

		local animationAnimateAsync = animation.AnimateAsync
		local v1775 = u1166

		v1771 = u1166.Position

		local v1776 = UDim2.fromOffset(-p236.AbsoluteSize.X / 1.5)

		animationAnimateAsync(v1775, { Rotation = -20, Position = v1771 + v1776 }, 0.5, "Out", "Quart")
		v1770 = UDim2.fromOffset(p236.AbsoluteSize.X / 1.5, p236.AbsoluteSize.Y / 1.5)
		v1771 = p236

		local uDim254 = UDim2.new(0, v1771.AbsolutePosition.X, 0, v1771.AbsolutePosition.Y)
		local uDim255 = UDim2.new(0, v1771.AbsoluteSize.X * 0.5, 0, v1771.AbsoluteSize.Y * 0.5)

		u1167 = effectsServiceNewCard(p235, {
			Image = "rbxassetid://137009539383461",
			Size = v1770,
			Position = uDim254 + uDim255,
			ZIndex = p236.ZIndex - 1
		})

		local animateAsync = animation.AnimateAsync

		v1775 = u1167
		v1771 = u1167.Position
		v1776 = UDim2.fromOffset(p236.AbsoluteSize.X / 1.5)
		animateAsync(v1775, { Rotation = 20, Position = v1771 + v1776 }, 0.5, "Out", "Quart")
	end)
	task.wait(0.5)
	task.spawn(function()
		animation.AnimateAsync(u1166, { Rotation = 0, AnchorPoint = Vector2.new(0, 0), Position = v1156 }, 0.7, "In", "Quint")
		animation.Animate(u1167, { Rotation = 0, AnchorPoint = Vector2.new(0, 0), Position = v1156 }, 0.7, "In", "Quint")
		u1166:Destroy()
		u1167:Destroy()
	end)
	animation.AnimateAsync(v1154, { BackgroundTransparency = 1 }, 0.4, "Out", "Quad")

	local animateAsync = animation.AnimateAsync
	local v1169 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)

	animateAsync(p236, { Size = v1169 }, 0.7, "In", "Quint")
	animation.AnimateAsync(p236, { AnchorPoint = Vector2.new(0, 0) }, 0.7, "In", "Quint")
	animation.AnimateAsync(p236, { Rotation = 0 }, 0.7, "In", "Quint")
	animation.Animate(p236, { Position = v1156 }, 0.7, "In", "Quint")
	effectsServiceSetCardZIndex(p236, p236.ZIndex - 99999)
	v1154:Destroy()
	audioServiceUndimSongs()
end

taintedTexts = { "hehe", "Eheha!", "Haha!", "aahehe" }

function module.TaintedSummon(p239, p240, p241, p242)
	audioServiceDimSongs()

	local v1174 = p240.Position
	local absoluteSize = p240.AbsoluteSize

	p240.Visible = true
	effectsServiceSetCardZIndex(p240, p240.ZIndex + 99999)

	local battleNew = p239.Parent.BattleNew
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p240.ZIndex - 1
	local v1179 = uDim2New(1, 0, 2, 0)
	local v1180 = uDim2New(0.5, 0, 0.5, 0)
	local v1181 = effectsServiceNewerCircle(p239, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1179,
		Position = v1180
	})
	local sourceSans = Enum.Font.SourceSans
	local color361 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(-20, 20)
	local n2 = p240.ZIndex + 10000

	p240.Position = UDim2.fromOffset(battleNew.AbsoluteSize.X, battleNew.AbsoluteSize.Y / 2 - p240.AbsoluteSize.Y / 2)
	audioServicePlaySound("sting_tainted")
	animation.Animate(v1181, { BackgroundTransparency = 0.1 }, 0.3, "Out", "Quad")
	audioServicePlaySound("skull_kid_laugh")
	animation.AnimateAsync(p240, { Rotation = -30 }, 2, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local v1187 = p240.Position
	local v1188 = UDim2.fromOffset(p240.AbsoluteSize.X * 1.25, 0)

	animationAnimateAsync(p240, { Position = v1187 - v1188 }, 0.6, "Out", "Quart")

	local t31: {[any]: any} = {
		Text = "Ehehe!",
		Font = sourceSans,
		TextColor3 = color361,
		TextStrokeTransparency = 0,
		Rotation = randomNumber,
		ZIndex = n2
	}

	task.spawn(function()
		for _ = 1, 5 do
			task.spawn(function()
				t31.Rotation = math.random(-20, 20)

				local randomNumber34 = math.random(1, #taintedTexts)

				t31.Text = taintedTexts[randomNumber34]
				effectsServiceSpeak(p239, p240, p241, p242, t31, 0.1)
			end)
			task.wait(0.15)
		end
	end)
	task.wait(0.5)

	local animationAnimate = animation.Animate

	v1187 = p240.Position
	v1188 = UDim2.fromOffset(p240.AbsoluteSize.X * 1.5, 0)
	animationAnimate(p240, { Position = v1187 + v1188 }, 0.75, "In", "Quart")
	p240.Position = UDim2.fromOffset(-p240.AbsoluteSize.X * 1.25, battleNew.AbsoluteSize.Y / 2 - p240.AbsoluteSize.Y / 2)
	animation.AnimateAsync(p240, { Rotation = 1170 }, 1.05, "Out", "Linear")

	local animateAsync = animation.AnimateAsync

	v1187 = p240.Position
	v1188 = UDim2.fromOffset(v1174.X.Offset / 1.25, -v1174.Y.Offset + absoluteSize.Y)
	animateAsync(p240, { Position = v1187 + v1188 }, 0.6, "Out", "Quad")
	task.wait(0.4)

	local animate = animation.Animate

	v1187 = UDim2.fromOffset(0, p240.AbsoluteSize.Y / 4)
	animate(p240, { Position = v1174 + v1187 }, 0.65, "In", "Quad")
	v1181:Destroy()
	audioServicePlaySound("body_impact")
	t31.Text = "owie"
	effectsServiceSpeak(p239, p240, p241, p242, t31, 0.1)
	task.wait(0.1)
	p240.Rotation = 90
	task.wait(0.3)
	audioServicePlaySound("fabric")
	animation.AnimateAsync(p240, { Rotation = 0, Position = v1174 }, 0.3, "Out", "Quart")
	effectsServiceSetCardZIndex(p240, p240.ZIndex - 99999)
	audioServiceUndimSongs()
end
function module.CelesSummon(p243, p244, _, _, _)
	p244.Visible = false

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1199 = uDim2New(1, 0, 2, 0)
	local v1200 = uDim2New(0.5, 0, 0.5, 0)
	local v1201 = effectsServiceNewerCircle(p243, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3,
		Size = v1199,
		Position = v1200
	})
	local image = p244.Image
	local v1203 = uDim2New(0, p244.AbsoluteSize.X * 1.7, 0, p244.AbsoluteSize.Y * 1.7)
	local v1204 = uDim2New(0.5, 0, 2, 0)
	local v1205 = effectsServiceNewerCircle(p243, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		Image = image,
		Size = v1203,
		Position = v1204
	})
	local v1206 = uDim2New(0, p244.AbsoluteSize.X * 1, 0, p244.AbsoluteSize.X * 1)
	local v1207 = uDim2New(0.5, 0, 2, 0)
	local v1208 = effectsServiceNewerCircle(p243, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10002,
		Image = "rbxassetid://118816466559877",
		Size = v1206,
		Position = v1207
	})

	audioService.PlaySound("Count Celes")

	local animationAnimateAsync = animation.AnimateAsync
	local v1210 = uDim2New(0.5, 0, 0.3, 0)

	animationAnimateAsync(v1205, { Position = v1210 }, 2, "Out", "Quad")

	local animateAsync = animation.AnimateAsync

	v1210 = uDim2New(0.5, 0, 0.3, 0)
	animateAsync(v1208, { Rotation = 32, Position = v1210 }, 2, "Out", "Sine")
	animation.AnimateAsync(v1201, { BackgroundTransparency = 0.3 }, 0.4, "Out", "Quad")
	task.wait(2)

	local v1212 = animation.AnimateAsync

	v1210 = uDim2New(0.5, 0, 0.34, 0)
	v1212(v1208, { Rotation = 70, Position = v1210 }, 0.2, "Out", "Sine")
	task.wait(0.4)
	task.spawn(function()
		local randomNumber = math.random(20, 80)
		local randomNumber35 = math.random(20, 80)
		local animationAnimateAsync = animation.AnimateAsync
		local v1784 = uDim2New(0, p244.AbsoluteSize.X * 0.6, 0, p244.AbsoluteSize.X * 0.6)
		local v1785 = uDim2New(randomNumber / 100, 0, randomNumber35 / 100, 0)

		animationAnimateAsync(v1208, { Rotation = -1780, Size = v1784, Position = v1785 }, 2, "InOut", "Quad")
		task.wait(10)
		animation.AnimateAsync(v1208, { ImageTransparency = 1 }, 1, "Out", "Sine")
		task.wait(1)
		v1208:Destroy()
	end)

	local v1213 = animation.AnimateAsync
	local uDim2 = UDim2.new(0, p244.AbsolutePosition.X, 0, p244.AbsolutePosition.Y)
	local uDim256 = UDim2.new(0, p244.AbsoluteSize.X * 0.5, 0, p244.AbsoluteSize.Y * 0.5)

	v1210 = uDim2New(0, p244.AbsoluteSize.X, 0, p244.AbsoluteSize.Y)
	v1213(v1205, { Position = uDim2 + uDim256, Size = v1210 }, 1, "In", "Exponential")
	animation.AnimateAsync(v1201, { BackgroundTransparency = 1 }, 1, "Out", "Quad")
	task.wait(1)
	p244.Visible = true
	v1205:Destroy()
	v1201:Destroy()
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t38: {[any]: any} = { Color3.fromRGB(179, 167, 138), Color3.fromRGB(218, 215, 204) }
		local v1788 = UDim2.fromOffset(p244.AbsoluteSize.X * 0.6, p244.AbsoluteSize.X * 0.6)

		effectsServiceBreath(p243, p244, p244, {
			Strength = 500,
			ZIndex = -99999,
			Time = 0.2,
			Projectile = effectsServiceBreathimagesFire,
			Color = t38,
			Size = v1788
		})
	end)
	task.spawn(function()
		effectsService.ShakeSync(p244, p244.Position, 0.15, 0.05)
		audioServicePlaySound("HammerImpact")
	end)
end
local function DreadLikeEffect(p248, p249, _, p251, p252, p253, p254, p255, p256, p257)
	local t32 = p257 or {}
	local v1227 = t32.slideTime or 2
	local v1228 = t32.fadeInTime or 1
	local v1229 = t32.holdTime or 0.5
	local v1230 = t32.fadeOutTime or 1
	local v1231 = t32.lineDelay or 0.25
	local v1232 = t32.screenFadeIn or 0.4
	local v1233 = t32.screenFadeOut or 1

	audioService.DimSongs(0.001)
	audioServicePlaySound(p252)
	audioServicePlaySound(p253)
	effectsServiceSetCardZIndex(p249, p249.ZIndex + 99999)

	local absolutePosition = p249.AbsolutePosition
	local y = p248.Parent.AbsoluteSize.Y
	local n1: number = if p249.AbsolutePosition.Y > y / 2 then 1 else 0

	p249.Position = UDim2.new(0, absolutePosition.X, 0, y * n1 + p249.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))

	local animationAnimateAsync = animation.AnimateAsync
	local v1238 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimateAsync(p249, { Position = v1238 }, v1227, "Out", "Quad")

	local color3 = Color3.fromRGB(0, 0, 0)
	local n2 = p249.ZIndex - 2
	local v1241 = uDim2New(1, 0, 2, 0)
	local v1242 = uDim2New(0.5, 0, 0.5, 0)
	local v1243 = effectsServiceNewerCircle(p248, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n2,
		Size = v1241,
		Position = v1242
	})

	animation.AnimateAsync(v1243, { BackgroundTransparency = 0.1 }, v1232, "Out", "Quart")
	n1 = #p251

	local n3 = 1 / math.max(n1, 1)

	for i = 1, n1 do
		local v1246 = p254 and p254(i)

		if not v1246 then
			v1246 = Color3.fromRGB(255, 0, 0)
		end

		local v1247 = UDim2.fromScale(3, n3)
		local v1248 = UDim2.fromScale(0.5, n3 * (i - 1))
		local v1249 = tostring(p251[i]):upper()
		local v1250 = effectsServiceNewText(p248, {
			BackgroundTransparency = 1,
			TextScaled = true,
			TextTransparency = 1,
			Size = v1247,
			Position = v1248,
			Text = v1249,
			ZIndex = p249.ZIndex + (p255 or -1),
			TextColor3 = v1246,
			Font = Enum.Font.Antique
		})

		task.spawn(function()
			animation.Animate(v1250, { TextTransparency = 0 }, v1228, "Out", "Quart")
			task.wait(v1229)
			animation.Animate(v1250, { TextTransparency = 1 }, v1230, "In", "Quart")
			v1250:Destroy()
		end)
		task.wait(v1231)
	end

	task.wait(p256 or 1.25)
	animation.Animate(v1243, { BackgroundTransparency = 1 }, v1233, "Out", "Quart")
	v1243:Destroy()
	audioService.UndimSongs()
	effectsServiceSetCardZIndex(p249, p249.ZIndex - 99999)
end
function module.DreadPriest(p258, p259, _, p261)
	DreadLikeEffect(p258, p259, p261, {
		"Do not conform to the pattern of this world, but be transformed by the renewing of your mind.",
		"Whoever heeds discipline shows the way to life, but whoever ignores correction leads others astray.",
		"Who is wise and understanding among you? Let them show it by their good life.",
		"The one who gets wisdom loves life.",
		"When times are good, be happy.",
		"For whoever wants to save their life will lose it.",
		"Don’t let anyone look down on you because you are young.",
		"The heart is deceitful above all things.",
		"For we know that if the earthly tent is destroyed."
	}, "Organ Theme", "walk", nil, nil, 1.25)
end
function module.IntertwinedStep(p262, p263, _, p265)
	DreadLikeEffect(p262, p263, p265, {
		"Silence.",
		"Indifference.",
		"Can you really say you're clean?",
		"All the things you've abandoned until now.",
		"The memories you kept turning away from.",
		"Buried beneath twisted wishes.",
		"Write it all down.",
		"Weave it together into memory."
	}, "Judgment", "walk", nil, 1, 1.25)
end
function module.SoulyStep(p266, p267, _, p269)
	local color3 = Color3.fromRGB(227, 181, 255)
	local color362 = Color3.fromRGB(47, 15, 74)

	DreadLikeEffect(p266, p267, p269, {
		"THE WHISPER ARRIVES BEFORE THE DECISION.",
		"THE CROWN WAITS FOR NONE.",
		"STILLNESS IS NOT PEACE.",
		"OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY",
		"THE PATH APPEARS ONLY ONCE.",
		"TRUTH SHIFTS WHEN SEEN.",
		"WHAT STANDS IS NEVER UNTOUCHED.",
		"THE THRONE KEEPS ITS DEBTORS.",
		"OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY OBEY"
	}, "Bird's Eye View - Sting 01", "walk", function(p270)
		return color3:Lerp(color362, (p270 - 1) / 8)
	end, 1, 1.75)
end
function module.AdInfinitum(p271, p272, _, p274)
	DreadLikeEffect(p271, p272, p274, {
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,",
		"END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END, END,"
	}, "Bird's Eye View - Sting 01", "walk", nil, -1, 0.7, {
		slideTime = 1.35,
		fadeInTime = 0.45,
		holdTime = 0.2,
		fadeOutTime = 0.5,
		lineDelay = 0.15,
		screenFadeIn = 0.25,
		screenFadeOut = 0.5
	})
end
function module.NotaDeveloper(p275, p276, _, p278)
	local color3 = Color3.fromRGB(0, 55, 255)
	local color363 = Color3.fromRGB(163, 110, 255)
	local color364 = Color3.fromRGB(7, 86, 255)
	local color365 = Color3.fromRGB(98, 255, 231)
	local color366 = Color3.fromRGB(176, 0, 245)
	local t33: {[any]: any} = {
		color3,
		color363,
		color364,
		color365,
		color366,
		Color3.fromRGB(35, 204, 255)
	}

	DreadLikeEffect(p275, p276, p278, {
		"NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER Blame IcyTea for this VFX :) NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER",
		"ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV",
		"ICYTEA JOINED ROBLOX ICYTEA JOINED ROBLOX ICYTEA JOINED ROBLOX ICYTEA JOINED ROBLOX ICYTEA JOINED ROBLOX",
		"JUNE 1st, 2010 - JUNE 1st, 2010 - JUNE 1st, 2010 - JUNE 1st, 2010 - JUNE 1st, 2010",
		"BLOX CARDS FOUNDED IN BLOX CARDS FOUNDED IN BLOX CARDS FOUNDED IN BLOX CARDS FOUNDED IN BLOX CARDS FOUNDED IN",
		"JULY 14, 2015 - JULY 14, 2015 - JULY 14, 2015 - JULY 14, 2015 - JULY 14, 2015",
		"IcyTea's not a developer!...IcyTea's not a developer!...IcyTea's not a developer!...IcyTea's not a developer!...",
		"NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER NOT A DEVELOPER",
		"ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV ICYTEA IS NOT A DEV"
	}, "SpecialFighter", "walk", function()
		local randomNumber = math.random(1, #t33)

		return t33[randomNumber]
	end, 1, 1, {
		slideTime = 0.85,
		fadeInTime = 0.45,
		holdTime = 0.2,
		fadeOutTime = 0.5,
		lineDelay = 0.15,
		screenFadeIn = 0.25,
		screenFadeOut = 0.5
	})
	audioServicePlaySound("Chatot")
end
function module.bobulatorSummon(p279, p280, _, _)
	p280.Visible = false
	audioServiceDimSongs()

	local color3 = Color3.fromRGB(22, 22, 22)
	local n1 = p280.ZIndex + 99998
	local v1285 = uDim2New(1, 0, 2, 0)
	local v1286 = uDim2New(0.5, 0, 0.5, 0)
	local v1287 = effectsServiceNewerCircle(p279, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v1285,
		Position = v1286
	})
	local n2 = p280.ZIndex + 1
	local image = p280.Image
	local color367 = Color3.fromHSV(0, 0, 0.02)
	local uDim2 = UDim2.new(0, p280.AbsoluteSize.X, 0, p280.AbsoluteSize.Y)
	local v1292 = UDim2.fromOffset(p280.AbsolutePosition.X + p280.AbsoluteSize.X / 2, p280.AbsolutePosition.Y + p280.AbsoluteSize.Y / 2)
	local v1293 = effectsServiceNewerCircle(p279, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = n2,
		Image = image,
		ImageColor3 = color367,
		Size = uDim2,
		Position = v1292
	})

	animation.AnimateAsync(v1287, { BackgroundTransparency = 0.2 }, 0.2, "InOut", "Sine")

	local animationAnimateAsync = animation.AnimateAsync
	local color368 = Color3.fromHSV(0, 0, 1)

	animationAnimateAsync(v1293, { ImageTransparency = 0, ImageColor3 = color368 }, 5, "InOut", "Sine")
	audioServicePlaySound("halloween", { PlaybackSpeed = 0.2, TimePosition = 0.2 })
	task.wait(5)
	audioServicePlaySound("thunder2")
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local color369 = Color3.fromHSV(0, 0, 1)

		animationAnimateAsync(v1287, { BackgroundTransparency = 0.6, BackgroundColor3 = color369 }, 0, "InOut", "Sine")
		task.wait(0.2)

		local animateAsync = animation.AnimateAsync
		local color370 = Color3.fromHSV(0, 0, 1)

		animateAsync(v1287, { BackgroundTransparency = 1, ImageColor3 = color370 }, 1, "InOut", "Sine")
		task.wait(1)
		v1287:Destroy()
	end)
	audioServiceUndimSongs()
	v1293:Destroy()
	p280.Visible = true
end
function module.StationSummon(p283, p284, _, _, _)
	task.spawn(function()
		for _ = 1, 13 do
			task.spawn(function()
				local randomNumber = math.random(50, 150)
				local randomNumber36 = math.random(40, 120)
				local randomNumber37 = math.random(-360, 360)
				local n1 = p284.ZIndex - 1
				local uDim2 = UDim2.new(0, p284.AbsoluteSize.X * 0.7, 0, p284.AbsoluteSize.X * 0.7)
				local color3 = Color3.fromRGB(211, 255, 255)
				local v1893 = UDim2.fromOffset(p284.AbsolutePosition.X + p284.AbsoluteSize.X / 2, p284.AbsolutePosition.Y + p284.AbsoluteSize.Y / 2)
				local v1894 = effectsServiceNewerCircle(p283, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.8,
					Image = "rbxassetid://78807031729676",
					ZIndex = n1,
					Size = uDim2,
					ImageColor3 = color3,
					Position = v1893
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v1896 = UDim2.fromOffset((p284.AbsolutePosition.X + p284.AbsoluteSize.X / 2) * (randomNumber / 100), (p284.AbsolutePosition.Y + p284.AbsoluteSize.Y / 2) * 0.7 * (randomNumber36 / 100))

				animationAnimateAsync(v1894, { Position = v1896, Rotation = randomNumber37 }, 0.3, "Out", "Sine")
				task.wait(0.3)

				local animateAsync = animation.AnimateAsync

				v1896 = UDim2.fromOffset((p284.AbsolutePosition.X + p284.AbsoluteSize.X / 2) * (randomNumber / 100), (p284.AbsolutePosition.Y + p284.AbsoluteSize.Y / 2) * 2 * (randomNumber36 / 100))
				animateAsync(v1894, { ImageTransparency = 1, Position = v1896 }, 2, "In", "Sine")
				task.wait(2)
				v1894:Destroy()
			end)
		end
	end)
	audioServicePlaySound("Station", { Volume = 1.8 })
end
function module.CieloSummon(p288, p289, _, _)
	p289.Visible = false
	audioService.DimSongs(0.001)

	local color3 = Color3.fromRGB(155, 0, 0)
	local v1306 = uDim2New(1, 0, 2, 0)
	local n1 = p289.ZIndex + 10000
	local v1308 = uDim2New(0.5, 0, 0.5, 0)
	local v1309 = effectsServiceNewerCircle(p288, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		Size = v1306,
		ZIndex = n1,
		Position = v1308
	})
	local n2 = p289.ZIndex + 10003
	local image = p289.Image
	local v1312 = uDim2New(0, p289.AbsoluteSize.X, 0, p289.AbsoluteSize.Y)
	local color371 = Color3.fromRGB(0, 0, 0)
	local uDim2 = UDim2.new(0, p289.AbsolutePosition.X, 0, p289.AbsolutePosition.Y * -8)
	local v1315 = effectsServiceNewerCircle(p288, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = n2,
		Image = image,
		Size = v1312,
		ImageColor3 = color371,
		Position = uDim2
	})
	local t34: {[any]: any} = {
		"   ALRIGHHTTT, COME AT ME!",
		"     DO WE FIGHT NOW? :O",
		"Lets fight, like right now >:O"
	}
	local randomNumber = math.random(1, 3)

	v1308 = t34[randomNumber]:upper()

	local u1318: boolean = false

	animation.AnimateAsync(v1309, { BackgroundTransparency = 0 }, 0.8, "Out", "Quart")

	for i = 1, #v1308 do
		local v1320 = UDim2.fromScale(2, 0.12)
		local v1321 = UDim2.fromScale(i * 0.06 * 0.4 + 0.2, 0.2)
		local substring = v1308:sub(i, i)
		local n3 = p289.ZIndex + 10001
		local color372 = Color3.fromRGB(0, 0, 0)
		local v1325 = effectsServiceNewText(p288, {
			BackgroundTransparency = 1,
			TextScaled = true,
			TextTransparency = 1,
			Size = v1320,
			Position = v1321,
			Text = substring,
			ZIndex = n3,
			TextColor3 = color372,
			Font = Enum.Font.Bodoni
		})

		task.spawn(function()
			local animationAnimate = animation.Animate
			local v1797 = UDim2.fromScale(i * 0.06 * 0.5 + 0.04, 0.2)

			animationAnimate(v1325, { TextTransparency = 0, Position = v1797 }, 0.3, "Out", "Quart")

			while not u1318 do
				task.wait()
			end

			effectsService.ShakeSync(v1325, v1325.Position, 0.8, 0.05)
			task.wait(1)
			animation.AnimateAsync(v1325, { TextTransparency = 1 }, 0.3, "Out", "Quart")
			task.wait(0.3)
			v1325:Destroy()
		end)

		if v1308:sub(i, i) ~= " " then
			audioServicePlaySound("clickfast.wav")
		end

		task.wait(0.06)
	end

	local animationAnimateAsync = animation.AnimateAsync
	local uDim257 = UDim2.new(0, p289.AbsolutePosition.X, 0, p289.AbsolutePosition.Y)
	local uDim258 = UDim2.new(0, p289.AbsoluteSize.X * 0.5, 0, p289.AbsoluteSize.Y * 0.5)

	animationAnimateAsync(v1315, { Position = uDim257 + uDim258 }, 0.8, "In", "Quart")
	audioServicePlaySound("dbzenter")
	task.wait(0.7)
	audioServicePlaySound("big impact")
	task.wait(0.1)
	u1318 = true
	task.wait(1.4)
	animation.AnimateAsync(v1309, { BackgroundTransparency = 1 }, 0.7, "Out", "Quart")

	local animateAsync = animation.AnimateAsync
	local color373 = Color3.fromRGB(255, 255, 255)

	animateAsync(v1315, { ImageColor3 = color373 }, 0.7, "Out", "Quart")
	task.wait(0.7)
	audioService.UndimSongs()
	p289.Visible = true
	v1309:Destroy()
	v1315:Destroy()
end
function module.VolipaSummon(parent, p293, _, _)
	p293.Visible = false

	local t35: {[any]: any} = {
		"RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL",
		"REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST",
		"REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE",
		"REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT",
		"RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT RESTORE REWRITE RECONSTRUCT REBEL RESIST REVOLT"
	}
	local y = parent.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local n1 = p293.ZIndex + 10003
	local color3 = Color3.fromRGB(255, 0, 0)
	local v1339 = uDim2New(0, y, 0, 0)
	local v1340 = uDim2New(0.5, 0, 1.2, 0)
	local v1341 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://127880278242720",
		Rotation = 0,
		ZIndex = n1,
		ImageColor3 = color3,
		Size = v1339,
		Position = v1340,
		Parent = parent
	})
	local n2 = p293.ZIndex + 10002
	local color374 = Color3.fromRGB(255, 0, 0)
	local v1344 = uDim2New(0, y * 8, 0, y * 2)
	local v1345 = uDim2New(0.5, 0, 0.8, 0)
	local v1346 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://88189783941561",
		Rotation = 0,
		ZIndex = n2,
		ImageColor3 = color374,
		Size = v1344,
		Position = v1345,
		Parent = parent
	})
	local n3 = p293.ZIndex + 10002
	local color375 = Color3.fromRGB(255, 0, 0)
	local v1349 = uDim2New(0, y * 8, 0, y * 2)
	local v1350 = uDim2New(0.5, 0, 0.23, 0)
	local v1351 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://88189783941561",
		Rotation = 180,
		ZIndex = n3,
		ImageColor3 = color375,
		Size = v1349,
		Position = v1350,
		Parent = parent
	})
	local color376 = Color3.fromRGB(0, 0, 0)
	local v1353 = uDim2New(1, 0, 2, 0)
	local n4 = p293.ZIndex - 1
	local v1355 = uDim2New(0.5, 0, 0.5, 0)

	v1340 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color376,
		Size = v1353,
		ZIndex = n4,
		Position = v1355
	})

	local n5 = p293.ZIndex + 10500
	local image = p293.Image
	local v1358 = uDim2New(0, p293.AbsoluteSize.X, 0, p293.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p293.AbsolutePosition.X * 18, 0, p293.AbsolutePosition.Y * 1.5)

	v1345 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = n5,
		Image = image,
		Size = v1358,
		Position = uDim2
	})

	local v1360 = UDim2.fromOffset(p293.AbsoluteSize.X * 2, p293.AbsoluteSize.X * 2)
	local uDim259 = UDim2.new(0, p293.AbsoluteSize.X * -3, 0, p293.AbsoluteSize.Y - 100)
	local v1362 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1360,
		Position = uDim259,
		Parent = v1345
	})
	local n6 = p293.ZIndex + 10500
	local uDim260 = UDim2.new(0, p293.AbsoluteSize.X, 0, p293.AbsoluteSize.Y)
	local uDim261 = UDim2.new(0, p293.AbsoluteSize.X * 0.2, 0, p293.AbsoluteSize.X * 2)
	local v1366 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = n6,
		Size = uDim260,
		Position = uDim261,
		Parent = v1345
	})

	for i = 1, 9 do
		local v1368 = UDim2.fromScale(3, 0.32)
		local v1369 = UDim2.fromScale(0.5, (i - 1) * 0.12)
		local randomNumber = math.random(1, 5)
		local v1371 = t35[randomNumber]:upper()
		local n7 = p293.ZIndex - 2
		local color377 = Color3.fromRGB(255, 0, 0)
		local v1374 = effectsServiceNewText(parent, {
			BackgroundTransparency = 1,
			TextScaled = true,
			TextTransparency = 1,
			Size = v1368,
			Position = v1369,
			Text = v1371,
			ZIndex = n7,
			TextColor3 = color377,
			Font = Enum.Font.SciFi
		})

		task.spawn(function()
			local animationAnimate = animation.Animate
			local v1799 = UDim2.fromScale(1.1, (i - 1) * 0.12)

			animationAnimate(v1374, { TextTransparency = 0, Position = v1799 }, 0.8, "Out", "Quart")

			local animate = animation.Animate

			v1799 = UDim2.fromScale(1.1, (i - 1) * 0.12)
			animate(v1374, { TextTransparency = 1, Position = v1799 }, 2, "In", "Quart")
			v1374:Destroy()
		end)
	end

	audioServiceDimSongs(0.001)
	audioServicePlaySound("WarHorn", { Volume = 0.1 })
	animation.AnimateAsync(v1345, { ImageTransparency = 0 }, 0, "In", "Linear")
	animation.AnimateAsync(v1340, { BackgroundTransparency = 0 }, 0.8, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v1376 = uDim2New(0.5, 0, 0.5, 0)
	local v1377 = uDim2New(0, y, 0, y * 1.36)

	animationAnimateAsync(v1341, { ImageTransparency = 0, Position = v1376, Size = v1377 }, 1.2, "Out", "Quint")
	animation.AnimateAsync(v1351, { ImageTransparency = 0.9 }, 0.8, "Out", "Quad")
	animation.AnimateAsync(v1346, { ImageTransparency = 0.9 }, 0.8, "Out", "Quad")
	task.wait(1)

	local animateAsync = animation.AnimateAsync
	local uDim262 = UDim2.new(0, p293.AbsolutePosition.X, 0, p293.AbsolutePosition.Y)
	local uDim263 = UDim2.new(0, p293.AbsoluteSize.X * 0.5, 0, p293.AbsoluteSize.Y * 0.5)

	animateAsync(v1345, { Position = uDim262 + uDim263 }, 1.3, "Out", "Quint")
	animation.AnimateAsync(v1345, { Rotation = 20 }, 0.3, "Out", "Sine")
	task.wait(0.2)
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t39: {[any]: any} = { Color3.fromRGB(113, 93, 93), Color3.fromRGB(87, 80, 80) }
		local v1803 = UDim2.fromOffset(p293.AbsoluteSize.Y / 4, p293.AbsoluteSize.Y / 4)

		effectsServiceBreath(parent, v1366, v1362, {
			Strength = 5000,
			Time = 0.4,
			Projectile = effectsServiceBreathimagesFire,
			Color = t39,
			Size = v1803,
			ZIndex = p293.ZIndex + 999
		})
	end)
	audioServicePlaySound("GroundSlide")
	task.wait(0.2)
	animation.AnimateAsync(v1345, { Rotation = 0 }, 0.2, "Out", "Sine")
	animation.AnimateAsync(v1340, { BackgroundTransparency = 1 }, 1, "InOut", "Quad")

	local v1381 = animation.AnimateAsync

	v1377 = uDim2New(0.5, 0, 0.4, 0)
	v1376 = uDim2New(0, y * 1.2, 0, y * 1.68)

	local color378 = Color3.fromRGB(255, 222, 0)

	v1381(v1341, {
		ImageTransparency = 1,
		Position = v1377,
		Size = v1376,
		ImageColor3 = color378
	}, 1, "In", "Quad")
	animation.AnimateAsync(v1351, { ImageTransparency = 1 }, 0.8, "Out", "Quad")
	animation.AnimateAsync(v1346, { ImageTransparency = 1 }, 0.8, "Out", "Quad")
	task.wait(1)
	p293.Visible = true
	audioServiceUndimSongs()
	v1341:Destroy()
	v1345:Destroy()
	v1351:Destroy()
	v1346:Destroy()
	v1362:Destroy()
	v1366:Destroy()
	v1340:Destroy()
end
function module.ShedareSummon(p296, p297, _, _)
	p297.Visible = false

	local uDim2 = UDim2.new(0, p297.AbsoluteSize.X * 1.3, 0, p297.AbsoluteSize.X)
	local v1388 = uDim2New(0.5, 0, 0, 0)
	local v1389 = effectsServiceNewerCircle(p296, { ImageTransparency = 1, Size = uDim2, Position = v1388 })
	local uDim264 = UDim2.new(0, p297.AbsoluteSize.X * 1.3, 0, p297.AbsoluteSize.X)
	local v1391 = uDim2New(0, 0, 0, 0)
	local v1392 = effectsServiceNewerCircle(p296, { ImageTransparency = 1, Size = uDim264, Position = v1391 })
	local uDim265 = UDim2.new(0, p297.AbsoluteSize.X * 1.3, 0, p297.AbsoluteSize.X)
	local v1394 = uDim2New(1, 0, 0, 0)
	local v1395 = effectsServiceNewerCircle(p296, { ImageTransparency = 1, Size = uDim265, Position = v1394 })
	local color3 = Color3.fromRGB(10, 10, 14)
	local v1397 = uDim2New(1, 0, 2, 0)
	local n1 = p297.ZIndex + 10002
	local v1399 = uDim2New(0.5, 0, 0.5, 0)

	v1388 = effectsServiceNewerCircle(p296, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		Size = v1397,
		ZIndex = n1,
		Position = v1399
	})

	local color379 = Color3.fromRGB(10, 10, 14)
	local n2 = p297.ZIndex + 10500
	local image = p297.Image
	local v1403 = uDim2New(0, p297.AbsoluteSize.X * 1.3, 0, p297.AbsoluteSize.Y * 1.3)
	local v1404 = uDim2New(0.5, 0, 1.2, 0)
	local v1405 = effectsServiceNewerCircle(p296, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = color379,
		ZIndex = n2,
		Image = image,
		Size = v1403,
		Position = v1404
	})
	local t36: {[any]: any} = {
		"rbxassetid://70809611399508",
		"rbxassetid://96927900234791",
		"rbxassetid://128515191205132"
	}

	animation.AnimateAsync(v1388, { BackgroundTransparency = 0 }, 2.6, "In", "Sine")
	audioServicePlaySound("Quiet Storm")
	audioServiceDimSongs(0.001)

	for i = 1, 16 do
		task.spawn(function()
			local n1 = math.random(-1, 1) * 0.1
			local uDim266 = UDim2.new(0, p297.AbsoluteSize.X * 4.5, 0, p297.AbsoluteSize.X * 3)
			local v1806 = uDim2New(i % 2, 0, n1, 0)
			local randomNumber = math.random(1, 3)
			local v1808 = effectsServiceNewerCircle(p296, {
				ImageTransparency = 0.1,
				Size = uDim266,
				Position = v1806,
				Image = t36[randomNumber],
				ZIndex = p297.ZIndex + 10001
			})
			local animationAnimateAsync = animation.AnimateAsync
			local v1810 = uDim2New(1 - i % 2, 0, n1, 0)
			local uDim267 = UDim2.new(0, p297.AbsoluteSize.X * 1.5, 0, p297.AbsoluteSize.X * 1)

			animationAnimateAsync(v1808, { ImageTransparency = 0.8, Position = v1810, Size = uDim267 }, 2, "Out", "Quad")
			task.wait(1)
			animation.AnimateAsync(v1808, { ImageTransparency = 1 }, 0.5, "In", "Quad")
			task.wait(0.5)
			v1808:Destroy()
		end)

		if i >= 7 then
			task.spawn(function()
				local n1 = math.random(-1, 1) * 0.1
				local uDim268 = UDim2.new(0, p297.AbsoluteSize.X * 3.5, 0, p297.AbsoluteSize.X * 2.3)
				local v1814 = uDim2New(1 - i % 2, 0, n1, 0)
				local randomNumber = math.random(1, 3)
				local v1816 = effectsServiceNewerCircle(p296, {
					ImageTransparency = 0.1,
					Size = uDim268,
					Position = v1814,
					Image = t36[randomNumber],
					ZIndex = p297.ZIndex + 10000
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v1818 = uDim2New(i % 2, 0, n1, 0)
				local uDim269 = UDim2.new(0, p297.AbsoluteSize.X * 1.5, 0, p297.AbsoluteSize.X * 1)

				animationAnimateAsync(v1816, { ImageTransparency = 0.6, Position = v1818, Size = uDim269 }, 2, "Out", "Quad")
				task.wait(1)
				animation.AnimateAsync(v1816, { ImageTransparency = 1 }, 0.5, "In", "Quad")
				task.wait(0.5)
				v1816:Destroy()
			end)
		end

		if i == 7 then
			local animationAnimateAsync = animation.AnimateAsync
			local v1409 = uDim2New(0.5, 0, 0.5, 0)

			animationAnimateAsync(v1405, { Position = v1409 }, 1.4, "InOut", "Quad")
		end

		if i == 14 then
			animation.AnimateAsync(v1405, { ImageTransparency = 0.7 }, 1, "In", "Quad")
		end

		task.wait(0.2 - i * 0.005)
	end

	task.wait(0.6)
	audioServicePlaySound("ShedareThunder")
	effectsService.ShakeSync(v1405, v1405.Position, 0.3, 0.1)

	local animateAsync = animation.AnimateAsync
	local color380 = Color3.fromRGB(255, 255, 255)

	animateAsync(v1405, { ImageTransparency = 0, ImageColor3 = color380 }, 0, "In", "Quad")

	local v1412 = animation.AnimateAsync
	local color381 = Color3.fromRGB(200, 200, 255)

	v1412(v1388, { BackgroundTransparency = 0.8, BackgroundColor3 = color381 }, 0, "In", "Sine")
	task.wait(0.3)

	local v1414 = animation.AnimateAsync
	local uDim270 = UDim2.new(0, p297.AbsolutePosition.X, 0, p297.AbsolutePosition.Y)
	local uDim271 = UDim2.new(0, p297.AbsoluteSize.X * 0.5, 0, p297.AbsoluteSize.Y * 0.5)
	local v1417 = uDim2New(0, p297.AbsoluteSize.X, 0, p297.AbsoluteSize.Y)

	v1414(v1405, { Position = uDim270 + uDim271, Size = v1417 }, 0.4, "In", "Quint")
	animation.AnimateAsync(v1388, { BackgroundTransparency = 1 }, 1, "In", "Sine")
	task.wait(0.4)
	task.spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t40: {[any]: any} = { Color3.fromRGB(179, 167, 138), Color3.fromRGB(218, 215, 204) }
		local v1822 = UDim2.fromOffset(p297.AbsoluteSize.X * 0.6, p297.AbsoluteSize.X * 0.6)

		effectsServiceBreath(p296, p297, p297, {
			Strength = 500,
			ZIndex = -99999,
			Time = 0.2,
			Projectile = effectsServiceBreathimagesFire,
			Color = t40,
			Size = v1822
		})
	end)
	task.spawn(function()
		effectsService.ShakeSync(v1405, v1405.Position, 0.15, 0.05)
		audioServicePlaySound("HammerImpact")
	end)
	task.wait(0.6)
	v1389:Destroy()
	v1392:Destroy()
	v1395:Destroy()
	v1388:Destroy()
	v1405:Destroy()
	audioServiceUndimSongs()
	p297.Visible = true
end
function module.NWrathSummon(p300, p301, _, _, p304)
	p301.Visible = false

	local color3 = Color3.fromRGB(0, 0, 0)
	local v1424 = uDim2New(1, 0, 2, 0)
	local n1 = p301.ZIndex + 10000
	local v1426 = uDim2New(0.5, 0, 0.5, 0)
	local v1427 = effectsServiceNewerCircle(p300, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color3,
		Size = v1424,
		ZIndex = n1,
		Position = v1426
	})
	local n2 = p301.ZIndex - 1
	local v1429 = uDim2New(0, p301.AbsoluteSize.X, 0, p301.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p301.AbsolutePosition.X, 0, p301.AbsolutePosition.Y)
	local uDim272 = UDim2.new(0, p301.AbsoluteSize.X * 0.5, 0, p301.AbsoluteSize.Y * 0.5)
	local v1432 = effectsServiceNewerCircle(p300, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://89157675950552",
		ZIndex = n2,
		Size = v1429,
		Position = uDim2 + uDim272
	})

	if p304 == "PRIDE" then
		v1432.Image = "rbxassetid://118240336337809"
	end

	if p304 == "Greed" then
		v1432.Image = "rbxassetid://137491472253746"
	end

	if p304 == "Gluttony" then
		v1432.Image = "rbxassetid://109069377592304"
	end

	audioServicePlaySound("HammerImpact")
	task.wait(0.5)
	task.spawn(function()
		task.wait(0.2)
		effectsService.ShakeSync(v1432, v1432.Position, 0.15, 0.05)
	end)
	p301.Visible = true

	local v1433 = p301.Position

	p301.Position = UDim2.new(1, p301.AbsoluteSize.X * 2, 0, -p301.AbsoluteSize.Y * 2)
	p301.Rotation = 35

	local animationAnimate = animation.Animate
	local uDim273 = UDim2.new(0, v1432.AbsolutePosition.X, 0, v1432.AbsolutePosition.Y)
	local uDim274 = UDim2.new(0, v1432.AbsoluteSize.X * 0.5, 0, v1432.AbsoluteSize.Y * 0.5)

	animationAnimate(p301, { Rotation = -18, Position = uDim273 + uDim274 }, 0.45, "In", "Quint")
	v1427.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
	v1427.BackgroundTransparency = 0.7
	audioServicePlaySound("Parry")
	task.wait(0.25)

	local zIndex = p301.ZIndex
	local v1438 = v1432.ZIndex

	p301.ZIndex = v1427.ZIndex + 2
	v1432.ZIndex = v1427.ZIndex + 1
	p301.ImageColor3 = Color3.fromRGB(255, 255, 255)
	v1432.ImageColor3 = Color3.fromRGB(255, 255, 255)
	v1427.BackgroundTransparency = 0
	task.wait(0.04)
	v1427.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	p301.ImageColor3 = Color3.fromRGB(0, 0, 0)
	v1432.ImageColor3 = Color3.fromRGB(0, 0, 0)
	task.wait(0.05)
	p301.Rotation = 0
	p301.ImageColor3 = Color3.fromRGB(255, 255, 255)
	p301.Position = v1433
	v1427.BackgroundTransparency = 1
	v1427:Destroy()

	if p304 == "PRIDE" then
		audioServicePlaySound("PRIDE Grunt")
	elseif p304 == "Gluttony" then
		audioServicePlaySound("Gluttony Grunt")
	elseif p304 == "Greed" then
		audioServicePlaySound("Greedy")
	else
		audioServicePlaySound("Wrath Grunt")
	end

	audioServicePlaySound("big impact")
	task.spawn(function()
		effectsService.ShakeBattle(p300, 0.3, 0.035)
	end)
	v1427 = v1432.Position

	local animate = animation.Animate
	local v1440 = UDim2.fromOffset(-180, 120)

	animate(v1432, { Rotation = -80, ImageTransparency = 1, Position = v1427 + v1440 }, 0.35, "Out", "Quint")
	task.spawn(function()
		effectsService.ShakeSync(p301, v1433, 0.2, 0.06)
	end)
	task.wait(0.35)
	p301.ZIndex = zIndex
	v1432.ZIndex = v1438
	v1432:Destroy()
end
function module.TBHDeath(_, _, _, _)
	spawn(function()
		audioServicePlaySound("YippeeDeath")
	end)
	wait(0.1)
end
function module.ApocDeath(p309, p310, _, _)
	p310.ImageTransparency = 1

	local color3 = Color3.fromRGB(255, 255, 255)
	local image = p310.Image
	local v1451 = uDim2New(0, p310.AbsoluteSize.X, 0, p310.AbsoluteSize.Y)
	local v1452 = UDim2.fromOffset(p310.AbsolutePosition.X + p310.AbsoluteSize.X / 2, p310.AbsolutePosition.Y + p310.AbsoluteSize.Y / 2)
	local v1453 = effectsServiceNewerCircle(p309, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		ImageColor3 = color3,
		Image = image,
		Size = v1451,
		Position = v1452
	})

	spawn(function()
		audioServicePlaySound("ApocDeath")
	end)
	animation.AnimateAsync(v1453, { ImageTransparency = 1 }, 0.7, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local color382 = Color3.fromRGB(66, 124, 76)

	animationAnimateAsync(v1453, { ImageColor3 = color382 }, 0.7, "In", "Quint")
	spawn(function()
		wait(0.7)
		v1453:Destroy()
	end)
end
function module.TheStalkerDeath(p313, p314, _, _)
	p314.ImageTransparency = 1

	local t37: {[any]: any} = {
		"StalkerDeath1",
		"StalkerDeath2",
		"StalkerDeath3",
		"StalkerDeath4",
		"StalkerDeath5"
	}
	local color3 = Color3.fromRGB(255, 255, 255)
	local image = p314.Image
	local v1463 = uDim2New(0, p314.AbsoluteSize.X, 0, p314.AbsoluteSize.Y)
	local v1464 = UDim2.fromOffset(p314.AbsolutePosition.X + p314.AbsoluteSize.X / 2, p314.AbsolutePosition.Y + p314.AbsoluteSize.Y / 2)
	local v1465 = effectsServiceNewerCircle(p313, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		ImageColor3 = color3,
		Image = image,
		Size = v1463,
		Position = v1464
	})

	spawn(function()
		local randomNumber = math.random(1, #t37)

		audioServicePlaySound(t37[randomNumber])
	end)
	task.wait(0.25)
	animation.AnimateAsync(v1465, { ImageTransparency = 1 }, 0.7, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local color383 = Color3.fromRGB(145, 20, 20)

	animationAnimateAsync(v1465, { ImageColor3 = color383 }, 0.7, "In", "Quint")
	spawn(function()
		task.wait(0.7)
		v1465:Destroy()
	end)
end

return module
