



game:GetService("RunService")

local audioService = require(game.ReplicatedStorage.AudioService)
local scriptParent: Instance = script.Parent
local u3 = nil

return {
	GetCollisionGroup = function(p1)
		u3 = p1
	end,
	ActivatePattern = function()
		local t1: {[any]: any} = { 0, 90 }
		local randomNumber = math.random(1, 1)
		local move: Instance = script.Parent.Parent.Parent:FindFirstChild("Move")
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

		task.wait(0.3)

		for _ = 1, 8 do
			script.Parent.Rotation = t1[randomNumber]

			local n1 = math.random(-3, 3) / 10
			local attackLines: Instance = script.Parent:FindFirstChild("AttackLines")

			attackLines.Position = UDim2.fromScale(n1, 0)

			local warningLines: Instance = script.Parent:FindFirstChild("WarningLines")

			warningLines.Position = UDim2.fromScale(n1, 0)
			script.Parent:FindFirstChild("AttackLines").Visible = false
			script.Parent:FindFirstChild("WarningLines").Visible = true
			script.Parent:FindFirstChild("TargetLineWarning").Visible = true
			script.Parent:FindFirstChild("TargetLineAttack").Visible = false

			if move then
				local targetLineWarning: Instance = script.Parent:FindFirstChild("TargetLineWarning")

				targetLineWarning.Position = UDim2.new(move.Position.X.Scale, 0, -1, 0)

				local targetLineAttack: Instance = script.Parent:FindFirstChild("TargetLineAttack")

				targetLineAttack.Position = UDim2.new(move.Position.X.Scale, 0, -1, 0)
			end

			local attackLines2: Instance = script.Parent:FindFirstChild("AttackLines")

			for _, v in pairs(attackLines2:GetChildren()) do
				task.spawn(function()
					v.LaserImage.Size = UDim2.new(0, 0, 0, 0)

					local damage: NumberValue = Instance.new("NumberValue")

					damage.Name = "Damage"
					damage.Value = 300
					damage.Parent = v
					task.wait(0.5)
					game:GetService("TweenService"):Create(v.LaserImage, tweenInfo, { Size = UDim2.new(1, 0, 1, 0) }):Play()
					task.wait(0.2)

					local u24 = nil

					if u3 then
						u24 = u3:addCollider(v, false)
					end

					task.spawn(function()
						task.wait(0.3)
						print("Destroying")
						u3:removeCollider(u24.instance)
					end)
				end)
			end

			task.spawn(function()
				local targetLineAttack: Instance = script.Parent:FindFirstChild("TargetLineAttack")

				targetLineAttack.LaserImage.Size = UDim2.new(0, 0, 0, 0)

				local damage: NumberValue = Instance.new("NumberValue")

				damage.Name = "Damage"
				damage.Value = 300
				damage.Parent = script.Parent:FindFirstChild("TargetLineAttack")
				task.wait(0.5)

				local tweenService: TweenService = game:GetService("TweenService")
				local laserImage: Instance = script.Parent:FindFirstChild("TargetLineAttack"):FindFirstChild("LaserImage")

				tweenService:Create(laserImage, tweenInfo, { Size = UDim2.new(1, 0, 1, 0) }):Play()
				task.wait(0.2)

				local u29 = nil

				if u3 then
					local v30 = u3
					local targetLineAttack2: Instance = script.Parent:FindFirstChild("TargetLineAttack")

					u29 = v30:addCollider(targetLineAttack2, false)
				end

				task.spawn(function()
					task.wait(0.3)
					print("Destroying")
					u3:removeCollider(u29.instance)
				end)
			end)
			task.spawn(function()
				audioService.PlaySound("WarningBlip")
				task.wait(0.15)
				audioService.PlaySound("WarningBlip")
				task.wait(0.15)
				audioService.PlaySound("WarningBlip")
			end)
			task.wait(0.5)
			script.Parent:FindFirstChild("AttackLines").Visible = true
			script.Parent:FindFirstChild("WarningLines").Visible = false
			script.Parent:FindFirstChild("TargetLineWarning").Visible = false
			script.Parent:FindFirstChild("TargetLineAttack").Visible = true
			task.wait(0.2)

			local u18 = nil

			if u3 then
				local v19 = u3
				local targetLineAttack: Instance = script.Parent:FindFirstChild("TargetLineAttack")

				u18 = v19:addCollider(targetLineAttack, false)
			end

			audioService.PlaySound("small laser attack")
			task.spawn(function()
				task.wait(0.3)
				print("Destroying")
				u3:removeCollider(u18.instance)
			end)
			task.wait(0.4)

			local attackLines3: Instance = script.Parent:FindFirstChild("AttackLines")

			attackLines3.Position = UDim2.fromScale(0, 0)

			local warningLines2: Instance = script.Parent:FindFirstChild("WarningLines")

			warningLines2.Position = UDim2.fromScale(0, 0)
			script.Parent.Position = UDim2.fromScale(0, 0)
		end

		script.Parent:Destroy()
	end
}
