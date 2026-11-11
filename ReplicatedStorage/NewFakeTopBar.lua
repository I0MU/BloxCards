



game:GetService("LocalizationService")

local userInputService: UserInputService = game:GetService("UserInputService")

game:GetService("RunService")
game:GetService("TextService")

local starterGui: StarterGui = game:GetService("StarterGui")
local guiService: GuiService = game:GetService("GuiService")
local players: Players = game:GetService("Players")
local v5 = script
local reference = require(v5.Reference)
local v7 = reference.getObject()
local v8 = v7 and v7.Value

if v8 and v8 ~= v5 then
	return require(v8)
end

if not v7 then
	reference.addToReplicatedStorage()
end

local goodSignal = require(v5.Packages.GoodSignal)
local janitor = require(v5.Packages.Janitor)
local utility = require(v5.Utility)

require(v5.Attribute)

local themes = require(v5.Features.Themes)
local gamepad = require(v5.Features.Gamepad)
local overflow = require(v5.Features.Overflow)
local module: {[any]: any} = {}

module.__index = module

local v16 = v5.Features.Themes
local playerGui: Instance = players.LocalPlayer:WaitForChild("PlayerGui")
local t2: {[any]: any} = {}
local v19 = goodSignal.new()
local elements = v5.Elements
local n1: number = 0

if guiService.TopbarInset.Height == 0 then
	guiService:GetPropertyChangedSignal("TopbarInset"):Wait()
end

module.baseDisplayOrderChanged = goodSignal.new()
module.baseDisplayOrder = 10
module.baseTheme = require(v16.Default)
module.isOldTopbar = guiService.TopbarInset.Height == 36
module.iconsDictionary = t2
module.container = require(elements.Container)(module)
module.topbarEnabled = true
module.iconAdded = goodSignal.new()
module.iconRemoved = goodSignal.new()
module.iconChanged = goodSignal.new()

function module.getIcons()
	return module.iconsDictionary
end
function module.getIconByUID(p1)
	local v25 = module.iconsDictionary[p1]

	if v25 then
		return v25
	end
end
function module.getIcon(p2)
	local v27 = module.getIconByUID(p2)

	if v27 then
		return v27
	end

	for _, v in pairs(t2) do
		if p2 == v.name then
			return v
		end
	end
end
function module.setTopbarEnabled(p3, p4)
	if typeof(p3) ~= "boolean" then
		p3 = module.topbarEnabled
	end

	if not p4 then
		module.topbarEnabled = p3
	end

	for _, v in pairs(module.container) do
		v.Enabled = p3
	end
end
function module.modifyBaseTheme(p5)
	local v35 = themes.getModifications(p5)

	for _, v in pairs(v35) do
		for _, iterValue in pairs(module.baseTheme) do
			themes.merge(iterValue, v)
		end
	end

	for _, v in pairs(t2) do
		v:setTheme(module.baseTheme)
	end
end
function module.setDisplayOrder(p6)
	module.baseDisplayOrder = p6
	module.baseDisplayOrderChanged:Fire(p6)
end

task.defer(gamepad.start, module)
task.defer(overflow.start, module)

for _, v in pairs(module.container) do
	v.Parent = playerGui
end

if module.isOldTopbar then
	module.modifyBaseTheme(require(v16.Classic))
end

