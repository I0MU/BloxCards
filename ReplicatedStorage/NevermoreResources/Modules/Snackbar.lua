



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local userInputService: UserInputService = game:GetService("UserInputService")
local runService: RunService = game:GetService("RunService")
local players: Players = game:GetService("Players")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v6 = loadLibrary("qGUI")
local makeMaid = loadLibrary("Maid").MakeMaid

local function MakeDropShadow(parent, p2)
	local v14 = p2 or 4
	local dropShadow: Frame = Instance.new("Frame")

	dropShadow.Size = UDim2.new(1, v14 * 2, 1, v14 * 2)
	dropShadow.Position = UDim2.new(0, -v14, 0, -v14)
	dropShadow.Name = "DropShadow"
	dropShadow.Parent = parent
	dropShadow.ZIndex = parent.ZIndex - 1
	dropShadow.FrameStyle = "DropShadow"

	return dropShadow
end

MakeDropShadow = function(p3, p4, p5, p6, p7)
	return (p3 - p4) * (p7 - p6) / (p5 - p4) + p6
end

local t1: {[any]: any} = { ClassName = "Snackbar" }

t1.__index = t1
t1.Height = 48
t1.MinimumWidth = 288
t1.MaximumWidth = 568
t1.TextWidthOffset = 28
t1.Position = UDim2.new(1, -10, 1, -10 - t1.Height)
t1.FadeTime = 0.16
t1.CornerRadius = 24

function t1.new(parent, text)
	local t4: {[any]: any} = {}

	setmetatable(t4, t1)

	local snackbar: ImageButton = Instance.new("ImageButton")

	snackbar.ZIndex = 5
	snackbar.Name = "Snackbar"
	snackbar.Size = UDim2.new(0, 100, 0, t4.Height)
	snackbar.BorderSizePixel = 0
	snackbar.BackgroundColor3 = Color3.new(0.196, 0.196, 0.196)
	snackbar.Archivable = false
	snackbar.ClipsDescendants = false
	snackbar.Position = t4.Position
	snackbar.AutoButtonColor = false
	snackbar.BackgroundTransparency = 1
	t4.Gui = snackbar
	t4.BackgroundImages = { v6.BackWithRoundedRectangle(snackbar, t4.CornerRadius, snackbar.BackgroundColor3) }

	local shadowContainer: Frame = Instance.new("Frame")

	shadowContainer.Parent = snackbar
	shadowContainer.Name = "ShadowContainer"
	shadowContainer.BackgroundTransparency = 1
	shadowContainer.Size = UDim2.new(1, 4, 1, 4)
	shadowContainer.Archivable = false
	shadowContainer.Position = UDim2.new(0, -2, 0, 0)

	local t5 = { v6.AddNinePatch(shadowContainer, "rbxassetid://191838004", Vector2.new(150, 150), t4.CornerRadius + 2, "ImageLabel") }

	t4.ShadowImages = t5

	for _, v in pairs(t5) do
		v.ImageTransparency = 0.74
		v.ZIndex = snackbar.ZIndex - 2
	end

	for _, v in pairs(t4.BackgroundImages) do
		v.ZIndex = snackbar.ZIndex - 1
	end

	local snackbarLabel: TextLabel = Instance.new("TextLabel", snackbar)

	snackbarLabel.Size = UDim2.new(1, -t4.TextWidthOffset * 2, 0, 20)
	snackbarLabel.Position = UDim2.new(0, t4.TextWidthOffset, 0, 16)
	snackbarLabel.TextXAlignment = "Left"
	snackbarLabel.TextYAlignment = "Top"
	snackbarLabel.Name = "SnackbarLabel"
	snackbarLabel.TextTransparency = 0.87
	snackbarLabel.TextColor3 = Color3.new(1, 1, 1)
	snackbarLabel.BackgroundTransparency = 1
	snackbarLabel.BorderSizePixel = 0
	snackbarLabel.Font = "Arial"
	snackbarLabel.Text = text
	snackbarLabel.FontSize = "Size14"
	snackbarLabel.ZIndex = snackbar.ZIndex - 1
	t4.TextLabel = snackbarLabel
	t4.Gui.Parent = parent
	t5 = t4.TextLabel.TextBounds.X + t4.TextWidthOffset * 2

	if t5 < t4.MinimumWidth then
		t5 = t4.MinimumWidth
	elseif t5 > t4.MaximumWidth then
		t5 = t4.MaximumWidth
	end

	t4.Gui.Size = UDim2.new(0, t5, 0, t4.Height)

	local v32 = t4.Position
	local uDim2 = UDim2.new(0, -t5, 0, 0)

	t4.Position = v32 + uDim2
	t4.Gui.Position = t4.Position
	t4.AbsolutePosition = t4.Gui.AbsolutePosition
	t4.WhileActiveMaid = makeMaid()

	return t4
