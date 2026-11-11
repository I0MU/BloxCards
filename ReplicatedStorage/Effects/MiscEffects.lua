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
local effectsServiceBreathAllyHand = effectsService.BreathAllyHand
local effectsServiceBreathEnemyHand = effectsService.BreathEnemyHand
local effectsServiceBreathEnemyBaseplate = effectsService.BreathEnemyBaseplate
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
local runService: RunService = game:GetService("RunService")

game:GetService("TweenService")
require(game.ReplicatedStorage.CopyTable)

local uDim2New = UDim2.new
local vector2New = Vector2.new
local mathRandom = math.random
local v48 = math.random

local function GetWeightedRandom(p2)
	return (v48() - 0.5) * p2
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs

local function ApplyValues(p3, p4)
	for k, v in pairs(p4) do
		p3[k] = v
	end
end

ApplyValues = function(p5, p6)
	if p6 then
		local vector3 = Vector3.new(p5.AbsolutePosition.X + p6.X.Offset + p5.AbsoluteSize.X / 2, p5.AbsolutePosition.Y + p6.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p5.AbsolutePosition.X + p5.AbsoluteSize.X / 2, p5.AbsolutePosition.Y, 0)

	return vector3
end

local function Angle(p7, p8)
	return (math.atan2(p8.Y - p7.Y, p8.X - p7.X))
end
local function Lerp(p9, p10, p11)
	return p9 * (1 - p11) + p10 * p11
end

Lerp = function(p12, p13)
	if p13 == 0 then
		return p12.Keypoints[1].Value
	end

	if p13 == 1 then
		return p12.Keypoints[#p12.Keypoints].Value
	end

	for i = 1, #p12.Keypoints - 1 do
		local v118 = p12.Keypoints[i]
		local v119 = p12.Keypoints[i + 1]

		if p13 >= v118.Time and p13 < v119.Time then
			local n1 = (p13 - v118.Time) / (v119.Time - v118.Time)

			return Color3.new((v119.Value.R - v118.Value.R) * n1 + v118.Value.R, (v119.Value.G - v118.Value.G) * n1 + v118.Value.G, (v119.Value.B - v118.Value.B) * n1 + v118.Value.B)
		end
	end
end
Lerp = function(p14)
	local y = p14.AbsolutePosition.Y
	local n1 = p14.AbsolutePosition.Y + p14.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p14.AbsolutePosition.X, p14.AbsolutePosition.X + p14.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end

local t1: {[any]: any} = {
	"rbxassetid://12135944951",
	"rbxassetid://12124921013",
	"rbxassetid://10271102675",
	"rbxassetid://12122824593",
	"rbxassetid://14277254485",
	"rbxassetid://12124920496",
	"rbxassetid://10270776441",
	"rbxassetid://12124921348",
	"rbxassetid://12769450394",
	"rbxassetid://12192607589",
	"rbxassetid://12867744581",
	"rbxassetid://12168475256"
}

local function CenterPos(p15)
	local uDim2 = UDim2.new(0, p15.AbsolutePosition.X, 0, p15.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p15.AbsoluteSize.X * 0.5, 0, p15.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function returnField(p16)
	if p16 == "" then
		return "", "Enemy"
	end

	if p16 == "Enemy" then
		return "Enemy", ""
	end
end

local color3 = Color3.fromRGB(255, 0, 0)
local color32 = Color3.fromRGB(0, 255, 0)
local color33 = Color3.fromRGB(0, 0, 255)
local t2: {[any]: any} = { color3, color32, color33, Color3.fromRGB(255, 255, 0) }

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

local function EatFood(p26, _, p28, _, p30, p31)
	effectsServicePreloadTech(p26, p30)

	local t4: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t5 = { "Nom", "Om Nom Nom", "eat" }
	local v149 = UDim2.fromOffset(p28.AbsoluteSize.X * 0.6, p28.AbsoluteSize.Y * 0.6)
	local uDim2 = UDim2.new(0, p28.AbsolutePosition.X, 0, p28.AbsolutePosition.Y)
	local uDim23 = UDim2.new(0, p28.AbsoluteSize.X * 0.5, 0, p28.AbsoluteSize.Y * 0.5)
	local v152 = UDim2.fromOffset(0, p28.AbsoluteSize.Y * 0.3)
	local v153 = effectsServiceNewerCircle(p26, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v149,
		Position = uDim2 + uDim23 - v152
	})
	local v154 = UDim2.fromOffset(p28.AbsoluteSize.X * 1.2, p28.AbsoluteSize.X * 1.2)
	local uDim24 = UDim2.new(0, p28.AbsolutePosition.X, 0, p28.AbsolutePosition.Y)
	local uDim25 = UDim2.new(0, p28.AbsoluteSize.X * 0.5, 0, p28.AbsoluteSize.Y * 0.5)
	local v157 = UDim2.fromOffset(0, p28.AbsoluteSize.Y * 0.16)
	local n1 = p28.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v160 = effectsServiceNewerCircle(p26, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v154,
		Position = uDim24 + uDim25 - v157,
		Image = p30,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2849 = UDim2.fromOffset(p28.AbsoluteSize.X / 8, p28.AbsoluteSize.X / 8)

		effectsServiceBreath(p26, v160, v153, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p31,
			Size = v2849
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2851 = UDim2.fromOffset(p28.AbsoluteSize.X * 0.1, p28.AbsoluteSize.X * 0.1)

		animationAnimate(v160, { Size = v2851 }, 1.1, "In", "Quad")
		v160:Destroy()
	end)

	local randomNumber2 = math.random(1, #t4)

	audioServicePlaySound(t4[randomNumber2])
	task.wait(0.3)

	local randomNumber3 = math.random(1, #t5)

	audioServicePlaySound(t5[randomNumber3])
	t5 = p28.Position

	for _ = 1, 3 do
		local v164 = p28.Position
		local v165 = UDim2.fromOffset(0, p28.AbsoluteSize.Y / 12)

		p28.Position = v164 - v165
		animation.Animate(p28, { Position = t5 }, 0.2, "Out", "Quint")
	end
end
local function EatFoodAlly(p32, p33, _, p35, p36: {[any]: any})
	if typeof(p36) == "string" then
		p36 = { p36 }
	end

	effectsServicePreloadTech(p32, p36)

	local s1

	if p35 == "" then
		s1 = ""
	elseif p35 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p33.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				local v3067 = UDim2.fromOffset(v.AbsoluteSize.X * 0.6, v.AbsoluteSize.Y * 0.6)
				local v3068 = v
				local uDim2 = UDim2.new(0, v3068.AbsolutePosition.X, 0, v3068.AbsolutePosition.Y)
				local uDim26 = UDim2.new(0, v3068.AbsoluteSize.X * 0.5, 0, v3068.AbsoluteSize.Y * 0.5)

				v3068 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
				effectsServiceNewerCircle(p32, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Size = v3067,
					Position = uDim2 + uDim26 - v3068
				})

				local v3071: {[any]: any} = p36
				local randomNumber = math.random(1, #p36)
				local v3073 = v3071[randomNumber]
				local v3074 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
				local v3075 = v
				local uDim27 = UDim2.new(0, v3075.AbsolutePosition.X, 0, v3075.AbsolutePosition.Y)
				local uDim28 = UDim2.new(0, v3075.AbsoluteSize.X * 0.5, 0, v3075.AbsoluteSize.Y * 0.5)

				v3075 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

				local n1 = v.ZIndex + 1000
				local randomNumber4 = math.random(-20, 20)
				local v3080 = effectsServiceNewerCircle(p32, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v3074,
					Position = uDim27 + uDim28 - v3075,
					Image = v3073,
					ZIndex = n1,
					Rotation = randomNumber4
				})

				task.spawn(function()
					local animationAnimate = animation.Animate
					local v3182 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

					animationAnimate(v3080, { Size = v3182 }, 1.1, "In", "Quad")
					v3080:Destroy()
				end)
				v3073 = v.Position

				for _ = 1, 3 do
					local vPosition = v.Position
					local v3083 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 12)

					v.Position = vPosition - v3083
					animation.Animate(v, { Position = v3073 }, 0.2, "Out", "Quint")
				end
			end)
		end
	end)
end
local function EatFoodEnemy(p37, p38, _, p40, p41: {[any]: any})
	if typeof(p41) == "string" then
		p41 = { p41 }
	end

	effectsServicePreloadTech(p37, p41)

	local s1

	if p40 == "" then
		s1 = "Enemy"
	elseif p40 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p38.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				local v3084 = UDim2.fromOffset(v.AbsoluteSize.X * 0.6, v.AbsoluteSize.Y * 0.6)
				local v3085 = v
				local uDim2 = UDim2.new(0, v3085.AbsolutePosition.X, 0, v3085.AbsolutePosition.Y)
				local uDim29 = UDim2.new(0, v3085.AbsoluteSize.X * 0.5, 0, v3085.AbsoluteSize.Y * 0.5)

				v3085 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
				effectsServiceNewerCircle(p37, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Size = v3084,
					Position = uDim2 + uDim29 - v3085
				})

				local v3088: {[any]: any} = p41
				local randomNumber = math.random(1, #p41)
				local v3090 = v3088[randomNumber]
				local v3091 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
				local v3092 = v
				local uDim210 = UDim2.new(0, v3092.AbsolutePosition.X, 0, v3092.AbsolutePosition.Y)
				local uDim211 = UDim2.new(0, v3092.AbsoluteSize.X * 0.5, 0, v3092.AbsoluteSize.Y * 0.5)

				v3092 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

				local n1 = v.ZIndex + 1000
				local randomNumber5 = math.random(-20, 20)
				local v3097 = effectsServiceNewerCircle(p37, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v3091,
					Position = uDim210 + uDim211 - v3092,
					Image = v3090,
					ZIndex = n1,
					Rotation = randomNumber5
				})

				task.spawn(function()
					local animationAnimate = animation.Animate
					local v3184 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

					animationAnimate(v3097, { Size = v3184 }, 1.1, "In", "Quad")
					v3097:Destroy()
				end)
				v3090 = v.Position

				for _ = 1, 3 do
					local vPosition = v.Position
					local v3100 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 12)

					v.Position = vPosition - v3100
					animation.Animate(v, { Position = v3090 }, 0.2, "Out", "Quint")
				end
			end)
		end
	end)
end
local function FoodBuff(p42, p43, _, _, p46, p47)
	effectsServicePreloadTech(p42, p46)

	local t6: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t7 = { "Nom", "Om Nom Nom", "eat" }
	local v188 = UDim2.fromOffset(p43.AbsoluteSize.X * 0.6, p43.AbsoluteSize.Y * 0.6)
	local uDim2 = UDim2.new(0, p43.AbsolutePosition.X, 0, p43.AbsolutePosition.Y)
	local uDim212 = UDim2.new(0, p43.AbsoluteSize.X * 0.5, 0, p43.AbsoluteSize.Y * 0.5)
	local v191 = UDim2.fromOffset(0, p43.AbsoluteSize.Y * 0.3)
	local v192 = effectsServiceNewerCircle(p42, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v188,
		Position = uDim2 + uDim212 - v191
	})
	local v193 = UDim2.fromOffset(p43.AbsoluteSize.X * 1.2, p43.AbsoluteSize.X * 1.2)
	local uDim213 = UDim2.new(0, p43.AbsolutePosition.X, 0, p43.AbsolutePosition.Y)
	local uDim214 = UDim2.new(0, p43.AbsoluteSize.X * 0.5, 0, p43.AbsoluteSize.Y * 0.5)
	local v196 = UDim2.fromOffset(0, p43.AbsoluteSize.Y * 0.16)
	local n1 = p43.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v199 = effectsServiceNewerCircle(p42, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v193,
		Position = uDim213 + uDim214 - v196,
		Image = p46,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2856 = UDim2.fromOffset(p43.AbsoluteSize.X / 8, p43.AbsoluteSize.X / 8)

		effectsServiceBreath(p42, v199, v192, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p47,
			Size = v2856
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2858 = UDim2.fromOffset(p43.AbsoluteSize.X * 0.1, p43.AbsoluteSize.X * 0.1)

		animationAnimate(v199, { Size = v2858 }, 1.1, "In", "Quad")
		v199:Destroy()
	end)

	local randomNumber6 = math.random(1, #t6)

	audioServicePlaySound(t6[randomNumber6])
	task.wait(0.3)

	local randomNumber7 = math.random(1, #t7)

	audioServicePlaySound(t7[randomNumber7])
	t7 = p43.Position

	for _ = 1, 3 do
		local v203 = p43.Position
		local v204 = UDim2.fromOffset(0, p43.AbsoluteSize.Y / 12)

		p43.Position = v203 - v204
		animation.Animate(p43, { Position = t7 }, 0.2, "Out", "Quint")
	end
end
local function Beverage(p48, _, p50, _, p52, p53)
	effectsServicePreloadTech(p48, p52)

	local v211 = UDim2.fromOffset(p50.AbsoluteSize.X * 0.5, p50.AbsoluteSize.Y * 0.5)
	local uDim2 = UDim2.new(0, p50.AbsolutePosition.X, 0, p50.AbsolutePosition.Y)
	local uDim215 = UDim2.new(0, p50.AbsoluteSize.X * 0.5, 0, p50.AbsoluteSize.Y * 0.5)
	local v214 = UDim2.fromOffset(0, p50.AbsoluteSize.Y * 0.3)
	local v215 = effectsServiceNewerCircle(p48, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v211,
		Position = uDim2 + uDim215 - v214
	})
	local v216 = UDim2.fromOffset(p50.AbsoluteSize.X * 1.2, p50.AbsoluteSize.X * 1.2)
	local uDim216 = UDim2.new(0, p50.AbsolutePosition.X, 0, p50.AbsolutePosition.Y)
	local uDim217 = UDim2.new(0, p50.AbsoluteSize.X * 0.5, 0, p50.AbsoluteSize.Y * 0.5)
	local v219 = UDim2.fromOffset(0, p50.AbsoluteSize.Y * 0.16)
	local n1 = p50.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v222 = effectsServiceNewerCircle(p48, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v216,
		Position = uDim216 + uDim217 - v219,
		Image = p52,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2859 = UDim2.fromOffset(p50.AbsoluteSize.X / 9, p50.AbsoluteSize.X / 9)

		effectsServiceBreath(p48, v222, v215, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p53,
			Size = v2859
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2861 = UDim2.fromOffset(p50.AbsoluteSize.X * 0.1, p50.AbsoluteSize.X * 0.1)

		animationAnimate(v222, { Size = v2861 }, 1.1, "In", "Quad")
		v222:Destroy()
	end)

	local v223 = p50.Position

	for _ = 1, 3 do
		local v225 = p50.Position
		local v226 = UDim2.fromOffset(0, p50.AbsoluteSize.Y / 24)

		p50.Position = v225 - v226
		animation.Animate(p50, { Position = v223 }, 0.2, "In", "Quint")
	end
end
local function BloxyBubble(p54, _, p56, _, p58, p59)
	effectsServicePreloadTech(p54, p58)

	local v233 = UDim2.fromOffset(p56.AbsoluteSize.X * 0.5, p56.AbsoluteSize.Y * 0.5)
	local uDim2 = UDim2.new(0, p56.AbsolutePosition.X, 0, p56.AbsolutePosition.Y)
	local uDim218 = UDim2.new(0, p56.AbsoluteSize.X * 0.5, 0, p56.AbsoluteSize.Y * 0.5)
	local v236 = UDim2.fromOffset(0, p56.AbsoluteSize.Y * 0.3)
	local v237 = effectsServiceNewerCircle(p54, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v233,
		Position = uDim2 + uDim218 - v236
	})
	local v238 = UDim2.fromOffset(p56.AbsoluteSize.X * 1.2, p56.AbsoluteSize.X * 1.2)
	local uDim219 = UDim2.new(0, p56.AbsolutePosition.X, 0, p56.AbsolutePosition.Y)
	local uDim220 = UDim2.new(0, p56.AbsoluteSize.X * 0.5, 0, p56.AbsoluteSize.Y * 0.5)
	local v241 = UDim2.fromOffset(0, p56.AbsoluteSize.Y * 0.16)
	local n1 = p56.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v244 = effectsServiceNewerCircle(p54, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v238,
		Position = uDim219 + uDim220 - v241,
		Image = p58,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2862 = UDim2.fromOffset(p56.AbsoluteSize.X / 7, p56.AbsoluteSize.X / 7)

		effectsServiceBreath(p54, v244, v237, {
			Projectile = "rbxassetid://1249690853",
			Strength = 50,
			Time = 0.75,
			Color = p59,
			Size = v2862
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2864 = UDim2.fromOffset(p56.AbsoluteSize.X * 0.1, p56.AbsoluteSize.X * 0.1)

		animationAnimate(v244, { Size = v2864 }, 1.1, "In", "Quad")
		v244:Destroy()
	end)

	local v245 = p56.Position

	for _ = 1, 3 do
		local v247 = p56.Position
		local v248 = UDim2.fromOffset(0, p56.AbsoluteSize.Y / 24)

		p56.Position = v247 - v248
		animation.Animate(p56, { Position = v245 }, 0.2, "In", "Quint")
	end
end
local function BloxyBubbleBuff(p60, p61, _, _, p64, p65)
	effectsServicePreloadTech(p60, p64)

	local v255 = UDim2.fromOffset(p61.AbsoluteSize.X * 0.5, p61.AbsoluteSize.Y * 0.5)
	local uDim2 = UDim2.new(0, p61.AbsolutePosition.X, 0, p61.AbsolutePosition.Y)
	local uDim221 = UDim2.new(0, p61.AbsoluteSize.X * 0.5, 0, p61.AbsoluteSize.Y * 0.5)
	local v258 = UDim2.fromOffset(0, p61.AbsoluteSize.Y * 0.3)
	local v259 = effectsServiceNewerCircle(p60, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v255,
		Position = uDim2 + uDim221 - v258
	})
	local v260 = UDim2.fromOffset(p61.AbsoluteSize.X * 1.2, p61.AbsoluteSize.X * 1.2)
	local uDim222 = UDim2.new(0, p61.AbsolutePosition.X, 0, p61.AbsolutePosition.Y)
	local uDim223 = UDim2.new(0, p61.AbsoluteSize.X * 0.5, 0, p61.AbsoluteSize.Y * 0.5)
	local v263 = UDim2.fromOffset(0, p61.AbsoluteSize.Y * 0.16)
	local n1 = p61.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v266 = effectsServiceNewerCircle(p60, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Size = v260,
		Position = uDim222 + uDim223 - v263,
		Image = p64,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2865 = UDim2.fromOffset(p61.AbsoluteSize.X / 7, p61.AbsoluteSize.X / 7)

		effectsServiceBreath(p60, v266, v259, {
			Projectile = "rbxassetid://1249690853",
			Strength = 50,
			Time = 0.75,
			Color = p65,
			Size = v2865
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2867 = UDim2.fromOffset(p61.AbsoluteSize.X * 0.1, p61.AbsoluteSize.X * 0.1)

		animationAnimate(v266, { Size = v2867 }, 1.1, "In", "Quad")
		v266:Destroy()
	end)

	local v267 = p61.Position

	for _ = 1, 3 do
		local v269 = p61.Position
		local v270 = UDim2.fromOffset(0, p61.AbsoluteSize.Y / 24)

		p61.Position = v269 - v270
		animation.Animate(p61, { Position = v267 }, 0.2, "In", "Quint")
	end
end
local function BloxyBubbleAlly(p66, p67, _, p69, p70, _)
	effectsServicePreloadTech(p66, p70)

	local s1

	if p69 == "" then
		s1 = ""
	elseif p69 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p67.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				local v3101 = UDim2.fromOffset(v.AbsoluteSize.X * 0.5, v.AbsoluteSize.Y * 0.5)
				local v3102 = v
				local uDim2 = UDim2.new(0, v3102.AbsolutePosition.X, 0, v3102.AbsolutePosition.Y)
				local uDim224 = UDim2.new(0, v3102.AbsoluteSize.X * 0.5, 0, v3102.AbsoluteSize.Y * 0.5)

				v3102 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
				effectsServiceNewerCircle(p66, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Size = v3101,
					Position = uDim2 + uDim224 - v3102
				})
				v3101 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
				v3102 = v

				local uDim225 = UDim2.new(0, v3102.AbsolutePosition.X, 0, v3102.AbsolutePosition.Y)
				local uDim226 = UDim2.new(0, v3102.AbsoluteSize.X * 0.5, 0, v3102.AbsoluteSize.Y * 0.5)

				v3102 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

				local n1 = v.ZIndex + 1000
				local randomNumber = math.random(-20, 20)
				local v3109 = effectsServiceNewerCircle(p66, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v3101,
					Position = uDim225 + uDim226 - v3102,
					Image = p70,
					ZIndex = n1,
					Rotation = randomNumber
				})

				task.spawn(function()
					local animationAnimate = animation.Animate
					local v3186 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

					animationAnimate(v3109, { Size = v3186 }, 1.1, "In", "Quad")
					v3109:Destroy()
				end)

				local vPosition = v.Position

				for _ = 1, 3 do
					local vPosition2 = v.Position
					local v3113 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 24)

					v.Position = vPosition2 - v3113
					animation.Animate(v, { Position = vPosition }, 0.2, "In", "Quint")
				end
			end)
		end
	end)
end
local function BloxyBubbleEnemy(p72, p73, _, p75, p76, _)
	effectsServicePreloadTech(p72, p76)

	local s1

	if p75 == "" then
		s1 = "Enemy"
	elseif p75 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p73.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				local v3114 = UDim2.fromOffset(v.AbsoluteSize.X * 0.5, v.AbsoluteSize.Y * 0.5)
				local v3115 = v
				local uDim2 = UDim2.new(0, v3115.AbsolutePosition.X, 0, v3115.AbsolutePosition.Y)
				local uDim227 = UDim2.new(0, v3115.AbsoluteSize.X * 0.5, 0, v3115.AbsoluteSize.Y * 0.5)

				v3115 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
				effectsServiceNewerCircle(p72, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Size = v3114,
					Position = uDim2 + uDim227 - v3115
				})
				v3114 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
				v3115 = v

				local uDim228 = UDim2.new(0, v3115.AbsolutePosition.X, 0, v3115.AbsolutePosition.Y)
				local uDim229 = UDim2.new(0, v3115.AbsoluteSize.X * 0.5, 0, v3115.AbsoluteSize.Y * 0.5)

				v3115 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

				local n1 = v.ZIndex + 1000
				local randomNumber = math.random(-20, 20)
				local v3122 = effectsServiceNewerCircle(p72, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v3114,
					Position = uDim228 + uDim229 - v3115,
					Image = p76,
					ZIndex = n1,
					Rotation = randomNumber
				})

				task.spawn(function()
					local animationAnimate = animation.Animate
					local v3188 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

					animationAnimate(v3122, { Size = v3188 }, 1.1, "In", "Quad")
					v3122:Destroy()
				end)

				local vPosition = v.Position

				for _ = 1, 3 do
					local vPosition3 = v.Position
					local v3126 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 24)

					v.Position = vPosition3 - v3126
					animation.Animate(v, { Position = vPosition }, 0.2, "In", "Quint")
				end
			end)
		end
	end)
