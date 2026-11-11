





local runService: RunService = game:GetService("RunService")
local userInputService: UserInputService = game:GetService("UserInputService")
local u3 = false
local network = require(script.Parent.Network)
local networkClient = network.client
local networkFireServer = network.FireServer
local viewportSize: Vector2 = workspace.CurrentCamera.ViewportSize
local dodgeModeUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("DodgeModeUI")
local move = dodgeModeUI:FindFirstChild("Move")
local n1: number = 30
local mobileControls = dodgeModeUI:FindFirstChild("MobileControls")
local u12 = false
local u13: boolean = false

local function scale(p1, p2, p3)
	local absoluteSize = p3.AbsoluteSize

	return UDim2.new(p1 / absoluteSize.X, 0, p2 / absoluteSize.Y, 0)
end

local t1: {[any]: any} = { Up = false, Down = false, Left = false, Right = false }

function networkClient.UpdateDodgePosition(p5)
	if u3 == true then
		move.Position = p5
	end
end
function networkClient.DisableMovementControl(p6)
	u3 = p6
end
function networkClient.SetDodgeOutOfBoundsAllowed(p7)
	u12 = p7
end

local module: {[any]: any} = {
	GetMovementState = function()
		return u3
	end,
	CheckForMobile = function()
		if userInputService.TouchEnabled then
			mobileControls.Visible = true

			return
		end

		mobileControls.Visible = false
	end
}

module.CheckForMobile()
mobileControls:FindFirstChild("MobileUp").MouseButton1Down:Connect(function()
	t1.Up = true
	u13 = true
end)
mobileControls:FindFirstChild("MobileDown").MouseButton1Down:Connect(function()
	t1.Down = true
	u13 = true
end)
mobileControls:FindFirstChild("MobileLeft").MouseButton1Down:Connect(function()
	t1.Left = true
	u13 = true
end)
mobileControls:FindFirstChild("MobileRight").MouseButton1Down:Connect(function()
	t1.Right = true
	u13 = true
end)
mobileControls:FindFirstChild("MobileRight").MouseLeave:Connect(function()
	t1.Right = false
end)
mobileControls:FindFirstChild("MobileLeft").MouseLeave:Connect(function()
	t1.Left = false
end)
mobileControls:FindFirstChild("MobileUp").MouseLeave:Connect(function()
	t1.Up = false
end)
mobileControls:FindFirstChild("MobileDown").MouseLeave:Connect(function()
	t1.Down = false
end)
runService.RenderStepped:Connect(function(deltaTime: number)
	if move.Visible == false or move.Parent.Enabled == false then
		return
	end

	if u3 == true then
		return
	end

	local u25: boolean = userInputService:GetFocusedTextBox() ~= nil
	local vector2New = Vector2.new
	local n5: number = if not u25 and (not not userInputService:IsKeyDown(Enum.KeyCode.A) or t1.Left == true) then -1 else 0
	local n2: number = if not u25 and (not not userInputService:IsKeyDown(Enum.KeyCode.D) or t1.Right == true) then 1 else 0
	local n3: number = if not u25 and (not not userInputService:IsKeyDown(Enum.KeyCode.W) or t1.Up == true) then -1 else 0
	local n4: number = if not u25 and (not not userInputService:IsKeyDown(Enum.KeyCode.S) or t1.Down == true) then 1 else 0
	local vector2 = vector2New(n5 + n2, n3 + n4)
	local uDim2 = UDim2.new(vector2.X * 0.2 * deltaTime, 0, vector2.Y * 0.2 * deltaTime * (viewportSize.X / viewportSize.Y), 0)
	local v33 = move

	v33.Position = v33.Position + uDim2

	local dodgeModeUIAbsoluteSize = dodgeModeUI.AbsoluteSize
	local uDim22 = UDim2.new(move.Position.X.Offset / dodgeModeUIAbsoluteSize.X, 0, move.Position.Y.Offset / dodgeModeUIAbsoluteSize.Y, 0)

	move.Position = UDim2.new(move.Position.X.Scale + uDim22.X.Scale, 0, move.Position.Y.Scale + uDim22.Y.Scale, 0)

	if (move.Position.Y.Scale < 0.451 or move.Position.Y.Scale > 0.8 or move.Position.X.Scale < 0.1 or move.Position.X.Scale > 0.9) and u12 == false then
		move.Position = UDim2.new(0.5, 0, 0.627, 0)
	end

	n1 = -1

	if n1 <= 0 then
		task.spawn(function()
		end)
		n1 = 30
	end
end)
print("Finished loading " .. script.Name)

return module
