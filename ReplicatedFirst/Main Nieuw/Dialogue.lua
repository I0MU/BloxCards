





local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkClient = network.client
local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local visGuiDialogHolder = visGui.DialogHolder
local visGuiDialogHolderMain = visGuiDialogHolder.Main
local visGuiDialogHolderNewOptions = visGuiDialogHolder.NewOptions
local visGuiDialogHolderStart = visGuiDialogHolder.Start
local stepped = game:GetService("RunService").Stepped
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local mathSin = math.sin

u17 = function(p1, p2, p3)
	local n1 = (mathSin(p2 * 8) + 1) / 2 * p3 / 2

	p1.BackgroundColor3 = Color3.fromRGB(245 + n1, 0 + n1, 87 + n1)
end

local quips = require(game.ReplicatedStorage.Quips)
local u20 = nil

local t1: {[any]: any} = {
	["%playername"] = LocalPlayer.Name,
	["%banreason"] = data.BanReason,
	["%banquip"] = function()
		local v53 = data.BanReason()

		if quips[v53] then
			return quips[v53]
		end

		return "Couldn't keep up, huh?"
	end
}

u20 = function(p4)
	for k, v in pairs(t1) do
		p4 = if typeof(v) == "function" then p4:gsub("%" .. k, v() or " ") else p4:gsub("%" .. k, v)
	end

	return p4
end