end
local function MusicBuff(p78, p79, _, _, p82, p83)
	local t8 = { "MidSaxophone", "LowSaxophone", "HighSaxophone", "meow" }
	local v294 = UDim2.fromOffset(p79.AbsoluteSize.X * 0.6, p79.AbsoluteSize.Y * 0.6)
	local uDim2 = UDim2.new(0, p79.AbsolutePosition.X, 0, p79.AbsolutePosition.Y)
	local uDim230 = UDim2.new(0, p79.AbsoluteSize.X * 0.5, 0, p79.AbsoluteSize.Y * 0.5)
	local v297 = UDim2.fromOffset(0, p79.AbsoluteSize.Y * 0.3)
	local v298 = effectsServiceNewerCircle(p78, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v294,
		Position = uDim2 + uDim230 - v297
	})

	task.spawn(function()
		local v2872 = UDim2.fromOffset(p79.AbsoluteSize.X / 3, p79.AbsoluteSize.X / 3)

		effectsServiceBreath(p78, p79, v298, {
			Strength = 20,
			Time = 0.5,
			Projectile = p82,
			Color = p83,
			Size = v2872
		})
	end)

	local randomNumber = math.random(1, #t8)

	audioServicePlaySound(t8[randomNumber])
	task.wait(0.3)
	t8 = p79.Position

	for _ = 1, 2 do
		local v301 = p79.Position
		local v302 = UDim2.fromOffset(0, p79.AbsoluteSize.Y / 7)

		p79.Position = v301 - v302
		animation.Animate(p79, { Position = t8 }, 0.2, "Out", "Quint")
	end
end
local function GenerateClock(p283, p284, p285, p286, p287, p288, p289)
	local t9: {[any]: any} = {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = p284,
		Position = p285,
		ImageColor3 = p289 or Color3.fromRGB(255, 255, 255),
		ZIndex = p288
	}
	local v311 = effectsServiceNewerCircle(p283, t9)
	local v312 = effectsServiceNewerCircle(p283, t9)
	local v313 = effectsServiceNewerCircle(p283, t9)
	local v314 = effectsServiceNewerCircle(p283, t9)

	v311.Image = "rbxassetid://10246148107"
	v312.Image = "rbxassetid://10246148107"
	v313.Image = "rbxassetid://10246146190"
	v314.Image = "rbxassetid://10246145502"
	animation.AnimateAsync(v311, { ImageTransparency = 0 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v312, { ImageTransparency = 0 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v313, { ImageTransparency = 0 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v314, { ImageTransparency = 0 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v314, { Rotation = p286 }, p287, "Out", "Quint")
	animation.AnimateAsync(v313, { Rotation = p286 * 12 }, p287, "Out", "Quint")
	task.spawn(function()
		task.wait(p287 - 0.5)
		animation.AnimateAsync(v311, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		animation.AnimateAsync(v312, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		animation.AnimateAsync(v313, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		animation.AnimateAsync(v314, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		task.wait(0.5)
		v311:Destroy()
		v312:Destroy()
		v313:Destroy()
		v314:Destroy()
	end)
end
local function Arrow(p314, p315, p316, _, p318, p319, p320, p321, p322, p323, p324, p325, p326)
	effectsServicePreloadTech(p314, p318)

	if not p319 then
		p319 = Color3.fromRGB(255, 255, 255)
	end

	local v328 = UDim2.fromOffset(p316.AbsoluteSize.X / p322, p316.AbsoluteSize.Y / p323)
	local t10: {[any]: any} = {
		Time = p326,
		Size = v328,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = p318,
		Color = p319
	}

	if p324 then
		for k, _ in pairs(p324) do
			t10[k] = p324[k]
		end
	end

	audioServicePlaySound(p320)

	local v332 = effectsServiceThrow(p314, p315, p316, t10)
	local t11: {[any]: any} = {
		Time = 0.3,
		Color = { p319, p319 },
		Transparency = 0.5
	}

	spawn(function()
		audioServicePlaySound(p321)

		if p325 then
			spawn(function()
				effectsServiceBreathEngulf(unpack(p325))
				wait(0.05)
			end)

			return
		end

		effectsService.Shake(p316, p316.Position, 0.1, 0.1)
		effectsServicePulse(p314, v332, t11)
	end)
	wait(0.1)
	effectsService.Shake(p316, p316.Position, 0.1, 0.1)
	v332:Destroy()
	wait(0.1)
end
function AttackArrow(p327, p328, p329, _, p331, p332, p333, p334, p335, p336, p337)
	effectsServicePreloadTech(p327, p331)

	local v345 = UDim2.fromOffset(p329.AbsoluteSize.X / p335 * p332, p329.AbsoluteSize.Y / p336 * p332)
	local color34 = Color3.fromRGB(255, 255, 255)

	audioServicePlaySound(p333)

	local v347 = effectsServiceThrow(p327, p328, p329, {
		Time = p337,
		Size = v345,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = p331,
		Color = color34
	})
	local t12: {[any]: any} = {
		Time = 0.35,
		Color = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255) },
		Transparency = 0.5
	}

	spawn(function()
		audioServicePlaySound(p334)
		effectsService.Shake(p329, p329.Position, 0.1 * p332, 0.1)
		effectsServicePulse(p327, v347, t12)
	end)
	wait(0.1)
	effectsService.Shake(p329, p329.Position, 0.1 * p332, 0.1)
	v347:Destroy()
	wait(0.1 * p332)
end

local module: {[any]: any} = {
	FireBreathLarge = function(p84, p85, p86, p87)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color35 = Color3.fromRGB(240, 99, 43)
		local color36 = Color3.fromRGB(217, 66, 39)
		local color37 = Color3.fromRGB(240, 191, 65)
		local color38 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p84, p85, p86, p87, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color35, color36, color37, color38, 1.1, 0.9)
	end,
	FireBreath = function(p88, p89, p90, p91)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color39 = Color3.fromRGB(240, 99, 43)
		local color310 = Color3.fromRGB(217, 66, 39)
		local color311 = Color3.fromRGB(240, 191, 65)
		local color312 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p88, p89, p90, p91, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color39, color310, color311, color312, 1.1, 0.9)
	end,
	FireBreathSmall = function(p92, p93, p94, p95)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color313 = Color3.fromRGB(240, 99, 43)
		local color314 = Color3.fromRGB(217, 66, 39)
		local color315 = Color3.fromRGB(240, 191, 65)
		local color316 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p92, p93, p94, p95, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color313, color314, color315, color316, 1.1, 0.9)
	end,
	FireBreathTiny = function(p96, p97, p98, p99)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color317 = Color3.fromRGB(240, 99, 43)
		local color318 = Color3.fromRGB(217, 66, 39)
		local color319 = Color3.fromRGB(240, 191, 65)
		local color320 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p96, p97, p98, p99, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color317, color318, color319, color320, 1.1, 0.9)
	end,
	FlareBreathLarge = function(p100, p101, p102, p103)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color321 = Color3.fromRGB(240, 55, 30)
		local color322 = Color3.fromRGB(166, 28, 26)
		local color323 = Color3.fromRGB(240, 32, 13)
		local color324 = Color3.fromRGB(189, 10, 10)

		effectsServiceBreathAttack(p100, p101, p102, p103, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color321, color322, color323, color324, 1.1, 0.9)
	end,
	FlareBreath = function(p104, p105, p106, p107)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color325 = Color3.fromRGB(240, 55, 30)
		local color326 = Color3.fromRGB(166, 28, 26)
		local color327 = Color3.fromRGB(240, 32, 13)
		local color328 = Color3.fromRGB(189, 10, 10)

		effectsServiceBreathAttack(p104, p105, p106, p107, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color325, color326, color327, color328, 1.1, 0.9)
	end,
	FlareBreathSmall = function(p108, p109, p110, p111)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color329 = Color3.fromRGB(240, 55, 30)
		local color330 = Color3.fromRGB(166, 28, 26)
		local color331 = Color3.fromRGB(240, 32, 13)
		local color332 = Color3.fromRGB(189, 10, 10)

		effectsServiceBreathAttack(p108, p109, p110, p111, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color329, color330, color331, color332, 1.1, 0.9)
	end,
	FlareBreathTiny = function(p112, p113, p114, p115)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color333 = Color3.fromRGB(240, 55, 30)
		local color334 = Color3.fromRGB(166, 28, 26)
		local color335 = Color3.fromRGB(240, 32, 13)
		local color336 = Color3.fromRGB(189, 10, 10)

		effectsServiceBreathAttack(p112, p113, p114, p115, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color333, color334, color335, color336, 1.1, 0.9)
	end,
	FlameBreathLarge = function(p116, p117, p118, p119)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color337 = Color3.fromRGB(24, 174, 204)
		local color338 = Color3.fromRGB(8, 72, 150)
		local color339 = Color3.fromRGB(30, 91, 234)
		local color340 = Color3.fromRGB(4, 18, 171)

		effectsServiceBreathAttack(p116, p117, p118, p119, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color337, color338, color339, color340, 1.1, 0.9)
	end,
	FlameBreath = function(p120, p121, p122, p123)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color341 = Color3.fromRGB(24, 174, 204)
		local color342 = Color3.fromRGB(8, 72, 150)
		local color343 = Color3.fromRGB(30, 91, 234)
		local color344 = Color3.fromRGB(4, 18, 171)

		effectsServiceBreathAttack(p120, p121, p122, p123, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color341, color342, color343, color344, 1.1, 0.9)
	end,
	FlameBreathSmall = function(p124, p125, p126, p127)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color345 = Color3.fromRGB(24, 174, 204)
		local color346 = Color3.fromRGB(8, 72, 150)
		local color347 = Color3.fromRGB(30, 91, 234)
		local color348 = Color3.fromRGB(4, 18, 171)

		effectsServiceBreathAttack(p124, p125, p126, p127, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color345, color346, color347, color348, 1.1, 0.9)
	end,
	FlameBreathTiny = function(p128, p129, p130, p131)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color349 = Color3.fromRGB(24, 174, 204)
		local color350 = Color3.fromRGB(8, 72, 150)
		local color351 = Color3.fromRGB(30, 91, 234)
		local color352 = Color3.fromRGB(4, 18, 171)

		effectsServiceBreathAttack(p128, p129, p130, p131, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color349, color350, color351, color352, 1.1, 0.9)
	end,
	BlazeBreathLarge = function(p132, p133, p134, p135)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color353 = Color3.fromRGB(204, 198, 33)
		local color354 = Color3.fromRGB(220, 189, 15)
		local color355 = Color3.fromRGB(255, 255, 43)
		local color356 = Color3.fromRGB(176, 127, 14)

		effectsServiceBreathAttack(p132, p133, p134, p135, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color353, color354, color355, color356, 1.1, 0.9)
	end,
	BlazeBreath = function(p136, p137, p138, p139)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color357 = Color3.fromRGB(204, 198, 33)
		local color358 = Color3.fromRGB(220, 189, 15)
		local color359 = Color3.fromRGB(255, 255, 43)
		local color360 = Color3.fromRGB(176, 127, 14)

		effectsServiceBreathAttack(p136, p137, p138, p139, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color357, color358, color359, color360, 1.1, 0.9)
	end,
	BlazeBreathSmall = function(p140, p141, p142, p143)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color361 = Color3.fromRGB(204, 198, 33)
		local color362 = Color3.fromRGB(220, 189, 15)
		local color363 = Color3.fromRGB(255, 255, 43)
		local color364 = Color3.fromRGB(176, 127, 14)

		effectsServiceBreathAttack(p140, p141, p142, p143, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color361, color362, color363, color364, 1.1, 0.9)
	end,
	BlazeBreathTiny = function(p144, p145, p146, p147)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color365 = Color3.fromRGB(204, 198, 33)
		local color366 = Color3.fromRGB(220, 189, 15)
		local color367 = Color3.fromRGB(255, 255, 43)
		local color368 = Color3.fromRGB(176, 127, 14)

		effectsServiceBreathAttack(p144, p145, p146, p147, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color365, color366, color367, color368, 1.1, 0.9)
	end,
	ScorchBreathLarge = function(p148, p149, p150, p151)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color369 = Color3.fromRGB(34, 240, 30)
		local color370 = Color3.fromRGB(32, 180, 37)
		local color371 = Color3.fromRGB(56, 184, 97)
		local color372 = Color3.fromRGB(13, 111, 40)

		effectsServiceBreathAttack(p148, p149, p150, p151, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color369, color370, color371, color372, 1.1, 0.9)
	end,
	ScorchBreath = function(p152, p153, p154, p155)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color373 = Color3.fromRGB(34, 240, 30)
		local color374 = Color3.fromRGB(32, 180, 37)
		local color375 = Color3.fromRGB(56, 184, 97)
		local color376 = Color3.fromRGB(13, 111, 40)

		effectsServiceBreathAttack(p152, p153, p154, p155, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color373, color374, color375, color376, 1.1, 0.9)
	end,
	ScorchBreathSmall = function(p156, p157, p158, p159)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color377 = Color3.fromRGB(34, 240, 30)
		local color378 = Color3.fromRGB(32, 180, 37)
		local color379 = Color3.fromRGB(56, 184, 97)
		local color380 = Color3.fromRGB(13, 111, 40)

		effectsServiceBreathAttack(p156, p157, p158, p159, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color377, color378, color379, color380, 1.1, 0.9)
	end,
	ScorchBreathTiny = function(p160, p161, p162, p163)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color381 = Color3.fromRGB(34, 240, 30)
		local color382 = Color3.fromRGB(32, 180, 37)
		local color383 = Color3.fromRGB(56, 184, 97)
		local color384 = Color3.fromRGB(13, 111, 40)

		effectsServiceBreathAttack(p160, p161, p162, p163, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color381, color382, color383, color384, 1.1, 0.9)
	end,
	InfernoBreathLarge = function(p164, p165, p166, p167)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color385 = Color3.fromRGB(163, 35, 206)
		local color386 = Color3.fromRGB(144, 0, 180)
		local color387 = Color3.fromRGB(240, 80, 224)
		local color388 = Color3.fromRGB(126, 19, 122)

		effectsServiceBreathAttack(p164, p165, p166, p167, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color385, color386, color387, color388, 1.1, 0.9)
	end,
	InfernoBreath = function(p168, p169, p170, p171)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color389 = Color3.fromRGB(163, 35, 206)
		local color390 = Color3.fromRGB(144, 0, 180)
		local color391 = Color3.fromRGB(240, 80, 224)
		local color392 = Color3.fromRGB(126, 19, 122)

		effectsServiceBreathAttack(p168, p169, p170, p171, 125, effectsServiceBreathimagesFire, "FireBreath", 0.85, color389, color390, color391, color392, 1.1, 0.9)
	end,
	InfernoBreathSmall = function(p172, p173, p174, p175)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color393 = Color3.fromRGB(163, 35, 206)
		local color394 = Color3.fromRGB(144, 0, 180)
		local color395 = Color3.fromRGB(240, 80, 224)
		local color396 = Color3.fromRGB(126, 19, 122)

		effectsServiceBreathAttack(p172, p173, p174, p175, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color393, color394, color395, color396, 1.1, 0.9)
	end,
	InfernoBreathTiny = function(p176, p177, p178, p179)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color397 = Color3.fromRGB(163, 35, 206)
		local color398 = Color3.fromRGB(144, 0, 180)
		local color399 = Color3.fromRGB(240, 80, 224)
		local color3100 = Color3.fromRGB(126, 19, 122)

		effectsServiceBreathAttack(p176, p177, p178, p179, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color397, color398, color399, color3100, 1.1, 0.9)
	end,
	IceBreathLarge = function(p180, p181, p182, p183)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3101 = Color3.fromRGB(167, 255, 245)
		local color3102 = Color3.fromRGB(125, 199, 255)
		local color3103 = Color3.fromRGB(161, 199, 240)
		local color3104 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p180, p181, p182, p183, 150, effectsServiceBreathimagesIce, "IceBreath", 1, color3101, color3102, color3103, color3104, 1.1, 0.9)
	end,
	IceBreath = function(p184, p185, p186, p187)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3105 = Color3.fromRGB(167, 255, 245)
		local color3106 = Color3.fromRGB(125, 199, 255)
		local color3107 = Color3.fromRGB(161, 199, 240)
		local color3108 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p184, p185, p186, p187, 125, effectsServiceBreathimagesIce, "IceBreath", 0.85, color3105, color3106, color3107, color3108, 1.1, 0.9)
	end,
	IceBreathSmall = function(p188, p189, p190, p191)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3109 = Color3.fromRGB(167, 255, 245)
		local color3110 = Color3.fromRGB(125, 199, 255)
		local color3111 = Color3.fromRGB(161, 199, 240)
		local color3112 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p188, p189, p190, p191, 100, effectsServiceBreathimagesIce, "IceBreath", 0.6, color3109, color3110, color3111, color3112, 1.1, 0.9)
	end,
	IceBreathTiny = function(p192, p193, p194, p195)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3113 = Color3.fromRGB(167, 255, 245)
		local color3114 = Color3.fromRGB(125, 199, 255)
		local color3115 = Color3.fromRGB(161, 199, 240)
		local color3116 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p192, p193, p194, p195, 70, effectsServiceBreathimagesIce, "IceBreath", 0.6, color3113, color3114, color3115, color3116, 1.1, 0.9)
	end,
	IceWeaponEffect = function(p196, p197, p198, p199)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3117 = Color3.fromRGB(167, 255, 245)
		local color3118 = Color3.fromRGB(125, 199, 255)
		local color3119 = Color3.fromRGB(161, 199, 240)
		local color3120 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p196, p197, p198, p199, 110, effectsServiceBreathimagesIce, "IceBreath", 0.7, color3117, color3118, color3119, color3120, 1.1, 0.9)
	end,
	IceWeaponEffectSmall = function(p200, p201, p202, p203)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3121 = Color3.fromRGB(167, 255, 245)
		local color3122 = Color3.fromRGB(125, 199, 255)
		local color3123 = Color3.fromRGB(161, 199, 240)
		local color3124 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathAttack(p200, p201, p202, p203, 100, effectsServiceBreathimagesIce, "IceBreath", 0.4, color3121, color3122, color3123, color3124, 1.1, 0.9)
	end,
	PoisonEffect = function(p204, p205, p206, p207)
		local color3125 = Color3.fromRGB(102, 225, 113)
		local color3126 = Color3.fromRGB(57, 163, 69)
		local color3127 = Color3.fromRGB(48, 135, 48)
		local color3128 = Color3.fromRGB(68, 247, 80)

		effectsServiceBreathAttack(p204, p205, p206, p207, 70, "rbxassetid://1249690853", "Bubbling", 0.7, color3125, color3126, color3127, color3128, 0.7, 0.6)
	end,
	IlluminaEffect = function(p208, p209, p210, p211)
		local color3129 = Color3.fromRGB(255, 85, 255)
		local color3130 = Color3.fromRGB(255, 85, 255)
		local color3131 = Color3.fromRGB(255, 85, 255)
		local color3132 = Color3.fromRGB(255, 85, 255)

		effectsServiceBreathAttack(p208, p209, p210, p211, 70, "rbxassetid://13895587959", "Sparkle", 0.5, color3129, color3130, color3131, color3132, 1, 0.7)
	end,
	IlluminaEffect2 = function(p212, p213, p214, p215)
		local color3133 = Color3.fromRGB(255, 85, 255)
		local color3134 = Color3.fromRGB(255, 85, 255)
		local color3135 = Color3.fromRGB(255, 85, 255)
		local color3136 = Color3.fromRGB(255, 85, 255)

		effectsServiceBreathAttack(p212, p213, p214, p215, 80, "rbxassetid://13895587959", "Sparkle", 0.5, color3133, color3134, color3135, color3136, 0.9, 0.6)
	end,
	BubbleBreath = function(p216, p217, p218, p219)
		local color3137 = Color3.fromRGB(105, 204, 240)
		local color3138 = Color3.fromRGB(137, 234, 253)
		local color3139 = Color3.fromRGB(139, 178, 202)
		local color3140 = Color3.fromRGB(51, 138, 188)

		effectsServiceBreathAttack(p216, p217, p218, p219, 100, "rbxassetid://1249690853", "BubbleBeam", 0.85, color3137, color3138, color3139, color3140, 0.7, 0.6)
	end,
	FartBreath = function(p220, p221, p222, p223)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3141 = Color3.fromRGB(240, 99, 43)
		local color3142 = Color3.fromRGB(217, 66, 39)
		local color3143 = Color3.fromRGB(240, 191, 65)

		effectsServiceBreathAttack(p220, p221, p222, p223, 100, effectsServiceBreathimagesFire, "BubbleBeam", 0.85, color3141, color3142, color3143, Color3.fromRGB(240, 64, 11))
	end,
	GhostBreathTiny = function(p224, p225, p226, p227)
		local color3144 = Color3.fromRGB(154, 233, 240)
		local color3145 = Color3.fromRGB(168, 210, 217)
		local color3146 = Color3.fromRGB(9, 217, 240)
		local color3147 = Color3.fromRGB(100, 240, 224)

		effectsServiceBreathAttack(p224, p225, p226, p227, 70, "rbxassetid://13335978405", "Spooky", 0.6, color3144, color3145, color3146, color3147, 1.1, 0.9)
	end,
	SelfAcid = function(p228, p229, p230, p231)
		local color3148 = Color3.fromRGB(197, 0, 0)
		local color3149 = Color3.fromRGB(177, 0, 0)
		local color3150 = Color3.fromRGB(211, 9, 2)
		local color3151 = Color3.fromRGB(182, 0, 0)

		effectsServiceBreathSelf(p228, p229, p230, p231, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3148, color3149, color3150, color3151, 0.7, 0.6)
	end,
	SelfSwamp = function(p232, p233, p234, p235)
		local color3152 = Color3.fromRGB(78, 171, 86)
		local color3153 = Color3.fromRGB(46, 131, 56)
		local color3154 = Color3.fromRGB(59, 168, 59)
		local color3155 = Color3.fromRGB(7, 106, 0)

		effectsServiceBreathSelf(p232, p233, p234, p235, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3152, color3153, color3154, color3155, 0.7, 0.6)
	end,
	SelfBubbles = function(p236, p237, p238, p239)
		local color3156 = Color3.fromRGB(105, 204, 240)
		local color3157 = Color3.fromRGB(137, 234, 253)
		local color3158 = Color3.fromRGB(139, 178, 202)
		local color3159 = Color3.fromRGB(51, 138, 188)

		effectsServiceBreathSelf(p236, p237, p238, p239, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3156, color3157, color3158, color3159, 0.7, 0.6)
	end,
	SelfFlush = function(p240, p241, p242, p243)
		if math.random(1, 2) == 1 then
			audioServicePlaySound("WaterSlosh")

			local color3160 = Color3.fromRGB(105, 204, 240)
			local color3161 = Color3.fromRGB(137, 234, 253)
			local color3162 = Color3.fromRGB(139, 178, 202)
			local color3163 = Color3.fromRGB(51, 138, 188)

			effectsServiceBreathSelf(p240, p241, p242, p243, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3160, color3161, color3162, color3163, 0.7, 0.6)

			return
		end

		local color3164 = Color3.fromRGB(105, 204, 240)
		local color3165 = Color3.fromRGB(137, 234, 253)
		local color3166 = Color3.fromRGB(139, 178, 202)
		local color3167 = Color3.fromRGB(51, 138, 188)

		effectsServiceBreathSelf(p240, p241, p242, p243, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3164, color3165, color3166, color3167, 0.7, 0.6)
	end,
	SelfGoo = function(p244, p245, p246, p247)
		local color3168 = Color3.fromRGB(169, 85, 197)
		local color3169 = Color3.fromRGB(125, 72, 182)
		local color3170 = Color3.fromRGB(139, 58, 197)
		local color3171 = Color3.fromRGB(115, 0, 172)

		effectsServiceBreathSelf(p244, p245, p246, p247, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3168, color3169, color3170, color3171, 0.7, 0.6)
	end,
	SelfFire = function(p248, p249, p250, p251)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3172 = Color3.fromRGB(240, 99, 43)
		local color3173 = Color3.fromRGB(217, 66, 39)
		local color3174 = Color3.fromRGB(240, 191, 65)
		local color3175 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathSelf(p248, p249, p250, p251, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3172, color3173, color3174, color3175, 1.1, 0.9)
	end,
	SelfFlare = function(p252, p253, p254, p255)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3176 = Color3.fromRGB(240, 55, 30)
		local color3177 = Color3.fromRGB(166, 28, 26)
		local color3178 = Color3.fromRGB(240, 32, 13)
		local color3179 = Color3.fromRGB(189, 10, 10)

		effectsServiceBreathSelf(p252, p253, p254, p255, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3176, color3177, color3178, color3179, 1.1, 0.9)
	end,
	SelfFlame = function(p256, p257, p258, p259)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3180 = Color3.fromRGB(24, 174, 204)
		local color3181 = Color3.fromRGB(8, 72, 150)
		local color3182 = Color3.fromRGB(30, 91, 234)
		local color3183 = Color3.fromRGB(4, 18, 171)

		effectsServiceBreathSelf(p256, p257, p258, p259, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3180, color3181, color3182, color3183, 1.1, 0.9)
	end,
	SelfBlaze = function(p260, p261, p262, p263)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3184 = Color3.fromRGB(204, 198, 33)
		local color3185 = Color3.fromRGB(220, 189, 15)
		local color3186 = Color3.fromRGB(255, 255, 43)
		local color3187 = Color3.fromRGB(176, 127, 14)

		effectsServiceBreathSelf(p260, p261, p262, p263, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3184, color3185, color3186, color3187, 1.1, 0.9)
	end,
	SelfScorch = function(p264, p265, p266, p267)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3188 = Color3.fromRGB(34, 240, 30)
		local color3189 = Color3.fromRGB(32, 180, 37)
		local color3190 = Color3.fromRGB(56, 184, 97)
		local color3191 = Color3.fromRGB(13, 111, 40)

		effectsServiceBreathSelf(p264, p265, p266, p267, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3188, color3189, color3190, color3191, 1.1, 0.9)
	end,
	SelfInferno = function(p268, p269, p270, p271)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3192 = Color3.fromRGB(163, 35, 206)
		local color3193 = Color3.fromRGB(144, 0, 180)
		local color3194 = Color3.fromRGB(240, 80, 224)
		local color3195 = Color3.fromRGB(126, 19, 122)

		effectsServiceBreathSelf(p268, p269, p270, p271, 125, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3192, color3193, color3194, color3195, 1.1, 0.9)
	end,
	SelfIce = function(p272, p273, p274, p275)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3196 = Color3.fromRGB(167, 255, 245)
		local color3197 = Color3.fromRGB(125, 199, 255)
		local color3198 = Color3.fromRGB(161, 199, 240)
		local color3199 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathSelf(p272, p273, p274, p275, 125, effectsServiceBreathimagesIce, "IceBreath", 0.5, color3196, color3197, color3198, color3199, 1.1, 0.9)
	end,
	SelfIceSmall = function(p276, p277, p278, p279)
		local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
		local color3200 = Color3.fromRGB(167, 255, 245)
		local color3201 = Color3.fromRGB(125, 199, 255)
		local color3202 = Color3.fromRGB(161, 199, 240)
		local color3203 = Color3.fromRGB(108, 197, 239)

		effectsServiceBreathSelf(p276, p277, p278, p279, 70, effectsServiceBreathimagesIce, "IceBreath", 0.4, color3200, color3201, color3202, color3203, 1.1, 0.9)
	end,
	NekoBot = function(p280, _, p282)
		local t13: {[any]: any} = { "rbxassetid://5089147697", "rbxassetid://5092736874" }
		local v787 = t13[1]
		local n1 = p282.ZIndex + 10000
		local uDim2 = UDim2.new(0, p282.AbsoluteSize.X * 1.5, 0, p282.AbsoluteSize.X * 1.5)
		local uDim231 = UDim2.new(0, p282.AbsolutePosition.X, 0, p282.AbsolutePosition.Y)
		local uDim232 = UDim2.new(0, p282.AbsoluteSize.X * 0.5, 0, p282.AbsoluteSize.Y * 0.5)
		local v792 = effectsServiceNewerCircle(p280, {
			Image = v787,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim231 + uDim232
		})

		audioServicePlaySound("MidSlash")
		audioServicePlaySound("nyah")
		effectsService.Shake(p282, p282.Position, 0.4, 0.3)
		animation.Animate(v792, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
		v792:Destroy()
	end,
	ChronologicalLeak = function(p290, _, p292, _)
		audioServicePlaySound("clockeffect")
		task.spawn(function()
			local color3204 = Color3.fromRGB(255, 255, 255)

			effectsServicePulse(p290, p292, {
				Time = 2,
				FlashTime = 1.5,
				Color = { color3204, Color3.fromRGB(8, 0, 255) },
				Transparency = 0.1,
				SizeMultiplier = 1.1,
				ZIndex = p292.ZIndex + 15000
			})
		end)

		local v797 = UDim2.fromOffset(p292.AbsoluteSize.X * 2, p292.AbsoluteSize.X * 2)
		local uDim2 = UDim2.new(0, p292.AbsolutePosition.X, 0, p292.AbsolutePosition.Y)
		local uDim233 = UDim2.new(0, p292.AbsoluteSize.X * 0.5, 0, p292.AbsoluteSize.Y * 0.5)

		GenerateClock(p290, v797, uDim2 + uDim233, 180, 2, p292.ZIndex + 20000, Color3.fromRGB(255, 255, 255))
		task.wait(1)
	end,
	ChronologicalSelf = function(p294, p295, _, _)
		audioServicePlaySound("clockeffect")
		task.spawn(function()
			local color3205 = Color3.fromRGB(255, 255, 255)

			effectsServicePulse(p294, p295, {
				Time = 2,
				FlashTime = 1.5,
				Color = { color3205, Color3.fromRGB(8, 0, 255) },
				Transparency = 0.1,
				SizeMultiplier = 1.1,
				ZIndex = p295.ZIndex + 15000
			})
		end)

		local v804 = UDim2.fromOffset(p295.AbsoluteSize.X * 2, p295.AbsoluteSize.X * 2)
		local uDim2 = UDim2.new(0, p295.AbsolutePosition.X, 0, p295.AbsolutePosition.Y)
		local uDim234 = UDim2.new(0, p295.AbsoluteSize.X * 0.5, 0, p295.AbsoluteSize.Y * 0.5)

		GenerateClock(p294, v804, uDim2 + uDim234, 180, 2, p295.ZIndex + 20000, Color3.fromRGB(255, 255, 255))
		task.wait(1)
	end,
	ProphetClock = function(p298, p299, _, _)
		audioServicePlaySound("clockeffect")
		task.spawn(function()
			local color3206 = Color3.fromRGB(255, 255, 255)

			effectsServicePulse(p298, p299, {
				Time = 1.5,
				FlashTime = 1.25,
				Color = { color3206, Color3.fromRGB(165, 0, 0) },
				Transparency = 0.15,
				SizeMultiplier = 1.05,
				ZIndex = p299.ZIndex + 15000
			})
		end)

		local v811 = UDim2.fromOffset(p299.AbsoluteSize.X * 2, p299.AbsoluteSize.X * 2)
		local uDim2 = UDim2.new(0, p299.AbsolutePosition.X, 0, p299.AbsolutePosition.Y)
		local uDim235 = UDim2.new(0, p299.AbsoluteSize.X * 0.5, 0, p299.AbsoluteSize.Y * 0.5)

		GenerateClock(p298, v811, uDim2 + uDim235, 300, 1.5, p299.ZIndex + 20000, Color3.fromRGB(255, 153, 10))
		audioServicePlaySound("Target Or Select Low")
		task.wait(1)
	end,
	ClockworkSpiral = function(p302, _, p304, _)
		local battleNew = p302.Parent.BattleNew

		audioServicePlaySound("Elevator Ding")

		local v819 = UDim2.fromOffset(battleNew.VirtualField.AbsoluteSize.Y * 2, battleNew.VirtualField.AbsoluteSize.Y * 2)
		local uDim2 = UDim2.new(0, battleNew.AbsolutePosition.X, 0, battleNew.AbsolutePosition.Y)
		local uDim236 = UDim2.new(0, battleNew.AbsoluteSize.X * 0.5, 0, battleNew.AbsoluteSize.Y * 0.5)

		GenerateClock(p302, v819, uDim2 + uDim236, -360, 2, p304.ZIndex + 20000, Color3.fromRGB(255, 255, 255))
	end,
	TimeTravel = function(p306, _, p308, _)
		task.spawn(function()
			audioService.DimSongs()

			local y = p306.Parent.BattleNew.VirtualField.AbsoluteSize.Y
			local color3207 = Color3.fromRGB(0, 0, 0)
			local v2878 = uDim2New(1, 0, 1, 0)
			local v2879 = uDim2New(0.5, 0, 0.5, 0)
			local v2880 = effectsServiceNewerCircle(p306, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 10010,
				BackgroundColor3 = color3207,
				Size = v2878,
				Position = v2879
			})
			local color3208 = Color3.fromRGB(0, 0, 0)
			local v2882 = uDim2New(1.5, 0, 1.5, 0)
			local v2883 = uDim2New(0.5, 0, 0.5, 0)
			local v2884 = effectsServiceNewerCircle(p306, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 10011,
				BackgroundColor3 = color3208,
				Size = v2882,
				Position = v2883
			})

			animation.AnimateAsync(v2880, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 0.4, "Out", "Linear")

			local v2885 = uDim2New(0, 0, 0, 0)
			local v2886 = uDim2New(0.5, 0, 0.5, 0)
			local color3209 = Color3.fromRGB(39, 54, 120)
			local v2888 = effectsServiceNewerCircle(p306, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				Image = "rbxassetid://8562508382",
				ZIndex = 10011,
				Size = v2885,
				Position = v2886,
				ImageColor3 = color3209
			})
			local animationAnimateAsync = animation.AnimateAsync
			local v2890 = uDim2New(0, y * 3, 0, y * 3)

			animationAnimateAsync(v2888, { ImageTransparency = 0, Size = v2890 }, 0.4, "Out", "Quint")
			animation.AnimateAsync(v2888, { Rotation = 1080 }, 3, "Out", "Linear")

			local image = p308.Image
			v2883 = { Color3.fromRGB(235, 235, 235), Color3.fromRGB(137, 139, 240) }
			v2882 = UDim2.fromOffset(y * 0.4, y * 0.7)
			effectsServiceEmit(p306, v2884, {
				Strength = 50,
				Speed = 2,
				Lifetime = 0.65,
				EasingStyle = "Quint",
				EasingDirection = "In",
				Time = 1,
				ZIndex = 10011,
				Projectile = image,
				Color = v2883,
				Size = v2882,
				Range = v2884
			})
			audioServicePlaySound("clockeffect")
			v2890 = uDim2New(0, y * 3, 0, y * 3)

			local v2892 = uDim2New(0.5, 0, 0.5, 0)

			GenerateClock(p306, v2890, v2892, 180, 2, p308.ZIndex + 20000, Color3.fromRGB(255, 255, 255))
			wait(1)

			local animateAsync = animation.AnimateAsync

			v2892 = UDim2.fromOffset(0, 0)
			animateAsync(v2888, { Size = v2892 }, 1, "In", "Quint")
			animation.Animate(v2880, { BackgroundTransparency = 1 }, 1, "In", "Linear")
			audioService.UndimSongs()
			v2880:Destroy()
			v2884:Destroy()
			v2888:Destroy()
		end)
	end,
	SearchlightsHook = function(p310, p311, p312, _)
		local vector3 = Vector3.new(p311.AbsolutePosition.X + p311.AbsoluteSize.X / 2, p311.AbsolutePosition.Y, 0)
		local vector32 = Vector3.new(p312.AbsolutePosition.X + p312.AbsoluteSize.X / 2, p312.AbsolutePosition.Y, 0)
		local v832 = math.atan2(vector32.Y - vector3.Y, vector32.X - vector3.X)
		local n1 = p312.ZIndex + 10000
		local color3210 = Color3.fromRGB(255, 255, 255)
		local image = p312.Image
		local v836 = uDim2New(0, p312.AbsoluteSize.X, 0, p312.AbsoluteSize.Y)
		local uDim2 = UDim2.new(0, p312.AbsolutePosition.X, 0, p312.AbsolutePosition.Y)
		local uDim237 = UDim2.new(0, p312.AbsoluteSize.X * 0.5, 0, p312.AbsoluteSize.Y * 0.5)
		local v839 = effectsServiceNewerCircle(p310, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ZIndex = n1,
			ImageColor3 = color3210,
			Image = image,
			Size = v836,
			Position = uDim2 + uDim237
		})

		v836 = p312.ZIndex + 10000
		n1 = uDim2New(0, 0, 0, 0)

		local v840 = math.deg(v832)
		local uDim238 = UDim2.new(0, p311.AbsolutePosition.X, 0, p311.AbsolutePosition.Y)
		local uDim239 = UDim2.new(0, p311.AbsoluteSize.X * 0.5, 0, p311.AbsoluteSize.Y * 0.5)
		local parent = effectsServiceNewerCircle(p310, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://132588805332203",
			ZIndex = v836,
			Size = n1,
			Rotation = v840 - 90,
			Position = uDim238 + uDim239
		})
		local n2 = p312.ZIndex + 10000
		local v845 = uDim2New(1, 0, 1, 0)
		local v846 = effectsServiceNewerCircle(p310, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://92752661811240",
			Rotation = 0,
			ZIndex = n2,
			Size = v845,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Parent = parent
		})

		v836 = p312.ZIndex + 10000
		n1 = uDim2New(0, 100, 0, 0)

		local v847 = vector2New(0.5, 1)
		local v848 = effectsServiceNewerCircle(p310, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://139708296011779",
			Rotation = 0,
			ZIndex = v836,
			Size = n1,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = v847,
			Parent = parent
		})

		task.spawn(function()
			task.wait(0.8)
			audioServicePlaySound("MidSlash")
			effectsService.ShakeSync(p312, p312.Position, 0.2, 0.1)
			v846.ImageTransparency = 0
			parent.ImageTransparency = 1
		end)
		audioServicePlaySound("BowShoot")

		local animationAnimateAsync = animation.AnimateAsync
		local uDim240 = UDim2.new(0, p312.AbsolutePosition.X, 0, p312.AbsolutePosition.Y)
		local uDim241 = UDim2.new(0, p312.AbsoluteSize.X * 0.5, 0, p312.AbsoluteSize.Y * 0.5)

		v840 = uDim2New(0, p312.AbsoluteSize.X, 0, p312.AbsoluteSize.X)
		animationAnimateAsync(parent, { Position = uDim240 + uDim241, Size = v840 }, 1.2, "InOut", "Exponential")

		if p311.AbsolutePosition.X - p312.AbsolutePosition.X < 0 then
			local animationAnimate = animation.Animate
			local uDim242 = UDim2.new(0, 100, 0, -p311.AbsolutePosition.X + p312.AbsolutePosition.X)

			animationAnimate(v848, { Size = uDim242 }, 1.2, "InOut", "Exponential")
		else
			local animate = animation.Animate
			local uDim243 = UDim2.new(0, 100, 0, p311.AbsolutePosition.X - p312.AbsolutePosition.X)

			animate(v848, { Size = uDim243 }, 1.2, "InOut", "Exponential")
		end

		task.wait(0.1)
		audioServicePlaySound("ChainDrag", { TimePosition = 1.4 })
		p312.ImageTransparency = 1
		v839.ImageTransparency = 0

		local uDim244 = UDim2.new(0, p311.AbsolutePosition.X, 0, p311.AbsolutePosition.Y)
		local uDim245 = UDim2.new(0, p311.AbsoluteSize.X * 0.5, 0, p311.AbsoluteSize.Y * 0.5)
		local n3 = uDim244 + uDim245

		task.spawn(function()
			task.wait(0.5)
			audioServicePlaySound("LargeChomp")
		end)

		local animateAsync = animation.AnimateAsync
		local uDim246 = UDim2.new(0, p311.AbsolutePosition.X, 0, p311.AbsolutePosition.Y)
		local uDim247 = UDim2.new(0, p311.AbsoluteSize.X * 0.5, 0, p311.AbsoluteSize.Y * 0.5)
		local v862 = uDim2New(0, 0, 0, 0)

		animateAsync(parent, { Position = uDim246 + uDim247, Size = v862 }, 1, "InOut", "Exponential")

		local v863 = animation.AnimateAsync
		local uDim248 = UDim2.new(0, p311.AbsolutePosition.X, 0, p311.AbsolutePosition.Y)
		local uDim249 = UDim2.new(0, p311.AbsoluteSize.X * 0.5, 0, p311.AbsoluteSize.Y * 0.5)

		v862 = uDim2New(0, 0, 0, 0)
		v863(v839, { Rotation = 40, Position = uDim248 + uDim249, Size = v862 }, 1, "InOut", "Exponential")
		animation.Animate(v848, { Size = UDim2.new(0, 100, 0, 0) }, 1, "InOut", "Exponential")
		task.spawn(function()
			task.wait(1.5)

			if p312 and p312.Parent ~= nil then
				audioServicePlaySound("Spit")

				local animationAnimate = animation.Animate
				local v2895 = p312
				local uDim250 = UDim2.new(0, v2895.AbsolutePosition.X, 0, v2895.AbsolutePosition.Y)
				local uDim251 = UDim2.new(0, v2895.AbsoluteSize.X * 0.5, 0, v2895.AbsoluteSize.Y * 0.5)
				local v2898 = uDim2New(0, p312.AbsoluteSize.X, 0, p312.AbsoluteSize.Y)

				animationAnimate(v839, { Rotation = -1080, Position = uDim250 + uDim251, Size = v2898 }, 1, "InOut", "Quart")
				p312.ImageTransparency = 0
				v839.ImageTransparency = 1
				audioService.PlaySound("FastSplat")
				v839:Destroy()

				return
			end

			v839:Destroy()
		end)
		parent:Destroy()
		v848:Destroy()
	end,
	LargeArrow = function(p338, p339, p340, p341)
		AttackArrow(p338, p339, p340, p341, "rbxassetid://12790951714", 1.3, "attack", "arrowcut", 1.25, 6, 0.5)
	end,
	MidArrow = function(p342, p343, p344, p345)
		AttackArrow(p342, p343, p344, p345, "rbxassetid://12790951714", 1.15, "attack", "arrowcut", 1.25, 6, 0.5)
	end,
	SmallArrow = function(p346, p347, p348, p349)
		AttackArrow(p346, p347, p348, p349, "rbxassetid://12790951714", 1, "attack", "arrowcut", 1.25, 6, 0.5)
	end,
	LargeKunai = function(p350, p351, p352, p353)
		AttackArrow(p350, p351, p352, p353, "rbxassetid://8660622019", 1.1, "attackquiet", "arrowcut", 1.25, 2, 0.25)
	end,
	MidKunai = function(p354, p355, p356, p357)
		AttackArrow(p354, p355, p356, p357, "rbxassetid://8660622019", 0.9, "attackquiet", "arrowcut", 1.25, 2, 0.2)
	end,
	SmallKunai = function(p358, p359, p360, p361)
		AttackArrow(p358, p359, p360, p361, "rbxassetid://8660622019", 0.75, "attackquiet", "arrowcut", 1.25, 2, 0.2)
	end,
	WeakenArrow = function(p362, p363, p364, p365)
		local color3211 = Color3.fromRGB(103, 138, 255)

		Arrow(p362, p363, p364, p365, "rbxassetid://12598839216", color3211, "attack", "arrowcut", 1.25, 6, nil, nil, 0.35)
	end,
	DamageArrow = function(p366, p367, p368, p369)
		local color3212 = Color3.fromRGB(255, 83, 86)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3213 = Color3.fromRGB(240, 99, 43)
		local color3214 = Color3.fromRGB(217, 66, 39)
		local color3215 = Color3.fromRGB(240, 191, 65)
		local color3216 = Color3.fromRGB(240, 64, 11)

		Arrow(p366, p367, p368, p369, "rbxassetid://12598839216", color3212, "attack", "arrowcut", 1.25, 6, {
			p366,
			p367,
			p368,
			p369,
			150,
			effectsServiceBreathimagesFire,
			"FireBreathLong",
			0.8,
			color3213,
			color3214,
			color3215,
			color3216,
			1.1,
			0.9
		}, nil, 0.35)
	end,
	PoisonArrow = function(p370, p371, p372, p373)
		local color3217 = Color3.fromRGB(0, 130, 0)

		Arrow(p370, p371, p372, p373, "rbxassetid://12598839216", color3217, "attack", "arrowcut", 1.25, 6, nil, nil, 0.35)
	end,
	ThunderArrow = function(p374, p375, p376, p377)
		local color3218 = Color3.fromRGB(199, 199, 0)

		Arrow(p374, p375, p376, p377, "rbxassetid://12598839216", color3218, "attack", "arrowcut", 1.25, 6, nil, nil, 0.35)
	end,
	KnifeThrow = function(p378, p379, p380, p381)
		local color3219 = Color3.fromRGB(255, 255, 255)

		Arrow(p378, p379, p380, p381, "rbxassetid://12858223029", color3219, "KnifeSwing", "knife wound", 1, 1.2, nil, nil, 0.35)
	end,
	SwordThrow = function(p382, p383, p384, p385)
		local color3220 = Color3.fromRGB(255, 255, 255)

		Arrow(p382, p383, p384, p385, "rbxassetid://12192587180", color3220, "unsheath", "SwordImpact", 1, 1.2, nil, nil, 0.35)
	end,
	FoodThrow = function(p386, p387, p388, p389)
		local t14 = {
			"rbxassetid://12867744581",
			"rbxassetid://12192607589",
			"rbxassetid://12122824593",
			"rbxassetid://10270776441",
			"rbxassetid://12124921013",
			"rbxassetid://12135944951",
			"rbxassetid://12124920496"
		}

		effectsServicePreloadTech(p386, t14)

		local t15 = { "Woosh", "bass.wav", "button.wav", "snap.wav" }
		local t16: {[any]: any} = { "splat.wav", "Yummy", "Yum", "Kerplunk.wav" }
		local randomNumber = math.random(1, #t14)
		local v933 = t14[randomNumber]
		local randomNumber8 = math.random(1, #t15)

		t14 = t15[randomNumber8]

		local randomNumber9 = math.random(1, #t16)

		t15 = t16[randomNumber9]

		local randomNumber10 = math.random(1, 3)
		local color3221 = Color3.fromRGB(255, 255, 255)

		Arrow(p386, p387, p388, p389, v933, color3221, t14, t15, 0.9, 1.25, {
			Rotation = { 0, randomNumber10 * 360 }
		}, nil, 0.5)
	end,
	FireBlastPurple = function(p390, p391, p392, p393)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3222 = Color3.fromRGB(191, 45, 240)
		local color3223 = Color3.fromRGB(212, 74, 217)
		local color3224 = Color3.fromRGB(235, 104, 240)
		local color3225 = Color3.fromRGB(122, 8, 126)
		local color3226 = Color3.fromRGB(173, 83, 229)

		Arrow(p390, p391, p392, p393, "rbxassetid://15547914272", color3226, "FireballShoot", "", 1, 6, { WaitTime = 0.05 }, {
			p390,
			p391,
			p392,
			p393,
			40,
			effectsServiceBreathimagesFire,
			"FireballImpact",
			0.6,
			color3222,
			color3223,
			color3224,
			color3225,
			1.1,
			0.9
		})
	end,
	FireBlastWhite = function(p394, p395, p396, p397)
		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3227 = Color3.fromRGB(240, 223, 233)
		local color3228 = Color3.fromRGB(217, 209, 216)
		local color3229 = Color3.fromRGB(240, 225, 235)
		local color3230 = Color3.fromRGB(126, 118, 125)
		local color3231 = Color3.fromRGB(229, 229, 229)

		Arrow(p394, p395, p396, p397, "rbxassetid://15547914272", color3231, "SentryFireballShoot", "", 1, 6, { WaitTime = 0.05 }, {
			p394,
			p395,
			p396,
			p397,
			40,
			effectsServiceBreathimagesFire,
			"FireballImpact",
			0.6,
			color3227,
			color3228,
			color3229,
			color3230,
			1.1,
			0.9
		})
	end
}

function module.KnifeThrowEnemy(p398, p399, _, p401)
	local s1

	if p401 == "" then
		s1 = "Enemy"
	elseif p401 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p398.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.KnifeThrow(p398, p399, v, nil, nil)
		end)
	end
end
function module.KnifeThrowEffect(p402, p403, p404, _)
	spawn(function()
		module.KnifeThrow(p402, p403, p404, nil, nil)
	end)
end
local function ArrowFaction(p406, p407, p408, _, p410, p411)
	if not p411 then
		p411 = Color3.fromRGB(255, 255, 255)
	end

	local v976 = UDim2.fromOffset(p408.AbsoluteSize.X / 1.25, p408.AbsoluteSize.Y / 6)

	audioServicePlaySound("attack")

	local v977 = effectsServiceThrow(p406, p407, p408, {
		Time = 0.35,
		Size = v976,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = p410,
		Color = p411
	})
	local t17: {[any]: any} = {
		Time = 0.3,
		Color = { p411, p411 },
		Transparency = 0.5
	}

	spawn(function()
		audioServicePlaySound("arrowcut")
		effectsService.Shake(p408, p408.Position, 0.1, 0.1)
		effectsServicePulse(p406, v977, t17)
	end)
	wait(0.1)
	effectsService.Shake(p408, p408.Position, 0.1, 0.1)
	v977:Destroy()
	wait(0.1)
end
function module.RedArrow(p412, p413, p414, p415)
	ArrowFaction(p412, p413, p414, p415, "rbxassetid://12598842479")
end
function module.BlueArrow(p416, p417, p418, p419)
	ArrowFaction(p416, p417, p418, p419, "rbxassetid://12598840638")
end
function module.TurkeyArrow(p420, p421, p422, _)
	effectsServicePreloadTech(p420, { "rbxassetid://12135944951" })

	local v991 = UDim2.fromOffset(p422.AbsoluteSize.X / 1.25, p422.AbsoluteSize.Y / 2)

	audioServicePlaySound("Gobble")

	local v992 = effectsServiceThrow(p420, p421, p422, {
		Time = 0.35,
		Rotation = { 0 },
		Size = v991,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = "rbxassetid://12135944951",
		Variation = 20
	})
	local t18: {[any]: any} = { Time = 0.3, Transparency = 0.5 }

	spawn(function()
		audioServicePlaySound("arrowcut")
		effectsService.Shake(p422, p422.Position, 0.1, 0.1)
		effectsServicePulse(p420, v992, t18)
	end)
	wait(0.1)
	effectsService.Shake(p422, p422.Position, 0.1, 0.1)
	v992:Destroy()
end
function module.CakeArrow(p424, p425, p426, _)
	effectsServicePreloadTech(p424, { "rbxassetid://12124921013" })

	local v998 = UDim2.fromOffset(p426.AbsoluteSize.X / 1.25, p426.AbsoluteSize.Y / 2)

	audioServicePlaySound("Yummy")

	local v999 = effectsServiceThrow(p424, p425, p426, {
		Time = 0.35,
		Rotation = { 0 },
		Size = v998,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = "rbxassetid://12124921013",
		Variation = 20
	})
	local t19: {[any]: any} = { Time = 0.3, Transparency = 0.5 }

	spawn(function()
		audioServicePlaySound("arrowcut")
		effectsService.Shake(p426, p426.Position, 0.1, 0.1)
		effectsServicePulse(p424, v999, t19)
	end)
	wait(0.1)
	effectsService.Shake(p426, p426.Position, 0.1, 0.1)
	v999:Destroy()
end
local function BeverageShake(p428, p429, p430)
	effectsServicePreloadTech(p428, {
		"rbxassetid://13129669803",
		"rbxassetid://13129670977",
		"rbxassetid://13129672580",
		"rbxassetid://13129673768"
	})

	local v1004 = UDim2.fromOffset(p429.AbsoluteSize.X * 0.5, p429.AbsoluteSize.Y * 0.5)
	local uDim2 = UDim2.new(0, p429.AbsolutePosition.X, 0, p429.AbsolutePosition.Y)
	local uDim252 = UDim2.new(0, p429.AbsoluteSize.X * 0.5, 0, p429.AbsoluteSize.Y * 0.5)
	local v1007 = UDim2.fromOffset(0, p429.AbsoluteSize.Y * 0.3)
	local v1008 = effectsServiceNewerCircle(p428, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1004,
		Position = uDim2 + uDim252 - v1007
	})
	local t20: {[any]: any} = {
		"rbxassetid://13129669803",
		"rbxassetid://13129670977",
		"rbxassetid://13129672580",
		"rbxassetid://13129673768"
	}

	v1007 = UDim2.fromOffset(p429.AbsoluteSize.X * 1.4, p429.AbsoluteSize.X * 1.4)

	local uDim253 = UDim2.new(0, p429.AbsolutePosition.X, 0, p429.AbsolutePosition.Y)
	local uDim254 = UDim2.new(0, p429.AbsoluteSize.X * 0.5, 0, p429.AbsoluteSize.Y * 0.5)
	local v1012 = UDim2.fromOffset(0, p429.AbsoluteSize.Y * 0.16)
	local n1 = p429.ZIndex + 1000
	local randomNumber = math.random(-50, 10)
	local v1015 = effectsServiceNewerCircle(p428, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "",
		Size = v1007,
		Position = uDim253 + uDim254 - v1012,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2899 = UDim2.fromOffset(p429.AbsoluteSize.X / 9, p429.AbsoluteSize.X / 9)

		effectsServiceBreath(p428, v1015, v1008, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p430,
			Size = v2899
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2901 = UDim2.fromOffset(p429.AbsoluteSize.X * 0.15, p429.AbsoluteSize.X * 0.15)

		animationAnimate(v1015, { Size = v2901 }, 1.1, "In", "Quad")
		v1015:Destroy()
	end)
	task.spawn(function()
		for i = 1, 4 do
			v1015.Image = t20[i]
			task.wait(0.25)
		end
	end)
	task.wait(0.3)
	audioServicePlaySound("DrinkShake")
	v1004 = p429.Position

	for _ = 1, 3 do
		local v1017 = p429.Position
		local v1018 = UDim2.fromOffset(0, p429.AbsoluteSize.Y / 24)

		p429.Position = v1017 - v1018
		animation.Animate(p429, { Position = v1004 }, 0.2, "In", "Quint")
	end
end
function module.DrinkShake(p431, _, p433, _)
	task.spawn(function()
		audioServicePlaySound("OpenShake")
		BeverageShake(p431, p433, Color3.fromRGB(134, 201, 226))
	end)
	task.wait(0.5)
end
local function BeverageSlush(p435, p436, p437)
	effectsServicePreloadTech(p435, {
		"rbxassetid://13129787906",
		"rbxassetid://13129789467",
		"rbxassetid://13129791070",
		"rbxassetid://13129792774"
	})

	local v1026 = UDim2.fromOffset(p436.AbsoluteSize.X * 0.5, p436.AbsoluteSize.Y * 0.5)
	local uDim2 = UDim2.new(0, p436.AbsolutePosition.X, 0, p436.AbsolutePosition.Y)
	local uDim255 = UDim2.new(0, p436.AbsoluteSize.X * 0.5, 0, p436.AbsoluteSize.Y * 0.5)
	local v1029 = UDim2.fromOffset(0, p436.AbsoluteSize.Y * 0.3)
	local v1030 = effectsServiceNewerCircle(p435, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1026,
		Position = uDim2 + uDim255 - v1029
	})
	local t21: {[any]: any} = {
		"rbxassetid://13129787906",
		"rbxassetid://13129789467",
		"rbxassetid://13129791070",
		"rbxassetid://13129792774"
	}

	v1029 = UDim2.fromOffset(p436.AbsoluteSize.X * 1.4, p436.AbsoluteSize.X * 1.4)

	local uDim256 = UDim2.new(0, p436.AbsolutePosition.X, 0, p436.AbsolutePosition.Y)
	local uDim257 = UDim2.new(0, p436.AbsoluteSize.X * 0.5, 0, p436.AbsoluteSize.Y * 0.5)
	local v1034 = UDim2.fromOffset(0, p436.AbsoluteSize.Y * 0.16)
	local n1 = p436.ZIndex + 1000
	local randomNumber = math.random(-50, 10)
	local v1037 = effectsServiceNewerCircle(p435, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "",
		Size = v1029,
		Position = uDim256 + uDim257 - v1034,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2903 = UDim2.fromOffset(p436.AbsoluteSize.X / 9, p436.AbsoluteSize.X / 9)

		effectsServiceBreath(p435, v1037, v1030, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p437,
			Size = v2903
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2905 = UDim2.fromOffset(p436.AbsoluteSize.X * 0.15, p436.AbsoluteSize.X * 0.15)

		animationAnimate(v1037, { Size = v2905 }, 1.1, "In", "Quad")
		v1037:Destroy()
	end)
	task.spawn(function()
		for i = 1, 4 do
			v1037.Image = t21[i]
			task.wait(0.25)
		end
	end)
	task.wait(0.3)
	audioServicePlaySound("DrinkShake")
	v1026 = p436.Position

	for _ = 1, 3 do
		local v1039 = p436.Position
		local v1040 = UDim2.fromOffset(0, p436.AbsoluteSize.Y / 24)

		p436.Position = v1039 - v1040
		animation.Animate(p436, { Position = v1026 }, 0.2, "In", "Quint")
	end
end
function module.DrinkSlush(p438, _, p440, _)
	task.spawn(function()
		audioServicePlaySound("OpenShake")
		BeverageSlush(p438, p440, Color3.fromRGB(18, 226, 42))
	end)
	task.wait(0.5)
end
local function EatFoodPlus(p442, p443, p444)
	effectsServicePreloadTech(p442, {
		"rbxassetid://13129794367",
		"rbxassetid://13129795656",
		"rbxassetid://13129796742",
		"rbxassetid://13129798338"
	})

	local t22: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t23 = { "Nom", "Om Nom Nom", "eat" }
	local v1050 = UDim2.fromOffset(p443.AbsoluteSize.X * 0.6, p443.AbsoluteSize.Y * 0.6)
	local uDim2 = UDim2.new(0, p443.AbsolutePosition.X, 0, p443.AbsolutePosition.Y)
	local uDim258 = UDim2.new(0, p443.AbsoluteSize.X * 0.5, 0, p443.AbsoluteSize.Y * 0.5)
	local v1053 = UDim2.fromOffset(0, p443.AbsoluteSize.Y * 0.3)
	local v1054 = effectsServiceNewerCircle(p442, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1050,
		Position = uDim2 + uDim258 - v1053
	})
	local t24: {[any]: any} = {
		"rbxassetid://13129794367",
		"rbxassetid://13129795656",
		"rbxassetid://13129796742",
		"rbxassetid://13129798338"
	}

	v1053 = UDim2.fromOffset(p443.AbsoluteSize.X * 1.4, p443.AbsoluteSize.X * 1.4)

	local uDim259 = UDim2.new(0, p443.AbsolutePosition.X, 0, p443.AbsolutePosition.Y)
	local uDim260 = UDim2.new(0, p443.AbsoluteSize.X * 0.5, 0, p443.AbsoluteSize.Y * 0.5)
	local v1058 = UDim2.fromOffset(0, p443.AbsoluteSize.Y * 0.16)
	local n1 = p443.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v1061 = effectsServiceNewerCircle(p442, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "",
		Size = v1053,
		Position = uDim259 + uDim260 - v1058,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2907 = UDim2.fromOffset(p443.AbsoluteSize.X / 8, p443.AbsoluteSize.X / 8)

		effectsServiceBreath(p442, v1061, v1054, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p444,
			Size = v2907
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2909 = UDim2.fromOffset(p443.AbsoluteSize.X * 0.15, p443.AbsoluteSize.X * 0.15)

		animationAnimate(v1061, { Size = v2909 }, 1.1, "In", "Quad")
		v1061:Destroy()
	end)
	task.spawn(function()
		for i = 1, 4 do
			v1061.Image = t24[i]
			task.wait(0.25)
		end
	end)

	local randomNumber11 = math.random(1, #t22)

	audioServicePlaySound(t22[randomNumber11])
	task.wait(0.3)

	local randomNumber12 = math.random(1, #t23)

	audioServicePlaySound(t23[randomNumber12])
	t23 = p443.Position

	for _ = 1, 3 do
		local v1065 = p443.Position
		local v1066 = UDim2.fromOffset(0, p443.AbsoluteSize.Y / 12)

		p443.Position = v1065 - v1066
		animation.Animate(p443, { Position = t23 }, 0.2, "Out", "Quint")
	end
end
function module.EatNuggets(p445, _, p447, _)
	task.spawn(function()
		EatFoodPlus(p445, p447, Color3.fromRGB(167, 5, 5))
	end)
	task.wait(0.5)
end
local function EatFoodPlusPlus(p449, p450, p451)
	effectsServicePreloadTech(p449, {
		"rbxassetid://13109620943",
		"rbxassetid://13109621731",
		"rbxassetid://13109622686",
		"rbxassetid://13109623561"
	})

	local t25: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t26 = { "Nom", "Om Nom Nom", "eat" }
	local v1076 = UDim2.fromOffset(p450.AbsoluteSize.X * 0.6, p450.AbsoluteSize.Y * 0.6)
	local uDim2 = UDim2.new(0, p450.AbsolutePosition.X, 0, p450.AbsolutePosition.Y)
	local uDim261 = UDim2.new(0, p450.AbsoluteSize.X * 0.5, 0, p450.AbsoluteSize.Y * 0.5)
	local v1079 = UDim2.fromOffset(0, p450.AbsoluteSize.Y * 0.3)
	local v1080 = effectsServiceNewerCircle(p449, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1076,
		Position = uDim2 + uDim261 - v1079
	})
	local t27: {[any]: any} = {
		"rbxassetid://13109620943",
		"rbxassetid://13109621731",
		"rbxassetid://13109622686",
		"rbxassetid://13109623561"
	}

	v1079 = UDim2.fromOffset(p450.AbsoluteSize.X * 1.4, p450.AbsoluteSize.X * 1.4)

	local uDim262 = UDim2.new(0, p450.AbsolutePosition.X, 0, p450.AbsolutePosition.Y)
	local uDim263 = UDim2.new(0, p450.AbsoluteSize.X * 0.5, 0, p450.AbsoluteSize.Y * 0.5)
	local v1084 = UDim2.fromOffset(0, p450.AbsoluteSize.Y * 0.16)
	local n1 = p450.ZIndex + 1000
	local randomNumber = math.random(-20, 20)
	local v1087 = effectsServiceNewerCircle(p449, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "",
		Size = v1079,
		Position = uDim262 + uDim263 - v1084,
		ZIndex = n1,
		Rotation = randomNumber
	})

	task.spawn(function()
		local v2911 = UDim2.fromOffset(p450.AbsoluteSize.X / 8, p450.AbsoluteSize.X / 8)

		effectsServiceBreath(p449, v1087, v1080, {
			Projectile = "rbxassetid://511406127",
			Strength = 50,
			Time = 0.75,
			Color = p451,
			Size = v2911
		})
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v2913 = UDim2.fromOffset(p450.AbsoluteSize.X * 0.15, p450.AbsoluteSize.X * 0.15)

		animationAnimate(v1087, { Size = v2913 }, 1.1, "In", "Quad")
		v1087:Destroy()
	end)
	task.spawn(function()
		for i = 1, 4 do
			v1087.Image = t27[i]
			task.wait(0.25)
		end
	end)

	local randomNumber13 = math.random(1, #t25)

	audioServicePlaySound(t25[randomNumber13])
	task.wait(0.3)

	local randomNumber14 = math.random(1, #t26)

	audioServicePlaySound(t26[randomNumber14])
	t26 = p450.Position

	for _ = 1, 3 do
		local v1091 = p450.Position
		local v1092 = UDim2.fromOffset(0, p450.AbsoluteSize.Y / 12)

		p450.Position = v1091 - v1092
		animation.Animate(p450, { Position = t26 }, 0.2, "Out", "Quint")
	end
end
function module.EatRazorChicken(p452, _, p454, _)
	audioServicePlaySound("Gobble")
	task.spawn(function()
		EatFoodPlusPlus(p452, p454, Color3.fromRGB(88, 78, 57))
	end)
	task.wait(0.5)
end
function module.DrinkBloxy(p456, p457, p458, p459)
	task.spawn(function()
		audioServicePlaySound("OpenSound")
		BloxyBubble(p456, p457, p458, p459, "rbxassetid://12122823106", Color3.fromRGB(72, 52, 49))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.DrinkWitchesBrew(p460, p461, p462, p463)
	task.spawn(function()
		audioServicePlaySound("OpenSound")
		BloxyBubble(p460, p461, p462, p463, "rbxassetid://12122823737", Color3.fromRGB(15, 232, 30))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.4)
	audioServicePlaySound("Spooky")
	task.wait(0.1)
end
function module.DrinkMug(p464, p465, p466, p467)
	task.spawn(function()
		Beverage(p464, p465, p466, p467, "rbxassetid://12136149519", Color3.fromRGB(65, 47, 44))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.LifePotion(p468, p469, p470, p471)
	task.spawn(function()
		Beverage(p468, p469, p470, p471, "rbxassetid://12116000261", Color3.fromRGB(113, 0, 2))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
	audioServicePlaySound("GlassBreak1")
	task.wait(0.1)
end
function module.SlatePotion(p472, p473, p474, p475)
	task.spawn(function()
		Beverage(p472, p473, p474, p475, "rbxassetid://12115999597", Color3.fromRGB(134, 124, 111))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.4)
	audioServicePlaySound("Slateskin")

	local color3232 = Color3.fromRGB(220, 225, 231)

	effectsServicePulse(p472, p474, {
		Time = 1,
		FlashTime = 0.75,
		Color = { color3232, Color3.fromRGB(170, 160, 133) },
		Transparency = 0.1,
		ZIndex = p474.ZIndex + 1000
	})
	task.wait(0.2)
	audioServicePlaySound("GlassBreak1")
	task.wait(0.1)

	local zIndex = p474.ZIndex
	local v1119 = uDim2New(1, 0, 1, 0)
	local v1120 = uDim2New(0.5, 0, 0.5, 0)
	local v1121 = effectsServiceNewerCircle(p474, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12073256240",
		Visible = true,
		ZIndex = zIndex,
		Size = v1119,
		Position = v1120
	})

	spawn(function()
		local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
		local imageColor3 = p474.ImageColor3
		local color3233 = Color3.fromRGB(253, 160, 110)

		effectsServiceNewTweenProperty(p474, "ImageColor3", imageColor3, color3233, 0.3, "Quad")
	end)
	spawn(function()
		effectsService.NewTweenProperty(v1121, "ImageTransparency", 1, 0.6, 0.3, "Quad")
	end)
	spawn(function()
		repeat
			runService.Heartbeat:Wait()
		until p474:FindFirstChild("LockImage")

		repeat
			runService.Heartbeat:Wait()
		until not p474:FindFirstChild("LockImage")

		audioService.PlaySound("Slateskin")

		local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
		local imageColor3 = p474.ImageColor3
		local color3234 = Color3.fromRGB(255, 255, 255)

		effectsServiceNewTweenProperty(p474, "ImageColor3", imageColor3, color3234, 0.2, "Quad")
		effectsService.NewTweenProperty(v1121, "ImageTransparency", 0.5, 1, 0.2, "Quad")
		wait(0.4)
		v1121:Destroy()
	end)
end
function module.EatPancakes(p476, p477, p478, p479)
	task.spawn(function()
		EatFood(p476, p477, p478, p479, "rbxassetid://10270776441", Color3.fromRGB(240, 179, 74))
	end)
	task.wait(0.5)
end
function module.EatROBAR(p480, p481, p482, p483)
	task.spawn(function()
		EatFood(p480, p481, p482, p483, "rbxassetid://12124921348", Color3.fromRGB(61, 52, 49))
	end)
	task.wait(0.5)
end
function module.EatBrickBacon(p484, p485, p486, p487)
	task.spawn(function()
		EatFood(p484, p485, p486, p487, "rbxassetid://12168475256", Color3.fromRGB(104, 109, 120))
	end)
	task.wait(0.5)
end
function module.EatPopcorn(p488, p489, p490, p491)
	task.spawn(function()
		EatFood(p488, p489, p490, p491, "rbxassetid://10271102675", Color3.fromRGB(240, 234, 148))
	end)
	task.wait(0.5)
end
function module.EatCake(p492, p493, p494, p495)
	task.spawn(function()
		EatFood(p492, p493, p494, p495, "rbxassetid://12124921013", Color3.fromRGB(74, 51, 72))
	end)
	task.wait(0.5)
end
function module.EatCheez(p496, p497, p498, p499)
	audioServicePlaySound("CanIHaz")
	task.spawn(function()
		EatFood(p496, p497, p498, p499, "rbxassetid://12122824593", Color3.fromRGB(91, 80, 53))
	end)
	task.wait(0.4)
	audioServicePlaySound("MmmCheezburger")
	task.wait(0.1)
end
function module.EatBurrito(p500, p501, p502, p503)
	audioServicePlaySound("Taco")
	task.spawn(function()
		EatFood(p500, p501, p502, p503, "rbxassetid://14277254485", Color3.fromRGB(130, 121, 101))
	end)
	task.wait(0.3)
	audioServicePlaySound("Chavez")
	task.wait(0.2)
end
function module.EatTurkey(p504, p505, p506, p507)
	audioServicePlaySound("Gobble")
	task.spawn(function()
		EatFood(p504, p505, p506, p507, "rbxassetid://12135944951", Color3.fromRGB(88, 78, 57))
	end)
	task.wait(0.5)
end
function module.EatPizza(p508, p509, p510, p511)
	audioServicePlaySound("Pizza")
	task.spawn(function()
		EatFood(p508, p509, p510, p511, "rbxassetid://12124920496", Color3.fromRGB(249, 181, 22))
	end)
	task.wait(0.5)
end
function module.EatBeans(p512, p513, p514, p515)
	task.spawn(function()
		EatFood(p512, p513, p514, p515, "rbxassetid://12769450394", Color3.fromRGB(139, 75, 75))
	end)
	task.wait(0.5)
end
function module.EatOnigiri(p516, p517, p518, p519)
	task.spawn(function()
		EatFood(p516, p517, p518, p519, "rbxassetid://12867744581", Color3.fromRGB(218, 204, 197))
	end)
	task.wait(0.5)
end
function module.EatSpaceSandwich(p520, p521, p522, p523)
	task.spawn(function()
		EatFood(p520, p521, p522, p523, "rbxassetid://12136832530", Color3.fromRGB(249, 240, 196))
	end)
	task.wait(0.5)
end
function module.EatIcyCle(p524, p525, p526, p527)
	task.spawn(function()
		EatFood(p524, p525, p526, p527, "rbxassetid://12192607589", Color3.fromRGB(32, 245, 249))
	end)
	task.wait(0.5)
end
function module.OnigiriBuff(p528, p529, p530, p531)
	task.spawn(function()
		FoodBuff(p528, p529, p530, p531, "rbxassetid://12867744581", Color3.fromRGB(218, 204, 197))
	end)
	task.wait(0.5)
end
function module.IcyCleBuff(p532, p533, p534, p535)
	task.spawn(function()
		FoodBuff(p532, p533, p534, p535, "rbxassetid://12192607589", Color3.fromRGB(32, 245, 249))
	end)
	task.wait(0.5)
end
function module.CheezBuff(p536, p537, p538, p539)
	audioServicePlaySound("CanIHaz")
	task.spawn(function()
		FoodBuff(p536, p537, p538, p539, "rbxassetid://12122824593", Color3.fromRGB(91, 80, 53))
	end)
	task.wait(0.4)
	audioServicePlaySound("MmmCheezburger")
	task.wait(0.1)
end
function module.PancakeBuff(p540, p541, p542, p543)
	task.spawn(function()
		FoodBuff(p540, p541, p542, p543, "rbxassetid://10270776441", Color3.fromRGB(240, 179, 74))
	end)
	task.wait(0.5)
end
function module.CakeBuff(p544, p545, p546, p547)
	task.spawn(function()
		FoodBuff(p544, p545, p546, p547, "rbxassetid://12124921013", Color3.fromRGB(74, 51, 72))
	end)
	task.wait(0.5)
end
function module.TurkeyBuff(p548, p549, p550, p551)
	audioServicePlaySound("Gobble")
	task.spawn(function()
		FoodBuff(p548, p549, p550, p551, "rbxassetid://12135944951", Color3.fromRGB(88, 78, 57))
	end)
	task.wait(0.5)
end
function module.PizzaBuff(p552, p553, p554, p555)
	audioServicePlaySound("Pizza")
	task.spawn(function()
		FoodBuff(p552, p553, p554, p555, "rbxassetid://12124920496", Color3.fromRGB(249, 181, 22))
	end)
	task.wait(0.5)
end
function module.BloxyBuff(p556, p557, p558, p559)
	task.spawn(function()
		audioServicePlaySound("OpenSound")
		BloxyBubbleBuff(p556, p557, p558, p559, "rbxassetid://12122823106", Color3.fromRGB(72, 52, 49))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.RhysmonColaBuff(p560, p561, p562, p563)
	task.spawn(function()
		audioServicePlaySound("OpenSound")
		BloxyBubbleBuff(p560, p561, p562, p563, "rbxassetid://14388227158", Color3.fromRGB(91, 41, 41))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.MugBuff(p564, p565, p566, p567)
	task.spawn(function()
		Beverage(p564, p565, p566, p567, "rbxassetid://12136149519", Color3.fromRGB(65, 47, 44))
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.SaxophoneBuff(p568, p569, p570, p571)
	task.spawn(function()
		MusicBuff(p568, p569, p570, p571, "rbxassetid://476273349", Color3.fromRGB(0, 0, 0))
	end)
	task.wait(0.4)
end
function module.ProvidenceShot(p572, p573, p574, _)
	audioServicePlaySound("EntranceOfGreat")

	if not p572 or not p572.Parent then
		return
	end

	if not p573 or not p573.Parent then
		return
	end

	if not p574 or not p574.Parent then
		return
	end

	if p574.AbsoluteSize.X <= 0 or p574.AbsoluteSize.Y <= 0 then
		return
	end

	local t28: {[any]: any} = {}

	local function track(p576)
		table.insert(t28, p576)

		return p576
	end

	local color3235 = Color3.fromRGB(0, 0, 0)
	local v1225 = uDim2New(1, 0, 2, 0)
	local v1226 = uDim2New(0.5, 0, 0.5, 0)
	local v1227 = effectsServiceNewerCircle(p572, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3235,
		Size = v1225,
		Position = v1226
	})

	table.insert(t28, v1227)
	animation.AnimateAsync(v1227, { BackgroundTransparency = 0.4 }, 0.3, "Out", "Quint")

	local u1228: boolean = false

	local function cleanup()
		if u1228 then
			return
		end

		u1228 = true

		if v1227 and v1227.Parent then
			animation.AnimateAsync(v1227, { BackgroundTransparency = 1 }, 0.25, "Out", "Quint")
		end

		task.delay(0.3, function()
			for _, v in ipairs(t28) do
				if v and v.Parent then
					v:Destroy()
				end
			end
		end)
	end

	local n1 = p574.ZIndex + 10000
	local uDim2 = UDim2.new(0, p574.AbsoluteSize.X * 0.8, 0, p574.AbsoluteSize.X * 0.8)
	local uDim264 = UDim2.new(0, p573.AbsolutePosition.X + p573.AbsoluteSize.X / 2, 0, p573.AbsolutePosition.Y + p573.AbsoluteSize.Y / 2)
	local color3236 = Color3.fromRGB(255, 255, 255)

	v1226 = effectsServiceNewerCircle(p572, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://10236705400",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim264,
		ImageColor3 = color3236
	})
	table.insert(t28, v1226)
	effectsService.TweenProperty(v1226, "ImageTransparency", 1, 0, 0.3)

	local uDim265 = UDim2.new(0, p574.AbsolutePosition.X, 0, p574.AbsolutePosition.Y)
	local uDim266 = UDim2.new(0, p574.AbsoluteSize.X * 0.5, 0, p574.AbsoluteSize.Y * 0.5)

	v1226:TweenPosition(uDim265 + uDim266, "Out", "Quint", 0.6, true)
	task.wait(0.75)

	if not p574 or not p574.Parent then
		cleanup()

		return
	end

	if p574.AbsoluteSize.X <= 0 or p574.AbsoluteSize.Y <= 0 then
		cleanup()

		return
	end

	local v1236 = UDim2.fromOffset(p574.AbsoluteSize.X * 3, 0)
	local v1237 = UDim2.fromScale(0, -1)
	local v1238 = UDim2.fromOffset(p574.AbsolutePosition.X + p574.AbsoluteSize.X / 2, 0)
	local v1239 = effectsServiceNewerCircle(p572, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1236,
		Position = v1237 + v1238,
		AnchorPoint = Vector2.new(0.5, 1)
	})

	table.insert(t28, v1239)
	v1237 = UDim2.fromOffset(p574.AbsoluteSize.X * 3, 0)

	local uDim267 = UDim2.new(0, p574.AbsolutePosition.X, 0, p574.AbsolutePosition.Y)
	local uDim268 = UDim2.new(0, p574.AbsoluteSize.X * 0.5, 0, p574.AbsoluteSize.Y * 0.5)
	local v1242 = UDim2.fromScale(0, 1.25)
	local v1243 = effectsServiceNewerCircle(p572, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1237,
		Position = uDim267 + uDim268 + v1242
	})

	table.insert(t28, v1243)
	task.spawn(function()
		if not p574 or not p574.Parent then
			return
		end

		if not v1239 or not v1239.Parent then
			return
		end

		if not v1243 or not v1243.Parent then
			return
		end

		local t77: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255) }
		local v2923 = UDim2.fromOffset(p574.AbsoluteSize.X * 0.8, p574.AbsoluteSize.X * 0.3)

		effectsServiceEmit(p572, v1243, {
			Projectile = "rbxassetid://243728206",
			Strength = 2000,
			Speed = 0.8,
			EasingStyle = "Linear",
			Time = 2.5,
			Color = t77,
			Size = v2923,
			Range = v1239,
			ZIndex = p574.ZIndex + 15000
		})
	end)
	task.wait(0.3)

	if not p574 or not p574.Parent then
		cleanup()

		return
	end

	audioServicePlaySound("velkozult")

	if v1226 and v1226.Parent then
		v1226:Destroy()
	end

	if not p574 or not p574.Parent then
		cleanup()

		return
	end

	if p574.AbsoluteSize.X <= 0 or p574.AbsoluteSize.Y <= 0 then
		cleanup()

		return
	end

	p574.ImageColor3 = Color3.fromRGB(40, 40, 40)

	local color3237 = Color3.fromRGB(255, 255, 255)

	v1242 = UDim2.fromOffset(p574.AbsoluteSize.X * 1.2, 0)

	local v1245 = UDim2.fromScale(0, 2.5)
	local uDim269 = UDim2.new(0, p574.AbsolutePosition.X, 0, p574.AbsolutePosition.Y)
	local uDim270 = UDim2.new(0, p574.AbsoluteSize.X * 0.5, 0, p574.AbsoluteSize.Y * 0.5)
	local v1248 = effectsServiceNewerCircle(p572, {
		Image = "rbxassetid://10248621823",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = color3237,
		Size = v1242 + v1245,
		Position = uDim269 + uDim270,
		ZIndex = p574.ZIndex + 10000
	})

	table.insert(t28, v1248)
	task.spawn(function()
		for _ = 1, 20 do
			if not v1248 or not v1248.Parent then
				return
			end

			local v2925 = v1248

			v2925.Rotation = v2925.Rotation + 180
			task.wait(0.1)
		end
	end)
	task.spawn(function()
		if v1248 and v1248.Parent then
			effectsService.Shake(v1248, v1248.Position, 2, 0.05)
		end
	end)
	task.spawn(function()
		if p572 and p572.Parent then
			effectsService.ShakeBattle(p572, 1, 0.05)
		end
	end)

	local animationAnimate = animation.Animate

	v1238 = UDim2.fromScale(0, 2.5)
	animationAnimate(v1248, { Size = v1238 }, 3, "In", "Quint")
	cleanup()
end
function module.AzurelessShot(p577, p578, p579, _)
	audioServicePlaySound("LaserChargeup")

	if not p577 or not p577.Parent then
		return
	end

	if not p578 or not p578.Parent then
		return
	end

	if not p579 or not p579.Parent then
		return
	end

	if p579.AbsoluteSize.X <= 0 or p579.AbsoluteSize.Y <= 0 then
		return
	end

	local t29: {[any]: any} = {}

	local function track(p581)
		table.insert(t29, p581)

		return p581
	end

	local color3238 = Color3.fromRGB(0, 0, 0)
	local v1257 = uDim2New(1, 0, 2, 0)
	local v1258 = uDim2New(0.5, 0, 0.5, 0)
	local v1259 = effectsServiceNewerCircle(p577, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3238,
		Size = v1257,
		Position = v1258
	})

	table.insert(t29, v1259)
	animation.AnimateAsync(v1259, { BackgroundTransparency = 0.4 }, 0.3, "Out", "Quint")

	local u1260: boolean = false

	local function cleanup()
		if u1260 then
			return
		end

		u1260 = true

		if v1259 and v1259.Parent then
			animation.AnimateAsync(v1259, { BackgroundTransparency = 1 }, 0.25, "Out", "Quint")
		end

		task.delay(0.3, function()
			for _, v in ipairs(t29) do
				if v and v.Parent then
					v:Destroy()
				end
			end
		end)
	end

	local n1 = p579.ZIndex + 10000
	local uDim2 = UDim2.new(0, p579.AbsoluteSize.X * 1.5, 0, p579.AbsoluteSize.X * 1.5)
	local uDim271 = UDim2.new(0, p578.AbsolutePosition.X + p578.AbsoluteSize.X / 2, 0, p578.AbsolutePosition.Y + p578.AbsoluteSize.Y / 2)
	local color3239 = Color3.fromRGB(189, 55, 55)

	v1258 = effectsServiceNewerCircle(p577, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://8573813156",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim271,
		ImageColor3 = color3239
	})
	table.insert(t29, v1258)
	effectsService.TweenProperty(v1258, "ImageTransparency", 1, 0, 0.3)

	local uDim272 = UDim2.new(0, p579.AbsolutePosition.X, 0, p579.AbsolutePosition.Y)
	local uDim273 = UDim2.new(0, p579.AbsoluteSize.X * 0.5, 0, p579.AbsoluteSize.Y * 0.5)

	v1258:TweenPosition(uDim272 + uDim273, "Out", "Quint", 0.6, true)
	task.wait(0.75)

	if not p579 or not p579.Parent then
		cleanup()

		return
	end

	if p579.AbsoluteSize.X <= 0 or p579.AbsoluteSize.Y <= 0 then
		cleanup()

		return
	end

	local v1268 = UDim2.fromOffset(p579.AbsoluteSize.X * 3, 0)
	local v1269 = UDim2.fromScale(0, -1)
	local v1270 = UDim2.fromOffset(p579.AbsolutePosition.X + p579.AbsoluteSize.X / 2, 0)
	local v1271 = effectsServiceNewerCircle(p577, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1268,
		Position = v1269 + v1270,
		AnchorPoint = Vector2.new(0.5, 1)
	})

	table.insert(t29, v1271)
	v1269 = UDim2.fromOffset(p579.AbsoluteSize.X * 3, 0)

	local uDim274 = UDim2.new(0, p579.AbsolutePosition.X, 0, p579.AbsolutePosition.Y)
	local uDim275 = UDim2.new(0, p579.AbsoluteSize.X * 0.5, 0, p579.AbsoluteSize.Y * 0.5)
	local v1274 = UDim2.fromScale(0, 1.25)
	local v1275 = effectsServiceNewerCircle(p577, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1269,
		Position = uDim274 + uDim275 + v1274
	})

	table.insert(t29, v1275)
	task.spawn(function()
		if not p579 or not p579.Parent then
			return
		end

		if not v1271 or not v1271.Parent then
			return
		end

		if not v1275 or not v1275.Parent then
			return
		end

		local t78: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255) }
		local v2928 = UDim2.fromOffset(p579.AbsoluteSize.X * 0.8, p579.AbsoluteSize.X * 0.3)

		effectsServiceEmit(p577, v1275, {
			Projectile = "rbxassetid://243728206",
			Strength = 2000,
			Speed = 0.8,
			EasingStyle = "Linear",
			Time = 2.5,
			Color = t78,
			Size = v2928,
			Range = v1271,
			ZIndex = p579.ZIndex + 15000
		})
	end)
	task.wait(0.3)

	if not p579 or not p579.Parent then
		cleanup()

		return
	end

	audioServicePlaySound("velkozult")

	if v1258 and v1258.Parent then
		v1258:Destroy()
	end

	if not p579 or not p579.Parent then
		cleanup()

		return
	end

	if p579.AbsoluteSize.X <= 0 or p579.AbsoluteSize.Y <= 0 then
		cleanup()

		return
	end

	p579.ImageColor3 = Color3.fromRGB(40, 40, 40)

	local color3240 = Color3.fromRGB(255, 255, 255)

	v1274 = UDim2.fromOffset(p579.AbsoluteSize.X * 1.2, 0)

	local v1277 = UDim2.fromScale(0, 2.5)
	local uDim276 = UDim2.new(0, p579.AbsolutePosition.X, 0, p579.AbsolutePosition.Y)
	local uDim277 = UDim2.new(0, p579.AbsoluteSize.X * 0.5, 0, p579.AbsoluteSize.Y * 0.5)
	local v1280 = effectsServiceNewerCircle(p577, {
		Image = "rbxassetid://13780741946",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = color3240,
		Size = v1274 + v1277,
		Position = uDim276 + uDim277,
		ZIndex = p579.ZIndex + 10000
	})

	table.insert(t29, v1280)
	task.spawn(function()
		for _ = 1, 20 do
			if not v1280 or not v1280.Parent then
				return
			end

			local v2930 = v1280

			v2930.Rotation = v2930.Rotation + 180
			task.wait(0.1)
		end
	end)
	task.spawn(function()
		if v1280 and v1280.Parent then
			effectsService.Shake(v1280, v1280.Position, 2, 0.05)
		end
	end)
	task.spawn(function()
		if p577 and p577.Parent then
			effectsService.ShakeBattle(p577, 1, 0.05)
		end
	end)

	local animationAnimate = animation.Animate

	v1270 = UDim2.fromScale(0, 2.5)
	animationAnimate(v1280, { Size = v1270 }, 3, "In", "Quint")
	cleanup()