end
function t1.SetBackgroundTransparency(p10, imageTransparency)
	for _, v in pairs(p10.BackgroundImages) do
		v.ImageTransparency = imageTransparency
	end

	for _, v in pairs(p10.ShadowImages) do
		v.ImageTransparency = (imageTransparency - 0) * 0.26 / 1 + 0.74
	end
end
function t1.FadeOutTransparency(p12, p13)
	if p13 then
		p12:SetBackgroundTransparency((p13 - 0) * 1 / 1 + 0)
		p12.TextLabel.TextTransparency = (p13 - 0) * 0.87 / 1 + 0.13

		return
	end

	local t6: {[any]: any} = { ImageTransparency = 1 }

	for _, v in pairs(p12.BackgroundImages) do
		v6.TweenTransparency(v, t6, p12.FadeTime, true)
	end

	for _, v in pairs(p12.ShadowImages) do
		v6.TweenTransparency(v, t6, p12.FadeTime, true)
	end

	v6.TweenTransparency(p12.TextLabel, { TextTransparency = 1 }, p12.FadeTime, true)
end
function t1.FadeInTransparency(p14, p15)
	if p15 then
		p14:SetBackgroundTransparency((p15 - 0) * -1 / 1 + 1)
		p14.TextLabel.TextTransparency = (p15 - 0) * -0.87 / 1 + 1

		return
	end

	local t7: {[any]: any} = { ImageTransparency = 0 }

	for _, v in pairs(p14.BackgroundImages) do
		v6.TweenTransparency(v, t7, p14.FadeTime, true)
	end

	t7 = { ImageTransparency = 0.74 }

	for _, v in pairs(p14.ShadowImages) do
		v6.TweenTransparency(v, t7, p14.FadeTime, true)
	end

	v6.TweenTransparency(p14.TextLabel, { TextTransparency = 0.13 }, p14.FadeTime, true)
end
function t1.FadeHandler(p16, p17, p18, p19)
	assert(p17, "[Snackbar] - Internal function should not have been called. Missing NewPosition")

	if p19 then
		p16:FadeOutTransparency(if p18 then 1 else nil)
	else
		p16:FadeInTransparency(if p18 then 1 else nil)
	end

	if p18 then
		p16.Gui.Position = p17

		return
	end

	p16.Gui:TweenPosition(p17, "InOut", "Quad", p16.FadeTime, true)
end
function t1.FadeOutUp(p20, p21)
	local v60 = p20.Position
	local uDim2 = UDim2.new(0, 0, 0, -p20.Gui.AbsoluteSize.Y)

	p20:FadeHandler(v60 + uDim2, p21, true)
end
function t1.FadeOutDown(p22, p23)
	local v64 = p22.Position
	local uDim2 = UDim2.new(0, 0, 0, p22.Gui.AbsoluteSize.Y)

	p22:FadeHandler(v64 + uDim2, p23, true)
end
function t1.FadeOutRight(p24, p25)
	local v68 = p24.Position
	local uDim2 = UDim2.new(0, p24.Gui.AbsoluteSize.X, 0, 0)

	p24:FadeHandler(v68 + uDim2, p25, true)
