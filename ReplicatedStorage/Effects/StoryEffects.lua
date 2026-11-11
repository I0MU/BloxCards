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
local tweenService: TweenService = game:GetService("TweenService")

require(game.ReplicatedStorage.CopyTable)

local uDim2New = UDim2.new
local vector2New = Vector2.new
local mathRandom = math.random
local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local audioServiceDimSongs = audioService.DimSongs
local audioServiceUndimSongs = audioService.UndimSongs

local function v43(className)
	local v54 = Instance.new(className)

	return function(p3)
		for k, v in pairs(p3) do
			v54[k] = v
		end

		return v54
	end
end

v43 = function(p4)
	return (mathRandom() - 0.5) * p4
end
v43 = function(p5, p6)
	for k, v in pairs(p6) do
		p5[k] = v
	end
end
v43 = function(p7, p8)
	if p8 then
		local vector3 = Vector3.new(p7.AbsolutePosition.X + p8.X.Offset + p7.AbsoluteSize.X / 2, p7.AbsolutePosition.Y + p8.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p7.AbsolutePosition.X + p7.AbsoluteSize.X / 2, p7.AbsolutePosition.Y, 0)

	return vector3
end
v43 = function(p9, p10)
	return (math.atan2(p10.Y - p9.Y, p10.X - p9.X))
end

local function Lerp(p11, p12, p13)
	return p11 * (1 - p13) + p12 * p13
