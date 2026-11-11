



local runService: RunService = game:GetService("RunService")
local t1: {[any]: any} = {}
local u3: boolean = false

local function v4(...)
	if not runService:IsStudio() then
		return
	end

	local v28, v29 = debug.info(2, "sl")
	local v30 = v28:match("([^%.]+)$")

	v30 = string.format("%s:%d", v30 or v28, v29)

	local v31 = table.pack(...)

	table.insert(t1, { args = v31, location = v30 })

	if u3 then
		return
	end

	u3 = true
	task.spawn(function()
		while #t1 > 0 do
			local v657 = table.remove(t1, 1)

			print(v657.location, table.unpack(v657.args, 1, v657.args.n))
			task.wait(0.125)
		end

		u3 = false
	end)
end

local uDim2New = UDim2.new
local vector2New = Vector2.new
local animation = require(game.ReplicatedStorage.Animation)
local copyTable = require(game.ReplicatedStorage.CopyTable)

game:GetService("ContentProvider")

local tweenService: TweenService = game:GetService("TweenService")

game:GetService("RunService")

local stepped = game:GetService("RunService").Stepped
local mathRandom = math.random

local function GetWeightedRandom(p1)
	return (mathRandom() - 0.5) * p1
end

local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound
local t2: {[any]: any} = {}
local n1: number = 0
local t3: {[any]: any} = {
	BackgroundTransparency = 1,
	TextTransparency = 1,
	TextStrokeTransparency = 1
}
local imageLabel: {[any]: any} = { BackgroundTransparency = 1, ImageTransparency = 1 }

local function Lerp(p2, p3, p4)
	return p2 * (1 - p4) + p3 * p4
end
local function SetCommonProperties(p5, p6)
	p5.BackgroundTransparency = 1

	if p6 then
		p5.BorderSizePixel = 0
		p5.TextXAlignment = Enum.TextXAlignment.Center
		p5.TextScaled = true
	end
end
local function returnField(p7)
	if p7 == "" then
		return "", "Enemy"
	end

	if p7 == "Enemy" then
		return "Enemy", ""
	end