end
function t1.FadeOutLeft(p26, p27)
	local v72 = p26.Position
	local uDim2 = UDim2.new(0, -p26.Gui.AbsoluteSize.X, 0, 0)

	p26:FadeHandler(v72 + uDim2, p27, true)
end
function t1.FadeIn(p28, p29)
	p28:FadeHandler(p28.Position, p29, false)
end

local t2: {[any]: any} = { ClassName = "DraggableSnackbar" }

t2.__index = t2
setmetatable(t2, t1)
t2.Vertical = true
t2.DefaultFadeOut = "FadeOutDown"
t2.Duration = 3
t2.AutoCloseDisabled = false

function t2.new(p30, p31, p32)
	local v79 = t1.new(p30, p31)

	setmetatable(v79, t2)
	v79.Visible = false
	v79.DraggingCoroutine = nil
	v79.ShouldDismiss = false
	v79.ShowId = 0
	v79.Mouse = players.LocalPlayer:GetMouse()
	v79.GCOnDismissal = p32 == nil
	v79[v79.DefaultFadeOut](v79, true)

	return v79
end
function t2.Show(p33)
	if not p33.Visible then
		p33.Visible = true
		p33:FadeIn()

		local showId = p33.ShowId + 1

		p33.ShowId = showId
		p33.WhileActiveMaid.DraggingBeginEvent = p33.Gui.MouseButton1Down:connect(function(p34, p35)
			if p33.ShowId ~= showId then
				warn("[DraggingBeginEvent] - self.ShowId ~= LocalShowId, but event fired")
			elseif not p33.DraggingCoroutine then
				p33:StartTrack(p34, p35)

				return
			end
		end)
		p33.WhileActiveMaid.InputDismissEvent = userInputService.InputBegan:connect(function(input)
			local UserInputTypeName = input.UserInputType.Name

			if p33.ShowId ~= showId then
				warn("[InputDismissEvent] - self.ShowId ~= LocalShowId, but event fired")
			elseif not p33.AutoCloseDisabled and not v6.MouseOver(p33.Mouse, p33.Gui) and p33.AbsolutePosition == p33.Gui.AbsolutePosition and (UserInputTypeName == "Touch" or UserInputTypeName == "MouseButton1") then
				p33:Dismiss()

				return
			end
		end)
		delay(p33.Duration, function()
			if p33.Destroy and p33.ShowId == showId and p33.Visible then
				p33:Dismiss()
			end
		end)
	end
end
function t2.StartTrack(p37, startDragPosition, p39)
	if p37.Vertical then
		p37.StartDragPosition = p39
	else
		p37.StartDragPosition = startDragPosition
	end

	p37.DragOffset = 0

	local u85 = nil

	u85 = coroutine.create(function()
		while p37.DraggingCoroutine == u85 do
			p37:Track()
			runService.RenderStepped:wait()
		end
	end)
	p37.DraggingCoroutine = u85
	p37.WhileActiveMaid.DraggingEnded = userInputService.InputEnded:connect(function(input)
		if p37.DraggingCoroutine ~= u85 then
			warn("[DraggableSnackbar] - InputEnded fire, but DraggingCoroutine was not the LocalDraggingCoroutine")
		elseif input.UserInputType.Name == "MouseButton1" then
			p37:EndTrack()

			return
		end
	end)
	p37.WhileActiveMaid.TouchDraggingEnded = userInputService.TouchEnded:connect(function(_)
		if p37.DraggingCoroutine == u85 then
			p37:EndTrack()

			return
		end

		warn("[DraggableSnackbar] - TouchEnded fire, but DraggingCoroutine was not the LocalDraggingCoroutine")
	end)
	assert(coroutine.resume(p37.DraggingCoroutine))
