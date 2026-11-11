





local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local guiCollisionService = require(replicatedStorage:WaitForChild("GuiCollisionService"))
local attackTemplates: Instance = replicatedStorage:WaitForChild("AttackTemplates")
local network = require(script.Parent.Network)
local networkClient = network.client
local networkFireServer = network.FireServer
local dodgeMovement = require(script.Parent.DodgeMovement)
local audioService = require(game.ReplicatedStorage.AudioService)
local u9: boolean = false
local dodgeModeUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("DodgeModeUI")
local v11 = guiCollisionService.createCollisionGroup()
local tweenService: TweenService = game:GetService("TweenService")
local dodgeModeUIMove = dodgeModeUI.Move
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear)
local v15: Tween = tweenService:Create(dodgeModeUIMove, tweenInfo, { Position = UDim2.new(1, 0, 0.5, 0) })

print("Running")
v11:addCollider(dodgeModeUI.BorderTop, true)
v11:addCollider(dodgeModeUI.BorderBot, true)
v11:addCollider(dodgeModeUI.BorderLeft, true)
v11:addCollider(dodgeModeUI.BorderRight, true)
v11:addCollider(dodgeModeUI.OuterBorderTop, true)
v11:addCollider(dodgeModeUI.OuterBorderBot, true)
v11:addCollider(dodgeModeUI.OuterBorderLeft, true)
v11:addCollider(dodgeModeUI.OuterBorderRight, true)
v11:addHitter(dodgeModeUI.Move, { v15 })
v11:getHitter(1).CollidersTouched.Event:Connect(function(p1)
	for _, v in pairs(p1) do
		if v:FindFirstChild("Damage") and u9 == false and dodgeMovement.GetMovementState() == false then
			u9 = true
			task.spawn(function()
				local networkClientBattleId = networkClient.battleId
				local damage = v:FindFirstChild("Damage")

				networkFireServer("TakeDodgeModeDamage", networkClientBattleId, damage.Value)
			end)
			audioService.PlaySound("RetroHurt")
			audioService.PlaySound("RetroHurt2")
			task.spawn(function()
				repeat
					task.wait(0.05)
					v11:getHitter(1):FindFirstChild("CharSprite").ImageTransparency = 1
					task.wait(0.05)
					v11:getHitter(1):FindFirstChild("CharSprite").ImageTransparency = 0
				until u9 == false
			end)
			task.spawn(function()
				task.wait(0.5)
				u9 = false
			end)
		end
	end
end)

function networkClient.CreateAttack(p2)
	if not attackTemplates:FindFirstChild(p2) then
		warn("No Attack found")

		return
	end

	local clone: Instance = attackTemplates:FindFirstChild(p2):Clone()
	local bulletLogic = nil

	if clone:FindFirstChild("BulletLogic") then
		bulletLogic = require(clone.BulletLogic)
		bulletLogic.GetCollisionGroup(v11)
	end

	clone.Parent = dodgeModeUI.AttackHolder

	if bulletLogic then
		task.spawn(function()
			bulletLogic.ActivatePattern()
		end)
	end
end

print("Finished loading " .. script.Name)

return {}