end
local function CenterPos(p8)
	local uDim2 = UDim2.new(0, p8.AbsolutePosition.X, 0, p8.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p8.AbsoluteSize.X * 0.5, 0, p8.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
local function AbsolutePosition(p9)
	return vector2New(p9.Position.X.Offset, p9.Position.Y.Offset)
end

AbsolutePosition = function(p10, p11)
	if p11 then
		local vector3 = Vector3.new(p10.AbsolutePosition.X + p11.X.Offset + p10.AbsoluteSize.X / 2, p10.AbsolutePosition.Y + p11.Y.Offset, 0)

		return vector3
	end

	local vector3 = Vector3.new(p10.AbsolutePosition.X + p10.AbsoluteSize.X / 2, p10.AbsolutePosition.Y, 0)

	return vector3
end

local function Angle(p12, p13)
	return (math.atan2(p13.Y - p12.Y, p13.X - p12.X))
end

local t5: {[any]: any} = {
	Frame = { BackgroundTransparency = 1 },
	TextLabel = t3,
	TextBox = t3,
	TextButton = t3,
	ImageLabel = imageLabel,
	ImageButton = imageLabel,
	UIStroke = { Transparency = 1 }
}
local object = setmetatable({}, { __mode = "k" })

local module: {[any]: any} = {
	breathimages = {
		stud = {
			"rbxassetid://12819617408",
			"rbxassetid://12819898144",
			"rbxassetid://12819899325",
			"rbxassetid://12819900514",
			"rbxassetid://12819901586"
		},
		bubble = {
			"rbxassetid://12084357742",
			"rbxassetid://12084362552",
			"rbxassetid://12084364532"
		},
		fire = {
			"rbxassetid://7066673626",
			"rbxassetid://7068566462",
			"rbxassetid://7068576521",
			"rbxassetid://12805017571",
			"rbxassetid://12805019405",
			"rbxassetid://12805020217",
			"rbxassetid://12804920351",
			"rbxassetid://12799159529",
			"rbxassetid://12085812562",
			"rbxassetid://12085810672",
			"rbxassetid://12085838634",
			"rbxassetid://12085837227"
		},
		nerdy = {
			"rbxassetid://78540121386034",
			"rbxassetid://106706459391766",
			"rbxassetid://71379329725316",
			"rbxassetid://106794808706970"
		},
		bolt = {
			"rbxassetid://12089078865",
			"rbxassetid://12089081796",
			"rbxassetid://12089071409",
			"rbxassetid://12089067981"
		},
		gravity = {
			"rbxassetid://13121004548",
			"rbxassetid://13121006393",
			"rbxassetid://13121007879"
		},
		divine = {
			"rbxassetid://13121010175",
			"rbxassetid://13121011516",
			"rbxassetid://13121013051"
		},
		smog = {
			"rbxassetid://12085812562",
			"rbxassetid://12085810672",
			"rbxassetid://12799159529",
			"rbxassetid://12085838634",
			"rbxassetid://12085837227"
		},
		ice = {
			"rbxassetid://7066673626",
			"rbxassetid://7068566462",
			"rbxassetid://7068576521",
			"rbxassetid://12867746510",
			"rbxassetid://12867745729",
			"rbxassetid://12805191197",
			"rbxassetid://12805192081",
			"rbxassetid://12805192997",
			"rbxassetid://12805220334"
		},
		smoke = {
			"rbxassetid://7066673626",
			"rbxassetid://7068566462",
			"rbxassetid://7068576521"
		},
		money = {
			"rbxassetid://13752918780",
			"rbxassetid://13752939222",
			"rbxassetid://13752904980",
			"rbxassetid://8971870792"
		}
	},
	ApplyValues = function(p14, p15)
		for k, v in pairs(p15) do
			p14[k] = v
		end
	end,
	waitX = function(p16)
		local timestamp = tick()
		local n1 = 0

		while p16 > n1 do
			game:GetService("RunService").Heartbeat:Wait()
			n1 = tick() - timestamp
		end
	end,
	FadeChildren = function(p17, p18)
		local t7: {[any]: any} = {}

		for _, v in ipairs(p17:GetDescendants()) do
			local v61 = t5[v.ClassName]

			if v61 ~= nil then
				table.insert(t7, tweenService:Create(v, p18, v61))
			end
		end

		return {
			Play = function()
				for _, v in ipairs(t7) do
					v:Play()
				end
			end,
			Pause = function()
				for _, v in ipairs(t7) do
					v:Pause()
				end
			end,
			Cancel = function()
				for _, v in ipairs(t7) do
					v:Cancel()
				end
			end,
			Add = function(p19)
				table.insert(t7, p19)
			end
		}
	end,
	setCardZIndex = function(p20, p21)
		local zIndex = p20.ZIndex

		for _, v in pairs(p20:GetDescendants()) do
			if v:IsA("GuiObject") then
				v.ZIndex = p21 + (v.ZIndex - zIndex)
			end
		end

		p20.ZIndex = p21
	end,
	Spritesheet = function(p22, p23, p24, p25, p26, p27, p28, p29)
		if not p22 or not p22.Parent then
			return
		end

		local u75 = nil

		local v76, v77 = xpcall(function()
			if not p22:IsA("ImageLabel") and not p22:IsA("ImageButton") then
				return "Target must be an ImageLabel or ImageButton"
			end

			local imageRectSize = p23 or Vector2.new(341.3, 341.3)

			if typeof(imageRectSize) == "Vector2" and not (imageRectSize.X <= 0) and not (imageRectSize.Y <= 0) and imageRectSize.X == imageRectSize.X and imageRectSize.Y == imageRectSize.Y and imageRectSize.X ~= math.huge and imageRectSize.Y ~= math.huge and imageRectSize.X ~= -math.huge and imageRectSize.Y ~= -math.huge then
				local n1 = 3
				local Y = nil

				if p24 ~= nil then
					if typeof(p24) == "Vector2" then
						n1 = p24.X
						Y = p24.Y
					else
						if typeof(p24) ~= "table" then
							return "Sheet size must be a table or Vector2"
						end

						n1 = p24[1]
						Y = p24[2]
					end
				end

				if typeof(n1) ~= "number" or n1 ~= n1 or n1 == math.huge or n1 == -math.huge or n1 < 1 or n1 % 1 ~= 0 then
					return "Invalid column count"
				end

				if Y == nil or typeof(Y) == "number" and Y == Y and Y ~= math.huge and Y ~= -math.huge and not (Y < 1) and Y % 1 == 0 then
					if typeof(p25) ~= "number" or typeof(p26) ~= "number" or p25 ~= p25 or p26 ~= p26 or p25 == math.huge or p25 == -math.huge or p26 == math.huge or p26 == -math.huge or p25 % 1 ~= 0 or p26 % 1 ~= 0 or p25 < 1 or p26 < p25 then
						return "Invalid frame range"
					end

					if p26 - p25 + 1 > 10000 then
						return "Frame range exceeds safety limit (10000)"
					end

					if typeof(p27) == "number" and p27 == p27 and p27 ~= math.huge and p27 ~= -math.huge and not (p27 <= 0) then
						local v668 = p28 or imageRectSize

						if typeof(v668) ~= "Vector2" or v668.X <= 0 or v668.Y <= 0 or v668.X ~= v668.X or v668.Y ~= v668.Y or v668.X == math.huge or v668.Y == math.huge or v668.X == -math.huge or v668.Y == -math.huge then
							return "Invalid frame spacing"
						end

						if Y and p26 > n1 * Y then
							return "Frame range exceeds sheet dimensions"
						end

						u75 = {}
						object[p22] = u75
						p22.ImageRectSize = imageRectSize

						local n2 = 1 / p27

						while true do
							for i = p25 - 1, p26 - 1 do
								if not p22.Parent or object[p22] ~= u75 then
									break
								end

								local vector2New = Vector2.new
								local n3 = i % n1 * v668.X
								local floored = math.floor(i / n1)

								p22.ImageRectOffset = vector2New(n3, floored * v668.Y)
								task.wait(n2)

								if not p22.Parent or object[p22] ~= u75 then
									break
								end
							end

							if not p29 or not p22.Parent or object[p22] ~= u75 then
								break
							end
						end

						if object[p22] == u75 then
							object[p22] = nil
						end

						return nil
					end

					return "FPS must be a positive finite number"
				end

				return "Invalid row count"
			end

			return "Invalid cell size"
		end, debug.traceback)

		if not v76 then
			if u75 and u75 == object[p22] then
				object[p22] = nil
			end

			local text: string = tostring(v77)

			warn("[Spritesheet] Unexpected runtime error:\n" .. text)
		elseif v77 then
			warn("[Spritesheet] " .. v77)
		end
	end,
	TweenProperty = function(p30, p31, p32, p33, p34, _)
		local roundedUp = math.ceil(p34 / 0.018)

		for i = 1, roundedUp do
			local n1 = i / roundedUp

			p30[p31] = p32 * (1 - n1) + p33 * n1
			stepped:wait()
		end
	end,
	Shake = function(p36, p37, p38, p39, p40)
		local magnitude = p36.AbsoluteSize.magnitude

		for i = 1, p38 / 0.018 do
			local scale = p37.X.Scale
			local offset = p37.X.Offset
			local v97 = mathRandom()
			local v98 = p37.Y.Scale
			local v99 = p37.Y.Offset
			local v100 = mathRandom()

			p36.Position = uDim2New(scale, offset + (v97 - 0.5) * (magnitude * p39), v98, v99 + (v100 - 0.5) * (magnitude * p39))

			if not p40 or i >= p40 / 0.018 then
				p39 *= 0.9
			end

			stepped:wait()
		end

		p36.Position = p37
	end,
	ShakeIn = function(p41, p42, p43, p44, p45)
		local magnitude = p41.AbsoluteSize.magnitude

		for _ = 1, p43 / 2 / 0.018 do
			local scale = p42.X.Scale
			local offset = p42.X.Offset
			local v110 = mathRandom()
			local v111 = p42.Y.Scale
			local v112 = p42.Y.Offset
			local v113 = mathRandom()

			p41.Position = uDim2New(scale, offset + (v110 - 0.5) * (magnitude * p44), v111, v112 + (v113 - 0.5) * (magnitude * p44))
			p44 *= 1.1

			if p44 > p45 then
				p44 = p45
			end

			stepped:wait()
		end

		for _ = 1, p43 / 2 / 0.018 do
			local v115 = p42.X.Scale
			local v116 = p42.X.Offset
			local v117 = mathRandom()
			local v118 = p42.Y.Scale
			local v119 = p42.Y.Offset
			local v120 = mathRandom()

			p41.Position = uDim2New(v115, v116 + (v117 - 0.5) * (magnitude * p44), v118, v119 + (v120 - 0.5) * (magnitude * p44))
			stepped:wait()
		end

		p41.Position = p42
	end,
	ShakeInOut = function(p46, p47, p48, p49)
		local magnitude = p46.AbsoluteSize.magnitude

		for _ = 1, p48 / 2 / 0.018 do
			local scale = p47.X.Scale
			local offset = p47.X.Offset
			local v129 = mathRandom()
			local v130 = p47.Y.Scale
			local v131 = p47.Y.Offset
			local v132 = mathRandom()

			p46.Position = uDim2New(scale, offset + (v129 - 0.5) * (magnitude * p49), v130, v131 + (v132 - 0.5) * (magnitude * p49))
			p49 *= 1.1
			stepped:wait()
		end

		for _ = 1, p48 / 2 / 0.018 do
			local v134 = p47.X.Scale
			local v135 = p47.X.Offset
			local v136 = mathRandom()
			local v137 = p47.Y.Scale
			local v138 = p47.Y.Offset
			local v139 = mathRandom()

			p46.Position = uDim2New(v134, v135 + (v136 - 0.5) * (magnitude * p49), v137, v138 + (v139 - 0.5) * (magnitude * p49))
			p49 *= 0.9
			stepped:wait()
		end

		p46.Position = p47
	end
}

function module.ShakeSync(p50, p51, p52, p53)
	task.spawn(function()
		module.Shake(p50, p51, p52, p53)
	end)
end
function module.ShakeBattle(p54, p55, p56, p57)
	local visualNovel

	if p54.Parent:FindFirstChild("VisualNovel") then
		visualNovel = p54.Parent:FindFirstChild("VisualNovel")
	else
		visualNovel = p54.Parent.BattleNew
	end

	module.Shake(visualNovel, visualNovel.Position, p55, p56, p57)
end
function module.ShakeBattleSync(p58, p59, p60, p61)
	task.spawn(function()
		module.ShakeBattle(p58, p59, p60, p61)
	end)
end
function module.New(p62)
	return function(p63)
		local v675 = Instance.new(p62)

		if type(p63) == "table" then
			for k, v in pairs(p63) do
				v675[k] = v
			end

			return v675
		end

		warn("Expected properties to be a table.")

		return v675
	end
end
function module.NewCircle(parent, p65)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = uDim2New()
	imageLabel.Parent = parent
	module.ApplyValues(imageLabel, p65)

	return imageLabel
end
function module.NewerCircle(parent, p67)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = vector2New(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = uDim2New()
	imageLabel.Parent = parent
	module.ApplyValues(imageLabel, p67)

	return imageLabel
end
function module.NewCard(p68, p69)
	local parent = module.NewerCircle(p68, p69)
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.AspectRatio = 0.6266
	uiAspectRatioConstraint.Parent = parent

	return parent
end
function module.NewText(parent, p71)
	local textLabel: TextLabel = Instance.new("TextLabel")

	textLabel.AnchorPoint = vector2New(0.5, 0.5)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderSizePixel = 0
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextScaled = true
	textLabel.Parent = parent
	module.ApplyValues(textLabel, p71)

	return textLabel
end
function module.NewParticle(p72, p73)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.BackgroundTransparency = 1
	imageLabel.Size = uDim2New()
	imageLabel.Parent = p72.Parent
	module.ApplyValues(imageLabel, p73)

	return imageLabel
end
function module.NewTweenProperty(p74, p75, p76, p77, p78, p79, p80)
	if p74 and p74:IsA("Instance") and p75 then
		local v177 = Enum.EasingStyle[p79]
		local v178 = Enum.EasingDirection[p80 or "Out"]

		if v177 and v178 then
			local u179 = nil

			local ok, result = pcall(function()
				local tweenInfo = TweenInfo.new(p78, v177, v178)

				u179 = tweenService:Create(p74, tweenInfo, { [p75] = p77 })
				p74[p75] = p76
				u179:Play()
				u179.Completed:Wait()
			end)

			if not ok then
				warn("NewTweenProperty error:", result)
			end

			return
		end

		warn("Invalid tween easing style or direction.")

		return
	end

	warn("Invalid object or property.")
end
function module.preloadImages(p81, p82: {[any]: any}, p83)
	if typeof(p82) == "string" then
		p82 = { p82 }
	end

	local t8: {[any]: any} = {}

	for _, v in ipairs(p82) do
		if not t2[v] then
			t2[v] = true

			local v189

			if p83 then
				local v190 = module.New("ImageLabel")
				local v191 = uDim2New(0, 0, 0, 0)
				local v192 = uDim2New(0.5, 0, 0.5, -36)

				v189 = v190({
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v191,
					Position = v192,
					Image = v
				})
			else
				local newerCircle = module.NewerCircle
				local v194 = uDim2New(0, 0, 0, 0)
				local v195 = uDim2New(0.5, 0, 0.5, -36)

				v189 = newerCircle(p81, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v194,
					Position = v195,
					Image = v
				})
			end

			table.insert(t8, v189)
		end
	end

	task.spawn(function()
		task.wait(0.5)

		for _, v in ipairs(t8) do
			if v and v.Parent ~= nil then
				v:Destroy()
			end
		end
	end)
end
function module.PreloadTech(p84, p85)
	module.preloadImages(p84, p85, false)
end
function module.PreloadClientTech(p86)
	module.preloadImages(nil, p86, true)
end
function module.SpeakText(p87, p88, _, p90, p91, p92, p93)
	local newText = module.NewText
	local v207 = UDim2.fromOffset(p88.AbsoluteSize.X * p90, p88.AbsoluteSize.Y / 4)
	local uDim2 = UDim2.new(0, p91.AbsolutePosition.X, 0, p91.AbsolutePosition.Y)
	local uDim23 = UDim2.new(0, p91.AbsoluteSize.X * 0.5, 0, p91.AbsoluteSize.Y * 0.5)
	local v210 = newText(p87, { Size = v207, Position = uDim2 + uDim23 })

	module.ApplyValues(v210, p92)

	local v211 = UDim2.fromOffset(v210.AbsolutePosition.X + v210.AbsoluteSize.X / 2, p88.AbsolutePosition.Y - v210.AbsoluteSize.Y / 2)

	animation.Animate(v210, { Position = v211 }, 0.35, "Out", "Quint")
	task.wait(p93 or 0)
	animation.AnimateAsync(v210, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.35, "Out", "Quint")
	spawn(function()
		wait(0.35)
		v210:Destroy()
	end)
end
function module.Speak(p94, p95, p96, _, p98, p99)
	module.SpeakText(p94, p95, p96, 1, p95, p98, p99)
end
function module.SpeakOther(p100, p101, p102, _, p104, p105)
	module.SpeakText(p100, p101, p102, 1, p102, p104, p105)
end
function module.SpeakAlly(p106, p107, p108, _, p110, p111)
	module.SpeakText(p106, p107, p108, 4, p106.Parent.BattleNew.VirtualField, p110, p111)
end
function module.SpeakEnemyField(p112, p113, p114, _, p116, p117)
	module.SpeakText(p112, p113, p114, 4, p112.Parent.BattleNew.VirtualEnemyField, p116, p117)
end
function module.Pulse(p118, p119, p120)
	local v239 = p120.Time or 1
	local v240 = p120.FlashTime or 0
	local v241 = p120.SizeMultiplier or 1.2
	local v242 = p120.Color or Color3.fromRGB(255, 255, 255)
	local v243 = p120.Transparency or 0
	local v244 = p120.BackgroundTransparency or 1
	local u245: boolean = false
	local u246 = v242

	if typeof(v242) == "table" then
		u246 = v242[1]
		u245 = true
	end

	local newerCircle = module.NewerCircle
	local t9: {[any]: any} = {
		BackgroundTransparency = v244,
		ImageTransparency = v243,
		Image = p119.Image,
		ImageColor3 = u246,
		Rotation = p119.Rotation,
		Size = UDim2.fromOffset(p119.AbsoluteSize.X, p119.AbsoluteSize.Y)
	}
	local uDim2 = UDim2.new(0, p119.AbsolutePosition.X, 0, p119.AbsolutePosition.Y)
	local uDim24 = UDim2.new(0, p119.AbsoluteSize.X * 0.5, 0, p119.AbsoluteSize.Y * 0.5)

	t9.Position = uDim2 + uDim24
	t9.ZIndex = p120.ZIndex or p119.ZIndex - 1

	local v251 = newerCircle(p118, t9)

	if u245 then
		spawn(function()
			module.NewTweenProperty(v251, "ImageColor3", u246, v242[2], v239, "Quart")
		end)
	end

	local v252 = UDim2.fromOffset(p119.AbsoluteSize.X * v241, p119.AbsoluteSize.Y * v241)

	v251:TweenSize(v252, "Out", "Quart", v239 - v240)
	wait(v240)
	spawn(function()
		module.NewTweenProperty(v251, "ImageTransparency", v243, 1, v239 - v240, "Quart")
	end)
	wait(v239 - v240)
	v251:Destroy()
end
function module.Breath(p121, p122, p123, p124)
	local v257 = copyTable(p124)
	local v258 = v257.Projectile or module.breathimages.fire
	local v259 = v257.Color or Color3.fromRGB(255, 255, 255)
	local v260 = v257.Size or UDim2.fromOffset(50, 50)
	local v261 = v257.Strength or 300
	local v262 = v257.Time or 1
	local v263 = v257.Speed or 0.7
	local v264 = v257.Lifetime or 0.4
	local v265 = v257.Transparency or 0.1
	local v266 = v257.EasingStyle or "Quint"
	local rotation = v257.Rotation
	local u268 = v259
	local u269 = v258

	module.PreloadTech(p121, v258)
	spawn(function()
		local u681: boolean = true

		spawn(function()
			wait(v262)
			u681 = false
		end)

		while u681 do
			if v261 > 0 then
				task.wait(1 / v261)
			end

			if n1 < 80 then
				local y = p123.AbsolutePosition.Y
				local n2 = p123.AbsolutePosition.Y + p123.AbsoluteSize.Y
				local uDim2New2 = UDim2.new
				local randomNumber = math.random(p123.AbsolutePosition.X, p123.AbsolutePosition.X + p123.AbsoluteSize.X)
				local uDim2 = uDim2New2(0, randomNumber, 0, math.random(y, n2))
				local randomNumber2 = math.random(0, 180)

				if typeof(v258) == "table" then
					local randomNumber3 = math.random(1, #v258)

					u269 = v258[randomNumber3]
				end

				if typeof(v259) == "table" then
					u268 = v259[1]
				end

				spawn(function()
					n1 += 1

					local newerCircle = module.NewerCircle
					local v747 = u269
					local v748 = u268
					local v749 = uDim2New(0, v260.X.Offset / 4, 0, v260.Y.Offset / 4)
					local v750 = p122
					local uDim3 = UDim2.new(0, v750.AbsolutePosition.X, 0, v750.AbsolutePosition.Y)
					local uDim25 = UDim2.new(0, v750.AbsoluteSize.X * 0.5, 0, v750.AbsoluteSize.Y * 0.5)
					local t26: {[any]: any} = {
						BackgroundTransparency = 1,
						Image = v747,
						ImageColor3 = v748,
						ImageTransparency = v265,
						Size = v749,
						Position = uDim3 + uDim25
					}
					local v754 = v257.ZIndex or p123.ZIndex
					local randomNumber4 = math.random(1, 4)

					t26.ZIndex = v754 + randomNumber4 + 10000
					t26.Rotation = rotation or randomNumber2

					local v756 = newerCircle(p121, t26)

					v756:TweenSizeAndPosition(v260, uDim2, "Out", v266, v263)

					if typeof(v259) == "table" then
						spawn(function()
							module.NewTweenProperty(v756, "ImageColor3", u268, v259[2], 0.55, "Quart")
						end)
					end

					if not rotation then
						spawn(function()
							local newTweenProperty = module.NewTweenProperty
							local randomNumber5 = math.random(0, 180)

							newTweenProperty(v756, "Rotation", randomNumber2, randomNumber5, 0.55, "Quad")
						end)
					end

					wait(v264)
					spawn(function()
						module.NewTweenProperty(v756, "ImageTransparency", 0.1, 1, v264 - 0.1, "Quad")
						v756:Destroy()
						n1 -= 1
					end)
				end)
			end
		end
	end)
end
function module.BreathAttack(p125, p126, p127, _, p129, p130, p131, p132, p133, p134, p135, p136, p137, p138)
	module.PreloadTech(p125, p130)
	audioService.PlaySound(p131)

	local n1 = p127.AbsoluteSize.X * p137 * p132
	local n2 = p127.AbsoluteSize.X * p138 * p132
	local v286 = UDim2.fromOffset(n1, n1)
	local t10: {[any]: any} = {
		Projectile = p130,
		Color = { p133, p134 },
		Size = v286,
		Strength = p129 * p132 * 0.6,
		Time = 0.5 * p132
	}

	module.Breath(p125, p126, p127, t10)
	t10.Color = { p135, p136 }
	t10.Size = UDim2.fromOffset(n2, n2)
	module.Breath(p125, p126, p127, t10)
	task.wait(0.5 * p132)
	module.Shake(p127, p127.Position, 0.15, 0.1)
	task.wait(0.45 * p132)
end
function module.BreathSelf(p139, p140, _, _, p143, p144, p145, p146, p147, p148, p149, p150, p151, p152)
	module.PreloadTech(p139, p144)
	audioService.PlaySound(p145)

	local v302 = UDim2.fromOffset(p140.AbsoluteSize.X * p151 * p146, p140.AbsoluteSize.X * p151 * p146)

	task.spawn(function()
		module.ShakeSync(p140, p140.Position, 0.15, 0.1)
	end)

	local t11: {[any]: any} = {
		Projectile = p144,
		Color = { p147, p148 },
		Size = v302,
		Strength = p143 * p146 * 0.6,
		Time = 0.5 * p146
	}

	module.Breath(p139, p140, p140, t11)
	t11.Color = { p149, p150 }
	t11.Size = UDim2.fromOffset(p140.AbsoluteSize.X * p152 * p146, p140.AbsoluteSize.X * p152 * p146)
	module.Breath(p139, p140, p140, t11)
	task.wait(0.5 * p146)
end
function module.BreathEngulf(p153, _, p155, _, p157, p158, p159, p160, p161, p162, p163, p164, p165, p166)
	module.PreloadTech(p153, p158)
	audioService.PlaySound(p159)

	local v318 = UDim2.fromOffset(p155.AbsoluteSize.X * p165 * p160, p155.AbsoluteSize.X * p165 * p160)

	task.spawn(function()
		module.ShakeSync(p155, p155.Position, 0.15, 0.1)
	end)

	local t12: {[any]: any} = {
		Projectile = p158,
		Color = { p161, p162 },
		Size = v318,
		Strength = p157 * p160 * 0.6,
		Time = 0.5 * p160
	}

	module.Breath(p153, p155, p155, t12)
	t12.Color = { p163, p164 }
	t12.Size = UDim2.fromOffset(p155.AbsoluteSize.X * p166 * p160, p155.AbsoluteSize.X * p166 * p160)
	module.Breath(p153, p155, p155, t12)
	task.wait(0.5 * p160)
end
function module.BreathAlly(p167, p168, _, p170, p171, p172, p173, p174, p175, p176, p177, p178, p179, p180)
	module.PreloadTech(p167, p172)

	local s1
	local s2

	if p170 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p170 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v336 = p167.Parent.BattleNew["Virtual" .. s1 .. "Field"]
	local v337 = p167.Parent.BattleNew["Virtual" .. s2 .. "Field"]

	audioServicePlaySound(p173)

	if not p168 then
		p168 = p167.Parent.BattleNew

		local v338 = p168
		local uDim2 = UDim2.new(0, v338.AbsolutePosition.X, 0, v338.AbsolutePosition.Y)
		local uDim26 = UDim2.new(0, v338.AbsoluteSize.X * 0.5, 0, v338.AbsoluteSize.Y * 0.5)

		v4(uDim2 + uDim26)
	else
		task.spawn(function()
			module.Shake(p168, p168.Position, 0.5 * p174, 0.1)
		end)
	end

	local n1 = v336.AbsolutePosition.Y + v336.AbsoluteSize.Y / 2
	local newerCircle = module.NewerCircle
	local uDim2 = UDim2.new(0, v336.AbsoluteSize.Y / p179, 0, v336.AbsoluteSize.Y / p179)
	local uDim27 = UDim2.new(0, v336.AbsolutePosition.X + v336.AbsoluteSize.X, 0, n1)

	v337 = newerCircle(p167, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim27
	})

	local v345 = UDim2.fromOffset(v336.AbsoluteSize.Y / p180, v336.AbsoluteSize.Y / p180)
	local uDim28 = UDim2.new(0, v336.AbsolutePosition.X, 0, n1)

	v337:TweenPosition(uDim28, "In", "Quad", 0.5 * p174)

	local t13: {[any]: any} = {
		Projectile = p172,
		Color = { p175, p176 },
		Size = v345,
		Strength = p171 * p174 * 0.6,
		Time = 0.5 * p174
	}

	module.Breath(p167, p168, v337, t13)
	t13.Color = { p177, p178 }
	module.Breath(p167, p168, v337, t13)
	wait(0.5 * p174)
end
function module.BreathEnemy(p181, p182, _, p184, p185, p186, p187, p188, p189, p190, p191, p192, p193, p194)
	module.PreloadTech(p181, p186)

	local s1
	local s2

	if p184 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p184 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v364 = p181.Parent.BattleNew["Virtual" .. s1 .. "Field"]

	v364 = p181.Parent.BattleNew["Virtual" .. s2 .. "Field"]
	audioServicePlaySound(p187)

	if not p182 then
		p182 = p181.Parent.BattleNew

		local v365 = p182
		local uDim2 = UDim2.new(0, v365.AbsolutePosition.X, 0, v365.AbsolutePosition.Y)
		local uDim29 = UDim2.new(0, v365.AbsoluteSize.X * 0.5, 0, v365.AbsoluteSize.Y * 0.5)

		v4(uDim2 + uDim29)
	else
		task.spawn(function()
			module.Shake(p182, p182.Position, 0.5 * p188, 0.1)
		end)
	end

	local n1 = v364.AbsolutePosition.Y + v364.AbsoluteSize.Y / 2
	local newerCircle = module.NewerCircle
	local uDim2 = UDim2.new(0, v364.AbsoluteSize.Y / p193, 0, v364.AbsoluteSize.Y / p193)
	local uDim210 = UDim2.new(0, v364.AbsolutePosition.X, 0, n1)
	local v372 = newerCircle(p181, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim210
	})
	local v373 = UDim2.fromOffset(v364.AbsoluteSize.Y / p194, v364.AbsoluteSize.Y / p194)
	local uDim211 = UDim2.new(0, v364.AbsolutePosition.X + v364.AbsoluteSize.X, 0, n1)

	v372:TweenPosition(uDim211, "In", "Quad", 0.5 * p188)

	local t14: {[any]: any} = {
		Projectile = p186,
		Color = { p189, p190 },
		Size = v373,
		Strength = p185 * p188 * 0.6,
		Time = 0.5 * p188
	}

	module.Breath(p181, p182, v372, t14)
	t14.Color = { p191, p192 }
	module.Breath(p181, p182, v372, t14)
	wait(0.5 * p188)
