



game:GetService("Players")

local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local userInputService: UserInputService = game:GetService("UserInputService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v5 = loadLibrary("qSystems")

loadLibrary("Table")

local make = v5.Make
local modify = v5.Modify
local t1 = {
	K = { __mode = "k" },
	V = { __mode = "v" },
	KV = { __mode = "kv" }
}

t1 = function(p1)
	local v41 = p1

	while true do
		if v41:IsA("ScreenGui") then
			break
		end

		v41 = v41.Parent

		if v41 == nil then
			return nil
		end
	end

	return v41
end

local function NewColor3(p2, p3, p4)
	return Color3.new(p2 / 255, p3 / 255, p4 / 255)
end
local function GetCenteringPosition(p5)
	return UDim2.new(0.5, -p5.AbsoluteSize.X / 2, 0.5, -p5.AbsoluteSize.Y / 2)
end
local function GetHalfSize(p6)
	local v47 = p6.Size

	return UDim2.new(v47.X.Scale / 2, v47.X.Offset / 2, v47.Y.Scale / 2, v47.Y.Offset / 2)
end
local function Center(p7)
	p7.Position = UDim2.new(0.5, -p7.AbsoluteSize.X / 2, 0.5, -p7.AbsoluteSize.Y / 2)
end
local function MouseOver(p11, p12)
	local x = p11.X
	local y = p11.Y

	if y > p12.AbsolutePosition.Y and y < p12.AbsolutePosition.Y + p12.AbsoluteSize.Y and x > p12.AbsolutePosition.X and x < p12.AbsolutePosition.X + p12.AbsoluteSize.X then
		return true
	end

	return false
end
local function IsPhone(p13)
	if p13.AbsoluteSize.Y < 600 and userInputService.TouchEnabled then
		return true
	end

	return false
end
local function TouchOnly()
	return not userInputService.MouseEnabled
end
local function UDim2OffsetFromVector2(p14)
	return UDim2.new(0, p14.X, 0, p14.Y)
end
local function MultiplyUDim2Offset(p15, p16)
	return UDim2.new(p15.X.Scale, p15.X.Offset * p16, p15.Y.Scale, p15.Y.OFfset * p16)
end
local function PickRandomColor3(p17)
	local randomNumber = math.random(1, #p17)

	return p17[randomNumber]
end

v5 = {
	GetScreen = t1,
	getScreen = t1,
	get_screen = t1,
	NewColor3 = NewColor3,
	newColor3 = NewColor3,
	new_color3 = NewColor3,
	MakeColor3 = NewColor3,
	makeColor3 = NewColor3,
	GetCenteringPosition = GetCenteringPosition,
	getCenteringPosition = GetCenteringPosition,
	get_centering_position = GetCenteringPosition,
	GetHalfSize = GetHalfSize,
	getHalfSize = GetHalfSize,
	get_half_size = GetHalfSize,
	Center = Center,
	center = Center,
	PointInBounds = function(p8, p9, p10)
		if p10 > p8.AbsolutePosition.Y and p10 < p8.AbsolutePosition.Y + p8.AbsoluteSize.Y and p9 > p8.AbsolutePosition.X and p9 < p8.AbsolutePosition.X + p8.AbsoluteSize.X then
			return true
		end

		return false
	end,
	MouseOver = MouseOver,
	mouseOver = MouseOver,
	mouse_over = MouseOver,
	isPhone = IsPhone,
	IsPhone = IsPhone,
	is_phone = IsPhone,
	TouchOnly = TouchOnly,
	touchOnly = TouchOnly,
	touch_only = TouchOnly,
	UDim2OffsetFromVector2 = UDim2OffsetFromVector2,
	uDim2OffsetFromVector2 = UDim2OffsetFromVector2,
	udim2_offset_from_vector2 = UDim2OffsetFromVector2,
	MultiplyUDim2Offset = MultiplyUDim2Offset,
	multiplyUDim2Offset = MultiplyUDim2Offset,
	PickRandomColor3 = PickRandomColor3,
	pickRandomColor3 = PickRandomColor3
}
local u19: boolean = true

if game:FindService("MeshContentProvider") == nil then
	u19 = game:FindService("NetworkServer") == nil
end

local text: string = tostring(u19)

print("[qGUI]- IsLocal is " .. text)

local t2: {[any]: any} = {}
local u22: boolean = false

local function SetProperties(p18, p19, p20, p21)
	for k, v in pairs(p21) do
		local v68 = p20[k]

		p18[k] = v68 + (v - v68) * p19
	end
end
local function UpdateTweenModels()
	local timestamp = tick()
	local u70: boolean = false

	for k, v in pairs(t2) do
		if k:IsDescendantOf(game) then
			u70 = true

			local n1 = timestamp - v.StartTime
			local vDuration = v.Duration

			if n1 > vDuration then
				local vStartProperties = v.StartProperties

				for k2, iterValue in pairs(v.NewProperties) do
					local v78 = vStartProperties[k2]

					k[k2] = v78 + (iterValue - v78) * 1
				end

				t2[k] = nil
			else
				local n2 = n1 / vDuration
				local startProperties = v.StartProperties

				for k3, iterValue2 in pairs(v.NewProperties) do
					local v83 = startProperties[k3]

					k[k3] = v83 + (iterValue2 - v83) * n2
				end
			end
		else
			t2[k] = nil
		end
	end

	return u70
end
local function StartProcessUpdate()
	if not u22 then
		u22 = true

		if u19 then
			local s1: string = "TweenTransparencyOnGuis" .. tick()

			runService:BindToRenderStep(s1, 2000, function()
				if not UpdateTweenModels() then
					u22 = false
					runService:UnbindFromRenderStep(s1)
				end
			end)

			return
		end

		local v85, v86 = coroutine.resume(coroutine.create(function()
			repeat
			until not UpdateTweenModels() and wait(0.05)

			u22 = false
		end))

		if not v85 then
			u22 = false
			error(v86)
		end

		return
	end
end
local function TweenTransparency(p22, p23, p24, p25)
	if t2[p22] and not p25 then
		return
	end

	if p24 <= 0 then
		warn("[TweenTransparency] - Duration <= 0")

		for k, v in pairs(p23) do
			local v93 = p23[k]

			p22[k] = v93 + (v - v93) * 1
		end

		return
	end

	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}

	for k, v in pairs(p23) do
		if v ~= p22[k] then
			t4[k] = p22[k]
			t5[k] = v
		end
	end

	t2[p22] = {
		StartTime = tick(),
		Duration = p24 or error("No duration"),
		StartProperties = t4,
		NewProperties = t5
	}
	StartProcessUpdate()
end
local function stopTransparencyTween(p26)
	t2[p26] = nil
end

v5.TweenTransparency = TweenTransparency
v5.tweenTransparency = TweenTransparency
v5.StopTransparencyTween = stopTransparencyTween
v5.stopTransparencyTween = stopTransparencyTween

local u28: boolean = true

if game:FindService("MeshContentProvider") == nil then
	u28 = game:FindService("NetworkServer") == nil
end

local t3: {[any]: any} = {}
local u30 = false

local function LerpNumber(p27, p28, p29)
	return p27 + (p28 - p27) * p29
end
local function LerpColor3(p30, p31, p32)
	local r = p30.r
	local g = p30.g
	local b = p30.b

	return Color3.new(r + (p31.r - r) * p32, g + (p31.g - g) * p32, b + (p31.b - b) * p32)
end
local function v33(p33, p34, p35, p36)
	for k, v in pairs(p36) do
		local v114 = p35[k]
		local r = v114.r
		local g = v114.g
		local b = v114.b

		p33[k] = Color3.new(r + (v.r - r) * p34, g + (v.g - g) * p34, b + (v.b - b) * p34)
	end
end
local function v34()
	local timestamp = tick()

	u30 = false

	for k, v in pairs(t3) do
		if k and k:IsDescendantOf(game) then
			u30 = tick()

			local n1 = timestamp - v.StartTime
			local vDuration = v.Duration

			if n1 > vDuration then
				v33(k, 1, v.StartProperties, v.NewProperties)
				t3[k] = nil
			else
				v33(k, n1 / vDuration, v.StartProperties, v.NewProperties)
			end
		else
			t3[k] = nil
		end
	end
end
local function v35()
	if not u30 or not (u30 + 0.1 >= tick()) then
		u30 = tick()
		assert(coroutine.resume(coroutine.create(function()
			while u30 do
				v34()

				if u28 then
					runService.RenderStepped:wait()
				else
					wait(0.05)
				end
			end
		end)))
	end
end
local function tweenColor3(p37, p38, p39, p40)
	if t3[p37] and not p40 then
		return
	end

	if p39 <= 0 then
		v33(p37, 1, p38, p38)

		return
	end

	local t6: {[any]: any} = {}
	local t7: {[any]: any} = {}

	for k, v in pairs(p38) do
		if v ~= p37[k] then
			t6[k] = p37[k]
			t7[k] = v
		end
	end

	t3[p37] = {
		StartTime = tick(),
		Duration = p39 or error("No duration"),
		StartProperties = t6,
		NewProperties = t7
	}
	v35()
end
local function StopColor3Tween(p41)
	t3[p41] = nil
end

v5.TweenColor3 = tweenColor3
v5.tweenColor3 = tweenColor3
v5.StopColor3Tween = StopColor3Tween
v5.stopColor3Tween = StopColor3Tween
StopColor3Tween = function(parent, p43, p44, p45, p46, p47, p48)
	local u139 = p45 or 0.6
	local n1 = (p43 or parent.AbsolutePosition.X + parent.AbsoluteSize.X / 2) - parent.AbsolutePosition.X
	local n2 = (p44 or parent.AbsolutePosition.Y + parent.AbsoluteSize.Y / 2) - parent.AbsolutePosition.Y
	local frame = nil

	if not p46 then
		frame = Instance.new("Frame", parent)
		frame.ClipsDescendants = true
		frame.Archivable = false
		frame.BorderSizePixel = 0
		frame.BackgroundTransparency = 1
		frame.Name = "Circle_Effect"
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.ZIndex = math.min(parent.ZIndex + 1, 10)
		frame.Parent = parent
	end

	local circle: ImageLabel = Instance.new("ImageLabel")

	circle.Image = "http://www.roblox.com/asset/?id=172318712"
	circle.Name = "Circle"
	circle.ImageTransparency = 0.75
	circle.BackgroundTransparency = 1
	circle.BorderSizePixel = 0
	circle.Archivable = false
	circle.Size = UDim2.new(0, 6, 0, 6)
	circle.ZIndex = math.min(parent.ZIndex + 1, 10)
	circle.ImageColor3 = p48 or Color3.new(1, 1, 1)
	circle.Position = UDim2.new(0, n1 - 3, 0, n2 - 3)

	local v144

	if p47 then
		v144 = p47
	else
		v144 = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2 * 2.82842712475
	end

	local uDim2 = UDim2.new(0, v144, 0, v144)
	local uDim22 = UDim2.new(0, n1 - v144 / 2, 0, n2 - v144 / 2)

	circle.Parent = frame or parent
	circle:TweenSizeAndPosition(uDim2, uDim22, "Out", "Linear", u139, true)
	TweenTransparency(circle, { ImageTransparency = 0.5 }, u139 / 3, true)
	delay(u139 / 3, function()
		TweenTransparency(circle, { ImageTransparency = 1 }, u139 * 2 / 3, true)
		wait(u139 * 2 / 3 + 0.1)

		if frame then
			frame:Destroy()

			return
		end

		circle:Destroy()
	end)

	return frame or circle
end
v5.ResponsiveCircleClickEffect = StopColor3Tween
v5.SimpleInk = StopColor3Tween
StopColor3Tween = function()
	return make("ImageButton", {
		Active = false,
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Name = "MouseDrag",
		ZIndex = 10,
		Size = UDim2.new(1.5, 0, 1.5, 0),
		Position = UDim2.new(-0.25, 0, -0.25, 0)
	})
end
v5.GenerateMouseDrag = StopColor3Tween
v5.generateMouseDrag = StopColor3Tween

local function addTexturedWindowTemplate(parent, p50, p51)
	local v150 = p51 or "Frame"
	local backgroundColor3 = parent.BackgroundColor3
	local uDim2 = UDim2.new(0, p50, 0, p50)
	local v153 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "TopLeft",
		BackgroundTransparency = 1,
		BackgroundColor3 = backgroundColor3,
		Parent = parent,
		Position = UDim2.new(0, 0, 0, 0),
		Size = uDim2,
		ZIndex = parent.ZIndex
	})
	local parentBackgroundColor3 = parent.BackgroundColor3
	local uDim23 = UDim2.new(0, 0, 1, -p50)
	local uDim24 = UDim2.new(0, p50, 0, p50)
	local v157 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "BottomLeft",
		BackgroundTransparency = 1,
		BackgroundColor3 = parentBackgroundColor3,
		Parent = parent,
		Position = uDim23,
		Size = uDim24,
		ZIndex = parent.ZIndex
	})
	local v158 = parent.BackgroundColor3
	local uDim25 = UDim2.new(1, -p50, 0, 0)
	local uDim26 = UDim2.new(0, p50, 0, p50)
	local v161 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "TopRight",
		BackgroundTransparency = 1,
		BackgroundColor3 = v158,
		Parent = parent,
		Position = uDim25,
		Size = uDim26,
		ZIndex = parent.ZIndex
	})
	local v162 = parent.BackgroundColor3
	local uDim27 = UDim2.new(1, -p50, 1, -p50)
	local uDim28 = UDim2.new(0, p50, 0, p50)
	local v165 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "BottomRight",
		BackgroundTransparency = 1,
		BackgroundColor3 = v162,
		Parent = parent,
		Position = uDim27,
		Size = uDim28,
		ZIndex = parent.ZIndex
	})
	local v166 = parent.BackgroundColor3
	local uDim29 = UDim2.new(0, p50, 0, 0)
	local uDim210 = UDim2.new(1, -p50 * 2, 1, 0)
	local v169 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "Middle",
		BackgroundTransparency = 1,
		BackgroundColor3 = v166,
		Parent = parent,
		Position = uDim29,
		Size = uDim210,
		ZIndex = parent.ZIndex
	})
	local v170 = parent.BackgroundColor3
	local uDim211 = UDim2.new(0, 0, 0, p50)
	local uDim212 = UDim2.new(0, p50, 1, -p50 * 2)
	local v173 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "MiddleLeft",
		BackgroundTransparency = 1,
		BackgroundColor3 = v170,
		Parent = parent,
		Position = uDim211,
		Size = uDim212,
		ZIndex = parent.ZIndex
	})
	local v174 = parent.BackgroundColor3
	local uDim213 = UDim2.new(1, -p50, 0, p50)
	local uDim214 = UDim2.new(0, p50, 1, -p50 * 2)
	local v177 = make(v150, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "MiddleRight",
		BackgroundTransparency = 1,
		BackgroundColor3 = v174,
		Parent = parent,
		Position = uDim213,
		Size = uDim214,
		ZIndex = parent.ZIndex
	})

	return v153, v161, v157, v165, v169, v173, v177
