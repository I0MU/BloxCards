



local players: Players = game:GetService("Players")
local userInputService: UserInputService = game:GetService("UserInputService")
local runService: RunService = game:GetService("RunService")
local mouse: Mouse = players.LocalPlayer:GetMouse()

local function GetPositionFromOffset(p1, p2)
	if p2 == "Y" then
		return UDim2.new(0, 0, 0, -p1)
	end

	if p2 == "X" then
		return UDim2.new(0, -p1, 0, 0)
	end

	error("[GetPositionFromOffset] - Invalid Axis")
end
local function GetSizeFromAxis(p3, p4)
	if p4 == "Y" then
		return UDim2.new(1, 0, 0, p3)
	end

	if p4 == "X" then
		return UDim2.new(0, p3, 1, 0)
	end

	error("[GetSizeFromAxis] - Invalid Axis")
end

local u7 = nil

local t1: {[any]: any} = {
	GiveTask = function(p5, p6)
		local n1: number = #p5.Tasks + 1

		p5.Tasks[n1] = p6

		return n1
	end,
	DoCleaning = function(p7)
		local tasks = p7.Tasks

		for k, v in pairs(tasks) do
			if type(v) == "function" then
				v()
			else
				v:disconnect()
			end

			tasks[k] = nil
		end
	end
}

local t2: {[any]: any} = {
	__index = function(p8, p9)
		if t1[p9] then
			return t1[p9]
		end

		return p8.Tasks[p9]
	end,
	__newindex = function(p10, p11, p12)
		local tasks = p10.Tasks

		if p12 == nil then
			if type(tasks[p11]) ~= "function" and tasks[p11] then
				tasks[p11]:disconnect()
			end
		elseif tasks[p11] then
			p10[p11] = nil
		end

		tasks[p11] = p12
	end
}

u7 = function()
	return (setmetatable({
		Tasks = {},
		Instances = {}
	}, t2))
end

local function Round(p17, p18)
	local v38 = p18 or 1

	return math.floor(p17 / v38 + 0.5) * v38
end
local function PointInBounds(p19, p20, p21)
	if p21 > p19.AbsolutePosition.Y and p21 < p19.AbsolutePosition.Y + p19.AbsoluteSize.Y and p20 > p19.AbsolutePosition.X and p20 < p19.AbsolutePosition.X + p19.AbsoluteSize.X then
		return true
	end

	return false
end

PointInBounds = function(p22, p23)
	for k, v in pairs(p22) do
		if p23 == v then
			return k
		end
	end

	return nil
end

local function CreateFlatBacking(parent, p25)
	local v48 = p25 or 2
	local backing: Frame = Instance.new("Frame")

	backing.BackgroundTransparency = 0
	backing.BorderSizePixel = 0
	backing.Name = "Backing"
	backing.BackgroundColor3 = Color3.new(0.5803921568627451, 0.6313725490196078, 0.6823529411764706)
	backing.Size = UDim2.new(1, -v48 * 2, 1, -v48 * 2)
	backing.Position = UDim2.new(0, v48, 0, v48)
	backing.Parent = parent
	backing.ZIndex = parent.ZIndex

	return backing
end
local function GetAveragePositionFromTouchPositions(p26)
	local vector2 = Vector2.new(0, 0)

	if #p26 > 0 then
		for _, v in pairs(p26) do
			vector2 += v
		end

		vector2 /= #p26
	end

	return vector2
end

local t3: {[any]: any} = {}

t3.__index = t3