end
local function evalColorSequence(p14, p15)
	if p15 == 0 then
		return p14.Keypoints[1].Value
	end

	if p15 == 1 then
		return p14.Keypoints[#p14.Keypoints].Value
	end

	for i = 1, #p14.Keypoints - 1 do
		local v72 = p14.Keypoints[i]
		local v73 = p14.Keypoints[i + 1]

		if p15 >= v72.Time and p15 < v73.Time then
			local n1 = (p15 - v72.Time) / (v73.Time - v72.Time)

			return Color3.new((v73.Value.R - v72.Value.R) * n1 + v72.Value.R, (v73.Value.G - v72.Value.G) * n1 + v72.Value.G, (v73.Value.B - v72.Value.B) * n1 + v72.Value.B)
		end
	end
end
local function randomPosOnTarget(p16)
	local y = p16.AbsolutePosition.Y
	local n1 = p16.AbsolutePosition.Y + p16.AbsoluteSize.Y
	local uDim2New = UDim2.new
	local randomNumber = math.random(p16.AbsolutePosition.X, p16.AbsolutePosition.X + p16.AbsoluteSize.X)

	return uDim2New(0, randomNumber, 0, math.random(y, n1))
end

randomPosOnTarget = function(p17)
	local uDim2 = UDim2.new(0, p17.AbsolutePosition.X, 0, p17.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p17.AbsoluteSize.X * 0.5, 0, p17.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end

local function returnField(p18)
	if p18 == "" then
		return "", "Enemy"
	end

	if p18 == "Enemy" then
		return "Enemy", ""
	end
end

local module: {[any]: any} = {
	PurpleSparks = function(p19, _, p21, _)
		audioServicePlaySound("Shocking")
		audioServicePlaySound("Shocking2")
		task.spawn(function()
			effectsService.ShakeInOut(p21, p21.Position, 0.3, 0.01)
		end)
		task.spawn(function()
			for _ = 1, 3 do
				local color3 = Color3.fromRGB(199, 29, 255)
				local uDim2 = UDim2.new(0, p21.AbsoluteSize.X * 1.7, 0, p21.AbsoluteSize.X * 1.7)
				local t12: {[any]: any} = {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = "rbxassetid://11862032588",
					ZIndex = 1000001,
					ImageColor3 = color3,
					Size = uDim2,
					Position = p21 and UDim2.new(0, p21.AbsolutePosition.X, 0, p21.AbsolutePosition.Y) + UDim2.new(0, p21.AbsoluteSize.X * 0.5, 0, p21.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
					Rotation = math.random(0, 180)
				}
				local v345 = effectsServiceNewerCircle(p19, t12)

				task.spawn(function()
					effectsServiceSpritesheet(v345, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
					v345:Destroy()
				end)
				task.wait(0.1)
			end
		end)
	end,
	ZanzelRaidNextPhase = function(p23, p24, _, _)
		local t2: {[any]: any} = {
			"rbxassetid://14471362207",
			"rbxassetid://15011464541",
			"rbxassetid://13803462600"
		}

		audioServicePlaySound("Ghosts")
		audioServicePlaySound("Shocking")
		task.spawn(function()
			for i = 1, 6 do
				local color3 = Color3.fromRGB(29, 255, 44)
				local v348 = t2[i % 3 + 1]
				local uDim2 = UDim2.new(0, p24.AbsoluteSize.X * 1.7, 0, p24.AbsoluteSize.X * 1.7)
				local t13: {[any]: any} = {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					ZIndex = 1000001,
					ImageColor3 = color3,
					Image = v348,
					Size = uDim2,
					Position = p24 and UDim2.new(0, p24.AbsolutePosition.X, 0, p24.AbsolutePosition.Y) + UDim2.new(0, p24.AbsoluteSize.X * 0.5, 0, p24.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
					Rotation = math.random(0, 180)
				}
				local v351 = effectsServiceNewerCircle(p23, t13)

				task.spawn(function()
					effectsServiceSpritesheet(v351, Vector2.new(128, 128), { 8, 8 }, 1, 64, 64)
					v351:Destroy()
				end)
				task.wait(0.1)
			end
		end)
		effectsService.ShakeInOut(p24, p24.Position, 0.8, 0.005)
	end
}

function module.ZanzelRaidSummon(p27, p28, _, p30)
	local color3 = Color3.fromRGB(0, 0, 0)
	local n1 = p28.ZIndex - 1
	local v99 = uDim2New(1, 0, 2, 0)
	local v100 = uDim2New(0.5, 0, 0.5, 0)
	local v101 = effectsServiceNewerCircle(p27, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Rotation = 0,
		BackgroundColor3 = color3,
		ZIndex = n1,
		Size = v99,
		Position = v100
	})

	animation.AnimateAsync(v101, { BackgroundTransparency = 0.1 }, 0.5, "Out", "Quad")
	effectsServiceSetCardZIndex(p28, p28.ZIndex + 99999)

	local virtualField = p27.Parent.BattleNew.VirtualField
	local v103 = p28.Position
	local absoluteSize = p28.AbsoluteSize

	p28.Size = uDim2New(0, 0, 0, 0)
	p28.Position = UDim2.fromScale(2, 2)
	p28.Visible = false
	p28.AnchorPoint = Vector2.new(0.5, 0.5)
	audioServicePlaySound("Angelic Humming")
	audioServicePlaySound("heaven release")

	for i = 1, 10 do
		local color32 = Color3.fromRGB(29, 255, 44)
		local v107 = UDim2.fromOffset(virtualField.AbsoluteSize.X / (i * 2 / 2), virtualField.AbsoluteSize.X / (i * 2 / 2))
		local v108 = uDim2New(0.5, 0, 0.5, 0)
		local randomNumber = math.random(0, 180)
		local v110 = effectsServiceNewerCircle(p27, {
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			Image = "rbxassetid://12602224662",
			ImageColor3 = color32,
			Size = v107,
			Position = v108,
			Rotation = randomNumber,
			ZIndex = p28.ZIndex - 1
		})

		animation.AnimateAsync(v110, { ImageTransparency = 0 }, 0.4, "Out", "Quad")
		task.spawn(function()
			effectsServiceSpritesheet(v110, Vector2.new(128, 128), { 8, 8 }, 1, 64, 64)
			animation.Animate(v110, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
			v110:Destroy()
		end)
		task.wait(0.1)
	end

	p28.Visible = true
	p28.Position = uDim2New(0.5, 0, 0.5, 0)
	audioServicePlaySound("Korblox")
	task.delay(0.8, function()
		module.PurpleSparks(p27, p28, p28, p30)
	end)

	local animationAnimate = animation.Animate
	local v112 = UDim2.fromOffset(absoluteSize.X * 1.5, absoluteSize.Y * 1.5)

	animationAnimate(p28, { Rotation = 10, Size = v112 }, 1, "Out", "Quart")
	task.wait(0.2)
	animation.AnimateAsync(v101, { BackgroundTransparency = 1 }, 0.4, "Out", "Quad")

	local animationAnimateAsync = animation.AnimateAsync

	v112 = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
	animationAnimateAsync(p28, { Size = v112 }, 0.7, "In", "Quint")
	animation.AnimateAsync(p28, { AnchorPoint = Vector2.new(0, 0) }, 0.7, "In", "Quint")
	animation.AnimateAsync(p28, { Rotation = 0 }, 0.7, "In", "Quint")
	animation.Animate(p28, { Position = v103 }, 0.7, "In", "Quint")
	audioServicePlaySound("HammerImpact")
	effectsService.ShakeBattle(p27, 0.3, 0.025)
	effectsServiceSetCardZIndex(p28, p28.ZIndex - 99999)
	v101:Destroy()
end
function module.NyarlNextPhase(p31, p32, _, _)
	local t3: {[any]: any} = {
		"rbxassetid://14471362207",
		"rbxassetid://15011464541",
		"rbxassetid://13803462600"
	}

	audioServicePlaySound("NyarlAppear")
	audioServicePlaySound("NyarlCharge")
	task.spawn(function()
		for i = 1, 6 do
			local color3 = Color3.fromRGB(38, 38, 38)
			local v354 = t3[i % 3 + 1]
			local uDim2 = UDim2.new(0, p32.AbsoluteSize.X * 1.7, 0, p32.AbsoluteSize.X * 1.7)
			local t14: {[any]: any} = {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				ZIndex = 1000001,
				ImageColor3 = color3,
				Image = v354,
				Size = uDim2,
				Position = p32 and UDim2.new(0, p32.AbsolutePosition.X, 0, p32.AbsolutePosition.Y) + UDim2.new(0, p32.AbsoluteSize.X * 0.5, 0, p32.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
				Rotation = math.random(0, 180)
			}
			local v357 = effectsServiceNewerCircle(p31, t14)

			task.spawn(function()
				effectsServiceSpritesheet(v357, Vector2.new(128, 128), { 8, 8 }, 1, 64, 64)
				v357:Destroy()
			end)
			task.wait(0.1)
		end
	end)
	effectsService.ShakeInOut(p32, p32.Position, 0.8, 0.005)
end
function module.DespairNextPhase(p35, p36, _, _)
	local t4: {[any]: any} = {
		"rbxassetid://14471362207",
		"rbxassetid://15011464541",
		"rbxassetid://13803462600"
	}

	audioServicePlaySound("NyarlAppear")
	audioServicePlaySound("NyarlCharge")
	task.spawn(function()
		for i = 1, 6 do
			local color3 = Color3.fromRGB(30, 10, 254)
			local v360 = t4[i % 3 + 1]
			local uDim2 = UDim2.new(0, p36.AbsoluteSize.X * 1.7, 0, p36.AbsoluteSize.X * 1.7)
			local t15: {[any]: any} = {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				ZIndex = 1000001,
				ImageColor3 = color3,
				Image = v360,
				Size = uDim2,
				Position = p36 and UDim2.new(0, p36.AbsolutePosition.X, 0, p36.AbsolutePosition.Y) + UDim2.new(0, p36.AbsoluteSize.X * 0.5, 0, p36.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
				Rotation = math.random(0, 180)
			}
			local v363 = effectsServiceNewerCircle(p35, t15)

			task.spawn(function()
				effectsServiceSpritesheet(v363, Vector2.new(128, 128), { 8, 8 }, 1, 64, 64)
				v363:Destroy()
			end)
			task.wait(0.1)
		end
	end)
	effectsService.ShakeInOut(p36, p36.Position, 0.8, 0.005)
end
function module.PtendaSet(p39, p40, _, _)
	local t5: {[any]: any} = { "ApocSummon", "ApocDeath", "Ascend", "Ascend2" }
	local randomNumber = math.random(1, #t5)

	audioServicePlaySound(t5[randomNumber])
	effectsService.ShakeSync(p40, p40.Position, 1, 0.05)

	for i = 1, 2 do
		task.spawn(function()
			local n1 = p40.ZIndex + 100001
			local v365 = UDim2.fromOffset(p40.AbsoluteSize.X, p40.AbsoluteSize.X)
			local v366 = p40
			local uDim2 = UDim2.new(0, v366.AbsolutePosition.X, 0, v366.AbsolutePosition.Y)
			local uDim23 = UDim2.new(0, v366.AbsoluteSize.X * 0.5, 0, v366.AbsoluteSize.Y * 0.5)
			local randomNumber2 = math.random(0, 360)
			local color3 = Color3.fromRGB(3, 48, 0)
			local v371 = effectsServiceNewerCircle(p39, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://3916186365",
				ZIndex = n1,
				Size = v365,
				Position = uDim2 + uDim23,
				Rotation = randomNumber2,
				ImageColor3 = color3
			})

			v366 = p40.ZIndex + 100001

			local v372 = UDim2.fromOffset(p40.AbsoluteSize.X, p40.AbsoluteSize.X)
			local v373 = p40
			local uDim24 = UDim2.new(0, v373.AbsolutePosition.X, 0, v373.AbsolutePosition.Y)
			local uDim25 = UDim2.new(0, v373.AbsoluteSize.X * 0.5, 0, v373.AbsoluteSize.Y * 0.5)
			local color33 = Color3.fromRGB(13, 255, 0)
			local v377 = effectsServiceNewerCircle(p39, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://8849187709",
				ZIndex = v366,
				Size = v372,
				Position = uDim24 + uDim25,
				Rotation = i * 90 + 180,
				ImageColor3 = color33
			})

			v373 = p40.ZIndex + 100001

			local v378 = UDim2.fromOffset(p40.AbsoluteSize.X, p40.AbsoluteSize.X)
			local v379 = p40
			local uDim26 = UDim2.new(0, v379.AbsolutePosition.X, 0, v379.AbsolutePosition.Y)
			local uDim27 = UDim2.new(0, v379.AbsoluteSize.X * 0.5, 0, v379.AbsoluteSize.Y * 0.5)
			local color34 = Color3.fromRGB(120, 255, 105)
			local v383 = effectsServiceNewerCircle(p39, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.2,
				Image = "rbxassetid://8849187709",
				ZIndex = v373,
				Size = v378,
				Position = uDim26 + uDim27,
				ImageColor3 = color34,
				Rotation = i * 90 + 360
			})
			local animationAnimateAsync = animation.AnimateAsync

			v379 = UDim2.fromOffset(p40.AbsoluteSize.Y * 1.2, p40.AbsoluteSize.Y * 1.2)
			animationAnimateAsync(v371, { Size = v379, Rotation = v371.Rotation + 360 }, 0.6, "Out", "Quint")

			local animateAsync = animation.AnimateAsync

			v379 = UDim2.fromOffset(p40.AbsoluteSize.Y * 1.1, p40.AbsoluteSize.Y * 1.1)
			animateAsync(v377, { Size = v379, Rotation = v377.Rotation + 760 }, 1.1, "Out", "Quint")

			local v386 = animation.AnimateAsync

			v379 = UDim2.fromOffset(p40.AbsoluteSize.Y * 1.5, p40.AbsoluteSize.Y * 1.5)
			v386(v383, { Size = v379, Rotation = v383.Rotation + 760 }, 1.1, "Out", "Quint")
			task.wait(0.3)
			animation.AnimateAsync(v371, { ImageTransparency = 1 }, 0.6, "Out", "Quint")
			animation.AnimateAsync(v377, { ImageTransparency = 1 }, 1.1, "Out", "Quint")
			animation.AnimateAsync(v383, { ImageTransparency = 1 }, 1.1, "Out", "Quint")
			task.spawn(function()
				task.wait(1.1)
				v371:Destroy()
				v377:Destroy()
				v383:Destroy()
			end)
		end)
		task.wait(0.2)
	end
end
function module.DenialCastMeeloEffect(p43, p44, _, p46)
	local s1
	local s2

	if p46 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p46 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local virtualEnemyField = p43.Parent.BattleNew.VirtualEnemyField

	audioService.DimSongs()
	audioServicePlaySound("DeniedSound")

	if math.random(1, 5) == 1 then
		audioServicePlaySound("Church Bell")
	end

	task.spawn(function()
		task.wait(0.1)
		audioServicePlaySound("Thunder2")

		local color3 = Color3.fromRGB(255, 255, 255)

		effectsServiceVortex(p43, p44, p44, p46, "rbxassetid://13550517740", 0.9, color3, 0, 0.75)
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p44.Parent.Parent[s1 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.5, 0.007)
			end)
		end
	end)
	task.spawn(function()
		for _, v in pairs(_G.__NoFaces(p44.Parent.Parent[s2 .. "Field"])) do
			task.spawn(function()
				effectsService.ShakeInOut(v, v.Position, 0.5, 0.007)
			end)
		end
	end)
	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(255, 130, 47)

		animationAnimateAsync(virtualEnemyField, { BackgroundTransparency = 0.2, BackgroundColor3 = color3 }, 1, "In", "Quint")
	end)
	audioService.UndimSongs()
end
function module.MidAlphaBlast(parent, p48, p49, _)
	audioServicePlaySound("small laser attack")
	effectsService.ShakeSync(p48, p48.Position, 0.2, 0.05)
	effectsService.ShakeSync(p49, p49.Position, 0.5, 0.1)

	for _ = 1, 15 do
		local vector3 = Vector3.new(p48.AbsolutePosition.X + p48.AbsoluteSize.X / 1.2, p48.AbsolutePosition.Y + p48.AbsoluteSize.Y / 2, 0)
		local n1 = p49.AbsolutePosition.X + p49.AbsoluteSize.X / 1.1
		local randomNumber = math.random(-p49.AbsoluteSize.X / 8, p49.AbsoluteSize.X / 8)
		local n2 = p49.AbsolutePosition.Y + p49.AbsoluteSize.Y / 2
		local randomNumber3 = math.random(-p49.AbsoluteSize.Y / 8, p49.AbsoluteSize.Y / 8)
		local vector32 = Vector3.new(n1 + randomNumber, n2 + randomNumber3, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v150 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://196969716",
			ZIndex = 1000000,
			ImageColor3 = color3
		})
		local t6 = {
			BackgroundTransparency = 1,
			ImageTransparency = 0.1,
			Image = "rbxassetid://7948615545",
			ZIndex = 1000001,
			ImageColor3 = math.random(1, 2) == 1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 0),
			Size = UDim2.fromOffset(p49.AbsoluteSize.Y, p49.AbsoluteSize.Y)
		}
		local uDim2 = UDim2.new(0, p48.AbsolutePosition.X, 0, p48.AbsolutePosition.Y)
		local uDim28 = UDim2.new(0, p48.AbsoluteSize.X * 0.5, 0, p48.AbsoluteSize.Y * 0.5)
		local v154 = UDim2.fromOffset(p48.AbsoluteSize.X / 2.2)

		t6.Position = uDim2 + uDim28 + v154
		t6.Rotation = math.random(0, 360)

		local v155 = effectsServiceNewerCircle(parent, t6)
		local animationAnimateAsync = animation.AnimateAsync
		local v157 = UDim2.fromOffset(0, 0)
		local color35 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v155, { ImageTransparency = 1, Size = v157, ImageColor3 = color35 }, 1, "Out", "Quart")

		local magnitude = (vector32 - vector3).Magnitude

		t6 = math.atan2(vector3.Y - vector32.Y, vector3.X - vector32.X)
		v150.Size = UDim2.new(0, magnitude, 0, p49.AbsoluteSize.X / 2)
		v157 = CFrame.new(vector3, vector32).Position

		local cFrame = CFrame.new(vector3, vector32)
		local n3 = v157 + cFrame.lookVector * magnitude / 2

		v150.Position = UDim2.new(0, n3.X, 0, n3.Y)
		v150.Rotation = math.deg(t6)

		local clone = v150:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p49.AbsoluteSize.X / 1.5)
		clone.Parent = parent
		clone.ImageColor3 = Color3.fromRGB(13, 255, 0)
		clone.ZIndex = v150.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v164 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v164 }, 1, "Out", "Quart")

		local v165 = animation.AnimateAsync

		v164 = UDim2.fromOffset(magnitude, 0)
		v165(v150, { Size = v164 }, 1, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.9)
			v155:Destroy()
			v150:Destroy()
			clone:Destroy()
		end)
	end
