



local scriptParent: Instance = script.Parent
local humanoid: Instance = scriptParent:WaitForChild("Humanoid")
local s1: string = "Standing"

local ok, result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)

local v6 = ok and result

local ok2, result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun")
end)

local v9 = ok2 and result2

local function getRigScale()
	if v9 then
		return scriptParent:GetScale()
	end

	return 1
end

local scaleDampeningPercent: Instance = script:FindFirstChild("ScaleDampeningPercent")
local s2 = ""
local u13 = nil
local u14 = nil
local u15 = nil
local n1 = 1
local u17 = nil
local u18 = nil
local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local t3: {[any]: any} = {
	wave = false,
	point = false,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = false,
	cheer = false
}

math.randomseed(tick())

function findExistingAnimationInSet(p1, p2)
	if p1 == nil or p2 == nil then
		return 0
	end

	for i = 1, p1.count do
		if p1[i].anim.AnimationId == p2.AnimationId then
			return i
		end
	end

	return 0
end
function configureAnimationSet(name, p4)
	if t2[name] ~= nil then
		for _, v in pairs(t2[name].connections) do
			v:disconnect()
		end
	end

	t2[name] = {}
	t2[name].count = 0
	t2[name].totalWeight = 0
	t2[name].connections = {}

	local u49: boolean = true

	local ok3, result3 = pcall(function()
		u49 = game:GetService("StarterPlayer").AllowCustomAnimations
	end)

	if not ok3 then
		u49 = true
	end

	local foundChild: Instance = script:FindFirstChild(name)

	if u49 and foundChild ~= nil then
		table.insert(t2[name].connections, foundChild.ChildAdded:connect(function(_)
			configureAnimationSet(name, p4)
		end))
		table.insert(t2[name].connections, foundChild.ChildRemoved:connect(function(_)
			configureAnimationSet(name, p4)
		end))

		for _, v in pairs(foundChild:GetChildren()) do
			if v:IsA("Animation") then
				local n1 = 1
				local weight = v:FindFirstChild("Weight")

				if weight ~= nil then
					n1 = weight.Value
				end

				t2[name].count = t2[name].count + 1

				local count = t2[name].count

				t2[name][count] = {}
				t2[name][count].anim = v
				t2[name][count].weight = n1
				t2[name].totalWeight = t2[name].totalWeight + t2[name][count].weight
				table.insert(t2[name].connections, v.Changed:connect(function(_)
					configureAnimationSet(name, p4)
				end))
				table.insert(t2[name].connections, v.ChildAdded:connect(function(_)
					configureAnimationSet(name, p4)
				end))
				table.insert(t2[name].connections, v.ChildRemoved:connect(function(_)
					configureAnimationSet(name, p4)
				end))
			end
		end
	end

	if t2[name].count <= 0 then
		for k, v in pairs(p4) do
			t2[name][k] = {}
			t2[name][k].anim = Instance.new("Animation")
			t2[name][k].anim.Name = name
			t2[name][k].anim.AnimationId = v.id
			t2[name][k].weight = v.weight
			t2[name].count = t2[name].count + 1
			t2[name].totalWeight = t2[name].totalWeight + v.weight
		end
	end

	for _, v in pairs(t2) do
		for i = 1, v.count do
			if t1[v[i].anim.AnimationId] == nil then
				humanoid:LoadAnimation(v[i].anim)
				t1[v[i].anim.AnimationId] = true
			end
		end
	end
end
function configureAnimationSetOld(name, p11)
	if t2[name] ~= nil then
		for _, v in pairs(t2[name].connections) do
			v:disconnect()
		end
	end

	t2[name] = {}
	t2[name].count = 0
	t2[name].totalWeight = 0
	t2[name].connections = {}

	local u67: boolean = true

	local ok4, result4 = pcall(function()
		u67 = game:GetService("StarterPlayer").AllowCustomAnimations
	end)

	if not ok4 then
		u67 = true
	end

	local foundChild: Instance = script:FindFirstChild(name)

	if u67 and foundChild ~= nil then
		table.insert(t2[name].connections, foundChild.ChildAdded:connect(function(_)
			configureAnimationSet(name, p11)
		end))
		table.insert(t2[name].connections, foundChild.ChildRemoved:connect(function(_)
			configureAnimationSet(name, p11)
		end))

		local n1: number = 1

		for _, v in pairs(foundChild:GetChildren()) do
			if v:IsA("Animation") then
				table.insert(t2[name].connections, v.Changed:connect(function(_)
					configureAnimationSet(name, p11)
				end))
				t2[name][n1] = {}
				t2[name][n1].anim = v

				local weight = v:FindFirstChild("Weight")

				if weight == nil then
					t2[name][n1].weight = 1
				else
					t2[name][n1].weight = weight.Value
				end

				t2[name].count = t2[name].count + 1
				t2[name].totalWeight = t2[name].totalWeight + t2[name][n1].weight
				n1 += 1
			end
		end
	end

	if t2[name].count <= 0 then
		for k, v in pairs(p11) do
			t2[name][k] = {}
			t2[name][k].anim = Instance.new("Animation")
			t2[name][k].anim.Name = name
			t2[name][k].anim.AnimationId = v.id
			t2[name][k].weight = v.weight
			t2[name].count = t2[name].count + 1
			t2[name].totalWeight = t2[name].totalWeight + v.weight
		end
	end

	for _, v in pairs(t2) do
		for i = 1, v.count do
			humanoid:LoadAnimation(v[i].anim)
		end
	end
