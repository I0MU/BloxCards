local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("CollectionService")

local network = require(script.Parent.Network)
local networkClient = network.client
local networkInvokeServer = network.InvokeServer
local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local clamp = require(game.ReplicatedStorage.Utils).Clamp
local audioService = require(game.ReplicatedStorage.AudioService)
local shop = require(script.Parent.Shop)
local data = require(script.Parent.Data)
local raidMenu = require(script.Parent.RaidMenu)
local umberlordMenu = require(script.Parent.UmberlordMenu)
local simulatorMenu = require(script.Parent.SimulatorMenu)
local dataUpdateCashMoney = data.UpdateCashMoney

require(replicatedStorage.Maid)

local npcFuncs = require(script.Parent.Dialog2.NPCFuncs)
local aife = require(script.Parent.Aife)

require(script.Parent.Engines)

local t1: {[any]: any} = { Visible = false }
local visGuiBattle = visGui.Battle
local u21 = nil
local u22 = nil
local u23 = nil
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = nil
local u28 = workspace.Duelists:GetChildren()
t1 = {}
local scriptDuelistTemplate = script.DuelistTemplate
local dialog2 = require(script.Parent.Dialog2)
local t2: {[any]: any} = {}

local function UpdateDuelist(p1, p2)
	local u43: boolean = false
	local u44: boolean = false
	local v45 = data.GetQuestStats()
	local foundChild = p1:FindFirstChild("NPCIcon", true)

	if foundChild then
		local v47 = p1:FindFirstChild("Duelist") and p1.Duelist.Value or p1.Name
		local type = foundChild:GetAttribute("Type")

		if (type == "StartFight" or type == "StartPuzzle") and v45 and v45["BOT_WINS_" .. v47] and v45["BOT_WINS_" .. v47] > 0 then
			foundChild.Icon.ImageColor3 = Color3.fromRGB(120, 120, 120)
			u44 = true
		end
	end

	if t2[p1] then
		return
	end

	task.spawn(function()
		if p2 then
			p1:WaitForChild("HumanoidRootPart")
		end

		-- FASTER LOAD: checked once a second and always waited the first second even if the part was already there; now checks immediately and polls 10x faster
		while not (p1.PrimaryPart or p1:FindFirstChild("Torso")) do
			task.wait(0.1)
		end

		if p1.PrimaryPart and p1.PrimaryPart.Anchored == true or p1:FindFirstChild("Torso") and p1:FindFirstChild("Torso").Anchored == true then
			local v67 = p1.PrimaryPart or p1.Torso

			if p1.PrimaryPart and p1.PrimaryPart.Anchored == true then
				v67 = p1.PrimaryPart
			elseif p1:FindFirstChild("Torso") and p1:FindFirstChild("Torso").Anchored == true then
				v67 = p1.Torso
			else
				warn(p1.Name .. " Does not have a valid anchored torso or primary part set for proximity prompt.")
			end

			if not t2[p1] then
				t2[p1] = v67.ProximityPrompt.Triggered:Connect(function()
					if networkClient.IsSubPlayer() then
						networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

						return
					end

					print("Debugging Dialogue")

					if u43 == false then
						u43 = true

						local v71 = nil

						if u44 then
							v71 = "StartBeaten"
						end

						audioService.PlaySound("click1")
						dialog2.StartDialogue(p1, v71)
						wait(3)
						u43 = false
					end
				end)
			end

			if p1:FindFirstChild("Idle") then
				local v68 = p1.Humanoid:GetPlayingAnimationTracks()

				for _, v in pairs(v68) do
					v:Stop()
				end

				v68 = p1.Humanoid.Animator:LoadAnimation(p1.Idle)
				v68.Looped = true
				v68:Play()
			end
		end
	end)
end
function networkClient.UpdateDuelists()
	u28 = workspace.Duelists:GetChildren()

	for _, v in pairs(u28) do
		UpdateDuelist(v)
	end
end
local function SetWalkSpeed(walkSpeed)
	if walkSpeed == "stored" then
		SetWalkSpeed(u24)
	elseif u22 and walkSpeed then
		u22.WalkSpeed = walkSpeed
	end
end
local function StoreWalkSpeed(p4)
	u24 = p4
end

StoreWalkSpeed = function()
	return u22.WalkSpeed
end

local n1 = 0