end

module.SmallAlphaBlast = module.MidAlphaBlast

function module.LargeAlphaBlast(parent, p52, p53, _)
	audioServicePlaySound("small laser attack")
	effectsService.ShakeSync(p52, p52.Position, 0.2, 0.1)
	effectsService.ShakeSync(p53, p53.Position, 0.5, 0.2)

	for _ = 1, 30 do
		local vector3 = Vector3.new(p52.AbsolutePosition.X + p52.AbsoluteSize.X / 1.2, p52.AbsolutePosition.Y + p52.AbsoluteSize.Y / 2, 0)
		local n1 = p53.AbsolutePosition.X + p53.AbsoluteSize.X / 1.1
		local randomNumber = math.random(-p53.AbsoluteSize.X / 8, p53.AbsoluteSize.X / 8)
		local n2 = p53.AbsolutePosition.Y + p53.AbsoluteSize.Y / 2
		local randomNumber4 = math.random(-p53.AbsoluteSize.Y / 8, p53.AbsoluteSize.Y / 8)
		local vector33 = Vector3.new(n1 + randomNumber, n2 + randomNumber4, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v178 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://196969716",
			ZIndex = 1000000,
			ImageColor3 = color3
		})
		local t7 = {
			BackgroundTransparency = 1,
			ImageTransparency = 0.1,
			Image = "rbxassetid://7948615545",
			ZIndex = 1000001,
			ImageColor3 = math.random(1, 2) == 1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 0),
			Size = UDim2.fromOffset(p53.AbsoluteSize.Y, p53.AbsoluteSize.Y)
		}
		local uDim2 = UDim2.new(0, p52.AbsolutePosition.X, 0, p52.AbsolutePosition.Y)
		local uDim29 = UDim2.new(0, p52.AbsoluteSize.X * 0.5, 0, p52.AbsoluteSize.Y * 0.5)
		local v182 = UDim2.fromOffset(p52.AbsoluteSize.X / 2.2)

		t7.Position = uDim2 + uDim29 + v182
		t7.Rotation = math.random(0, 360)

		local v183 = effectsServiceNewerCircle(parent, t7)
		local animationAnimateAsync = animation.AnimateAsync
		local v185 = UDim2.fromOffset(0, 0)
		local color36 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v183, { ImageTransparency = 1, Size = v185, ImageColor3 = color36 }, 1, "Out", "Quart")

		local magnitude = (vector33 - vector3).Magnitude

		t7 = math.atan2(vector3.Y - vector33.Y, vector3.X - vector33.X)
		v178.Size = UDim2.new(0, magnitude, 0, p53.AbsoluteSize.X)
		v185 = CFrame.new(vector3, vector33).Position

		local cFrame = CFrame.new(vector3, vector33)
		local n3 = v185 + cFrame.lookVector * magnitude / 2

		v178.Position = UDim2.new(0, n3.X, 0, n3.Y)
		v178.Rotation = math.deg(t7)

		local clone = v178:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p53.AbsoluteSize.X * 1.5)
		clone.Parent = parent
		clone.ImageColor3 = Color3.fromRGB(13, 255, 0)
		clone.ZIndex = v178.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v192 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v192 }, 1, "Out", "Quart")

		local v193 = animation.AnimateAsync

		v192 = UDim2.fromOffset(magnitude, 0)
		v193(v178, { Size = v192 }, 1, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.9)
			v183:Destroy()
			v178:Destroy()
			clone:Destroy()
		end)
	end
