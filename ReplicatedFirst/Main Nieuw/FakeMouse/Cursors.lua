



print("Cursors")

-- Cursors.Start("Target") / Cursors.Stop(): a red ring with a dot that follows the mouse while the player has to pick a
-- target (a fighter on the field). It exists ONLY between Start and Stop: Battle.lua stops it when the target is picked,
-- when the server says the choice is over, and when the turn ends. (StartTarget / StopTarget used to be empty, so no
-- target dot was ever shown.) The system cursor stays visible underneath so the mouse can never get lost.
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local module: {[any]: any} = { Active = nil }
local gui: ScreenGui? = nil
local connection: RBXScriptConnection? = nil

local function destroyTargetCursor()
	if connection then
		connection:Disconnect()
		connection = nil
	end

	if gui then
		gui:Destroy()
		gui = nil
	end
end

function module.Start(active)
	if module.Active then
		module.Stop()
	end

	module.Active = active
	module["Start" .. active]()
end
function module.Stop()
	if module.Active then
		local active = module.Active

		module.Active = nil
		module["Stop" .. active]()
	end
end
function module.StartTarget()
	destroyTargetCursor()

	-- FIX: nothing is ever drawn on the mouse while choosing a target; the marker appears on the picked card instead
	-- (see TargetCard in Battle).
	do
		return
	end

	-- touch screens have no pointer to follow (the arrow from TargetArrow still shows there)
	if not UserInputService.MouseEnabled then
		return
	end

	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer and localPlayer:FindFirstChildOfClass("PlayerGui")

	if not playerGui then
		return
	end

	local screenGui = Instance.new("ScreenGui")

	screenGui.Name = "TargetCursor"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 10000
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local ring = Instance.new("Frame")

	ring.Name = "Ring"
	ring.AnchorPoint = Vector2.new(0.5, 0.5)
	ring.Size = UDim2.fromOffset(38, 38)
	ring.BackgroundTransparency = 1
	ring.Active = false
	ring.Parent = screenGui

	local ringCorner = Instance.new("UICorner")

	ringCorner.CornerRadius = UDim.new(1, 0)
	ringCorner.Parent = ring

	local ringStroke = Instance.new("UIStroke")

	ringStroke.Color = Color3.new(1, 0, 0)
	ringStroke.Thickness = 3
	ringStroke.Parent = ring

	local dot = Instance.new("Frame")

	dot.Name = "Dot"
	dot.AnchorPoint = Vector2.new(0.5, 0.5)
	dot.Position = UDim2.fromScale(0.5, 0.5)
	dot.Size = UDim2.fromOffset(10, 10)
	dot.BackgroundColor3 = Color3.new(1, 0, 0)
	dot.BorderSizePixel = 0
	dot.Active = false
	dot.Parent = ring

	local dotCorner = Instance.new("UICorner")

	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = dot

	local dotStroke = Instance.new("UIStroke")

	dotStroke.Color = Color3.new(1, 1, 1)
	dotStroke.Thickness = 1.5
	dotStroke.Parent = dot
	screenGui.Parent = playerGui
	gui = screenGui

	local function follow()
		local location = UserInputService:GetMouseLocation()
		local size = 38 + math.sin(os.clock() * 8) * 3

		ring.Position = UDim2.fromOffset(location.X, location.Y)
		ring.Size = UDim2.fromOffset(size, size)
	end

	follow()
	connection = RunService.RenderStepped:Connect(follow)
end
function module.StopTarget()
	destroyTargetCursor()
end

return module
