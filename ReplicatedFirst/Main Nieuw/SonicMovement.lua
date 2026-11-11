



local userInputService: UserInputService = game:GetService("UserInputService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera: Camera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer
local u5: boolean = userInputService.TouchEnabled == true
local audioService = require(replicatedStorage.AudioService)
local u7 = nil
local u8 = nil
local u9 = nil
local u10: boolean = false
local u11: boolean = false
local u12: boolean = false
local u13: boolean = false
local u14: boolean = false
local u15: boolean = false
local u16: boolean = false
local u17: boolean = false
local u18: boolean = false
local u19 = nil
local u20 = nil
local u21 = nil
local heartbeat = game:GetService("RunService").Heartbeat

local t1: {[any]: any} = {
	IsPlaying = false,
	Play = function()
	end,
	Stop = function()
	end
}

function stopAnims()
	if t1.IsPlaying then
		t1:Stop()
	end

	if t1.IsPlaying then
		t1:Stop()
	end

	if t1.IsPlaying then
		t1:Stop()
	end
end
local function createIndicator(adornee)
	if u21 then
		u21:Destroy()
	end

	if adornee == nil then
		return
	end

	local billboardGui: BillboardGui = Instance.new("BillboardGui", adornee)

	billboardGui.Size = UDim2.new(5, 0, 5, 0)
	billboardGui.Adornee = adornee
	billboardGui.AlwaysOnTop = true
	u21 = billboardGui

	local imageLabel: ImageLabel = Instance.new("ImageLabel", billboardGui)

	imageLabel.Size = UDim2.new(9, 0, 9, 0)
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Image = "rbxassetid://6108266940"
	audioService.PlaySound("Indicator")
	imageLabel:TweenSize(UDim2.new(1.5, 0, 1.5, 0), "Out", "Quint", 0.2, false)
	spawn(function()
		while u21 do
			game:GetService("RunService").Heartbeat:Wait()
			imageLabel.Rotation = imageLabel.Rotation + 2.5
		end
	end)
end
local function setFriction(p2)
	local v34

	if p2 == true then
		v34 = PhysicalProperties.new(0.7, 0.3, 0)
	else
		v34 = PhysicalProperties.new(0.7, 0, 0)
	end

	for _, v in pairs(u7:GetChildren()) do
		if v:IsA("BasePart") then
			v.CustomPhysicalProperties = v34
		end
	end
end
local function jumpCheck()
	repeat
		wait(0.01)
	until u14 == false

	while true do
		if u11 ~= false or u10 ~= true or not u7:FindFirstChild("HumanoidRootPart") then
			break
		end

		local n1 = u7.HumanoidRootPart.CFrame + u7.HumanoidRootPart.CFrame.LookVector * 25
		local region3 = Region3.new(n1.Position - Vector3.new(25, 27.5, 20.75), n1.Position + Vector3.new(25, 27.5, 20.75))
		n1 = {}
		game:GetService("RunService").Stepped:Wait()

		local v39 = nil

		for _, v in pairs(workspace:FindPartsInRegion3(region3, nil, math.huge)) do
			if v.Name == "BALLOON" or v.Name == "BOUNCE" or v.Name == "ATTACK" then
				local v42, v43 = CurrentCamera:WorldToViewportPoint(v.Position)

				if v43 == true then
					local raycastParams = RaycastParams.new()

					raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

					local t2 = { v.Parent.Visual }

					for _, iterValue in pairs(game.Players:GetPlayers()) do
						table.insert(t2, iterValue.Character)
					end

					raycastParams.FilterDescendantsInstances = t2

					local v48 = u8.Position
					local cFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, v.Position)

					t2 = workspace:Raycast(v48, cFrame.lookVector * 50, raycastParams)

					if t2 and v == t2.Instance then
						table.insert(n1, v)
					end
				end
			end
		end

		for _, v in pairs(n1) do
			local v52 = LocalPlayer:DistanceFromCharacter(v.Position)

			if v39 == nil or v52 < LocalPlayer:DistanceFromCharacter(v39.Position) then
				v39 = v
			end
		end

		if v39 ~= u20 then
			createIndicator(v39)
		end

		u20 = v39
	end

	if u21 ~= nil then
		u21:Destroy()
	end