end

v5.AddTexturedWindowTemplate = addTexturedWindowTemplate
v5.addTexturedWindowTemplate = addTexturedWindowTemplate

local function addNinePatch(parent, image, p54, p55, p56, p57)
	local t8 = p57 or {}
	local v185 = p56 or "ImageLabel"
	local v186, v187, v188, v189, v190, v191, v192 = addTexturedWindowTemplate(parent, p55, v185)

	v190.Size = UDim2.new(1, -p55 * 2, 1, -p55 * 2)
	v190.Position = UDim2.new(0, p55, 0, p55)

	local backgroundColor3 = parent.BackgroundColor3
	local uDim2 = UDim2.new(0, p55, 0, 0)
	local uDim215 = UDim2.new(1, -p55 * 2, 0, p55)
	local v196 = make(v185, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "MiddleTop",
		BackgroundTransparency = 1,
		BackgroundColor3 = backgroundColor3,
		Parent = parent,
		Position = uDim2,
		Size = uDim215,
		ZIndex = parent.ZIndex
	})
	local parentBackgroundColor3 = parent.BackgroundColor3
	local uDim216 = UDim2.new(0, p55, 1, -p55)
	local uDim217 = UDim2.new(1, -p55 * 2, 0, p55)
	local v200 = make(v185, {
		Archivable = false,
		BorderSizePixel = 0,
		Name = "MiddleBottom",
		BackgroundTransparency = 1,
		BackgroundColor3 = parentBackgroundColor3,
		Parent = parent,
		Position = uDim216,
		Size = uDim217,
		ZIndex = parent.ZIndex
	})

	for _, v in pairs({
		v186,
		v187,
		v188,
		v189,
		v190,
		v191,
		v192,
		v196,
		v200
	}) do
		modify(v, t8)
		v.Image = image
		v.ImageRectSize = Vector2.new(p54.X / 3, p54.Y / 3)
	end

	v187.ImageRectOffset = Vector2.new(p54.X * 0.6666666666666666, 0)
	v192.ImageRectOffset = Vector2.new(p54.X * 0.6666666666666666, p54.Y / 3)
	v189.ImageRectOffset = Vector2.new(p54.X * 0.6666666666666666, p54.Y * 0.6666666666666666)
	v191.ImageRectOffset = Vector2.new(0, p54.Y / 3)
	v188.ImageRectOffset = Vector2.new(0, p54.Y * 0.6666666666666666)
	v190.ImageRectOffset = Vector2.new(p54.X / 3, p54.Y / 3)
	v196.ImageRectOffset = Vector2.new(p54.Y / 3, 0)
	v200.ImageRectOffset = Vector2.new(p54.Y / 3, p54.Y * 0.6666666666666666)

	return v186, v187, v188, v189, v190, v191, v192, v196, v200
end

v5.AddNinePatch = addNinePatch
v5.addNinePatch = addNinePatch

function v5.BackWithRoundedRectangle(p58, p59, p60)
	local v206 = p60 or Color3.new(1, 1, 1)

	return addNinePatch(p58, "rbxassetid://176688412", Vector2.new(150, 150), p59, "ImageLabel", { ImageColor3 = v206 })
end

return v5