end
function module.BreathAllyHand(p195, p196, _, p198, p199, p200, p201, p202, p203, p204, p205, p206, p207, p208)
	module.PreloadTech(p195, p200)

	local s1
	local s2

	if p198 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p198 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v392 = p195.Parent.BattleNew["Virtual" .. s1 .. "Hand"]
	local v393 = p195.Parent.BattleNew["Virtual" .. s2 .. "Hand"]

	audioServicePlaySound(p201)

	if not p196 then
		p196 = p195.Parent.BattleNew
	else
		task.spawn(function()
			module.Shake(p196, p196.Position, 0.7 * p202, 0.1)
		end)
	end

	local n1 = v392.AbsolutePosition.Y + v392.AbsoluteSize.Y / 2
	local newerCircle = module.NewerCircle
	local uDim2 = UDim2.new(0, v392.AbsoluteSize.Y / p207, 0, v392.AbsoluteSize.Y / p207)
	local uDim212 = UDim2.new(0, v392.AbsolutePosition.X, 0, n1)

	v393 = newerCircle(p195, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim212
	})

	local v398 = UDim2.fromOffset(v392.AbsoluteSize.Y / p208, v392.AbsoluteSize.Y / p208)
	local uDim213 = UDim2.new(0, v392.AbsolutePosition.X + v392.AbsoluteSize.X, 0, n1)

	v393:TweenPosition(uDim213, "In", "Quad", 0.5 * p202)

	local t15: {[any]: any} = {
		Projectile = p200,
		Color = { p203, p204 },
		Size = v398,
		Strength = p199 * p202,
		Time = 0.5 * p202
	}

	module.Breath(p195, p196, v393, t15)
	t15.Color = { p205, p206 }
	module.Breath(p195, p196, v393, t15)
	wait(0.45 * p202)
