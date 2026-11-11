



local module: {[any]: any} = {}



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local paperRipple = require(script.Parent.Nevermore).PaperRipple
local fakeTopBar = require(script.Parent.FakeTopBar)
local newFakeTopBar = require(replicatedStorage.NewFakeTopBar)
local customScalings = require(script.Parent.CustomScalings)
local customScalingsCustomscalings = customScalings.customscalings
local animation = require(game.ReplicatedStorage.Animation)
local qut = require(script.qut)
local v11: boolean = runService:IsStudio()

local function dprint(...)
	if v11 then
		print(...)
	end
end

local t2: {[any]: any} = {}
local t3: {[any]: any} = {}
local n1 = 4
local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local stepped = game:GetService("RunService").Stepped
local BulletValue = game.ReplicatedStorage.Strings.Bullet.Value
local helpFrame = visGui.HelpHolder.HelpFrame
local helpFrameScroller = helpFrame.Scroller
local helpFrameScrollerBaseQuestion = helpFrameScroller.BaseQuestion

helpFrameScrollerBaseQuestion.Visible = false

local v22 = helpFrameScrollerBaseQuestion.Answer.TextLabel

v22.Size = UDim2.new(v22.Size.X.Scale, 0, 100, 0)
newFakeTopBar.new():setImage(10951216726):bindEvent("deselected", function()
	if module.Visible then
		module.Hide()

		return
	end

	module.Show()
end):oneClick()

local t4: {[any]: any} = {
	12,
	14,
	18,
	24,
	28,
	32,
	36,
	42
}

local function ClosestToFontSize(p1)
	n1 = p1 / 2

	return p1
end
function module.RegisterMove(...)
	for _, v in pairs({ ... }) do
		t2[#t2 + 1] = { v, v.Size, v.Position }
	end
end
local function GetBounds(text, textSize)
	v22.Text = text
	v22.TextSize = textSize
	dprint(v22.TextBounds)

	return v22.TextBounds
end
local function TweenEntries()
	local n2 = 0

	for _, v in pairs(t3) do
		local vPhysical = v.Physical
		local uDim2 = UDim2.new(0, 0, 0, n2)

		vPhysical:TweenPosition(uDim2, "Out", "Quad", 0.25, true)
		n2 += v.Physical.AbsoluteSize.Y

		if v.Expanded then
			dprint(v.Physical.Name, "is expanded! Its size is", v.AnswerTextBounds.Y)
			n2 = n2 + v.AnswerTextBounds.Y + n1
		end
	end

	spawn(function()
		local animationAnimateAsync = animation.AnimateAsync
		local uDim22 = UDim2.new(0, 0, 0, n2 + 8)

		animationAnimateAsync(helpFrameScroller, { CanvasSize = uDim22 }, 0.15, "Out", "Quad")
	end)
end
function module.Redraw()
	for _, v in pairs(t3) do
		if v.Expanded then
			v:Expand(true)
		end
	end

	TweenEntries()
end

local t5: {[any]: any} = {
	Expand = function(p4, p5)
		local n2: number = if p5 == true then 0 else 1
		local roundedUp = math.ceil(p4.Physical.Question.AbsoluteSize.Y / 2)

		n1 = roundedUp / 2

		local textSize = roundedUp

		v22.Text = p4.Answer
		v22.TextSize = textSize
		dprint(v22.TextBounds)

		local textBounds = v22.TextBounds

		p4.Physical.Answer.TextLabel.TextSize = textSize
		animation.AnimateAsync(p4.Physical.Answer.TextLabel, { TextTransparency = 1 }, 0, "Out", "Linear")
		p4.Physical.Answer.Visible = true
		p4.Physical.Divider.Visible = false

		local answer = p4.Physical.Answer
		local uDim2 = UDim2.new(1, 0, 0, textBounds.Y + n1)

		answer:TweenSize(uDim2, "Out", "Quad", 0.25 * n2, true)
		p4.AnswerTextBounds = textBounds
		p4.Expanded = true
		TweenEntries()
		wait(0.2 * n2)
		animation.AnimateAsync(p4.Physical.Answer.TextLabel, { TextTransparency = 0 }, 0.15 * n2, "Out", "Quad")
	end,
	Collapse = function(p6)
		p6.Physical.Answer:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.25, true, function()
			p6.Physical.Answer.Visible = false
			p6.Physical.Divider.Visible = true
		end)
		p6.Expanded = false
		TweenEntries()
	end
}