end
local function AlphaBlastOmega(parent, p56, p57, _)
	audioServicePlaySound("laser attack")
	effectsService.ShakeBattleSync(parent, 0.5, 0.1)
	effectsService.ShakeSync(p56, p56.Position, 0.3, 0.3)
	effectsService.ShakeSync(p57, p57.Position, 0.7, 0.6)

	for _ = 1, 50 do
		local vector3 = Vector3.new(p56.AbsolutePosition.X + p56.AbsoluteSize.X / 1.2, p56.AbsolutePosition.Y + p56.AbsoluteSize.Y / 2, 0)
		local n1 = p57.AbsolutePosition.X + p57.AbsoluteSize.X * 8
		local randomNumber = math.random(-p57.AbsoluteSize.X / 8, p57.AbsoluteSize.X / 8)
		local n2 = p57.AbsolutePosition.Y + p57.AbsoluteSize.Y / 2
		local randomNumber5 = math.random(-p57.AbsoluteSize.Y / 8, p57.AbsoluteSize.Y / 8)
		local vector34 = Vector3.new(n1 + randomNumber, n2 + randomNumber5, 0)
		local color3 = Color3.fromRGB(255, 255, 255)
		local v206 = effectsServiceNewerCircle(parent, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Image = "rbxassetid://196969716",
			ZIndex = 1000000,
			ImageColor3 = color3
		})
		local t8 = {
			BackgroundTransparency = 1,
			ImageTransparency = 0.1,
			Image = "rbxassetid://7948615545",
			ZIndex = 1000001,
			ImageColor3 = math.random(1, 2) == 1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 0),
			Size = UDim2.fromOffset(p57.AbsoluteSize.Y * 1.5, p57.AbsoluteSize.Y * 1.5)
		}
		local uDim2 = UDim2.new(0, p56.AbsolutePosition.X, 0, p56.AbsolutePosition.Y)
		local uDim210 = UDim2.new(0, p56.AbsoluteSize.X * 0.5, 0, p56.AbsoluteSize.Y * 0.5)
		local v210 = UDim2.fromOffset(p56.AbsoluteSize.X / 2.2)

		t8.Position = uDim2 + uDim210 + v210
		t8.Rotation = math.random(0, 360)

		local v211 = effectsServiceNewerCircle(parent, t8)
		local animationAnimateAsync = animation.AnimateAsync
		local v213 = UDim2.fromOffset(0, 0)
		local color37 = Color3.fromRGB(255, 255, 255)

		animationAnimateAsync(v211, { ImageTransparency = 1, Size = v213, ImageColor3 = color37 }, 1, "Out", "Quart")

		local magnitude = (vector34 - vector3).Magnitude

		t8 = math.atan2(vector3.Y - vector34.Y, vector3.X - vector34.X)
		v206.Size = UDim2.new(0, magnitude, 0, p57.AbsoluteSize.X * 2)
		v213 = CFrame.new(vector3, vector34).Position

		local cFrame = CFrame.new(vector3, vector34)
		local n3 = v213 + cFrame.lookVector * magnitude / 2

		v206.Position = UDim2.new(0, n3.X, 0, n3.Y)
		v206.Rotation = math.deg(t8)

		local clone = v206:Clone()

		clone.Size = UDim2.fromOffset(magnitude, p57.AbsoluteSize.X * 2.5)
		clone.Parent = parent
		clone.ImageColor3 = Color3.fromRGB(13, 255, 0)
		clone.ZIndex = v206.ZIndex - 1

		local animateAsync = animation.AnimateAsync
		local v220 = UDim2.fromOffset(magnitude, 0)

		animateAsync(clone, { Size = v220 }, 1, "Out", "Quart")

		local v221 = animation.AnimateAsync

		v220 = UDim2.fromOffset(magnitude, 0)
		v221(v206, { Size = v220 }, 1, "Out", "Quart")
		task.wait(0.01)
		task.spawn(function()
			task.wait(0.9)
			v211:Destroy()
			v206:Destroy()
			clone:Destroy()
		end)
	end
