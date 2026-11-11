

local runService: RunService = game:GetService("RunService")
local userInputService: UserInputService = game:GetService("UserInputService")
local guiService: GuiService = game:GetService("GuiService")
local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local visGui = playerGui:WaitForChild("VisGui")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local v5 = require(replicatedStorage.Maid).new()
local hidden = Vector3.new(-10, -10, -10)
local vectorValue = hidden
local arrowGui = nil
local textLabel = nil
local imageLabel = nil
local origin = nil
-- FIX (arrow detached from the action): the start point used to be a one-time snapshot of the asking card's position. An action card is
-- still flying to the effect stage when the target request arrives, so the arrow was left behind where the card WAS. Start now also takes a
-- function that returns the card's current centre; update() calls it every frame so the arrow stays glued to the card.
local originGetter = nil

-- The red "SELECT A TARGET" bar runs from the card that is asking (vectorValue, screen position) to the mouse, with an arrow
-- tip (Head) on the mouse end. It is only visible between Start and Reset.
-- The mouse position sits INSIDE the arrow head (in the middle of it) and the real system cursor stays visible there, drawn on
-- top of the triangle, so you can always see exactly where you are aiming.
--
-- FIX 1 (cursor): the system cursor used to be hidden for as long as the arrow was up. It now stays on (and is put back the way
-- it was on Reset). The head is a little bigger so the cursor icon sits inside it.
--
-- FIX 2 (actions): the arrow used to live inside VisGui with ZIndex 10000. VisGui uses ZIndexBehavior.Global and Battle gives
-- cards ZIndex = Height * Number, where Number climbs by 10 on every card move (up to 50000) and the effect stage's Height is
-- 10 (VirtualStage is 100000, the effect description label is 100000). So once a few dozen cards had moved, the Action card on
-- the effect stage - the card the arrow starts from - and everything around it were drawn ABOVE the arrow, and the arrow
-- disappeared. The arrow now has its own ScreenGui with a high DisplayOrder, so no ZIndex inside VisGui can ever cover it.
local HEAD_LENGTH = 64 -- tip to base, in pixels
local HEAD_WIDTH = 56 -- width of the base, in pixels
local ARROW_DISPLAY_ORDER = 5000 -- above VisGui (0), Inspection (5), Alert / Top / Intro (100), Settings (99); below the loading screen / debug UI
local savedIconEnabled = nil

-- FIX: the arrow used to vanish the instant the choice was made. It now fades out quickly instead.
local tweenService: TweenService = game:GetService("TweenService")
local FADE_TIME = 0.15
local fadeToken = 0
local fadeTweens = {}

local function stopFade()
	fadeToken += 1
	for _, tween in ipairs(fadeTweens) do
		tween:Cancel()
	end
	fadeTweens = {}

	if textLabel then
		textLabel.BackgroundTransparency = 0
		textLabel.TextTransparency = 0
	end

	if imageLabel then
		for _, strip in ipairs(imageLabel:GetChildren()) do
			if strip:IsA("Frame") then
				strip.BackgroundTransparency = 0
			end
		end
	end
end

