



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
local v42 = math.random

local function GetWeightedRandom(p2)
	return (v42() - 0.5) * p2
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs

local function getVector3(p3, p4)
	if p4 then
		local vector3 = Vector3.new(p3.AbsolutePosition.X + p4.X.Offset + p3.AbsoluteSize.X / 2, p3.AbsolutePosition.Y + p4.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p3.AbsolutePosition.X + p3.AbsoluteSize.X / 2, p3.AbsolutePosition.Y, 0)

	return vector3
end

getVector3 = function(p5, p6)
	return (math.atan2(p6.Y - p5.Y, p6.X - p5.X))
end
getVector3 = function(p7, p8, p9)
	return p7 * (1 - p9) + p8 * p9
end
getVector3 = function(p10, p11)
	if p11 == 0 then
		return p10.Keypoints[1].Value
	end

	if p11 == 1 then
		return p10.Keypoints[#p10.Keypoints].Value
	end

	for i = 1, #p10.Keypoints - 1 do
		local v72 = p10.Keypoints[i]
		local v73 = p10.Keypoints[i + 1]

		if p11 >= v72.Time and p11 < v73.Time then
			local n1 = (p11 - v72.Time) / (v73.Time - v72.Time)

			return Color3.new((v73.Value.R - v72.Value.R) * n1 + v72.Value.R, (v73.Value.G - v72.Value.G) * n1 + v72.Value.G, (v73.Value.B - v72.Value.B) * n1 + v72.Value.B)
		end
	end
end

local function randomPosOnTarget(p12)
	local y = p12.AbsolutePosition.Y
	local n1 = p12.AbsolutePosition.Y + p12.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p12.AbsolutePosition.X, p12.AbsolutePosition.X + p12.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
local function CenterPos(p13)
	local uDim2 = UDim2.new(0, p13.AbsolutePosition.X, 0, p13.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p13.AbsoluteSize.X * 0.5, 0, p13.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function returnField(p14)
	if p14 == "" then
		return "", "Enemy"
	end

	if p14 == "Enemy" then
		return "Enemy", ""
	end
end

local color3 = Color3.fromRGB(255, 0, 0)
local color32 = Color3.fromRGB(0, 255, 0)
local color33 = Color3.fromRGB(0, 0, 255)
returnField = { color3, color32, color33, Color3.fromRGB(255, 255, 0) }

local function PlaySoundWithOptionalShake(p15, p16, p17, p18)
	if type(p15) == "table" then
		local randomNumber = math.random(1, #p15)

		p15 = p15[randomNumber]
	end

	audioServicePlaySound(p15)

	if p17 and p18 then
		spawn(function()
			effectsService.Shake(p16, p16.Position, p17, p18)
		end)
	end
end
local function PlayRandomSound(p19)
	local randomNumber = math.random(1, #p19)

	audioServicePlaySound(p19[randomNumber])
end

PlayRandomSound = function(p20, p21, p22, p23)
	PlaySoundWithOptionalShake(p20, p21, p22, p23)
end

local module: {[any]: any} = {
	Pandora = function(p24, p25, p26, _, _)
		audioServicePlaySound("Ascend2")
		audioService.DimSongs()

		local y = p24.Parent.BattleNew.VirtualField.AbsoluteSize.Y
		local color34 = Color3.fromRGB(255, 255, 255)
		local uDim2 = UDim2.new(0, p25.AbsoluteSize.X * 15, 0, p25.AbsoluteSize.X * 15)
		local v103 = uDim2New(0.5, 0, 0.5, 0)
		local v104 = effectsServiceNewerCircle(p24, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://59430545",
			ZIndex = 10000,
			ImageColor3 = color34,
			Size = uDim2,
			Position = v103
		})
		local color35 = Color3.fromRGB(0, 0, 0)
		local v106 = uDim2New(0.35, 0, 0.5, 0)
		local v107 = uDim2New(0.5, 0, 0.5, 0)
		local v108 = effectsServiceNewerCircle(p24, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 1,
			BackgroundColor3 = color35,
			Size = v106,
			Position = v107
		})
		local color36 = Color3.fromRGB(0, 0, 0)
		local v110 = uDim2New(1.5, 0, 1.5, 0)
		local v111 = uDim2New(0.5, 0, 0.5, 0)
		local v112 = effectsServiceNewerCircle(p24, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10011,
			BackgroundColor3 = color36,
			Size = v110,
			Position = v111
		})
		local color37 = Color3.fromRGB(203, 203, 203)
		local color38 = Color3.fromRGB(71, 71, 71)
		v107 = { color37, color38, Color3.fromRGB(255, 255, 255) }
		v106 = UDim2.fromOffset(y * 0.3, y * 0.3)
		effectsServiceEmit(p24, v112, {
			Projectile = "rbxassetid://696413137",
			Strength = 40,
			Speed = 1,
			Lifetime = 0.33,
			EasingStyle = "Quint",
			EasingDirection = "In",
			Time = 0.5,
			ZIndex = 10012,
			Color = v107,
			Size = v106,
			Range = v112
		})

		local animationAnimate = animation.Animate
		local uDim23 = UDim2.new(0, p25.AbsoluteSize.X * 2, 0, p25.AbsoluteSize.X * 2)

		animationAnimate(v104, { Size = uDim23 }, 1, "Out", "Quint")
		task.spawn(function()
			audioServicePlaySound("AHh")
			audioServicePlaySound("Boom")
			v104.Visible = false
			effectsService.ShakeBattle(p24, 0.3, 0.05)
			audioService.UndimSongs()
		end)
		v103 = {
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
			local color39 = Color3.fromRGB(0, 0, 0)
			local v120 = UDim2.fromOffset(v108.AbsoluteSize.Y / randomNumber, v108.AbsoluteSize.Y / randomNumber)
			local v121 = uDim2New(0.5, 0, 0.5, 0)
			local parent = effectsServiceNewerCircle(p24, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 11000,
				ClipsDescendants = true,
				BackgroundColor3 = color39,
				Size = v120,
				Position = v121
			})
			local color310 = Color3.fromRGB(0, 0, 0)
			local color311 = Color3.fromRGB(255, 255, 255)
			local v125 = UDim2.fromOffset(p26.AbsoluteSize.X, p26.AbsoluteSize.Y)
			local v126 = effectsServiceNewerCircle(p24, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://59430545",
				ImageTransparency = 0,
				ZIndex = 11000,
				BackgroundColor3 = color310,
				ImageColor3 = color311,
				Size = v125
			})

			v126.Parent = parent
			v126.AnchorPoint = v103[i][1]
			v126.Position = v103[i][2]

			local v127 = randomPosOnTarget(v108)

			task.spawn(function()
				animation.Animate(parent, { Position = v127 }, 1.25, "Out", "Quint")
				animation.Animate(v126, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
				wait(0.25)
				v112:Destroy()
				parent:Destroy()
				v104:Destroy()
				v108:Destroy()
			end)
		end
	end,
	MeteorFist = function(p29, _, p31)
		local n1 = p31.ZIndex + 10001
		local uDim2 = UDim2.new(0, p31.AbsoluteSize.X * 3, 0, p31.AbsoluteSize.X * 3)
		local uDim24 = UDim2.new(0, p31.AbsolutePosition.X + p31.AbsoluteSize.X / 2, 0, p31.AbsolutePosition.Y + p31.AbsoluteSize.Y / 2)
		local color312 = Color3.fromRGB(216, 89, 89)
		local v135 = effectsServiceNewerCircle(p29, {
			Image = "rbxassetid://10235945933",
			Rotation = -20,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim24,
			ImageColor3 = color312
		})

		task.spawn(function()
			local color313 = Color3.fromRGB(255, 255, 255)

			effectsServicePulse(p29, v135, {
				Time = 0.5,
				FlashTime = 0.2,
				Color = { color313, Color3.fromRGB(166, 37, 37) },
				Transparency = 0.1
			})
		end)
		audioServicePlaySound("electricwindup")
		animation.AnimateAsync(v135, { Rotation = 30 }, 0.7, "In", "Exponential")

		local animationAnimate = animation.Animate
		local uDim25 = UDim2.new(0, p31.AbsoluteSize.X * 0.65, 0, p31.AbsoluteSize.X * 0.65)

		animationAnimate(v135, { Size = uDim25 }, 0.7, "In", "Quint")
		audioServicePlaySound("ashslam")
		effectsService.Shake(p31, p31.Position, 0.6, 0.1)

		local v138 = UDim2.fromOffset(p31.AbsoluteSize.Y * 1.2, p31.AbsoluteSize.Y * 1.2)
		local uDim26 = UDim2.new(0, p31.AbsolutePosition.X, 0, p31.AbsolutePosition.Y)
		local uDim27 = UDim2.new(0, p31.AbsoluteSize.X * 0.5, 0, p31.AbsoluteSize.Y * 0.5)
		local v141 = effectsServiceNewerCircle(p29, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Size = v138,
			Position = uDim26 + uDim27
		})
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		n1 = { Color3.fromRGB(223, 180, 79), Color3.fromRGB(255, 86, 44) }
		local v143 = UDim2.fromOffset(p31.AbsoluteSize.X * 0.7, p31.AbsoluteSize.X * 0.7)
		local n2 = p31.ZIndex + 10000
		local uDim28 = UDim2.new(0, p31.AbsoluteSize.X * 2, 0, p31.AbsoluteSize.X * 2)
		local uDim29 = UDim2.new(0, p31.AbsolutePosition.X + p31.AbsoluteSize.X / 2, 0, p31.AbsolutePosition.Y * 1.1 + p31.AbsoluteSize.Y / 2)
		local v147 = effectsServiceNewerCircle(p29, {
			Image = "rbxassetid://5090165303",
			Rotation = 20,
			ZIndex = n2,
			Size = uDim28,
			Position = uDim29
		})
		local t2: {[any]: any} = {
			Strength = 1500,
			Speed = 0.6,
			EasingStyle = "Quint",
			Time = 0.6,
			Projectile = effectsServiceBreathimagesFire,
			Color = n1,
			Size = v143,
			Range = v141
		}

		task.spawn(function()
			v135.Size = UDim2.new(0, p31.AbsoluteSize.X * 0.5, 0, p31.AbsoluteSize.X * 0.5)
			v135.Rotation = 40
			effectsServiceBreath(p29, p31, v141, t2)
		end)
		task.spawn(function()
			effectsService.ShakeBattleSync(p29, 1, 0.1)
		end)
		task.wait(1)
		animation.AnimateAsync(v147, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		animation.AnimateAsync(v135, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		task.spawn(function()
			task.wait(0.5)
			v147:Destroy()
			v135:Destroy()
			v141:Destroy()
		end)
	end,
	DozerEffect = function(p32, p33, p34, _)
		local v153 = uDim2New(0, p33.AbsoluteSize.X * 1.6, 0, p33.AbsoluteSize.X * 1.6)
		local v154 = uDim2New(0.5, 0, 0.5, 0)
		local v155 = effectsServiceNewerCircle(p32, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 10001,
			Image = "rbxassetid://135779196432690",
			Size = v153,
			Position = v154
		})

		task.spawn(function()
			for _ = 1, 10 do
				task.spawn(function()
					local n1 = p34.ZIndex + 1
					local image = p34.Image
					local uDim2 = UDim2.new(0, p34.AbsoluteSize.X, 0, p34.AbsoluteSize.Y)
					local color314 = Color3.fromRGB(0, 0, 0)
					local v295 = UDim2.fromOffset(p34.AbsolutePosition.X + p34.AbsoluteSize.X / 2, p34.AbsolutePosition.Y + p34.AbsoluteSize.Y / 2)
					local v296 = effectsServiceNewerCircle(p32, {
						BackgroundTransparency = 1,
						ImageTransparency = 0.5,
						ZIndex = n1,
						Image = image,
						Size = uDim2,
						ImageColor3 = color314,
						Position = v295
					})
					local animationAnimate = animation.Animate
					local uDim210 = UDim2.new(0, p34.AbsoluteSize.X * 1.4, 0, p34.AbsoluteSize.Y * 1.4)

					animationAnimate(v296, { ImageTransparency = 1, Size = uDim210 }, 2, "Out", "Quart")
					task.wait(2)
					v296:Destroy()
				end)
				audioServicePlaySound("DozerJumpText")
				task.wait(0.01)
			end
		end)
		task.spawn(function()
			for i = 1, 25 do
				local randomNumber = math.random(495, 515)
				local randomNumber2 = math.random(495, 515)
				local randomNumber3 = math.random(-5, 5)
				local randomNumber4 = math.random(15, 17)

				if i % 2 == 1 then
					local animationAnimateAsync = animation.AnimateAsync
					local v272 = uDim2New(0, p33.AbsoluteSize.X * (randomNumber4 / 10) * -1, 0, p33.AbsoluteSize.X * (randomNumber4 / 10))
					local v273 = uDim2New(randomNumber / 1000, 0, randomNumber2 / 1000, 0)

					animationAnimateAsync(v155, { Size = v272, Rotation = randomNumber3, Position = v273 }, 0, "InOut", "Sine")
				else
					local animateAsync = animation.AnimateAsync
					local v275 = uDim2New(0, p33.AbsoluteSize.X * (randomNumber4 / 10), 0, p33.AbsoluteSize.X * (randomNumber4 / 10))
					local v276 = uDim2New(randomNumber / 1000, 0, randomNumber2 / 1000, 0)

					animateAsync(v155, { Size = v275, Rotation = randomNumber3, Position = v276 }, 0, "InOut", "Sine")
				end

				animation.AnimateAsync(v155, { ImageTransparency = i / 25 + 0 }, 0, "InOut", "Sine")
				task.wait(0.1)
				audioServicePlaySound("DozerTick", { Volume = 1 - i / 25 })

				if i == 25 then
					v155:Destroy()
				end
			end
		end)
	end,
	DozerTrigger = function(p36, p37, _, _)
		p37.Visible = false

		local v160 = uDim2New(0, p37.AbsoluteSize.X * 1.6, 0, p37.AbsoluteSize.X * 1.6)
		local uDim2 = UDim2.new(0, p37.AbsolutePosition.X, 0, p37.AbsolutePosition.Y)
		local uDim211 = UDim2.new(0, p37.AbsoluteSize.X * 0.5, 0, p37.AbsoluteSize.Y * 0.5)
		local v163 = effectsServiceNewerCircle(p36, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			Image = "rbxassetid://93903745078943",
			Size = v160,
			Position = uDim2 + uDim211
		})
		local v164 = uDim2New(0, p37.AbsoluteSize.X * 1.6, 0, p37.AbsoluteSize.X * 1.6)
		local uDim212 = UDim2.new(0, p37.AbsolutePosition.X, 0, p37.AbsolutePosition.Y)
		local uDim213 = UDim2.new(0, p37.AbsoluteSize.X * 0.5, 0, p37.AbsoluteSize.Y * 0.5)
		local v167 = effectsServiceNewerCircle(p36, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			Image = "rbxassetid://85655310294251",
			Size = v164,
			Position = uDim212 + uDim213
		})
		local v168 = uDim2New(0, p37.AbsoluteSize.X * 1.6, 0, p37.AbsoluteSize.X * 1.6)
		local uDim214 = UDim2.new(0, p37.AbsolutePosition.X, 0, p37.AbsolutePosition.Y)
		local uDim215 = UDim2.new(0, p37.AbsoluteSize.X * 0.5, 0, p37.AbsoluteSize.Y * 0.5)
		local v171 = effectsServiceNewerCircle(p36, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = 10001,
			Image = "rbxassetid://84632025354417",
			Size = v168,
			Position = uDim214 + uDim215
		})
		local image = p37.Image
		local uDim216 = UDim2.new(0, p37.AbsoluteSize.X, 0, p37.AbsoluteSize.Y)
		local color315 = Color3.fromRGB(0, 0, 0)
		local uDim217 = UDim2.new(0, p37.AbsolutePosition.X, 0, p37.AbsolutePosition.Y)
		local uDim218 = UDim2.new(0, p37.AbsoluteSize.X * 0.5, 0, p37.AbsoluteSize.Y * 0.5)

		v160 = effectsServiceNewerCircle(p36, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ZIndex = 9999,
			Image = image,
			Size = uDim216,
			ImageColor3 = color315,
			Position = uDim217 + uDim218
		})
		task.spawn(function()
			for i = 1, 20 do
				audioServicePlaySound("DozerJumpText")
				task.wait(0.05)

				if i == 1 or i > 3 then
					task.spawn(function()
						local v299 = uDim2New(0, p37.AbsoluteSize.X * 6, 0, p37.AbsoluteSize.X * 1.6)
						local v300 = uDim2New(i / 30 + 0, 0, 1 - i / 30, 0)
						local v301 = effectsServiceNewerCircle(p36, {
							BackgroundTransparency = 1,
							ImageTransparency = 0.2,
							ZIndex = 10000,
							Image = "rbxassetid://122655193981090",
							Size = v299,
							Position = v300
						})

						animation.AnimateAsync(v301, { ImageTransparency = 1 }, 2, "InOut", "Sine")
						task.wait(2)
						v301:Destroy()
					end)
				end
			end
		end)
		animation.AnimateAsync(v163, { ImageTransparency = 0 }, 0, "InOut", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v163, { ImageTransparency = 1 }, 0, "InOut", "Sine")
		animation.AnimateAsync(v167, { ImageTransparency = 0 }, 0, "InOut", "Sine")
		task.wait(0.1)
		animation.AnimateAsync(v167, { ImageTransparency = 1 }, 0, "InOut", "Sine")
		animation.AnimateAsync(v171, { ImageTransparency = 0 }, 0, "InOut", "Sine")
		task.wait(1.5)
		animation.AnimateAsync(v171, { ImageTransparency = 1 }, 0.3, "InOut", "Sine")

		local animationAnimateAsync = animation.AnimateAsync
		local color316 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v160, { ImageColor3 = color316 }, 0.3, "InOut", "Sine")
		task.wait(0.3)
		v163:Destroy()
		v167:Destroy()
		v171:Destroy()
		v160:Destroy()
		p37.Visible = true
	end,
	CarnationTrigger = function(p40, p41, _, _)
		task.spawn(function()
			local n1 = p41.ZIndex + 1
			local image = p41.Image
			local uDim2 = UDim2.new(0, p41.AbsoluteSize.X, 0, p41.AbsoluteSize.Y)
			local color317 = Color3.fromRGB(255, 0, 150)
			local v282 = UDim2.fromOffset(p41.AbsolutePosition.X + p41.AbsoluteSize.X / 2, p41.AbsolutePosition.Y + p41.AbsoluteSize.Y / 2)
			local v283 = effectsServiceNewerCircle(p40, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				ZIndex = n1,
				Image = image,
				Size = uDim2,
				ImageColor3 = color317,
				Position = v282
			})
			local animationAnimate = animation.Animate
			local uDim219 = UDim2.new(0, p41.AbsoluteSize.X * 1.4, 0, p41.AbsoluteSize.Y * 1.4)

			animationAnimate(v283, { ImageTransparency = 1, Size = uDim219 }, 2, "Out", "Quart")
			task.wait(2)
			v283:Destroy()
		end)
		audioServicePlaySound("carnationnoise")
		effectsService.ShakeSync(p41, p41.Position, 0.2, 0.2)
		task.spawn(function()
			for _ = 1, 10 do
				task.spawn(function()
					local randomNumber = math.random(0, 100)
					local color318 = Color3.fromRGB(255, 0, 150)
					local v304 = uDim2New(0, p41.AbsoluteSize.X * 1, 0, p41.AbsoluteSize.X * 1)
					local v305 = uDim2New(randomNumber / 100, 0, 1.2, 0)
					local v306 = effectsServiceNewerCircle(p40, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						ZIndex = 10001,
						Image = "rbxassetid://79084979896264",
						ImageColor3 = color318,
						Size = v304,
						Position = v305
					})

					local v307 = task.spawn(function()
						effectsServiceSpritesheet(v306, Vector2.new(128, 256), { 6, 5 }, 1, 6, 24, nil, true)
					end)

					local animationAnimateAsync = animation.AnimateAsync
					local v309 = uDim2New(randomNumber / 100, 0, 0.98, 0)

					animationAnimateAsync(v306, { Position = v309 }, 0.4, "InOut", "Sine")
					task.wait(1)

					local animateAsync = animation.AnimateAsync

					v309 = uDim2New(randomNumber / 100, 0, 1.2, 0)
					animateAsync(v306, { Position = v309 }, 1, "InOut", "Sine")
					task.wait(1)
					task.cancel(v307)
					v306:Destroy()
				end)
				task.spawn(function()
					local randomNumber = math.random(0, 100)
					local color319 = Color3.fromRGB(255, 0, 150)
					local v313 = uDim2New(0, p41.AbsoluteSize.X * 1, 0, p41.AbsoluteSize.X * 1)
					local v314 = uDim2New(randomNumber / 100, 0, -0.2, 0)
					local v315 = effectsServiceNewerCircle(p40, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						ZIndex = 10001,
						Image = "rbxassetid://79084979896264",
						Rotation = 180,
						ImageColor3 = color319,
						Size = v313,
						Position = v314
					})

					local v316 = task.spawn(function()
						effectsServiceSpritesheet(v315, Vector2.new(128, 256), { 6, 5 }, 1, 6, 24, nil, true)
					end)

					local animationAnimateAsync = animation.AnimateAsync
					local v318 = uDim2New(randomNumber / 100, 0, 0, 0)

					animationAnimateAsync(v315, { Position = v318 }, 0.4, "InOut", "Sine")
					task.wait(1)

					local animateAsync = animation.AnimateAsync

					v318 = uDim2New(randomNumber / 100, 0, -0.2, 0)
					animateAsync(v315, { Position = v318 }, 1, "InOut", "Sine")
					task.wait(1)
					task.cancel(v316)
					v315:Destroy()
				end)
				task.spawn(function()
					local randomNumber = math.random(0, 100)
					local color320 = Color3.fromRGB(255, 0, 150)
					local v322 = uDim2New(0, p41.AbsoluteSize.X * 1, 0, p41.AbsoluteSize.X * 1)
					local v323 = uDim2New(-0.1, 0, randomNumber / 100, 0)
					local v324 = effectsServiceNewerCircle(p40, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						ZIndex = 10001,
						Image = "rbxassetid://79084979896264",
						Rotation = 90,
						ImageColor3 = color320,
						Size = v322,
						Position = v323
					})

					local v325 = task.spawn(function()
						effectsServiceSpritesheet(v324, Vector2.new(128, 256), { 6, 5 }, 1, 6, 24, nil, true)
					end)

					local animationAnimateAsync = animation.AnimateAsync
					local v327 = uDim2New(0.01, 0, randomNumber / 100, 0)

					animationAnimateAsync(v324, { Position = v327 }, 0.4, "InOut", "Sine")
					task.wait(1)

					local animateAsync = animation.AnimateAsync

					v327 = uDim2New(-0.1, 0, randomNumber / 100, 0)
					animateAsync(v324, { Position = v327 }, 1, "InOut", "Sine")
					task.wait(1)
					task.cancel(v325)
					v324:Destroy()
				end)
				task.spawn(function()
					local randomNumber = math.random(0, 100)
					local color321 = Color3.fromRGB(255, 0, 150)
					local v331 = uDim2New(0, p41.AbsoluteSize.X * 1, 0, p41.AbsoluteSize.X * 1)
					local v332 = uDim2New(1.1, 0, randomNumber / 100, 0)
					local v333 = effectsServiceNewerCircle(p40, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						ZIndex = 10001,
						Image = "rbxassetid://79084979896264",
						Rotation = 270,
						ImageColor3 = color321,
						Size = v331,
						Position = v332
					})

					local v334 = task.spawn(function()
						effectsServiceSpritesheet(v333, Vector2.new(128, 256), { 6, 5 }, 1, 6, 24, nil, true)
					end)

					local animationAnimateAsync = animation.AnimateAsync
					local v336 = uDim2New(0.99, 0, randomNumber / 100, 0)

					animationAnimateAsync(v333, { Position = v336 }, 0.4, "InOut", "Sine")
					task.wait(1)

					local animateAsync = animation.AnimateAsync

					v336 = uDim2New(1.1, 0, randomNumber / 100, 0)
					animateAsync(v333, { Position = v336 }, 1, "InOut", "Sine")
					task.wait(1)
					task.cancel(v334)
					v333:Destroy()
				end)
				task.wait(0.02)
			end
		end)
	end,
	PandemoniumSummon = function(p44, p45, _, _)
		audioServiceDimSongs()

		local zIndex = p45.ZIndex
		local absolutePosition = p45.AbsolutePosition
		local absoluteSize = p45.AbsoluteSize
		local n1 = p45.ZIndex + 10000
		local color322 = Color3.fromRGB(255, 255, 255)
		local v192 = uDim2New(0, p45.AbsoluteSize.X * 1.75, 0, p45.AbsoluteSize.Y)
		local uDim2 = UDim2.new(1.3, 0, 0, p45.AbsolutePosition.Y)
		local uDim220 = UDim2.new(0, 0, 0, p45.AbsoluteSize.Y * 0.5)
		local parent = effectsServiceNewerCircle(p44, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://75776863577612",
			ZIndex = n1,
			ImageColor3 = color322,
			Size = v192,
			Position = uDim2 + uDim220
		})
		local n2 = p45.ZIndex + 20500
		local color323 = Color3.fromRGB(255, 255, 255)
		local v198 = uDim2New(1, 0, 1, 0)
		local v199 = effectsServiceNewerCircle(p44, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://75776863577612",
			ZIndex = n2,
			ImageColor3 = color323,
			Size = v198,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Parent = parent
		})
		local n3 = p45.ZIndex + 20500
		local color324 = Color3.fromRGB(255, 255, 255)
		local image = p45.Image
		local v203 = uDim2New(0, p45.AbsoluteSize.X, 0, p45.AbsoluteSize.Y)
		local uDim221 = UDim2.new(0, p45.AbsolutePosition.X, 0, p45.AbsolutePosition.Y)
		local uDim222 = UDim2.new(0, p45.AbsoluteSize.X * 0.5, 0, p45.AbsoluteSize.Y * 0.5)
		local v206 = effectsServiceNewerCircle(p44, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = n3,
			ImageColor3 = color324,
			Image = image,
			Size = v203,
			Position = uDim221 + uDim222
		})

		p45.ImageTransparency = 1
		audioServicePlaySound("PandemoniumIdle", { TimePosition = 18 })

		local animationAnimate = animation.Animate
		local uDim223 = UDim2.new(0, p45.AbsolutePosition.X, 0, p45.AbsolutePosition.Y)
		local uDim224 = UDim2.new(0, p45.AbsoluteSize.X * 0.5, 0, p45.AbsoluteSize.Y * 0.5)

		animationAnimate(parent, { Position = uDim223 + uDim224 }, 2.5, "InOut", "Linear")
		task.wait(1)
		v206.ImageTransparency = 0
		v199.ImageTransparency = 1
		audioServicePlaySound("ScareSting")

		local animationAnimateAsync = animation.AnimateAsync
		local uDim225 = UDim2.new(0, p45.AbsolutePosition.X, 0, p45.AbsolutePosition.Y - 40)
		local uDim226 = UDim2.new(0, p45.AbsoluteSize.X * 0.5, 0, p45.AbsoluteSize.Y * 0.5)
		local v213 = UDim2.fromOffset(absoluteSize.X * 12, absoluteSize.Y * 12)

		animationAnimateAsync(v206, { Rotation = 20, Position = uDim225 + uDim226, Size = v213 }, 0.7, "Out", "Quint")
		task.wait(0.71)
		audioServicePlaySound("Pandemonium")
		effectsService.ShakeSync(v206, v206.Position, 0.45, 0.1)
		task.wait(0.5)

		local animate = animation.Animate
		local uDim227 = UDim2.new(0, p45.AbsolutePosition.X, 0, p45.AbsolutePosition.Y)
		local uDim228 = UDim2.new(0, p45.AbsoluteSize.X * 0.5, 0, p45.AbsoluteSize.Y * 0.5)

		v213 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
		animate(v206, { Rotation = 0, Position = uDim227 + uDim228, Size = v213 }, 0.4, "In", "Quint")
		audioServiceUndimSongs()
		task.wait(0.5)
		v206.ImageTransparency = 1
		p45.ImageTransparency = 0
		v206:Destroy()
		parent:Destroy()
		v199:Destroy()
	end
}