function module.new()
	local t3: {[any]: any} = {}

	setmetatable(t3, module)

	local v44 = janitor.new()

	t3.janitor = v44
	t3.themesJanitor = v44:add(janitor.new())
	t3.singleClickJanitor = v44:add(janitor.new())
	t3.captionJanitor = v44:add(janitor.new())
	t3.joinJanitor = v44:add(janitor.new())
	t3.menuJanitor = v44:add(janitor.new())
	t3.dropdownJanitor = v44:add(janitor.new())

	local uid = utility.generateUID()

	t2[uid] = t3
	v44:add(function()
		t2[uid] = nil
	end)
	t3.selected = v44:add(goodSignal.new())
	t3.deselected = v44:add(goodSignal.new())
	t3.toggled = v44:add(goodSignal.new())
	t3.viewingStarted = v44:add(goodSignal.new())
	t3.viewingEnded = v44:add(goodSignal.new())
	t3.stateChanged = v44:add(goodSignal.new())
	t3.notified = v44:add(goodSignal.new())
	t3.noticeStarted = v44:add(goodSignal.new())
	t3.noticeChanged = v44:add(goodSignal.new())
	t3.endNotices = v44:add(goodSignal.new())
	t3.toggleKeyAdded = v44:add(goodSignal.new())
	t3.fakeToggleKeyChanged = v44:add(goodSignal.new())
	t3.alignmentChanged = v44:add(goodSignal.new())
	t3.updateSize = v44:add(goodSignal.new())
	t3.resizingComplete = v44:add(goodSignal.new())
	t3.joinedParent = v44:add(goodSignal.new())
	t3.menuSet = v44:add(goodSignal.new())
	t3.dropdownSet = v44:add(goodSignal.new())
	t3.updateMenu = v44:add(goodSignal.new())
	t3.startMenuUpdate = v44:add(goodSignal.new())
	t3.childThemeModified = v44:add(goodSignal.new())
	t3.indicatorSet = v44:add(goodSignal.new())
	t3.dropdownChildAdded = v44:add(goodSignal.new())
	t3.menuChildAdded = v44:add(goodSignal.new())
	t3.iconModule = v5
	t3.UID = uid
	t3.isEnabled = true
	t3.isSelected = false
	t3.isViewing = false
	t3.joinedFrame = false
	t3.parentIconUID = false
	t3.deselectWhenOtherIconSelected = true
	t3.totalNotices = 0
	t3.activeState = "Deselected"
	t3.alignment = ""
	t3.originalAlignment = ""
	t3.appliedTheme = {}
	t3.appearance = {}
	t3.cachedInstances = {}
	t3.cachedNamesToInstances = {}
	t3.cachedCollectives = {}
	t3.bindedToggleKeys = {}
	t3.customBehaviours = {}
	t3.toggleItems = {}
	t3.bindedEvents = {}
	t3.notices = {}
	t3.menuIcons = {}
	t3.dropdownIcons = {}
	t3.childIconsDict = {}
	t3.isOldTopbar = module.isOldTopbar
	t3.creationTime = os.clock()

	local widget = require(elements.Widget)

	t3.widget = v44:add(widget(t3, module))
	t3:setAlignment()
	n1 += 1
	t3:setOrder(n1)
	t3:setTheme(module.baseTheme)

	local v47 = t3:getInstance("ClickRegion")

	local function handleToggle()
		if t3.locked then
			return
		end

		if t3.isSelected then
			t3:deselect("User", t3)

			return
		end

		t3:select("User", t3)
	end

	local u49: boolean = false
	local u50: boolean = false

	v47.MouseButton1Click:Connect(function()
		if u49 then
			return
		end

		u50 = true
		task.delay(0.01, function()
			u50 = false
		end)

		if t3.locked then
			return
		end

		if t3.isSelected then
			t3:deselect("User", t3)

			return
		end

		t3:select("User", t3)
	end)
	v47.TouchTap:Connect(function()
		if u50 then
			return
		end

		u49 = true
		task.delay(0.01, function()
			u49 = false
		end)

		if t3.locked then
			return
		end

		if t3.isSelected then
			t3:deselect("User", t3)

			return
		end

		t3:select("User", t3)
	end)
	v44:add(userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
		if t3.locked then
		elseif t3.bindedToggleKeys[input.KeyCode] and not gameProcessedEvent then
			if t3.locked then
				return
			end

			if t3.isSelected then
				t3:deselect("User", t3)

				return
			end

			t3:select("User", t3)

			return
		end
	end))

	local function viewingEnded()
		if t3.locked then
			return
		end

		t3.isViewing = false
		t3.viewingEnded:Fire(true)
		t3:setState(nil, "User", t3)
	end

	t3.joinedParent:Connect(function()
		if not t3.isViewing then
			return
		end

		if t3.locked then
			return
		end

		t3.isViewing = false
		t3.viewingEnded:Fire(true)
		t3:setState(nil, "User", t3)
	end)
	v47.MouseEnter:Connect(function()
		local u258: boolean = not userInputService.KeyboardEnabled

		if t3.locked then
			return
		end

		t3.isViewing = true
		t3.viewingStarted:Fire(true)

		if not u258 then
			t3:setState("Viewing", "User", t3)
		end
	end)

	local n2: number = 0

	v44:add(userInputService.TouchEnded:Connect(viewingEnded))
	v47.MouseLeave:Connect(viewingEnded)
	v47.SelectionGained:Connect(function(p9)
		if t3.locked then
			return
		end

		t3.isViewing = true
		t3.viewingStarted:Fire(true)

		if not p9 then
			t3:setState("Viewing", "User", t3)
		end
	end)
	v47.SelectionLost:Connect(viewingEnded)
	v47.MouseButton1Down:Connect(function()
		if not t3.locked and userInputService.TouchEnabled then
			n2 += 1

			local v260: number = n2

			task.delay(0.2, function()
				if v260 ~= n2 then
					return
				end

				if t3.locked then
					return
				end

				t3.isViewing = true
				t3.viewingStarted:Fire(true)
				t3:setState("Viewing", "User", t3)
			end)
		end
	end)
	v47.MouseButton1Up:Connect(function()
		n2 += 1
	end)

	local v53 = t3:getInstance("IconOverlay")

	t3.viewingStarted:Connect(function()
		v53.Visible = not t3.overlayDisabled
	end)
	t3.viewingEnded:Connect(function()
		v53.Visible = false
	end)
	v44:add(v19:Connect(function(p10)
		if p10 ~= t3 and t3.deselectWhenOtherIconSelected and p10.deselectWhenOtherIconSelected then
			t3:deselect("AutoDeselect", p10)
		end
	end))

	local v54 = debug.info(2, "s")

	v54 = string.split(v54, ".")
	v44 = game

	local v55 = nil

	for _, v in pairs(v54) do
		v44 = v44:FindFirstChild(v)

		if not v44 then
			break
		end

		if v44:IsA("ScreenGui") then
			v55 = v44
		end
	end

	if v44 and v55 and v55.ResetOnSpawn == true then
		utility.localPlayerRespawned(function()
			t3:destroy()
		end)
	end

	t3:getInstance("NoticeLabel")
	t3.toggled:Connect(function(p11)
		t3.noticeChanged:Fire(t3.totalNotices)

		for k, _ in pairs(t3.childIconsDict) do
			local v265 = module.getIconByUID(k)

			v265.noticeChanged:Fire(v265.totalNotices)

			if not p11 and v265.isSelected then
				for _, _ in pairs(v265.childIconsDict) do
					v265:deselect("HideParentFeature", t3)
				end
			end
		end
	end)
	t3.selected:Connect(function()
		if #t3.dropdownIcons > 0 then
			if starterGui:GetCore("ChatActive") and t3.alignment ~= "Right" then
				t3.chatWasPreviouslyActive = true
				starterGui:SetCore("ChatActive", false)
			end

			if starterGui:GetCoreGuiEnabled("PlayerList") and t3.alignment ~= "Left" then
				t3.playerlistWasPreviouslyActive = true
				starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			end
		end
	end)
	t3.deselected:Connect(function()
		if t3.chatWasPreviouslyActive then
			t3.chatWasPreviouslyActive = nil
			starterGui:SetCore("ChatActive", true)
		end

		if t3.playerlistWasPreviouslyActive then
			t3.playerlistWasPreviouslyActive = nil
			starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end
	end)
	task.delay(0.1, function()
		if t3.activeState == "Deselected" then
			t3.stateChanged:Fire("Deselected")
			t3:refresh()
		end
	end)
	module.iconAdded:Fire(t3)

	return t3