local function fadeOut()
	if not textLabel or not textLabel.Parent or not textLabel.Visible then
		return
	end

	stopFade()

	local token = fadeToken
	local info = TweenInfo.new(FADE_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local label = textLabel
	local tweens = { tweenService:Create(label, info, { BackgroundTransparency = 1, TextTransparency = 1 }) }

	if imageLabel then
		for _, strip in ipairs(imageLabel:GetChildren()) do
			if strip:IsA("Frame") then
				table.insert(tweens, tweenService:Create(strip, info, { BackgroundTransparency = 1 }))
			end
		end
	end

	fadeTweens = tweens

	for _, tween in ipairs(tweens) do
		tween:Play()
	end

	task.delay(FADE_TIME + 0.02, function()
		if token == fadeToken then
			label.Visible = false
			stopFade() -- put the transparency back for the next Start
		end
	end)
end

local function keepSystemCursorVisible()
	if savedIconEnabled == nil then
		savedIconEnabled = userInputService.MouseIconEnabled
	end

	-- every frame: something else (a hidden cutscene cursor, ...) may have switched it off
	if not userInputService.MouseIconEnabled then
		userInputService.MouseIconEnabled = true
	end
end

local function restoreSystemCursor()
	if savedIconEnabled ~= nil then
		userInputService.MouseIconEnabled = savedIconEnabled
		savedIconEnabled = nil
	end
end

-- a filled triangle pointing LEFT: its tip is at x = tipX (relative to parent's left edge), it is as wide as `slope` * 2 * distance
-- from the tip, and it ends (flat base) at x = baseX. Drawn as 1px steps so it has no image dependency.
local function buildTriangle(parent: GuiObject, tipX: number, baseX: number, slope: number, color: Color3, zIndex: number)
	for x = tipX, baseX - 1 do
		local strip = Instance.new("Frame")

		strip.Name = "Strip"
		strip.AnchorPoint = Vector2.new(0, 0.5)
		strip.Position = UDim2.new(0, x, 0.5, 0)
		strip.Size = UDim2.fromOffset(2, math.max(1, math.floor(2 * (x + 0.5 - tipX) * slope + 0.5)))
		strip.BackgroundColor3 = color
		strip.BorderSizePixel = 0
		strip.Active = false
		strip.ZIndex = zIndex
		strip.Parent = parent
	end
end

local function update()
	if not textLabel or not textLabel.Parent or not origin or not origin.Parent then
		restoreSystemCursor() -- the arrow was torn down while it was active
		return
	end

	if vectorValue == hidden then
		return
	end

	keepSystemCursorVisible()

	if originGetter then
		local ok, current = pcall(originGetter)

		if ok and typeof(current) == "Vector3" then
			vectorValue = current -- (if the card can't be found for a moment the last known point is kept)
		end
	end

	-- `origin` sits at the arrow ScreenGui's (0, 0): AbsolutePosition of it = where that GUI's coordinates start on the screen.
	-- The arrow ScreenGui uses the same inset settings as VisGui (see Initializes), so a card's AbsolutePosition and the mouse
	-- convert to arrow-GUI coordinates exactly as they used to convert to VisGui coordinates.
	local offset = origin.AbsolutePosition

	-- FIX 3 (mouse too high above the arrow): GetMouseLocation() is in RAW screen pixels (it includes the top bar), but the
	-- arrow ScreenGui (IgnoreGuiInset = false, ScreenInsets = CoreUISafeInsets) starts BELOW the top bar. Its origin's
	-- AbsolutePosition is reported as (0, 0) in that case, so nothing was subtracted and the arrow was drawn one top-bar
	-- height (the inset) too low, i.e. the cursor sat above the arrow head. When the origin reports no offset but the GUI
	-- really is inset, use the real inset.
	if arrowGui and not arrowGui.IgnoreGuiInset and arrowGui.ScreenInsets ~= Enum.ScreenInsets.None and offset.Magnitude < 0.5 then
		offset = guiService:GetGuiInset()
	end

	local mouseLocation = userInputService:GetMouseLocation()
	local from = Vector2.new(vectorValue.X - offset.X, vectorValue.Y - offset.Y)
	local to = Vector2.new(mouseLocation.X - offset.X, mouseLocation.Y - offset.Y)
	local middle = (from + to) / 2

	textLabel.Size = UDim2.fromOffset((to - from).Magnitude, 19)
	textLabel.Position = UDim2.fromOffset(middle.X, middle.Y)
	textLabel.Rotation = math.deg(math.atan2(from.Y - to.Y, from.X - to.X))
end

print("Finished loading " .. script.Name)

local module: {[any]: any} = {}

function module.Initializes()
	if arrowGui then
		arrowGui:Destroy() -- takes the old origin / Body / Head with it
	end

	fadeToken += 1
	fadeTweens = {}
	arrowGui = nil
	textLabel = nil
	imageLabel = nil
	origin = nil

	-- Its own ScreenGui: with a high DisplayOrder it is drawn above every other GUI, whatever ZIndex the cards use.
	-- It copies VisGui's inset settings so the coordinate maths in update() stays the same as it was inside VisGui.
	local reference = playerGui:FindFirstChild("VisGui") or visGui
	local screenGui = Instance.new("ScreenGui")

	screenGui.Name = "TargetArrowGui"
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = ARROW_DISPLAY_ORDER
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.IgnoreGuiInset = reference.IgnoreGuiInset

	pcall(function()
		screenGui.ScreenInsets = reference.ScreenInsets
	end)

	screenGui.Parent = playerGui
	arrowGui = screenGui

	origin = Instance.new("Frame")
	origin.Name = "TargetArrowOrigin"
	origin.BackgroundTransparency = 1
	origin.BorderSizePixel = 0
	origin.AnchorPoint = Vector2.new(0, 0)
	origin.Position = UDim2.fromOffset(0, 0)
	origin.Size = UDim2.fromOffset(0, 0)
	origin.Active = false
	origin.Parent = screenGui
	textLabel = Instance.new("TextLabel")
	textLabel.Name = "Body"
	textLabel.Text = "SELECT A TARGET"
	textLabel.BorderColor3 = Color3.new(0.9, 0, 0)
	textLabel.BackgroundColor3 = Color3.new(1, 0, 0)
	textLabel.TextScaled = true
	textLabel.BorderSizePixel = 2
	textLabel.BorderMode = Enum.BorderMode.Inset
	textLabel.Size = UDim2.new(0, 1, 0, 1)
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Active = false
	textLabel.ZIndex = 10000
	textLabel.Visible = false
	textLabel.Parent = screenGui

	-- The arrow tip. The Body's left edge is the mouse end, so the head is centred on that edge: the mouse position (and the
	-- system cursor that is drawn there) is in the middle of the head, which points away from the card (toward where the mouse
	-- is going).
	imageLabel = Instance.new("Frame")
	imageLabel.Name = "Head"
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Size = UDim2.fromOffset(HEAD_LENGTH, HEAD_WIDTH)
	imageLabel.Position = UDim2.new(0, 0, 0.5, 0)
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Active = false
	imageLabel.ZIndex = 10001
	imageLabel.Visible = true
	imageLabel.Parent = textLabel

	local slope = (HEAD_WIDTH / 2) / HEAD_LENGTH

	buildTriangle(imageLabel, 0, HEAD_LENGTH, slope, Color3.new(1, 0, 0), 10002)
end
function module.Start(p3)
	if not arrowGui or not arrowGui.Parent or not textLabel or not textLabel.Parent or not origin or not origin.Parent then
		module.Initializes() -- (re)build if the arrow GUI was removed
	end

	v5:DoCleaning()
	stopFade() -- cancel a fade-out that is still running
	originGetter = nil

	if type(p3) == "function" then
		originGetter = p3

		local ok, current = pcall(p3)

		vectorValue = (ok and typeof(current) == "Vector3") and current or hidden
	else
		vectorValue = p3
	end

	textLabel.Visible = true
	update()
	v5:GiveTask(runService.RenderStepped:Connect(update))
end
function module.Reset()
	v5:DoCleaning()
	originGetter = nil
	vectorValue = hidden
	restoreSystemCursor()
	fadeOut() -- the arrow stops following the mouse (DoCleaning above) and fades where it is
end

return module