end

local t4: {[any]: any} = {
	idle = {
		{ id = "http://www.roblox.com/asset/?id=507766666", weight = 1 },
		{ id = "http://www.roblox.com/asset/?id=507766951", weight = 1 },
		{ id = "http://www.roblox.com/asset/?id=507766388", weight = 9 }
	},
	walk = { { id = "http://www.roblox.com/asset/?id=507777826", weight = 10 } },
	run = { { id = "http://www.roblox.com/asset/?id=507767714", weight = 10 } },
	swim = { { id = "http://www.roblox.com/asset/?id=507784897", weight = 10 } },
	swimidle = { { id = "http://www.roblox.com/asset/?id=507785072", weight = 10 } },
	jump = { { id = "http://www.roblox.com/asset/?id=507765000", weight = 10 } },
	fall = { { id = "http://www.roblox.com/asset/?id=507767968", weight = 10 } },
	climb = { { id = "http://www.roblox.com/asset/?id=507765644", weight = 10 } },
	sit = { { id = "http://www.roblox.com/asset/?id=2506281703", weight = 10 } },
	toolnone = { { id = "http://www.roblox.com/asset/?id=507768375", weight = 10 } },
	toolslash = { { id = "http://www.roblox.com/asset/?id=522635514", weight = 10 } },
	toollunge = { { id = "http://www.roblox.com/asset/?id=522638767", weight = 10 } },
	wave = { { id = "http://www.roblox.com/asset/?id=507770239", weight = 10 } },
	point = { { id = "http://www.roblox.com/asset/?id=507770453", weight = 10 } },
	dance = {
		{ id = "http://www.roblox.com/asset/?id=507771019", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507771955", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507772104", weight = 10 }
	},
	dance2 = {
		{ id = "http://www.roblox.com/asset/?id=507776043", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507776720", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507776879", weight = 10 }
	},
	dance3 = {
		{ id = "http://www.roblox.com/asset/?id=507777268", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507777451", weight = 10 },
		{ id = "http://www.roblox.com/asset/?id=507777623", weight = 10 }
	},
	laugh = { { id = "http://www.roblox.com/asset/?id=507770818", weight = 10 } },
	cheer = { { id = "http://www.roblox.com/asset/?id=507770677", weight = 10 } }
}

function scriptChildModified(p15)
	local v81 = t4[p15.Name]

	if v81 ~= nil then
		configureAnimationSet(p15.Name, v81)
	end
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)

local v23 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil

if v23 then
	local animationTracks = v23:GetPlayingAnimationTracks()

	for _, v in ipairs(animationTracks) do
		v:Stop(0)
		v:Destroy()
	end
end

for k, v in pairs(t4) do
	configureAnimationSet(k, v)
end

local s3 = "None"
local n2 = 0
local n3 = 0
local u32: boolean = false

function stopAllAnimations()
	local v82: string = s2

	if t3[v82] ~= nil and t3[v82] == false then
		v82 = "idle"
	end

	if u32 then
		v82 = "idle"
		u32 = false
	end

	s2 = ""
	u13 = nil

	if u15 ~= nil then
		u15:disconnect()
	end

	if u14 ~= nil then
		u14:Stop()
		u14:Destroy()
		u14 = nil
	end

	if u18 ~= nil then
		u18:disconnect()
	end

	if u17 ~= nil then
		u17:Stop()
		u17:Destroy()
		u17 = nil
	end

	return v82
end
function getHeightScale()
	if not humanoid then
		return getRigScale()
	end

	if not humanoid.AutomaticScalingEnabled then
		return getRigScale()
	end

	local n1 = humanoid.HipHeight / 2

	if scaleDampeningPercent == nil then
		scaleDampeningPercent = script:FindFirstChild("ScaleDampeningPercent")
	end

	if scaleDampeningPercent ~= nil then
		n1 = 1 + (humanoid.HipHeight - 2) * scaleDampeningPercent.Value / 2
	end

	return n1
end

v23 = function(p16)
	local heightScale = getHeightScale()

	return p16 * 1.25 / heightScale