function t3.new(parent, scroller)
	local t8: {[any]: any} = {}

	setmetatable(t8, t3)
	t8.Active = true
	t8.Scroller = scroller
	t8.BarContainer = parent
	t8.Maid = u7()
	t8.Axis = scroller.Axis
	t8.ScrollSpeedOnContainerClick = 0.0625

	local scrollBar: ImageButton = Instance.new("ImageButton", parent)

	scrollBar.Name = "ScrollBar"
	scrollBar.BackgroundColor3 = Color3.new(0.5803921568627451, 0.6313725490196078, 0.6823529411764706)
	scrollBar.BackgroundTransparency = 1
	scrollBar.Image = ""
	scrollBar.Archivable = false
	scrollBar.Parent = parent
	scrollBar.BorderSizePixel = 0
	scrollBar.AutoButtonColor = false
	scrollBar.ZIndex = parent.ZIndex
	CreateFlatBacking(scrollBar, 1)
	t8.BarFrame = scrollBar
	t8.Max = 0
	t8:UpdateRender()
	t8:UpdateMouseWheelEvents()
	t8.Maid.ScrollerChanged = scroller.Frame.Changed:connect(function(p29)
		if p29 == "AbsoluteSize" or p29 == "Position" then
			wait()
			t8:UpdateRender()
		end
	end)
	t8.Maid.BarFrameMouseButton1Down = scrollBar.MouseButton1Down:connect(function()
		t8:Tap()
	end)
	t8.Maid.BarContainerChanged = parent.Changed:connect(function(p30)
		if p30 == "AbsoluteSize" then
			wait()
			t8:UpdateRender()
		elseif p30 == "Active" then
			t8:UpdateMouseWheelEvents()
		end
	end)
	t8.Maid.FrameInputBegan = parent.InputBegan:connect(function(input)
		if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
			t8:HandleClickOnBacking(t8:GetRelativePosition())
		end
	end)

	return t8
end
function t3.UpdateMouseWheelEvents(p32)
	if p32.BarContainer.Active then
		p32.Maid.MouseWheelUp = p32.BarContainer.MouseWheelForward:connect(function()
			if not p32.Pressed and not p32.Scroller.Pressed then
				p32.Scroller:ScrollUp()
			end
		end)
		p32.Maid.MouseWheelBackward = p32.BarContainer.MouseWheelBackward:connect(function()
			if not p32.Pressed and not p32.Scroller.Pressed then
				p32.Scroller:ScrollDown()
			end
		end)

		return
	end

	p32.Maid.MouseWheelUp = nil
	p32.Maid.MouseWheelBackward = nil
end
function t3.HandleClickOnBacking(p33, p34)
	if not p33.Pressed and not p33.Scroller.Pressed then
		if p34 > p33.BarFrame.AbsolutePosition[p33.Axis] - p33.BarContainer.AbsolutePosition[p33.Axis] then
			p33.Scroller:ScrollTo(p33.Scroller.Offset + p33.Scroller.PixelsPerPageUpDown, p33.ScrollSpeedOnContainerClick)

			return
		end

		p33.Scroller:ScrollTo(p33.Scroller.Offset - p33.Scroller.PixelsPerPageUpDown, p33.ScrollSpeedOnContainerClick)

		return
	end

	warn("[ScrollBar][HandleClickOnBacking] - Can't scroll, already pressed")
end
function t3.GetRelativePosition(p35)
	return p35.Scroller:GetMousePosition() - p35.BarContainer.AbsolutePosition[p35.Axis]
end
function t3.UpdateRender(p36)
	local v63 = p36.Scroller.Container.AbsoluteSize[p36.Axis]
	local v64 = p36.Scroller.Frame.AbsoluteSize[p36.Axis]

	if v64 == 0 then
		v64 = 1
	end

	local offset = p36.Scroller.Offset
	local n1 = -math.min(offset, p36.Scroller.Max - offset)

	if n1 > 0 then
		v64 += n1
	end

	p36.BarFrame.Size = GetSizeFromAxis(v63 / v64 * p36.BarContainer.AbsoluteSize[p36.Axis], p36.Axis)

	local v67 = math.max(0, offset / p36.Scroller.Max)
	local v68 = math.min(1, v67)

	p36.BarFrame.Position = GetPositionFromOffset(-(v68 * (p36.BarContainer.AbsoluteSize[p36.Axis] - p36.BarFrame.AbsoluteSize[p36.Axis])), p36.Axis)
	p36.Max = p36.BarContainer.AbsoluteSize[p36.Axis] - p36.BarFrame.AbsoluteSize[p36.Axis]
end
function t3.Destroy(p37)
	p37.Maid:DoCleaning()
	p37.Maid = nil
	p37.BarFrame:Destroy()
	p37.BarFrame = nil
	p37.Active = false
	p37.Scroller.ScrollBars[p37] = nil
	setmetatable(p37, nil)
