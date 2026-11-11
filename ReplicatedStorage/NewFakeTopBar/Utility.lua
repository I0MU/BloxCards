



local LocalPlayer: Player = game:GetService("Players").LocalPlayer

local module: {[any]: any} = {
	createStagger = function(p1: number, p2, p3)
		local u10: boolean = false
		local u11: boolean = false

		if not p1 or p1 == 0 then
			p1 = 0.01
		end

		local function staggeredCallback(...)
			if u10 then
				u11 = true

				return
			end

			local v78 = table.pack(...)

			u10 = true
			u11 = false
			task.spawn(function()
				if p3 then
					task.wait(p1)
				end

				p2(table.unpack(v78))
			end)
			task.delay(p1, function()
				u10 = false

				if u11 then
					staggeredCallback(table.unpack(v78))
				end
			end)
		end

		return staggeredCallback
	end,
	round = function(p4)
		return (math.floor(p4 + 0.5))
	end,
	reverseTable = function(p5)
		for i = 1, math.floor(#p5 / 2) do
			local n1: number = #p5 - i + 1
			local v17 = p5[i]

			p5[i] = p5[n1]
			p5[n1] = v17
		end
	end
}

function module.copyTable(p6)
	local typeName: string = type(p6)

	assert(typeName == "table", "First argument must be a table")

	local v20 = table.create(#p6)

	for k, v in pairs(p6) do
		if type(v) == "table" then
			v20[k] = module.copyTable(v)
		else
			v20[k] = v
		end
	end

	return v20
end

local t2: {[any]: any} = {
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"0",
	"<",
	">",
	"?",
	"@",
	"{",
	"}",
	"[",
	"]",
	"!",
	"(",
	")",
	"=",
	"+",
	"~",
	"#"
}

function module.generateUID(p7)
	local s1: string = ""
	local v25: {[any]: any} = t2

	for _ = 1, p7 or 8 do
		local randomNumber = math.random(1, #v25)

		s1 ..= v25[randomNumber]
	end

	return s1
end

local t3: {[any]: any} = {}

function module.setVisible(p8, p9, p10)
	local t4 = t3[p8]

	if not t4 then
		t4 = {}
		t3[p8] = t4
		p8.Destroying:Once(function()
			t3[p8] = nil
		end)
	end

	if not p9 then
		t4[p10] = true
	else
		t4[p10] = nil
	end

	local v32 = p9

	if p9 then
		for _, _ in pairs(t4) do
			v32 = false

			break
		end
	end

	p8.Visible = v32
end
function module.formatStateName(p11)
	local stringUpper = string.upper
	local v37 = string.sub(p11, 1, 1)
	local v38 = stringUpper(v37)
	local stringLower = string.lower
	local v40 = string.sub(p11, 2)

	v37 = stringLower(v40)

	return v38 .. v37
end
function module.localPlayerRespawned(p12)
	LocalPlayer.CharacterRemoving:Connect(p12)
end
function module.getClippedContainer(parent)
	local clippedContainer = parent:FindFirstChild("ClippedContainer")

	if not clippedContainer then
		clippedContainer = Instance.new("Folder")
		clippedContainer.Name = "ClippedContainer"
		clippedContainer.Parent = parent
	end

	return clippedContainer
end

local janitor = require(script.Parent.Packages.Janitor)
local guiService: GuiService = game:GetService("GuiService")

function module.clipOutside(p14, p15)
	local v46 = p14.janitor:add(janitor.new())

	p15.Destroying:Once(function()
		v46:Destroy()
	end)
	p14.janitor:add(p15)

	local parent = p15.Parent
	local v48 = v46:add(Instance.new("Frame"))

	v48:SetAttribute("IsAClippedClone", true)
	v48.Name = p15.Name
	v48.AnchorPoint = p15.AnchorPoint
	v48.Size = p15.Size
	v48.Position = p15.Position
	v48.BackgroundTransparency = 1
	v48.LayoutOrder = p15.LayoutOrder
	v48.Parent = parent

	local originalInstance: ObjectValue = Instance.new("ObjectValue")

	originalInstance.Name = "OriginalInstance"
	originalInstance.Value = p15
	originalInstance.Parent = v48

	local clone: Instance = originalInstance:Clone()

	p15:SetAttribute("HasAClippedClone", true)
	clone.Name = "ClippedClone"
	clone.Value = v48
	clone.Parent = p15

	local u51 = nil

	local function updateScreenGui()
		local v79 = parent:FindFirstAncestorWhichIsA("ScreenGui")

		u51 = if string.match(v79.Name, "Clipped") then v79 else v79.Parent[v79.Name .. "Clipped"]
		p15.AnchorPoint = Vector2.new(0, 0)
		p15.Parent = module.getClippedContainer(u51)
	end

	v46:add(p14.alignmentChanged:Connect(updateScreenGui))
	updateScreenGui()

	for _, v in pairs(p15:GetChildren()) do
		if v:IsA("UIAspectRatioConstraint") then
			local clone2 = v:Clone()

			clone2.Parent = v48
		end
	end

	local widget = p14.widget
	local u57 = false
	local ignoreVisibilityUpdater = p15:GetAttribute("IgnoreVisibilityUpdater")
	local v59 = widget:GetPropertyChangedSignal("Visible")

	v46:add(v59:Connect(function()
		if ignoreVisibilityUpdater then
			return
		end

		local v80 = widget.Visible

		if u57 then
			v80 = false
		end

		module.setVisible(p15, v80, "ClipHandler")
	end))

	local u60 = nil
	local iconModule = require(p14.iconModule)

	local function checkIfOutsideParentXBounds()
		task.defer(function()
			local v108 = nil
			local uid = p14.UID
			local v110 = uid

			if p15:GetAttribute("ClipToJoinedParent") then
				for _ = 1, 10 do
					local v112 = iconModule.getIconByUID(v110)

					if not v112 then
						break
					end

					local joinedFrame = v112.joinedFrame

					v110 = v112.parentIconUID

					if not joinedFrame then
						break
					end

					v108 = joinedFrame
				end
			end

			if not v108 then
				u57 = false

				if ignoreVisibilityUpdater then
					return
				end

				local v114 = widget.Visible

				if u57 then
					v114 = false
				end

				module.setVisible(p15, v114, "ClipHandler")

				return
			end

			local absolutePosition = v108.AbsolutePosition
			local absoluteSize = v108.AbsoluteSize
			local n1 = p15.AbsolutePosition + p15.AbsoluteSize / 2

			n1 = n1.X < absolutePosition.X or n1.X > absolutePosition.X + absoluteSize.X or n1.Y < absolutePosition.Y or n1.Y > absolutePosition.Y + absoluteSize.Y

			if n1 ~= u57 then
				u57 = n1

				if not ignoreVisibilityUpdater then
					local v118 = widget.Visible

					if u57 then
						v118 = false
					end

					module.setVisible(p15, v118, "ClipHandler")
				end
			end

			if v108:IsA("ScrollingFrame") and v108 ~= u60 then
				u60 = v108

				local connection = v108:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					checkIfOutsideParentXBounds()
				end)

				v46:add(connection, "Disconnect", "TrackUtilityScroller-" .. uid)
			end
		end)
	end

	local CurrentCamera: Camera = workspace.CurrentCamera
	local v64 = p15:GetAttribute("AdditionalOffsetX") or 0

	local function trackProperty(p16)
		local s1: string = "Absolute" .. p16

		local function updateProperty()
			local v120 = v48[s1]
			local v121 = UDim2.fromOffset(v120.X, v120.Y)

			if p16 == "Position" then
				local n1 = CurrentCamera.ViewportSize.X - p15.AbsoluteSize.X - 4
				local v123 = v121.X.Offset

				if v123 < 4 then
					v123 = 4
				elseif n1 < v123 then
					v123 = n1
				end

				local v124 = UDim2.fromOffset(v123, v121.Y.Offset)
				local guiServiceTopbarInset: Rect = guiService.TopbarInset
				local x = u51.AbsolutePosition.X
				local n2 = x - guiServiceTopbarInset.Min.X
				local v128 = UDim2.fromOffset(-((if p14.isOldTopbar then x else workspace.CurrentCamera.ViewportSize.X - u51.AbsoluteSize.X - 0) - v64), guiServiceTopbarInset.Height)

				v121 = v124 + v128
				task.defer(function()
					local v129 = nil
					local uid = p14.UID
					local v131 = uid

					if p15:GetAttribute("ClipToJoinedParent") then
						for _ = 1, 10 do
							local v133 = iconModule.getIconByUID(v131)

							if not v133 then
								break
							end

							local joinedFrame = v133.joinedFrame

							v131 = v133.parentIconUID

							if not joinedFrame then
								break
							end

							v129 = joinedFrame
						end
					end

					if not v129 then
						u57 = false

						if ignoreVisibilityUpdater then
							return
						end

						local v135 = widget.Visible

						if u57 then
							v135 = false
						end

						module.setVisible(p15, v135, "ClipHandler")

						return
					end

					local absolutePosition = v129.AbsolutePosition
					local absoluteSize = v129.AbsoluteSize
					local n1 = p15.AbsolutePosition + p15.AbsoluteSize / 2

					n1 = n1.X < absolutePosition.X or n1.X > absolutePosition.X + absoluteSize.X or n1.Y < absolutePosition.Y or n1.Y > absolutePosition.Y + absoluteSize.Y

					if n1 ~= u57 then
						u57 = n1

						if not ignoreVisibilityUpdater then
							local v139 = widget.Visible

							if u57 then
								v139 = false
							end

							module.setVisible(p15, v139, "ClipHandler")
						end
					end

					if v129:IsA("ScrollingFrame") and v129 ~= u60 then
						u60 = v129

						local connection = v129:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
							checkIfOutsideParentXBounds()
						end)

						v46:add(connection, "Disconnect", "TrackUtilityScroller-" .. uid)
					end
				end)
			end

			p15[p16] = v121
		end

		local v84 = module.createStagger(0.01, updateProperty)
		local v85 = v48:GetPropertyChangedSignal(s1)

		v46:add(v85:Connect(v84))
		v84 = module.createStagger(0.5, updateProperty, true)
		v85 = v48:GetPropertyChangedSignal(s1)
		v46:add(v85:Connect(v84))
	end

	task.delay(0.1, checkIfOutsideParentXBounds)
	task.defer(function()
		local v86 = nil
		local uid = p14.UID
		local v88 = uid

		if p15:GetAttribute("ClipToJoinedParent") then
			for _ = 1, 10 do
				local v90 = iconModule.getIconByUID(v88)

				if not v90 then
					break
				end

				local joinedFrame = v90.joinedFrame

				v88 = v90.parentIconUID

				if not joinedFrame then
					break
				end

				v86 = joinedFrame
			end
		end

		if not v86 then
			u57 = false

			if ignoreVisibilityUpdater then
				return
			end

			local v92 = widget.Visible

			if u57 then
				v92 = false
			end

			module.setVisible(p15, v92, "ClipHandler")

			return
		end

		local absolutePosition = v86.AbsolutePosition
		local absoluteSize = v86.AbsoluteSize
		local n1 = p15.AbsolutePosition + p15.AbsoluteSize / 2

		n1 = n1.X < absolutePosition.X or n1.X > absolutePosition.X + absoluteSize.X or n1.Y < absolutePosition.Y or n1.Y > absolutePosition.Y + absoluteSize.Y

		if n1 ~= u57 then
			u57 = n1

			if not ignoreVisibilityUpdater then
				local v96 = widget.Visible

				if u57 then
					v96 = false
				end

				module.setVisible(p15, v96, "ClipHandler")
			end
		end

		if v86:IsA("ScrollingFrame") and v86 ~= u60 then
			u60 = v86

			local connection = v86:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				checkIfOutsideParentXBounds()
			end)

			v46:add(connection, "Disconnect", "TrackUtilityScroller-" .. uid)
		end
	end)

	if not ignoreVisibilityUpdater then
		local v66 = widget.Visible

		if u57 then
			v66 = false
		end

		module.setVisible(p15, v66, "ClipHandler")
	end

	trackProperty("Position")

	local v67 = p15:GetPropertyChangedSignal("Visible")

	v46:add(v67:Connect(function()
	end))

	if p15:GetAttribute("TrackCloneSize") then
		trackProperty("Size")
	else
		local v68 = p15:GetPropertyChangedSignal("AbsoluteSize")

		v46:add(v68:Connect(function()
			local absoluteSize = p15.AbsoluteSize

			v48.Size = UDim2.fromOffset(absoluteSize.X, absoluteSize.Y)
		end))
	end

	return v48
