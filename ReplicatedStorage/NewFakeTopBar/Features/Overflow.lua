



local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local u3 = nil
local CurrentCamera: Camera = workspace.CurrentCamera
local t3: {[any]: any} = {}
local t4: {[any]: any} = {}
local utility = require(script.Parent.Parent.Utility)
local u8 = nil
local module: {[any]: any} = {}

function module.start(p1)
	u8 = p1
	u3 = u8.iconsDictionary

	local v11 = nil

	for _, v in pairs(u8.container) do
		if v11 == nil and v.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
			v11 = v
		end

		for _, iterValue in pairs(v.Holders:GetChildren()) do
			if iterValue:GetAttribute("IsAHolder") then
				t1[iterValue.Name] = iterValue
			end
		end
	end

	local u16: boolean = false

	local v17 = utility.createStagger(0.1, function(p2)
		if not u16 then
			return
		end

		if not p2 then
			module.updateAvailableIcons("Center")
		end

		module.updateBoundary("Left")
		module.updateBoundary("Right")
	end)

	task.delay(1, function()
		u16 = true
		v17()
	end)
	u8.iconAdded:Connect(v17)
	u8.iconRemoved:Connect(v17)
	u8.iconChanged:Connect(v17)
	CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		v17(true)
	end)
	v11:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		v17(true)
	end)
end
function module.getWidth(p3, _)
	local widget = p3.widget

	return widget:GetAttribute("TargetWidth") or widget.AbsoluteSize.X
end
function module.getAvailableIcons(p5)
	local v22 = t2[p5]

	if not v22 then
		v22 = module.updateAvailableIcons(p5)
	end

	return v22
end
function module.updateAvailableIcons(p6)
	local n1: number = 0
	local uiListLayout = t1[p6].UIListLayout
	local t6: {[any]: any} = {}

	for _, v in pairs(u3) do
		local vParentIconUID = v.parentIconUID

		if (not vParentIconUID or t4[vParentIconUID]) and p6 == v.alignment and not t4[v.UID] then
			table.insert(t6, v)
			n1 += 1
		end
	end

	if n1 <= 0 then
		return {}
	end

	table.sort(t6, function(p7, p8)
		local layoutOrder = p7.widget.LayoutOrder
		local v89 = p8.widget.LayoutOrder
		local parentIconUID = p7.parentIconUID
		local v91 = p8.parentIconUID

		if parentIconUID == v91 then
			if layoutOrder < v89 then
				return true
			end

			if layoutOrder > v89 then
				return false
			end

			return p7.widget.AbsolutePosition.X < p8.widget.AbsolutePosition.X
		end

		if v91 then
			return false
		end

		if parentIconUID then
			return true
		end
	end)
	t2[p6] = t6

	return t6
end
function module.getRealXPositions(p9, p10)
	local u32: boolean = p9 == "Left"
	local v33 = t1[p9]
	local x = v33.AbsolutePosition.X
	local offset = v33.UIListLayout.Padding.Offset
	local v36 = u32 and x or x + v33.AbsoluteSize.X
	local t7: {[any]: any} = {}

	if u32 then
		utility.reverseTable(p10)
	end

	for i = #p10, 1, -1 do
		local v39 = p10[i]
		local v40 = module.getWidth(v39)

		if not u32 then
			v36 -= v40
		end

		t7[v39.UID] = v36

		if u32 then
			v36 += v40
		end

		v36 += u32 and offset or -offset
	end

	return t7
