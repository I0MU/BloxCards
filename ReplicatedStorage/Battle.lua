local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

repeat
	task.wait()
until playerGui:FindFirstChild("VisGui") ~= nil

local u4 = playerGui:WaitForChild("VisGui") -- decompiler left this upvalue undefined; it is the VisGui ScreenGui

local battleNew = u4.BattleNew
local stepped = game:GetService("RunService").Stepped
local player = game:GetService("ReplicatedFirst")["Main Nieuw"]
local config = require(game.ReplicatedStorage.CONFIG)
local configCardzindex = config.CARDZINDEX
local configCardsize = config.CARDSIZE
local configClr = config.CLR
local configColororder = config.COLORORDER
local configRarities = config.RARITIES
local t1: {[any]: any} = { bbstring = "ʙʙ" }
local uDim2New = UDim2.new
local sleeves = require(player.Sleeves)
local sleevesSleeves = sleeves.sleeves
local sleevesPrettysleeves = sleeves.prettysleeves

sleeves = require(player.Engines).engines

local transition = require(player.Transition)
local backgroundModels = require(player.BackgroundModels)
local utils = require(game.ReplicatedStorage.Utils)
local utilsNew = utils.New
local utilsClamp = utils.Clamp
local utilsSetZIndex = utils.SetZIndex
local utilsCopyTable = utils.CopyTable
local targetArrow = require(player.TargetArrow)

targetArrow.Initializes()

local fakeMouse = require(player.FakeMouse)
local fakeMouseMouseAwayFrom = fakeMouse.MouseAwayFrom
local customScalings = require(player.CustomScalings)
local customScalingsCustomscalings = customScalings.customscalings
local inspection = require(player.Inspection)
local nonGameCard = require(player.NonGameCard)
local handy = require(player.Handy)
local handyHandy = handy.handy
local audioService = require(game.ReplicatedStorage.AudioService)

utils = require(player.Network)

local utilsFireServer = utils.FireServer
local utilsInvokeServer = utils.InvokeServer
local utilsClient = utils.client
local debugStats = require(player.DebugStats)

require(player.Character)
require(player.PlayerList)
require(player.Tutorial)

local animation = require(game.ReplicatedStorage.Animation)

require(player.MainClient2)
require(player.DodgeModeHandler)

local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local cardAnim = require(game.ReplicatedStorage.CardAnim)
local signal = require(game.ReplicatedStorage.Signal)
local passiveEffects = require(game.ReplicatedStorage.PassiveEffects)
local effects = require(game.ReplicatedStorage.Effects)
local data = require(player.Data)
local dataUpdateCashMoney = data.UpdateCashMoney
local maid = require(game.ReplicatedStorage.Maid)
local v48 = maid.new()
local battle3dPositions = require(game.ReplicatedStorage.Battle3dPositions)
local textFormat = require(player.TextFormat)
local battleTutorial = require(game.ReplicatedStorage.BattleTutorial)
local battleCutscenes = require(game.ReplicatedStorage.BattleCutscenes)
local battleCutscenesCutsceneData = battleCutscenes.CutsceneData
local battleCutscenesBattleCutscenes = battleCutscenes.BattleCutscenes
local mouse = LocalPlayer:GetMouse()
local userInputService: UserInputService = game:GetService("UserInputService")
local u57: boolean = userInputService.TouchEnabled == true
local u58: boolean = userInputService.GamepadEnabled == true
local allcards = require(player.allcards)
local u60 = nil
local s1 = nil -- enemy sleeve id (nil = the basic sleeve); an empty string used to make the opponent's hand / deck blank
local u62 = nil
local u63 = nil
local u64: boolean = false
local u65: boolean = false
local u66: boolean = false
local u67: boolean = false
local u68: boolean = false
local u69 = nil
local u70 = nil
local u71 = nil
local u72 = false
local u73 = nil
local t2: {[any]: any} = {}
local u75: boolean = false
local u76: boolean = false
local n1: number = 1
local u78: boolean = false
local u79: boolean = false
local u80: boolean = false
local u81: boolean = false
local u82 = false
local t3: {[any]: any} = {}
local t4 = {}
local runService: RunService = game:GetService("RunService")
local t5: {[any]: any} = {}
local u87: boolean = false

local function v88(p1)
	if not runService:IsStudio() then
		return
	end

	local text: string = tostring(p1)

	table.insert(t5, text)

	if u87 then
		return
	end

	u87 = true
	task.spawn(function()
		while #t5 > 0 do
			print(table.remove(t5, 1))
			task.wait(0.125)
		end

		u87 = false
	end)
end

local t6: {[any]: any} = {
	tradedb = false,
	bpdb = false,
	bpext = false,
	discardhover = false,
	bphover = false,
	fieldhover = false
}
local u90 = false
local u91 = false
local u92 = false
local n2: number = 0
local t7: {[any]: any} = {}
local t8: {[any]: any} = {}

local function spawn(p2, ...)
	local v213 = coroutine.create(p2)

	coroutine.resume(v213, ...)

	return v213
end

local t9: {[any]: any} = { addingicons = 0 }
local cardLibrary = require(game.ReplicatedStorage.CardLibrary)

setmetatable({}, {
	__index = function(p3, p4)
		local t18: {[any]: any} = { __index = cardLibrary[p4] }

		p3[p4] = t18

		return t18
	end
})

local vector2New = Vector2.new

local function AbsolutePosition(p5)
	return vector2New(p5.Position.X.Offset, p5.Position.Y.Offset)
end

AbsolutePosition = function(p6, p7)
	for k, v in pairs(p7) do
		p6[k] = v
	end
end

local function CardDied(p8)
	if not p8 then
		return
	end

	p8:RemovePhysical()
	p8.Maid:DoCleaning()

	local v223 = t2[p8.Position]
	local v224 = v223 and table.find(v223, p8.CardId)

	if v224 then
		table.remove(v223, v224)
	end

	allcards[p8.CardId] = nil
end
function NewerCircle(parent, p10)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = vector2New(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = uDim2New()
	imageLabel.Parent = parent

	for k, v in pairs(p10) do
		imageLabel[k] = v
	end

	return imageLabel
end

local t10: {[any]: any} = {}

local function preloadImages(p11, p12: {[any]: any}, p13)
	if typeof(p12) == "string" then
		p12 = { p12 }
	end

	local t19: {[any]: any} = {}

	for _, v in ipairs(p12) do
		if not t10[v] then
			t10[v] = true

			local v237

			if p13 then
				local v238 = utilsNew("ImageLabel")
				local v239 = uDim2New(0, 0, 0, 0)
				local v240 = uDim2New(0.5, 0, 0.5, -36)

				v237 = v238({
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v239,
					Position = v240,
					Image = v
				})
			else
				local v241 = uDim2New(0, 0, 0, 0)
				local v242 = uDim2New(0.5, 0, 0.5, -36)

				v237 = NewerCircle(p11, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = v241,
					Position = v242,
					Image = v
				})
			end

			table.insert(t19, v237)
		end
	end

	task.spawn(function()
		task.wait(0.75)

		for _, v in ipairs(t19) do
			if v and v.Destroy then
				v:Destroy()
			end
		end
	end)
end
local function PreloadTech(p14, p15)
	preloadImages(p14, p15, false)
end
local function PreloadClientTech(p16)
	preloadImages(nil, p16, true)
end

local mathRandom = math.random

local function GetWeightedRandom(p17)
	return (mathRandom() - 0.5) * p17
end
function Shake(p18, p19, p20, p21)
	local magnitude = p18.AbsoluteSize.magnitude

	for _ = 1, p20 / 0.018 do
		local scale = p19.X.Scale
		local offset = p19.X.Offset
		local v255 = mathRandom()
		local v256 = p19.Y.Scale
		local v257 = p19.Y.Offset
		local v258 = mathRandom()

		p18.Position = uDim2New(scale, offset + (v255 - 0.5) * (magnitude * p21), v256, v257 + (v258 - 0.5) * (magnitude * p21))
		p21 *= 0.9
		stepped:wait()
	end

	p18.Position = p19
end
function ShakeSync(p22, p23, p24, p25)
	task.spawn(function()
		Shake(p22, p23, p24, p25)
	end)
end

local battleNewSelection = battleNew.Selection
local children = battleNewSelection:GetChildren()
local configClrNeutral = configClr.Neutral

function TargetCard(p26)
	if u71 == true then
		u71 = p26
		fakeMouse.Cursors.Stop()
		pcall(utilsClient.__ShowTargetMarker, p26)
	end
end

local u111: boolean = false

function AttackCard(p27)
	if u111 then
		v88("AttackCard: attackdebounce")

		return
	end

	if not selectedcard then
		v88("AttackCard: No selected card")

		return
	end

	if selectedcard.Locked.IsLocked then
		v88("AttackCard: selectedcard was locked")

		return
	end

	if selectedcard.Position == "Field" then
		u111 = true
		utilsFireServer("PlayCard", u73, selectedcard.CardId, p27.CardId)
		task.wait(0.5)
		u111 = false

		return
	end

	v88("AttackCard: selectedcard is in hand")
end
function SelectCard(p28)
	DeselectCard()

	if not p28 then
		warn("SelectCard: no such self")

		return
	end

	selectedcard = p28
	configClrNeutral = configClr[selectedcard.Color]
end
function DeselectCard()
	selectedcard = nil
end

mouse.Button2Up:connect(function()
	if selectedcard then
		DeselectCard()
	end
end)

local u112: boolean = false

function sleeves.UpdateSelectionPosAndColor(_, p30)
	if not selectedcard then
		if u112 then
			battleNewSelection.Visible = false
			u112 = false
		end

		return
	end

	local n1 = math.sin(p30 * 3) * 0.1

	if selectedcard then
		u112 = true
		battleNewSelection.Visible = true
		battleNewSelection.Size = selectedcard.Physical.Size
		battleNewSelection.Position = selectedcard.Physical.Position

		local v269

		if configClrNeutral then
			local color3New = Color3.new
			local v271 = math.max(configClrNeutral.r + n1, 0)
			local v272 = math.min(v271, 1)
			local v273 = math.max(configClrNeutral.g + n1, 0)

			v271 = math.min(v273, 1)

			local v274 = math.max(configClrNeutral.b + n1, 0)

			v273 = math.min(v274, 1)
			v269 = color3New(v272, v271, v273)
		else
			local v275 = Color3.new
			local v276 = math.max(n1 + 1, 0)
			local v277 = math.min(v276, 1)
			local v278 = math.max(n1 + 1, 0)

			v276 = math.min(v278, 1)

			local v279 = math.max(n1 + 1, 0)

			v278 = math.min(v279, 1)
			v269 = v275(v277, v276, v278)
		end

		for i = 1, #children do
			local v281 = children[i]

			v281.BackgroundColor3 = v269
			v281.BorderColor3 = v269
		end

		return
	end

	u112 = false
	battleNewSelection.Visible = false
end

local VirtualHandSize = battleNew.VirtualHand.Size
local VirtualFieldPosition = battleNew.VirtualField.Position
local VirtualFieldSize = battleNew.VirtualField.Size

local function ExtendHandForMobile(p31)
	if not u57 then
		return
	end

	task.spawn(function()
		if p31 then
			audioService.PlaySound("click1")

			local animationAnimateAsync = animation.AnimateAsync
			local battleNewVirtualHand = battleNew.VirtualHand
			local v1285 = UDim2.fromScale(0.65, 0.265)

			animationAnimateAsync(battleNewVirtualHand, { Size = v1285 }, 0.1, "Out", "Quad")

			local animationAnimate = animation.Animate
			local battleNewVirtualField = battleNew.VirtualField

			v1285 = UDim2.fromScale(0.7, 0.225)

			local v1288 = UDim2.fromScale(0.5, 0.61)

			animationAnimate(battleNewVirtualField, { Size = v1285, Position = v1288 }, 0.1, "Out", "Quad")
		else
			animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
			animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
		end

		HandRedraw()
		FieldRedraw()
	end)
end

if u57 then
	battleNew.VirtualHand.AutoButtonColor = true
end

battleNew.VirtualHand.MouseButton1Click:Connect(function()
	if not u57 then
		return
	end

	local u283: boolean = true

	task.spawn(function()
		if u283 then
			audioService.PlaySound("click1")

			local animationAnimateAsync = animation.AnimateAsync
			local battleNewVirtualHand = battleNew.VirtualHand
			local v1291 = UDim2.fromScale(0.65, 0.265)

			animationAnimateAsync(battleNewVirtualHand, { Size = v1291 }, 0.1, "Out", "Quad")

			local animationAnimate = animation.Animate
			local battleNewVirtualField = battleNew.VirtualField

			v1291 = UDim2.fromScale(0.7, 0.225)

			local v1294 = UDim2.fromScale(0.5, 0.61)

			animationAnimate(battleNewVirtualField, { Size = v1291, Position = v1294 }, 0.1, "Out", "Quad")
		else
			animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
			animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
		end

		HandRedraw()
		FieldRedraw()
	end)
end)
battleNew.VirtualField.MouseButton1Click:Connect(function()
	if not u57 then
		return
	end

	local u284: boolean = false

	task.spawn(function()
		if u284 then
			audioService.PlaySound("click1")

			local animationAnimateAsync = animation.AnimateAsync
			local battleNewVirtualHand = battleNew.VirtualHand
			local v1297 = UDim2.fromScale(0.65, 0.265)

			animationAnimateAsync(battleNewVirtualHand, { Size = v1297 }, 0.1, "Out", "Quad")

			local animationAnimate = animation.Animate
			local battleNewVirtualField = battleNew.VirtualField

			v1297 = UDim2.fromScale(0.7, 0.225)

			local v1300 = UDim2.fromScale(0.5, 0.61)

			animationAnimate(battleNewVirtualField, { Size = v1297, Position = v1300 }, 0.1, "Out", "Quad")
		else
			animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
			animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
		end

		HandRedraw()
		FieldRedraw()
	end)
end)

function utilsClient.PauseTimer()
	u78 = true
end
function utilsClient.ResumeTimer()
	u78 = false
end

local u117 = nil
local u118 = nil
local u119 = nil
local battleNewEndTurn = battleNew.EndTurn

local function ShowEndTurnButton()
	battleNewEndTurn.Visible = true
end
local function HideEndTurnButton()
	battleNewEndTurn.Visible = false
end
function utilsClient.ShowEndTurn()
	ShowEndTurnButton()
end
function utilsClient.HideEndTurn()
	HideEndTurnButton()
end
function DisableEndTurnButton()
	u64 = true
end
function EnableEndTurnButton()
	u64 = false
end

local u123: boolean = false

battleNewEndTurn.MouseButton1Down:connect(function()
	if not not u123 or not u73 or not u66 then
		return
	end

	u123 = true
	audioService.PlaySound("click1")

	local v285 = utilsInvokeServer("GetBattleTurnCount", u73)
	local v286 = utilsInvokeServer("GetPlayerDiscardCount", u73)

	if (v285 or 0) <= 4 and (v286 or 0) > 0 and not u67 and not u79 and u92 == false then
		battleNew.EndTurnNotice.Visible = true
	else
		utilsFireServer("EndTurn", u73)
	end

	task.spawn(function()
		task.wait(3)
		u123 = false
	end)
end)
battleNewEndTurn.MouseEnter:Connect(function()
	audioService.PlaySound("Mouse Hover")
	battleNewEndTurn.Back.ImageColor3 = Color3.fromRGB(69, 189, 85)
end)
battleNewEndTurn.MouseLeave:Connect(function()
	battleNewEndTurn.Back.ImageColor3 = Color3.fromRGB(62, 172, 75)
end)

local u124: boolean = false
local battleNewEndSpectate = battleNew.EndSpectate

battleCutscenes = function()
	if u73 and not u124 then
		u124 = true
		battleNewEndSpectate.Visible = false
		audioService.PlaySound("ClickSound")
		utilsFireServer("HookOut", u73)
		task.wait(0.5)
		u124 = false

		return
	end
end
battleNewEndSpectate.MouseButton1Down:connect(battleCutscenes)
battleNewEndSpectate.TouchTap:connect(battleCutscenes)

local timestamp = tick()
local n3 = 0
local battleNewTimeLeft = battleNew.TimeLeft
local n4 = 0
local u130: boolean = false

function sleeves.UpdateClock(_, p33)
	if u78 then
		timestamp = tick()
	end

	if n3 == -1 then -- PATCH (Test Mode): no timer
		battleNewTimeLeft.Text = "Time Left: ∞"
		battleNewTimeLeft.TextColor3 = Color3.fromRGB(255, 255, 255)
		return
	end

	if n3 then
		local n1 = n3 - (p33 - timestamp)

		if n1 < 0 then
			return
		end

		if n1 < 16 then
			local battleNewTimeLeftTextColor3 = battleNewTimeLeft.TextColor3
			local color3 = Color3.fromRGB(255, 255, 255)

			if battleNewTimeLeftTextColor3 == color3 and n4 > math.floor(n1) then
				battleNewTimeLeft.TextColor3 = Color3.fromRGB(188, 36, 31)
			elseif n4 > math.floor(n1) then
				battleNewTimeLeft.TextColor3 = Color3.fromRGB(255, 255, 255)
			end

			local v292: number = n4
			local floored = math.floor(n1)

			if v292 > floored then
				audioService.PlaySound(if n1 > 6 then "TimerTick" else "TimerTickFast", {
					TimePosition = if n1 > 6 then 10.703 else 9.703
				})
			end
		elseif battleNewTimeLeft.TextColor3 == Color3.fromRGB(188, 36, 31) then
			battleNewTimeLeft.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		if n1 > 5 and n1 < 6 then
			local battleback: Instance = workspace:FindFirstChild("Battleback")
			local backgroundTriggers = nil

			if battleback and battleback:FindFirstChild("BackgroundTriggers") then
				backgroundTriggers = require(battleback.BackgroundTriggers)
			end

			if backgroundTriggers and type(backgroundTriggers.OnLowTime) == "function" then
				backgroundTriggers.OnLowTime()
			end

			u130 = true
		elseif u130 == true and n1 > 6 then
			local battleback: Instance = workspace:FindFirstChild("Battleback")
			local backgroundTriggers = nil

			if battleback and battleback:FindFirstChild("BackgroundTriggers") then
				backgroundTriggers = require(battleback.BackgroundTriggers)
			end

			if backgroundTriggers and type(backgroundTriggers.LowTimeReset) == "function" then
				backgroundTriggers.LowTimeReset()
			end

			u130 = false
		end

		n4 = math.floor(n1)
		battleNewTimeLeft.Text = "Time Left: " .. n4

		return
	end
end
local function StartClock(p34)
	n3 = p34
	timestamp = tick()
end

utilsClient.UpdateClock = StartClock
u117 = function()
	n3 = 0
	timestamp = tick()
end

local alert = playerGui.Alert.AlertHolder.AlertImage.Alert
local playerGuiAlert = playerGui.Alert

playerGuiAlert.Enabled = false

local t11: {[any]: any} = { "TurnPhase1", "TurnPhase2", "TurnPhase3" }