end
function module.BreathEnemyHand(p209, p210, _, p212, p213, p214, p215, p216, p217, p218, p219, p220, p221, p222)
	module.PreloadTech(p209, p214)

	local s1
	local s2

	if p212 == "" then
		s1 = ""
		s2 = "Enemy"
	elseif p212 == "Enemy" then
		s1 = "Enemy"
		s2 = ""
	else
		s1 = nil
		s2 = nil
	end

	local v417 = p209.Parent.BattleNew["Virtual" .. s1 .. "Hand"]

	v417 = p209.Parent.BattleNew["Virtual" .. s2 .. "Hand"]
	audioServicePlaySound(p215)

	if not p210 then
		p210 = p209.Parent.BattleNew

		local v418 = p210
		local uDim2 = UDim2.new(0, v418.AbsolutePosition.X, 0, v418.AbsolutePosition.Y)
		local uDim214 = UDim2.new(0, v418.AbsoluteSize.X * 0.5, 0, v418.AbsoluteSize.Y * 0.5)

		v4(uDim2 + uDim214)
	else
		task.spawn(function()
			module.Shake(p210, p210.Position, 0.7 * p216, 0.1)
		end)
	end

	local n1 = v417.AbsolutePosition.Y + v417.AbsoluteSize.Y / 2
	local newerCircle = module.NewerCircle
	local uDim2 = UDim2.new(0, v417.AbsoluteSize.Y / p221, 0, v417.AbsoluteSize.Y / p221)
	local uDim215 = UDim2.new(0, v417.AbsolutePosition.X, 0, n1)
	local v425 = newerCircle(p209, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim215
	})
	local v426 = UDim2.fromOffset(v417.AbsoluteSize.Y / p222, v417.AbsoluteSize.Y / p222)
	local uDim216 = UDim2.new(0, v417.AbsolutePosition.X + v417.AbsoluteSize.X, 0, n1)

	v425:TweenPosition(uDim216, "In", "Quad", 0.5 * p216)

	local t16: {[any]: any} = {
		Projectile = p214,
		Color = { p217, p218 },
		Size = v426,
		Strength = p213 * p216 * 0.6,
		Time = 0.5 * p216
	}

	module.Breath(p209, p210, v425, t16)
	t16.Color = { p219, p220 }
	module.Breath(p209, p210, v425, t16)
	wait(0.5 * p216)