local function reverseTable(p5)
	for i = 1, math.floor(#p5 / 2) do
		local n1: number = #p5 - i + 1
		local v60 = p5[i]

		p5[i] = p5[n1]
		p5[n1] = v60
	end

	return p5
end

reverseTable = function(p6, p7, p8, p9, p10, p11)
	local tweenInfo = TweenInfo.new(p10, Enum.EasingStyle[p11], Enum.EasingDirection.Out, 0, false)
	local v68: Tween = game:GetService("TweenService"):Create(p6, tweenInfo, { [p7] = p9 })

	if p8 then
		p6[p7] = p8
	end

	v68:Play()
	v68.Completed:Wait()
	v68:Destroy()
end

local scaler = visGuiDialogHolderMain.TextPad.Scaler
local scalerOwner = scaler.Owner
local u25 = nil
local u26: boolean = false
local visGuiDialogHolderMainPosition = visGuiDialogHolderMain.Position

u15 = function()
	u25 = true
	visGuiDialogHolder.Visible = true

	local uDim2 = UDim2.new(0, 0, 0, visGuiDialogHolderMain.AbsoluteSize.Y / 2)

	visGuiDialogHolderMain.Position = visGuiDialogHolderMainPosition + uDim2
	visGuiDialogHolderMain.Visible = true
	visGuiDialogHolderMain:TweenPosition(visGuiDialogHolderMainPosition, "Out", "Quad", 0.2, true)
end

local function HideMain()
	visGuiDialogHolder.Visible = false
	u25 = false

	local uDim2 = UDim2.new(0, 0, 0, visGuiDialogHolderMain.AbsoluteSize.Y / 2)

	visGuiDialogHolderMain:TweenPosition(visGuiDialogHolderMainPosition + uDim2, "In", "Linear", 0.1, true, function()
		visGuiDialogHolderMain.Visible = false
	end)
end

HideMain()
u16 = function()
	return u25
end

local u29 = nil

visGuiDialogHolderMain.MouseButton1Click:connect(function()
	if u26 then
		return
	end

	u29 = true
end)

local visGuiDialogHolderMainNext = visGuiDialogHolderMain.Next

visGuiDialogHolderMainNext.Visible = false

local u31: boolean = false

visGuiDialogHolderMainNext.MouseButton1Click:connect(function()
	u31 = true
end)

local function WaitForNextPressed()
	visGuiDialogHolderMainNext.Visible = true
	u31 = false
	u29 = false

	local n1 = 0

	repeat
		u17(visGuiDialogHolderMainNext, n1, 64)

		local v72, v73 = stepped:wait()

		n1 += v73
	until not not u31 or not not u29

	u29 = false
	u31 = false
	visGuiDialogHolderMainNext.Visible = false
end
local function FlushStrings()
	u26 = true

	for i = 1, 3 do
		spawn(function()
			for i2 = 1, 8 do
				if u29 then
					break
				end

				local text: string = tostring(i)

				scaler[text].TextTransparency = i2 / 8

				if i2 ~= 8 then
					stepped:wait()
				end
			end

			local text2: string = tostring(i)

			scaler[text2].Text = ""

			local text3: string = tostring(i)

			scaler[text3].TextTransparency = 0
			u26 = false
		end)

		if i ~= 3 then
			wait(0.12)
		end
	end
end

FlushStrings()
scaler.Owner.Text = ""

local function ShowStrings(p12, p13, _)
	FlushStrings()
	u29 = false

	local n1: number = 1

	for i = 1, #p12 do
		local v80 = u20(p12[i])
		local text: string = tostring(n1)
		local v82 = scaler[text]

		for j = 1, #v80 do
			v82.Text = string.sub(v80, 1, j)

			if j ~= #v80 then
				if not u29 then
					task.wait()
				end

				string.sub(v80, j, j):match("%w")
			end
		end

		v82.Text = v80

		if n1 == 3 and i ~= #p12 then
			u29 = false
			WaitForNextPressed()
			FlushStrings()
			n1 = 1
		else
			n1 += 1
			wait()
		end
	end

	if p13 then
		WaitForNextPressed()
	end
end
local function Interpret(p15, p16)
	local v86 = p15[p16]

	scalerOwner.Text = string.upper(p15[p16].Name or p15.Owner)

	local text: string = tostring(1)

	scaler[text].Text = ""

	local text4: string = tostring(2)

	scaler[text4].Text = ""

	local text5: string = tostring(3)

	scaler[text5].Text = ""
	ShowStrings(v86.Text, not v86.Question, v86.EndPoint)

	if v86.Question then
		local v90 = u14(p15, v86.Question)

		return Interpret(p15, v90)
	end

	if v86.Destination then
		return Interpret(p15, v86.Destination)
	end

	if v86.EndPoint then
		HideMain()

		return p16
	end
end
local function ShowOptions()
	visGuiDialogHolderNewOptions.Visible = true
	visGuiDialogHolderNewOptions.Position = UDim2.fromScale(0.975, 0.5)

	local v91 = UDim2.fromScale(0.975, 0.1)

	visGuiDialogHolderNewOptions:TweenPosition(v91, "Out", "Quint", 0.5, true)
end
local function HideOptions()
	for _, v in pairs(visGuiDialogHolderNewOptions:GetChildren()) do
		if v:IsA("ImageButton") then
			v.Destination:Destroy()
			v:Destroy()
		end
	end

	visGuiDialogHolderNewOptions.Visible = false
end

local t2: {[any]: any} = {}

local function ApplyOptions(p17)
	t2 = {}

	for k, v in pairs(p17) do
		local clone = visGuiDialogHolder.OptionTemplate:Clone()

		clone.Visible = true
		clone.Parent = visGuiDialogHolderNewOptions
		clone.TextPad.TextButton.Text = v.Text
		clone.Destination.Value = v.Destination
		clone.Key.Value = k
		clone.Active = true

		local v98: {[any]: any} = t2
		local text: string = tostring(k)

		v98[text] = v
	end
end
local function WaitForResponse(_)
	local bindableEvent: BindableEvent = Instance.new("BindableEvent")

	for _, v in pairs(visGuiDialogHolderNewOptions:GetChildren()) do
		if v:IsA("ImageButton") then
			local u104 = nil

			u104 = v.TextPad.TextButton.MouseButton1Click:connect(function()
				if t2[v.Key.Value].Effect then
					local effect = t2[v.Key.Value].Effect

					if not networkClient[effect.Type] then
						return
					end

					if effect.Arguments then
						networkClient[effect.Type](unpack(effect.Arguments))
					else
						networkClient[effect.Type]()
					end
				end

				if v.Destination then
					bindableEvent:Fire(v.Destination.Value)
				end

				u104:Disconnect()
			end)
		end
	end

	local u105 = nil

	local function v106(p19)
		u105 = p19
		bindableEvent:Destroy()
	end

	bindableEvent.Event:connect(v106)

	local n1 = 0

	repeat
		local v108, v106 = stepped:wait()

		n1 += v106
	until u105

	HideOptions()

	return u105
end

u14 = function(_, p21)
	visGuiDialogHolderNewOptions.Visible = true
	visGuiDialogHolderNewOptions.Position = UDim2.fromScale(0.975, 0.5)

	local v111 = UDim2.fromScale(0.975, 0.1)

	visGuiDialogHolderNewOptions:TweenPosition(v111, "Out", "Quint", 0.5, true)
	ApplyOptions(p21)

	return (WaitForResponse(p21))
end

local visGuiDialogHolderStartPosition = visGuiDialogHolderStart.Position
local u42: boolean = false
local u43 = nil
local u44 = nil
local u45 = nil
local botName = nil
local n1 = 0

local module: {[any]: any} = {
	ShowStartDialogue = function(p22)
		if not visGuiDialogHolderMain.Visible and not u42 and not visGui.Battle.Visible and not transition.BattleBackVisible() then
			if tick() - n1 < 1 then
				return
			end

			u42 = true
			u45 = p22:FindFirstChild("Duelist").Value or p22.Name
			botName = u45:FindFirstChild("BotName")
			u44 = network.InvokeServer("GetBotChallengeMessage", u45)
			visGuiDialogHolderStart.Title.Text = "Talk to " .. u44.Owner
			visGuiDialogHolderStart.Visible = true

			local uDim2 = UDim2.new(0, 0, 0, visGuiDialogHolderStart.AbsoluteSize.Y / 2)

			visGuiDialogHolderStart.Position = visGuiDialogHolderStartPosition + uDim2
			visGuiDialogHolderStart:TweenPosition(visGuiDialogHolderStartPosition, "Out", "Quad", 0.2, true)
			u43 = visGuiDialogHolderStart.Title.MouseButton1Click:connect(function()
				ShowDialogue(p22)
			end)

			return
		end
	end,
	HideStartDialogue = function(_)
		local uDim2 = UDim2.new(0, 0, 0, visGuiDialogHolderStart.AbsoluteSize.Y / 2)

		visGuiDialogHolderStart:TweenPosition(visGuiDialogHolderStartPosition + uDim2, "In", "Linear", 0.1, true, function()
			visGuiDialogHolderStart.Visible = false
		end)

		if u43 then
			u43:disconnect()
		end

		u42 = false
	end
}

module.HideStartDialogue()
visGuiDialogHolderStart.Close.MouseButton1Click:connect(function()
	module.HideStartDialogue(true)
end)

function ShowDialogue(p24)
	if visGuiDialogHolderMain.Visible then
		return
	end

	if visGui.Battle.Visible then
		return
	end

	if transition.BattleBackVisible() then
		return
	end

	if u43 then
		u43:disconnect()
	end

	visGuiDialogHolder.Visible = true
	u45 = p24:FindFirstChild("Duelist").Value or p24.Name
	botName = u45:FindFirstChild("BotName")
	u44 = network.InvokeServer("GetBotChallengeMessage", u45)
	module.HideStartDialogue()
	spawn(handy.Hide)

	local contextActionService: ContextActionService = game:GetService("ContextActionService")

	contextActionService:BindAction("freezeMovement", function()
		return Enum.ContextActionResult.Sink
	end, false, unpack(Enum.PlayerActions:GetEnumItems()))
	data.Load()

	local v118 = module.Start(u44)

	contextActionService:UnbindAction("freezeMovement")
	n1 = tick()

	if v118 == "StartFight" then
		network.FireServer("RequestBattle", {
			Parent = true,
			Name = botName and u45.BotName.Value or u45,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = u45
		})

		return
	end

	if v118 == "StartTrade" then
		network.FireServer("RequestTrade", {
			Parent = true,
			Name = botName and u45.BotName.Value or u45,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = u45
		})

		return
	end

	if v118 == "StartPuzzle" then
		network.FireServer("RequestPuzzle", {
			Parent = true,
			Name = botName and u45.BotName.Value or u45,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = u45
		})

		return
	end

	if u44[v118] and u44[v118].ChallengePuzzle then
		network.FireServer("RequestPuzzle", {
			Parent = true,
			Name = botName and u45.BotName.Value or u44[v118].ChallengePuzzle,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = u44[v118].ChallengePuzzle
		})

		return
	end

	if u44[v118] and u44[v118].ChallengeBattle then
		network.FireServer("RequestBattle", {
			Parent = true,
			Name = botName and u45.BotName.Value or u44[v118].ChallengeBattle,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = u44[v118].ChallengeBattle
		})

		return
	end

	handy.Show()
	visGuiDialogHolder.Visible = false
end

module.StartDialogue = ShowDialogue
networkClient.StartDialogue = ShowDialogue

function module.Start(p25)
	if u16() then
		return
	end

	if p25.Cutscene then
		networkClient.SetCutscene(p25.Cutscene)
	end

	u15()

	return Interpret(p25, "Start")
end

print("Finished loading " .. script.Name)

return module