end

module.AlphaBlastOmega = AlphaBlastOmega
module.LargeABO = AlphaBlastOmega
module.MidABO = AlphaBlastOmega
module.SmallABO = AlphaBlastOmega

function module.InstantTransmission(p59, p60, _, _)
	p60.Visible = false

	local v226 = p60.Position
	local v227 = p60.Position
	local v228 = UDim2.fromOffset(p60.AbsoluteSize.X / 8)

	p60.Position = v227 + v228
	task.wait(0.3)

	local color3 = Color3.fromRGB(255, 255, 255)
	local v230 = UDim2.fromOffset(p60.AbsoluteSize.X * 2, p60.AbsoluteSize.X * 1.5)
	local uDim2 = UDim2.new(0, p60.AbsolutePosition.X, 0, p60.AbsolutePosition.Y)
	local uDim211 = UDim2.new(0, p60.AbsoluteSize.X * 0.5, 0, p60.AbsoluteSize.Y * 0.5)
	local randomNumber = math.random(0, 180)
	local v234 = effectsServiceNewerCircle(p59, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		Image = "rbxassetid://16786028500",
		ImageColor3 = color3,
		Size = v230,
		Position = uDim2 + uDim211,
		Rotation = randomNumber,
		ZIndex = p60.ZIndex + 1
	})

	task.spawn(function()
		effectsServiceSpritesheet(v234, Vector2.new(128, 128), { 8, 8 }, 1, 9, 48)
		v234:Destroy()
	end)
	p60.Visible = true
	audioServicePlaySound("instant transmission")
	animation.Animate(p60, { Position = v226 }, 0.1, "In", "Quad")