end
function module.setName(p12, name)
	p12.widget.Name = name
	p12.name = name

	return p12
end
function module.setState(p14, p15: string, p16, p17)
	if not p15 then
		p15 = if p14.isSelected then "Selected" else "Deselected"
	end

	local v64 = utility.formatStateName(p15)

	if p14.activeState == v64 then
		return
	end

	local isSelected = p14.isSelected

	p14.activeState = v64

	if v64 == "Deselected" then
		p14.isSelected = false

		if isSelected then
			p14.toggled:Fire(false, p16, p17)
			p14.deselected:Fire(p16, p17)
		end

		p14:_setToggleItemsVisible(false, p16, p17)
	elseif v64 == "Selected" then
		p14.isSelected = true

		if not isSelected then
			p14.toggled:Fire(true, p16, p17)
			p14.selected:Fire(p16, p17)
			v19:Fire(p14, p16, p17)
		end

		p14:_setToggleItemsVisible(true, p16, p17)
	end

	p14.stateChanged:Fire(v64, p16, p17)
end
function module.getInstance(p18, p19)
	local v68 = p18.cachedNamesToInstances[p19]

	if v68 then
		return v68
	end

	local function cacheInstance(p20, p21)
		if not p18.cachedInstances[p21] then
			local collective = p21:GetAttribute("Collective")
			local v271 = collective and p18.cachedCollectives[collective]

			if v271 then
				table.insert(v271, p21)
			end

			p18.cachedNamesToInstances[p20] = p21
			p18.cachedInstances[p21] = true
			p21.Destroying:Once(function()
				p18.cachedNamesToInstances[p20] = nil
				p18.cachedInstances[p21] = nil
			end)
		end
	end

	local widget = p18.widget

	cacheInstance("Widget", widget)

	if p19 == "Widget" then
		return widget
	end

	local u71 = nil

	local function scanChildren(p22)
		for _, v in pairs(p22:GetChildren()) do
			local widgetUID = v:GetAttribute("WidgetUID")

			if not widgetUID or widgetUID == p18.UID then
				local v276 = themes.getRealInstance(v)

				if v276 then
					v = v276
				end

				scanChildren(v)

				if v:IsA("GuiBase") or v:IsA("UIBase") or v:IsA("ValueBase") then
					local vName = v.Name

					cacheInstance(vName, v)

					if vName == p19 then
						u71 = v
					end
				end
			end
		end
	end

	scanChildren(widget)

	return u71
