



local module: {[any]: any} = { ClassName = "KeyIconBar" }

module.__index = module

function module.new(gui)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.GUI = gui
	t2.KeyIcons = {}

	return t2
end
function module.HasIcon(p2, p3)
	return p2:GetIconIndex(p3) ~= nil
end
function module.GetIconIndex(p4, p5)
	for k, v in pairs(p4.KeyIcons) do
		if v == p5 then
			return k
		end
	end

	return nil
end
function module.GetHeight(p6)
	return p6.GUI.Size.Y.Offset
end
function module.AddIcon(p7, p8, p9)
	assert(p8, "Must send new icon")

	local v14 = p7:HasIcon(p8)

	assert(not v14, "Icon is already in the KeyIconBar")
	p8.GUI.Parent = p7.GUI
	p8.GUI.Visible = true
	p8:RescaleLabel()
	p8:ResizeWidth(0, 0)

	local n1 = 0

	for _, v in pairs(p7.KeyIcons) do
		n1 += v.Width
	end

	p8.GUI.Position = UDim2.new(0, n1, 0, 0)
	p7.KeyIcons[#p7.KeyIcons + 1] = p8
	p7:UpdatePositions(p9)
end
function module.RemoveIcon(p10, p11, p12)
	local v21 = p10:GetIconIndex(p11)

	if not v21 then
		local text: string = tostring(p11)

		v21 = error("Icon '" .. text .. "' does not exist in the bar")
	end

	p11:ResizeWidth(0, p12)

	local gui = p11.GUI
	local GUIPosition = p11.GUI.Position
	local uDim2 = UDim2.new(0, p11.Width, 0, 0)

	gui:TweenPosition(GUIPosition + uDim2, "Out", "Quad", p12 or 0.2, true)
	table.remove(p10.KeyIcons, v21)
	p10:UpdatePositions(p12)
end
function module.UpdatePositions(p13, p14)
	local v28 = p14 or 0.2
	local n1 = 0

	for _, v in pairs(p13.KeyIcons) do
		v:AutoResize(v28)

		local uDim2 = UDim2.new(0, n1, 0, 0)
		local v33 = v.Width or error("Element has no width")

		n1 = n1 + v33 + 5

		if uDim2 ~= v.GUI.Position then
			if v28 > 0 then
				v.GUI:TweenPosition(uDim2, "Out", "Quad", v28, true)
			else
				v.GUI.Position = uDim2
			end
		end
	end
end

return module