end
function module.StaticBurn(p63, _, p65, _)
	audioServicePlaySound("immolate")
	task.spawn(function()
		for _ = 1, 3 do
			local color3FromRGB = Color3.fromRGB
			local randomNumber = math.random(100, 150)
			local color3 = color3FromRGB(255, randomNumber, 53)
			local uDim2 = UDim2.new(0, p65.AbsoluteSize.X * 1.7, 0, p65.AbsoluteSize.X * 1.7)
			local t16: {[any]: any} = {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = "rbxassetid://11517935503",
				ZIndex = 1000001,
				ImageColor3 = color3,
				Size = uDim2,
				Position = p65 and UDim2.new(0, p65.AbsolutePosition.X, 0, p65.AbsolutePosition.Y) + UDim2.new(0, p65.AbsoluteSize.X * 0.5, 0, p65.AbsoluteSize.Y * 0.5) or uDim2New(0.5, 0, 0.5, 0),
				Rotation = math.random(0, 180)
			}
			local v400 = effectsServiceNewerCircle(p63, t16)

			task.spawn(function()
				effectsServiceSpritesheet(v400, Vector2.new(256, 256), { 4, 4 }, 1, 16, 24)
				v400:Destroy()
			end)
			task.wait(0.04)
		end
	end)
end
function module.TranscendentIdle(_, parent, _, _)
	if not parent:FindFirstChild("PauseIdle") then
		local pauseIdle: BoolValue = Instance.new("BoolValue")

		pauseIdle.Value = false
		pauseIdle.Name = "PauseIdle"
		pauseIdle.Parent = parent
	end

	local absolutePosition = parent.AbsolutePosition

	task.spawn(function()
		while true do
			if parent:FindFirstChild("PauseIdle") and parent:FindFirstChild("PauseIdle").Value == false then
				local animationAnimateAsync = animation.AnimateAsync
				local uDim2 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + 30)

				animationAnimateAsync(parent, { Position = uDim2 }, 0.8, "Out", "Linear")
				task.wait(0.8)

				if parent:FindFirstChild("PauseIdle") and parent:FindFirstChild("PauseIdle").Value == false then
					local animateAsync = animation.AnimateAsync
					local uDim212 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y)

					animateAsync(parent, { Position = uDim212 }, 0.8, "Out", "Linear")
				end

				task.wait(0.8)
			else
				task.wait(0.1)
			end

			if not parent then
				break
			end
		end
	end)
end
function module.TranscendentFollow(_, parent, _, _)
	if not parent:FindFirstChild("FollowPlayer") then
		local followPlayer: BoolValue = Instance.new("BoolValue")

		followPlayer.Value = true
		followPlayer.Name = "FollowPlayer"
		followPlayer.Parent = parent
	else
		parent:FindFirstChild("FollowPlayer").Value = true
	end

	local pauseIdle = parent:FindFirstChild("PauseIdle")
	local move = game.Players.LocalPlayer.PlayerGui:FindFirstChild("DodgeModeUI"):FindFirstChild("Move")

	if pauseIdle then
		pauseIdle.Value = true
	end

	local absolutePosition = parent.AbsolutePosition
	local absoluteSize = parent.AbsoluteSize

	task.spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local uDim2New = UDim2.new
		local n1 = move.AbsolutePosition.X + parent.AbsoluteSize.X / 2
		local y = move.AbsolutePosition.Y
		local randomNumber = math.random(3, 4)
		local v410 = uDim2New(0, n1, 0, y - (200 + randomNumber * 10))
		local uDim2 = UDim2.new(0, absoluteSize.X / 2.5, 0, absoluteSize.Y / 2.5)

		animationAnimateAsync(parent, { Position = v410, Size = uDim2 }, 0.4, "In", "Quart")
		task.wait(0.4)

		repeat
			local animateAsync = animation.AnimateAsync
			local uDim213 = UDim2.new(0, move.AbsolutePosition.X + parent.AbsoluteSize.X / 2, 0, move.AbsolutePosition.Y - 200)

			animateAsync(parent, { Position = uDim213 }, 0.05, "InOut", "Elastic")
			task.wait(0.05)

			local followPlayer = parent:FindFirstChild("FollowPlayer")
		until followPlayer.Value == false

		local v415 = animation.AnimateAsync
		local uDim214 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y)
		local uDim215 = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)

		v415(parent, { Rotation = 0, Position = uDim214, Size = uDim215 }, 0.4, "Out", "Quart")
		task.wait(0.4)

		if pauseIdle then
			pauseIdle.Value = false
		end
	end)
end
function module.TranscendentStopFollow(_, p76, _, _)
	if not p76:FindFirstChild("FollowPlayer") then
		warn("No FollowPlayer found!")
	end

	local followPlayer = p76:FindFirstChild("FollowPlayer")

	if followPlayer then
		followPlayer.Value = false
	end
