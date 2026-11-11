



local scriptParent: Instance = script.Parent
local humanoid: Instance = scriptParent:WaitForChild("Humanoid")

scriptParent:WaitForChild("HumanoidRootPart")

local animator: Instance = humanoid:WaitForChild("Animator")
local s1 = ""
local u5 = nil
local t1: {[any]: any} = {}

for k, v in pairs({
	idleAnimation = "http://www.roblox.com/asset/?id=180435571",
	walkAnimation = "http://www.roblox.com/asset/?id=180426354",
	jumpAnimation = "http://www.roblox.com/asset/?id=125750702",
	fallAnimation = "http://www.roblox.com/asset/?id=180436148",
	climbAnimation = "http://www.roblox.com/asset/?id=180436334",
	sitAnimation = "http://www.roblox.com/asset/?id=178130996"
}) do
	local animation: Animation = Instance.new("Animation")

	animation.AnimationId = v
	t1[k] = animation
end

local function StopAllAnimations()
	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end
end
local function PlayAnimation(p1)
	if p1 == s1 then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = p1
	u5 = animator:LoadAnimation(t1[p1])
	u5:Play()
end
local function onSeated()
	if s1 == "sitAnimation" then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = "sitAnimation"
	u5 = animator:LoadAnimation(t1.sitAnimation)
	u5:Play()
end
local function onRunning(p3)
	if not (p3 > 0.2) then
		if s1 == "idleAnimation" then
			return
		end

		if u5 then
			u5:Stop()
			u5:Destroy()
			u5 = nil
		end

		s1 = "idleAnimation"
		u5 = animator:LoadAnimation(t1.idleAnimation)
		u5:Play()

		return
	end

	if s1 == "walkAnimation" then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = "walkAnimation"
	u5 = animator:LoadAnimation(t1.walkAnimation)
	u5:Play()
end

humanoid.Seated:Connect(function()
	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	if s1 == "sitAnimation" then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = "sitAnimation"
	u5 = animator:LoadAnimation(t1.sitAnimation)
	u5:Play()
end)
humanoid.Swimming:Connect(onRunning)
humanoid.Running:Connect(onRunning)
humanoid.FreeFalling:Connect(function()
	if s1 == "fallAnimation" then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = "fallAnimation"
	u5 = animator:LoadAnimation(t1.fallAnimation)
	u5:Play()
end)
humanoid.Climbing:Connect(function(p2)
	if math.abs(p2) > 0.2 then
		if s1 ~= "climbAnimation" then
			if s1 == "climbAnimation" then
				return
			end

			if u5 then
				u5:Stop()
				u5:Destroy()
				u5 = nil
			end

			s1 = "climbAnimation"
			u5 = animator:LoadAnimation(t1.climbAnimation)
			u5:Play()

			return
		end

		if u5 then
			u5:AdjustSpeed(1)

			return
		end
	elseif u5 then
		u5:AdjustSpeed(0)
	end
end)
humanoid.Jumping:Connect(function()
	if s1 == "jumpAnimation" then
		return
	end

	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = "jumpAnimation"
	u5 = animator:LoadAnimation(t1.jumpAnimation)
	u5:Play()
end)
humanoid.Died:Connect(function()
	if u5 then
		u5:Stop()
		u5:Destroy()
		u5 = nil
	end

	s1 = ""
end)
