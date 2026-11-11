



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("FunctionMap")
local v3 = replicatedStorage("qGUI")

local function Map(p1, p2, ...)
	for _, v in pairs(p1) do
		p2(v, ...)
	end
end

local module: {[any]: any} = {}

module.__index = module
module.ClassName = "KeyIcon"
module.DefaultIconData = { Image = "rbxassetid://245857779", ImageSize = Vector2.new(30, 30) }
module.DefaultFillIconData = { Image = "rbxassetid://245608758", ImageSize = Vector2.new(150, 150) }

function module.new(gui, fillFrameTween)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.GUI = gui
	t2.FillFrameTween = fillFrameTween
	t2:RescaleWidth()

	return t2
end
function module.NewDefaultTextLabel(p5)
	local v15 = p5 or 30
	local defaultKeyIcon: TextLabel = Instance.new("TextLabel")

	defaultKeyIcon.Name = "DefaultKeyIcon"
	defaultKeyIcon.Size = UDim2.new(0, v15, 0, v15)
	defaultKeyIcon.BackgroundTransparency = 1
	defaultKeyIcon.TextColor3 = Color3.new(1, 1, 1)
	defaultKeyIcon.BorderSizePixel = 0
	defaultKeyIcon.Font = "Arial"
	defaultKeyIcon.FontSize = "Size24"
	defaultKeyIcon.Text = "X"

	return defaultKeyIcon
end
function module.NewDefaultImageLabel(p6, p7)
	local v19 = p6 or 30
	local defaultKeyIcon: ImageLabel = Instance.new("ImageLabel")

	defaultKeyIcon.Name = "DefaultKeyIcon"
	defaultKeyIcon.Size = UDim2.new(0, v19, 0, v19)
	defaultKeyIcon.BackgroundTransparency = 1
	defaultKeyIcon.BorderSizePixel = 0
	defaultKeyIcon.Image = p7 or error("No Image URL")

	return defaultKeyIcon
end
function module.NewDefault(p8, p9)
	if p9 then
		local v23 = module.NewDefaultImageLabel(p8, p9.Default)

		return module.FromBaseGUIImage(v23, p9)
	end

	local v24 = module.NewDefaultTextLabel(p8)

	return module.FromBaseGUI(v24, module.DefaultIconData, module.DefaultFillIconData)
end
local function TweenFunctionFactory(p10, p11, p12)
	return function(p13, p14, p15)
		local t7: {[any]: any} = {}

		for _, v in pairs(p10) do
			t7[v] = p12(p14, v)
		end

		p11(p13, t7, p15, true)
	end
end
function module.FromBaseGUIImage(parent, p17)
	local newDefaultImageLabel = module.NewDefaultImageLabel
	local v31 = p17.Fill or error("No fill data")
	local fillIcon = newDefaultImageLabel(nil, v31)

	fillIcon.Size = UDim2.new(1, 0, 1, 0)
	fillIcon.ZIndex = parent.ZIndex - 1
	fillIcon.Name = "FillIcon"
	fillIcon.Parent = parent
	fillIcon.ImageTransparency = 1

	local t3: {[any]: any} = { "ImageTransparency" }
	local tweenTransparency = v3.TweenTransparency

	local function v35(p18, _)
		return p18
	end

	local v36 = v2.new({ fillIcon }, function(p20, p21, p22)
		local t8: {[any]: any} = {}

		for _, v in pairs(t3) do
			t8[v] = v35(p21, v)
		end

		tweenTransparency(p20, t8, p22, true)
	end)

	return module.new(parent, v36)
end
function module.FromBaseGUI(p23, p24, p25)
	local addNinePatch = v3.AddNinePatch
	local image = p25.Image
	local imageSize = p25.ImageSize

	Map({ v3.AddNinePatch(p23, p24.Image, p24.ImageSize, 7, "ImageLabel") }, function(p26)
		p26.ZIndex = p23.ZIndex - 1
	end)

	local t4: {[any]: any} = { addNinePatch(p23, image, imageSize, 7, "ImageLabel") }

	Map(t4, function(p27)
		p27.ZIndex = p23.ZIndex - 1
		p27.ImageTransparency = 1
	end)

	local t5: {[any]: any} = { "ImageTransparency" }
	local tweenTransparency = v3.TweenTransparency

	local function v46(p28, _)
		return p28
	end

	local v47 = v2.new(t4, function(p30, p31, p32)
		local t9: {[any]: any} = {}

		for _, v in pairs(t5) do
			t9[v] = v46(p31, v)
		end

		tweenTransparency(p30, t9, p32, true)
	end)

	if p23:IsA("TextLabel") then
		local t6: {[any]: any} = { "TextColor3" }
		local tweenColor3 = v3.TweenColor3

		local function v50(p33, _)
			return Color3.new(p33 ^ 2, p33 ^ 2, p33 ^ 2)
		end

		v47:AddChild(v2.new({ p23 }, function(p35, p36, p37)
			local t10: {[any]: any} = {}

			for _, v in pairs(t6) do
				t10[v] = v50(p36, v)
			end

			tweenColor3(p35, t10, p37, true)
		end))
	end

	return module.new(p23, v47)
end
function module.SetFillTransparency(p38, p39, p40)
	p38.FillFrameTween:Map(p39, p40 or 0.2, true)
end
function module.RescaleWidth(p41)
	if p41.GUI:IsA("TextLabel") then
		local y = p41.GUI.Size.Y
		local gui = p41.GUI
		local uDim2New = UDim2.new
		local v58 = math.max(p41.GUI.Size.X.Offset, p41.GUI.TextBounds.X + 16)

		gui.Size = uDim2New(0, v58, y.Scale, y.Offset)
	end

	p41.Width = p41.GUI.Size.X.Offset
end
function module.Destroy(p42)
	setmetatable(p42, nil)
	p42.OutlineTween = nil
	p42.FillFrameTween = nil
	p42.GUI:Destroy()
end

return module