end
function module.GiverTrap(p582, _, p584, _)
	local color3241 = Color3.fromRGB(41, 120, 239)
	local color3242 = Color3.fromRGB(239, 49, 52)
	local color3243 = Color3.fromRGB(239, 169, 49)
	local color3244 = Color3.fromRGB(41, 239, 54)
	local t30: {[any]: any} = {
		color3241,
		color3242,
		color3243,
		color3244,
		Color3.fromRGB(239, 210, 210)
	}
	local randomNumber = math.random(#t30)
	local v1292 = t30[randomNumber]
	local absoluteSize = p584.AbsoluteSize
	local v1294 = UDim2.fromOffset(absoluteSize.X * 1.1, absoluteSize.Y * 1.1)
	local uDim2 = UDim2.new(0, p584.AbsolutePosition.X, 0, p584.AbsolutePosition.Y)
	local uDim278 = UDim2.new(0, p584.AbsoluteSize.X * 0.5, 0, p584.AbsoluteSize.Y * 0.5)
	local v1297 = effectsServiceNewerCircle(p582, {
		BackgroundTransparency = 0.2,
		ImageTransparency = 1,
		BorderSizePixel = 2,
		BackgroundColor3 = v1292,
		Size = v1294,
		Position = uDim2 + uDim278,
		ZIndex = p584.ZIndex + 14999
	})
	local color3245 = Color3.fromRGB(255, 255, 255)
	local v1299 = UDim2.fromOffset(absoluteSize.X * 1.2, absoluteSize.Y * 0.2)
	local uDim279 = UDim2.new(0, p584.AbsolutePosition.X, 0, p584.AbsolutePosition.Y)
	local uDim280 = UDim2.new(0, p584.AbsoluteSize.X * 0.5, 0, p584.AbsoluteSize.Y * 0.5)
	local v1302 = effectsServiceNewerCircle(p582, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		BorderSizePixel = 2,
		BackgroundColor3 = color3245,
		Size = v1299,
		Position = uDim279 + uDim280,
		ZIndex = p584.ZIndex + 15000
	})

	audioServicePlaySound("bass.wav")
	effectsService.Shake(v1297, v1297.Position, 0.5, 0.2)
	task.spawn(function()
		task.wait(0.2)
		animation.AnimateAsync(v1297, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
		animation.Animate(v1302, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
		v1297:Destroy()
		v1302:Destroy()
	end)
end
function module.SpawnSymbol(p586, p587, p588, p589)
	audioServicePlaySound("clock tick")

	local color3246 = Color3.fromRGB(111, 111, 111)
	local color3247 = Color3.fromRGB(255, 255, 255)

	effectsServiceFlagEffect(p586, p587, p588, p589, "rbxassetid://115313832263075", 1.2, color3246, color3247, 360)
	task.wait(0.2)
	audioServicePlaySound("clock tick")
	task.wait(0.2)
end
function module.HexagonBuff(p590, p591, p592, p593)
	audioServicePlaySound("spawn05")

	local color3248 = Color3.fromRGB(0, 242, 255)
	local color3249 = Color3.fromRGB(16, 171, 255)

	effectsServiceFlagEffect(p590, p591, p592, p593, "rbxassetid://14353374946", 1.2, color3248, color3249, 0, 0.75, 0.15, 1, 0.1, 1.5)
end
function module.HexagonDebuff(p594, p595, p596, p597)
	audioServicePlaySound("spawn04")

	local color3250 = Color3.fromRGB(213, 0, 0)
	local color3251 = Color3.fromRGB(143, 0, 0)

	effectsServiceFlagEffect(p594, p595, p596, p597, "rbxassetid://14353374946", 1.2, color3250, color3251, 0, 0.75, 0.15, 1, 0.1, 1.5)
end
function module.RedcliffFlagEffect(p598, p599, p600, p601)
	audioServicePlaySound("unsheath")

	local color3252 = Color3.fromRGB(255, 255, 255)
	local color3253 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagEffect(p598, p599, p600, p601, "rbxassetid://8652408406", 1.2, color3252, color3253, 360)
end
function module.OverseerEffect(p602, p603, p604, p605)
	audioServicePlaySound("demise2")

	local color3254 = Color3.fromRGB(255, 255, 255)
	local color3255 = Color3.fromRGB(47, 175, 8)
	local randomNumber = math.random(350, 370)

	effectsServiceFlagEffect(p602, p603, p604, p605, "rbxassetid://12995620588", 1.2, color3254, color3255, randomNumber, 0.2, 0.2)
end
function module.LinkedSwordFlagEffect(p606, p607, p608, p609)
	audioServicePlaySound("unsheath")

	local color3256 = Color3.fromRGB(255, 255, 255)
	local color3257 = Color3.fromRGB(127, 119, 60)

	effectsServiceFlagEffect(p606, p607, p608, p609, "rbxassetid://12192587180", 1.6, color3256, color3257, 300)
end
function module.GravCoilEffect(p610, p611, p612, p613)
	audioServicePlaySound("GravCoil")

	local color3258 = Color3.fromRGB(255, 255, 255)
	local color3259 = Color3.fromRGB(7, 94, 171)

	effectsServiceFlagEffect(p610, p611, p612, p613, "rbxassetid://13334906706", 1.5, color3258, color3259, 330)
end
function module.RegenCoilEffect(p614, p615, p616, p617)
	audioServicePlaySound("GravCoil")

	local color3260 = Color3.fromRGB(255, 255, 255)
	local color3261 = Color3.fromRGB(10, 166, 15)

	effectsServiceFlagEffect(p614, p615, p616, p617, "rbxassetid://13334907982", 1.5, color3260, color3261, 330, 0.25, 0.15)
end
function module.SearchEffect(p618, p619, p620, p621)
	audioServicePlaySound("Target Or Select Low")

	local color3262 = Color3.fromRGB(255, 255, 255)
	local color3263 = Color3.fromRGB(76, 76, 76)

	effectsServiceFlagSelf(p618, p619, p620, p621, "rbxassetid://11496279085", 1.1, color3262, color3263, 0)
end
function module.RedEyesSelf(p622, p623, p624, p625)
	task.spawn(function()
		audioServicePlaySound("HammerImpact")
		module.SelfPulseRed(p622, p623, p624, nil, nil)
	end)
	task.wait(0.2)
	audioServicePlaySound("Woosh")

	local color3264 = Color3.fromRGB(255, 255, 255)
	local color3265 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagSelf(p622, p623, p624, p625, "rbxassetid://3086725739", 1.5, color3264, color3265, 0)
end
function module.RainbowSelf(p626, p627, p628, p629)
	local t31: {[any]: any} = { "Foil1", "Foil2", "Foil3", "incoming foil", "warp star" }
	local randomNumber = math.random(1, #t31)

	audioServicePlaySound(t31[randomNumber])

	local color3266 = Color3.fromRGB(255, 255, 255)
	local color3267 = Color3.fromRGB(213, 213, 213)

	effectsServiceFlagSelf(p626, p627, p628, p629, "rbxassetid://7178236237", 1.2, color3266, color3267, 360, 0.75, 0.1, 1, 0.1, 1.75)
end
function module.CameraSelf(p630, p631, p632, p633)
	audioServicePlaySound("CameraShutter")

	local color3268 = Color3.fromRGB(199, 199, 199)
	local color3269 = Color3.fromRGB(77, 77, 77)

	effectsServiceFlagSelf(p630, p631, p632, p633, "rbxassetid://8474920817", 1.2, color3268, color3269, 360)
end
function module.BattleaxeSelf(p634, p635, p636, p637)
	audioServicePlaySound("unsheath")

	local color3270 = Color3.fromRGB(255, 255, 255)
	local color3271 = Color3.fromRGB(124, 114, 94)

	effectsServiceFlagSelf(p634, p635, p636, p637, "rbxassetid://12281809503", 1.2, color3270, color3271, 0)
end
function module.RedcliffFlagSelf(p638, p639, p640, p641)
	audioServicePlaySound("unsheath")

	local color3272 = Color3.fromRGB(255, 255, 255)
	local color3273 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagSelf(p638, p639, p640, p641, "rbxassetid://8652408406", 1.2, color3272, color3273, 360)
end
function module.RedcliffLogoSelf(p642, p643, p644, p645)
	audioServicePlaySound("unsheath")

	if math.random(1, 2) == 1 then
		audioServicePlaySound("RedcliffYell")
	else
		audioServicePlaySound("Lunge")
	end

	local color3274 = Color3.fromRGB(255, 255, 255)
	local color3275 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagSelf(p642, p643, p644, p645, "rbxassetid://58454662", 1.2, color3274, color3275, 0, 0.25, 0.1)
	wait(0.35)
end
function module.HallowScytheSelf(p646, p647, p648, p649)
	audioServicePlaySound("PreSlash")
	audioServicePlaySound("HallowLaugh")
	p647.Rotation = math.random(-25, 25)
	animation.AnimateAsync(p647, { Rotation = 0 }, 0.8, "Out", "Quint")

	local color3276 = Color3.fromRGB(255, 255, 255)
	local color3277 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagSelf(p646, p647, p648, p649, "rbxassetid://12250668510", 2, color3276, color3277, 360)
end
function module.OverseerSelf(p650, p651, p652, p653)
	audioServicePlaySound("demise2")

	local color3278 = Color3.fromRGB(255, 255, 255)
	local color3279 = Color3.fromRGB(47, 175, 8)
	local randomNumber = math.random(350, 370)

	effectsServiceFlagSelf(p650, p651, p652, p653, "rbxassetid://12995620588", 1.2, color3278, color3279, randomNumber, 0.2, 0.2)
end
function module.LinkedSwordFlagSelf(p654, p655, p656, p657)
	audioServicePlaySound("unsheath")

	local color3280 = Color3.fromRGB(255, 255, 255)
	local color3281 = Color3.fromRGB(127, 119, 60)

	effectsServiceFlagSelf(p654, p655, p656, p657, "rbxassetid://12192587180", 1.6, color3280, color3281, 300)
end
function module.RegenCoilSelf(p658, p659, p660, p661)
	audioServicePlaySound("GravCoil")

	local color3282 = Color3.fromRGB(255, 255, 255)
	local color3283 = Color3.fromRGB(10, 166, 15)

	effectsServiceFlagSelf(p658, p659, p660, p661, "rbxassetid://13334907982", 1.5, color3282, color3283, 330, 0.25, 0.15)
end
function module.SoulyLeer(p662, p663, p664, p665)
	audioServicePlaySound("Ascend")
	audioServicePlaySound("evillaugh")
	task.spawn(function()
		local color3284 = Color3.fromRGB(145, 47, 230)

		effectsServicePulse(p662, p664, {
			Time = 1.5,
			FlashTime = 1.25,
			Color = { color3284, Color3.fromRGB(41, 31, 66) },
			Transparency = 0.15,
			SizeMultiplier = 1.2,
			ZIndex = p664.ZIndex + 15000
		})
	end)

	local color3285 = Color3.fromRGB(255, 255, 255)
	local color3286 = Color3.fromRGB(255, 255, 255)

	effectsServiceFlagSelf(p662, p663, p664, p665, "rbxassetid://7280031232", 3, color3285, color3286, 0)
	audioServicePlaySound("Target Or Select Low")
	task.wait(1.25)
end
function Stack(p666, _, p668, _, p670, p671, p672, p673)
	local v1435 = UDim2.fromOffset(p668.AbsoluteSize.Y * 1.2, p668.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p668.AbsolutePosition.X, 0, p668.AbsolutePosition.Y)
	local uDim281 = UDim2.new(0, p668.AbsoluteSize.X * 0.5, 0, p668.AbsoluteSize.Y * 0.5)
	local v1438 = effectsServiceNewerCircle(p666, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1435,
		Position = uDim2 + uDim281
	})
	local v1439 = UDim2.fromOffset(p668.AbsoluteSize.X / p671, p668.AbsoluteSize.X / p671)
	local color3287 = Color3.fromRGB(255, 255, 255)

	audioServicePlaySound("cashregister")

	local t32: {[any]: any} = {
		Time = 0.5,
		Projectile = p670,
		Size = v1439,
		Color = { color3287, p672 },
		Strength = p673
	}

	task.spawn(function()
		effectsServiceBreath(p666, p668, v1438, t32)
	end)
end
function StackSelf(p674, p675, _, _, p678, p679, p680, p681, p682)
	local v1451 = UDim2.fromOffset(p675.AbsoluteSize.Y * 1.2, p675.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p675.AbsolutePosition.X, 0, p675.AbsolutePosition.Y)
	local uDim282 = UDim2.new(0, p675.AbsoluteSize.X * 0.5, 0, p675.AbsoluteSize.Y * 0.5)
	local v1454 = effectsServiceNewerCircle(p674, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v1451,
		Position = uDim2 + uDim282
	})
	local v1455 = UDim2.fromOffset(p675.AbsoluteSize.X / p679, p675.AbsoluteSize.X / p679)
	local color3288 = Color3.fromRGB(255, 255, 255)
	local t33: {[any]: any} = {
		Time = 0.5,
		Projectile = p678,
		Size = v1455,
		Color = { color3288, p680 },
		Strength = p681
	}

	if not p682 then
		audioServicePlaySound("cashregister")
	end

	task.spawn(function()
		effectsServiceBreath(p674, p675, v1454, t33)
	end)
end
function module.TixStack(p683, p684, p685, p686)
	local color3289 = Color3.fromRGB(255, 255, 255)

	Stack(p683, p684, p685, p686, "rbxassetid://10658565857", 3, color3289, 100)
end
function module.RobuxStack(p687, p688, p689, p690)
	local color3290 = Color3.fromRGB(255, 255, 255)

	Stack(p687, p688, p689, p690, "rbxassetid://10658626571", 3, color3290, 100)
end
function module.CoinStack(p691, p692, p693, p694)
	local color3291 = Color3.fromRGB(255, 255, 255)

	Stack(p691, p692, p693, p694, "rbxassetid://81254494611917", 3, color3291, 100)
end
function module.MoneyStack(p695, p696, p697, p698)
	local color3292 = Color3.fromRGB(210, 255, 225)

	Stack(p695, p696, p697, p698, "rbxassetid://8971870792", 2, color3292, 80)
end
function module.MoneyStackSelf(p699, p700, p701, p702)
	local color3293 = Color3.fromRGB(210, 255, 225)

	StackSelf(p699, p700, p701, p702, "rbxassetid://8971870792", 2, color3293, 80)
end
function module.TixStackSelf(p703, p704, p705, p706)
	local color3294 = Color3.fromRGB(255, 249, 249)

	StackSelf(p703, p704, p705, p706, "rbxassetid://10658565857", 2, color3294, 100)
end
function module.TixStackEffect(p707, p708, p709, _)
	module.TixStack(p707, p708, p709, nil, nil)
end
function module.MoneyStackEffect(p711, p712, p713, _)
	module.MoneyStack(p711, p712, p713, nil, nil)
end
function module.MoneyStackSelfEffect(p715, p716, p717, _)
	module.MoneyStackSelf(p715, p716, p717, nil, nil)
end
function module.RobuxStackEffect(p719, p720, p721, _)
	module.RobuxStack(p719, p720, p721, nil, nil)
end
local function EmotionSwirl(p723, p724, p725, p726, p727, p728, p729, p730, p731, p732, p733)
	task.spawn(function()
		StackSelf(p723, p724, p725, p726, p730, p731, p732, p733, true)
	end)
	audioServicePlaySound(p727)
	audioServicePlaySound("WooshEmotion")

	for i = 1, 2 do
		task.spawn(function()
			local n1 = p724.ZIndex + 100001
			local v2933 = UDim2.fromOffset(p724.AbsoluteSize.X, p724.AbsoluteSize.X)
			local v2934 = p724
			local uDim2 = UDim2.new(0, v2934.AbsolutePosition.X, 0, v2934.AbsolutePosition.Y)
			local uDim283 = UDim2.new(0, v2934.AbsoluteSize.X * 0.5, 0, v2934.AbsoluteSize.Y * 0.5)
			local randomNumber = math.random(0, 360)
			local v2938 = effectsServiceNewerCircle(p723, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v2933,
				Position = uDim2 + uDim283,
				Rotation = randomNumber
			})

			v2934 = p724.ZIndex + 100001

			local v2939 = UDim2.fromOffset(p724.AbsoluteSize.X, p724.AbsoluteSize.X)
			local v2940 = p724
			local uDim284 = UDim2.new(0, v2940.AbsolutePosition.X, 0, v2940.AbsolutePosition.Y)
			local uDim285 = UDim2.new(0, v2940.AbsoluteSize.X * 0.5, 0, v2940.AbsoluteSize.Y * 0.5)
			local v2943 = effectsServiceNewerCircle(p723, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v2934,
				Size = v2939,
				Position = uDim284 + uDim285,
				Rotation = i * 90 + 180,
				ImageColor3 = p728
			})

			v2940 = p724.ZIndex + 100001

			local v2944 = UDim2.fromOffset(p724.AbsoluteSize.X, p724.AbsoluteSize.X)
			local v2945 = p724
			local uDim286 = UDim2.new(0, v2945.AbsolutePosition.X, 0, v2945.AbsolutePosition.Y)
			local uDim287 = UDim2.new(0, v2945.AbsoluteSize.X * 0.5, 0, v2945.AbsoluteSize.Y * 0.5)
			local v2948 = effectsServiceNewerCircle(p723, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v2940,
				Size = v2944,
				Position = uDim286 + uDim287,
				ImageColor3 = p729,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v2945 = UDim2.fromOffset(p724.AbsoluteSize.Y * 1.5, p724.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v2938, { Size = v2945, Rotation = v2938.Rotation + 360 }, 1, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v2945 = UDim2.fromOffset(p724.AbsoluteSize.Y * 1.3, p724.AbsoluteSize.Y * 1.3)
			animateAsync(v2943, { Size = v2945, Rotation = v2943.Rotation + 360 }, 1, "Out", "Quint")

			local v2951 = animation.AnimateAsync

			v2945 = UDim2.fromOffset(p724.AbsoluteSize.Y * 1.1, p724.AbsoluteSize.Y * 1.1)
			v2951(v2948, { Size = v2945, Rotation = v2948.Rotation + 360 }, 1, "Out", "Quint")
			task.wait(0.5)
			animation.AnimateAsync(v2938, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v2943, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			animation.AnimateAsync(v2948, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
			task.spawn(function()
				task.wait(1.5)
				v2938:Destroy()
				v2943:Destroy()
				v2948:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.WrathEmotionSwirl(p734, p735, p736, p737)
	local color3295 = Color3.fromRGB(255, 0, 0)
	local color3296 = Color3.fromRGB(100, 9, 11)
	local color3297 = Color3.fromRGB(255, 249, 249)

	EmotionSwirl(p734, p735, p736, p737, "Wrath", color3295, color3296, "rbxassetid://1187600681", 2, color3297, 30)
end
function module.DepressionEmotionSwirl(p738, p739, p740, p741)
	local color3298 = Color3.fromRGB(0, 4, 255)
	local color3299 = Color3.fromRGB(0, 0, 100)
	local color3300 = Color3.fromRGB(255, 249, 249)

	EmotionSwirl(p738, p739, p740, p741, "Sleepy", color3298, color3299, "rbxassetid://16892583914", 2, color3300, 30)
end
function module.EnvyEmotionSwirl(p742, p743, p744, p745)
	local color3301 = Color3.fromRGB(0, 255, 64)
	local color3302 = Color3.fromRGB(5, 100, 24)
	local color3303 = Color3.fromRGB(255, 249, 249)

	EmotionSwirl(p742, p743, p744, p745, "Jealousy", color3301, color3302, "rbxassetid://7333577500", 2, color3303, 30)
end
function module.GreedEmotionSwirl(p746, p747, p748, p749)
	local color3304 = Color3.fromRGB(255, 170, 0)
	local color3305 = Color3.fromRGB(100, 59, 1)
	local color3306 = Color3.fromRGB(255, 249, 249)

	EmotionSwirl(p746, p747, p748, p749, "cashregister", color3304, color3305, "rbxassetid://1600534477", 2, color3306, 30)
end
function module.DarkEmotionSelfFlag(p750, p751, p752, p753)
	task.spawn(function()
		audioServicePlaySound("WooshEmotion")

		for i = 1, 2 do
			task.spawn(function()
				local n1 = p751.ZIndex + 100001
				local v3132 = UDim2.fromOffset(p751.AbsoluteSize.X, p751.AbsoluteSize.X)
				local v3133 = p751
				local uDim2 = UDim2.new(0, v3133.AbsolutePosition.X, 0, v3133.AbsolutePosition.Y)
				local uDim288 = UDim2.new(0, v3133.AbsoluteSize.X * 0.5, 0, v3133.AbsoluteSize.Y * 0.5)
				local randomNumber = math.random(0, 360)
				local v3137 = effectsServiceNewerCircle(p750, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = "rbxassetid://3916186365",
					ZIndex = n1,
					Size = v3132,
					Position = uDim2 + uDim288,
					Rotation = randomNumber
				})

				v3133 = p751.ZIndex + 100001

				local v3138 = UDim2.fromOffset(p751.AbsoluteSize.X, p751.AbsoluteSize.X)
				local v3139 = p751
				local uDim289 = UDim2.new(0, v3139.AbsolutePosition.X, 0, v3139.AbsolutePosition.Y)
				local uDim290 = UDim2.new(0, v3139.AbsoluteSize.X * 0.5, 0, v3139.AbsoluteSize.Y * 0.5)
				local color3307 = Color3.fromRGB(12, 12, 12)
				local v3143 = effectsServiceNewerCircle(p750, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://6250126210",
					ZIndex = v3133,
					Size = v3138,
					Position = uDim289 + uDim290,
					Rotation = i * 90 + 180,
					ImageColor3 = color3307
				})

				v3139 = p751.ZIndex + 100001

				local v3144 = UDim2.fromOffset(p751.AbsoluteSize.X, p751.AbsoluteSize.X)
				local v3145 = p751
				local uDim291 = UDim2.new(0, v3145.AbsolutePosition.X, 0, v3145.AbsolutePosition.Y)
				local uDim292 = UDim2.new(0, v3145.AbsoluteSize.X * 0.5, 0, v3145.AbsoluteSize.Y * 0.5)
				local color3308 = Color3.fromRGB(44, 44, 44)
				local v3149 = effectsServiceNewerCircle(p750, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://6250126210",
					ZIndex = v3139,
					Size = v3144,
					Position = uDim291 + uDim292,
					ImageColor3 = color3308,
					Rotation = i * 90 + 360
				})
				local animationAnimateAsync = animation.AnimateAsync

				v3145 = UDim2.fromOffset(p751.AbsoluteSize.Y * 1.5, p751.AbsoluteSize.Y * 1.5)
				animationAnimateAsync(v3137, { Size = v3145, Rotation = v3137.Rotation + 360 }, 1, "Out", "Quint")

				local animateAsync = animation.AnimateAsync

				v3145 = UDim2.fromOffset(p751.AbsoluteSize.Y * 1.3, p751.AbsoluteSize.Y * 1.3)
				animateAsync(v3143, { Size = v3145, Rotation = v3143.Rotation + 360 }, 1, "Out", "Quint")

				local v3152 = animation.AnimateAsync

				v3145 = UDim2.fromOffset(p751.AbsoluteSize.Y * 1.1, p751.AbsoluteSize.Y * 1.1)
				v3152(v3149, { Size = v3145, Rotation = v3149.Rotation + 360 }, 1, "Out", "Quint")
				task.wait(0.5)
				animation.AnimateAsync(v3137, { ImageTransparency = 1 }, 1, "Out", "Quint")
				animation.AnimateAsync(v3143, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
				animation.AnimateAsync(v3149, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
				task.spawn(function()
					task.wait(1.5)
					v3137:Destroy()
					v3143:Destroy()
					v3149:Destroy()
				end)
			end)
			task.wait(0.2)
		end
	end)
	audioServicePlaySound("StalkerRage")

	local color3309 = Color3.fromRGB(255, 255, 255)
	local color3310 = Color3.fromRGB(166, 37, 37)

	effectsServiceFlagSelf(p750, p751, p752, p753, "rbxassetid://3086725739", 1.5, color3309, color3310, 0)
end
function module.BlueSwirlSelfFlag(p754, p755, _, _)
	task.spawn(function()
		audioServicePlaySound("WooshEmotion")

		for i = 1, 2 do
			task.spawn(function()
				local n1 = p755.ZIndex + 100001
				local v3154 = UDim2.fromOffset(p755.AbsoluteSize.X, p755.AbsoluteSize.X)
				local v3155 = p755
				local uDim2 = UDim2.new(0, v3155.AbsolutePosition.X, 0, v3155.AbsolutePosition.Y)
				local uDim293 = UDim2.new(0, v3155.AbsoluteSize.X * 0.5, 0, v3155.AbsoluteSize.Y * 0.5)
				local randomNumber = math.random(0, 360)
				local v3159 = effectsServiceNewerCircle(p754, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = "rbxassetid://3916186365",
					ZIndex = n1,
					Size = v3154,
					Position = uDim2 + uDim293,
					Rotation = randomNumber
				})

				v3155 = p755.ZIndex + 100001

				local v3160 = UDim2.fromOffset(p755.AbsoluteSize.X, p755.AbsoluteSize.X)
				local v3161 = p755
				local uDim294 = UDim2.new(0, v3161.AbsolutePosition.X, 0, v3161.AbsolutePosition.Y)
				local uDim295 = UDim2.new(0, v3161.AbsoluteSize.X * 0.5, 0, v3161.AbsoluteSize.Y * 0.5)
				local color3311 = Color3.fromRGB(36, 37, 100)
				local v3165 = effectsServiceNewerCircle(p754, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://6250126210",
					ZIndex = v3155,
					Size = v3160,
					Position = uDim294 + uDim295,
					Rotation = i * 90 + 180,
					ImageColor3 = color3311
				})

				v3161 = p755.ZIndex + 100001

				local v3166 = UDim2.fromOffset(p755.AbsoluteSize.X, p755.AbsoluteSize.X)
				local v3167 = p755
				local uDim296 = UDim2.new(0, v3167.AbsolutePosition.X, 0, v3167.AbsolutePosition.Y)
				local uDim297 = UDim2.new(0, v3167.AbsoluteSize.X * 0.5, 0, v3167.AbsoluteSize.Y * 0.5)
				local color3312 = Color3.fromRGB(21, 41, 168)
				local v3171 = effectsServiceNewerCircle(p754, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://6250126210",
					ZIndex = v3161,
					Size = v3166,
					Position = uDim296 + uDim297,
					ImageColor3 = color3312,
					Rotation = i * 90 + 360
				})
				local animationAnimateAsync = animation.AnimateAsync

				v3167 = UDim2.fromOffset(p755.AbsoluteSize.Y * 1.5, p755.AbsoluteSize.Y * 1.5)
				animationAnimateAsync(v3159, { Size = v3167, Rotation = v3159.Rotation + 360 }, 1, "Out", "Quint")

				local animateAsync = animation.AnimateAsync

				v3167 = UDim2.fromOffset(p755.AbsoluteSize.Y * 1.3, p755.AbsoluteSize.Y * 1.3)
				animateAsync(v3165, { Size = v3167, Rotation = v3165.Rotation + 360 }, 1, "Out", "Quint")

				local v3174 = animation.AnimateAsync

				v3167 = UDim2.fromOffset(p755.AbsoluteSize.Y * 1.1, p755.AbsoluteSize.Y * 1.1)
				v3174(v3171, { Size = v3167, Rotation = v3171.Rotation + 360 }, 1, "Out", "Quint")
				task.wait(0.5)
				animation.AnimateAsync(v3159, { ImageTransparency = 1 }, 1, "Out", "Quint")
				animation.AnimateAsync(v3165, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
				animation.AnimateAsync(v3171, { ImageTransparency = 1 }, 1.5, "Out", "Quint")
				task.spawn(function()
					task.wait(1.5)
					v3159:Destroy()
					v3165:Destroy()
					v3171:Destroy()
				end)
			end)
			task.wait(0.2)
		end
	end)
	audioServicePlaySound("Lunge")
	task.wait(0.5)
end
local function Bottle(p758, p759, p760, p761, _)
	local color3313 = Color3.fromRGB(148, 33, 33)
	local v1560 = UDim2.fromOffset(p760.AbsoluteSize.X / 1.25 * p761, p760.AbsoluteSize.Y / 1.25 * p761)

	audioServicePlaySound("BoomerangThrow")

	local v1561 = effectsServiceThrow(p758, p759, p760, {
		Time = 0.6 * p761,
		Color = color3313,
		Size = v1560,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = "rbxassetid://13934558395",
		Variation = 20 * p761,
		Rotation = { 0, 720 }
	})

	audioServicePlaySound("Glassbreak")
	v1561:Destroy()
end
function module.LargeBottle(p763, p764, p765, p766)
	Bottle(p763, p764, p765, 1)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3314 = Color3.fromRGB(240, 99, 43)
	local color3315 = Color3.fromRGB(217, 66, 39)
	local color3316 = Color3.fromRGB(240, 191, 65)
	local color3317 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p763, p764, p765, p766, 150, effectsServiceBreathimagesFire, "FireBreathLong", 0.8, color3314, color3315, color3316, color3317, 1.1, 0.9)
end
function module.MidBottle(p767, p768, p769, p770)
	Bottle(p767, p768, p769, 0.85)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3318 = Color3.fromRGB(240, 99, 43)
	local color3319 = Color3.fromRGB(217, 66, 39)
	local color3320 = Color3.fromRGB(240, 191, 65)
	local color3321 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p767, p768, p769, p770, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3318, color3319, color3320, color3321, 1.1, 0.9)
