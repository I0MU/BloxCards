



local transition = require(script.Parent.Transition)

require(script.Parent.Handy)

local network = require(script.Parent.Network)

require(game.ReplicatedStorage.Animation)
require(game.ReplicatedStorage.Maid).new()

local networkFireServer = network.FireServer
local networkClient = network.client

game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")

local CurrentCamera: Camera = workspace.CurrentCamera
local u6 = nil
local animation = nil
local u8 = nil
local t1: {[any]: any} = {}

local function checkPart(p1, p2)
	for _, v in pairs(p1:GetChildren()) do
		checkPart(v, p2)
	end

	if not p1:IsA("BasePart") and not p1:IsA("Decal") then
	elseif p2 then
		if not t1[p1] then
			t1[p1] = p1.Transparency
		end

		p1.Transparency = 1
	elseif t1[p1] then
		p1.Transparency = t1[p1]
		t1[p1] = nil
	end
end
function networkClient.SetCutscene(p3)
	u6 = require(game.ReplicatedStorage.CameraCutscenes[p3])
	transition.ToggleBlack(1)

	if u6.Camera then
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = u6.Camera.CFrame
	end

	for _, v in pairs(game.Players:GetPlayers()) do
		checkPart(v.Character, true)
	end

	for _, v in pairs(u6.Animator:GetPlayingAnimationTracks()) do
		v:Stop()
		v:Destroy()
	end

	animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://" .. u6.Id
	u8 = u6.Animator:LoadAnimation(animation)

	for k, v in pairs(u6.Funcs) do
		u8:GetMarkerReachedSignal(k):Connect(function(p4)
			v(p4)
		end)
	end

	u8:GetMarkerReachedSignal("Stop"):Connect(function()
		u8:AdjustSpeed(0)
	end)
	u8.Stopped:Connect(function()
		if u6.Model:FindFirstChild("Idle") then
			u6.Animator:LoadAnimation(u6.Model.Idle):Play()
		end
	end)
	transition.ToggleBlack(-1)
	u8:Play()
end
function networkClient.AdvanceCutscene()
	if u8 then
		u8:AdjustSpeed(1)
	end
end
function networkClient.EndCutscene()
	if not u6 then
		return
	end

	transition.ToggleBlack(1)

	for _, v in pairs(game.Players:GetPlayers()) do
		checkPart(v.Character, false)
	end

	if u8 then
		u8:Stop()
	end

	u6 = nil
	u8 = nil
	CurrentCamera.CameraType = Enum.CameraType.Custom
	transition.ToggleBlack(-1)
	animation:Destroy()
end

return {}