u118 = function(p35: {[any]: any})
	if typeof(p35) == "string" then
		local v300 = p35
		local color3 = Color3.fromRGB(59, 74, 72)
		p35 = { v300, color3, true }
	end

	if u65 then
		HandRedraw()
	end

	repeat
		task.wait()
	until not playerGuiAlert.Enabled

	task.spawn(function()
		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tweenInfo2 = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local shineGradient = playerGui.Alert.AlertHolder.AlertImage.ShineImage.ShineGradient
		local v1305 = playerGui.Alert.AlertHolder.AlertImage.ShineImage2.ShineGradient

		alert.Text = p35[1]

		local n1: number = -1.1 * (if p35[3] then 1 else -1)
		local n2: number = -0.5 * (if p35[3] then 1 else -1)

		shineGradient.Offset = Vector2.new(n1, 0)
		v1305.Offset = Vector2.new(n2, 0)
		tweenService:Create(alert.Parent, tweenInfo, { ImageColor3 = p35[2] }):Play()
		shineGradient.Parent.ImageColor3 = p35[2]

		local vector2 = Vector2.new(n1 * -1, 0)

		tweenService:Create(shineGradient, tweenInfo2, { Offset = vector2 }):Play()
		v1305.Parent.ImageColor3 = p35[2]

		local vector22 = Vector2.new(n2 * -1.6, 0)

		tweenService:Create(v1305, tweenInfo2, { Offset = vector22 }):Play()

		local audioServicePlaySound = audioService.PlaySound
		local randomNumber = math.random(1, #t11)

		audioServicePlaySound(t11[randomNumber])
		alert.Parent:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
		alert.MaxVisibleGraphemes = 0
		tweenService:Create(alert, tweenInfo, { MaxVisibleGraphemes = #p35[1] }):Play()
		playerGuiAlert.Enabled = true
		delay(2.5, function()
			if alert.Text == p35[1] then
				u119()
			end
		end)
	end)
end
utilsClient.Alert = u118
utils.async.Alert = true
u119 = function(p36)
	if playerGuiAlert.Enabled then
		alert.Parent:TweenPosition(UDim2.new(0, 0, 1, 1), "In", "Quad", 0.3, true)

		if not p36 then
			task.wait(0.3)
		end

		playerGuiAlert.Enabled = false
	end
end
alert.MouseButton1Down:Connect(function()
	u119(true)
end)
battleNew.EndTurnNotice.Confirm.MouseButton1Down:Connect(function()
	battleNew.EndTurnNotice.Visible = false
	audioService.PlaySound("ClickSound")
	utilsFireServer("EndTurn", u73)
end)
battleNew.EndTurnNotice.Deny.MouseButton1Down:Connect(function()
	battleNew.EndTurnNotice.Visible = false
	audioService.PlaySound("ClickSound")
end)
battleNew.FullBoardNotice.Confirm.MouseButton1Down:Connect(function()
	battleNew.FullBoardNotice.Visible = false
	audioService.PlaySound("ClickSound")
	utilsFireServer("PlaceCard", u73, t4, true)
end)
battleNew.FullBoardNotice.Deny.MouseButton1Down:Connect(function()
	battleNew.FullBoardNotice.Visible = false
	audioService.PlaySound("ClickSound")
end)
battleNew.ReviveMenu.Confirm.MouseButton1Down:Connect(function()
	audioService.PlaySound("ClickSound")
	game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, 3375815921)
end)
battleNew.ReviveMenu.Deny.MouseButton1Down:Connect(function()
	battleNew.ReviveMenu.Visible = false
	audioService.PlaySound("ClickSound")
	utilsFireServer("AcceptDeath", u73)
end)

function utilsClient.ChangeHandSlot(p37, p38, p39)
	local function SetHandSlot(p40, p41)
		if effects[p41] then
			task.spawn(function()
				if t3[p40.Name] == true then
					repeat
						task.wait(0.1)
					until t3[p40.Name] == false
				end

				effects[p41](battleNew.Effect, p40)
			end)
			p40.Visible = true
		elseif p40.Visible == true then
			task.spawn(function()
				t3[p40.Name] = true
				audioService.PlaySound("refresh")
				animation.AnimateAsync(p40.Icon, { ImageTransparency = 1 }, 1, "Out", "Quart")

				if p40:FindFirstChild("Timer") then
					animation.AnimateAsync(p40.Timer, { TextTransparency = 1 }, 1, "Out", "Quart")
				end

				animation.Animate(p40, { ImageTransparency = 1 }, 1, "Out", "Quart")
				p40.Visible = false
				t3[p40.Name] = false
			end)
		end
	end

	local v307 = battleNew.HandSlots[p37 .. "HandSlots"]

	for _, v in pairs(p38) do
		local text: string = tostring(v)

		SetHandSlot(v307[text], p39)
	end

	v307 = false

	for _, v in pairs(battleNew.HandSlots[p37 .. "HandSlots"]:GetChildren()) do
		if v.Visible == true then
			v307 = true
		end
	end

	if not v307 then
		return
	end

	if p37 == "" then
		u75 = true
		HandRedraw()

		return
	end

	u76 = true
	EnemyHandRedraw()
end
function utilsClient.ChangeHandSlotTimer(p42, p43, p44)
	local v316 = battleNew.HandSlots[p42 .. "HandSlots"]
	local text: string = tostring(p43)
	local parent = v316[text]

	if not parent:FindFirstChild("Timer") then
		local timer: TextLabel = Instance.new("TextLabel")

		timer.BackgroundTransparency = 1
		timer.TextTransparency = 1
		timer.Size = UDim2.fromOffset(parent.AbsoluteSize.X * 0.5, parent.AbsoluteSize.X * 0.5)
		timer.Position = UDim2.fromScale(0.5, 0.2)
		timer.AnchorPoint = Vector2.new(0.5, 0.5)
		timer.Name = "Timer"
		timer.TextScaled = true
		timer.ZIndex = parent.ZIndex + 100

		local uiStroke: UIStroke = Instance.new("UIStroke")

		uiStroke.Thickness = 4
		uiStroke.Parent = timer
		timer.Parent = parent
	end

	local timer = parent:FindFirstChild("Timer")

	if p44 == 0 then
		timer.Visible = false
	else
		timer.Visible = true
	end

	local animationAnimateAsync = animation.AnimateAsync
	local v323 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.6, parent.AbsoluteSize.X * 0.6)

	animationAnimateAsync(timer, { TextTransparency = 0.4, Size = v323 }, 0.4, "Out", "Quart")

	if p44 <= 1 then
		timer.TextColor3 = Color3.new(0.956863, 0.196078, 0.196078)
	else
		timer.TextColor3 = Color3.new(1, 1, 1)
	end

	timer.Text = tostring(p44)
	task.spawn(function()
		task.wait(0.5)

		local animationAnimateAsync = animation.AnimateAsync
		local v1315 = UDim2.fromOffset(parent.AbsoluteSize.X * 0.5, parent.AbsoluteSize.X * 0.5)

		animationAnimateAsync(timer, { Size = v1315 }, 0.4, "Out", "Quart")
	end)
end
local function CreateHandSlot(parent, p46, p47)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.ZIndex = 150000
	imageLabel.Parent = parent
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Visible = false
	imageLabel.Name = tostring(p46)

	if p47 then
		imageLabel.Rotation = 180
	end
end

for i = 0, 9 do
	local v137 = battleNew.HandSlots.HandSlots
	local imageLabel = Instance.new("ImageLabel")

	imageLabel.ZIndex = 150000
	imageLabel.Parent = v137
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Visible = false
	imageLabel.Name = tostring(i)
	imageLabel = battleNew.HandSlots.EnemyHandSlots
	v137 = Instance.new("ImageLabel")
	v137.ZIndex = 150000
	v137.Parent = imageLabel
	v137.BackgroundTransparency = 1
	v137.BorderSizePixel = 0
	v137.Visible = false
	v137.Name = tostring(i)
	v137.Rotation = 180
end

function utilsClient.BackgroundTriggerEnemyDeath()
	local battleback: Instance = workspace:FindFirstChild("Battleback")
	local backgroundTriggers = nil

	if battleback and battleback:FindFirstChild("BackgroundTriggers") then
		backgroundTriggers = require(battleback.BackgroundTriggers)
	end

	if backgroundTriggers and type(backgroundTriggers.EnemyDeath) == "function" then
		backgroundTriggers.EnemyDeath()
	end
end

local u139 = nil
local u140 = nil
local u141 = nil
local instanceNew = Instance.new
local battleNewEnemyHand = battleNew.EnemyHand
local battleNewVirtualEnemyHand = battleNew.VirtualEnemyHand

function RedrawHolder(p48, p49, p50, p51, p52, p53)
	local n1 = p48.AbsolutePosition - battleNew.AbsolutePosition
	local n2 = p48.AbsoluteSize.X / (p51 * 1 + p50)
	local children = p49:GetChildren()
	-- keep the face card in the first slot: reparenting it (face attacks) or a card (attacks) re-appends it to the
	-- end of GetChildren and the face used to jump to another spot whenever a fighter was cast
	-- FIX: on the Stage (attacks) the attacker goes on the left and the face on the right, so only reorder everywhere else
	if p49 ~= battleNew.Stage then
		local faces, rest = {}, {}
		for _, child in ipairs(children) do
			if child:FindFirstChild("DumbFace") then
				table.insert(faces, child)
			else
				table.insert(rest, child)
			end
		end
		children = faces
		for _, child in ipairs(rest) do
			table.insert(children, child)
		end
	end
	local v339 = n1.X
	local y = n1.Y
	local n3 = n2 * (1 + p50)
	local n4 = n3 / configCardsize.x * configCardsize.y

	if p53 and #children >= p51 * p53 then
		local rounded = math.round((#children - p51 * p53) / p53)

		p53 = p53 + rounded + 2
	end

	if type(p52) == "function" then
		local v344, v345, v346 = p52(p48, p49, p50, p51)

		n2 = v344
		n3 = v345
		n4 = v346
	elseif p52 == "FitY" then
		n4 = p48.AbsoluteSize.Y
		n3 = n4 / configCardsize.y * configCardsize.x
		p50 = n3 / (p48.AbsoluteSize.X / p51)
		n2 = n3 / (1 + p50)
	elseif p52 == "Center" then
		n4 = p48.AbsoluteSize.Y
		n3 = n4 / configCardsize.y * configCardsize.x
		v339 += (p48.AbsoluteSize.X - ((#children - 1) * n2 + n3)) / 2
	elseif p52 == "CenterX" then
		v339 += (p48.AbsoluteSize.X - ((#children - 1) * n2 + n3)) / 2
	elseif p52 == "FieldFit" then
		-- FIX: a board holds up to FieldCap (9) fighters. Cards keep the card aspect ratio and sit close together; they are as
		-- tall as the holder unless that would make a FULL board wider than the holder, in which case they shrink so
		-- every card always fits, whatever the screen size / shape. Cards are centred as a group.
		local fieldGap = 0.04 -- gap between cards, as a fraction of card width
		local aspect = configCardsize.x / configCardsize.y
		local slots = math.max(p51, #children, 1)
		local byHeight = p48.AbsoluteSize.Y * aspect
		local byWidth = p48.AbsoluteSize.X / (slots + fieldGap * (slots - 1))

		n3 = math.min(byHeight, byWidth)
		n4 = n3 / aspect
		n2 = n3 * (1 + fieldGap)
		v339 += (p48.AbsoluteSize.X - (math.max(#children - 1, 0) * n2 + n3)) / 2
	end

	-- FIX (Farseeker Charter / blessed hand): "Bottom" (used while a blessing is on a hand space) sizes cards from the holder WIDTH
	-- (width / HandCap) and never looked at the holder height like "Center" does, so on a wide, short hand area the whole hand came out
	-- taller than its holder, i.e. "really big". Never let it exceed what "Center" would give: the holder's height.
	if p52 == "Bottom" and n4 > p48.AbsoluteSize.Y and p48.AbsoluteSize.Y > 0 then
		n4 = p48.AbsoluteSize.Y
		n3 = n4 / configCardsize.y * configCardsize.x
	end

	local uDim2 = UDim2.new(0, n3, 0, n4)
	local n5: number = 0
	local n6 = if p52 == "Top" then 0 else (p48.AbsoluteSize.Y - n4) / 2

	if p52 == "TopOrder" then
		n6 = 0
		table.sort(children, function(p54, p55)
			return p54.AbsolutePosition.X < p55.AbsolutePosition.X
		end)
	end

	if p52 == "Bottom" then
		local configCardsize2 = config.CARDSIZE
		local n7 = p48.AbsoluteSize.Y / configCardsize2.y * configCardsize2.x
	end

	if p52 == "Grid" then
		local n8: number = 0
		local n9 = p48.AbsoluteSize.Y / (p53 * 1 + p50)

		for _, v in pairs(children) do
			local uDim22 = UDim2.new(0, v339 + n5 * n2, 0, y + 0 + 0 + n8 * n9)

			v:TweenSizeAndPosition(uDim2, uDim22, "Out", "Quad", 0.25, true)
			n5 += 1

			if p51 == n5 then
				n5 = 0
				n8 += 1
			end
		end

		return
	end

	for _, v in pairs(children) do
		local uDim23 = UDim2.new(0, v339 + n5 * n2, 0, y + n6 + 0)

		v:TweenSizeAndPosition(uDim2, uDim23, "Out", "Quad", 0.25, true)
		n5 += 1
	end
end
function RedrawIcons(p56)
	local v361 = battleNew[p56 .. "IconHolderSlots"]

	for _, v in pairs(battleNew[p56 .. "Icons"]:GetChildren()) do
		local v364 = v361[v.Name]
		local v365 = UDim2.fromOffset(v364.AbsoluteSize.X, v364.AbsoluteSize.Y)
		local v366 = UDim2.fromOffset(v364.AbsolutePosition.X, v364.AbsolutePosition.Y)

		v:TweenSizeAndPosition(v365, v366, "Out", "Quad", 0.25, true)
	end
end
function EnemyHandRedraw()
	local battleNewVirtualEnemyHand = battleNew.VirtualEnemyHand
	local battleNewEnemyHand = battleNew.EnemyHand
	local v369 = u139()

	RedrawHolder(battleNewVirtualEnemyHand, battleNewEnemyHand, -0.05, v369, if not u76 then "Center" else "Bottom")

	local virtualEnemyHand = battleNew.VirtualEnemyHand
	local enemyHandSlots = battleNew.HandSlots.EnemyHandSlots

	v369 = u139()
	RedrawHolder(virtualEnemyHand, enemyHandSlots, -0.05, v369, "Top")
end
function HandRedraw()
	local n1: number = if u75 then 0 else -0.1
	local battleNewVirtualHand = battleNew.VirtualHand
	local battleNewHand = battleNew.Hand
	local v375 = u139()

	RedrawHolder(battleNewVirtualHand, battleNewHand, n1, v375, if not u75 then "Center" else "Bottom")

	local virtualHand = battleNew.VirtualHand
	local handSlots = battleNew.HandSlots.HandSlots

	v375 = u139()
	RedrawHolder(virtualHand, handSlots, n1, v375, "Bottom")
end
function HandReorder()
	HandRedraw()
end
function FieldRedraw()
	local battleNewVirtualEnemyField = battleNew.VirtualEnemyField
	local battleNewEnemyField = battleNew.EnemyField
	local v380 = u140()

	RedrawHolder(battleNewVirtualEnemyField, battleNewEnemyField, -0.05, v380, "FieldFit")

	local battleNewVirtualField = battleNew.VirtualField
	local battleNewField = battleNew.Field

	v380 = u140()
	RedrawHolder(battleNewVirtualField, battleNewField, -0.05, v380, "FieldFit")
end
local function StageRedraw()
	local battleNewVirtualStage = battleNew.VirtualStage
	local battleNewStage = battleNew.Stage
	local v385 = u141()

	RedrawHolder(battleNewVirtualStage, battleNewStage, -0.5, v385, "Center")
end
local function EffectStageRedraw()
	local battleNewVirtualEffectStage = battleNew.VirtualEffectStage
	local battleNewEffectStage = battleNew.EffectStage
	local v388 = u141()

	RedrawHolder(battleNewVirtualEffectStage, battleNewEffectStage, -0.5, v388 + 20, "FitY")
end
local function PlayerSlotRedraw()
	local battleNewVirtualPlayerSlot = battleNew.VirtualPlayerSlot
	local battleNewPlayerSlot = battleNew.PlayerSlot
	local v391 = u141()

	RedrawHolder(battleNewVirtualPlayerSlot, battleNewPlayerSlot, -0.5, v391, "Center")
end
local function EnemyPlayerSlotRedraw()
	local battleNewVirtualEnemyPlayerSlot = battleNew.VirtualEnemyPlayerSlot
	local battleNewEnemyPlayerSlot = battleNew.EnemyPlayerSlot
	local v394 = u141()

	RedrawHolder(battleNewVirtualEnemyPlayerSlot, battleNewEnemyPlayerSlot, -0.5, v394, "Center")
end
local function TerrainRedraw()
	RedrawHolder(battleNew.VirtualTerrain, battleNew.Terrain, 0, 1, "Center")
end
local function EnemyTerrainRedraw()
	RedrawHolder(battleNew.VirtualEnemyTerrain, battleNew.EnemyTerrain, 0, 1, "Center")
end
local function EnemyPositionsRedraw()
	for _, v in pairs(battleNew.Virtual3DEnemyPositions:GetChildren()) do
		if v:IsA("Frame") and battleNew["3DEnemyPositions"]:FindFirstChild(v.Name) then
			RedrawHolder(battleNew.Virtual3DEnemyPositions[v.Name], battleNew["3DEnemyPositions"][v.Name], 0, 1, "Center")
		end
	end
end
local function Add3DPosition(p57)
	p57.ChildAdded:Connect(EnemyPositionsRedraw)
	p57.ChildRemoved:Connect(EnemyPositionsRedraw)
end
local function GraveyardRedraw()
	RedrawHolder(battleNew.VirtualGraveyard, battleNew.Graveyard, 0, 99999, "Center")
end
local function EnemyGraveyardRedraw()
	RedrawHolder(battleNew.VirtualEnemyGraveyard, battleNew.EnemyGraveyard, 0, 99999, "Center")
end
function BaseplateRedraw()
	RedrawHolder(battleNew.VirtualBaseplate, battleNew.Baseplate, 0.4, 4, "Grid", 3)
end
function EnemyBaseplateRedraw()
	RedrawHolder(battleNew.VirtualEnemyBaseplate, battleNew.EnemyBaseplate, 0.4, 4, "Grid", 3)
end
function IconRedraw()
	RedrawIcons("")
end
function EnemyIconRedraw()
	RedrawIcons("Enemy")
end

task.spawn(function()
	repeat
		task.wait(0.1)
	until u141

	battleNew.EnemyHand.ChildAdded:Connect(EnemyHandRedraw)
	battleNew.EnemyHand.ChildRemoved:Connect(EnemyHandRedraw)
	battleNew.Hand.ChildAdded:Connect(HandRedraw)
	battleNew.Hand.ChildRemoved:Connect(HandRedraw)
	battleNew.Field.ChildAdded:Connect(FieldRedraw)
	battleNew.Field.ChildRemoved:Connect(FieldRedraw)
	battleNew.EnemyField.ChildAdded:Connect(FieldRedraw)
	battleNew.EnemyField.ChildRemoved:Connect(FieldRedraw)

	local foundChild = battleNew:FindFirstChild("3DEnemyPositions")

	for _, v in pairs(foundChild:GetChildren()) do
		v.ChildAdded:Connect(EnemyPositionsRedraw)
		v.ChildRemoved:Connect(EnemyPositionsRedraw)
	end

	battleNew:FindFirstChild("3DEnemyPositions").ChildAdded:Connect(Add3DPosition)
	battleNew.Stage.ChildAdded:Connect(StageRedraw)
	battleNew.Stage.ChildRemoved:Connect(StageRedraw)
	battleNew.EffectStage.ChildAdded:Connect(EffectStageRedraw)
	battleNew.EffectStage.ChildRemoved:Connect(EffectStageRedraw)
	battleNew.Terrain.ChildAdded:Connect(TerrainRedraw)
	battleNew.Terrain.ChildRemoved:Connect(TerrainRedraw)
	battleNew.EnemyTerrain.ChildAdded:Connect(EnemyTerrainRedraw)
	battleNew.EnemyTerrain.ChildRemoved:Connect(EnemyTerrainRedraw)
	battleNew.Baseplate.ChildAdded:Connect(BaseplateRedraw)
	battleNew.Baseplate.ChildRemoved:Connect(BaseplateRedraw)
	battleNew.EnemyBaseplate.ChildAdded:Connect(EnemyBaseplateRedraw)
	battleNew.EnemyBaseplate.ChildRemoved:Connect(EnemyBaseplateRedraw)
	battleNew.Icons.ChildAdded:Connect(IconRedraw)
	battleNew.EnemyIcons.ChildAdded:Connect(EnemyIconRedraw)
	battleNew.PlayerSlot.ChildAdded:Connect(PlayerSlotRedraw)
	battleNew.EnemyPlayerSlot.ChildAdded:Connect(EnemyPlayerSlotRedraw)
	battleNew.Graveyard.ChildAdded:Connect(GraveyardRedraw)
	battleNew.EnemyGraveyard.ChildAdded:Connect(EnemyGraveyardRedraw)
	customScalingsCustomscalings.FieldRedraw = FieldRedraw
	customScalingsCustomscalings.HandRedraw = HandRedraw
	customScalingsCustomscalings.EnemyHandRedraw = EnemyHandRedraw
	customScalingsCustomscalings.StageRedraw = StageRedraw
	customScalingsCustomscalings.EffectStageRedraw = EffectStageRedraw
	customScalingsCustomscalings.TerrainRedraw = TerrainRedraw
	customScalingsCustomscalings.EnemyTerrainRedraw = EnemyTerrainRedraw
	customScalingsCustomscalings.Baseplate = BaseplateRedraw
	customScalingsCustomscalings.EnemyBaseplate = EnemyBaseplateRedraw
	customScalingsCustomscalings.Icons = IconRedraw
	customScalingsCustomscalings.EnemyIcons = EnemyIconRedraw
	customScalingsCustomscalings.PlayerSlot = PlayerSlotRedraw
	customScalingsCustomscalings.EnemyPlayerSlot = EnemyPlayerSlotRedraw
	customScalingsCustomscalings.Graveyard = GraveyardRedraw
	customScalingsCustomscalings.EnemyGraveyard = EnemyGraveyardRedraw
	customScalings.EnemyPositionsRedraw = EnemyPositionsRedraw
end)

local function OrderHolder(p58)
	local children = p58:GetChildren()

	table.sort(children, function(p59, p60)
		return p59.AbsolutePosition.X < p60.AbsolutePosition.X
	end)

	for k, v in pairs(children) do
		local uDim2 = UDim2.new((k - 1) / 5, 0, 0, 0)

		v:TweenPosition(uDim2, "Out", "Quad", 0.2, true)
	end
end
local function NewIcon(p61, parent, p63)
	local v409 = utilsNew("ImageButton")({
		Image = "rbxassetid://511406127",
		ZIndex = 100000,
		BackgroundTransparency = 1,
		SizeConstraint = "RelativeYY",
		ScaleType = "Slice",
		ImageColor3 = configClr[p61] or Color3.new(0, 0, 0),
		BackgroundColor3 = configClr[p61] or Color3.new(0, 0, 0),
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(p63 / 5, 0, 0, 0),
		Name = "Icon " .. p61
	})

	v409.Parent = parent

	local v410 = utilsNew("TextLabel")({
		Name = "Count",
		SizeConstraint = "RelativeYY",
		BackgroundTransparency = 1,
		TextStrokeTransparency = 0.4,
		Font = "SourceSansBold",
		TextScaled = true,
		Text = 0,
		Size = UDim2.new(-1, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		TextColor3 = Color3.new(1, 1, 1),
		TextStrokeColor3 = Color3.new(0, 0, 0),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Bottom,
		FontSize = Enum.FontSize.Size24,
		ZIndex = v409.ZIndex + 1
	})

	v410.Parent = v409

	local amount: NumberValue = Instance.new("NumberValue")

	amount.Name = "Amount"
	amount.Parent = v409

	return v409
end
local function NewLock(p64)
	preloadImages(u4, { "rbxassetid://337233077" }, false)

	local rage = battleNew[(if p64.Owner == "You" then "" else "Enemy") .. "Effect"]:FindFirstChild("Rage")
	local lockImage: ImageLabel = Instance.new("ImageLabel")

	lockImage.Size = UDim2.new(0.8, 0, 0.8, 0)
	lockImage.Position = UDim2.new(0.095, 0, 0.2, 0)
	lockImage.ImageTransparency = 1
	lockImage.BackgroundTransparency = 1
	lockImage.Name = "LockImage"
	lockImage.Image = "rbxassetid://337233077"
	lockImage.ZIndex = p64.Physical.ZIndex + 40

	local v415 = utilsNew("TextLabel")({
		Name = "Amount",
		BackgroundTransparency = 1,
		Text = "",
		TextTransparency = 1,
		TextStrokeTransparency = 1,
		TextScaled = true,
		Font = "SourceSansBold",
		Size = UDim2.new(1, 0, 0.5, 0),
		Position = UDim2.new(0, 0, 0.325, 0),
		TextColor3 = rage and Color3.fromRGB(0, 0, 0) or configClr.Neutral,
		TextStrokeColor3 = rage and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 0, 0),
		ZIndex = p64.Physical.ZIndex + 41
	})

	v415.Parent = lockImage
	lockImage.Parent = p64.Physical
	p64.Locked.Physical = lockImage
	animation.AnimateAsync(v415, {
		TextTransparency = 0,
		TextStrokeTransparency = if rage then 0 else 0.7
	}, 0.16, "Out", "Quad")
	animation.AnimateAsync(lockImage, { ImageTransparency = 0 }, 0.16, "Out", "Quad")

	return p64.Locked.Physical
end
function NewFlippedCard(p65)
	local imageButton: ImageButton = Instance.new("ImageButton")

	imageButton.BackgroundTransparency = 1
	imageButton.ZIndex = configCardzindex
	imageButton.Image = "rbxassetid://" .. (p65 or s1 or sleevesSleeves.Basic[1]) -- hidden cards (the opponent's hand) show the basic sleeve

	return imageButton
end
function MakeHealthPowerLabels(parent, p67)
	local color3 = Color3.fromRGB(255, 46, 46)
	local color32 = Color3.fromRGB(80, 14, 14)
	local color33 = Color3.fromRGB(45, 229, 45)
	local color34 = Color3.fromRGB(28, 77, 24)
	local color35 = Color3.fromRGB(11, 43, 255)
	local color36 = Color3.fromRGB(3, 15, 89)
	local color37 = Color3.fromRGB(255, 205, 52)
	local color38 = Color3.fromRGB(84, 67, 17)
	local color39 = Color3.fromRGB(255, 255, 255)
	local color310 = Color3.fromRGB(58, 58, 58)
	local t20: {[any]: any} = {
		Red = { Holder = color3, HolderOutline = color32 },
		Green = { Holder = color33, HolderOutline = color34 },
		Blue = { Holder = color35, HolderOutline = color36 },
		Yellow = { Holder = color37, HolderOutline = color38 },
		Neutral = { Holder = color39, HolderOutline = color310 }
	}
	local clone = game:GetService("ReplicatedStorage").UI.Health:Clone()
	local clone2 = game:GetService("ReplicatedStorage").UI.Power:Clone()

	for _, v in pairs({ clone, clone2 }) do
		if v then
			v.Holder.ImageColor3 = t20[p67.Color].Holder
			v.HolderOutline.ImageColor3 = t20[p67.Color].HolderOutline
			v.Visible = true
			v.Parent = parent

			if p67["Add" .. v.Name] and tonumber(p67[clone.Name]) == 0 then
				v.Text = "+" .. p67["Add" .. v.Name]
			else
				v.Text = p67[v.Name]

				if p67.ObscureStats then
					v.Text = "????"
				end
			end
		end
	end

	return clone, clone2
end
function MakePassivesHolder(parent, _)
	local clone = game:GetService("ReplicatedStorage").UI.PassiveIconFrame:Clone()

	clone.Parent = parent
	clone.ZIndex = parent.ZIndex + 10

	return clone
end
local function GetGearPosition(p70, p71)
	if p71 == 1 then
		return UDim2.fromScale(0.6, 0.5)
	end

	if p71 == 2 then
		return p70 == 1 and UDim2.fromScale(0.7, 0.25) or UDim2.fromScale(0.7, 0.8)
	end

	local n1: number = 0.75

	if p70 > 3 then
		n1 = 0.3
	end

	if p70 % 3 == 0 then
		return UDim2.fromScale(n1, 0.85)
	end

	if p70 % 2 == 0 then
		return UDim2.fromScale(n1, 0.5)
	end

	return UDim2.fromScale(n1, 0.15)
end
local function GetGearSize(_, p73)
	if p73 == 1 then
		return UDim2.fromScale(1, 1)
	end

	if p73 == 2 then
		return UDim2.fromScale(1, 0.5)
	end

	return UDim2.fromScale(1, 0.3)
end
local function RedrawGearHolder(p74)
	utilsClient.__lastGearRedraw = os.clock() -- FIX: a gear slides into place for 0.3s; a trigger flash must wait for that (see CardEffectTriggered)
	for k, v in pairs(p74) do
		local v446 = GetGearPosition(k, #p74)
		local n1: number = #p74
		local v448 = if n1 == 1 then UDim2.fromScale(1, 1) else if n1 == 2 then UDim2.fromScale(1, 0.5) else UDim2.fromScale(1, 0.3)

		v.Rotation = math.random(-3, 3)
		animation.AnimateAsync(v, { Rotation = 0, Position = v446, Size = v448 }, 0.3, "Out", "Quad")
	end
end
function MakeGearHolder(parent, p76)
	local clone = game:GetService("ReplicatedStorage").UI.GearFrame:Clone()

	clone.Parent = parent
	clone.ZIndex = parent.ZIndex + 10
	p76.PhysicalAttatchedGears = {}
	clone.ChildAdded:Connect(function(p77)
		table.insert(p76.PhysicalAttatchedGears, p77)
		RedrawGearHolder(p76.PhysicalAttatchedGears)
	end)
	clone.ChildRemoved:Connect(function(p78)
		table.remove(p76.PhysicalAttatchedGears, table.find(p76.PhysicalAttatchedGears, p78))
		RedrawGearHolder(p76.PhysicalAttatchedGears)
	end)

	return clone
end
function MakeAffordableLabel(parent, _)
	local affordableLabel: TextLabel = Instance.new("TextLabel")

	affordableLabel.Name = "AffordableLabel"
	affordableLabel.Size = UDim2.new(1, 0, 0.1, 0)
	affordableLabel.Position = UDim2.new(0, 0, -0.15, 0)
	affordableLabel.BackgroundTransparency = 1
	affordableLabel.Text = "▲"
	affordableLabel.TextColor3 = Color3.new(1, 1, 1)
	affordableLabel.TextStrokeColor3 = affordableLabel.BorderColor3
	affordableLabel.TextTransparency = 1
	affordableLabel.TextStrokeTransparency = 1
	affordableLabel.ZIndex = parent.ZIndex
	affordableLabel.Font = Enum.Font.SourceSansBold
	affordableLabel.TextScaled = true
	affordableLabel.Parent = parent

	return affordableLabel
end
function MakeCardPort(parent, _)
	local clone = game:GetService("ReplicatedStorage").UI.CardViewPort:Clone()

	clone.Parent = parent
	require(clone.PortCardRotation).SetupMovement()

	return clone
end
function DisplayIconDelta(p83, p84, p85, p86)
	local tweenService: TweenService = game:GetService("TweenService")

	if typeof(p83) == "Instance" then
		if p83.Parent == nil or not p83:IsDescendantOf(game) then
			return
		end

		local textColor3 = p85 or p84 < 0 and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(255, 255, 255)
		local u464 = p86 or 1

		if u464 <= 0 then
			u464 = 1
		end

		local displayedDelta: TextLabel = Instance.new("TextLabel")

		displayedDelta.Name = "DisplayedDelta"
		displayedDelta.Size = UDim2.new(1, 0, 0.5, 0)
		displayedDelta.Position = UDim2.new(0, 0, 0.25, 0)
		displayedDelta.BackgroundTransparency = 1
		displayedDelta.ZIndex = 1000000
		displayedDelta.TextColor3 = textColor3
		displayedDelta.TextStrokeTransparency = 0
		displayedDelta.TextXAlignment = Enum.TextXAlignment.Center
		displayedDelta.TextYAlignment = Enum.TextYAlignment.Center
		displayedDelta.FontSize = Enum.FontSize.Size24
		displayedDelta.Text = string.format("%+i", p84)
		task.spawn(function()
			if p83.Parent == nil or not p83:IsDescendantOf(game) then
				displayedDelta:Destroy()

				return
			end

			if pcall(function()
					displayedDelta.Parent = p83
				end) and displayedDelta.Parent == p83 then
				local tweenInfo = TweenInfo.new(0.75 / u464, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

				tweenService:Create(displayedDelta, tweenInfo, { Position = UDim2.new(0, 0, -0.5, 0) }):Play()
				task.wait(1 / u464)

				if displayedDelta.Parent == nil then
					return
				end

				local tweenInfo3 = TweenInfo.new(0.3 / u464, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
				local v1324: Tween = tweenService:Create(displayedDelta, tweenInfo3, { TextTransparency = 1, TextStrokeTransparency = 1 })

				v1324:Play()
				v1324.Completed:Wait()

				if displayedDelta.Parent ~= nil then
					displayedDelta:Destroy()
				end

				return
			end

			displayedDelta:Destroy()
		end)

		return
	end
end

userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent and input.KeyCode == Enum.KeyCode.N then
		utilsFireServer("DebugDraw", u73)
	end
end)
userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent and input.KeyCode == Enum.KeyCode.B then
		utilsFireServer("DebugWin", u73)
	end
end)
userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent and input.KeyCode == Enum.KeyCode.M then
		utilsFireServer("DebugStuds", u73)
	end
end)
userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent and input.KeyCode == Enum.KeyCode.P then
		utilsFireServer("DebugEXP", u73)
	end
end)
battleCutscenes = battleNew.VirtualGraveyard
battleCutscenes.MouseEnter:connect(function()
	t6.discardhover = true
	t6.bphover = false
	t6.fieldhover = false
end)
battleCutscenes.MouseLeave:connect(function()
	t6.discardhover = false
end)
battleNew.VirtualField.MouseEnter:connect(function()
	t6.fieldhover = true
	t6.discardhover = false
	t6.bphover = false
end)
battleNew.VirtualField.MouseLeave:connect(function()
	t6.fieldhover = false
end)
battleNew.VirtualBaseplate.MouseEnter:connect(function()
	t6.bphover = true
	t6.fieldhover = false
	t6.discardhover = false
end)
battleNew.VirtualBaseplate.MouseLeave:connect(function()
	t6.bphover = false
end)
battleCutscenes = {
	MoveTo = function(p95, p96, p97)
		if not battleNew["Virtual" .. p96] then
			warn("Card:MoveTo destination " .. p96 .. " doesn't exist")
		end

		if p95.Position and t2[p95.Position] then
			local v477 = table.find(t2[p95.Position], p95.CardId)

			if v477 then
				table.remove(t2[p95.Position], v477)
			end
		end

		if not t2[p96] then
			t2[p96] = {}
		end

		if p97 then
			table.insert(t2[p96], p97, p95.CardId)
		else
			table.insert(t2[p96], p95.CardId)
		end

		if p96 == "Field" or p96 == "EnemyField" then
			if p95.SummonAnimationEffect and (p95.Position == "Hold" or p95.Position == "EnemyHand") and not u90 then
				task.spawn(function()
					animation.Animate(p95.Physical, { ImageTransparency = 1 }, 0.1, "Out", "Quad")
					p95.Physical.Visible = false
				end)
			end

			repeat
				task.wait()
			until t9.addingicons == 0
		end

		if p95.PhysicalHealth then
			if p96 == "Hand" then
				p95.PhysicalHealth.Position = UDim2.new(p95.PhysicalHealth.Position.X.Scale, 0, 0.75, 0)
				p95.PhysicalPower.Position = UDim2.new(p95.PhysicalPower.Position.X.Scale, 0, 0.75, 0)
			else
				p95.PhysicalHealth.Position = UDim2.new(p95.PhysicalHealth.Position.X.Scale, 0, 0.811, 0)
				p95.PhysicalPower.Position = UDim2.new(p95.PhysicalPower.Position.X.Scale, 0, 0.811, 0)
			end

			if p96 == "Baseplate" or p96 == "EnemyBaseplate" then
				p95.PhysicalHealth.Visible = false
				p95.PhysicalPower.Visible = false
			else
				p95.PhysicalHealth.Visible = true
				p95.PhysicalPower.Visible = true
			end
		end

		if p95.PhysicalCost then
			if p96 == "Hand" then
				p95.PhysicalCost.Visible = true
			else
				p95.PhysicalCost.Visible = false
			end
		end

		if p95.PhysicalPassives then
			for _, v in pairs(p95.PhysicalPassives:GetChildren()) do
				if v:IsA("ImageLabel") then
					if (p96 == "Field" or p96 == "EnemyField") and v.Name ~= "Hunt" or p96 == "Hand" and (v.Name == "Fading" or v.Name == "Aspiration") or (p96 == "Graveyard" or p96 == "EnemyGraveyard") and (v.Name == "TriggerInGraveZone" or v.Name == "Terror" or v.Name == "Drafted" or v.Name == "Element") then
						p95.PhysicalPassives[v.Name].Visible = true
					elseif v.Name ~= "Hunt" or p96 ~= "Hand" then
						p95.PhysicalPassives[v.Name].Visible = false
					end
				end
			end
		end

		if p95.ArtAnimation or p95.Foil then
			if p96 == "Baseplate" or p96 == "EnemyBaseplate" or p96 == "Graveyard" or p96 == "EnemyGraveyard" then
				for _, v in pairs(p95.Physical:GetChildren()) do
					if v.Name == "AnimationPart" or v.Name == "FoilPrism" then
						v.Visible = false
					end
				end
			else
				for _, v in pairs(p95.Physical:GetChildren()) do
					if v.Name == "AnimationPart" or v.Name == "FoilPrism" then
						v.Visible = true
					end
				end
			end
		end

		p95.Position = p96
		p95.Physical.Rotation = 0

		if p96 == "EnemyField" and u80 == true then
			local n3: number = 1

			for i = 1, 8 do
				local children = battleNew["3DEnemyPositions"]["CardPosition" .. i]:GetChildren()

				if not children or #children == 0 then
					n3 = i

					break
				end
			end

			p95.Physical.Parent = battleNew["3DEnemyPositions"]["CardPosition" .. n3]

			if p95.BattleModel then
				print("Battle Model Summoning")
				backgroundModels.SummonModel(p95.BattleModel, n3)
			elseif p95.Id and p95.Physical.Image == "rbxassetid://" .. p95.Id then
				backgroundModels.SummonModel("FillerCard", n3, p95.Physical.Image)
			end
		elseif p96 ~= "EnemyField" or u81 ~= true then
			if u80 == true and p95.Physical.Parent and string.find(p95.Physical.Parent.Name, "CardPosition") then
				local parts = string.split(p95.Physical.Parent.Name, "CardPosition")

				backgroundModels.RemoveModel(parts[2])
			end

			p95.Physical.Parent = battleNew[p96]
		elseif p95.SpecificFieldLocation then
			if battleNew["3DEnemyPositions"][p95.SpecificFieldLocation] and #battleNew["3DEnemyPositions"][p95.SpecificFieldLocation]:GetChildren() == 0 then
				p95.Physical.Parent = battleNew["3DEnemyPositions"][p95.SpecificFieldLocation]
			end
		else
			local n2: number = 1

			for i = 1, 8 do
				if #battleNew["3DEnemyPositions"]["CardPosition" .. i]:GetChildren() == 0 then
					n2 = i

					break
				end
			end

			p95.Physical.Parent = battleNew["3DEnemyPositions"]["CardPosition" .. n2]
		end

		if u80 == true then
			if p96 == "EnemyField" then
				p95.Physical.ImageTransparency = 1
			else
				p95.Physical.ImageTransparency = 0
			end
		end

		if battleNew:FindFirstChild("Virtual" .. p96) then
			utilsClient.IncrementCardBattleAmount()
			p95.Number = n1
			utilsSetZIndex(p95.Physical, battleNew["Virtual" .. p96].Height.Value * p95.Number)

			if p96 == "Baseplate" and battleNew.VirtualBaseplate.BaseplateReminder.ZIndex < battleNew["Virtual" .. p96].Height.Value * p95.Number then
				battleNew.VirtualBaseplate.BaseplateReminder.ZIndex = battleNew["Virtual" .. p96].Height.Value * p95.Number + 1
			end
		end

		battleNew.EnemyHandCount.Text = "x" .. #battleNew.EnemyHand:GetChildren()
		CardAffordable(p95)
		p95.Events.MoveTo:Fire()
	end,
	SetAffordable = function(p98, affordable)
		local physicalAffordable = p98.PhysicalAffordable or MakeAffordableLabel(p98.Physical, p98)

		p98.PhysicalAffordable = physicalAffordable

		if affordable == nil then
			return p98.Affordable
		end

		if affordable == p98.Affordable then
			return
		end

		p98.Affordable = affordable

		local n1: number = if affordable then 0.7 else 0

		animation.AnimateAsync(physicalAffordable, { TextTransparency = 1 - n1 }, 0.2, "Out", "Quad")

		local uiStroke

		if not p98.Physical:FindFirstChild("UIStroke") then
			local x = workspace.CurrentCamera.ViewportSize.X

			uiStroke = Instance.new("UIStroke")

			local uiCorner: UICorner = Instance.new("UICorner")

			uiCorner.CornerRadius = UDim.new(0, 5)
			uiCorner.Parent = p98.Physical
			uiStroke.Parent = p98.Physical
			uiStroke.Name = "UIStroke"
			uiStroke.Transparency = 1
			uiStroke.Thickness = 1 + x / 1000
			uiStroke.Color = Color3.new(1, 1, 1)
		else
			uiStroke = p98.Physical.UIStroke
		end

		animation.AnimateAsync(uiStroke, {
			Transparency = 1 - (if affordable then 0.7 else 0)
		}, 0.2, "Out", "Quad")

		local tweenSizeAndPosition = physicalAffordable.TweenSizeAndPosition
		local uDim2 = UDim2.new(1, 0, 0.1 * n1, 0)
		local uDim24 = UDim2.new(0, 0, -0.1 * n1, 0)

		pcall(tweenSizeAndPosition, physicalAffordable, uDim2, uDim24, "Out", "Quad", 0.25, true)
	end,
	ChangeCard = function(p100, p101)
		for k, v in pairs(p101) do
			if type(v) == "table" then
				if p100[k] == nil then
					p100[k] = {}
				end

				if k == "Cost" then
					for k2, _ in pairs(p100.Cost) do
						p100.Cost[k2] = 0
					end
				end

				for k3, iterValue in pairs(v) do
					p100[k][k3] = iterValue

					if k == "Cost" and p100.PhysicalCost then
						local physicalCost = utilsClient.AutoCost(p100.Physical, v)

						p100.PhysicalCost:Destroy()
						p100.PhysicalCost = physicalCost

						if p100.Position ~= "Hand" then
							p100.PhysicalCost.Visible = false
						end
					end
				end
			else
				p100[k] = v

				if k == "ArtAnimation" then
					for _, iterValue2 in pairs(p100.Physical:GetChildren()) do
						if iterValue2.Name == "AnimationPart" then
							iterValue2:Destroy()
						end
					end

					cardAnim(p100.Physical, p100.ArtAnimation)
				end

				if k == "Id" and p101.ReplacementArt then
					p100[k] = p101.ReplacementArt
				end

				if k == "Id" and p101.Nurtured and p101.NurtureArt then
					p100[k] = p101.NurtureArt
				end

				if k == "BattleModel" then
					print("Card Has Model")
					p100[k] = p101.BattleModel
				end

				if k == "SpecificFieldLocation" then
					print("Card has SpecificFieldLocation")
					p100[k] = p101.SpecificFieldLocation
				end
			end
		end

		if p100.PhysicalHealth then
			p100.PhysicalHealth.Text = p100.Health
			p100.PhysicalPower.Text = p100.Power

			if p100.ObscureStats then
				p100.PhysicalHealth.Text = "????"
				p100.PhysicalPower.Text = "????"
			end

			if tonumber(p100.Health) == 0 and p100.AddHealth then
				p100.PhysicalHealth.Text = "+" .. p100.AddHealth
			end

			if tonumber(p100.Health) == 0 and p100.AddPower then
				p100.PhysicalPower.Text = "+" .. p100.AddPower
			end
		end
	end,
	Flip = function(p102)
		p102.Physical.Image = "rbxassetid://" .. p102.Id
		p102.Physical.Name = p102.CardId

		if not p102.PhysicalHealth then
			local physicalHealth, physicalPower = MakeHealthPowerLabels(p102.Physical, p102)

			p102.PhysicalHealth = physicalHealth
			p102.PhysicalPower = physicalPower
		end

		if not p102.PhysicalPassives then
			p102.PhysicalPassives = MakePassivesHolder(p102.Physical, p102)
		end

		if not p102.PhysicalGear then
			p102.PhysicalGear = MakeGearHolder(p102.Physical, p102)
		end

		if p102.Position and battleNew:FindFirstChild("Virtual" .. p102.Position) then
			utilsSetZIndex(p102.Physical, battleNew["Virtual" .. p102.Position].Height.Value)
		end

		if p102.Foil then
			foilEffect(p102.Physical, p102.LibraryIndex)
		end

		if p102.ArtAnimation then
			local u514: boolean = false

			for _, v in pairs(p102.Physical:GetChildren()) do
				if v.Name == "AnimationPart" then
					u514 = true
				end
			end

			if not u514 then
				cardAnim(p102.Physical, p102.ArtAnimation)
			end
		end

		if p102.Position == "EnemyField" and u80 == true then
			local parts = string.split(p102.Physical.Parent.Name, "CardPosition")

			print("Battle Model Summoning")

			if p102.BattleModel then
				backgroundModels.SummonModel(p102.BattleModel, parts[2])

				return
			end

			backgroundModels.SummonModel("FillerCard", parts[2], p102.Physical.Image)

			return
		end
	end,
	Discard = function(p103)
		if p103.Died then
			return
		end

		if p103.Position ~= "Hand" then
			return
		end

		if not u66 then
			HandReorder()

			return
		end

		if not utilsInvokeServer("DiscardCard", u73, p103.CardId) then
			HandReorder()
		end
	end,
	Baseplate = function(p104)
		if p104.Died then
			return
		end

		if p104.Position ~= "Hand" then
			return
		end

		if not u66 then
			HandReorder()

			return
		end

		if not utilsInvokeServer("BaseplateCard", u73, p104.CardId) then
			HandReorder()
		end
	end,
	Place = function(p105)
		if not u66 then
			HandReorder()
		elseif p105.Position == "Hand" then
			if utilsInvokeServer("ClientGetCardType", u73, p105.CardId) == "Fighter" then
				local t21 = utilsInvokeServer("GetField", u73) or {}
				local t22 = utilsInvokeServer("GetBattleRules", u73) or {}
				local n1: number = 0

				for _, _ in pairs(t21) do
					n1 += 1
				end

				if n1 + 1 > t22.FieldCap and u92 == false then
					t4 = p105.CardId
					battleNew.FullBoardNotice.Visible = true
					HandReorder()

					return
				end
			end

			if not utilsInvokeServer("PlaceCard", u73, p105.CardId) then
				HandReorder()
			end

			return
		end
	end,
	RemovePhysical = function(p106)
		p106.Died = true

		if p106 == inspection.CurrentCard then
			p106.Name = nil
			inspection.Hide()
		end

		if p106 == selectedcard then
			DeselectCard()
		end

		if u80 == true and p106.Physical.Parent and string.find(p106.Physical.Parent.Name, "CardPosition") then
			local parts = string.split(p106.Physical.Parent.Name, "CardPosition")

			backgroundModels.RemoveModel(parts[2])
		end

		if p106.Physical and u65 then
			animation.Animate(p106.Physical, { ImageTransparency = 1 }, 0.16, "In", "Quad")
			p106.Physical:Destroy()
		elseif p106.Physical then
			p106.Physical:Destroy()
		end
	end
}
local t12: {[any]: any} = { __index = battleCutscenes }

function battleCutscenes.new(p107, p108, _)
	if not u65 then
		return
	end

	utilsClient.IncrementCardBattleAmount()

	local object = setmetatable(p107, t12)
	object.Locked = object.Locked or { IsLocked = false, TurnsLeft = 0 }

	object.Number = n1
	object.Maid = maid.new()

	if not p108 then
		local v532 = p108

		v532 = Instance.new("ImageButton")
		p108 = v532
		p108.BackgroundTransparency = 1
		p108.Name = p107.CardId
		p108.Image = "rbxassetid://" .. p107.Id
		p108.ZIndex = configCardzindex

		local physicalHealth, physicalPower = MakeHealthPowerLabels(p108, p107)
		local physicalPassives = MakePassivesHolder(p108, p107)
		local physicalGear = MakeGearHolder(p108, p107)
		local physicalCost = utilsClient.AutoCost(p108, object.Cost)

		object.PhysicalHealth = physicalHealth
		object.PhysicalPower = physicalPower
		object.PhysicalPassives = physicalPassives
		object.PhysicalCost = physicalCost
		object.PhysicalGear = physicalGear

		if p107.Foil then
			foilEffect(p108, p107.LibraryIndex)
		end

		if p107.ArtAnimation then
			cardAnim(p108, p107.ArtAnimation, p107.Foil)
		end
	end

	if p107.BattleModel then
		print("Card Has Model")
		object.BattleModel = p107.BattleModel
	end

	if p107.SpecificFieldLocation then
		print("Card Has SpecificFieldLocation")
		object.SpecificFieldLocation = p107.SpecificFieldLocation
	end

	if p107.NoFieldMovement then
		object.NoFieldMovement = p107.NoFieldMovement
	end

	object.Physical = p108
	object.Events = {}
	object.Events.MoveTo = signal.new()

	for k, v in pairs(passiveEffects) do
		if p107[k] then
			v(object, battleNew)
		end
	end

	local function onAbove(p110)
		if p110 then
			if not p107.DiscardBlock and not p107.Undiscardable then
				local animationAnimateAsync = animation.AnimateAsync
				local battleNewVirtualGraveyard = battleNew.VirtualGraveyard
				local color3 = Color3.fromRGB(240, 58, 58)

				animationAnimateAsync(battleNewVirtualGraveyard, { BackgroundColor3 = color3 }, 0.3, "Out", "Quad")
			end

			local animateAsync = animation.AnimateAsync
			local battleNewVirtualBaseplate = battleNew.VirtualBaseplate
			local color3 = Color3.fromRGB(82, 194, 89)

			animateAsync(battleNewVirtualBaseplate, { BackgroundColor3 = color3 }, 0.3, "Out", "Quad")

			local v1332 = animation.AnimateAsync
			local battleNewVirtualField = battleNew.VirtualField
			local color311 = Color3.fromRGB(44, 167, 232)

			v1332(battleNewVirtualField, { BackgroundColor3 = color311 }, 0.3, "Out", "Quad")

			return
		end

		local v1335 = animation.AnimateAsync
		local virtualGraveyard = battleNew.VirtualGraveyard
		local color3 = Color3.fromRGB(0, 0, 0)

		v1335(virtualGraveyard, { BackgroundColor3 = color3 }, 0.3, "Out", "Quad")

		local v1338 = animation.AnimateAsync
		local virtualBaseplate = battleNew.VirtualBaseplate
		local color312 = Color3.fromRGB(0, 0, 0)

		v1338(virtualBaseplate, { BackgroundColor3 = color312 }, 0.3, "Out", "Quad")

		if not u66 then
			local v1341 = animation.AnimateAsync
			local virtualField = battleNew.VirtualField
			local color313 = Color3.fromRGB(0, 0, 0)

			v1341(virtualField, { BackgroundColor3 = color313 }, 0.3, "Out", "Quad")

			return
		end

		local v1344 = animation.AnimateAsync
		local v1345 = battleNew.VirtualField
		local color314 = Color3.fromRGB(0, 100, 167)

		v1344(v1345, { BackgroundColor3 = color314 }, 0.3, "Out", "Quad")
	end

	object.Maid:GiveTask(p108.MouseEnter:connect(function()
		inspection.Inspect(object)
	end))
	object.Maid:GiveTask(p108.MouseMoved:connect(function()
		if object.Name then
			inspection.Move()
			inspection.Inspect(object)
		end
	end))
	object.Maid:GiveTask(p108.MouseLeave:connect(function()
		inspection.Hide()
	end))
	object.Maid:GiveTask(p108.SelectionLost:connect(function()
		inspection.Hide()

		if userInputService.GamepadEnabled ~= true then
			DeselectCard()
		end
	end))

	if u62 then
		return object
	end

	object.Maid:GiveTask(p108.MouseButton2Click:connect(function()
		if p107.Position ~= "Hand" then
			return
		end

		if battleNew.VirtualBaseplate.Reminder.Value == true and p107.Color ~= "Neutral" then
			object:Baseplate()

			return
		end

		object:Discard()
	end))
	object.Maid:GiveTask(p108.MouseButton1Down:Connect(function()
		if u63 then
		elseif not object.Died and p107.Position == "Hand" then
			local function IsHovering(p111, p112)
				return p111.AbsolutePosition.X < p112.X.Offset and p112.X.Offset < p111.AbsolutePosition.X + p111.AbsoluteSize.X and p111.AbsolutePosition.Y < p112.Y.Offset and p112.Y.Offset < p111.AbsolutePosition.Y + p111.AbsoluteSize.Y
			end

			local v1348 = UDim2.fromOffset(mouse.X, mouse.Y)

			local function closeEnough(p113)
				local u1401: boolean = false

				if math.abs(p113.X.Offset - v1348.X.Offset) < p108.AbsoluteSize.X / 2 then
					u1401 = math.abs(p113.Y.Offset - v1348.Y.Offset) < p108.AbsoluteSize.X / 2
				end

				return u1401
			end

			u63 = true

			local u1350: boolean = true
			local clone = p108:Clone()

			p108.Visible = false

			local connection = nil
			local connection2 = nil
			local connection4 = nil
			local connection3 = nil

			local function EndDrag(p114)
				if not u63 then
					return
				end

				u63 = false
				p108.Size = clone.Size
				p108.Position = UDim2.fromOffset(mouse.X - p108.AbsoluteSize.X / 4, mouse.Y - p108.AbsoluteSize.Y / 4)
				p108.Visible = true

				local clonePosition = clone.Position

				connection:Disconnect()
				connection3:Disconnect()

				if connection2 then
					connection2:Disconnect()
				end

				connection4:Disconnect()
				clone:Destroy()
				inspection.Hide()

				if p114 then
					return
				end

				if not t6.fieldhover and not IsHovering(battleNew.VirtualField, clonePosition) and (not u1350 or not not u57) then
					if t6.bphover or IsHovering(battleNew.VirtualBaseplate, clonePosition) then
						p107:Baseplate()

						return
					end

					if not t6.discardhover and not IsHovering(battleNew.VirtualGraveyard, clonePosition) then
						HandRedraw()

						return
					end

					p107:Discard()

					return
				end

				p107:Place()
			end

			connection = userInputService.InputEnded:Connect(function(input: InputObject, gameProcessedEvent: boolean)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement or input.KeyCode == Enum.KeyCode.ButtonA then
					EndDrag()
				end
			end)

			if u57 then
				task.spawn(function()
					inspection.Inspect(object)
				end)
				connection2 = userInputService.TouchEnded:Connect(function()
					EndDrag()
				end)
			end

			connection3 = p108.AncestryChanged:Connect(function()
				EndDrag()
			end)
			utilsSetZIndex(clone, 999999)
			clone.Position = UDim2.fromOffset(mouse.X, mouse.Y)
			clone.AnchorPoint = Vector2.new(0.5, 0.5)
			clone.Parent = u4.Effect

			local animationAnimateAsync = animation.AnimateAsync
			local v1358 = UDim2.fromOffset(clone.AbsoluteSize.X * 1.3, clone.AbsoluteSize.Y * 1.3)

			animationAnimateAsync(clone, { Size = v1358 }, 0.4, "Out", "Quad")

			local x = clone.AbsolutePosition.X

			connection4 = stepped:Connect(function()
				if not u65 and u63 then
					u63 = false
					p108.Size = clone.Size
					p108.Position = UDim2.fromOffset(mouse.X - p108.AbsoluteSize.X / 4, mouse.Y - p108.AbsoluteSize.Y / 4)
					p108.Visible = true

					local clonePosition = clone.Position

					connection:Disconnect()
					connection3:Disconnect()

					if connection2 then
						connection2:Disconnect()
					end

					connection4:Disconnect()
					clone:Destroy()
					inspection.Hide()
				end

				if u1350 then
					local v1407 = UDim2.fromOffset(mouse.X, mouse.Y)
					local u1408: boolean = false

					if math.abs(v1407.X.Offset - v1348.X.Offset) < p108.AbsoluteSize.X / 2 then
						u1408 = math.abs(v1407.Y.Offset - v1348.Y.Offset) < p108.AbsoluteSize.X / 2
					end

					if not u1408 then
						u1350 = false
						inspection.Hide()

						if u57 then
							local u1409: boolean = false

							task.spawn(function()
								if u1409 then
									audioService.PlaySound("click1")

									local animationAnimateAsync = animation.AnimateAsync
									local battleNewVirtualHand = battleNew.VirtualHand
									local v1432 = UDim2.fromScale(0.65, 0.265)

									animationAnimateAsync(battleNewVirtualHand, { Size = v1432 }, 0.1, "Out", "Quad")

									local animationAnimate = animation.Animate
									local battleNewVirtualField = battleNew.VirtualField

									v1432 = UDim2.fromScale(0.7, 0.225)

									local v1435 = UDim2.fromScale(0.5, 0.61)

									animationAnimate(battleNewVirtualField, { Size = v1432, Position = v1435 }, 0.1, "Out", "Quad")
								else
									animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
									animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
								end

								HandRedraw()
								FieldRedraw()
							end)
						end
					end
				end

				if x - clone.AbsoluteSize.X / 4 > clone.AbsolutePosition.X then
					clone.Rotation = 10
				elseif x + clone.AbsoluteSize.X / 4 < clone.AbsolutePosition.X then
					clone.Rotation = -10
				end

				x = clone.AbsolutePosition.X

				local animationAnimateAsync = animation.AnimateAsync
				local v1411 = UDim2.fromOffset(mouse.X, mouse.Y)

				animationAnimateAsync(clone, { Rotation = 0, Position = v1411 }, 0.1, "Out", "Quad")
			end)

			return
		end
	end))

	if not u58 then
		object.Maid:GiveTask(p108.MouseButton1Click:connect(function()
			if userInputService.GamepadEnabled == true then
				return
			end

			if object.Died or p107.Position == "EnemyHand" then
				return
			end

			if u71 then
				if p107.Position == "Field" or p107.Position == "EnemyField" then
					TargetCard(p107)
				end

				return
			end

			if p107.Position == "Hand" then
				p107:Place()
			end

			if p107.Position == "Field" then
				if u57 then
					local u1360: boolean = false

					task.spawn(function()
						if u1360 then
							audioService.PlaySound("click1")

							local animationAnimateAsync = animation.AnimateAsync
							local battleNewVirtualHand = battleNew.VirtualHand
							local v1414 = UDim2.fromScale(0.65, 0.265)

							animationAnimateAsync(battleNewVirtualHand, { Size = v1414 }, 0.1, "Out", "Quad")

							local animationAnimate = animation.Animate
							local battleNewVirtualField = battleNew.VirtualField

							v1414 = UDim2.fromScale(0.7, 0.225)

							local v1417 = UDim2.fromScale(0.5, 0.61)

							animationAnimate(battleNewVirtualField, { Size = v1414, Position = v1417 }, 0.1, "Out", "Quad")
						else
							animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
							animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
						end

						HandRedraw()
						FieldRedraw()
					end)
				end

				if p107.Locked.IsLocked then
					warn("Card is locked")

					return
				end

				SelectCard(p107)

				return
			end

			if p107.Position ~= "EnemyField" then
				return
			end

			if not selectedcard then
				warn("No selected card")

				return
			end

			AttackCard(p107)
		end))
	end

	if u58 then
		object.Maid:GiveTask(p108.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch or userInputService.GamepadEnabled ~= true then
			elseif not object.Died and p107.Position ~= "EnemyHand" then
				if u71 then
					if p107.Position == "Field" or p107.Position == "EnemyField" then
						TargetCard(p107)
					end

					return
				end

				if p107.Position == "Field" then
					if u57 then
						local u1362: boolean = false

						task.spawn(function()
							if u1362 then
								audioService.PlaySound("click1")

								local animationAnimateAsync = animation.AnimateAsync
								local battleNewVirtualHand = battleNew.VirtualHand
								local v1420 = UDim2.fromScale(0.65, 0.265)

								animationAnimateAsync(battleNewVirtualHand, { Size = v1420 }, 0.1, "Out", "Quad")

								local animationAnimate = animation.Animate
								local battleNewVirtualField = battleNew.VirtualField

								v1420 = UDim2.fromScale(0.7, 0.225)

								local v1423 = UDim2.fromScale(0.5, 0.61)

								animationAnimate(battleNewVirtualField, { Size = v1420, Position = v1423 }, 0.1, "Out", "Quad")
							else
								animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
								animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
							end

							HandRedraw()
							FieldRedraw()
						end)
					end

					if p107.Locked.IsLocked then
						warn("Card is locked")

						return
					end

					SelectCard(p107)

					return
				end

				if p107.Position ~= "EnemyField" then
					return
				end

				if not selectedcard then
					warn("No selected card")

					return
				end

				AttackCard(p107)

				return
			end
		end))
	end

	return object
end

local battleCutscenesNew = battleCutscenes.new

print("Battle logic")

local t13: {[any]: any} = {}
local u164 = nil
local u165 = nil
local u166 = nil
local u167 = nil
local battleNewTrash = battleNew.Trash
local v169 = pairs
local v170 = Instance.new
local n5 = 0
local u172 = nil
local n6: number = 0
local u174: boolean = false
local battleNewForfeit = battleNew.Forfeit

u172 = function()
	v88("Forfeit disabled")
	battleNewForfeit.Visible = false
end

function utilsClient.EnableForfeit()
	v88("Forfeit enabled")
	battleNewForfeit.Visible = true
	n6 = 0
	u174 = false
end

battleNewForfeit.MouseButton1Down:connect(function()
	n6 += 1

	if n6 > 4 then
		battleNewForfeit.Title.Text = "Forfeited!"
		v88("Forfeited")
		utilsFireServer("Forfeit", u73)
		n6 = 0
	elseif n6 == 4 then
		battleNewForfeit.Title.Text = "Click once more"
	else
		battleNewForfeit.Title.Text = "Click " .. 4 - n6 .. " more times"
	end

	if n6 <= 4 and not u174 then
		u174 = true

		local vector2 = Vector2.new(fakeMouse.fakemouse.X, fakeMouse.fakemouse.Y)

		v88("Entered loop")

		repeat
			task.wait()

			local vector23 = Vector2.new(fakeMouse.fakemouse.X, fakeMouse.fakemouse.Y)
		until (vector23 - vector2).magnitude > 50 or n6 > 4

		v88("Left loop")
		n6 = 0
		battleNewForfeit.Title.Text = "Forfeit"
		u174 = false
	end
end)

local function GetAttackStrength(p118)
	if p118 < 350 then
		return "Small"
	end

	if p118 >= 350 and p118 < 700 then
		return "Mid"
	end

	return "Large"
end

u141 = function()
	if not u164 then
		return 4
	end

	return u164.StageCap
end
u140 = function()
	if not u164 then
		return 8
	end

	return u164.FieldCap
end
u139 = function()
	if not u164 then
		return 10
	end

	return u164.HandCap
end

function utilsClient.ToggleBlackScreen(p125)
	if p125 == true then
		transition.ToggleBlack(1)
		transition.HideBattleBack()

		return
	end

	transition.ShowBattleBack()
	transition.ToggleBlack(-1)
end
function utilsClient.ShowHand()
	handy.Show()
end
function utilsClient.GameEnd(p126, p127, p128, p129)
	if not u65 then
		warn("GameEnd Game ended without being in game.")

		return
	end

	utilsClient.SetControlsEnabled(true)
	u65 = false
	pcall(function()
		utilsClient.DestroyEffectCard(nil, nil, nil, true, true)
	end)
	pcall(utilsClient.SetBaseplateLocked, false, true)

	if u67 then
		u67 = false
	end

	if u68 then
		u68 = false
	end

	u79 = false
	battleNew.VirtualEffectStage.Effect.Visible = false
	t9 = { addingicons = 0, attacking = 0 }
	u4.DiscardHere.Visible = false
	battleNew.EnemyGenCount.Text = ""
	battleNew.GenCount.Text = ""
	transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
	transition.ToggleBlack(1)
	audioService.ChangeSong()
	n5 = 0
	u73 = nil
	utilsClient.battleId = nil

	if playerGui:FindFirstChild("DodgeModeUI") and playerGui:FindFirstChild("DodgeModeUI").Enabled == true then
		playerGui:FindFirstChild("DodgeModeUI").Enabled = false
	end

	for iterFirst, iterSecond in v169(allcards) do
		pcall(function()
			iterSecond:RemovePhysical()
		end)
	end

	allcards = {}

	for iterFirst2, iterSecond2 in v169(u4.Effect:GetChildren()) do
		iterSecond2:Destroy()
	end

	t13 = {}
	n1 = 1
	u75 = false
	u76 = false

	for iterFirst3, iterSecond3 in v169({ battleNew.HandSlots.HandSlots, battleNew.HandSlots.EnemyHandSlots }) do
		for iterFirst4, iterSecond4 in v169(iterSecond3:GetChildren()) do
			iterSecond4.Visible = false
		end
	end

	u66 = false
	u164 = nil
	u167 = nil
	u70 = nil
	u69 = nil
	u62 = false
	u60 = nil
	s1 = nil
	closeBPC()
	u117()
	EnableEndTurnButton()

	local color3 = Color3.fromRGB(0, 0, 0)

	for iterFirst5, iterSecond5 in v169({
		battleNew.VirtualField,
		battleNew.VirtualHand,
		battleNew.VirtualDeck,
		battleNew.VirtualEnemyField,
		battleNew.VirtualEnemyDeck,
		battleNew.VirtualEnemyHand
		}) do
		iterSecond5.BackgroundColor3 = color3
	end

	for iterFirst6, iterSecond6 in v169(battleNew:GetChildren()) do
		if iterSecond6:IsA("Folder") and iterSecond6.Name ~= "Trash" and iterSecond6.Name ~= "HandSlots" and iterSecond6.Name ~= "3DEnemyPositions" then
			iterSecond6:ClearAllChildren()
		end
	end

	utilsClient.UnmuteWorld()
	utilsClient.ResetBattleBackParticles()
	battleNew.Icons:ClearAllChildren()
	battleNew.EnemyIcons:ClearAllChildren()
	battleNew.EndTurn.Visible = false
	u4.Icons:ClearAllChildren()
	battleNew.Visible = false
	utilsClient.UpdateWorld()
	transition.HideBattleBack()

	if not p126 and not p127 and not p128 then
		transition.ToggleBlur(-1)
		u165 = nil
		u166 = nil
		u4.FakeTopBar.BlackBar.Visible = false

		return
	end

	u4.FakeTopBar.BlackBar.Visible = false
	utilsClient.ShowBattleOutro(u166, u165, p126, p127, p128, p129)
	u165 = nil
	u166 = nil
	transition.ToggleBlur(-1)
	task.spawn(function()
		handy.Show()
		handy.Expand()
		audioService.ChangeSong("Lobby")
	end)
end
function utilsClient.SilentlyLeaveBattle()
	transition.ToggleBlur(-1)
	transition.ToggleBlack(-1, 0.3)
	task.spawn(function()
		handy.Show()
		handy.Expand()
		audioService.ChangeSong("Lobby")
	end)
end
function utilsClient.SetEnemySleeve(p130)
	s1 = sleevesSleeves[p130][1]
	v88("Got Enemy Sleeve", p130, s1)
end
function utilsClient.SetPlayerSleeve(p131)
	u60 = sleevesSleeves[p131][1]
	v88("Got Pov Sleeve", p131, u60)
end
function utilsClient.ShowFoilAnimation(p132)
	ShowEffectAnimation("", p132, nil, "Foil")
end
function utilsClient.IncrementCardBattleAmount()
	n1 += 10

	if n1 > 50000 then
		n1 = 1
	end
end
function utilsClient.TurnOffReminders()
	u79 = true
end

local opponentWaiter = playerGui:WaitForChild("Waiter"):WaitForChild("OpponentWaiter")
local reminderLabel = opponentWaiter:WaitForChild("ReminderLabel")

local v179 = (function(parent, p120, list, _, _, _)
	parent.ImageRectSize = p120 or Vector2.new(341.3, 341.3)

	local v571 = list and list[1] or 3
	local v572 = list and list[2]
	local intValue: IntValue = Instance.new("IntValue")

	intValue.Parent = parent
	intValue.Value = 0
	intValue.Changed:Connect(function()
		local intValueValue = intValue.Value
		local vector2New = Vector2.new
		local n1 = intValueValue % v571 * parent.ImageRectSize.X
		local floored = math.floor(intValueValue / v571)

		parent.ImageRectOffset = vector2New(n1, floored * parent.ImageRectSize.Y)
	end)

	return intValue
end)(opponentWaiter:WaitForChild("RunFrame"):WaitForChild("Nub"), Vector2.new(341.3, 341.3), { 3, 3 }, 1, 9)

function utilsClient.StartWaiter()
	handy.Hide()
	reminderLabel.Text = "Waiting for the opponent to load into the server..."
	opponentWaiter.Visible = true
	task.delay(30, function()
		if opponentWaiter.Visible then
			opponentWaiter.Cancel.Visible = true
		end
	end)
	task.spawn(function()
		while opponentWaiter.Visible do
			for i = 0, 8 do
				v179.Value = i
				task.wait(0.08333333333333333)
			end
		end
	end)
end
function utilsClient.UpdateWaiter()
	audioService.PlaySound("Target Or Select Low")
	reminderLabel.Text = "Your opponent has joined the server! Letting them load in..."
	reminderLabel.TextColor3 = Color3.fromRGB(4, 255, 0)

	local animationAnimateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(255, 255, 255)

	animationAnimateAsync(reminderLabel, { TextColor3 = color3 }, 2, "Out", "Quad")
end
function utilsClient.StopWaiter()
	opponentWaiter.Visible = false
end

opponentWaiter.Cancel.MouseButton1Click:Connect(function()
	utilsClient.StopWaiter()
	handy.Show()
end)

local function HideNonBattleUI()
	local t23: {[any]: any} = { "QuestMenu", "OmniShop", "DeckBuilder3", "AifeFrame" }

	task.spawn(function()
		while u65 == true do
			task.wait(3)

			for iterFirst, iterSecond in v169(t23) do
				if u4:FindFirstChild(iterSecond) and u4:FindFirstChild(iterSecond).Visible == true then
					print("hiding menu " .. iterSecond)
					u4:FindFirstChild(iterSecond).Visible = false
				end
			end
		end
	end)
end
function utilsClient.StartBattleQuick(p133, p134, p135, p136)
	handy.Hide()
	utilsClient.SetControlsEnabled(false)
	transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))
	transition.ToggleBlack(1)

	for iterFirst, iterSecond in v169({ "OmniShop", "DeckBuilder3" }) do
		u4[iterSecond].Visible = false
	end

	utilsClient.MuteWorld()
	u165 = p134
	u166 = p133

	if not p136.Puzzle then
		battleNew.ObjectiveText.Visible = false
		battleNew.staticObjective.Visible = false
		battleNew.EndTurn.Title.Text = "END TURN"
	else
		battleNew.EndTurn.Title.Text = "RESTART"
		battleNew.staticObjective.Visible = true
		battleNew.ObjectiveText.Visible = true
		battleNew.ObjectiveText.Text = p136.Objective
		transition.ToggleBlack(1, 0.2)
	end

	if battleNew.EndTurnNotice.Visible == true then
		battleNew.EndTurnNotice.Visible = false
	end

	HideEndTurnButton()

	if p136.CustomBack then
		transition.ShowNewBattleBack(p136.CustomBack)
	else
		transition.ShowNewBattleBack()
	end

	if p136.IsFloorBattle then
		battleNew.WaveCounter.Visible = true
		audioService.ChangeSong()
		transition.ToggleBlack(-1)
		task.wait(12)
	else
		battleNew.WaveCounter.Visible = false
	end

	utilsClient.ResetBattleBackParticles()
	n1 = 1
	battleNew.TideCounter.Visible = false
	battleNew.EnemyTideCounter.Visible = false
	battleNew.DFCounter.Visible = false
	battleNew.EnemyDFCounter.Visible = false
	battleNew.ImmortalDeckLeft.Visible = false
	battleNew.EnemyImmortalDeckLeft.Visible = false
	battleNew.ViewOtherHand.Visible = false
	battleNew.Visible = true
	u164 = p136
	u4.FakeTopBar.BlackBar.Visible = true

	if p136.CustomPositions then
		battleNew.VirtualEnemyField.Visible = false
		u81 = true

		if battle3dPositions[p136.CustomPositions] then
			for iterFirst2, iterSecond2 in v169(battle3dPositions[p136.CustomPositions]) do
				if not battleNew.Virtual3DEnemyPositions:FindFirstChild(iterFirst2) then
					warn("Slot not found for " .. iterFirst2)

					local frame: Frame = Instance.new("Frame")

					frame.BackgroundTransparency = 1
					frame.AnchorPoint = Vector2.new(0.5, 0.5)
					frame.Parent = battleNew.Virtual3DEnemyPositions
					frame.Position = iterSecond2.Position
					frame.Size = iterSecond2.Size
					frame.Name = iterFirst2
				else
					local v586 = battleNew.Virtual3DEnemyPositions[iterFirst2]

					v586.Position = battle3dPositions[p136.CustomPositions][iterFirst2].Position
					v586.Size = battle3dPositions[p136.CustomPositions][iterFirst2].Size
				end

				if not battleNew["3DEnemyPositions"]:FindFirstChild(iterFirst2) then
					local folder: Folder = Instance.new("Folder")

					folder.Name = iterFirst2
					folder.Parent = battleNew["3DEnemyPositions"]
				end
			end
		end
	else
		u81 = false
	end

	if p136.Background3D then
		u80 = true
		battleNew.VirtualEnemyField.Visible = false

		if battle3dPositions[p136.CustomBack] then
			print("Custom Battle Positions found")

			for i = 1, 8 do
				if battleNew.Virtual3DEnemyPositions["CardPosition" .. i] then
					local v589 = battleNew.Virtual3DEnemyPositions["CardPosition" .. i]

					v589.Position = battle3dPositions[p136.CustomBack][i].Position
					v589.Size = battle3dPositions[p136.CustomBack][i].Size
				end
			end
		end
	else
		u80 = false
	end

	if p136.DodgeMode then
		if p136.DodgeMode == "AuteurFight" then
			battleNew.VirtualEnemyBaseplate.Visible = false
			battleNew.VirtualEnemyDeck.Visible = false
			battleNew.VirtualEnemyGraveyard.Visible = false
			battleNew.VirtualEnemyHand.Visible = false
			battleNew.VirtualBaseplate.Visible = false
			battleNew.VirtualDeck.Visible = false
			battleNew.VirtualGraveyard.Visible = false
			battleNew.EnemyIconHolderSlots.Visible = false
			battleNew.IconHolderSlots.Visible = false
			battleNew.EnemyHandCount.Visible = false
			battleNew.TurnIndicatorEnemy.Visible = false
			u4.ClipToDeviceSafeArea = false
			battleNew.ClipsDescendants = false
			battleNew.TimeLeft.Visible = false

			if p133.userId == LocalPlayer.userId or p133.SubPhysical and p133.SubPhysical.userId == LocalPlayer.userId then
				audioService.ChangeSong()
				transition.ToggleBlack(-1)
				ShowEffectAnimation("", nil, nil, "TranscendentIntro")
			end
		end

		playerGui:FindFirstChild("DodgeModeUI").Enabled = true
	else
		battleNew.VirtualEnemyBaseplate.Visible = true
		battleNew.VirtualEnemyDeck.Visible = true
		battleNew.VirtualEnemyGraveyard.Visible = true
		battleNew.VirtualEnemyHand.Visible = true
		battleNew.VirtualBaseplate.Visible = true
		battleNew.VirtualDeck.Visible = true
		battleNew.VirtualGraveyard.Visible = true
		battleNew.EnemyIconHolderSlots.Visible = true
		battleNew.IconHolderSlots.Visible = true
		battleNew.EnemyHandCount.Visible = true
		u4.ClipToDeviceSafeArea = true
		battleNew.ClipsDescendants = true
		battleNew.TurnIndicatorEnemy.Visible = true
		battleNew.TimeLeft.Visible = true
	end

	if not p136.Background3D and not p136.CustomPositions then
		battleNew.VirtualEnemyField.Visible = true
	end

	u70 = if p133.userId == LocalPlayer.userId then "You" else p133.Name

	if p133.userId ~= LocalPlayer.userId then
		u62 = true
		u69 = 1
	else
		if p133.SubPhysical then
			battleNew.ViewOtherHand.Visible = true
		end

		u62 = false
	end

	if p133.SubPhysical and p133.SubPhysical.userId == LocalPlayer.userId then
		u62 = false
	end

	if p133.SubPhysical and p133.SubPhysical.userId == LocalPlayer.userId then
		warn("Disabled Spectating check due to SubPhysical Match")
		u62 = false
		battleNew.ViewOtherHand.Visible = true
	end

	battleNew.EndSpectate.Visible = not not u62
	u73 = p135
	utilsClient.battleId = u73
	u65 = true
	NewFace("Enemy", nil, nil, p134.PlayerImageId, p134.SubPhysical)
	NewFace("", nil, nil, p133.PlayerImageId, p133.SubPhysical)
	UpdateDeckTop()
	UpdateDeckTop("Enemy")

	if p136.StartCutscene then
		battleNew.Visible = false
		task.spawn(function()
			task.wait(1)
			audioService.ChangeSong(u164.Song or "Battle")
		end)
		battleCutscenesBattleCutscenes(p136.StartCutscene)
		battleNew.Visible = true
		transition.ToggleBlack(-1)
	else
		transition.ToggleBlack(-1)
		task.spawn(function()
			task.wait(1)
			audioService.ChangeSong(u164.Song or "Battle")
		end)
	end

	HideNonBattleUI()
	utilsClient.TurnOnIndicationAnimation()
end
function utilsClient.StartBattle(p137, p138, p139, p140)
	utilsClient.SetControlsEnabled(false)
	handy.Hide()
	transition.ToggleBlur(1, 0.2)
	transition.ToggleBlackColor(Color3.fromRGB(0, 0, 0))

	for iterFirst, iterSecond in v169({ "OmniShop", "DeckBuilder3", "UnpackScreen" }) do
		u4[iterSecond].Visible = false
	end

	audioService.ChangeSong()
	utilsClient.MuteWorld()
	u165 = p138
	u166 = p137

	if not p140.Puzzle then
		battleNew.ObjectiveText.Visible = false
		battleNew.staticObjective.Visible = false
		battleNew.EndTurn.Title.Text = "END TURN"
		utilsClient.ShowBattleIntro(p137, p138)
	else
		battleNew.EndTurn.Title.Text = "RESTART"
		battleNew.staticObjective.Visible = true
		battleNew.ObjectiveText.Visible = true
		battleNew.ObjectiveText.Text = p140.Objective
		transition.ToggleBlack(1, 0.2)
	end

	if battleNew.EndTurnNotice.Visible == true then
		battleNew.EndTurnNotice.Visible = false
	end

	if p140.IsFloorBattle then
		battleNew.WaveCounter.Visible = true
	else
		battleNew.WaveCounter.Visible = false
	end

	HideEndTurnButton()
	task.wait(1.5)

	if p140.CustomBack then
		transition.ShowNewBattleBack(p140.CustomBack)
	else
		transition.ShowNewBattleBack()
	end

	transition.ToggleBlur(-1)
	utilsClient.ResetBattleBackParticles()
	n1 = 1
	battleNew.TideCounter.Visible = false
	battleNew.EnemyTideCounter.Visible = false
	battleNew.DFCounter.Visible = false
	battleNew.EnemyDFCounter.Visible = false
	battleNew.ImmortalDeckLeft.Visible = false
	battleNew.EnemyImmortalDeckLeft.Visible = false
	battleNew.ViewOtherHand.Visible = false
	battleNew.Visible = true

	if p140.CustomPositions then
		u81 = true

		if battle3dPositions[p140.CustomPositions] then
			for iterFirst2, iterSecond2 in v169(battle3dPositions[p140.CustomPositions]) do
				if not battleNew.Virtual3DEnemyPositions:FindFirstChild(iterFirst2) then
					warn("Slot not found for " .. iterFirst2)

					local frame: Frame = Instance.new("Frame")

					frame.BackgroundTransparency = 1
					frame.Parent = battleNew.Virtual3DEnemyPositions
					frame.Position = iterSecond2.Position
					frame.Size = iterSecond2.Size
					frame.Name = iterFirst2
				else
					local v599 = battleNew.Virtual3DEnemyPositions[iterFirst2]

					v599.Position = battle3dPositions[p140.CustomPositions][iterFirst2].Position
					v599.Size = battle3dPositions[p140.CustomPositions][iterFirst2].Size
				end

				if not battleNew["3DEnemyPositions"]:FindFirstChild(iterFirst2) then
					local folder: Folder = Instance.new("Folder")

					folder.Name = iterFirst2
					folder.Parent = battleNew["3DEnemyPositions"]
				end
			end
		end
	else
		u81 = false
	end

	if p140.Background3D then
		u80 = true
		battleNew.VirtualEnemyField.Visible = false

		if battle3dPositions[p140.CustomBack] then
			for i = 1, 8 do
				if battleNew.Virtual3DEnemyPositions["CardPosition" .. i] then
					local v602 = battleNew.Virtual3DEnemyPositions["CardPosition" .. i]

					v602.Position = battle3dPositions[p140.CustomBack][i].Position
					v602.Size = battle3dPositions[p140.CustomBack][i].Size
				end
			end
		end
	else
		battleNew.VirtualEnemyField.Visible = true
		u80 = false
	end

	if p140.DodgeMode then
		if p140.DodgeMode == "AuteurFight" then
			battleNew.VirtualEnemyBaseplate.Visible = false
			battleNew.VirtualEnemyDeck.Visible = false
			battleNew.VirtualEnemyGraveyard.Visible = false
			battleNew.VirtualEnemyHand.Visible = false
			battleNew.VirtualBaseplate.Visible = false
			battleNew.VirtualDeck.Visible = false
			battleNew.VirtualGraveyard.Visible = false
			battleNew.EnemyIconHolderSlots.Visible = false
			battleNew.IconHolderSlots.Visible = false
			battleNew.EnemyHandCount.Visible = false
			u4.ClipToDeviceSafeArea = false
			battleNew.ClipsDescendants = false
			battleNew.TurnIndicatorEnemy.Visible = false
			battleNew.TimeLeft.Visible = false
		end

		playerGui:FindFirstChild("DodgeModeUI").Enabled = true
	else
		battleNew.VirtualEnemyBaseplate.Visible = true
		battleNew.VirtualEnemyDeck.Visible = true
		battleNew.VirtualEnemyGraveyard.Visible = true
		battleNew.VirtualEnemyHand.Visible = true
		battleNew.VirtualBaseplate.Visible = true
		battleNew.VirtualDeck.Visible = true
		battleNew.VirtualGraveyard.Visible = true
		battleNew.EnemyIconHolderSlots.Visible = true
		battleNew.IconHolderSlots.Visible = true
		battleNew.EnemyHandCount.Visible = true
		u4.ClipToDeviceSafeArea = true
		battleNew.ClipsDescendants = true
		battleNew.TurnIndicatorEnemy.Visible = true
		battleNew.TimeLeft.Visible = true
	end

	u164 = p140
	u4.FakeTopBar.BlackBar.Visible = true
	u70 = if p137.userId == LocalPlayer.userId then "You" else p137.Name

	if p137.userId ~= LocalPlayer.userId then
		u62 = true
		u69 = 1
	else
		u62 = false

		if p137.SubPhysical then
			battleNew.ViewOtherHand.Visible = true
		end
	end

	if p137.SubPhysical and p137.SubPhysical.userId == LocalPlayer.userId then
		warn("Disabled Spectating check due to SubPhysical Match")
		u62 = false
		battleNew.ViewOtherHand.Visible = true
	end

	battleNew.EndSpectate.Visible = not not u62
	u73 = p139
	utilsClient.battleId = u73
	u65 = true
	NewFace("Enemy", nil, nil, p138.PlayerImageId, p138.SubPhysical)
	NewFace("", nil, nil, p137.PlayerImageId, p137.SubPhysical)
	UpdateDeckTop()
	UpdateDeckTop("Enemy")
	task.wait(1)

	if p140.StartCutscene then
		battleNew.Visible = false
		task.spawn(function()
			task.wait(1)
			audioService.ChangeSong(u164.Song or "Battle")
		end)
		battleCutscenesBattleCutscenes(p140.StartCutscene)
		battleNew.Visible = true
		transition.ToggleBlack(-1)
	else
		transition.ToggleBlack(-1)
		task.spawn(function()
			task.wait(1)
			audioService.ChangeSong(u164.Song or "Battle", p140.AudioProperties)
		end)
	end

	HideNonBattleUI()
	utilsClient.TurnOnIndicationAnimation()
end
function AmountOfIcons(p141, p142)
	local foundChild = (p142 or battleNew.Icons):FindFirstChild("Icon " .. p141)

	if not foundChild then
		return 0
	end

	return foundChild.Amount.Value
end

battleCutscenes = require(player.Temp)
battleCutscenes.AmountOfIcons = AmountOfIcons

function CardAffordable(p143)
	if p143.Position == "Hand" then
		local u607: boolean = true

		if p143.Requirement or p143.Shedletsky then
			u607 = false
		end

		if not p143.Cost then
			u607 = false
		else
			for iterFirst, iterSecond in v169(p143.Cost) do
				local v610 = AmountOfIcons(iterFirst)

				if iterSecond > v610 then
					u607 = false

					break
				end
			end
		end

		p143:SetAffordable(u607)

		return
	end

	p143:SetAffordable(false)
end
function utilsClient.GetAffordableHand(p144, p145)
	for iterFirst, iterSecond in v169(p144) do
		local v615 = allcards[iterFirst]

		if v615 and v615.Position == "Hand" then
			v615:SetAffordable(iterSecond)
		end
	end

	for iterFirst2, iterSecond2 in v169(p145) do
		for iterFirst3, iterSecond3 in v169(iterSecond2) do
			local v620 = allcards[iterFirst3]

			if iterFirst2 == "Hunt" and v620 and v620.Position == "Hand" then
				if iterSecond3 == true and v620.PhysicalPassives:FindFirstChild("Hunt") then
					v620.PhysicalPassives.Hunt.Visible = true
				elseif v620.PhysicalPassives:FindFirstChild("Hunt") then
					v620.PhysicalPassives.Hunt.Visible = false
				end
			end
		end
	end
end
local function AddIcon(p146, p147, p148, p149)
	if not u65 then
		return
	end

	-- FIX (v20): stud icons used to be created only the first time a colour changed, so a colour you had never
	-- had (or any colour at 0) showed no number. Make all five icons exist with a count of 0 for both sides.
	for _, enemySide in ipairs({ false, true }) do
		local holder = battleNew[(if enemySide then "Enemy" else "") .. "Icons"]
		for color, order in pairs(config.REVERSECOLORORDER) do
			if not holder:FindFirstChild("Icon " .. color) then
				local icon = NewIcon(color, holder, order - 1)
				icon.Count.Text = "0"
			end
		end
	end

	local parts = string.split(p146, " ")

	if #parts ~= 1 then
		local v626 = battleNew[(if p148 then "Enemy" else "") .. "Icons"]

		for i = 1, #parts do
			local v628 = parts[i]

			if v626:FindFirstChild("Icon " .. v628).Amount.Value + p147 >= 0 then
				p146 = v628
			end
		end
	end

	t9.addingicons = t9.addingicons + 1

	local v629 = battleNew[(if p148 then "Enemy" else "") .. "Icons"]
	local v630 = p146
	local foundChild = v629:FindFirstChild("Icon " .. v630)

	if not foundChild then
		foundChild = NewIcon(p146, v629, (config.REVERSECOLORORDER[p146] or 1) - 1)
	end

	local foundChildCount = foundChild.Count
	local n1 = 0

	foundChild.Amount.Value = foundChild.Amount.Value + p147

	-- Where the stud icon will sit. A brand new icon starts at the top of the screen and only slides to its slot, so
	-- read the slot itself (the studs used to fly to / from the top of the screen).
	local iconSlot = battleNew:FindFirstChild((if p148 then "Enemy" else "") .. "IconHolderSlots")
	iconSlot = iconSlot and iconSlot:FindFirstChild(foundChild.Name)
	local function iconPosition()
		if iconSlot and iconSlot.AbsoluteSize.X > 0 then
			return iconSlot.AbsolutePosition
		end
		return foundChild.AbsolutePosition
	end

	if p149 and allcards[p149] then
		local physical = allcards[p149].Physical
		local typeName: string = type(p147)

		assert(typeName == "number", "delta was not a number but", p147)

		local iconRef = v629:FindFirstChild("Icon Red") or v629:FindFirstChildWhichIsA("ImageButton") or foundChild
		local x = iconRef.AbsoluteSize.X

		if x <= 0 and iconSlot then
			x = iconSlot.AbsoluteSize.X
		end

		-- Where the card is. A card that was just moved, or is gone, can report (0, 0): fall back to its zone.
		local function cardPosition()
			local card = allcards[p149]
			local ph = card and card.Physical
			if ph and ph.Parent and ph:IsDescendantOf(game) then
				local pos = ph.AbsolutePosition
				if pos.X > 4 or pos.Y > 4 then
					return pos
				end
			end
			local zone = card and card.Position and battleNew:FindFirstChild("Virtual" .. card.Position)
			if zone and zone.AbsoluteSize.X > 0 then
				return zone.AbsolutePosition + zone.AbsoluteSize / 2
			end
			return (ph and ph.AbsolutePosition) or Vector2.new(0, 0)
		end

		n1 = math.abs(p147)

		local n2: number = if p147 < 0 then -1 else 1

		if p147 < 0 then
			DisplayIconDelta(foundChild, p147)
			audioService.PlaySound("Mouse Over (Light)")
		end

		if n1 < 100 then
			for _ = 1, math.abs(p147) do
				local v639 = p147 < 0 and cardPosition() or iconPosition()
				local v640 = p147 < 0 and iconPosition() or cardPosition()
				local imageButton: ImageButton = Instance.new("ImageButton")

				imageButton.Size = UDim2.new(0, x, 0, x)
				imageButton.Position = UDim2.new(0, v640.x, 0, v640.y)
				imageButton.Image = "rbxassetid://511406127"
				imageButton.ZIndex = 1000000
				imageButton.BackgroundTransparency = 1
				imageButton.ImageColor3 = configClr[p146] or Color3.new(0, 0, 0)
				imageButton.BackgroundColor3 = imageButton.ImageColor3

				local v642 = p146

				imageButton.Name = "Icon " .. v642
				imageButton.Parent = u4

				local uDim2 = UDim2.new(0, v639.x, 0, v639.y)

				imageButton:TweenPosition(uDim2, "In", "Quad", 0.7, true, function()
					if p147 > 0 then
						DisplayIconDelta(foundChild, n2)
						audioService.PlaySound("Mouse Over (Light)")
					end

					foundChildCount.Text = AmountOfIcons(p146, v629)
					imageButton:Destroy()
					n1 -= 1
				end)
				task.wait()
			end
		else
			n1 = 0
			DisplayIconDelta(foundChild, p147)
			foundChildCount.Text = AmountOfIcons(p146, v629)
		end
	else
		DisplayIconDelta(foundChild, p147)
		foundChildCount.Text = AmountOfIcons(p146, v629)
	end

	task.spawn(function()
		repeat
			task.wait()
		until n1 == 0

		t9.addingicons = t9.addingicons - 1
	end)
	task.wait(0.01)
end
function utilsClient.AddIcons(p150, p151)
	for iterFirst, iterSecond in v169(p150) do
		for iterFirst2, iterSecond2 in v169(iterSecond) do
			AddIcon(iterFirst2, iterSecond2, iterFirst == "Enemy", p151)
		end
	end
end
function utilsClient.MissingIcons(p152)
	for iterFirst, iterSecond in v169(p152) do
		local foundChild = battleNew.Icons:FindFirstChild("Icon " .. iterFirst)

		task.spawn(function()
			if foundChild then
				foundChild.Count.TextColor3 = Color3.new(0, 0, 0)
				task.wait()
				foundChild.Count.TextColor3 = Color3.new(1, 1, 1)
				task.wait()
				foundChild.Count.TextColor3 = Color3.new(0, 0, 0)
				animation.AnimateAsync(foundChild.Count, { TextColor3 = Color3.new(1, 1, 1) }, 0.2, "In", "Quad")
			end
		end)
	end
end
function utilsClient.PlaceTerrainCard(p153, p154, p155, p156, p157)
	if p156 then
		p155 = battleCutscenesNew(p155)
		allcards[p155.CardId] = p155
	end

	if not p157 then
		utilsClient.PlayEffectCard(p153, p154, p155)
	end

	allcards[p155.CardId]:MoveTo(p153 .. "Terrain")
end
function utilsClient.HideTerrainCard(_, _, _)
	if u91 == false then
		return
	end

	task.wait(2)
	battleNew.VirtualEffectStage.Effect.Visible = false
	table.remove(t7, #t7)
end
function utilsClient.PlayEffectCard(_, p162, p163)
	utilsClient.FlipCard(p162, p163)
	allcards[p162]:MoveTo("EffectStage")
	battleNew.VirtualEffectStage.Effect.Visible = true

	if p163.ModifiedDescription and p163.ModifiedDescription ~= "" then
		battleNew.VirtualEffectStage.Effect.Text = p163.ModifiedDescription
	else
		battleNew.VirtualEffectStage.Effect.Text = cardLibrary[p163.LibraryIndex].Effect.Description
	end

	battleNew.VirtualEffectStage.Effect.Text = textFormat.FormatText(battleNew.VirtualEffectStage.Effect.Text, true)
	table.insert(t7, battleNew.VirtualEffectStage.Effect.Text)
end
function utilsClient.ShowEffectCard(_, p165)
	local v667 = battleCutscenesNew(p165)

	allcards[v667.CardId] = v667
	v667.Physical.Position = UDim2.fromOffset(battleNew.VirtualEffectStage.Effect.AbsolutePosition.X, battleNew.VirtualEffectStage.Effect.AbsolutePosition.Y + battleNew.VirtualEffectStage.Effect.AbsoluteSize.Y / 2)
	v667:MoveTo("EffectStage")
	battleNew.VirtualEffectStage.Effect.Visible = true

	if cardLibrary[p165.LibraryIndex].Effect then
		if p165.ModifiedDescription and p165.ModifiedDescription ~= "" then
			battleNew.VirtualEffectStage.Effect.Text = p165.ModifiedDescription
		else
			battleNew.VirtualEffectStage.Effect.Text = cardLibrary[p165.LibraryIndex].Effect.Description
		end

		battleNew.VirtualEffectStage.Effect.Text = textFormat.FormatText(battleNew.VirtualEffectStage.Effect.Text, true)
	else
		battleNew.VirtualEffectStage.Effect.Text = ""
	end

	table.insert(t7, battleNew.VirtualEffectStage.Effect.Text)
end
-- A card that died or was used up goes to the graveyard (on top of the pile) instead of vanishing.
local function SendToGraveyard(card)
	if not card then
		return
	end

	local physical = card.Physical

	if not u65 or not physical or not physical.Parent then
		CardDied(card) -- the battle is over, or the card is already gone

		return
	end

	local locked = card.Locked

	if locked and locked.Physical then
		pcall(function()
			locked.Physical:Destroy()
		end)

		locked.Physical = nil
		locked.IsLocked = false
		locked.TurnsLeft = 0
	end

	local prefix = if card.Owner == "Enemy" then "Enemy" else ""

	local runningGaster = utilsClient.__gasterTweens and utilsClient.__gasterTweens[physical]

	if runningGaster then
		-- FIX: the delete tween is deliberately still running when the card dies (so its death effect is visible), stop it now
		pcall(function()
			runningGaster:Cancel()
		end)

		utilsClient.__gasterTweens[physical] = nil
	end

	if physical:GetAttribute("GasterDestroying") then
		local graveyard = battleNew["Virtual" .. prefix .. "Graveyard"]
		if graveyard then
			physical.Position = UDim2.fromOffset(graveyard.AbsolutePosition.X, graveyard.AbsolutePosition.Y)
			physical.Size = UDim2.fromOffset(graveyard.AbsoluteSize.X * 1.5, graveyard.AbsoluteSize.Y * 1.5)
		end
		physical.Rotation = 0
		physical:SetAttribute("GasterDestroying", nil)
	end

	card:MoveTo(prefix .. "Graveyard")
	utilsClient.UpdateZoneCount(prefix)
end

-- The baseplate shows a lock once you have put a card into it this turn, until your next turn starts.
function utilsClient.SetBaseplateLocked(p_locked, p_instant)
	local tweenService: TweenService = game:GetService("TweenService")
	local baseplate = battleNew:FindFirstChild("VirtualBaseplate")

	if not baseplate then
		return
	end

	local overlay = baseplate:FindFirstChild("BaseplateLock")

	if not p_locked then
		if overlay then
			overlay.Name = "BaseplateLockClosing"

			if p_instant then
				overlay:Destroy()
			else
				audioService.PlaySound("Door_unlock")

				for _, d in ipairs(overlay:GetDescendants()) do
					if d:IsA("ImageLabel") then
						tweenService:Create(d, TweenInfo.new(0.25), { ImageTransparency = 1 }):Play()
					elseif d:IsA("TextLabel") then
						tweenService:Create(d, TweenInfo.new(0.25), { TextTransparency = 1, TextStrokeTransparency = 1 }):Play()
					end
				end

				tweenService:Create(overlay, TweenInfo.new(0.25), { BackgroundTransparency = 1 }):Play()
				task.delay(0.3, function()
					overlay:Destroy()
				end)
			end
		end

		return
	end

	if overlay then
		return
	end

	audioService.PlaySound("Locked")

	overlay = Instance.new("Frame")
	overlay.Name = "BaseplateLock"
	overlay.Active = false
	overlay.BackgroundColor3 = Color3.new(0, 0, 0)
	overlay.BackgroundTransparency = 1
	overlay.BorderSizePixel = 0
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.ZIndex = 2000000000

	local lockImage = Instance.new("ImageLabel")

	lockImage.Name = "LockImage"
	lockImage.AnchorPoint = Vector2.new(0.5, 0.5)
	lockImage.BackgroundTransparency = 1
	lockImage.Image = "rbxassetid://337233077"
	lockImage.ImageTransparency = 1
	lockImage.Position = UDim2.new(0.5, 0, 0.42, 0)
	lockImage.Size = UDim2.new(0.6, 0, 0.6, 0)
	lockImage.SizeConstraint = Enum.SizeConstraint.RelativeYY
	lockImage.ZIndex = 2000000001
	lockImage.Parent = overlay

	local label = Instance.new("TextLabel")

	label.Name = "LockText"
	label.AnchorPoint = Vector2.new(0.5, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.SourceSansBold
	label.Position = UDim2.new(0.5, 0, 0.74, 0)
	label.Size = UDim2.new(0.95, 0, 0.18, 0)
	label.Text = "Locked until your next turn"
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextScaled = true
	label.TextStrokeColor3 = Color3.new(0, 0, 0)
	label.TextStrokeTransparency = 0.4
	label.TextTransparency = 1
	label.ZIndex = 2000000001
	label.Parent = overlay

	overlay.Parent = baseplate

	tweenService:Create(overlay, TweenInfo.new(0.25), { BackgroundTransparency = 0.55 }):Play()
	tweenService:Create(lockImage, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
	tweenService:Create(label, TweenInfo.new(0.25), { TextTransparency = 0 }):Play()
end
function utilsClient.DestroyEffectCard(_, p167, p168, p169, p170)
	if u91 == false and not p169 then
		return
	end

	if not p168 then
		task.wait(1)
	end

	if p167 == "Top" then
		local n1 = 0
		local v674 = nil

		for iterFirst, iterSecond in v169(battleNew.EffectStage:GetChildren()) do
			if n1 < iterSecond.ZIndex then
				v674 = iterSecond.Name
				n1 = iterSecond.ZIndex
			end
		end

		p167 = v674
	end

	SendToGraveyard(allcards[p167])
	table.remove(t7, #t7)

	if p170 then
		table.clear(t7)
	end

	if #t7 == 0 or p170 then
		battleNew.VirtualEffectStage.Effect.Visible = false

		if #battleNew.EffectStage:GetChildren() > 0 then
			for iterFirst2, iterSecond2 in v169(battleNew.EffectStage:GetChildren()) do
				SendToGraveyard(allcards[iterSecond2.Name])
			end
		end
	else
		battleNew.VirtualEffectStage.Effect.Text = t7[#t7]
	end

	task.wait(0.1)
end

local t14: {[any]: any} = {}

function utilsClient.UpdateZoneCount(p171)
	local children = battleNew[p171 .. "Graveyard"]:GetChildren()
	local v681 = battleNew[p171 .. "Baseplate"]:GetChildren()

	battleNew["Virtual" .. p171 .. "Graveyard"].GraveyardLeft.Text = tostring(#children)
	battleNew["Virtual" .. p171 .. "Baseplate"].BaseplateAmount.Text = tostring(#v681)
	tweenIntoPosition(p171)
	resetTweenOut(p171)
end
function tweenIntoPosition(p172)
	local baseplateRank = battleNew["Virtual" .. p172 .. "Baseplate"].BaseplateRank
	local graveyardLeft = battleNew["Virtual" .. p172 .. "Graveyard"].GraveyardLeft
	local graveyardText = battleNew["Virtual" .. p172 .. "Graveyard"].GraveyardText

	battleNew["Virtual" .. p172 .. "Baseplate"].BaseplateAmount:TweenPosition(UDim2.new(0.5, 0, 0.85, 0), "Out", "Quart", 0.5, true)
	baseplateRank:TweenPosition(UDim2.new(0.5, 0, 0.15, 0), "Out", "Quart", 0.5, true)
	graveyardLeft:TweenPosition(UDim2.new(0.5, 0, 0.85, 0), "Out", "Quart", 0.5, true)
	graveyardText:TweenPosition(UDim2.new(0.5, 0, 0.15, 0), "Out", "Quart", 0.5, true)
end
function resetTweenOut(p173)
	if t14[p173] then
		return
	end

	t14[p173] = true
	task.spawn(function()
		task.wait(6)

		local baseplateRank = battleNew["Virtual" .. p173 .. "Baseplate"].BaseplateRank
		local graveyardLeft = battleNew["Virtual" .. p173 .. "Graveyard"].GraveyardLeft
		local graveyardText = battleNew["Virtual" .. p173 .. "Graveyard"].GraveyardText

		battleNew["Virtual" .. p173 .. "Baseplate"].BaseplateAmount:TweenPosition(UDim2.new(0.5, 0, 1.4, 0), "Out", "Quart", 0.5, true)
		baseplateRank:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quart", 0.5, true)
		graveyardLeft:TweenPosition(UDim2.new(0.5, 0, 1.4, 0), "Out", "Quart", 0.5, true)
		graveyardText:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quart", 0.5, true)
		t14[p173] = nil
	end)
end
function utilsClient.AddToBaseplate(p174, p175, p176)
	local v690 = battleCutscenesNew(p176)

	allcards[v690.CardId] = v690

	if p175 then
		local v691 = allcards[p175.CardId]

		v690.Physical.Position = v691 and v691.Physical.Position or p176.Physical.Position
		v690.Physical.Size = v691 and v691.Physical.Size or p176.Physical.Size
	end

	v690.Owner = if p174 == "Enemy" then "Enemy" else u70
	audioService.PlaySound("spawn04")
	v690:MoveTo(p174 .. "Baseplate")
	utilsClient.UpdateZoneCount(p174)
end
function utilsClient.MoveToBaseplate(p177)
	local s1: string = if p177.Enemy then "Enemy" else ""

	for iterFirst, iterSecond in v169(p177.You or p177[""] or p177.Enemy) do
		audioService.PlaySound("spawn04")
		allcards[iterSecond]:MoveTo(s1 .. "Baseplate")
		utilsClient.UpdateZoneCount(s1)

		if s1 == "" then
			utilsClient.AddBattleBackParticles(allcards[iterSecond].Color, 10)
		end
	end
end
function utilsClient.AddToGraveyard(p178, p179, p180, p181)
	local v700 = battleCutscenesNew(p180)

	allcards[v700.CardId] = v700

	if p179 then
		local v701 = allcards[p179.CardId]

		v700.Physical.Position = v701.Physical.Position
		v700.Physical.Size = v701.Physical.Size
	else
		local v702 = battleNew["Virtual" .. p178 .. "Graveyard"]

		v700.Physical.Position = UDim2.fromOffset(v702.AbsolutePosition.X, v702.AbsolutePosition.Y)
		v700.Physical.Size = UDim2.fromOffset(v702.AbsoluteSize.X * 1.5, v702.AbsoluteSize.Y * 1.5)
	end

	v700.Owner = if p178 == "Enemy" then "Enemy" else u70

	if p181 == "Bottom" then
		v700:MoveTo(p178 .. "Graveyard", 1)
	else
		v700:MoveTo(p178 .. "Graveyard")
	end

	utilsClient.UpdateZoneCount(p178)
end
function utilsClient.MoveToGraveyard(p182)
	local s1: string = if p182.Enemy then "Enemy" else ""

	for iterFirst, iterSecond in v169(p182.You or p182[""] or p182.Enemy) do
		allcards[iterSecond]:MoveTo(s1 .. "Graveyard")
		utilsClient.UpdateZoneCount(s1)
	end

	if p182.Enemy then
		utilsClient.RefreshEnemyHandCount()
	end
end
function utilsClient.UpdateZoneDisplays(p183)
	utilsClient.UpdateZoneCount(p183)
end

local connection = nil

function closeBPC()
	if connection then
		connection:Disconnect()
	end

	u4.Parent.CardTable.Enabled = false
	t6.bpext = false
	t6.bpdb = false
end
function utilsClient.TakeEXPPrintList(p184)
	local PlayerGui = LocalPlayer.PlayerGui

	if string.len(p184) > 2 then
		PlayerGui.CardTable.BattleCardTable.AdvanceableLocationDisplay.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"3\" transparency=\"0.25\">" .. "Advanceable Card Positions:\n" .. p184 .. "</stroke>"
		PlayerGui.CardTable.BattleCardTable.AdvanceableLocationDisplay.Visible = true

		return
	end

	PlayerGui.CardTable.BattleCardTable.AdvanceableLocationDisplay.Visible = false
end
local function BaseplateClick(p185, p186, p187)
	if t6.bpdb == true or t6.bpext == true or u63 then
		return
	end

	local v713 = p186 or "Baseplate"

	if not t2[p185 .. v713] and v713 ~= "Other Hand" and v713 ~= "Deck (sorted by cost)" then
		print("Your zone doesn't exist")

		return
	end

	local PlayerGui = LocalPlayer.PlayerGui
	local cardHolder = PlayerGui.CardTable.BattleCardTable.ScrollingFrame.CardHolder
	local cardTemplate = PlayerGui.CardTable.Template.CardTemplate

	t6.bpdb = true
	t6.bpext = true

	for iterFirst, iterSecond in v169(cardHolder:GetChildren()) do
		if iterSecond:IsA("GuiObject") then
			iterSecond:Destroy()
		end
	end

	inspection.Hide()
	PlayerGui.CardTable.BattleCardTable.AdvanceableLocationDisplay.Visible = false

	local t24: {[any]: any} = {
		Neutral = "Colourless",
		Red = "Red",
		Green = "Green",
		Blue = "Blue",
		Yellow = "Yellow"
	}
	local t25: {[any]: any} = {
		Colourless = "#b9b9b9",
		Red = "#ff1919",
		Green = "#19ff19",
		Blue = "#4d49ff",
		Yellow = "#ffff19"
	}
	local t26: {[any]: any} = { Neutral = 0, Red = 0, Green = 0, Blue = 0, Yellow = 0 }
	local t27 = {}

	if v713 == "Other Hand" or v713 == "Deck (sorted by cost)" then
		local v723 = v713 == "Other Hand" and utilsInvokeServer("GetOtherHand", u73) or utilsInvokeServer("FetchDeck", u73)

		if v723 then
			t27 = v723
		end
	else
		for iterFirst2, iterSecond2 in v169(t2[p185 .. v713] or {}) do
			local v726 = allcards[iterSecond2]

			if v726 then
				table.insert(t27, v726)
			end
		end
	end

	for _, v in ipairs(t27) do
		local v729 = v.Color or "Neutral"

		if t26[v729] ~= nil then
			t26[v729] = t26[v729] + 1
		end
	end

	local s1: string = if p185 == "" then "Your " else p185 .. " "
	local s2 = ""

	for _, v in ipairs({ "Neutral", "Red", "Green", "Blue", "Yellow" }) do
		local v734 = t26[v]

		if v734 > 0 then
			local v735 = t24[v]
			local v736 = t25[v735]
			local text: string = tostring(v734)

			s2 = s2 .. " | " .. text .. " <font color=\"" .. v736 .. "\">" .. v735 .. "</font>"
		end
	end

	PlayerGui.CardTable.BattleCardTable.Detail.Text = s1 .. v713 .. s2
	s2 = cardHolder.AbsoluteSize.X / 10
	cardHolder.UIGridLayout.CellSize = UDim2.fromOffset(s2 - 6, s2 / 0.6333333333333333 - 6)
	PlayerGui.CardTable.Close.BackgroundTransparency = 1
	animation.AnimateAsync(PlayerGui.CardTable.Close, { BackgroundTransparency = 0.5 }, 0.5, "Out", "Quart")

	if v713 == "Other Hand" or v713 == "Deck (sorted by cost)" then
		local v738 = v713 == "Other Hand" and utilsInvokeServer("GetOtherHand", u73) or utilsInvokeServer("FetchDeck", u73)

		if v738 then
			for i = 1, #v738 do
				local v740 = battleCutscenesNew(v738[i])
				local clone = cardTemplate:Clone()

				clone.Parent = cardHolder
				clone.Name = v740.CardId
				clone.Image = "rbxassetid://" .. v740.Id
				clone.ZIndex = configCardzindex
				clone.LayoutOrder = i * (if p187 then -1 else 1)

				if v740.Foil then
					foilEffect(clone, v740.LibraryIndex)
				end

				if v740.ArtAnimation then
					cardAnim(clone, v740.ArtAnimation, v740.Foil)
				end

				nonGameCard.BindInspect(clone, v740)
				clone.Visible = true
			end
		end
	else
		for iterFirst3, iterSecond3 in v169(t2[p185 .. v713]) do
			local v744 = allcards[iterSecond3]

			if v744 and v744.Id then
				local clone = cardTemplate:Clone()

				clone.Parent = cardHolder
				clone.Name = iterSecond3
				clone.Image = "rbxassetid://" .. v744.Id
				clone.ZIndex = configCardzindex
				clone.LayoutOrder = iterFirst3 * (if p187 then -1 else 1)

				for iterFirst4, iterSecond4 in v169(passiveEffects) do
					if (iterFirst4 == "TriggerInGraveZone" or iterFirst4 == "Liberate" or iterFirst4 == "Terror" or iterFirst4 == "Drafted" or iterFirst4 == "Element") and v744[iterFirst4] then
						iterSecond4(clone, battleNew)
					end
				end

				if v744.Foil then
					foilEffect(clone, v744.LibraryIndex)
				end

				if v744.ArtAnimation then
					cardAnim(clone, v744.ArtAnimation, v744.Foil)
				end

				nonGameCard.BindInspect(clone, v744)
				clone.Visible = true
			end
		end
	end

	PlayerGui.CardTable.Enabled = true
	connection = PlayerGui.CardTable.Close.MouseButton1Click:Connect(closeBPC)
	t6.bpdb = false
end

for iterFirst, iterSecond in v169({
	battleNew.VirtualBaseplate,
	battleNew.VirtualEnemyBaseplate,
	battleNew.VirtualGraveyard,
	battleNew.VirtualEnemyGraveyard,
	battleNew.VirtualDeck,
	battleNew.VirtualEnemyDeck
	}) do
	if iterSecond == battleNew.VirtualGraveyard or iterSecond == battleNew.VirtualEnemyGraveyard then
		iterSecond.MouseEnter:connect(function()
			iterSecond.HoverText:TweenPosition(UDim2.new(0.5, 0, 0.95, 0), "Out", "Quart", 0.5, true)
			iterSecond.GraveyardLeft:TweenPosition(UDim2.new(0.5, 0, 0.85, 0), "Out", "Quart", 0.5, true)
			iterSecond.GraveyardText:TweenPosition(UDim2.new(0.5, 0, 0.15, 0), "Out", "Quart", 0.5, true)
		end)
		iterSecond.MouseLeave:connect(function()
			task.wait(2.5)
			iterSecond.HoverText:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), "Out", "Quart", 0.5, true)
			iterSecond.GraveyardLeft:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "Out", "Quart", 0.5, true)
			iterSecond.GraveyardText:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quart", 0.5, true)
		end)
	elseif iterSecond == battleNew.VirtualBaseplate or iterSecond == battleNew.VirtualEnemyBaseplate then
		iterSecond.MouseEnter:connect(function()
			iterSecond.HoverText:TweenPosition(UDim2.new(0.5, 0, 0.95, 0), "Out", "Quart", 0.5, true)
			iterSecond.BaseplateAmount:TweenPosition(UDim2.new(0.5, 0, 0.85, 0), "Out", "Quart", 0.5, true)
			iterSecond.BaseplateRank:TweenPosition(UDim2.new(0.5, 0, 0.15, 0), "Out", "Quart", 0.5, true)
		end)
		iterSecond.MouseLeave:connect(function()
			task.wait(2.5)
			iterSecond.HoverText:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), "Out", "Quart", 0.5, true)
			iterSecond.BaseplateAmount:TweenPosition(UDim2.new(0.5, 0, 1.4, 0), "Out", "Quart", 0.5, true)
			iterSecond.BaseplateRank:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quart", 0.5, true)
		end)
	elseif iterSecond == battleNew.VirtualDeck or iterSecond == battleNew.VirtualEnemyDeck then
		iterSecond.MouseEnter:connect(function()
			iterSecond.HoverInfo:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "Out", "Quart", 0.5, true)
		end)
		iterSecond.MouseLeave:connect(function()
			iterSecond.HoverInfo:TweenPosition(UDim2.new(0.5, 0, 0, 0), "Out", "Quart", 0.5, true)
		end)
	end
end

battleNew.VirtualBaseplate.Open.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		t6.bphover = false
		BaseplateClick("")
	end
end)
battleNew.VirtualEnemyBaseplate.Open.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		BaseplateClick("Enemy")
	end
end)
battleNew.VirtualGraveyard.Open.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		t6.discardhover = false
		BaseplateClick("", "Graveyard", true)
	end
end)
battleNew.VirtualEnemyGraveyard.Open.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		BaseplateClick("Enemy", "Graveyard", true)
	end
end)
battleNew.ViewOtherHand.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		BaseplateClick("", "Other Hand")
	end
end)
battleNew.VirtualDeck.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		utilsInvokeServer("FetchDeck", u73)
		BaseplateClick("", "Deck (sorted by cost)", true)
	end
end)
battleNew.VirtualEffectStage.Effect.Close.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		pcall(function()
			utilsClient.DestroyEffectCard(nil, "Top", true, true)
		end)
	end
end)
battleNew.VirtualEffectStage.Effect.ClickRegion.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.ButtonA then
		pcall(function()
			utilsClient.DestroyEffectCard(nil, "Top", true, true)
		end)
	end
end)
battleNew.EffectStage.ChildAdded:connect(function()
	if u91 == false then
		n2 = 3

		if #battleNew.EffectStage:GetChildren() == 1 then
			while true do
				if not (#battleNew.EffectStage:GetChildren() > 0) then
					break
				end

				n2 = 3

				while n2 > 0 or u72 do
					task.wait(1)
					n2 -= 1
				end

				pcall(function()
					utilsClient.DestroyEffectCard(nil, "Top", true, true)
				end)
			end
		end
	end
end)

function utilsClient.ReturnCard(p196, p197)
	allcards[p197]:MoveTo(p196 .. "Hand")
	task.wait(0.2)
end
function utilsClient.GivePositionData(p198, p199)
	allcards[p198]:ChangeCard({ SpecificFieldLocation = p199 })
end
function utilsClient.FlipCard(p200, p201)
	local v762 = allcards[p200]

	v762:ChangeCard(p201)
	v762:Flip()

	for iterFirst, iterSecond in v169(passiveEffects) do
		if p201.Color ~= cardLibrary[v762.LibraryIndex].Color and iterFirst == p201.Color then
			iterSecond(v762, battleNew)
		end

		if p201[iterFirst] then
			iterSecond(v762, battleNew)
		end
	end
end
function utilsClient.RevealHand(cards)
	for _, info in ipairs(cards) do
		local card = allcards[info.CardId]
		if card and card.Position == "EnemyHand" then
			card:ChangeCard(info)
			card:Flip()
			card.Physical.Rotation = 0
		end
	end
end
function utilsClient.FlipDeckCard(p202, p203, p204)
	UpdateDeckTop(p202, p203, p204)
end
function utilsClient.SummonCard(p205, p206, p207)
	if p207.ReplacementArt then
		p207.Id = p207.ReplacementArt
	end

	if p207.Nurtured and p207.NurtureArt then
		p207.Id = p207.NurtureArt
	end

	local v771 = battleCutscenesNew(p207)
	local n1: number = 30

	if allcards[v771.CardId] ~= nil then
		print("waiting")

		repeat
			task.wait(0.1)
			n1 -= 1
		until allcards[v771.CardId] == nil or n1 <= 0
	end

	allcards[v771.CardId] = v771

	if p206 then
		local v773 = allcards[p206.CardId]

		if v773 ~= nil then
			v771.Physical.Position = v773.Physical.Position
			v771.Physical.Size = v773.Physical.Size
		end
	end

	v771.Owner = if p205 == "Enemy" then "Enemy" else u70
	v771:MoveTo(p205 .. "Field")
	audioService.PlaySound("Summon")
	task.wait(0.1)
end
function utilsClient.RefreshEnemyHandCount()
	local function r()
		pcall(function()
			battleNew.EnemyHandCount.Text = "x" .. #battleNew.EnemyHand:GetChildren()
		end)
	end
	r()
	task.delay(0.6, r)
end
function utilsClient.MoveToField(p208)
	local s1: string = if p208.Enemy then "Enemy" else ""

	for iterFirst, iterSecond in v169(p208.You or p208[""] or p208.Enemy) do
		allcards[iterSecond]:MoveTo(s1 .. "Field")
	end

	if p208.Enemy then
		utilsClient.RefreshEnemyHandCount()
	end

	task.wait(0.2)
end
function utilsClient.DiscardCard(p209)
	local v779 = allcards[p209]
	local physical = v779.Physical
	local owner = v779.Owner

	allcards[p209] = nil
	physical.Parent = battleNewTrash

	if owner ~= "You" then
		CardDied(v779)
		battleNew.EnemyHandCount.Text = "x" .. #battleNew.EnemyHand:GetChildren()
	elseif physical then
		local uDim2 = UDim2.new(0, physical.Position.X.Offset, 1, 24)

		physical:TweenPosition(uDim2, "Out", "Quad", 0.5, true, function()
			CardDied(v779)
		end)

		return
	end
end
-- FIX: a suspended fighter (either side) slides down off the screen. DiscardCard only did that for your own cards; an opponent's just vanished,
-- which looked like an obliterate. Purely visual: the server handles Suspend exactly as before.
function utilsClient.SuspendCard(cardId)
	local card = allcards[cardId]

	if not card then
		return
	end

	local physical = card.Physical

	allcards[cardId] = nil
	physical.Parent = battleNewTrash
	physical:TweenPosition(UDim2.new(physical.Position.X.Scale, physical.Position.X.Offset, 1, 24), "Out", "Quad", 0.5, true, function()
		CardDied(card)
	end)
end
-- FIX: obliterate used to DiscardCard the fighter (it dropped down off the field). Now an obliterated fighter dies like a destroyed one
-- (CardsDied: it flies onto the graveyard pile) and this then removes it from the pile again once it has landed, so the client's
-- graveyard still matches the server (an obliterated card is not in the graveyard). It does not hold the queue.
function utilsClient.ScrubFromGrave(cardId)
	local card = allcards[cardId]

	if not card then
		return
	end

	local prefix = if card.Owner == "Enemy" then "Enemy" else ""

	task.spawn(function()
		task.wait(0.7)

		local still = allcards[cardId]

		if still then
			CardDied(still)
			utilsClient.UpdateZoneCount(prefix)
		end
	end)
end
-- FIX: an obliterated fighter just VANISHES off the board: no flight to the graveyard pile, no scrubbing it out of the pile afterwards.
function utilsClient.VanishCard(cardId)
	if not allcards[cardId] then
		return
	end

	utilsClient.__WaitMelee() -- the animation that obliterates it plays out FIRST, then the card vanishes

	CardDied(allcards[cardId])
end
function utilsClient.CardEffectTriggered(p210)
	local v784 = allcards[p210]

	if not v784 then
		return
	end

	-- FIX: a gear that was just attached (or shifted by another gear) is still sliding in from the top of the card; the flash is sized
	-- and placed from the gear's frame, so it appeared above the gear. Wait until the slide (0.3s) is over.
	if type(p210) == "string" and string.sub(p210, -5) == "_gear" and utilsClient.__lastGearRedraw then
		local left = 0.35 - (os.clock() - utilsClient.__lastGearRedraw)
		if left > 0 then
			task.wait(left)
		end
	end

	-- DEBUG (remove when the gear flash is fixed): where is the thing the flash is drawn on?
	if type(p210) == "string" and string.sub(p210, -5) == "_gear" then
		pcall(function()
			local ph = v784.Physical
			local chain = {}
			local a = ph
			while a and a ~= game do
				table.insert(chain, a.Name .. "[" .. a.ClassName .. (a:IsA("GuiObject") and (" z=" .. a.ZIndex .. " clip=" .. tostring(a.ClipsDescendants)) or "") .. "]")
				a = a.Parent
			end
			print("[GEARFLASH]", p210, v784.Name, "pos", ph.AbsolutePosition, "size", ph.AbsoluteSize, "rot", ph.Rotation, "anchor", ph.AnchorPoint, "addP", v784.AddPower, "addH", v784.AddHealth)
			print("[GEARFLASH] chain:", table.concat(chain, " < "))
		end)
	end

	ShowAttackAnimation("EffectTriggered", v784.Physical)
	task.wait(0.2 / t8.EffectTriggered.TimeScale)
end
function utilsClient.ChargeCard(p211)
	local v786 = allcards[p211]

	if not v786 then
		return
	end

	local physical = v786.Physical

	audioService.PlaySound("SpeedCoil")
	ShowAttackAnimation("Charge", physical)
end
function utilsClient.DeselectCard()
	DeselectCard()
end
function utilsClient.Freeze(p212, p213)
	if not allcards[p212] then
		return
	end

	local v790 = allcards[p212]
	local physical = allcards[p212].Physical
	local v792 = v790.Locked.Physical and v790.Locked.Physical or NewLock(allcards[p212])

	v790.Locked.Version = (v790.Locked.Version or 0) + 1
	v792.ImageTransparency = 0
	v792.Amount.TextTransparency = 0
	local rage = battleNew[(if v790.Owner == "You" then "" else "Enemy") .. "Effect"]:FindFirstChild("Rage")
	v792.Amount.TextStrokeTransparency = if rage then 0 else 0.7
	v792.Visible = true
	v792.Amount.Text = p213
	v790.Locked.IsLocked = true
	v790.Locked.TurnsLeft = p213
	audioService.PlaySound("Locked")
	task.wait(0.1)
end
function utilsClient.ChangeFreeze(p214, p215)
	if not allcards[p214] then
		return
	end

	local v795 = allcards[p214]
	local physical = allcards[p214].Physical
	local v797 = v795.Locked.Physical or NewLock(v795)
	local v798 = p215

	v795.Locked.Version = (v795.Locked.Version or 0) + 1
	if v795.Locked and v795.Locked.TurnsLeft then
		v798 = p215 - v795.Locked.TurnsLeft
	end

	DisplayIconDelta(v797, v798, nil)
	v797.Amount.Text = p215
	v795.Locked.IsLocked = true
	v795.Locked.TurnsLeft = p215
end
function utilsClient.UnFreeze(p216, _)
	local v801 = allcards[p216]

	if not v801 then
		return
	end

	v801.Locked.IsLocked = false
	v801.Locked.TurnsLeft = 0
	v801.Locked.Version = (v801.Locked.Version or 0) + 1
	local version = v801.Locked.Version
	local lockPhysical = v801.Locked.Physical

	if lockPhysical then
		audioService.PlaySound("Door_unlock")
		task.spawn(function()
			animation.AnimateAsync(lockPhysical.Amount, { TextTransparency = 1, TextStrokeTransparency = 1 }, 0.16, "In", "Quad")
			animation.Animate(lockPhysical, { ImageTransparency = 1 }, 0.16, "In", "Quad")
			if v801.Locked.Physical ~= lockPhysical then
				return
			end
			if v801.Locked.IsLocked then
				lockPhysical.ImageTransparency = 0
				lockPhysical.Amount.TextTransparency = 0
				local rage = battleNew[(if v801.Owner == "You" then "" else "Enemy") .. "Effect"]:FindFirstChild("Rage")
				lockPhysical.Amount.TextStrokeTransparency = if rage then 0 else 0.7
				return
			end
			if v801.Locked.Version ~= version then
				return
			end
			lockPhysical:Destroy()
			v801.Locked.Physical = nil
		end)
	end

	task.wait(0.1)
end
local function FlushDeadCards(p218)
	for iterValue in v169(t13) do
		task.spawn(function()
			if p218 then
				local u1374: boolean = false

				for iterFirst, iterSecond in v169(p218) do
					if iterSecond == iterValue then
						u1374 = true

						break
					end
				end

				if not u1374 then
					return
				end

				t13[iterValue] = nil
				SendToGraveyard(allcards[iterValue])
				audioService.PlaySound("Destroyed")

				return
			end

			t13[iterValue] = nil
			SendToGraveyard(allcards[iterValue])
			audioService.PlaySound("Destroyed")
		end)
	end
end
function utilsClient.CardsDied(p219)
	utilsClient.__WaitMelee() -- FIX: a swing that destroyed them plays out before they fly off to the graveyard
	for iterFirst, iterSecond in v169(p219) do
		t13[iterSecond] = true
	end

	FlushDeadCards()
	task.wait(0.1)
end
function utilsClient.SwapCardStats(p220, newHealth, newPower)
	local card = allcards[p220]
	if not card then return end
	local oldHealth, oldPower = tonumber(card.Health) or 0, tonumber(card.Power) or 0
	newHealth = tonumber(newHealth) or oldPower
	newPower = tonumber(newPower) or oldHealth

	-- FIX: no sliding animation (it moved the Health label into the Power slot and left the numbers looking unchanged). Just set the real
	-- values and show a quick +/- on each number, like Heal / Strengthen do.
	card:ChangeCard({ Health = newHealth, Power = newPower })
	if not card.ObscureStats then
		-- FIX: a swap of equal Health / Power still "swaps": both numbers show +0 instead of nothing happening
		if card.PhysicalHealth then
			DisplayIconDelta(card.PhysicalHealth, newHealth - oldHealth)
		end
		if card.PhysicalPower then
			DisplayIconDelta(card.PhysicalPower, newPower - oldPower)
		end
	end
	task.wait(0.1)
end
function utilsClient.HealCard(p222, p223, _)
	local n1 = p223 - allcards[p222].Health

	allcards[p222]:ChangeCard({ Health = p223 })
	task.spawn(function()
		ShowAttackAnimation("Heal", nil, allcards[p222].Physical)
	end)
	DisplayIconDelta(allcards[p222].PhysicalHealth, n1, nil, t8.Heal.TimeScale)
	task.wait(0.1 / t8.Heal.TimeScale)
end
function utilsClient.StrengthenCard(p225, p226, _)
	local n1 = p226 - allcards[p225].Power

	allcards[p225]:ChangeCard({ Power = p226 })
	task.spawn(function()
		ShowAttackAnimation("Strengthen", nil, allcards[p225].Physical)
	end)
	DisplayIconDelta(allcards[p225].PhysicalPower, n1, nil, t8.Strengthen.TimeScale)
	task.wait(0.1 / t8.Strengthen.TimeScale)
end
function utilsClient.AddPowerCard(p228, p229, _)
	local v826 = p229

	if allcards[p228].AddPower then
		v826 = p229 - allcards[p228].AddPower
	end

	allcards[p228]:ChangeCard({ AddPower = p229 })
	task.spawn(function()
		ShowAttackAnimation("Strengthen", nil, allcards[p228].Physical)
	end)
	DisplayIconDelta(allcards[p228].PhysicalPower, v826, nil)
	task.wait(0.1)
end
function utilsClient.AddHealthCard(p231, p232, _)
	local v830 = p232

	if allcards[p231].AddHealth then
		v830 = p232 - allcards[p231].AddHealth
	end

	allcards[p231]:ChangeCard({ AddHealth = p232 })
	task.spawn(function()
		ShowAttackAnimation("Heal", nil, allcards[p231].Physical)
	end)
	DisplayIconDelta(allcards[p231].PhysicalHealth, v830, nil)
	task.wait(0.1)
end
function utilsClient.RemovePowerCard(p234, p235, _)
	local v834 = p235

	if allcards[p234].AddPower then
		v834 = p235 - allcards[p234].AddPower
	end

	allcards[p234]:ChangeCard({ AddPower = p235 })
	task.spawn(function()
		ShowAttackAnimation("Weaken", nil, allcards[p234].Physical)
	end)
	DisplayIconDelta(allcards[p234].PhysicalPower, v834, nil)
	task.wait(0.1)
end
function utilsClient.RemoveHealthCard(p237, p238, _)
	local v838 = p238

	if allcards[p237].AddHealth then
		v838 = p238 - allcards[p237].AddHealth
	end

	allcards[p237]:ChangeCard({ AddHealth = p238 })
	task.spawn(function()
		ShowAttackAnimation("Damage", nil, allcards[p237].Physical)
	end)
	DisplayIconDelta(allcards[p237].PhysicalHealth, v838, nil)
	task.wait(0.1)
end
function utilsClient.WeakenCard(p240, p241, _)
	local n1 = p241 - allcards[p240].Power

	allcards[p240]:ChangeCard({ Power = p241 })
	task.spawn(function()
		ShowAttackAnimation("Weaken", nil, allcards[p240].Physical)
	end)
	DisplayIconDelta(allcards[p240].PhysicalPower, n1, nil, t8.Weaken.TimeScale)
	task.wait(0.1 / t8.Weaken.TimeScale)
end
function utilsClient.DamageCard(list, p244)
	local v845 = p244[2]
	local v846 = list[21]
	local v847 = list[2]
	local n1 = v845 - allcards[v847].Health

	allcards[v847]:ChangeCard({ Health = v845 })

	local v849 = allcards[v846] and allcards[v846].AttackEffect or "Damage"

	ShowAttackAnimation(v849, nil, allcards[v847].Physical)
	task.spawn(function()
		DisplayIconDelta(allcards[v847].PhysicalHealth, n1, nil, t8[v849].TimeScale)
	end)
	FlushDeadCards()
	task.wait(0.1 / t8[v849].TimeScale)
end
function utilsClient.SetCardHealth(p245, p246, suppressDelta)
	local card = allcards[p245]
	local n1 = p246 - card.Health

	card:ChangeCard({ Health = p246 })
	if not suppressDelta and not (card.Physical and card.Physical:GetAttribute("GasterDestroying")) then
		DisplayIconDelta(card.PhysicalHealth, n1, nil)
	end
end
function utilsClient.SetCardPower(p248, p249, _)
	local n1 = p249 - allcards[p248].Power

	allcards[p248]:ChangeCard({ Power = p249 })
	DisplayIconDelta(allcards[p248].PhysicalPower, n1, nil)
end
function utilsClient.DamageCards(p251, p252, _)
	for iterFirst, iterSecond in v169(p251) do
		local n1 = p252[iterFirst] - allcards[iterSecond].Health

		allcards[iterSecond]:ChangeCard({ Health = p252[iterFirst] })
		DisplayIconDelta(allcards[iterSecond].PhysicalHealth, n1, nil)
	end

	FlushDeadCards()
end
function utilsClient.ChangeCardCost(p254, p255, _)
	if allcards[p254] then
		allcards[p254]:ChangeCard({ Cost = p255 })
	end
end
function utilsClient.ChangeCardDescription(id, text) -- FIX (Biggs, Liquidated): level text
	if allcards[id] then
		allcards[id].ModifiedDescription = text -- the inspector and the effect stage read this field instead of the library text
		allcards[id]:ChangeCard({ ModifiedDescription = text })
	end
end
function utilsClient.ChangeCardRarity(p257, p258, _)
	if allcards[p257] then
		allcards[p257]:ChangeCard({ Rarity = p258 })
	end
end
function utilsClient.ChangeCardArchetype(p1, p2)
	if allcards[p1] then
		allcards[p1]:ChangeCard({ Archetype = p2 }) -- FIX (Rochas313): "Group: Tree" in the inspector
	end
end
function utilsClient.ChangeCardArt(p260, p261, _)
	allcards[p260]:ChangeCard({ Id = p261 })

	local v873 = u60 or data.CurrentSleeveId()
	local v874 = s1 or sleevesSleeves.Basic[1]

	if allcards[p260].Physical.Image ~= "rbxassetid://" .. v873 and allcards[p260].Physical.Image ~= "rbxassetid://" .. v874 then
		allcards[p260].Physical.Image = "rbxassetid://" .. p261
	end
end
function utilsClient.ChangeCardAnimation(p263, p264, _)
	allcards[p263]:ChangeCard({ ArtAnimation = p264 })
end
function utilsClient.GiveCardPassive(p266, p267)
	allcards[p266][p267] = true

	for iterFirst, iterSecond in v169(passiveEffects) do
		if iterFirst == p267 then
			iterSecond(allcards[p266], battleNew)
		end
	end
end
function utilsClient.RemoveCardPassive(p268, p269)
	allcards[p268][p269] = false

	if allcards[p268] and allcards[p268].PhysicalPassives and allcards[p268].PhysicalPassives:FindFirstChild(p269) then
		allcards[p268].PhysicalPassives[p269]:Destroy()
	end

	if allcards[p268][p269] then
		allcards[p268][p269] = false
	end
end
function utilsClient.OldEquipGear(p270, p271)
	if allcards[p270] and allcards[p270].PhysicalGear then
		local v886 = battleCutscenesNew(p271)

		allcards[v886.CardId] = v886

		local clone = game:GetService("ReplicatedStorage").UI.GearFrame.TemplateGear:Clone()

		clone.Parent = allcards[p270].PhysicalGear
		clone.ZIndex = allcards[p270].PhysicalGear.ZIndex + 1
		clone.Name = v886.Name
		clone.Image = "rbxassetid://" .. v886.Id
		v886.Physical = clone
		nonGameCard.BindInspect(clone, v886)
		effects.EquipGear(battleNew.Parent.Effect, nil, clone)
		clone.Visible = true
	end
end
local function v188(p272, p273)
	if p273 == 1 then
		return UDim2.fromScale(0.6, 0.5)
	end

	if p273 == 2 then
		return p272 == 1 and UDim2.fromScale(0.7, 0.25) or UDim2(0.7, 0.8)
	end

	for i = 1, p273 do
		local n1: number = 0.75

		if p272 == p273 then
			if p272 > 3 then
				n1 = 0.3
			end

			if i % 3 == 0 then
				return UDim2.fromScale(n1, 0.85)
			end

			if i % 2 == 0 then
				return UDim2.fromScale(n1, 0.5)
			end

			return UDim2.fromScale(n1, 0.15)
		end
	end
end

v188 = function(_, p275)
	if p275 == 1 then
		return UDim2.fromScale(1, 1)
	end

	if p275 == 2 then
		return UDim2.fromScale(1, 0.5)
	end

	if p275 == 3 then
		return UDim2.fromScale(1, 0.3)
	end
end

-- A gear leaves its fighter (the fighter died / went back to the hand / the gear was destroyed): the gear picture is removed from the
-- fighter and the gear shows up as its own card in the graveyard pile. If the gear card is already in the pile (a gear that was cast from
-- the hand is moved there when it is played) it is not added a second time.
function utilsClient.UnequipGear(fighterId, gearClientId, side, info)
	local gear = allcards[gearClientId]

	if gear then
		allcards[gearClientId] = nil

		local physical = gear.Physical

		if physical then
			pcall(function()
				physical:Destroy() -- the gear holder redraws the gears that are left (ChildRemoved)
			end)
		end
	end

	if info and info.CardId and not allcards[info.CardId] then
		utilsClient.AddToGraveyard(side or "", nil, info)
	end
end
function utilsClient.EquipGear(p276, p277)
	if allcards[p276] and allcards[p276].PhysicalGear then
		local v896 = battleCutscenesNew(p277)

		allcards[v896.CardId] = v896

		local clone = game:GetService("ReplicatedStorage").UI.GearFrame.TemplateGear:Clone()

		clone.ZIndex = allcards[p276].PhysicalGear.ZIndex + 1
		clone.Name = v896.Name
		clone.Image = "rbxassetid://" .. v896.Id
		v896.Physical = clone
		clone.Visible = true
		clone.Parent = allcards[p276].PhysicalGear
		clone.MouseButton1Click:connect(function()
			if u71 then
				if allcards[p276].Position == "Field" or allcards[p276].Position == "EnemyField" then
					TargetCard(allcards[p276])
				end

				return
			end

			if allcards[p276].Position == "Field" then
				if u57 then
					local u1377: boolean = false

					task.spawn(function()
						if u1377 then
							audioService.PlaySound("click1")

							local animationAnimateAsync = animation.AnimateAsync
							local battleNewVirtualHand = battleNew.VirtualHand
							local v1426 = UDim2.fromScale(0.65, 0.265)

							animationAnimateAsync(battleNewVirtualHand, { Size = v1426 }, 0.1, "Out", "Quad")

							local animationAnimate = animation.Animate
							local battleNewVirtualField = battleNew.VirtualField

							v1426 = UDim2.fromScale(0.7, 0.225)

							local v1429 = UDim2.fromScale(0.5, 0.61)

							animationAnimate(battleNewVirtualField, { Size = v1426, Position = v1429 }, 0.1, "Out", "Quad")
						else
							animation.AnimateAsync(battleNew.VirtualHand, { Size = VirtualHandSize }, 0.1, "Out", "Quad")
							animation.Animate(battleNew.VirtualField, { Size = VirtualFieldSize, Position = VirtualFieldPosition }, 0.1, "Out", "Quad")
						end

						HandRedraw()
						FieldRedraw()
					end)
				end

				if allcards[p276].Locked.IsLocked then
					warn("Card is locked")

					return
				end

				SelectCard(allcards[p276])

				return
			end

			if allcards[p276].Position ~= "EnemyField" then
				return
			end

			if not selectedcard then
				warn("No selected card")

				return
			end

			AttackCard(allcards[p276])
		end)
		nonGameCard.BindInspect(clone, v896)

		-- FIX (Flaw / Kilnkin): the old OldEquipGear played effects.EquipGear when a gear was attached, this version never played anything,
		-- so the card's EquipGearAnimation ("StaticBurn" = fire burst + "immolate" sound on Flaw) was silent and invisible.
		-- Use the gear's own EquipGearAnimation, else the fighter's, else the plain equip effect ("gun equip" sound).
		local animName = v896.EquipGearAnimation
		if not animName then
			local ok, fighterAnim = pcall(function()
				return allcards[p276].EquipGearAnimation
			end)
			animName = ok and fighterAnim or nil
		end
		local fx = (type(animName) == "string" and effects[animName]) or effects.EquipGear
		task.spawn(function()
			-- FIX: the equip effect (white ring) reads the gear's position once, a frame after the gear is created, while the gear is still at
			-- the template position (top of the card) and sliding into place (RedrawGearHolder, 0.3s). Wait for the slide so the ring lands on the gear.
			task.wait(0.35)
			if clone.Parent then
				pcall(fx, battleNew.Parent.Effect, nil, clone)
			end
		end)
	end
end
function utilsClient.ChangeCardColor(p278, p279)
	for iterFirst, iterSecond in v169(passiveEffects) do
		if iterFirst == p279 then
			iterSecond(allcards[p278], battleNew)
		end
	end

	allcards[p278]:ChangeCard({ Color = p279 })
end
function utilsClient.CardTargeted(p280)
	local v903 = allcards[p280]

	if v903 then
		audioService.PlaySound("Target Or Select")
		pcall(utilsClient.__ShowTargetMarker, v903) -- FIX: a target picked for you (only one choice) shows the marker like a click does
		ShowAttackAnimation("CardTargeted", nil, v903.Physical)
	end

	task.wait(0.1)
end

local effects2 = require(game.ReplicatedStorage.Effects)

-- FIX: melee effects (hammer / crowbar / bat / harbinger) land their hit this many seconds (x size scale) after they start.
-- The effect itself blocks for ~1s, so the damage used to appear long after the hit. Returns nil for every other effect.
function utilsClient.__MeleeImpactTime(name)
	if type(name) ~= "string" then
		return nil
	end

	local sizes = { Small = 0.6, Mid = 0.8, Large = 1 }
	local kinds = { "Hammer", "Crowbar", "Bat", "Harbinger" }

	for size, scale in pairs(sizes) do
		if string.sub(name, 1, #size) == size then
			local rest = string.sub(name, #size + 1)

			for _, kind in ipairs(kinds) do
				if string.sub(rest, 1, #kind) == kind then
					return 0.3 * scale
				end
			end
		end
	end

	return nil
end
utilsClient.__gasterTweens = setmetatable({}, { __mode = "k" }) -- FIX: physical -> its running "gaster" delete tween

-- FIX: how long (seconds after it appeared) the target marker has to be on a card before an effect is thrown at it: the marker
-- lands (0.6s on screen), then starts fading, THEN the effect plays. Used for every effect animation that has a target.
utilsClient.__MarkerSettleTime = 0.6

-- Target marker: a red dot, a white ring around it and a red ring outside that, all the same thickness (dot radius = ring
-- width). Placed on the CENTRE of the picked card, never on the mouse. It fades out after a moment; with persistent = true
-- (several cards picked) the caller keeps it and destroys it itself.
function utilsClient.__ShowTargetMarker(card, persistent)
	local physical = card and card.Physical

	if not physical or not physical.Parent then
		return nil
	end

	local diameter = math.max(physical.AbsoluteSize.X * 0.5, 22) -- bullseye = 50% of the card's width
	local marker = Instance.new("Frame")

	marker.Name = "TargetMarker"
	marker.BackgroundTransparency = 1
	marker.Active = false
	marker.AnchorPoint = Vector2.new(0.5, 0.5)
	marker.Position = UDim2.fromScale(0.5, 0.5)
	marker.Size = UDim2.fromOffset(diameter, diameter)
	marker.ZIndex = physical.ZIndex + 500

	local rings = {}

	for index, ring in ipairs({
		{ 1, Color3.fromRGB(230, 20, 20) },
		{ 2 / 3, Color3.fromRGB(255, 255, 255) },
		{ 1 / 3, Color3.fromRGB(230, 20, 20) }
		}) do
		local frame = Instance.new("Frame")

		frame.Name = "Ring" .. index
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.Position = UDim2.fromScale(0.5, 0.5)
		frame.Size = UDim2.fromScale(ring[1], ring[1])
		frame.BackgroundColor3 = ring[2]
		frame.BorderSizePixel = 0
		frame.Active = false
		frame.ZIndex = marker.ZIndex + index
		frame.Parent = marker

		local corner = Instance.new("UICorner")

		corner.CornerRadius = UDim.new(1, 0)
		corner.Parent = frame
		table.insert(rings, frame)
	end

	marker:SetAttribute("Born", os.clock()) -- FIX: effect animations wait until the marker has landed and begun to fade (see ShowEffectAnimation)
	marker.Parent = physical

	if not persistent then
		task.delay(0.6, function()
			for _, frame in ipairs(rings) do
				game:GetService("TweenService"):Create(frame, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
			end

			task.wait(0.25)
			marker:Destroy()
		end)
	end

	return marker
end
function ShowAttackAnimation(p281, p282, p283, p284)
	local v908 = nil

	if type(p281) == "table" then
		local v909, v910 = unpack(p281)

		p281 = v909
		v908 = v910
	end

	if not t8[p281] then
		t8[p281] = { TimeScale = 1 }
	else
		local v911 = t8[p281]

		v911.TimeScale = v911.TimeScale + 0.05
	end

	if u65 and u90 then
		return
	end

	if p284 then
		if effects2[p284 .. p281] then
			local meleeHit = utilsClient.__MeleeImpactTime(p284 .. p281)

			if meleeHit then
				-- FIX: let the swing play on its own and hand control back when it hits, so DamageCards lands with the hit
				task.spawn(effects2[p284 .. p281], battleNew.Parent.Effect, p282, p283, v908, t8[p281].TimeScale)
				task.wait(meleeHit)

				return
			end

			effects2[p284 .. p281](battleNew.Parent.Effect, p282, p283, v908, t8[p281].TimeScale)

			return
		end

		if effects2[p281] then
			effects2[p281](battleNew.Parent.Effect, p282, p283, v908, t8[p281].TimeScale)

			return
		end

		if p281 then
			warn("Unimplemented attack effect", p284 .. p281)
		end

		effects2.Generic(battleNew.Parent.Effect, p282, p283, p281, v908)

		return
	end

	if not effects2[p281] then
		warn("Unimplemented attack effect", p281)
		effects2.Generic(battleNew.Parent.Effect, p282, p283, p281, v908)

		return
	end

	effects2[p281](battleNew.Parent.Effect, p282, p283, v908, t8[p281].TimeScale)
end
function ShowEffectAnimation(p285, p286, p287, p288, p289, p290)
	if u65 and u90 then
		return
	end

	local v918 = allcards[p286]
	local v919 = allcards[p287]
	local v920 = nil
	local v921 = nil

	if v918 then
		v920 = v918.Physical
	end

	if v919 then
		v919 = v919.Physical
	end

	if p290 then
		v921 = p290
	end

	-- DogeBark positions its speech bubble from the card's rendered screen position.
	-- Wait for the newly summoned card's UI layout to settle before the effect reads it.
	if p288 == "DogeBark" and v920 and v920.Parent then
		local runService = game:GetService("RunService")
		local lastPosition = v920.AbsolutePosition
		local lastSize = v920.AbsoluteSize
		local stableFrames = 0

		for _ = 1, 12 do
			runService.RenderStepped:Wait()

			if not v920.Parent then
				break
			end

			local currentPosition = v920.AbsolutePosition
			local currentSize = v920.AbsoluteSize
			if currentPosition == lastPosition and currentSize == lastSize then
				stableFrames += 1
				if stableFrames >= 2 then
					break
				end
			else
				stableFrames = 0
				lastPosition = currentPosition
				lastSize = currentSize
			end
		end
	end

	if not effects2[p288] then
		warn("Unimplemented action effect", p288)

		return
	end

	if p289 then
		task.wait(0.2)

		if v920.Visible == false then
			v920.ImageTransparency = 0
			v920.Visible = true
		end
	end

	-- FIX: don't start an effect on a target the instant it is picked: let the target marker land on the card and begin to fade first.
	-- (Applies to every effect animation that is thrown at a card that carries a marker.)
	if v919 and v919.Parent then
		local pickedMarker = v919:FindFirstChild("TargetMarker")
		local born = pickedMarker and pickedMarker:GetAttribute("Born")

		if born then
			local left = born + utilsClient.__MarkerSettleTime - os.clock()

			if left > 0 then
				task.wait(math.min(left, 1.2))
			end
		end
	end

	if p288 == "gaster" and v919 then
		local physical = v919
		if physical and physical.Parent then
			-- FIX: no marker yet (the target was picked by the server / the opponent): put one on the card and let it land + fade first
			if not physical:FindFirstChild("TargetMarker") then
				local targetCard = allcards[p287]
				local okMarker, shown = false, nil

				if targetCard then
					okMarker, shown = pcall(utilsClient.__ShowTargetMarker, targetCard)
				end

				if okMarker and shown then
					audioService.PlaySound("Target Or Select")
					task.wait(utilsClient.__MarkerSettleTime)
				end
			end

			if physical.Parent then
				-- the marker is NOT destroyed any more: it is a child of the card, shrinks with it and removes itself when it has faded
				physical:SetAttribute("GasterDestroying", true)
				audioService.PlaySound("Gaster Fade")
				local tweenService = game:GetService("TweenService")
				-- FIX: same speed as the original (0.5s) but it does NOT block the queue until it is finished. It used to be waited out
				-- completely, so the card's death effect ("When this card dies") flashed on a card that was already invisible.
				-- Now the queue continues right away, so the death effect plays while the card is still shrinking; SendToGraveyard stops the tween.
				local tween = tweenService:Create(physical, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, 0, 0, 0),
					Rotation = physical.Rotation + 720,
				})
				utilsClient.__gasterTweens[physical] = tween
				tween.Completed:Connect(function(state)
					if state == Enum.PlaybackState.Completed then
						audioService.PlaySound("FastSplat")
					end
				end)
				tween:Play()
				task.wait() -- hand the queue back right away: the death effect (flash) plays while the card is still shrinking
			end
		end
	else
		effects2[p288](battleNew.Parent.Effect, v920, v919, p285, v921)
	end
	utilsFireServer("ResumeTimer", u73)
end
utilsClient.__NonBlockingAnims = { DogeBark = true, DogeDogeBark = true }
utilsClient.__MeleeBusy = 0 -- melee swings (hammer / crowbar / bat / harbinger) that have started and not finished yet

-- Holds the queue until every melee swing in flight has finished (+ a moment for the hammer to fade). Capped, so a stuck effect can't freeze the queue.
function utilsClient.__WaitMelee()
	local waited = 0

	while utilsClient.__MeleeBusy > 0 and waited < 4 do
		task.wait(0.05)

		waited += 0.05
	end

	if waited > 0 then
		task.wait(0.15)
	end
end
function utilsClient.PlayEffectCardAnimation(p291, p292, p293, p294, p295, p296)
	-- FIX: melee cast animations (e.g. HyperVoxel's MidHammerEffectAll) hand the queue back at the moment of the hit,
	-- so the damage that follows is shown with the hit instead of after a server-side guess
	local meleeHit = utilsClient.__MeleeImpactTime(p294)

	if meleeHit and effects2[p294] and not (u65 and u90) then
		-- FIX (Ban Hammer et al.): remember that a melee swing is still in flight. The queue is handed back at the hit, but the swing (and the
		-- wait for the target marker before it, which the hit time does not include) goes on: a card that was obliterated / destroyed by it must not
		-- leave the board until it is over (see utilsClient.__WaitMelee, used by VanishCard and CardsDied), or the swing plays on a card that is gone.
		task.spawn(function()
			utilsClient.__MeleeBusy += 1

			local okSwing, errSwing = pcall(ShowEffectAnimation, p291, p292, p293, p294, p295, p296)

			utilsClient.__MeleeBusy -= 1

			if not okSwing then
				warn("Melee effect errored", p294, errSwing)
			end
		end)
		task.wait(meleeHit)

		return
	end

	-- FIX (Shamrock Doge: "Summon a Doge. Draw a card."): the Doge's bark speech bubble blocked the queue until it was finished, so the draw
	-- that comes right after the summon only happened after the bark. These cast animations are only decoration (a bubble + a sound), so they
	-- play on their own thread and the queue carries on straight away.
	if utilsClient.__NonBlockingAnims[p294] then
		task.spawn(ShowEffectAnimation, p291, p292, p293, p294, p295, p296)
		task.wait(0.1)

		return
	end

	ShowEffectAnimation(p291, p292, p293, p294, p295, p296)
	task.wait(0.1)
end
function utilsClient.PlayBossAnimation(p297, p298)
	local v930 = allcards[p297.CardId]
	local u931 = nil

	if v930 then
		u931 = v930.Physical
	end

	task.spawn(function()
		local v1378 = cardAnim(u931, p298[2], p297.Foil, nil, { BossName = p298[1], LoopAnim = p298[4] })

		repeat
			task.wait(0.1)
		until v1378 == true

		if p297.IdleOverride then
			cardAnim(u931, p297.IdleOverride, p297.Foil, nil, { LoopAnim = true, BossName = p298[1] })

			return
		end

		cardAnim(u931, "Idle", p297.Foil, nil, { LoopAnim = true, BossName = p298[1] })
	end)
	task.wait(p298[3])
end
function utilsClient.DelayClient(p299)
	task.wait(p299)
end
function utilsClient.PlayBackgroundModelAnimation(list)
	if not u80 then
		print("Not in valid battle for background animations")

		return
	end

	local v934 = list[2]
	local v935 = list[3]
	local v936 = backgroundModels.GetModelByName(list[1])

	if v936 and v936:FindFirstChild("Animations") and v936:FindFirstChild("Animations"):FindFirstChild(v934) then
		local backgroundModelsPlayAnimation = backgroundModels.PlayAnimation
		local foundChild = v936:FindFirstChild("Animations"):FindFirstChild(v934)

		backgroundModelsPlayAnimation(v936, foundChild, v935)
		task.wait(0.1)

		return
	end

	warn("Animations are not set for this model or model is missing")
end
function utilsClient.ReplaceEffectCard(p301, p302)
	for iterFirst, iterSecond in v169(p302) do
		for iterFirst2, iterSecond2 in v169(passiveEffects) do
			if iterFirst2 == iterFirst then
				iterSecond2(allcards[p301], battleNew)
			end
		end
	end

	allcards[p301]:ChangeCard(p302)
end

local t15: {[any]: any} = {}
local u191: boolean = false

local function AskForFaceAttack()
	if u191 then
		return
	end

	if not u66 then
		return
	end

	if not selectedcard then
		v88("No selected card")

		return
	end

	if selectedcard.Locked.IsLocked then
		v88("selectedcard was locked")

		return
	end

	u191 = true
	utilsFireServer("AttackFace", u73, selectedcard.CardId)
	task.wait()
	DeselectCard()
	task.wait(0.5)
	u191 = false
end

local t16: {[any]: any} = {}

function NewFace(p303, p304, _, p306, p307)
	local u950 = u166
	local v951 = u60 or data.CurrentSleeveId()

	if p303 == "Enemy" then
		u950 = u165
		v951 = s1 or sleevesSleeves.Basic[1]
	end

	if t16[u950.Name] and t16[u950.Name].Parent then
		return t16[u950.Name]
	end

	local clone = u4.PlayerCard:Clone()

	if not p306 then
		clone.DumbFace.Image = "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userId=" .. u950.userId

		if p307 then
			clone.DumbSubFace.Visible = true
			clone.DumbSubFace.Image = "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userId=" .. p307.userId
			clone.DumbSubFace.Position = UDim2.fromScale(0.1, 0.2)
			clone.DumbSubFace.ImageColor3 = Color3.new(0, 0, 0)
			clone.DumbFace.Position = UDim2.fromScale(-0.1, 0.2)
		end
	else
		clone.DumbFace.Image = "rbxassetid://" .. p306
	end

	if not p307 then
		clone.Title.Text = tostring(u950.VisualName)
	elseif game.Players:FindFirstChild(p307.Name) then
		local displayName = game.Players:FindFirstChild(p307.Name).DisplayName
		local cloneTitle = clone.Title
		local text: string = tostring(u950.VisualName)
		local text2: string = tostring(displayName)

		cloneTitle.Text = text .. " & " .. text2
	else
		local title = clone.Title
		local text: string = tostring(u950.VisualName)
		local text3: string = tostring(p307.Name)

		title.Text = text .. " & " .. text3
	end

	clone.HP.Text = p304 and p304 or u164.StartingLife
	clone.Back.Image = "rbxassetid://" .. v951
	pcall(function()
		clone.Rank.Text = utilsInvokeServer("GetPlayerRankFromName", u950.Name) or "AAAAAAAAA"
	end)
	pcall(function()
		local t35 = utilsInvokeServer("GetPlayerFactionFromName", u950.Name) or {}

		if not t35 or not t35[1] then
			clone.FactionLogo.Image = ""

			return
		end

		if t35[1] == "CRP" then
			clone.FactionLogo.Image = "rbxassetid://" .. config.LOGOS.Astral

			return
		end

		if t35[1] == "Lordbreakers" then
			clone.FactionLogo.Image = "rbxassetid://" .. config.LOGOS.Lordbreaker

			return
		end

		if t35[1] == "Leviathan" then
			clone.FactionLogo.Image = "rbxassetid://" .. config.LOGOS.Vitality

			return
		end

		clone.FactionLogo.Image = "rbxassetid://" .. config.LOGOS[t35[1]]
	end)

	if u950 ~= LocalPlayer then
		clone.MouseButton1Down:connect(AskForFaceAttack)
	end

	t16[u950.Name] = clone
	clone.Parent = battleNew[p303 .. "Field"]

	return clone
end
function utilsClient.HideFace(p308)
	local v961 = u166

	if p308 == "Enemy" then
		v961 = u165
	end

	t16[v961.Name].Parent = battleNew[p308 .. "PlayerSlot"]
	task.wait(0.1)
end
function utilsClient.RevealFace(p309, p310, _)
	local v965 = NewFace(p309, p310)

	v965.HP.Text = p310 and p310 or v965.HP.Text

	if playerGui:FindFirstChild("DodgeModeUI").Enabled == true then
		v965.Parent = battleNew[p309 .. "PlayerSlot"]
	else
		v965.Parent = battleNew[p309 .. "Field"]
	end

	v965.Visible = true
	task.wait(0.1)
end
function utilsClient.SwapSubFace(p312, p313)
	local v968 = NewFace(p312)

	if v968.DumbSubFace and v968.DumbSubFace.Visible == true then
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		if v968.DumbSubFace.Image == "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userId=" .. p313.userId then
			local tweenService: TweenService = game:GetService("TweenService")
			local dumbSubFace = v968.DumbSubFace
			local v972 = UDim2.fromScale(-0.1, 0.2)

			tweenService:Create(dumbSubFace, tweenInfo, { ImageColor3 = Color3.new(1, 1, 1), Position = v972 }):Play()

			local tweenService2: TweenService = game:GetService("TweenService")
			local dumbFace = v968.DumbFace

			v972 = UDim2.fromScale(0.1, 0.2)
			tweenService2:Create(dumbFace, tweenInfo, { ImageColor3 = Color3.new(0, 0, 0), Position = v972 }):Play()
			v968.DumbSubFace.ZIndex = 4
			v968.DumbFace.ZIndex = 3
		else
			local tweenService: TweenService = game:GetService("TweenService")
			local v976 = v968.DumbFace
			local v977 = UDim2.fromScale(-0.1, 0.2)

			tweenService:Create(v976, tweenInfo, { ImageColor3 = Color3.new(1, 1, 1), Position = v977 }):Play()

			local tweenService3: TweenService = game:GetService("TweenService")
			local v979 = v968.DumbSubFace

			v977 = UDim2.fromScale(0.1, 0.2)
			tweenService3:Create(v979, tweenInfo, { ImageColor3 = Color3.new(0, 0, 0), Position = v977 }):Play()
			v968.DumbSubFace.ZIndex = 3
			v968.DumbFace.ZIndex = 4
		end

		task.wait(0.1)
	end
end
function utilsClient.RevealBothFaces(list)
	utilsClient.RevealFace("", list[1])
	utilsClient.RevealFace("Enemy", list[2])
end
function utilsClient.UpdateLife(p315, p316)
	t16[LocalPlayer.Name].HP.Text = p315
	t16[u165.Name].HP.Text = p316
end
function utilsClient.AttackFace(p317, p318, p319, p320, p321, p322)
	local v989 = u166

	if p317 == "Enemy" then
		v989 = u165
	end

	if not v989 then
		return
	end

	local v990 = t16[v989.Name]

	v989 = allcards[p318]

	if v989 == nil then
		v990.HP.Text = p320
	else
		local v991 = v989.Position
		local parent = v989.Physical.Parent
		local v993 = v990.Parent

		utilsSetZIndex(v990, battleNew.VirtualStage.Height.Value)
		utilsSetZIndex(v989.Physical, battleNew.VirtualStage.Height.Value)

		if not u80 and not u81 and not v989.NoFieldMovement then
			if v989.Physical.Parent then
				v989.Physical.Parent = battleNew.Stage
			end

			v990.Parent = battleNew.Stage
		elseif v989.Physical.Parent then
			if not v989.NoFieldMovement then
				v989.Physical.Parent = battleNew.Stage
				v989.Physical.Parent = parent
			end

			utilsSetZIndex(v989.Physical, configCardzindex)
		end

		task.wait(0.35)

		if not p322 then
			ShowAttackAnimation(p321 and p321 or v989.AttackEffect, v989.Physical, v990, if p319 < 350 then "Small" else if p319 >= 350 and p319 < 700 then "Mid" else "Large")
		end

		DisplayIconDelta(v990.HP, p319 * -1)
		v990.HP.Text = p320
		task.wait(0.25)
		FlushDeadCards()
		task.wait(0.25)

		-- FIX: a dead attacker must not be moved back onto the field (it goes to the graveyard instead)
		if v989.Physical.Parent and not u80 and not u81 and not v989.NoFieldMovement and v989.Position ~= "Graveyard" and v989.Position ~= "EnemyGraveyard" and t13[v989.CardId] ~= true then
			v989:MoveTo(v991)
		end

		if v990.Parent then
			v990.Parent = v993
			utilsSetZIndex(v990, configCardzindex)
		end
	end

	task.wait(0.1)
end
function utilsClient.BurnFace(p323, p324, p325, p326, p327, p328)
	local v1000 = u166

	if p323 == "Enemy" then
		v1000 = u165
	end

	if not v1000 then
		return
	end

	local v1001 = t16[v1000.Name]

	if p324 == nil or p324 == false then
		DisplayIconDelta(v1001.HP, p325 * -1)
		v1001.HP.Text = p326

		return
	end

	v1000 = allcards[p324]

	if string.find(p324, "Blessing") then
		local parts = string.split(p324, "Blessing")
		local v1003 = battleNew.HandSlots[p323 .. "HandSlots"]
		local text: string = tostring(parts[2])

		if not p328 then
			ShowAttackAnimation({ p327, p325 }, v1003[text], v1001, "")
		end

		task.wait(1.5)
		DisplayIconDelta(v1001.HP, p325 * -1)
		v1001.HP.Text = p326

		return
	end

	local s1: string = if math.abs(p325) > 500 then "Large" else ""

	if p327 == "GenericBurn" or p327 == "GenericLifegain" then
		s1 = ""
	end

	local s2: string = p327 .. s1

	if v1000 == nil then
		v1001.HP.Text = p326
	else
		local v1007 = v1000.Position
		local parent = v1000.Physical.Parent
		local v1009 = v1001.Parent

		utilsSetZIndex(v1001, battleNew.VirtualStage.Height.Value)
		utilsSetZIndex(v1000.Physical, battleNew.VirtualStage.Height.Value)

		if not u80 and not u81 and not v1000.NoFieldMovement and s1 == "Large" and effects[s1 .. p327] then
			if v1000.Physical.Parent then
				v1000.Physical.Parent = battleNew.Stage
			end

			v1001.Parent = battleNew.Stage
			task.wait(0.15)
		elseif v1000.Physical.Parent then
			if not v1000.NoFieldMovement then
				v1000.Physical.Parent = battleNew.Stage
				v1000.Physical.Parent = parent
			end

			utilsSetZIndex(v1000.Physical, configCardzindex)
		end

		task.wait(0.1)

		if not p328 then
			ShowAttackAnimation({ p327, p325 }, v1000.Physical, v1001, s1)
		end

		if p327 == "GenericBurn" or p327 == "GenericLifegain" then
			task.spawn(function()
				task.wait(1)
				DisplayIconDelta(v1001.HP, p325 * -1)
				v1001.HP.Text = p326
			end)
		else
			DisplayIconDelta(v1001.HP, p325 * -1)
			v1001.HP.Text = p326
		end

		FlushDeadCards()
		task.wait(0.05)

		if s1 == "Large" then
			task.wait(0.2)
		end

		if v1000.Physical.Parent and not u80 and not u81 and not v1000.NoFieldMovement then
			v1000:MoveTo(v1007)
		end

		if v1001.Parent then
			v1001.Parent = v1009
			utilsSetZIndex(v1001, configCardzindex)

			return
		end
	end
end
function utilsClient.Fatigue(p329, p330, p331)
	local v1013 = u166

	if p329 == "Enemy" then
		v1013 = u165
	end

	local v1014 = t16[v1013.Name]

	v1013 = v1014.Parent
	local deckFrame = if p329 == "Enemy" then battleNew.VirtualEnemyDeck else battleNew.VirtualDeck

	ShowAttackAnimation({ "Fatigue", p330 }, deckFrame, v1014)
	v1014.HP.Text = p331
	DisplayIconDelta(v1014.HP, p330 * -1)
	task.wait(0.1)
end

local t17: {[any]: any} = { ["."] = 0.2, ["!"] = 0.4, ["?"] = 0.4 }

function utilsClient.EnemySpeech(p332, p333)
	local v1017 = t16[u165.Name]
	local clone = game:GetService("ReplicatedStorage").UI.TextTemplate:Clone()

	clone.Parent = battleNew.Effect
	clone.Position = UDim2.fromOffset(v1017.AbsolutePosition.X + v1017.AbsoluteSize.X / 2, v1017.AbsolutePosition.Y + v1017.AbsoluteSize.Y)
	clone.Visible = true

	local v1019 = UDim2.fromOffset(v1017.AbsolutePosition.X + v1017.AbsoluteSize.X / 2 - clone.TextTail.AbsoluteSize.X / 2, v1017.AbsolutePosition.Y + v1017.AbsoluteSize.Y + clone.AbsoluteSize.Y)

	clone:TweenPosition(v1019, "Out", "Quart", 0.5)

	local replacedText = p332:gsub("<br%s*/>", "\n")

	replacedText:gsub("<[^<>]->", "")
	clone.Text = replacedText

	local n1: number = 0

	v1019 = string.len(clone.ContentText)

	for iterFirst, iterSecond in utf8.graphemes(replacedText) do
		local substring = clone.ContentText:sub(iterFirst, iterSecond)

		n1 += 1
		clone.MaxVisibleGraphemes = n1

		if v1019 > clone.MaxVisibleGraphemes and n1 % 2 == 0 then
			audioService.PlaySound(p333 or "textblip")
		end

		task.wait(t17[substring] or 0.016)
	end

	task.wait(0.6)
	task.spawn(function()
		task.wait(0.4)
		animation.AnimateAsync(clone.TextTail, { ImageTransparency = 1 }, 0.6, "In", "Quart")
		animation.Animate(clone, { TextTransparency = 1, BackgroundTransparency = 1 }, 0.6, "In", "Quart")
		clone:Destroy()
	end)
end
function utilsClient.NyarlSpeech(p334)
	v88("tried to say thingy")

	local v1026 = t16[u165.Name]

	effects.NyarlSpeech(battleNew.Parent.Effect, t16, p334)
end
function utilsClient.NPCSpeech(p335, p336, p337)
	local v1030 = t16[u165.Name]
	local clone = game:GetService("ReplicatedStorage").UI.NPCTextTemplate:Clone()

	clone.Parent = battleNew.Effect

	local v1032 = UDim2.fromOffset(clone.AbsolutePosition.X, clone.AbsolutePosition.Y + 50)

	clone.Visible = true
	clone:TweenPosition(v1032, "Out", "Quart", 0.5)

	local replacedText = p336:gsub("<br%s*/>", "\n")

	replacedText:gsub("<[^<>]->", "")
	clone.Text = replacedText
	clone.NPCName.Text = p335
	v1032 = 0

	local v1034 = string.len(clone.ContentText)

	for iterFirst, iterSecond in utf8.graphemes(replacedText) do
		local substring = clone.ContentText:sub(iterFirst, iterSecond)

		v1032 += 1
		clone.MaxVisibleGraphemes = v1032

		if v1034 > clone.MaxVisibleGraphemes and v1032 % 2 == 0 then
			audioService.PlaySound(p337 or "textblip")
		end

		task.wait(t17[substring] or 0.016)
	end

	task.wait(0.6)
	task.spawn(function()
		task.wait(0.4)
		animation.AnimateAsync(clone.NPCName, { TextTransparency = 1, BackgroundTransparency = 1 }, 0.6, "In", "Quart")
		animation.Animate(clone, { TextTransparency = 1, BackgroundTransparency = 1 }, 0.6, "In", "Quart")
		clone:Destroy()
	end)
end
function utilsClient.CostOverload(p338, p339, p340, p341, p342)
	utilsClient.BurnFace(p339, p338, p340, p341, p342 or "Overload")
end
function utilsClient.CostHealth(p343, p344, p345, p346, p347)
	utilsClient.BurnFace(p344, p343, p345, p346, p347 or "GenericBurn")
end
function utilsClient.GrantHealth(p348, p349, p350, p351, p352)
	utilsClient.BurnFace(p349, p348, p350, p351, p352 or "GenericLifegain")
end
function utilsClient.PlayLossAnimation(p353)
	local v1054 = t16[p353.Name]

	utilsSetZIndex(v1054, 11000)
	v1054.Parent = battleNew.Stage
	task.wait(0.8)
	effects.Lose(battleNew.Parent.Effect, v1054, v1054)
end
function utilsClient.EnterRage(p354)
	effects.EnterRage(battleNew[p354 .. "Effect"], nil, nil, p354)
end
function utilsClient.EnterUnrecognizable(p355)
	local boolValue: BoolValue = Instance.new("BoolValue")

	boolValue.Name = p355 .. "Scrambled"
	boolValue.Value = true
	boolValue.Parent = u4.Effect
end
function utilsClient.EnterBliss()
	v88("entering bliss")
	effects.Bliss(battleNew.Effect)
end
function utilsClient.EnterCrowdsFavour()
	v88("entering crowd's favour")
	effects.CrowdsFavour(battleNew.Effect)
end
function utilsClient.Moonward(p356, p357)
	local v1060 = allcards[p357]

	if not v1060 or not v1060.Physical then
		warn("Moonward: card or Physical object missing")

		return
	end

	effects.Moonward(battleNew[p356 .. "Effect"], v1060.Physical, nil, p356)
	task.wait(0.2)
end
function utilsClient.Ransack(p358, p359)
	effects.Ransack(u4.Effect, nil, nil, p358, p359)
	task.wait(0.1)
end
function utilsClient.AttackCard(p360, p361, list, p363)
	local v1067, v1068 = unpack(p360)
	local physical = allcards[v1067].Physical
	local v1070 = allcards[v1068].Physical
	local physicalParent = physical.Parent
	local parent = v1070.Parent
	local v1073 = list[1]
	local v1074 = list[2]

	if not u80 and not u81 and not allcards[v1067].NoFieldMovement and not allcards[v1068].NoFieldMovement then
		physical.Parent = battleNew.Stage

		if not v1070.Parent then
			v88(allcards[v1068].Name)
		end

		v1070.Parent = battleNew.Stage
	else
		if not allcards[v1067].NoFieldMovement then
			physical.Parent = battleNew.Stage

			if physical.Parent then
				physical.Parent = physicalParent
			end
		end

		if not allcards[v1068].NoFieldMovement then
			if not v1070.Parent then
				v88(allcards[v1068].Name)
			end

			v1070.Parent = battleNew.Stage

			if v1070.Parent then
				v1070.Parent = parent
			end
		end
	end

	utilsSetZIndex(physical, battleNew.VirtualStage.Height.Value)
	utilsSetZIndex(v1070, battleNew.VirtualStage.Height.Value)
	task.wait(0.33)

	local v1075 = allcards[v1067].AttackEffect
	local v1076 = allcards[v1068].AttackEffect

	if allcards[v1067].Nurtured and allcards[v1067].NurturedAttackEffect then
		v1075 = allcards[v1067].NurturedAttackEffect
	end

	if allcards[v1068].Nurtured and allcards[v1068].NurturedAttackEffect then
		v1076 = allcards[v1068].NurturedAttackEffect
	end

	ShowAttackAnimation(v1075, physical, v1070, if v1073 < 350 then "Small" else if v1073 >= 350 and v1073 < 700 then "Mid" else "Large")

	if p363 ~= false then
		ShowAttackAnimation(v1076, v1070, physical, if v1074 < 350 then "Small" else if v1074 >= 350 and v1074 < 700 then "Mid" else "Large")
	end

	local attackerCard = allcards[v1067]
	local defenderCard = allcards[v1068]

	utilsClient.DamageCards(p360, p361)
	task.wait(0.25)
	FlushDeadCards(p360)
	task.wait(0.25)

	-- FIX (cards stuck on the field, small and glitching upwards): the cards used to be put back into their field slots here
	-- even when they had died and were already sent to the graveyard in the meantime (FlushDeadCards above, or CardsDied
	-- arriving during the attack). A dead card dragged back into the field row stays there. Only live cards go back now.
	local function leftTheField(card)
		return card == nil or card.Health <= 0 or card.Position == "Graveyard" or card.Position == "EnemyGraveyard" or t13[card.CardId] == true
	end

	if physical.Parent and not leftTheField(attackerCard) then
		physical.Parent = physicalParent
		utilsSetZIndex(physical, configCardzindex)
	end

	if v1070.Parent and not leftTheField(defenderCard) then
		v1070.Parent = parent
		utilsSetZIndex(v1070, configCardzindex)
	end

	task.wait(0.1)
end
function utilsClient.DrawCard(p364, p365, p366)
	local you = p364.You
	local enemy = p364.Enemy
	local t28: {[any]: any} = {}

	task.spawn(function()
		if you then
			for iterFirst, iterSecond in v169(you) do
				t28[1] = true

				local v1382 = nil

				if not iterSecond.Name then
					local v1383 = u60 or data.CurrentSleeveId()

					v1382 = NewFlippedCard(v1383)
				end

				local v1384 = battleCutscenesNew(iterSecond, v1382)

				v1384.Physical.Position = UDim2.new(1, 0, 1, 0)
				v1384.Owner = u70
				allcards[iterSecond.CardId] = v1384
				v1384:MoveTo("Hand")
				audioService.PlaySound("Draw")
				battleNew.VirtualDeck.BackgroundColor3 = Color3.fromRGB(45, 113, 144)
				task.wait(0.03333333333333333)
				battleNew.VirtualDeck.BackgroundColor3 = Color3.fromRGB(0, 62, 103)
			end
		end
	end)
	task.spawn(function()
		if enemy then
			for iterFirst, iterSecond in v169(enemy) do
				t28[2] = true

				local v1387 = battleCutscenesNew(iterSecond, NewFlippedCard())

				v1387.Owner = "Enemy"
				allcards[v1387.CardId] = v1387
				v1387:MoveTo("EnemyHand")
				audioService.PlaySound("Draw")
				battleNew.VirtualEnemyDeck.BackgroundColor3 = Color3.fromRGB(159, 15, 15)
				task.wait(0.03333333333333333)
				battleNew.VirtualEnemyDeck.BackgroundColor3 = Color3.fromRGB(91, 23, 25)
			end

			battleNew.EnemyHandCount.Text = "x" .. #battleNew.EnemyHand:GetChildren()
		end
	end)

	if not t28[1] and not t28[2] then
		u118("Undrawable cards were destroyed!")
		task.wait(0.2)
	end

	if not p366 and p365 then
		for iterFirst, iterSecond in v169(p365) do
			utilsClient.SetDeckAmount(iterFirst, iterSecond)
		end
	end

	task.wait(0.1)
end
function utilsClient.SetDeckAmount(p367: string, p368, p369)
	if p367 == "You" then
		p367 = ""
	end

	battleNew["Virtual" .. p367 .. "Deck"][p367 .. "DeckLeft"].Text = "x" .. p368
	UpdateDeckTop(p367, p368, nil, p369)
end
function utilsClient.SetEnemyDeckAmount(p370: string, p371)
	if p370 == "Enemy" then
		p370 = ""
	end

	battleNew["Virtual" .. p370 .. "Deck"][p370 .. "DeckLeft"].Text = "x" .. p371
	UpdateDeckTop(p370, p371)
end
function utilsClient.SetImmortalDeckAmount(p372: string, p373)
	if p372 == "You" then
		p372 = ""
	end

	if battleNew[p372 .. "ImmortalDeckLeft"].Visible == false then
		battleNew[p372 .. "ImmortalDeckLeft"].Visible = true
	end

	battleNew[p372 .. "ImmortalDeckLeft"].Text = "Swords:" .. p373 .. "/18"
end
function UpdateDeckTop(p374: string, p375, p376, p377)
	if p374 == "You" or p374 == nil then
		p374 = ""
	end

	if p375 and p375 == 0 then
		battleNew["Virtual" .. p374 .. "Deck"].DeckCard.Visible = false
	elseif battleNew["Virtual" .. p374 .. "Deck"].DeckCard.Visible == false then
		battleNew["Virtual" .. p374 .. "Deck"].DeckCard.Visible = true
	end

	local v1096 = u60 or data.CurrentSleeveId()

	if p374 == "Enemy" then
		v1096 = s1 or sleevesSleeves.Basic[1]
	end

	if p377 ~= true then
		battleNew["Virtual" .. p374 .. "Deck"].DeckCard.Image = "rbxassetid://" .. v1096
	end

	if p376 then
		battleNew["Virtual" .. p374 .. "Deck"].DeckCard.Image = "rbxassetid://" .. p376.Id

		local clone = battleNew["Virtual" .. p374 .. "Deck"].DeckCard:Clone()

		clone.Name = p374 .. "DeckInspect"
		clone.ImageTransparency = 1
		clone.Parent = battleNew["Virtual" .. p374 .. "Deck"].DeckCard
		nonGameCard.BindInspect(clone, p376)

		if p374 == "Enemy" then
			u82 = p376

			return
		end
	else
		if p377 ~= true then
			battleNew["Virtual" .. p374 .. "Deck"].DeckCard:ClearAllChildren()
		end

		if p374 == "Enemy" then
			u82 = false
		end
	end
end
local function WaitForTarget()
	local v1098: boolean = u66

	utilsFireServer("ReadyToTarget", u73)

	repeat
		task.wait()
	until u71 ~= true or v1098 ~= u66 or u72 == false

	if v1098 ~= u66 or u72 == false then
		targetArrow.Reset()
		fakeMouse.Cursors.Stop() -- FIX: the target cursor was never taken down when the choice was made for you / cancelled
		debugStats.Update("")
		u71 = nil

		if playerGui.ZoneTarget.Enabled then
			v48.ZoneTargetSelection = nil
			playerGui.ZoneTarget.Enabled = false
			playerGui.ZoneTarget.GenericTargetWindow.Visible = false
		end

		return
	end

	if u71 == nil then
		return
	end

	if not utilsInvokeServer("SetTarget", u73, u71.CardId) then
		u71 = true
		fakeMouse.Cursors.Start("Target") -- still choosing: TargetCard had stopped the cursor

		return WaitForTarget()
	end

	u71 = nil
	targetArrow.Reset()
	fakeMouse.Cursors.Stop()

	if playerGui.ZoneTarget.Enabled then
		v48.ZoneTargetSelection = nil
		playerGui.ZoneTarget.Enabled = false
		playerGui.ZoneTarget.GenericTargetWindow.Visible = false
	end

	task.wait(1)
	debugStats.Update("")
end
function utilsClient.SetActiveTarget(p378)
	u72 = p378
end
function utilsClient.SingleTarget(p379, _)
	local v1102 = allcards[p379.CardId]

	-- the arrow starts on the card that asks for the target (the middle of the board if that card can't be found).
	-- FIX: it FOLLOWS that card every frame. An action is still flying to the effect stage (and being scaled) when this request arrives,
	-- so a one-time snapshot left the arrow floating where the card used to be.
	local cardId = p379.CardId
	local lastKnown = nil

	local function currentCentre()
		local card = allcards[cardId] or v1102
		local physical = card and card.Physical

		if physical and physical.Parent and physical.AbsoluteSize.X > 0 then
			lastKnown = Vector3.new(physical.AbsolutePosition.X + physical.AbsoluteSize.X / 2, physical.AbsolutePosition.Y + physical.AbsoluteSize.Y / 2, 0)
		end

		return lastKnown or Vector3.new(battleNew.AbsolutePosition.X + battleNew.AbsoluteSize.X / 2, battleNew.AbsolutePosition.Y + battleNew.AbsoluteSize.Y / 2, 0)
	end

	fakeMouse.Cursors.Start("Target")
	u71 = true
	task.spawn(WaitForTarget)
	targetArrow.Start(currentCentre)
end

playerGui.ZoneTarget.GenericTargetWindow.Hide.MouseButton1Click:Connect(function()
	local hide = playerGui.ZoneTarget.GenericTargetWindow.Hide

	playerGui.ZoneTarget.Show.Position = UDim2.fromOffset(hide.AbsolutePosition.X, hide.AbsolutePosition.Y)
	playerGui.ZoneTarget.Show.Size = UDim2.fromOffset(hide.AbsoluteSize.X, hide.AbsoluteSize.Y)
	playerGui.ZoneTarget.Show.Visible = true
	playerGui.ZoneTarget.TargetWarning.Visible = true
	playerGui.ZoneTarget.GenericTargetWindow.Visible = false
end)
playerGui.ZoneTarget.Show.MouseButton1Click:Connect(function()
	playerGui.ZoneTarget.Show.Visible = false
	playerGui.ZoneTarget.TargetWarning.Visible = false
	playerGui.ZoneTarget.GenericTargetWindow.Visible = true
end)

function utilsClient.CloseZoneTarget()
	v48.ZoneTargetSelection = nil
	playerGui.ZoneTarget.Enabled = false
	playerGui.ZoneTarget.GenericTargetWindow.Visible = false
end
local function TargetCards(p381)
	if utilsInvokeServer("SetTarget", u73, p381) then
		audioService.PlaySound("Target Or Select")
	end
end
function utilsClient.ZoneTarget(p382, p383, p384, p385)
	local playerGuiZoneTarget = playerGui.ZoneTarget
	local playerGuiZoneTargetGenericTargetWindow = playerGuiZoneTarget.GenericTargetWindow
	local playerGuiZoneTargetGenericTargetWindowTargetHolder = playerGuiZoneTargetGenericTargetWindow.TargetHolder
	local templateTarget = playerGuiZoneTargetGenericTargetWindow.Templates.TemplateTarget
	local playerGuiZoneTargetGenericTargetWindowNameLabel = playerGuiZoneTargetGenericTargetWindow.NameLabel
	local n1: number = 0

	for iterFirst, iterSecond in v169(playerGuiZoneTargetGenericTargetWindowTargetHolder:GetChildren()) do
		if iterSecond:IsA("GuiObject") then
			iterSecond:Destroy()
		end
	end

	playerGuiZoneTargetGenericTargetWindow.NameLabel.Text = "  Select " .. p383 .. ": "
	playerGuiZoneTarget.TargetWarning.Visible = false
	playerGuiZoneTarget.Show.Visible = false
	playerGuiZoneTarget.Enabled = true
	playerGuiZoneTargetGenericTargetWindow.Visible = true

	local t29: {[any]: any} = {}

	if p385 >= 0 and p384 <= 0 then
		playerGuiZoneTargetGenericTargetWindow.Select.BackgroundColor3 = Color3.fromRGB(76, 162, 76)
	else
		playerGuiZoneTargetGenericTargetWindow.Select.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
	end

	for iterFirst2, iterSecond2 in v169(p382) do
		n1 += 1

		local u1122 = iterSecond2.CardId

		if not allcards[u1122] then
			local v1123 = battleCutscenesNew(iterSecond2)

			u1122 = v1123.CardId
			allcards[u1122] = v1123
		end

		if allcards[u1122] then
			local clone = allcards[u1122].Physical:Clone()

			clone.ZIndex = clone.ZIndex + templateTarget.ZIndex

			local clone3 = templateTarget.UIAspectRatioConstraint:Clone()

			clone3.Parent = clone

			local added: BoolValue = Instance.new("BoolValue")

			added.Name = "Added"
			added.Parent = clone
			clone.Parent = playerGuiZoneTargetGenericTargetWindowTargetHolder
			clone.LayoutOrder = n1 -- FIX: keep the order the server sent (hand order)
			clone.Size = UDim2.fromOffset(playerGuiZoneTargetGenericTargetWindowTargetHolder.AbsoluteSize.Y * 0.627, playerGuiZoneTargetGenericTargetWindowTargetHolder.AbsoluteSize.Y - 12)

			for iterFirst3, iterSecond3 in v169(clone:GetChildren()) do
				if iterSecond3:IsA("GuiObject") then
					iterSecond3:Destroy()
				end
			end

			local clone4 = templateTarget.Target:Clone()

			clone4.ZIndex = clone.ZIndex + 1
			clone4.Parent = clone

			-- FIX: the picked-card marker is a bullseye (red dot, white ring, red ring, equal thickness), drawn here so it shows even if the
			-- template image doesn't load. It sits BEHIND the card text / inspect panel (no raised ZIndex, no clicks).
			clone4.ImageTransparency = 1

			do
				local rings = {
					{ 1, Color3.fromRGB(230, 20, 20) },
					{ 2 / 3, Color3.fromRGB(255, 255, 255) },
					{ 1 / 3, Color3.fromRGB(230, 20, 20) }
				}

				for ringIndex, ring in ipairs(rings) do
					local ringFrame = Instance.new("Frame")

					ringFrame.Name = "TargetRing" .. ringIndex
					ringFrame.AnchorPoint = Vector2.new(0.5, 0.5)
					ringFrame.Position = UDim2.fromScale(0.5, 0.5)
					ringFrame.Size = UDim2.fromScale(ring[1] * 0.714, ring[1] * 0.714) -- the template Target is 70% of the card; 0.714 * 0.7 = 50%
					ringFrame.BackgroundColor3 = ring[2]
					ringFrame.BackgroundTransparency = 0
					ringFrame.BorderSizePixel = 0
					ringFrame.Active = false
					ringFrame.ZIndex = clone4.ZIndex
					ringFrame.Parent = clone4

					local ringCorner = Instance.new("UICorner")

					ringCorner.CornerRadius = UDim.new(1, 0)
					ringCorner.Parent = ringFrame
				end
			end

			clone.ClipsDescendants = true
			nonGameCard.BindInspect(clone, iterSecond2)
			clone.MouseButton1Click:Connect(function()
				if clone.Added.Value == false and not table.find(t29, u1122) and #t29 < p385 then
					clone.Added.Value = true
					table.insert(t29, u1122)
					clone4.Visible = true
					audioService.PlaySound("Kerplunk.wav")
				elseif clone.Added.Value == true and table.find(t29, u1122) then
					clone.Added.Value = false

					for iterFirst, iterSecond in v169(t29) do
						if iterSecond == u1122 then
							table.remove(t29, iterFirst)
						end
					end

					clone4.Visible = false
					audioService.PlaySound("UI-MouseOver Pop HD")
				else
					audioService.PlaySound("clickfast.wav")
				end

				if #t29 <= p385 and #t29 >= p384 then
					playerGuiZoneTargetGenericTargetWindow.Select.BackgroundColor3 = Color3.fromRGB(76, 162, 76)

					return
				end

				playerGuiZoneTargetGenericTargetWindow.Select.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
			end)
			clone.Visible = true
		end
	end

	utilsFireServer("ReadyToTarget", u73)
	v48.ZoneTargetSelection = playerGuiZoneTargetGenericTargetWindow.Select.MouseButton1Click:Connect(function()
		if utilsInvokeServer("SetTarget", u73, t29) then
			audioService.PlaySound("Target Or Select")
		end
	end)
end

lang = require(game.ReplicatedStorage.Language)

function utilsClient.TheirTurn(p386, p387)
	u118(lang.TheirTurn())
	n5 = p387

	local animationAnimateAsync = animation.AnimateAsync
	local battleNewVirtualEnemyField = battleNew.VirtualEnemyField
	local color3 = Color3.fromRGB(91, 23, 25)

	animationAnimateAsync(battleNewVirtualEnemyField, { BackgroundTransparency = 0.45, BackgroundColor3 = color3 }, 1, "Out", "Quad")

	local animateAsync = animation.AnimateAsync
	local battleNewVirtualEnemyDeck = battleNew.VirtualEnemyDeck
	local color315 = Color3.fromRGB(91, 23, 25)

	animateAsync(battleNewVirtualEnemyDeck, { BackgroundTransparency = 0.45, BackgroundColor3 = color315 }, 1, "Out", "Quad")

	local v1138 = animation.AnimateAsync
	local battleNewVirtualEnemyHand = battleNew.VirtualEnemyHand
	local color316 = Color3.fromRGB(91, 23, 25)

	v1138(battleNewVirtualEnemyHand, { BackgroundTransparency = 0.45, BackgroundColor3 = color316 }, 1, "Out", "Quad")
	task.spawn(function()
		StartClock(p386)
	end)
end
function utilsClient.UpdateTimer(p388)
	task.spawn(function()
		StartClock(p388 - 5)
	end)
end
function utilsClient.SetTurns(p389, p390)
	battleNew.TurnNumber.Text = "Turn: " .. p389 .. " (" .. p390 + 1 .. ")"
end
function utilsClient.YourTurn(p391, p392)
	audioService.PlaySound("Appear")
	n5 = p392
	battleNew.TurnIndicator.ImageColor3 = Color3.fromRGB(255, 255, 255)

	local animationAnimateAsync = animation.AnimateAsync
	local battleNewTurnIndicator = battleNew.TurnIndicator
	local v1148 = UDim2.fromScale(0, 1.15)

	animationAnimateAsync(battleNewTurnIndicator, { Position = v1148 }, 1, "Out", "Quint")

	local animateAsync = animation.AnimateAsync
	local turnIndicator = battleNew.TurnIndicator
	local color3 = Color3.fromRGB(0, 153, 255)

	animateAsync(turnIndicator, { ImageColor3 = color3 }, 1.25, "Out", "Quad")
	animation.AnimateAsync(battleNew.TurnIndicatorEnemy, { Position = UDim2.new(0, 0, -0.4, 0) }, 1, "Out", "Quint")

	local v1152 = animation.AnimateAsync
	local battleNewVirtualField = battleNew.VirtualField
	local color317 = Color3.fromRGB(0, 62, 103)

	v1152(battleNewVirtualField, { BackgroundTransparency = 0.45, BackgroundColor3 = color317 }, 1, "Out", "Quad")

	local v1155 = animation.AnimateAsync
	local battleNewVirtualDeck = battleNew.VirtualDeck
	local color318 = Color3.fromRGB(0, 62, 103)

	v1155(battleNewVirtualDeck, { BackgroundTransparency = 0.45, BackgroundColor3 = color318 }, 1, "Out", "Quad")

	local v1158 = animation.AnimateAsync
	local battleNewVirtualHand = battleNew.VirtualHand
	local color319 = Color3.fromRGB(0, 62, 103)

	v1158(battleNewVirtualHand, { BackgroundTransparency = 0.45, BackgroundColor3 = color319 }, 1, "Out", "Quad")

	if not u62 then
		u66 = true

		if not u68 then
			ShowEndTurnButton()
		end
	end

	u118(lang.YourTurn())
	task.spawn(function()
		StartClock(p391)
	end)
end
function utilsClient.YourTurnEnd(p393)
	u66 = false
	u71 = nil
	targetArrow.Reset()
	fakeMouse.Cursors.Stop()
	t8 = {}
	u117()
	DeselectCard()

	if battleNew.EndTurnNotice.Visible == true then
		battleNew.EndTurnNotice.Visible = false
	end

	if p393.TimeOut then
		local v1162 = u118
		local randomNumber = math.random(10)

		v1162(if randomNumber == 5 then "No Time!" else "Time's Up!")
	end

	if p393.CustomMessage then
		u118(p393.CustomMessage)
	end

	local animationAnimateAsync = animation.AnimateAsync
	local battleNewTurnIndicator = battleNew.TurnIndicator
	local v1166 = UDim2.fromScale(0, 1.4)

	animationAnimateAsync(battleNewTurnIndicator, { Position = v1166 }, 1, "Out", "Quint")

	local animateAsync = animation.AnimateAsync
	local battleNewTurnIndicatorEnemy = battleNew.TurnIndicatorEnemy

	v1166 = UDim2.fromScale(0, -0.15)
	animateAsync(battleNewTurnIndicatorEnemy, { Position = v1166 }, 1, "Out", "Quint")

	local v1169 = animation.AnimateAsync
	local battleNewVirtualField = battleNew.VirtualField
	local color3 = Color3.fromRGB(0, 0, 0)

	v1169(battleNewVirtualField, { BackgroundColor3 = color3 }, 1, "Out", "Quad")

	local v1172 = animation.AnimateAsync
	local battleNewVirtualHand = battleNew.VirtualHand
	local color320 = Color3.fromRGB(0, 0, 0)

	v1172(battleNewVirtualHand, { BackgroundColor3 = color320 }, 1, "Out", "Quad")

	local v1175 = animation.AnimateAsync
	local battleNewVirtualDeck = battleNew.VirtualDeck
	local color321 = Color3.fromRGB(0, 0, 0)

	v1175(battleNewVirtualDeck, { BackgroundColor3 = color321 }, 1, "Out", "Quad")
	HideEndTurnButton()
end
function utilsClient.DisplayFloorLossInfo(p394)
	battleNew.ReviveMenu.DistanceMade.Text = "You died at Wave: " .. tostring(p394)
	battleNew.ReviveMenu.Visible = true
end
function utilsClient.HideReviveMenu()
	battleNew.ReviveMenu.Visible = false
end
function utilsClient.ClientIsReady()
	utilsFireServer("ReadyToStartTurn", u73)
end
function utilsClient.TheirTurnEnd(p395)
	t8 = {}
	u117()

	if p395.TimeOut then
		u118("Your opponent ran out of time!")
	end

	if p395.CustomMessage then
		u118(p395.CustomMessage)
	end

	local animationAnimateAsync = animation.AnimateAsync
	local battleNewVirtualEnemyField = battleNew.VirtualEnemyField
	local color3 = Color3.fromRGB(0, 0, 0)

	animationAnimateAsync(battleNewVirtualEnemyField, { BackgroundColor3 = color3 }, 1, "Out", "Quad")

	local animateAsync = animation.AnimateAsync
	local battleNewVirtualEnemyHand = battleNew.VirtualEnemyHand
	local color322 = Color3.fromRGB(0, 0, 0)

	animateAsync(battleNewVirtualEnemyHand, { BackgroundColor3 = color322 }, 1, "Out", "Quad")

	local v1186 = animation.AnimateAsync
	local battleNewVirtualEnemyDeck = battleNew.VirtualEnemyDeck
	local color323 = Color3.fromRGB(0, 0, 0)

	v1186(battleNewVirtualEnemyDeck, { BackgroundColor3 = color323 }, 1, "Out", "Quad")
end
function utilsClient.UpdateTide(p396, p397)
	if p396 == "me" then
		battleNew.TideCounter.Text = "Anthr: " .. p397 % 3 .. " (" .. p397 .. ")"
	elseif p396 == "them" then
		battleNew.EnemyTideCounter.Text = "Anthr: " .. p397 % 3 .. " (" .. p397 .. ")"
	end
end
function utilsClient.UpdateWave(p398)
	battleNew.WaveCounter.TextColor3 = Color3.new(0.956863, 0.196078, 0.196078)

	local animationAnimateAsync = animation.AnimateAsync
	local battleNewWaveCounter = battleNew.WaveCounter
	local v1194 = UDim2.fromOffset(battleNew.WaveCounter.AbsoluteSize.X * 1.2, battleNew.WaveCounter.AbsoluteSize.Y * 1.2)

	animationAnimateAsync(battleNewWaveCounter, { Size = v1194 }, 0.4, "Out", "Quart")
	battleNew.WaveCounter.Text = "WAVE: " .. tostring(p398)
	task.spawn(function()
		task.wait(0.5)
		battleNew.WaveCounter.TextColor3 = Color3.new(1, 1, 1)

		local animationAnimateAsync = animation.AnimateAsync
		local battleNewWaveCounter = battleNew.WaveCounter
		local v1392 = UDim2.fromOffset(battleNew.WaveCounter.AbsoluteSize.X / 1.2, battleNew.WaveCounter.AbsoluteSize.Y / 1.2)

		animationAnimateAsync(battleNewWaveCounter, { Size = v1392 }, 0.4, "Out", "Quart")
	end)
end
function utilsClient.UpdateRank(p399, p400)
	local t30: {[any]: any} = { Neutral = "C", Red = "R", Green = "G", Blue = "B", Yellow = "Y" }
	local t31: {[any]: any} = {
		Neutral = "#b9b9b9",
		Red = "#ff1919",
		Green = "#19ff19",
		Blue = "#4d49ff",
		Yellow = "#ffff19"
	}
	local t32: {[any]: any} = { Neutral = 0, Red = 0, Green = 0, Blue = 0, Yellow = 0 }

	if p399 == "me" then
		battleNew.VirtualBaseplate.BaseplateAmount.Text = p400

		local t33 = {}

		for iterFirst, iterSecond in v169(t2.Baseplate or {}) do
			local v1203 = allcards[iterSecond]

			if v1203 then
				table.insert(t33, v1203)
			end
		end

		for _, v in ipairs(t33) do
			local v1206 = v.Color or "Neutral"

			if t32[v1206] ~= nil and not v.TokenGenZone and not v.TokenOmni then
				t32[v1206] = t32[v1206] + 1
			end
		end

		t33 = "Will Generate: <br/>"

		for _, v in ipairs({ "Neutral", "Red", "Green", "Blue", "Yellow" }) do
			local v1209 = t32[v]

			if v1209 > 0 then
				local v1210 = t30[v]

				if t33 ~= "Will Generate: <br/>" then
					t33 ..= " | "
				end

				local text: string = tostring(v1209)

				t33 = t33 .. " <font color=\"" .. t31[v] .. "\">" .. text .. v1210 .. "</font>"
			end
		end

		battleNew.GenCount.Text = t33
	elseif p399 == "them" then
		battleNew.VirtualEnemyBaseplate.BaseplateAmount.Text = p400

		local t34 = {}

		for iterFirst2, iterSecond2 in v169(t2.EnemyBaseplate or {}) do
			local v1215 = allcards[iterSecond2]

			if v1215 then
				table.insert(t34, v1215)
			end
		end

		for _, v in ipairs(t34) do
			local v1218 = v.Color or "Neutral"

			if t32[v1218] ~= nil and not v.TokenGenZone and not v.TokenOmni then
				t32[v1218] = t32[v1218] + 1
			end
		end

		t34 = "Will Generate: <br/>"

		for _, v in ipairs({ "Neutral", "Red", "Green", "Blue", "Yellow" }) do
			local v1221 = t32[v]

			if v1221 > 0 then
				local v1222 = t30[v]

				if t34 ~= "Will Generate: <br/>" then
					t34 ..= " | "
				end

				local text: string = tostring(v1221)

				t34 = t34 .. " <font color=\"" .. t31[v] .. "\">" .. text .. v1222 .. "</font>"
			end
		end

		battleNew.EnemyGenCount.Text = t34
	end
end
function utilsClient.ShowTide(p401, _)
	if p401 == "me" then
		battleNew.TideCounter.Visible = true
	elseif p401 == "them" then
		battleNew.EnemyTideCounter.Visible = true
	end
end
function utilsClient.UpdateDragonForce(p403, p404)
	if p403 == "me" then
		battleNew.DFCounter.Text = "D-FORCE: " .. p404 / 1000000 .. "m"
	elseif p403 == "them" then
		battleNew.EnemyDFCounter.Text = "D-FORCE: " .. p404 / 1000000 .. "m"
	end
end
function utilsClient.ShowDragonForce(p405)
	if p405 == "me" then
		battleNew.DFCounter.Visible = true
	elseif p405 == "them" then
		battleNew.EnemyDFCounter.Visible = true
	end
end
function utilsClient.ForcedTurn(p406)
	u118(p406 .. " forced the turn!")
	utilsFireServer("EndTurn", u73)
end

print("TutorialNew")

local script = require(player.TutorialScript).Script
local battleNewTutorialStuff = battleNew.TutorialStuff
local battleNewTutorialStuffCoverUp = battleNewTutorialStuff.CoverUp
local battleNewTutorialStuffNext = battleNewTutorialStuff.Next
local explanation = battleNewTutorialStuff.Explanation.Explanation
local battleNewTutorialStuffNextPosition = battleNewTutorialStuffNext.Position
local explanationPosition = explanation.Position
local u204: boolean = false

battleCutscenes = game:GetService("TweenService")
utils = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, 0)

local v205 = battleCutscenes:Create(battleNewTutorialStuff.CoverUp.DownArrow, utils, { Position = UDim2.new(0, 0, 0.3, 0) })

v205:Play()

local function ShowNextButton()
	if not u204 then
		return
	end

	u204 = false
	animation.Animate(battleNewTutorialStuffNext, { BackgroundTransparency = 0.25, TextTransparency = 0 }, 0.16, "Out", "Quad")
end
local function HideNextButton()
	if u204 then
		return
	end

	u204 = true
	animation.Animate(battleNewTutorialStuffNext, { BackgroundTransparency = 1, TextTransparency = 1 }, 0.16, "In", "Quad")
end
local function TutorialHighlight(p407, text, p409)
	if type(text) == "table" then
		for i = 1, #text do
			if i == #text then
				TutorialHighlight(p407, text[i], p409)
			else
				TutorialHighlight(p407, text[i], nil)
			end
		end

		return
	end

	if p407 == "Center" then
		battleNewTutorialStuff.CoverUp.DownArrow.Visible = false
		battleNewTutorialStuffCoverUp:TweenSizeAndPosition(UDim2.new(1.03, 0, 1.03, 0), UDim2.new(-0.02, 0, -0.02, 0), "Out", "Quad", 1, true)
		battleNewTutorialStuffCoverUp.AnchorPoint = Vector2.new(0, 0)
	else
		battleNewTutorialStuff.CoverUp.DownArrow.Visible = true
		animation.AnimateAsync(battleNewTutorialStuffCoverUp, { AnchorPoint = p407.AnchorPoint }, 1, "Out", "Quad")
		battleNewTutorialStuffCoverUp:TweenSizeAndPosition(p407.Size, p407.Position, "Out", "Quad", 1, true)
	end

	if not u204 then
		u204 = true
		animation.Animate(battleNewTutorialStuffNext, { BackgroundTransparency = 1, TextTransparency = 1 }, 0.16, "In", "Quad")
	end

	explanation.Text = text

	if type(p409) == "function" then
		repeat
			task.wait()
		until p409()
	elseif p409 then
		p409:wait()
	else
		if u204 then
			u204 = false
			animation.Animate(battleNewTutorialStuffNext, { BackgroundTransparency = 0.25, TextTransparency = 0 }, 0.16, "Out", "Quad")
		end

		battleNewTutorialStuffNext.MouseButton1Click:wait()
	end
end
local function WaitForNextTurn()
	local v1234 = n5

	repeat
		task.wait()
	until v1234 ~= n5
end

WaitForNextTurn = function()
	if battleNewTutorialStuff.Visible then
		return
	end

	v88(data.Wins())

	if data.Wins() == 0 then
		utilsClient.StartCutscene("PreTutorial")
	end

	explanation.Position = UDim2.new(1, 0, explanationPosition.Y.Scale, explanationPosition.Y.Offset)
	utilsFireServer("EnterTutorial")
	u67 = true
	transition.ToggleBlack(-1)
	task.wait(1)
	task.spawn(function()
		repeat
			task.wait()
		until u65

		repeat
			task.wait()
		until not u65

		u67 = false
		battleNewTutorialStuff.Visible = false
	end)
	u172()

	if not u204 then
		u204 = true
		animation.Animate(battleNewTutorialStuffNext, { BackgroundTransparency = 1, TextTransparency = 1 }, 0.16, "In", "Quad")
	end

	repeat
		task.wait()
	until u66

	battleNewTutorialStuff.Visible = true
	explanation:TweenPosition(explanationPosition, "Out", "Quint", 0.75, true)
	HideEndTurnButton()
	utilsFireServer("DisableHandTutorial", u73, true)
	TutorialHighlight("Center", script.Intro)
	TutorialHighlight(battleNew.IconHolderSlots, script.LifeIcons)
	utilsFireServer("DisableHandTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualHand, script.PlayAmbambies, function()
		return #battleNew.Hand:GetChildren() == 0
	end)
	utilsFireServer("DisableHandTutorial", u73, true)
	utilsFireServer("DisableFieldTutorial", u73, true)
	ShowEndTurnButton()
	TutorialHighlight(battleNew.EndTurn, script.EndTurn1, function()
		return not u66
	end)
	TutorialHighlight(battleNew.IconHolderSlots, script.EndTurn2)

	repeat
		task.wait(0.1)
	until u66 and #battleNew.Hand:GetChildren() ~= 0

	HideEndTurnButton()
	utilsFireServer("DisableHandTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualHand, script.ClearField, function()
		return #battleNew.Hand:GetChildren() == 0
	end)

	for iterFirst, iterSecond in v169(allcards) do
		if iterSecond.Position == "Field" and iterSecond.Name ~= "TR2T" then
			iterSecond.Physical.Active = false
		end
	end

	local function NotFoundByName(p410)
		for iterFirst, iterSecond in v169(allcards) do
			if p410 == iterSecond.Name then
				return false
			end
		end

		return true
	end

	NotFoundByName = { Size = UDim2.new(1, 0, 0.68, 0), Position = UDim2.new(0, 0, 0.15, 0) }
	utilsFireServer("DisableHandTutorial", u73, true)
	utilsFireServer("DisableFieldTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualField, script.AttackExplain, function()
		return not battleNew.EnemyField:FindFirstChildWhichIsA("ImageButton")
	end)
	task.wait(2.5)
	TutorialHighlight(battleNew.VirtualEnemyField, script.FaceExplain, function()
		return battleNew.Stage:FindFirstChild("PlayerCard")
	end)
	task.wait(2.5)
	ShowEndTurnButton()
	utilsFireServer("DisableFieldTutorial", u73, true)
	TutorialHighlight(battleNew.EndTurn, script.EndTurn3, function()
		return not u66
	end)
	TutorialHighlight("Center", script.WaitForEnemy, function()
		local v1396: boolean = u66

		if v1396 then
			v1396 = #battleNew.Hand:GetChildren() ~= 0
		end

		return v1396
	end)
	HideEndTurnButton()

	local battleNewVirtualEnemyField = battleNew.VirtualEnemyField
	local scriptEffect = script.Effect
	local imageButton = battleNew.EnemyField:FindFirstChildWhichIsA("ImageButton")

	TutorialHighlight(battleNewVirtualEnemyField, scriptEffect, imageButton.MouseEnter)
	TutorialHighlight("Center", script.Effect2)
	TutorialHighlight("Center", script.Discard)
	utilsFireServer("DisableHandTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualBaseplate, script.Discard1, function()
		return #battleNew.Hand:GetChildren() == 1
	end)
	utilsFireServer("DisableHandTutorial", u73, true)
	task.wait(1.5)
	utilsFireServer("DisableHandTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualHand, script.Discard2, function()
		return #battleNew.Hand:GetChildren() == 0
	end)
	utilsFireServer("DisableHandTutorial", u73, true)
	TutorialHighlight("Center", script.PixelPistol)
	utilsFireServer("DisableFieldTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualField, script.Attack, function()
		return not battleNew.EnemyField:FindFirstChildWhichIsA("ImageButton")
	end)
	task.wait(2)
	utilsFireServer("DisableFieldTutorial", u73, true)
	ShowEndTurnButton()
	TutorialHighlight(battleNew.EndTurn, script.EndTurn4, function()
		return not u66
	end)
	TutorialHighlight(battleNew.IconHolderSlotsVisual, script.BaseplateExplanation3)

	repeat
		task.wait(0.1)
		ShowEndTurnButton()
	until u66 and #battleNew.Hand:GetChildren() ~= 0

	HideEndTurnButton()
	TutorialHighlight("Center", script.ActionCards)
	task.wait(0.1)
	utilsFireServer("DisableHandTutorial", u73, false)
	TutorialHighlight(battleNew.VirtualHand, script.Dignity, function()
		return #battleNew.Hand:GetChildren() == 0
	end)
	TutorialHighlight("Center", script.EndTurn5)
	battleNewTutorialStuff.Visible = false
	v205:Cancel()
	v205:Destroy()
end
WaitForNextTurn = function(p411)
	for iterFirst, iterSecond in v169(allcards) do
		if p411 == iterSecond.LibraryIndex then
			return iterSecond
		end
	end
end

function utilsClient.StartTutorial()
	if not config.TUTOR_LADY_ENABLED then
		return
	end

	task.spawn(function()
		audioService.ChangeSong("Daisuke Kawai-Weekend")
	end)

	if data.Wins() == 0 then
		utilsClient.StartCutscene("PreTutorial")
	end

	utilsFireServer("EnterTutorial")
	u67 = true
	u68 = true
	task.wait(1)
	task.spawn(function()
		repeat
			task.wait()
		until u65

		repeat
			task.wait()
		until not u65

		u67 = false
		battleNewTutorialStuff.Visible = false
		battleTutorial.SetVisible(false)
	end)
	u172()

	repeat
		task.wait()
	until u66

	transition.ToggleBlack(-1)
	audioService.ChangeSong("New Tutorial", { Volume = 0.15, TimePosition = 0 })
	utilsFireServer("DisablePlaceTutorial", u73, true)
	utilsFireServer("DisableHandTutorial", u73, true)
	battleTutorial.SetSpritesheet("rbxassetid://121407898586909", 3)
	battleTutorial.SetFace(9)
	battleTutorial.SetVisible(true)
	battleTutorial.ShowText("Alright, let's get started!")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Time to understand the basics of Blox Cards!")
	battleTutorial.SetFace(9)
	effects.TutorialStudsIndicator(battleNew.Parent.Effect)
	battleTutorial.ShowText("First, let's talk about Studs. You start with 4 Colourless Studs or 6 if you go second.")
	battleTutorial.ShowText("Studs are the resource used to pay for cards to be able to cast them.")
	battleTutorial.SetFace(1)
	utilsFireServer("DisableHandTutorial", u73, false)
	utilsFireServer("DisablePlaceTutorial", u73, false)

	local v1244, v1245, v1246 = v169(allcards)
	local v1247: boolean = false
	local v1248

	for iterFirst, iterSecond in v1244, v1245, v1246 do
		if iterSecond.LibraryIndex == "TR1T" then
			v1248 = iterSecond
			v1247 = true

			break
		end
	end

	if not v1247 then
		v1248 = nil
	end

	effects.TutorialPointerDrag(battleNew.Parent.Effect, v1248.Physical, battleNew.VirtualField)
	battleTutorial.ShowText("Your RAT Assault Unit costs 3 Colourless Studs, so you can cast it right now! Drag that fighter onto the Field to cast it.", true)

	repeat
		task.wait(0.1)
	until v1248.Position == "Field"

	effects.TutorialCancel(battleNew.Parent.Effect)
	utilsFireServer("DisableHandTutorial", u73, true)
	utilsFireServer("DisablePlaceTutorial", u73, true)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("To know more about a fighter, tap or hover over the card to read it and see the Cost, its current Health, the strength of its Power, and its Effect.")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Newly summoned cards are Locked and cannot attack on the turn they are played.")
	battleTutorial.SetFace(7)
	ShowEndTurnButton()
	utilsFireServer("SignalReadyTutorial", u73, true)
	effects.TutorialPointerClickOnce(battleNew.Parent.Effect, battleNew.EndTurn)
	battleTutorial.ShowText("Since you can't attack or cast anything else, You can end your turn now. Press END TURN.", true)

	repeat
		task.wait(0.1)
	until not u66

	effects.TutorialCancel(battleNew.Parent.Effect)
	battleTutorial.SetFace(2)
	effects.TutorialStudsIndicator(battleNew.Parent.Effect)
	battleTutorial.ShowText("Whenever you end your turn, your cards generate Studs.")
	effects.TutorialFieldIndicator(battleNew.Parent.Effect)
	battleTutorial.ShowText("You gain one Stud for each card on your Field and Baseplate.")
	effects.TutorialBaseplateIndicator(battleNew.Parent.Effect)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("You start with 2 Colourless cards in your Baseplate. Cards in your Baseplate also generate Studs each turn.")
	effects.TutorialCancel(battleNew.Parent.Effect)
	utilsFireServer("SignalReadyTutorial", u73, false)
	battleTutorial.SetFace(7)
	battleTutorial.ShowText("OK I'll go easy on you here...", true)

	repeat
		task.wait(0.1)
	until u66

	utilsFireServer("DisableFieldTutorial", u73, true)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("At the start of every turn, you draw a card from your deck.")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Looks like you need one more coloured stud to play something... but don't worry!")
	battleTutorial.ShowText("Once each turn, you can send a coloured card from your hand to the Baseplate and gain a Stud of that card's colour.")
	battleTutorial.SetFace(1)

	local v1251, v1252, v1253 = v169(allcards)
	local v1254: boolean = false
	local v1255

	for iterFirst2, iterSecond2 in v1251, v1252, v1253 do
		if iterSecond2.LibraryIndex == "TR5T" then
			v1255 = iterSecond2
			v1254 = true

			break
		end
	end

	if not v1254 then
		v1255 = nil
	end

	effects.TutorialPointerDrag(battleNew.Parent.Effect, v1255.Physical, battleNew.VirtualBaseplate)
	battleTutorial.ShowText("Try dragging your Lord Crimsonwrath to your Baseplate (or right click it if you're on PC)!", true)
	utilsFireServer("DisableHandTutorial", u73, false)

	repeat
		task.wait(0.1)
	until v1255.Position == "Baseplate"

	effects.TutorialCancel(battleNew.Parent.Effect)
	utilsFireServer("DisableHandTutorial", u73, true)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Discarding that card gave you a Red Stud!")
	battleTutorial.SetFace(1)

	local v1258, v1259, v1260 = v169(allcards)
	local v1261: boolean = false
	local v1262

	for iterFirst3, iterSecond3 in v1258, v1259, v1260 do
		if iterSecond3.LibraryIndex == "TR4T2" then
			v1262 = iterSecond3
			v1261 = true

			break
		end
	end

	if not v1261 then
		v1262 = nil
	end

	effects.TutorialPointerDrag(battleNew.Parent.Effect, v1262.Physical, battleNew.VirtualField)
	battleTutorial.ShowText("Now, try dragging your Armored Patrol Tank from your hand into your Field now.", true)
	utilsFireServer("DisablePlaceTutorial", u73, false)
	utilsFireServer("DisableHandTutorial", u73, false)

	repeat
		task.wait(0.1)
	until v1262.Position == "Field"

	local v1265, v1266, v1267 = v169(allcards)
	local v1268: boolean = false
	local v1269

	for iterFirst4, iterSecond4 in v1265, v1266, v1267 do
		if iterSecond4.LibraryIndex == "TB1T" then
			v1269 = iterSecond4
			v1268 = true

			break
		end
	end

	if not v1268 then
		v1269 = nil
	end

	effects.TutorialPointerClickOnce(battleNew.Parent.Effect, v1269.Physical)
	battleTutorial.ShowText("Some cards require a target for their effect. Try targeting my Programmer with your Armored Patrol Tank's damage effect.", true)

	repeat
		task.wait(0.1)
	until u71 == nil

	effects.TutorialCancel(battleNew.Parent.Effect)
	utilsFireServer("DisablePlaceTutorial", u73, true)
	utilsFireServer("DisableHandTutorial", u73, true)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Nice Your RAT Assault Unit can now defeat my Programmer in one attack.")
	battleTutorial.SetFace(1)
	effects.TutorialPointerClick(battleNew.Parent.Effect, v1248.Physical, v1269.Physical)
	battleTutorial.ShowText("Try attacking it! Select your unlocked fighter, then select mine.", true)
	utilsFireServer("DisableFieldTutorial", u73, false)

	repeat
		task.wait(0.1)
	until #battleNew.EnemyField:GetChildren() == 0

	effects.TutorialCancel(battleNew.Parent.Effect)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("In combat, both fighters deal damage equal to their current Power.")
	battleTutorial.SetFace(9)
	utilsFireServer("DisableFieldTutorial", u73, true)
	ShowEndTurnButton()
	utilsFireServer("SignalReadyTutorial", u73, true)
	effects.TutorialPointerClickOnce(battleNew.Parent.Effect, battleNew.EndTurn)
	battleTutorial.ShowText("Good job There’s nothing else you can do this turn. Press END TURN to continue.", true)

	repeat
		task.wait(0.1)
	until not u66

	effects.TutorialCancel(battleNew.Parent.Effect)
	effects.TutorialStudsIndicator(battleNew.Parent.Effect)
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("At the end of your turns, your Coloured Studs reset before you generate any Studs.")
	battleTutorial.ShowText("Your Red Studs are set to 0, but your Red cards on the Field and Baseplate generate. That's why you have 3 Red Studs.")
	battleTutorial.ShowText("Colourless Studs don't reset. You can store as much as you want. Note that you can't Baseplate Colourless cards.")
	effects.TutorialCancel(battleNew.Parent.Effect)
	utilsFireServer("SignalReadyTutorial", u73, false)
	battleTutorial.SetFace(7)
	battleTutorial.ShowText("My turn Let me put the hurt on you...", true)

	repeat
		task.wait(0.1)
	until u66

	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Okay, your turn. But, before you do anything, let me teach you about Action cards!")
	battleTutorial.ShowText("Actions don't stay on the Field, but they have powerful effects!")
	battleTutorial.SetFace(1)
	utilsFireServer("DisablePlaceTutorial", u73, false)
	utilsFireServer("DisableHandTutorial", u73, false)

	local effectsTutorialPointerDrag = effects.TutorialPointerDrag
	local effect = battleNew.Parent.Effect
	local imageButton = battleNew.Hand:FindFirstChildWhichIsA("ImageButton")

	effectsTutorialPointerDrag(effect, imageButton, battleNew.VirtualField)
	battleTutorial.ShowText("Try casting that Action in your hand by dragging it onto the Field!", true)

	repeat
		task.wait(0.1)
	until #battleNew.Hand:GetChildren() == 0

	effects.TutorialCancel(battleNew.Parent.Effect)
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("neat You're getting the hang of this!")
	battleTutorial.ShowText("Remember to always read the effects of cards to make sure you understand what they do!")
	battleTutorial.SetFace(8)
	audioService.DimSongs()
	battleTutorial.ShowText("...")
	battleTutorial.ShowText("I'm serious about that. For the love of Telamon, Read the cards. Please.")
	audioService.UndimSongs()
	battleTutorial.SetFace(7)
	utilsFireServer("DisableFieldTutorial", u73, false)
	battleTutorial.ShowText("Anyways, My Field is empty, so you can attack my face! Select a fighter, then select my face. Try it with both your fighters!", true)
	effects.TutorialPointerDrag(battleNew.Parent.Effect, v1262.Physical, battleNew.VirtualEnemyField)

	repeat
		task.wait(0.1)
	until #battleNew.Stage:GetChildren() > 0

	utilsFireServer("DisableFieldTutorial", u73, true)
	battleTutorial.SetFace(6)
	battleTutorial.ShowText("auie", true)
	effects.TutorialCancel(battleNew.Parent.Effect)
	effects.TutorialPointerDrag(battleNew.Parent.Effect, v1248.Physical, battleNew.VirtualEnemyField)

	repeat
		task.wait(0.5)
	until #battleNew.Stage:GetChildren() == 0

	utilsFireServer("DisableFieldTutorial", u73, false)

	repeat
		task.wait(0.1)
	until #battleNew.Stage:GetChildren() > 0

	battleTutorial.SetFace(5)
	effects.TutorialCancel(battleNew.Parent.Effect)
	battleTutorial.ShowText("owchie")

	repeat
		task.wait(0.1)
	until #battleNew.Stage:GetChildren() == 0

	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Congrats, You've learned all the basics of Blox Cards!")
	battleTutorial.ShowText("Now, try finishing this battle on your own.")
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Truth be told, Blox Cards can get complex at times, but that little brain of yours seems like it's capable of picking it up quickly!")
	battleTutorial.ShowText("Good luck!")
	battleTutorial.SetVisible(false)
	u68 = false
	ShowEndTurnButton()
end
function utilsClient.StartBlessingsTutorial()
	if not config.TUTOR_LADY_ENABLED then
		return
	end

	task.spawn(function()
		local script = require(player.BlessingsTutorialScript).Script

		repeat
			task.wait()
		until u66

		u67 = true
		u68 = true
		battleNewTutorialStuff.Visible = true
		task.spawn(function()
			repeat
				task.wait()
			until u65

			repeat
				task.wait()
			until not u65

			u67 = false
			battleNewTutorialStuff.Visible = false
		end)
		explanation:TweenPosition(explanationPosition, "Out", "Quad", 2, true)
		HideEndTurnButton()
		u172()
		utilsFireServer("DisableFieldTutorial", u73, true)
		utilsFireServer("ForcePlayCardInSlotTutorial", u73, 6)
		utilsFireServer("DisableHandTutorial", u73, false)
		TutorialHighlight(battleNew.VirtualHand, script.Intro, function()
			return #battleNew.Hand:GetChildren() == 6
		end)
		utilsFireServer("DisableHandTutorial", u73, true)
		TutorialHighlight(battleNew.VirtualHand, script.Part1)
		TutorialHighlight(battleNew.HandSlots.HandSlots["0"], script.Part2)
		TutorialHighlight(battleNew.HandSlots.HandSlots["1"], script.Part2)
		TutorialHighlight(battleNew.HandSlots.HandSlots["1"], script.Part3)
		utilsFireServer("DisableHandTutorial", u73, false)
		utilsFireServer("ForcePlayCardInSlotTutorial", u73, 1)
		TutorialHighlight(battleNew.HandSlots.HandSlots["1"], script.Part4, function()
			return #battleNew.Hand:GetChildren() == 5
		end)
		utilsFireServer("DisableHandTutorial", u73, true)
		TutorialHighlight(battleNew.VirtualField, script.Part5)
		TutorialHighlight(battleNew.HandSlots.HandSlots["1"], script.Part6)
		TutorialHighlight(battleNew.HandSlots.HandSlots["3"], script.Part7)
		TutorialHighlight(battleNew.HandSlots.HandSlots["3"], script.Part8)
		utilsFireServer("DisablePlaceTutorial", u73, true)
		utilsFireServer("DisableHandTutorial", u73, false)
		utilsFireServer("ForcePlayCardInSlotTutorial", u73)
		TutorialHighlight(battleNew.HandSlots.HandSlots["0"], script.Part9, function()
			return #battleNew.Hand:GetChildren() == 2
		end)
		utilsFireServer("DisablePlaceTutorial", u73, false)
		utilsFireServer("ForcePlayCardInSlotTutorial", u73, 0)
		TutorialHighlight(battleNew.HandSlots.HandSlots["0"], script.Part9again, function()
			return #battleNew.Hand:GetChildren() == 1
		end)
		TutorialHighlight(battleNew.VirtualField, script.Part10)
		TutorialHighlight(battleNew.VirtualField, script.Part11)
		utilsFireServer("DisableFieldTutorial", u73, false)
		battleNewTutorialStuff.Visible = false
	end)
end
function utilsClient.BattleTaunt(p412)
	if p412 == "AirHorn" then
		effects.AirHornTaunt(battleNew.Parent.Effect)
	end
end
function utilsClient.SetEffectAnimationsOff(p413)
	u90 = p413
end
function utilsClient.SetAutoEffectPopUpHide(p414)
	u91 = p414
end
function utilsClient.SetReminderVisibility(p415)
	u92 = p415
end

battleNew.VirtualField.MouseButton1Click:Connect(function()
	if u65 == true then
		local v1279: Vector2 = userInputService:GetMouseLocation()

		effects.MouseEffect(battleNew.Parent.Effect, v1279)
	end
end)
battleNew.VirtualEnemyField.MouseButton1Click:Connect(function()
	if u65 == true then
		local v1280: Vector2 = userInputService:GetMouseLocation()

		effects.MouseEffect(battleNew.Parent.Effect, v1280)
	end
end)

return {}