end
function module.SmallBottle(p771, p772, p773, p774)
	Bottle(p771, p772, p773, 0.65)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3322 = Color3.fromRGB(240, 99, 43)
	local color3323 = Color3.fromRGB(217, 66, 39)
	local color3324 = Color3.fromRGB(240, 191, 65)
	local color3325 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p771, p772, p773, p774, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3322, color3323, color3324, color3325, 1.1, 0.9)
end
function module.ThrowBottle(p775, p776, p777, p778)
	local color3326 = Color3.fromRGB(199, 146, 146)
	local v1594 = UDim2.fromOffset(p777.AbsoluteSize.X * 0.9, p777.AbsoluteSize.X * 0.9) -- FIX: bottle was half a card wide, hard to see

	audioServicePlaySound("BoomerangThrow")

	local v1595 = effectsServiceThrow(p775, p776, p777, {
		Time = 0.6,
		Color = color3326,
		Size = v1594,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = "rbxassetid://13934558395",
		Variation = 20,
		Rotation = { 0, 720 }
	})

	audioServicePlaySound("Glassbreak")
	v1595:Destroy()

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3327 = Color3.fromRGB(240, 99, 43)
	local color3328 = Color3.fromRGB(217, 66, 39)
	local color3329 = Color3.fromRGB(240, 191, 65)
	local color3330 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p775, p776, p777, p778, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3327, color3328, color3329, color3330, 1.1, 0.9)