end
function t3.Drag(p38)
	if p38.Pressed then
		local v71 = p38:GetRelativePosition()
		local n1 = p38.Reference - v71

		p38.Reference = v71
		p38:ConnectReleaseEvent()
		v71 = p38.BarContainer.AbsolutePosition[p38.Axis]

		local n2 = -(v71 - p38.PretendAbsolutePosition + n1)
		local n3 = n2 / p38.Max

		p38.PretendAbsolutePosition = v71 + n2

		local scroller = p38.Scroller
		local min = p38.Scroller.Min
		local v77 = math.min(p38.Scroller.Max, p38.Scroller.Max * n3)
		local v78 = math.max(min, v77)

		scroller:SetOffset(v78)

		return
	end

	warn("[ScrollBar] - Cannot drag, not pressed")
end
function t3.Tap(p39)
	if not p39.Pressed and not p39.Scroller.Pressed then
		p39.Pressed = true
		p39.Scroller.Pressed = true
		p39.Reference = p39:GetRelativePosition()
		p39.PretendAbsolutePosition = p39.BarFrame.AbsolutePosition[p39.Axis]

		if p39.Scroller.CurrentAutoScrollThread then
			p39.Scroller.CurrentAutoScrollThread = nil
		else
			p39.Scroller.ScrollStart:fire(p39.Scroller.Offset)
		end

		local v80, v81 = coroutine.resume(coroutine.create(function()
			while p39.Pressed and p39.Active do
				p39:Drag()
				runService.Heartbeat:wait()
			end

			p39.Scroller.Pressed = false
			p39.Scroller:ScrollTo(p39.Scroller.Offset)
		end))

		assert(v80, v81)

		return
	end

	warn("[ScrollBar] - Cannot tap, already tapping! This may be caused by the fact ROBLOX fires MouseButton1 and Touch events simultaneously.")
end
function t3.DisconnectReleaseEvent(p40)
	p40.Maid.CatchMouseUpInput = nil
end
function t3.Release(p41)
	p41.Pressed = false
	p41:DisconnectReleaseEvent()
	p41.Scroller.ScrollEnd:fire(p41.Scroller.Offset)
end
function t3.ConnectReleaseEvent(p42)
	p42.Maid.CatchMouseUpInput = userInputService.InputEnded:connect(function(input)
		if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
			p42:Release()
		end
	end)
end

local t4: {[any]: any} = {}

t4.__index = t4
t4.PixelsPerWheelTurn = 80
t4.MouseOffset = Vector2.new(0, 36)