end
function module.getCollective(p23, p24)
	local v75 = p23.cachedCollectives[p24]

	if v75 then
		return v75
	end

	v75 = {}

	for k, _ in pairs(p23.cachedInstances) do
		local collective = k:GetAttribute("Collective")

		if p24 == collective then
			table.insert(v75, k)
		end
	end

	p23.cachedCollectives[p24] = v75

	return v75
end
function module.getInstanceOrCollective(p25, p26)
	local t4 = {}
	local v82 = p25:getInstance(p26)

	if v82 then
		table.insert(t4, v82)
	end

	if #t4 == 0 then
		t4 = p25:getCollective(p26)
	end

	return t4
end
function module.getStateGroup(p27, p28)
	local v85 = p28 or p27.activeState
	local t5 = p27.appearance[v85]

	if not t5 then
		t5 = {}
		p27.appearance[v85] = t5
	end

	return t5
end
function module.refreshAppearance(p29, p30, p31)
	themes.refresh(p29, p30, p31)

	return p29
end
function module.refresh(p32)
	p32:refreshAppearance(p32.widget)
	p32.updateSize:Fire()

	return p32
end
function module.updateParent(p33)
	local v92 = module.getIconByUID(p33.parentIconUID)

	if v92 then
		v92.updateSize:Fire()
	end
