--[[ StarterPlayer/StarterPlayerScripts/SkateboardPose  (LocalScript)
Plays a skateboard riding pose on every character whose "Skateboarding" attribute is true
(the server handler Skateboardhandlers sets/clears that attribute).

The place file contains no skateboard animation, so by default the pose is BUILT IN CODE (a KeyframeSequence made at
runtime: body turned sideways to the direction of travel like a skater, knees bent, arms out). It is played locally on
each player's screen.
If you have a real skateboard animation, put its id in POSE_ANIMATION_ID and it is used instead.
]]
local Players = game:GetService("Players")
local AnimationClipProvider = game:GetService("AnimationClipProvider")

-- e.g. "rbxassetid://1234567890". Leave "" to use the built-in pose.
local POSE_ANIMATION_ID = ""

-- built-in pose angles (degrees). Flip a sign if a limb bends the wrong way.
-- TURN: how far the body is turned from the direction of travel. 90 = facing the left of the movement direction,
-- -90 = facing the right (the other stance, "goofy"). The board and the movement direction are not affected.
local TURN = 90
local HEAD_LOOK = 0.85  -- fraction of TURN the head turns back so the rider looks where they're going
local LEAN = 12         -- lean toward the direction of travel (R15)
local FRONT_SPREAD = 20 -- how far the front leg is moved out along the board
local BACK_SPREAD = 15  -- back leg
local KNEE = 25         -- knee bend (R15)
local ARM_OUT = 35      -- arms out along the board for balance
local ELBOW = 20

local function ang(x, y, z)
	return CFrame.Angles(math.rad(x or 0), math.rad(y or 0), math.rad(z or 0))
end

local function P(name, cf, ...)
	local p = Instance.new("Pose")
	p.Name = name
	p.CFrame = cf or CFrame.new()
	p.Weight = 1
	for _, child in ipairs({ ... }) do
		child.Parent = p
	end
	return p
end

local function buildTree(isR6)
	if isR6 then
		-- R6: the root joint, neck and the shoulder/hip joints use rotated axes. Rotating the root and neck about local Z
		-- turns them about the vertical axis; rotating shoulders/hips about local X moves arms/legs out to the side.
		return P("HumanoidRootPart", nil,
			P("Torso", ang(0, 0, TURN),
				P("Head", ang(0, 0, -TURN * HEAD_LOOK)),
				P("Left Arm", ang(-ARM_OUT, 0, 0)),
				P("Right Arm", ang(-ARM_OUT, 0, 0)),
				P("Left Leg", ang(-BACK_SPREAD, 0, 0)),
				P("Right Leg", ang(-FRONT_SPREAD, 0, 0))))
	end
	-- R15: the whole body (both legs and the upper body) hangs off LowerTorso, so turning that turns everything.
	-- After the turn, "sideways" for the body is the direction of travel, so the lean is about the body's Z axis.
	local lean = (TURN >= 0) and -LEAN or LEAN
	return P("HumanoidRootPart", nil,
		P("LowerTorso", ang(0, TURN, 0),
			P("UpperTorso", ang(0, 0, lean),
				P("Head", ang(0, -TURN * HEAD_LOOK, 0)),
				P("LeftUpperArm", ang(0, 0, -ARM_OUT),
					P("LeftLowerArm", ang(ELBOW, 0, 0), P("LeftHand"))),
				P("RightUpperArm", ang(0, 0, ARM_OUT),
					P("RightLowerArm", ang(ELBOW, 0, 0), P("RightHand")))),
			P("LeftUpperLeg", ang(0, 0, -BACK_SPREAD),
				P("LeftLowerLeg", ang(-KNEE, 0, 0), P("LeftFoot"))),
			P("RightUpperLeg", ang(0, 0, FRONT_SPREAD),
				P("RightLowerLeg", ang(-KNEE, 0, 0), P("RightFoot")))))
end

local animationIds = {} -- ["R6" | "R15"] = id

local function getAnimationId(isR6)
	if POSE_ANIMATION_ID ~= "" then
		return POSE_ANIMATION_ID
	end
	local key = isR6 and "R6" or "R15"
	if animationIds[key] then
		return animationIds[key]
	end
	local ks = Instance.new("KeyframeSequence")
	ks.Name = "SkateboardPose" .. key
	ks.Loop = true
	ks.Priority = Enum.AnimationPriority.Action4 -- beats the default idle / walk / jump animations
	for _, t in ipairs({ 0, 1 }) do
		local kf = Instance.new("Keyframe")
		kf.Time = t
		buildTree(isR6).Parent = kf
		kf.Parent = ks
	end
	local ok, id = pcall(function()
		return AnimationClipProvider:RegisterAnimationClip(ks)
	end)
	if not ok then
		ok, id = pcall(function()
			return game:GetService("KeyframeSequenceProvider"):RegisterKeyframeSequence(ks)
		end)
	end
	if not ok then
		warn("[SkateboardPose] could not register the pose animation:", id)
		return nil
	end
	animationIds[key] = id
	return id
end

local tracks = {} -- [character] = AnimationTrack

local function stop(character)
	local t = tracks[character]
	if t then
		tracks[character] = nil
		t:Stop(0.2)
		t:Destroy()
	end
end

local function start(character)
	if tracks[character] then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)
	if not humanoid then
		return
	end
	local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
	if not animator or tracks[character] or character:GetAttribute("Skateboarding") ~= true then
		return
	end
	local id = getAnimationId(humanoid.RigType == Enum.HumanoidRigType.R6)
	if not id then
		return
	end
	local anim = Instance.new("Animation")
	anim.AnimationId = id
	local track = animator:LoadAnimation(anim)
	track.Priority = Enum.AnimationPriority.Action4
	track.Looped = true
	tracks[character] = track
	track:Play(0.2)
end

local function watch(character)
	local function apply()
		if character:GetAttribute("Skateboarding") == true then
			task.spawn(start, character)
		else
			stop(character)
		end
	end
	character:GetAttributeChangedSignal("Skateboarding"):Connect(apply)
	character.Destroying:Connect(function()
		stop(character)
	end)
	apply()
end

local function watchPlayer(player)
	player.CharacterAdded:Connect(watch)
	if player.Character then
		watch(player.Character)
	end
end

Players.PlayerAdded:Connect(watchPlayer)
for _, p in ipairs(Players:GetPlayers()) do
	watchPlayer(p)
end