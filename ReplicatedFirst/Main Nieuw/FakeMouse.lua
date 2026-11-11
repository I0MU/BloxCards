





local module: {[any]: any} = {
	fakemouse = { X = 0, Y = 0 }
}
local fakemouse = module.fakemouse
local userInputService: UserInputService = game:GetService("UserInputService")

userInputService.InputChanged:connect(function(input)
	if input.UserInputType.Name == "MouseMovement" or input.UserInputType == Enum.UserInputType.Touch then
		fakemouse.X = input.Position.X
		fakemouse.Y = input.Position.Y
	end

	if input.UserInputType.Name == "Gamepad1" then
		fakemouse.X = game.Players.LocalPlayer:GetMouse().X
		fakemouse.Y = game.Players.LocalPlayer:GetMouse().Y
	end
end)

local t2: {[any]: any} = {}
local t3: {[any]: any} = {}
local t4: {[any]: any} = {}

userInputService.InputBegan:connect(function(input, p3)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		for _, v in pairs(t4) do
			v(input, p3)
		end

		if not p3 then
			for _, v in pairs(t3) do
				v(input, p3)
			end

			return
		end
	elseif t2[input.KeyCode] and not p3 then
		t2[input.KeyCode](input, p3)
	end
end)

function module.RegisterMouseDown(p4)
	table.insert(t4, p4)
end
function module.RegisterMouseDown3D(p5)
	table.insert(t4, p5)
end

local t5: {[any]: any} = {}
local t6: {[any]: any} = {}

userInputService.InputEnded:connect(function(input, p7)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		for _, v in pairs(t5) do
			v(input, p7)
		end

		for _, v in pairs(t6) do
			v(input, p7)
		end

		for k, _ in pairs(t6) do
			t6[k] = nil
		end
	end
end)

function module.RegisterMouseUp(p8, p9)
	if p9 then
		table.insert(t6, p8)

		return
	end

	table.insert(t5, p8)
end
function module.BindInputBegan(p10, p11, p12)
	t2[p10] = p12
	t2[p12] = p11
end
function module.UnbindInputBegan(p13)
	if t2[p13] then
		t2[t2[p13]] = nil
		t2[p13] = nil
	end
end

local vector2New = Vector2.new

function module.MouseAwayFrom(p14, p15: number)
	if not p15 then
		p15 = 10
	end

	return function()
		local n1 = vector2New(fakemouse.X, fakemouse.Y) - (p14.AbsolutePosition + p14.AbsoluteSize * 0.5)

		if math.abs(n1.X) > p14.AbsoluteSize.X / 2 + p15 or math.abs(n1.Y) > p14.AbsoluteSize.Y / 2 + p15 then
			return true
		end
	end
end

module.Cursors = require(script.Cursors)
print("Finished loading " .. script.Name)

return module
