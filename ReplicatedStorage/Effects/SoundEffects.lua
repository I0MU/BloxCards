



local function v1(p1)
	if game:GetService("RunService"):IsStudio() then
		print(p1)
	end
end

local effectsService = require(game.ReplicatedStorage.EffectsService)
local effectsServiceWaitX = effectsService.waitX
local effectsServiceApplyValues = effectsService.ApplyValues
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
local v39 = math.random

local function GetWeightedRandom(p2)
	return (v39() - 0.5) * p2
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
		local v70 = p10.Keypoints[i]
		local v71 = p10.Keypoints[i + 1]

		if p11 >= v70.Time and p11 < v71.Time then
			local n1 = (p11 - v70.Time) / (v71.Time - v70.Time)

			return Color3.new((v71.Value.R - v70.Value.R) * n1 + v70.Value.R, (v71.Value.G - v70.Value.G) * n1 + v70.Value.G, (v71.Value.B - v70.Value.B) * n1 + v70.Value.B)
		end
	end
end
getVector3 = function(p12)
	local y = p12.AbsolutePosition.Y
	local n1 = p12.AbsolutePosition.Y + p12.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p12.AbsolutePosition.X, p12.AbsolutePosition.X + p12.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
getVector3 = function(p13)
	local uDim2 = UDim2.new(0, p13.AbsolutePosition.X, 0, p13.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p13.AbsoluteSize.X * 0.5, 0, p13.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
getVector3 = function(p14)
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
getVector3 = { color3, color32, color33, Color3.fromRGB(255, 255, 0) }

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
local function PlaySoundAndShake(p20, p21, p22, p23)
	PlaySoundWithOptionalShake(p20, p21, p22, p23)
end

local t1: {[any]: any} = {
	GoldenKill = { type = "sound", sound = "Golden Kill" },
	Goal = { type = "sound", sound = "Goal" },
	Shirt = { type = "sound", sound = "shirt" },
	Pants = { type = "sound", sound = "pants" },
	RaySummon = { type = "sound", sound = "RaySummon" },
	RayDeath = { type = "sound", sound = "RayDeath" },
	NekoBotSummon = { type = "sound", sound = "nekobot" },
	KingSound = { type = "sound", sound = "KingDeathWeep" },
	PirateSound = { type = "sound", sound = "BlackBeardVoiceline1" },
	wildymeme = { type = "sound", sound = "Pig Grunt" },
	NoobNoise = {
		type = "random",
		sounds = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
	},
	CombineDeath = {
		type = "random",
		sounds = { "CombineDeath1", "CombineDeath2", "CombineDeath3", "CombineDeath4" }
	},
	DuckCall = {
		type = "random",
		sounds = { "Quack", "Quack2", "Squeaky" }
	},
	ClownHonk = {
		type = "shake",
		duration = 0.2,
		magnitude = 0.05,
		sounds = { "Clown Honk" }
	},
	ClownDeath = {
		type = "shake",
		duration = 0.2,
		magnitude = 0.05,
		sounds = { "bananaslip" }
	},
	ShedLaugh = {
		type = "shake",
		duration = 0.5,
		magnitude = 0.15,
		sounds = { "John's Laugh" }
	},
	NinjaCall = {
		type = "shake",
		duration = 0.3,
		magnitude = 0.05,
		sounds = { "Yell1", "Yell2", "NinjaSwish", "NinjaSummon1", "NinjaSummon2" }
	},
	MeeboidCall = {
		type = "shake",
		duration = 0.3,
		magnitude = 0.05,
		sounds = {
			"MeebCallDown",
			"MeebCallUp",
			"MeebCallLeft",
			"MeebCallRight",
			"MeebCallChu"
		}
	},
	PenguinCall = {
		type = "shake",
		duration = 0.3,
		magnitude = 0.05,
		sounds = { "penguin" }
	},
	CombineCall = {
		type = "shake",
		duration = 0.3,
		magnitude = 0.05,
		sounds = {
			"Combine1",
			"Combine2",
			"Combine3",
			"Combine4",
			"Combine5",
			"Combine6"
		}
	},
	SuspiciousMeme = {
		type = "custom",
		action = function(p24, p25, p26, _, _)
			local t3: {[any]: any} = {
				"GET OUT OF MY HEAD!",
				"GET OUT! GET OUT! GET OUT!",
				"AMONG US!",
				"*BOOM*"
			}
			local t4: {[any]: any} = {
				"Vine Boom",
				"Vine Boom",
				"Vine Boom",
				"Vine Boom",
				"Vine Boom",
				"Vine Boom Damn"
			}
			local color34 = Color3.fromRGB(255, 0, 0)
			local color35 = Color3.fromRGB(149, 9, 30)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t3)
			local v104 = t3[randomNumber]
			local arcade = Enum.Font.Arcade
			local t5: {[any]: any} = { color34, color35, color3FromRGB(141, 22, 12) }
			local randomNumber2 = math.random(1, #t5)
			local v108 = t5[randomNumber2]
			local randomNumber3 = math.random(-15, 15)
			local n1 = p25.ZIndex + 10000

			task.spawn(function()
				local randomNumber4 = math.random(1, #t4)

				audioServicePlaySound(t4[randomNumber4])
			end)
			effectsServiceSpeakText(p24, p25, p26, 2, p25, {
				Text = v104,
				Font = arcade,
				TextColor3 = v108,
				TextStrokeTransparency = 0,
				Rotation = randomNumber3,
				ZIndex = n1
			}, 0.2)
		end
	},
	BrometheusDeath = {
		type = "custom",
		action = function(p29, p30, p31, _, _)
			local t6: {[any]: any} = {
				"If I cannot inspire love, I will cause fear!",
				"How dangerous is the acquirement of knowledge!",
				"I beheld the wretch—the miserable monster.",
				"The memory of these evils should die with me..."
			}
			local t7: {[any]: any} = {
				"Vine Boom",
				"Vine Boom",
				"Vine Boom",
				"Bell Sound",
				"Ouch",
				"Vine Boom Damn"
			}
			local color36 = Color3.fromRGB(222, 255, 207)
			local color37 = Color3.fromRGB(188, 255, 137)
			local color38 = Color3.fromRGB(60, 135, 45)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t6)
			local v123 = t6[randomNumber]
			local grenzeGotisch = Enum.Font.GrenzeGotisch
			local t8: {[any]: any} = { color36, color37, color38, color3FromRGB(29, 153, 7) }
			local randomNumber5 = math.random(1, #t8)
			local v127 = t8[randomNumber5]
			local randomNumber6 = math.random(-5, 5)
			local n1 = p30.ZIndex + 10000

			task.spawn(function()
				local randomNumber7 = math.random(1, #t7)

				audioServicePlaySound(t7[randomNumber7])
			end)
			effectsServiceSpeakText(p29, p30, p31, 3.5, p30, {
				Text = v123,
				Font = grenzeGotisch,
				TextColor3 = v127,
				TextStrokeTransparency = 0,
				Rotation = randomNumber6,
				ZIndex = n1
			}, 0.8)
		end
	},
	RayburnRant = {
		type = "custom",
		action = function(_, _, _, _, _)
			if math.random(1, 10) == 10 then
				audioServicePlaySound("RayburnRant")
			end
		end
	},
	SnubGone = {
		type = "custom",
		action = function(p39, p40, p41, p42, _)
			local t9: {[any]: any} = {
				"ClientErrorDocumentFormatNotSupported",
				"duplicaten't :(",
				"E_UP_JOB_FAILED_NO_STATUS"
			}
			local t10: {[any]: any} = { "SnubDeath1", "SnubDeath2" }
			local color39 = Color3.fromRGB(255, 71, 47)
			local color310 = Color3.fromRGB(130, 114, 255)
			local color311 = Color3.fromRGB(114, 255, 213)
			local color312 = Color3.fromRGB(156, 234, 255)
			local color313 = Color3.fromRGB(227, 114, 255)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t9)
			local v149 = t9[randomNumber]
			local patrickHand = Enum.Font.PatrickHand
			local t11: {[any]: any} = {
				color39,
				color310,
				color311,
				color312,
				color313,
				color3FromRGB(140, 255, 120)
			}
			local randomNumber8 = math.random(1, #t11)
			local v153 = t11[randomNumber8]
			local randomNumber9 = math.random(-10, 10)
			local n1 = p40.ZIndex + 10000

			task.wait(0.1)
			task.spawn(function()
				local randomNumber10 = math.random(1, #t10)

				audioServicePlaySound(t10[randomNumber10])
			end)
			effectsServiceSpeak(p39, p40, p41, p42, {
				Text = v149,
				Font = patrickHand,
				TextColor3 = v153,
				TextStrokeTransparency = 0,
				Rotation = randomNumber9,
				ZIndex = n1
			})
		end
	},
	NoobCall = {
		type = "custom",
		action = function(_, p45)
			local t12: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
			local randomNumber = math.random(1, #t12)

			audioServicePlaySound(t12[randomNumber])
			p45.Rotation = math.random(-20, 20)
			animation.AnimateAsync(p45, { Rotation = 0 }, 0.5, "Out", "Quint")
		end
	},
	NoobDeath = {
		type = "custom",
		action = function(_, p47)
			local t13: {[any]: any} = { "NoobDeath", "Ouch" }
			local randomNumber = math.random(1, #t13)

			audioServicePlaySound(t13[randomNumber])
			p47.Rotation = math.random(-20, 20)
			animation.AnimateAsync(p47, { Rotation = 0 }, 0.5, "Out", "Quint")
		end
	},
	RobloxianCall = {
		type = "custom",
		action = function(_, p49)
			local t14: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
			local randomNumber = math.random(1, #t14)

			audioServicePlaySound(t14[randomNumber])

			local v168 = p49.Size

			local function scale(p50)
				return UDim2.new(v168.X.Scale, v168.X.Offset * p50, v168.Y.Scale, v168.Y.Offset * p50)
			end

			local animationAnimateAsync = animation.AnimateAsync
			local uDim2 = UDim2.new(v168.X.Scale, v168.X.Offset * 1.12, v168.Y.Scale, v168.Y.Offset * 1.12)

			animationAnimateAsync(p49, { Size = uDim2 }, 0.15, "Out", "Quad")
			task.delay(0.15, function()
				local animationAnimateAsync = animation.AnimateAsync
				local uDim23 = UDim2.new(v168.X.Scale, v168.X.Offset * 0.95, v168.Y.Scale, v168.Y.Offset * 0.95)

				animationAnimateAsync(p49, { Size = uDim23 }, 0.12, "Out", "Quad")
			end)
			task.delay(0.27, function()
				local animationAnimateAsync = animation.AnimateAsync
				local uDim24 = UDim2.new(v168.X.Scale, v168.X.Offset * 1.05, v168.Y.Scale, v168.Y.Offset * 1.05)

				animationAnimateAsync(p49, { Size = uDim24 }, 0.1, "Out", "Quad")
			end)
			task.delay(0.37, function()
				animation.AnimateAsync(p49, { Size = v168 }, 0.12, "Out", "Quad")
			end)
			task.delay(0.37, function()
				local t45: {[any]: any} = { "FastSplat", "Kerplunk.wav", "snap.wav", "bass.wav", "button.wav" }
				local randomNumber11 = math.random(1, #t45)

				audioServicePlaySound(t45[randomNumber11])

				local t46: {[any]: any} = { -15, 12, -8, 5, -3, 0 }
				local t47: {[any]: any} = { 0.08, 0.08, 0.08, 0.08, 0.08, 0.08 }
				local n1 = 0

				for i = 1, #t46 do
					task.delay(n1, function()
						animation.AnimateAsync(p49, { Rotation = t46[i] }, t47[i], "InOut", "Sine")
					end)
					n1 += t47[i]
				end
			end)
		end
	},
	NightmareCall = {
		type = "custom",
		action = function(_, p52, _, _, _)
			local t15: {[any]: any} = { "demise", "NightmareGrunt", "NightmareRoar" }
			local randomNumber = math.random(1, #t15)

			audioServicePlaySound(t15[randomNumber])
			effectsService.Shake(p52, p52.Position, 0.25, 0.08)
		end
	},
	Roar = {
		type = "custom",
		action = function(_, p57, _, _, _)
			local t16: {[any]: any} = { "Roar1", "Roar2", "Roar3", "Roar4" }
			local randomNumber = math.random(1, #t16)

			audioServicePlaySound(t16[randomNumber])
			effectsService.Shake(p57, p57.Position, 0.25, 0.08)
		end
	},
	KorbloxCall = {
		type = "custom",
		action = function(_, p62)
			audioServicePlaySound("KorbloxSummon")

			local t17: {[any]: any} = { "Wind", "Woosh", "Korblox" }
			local randomNumber = math.random(1, #t17)

			audioServicePlaySound(t17[randomNumber])
			p62.Rotation = math.random(-25, 25)
			animation.AnimateAsync(p62, { Rotation = 0 }, 0.35, "Out", "Quint")
		end
	},
	KorbloxDeath = {
		type = "custom",
		action = function(_, p64, _, _, _)
			audioServicePlaySound("Korblox")
			task.wait(0.2)

			local animationAnimateAsync = animation.AnimateAsync
			local color314 = Color3.fromRGB(0, 49, 211)

			animationAnimateAsync(p64, { ImageColor3 = color314 }, 0.5, "Out", "Quint")
			audioServicePlaySound("KorbloxDeath")
			p64.Rotation = math.random(-25, 25)
			animation.AnimateAsync(p64, { Rotation = 0 }, 0.25, "Out", "Quint")
			task.wait(0.3)
		end
	},
	ToyCarNoise = {
		type = "custom",
		action = function(_, p69, _, _, _)
			local t18: {[any]: any} = {
				"Rev up",
				"Kerplunk.wav",
				"snap.wav",
				"bass.wav",
				"button.wav",
				"TruckHonk"
			}
			local randomNumber = math.random(1, #t18)

			audioServicePlaySound(t18[randomNumber])
			p69.Rotation = math.random(-20, 20)
			animation.AnimateAsync(p69, { Rotation = 0 }, 0.5, "Out", "Quint")
		end
	},
	DogeBark = {
		type = "custom",
		action = function(p73, p74, p75, p76, _)
			local t19: {[any]: any} = {
				"very wow",
				"wow",
				"HOWL?",
				"BARK?",
				"WOOF?",
				"such card",
				"much wow"
			}
			local t20: {[any]: any} = { "dogbark", "dogbark2", "dogbark3" }
			local color315 = Color3.fromRGB(255, 71, 47)
			local color316 = Color3.fromRGB(130, 114, 255)
			local color317 = Color3.fromRGB(114, 255, 213)
			local color318 = Color3.fromRGB(156, 234, 255)
			local color319 = Color3.fromRGB(227, 114, 255)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t19)
			local v218 = t19[randomNumber]
			local patrickHand = Enum.Font.PatrickHand
			local t21: {[any]: any} = {
				color315,
				color316,
				color317,
				color318,
				color319,
				color3FromRGB(140, 255, 120)
			}
			local randomNumber12 = math.random(1, #t21)
			local v222 = t21[randomNumber12]
			local randomNumber13 = math.random(-10, 10)
			local n1 = p74.ZIndex + 10000

			task.spawn(function()
				local randomNumber14 = math.random(1, #t20)

				audioServicePlaySound(t20[randomNumber14])

				if math.random(1, 2) == 1 then
					wait(0.2)

					local randomNumber15 = math.random(1, #t20)

					audioServicePlaySound(t20[randomNumber15])
				end
			end)
			effectsServiceSpeak(p73, p74, p75, p76, {
				Text = v218,
				Font = patrickHand,
				TextColor3 = v222,
				TextStrokeTransparency = 0,
				Rotation = randomNumber13,
				ZIndex = n1
			}, 0.1)
		end
	},
	DogeThanks = {
		type = "custom",
		action = function(p78, _, p80, p81, _)
			local t22: {[any]: any} = { "very king", "such crown", "much power" }
			local t23: {[any]: any} = { "dogbark", "dogbark2", "dogbark3" }
			local color320 = Color3.fromRGB(255, 71, 47)
			local color321 = Color3.fromRGB(130, 114, 255)
			local color322 = Color3.fromRGB(114, 255, 213)
			local color323 = Color3.fromRGB(156, 234, 255)
			local color324 = Color3.fromRGB(227, 114, 255)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t22)
			local v239 = t22[randomNumber]
			local patrickHand = Enum.Font.PatrickHand
			local t24: {[any]: any} = {
				color320,
				color321,
				color322,
				color323,
				color324,
				color3FromRGB(140, 255, 120)
			}
			local randomNumber16 = math.random(1, #t24)
			local v243 = t24[randomNumber16]
			local randomNumber17 = math.random(-10, 10)
			local n1 = p80.ZIndex + 10000

			task.spawn(function()
				local randomNumber18 = math.random(1, #t23)

				audioServicePlaySound(t23[randomNumber18])

				if math.random(1, 2) == 1 then
					wait(0.15)

					local randomNumber19 = math.random(1, #t23)

					audioServicePlaySound(t23[randomNumber19])
				end
			end)
			effectsServiceSpeakOther(p78, p80, p80, p81, {
				Text = v239,
				Font = patrickHand,
				TextColor3 = v243,
				TextStrokeTransparency = 0,
				Rotation = randomNumber17,
				ZIndex = n1
			}, 0.1)
		end
	},
	DogeDogeBark = {
		type = "custom",
		action = function(p83, p84, p85, p86, _)
			local t25: {[any]: any} = {
				"very doge",
				"such royalty",
				"much loyalty",
				"such devotion",
				"much subjects"
			}
			local t26: {[any]: any} = { "dogbark", "dogbark2", "dogbark3" }
			local color325 = Color3.fromRGB(255, 71, 47)
			local color326 = Color3.fromRGB(130, 114, 255)
			local color327 = Color3.fromRGB(114, 255, 213)
			local color328 = Color3.fromRGB(156, 234, 255)
			local color329 = Color3.fromRGB(227, 114, 255)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t25)
			local v260 = t25[randomNumber]
			local patrickHand = Enum.Font.PatrickHand
			local t27: {[any]: any} = {
				color325,
				color326,
				color327,
				color328,
				color329,
				color3FromRGB(140, 255, 120)
			}
			local randomNumber20 = math.random(1, #t27)
			local v264 = t27[randomNumber20]
			local randomNumber21 = math.random(-10, 10)
			local n1 = p84.ZIndex + 10000

			task.spawn(function()
				local randomNumber22 = math.random(1, #t26)

				audioServicePlaySound(t26[randomNumber22])
				wait(0.2)

				local randomNumber23 = math.random(1, #t26)

				audioServicePlaySound(t26[randomNumber23])
			end)
			effectsServiceSpeak(p83, p84, p85, p86, {
				Text = v260,
				Font = patrickHand,
				TextColor3 = v264,
				TextStrokeTransparency = 0,
				Rotation = randomNumber21,
				ZIndex = n1
			}, 0.3)
		end
	},
	Barking = {
		type = "custom",
		action = function(_, p89, _, _, _)
			local t28: {[any]: any} = { "dogbark", "dogbark2", "dogbark3" }
			local randomNumber = math.random(1, 2)

			task.spawn(function()
				local randomNumber24 = math.random(1, #t28)

				audioServicePlaySound(t28[randomNumber24])

				if randomNumber == 1 then
					wait(0.2)

					local randomNumber25 = math.random(1, #t28)

					audioServicePlaySound(t28[randomNumber25])
				end
			end)
			p89.Rotation = math.random(-25, 25)
			animation.AnimateAsync(p89, { Rotation = 0 }, 0.5, "Out", "Quint")
		end
	},
	DogeGone = {
		type = "custom",
		action = function(p93, p94, p95, p96, _)
			local t29: {[any]: any} = { "very sad", "such power", "much weak", "wow" }
			local t30: {[any]: any} = { "dogbark4", "dogbark5", "dogbark6" }
			local color330 = Color3.fromRGB(255, 71, 47)
			local color331 = Color3.fromRGB(130, 114, 255)
			local color332 = Color3.fromRGB(114, 255, 213)
			local color333 = Color3.fromRGB(156, 234, 255)
			local color334 = Color3.fromRGB(227, 114, 255)
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(1, #t29)
			local v288 = t29[randomNumber]
			local patrickHand = Enum.Font.PatrickHand
			local t31: {[any]: any} = {
				color330,
				color331,
				color332,
				color333,
				color334,
				color3FromRGB(140, 255, 120)
			}
			local randomNumber26 = math.random(1, #t31)
			local v292 = t31[randomNumber26]
			local randomNumber27 = math.random(-10, 10)
			local n1 = p94.ZIndex + 10000

			task.wait(0.1)
			task.spawn(function()
				local randomNumber28 = math.random(1, #t30)

				audioServicePlaySound(t30[randomNumber28])
			end)
			effectsServiceSpeak(p93, p94, p95, p96, {
				Text = v288,
				Font = patrickHand,
				TextColor3 = v292,
				TextStrokeTransparency = 0,
				Rotation = randomNumber27,
				ZIndex = n1
			})
		end
	},
	BowlSummon = {
		type = "custom",
		action = function(_, p99, _, _, _)
			spawn(function()
				local t48: {[any]: any} = { "Spooky", "Spooky2", "Spooky3" }
				local randomNumber = math.random(1, #t48)

				audioServicePlaySound(t48[randomNumber])
				effectsService.Shake(p99, p99.Position, 0.2, 0.05)
			end)
		end
	},
	BowlBuff = {
		type = "custom",
		action = function(_, _, _, _, _)
			if math.random(1, 2) == 1 then
				local t32: {[any]: any} = { "Spooky", "Spooky2", "Spooky3" }
				local randomNumber = math.random(1, #t32)

				audioServicePlaySound(t32[randomNumber])
			end
		end
	},
	BowlDeath = {
		type = "custom",
		action = function(p108, p109, _, _, _)
			local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
			local t33: {[any]: any} = { Color3.fromRGB(67, 216, 25), Color3.fromRGB(18, 47, 7) }
			local v314 = UDim2.fromOffset(p109.AbsoluteSize.X, p109.AbsoluteSize.X)
			local t34: {[any]: any} = {
				Strength = 50,
				Time = 0.175,
				Speed = 0.25,
				Lifetime = 0.225,
				Transparency = 0.5,
				EasingStyle = "Quad",
				Projectile = effectsServiceBreathimagesFire,
				Color = t33,
				Size = v314
			}

			spawn(function()
				local t49: {[any]: any} = { "Spooky", "Spooky2", "Spooky3" }
				local randomNumber = math.random(1, #t49)

				audioServicePlaySound(t49[randomNumber])
				audioServicePlaySound("FireBreath")
				t49 = { "BowlBreak1", "BowlBreak2", "BowlBreak3" }
				local randomNumber29 = math.random(1, #t49)

				audioServicePlaySound(t49[randomNumber29])
				effectsService.Shake(p109, p109.Position, 0.2, 0.05)
				effectsServiceBreath(p108, p109, p109, t34)
			end)
		end
	},
	BeeL = {
		type = "custom",
		action = function(_, _, _, _, _)
			audioService.DimSongs()
			audioServicePlaySound("BeeL")
			task.wait(2)
			audioService.UndimSongs()
		end
	},
	BeeV = {
		type = "custom",
		action = function(_, _, _, _, _)
			audioService.DimSongs()
			audioServicePlaySound("BeeV")
			task.wait(1.25)
			audioService.UndimSongs()
		end
	},
	PoliceCall = {
		type = "custom",
		action = function(_, _, _, _, _)
			local t35: {[any]: any} = { "PoliceChat1", "PoliceChat2", "PoliceChat3" }
			local randomNumber = math.random(1, #t35)

			audioServicePlaySound(t35[randomNumber])
		end
	},
	PolicePrep = {
		type = "custom",
		action = function(_, p129, _, _, _)
			local t36: {[any]: any} = { "PoliceChat1", "PoliceChat2", "PoliceChat3" }

			effectsService.ShakeSync(p129, p129.Position, 0.2, 0.05)

			local randomNumber = math.random(1, #t36)

			audioServicePlaySound(t36[randomNumber])
			task.wait(0.1)
			audioServicePlaySound("SMGReload")
			task.wait(0.1)
		end
	},
	Zoomba = {
		type = "custom",
		action = function(p133, p134, p135, p136, _)
			local t37: {[any]: any} = {
				"Yummy yummy trash (^///^)",
				"I loooove cleaning! ^_^",
				"I looove eating trash! ╰(*°▽°*)╯",
				"mmm cleaning.. ☜(ﾟヮﾟ☜)"
			}

			task.spawn(function()
				if math.random(1, 150) == 1 then
					audioServicePlaySound("insanity")

					local legacy = Enum.Font.Legacy
					local v443 = UDim2.fromOffset(p134.AbsoluteSize.X * 8, p134.AbsoluteSize.Y / 2)
					local color335 = Color3.fromRGB(255, 0, 4)

					effectsServiceSpeak(p133, p134, p135, p136, {
						Text = "S̶̢̨̘̫̼̭̠̍̈́̈́͛̈́̏̍̾e̷̦͕̭̙͈͙͍͓̜͕͓̙͐̎̃̃̇̈́g̴̱̫̥͚̫͚̔̂̑̃̆͘͝m̵̡̹̩̖̠̼̲̅̏̂̈́̌̑̀̆̒͋̉̚͜ͅe̶̡͇̱͕̥̤̺̠̞͋͛̉͆͒͊̂̕̕̕͝͝ͅñ̴̙̭̤̫̆͌̄͒̈̎̇͆̿̿̒͝ţ̸̢̧̲̫̟̮̲̦̟̯̈̀̀̿̏͂͛̄̔̇̄̕͘͘͘a̴̧̟̼̠̻̦͓̞̭̖̯͈̜͑̂̀̓͂͗̈̊͊̑̑͌̈́̿̕͘͜͜ṫ̶̛̲̮̍͗̐̇̉̔̔͆̽̎̂̍̕i̷̡̨̘͔̣̗̣̬̙͓̫̺͙͂̓̈́͋̇̏̄̌́́͠͝͝ͅǫ̷̛̳̣̪͇͍̣̜̤͍̯̠̳̯̪̗̇̀̂̌̌̈́̂̚̚͠ņ̵̮̼͈̻͕̫͍͉̤̮̹̺̖͉͂̂͌͋̌̆̈̃̐̾̕͝ͅ ̴̧̛̙̤̟͇͓̪̣̻̣̤͙̩̀̅̒̽̋͑̌̏͝͝F̵̯̥̭̝͚̐͒͋͛͑̔̆̔͐̊̚͘͜ấ̵̢̨̗̩̬̣̫͖͔͎̤̰̮̋̓̀͆̎̐͊̚͝͝͠u̷̡̧̗̩̣͚̓̈̃l̴̳͉̯̖͙͍̻̊t̴̼̺̙̻̟͆̅̓͐̇̄̅̉͆̇ ̸̡̧̺͎̺͍͈̯̹͕͚̬̫̜̤̊̓̑ͅ(̷̢̛͔̺̤̲̳̝͕̙͚̣͍͎̬̀̔̑͐͐̄͊̈́̅͛̆͂c̵͉̠̞̪̼̫͔̠̗͕̉̽̅͐̂̿̊ǫ̴̨̡̛̤̜͕̝̘̗͉͈̂̔̏̓͗͗̉̀̃͌̆̎̐̎͝r̴̡̛̻̰̤̪͈̥̬̥̘͍̲̹̹̰̯̣̉̊̈̎͋̌̅̉̉̕͝͝ȩ̴͙͔͒̏̂͗͂́̏͝ ̴̲̹̥̜̮̪̦̮͉͙͕̗̲̙̣̯̳̐̓͛̇͆̚͝ḑ̶̬̀̀͊̕ư̵̧̡͎̙̰̯̻̬̥̬̑̽̇̀͛̑͛̀͒͒͂̄̚̚͝͝m̷̢̱̠͖̺̜͎̂̇̋̌͂͑̕͘͜͝ͅp̶̢̨̢͉̮̮͖̹͕̪͈͉̰̱̞̈̊̀̎̈́͗͛̍̏̐͊̃̑̿͘e̵̗̜̎̋̚d̴̨͈̳̣͙̳̖̖̰͉̱̜̼̳̣̏͗̒͑̒̍͋̈́̆̏̒̇̀̕͝)̶̢̞̻̟̞͚̲̗̳̦̩̎̓̈́͒̑́̎̿̑̆̈́͌ ̴̡̡̝̭̟̠͓̹͎̟̆̒̃̊̊̎̈́́͂̕̕͜͝H̸̞̻̞͓̰͊͊̈́̃̏ͅͅĘ̷͇̩̺͖̺̯̦͓̜͆̀̓́͑͐͐͑͂̊̋̂̕̚͘Ḁ̵̟̦̹̃͛́̈̈́̃͝ͅV̸̢̨̮̣̙̲̲̖͈͔̥̣̹̰͋̐̔̋̈ͅͅE̷̡͔̮̜͇͎̣͌̾̊̋͋̚̚N̷̡̛͚̩̠̣̖̙̳̬̠̹̟̦͊̀̆̾̑͛̐͗̊͂̔͠L̸̯̱͚̲̟̘̖͕̮̭͕̬̀̑̍̏̀̽͊͊͛̌͘͝Y̶̨̡̨̢̛̗̲͇̯̱͇͉̩̳̙͋̾̎̅̈́́̀̓͜ ̷̩͈͓͇̮̤̗̞̟͍̂͒͒F̶̞̱̣͙͔̝̯͎̊̈́͂̾̅̑̉͊́̀̓̌̈́̿̅̚Ạ̵̡̱̳̲̥͔͕̺̖̰̲͋̓́̀͆̿͂̐͝Ṯ̵̢̛̲̩̰͎̗͍͔̺̥͉̦̙̗̤̈̂̉̏́̋̄̀̿̽̐́͝H̶̛̛̖̜̥͎͚̪̩͔͙̩͔̻͈̣́͗̔̎͂̎̚͜͝Ę̶̢̺̤͚̻̋̀̓͗̿̕͠͝ͅR̸̢̡̪̰̠̖͖̺̫̞̬͔̝̹̥̾͆̎̏̌̿̒̏́́͋͘͜ ̵̡̦̲͎̭̖̰̼͉̰̣̝̆̓̾͒́͐̏̓̑̐̆́̓̄S̵̡͙͓͚̱̤̫̭̻̹̫͚̙̅̀͊̿̃͜ͅͅḨ̷̧̢͕͈̭̬̪̦͇̲͔̩̖̹̍͋̾E̸͎̻͙̪̙̦̜͂ͅD̶̫̗͙̱͎̆̀͒͛̿̌̂̀̂̂͛͘L̸̲̖̐̈́̔̆̈́̀͑̌́̐͠͝E̴̺̘̊̉͊̎̒Ṯ̶̢̧̯̠̠̯̻̬̞͈̪̼̦̲̫͇̀̈́̀̈́̒̃̈̅͗̔̀̔̇́͝S̸̡̤̙͕̘͖̥͈̮̠̆̆͌͒́̏̅̓̏̔̂̎̓̒̚͜͠͠K̸̡̬̜̳̟͚͖̗̻̟̾̍̆̊̍̎ͅY̴̨̲̗̖͎̼̰͈̜͔̺̥̞̪͚̱̗̽͝ ̷̢̨̢̛͈͇̻̮̫̝̭̘̗͖̤̈́̃͊͌̇̄̎͘͠ͅP̵̧͖͍̜͈̻͉̖̝̞͈͗̾̎̏̂̅͋̄̓̔̈́̄̽̀̽̉̚L̸̪͙̠̤̤̰̼̀́͛̀͜͝͝͝Ẽ̴̩̹̱͎͙͗Ä̸̢̨͈̯̗̳̟̭͎̜͙͈̞́̂͆́͘S̵̼̪̥̼͖͙̪̱͎̦̥̀̈́͌̂͛̆͜͝Ę̶̛͚̘̹̝̳̉́͑̓͘͠͝ ̵̧̛̦̀̐̂̀̓̑̆̈́̄̃͑́̾̚̚R̴̨̢̢̛̘͚̟͔̰͍͉͎̮̤̫̱̲̣̿̃E̸̬͚̙̦͖̍̍̍̐̓̏̐͛̚̕L̷̠͚̲͇̭̺̰̇͆̑͂̐̾̈́͆̈́͗͊̓̚͝͝Ë̷̹̫̹͔̣͕́̐̋̑̽͑̐̆̐̍́̏̕̕͜͠Ȃ̸̬͗͊͒͠S̷̢̬̙̣̗͙͔̠̮͓̥̣͔̹̖͖̝͂́̂͌̀́͛͗̎̚̕͠E̸̖͉̓͂͛͒̒́̕͜ ̷̰̠̙̓̚͘͝M̵̢̪͍̞̤̲͍̳̯͎̪̬̳̗͈̖̥͛͆͊̐̈́̊͐͆̾̂̀͊̈́͒̌̚̕E̷̡̯̖͖̼̯̠̠̼̭̪͉̿̃͗̈́̄̈̕̕̕͝ ̸̗̔̃̄̉͗͊͗̇̍̍̉̚̚̚͠F̵̖̦͈͂́̓̌͐R̶͙̻͖͙̼̹͔̻̝̩̲̪̦͈͌͒̿̐̂̾̀͐̉̕Ơ̴̝̻̻̣̮̤͕̟̱̥͈̘̍̇̿́̈́͌̊͌̎͒̏͌͌̓̚͝M̵̱͎̙̻̣͔̭͇͓̦̣̳͖̘̟͖͝ ̵͓̬͉̺̱̬͑͗͋̈́̅̎̊́͆̄͗̈́̈́T̷̖̬̋͋̒Ḩ̵̢̧̧̢̛̰̼̼̣͔̳̳͓̘͗̌͗͊͐̄͜I̸̜̥̤̥̲̖͈̳̳͚̽̂̉̓̄̀̓̃͗̈́̎̈́͆́̆̒͜S̸̹͑͋ ̴̡͋͒̇́̏̈́̅̈́̕͠Ç̷̛̦͖̬̳̟͙̆̓̎̊͆̑̽́́͂̿̔̐̎Ų̶͔̟̠͉̰̮̥͖̌͋̽̎̕̚͝R̸̡̢̥̠̦̠̮̻̮͙̘̤͉͔̭̀̉́̀̓̒̆̓͗̀͋͌̏̍̉͘͜͝ͅS̵̝̥͓̝͇͇͇̣̲̯̭̞͑̈́͌̂͊͋Ē̸̢͖̣͊̌͊͝͝D̴͎̠̲͕̜͑̐̓̓̈́̽̚̕̕̚̕͝ ̶̧̭̟͖̬͎͓͎̻̲͇̣͍̂͊͝V̶̡̠̮͖̲̘̻͕̝̮̋̈̓̈̊͑̓̇̕Ȩ̵̼͙͓̙̼̘̰̑̐̈́͂͒̏͂͗̔̍̊͆́̄̕͝͠Ş̸̮͙̙̤͓̯̇̉̓͜͠S̷̡͙͓̥̩͚̲͍̙͇̻̈́̊̀̎́͋͝Ė̷̢̬̥̤̮̮͇̝̝̭̦͍̥̮̣̇̂̑̐̄̀͝ͅͅĹ̶̨̧̨̜͔̙̫̥͚̲̫̯͇̬̮͚̽͋͆́̂̔̋͗̈̆͛̆̿̒̕͠ͅ ̵̨̨̛̭̙̠̰̩̻̗͂͋̽̋̍F̷̨̛̣̳̤͕͔̦͔͖̬̩̤͉̝͇̺̖̈́̽̔̓̎̊̚͝R̶͕̔̇̕͝Ŏ̷̡͕̝̱̳̩̯̫͐̕M̷̯͍̲̉̽̉̐̎̔̓̊̒ ̵̡̢̡̦̥͚̰̱̳̩͛̊̄͌̀̒̑́̃̅́̈́̾̎͠W̶̺̩̫͖͇̉Ḩ̷̨̢̨̝̬̣̰̰̰̒̾͜Ḭ̴̦̮͚͔̀͒̅̃͊̽̎͒͐C̵͉̬̤͋̌H̶̡̠͖͎̘̮̿̊́̓͒́͛̍́͝͝ ̵̢̢̢̯͓̠̳̙̤̲̘̣̬̺͍̔̀͌̿̅͛̑̈́̾̊̈͊̕̕I̸̡͙̣̜͍̮̣̪̘͇̱̘̣͎̅̀̀́͋͂̍͠ ̴̨̛̛͔̩̦͉͕͍̈́́̑̔͑́̋́̀̽̊̽́̋̕S̶̥͔̞͙͌͂͗̌̽̒̊̅̇͝Ư̸̘̮̤͚͖͇͕̟͍̹̭̻̩̲͙̤̄͐̆͌̀̀͌͘͠F̶̢̟̞͚͕̗̌̐̋̒̽̍̈́̉̎̋͆͋F̵͉̎̏͐͛̓̊͑̓̾́̿̇̊̓̓̕͘Ḙ̵͖̬͙̐̒̓̐̆R̷̺̟̣̝̅̈͆̎͛̎̈́̔̆̃̏̒͌̈́͘̚͜͠ ̶̣̲̙̰͓̻̥͚̳͈̯͖͆͛̅͂̓͋̅̐̅͘͘̕̚͝ͅF̵̼͓̱͚̮͚̰͉̤̦̠̃̉̂̓̎̀̾͜Ȓ̸̡̞͙̔̄̂͂̿̂͗̆͆́͌̕̚͝ͅO̵͈̬͚̽́̽͛̇̾͊̈́́̎ͅM̴̰̳͚̙̝̹͉̝̳͍̝̺͙͇̬͛͆̇̈́̾͑̔͠ͅ",
						Font = legacy,
						Size = v443,
						TextColor3 = color335,
						TextStrokeTransparency = 0,
						ZIndex = p134.ZIndex + 10000
					}, 0.2)

					return
				end

				local randomNumber = math.random(1, #t37)
				local v446 = t37[randomNumber]
				local v447 = Enum.Font.Legacy
				local v448 = UDim2.fromOffset(p134.AbsoluteSize.X * 1.5, p134.AbsoluteSize.Y / 3)
				local color336 = Color3.fromRGB(255, 255, 255)

				effectsServiceSpeak(p133, p134, p135, p136, {
					Text = v446,
					Font = v447,
					Size = v448,
					TextColor3 = color336,
					TextStrokeTransparency = 0,
					ZIndex = p134.ZIndex + 10000
				}, 0.5)
			end)
			audioServicePlaySound("toon beep")

			local animationAnimate = animation.Animate
			local v347 = p134.Position
			local v348 = UDim2.fromOffset(0, p134.AbsoluteSize.X / 4)

			animationAnimate(p134, { Position = v347 - v348 }, 0.1, "Out", "Quint")

			local animate = animation.Animate

			v347 = p134.Position
			v348 = UDim2.fromOffset(0, p134.AbsoluteSize.X / 4)
			animate(p134, { Position = v347 + v348 }, 0.15, "In", "Quad")
		end
	},
	NinjaBuff = {
		type = "custom",
		action = function(p138, _, p140, _, _)
			local t38: {[any]: any} = {
				"Jutsu",
				"NinjaSharpen",
				"NinjaEffect1",
				"NinjaEffect2",
				"NinjaEffect3"
			}
			local randomNumber = math.random(1, #t38)

			audioServicePlaySound(t38[randomNumber])

			local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
			local t39: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
			local v359 = UDim2.fromOffset(p140.AbsoluteSize.X, p140.AbsoluteSize.X)

			effectsServiceBreath(p138, p140, p140, {
				Strength = 50,
				Time = 0.15,
				Speed = 0.25,
				Lifetime = 0.225,
				Transparency = 0.2,
				EasingStyle = "Quad",
				Projectile = effectsServiceBreathimagesSmog,
				Color = t39,
				Size = v359
			})
		end
	},
	NinjaDeath = {
		type = "custom",
		action = function(p143, p144, _, _, _)
			local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
			local t40: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
			local v367 = UDim2.fromOffset(p144.AbsoluteSize.X, p144.AbsoluteSize.X)
			local t41: {[any]: any} = {
				Strength = 50,
				Time = 0.175,
				Speed = 0.25,
				Lifetime = 0.225,
				Transparency = 0.5,
				EasingStyle = "Quad",
				Projectile = effectsServiceBreathimagesSmog,
				Color = t40,
				Size = v367
			}

			spawn(function()
				audioServicePlaySound("NinjaPoof")
				effectsService.Shake(p144, p144.Position, 0.2, 0.05)
				effectsServiceBreath(p143, p144, p144, t41)
			end)
		end
	},
	CrowdsFavour = {
		type = "custom",
		action = function(_, _, _, _, _)
			audioServicePlaySound("Cheering")
			task.wait(0.2)

			local t42: {[any]: any} = { "Applause", "CrowdCheer" }
			local randomNumber = math.random(1, #t42)

			audioServicePlaySound(t42[randomNumber])
		end
	},
	PixieBuff = {
		type = "custom",
		action = function(p153, _, p155, _, _)
			local t43: {[any]: any} = { "PixieMagic", "PixieDust", "PixieBuff", "PixieBuff2" }
			local randomNumber = math.random(1, #t43)

			audioServicePlaySound(t43[randomNumber])

			local v383 = UDim2.fromOffset(p155.AbsoluteSize.X, p155.AbsoluteSize.X)

			effectsServiceBreath(p153, p155, p155, {
				Projectile = "rbxassetid://13895587959",
				Strength = 40,
				Time = 0.175,
				Speed = 0.35,
				Lifetime = 0.225,
				Transparency = 0.5,
				EasingStyle = "Quad",
				Size = v383
			})
		end
	},
	PixieCall = {
		type = "custom",
		action = function(p158, p159, _, _, _)
			task.spawn(function()
				local t50: {[any]: any} = { "PixieLaugh", "PixieLaugh2", "PixieMagic", "PixieDust" }
				local randomNumber = math.random(1, #t50)

				audioServicePlaySound(t50[randomNumber])
				effectsService.Shake(p159, p159.Position, 0.15, 0.05)

				local v452 = UDim2.fromOffset(p159.AbsoluteSize.X, p159.AbsoluteSize.X)

				effectsServiceBreath(p158, p159, p159, {
					Projectile = "rbxassetid://13895587959",
					Strength = 30,
					Time = 0.175,
					Speed = 0.35,
					Lifetime = 0.225,
					Transparency = 0.5,
					EasingStyle = "Quad",
					Size = v452
				})
			end)
		end
	},
	PixieDeath = {
		type = "custom",
		action = function(p163, p164, _, _, _)
			local t44: {[any]: any} = {
				Projectile = "rbxassetid://13895587959",
				Strength = 20,
				Time = 0.175,
				Speed = 0.35,
				Lifetime = 0.225,
				Transparency = 0.5,
				EasingStyle = "Quad",
				Size = UDim2.fromOffset(p164.AbsoluteSize.X, p164.AbsoluteSize.X)
			}

			if math.random(1, 2) == 1 then
				t44.Color = { Color3.fromRGB(240, 120, 0), Color3.fromRGB(255, 204, 1) }
				spawn(function()
					audioServicePlaySound("Ouch")
				end)
			else
				t44.Color = { Color3.fromRGB(240, 0, 156), Color3.fromRGB(168, 0, 0) }
				spawn(function()
					audioServicePlaySound("PixieMagic")
				end)
			end

			spawn(function()
				effectsService.Shake(p164, p164.Position, 0.2, 0.05)
				effectsServiceBreath(p163, p164, p164, t44)
			end)
		end
	},
	AirHornTaunt = {
		type = "custom",
		action = function(p168, _, _, _, _)
			task.spawn(function()
				audioService.PlaySound("AirHorn")
				effectsService.ShakeBattle(p168, 0.1, 0.025)
				p168.Parent.BattleNew.Position = uDim2New(0.5, 0, 0.5, 0)
			end)
		end
	}
}

local module: {[any]: any} = {
	TriggerSoundEffect = function(p173, p174, p175, p176, p177, p178)
		local v406 = t1[p173]

		if not v406 then
		elseif v406.type == "sound" then
			audioServicePlaySound(v406.sound)
		elseif v406.type == "shake" then
			PlaySoundWithOptionalShake(v406.sounds, p175, v406.duration, v406.magnitude)
		elseif v406.type == "random" then
			local sounds = v406.sounds
			local randomNumber = math.random(1, #sounds)

			audioServicePlaySound(sounds[randomNumber])
		elseif v406.type == "custom" and v406.action then
			v406.action(p174, p175, p176, p177, p178)
		end
	end
}

for k, _ in pairs(t1) do
	module[k] = function(p179, p180, p181, p182, p183)
		module.TriggerSoundEffect(k, p179, p180, p181, p182, p183)
	end
end

return module