function module.SebastianEffect(p48, p49, _, p51)
	audioServicePlaySound("SebastianEffect")
	task.spawn(function()
		module.BaseplateBlue(p48, p49, p49, p51, true)
		task.wait(0.1)
		module.BaseplateGreen(p48, p49, p49, p51, true)
	end)
	p49.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p49, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.SebastianDeath(p52, p53, _, _)
	audioServicePlaySound("SebastianDeath")

	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	local t3: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
	local v227 = UDim2.fromOffset(p53.AbsoluteSize.X, p53.AbsoluteSize.X)
	local t4: {[any]: any} = {
		Strength = 50,
		Time = 0.175,
		Speed = 0.25,
		Lifetime = 0.225,
		Transparency = 0.5,
		EasingStyle = "Quad",
		Projectile = effectsServiceBreathimagesSmog,
		Color = t3,
		Size = v227
	}

	spawn(function()
		audioServicePlaySound("WooshEmotion")
		effectsService.Shake(p53, p53.Position, 0.2, 0.05)
		effectsServiceBreath(p52, p53, p53, t4)
	end)
end
function module.PainterSummon(_, p57, _, _)
	audioServicePlaySound("PainterSummon")
	audioServicePlaySound("MinigunStart")
	p57.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p57, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.PainterEffect(_, p61, _, _)
	audioServicePlaySound("PainterEffect")
	audioServicePlaySound("MinigunStart")
	p61.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p61, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.PainterDeath(_, p65, _, _)
	audioServicePlaySound("PainterDeath")
	audioServicePlaySound("MinigunEnd")
	p65.Rotation = math.random(-20, 20)
	animation.AnimateAsync(p65, { Rotation = 0 }, 0.5, "Out", "Quint")