end
function module.joinFeature(p17, p18, p19, p20)
	local joinJanitor = p17.joinJanitor

	joinJanitor:clean()

	if not p20 then
		p17:leave()

		return
	end

	p17.parentIconUID = p18.UID
	p17.joinedFrame = p20
	joinJanitor:add(p18.alignmentChanged:Connect(function()
		local v99 = p18.alignment

		if v99 == "Center" then
			v99 = "Left"
		end

		p17:setAlignment(v99, true)
	end))

	local v74 = p18.alignment

	if v74 == "Center" then
		v74 = "Left"
	end

	p17:setAlignment(v74, true)
	p17:modifyTheme({ "IconButton", "BackgroundTransparency", 1 }, "JoinModification")
	p17:modifyTheme({ "ClickRegion", "Active", false }, "JoinModification")

	if p18.childModifications then
		task.defer(function()
			p17:modifyTheme(p18.childModifications, p18.childModificationsUID)
		end)
	end

	local v75 = p17:getInstance("ClickRegion")

	local function makeSelectable()
		v75.Selectable = p18.isSelected
	end

	joinJanitor:add(p18.toggled:Connect(makeSelectable))
	task.defer(makeSelectable)
	joinJanitor:add(function()
		v75.Selectable = true
	end)

	local uid = p17.UID

	table.insert(p19, uid)
	p18:autoDeselect(false)
	p18.childIconsDict[uid] = true

	if not p18.isEnabled then
		p18:setEnabled(true)
	end

	p17.joinedParent:Fire(p18)
	joinJanitor:add(function()
		if not p17.joinedFrame then
			return
		end

		for k, v in pairs(p19) do
			if v == uid then
				table.remove(p19, k)

				break
			end
		end

		local v102 = require(p17.iconModule).getIconByUID(p17.parentIconUID)

		if not v102 then
			return
		end

		p17:setAlignment(p17.originalAlignment)
		p17.parentIconUID = false
		p17.joinedFrame = false
		p17:setBehaviour("IconButton", "BackgroundTransparency", nil, true)
		p17:removeModification("JoinModification")

		local u103: boolean = true
		local childIconsDict = v102.childIconsDict

		childIconsDict[uid] = nil

		for _, _ in pairs(childIconsDict) do
			u103 = false

			break
		end

		if u103 and not v102.isAnOverflow then
			v102:setEnabled(false)
		end

		local v107 = p18.alignment

		if v107 == "Center" then
			v107 = "Left"
		end

		p17:setAlignment(v107, true)
	end)
end

return module