local t5: {[any]: any} = {
	new = function()
		local bindableEvent: BindableEvent = Instance.new("BindableEvent")
		local u86 = nil
		local u87 = nil

		return {
			fire = function(_, ...)
				u86 = { ... }
				u87 = select("#", ...)
				bindableEvent:Fire()
			end,
			connect = function(_, p15)
				if not p15 then
					error("connect(nil)", 2)
				end

				return bindableEvent.Event:connect(function()
					p15(unpack(u86, 1, u87))
				end)
			end,
			wait = function(_)
				bindableEvent.Event:wait()
				assert(u86, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")

				return unpack(u86, 1, u87)
			end
		}
	end
}

function t4.new(frame, p45)
	local t9: {[any]: any} = {}

	setmetatable(t9, t4)
	t9.Active = true
	t9.Axis = p45 or "Y"
	t9.Frame = frame
	t9.Container = frame.Parent
	t9.Pressed = false
	assert(t9.Container.ClipsDescendants, "Container does not clip descendants")
	t9.Max = 0
	t9.Min = 0
	t9.PixelsPerPageUpDown = 0
	t9:RecalculateBounds()
	t9.Offset = frame.AbsolutePosition[t9.Axis] - t9.Container.AbsolutePosition[t9.Axis]
	t9.ScrollBars = {}
	t9.ScrollStart = t5.new()
	t9.ScrollEnd = t5.new()

	local maid = u7()

	t9.Maid = maid
	t9:UpdateMouseWheelEvents()
	maid.FrameChanged = frame.Changed:connect(function(p46)
		if p46 == "AbsoluteSize" then
			wait()
			t9:RecalculateBounds()
		elseif p46 == "Active" then
			t9:UpdateMouseWheelEvents()
		end
	end)
	maid.ContainerChanged = t9.Container.Changed:connect(function(p47)
		if p47 == "AbsoluteSize" then
			wait()
			t9:RecalculateBounds()
		end
	end)

	if userInputService.TouchEnabled then
		t9.Maid.FrameInputBegan = frame.InputBegan:connect(function(input)
			if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
				t9:Tap()
			end
		end)

		return t9
	end

	t9.Maid.FrameInputBegan = frame.InputBegan:connect(function(input)
		if input.UserInputType.Name == "MouseButton1" then
			t9:Tap()
		end
	end)

	return t9
end
function t4.ExpectedAtBottom(p50)
	return p50.Offset >= p50.Max - 1
end
function t4.AddScrollBar(p51, p52)
	local v95 = t3.new(p52, p51)

	p51.ScrollBars[v95] = true

	return v95
end
function t4.Destroy(p53)
	p53.Active = false
	p53.CurrentAutoScrollThread = nil

	for k, _ in pairs(p53.ScrollBars) do
		k:Destroy()
	end

	p53.Maid:DoCleaning()
	p53.Maid = nil
	p53.ScrollStart = nil
	p53.ScrollEnd = nil
	setmetatable(p53, nil)
end
function t4.ScrollUp(p54, p55)
	if not p54.Pressed then
		p54:SetOffset(p54.Offset - (p55 or p54.PixelsPerWheelTurn))
	end
end
function t4.ScrollDown(p56, p57)
	if not p56.Pressed then
		p56:SetOffset(p56.Offset + (p57 or p56.PixelsPerWheelTurn))
	end
end
function t4.UpdateMouseWheelEvents(p58)
	if p58.Frame.Active then
		p58.Maid.MouseWheelUp = p58.Frame.MouseWheelForward:connect(function()
			p58:ScrollUp()
		end)
		p58.Maid.MouseWheelBackward = p58.Frame.MouseWheelBackward:connect(function()
			p58:ScrollDown()
		end)

		return
	end

	p58.Maid.MouseWheelUp = nil
	p58.Maid.MouseWheelBackward = nil
end
function t4.RecalculateBounds(p59)
	p59.Min = 0
	p59.Max = math.max(1, p59.Frame.AbsoluteSize[p59.Axis] - p59.Container.AbsoluteSize[p59.Axis])
	p59.PixelsPerPageUpDown = p59.Container.AbsoluteSize[p59.Axis]
end
function t4.RecalculateOffset(p60)
	p60.Offset = p60.Container.AbsolutePosition[p60.Axis] - p60.Frame.AbsolutePosition[p60.Axis]
end
function t4.GetMousePosition(p61)
	return mouse[p61.Axis] - p61.MouseOffset[p61.Axis]
end
function t4.GetRelativePosition(p62)
	return p62:GetMousePosition() - p62.Container.AbsolutePosition[p62.Axis]
end
function t4.ConstrainOffset(p63, p64)
	return p64 < p63.Min and p63.Min or p64 > p63.Max and p63.Max or p64
end
function t4.SetOffset(p65, p66)
	p65.Offset = p65:ConstrainOffset(p66)
	p65.Frame.Position = GetPositionFromOffset(p65.Offset, p65.Axis)
end
function t4.ScrollTo(p67, p68)
	if p67.Pressed then
		p67:SetOffset(p68)

		return
	end

	warn("[ScrollingFrame][ScrollTo] - Will not ScrollTo new location, we are pressed")
end
function t4.Drag(p69)
	if p69.Pressed then
		local reference = p69:GetRelativePosition()
		local n1 = p69.Reference - reference

		p69.Reference = reference
		p69:SetOffset(p69.Offset + n1)

		return n1
	end

	warn("[ScrollingFrame] - Cannot drag, not pressed")

	return 0
end
function t4.IsScrolling(p70)
	return p70.Pressed
end
function t4.ConnectReleaseEvent(p71)
	p71.Maid.CatchMouseUpInput = userInputService.InputEnded:connect(function(input)
		if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
			p71:Release()
		end
	end)
end
function t4.DisconnectReleaseEvent(p73)
	p73.Maid.CatchMouseUpInput = nil
end
function t4.Tap(p74, p75)
	if not p74.Pressed then
		p74.Pressed = true
		p74.Reference = p74:GetRelativePosition()
		p74:ConnectReleaseEvent()
		p74.ScrollStart:fire(p74.Offset)

		local v122, v123 = coroutine.resume(coroutine.create(function()
			local timestamp = tick()
			local n1 = 0

			while p74.Pressed and p74.Active do
				local v196 = p74:Drag()
				local absoluteValue = math.abs(v196)

				n1 += absoluteValue
				runService.Heartbeat:wait()
			end

			if p75 then
				local n2 = tick() - timestamp
				local u199: boolean = true

				if not (n2 <= 0.15) then
					u199 = n1 < 1
				end

				p75(u199, n2, n1)
			end
		end))

		assert(v122, v123)

		return
	end

	warn("[ScrollingFrame] - Cannot tap, already tapping! This may be caused by the fact ROBLOX fires MouseButton1 and Touch events simultaneously.")
end
function t4.Release(p76)
	p76:DisconnectReleaseEvent()

	if p76.Pressed then
		p76.Pressed = false
		p76.ScrollEnd:fire(p76.Offset)
	end
end
function t4.GetPercentOffset(p77)
	return p77.Offset / p77.Max
end
function t4.ScrollToBottom(p78)
	p78:ScrollTo(p78.Max)
end
function t4.ScrollToTop(p79)
	p79:ScrollTo(0)
end

local t6: {[any]: any} = {}

setmetatable(t6, t4)
t6.__index = t6
t6.TimeConstant = 0.325
t6.WheelTurnAnimationSpeed = 0
t6.DefaultScrollToAnimationSpeed = 0.125

function t6.new(p80, p81)
	local v130 = t4.new(p80, p81)

	setmetatable(v130, t6)
	v130.Velocity = 0
	v130.Amplitude = 0

	return v130
end
function t6.ExpectedAtBottom(p82)
	local u132: boolean = true

	if p82.Offset >= p82.Max - 1 then
		return u132
	end

	if p82.CurrentAutoScrollThread and p82.Target and p82.Target >= p82.Max - 1 then
		return true
	end

	u132 = false

	return u132
end
function t6.Track(p83)
	local n1 = tick() - p83.TimeStamp

	p83.TimeStamp = tick()

	local n2 = p83.Offset - p83.LastOffset

	p83.LastOffset = p83.Offset
	p83.Velocity = 0.8 * (n2 / (0.001 + n1)) + 0.2 * p83.Velocity
end
function t6.StartAutoScroll(p84, p85)
	if p85 and p85 <= 0 then
		p84.CurrentAutoScrollThread = nil
		p84:SetOffset(p84.Target)

		return
	end

	local u138 = nil

	u138 = coroutine.create(function()
		local timeStamp = p84.TimeStamp
		local v201 = p85 or p84.TimeConstant

		while u138 == p84.CurrentAutoScrollThread and p84.Active do
			local timestamp = tick()
			local n1 = -p84.Amplitude
			local v204 = math.exp(-(timestamp - timeStamp) / v201)
			local n2 = n1 * v204

			if not (math.abs(n2) > 0.5) then
				p84:SetOffset(p84.Target)

				break
			end

			p84:SetOffset(p84.Target + n2)
			runService.RenderStepped:wait()
		end

		if p84.CurrentAutoScrollThread == u138 then
			p84.CurrentAutoScrollThread = nil

			if not p84.Pressed then
				p84.ScrollEnd:fire(p84.Offset)
			end
		end
	end)

	if not p84.Pressed and not p84.CurrentAutoScrollThread then
		p84.CurrentAutoScrollThread = u138
		p84.ScrollStart:fire(p84.Offset)
	else
		p84.CurrentAutoScrollThread = u138
	end

	local v139, v140 = coroutine.resume(u138)

	assert(v139, v140)
end
function t6.Tap(p86, p87)
	if not p86.Pressed then
		p86.Pressed = true
		p86.Reference = p86:GetRelativePosition()
		p86:ConnectReleaseEvent()
		p86.TimeStamp = tick()
		p86.Velocity = 0
		p86.LastOffset = p86.Offset
		p86.Amplitude = 0

		if p86.CurrentAutoScrollThread then
			p86.CurrentAutoScrollThread = nil
		else
			p86.ScrollStart:fire(p86.Offset)
		end

		local v143, v144 = coroutine.resume(coroutine.create(function()
			local timestamp = tick()
			local n1 = 0

			while p86.Pressed and p86.Active do
				local v208 = p86:Drag()
				local absoluteValue = math.abs(v208)

				n1 += absoluteValue
				p86:Track()
				runService.Heartbeat:wait()
			end

			if p87 then
				local n2 = tick() - timestamp
				local u211: boolean = true

				if not (n2 <= 0.15) then
					u211 = n1 < 1
				end

				p87(u211, n2, n1)
			end
		end))

		assert(v143, v144)

		return
	end

	warn("[InertiaScrollingFrame] - Cannot tap, already tapping! This may be caused by the fact ROBLOX fires MouseButton1 and Touch events simultaneously.")
end
function t6.IsAutoScrolling(p88)
	if p88.CurrentAutoScrollThread then
		return true
	end

	return false
end
function t6.ScrollTo(p89, p90, p91)
	if not p89.Pressed then
		p89.CurrentAutoScrollThread = nil
		p89.Velocity = (p90 - p89.Offset) / 0.8
		p89:Release(p91 or p89.DefaultScrollToAnimationSpeed, true)

		return
	end

	warn("[InertiaScrollingFrame][ScrollTo] - Will not scroll to new location, we are pressed.")
end
function t6.ScrollToTop(p92, p93)
	p92:ScrollTo(0, p93)
end
function t6.ScrollToBottom(p94, p95)
	p94:ScrollTo(p94.Max, p95)
end
function t6.ScrollToChild(p96, p97, p98, p99)
	p96:ScrollTo(p97.AbsolutePosition[p96.Axis] - p96.Frame.AbsolutePosition[p96.Axis] + (p98 or 0), p99)
end
function t6.ScrollUp(p100, p101)
	if not p100.Pressed then
		p100:ScrollTo(p100.Offset - p100.PixelsPerWheelTurn, p101 or p100.WheelTurnAnimationSpeed, true)
	end
end
function t6.ScrollDown(p102, p103)
	if not p102.Pressed then
		p102:ScrollTo(p102.Offset + p102.PixelsPerWheelTurn, p103 or p102.WheelTurnAnimationSpeed, true)
	end
end
function t6.Release(p104, p105, p106)
	if not p104.Pressed and not p106 then
		warn("[InertiaScrollingFrame] - Cannot drag, not pressed")

		return
	end

	p104:DisconnectReleaseEvent()
	p104.Pressed = false

	if math.abs(p104.Velocity) > 10 or p105 then
		p104.Amplitude = 0.8 * p104.Velocity

		local v164 = nil or 1

		p104.Target = math.floor((p104.Offset + p104.Amplitude) / v164 + 0.5) * v164
		p104.TimeStamp = tick()
		p104:StartAutoScroll(p105)

		return
	end

	p104.ScrollEnd:fire(p104.Offset)
	p104.CurrentAutoScrollThread = nil
end

local module: {[any]: any} = {}

setmetatable(module, t6)
module.__index = module
module.BounceBackTimeConstraint = 0.125

function module.new(p107, p108)
	local v167 = t6.new(p107, p108)

	setmetatable(v167, module)

	return v167
end
function module.SetOffset(p109, offset)
	p109.Offset = offset

	local v170 = offset
	local v171 = p109.Container.AbsoluteSize[p109.Axis]

	if offset > p109.Max then
		v170 = p109.Max + (1 - 0.5 ^ ((offset - p109.Max) / v171)) * v171
	elseif offset < p109.Min then
		v170 = -((1 - 0.5 ^ (math.abs(offset) / v171)) * v171)
	end

	p109.Frame.Position = GetPositionFromOffset(v170, p109.Axis)
end
function module.RecalculateOffset(p111)
	error("Not implimented yet")

	local n1 = p111.Container.AbsolutePosition[p111.Axis] - p111.Frame.AbsolutePosition[p111.Axis]
	local axis = p111.Axis

	if p111.Offset > p111.Max then
		n1 = (n1 - p111.Max) / p111.Container.AbsoluteSize[axis] + p111.Max
	end

	p111.Offset = n1
end
function module.Release(p112, p113, p114)
	if not p112.Pressed and not p114 then
		return
	end

	p112:DisconnectReleaseEvent()
	p112.Pressed = false

	local v178 = nil or 1

	p112.Target = math.floor((p112.Offset + 0.8 * p112.Velocity) / v178 + 0.5) * v178
	p112.TimeStamp = tick()

	local target = p112:ConstrainOffset(p112.Target)

	p112.Amplitude = target - p112.Offset

	if math.abs(p112.Velocity) > 10 or target ~= p112.Target then
		local v180 = p113

		if p112.Offset > p112.Max or p112.Offset < p112.Min then
			v180 = p112.BounceBackTimeConstraint
		end

		p112.Target = target
		p112:StartAutoScroll(v180)

		return
	end

	p112.CurrentAutoScrollThread = nil
end

return module