end
function module.setBehaviour(p34, p35, p36, p37, p38)
	p34.customBehaviours[p35 .. "-" .. p36] = p37

	if p38 then
		local v98 = p34:getInstanceOrCollective(p35)

		for _, v in pairs(v98) do
			p34:refreshAppearance(v, p36)
		end
	end
end
function module.modifyTheme(p39, p40, p41)
	local v104 = themes.modify(p39, p40, p41)

	return p39, v104
end
function module.modifyChildTheme(p42, p43, p44)
	p42.childModifications = p43
	p42.childModificationsUID = p44

	for k, _ in pairs(p42.childIconsDict) do
		module.getIconByUID(k):modifyTheme(p43, p44)
	end

	p42.childThemeModified:Fire()

	return p42
end
function module.removeModification(p45, p46)
	themes.remove(p45, p46)

	return p45
end
function module.removeModificationWith(p47, p48, p49, p50)
	themes.removeWith(p47, p48, p49, p50)

	return p47
end
function module.setTheme(p51, p52)
	themes.set(p51, p52)

	return p51
end
function module.setEnabled(p53, p54)
	p53.isEnabled = p54
	p53.widget.Visible = p54
	p53:updateParent()

	return p53
end
function module.select(p55, p56, p57)
	p55:setState("Selected", p56, p57)

	return p55
end
function module.deselect(p58, p59, p60)
	p58:setState("Deselected", p59, p60)

	return p58
end
function module.notify(p61, p62, p63)
	if not p61.notice then
		p61.notice = require(elements.Notice)(p61, module)
	end

	p61.noticeStarted:Fire(p62, p63)

	return p61
end
function module.clearNotices(p64)
	p64.endNotices:Fire()

	return p64
end
function module.disableOverlay(p65, p66)
	p65.overlayDisabled = p66

	return p65
end

module.disableStateOverlay = module.disableOverlay

function module.setImage(p67, p68, p69)
	p67:modifyTheme({ "IconImage", "Image", p68, p69 })

	return p67
end
function module.setLabel(p70, p71, p72)
	p70:modifyTheme({ "IconLabel", "Text", p71, p72 })

	return p70
end
function module.setOrder(p73, p74, p75)
	p73:modifyTheme({ "Widget", "LayoutOrder", p74, p75 })

	return p73
end
function module.setCornerRadius(p76, p77, p78)
	p76:modifyTheme({ "IconCorners", "CornerRadius", p77, p78 })

	return p76
end
function module.align(p79, p80, p81)
	local lowerText = tostring(p80):lower()

	if lowerText == "mid" or lowerText == "centre" then
		lowerText = "center"
	end

	if lowerText ~= "left" and lowerText ~= "center" and lowerText ~= "right" then
		lowerText = "left"
	end

	local v148 = lowerText == "center" and module.container.TopbarCentered or module.container.TopbarStandard
	local holders = v148.Holders
	local stringUpper = string.upper
	local v151 = string.sub(lowerText, 1, 1)
	local v152 = stringUpper(v151)

	v151 = string.sub(lowerText, 2)

	local s1: string = v152 .. v151

	if not p81 then
		p79.originalAlignment = s1
	end

	local joinedFrame = p79.joinedFrame

	v152 = holders[s1]
	p79.screenGui = v148
	p79.alignmentHolder = v152

	if not p79.isDestroyed then
		p79.widget.Parent = joinedFrame or v152
	end

	p79.alignment = s1
	p79.alignmentChanged:Fire(s1)
	module.iconChanged:Fire(p79)

	return p79
end

module.setAlignment = module.align

function module.setLeft(p82)
	p82:setAlignment("Left")

	return p82
end
function module.setMid(p83)
	p83:setAlignment("Center")

	return p83
end
function module.setRight(p84)
	p84:setAlignment("Right")

	return p84
