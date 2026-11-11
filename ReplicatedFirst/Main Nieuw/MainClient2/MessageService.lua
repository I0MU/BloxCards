



local tweenService: TweenService = game:GetService("TweenService")
local messages = require(script.Messages)
local network = require(script.Parent.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local visGuiBattle = visGui.Battle
local visGuiMessageHandler = visGui.MessageHandler
local basic = visGuiMessageHandler.Templates.Basic
local t1: {[any]: any} = { UDim2.new(0.5, 0, 0.5, 0), Vector2.new(0.5, 0.5) }
local t2: {[any]: any} = { UDim2.new(0.5, 0, 0.025, 0), Vector2.new(0.5, 0) }
local t3: {[any]: any} = { UDim2.new(0.5, 0, 0.975, 0), Vector2.new(0.5, 1) }
local t4: {[any]: any} = { UDim2.new(0.025, 0, 0.5, 0), Vector2.new(0, 0.5) }
local t5: {[any]: any} = { UDim2.new(0.975, 0, 0.5, 0), Vector2.new(1, 0.5) }
local t6: {[any]: any} = { UDim2.new(0.025, 0, 0.025, 0), Vector2.new(0, 0) }
local t7: {[any]: any} = { UDim2.new(0.975, 0, 0.025, 0), Vector2.new(1, 0) }
local t8: {[any]: any} = { UDim2.new(0.025, 0, 0.975, 0), Vector2.new(0, 1) }
local t9: {[any]: any} = { UDim2.new(0.975, 0, 0.975, 0), Vector2.new(1, 1) }
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0)

Message = {}
Message.__index = Message

local t10: {[any]: any} = {
	C = t1,
	N = t2,
	S = t3,
	W = t4,
	E = t5,
	NW = t6,
	NE = t7,
	SW = t8,
	SE = t9
}
local t11: {[any]: any} = {
	Small = UDim2.new(0.2, 0, 0.2, 0),
	Large = UDim2.new(0.35, 0, 0.35, 0)
}

function Message.new(name, p2, p3, p4, p5, list)
	local t12: {[any]: any} = {}

	setmetatable(t12, Message)

	local clone = basic:Clone()

	clone.Name = name
	clone.Size = t11[p2]
	clone.Position = t10[p3][1]
	clone.AnchorPoint = t10[p3][2]
	clone.Title.Text = p4
	clone.Message.Text = p5
	visGuiMessageHandler.Visible = true

	if list then
		if type(list) == "table" then
			networkFireServer(list[1], list[2])
		else
			clone.Close.MouseButton1Click:connect(function()
				t12:Destroy()
			end)
			clone.Close.Visible = true
		end
	end

	clone.Parent = visGuiMessageHandler
	clone.Visible = true
	t12.Physical = clone
	messages[name] = t12

	return t12
end
function Message.Update(p7, p8, p9)
	p7.Physical.Title.Text = p8
	p7.Physical.Message.Text = p9
end
function Message.Tween(p10, p11, p12)
	if p12 and p11 then
		tweenService:Create(p10.Physical, tweenInfo, { AnchorPoint = t10[p12][2] }):Play()
		p10.Physical:TweenSizeAndPosition(t11[p11], t10[p12][1], "Out", "Quart", 1, true)
	elseif p11 then
		p10.Physical:TweenSize(t11[p11], "Out", "Quart", 1, true)
	elseif p12 then
		tweenService:Create(p10.Physical, tweenInfo, { AnchorPoint = t10[p12][2] }):Play()
		p10.Physical:TweenPosition(t10[p12][1], "Out", "Quart", 1, true)
	end
end
function Message.Destroy(p13)
	p13.Physical:Destroy()
	visGuiMessageHandler.Visible = false
end

return Message