end
function module.LeafTransform(parent, parent2, p81, _)
	local t9: {[any]: any} = {
		"rbxassetid://115639384952596",
		"rbxassetid://129549657098348",
		"rbxassetid://112620562509055"
	}
	local random = Random.new()

	local function jitter(p83)
		return (random:NextNumber() - 0.5) * p83 + 1
	end

	uDim2New(0, p81.AbsoluteSize.X, 0, p81.AbsoluteSize.Y)
	p81.ImageTransparency = 1
	parent2.ImageTransparency = 1
	p81.Size = uDim2New(0, p81.AbsoluteSize.X * 1.2, 0, p81.AbsoluteSize.Y * 1.2)

	local tweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 1.08)
	local v267: Tween = tweenService:Create(p81, tweenInfo, { ImageTransparency = 0 })
	local color3 = Color3.fromRGB(140, 152, 139)
	local image = parent2.Image
	local v270 = uDim2New(0, parent2.AbsoluteSize.X, 0, parent2.AbsoluteSize.Y)
	local v271 = UDim2.fromOffset(parent2.AbsoluteSize.X / 2, parent2.AbsoluteSize.Y / 2)
	local v272 = effectsServiceNewerCircle(parent, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
		ZIndex = 10001,
		ImageColor3 = color3,
		Image = image,
		Size = v270,
		Position = v271,
		Parent = parent2
	})

	effectsService.Shake(v272, v272.Position, 0.24, 0.05)

	local tweenInfo2 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v274 = uDim2New()
	local v275: Tween = tweenService:Create(v272, tweenInfo2, { Rotation = 90, ImageTransparency = 1, Size = v274 })

	v272 = effectsServiceFadeChildren(parent2, tweenInfo2)
	v272.Add(v275)

	local frame: Frame = Instance.new("Frame")

	frame.BackgroundTransparency = 1
	frame.Size = uDim2New()

	local uDim2 = UDim2.new(0, parent2.AbsolutePosition.X, 0, parent2.AbsolutePosition.Y)
	local uDim216 = UDim2.new(0, parent2.AbsoluteSize.X * 0.5, 0, parent2.AbsoluteSize.Y * 0.5)

	frame.Position = uDim2 + uDim216
	frame.Rotation = random:NextInteger(0, 360)
	frame.Parent = parent

	local tweenInfo3 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)

	tweenInfo3 = tweenService:Create(frame, tweenInfo3, { Rotation = frame.Rotation + 1440 })

	local tweenInfo4 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.In, 0, false, 0)
	local n1: number = frame.Rotation + 3600
	local uDim217 = UDim2.new(0, p81.AbsolutePosition.X, 0, p81.AbsolutePosition.Y)
	local uDim218 = UDim2.new(0, p81.AbsoluteSize.X * 0.5, 0, p81.AbsoluteSize.Y * 0.5)
	local v284: Tween = tweenService:Create(frame, tweenInfo4, { Rotation = n1, Position = uDim217 + uDim218 })

	tweenInfo3.Completed:Once(function()
		v284:Play()
		audioServicePlaySound("LeafRustle2", { PlaybackSpeed = 2.5 })
	end)
	v284.Completed:Once(function()
		frame:Destroy()
	end)
	tweenInfo3:Play()
	v272:Play()
	v267:Play()
	v267.Changed:Connect(function(p84: string)
		if p84 == "PlaybackState" then
			if v267.PlaybackState == Enum.PlaybackState.Playing then
				audioServicePlaySound("PoofAppear2")
			end

			return
		end
	end)
	audioServicePlaySound("PoofAppear")
	audioServicePlaySound("LeafRustle")
	task.spawn(function()
		for i = 1, 20 do
			local n1 = random:NextNumber() * 0.1 + 0.2
			local colorSequence = ColorSequence.new(Color3.new(0.6, 0.6, 0.6), Color3.fromHSV(0.696778, 0.597116, 0.545098))
			local v423 = random:NextNumber()
			local v424 = evalColorSequence(colorSequence, v423 * 0.3 + 0.1)
			local v425 = random:NextInteger(1, #t9)
			local v426 = t9[v425]
			local uDim219 = UDim2.new(0, parent2.AbsoluteSize.X * n1, 0, parent2.AbsoluteSize.X * n1)
			local v428 = uDim2New()
			local v429 = random:NextInteger(0, 360)
			local v430 = effectsServiceNewerCircle(frame, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.05,
				ZIndex = 1000001,
				ImageColor3 = v424,
				Image = v426,
				Size = uDim219,
				Position = v428,
				Rotation = v429
			})

			local v431 = task.spawn(function()
				effectsServiceSpritesheet(v430, nil, { 5, 6 }, 1, 29, 24)
			end)

			n1 = math.rad(i * 18)

			local n2 = parent2.AbsoluteSize.X * 0.6
			local v433 = random:NextNumber()
			local n3 = n2 * ((v433 - 0.5) * 0.2 + 1)
			local uDim2FromOffset = UDim2.fromOffset
			local offset = v430.Position.X.Offset
			local cosine = math.cos(n1)
			local v438 = v430.Position.Y.Offset
			local sine = math.sin(n1)

			n2 = uDim2FromOffset(offset + cosine * n3, v438 + sine * n3)

			local tweenInfo5 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, true, 0)
			local tweenInfo6 = TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 1.14)

			v429 = tweenService:Create(v430, tweenInfo5, { Position = n2 })
			n2 = tweenService:Create(v430, tweenInfo6, { ImageTransparency = 1 })
			n2.Completed:Once(function()
				task.cancel(v431)
				v430:Destroy()
			end)
			v429:Play()
			n2:Play()
		end

		task.wait(1.14)
		effectsService.Shake(p81, p81.Position, 0.12, 0.05)
	end)
	task.wait(1.2)
end

AlphaBlastOmega = function(p85)
	return (math.pow(1.618034, 0.6366197723675814 * p85))
end

local function spiralXY(p86, p87, p88)
	local n1 = math.pow(1.618034, 0.6366197723675814 * p86) * (p87 or 1)
	local n2 = p86 + (p88 or 0)
	local cosine = math.cos(n2)
	local sine = math.sin(n2)

	return n1 * cosine, n1 * sine