end
function t2.Track(p42)
	local n1
	local v88

	if p42.Vertical then
		n1 = p42.Mouse.Y - p42.StartDragPosition
		v88 = p42.Gui.AbsoluteSize.Y

		local gui = p42.Gui
		local v90 = p42.Position
		local uDim2 = UDim2.new(0, 0, 0, n1)

		gui.Position = v90 + uDim2
	else
		n1 = p42.Mouse.X - p42.StartDragPosition
		v88 = p42.Gui.AbsoluteSize.Y

		local v92 = p42.Gui
		local v93 = p42.Position
		local uDim2 = UDim2.new(0, n1, 0, 0)

		v92.Position = v93 + uDim2
	end

	local n2 = math.abs(n1) / v88

	if n2 > 1 then
		n2 = 1
	elseif n2 < 0 then
		n2 = 0
	end

	p42:FadeOutTransparency(n2)
end
function t2.GetOffsetXY(p43)
	return p43.Gui.AbsolutePosition - p43.AbsolutePosition
end
function t2.EndTrack(p44)
	p44.StartDragPosition = nil
	p44.DraggingCoroutine = nil
	p44.WhileActiveMaid.DraggingEnded = nil
	p44.WhileActiveMaid.TouchDraggingEnded = nil

	if p44.ShouldDismiss then
		p44:Dismiss()

		return
	end

	local v98 = p44:GetOffsetXY()
	local absoluteSize = p44.Gui.AbsoluteSize

	if math.abs(v98.X) >= absoluteSize.X or math.abs(v98.Y) >= absoluteSize.Y then
		p44:Dismiss()

		return
	end

	p44:FadeIn()
end
function t2.Dismiss(p45)
	if p45.Visible then
		if p45.DraggingCoroutine then
			p45.ShouldDismiss = true

			return
		end

		p45.Visible = false
		p45.ShouldDismiss = nil
		p45.WhileActiveMaid:DoCleaning()

		local v101 = p45:GetOffsetXY()

		if v101.X > 0 then
			p45:FadeOutRight()
		elseif v101.X < 0 then
			p45:FadeOutLeft()
		elseif v101.Y > 0 then
			p45:FadeOutUp()
		elseif v101.Y < 0 then
			p45:FadeOutDown()
		else
			p45[p45.DefaultFadeOut](p45)
		end

		if p45.GCOnDismissal then
			p45.GCOnDismissal = false
			delay(p45.FadeTime, function()
				p45:Destroy()
			end)

			return
		end
	else
		error("[DraggableSnackbar] - Cannot dismiss, already hidden")
	end
end
function t2.Destroy(p46)
	p46.Gui:Destroy()
	p46.Gui = nil
	p46.TextLabel:Destroy()
	p46.TextLabel = nil
	p46.WhileActiveMaid:DoCleaning()
	p46.WhileActiveMaid = nil
	p46.Visible = false
	p46.DraggingCoroutine = nil
	setmetatable(p46, nil)
end

local t3: {[any]: any} = { ClassName = "SnackbarManager" }

t3.__index = t3

function t3.new()
	local t8: {[any]: any} = {}

	setmetatable(t8, t3)
	t8.CurrentSnackbar = nil

	return t8
end
function t3.ShowSnackbar(p47, currentSnackbar)
	assert(currentSnackbar, "Must send a Snackbar")

	if currentSnackbar == p47.CurrentSnackbar and p47.CurrentSnackbar.Visible then
		currentSnackbar:Dismiss()

		return
	end

	local u106: boolean = false

	if p47.CurrentSnackbar and p47.CurrentSnackbar.Visible then
		p47.CurrentSnackbar:Dismiss()
		p47.CurrentSnackbar = nil
		u106 = true
	end

	p47.CurrentSnackbar = currentSnackbar

	if u106 then
		wait(currentSnackbar.FadeTime)
	end

	if currentSnackbar == p47.CurrentSnackbar then
		currentSnackbar:Show()
	end
end
function t3.MakeSnackbar(p49, p50, p51)
	local v110 = t2.new(p50, p51)

	p49:ShowSnackbar(v110)
end

return { DraggableSnackbar = t2, SnackbarManager = t3 }