end
function module.BreathEnemyBaseplate(p223, p224, _, p226, p227, p228, p229, p230, p231, p232, p233, p234, p235, p236)
	module.PreloadTech(p223, p228)

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

	local v445 = p223.Parent.BattleNew[s1 .. "Baseplate"]

	v445 = p223.Parent.BattleNew[s2 .. "Baseplate"]
	audioServicePlaySound(p229)

	if not p224 then
		p224 = p223.Parent.BattleNew

		local v446 = p224
		local uDim2 = UDim2.new(0, v446.AbsolutePosition.X, 0, v446.AbsolutePosition.Y)
		local uDim217 = UDim2.new(0, v446.AbsoluteSize.X * 0.5, 0, v446.AbsoluteSize.Y * 0.5)

		v4(uDim2 + uDim217)
	else
		task.spawn(function()
			module.Shake(p224, p224.Position, 0.7 * p230, 0.1)
		end)
	end

	local n1 = v445.AbsolutePosition.Y + v445.AbsoluteSize.Y / 2
	local newerCircle = module.NewerCircle
	local uDim2 = UDim2.new(0, v445.AbsoluteSize.Y / p235, 0, v445.AbsoluteSize.Y / p235)
	local uDim218 = UDim2.new(0, v445.AbsolutePosition.X, 0, n1)
	local v453 = newerCircle(p223, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = uDim2,
		Position = uDim218
	})
	local v454 = UDim2.fromOffset(v445.AbsoluteSize.Y / p236, v445.AbsoluteSize.Y / p236)
	local uDim219 = UDim2.new(0, v445.AbsolutePosition.X + v445.AbsoluteSize.X, 0, n1)

	v453:TweenPosition(uDim219, "In", "Quad", 0.5 * p230)

	local t17: {[any]: any} = {
		Projectile = p228,
		Color = { p231, p232 },
		Size = v454,
		Strength = p227 * p230,
		Time = 0.5 * p230
	}

	module.Breath(p223, p224, v453, t17)
	t17.Color = { p233, p234 }
	module.Breath(p223, p224, v453, t17)
	wait(0.45 * p230)