end

local function setRunSpeed(p17)
	local v87 = getHeightScale()
	local n1 = p17 * 1.25 / v87
	local n2 = 0.0001

	v87 = 0.0001

	local n3 = 1

	if n1 <= 0.5 then
		n2 = 1
		n3 = n1 / 0.5
	elseif n1 < 1 then
		local n4 = (n1 - 0.5) / 0.5

		n2 = 1 - n4
		v87 = n4
	else
		n3 = n1 / 1
		v87 = 1
	end

	u14:AdjustWeight(n2)
	u17:AdjustWeight(v87)
	u14:AdjustSpeed(n3)
	u17:AdjustSpeed(n3)
end
function setAnimationSpeed(p18)
	if s2 == "walk" then
		setRunSpeed(p18)
	elseif p18 ~= n1 then
		n1 = p18
		u14:AdjustSpeed(n1)
	end
end
function keyFrameReachedFunc(p19)
	if p19 == "End" then
		if s2 == "walk" then
			if v6 ~= true then
				u17.TimePosition = 0
				u14.TimePosition = 0

				return
			end

			if u17.Looped ~= true then
				u17.TimePosition = 0
			end

			if u14.Looped ~= true then
				u14.TimePosition = 0

				return
			end
		else
			local v94: string = s2

			if t3[v94] ~= nil and t3[v94] == false then
				v94 = "idle"
			end

			if u32 then
				if u14.Looped then
					return
				end

				v94 = "idle"
				u32 = false
			end

			local v95 = n1

			playAnimation(v94, 0.15, humanoid)
			setAnimationSpeed(v95)
		end

		return
	end
end
function rollAnimation(p20)
	local randomNumber = math.random(1, t2[p20].totalWeight)
	local n1: number = 1

	while randomNumber > t2[p20][n1].weight do
		randomNumber -= t2[p20][n1].weight
		n1 += 1
	end

	return n1
end
local function switchToAnim(p21, p22, p23, p24)
	if p21 ~= u13 then
		if u14 ~= nil then
			u14:Stop(p23)
			u14:Destroy()
		end

		if u17 ~= nil then
			u17:Stop(p23)
			u17:Destroy()

			if v6 == true then
				u17 = nil
			end
		end

		n1 = 1
		u14 = p24:LoadAnimation(p21)
		u14.Priority = Enum.AnimationPriority.Core
		u14:Play(p23)
		s2 = p22
		u13 = p21

		if u15 ~= nil then
			u15:disconnect()
		end

		u15 = u14.KeyframeReached:connect(keyFrameReachedFunc)

		if p22 == "walk" then
			local v103 = rollAnimation("run")

			u17 = p24:LoadAnimation(t2.run[v103].anim)
			u17.Priority = Enum.AnimationPriority.Core
			u17:Play(p23)

			if u18 ~= nil then
				u18:disconnect()
			end

			u18 = u17.KeyframeReached:connect(keyFrameReachedFunc)
		end
	end
end
function playAnimation(p25, p26, p27)
	local v107 = rollAnimation(p25)

	switchToAnim(t2[p25][v107].anim, p25, p26, p27)
	u32 = false
end
function playEmote(p28, p29, p30)
	switchToAnim(p28, p28.Name, p29, p30)
	u32 = true
end

local s4 = ""
local u36 = nil
local u37 = nil
local u38 = nil

function toolKeyFrameReachedFunc(p31)
	if p31 == "End" then
		playToolAnimation(s4, 0, humanoid)
	end
end
function playToolAnimation(p32, p33: number, p34, priority)
	local v116 = rollAnimation(p32)
	local anim = t2[p32][v116].anim

	if u37 ~= anim then
		if u36 ~= nil then
			u36:Stop()
			u36:Destroy()
			p33 = 0
		end

		u36 = p34:LoadAnimation(anim)

		if priority then
			u36.Priority = priority
		end

		u36:Play(p33)
		s4 = p32
		u37 = anim
		u38 = u36.KeyframeReached:connect(toolKeyFrameReachedFunc)
	end
end
function stopToolAnimations()
	local v118 = s4

	if u38 ~= nil then
		u38:disconnect()
	end

	s4 = ""
	u37 = nil

	if u36 ~= nil then
		u36:Stop()
		u36:Destroy()
		u36 = nil
	end

	return v118
end
function onRunning(p36)
	local v120 = if v9 then getHeightScale() else 1

	if p36 > (u32 and humanoid.MoveDirection == Vector3.new(0, 0, 0) and humanoid.WalkSpeed / v120 or 0.75) * v120 then
		playAnimation("walk", 0.2, humanoid)
		setAnimationSpeed(p36 / 16)
		s1 = "Running"
	elseif t3[s2] == nil and not u32 then
		playAnimation("idle", 0.2, humanoid)
		s1 = "Standing"
	end