end
function module.setWidth(p85, p86, p87)
	local v161 = UDim2.fromOffset(p86, p85.widget.Size.Y.Offset)

	p85:modifyTheme({ "Widget", "Size", v161, p87 })
	p85:modifyTheme({ "Widget", "DesiredWidth", p86, p87 })

	return p85
end
function module.setImageScale(p88, p89, p90)
	p88:modifyTheme({ "IconImageScale", "Value", p89, p90 })

	return p88
end
function module.setImageRatio(p91, p92, p93)
	p91:modifyTheme({ "IconImageRatio", "AspectRatio", p92, p93 })

	return p91
end
function module.setTextSize(p94, p95, p96)
	p94:modifyTheme({ "IconLabel", "TextSize", p95, p96 })

	return p94
end
function module.setTextFont(p97, p98, p99, p100, p101)
	local v176 = p99 or Enum.FontWeight.Regular
	local v177 = p100 or Enum.FontStyle.Normal
	local v178 = nil
	local typeName: string = typeof(p98)

	if typeName == "number" then
		v178 = Font.fromId(p98, v176, v177)
	elseif typeName == "EnumItem" then
		v178 = Font.fromEnum(p98)
	elseif typeName == "string" and not p98:match("rbxasset") then
		v178 = Font.fromName(p98, v176, v177)
	end

	if not v178 then
		v178 = Font.new(p98, v176, v177)
	end

	p97:modifyTheme({ "IconLabel", "FontFace", v178, p101 })

	return p97
end
function module.bindToggleItem(p102, p103)
	if not p103:IsA("GuiObject") and not p103:IsA("LayerCollector") then
		error("Toggle item must be a GuiObject or LayerCollector!")
	end

	p102.toggleItems[p103] = true
	p102:_updateSelectionInstances()

	return p102
end
function module.unbindToggleItem(p104, p105)
	p104.toggleItems[p105] = nil
	p104:_updateSelectionInstances()

	return p104
end
function module._updateSelectionInstances(p106)
	for k, _ in pairs(p106.toggleItems) do
		local t6: {[any]: any} = {}

		for _, v in pairs(k:GetDescendants()) do
			if (v:IsA("TextButton") or v:IsA("ImageButton")) and v.Active then
				table.insert(t6, v)
			end
		end

		p106.toggleItems[k] = t6
	end
end
function module._setToggleItemsVisible(p107, p108, _, p110)
	for k, _ in pairs(p107.toggleItems) do
		if not p110 or p110 == p107 or p110.toggleItems[k] == nil then
			local s1: string = "Visible"

			if k:IsA("LayerCollector") then
				s1 = "Enabled"
			end

			k[s1] = p108
		end
	end
end
function module.bindEvent(p111, p112, p113)
	local v200 = p111[p112]
	local v201 = v200

	if v201 then
		v201 = false

		if typeof(v200) == "table" then
			v201 = v200.Connect
		end
	end

	assert(v201, "argument[1] must be a valid topbarplus icon event name!")

	local typeName: string = typeof(p113)

	assert(typeName == "function", "argument[2] must be a function!")
	p111.bindedEvents[p112] = v200:Connect(function(...)
		p113(p111, ...)
	end)

	return p111
end
function module.unbindEvent(p114, p115)
	local v205 = p114.bindedEvents[p115]

	if v205 then
		v205:Disconnect()
		p114.bindedEvents[p115] = nil
	end

	return p114