end
function module.BreathInverse(p237, p238, p239, p240)
	local v461 = copyTable(p240)
	local v462 = v461.Projectile or module.breathimages.fire
	local v463 = v461.Color or Color3.fromRGB(255, 255, 255)
	local v464 = v461.Size or UDim2.fromOffset(50, 50)
	local v465 = v461.Strength or 300
	local v466 = v461.Time or 1
	local v467 = v461.Speed or 0.7
	local v468 = v461.Lifetime or 0.5
	local v469 = v461.Transparency or 0.1
	local v470 = v461.EasingStyle or "Quint"
	local u471 = v463
	local u472 = v462

	module.PreloadTech(p237, v462)
	spawn(function()
		local u689: boolean = true

		spawn(function()
			wait(v466)
			u689 = false
		end)

		while u689 do
			if v465 > 0 then
				task.wait(1 / v465)
			end

			if n1 < 80 then
				local y = p239.AbsolutePosition.Y
				local n2 = p239.AbsolutePosition.Y + p239.AbsoluteSize.Y
				local uDim2New2 = UDim2.new
				local randomNumber = math.random(p239.AbsolutePosition.X, p239.AbsolutePosition.X + p239.AbsoluteSize.X)
				local uDim2 = uDim2New2(0, randomNumber, 0, math.random(y, n2))
				local randomNumber6 = math.random(0, 180)

				if typeof(v462) == "table" then
					local randomNumber7 = math.random(1, #v462)

					u472 = v462[randomNumber7]
				end

				if typeof(v463) == "table" then
					u471 = v463[1]
				end

				spawn(function()
					n1 += 1

					local newerCircle = module.NewerCircle
					local v758 = u472
					local v759 = u471
					local v760 = uDim2New(0, v464.X.Offset / 1.5, 0, v464.Y.Offset / 1.5)
					local v761 = p238
					local uDim3 = UDim2.new(0, v761.AbsolutePosition.X, 0, v761.AbsolutePosition.Y)
					local uDim220 = UDim2.new(0, v761.AbsoluteSize.X * 0.5, 0, v761.AbsoluteSize.Y * 0.5)
					local t27: {[any]: any} = {
						BackgroundTransparency = 1,
						Image = v758,
						ImageColor3 = v759,
						ImageTransparency = v469,
						Size = v760,
						Position = uDim3 + uDim220
					}
					local v765 = v461.ZIndex or p239.ZIndex
					local randomNumber8 = math.random(1, 4)

					t27.ZIndex = v765 + randomNumber8 + 10000
					t27.Rotation = randomNumber6

					local v767 = newerCircle(p237, t27)

					v767:TweenSizeAndPosition(v464, uDim2, "InOut", v470, v467)

					if typeof(v463) == "table" then
						spawn(function()
							module.NewTweenProperty(v767, "ImageColor3", u471, v463[2], 0.25, "Quart")
						end)
					end

					spawn(function()
						local newTweenProperty = module.NewTweenProperty
						local randomNumber9 = math.random(0, 180)

						newTweenProperty(v767, "Rotation", randomNumber6, randomNumber9, 0.55, "Quad")
					end)
					wait(v468)
					spawn(function()
						module.NewTweenProperty(v767, "ImageTransparency", 0.1, 1, v468 - 0.1, "Quad")
						v767:Destroy()
						n1 -= 1
					end)
				end)
			end
		end
	end)
end
function module.BreathReverse(p241, p242, p243, p244)
	local v477 = copyTable(p244)
	local v478 = v477.Projectile or module.breathimages.fire
	local v479 = v477.Color or Color3.fromRGB(255, 255, 255)
	local v480 = v477.Size or UDim2.fromOffset(50, 50)
	local v481 = v477.Strength or 300
	local v482 = v477.Time or 1
	local v483 = v477.Speed or 0.7
	local v484 = v477.Lifetime or 0.5
	local v485 = v477.Transparency or 0.1
	local v486 = v477.EasingStyle or "Quint"
	local v487 = v477.AddtionalSpread or 0
	local u488 = v479
	local u489 = v478

	module.PreloadTech(p241, v478)
	spawn(function()
		local u697: boolean = true

		spawn(function()
			wait(v482)
			u697 = false
		end)

		while u697 do
			if v481 > 0 then
				task.wait(1 / v481)
			end

			if n1 < 80 then
				local n3 = p243.AbsolutePosition.Y - v487
				local n2 = p243.AbsolutePosition.Y + p243.AbsoluteSize.Y + v487
				local uDim2New2 = UDim2.new
				local randomNumber = math.random(p243.AbsolutePosition.X - v487, p243.AbsolutePosition.X + p243.AbsoluteSize.X + v487)
				local uDim2 = uDim2New2(0, randomNumber, 0, math.random(n3, n2))
				local randomNumber10 = math.random(0, 180)

				if typeof(v478) == "table" then
					local randomNumber11 = math.random(1, #v478)

					u489 = v478[randomNumber11]
				end

				if typeof(v479) == "table" then
					u488 = v479[1]
				end

				spawn(function()
					n1 += 1

					local newerCircle = module.NewerCircle
					local v769 = u489
					local v770 = u488
					local v771 = uDim2New(0, v480.X.Offset / 1.5, 0, v480.Y.Offset / 1.5)
					local t28: {[any]: any} = {
						BackgroundTransparency = 1,
						Image = v769,
						ImageColor3 = v770,
						ImageTransparency = v485,
						Size = v771,
						Position = uDim2
					}
					local v773 = v477.ZIndex or p243.ZIndex
					local randomNumber12 = math.random(1, 4)

					t28.ZIndex = v773 + randomNumber12 + 10000
					t28.Rotation = randomNumber10

					local v775 = newerCircle(p241, t28)

					v773 = p242

					local uDim3 = UDim2.new(0, v773.AbsolutePosition.X, 0, v773.AbsolutePosition.Y)
					local uDim221 = UDim2.new(0, v773.AbsoluteSize.X * 0.5, 0, v773.AbsoluteSize.Y * 0.5)

					v775:TweenSizeAndPosition(v480, uDim3 + uDim221, "InOut", v486, v483)

					if typeof(v479) == "table" then
						spawn(function()
							module.NewTweenProperty(v775, "ImageColor3", u488, v479[2], 0.25, "Quart")
						end)
					end

					spawn(function()
						local newTweenProperty = module.NewTweenProperty
						local randomNumber13 = math.random(0, 180)

						newTweenProperty(v775, "Rotation", randomNumber10, randomNumber13, 0.55, "Quad")
					end)
					wait(v484)
					spawn(function()
						module.NewTweenProperty(v775, "ImageTransparency", 0.1, 1, v484 - 0.1, "Quad")
						v775:Destroy()
						n1 -= 1
					end)
				end)
			end
		end
	end)
end
function module.BreathParticle(p245, _, p247, _, p249, p250, p251, p252, p253, p254, p255, p256, p257, p258)
	module.PreloadTech(p245, p250)
	audioService.PlaySound(p251)

	local v504 = UDim2.fromOffset(p247.AbsoluteSize.X * p257 * p252, p247.AbsoluteSize.X * p257 * p252)
	local t18: {[any]: any} = {
		Projectile = p250,
		Color = { p253, p254 },
		Size = v504,
		Strength = p249 * p252 * 0.6,
		Time = 0.5 * p252
	}

	module.Breath(p245, p247, p247, t18)
	t18.Color = { p255, p256 }
	t18.Size = UDim2.fromOffset(p247.AbsoluteSize.X * p258 * p252, p247.AbsoluteSize.X * p258 * p252)
	module.Breath(p245, p247, p247, t18)
	task.wait(0.5 * p252)
end
function module.Emit(p259, p260, p261)
	local v509 = copyTable(p261)
	local t19 = v509.Projectile or module.breathimages.fire

	module.PreloadTech(p259, t19)

	if type(t19) == "string" then
		t19 = { t19 }
	end

	local function chooseProjectile()
		if typeof(t19[1]) == "table" and t19[1].Id then
			local n1 = 0

			for _, v in ipairs(t19) do
				n1 += v.Weight or 1
			end

			local randomNumber = math.random()
			local n2 = 0

			for _, v in ipairs(t19) do
				n2 += v.Weight or 1

				if n2 >= randomNumber * n1 then
					return v.Id
				end
			end

			return t19[1].Id
		end

		local v712 = t19
		local randomNumber = math.random(1, #t19)

		return v712[randomNumber]
	end

	local v512 = v509.Color or Color3.fromRGB(255, 255, 255)
	local v513 = v509.Size or UDim2.fromOffset(50, 50)
	local v514 = v509.Strength or 300
	local v515 = v509.Time or 1
	local v516 = v509.Speed or 0.7
	local v517 = v509.Lifetime or 0.4
	local v518 = v509.Transparency or 0.1
	local v519 = v509.EasingStyle or "Quint"
	local v520 = v509.Range or p260

	spawn(function()
		local u714: boolean = true

		spawn(function()
			task.wait(v515)
			u714 = false
		end)

		while u714 do
			task.wait(1 / v514)

			if n1 < 80 then
				local y = v520.AbsolutePosition.Y
				local n2 = v520.AbsolutePosition.Y + v520.AbsoluteSize.Y
				local uDim2New2 = UDim2.new
				local randomNumber = math.random(v520.AbsolutePosition.X, v520.AbsolutePosition.X + v520.AbsoluteSize.X)
				local uDim2 = uDim2New2(0, randomNumber, 0, math.random(y, n2))
				local randomNumber14 = math.random(0, 180)
				local v721 = chooseProjectile()
				local u722 = v512

				if typeof(v512) == "table" then
					u722 = v512[1]
				end

				n1 += 1
				spawn(function()
					local newerCircle = module.NewerCircle
					local v779 = u722
					local zIndex = p260.ZIndex
					local randomNumber15 = math.random(1, 4)
					local v782 = newerCircle(p259, {
						BackgroundTransparency = 1,
						Image = v721,
						ImageColor3 = v779,
						ImageTransparency = v518,
						Size = v513,
						Position = uDim2,
						ZIndex = zIndex + randomNumber15 + 10000,
						Rotation = randomNumber14
					})

					v779 = uDim2New(0, 0, 0, 0)

					local v783 = p260
					local uDim3 = UDim2.new(0, v783.AbsolutePosition.X, 0, v783.AbsolutePosition.Y)
					local uDim222 = UDim2.new(0, v783.AbsoluteSize.X * 0.5, 0, v783.AbsoluteSize.Y * 0.5)

					v782:TweenSizeAndPosition(v779, uDim3 + uDim222, "InOut", v519, v516)

					if typeof(v512) == "table" and v512[2] then
						spawn(function()
							module.NewTweenProperty(v782, "ImageColor3", u722, v512[2], 0.55, v519, "InOut")
						end)
					end

					spawn(function()
						local newTweenProperty = module.NewTweenProperty
						local randomNumber16 = math.random(0, 180)

						newTweenProperty(v782, "Rotation", randomNumber14, randomNumber16, 0.55, v519, "InOut")
					end)
					task.wait(v517)
					spawn(function()
						module.NewTweenProperty(v782, "ImageTransparency", v518, 1, v517 - 0.1, v519, "InOut")
						v782:Destroy()
						n1 -= 1
					end)
				end)
			end
		end
	end)
end
function module.Biting(p262, _, parent, _, p266, p267, p268)
	module.PreloadTech(p262, { "rbxassetid://13723257738" })
	task.wait(0.15 * p266)
	audioService.PlaySound(p267)

	local newerCircle = module.NewerCircle
	local n1 = parent.ZIndex + 10001
	local v530 = UDim2.fromScale(2 * p266, 2 * p266)
	local v531 = UDim2.fromScale(0.5, 0.5)
	local v532 = newerCircle(p262, {
		BackgroundTransparency = 1,
		Image = "rbxassetid://13723257738",
		ImageTransparency = 0,
		Rotation = 0,
		ZIndex = n1,
		Size = v530,
		Position = v531,
		ImageColor3 = p268,
		ImageRectSize = Vector2.new(341.3, 341.3)
	})
	local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	uiAspectRatioConstraint.Parent = v532
	v532.Parent = parent
	task.spawn(function()
		for i = 1, 9 do
			local vector2New = Vector2.new
			local floored = math.floor((i - 1) / 3)

			v532.ImageRectOffset = vector2New((i + 2) % 3 * 341.3, floored * 341.3)
			task.wait(0.068 * p266)
		end

		v532:Destroy()
	end)
	task.wait(0.3 * p266)

	if p266 == 1 then
		module.ShakeBattleSync(p262, 0.3, 0.015)
		module.ShakeSync(parent, parent.Position, 0.4 * p266, 0.175 * p266)
		wait(0.3 * p266)

		return
	end

	module.ShakeSync(parent, parent.Position, 0.4 * p266, 0.175 * p266)
	wait(0.3 * p266)
end
function module.Throw(p269, p270, p271, p272)
	local v538 = p272.Time or 1
	local v539 = p272.WaitTime or p272.Time or 1
	local v540 = p272.Size or UDim2.fromOffset(p271.AbsoluteSize.X, p271.AbsoluteSize.X)
	local v541 = p272.Color or Color3.fromRGB(255, 255, 255)
	local image = p272.Image
	local v543 = p272.Transparency or 0
	local v544 = p272.EasingStyle or "Linear"
	local v545 = p272.EasingDirection or "Out"
	local v546 = p272.Rotation or 0
	local u547 = v541
	local u548 = v546

	if typeof(v541) == "table" then
		u547 = v541[1]
	end

	local typeName: string = typeof(v546)

	if typeName == "table" then
		u548 = v546[1]
	end

	if typeName == "table" and p270.AbsolutePosition.X > p271.AbsolutePosition.X then
		u548 *= -1
	end

	local v550 = p272.Variation and UDim2.fromOffset(math.random(-p272.Variation, p272.Variation), math.random(-p272.Variation, p272.Variation)) or UDim2.fromOffset(0, 0)
	local vector3 = Vector3.new(p270.AbsolutePosition.X + p270.AbsoluteSize.X / 2, p270.AbsolutePosition.Y, 0)
	local v552 = if v550 then Vector3.new(p271.AbsolutePosition.X + v550.X.Offset + p271.AbsoluteSize.X / 2, p271.AbsolutePosition.Y + v550.Y.Offset, 0) else Vector3.new(p271.AbsolutePosition.X + p271.AbsoluteSize.X / 2, p271.AbsolutePosition.Y, 0)
	local v553 = math.atan2(v552.Y - vector3.Y, v552.X - vector3.X)
	local newerCircle = module.NewerCircle
	local t20: {[any]: any} = {
		BackgroundTransparency = 1,
		ImageTransparency = v543,
		Image = image,
		ImageColor3 = u547,
		Size = v540,
		Rotation = math.deg(v553)
	}
	local uDim2 = UDim2.new(0, p270.AbsolutePosition.X, 0, p270.AbsolutePosition.Y)
	local uDim223 = UDim2.new(0, p270.AbsoluteSize.X * 0.5, 0, p270.AbsoluteSize.Y * 0.5)

	t20.Position = uDim2 + uDim223
	t20.ZIndex = p270.ZIndex + 10000

	local v558 = newerCircle(p269, t20)

	if typeof(v546) == "table" then
		spawn(function()
			module.NewTweenProperty(v558, "Rotation", u548, v546[2], v538, "Linear")
		end)
	end

	if typeof(v541) == "table" then
		spawn(function()
			module.NewTweenProperty(v558, "ImageColor3", u547, v541[2], v538, v544, v545)
		end)
	end

	local uDim224 = UDim2.new(0, p271.AbsolutePosition.X, 0, p271.AbsolutePosition.Y)
	local uDim225 = UDim2.new(0, p271.AbsoluteSize.X * 0.5, 0, p271.AbsoluteSize.Y * 0.5)

	v558:TweenPosition(uDim224 + uDim225 + v550, v545, Enum.EasingStyle[v544], v538)
	wait(v539)

	return v558
end
function module.EngulfBrick(p273, p274, p275, p276)
	module.PreloadTech(p273, {
		"rbxassetid://7066673626",
		"rbxassetid://7068566462",
		"rbxassetid://7068576521",
		"rbxassetid://13234443102",
		"rbxassetid://13234441824"
	})
	module.ShakeSync(p274, p275.Position, 0.2, 0.1)

	local breathEngulf = module.BreathEngulf
	local color3 = Color3.fromRGB(202, 200, 173)
	local color32 = Color3.fromRGB(217, 217, 217)
	local color33 = Color3.fromRGB(240, 220, 221)
	local color34 = Color3.fromRGB(240, 230, 193)

	breathEngulf(p273, p274, p275, p276, 70, {
		"rbxassetid://7066673626",
		"rbxassetid://7068566462",
		"rbxassetid://7068576521",
		"rbxassetid://13234443102",
		"rbxassetid://13234441824"
	}, "Swoosh", 0.5, color3, color32, color33, color34, 1, 0.8)
end
function module.Toss(p277, p278, p279, p280, p281, p282)
	module.PreloadTech(p277, { "rbxassetid://13234440448" })

	if not p282 then
		p282 = Color3.fromRGB(255, 255, 255)
	end

	local smoke = module.breathimages.smoke
	local t21: {[any]: any} = { Color3.fromRGB(190, 190, 190), Color3.fromRGB(134, 134, 134) }
	local v578 = UDim2.fromOffset(p278.AbsoluteSize.Y / (4 / p281), p278.AbsoluteSize.Y / (4 / p281))
	local n1 = p278.ZIndex - 10
	local v580 = UDim2.fromOffset(p278.AbsoluteSize.Y / (1.75 * p281), p278.AbsoluteSize.Y / (1.75 * p281))
	local newerCircle = module.NewerCircle
	local v582 = UDim2.fromOffset(p278.AbsoluteSize.Y / (1.75 * p281), p278.AbsoluteSize.Y / (3 * p281))
	local uDim2 = UDim2.new(0, p278.AbsolutePosition.X, 0, p278.AbsolutePosition.Y)
	local uDim226 = UDim2.new(0, p278.AbsoluteSize.X * 0.5, 0, p278.AbsoluteSize.Y * 0.5)
	local v585 = newerCircle(p277, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = "rbxassetid://13234440448",
		ZIndex = 1,
		ImageColor3 = p282,
		Size = v582,
		Position = uDim2 + uDim226
	})

	wait(0.1)

	local tweenInfo = TweenInfo.new(0.44 * p281)
	local uDim227 = UDim2.new(0, p279.AbsolutePosition.X, 0, p279.AbsolutePosition.Y)
	local uDim228 = UDim2.new(0, p279.AbsoluteSize.X * 0.5, 0, p279.AbsoluteSize.Y * 0.5)

	tweenService:Create(v585, tweenInfo, { Position = uDim227 + uDim228 }):Play()
	module.Breath(p277, v585, p278, {
		Projectile = smoke,
		Color = t21,
		Size = v578,
		Strength = 10 * p281,
		ZIndex = n1,
		Time = 0.325 * p281
	})
	module.Throw(p277, p278, p279, {
		Time = 0.325 * p281,
		Rotation = { 0, 360 },
		Size = v580,
		EasingStyle = "Linear",
		EasingDirection = "In",
		Image = "rbxassetid://13234440448",
		Color = p282
	}):Destroy()
	v585:Destroy()
	audioService.PlaySound("RockImpact")

	if p281 == 1 then
		module.ShakeBattleSync(p277, 0.2, 0.04)
		task.spawn(function()
			module.Shake(p279, p279.Position, 0.4, 0.3)
		end)
		module.EngulfBrick(p277, p279, p279, p280)
		wait(0.2 * p281)

		return
	end

	task.spawn(function()
		module.Shake(p279, p279.Position, 0.35, 0.15)
	end)
	module.EngulfBrick(p277, p279, p279, p280)
	wait(0.2 * p281)
end
function module.Bouncy(p283, p284, p285, _, p287, p288, p289, p290, p291)
	if not p288 then
		p288 = Color3.fromRGB(255, 255, 255)
	end

	local v598 = UDim2.fromOffset(p284.AbsoluteSize.X * p287, p284.AbsoluteSize.Y / 1.6 * p287)
	local t22: {[any]: any} = {
		Time = 0.375 * p287,
		Rotation = { 0, p291 * p287 },
		Size = v598,
		EasingStyle = "Quad",
		EasingDirection = "In",
		Image = p289,
		Color = p288,
		Variation = 60 * p287
	}

	module.PreloadTech(p283, { p289 })

	local u600 = nil
	local t23: {[any]: any} = {
		Bottom = {
			xminimumbound = p285.AbsolutePosition.X - 300,
			xmaximumbound = p285.AbsolutePosition.X,
			yvalue = p285.AbsolutePosition.Y + p285.AbsoluteSize.Y
		},
		Top = {
			xminimumbound = p285.AbsolutePosition.X - 300,
			xmaximumbound = p285.AbsolutePosition.X,
			yvalue = p285.AbsolutePosition.Y - 100
		},
		Left = {
			yminimumbound = p285.AbsolutePosition.Y,
			ymaximumbound = p285.AbsolutePosition.Y + 500,
			xvalue = p285.AbsolutePosition.X - 100
		},
		Right = {
			yminimumbound = p285.AbsolutePosition.Y,
			ymaximumbound = p285.AbsolutePosition.Y + 500,
			xvalue = p285.AbsolutePosition.X + 300
		}
	}

	spawn(function()
		wait(0.1)

		local randomNumber = math.random(1, 4)
		local n1: number = 0
		local v728 = t23.Bottom

		for _, v in pairs(t23) do
			n1 += 1

			if randomNumber == n1 then
				v728 = v

				break
			end
		end

		u600 = module.Throw(p283, p284, p285, t22)

		if v728 == t23.Top or v728 == t23.Bottom then
			local v731 = u600
			local uDim2New = UDim2.new
			local randomNumber17 = math.random(v728.xminimumbound, v728.xmaximumbound)
			local v734 = uDim2New(0, randomNumber17, 0, v728.yvalue)

			v731:TweenPosition(v734, "Out", "Quad", 0.3 * p287, true)
		elseif v728 == t23.Left or v728 == t23.Right then
			local v735 = u600
			local uDim2 = UDim2.new(0, v728.xvalue, 0, math.random(v728.yminimumbound, v728.ymaximumbound))

			v735:TweenPosition(uDim2, "Out", "Quad", 0.3 * p287, true)
		end

		audioServicePlaySound(p290)
		module.Shake(p285, p285.Position, 0.2, 0.1)

		local newerCircle = module.NewerCircle
		local v738 = p288
		local n2 = p285.ZIndex + 100001
		local v740 = UDim2.fromOffset(p285.AbsoluteSize.X, p285.AbsoluteSize.X)
		local v741 = p285
		local uDim2 = UDim2.new(0, v741.AbsolutePosition.X, 0, v741.AbsolutePosition.Y)
		local uDim229 = UDim2.new(0, v741.AbsoluteSize.X * 0.5, 0, v741.AbsoluteSize.Y * 0.5)
		local v744 = newerCircle(p283, {
			BackgroundTransparency = 1,
			ImageTransparency = 0.25,
			Image = "rbxassetid://3916186365",
			ImageColor3 = v738,
			ZIndex = n2,
			Size = v740,
			Position = uDim2 + uDim229
		})

		module.ShakeSync(v744, v744.Position, 0.3 * p287, 0.2 * p287)

		local animationAnimateAsync = animation.AnimateAsync

		v741 = UDim2.fromOffset(v744.AbsoluteSize.Y * 2 * p287, v744.AbsoluteSize.Y * 2 * p287)
		animationAnimateAsync(v744, { Rotation = 360, Size = v741 }, 1 * p287, "Out", "Quint")
		animation.AnimateAsync(v744, { ImageTransparency = 1 }, 1 * p287, "Out", "Quint")
		module.waitX(0.3)
		animation.Animate(u600, { ImageTransparency = 1 }, 0.75 * p287, "Out", "Quint")
		v744:Destroy()
		u600:Destroy()
		task.wait(0.3)
	end)
end
function module.FlagSelf(p292, p293, _, _, p296, p297, p298, p299, p300, p301, p302, p303, p304, p305)
	local newerCircle = module.NewerCircle
	local v617 = UDim2.fromOffset(p293.AbsoluteSize.X * p297, p293.AbsoluteSize.X * p297)
	local uDim2 = UDim2.new(0, p293.AbsolutePosition.X, 0, p293.AbsolutePosition.Y)
	local uDim230 = UDim2.new(0, p293.AbsoluteSize.X * 0.5, 0, p293.AbsoluteSize.Y * 0.5)
	local v620 = newerCircle(p292, {
		BackgroundTransparency = 1,
		Image = p296,
		ImageTransparency = p303 or 0,
		Size = v617,
		Position = uDim2 + uDim230,
		ZIndex = p293.ZIndex + 10000
	})

	module.PreloadTech(p292, { p296 })

	local t24: {[any]: any} = {
		Time = p301 or 0.5,
		FlashTime = p302 or 0.2,
		Color = { p298, p299 },
		SizeMultiplier = p305 or 1,
		Transparency = p304 or 0.1
	}

	spawn(function()
		module.Pulse(p292, v620, t24)
	end)
	animation.AnimateAsync(v620, { ImageTransparency = p303 or 0 }, 0.25, "Out", "Quint")
	animation.AnimateAsync(v620, { Rotation = p300 }, 1, "Out", "Quint")
	spawn(function()
		wait(0.5)
		animation.Animate(v620, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		v620:Destroy()
	end)
end
function module.FlagEffect(p306, _, p308, _, p310, p311, p312, p313, p314, p315, p316, p317, p318, p319)
	local newerCircle = module.NewerCircle
	local v637 = UDim2.fromOffset(p308.AbsoluteSize.X * p311, p308.AbsoluteSize.X * p311)
	local uDim2 = UDim2.new(0, p308.AbsolutePosition.X, 0, p308.AbsolutePosition.Y)
	local uDim231 = UDim2.new(0, p308.AbsoluteSize.X * 0.5, 0, p308.AbsoluteSize.Y * 0.5)
	local v640 = newerCircle(p306, {
		BackgroundTransparency = 1,
		Image = p310,
		ImageTransparency = p317 or 0,
		Size = v637,
		Position = uDim2 + uDim231,
		ZIndex = p308.ZIndex + 10000
	})

	module.PreloadTech(p306, { p310 })

	local t25: {[any]: any} = {
		Time = p315 or 0.5,
		FlashTime = p316 or 0.2,
		Color = { p312, p313 },
		SizeMultiplier = p319 or 1,
		Transparency = p318 or 0.1
	}

	spawn(function()
		module.Pulse(p306, v640, t25)
	end)
	animation.AnimateAsync(v640, { ImageTransparency = p317 or 0 }, 0.25, "Out", "Quint")
	animation.AnimateAsync(v640, { Rotation = p314 }, 1, "Out", "Quint")
	spawn(function()
		wait(0.5)
		animation.Animate(v640, { ImageTransparency = 1 }, 0.5, "Out", "Linear")
		v640:Destroy()
	end)
end
function module.Vortex(p320, _, p322, _, p324, p325, p326, p327, _)
	module.PreloadTech(p320, p324)

	local newerCircle = module.NewerCircle
	local v652 = uDim2New(0, p322.AbsoluteSize.Y * 1.2 * p325, 0, p322.AbsoluteSize.Y * 1.2 * p325)
	local n1 = p322.ZIndex + 10000
	local uDim2 = UDim2.new(0, p322.AbsolutePosition.X, 0, p322.AbsolutePosition.Y)
	local uDim232 = UDim2.new(0, p322.AbsoluteSize.X * 0.5, 0, p322.AbsoluteSize.Y * 0.5)
	local v656 = newerCircle(p320, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Image = p324,
		ImageColor3 = p326,
		Size = v652,
		ZIndex = n1,
		Position = uDim2 + uDim232
	})

	animation.AnimateAsync(v656, { ImageTransparency = p327 }, 0.1 * p325, "Out", "Quad")
	animation.AnimateAsync(v656, { Rotation = 900 * p325 }, 1.8 * p325, "Out", "Linear")
	task.spawn(function()
		module.Shake(p322, p322.Position, 0.8 * p325, 0.22)
	end)
	task.wait(1.25 * p325)
	animation.AnimateAsync(v656, { ImageTransparency = 1 }, 0.1 * p325, "In", "Quad")
	task.delay(0.3 * p325, function()
		v656:Destroy()
	end)
	task.wait(0.75)
end

return module