end
function onDied()
	s1 = "Dead"
end
function onJumping()
	playAnimation("jump", 0.1, humanoid)
	n3 = 0.31
	s1 = "Jumping"
end
function onClimbing(p37)
	if v9 then
		local heightScale = getHeightScale()

		p37 /= heightScale
	end

	playAnimation("climb", 0.1, humanoid)
	setAnimationSpeed(p37 / 5)
	s1 = "Climbing"
end
function onGettingUp()
	s1 = "GettingUp"
end
function onFreeFall()
	if n3 <= 0 then
		playAnimation("fall", 0.2, humanoid)
	end

	s1 = "FreeFall"
end
function onFallingDown()
	s1 = "FallingDown"
end
function onSeated()
	s1 = "Seated"
end
function onPlatformStanding()
	s1 = "PlatformStanding"
end
function onSwimming(p38)
	if v9 then
		local heightScale = getHeightScale()

		p38 /= heightScale
	end

	if p38 > 1 then
		playAnimation("swim", 0.4, humanoid)
		setAnimationSpeed(p38 / 10)
		s1 = "Swimming"

		return
	end

	playAnimation("swimidle", 0.4, humanoid)
	s1 = "Standing"
end
function animateTool()
	if s3 == "None" then
		playToolAnimation("toolnone", 0.1, humanoid, Enum.AnimationPriority.Idle)
	elseif s3 == "Slash" then
		playToolAnimation("toolslash", 0, humanoid, Enum.AnimationPriority.Action)
	elseif s3 == "Lunge" then
		playToolAnimation("toollunge", 0, humanoid, Enum.AnimationPriority.Action)

		return
	end
end
function getToolAnim(p39)
	for _, v in ipairs(p39:GetChildren()) do
		if v.Name == "toolanim" and v.className == "StringValue" then
			return v
		end
	end

	return nil
end

local n4 = 0

function stepAnimate(p40)
	local n1 = p40 - n4

	n4 = p40

	if n3 > 0 then
		n3 -= n1
	end

	if s1 == "FreeFall" and n3 <= 0 then
		playAnimation("fall", 0.2, humanoid)
	else
		if s1 == "Seated" then
			playAnimation("sit", 0.5, humanoid)

			return
		end

		if s1 == "Running" then
			playAnimation("walk", 0.2, humanoid)
		elseif s1 == "Dead" or s1 == "GettingUp" or s1 == "FallingDown" or s1 == "Seated" or s1 == "PlatformStanding" then
			stopAllAnimations()
		end
	end

	local tool: Instance = scriptParent:FindFirstChildOfClass("Tool")

	if tool and tool:FindFirstChild("Handle") then
		local toolAnim = getToolAnim(tool)

		if toolAnim then
			s3 = toolAnim.Value
			toolAnim.Parent = nil
			n2 = p40 + 0.3
		end

		if p40 > n2 then
			n2 = 0
			s3 = "None"
		end

		animateTool()

		return
	end

	stopToolAnimations()
	s3 = "None"
	u37 = nil
	n2 = 0
end

humanoid.Died:connect(onDied)
humanoid.Running:connect(onRunning)
humanoid.Jumping:connect(onJumping)
humanoid.Climbing:connect(onClimbing)
humanoid.GettingUp:connect(onGettingUp)
humanoid.FreeFalling:connect(onFreeFall)
humanoid.FallingDown:connect(onFallingDown)
humanoid.Seated:connect(onSeated)
humanoid.PlatformStanding:connect(onPlatformStanding)
humanoid.Swimming:connect(onSwimming)
game:GetService("Players").LocalPlayer.Chatted:connect(function(p41)
	local s2 = ""

	if string.sub(p41, 1, 3) == "/e " then
		s2 = string.sub(p41, 4)
	elseif string.sub(p41, 1, 7) == "/emote " then
		s2 = string.sub(p41, 8)
	end

	if s1 == "Standing" and t3[s2] ~= nil then
		playAnimation(s2, 0.1, humanoid)
	end
end)

script:WaitForChild("PlayEmote").OnInvoke = function(p42)
	if s1 ~= "Standing" then
		return
	end

	if t3[p42] == nil then
		if typeof(p42) == "Instance" and p42:IsA("Animation") then
			playEmote(p42, 0.1, humanoid)

			return true, u14
		end

		return false
	end

	playAnimation(p42, 0.1, humanoid)

	return true, u14
end

if scriptParent.Parent ~= nil then
	playAnimation("idle", 0.1, humanoid)
	s1 = "Standing"
end

while scriptParent.Parent ~= nil do
	local v40, v41 = wait(0.1)

	stepAnimate(v41)
end
