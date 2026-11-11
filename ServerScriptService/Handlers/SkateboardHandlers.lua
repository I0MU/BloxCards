--[[ ServerScriptService/Handlers/Skateboardhandlers  (ModuleScript)   -- v2
Server side of the R-key skateboard.

Client (MainClient2) toggles its own state and fires Port:FireServer("Skateboard", on).
On  : clones ReplicatedStorage["Skateboard Stuff"].Skateboard under the player's feet, speeds the player up,
      plays the roll sound ONLY while the player is moving, and sets Character attribute Skateboarding = true
      (the SkateboardPose LocalScript turns that into the riding pose).
Off : removes the board, restores the walk speed, Skateboarding = false.
The board is parented to the Character, so it also disappears when the character respawns.
]]

-- ===== tweak these =====
local SPEED_MULTIPLIER = 1.8      -- walk speed while riding (x the speed the player had when they got on)
local BOARD_YAW = 0               -- degrees; change to 90 / -90 if the board sits sideways
local MOVING_THRESHOLD = 1        -- studs/second above which the roll sound plays
-- R6 characters already get the roll sound from the client (MainClient2 swaps the footstep sound to the same
-- asset, and footsteps only play while moving). Leave false so it doesn't play twice.
local USE_CRUISE_LOOP_ON_R6 = false
-- ========================

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BOARD_NAME = "SkateboardRide"
local riders = {} -- [character] = { humanoid, base, boosted, conns }

local SkateboardHandlers = {}

local function getTemplate()
	local folder = ReplicatedStorage:FindFirstChild("Skateboard Stuff")
	return folder and folder:FindFirstChild("Skateboard")
end

-- Distance from the middle of HumanoidRootPart down to the floor.
local function groundOffset(humanoid, root)
	if humanoid.RigType == Enum.HumanoidRigType.R6 then
		return root.Size.Y / 2 + 2
	end
	return humanoid.HipHeight + root.Size.Y / 2
end

local function removeBoard(character)
	if not character then
		return
	end
	local rec = riders[character]
	if rec then
		riders[character] = nil
		for _, c in ipairs(rec.conns) do
			c:Disconnect()
		end
		-- give the old speed back, unless something else has changed it in the meantime
		if rec.humanoid and rec.humanoid.Parent and math.abs(rec.humanoid.WalkSpeed - rec.boosted) < 0.01 then
			rec.humanoid.WalkSpeed = rec.base
		end
	end
	local old = character:FindFirstChild(BOARD_NAME)
	if old then
		old:Destroy()
	end
	character:SetAttribute("Skateboarding", false)
end

local function addBoard(character)
	removeBoard(character)

	local template = getTemplate()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	if not template or not humanoid or not root or humanoid.Health <= 0 then
		return
	end

	local board = template:Clone()
	board.Name = BOARD_NAME

	local boardPart = board:FindFirstChild("Board", true)
	if not boardPart or not boardPart:IsA("BasePart") then
		warn("[Skateboard] Skateboard model has no 'Board' part")
		board:Destroy()
		return
	end

	for _, d in ipairs(board:GetDescendants()) do
		if d:IsA("BasePart") then
			d.Anchored = false
			d.CanCollide = false
			d.CanTouch = false
			d.CanQuery = false
			d.Massless = true
		elseif d:IsA("Trail") then
			d.Enabled = true
		end
	end

	-- Put the bottom of the whole model (wheels included) on the floor.
	local bboxCF, bboxSize = board:GetBoundingBox()
	local bottomInBoardSpace = boardPart.CFrame:ToObjectSpace(bboxCF).Position.Y - bboxSize.Y / 2
	local c0 = CFrame.new(0, -groundOffset(humanoid, root) - bottomInBoardSpace, 0) * CFrame.Angles(0, math.rad(BOARD_YAW), 0)

	board.Parent = character
	board:PivotTo(root.CFrame * c0)

	local weld = Instance.new("Weld")
	weld.Name = "RideWeld"
	weld.Part0 = root
	weld.Part1 = boardPart
	weld.C0 = c0
	weld.Parent = boardPart

	-- speed
	local base = humanoid.WalkSpeed
	local boosted = base * SPEED_MULTIPLIER
	humanoid.WalkSpeed = boosted
	local rec = { humanoid = humanoid, base = base, boosted = boosted, conns = {} }
	riders[character] = rec

	-- roll sound: only while actually moving
	local loop = board:FindFirstChild("CruiseLoop", true)
	local isR6 = character:FindFirstChild("Torso") ~= nil
	if loop and loop:IsA("Sound") then
		if isR6 and not USE_CRUISE_LOOP_ON_R6 then
			loop:Destroy()
		else
			loop.Looped = true
			loop.Playing = false
			table.insert(rec.conns, humanoid.Running:Connect(function(speed)
				if speed > MOVING_THRESHOLD and humanoid.Health > 0 then
					if not loop.IsPlaying then
						loop:Play()
					end
				elseif loop.IsPlaying then
					loop:Stop()
				end
			end))
		end
	end

	table.insert(rec.conns, humanoid.Died:Connect(function()
		removeBoard(character)
	end))

	character:SetAttribute("Skateboarding", true)
end

function SkateboardHandlers.Init(Network, PlayerData)
	Network.OnFire("Skateboard", function(player, on)
		if type(on) ~= "boolean" then
			return
		end
		local character = player.Character
		if not character then
			return
		end
		if on then
			addBoard(character)
		else
			removeBoard(character)
		end
	end)
end

return SkateboardHandlers