end
function module.Poof(p779, _, p781, _)
	effectsServicePreloadTech(p779, effectsServiceBreathimages.smoke)

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t34: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
	local v1607 = UDim2.fromOffset(p781.AbsoluteSize.X, p781.AbsoluteSize.X)

	audioServicePlaySound("Toot")

	local t35: {[any]: any} = {
		Strength = 80,
		Time = 0.4,
		Speed = 0.25,
		Lifetime = 0.4,
		Transparency = 0.2,
		EasingStyle = "Quad",
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t34,
		Size = v1607
	}

	effectsServiceBreath(p779, p781, p781, t35)
	effectsServiceBreath(p779, p781, p781, t35)
	wait(0.4)
end
local function LifeGoesOnTarget(p783, _, p785, p786)
	local color3331 = Color3.fromRGB(81, 192, 223)
	local v1614 = effectsServiceEmit(p783, p785, p786, "Target Or Select Low", 1.5, color3331, Color3.fromRGB(156, 247, 255))
	local t36: {[any]: any} = { Color3.fromRGB(99, 160, 240), Color3.fromRGB(0, 116, 240) }
	local v1616 = UDim2.fromOffset(p785.AbsoluteSize.X * 0.6, p785.AbsoluteSize.X * 0.6)

	effectsServiceEmit(p783, p785, {
		Projectile = "rbxassetid://243728206",
		Strength = 90,
		Speed = 0.5,
		EasingStyle = "Quad",
		Time = 0.4,
		Color = t36,
		Size = v1616,
		Range = v1614
	})
	v1614:Destroy()
end
local function LifeGoesOntoDeck(p787, _, _, p790)
	local v1621 = p787.Parent.BattleNew["Virtual" .. p790 .. "Deck"]
	local color3332 = Color3.fromRGB(81, 192, 223)
	local v1623 = effectsServiceEmit(p787, v1621, p790, "bless", 1.5, color3332, Color3.fromRGB(156, 247, 255))
	local t37: {[any]: any} = { Color3.fromRGB(99, 160, 240), Color3.fromRGB(0, 116, 240) }
	local v1625 = UDim2.fromOffset(v1621.AbsoluteSize.X * 0.7, v1621.AbsoluteSize.X * 0.7)

	effectsServiceEmit(p787, v1621, {
		Projectile = "rbxassetid://243728206",
		Strength = 90,
		Speed = 0.6,
		EasingStyle = "Quad",
		Time = 0.6,
		Color = t37,
		Size = v1625,
		Range = v1623
	})
	v1623:Destroy()
end
function module.LifeGoesOn(p791, p792, p793, p794)
	LifeGoesOnTarget(p791, p792, p793, p794)
	task.wait(0.5)
	LifeGoesOntoDeck(p791, p792, p793, p794)
end
function module.BeamAlly(p795, p796, p797, p798)
	audioServicePlaySound("EntranceOfGreat")

	local t38: {[any]: any} = {}

	local function track(p799)
		table.insert(t38, p799)

		return p799
	end

	local s1

	if p798 == "" then
		s1 = ""
	elseif p798 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local v1638 = p795.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local sciFi = Enum.Font.SciFi
	local color3333 = Color3.fromRGB(255, 149, 19)
	local n1 = p796.ZIndex + 10000

	audioServicePlaySound("LaserChargeup")

	local t39: {[any]: any} = {
		Text = "TARGETS LOCKED",
		TextStrokeTransparency = 0.1,
		Font = sciFi,
		TextColor3 = color3333,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServiceSpeakEnemyField(p795, p796, p797, p798, t39, 0.5)
	end)

	local color3334 = Color3.fromRGB(0, 0, 0)
	local v1644 = uDim2New(1, 0, 2, 0)
	local v1645 = uDim2New(0.5, 0, 0.5, 0)
	local v1646 = effectsServiceNewerCircle(p795, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3334,
		Size = v1644,
		Position = v1645
	})

	table.insert(t38, v1646)
	animation.AnimateAsync(v1646, { BackgroundTransparency = 0.4 }, 0.25, "Out", "Quint")
	task.wait(0.8)

	local function createRangeCircle(p800, p801, p802)
		local v2958 = UDim2.fromScale(0, p802)
		local v2959 = effectsServiceNewerCircle(p795, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Rotation = p801,
			Size = v2958,
			Position = p800
		})

		table.insert(t38, v2959)

		return v2959
	end

	local v1648 = UDim2.fromScale(-1, 0)
	local v1649 = UDim2.fromOffset(v1638.AbsolutePosition.X + v1638.AbsoluteSize.X / 2, 0)
	local v1650 = createRangeCircle(v1648 + v1649, 90, 2.5)
	local uDim2 = UDim2.new(0, v1638.AbsolutePosition.X, 0, v1638.AbsolutePosition.Y)
	local uDim298 = UDim2.new(0, v1638.AbsoluteSize.X * 0.5, 0, v1638.AbsoluteSize.Y * 0.5)
	local v1653 = UDim2.fromScale(1, 0)
	local v1654 = createRangeCircle(uDim2 + uDim298 + v1653, 90, 1)

	task.spawn(function()
		local t79: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255) }
		local v2961 = UDim2.fromOffset(v1638.AbsoluteSize.X * 0.2, v1638.AbsoluteSize.X * 0.1)

		effectsServiceEmit(p795, v1654, {
			Projectile = "rbxassetid://243728206",
			Strength = 2000,
			Speed = 0.8,
			EasingStyle = "Linear",
			Time = 2.5,
			Color = t79,
			Size = v2961,
			Range = v1650,
			ZIndex = v1638.ZIndex + 15000
		})
	end)
	task.wait(0.35)

	for _, v in pairs(_G.__NoFaces(p796.Parent.Parent[s1 .. "Field"])) do
		task.spawn(function()
			task.wait(0.15)
			effectsService.ShakeSync(v, v.Position, 2, 0.6)
			v.ImageColor3 = Color3.fromRGB(40, 40, 40)
		end)
	end

	audioServicePlaySound("velkozult")

	local color3335 = Color3.fromRGB(255, 255, 255)
	local v1658 = uDim2New(0.125, 0, 2.25, 0)
	local uDim299 = UDim2.new(0, v1638.AbsolutePosition.X, 0, v1638.AbsolutePosition.Y)
	local uDim2100 = UDim2.new(0, v1638.AbsoluteSize.X * 0.5, 0, v1638.AbsoluteSize.Y * 0.5)
	local v1661 = effectsServiceNewerCircle(p795, {
		Image = "rbxassetid://10248621823",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 90,
		ImageColor3 = color3335,
		Size = v1658,
		Position = uDim299 + uDim2100,
		ZIndex = v1638.ZIndex + 10000
	})

	table.insert(t38, v1661)
	task.spawn(function()
		for _ = 1, 20 do
			if not v1661 then
				return
			end

			local v2963 = v1661

			v2963.Rotation = v2963.Rotation + 180
			task.wait(0.1)
		end
	end)
	task.spawn(function()
		if v1661 then
			effectsService.Shake(v1661, v1661.Position, 2, 0.05)
		end

		effectsService.ShakeBattle(p795, 1.5, 0.05)
	end)

	local animationAnimate = animation.Animate

	v1658 = UDim2.fromScale(0, 2.5)
	animationAnimate(v1661, { Size = v1658 }, 2.75, "In", "Quint")
	task.spawn(function()
		animation.Animate(v1646, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
	end)
	task.delay(2.75, function()
		for _, v in ipairs(t38) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
function module.FireBreathAlly(p803, p804, p805, p806)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3336 = Color3.fromRGB(240, 157, 54)
	local color3337 = Color3.fromRGB(217, 66, 39)
	local color3338 = Color3.fromRGB(240, 195, 87)
	local color3339 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathAlly(p803, p804, p805, p806, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3336, color3337, color3338, color3339, 1.5, 2)
end
function module.FlareBreathAlly(p807, p808, p809, p810)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3340 = Color3.fromRGB(240, 55, 30)
	local color3341 = Color3.fromRGB(166, 28, 26)
	local color3342 = Color3.fromRGB(240, 32, 13)
	local color3343 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathAlly(p807, p808, p809, p810, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3340, color3341, color3342, color3343, 1.5, 2)
end
function module.FlameBreathAlly(p811, p812, p813, p814)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3344 = Color3.fromRGB(24, 174, 204)
	local color3345 = Color3.fromRGB(8, 72, 150)
	local color3346 = Color3.fromRGB(30, 91, 234)
	local color3347 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathAlly(p811, p812, p813, p814, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3344, color3345, color3346, color3347, 1.5, 2)
end
function module.BlazeBreathAlly(p815, p816, p817, p818)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3348 = Color3.fromRGB(204, 198, 33)
	local color3349 = Color3.fromRGB(220, 189, 15)
	local color3350 = Color3.fromRGB(255, 255, 43)
	local color3351 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathAlly(p815, p816, p817, p818, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3348, color3349, color3350, color3351, 1.5, 2)
end
function module.ScorchBreathAlly(p819, p820, p821, p822)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3352 = Color3.fromRGB(34, 240, 30)
	local color3353 = Color3.fromRGB(32, 180, 37)
	local color3354 = Color3.fromRGB(56, 184, 97)
	local color3355 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathAlly(p819, p820, p821, p822, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3352, color3353, color3354, color3355, 1.5, 2)
end
function module.InfernoBreathAlly(p823, p824, p825, p826)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3356 = Color3.fromRGB(163, 35, 206)
	local color3357 = Color3.fromRGB(144, 0, 180)
	local color3358 = Color3.fromRGB(240, 80, 224)
	local color3359 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathAlly(p823, p824, p825, p826, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3356, color3357, color3358, color3359, 1.5, 2)
end
function module.IceBreathAlly(p827, p828, p829, p830)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3360 = Color3.fromRGB(186, 226, 240)
	local color3361 = Color3.fromRGB(157, 202, 207)
	local color3362 = Color3.fromRGB(202, 235, 255)
	local color3363 = Color3.fromRGB(183, 235, 243)

	effectsServiceBreathAlly(p827, p828, p829, p830, 100, effectsServiceBreathimagesIce, "IceBreath", 1, color3360, color3361, color3362, color3363, 1.5, 2)
end
function module.PoisonHazeAlly(p831, p832, p833, p834)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3364 = Color3.fromRGB(80, 33, 107)
	local color3365 = Color3.fromRGB(151, 94, 217)
	local color3366 = Color3.fromRGB(152, 63, 197)
	local color3367 = Color3.fromRGB(109, 41, 138)

	effectsServiceBreathAlly(p831, p832, p833, p834, 100, effectsServiceBreathimagesFire, "Spray", 0.8, color3364, color3365, color3366, color3367, 1.5, 2)
end
function module.AzureBreathAlly(p835, p836, p837, p838)
	local color3368 = Color3.fromRGB(255, 85, 255)
	local color3369 = Color3.fromRGB(255, 85, 255)
	local color3370 = Color3.fromRGB(156, 52, 156)
	local color3371 = Color3.fromRGB(255, 85, 255)

	effectsServiceBreathAlly(p835, p836, p837, p838, 100, "rbxassetid://7924475318", "Sparkle", 0.5, color3368, color3369, color3370, color3371, 1.5, 1.7)
end
function module.NerdyAlly(p839, p840, p841, p842)
	local effectsServiceBreathimagesNerdy = effectsServiceBreathimages.nerdy
	local color3372 = Color3.fromRGB(197, 197, 197)
	local color3373 = Color3.fromRGB(255, 255, 255)
	local color3374 = Color3.fromRGB(255, 248, 248)
	local color3375 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAlly(p839, p840, p841, p842, 65, effectsServiceBreathimagesNerdy, "Sparkle", 0.8, color3372, color3373, color3374, color3375, 1.5, 1.7)
end
function module.SmokescreenAlly(p843, p844, p845, p846)
	local t40: {[any]: any} = {
		"Jutsu",
		"NinjaSharpen",
		"NinjaEffect1",
		"NinjaEffect2",
		"NinjaEffect3"
	}
	local randomNumber = math.random(1, #t40)

	audioServicePlaySound(t40[randomNumber])

	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	local color3376 = Color3.fromRGB(240, 240, 240)
	local color3377 = Color3.fromRGB(178, 178, 180)
	local color3378 = Color3.fromRGB(240, 240, 240)
	local color3379 = Color3.fromRGB(217, 210, 212)

	effectsServiceBreathAlly(p843, p844, p845, p846, 130, effectsServiceBreathimagesSmog, "Spray", 1, color3376, color3377, color3378, color3379, 1.5, 2)
end
function module.FireBreathAllyInferno(p847, p848, p849, p850)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3380 = Color3.fromRGB(240, 157, 54)
	local color3381 = Color3.fromRGB(217, 66, 39)
	local color3382 = Color3.fromRGB(240, 195, 87)
	local color3383 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathAlly(p847, p848, p849, p850, 70, effectsServiceBreathimagesFire, "FireBreathLong", 1.25, color3380, color3381, color3382, color3383, 1.5, 2)
end
function module.FireBreathAllyHand(p851, p852, p853, p854)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3384 = Color3.fromRGB(240, 157, 54)
	local color3385 = Color3.fromRGB(217, 66, 39)
	local color3386 = Color3.fromRGB(240, 195, 87)
	local color3387 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathAllyHand(p851, p852, p853, p854, 80, effectsServiceBreathimagesFire, "FireBreathLong", 1.25, color3384, color3385, color3386, color3387, 1.5, 2)
end
function module.PoisonHazeAllyHand(p855, p856, p857, p858)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3388 = Color3.fromRGB(80, 33, 107)
	local color3389 = Color3.fromRGB(151, 94, 217)
	local color3390 = Color3.fromRGB(152, 63, 197)
	local color3391 = Color3.fromRGB(109, 41, 138)

	effectsServiceBreathAllyHand(p855, p856, p857, p858, 80, effectsServiceBreathimagesFire, "Spray", 0.8, color3388, color3389, color3390, color3391, 1.5, 2)
end
local function FlagAlly(p859, p860, _, p862, p863, p864, p865, p866, p867, p868, p869, p870, p871, p872)
	local s1

	if p862 == "" then
		s1 = ""
	elseif p862 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p860.Parent.Parent[s1 .. "Field"])) do
			local v2968 = UDim2.fromOffset(v.AbsoluteSize.X * p864, v.AbsoluteSize.X * p864)
			local uDim2 = UDim2.new(0, v.AbsolutePosition.X, 0, v.AbsolutePosition.Y)
			local uDim2101 = UDim2.new(0, v.AbsoluteSize.X * 0.5, 0, v.AbsoluteSize.Y * 0.5)
			local v2971 = effectsServiceNewerCircle(p859, {
				BackgroundTransparency = 1,
				Image = p863,
				ImageTransparency = p870 or 0,
				Size = v2968,
				Position = uDim2 + uDim2101,
				ZIndex = v.ZIndex + 10000
			})

			effectsServicePreloadTech(p859, { p863 })

			local t80: {[any]: any} = {
				Time = p868 or 0.5,
				FlashTime = p869 or 0.2,
				Color = { p865, p866 },
				SizeMultiplier = p872 or 1,
				Transparency = p871 or 0.1
			}

			spawn(function()
				effectsServicePulse(p859, v2971, t80)
			end)
			animation.AnimateAsync(v2971, { ImageTransparency = p870 or 0 }, 0.25, "Out", "Quint")
			animation.AnimateAsync(v2971, { Rotation = p867 }, 1, "Out", "Quint")
			spawn(function()
				wait(0.5)
				animation.Animate(v2971, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
				v2971:Destroy()
			end)
		end
	end)
end
function module.RedcliffSymbol(p873, _, _, p876)
	effectsServicePreloadTech(p873, { "rbxassetid://58454662" })
	audioService.DimSongs()

	local s1

	if p876 == "" then
		s1 = ""
	elseif p876 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local v1812 = p873.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local color3392 = Color3.fromRGB(59, 14, 14)
	local v1814 = uDim2New(1, 0, 2, 0)
	local v1815 = uDim2New(0.5, 0, 0.5, 0)
	local v1816 = effectsServiceNewerCircle(p873, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3392,
		Size = v1814,
		Position = v1815
	})
	local color3393 = Color3.fromRGB(255, 255, 255)

	v1815 = uDim2New(0.25, 0, 0.5, 0)

	local uDim2 = UDim2.new(0, v1812.AbsolutePosition.X, 0, v1812.AbsolutePosition.Y)
	local uDim2102 = UDim2.new(0, v1812.AbsoluteSize.X * 0.5, 0, v1812.AbsoluteSize.Y * 0.5)
	local v1820 = effectsServiceNewerCircle(p873, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10002,
		Image = "rbxassetid://58454662",
		BackgroundColor3 = color3393,
		Size = v1815,
		Position = uDim2 + uDim2102
	})

	animation.AnimateAsync(v1820, { ImageTransparency = 0 }, 0.25, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync

	v1815 = UDim2.fromOffset(v1812.AbsolutePosition.X + v1812.AbsoluteSize.X / 2, v1812.AbsolutePosition.Y * 1 - v1812.AbsoluteSize.Y / 4)
	animationAnimateAsync(v1820, { Position = v1815 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(v1816, { BackgroundTransparency = 0.5, ImageTransparency = 1 }, 0.5, "Out", "Quint")
	audioServicePlaySound("RedcliffCheer")
	task.wait(0.75)
	audioServicePlaySound("unsheath")
	animation.AnimateAsync(v1820, { ImageTransparency = 1 }, 0.25, "Out", "Quint")
	animation.AnimateAsync(v1816, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.25, "Out", "Quint")
	task.wait(0.5)
	audioService.UndimSongs()
	v1816:Destroy()
	v1820:Destroy()
end
function module.RedcliffBuff(p877, p878, _, _)
	audioServicePlaySound("RedcliffYell")
	task.wait(0.1)

	local v1826 = UDim2.fromOffset(p878.AbsoluteSize.X * 1.4, p878.AbsoluteSize.X * 1.4)
	local uDim2 = UDim2.new(0, p878.AbsolutePosition.X, 0, p878.AbsolutePosition.Y)
	local uDim2103 = UDim2.new(0, p878.AbsoluteSize.X * 0.5, 0, p878.AbsoluteSize.Y * 0.5)
	local v1829 = effectsServiceNewerCircle(p877, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://8652408406",
		Rotation = 90,
		Size = v1826,
		Position = uDim2 + uDim2103,
		ZIndex = p878.ZIndex + 10000
	})

	animation.AnimateAsync(v1829, { ImageTransparency = 0 }, 0.2, "Out", "Quint")
	audioServicePlaySound("flag")
	task.wait(0.1)
	audioServicePlaySound("RedcliffCheer")

	local animationAnimate = animation.Animate
	local v1831 = v1829.Position
	local v1832 = UDim2.fromOffset(0, p878.AbsoluteSize.X * 0.9)

	animationAnimate(v1829, { Rotation = 0, Position = v1831 - v1832 }, 0.3, "Out", "Quart")
	audioServicePlaySound("unsheath")
	task.spawn(function()
		animation.Animate(v1829, { ImageTransparency = 1, Rotation = -10 }, 0.75, "In", "Quart")
		v1829:Destroy()
	end)
end
local function ImmortalSwordDraw(p881, p882, _, _, p885)
	local n1 = p882.ZIndex + 100001
	local v1839 = UDim2.fromOffset(p882.AbsoluteSize.X, p882.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p882.AbsolutePosition.X, 0, p882.AbsolutePosition.Y)
	local uDim2104 = UDim2.new(0, p882.AbsoluteSize.X * 0.5, 0, p882.AbsoluteSize.Y * 0.5)
	local v1842 = effectsServiceNewerCircle(p881, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = p885,
		ZIndex = n1,
		Size = v1839,
		Position = uDim2 + uDim2104
	})

	audioServicePlaySound("dbzswordout")

	local animationAnimateAsync = animation.AnimateAsync
	local v1844 = UDim2.fromOffset(p882.AbsoluteSize.Y * 1.2, p882.AbsoluteSize.Y * 1.2)

	animationAnimateAsync(v1842, { Rotation = 180, Size = v1844 }, 1, "Out", "Quint")
	task.wait(0.5)
	animation.AnimateAsync(v1842, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v1842:Destroy()
	end)
end
function module.ImmortalSwordDraw(p886, p887, p888, p889)
	ImmortalSwordDraw(p886, p887, p888, p889, "rbxassetid://58889937")
end
function module.ImmortalSwordDrawBlue(p890, p891, p892, p893)
	ImmortalSwordDraw(p890, p891, p892, p893, "rbxassetid://58890008")
end
local function ImmortalSwordEquip(p894, _, p896, _, p898, p899, p900)
	audioServicePlaySound("unsheath")

	if p900 then
		audioServicePlaySound(p899)
	end

	for _ = 1, 2 do
		local n1 = p896.ZIndex + 100001
		local v1862 = UDim2.fromOffset(p896.AbsoluteSize.X, p896.AbsoluteSize.X)
		local uDim2 = UDim2.new(0, p896.AbsolutePosition.X, 0, p896.AbsolutePosition.Y)
		local uDim2105 = UDim2.new(0, p896.AbsoluteSize.X * 0.5, 0, p896.AbsoluteSize.Y * 0.5)
		local v1865 = effectsServiceNewerCircle(p894, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			ImageColor3 = p898,
			ZIndex = n1,
			Size = v1862,
			Position = uDim2 + uDim2105
		})
		local animationAnimateAsync = animation.AnimateAsync
		local v1867 = UDim2.fromOffset(p896.AbsoluteSize.Y * 1, p896.AbsoluteSize.Y * 1)

		animationAnimateAsync(v1865, { Size = v1867 }, 1, "Out", "Quint")
		animation.AnimateAsync(v1865, { ImageTransparency = 1 }, 1, "Out", "Quint")
		task.spawn(function()
			task.wait(1)
			v1865:Destroy()
		end)
		task.wait(0.05)
	end
end
function module.EquipBlue(p901, p902, p903, p904)
	local color3394 = Color3.fromRGB(0, 0, 255)

	ImmortalSwordEquip(p901, p902, p903, p904, color3394, "insanity")
end
function module.EquipRed(p905, p906, p907, p908)
	local color3395 = Color3.fromRGB(255, 0, 0)

	ImmortalSwordEquip(p905, p906, p907, p908, color3395, "insanity")
end
function module.EquipGreen(p909, p910, p911, p912)
	local color3396 = Color3.fromRGB(0, 255, 0)

	ImmortalSwordEquip(p909, p910, p911, p912, color3396, "insanity")
end
function module.EquipYellow(p913, p914, p915, p916)
	local color3397 = Color3.fromRGB(255, 255, 0)

	ImmortalSwordEquip(p913, p914, p915, p916, color3397, "insanity")
end
function module.EquipChaos(p917, p918, p919, p920)
	local color3398 = Color3.fromRGB(255, 255, 255)

	ImmortalSwordEquip(p917, p918, p919, p920, color3398, "insanity", true)
end
function module.EquipShedletsky(p921, p922, p923, p924)
	local color3399 = Color3.fromRGB(255, 255, 255)

	ImmortalSwordEquip(p921, p922, p923, p924, color3399, "John's Laugh", true)