end
function module.GoldenSpiral(p89, p90, _, _)
	local uDim2 = UDim2.new(0, p90.AbsolutePosition.X, 0, p90.AbsolutePosition.Y)
	local uDim220 = UDim2.new(0, p90.AbsoluteSize.X * 0.5, 0, p90.AbsoluteSize.Y * 0.5)
	local n1 = uDim2 + uDim220
	local v300 = p90.ImageTransparency or 0
	local absoluteSize = p90.AbsoluteSize
	local rotation = p90.Rotation
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)

	audioServicePlaySound("PreMagic")
	task.spawn(function()
		for i = 1, 8 do
			local v443 = math.rad(i * 45)
			local n3: number = 17.944272658592638 * 10
			local n2 = 9.42477796076938 + (v443 or 0)
			local cosine = math.cos(n2)
			local sine = math.sin(n2)
			local uDim221 = UDim2.new(0, absoluteSize.X * 0.2, 0, absoluteSize.X * 0.2)
			local v449 = UDim2.fromOffset(n1.X.Offset + n3 * cosine, n1.Y.Offset + n3 * sine)
			local randomNumber = math.random()
			local v451 = effectsServiceNewerCircle(p89, {
				Image = "rbxassetid://10658626571",
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ZIndex = 1000001,
				Size = uDim221,
				Position = v449,
				Rotation = randomNumber * 360
			})
			local randomNumber6 = math.random()

			tweenService:Create(v451, tweenInfo, { ImageTransparency = 0, Rotation = randomNumber6 * 10 * 1 }):Play()
			task.spawn(function()
				local n5 = 0

				while n5 <= 1 do
					local n2 = math.min(1, n5) / 1
					local n3 = 9.42477796076938 * (1 - n2) + 0 * n2

					n2 = math.pow(1.618034, 0.6366197723675814 * n3) * 10

					local n4 = n3 + (v443 or 0)
					local cosine2 = math.cos(n4)
					local sine2 = math.sin(n4)

					v451.Position = UDim2.fromOffset(n2 * cosine2 + n1.X.Offset, n2 * sine2 + n1.Y.Offset)

					local v462 = task.wait()

					n5 += v462
				end

				v451:Destroy()
			end)

			local taskWait = task.wait
			local randomNumber7 = math.random()

			taskWait(randomNumber7 * 0.1)
		end
	end)
	task.wait(0.9)
	audioServicePlaySound("Summon", { PlaybackSpeed = 2 })

	local v304 = UDim2.fromOffset(absoluteSize.Y * 1.2, absoluteSize.Y * 1.2)
	local v305 = effectsServiceNewerCircle(p89, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = v304,
		Position = n1
	})
	local t10: {[any]: any} = {
		Projectile = "rbxassetid://10658626571",
		Strength = 100,
		Time = 0.25,
		Size = UDim2.fromOffset(absoluteSize.X / 3, absoluteSize.X / 3),
		ZIndex = p90.ZIndex - 10003
	}

	task.spawn(function()
		effectsServiceBreath(p89, p90, v305, t10)
	end)
end
local function WeaponStrike(p93, p94, p95)
	local t11 = p95 or {}
	local v311 = p93.Parent.BattleNew["Virtual" .. (if p94 == "" then "Enemy" else if p94 == "Enemy" then "" else nil) .. "Field"]
	local v312 = t11.WeaponImage or "rbxassetid://12192587180"
	local v313 = t11.SlashImage or "rbxassetid://6662213548"
	local v314 = t11.SlashColor or Color3.fromRGB(255, 104, 29)
	local v315 = t11.TravelTime or 1
	local v316 = t11.ImpactDelay or 0.7
	local v317 = t11.FadeTime or 0.25
	local v318 = t11.SlashFadeTime or 0.4
	local v319 = t11.StartRotation or 15
	local v320 = t11.EndRotation or 345

	effectsServicePreloadTech(p93, { v312 })
	effectsServicePreloadTech(p93, { v313 })

	local v321 = uDim2New(0, v311.AbsoluteSize.Y * 1.75, 0, v311.AbsoluteSize.Y * 1.75)
	local v322 = uDim2New(0, v311.AbsolutePosition.X, 0, v311.AbsolutePosition.Y + v311.AbsoluteSize.Y / 2)
	local v323 = effectsServiceNewerCircle(p93, {
		ZIndex = 10000,
		BackgroundTransparency = 1,
		Visible = true,
		Size = v321,
		Position = v322,
		Image = v312,
		Rotation = v319
	})
	local v324 = uDim2New(0, v311.AbsoluteSize.X, 0, v311.AbsoluteSize.Y / 2)
	local uDim2 = UDim2.new(0, v311.AbsolutePosition.X, 0, v311.AbsolutePosition.Y)
	local uDim222 = UDim2.new(0, v311.AbsoluteSize.X * 0.5, 0, v311.AbsoluteSize.Y * 0.5)
	local v327 = effectsServiceNewerCircle(p93, {
		ZIndex = 10000,
		BackgroundTransparency = 1,
		Visible = false,
		Size = v324,
		Position = uDim2 + uDim222,
		Image = v313,
		ImageColor3 = v314
	})

	if t11.StartSound then
		audioService.PlaySound(t11.StartSound)
	end

	task.spawn(function()
		effectsServiceNewTweenProperty(v323, "Rotation", v319, v320, v315, "Quint")
	end)
	task.spawn(function()
		local v455 = uDim2New(0, v311.AbsolutePosition.X + v311.AbsoluteSize.X, 0, v311.AbsolutePosition.Y + v311.AbsoluteSize.Y / 2)

		v323:TweenPosition(v455, "Out", "Quint", v315, true)
	end)

	if t11.SwingSound then
		audioService.PlaySound(t11.SwingSound)
	end

	effectsServiceWaitX(v316)
	task.spawn(function()
		effectsServiceNewTweenProperty(v323, "ImageTransparency", 0, 1, v317, "Quad")
		effectsServiceWaitX(0.9)
		v323:Destroy()
	end)

	if t11.HitSound then
		audioService.PlaySound(t11.HitSound)
	end

	v327.Visible = true

	if t11.Shake ~= false then
		effectsService.Shake(v327, v327.Position, 0.08, 0.03)
	end

	effectsServiceWaitX(0.5)
	task.spawn(function()
		effectsServiceNewTweenProperty(v327, "ImageTransparency", 0, 1, v318, "Quad")
		effectsServiceWaitX(0.9)
		v327:Destroy()
	end)
end
function module.LinkedSwordStrike(p96, _, _, p99)
	local color3 = Color3.fromRGB(255, 104, 29)

	WeaponStrike(p96, p99, {
		WeaponImage = "rbxassetid://12192587180",
		SlashImage = "rbxassetid://6662213548",
		StartSound = "Lunge",
		SwingSound = "Woosh",
		HitSound = "LargeSlash",
		SlashColor = color3
	})
end
function module.AxeStrike(p100, _, _, p103)
	local color3 = Color3.fromRGB(255, 52, 11)

	WeaponStrike(p100, p103, {
		WeaponImage = "rbxassetid://12281806308",
		SlashImage = "rbxassetid://6662213548",
		StartSound = "Lunge",
		SwingSound = "Woosh",
		HitSound = "LargeSlash",
		SlashColor = color3
	})
end

return module