end
function module.Immolated(p68, p69)
	p69.Image = "rbxassetid://8717323465"
	p69.ImageColor3 = Color3.fromRGB(255, 0, 4)
	p69.ImageTransparency = 1
	p69.Visible = true
	audioService.PlaySound("immolate")
	animation.AnimateAsync(p69, { ImageTransparency = 0.4 }, 1, "Out", "Quart")
	spawn(function()
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local t5: {[any]: any} = { Color3.fromRGB(240, 141, 70), Color3.fromRGB(202, 91, 27) }
		local v289 = UDim2.fromOffset(p69.AbsoluteSize.X / 1.1, p69.AbsoluteSize.X / 1.1)
		local t6: {[any]: any} = {
			Strength = 200,
			Time = 0.5,
			Projectile = effectsServiceBreathimagesFire,
			Color = t5,
			Size = v289
		}

		effectsServiceBreath(p68, p69, p69, t6)
		t6.Color = { Color3.fromRGB(204, 82, 58), Color3.fromRGB(217, 72, 23) }
		t6.Size = UDim2.fromOffset(p69.AbsoluteSize.X / 1.5, p69.AbsoluteSize.X / 1.5)
		effectsServiceBreath(p68, p69, p69, t6)
	end)
end
function module.Thec2(p70, p71, _, _)
	audioServiceDimSongs()

	local color325 = Color3.fromRGB(0, 0, 0)
	local n1 = p71.ZIndex + 100000
	local v249 = uDim2New(1, 0, 2, 0)
	local v250 = uDim2New(0.5, 0, 0.5, 0)
	local v251 = effectsServiceNewerCircle(p70, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		BackgroundColor3 = color325,
		ZIndex = n1,
		Size = v249,
		Position = v250
	})

	animation.AnimateAsync(v251, { BackgroundTransparency = 0 }, 0.3, "Out", "Quart")
	task.wait(0.5)
	audioServicePlaySound("Scary Sound")

	local color326 = Color3.fromRGB(255, 255, 255)
	local n2 = p71.ZIndex + 100001
	local v254 = UDim2.fromOffset(p71.AbsoluteSize.Y * 2, p71.AbsoluteSize.Y * 2)
	local v255 = uDim2New(0.5, 0, 0.5, -36)
	local v256 = effectsServiceNewerCircle(p70, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://13613038354",
		ImageColor3 = color326,
		ZIndex = n2,
		Size = v254,
		Position = v255
	})
	local color327 = Color3.fromRGB(255, 255, 255)
	local n3 = p71.ZIndex + 100002
	local v259 = UDim2.fromOffset(p71.AbsoluteSize.Y * 3, p71.AbsoluteSize.Y * 3)
	local v260 = uDim2New(0.5, 0, 1, -36)
	local v261 = effectsServiceNewerCircle(p70, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 90,
		Image = "rbxassetid://13613222363",
		Visible = false,
		ImageColor3 = color327,
		ZIndex = n3,
		Size = v259,
		Position = v260
	})

	task.wait(0.3)
	v251.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	v261.Visible = true

	local animationAnimateAsync = animation.AnimateAsync
	local v263 = UDim2.fromScale(0.5, 0.8)

	animationAnimateAsync(v261, { Rotation = 50, Position = v263 }, 1.1, "Out", "Quart")
	task.wait(0.05)
	v261.Visible = false
	v251.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	task.wait(0.2)
	audioServicePlaySound("PreSlash")
	task.wait(0.2)
	v261.Visible = true
	v251.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	task.wait(0.2)
	v261:Destroy()
	effectsService.ShakeBattleSync(p70, 0.5, 0.025)
	v251:Destroy()
	v256:Destroy()
	audioServiceUndimSongs()
end

return module
