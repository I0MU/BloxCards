



local LocalPlayer = game.Players.LocalPlayer
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local replicatedFirst: ReplicatedFirst = game:GetService("ReplicatedFirst")

game:GetService("ContentProvider")

local tweenService: TweenService = game:GetService("TweenService")
local replicatedStorageCutscenes = replicatedStorage.Cutscenes
local audioService = require(replicatedStorage.AudioService)
local animation = require(replicatedStorage.Animation)
local modes = require(replicatedStorage.RogueStuff.Modes)
local network = require(replicatedFirst["Main Nieuw"].Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local transition = require(replicatedFirst["Main Nieuw"].Transition)
local effects = require(replicatedStorage.Effects)
local cardLibrary = require(replicatedStorage.CardLibrary)
local handy = require(replicatedFirst["Main Nieuw"].Handy)
local dsa2StoryMenu = require(replicatedFirst["Main Nieuw"].DSA2StoryMenu)
local networkClient = network.client
local creditsHandler = require(replicatedFirst["Main Nieuw"].CreditsHandler)
local visualNovel = LocalPlayer.PlayerGui:WaitForChild("VisualNovel"):WaitForChild("VisualNovel")
local dialogHolder = visualNovel:WaitForChild("DialogHolder")
local dialogText = dialogHolder:WaitForChild("DialogText")
local dialogTitle = dialogHolder:WaitForChild("DialogTitle")
local bounds = dialogText:WaitForChild("Bounds")

visualNovel:WaitForChild("Black")

local cardHolder = visualNovel:WaitForChild("CardHolder")
local visualNovelBackgrounds = replicatedStorage.RogueStuff.VisualNovelBackgrounds
local cgTemplate = replicatedStorage.RogueStuff.Templates.CGTemplate
local v27 = visualNovel.Parent.Effects
local u28 = false

local function GetWeightedRandom(p1)
	return (math.random() - 0.5) * p1
end
local function ClearDialogText()
	for _, v in pairs(dialogText:GetChildren()) do
		v.Text = ""
	end
end
local function ApplyValues(p2, p3)
	for k, v in pairs(p3) do
		p2[k] = v
	end
end
function NewerCircle(parent, p5)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = UDim2.fromScale(0, 0)
	imageLabel.Parent = parent

	for k, v in pairs(p5) do
		imageLabel[k] = v
	end

	return imageLabel
end

local t1: {[any]: any} = {}

local function PreloadTech(p6, p7: {[any]: any})
	if typeof(p7) == "string" then
		p7 = { p7 }
	end

	local t4: {[any]: any} = {}

	for _, v in ipairs(p7) do
		if not t1[v] then
			t1[v] = true

			local v60 = NewerCircle(p6, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Size = UDim2.new(0, 1, 0, 1),
				Position = UDim2.new(0.5, 0, -1, -36),
				Image = v
			})

			table.insert(t4, v60)
		end
	end

	task.spawn(function()
		task.wait(1)

		for _, v in ipairs(t4) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
local function PlurralfyText(p8)
	return (string.lower(p8))
end

local t2: {[any]: any} = { ["."] = 0.2, ["!"] = 0.4, ["?"] = 0.4 }
local v36 = Font.new("SourceSans", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
local v37 = Font.new("SourceSans", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
local v38 = Font.new("SourceSans", Enum.FontWeight.SemiBold, Enum.FontStyle.Italic)
local v39 = Font.new("Fantasy", Enum.FontWeight.Bold, Enum.FontStyle.Italic)

local function ShakeInOut(p45, p46, p47, p48)
	task.spawn(function()
		local magnitude = p45.AbsoluteSize.magnitude

		for _ = 1, p47 / 2 / 0.018 do
			local uDim2New = UDim2.new
			local scale = p46.X.Scale
			local offset = p46.X.Offset
			local n1 = magnitude * p48
			local randomNumber = math.random()
			local v265 = p46.Y.Scale
			local v266 = p46.Y.Offset
			local n2 = magnitude * p48
			local randomNumber2 = math.random()

			p45.Position = uDim2New(scale, offset + (randomNumber - 0.5) * n1, v265, v266 + (randomNumber2 - 0.5) * n2)
			p48 *= 1.1
			game:GetService("RunService").Stepped:Wait()
		end

		for _ = 1, p47 / 2 / 0.018 do
			local v270 = UDim2.new
			local v271 = p46.X.Scale
			local v272 = p46.X.Offset
			local n3 = magnitude * p48
			local randomNumber3 = math.random()
			local v275 = p46.Y.Scale
			local v276 = p46.Y.Offset
			local n4 = magnitude * p48
			local randomNumber4 = math.random()

			p45.Position = v270(v271, v272 + (randomNumber3 - 0.5) * n3, v275, v276 + (randomNumber4 - 0.5) * n4)
			p48 *= 0.9
			game:GetService("RunService").Stepped:Wait()
		end

		p45.Position = p46
	end)
end
local function waitForEvent(p58)
	local v67 = coroutine.running()

	p58:Once(function(...)
		if coroutine.status(v67) ~= "dead" then
			task.spawn(v67, ...)
		end
	end)
	coroutine.yield()
end

local module: {[any]: any} = {
	Effects = effects,
	EffectsHolder = v27,
	PreloadTech = PreloadTech,
	DisplayText = function(p9, p10, p11, p12)
		if p9 == "Fl00fy_Bonez" then
			p10 = string.lower(p10)
		end

		local parts = string.split(p10, " ")
		local s1: string = ""
		local t5: {[any]: any} = {}
		local n1: number = 1
		local u76: boolean = false

		visualNovel.DialogHolder.DialogTitle.Text = p9

		local connection = dialogHolder.MouseButton1Click:Connect(function()
			u76 = true
		end)

		for _, v in pairs(dialogText:GetChildren()) do
			v.Text = ""
		end

		local function NewLine(p13)
			table.insert(t5, s1)

			if p13 then
				s1 = p13 .. " "
			end

			n1 += 1
		end

		for _, v in pairs(parts) do
			local s2: string = s1

			bounds.Text = s2 .. v

			if bounds.TextBounds.X > dialogText["1"].AbsoluteSize.X then
				table.insert(t5, s1)

				if v then
					s1 = v .. " "
				end

				n1 += 1
			else
				s1 = bounds.Text .. " "
			end
		end

		table.insert(t5, s1)
		n1 += 1
		n1 = 1
		NewLine = 1

		for k, v in pairs(t5) do
			if u76 then
				break
			end

			local n2: number = 1
			local text: string = tostring(n1)
			local v88 = dialogText[text]
			local u89: boolean = false
			local n3: number = 1

			v88.Text = v

			for iterFirst, iterSecond in utf8.graphemes(v) do
				if u76 then
					break
				end

				local substring = v88.ContentText:sub(iterFirst, iterSecond)

				n2 += 1
				NewLine += 1
				v88.MaxVisibleGraphemes = n2

				if NewLine % 2 == 0 and n2 < v88.ContentText:len() / 1 and not t2[substring] then
					audioService.PlaySound(p11 or "clickfast.wav", { PlaybackSpeed = n3 })
				end

				if v88.ContentText:sub(iterFirst + 9, iterSecond + 9) == "?" or u89 then
					u89 = true
					n3 += 0.02
				end

				if v88.ContentText:sub(iterFirst, iterSecond) == "?" then
					u89 = false
					n3 = 1
				end

				task.wait(t2[substring] or p12 or 0.016)
			end

			if k ~= #t5 then
				if u76 then
					break
				end

				if n1 >= 3 then
					for _, iterValue in pairs(dialogText:GetChildren()) do
						iterValue.Text = ""
					end

					dialogText["1"].Text = t5[k - 1]
					dialogText["1"].MaxVisibleGraphemes = -1
					dialogText["2"].Text = t5[k]
					dialogText["2"].MaxVisibleGraphemes = -1
				else
					n1 += 1
				end
			end
		end

		connection:Disconnect()

		if #t5 > 3 then
			for i = 1, 3 do
				local text2: string = tostring(i)

				dialogText[text2].Text = t5[#t5 - (i - 3) * -1]

				local text3: string = tostring(i)

				dialogText[text3].MaxVisibleGraphemes = -1
			end
		else
			for k, _ in pairs(t5) do
				local text4: string = tostring(k)

				dialogText[text4].Text = t5[k]

				local text5: string = tostring(k)

				dialogText[text5].MaxVisibleGraphemes = -1
			end
		end

		dialogHolder.MouseButton1Click:Wait()
	end,
	ChangeTextItalics = function(p14)
		local v104 = p14 and v37 or v36
		local text: string = tostring(1)

		dialogText[text].FontFace = v104

		local text6: string = tostring(2)

		dialogText[text6].FontFace = v104

		local text7: string = tostring(3)

		dialogText[text7].FontFace = v104
	end,
	ChangeTextBold = function(p15)
		local v109 = p15 and v38 or v36
		local text: string = tostring(1)

		dialogText[text].FontFace = v109

		local text8: string = tostring(2)

		dialogText[text8].FontFace = v109

		local text9: string = tostring(3)

		dialogText[text9].FontFace = v109
	end,
	ChangeTextChairman = function(p16)
		local v114 = p16 and v39 or v36
		local text: string = tostring(1)

		dialogText[text].FontFace = v114

		local text10: string = tostring(2)

		dialogText[text10].FontFace = v114

		local text11: string = tostring(3)

		dialogText[text11].FontFace = v114
	end,
	ChangeTextOverseer = function(p17)
		if p17 == true then
			dialogTitle.TextColor3 = Color3.fromRGB(182, 65, 255)
		else
			dialogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		for i = 1, 3 do
			if p17 == true then
				local text: string = tostring(i)

				dialogText[text].TextColor3 = Color3.fromRGB(182, 65, 255)
			else
				local text: string = tostring(i)

				dialogText[text].TextColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
	end,
	ChangeTextTranscendent = function(p18)
		if p18 == true then
			dialogTitle.TextStrokeColor3 = Color3.fromRGB(149, 0, 255)
			dialogTitle.TextColor3 = Color3.fromRGB(15, 14, 20)
			dialogTitle.TextStrokeTransparency = 0
		else
			dialogTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			dialogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			dialogTitle.TextStrokeTransparency = 1
		end

		for i = 1, 3 do
			if p18 == true then
				local text: string = tostring(i)

				dialogText[text].TextColor3 = Color3.fromRGB(15, 14, 20)

				local text12: string = tostring(i)

				dialogText[text12].TextStrokeColor3 = Color3.fromRGB(149, 0, 255)

				local text13: string = tostring(i)

				dialogText[text13].TextStrokeTransparency = 0
			else
				local text: string = tostring(i)

				dialogText[text].TextColor3 = Color3.fromRGB(255, 255, 255)

				local text14: string = tostring(i)

				dialogText[text14].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

				local text15: string = tostring(i)

				dialogText[text15].TextStrokeTransparency = 1
			end
		end
	end,
	ChangeTextColor = function(textColor3)
		if textColor3 then
			dialogTitle.TextColor3 = textColor3
		else
			dialogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		for i = 1, 3 do
			if textColor3 then
				local text: string = tostring(i)

				dialogText[text].TextColor3 = textColor3
			else
				local text: string = tostring(i)

				dialogText[text].TextColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
	end,
	CreateActor = function(p20, p21, p22)
		local imageLabel: ImageLabel = Instance.new("ImageLabel")

		imageLabel.Parent = visualNovel.Actors
		imageLabel.ZIndex = dialogHolder.ZIndex - 2
		imageLabel.Image = p20[1]
		imageLabel.AnchorPoint = Vector2.new(0.5, 1)
		imageLabel.Size = UDim2.fromScale(0.6, 0.6)
		imageLabel.Position = UDim2.fromScale(p21 or -0.1, 0.7)
		imageLabel.ImageRectSize = Vector2.new(512, 512)
		imageLabel.BackgroundTransparency = 1

		local uiAspectRatioConstraint: UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		uiAspectRatioConstraint.Parent = imageLabel
		uiAspectRatioConstraint.AspectRatio = p22 or 1
		uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height

		local intValue: IntValue = Instance.new("IntValue")

		intValue.Parent = imageLabel
		PreloadTech(visualNovel.Actors, p20)
		intValue.Changed:Connect(function()
			local intValueValue = intValue.Value
			local floored = math.floor((intValueValue - 1) / 4)
			local n1 = (intValueValue - 1) % 4 + 1

			imageLabel.Image = p20[floored + 1]
			imageLabel.ImageRectSize = Vector2.new(512, 512)

			if n1 == 1 then
				imageLabel.ImageRectOffset = Vector2.new(0, 0)
			elseif n1 == 2 then
				imageLabel.ImageRectOffset = Vector2.new(512, 0)
			elseif n1 == 3 then
				imageLabel.ImageRectOffset = Vector2.new(0, 512)
			elseif n1 == 4 then
				imageLabel.ImageRectOffset = Vector2.new(512, 512)
			end
		end)

		return imageLabel
	end,
	MoveActor = function(p23, p24, p25, p26, p27)
		local animationAnimateAsync = animation.AnimateAsync
		local v146 = UDim2.fromScale(p24, 0.7)

		animationAnimateAsync(p23, { Position = v146 }, p25 or 0.5, p26 or "Out", p27 or "Quart")
	end,
	SwayActor = function(p28, p29, p30, p31, p32, p33)
		local v153 = p31 or 0.4
		local scale = p28.Position.X.Scale

		for _ = 1, p30 or 1 do
			local animationAnimateAsync = animation.AnimateAsync
			local v157 = UDim2.fromScale(scale + p29, p28.Position.Y.Scale)

			animationAnimateAsync(p28, { Position = v157 }, v153, p32 or "Out", p33 or "Quart")
			wait(v153)

			local animateAsync = animation.AnimateAsync

			v157 = UDim2.fromScale(scale - p29, p28.Position.Y.Scale)
			animateAsync(p28, { Position = v157 }, v153, p32 or "Out", p33 or "Quart")
			wait(v153)
		end

		local v159 = animation.AnimateAsync
		local v160 = UDim2.fromScale(scale, p28.Position.Y.Scale)

		v159(p28, { Position = v160 }, v153, p32 or "Out", p33 or "Quart")
		wait(v153)
	end,
	AdjustActorData = function(p34, p35, p36, p37, p38)
		animation.AnimateAsync(p34, p35, p36 or 0.5, p37 or "Out", p38 or "Quart")
	end,
	SetActorImage = function(p39, value)
		p39.Value.Value = value
	end,
	ShakeActor = function(p41, p42, p43, p44)
		task.spawn(function()
			local magnitude = p41.AbsoluteSize.magnitude

			for _ = 1, p43 / 0.018 do
				local uDim2New = UDim2.new
				local scale = p42.X.Scale
				local offset = p42.X.Offset
				local n1 = magnitude * p44
				local randomNumber = math.random()
				local v290 = p42.Y.Scale
				local v291 = p42.Y.Offset
				local n2 = magnitude * p44
				local randomNumber5 = math.random()

				p41.Position = uDim2New(scale, offset + (randomNumber - 0.5) * n1, v290, v291 + (randomNumber5 - 0.5) * n2)
				p44 *= 0.9
				game:GetService("RunService").Stepped:Wait()
			end

			p41.Position = p42
		end)
	end,
	ShakeVNInOut = function(p49, p50)
		local visualNovelDialogHolder = visualNovel.DialogHolder
		local DialogHolderPosition = visualNovel.DialogHolder.Position
		local u176 = p50

		task.spawn(function()
			local magnitude = visualNovelDialogHolder.AbsoluteSize.magnitude

			for _ = 1, p49 / 2 / 0.018 do
				local uDim2New = UDim2.new
				local scale = DialogHolderPosition.X.Scale
				local offset = DialogHolderPosition.X.Offset
				local n1 = magnitude * u176
				local randomNumber = math.random()
				local v301 = DialogHolderPosition.Y.Scale
				local v302 = DialogHolderPosition.Y.Offset
				local n2 = magnitude * u176
				local randomNumber6 = math.random()

				visualNovelDialogHolder.Position = uDim2New(scale, offset + (randomNumber - 0.5) * n1, v301, v302 + (randomNumber6 - 0.5) * n2)
				u176 *= 1.1
				game:GetService("RunService").Stepped:Wait()
			end

			for _ = 1, p49 / 2 / 0.018 do
				local v306 = UDim2.new
				local v307 = DialogHolderPosition.X.Scale
				local v308 = DialogHolderPosition.X.Offset
				local n3 = magnitude * u176
				local randomNumber7 = math.random()
				local v311 = DialogHolderPosition.Y.Scale
				local v312 = DialogHolderPosition.Y.Offset
				local n4 = magnitude * u176
				local randomNumber8 = math.random()

				visualNovelDialogHolder.Position = v306(v307, v308 + (randomNumber7 - 0.5) * n3, v311, v312 + (randomNumber8 - 0.5) * n4)
				u176 *= 0.9
				game:GetService("RunService").Stepped:Wait()
			end

			visualNovelDialogHolder.Position = DialogHolderPosition
		end)
	end,
	ShakeActorInOut = function(p51, p52, p53)
		local v180 = p51.Position
		local u181 = p53

		task.spawn(function()
			local magnitude = p51.AbsoluteSize.magnitude

			for _ = 1, p52 / 2 / 0.018 do
				local uDim2New = UDim2.new
				local scale = v180.X.Scale
				local offset = v180.X.Offset
				local n1 = magnitude * u181
				local randomNumber = math.random()
				local v322 = v180.Y.Scale
				local v323 = v180.Y.Offset
				local n2 = magnitude * u181
				local randomNumber9 = math.random()

				p51.Position = uDim2New(scale, offset + (randomNumber - 0.5) * n1, v322, v323 + (randomNumber9 - 0.5) * n2)
				u181 *= 1.1
				game:GetService("RunService").Stepped:Wait()
			end

			for _ = 1, p52 / 2 / 0.018 do
				local v327 = UDim2.new
				local v328 = v180.X.Scale
				local v329 = v180.X.Offset
				local n3 = magnitude * u181
				local randomNumber10 = math.random()
				local v332 = v180.Y.Scale
				local v333 = v180.Y.Offset
				local n4 = magnitude * u181
				local randomNumber11 = math.random()

				p51.Position = v327(v328, v329 + (randomNumber10 - 0.5) * n3, v332, v333 + (randomNumber11 - 0.5) * n4)
				u181 *= 0.9
				game:GetService("RunService").Stepped:Wait()
			end

			p51.Position = v180
		end)
	end,
	PlaySound = audioService.PlaySound,
	StopSound = audioService.StopSound,
	FlipActor = function(p54, p55)
		p54.ImageRectOffset = Vector2.new(p54.ImageRectOffset.X + 512, p54.ImageRectOffset.Y)
		p54.ImageRectSize = Vector2.new(-512, 512)

		if not p55 then
			return
		end

		if p55 == "Left" then
			p54.Position = UDim2.fromScale(p54.Position.X.Scale - 0.055, p54.Position.Y.Scale)

			return
		end

		p54.Position = UDim2.fromScale(p54.Position.X.Scale + 0.055, p54.Position.Y.Scale)
	end,
	UnFlipActor = function(p56, p57)
		p56.ImageRectOffset = Vector2.new(p56.ImageRectOffset.X - 512, p56.ImageRectOffset.Y)
		p56.ImageRectSize = Vector2.new(512, 512)

		if not p57 then
			return
		end

		if p57 == "Left" then
			p56.Position = UDim2.fromScale(p56.Position.X.Scale - 0.055, p56.Position.Y.Scale)

			return
		end

		p56.Position = UDim2.fromScale(p56.Position.X.Scale + 0.055, p56.Position.Y.Scale)
	end,
	ChangeSong = function(p59, p60)
		audioService.ChangeSong(p59, p60)
	end,
	Emote = function(parent, p62, list)
		local imageLabel: ImageLabel = Instance.new("ImageLabel")

		imageLabel.Parent = parent
		imageLabel.ZIndex = parent.ZIndex + 1
		imageLabel.AnchorPoint = Vector2.new(0.5, 1)

		if p62 == "Surprised" or p62 == "Confused" or p62 == "Angry" then
			imageLabel.Size = UDim2.fromScale(0.3, 0.1)
		elseif p62 == "Happy" then
			imageLabel.Size = UDim2.fromScale(0.2, 0.2)
		else
			imageLabel.Size = UDim2.fromScale(0.3, 0.3)
		end

		if list then
			imageLabel.Position = UDim2.fromScale(0.85 + list[1], 0.5 + list[2])
		else
			imageLabel.Position = UDim2.fromScale(0.85, 0.5)
		end

		local tweenInfo = TweenInfo.new(0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0)
		local v193 = UDim2.fromScale(imageLabel.Size.X.Scale, imageLabel.Size.Y.Scale + 0.2)
		local tweenInfo2 = TweenInfo.new(0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0)
		local v195 = UDim2.fromScale(imageLabel.Size.X.Scale, imageLabel.Size.Y.Scale + 0.2)
		local tweenInfo3 = TweenInfo.new(0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0)
		local v197 = UDim2.fromScale(imageLabel.Position.X.Scale + 0.05, imageLabel.Position.Y.Scale + 0.03)
		local v198 = UDim2.fromScale(imageLabel.Size.X.Scale, imageLabel.Size.Y.Scale + 0.2)
		local tweenInfo4 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0)
		local v200 = UDim2.fromScale(imageLabel.Position.X.Scale, imageLabel.Position.Y.Scale + 0.1)
		local tweenInfo5 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0)
		local v202 = UDim2.fromScale(imageLabel.Position.X.Scale + 0.05, imageLabel.Position.Y.Scale + 0.03)
		local t6: {[any]: any} = {
			Surprised = {
				Image = "rbxassetid://104090545648110",
				Rotation = 15,
				TweenInfo = tweenInfo,
				TweenDetails = { Size = v193 },
				Sound = "Ding"
			},
			Confused = {
				Image = "rbxassetid://108785736392276",
				Rotation = 15,
				TweenInfo = tweenInfo2,
				TweenDetails = { Size = v195 },
				Sound = "QuestionDing"
			},
			Angry = {
				Image = "rbxassetid://99790631105505",
				Rotation = 15,
				TweenInfo = tweenInfo3,
				TweenDetails = { Position = v197, Size = v198 },
				Sound = "SwingWoosh"
			},
			Sad = {
				Image = "rbxassetid://136500531750534",
				Rotation = 0,
				TweenInfo = tweenInfo4,
				TweenDetails = { Position = v200 },
				Sound = "SadDrop"
			},
			Happy = {
				Image = "rbxassetid://89021680003625",
				Rotation = 0,
				TweenInfo = tweenInfo5,
				TweenDetails = { Rotation = 180, Position = v202 },
				Sound = "StarDing"
			}
		}

		imageLabel.Image = t6[p62].Image
		imageLabel.BackgroundTransparency = 1
		imageLabel.Rotation = t6[p62].Rotation or 0

		local v204: Tween = tweenService:Create(imageLabel, t6[p62].TweenInfo, t6[p62].TweenDetails)

		v204:Play()

		if t6[p62].Sound then
			audioService.PlaySound(t6[p62].Sound)
		end

		local completed = v204.Completed
		local v206 = coroutine.running()

		completed:Once(function(...)
			if coroutine.status(v206) ~= "dead" then
				task.spawn(v206, ...)
			end
		end)
		coroutine.yield()
		task.wait(1)
		imageLabel:Destroy()
	end
}

function module.SetBackground(p64)
	if not p64 then
		for _, v in pairs(visualNovel.Background:GetChildren()) do
			v:Destroy()
		end

		return
	end

	local foundChild = visualNovelBackgrounds:FindFirstChild(p64)

	if foundChild then
		for _, v in pairs(visualNovel.Background:GetChildren()) do
			v:Destroy()
		end

		local clone = foundChild:Clone()

		clone.Parent = visualNovel.Background
		clone.Visible = true
		module.Background = clone
	end
end
function module.ShowCGScene(p65, p66, p67)
	if not p65 then
		transition.ToggleBlack(1, 0.3)

		for _, v in pairs(visualNovel.CG:GetChildren()) do
			v:Destroy()
		end

		task.wait(0.5)
		transition.ToggleBlack(-1, 0.3)

		return
	end

	if not p66 then
		transition.ToggleBlack(1, 0.3)
	end

	local clone = cgTemplate:Clone()

	clone.Parent = visualNovel.CG
	clone.Image = "rbxassetid://" .. tostring(p65)
	clone.ZIndex = dialogHolder.ZIndex - 1
	clone.Visible = true
	module.ActiveCG = clone

	if p66 then
		clone.ImageTransparency = 1

		local tweenInfo = TweenInfo.new(p67 or 3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)

		tweenService:Create(clone, tweenInfo, { ImageTransparency = 0 }):Play()
	end

	if not p66 then
		task.wait(0.5)
		transition.ToggleBlack(-1, 0.3)
	end
end
function module.HideDialogHolder(p68)
	if p68 == true then
		dialogHolder.BackgroundTransparency = 1
		dialogHolder.UIStroke.Thickness = 0
		dialogHolder.Frame.UIStroke.Thickness = 0

		return
	end

	dialogHolder.BackgroundTransparency = 0
	dialogHolder.UIStroke.Thickness = 1
	dialogHolder.Frame.UIStroke.Thickness = 1
end
function module.Start(p69)
	local v223 = networkInvokeServer("GetQuestInfo")

	u28 = v223[1] and v223[1]["ViewedVN_" .. tostring(p69)] and v223[1]["ViewedVN_" .. tostring(p69)] ~= 1
	network.FireServer("StartSubPlayerCutscene", p69)
	network.FireServer("SetViewedVN", p69)
	network.FireServer("EnterVNScene")
	v223 = require(replicatedStorageCutscenes[p69])

	local foundChild = visualNovelBackgrounds:FindFirstChild(p69)

	if foundChild then
		local clone = foundChild:Clone()

		clone.Parent = visualNovel.Background
		clone.Visible = true
		module.Background = clone
	end

	dialogTitle.Text = ""

	for _, v in pairs(dialogText:GetChildren()) do
		v.Text = ""
	end

	visualNovel.Parent.Enabled = true
	visualNovel.Visible = true
	transition.ToggleBlack(-1, 0.6)
	v223.Play()
end
function module.EndCutscene(list)
	transition.ToggleBlack(1, 0.3)
	visualNovel.Parent.Enabled = false
	visualNovel.Visible = false
	visualNovel.Black.BackgroundTransparency = 1
	visualNovel.White.BackgroundTransparency = 1

	for _, v in pairs(visualNovel.Actors:GetChildren()) do
		v:Destroy()
	end

	if module.Background then
		module.Background:Destroy()
	end

	network.FireServer("LeaveVNScene")

	local v231 = if not networkClient.IsSubPlayer() then game.Players:FindFirstChild(LocalPlayer[LocalPlayer.Name]:FindFirstChild("SubPlayer").Value) else networkInvokeServer("GetPartyLeaderFromSub", LocalPlayer.Name)

	if v231 and v231[v231.Name].Value == "Watching" then
		transition.ToggleBlackPartyWaiter(true)

		repeat
			task.wait(0.1)
		until not game.Players:FindFirstChild(v231.Name) or v231[v231.Name].Value ~= "Watching"

		transition.ToggleBlackPartyWaiter(false)
	end

	if list then
		if list[1] == "StartBattle" and not networkClient.IsSubPlayer() then
			transition.HideBattleBack()

			local name = list[2]
			local text: string = tostring(LocalPlayer.userId)

			network.FireServer("RequestBattle", {
				Parent = true,
				QuickIntro = true,
				Name = name,
				userId = -999999 - text,
				Duelist = list[3]
			})
		elseif list == "ReturnToWorld" or networkClient.IsSubPlayer() and list[1] ~= "StartBattle" then
			audioService.ChangeSong("Lobby")
			transition.HideBattleBack()
			transition.ToggleBlack(-1, 0.3)
			handy.Show()
		elseif list == "OpenDSA2StoryMenu" then
			dsa2StoryMenu.OpenDSA2StoryMenu()
		elseif list[1] == "FirstViewEvent" then
			if u28 == true then
				if list[2][1] == "StartBattle" and not networkClient.IsSubPlayer() then
					transition.HideBattleBack()

					local v234 = list[2][2]
					local text: string = tostring(LocalPlayer.userId)

					network.FireServer("RequestBattle", {
						Parent = true,
						QuickIntro = true,
						Name = v234,
						userId = -999999 - text,
						Duelist = list[2][3]
					})

					return
				end

				if list[2][1] == "ShowVNScene" then
					module.Start(list[2][2])

					return
				end

				if list[2] == "PlayDSCredits" then
					creditsHandler.PlayCredits()

					return
				end
			elseif list[3] == "OpenDSA2StoryMenu" then
				dsa2StoryMenu.OpenDSA2StoryMenu()
			end

			return
		end

		return
	end
end
function module.DisplayOptions(p71, p72)
	dialogTitle.Text = ""

	local text: string = tostring(1)

	dialogText[text].Text = ""

	local text16: string = tostring(2)

	dialogText[text16].Text = ""

	local text17: string = tostring(3)

	dialogText[text17].Text = ""

	for _, v in pairs(dialogHolder.DialogOptions:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	dialogHolder.DialogOptionText.Text = p71
	dialogHolder.DialogOptionText.Visible = true

	local bindableEvent: BindableEvent = Instance.new("BindableEvent")
	local u244 = nil

	for k, v in pairs(p72) do
		local clone = dialogHolder.TemplateButton:Clone()

		clone.Parent = dialogHolder.DialogOptions
		clone.TextLabel.Text = v
		clone.Visible = true
		clone.LayoutOrder = k
		clone.MouseButton1Click:Connect(function()
			u244 = k
			bindableEvent:Fire()
			dialogHolder.DialogOptions.Visible = false
			dialogHolder.DialogOptionText.Visible = false
			bindableEvent:Destroy()
		end)
	end

	dialogHolder.DialogOptions.Visible = true
	bindableEvent.Event:Wait()

	return u244
end
function module.SetMainCharacterData(currentMode, p74)
	module.MainCharacterData = modes[currentMode].Characters[p74].VNData
	module.CurrentMode = currentMode
end

module.SetMainCharacterData("City Trek", "McKayla")

function module.EnableBattleBackground()
	transition.ShowBattleBack()
end
function module.SetBattleBackground(p75)
	transition.ShowBattleBack()
	transition.ChangeBattleBackground(p75)
end
function module.DisplayMCText(p76)
	module.DisplayText(module.MainCharacterData.Name, p76, module.MainCharacterData.Sound)
end
function module.AskForServerEvent(p77)
	return networkInvokeServer("RunServerEvent", module.CurrentMode, p77)
end
function module.FadeBlack(p78)
	animation.Animate(visualNovel.Black, { BackgroundTransparency = p78 }, 0.5, "Out", "Quart")
end
function module.FadeWhite(p79)
	animation.Animate(visualNovel.White, { BackgroundTransparency = p79 }, 0.5, "Out", "Quart")
end
function module.ShowCard(p80)
	cardHolder.Frame.Card.Image = "rbxassetid://" .. cardLibrary[p80].Id
	cardHolder.Black.BackgroundTransparency = 1
	cardHolder.Visible = true
	animation.AnimateAsync(cardHolder.Black, { BackgroundTransparency = 0.35 }, 0.5, "Out", "Quart")
end
function module.HideCard()
	animation.Animate(cardHolder.Black, { BackgroundTransparency = 1 }, 0.3, "Out", "Quart")
	cardHolder.Visible = false
end
function module.DimSongs()
	audioService.DimSongs()
end
function module.UndimSongs()
	audioService.UndimSongs()
end

return module
