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
local effectsServicePulse = effectsService.Pulse
local effectsServiceVortex = effectsService.Vortex
local effectsServiceThrow = effectsService.Throw
local effectsServiceToss = effectsService.Toss
local effectsServiceBouncy = effectsService.Bouncy
local effectsServiceBiting = effectsService.Biting
local effectsServiceBreath = effectsService.Breath
local effectsServiceBreathAttack = effectsService.BreathAttack
local effectsServiceBreathSelf = effectsService.BreathSelf
local effectsServiceBreathEngulf = effectsService.BreathEngulf
local effectsServiceBreathAlly = effectsService.BreathAlly
local effectsServiceBreathEnemy = effectsService.BreathEnemy
local effectsServiceBreathInverse = effectsService.BreathInverse
local effectsServiceBreathReverse = effectsService.BreathReverse
local effectsServiceBreathParticle = effectsService.BreathParticle
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
local tweenService: TweenService = game:GetService("TweenService")

require(game.ReplicatedStorage.CopyTable)

local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local uDim2New = UDim2.new
local vector2New = Vector2.new
local mathRandom = math.random
local v44 = math.random

local function GetWeightedRandom(p2)
	return (v44() - 0.5) * p2
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
ApplyValues = function(p7, p8)
	return (math.atan2(p8.Y - p7.Y, p8.X - p7.X))
end

local function Lerp(p9, p10, p11)
	return p9 * (1 - p11) + p10 * p11
end
local function NewTweenProperty(p12, p13, p14, p15, p16, p17, p18)
	local v107 = Enum.EasingStyle[p17]
	local v108 = Enum.EasingDirection[p18 or "Out"]

	if not p12 or not p13 or not p12:IsA("Instance") then
		warn("Invalid object or property.")

		return
	end

	local tweenInfo = TweenInfo.new(p16, v107, v108)

	v108 = tweenService:Create(p12, tweenInfo, { [p13] = p15 })
	p12[p13] = p14
	v108:Play()
	v108.Completed:Wait()
	v108:Destroy()
end
local function CenterPos(p19)
	local uDim2 = UDim2.new(0, p19.AbsolutePosition.X, 0, p19.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p19.AbsoluteSize.X * 0.5, 0, p19.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function evalColorSequence(p20, p21)
	if p21 == 0 then
		return p20.Keypoints[1].Value
	end

	if p21 == 1 then
		return p20.Keypoints[#p20.Keypoints].Value
	end

	for i = 1, #p20.Keypoints - 1 do
		local v116 = p20.Keypoints[i]
		local v117 = p20.Keypoints[i + 1]

		if p21 >= v116.Time and p21 < v117.Time then
			local n1 = (p21 - v116.Time) / (v117.Time - v116.Time)

			return Color3.new((v117.Value.R - v116.Value.R) * n1 + v116.Value.R, (v117.Value.G - v116.Value.G) * n1 + v116.Value.G, (v117.Value.B - v116.Value.B) * n1 + v116.Value.B)
		end
	end
end

evalColorSequence = function(p22)
	local y = p22.AbsolutePosition.Y
	local n1 = p22.AbsolutePosition.Y + p22.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p22.AbsolutePosition.X, p22.AbsolutePosition.X + p22.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end
evalColorSequence = function(p23)
	if p23 == "" then
		return "", "Enemy"
	end

	if p23 == "Enemy" then
		return "Enemy", ""
	end
end

local color3 = Color3.fromRGB(255, 0, 0)
local color32 = Color3.fromRGB(0, 255, 0)
local color33 = Color3.fromRGB(0, 0, 255)
local t1: {[any]: any} = { color3, color32, color33, Color3.fromRGB(255, 255, 0) }

local function PlaySoundWithOptionalShake(p24, p25, p26, p27)
	if type(p24) == "table" then
		local randomNumber = math.random(1, #p24)

		p24 = p24[randomNumber]
	end

	audioServicePlaySound(p24)

	if p26 and p27 then
		spawn(function()
			effectsService.Shake(p25, p25.Position, p26, p27)
		end)
	end
end
local function PlayRandomSound(p28)
	local randomNumber = math.random(1, #p28)

	audioServicePlaySound(p28[randomNumber])
end

PlayRandomSound = function(p29, p30, p31, p32)
	PlaySoundWithOptionalShake(p29, p30, p31, p32)
end

local module: {[any]: any} = {
	EKPreSlash = function(p33, _, p35, _, _, _)
		local t4: {[any]: any} = { "rbxassetid://5089147697", "rbxassetid://5092736874" }
		local v143 = t4[1]
		local n1 = p35.ZIndex + 10000
		local uDim2 = UDim2.new(0, p35.AbsoluteSize.X * 1.5, 0, p35.AbsoluteSize.X * 1.5)
		local uDim23 = UDim2.new(0, p35.AbsolutePosition.X + p35.AbsoluteSize.X / 2, 0, p35.AbsolutePosition.Y + p35.AbsoluteSize.Y / 2)
		local v147 = effectsServiceNewerCircle(p33, {
			ImageTransparency = 1,
			Image = v143,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim23
		})
		local v148 = t4[2]
		local n2 = p35.ZIndex + 10000
		local uDim24 = UDim2.new(0, p35.AbsoluteSize.X / 1.6, 0, p35.AbsoluteSize.X / 1.6)
		local uDim25 = UDim2.new(0, v147.AbsolutePosition.X + v147.AbsoluteSize.X, 0, v147.AbsolutePosition.Y)
		local v152 = effectsServiceNewerCircle(p33, {
			ImageTransparency = 1,
			Image = v148,
			ZIndex = n2,
			Size = uDim24,
			Position = uDim25
		})

		foilEffect(v152)
		spawn(function()
			effectsService.TweenProperty(v152, "ImageTransparency", 1, 0, 0.08000000000000002)
		end)
		effectsServiceWaitX(0.075)
		audioService.PlaySound("PreSlashEK")

		local uDim26 = UDim2.new(0, v147.AbsolutePosition.X, 0, v147.AbsolutePosition.Y + v147.AbsoluteSize.Y)

		v152:TweenPosition(uDim26, "Out", "Quad", 0.3, true)
		effectsServiceWaitX(0.25)
		spawn(function()
			effectsService.TweenProperty(v152, "ImageTransparency", 0, 1, 0.16000000000000003)
			v152:Destroy()
		end)
		effectsServiceWaitX(0.45)
		spawn(function()
			v147:Destroy()
		end)
		wait(0.2)
	end,
	EKSlash = function(p39, _, p41, _, _, _)
		local t5: {[any]: any} = { "rbxassetid://123651082492238", "rbxassetid://5092736874" }
		local v161 = t5[1]
		local n1 = p41.ZIndex + 10000
		local uDim2 = UDim2.new(0, p41.AbsoluteSize.X * 1.5, 0, p41.AbsoluteSize.X * 1.5)
		local uDim27 = UDim2.new(0, p41.AbsolutePosition.X + p41.AbsoluteSize.X / 2, 0, p41.AbsolutePosition.Y + p41.AbsoluteSize.Y / 2)
		local v165 = effectsServiceNewerCircle(p39, {
			ImageTransparency = 1,
			Image = v161,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim27
		})
		local v166 = t5[2]
		local n2 = p41.ZIndex + 10000
		local uDim28 = UDim2.new(0, p41.AbsoluteSize.X / 1.6, 0, p41.AbsoluteSize.X / 1.6)
		local uDim29 = UDim2.new(0, v165.AbsolutePosition.X + v165.AbsoluteSize.X, 0, v165.AbsolutePosition.Y)
		local v170 = effectsServiceNewerCircle(p39, {
			ImageTransparency = 1,
			Image = v166,
			ZIndex = n2,
			Size = uDim28,
			Position = uDim29
		})

		foilEffect(v170)
		spawn(function()
			effectsService.TweenProperty(v170, "ImageTransparency", 1, 0, 0.08000000000000002)
		end)
		effectsServiceWaitX(0.075)
		audioService.PlaySound("PreSlashEK")

		local uDim210 = UDim2.new(0, v165.AbsolutePosition.X, 0, v165.AbsolutePosition.Y + v165.AbsoluteSize.Y)

		v170:TweenPosition(uDim210, "Out", "Quad", 0.3, true)
		effectsServiceWaitX(0.25)
		spawn(function()
			effectsService.TweenProperty(v170, "ImageTransparency", 0, 1, 0.16000000000000003)
			v170:Destroy()
		end)
		effectsServiceWaitX(0.8)
		audioService.PlaySound("EKImpact")
		effectsService.ShakeBattle(p39, 0.1, 0.025)
		v165.Size = UDim2.new(0, p41.AbsoluteSize.X * 2, 0, p41.AbsoluteSize.X * 2)
		v165.ImageTransparency = 0
		effectsService.Shake(p41, p41.Position, 0.44000000000000006, 0.6)
		effectsServiceWaitX(1.25)
		spawn(function()
			effectsService.TweenProperty(v165, "ImageTransparency", 0, 1, 0.32000000000000006)
			v165:Destroy()
		end)
		wait(0.2)
	end,
	LargeSlash = function(p45, _, p47, _, _, _)
		local t6: {[any]: any} = { "rbxassetid://5089147697", "rbxassetid://5092736874" }
		local v179 = t6[1]
		local n1 = p47.ZIndex + 10000
		local uDim2 = UDim2.new(0, p47.AbsoluteSize.X * 1.5, 0, p47.AbsoluteSize.X * 1.5)
		local uDim211 = UDim2.new(0, p47.AbsolutePosition.X + p47.AbsoluteSize.X / 2, 0, p47.AbsolutePosition.Y + p47.AbsoluteSize.Y / 2)
		local v183 = effectsServiceNewerCircle(p45, {
			ImageTransparency = 1,
			Image = v179,
			ZIndex = n1,
			Size = uDim2,
			Position = uDim211
		})
		local v184 = t6[2]
		local n2 = p47.ZIndex + 10000
		local uDim212 = UDim2.new(0, p47.AbsoluteSize.X / 1.6, 0, p47.AbsoluteSize.X / 1.6)
		local uDim213 = UDim2.new(0, v183.AbsolutePosition.X + v183.AbsoluteSize.X, 0, v183.AbsolutePosition.Y)
		local v188 = effectsServiceNewerCircle(p45, {
			ImageTransparency = 1,
			Image = v184,
			ZIndex = n2,
			Size = uDim212,
			Position = uDim213
		})

		spawn(function()
			effectsService.TweenProperty(v188, "ImageTransparency", 1, 0, 0.08000000000000002)
		end)
		effectsServiceWaitX(0.075)
		audioService.PlaySound("PreSlash")

		local uDim214 = UDim2.new(0, v183.AbsolutePosition.X, 0, v183.AbsolutePosition.Y + v183.AbsoluteSize.Y)

		v188:TweenPosition(uDim214, "Out", "Quad", 0.3, true)
		effectsServiceWaitX(0.25)
		spawn(function()
			effectsService.TweenProperty(v188, "ImageTransparency", 0, 1, 0.16000000000000003)
			v188:Destroy()
		end)
		effectsServiceWaitX(0.45)
		audioService.PlaySound("LargeSlash")
		effectsService.ShakeBattle(p45, 0.1, 0.025)
		v183.Size = UDim2.new(0, p47.AbsoluteSize.X * 2, 0, p47.AbsoluteSize.X * 2)
		v183.ImageTransparency = 0
		effectsService.Shake(p47, p47.Position, 0.44000000000000006, 0.6)
		wait(0.44000000000000006)
		spawn(function()
			effectsService.TweenProperty(v183, "ImageTransparency", 0, 1, 0.32000000000000006)
			v183:Destroy()
		end)
		wait(0.2)
	end
}

function module.LargeSlashEffect(p51, p52, p53, _)
	module.LargeSlash(p51, p52, p53, nil, nil)
end
function module.MidSlash(p55, _, p57, _, _, _)
	local t7: {[any]: any} = { "rbxassetid://5089147697", "rbxassetid://5092736874" }
	local v201 = t7[1]
	local n1 = p57.ZIndex + 10000
	local uDim2 = UDim2.new(0, p57.AbsoluteSize.X * 1.5, 0, p57.AbsoluteSize.X * 1.5)
	local uDim215 = UDim2.new(0, p57.AbsolutePosition.X + p57.AbsoluteSize.X / 2, 0, p57.AbsolutePosition.Y + p57.AbsoluteSize.Y / 2)
	local v205 = effectsServiceNewerCircle(p55, { Image = v201, ZIndex = n1, Size = uDim2, Position = uDim215 })

	audioService.PlaySound("MidSlash")
	effectsService.Shake(p57, p57.Position, 0.32000000000000006, 0.3)
	wait(0.32000000000000006)
	spawn(function()
		effectsService.TweenProperty(v205, "ImageTransparency", 0, 1, 0.2)
		v205:Destroy()
	end)
	wait(0.16000000000000003)
end
function module.MidSlashEffect(p61, p62, p63, _)
	module.MidSlash(p61, p62, p63, nil, nil)
end
function module.SmallSlash(p65, _, p67, _, _, _)
	local t8: {[any]: any} = { "rbxassetid://5089147697", "rbxassetid://5092736874" }
	local v217 = t8[1]
	local n1 = p67.ZIndex + 10000
	local uDim2 = UDim2.new(0, p67.AbsoluteSize.X / 1.3, 0, p67.AbsoluteSize.X / 1.3)
	local uDim216 = UDim2.new(0, p67.AbsolutePosition.X + p67.AbsoluteSize.X / 2, 0, p67.AbsolutePosition.Y + p67.AbsoluteSize.Y / 2)
	local v221 = effectsServiceNewerCircle(p65, { Image = v217, ZIndex = n1, Size = uDim2, Position = uDim216 })

	audioService.PlaySound("SmallSlash")
	effectsService.Shake(p67, p67.Position, 0.24, 0.1)
	wait(0.32000000000000006)
	spawn(function()
		effectsService.TweenProperty(v221, "ImageTransparency", 0, 1, 0.16000000000000003)
		v221:Destroy()
	end)
	wait(0.16000000000000003)
end
function module.SmallSlashEffect(p71, p72, p73, _)
	module.SmallSlash(p71, p72, p73, nil, nil)
end
local function XhartyrSlash(p75, _, p77, _, p79, p80, p81, p82, p83, p84, p85)
	local t9: {[any]: any} = {}

	for _ = 1, p79 do
		local n1 = p77.ZIndex + 100001
		local v240 = uDim2New(2, 0, 0, p77.AbsoluteSize.X / 4)
		local uDim2 = UDim2.new(0, p77.AbsolutePosition.X, 0, p77.AbsolutePosition.Y)
		local uDim217 = UDim2.new(0, p77.AbsoluteSize.X * 0.5, 0, p77.AbsoluteSize.Y * 0.5)
		local uDim2FromOffset = UDim2.fromOffset
		local randomNumber = math.random(-10, 10)
		local v245 = uDim2FromOffset(randomNumber, 0)
		local randomNumber2 = math.random(-30, 30)
		local v247 = effectsServiceNewerCircle(p75, {
			BackgroundTransparency = 0,
			ImageTransparency = 1,
			BackgroundColor3 = p81,
			ZIndex = n1,
			Size = v240,
			Position = uDim2 + uDim217 + v245,
			Rotation = randomNumber2
		})

		effectsService.Shake(p77, p77.Position, 0.1 * p80, 0.2)
		table.insert(t9, v247)

		local animationAnimateAsync = animation.AnimateAsync
		local v249 = uDim2New(2, 0, 0, p77.AbsoluteSize.X / 30)

		animationAnimateAsync(v247, { Size = v249 }, 0.15 * p80, "Out", "Quint")
		audioServicePlaySound(p83)
		task.wait((if p79 > 2 then 0.01 else 0.05) * p80)
	end

	for i = 1, p79 do
		animation.AnimateAsync(t9[i], { Rotation = 135 }, 0.6 * p80, "In", "Exponential")
	end

	task.wait(0.15 * p80)

	if not p85 then
		audioServicePlaySound("chargein")
	end

	task.wait(0.35 * p80)

	if not p85 then
		audioServicePlaySound("dbzswordout")
	end

	for i = 1, p79 do
		t9[i].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	end

	task.wait(0.15 * p80)

	for i = 1, p79 do
		t9[i]:Destroy()
	end

	local n2 = p77.ZIndex + 100001
	local v254 = UDim2.fromOffset(p77.AbsoluteSize.X, p77.AbsoluteSize.X)
	local uDim218 = UDim2.new(0, p77.AbsolutePosition.X, 0, p77.AbsolutePosition.Y)
	local uDim219 = UDim2.new(0, p77.AbsoluteSize.X * 0.5, 0, p77.AbsoluteSize.Y * 0.5)
	local v257 = effectsServiceNewerCircle(p75, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = p82,
		ZIndex = n2,
		Size = v254,
		Position = uDim218 + uDim219
	})

	effectsService.ShakeSync(p77, p77.Position, 0.5 * p80, 0.2)

	if not p84 and p79 >= 4 then
		effectsService.ShakeBattleSync(p75, 0.4, 0.04)
	end

	local animateAsync = animation.AnimateAsync
	local v259 = UDim2.fromOffset(p77.AbsoluteSize.Y * 1.75 * p80, p77.AbsoluteSize.Y * 1.75 * p80)

	animateAsync(v257, { Rotation = 360, Size = v259 }, 1 * p80, "Out", "Quint")
	task.wait(0.5 * p80)
	animation.AnimateAsync(v257, { ImageTransparency = 1 }, 1 * p80, "Out", "Quint")
	task.spawn(function()
		task.wait(1 * p80)
		v257:Destroy()
	end)
end
function module.LargeXhartyrSlash(p86, p87, p88, p89)
	local color34 = Color3.fromRGB(255, 255, 255)

	XhartyrSlash(p86, p87, p88, p89, 4, 1, color34, "rbxassetid://3916186365", "Slashes")
end
function module.LargeXhartyrSlashEffect(p90, p91, p92, _)
	module.LargeXhartyrSlash(p90, p91, p92, nil, nil)
end
function module.LargeDoomSlash(p94, p95, p96, p97)
	local color35 = Color3.fromRGB(235, 64, 52)

	XhartyrSlash(p94, p95, p96, p97, 4, 1, color35, "rbxassetid://8888170530", "Slashes2")
end
function module.MidXhartyrSlash(p98, p99, p100, p101)
	local color36 = Color3.fromRGB(255, 255, 255)

	XhartyrSlash(p98, p99, p100, p101, 3, 0.75, color36, "rbxassetid://3916186365", "Slashes")
end
function module.MidXhartyrSlashEffect(p102, p103, p104, _)
	module.MidXhartyrSlash(p102, p103, p104, nil, nil)
end
function module.MidDoomSlash(p106, p107, p108, p109)
	local color37 = Color3.fromRGB(235, 64, 52)

	XhartyrSlash(p106, p107, p108, p109, 3, 0.75, color37, "rbxassetid://8888170530", "Slashes2")
end
function module.SmallXhartyrSlashEnemy(p110, p111, _, p113)
	local s1

	if p113 == "" then
		s1 = "Enemy"
	elseif p113 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p110.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			local color38 = Color3.fromRGB(255, 255, 255)

			XhartyrSlash(p110, p111, v, nil, 2, 0.5, color38, "rbxassetid://3916186365", "Slashes", true, true)
		end)
	end

	task.wait(0.15)
	audioServicePlaySound("chargein")
	task.wait(0.5)
	audioServicePlaySound("dbzswordout")
end
function module.SmallXhartyrSlash(p114, p115, p116, p117)
	local color39 = Color3.fromRGB(255, 255, 255)

	XhartyrSlash(p114, p115, p116, p117, 2, 0.5, color39, "rbxassetid://3916186365", "Slashes")
end
function module.SmallDoomSlash(p118, p119, p120, p121)
	local color310 = Color3.fromRGB(235, 64, 52)

	XhartyrSlash(p118, p119, p120, p121, 2, 0.5, color310, "rbxassetid://8888170530", "Slashes2")
end
function module.LargeStudBlast(p122, p123, p124, p125)
	audioServicePlaySound("Praise2")
	task.spawn(function()
		effectsService.ShakeSync(p123, p123.Position, 0.3, 0.3)
	end)

	local effectsServiceBreathimagesStud = effectsServiceBreathimages.stud
	local color311 = Color3.fromRGB(255, 255, 255)
	local color312 = Color3.fromRGB(255, 255, 255)
	local color313 = Color3.fromRGB(255, 255, 255)
	local color314 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p122, p123, p124, p125, 40, effectsServiceBreathimagesStud, "Ascend2", 1, color311, color312, color313, color314, 0.4, 0.35)
end
function module.MidStudBlast(p126, p127, p128, p129)
	task.spawn(function()
		effectsService.ShakeSync(p127, p127.Position, 0.2, 0.2)
	end)

	local effectsServiceBreathimagesStud = effectsServiceBreathimages.stud
	local color315 = Color3.fromRGB(255, 255, 255)
	local color316 = Color3.fromRGB(255, 255, 255)
	local color317 = Color3.fromRGB(255, 255, 255)
	local color318 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p126, p127, p128, p129, 30, effectsServiceBreathimagesStud, "Ascend2", 0.8, color315, color316, color317, color318, 0.45, 0.4)
end
function module.SmallStudBlast(p130, p131, p132, p133)
	task.spawn(function()
		effectsService.ShakeSync(p131, p131.Position, 0.2, 0.2)
	end)

	local effectsServiceBreathimagesStud = effectsServiceBreathimages.stud
	local color319 = Color3.fromRGB(255, 255, 255)
	local color320 = Color3.fromRGB(255, 255, 255)
	local color321 = Color3.fromRGB(255, 255, 255)
	local color322 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p130, p131, p132, p133, 25, effectsServiceBreathimagesStud, "PixieMagic", 0.6, color319, color320, color321, color322, 0.45, 0.4)
end
function module.LargeInferno(p134, p135, p136, p137)
	task.spawn(function()
		effectsService.ShakeSync(p135, p135.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color323 = Color3.fromRGB(163, 35, 206)
	local color324 = Color3.fromRGB(144, 0, 180)
	local color325 = Color3.fromRGB(240, 80, 224)
	local color326 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathAttack(p134, p135, p136, p137, 110, effectsServiceBreathimagesFire, "FireBreathLong", 1, color323, color324, color325, color326, 1, 0.9)
end
function module.MidInferno(p138, p139, p140, p141)
	task.spawn(function()
		effectsService.ShakeSync(p139, p139.Position, 0.3, 0.25)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color327 = Color3.fromRGB(163, 35, 206)
	local color328 = Color3.fromRGB(144, 0, 180)
	local color329 = Color3.fromRGB(240, 80, 224)
	local color330 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathAttack(p138, p139, p140, p141, 105, effectsServiceBreathimagesFire, "FireBreath", 0.85, color327, color328, color329, color330, 1, 0.9)
end
function module.SmallInferno(p142, p143, p144, p145)
	task.spawn(function()
		effectsService.ShakeSync(p143, p143.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color331 = Color3.fromRGB(163, 35, 206)
	local color332 = Color3.fromRGB(144, 0, 180)
	local color333 = Color3.fromRGB(240, 80, 224)
	local color334 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathAttack(p142, p143, p144, p145, 95, effectsServiceBreathimagesFire, "FireBreath", 0.6, color331, color332, color333, color334, 1, 0.9)
end
function module.LargeFlare(p146, p147, p148, p149)
	task.spawn(function()
		effectsService.ShakeSync(p147, p147.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color335 = Color3.fromRGB(240, 55, 30)
	local color336 = Color3.fromRGB(166, 28, 26)
	local color337 = Color3.fromRGB(240, 32, 13)
	local color338 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathAttack(p146, p147, p148, p149, 110, effectsServiceBreathimagesFire, "FireBreathLong", 1, color335, color336, color337, color338, 1, 0.9)
end
function module.MidFlare(p150, p151, p152, p153)
	task.spawn(function()
		effectsService.ShakeSync(p151, p151.Position, 0.3, 0.25)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color339 = Color3.fromRGB(240, 55, 30)
	local color340 = Color3.fromRGB(166, 28, 26)
	local color341 = Color3.fromRGB(240, 32, 13)
	local color342 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathAttack(p150, p151, p152, p153, 105, effectsServiceBreathimagesFire, "FireBreath", 0.85, color339, color340, color341, color342, 1, 0.9)
end
function module.SmallFlare(p154, p155, p156, p157)
	task.spawn(function()
		effectsService.ShakeSync(p155, p155.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color343 = Color3.fromRGB(240, 55, 30)
	local color344 = Color3.fromRGB(166, 28, 26)
	local color345 = Color3.fromRGB(240, 32, 13)
	local color346 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathAttack(p154, p155, p156, p157, 95, effectsServiceBreathimagesFire, "FireBreath", 0.6, color343, color344, color345, color346, 1, 0.9)
end
function module.LargeScorch(p158, p159, p160, p161)
	task.spawn(function()
		effectsService.ShakeSync(p159, p159.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color347 = Color3.fromRGB(34, 240, 30)
	local color348 = Color3.fromRGB(32, 180, 37)
	local color349 = Color3.fromRGB(56, 184, 97)
	local color350 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathAttack(p158, p159, p160, p161, 110, effectsServiceBreathimagesFire, "FireBreathLong", 1, color347, color348, color349, color350, 1, 0.9)
end
function module.MidScorch(p162, p163, p164, p165)
	task.spawn(function()
		effectsService.ShakeSync(p163, p163.Position, 0.3, 0.25)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color351 = Color3.fromRGB(34, 240, 30)
	local color352 = Color3.fromRGB(32, 180, 37)
	local color353 = Color3.fromRGB(56, 184, 97)
	local color354 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathAttack(p162, p163, p164, p165, 105, effectsServiceBreathimagesFire, "FireBreath", 0.85, color351, color352, color353, color354, 1, 0.9)
end
function module.SmallScorch(p166, p167, p168, p169)
	task.spawn(function()
		effectsService.ShakeSync(p167, p167.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color355 = Color3.fromRGB(34, 240, 30)
	local color356 = Color3.fromRGB(32, 180, 37)
	local color357 = Color3.fromRGB(56, 184, 97)
	local color358 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathAttack(p166, p167, p168, p169, 95, effectsServiceBreathimagesFire, "FireBreath", 0.6, color355, color356, color357, color358, 1, 0.9)
end
function module.LargeBlaze(p170, p171, p172, p173)
	task.spawn(function()
		effectsService.ShakeSync(p171, p171.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color359 = Color3.fromRGB(204, 198, 33)
	local color360 = Color3.fromRGB(220, 189, 15)
	local color361 = Color3.fromRGB(255, 255, 43)
	local color362 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathAttack(p170, p171, p172, p173, 110, effectsServiceBreathimagesFire, "FireBreathLong", 1, color359, color360, color361, color362, 1, 0.9)
end
function module.MidBlaze(p174, p175, p176, p177)
	task.spawn(function()
		effectsService.ShakeSync(p175, p175.Position, 0.3, 0.25)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color363 = Color3.fromRGB(204, 198, 33)
	local color364 = Color3.fromRGB(220, 189, 15)
	local color365 = Color3.fromRGB(255, 255, 43)
	local color366 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathAttack(p174, p175, p176, p177, 105, effectsServiceBreathimagesFire, "FireBreath", 0.85, color363, color364, color365, color366, 1, 0.9)
end
function module.SmallBlaze(p178, p179, p180, p181)
	task.spawn(function()
		effectsService.ShakeSync(p179, p179.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color367 = Color3.fromRGB(204, 198, 33)
	local color368 = Color3.fromRGB(220, 189, 15)
	local color369 = Color3.fromRGB(255, 255, 43)
	local color370 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathAttack(p178, p179, p180, p181, 95, effectsServiceBreathimagesFire, "FireBreath", 0.6, color367, color368, color369, color370, 1, 0.9)
end
function module.LargeFlame(p182, p183, p184, p185)
	task.spawn(function()
		effectsService.ShakeSync(p183, p183.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color371 = Color3.fromRGB(24, 174, 204)
	local color372 = Color3.fromRGB(8, 72, 150)
	local color373 = Color3.fromRGB(30, 91, 234)
	local color374 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathAttack(p182, p183, p184, p185, 110, effectsServiceBreathimagesFire, "FireBreathLong", 1, color371, color372, color373, color374, 1, 0.9)
end
function module.MidFlame(p186, p187, p188, p189)
	task.spawn(function()
		effectsService.ShakeSync(p187, p187.Position, 0.3, 0.25)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color375 = Color3.fromRGB(24, 174, 204)
	local color376 = Color3.fromRGB(8, 72, 150)
	local color377 = Color3.fromRGB(30, 91, 234)
	local color378 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathAttack(p186, p187, p188, p189, 105, effectsServiceBreathimagesFire, "FireBreath", 0.85, color375, color376, color377, color378, 1, 0.9)
end
function module.SmallFlame(p190, p191, p192, p193)
	task.spawn(function()
		effectsService.ShakeSync(p191, p191.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color379 = Color3.fromRGB(24, 174, 204)
	local color380 = Color3.fromRGB(8, 72, 150)
	local color381 = Color3.fromRGB(30, 91, 234)
	local color382 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathAttack(p190, p191, p192, p193, 95, effectsServiceBreathimagesFire, "FireBreath", 0.6, color379, color380, color381, color382, 1, 0.9)
end
function module.LargeIce(p194, p195, p196, p197)
	task.spawn(function()
		effectsService.ShakeSync(p195, p195.Position, 0.4, 0.3)
	end)

	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color383 = Color3.fromRGB(167, 255, 245)
	local color384 = Color3.fromRGB(125, 199, 255)
	local color385 = Color3.fromRGB(161, 199, 240)
	local color386 = Color3.fromRGB(108, 197, 239)

	effectsServiceBreathAttack(p194, p195, p196, p197, 110, effectsServiceBreathimagesIce, "IceBreath", 1, color383, color384, color385, color386, 0.95, 0.8)
end
function module.MidIce(p198, p199, p200, p201)
	task.spawn(function()
		effectsService.ShakeSync(p199, p199.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color387 = Color3.fromRGB(167, 255, 245)
	local color388 = Color3.fromRGB(125, 199, 255)
	local color389 = Color3.fromRGB(161, 199, 240)
	local color390 = Color3.fromRGB(108, 197, 239)

	effectsServiceBreathAttack(p198, p199, p200, p201, 105, effectsServiceBreathimagesIce, "IceBreath", 0.8, color387, color388, color389, color390, 0.95, 0.8)
end
function module.SmallIce(p202, p203, p204, p205)
	task.spawn(function()
		effectsService.ShakeSync(p203, p203.Position, 0.3, 0.2)
	end)

	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color391 = Color3.fromRGB(167, 255, 245)
	local color392 = Color3.fromRGB(125, 199, 255)
	local color393 = Color3.fromRGB(161, 199, 240)
	local color394 = Color3.fromRGB(108, 197, 239)

	effectsServiceBreathAttack(p202, p203, p204, p205, 95, effectsServiceBreathimagesIce, "IceBreath", 0.6, color391, color392, color393, color394, 0.95, 0.8)
end
function module.LargeCoins(p206, p207, p208, p209)
	task.spawn(function()
		effectsService.ShakeSync(p207, p207.Position, 0.4, 0.3)
	end)

	local color395 = Color3.fromRGB(255, 255, 255)
	local color396 = Color3.fromRGB(255, 255, 255)
	local color397 = Color3.fromRGB(255, 255, 255)
	local color398 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p206, p207, p208, p209, 100, {
		"rbxassetid://13752918780",
		"rbxassetid://13752939222",
		"rbxassetid://13752904980"
	}, "Coins", 1, color395, color396, color397, color398, 0.45, 0.4)
end
function module.MidCoins(p210, p211, p212, p213)
	task.spawn(function()
		effectsService.ShakeSync(p211, p211.Position, 0.3, 0.2)
	end)

	local color399 = Color3.fromRGB(255, 255, 255)
	local color3100 = Color3.fromRGB(255, 255, 255)
	local color3101 = Color3.fromRGB(255, 255, 255)
	local color3102 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p210, p211, p212, p213, 80, {
		"rbxassetid://13752918780",
		"rbxassetid://13752939222",
		"rbxassetid://13752904980"
	}, "Coins", 0.8, color399, color3100, color3101, color3102, 0.45, 0.4)
end
function module.SmallCoins(p214, p215, p216, p217)
	task.spawn(function()
		effectsService.ShakeSync(p215, p215.Position, 0.3, 0.2)
	end)

	local color3103 = Color3.fromRGB(255, 255, 255)
	local color3104 = Color3.fromRGB(255, 255, 255)
	local color3105 = Color3.fromRGB(255, 255, 255)
	local color3106 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathAttack(p214, p215, p216, p217, 55, {
		"rbxassetid://13752918780",
		"rbxassetid://13752939222",
		"rbxassetid://13752904980"
	}, "Coins", 0.6, color3103, color3104, color3105, color3106, 0.45, 0.4)
end
function module.LargeMoney(p218, p219, p220, p221)
	task.spawn(function()
		effectsService.ShakeSync(p219, p219.Position, 0.4, 0.3)
		audioServicePlaySound("cashregister")
	end)

	local color3107 = Color3.fromRGB(210, 255, 225)
	local color3108 = Color3.fromRGB(163, 220, 194)
	local color3109 = Color3.fromRGB(210, 255, 225)
	local color3110 = Color3.fromRGB(163, 220, 194)

	effectsServiceBreathAttack(p218, p219, p220, p221, 60, "rbxassetid://8971870792", "gold01", 1, color3107, color3108, color3109, color3110, 1, 0.9)
end
function module.LargeMoneySelf(p222, p223, p224, p225)
	local color3111 = Color3.fromRGB(210, 255, 225)
	local color3112 = Color3.fromRGB(163, 220, 194)
	local color3113 = Color3.fromRGB(210, 255, 225)
	local color3114 = Color3.fromRGB(163, 220, 194)

	effectsServiceBreathSelf(p222, p223, p224, p225, 60, "rbxassetid://8971870792", "gold01", 1, color3111, color3112, color3113, color3114, 1, 0.9)
end
function module.MidMoney(p226, p227, p228, p229)
	task.spawn(function()
		effectsService.ShakeSync(p227, p227.Position, 0.3, 0.25)
		audioServicePlaySound("cashregister")
	end)

	local color3115 = Color3.fromRGB(210, 255, 225)
	local color3116 = Color3.fromRGB(163, 220, 194)
	local color3117 = Color3.fromRGB(210, 255, 225)
	local color3118 = Color3.fromRGB(163, 220, 194)

	effectsServiceBreathAttack(p226, p227, p228, p229, 45, "rbxassetid://8971870792", "gold01", 0.85, color3115, color3116, color3117, color3118, 1, 0.9)
end
function module.SmallMoney(p230, p231, p232, p233)
	task.spawn(function()
		effectsService.ShakeSync(p231, p231.Position, 0.3, 0.2)
		audioServicePlaySound("cashregister")
	end)

	local color3119 = Color3.fromRGB(210, 255, 225)
	local color3120 = Color3.fromRGB(163, 220, 194)
	local color3121 = Color3.fromRGB(210, 255, 225)
	local color3122 = Color3.fromRGB(163, 220, 194)

	effectsServiceBreathAttack(p230, p231, p232, p233, 30, "rbxassetid://8971870792", "gold01", 0.6, color3119, color3120, color3121, color3122, 1, 0.9)
end
function module.LargeBubbles(p234, p235, p236, p237)
	task.spawn(function()
		effectsService.ShakeSync(p235, p235.Position, 0.4, 0.3)
	end)

	local color3123 = Color3.fromRGB(105, 204, 240)
	local color3124 = Color3.fromRGB(137, 234, 253)
	local color3125 = Color3.fromRGB(139, 178, 202)
	local color3126 = Color3.fromRGB(51, 138, 188)

	effectsServiceBreathAttack(p234, p235, p236, p237, 110, "rbxassetid://1249690853", "BubbleBeam", 1, color3123, color3124, color3125, color3126, 0.7, 0.7)
end
function module.MidBubbles(p238, p239, p240, p241)
	task.spawn(function()
		effectsService.ShakeSync(p239, p239.Position, 0.3, 0.2)
	end)

	local color3127 = Color3.fromRGB(105, 204, 240)
	local color3128 = Color3.fromRGB(137, 234, 253)
	local color3129 = Color3.fromRGB(139, 178, 202)
	local color3130 = Color3.fromRGB(51, 138, 188)

	effectsServiceBreathAttack(p238, p239, p240, p241, 105, "rbxassetid://1249690853", "Bubbling", 0.8, color3127, color3128, color3129, color3130, 0.7, 0.6)
end
function module.SmallBubbles(p242, p243, p244, p245)
	task.spawn(function()
		effectsService.ShakeSync(p243, p243.Position, 0.3, 0.2)
	end)

	local color3131 = Color3.fromRGB(105, 204, 240)
	local color3132 = Color3.fromRGB(137, 234, 253)
	local color3133 = Color3.fromRGB(139, 178, 202)
	local color3134 = Color3.fromRGB(51, 138, 188)

	effectsServiceBreathAttack(p242, p243, p244, p245, 95, "rbxassetid://1249690853", "Bubbling2", 0.6, color3131, color3132, color3133, color3134, 0.6, 0.6)
end
function module.LargeAcid(p246, p247, p248, p249)
	task.spawn(function()
		effectsService.ShakeSync(p247, p247.Position, 0.4, 0.3)
	end)

	local color3135 = Color3.fromRGB(197, 0, 0)
	local color3136 = Color3.fromRGB(177, 0, 0)
	local color3137 = Color3.fromRGB(211, 9, 2)
	local color3138 = Color3.fromRGB(182, 0, 0)

	effectsServiceBreathAttack(p246, p247, p248, p249, 110, "rbxassetid://1249690853", "BubbleBeam", 1, color3135, color3136, color3137, color3138, 0.7, 0.7)
end
function module.MidAcid(p250, p251, p252, p253)
	task.spawn(function()
		effectsService.ShakeSync(p251, p251.Position, 0.3, 0.2)
	end)

	local color3139 = Color3.fromRGB(197, 0, 0)
	local color3140 = Color3.fromRGB(177, 0, 0)
	local color3141 = Color3.fromRGB(211, 9, 2)
	local color3142 = Color3.fromRGB(182, 0, 0)

	effectsServiceBreathAttack(p250, p251, p252, p253, 105, "rbxassetid://1249690853", "Bubbling", 0.8, color3139, color3140, color3141, color3142, 0.7, 0.6)
end
function module.SmallAcid(p254, p255, p256, p257)
	task.spawn(function()
		effectsService.ShakeSync(p255, p255.Position, 0.3, 0.2)
	end)

	local color3143 = Color3.fromRGB(197, 0, 0)
	local color3144 = Color3.fromRGB(177, 0, 0)
	local color3145 = Color3.fromRGB(211, 9, 2)
	local color3146 = Color3.fromRGB(182, 0, 0)

	effectsServiceBreathAttack(p254, p255, p256, p257, 95, "rbxassetid://1249690853", "Bubbling2", 0.6, color3143, color3144, color3145, color3146, 0.6, 0.6)
end
function module.LargeSwamp(p258, p259, p260, p261)
	task.spawn(function()
		effectsService.ShakeSync(p259, p259.Position, 0.4, 0.3)
	end)

	local color3147 = Color3.fromRGB(78, 171, 86)
	local color3148 = Color3.fromRGB(46, 131, 56)
	local color3149 = Color3.fromRGB(59, 168, 59)
	local color3150 = Color3.fromRGB(7, 106, 0)

	effectsServiceBreathAttack(p258, p259, p260, p261, 110, "rbxassetid://1249690853", "BubbleBeam", 1, color3147, color3148, color3149, color3150, 0.7, 0.7)
end
function module.MidSwamp(p262, p263, p264, p265)
	task.spawn(function()
		effectsService.ShakeSync(p263, p263.Position, 0.3, 0.2)
	end)

	local color3151 = Color3.fromRGB(78, 171, 86)
	local color3152 = Color3.fromRGB(46, 131, 56)
	local color3153 = Color3.fromRGB(59, 168, 59)
	local color3154 = Color3.fromRGB(7, 106, 0)

	effectsServiceBreathAttack(p262, p263, p264, p265, 105, "rbxassetid://1249690853", "Bubbling", 0.8, color3151, color3152, color3153, color3154, 0.7, 0.6)
end
function module.SmallSwamp(p266, p267, p268, p269)
	task.spawn(function()
		effectsService.ShakeSync(p267, p267.Position, 0.3, 0.2)
	end)

	local color3155 = Color3.fromRGB(78, 171, 86)
	local color3156 = Color3.fromRGB(46, 131, 56)
	local color3157 = Color3.fromRGB(59, 168, 59)
	local color3158 = Color3.fromRGB(7, 106, 0)

	effectsServiceBreathAttack(p266, p267, p268, p269, 95, "rbxassetid://1249690853", "Bubbling2", 0.6, color3155, color3156, color3157, color3158, 0.6, 0.6)
end
function module.LargeGoo(p270, p271, p272, p273)
	task.spawn(function()
		effectsService.ShakeSync(p271, p271.Position, 0.4, 0.3)
	end)

	local color3159 = Color3.fromRGB(169, 85, 197)
	local color3160 = Color3.fromRGB(125, 72, 182)
	local color3161 = Color3.fromRGB(139, 58, 197)
	local color3162 = Color3.fromRGB(115, 0, 172)

	effectsServiceBreathAttack(p270, p271, p272, p273, 110, "rbxassetid://1249690853", "BubbleBeam", 1, color3159, color3160, color3161, color3162, 0.7, 0.7)
end
function module.MidGoo(p274, p275, p276, p277)
	task.spawn(function()
		effectsService.ShakeSync(p275, p275.Position, 0.3, 0.2)
	end)

	local color3163 = Color3.fromRGB(169, 85, 197)
	local color3164 = Color3.fromRGB(125, 72, 182)
	local color3165 = Color3.fromRGB(139, 58, 197)
	local color3166 = Color3.fromRGB(115, 0, 172)

	effectsServiceBreathAttack(p274, p275, p276, p277, 105, "rbxassetid://1249690853", "Bubbling", 0.8, color3163, color3164, color3165, color3166, 0.7, 0.6)
end
function module.SmallGoo(p278, p279, p280, p281)
	task.spawn(function()
		effectsService.ShakeSync(p279, p279.Position, 0.3, 0.2)
	end)

	local color3167 = Color3.fromRGB(169, 85, 197)
	local color3168 = Color3.fromRGB(125, 72, 182)
	local color3169 = Color3.fromRGB(139, 58, 197)
	local color3170 = Color3.fromRGB(115, 0, 172)

	effectsServiceBreathAttack(p278, p279, p280, p281, 95, "rbxassetid://1249690853", "Bubbling2", 0.6, color3167, color3168, color3169, color3170, 0.6, 0.6)
end
function module.WhirlpoolParticleLarge(p282, p283, p284, p285)
	local color3171 = Color3.fromRGB(96, 247, 255)
	local color3172 = Color3.fromRGB(14, 181, 214)
	local color3173 = Color3.fromRGB(97, 218, 255)
	local color3174 = Color3.fromRGB(10, 177, 255)

	effectsServiceBreathParticle(p282, p283, p284, p285, 25, "rbxassetid://1249690853", "Whirlpool3", 1, color3171, color3172, color3173, color3174, 0.5, 0.3)
end
function module.WhirlpoolParticle(p286, p287, p288, p289)
	local color3175 = Color3.fromRGB(96, 247, 255)
	local color3176 = Color3.fromRGB(14, 181, 214)
	local color3177 = Color3.fromRGB(97, 218, 255)
	local color3178 = Color3.fromRGB(10, 177, 255)

	effectsServiceBreathParticle(p286, p287, p288, p289, 25, "rbxassetid://1249690853", "Whirlpool2", 0.8, color3175, color3176, color3177, color3178, 0.5, 0.3)
end
function module.WhirlpoolParticleSmall(p290, p291, p292, p293)
	local color3179 = Color3.fromRGB(96, 247, 255)
	local color3180 = Color3.fromRGB(14, 181, 214)
	local color3181 = Color3.fromRGB(97, 218, 255)
	local color3182 = Color3.fromRGB(10, 177, 255)

	effectsServiceBreathParticle(p290, p291, p292, p293, 25, "rbxassetid://1249690853", "Whirlpool1", 0.6, color3179, color3180, color3181, color3182, 0.5, 0.3)
end
function module.MaelstromParticleLarge(p294, p295, p296, p297)
	local color3183 = Color3.fromRGB(0, 193, 39)
	local color3184 = Color3.fromRGB(0, 214, 0)
	local color3185 = Color3.fromRGB(27, 177, 1)
	local color3186 = Color3.fromRGB(53, 198, 27)

	effectsServiceBreathParticle(p294, p295, p296, p297, 25, "rbxassetid://1249690853", "Whirlpool3", 1, color3183, color3184, color3185, color3186, 0.5, 0.3)
end
function module.MaelstromParticle(p298, p299, p300, p301)
	local color3187 = Color3.fromRGB(0, 193, 39)
	local color3188 = Color3.fromRGB(0, 214, 0)
	local color3189 = Color3.fromRGB(27, 177, 1)
	local color3190 = Color3.fromRGB(53, 198, 27)

	effectsServiceBreathParticle(p298, p299, p300, p301, 25, "rbxassetid://1249690853", "Whirlpool2", 0.8, color3187, color3188, color3189, color3190, 0.5, 0.3)
end
function module.MaelstromParticleSmall(p302, p303, p304, p305)
	local color3191 = Color3.fromRGB(0, 193, 39)
	local color3192 = Color3.fromRGB(0, 214, 0)
	local color3193 = Color3.fromRGB(27, 177, 1)
	local color3194 = Color3.fromRGB(53, 198, 27)

	effectsServiceBreathParticle(p302, p303, p304, p305, 25, "rbxassetid://1249690853", "Whirlpool1", 0.6, color3191, color3192, color3193, color3194, 0.5, 0.3)
end
function module.GravityParticleLarge(p306, p307, p308, p309)
	local effectsServiceBreathimagesGravity = effectsServiceBreathimages.gravity
	local color3195 = Color3.fromRGB(255, 255, 255)
	local color3196 = Color3.fromRGB(255, 255, 255)
	local color3197 = Color3.fromRGB(255, 255, 255)
	local color3198 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p306, p307, p308, p309, 35, effectsServiceBreathimagesGravity, "Gravity3", 1, color3195, color3196, color3197, color3198, 1, 0.8)
end
function module.GravityParticle(p310, p311, p312, p313)
	local effectsServiceBreathimagesGravity = effectsServiceBreathimages.gravity
	local color3199 = Color3.fromRGB(255, 255, 255)
	local color3200 = Color3.fromRGB(255, 255, 255)
	local color3201 = Color3.fromRGB(255, 255, 255)
	local color3202 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p310, p311, p312, p313, 25, effectsServiceBreathimagesGravity, "Gravity2", 0.8, color3199, color3200, color3201, color3202, 1, 0.8)
end
function module.GravityParticleSmall(p314, p315, p316, p317)
	local effectsServiceBreathimagesGravity = effectsServiceBreathimages.gravity
	local color3203 = Color3.fromRGB(255, 255, 255)
	local color3204 = Color3.fromRGB(255, 255, 255)
	local color3205 = Color3.fromRGB(255, 255, 255)
	local color3206 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p314, p315, p316, p317, 20, effectsServiceBreathimagesGravity, "Gravity1", 0.6, color3203, color3204, color3205, color3206, 1, 0.8)
end
function module.DivinityParticleLarge(p318, p319, p320, p321)
	local effectsServiceBreathimagesDivine = effectsServiceBreathimages.divine
	local color3207 = Color3.fromRGB(255, 255, 255)
	local color3208 = Color3.fromRGB(255, 255, 255)
	local color3209 = Color3.fromRGB(255, 255, 255)
	local color3210 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p318, p319, p320, p321, 35, effectsServiceBreathimagesDivine, "Ascend2", 1, color3207, color3208, color3209, color3210, 1, 0.8)
end
function module.DivinityParticle(p322, p323, p324, p325)
	local effectsServiceBreathimagesDivine = effectsServiceBreathimages.divine
	local color3211 = Color3.fromRGB(255, 255, 255)
	local color3212 = Color3.fromRGB(255, 255, 255)
	local color3213 = Color3.fromRGB(255, 255, 255)
	local color3214 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p322, p323, p324, p325, 25, effectsServiceBreathimagesDivine, "Ascend", 0.8, color3211, color3212, color3213, color3214, 1, 0.8)
end
function module.DivinityParticleSmall(p326, p327, p328, p329)
	local effectsServiceBreathimagesDivine = effectsServiceBreathimages.divine
	local color3215 = Color3.fromRGB(255, 255, 255)
	local color3216 = Color3.fromRGB(255, 255, 255)
	local color3217 = Color3.fromRGB(255, 255, 255)
	local color3218 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p326, p327, p328, p329, 20, effectsServiceBreathimagesDivine, "Ascend3", 0.6, color3215, color3216, color3217, color3218, 1, 0.8)
end
function module.BoltParticleLarge(p330, p331, p332, p333)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3219 = Color3.fromRGB(255, 255, 255)
	local color3220 = Color3.fromRGB(255, 255, 255)
	local color3221 = Color3.fromRGB(255, 255, 255)
	local color3222 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p330, p331, p332, p333, 15, effectsServiceBreathimagesBolt, "Lightning2", 1, color3219, color3220, color3221, color3222, 1, 0.8)
end
function module.BoltParticle(p334, p335, p336, p337)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3223 = Color3.fromRGB(255, 255, 255)
	local color3224 = Color3.fromRGB(255, 255, 255)
	local color3225 = Color3.fromRGB(255, 255, 255)
	local color3226 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p334, p335, p336, p337, 10, effectsServiceBreathimagesBolt, "Lightning2", 0.8, color3223, color3224, color3225, color3226, 1, 0.8)
end
function module.BoltParticleSmall(p338, p339, p340, p341)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3227 = Color3.fromRGB(255, 255, 255)
	local color3228 = Color3.fromRGB(255, 255, 255)
	local color3229 = Color3.fromRGB(255, 255, 255)
	local color3230 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p338, p339, p340, p341, 8, effectsServiceBreathimagesBolt, "Lightning1", 0.6, color3227, color3228, color3229, color3230, 1, 0.8)
end
function module.GustParticleLarge(p342, p343, p344, p345)
	local effectsServiceBreathimagesGust = effectsServiceBreathimages.gust
	local color3231 = Color3.fromRGB(255, 255, 255)
	local color3232 = Color3.fromRGB(255, 255, 255)
	local color3233 = Color3.fromRGB(255, 255, 255)
	local color3234 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p342, p343, p344, p345, 15, effectsServiceBreathimagesGust, "Wind", 1, color3231, color3232, color3233, color3234, 1, 0.8)
end
function module.GustParticle(p346, p347, p348, p349)
	local effectsServiceBreathimagesGust = effectsServiceBreathimages.gust
	local color3235 = Color3.fromRGB(255, 255, 255)
	local color3236 = Color3.fromRGB(255, 255, 255)
	local color3237 = Color3.fromRGB(255, 255, 255)
	local color3238 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p346, p347, p348, p349, 10, effectsServiceBreathimagesGust, "Wind", 0.8, color3235, color3236, color3237, color3238, 1, 0.8)
end
function module.GustParticleSmall(p350, p351, p352, p353)
	local effectsServiceBreathimagesGust = effectsServiceBreathimages.gust
	local color3239 = Color3.fromRGB(255, 255, 255)
	local color3240 = Color3.fromRGB(255, 255, 255)
	local color3241 = Color3.fromRGB(255, 255, 255)
	local color3242 = Color3.fromRGB(255, 255, 255)

	effectsServiceBreathParticle(p350, p351, p352, p353, 8, effectsServiceBreathimagesGust, "Wind", 0.6, color3239, color3240, color3241, color3242, 1, 0.8)
end
function module.RedBoltParticleLarge(p354, p355, p356, p357)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3243 = Color3.fromRGB(121, 0, 2)
	local color3244 = Color3.fromRGB(100, 10, 12)
	local color3245 = Color3.fromRGB(255, 58, 61)
	local color3246 = Color3.fromRGB(172, 66, 68)

	effectsServiceBreathParticle(p354, p355, p356, p357, 15, effectsServiceBreathimagesBolt, "Lightning2", 1, color3243, color3244, color3245, color3246, 1, 0.8)
end
function module.RedBoltParticle(p358, p359, p360, p361)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3247 = Color3.fromRGB(121, 0, 2)
	local color3248 = Color3.fromRGB(100, 10, 12)
	local color3249 = Color3.fromRGB(255, 58, 61)
	local color3250 = Color3.fromRGB(172, 66, 68)

	effectsServiceBreathParticle(p358, p359, p360, p361, 10, effectsServiceBreathimagesBolt, "Lightning2", 0.8, color3247, color3248, color3249, color3250, 1, 0.8)
end
function module.RedBoltParticleSmall(p362, p363, p364, p365)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3251 = Color3.fromRGB(121, 0, 2)
	local color3252 = Color3.fromRGB(100, 10, 12)
	local color3253 = Color3.fromRGB(255, 58, 61)
	local color3254 = Color3.fromRGB(172, 66, 68)

	effectsServiceBreathParticle(p362, p363, p364, p365, 8, effectsServiceBreathimagesBolt, "Lightning1", 0.6, color3251, color3252, color3253, color3254, 1, 0.8)
end
function module.PurpleBoltParticleLarge(p366, p367, p368, p369)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3255 = Color3.fromRGB(117, 0, 121)
	local color3256 = Color3.fromRGB(83, 14, 112)
	local color3257 = Color3.fromRGB(147, 52, 255)
	local color3258 = Color3.fromRGB(111, 68, 172)

	effectsServiceBreathParticle(p366, p367, p368, p369, 15, effectsServiceBreathimagesBolt, "Lightning2", 1, color3255, color3256, color3257, color3258, 1, 0.8)
end
function module.PurpleBoltParticle(p370, p371, p372, p373)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3259 = Color3.fromRGB(117, 0, 121)
	local color3260 = Color3.fromRGB(83, 14, 112)
	local color3261 = Color3.fromRGB(147, 52, 255)
	local color3262 = Color3.fromRGB(111, 68, 172)

	effectsServiceBreathParticle(p370, p371, p372, p373, 10, effectsServiceBreathimagesBolt, "Lightning2", 0.8, color3259, color3260, color3261, color3262, 1, 0.8)
end
function module.PurpleBoltParticleSmall(p374, p375, p376, p377)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3263 = Color3.fromRGB(117, 0, 121)
	local color3264 = Color3.fromRGB(83, 14, 112)
	local color3265 = Color3.fromRGB(147, 52, 255)
	local color3266 = Color3.fromRGB(111, 68, 172)

	effectsServiceBreathParticle(p374, p375, p376, p377, 8, effectsServiceBreathimagesBolt, "Lightning1", 0.6, color3263, color3264, color3265, color3266, 1, 0.8)
end
function module.GreenBoltParticleLarge(p378, p379, p380, p381)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3267 = Color3.fromRGB(0, 141, 16)
	local color3268 = Color3.fromRGB(60, 171, 0)
	local color3269 = Color3.fromRGB(13, 167, 77)
	local color3270 = Color3.fromRGB(40, 111, 40)

	effectsServiceBreathParticle(p378, p379, p380, p381, 15, effectsServiceBreathimagesBolt, "Lightning2", 1, color3267, color3268, color3269, color3270, 1, 0.8)
end
function module.GreenBoltParticle(p382, p383, p384, p385)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3271 = Color3.fromRGB(0, 141, 16)
	local color3272 = Color3.fromRGB(60, 171, 0)
	local color3273 = Color3.fromRGB(13, 167, 77)
	local color3274 = Color3.fromRGB(40, 111, 40)

	effectsServiceBreathParticle(p382, p383, p384, p385, 10, effectsServiceBreathimagesBolt, "Lightning2", 0.8, color3271, color3272, color3273, color3274, 1, 0.8)
end
function module.GreenBoltParticleSmall(p386, p387, p388, p389)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3275 = Color3.fromRGB(0, 141, 16)
	local color3276 = Color3.fromRGB(60, 171, 0)
	local color3277 = Color3.fromRGB(13, 167, 77)
	local color3278 = Color3.fromRGB(40, 111, 40)

	effectsServiceBreathParticle(p386, p387, p388, p389, 8, effectsServiceBreathimagesBolt, "Lightning1", 0.6, color3275, color3276, color3277, color3278, 1, 0.8)
end
function module.YellowBoltParticleLarge(p390, p391, p392, p393)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3279 = Color3.fromRGB(255, 205, 6)
	local color3280 = Color3.fromRGB(145, 133, 5)
	local color3281 = Color3.fromRGB(251, 255, 6)
	local color3282 = Color3.fromRGB(172, 144, 7)

	effectsServiceBreathParticle(p390, p391, p392, p393, 15, effectsServiceBreathimagesBolt, "Lightning2", 1, color3279, color3280, color3281, color3282, 1, 0.8)
end
function module.YellowBoltParticle(p394, p395, p396, p397)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3283 = Color3.fromRGB(255, 205, 6)
	local color3284 = Color3.fromRGB(145, 133, 5)
	local color3285 = Color3.fromRGB(251, 255, 6)
	local color3286 = Color3.fromRGB(172, 144, 7)

	effectsServiceBreathParticle(p394, p395, p396, p397, 10, effectsServiceBreathimagesBolt, "Lightning2", 0.8, color3283, color3284, color3285, color3286, 1, 0.8)
end
function module.YellowBoltParticleSmall(p398, p399, p400, p401)
	local effectsServiceBreathimagesBolt = effectsServiceBreathimages.bolt
	local color3287 = Color3.fromRGB(255, 205, 6)
	local color3288 = Color3.fromRGB(145, 133, 5)
	local color3289 = Color3.fromRGB(251, 255, 6)
	local color3290 = Color3.fromRGB(172, 144, 7)

	effectsServiceBreathParticle(p398, p399, p400, p401, 8, effectsServiceBreathimagesBolt, "Lightning1", 0.6, color3287, color3288, color3289, color3290, 1, 0.8)
end
function module.IceParticleLarge(p402, p403, p404, p405)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3291 = Color3.fromRGB(67, 180, 255)
	local color3292 = Color3.fromRGB(71, 212, 255)
	local color3293 = Color3.fromRGB(14, 143, 255)
	local color3294 = Color3.fromRGB(11, 178, 255)

	effectsServiceBreathParticle(p402, p403, p404, p405, 20, effectsServiceBreathimagesIce, "IceBreath", 0.9, color3291, color3292, color3293, color3294, 0.7, 0.5)
end
function module.IceParticle(p406, p407, p408, p409)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3295 = Color3.fromRGB(67, 180, 255)
	local color3296 = Color3.fromRGB(71, 212, 255)
	local color3297 = Color3.fromRGB(14, 143, 255)
	local color3298 = Color3.fromRGB(11, 178, 255)

	effectsServiceBreathParticle(p406, p407, p408, p409, 20, effectsServiceBreathimagesIce, "IceBreath2", 0.7, color3295, color3296, color3297, color3298, 0.7, 0.5)
end
function module.IceParticleSmall(p410, p411, p412, p413)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3299 = Color3.fromRGB(67, 180, 255)
	local color3300 = Color3.fromRGB(71, 212, 255)
	local color3301 = Color3.fromRGB(14, 143, 255)
	local color3302 = Color3.fromRGB(11, 178, 255)

	effectsServiceBreathParticle(p410, p411, p412, p413, 20, effectsServiceBreathimagesIce, "IceBreath3", 0.5, color3299, color3300, color3301, color3302, 0.7, 0.5)
end
function module.SmallSoulDrain(p414, p415, p416, _)
	local t10: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p414, t10)
	audioServicePlaySound("Absorb")
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p416, p416.Position, 0.5, 0.1)
	end)

	local t11: {[any]: any} = { Color3.fromRGB(46, 80, 52), Color3.fromRGB(92, 158, 85) }
	local v944 = UDim2.fromOffset(p415.AbsoluteSize.X * 0.5, p415.AbsoluteSize.X * 0.5)

	audioServicePlaySound("SoulAttack1")

	local t12: {[any]: any} = {
		Strength = 150,
		Time = 0.4,
		Projectile = t10,
		Color = t11,
		Size = v944
	}

	effectsServiceBreathInverse(p414, p416, p415, t12)
	t12.Color = { Color3.fromRGB(81, 111, 98), Color3.fromRGB(137, 171, 147) }
	effectsServiceBreathInverse(p414, p416, p415, t12)
	spawn(function()
		effectsServiceWaitX(0.5)
		effectsService.Shake(p415, p415.Position, 0.2, 0.1)
	end)
	wait(0.3)
end
function module.MidSoulDrain(p418, p419, p420, _)
	local t13: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p418, t13)
	audioServicePlaySound("Absorb")
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p420, p420.Position, 0.5, 0.1)
	end)

	local t14: {[any]: any} = { Color3.fromRGB(70, 122, 79), Color3.fromRGB(92, 158, 85) }
	local v952 = UDim2.fromOffset(p419.AbsoluteSize.X * 0.7, p419.AbsoluteSize.X * 0.7)

	audioServicePlaySound("SoulAttack2")

	local t15: {[any]: any} = {
		Strength = 250,
		Time = 0.45,
		Projectile = t13,
		Color = t14,
		Size = v952
	}

	effectsServiceBreathInverse(p418, p420, p419, t15)
	t15.Color = { Color3.fromRGB(187, 255, 226), Color3.fromRGB(126, 165, 137) }
	effectsServiceBreathInverse(p418, p420, p419, t15)
	spawn(function()
		effectsServiceWaitX(0.5)
		effectsService.Shake(p419, p419.Position, 0.2, 0.2)
	end)
	wait(0.3)
end
function module.LargeSoulDrain(p422, p423, p424, _)
	local t16: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p422, t16)
	audioServicePlaySound("Absorb")
	audioServicePlaySound("SoulAttack3")
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p424, p424.Position, 0.5, 0.1)
	end)

	local t17: {[any]: any} = { Color3.fromRGB(94, 163, 105), Color3.fromRGB(132, 226, 121) }
	local v960 = UDim2.fromOffset(p423.AbsoluteSize.X * 0.9, p423.AbsoluteSize.X * 0.9)
	local t18: {[any]: any} = {
		Strength = 300,
		Time = 0.6,
		Projectile = t16,
		Color = t17,
		Size = v960
	}

	effectsServiceBreathInverse(p422, p424, p423, t18)
	t18.Color = { Color3.fromRGB(186, 254, 225), Color3.fromRGB(144, 186, 159) }
	effectsServiceBreathInverse(p422, p424, p423, t18)
	spawn(function()
		effectsServiceWaitX(0.7)
		effectsService.Shake(p423, p423.Position, 0.3, 0.3)
	end)
	wait(0.3)
end
function module.SmallSoulSyphon(p426, p427, p428, _)
	local t19: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p426, t19)
	audioServicePlaySound("Absorb")
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p428, p428.Position, 0.5, 0.1)
	end)

	local t20: {[any]: any} = { Color3.fromRGB(164, 117, 173), Color3.fromRGB(189, 134, 223) }
	local v968 = UDim2.fromOffset(p427.AbsoluteSize.X * 0.5, p427.AbsoluteSize.X * 0.5)

	audioServicePlaySound("SoulAttack1")

	local t21: {[any]: any} = {
		Strength = 100,
		Time = 0.4,
		Projectile = t19,
		Color = t20,
		Size = v968
	}

	effectsServiceBreathInverse(p426, p428, p427, t21)
	t21.Color = { Color3.fromRGB(213, 126, 231), Color3.fromRGB(153, 109, 171) }
	effectsServiceBreathInverse(p426, p428, p427, t21)
	spawn(function()
		effectsServiceWaitX(0.5)
		effectsService.Shake(p427, p427.Position, 0.2, 0.1)
	end)
	wait(0.3)
end
function module.MidSoulSyphon(p430, p431, p432, _)
	local t22: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p430, t22)
	audioServicePlaySound("Absorb")
	task.spawn(function()
	end)
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p432, p432.Position, 0.5, 0.1)
	end)

	local t23: {[any]: any} = { Color3.fromRGB(145, 92, 163), Color3.fromRGB(165, 96, 226) }
	local v976 = UDim2.fromOffset(p431.AbsoluteSize.X * 0.7, p431.AbsoluteSize.X * 0.7)

	audioServicePlaySound("SoulAttack2")

	local t24: {[any]: any} = {
		Strength = 250,
		Time = 0.45,
		Projectile = t22,
		Color = t23,
		Size = v976
	}

	effectsServiceBreathInverse(p430, p432, p431, t24)
	t24.Color = { Color3.fromRGB(195, 143, 254), Color3.fromRGB(176, 138, 222) }
	effectsServiceBreathInverse(p430, p432, p431, t24)
	spawn(function()
		effectsServiceWaitX(0.5)
		effectsService.Shake(p431, p431.Position, 0.2, 0.2)
	end)
	wait(0.3)
end
function module.LargeSoulSyphon(p434, p435, p436, _)
	local t25: {[any]: any} = {
		"rbxassetid://243728206",
		"rbxassetid://7924475318",
		"rbxassetid://11815755770",
		"rbxassetid://6490035152",
		"rbxassetid://420579266",
		"rbxassetid://333176583"
	}

	effectsServicePreloadTech(p434, t25)
	audioServicePlaySound("Absorb")
	audioServicePlaySound("SoulAttack3")
	wait(0.1)
	task.spawn(function()
		effectsService.Shake(p436, p436.Position, 0.5, 0.1)
	end)

	local t26: {[any]: any} = { Color3.fromRGB(142, 59, 163), Color3.fromRGB(221, 86, 226) }
	local v984 = UDim2.fromOffset(p435.AbsoluteSize.X * 0.9, p435.AbsoluteSize.X * 0.9)
	local t27: {[any]: any} = {
		Strength = 350,
		Time = 0.6,
		Projectile = t25,
		Color = t26,
		Size = v984
	}

	effectsServiceBreathInverse(p434, p436, p435, t27)
	t27.Color = { Color3.fromRGB(213, 143, 254), Color3.fromRGB(131, 49, 147) }
	effectsServiceBreathInverse(p434, p436, p435, t27)
	spawn(function()
		effectsServiceWaitX(0.7)
		effectsService.Shake(p435, p435.Position, 0.3, 0.3)
	end)
	wait(0.3)
end
local function PunchEffect(p438, p439, p440, p441)
	effectsServicePreloadTech(p438, {
		"rbxassetid://5090109153",
		"rbxassetid://12169820339",
		"rbxassetid://12983292540",
		"rbxassetid://12177889060",
		"rbxassetid://12168472253"
	})

	local t28 = p441 or {}
	local v991 = t28.SizeMul or 2
	local growMul = t28.GrowMul
	local v993 = t28.ShrinkMul or 1.5
	local sound = t28.Sound
	local v995 = t28.Image or "rbxassetid://5090109153"
	local impactColor = t28.ImpactColor
	local impactImage = t28.ImpactImage
	local v998 = t28.ImpactScale or 1
	local v999 = t28.ImpactGrow or 1.3
	local v1000 = t28.GrowTime or 0.15
	local v1001 = t28.ShrinkTime or 0.075
	local v1002 = t28.WaitAfterGrow or v1000
	local v1003 = t28.FadeDelay or 0.2
	local t29 = t28.Shake or { 0.4, 0.15 }
	local uDim2 = UDim2.new(0, p440.AbsolutePosition.X + p440.AbsoluteSize.X / 2, 0, p440.AbsolutePosition.Y + p440.AbsoluteSize.Y / 2)
	local n1 = p440.ZIndex + 10001
	local uDim220 = UDim2.new(0, p440.AbsoluteSize.X * v991, 0, p440.AbsoluteSize.X * v991)
	local v1008 = effectsServiceNewerCircle(p438, { Image = v995, ZIndex = n1, Size = uDim220, Position = uDim2 })

	if sound then
		audioService.PlaySound(sound)
	end

	if growMul then
		local uDim221 = UDim2.new(0, p440.AbsoluteSize.X * growMul, 0, p440.AbsoluteSize.X * growMul)

		v1008:TweenSize(uDim221, "Out", "Quad", v1000, true)
		effectsServiceWaitX(v1002)
	end

	local uDim222 = UDim2.new(0, p440.AbsoluteSize.X / v993, 0, p440.AbsoluteSize.X / v993)

	v1008:TweenSize(uDim222, "In", "Quad", v1001, true)

	local u1011 = nil

	if impactImage then
		local n2 = p440.ZIndex + 10000
		local uDim223 = UDim2.new(0, p440.AbsoluteSize.X * v998, 0, p440.AbsoluteSize.X * v998)

		u1011 = effectsServiceNewerCircle(p438, {
			Image = impactImage,
			ZIndex = n2,
			Size = uDim223,
			ImageColor3 = impactColor or Color3.new(0, 0, 0),
			Position = uDim2
		})
		effectsService.ShakeBattle(p438, 0.1, 0.025)

		local uDim224 = UDim2.new(0, p440.AbsoluteSize.X * v999, 0, p440.AbsoluteSize.X * v999)

		u1011:TweenSize(uDim224, "Out", "Quad", 0.075, true)
	end

	spawn(function()
		effectsService.Shake(p439, p439.Position, 0.08000000000000002, t29[2])
	end)
	spawn(function()
		effectsService.Shake(p440, p440.Position, 0.13999999999999999, t29[2])
	end)
	spawn(function()
		effectsService.Shake(v1008, v1008.Position, t29[1] * 0.8, t29[2])
	end)

	if u1011 then
		spawn(function()
			effectsService.Shake(u1011, u1011.Position, t29[1] * 0.8, t29[2])
		end)
	end

	spawn(function()
		wait(v1003 * 0.8)
		effectsService.TweenProperty(v1008, "ImageTransparency", 0, 1, 0.4)
		v1008:Destroy()
	end)

	if u1011 then
		spawn(function()
			wait(v1003 * 0.8)
			effectsService.TweenProperty(u1011, "ImageTransparency", 0, 1, 0.4)
			u1011:Destroy()
		end)
	end
end
function module.LargePunch(p442, p443, p444)
	PunchEffect(p442, p443, p444, {
		Sound = "LargePunch",
		SizeMul = 2,
		GrowMul = 3.3,
		ShrinkMul = 1.5,
		ImpactImage = "rbxassetid://12168472253",
		ImpactScale = 0.9,
		FadeDelay = 0.55,
		Shake = { 0.5, 0.5 }
	})
	wait(0.3)
end
function module.LargePunchEffect(p445, p446, p447, _)
	module.LargePunch(p445, p446, p447)
end
function module.MidPunch(p449, p450, p451)
	PunchEffect(p449, p450, p451, {
		Sound = "MidPunch",
		SizeMul = 1.8,
		GrowMul = 2,
		ShrinkMul = 1.5,
		GrowTime = 0.1,
		WaitAfterGrow = 0.15,
		Shake = { 0.4, 0.15 }
	})
	wait(0.2)
end
function module.MidPunchEffect(p452, p453, p454, _)
	module.MidPunch(p452, p453, p454)
end
function module.SmallPunch(p456, p457, p458)
	PunchEffect(p456, p457, p458, {
		Sound = "SmallPunch",
		SizeMul = 2,
		GrowMul = 2.2,
		GrowTime = 0.05,
		ShrinkMul = 1.5,
		ShrinkTime = 0.2,
		FadeDelay = 0.28,
		Shake = { 0.2, 0.05 }
	})
	wait(0.2)
end
function module.SmallPunchEffect(p459, p460, p461, _)
	module.SmallPunch(p459, p460, p461)
end
function module.LargeFirePunch(p463, p464, p465, p466)
	spawn(function()
		local color3303 = Color3.fromRGB(226, 19, 19)

		PunchEffect(p463, p464, p465, {
			Image = "rbxassetid://12169820339",
			Sound = "LargePunch",
			ImpactImage = "rbxassetid://12168472253",
			ImpactScale = 0.9,
			SizeMul = 2.3,
			GrowMul = 3.3,
			ShrinkMul = 1.5,
			FadeDelay = 0.45,
			ImpactColor = color3303,
			Shake = { 0.5, 0.25 }
		})
	end)
	task.wait(0.5)
	spawn(function()
		module.EngulfFire(p463, p464, p465, p466)
	end)
	task.wait(0.5)
end
function module.LargeFirePunchEffect(p467, p468, p469, _)
	module.LargeFirePunch(p467, p468, p469, nil, nil)
end
function module.LargeScorchPunch(p471, p472, p473, p474)
	spawn(function()
		local color3304 = Color3.fromRGB(68, 207, 17)

		PunchEffect(p471, p472, p473, {
			Image = "rbxassetid://12983292540",
			Sound = "LargePunch",
			ImpactImage = "rbxassetid://12168472253",
			ImpactScale = 0.9,
			SizeMul = 2.3,
			GrowMul = 3.3,
			ShrinkMul = 1.5,
			FadeDelay = 0.45,
			ImpactColor = color3304,
			Shake = { 0.5, 0.25 }
		})
	end)
	task.wait(0.5)
	spawn(function()
		module.EngulfScorch(p471, p472, p473, p474)
	end)
	task.wait(0.5)
end
function module.LargeScorchPunchEffect(p475, p476, p477, _)
	module.LargeScorchPunch(p475, p476, p477, nil, nil)
end
function module.LargeIcePunch(p479, p480, p481, p482)
	spawn(function()
		local color3305 = Color3.fromRGB(13, 152, 190)

		PunchEffect(p479, p480, p481, {
			Image = "rbxassetid://12177889060",
			Sound = "LargePunch",
			ImpactImage = "rbxassetid://12168472253",
			ImpactScale = 0.9,
			SizeMul = 2.3,
			GrowMul = 3.3,
			ShrinkMul = 1.5,
			FadeDelay = 0.45,
			ImpactColor = color3305,
			Shake = { 0.5, 0.25 }
		})
	end)
	task.wait(0.5)
	spawn(function()
		module.EngulfIce(p479, p480, p481, p482)
	end)
	task.wait(0.5)
end
function module.LargeIcePunchEffect(p483, p484, p485, _)
	module.LargeIcePunch(p483, p484, p485, nil, nil)
end
function module.MidFirePunch(p487, p488, p489, p490)
	spawn(function()
		PunchEffect(p487, p488, p489, {
			Image = "rbxassetid://12169820339",
			Sound = "MidPunch",
			SizeMul = 1.8,
			GrowMul = 2.2,
			ShrinkMul = 1.4,
			FadeDelay = 0.35,
			Shake = { 0.4, 0.2 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfFire(p487, p488, p489, p490)
	end)
	task.wait(0.5)
end
function module.MidFirePunchEffect(p491, p492, p493, _)
	module.MidFirePunch(p491, p492, p493, nil, nil)
end
function module.MidScorchPunch(p495, p496, p497, p498)
	spawn(function()
		PunchEffect(p495, p496, p497, {
			Image = "rbxassetid://12983292540",
			Sound = "MidPunch",
			SizeMul = 1.8,
			GrowMul = 2.2,
			ShrinkMul = 1.4,
			FadeDelay = 0.35,
			Shake = { 0.4, 0.2 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfScorch(p495, p496, p497, p498)
	end)
	task.wait(0.5)
end
function module.MidScorchPunchEffect(p499, p500, p501, _)
	module.MidScorchPunch(p499, p500, p501, nil, nil)
end
function module.MidIcePunch(p503, p504, p505, p506)
	spawn(function()
		PunchEffect(p503, p504, p505, {
			Image = "rbxassetid://12177889060",
			Sound = "MidPunch",
			SizeMul = 1.8,
			GrowMul = 2.2,
			ShrinkMul = 1.4,
			FadeDelay = 0.35,
			Shake = { 0.4, 0.2 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfIce(p503, p504, p505, p506)
	end)
	task.wait(0.5)
end
function module.MidIcePunchEffect(p507, p508, p509, _)
	module.MidIcePunch(p507, p508, p509, nil, nil)
end
function module.SmallFirePunch(p511, p512, p513, p514)
	spawn(function()
		PunchEffect(p511, p512, p513, {
			Image = "rbxassetid://12169820339",
			Sound = "SmallPunch",
			SizeMul = 1.5,
			GrowMul = 1.8,
			ShrinkMul = 1.3,
			FadeDelay = 0.3,
			Shake = { 0.3, 0.15 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfFireSmall(p511, p512, p513, p514)
	end)
	task.wait(0.5)
end
function module.SmallFirePunchEffect(p515, p516, p517, _)
	module.SmallFirePunch(p515, p516, p517, nil, nil)
end
function module.SmallScorchPunch(p519, p520, p521, p522)
	spawn(function()
		PunchEffect(p519, p520, p521, {
			Image = "rbxassetid://12983292540",
			Sound = "SmallPunch",
			SizeMul = 1.5,
			GrowMul = 1.8,
			ShrinkMul = 1.3,
			FadeDelay = 0.3,
			Shake = { 0.3, 0.15 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfScorchSmall(p519, p520, p521, p522)
	end)
	task.wait(0.5)
end
function module.SmallScorchPunchEffect(p523, p524, p525, _)
	module.SmallScorchPunch(p523, p524, p525, nil, nil)
end
function module.SmallIcePunch(p527, p528, p529, p530)
	spawn(function()
		PunchEffect(p527, p528, p529, {
			Image = "rbxassetid://12177889060",
			Sound = "SmallPunch",
			SizeMul = 1.5,
			GrowMul = 1.8,
			ShrinkMul = 1.3,
			FadeDelay = 0.3,
			Shake = { 0.3, 0.15 }
		})
	end)
	task.wait(0.4)
	spawn(function()
		module.EngulfIceSmall(p527, p528, p529, p530)
	end)
	task.wait(0.5)
end
function module.SmallIcePunchEffect(p531, p532, p533, _)
	module.SmallIcePunch(p531, p532, p533, nil, nil)
end
function module.SmallJab(p535, p536, p537)
	local n1 = p537.ZIndex + 10001
	local uDim2 = UDim2.new(0, p537.AbsoluteSize.X * 2, 0, p537.AbsoluteSize.X * 2)
	local uDim2New = UDim2.new
	local x = p537.AbsolutePosition.X
	local v1115 = p537.AbsoluteSize.X
	local randomNumber = math.random(15, 17)
	local y = p537.AbsolutePosition.Y
	local v1118 = p537.AbsoluteSize.Y
	local randomNumber3 = math.random(15, 17)
	local v1120 = uDim2New(0, x + v1115 / (randomNumber * 0.1), 0, y + v1118 / (randomNumber3 * 0.1))
	local v1121 = effectsServiceNewerCircle(p535, {
		Image = "rbxassetid://5090109153",
		ZIndex = n1,
		Size = uDim2,
		Position = v1120
	})
	local n2 = p537.ZIndex + 10001
	local uDim225 = UDim2.new(0, p537.AbsoluteSize.X * 2, 0, p537.AbsoluteSize.X * 2)
	local v1124 = UDim2.new
	local v1125 = p537.AbsolutePosition.X
	local v1126 = p537.AbsoluteSize.X
	local randomNumber4 = math.random(30, 35)
	local v1128 = p537.AbsolutePosition.Y
	local v1129 = p537.AbsoluteSize.Y
	local randomNumber5 = math.random(30, 35)
	local v1131 = v1124(0, v1125 + v1126 / (randomNumber4 * 0.1), 0, v1128 + v1129 / (randomNumber5 * 0.1))
	local v1132 = effectsServiceNewerCircle(p535, {
		Image = "rbxassetid://12142198154",
		ZIndex = n2,
		Size = uDim225,
		Position = v1131
	})

	audioService.PlaySound("SmallPunch")

	local uDim226 = UDim2.new(0, p537.AbsoluteSize.X / 1.5, 0, p537.AbsoluteSize.X / 1.5)

	v1121:TweenSize(uDim226, "In", "Quad", 0.125, true)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.Shake(p536, p536.Position, 0.12, 0.025)
	end)
	spawn(function()
		effectsService.Shake(p537, p537.Position, 0.16000000000000003, 0.05)
	end)
	spawn(function()
		effectsService.Shake(v1121, v1121.Position, 0.16000000000000003, 0.05)
	end)
	spawn(function()
		wait(0.4)
		effectsService.TweenProperty(v1121, "ImageTransparency", 0, 1, 0.27999999999999997)
		v1121:Destroy()
	end)
	audioService.PlaySound("SmallPunch")

	local uDim227 = UDim2.new(0, p537.AbsoluteSize.X / 1.5, 0, p537.AbsoluteSize.X / 1.5)

	v1132:TweenSize(uDim227, "In", "Quad", 0.125, true)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.Shake(p536, p536.Position, 0.12, 0.025)
	end)
	spawn(function()
		effectsService.Shake(p537, p537.Position, 0.16000000000000003, 0.05)
	end)
	spawn(function()
		effectsService.Shake(v1132, v1132.Position, 0.16000000000000003, 0.05)
	end)
	spawn(function()
		wait(0.24)
		effectsService.TweenProperty(v1132, "ImageTransparency", 0, 1, 0.24)
		v1132:Destroy()
	end)
	wait(0.3)
end
function module.SmallJabEffect(p538, p539, p540, _)
	module.SmallJab(p538, p539, p540, nil, nil)
end
function module.MidJab(p542, p543, p544)
	local n1 = p544.ZIndex + 10001
	local uDim2 = UDim2.new(0, p544.AbsoluteSize.X * 1.7, 0, p544.AbsoluteSize.X * 1.7)
	local uDim2New = UDim2.new
	local x = p544.AbsolutePosition.X
	local v1146 = p544.AbsoluteSize.X
	local randomNumber = math.random(15, 17)
	local y = p544.AbsolutePosition.Y
	local v1149 = p544.AbsoluteSize.Y
	local randomNumber6 = math.random(15, 17)
	local v1151 = uDim2New(0, x + v1146 / (randomNumber * 0.1), 0, y + v1149 / (randomNumber6 * 0.1))
	local v1152 = effectsServiceNewerCircle(p542, {
		Image = "rbxassetid://5090109153",
		ZIndex = n1,
		Size = uDim2,
		Position = v1151
	})
	local n2 = p544.ZIndex + 10001
	local uDim228 = UDim2.new(0, p544.AbsoluteSize.X * 1.7, 0, p544.AbsoluteSize.X * 1.7)
	local v1155 = UDim2.new
	local v1156 = p544.AbsolutePosition.X
	local v1157 = p544.AbsoluteSize.X
	local randomNumber7 = math.random(30, 35)
	local v1159 = p544.AbsolutePosition.Y
	local v1160 = p544.AbsoluteSize.Y
	local randomNumber8 = math.random(30, 35)
	local v1162 = v1155(0, v1156 + v1157 / (randomNumber7 * 0.1), 0, v1159 + v1160 / (randomNumber8 * 0.1))
	local v1163 = effectsServiceNewerCircle(p542, {
		Image = "rbxassetid://12142198154",
		ZIndex = n2,
		Size = uDim228,
		Position = v1162
	})

	audioService.PlaySound("MidPunch")

	local uDim229 = UDim2.new(0, p544.AbsoluteSize.X * 1.8, 0, p544.AbsoluteSize.X * 1.8)

	v1152:TweenSize(uDim229, "Out", "Quad", 0.15, true)
	effectsServiceWaitX(0.15)

	local uDim230 = UDim2.new(0, p544.AbsoluteSize.X / 1.4, 0, p544.AbsoluteSize.X / 1.4)

	v1152:TweenSize(uDim230, "In", "Quad", 0.1, true)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.Shake(p543, p543.Position, 0.12, 0.1)
	end)
	spawn(function()
		effectsService.Shake(p544, p544.Position, 0.32000000000000006, 0.15)
	end)
	spawn(function()
		effectsService.Shake(v1152, v1152.Position, 0.32000000000000006, 0.15)
	end)
	spawn(function()
		wait(0.6000000000000001)
		effectsService.TweenProperty(v1152, "ImageTransparency", 0, 1, 0.16000000000000003)
		v1152:Destroy()
	end)
	audioService.PlaySound("MidPunch")

	local uDim231 = UDim2.new(0, p544.AbsoluteSize.X * 1.8, 0, p544.AbsoluteSize.X * 1.8)

	v1163:TweenSize(uDim231, "Out", "Quad", 0.15, true)
	effectsServiceWaitX(0.15)

	local uDim232 = UDim2.new(0, p544.AbsoluteSize.X / 1.5, 0, p544.AbsoluteSize.X / 1.5)

	v1163:TweenSize(uDim232, "In", "Quad", 0.1, true)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.Shake(p543, p543.Position, 0.12, 0.1)
	end)
	spawn(function()
		effectsService.Shake(p544, p544.Position, 0.32000000000000006, 0.15)
	end)
	spawn(function()
		effectsService.Shake(v1163, v1163.Position, 0.32000000000000006, 0.15)
	end)
	effectsServiceWaitX(0.1)
	spawn(function()
		wait(0.32000000000000006)
		effectsService.TweenProperty(v1163, "ImageTransparency", 0, 1, 0.16000000000000003)
		v1163:Destroy()
	end)
	wait(0.3)
end
function module.MidJabEffect(p545, p546, p547, _)
	module.MidJab(p545, p546, p547, nil, nil)
end
function module.LargeJab(p549, p550, p551)
	local n1 = p551.ZIndex + 10001
	local uDim2 = UDim2.new(0, p551.AbsoluteSize.X * 1.8, 0, p551.AbsoluteSize.X * 1.8)
	local uDim233 = UDim2.new(0, p551.AbsolutePosition.X + p551.AbsoluteSize.X / 1.5, 0, p551.AbsolutePosition.Y + p551.AbsoluteSize.Y / 1.5)
	local v1178 = effectsServiceNewerCircle(p549, {
		Image = "rbxassetid://5090109153",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim233
	})
	local n2 = p551.ZIndex + 10001
	local uDim234 = UDim2.new(0, p551.AbsoluteSize.X * 1.8, 0, p551.AbsoluteSize.X * 1.8)
	local uDim235 = UDim2.new(0, p551.AbsolutePosition.X + p551.AbsoluteSize.X / 2.8000000000000003, 0, p551.AbsolutePosition.Y + p551.AbsoluteSize.Y / 2.8000000000000003)
	local v1182 = effectsServiceNewerCircle(p549, {
		Image = "rbxassetid://12142198154",
		ZIndex = n2,
		Size = uDim234,
		Position = uDim235
	})
	local n3 = p551.ZIndex + 10000
	local uDim236 = UDim2.new(0, p551.AbsoluteSize.X * 0.5, 0, p551.AbsoluteSize.X * 0.5)
	local uDim237 = UDim2.new(0, p551.AbsolutePosition.X + p551.AbsoluteSize.X / 1.5, 0, p551.AbsolutePosition.Y + p551.AbsoluteSize.Y / 1.5)
	local v1186 = effectsServiceNewerCircle(p549, {
		Image = "rbxassetid://5090165303",
		ZIndex = n3,
		Size = uDim236,
		Position = uDim237
	})
	local n4 = p551.ZIndex + 10000
	local uDim238 = UDim2.new(0, p551.AbsoluteSize.X * 0.5, 0, p551.AbsoluteSize.X * 0.5)
	local uDim239 = UDim2.new(0, p551.AbsolutePosition.X + p551.AbsoluteSize.X / 2.8000000000000003, 0, p551.AbsolutePosition.Y + p551.AbsoluteSize.Y / 2.8000000000000003)
	local v1190 = effectsServiceNewerCircle(p549, {
		Image = "rbxassetid://5090165303",
		ZIndex = n4,
		Size = uDim238,
		Position = uDim239
	})

	audioService.PlaySound("LargePunch")

	local uDim240 = UDim2.new(0, p551.AbsoluteSize.X * 3.2, 0, p551.AbsoluteSize.X * 3.2)

	v1178:TweenSize(uDim240, "Out", "Quad", 0.1, true)
	effectsServiceWaitX(0.15)

	local uDim241 = UDim2.new(0, p551.AbsoluteSize.X / 1.2, 0, p551.AbsoluteSize.X / 1.2)

	v1178:TweenSize(uDim241, "In", "Quad", 0.05, true)
	effectsServiceWaitX(0.05)
	effectsService.ShakeBattle(p549, 0.1, 0.025)

	local uDim242 = UDim2.new(0, p551.AbsoluteSize.X * 1, 0, p551.AbsoluteSize.X * 1)

	v1186:TweenSize(uDim242, "Out", "Quad", 0.05, true)
	spawn(function()
		effectsService.Shake(p550, p550.Position, 0.24, 0.1)
	end)
	spawn(function()
		effectsService.Shake(p551, p551.Position, 0.24, 0.3)
	end)
	spawn(function()
		effectsService.Shake(v1186, v1186.Position, 0.24, 0.3)
	end)
	spawn(function()
		effectsService.Shake(v1178, v1178.Position, 0.24, 0.3)
	end)
	spawn(function()
		wait(0.6400000000000001)
		effectsService.TweenProperty(v1178, "ImageTransparency", 0, 1, 0.16000000000000003)
		v1178:Destroy()
	end)
	spawn(function()
		wait(0.6400000000000001)
		effectsService.TweenProperty(v1186, "ImageTransparency", 0, 1, 0.12)
		v1186:Destroy()
	end)
	audioService.PlaySound("LargePunch")

	local uDim243 = UDim2.new(0, p551.AbsoluteSize.X * 3.2, 0, p551.AbsoluteSize.X * 3.2)

	v1182:TweenSize(uDim243, "Out", "Quad", 0.1, true)
	effectsServiceWaitX(0.15)

	local uDim244 = UDim2.new(0, p551.AbsoluteSize.X / 1.5, 0, p551.AbsoluteSize.X / 1.5)

	v1182:TweenSize(uDim244, "In", "Quad", 0.05, true)
	effectsServiceWaitX(0.05)

	local uDim245 = UDim2.new(0, p551.AbsoluteSize.X * 1, 0, p551.AbsoluteSize.X * 1)

	v1190:TweenSize(uDim245, "Out", "Quad", 0.05, true)
	spawn(function()
		effectsService.Shake(p551, p551.Position, 0.24, 0.3)
	end)
	spawn(function()
		effectsService.Shake(v1190, v1190.Position, 0.24, 0.3)
	end)
	spawn(function()
		effectsService.Shake(v1182, v1182.Position, 0.24, 0.3)
	end)
	spawn(function()
		wait(0.48)
		effectsService.TweenProperty(v1182, "ImageTransparency", 0, 1, 0.16000000000000003)
		v1182:Destroy()
	end)
	spawn(function()
		wait(0.48)
		effectsService.TweenProperty(v1190, "ImageTransparency", 0, 1, 0.12)
		v1190:Destroy()
	end)
	wait(0.3)
end
function module.LargeJabEffect(p552, p553, p554, _)
	module.LargeJab(p552, p553, p554, nil, nil)
end
local function PierceDownward(p556, _, p558, _, p560, p561, p562, p563, p564, p565, _, p567, p568)
	local n1 = p558.ZIndex + 10000
	local v1215 = uDim2New(0, p558.AbsoluteSize.X * p562, 0, p558.AbsoluteSize.X * p562)
	local uDim2 = UDim2.new(0, p558.AbsolutePosition.X, 0, p558.AbsolutePosition.Y)
	local uDim246 = UDim2.new(0, p558.AbsoluteSize.X * 0.5, 0, p558.AbsoluteSize.Y * 0.5)
	local v1218 = UDim2.fromOffset(p558.AbsoluteSize.X / 2, 0)
	local parent = effectsServiceNewerCircle(p556, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = -45,
		ClipsDescendants = true,
		ZIndex = n1,
		Image = p561,
		Size = v1215,
		Position = uDim2 + uDim246 - v1218
	})
	local n2 = p558.ZIndex + 100000
	local v1221 = UDim2.fromScale(1, 1)
	local v1222 = UDim2.fromScale(0, 0)
	local v1223 = effectsServiceNewCircle(p556, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = n2,
		Image = p561,
		Size = v1221,
		Position = v1222,
		Parent = parent
	})
	local animationAnimate = animation.Animate
	local v1225 = parent.Position
	local v1226 = UDim2.fromOffset(p558.AbsoluteSize.X / p567, 0)

	animationAnimate(parent, { Rotation = 20, Position = v1225 - v1226 }, 0.35 * p560, "Out", "Quint")
	animation.AnimateAsync(parent, { Rotation = 0 }, 0.01, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync

	v1218 = UDim2.fromScale(0.6, 0)
	animationAnimateAsync(v1223, { Rotation = 0, Position = v1218 }, 0.125, "In", "Quint")

	local animate = animation.Animate

	v1225 = parent.Position
	v1226 = UDim2.fromOffset(p558.AbsoluteSize.X / 1.5, 0)
	animate(parent, { Rotation = 0, Position = v1225 + v1226 }, 0.125, "In", "Quint")

	if p560 == 1 then
		audioServicePlaySound(p564)
	else
		audioServicePlaySound(p563)
	end

	local animateAsync = animation.AnimateAsync

	v1225 = p558.Position
	v1226 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560, 0)
	animateAsync(p558, { Position = v1225 + v1226 }, 0.2 * p560, "Out", "Quint")

	local v1230 = animation.Animate

	v1225 = parent.Position
	v1226 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560, 0)
	v1230(parent, { Position = v1225 + v1226 }, 0.2 * p560, "Out", "Quint")

	local v1231 = animation.AnimateAsync

	v1225 = p558.Position
	v1226 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560, 0)
	v1231(p558, { Position = v1225 - v1226 }, 0.3 * p560, "Out", "Quart")

	local v1232 = animation.AnimateAsync

	v1218 = UDim2.fromScale(0.65, 0)
	v1232(v1223, { Rotation = 0, Position = v1218 }, 0.5, "In", "Quad")

	if p560 == 1 then
		local v1233 = animation.AnimateAsync
		local v1234 = parent.Position
		local v1235 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 4)
		local v1236 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560)

		v1233(parent, { Position = v1234 - v1235 - v1236 }, 0.4 * p568, "InOut", "Quart")

		local v1237 = animation.Animate

		v1236 = p558.Position
		v1235 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 4)
		v1234 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560)
		v1237(p558, { Position = v1236 - v1235 - v1234 }, 0.4 * p568, "InOut", "Quart")

		local v1238 = animation.AnimateAsync
		local v1239 = parent.Position

		v1236 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 2)
		v1238(parent, { Position = v1239 + v1236 }, 0.04 * p568, "In", "Quart")

		local v1240 = animation.Animate

		v1239 = p558.Position
		v1236 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 2)
		v1240(p558, { Position = v1239 + v1236 }, 0.05 * p568, "In", "Quart")

		local v1241 = p558.Position
		local v1242 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 4)

		p558.Position = v1241 + v1242
		v1242 = p558.Position

		local v1243 = UDim2.fromOffset(0, p558.AbsoluteSize.Y / 2)

		effectsService.ShakeSync(p558, v1242 - v1243, 0.2, 0.1)
		audioServicePlaySound(p565)

		local v1244 = animation.Animate

		v1236 = parent.Position
		v1235 = UDim2.fromOffset(parent.AbsoluteSize.X / 8, 0)
		v1244(parent, { Rotation = 70, Position = v1236 - v1235 }, 0.3 * p568, "Out", "Quart")
	else
		local v1245 = animation.Animate
		local parentPosition = parent.Position
		local v1247 = UDim2.fromOffset(p558.AbsoluteSize.X / 2 * p560, 0)

		v1245(parent, { Position = parentPosition - v1247 }, 0.3 * p560, "Out", "Quart")
	end

	task.spawn(function()
		animation.Animate(v1223, { ImageTransparency = 1 }, 0.3 * p560, "In", "Quint")
		parent:Destroy()
	end)
end
function module.LargeBritish(p569, p570, p571, p572)
	PierceDownward(p569, p570, p571, p572, 1, "rbxassetid://12412773360", 1.3, "MidSlash", "knife wound", "knife wound 2", -80, 1.3, 1)
end
function module.LargeBritishEffect(p573, p574, p575, _)
	module.LargeBritish(p573, p574, p575, nil, nil)
end
function module.MidBritish(p577, p578, p579, p580)
	PierceDownward(p577, p578, p579, p580, 0.7, "rbxassetid://12412773360", 1.3, "MidSlash", "knife wound", "knife wound 2", -80, 1.3, 1)
end
function module.MidBritishEffect(p581, p582, p583, _)
	module.MidBritish(p581, p582, p583, nil, nil)
end
function module.MidBritishEnemyHandSingle(p585, p586, p587, p588)
	local s1
	local s2

	if p588 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p588 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1270 = p585.Parent.BattleNew["Virtual" .. s1 .. "Hand"]

	v1270 = p585.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	spawn(function()
		module.MidBritish(p585, p586, p587, nil, nil)
	end)
end
function module.SmallBritish(p589, p590, p591, p592)
	PierceDownward(p589, p590, p591, p592, 0.5, "rbxassetid://12412773360", 1.3, "MidSlash", "knife wound", "knife wound 2", -80, 1.3, 1)
end
function module.SmallKnife(p593, _, p595, _)
	local n1 = p595.ZIndex + 10000
	local v1280 = uDim2New(0, p595.AbsoluteSize.X * 1.25, 0, p595.AbsoluteSize.X * 1.25)
	local uDim2 = UDim2.new(0, p595.AbsolutePosition.X, 0, p595.AbsolutePosition.Y)
	local uDim247 = UDim2.new(0, p595.AbsoluteSize.X * 0.5, 0, p595.AbsoluteSize.Y * 0.5)
	local v1283 = effectsServiceNewerCircle(p593, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://5092736874",
		Rotation = 90,
		ZIndex = n1,
		Size = v1280,
		Position = uDim2 + uDim247
	})
	local v1284 = v1283.Position
	local v1285 = v1283.Position

	v1280 = UDim2.fromOffset(v1283.AbsoluteSize.X / 4, v1283.AbsoluteSize.X / 4)
	v1283.Position = v1285 - v1280

	local n2 = p595.ZIndex + 10000
	local v1287 = uDim2New(0, p595.AbsoluteSize.X / 1.1, 0, p595.AbsoluteSize.X / 1.1)

	v1284 = effectsServiceNewerCircle(p593, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12187818640",
		Rotation = -45,
		ZIndex = n2,
		Size = v1287,
		Position = v1283.Position
	})
	audioServicePlaySound("dbzswordout")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("KnifeSwing")
	animation.AnimateAsync(v1284, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v1284, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v1289 = v1283.Position
	local v1290 = UDim2.fromOffset(v1283.AbsoluteSize.X / 4, v1283.AbsoluteSize.X / 4)

	animationAnimate(v1284, { Position = v1289 - v1290 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v1284, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v1289 = v1283.Position
	v1290 = UDim2.fromOffset(v1283.AbsoluteSize.X / 6, v1283.AbsoluteSize.X / 6)
	animate(v1284, { Position = v1289 - v1290 }, 0.1, "In", "Quad")
	v1284:Destroy()
	audioServicePlaySound("SmallSlash")
	v1284 = p595.Position
	v1285 = p595.Position
	v1280 = UDim2.fromOffset(p595.AbsoluteSize.X / 5, p595.AbsoluteSize.X / 5)
	p595.Position = v1285 + v1280
	animation.AnimateAsync(p595, { Position = v1284 }, 0.4, "Out", "Quart")
	v1283.ImageTransparency = 0
	v1284 = v1283.Position
	v1285 = v1283.Position
	v1280 = UDim2.fromOffset(v1283.AbsoluteSize.X / 30, v1283.AbsoluteSize.X / 30)
	v1283.Position = v1285 - v1280

	local animationAnimateAsync = animation.AnimateAsync

	v1289 = UDim2.fromOffset(v1283.AbsoluteSize.X / 6, v1283.AbsoluteSize.X / 6)
	animationAnimateAsync(v1283, { Position = v1284 + v1289 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v1283, { ImageTransparency = 1 }, 0.4, "Out", "Quad")
		v1283:Destroy()
	end)
	wait(0.2)
end
function module.MidKnife(p597, _, p599, _)
	local n1 = p599.ZIndex + 10000
	local v1298 = uDim2New(0, p599.AbsoluteSize.X * 1.5, 0, p599.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p599.AbsolutePosition.X, 0, p599.AbsolutePosition.Y)
	local uDim248 = UDim2.new(0, p599.AbsoluteSize.X * 0.5, 0, p599.AbsoluteSize.Y * 0.5)
	local v1301 = effectsServiceNewerCircle(p597, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://5092736874",
		Rotation = 90,
		ZIndex = n1,
		Size = v1298,
		Position = uDim2 + uDim248
	})
	local v1302 = v1301.Position
	local v1303 = v1301.Position

	v1298 = UDim2.fromOffset(v1301.AbsoluteSize.X / 5, v1301.AbsoluteSize.X / 5)
	v1301.Position = v1303 - v1298

	local n2 = p599.ZIndex + 10000
	local v1305 = uDim2New(0, p599.AbsoluteSize.X, 0, p599.AbsoluteSize.X)

	v1302 = effectsServiceNewerCircle(p597, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12187818640",
		Rotation = -45,
		ZIndex = n2,
		Size = v1305,
		Position = v1301.Position
	})
	audioServicePlaySound("dbzswordout")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("KnifeSwing")
	animation.AnimateAsync(v1302, { ImageTransparency = 0 }, 0.075, "Out", "Quart")
	animation.AnimateAsync(v1302, { Rotation = -10 }, 0.3, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v1307 = v1301.Position
	local v1308 = UDim2.fromOffset(v1301.AbsoluteSize.X / 4, v1301.AbsoluteSize.X / 4)

	animationAnimate(v1302, { Position = v1307 - v1308 }, 0.3, "Out", "Quart")
	animation.AnimateAsync(v1302, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v1307 = v1301.Position
	v1308 = UDim2.fromOffset(v1301.AbsoluteSize.X / 5, v1301.AbsoluteSize.X / 5)
	animate(v1302, { Position = v1307 - v1308 }, 0.15, "In", "Quad")
	v1302:Destroy()
	audioServicePlaySound("MidSlash")
	v1302 = p599.Position
	v1303 = p599.Position
	v1298 = UDim2.fromOffset(p599.AbsoluteSize.X / 5.5, p599.AbsoluteSize.X / 5.5)
	p599.Position = v1303 + v1298
	animation.AnimateAsync(p599, { Position = v1302 }, 0.75, "Out", "Quart")
	v1301.ImageTransparency = 0
	v1302 = v1301.Position
	v1303 = v1301.Position
	v1298 = UDim2.fromOffset(v1301.AbsoluteSize.X / 30, v1301.AbsoluteSize.X / 30)
	v1301.Position = v1303 - v1298

	local animationAnimateAsync = animation.AnimateAsync

	v1307 = UDim2.fromOffset(v1301.AbsoluteSize.X / 6, v1301.AbsoluteSize.X / 6)
	animationAnimateAsync(v1301, { Position = v1302 + v1307 }, 0.15, "Out", "Quint")
	effectsServiceWaitX(0.3)
	task.spawn(function()
		animation.Animate(v1301, { ImageTransparency = 1 }, 0.4, "Out", "Quad")
		v1301:Destroy()
	end)
	wait(0.3)
end
function module.MidKnifeEffect(p601, p602, p603, _)
	module.MidKnife(p601, p602, p603, nil, nil)
end
function module.MidKnifeEffectAll(p605, p606, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p605.Parent.BattleNew[v])) do
			spawn(function()
				module.MidKnife(p605, p606, iterValue, nil, nil)
			end)
		end
	end
end
function module.LargeKnife(p609, _, p611, _)
	local n1 = p611.ZIndex + 10000
	local v1328 = uDim2New(0, p611.AbsoluteSize.X * 1.75, 0, p611.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p611.AbsolutePosition.X, 0, p611.AbsolutePosition.Y)
	local uDim249 = UDim2.new(0, p611.AbsoluteSize.X * 0.5, 0, p611.AbsoluteSize.Y * 0.5)
	local v1331 = effectsServiceNewerCircle(p609, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://5092736874",
		Rotation = 90,
		ZIndex = n1,
		Size = v1328,
		Position = uDim2 + uDim249
	})
	local v1332 = v1331.Position
	local v1333 = v1331.Position

	v1328 = UDim2.fromOffset(v1331.AbsoluteSize.X / 4, v1331.AbsoluteSize.X / 4)
	v1331.Position = v1333 - v1328

	local n2 = p611.ZIndex + 10000
	local v1335 = uDim2New(0, p611.AbsoluteSize.X * 1.15, 0, p611.AbsoluteSize.X * 1.15)

	v1332 = effectsServiceNewerCircle(p609, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12187818640",
		Rotation = -45,
		ZIndex = n2,
		Size = v1335,
		Position = v1331.Position
	})
	audioServicePlaySound("dbzswordout")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("KnifeSwing")
	animation.AnimateAsync(v1332, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v1332, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v1337 = v1331.Position
	local v1338 = UDim2.fromOffset(v1331.AbsoluteSize.X / 3, v1331.AbsoluteSize.X / 3)

	animationAnimate(v1332, { Position = v1337 - v1338 }, 0.35, "Out", "Quart")
	animation.AnimateAsync(v1332, { Rotation = -45 }, 0.2, "In", "Quint")

	local animate = animation.Animate

	v1337 = v1331.Position
	v1338 = UDim2.fromOffset(v1331.AbsoluteSize.X / 3, v1331.AbsoluteSize.X / 3)
	animate(v1332, { Position = v1337 - v1338 }, 0.2, "In", "Quad")
	v1332:Destroy()
	effectsService.ShakeBattleSync(p609, 0.5, 0.025)
	audioServicePlaySound("LargeSlash")
	v1332 = p611.Position
	v1333 = p611.Position
	v1328 = UDim2.fromOffset(p611.AbsoluteSize.X / 4, p611.AbsoluteSize.X / 4)
	p611.Position = v1333 + v1328
	animation.AnimateAsync(p611, { Position = v1332 }, 1.25, "Out", "Quart")
	v1331.ImageTransparency = 0
	v1332 = v1331.Position
	v1333 = v1331.Position
	v1328 = UDim2.fromOffset(v1331.AbsoluteSize.X / 8, v1331.AbsoluteSize.X / 8)
	v1331.Position = v1333 - v1328

	local animationAnimateAsync = animation.AnimateAsync

	v1337 = UDim2.fromOffset(v1331.AbsoluteSize.X / 5, v1331.AbsoluteSize.X / 5)
	animationAnimateAsync(v1331, { Position = v1332 + v1337 }, 0.2, "Out", "Quint")
	effectsServiceWaitX(0.45)
	task.spawn(function()
		animation.Animate(v1331, { ImageTransparency = 1 }, 0.5, "Out", "Quad")
		v1331:Destroy()
	end)
	wait(0.4)
end
function module.KunaiThrow(p613, p614, p615, _)
	effectsServicePreloadTech(p613, { "rbxassetid://8660622019" })

	local t30: {[any]: any} = {
		Time = 0.2,
		Size = UDim2.fromOffset(p615.AbsoluteSize.X / 1.4, p615.AbsoluteSize.Y / 1.5),
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://8660622019",
		Variation = 20
	}

	for i = 1, 2 do
		audioServicePlaySound("attackquiet")

		local u1347 = nil

		spawn(function()
			u1347 = effectsServiceThrow(p613, p614, p615, t30)
		end)
		spawn(function()
			wait(0.2)
			audioServicePlaySound("arrowcut")

			if i == 1 then
				spawn(function()
					effectsService.Shake(p615, p615.Position, 0.3, 0.1)
				end)
			end

			animation.Animate(u1347, { ImageTransparency = 1 }, 1, "Out", "Quint")
			u1347:Destroy()
		end)
		wait(0.1)
	end

	wait(0.1)
end
function module.EngulfFireLarge(p617, p618, p619, p620)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3306 = Color3.fromRGB(240, 99, 43)
	local color3307 = Color3.fromRGB(217, 66, 39)
	local color3308 = Color3.fromRGB(240, 191, 65)
	local color3309 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p617, p618, p619, p620, 150, effectsServiceBreathimagesFire, "FireBreathLong", 0.8, color3306, color3307, color3308, color3309, 1.1, 0.9)
end
function module.EngulfFire(p621, p622, p623, p624)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3310 = Color3.fromRGB(240, 99, 43)
	local color3311 = Color3.fromRGB(217, 66, 39)
	local color3312 = Color3.fromRGB(240, 191, 65)
	local color3313 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p621, p622, p623, p624, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3310, color3311, color3312, color3313, 1.1, 0.9)
end
function module.EngulfFireSmall(p625, p626, p627, p628)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3314 = Color3.fromRGB(240, 99, 43)
	local color3315 = Color3.fromRGB(217, 66, 39)
	local color3316 = Color3.fromRGB(240, 191, 65)
	local color3317 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathEngulf(p625, p626, p627, p628, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3314, color3315, color3316, color3317, 1.1, 0.9)
end
function module.EngulfFlare(p629, p630, p631, p632)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3318 = Color3.fromRGB(240, 55, 30)
	local color3319 = Color3.fromRGB(166, 28, 26)
	local color3320 = Color3.fromRGB(240, 32, 13)
	local color3321 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathEngulf(p629, p630, p631, p632, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3318, color3319, color3320, color3321, 1.1, 0.9)
end
function module.EngulfFlareSmall(p633, p634, p635, p636)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3322 = Color3.fromRGB(240, 55, 30)
	local color3323 = Color3.fromRGB(166, 28, 26)
	local color3324 = Color3.fromRGB(240, 32, 13)
	local color3325 = Color3.fromRGB(189, 10, 10)

	effectsServiceBreathEngulf(p633, p634, p635, p636, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3322, color3323, color3324, color3325, 1.1, 0.9)
end
function module.EngulfFlame(p637, p638, p639, p640)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3326 = Color3.fromRGB(24, 174, 204)
	local color3327 = Color3.fromRGB(8, 72, 150)
	local color3328 = Color3.fromRGB(30, 91, 234)
	local color3329 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathEngulf(p637, p638, p639, p640, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3326, color3327, color3328, color3329, 1.1, 0.9)
end
function module.EngulfFlameSmall(p641, p642, p643, p644)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3330 = Color3.fromRGB(24, 174, 204)
	local color3331 = Color3.fromRGB(8, 72, 150)
	local color3332 = Color3.fromRGB(30, 91, 234)
	local color3333 = Color3.fromRGB(4, 18, 171)

	effectsServiceBreathEngulf(p641, p642, p643, p644, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3330, color3331, color3332, color3333, 1.1, 0.9)
end
function module.EngulfBlaze(p645, p646, p647, p648)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3334 = Color3.fromRGB(204, 198, 33)
	local color3335 = Color3.fromRGB(220, 189, 15)
	local color3336 = Color3.fromRGB(255, 255, 43)
	local color3337 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathEngulf(p645, p646, p647, p648, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3334, color3335, color3336, color3337, 1.1, 0.9)
end
function module.EngulfBlazeSmall(p649, p650, p651, p652)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3338 = Color3.fromRGB(204, 198, 33)
	local color3339 = Color3.fromRGB(220, 189, 15)
	local color3340 = Color3.fromRGB(255, 255, 43)
	local color3341 = Color3.fromRGB(176, 127, 14)

	effectsServiceBreathEngulf(p649, p650, p651, p652, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3338, color3339, color3340, color3341, 1.1, 0.9)
end
function module.EngulfScorch(p653, p654, p655, p656)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3342 = Color3.fromRGB(34, 240, 30)
	local color3343 = Color3.fromRGB(32, 180, 37)
	local color3344 = Color3.fromRGB(56, 184, 97)
	local color3345 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathEngulf(p653, p654, p655, p656, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3342, color3343, color3344, color3345, 1.1, 0.9)
end
function module.EngulfScorchSmall(p657, p658, p659, p660)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3346 = Color3.fromRGB(34, 240, 30)
	local color3347 = Color3.fromRGB(32, 180, 37)
	local color3348 = Color3.fromRGB(56, 184, 97)
	local color3349 = Color3.fromRGB(13, 111, 40)

	effectsServiceBreathEngulf(p657, p658, p659, p660, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3346, color3347, color3348, color3349, 1.1, 0.9)
end
function module.EngulfInferno(p661, p662, p663, p664)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3350 = Color3.fromRGB(163, 35, 206)
	local color3351 = Color3.fromRGB(144, 0, 180)
	local color3352 = Color3.fromRGB(240, 80, 224)
	local color3353 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathEngulf(p661, p662, p663, p664, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3350, color3351, color3352, color3353, 1.1, 0.9)
end
function module.EngulfInfernoSmall(p665, p666, p667, p668)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3354 = Color3.fromRGB(163, 35, 206)
	local color3355 = Color3.fromRGB(144, 0, 180)
	local color3356 = Color3.fromRGB(240, 80, 224)
	local color3357 = Color3.fromRGB(126, 19, 122)

	effectsServiceBreathEngulf(p665, p666, p667, p668, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3354, color3355, color3356, color3357, 1.1, 0.9)
end
function module.EngulfIce(p669, p670, p671, p672)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3358 = Color3.fromRGB(167, 255, 245)
	local color3359 = Color3.fromRGB(125, 199, 255)
	local color3360 = Color3.fromRGB(161, 199, 240)
	local color3361 = Color3.fromRGB(108, 197, 239)

	effectsServiceBreathEngulf(p669, p670, p671, p672, 100, effectsServiceBreathimagesIce, "IceBreath", 0.6, color3358, color3359, color3360, color3361, 1.2, 0.9)
end
function module.EngulfIceSmall(p673, p674, p675, p676)
	local effectsServiceBreathimagesIce = effectsServiceBreathimages.ice
	local color3362 = Color3.fromRGB(167, 255, 245)
	local color3363 = Color3.fromRGB(125, 199, 255)
	local color3364 = Color3.fromRGB(161, 199, 240)
	local color3365 = Color3.fromRGB(108, 197, 239)

	effectsServiceBreathEngulf(p673, p674, p675, p676, 50, effectsServiceBreathimagesIce, "IceBreath", 0.5, color3362, color3363, color3364, color3365, 1.2, 0.9)
end
function module.EngulfIceEnemy(p677, _, p679, p680)
	local s1

	if p680 == "" then
		s1 = "Enemy"
	elseif p680 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, _ in pairs(_G.__NoFaces(p677.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.EngulfIce(p677, p679, p679, nil, nil)
		end)
	end
end
function module.EngulfAcid(p681, p682, p683, p684)
	local color3366 = Color3.fromRGB(197, 0, 0)
	local color3367 = Color3.fromRGB(177, 0, 0)
	local color3368 = Color3.fromRGB(211, 9, 2)
	local color3369 = Color3.fromRGB(182, 0, 0)

	effectsServiceBreathEngulf(p681, p682, p683, p684, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3366, color3367, color3368, color3369, 0.7, 0.6)
end
function module.EngulfSwamp(p685, p686, p687, p688)
	local color3370 = Color3.fromRGB(78, 171, 86)
	local color3371 = Color3.fromRGB(46, 131, 56)
	local color3372 = Color3.fromRGB(59, 168, 59)
	local color3373 = Color3.fromRGB(7, 106, 0)

	effectsServiceBreathEngulf(p685, p686, p687, p688, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3370, color3371, color3372, color3373, 0.7, 0.6)
end
function module.EngulfBubbles(p689, p690, p691, p692)
	local color3374 = Color3.fromRGB(105, 204, 240)
	local color3375 = Color3.fromRGB(137, 234, 253)
	local color3376 = Color3.fromRGB(139, 178, 202)
	local color3377 = Color3.fromRGB(51, 138, 188)

	effectsServiceBreathEngulf(p689, p690, p691, p692, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3374, color3375, color3376, color3377, 0.7, 0.6)
end
function module.EngulfGoo(p693, p694, p695, p696)
	local color3378 = Color3.fromRGB(169, 85, 197)
	local color3379 = Color3.fromRGB(125, 72, 182)
	local color3380 = Color3.fromRGB(139, 58, 197)
	local color3381 = Color3.fromRGB(115, 0, 172)

	effectsServiceBreathEngulf(p693, p694, p695, p696, 125, "rbxassetid://1249690853", "Bubbling2", 0.6, color3378, color3379, color3380, color3381, 0.7, 0.6)
end
local function Rocket(p697, p698, p699, p700, p701, p702)
	effectsServicePreloadTech(p697, { "rbxassetid://12769454704" })

	if not p702 then
		p702 = Color3.fromRGB(255, 255, 255)
	end

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t31: {[any]: any} = { Color3.fromRGB(190, 190, 190), Color3.fromRGB(134, 134, 134) }
	local v1531 = UDim2.fromOffset(p698.AbsoluteSize.Y / 4 * p701, p698.AbsoluteSize.Y / 4 * p701)
	local n1 = p698.ZIndex - 10
	local v1533 = UDim2.fromOffset(p699.AbsoluteSize.X / 1 * p701, p699.AbsoluteSize.Y / 1.5 * p701)
	local v1534 = UDim2.fromOffset(p698.AbsoluteSize.Y / 3 * p701, p698.AbsoluteSize.Y / 5 * p701)
	local uDim2 = UDim2.new(0, p698.AbsolutePosition.X, 0, p698.AbsolutePosition.Y)
	local uDim250 = UDim2.new(0, p698.AbsoluteSize.X * 0.5, 0, p698.AbsoluteSize.Y * 0.5)
	local v1537 = effectsServiceNewerCircle(p697, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12769454704",
		ZIndex = 1,
		ImageColor3 = p702,
		Size = v1534,
		Position = uDim2 + uDim250
	})

	wait(0.1)

	local tweenInfo = TweenInfo.new(0.44 * p701)
	local uDim251 = UDim2.new(0, p699.AbsolutePosition.X, 0, p699.AbsolutePosition.Y)
	local uDim252 = UDim2.new(0, p699.AbsoluteSize.X * 0.5, 0, p699.AbsoluteSize.Y * 0.5)

	tweenService:Create(v1537, tweenInfo, { Position = uDim251 + uDim252 }):Play()
	effectsServiceBreath(p697, v1537, p698, {
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t31,
		Size = v1531,
		Strength = 55 * p701,
		ZIndex = n1,
		Time = 0.45 * p701
	})

	local v1541 = effectsServiceThrow(p697, p698, p699, {
		Time = 0.45 * p701,
		Size = v1533,
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://12769454704",
		Color = p702
	})

	audioService.PlaySound("collide.wav")
	effectsService.ShakeBattleSync(p697, 0.3, 0.04)
	v1541:Destroy()
	v1537:Destroy()

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3382 = Color3.fromRGB(240, 99, 43)
	local color3383 = Color3.fromRGB(217, 66, 39)
	local color3384 = Color3.fromRGB(240, 191, 65)
	local color3385 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathAttack(p697, p699, p699, p700, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3382, color3383, color3384, color3385, 1.1, 0.9)
	wait(0.2 * p701)
end
function module.LargeModernRocket(p703, p704, p705, p706, _)
	audioServicePlaySound("Launch")
	Rocket(p703, p704, p705, p706, 1.25)
end
function module.LargeModernRocketEffect(p708, p709, p710, _)
	module.LargeModernRocket(p708, p709, p710, nil, nil)
end
function module.MidModernRocket(p712, p713, p714, p715, _)
	audioServicePlaySound("Launch")
	Rocket(p712, p713, p714, p715, 1)
end
function module.MidModernRocketEffect(p717, p718, p719, _)
	module.MidModernRocket(p717, p718, p719, nil, nil)
end
function module.SmallModernRocket(p721, p722, p723, p724, _)
	audioServicePlaySound("Launch")
	Rocket(p721, p722, p723, p724, 0.8)
end
local function RocketEnemy(p726, p727, p728, p729, p730, p731)
	effectsServicePreloadTech(p726, { "rbxassetid://12769454704" })

	local s1
	local s2

	if p729 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p729 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v1578 = p726.Parent.BattleNew["Virtual" .. s1 .. "Field"]

	v1578 = p726.Parent.BattleNew["Virtual" .. s2 .. "Field"]

	if not p731 then
		p731 = Color3.fromRGB(255, 255, 255)
	end

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t32: {[any]: any} = { Color3.fromRGB(190, 190, 190), Color3.fromRGB(134, 134, 134) }
	local v1581 = UDim2.fromOffset(p727.AbsoluteSize.Y / 4 * p730, p727.AbsoluteSize.Y / 4 * p730)
	local n1 = p727.ZIndex - 10
	local v1583 = UDim2.fromOffset(p728.AbsoluteSize.X / 1 * p730, p728.AbsoluteSize.Y / 1.5 * p730)
	local v1584 = UDim2.fromOffset(p727.AbsoluteSize.Y / 3 * p730, p727.AbsoluteSize.Y / 5 * p730)
	local uDim2 = UDim2.new(0, p727.AbsolutePosition.X, 0, p727.AbsolutePosition.Y)
	local uDim253 = UDim2.new(0, p727.AbsoluteSize.X * 0.5, 0, p727.AbsoluteSize.Y * 0.5)
	local v1587 = effectsServiceNewerCircle(p726, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12769454704",
		ZIndex = 1,
		ImageColor3 = p731,
		Size = v1584,
		Position = uDim2 + uDim253
	})

	wait(0.1)

	local tweenInfo = TweenInfo.new(0.44 * p730)
	local uDim254 = UDim2.new(0, p728.AbsolutePosition.X, 0, p728.AbsolutePosition.Y)
	local uDim255 = UDim2.new(0, p728.AbsoluteSize.X * 0.5, 0, p728.AbsoluteSize.Y * 0.5)

	tweenService:Create(v1587, tweenInfo, { Position = uDim254 + uDim255 }):Play()
	effectsServiceBreath(p726, v1587, p727, {
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t32,
		Size = v1581,
		Strength = 55 * p730,
		ZIndex = n1,
		Time = 0.45 * p730
	})
	v1578 = effectsServiceThrow(p726, p727, p728, {
		Time = 0.45 * p730,
		Size = v1583,
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://12769454704",
		Color = p731
	})
	audioService.PlaySound("collide.wav")
	effectsService.ShakeBattleSync(p726, 0.3, 0.04)
	v1578:Destroy()
	v1587:Destroy()

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3386 = Color3.fromRGB(240, 99, 43)
	local color3387 = Color3.fromRGB(217, 66, 39)
	local color3388 = Color3.fromRGB(240, 191, 65)
	local color3389 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathAttack(p726, p728, p728, p729, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3386, color3387, color3388, color3389, 1.1, 0.9)
	wait(0.2 * p730)
end
local function RetroRocket(p732, p733, p734, p735, p736, p737)
	effectsServicePreloadTech(p732, { "rbxassetid://12769452974" })

	if not p737 then
		p737 = Color3.fromRGB(51, 143, 255)
	end

	local effectsServiceBreathimagesSmog = effectsServiceBreathimages.smog
	local t33: {[any]: any} = { Color3.fromRGB(165, 165, 165), Color3.fromRGB(148, 148, 148) }
	local v1604 = UDim2.fromOffset(p733.AbsoluteSize.Y / 5 * p736, p733.AbsoluteSize.Y / 5 * p736)
	local n1 = p733.ZIndex - 10
	local v1606 = UDim2.fromOffset(p734.AbsoluteSize.X / 0.7 * p736, p734.AbsoluteSize.Y / 1 * p736)
	local v1607 = UDim2.fromOffset(p733.AbsoluteSize.Y / 2.1 * p736, p733.AbsoluteSize.Y / 5 * p736)
	local uDim2 = UDim2.new(0, p733.AbsolutePosition.X, 0, p733.AbsolutePosition.Y)
	local uDim256 = UDim2.new(0, p733.AbsoluteSize.X * 0.5, 0, p733.AbsoluteSize.Y * 0.5)
	local v1610 = effectsServiceNewerCircle(p732, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12769452974",
		ZIndex = 1,
		ImageColor3 = p737,
		Size = v1607,
		Position = uDim2 + uDim256
	})

	wait(0.1)

	local tweenInfo = TweenInfo.new(0.44 * p736)
	local uDim257 = UDim2.new(0, p734.AbsolutePosition.X, 0, p734.AbsolutePosition.Y)
	local uDim258 = UDim2.new(0, p734.AbsoluteSize.X * 0.5, 0, p734.AbsoluteSize.Y * 0.5)

	tweenService:Create(v1610, tweenInfo, { Position = uDim257 + uDim258 }):Play()
	effectsServiceBreath(p732, v1610, p733, {
		Projectile = effectsServiceBreathimagesSmog,
		Color = t33,
		Size = v1604,
		Strength = 35 * p736,
		ZIndex = n1,
		Time = 0.45 * p736
	})

	local v1614 = effectsServiceThrow(p732, p733, p734, {
		Time = 0.45 * p736,
		Size = v1606,
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://12769452974",
		Color = p737
	})

	audioService.PlaySound("collide.wav")
	effectsService.ShakeBattleSync(p732, 0.3, 0.04)
	v1614:Destroy()
	v1610:Destroy()

	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3390 = Color3.fromRGB(240, 99, 43)
	local color3391 = Color3.fromRGB(217, 66, 39)
	local color3392 = Color3.fromRGB(240, 191, 65)
	local color3393 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathAttack(p732, p734, p734, p735, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3390, color3391, color3392, color3393, 1.1, 0.9)
	wait(0.2 * p736)
end
function module.LargeClassicRocket(p738, p739, p740, p741, _)
	audioServicePlaySound("Rocket whoosh 01.wav")
	RetroRocket(p738, p739, p740, p741, 1.15)
end
function module.MidClassicRocket(p743, p744, p745, p746, _)
	audioServicePlaySound("Rocket whoosh 01.wav")
	RetroRocket(p743, p744, p745, p746, 1)
end
function module.MidClassicRocketEffect(p748, p749, p750, _)
	module.MidClassicRocket(p748, p749, p750, nil, nil)
end
function module.SmallClassicRocket(p752, p753, p754, p755, _)
	audioServicePlaySound("Rocket whoosh 01.wav")
	RetroRocket(p752, p753, p754, p755, 0.8)
end
local function GhostBlast(p757, p758, p759, p760, p761, p762)
	if not p762 then
		p762 = Color3.fromRGB(255, 255, 255)
	end

	local t34: {[any]: any} = { Color3.fromRGB(138, 253, 255), Color3.fromRGB(98, 239, 255) }
	local v1646 = UDim2.fromOffset(p758.AbsoluteSize.Y / 2 * p761, p758.AbsoluteSize.Y / 2 * p761)
	local n1 = p758.ZIndex - 10
	local v1648 = UDim2.fromOffset(p759.AbsoluteSize.X / 0.7 * p761, p759.AbsoluteSize.Y / 1 * p761)
	local v1649 = UDim2.fromOffset(p758.AbsoluteSize.Y / 2.1 * p761, p758.AbsoluteSize.Y / 5 * p761)
	local uDim2 = UDim2.new(0, p758.AbsolutePosition.X, 0, p758.AbsolutePosition.Y)
	local uDim259 = UDim2.new(0, p758.AbsoluteSize.X * 0.5, 0, p758.AbsoluteSize.Y * 0.5)
	local v1652 = effectsServiceNewerCircle(p757, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://13335882143",
		ZIndex = 1,
		ImageColor3 = p762,
		Size = v1649,
		Position = uDim2 + uDim259
	})

	wait(0.1)

	local tweenInfo = TweenInfo.new(0.44 * p761)
	local uDim260 = UDim2.new(0, p759.AbsolutePosition.X, 0, p759.AbsolutePosition.Y)
	local uDim261 = UDim2.new(0, p759.AbsoluteSize.X * 0.5, 0, p759.AbsoluteSize.Y * 0.5)

	tweenService:Create(v1652, tweenInfo, { Position = uDim260 + uDim261 }):Play()
	effectsServiceBreath(p757, v1652, p758, {
		Projectile = "rbxassetid://13335978405",
		ImageTransparency = 0,
		Color = t34,
		Size = v1646,
		Strength = 15 * p761,
		ZIndex = n1,
		Time = 0.45 * p761
	})

	local v1656 = effectsServiceThrow(p757, p758, p759, {
		Time = 0.45 * p761,
		Size = v1648,
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://13335882143",
		ImageTransparency = 0.1,
		Color = p762
	})

	audioService.PlaySound("SoulAttack1")
	effectsService.ShakeBattleSync(p757, 0.3, 0.04)
	v1656:Destroy()
	v1652:Destroy()

	local color3394 = Color3.fromRGB(154, 233, 240)
	local color3395 = Color3.fromRGB(168, 210, 217)
	local color3396 = Color3.fromRGB(9, 217, 240)
	local color3397 = Color3.fromRGB(100, 240, 224)

	effectsServiceBreathAttack(p757, p759, p759, p760, 70, "rbxassetid://13335978405", "Spooky", 0.6, color3394, color3395, color3396, color3397, 1.1, 0.9)
	wait(0.2 * p761)
end
function module.LargeGhost(p763, p764, p765, p766, _)
	audioServicePlaySound("Smite")
	GhostBlast(p763, p764, p765, p766, 1.15)
end
function module.MidGhost(p768, p769, p770, p771, _)
	audioServicePlaySound("Smite2")
	GhostBlast(p768, p769, p770, p771, 1)
end
function module.MidGhostEffect(p773, p774, p775, _)
	module.MidGhostBlast(p773, p774, p775, nil, nil)
end
function module.SmallGhost(p777, p778, p779, p780, _)
	audioServicePlaySound("Smite3")
	GhostBlast(p777, p778, p779, p780, 0.8)
end
function module.LargeBrickThrow(p782, p783, p784, _, p786)
	audioServicePlaySound("Woosh")
	effectsServiceToss(p782, p783, p784, p786, 1)
end
function module.MidBrickThrow(p787, p788, p789, _, p791)
	audioServicePlaySound("Woosh")
	effectsServiceToss(p787, p788, p789, p791, 0.9)
end
function module.MidBrickThrowEffect(p792, p793, p794, _)
	module.MidClassicRocket(p792, p793, p794, nil, nil)
end
function module.SmallBrickThrow(p796, p797, p798, _, p800)
	audioServicePlaySound("Woosh")
	effectsServiceToss(p796, p797, p798, p800, 0.8)
end
function module.LargeRedDodgeball(p801, p802, p803, p804)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p802, p802.Position, 0.2, 0.1)

	local color3398 = Color3.fromRGB(255, 66, 69)

	effectsServiceBouncy(p801, p802, p803, p804, 1, color3398, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.MidRedDodgeball(p805, p806, p807, p808)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p806, p806.Position, 0.2, 0.1)

	local color3399 = Color3.fromRGB(255, 66, 69)

	effectsServiceBouncy(p805, p806, p807, p808, 0.8, color3399, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.SmallRedDodgeball(p809, p810, p811, p812)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p810, p810.Position, 0.2, 0.1)

	local color3400 = Color3.fromRGB(255, 66, 69)

	effectsServiceBouncy(p809, p810, p811, p812, 0.7, color3400, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.RedDodgeballEffect(p813, p814, p815, _)
	task.spawn(function()
		module.MidRedDodgeball(p813, p814, p815, nil, nil)
	end)
	task.wait(0.5)
end
function module.LargeBlueDodgeball(p817, p818, p819, p820)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p818, p818.Position, 0.2, 0.1)

	local color3401 = Color3.fromRGB(53, 124, 255)

	effectsServiceBouncy(p817, p818, p819, p820, 1, color3401, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.MidBlueDodgeball(p821, p822, p823, p824)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p822, p822.Position, 0.2, 0.1)

	local color3402 = Color3.fromRGB(53, 124, 255)

	effectsServiceBouncy(p821, p822, p823, p824, 0.8, color3402, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.SmallBlueDodgeball(p825, p826, p827, p828)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p826, p826.Position, 0.2, 0.1)

	local color3403 = Color3.fromRGB(53, 124, 255)

	effectsServiceBouncy(p825, p826, p827, p828, 0.7, color3403, "rbxassetid://12832420812", "Dodgeball Bounce", 900)
	wait(0.4)
end
function module.BlueDodgeballEffect(p829, p830, p831, _)
	task.spawn(function()
		module.MidBlueDodgeball(p829, p830, p831, nil, nil)
	end)
	task.wait(0.5)
end
function module.LargeMicrophone(p833, p834, p835, p836)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p834, p834.Position, 0.2, 0.1)

	local color3404 = Color3.fromRGB(255, 255, 255)

	effectsServiceBouncy(p833, p834, p835, p836, 1, color3404, "rbxassetid://13516047988", "MicrophoneDrop3", math.random(540, 900))
	wait(0.4)
end
function module.MidMicrophone(p837, p838, p839, p840)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p838, p838.Position, 0.2, 0.1)

	local color3405 = Color3.fromRGB(255, 255, 255)

	effectsServiceBouncy(p837, p838, p839, p840, 0.8, color3405, "rbxassetid://13516047988", "MicrophoneDrop2", math.random(540, 900))
	wait(0.4)
end
function module.SmallMicrophone(p841, p842, p843, p844)
	audioServicePlaySound("Throw")
	effectsService.ShakeSync(p842, p842.Position, 0.2, 0.1)

	local color3406 = Color3.fromRGB(255, 255, 255)

	effectsServiceBouncy(p841, p842, p843, p844, 0.7, color3406, "rbxassetid://13516047988", "MicrophoneDrop1", math.random(540, 900))
	wait(0.4)
end
function module.MicrophoneEffect(p845, p846, p847, _)
	task.spawn(function()
		module.MidMicrophone(p845, p846, p847, nil, nil)
	end)
	task.wait(0.5)
end
function module.LargeRecyclables(p849, p850, p851, p852)
	local t35: {[any]: any} = {
		"rbxassetid://12769450394",
		"rbxassetid://12122823106",
		"rbxassetid://12122823737",
		"rbxassetid://13129792774",
		"rbxassetid://13129673768",
		"rbxassetid://13129796742",
		"rbxassetid://13129798338"
	}

	audioServicePlaySound("Throw")

	local color3407 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(1, #t35)

	effectsServiceBouncy(p849, p850, p851, p852, 1, color3407, t35[randomNumber], "Metal", math.random(540, 900))
	wait(0.4)
end
function module.MidRecyclables(p853, p854, p855, p856)
	local t36: {[any]: any} = { "Bonk", "splat.wav", "bass.wav", "snap.wav" }
	local t37: {[any]: any} = {
		"rbxassetid://12769450394",
		"rbxassetid://12122823106",
		"rbxassetid://12122823737",
		"rbxassetid://13129792774",
		"rbxassetid://13129673768",
		"rbxassetid://13129796742",
		"rbxassetid://13129798338"
	}

	audioServicePlaySound("Throw")

	local color3408 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(1, #t37)
	local v1771 = t37[randomNumber]
	local randomNumber9 = math.random(1, #t36)

	effectsServiceBouncy(p853, p854, p855, p856, 0.8, color3408, v1771, t36[randomNumber9], math.random(540, 900))
	wait(0.4)
end
function module.SmallRecyclables(p857, p858, p859, p860)
	local t38: {[any]: any} = { "Bonk", "splat.wav", "bass.wav", "snap.wav" }
	local t39: {[any]: any} = {
		"rbxassetid://12769450394",
		"rbxassetid://12122823106",
		"rbxassetid://12122823737",
		"rbxassetid://13129792774",
		"rbxassetid://13129673768",
		"rbxassetid://13129796742",
		"rbxassetid://13129798338"
	}

	audioServicePlaySound("Throw")

	local color3409 = Color3.fromRGB(255, 255, 255)
	local randomNumber = math.random(1, #t39)
	local v1781 = t39[randomNumber]
	local randomNumber10 = math.random(1, #t38)

	effectsServiceBouncy(p857, p858, p859, p860, 0.7, color3409, v1781, t38[randomNumber10], math.random(540, 900))
	wait(0.4)
end
function module.RecyclablesEffect(p861, p862, p863, _)
	task.spawn(function()
		module.MidRecyclables(p861, p862, p863, nil, nil)
	end)
	task.wait(0.7)
end
function module.SmallRecyclablesEffectAll(p865, p866, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p865.Parent.BattleNew[v])) do
			spawn(function()
				module.SmallRecyclables(p865, p866, iterValue, nil, nil)
			end)
			task.wait(0.7)
		end
	end
end
function module.SmallRecyclablesEffectEnemy(p869, p870, _, p872)
	local s1

	if p872 == "" then
		s1 = "Enemy"
	elseif p872 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p869.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.SmallRecyclables(p869, p870, v, nil, nil)
		end)
	end
end
function module.LargeSuperball(p873, p874, p875, p876)
	local t40: {[any]: any} = { "Bonk", "splat.wav", "bass.wav", "Ouch", "snap.wav" }
	local timestamp = tick()

	audioServicePlaySound("Short spring sound.wav")
	effectsService.ShakeSync(p874, p874.Position, 0.2, 0.1)

	local color3410 = Color3.fromHSV(timestamp % 5 / 5, 1, 1)
	local randomNumber = math.random(1, #t40)

	effectsServiceBouncy(p873, p874, p875, p876, 1.3, color3410, "rbxassetid://12832419475", t40[randomNumber], math.random(540, 900))
	wait(0.4)
end
function module.MidSuperball(p877, p878, p879, p880)
	local t41: {[any]: any} = { "Bonk", "splat.wav", "bass.wav", "Ouch", "snap.wav" }
	local timestamp = tick()

	audioServicePlaySound("Short spring sound.wav")
	effectsService.ShakeSync(p878, p878.Position, 0.2, 0.1)

	local color3411 = Color3.fromHSV(timestamp % 5 / 5, 1, 1)
	local randomNumber = math.random(1, #t41)

	effectsServiceBouncy(p877, p878, p879, p880, 1.1, color3411, "rbxassetid://12832419475", t41[randomNumber], math.random(540, 900))
	wait(0.4)
end
function module.SmallSuperball(p881, p882, p883, p884)
	local t42: {[any]: any} = { "Bonk", "splat.wav", "bass.wav", "Ouch", "snap.wav" }
	local timestamp = tick()

	audioServicePlaySound("Short spring sound.wav")
	effectsService.ShakeSync(p882, p882.Position, 0.2, 0.1)

	local color3412 = Color3.fromHSV(timestamp % 5 / 5, 1, 1)
	local randomNumber = math.random(1, #t42)

	effectsServiceBouncy(p881, p882, p883, p884, 0.9, color3412, "rbxassetid://12832419475", t42[randomNumber], math.random(540, 900))
	wait(0.4)
end
function module.SuperballEffect(p885, p886, p887, _)
	task.spawn(function()
		module.LargeSuperball(p885, p886, p887, nil, nil)
	end)
	task.wait(0.5)
end
function module.MidSuperballEffectEnemy(p889, p890, target, p892)
	local s1

	if p892 == "" then
		s1 = "Enemy"
	elseif p892 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__SweepTargets(p889.Parent.BattleNew[s1 .. "Field"], target)) do
		spawn(function()
			module.MidSuperball(p889, p890, v, nil, nil)
		end)
		task.wait(0.5)
	end
end
local function Kickball(p893, p894, p895, p896, p897)
	local t43: {[any]: any} = { "Horn1", "Horn2", "Horn3", "Horn4", "Horn5" }

	effectsServicePreloadTech(p893, { "rbxassetid://14388271789" })
	audioServicePlaySound("Kick")

	local animationAnimate = animation.Animate
	local v1846 = UDim2.fromOffset(p894.AbsoluteSize.X * (1 + 0.05 * p897), p894.AbsoluteSize.Y * (1 - 0.08 * p897))

	animationAnimate(p894, { Size = v1846 }, 0.07, "InOut", "Quint")
	task.wait(0.03)

	local animate = animation.Animate

	v1846 = UDim2.fromOffset(p894.AbsoluteSize.X, p894.AbsoluteSize.Y)
	animate(p894, { Size = v1846 }, 0.07, "InOut", "Quint")
	effectsService.ShakeSync(p894, p894.Position, 0.15 + 0.05 * p897, 0.08 * p897)

	local clone = p894:Clone()

	clone.Visible = false
	clone.Parent = p894.Parent
	clone.Position = UDim2.fromOffset(p894.AbsolutePosition.X + p894.AbsoluteSize.X * -0.15, p894.AbsolutePosition.Y + p894.AbsoluteSize.Y * 0.43)

	local randomNumber = math.random(120, 360)
	local color3413 = Color3.fromRGB(255, 255, 255)
	local randomNumber11 = math.random(1, #t43)

	effectsServiceBouncy(p893, clone, p895, p896, p897, color3413, "rbxassetid://14388271789", t43[randomNumber11], randomNumber * p897)
	clone:Destroy()
	task.wait(1 + 0.05 * p897)
end
function module.LargeFutbol(p898, p899, p900, p901)
	Kickball(p898, p899, p900, p901, 1.1)
end
function module.MidFutbol(p902, p903, p904, p905)
	Kickball(p902, p903, p904, p905, 0.9)
end
function module.SmallFutbol(p906, p907, p908, p909)
	Kickball(p906, p907, p908, p909, 0.7)
end
function module.LargeBite(p910, p911, p912, p913)
	effectsServiceBiting(p910, p911, p912, p913, 1, "LargeChomp", Color3.fromRGB(255, 255, 255))
end
function module.LargeBiteEffect(p914, p915, p916, _)
	module.LargeBite(p914, p915, p916, nil, nil)
end
function module.MidBite(p918, p919, p920, p921)
	effectsServiceBiting(p918, p919, p920, p921, 0.7, "Chomp", Color3.fromRGB(255, 255, 255))
end
function module.SmallBite(p922, p923, p924, p925)
	effectsServiceBiting(p922, p923, p924, p925, 0.5, "SmallChomp", Color3.fromRGB(255, 255, 255))
end
function module.SmallBiteEffect(p926, p927, p928, _)
	module.SmallBite(p926, p927, p928, nil, nil)
end
function module.LargeVenomBite(p930, p931, p932, p933)
	effectsServiceBiting(p930, p931, p932, p933, 1, "LargeChomp", Color3.fromRGB(35, 190, 0))
end
function module.LargeVenomBiteEffect(p934, p935, p936, _)
	module.LargeVenomBite(p934, p935, p936, nil, nil)
end
function module.MidVenomBite(p938, p939, p940, p941)
	effectsServiceBiting(p938, p939, p940, p941, 0.7, "Chomp", Color3.fromRGB(35, 190, 0))
end
function module.SmallVenomBite(p942, p943, p944, p945)
	effectsServiceBiting(p942, p943, p944, p945, 0.5, "SmallChomp", Color3.fromRGB(35, 190, 0))
end
function module.SmallVenomBiteEffect(p946, p947, p948, _)
	module.SmallVenomBite(p946, p947, p948, nil, nil)
end
function module.LargeLycanBite(p950, p951, p952, p953)
	effectsServiceBiting(p950, p951, p952, p953, 1, "LargeChomp", Color3.fromRGB(121, 4, 4))
end
function module.MidLycanBite(p954, p955, p956, p957)
	effectsServiceBiting(p954, p955, p956, p957, 0.7, "Chomp", Color3.fromRGB(121, 4, 4))
end
function module.SmallLycanBite(p958, p959, p960, p961)
	effectsServiceBiting(p958, p959, p960, p961, 0.5, "SmallChomp", Color3.fromRGB(121, 4, 4))
end
function module.SmallLycanBiteEffect(p962, p963, p964, _)
	module.SmallLycanBite(p962, p963, p964, nil, nil)
end
function module.LargeVampBite(p966, p967, p968, p969)
	effectsServiceBiting(p966, p967, p968, p969, 1, "LargeChomp", Color3.fromRGB(218, 7, 7))
end
function module.LargeVampBiteEffect(p970, p971, p972, _)
	module.LargeVampBite(p970, p971, p972, nil, nil)
end
function module.MidVampBite(p974, p975, p976, p977)
	effectsServiceBiting(p974, p975, p976, p977, 0.7, "Chomp", Color3.fromRGB(218, 7, 7))
end
function module.SmallVampBite(p978, p979, p980, p981)
	effectsServiceBiting(p978, p979, p980, p981, 0.5, "SmallChomp", Color3.fromRGB(218, 7, 7))
end
function module.SmallVampBiteEffect(p982, p983, p984, _)
	module.SmallVampBite(p982, p983, p984, nil, nil)
end
function module.LargeHauntBite(p986, p987, p988, p989)
	effectsServiceBiting(p986, p987, p988, p989, 1, "LargeChomp", Color3.fromRGB(56, 56, 56))
end
function module.MidHauntBite(p990, p991, p992, p993)
	effectsServiceBiting(p990, p991, p992, p993, 0.7, "Chomp", Color3.fromRGB(56, 56, 56))
end
function module.SmallHauntBite(p994, p995, p996, p997)
	effectsServiceBiting(p994, p995, p996, p997, 0.5, "SmallChomp", Color3.fromRGB(56, 56, 56))
end
function module.AnglerBite(p998, p999, p1000, p1001)
	local n1 = p1000.ZIndex + 10000
	local color3414 = Color3.fromRGB(255, 255, 255)
	local image = p999.Image
	local v1959 = uDim2New(0, p999.AbsoluteSize.X, 0, p999.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p999.AbsolutePosition.X, 0, p999.AbsolutePosition.Y)
	local uDim262 = UDim2.new(0, p999.AbsoluteSize.X * 0.5, 0, p999.AbsoluteSize.Y * 0.5)
	local v1962 = effectsServiceNewerCircle(p998, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = n1,
		ImageColor3 = color3414,
		Image = image,
		Size = v1959,
		Position = uDim2 + uDim262
	})

	p999.ImageTransparency = 1

	local uDim263 = UDim2.new(0, p999.AbsolutePosition.X, 0, p999.AbsolutePosition.Y)
	local uDim264 = UDim2.new(0, p999.AbsoluteSize.X * 0.5, 0, p999.AbsoluteSize.Y * 0.5)

	task.spawn(function()
		task.wait(0.3)
		effectsServiceBiting(p998, p999, p1000, p1001, 0.7, "Chomp", Color3.fromRGB(255, 255, 255))
	end)

	local animationAnimate = animation.Animate
	local uDim265 = UDim2.new(0, p1000.AbsolutePosition.X - 50, 0, p1000.AbsolutePosition.Y)
	local uDim266 = UDim2.new(0, p1000.AbsoluteSize.X * 0.5, 0, p1000.AbsoluteSize.Y * 0.5)

	animationAnimate(v1962, { Position = uDim265 + uDim266 }, 0.5, "InOut", "Exponential")
	task.wait(0.1)
	animation.Animate(v1962, { Position = uDim263 + uDim264 }, 0.5, "InOut", "Exponential")
	p999.ImageTransparency = 0
	v1962:Destroy()
end
function module.PandemoniumBite(p1002, p1003, parent, p1005)
	local n1 = parent.ZIndex + 10000
	local color3415 = Color3.fromRGB(255, 255, 255)
	local image = p1003.Image
	local v1975 = uDim2New(0, p1003.AbsoluteSize.X, 0, p1003.AbsoluteSize.Y)
	local uDim2 = UDim2.new(0, p1003.AbsolutePosition.X, 0, p1003.AbsolutePosition.Y)
	local uDim267 = UDim2.new(0, p1003.AbsoluteSize.X * 0.5, 0, p1003.AbsoluteSize.Y * 0.5)
	local v1978 = effectsServiceNewerCircle(p1002, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = n1,
		ImageColor3 = color3415,
		Image = image,
		Size = v1975,
		Position = uDim2 + uDim267
	})
	local n2 = parent.ZIndex + 10000
	local color3416 = Color3.fromRGB(255, 255, 255)
	local v1981 = uDim2New(0, 50, 0, 50)
	local uDim2FromScale = UDim2.fromScale
	local randomNumber = math.random(0, 1)
	local v1984 = uDim2FromScale(randomNumber, math.random(0, 1))
	local v1985 = effectsServiceNewerCircle(p1002, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://6755657357",
		ZIndex = n2,
		ImageColor3 = color3416,
		Size = v1981,
		Position = v1984,
		Parent = parent
	})
	local n3 = parent.ZIndex + 10000
	local color3417 = Color3.fromRGB(255, 255, 255)
	local v1988 = uDim2New(0, 60, 0, 60)
	local v1989 = UDim2.fromScale(0.5, 0.5)
	local v1990 = effectsServiceNewerCircle(p1002, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://117923846934091",
		ZIndex = n3,
		ImageColor3 = color3417,
		Size = v1988,
		Position = v1989,
		Parent = parent
	})
	local n4 = parent.ZIndex + 10000
	local color3418 = Color3.fromRGB(255, 255, 255)
	local v1993 = uDim2New(0, 200, 0, 20)
	local v1994 = UDim2.fromScale(0.5, 0.8)
	local v1995 = effectsServiceNewerCircle(p1002, {
		BackgroundTransparency = 0,
		ImageTransparency = 1,
		Image = "rbxassetid://",
		ZIndex = n4,
		ImageColor3 = color3418,
		Size = v1993,
		Position = v1994,
		Parent = parent
	})

	p1003.ImageTransparency = 1
	v1985.ImageTransparency = 0
	v1990.ImageTransparency = 0

	local uDim268 = UDim2.new(0, p1003.AbsolutePosition.X, 0, p1003.AbsolutePosition.Y)
	local uDim269 = UDim2.new(0, p1003.AbsoluteSize.X * 0.5, 0, p1003.AbsoluteSize.Y * 0.5)

	task.spawn(function()
		v1995.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

		local animationAnimateAsync = animation.AnimateAsync
		local v4415 = uDim2New(0, 150, 0, 20)

		animationAnimateAsync(v1995, { Size = v4415 }, 0.25, "InOut", "Linear")

		local animateAsync = animation.AnimateAsync

		v4415 = UDim2.fromScale(0.5, 0.5)
		animateAsync(v1985, { Position = v4415 }, 0.3, "Out", "Quart")
		task.wait(0.26)
		v1995.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

		local v4417 = animation.AnimateAsync

		v4415 = uDim2New(0, 180, 0, 20)
		v4417(v1995, { Size = v4415 }, 0.1, "InOut", "Linear")
		task.wait(0.11)
		effectsService.ShakeBattleSync(p1002, 0.3, 0.055)

		local v4418 = animation.AnimateAsync
		local uDim2FromScale = UDim2.fromScale
		local randomNumber12 = math.random(-1.5, 1.5)

		v4415 = uDim2FromScale(randomNumber12, math.random(-1.5, 1.5))
		v4418(v1985, { Position = v4415 }, 0.2, "InOut", "Exponential")
		v1995.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

		local v4421 = animation.AnimateAsync

		v4415 = uDim2New(0, 50, 0, 20)
		v4421(v1995, { Size = v4415 }, 0.5, "InOut", "Linear")
	end)
	task.wait(0.1)
	task.spawn(function()
		task.wait(0.3)
		effectsServiceBiting(p1002, p1003, parent, p1005, 0.9, "Pandemonium", Color3.fromRGB(255, 255, 255))
	end)

	local animationAnimate = animation.Animate
	local uDim270 = UDim2.new(0, parent.AbsolutePosition.X - 50, 0, parent.AbsolutePosition.Y)
	local uDim271 = UDim2.new(0, parent.AbsoluteSize.X * 0.5, 0, parent.AbsoluteSize.Y * 0.5)

	animationAnimate(v1978, { Position = uDim270 + uDim271 }, 0.5, "InOut", "Exponential")
	task.wait(0.2)
	animation.Animate(v1978, { Position = uDim268 + uDim269 }, 0.5, "InOut", "Exponential")
	animation.AnimateAsync(v1985, { ImageTransparency = 1 }, 0.5, "InOut", "Linear")
	animation.AnimateAsync(v1990, { ImageTransparency = 1 }, 0.5, "InOut", "Linear")

	local animate = animation.Animate
	local v2002 = uDim2New(0, 0, 0, 20)

	animate(v1995, { BackgroundTransparency = 1, Size = v2002 }, 0.5, "InOut", "Linear")
	p1003.ImageTransparency = 0
	v1978:Destroy()
	v1990:Destroy()
	v1985:Destroy()
end
function module.SmallExplosion(p1006, _, p1008, p1009, _)
	local n1 = p1008.ZIndex - 1
	local uDim2 = UDim2.new(0, p1008.AbsoluteSize.X * 0.1, 0, p1008.AbsoluteSize.X * 0.1)
	local uDim272 = UDim2.new(0, p1008.AbsolutePosition.X + p1008.AbsoluteSize.X / 2, 0, p1008.AbsolutePosition.Y + p1008.AbsoluteSize.Y / 2)
	local v2011 = effectsServiceNewerCircle(p1006, {
		Image = "rbxassetid://1057939773",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim272
	})

	audioService.PlaySound("collide.wav")
	spawn(function()
		effectsService.ShakeBattleSync(p1006, 0.2, 0.025)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3419 = Color3.fromRGB(240, 99, 43)
		local color3420 = Color3.fromRGB(217, 66, 39)
		local color3421 = Color3.fromRGB(240, 191, 65)
		local color3422 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p1006, p1008, p1008, p1009, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3419, color3420, color3421, color3422, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)

	local animationAnimate = animation.Animate
	local uDim273 = UDim2.new(0, p1008.AbsoluteSize.X * 2.25, 0, p1008.AbsoluteSize.X * 2.25)

	animationAnimate(v2011, { Size = uDim273 }, 0.5, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v2011, "ImageTransparency", 0, 1, 0.3)
		v2011:Destroy()
	end)
	wait(0.1)
end
function module.SmallExplosionEffect(p1011, p1012, p1013, _)
	module.SmallExplosion(p1011, p1012, p1013, nil, nil)
end
function module.SmallExplosionSelf(p1015, p1016, _, p1018, _)
	local n1 = p1016.ZIndex - 1
	local uDim2 = UDim2.new(0, p1016.AbsoluteSize.X * 0.1, 0, p1016.AbsoluteSize.X * 0.1)
	local uDim274 = UDim2.new(0, p1016.AbsolutePosition.X + p1016.AbsoluteSize.X / 2, 0, p1016.AbsolutePosition.Y + p1016.AbsoluteSize.Y / 2)
	local v2026 = effectsServiceNewerCircle(p1015, {
		Image = "rbxassetid://1057939773",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim274
	})

	audioService.PlaySound("collide.wav")
	spawn(function()
		effectsService.ShakeBattleSync(p1015, 0.2, 0.025)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3423 = Color3.fromRGB(240, 99, 43)
		local color3424 = Color3.fromRGB(217, 66, 39)
		local color3425 = Color3.fromRGB(240, 191, 65)
		local color3426 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathAttack(p1015, p1016, p1016, p1018, 70, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3423, color3424, color3425, color3426, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)

	local animationAnimate = animation.Animate
	local uDim275 = UDim2.new(0, p1016.AbsoluteSize.X * 2.25, 0, p1016.AbsoluteSize.X * 2.25)

	animationAnimate(v2026, { Size = uDim275 }, 0.5, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v2026, "ImageTransparency", 0, 1, 0.3)
		v2026:Destroy()
	end)
	wait(0.1)
end
function module.SmallExplosionSelfEffect(p1020, p1021, p1022, _)
	module.SmallExplosionSelf(p1020, p1021, p1022, nil, nil)
end
function module.SmallTimeBomb(p1024, p1025, p1026, p1027, _)
	audioService.PlaySound("button.wav")

	local n1 = p1026.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1026.AbsoluteSize.X * 1.5, 0, p1026.AbsoluteSize.X * 1.5)
	local uDim276 = UDim2.new(0, p1026.AbsolutePosition.X + p1026.AbsoluteSize.X / 2, 0, p1026.AbsolutePosition.Y + p1026.AbsoluteSize.Y / 2)
	local v2041 = effectsServiceNewerCircle(p1024, {
		Image = "rbxassetid://12210192599",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim276
	})
	local uDim277 = UDim2.new(0, p1026.AbsoluteSize.X * 2.5, 0, p1026.AbsoluteSize.X * 2.5)

	v2041:TweenSize(uDim277, "Out", "Quad", 0.1, true)
	effectsService.Shake(p1026, p1026.Position, 0.15, 0.2)

	local uDim278 = UDim2.new(0, p1026.AbsoluteSize.X / 1.5, 0, p1026.AbsoluteSize.X / 1.5)

	v2041:TweenSize(uDim278, "In", "Quad", 0.075, true)
	spawn(function()
		effectsService.TweenProperty(v2041, "ImageTransparency", 0, 1, 0.1)
		v2041:Destroy()
	end)

	local color3427 = Color3.fromRGB(255, 255, 255)
	local n2 = p1026.ZIndex + 10002
	local uDim279 = UDim2.new(0, p1026.AbsoluteSize.X * 1.5, 0, p1026.AbsoluteSize.X * 1.5)
	local uDim280 = UDim2.new(0, p1026.AbsolutePosition.X + p1026.AbsoluteSize.X / 2, 0, p1026.AbsolutePosition.Y + p1026.AbsoluteSize.Y / 2)
	local v2048 = effectsServiceNewerCircle(p1024, {
		Image = "rbxassetid://12210275448",
		ImageColor3 = color3427,
		ZIndex = n2,
		Size = uDim279,
		Position = uDim280
	})
	local uDim281 = UDim2.new(0, p1026.AbsoluteSize.X * 0.9, 0, p1026.AbsoluteSize.X * 0.9)

	v2048:TweenSize(uDim281, "Out", "Quad", 0.05, true)

	local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
	local imageColor3 = v2048.ImageColor3
	local color3428 = Color3.fromRGB(255, 255, 255)

	effectsServiceNewTweenProperty(v2048, "ImageColor3", imageColor3, color3428, 0.1, "Quint")
	effectsServiceWaitX(0.15)

	local uDim282 = UDim2.new(0, p1026.AbsoluteSize.X * 0.8, 0, p1026.AbsoluteSize.X * 0.8)

	v2048:TweenSize(uDim282, "Out", "Quad", 0.15, true)

	local newTweenProperty = effectsService.NewTweenProperty
	local v2055 = v2048.ImageColor3
	local color3429 = Color3.fromRGB(255, 0, 13)

	newTweenProperty(v2048, "ImageColor3", v2055, color3429, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")

	local n3 = p1026.ZIndex - 1
	local uDim283 = UDim2.new(0, p1026.AbsoluteSize.X * 0.1, 0, p1026.AbsoluteSize.X * 0.1)
	local uDim284 = UDim2.new(0, p1026.AbsolutePosition.X + p1026.AbsoluteSize.X / 2, 0, p1026.AbsolutePosition.Y + p1026.AbsoluteSize.Y / 2)
	local v2060 = effectsServiceNewerCircle(p1024, {
		Image = "rbxassetid://1057939773",
		ZIndex = n3,
		Size = uDim283,
		Position = uDim284
	})

	audioService.PlaySound("collide.wav")
	spawn(function()
		effectsService.ShakeBattleSync(p1024, 0.2, 0.025)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3430 = Color3.fromRGB(240, 99, 43)
		local color3431 = Color3.fromRGB(217, 66, 39)
		local color3432 = Color3.fromRGB(240, 191, 65)
		local color3433 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathEngulf(p1024, p1025, p1026, p1027, 75, effectsServiceBreathimagesFire, "FireBreath", 0.5, color3430, color3431, color3432, color3433, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.TweenProperty(v2048, "ImageTransparency", 0, 1, 0.1)
		v2048:Destroy()
	end)

	local animationAnimate = animation.Animate
	local uDim285 = UDim2.new(0, p1026.AbsoluteSize.X * 2.25, 0, p1026.AbsoluteSize.X * 2.25)

	animationAnimate(v2060, { Size = uDim285 }, 0.5, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v2060, "ImageTransparency", 0, 1, 0.3)
		v2060:Destroy()
	end)
	wait(0.1)
end
function module.SmallTimeBombEffect(p1029, p1030, p1031, _)
	module.SmallTimeBomb(p1029, p1030, p1031, nil, nil)
end
function module.MidTimeBomb(p1033, p1034, p1035, p1036, _)
	audioService.PlaySound("button.wav")

	local n1 = p1035.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1035.AbsoluteSize.X * 2, 0, p1035.AbsoluteSize.X * 2)
	local uDim286 = UDim2.new(0, p1035.AbsolutePosition.X + p1035.AbsoluteSize.X / 2, 0, p1035.AbsolutePosition.Y + p1035.AbsoluteSize.Y / 2)
	local v2075 = effectsServiceNewerCircle(p1033, {
		Image = "rbxassetid://12210192599",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim286
	})
	local uDim287 = UDim2.new(0, p1035.AbsoluteSize.X * 3.3, 0, p1035.AbsoluteSize.X * 3.3)

	v2075:TweenSize(uDim287, "Out", "Quad", 0.1, true)
	effectsService.Shake(p1035, p1035.Position, 0.15, 0.2)

	local uDim288 = UDim2.new(0, p1035.AbsoluteSize.X / 1.5, 0, p1035.AbsoluteSize.X / 1.5)

	v2075:TweenSize(uDim288, "In", "Quad", 0.075, true)
	spawn(function()
		effectsService.TweenProperty(v2075, "ImageTransparency", 0, 1, 0.1)
		v2075:Destroy()
	end)

	local color3434 = Color3.fromRGB(255, 255, 255)
	local n2 = p1035.ZIndex + 10002
	local uDim289 = UDim2.new(0, p1035.AbsoluteSize.X * 2, 0, p1035.AbsoluteSize.X * 2)
	local uDim290 = UDim2.new(0, p1035.AbsolutePosition.X + p1035.AbsoluteSize.X / 2, 0, p1035.AbsolutePosition.Y + p1035.AbsoluteSize.Y / 2)
	local v2082 = effectsServiceNewerCircle(p1033, {
		Image = "rbxassetid://12210275448",
		ImageColor3 = color3434,
		ZIndex = n2,
		Size = uDim289,
		Position = uDim290
	})
	local uDim291 = UDim2.new(0, p1035.AbsoluteSize.X * 1, 0, p1035.AbsoluteSize.X * 1)

	v2082:TweenSize(uDim291, "Out", "Quad", 0.05, true)

	local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
	local imageColor3 = v2082.ImageColor3
	local color3435 = Color3.fromRGB(255, 255, 255)

	effectsServiceNewTweenProperty(v2082, "ImageColor3", imageColor3, color3435, 0.1, "Quint")
	effectsServiceWaitX(0.15)

	local uDim292 = UDim2.new(0, p1035.AbsoluteSize.X * 0.9, 0, p1035.AbsoluteSize.X * 0.9)

	v2082:TweenSize(uDim292, "Out", "Quad", 0.15, true)

	local newTweenProperty = effectsService.NewTweenProperty
	local v2089 = v2082.ImageColor3
	local color3436 = Color3.fromRGB(255, 0, 13)

	newTweenProperty(v2082, "ImageColor3", v2089, color3436, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")
	effectsServiceWaitX(0.15)

	local uDim293 = UDim2.new(0, p1035.AbsoluteSize.X * 1, 0, p1035.AbsoluteSize.X * 1)

	v2082:TweenSize(uDim293, "Out", "Quad", 0.15, true)

	local v2092 = effectsService.NewTweenProperty
	local v2093 = v2082.ImageColor3
	local color3437 = Color3.fromRGB(255, 255, 255)

	v2092(v2082, "ImageColor3", v2093, color3437, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")

	local n3 = p1035.ZIndex - 1
	local uDim294 = UDim2.new(0, p1035.AbsoluteSize.X * 0.1, 0, p1035.AbsoluteSize.X * 0.1)
	local uDim295 = UDim2.new(0, p1035.AbsolutePosition.X + p1035.AbsoluteSize.X / 2, 0, p1035.AbsolutePosition.Y + p1035.AbsoluteSize.Y / 2)
	local v2098 = effectsServiceNewerCircle(p1033, {
		Image = "rbxassetid://1057939773",
		ZIndex = n3,
		Size = uDim294,
		Position = uDim295
	})

	audioService.PlaySound("collide.wav")
	spawn(function()
		effectsService.ShakeBattleSync(p1033, 0.3, 0.035)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3438 = Color3.fromRGB(240, 99, 43)
		local color3439 = Color3.fromRGB(217, 66, 39)
		local color3440 = Color3.fromRGB(240, 191, 65)
		local color3441 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathEngulf(p1033, p1034, p1035, p1036, 100, effectsServiceBreathimagesFire, "FireBreath", 0.6, color3438, color3439, color3440, color3441, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.TweenProperty(v2082, "ImageTransparency", 0, 1, 0.1)
		v2082:Destroy()
	end)

	local animationAnimate = animation.Animate
	local uDim296 = UDim2.new(0, p1035.AbsoluteSize.X * 2.5, 0, p1035.AbsoluteSize.X * 2.5)

	animationAnimate(v2098, { Size = uDim296 }, 0.5, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v2098, "ImageTransparency", 0, 1, 0.3)
		v2098:Destroy()
	end)
	wait(0.1)
end
function module.LargeTimeBomb(p1038, p1039, p1040, p1041, _)
	audioService.PlaySound("button.wav")

	local n1 = p1040.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1040.AbsoluteSize.X * 2, 0, p1040.AbsoluteSize.X * 2)
	local uDim297 = UDim2.new(0, p1040.AbsolutePosition.X + p1040.AbsoluteSize.X / 2, 0, p1040.AbsolutePosition.Y + p1040.AbsoluteSize.Y / 2)
	local v2109 = effectsServiceNewerCircle(p1038, {
		Image = "rbxassetid://12210192599",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim297
	})
	local uDim298 = UDim2.new(0, p1040.AbsoluteSize.X * 3.3, 0, p1040.AbsoluteSize.X * 3.3)

	v2109:TweenSize(uDim298, "Out", "Quad", 0.1, true)
	effectsService.Shake(p1040, p1040.Position, 0.15, 0.2)

	local uDim299 = UDim2.new(0, p1040.AbsoluteSize.X / 1.5, 0, p1040.AbsoluteSize.X / 1.5)

	v2109:TweenSize(uDim299, "In", "Quad", 0.075, true)
	spawn(function()
		effectsService.TweenProperty(v2109, "ImageTransparency", 0, 1, 0.1)
		v2109:Destroy()
	end)

	local color3442 = Color3.fromRGB(255, 255, 255)
	local n2 = p1040.ZIndex + 10002
	local uDim2100 = UDim2.new(0, p1040.AbsoluteSize.X * 2, 0, p1040.AbsoluteSize.X * 2)
	local uDim2101 = UDim2.new(0, p1040.AbsolutePosition.X + p1040.AbsoluteSize.X / 2, 0, p1040.AbsolutePosition.Y + p1040.AbsoluteSize.Y / 2)
	local v2116 = effectsServiceNewerCircle(p1038, {
		Image = "rbxassetid://12210275448",
		ImageColor3 = color3442,
		ZIndex = n2,
		Size = uDim2100,
		Position = uDim2101
	})
	local uDim2102 = UDim2.new(0, p1040.AbsoluteSize.X * 1.15, 0, p1040.AbsoluteSize.X * 1.15)

	v2116:TweenSize(uDim2102, "Out", "Quad", 0.05, true)

	local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
	local imageColor3 = v2116.ImageColor3
	local color3443 = Color3.fromRGB(255, 255, 255)

	effectsServiceNewTweenProperty(v2116, "ImageColor3", imageColor3, color3443, 0.1, "Quint")
	effectsServiceWaitX(0.15)

	local uDim2103 = UDim2.new(0, p1040.AbsoluteSize.X * 1, 0, p1040.AbsoluteSize.X * 1)

	v2116:TweenSize(uDim2103, "Out", "Quad", 0.15, true)

	local newTweenProperty = effectsService.NewTweenProperty
	local v2123 = v2116.ImageColor3
	local color3444 = Color3.fromRGB(255, 0, 13)

	newTweenProperty(v2116, "ImageColor3", v2123, color3444, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")
	effectsServiceWaitX(0.15)

	local uDim2104 = UDim2.new(0, p1040.AbsoluteSize.X * 1.15, 0, p1040.AbsoluteSize.X * 1.15)

	v2116:TweenSize(uDim2104, "Out", "Quad", 0.15, true)

	local v2126 = effectsService.NewTweenProperty
	local v2127 = v2116.ImageColor3
	local color3445 = Color3.fromRGB(255, 255, 255)

	v2126(v2116, "ImageColor3", v2127, color3445, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")
	effectsServiceWaitX(0.15)

	local uDim2105 = UDim2.new(0, p1040.AbsoluteSize.X * 1, 0, p1040.AbsoluteSize.X * 1)

	v2116:TweenSize(uDim2105, "Out", "Quad", 0.05, true)

	local v2130 = effectsService.NewTweenProperty
	local v2131 = v2116.ImageColor3
	local color3446 = Color3.fromRGB(255, 0, 13)

	v2130(v2116, "ImageColor3", v2131, color3446, 0.1, "Quint")
	audioService.PlaySound("clickfast.wav")

	local n3 = p1040.ZIndex - 1
	local uDim2106 = UDim2.new(0, p1040.AbsoluteSize.X * 0.1, 0, p1040.AbsoluteSize.X * 0.1)
	local uDim2107 = UDim2.new(0, p1040.AbsolutePosition.X + p1040.AbsoluteSize.X / 2, 0, p1040.AbsolutePosition.Y + p1040.AbsoluteSize.Y / 2)
	local v2136 = effectsServiceNewerCircle(p1038, {
		Image = "rbxassetid://1057939773",
		ZIndex = n3,
		Size = uDim2106,
		Position = uDim2107
	})

	audioService.PlaySound("Rocket shot.wav")
	spawn(function()
		effectsService.ShakeBattleSync(p1038, 0.3, 0.04)

		local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
		local color3447 = Color3.fromRGB(240, 99, 43)
		local color3448 = Color3.fromRGB(217, 66, 39)
		local color3449 = Color3.fromRGB(240, 191, 65)
		local color3450 = Color3.fromRGB(240, 64, 11)

		effectsServiceBreathEngulf(p1038, p1039, p1040, p1041, 150, effectsServiceBreathimagesFire, "FireBreathLong", 0.8, color3447, color3448, color3449, color3450, 1.1, 0.9)
		wait(0.05)
	end)
	effectsServiceWaitX(0.1)
	spawn(function()
		effectsService.TweenProperty(v2116, "ImageTransparency", 0, 1, 0.1)
		v2116:Destroy()
	end)

	local animationAnimate = animation.Animate
	local uDim2108 = UDim2.new(0, p1040.AbsoluteSize.X * 2.75, 0, p1040.AbsoluteSize.X * 2.75)

	animationAnimate(v2136, { Size = uDim2108 }, 0.5, "Out", "Quad")
	spawn(function()
		wait(0.1)
		effectsService.TweenProperty(v2136, "ImageTransparency", 0, 1, 0.3)
		v2136:Destroy()
	end)
	wait(0.3)
end
local function LaserBeamAttack(p1043, p1044, p1045, _)
	local color3451 = Color3.fromRGB(255, 255, 255)
	local v2144 = UDim2.fromOffset(0.1, 0.1)
	local uDim2 = UDim2.new(0, p1044.AbsolutePosition.X, 0, p1044.AbsolutePosition.Y)
	local uDim2109 = UDim2.new(0, p1044.AbsoluteSize.X * 0.5, 0, p1044.AbsoluteSize.Y * 0.5)
	local v2147 = effectsServiceNewerCircle(p1043, {
		Image = "rbxassetid://11927574847",
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ImageColor3 = color3451,
		Size = v2144,
		Position = uDim2 + uDim2109,
		ZIndex = p1045.ZIndex + 10001
	})

	audioService.PlaySound("LargeLaserCharge")
	animation.AnimateAsync(v2147, { ImageTransparency = 0 }, 0.4, "In", "Quint")

	local animationAnimateAsync = animation.AnimateAsync
	local v2149 = UDim2.fromOffset(p1044.AbsoluteSize.X * 6, p1044.AbsoluteSize.X * 6)

	animationAnimateAsync(v2147, { Size = v2149 }, 0.8, "InOut", "Quad")
	animation.AnimateAsync(v2147, { Rotation = v2147.Rotation + 700 }, 3, "InOut", "Quad")
	effectsServiceWaitX(0.7)
	audioService.PlaySound("HeavyLaser")

	local color3452 = Color3.fromRGB(255, 255, 255)
	local v2151 = UDim2.fromOffset(p1045.AbsoluteSize.X * 1.2, 0)
	local v2152 = UDim2.fromScale(0, 2)
	local uDim2110 = UDim2.new(0, p1045.AbsolutePosition.X, 0, p1045.AbsolutePosition.Y)
	local uDim2111 = UDim2.new(0, p1045.AbsoluteSize.X * 0.5, 0, p1045.AbsoluteSize.Y * 0.5)
	local v2155 = effectsServiceNewerCircle(p1043, {
		Image = "rbxassetid://10248621823",
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Rotation = 90,
		ImageColor3 = color3452,
		Size = v2151 + v2152,
		Position = uDim2110 + uDim2111,
		ZIndex = p1045.ZIndex + 10000
	})

	if p1044.AbsolutePosition.X < p1045.AbsolutePosition.X then
		v2155.Position = UDim2.new(0, p1044.AbsolutePosition.X + p1044.AbsoluteSize.X / 2 + v2155.AbsoluteSize.Y / 2, 0, p1044.AbsolutePosition.Y + p1044.AbsoluteSize.Y / 2)
	else
		v2155.Position = UDim2.new(0, p1044.AbsolutePosition.X + p1044.AbsoluteSize.X / 2 - v2155.AbsoluteSize.Y / 2, 0, p1044.AbsolutePosition.Y + p1044.AbsoluteSize.Y / 2)
	end

	task.spawn(function()
		for _ = 1, 30 do
			v2155.Rotation = v2155.Rotation + 180
			task.wait(0.1)
		end
	end)
	task.spawn(function()
		effectsService.Shake(v2155, v2155.Position, 2, 0.05)
	end)
	task.spawn(function()
		effectsService.Shake(p1045, p1045.Position, 1, 0.4)
	end)
	task.spawn(function()
		effectsService.ShakeBattle(p1043, 1, 0.05)
	end)
	task.spawn(function()
		local animationAnimate = animation.Animate
		local v4449 = UDim2.fromScale(0, 2)

		animationAnimate(v2155, { Size = v4449 }, 1.5, "In", "Quint")
		v2155:Destroy()
	end)

	local animationAnimate = animation.Animate

	v2151 = UDim2.fromScale(0, 0)
	animationAnimate(v2147, { Size = v2151 }, 1.5, "In", "Quint")
	v2147:Destroy()
end
function module.LargeMzhLaser(p1047, p1048, p1049, p1050)
	LaserBeamAttack(p1047, p1048, p1049, p1050)
end
function module.MidMzhLaser(p1051, p1052, p1053, p1054)
	LaserBeamAttack(p1051, p1052, p1053, p1054)
end
function module.SmallMzhLaser(p1055, p1056, p1057, p1058)
	LaserBeamAttack(p1055, p1056, p1057, p1058)
end
local function LaserBeam(parent, p1060, p1061, _, p1063, p1064, p1065, imageColor3)
	effectsService.ShakeSync(p1060, p1060.Position, 0.6 * p1063, 0.2 * p1063)
	effectsService.ShakeSync(p1061, p1061.Position, 0.6 * p1063, 0.2 * p1063)
	audioServicePlaySound(p1065)

	for _ = 1, p1064 do
		local vector3 = Vector3.new(p1060.AbsolutePosition.X + p1060.AbsoluteSize.X / 2, p1060.AbsolutePosition.Y + p1060.AbsoluteSize.Y / 2.5, 0)
		local n1 = p1061.AbsolutePosition.X + p1061.AbsoluteSize.X / 2
		local randomNumber = math.random(-p1061.AbsoluteSize.X / 8, p1061.AbsoluteSize.X / 8)
		local n2 = p1061.AbsolutePosition.Y + p1061.AbsoluteSize.Y / 2.5
		local randomNumber13 = math.random(-p1061.AbsoluteSize.Y / 8, p1061.AbsoluteSize.Y / 8)
		local vector32 = Vector3.new(n1 + randomNumber, n2 + randomNumber13, 0)
		local color3453 = Color3.fromRGB(255, 255, 255)
		local v2185 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://511406127",
			ZIndex = 1000000,
			ImageColor3 = color3453
		})
		local t44 = {
			BackgroundTransparency = 1,
			ImageTransparency = 0.8,
			Image = "rbxassetid://511406127",
			ZIndex = 1000001,
			ImageColor3 = math.random(1, 2) == 1 and Color3.fromRGB(255, 255, 255) or imageColor3,
			Size = UDim2.fromOffset(p1060.AbsoluteSize.Y * p1063, p1060.AbsoluteSize.Y * p1063),
			Position = UDim2.new(0, p1060.AbsolutePosition.X + p1060.AbsoluteSize.X / 2, 0, p1060.AbsolutePosition.Y + p1060.AbsoluteSize.Y / 2.5)
		}
		local v2187 = effectsServiceNewerCircle(parent, t44)
		local animationAnimateAsync = animation.AnimateAsync
		local v2189 = UDim2.fromOffset(0, 0)
		local color3454 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v2187, { ImageTransparency = 1, Size = v2189, ImageColor3 = color3454 }, 1 * p1063, "Out", "Quart")

		local magnitude = (vector32 - vector3).Magnitude

		t44 = math.atan2(vector3.Y - vector32.Y, vector3.X - vector32.X)
		v2185.Size = UDim2.new(0, magnitude, 0, p1061.AbsoluteSize.X / 2 * p1063)
		v2189 = CFrame.new(vector3, vector32).Position

		local cFrame = CFrame.new(vector3, vector32)
		local n3 = v2189 + cFrame.lookVector * magnitude / 2

		v2185.Position = UDim2.new(0, n3.X, 0, n3.Y)
		v2185.Rotation = math.deg(t44)

		local clone = v2185:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p1061.AbsoluteSize.X / 1.5 * p1063)
		clone.Parent = parent
		clone.ImageColor3 = imageColor3
		clone.ZIndex = v2185.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v2196 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v2196 }, 1 * p1063, "Out", "Quart")

		local v2197 = animation.AnimateAsync

		v2196 = UDim2.fromOffset(magnitude, 0)
		v2197(v2185, { Size = v2196 }, 1 * p1063, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.9 * p1063)
			v2187:Destroy()
			v2185:Destroy()
			clone:Destroy()
		end)
	end
end
function module.LargeLaserGreen(p1067, p1068, p1069, p1070)
	LaserBeam(p1067, p1068, p1069, p1070, 1, 60, "Sweeping Beam", Color3.fromRGB(13, 255, 0))
	wait(0.1)
end
function module.MidLaserGreen(p1071, p1072, p1073, p1074)
	LaserBeam(p1071, p1072, p1073, p1074, 0.8, 50, "Radiant Beam", Color3.fromRGB(13, 255, 0))
	wait(0.1)
end
function module.SmallLaserGreen(p1075, p1076, p1077, p1078)
	LaserBeam(p1075, p1076, p1077, p1078, 0.6, 35, "Tetryon Beam", Color3.fromRGB(13, 255, 0))
	wait(0.1)
end
function module.SmallLaserGreenEffect(p1079, p1080, p1081, _)
	module.SmallLaserGreen(p1079, p1080, p1081, nil, nil)
	wait(0.1)
end
function module.LargeLaserBlue(p1083, p1084, p1085, p1086)
	LaserBeam(p1083, p1084, p1085, p1086, 1, 60, "Sweeping Beam", Color3.fromRGB(0, 38, 255))
	wait(0.1)
end
function module.MidLaserBlue(p1087, p1088, p1089, p1090)
	LaserBeam(p1087, p1088, p1089, p1090, 0.8, 50, "Radiant Beam", Color3.fromRGB(0, 38, 255))
	wait(0.1)
end
function module.SmallLaserBlue(p1091, p1092, p1093, p1094)
	LaserBeam(p1091, p1092, p1093, p1094, 0.6, 35, "Tetryon Beam", Color3.fromRGB(0, 38, 255))
	wait(0.1)
end
function module.SmallLaserBlueEffect(p1095, p1096, p1097, _)
	module.SmallLaserBlue(p1095, p1096, p1097, nil, nil)
	wait(0.1)
end
function module.LargeLaserYellow(p1099, p1100, p1101, p1102)
	LaserBeam(p1099, p1100, p1101, p1102, 1, 60, "Sweeping Beam", Color3.fromRGB(255, 234, 0))
	wait(0.1)
end
function module.LargeLaserYellowEffect(p1103, p1104, p1105, _)
	module.LargeLaserYellow(p1103, p1104, p1105, nil, nil)
	wait(0.1)
end
function module.MidLaserYellow(p1107, p1108, p1109, p1110)
	LaserBeam(p1107, p1108, p1109, p1110, 0.8, 50, "Radiant Beam", Color3.fromRGB(255, 234, 0))
	wait(0.1)
end
function module.SmallLaserYellow(p1111, p1112, p1113, p1114)
	LaserBeam(p1111, p1112, p1113, p1114, 0.6, 35, "Tetryon Beam", Color3.fromRGB(255, 234, 0))
	wait(0.1)
end
function module.SmallLaserYellowEffect(p1115, p1116, p1117, _)
	module.SmallLaserYellow(p1115, p1116, p1117, nil, nil)
	wait(0.1)
end
function module.LargeLaserRed(p1119, p1120, p1121, p1122)
	LaserBeam(p1119, p1120, p1121, p1122, 1, 60, "Sweeping Beam", Color3.fromRGB(248, 36, 36))
	wait(0.1)
end
function module.MidLaserRed(p1123, p1124, p1125, p1126)
	LaserBeam(p1123, p1124, p1125, p1126, 0.8, 50, "Radiant Beam", Color3.fromRGB(248, 36, 36))
	wait(0.1)
end
function module.SmallLaserRed(p1127, p1128, p1129, p1130)
	LaserBeam(p1127, p1128, p1129, p1130, 0.6, 35, "Tetryon Beam", Color3.fromRGB(248, 36, 36))
	wait(0.1)
end
function module.SmallLaserRedEffect(p1131, p1132, p1133, _)
	module.SmallLaserRed(p1131, p1132, p1133, nil, nil)
	wait(0.1)
end
function module.LargeLaserBluePurple(p1135, p1136, p1137, p1138)
	if math.random(1, 2) == 1 then
		LaserBeam(p1135, p1136, p1137, p1138, 1, 60, "Sweeping Beam", Color3.fromRGB(0, 38, 255))
	else
		LaserBeam(p1135, p1136, p1137, p1138, 1, 60, "Sweeping Beam", Color3.fromRGB(170, 0, 255))
	end

	wait(0.1)
end
function module.MidLaserBluePurple(p1139, p1140, p1141, p1142)
	if math.random(1, 2) == 1 then
		LaserBeam(p1139, p1140, p1141, p1142, 0.8, 50, "Radiant Beam", Color3.fromRGB(0, 38, 255))
	else
		LaserBeam(p1139, p1140, p1141, p1142, 0.8, 50, "Radiant Beam", Color3.fromRGB(170, 0, 255))
	end

	wait(0.1)
end
function module.SmallLaserBluePurple(p1143, p1144, p1145, p1146)
	if math.random(1, 2) == 1 then
		LaserBeam(p1143, p1144, p1145, p1146, 0.6, 35, "Tetryon Beam", Color3.fromRGB(0, 38, 255))
	else
		LaserBeam(p1143, p1144, p1145, p1146, 0.6, 35, "Tetryon Beam", Color3.fromRGB(170, 0, 255))
	end

	wait(0.1)
end
function module.SmallLaserBluePurpleEffect(p1147, p1148, p1149, _)
	module.SmallLaserBluePurple(p1147, p1148, p1149, nil, nil)
	wait(0.1)
end
local function LargeMagicAttack(p1151, _, p1153, _, list)
	audioService.PlaySound("PreMagic")

	local v2287 = list[2]
	local n1 = p1153.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1153.AbsoluteSize.X * 3, 0, p1153.AbsoluteSize.X * 3)
	local uDim2112 = UDim2.new(0, p1153.AbsolutePosition.X, 0, p1153.AbsolutePosition.Y)
	local uDim2113 = UDim2.new(0, p1153.AbsoluteSize.X * 0.5, 0, p1153.AbsoluteSize.Y * 0.5)
	local v2292 = effectsServiceNewerCircle(p1151, {
		BackgroundTransparency = 1,
		Image = v2287,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2112 + uDim2113
	})
	local n2 = p1153.ZIndex + 10000
	local uDim2114 = UDim2.new(0, p1153.AbsoluteSize.X * 10, 0, p1153.AbsoluteSize.X * 10)
	local uDim2115 = UDim2.new(0, p1153.AbsolutePosition.X, 0, p1153.AbsolutePosition.Y)
	local uDim2116 = UDim2.new(0, p1153.AbsoluteSize.X * 0.5, 0, p1153.AbsoluteSize.Y * 0.5)
	local v2297 = effectsServiceNewerCircle(p1151, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5101723932",
		ZIndex = n2,
		Size = uDim2114,
		Position = uDim2115 + uDim2116
	})
	local uDim2117 = UDim2.new(0, p1153.AbsoluteSize.X / 10, 0, p1153.AbsoluteSize.X / 10)

	v2297:TweenSize(uDim2117, "Out", "Quint", 0.5, true)
	spawn(function()
		effectsService.TweenProperty(v2292, "Rotation", 0, 360, 1.8)
	end)

	local uDim2118 = UDim2.new(0, p1153.AbsoluteSize.X / 3, 0, p1153.AbsoluteSize.X / 3)

	v2292:TweenSize(uDim2118, "Out", "Quint", 0.6, true)
	effectsServiceWaitX(0.65)
	audioService.PlaySound("LargeMagic")
	effectsService.ShakeBattle(p1151, 0.1, 0.025)

	local uDim2119 = UDim2.new(0, p1153.AbsoluteSize.X * 10, 0, p1153.AbsoluteSize.X * 10)

	v2297:TweenSize(uDim2119, "Out", "Quint", 0.3, true)
	spawn(function()
		effectsService.Shake(p1153, p1153.Position, 0.3, 0.7)
	end)
	spawn(function()
		effectsService.TweenProperty(v2297, "ImageTransparency", 0, 1, 0.3)
		effectsServiceWaitX(0.4)
		effectsService.TweenProperty(v2292, "ImageTransparency", 0, 1, 0.4)
		v2292:Destroy()
		v2297:Destroy()
	end)

	local uDim2120 = UDim2.new(0, p1153.AbsoluteSize.X * 2.4, 0, p1153.AbsoluteSize.X * 2.4)

	v2292:TweenSize(uDim2120, "Out", "Quint", 0.6, true)

	for i = 1, #list do
		v2292.Image = list[i]
		effectsServiceWaitX(0.021)
	end
end
function module.LargeMagicBlue(p1156, p1157, p1158, p1159)
	effectsServicePreloadTech(p1156, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
	LargeMagicAttack(p1156, p1157, p1158, p1159, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
end
function module.LargeMagicBlueEffect(p1160, p1161, p1162, _)
	module.LargeMagicBlue(p1160, p1161, p1162, nil, nil)
end
function module.LargeMagicRed(p1164, p1165, p1166, p1167)
	effectsServicePreloadTech(p1164, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
	LargeMagicAttack(p1164, p1165, p1166, p1167, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
end
function module.LargeMagicRedEffect(p1168, p1169, p1170, _)
	module.LargeMagicRed(p1168, p1169, p1170, nil, nil)
end
function module.LargeMagicGreen(p1172, p1173, p1174, p1175)
	effectsServicePreloadTech(p1172, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
	LargeMagicAttack(p1172, p1173, p1174, p1175, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
end
function module.LargeMagicGreenEffect(p1176, p1177, p1178, _)
	module.LargeMagicGreen(p1176, p1177, p1178, nil, nil)
end
function module.LargeMagicYellow(p1180, p1181, p1182, p1183)
	effectsServicePreloadTech(p1180, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
	LargeMagicAttack(p1180, p1181, p1182, p1183, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
end
function module.LargeMagicYellowEffect(p1184, p1185, p1186, _)
	module.LargeMagicYellow(p1184, p1185, p1186, nil, nil)
end
local function MidMagicAttack(p1188, _, p1190, _, list)
	audioService.PlaySound("PreMagic")

	local v2340 = list[2]
	local n1 = p1190.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1190.AbsoluteSize.X * 2.5, 0, p1190.AbsoluteSize.X * 2.5)
	local uDim2121 = UDim2.new(0, p1190.AbsolutePosition.X, 0, p1190.AbsolutePosition.Y)
	local uDim2122 = UDim2.new(0, p1190.AbsoluteSize.X * 0.5, 0, p1190.AbsoluteSize.Y * 0.5)
	local v2345 = effectsServiceNewerCircle(p1188, {
		BackgroundTransparency = 1,
		Image = v2340,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2121 + uDim2122
	})

	spawn(function()
		effectsService.TweenProperty(v2345, "Rotation", 0, 360, 1.7)
	end)

	local uDim2123 = UDim2.new(0, p1190.AbsoluteSize.X / 3, 0, p1190.AbsoluteSize.X / 3)

	v2345:TweenSize(uDim2123, "Out", "Quint", 0.6, true)
	effectsServiceWaitX(0.5)
	audioService.PlaySound("MidMagic")
	spawn(function()
		effectsService.Shake(p1190, p1190.Position, 0.3, 0.3)
	end)
	spawn(function()
		wait(0.4)
		effectsService.TweenProperty(v2345, "ImageTransparency", 0, 1, 0.24)
		v2345:Destroy()
	end)

	local uDim2124 = UDim2.new(0, p1190.AbsoluteSize.X * 1.8, 0, p1190.AbsoluteSize.X * 1.8)

	v2345:TweenSize(uDim2124, "Out", "Quint", 0.6, true)

	for i = 1, #list do
		v2345.Image = list[i]
		effectsServiceWaitX(0.021)
	end
end
function module.MidMagicBlue(p1193, p1194, p1195, p1196)
	effectsServicePreloadTech(p1193, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
	MidMagicAttack(p1193, p1194, p1195, p1196, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
end
function module.MidMagicBlueEffect(p1197, p1198, p1199, _)
	module.MidMagicBlue(p1197, p1198, p1199, nil, nil)
end
function module.MidMagicRed(p1201, p1202, p1203, p1204)
	effectsServicePreloadTech(p1201, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
	MidMagicAttack(p1201, p1202, p1203, p1204, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
end
function module.MidMagicRedEffect(p1205, p1206, p1207, _)
	module.MidMagicRed(p1205, p1206, p1207, nil, nil)
end
function module.MidMagicGreen(p1209, p1210, p1211, p1212)
	effectsServicePreloadTech(p1209, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
	MidMagicAttack(p1209, p1210, p1211, p1212, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
end
function module.MidMagicGreenEffect(p1213, p1214, p1215, _)
	module.MidMagicGreen(p1213, p1214, p1215, nil, nil)
end
function module.MidMagicYellow(p1217, p1218, p1219, p1220)
	effectsServicePreloadTech(p1217, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
	MidMagicAttack(p1217, p1218, p1219, p1220, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
end
function module.MidMagicYellowEffect(p1221, p1222, p1223, _)
	module.MidMagicYellow(p1221, p1222, p1223, nil, nil)
end
local function SmallMagicAttack(p1225, _, p1227, _, list)
	local v2386 = list[2]
	local n1 = p1227.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1227.AbsoluteSize.X / 3, 0, p1227.AbsoluteSize.X / 3)
	local uDim2125 = UDim2.new(0, p1227.AbsolutePosition.X, 0, p1227.AbsolutePosition.Y)
	local uDim2126 = UDim2.new(0, p1227.AbsoluteSize.X * 0.5, 0, p1227.AbsoluteSize.Y * 0.5)
	local v2391 = effectsServiceNewerCircle(p1225, {
		BackgroundTransparency = 1,
		Image = v2386,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2125 + uDim2126
	})

	spawn(function()
		effectsService.TweenProperty(v2391, "Rotation", 0, 360, 1.7)
	end)
	audioService.PlaySound("SmallMagic")
	spawn(function()
		effectsService.Shake(p1227, p1227.Position, 0.2, 0.1)
	end)
	spawn(function()
		wait(0.3)
		effectsService.TweenProperty(v2391, "ImageTransparency", 0, 1, 0.24)
		v2391:Destroy()
	end)

	local uDim2127 = UDim2.new(0, p1227.AbsoluteSize.X, 0, p1227.AbsoluteSize.X)

	v2391:TweenSize(uDim2127, "Out", "Quint", 0.3, true)

	for i = 1, #list do
		v2391.Image = list[i]
		effectsServiceWaitX(0.021)
	end
end
function module.SmallMagicBlue(p1230, p1231, p1232, p1233)
	effectsServicePreloadTech(p1230, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
	SmallMagicAttack(p1230, p1231, p1232, p1233, {
		"rbxassetid://5101617624",
		"rbxassetid://5101617720",
		"rbxassetid://5101617832",
		"rbxassetid://5101617978",
		"rbxassetid://5101617497"
	})
end
function module.SmallMagicBlueEffect(p1234, p1235, p1236, _)
	module.SmallMagicBlue(p1234, p1235, p1236, nil, nil)
end
function module.SmallMagicRed(p1238, p1239, p1240, p1241)
	effectsServicePreloadTech(p1238, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
	SmallMagicAttack(p1238, p1239, p1240, p1241, {
		"rbxassetid://5102283475",
		"rbxassetid://5102283693",
		"rbxassetid://5102283932",
		"rbxassetid://5102284289",
		"rbxassetid://5101617497"
	})
end
function module.SmallMagicGreen(p1242, p1243, p1244, p1245)
	effectsServicePreloadTech(p1242, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
	SmallMagicAttack(p1242, p1243, p1244, p1245, {
		"rbxassetid://5102282674",
		"rbxassetid://5102282914",
		"rbxassetid://5102283052",
		"rbxassetid://5102283303",
		"rbxassetid://5101617497"
	})
end
function module.SmallMagicGreenEffect(p1246, p1247, p1248, _)
	module.SmallMagicGreen(p1246, p1247, p1248, nil, nil)
end
function module.SmallMagicYellow(p1250, p1251, p1252, p1253)
	effectsServicePreloadTech(p1250, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
	SmallMagicAttack(p1250, p1251, p1252, p1253, {
		"rbxassetid://5102359881",
		"rbxassetid://5102360039",
		"rbxassetid://5102360251",
		"rbxassetid://5102360496",
		"rbxassetid://5101617497"
	})
end
local function Melee(p1254, p1255, p1256, _, p1258, p1259, p1260, p1261, p1262, p1263, p1264, p1265, p1266, p1267, p1268, p1269, p1270, p1271)
	local n1 = p1256.ZIndex + 10001
	local uDim2 = UDim2.new(0, p1256.AbsoluteSize.X * p1264, 0, p1256.AbsoluteSize.X * p1265)
	local v2438 = uDim2New(0, p1255.AbsolutePosition.X + p1255.AbsoluteSize.X, 0, p1255.AbsolutePosition.Y + p1255.AbsoluteSize.Y / 2)
	local v2439 = effectsServiceNewerCircle(p1254, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = p1259,
		ZIndex = n1,
		Size = uDim2,
		Position = v2438,
		Rotation = p1267
	})

	spawn(function()
		effectsService.NewTweenProperty(v2439, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	audioService.PlaySound(p1261)
	v2438 = uDim2New(0, p1256.AbsolutePosition.X - p1256.AbsoluteSize.X / 2.25, 0, p1256.AbsolutePosition.Y + p1256.AbsoluteSize.Y / 2)
	v2439:TweenPosition(v2438, "Out", "Quart", 0.35 * p1258)
	effectsService.NewTweenProperty(v2439, "Rotation", 0, -190, 0.5 * p1258, "Quart", "Out")
	v2438 = uDim2New(0, p1256.AbsolutePosition.X * 0.99, 0, p1256.AbsolutePosition.Y + p1256.AbsoluteSize.Y / 2)
	v2439:TweenPosition(v2438, "In", "Quart", 0.15 * p1258)

	local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
	local randomNumber = math.random(p1268, p1269)

	effectsServiceNewTweenProperty(v2439, "Rotation", -190, randomNumber, 0.15 * p1258, "Quart", "In")

	if p1258 == 1 then
		local n2 = p1256.ZIndex + 10000
		local uDim2128 = UDim2.new(0, p1256.AbsoluteSize.X * 1.1, 0, p1256.AbsoluteSize.X * 1.1)
		local uDim2129 = UDim2.new(0, p1256.AbsolutePosition.X + p1256.AbsoluteSize.X / 2, 0, p1256.AbsolutePosition.Y + p1256.AbsoluteSize.Y / 2)
		local v2445 = effectsServiceNewerCircle(p1254, {
			Rotation = 45,
			Image = p1260,
			ImageColor3 = p1266,
			ZIndex = n2,
			Size = uDim2128,
			Position = uDim2129
		})

		spawn(function()
			local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
			local randomNumber14 = math.random(p1268, p1269)
			local randomNumber15 = math.random(p1270, p1271)

			effectsServiceNewTweenProperty(v2439, "Rotation", randomNumber14, randomNumber15, 0.1, "Quart", "Out")
		end)
		task.wait(0.3 * p1258) -- FIX: the hit (sound + shake) lands when the swing arrives, not when it starts
		audioService.PlaySound(p1262)
		audioService.PlaySound(p1263)
		effectsService.ShakeBattle(p1254, 0.1, 0.025)
		task.spawn(function()
			effectsService.Shake(v2445, v2445.Position, 0.5, 0.3)
		end)
		task.spawn(function()
			effectsService.Shake(p1256, p1256.Position, 0.4, 0.2)
		end)
		task.wait(0.1) -- (was 0.4: 0.3 of it now happens before the hit, total length unchanged)
		spawn(function()
			effectsService.NewTweenProperty(v2445, "ImageTransparency", 0, 1, 0.4, "Quart")
			v2445:Destroy()
		end)
		spawn(function()
			effectsService.NewTweenProperty(v2439, "ImageTransparency", 0, 1, 0.35, "Quart")
			v2439:Destroy()
		end)
	else
		task.wait(0.3 * p1258) -- FIX: the hit (sound + shake) lands when the swing arrives, not when it starts
		audioService.PlaySound(p1262)
		spawn(function()
			local effectsServiceNewTweenProperty = effectsService.NewTweenProperty
			local randomNumber16 = math.random(p1268, p1269)
			local randomNumber17 = math.random(p1270, p1271)

			effectsServiceNewTweenProperty(v2439, "Rotation", randomNumber16, randomNumber17, 0.075 * p1258, "Quart", "Out")
		end)
		spawn(function()
			effectsService.Shake(p1256, p1256.Position, 0.5 * p1258, 0.3 * p1258)
		end)
		task.wait(math.max(0.5 * p1258 - 0.3 * p1258, 0.05)) -- (the first 0.3 * scale already passed before the hit)
		spawn(function()
			effectsService.NewTweenProperty(v2439, "ImageTransparency", 0, 1, 0.4 * p1258, "Quart")
			v2439:Destroy()
		end)
	end

	wait(0.15)
	wait(0.3 * p1258)
end
function module.LargeHammer(p1272, p1273, p1274, p1275)
	local color3455 = Color3.fromRGB(0, 0, 0)

	Melee(p1272, p1273, p1274, p1275, 1, "rbxassetid://7069337202", "rbxassetid://12168472253", "Woosh", "HammerImpact", "homerun sfx", 1.5, 1.5, color3455, 20, 40, 45, 55, 60)
end
function module.LargeHammerEffect(p1276, p1277, p1278, _)
	module.LargeHammer(p1276, p1277, p1278, nil, nil)
end
function module.MidHammer(p1280, p1281, p1282, p1283)
	local color3456 = Color3.fromRGB(0, 0, 0)

	Melee(p1280, p1281, p1282, p1283, 0.8, "rbxassetid://7069337202", "rbxassetid://12168472253", "Woosh", "HammerImpact", "homerun sfx", 1.25, 1.25, color3456, 20, 40, 45, 55, 60)
end
function module.MidHammerEffect(p1284, p1285, p1286, _)
	module.MidHammer(p1284, p1285, p1286, nil, nil)
end
function module.MidHammerEffectEnemy(p1288, p1289, _, p1291)
	local s1

	if p1291 == "" then
		s1 = "Enemy"
	elseif p1291 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1288.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidHammer(p1288, p1289, v, nil, nil)
		end)
	end
end
function module.MidHammerEffectAll(p1292, p1293, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1292.Parent.BattleNew[v])) do
			spawn(function()
				module.MidHammer(p1292, p1293, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallHammer(p1296, p1297, p1298, p1299)
	local color3457 = Color3.fromRGB(0, 0, 0)

	Melee(p1296, p1297, p1298, p1299, 0.6, "rbxassetid://7069337202", "rbxassetid://12168472253", "Woosh", "Bonk", "homerun sfx", 1.05, 1.05, color3457, 20, 40, 45, 55, 60)
end
function module.SmallHammerEffect(p1300, p1301, p1302, _)
	module.SmallHammer(p1300, p1301, p1302, nil, nil)
end
function module.SmallHammerEffectEnemy(p1304, p1305, _, p1307)
	local s1

	if p1307 == "" then
		s1 = "Enemy"
	elseif p1307 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1304.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.SmallHammer(p1304, p1305, v, nil, nil)
		end)
	end
end
function module.SmallHammerEffectNoYield(p1308, p1309, p1310, _)
	spawn(function()
		module.SmallHammer(p1308, p1309, p1310, nil, nil)
	end)
end
function module.LargeCrowbar(p1312, p1313, p1314, p1315)
	local color3458 = Color3.fromRGB(135, 53, 53)

	Melee(p1312, p1313, p1314, p1315, 1, "rbxassetid://13334911489", "rbxassetid://12168472253", "CrowbarSwing", "HammerImpact", "Crowbar3", 1.5, 1.5, color3458, 20, 40, 45, 55, 60)
end
function module.LargeCrowbarEffect(p1316, p1317, p1318, _)
	module.LargeCrowbar(p1316, p1317, p1318, nil, nil)
end
function module.MidCrowbar(p1320, p1321, p1322, p1323)
	local color3459 = Color3.fromRGB(135, 53, 53)

	Melee(p1320, p1321, p1322, p1323, 0.8, "rbxassetid://13334911489", "rbxassetid://12168472253", "CrowbarSwing", "Crowbar2", "homerun sfx", 1.25, 1.25, color3459, 20, 40, 45, 55, 60)
end
function module.MidCrowbarEffect(p1324, p1325, p1326, _)
	module.MidCrowbar(p1324, p1325, p1326, nil, nil)
end
function module.MidCrowbarEffectEnemy(p1328, p1329, _, p1331)
	local s1

	if p1331 == "" then
		s1 = "Enemy"
	elseif p1331 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1328.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidCrowbar(p1328, p1329, v, nil, nil)
		end)
	end
end
function module.MidCrowbarEffectAll(p1332, p1333, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1332.Parent.BattleNew[v])) do
			spawn(function()
				module.MidCrowbar(p1332, p1333, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallCrowbar(p1336, p1337, p1338, p1339)
	local color3460 = Color3.fromRGB(135, 53, 53)

	Melee(p1336, p1337, p1338, p1339, 0.6, "rbxassetid://13334911489", "rbxassetid://12168472253", "CrowbarSwing", "Crowbar1", "homerun sfx", 1.05, 1.05, color3460, 20, 40, 45, 55, 60)
end
function module.SmallCrowbarEffect(p1340, p1341, p1342, _)
	module.SmallCrowbar(p1340, p1341, p1342, nil, nil)
end
function module.SmallCrowbarEffectEnemy(p1344, p1345, _, p1347)
	local s1

	if p1347 == "" then
		s1 = "Enemy"
	elseif p1347 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1344.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.SmallCrowbar(p1344, p1345, v, nil, nil)
		end)
	end
end
function module.SmallCrowbarEffectNoYield(p1348, p1349, p1350, _)
	spawn(function()
		module.SmallCrowbar(p1348, p1349, p1350, nil, nil)
	end)
end
function module.LargeBat(p1352, p1353, p1354, p1355)
	local color3461 = Color3.fromRGB(88, 84, 79)

	Melee(p1352, p1353, p1354, p1355, 1, "rbxassetid://13334909624", "rbxassetid://12168472253", "BatSwing", "Baseball Bat Hit", "homerun sfx", 1.5, 1.5, color3461, 20, 40, 45, 55, 60)
end
function module.LargeBatEffect(p1356, p1357, p1358, _)
	module.LargeBat(p1356, p1357, p1358, nil, nil)
end
function module.MidBat(p1360, p1361, p1362, p1363)
	local color3462 = Color3.fromRGB(88, 84, 79)

	Melee(p1360, p1361, p1362, p1363, 0.8, "rbxassetid://13334909624", "rbxassetid://12168472253", "BatSwing", "Baseball Bat Hit", "homerun sfx", 1.25, 1.25, color3462, 20, 40, 45, 55, 60)
end
function module.MidBatEffect(p1364, p1365, p1366, _)
	module.MidBat(p1364, p1365, p1366, nil, nil)
end
function module.MidBatEffectEnemy(p1368, p1369, _, p1371)
	local s1

	if p1371 == "" then
		s1 = "Enemy"
	elseif p1371 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1368.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidBat(p1368, p1369, v, nil, nil)
		end)
	end
end
function module.MidBatEffectAll(p1372, p1373, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1372.Parent.BattleNew[v])) do
			spawn(function()
				module.MidBat(p1372, p1373, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallBat(p1376, p1377, p1378, p1379)
	local color3463 = Color3.fromRGB(88, 84, 79)

	Melee(p1376, p1377, p1378, p1379, 0.6, "rbxassetid://13334909624", "rbxassetid://12168472253", "BatSwing", "Bonk", "homerun sfx", 1.05, 1.05, color3463, 20, 40, 45, 55, 60)
end
function module.SmallBatEffect(p1380, p1381, p1382, _)
	module.SmallBat(p1380, p1381, p1382, nil, nil)
end
function module.SmallBatEffectEnemy(p1384, p1385, _, p1387)
	local s1

	if p1387 == "" then
		s1 = "Enemy"
	elseif p1387 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1384.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.SmallBat(p1384, p1385, v, nil, nil)
		end)
	end
end
function module.SmallBatEffectNoYield(p1388, p1389, p1390, _)
	spawn(function()
		module.SmallBat(p1388, p1389, p1390, nil, nil)
	end)
end
function module.LargeHarbinger(p1392, p1393, p1394, p1395)
	local color3464 = Color3.fromRGB(55, 149, 211)

	Melee(p1392, p1393, p1394, p1395, 1, "rbxassetid://12133950743", "rbxassetid://12168472253", "Woosh", "HammerImpact", "Slam", 1.4, 1.9, color3464, 20, 40, 45, 55, 60)
end
function module.LargeHarbingerEffect(p1396, p1397, p1398, _)
	module.LargeHarbinger(p1396, p1397, p1398, nil, nil)
end
function module.MidHarbinger(p1400, p1401, p1402, p1403)
	local color3465 = Color3.fromRGB(55, 149, 211)

	Melee(p1400, p1401, p1402, p1403, 0.8, "rbxassetid://12133950743", "rbxassetid://12168472253", "Woosh", "Slam", "homerun sfx", 1.1, 1.6, color3465, 20, 40, 45, 55, 60)
end
function module.MidHarbingerEffect(p1404, p1405, p1406, _)
	module.MidHarbinger(p1404, p1405, p1406, nil, nil)
end
function module.MidHarbingerEffectEnemy(p1408, p1409, _, p1411)
	local s1

	if p1411 == "" then
		s1 = "Enemy"
	elseif p1411 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1408.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidHarbinger(p1408, p1409, v, nil, nil)
		end)
	end
end
function module.MidHarbingerEffectAll(p1412, p1413, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1412.Parent.BattleNew[v])) do
			spawn(function()
				module.MidHarbinger(p1412, p1413, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallHarbinger(p1416, p1417, p1418, p1419)
	local color3466 = Color3.fromRGB(55, 149, 211)

	Melee(p1416, p1417, p1418, p1419, 0.6, "rbxassetid://12133950743", "rbxassetid://12168472253", "Woosh", "Slam", "homerun sfx", 0.9, 1.4, color3466, 20, 40, 45, 55, 60)
end
function module.SmallHarbingerEffect(p1420, p1421, p1422, _)
	module.SmallHarbinger(p1420, p1421, p1422, nil, nil)
end
function module.SmallHarbingerEffectNoYield(p1424, p1425, p1426, _)
	spawn(function()
		module.SmallHarbinger(p1424, p1425, p1426, nil, nil)
	end)
end
function module.LargeAxe(p1428, p1429, p1430, _, _, _, _)
	local n1 = p1430.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1430.AbsoluteSize.X * 1.5, 0, p1430.AbsoluteSize.X * 1.5)
	local v2667 = uDim2New(0, p1429.AbsolutePosition.X + p1429.AbsoluteSize.X, 0, p1429.AbsolutePosition.Y + p1429.AbsoluteSize.Y / 2)
	local v2668 = effectsServiceNewerCircle(p1428, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281806308",
		Rotation = 20,
		ZIndex = n1,
		Size = uDim2,
		Position = v2667
	})

	spawn(function()
		NewTweenProperty(v2668, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2667 = uDim2New(0, p1430.AbsolutePosition.X - p1430.AbsoluteSize.X / 3, 0, p1430.AbsolutePosition.Y + p1430.AbsoluteSize.Y / 2)
	v2668:TweenPosition(v2667, "Out", "Quart", 0.3)
	NewTweenProperty(v2668, "Rotation", 0, -180, 0.45, "Quart", "Out")
	v2667 = uDim2New(0, p1430.AbsolutePosition.X * 0.99, -0.05, p1430.AbsolutePosition.Y + p1430.AbsoluteSize.Y / 2)
	v2668:TweenPosition(v2667, "In", "Quart", 0.1)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2668, "Rotation", -180, 115, 0.2, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2668, "Rotation", 115, 112, 0.1, "Quart", "Out")
		v2668:Destroy()
	end)
	audioServicePlaySound("LargeSlash")
	effectsService.ShakeBattle(p1428, 0.1, 0.025)

	local n2 = p1430.ZIndex + 1
	local uDim2130 = UDim2.new(0, p1430.AbsoluteSize.X * 1.8, 0, p1430.AbsoluteSize.X * 1.8)
	local uDim2131 = UDim2.new(0, p1430.AbsolutePosition.X + p1430.AbsoluteSize.X / 2, 0, p1430.AbsolutePosition.Y + p1430.AbsoluteSize.Y / 2)
	local v2672 = effectsServiceNewerCircle(p1428, {
		Image = "rbxassetid://5089147697",
		Rotation = -45,
		ZIndex = n2,
		Size = uDim2130,
		Position = uDim2131
	})

	spawn(function()
		effectsService.ShakeSync(v2672, v2672.Position, 0.3, 0.3)
	end)
	effectsService.Shake(p1430, p1430.Position, 0.4, 0.4)
	wait(0.3)
	spawn(function()
		NewTweenProperty(v2672, "ImageTransparency", 0, 1, 0.4, "Quart")
		v2672:Destroy()
	end)
	wait(0.1)
end
function module.LargeAxeEffect(p1435, p1436, p1437, _)
	module.LargeAxe(p1435, p1436, p1437, nil, nil)
end
function module.MidAxe(p1439, p1440, p1441, _, _, _, _)
	local n1 = p1441.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1441.AbsoluteSize.X * 1.2, 0, p1441.AbsoluteSize.X * 1.2)
	local v2686 = uDim2New(0, p1440.AbsolutePosition.X + p1440.AbsoluteSize.X, 0, p1440.AbsolutePosition.Y + p1440.AbsoluteSize.Y / 2)
	local v2687 = effectsServiceNewerCircle(p1439, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281806308",
		ZIndex = n1,
		Size = uDim2,
		Position = v2686
	})

	spawn(function()
		NewTweenProperty(v2687, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2686 = uDim2New(0, p1441.AbsolutePosition.X - p1441.AbsoluteSize.X / 2.5, 0, p1441.AbsolutePosition.Y + p1441.AbsoluteSize.Y / 2.5)
	v2687:TweenPosition(v2686, "Out", "Quart", 0.3)
	NewTweenProperty(v2687, "Rotation", 0, -75, 0.3, "Quart", "Out")
	v2686 = uDim2New(0, p1441.AbsolutePosition.X * 1, -0.02, p1441.AbsolutePosition.Y + p1441.AbsoluteSize.Y / 2)
	v2687:TweenPosition(v2686, "In", "Quart", 0.06)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2687, "Rotation", -85, 75, 0.06, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2687, "Rotation", 75, 72, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("HammerImpact")
	audioServicePlaySound("MidSlash")
	effectsService.Shake(p1441, p1441.Position, 0.2, 0.2)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2687, "ImageTransparency", 0, 1, 0.3, "Quart")
		v2687:Destroy()
	end)
	wait(0.1)
end
function module.MidAxeEffect(p1446, p1447, p1448, _)
	module.MidAxe(p1446, p1447, p1448, nil, nil)
end
function module.MidAxeEffectEnemy(p1450, p1451, _, p1453)
	local s1

	if p1453 == "" then
		s1 = "Enemy"
	elseif p1453 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1450.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidAxe(p1450, p1451, v, nil, nil)
		end)
	end
end
function module.MidAxeEffectAll(p1454, p1455, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1454.Parent.BattleNew[v])) do
			spawn(function()
				module.MidAxe(p1454, p1455, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallAxe(p1458, p1459, p1460, _, _, _, _)
	local n1 = p1460.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1460.AbsoluteSize.X * 1.1, 0, p1460.AbsoluteSize.X * 1.1)
	local v2717 = uDim2New(0, p1459.AbsolutePosition.X + p1459.AbsoluteSize.X, 0, p1459.AbsolutePosition.Y + p1459.AbsoluteSize.Y / 1.75)
	local v2718 = effectsServiceNewerCircle(p1458, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281806308",
		ZIndex = n1,
		Size = uDim2,
		Position = v2717
	})

	spawn(function()
		NewTweenProperty(v2718, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2717 = uDim2New(0, p1460.AbsolutePosition.X - p1460.AbsoluteSize.X / 1.75, 0, p1460.AbsolutePosition.Y + p1460.AbsoluteSize.Y / 1.75)
	v2718:TweenPosition(v2717, "Out", "Quart", 0.2)
	NewTweenProperty(v2718, "Rotation", 0, -60, 0.3, "Quart", "Out")
	v2717 = uDim2New(0, p1460.AbsolutePosition.X * 1, 0, p1460.AbsolutePosition.Y + p1460.AbsoluteSize.Y / 2)
	v2718:TweenPosition(v2717, "Out", "Quart", 0.04)
	NewTweenProperty(v2718, "Rotation", -30, 65, 0.04, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2718, "Rotation", 65, 63, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("SmallSlash")
	effectsService.Shake(p1460, p1460.Position, 0.1, 0.1)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2718, "ImageTransparency", 0, 1, 0.2, "Quart")
		v2718:Destroy()
	end)
	wait(0.1)
end
function module.SmallAxeEffect(p1465, p1466, p1467, _)
	module.SmallAxe(p1465, p1466, p1467, nil, nil)
end
function module.SmallAxeEffectNoYield(p1469, p1470, p1471, _)
	spawn(function()
		module.SmallAxe(p1469, p1470, p1471, nil, nil)
	end)
end
function module.LargeBattleaxe(p1473, p1474, p1475, _, _, _, _)
	local n1 = p1475.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1475.AbsoluteSize.X * 1.5, 0, p1475.AbsoluteSize.X * 1.5)
	local v2736 = uDim2New(0, p1474.AbsolutePosition.X + p1474.AbsoluteSize.X, 0, p1474.AbsolutePosition.Y + p1474.AbsoluteSize.Y / 2)
	local v2737 = effectsServiceNewerCircle(p1473, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281809503",
		Rotation = 20,
		ZIndex = n1,
		Size = uDim2,
		Position = v2736
	})

	spawn(function()
		NewTweenProperty(v2737, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2736 = uDim2New(0, p1475.AbsolutePosition.X - p1475.AbsoluteSize.X / 3, 0, p1475.AbsolutePosition.Y + p1475.AbsoluteSize.Y / 2)
	v2737:TweenPosition(v2736, "Out", "Quart", 0.3)
	NewTweenProperty(v2737, "Rotation", 0, -180, 0.45, "Quart", "Out")
	v2736 = uDim2New(0, p1475.AbsolutePosition.X * 0.99, -0.05, p1475.AbsolutePosition.Y + p1475.AbsoluteSize.Y / 2)
	v2737:TweenPosition(v2736, "In", "Quart", 0.1)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2737, "Rotation", -180, 115, 0.2, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2737, "Rotation", 115, 112, 0.1, "Quart", "Out")
		v2737:Destroy()
	end)
	audioServicePlaySound("LargeSlash")
	effectsService.ShakeBattle(p1473, 0.1, 0.025)

	local n2 = p1475.ZIndex + 1
	local uDim2132 = UDim2.new(0, p1475.AbsoluteSize.X * 2, 0, p1475.AbsoluteSize.X * 2)
	local uDim2133 = UDim2.new(0, p1475.AbsolutePosition.X + p1475.AbsoluteSize.X / 2, 0, p1475.AbsolutePosition.Y + p1475.AbsoluteSize.Y / 2)
	local v2741 = effectsServiceNewerCircle(p1473, {
		Image = "rbxassetid://5089147697",
		Rotation = -45,
		ZIndex = n2,
		Size = uDim2132,
		Position = uDim2133
	})

	spawn(function()
		effectsService.ShakeSync(v2741, v2741.Position, 0.3, 0.3)
	end)
	effectsService.Shake(p1475, p1475.Position, 0.4, 0.4)
	wait(0.3)
	spawn(function()
		NewTweenProperty(v2741, "ImageTransparency", 0, 1, 0.4, "Quart")
		v2741:Destroy()
	end)
	wait(0.1)
end
function module.LargeBattleaxeEffect(p1480, p1481, p1482, _)
	module.LargeBattleaxe(p1480, p1481, p1482, nil, nil)
end
function module.MidBattleaxe(p1484, p1485, p1486, _, _, _, _)
	local n1 = p1486.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1486.AbsoluteSize.X * 1.5, 0, p1486.AbsoluteSize.X * 1.5)
	local v2755 = uDim2New(0, p1485.AbsolutePosition.X + p1485.AbsoluteSize.X, 0, p1485.AbsolutePosition.Y + p1485.AbsoluteSize.Y / 2)
	local v2756 = effectsServiceNewerCircle(p1484, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281809503",
		ZIndex = n1,
		Size = uDim2,
		Position = v2755
	})

	spawn(function()
		NewTweenProperty(v2756, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2755 = uDim2New(0, p1486.AbsolutePosition.X - p1486.AbsoluteSize.X / 2.5, 0, p1486.AbsolutePosition.Y + p1486.AbsoluteSize.Y / 2.5)
	v2756:TweenPosition(v2755, "Out", "Quart", 0.3)
	NewTweenProperty(v2756, "Rotation", 0, -75, 0.3, "Quart", "Out")
	v2755 = uDim2New(0, p1486.AbsolutePosition.X * 1, -0.02, p1486.AbsolutePosition.Y + p1486.AbsoluteSize.Y / 2)
	v2756:TweenPosition(v2755, "In", "Quart", 0.06)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2756, "Rotation", -85, 75, 0.06, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2756, "Rotation", 75, 72, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("HammerImpact")
	audioServicePlaySound("MidSlash")
	effectsService.Shake(p1486, p1486.Position, 0.2, 0.2)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2756, "ImageTransparency", 0, 1, 0.3, "Quart")
		v2756:Destroy()
	end)
	wait(0.1)
end
function module.MidBattleaxeEffect(p1491, p1492, p1493, _)
	module.MidBattleaxe(p1491, p1492, p1493, nil, nil)
end
function module.MidBattleaxeEffectEnemy(p1495, p1496, _, p1498)
	local s1

	if p1498 == "" then
		s1 = "Enemy"
	elseif p1498 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1495.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidBattleaxe(p1495, p1496, v, nil, nil)
		end)
	end
end
function module.MidBattleaxeEffectAll(p1499, p1500, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1499.Parent.BattleNew[v])) do
			spawn(function()
				module.MidBattleaxe(p1499, p1500, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallBattleaxe(p1503, p1504, p1505, _, _, _, _)
	local n1 = p1505.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1505.AbsoluteSize.X * 1.3, 0, p1505.AbsoluteSize.X * 1.3)
	local v2786 = uDim2New(0, p1504.AbsolutePosition.X + p1504.AbsoluteSize.X, 0, p1504.AbsolutePosition.Y + p1504.AbsoluteSize.Y / 2)
	local v2787 = effectsServiceNewerCircle(p1503, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281809503",
		ZIndex = n1,
		Size = uDim2,
		Position = v2786
	})

	spawn(function()
		NewTweenProperty(v2787, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2786 = uDim2New(0, p1505.AbsolutePosition.X - p1505.AbsoluteSize.X / 2.5, 0, p1505.AbsolutePosition.Y + p1505.AbsoluteSize.Y / 2.5)
	v2787:TweenPosition(v2786, "Out", "Quart", 0.3)
	NewTweenProperty(v2787, "Rotation", 0, -75, 0.3, "Quart", "Out")
	v2786 = uDim2New(0, p1505.AbsolutePosition.X * 1, -0.02, p1505.AbsolutePosition.Y + p1505.AbsoluteSize.Y / 2)
	v2787:TweenPosition(v2786, "In", "Quart", 0.06)
	NewTweenProperty(v2787, "Rotation", -85, 75, 0.06, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2787, "Rotation", 75, 72, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("SmallSlash")
	effectsService.Shake(p1505, p1505.Position, 0.1, 0.1)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2787, "ImageTransparency", 0, 1, 0.3, "Quart")
		v2787:Destroy()
	end)
	wait(0.1)
end
function module.SmallBattleaxeEffect(p1510, p1511, p1512, _)
	module.SmallBattleaxe(p1510, p1511, p1512, nil, nil)
end
function module.SmallBattleaxeEffectNoYield(p1514, p1515, p1516, _)
	spawn(function()
		module.SmallBattleaxe(p1514, p1515, p1516, nil, nil)
	end)
end
function module.LargeRedcliffAxe(p1518, p1519, p1520, _, _, _, _)
	local n1 = p1520.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1520.AbsoluteSize.X * 1.7, 0, p1520.AbsoluteSize.X * 1.7)
	local v2805 = uDim2New(0, p1519.AbsolutePosition.X + p1519.AbsoluteSize.X, 0, p1519.AbsolutePosition.Y + p1519.AbsoluteSize.Y / 2)
	local v2806 = effectsServiceNewerCircle(p1518, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281807238",
		Rotation = 20,
		ZIndex = n1,
		Size = uDim2,
		Position = v2805
	})

	spawn(function()
		NewTweenProperty(v2806, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2805 = uDim2New(0, p1520.AbsolutePosition.X - p1520.AbsoluteSize.X / 3, 0, p1520.AbsolutePosition.Y + p1520.AbsoluteSize.Y / 2)
	v2806:TweenPosition(v2805, "Out", "Quart", 0.3)
	NewTweenProperty(v2806, "Rotation", 0, -180, 0.45, "Quart", "Out")
	v2805 = uDim2New(0, p1520.AbsolutePosition.X * 0.99, -0.05, p1520.AbsolutePosition.Y + p1520.AbsoluteSize.Y / 2)
	v2806:TweenPosition(v2805, "In", "Quart", 0.1)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2806, "Rotation", -180, 115, 0.2, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2806, "Rotation", 115, 112, 0.1, "Quart", "Out")
		v2806:Destroy()
	end)
	audioServicePlaySound("LargeSlash")
	effectsService.ShakeBattle(p1518, 0.1, 0.025)

	local n2 = p1520.ZIndex + 1
	local uDim2134 = UDim2.new(0, p1520.AbsoluteSize.X * 1.8, 0, p1520.AbsoluteSize.X * 1.8)
	local uDim2135 = UDim2.new(0, p1520.AbsolutePosition.X + p1520.AbsoluteSize.X / 2, 0, p1520.AbsolutePosition.Y + p1520.AbsoluteSize.Y / 2)
	local v2810 = effectsServiceNewerCircle(p1518, {
		Image = "rbxassetid://5089147697",
		Rotation = -45,
		ZIndex = n2,
		Size = uDim2134,
		Position = uDim2135
	})

	spawn(function()
		effectsService.ShakeSync(v2810, v2810.Position, 0.3, 0.3)
	end)
	effectsService.Shake(p1520, p1520.Position, 0.4, 0.4)
	wait(0.3)
	spawn(function()
		NewTweenProperty(v2810, "ImageTransparency", 0, 1, 0.4, "Quart")
		v2810:Destroy()
	end)
	wait(0.1)
end
function module.LargeRedcliffAxeEffect(p1525, p1526, p1527, _)
	module.LargeRedcliffAxe(p1525, p1526, p1527, nil, nil)
end
function module.MidRedcliffAxe(p1529, p1530, p1531, _, _, _, _)
	local n1 = p1531.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1531.AbsoluteSize.X * 1.4, 0, p1531.AbsoluteSize.X * 1.4)
	local v2824 = uDim2New(0, p1530.AbsolutePosition.X + p1530.AbsoluteSize.X, 0, p1530.AbsolutePosition.Y + p1530.AbsoluteSize.Y / 2)
	local v2825 = effectsServiceNewerCircle(p1529, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281807238",
		ZIndex = n1,
		Size = uDim2,
		Position = v2824
	})

	spawn(function()
		NewTweenProperty(v2825, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2824 = uDim2New(0, p1531.AbsolutePosition.X - p1531.AbsoluteSize.X / 2.5, 0, p1531.AbsolutePosition.Y + p1531.AbsoluteSize.Y / 2.5)
	v2825:TweenPosition(v2824, "Out", "Quart", 0.3)
	NewTweenProperty(v2825, "Rotation", 0, -75, 0.3, "Quart", "Out")
	v2824 = uDim2New(0, p1531.AbsolutePosition.X * 1, -0.02, p1531.AbsolutePosition.Y + p1531.AbsoluteSize.Y / 2)
	v2825:TweenPosition(v2824, "In", "Quart", 0.06)
	audioServicePlaySound("Woosh")
	NewTweenProperty(v2825, "Rotation", -85, 75, 0.06, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2825, "Rotation", 75, 72, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("HammerImpact")
	audioServicePlaySound("MidSlash")
	effectsService.Shake(p1531, p1531.Position, 0.2, 0.2)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2825, "ImageTransparency", 0, 1, 0.3, "Quart")
		v2825:Destroy()
	end)
	wait(0.1)
end
function module.MidRedcliffAxeEffect(p1536, p1537, p1538, _)
	module.MidRedcliffAxe(p1536, p1537, p1538, nil, nil)
end
function module.MidRedcliffAxeEffectEnemy(p1540, p1541, _, p1543)
	local s1

	if p1543 == "" then
		s1 = "Enemy"
	elseif p1543 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1540.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidRedcliffAxe(p1540, p1541, v, nil, nil)
		end)
	end
end
function module.MidRedcliffAxeEffectAll(p1544, p1545, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1544.Parent.BattleNew[v])) do
			spawn(function()
				module.MidRedcliffAxe(p1544, p1545, iterValue, nil, nil)
			end)
		end
	end
end
function module.SmallRedcliffAxe(p1548, p1549, p1550, _, _, _, _)
	local n1 = p1550.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1550.AbsoluteSize.X * 1.1, 0, p1550.AbsoluteSize.X * 1.1)
	local v2855 = uDim2New(0, p1549.AbsolutePosition.X + p1549.AbsoluteSize.X, 0, p1549.AbsolutePosition.Y + p1549.AbsoluteSize.Y / 1.75)
	local v2856 = effectsServiceNewerCircle(p1548, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12281807238",
		ZIndex = n1,
		Size = uDim2,
		Position = v2855
	})

	spawn(function()
		NewTweenProperty(v2856, "ImageTransparency", 1, 0, 0.2, "Quart")
	end)
	v2855 = uDim2New(0, p1550.AbsolutePosition.X - p1550.AbsoluteSize.X / 1.75, 0, p1550.AbsolutePosition.Y + p1550.AbsoluteSize.Y / 1.75)
	v2856:TweenPosition(v2855, "Out", "Quart", 0.2)
	NewTweenProperty(v2856, "Rotation", 0, -60, 0.3, "Quart", "Out")
	v2855 = uDim2New(0, p1550.AbsolutePosition.X * 1, 0, p1550.AbsolutePosition.Y + p1550.AbsoluteSize.Y / 2)
	v2856:TweenPosition(v2855, "Out", "Quart", 0.04)
	NewTweenProperty(v2856, "Rotation", -30, 65, 0.04, "Quart", "In")
	spawn(function()
		NewTweenProperty(v2856, "Rotation", 65, 63, 0.1, "Quart", "Out")
	end)
	audioServicePlaySound("SmallSlash")
	effectsService.Shake(p1550, p1550.Position, 0.1, 0.1)
	wait(0.1)
	spawn(function()
		NewTweenProperty(v2856, "ImageTransparency", 0, 1, 0.2, "Quart")
		v2856:Destroy()
	end)
	wait(0.1)
end
function module.SmallRedcliffAxeEffect(p1555, p1556, p1557, _)
	module.SmallRedcliffAxe(p1555, p1556, p1557, nil, nil)
end
function module.SmallRedcliffAxeEffectNoYield(p1559, p1560, p1561, _)
	spawn(function()
		module.SmallRedcliffAxe(p1559, p1560, p1561, nil, nil)
	end)
end
local function ScytheSwing(p1563, p1564, p1565, _, p1567, p1568, p1569, p1570, p1571, p1572)
	local n1: number = if p1572 then 2 else 1.8
	local n2 = p1565.ZIndex + 10000
	local uDim2 = UDim2.new(0, p1565.AbsoluteSize.X * n1 * p1567, 0, p1565.AbsoluteSize.X * n1 * p1567)
	local v2878 = uDim2New(0, p1564.AbsolutePosition.X + p1564.AbsoluteSize.X, 0, p1564.AbsolutePosition.Y + p1564.AbsoluteSize.Y / 2)
	local v2879 = effectsServiceNewerCircle(p1563, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		Image = p1569,
		ZIndex = n2,
		Size = uDim2,
		Position = v2878
	})

	spawn(function()
		NewTweenProperty(v2879, "ImageTransparency", 1, 0, if p1572 then 0.2 else 0.1, "Quart")
	end)
	audioService.PlaySound(p1570)
	v2878 = uDim2New(0, p1565.AbsolutePosition.X - p1565.AbsoluteSize.X / 1.5, 0, p1565.AbsolutePosition.Y + p1565.AbsoluteSize.Y / 2)
	v2879:TweenPosition(v2878, "Out", "Quart", 0.15 * p1567)
	NewTweenProperty(v2879, "Rotation", 0, 255, 0.4 * p1567, "Quart", "Out")
	v2878 = uDim2New(0, p1565.AbsolutePosition.X * 1.2, 0.02, p1565.AbsolutePosition.Y + p1565.AbsoluteSize.Y / 2)
	v2879:TweenPosition(v2878, "In", "Quart", 0.3 * p1567)
	NewTweenProperty(v2879, "Rotation", 255, -345, 0.4 * p1567, "Quart", "In")

	local v2880 = effectsServiceNewerCircle(p1563, {
		Rotation = 45,
		Image = p1571,
		ImageColor3 = p1568,
		ZIndex = p1565.ZIndex + 10000,
		Size = UDim2.new(0, p1565.AbsoluteSize.X * (if p1572 then 2 else 1.6) * p1567, 0, p1565.AbsoluteSize.X * (if p1572 then 2 else 1.4) * p1567),
		Position = UDim2.new(0, p1565.AbsolutePosition.X + p1565.AbsoluteSize.X / 2, 0, p1565.AbsolutePosition.Y + p1565.AbsoluteSize.Y / 2)
	})

	audioServicePlaySound(p1571)
	task.spawn(function()
		effectsService.ShakeBattleSync(p1563, 0.2 * p1567, 0.025)
		effectsService.ShakeSync(v2880, v2880.Position, 0.3 * p1567, 0.3)
		effectsService.ShakeSync(p1565, p1565.Position, 0.3 * p1567, 0.3)
		task.wait(0.4 * p1567)
	end)
	task.wait(0.4)
	task.spawn(function()
		NewTweenProperty(v2880, "ImageTransparency", 0, 1, 0.4 * p1567, "Quart")
		v2880:Destroy()
	end)
	task.spawn(function()
		NewTweenProperty(v2879, "ImageTransparency", 0, 1, 0.4 * p1567, "Quart")
		v2879:Destroy()
	end)
	wait(0.3)
end
local function createScytheEffect(_, p1574, p1575, p1576, p1577, p1578, p1579, p1580, p1581, p1582, p1583)
	if not p1577 then
		p1577 = nil
	end

	ScytheSwing(p1574, p1575, p1576, p1577, p1578, p1579, p1580, p1581, p1582, p1583)
end
function module.LargeScythe(p1584, p1585, p1586, p1587)
	local largeScythe = module.LargeScythe

	ScytheSwing(p1584, p1585, p1586, p1587 or nil, 1, v2897, "rbxassetid://12250668510", "PreSlash", "LargeSlash", true)
end
function module.LargeScytheEffect(p1588, p1589, p1590, _)
	module.LargeScythe(p1588, p1589, p1590, nil)
end
function module.LargeHollowScythe(p1592, p1593, p1594, p1595)
	local largeHollowScythe = module.LargeHollowScythe

	ScytheSwing(p1592, p1593, p1594, p1595 or nil, 1, v2907, "rbxassetid://12250671528", "PreSlash", "LargeSlash", true)
end
function module.LargeHollowScytheEffect(p1596, p1597, p1598, _)
	module.LargeHollowScythe(p1596, p1597, p1598, nil)
end
function module.LargeRedScythe(p1600, p1601, p1602, p1603)
	local largeRedScythe = module.LargeRedScythe

	ScytheSwing(p1600, p1601, p1602, p1603 or nil, 1, v2917, "rbxassetid://12250670315", "PreSlash", "LargeSlash", true)
end
function module.LargeRedScytheEffect(p1604, p1605, p1606, _)
	module.LargeRedScythe(p1604, p1605, p1606, nil)
end
function module.LargeSkeleScythe(p1608, p1609, p1610, p1611)
	local largeSkeleScythe = module.LargeSkeleScythe

	ScytheSwing(p1608, p1609, p1610, p1611 or nil, 1, v2927, "rbxassetid://12250667748", "PreSlash", "LargeSlash", true)
end
function module.LargeSkeleScytheEffect(p1612, p1613, p1614, _)
	module.LargeSkeleScythe(p1612, p1613, p1614, nil)
end
function module.FireWeaponEffect(p1616, p1617, p1618, p1619)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3467 = Color3.fromRGB(240, 99, 43)
	local color3468 = Color3.fromRGB(217, 66, 39)
	local color3469 = Color3.fromRGB(240, 191, 65)
	local color3470 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathAttack(p1616, p1617, p1618, p1619, 110, effectsServiceBreathimagesFire, "FireBreath", 0.7, color3467, color3468, color3469, color3470, 1.1, 0.9)
end
function module.FireWeaponEffectSmall(p1620, p1621, p1622, p1623)
	local effectsServiceBreathimagesFire = effectsServiceBreathimages.fire
	local color3471 = Color3.fromRGB(240, 99, 43)
	local color3472 = Color3.fromRGB(217, 66, 39)
	local color3473 = Color3.fromRGB(240, 191, 65)
	local color3474 = Color3.fromRGB(240, 64, 11)

	effectsServiceBreathAttack(p1620, p1621, p1622, p1623, 100, effectsServiceBreathimagesFire, "FireBreath", 0.4, color3471, color3472, color3473, color3474, 1.1, 0.9)
end
function module.LargeMoltenScythe(p1624, p1625, p1626, p1627)
	task.spawn(function()
		local largeMoltenScythe = module.LargeMoltenScythe

		ScytheSwing(p1624, p1625, p1626, p1627 or nil, 1, v4457, "rbxassetid://12281810855", "rbxassetid://5089147697", "PreSlash", "LargeSlash")
		wait(0.25)
	end)
	task.spawn(function()
		effectsServiceWaitX(0.6)
		module.FireWeaponEffect(p1624, p1626, p1626, p1627)
		effectsServiceWaitX(0.6)
	end)
	wait(1.25)
end
function module.LargeMoltenScytheEffect(p1628, p1629, p1630, _)
	module.LargeMoltenScythe(p1628, p1629, p1630, nil)
end
function module.MidScythe(p1632, p1633, p1634, p1635)
	local midScythe = module.MidScythe

	ScytheSwing(p1632, p1633, p1634, p1635 or nil, 1, v2963, "rbxassetid://12250668510", "PreSlash", "MidSlash", false)
end
function module.MidScytheEffect(p1636, p1637, p1638, _)
	module.MidScythe(p1636, p1637, p1638, nil)
end
function module.MidScytheEffectEnemy(p1640, p1641, _, p1643)
	local s1

	if p1643 == "" then
		s1 = "Enemy"
	elseif p1643 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1640.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidScythe(p1640, p1641, v, nil)
		end)
	end
end
function module.MidScytheEffectAll(p1644, p1645, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1644.Parent.BattleNew[v])) do
			spawn(function()
				module.MidScythe(p1644, p1645, iterValue, nil)
			end)
		end
	end
end
function module.MidHollowScythe(p1648, p1649, p1650, p1651)
	local midHollowScythe = module.MidHollowScythe

	ScytheSwing(p1648, p1649, p1650, p1651 or nil, 1, v2989, "rbxassetid://12250671528", "PreSlash", "MidSlash", false)
end
function module.MidHollowScytheEffect(p1652, p1653, p1654, _)
	module.MidHollowScythe(p1652, p1653, p1654, nil)
end
function module.MidHollowScytheEffectEnemy(p1656, p1657, _, p1659)
	local s1

	if p1659 == "" then
		s1 = "Enemy"
	elseif p1659 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in pairs(_G.__NoFaces(p1656.Parent.BattleNew[s1 .. "Field"])) do
		spawn(function()
			module.MidHollowScythe(p1656, p1657, v, nil)
		end)
	end
end
function module.MidHollowScytheEffectAll(p1660, p1661, _, _)
	for _, v in pairs({ "Field", "EnemyField" }) do
		for _, iterValue in pairs(_G.__NoFaces(p1660.Parent.BattleNew[v])) do
			spawn(function()
				module.MidHollowScythe(p1660, p1661, iterValue, nil)
			end)
		end
	end
end
function module.MidRedScythe(p1664, p1665, p1666, p1667)
	local midRedScythe = module.MidRedScythe

	ScytheSwing(p1664, p1665, p1666, p1667 or nil, 1, v3015, "rbxassetid://12250670315", "PreSlash", "MidSlash", false)
end
function module.MidRedScytheEffect(p1668, p1669, p1670, _)
	module.MidRedScythe(p1668, p1669, p1670, nil)
end
function module.MidSkeleScythe(p1672, p1673, p1674, p1675)
	local midSkeleScythe = module.MidSkeleScythe

	ScytheSwing(p1672, p1673, p1674, p1675 or nil, 1, v3025, "rbxassetid://12250667748", "PreSlash", "MidSlash", true)
end
function module.MidSkeleScytheEffect(p1676, p1677, p1678, _)
	module.MidSkeleScythe(p1676, p1677, p1678, nil)
end
function module.SmallScythe(p1680, p1681, p1682, p1683)
	local smallScythe = module.SmallScythe

	ScytheSwing(p1680, p1681, p1682, p1683 or nil, 0.75, v3035, "rbxassetid://12250668510", "PreSlash", "SmallSlash", false)
end
function module.SmallScytheEffect(p1684, p1685, p1686, _)
	module.SmallScythe(p1684, p1685, p1686, nil)
end
function module.SmallHollowScythe(p1688, p1689, p1690, p1691)
	local smallHollowScythe = module.SmallHollowScythe

	ScytheSwing(p1688, p1689, p1690, p1691 or nil, 0.75, v3045, "rbxassetid://12250671528", "PreSlash", "SmallSlash", false)
end
function module.SmallHollowScytheEffect(p1692, p1693, p1694, _)
	module.SmallHollowScythe(p1692, p1693, p1694, nil)
end
function module.SmallRedScythe(p1696, p1697, p1698, p1699)
	local smallRedScythe = module.SmallRedScythe

	ScytheSwing(p1696, p1697, p1698, p1699 or nil, 0.75, v3055, "rbxassetid://12250670315", "PreSlash", "SmallSlash", false)
end
function module.SmallRedScytheEffect(p1700, p1701, p1702, _)
	module.SmallRedScythe(p1700, p1701, p1702, nil)
end
function module.SmallSkeleScythe(p1704, p1705, p1706, p1707)
	local smallSkeleScythe = module.SmallSkeleScythe

	ScytheSwing(p1704, p1705, p1706, p1707 or nil, 0.75, v3065, "rbxassetid://12250667748", "PreSlash", "SmallSlash", true)
end
function module.SmallSkeleScytheEffect(p1708, p1709, p1710, _)
	module.SmallSkeleScythe(p1708, p1709, p1710, nil)
end
local function SFOTHAttack(p1712, _, p1714, _, p1716, p1717, p1718, p1719, p1720, p1721, p1722, p1723, p1724, p1725, p1726)
	local n1 = p1714.ZIndex + 10000
	local v3086 = uDim2New(0, p1714.AbsoluteSize.X * p1719, 0, p1714.AbsoluteSize.X * p1719)
	local uDim2 = UDim2.new(0, p1714.AbsolutePosition.X, 0, p1714.AbsolutePosition.Y)
	local uDim2136 = UDim2.new(0, p1714.AbsoluteSize.X * 0.5, 0, p1714.AbsoluteSize.Y * 0.5)
	local v3089 = effectsServiceNewerCircle(p1712, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		ZIndex = n1,
		Image = p1717,
		ImageColor3 = p1718,
		Size = v3086,
		Rotation = p1726,
		Position = uDim2 + uDim2136
	})
	local v3090 = v3089.Position
	local v3091 = v3089.Position

	v3086 = UDim2.fromOffset(v3089.AbsoluteSize.X / 6, v3089.AbsoluteSize.X / 6)
	v3089.Position = v3091 - v3086

	local n2 = p1714.ZIndex + 10000
	local v3093 = uDim2New(0, p1714.AbsoluteSize.X * p1721, 0, p1714.AbsoluteSize.X * p1721)

	v3091 = effectsServiceNewerCircle(p1712, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = -245,
		ZIndex = n2,
		Image = p1720,
		Size = v3093,
		Position = v3089.Position
	})

	if p1716 == 1 then
		audioServicePlaySound("unsheath")
		effectsServiceWaitX(0.1)
		audioServicePlaySound(p1723)
		animation.AnimateAsync(v3091, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
		animation.AnimateAsync(v3091, { Rotation = -390 }, 0.45, "Out", "Quart")

		local animationAnimate = animation.Animate
		local v3095 = UDim2.fromOffset(v3089.AbsoluteSize.X / 1.5, v3089.AbsoluteSize.X / 1.5)

		animationAnimate(v3091, { Position = v3095 + v3089.Position }, 0.3, "Out", "Quart")
		audioServicePlaySound(p1722)
		animation.AnimateAsync(v3091, { Rotation = -415 }, 0.3, "In", "Quint")

		local animate = animation.Animate

		v3095 = UDim2.fromOffset(v3089.AbsoluteSize.X / 5, v3089.AbsoluteSize.X / 5)
		animate(v3091, { Position = v3095 + v3089.Position }, 0.2, "In", "Quad")
		effectsService.ShakeBattleSync(p1712, 0.5, 0.025)

		local v3097 = p1714.Position
		local v3098 = p1714.Position
		local v3099 = UDim2.fromOffset(p1714.AbsoluteSize.X / 4, p1714.AbsoluteSize.X / 4)

		p1714.Position = v3098 - v3099
		audioServicePlaySound(p1724)
		v3089.ImageTransparency = 0
		v3089.Size = UDim2.new(0, p1714.AbsoluteSize.X * 1.75, 0, p1714.AbsoluteSize.X * 1.75)
		v3098 = v3089.Position
		v3099 = v3089.Position

		local v3100 = UDim2.fromOffset(v3089.AbsoluteSize.X / 6, v3089.AbsoluteSize.X / 6)

		v3089.Position = v3099 + v3100
		v3091:Destroy()
		animation.AnimateAsync(p1714, { Position = v3097 }, 0.8, "Out", "Quint")

		local animationAnimateAsync = animation.AnimateAsync
		local v3102 = UDim2.fromOffset(v3089.AbsoluteSize.X / 6, v3089.AbsoluteSize.X / 6)

		animationAnimateAsync(v3089, { Position = v3098 + v3102 }, 0.25, "Out", "Quint")
		effectsServiceWaitX(0.55 / p1725)
		task.spawn(function()
			animation.Animate(v3089, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
			v3089:Destroy()
		end)
		effectsServiceWaitX(0.4 / p1725)
		wait(0.2)

		return
	end

	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3091, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3091, { Rotation = 100 }, 0.35, "Out", "Quart")

	local v3103 = animation.Animate
	local v3104 = v3089.Position
	local v3105 = UDim2.fromOffset(v3089.AbsoluteSize.X / 4, v3089.AbsoluteSize.X / 4)

	v3103(v3091, { Position = v3104 - v3105 }, 0.25, "Out", "Quart")
	audioServicePlaySound(p1722)
	animation.AnimateAsync(v3091, { Rotation = -135 }, 0.15, "In", "Quint")

	local v3106 = animation.Animate

	v3104 = v3089.Position
	v3105 = UDim2.fromOffset(v3089.AbsoluteSize.X / 6, v3089.AbsoluteSize.X / 6)
	v3106(v3091, { Position = v3104 - v3105 }, 0.1, "In", "Quad")
	v3091:Destroy()
	audioServicePlaySound(p1723)
	v3086 = p1714.Position

	local v3107 = p1714.Position
	local v3108 = UDim2.fromOffset(p1714.AbsoluteSize.X / 5, p1714.AbsoluteSize.X / 5)

	p1714.Position = v3107 + v3108
	animation.AnimateAsync(p1714, { Position = v3086 }, 0.4, "Out", "Quart")
	v3089.ImageTransparency = 0
	v3086 = v3089.Position
	v3107 = v3089.Position
	v3108 = UDim2.fromOffset(v3089.AbsoluteSize.X / 30, v3089.AbsoluteSize.X / 30)
	v3089.Position = v3107 - v3108

	local animateAsync = animation.AnimateAsync

	v3105 = UDim2.fromOffset(v3089.AbsoluteSize.X / 6, v3089.AbsoluteSize.X / 6)
	animateAsync(v3089, { Position = v3086 + v3105 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.45 / p1725)
	task.spawn(function()
		animation.Animate(v3089, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3089:Destroy()
	end)
	effectsServiceWaitX(0.3 / p1725)
	wait(0.25)
end
function module.SmallLinkedSword(p1727, p1728, p1729, p1730)
	local color3475 = Color3.fromRGB(79, 126, 188)

	SFOTHAttack(p1727, p1728, p1729, p1730, 0, "rbxassetid://12210189896", color3475, 1.5, "rbxassetid://12192587180", 2, "Lunge", "SmallSlash", "LargeSlash", 2.15, 90)
end
function module.MidLinkedSword(p1731, p1732, p1733, p1734)
	local color3476 = Color3.fromRGB(79, 126, 188)

	SFOTHAttack(p1731, p1732, p1733, p1734, 0, "rbxassetid://12210189896", color3476, 1.85, "rbxassetid://12192587180", 2.25, "Lunge", "SmallSlash", "LargeSlash", 1.8, 45)
end
function module.LargeLinkedSword(p1735, p1736, p1737, p1738)
	local color3477 = Color3.fromRGB(79, 126, 188)

	SFOTHAttack(p1735, p1736, p1737, p1738, 1, "rbxassetid://12210189896", color3477, 2.2, "rbxassetid://12192587180", 2.25, "Lunge", "SmallSlash", "LargeSlash", 1.6, 105)
end
function module.SmallFirebrand(p1739, _, p1741, _)
	local n1 = p1741.ZIndex + 10000
	local color3478 = Color3.fromRGB(188, 26, 11)
	local v3131 = uDim2New(0, p1741.AbsoluteSize.X * 1.45, 0, p1741.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1741.AbsolutePosition.X, 0, p1741.AbsolutePosition.Y)
	local uDim2137 = UDim2.new(0, p1741.AbsoluteSize.X * 0.5, 0, p1741.AbsoluteSize.Y * 0.5)
	local v3134 = effectsServiceNewerCircle(p1739, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3478,
		Size = v3131,
		Position = uDim2 + uDim2137
	})
	local v3135 = v3134.Position
	local v3136 = v3134.Position

	v3131 = UDim2.fromOffset(v3134.AbsoluteSize.X / 6, v3134.AbsoluteSize.X / 6)
	v3134.Position = v3136 - v3131

	local n2 = p1741.ZIndex + 10000
	local v3138 = uDim2New(0, p1741.AbsoluteSize.X * 1.85, 0, p1741.AbsoluteSize.X * 1.85)

	v3135 = effectsServiceNewerCircle(p1739, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206796531",
		Rotation = -245,
		ZIndex = n2,
		Size = v3138,
		Position = v3134.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3135, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3135, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3140 = v3134.Position
	local v3141 = UDim2.fromOffset(v3134.AbsoluteSize.X / 4, v3134.AbsoluteSize.X / 4)

	animationAnimate(v3135, { Position = v3140 - v3141 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3135, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3140 = v3134.Position
	v3141 = UDim2.fromOffset(v3134.AbsoluteSize.X / 6, v3134.AbsoluteSize.X / 6)
	animate(v3135, { Position = v3140 - v3141 }, 0.1, "In", "Quad")
	v3135:Destroy()
	audioServicePlaySound("SmallSlash")
	v3135 = p1741.Position
	v3136 = p1741.Position
	v3131 = UDim2.fromOffset(p1741.AbsoluteSize.X / 5, p1741.AbsoluteSize.X / 5)
	p1741.Position = v3136 + v3131
	animation.AnimateAsync(p1741, { Position = v3135 }, 0.4, "Out", "Quart")
	v3134.ImageTransparency = 0
	v3135 = v3134.Position
	v3136 = v3134.Position
	v3131 = UDim2.fromOffset(v3134.AbsoluteSize.X / 30, v3134.AbsoluteSize.X / 30)
	v3134.Position = v3136 - v3131

	local animationAnimateAsync = animation.AnimateAsync

	v3140 = UDim2.fromOffset(v3134.AbsoluteSize.X / 6, v3134.AbsoluteSize.X / 6)
	animationAnimateAsync(v3134, { Position = v3135 + v3140 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3134, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3134:Destroy()
	end)
end
function module.MidFirebrand(p1743, _, p1745, p1746)
	local n1 = p1745.ZIndex + 10000
	local color3479 = Color3.fromRGB(188, 26, 11)
	local v3150 = uDim2New(0, p1745.AbsoluteSize.X * 1.75, 0, p1745.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1745.AbsolutePosition.X, 0, p1745.AbsolutePosition.Y)
	local uDim2138 = UDim2.new(0, p1745.AbsoluteSize.X * 0.5, 0, p1745.AbsoluteSize.Y * 0.5)
	local v3153 = effectsServiceNewerCircle(p1743, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3479,
		Size = v3150,
		Position = uDim2 + uDim2138
	})
	local v3154 = v3153.Position
	local v3155 = v3153.Position

	v3150 = UDim2.fromOffset(v3153.AbsoluteSize.X / 6, v3153.AbsoluteSize.X / 6)
	v3153.Position = v3155 - v3150

	local n2 = p1745.ZIndex + 10000
	local v3157 = uDim2New(0, p1745.AbsoluteSize.X * 2, 0, p1745.AbsoluteSize.X * 2)

	v3154 = effectsServiceNewerCircle(p1743, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206796531",
		Rotation = -245,
		ZIndex = n2,
		Size = v3157,
		Position = v3153.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3154, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3154, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3159 = v3153.Position
	local v3160 = UDim2.fromOffset(v3153.AbsoluteSize.X / 4, v3153.AbsoluteSize.X / 4)

	animationAnimate(v3154, { Position = v3159 - v3160 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		effectsServiceWaitX(0.1)
		module.FireWeaponEffectSmall(p1743, p1745, p1745, p1746)
	end)
	animation.AnimateAsync(v3154, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3159 = v3153.Position
	v3160 = UDim2.fromOffset(v3153.AbsoluteSize.X / 6, v3153.AbsoluteSize.X / 6)
	animate(v3154, { Position = v3159 - v3160 }, 0.1, "In", "Quad")
	v3154:Destroy()
	audioServicePlaySound("SmallSlash")
	v3154 = p1745.Position
	v3155 = p1745.Position
	v3150 = UDim2.fromOffset(p1745.AbsoluteSize.X / 5, p1745.AbsoluteSize.X / 5)
	p1745.Position = v3155 + v3150
	animation.AnimateAsync(p1745, { Position = v3154 }, 0.4, "Out", "Quart")
	v3153.ImageTransparency = 0
	v3154 = v3153.Position
	v3155 = v3153.Position
	v3150 = UDim2.fromOffset(v3153.AbsoluteSize.X / 30, v3153.AbsoluteSize.X / 30)
	v3153.Position = v3155 - v3150

	local animationAnimateAsync = animation.AnimateAsync

	v3159 = UDim2.fromOffset(v3153.AbsoluteSize.X / 6, v3153.AbsoluteSize.X / 6)
	animationAnimateAsync(v3153, { Position = v3154 + v3159 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.3)
	task.spawn(function()
		animation.Animate(v3153, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3153:Destroy()
	end)
	effectsServiceWaitX(0.1)
end
function module.LargeFirebrand(p1747, _, p1749, p1750)
	local n1 = p1749.ZIndex + 10000
	local color3480 = Color3.fromRGB(188, 26, 11)
	local v3169 = uDim2New(0, p1749.AbsoluteSize.X * 1.5, 0, p1749.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1749.AbsolutePosition.X, 0, p1749.AbsolutePosition.Y)
	local uDim2139 = UDim2.new(0, p1749.AbsoluteSize.X * 0.5, 0, p1749.AbsoluteSize.Y * 0.5)
	local v3172 = effectsServiceNewerCircle(p1747, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3480,
		Size = v3169,
		Position = uDim2 + uDim2139
	})
	local v3173 = v3172.Position
	local v3174 = v3172.Position

	v3169 = UDim2.fromOffset(v3172.AbsoluteSize.X / 3, v3172.AbsoluteSize.X / 3)
	v3172.Position = v3174 - v3169

	local n2 = p1749.ZIndex + 10000
	local v3176 = uDim2New(0, p1749.AbsoluteSize.X * 2.25, 0, p1749.AbsoluteSize.X * 2.25)

	v3173 = effectsServiceNewerCircle(p1747, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206796531",
		Rotation = -245,
		ZIndex = n2,
		Size = v3176,
		Position = v3172.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3173, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3173, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3178 = UDim2.fromOffset(v3172.AbsoluteSize.X / 1, v3172.AbsoluteSize.X / 1)

	animationAnimate(v3173, { Position = v3178 + v3172.Position }, 0.3, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		effectsServiceWaitX(0.1)
		module.FireWeaponEffect(p1747, p1749, p1749, p1750)
	end)
	animation.AnimateAsync(v3173, { Rotation = -415 }, 0.3, "In", "Quint")

	local animate = animation.Animate

	v3178 = UDim2.fromOffset(v3172.AbsoluteSize.X / 3, v3172.AbsoluteSize.X / 3)
	animate(v3173, { Position = v3178 + v3172.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1747, 0.5, 0.025)
	v3174 = p1749.Position
	v3169 = p1749.Position
	v3176 = UDim2.fromOffset(p1749.AbsoluteSize.X / 4, p1749.AbsoluteSize.X / 4)
	p1749.Position = v3169 - v3176
	audioServicePlaySound("LargeSlash")
	v3172.ImageTransparency = 0
	v3172.Size = UDim2.new(0, p1749.AbsoluteSize.X * 1.75, 0, p1749.AbsoluteSize.X * 1.75)
	v3169 = v3172.Position
	v3176 = v3172.Position

	local v3180 = UDim2.fromOffset(v3172.AbsoluteSize.X / 6, v3172.AbsoluteSize.X / 6)

	v3172.Position = v3176 + v3180
	v3173:Destroy()
	animation.AnimateAsync(p1749, { Position = v3174 }, 1.25, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local v3182 = UDim2.fromOffset(v3172.AbsoluteSize.X / 6, v3172.AbsoluteSize.X / 6)

	animationAnimateAsync(v3172, { Position = v3169 + v3182 }, 0.3, "Out", "Quint")
	effectsServiceWaitX(0.35)
	task.spawn(function()
		animation.Animate(v3172, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3172:Destroy()
	end)
	wait(0.2)
end
function module.SmallVenomshank(p1751, _, p1753, _)
	local n1 = p1753.ZIndex + 10000
	local color3481 = Color3.fromRGB(77, 218, 64)
	local v3189 = uDim2New(0, p1753.AbsoluteSize.X * 1.45, 0, p1753.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1753.AbsolutePosition.X, 0, p1753.AbsolutePosition.Y)
	local uDim2140 = UDim2.new(0, p1753.AbsoluteSize.X * 0.5, 0, p1753.AbsoluteSize.Y * 0.5)
	local v3192 = effectsServiceNewerCircle(p1751, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3481,
		Size = v3189,
		Position = uDim2 + uDim2140
	})
	local v3193 = v3192.Position
	local v3194 = v3192.Position

	v3189 = UDim2.fromOffset(v3192.AbsoluteSize.X / 6, v3192.AbsoluteSize.X / 6)
	v3192.Position = v3194 - v3189

	local n2 = p1753.ZIndex + 10000
	local v3196 = uDim2New(0, p1753.AbsoluteSize.X * 1.85, 0, p1753.AbsoluteSize.X * 1.85)

	v3193 = effectsServiceNewerCircle(p1751, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206797533",
		Rotation = -245,
		ZIndex = n2,
		Size = v3196,
		Position = v3192.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3193, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3193, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3198 = v3192.Position
	local v3199 = UDim2.fromOffset(v3192.AbsoluteSize.X / 4, v3192.AbsoluteSize.X / 4)

	animationAnimate(v3193, { Position = v3198 - v3199 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3193, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3198 = v3192.Position
	v3199 = UDim2.fromOffset(v3192.AbsoluteSize.X / 6, v3192.AbsoluteSize.X / 6)
	animate(v3193, { Position = v3198 - v3199 }, 0.1, "In", "Quad")
	v3193:Destroy()
	audioServicePlaySound("SmallSlash")
	v3193 = p1753.Position
	v3194 = p1753.Position
	v3189 = UDim2.fromOffset(p1753.AbsoluteSize.X / 5, p1753.AbsoluteSize.X / 5)
	p1753.Position = v3194 + v3189
	animation.AnimateAsync(p1753, { Position = v3193 }, 0.4, "Out", "Quart")
	v3192.ImageTransparency = 0
	v3193 = v3192.Position
	v3194 = v3192.Position
	v3189 = UDim2.fromOffset(v3192.AbsoluteSize.X / 30, v3192.AbsoluteSize.X / 30)
	v3192.Position = v3194 - v3189

	local animationAnimateAsync = animation.AnimateAsync

	v3198 = UDim2.fromOffset(v3192.AbsoluteSize.X / 6, v3192.AbsoluteSize.X / 6)
	animationAnimateAsync(v3192, { Position = v3193 + v3198 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3192, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3192:Destroy()
	end)
end
function module.MidVenomshank(p1755, _, p1757, p1758)
	local n1 = p1757.ZIndex + 10000
	local color3482 = Color3.fromRGB(77, 218, 64)
	local v3208 = uDim2New(0, p1757.AbsoluteSize.X * 1.75, 0, p1757.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1757.AbsolutePosition.X, 0, p1757.AbsolutePosition.Y)
	local uDim2141 = UDim2.new(0, p1757.AbsoluteSize.X * 0.5, 0, p1757.AbsoluteSize.Y * 0.5)
	local v3211 = effectsServiceNewerCircle(p1755, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3482,
		Size = v3208,
		Position = uDim2 + uDim2141
	})
	local v3212 = v3211.Position
	local v3213 = v3211.Position

	v3208 = UDim2.fromOffset(v3211.AbsoluteSize.X / 6, v3211.AbsoluteSize.X / 6)
	v3211.Position = v3213 - v3208

	local n2 = p1757.ZIndex + 10000
	local v3215 = uDim2New(0, p1757.AbsoluteSize.X * 2, 0, p1757.AbsoluteSize.X * 2)

	v3212 = effectsServiceNewerCircle(p1755, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206797533",
		Rotation = -245,
		ZIndex = n2,
		Size = v3215,
		Position = v3211.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3212, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3212, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3217 = v3211.Position
	local v3218 = UDim2.fromOffset(v3211.AbsoluteSize.X / 4, v3211.AbsoluteSize.X / 4)

	animationAnimate(v3212, { Position = v3217 - v3218 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		effectsServiceWaitX(0.2)

		local color3483 = Color3.fromRGB(102, 225, 113)
		local color3484 = Color3.fromRGB(57, 163, 69)
		local color3485 = Color3.fromRGB(48, 135, 48)
		local color3486 = Color3.fromRGB(68, 247, 80)

		effectsServiceBreathAttack(p1755, p1757, p1757, p1758, 70, "rbxassetid://1249690853", "Bubbling", 0.7, color3483, color3484, color3485, color3486, 0.7, 0.6)
	end)
	animation.AnimateAsync(v3212, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3217 = v3211.Position
	v3218 = UDim2.fromOffset(v3211.AbsoluteSize.X / 6, v3211.AbsoluteSize.X / 6)
	animate(v3212, { Position = v3217 - v3218 }, 0.1, "In", "Quad")
	v3212:Destroy()
	audioServicePlaySound("SmallSlash")
	v3212 = p1757.Position
	v3213 = p1757.Position
	v3208 = UDim2.fromOffset(p1757.AbsoluteSize.X / 5, p1757.AbsoluteSize.X / 5)
	p1757.Position = v3213 + v3208
	animation.AnimateAsync(p1757, { Position = v3212 }, 0.4, "Out", "Quart")
	v3211.ImageTransparency = 0
	v3212 = v3211.Position
	v3213 = v3211.Position
	v3208 = UDim2.fromOffset(v3211.AbsoluteSize.X / 30, v3211.AbsoluteSize.X / 30)
	v3211.Position = v3213 - v3208

	local animationAnimateAsync = animation.AnimateAsync

	v3217 = UDim2.fromOffset(v3211.AbsoluteSize.X / 6, v3211.AbsoluteSize.X / 6)
	animationAnimateAsync(v3211, { Position = v3212 + v3217 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.3)
	task.spawn(function()
		animation.Animate(v3211, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3211:Destroy()
	end)
end
function module.LargeVenomshank(p1759, _, p1761, p1762)
	local n1 = p1761.ZIndex + 10000
	local color3487 = Color3.fromRGB(77, 218, 64)
	local v3227 = uDim2New(0, p1761.AbsoluteSize.X * 1.5, 0, p1761.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1761.AbsolutePosition.X, 0, p1761.AbsolutePosition.Y)
	local uDim2142 = UDim2.new(0, p1761.AbsoluteSize.X * 0.5, 0, p1761.AbsoluteSize.Y * 0.5)
	local v3230 = effectsServiceNewerCircle(p1759, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3487,
		Size = v3227,
		Position = uDim2 + uDim2142
	})
	local v3231 = v3230.Position
	local v3232 = v3230.Position

	v3227 = UDim2.fromOffset(v3230.AbsoluteSize.X / 3, v3230.AbsoluteSize.X / 3)
	v3230.Position = v3232 - v3227

	local n2 = p1761.ZIndex + 10000
	local v3234 = uDim2New(0, p1761.AbsoluteSize.X * 2.25, 0, p1761.AbsoluteSize.X * 2.25)

	v3231 = effectsServiceNewerCircle(p1759, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206797533",
		Rotation = -245,
		ZIndex = n2,
		Size = v3234,
		Position = v3230.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3231, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3231, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3236 = UDim2.fromOffset(v3230.AbsoluteSize.X / 1, v3230.AbsoluteSize.X / 1)

	animationAnimate(v3231, { Position = v3236 + v3230.Position }, 0.3, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		effectsServiceWaitX(0.2)

		local color3488 = Color3.fromRGB(102, 225, 113)
		local color3489 = Color3.fromRGB(57, 163, 69)
		local color3490 = Color3.fromRGB(48, 135, 48)
		local color3491 = Color3.fromRGB(68, 247, 80)

		effectsServiceBreathAttack(p1759, p1761, p1761, p1762, 70, "rbxassetid://1249690853", "Bubbling", 0.7, color3488, color3489, color3490, color3491, 0.7, 0.6)
	end)
	animation.AnimateAsync(v3231, { Rotation = -415 }, 0.3, "In", "Quint")

	local animate = animation.Animate

	v3236 = UDim2.fromOffset(v3230.AbsoluteSize.X / 3, v3230.AbsoluteSize.X / 3)
	animate(v3231, { Position = v3236 + v3230.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1759, 0.5, 0.025)
	v3232 = p1761.Position
	v3227 = p1761.Position
	v3234 = UDim2.fromOffset(p1761.AbsoluteSize.X / 4, p1761.AbsoluteSize.X / 4)
	p1761.Position = v3227 - v3234
	audioServicePlaySound("LargeSlash")
	v3230.ImageTransparency = 0
	v3230.Size = UDim2.new(0, p1761.AbsoluteSize.X * 1.75, 0, p1761.AbsoluteSize.X * 1.75)
	v3227 = v3230.Position
	v3234 = v3230.Position

	local v3238 = UDim2.fromOffset(v3230.AbsoluteSize.X / 6, v3230.AbsoluteSize.X / 6)

	v3230.Position = v3234 + v3238
	v3231:Destroy()
	animation.AnimateAsync(p1761, { Position = v3232 }, 1.25, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local v3240 = UDim2.fromOffset(v3230.AbsoluteSize.X / 6, v3230.AbsoluteSize.X / 6)

	animationAnimateAsync(v3230, { Position = v3227 + v3240 }, 0.3, "Out", "Quint")
	effectsServiceWaitX(0.35)
	task.spawn(function()
		animation.Animate(v3230, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3230:Destroy()
	end)
end
function module.SmallWindforce(p1763, _, p1765, _)
	local n1 = p1765.ZIndex + 10000
	local color3492 = Color3.fromRGB(93, 220, 255)
	local v3247 = uDim2New(0, p1765.AbsoluteSize.X * 1.45, 0, p1765.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1765.AbsolutePosition.X, 0, p1765.AbsolutePosition.Y)
	local uDim2143 = UDim2.new(0, p1765.AbsoluteSize.X * 0.5, 0, p1765.AbsoluteSize.Y * 0.5)
	local v3250 = effectsServiceNewerCircle(p1763, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3492,
		Size = v3247,
		Position = uDim2 + uDim2143
	})
	local v3251 = v3250.Position
	local v3252 = v3250.Position

	v3247 = UDim2.fromOffset(v3250.AbsoluteSize.X / 6, v3250.AbsoluteSize.X / 6)
	v3250.Position = v3252 - v3247

	local n2 = p1765.ZIndex + 10000
	local v3254 = uDim2New(0, p1765.AbsoluteSize.X * 1.85, 0, p1765.AbsoluteSize.X * 1.85)

	v3251 = effectsServiceNewerCircle(p1763, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206798023",
		Rotation = -245,
		ZIndex = n2,
		Size = v3254,
		Position = v3250.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3251, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3251, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3256 = v3250.Position
	local v3257 = UDim2.fromOffset(v3250.AbsoluteSize.X / 4, v3250.AbsoluteSize.X / 4)

	animationAnimate(v3251, { Position = v3256 - v3257 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3251, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3256 = v3250.Position
	v3257 = UDim2.fromOffset(v3250.AbsoluteSize.X / 6, v3250.AbsoluteSize.X / 6)
	animate(v3251, { Position = v3256 - v3257 }, 0.1, "In", "Quad")
	v3251:Destroy()
	audioServicePlaySound("SmallSlash")
	v3251 = p1765.Position
	v3252 = p1765.Position
	v3247 = UDim2.fromOffset(p1765.AbsoluteSize.X / 5, p1765.AbsoluteSize.X / 5)
	p1765.Position = v3252 + v3247
	animation.AnimateAsync(p1765, { Position = v3251 }, 0.4, "Out", "Quart")
	v3250.ImageTransparency = 0
	v3251 = v3250.Position
	v3252 = v3250.Position
	v3247 = UDim2.fromOffset(v3250.AbsoluteSize.X / 30, v3250.AbsoluteSize.X / 30)
	v3250.Position = v3252 - v3247

	local animationAnimateAsync = animation.AnimateAsync

	v3256 = UDim2.fromOffset(v3250.AbsoluteSize.X / 6, v3250.AbsoluteSize.X / 6)
	animationAnimateAsync(v3250, { Position = v3251 + v3256 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3250, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3250:Destroy()
	end)
end
function module.MidWindforce(p1767, _, p1769, p1770)
	local n1 = p1769.ZIndex + 10000
	local color3493 = Color3.fromRGB(93, 220, 255)
	local v3266 = uDim2New(0, p1769.AbsoluteSize.X * 1.75, 0, p1769.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1769.AbsolutePosition.X, 0, p1769.AbsolutePosition.Y)
	local uDim2144 = UDim2.new(0, p1769.AbsoluteSize.X * 0.5, 0, p1769.AbsoluteSize.Y * 0.5)
	local v3269 = effectsServiceNewerCircle(p1767, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3493,
		Size = v3266,
		Position = uDim2 + uDim2144
	})
	local v3270 = v3269.Position
	local v3271 = v3269.Position

	v3266 = UDim2.fromOffset(v3269.AbsoluteSize.X / 6, v3269.AbsoluteSize.X / 6)
	v3269.Position = v3271 - v3266

	local n2 = p1769.ZIndex + 10000
	local v3273 = uDim2New(0, p1769.AbsoluteSize.X * 2, 0, p1769.AbsoluteSize.X * 2)

	v3270 = effectsServiceNewerCircle(p1767, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206798023",
		Rotation = -245,
		ZIndex = n2,
		Size = v3273,
		Position = v3269.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3270, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3270, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3275 = v3269.Position
	local v3276 = UDim2.fromOffset(v3269.AbsoluteSize.X / 4, v3269.AbsoluteSize.X / 4)

	animationAnimate(v3270, { Position = v3275 - v3276 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		wait(0.3)
		module.SmallStorm(p1767, p1769, p1769, p1770)
	end)
	animation.AnimateAsync(v3270, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3275 = v3269.Position
	v3276 = UDim2.fromOffset(v3269.AbsoluteSize.X / 6, v3269.AbsoluteSize.X / 6)
	animate(v3270, { Position = v3275 - v3276 }, 0.1, "In", "Quad")
	v3270:Destroy()
	audioServicePlaySound("SmallSlash")
	v3270 = p1769.Position
	v3271 = p1769.Position
	v3266 = UDim2.fromOffset(p1769.AbsoluteSize.X / 5, p1769.AbsoluteSize.X / 5)
	p1769.Position = v3271 + v3266
	animation.AnimateAsync(p1769, { Position = v3270 }, 0.4, "Out", "Quart")
	v3269.ImageTransparency = 0
	v3270 = v3269.Position
	v3271 = v3269.Position
	v3266 = UDim2.fromOffset(v3269.AbsoluteSize.X / 30, v3269.AbsoluteSize.X / 30)
	v3269.Position = v3271 - v3266

	local animationAnimateAsync = animation.AnimateAsync

	v3275 = UDim2.fromOffset(v3269.AbsoluteSize.X / 6, v3269.AbsoluteSize.X / 6)
	animationAnimateAsync(v3269, { Position = v3270 + v3275 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.3)
	task.spawn(function()
		animation.Animate(v3269, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3269:Destroy()
	end)
	wait(0.35)
end
function module.LargeWindforce(p1771, _, p1773, p1774)
	local n1 = p1773.ZIndex + 10000
	local color3494 = Color3.fromRGB(93, 220, 255)
	local v3285 = uDim2New(0, p1773.AbsoluteSize.X * 1.5, 0, p1773.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1773.AbsolutePosition.X, 0, p1773.AbsolutePosition.Y)
	local uDim2145 = UDim2.new(0, p1773.AbsoluteSize.X * 0.5, 0, p1773.AbsoluteSize.Y * 0.5)
	local v3288 = effectsServiceNewerCircle(p1771, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3494,
		Size = v3285,
		Position = uDim2 + uDim2145
	})
	local v3289 = v3288.Position
	local v3290 = v3288.Position

	v3285 = UDim2.fromOffset(v3288.AbsoluteSize.X / 3, v3288.AbsoluteSize.X / 3)
	v3288.Position = v3290 - v3285

	local n2 = p1773.ZIndex + 10000
	local v3292 = uDim2New(0, p1773.AbsoluteSize.X * 2.25, 0, p1773.AbsoluteSize.X * 2.25)

	v3289 = effectsServiceNewerCircle(p1771, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206798023",
		Rotation = -245,
		ZIndex = n2,
		Size = v3292,
		Position = v3288.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3289, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3289, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3294 = UDim2.fromOffset(v3288.AbsoluteSize.X / 1, v3288.AbsoluteSize.X / 1)

	animationAnimate(v3289, { Position = v3294 + v3288.Position }, 0.3, "Out", "Quart")
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(v3289, { Rotation = -415 }, 0.3, "In", "Quint")
	task.spawn(function()
		wait(0.35)
		module.MidStorm(p1771, p1773, p1773, p1774)
	end)

	local animate = animation.Animate

	v3294 = UDim2.fromOffset(v3288.AbsoluteSize.X / 3, v3288.AbsoluteSize.X / 3)
	animate(v3289, { Position = v3294 + v3288.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1771, 0.5, 0.025)
	v3290 = p1773.Position
	v3285 = p1773.Position
	v3292 = UDim2.fromOffset(p1773.AbsoluteSize.X / 4, p1773.AbsoluteSize.X / 4)
	p1773.Position = v3285 - v3292
	audioServicePlaySound("LargeSlash")
	v3288.ImageTransparency = 0
	v3288.Size = UDim2.new(0, p1773.AbsoluteSize.X * 1.75, 0, p1773.AbsoluteSize.X * 1.75)
	v3285 = v3288.Position
	v3292 = v3288.Position

	local v3296 = UDim2.fromOffset(v3288.AbsoluteSize.X / 6, v3288.AbsoluteSize.X / 6)

	v3288.Position = v3292 + v3296
	v3289:Destroy()
	animation.AnimateAsync(p1773, { Position = v3290 }, 0.5, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local v3298 = UDim2.fromOffset(v3288.AbsoluteSize.X / 6, v3288.AbsoluteSize.X / 6)

	animationAnimateAsync(v3288, { Position = v3285 + v3298 }, 0.3, "Out", "Quint")
	effectsServiceWaitX(0.35)
	task.spawn(function()
		animation.Animate(v3288, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3288:Destroy()
	end)
	wait(0.45)
end
function module.SmallDarkheart(p1775, _, p1777, _)
	local n1 = p1777.ZIndex + 10000
	local color3495 = Color3.fromRGB(59, 59, 59)
	local v3305 = uDim2New(0, p1777.AbsoluteSize.X * 1.45, 0, p1777.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1777.AbsolutePosition.X, 0, p1777.AbsolutePosition.Y)
	local uDim2146 = UDim2.new(0, p1777.AbsoluteSize.X * 0.5, 0, p1777.AbsoluteSize.Y * 0.5)
	local v3308 = effectsServiceNewerCircle(p1775, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3495,
		Size = v3305,
		Position = uDim2 + uDim2146
	})
	local v3309 = v3308.Position
	local v3310 = v3308.Position

	v3305 = UDim2.fromOffset(v3308.AbsoluteSize.X / 6, v3308.AbsoluteSize.X / 6)
	v3308.Position = v3310 - v3305

	local n2 = p1777.ZIndex + 10000
	local v3312 = uDim2New(0, p1777.AbsoluteSize.X * 1.85, 0, p1777.AbsoluteSize.X * 1.85)

	v3309 = effectsServiceNewerCircle(p1775, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206795975",
		Rotation = -245,
		ZIndex = n2,
		Size = v3312,
		Position = v3308.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3309, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3309, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3314 = v3308.Position
	local v3315 = UDim2.fromOffset(v3308.AbsoluteSize.X / 4, v3308.AbsoluteSize.X / 4)

	animationAnimate(v3309, { Position = v3314 - v3315 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3309, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3314 = v3308.Position
	v3315 = UDim2.fromOffset(v3308.AbsoluteSize.X / 6, v3308.AbsoluteSize.X / 6)
	animate(v3309, { Position = v3314 - v3315 }, 0.1, "In", "Quad")
	v3309:Destroy()
	audioServicePlaySound("SmallSlash")
	v3309 = p1777.Position
	v3310 = p1777.Position
	v3305 = UDim2.fromOffset(p1777.AbsoluteSize.X / 5, p1777.AbsoluteSize.X / 5)
	p1777.Position = v3310 + v3305
	animation.AnimateAsync(p1777, { Position = v3309 }, 0.4, "Out", "Quart")
	v3308.ImageTransparency = 0
	v3309 = v3308.Position
	v3310 = v3308.Position
	v3305 = UDim2.fromOffset(v3308.AbsoluteSize.X / 30, v3308.AbsoluteSize.X / 30)
	v3308.Position = v3310 - v3305

	local animationAnimateAsync = animation.AnimateAsync

	v3314 = UDim2.fromOffset(v3308.AbsoluteSize.X / 6, v3308.AbsoluteSize.X / 6)
	animationAnimateAsync(v3308, { Position = v3309 + v3314 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3308, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3308:Destroy()
	end)
end
function module.MidDarkheart(p1779, _, p1781, _)
	local n1 = p1781.ZIndex + 10001
	local color3496 = Color3.fromRGB(59, 59, 59)
	local v3324 = uDim2New(0, p1781.AbsoluteSize.X * 1.75, 0, p1781.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1781.AbsolutePosition.X, 0, p1781.AbsolutePosition.Y)
	local uDim2147 = UDim2.new(0, p1781.AbsoluteSize.X * 0.5, 0, p1781.AbsoluteSize.Y * 0.5)
	local v3327 = effectsServiceNewerCircle(p1779, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3496,
		Size = v3324,
		Position = uDim2 + uDim2147
	})
	local v3328 = v3327.Position
	local v3329 = v3327.Position

	v3324 = UDim2.fromOffset(v3327.AbsoluteSize.X / 6, v3327.AbsoluteSize.X / 6)
	v3327.Position = v3329 - v3324

	local n2 = p1781.ZIndex + 10000
	local v3331 = uDim2New(0, p1781.AbsoluteSize.X * 2, 0, p1781.AbsoluteSize.X * 2)

	v3328 = effectsServiceNewerCircle(p1779, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206795975",
		Rotation = -245,
		ZIndex = n2,
		Size = v3331,
		Position = v3327.Position
	})
	v3324 = { Color3.fromRGB(220, 225, 231), Color3.fromRGB(43, 43, 43) }
	n1 = p1781.ZIndex + 10000
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3328, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3328, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3333 = v3327.Position
	local v3334 = UDim2.fromOffset(v3327.AbsoluteSize.X / 4, v3327.AbsoluteSize.X / 4)

	animationAnimate(v3328, { Position = v3333 - v3334 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(v3328, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3333 = v3327.Position
	v3334 = UDim2.fromOffset(v3327.AbsoluteSize.X / 6, v3327.AbsoluteSize.X / 6)
	animate(v3328, { Position = v3333 - v3334 }, 0.1, "In", "Quad")
	v3328:Destroy()

	local t45: {[any]: any} = {
		Time = 0.6,
		FlashTime = 0.5,
		Color = v3324,
		Transparency = 0.01,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServicePulse(p1779, p1781, t45)
		effectsServiceWaitX(0.1)
	end)
	audioServicePlaySound("SmallSlash")
	v3328 = p1781.Position
	v3324 = p1781.Position
	v3331 = UDim2.fromOffset(p1781.AbsoluteSize.X / 5, p1781.AbsoluteSize.X / 5)
	p1781.Position = v3324 + v3331
	animation.AnimateAsync(p1781, { Position = v3328 }, 0.4, "Out", "Quart")
	v3327.ImageTransparency = 0
	v3328 = v3327.Position
	v3324 = v3327.Position
	v3331 = UDim2.fromOffset(v3327.AbsoluteSize.X / 30, v3327.AbsoluteSize.X / 30)
	v3327.Position = v3324 - v3331

	local animationAnimateAsync = animation.AnimateAsync

	v3333 = UDim2.fromOffset(v3327.AbsoluteSize.X / 6, v3327.AbsoluteSize.X / 6)
	animationAnimateAsync(v3327, { Position = v3328 + v3333 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.25)
	task.spawn(function()
		animation.Animate(v3327, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3327:Destroy()
	end)
	wait(0.2)
end
function module.LargeDarkheart(p1783, _, p1785, _)
	local n1 = p1785.ZIndex + 10001
	local color3497 = Color3.fromRGB(59, 59, 59)
	local v3344 = uDim2New(0, p1785.AbsoluteSize.X * 1.5, 0, p1785.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1785.AbsolutePosition.X, 0, p1785.AbsolutePosition.Y)
	local uDim2148 = UDim2.new(0, p1785.AbsoluteSize.X * 0.5, 0, p1785.AbsoluteSize.Y * 0.5)
	local v3347 = effectsServiceNewerCircle(p1783, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3497,
		Size = v3344,
		Position = uDim2 + uDim2148
	})
	local v3348 = v3347.Position
	local v3349 = v3347.Position

	v3344 = UDim2.fromOffset(v3347.AbsoluteSize.X / 3, v3347.AbsoluteSize.X / 3)
	v3347.Position = v3349 - v3344

	local n2 = p1785.ZIndex + 10000
	local v3351 = uDim2New(0, p1785.AbsoluteSize.X * 2.25, 0, p1785.AbsoluteSize.X * 2.25)

	v3348 = effectsServiceNewerCircle(p1783, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206795975",
		Rotation = -45,
		ZIndex = n2,
		Size = v3351,
		Position = v3347.Position
	})
	v3344 = { Color3.fromRGB(220, 225, 231), Color3.fromRGB(43, 43, 43) }
	n1 = p1785.ZIndex + 10000

	local v3352 = p1785.Position

	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3348, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3348, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3354 = UDim2.fromOffset(v3347.AbsoluteSize.X / 1, v3347.AbsoluteSize.X / 1)

	animationAnimate(v3348, { Position = v3354 + v3347.Position }, 0.4, "Out", "Quart")
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(v3348, { Rotation = -415 }, 0.3, "In", "Quint")

	local animate = animation.Animate

	v3354 = UDim2.fromOffset(v3347.AbsoluteSize.X / 3, v3347.AbsoluteSize.X / 3)
	animate(v3348, { Position = v3354 + v3347.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1783, 0.5, 0.025)

	local t46: {[any]: any} = {
		Time = 0.6,
		FlashTime = 0.5,
		Color = v3344,
		Transparency = 0.01,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServicePulse(p1783, p1785, t46)
		effectsServiceWaitX(0.2)
	end)
	v3351 = p1785.Position

	local v3357 = UDim2.fromOffset(p1785.AbsoluteSize.X / 4, p1785.AbsoluteSize.X / 4)

	p1785.Position = v3351 - v3357
	audioServicePlaySound("LargeSlash")
	v3347.ImageTransparency = 0
	v3347.Size = UDim2.new(0, p1785.AbsoluteSize.X * 1.75, 0, p1785.AbsoluteSize.X * 1.75)

	local v3358 = v3347.Position

	v3357 = v3347.Position

	local v3359 = UDim2.fromOffset(v3347.AbsoluteSize.X / 7, v3347.AbsoluteSize.X / 7)

	v3347.Position = v3357 + v3359
	v3348:Destroy()
	task.spawn(function()
		effectsServiceWaitX(0.15)
		animation.AnimateAsync(p1785, { Position = v3352 }, 0.7, "Out", "Quart")

		local animationAnimateAsync = animation.AnimateAsync
		local v4467 = UDim2.fromOffset(v3347.AbsoluteSize.X / 6, v3347.AbsoluteSize.X / 6)

		animationAnimateAsync(v3347, { Position = v3358 + v4467 }, 0.3, "Out", "Quint")
		effectsServiceWaitX(0.25)
		animation.Animate(v3347, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3347:Destroy()
	end)
	wait(0.2)
end
function module.SmallGhostwalker(p1787, _, p1789, _)
	local n1 = p1789.ZIndex + 10000
	local color3498 = Color3.fromRGB(167, 167, 167)
	local v3366 = uDim2New(0, p1789.AbsoluteSize.X * 1.45, 0, p1789.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1789.AbsolutePosition.X, 0, p1789.AbsolutePosition.Y)
	local uDim2149 = UDim2.new(0, p1789.AbsoluteSize.X * 0.5, 0, p1789.AbsoluteSize.Y * 0.5)
	local v3369 = effectsServiceNewerCircle(p1787, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3498,
		Size = v3366,
		Position = uDim2 + uDim2149
	})
	local v3370 = v3369.Position
	local v3371 = v3369.Position

	v3366 = UDim2.fromOffset(v3369.AbsoluteSize.X / 6, v3369.AbsoluteSize.X / 6)
	v3369.Position = v3371 - v3366

	local n2 = p1789.ZIndex + 10000
	local v3373 = uDim2New(0, p1789.AbsoluteSize.X * 1.85, 0, p1789.AbsoluteSize.X * 1.85)

	v3370 = effectsServiceNewerCircle(p1787, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206799361",
		Rotation = -245,
		ZIndex = n2,
		Size = v3373,
		Position = v3369.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3370, { ImageTransparency = 0.3 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3370, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3375 = v3369.Position
	local v3376 = UDim2.fromOffset(v3369.AbsoluteSize.X / 4, v3369.AbsoluteSize.X / 4)

	animationAnimate(v3370, { Position = v3375 - v3376 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3370, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3375 = v3369.Position
	v3376 = UDim2.fromOffset(v3369.AbsoluteSize.X / 6, v3369.AbsoluteSize.X / 6)
	animate(v3370, { Position = v3375 - v3376 }, 0.1, "In", "Quad")
	v3370:Destroy()
	audioServicePlaySound("SmallSlash")
	v3370 = p1789.Position
	v3371 = p1789.Position
	v3366 = UDim2.fromOffset(p1789.AbsoluteSize.X / 5, p1789.AbsoluteSize.X / 5)
	p1789.Position = v3371 + v3366
	animation.AnimateAsync(p1789, { Position = v3370 }, 0.4, "Out", "Quart")
	v3369.ImageTransparency = 0.5
	v3370 = v3369.Position
	v3371 = v3369.Position
	v3366 = UDim2.fromOffset(v3369.AbsoluteSize.X / 30, v3369.AbsoluteSize.X / 30)
	v3369.Position = v3371 - v3366

	local animationAnimateAsync = animation.AnimateAsync

	v3375 = UDim2.fromOffset(v3369.AbsoluteSize.X / 6, v3369.AbsoluteSize.X / 6)
	animationAnimateAsync(v3369, { Position = v3370 + v3375 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3369, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3369:Destroy()
	end)
end
function module.MidGhostwalker(p1791, _, p1793, _)
	local n1 = p1793.ZIndex + 10001
	local color3499 = Color3.fromRGB(167, 167, 167)
	local v3385 = uDim2New(0, p1793.AbsoluteSize.X * 1.75, 0, p1793.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1793.AbsolutePosition.X, 0, p1793.AbsolutePosition.Y)
	local uDim2150 = UDim2.new(0, p1793.AbsoluteSize.X * 0.5, 0, p1793.AbsoluteSize.Y * 0.5)
	local v3388 = effectsServiceNewerCircle(p1791, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3499,
		Size = v3385,
		Position = uDim2 + uDim2150
	})
	local v3389 = v3388.Position
	local v3390 = v3388.Position

	v3385 = UDim2.fromOffset(v3388.AbsoluteSize.X / 6, v3388.AbsoluteSize.X / 6)
	v3388.Position = v3390 - v3385

	local n2 = p1793.ZIndex + 10000
	local v3392 = uDim2New(0, p1793.AbsoluteSize.X * 2, 0, p1793.AbsoluteSize.X * 2)

	v3389 = effectsServiceNewerCircle(p1791, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206799361",
		Rotation = -245,
		ZIndex = n2,
		Size = v3392,
		Position = v3388.Position
	})
	v3385 = { Color3.fromRGB(220, 225, 231), Color3.fromRGB(202, 202, 202) }
	n1 = p1793.ZIndex + 10000
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	animation.AnimateAsync(v3389, { ImageTransparency = 0.3 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3389, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3394 = v3388.Position
	local v3395 = UDim2.fromOffset(v3388.AbsoluteSize.X / 4, v3388.AbsoluteSize.X / 4)

	animationAnimate(v3389, { Position = v3394 - v3395 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	audioServicePlaySound("Spooky")
	animation.AnimateAsync(v3389, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3394 = v3388.Position
	v3395 = UDim2.fromOffset(v3388.AbsoluteSize.X / 6, v3388.AbsoluteSize.X / 6)
	animate(v3389, { Position = v3394 - v3395 }, 0.1, "In", "Quad")
	v3389:Destroy()

	local t47: {[any]: any} = {
		Time = 0.6,
		FlashTime = 0.5,
		Color = v3385,
		Transparency = 0.6,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServicePulse(p1791, p1793, t47)
		effectsServiceWaitX(0.2)
	end)
	audioServicePlaySound("SmallSlash")
	v3389 = p1793.Position
	v3385 = p1793.Position
	v3392 = UDim2.fromOffset(p1793.AbsoluteSize.X / 5, p1793.AbsoluteSize.X / 5)
	p1793.Position = v3385 + v3392
	animation.AnimateAsync(p1793, { Position = v3389 }, 0.4, "Out", "Quart")
	v3388.ImageTransparency = 0.5
	v3389 = v3388.Position
	v3385 = v3388.Position
	v3392 = UDim2.fromOffset(v3388.AbsoluteSize.X / 30, v3388.AbsoluteSize.X / 30)
	v3388.Position = v3385 - v3392

	local animationAnimateAsync = animation.AnimateAsync

	v3394 = UDim2.fromOffset(v3388.AbsoluteSize.X / 6, v3388.AbsoluteSize.X / 6)
	animationAnimateAsync(v3388, { Position = v3389 + v3394 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.25)
	task.spawn(function()
		animation.Animate(v3388, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3388:Destroy()
	end)
	wait(0.25)
end
function module.LargeGhostwalker(p1795, _, p1797, _)
	local n1 = p1797.ZIndex + 10001
	local color3500 = Color3.fromRGB(167, 167, 167)
	local v3405 = uDim2New(0, p1797.AbsoluteSize.X * 1.5, 0, p1797.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1797.AbsolutePosition.X, 0, p1797.AbsolutePosition.Y)
	local uDim2151 = UDim2.new(0, p1797.AbsoluteSize.X * 0.5, 0, p1797.AbsoluteSize.Y * 0.5)
	local v3408 = effectsServiceNewerCircle(p1795, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3500,
		Size = v3405,
		Position = uDim2 + uDim2151
	})
	local v3409 = v3408.Position
	local v3410 = v3408.Position

	v3405 = UDim2.fromOffset(v3408.AbsoluteSize.X / 3, v3408.AbsoluteSize.X / 3)
	v3408.Position = v3410 - v3405

	local n2 = p1797.ZIndex + 10000
	local v3412 = uDim2New(0, p1797.AbsoluteSize.X * 2.25, 0, p1797.AbsoluteSize.X * 2.25)

	v3409 = effectsServiceNewerCircle(p1795, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12206799361",
		Rotation = -45,
		ZIndex = n2,
		Size = v3412,
		Position = v3408.Position
	})
	v3405 = { Color3.fromRGB(220, 225, 231), Color3.fromRGB(202, 202, 202) }
	n1 = p1797.ZIndex + 10000

	local v3413 = p1797.Position

	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3409, { ImageTransparency = 0.3 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3409, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3415 = UDim2.fromOffset(v3408.AbsoluteSize.X / 1, v3408.AbsoluteSize.X / 1)

	animationAnimate(v3409, { Position = v3415 + v3408.Position }, 0.4, "Out", "Quart")
	audioServicePlaySound("Lunge")
	audioServicePlaySound("Spooky2")
	animation.AnimateAsync(v3409, { Rotation = -415 }, 0.3, "In", "Quint")

	local animate = animation.Animate

	v3415 = UDim2.fromOffset(v3408.AbsoluteSize.X / 3, v3408.AbsoluteSize.X / 3)
	animate(v3409, { Position = v3415 + v3408.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1795, 0.5, 0.025)

	local t48: {[any]: any} = {
		Time = 0.6,
		FlashTime = 0.5,
		Color = v3405,
		Transparency = 0.6,
		ZIndex = n1
	}

	task.spawn(function()
		effectsServicePulse(p1795, p1797, t48)
		effectsServiceWaitX(0.2)
	end)
	v3412 = p1797.Position

	local v3418 = UDim2.fromOffset(p1797.AbsoluteSize.X / 4, p1797.AbsoluteSize.X / 4)

	p1797.Position = v3412 - v3418
	audioServicePlaySound("LargeSlash")
	v3408.ImageTransparency = 0.5
	v3408.Size = UDim2.new(0, p1797.AbsoluteSize.X * 1.75, 0, p1797.AbsoluteSize.X * 1.75)

	local v3419 = v3408.Position

	v3418 = v3408.Position

	local v3420 = UDim2.fromOffset(v3408.AbsoluteSize.X / 7, v3408.AbsoluteSize.X / 7)

	v3408.Position = v3418 + v3420
	v3409:Destroy()
	task.spawn(function()
		effectsServiceWaitX(0.15)
		animation.AnimateAsync(p1797, { Position = v3413 }, 0.7, "Out", "Quart")

		local animationAnimateAsync = animation.AnimateAsync
		local v4469 = UDim2.fromOffset(v3408.AbsoluteSize.X / 6, v3408.AbsoluteSize.X / 6)

		animationAnimateAsync(v3408, { Position = v3419 + v4469 }, 0.3, "Out", "Quint")
		effectsServiceWaitX(0.25)
		animation.Animate(v3408, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3408:Destroy()
	end)
	wait(0.45)
end
function module.SmallIllumina(p1799, _, p1801, _)
	local n1 = p1801.ZIndex + 10000
	local color3501 = Color3.fromRGB(200, 169, 254)
	local v3427 = uDim2New(0, p1801.AbsoluteSize.X * 1.45, 0, p1801.AbsoluteSize.X * 1.45)
	local uDim2 = UDim2.new(0, p1801.AbsolutePosition.X, 0, p1801.AbsolutePosition.Y)
	local uDim2152 = UDim2.new(0, p1801.AbsoluteSize.X * 0.5, 0, p1801.AbsoluteSize.Y * 0.5)
	local v3430 = effectsServiceNewerCircle(p1799, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 90,
		ZIndex = n1,
		ImageColor3 = color3501,
		Size = v3427,
		Position = uDim2 + uDim2152
	})
	local v3431 = v3430.Position
	local v3432 = v3430.Position

	v3427 = UDim2.fromOffset(v3430.AbsoluteSize.X / 6, v3430.AbsoluteSize.X / 6)
	v3430.Position = v3432 - v3427

	local n2 = p1801.ZIndex + 10000
	local v3434 = uDim2New(0, p1801.AbsoluteSize.X * 1.85, 0, p1801.AbsoluteSize.X * 1.85)

	v3431 = effectsServiceNewerCircle(p1799, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210187575",
		Rotation = -245,
		ZIndex = n2,
		Size = v3434,
		Position = v3430.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3431, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3431, { Rotation = -10 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3436 = v3430.Position
	local v3437 = UDim2.fromOffset(v3430.AbsoluteSize.X / 4, v3430.AbsoluteSize.X / 4)

	animationAnimate(v3431, { Position = v3436 - v3437 }, 0.25, "Out", "Quart")
	animation.AnimateAsync(v3431, { Rotation = -45 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3436 = v3430.Position
	v3437 = UDim2.fromOffset(v3430.AbsoluteSize.X / 6, v3430.AbsoluteSize.X / 6)
	animate(v3431, { Position = v3436 - v3437 }, 0.1, "In", "Quad")
	v3431:Destroy()
	audioServicePlaySound("SmallSlash")
	v3431 = p1801.Position
	v3432 = p1801.Position
	v3427 = UDim2.fromOffset(p1801.AbsoluteSize.X / 5, p1801.AbsoluteSize.X / 5)
	p1801.Position = v3432 + v3427
	animation.AnimateAsync(p1801, { Position = v3431 }, 0.4, "Out", "Quart")
	v3430.ImageTransparency = 0
	v3431 = v3430.Position
	v3432 = v3430.Position
	v3427 = UDim2.fromOffset(v3430.AbsoluteSize.X / 30, v3430.AbsoluteSize.X / 30)
	v3430.Position = v3432 - v3427

	local animationAnimateAsync = animation.AnimateAsync

	v3436 = UDim2.fromOffset(v3430.AbsoluteSize.X / 6, v3430.AbsoluteSize.X / 6)
	animationAnimateAsync(v3430, { Position = v3431 + v3436 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		animation.Animate(v3430, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3430:Destroy()
	end)
end
function module.MidIllumina(p1803, _, p1805, p1806)
	local n1 = p1805.ZIndex + 10000
	local color3502 = Color3.fromRGB(200, 169, 254)
	local v3446 = uDim2New(0, p1805.AbsoluteSize.X * 1.75, 0, p1805.AbsoluteSize.X * 1.75)
	local uDim2 = UDim2.new(0, p1805.AbsolutePosition.X, 0, p1805.AbsolutePosition.Y)
	local uDim2153 = UDim2.new(0, p1805.AbsoluteSize.X * 0.5, 0, p1805.AbsoluteSize.Y * 0.5)
	local v3449 = effectsServiceNewerCircle(p1803, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 45,
		ZIndex = n1,
		ImageColor3 = color3502,
		Size = v3446,
		Position = uDim2 + uDim2153
	})
	local v3450 = v3449.Position
	local v3451 = v3449.Position

	v3446 = UDim2.fromOffset(v3449.AbsoluteSize.X / 6, v3449.AbsoluteSize.X / 6)
	v3449.Position = v3451 - v3446

	local n2 = p1805.ZIndex + 10000
	local v3453 = uDim2New(0, p1805.AbsoluteSize.X * 2, 0, p1805.AbsoluteSize.X * 2)

	v3450 = effectsServiceNewerCircle(p1803, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210187575",
		Rotation = -245,
		ZIndex = n2,
		Size = v3453,
		Position = v3449.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.2)
	task.spawn(function()
		local color3503 = Color3.fromRGB(255, 85, 255)
		local color3504 = Color3.fromRGB(255, 85, 255)
		local color3505 = Color3.fromRGB(255, 85, 255)
		local color3506 = Color3.fromRGB(255, 85, 255)

		effectsServiceBreathAttack(p1803, p1805, p1805, p1806, 70, "rbxassetid://13895587959", "Sparkle", 0.5, color3503, color3504, color3505, color3506, 1, 0.7)
	end)
	animation.AnimateAsync(v3450, { ImageTransparency = 0 }, 0.05, "Out", "Quart")
	animation.AnimateAsync(v3450, { Rotation = 100 }, 0.35, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3455 = v3449.Position
	local v3456 = UDim2.fromOffset(v3449.AbsoluteSize.X / 4, v3449.AbsoluteSize.X / 4)

	animationAnimate(v3450, { Position = v3455 - v3456 }, 0.25, "Out", "Quart")
	audioServicePlaySound("Lunge")
	animation.AnimateAsync(v3450, { Rotation = -135 }, 0.15, "In", "Quint")

	local animate = animation.Animate

	v3455 = v3449.Position
	v3456 = UDim2.fromOffset(v3449.AbsoluteSize.X / 6, v3449.AbsoluteSize.X / 6)
	animate(v3450, { Position = v3455 - v3456 }, 0.1, "In", "Quad")
	v3450:Destroy()
	audioServicePlaySound("SmallSlash")
	v3450 = p1805.Position
	v3451 = p1805.Position
	v3446 = UDim2.fromOffset(p1805.AbsoluteSize.X / 5, p1805.AbsoluteSize.X / 5)
	p1805.Position = v3451 + v3446
	animation.AnimateAsync(p1805, { Position = v3450 }, 0.4, "Out", "Quart")
	v3449.ImageTransparency = 0
	v3450 = v3449.Position
	v3451 = v3449.Position
	v3446 = UDim2.fromOffset(v3449.AbsoluteSize.X / 30, v3449.AbsoluteSize.X / 30)
	v3449.Position = v3451 - v3446

	local animationAnimateAsync = animation.AnimateAsync

	v3455 = UDim2.fromOffset(v3449.AbsoluteSize.X / 6, v3449.AbsoluteSize.X / 6)
	animationAnimateAsync(v3449, { Position = v3450 + v3455 }, 0.1, "Out", "Quint")
	effectsServiceWaitX(0.3)
	task.spawn(function()
		animation.Animate(v3449, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
		v3449:Destroy()
	end)
end
function module.LargeIllumina(p1807, _, p1809, p1810)
	local n1 = p1809.ZIndex + 10000
	local color3507 = Color3.fromRGB(200, 169, 254)
	local v3465 = uDim2New(0, p1809.AbsoluteSize.X * 1.5, 0, p1809.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p1809.AbsolutePosition.X, 0, p1809.AbsolutePosition.Y)
	local uDim2154 = UDim2.new(0, p1809.AbsoluteSize.X * 0.5, 0, p1809.AbsoluteSize.Y * 0.5)
	local v3468 = effectsServiceNewerCircle(p1807, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210189896",
		Rotation = 105,
		ZIndex = n1,
		ImageColor3 = color3507,
		Size = v3465,
		Position = uDim2 + uDim2154
	})
	local v3469 = v3468.Position
	local v3470 = v3468.Position

	v3465 = UDim2.fromOffset(v3468.AbsoluteSize.X / 3, v3468.AbsoluteSize.X / 3)
	v3468.Position = v3470 - v3465

	local n2 = p1809.ZIndex + 10000
	local v3472 = uDim2New(0, p1809.AbsoluteSize.X * 2.25, 0, p1809.AbsoluteSize.X * 2.25)

	v3469 = effectsServiceNewerCircle(p1807, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://12210187575",
		Rotation = -245,
		ZIndex = n2,
		Size = v3472,
		Position = v3468.Position
	})
	audioServicePlaySound("unsheath")
	effectsServiceWaitX(0.1)
	task.spawn(function()
		local color3508 = Color3.fromRGB(255, 85, 255)
		local color3509 = Color3.fromRGB(255, 85, 255)
		local color3510 = Color3.fromRGB(255, 85, 255)
		local color3511 = Color3.fromRGB(255, 85, 255)

		effectsServiceBreathAttack(p1807, p1809, p1809, p1810, 70, "rbxassetid://13895587959", "Sparkle", 0.5, color3508, color3509, color3510, color3511, 1, 0.7)
	end)
	audioServicePlaySound("Slash")
	animation.AnimateAsync(v3469, { ImageTransparency = 0 }, 0.1, "Out", "Quart")
	animation.AnimateAsync(v3469, { Rotation = -390 }, 0.45, "Out", "Quart")

	local animationAnimate = animation.Animate
	local v3474 = UDim2.fromOffset(v3468.AbsoluteSize.X / 1, v3468.AbsoluteSize.X / 1)

	animationAnimate(v3469, { Position = v3474 + v3468.Position }, 0.3, "Out", "Quart")
	audioServicePlaySound("Lunge")
	task.spawn(function()
		effectsServiceWaitX(0.2)

		local color3512 = Color3.fromRGB(255, 85, 255)
		local color3513 = Color3.fromRGB(255, 85, 255)
		local color3514 = Color3.fromRGB(255, 85, 255)
		local color3515 = Color3.fromRGB(255, 85, 255)

		effectsServiceBreathAttack(p1807, p1809, p1809, p1810, 80, "rbxassetid://13895587959", "Sparkle", 0.5, color3512, color3513, color3514, color3515, 0.9, 0.6)
	end)
	animation.AnimateAsync(v3469, { Rotation = -415 }, 0.3, "In", "Quint")

	local animate = animation.Animate

	v3474 = UDim2.fromOffset(v3468.AbsoluteSize.X / 3, v3468.AbsoluteSize.X / 3)
	animate(v3469, { Position = v3474 + v3468.Position }, 0.2, "In", "Quad")
	effectsService.ShakeBattleSync(p1807, 0.5, 0.025)
	v3470 = p1809.Position
	v3465 = p1809.Position
	v3472 = UDim2.fromOffset(p1809.AbsoluteSize.X / 4, p1809.AbsoluteSize.X / 4)
	p1809.Position = v3465 - v3472
	audioServicePlaySound("LargeSlash")
	v3468.ImageTransparency = 0
	v3468.Size = UDim2.new(0, p1809.AbsoluteSize.X * 1.75, 0, p1809.AbsoluteSize.X * 1.75)
	v3465 = v3468.Position
	v3472 = v3468.Position

	local v3476 = UDim2.fromOffset(v3468.AbsoluteSize.X / 6, v3468.AbsoluteSize.X / 6)

	v3468.Position = v3472 + v3476
	v3469:Destroy()
	animation.AnimateAsync(p1809, { Position = v3470 }, 1.25, "Out", "Quart")

	local animationAnimateAsync = animation.AnimateAsync
	local v3478 = UDim2.fromOffset(v3468.AbsoluteSize.X / 6, v3468.AbsoluteSize.X / 6)

	animationAnimateAsync(v3468, { Position = v3465 + v3478 }, 0.3, "Out", "Quint")
	effectsServiceWaitX(0.35)
	task.spawn(function()
		animation.Animate(v3468, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
		v3468:Destroy()
	end)
	wait(0.4)
end
function module.VolipaKatana(p1811, parent, parent2)
	local n1: number = 5
	local n2: number = 1
	local n3 = parent.ZIndex + 10002
	local v3485 = uDim2New(0, parent.AbsoluteSize.X * 2, 0, parent.AbsoluteSize.X * 2)
	local v3486 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.X * 1.1)
	local v3487 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://115711583401509",
		Rotation = 160,
		ZIndex = n3,
		Size = v3485,
		Position = v3486,
		Parent = parent
	})
	local n4 = parent.ZIndex + 10001
	local v3489 = uDim2New(0, parent.AbsoluteSize.X * 2, 0, parent.AbsoluteSize.X * 2)
	local v3490 = UDim2.fromOffset(parent.AbsoluteSize.X, parent.AbsoluteSize.X * 0.9)
	local v3491 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://86856493380384",
		Rotation = 0,
		ZIndex = n4,
		Size = v3489,
		Position = v3490,
		Parent = v3487
	})
	local n5 = parent.ZIndex + 10003
	local v3493 = uDim2New(0, parent.AbsoluteSize.X / 2, 0, parent.AbsoluteSize.X / 2)
	local v3494 = UDim2.fromOffset(parent.AbsoluteSize.X, parent.AbsoluteSize.Y * 0.5)
	local v3495 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://135659366806428",
		Rotation = 0,
		ZIndex = n5,
		Size = v3493,
		Position = v3494,
		Parent = parent
	})
	local n6 = parent2.ZIndex + 10003
	local color3516 = Color3.fromRGB(255, 12, 12)
	local v3498 = uDim2New(0, parent2.AbsoluteSize.X, 0, parent2.AbsoluteSize.Y)
	local v3499 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2 - 30, parent2.AbsoluteSize.Y / 2)

	v3486 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://5089147697",
		Rotation = 0,
		ZIndex = n6,
		ImageColor3 = color3516,
		Size = v3498,
		Position = v3499,
		Parent = parent2
	})

	local n7 = parent2.ZIndex + 10002
	local color3517 = Color3.fromRGB(255, 12, 12)
	local v3502 = uDim2New(0, parent2.AbsoluteSize.X, 0, parent2.AbsoluteSize.Y)
	local v3503 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2 - 30, parent2.AbsoluteSize.Y / 2)

	v3490 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://5089147697",
		Rotation = 0,
		ZIndex = n7,
		ImageColor3 = color3517,
		Size = v3502,
		Position = v3503,
		Parent = parent2
	})

	local n8 = parent2.ZIndex + 10001
	local v3505 = uDim2New(0, parent2.AbsoluteSize.X, 0, parent2.AbsoluteSize.Y)
	local v3506 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2 - 30, parent2.AbsoluteSize.Y / 2)

	v3494 = effectsServiceNewerCircle(p1811, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://118950432322434",
		Rotation = 0,
		ZIndex = n8,
		Size = v3505,
		Position = v3506,
		Parent = parent2
	})
	audioServicePlaySound("dbzswordout")
	animation.AnimateAsync(v3487, { ImageTransparency = 0, Rotation = 190 }, 0.3, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync
	local v3508 = UDim2.fromOffset(parent.AbsoluteSize.X, parent.AbsoluteSize.X * 1)

	animationAnimateAsync(v3491, { ImageTransparency = 0, Position = v3508 }, 0.4, "Out", "Quad")
	task.wait(0.4)

	local animateAsync = animation.AnimateAsync

	v3508 = UDim2.fromOffset(parent.AbsoluteSize.X * 1.8, parent.AbsoluteSize.Y * 0.2)
	animateAsync(v3495, { ImageTransparency = 0.6, Rotation = 175, Position = v3508 }, 1.8, "Out", "Quad")
	animation.AnimateAsync(v3487, { Rotation = 185 }, 0.6, "InOut", "Sine")

	local v3510 = animation.AnimateAsync

	v3508 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.7, parent.AbsoluteSize.X * 1)
	v3510(v3491, { ImageTransparency = 0, Position = v3508 }, 0.6, "Out", "Quad")

	while true do
		if math.random(0, 1) == 1 then
			local v3511 = animation.AnimateAsync
			local v3512 = UDim2.fromOffset(parent2.AbsoluteSize.X / 3, parent2.AbsoluteSize.Y / 1.2)

			v3511(v3486, { Position = v3512 }, 0, "In", "Linear")
		else
			local v3513 = animation.AnimateAsync
			local v3514 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2, parent2.AbsoluteSize.Y / 2)

			v3513(v3486, { Position = v3514 }, 0, "In", "Linear")
		end

		local v3515 = animation.AnimateAsync
		local randomNumber = math.random(0, 360)

		v3515(v3486, { Rotation = randomNumber }, 0, "In", "Linear")
		animation.AnimateAsync(v3490, { ImageTransparency = 1 }, 0.1, "In", "Quad")
		animation.AnimateAsync(v3494, { ImageTransparency = 1 }, 0.1, "In", "Quad")
		animation.AnimateAsync(v3486, { ImageTransparency = 0 }, 0.05, "In", "Quad")
		effectsService.ShakeSync(parent2, parent2.Position, 0.1, 0.2)
		audioServicePlaySound("SmallSlash", { PlaybackSpeed = n2 })
		task.wait(0.08)
		animation.AnimateAsync(v3486, { ImageTransparency = 1 }, 0.1, "In", "Quad")

		if math.random(0, 1) == 1 then
			local v3517 = animation.AnimateAsync
			local v3518 = UDim2.fromOffset(parent2.AbsoluteSize.X / 4, parent2.AbsoluteSize.Y / 1.1)

			v3517(v3490, { Position = v3518 }, 0, "In", "Linear")
		else
			local v3519 = animation.AnimateAsync
			local v3520 = UDim2.fromOffset(parent2.AbsoluteSize.X / 1, parent2.AbsoluteSize.Y / 4)

			v3519(v3490, { Position = v3520 }, 0, "In", "Linear")
		end

		if n1 <= 3 then
			local v3521 = animation.AnimateAsync
			local v3522 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2, parent2.AbsoluteSize.Y / 2)

			v3521(v3494, { Position = v3522 }, 0, "In", "Linear")

			local v3523 = animation.AnimateAsync
			local randomNumber18 = math.random(0, 360)

			v3523(v3494, { Rotation = randomNumber18 }, 0, "In", "Linear")
			audioServicePlaySound("Zap")
			animation.AnimateAsync(v3494, { ImageTransparency = 0 }, 0.04, "In", "Quint")
		end

		local v3525 = animation.AnimateAsync
		local randomNumber19 = math.random(0, 360)

		v3525(v3490, { Rotation = randomNumber19 }, 0, "In", "Linear")
		animation.AnimateAsync(v3490, { ImageTransparency = 0 }, 0.05, "In", "Quad")
		effectsService.ShakeSync(parent2, parent2.Position, 0.1, 0.2)
		audioServicePlaySound("SmallSlash", { PlaybackSpeed = n2 })
		task.wait(0.08)
		n1 -= 1
		n2 += 0.2

		if n1 == 0 then
			break
		end
	end

	animation.AnimateAsync(v3494, { ImageTransparency = 1 }, 0.1, "In", "Quad")
	animation.AnimateAsync(v3490, { ImageTransparency = 1 }, 0.1, "In", "Quad")
	animation.AnimateAsync(v3495, { ImageTransparency = 1 }, 0.3, "InOut", "Sine")
	task.wait(0.01)

	local v3527 = animation.AnimateAsync

	v3508 = UDim2.fromOffset(parent.AbsoluteSize.X, parent.AbsoluteSize.X * 1)
	v3527(v3491, { ImageTransparency = 0, Position = v3508 }, 0.2, "In", "Quint")
	task.wait(0.02)

	local v3528 = animation.AnimateAsync

	v3508 = UDim2.fromOffset(parent.AbsoluteSize.X / 2, parent.AbsoluteSize.X * 1.1)
	v3528(v3487, { Rotation = 190, Position = v3508 }, 0.3, "Out", "Quint")
	animation.AnimateAsync(v3486, { Rotation = 120 }, 0, "In", "Linear")

	local v3529 = animation.AnimateAsync

	v3508 = uDim2New(0, parent2.AbsoluteSize.X * 1.5, 0, parent2.AbsoluteSize.Y * 1.5)
	v3529(v3486, { Size = v3508 }, 0, "In", "Linear")

	local v3530 = animation.AnimateAsync

	v3508 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2, parent2.AbsoluteSize.Y / 2)
	v3530(v3486, { Position = v3508 }, 0, "In", "Linear")
	animation.AnimateAsync(v3486, { ImageTransparency = 0 }, 0.05, "In", "Quad")
	audioServicePlaySound("LargeSlash")
	effectsService.ShakeSync(parent2, parent2.Position, 0.5, 0.5)
	task.wait(0.5)
	animation.AnimateAsync(v3486, { ImageTransparency = 1 }, 0.2, "In", "Quad")
	animation.AnimateAsync(v3487, { ImageTransparency = 1 }, 0.2, "In", "Quad")
	animation.AnimateAsync(v3491, { ImageTransparency = 1 }, 0.1, "In", "Quad")
	task.wait(0.2)
	v3487:destroy()
	v3491:destroy()
	v3486:destroy()
	v3490:destroy()
	v3495:destroy()
	v3494:destroy()
end
function module.LargeBlizzard(p1814, p1815, p1816, p1817)
	task.wait(0.1)
	task.spawn(function()
		module.IceParticleLarge(p1814, p1815, p1816, p1817)
	end)

	local color3518 = Color3.fromRGB(130, 205, 255)

	effectsServiceVortex(p1814, p1815, p1816, p1817, "rbxassetid://13550517740", 1, color3518, 0, 0.5)
end
function module.LargeBlizzardEffect(p1818, p1819, p1820, _)
	module.LargeBlizzard(p1818, p1819, p1820, nil, nil)
end
function module.MidBlizzard(p1822, p1823, p1824, p1825)
	task.wait(0.1)
	task.spawn(function()
		module.IceParticle(p1822, p1823, p1824, p1825)
	end)

	local color3519 = Color3.fromRGB(130, 205, 255)

	effectsServiceVortex(p1822, p1823, p1824, p1825, "rbxassetid://13550517740", 0.8, color3519, 0, 0.5)
end
function module.MidBlizzardEffect(p1826, p1827, p1828, _)
	module.MidBlizzard(p1826, p1827, p1828, nil, nil)
end
function module.MidBlizzardSelf(p1830, p1831, _, _)
	module.MidBlizzard(p1830, p1831, p1831, nil, nil)
end
function module.SmallBlizzard(p1834, p1835, p1836, p1837)
	task.wait(0.1)
	task.spawn(function()
		module.IceParticleSmall(p1834, p1835, p1836, p1837)
	end)

	local color3520 = Color3.fromRGB(130, 205, 255)

	effectsServiceVortex(p1834, p1835, p1836, p1837, "rbxassetid://13550517740", 0.6, color3520, 0, 0.5)
end
function module.SmallBlizzardEffect(p1838, p1839, p1840, _)
	module.SmallBlizzard(p1838, p1839, p1840, nil, nil)
end
function module.LargeElectric(p1842, p1843, p1844, p1845)
	task.wait(0.1)
	task.spawn(function()
		module.YellowBoltParticleLarge(p1842, p1843, p1844, p1845)
	end)
	audioServicePlaySound("Thunder3")

	local color3521 = Color3.fromRGB(48, 47, 45)

	effectsServiceVortex(p1842, p1843, p1844, p1845, "rbxassetid://13550517740", 1, color3521, 0, 1)
end
function module.MidElectric(p1846, p1847, p1848, p1849)
	task.wait(0.1)
	task.spawn(function()
		module.YellowBoltParticle(p1846, p1847, p1848, p1849)
	end)
	audioServicePlaySound("Thunder2")

	local color3522 = Color3.fromRGB(48, 47, 45)

	effectsServiceVortex(p1846, p1847, p1848, p1849, "rbxassetid://13550517740", 0.8, color3522, 0, 1)
end
function module.SmallElectric(p1850, p1851, p1852, p1853)
	task.wait(0.1)
	task.spawn(function()
		module.YellowBoltParticleSmall(p1850, p1851, p1852, p1853)
	end)
	audioServicePlaySound("Thunder")

	local color3523 = Color3.fromRGB(48, 47, 45)

	effectsServiceVortex(p1850, p1851, p1852, p1853, "rbxassetid://13550517740", 0.6, color3523, 0, 1)
end
function module.LargeElectricEffect(p1854, p1855, p1856, _)
	module.LargeElectric(p1854, p1855, p1856, nil, nil)
end
function module.LargeStorm(p1858, p1859, p1860, p1861)
	task.wait(0.1)
	task.spawn(function()
		module.BoltParticleLarge(p1858, p1859, p1860, p1861)
	end)
	audioServicePlaySound("Thunder3")

	local color3524 = Color3.fromRGB(104, 164, 180)

	effectsServiceVortex(p1858, p1859, p1860, p1861, "rbxassetid://13550517740", 1, color3524, 0, 1)
end
function module.MidStorm(p1862, p1863, p1864, p1865)
	task.wait(0.1)
	task.spawn(function()
		module.BoltParticle(p1862, p1863, p1864, p1865)
	end)
	audioServicePlaySound("Thunder2")

	local color3525 = Color3.fromRGB(104, 164, 180)

	effectsServiceVortex(p1862, p1863, p1864, p1865, "rbxassetid://13550517740", 0.8, color3525, 0, 1)
end
function module.MidStormEffect(p1866, p1867, p1868, _)
	module.MidStorm(p1866, p1867, p1868, nil, nil)
end
function module.SmallStorm(p1870, p1871, p1872, p1873)
	task.wait(0.1)
	task.spawn(function()
		module.BoltParticleSmall(p1870, p1871, p1872, p1873)
	end)
	audioServicePlaySound("Thunder")

	local color3526 = Color3.fromRGB(104, 164, 180)

	effectsServiceVortex(p1870, p1871, p1872, p1873, "rbxassetid://13550517740", 0.6, color3526, 0, 1)
end
function module.SmallStormEffect(p1874, p1875, p1876, _)
	module.SmallStorm(p1874, p1875, p1876, nil, nil)
end
function module.LargeDoomStorm(p1878, p1879, p1880, p1881)
	task.wait(0.1)
	task.spawn(function()
		module.RedBoltParticleLarge(p1878, p1879, p1880, p1881)
	end)
	audioServicePlaySound("Thunder3")

	local color3527 = Color3.fromRGB(163, 25, 27)

	effectsServiceVortex(p1878, p1879, p1880, p1881, "rbxassetid://13550517740", 1, color3527, 0, 1)
end
function module.MidDoomStorm(p1882, p1883, p1884, p1885)
	task.wait(0.1)
	task.spawn(function()
		module.RedBoltParticle(p1882, p1883, p1884, p1885)
	end)
	audioServicePlaySound("Thunder2")

	local color3528 = Color3.fromRGB(163, 25, 27)

	effectsServiceVortex(p1882, p1883, p1884, p1885, "rbxassetid://13550517740", 0.8, color3528, 0, 1)
end
function module.SmallDoomStorm(p1886, p1887, p1888, p1889)
	task.wait(0.1)
	task.spawn(function()
		module.RedBoltParticleSmall(p1886, p1887, p1888, p1889)
	end)
	audioServicePlaySound("Thunder")

	local color3529 = Color3.fromRGB(163, 25, 27)

	effectsServiceVortex(p1886, p1887, p1888, p1889, "rbxassetid://13550517740", 0.6, color3529, 0, 1)
end
function module.SmallDoomStormSelf(p1890, p1891, _, _)
	module.SmallDoomStorm(p1890, p1891, p1891, nil, nil)
end
function module.LargeDoomStormEffect(p1894, p1895, p1896, _)
	module.LargeDoomStorm(p1894, p1895, p1896, nil, nil)
end
function module.LargeArcane(p1898, p1899, p1900, p1901)
	task.wait(0.1)
	task.spawn(function()
		module.PurpleBoltParticleLarge(p1898, p1899, p1900, p1901)
	end)
	audioServicePlaySound("Thunder3")

	local color3530 = Color3.fromRGB(92, 21, 127)

	effectsServiceVortex(p1898, p1899, p1900, p1901, "rbxassetid://13550517740", 1, color3530, 0, 1)
end
function module.MidArcane(p1902, p1903, p1904, p1905)
	task.wait(0.1)
	task.spawn(function()
		module.PurpleParticle(p1902, p1903, p1904, p1905)
	end)
	audioServicePlaySound("Thunder2")

	local color3531 = Color3.fromRGB(92, 21, 127)

	effectsServiceVortex(p1902, p1903, p1904, p1905, "rbxassetid://13550517740", 0.8, color3531, 0, 1)
end
function module.SmallArcane(p1906, p1907, p1908, p1909)
	task.wait(0.1)
	task.spawn(function()
		module.PurpleParticleSmall(p1906, p1907, p1908, p1909)
	end)
	audioServicePlaySound("Thunder")

	local color3532 = Color3.fromRGB(92, 21, 127)

	effectsServiceVortex(p1906, p1907, p1908, p1909, "rbxassetid://13550517740", 0.6, color3532, 0, 1)
end
function module.LargeTempest(p1910, p1911, p1912, p1913)
	task.wait(0.1)
	task.spawn(function()
		module.GreenBoltParticleLarge(p1910, p1911, p1912, p1913)
	end)
	audioServicePlaySound("Thunder3")

	local color3533 = Color3.fromRGB(18, 138, 66)

	effectsServiceVortex(p1910, p1911, p1912, p1913, "rbxassetid://13550517740", 1, color3533, 0, 1)
end
function module.MidTempest(p1914, p1915, p1916, p1917)
	task.wait(0.1)
	task.spawn(function()
		module.GreenBoltParticle(p1914, p1915, p1916, p1917)
	end)
	audioServicePlaySound("Thunder2")

	local color3534 = Color3.fromRGB(18, 138, 66)

	effectsServiceVortex(p1914, p1915, p1916, p1917, "rbxassetid://13550517740", 0.8, color3534, 0, 1)
end
function module.SmallTempest(p1918, p1919, p1920, p1921)
	task.wait(0.1)
	task.spawn(function()
		module.GreenBoltParticleSmall(p1918, p1919, p1920, p1921)
	end)
	audioServicePlaySound("Thunder")

	local color3535 = Color3.fromRGB(18, 138, 66)

	effectsServiceVortex(p1918, p1919, p1920, p1921, "rbxassetid://13550517740", 0.6, color3535, 0, 1)
end
function module.LargeWhirlpool(p1922, p1923, p1924, p1925)
	task.wait(0.1)
	task.spawn(function()
		module.WhirlpoolParticleLarge(p1922, p1923, p1924, p1925)
	end)

	local color3536 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1922, p1923, p1924, p1925, "rbxassetid://13546991407", 1.1, color3536, 0.1, 0.25)
end
function module.LargeWhirlpoolEffect(p1926, p1927, p1928, _)
	module.LargeWhirlpool(p1926, p1927, p1928, nil, nil)
end
function module.MidWhirlpool(p1930, p1931, p1932, p1933)
	task.wait(0.1)
	task.spawn(function()
		module.WhirlpoolParticle(p1930, p1931, p1932, p1933)
	end)

	local color3537 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1930, p1931, p1932, p1933, "rbxassetid://13546991407", 0.9, color3537, 0.1, 0.25)
end
function module.MidWhirlpoolSelf(p1934, p1935, _, _)
	module.MidWhirlpool(p1934, p1935, p1935, nil, nil)
end
function module.MidWhirlpoolFlush(p1938, p1939, _, _)
	if math.random(1, 2) == 1 then
		audioServicePlaySound("WaterSlosh")
		module.MidWhirlpool(p1938, p1939, p1939, nil, nil)
		task.wait(0.05)

		return
	end

	module.MidWhirlpool(p1938, p1939, p1939, nil, nil)
	task.wait(0.05)
end
function module.SmallWhirlpool(p1942, p1943, p1944, p1945)
	task.wait(0.1)
	task.spawn(function()
		module.WhirlpoolParticleSmall(p1942, p1943, p1944, p1945)
	end)

	local color3538 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1942, p1943, p1944, p1945, "rbxassetid://13546991407", 0.7, color3538, 0.1, 0.25)
end
function module.SmallWhirlpoolSelf(p1946, p1947, _, _)
	module.SmallWhirlpool(p1946, p1947, p1947, nil, nil)
end
function module.LargeMaelstrom(p1950, p1951, p1952, p1953)
	task.wait(0.1)
	task.spawn(function()
		module.MaelstromParticleLarge(p1950, p1951, p1952, p1953)
	end)

	local color3539 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1950, p1951, p1952, p1953, "rbxassetid://13550516398", 1.1, color3539, 0.1, 0.25)
end
function module.MidMaelstrom(p1954, p1955, p1956, p1957)
	task.wait(0.1)
	task.spawn(function()
		module.MaelstromParticle(p1954, p1955, p1956, p1957)
	end)

	local color3540 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1954, p1955, p1956, p1957, "rbxassetid://13550516398", 0.9, color3540, 0.1, 0.25)
end
function module.SmallMaelstrom(p1958, p1959, p1960, p1961)
	task.wait(0.1)
	task.spawn(function()
		module.MaelstromParticleSmall(p1958, p1959, p1960, p1961)
	end)

	local color3541 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1958, p1959, p1960, p1961, "rbxassetid://13550516398", 0.7, color3541, 0.1, 0.25)
end
function module.LargeGust(p1962, p1963, p1964, p1965)
	task.wait(0.1)
	audioServicePlaySound("Thunder3")

	local color3542 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1962, p1963, p1964, p1965, "rbxassetid://13550517740", 1.1, color3542, 0, 0.75)
end
function module.LargeGustEffect(p1966, p1967, p1968, _)
	module.LargeGust(p1966, p1967, p1968, nil, nil)
end
function module.LargeGustSelf(p1970, p1971, _, _)
	module.LargeGust(p1970, p1971, p1971, nil, nil)
end
function module.MidGust(p1974, p1975, p1976, p1977)
	task.wait(0.1)
	audioServicePlaySound("Thunder2")

	local color3543 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1974, p1975, p1976, p1977, "rbxassetid://13550517740", 0.9, color3543, 0, 0.75)
end
function module.MidGustEffect(p1978, p1979, p1980, _)
	module.MidGust(p1978, p1979, p1980, nil, nil)
end
function module.MidGustSelf(p1982, p1983, _, _)
	module.MidGust(p1982, p1983, p1983, nil, nil)
end
function module.SmallGust(p1986, p1987, p1988, p1989)
	task.wait(0.1)
	audioServicePlaySound("Thunder")

	local color3544 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1986, p1987, p1988, p1989, "rbxassetid://13550517740", 0.7, color3544, 0, 0.75)
end
function module.LargeGravity(p1990, p1991, p1992, p1993)
	task.wait(0.1)
	task.spawn(function()
		module.GravityParticleLarge(p1990, p1991, p1992, p1993)
	end)

	local color3545 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1990, p1991, p1992, p1993, "rbxassetid://13121483880", 1.1, color3545, 0, 0.75)
end
function module.LargeGravityEffect(p1994, p1995, p1996, _)
	module.LargeGravity(p1994, p1995, p1996, nil, nil)
end
function module.MidGravity(p1998, p1999, p2000, p2001)
	task.wait(0.1)
	task.spawn(function()
		module.GravityParticle(p1998, p1999, p2000, p2001)
	end)

	local color3546 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p1998, p1999, p2000, p2001, "rbxassetid://13121483880", 0.9, color3546, 0, 0.75)
end
function module.MidGravityEffect(p2002, p2003, p2004, _)
	module.MidGravity(p2002, p2003, p2004, nil, nil)
end
function module.SmallGravity(p2006, p2007, p2008, p2009)
	task.wait(0.1)
	task.spawn(function()
		module.GravityParticleSmall(p2006, p2007, p2008, p2009)
	end)

	local color3547 = Color3.fromRGB(255, 255, 255)

	effectsServiceVortex(p2006, p2007, p2008, p2009, "rbxassetid://13121483880", 0.7, color3547, 0, 0.75)
end
function module.LargeDivinity(p2010, p2011, p2012, p2013)
	task.wait(0.1)
	task.spawn(function()
		module.DivinityParticleLarge(p2010, p2011, p2012, p2013)
	end)

	local color3548 = Color3.fromRGB(255, 231, 146)

	effectsServiceVortex(p2010, p2011, p2012, p2013, "rbxassetid://13121482597", 1.1, color3548, 0.1, 0.75)
end
function module.MidDivinity(p2014, p2015, p2016, p2017)
	task.wait(0.1)
	task.spawn(function()
		module.DivinityParticle(p2014, p2015, p2016, p2017)
	end)

	local color3549 = Color3.fromRGB(255, 231, 146)

	effectsServiceVortex(p2014, p2015, p2016, p2017, "rbxassetid://13121482597", 0.9, color3549, 0.1, 0.75)
end
function module.SmallDivinity(p2018, p2019, p2020, p2021)
	task.wait(0.1)
	task.spawn(function()
		module.DivinityParticleSmall(p2018, p2019, p2020, p2021)
	end)

	local color3550 = Color3.fromRGB(255, 231, 146)

	effectsServiceVortex(p2018, p2019, p2020, p2021, "rbxassetid://13121482597", 0.7, color3550, 0.1, 0.75)
end
local function DBZClash(p2022, p2023, p2024, _, p2026)
	local v3777 = p2026 or 7

	for _ = 1, v3777 do
		audioServicePlaySound("DBZ Medium Punch")

		local color3551 = Color3.fromRGB(255, 255, 255)
		local v3780 = UDim2.fromOffset(p2024.AbsoluteSize.X, p2024.AbsoluteSize.X)
		local uDim2 = UDim2.new(0, p2024.AbsolutePosition.X, 0, p2024.AbsolutePosition.Y)
		local uDim2155 = UDim2.new(0, p2024.AbsoluteSize.X * 0.5, 0, p2024.AbsoluteSize.Y * 0.5)
		local uDim2FromOffset = UDim2.fromOffset
		local randomNumber = math.random(-p2024.AbsoluteSize.Y / 4, p2024.AbsoluteSize.Y / 4)
		local v3785 = uDim2FromOffset(randomNumber, math.random(-p2024.AbsoluteSize.X / 4, p2024.AbsoluteSize.X / 4))
		local randomNumber20 = math.random(0, 180)
		local v3787 = effectsServiceNewerCircle(p2022, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://16689218037",
			ImageColor3 = color3551,
			Size = v3780,
			Position = uDim2 + uDim2155 + v3785,
			Rotation = randomNumber20,
			ZIndex = p2023.ZIndex + 1
		})

		effectsService.ShakeSync(p2024, p2024.Position, 0.1, 0.05)
		task.spawn(function()
			effectsServiceSpritesheet(v3787, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
			v3787:Destroy()
		end)
		task.wait(0.4 / v3777)
	end

	local n1 = p2024.ZIndex + 10001
	local uDim2156 = UDim2.new(0, p2024.AbsoluteSize.X * 2, 0, p2024.AbsoluteSize.X * 2)
	local uDim2157 = UDim2.new(0, p2024.AbsolutePosition.X + p2024.AbsoluteSize.X / 2, 0, p2024.AbsolutePosition.Y + p2024.AbsoluteSize.Y / 2)
	local v3791 = effectsServiceNewerCircle(p2022, {
		Image = "rbxassetid://5090109153",
		ZIndex = n1,
		Size = uDim2156,
		Position = uDim2157
	})
	local uDim2158 = UDim2.new(0, p2024.AbsoluteSize.X * 3.3, 0, p2024.AbsoluteSize.X * 3.3)

	v3791:TweenSize(uDim2158, "Out", "Quad", 0.15, true)
	task.wait(0.15)

	local uDim2159 = UDim2.new(0, p2024.AbsoluteSize.X / 1.5, 0, p2024.AbsoluteSize.X / 1.5)

	v3791:TweenSize(uDim2159, "In", "Quad", 0.075, true)
	task.wait(0.075)

	local n2 = p2024.ZIndex + 10000
	local uDim2160 = UDim2.new(0, p2024.AbsoluteSize.X * 0.9, 0, p2024.AbsoluteSize.X * 0.9)
	local uDim2161 = UDim2.new(0, p2024.AbsolutePosition.X + p2024.AbsoluteSize.X / 2, 0, p2024.AbsolutePosition.Y + p2024.AbsoluteSize.Y / 2)
	local v3797 = effectsServiceNewerCircle(p2022, {
		Image = "rbxassetid://5090165303",
		ZIndex = n2,
		Size = uDim2160,
		Position = uDim2161
	})

	audioServicePlaySound("DBZ Punch Sound")
	effectsService.ShakeBattle(p2022, 0.04 * v3777, 0.01 * v3777)

	local uDim2162 = UDim2.new(0, p2024.AbsoluteSize.X * 1.3, 0, p2024.AbsoluteSize.X * 1.3)

	v3797:TweenSize(uDim2162, "Out", "Quad", 0.075, true)
	spawn(function()
		effectsService.Shake(p2023, p2023.Position, 0.12, 0.1)
	end)
	spawn(function()
		effectsService.Shake(p2024, p2024.Position, 0.4, 0.5)
	end)
	spawn(function()
		effectsService.Shake(v3797, v3797.Position, 0.4, 0.5)
	end)
	spawn(function()
		wait(0.6400000000000001)
		effectsServiceTweenProperty(v3791, "ImageTransparency", 0, 1, 0.4)
		v3791:Destroy()
	end)
	spawn(function()
		wait(0.8)
		effectsServiceTweenProperty(v3797, "ImageTransparency", 0, 1, 0.4)
		v3797:Destroy()
	end)
	effectsService.Shake(v3791, v3791.Position, 0.4, 0.5)
end
function module.SmallDBZClash(p2027, p2028, p2029, p2030)
	DBZClash(p2027, p2028, p2029, p2030, 3)
end
function module.MidDBZClash(p2031, p2032, p2033, p2034)
	DBZClash(p2031, p2032, p2033, p2034, 5)
end
function module.LargeDBZClash(p2035, p2036, p2037, p2038)
	DBZClash(p2035, p2036, p2037, p2038, 7)
end
function module.LargeGun(p2039, p2040, p2041, _, _, _)
	effectsServicePreloadTech(p2039, { "rbxassetid://469244176" })

	local n1 = p2041.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2041.AbsoluteSize.X * 1.2, 0, p2041.AbsoluteSize.X * 1.2)
	local uDim2163 = UDim2.new(0, p2040.AbsolutePosition.X + p2040.AbsoluteSize.X / 2, 0, p2040.AbsolutePosition.Y + p2040.AbsoluteSize.Y / 2)
	local v3820 = effectsServiceNewerCircle(p2039, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5095587174",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2163
	})

	effectsServiceTweenProperty(v3820, "ImageTransparency", 1, 0, 0.25)

	local uDim2164 = UDim2.new(0, p2041.AbsolutePosition.X, 0, p2041.AbsolutePosition.Y)
	local uDim2165 = UDim2.new(0, p2041.AbsoluteSize.X * 0.5, 0, p2041.AbsoluteSize.Y * 0.5)

	v3820:TweenPosition(uDim2164 + uDim2165, "Out", "Quint", 0.6, true)
	effectsServiceWaitX(0.7)
	spawn(function()
		effectsService.Shake(p2041, p2041.Position, 0.5, 0.6)
	end)

	local n2 = p2041.ZIndex + 10000
	local uDim2166 = UDim2.new(0, p2041.AbsoluteSize.X * 1.5, 0, p2041.AbsoluteSize.X * 1.5)
	local uDim2167 = UDim2.new(0, p2041.AbsolutePosition.X, 0, p2041.AbsolutePosition.Y)
	local uDim2168 = UDim2.new(0, p2041.AbsoluteSize.X * 0.5, 0, p2041.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(1, 180)
	local v3828 = effectsServiceNewerCircle(p2039, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://469244176",
		ZIndex = n2,
		Size = uDim2166,
		Position = uDim2167 + uDim2168,
		Rotation = randomNumber
	})

	audioService.PlaySound("SniperShot")
	effectsService.ShakeBattle(p2039, 0.1, 0.025)
	spawn(function()
		effectsService.Shake(v3828, v3828.Position, 0.4, 0.6)
	end)
	spawn(function()
		effectsService.Shake(v3820, v3820.Position, 0.4, 0.6)
	end)
	effectsServiceWaitX(0.6)
	spawn(function()
		effectsServiceTweenProperty(v3828, "ImageTransparency", 0, 1, 0.4)
		v3828:Destroy()
		effectsServiceTweenProperty(v3820, "ImageTransparency", 0, 1, 0.4)
		v3820:Destroy()
	end)
end
function module.LargeGunEffect(p2045, p2046, p2047, _)
	module.LargeGun(p2045, p2046, p2047, nil, nil)
end
function module.MidGun(p2049, _, p2051, _, _, _)
	effectsServicePreloadTech(p2049, { "rbxassetid://469244176" })
	spawn(function()
		effectsService.Shake(p2051, p2051.Position, 0.32000000000000006, 0.2)
	end)

	for _ = 1, 4 do
		local n1 = p2051.ZIndex + 10000
		local uDim2 = UDim2.new(0, p2051.AbsoluteSize.X / 1.25, 0, p2051.AbsoluteSize.X / 1.25)
		local uDim2New = UDim2.new
		local x = p2051.AbsolutePosition.X
		local v3844 = p2051.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2051.AbsolutePosition.Y
		local v3847 = p2051.AbsoluteSize.Y
		local randomNumber21 = math.random(15, 40)
		local v3849 = uDim2New(0, x + v3844 / (randomNumber * 0.1), 0, y + v3847 / (randomNumber21 * 0.1))
		local randomNumber22 = math.random(1, 180)
		local v3851 = effectsServiceNewerCircle(p2049, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://469244176",
			ZIndex = n1,
			Size = uDim2,
			Position = v3849,
			Rotation = randomNumber22
		})

		audioService.PlaySound("GunShot")
		spawn(function()
			wait(0.32000000000000006)
			effectsServiceTweenProperty(v3851, "ImageTransparency", 0, 1, 0.16000000000000003)
			v3851:Destroy()
		end)
		effectsServiceWaitX(0.18)
	end

	wait(0.08000000000000002)
end
function module.MidGunEffect(p2055, p2056, p2057, _)
	module.MidGun(p2055, p2056, p2057, nil, nil)
end
function module.SmallGun(p2059, _, p2061, _, _, _)
	effectsServicePreloadTech(p2059, { "rbxassetid://469244176" })
	spawn(function()
		effectsService.Shake(p2061, p2061.Position, 0.32000000000000006, 0.2)
	end)

	for _ = 1, 2 do
		local n1 = p2061.ZIndex + 10000
		local uDim2 = UDim2.new(0, p2061.AbsoluteSize.X / 1.25, 0, p2061.AbsoluteSize.X / 1.25)
		local uDim2New = UDim2.new
		local x = p2061.AbsolutePosition.X
		local v3867 = p2061.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2061.AbsolutePosition.Y
		local v3870 = p2061.AbsoluteSize.Y
		local randomNumber23 = math.random(15, 40)
		local v3872 = uDim2New(0, x + v3867 / (randomNumber * 0.1), 0, y + v3870 / (randomNumber23 * 0.1))
		local randomNumber24 = math.random(1, 180)
		local v3874 = effectsServiceNewerCircle(p2059, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://469244176",
			ZIndex = n1,
			Size = uDim2,
			Position = v3872,
			Rotation = randomNumber24
		})

		audioService.PlaySound("GunShot")
		spawn(function()
			wait(0.32000000000000006)
			effectsServiceTweenProperty(v3874, "ImageTransparency", 0, 1, 0.16000000000000003)
			v3874:Destroy()
		end)
		effectsServiceWaitX(0.2)
	end

	wait(0.08000000000000002)
end
function module.SmallGunEffect(p2065, p2066, p2067, _)
	module.SmallGun(p2065, p2066, p2067, nil, nil)
end
function module.LargeShotgun(p2069, _, p2071, _, _, _)
	effectsServicePreloadTech(p2069, {
		"rbxassetid://15692468308",
		"rbxassetid://15692470668",
		"rbxassetid://15692481236"
	})
	audioService.PlaySound("ShotgunPrime")
	task.wait(0.45)

	local t49: {[any]: any} = {
		"rbxassetid://15692468308",
		"rbxassetid://15692470668",
		"rbxassetid://15692481236"
	}

	spawn(function()
		effectsService.Shake(p2071, p2071.Position, 0.5, 0.6)
	end)

	local randomNumber = math.random(1, #t49)
	local v3887 = t49[randomNumber]
	local n1 = p2071.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2071.AbsoluteSize.X * 1.1, 0, p2071.AbsoluteSize.X * 1.1)
	local uDim2169 = UDim2.new(0, p2071.AbsolutePosition.X, 0, p2071.AbsolutePosition.Y)
	local uDim2170 = UDim2.new(0, p2071.AbsoluteSize.X * 0.5, 0, p2071.AbsoluteSize.Y * 0.5)
	local randomNumber25 = math.random(1, 360)
	local v3893 = effectsServiceNewerCircle(p2069, {
		BackgroundTransparency = 1,
		Image = v3887,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2169 + uDim2170,
		Rotation = randomNumber25
	})

	audioService.PlaySound("Shotgun1")
	effectsService.ShakeBattle(p2069, 0.1, 0.025)
	spawn(function()
		effectsService.Shake(v3893, v3893.Position, 0.4, 0.6)
	end)
	effectsServiceWaitX(0.6)
	spawn(function()
		effectsServiceTweenProperty(v3893, "ImageTransparency", 0, 1, 0.4)
		v3893:Destroy()
	end)
end
function module.MidShotgun(p2075, _, p2077, _, _, _)
	effectsServicePreloadTech(p2075, {
		"rbxassetid://15692468308",
		"rbxassetid://15692470668",
		"rbxassetid://15692481236"
	})
	audioService.PlaySound("ShotgunPrime")
	task.wait(0.35)

	local t50: {[any]: any} = {
		"rbxassetid://15692468308",
		"rbxassetid://15692470668",
		"rbxassetid://15692481236"
	}

	spawn(function()
		effectsService.Shake(p2077, p2077.Position, 0.45, 0.35)
	end)

	local randomNumber = math.random(1, #t50)
	local v3902 = t50[randomNumber]
	local n1 = p2077.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2077.AbsoluteSize.X / 1.02, 0, p2077.AbsoluteSize.X / 1.02)
	local uDim2171 = UDim2.new(0, p2077.AbsolutePosition.X, 0, p2077.AbsolutePosition.Y)
	local uDim2172 = UDim2.new(0, p2077.AbsoluteSize.X * 0.5, 0, p2077.AbsoluteSize.Y * 0.5)
	local randomNumber26 = math.random(1, 360)
	local v3908 = effectsServiceNewerCircle(p2075, {
		BackgroundTransparency = 1,
		Image = v3902,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2171 + uDim2172,
		Rotation = randomNumber26
	})

	audioService.PlaySound("Shotgun2")
	spawn(function()
		effectsService.Shake(v3908, v3908.Position, 0.3, 0.4)
	end)
	effectsServiceWaitX(0.6)
	spawn(function()
		effectsServiceTweenProperty(v3908, "ImageTransparency", 0, 1, 0.4)
		v3908:Destroy()
	end)
end
function module.SmallShotgun(p2081, _, p2083, _, _, _)
	effectsServicePreloadTech(p2081, { "rbxassetid://15692468308", "rbxassetid://15692470668" })

	local t51: {[any]: any} = { "rbxassetid://15692468308", "rbxassetid://15692470668" }

	spawn(function()
		effectsService.Shake(p2083, p2083.Position, 0.4, 0.15)
	end)

	local randomNumber = math.random(1, #t51)
	local v3917 = t51[randomNumber]
	local n1 = p2083.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2083.AbsoluteSize.X / 1.2, 0, p2083.AbsoluteSize.X / 1.2)
	local uDim2173 = UDim2.new(0, p2083.AbsolutePosition.X, 0, p2083.AbsolutePosition.Y)
	local uDim2174 = UDim2.new(0, p2083.AbsoluteSize.X * 0.5, 0, p2083.AbsoluteSize.Y * 0.5)
	local randomNumber27 = math.random(1, 360)
	local v3923 = effectsServiceNewerCircle(p2081, {
		BackgroundTransparency = 1,
		Image = v3917,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2173 + uDim2174,
		Rotation = randomNumber27
	})

	audioService.PlaySound("Shotgun2")
	spawn(function()
		effectsService.Shake(v3923, v3923.Position, 0.325, 0.15)
	end)
	effectsServiceWaitX(0.6)
	spawn(function()
		effectsServiceTweenProperty(v3923, "ImageTransparency", 0, 1, 0.4)
		v3923:Destroy()
	end)
end
function module.LargeSMG(p2087, _, p2089, _, _)
	effectsServicePreloadTech(p2087, { "rbxassetid://469244176" })

	for _ = 1, 6 do
		local n1 = p2089.ZIndex + 1
		local uDim2 = UDim2.new(0, p2089.AbsoluteSize.X / 1.475, 0, p2089.AbsoluteSize.X / 1.475)
		local uDim2New = UDim2.new
		local x = p2089.AbsolutePosition.X
		local v3934 = p2089.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2089.AbsolutePosition.Y
		local v3937 = p2089.AbsoluteSize.Y
		local randomNumber28 = math.random(15, 40)
		local v3939 = uDim2New(0, x + v3934 / (randomNumber * 0.08), 0, y + v3937 / (randomNumber28 * 0.1))
		local randomNumber29 = math.random(1, 180)
		local v3941 = effectsServiceNewerCircle(p2087, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ZIndex = n1,
			Size = uDim2,
			Position = v3939,
			Rotation = randomNumber29
		})
		local n2 = p2089.ZIndex + 1
		local uDim2175 = UDim2.new(0, p2089.AbsoluteSize.X / 1.5, 0, p2089.AbsoluteSize.X / 1.5)
		local v3944 = UDim2.new
		local v3945 = p2089.AbsolutePosition.X
		local v3946 = p2089.AbsoluteSize.X
		local randomNumber30 = math.random(15, 40)
		local v3948 = p2089.AbsolutePosition.Y
		local v3949 = p2089.AbsoluteSize.Y
		local randomNumber31 = math.random(15, 40)
		local v3951 = v3944(0, v3945 + v3946 / (randomNumber30 * 0.08), 0, v3948 + v3949 / (randomNumber31 * 0.1))
		local randomNumber32 = math.random(1, 180)
		local v3953 = effectsServiceNewerCircle(p2087, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ImageTransparency = 1,
			ZIndex = n2,
			Size = uDim2175,
			Position = v3951,
			Rotation = randomNumber32
		})

		audioService.PlaySound("UziShot")
		task.wait(0.115)
		audioService.PlaySound("UziShot")
		spawn(function()
			effectsService.ShakeSync(p2089, p2089.Position, 0.2, 0.07)
		end)
		task.spawn(function()
			wait(0.24)
			effectsServiceTweenProperty(v3941, "ImageTransparency", 0, 1, 0.04000000000000001)
			v3941:Destroy()
		end)
		task.spawn(function()
			wait(0.13999999999999999)
			effectsServiceTweenProperty(v3953, "ImageTransparency", 1, 0, 0.05)
			wait(0.16000000000000003)
			effectsServiceTweenProperty(v3953, "ImageTransparency", 0, 1, 0.04000000000000001)
			v3953:Destroy()
		end)
		effectsServiceWaitX(0.15)
	end

	wait(0.048)
end
function module.MidSMG(p2092, _, p2094, _, _)
	effectsServicePreloadTech(p2092, { "rbxassetid://469244176" })

	for _ = 1, 4 do
		local n1 = p2094.ZIndex + 1
		local uDim2 = UDim2.new(0, p2094.AbsoluteSize.X / 1.7, 0, p2094.AbsoluteSize.X / 1.7)
		local uDim2New = UDim2.new
		local x = p2094.AbsolutePosition.X
		local v3964 = p2094.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2094.AbsolutePosition.Y
		local v3967 = p2094.AbsoluteSize.Y
		local randomNumber33 = math.random(15, 40)
		local v3969 = uDim2New(0, x + v3964 / (randomNumber * 0.08), 0, y + v3967 / (randomNumber33 * 0.1))
		local randomNumber34 = math.random(1, 180)
		local v3971 = effectsServiceNewerCircle(p2092, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ZIndex = n1,
			Size = uDim2,
			Position = v3969,
			Rotation = randomNumber34
		})
		local n2 = p2094.ZIndex + 1
		local uDim2176 = UDim2.new(0, p2094.AbsoluteSize.X / 1.75, 0, p2094.AbsoluteSize.X / 1.75)
		local v3974 = UDim2.new
		local v3975 = p2094.AbsolutePosition.X
		local v3976 = p2094.AbsoluteSize.X
		local randomNumber35 = math.random(15, 40)
		local v3978 = p2094.AbsolutePosition.Y
		local v3979 = p2094.AbsoluteSize.Y
		local randomNumber36 = math.random(15, 40)
		local v3981 = v3974(0, v3975 + v3976 / (randomNumber35 * 0.08), 0, v3978 + v3979 / (randomNumber36 * 0.1))
		local randomNumber37 = math.random(1, 180)
		local v3983 = effectsServiceNewerCircle(p2092, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ImageTransparency = 1,
			ZIndex = n2,
			Size = uDim2176,
			Position = v3981,
			Rotation = randomNumber37
		})

		audioService.PlaySound("UziShot")
		task.wait(0.12)
		audioService.PlaySound("UziShot")
		spawn(function()
			effectsService.ShakeSync(p2094, p2094.Position, 0.24, 0.05)
		end)
		task.spawn(function()
			wait(0.27999999999999997)
			effectsServiceTweenProperty(v3971, "ImageTransparency", 0, 1, 0.04000000000000001)
			v3971:Destroy()
		end)
		task.spawn(function()
			wait(0.16000000000000003)
			effectsServiceTweenProperty(v3983, "ImageTransparency", 1, 0, 0.05)
			wait(0.16000000000000003)
			effectsServiceTweenProperty(v3983, "ImageTransparency", 0, 1, 0.04000000000000001)
			v3983:Destroy()
		end)
		effectsServiceWaitX(0.175)
	end

	wait(0.064)
end
function module.SmallSMG(p2097, _, p2099, _, _)
	effectsServicePreloadTech(p2097, { "rbxassetid://469244176" })

	for _ = 1, 2 do
		local n1 = p2099.ZIndex + 1
		local uDim2 = UDim2.new(0, p2099.AbsoluteSize.X / 1.8, 0, p2099.AbsoluteSize.X / 1.8)
		local uDim2New = UDim2.new
		local x = p2099.AbsolutePosition.X
		local v3994 = p2099.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2099.AbsolutePosition.Y
		local v3997 = p2099.AbsoluteSize.Y
		local randomNumber38 = math.random(15, 40)
		local v3999 = uDim2New(0, x + v3994 / (randomNumber * 0.08), 0, y + v3997 / (randomNumber38 * 0.1))
		local randomNumber39 = math.random(1, 180)
		local v4001 = effectsServiceNewerCircle(p2097, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ZIndex = n1,
			Size = uDim2,
			Position = v3999,
			Rotation = randomNumber39
		})
		local n2 = p2099.ZIndex + 1
		local uDim2177 = UDim2.new(0, p2099.AbsoluteSize.X / 1.85, 0, p2099.AbsoluteSize.X / 1.85)
		local v4004 = UDim2.new
		local v4005 = p2099.AbsolutePosition.X
		local v4006 = p2099.AbsoluteSize.X
		local randomNumber40 = math.random(15, 40)
		local v4008 = p2099.AbsolutePosition.Y
		local v4009 = p2099.AbsoluteSize.Y
		local randomNumber41 = math.random(15, 40)
		local v4011 = v4004(0, v4005 + v4006 / (randomNumber40 * 0.08), 0, v4008 + v4009 / (randomNumber41 * 0.1))
		local randomNumber42 = math.random(1, 180)
		local v4013 = effectsServiceNewerCircle(p2097, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15692063853",
			ImageTransparency = 1,
			ZIndex = n2,
			Size = uDim2177,
			Position = v4011,
			Rotation = randomNumber42
		})

		audioService.PlaySound("UziShot")
		task.wait(0.125)
		audioService.PlaySound("UziShot")
		spawn(function()
			effectsService.ShakeSync(p2099, p2099.Position, 0.24, 0.05)
		end)
		task.spawn(function()
			wait(0.30000000000000004)
			effectsServiceTweenProperty(v4001, "ImageTransparency", 0, 1, 0.04000000000000001)
			v4001:Destroy()
		end)
		task.spawn(function()
			wait(0.18000000000000002)
			effectsServiceTweenProperty(v4013, "ImageTransparency", 1, 0, 0.05)
			wait(0.16000000000000003)
			effectsServiceTweenProperty(v4013, "ImageTransparency", 0, 1, 0.04000000000000001)
			v4013:Destroy()
		end)
		effectsServiceWaitX(0.225)
	end

	wait(0.08000000000000002)
end
function module.LargeMinigun(p2102, _, p2104, _, _)
	effectsServicePreloadTech(p2102, { "rbxassetid://469244176" })
	audioService.PlaySound("MinigunStart")
	task.wait(0.55)

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t52: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
	local v4021 = UDim2.fromOffset(p2104.AbsoluteSize.X * 0.8, p2104.AbsoluteSize.X * 0.8)
	local t53: {[any]: any} = {
		Strength = 40,
		Time = 0.4,
		Speed = 0.3,
		Lifetime = 0.4,
		Transparency = 0.4,
		EasingStyle = "Quad",
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t52,
		Size = v4021,
		ZIndex = p2104.ZIndex + 2
	}

	task.spawn(function()
		effectsServiceBreath(p2102, p2104, p2104, t53)
	end)
	spawn(function()
		effectsService.Shake(p2104, p2104.Position, 0.32000000000000006, 0.2)
	end)

	for _ = 1, 13 do
		local n1 = p2104.ZIndex + 1
		local uDim2 = UDim2.new(0, p2104.AbsoluteSize.X / 2, 0, p2104.AbsoluteSize.X / 2)
		local uDim2New = UDim2.new
		local x = p2104.AbsolutePosition.X
		local v4028 = p2104.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2104.AbsolutePosition.Y
		local v4031 = p2104.AbsoluteSize.Y
		local randomNumber43 = math.random(15, 40)
		local v4033 = uDim2New(0, x + v4028 / (randomNumber * 0.08), 0, y + v4031 / (randomNumber43 * 0.1))
		local randomNumber44 = math.random(1, 180)
		local v4035 = effectsServiceNewerCircle(p2102, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://469244176",
			ZIndex = n1,
			Size = uDim2,
			Position = v4033,
			Rotation = randomNumber44
		})

		audioService.PlaySound("MinigunShot")
		spawn(function()
			wait(0.24)
			effectsServiceTweenProperty(v4035, "ImageTransparency", 0, 1, 0.12)
			v4035:Destroy()
		end)
		effectsServiceWaitX(0.05)
	end

	wait(0.048)
	audioService.PlaySound("MinigunEnd")
end
function module.MidMinigun(p2107, _, p2109, _, _)
	effectsServicePreloadTech(p2107, { "rbxassetid://469244176" })
	audioService.PlaySound("MinigunStart")
	task.wait(0.55)

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t54: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
	local v4043 = UDim2.fromOffset(p2109.AbsoluteSize.X * 0.7, p2109.AbsoluteSize.X * 0.7)
	local t55: {[any]: any} = {
		Strength = 25,
		Time = 0.4,
		Speed = 0.3,
		Lifetime = 0.4,
		Transparency = 0.4,
		EasingStyle = "Quad",
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t54,
		Size = v4043,
		ZIndex = p2109.ZIndex + 2
	}

	task.spawn(function()
		effectsServiceBreath(p2107, p2109, p2109, t55)
	end)
	spawn(function()
		effectsService.Shake(p2109, p2109.Position, 0.32000000000000006, 0.2)
	end)

	for _ = 1, 9 do
		local n1 = p2109.ZIndex + 1
		local uDim2 = UDim2.new(0, p2109.AbsoluteSize.X / 2, 0, p2109.AbsoluteSize.X / 2)
		local uDim2New = UDim2.new
		local x = p2109.AbsolutePosition.X
		local v4050 = p2109.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2109.AbsolutePosition.Y
		local v4053 = p2109.AbsoluteSize.Y
		local randomNumber45 = math.random(15, 40)
		local v4055 = uDim2New(0, x + v4050 / (randomNumber * 0.08), 0, y + v4053 / (randomNumber45 * 0.1))
		local randomNumber46 = math.random(1, 180)
		local v4057 = effectsServiceNewerCircle(p2107, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://469244176",
			ZIndex = n1,
			Size = uDim2,
			Position = v4055,
			Rotation = randomNumber46
		})

		audioService.PlaySound("MinigunShot")
		spawn(function()
			wait(0.27999999999999997)
			effectsServiceTweenProperty(v4057, "ImageTransparency", 0, 1, 0.13999999999999999)
			v4057:Destroy()
		end)
		effectsServiceWaitX(0.07)
	end

	wait(0.064)
	audioService.PlaySound("MinigunEnd")
end
function module.SmallMinigun(p2112, _, p2114, _, _)
	effectsServicePreloadTech(p2112, { "rbxassetid://469244176" })
	audioService.PlaySound("MinigunStart")
	task.wait(0.55)

	local effectsServiceBreathimagesSmoke = effectsServiceBreathimages.smoke
	local t56: {[any]: any} = { Color3.fromRGB(240, 240, 240), Color3.fromRGB(239, 245, 248) }
	local v4065 = UDim2.fromOffset(p2114.AbsoluteSize.X * 0.5, p2114.AbsoluteSize.X * 0.5)
	local t57: {[any]: any} = {
		Strength = 15,
		Time = 0.4,
		Speed = 0.3,
		Lifetime = 0.4,
		Transparency = 0.4,
		EasingStyle = "Quad",
		Projectile = effectsServiceBreathimagesSmoke,
		Color = t56,
		Size = v4065,
		ZIndex = p2114.ZIndex + 2
	}

	task.spawn(function()
		effectsServiceBreath(p2112, p2114, p2114, t57)
	end)
	spawn(function()
		effectsService.Shake(p2114, p2114.Position, 0.32000000000000006, 0.2)
	end)

	for _ = 1, 6 do
		local n1 = p2114.ZIndex + 1
		local uDim2 = UDim2.new(0, p2114.AbsoluteSize.X / 2, 0, p2114.AbsoluteSize.X / 2)
		local uDim2New = UDim2.new
		local x = p2114.AbsolutePosition.X
		local v4072 = p2114.AbsoluteSize.X
		local randomNumber = math.random(15, 40)
		local y = p2114.AbsolutePosition.Y
		local v4075 = p2114.AbsoluteSize.Y
		local randomNumber47 = math.random(15, 40)
		local v4077 = uDim2New(0, x + v4072 / (randomNumber * 0.08), 0, y + v4075 / (randomNumber47 * 0.1))
		local randomNumber48 = math.random(1, 180)
		local v4079 = effectsServiceNewerCircle(p2112, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://469244176",
			ZIndex = n1,
			Size = uDim2,
			Position = v4077,
			Rotation = randomNumber48
		})

		audioService.PlaySound("MinigunShot")
		spawn(function()
			wait(0.30000000000000004)
			effectsServiceTweenProperty(v4079, "ImageTransparency", 0, 1, 0.15200000000000002)
			v4079:Destroy()
		end)
		effectsServiceWaitX(0.09)
	end

	wait(0.08000000000000002)
	audioService.PlaySound("MinigunEnd")
end
function module.ShootAllMinigun(p2117, _, target, p2120)
	local battleNew = p2117.Parent.BattleNew
	local s1

	if p2120 == "" then
		s1 = "Enemy"
	elseif p2120 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v4087 = battleNew[s1 .. "Field"]
	local v4088 = battleNew["Virtual" .. s1 .. "Field"]

	local single = typeof(target) == "Instance" and target:IsA("GuiObject") and target.Parent ~= nil

	if not single then
		audioService.PlaySound("MinigunStart")
		wait(0.2)
	end

	for _, v in pairs(_G.__SweepTargets(v4087, target)) do
		spawn(function()
			local n1 = v.ZIndex + 10000
			local uDim2 = UDim2.new(0, v.AbsoluteSize.X / 1.5, 0, v.AbsoluteSize.X / 1.5)
			local uDim2New = UDim2.new
			local x = v.AbsolutePosition.X
			local v4486 = v.AbsoluteSize.X
			local randomNumber = math.random(10, 40)
			local y = v.AbsolutePosition.Y
			local v4489 = v.AbsoluteSize.Y
			local randomNumber49 = math.random(10, 40)
			local v4491 = uDim2New(0, x + v4486 / (randomNumber * 0.1), 0, y + v4489 / (randomNumber49 * 0.1))
			local randomNumber50 = math.random(1, 180)
			local v4493 = effectsServiceNewerCircle(p2117, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://469244176",
				ZIndex = n1,
				Size = uDim2,
				Position = v4491,
				Rotation = randomNumber50
			})

			spawn(function()
				effectsService.Shake(v, v.Position, 0.2, 0.2)
			end)
			audioService.PlaySound("MinigunShot")
			effectsServiceWaitX(0.3)
			spawn(function()
				effectsService.NewTweenProperty(v4493, "ImageTransparency", 0, 1, 0.5, "Quint")
			end)
			effectsServiceWaitX(0.5)
			v4493:Destroy()
		end)
		effectsServiceWaitX(0.1)
	end

	if not single then
		audioService.PlaySound("MinigunEnd")
	end
end
function module.ShootAll(p2121, _, target, p2124)
	local battleNew = p2121.Parent.BattleNew
	local s1

	if p2124 == "" then
		s1 = "Enemy"
	elseif p2124 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v4098 = battleNew["Virtual" .. s1 .. "Field"]

	for _, v in pairs(_G.__SweepTargets(battleNew[s1 .. "Field"], target)) do
		spawn(function()
			local n1 = v.ZIndex + 10000
			local uDim2 = UDim2.new(0, v.AbsoluteSize.X / 1.5, 0, v.AbsoluteSize.X / 1.5)
			local uDim2New = UDim2.new
			local x = v.AbsolutePosition.X
			local v4498 = v.AbsoluteSize.X
			local randomNumber = math.random(10, 40)
			local y = v.AbsolutePosition.Y
			local v4501 = v.AbsoluteSize.Y
			local randomNumber51 = math.random(10, 40)
			local v4503 = uDim2New(0, x + v4498 / (randomNumber * 0.1), 0, y + v4501 / (randomNumber51 * 0.1))
			local randomNumber52 = math.random(1, 180)
			local v4505 = effectsServiceNewerCircle(p2121, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://469244176",
				ZIndex = n1,
				Size = uDim2,
				Position = v4503,
				Rotation = randomNumber52
			})

			spawn(function()
				effectsService.Shake(v, v.Position, 0.2, 0.2)
			end)
			audioService.PlaySound("GunShot")
			effectsServiceWaitX(0.3)
			spawn(function()
				effectsService.NewTweenProperty(v4505, "ImageTransparency", 0, 1, 0.5, "Quint")
			end)
			effectsServiceWaitX(0.5)
			v4505:Destroy()
		end)
		effectsServiceWaitX(0.1)
	end
end
function module.BigShootAll(p2125, _, target, p2128)
	local battleNew = p2125.Parent.BattleNew
	local s1

	if p2128 == "" then
		s1 = "Enemy"
	elseif p2128 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v4108 = battleNew["Virtual" .. s1 .. "Field"]

	for _, v in pairs(_G.__SweepTargets(battleNew[s1 .. "Field"], target)) do
		spawn(function()
			local n1 = v.ZIndex + 10000
			local uDim2 = UDim2.new(0, v.AbsoluteSize.X, 0, v.AbsoluteSize.X)
			local uDim2New = UDim2.new
			local x = v.AbsolutePosition.X
			local v4510 = v.AbsoluteSize.X
			local randomNumber = math.random(10, 40)
			local y = v.AbsolutePosition.Y
			local v4513 = v.AbsoluteSize.Y
			local randomNumber53 = math.random(10, 40)
			local v4515 = uDim2New(0, x + v4510 / (randomNumber * 0.1), 0, y + v4513 / (randomNumber53 * 0.1))
			local randomNumber54 = math.random(1, 180)
			local v4517 = effectsServiceNewerCircle(p2125, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://469244176",
				ZIndex = n1,
				Size = uDim2,
				Position = v4515,
				Rotation = randomNumber54
			})

			spawn(function()
				effectsService.Shake(v, v.Position, 0.2, 0.4)
			end)
			audioService.PlaySound("SniperShot")
			effectsServiceWaitX(0.3)
			spawn(function()
				effectsService.NewTweenProperty(v4517, "ImageTransparency", 0, 1, 0.5, "Quint")
			end)
			effectsServiceWaitX(0.5)
			v4517:Destroy()
		end)
		effectsServiceWaitX(0.1)
	end
end
function module.SmallShootAll(p2129, _, target, p2132)
	local battleNew = p2129.Parent.BattleNew
	local s1

	if p2132 == "" then
		s1 = "Enemy"
	elseif p2132 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v4118 = battleNew["Virtual" .. s1 .. "Field"]

	for _, v in pairs(_G.__SweepTargets(battleNew[s1 .. "Field"], target)) do
		spawn(function()
			local n1 = v.ZIndex + 10000
			local uDim2 = UDim2.new(0, v.AbsoluteSize.X, 0, v.AbsoluteSize.X)
			local uDim2New = UDim2.new
			local x = v.AbsolutePosition.X
			local v4522 = v.AbsoluteSize.X
			local randomNumber = math.random(10, 40)
			local y = v.AbsolutePosition.Y
			local v4525 = v.AbsoluteSize.Y
			local randomNumber55 = math.random(10, 40)
			local v4527 = uDim2New(0, x + v4522 / (randomNumber * 0.1), 0, y + v4525 / (randomNumber55 * 0.1))
			local randomNumber56 = math.random(1, 180)
			local v4529 = effectsServiceNewerCircle(p2129, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://469244176",
				ZIndex = n1,
				Size = uDim2,
				Position = v4527,
				Rotation = randomNumber56
			})

			spawn(function()
				effectsService.Shake(v, v.Position, 0.2, 0.4)
			end)
			audioService.PlaySound("GunShot")
			effectsServiceWaitX(0.3)
			spawn(function()
				effectsService.NewTweenProperty(v4529, "ImageTransparency", 0, 1, 0.5, "Quint")
			end)
			effectsServiceWaitX(0.5)
			v4529:Destroy()
		end)
		effectsServiceWaitX(0.1)
	end
end
local function Rifle(p2133, p2134, p2135, _, p2137, p2138, p2139)
	effectsServicePreloadTech(p2133, { "rbxassetid://469244176" })

	local color3552 = Color3.fromRGB(0, 0, 0)
	local n1 = p2135.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2135.AbsoluteSize.X * 1.4 * p2137, 0, p2135.AbsoluteSize.X * 1.4 * p2137)
	local uDim2178 = UDim2.new(0, p2134.AbsolutePosition.X + p2134.AbsoluteSize.X / 2, 0, p2134.AbsolutePosition.Y + p2134.AbsoluteSize.Y / 2)
	local v4132 = effectsServiceNewerCircle(p2133, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = p2138,
		ImageColor3 = color3552,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2178
	})

	effectsServiceTweenProperty(v4132, "ImageTransparency", 1, 0, 0.3 * p2137)

	local uDim2179 = UDim2.new(0, p2135.AbsolutePosition.X, 0, p2135.AbsolutePosition.Y)
	local uDim2180 = UDim2.new(0, p2135.AbsoluteSize.X * 0.5, 0, p2135.AbsoluteSize.Y * 0.5)

	v4132:TweenPosition(uDim2179 + uDim2180, "Out", "Quint", 0.6 * p2137, true)
	effectsServiceWaitX(0.6 * p2137)
	spawn(function()
		effectsService.Shake(p2135, p2135.Position, 0.5 * p2137, 0.6 * p2137)
	end)

	local n2 = p2135.ZIndex + 10000
	local uDim2181 = UDim2.new(0, p2135.AbsoluteSize.X * 1.65 * p2137, 0, p2135.AbsoluteSize.X * 1.65 * p2137)
	local uDim2182 = UDim2.new(0, p2135.AbsolutePosition.X, 0, p2135.AbsolutePosition.Y)
	local uDim2183 = UDim2.new(0, p2135.AbsoluteSize.X * 0.5, 0, p2135.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(1, 180)
	local v4140 = effectsServiceNewerCircle(p2133, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://469244176",
		ZIndex = n2,
		Size = uDim2181,
		Position = uDim2182 + uDim2183,
		Rotation = randomNumber
	})

	audioService.PlaySound(p2139)

	if p2137 >= 0.5 then
		effectsService.ShakeBattle(p2133, 0.1, 0.025)
	end

	spawn(function()
		effectsService.Shake(v4140, v4140.Position, 0.4 * p2137, 0.6 * p2137)
	end)
	spawn(function()
		effectsService.Shake(v4132, v4132.Position, 0.4 * p2137, 0.6 * p2137)
	end)
	effectsServiceWaitX(0.4 * p2137)
	spawn(function()
		effectsServiceTweenProperty(v4140, "ImageTransparency", 0, 1, 0.4 * p2137)
		v4140:Destroy()
		effectsServiceTweenProperty(v4132, "ImageTransparency", 0, 1, 0.4 * p2137)
		v4132:Destroy()
	end)
end
function module.LargeRifle(p2140, p2141, p2142, p2143)
	Rifle(p2140, p2141, p2142, p2143, 1, "rbxassetid://12227172496", "SniperShot")
end
function module.LargeRifleEffect(p2144, p2145, p2146, _)
	module.LargeRifle(p2144, p2145, p2146, nil, nil)
end
function module.MidRifle(p2148, p2149, p2150, p2151)
	Rifle(p2148, p2149, p2150, p2151, 0.6, "rbxassetid://12227167713", "Rifle Shot 2")
end
function module.MidRifleEffect(p2152, p2153, p2154, _)
	module.MidRifle(p2152, p2153, p2154, nil, nil)
end
function module.SmallRifle(p2156, p2157, p2158, p2159)
	Rifle(p2156, p2157, p2158, p2159, 0.4, "rbxassetid://12227166354", "Rifle Shot")
end
function module.SmallRifleEffect(p2160, p2161, p2162, _)
	module.SmallRifle(p2160, p2161, p2162, nil, nil)
end
function module.SmallRifleEffectAsync(p2164, p2165, p2166, _)
	task.spawn(function()
		module.SmallRifle(p2164, p2165, p2166, nil, nil)
	end)
end
local function Revolver(p2168, _, p2170, _, p2172, p2173)
	effectsServicePreloadTech(p2168, { "rbxassetid://469244176" })
	audioService.PlaySound("RevolverSet")
	effectsServiceWaitX(0.55 * p2172)
	spawn(function()
		effectsService.Shake(p2170, p2170.Position, 0.35 * p2172, 0.45 * p2172)
	end)

	local n1 = p2170.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2170.AbsoluteSize.X * 1.65 * p2172, 0, p2170.AbsoluteSize.X * 1.65 * p2172)
	local uDim2184 = UDim2.new(0, p2170.AbsolutePosition.X, 0, p2170.AbsolutePosition.Y)
	local uDim2185 = UDim2.new(0, p2170.AbsoluteSize.X * 0.5, 0, p2170.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(1, 180)
	local v4180 = effectsServiceNewerCircle(p2168, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://469244176",
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2184 + uDim2185,
		Rotation = randomNumber
	})

	audioService.PlaySound(p2173)
	effectsService.ShakeBattle(p2168, 0.1, 0.025)
	spawn(function()
		effectsService.Shake(v4180, v4180.Position, 0.3 * p2172, 0.5 * p2172)
	end)
	effectsServiceWaitX(0.4 * p2172)
	spawn(function()
		effectsServiceTweenProperty(v4180, "ImageTransparency", 0, 1, 0.4 * p2172)
		v4180:Destroy()
	end)
end
function module.LargeRevolver(p2174, p2175, p2176, p2177)
	Revolver(p2174, p2175, p2176, p2177, 1, "RevolverShot3")
end
function module.LargeRevolverEffect(p2178, p2179, p2180, _)
	module.LargeRevolver(p2178, p2179, p2180, nil, nil)
end
function module.MidRevolver(p2182, p2183, p2184, p2185)
	Revolver(p2182, p2183, p2184, p2185, 0.8, "RevolverShot2")
end
function module.MidRevolverEffect(p2186, p2187, p2188, _)
	module.MidRevolver(p2186, p2187, p2188, nil, nil)
end
function module.SmallRevolver(p2190, p2191, p2192, p2193)
	Revolver(p2190, p2191, p2192, p2193, 0.6, "RevolverShot")
end
function module.SmallRevolverEffect(p2194, p2195, p2196, _)
	module.MidRevolver(p2194, p2195, p2196, nil, nil)
end
function module.LargePaintball(p2198, p2199, p2200, _, _, _)
	effectsServicePreloadTech(p2198, {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	})

	local color3553 = Color3.fromRGB(0, 0, 0)
	local n1 = p2200.ZIndex + 10001
	local uDim2 = UDim2.new(0, p2200.AbsoluteSize.X * 1.4, 0, p2200.AbsoluteSize.X * 1.4)
	local uDim2186 = UDim2.new(0, p2199.AbsolutePosition.X + p2199.AbsoluteSize.X / 2, 0, p2199.AbsolutePosition.Y + p2199.AbsoluteSize.Y / 2)
	local v4215 = effectsServiceNewerCircle(p2198, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://5095587174",
		ImageTransparency = 1,
		ImageColor3 = color3553,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2186
	})
	local t58: {[any]: any} = {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	}

	effectsServiceTweenProperty(v4215, "ImageTransparency", 1, 0, 0.3)

	local uDim2187 = UDim2.new(0, p2200.AbsolutePosition.X, 0, p2200.AbsolutePosition.Y)
	local uDim2188 = UDim2.new(0, p2200.AbsoluteSize.X * 0.5, 0, p2200.AbsoluteSize.Y * 0.5)

	v4215:TweenPosition(uDim2187 + uDim2188, "Out", "Quint", 0.5, true)
	effectsServiceWaitX(0.5)
	audioService.PlaySound("Paintball")
	spawn(function()
		effectsService.Shake(p2200, p2200.Position, 0.5, 0.6)
	end)

	local randomNumber = math.random(1, #t58)
	local v4220 = t58[randomNumber]
	local n2 = p2200.ZIndex + 10000
	local uDim2189 = UDim2.new(0, p2200.AbsoluteSize.X * 1.65, 0, p2200.AbsoluteSize.X * 1.65)
	local uDim2190 = UDim2.new(0, p2200.AbsolutePosition.X, 0, p2200.AbsolutePosition.Y)
	local uDim2191 = UDim2.new(0, p2200.AbsoluteSize.X * 0.5, 0, p2200.AbsoluteSize.Y * 0.5)
	local randomNumber57 = math.random(1, 360)
	local v4226 = effectsServiceNewerCircle(p2198, {
		BackgroundTransparency = 1,
		Image = v4220,
		ZIndex = n2,
		Size = uDim2189,
		Position = uDim2190 + uDim2191,
		Rotation = randomNumber57
	})

	audioService.PlaySound("Rifle Shot")
	effectsService.ShakeBattle(p2198, 0.1, 0.025)
	spawn(function()
		effectsService.Shake(v4226, v4226.Position, 0.4, 0.6)
	end)
	spawn(function()
		effectsService.Shake(v4215, v4215.Position, 0.4, 0.6)
	end)
	effectsServiceWaitX(0.4)
	spawn(function()
		effectsServiceTweenProperty(v4226, "ImageTransparency", 0, 1, 0.4)
		v4226:Destroy()
		effectsServiceTweenProperty(v4215, "ImageTransparency", 0, 1, 0.4)
		v4215:Destroy()
	end)
end
function module.LargePaintballEffect(p2204, p2205, p2206, _)
	module.LargePaintball(p2204, p2205, p2206, nil, nil)
end
function module.MidPaintball(p2208, _, p2210, _, _, _)
	effectsServicePreloadTech(p2208, {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	})

	local n1 = p2210.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2210.AbsoluteSize.X * 1, 0, p2210.AbsoluteSize.X * 1)
	local uDim2192 = UDim2.new(0, p2210.AbsolutePosition.X + p2210.AbsoluteSize.X / 2, 0, p2210.AbsolutePosition.Y + p2210.AbsoluteSize.Y / 2)
	local v4240 = effectsServiceNewerCircle(p2208, {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/GunCursor.png",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2192
	})
	local t59: {[any]: any} = {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	}

	effectsServiceTweenProperty(v4240, "ImageTransparency", 1, 0, 0.2)

	local uDim2193 = UDim2.new(0, p2210.AbsolutePosition.X, 0, p2210.AbsolutePosition.Y)
	local uDim2194 = UDim2.new(0, p2210.AbsoluteSize.X * 0.5, 0, p2210.AbsoluteSize.Y * 0.5)

	v4240:TweenPosition(uDim2193 + uDim2194, "Out", "Quint", 0.2, true)
	effectsServiceWaitX(0.2)
	task.spawn(function()
		effectsService.Shake(p2210, p2210.Position, 0.24, 0.2)
	end)

	for _ = 1, 3 do
		local randomNumber = math.random(1, #t59)
		local v4246 = t59[randomNumber]
		local n2 = p2210.ZIndex + 10000
		local uDim2195 = UDim2.new(0, p2210.AbsoluteSize.X / 1.2, 0, p2210.AbsoluteSize.X / 1.2)
		local uDim2New = UDim2.new
		local x = p2210.AbsolutePosition.X
		local v4251 = p2210.AbsoluteSize.X
		local randomNumber58 = math.random(13, 20)
		local y = p2210.AbsolutePosition.Y
		local v4254 = p2210.AbsoluteSize.Y
		local randomNumber59 = math.random(13, 50)
		local v4256 = uDim2New(0, x + v4251 / (randomNumber58 * 0.1), 0, y + v4254 / (randomNumber59 * 0.1))
		local randomNumber60 = math.random(1, 360)
		local v4258 = effectsServiceNewerCircle(p2208, {
			BackgroundTransparency = 1,
			Image = v4246,
			ZIndex = n2,
			Size = uDim2195,
			Position = v4256,
			Rotation = randomNumber60
		})

		audioService.PlaySound("Paintball")
		task.spawn(function()
			wait(0.24)
			effectsServiceTweenProperty(v4258, "ImageTransparency", 0, 1, 0.16000000000000003)
			v4258:Destroy()
		end)
		effectsServiceWaitX(0.2)
	end

	effectsServiceTweenProperty(v4240, "ImageTransparency", 0, 1, 0.3)
	v4240:Destroy()
end
function module.MidPaintballEffect(p2214, p2215, p2216, _)
	module.MidPaintball(p2214, p2215, p2216, nil, nil)
end
function module.MidPaintballRedEffect(p2218, p2219, parent, _)
	task.spawn(function()
		module.MidPaintball(p2218, p2219, parent, nil, nil)
	end)

	local n1 = parent.ZIndex + 1
	local v4268 = UDim2.fromScale(0.8, 0.8)
	local v4269 = UDim2.fromScale(0.5, 0.5)
	local randomNumber = math.random(0, 360)
	local v4271 = effectsServiceNewerCircle(p2218, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13661466475",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = v4268,
		Position = v4269,
		Rotation = randomNumber
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v4271
	v4271.Parent = parent
	task.spawn(function()
		task.wait(0.9)
		v4271.ImageColor3 = Color3.fromRGB(255, 0, 0)
		effectsServiceTweenProperty(v4271, "ImageTransparency", 1, 0, 0.5)
	end)
end
function module.MidPaintballBlueEffect(p2222, p2223, parent, _)
	task.spawn(function()
		module.MidPaintball(p2222, p2223, parent, nil, nil)
	end)

	local n1 = parent.ZIndex + 1
	local v4278 = UDim2.fromScale(0.8, 0.8)
	local v4279 = UDim2.fromScale(0.5, 0.5)
	local randomNumber = math.random(0, 360)
	local v4281 = effectsServiceNewerCircle(p2222, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13661466475",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = v4278,
		Position = v4279,
		Rotation = randomNumber
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v4281
	v4281.Parent = parent
	task.spawn(function()
		task.wait(0.9)
		v4281.ImageColor3 = Color3.fromRGB(0, 76, 255)
		effectsServiceTweenProperty(v4281, "ImageTransparency", 1, 0, 0.5)
	end)
end
function module.MidPaintballGreenEffect(p2226, p2227, parent, _)
	task.spawn(function()
		module.MidPaintball(p2226, p2227, parent, nil, nil)
	end)

	local n1 = parent.ZIndex + 1
	local v4288 = UDim2.fromScale(0.8, 0.8)
	local v4289 = UDim2.fromScale(0.5, 0.5)
	local randomNumber = math.random(0, 360)
	local v4291 = effectsServiceNewerCircle(p2226, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13661466475",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = v4288,
		Position = v4289,
		Rotation = randomNumber
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v4291
	v4291.Parent = parent
	task.spawn(function()
		task.wait(0.9)
		v4291.ImageColor3 = Color3.fromRGB(38, 255, 0)
		effectsServiceTweenProperty(v4291, "ImageTransparency", 1, 0, 0.5)
	end)
end
function module.MidPaintballYellowEffect(p2230, p2231, parent, _)
	task.spawn(function()
		module.MidPaintball(p2230, p2231, parent, nil, nil)
	end)

	local n1 = parent.ZIndex + 1
	local v4298 = UDim2.fromScale(0.8, 0.8)
	local v4299 = UDim2.fromScale(0.5, 0.5)
	local randomNumber = math.random(0, 360)
	local v4301 = effectsServiceNewerCircle(p2230, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13661466475",
		ImageTransparency = 1,
		ZIndex = n1,
		Size = v4298,
		Position = v4299,
		Rotation = randomNumber
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v4301
	v4301.Parent = parent
	task.spawn(function()
		task.wait(0.9)
		v4301.ImageColor3 = Color3.fromRGB(255, 217, 0)
		effectsServiceTweenProperty(v4301, "ImageTransparency", 1, 0, 0.5)
	end)
end
function module.SmallPaintball(p2234, _, p2236, _, _, _, _)
	effectsServicePreloadTech(p2234, {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	})

	local t60: {[any]: any} = {
		"rbxassetid://11298082932",
		"rbxassetid://11298225938",
		"rbxassetid://8797712963",
		"rbxassetid://11298184542",
		"rbxassetid://6666533016"
	}

	spawn(function()
		effectsService.Shake(p2236, p2236.Position, 0.24, 0.1)
	end)
	audioService.PlaySound("Paintball")

	local randomNumber = math.random(1, #t60)
	local v4312 = t60[randomNumber]
	local n1 = p2236.ZIndex + 10000
	local uDim2 = UDim2.new(0, p2236.AbsoluteSize.X / 1.2, 0, p2236.AbsoluteSize.X / 1.2)
	local uDim2196 = UDim2.new(0, p2236.AbsolutePosition.X, 0, p2236.AbsolutePosition.Y)
	local uDim2197 = UDim2.new(0, p2236.AbsoluteSize.X * 0.5, 0, p2236.AbsoluteSize.Y * 0.5)
	local randomNumber61 = math.random(1, 360)
	local v4318 = effectsServiceNewerCircle(p2234, {
		BackgroundTransparency = 1,
		Image = v4312,
		ZIndex = n1,
		Size = uDim2,
		Position = uDim2196 + uDim2197,
		Rotation = randomNumber61
	})

	spawn(function()
		effectsService.Shake(v4318, v4318.Position, 0.4, 0.6)
	end)
	effectsServiceWaitX(0.2)
	spawn(function()
		effectsServiceTweenProperty(v4318, "ImageTransparency", 0, 1, 0.4)
		v4318:Destroy()
	end)
end
function module.SmallPaintballEffectEnemy(p2241, p2242, p2243, p2244)
	local s1

	if p2244 == "" then
		s1 = "Enemy"
	elseif p2244 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	local v4325 = p2241.Parent.BattleNew[s1 .. "Field"]

	task.spawn(function()
		module.SmallPaintball(p2241, p2242, p2243, nil, nil)
	end)
end
local function MissileEffect(p2245, p2246, p2247, p2248)
	local t61 = p2248 or {}
	local v4331 = t61.SizeMul or 1
	local v4332 = t61.GrowMul or 1
	local v4333 = t61.SpeedMul or 1
	local v4334 = t61.Count or 4
	local v4335 = t61.TrailSizeMul or 1
	local v4336 = t61.MissileImage or "rbxassetid://12769452974"
	local n1 = p2246.ZIndex + 10001
	local v4338 = uDim2New(0, p2246.AbsoluteSize.X / 2 * v4331, 0, p2246.AbsoluteSize.X / 2 * v4331)
	local v4339 = UDim2.fromOffset(p2246.AbsolutePosition.X + p2246.AbsoluteSize.X * 1.2, p2246.AbsolutePosition.Y + p2246.AbsoluteSize.Y / 7)
	local v4340 = effectsServiceNewerCircle(p2245, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.2,
		Image = "rbxassetid://121166032130421",
		Rotation = 32,
		ZIndex = n1,
		Size = v4338,
		Position = v4339
	})
	local v4341 = uDim2New(0, p2246.AbsoluteSize.X / 2 * v4331, 0, p2246.AbsoluteSize.X / 2 * v4331)
	local v4342 = UDim2.fromOffset(p2246.AbsolutePosition.X + p2246.AbsoluteSize.X * 1.2, p2246.AbsolutePosition.Y + p2246.AbsoluteSize.Y / 7)
	local v4343 = effectsServiceNewerCircle(p2245, {
		BackgroundTransparency = 1,
		ImageTransparency = 0.2,
		ZIndex = 10001,
		Image = "rbxassetid://121166032130421",
		Rotation = 32,
		Size = v4341,
		Position = v4342
	})

	audioServicePlaySound(t61.WarningSound or "AttentionFlash")

	local animationAnimateAsync = animation.AnimateAsync
	local v4345 = uDim2New(0, p2246.AbsoluteSize.X * v4332, 0, p2246.AbsoluteSize.X * v4332)

	animationAnimateAsync(v4343, { ImageTransparency = 1, Size = v4345 }, 1 / v4333, "Out", "Quad")
	task.wait(0.3 / v4333)
	animation.AnimateAsync(v4340, { ImageTransparency = 1 }, 1 / v4333, "Out", "Quad")
	task.spawn(function()
		for i = 1, v4334 do
			task.spawn(function()
				local u4532: boolean = true
				local randomNumber = math.random(3, 20)
				local randomNumber62 = math.random(2, 8)
				local vector2 = Vector2.new(p2246.AbsolutePosition.X + p2246.AbsoluteSize.X / 2, p2246.AbsolutePosition.Y + p2246.AbsoluteSize.Y / 2)
				local n1 = Vector2.new(vector2.X * (randomNumber / 10), vector2.Y * (randomNumber62 / 10)) - vector2
				local v4537 = math.atan2(n1.Y, n1.X)
				local v4538 = math.deg(v4537)

				audioServicePlaySound(t61.RocketSound or "AttentionRocket", { PlaybackSpeed = i * 1.1 * 1, Volume = t61.RocketVolume or 0.2 })

				local n2 = p2246.ZIndex + 10001
				local v4540 = uDim2New(0, p2246.AbsoluteSize.X / 4 * v4331, 0, p2246.AbsoluteSize.X / 2 * v4331)
				local v4541 = UDim2.fromOffset(p2246.AbsolutePosition.X + p2246.AbsoluteSize.X / 2, p2246.AbsolutePosition.Y + p2246.AbsoluteSize.Y / 2)

				n1 = effectsServiceNewerCircle(p2245, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					ZIndex = n2,
					Image = v4336,
					Size = v4540,
					Position = v4541
				})

				local parent = effectsServiceNewerCircle(p2245, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ImageColor3 = t61.MissileColor or Color3.fromRGB(150, 20, 20),
					ZIndex = p2246.ZIndex + 10001,
					Image = v4336,
					Size = uDim2New(0, p2246.AbsoluteSize.X * 1.3 * v4331, 0, p2246.AbsoluteSize.X * 1.3 * v4331),
					Position = UDim2.fromOffset(0, 0),
					Parent = n1
				})
				local n3 = p2246.ZIndex + 10000
				local v4544 = uDim2New(0, p2246.AbsoluteSize.X / 8 * v4331, 0, p2246.AbsoluteSize.X / 8 * v4331)
				local v4545 = UDim2.fromOffset(parent.AbsoluteSize.X / 5, parent.AbsoluteSize.Y / 2)
				local v4546 = effectsServiceNewerCircle(p2245, {
					BackgroundTransparency = 1,
					ImageTransparency = 1,
					Image = "rbxassetid://120733358290130",
					ZIndex = n3,
					Size = v4544,
					Position = v4545,
					Parent = parent
				})

				task.spawn(function()
					for _ = 1, 300 do
						while u4532 do
							task.spawn(function()
								local n1 = p2246.ZIndex + 10000
								local v4603 = uDim2New(0, p2246.AbsoluteSize.X / 3 * v4335, 0, p2246.AbsoluteSize.X / 3 * v4335)
								local v4604 = v4546
								local uDim2 = UDim2.new(0, v4604.AbsolutePosition.X, 0, v4604.AbsolutePosition.Y)
								local uDim2198 = UDim2.new(0, v4604.AbsoluteSize.X * 0.5, 0, v4604.AbsoluteSize.Y * 0.5)
								local v4607 = effectsServiceNewerCircle(p2245, {
									ImageTransparency = 0,
									Image = "rbxassetid://5552526748",
									ZIndex = n1,
									Size = v4603,
									Position = uDim2 + uDim2198
								})
								local animationAnimateAsync = animation.AnimateAsync

								v4604 = uDim2New(0, 0, 0, 0)
								animationAnimateAsync(v4607, { Size = v4604 }, 2 / v4333, "Out", "Quad")
								task.wait(2 / v4333)
								v4607:Destroy()
							end)
							task.wait(0.02)
						end
					end
				end)

				local animationAnimateAsync = animation.AnimateAsync
				local v4548 = UDim2.fromOffset((p2246.AbsolutePosition.X + p2246.AbsoluteSize.X / 2) * (randomNumber / 10), (p2246.AbsolutePosition.Y + p2246.AbsoluteSize.Y / 2) * (randomNumber62 / 10))

				animationAnimateAsync(n1, { Position = v4548 }, 0.5 / v4333, "Out", "Back")
				animation.AnimateAsync(parent, { Rotation = v4538 }, 0.1 / v4333, "InOut", "Sine")
				task.wait(0.5 / v4333)

				local vector22 = Vector2.new(n1.AbsolutePosition.X + n1.AbsoluteSize.X / 2, n1.AbsolutePosition.Y + n1.AbsoluteSize.Y / 2)
				local n4 = Vector2.new(p2247.AbsolutePosition.X + p2247.AbsoluteSize.X / 2, p2247.AbsolutePosition.Y + p2247.AbsoluteSize.Y / 2) - vector22

				v4541 = math.atan2(n4.Y, n4.X)
				v4537 = math.deg(v4541)
				animation.AnimateAsync(parent, { Rotation = v4537 }, 0.5 / v4333, "InOut", "Sine")

				local animateAsync = animation.AnimateAsync

				v4548 = UDim2.fromOffset(p2247.AbsolutePosition.X + p2247.AbsoluteSize.X / 2, p2247.AbsolutePosition.Y + p2247.AbsoluteSize.Y / 2)
				animateAsync(n1, { Position = v4548 }, 0.7 / v4333, "In", "Back")
				task.wait(0.7 / v4333)
				u4532 = false
				n1:Destroy()
				task.spawn(function()
					local randomNumber63 = math.random(t61.ExplosionRandomXMin or 92, t61.ExplosionRandomXMax or 108)
					local randomNumber64 = math.random(t61.ExplosionRandomYMin or 85, t61.ExplosionRandomYMax or 115)
					local n1 = p2246.AbsoluteSize.X * 2 * v4331
					local n2 = p2246.ZIndex + 10001
					local color3554 = Color3.fromRGB(255, 255, 20)
					local v4577 = uDim2New(0, n1, 0, n1)
					local v4578 = UDim2.fromOffset((p2247.AbsolutePosition.X + p2247.AbsoluteSize.X / 2) * (randomNumber63 / 100), (p2247.AbsolutePosition.Y + p2247.AbsoluteSize.Y / 2) * (randomNumber64 / 100))
					local v4579 = effectsServiceNewerCircle(p2245, {
						BackgroundTransparency = 1,
						ImageTransparency = 0.2,
						Image = "rbxassetid://5552526748",
						ZIndex = n2,
						ImageColor3 = color3554,
						Size = v4577,
						Position = v4578
					})
					local n3 = p2246.ZIndex + 10000
					local color3555 = Color3.fromRGB(255, 20, 20)
					local v4582 = uDim2New(0, p2246.AbsoluteSize.X * 2.3 * v4331, 0, p2246.AbsoluteSize.X * 2.3 * v4331)
					local v4583 = UDim2.fromOffset((p2247.AbsolutePosition.X + p2247.AbsoluteSize.X / 2) * (randomNumber63 / 100), (p2247.AbsolutePosition.Y + p2247.AbsoluteSize.Y / 2) * (randomNumber64 / 100))

					n1 = effectsServiceNewerCircle(p2245, {
						BackgroundTransparency = 1,
						ImageTransparency = 0.2,
						Image = "rbxassetid://5552526748",
						ZIndex = n3,
						ImageColor3 = color3555,
						Size = v4582,
						Position = v4583
					})

					local animationAnimateAsync = animation.AnimateAsync

					v4583 = uDim2New(0, 0, 0, 0)
					animationAnimateAsync(v4579, { Size = v4583 }, 1.7 / v4333, "Out", "Exponential")

					local animateAsync = animation.AnimateAsync

					v4583 = uDim2New(0, 0, 0, 0)
					animateAsync(n1, { Size = v4583 }, 1.7 / v4333, "Out", "Exponential")
					audioServicePlaySound(t61.ExplosionSound or "AttentionExplosion")
					effectsService.ShakeSync(p2247, p2247.Position, t61.ShakePower or 0.2, t61.ShakeDuration or 0.5)
					task.wait(1.7 / v4333)
					v4579:Destroy()
					n1:Destroy()
				end)
			end)
			task.wait(t61.SpawnDelay or 0.2)
		end
	end)
	task.wait(2 / v4333)
	v4340:Destroy()
	v4343:Destroy()
end
function module.LargeMissile(p2249, p2250, p2251)
	local color3556 = Color3.fromRGB(180, 15, 15)

	MissileEffect(p2249, p2250, p2251, {
		SizeMul = 1,
		GrowMul = 2.5,
		SpeedMul = 1,
		Count = 4,
		TrailSizeMul = 1.25,
		RocketVolume = 0.3,
		ShakePower = 0.5,
		ShakeDuration = 0.5,
		MissileColor = color3556
	})
end
function module.MidMissile(p2252, p2253, p2254)
	local color3557 = Color3.fromRGB(173, 23, 23)

	MissileEffect(p2252, p2253, p2254, {
		SizeMul = 0.75,
		GrowMul = 1.75,
		SpeedMul = 1.2,
		Count = 3,
		TrailSizeMul = 1,
		RocketVolume = 0.2,
		ShakePower = 0.3,
		ShakeDuration = 0.4,
		MissileColor = color3557
	})
end
function module.SmallMissile(p2255, p2256, p2257)
	local color3558 = Color3.fromRGB(234, 47, 47)

	MissileEffect(p2255, p2256, p2257, {
		SizeMul = 0.5,
		GrowMul = 1,
		SpeedMul = 1.5,
		Count = 2,
		TrailSizeMul = 0.5,
		RocketVolume = 0.15,
		ShakePower = 0.15,
		ShakeDuration = 0.3,
		MissileColor = color3558
	})
end
function module.LargeModernMissile(p2258, p2259, p2260)
	local color3559 = Color3.fromRGB(255, 255, 255)

	MissileEffect(p2258, p2259, p2260, {
		SizeMul = 1,
		GrowMul = 2.5,
		SpeedMul = 1,
		Count = 4,
		TrailSizeMul = 1.25,
		MissileImage = "rbxassetid://12769454704",
		RocketVolume = 0.3,
		ShakePower = 0.5,
		ShakeDuration = 0.5,
		MissileColor = color3559
	})
end
function module.MidModernMissile(p2261, p2262, p2263)
	local color3560 = Color3.fromRGB(255, 255, 255)

	MissileEffect(p2261, p2262, p2263, {
		SizeMul = 0.75,
		GrowMul = 1.75,
		SpeedMul = 1.2,
		Count = 3,
		TrailSizeMul = 1,
		MissileImage = "rbxassetid://12769454704",
		RocketVolume = 0.2,
		ShakePower = 0.3,
		ShakeDuration = 0.4,
		MissileColor = color3560
	})
end
function module.SmallModernMissile(p2264, p2265, p2266)
	local color3561 = Color3.fromRGB(255, 255, 255)

	MissileEffect(p2264, p2265, p2266, {
		SizeMul = 0.5,
		GrowMul = 1,
		SpeedMul = 1.5,
		Count = 2,
		TrailSizeMul = 0.5,
		MissileImage = "rbxassetid://12769454704",
		RocketVolume = 0.15,
		ShakePower = 0.15,
		ShakeDuration = 0.3,
		MissileColor = color3561
	})
end

local t3: {[any]: any} = { "LaserRed", "LaserBlue", "Minigun", "ModernMissile", "Missile" }

local function RandomArmament(p2267, p2268, p2269, p2270, p2271)
	local randomNumber = math.random(1, #t3)
	local s1: string = p2271 .. t3[randomNumber]
	local v4377 = module[s1]

	if v4377 then
		v4377(p2267, p2268, p2269, p2270)
	else
		warn("Missing Armaments effect: " .. s1)
	end

	task.wait(0.1)
end
function module.LargeArmaments(p2272, p2273, p2274, p2275)
	RandomArmament(p2272, p2273, p2274, p2275, "Large")
end
function module.MidArmaments(p2276, p2277, p2278, p2279)
	RandomArmament(p2276, p2277, p2278, p2279, "Mid")
end
function module.SmallArmaments(p2280, p2281, p2282, p2283)
	RandomArmament(p2280, p2281, p2282, p2283, "Small")
end
function module.MiniMissile(p2284, p2285, p2286, _)
	task.spawn(function()
		local n1: number = 1

		task.spawn(function()
			local u4552: boolean = true
			local randomNumber = math.random(3, 20)
			local randomNumber65 = math.random(2, 8)
			local vector2 = Vector2.new(p2285.AbsolutePosition.X + p2285.AbsoluteSize.X / 2, p2285.AbsolutePosition.Y + p2285.AbsoluteSize.Y / 2)
			local n3 = Vector2.new(vector2.X * (randomNumber / 10), vector2.Y * (randomNumber65 / 10)) - vector2
			local v4557 = math.atan2(n3.Y, n3.X)
			local v4558 = math.deg(v4557)

			audioServicePlaySound("AttentionRocket", { Volume = 0.2, PlaybackSpeed = n1 * 1.1 * 1 })

			local v4559 = uDim2New(0, p2285.AbsoluteSize.X / 4, 0, p2285.AbsoluteSize.X / 2)
			local v4560 = UDim2.fromOffset(p2285.AbsolutePosition.X + p2285.AbsoluteSize.X / 2, p2285.AbsolutePosition.Y + p2285.AbsoluteSize.Y / 2)

			n3 = effectsServiceNewerCircle(p2284, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 10001,
				Image = "rbxassetid://12769452974",
				Size = v4559,
				Position = v4560
			})

			local color3562 = Color3.fromRGB(150, 20, 20)
			local v4562 = uDim2New(0, p2285.AbsoluteSize.X * 1.3, 0, p2285.AbsoluteSize.X * 1.3)
			local v4563 = UDim2.fromOffset(0, 0)
			local parent = effectsServiceNewerCircle(p2284, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				ZIndex = 10001,
				Image = "rbxassetid://12769452974",
				ImageColor3 = color3562,
				Size = v4562,
				Position = v4563,
				Parent = n3
			})

			v4563 = uDim2New(0, p2285.AbsoluteSize.X / 8, 0, p2285.AbsoluteSize.X / 8)
			v4562 = UDim2.fromOffset(parent.AbsoluteSize.X / 5, parent.AbsoluteSize.Y / 2)

			local v4565 = effectsServiceNewerCircle(p2284, {
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 10000,
				Image = "rbxassetid://120733358290130",
				Size = v4563,
				Position = v4562,
				Parent = parent
			})

			task.spawn(function()
				for _ = 1, 300 do
					while u4552 == true do
						task.spawn(function()
							local v4609 = uDim2New(0, p2285.AbsoluteSize.X / 3, 0, p2285.AbsoluteSize.X / 3)
							local v4610 = v4565
							local uDim2 = UDim2.new(0, v4610.AbsolutePosition.X, 0, v4610.AbsolutePosition.Y)
							local uDim2199 = UDim2.new(0, v4610.AbsoluteSize.X * 0.5, 0, v4610.AbsoluteSize.Y * 0.5)
							local v4613 = effectsServiceNewerCircle(p2284, {
								ImageTransparency = 0,
								ZIndex = 10000,
								Image = "rbxassetid://5552526748",
								Size = v4609,
								Position = uDim2 + uDim2199
							})
							local animationAnimateAsync = animation.AnimateAsync

							v4610 = uDim2New(0, 0, 0, 0)
							animationAnimateAsync(v4613, { Size = v4610 }, 2, "Out", "Quad")
							task.wait(2)
							v4613:Destroy()
						end)
						task.wait(0.02)
					end
				end
			end)

			local animationAnimateAsync = animation.AnimateAsync
			local v4567 = UDim2.fromOffset((p2285.AbsolutePosition.X + p2285.AbsoluteSize.X / 2) * (randomNumber / 10), (p2285.AbsolutePosition.Y + p2285.AbsoluteSize.Y / 2) * (randomNumber65 / 10))

			animationAnimateAsync(n3, { Position = v4567 }, 0.5, "Out", "Back")
			animation.AnimateAsync(parent, { Rotation = v4558 }, 0.1, "InOut", "Sine")
			task.wait(0.5)

			local vector23 = Vector2.new(n3.AbsolutePosition.X + n3.AbsoluteSize.X / 2, n3.AbsolutePosition.Y + n3.AbsoluteSize.Y / 2)
			local n2 = Vector2.new(p2286.AbsolutePosition.X + p2286.AbsoluteSize.X / 2, p2286.AbsolutePosition.Y + p2286.AbsoluteSize.Y / 2) - vector23

			v4560 = math.atan2(n2.Y, n2.X)
			v4557 = math.deg(v4560)
			animation.AnimateAsync(parent, { Rotation = v4557 }, 0.5, "InOut", "Sine")

			local animateAsync = animation.AnimateAsync

			v4567 = UDim2.fromOffset(p2286.AbsolutePosition.X + p2286.AbsoluteSize.X / 2, p2286.AbsolutePosition.Y + p2286.AbsoluteSize.Y / 2)
			animateAsync(n3, { Position = v4567 }, 0.7, "In", "Back")
			task.wait(0.7)
			u4552 = false
			n3:Destroy()
			task.spawn(function()
				local randomNumber66 = math.random(92, 108)
				local randomNumber67 = math.random(85, 115)
				local n1 = p2285.ZIndex + 10001
				local color3563 = Color3.fromRGB(255, 255, 20)
				local v4591 = uDim2New(0, p2285.AbsoluteSize.X * 2, 0, p2285.AbsoluteSize.X * 2)
				local v4592 = UDim2.fromOffset((p2286.AbsolutePosition.X + p2286.AbsoluteSize.X / 2) * (randomNumber66 / 100), (p2286.AbsolutePosition.Y + p2286.AbsoluteSize.Y / 2) * (randomNumber67 / 100))
				local v4593 = effectsServiceNewerCircle(p2284, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://5552526748",
					ZIndex = n1,
					ImageColor3 = color3563,
					Size = v4591,
					Position = v4592
				})
				local n2 = p2285.ZIndex + 10000
				local color3564 = Color3.fromRGB(255, 20, 20)
				local v4596 = uDim2New(0, p2285.AbsoluteSize.X * 2.3, 0, p2285.AbsoluteSize.X * 2.3)
				local v4597 = UDim2.fromOffset((p2286.AbsolutePosition.X + p2286.AbsoluteSize.X / 2) * (randomNumber66 / 100), (p2286.AbsolutePosition.Y + p2286.AbsoluteSize.Y / 2) * (randomNumber67 / 100))
				local v4598 = effectsServiceNewerCircle(p2284, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.2,
					Image = "rbxassetid://5552526748",
					ZIndex = n2,
					ImageColor3 = color3564,
					Size = v4596,
					Position = v4597
				})
				local animationAnimateAsync = animation.AnimateAsync
				local v4600 = uDim2New(0, 0, 0, 0)

				animationAnimateAsync(v4593, { Size = v4600 }, 1.7, "Out", "Exponential")

				local animateAsync = animation.AnimateAsync

				v4600 = uDim2New(0, 0, 0, 0)
				animateAsync(v4598, { Size = v4600 }, 1.7, "Out", "Exponential")
				audioServicePlaySound("AttentionExplosion")
				effectsService.ShakeSync(p2286, p2286.Position, 0.2, 0.5)
				task.wait(1.7)
				v4593:Destroy()
				v4598:Destroy()
			end)
		end)
		task.wait(0.2)
	end)
	task.wait(1.2)
end
function module.MiniMissilesEnemy(p2288, p2289, _, p2291)
	local s1

	if p2291 == "" then
		s1 = "Enemy"
	elseif p2291 == "Enemy" then
		s1 = ""
	else
		s1 = nil
	end

	for _, v in ipairs(_G.__NoFaces(p2288.Parent.BattleNew[s1 .. "Field"])) do
		if v:IsA("GuiObject") then
			task.spawn(function()
				module.MiniMissile(p2288, p2289, v, p2291)
			end)
			task.wait(0.1)
		end
	end

	task.wait(1.2)
end
function module.MiniMissilesAlly(p2292, p2293, _, p2295)
	local s1

	if p2295 == "" then
		s1 = ""
	elseif p2295 == "Enemy" then
		s1 = "Enemy"
	else
		s1 = nil
	end

	for _, v in ipairs(_G.__NoFaces(p2292.Parent.BattleNew[s1 .. "Field"])) do
		if v:IsA("GuiObject") then
			task.spawn(function()
				module.MiniMissile(p2292, p2293, v, p2295)
			end)
			task.wait(0.1)
		end
	end

	task.wait(1.2)
end

return module
