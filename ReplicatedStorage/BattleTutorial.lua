



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local tweenService: TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local battleTutorial = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("BattleTutorial")
local tutorialDialogFrame = battleTutorial:WaitForChild("TutorialDialogFrame")
local textHolder = tutorialDialogFrame:WaitForChild("Backdrop"):WaitForChild("TextHolder")
local lineTemplate = battleTutorial:WaitForChild("Templates"):WaitForChild("LineTemplate")
local v8 = battleTutorial:WaitForChild("Continue")
local u9: boolean = game:GetService("UserInputService").TouchEnabled == true
local animation = require(replicatedStorage.Animation)
local audioService = require(replicatedStorage.AudioService)

require(replicatedStorage.Promise)

local typewriter = require(replicatedStorage.Typewriter)
local arrow = tutorialDialogFrame.Backdrop.Arrow
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v15 = UDim2.fromScale(0.98, 0.85)
local v16: Tween = tweenService:Create(arrow, tweenInfo, { Position = v15 })

local function DestroyAllGuiObjectChildren(p1)
	for _, v in pairs(p1:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end
end
local function FormatText(p2)
	for k, v in pairs({
		["%playername"] = LocalPlayer.Name,
		["%clickortap"] = function()
			if u9 then
				return "tap"
			end

			return "click"
		end
	}) do
		p2 = if typeof(v) == "function" then p2:gsub("%" .. k, v() or " ") else p2:gsub("%" .. k, v)
	end

	return p2
end
local function Spritesheet(parent, p4, list)
	parent.ImageRectSize = p4 or Vector2.new(341.3, 341.3)

	local v36 = list and list[1] or 3
	local v37 = list and list[2]

	if parent:FindFirstChild("FrameCount") then
		parent.FrameCount:Destroy()
	end

	local frameCount: IntValue = Instance.new("IntValue")

	frameCount.Name = "FrameCount"
	frameCount.Parent = parent
	frameCount.Value = 0
	frameCount.Changed:Connect(function()
		local n1 = frameCount.Value - 1
		local vector2New = Vector2.new
		local n2 = n1 % v36 * parent.ImageRectSize.X
		local floored = math.floor(n1 / v36)

		parent.ImageRectOffset = vector2New(n2, floored * parent.ImageRectSize.Y)
	end)

	local frameCountValue = frameCount.Value
	local vector2New = Vector2.new
	local n1 = frameCountValue % v36 * parent.ImageRectSize.X
	local floored = math.floor(frameCountValue / v36)

	parent.ImageRectOffset = vector2New(n1, floored * parent.ImageRectSize.Y)
end

local module: {[any]: any} = {
	SetSpritesheet = function(p6, p7)
		tutorialDialogFrame.Face.ImageLabel.Image = p6

		local imageLabel = tutorialDialogFrame.Face.ImageLabel
		local vector2 = Vector2.new(1024 / p7, 1024 / p7)

		Spritesheet(imageLabel, vector2, { p7, p7 })
	end,
	SetFace = function(value)
		tutorialDialogFrame.Face.ImageLabel.FrameCount.Value = value
	end,
	SetVisible = function(p10)
		if p10 and not require(replicatedStorage.CONFIG).TUTOR_LADY_ENABLED then
			return
		end

		if not p10 then
			battleTutorial.Enabled = false
			v16:Cancel()

			return
		end

		tutorialDialogFrame.Position = UDim2.fromScale(0.025, -0.5)

		local animationAnimateAsync = animation.AnimateAsync
		local v50 = UDim2.fromScale(0.025, 0.025)

		animationAnimateAsync(tutorialDialogFrame, { Position = v50 }, 1, "Out", "Quart")
		v16:Play()
		battleTutorial.Enabled = true
	end,
	FlipPosition = function(p11)
		if not p11 then
			local animationAnimateAsync = animation.AnimateAsync
			local v53 = UDim2.fromScale(0.025, 0.025)

			animationAnimateAsync(tutorialDialogFrame, { Position = v53 }, 1, "Out", "Quart")

			return
		end

		local animateAsync = animation.AnimateAsync
		local v55 = UDim2.fromScale(0.475, 0.025)

		animateAsync(tutorialDialogFrame, { Position = v55 }, 1, "Out", "Quart")
	end
}

local function StartArrowThingy()
	v16:Play()
end
local function StopArrowThingy()
	v16:Cancel()
end
local function SetArrowThingy(p9)
	tutorialDialogFrame.Backdrop.Arrow.Visible = p9
end

local u24: boolean = false

local function StripRichText(p12)
	return p12:gsub("<.->", "")
end

local t2: {[any]: any} = {
	Studs = "<b>Studs</b>",
	Stud = "<b>Stud</b>",
	Colourless = "<i>Colourless</i>",
	Red = "<font color=\"rgb(255,0,0)\"><b>Red</b></font>",
	Field = "<b>Field</b>",
	Baseplate = "<b>Baseplate</b>",
	Cost = "<b>Cost</b>",
	cost = "<i>cost</i>",
	status = "<i>status</i>",
	Health = "<font color=\"rgb(10,255,60)\">Health</font>",
	Power = "<font color=\"rgb(255,150,60)\">Power</font>",
	Effect = "<b>Effect</b>",
	Locked = "<b>Locked</b>",
	["END TURN"] = "<b>END TURN</b>",
	draw = "<i>draw</i>",
	combat = "<b><i>combat</i></b>",
	["coloured stud"] = "<b><i>coloured stud</i></b>",
	Coloured = "<b><i>Coloured</i></b>",
	["coloured card"] = "<b><i>coloured card</i></b>",
	Action = "<b>Action</b>",
	Actions = "<b>Actions</b>",
	target = "<b>target</b>",
	targeting = "<b>targeting</b>",
	["right click"] = "<b>Right-Click</b>",
	Select = "<b>Select</b>",
	select = "<b>select</b>",
	attack = "<b>attack</b>",
	hand = "<b><i>hand</i></b>",
	attacking = "<b>attacking</b>",
	["RAT Assault Unit"] = "<i>RAT Assault Unit</i>",
	["Lord Crimsonwrath"] = "<i>Lord Crimsonwrath</i>",
	["Armored Patrol Tank"] = "<i>Armored Patrol Tank</i>",
	Programmer = "<i>Programmer</i>",
	["Blox Cards"] = "<b><i>Blox Cards</i></b>",
	auie = "<font color=\"rgb(255,100,100)\"><b>auie!!</b></font>",
	owchie = "<font color=\"rgb(255,150,50)\"><b>owchie!!</b></font>",
	Read = "<b>Read</b>",
	Please = "<b>Please</b>",
	OK = "<b>OK!!</b>",
	Sweet = "<b>Sweet!!</b>",
	Nice = "<b>Nice!!</b>",
	neat = "<b>Awesome!!</b>",
	["Good job"] = "<b>Good job!</b>",
	["My turn"] = "<b>My turn!!</b>",
	Hey = "<b>Hey!!</b>",
	["Okay, your turn."] = "<b><i>Okay, your turn.</i></b>",
	Deck = "<b>Deck</b>",
	deck = "<b>deck</b>",
	["40 cards"] = "<i><b>40 cards</b></i>",
	["Current deck"] = "<b>Current deck</b>",
	Inventory = "<b>Inventory</b>",
	Starter = "<b>Starter</b>",
	Starters = "<b>Starters</b>",
	Hand = "<b>Hand</b>",
	["Search bar"] = "<b>Search bar</b>",
	Filters = "<b>Filters</b>",
	["🌱"] = "<b>🌱</b>",
	["Deck size"] = "<b>Deck size</b>",
	drawing = "<b>drawing</b>",
	Shop = "<b>Shop</b>",
	["card shop"] = "<i><b>card shop</b></i>",
	["Packs Shop"] = "<b>Packs Shop</b>",
	["Card Pack"] = "<b>Card Packs</b>",
	["Deck Shop"] = "<b>Deck Shop</b>",
	["Event Shop"] = "<b>Event Shop</b>",
	Accessories = "<b>Accessories</b>",
	Backgrounds = "<b>Backgrounds</b>",
	["Save & Exit"] = "<b>Save & Exit</b>",
	Gamepass = "<b>Gamepass</b>",
	["Art Box"] = "<b>Art Box</b>",
	Codes = "<b>Codes</b>",
	T9 = "<b>R$</b>",
	Robux = "<i><b>Robux</b></i>",
	codes = "<i><b>codes</b></i>",
	BloxBux = "<b>BloxBux</b>",
	bloxBux = "<b>bloxBux</b>",
	Rewards = "<b>Rewards</b>",
	Sets = "<b>Sets</b>",
	Crossovers = "<b>Crossovers</b>",
	["Metaverse Series"] = "<i><b>Metaverse Series</b></i>",
	Offer = "<b>Offer</b>",
	Offers = "<b>Offers</b>"
}

function module.ShowText(p13, p14)
	if not require(replicatedStorage.CONFIG).TUTOR_LADY_ENABLED then
		return
	end

	u24 = true
	tutorialDialogFrame.Backdrop.Arrow.Visible = false
	task.wait()
	DestroyAllGuiObjectChildren(textHolder)
	task.wait()

	if not p14 then
		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(60, 61, 83)

		animationAnimateAsync(tutorialDialogFrame, { BackgroundColor3 = color3 }, 0.5, "Out", "Quart")
	else
		local animateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(127, 195, 164)

		animateAsync(tutorialDialogFrame, { BackgroundColor3 = color3 }, 0.5, "Out", "Quart")
	end

	animation.AnimateAsync(tutorialDialogFrame.UICorner, { CornerRadius = UDim.new(0.1, 0) }, 0.5, "Out", "Quart")

	if typeof(p13) == "table" then
		local s1 = ""

		for k, v in pairs(p13) do
			s1 = if k == 1 then v else s1 .. " " .. v
		end

		p13 = s1
	end

	local function SortKeywordsByLength(p15)
		local t5: {[any]: any} = {}

		for k, _ in pairs(p15) do
			table.insert(t5, k)
		end

		table.sort(t5, function(p16, p17)
			return #p16 > #p17
		end)

		return t5
	end

	local v68 = (function(p18)
		local v94 = SortKeywordsByLength(t2)

		for _, v in ipairs(v94) do
			p18 = p18:gsub("(%f[%w])(" .. v .. ")(%f[%W])", "%1" .. t2[v] .. "%3")
		end

		return p18
	end)((FormatText(p13)))

	local t3: {[any]: any} = {}
	local t4: {[any]: any} = {}

	for iterValue in string.gmatch(v68, "%S+%s*") do
		table.insert(t4, iterValue)
	end

	local s2 = ""
	local clone = lineTemplate:Clone()

	clone.Size = UDim2.fromScale(1.5, 0.333)
	clone.Parent = textHolder
	task.wait()

	local function NewLine(p19)
		table.insert(t3, s2)
		s2 = p19 or ""
	end

	for _, v in ipairs(t4) do
		clone.RichText = true

		local s3 = s2

		clone.Text = (s3 .. v):gsub("<.->", "")

		if clone.TextBounds.X > textHolder.AbsoluteSize.X then
			table.insert(t3, s2)
			s2 = v or ""
		else
			local v78 = s2

			s2 = v78 .. v
		end
	end

	table.insert(t3, s2)
	s2 = ""
	NewLine = {}

	for i, v in ipairs(t3) do
		local clone2 = lineTemplate:Clone()

		clone2.RichText = true
		clone2.Text = v
		clone2.LayoutOrder = i
		clone2.Visible = false
		clone2.Parent = textHolder
		table.insert(NewLine, clone2)
	end

	for _, v in ipairs(NewLine) do
		v.Visible = true

		local v84 = coroutine.create(function()
			typewriter.Play(v, v.Text, 0.01)
		end)

		coroutine.resume(v84)

		while true do
			if coroutine.status(v84) == "dead" then
				break
			end

			task.wait()
		end
	end

	if not p14 then
		u24 = false
		tutorialDialogFrame.Backdrop.Arrow.Visible = true
		v8.Event:Wait()
	end
end

tutorialDialogFrame:WaitForChild("Skip").MouseButton1Click:Connect(function()
	if u24 then
		return
	end

	v8:Fire()
	audioService.PlaySound("click1")
end)

return module
