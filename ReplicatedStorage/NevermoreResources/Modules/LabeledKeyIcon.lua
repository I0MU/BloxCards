



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "LabeledKeyIcon"

function module.new(gui, keyIcon, textLabel)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.GUI = gui
	t2.GUI.ClipsDescendants = true
	t2.KeyIcon = keyIcon
	t2.TextLabel = textLabel
	t2:SetLabelVisible(true, 0)
	t2:RescaleLabel()
	t2:AutoResize(0)

	return t2
end
function module.FromKeyIcon(p4, p5)
	local labeledKeyIconFrame: Frame = Instance.new("Frame")

	labeledKeyIconFrame.Size = p4.GUI.Size
	labeledKeyIconFrame.ZIndex = p4.GUI.ZIndex
	labeledKeyIconFrame.BackgroundTransparency = 1
	labeledKeyIconFrame.BorderSizePixel = 0
	labeledKeyIconFrame.Name = "LabeledKeyIconFrame"
	labeledKeyIconFrame.ClipsDescendants = true

	local keyIconLabel: TextLabel = Instance.new("TextLabel", labeledKeyIconFrame)

	keyIconLabel.BackgroundTransparency = 1
	keyIconLabel.BorderSizePixel = 0
	keyIconLabel.TextXAlignment = "Left"
	keyIconLabel.Size = UDim2.new(0, 0, 1, 0)
	keyIconLabel.Position = UDim2.new(0, p4.GUI.Size.X.Offset + 5, 0, 0)
	keyIconLabel.TextColor3 = Color3.new(1, 1, 1)
	keyIconLabel.Font = "SourceSans"
	keyIconLabel.FontSize = "Size10"
	keyIconLabel.Name = "KeyIconLabel"
	keyIconLabel.Text = p5:upper() or "[ label goes here ]"
	p4.GUI.Parent = labeledKeyIconFrame

	return module.new(labeledKeyIconFrame, p4, keyIconLabel)
end
function module.SetFillTransparency(p6, p7, p8)
	p6.KeyIcon:SetFillTransparency(p7, p8)
end
function module.SetOutlineTransparency(p9, p10, p11)
	p9.KeyIcon:SetOutlineTransparency(p10, p11)
end
function module.RescaleIcon(p12)
	p12.KeyIcon:RescaleWidth()

	local y = p12.TextLabel.Position.Y

	p12.TextLabel.Position = UDim2.new(0, p12.KeyIcon.Width + 5, y.Scale, y.Offset)
end
function module.ResizeWidth(p13, width, p15)
	p13.Width = width

	local v21 = p15 or 0.2
	local y = p13.GUI.Size.Y
	local uDim2 = UDim2.new(0, width, y.Scale, y.Offset)

	if uDim2 == p13.GUI.Size then
		return
	end

	if v21 > 0 then
		p13.GUI:TweenSize(uDim2, "Out", "Quad", v21, true)

		return
	end

	p13.GUI.Size = uDim2
end
function module.AutoResize(p16, p17)
	p16:RescaleIcon()

	local v26 = p16.KeyIcon.Width

	if p16.LabelVisible then
		v26 = v26 + (p16.TextLabel.Position - p16.KeyIcon.GUI.Size).X.Offset + p16.TextLabel.Size.X.Offset
	end

	p16:ResizeWidth(v26, p17)
end
function module.SetLabelVisible(p18, labelVisible, p20)
	if labelVisible ~= p18.LabelVisible then
		p18.LabelVisible = labelVisible
		p18:AutoResize(p20)
	end
end
function module.RescaleLabel(p21)
	local y = p21.TextLabel.Size.Y

	p21.TextLabel.Size = UDim2.new(0, p21.TextLabel.TextBounds.X, y.Scale, y.Offset)
end
function module.SetIconText(p22, p23, p24)
	p22.TextLabel.Text = p23
	p22:RescaleLabel()
	p22:AutoResize(p24)
end
function module.Destroy(p25)
	setmetatable(p25, nil)
	p25.KeyIcon:Destroy()
	p25.TextLabel:Destroy()
	p25.GUI:Destroy()
end

return module
