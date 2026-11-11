



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local userInputService: UserInputService = game:GetService("UserInputService")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local makeMaid = loadLibrary("Maid").MakeMaid
local clampNumber = loadLibrary("qMath").ClampNumber
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "CameraControls"
module.MOUSE_SENSITIVITY = Vector2.new(12.566370614359172, 5.969026041820607)

function module.new()
	local object = setmetatable({}, module)

	object.Enabled = false

	return object
end
function module.SetZoomCamera(p1, p2)
	p1.ZoomCamera = p2 or error()

	return p1
end
function module.SetRotationCamera(p3, p4)
	p3.RotationCamera = p4 or error()

	return p3
end
local function rk4Integrator(p5, p6, p7)
	local n1: number = if p6 < 0 then -1 else 1

	local function acceleration(p8, _)
		local v40 = math.max(1, p8 / 3.3 + 0.5)

		return n1 * v40
	end

	local v18 = math.max(1, p5 / 3.3 + 0.5)
	local n2 = n1 * v18
	local n3 = p6 + n2 * (p7 / 2)
	local v21 = math.max(1, (p5 + p6 * (p7 / 2)) / 3.3 + 0.5)
	local n4 = n1 * v21

	v21 = p6 + n4 * (p7 / 2)

	local v23 = math.max(1, (p5 + n3 * (p7 / 2)) / 3.3 + 0.5)
	local n5 = n1 * v23
	local v25 = math.max(1, (p5 + v21 * p7) / 3.3 + 0.5)

	return p5 + (p6 + 2 * n3 + 2 * v21 + (p6 + n5 * p7)) * (p7 / 6), p6 + (n2 + 2 * n4 + 2 * n5 + n1 * v25) * (p7 / 6)
end
function module.HandleMouseWheel(p10, p11)
	local v28 = clampNumber(-p11.Position.Z, -1, 1)

	v28 = rk4Integrator(p10.ZoomCamera.TargetZoom, v28 * 1.4, 1)

	if p10.RotationCamera.ClassName == "PushCamera" then
		p10.RotationCamera:StopRotateBack()
	end

	p10.ZoomCamera.TargetZoom = v28
end
function module.MouseTranslationToAngle(_, p13)
	return Vector2.new(p13.x / 1920, p13.y / 1200)
end
function module.HandleMouseMovement(p14, p15)
	if p14.LastMousePosition then
		local rotationCamera = p14.RotationCamera
		local v34 = p14:MouseTranslationToAngle(-p15.Delta + p14.LastMousePosition - p15.Position)

		rotationCamera:RotateXY(v34 * p14.MOUSE_SENSITIVITY)
		p14.LastMousePosition = p15.Position
	end
end
function module.Enable(p16)
	if not p16.Enabled then
		p16.Enabled = true
		p16.Maid = makeMaid()
		p16.Maid.InputChanged = userInputService.InputChanged:connect(function(input, _)
			if input.UserInputType.Name == "MouseWheel" then
				p16:HandleMouseWheel(input)
			elseif input.UserInputType.Name == "MouseMovement" then
				p16:HandleMouseMovement(input)
			end
		end)
		p16.Maid.InputBegan = userInputService.InputBegan:connect(function(input, _)
			if input.UserInputType.Name == "MouseButton2" then
				p16.LastMousePosition = input.Position
				userInputService.MouseBehavior = "LockCurrentPosition"
			end
		end)
		p16.Maid.InputEnded = userInputService.InputEnded:connect(function(input, _)
			if input.UserInputType.Name == "MouseButton2" then
				p16.LastMousePosition = nil
				userInputService.MouseBehavior = "Default"
			end
		end)
	end
end
function module.Disable(p23)
	if p23.Enabled then
		p23.Enabled = false
		p23.Maid:DoCleaning()
		p23.Maid = nil
		p23.LastMousePosition = nil
		userInputService.MouseBehavior = "Default"
	end
end
function module.Destroy(p24)
	p24:Disable()
	setmetatable(p24, nil)
end

return module