end
local function FriedLimbEffect(p925, p926, _, _, p929, p930, p931)
	audioServicePlaySound("Gobble")

	if p931 then
		audioServicePlaySound(p930)
	end

	local n1 = p926.ZIndex + 100001
	local v1906 = UDim2.fromOffset(p926.AbsoluteSize.X, p926.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p926.AbsolutePosition.X, 0, p926.AbsolutePosition.Y)
	local uDim2106 = UDim2.new(0, p926.AbsoluteSize.X * 0.5, 0, p926.AbsoluteSize.Y * 0.5)
	local v1909 = effectsServiceNewerCircle(p925, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = p929,
		ZIndex = n1,
		Size = v1906,
		Position = uDim2 + uDim2106
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v1911 = UDim2.fromOffset(p926.AbsoluteSize.Y * 1.5, p926.AbsoluteSize.Y * 1.5)

	animationAnimateAsync(v1909, { Size = v1911 }, 1, "Out", "Quint")
	animation.AnimateAsync(v1909, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v1909:Destroy()
	end)
	task.wait(0.1)
end
function module.SelfBlue(p932, p933, p934, p935)
	local color3400 = Color3.fromRGB(0, 0, 255)

	FriedLimbEffect(p932, p933, p934, p935, color3400, "insanity")
end
function module.SelfRed(p936, p937, p938, p939)
	local color3401 = Color3.fromRGB(255, 0, 0)

	FriedLimbEffect(p936, p937, p938, p939, color3401, "insanity")
end
function module.SelfGreen(p940, p941, p942, p943)
	local color3402 = Color3.fromRGB(0, 255, 0)

	FriedLimbEffect(p940, p941, p942, p943, color3402, "insanity")
end
function module.SelfYellow(p944, p945, p946, p947)
	local color3403 = Color3.fromRGB(255, 255, 0)

	FriedLimbEffect(p944, p945, p946, p947, color3403, "insanity")
end
function module.SelfChaos(p948, p949, p950, p951)
	local color3404 = Color3.fromRGB(255, 255, 255)

	FriedLimbEffect(p948, p949, p950, p951, color3404, "insanity", true)
end
function module.SelfShedletsky(p952, p953, p954, p955)
	local color3405 = Color3.fromRGB(255, 255, 255)

	FriedLimbEffect(p952, p953, p954, p955, color3405, "John's Laugh", true)
end
local function ShedletskyDraw(p956, p957, _, _, p960, p961)
	effectsServicePreloadTech(p956, { p960, "rbxassetid://12135944951" })

	local n1 = p957.ZIndex + 100001
	local v1949 = UDim2.fromOffset(p957.AbsoluteSize.X, p957.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p957.AbsolutePosition.X, 0, p957.AbsolutePosition.Y)
	local uDim2107 = UDim2.new(0, p957.AbsoluteSize.X * 0.5, 0, p957.AbsoluteSize.Y * 0.5)
	local v1952 = effectsServiceNewerCircle(p956, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = p960,
		ZIndex = n1,
		Size = v1949,
		Position = uDim2 + uDim2107
	})

	audioServicePlaySound("dbzswordout")
	audioServicePlaySound("Gobble")

	local v1953 = UDim2.fromOffset(p957.AbsoluteSize.X * 1.2, p957.AbsoluteSize.X * 1.2)
	local uDim2108 = UDim2.new(0, p957.AbsolutePosition.X, 0, p957.AbsolutePosition.Y)
	local uDim2109 = UDim2.new(0, p957.AbsoluteSize.X * 0.5, 0, p957.AbsoluteSize.Y * 0.5)
	local v1956 = effectsServiceNewerCircle(p956, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://12135944951",
		ImageTransparency = 0,
		Size = v1953,
		Position = uDim2108 + uDim2109,
		ZIndex = p957.ZIndex + 100002
	})

	animation.AnimateAsync(v1956, { ImageTransparency = 0 }, 0.25, "Out", "Quint")
	animation.AnimateAsync(v1956, { Rotation = p961 }, 1, "Out", "Quint")
	spawn(function()
		wait(0.5)
		animation.Animate(v1956, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		v1956:Destroy()
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v1958 = UDim2.fromOffset(p957.AbsoluteSize.Y * 1.2, p957.AbsoluteSize.Y * 1.2)

	animationAnimateAsync(v1952, { Rotation = 180, Size = v1958 }, 1, "Out", "Quint")
	task.wait(0.5)
	animation.AnimateAsync(v1952, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v1952:Destroy()
	end)
end
function module.ShedletskyDraw(p962, p963, p964, p965)
	ShedletskyDraw(p962, p963, p964, p965, "rbxassetid://58889937", 360)
end
function module.ShedletskyDrawGreen(p966, p967, p968, p969)
	ShedletskyDraw(p966, p967, p968, p969, "rbxassetid://58890008", 360)
end
function module.ShedletskyDrawYellow(p970, p971, p972, p973)
	ShedletskyDraw(p970, p971, p972, p973, "rbxassetid://58890008", 360)
end
function module.ShedletskyDrawBlue(p974, p975, p976, p977)
	ShedletskyDraw(p974, p975, p976, p977, "rbxassetid://58890008", 360)
end
local function WielderBaseplateEffect(p978, p979, _, _, p982, p983, p984, p985)
	effectsServicePreloadTech(p978, { p982, p983 })

	local n1 = p979.ZIndex + 100001
	local v1984 = UDim2.fromOffset(p979.AbsoluteSize.X, p979.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p979.AbsolutePosition.X, 0, p979.AbsolutePosition.Y)
	local uDim2110 = UDim2.new(0, p979.AbsoluteSize.X * 0.5, 0, p979.AbsoluteSize.Y * 0.5)
	local v1987 = effectsServiceNewerCircle(p978, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = p982,
		ZIndex = n1,
		Size = v1984,
		Position = uDim2 + uDim2110
	})

	audioServicePlaySound("unsheath")
	audioServicePlaySound("Lunge")

	local v1988 = UDim2.fromOffset(p979.AbsoluteSize.X * 1.9, p979.AbsoluteSize.X * 1.9)
	local uDim2111 = UDim2.new(0, p979.AbsolutePosition.X, 0, p979.AbsolutePosition.Y)
	local uDim2112 = UDim2.new(0, p979.AbsoluteSize.X * 0.5, 0, p979.AbsoluteSize.Y * 0.5)
	local v1991 = effectsServiceNewerCircle(p978, {
		BackgroundTransparency = 1,
		ImageTransparency = p985 or 0,
		Image = p983,
		Size = v1988,
		Position = uDim2111 + uDim2112,
		ZIndex = p979.ZIndex + 100002
	})

	animation.AnimateAsync(v1991, { ImageTransparency = p985 or 0 }, 0.25, "Out", "Quint")
	animation.AnimateAsync(v1991, { Rotation = p984 }, 1, "Out", "Quint")
	spawn(function()
		wait(0.5)
		animation.Animate(v1991, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		v1991:Destroy()
	end)

	local animationAnimateAsync = animation.AnimateAsync
	local v1993 = UDim2.fromOffset(p979.AbsoluteSize.Y * 1.2, p979.AbsoluteSize.Y * 1.2)

	animationAnimateAsync(v1987, { Rotation = 180, Size = v1993 }, 1, "Out", "Quint")
	task.wait(0.5)
	animation.AnimateAsync(v1987, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v1987:Destroy()
	end)
end
function module.WielderIlluminaEffect(p986, p987, p988, p989)
	WielderBaseplateEffect(p986, p987, p988, p989, "rbxassetid://58889937", "rbxassetid://12210187575", 360)
end
function module.WielderVenomshankEffect(p990, p991, p992, p993)
	WielderBaseplateEffect(p990, p991, p992, p993, "rbxassetid://58889937", "rbxassetid://12206797533", 360)
end
function module.WielderFirebrandEffect(p994, p995, p996, p997)
	WielderBaseplateEffect(p994, p995, p996, p997, "rbxassetid://58889937", "rbxassetid://12206796531", 360)
end
function module.WielderGhostwalkerEffect(p998, p999, p1000, p1001)
	WielderBaseplateEffect(p998, p999, p1000, p1001, "rbxassetid://58890008", "rbxassetid://12206799361", 360, 0.3)
end
function module.WielderDarkheartEffect(p1002, p1003, p1004, p1005)
	WielderBaseplateEffect(p1002, p1003, p1004, p1005, "rbxassetid://58890008", "rbxassetid://12206795975", 360)
end
function module.WielderWindforceEffect(p1006, p1007, p1008, p1009)
	WielderBaseplateEffect(p1006, p1007, p1008, p1009, "rbxassetid://58890008", "rbxassetid://12206798023", 360)
end
function module.DarkheartEffectNoFire(p1010, p1011, p1012, p1013)
	WielderBaseplateEffect(p1010, p1011, p1012, p1013, "", "rbxassetid://12206795975", 360)
end
function module.BlazerCEffect(p1014, _, _, _)
	effectsServicePreloadTech(p1014, {
		"rbxassetid://12986250042",
		"rbxassetid://3549005830",
		"rbxassetid://12985622752",
		"rbxassetid://12985622116",
		"rbxassetid://12986249299"
	})
	wait(0.1)

	local y = p1014.Parent.BattleNew.VirtualField.AbsoluteSize.Y

	audioServicePlaySound("dbzswordout")
	wait(0.2)
	audioServicePlaySound("shakuhachi")
	audioServicePlaySound("EntranceOfGreat")
	audioService.DimSongs(0.001)

	local color3406 = Color3.fromRGB(166, 109, 39)
	local v2028 = uDim2New(1, 0, 2, 0)
	local v2029 = uDim2New(0.5, 0, 0.5, 0)
	local v2030 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90000,
		BackgroundColor3 = color3406,
		Size = v2028,
		Position = v2029
	})
	local color3407 = Color3.fromRGB(255, 255, 255)
	local v2032 = uDim2New(0, y * 2.25, 0, y * 2.25)
	local v2033 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ZIndex = 90002,
		ImageTransparency = 1,
		Image = "rbxassetid://12986250042",
		ImageColor3 = color3407,
		Size = v2032,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})

	animation.AnimateAsync(v2030, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 1, "Out", "Quint")

	local color3408 = Color3.fromRGB(255, 212, 83)
	local v2035 = uDim2New(0, y * 5.5, 0, y * 5.5)
	local v2036 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90001,
		Image = "rbxassetid://3549005830",
		ImageColor3 = color3408,
		Size = v2035,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local color3409 = Color3.fromRGB(255, 255, 255)
	local v2038 = uDim2New(0, y * 5, 0, y * 5)
	local v2039 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 90003,
		Image = "rbxassetid://12985622752",
		ImageColor3 = color3409,
		Size = v2038,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local color3410 = Color3.fromRGB(255, 255, 255)
	local v2041 = uDim2New(0, y * 5, 0, y * 5)
	local v2042 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 90004,
		Image = "rbxassetid://12985622116",
		ImageColor3 = color3410,
		Size = v2041,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})

	animation.AnimateAsync(v2036, { ImageTransparency = 0 }, 1, "Out", "Linear")
	animation.AnimateAsync(v2039, { ImageTransparency = 0 }, 1.6, "Out", "Linear")
	animation.AnimateAsync(v2042, { ImageTransparency = 0 }, 1.6, "Out", "Linear")

	local v2043 = uDim2New(0, y, 0, y)
	local uDim2 = UDim2.new(0, -y, 1, -y / 2)
	local v2045 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2043,
		Position = uDim2
	})
	local v2046 = uDim2New(0, y, 0, y)
	local uDim2113 = UDim2.new(1, y, 1, -y / 2)
	local v2048 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2046,
		Position = uDim2113
	})
	local v2049 = uDim2New(0, y, 0, y)
	local uDim2114 = UDim2.new(0.85, y / 1.5, 0.8, -y / 2)
	local v2051 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2049,
		Position = uDim2114
	})
	local v2052 = uDim2New(0, y, 0, y)
	local uDim2115 = UDim2.new(0.15, -y / 1.5, 0.8, -y / 2)
	local v2054 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2052,
		Position = uDim2115
	})

	v2046 = v2054.Position
	animation.AnimateAsync(v2042, { Position = v2051.Position }, 2, "Out", "Quart")
	animation.AnimateAsync(v2039, { Position = v2046 }, 2, "Out", "Quart")

	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	v2052 = { Color3.fromRGB(255, 247, 251), Color3.fromRGB(255, 255, 255) }
	local v2056 = UDim2.fromOffset(y / 1.25, y / 1.25)
	v2049 = {
		Strength = 80,
		Transparency = 0.05,
		Time = 1.25,
		Lifetime = 1,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 6,
		ZIndex = 90000,
		Projectile = effectsServiceBreathimagesSmog,
		Color = v2052,
		Size = v2056
	}
	effectsServiceBreath(p1014, v2045, v2048, v2049)
	effectsServiceBreath(p1014, v2048, v2045, v2049)

	local color3411 = Color3.fromRGB(255, 255, 255)
	local v2058 = uDim2New(0, y * 3.5, 0, y * 3.5)
	local v2059 = effectsServiceNewerCircle(p1014, {
		BackgroundTransparency = 1,
		ZIndex = 90003,
		ImageTransparency = 1,
		Image = "rbxassetid://12986249299",
		ImageColor3 = color3411,
		Size = v2058,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local t41: {[any]: any} = {
		Time = 1.75,
		FlashTime = 0.75,
		Color = { Color3.fromRGB(255, 213, 0), Color3.fromRGB(226, 158, 0) },
		Transparency = 0
	}

	spawn(function()
		wait(0.1)
		effectsServicePulse(p1014, v2059, t41)
	end)
	wait(0.75)

	local animationAnimateAsync = animation.AnimateAsync
	local color3412 = Color3.fromRGB(255, 212, 83)

	animationAnimateAsync(v2036, { ImageColor3 = color3412 }, 0.5, "Out", "Linear")

	local animateAsync = animation.AnimateAsync
	local color3413 = Color3.fromRGB(181, 155, 75)

	animateAsync(v2030, { BackgroundColor3 = color3413 }, 0.5, "Out", "Linear")
	wait(0.25)
	animation.AnimateAsync(v2033, { ImageTransparency = 0.1 }, 0.3, "Out", "Linear")
	wait(0.5)
	spawn(function()
		wait(0.5)
		audioService.UndimSongs()
		wait(0.8)
		v2036:Destroy()
		v2033:Destroy()
		v2039:Destroy()
		v2042:Destroy()
		v2030:Destroy()
		v2045:Destroy()
		v2048:Destroy()
		v2051:Destroy()
		v2054:Destroy()
		v2059:Destroy()
	end)
	animation.AnimateAsync(v2033, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
	animation.AnimateAsync(v2059, { ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2036, { ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2030, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2042, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2039, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
end
function module.BlazerCEffectAlt(p1018, _, _, _)
	effectsServicePreloadTech(p1018, {
		"rbxassetid://12986250042",
		"rbxassetid://3549005830",
		"rbxassetid://13033471954",
		"rbxassetid://13033474741",
		"rbxassetid://13033465032"
	})
	wait(0.1)

	local y = p1018.Parent.BattleNew.VirtualField.AbsoluteSize.Y

	audioServicePlaySound("dbzswordout")
	wait(0.2)
	audioServicePlaySound("shakuhachi")
	audioServicePlaySound("EntranceOfGreat")
	audioService.DimSongs(0.001)

	local color3414 = Color3.fromRGB(33, 47, 129)
	local v2071 = uDim2New(1, 0, 2, 0)
	local v2072 = uDim2New(0.5, 0, 0.5, 0)
	local v2073 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90000,
		BackgroundColor3 = color3414,
		Size = v2071,
		Position = v2072
	})
	local color3415 = Color3.fromRGB(255, 255, 255)
	local v2075 = uDim2New(0, y * 2.25, 0, y * 2.25)
	local v2076 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ZIndex = 90002,
		ImageTransparency = 1,
		Image = "rbxassetid://12986250042",
		ImageColor3 = color3415,
		Size = v2075,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})

	animation.AnimateAsync(v2073, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 1, "Out", "Quint")

	local color3416 = Color3.fromRGB(19, 74, 255)
	local v2078 = uDim2New(0, y * 5.5, 0, y * 5.5)
	local v2079 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90001,
		Image = "rbxassetid://3549005830",
		ImageColor3 = color3416,
		Size = v2078,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local color3417 = Color3.fromRGB(255, 255, 255)
	local v2081 = uDim2New(0, y * 5, 0, y * 5)
	local v2082 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 90003,
		Image = "rbxassetid://13033471954",
		ImageColor3 = color3417,
		Size = v2081,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local color3418 = Color3.fromRGB(255, 255, 255)
	local v2084 = uDim2New(0, y * 5, 0, y * 5)
	local v2085 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 90004,
		Image = "rbxassetid://13033474741",
		ImageColor3 = color3418,
		Size = v2084,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})

	animation.AnimateAsync(v2079, { ImageTransparency = 0 }, 1, "Out", "Linear")
	animation.AnimateAsync(v2082, { ImageTransparency = 0 }, 1.6, "Out", "Linear")
	animation.AnimateAsync(v2085, { ImageTransparency = 0 }, 1.6, "Out", "Linear")

	local v2086 = uDim2New(0, y, 0, y)
	local uDim2 = UDim2.new(0, -y, 1, -y / 2)
	local v2088 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2086,
		Position = uDim2
	})
	local v2089 = uDim2New(0, y, 0, y)
	local uDim2116 = UDim2.new(1, y, 1, -y / 2)
	local v2091 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2089,
		Position = uDim2116
	})
	local v2092 = uDim2New(0, y, 0, y)
	local uDim2117 = UDim2.new(0.85, y / 1.5, 0.8, -y / 2)
	local v2094 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2092,
		Position = uDim2117
	})
	local v2095 = uDim2New(0, y, 0, y)
	local uDim2118 = UDim2.new(0.15, -y / 1.5, 0.8, -y / 2)
	local v2097 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2095,
		Position = uDim2118
	})

	v2089 = v2097.Position
	animation.AnimateAsync(v2085, { Position = v2094.Position }, 2, "Out", "Quart")
	animation.AnimateAsync(v2082, { Position = v2089 }, 2, "Out", "Quart")

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	v2095 = { Color3.fromRGB(34, 49, 255), Color3.fromRGB(26, 37, 182) }
	local v2099 = UDim2.fromOffset(y / 1.25, y / 1.25)

	audioServicePlaySound("FireBreath")
	v2092 = {
		Strength = 80,
		Transparency = 0.05,
		Time = 1.25,
		Lifetime = 1,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 6,
		ZIndex = 90000,
		Projectile = effectsServiceBreathimagesFire,
		Color = v2095,
		Size = v2099
	}
	effectsServiceBreath(p1018, v2088, v2091, v2092)
	effectsServiceBreath(p1018, v2091, v2088, v2092)

	local color3419 = Color3.fromRGB(255, 255, 255)
	local v2101 = uDim2New(0, y * 3.5, 0, y * 3.5)
	local v2102 = effectsServiceNewerCircle(p1018, {
		BackgroundTransparency = 1,
		ZIndex = 90003,
		ImageTransparency = 1,
		Image = "rbxassetid://13033465032",
		ImageColor3 = color3419,
		Size = v2101,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local t42: {[any]: any} = {
		Time = 1.75,
		FlashTime = 0.75,
		Color = { Color3.fromRGB(8, 0, 255), Color3.fromRGB(26, 37, 193) },
		Transparency = 0
	}

	spawn(function()
		wait(0.1)
		effectsServicePulse(p1018, v2102, t42)
	end)
	wait(0.75)

	local animationAnimateAsync = animation.AnimateAsync
	local color3420 = Color3.fromRGB(255, 212, 83)

	animationAnimateAsync(v2079, { ImageColor3 = color3420 }, 0.5, "Out", "Linear")

	local animateAsync = animation.AnimateAsync
	local color3421 = Color3.fromRGB(181, 155, 75)

	animateAsync(v2073, { BackgroundColor3 = color3421 }, 0.5, "Out", "Linear")
	wait(0.25)
	animation.AnimateAsync(v2076, { ImageTransparency = 0.1 }, 0.3, "Out", "Linear")
	wait(0.5)
	spawn(function()
		wait(0.5)
		audioService.UndimSongs()
		wait(0.8)
		v2079:Destroy()
		v2076:Destroy()
		v2082:Destroy()
		v2085:Destroy()
		v2073:Destroy()
		v2088:Destroy()
		v2091:Destroy()
		v2094:Destroy()
		v2097:Destroy()
		v2102:Destroy()
	end)
	animation.AnimateAsync(v2076, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
	animation.AnimateAsync(v2102, { ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2079, { ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2073, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2085, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
	animation.AnimateAsync(v2082, { BackgroundTransparency = 1, ImageTransparency = 1 }, 0.75, "Out", "Linear")
end
local function BaseplateEffect(p1022, p1023, _, _, p1026)
	effectsServicePreloadTech(p1022, { "rbxassetid://5168609593" })
	audioServicePlaySound("Kerplunk.wav")

	local n1 = p1023.ZIndex + 100001
	local v2114 = UDim2.fromOffset(p1023.AbsoluteSize.X * 0.5, p1023.AbsoluteSize.X * 0.5)
	local uDim2 = UDim2.new(0, p1023.AbsolutePosition.X, 0, p1023.AbsolutePosition.Y)
	local uDim2119 = UDim2.new(0, p1023.AbsoluteSize.X * 0.5, 0, p1023.AbsoluteSize.Y * 0.5)
	local v2117 = effectsServiceNewerCircle(p1022, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://5168609593",
		ImageColor3 = p1026,
		ZIndex = n1,
		Size = v2114,
		Position = uDim2 + uDim2119
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2119 = UDim2.fromOffset(p1023.AbsoluteSize.Y * 0.8, p1023.AbsoluteSize.Y * 0.8)

	animationAnimateAsync(v2117, { Size = v2119 }, 1, "Out", "Quint")
	animation.AnimateAsync(v2117, { ImageTransparency = 1 }, 1, "Out", "Quint")
	task.spawn(function()
		task.wait(1)
		v2117:Destroy()
	end)
	task.wait(0.1)
end
function module.BaseplateBlue(p1027, p1028, p1029, p1030)
	BaseplateEffect(p1027, p1028, p1029, p1030, Color3.fromRGB(0, 0, 255))
end
function module.BaseplateRed(p1031, p1032, p1033, p1034)
	BaseplateEffect(p1031, p1032, p1033, p1034, Color3.fromRGB(255, 0, 0))
end
function module.BaseplateGreen(p1035, p1036, p1037, p1038)
	BaseplateEffect(p1035, p1036, p1037, p1038, Color3.fromRGB(0, 255, 0))
end
function module.BaseplateYellow(p1039, p1040, p1041, p1042)
	BaseplateEffect(p1039, p1040, p1041, p1042, Color3.fromRGB(255, 255, 0))
end
function module.BaseplateNeutral(p1043, p1044, p1045, p1046)
	BaseplateEffect(p1043, p1044, p1045, p1046, Color3.fromRGB(255, 255, 255))
end
local function StudGenEffect(p1047, p1048, _, _, p1051)
	audioServicePlaySound("spawn05 soft")

	local n1 = p1048.ZIndex + 100001
	local v2146 = UDim2.fromOffset(p1048.AbsoluteSize.X * 0.95, p1048.AbsoluteSize.X * 0.95)
	local uDim2 = UDim2.new(0, p1048.AbsolutePosition.X, 0, p1048.AbsolutePosition.Y)
	local uDim2120 = UDim2.new(0, p1048.AbsoluteSize.X * 0.5, 0, p1048.AbsoluteSize.Y * 0.5)
	local v2149 = effectsServiceNewerCircle(p1047, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = p1051,
		ZIndex = n1,
		Size = v2146,
		Position = uDim2 + uDim2120
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2151 = UDim2.fromOffset(p1048.AbsoluteSize.Y * 0.95, p1048.AbsoluteSize.Y * 0.95)

	animationAnimateAsync(v2149, { Size = v2151 }, 0.75, "Out", "Quint")
	animation.AnimateAsync(v2149, { ImageTransparency = 1 }, 0.75, "Out", "Quint")
	task.spawn(function()
		task.wait(0.75)
		v2149:Destroy()
	end)
	task.wait(0.05)
end
function module.StudBlue(p1052, p1053, p1054, p1055)
	StudGenEffect(p1052, p1053, p1054, p1055, Color3.fromRGB(0, 0, 255))
end
function module.StudRed(p1056, p1057, p1058, p1059)
	StudGenEffect(p1056, p1057, p1058, p1059, Color3.fromRGB(255, 0, 0))
end
function module.StudGreen(p1060, p1061, p1062, p1063)
	StudGenEffect(p1060, p1061, p1062, p1063, Color3.fromRGB(0, 255, 0))
end
function module.StudYellow(p1064, p1065, p1066, p1067)
	StudGenEffect(p1064, p1065, p1066, p1067, Color3.fromRGB(255, 255, 0))
end
function module.StudNeutral(p1068, p1069, p1070, p1071)
	StudGenEffect(p1068, p1069, p1070, p1071, Color3.fromRGB(255, 255, 255))
end
function module.ThousandDeaths(p1072, _, _, _)
	local y = p1072.Parent.BattleNew.VirtualField.AbsoluteSize.Y

	audioServicePlaySound("bk kakusei")
	audioServicePlaySound("EntranceOfGreat")
	audioService.DimSongs()

	local color3422 = Color3.fromRGB(17, 18, 35)
	local v2178 = uDim2New(1, 0, 2, 0)
	local v2179 = uDim2New(0.5, 0, 0.5, 0)
	local v2180 = effectsServiceNewerCircle(p1072, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90000,
		BackgroundColor3 = color3422,
		Size = v2178,
		Position = v2179
	})

	animation.AnimateAsync(v2180, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 1, "Out", "Quint")

	local color3423 = Color3.fromRGB(179, 174, 202)
	local v2182 = uDim2New(0, y * 3.25, 0, y * 3.25)
	local v2183 = effectsServiceNewerCircle(p1072, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 90001,
		Image = "rbxassetid://8660491108",
		ImageColor3 = color3423,
		Size = v2182,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})

	animation.AnimateAsync(v2183, { ImageTransparency = 0.1 }, 1, "Out", "Linear")

	local v2184 = uDim2New(0, y, 0, y)
	local uDim2 = UDim2.new(0, -y, 1, -y / 2)
	local v2186 = effectsServiceNewerCircle(p1072, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2184,
		Position = uDim2
	})
	local v2187 = uDim2New(0, y, 0, y)
	local uDim2121 = UDim2.new(1, y, 1, -y / 2)
	local v2189 = effectsServiceNewerCircle(p1072, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2187,
		Position = uDim2121
	})
	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	v2184 = { Color3.fromRGB(190, 196, 220), Color3.fromRGB(147, 157, 193) }
	local v2191 = UDim2.fromOffset(y, y)
	v2182 = {
		Strength = 100,
		Time = 1.5,
		Lifetime = 1.5,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 6,
		ZIndex = 90000,
		Projectile = effectsServiceBreathimagesSmog,
		Color = v2184,
		Size = v2191
	}
	effectsServiceBreath(p1072, v2186, v2189, v2182)
	effectsServiceBreath(p1072, v2189, v2186, v2182)

	local color3424 = Color3.fromRGB(255, 255, 255)
	local v2193 = uDim2New(0, y * 3, 0, y * 3)
	local v2194 = effectsServiceNewerCircle(p1072, {
		BackgroundTransparency = 1,
		ZIndex = 90002,
		ImageTransparency = 1,
		Image = "rbxassetid://5814352183",
		ImageColor3 = color3424,
		Size = v2193,
		Position = UDim2.new(0.5, 0, 0.5, -16)
	})
	local t43: {[any]: any} = {
		Time = 2,
		FlashTime = 1,
		Color = { Color3.fromRGB(255, 0, 4), Color3.fromRGB(50, 0, 0) },
		Transparency = 0.1
	}

	spawn(function()
		effectsServicePulse(p1072, v2194, t43)
	end)
	wait(0.8)
	spawn(function()
		wait(1)
		audioService.UndimSongs()
		wait(0.5)
		v2183:Destroy()
		v2180:Destroy()
		v2186:Destroy()
		v2189:Destroy()
		v2194:Destroy()
	end)
	animation.AnimateAsync(v2194, { ImageTransparency = 1 }, 1.5, "Out", "Linear")
	animation.AnimateAsync(v2183, { ImageTransparency = 1 }, 0.7, "Out", "Linear")
	animation.AnimateAsync(v2180, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Linear")
end
function module.FloraBuffAlly(p1076, p1077, _, p1079)
	local s1

	if p1079 == "" then
		s1 = ""
	elseif p1079 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	local virtualField = p1076.Parent.BattleNew.VirtualField

	audioService.DimSongs()
	audioServicePlaySound("Ascend")

	if math.random(1, 5) == 1 then
		audioServicePlaySound("bless")
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1077.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.5, 0.007)
			end)
		end
	end)
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local color3425 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(virtualField, { BackgroundColor3 = color3425 }, 1, "In", "Quint")
	end)
	audioService.UndimSongs()
end
function module.BloxyAlly(p1080, p1081, p1082, p1083)
	task.spawn(function()
		audioServicePlaySound("OpenSound")

		local v2977 = p1080
		local v2978 = p1081
		local v2979 = p1083

		effectsServicePreloadTech(v2977, "rbxassetid://12122823106")

		local s1

		if v2979 == "" then
			s1 = ""
		elseif v2979 == "Enemy" then
			s1 = "Enemy"
		else
			s1 = nil
		end

		local s2: string = "rbxassetid://12122823106"

		task.spawn(function()
			for _, v in pairs(_G.__NoFaces(v2978.Parent.Parent[s1 .. "Field"])) do
				task.spawn(function()
					local v3189 = UDim2.fromOffset(v.AbsoluteSize.X * 0.5, v.AbsoluteSize.Y * 0.5)
					local v3190 = v
					local uDim2 = UDim2.new(0, v3190.AbsolutePosition.X, 0, v3190.AbsolutePosition.Y)
					local uDim2122 = UDim2.new(0, v3190.AbsoluteSize.X * 0.5, 0, v3190.AbsoluteSize.Y * 0.5)

					v3190 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
					effectsServiceNewerCircle(v2977, {
						BackgroundTransparency = 1,
						ImageTransparency = 1,
						Size = v3189,
						Position = uDim2 + uDim2122 - v3190
					})
					v3189 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
					v3190 = v

					local uDim2123 = UDim2.new(0, v3190.AbsolutePosition.X, 0, v3190.AbsolutePosition.Y)
					local uDim2124 = UDim2.new(0, v3190.AbsoluteSize.X * 0.5, 0, v3190.AbsoluteSize.Y * 0.5)

					v3190 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

					local n1 = v.ZIndex + 1000
					local randomNumber = math.random(-20, 20)
					local v3197 = effectsServiceNewerCircle(v2977, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Size = v3189,
						Position = uDim2123 + uDim2124 - v3190,
						Image = s2,
						ZIndex = n1,
						Rotation = randomNumber
					})

					task.spawn(function()
						local animationAnimate = animation.Animate
						local v3216 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

						animationAnimate(v3197, { Size = v3216 }, 1.1, "In", "Quad")
						v3197:Destroy()
					end)

					local vPosition = v.Position

					for _ = 1, 3 do
						local vPosition4 = v.Position
						local v3201 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 24)

						v.Position = vPosition4 - v3201
						animation.Animate(v, { Position = vPosition }, 0.2, "In", "Quint")
					end
				end)
			end
		end)
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.EatRandomFoodAlly(p1084, p1085, p1086, p1087)
	local t44: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t45: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		local randomNumber = math.random(1, #t44)

		audioServicePlaySound(t44[randomNumber])
		task.wait(0.3)

		local randomNumber15 = math.random(1, #t45)

		audioServicePlaySound(t45[randomNumber15])
	end)
	task.spawn(function()
		EatFoodAlly(p1084, p1085, p1086, p1087, t1)
	end)
	task.wait(0.5)
end
function module.EatPancakesAlly(p1088, p1089, p1090, p1091)
	local t46: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t47: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		local randomNumber = math.random(1, #t46)

		audioServicePlaySound(t46[randomNumber])
		task.wait(0.3)

		local randomNumber16 = math.random(1, #t47)

		audioServicePlaySound(t47[randomNumber16])
	end)
	task.spawn(function()
		EatFoodAlly(p1088, p1089, p1090, p1091, "rbxassetid://10270776441")
	end)
	task.wait(0.5)
end
function module.EatTacosAlly(p1092, p1093, p1094, p1095)
	local t48: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t49: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		audioServicePlaySound("Taco")
		task.wait(0.3)

		local randomNumber = math.random(1, #t49)

		audioServicePlaySound(t49[randomNumber])
	end)
	task.spawn(function()
		EatFoodAlly(p1092, p1093, p1094, p1095, "rbxassetid://14316250795")
	end)
	task.wait(0.3)
	audioServicePlaySound("Chavez")
	task.wait(0.2)
end
function module.EatCakeAlly(p1096, p1097, p1098, p1099)
	local t50: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t51: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		local randomNumber = math.random(1, #t50)

		audioServicePlaySound(t50[randomNumber])
		task.wait(0.3)

		local randomNumber17 = math.random(1, #t51)

		audioServicePlaySound(t51[randomNumber17])
	end)
	task.spawn(function()
		EatFoodAlly(p1096, p1097, p1098, p1099, "rbxassetid://12124921013")
	end)
	task.wait(0.5)
end
function module.EatBirthdayCakeAlly(p1100, p1101, p1102, p1103)
	local t52: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t53: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		audioServicePlaySound("HappyBirthday")
		task.wait(0.1)

		local randomNumber = math.random(1, #t52)

		audioServicePlaySound(t52[randomNumber])
		task.wait(0.2)

		local randomNumber18 = math.random(1, #t53)

		audioServicePlaySound(t53[randomNumber18])
	end)
	task.spawn(function()
		EatFoodAlly(p1100, p1101, p1102, p1103, "rbxassetid://12124921013")
	end)
	task.wait(0.5)
end
function module.EatTurkeyAlly(p1104, p1105, p1106, p1107)
	local t54: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t55: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	audioServicePlaySound("Gobble")
	task.spawn(function()
		local randomNumber = math.random(1, #t54)

		audioServicePlaySound(t54[randomNumber])
		task.wait(0.3)

		local randomNumber19 = math.random(1, #t55)

		audioServicePlaySound(t55[randomNumber19])
	end)
	task.spawn(function()
		EatFoodAlly(p1104, p1105, p1106, p1107, "rbxassetid://12135944951")
	end)
	task.wait(0.5)
end
function module.BeamEnemy(p1108, p1109, p1110, p1111)
	audioServicePlaySound("EntranceOfGreat")

	local t56: {[any]: any} = {}

	local function track(p1112)
		table.insert(t56, p1112)

		return p1112
	end

	local s1

	if p1111 == "" then
		s1 = "Enemy"
	elseif p1111 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v2251 = p1108.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local sciFi = Enum.Font.SciFi
	local color3426 = Color3.fromRGB(255, 149, 19)
	local n1 = p1109.ZIndex + 10000

	audioServicePlaySound("LaserChargeup")

	local t57: {[any]: any} = {
		Text = "TARGETS LOCKED",
		TextStrokeTransparency = 0.1,
		Font = sciFi,
		TextColor3 = color3426,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServiceSpeakEnemyField(p1108, p1109, p1110, p1111, t57, 0.5)
	end)

	local color3427 = Color3.fromRGB(0, 0, 0)
	local v2257 = uDim2New(1, 0, 2, 0)
	local v2258 = uDim2New(0.5, 0, 0.5, 0)
	local v2259 = effectsServiceNewerCircle(p1108, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3427,
		Size = v2257,
		Position = v2258
	})

	table.insert(t56, v2259)
	animation.AnimateAsync(v2259, { BackgroundTransparency = 0.4 }, 0.25, "Out", "Quint")
	task.wait(0.8)

	local function createRangeCircle(p1113, p1114, p1115)
		local v2998 = UDim2.fromScale(0, p1115)
		local v2999 = effectsServiceNewerCircle(p1108, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Rotation = p1114,
			Size = v2998,
			Position = p1113
		})

		table.insert(t56, v2999)

		return v2999
	end

	local v2261 = UDim2.fromScale(-1, 0)
	local v2262 = UDim2.fromOffset(v2251.AbsolutePosition.X + v2251.AbsoluteSize.X / 2, 0)
	local v2263 = createRangeCircle(v2261 + v2262, 90, 2.5)
	local uDim2 = UDim2.new(0, v2251.AbsolutePosition.X, 0, v2251.AbsolutePosition.Y)
	local uDim2125 = UDim2.new(0, v2251.AbsoluteSize.X * 0.5, 0, v2251.AbsoluteSize.Y * 0.5)
	local v2266 = UDim2.fromScale(1, 0)
	local v2267 = createRangeCircle(uDim2 + uDim2125 + v2266, 90, 1)

	task.spawn(function()
		local t81: {[any]: any} = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255) }
		local v3001 = UDim2.fromOffset(v2251.AbsoluteSize.X * 0.2, v2251.AbsoluteSize.X * 0.1)

		effectsServiceEmit(p1108, v2267, {
			Projectile = "rbxassetid://243728206",
			Strength = 2000,
			Speed = 0.8,
			EasingStyle = "Linear",
			Time = 2.5,
			Color = t81,
			Size = v3001,
			Range = v2263,
			ZIndex = v2251.ZIndex + 15000
		})
	end)
	task.wait(0.35)

	for _, v in pairs(_G.__NoFaces(p1109.Parent.Parent[s1 .. "Field"])) do
		task.spawn(function()
			task.wait(0.15)
			effectsService.ShakeSync(v, v.Position, 2, 0.6)
			v.ImageColor3 = Color3.fromRGB(40, 40, 40)
		end)
	end

	audioServicePlaySound("velkozult")

	local color3428 = Color3.fromRGB(255, 255, 255)
	local v2271 = uDim2New(0.125, 0, 2.25, 0)
	local uDim2126 = UDim2.new(0, v2251.AbsolutePosition.X, 0, v2251.AbsolutePosition.Y)
	local uDim2127 = UDim2.new(0, v2251.AbsoluteSize.X * 0.5, 0, v2251.AbsoluteSize.Y * 0.5)
	local v2274 = effectsServiceNewerCircle(p1108, {
		Image = "rbxassetid://10248621823",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 90,
		ImageColor3 = color3428,
		Size = v2271,
		Position = uDim2126 + uDim2127,
		ZIndex = v2251.ZIndex + 10000
	})

	table.insert(t56, v2274)
	task.spawn(function()
		for _ = 1, 20 do
			if not v2274 then
				return
			end

			local v3003 = v2274

			v3003.Rotation = v3003.Rotation + 180
			task.wait(0.1)
		end
	end)
	task.spawn(function()
		if v2274 then
			effectsService.Shake(v2274, v2274.Position, 2, 0.05)
		end

		effectsService.ShakeBattle(p1108, 1.5, 0.05)
	end)

	local animationAnimate = animation.Animate

	v2271 = UDim2.fromScale(0, 2.5)
	animationAnimate(v2274, { Size = v2271 }, 2.75, "In", "Quint")
	task.spawn(function()
		animation.Animate(v2259, { BackgroundTransparency = 1 }, 0.5, "Out", "Quint")
	end)
	task.delay(2.75, function()
		for _, v in ipairs(t56) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
function module.FireBreathEnemy(p1116, p1117, p1118, p1119)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3429 = Color3.fromRGB(240, 157, 54)
	local color3430 = Color3.fromRGB(217, 66, 39)
	local color3431 = Color3.fromRGB(240, 195, 87)
	local color3432 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathEnemy(p1116, p1117, p1118, p1119, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3429, color3430, color3431, color3432, 1.5, 2)
end
function module.IceBreathEnemy(p1120, p1121, p1122, p1123)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3433 = Color3.fromRGB(186, 226, 240)
	local color3434 = Color3.fromRGB(157, 202, 207)
	local color3435 = Color3.fromRGB(202, 235, 255)
	local color3436 = Color3.fromRGB(183, 235, 243)

	effectsServiceBreathEnemy(p1120, p1121, p1122, p1123, 100, effectsServiceBreathimagesIce, "IceBreath", 1, color3433, color3434, color3435, color3436, 1.65, 2.15)
end
function module.AcidBreathEnemy(p1124, p1125, p1126, p1127)
	local color3437 = Color3.fromRGB(197, 0, 0)
	local color3438 = Color3.fromRGB(177, 0, 0)
	local color3439 = Color3.fromRGB(211, 9, 2)
	local color3440 = Color3.fromRGB(182, 0, 0)

	effectsServiceBreathEnemy(p1124, p1125, p1126, p1127, 100, "rbxassetid://1249690853", "BubbleBeam", 1, color3437, color3438, color3439, color3440, 2.25, 2.5)
end
function module.BubbleBreathEnemy(p1128, p1129, p1130, p1131)
	local color3441 = Color3.fromRGB(105, 204, 240)
	local color3442 = Color3.fromRGB(137, 234, 253)
	local color3443 = Color3.fromRGB(139, 178, 202)
	local color3444 = Color3.fromRGB(51, 138, 188)

	effectsServiceBreathEnemy(p1128, p1129, p1130, p1131, 100, "rbxassetid://1249690853", "BubbleBeam", 1, color3441, color3442, color3443, color3444, 2.25, 2.5)
end
function module.GooBreathEnemy(p1132, p1133, p1134, p1135)
	local color3445 = Color3.fromRGB(169, 85, 197)
	local color3446 = Color3.fromRGB(125, 72, 182)
	local color3447 = Color3.fromRGB(139, 58, 197)
	local color3448 = Color3.fromRGB(115, 0, 172)

	effectsServiceBreathEnemy(p1132, p1133, p1134, p1135, 100, "rbxassetid://1249690853", "BubbleBeam", 1, color3445, color3446, color3447, color3448, 2.25, 2.5)
end
function module.SwampBreathEnemy(p1136, p1137, p1138, p1139)
	local color3449 = Color3.fromRGB(78, 171, 86)
	local color3450 = Color3.fromRGB(46, 131, 56)
	local color3451 = Color3.fromRGB(59, 168, 59)
	local color3452 = Color3.fromRGB(7, 106, 0)

	effectsServiceBreathEnemy(p1136, p1137, p1138, p1139, 100, "rbxassetid://1249690853", "BubbleBeam", 1, color3449, color3450, color3451, color3452, 2.25, 2.5)
end
function module.PoisonHazeEnemy(p1140, p1141, p1142, p1143)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3453 = Color3.fromRGB(80, 33, 107)
	local color3454 = Color3.fromRGB(151, 94, 217)
	local color3455 = Color3.fromRGB(152, 63, 197)
	local color3456 = Color3.fromRGB(109, 41, 138)

	effectsServiceBreathEnemy(p1140, p1141, p1142, p1143, 100, effectsServiceBreathimagesFire, "Spray", 0.8, color3453, color3454, color3455, color3456, 1.5, 2)
end
function module.AzureBreathEnemy(p1144, p1145, p1146, p1147)
	local color3457 = Color3.fromRGB(255, 85, 255)
	local color3458 = Color3.fromRGB(255, 85, 255)
	local color3459 = Color3.fromRGB(156, 52, 156)
	local color3460 = Color3.fromRGB(255, 85, 255)

	effectsServiceBreathEnemy(p1144, p1145, p1146, p1147, 100, "rbxassetid://7924475318", "Sparkle", 0.5, color3457, color3458, color3459, color3460, 1.5, 1.7)
end
function module.PixieBreathEnemy(p1148, p1149, p1150, p1151)
	if math.random(1, 2) == 1 then
		local color3461 = Color3.fromRGB(105, 2, 208)
		local color3462 = Color3.fromRGB(179, 0, 255)
		local color3463 = Color3.fromRGB(156, 40, 106)
		local color3464 = Color3.fromRGB(255, 49, 166)

		effectsServiceBreathEnemy(p1148, p1149, p1150, p1151, 100, "rbxassetid://13895587959", "Sparkle", 0.5, color3461, color3462, color3463, color3464, 1.5, 1.7)

		return
	end

	local color3465 = Color3.fromRGB(0, 255, 200)
	local color3466 = Color3.fromRGB(0, 183, 200)
	local color3467 = Color3.fromRGB(1, 163, 212)
	local color3468 = Color3.fromRGB(0, 89, 222)

	effectsServiceBreathEnemy(p1148, p1149, p1150, p1151, 100, "rbxassetid://13895587959", "Sparkle", 0.5, color3465, color3466, color3467, color3468, 1.5, 1.7)
end
function module.FireBreathEnemyInferno(p1152, p1153, p1154, p1155)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3469 = Color3.fromRGB(240, 157, 54)
	local color3470 = Color3.fromRGB(217, 66, 39)
	local color3471 = Color3.fromRGB(240, 195, 87)
	local color3472 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathEnemy(p1152, p1153, p1154, p1155, 70, effectsServiceBreathimagesFire, "FireBreathLong", 1.25, color3469, color3470, color3471, color3472, 1.5, 2)
end
function module.FlareBreathEnemy(p1156, p1157, p1158, p1159)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3473 = Color3.fromRGB(240, 55, 30)
	local color3474 = Color3.fromRGB(166, 28, 26)
	local color3475 = Color3.fromRGB(240, 32, 13)
	local color3476 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathEnemy(p1156, p1157, p1158, p1159, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3473, color3474, color3475, color3476, 1.5, 2)
end
function module.FlameBreathEnemy(p1160, p1161, p1162, p1163)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3477 = Color3.fromRGB(24, 174, 204)
	local color3478 = Color3.fromRGB(8, 72, 150)
	local color3479 = Color3.fromRGB(30, 91, 234)
	local color3480 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathEnemy(p1160, p1161, p1162, p1163, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3477, color3478, color3479, color3480, 1.5, 2)
end
function module.BlazeBreathEnemy(p1164, p1165, p1166, p1167)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3481 = Color3.fromRGB(204, 198, 33)
	local color3482 = Color3.fromRGB(220, 189, 15)
	local color3483 = Color3.fromRGB(255, 255, 43)
	local color3484 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathEnemy(p1164, p1165, p1166, p1167, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3481, color3482, color3483, color3484, 1.5, 2)
end
function module.ScorchBreathEnemy(p1168, p1169, p1170, p1171)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3485 = Color3.fromRGB(34, 240, 30)
	local color3486 = Color3.fromRGB(32, 180, 37)
	local color3487 = Color3.fromRGB(56, 184, 97)
	local color3488 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathEnemy(p1168, p1169, p1170, p1171, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3485, color3486, color3487, color3488, 1.5, 2)
end
function module.InfernoBreathEnemy(p1172, p1173, p1174, p1175)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3489 = Color3.fromRGB(163, 35, 206)
	local color3490 = Color3.fromRGB(144, 0, 180)
	local color3491 = Color3.fromRGB(240, 80, 224)
	local color3492 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathEnemy(p1172, p1173, p1174, p1175, 100, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3489, color3490, color3491, color3492, 1.5, 2)
end
function module.NerdyEnemy(p1176, p1177, p1178, p1179)
	local effectsServiceBreathimagesNerdy = effectsServiceBreathimages.nerdy
	local color3493 = Color3.fromRGB(197, 197, 197)
	local color3494 = Color3.fromRGB(255, 255, 255)
	local color3495 = Color3.fromRGB(255, 248, 248)
	local color3496 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathEnemy(p1176, p1177, p1178, p1179, 65, effectsServiceBreathimagesNerdy, "Sparkle", 0.8, color3493, color3494, color3495, color3496, 1.5, 1.7)
end
function module.PoisonHazeEnemyHand(p1180, p1181, p1182, p1183)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3497 = Color3.fromRGB(80, 33, 107)
	local color3498 = Color3.fromRGB(151, 94, 217)
	local color3499 = Color3.fromRGB(152, 63, 197)
	local color3500 = Color3.fromRGB(109, 41, 138)

	effectsServiceBreathEnemyHand(p1180, p1181, p1182, p1183, 80, effectsServiceBreathimagesFire, "Spray", 0.8, color3497, color3498, color3499, color3500, 1.5, 2)
end
function module.FireBreathEnemyHand(p1184, p1185, p1186, p1187)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3501 = Color3.fromRGB(240, 157, 54)
	local color3502 = Color3.fromRGB(217, 66, 39)
	local color3503 = Color3.fromRGB(240, 195, 87)
	local color3504 = Color3.fromRGB(217, 61, 22)

	effectsServiceBreathEnemyHand(p1184, p1185, p1186, p1187, 80, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3501, color3502, color3503, color3504, 1.5, 2)
end
local function BreathEnemyDeck(p1188, p1189, _, p1191, p1192, p1193, p1194, p1195, p1196, p1197, p1198, p1199, p1200, p1201, p1202)
	effectsServicePreloadTech(p1188, p1193)

	local s1
	local s2

	if p1191 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p1191 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v2453 = p1188.Parent.BattleNew["Virtual" .. s2 .. "Deck"]

	if p1202 then
		v2453 = p1188.Parent.BattleNew["Virtual" .. s1 .. "Deck"]
	end

	audioServicePlaySound(p1194)

	if not p1189 then
		p1189 = p1188.Parent.BattleNew
	else
		task.spawn(function()
			effectsService.Shake(p1189, p1189.Position, 0.7 * p1195, 0.1)
		end)
	end

	local n1 = v2453.AbsolutePosition.Y + v2453.AbsoluteSize.Y / 2
	local uDim2 = UDim2.new(0, v2453.AbsoluteSize.Y / p1200, 0, v2453.AbsoluteSize.Y / p1200)
	local uDim2128 = UDim2.new(0, v2453.AbsolutePosition.X, 0, n1)
	local v2457 = effectsServiceNewerCircle(p1188, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim2128
	})
	local v2458 = UDim2.fromOffset(v2453.AbsoluteSize.Y / p1201, v2453.AbsoluteSize.Y / p1201)
	local uDim2129 = UDim2.new(0, v2453.AbsolutePosition.X + v2453.AbsoluteSize.X, 0, n1)

	v2457:TweenPosition(uDim2129, "In", "Quad", 0.5 * p1195)

	local t58: {[any]: any} = {
		Projectile = p1193,
		Color = { p1196, p1197 },
		Size = v2458,
		Strength = p1192 * p1195,
		Time = 0.5 * p1195
	}

	effectsServiceBreath(p1188, p1189, v2457, t58)
	t58.Color = { p1198, p1199 }
	effectsServiceBreath(p1188, p1189, v2457, t58)
	wait(0.45 * p1195)
end
function module.IceBreathEnemyDeck(p1203, p1204, p1205, p1206)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3505 = Color3.fromRGB(186, 226, 240)
	local color3506 = Color3.fromRGB(157, 202, 207)
	local color3507 = Color3.fromRGB(202, 235, 255)
	local color3508 = Color3.fromRGB(183, 235, 243)

	BreathEnemyDeck(p1203, p1204, p1205, p1206, 150, effectsServiceBreathimagesIce, "IceBreath", 1, color3505, color3506, color3507, color3508, 1.65, 2.15)
end
function module.FireBreathAllyDeck(p1207, p1208, p1209, p1210)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3509 = Color3.fromRGB(240, 157, 54)
	local color3510 = Color3.fromRGB(217, 66, 39)
	local color3511 = Color3.fromRGB(240, 195, 87)
	local color3512 = Color3.fromRGB(217, 61, 22)

	BreathEnemyDeck(p1207, p1208, p1209, p1210, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1.25, color3509, color3510, color3511, color3512, 1.65, 2.15, true)
end
function module.FireBreathAll(p1211, _, p1213, p1214)
	local u2483 = nil

	effectsService.ShakeBattleSync(p1211, 2, 0.05)
	task.spawn(function()
		module.FireBreathEnemyInferno(p1211, u2483, p1213, p1214)
	end)
	task.spawn(function()
		module.FireBreathAllyInferno(p1211, u2483, p1213, p1214)
		wait(0.05)
	end)
	wait(0.2)
end
function module.InfernoBreathAll(p1215, _, p1217, p1218)
	local u2488 = nil

	effectsService.ShakeBattleSync(p1215, 3, 0.05)
	task.spawn(function()
		module.InfernoBreathEnemy(p1215, u2488, p1217, p1218)
	end)
	task.spawn(function()
		module.InfernoBreathAlly(p1215, u2488, p1217, p1218)
		wait(0.05)
	end)
	wait(0.2)
end
function module.IceBreathAll(p1219, _, p1221, p1222)
	local u2493 = nil

	effectsService.ShakeBattleSync(p1219, 3, 0.05)
	task.spawn(function()
		module.IceBreathEnemy(p1219, u2493, p1221, p1222)
	end)
	task.spawn(function()
		module.IceBreathAlly(p1219, u2493, p1221, p1222)
		wait(0.05)
	end)
	wait(0.2)
end
function module.NerdyAll(p1223, _, p1225, p1226)
	local u2498 = nil

	effectsService.ShakeBattleSync(p1223, 3, 0.05)
	task.spawn(function()
		module.NerdyEnemy(p1223, u2498, p1225, p1226)
	end)
	task.spawn(function()
		module.NerdyAlly(p1223, u2498, p1225, p1226)
		wait(0.05)
	end)
	wait(0.2)
end
function module.FireBreathEverything(p1227, _, p1229, p1230)
	local u2503 = nil

	effectsService.ShakeBattleSync(p1227, 2, 0.05)
	task.spawn(function()
		module.FireBreathEnemyInferno(p1227, u2503, p1229, p1230)
		module.FireBreathEnemyHand(p1227, u2503, p1229, p1230)
	end)
	task.spawn(function()
		module.FireBreathAllyInferno(p1227, u2503, p1229, p1230)
		module.FireBreathAllyHand(p1227, u2503, p1229, p1230)
		wait(0.05)
	end)
	wait(0.05)
end
function module.PoisonHazeAll(p1231, _, p1233, p1234)
	local u2508 = nil

	task.spawn(function()
		module.PoisonHazeEnemy(p1231, u2508, p1233, p1234)
	end)
	task.spawn(function()
		module.PoisonHazeAlly(p1231, u2508, p1233, p1234)
		wait(0.05)
	end)
	wait(0.05)
end
function module.PoisonHazeAllHand(p1235, _, p1237, p1238)
	local u2513 = nil

	effectsService.ShakeBattleSync(p1235, 2, 0.05)
	task.spawn(function()
		module.PoisonHazeEnemyHand(p1235, u2513, p1237, p1238)
	end)
	task.spawn(function()
		module.PoisonHazeAllyHand(p1235, u2513, p1237, p1238)
		wait(0.05)
	end)
	wait(0.05)
end
function module.PoisonHazeEverything(p1239, _, p1241, p1242)
	local u2518 = nil

	effectsService.ShakeBattleSync(p1239, 2, 0.05)
	task.spawn(function()
		module.PoisonHazeAllyHand(p1239, u2518, p1241, p1242)
	end)
	task.spawn(function()
		module.PoisonHazeEnemyHand(p1239, u2518, p1241, p1242)
	end)
	task.spawn(function()
		task.wait(1.5)
		task.spawn(function()
			module.PoisonHazeAlly(p1239, u2518, p1241, p1242)
		end)
		task.spawn(function()
			module.PoisonHazeEnemy(p1239, u2518, p1241, p1242)
		end)
	end)
	wait(0.05)
end
local function FlagEnemy(p1243, p1244, _, p1246, p1247, p1248, p1249, p1250, p1251, p1252, p1253, p1254, p1255, p1256)
	local s1

	if p1246 == "" then
		s1 = "Enemy"
	elseif p1246 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1244.Parent.Parent[s1 .. "Field"])) do
			local v3008 = UDim2.fromOffset(v.AbsoluteSize.X * p1248, v.AbsoluteSize.X * p1248)
			local uDim2 = UDim2.new(0, v.AbsolutePosition.X, 0, v.AbsolutePosition.Y)
			local uDim2130 = UDim2.new(0, v.AbsoluteSize.X * 0.5, 0, v.AbsoluteSize.Y * 0.5)
			local v3011 = effectsServiceNewerCircle(p1243, {
				BackgroundTransparency = 1,
				Image = p1247,
				ImageTransparency = p1254 or 0,
				Size = v3008,
				Position = uDim2 + uDim2130,
				ZIndex = v.ZIndex + 10000
			})

			effectsServicePreloadTech(p1243, { p1247 })

			local t82: {[any]: any} = {
				Time = p1252 or 0.5,
				FlashTime = p1253 or 0.2,
				Color = { p1249, p1250 },
				SizeMultiplier = p1256 or 1,
				Transparency = p1255 or 0.1
			}

			spawn(function()
				effectsServicePulse(p1243, v3011, t82)
			end)
			animation.AnimateAsync(v3011, { ImageTransparency = p1254 or 0 }, 0.25, "Out", "Quint")
			animation.AnimateAsync(v3011, { Rotation = p1251 }, 1, "Out", "Quint")
			spawn(function()
				wait(0.5)
				animation.Animate(v3011, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
				v3011:Destroy()
			end)
		end
	end)