function t5.new(question, p8)
	local t6: {[any]: any} = {}

	setmetatable(t6, t5)
	t5.__index = t5
	t6.Physical = helpFrameScrollerBaseQuestion:Clone()
	t6.Physical.Question.Text = question
	t6.Expanded = false
	t6.Question = question
	t6.Answer = string.gsub(p8, "\\B", BulletValue)
	t6.Physical.Answer.TextLabel.Text = t6.Answer
	t6.Physical.Answer.TextLabel.Size = UDim2.new(v22.Size.X.Scale, 0, 1, 0)

	local pand = t6.Physical.Pand
	local u61: boolean = false

	t6.Ripple = paperRipple.FromParent(t6.Physical)
	t6.Ripple:SetInkColor(Color3.fromRGB(27, 42, 53))
	t6.Physical.MouseButton1Click:connect(function()
		if u61 then
			return
		end

		u61 = true

		if t6.Expanded then
			t6:Collapse()
			animation.AnimateAsync(pand.Right, { Rotation = -45 }, 0.15, "Out", "Quad")
			animation.AnimateAsync(pand.Left, { Rotation = 45 }, 0.15, "Out", "Quad")
		else
			animation.AnimateAsync(pand.Right, { Rotation = 45 }, 0.15, "Out", "Quad")
			animation.AnimateAsync(pand.Left, { Rotation = -45 }, 0.15, "Out", "Quad")
			t6:Expand()
		end

		u61 = false
	end)
	table.insert(t3, t6)
	t6.Physical.Visible = true
	t6.Physical.Parent = helpFrameScroller
	t6.Physical.Name = string.sub(question, 1, 6)
end
function module.Show()
	helpFrame.Parent.Visible = true
	helpFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true)

	for _, v in pairs(t2) do
		local v64, v65, v66 = unpack(v)
		local uDim2 = UDim2.new(v65.X.Scale, -helpFrame.AbsoluteSize.X, v65.Y.Scale, 0)

		v64:TweenSize(uDim2, "Out", "Quad", 0.25, true, module.StateChangeCallBack)
	end

	module.Visible = true
end
function module.Hide()
	helpFrame:TweenPosition(UDim2.new(1, 0, 0, 0), "In", "Quad", 0.25, true)

	for _, v in pairs(t2) do
		local v70, v71, v72 = unpack(v)
		local uDim2 = UDim2.new(v71.X.Scale, 0, v71.Y.Scale, 0)

		v70:TweenSize(uDim2, "Out", "Quad", 0.25, true, module.StateChangeCallBack)
	end

	helpFrame.Parent.Visible = false
	module.Visible = false
end
function module.RegisterStateChangeCallBack(stateChangeCallBack)
	module.StateChangeCallBack = stateChangeCallBack
end

for _, v in pairs(qut) do
	t5.new(v[1], v[2])
end

TweenEntries()
helpFrame.TopBit.Back.MouseButton1Click:connect(module.Hide)

local v30, v31 = fakeTopBar.AddButton("", "", function()
end)

local parent, v33 = fakeTopBar.AddButton("Tutorial", "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab@2x.png", function()
	if module.Visible then
		module.Hide()

		return
	end

	module.Show()
end)

v33.Visible = false

local textLabel: TextLabel = Instance.new("TextLabel")

textLabel.TextScaled = true
textLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
textLabel.Position = UDim2.new(0.1, 0, 0.05, 0)
textLabel.Font = "SourceSansBold"
textLabel.Text = "HELP"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.ZIndex = v33.ZIndex
textLabel.BackgroundTransparency = 1

local clone: Instance = textLabel:Clone()

clone.Position = textLabel.Position + UDim2.new(0, 0, 0, 1)
clone.TextColor3 = Color3.new()
clone.TextStrokeColor3 = Color3.new()
clone.TextTransparency = 0.9
clone.TextStrokeTransparency = 0.9
clone.Parent = parent
textLabel.Parent = parent
module.RegisterStateChangeCallBack(customScalings.UpdateScalings)
module.RegisterMove(visGui.Battle, visGui.DeckBuilderNew, visGui.OmniShop, visGui.IntroNew)
customScalingsCustomscalings.Tutorial = module.Redraw
print("Finished loading " .. script.Name)

return module
