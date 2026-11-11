



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

local function CenterPos(p2)
	local uDim2 = UDim2.new(0, p2.AbsolutePosition.X, 0, p2.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p2.AbsoluteSize.X * 0.5, 0, p2.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function returnField(p3)
	if p3 == "" then
		return "", "Enemy"
	end

	if p3 == "Enemy" then
		return "Enemy", ""
	end
end

local v44 = math.random

local function GetWeightedRandom(p4)
	return (v44() - 0.5) * p4
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs

local function ApplyValues(p5, p6)
	for k, v in pairs(p6) do
		p5[k] = v
	end
end

ApplyValues = function(p7, p8)
	if p8 then
		local vector3 = Vector3.new(p7.AbsolutePosition.X + p8.X.Offset + p7.AbsoluteSize.X / 2, p7.AbsolutePosition.Y + p8.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p7.AbsolutePosition.X + p7.AbsoluteSize.X / 2, p7.AbsolutePosition.Y, 0)

	return vector3
end
ApplyValues = function(p9, p10)
	return (math.atan2(p10.Y - p9.Y, p10.X - p9.X))
end
ApplyValues = function(p11, p12, p13)
	return p11 * (1 - p13) + p12 * p13
end
ApplyValues = function(p14, p15)
	if p15 == 0 then
		return p14.Keypoints[1].Value
	end

	if p15 == 1 then
		return p14.Keypoints[#p14.Keypoints].Value
	end

	for i = 1, #p14.Keypoints - 1 do
		local v79 = p14.Keypoints[i]
		local v80 = p14.Keypoints[i + 1]

		if p15 >= v79.Time and p15 < v80.Time then
			local n1 = (p15 - v79.Time) / (v80.Time - v79.Time)

			return Color3.new((v80.Value.R - v79.Value.R) * n1 + v79.Value.R, (v80.Value.G - v79.Value.G) * n1 + v79.Value.G, (v80.Value.B - v79.Value.B) * n1 + v79.Value.B)
		end
	end
end
ApplyValues = function(p16)
	local y = p16.AbsolutePosition.Y
	local n1 = p16.AbsolutePosition.Y + p16.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p16.AbsolutePosition.X, p16.AbsolutePosition.X + p16.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end

local color3 = Color3.fromRGB(255, 0, 0)
local color32 = Color3.fromRGB(0, 255, 0)
local color33 = Color3.fromRGB(0, 0, 255)
ApplyValues = { color3, color32, color33, Color3.fromRGB(255, 255, 0) }

local function PlaySoundWithOptionalShake(p17, p18, p19, p20)
	if type(p17) == "table" then
		local randomNumber = math.random(1, #p17)

		p17 = p17[randomNumber]
	end

	audioServicePlaySound(p17)

	if p19 and p20 then
		spawn(function()
			effectsService.Shake(p18, p18.Position, p19, p20)
		end)
	end
end
local function PlayRandomSound(p21)
	local randomNumber = math.random(1, #p21)

	audioServicePlaySound(p21[randomNumber])
end

PlayRandomSound = function(p22, p23, p24, p25)
	PlaySoundWithOptionalShake(p22, p23, p24, p25)
end

local module: {[any]: any} = {
	RayburnSummon = function(p26, p27, _, _)
		audioServiceDimSongs()
		audioServicePlaySound("RayburnSing")

		local virtualField = p26.Parent.BattleNew.VirtualField

		p27.Visible = true

		local color34 = Color3.fromRGB(0, 0, 0)
		local n1 = p27.ZIndex - 1
		local v105 = uDim2New(1, 0, 2, 0)
		local v106 = uDim2New(0.5, 0, 0.5, 0)
		local v107 = effectsServiceNewerCircle(p26, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Rotation = 0,
			BackgroundColor3 = color34,
			ZIndex = n1,
			Size = v105,
			Position = v106
		})

		task.wait(0.1)
		animation.AnimateAsync(v107, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
		effectsServiceSetCardZIndex(p27, p27.ZIndex + 99999)

		local v108 = p26.Parent.BattleNew.VirtualField
		local v109 = p27.Position
		local absoluteSize = p27.AbsoluteSize

		p27.Size = uDim2New(0, 0, 0, 0)
		p27.Position = UDim2.fromScale(2, 2)
		p27.Visible = false
		p27.AnchorPoint = Vector2.new(0.5, 0.5)
		p27.ImageColor3 = Color3.fromRGB(0, 0, 0)
		p27.Visible = true
		p27.Position = uDim2New(0.5, 0, 0.5, 0)

		local animationAnimate = animation.Animate
		local v112 = UDim2.fromOffset(absoluteSize.X * 1.4, absoluteSize.Y * 1.4)

		animationAnimate(p27, { Size = v112 }, 0.8, "Out", "Quart")
		audioServicePlaySound("lightning_strike")

		local color35 = Color3.fromRGB(255, 255, 255)

		v112 = UDim2.fromOffset(v108.AbsoluteSize.X, v108.AbsoluteSize.X)

		local v114 = uDim2New(0.5, 0, 0.5, 0)
		local randomNumber = math.random(0, 180)
		local v116 = effectsServiceNewerCircle(p26, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://11862032588",
			ImageColor3 = color35,
			Size = v112,
			Position = v114,
			Rotation = randomNumber,
			ZIndex = p27.ZIndex - 1
		})

		animation.AnimateAsync(v116, { ImageTransparency = 0 }, 0.4, "Out", "Quad")
		task.spawn(function()
			effectsServiceSpritesheet(v116, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
			animation.Animate(v116, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
			v116:Destroy()
		end)
		v107.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v107.BackgroundTransparency = 0
		p27.Size = UDim2.fromOffset(absoluteSize.X * 1.6, absoluteSize.Y * 1.6)
		p27.ImageColor3 = Color3.fromRGB(255, 255, 255)

		local animationAnimateAsync = animation.AnimateAsync
		local v118 = UDim2.fromOffset(absoluteSize.X * 1.4, absoluteSize.Y * 1.4)

		animationAnimateAsync(p27, { Size = v118 }, 1, "Out", "Quart")
		animation.AnimateAsync(v107, { BackgroundTransparency = 1 }, 1, "Out", "Quad")
		task.wait(1)
		audioServicePlaySound("evil_laugh")

		local u119 = nil
		local u120 = nil

		task.spawn(function()
			local v239 = UDim2.fromOffset(p27.AbsoluteSize.X / 1.5, p27.AbsoluteSize.Y / 1.5)
			local v240 = p27
			local uDim2 = UDim2.new(0, v240.AbsolutePosition.X, 0, v240.AbsolutePosition.Y)
			local uDim23 = UDim2.new(0, v240.AbsoluteSize.X * 0.5, 0, v240.AbsoluteSize.Y * 0.5)

			u119 = effectsServiceNewCard(p26, {
				Image = "rbxassetid://110657255723861",
				Size = v239,
				Position = uDim2 + uDim23,
				ZIndex = p27.ZIndex - 1
			})

			local animationAnimateAsync = animation.AnimateAsync
			local v244 = u119

			v240 = u119.Position

			local v245 = UDim2.fromOffset(-p27.AbsoluteSize.X / 1.5)

			animationAnimateAsync(v244, { Rotation = -20, Position = v240 + v245 }, 0.5, "Out", "Quart")
			v239 = UDim2.fromOffset(p27.AbsoluteSize.X / 1.5, p27.AbsoluteSize.Y / 1.5)
			v240 = p27

			local uDim24 = UDim2.new(0, v240.AbsolutePosition.X, 0, v240.AbsolutePosition.Y)
			local uDim25 = UDim2.new(0, v240.AbsoluteSize.X * 0.5, 0, v240.AbsoluteSize.Y * 0.5)

			u120 = effectsServiceNewCard(p26, {
				Image = "rbxassetid://123378982423007",
				Size = v239,
				Position = uDim24 + uDim25,
				ZIndex = p27.ZIndex - 1
			})

			local animateAsync = animation.AnimateAsync

			v244 = u120
			v240 = u120.Position
			v245 = UDim2.fromOffset(p27.AbsoluteSize.X / 1.5)
			animateAsync(v244, { Rotation = 20, Position = v240 + v245 }, 0.5, "Out", "Quart")
		end)
		task.wait(0.5)
		task.spawn(function()
			animation.AnimateAsync(u119, { Rotation = 0, AnchorPoint = Vector2.new(0, 0), Position = v109 }, 0.7, "In", "Quint")
			animation.Animate(u120, { Rotation = 0, AnchorPoint = Vector2.new(0, 0), Position = v109 }, 0.7, "In", "Quint")
			u119:Destroy()
			u120:Destroy()
		end)
		animation.AnimateAsync(v107, { BackgroundTransparency = 1 }, 0.4, "Out", "Quad")

		local animateAsync = animation.AnimateAsync
		local v122 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)

		animateAsync(p27, { Size = v122 }, 0.7, "In", "Quint")
		animation.AnimateAsync(p27, { AnchorPoint = Vector2.new(0, 0) }, 0.7, "In", "Quint")
		animation.AnimateAsync(p27, { Rotation = 0 }, 0.7, "In", "Quint")
		animation.Animate(p27, { Position = v109 }, 0.7, "In", "Quint")
		effectsServiceSetCardZIndex(p27, p27.ZIndex - 99999)
		v107:Destroy()
		audioServiceUndimSongs()
	end,
	FlickeringSummon = function(p30, p31, _, _)
		audioServiceDimSongs()

		local zIndex = p31.ZIndex
		local absolutePosition = p31.AbsolutePosition
		local absoluteSize = p31.AbsoluteSize
		local color36 = Color3.fromRGB(22, 22, 22)
		local n1 = p31.ZIndex + 99998
		local v132 = uDim2New(1, 0, 2, 0)
		local v133 = uDim2New(0.5, 0, 0.5, 0)
		local v134 = effectsServiceNewerCircle(p30, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			BackgroundColor3 = color36,
			ZIndex = n1,
			Size = v132,
			Position = v133
		})

		p31.ImageTransparency = 1
		audioServicePlaySound("Clang")
		audioServicePlaySound("LightFlicker")
		animation.Animate(v134, { BackgroundTransparency = 0.2 }, 0.5, "Out", "Quart")
		animation.Animate(v134, { BackgroundTransparency = 1 }, 0.3, "Out", "Quart")
		audioServicePlaySound("LightFlicker")
		animation.AnimateAsync(p31, { ImageTransparency = 0 }, 0.5, "Out", "Quad")
		task.wait(0.25)
		audioServiceUndimSongs()
		p31.ImageTransparency = 0
		v134:Destroy()
	end
}

function module.EyefestationSummon(p34, p35, _, p37)
	audioServicePlaySound("Spotted")
	module.BaseplateGreen(p34, p35, p35, p37, true)
	p35.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p35, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.SWAT(p38, p39, _, _)
	local t2: {[any]: any} = { "PoliceChat1", "PoliceChat2", "PoliceChat3" }
	local zIndex = p39.ZIndex
	local absolutePosition = p39.AbsolutePosition
	local absoluteSize = p39.AbsoluteSize
	local y = p38.Parent.AbsoluteSize.Y
	local n1: number = if p39.AbsolutePosition.Y < y / 2 then 1 else 0

	p39.Position = UDim2.new(0, p39.AbsolutePosition.X, 0, y * n1 + p39.AbsoluteSize.Y * 1.25 * (if n1 == 1 then 1 else -1))
	audioServiceDimSongs()
	audioServicePlaySound("Helicopter")

	local randomNumber = math.random(1, #t2)

	audioServicePlaySound(t2[randomNumber])

	local color37 = Color3.fromRGB(26, 21, 21)
	local n2 = p39.ZIndex - 1
	local v152 = uDim2New(0.005, 0, 3, 0)
	local uDim2 = UDim2.new(0, p39.AbsolutePosition.X, 0, p39.AbsolutePosition.Y)
	local uDim26 = UDim2.new(0, p39.AbsoluteSize.X * 0.5, 0, p39.AbsoluteSize.Y * 0.5)
	local v155 = effectsServiceNewerCircle(p38, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color37,
		ZIndex = n2,
		Size = v152,
		Position = uDim2 + uDim26
	})
	local v156 = v155.AbsolutePosition

	task.spawn(function()
		audioServicePlaySound("Swoosh")
		task.wait(0.4)
		audioServicePlaySound("Swoosh")
		task.wait(0.4)
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local color38 = Color3.fromRGB(26, 21, 21)

	animationAnimateAsync(v155, { BackgroundColor3 = color38 }, 2.5, "Out", "Quart")
	animation.AnimateAsync(v155, { BackgroundTransparency = 0 }, 0.4, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v160 = UDim2.fromOffset(absolutePosition.X, absolutePosition.Y)

	animationAnimate(p39, { Position = v160 }, 1.25, "Out", "Quad")
	audioServicePlaySound("SMGReload")
	task.wait(0.1)
	effectsService.ShakeSync(p39, p39.Position, 1, 0.05)
	task.wait(0.25)
	animation.AnimateAsync(v155, { BackgroundTransparency = 1 }, 0.5, "Out", "Quart")
	task.wait(0.75)
	audioServiceUndimSongs()
	v155:Destroy()
end
function module.PoliceCar(p42, p43, _, _)
	local t3: {[any]: any} = { "PoliceChat1", "PoliceChat2", "PoliceChat3" }
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t4: {[any]: any} = { Color3.fromRGB(47, 47, 47), Color3.fromRGB(62, 62, 62) }
	local v168 = UDim2.fromOffset(p43.AbsoluteSize.Y / 3, p43.AbsoluteSize.Y / 3)
	local v169 = UDim2.fromOffset(0, 0)
	local v170 = UDim2.fromOffset(p43.AbsolutePosition.X + p43.AbsoluteSize.X / 3, p43.AbsolutePosition.Y / 1.25 + p43.AbsoluteSize.Y)
	local v171 = effectsServiceNewerCircle(p42, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v169,
		Position = v170
	})
	local v172 = UDim2.fromOffset(p43.AbsoluteSize.Y / 1.5, p43.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, p43.AbsolutePosition.X, 0, p43.AbsolutePosition.Y)
	local uDim27 = UDim2.new(0, p43.AbsoluteSize.X * 0.5, 0, p43.AbsoluteSize.Y * 0.5)
	local v175 = UDim2.fromOffset(p43.AbsoluteSize.X, -p43.AbsoluteSize.Y / 3)
	local v176 = effectsServiceNewerCircle(p42, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v172,
		Position = uDim2 + uDim27 - v175
	})
	local v177 = p43.Position

	p43.Position = UDim2.new(-0.5, p43.AbsoluteSize.X, 0.6, p43.AbsoluteSize.Y / 2)
	audioServiceDimSongs()
	audioServicePlaySound("PoliceSiren")
	animation.AnimateAsync(p43, { Position = v177 }, 1.5, "Out", "Quint")
	task.wait(0.5)
	audioServicePlaySound("TireScreech")
	effectsServiceBreath(p42, v171, v176, {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = t4,
		Size = v168
	})

	local randomNumber = math.random(1, #t3)

	audioServicePlaySound(t3[randomNumber])
	task.wait(0.3)
	audioServiceUndimSongs()
end
function module.SummonAlex(p46, p47, p48, p49)
	local t5: {[any]: any} = {
		"123 for OP card!!",
		"ABC for epic entrance!",
		"haha bro vs noob",
		"instant win u lose",
		"*dodges*",
		"*amazes you with amazing cool brick*",
		":name"
	}

	audioService.DimSongs()

	local randomNumber = math.random(1, #t5)
	local v185 = t5[randomNumber]
	local legacy = Enum.Font.Legacy
	local color39 = Color3.fromRGB(194, 255, 206)
	local v188 = UDim2.fromOffset(p47.AbsoluteSize.X * 1.5, p47.AbsoluteSize.Y / 3)
	local randomNumber2 = math.random(-10, 10)
	local t6: {[any]: any} = {
		Text = v185,
		Font = legacy,
		TextColor3 = color39,
		Size = v188,
		TextStrokeTransparency = 0,
		Rotation = randomNumber2,
		ZIndex = p47.ZIndex + 100002
	}
	local color310 = Color3.fromRGB(21, 29, 22)
	local n1 = p47.ZIndex + 99998
	local v193 = uDim2New(1, 0, 2, 0)
	local v194 = uDim2New(0.5, 0, 0.5, 0)
	local v195 = effectsServiceNewerCircle(p46, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color310,
		ZIndex = n1,
		Size = v193,
		Position = v194
	})
	local color311 = Color3.fromRGB(0, 0, 0)

	v194 = p47.ZIndex + 99999
	v193 = UDim2.fromOffset(p47.AbsoluteSize.Y * 5, p47.AbsoluteSize.Y * 5)

	local uDim2 = UDim2.new(0, p47.AbsolutePosition.X, 0, p47.AbsolutePosition.Y)
	local uDim28 = UDim2.new(0, p47.AbsoluteSize.X * 0.5, 0, p47.AbsoluteSize.Y * 0.5)

	v188 = effectsServiceNewerCircle(p46, {
		Image = "rbxassetid://7216856276",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color311,
		ZIndex = v194,
		Size = v193,
		Position = uDim2 + uDim28
	})

	local v199 = p47.Position
	local v200 = p47.Size
	local uDim29 = UDim2.new(0, p47.AbsolutePosition.X, 0, p47.AbsolutePosition.Y)
	local uDim210 = UDim2.new(0, p47.AbsoluteSize.X * 0.5, 0, p47.AbsoluteSize.Y * 0.5)

	p47.Position = uDim29 + uDim210
	p47.Size = UDim2.fromOffset(0, 0)
	audioServicePlaySound("victoryfanfare.wav")
	animation.AnimateAsync(v188, { ImageTransparency = 0 }, 0.3, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v204 = UDim2.fromOffset(0, 0)

	animationAnimateAsync(v188, { Size = v204 }, 0.6, "In", "Quad")
	p47.Visible = false
	animation.AnimateAsync(v195, { BackgroundTransparency = 0.2 }, 0.3, "Out", "Quint")
	task.wait(0.6)
	p47.Visible = true
	effectsServiceSetCardZIndex(p47, p47.ZIndex + 99999)
	animation.AnimateAsync(p47, { Size = v200, Position = v199 }, 1, "Out", "Quart")
	effectsService.ShakeBattleSync(p46, 0.5, 0.03)

	for i = 1, 4 do
		task.spawn(function()
			local n1 = p47.ZIndex + 100001
			local v250 = UDim2.fromOffset(p47.AbsoluteSize.X, p47.AbsoluteSize.X)
			local v251 = p47
			local uDim211 = UDim2.new(0, v251.AbsolutePosition.X, 0, v251.AbsolutePosition.Y)
			local uDim212 = UDim2.new(0, v251.AbsoluteSize.X * 0.5, 0, v251.AbsoluteSize.Y * 0.5)
			local randomNumber3 = math.random(0, 360)
			local v255 = effectsServiceNewerCircle(p46, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v250,
				Position = uDim211 + uDim212,
				Rotation = randomNumber3
			})

			v251 = p47.ZIndex + 100001

			local v256 = UDim2.fromOffset(p47.AbsoluteSize.X, p47.AbsoluteSize.X)
			local v257 = p47
			local uDim213 = UDim2.new(0, v257.AbsolutePosition.X, 0, v257.AbsolutePosition.Y)
			local uDim214 = UDim2.new(0, v257.AbsoluteSize.X * 0.5, 0, v257.AbsoluteSize.Y * 0.5)
			local color312 = Color3.fromRGB(13, 255, 0)
			local v261 = effectsServiceNewerCircle(p46, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v251,
				Size = v256,
				Position = uDim213 + uDim214,
				Rotation = i * 90 + 180,
				ImageColor3 = color312
			})

			v257 = p47.ZIndex + 100001

			local v262 = UDim2.fromOffset(p47.AbsoluteSize.X, p47.AbsoluteSize.X)
			local v263 = p47
			local uDim215 = UDim2.new(0, v263.AbsolutePosition.X, 0, v263.AbsolutePosition.Y)
			local uDim216 = UDim2.new(0, v263.AbsoluteSize.X * 0.5, 0, v263.AbsoluteSize.Y * 0.5)
			local color313 = Color3.fromRGB(0, 120, 0)
			local v267 = effectsServiceNewerCircle(p46, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v257,
				Size = v262,
				Position = uDim215 + uDim216,
				ImageColor3 = color313,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v263 = UDim2.fromOffset(p47.AbsoluteSize.Y * 1.8, p47.AbsoluteSize.Y * 1.8)
			animationAnimateAsync(v255, { Size = v263, Rotation = v255.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v263 = UDim2.fromOffset(p47.AbsoluteSize.Y * 1.3, p47.AbsoluteSize.Y * 1.3)
			animateAsync(v261, { Size = v263, Rotation = v261.Rotation + 360 }, 1, "Out", "Quint")

			local v270 = animation.AnimateAsync

			v263 = UDim2.fromOffset(p47.AbsoluteSize.Y * 1.3, p47.AbsoluteSize.Y * 1.3)
			v270(v267, { Size = v263, Rotation = v267.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v255, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v261, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v267, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v255:Destroy()
				v261:Destroy()
				v267:Destroy()
			end)
		end)
		task.wait(0.2)
	end

	audioService.UndimSongs()
	task.wait(0.25)
	task.spawn(function()
		animation.Animate(v195, { BackgroundTransparency = 1 }, 1, "Out", "Quint")
		v195:Destroy()
		effectsServiceSetCardZIndex(p47, p47.ZIndex - 99999)
	end)

	if math.random(1, 2) == 1 then
		audioServicePlaySound("bass.wav")
	else
		audioServicePlaySound("Kerplunk.wav")
	end

	effectsServiceSpeak(p46, p47, p48, p49, t6, 0.75)
end
function module.ForgottenOne(p50, p51, _, _)
	local zIndex = p51.ZIndex
	local absolutePosition = p51.AbsolutePosition
	local absoluteSize = p51.AbsoluteSize
	local v213 = p51.ZIndex
	local color314 = Color3.fromRGB(255, 255, 255)
	local v215 = uDim2New(0, 0, 0, p51.AbsoluteSize.Y * 0.2)
	local uDim2 = UDim2.new(0, p51.AbsolutePosition.X, 0, p51.AbsolutePosition.Y)
	local uDim217 = UDim2.new(0, p51.AbsoluteSize.X * 0.5, 0, p51.AbsoluteSize.Y * 0.9)
	local v218 = effectsServiceNewerCircle(p50, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://8717323465",
		ZIndex = v213,
		ImageColor3 = color314,
		Size = v215,
		Position = uDim2 + uDim217
	})
	local v219 = p51.ZIndex
	local color315 = Color3.fromRGB(255, 255, 255)
	local v221 = uDim2New(0, p51.AbsoluteSize.X, 0, p51.AbsoluteSize.Y)
	local uDim218 = UDim2.new(0, p51.AbsolutePosition.X, 0, p51.AbsolutePosition.Y)
	local uDim219 = UDim2.new(0, p51.AbsoluteSize.X * 0.5, 0, p51.AbsoluteSize.Y * 0.5)
	local parent = effectsServiceNewerCircle(p50, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://8717323465",
		ClipsDescendants = true,
		ZIndex = v219,
		ImageColor3 = color315,
		Size = v221,
		Position = uDim218 + uDim219
	})
	local v225 = p51.ZIndex
	local color316 = Color3.fromRGB(255, 255, 255)
	local image = p51.Image
	local v228 = uDim2New(0, p51.AbsoluteSize.X, 0, p51.AbsoluteSize.Y)
	local v229 = UDim2.fromOffset(p51.AbsoluteSize.X / 2, p51.AbsoluteSize.Y / 2 * 4)
	local v230 = effectsServiceNewerCircle(p50, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = v225,
		ImageColor3 = color316,
		Image = image,
		Size = v228,
		Position = v229,
		Parent = parent
	})

	audioServiceDimSongs()
	audioServicePlaySound("Forboding")
	p51.ImageTransparency = 1

	local animationAnimate = animation.Animate
	local v232 = uDim2New(0, p51.AbsoluteSize.X * 1.1, 0, p51.AbsoluteSize.Y * 0.2)

	animationAnimate(v218, { Size = v232 }, 1.5, "Out", "Quart")
	task.spawn(function()
		local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
		local t7: {[any]: any} = { Color3.fromRGB(106, 104, 97), Color3.fromRGB(218, 215, 204) }
		local v273 = UDim2.fromOffset(p51.AbsoluteSize.X * 0.6, p51.AbsoluteSize.X * 0.6)

		effectsServiceBreath(p50, v218, v218, {
			Strength = 500,
			ZIndex = -99999,
			Time = 2,
			Projectile = effectsServiceBreathimagesSmoke,
			Color = t7,
			Size = v273
		})
	end)
	task.spawn(function()
		task.wait(0.2)
		effectsService.ShakeSync(v218, v218.Position, 2, 0.05)
		effectsService.ShakeSync(parent, parent.Position, 2, 0.05)
	end)
	audioServicePlaySound("Stone Slide 2")

	local animate = animation.Animate

	v232 = UDim2.fromOffset(p51.AbsoluteSize.X / 2, p51.AbsoluteSize.Y / 2)
	animate(v230, { Position = v232 }, 2.5, "Out", "Quart")
	audioServicePlaySound("ForgottenOne")

	local v234 = animation.Animate

	v232 = uDim2New(0, 0, 0, p51.AbsoluteSize.Y * 0.2)
	v234(v218, { Size = v232 }, 1, "Out", "Quart")
	p51.ImageTransparency = 0
	v230:Destroy()
	v218:Destroy()
	parent:Destroy()
	audioServiceUndimSongs()
end
function module.EyefestationDeath(_, p55, _, _)
	p55.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p55, { Rotation = 0 }, 0.5, "Out", "Quint")
end

return module