end
function module.updateBoundary(p11)
	local v42 = t1[p11]
	local uiListLayout = v42.UIListLayout
	local x = v42.AbsolutePosition.X
	local v45 = v42.AbsoluteSize.X
	local offset = uiListLayout.Padding.Offset
	local v47 = uiListLayout.Padding.Offset
	local v48 = module.updateAvailableIcons(p11)
	local n1 = 0
	local n2 = 0

	for _, v in pairs(v48) do
		local v53 = module.getWidth(v)

		n1 += v53 + v47
		n2 += 1
	end

	if n2 <= 0 then
		return
	end

	n1 = p11 == "Left"

	local u54: boolean = not n1
	local v55 = t3[p11]

	if not v55 and p11 ~= "Central" and #v48 > 0 then
		v55 = u8.new()
		v55:setImage(6069276526, "Deselected")
		v55:setName("Overflow" .. p11)
		v55:setOrder(if n1 then -9999999 else 9999999)
		v55:setAlignment(p11)
		v55:autoDeselect(false)
		v55.isAnOverflow = true
		v55:select("OverflowStart", v55)
		v55:setEnabled(false)
		t3[p11] = v55
		t4[v55.UID] = true
	end

	n2 = if p11 == "Left" then "Right" else "Left"

	local v56 = module.updateAvailableIcons(n2)
	local v57 = n1 and v56[1] or u54 and v56[#v56]
	local v58 = t3[n2]
	local n3 = n1 and x + v45 or x

	if v57 then
		local widget = v57.widget
		local v61 = module.getRealXPositions(n2, v56)[v57.UID]
		local v62 = module.getWidth(v57)

		n3 = n1 and v61 - offset or v61 + v62 + offset
	end

	v57 = module.getAvailableIcons("Center")
	n2 = v57[if n1 then 1 else #v57]

	if n2 and not n2.hasRelocatedInOverflow then
		local v63 = n1 and v48[#v48] or u54 and v48[1]
		local v64 = n2.widget.AbsolutePosition.X
		local v65 = v63.widget.AbsolutePosition.X
		local v66 = module.getWidth(v63)

		v63 = n1 and v64 - offset

		if not v63 then
			local v67 = module.getWidth(n2)

			v63 = v64 + v67 + offset
		end

		local n4 = n1 and v65 + v66 or v65

		if not n1 then
			if n4 < v63 then
				n2:align("Right")
				n2.hasRelocatedInOverflow = true
			end
		elseif n4 > v63 then
			n2:align("Left")
			n2.hasRelocatedInOverflow = true
		end
	end

	if v55 then
		local v69 = v55:getInstance("Menu")
		local v70 = v45

		if v69 and v58 then
			local v71 = v58.widget.AbsolutePosition.X
			local v72 = module.getWidth(v58)
			local v73 = v58:getInstance("Menu")
			local n5 = x + v45 / 2
			local n6 = n1 and n5 - offset / 2 or n5 + offset / 2

			if v69.AbsoluteCanvasSize.X >= v73.AbsoluteCanvasSize.X then
				n6 = n1 and v71 - offset or v71 + v72 + offset
			end

			v70 = n1 and n6 - x or x + v45 - n6
		end

		local v76 = v69

		if v76 then
			v76 = v69:GetAttribute("MaxWidth")
		end

		local v77 = utility.round(v70)

		if v69 and v76 ~= v77 then
			v69:SetAttribute("MaxWidth", v77)
		end
	end

	v58 = false

	local v78 = module.getRealXPositions(p11, v48)

	for i = #v48, 1, -1 do
		local v80 = v48[i]
		local v81 = module.getWidth(v80)
		local v82 = v78[v80.UID]

		if n1 and n3 <= v82 + v81 or u54 and n3 >= v82 then
			v58 = true
		end
	end

	for i = #v48, 1, -1 do
		local v84 = v48[i]

		if not t4[v84.UID] then
			if v58 and not v84.parentIconUID then
				v84:joinMenu(v55)
			elseif not v58 and v84.parentIconUID then
				v84:leave()
			end
		end
	end

	if v58 ~= v55.isEnabled then
		v55:setEnabled(v58)
	end

	if v55.isEnabled and not v55.overflowAlreadyOpened then
		v55.overflowAlreadyOpened = true
		v55:select()
	end
end

return module