end
local function moveBalloon(p3, _)
	if u15 == true then
		return
	end

	u15 = true
	u14 = true
	spawn(function()
		local v61 = p3.Parent
		local parent = v61.Parent

		v61.Parent = game:GetService("ReplicatedStorage")

		local part: Part = Instance.new("Part", game.Workspace)

		part.Anchored = true
		part.Transparency = 1
		part.CanCollide = false
		part.Position = u7.HumanoidRootPart.Position

		local clone = script.BalloonPoof:Clone()

		clone.Parent = part
		clone:Emit(10)
		wait(0.1)
		u15 = false
		u14 = false
		wait(0.9)
		part:Destroy()
		wait(3)
		v61.Parent = parent
	end)
	stopAnims()

	if u18 == false then
		u18 = true
	else
		u18 = false
	end

	t1:Play()
	u7.HumanoidRootPart.Velocity = u7.HumanoidRootPart.CFrame.UpVector * 80 + u7.HumanoidRootPart.CFrame.lookVector * 70
	u11 = false
	audioService.PlaySound("Balloon")
	spawn(function()
		jumpCheck()
	end)
end
local function checkObjCol(p5, p6)
	if p5.Name ~= "BOUNCE" then
		u9.PlatformStand = false
	end

	if p5.Name == "BALLOON" then
		moveBalloon(p5, p6)

		return
	end

	if p5.Name == "KILL" then
		u9.Health = 0

		return
	end

	local foundChild: Instance = script:FindFirstChild(p5.Name)

	if foundChild then
		foundChild:Play()
	end
end
function onJumpRequest()
	if not u7 or not u9 or not u7:IsDescendantOf(workspace) or u9:GetState() == Enum.HumanoidStateType.Dead then
	elseif u10 and not u11 and not t1.IsPlaying and u14 == false then
		u14 = true
		spawn(function()
			wait(0.175)
			u14 = false
		end)
		u11 = true

		local vectorValue = Vector3.new(0, 1.5, 0)

		if u20 and u20.Name == "BOUNCE" then
			vectorValue = Vector3.new(0, -2, 0)
			u9.PlatformStand = true
			spawn(function()
				wait(2)

				if u9.PlatformStand == true then
					u9.PlatformStand = false
				end
			end)
		end

		if u20 and u19 ~= u20 then
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, u20.Position)
			LocalPlayer.Character.HumanoidRootPart.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 240 + vectorValue
			stopAnims()
			t1:Play()
			audioService.PlaySound("attack")
			spawn(function()
				local v65 = u20 or u19
				local v66 = u8
				local v67 = (v66.Position - v65.Position).Magnitude

				while t1.IsPlaying do
					local magnitude = (v66.Position - v65.Position).Magnitude

					if v67 < magnitude then
						checkObjCol(v65, u8)
					else
						v67 = magnitude
					end

					wait()
				end
			end)
			u19 = u20
			u20 = nil

			return
		end

		return
	end
end
local function characterAdded(p7)
	u7 = p7
	u9 = p7:WaitForChild("Humanoid")
	u8 = u7:WaitForChild("HumanoidRootPart")

	repeat
		wait(0.01)
	until u7.Parent == workspace

	u11 = false
	u10 = false
	workspace.Gravity = 160
	u9.Touched:connect(function(p8, p9)
		checkObjCol(p8, p9)
	end)
	u9.StateChanged:connect(function(_, p11)
		if p11 ~= Enum.HumanoidStateType.Freefall and p11 ~= Enum.HumanoidStateType.Jumping then
			u20 = nil

			if u21 ~= nil then
				u21:Destroy()
			end
		end

		if p11 == Enum.HumanoidStateType.Landed then
			setFriction(true)
			u9.JumpPower = 60
			u19 = nil
			u16 = false
			u15 = false
			u17 = false
			u10 = false
			u12 = false
			u11 = false
			stopAnims()
		elseif p11 == Enum.HumanoidStateType.Freefall then
			setFriction(false)
			u10 = true
			spawn(function()
				jumpCheck()
			end)
		end
	end)
	u9.Running:Connect(function(p12)
		if p12 > 0 then
			u13 = true

			return
		end

		stopAnims()
		u13 = false
	end)
end

if LocalPlayer.Character then
	characterAdded(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:connect(characterAdded)
userInputService.InputBegan:connect(function(input)
	if not u5 then
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
			onJumpRequest()
		end

		if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA then
			onJumpRequest()

			return
		end
	elseif input.UserInputType == Enum.UserInputType.Touch then
		onJumpRequest()
	end
end)
userInputService.JumpRequest:Connect(function()
end)

return {}