end
function module.bindToggleKey(p116, p117)
	local typeName: string = typeof(p117)

	assert(typeName == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	p116.bindedToggleKeys[p117] = true
	p116.toggleKeyAdded:Fire(p117)
	p116:setCaption("_hotkey_")

	return p116
end
function module.unbindToggleKey(p118, p119)
	local typeName: string = typeof(p119)

	assert(typeName == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	p118.bindedToggleKeys[p119] = nil

	return p118
end
function module.call(p120, p121, ...)
	local v214 = table.pack(...)

	task.spawn(function()
		p121(p120, table.unpack(v214))
	end)

	return p120
end
function module.addToJanitor(p122, p123)
	p122.janitor:add(p123)

	return p122
end
function module.lock(p124)
	p124:getInstance("ClickRegion").Visible = false
	p124.locked = true

	return p124
end
function module.unlock(p125)
	p125:getInstance("ClickRegion").Visible = true
	p125.locked = false

	return p125
end
function module.debounce(p126, p127)
	p126:lock()
	task.wait(p127)
	p126:unlock()

	return p126
end
function module.autoDeselect(p128, p129: boolean)
	if p129 == nil then
		p129 = true
	end

	p128.deselectWhenOtherIconSelected = p129

	return p128
end
function module.oneClick(p130, p131)
	local singleClickJanitor = p130.singleClickJanitor

	singleClickJanitor:clean()

	if p131 or p131 == nil then
		singleClickJanitor:add(p130.selected:Connect(function()
			p130:deselect("OneClick", p130)
		end))
	end

	p130.oneClickEnabled = true

	return p130
end
function module.setCaption(p132, p133)
	if p133 == "_hotkey_" and p132.captionText then
		return p132
	end

	local captionJanitor = p132.captionJanitor

	p132.captionJanitor:clean()

	if p133 and p133 ~= "" then
		local caption = require(elements.Caption)
		local v230 = captionJanitor:add(caption(p132))

		v230:SetAttribute("CaptionText", p133)
		p132.caption = v230
		p132.captionText = p133

		return p132
	end

	p132.caption = nil
	p132.captionText = nil

	return p132
end
function module.setCaptionHint(p134, p135)
	local typeName: string = typeof(p135)

	assert(typeName == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	p134.fakeToggleKey = p135
	p134.fakeToggleKeyChanged:Fire(p135)
	p134:setCaption("_hotkey_")

	return p134
end
function module.leave(p136)
	p136.joinJanitor:clean()

	return p136
end
function module.joinMenu(p137, p138)
	utility.joinFeature(p137, p138, p138.menuIcons, p138:getInstance("Menu"))
	p138.menuChildAdded:Fire(p137)

	return p137
end
function module.setMenu(p139, p140)
	p139.menuSet:Fire(p140)

	return p139
end
function module.setFrozenMenu(p141, p142)
	p141:freezeMenu(p142)
	p141:setMenu(p142)
end
function module.freezeMenu(p143)
	p143:select("FrozenMenu", p143)
	p143:bindEvent("deselected", function(p144)
		p144:select("FrozenMenu", p143)
	end)
	p143:modifyTheme({ "IconSpot", "Visible", false })
end
function module.joinDropdown(p145, p146)
	p146:getDropdown()
	utility.joinFeature(p145, p146, p146.dropdownIcons, p146:getInstance("DropdownScroller"))
	p146.dropdownChildAdded:Fire(p145)

	return p145
end
function module.getDropdown(p147)
	local v245 = p147.dropdown

	if not v245 then
		v245 = require(elements.Dropdown)(p147)
		p147.dropdown = v245
		p147:clipOutside(v245)
	end

	return v245
end
function module.setDropdown(p148, p149)
	p148:getDropdown()
	p148.dropdownSet:Fire(p149)

	return p148
end
function module.clipOutside(p150, p151)
	local v250 = utility.clipOutside(p150, p151)

	p150:refreshAppearance(p151)

	return p150, v250
end
function module.setIndicator(p152, p153)
	if not p152.indicator then
		local janitor = p152.janitor
		local indicator = require(elements.Indicator)

		p152.indicator = janitor:add(indicator(p152, module))
	end

	p152.indicatorSet:Fire(p153)
end
function module.destroy(p154)
	if p154.isDestroyed then
		return
	end

	p154:clearNotices()

	if p154.parentIconUID then
		p154:leave()
	end

	p154.isDestroyed = true
	p154.janitor:clean()
	module.iconRemoved:Fire(p154)
end

module.Destroy = module.destroy

return module
