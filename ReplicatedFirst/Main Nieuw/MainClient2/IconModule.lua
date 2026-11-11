



local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local visGuiBattle = visGui.Battle
local clr = require(game.ReplicatedStorage.CONFIG).CLR

Icon = {}
Icon.__index = Icon

function Icon.new(p1, p2)
	local t1: {[any]: any} = {}

	setmetatable(t1, Icon)
	Icon.Color = p2

	local uDim2 = UDim2.new(0, 40, 0, 40)
	local foundChild = visGuiBattle.IconHolder:FindFirstChild("Icon Neutral")

	if foundChild then
		uDim2 = foundChild.AbsoluteSize
	end

	local imageButton: ImageButton = Instance.new("ImageButton")

	imageButton.Image = "rbxassetid://511406127"
	imageButton.ZIndex = 4
	imageButton.BackgroundTransparency = 1
	imageButton.ImageColor3 = clr[p2] or Color3.new(0, 0, 0)
	imageButton.BackgroundColor3 = clr[p2] or Color3.new(0, 0, 0)
	imageButton.Size = UDim2.new(0, uDim2.X, 0, uDim2.Y)
	imageButton.SizeConstraint = "RelativeYY"
	imageButton.ScaleType = "Slice"
	imageButton.Name = "Icon " .. p2
	imageButton.Visible = true
	imageButton.ImageTransparency = 0
	imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	imageButton.Position = p1
	imageButton.Parent = visGui.Icons
	t1.Physical = imageButton

	return t1
end
function Icon.Move(p3, p4, p5, p6)
	p3.Physical:TweenPosition(p4, p5, "Quart", p6, true)
end
function Icon.Add(p7, p8)
	local poofart: TextLabel = Instance.new("TextLabel")

	poofart.ZIndex = 100
	poofart.TextStrokeColor3 = Color3.new(0, 0, 0)
	poofart.TextStrokeTransparency = 0
	poofart.Font = Enum.Font.SourceSans
	poofart.TextScaled = true
	poofart.Text = "+" .. p8
	poofart.TextColor3 = Color3.fromRGB(255, 255, 255)
	poofart.BackgroundTransparency = 1
	poofart.BorderSizePixel = 0
	poofart.Size = p7.Physical.Size
	poofart.SizeConstraint = "RelativeYY"
	poofart.Name = "poofart"
	poofart.Visible = true
	poofart.AnchorPoint = Vector2.new(0.5, 0.5)
	poofart.Position = p7.Physical.Position
	poofart.Parent = visGui
	spawn(function()
		local poofartPosition: UDim2 = poofart.Position
		local uDim2 = UDim2.new(0, 0, 0, poofart.AbsoluteSize.Y)

		poofart:TweenPosition(poofartPosition - uDim2, "Out", "Quint", 1, true)
		wait(1)

		for i = 0, 1, 0.2 do
			wait(0.1)
			poofart.TextStrokeTransparency = i
			poofart.TextTransparency = i
		end

		poofart:Destroy()
	end)
end
function Icon.Destroy(p9)
	p9.Physical:Destroy()
end

return Icon
