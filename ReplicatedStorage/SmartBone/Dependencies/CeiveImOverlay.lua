



local guiService: GuiService = game:GetService("GuiService")
local v2 = Font.new("rbxasset://fonts/families/PressStart2P.json")
local module: {[any]: any} = {}

module.__index = module

function module.new(p1, p2, p3)
	local v7 = if p3 == nil then true else p3
	local uDim2FromOffset = UDim2.fromOffset
	local v9 = guiService:GetGuiInset()
	local uDim2 = uDim2FromOffset(25, 5 + v9.Y)
	local v11 = UDim2.fromOffset(0, 0)
	local v12 = UDim2.fromScale(1, 1)
	local object = setmetatable({}, module)

	object.DefaultY = p1 or 5
	object.TextSize = p2 or 11
	object.BackFrame = Instance.new("Frame")
	object.BackFrame.Position = v7 and uDim2 or v11
	object.BackFrame.Size = v7 and UDim2.new(1, -25, 1, -5) or v12
	object.BackFrame.Name = "BackFrame"
	object.BackFrame.Transparency = 1
	object.ListLayout = Instance.new("UIListLayout")
	object.ListLayout.Padding = UDim.new(0, 2)
	object.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	object.ListLayout.Parent = object.BackFrame
	object.m_Indent = 0
	object.DidUpdate = false
	object.m_State = ""
	object.m_PreviousState = ""
	object.m_RenderGroup = {}
	object.m_ItemPool = {}

	return object
end
function module.Begin(p4, p5, p6, p7)
	if p5 and type(p5) == "string" then
		if p6 and typeof(p6) ~= "Color3" then
			warn("BackgroundColor should be a Color3", debug.traceback())

			return
		end

		if p7 and typeof(p7) ~= "Color3" then
			warn("TextColor should be a Color3", debug.traceback())

			return
		end

		p4:Text(p5, p6, p7)
		p4.m_Indent = p4.m_Indent + 1

		return
	end

	warn("Expected text to ImOverlay::Begin", debug.traceback())
end
function module.End(p8)
	if p8.m_Indent - 1 < 0 then
		error("Too many callbacks to ImOverlay::End")

		return
	end

	p8.m_Indent = p8.m_Indent - 1
end
function module.Text(p9, p10, p11, p12)
	if p10 and type(p10) == "string" then
		if p11 and typeof(p11) ~= "Color3" then
			warn("BackgroundColor should be a Color3", debug.traceback())

			return
		end

		if p12 and typeof(p12) ~= "Color3" then
			warn("TextColor should be a Color3", debug.traceback())

			return
		end

		local v23 = p11 or Color3.new()
		local v24 = p12 or Color3.new(1, 1, 1)

		table.insert(p9.m_RenderGroup, {
			Text = p10,
			TextColor = v24,
			BackgroundColor = v23,
			Indent = p9.m_Indent
		})

		local m_State = p9.m_State
		local v26 = ("%*|%*|%*|%*"):format(p10, v24, v23, p9.m_Indent)

		p9.m_State = m_State .. v26

		return
	end

	warn("Expected text to ImOverlay::Text", debug.traceback())
end
function module.m_Pool(p13)
	debug.profilebegin("ImOverlay::m_Pool")

	for iterFirst, iterSecond in p13.BackFrame:GetChildren() do
		if not iterSecond:IsA("UIListLayout") and iterSecond.Visible then
			iterSecond.Visible = false
			table.insert(p13.m_ItemPool, iterSecond)
		end
	end

	debug.profileend()
end
function module.m_Cleanup(p14)
	debug.profilebegin("ImOverlay::m_Cleanup")
	p14.m_State = ""
	p14.m_Indent = 0
	p14.m_RenderGroup = {}
	debug.profileend()
end
function module.m_CreateLabel(p15, text, textColor3, backgroundColor3, p19)
	debug.profilebegin("ImOverlay::m_CreateLabel")

	local background: Frame = Instance.new("Frame")

	background.Name = "Background"
	background.AutomaticSize = Enum.AutomaticSize.XY
	background.BackgroundColor3 = backgroundColor3
	background.BackgroundTransparency = 0.4
	background.BorderSizePixel = 0

	local taskText: TextLabel = Instance.new("TextLabel")

	taskText.Name = "TaskText"
	taskText.FontFace = v2
	taskText.Text = text
	taskText.TextColor3 = textColor3
	taskText.TextSize = p15.TextSize
	taskText.TextXAlignment = Enum.TextXAlignment.Left
	taskText.AutomaticSize = Enum.AutomaticSize.XY
	taskText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	taskText.BackgroundTransparency = 1
	taskText.Position = UDim2.fromOffset(p19 * 50, 0)
	taskText.Size = UDim2.fromOffset(0, p15.DefaultY)
	taskText.Parent = background

	local uiPadding: UIPadding = Instance.new("UIPadding")

	uiPadding.Name = "UIPadding"
	uiPadding.PaddingBottom = UDim.new(0, 2)
	uiPadding.Parent = taskText

	local uiPadding: UIPadding = Instance.new("UIPadding")

	uiPadding.Name = "UIPadding"
	uiPadding.PaddingRight = UDim.new(0, 5)
	uiPadding.PaddingLeft = UDim.new(0, 5)
	uiPadding.Parent = background
	debug.profileend()

	return background
end
function module.Render(p20)
	debug.profilebegin("ImOverlay::Render")

	if p20.m_State == "" then
		p20:m_Pool()
		p20:m_Cleanup()
		p20.DidUpdate = false
		debug.profileend()

		return
	end

	local m_State = p20.m_State
	local v42 = ("%*|%*"):format(p20.DefaultY, p20.TextSize)

	p20.m_State = m_State .. v42

	if p20.m_State == p20.m_PreviousState then
		p20:m_Cleanup()
		p20.DidUpdate = false
		debug.profileend()

		return
	end

	p20:m_Pool()
	p20.m_PreviousState = p20.m_State
	p20.DidUpdate = true

	for iterFirst, iterSecond in p20.m_RenderGroup, nil, nil do
		debug.profilebegin("Render Item")

		if #p20.m_ItemPool == 0 then
			local v45 = p20:m_CreateLabel(iterSecond.Text, iterSecond.TextColor, iterSecond.BackgroundColor, iterSecond.Indent)

			v45.LayoutOrder = iterFirst
			v45.Parent = p20.BackFrame
		else
			debug.profilebegin("Edit Label")

			local v46 = table.remove(p20.m_ItemPool, #p20.m_ItemPool)
			local taskText = v46.TaskText

			v46.LayoutOrder = iterFirst
			v46.BackgroundColor3 = iterSecond.BackgroundColor
			taskText.Text = iterSecond.Text
			taskText.TextColor3 = iterSecond.TextColor
			taskText.Position = UDim2.fromOffset(50 * iterSecond.Indent, 0)
			v46.Visible = true
			v46.Parent = p20.BackFrame
			debug.profileend()
		end

		debug.profileend()
	end

	p20:m_Cleanup()
	debug.profileend()
end
function module.Destroy(p21)
	p21.BackFrame:Destroy()
	setmetatable(p21, nil)
end

return module