end
function module.TheStalkerStrike(p1257, p1258, _, p1260)
	local s1

	if p1260 == "" then
		s1 = "Enemy"
	elseif p1260 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v2541 = p1257.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local t59: {[any]: any} = { "StalkerScream1", "StalkerScream2", "StalkerScream3" }
	local v2543 = uDim2New(0, v2541.AbsoluteSize.Y * 1.45, 0, v2541.AbsoluteSize.Y * 1.45)
	local v2544 = uDim2New(0, v2541.AbsolutePosition.X, 0, v2541.AbsolutePosition.Y + v2541.AbsoluteSize.Y / 2)
	local color3513 = Color3.fromRGB(126, 0, 0)
	local v2546 = effectsServiceNewerCircle(p1257, {
		ZIndex = 10001,
		BackgroundTransparency = 1,
		Image = "rbxassetid://12191928694",
		ImageTransparency = 0.2,
		Rotation = 85,
		Visible = true,
		Size = v2543,
		Position = v2544,
		ImageColor3 = color3513
	})
	local v2547 = uDim2New(0, v2541.AbsoluteSize.X / 2, 0, v2541.AbsoluteSize.Y * 6.5)
	local uDim2 = UDim2.new(0, v2541.AbsolutePosition.X, 0, v2541.AbsolutePosition.Y)
	local uDim2131 = UDim2.new(0, v2541.AbsoluteSize.X * 0.5, 0, v2541.AbsoluteSize.Y * 0.5)
	local color3514 = Color3.fromRGB(52, 0, 0)
	local v2551 = effectsServiceNewerCircle(p1257, {
		ZIndex = 10000,
		BackgroundTransparency = 1,
		Image = "rbxassetid://12187816291",
		Rotation = -95,
		Visible = false,
		Size = v2547,
		Position = uDim2 + uDim2131,
		ImageColor3 = color3514
	})

	effectsServiceWaitX(0.2)
	effectsService.ShakeSync(v2546, v2546.Position, 0.3, 0.2)
	spawn(function()
		local v3013 = uDim2New(0, v2541.AbsolutePosition.X + v2541.AbsoluteSize.X, 0, v2541.AbsolutePosition.Y + v2541.AbsoluteSize.Y / 2)

		v2546:TweenPosition(v3013, "Out", "Quart", 0.65, true)
	end)
	effectsService.ShakeSync(p1258, p1258.Position, 0.4, 0.2)
	audioService.PlaySound("Woosh")
	audioService.PlaySound("StalkerRage")
	effectsServiceWaitX(0.6)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1258.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 1, 0.0125)
			end)
		end
	end)
	spawn(function()
		local audioServicePlaySound = audioService.PlaySound
		local randomNumber = math.random(1, #t59)

		audioServicePlaySound(t59[randomNumber])
		effectsServiceNewTweenProperty(v2546, "ImageTransparency", 0, 1, 0.1, "Quad")
		effectsServiceWaitX(0.5)
		v2546:Destroy()
	end)
	audioService.PlaySound("ClawStrike")
	v2551.Visible = true
	effectsService.Shake(v2551, v2551.Position, 0.4, 0.2)
	effectsServiceWaitX(0.5)
	spawn(function()
		effectsServiceNewTweenProperty(v2551, "ImageTransparency", 0, 1, 0.5, "Quad")
		effectsServiceWaitX(1)
		v2551:Destroy()
	end)
end
function module.BloxyEnemy(p1261, p1262, p1263, p1264)
	task.spawn(function()
		audioServicePlaySound("OpenSound")

		local v3018 = p1261
		local v3019 = p1262
		local v3020 = p1264

		effectsServicePreloadTech(v3018, "rbxassetid://12122823106")

		local s1

		if v3020 == "" then
			s1 = "Enemy"
		elseif v3020 == "Enemy" then
			s1 = ""
		else
			s1 = nil
		end

		local s2: string = "rbxassetid://12122823106"

		task.spawn(function()
			for _, v in pairs(_G.__NoFaces(v3019.Parent.Parent[s1 .. "Field"])) do
				task.spawn(function()
					local v3202 = UDim2.fromOffset(v.AbsoluteSize.X * 0.5, v.AbsoluteSize.Y * 0.5)
					local v3203 = v
					local uDim2 = UDim2.new(0, v3203.AbsolutePosition.X, 0, v3203.AbsolutePosition.Y)
					local uDim2132 = UDim2.new(0, v3203.AbsoluteSize.X * 0.5, 0, v3203.AbsoluteSize.Y * 0.5)

					v3203 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.3)
					effectsServiceNewerCircle(v3018, {
						BackgroundTransparency = 1,
						ImageTransparency = 1,
						Size = v3202,
						Position = uDim2 + uDim2132 - v3203
					})
					v3202 = UDim2.fromOffset(v.AbsoluteSize.X * 1.2, v.AbsoluteSize.X * 1.2)
					v3203 = v

					local uDim2133 = UDim2.new(0, v3203.AbsolutePosition.X, 0, v3203.AbsolutePosition.Y)
					local uDim2134 = UDim2.new(0, v3203.AbsoluteSize.X * 0.5, 0, v3203.AbsoluteSize.Y * 0.5)

					v3203 = UDim2.fromOffset(0, v.AbsoluteSize.Y * 0.16)

					local n1 = v.ZIndex + 1000
					local randomNumber = math.random(-20, 20)
					local v3210 = effectsServiceNewerCircle(v3018, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Size = v3202,
						Position = uDim2133 + uDim2134 - v3203,
						Image = s2,
						ZIndex = n1,
						Rotation = randomNumber
					})

					task.spawn(function()
						local animationAnimate = animation.Animate
						local v3218 = UDim2.fromOffset(v.AbsoluteSize.X * 0.1, v.AbsoluteSize.X * 0.1)

						animationAnimate(v3210, { Size = v3218 }, 1.1, "In", "Quad")
						v3210:Destroy()
					end)

					local vPosition = v.Position

					for _ = 1, 3 do
						local vPosition5 = v.Position
						local v3214 = UDim2.fromOffset(0, v.AbsoluteSize.Y / 24)

						v.Position = vPosition5 - v3214
						animation.Animate(v, { Position = vPosition }, 0.2, "In", "Quint")
					end
				end)
			end
		end)
		task.wait(0.3)
		audioServicePlaySound("DrinkSound")
	end)
	task.wait(0.5)