local function TorsoTouched(p5)
	if tick() - n1 < 0.2 then
		return
	end

	if not p5 then
		return
	end

	if p5:IsDescendantOf(workspace.Audio) then
		if not not transition.BattleBackVisible() or not handy.Visible() then
			return
		end

		local v54 = p5:FindFirstChild("Song") and p5.Song.Value or p5.Name

		if v54 ~= audioService.currentsong then
			audioService.ChangeSong(v54)
		end
	elseif p5.Name == "Codes" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		shop.ShowShop(nil, "Codes")
	elseif p5.Name == "Shop" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		local PackValue = nil

		if p5:FindFirstChild("Pack") then
			PackValue = p5.Pack.Value
		end

		shop.ShowShop(PackValue)
	elseif p5.Name == "EventShop" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		shop.ShowEventShop()
	elseif p5.Name == "RaidMenu" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		local s1 = ""

		if p5:FindFirstChild("Raid") then
			s1 = p5:FindFirstChild("Raid").Value
		end

		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		raidMenu.OpenRaidMenu(s1)
	elseif p5.Name == "DoomspireRaid" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		networkClient.OpenDoomspireRaids()
	elseif p5.Name == "Aife" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if handy.Visible() then
			aife.Show()
		end
	elseif p5.Name == "UmberlordTrial" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		umberlordMenu.OpenMenu()
	elseif p5.Name == "BattleSimulator" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if not handy.Visible() then
			return
		end

		simulatorMenu.OpenMenu()
	elseif p5.Name == "Bumper" then
		u23.Velocity = p5.CFrame:vectorToWorldSpace(Vector3.new(0, 1, 0)) * p5.Power.Value
		task.wait(0.25)
	elseif p5.Name == "ApplyLoon" then
		if u25 then
			return
		end

		local v57, v58 = networkInvokeServer("ApplyBalloon", u21, nil, u25, u26)

		u25 = v57
		u26 = v58
	elseif p5.Name == "RemoveLoon" then
		if not u25 then
			return
		end

		networkInvokeServer("RemoveBalloon", u21, nil, u25, u26)
		u25 = nil
		u26 = nil
	elseif p5.Name == "HistoryChamber" then
		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		networkClient.OpenHistoryChamber()
	else
		if p5.Name ~= "NPCFunc" then
			return
		end

		if networkClient.IsSubPlayer() then
			networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

			return
		end

		if p5:FindFirstChild("Function") then
			local v59 = p5:FindFirstChild("Function").Value

			print(v59)
			npcFuncs[v59]()
		end
	end

	n1 = tick()
end
local function CharacterAdded(p6)
	u25 = nil
	u26 = nil
	u21 = p6
	u22 = p6:WaitForChild("Humanoid")
	u22:SetStateEnabled("Swimming", false)
	u23 = p6:WaitForChild("HumanoidRootPart")

	if u27 then
		local foundChild = workspace.Spawns:FindFirstChild(u27)

		if foundChild then
			p6:PivotTo(foundChild.CFrame * CFrame.new(0, 2, 0))
		end
	end

	u23.Touched:connect(TorsoTouched)

	for _, v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("AnimationController") and v.AnimationController:FindFirstChild("IdleAnimation") then
			local animationTrack = v.AnimationController.Animator:LoadAnimation(v.AnimationController.IdleAnimation)

			animationTrack.Looped = true
			animationTrack:Play()
		end
	end
end
function networkClient.SetSetSpawn(p7)
	u27 = p7
end

spawn(function()
	local v66 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	CharacterAdded(v66)
end)
LocalPlayer.CharacterAdded:connect(CharacterAdded)

local bindableEvent: BindableEvent = Instance.new("BindableEvent")

bindableEvent.Event:connect(function()
	if not u21 then
		return
	end

	if not handy.Visible() then
		return
	end

	u21.Humanoid.Health = 0
end)

local n2: number = 0

-- FASTER LOAD: this used to task.wait(1) after EVERY attempt, even a successful first one, so requiring Character always cost a full second
-- on the startup path. Now it only waits (and retries, as before) when SetCore actually failed.
repeat
	local v40 = pcall(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", bindableEvent)
	end)

	if v40 then
		break
	end

	task.wait(1)
	n2 += 1
until n2 > 10

print("Finished loading " .. script.Name)

return {}