end
function module.EatRandomFoodEnemy(p1265, p1266, p1267, p1268)
	local t60: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t61: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		local randomNumber = math.random(1, #t60)

		audioServicePlaySound(t60[randomNumber])
		task.wait(0.3)

		local randomNumber20 = math.random(1, #t61)

		audioServicePlaySound(t61[randomNumber20])
	end)
	task.spawn(function()
		EatFoodEnemy(p1265, p1266, p1267, p1268, t1)
	end)
	task.wait(0.5)
end
function module.EatTurkeyEnemy(p1269, p1270, p1271, p1272)
	local t62: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t63: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	audioServicePlaySound("Gobble")
	task.spawn(function()
		local randomNumber = math.random(1, #t62)

		audioServicePlaySound(t62[randomNumber])
		task.wait(0.3)

		local randomNumber21 = math.random(1, #t63)

		audioServicePlaySound(t63[randomNumber21])
	end)
	task.spawn(function()
		EatFoodEnemy(p1269, p1270, p1271, p1272, "rbxassetid://12135944951")
	end)
	task.wait(0.5)
end
function module.EatCakeEnemy(p1273, p1274, p1275, p1276)
	local t64: {[any]: any} = { "Crumbling", "Mmmm", "Munch", "Yummy", "Yum" }
	local t65: {[any]: any} = { "Nom", "Om Nom Nom", "eat" }

	task.spawn(function()
		local randomNumber = math.random(1, #t64)

		audioServicePlaySound(t64[randomNumber])
		task.wait(0.3)

		local randomNumber22 = math.random(1, #t65)

		audioServicePlaySound(t65[randomNumber22])
	end)
	task.spawn(function()
		EatFoodEnemy(p1273, p1274, p1275, p1276, "rbxassetid://12124921013")
	end)
	task.wait(0.5)
end
function module.InfernoBreathEnemyBaseplate(p1277, p1278, p1279, p1280)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3515 = Color3.fromRGB(163, 35, 206)
	local color3516 = Color3.fromRGB(144, 0, 180)
	local color3517 = Color3.fromRGB(240, 80, 224)
	local color3518 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathEnemyBaseplate(p1277, p1278, p1279, p1280, 150, effectsServiceBreathimagesFire, "FireBreathLong", 1, color3515, color3516, color3517, color3518, 1.5, 2)
end
function module.Bloxpin(p1281, _, _, p1284)
	local t66: {[any]: any} = { "teddy1", "teddy2", "teddy3" }
	local v2588 = p1281.Parent.BattleNew["Virtual" .. p1284 .. "Graveyard"]
	local v2589 = UDim2.fromOffset(v2588.AbsoluteSize.Y * 1.5, v2588.AbsoluteSize.Y * 1.5)
	local uDim2 = UDim2.new(0, v2588.AbsolutePosition.X, 0, v2588.AbsolutePosition.Y)
	local uDim2135 = UDim2.new(0, v2588.AbsoluteSize.X * 0.5, 0, v2588.AbsoluteSize.Y * 0.5)
	local v2592 = effectsServiceNewerCircle(p1281, {
		BackgroundTransparency = 1,
		Size = v2589,
		Position = uDim2 + uDim2135
	})
	local t67: {[any]: any} = { Color3.fromRGB(223, 223, 223), Color3.fromRGB(255, 215, 114) }
	local v2594 = UDim2.fromOffset(v2588.AbsoluteSize.X * 1.8, v2588.AbsoluteSize.X * 1.8)
	local randomNumber = math.random(1, #t66)

	audioServicePlaySound(t66[randomNumber])

	local t68: {[any]: any} = {
		Projectile = "rbxassetid://14230689",
		Strength = 20,
		Speed = 0.4,
		EasingStyle = "Quad",
		Time = 0.4,
		Color = t67,
		Size = v2594,
		Range = v2592
	}

	effectsServiceEmit(p1281, v2588, t68)
	t68.Color = { Color3.fromRGB(240, 236, 185), Color3.fromRGB(240, 240, 240) }
	effectsServiceEmit(p1281, v2588, t68)
	v2592:Destroy()
end
function module.TrainWhistle(p1285, p1286, _, _)
	local t69: {[any]: any} = { "TrainWhistle1", "TrainWhistle2", "TrainWhistle3" }
	local v2602 = UDim2.fromOffset(p1286.AbsoluteSize.Y * 0.4, p1286.AbsoluteSize.Y * 0.4)
	local uDim2 = UDim2.new(0, p1286.AbsolutePosition.X, 0, p1286.AbsolutePosition.Y)
	local uDim2136 = UDim2.new(0, p1286.AbsoluteSize.X * 0.5, 0, p1286.AbsoluteSize.Y * 0.5)
	local v2605 = UDim2.fromOffset(0, p1286.AbsoluteSize.Y * 0.7)
	local v2606 = effectsServiceNewerCircle(p1285, {
		BackgroundTransparency = 1,
		Size = v2602,
		Position = uDim2 + uDim2136 - v2605
	})
	local v2607 = UDim2.fromOffset(p1286.AbsoluteSize.Y * 0.15, p1286.AbsoluteSize.Y * 0.15)
	local uDim2137 = UDim2.new(0, p1286.AbsolutePosition.X, 0, p1286.AbsolutePosition.Y)
	local uDim2138 = UDim2.new(0, p1286.AbsoluteSize.X * 0.5, 0, p1286.AbsoluteSize.Y * 0.5)
	local v2610 = effectsServiceNewerCircle(p1285, {
		BackgroundTransparency = 1,
		Size = v2607,
		Position = uDim2137 + uDim2138
	})
	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	v2602 = { Color3.fromRGB(185, 185, 185), Color3.fromRGB(126, 126, 126) }
	local v2612 = UDim2.fromOffset(p1286.AbsoluteSize.X * 0.8, p1286.AbsoluteSize.X * 0.8)
	local randomNumber = math.random(1, #t69)

	audioServicePlaySound(t69[randomNumber])

	local t70: {[any]: any} = {
		Strength = 60,
		Speed = 0.4,
		EasingStyle = "Quint",
		Time = 0.4,
		Projectile = effectsServiceBreathimagesSmoke,
		Color = v2602,
		Size = v2612,
		Range = v2606
	}

	effectsServiceBreath(p1285, v2610, v2606, t70)
	t70.Color = { Color3.fromRGB(102, 102, 102), Color3.fromRGB(184, 184, 184) }
	effectsServiceBreath(p1285, v2610, v2606, t70)
	v2606:Destroy()
	v2610:Destroy()
	wait(0.5)
end
function module.MonsterTruck(p1289, p1290, _, _)
	audioServicePlaySound("Rev up")
	audioServicePlaySound("TruckHonk")

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local t71: {[any]: any} = { Color3.fromRGB(145, 145, 145), Color3.fromRGB(66, 66, 66) }
	local v2621 = UDim2.fromOffset(p1290.AbsoluteSize.Y / 3, p1290.AbsoluteSize.Y / 3)
	local v2622 = UDim2.fromOffset(0, 0)
	local v2623 = UDim2.fromOffset(p1290.AbsolutePosition.X + p1290.AbsoluteSize.X / 4, p1290.AbsolutePosition.Y + p1290.AbsoluteSize.Y)
	local v2624 = effectsServiceNewerCircle(p1289, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2622,
		Position = v2623
	})
	local v2625 = UDim2.fromOffset(p1290.AbsoluteSize.Y / 1.5, p1290.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, p1290.AbsolutePosition.X, 0, p1290.AbsolutePosition.Y)
	local uDim2139 = UDim2.new(0, p1290.AbsoluteSize.X * 0.5, 0, p1290.AbsoluteSize.Y * 0.5)
	local v2628 = UDim2.fromOffset(p1290.AbsoluteSize.X * 1.5, -p1290.AbsoluteSize.Y / 4)
	local v2629 = effectsServiceNewerCircle(p1289, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v2625,
		Position = uDim2 + uDim2139 - v2628
	})
	local t72: {[any]: any} = {
		Strength = 1000,
		Time = 0.5,
		Projectile = effectsServiceBreathimagesFire,
		Color = t71,
		Size = v2621
	}

	task.spawn(function()
		effectsServiceBreath(p1289, v2624, v2629, t72)

		if math.random(1, 100) == 1 then
			audioServicePlaySound("bad_to_bone")
		end
	end)

	local animationAnimate = animation.Animate

	v2628 = p1290.Position

	local v2632 = UDim2.fromOffset(p1290.AbsoluteSize.X / 4, p1290.AbsoluteSize.X / 8)

	animationAnimate(p1290, { Rotation = -30, Position = v2628 - v2632 }, 0.3, "Out", "Quint")

	local animate = animation.Animate

	v2628 = p1290.Position
	v2632 = UDim2.fromOffset(p1290.AbsoluteSize.X / 4, p1290.AbsoluteSize.X / 8)
	animate(p1290, { Rotation = 0, Position = v2628 + v2632 }, 0.3, "In", "Quint")
end
local function AcolyteEffect(p1293, p1294, _, _, p1297, p1298, p1299)
	audioServicePlaySound(p1298)

	if p1299 then
		audioServicePlaySound("AltarSound")
	end

	local n1 = p1294.ZIndex + 100001
	local v2642 = UDim2.fromOffset(p1294.AbsoluteSize.X, p1294.AbsoluteSize.X)
	local uDim2 = UDim2.new(0, p1294.AbsolutePosition.X, 0, p1294.AbsolutePosition.Y)
	local uDim2140 = UDim2.new(0, p1294.AbsoluteSize.X * 0.5, 0, p1294.AbsoluteSize.Y * 0.5)
	local v2645 = effectsServiceNewerCircle(p1293, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ImageColor3 = p1297,
		ZIndex = n1,
		Size = v2642,
		Position = uDim2 + uDim2140
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2647 = UDim2.fromOffset(p1294.AbsoluteSize.Y * 1, p1294.AbsoluteSize.Y * 1)

	animationAnimateAsync(v2645, { Size = v2647 }, 0.75, "Out", "Quint")
	animation.AnimateAsync(v2645, { ImageTransparency = 1 }, 0.75, "Out", "Quint")
	task.spawn(function()
		task.wait(0.75)
		v2645:Destroy()
	end)
	task.wait(0.05)
end
function module.AcolyteBlue(p1300, p1301, p1302, p1303)
	local color3519 = Color3.fromRGB(0, 0, 255)

	AcolyteEffect(p1300, p1301, p1302, p1303, color3519, "AcolyteSound")
end
function module.AcolyteRed(p1304, p1305, p1306, p1307)
	local color3520 = Color3.fromRGB(255, 0, 0)

	AcolyteEffect(p1304, p1305, p1306, p1307, color3520, "AcolyteSound")
end
function module.AcolyteGreen(p1308, p1309, p1310, p1311)
	local color3521 = Color3.fromRGB(0, 255, 0)

	AcolyteEffect(p1308, p1309, p1310, p1311, color3521, "AcolyteSound")
end
function module.AcolyteYellow(p1312, p1313, p1314, p1315)
	local color3522 = Color3.fromRGB(255, 255, 0)

	AcolyteEffect(p1312, p1313, p1314, p1315, color3522, "AcolyteSound")
end
function module.AcolyteNeutral(p1316, p1317, p1318, p1319)
	local color3523 = Color3.fromRGB(255, 255, 255)

	AcolyteEffect(p1316, p1317, p1318, p1319, color3523, "AcolyteSound")
end
function module.AcolyteAltar(p1320, p1321, p1322, p1323)
	local color3524 = Color3.fromRGB(255, 255, 255)

	AcolyteEffect(p1320, p1321, p1322, p1323, color3524, "AcolyteSound", true)
end
function module.NoliDomain(p1324, p1325, _, _)
	local v2682 = UDim2.fromOffset(p1325.AbsoluteSize.Y * 1.2, p1325.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p1325.AbsolutePosition.X, 0, p1325.AbsolutePosition.Y)
	local uDim2141 = UDim2.new(0, p1325.AbsoluteSize.X * 0.5, 0, p1325.AbsoluteSize.Y * 0.5)
	local v2685 = effectsServiceNewerCircle(p1324, {
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Size = v2682,
		Position = uDim2 + uDim2141
	})
	local color3525 = Color3.fromRGB(162, 0, 255)
	local v2687 = uDim2New(0, 0, 0, 0)
	local uDim2142 = UDim2.new(0, p1325.AbsolutePosition.X, 0, p1325.AbsolutePosition.Y)
	local uDim2143 = UDim2.new(0, p1325.AbsoluteSize.X * 0.5, 0, p1325.AbsoluteSize.Y * 0.5)
	local v2690 = effectsServiceNewerCircle(p1324, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://168705072",
		ZIndex = 1000001,
		ImageColor3 = color3525,
		Size = v2687,
		Position = uDim2142 + uDim2143
	})
	local color3526 = Color3.fromRGB(73, 0, 97)

	v2682 = UDim2.fromOffset(p1325.AbsoluteSize.X * 0.75, p1325.AbsoluteSize.X * 0.75)
	task.wait(0.2)

	local v2692 = p1325.Size

	v2687 = p1325.Position

	local v2693 = UDim2.fromOffset(p1325.AbsoluteSize.X * 2, p1325.AbsoluteSize.Y / 2)
	local v2694 = UDim2.fromOffset(p1325.AbsolutePosition.X - p1325.AbsoluteSize.X / 2, p1325.AbsolutePosition.Y + p1325.AbsoluteSize.Y / 4)

	animation.AnimateAsync(p1325, { Size = v2693 }, 0.2, "InOut", "Quint")
	animation.AnimateAsync(p1325, { Position = v2694 }, 0.2, "InOut", "Quint")
	task.wait(0.2)
	animation.AnimateAsync(p1325, { Size = v2692 }, 0.2, "Out", "Bounce")
	animation.AnimateAsync(p1325, { Position = v2687 }, 0.2, "Out", "Bounce")
	task.wait(0.05)

	local t73: {[any]: any} = {
		Projectile = "rbxassetid://298984512",
		Strength = 10000,
		ImageTransparency = 0.8,
		Speed = 1.2,
		EasingStyle = "Quint",
		Time = 0.2,
		Color = color3526,
		Size = v2682,
		Range = v2685
	}

	task.spawn(function()
		audioServicePlaySound("spawn06")

		local animationAnimateAsync = animation.AnimateAsync
		local v3031 = UDim2.fromOffset(p1325.AbsoluteSize.Y * 1.75, p1325.AbsoluteSize.Y * 1.75)

		animationAnimateAsync(v2690, { Size = v3031 }, 0.7, "Out", "Quart")
		task.wait(0.3)
		effectsServiceBreath(p1324, p1325, v2685, t73)
		task.wait(0.3)
		animation.AnimateAsync(v2690, { ImageTransparency = 1 }, 0.25, "Out", "Quart")
		task.wait(0.25)
		v2690:Destroy()
		v2685:Destroy()
	end)
	task.spawn(function()
		task.wait(0.2)

		for i = 1, 2 do
			local n1 = p1325.ZIndex + 100001
			local v3034 = UDim2.fromOffset(p1325.AbsoluteSize.X, p1325.AbsoluteSize.X)
			local v3035 = p1325
			local uDim2144 = UDim2.new(0, v3035.AbsolutePosition.X, 0, v3035.AbsolutePosition.Y)
			local uDim2145 = UDim2.new(0, v3035.AbsoluteSize.X * 0.5, 0, v3035.AbsoluteSize.Y * 0.5)
			local randomNumber = math.random(0, 360)
			local v3039 = effectsServiceNewerCircle(p1324, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v3034,
				Position = uDim2144 + uDim2145,
				Rotation = randomNumber
			})

			v3035 = p1325.ZIndex + 100001

			local v3040 = UDim2.fromOffset(p1325.AbsoluteSize.X, p1325.AbsoluteSize.X)
			local v3041 = p1325
			local uDim2146 = UDim2.new(0, v3041.AbsolutePosition.X, 0, v3041.AbsolutePosition.Y)
			local uDim2147 = UDim2.new(0, v3041.AbsoluteSize.X * 0.5, 0, v3041.AbsoluteSize.Y * 0.5)
			local color3527 = Color3.fromRGB(27, 6, 47)
			local v3045 = effectsServiceNewerCircle(p1324, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3035,
				Size = v3040,
				Position = uDim2146 + uDim2147,
				Rotation = i * 90 + 180,
				ImageColor3 = color3527
			})

			v3041 = p1325.ZIndex + 100001

			local v3046 = UDim2.fromOffset(p1325.AbsoluteSize.X, p1325.AbsoluteSize.X)
			local v3047 = p1325
			local uDim2148 = UDim2.new(0, v3047.AbsolutePosition.X, 0, v3047.AbsolutePosition.Y)
			local uDim2149 = UDim2.new(0, v3047.AbsoluteSize.X * 0.5, 0, v3047.AbsoluteSize.Y * 0.5)
			local color3528 = Color3.fromRGB(57, 22, 132)
			local v3051 = effectsServiceNewerCircle(p1324, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://6250126210",
				ZIndex = v3041,
				Size = v3046,
				Position = uDim2148 + uDim2149,
				ImageColor3 = color3528,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v3047 = UDim2.fromOffset(p1325.AbsoluteSize.Y * 1.5, p1325.AbsoluteSize.Y * 1.5)
			animationAnimateAsync(v3039, { Size = v3047, Rotation = v3039.Rotation + 360 }, 0.5, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v3047 = UDim2.fromOffset(p1325.AbsoluteSize.Y * 1.2, p1325.AbsoluteSize.Y * 1.2)
			animateAsync(v3045, { Size = v3047, Rotation = v3045.Rotation + 360 }, 0.5, "Out", "Quint")

			local v3054 = animation.AnimateAsync

			v3047 = UDim2.fromOffset(p1325.AbsoluteSize.Y * 1.2, p1325.AbsoluteSize.Y * 1.2)
			v3054(v3051, { Size = v3047, Rotation = v3051.Rotation + 360 }, 0.5, "Out", "Quint")
			task.wait(0.2)
			animation.AnimateAsync(v3039, { ImageTransparency = 1 }, 0.5, "Out", "Quint")
			animation.AnimateAsync(v3045, { ImageTransparency = 1 }, 1, "Out", "Quint")
			animation.AnimateAsync(v3051, { ImageTransparency = 1 }, 1, "Out", "Quint")
			task.spawn(function()
				task.wait(1)
				v3039:Destroy()
				v3045:Destroy()
				v3051:Destroy()
			end)
			task.wait(0.1)
		end
	end)
end
function module.MoyaiDomain(p1328, p1329, _, _)
	local v2700 = UDim2.fromOffset(p1329.AbsoluteSize.Y * 1.2, p1329.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p1329.AbsolutePosition.X, 0, p1329.AbsolutePosition.Y)
	local uDim2150 = UDim2.new(0, p1329.AbsoluteSize.X * 0.5, 0, p1329.AbsoluteSize.Y * 0.5)
	local v2703 = effectsServiceNewerCircle(p1328, {
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Size = v2700,
		Position = uDim2 + uDim2150
	})
	local color3529 = Color3.fromRGB(255, 255, 255)
	local v2705 = uDim2New(0, 0, 0, 0)
	local uDim2151 = UDim2.new(0, p1329.AbsolutePosition.X, 0, p1329.AbsolutePosition.Y)
	local uDim2152 = UDim2.new(0, p1329.AbsoluteSize.X * 0.5, 0, p1329.AbsoluteSize.Y * 0.5)
	local v2708 = effectsServiceNewerCircle(p1328, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.1,
		Image = "rbxassetid://11254609553",
		ZIndex = 1000001,
		ImageColor3 = color3529,
		Size = v2705,
		Position = uDim2151 + uDim2152
	})
	local color3530 = Color3.fromRGB(166, 194, 204)

	v2700 = UDim2.fromOffset(p1329.AbsoluteSize.X * 0.75, p1329.AbsoluteSize.X * 0.75)
	task.wait(0.2)

	local v2710 = p1329.Size

	v2705 = p1329.Position

	local v2711 = UDim2.fromOffset(p1329.AbsoluteSize.X * 2, p1329.AbsoluteSize.Y / 2)
	local v2712 = UDim2.fromOffset(p1329.AbsolutePosition.X - p1329.AbsoluteSize.X / 2, p1329.AbsolutePosition.Y + p1329.AbsoluteSize.Y / 4)

	animation.AnimateAsync(p1329, { Size = v2711 }, 0.2, "InOut", "Quint")
	animation.AnimateAsync(p1329, { Position = v2712 }, 0.2, "InOut", "Quint")
	task.wait(0.2)
	animation.AnimateAsync(p1329, { Size = v2710 }, 0.2, "Out", "Bounce")
	animation.AnimateAsync(p1329, { Position = v2705 }, 0.2, "Out", "Bounce")
	task.wait(0.05)

	local t74: {[any]: any} = {
		Projectile = "rbxassetid://298984512",
		Strength = 10000,
		ImageTransparency = 0.5,
		Speed = 1.2,
		EasingStyle = "Quint",
		Time = 0.25,
		Color = color3530,
		Size = v2700,
		Range = v2703
	}

	task.spawn(function()
		audioServicePlaySound("Vine Boom")

		local animationAnimateAsync = animation.AnimateAsync
		local v3056 = UDim2.fromOffset(p1329.AbsoluteSize.Y * 1.75, p1329.AbsoluteSize.Y * 1.75)

		animationAnimateAsync(v2708, { Size = v3056 }, 0.7, "Out", "Quart")
		effectsServiceBreath(p1328, p1329, v2703, t74)
		task.wait(0.6)
		animation.AnimateAsync(v2708, { ImageTransparency = 1 }, 0.25, "Out", "Quart")
		task.wait(0.25)
		v2708:Destroy()
		v2703:Destroy()
	end)
end
function module.Honeystorm(p1332, _, _, _)
	effectsServicePreloadTech(p1332, { "rbxassetid://8660821931" })
	audioServicePlaySound("Honeystorm")
	audioService.DimSongs()

	local y = p1332.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local color3531 = Color3.fromRGB(255, 208, 87)
	local v2720 = uDim2New(1, 0, 2, 0)
	local v2721 = uDim2New(0.5, 0, 0.5, 0)
	local v2722 = effectsServiceNewerCircle(p1332, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3531,
		Size = v2720,
		Position = v2721
	})

	animation.AnimateAsync(v2722, { BackgroundTransparency = 0.2, ImageTransparency = 1 }, 1, "Out", "Quint")

	local t75: {[any]: any} = { Color3.fromRGB(220, 212, 163), Color3.fromRGB(255, 255, 255) }
	local v2724 = UDim2.fromOffset(y / 1.5, y / 1.5)

	effectsServiceBreath(p1332, v2722, v2722, {
		Projectile = "rbxassetid://8660821931",
		Strength = 4000,
		Time = 1.2,
		Lifetime = 0.8,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Speed = 2,
		ZIndex = 10011,
		Color = t75,
		Size = v2724
	})
	task.wait(1)
	animation.AnimateAsync(v2722, { BackgroundTransparency = 1, ImageTransparency = 1 }, 1, "Out", "Quint")
	task.wait(1)
	audioService.UndimSongs()
	v2722:Destroy()
end
local function Visions(p1336, _, _, _, p1340, p1341)
	local t76 = {
		"rbxassetid://12630666748",
		"rbxassetid://12630667389",
		"rbxassetid://12630667970",
		"rbxassetid://12630668567",
		"rbxassetid://12630669243",
		"rbxassetid://12635899511",
		"rbxassetid://12635883675",
		"rbxassetid://12635884953",
		"rbxassetid://12635886068",
		"rbxassetid://12635887011",
		"rbxassetid://12635887934",
		"rbxassetid://12635889023",
		"rbxassetid://12635890093",
		"rbxassetid://12635890834",
		"rbxassetid://12635892181",
		"rbxassetid://12635893154",
		"rbxassetid://12635894049",
		"rbxassetid://12635894846",
		"rbxassetid://12635895577",
		"rbxassetid://12635896731",
		"rbxassetid://12635898295",
		"rbxassetid://12636256955"
	}

	effectsServicePreloadTech(p1336, t76)
	audioServicePlaySound("VisionRealm")
	audioService.DimSongs()

	local y = p1336.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local color3532 = Color3.fromRGB(0, 0, 0)
	local v2734 = uDim2New(1, 0, 1, 0)
	local v2735 = uDim2New(0.5, 0, 0.5, 0)
	local v2736 = effectsServiceNewerCircle(p1336, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10010,
		BackgroundColor3 = color3532,
		Size = v2734,
		Position = v2735
	})
	local color3533 = Color3.fromRGB(0, 0, 0)
	local v2738 = uDim2New(1.5, 0, 1.5, 0)
	local v2739 = uDim2New(0.5, 0, 0.5, 0)
	local v2740 = effectsServiceNewerCircle(p1336, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10011,
		BackgroundColor3 = color3533,
		Size = v2738,
		Position = v2739
	})

	animation.AnimateAsync(v2736, { BackgroundTransparency = 0.3, ImageTransparency = 1 }, 0.5, "Out", "Linear")

	local v2741 = p1341

	if not v2741 then
		local randomNumber = math.random(1, #t76)

		v2741 = t76[randomNumber]
	end

	local v2743 = effectsServiceNewerCircle(p1336, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10012,
		Image = v2741,
		Size = uDim2New(0, 0, 0, 0),
		Position = uDim2New(0.5, 0, 0.5, 0),
		ImageColor3 = Color3.fromRGB(255, 255, 255)
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2745 = uDim2New(0, y * 2, 0, y * 2)

	animationAnimateAsync(v2743, { ImageTransparency = 0, Size = v2745 }, 0.6, "Out", "Quint")

	local animateAsync = animation.AnimateAsync
	local randomNumber = math.random(-20, 20)

	animateAsync(v2743, { Rotation = randomNumber }, 2, "Out", "Linear")
	v2745 = uDim2New(0, 0, 0, 0)

	local v2748 = uDim2New(0.5, 0, 0.5, 0)

	t76 = effectsServiceNewerCircle(p1336, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12630545707",
		ZIndex = 10013,
		Size = v2745,
		Position = v2748,
		ImageColor3 = p1340 or Color3.fromRGB(71, 120, 96)
	})

	local v2749 = animation.AnimateAsync

	v2748 = uDim2New(0, y * 2.05, 0, y * 2.05)
	v2749(t76, { ImageTransparency = 0.1, Size = v2748 }, 0.6, "Out", "Quint")
	animation.AnimateAsync(t76, { Rotation = 1080 }, 3, "Out", "Linear")
	v2748 = uDim2New(0, 0, 0, 0)
	v2745 = uDim2New(0.5, 0, 0.5, 0)
	v2735 = effectsServiceNewerCircle(p1336, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://9477336193",
		ZIndex = 10011,
		Size = v2748,
		Position = v2745,
		ImageColor3 = p1340 or Color3.fromRGB(162, 199, 175)
	})

	local v2750 = animation.AnimateAsync
	local v2751 = uDim2New(0, y * 4, 0, y * 4)

	v2750(v2735, { ImageTransparency = 0.3, Size = v2751 }, 0.7, "Out", "Quint")
	animation.AnimateAsync(v2735, { Rotation = 540 }, 3, "Out", "Linear")
	effectsServiceEmit(p1336, v2740, {
		Projectile = "rbxassetid://11815755770",
		Strength = 225,
		Speed = 2,
		Lifetime = 0.65,
		EasingStyle = "Quint",
		EasingDirection = "In",
		Time = 1,
		ZIndex = 10012,
		Color = { p1340 or Color3.fromRGB(128, 163, 168) },
		Size = UDim2.fromOffset(y * 0.5, y * 0.5),
		Range = v2740
	})
	wait(1.5)

	local v2752 = animation.AnimateAsync
	local v2753 = UDim2.fromOffset(0, 0)

	v2752(t76, { Size = v2753 }, 0.6, "In", "Quint")

	local v2754 = animation.AnimateAsync

	v2753 = UDim2.fromOffset(0, 0)
	v2754(v2743, { Size = v2753 }, 0.59, "In", "Quint")

	local v2755 = animation.AnimateAsync

	v2753 = UDim2.fromOffset(0, 0)
	v2755(v2735, { Size = v2753 }, 0.55, "In", "Quint")
	animation.Animate(v2736, { BackgroundTransparency = 1 }, 0.55, "In", "Linear")
	audioService.UndimSongs()
	v2736:Destroy()
	v2740:Destroy()
	t76:Destroy()
	v2735:Destroy()
end
function module.ZanzelVision(p1342, p1343, p1344, p1345)
	effectsServicePreloadTech(p1342, { "rbxassetid://12630888272" })

	local color3534 = Color3.fromRGB(43, 43, 43)

	Visions(p1342, p1343, p1344, p1345, color3534, "rbxassetid://12630888272")
end
function module.UncRevelation(p1346, p1347, p1348, p1349)
	local timestamp = tick()

	Visions(p1346, p1347, p1348, p1349, Color3.fromHSV(timestamp % 5 / 5, 1, 1))
end
function module.Lobsters(p1350, _, _, _)
	effectsServicePreloadTech(p1350, { "rbxassetid://5212198196" })

	local color3535 = Color3.fromRGB(0, 0, 0)
	local v2771 = uDim2New(1, 0, 2, 0)
	local v2772 = uDim2New(0.5, 0, 0.5, 0)
	local v2773 = effectsServiceNewerCircle(p1350, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3535,
		Size = v2771,
		Position = v2772
	})
	local v2774 = uDim2New(1, 0, 1, 0)
	local v2775 = uDim2New(0.5, 0, 0.5, 0)
	local v2776 = effectsServiceNewerCircle(p1350, {
		ZIndex = 101000,
		BackgroundTransparency = 1,
		Image = "rbxassetid://5212198196",
		Visible = false,
		Size = v2774,
		Position = v2775
	})

	spawn(function()
		effectsService.TweenProperty(v2773, "BackgroundTransparency", 1, 0.5, 0.4)
	end)
	effectsServiceWaitX(0.5)
	v2776.Visible = true
	audioService.PlaySound("Bonk")
	effectsService.ShakeBattleSync(p1350, 3, 0.05)
	effectsServiceWaitX(0.75)
	spawn(function()
		effectsService.TweenProperty(v2773, "BackgroundTransparency", 0.5, 1, 0.4)
	end)
	spawn(function()
		effectsService.TweenProperty(v2776, "ImageTransparency", 0, 1, 0.4)
	end)
	effectsServiceWaitX(0.5)
	v2776:Destroy()
	v2773:Destroy()
end
function module.UNSPEAKABLE(p1354, _, p1356, p1357)
	effectsServicePreloadTech(p1354, { "rbxassetid://6671852964", "rbxassetid://5089147697" })

	local color3536 = Color3.fromRGB(0, 0, 0)
	local v2782 = uDim2New(1, 0, 2, 0)
	local v2783 = uDim2New(0.5, 0, 0.5, 0)
	local v2784 = effectsServiceNewerCircle(p1354, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10000,
		BackgroundColor3 = color3536,
		Size = v2782,
		Position = v2783
	})
	local color3537 = Color3.fromRGB(238, 48, 48)
	local v2786 = uDim2New(0, p1356.AbsoluteSize.Y * 1.2, 0, p1356.AbsoluteSize.Y * 1.2)
	local uDim2 = UDim2.new(0, p1356.AbsolutePosition.X, 0, p1356.AbsolutePosition.Y)
	local uDim2153 = UDim2.new(0, p1356.AbsoluteSize.X * 0.5, 0, p1356.AbsoluteSize.Y * 0.5)
	local v2789 = effectsServiceNewerCircle(p1354, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://6671852964",
		ImageTransparency = 1,
		ZIndex = 10001,
		ImageColor3 = color3537,
		Size = v2786,
		Position = uDim2 + uDim2153
	})
	local s1

	if p1357 == "" then
		s1 = "Enemy"
	elseif p1357 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v2792 = p1354.Parent.BattleNew[s1 .. "Field"]

	p1356.ZIndex = p1356.ZIndex + 9
	v2789.ZIndex = p1356.ZIndex - 1
	task.spawn(function()
		effectsServiceNewTweenProperty(v2789, "Rotation", 0, 2000, 10, "Linear")
	end)
	effectsServiceNewTweenProperty(v2784, "BackgroundTransparency", 1, 0.5, 0.7, "Quad")
	effectsServiceNewTweenProperty(v2789, "ImageTransparency", 1, 0, 0.7, "Quad")
	task.spawn(function()
		effectsService.Shake(p1356, p1356.Position, 3, 0.4)
	end)
	task.spawn(function()
		local imageColor3 = p1356.ImageColor3
		local color3538 = Color3.fromRGB(238, 48, 48)

		effectsServiceNewTweenProperty(p1356, "ImageColor3", imageColor3, color3538, 1.2, "Linear")
	end)

	for _ = 1, 9 do
		local color3539 = Color3.fromRGB(238, 48, 48)
		local randomNumber = math.random(0, 360)
		local uDim2154 = UDim2.new(0, p1356.AbsoluteSize.X * 2, 0, p1356.AbsoluteSize.X * 2)
		local uDim2155 = UDim2.new(0, p1356.AbsolutePosition.X + p1356.AbsoluteSize.X / 2, 0, p1356.AbsolutePosition.Y + p1356.AbsoluteSize.Y / 2)
		local v2798 = effectsServiceNewerCircle(p1354, {
			Image = "rbxassetid://5089147697",
			ZIndex = 10002,
			ImageColor3 = color3539,
			Rotation = randomNumber,
			Size = uDim2154,
			Position = uDim2155
		})

		audioService.PlaySound("MidSlash")
		spawn(function()
			effectsServiceWaitX(0.1)
			effectsServiceNewTweenProperty(v2798, "ImageTransparency", 0, 1, 0.5, "Quad")
			v2798:Destroy()
		end)
		effectsServiceWaitX(0.1)
	end

	effectsServiceWaitX(0.5)
	spawn(function()
		spawn(function()
			for _, v in pairs(v2792:GetChildren()) do
				spawn(function()
					effectsService.Shake(v, v.Position, 0.5, 0.4)
				end)
			end
		end)
		spawn(function()
			effectsServiceNewTweenProperty(v2784, "BackgroundTransparency", 0.5, 1, 1, "Quad")
			p1356.ZIndex = p1356.ZIndex - 9
			v2784:Destroy()
		end)
		spawn(function()
			effectsServiceNewTweenProperty(v2789, "ImageTransparency", 0.5, 1, 1, "Quad")
			v2789:Destroy()
		end)
	end)
end
function module.SublimePurityEffect(p1358, p1359, _, p1361)
	local battleNew = p1358.Parent.BattleNew
	local s1
	local s2

	if p1361 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p1361 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local battleNewVirtualField = battleNew.VirtualField
	local battleNewVirtualEnemyField = battleNew.VirtualEnemyField

	for _, v in pairs(_G.__NoFaces(p1359.Parent.Parent[s2 .. "Field"])) do
		task.spawn(function()
			animation.AnimateAsync(v, { ImageTransparency = 0.3 }, 1, "In", "Quint")
		end)
	end

	for _, v in pairs(_G.__NoFaces(p1359.Parent.Parent[s1 .. "Field"])) do
		task.spawn(function()
			animation.AnimateAsync(v, { ImageTransparency = 0.3 }, 1, "In", "Quint")
		end)
	end

	audioService.DimSongs()
	audioServicePlaySound("bless")

	if math.random(1, 5) == 1 then
		audioServicePlaySound("Church Bell")
	end

	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1359.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.5, 0.007)
			end)
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p1359.Parent.Parent[s2 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.5, 0.007)
			end)
		end
	end)
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local color3540 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(battleNewVirtualField, { BackgroundColor3 = color3540 }, 1, "In", "Quint")

		local animateAsync = animation.AnimateAsync
		local color3541 = Color3.fromRGB(255, 255, 255)

		animateAsync(battleNewVirtualEnemyField, { BackgroundColor3 = color3541 }, 1, "In", "Quint")
	end)
	audioService.UndimSongs()
end
function module.OverseerRitual(p1362, _, _, _)
	audioServicePlaySound("Black Hole2")
	audioService.DimSongs()

	local y = p1362.Parent.BattleNew.VirtualField.AbsoluteSize.Y
	local color3542 = Color3.fromRGB(19, 31, 24)
	local v2818 = uDim2New(1, 0, 1, 0)
	local v2819 = uDim2New(0.5, 0, 0.5, 0)
	local v2820 = effectsServiceNewerCircle(p1362, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10010,
		BackgroundColor3 = color3542,
		Size = v2818,
		Position = v2819
	})
	local color3543 = Color3.fromRGB(0, 0, 0)
	local v2822 = uDim2New(1.5, 0, 1.5, 0)
	local v2823 = uDim2New(0.5, 0, 0.9, 0)
	local v2824 = effectsServiceNewerCircle(p1362, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = 10011,
		BackgroundColor3 = color3543,
		Size = v2822,
		Position = v2823
	})

	animation.AnimateAsync(v2820, { BackgroundTransparency = 0.1, ImageTransparency = 1 }, 0.4, "Out", "Linear")

	local v2825 = uDim2New(0, 0, 0, 0)
	local v2826 = uDim2New(0.5, 0, 0.5, 0)
	local color3544 = Color3.fromRGB(41, 102, 37)
	local v2828 = effectsServiceNewerCircle(p1362, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://3958770033",
		ZIndex = 10011,
		Size = v2825,
		Position = v2826,
		ImageColor3 = color3544
	})
	local animationAnimateAsync = animation.AnimateAsync
	local v2830 = uDim2New(0, y * 3, 0, y * 3)

	animationAnimateAsync(v2828, { ImageTransparency = 0, Size = v2830 }, 0.4, "Out", "Quint")
	animation.AnimateAsync(v2828, { Rotation = 1080 }, 3, "Out", "Linear")
	v2823 = { Color3.fromRGB(32, 67, 30), Color3.fromRGB(40, 143, 33) }
	v2822 = UDim2.fromOffset(y * 0.5, y * 0.5)
	effectsServiceEmit(p1362, v2824, {
		Projectile = "rbxassetid://12995620588",
		Strength = 150,
		Speed = 2,
		Lifetime = 0.65,
		EasingStyle = "Quint",
		EasingDirection = "Out",
		Time = 1,
		ZIndex = 10011,
		Color = v2823,
		Size = v2822,
		Range = v2824
	})
	wait(1)

	local animateAsync = animation.AnimateAsync
	local v2832 = UDim2.fromOffset(0, 0)

	animateAsync(v2828, { Size = v2832 }, 1, "In", "Quint")
	animation.Animate(v2820, { BackgroundTransparency = 1 }, 1, "In", "Linear")
	audioService.UndimSongs()
	v2820:Destroy()
	v2824:Destroy()
	v2828:Destroy()
end
function module.BloxyAll(p1366, p1367, p1368, p1369)
	audioServicePlaySound("Cheering")
	task.spawn(function()
		module.BloxyEnemy(p1366, p1367, p1368, p1369)
	end)
	task.spawn(function()
		module.BloxyAlly(p1366, p1367, p1368, p1369)
	end)
end
function module.EatRandomFoodAll(p1370, p1371, p1372, p1373)
	task.wait(0.15)
	task.spawn(function()
		module.EatRandomFoodAlly(p1370, p1371, p1372, p1373)
	end)
	task.spawn(function()
		module.EatRandomFoodEnemy(p1370, p1371, p1372, p1373)
	end)
	task.wait(0.5)
end
function module.EatCakeAll(p1374, p1375, p1376, p1377)
	task.spawn(function()
		audioServicePlaySound("HappyBirthday")
	end)
	task.wait(0.15)
	task.spawn(function()
		module.EatCakeEnemy(p1374, p1375, p1376, p1377)
	end)
	task.spawn(function()
		module.EatCakeAlly(p1374, p1375, p1376, p1377)
	end)
	task.wait(0.5)
end
function module.EatTurkeyAll(p1378, p1379, p1380, p1381)
	task.spawn(function()
		module.EatTurkeyEnemy(p1378, p1379, p1380, p1381)
	end)
	task.spawn(function()
		module.EatTurkeyAlly(p1378, p1379, p1380, p1381)
	end)
	task.wait(0.5)
end

return module
