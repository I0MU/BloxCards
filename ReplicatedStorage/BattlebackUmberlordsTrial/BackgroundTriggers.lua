



local tweenService: TweenService = game:GetService("TweenService")
local audioService = require(game.ReplicatedStorage.AudioService)
local u3: boolean = false
local t1: {[any]: any} = {}
local crowd = script.parent:FindFirstChild("Crowd")
local introDoorLeft = script.parent:FindFirstChild("IntroDoorLeft")
local introDoorRight = script.parent:FindFirstChild("IntroDoorRight")
local introDoorLeftDestination = script.parent:FindFirstChild("IntroDoorLeftDestination")
local introDoorRightDestination = script.parent:FindFirstChild("IntroDoorRightDestination")

local function waitForEvent(p1)
	local v13 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v13) ~= "dead" then
			task.spawn(v13, ...)
		end
	end)
	coroutine.yield()
end

local t2: {[any]: any} = {
	LeftDoor = introDoorLeft.CFrame.Position,
	RightDoor = introDoorRight.CFrame.Position
}

return {
	OnAddedParticles = function(_, _)
	end,
	EnemyDeath = function()
		if math.random(1, 4) == 1 then
			audioService.PlaySound("CrowdCheering")
		end
	end,
	ResetBattleBack = function()
		u3 = false

		for _, v in pairs(t1) do
			v:Cancel()
			v:Destroy()
		end

		introDoorLeft.Position = t2.LeftDoor
		introDoorRight.Position = t2.RightDoor
	end,
	StartBattleBack = function()
		u3 = true
		task.spawn(function()
			local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

			task.wait(2)

			local vector3 = Vector3.new(introDoorLeftDestination.CFrame.Position.X, introDoorLeftDestination.CFrame.Position.Y, introDoorLeftDestination.CFrame.Position.Z)
			local v20: Tween = tweenService:Create(introDoorLeft, tweenInfo, { Position = vector3 })
			local vector32 = Vector3.new(introDoorRightDestination.CFrame.Position.X, introDoorRightDestination.CFrame.Position.Y, introDoorRightDestination.CFrame.Position.Z)
			local v22: Tween = tweenService:Create(introDoorRight, tweenInfo, { Position = vector32 })

			audioService.PlaySound("BigDoorCreak")
			v20:Play()
			v22:Play()

			local completed = v22.Completed
			local v24 = coroutine.running()

			completed:Once(function(...)
				if coroutine.status(v24) ~= "dead" then
					task.spawn(v24, ...)
				end
			end)
			coroutine.yield()

			for _, v in pairs(crowd:GetChildren()) do
				task.spawn(function()
					local randomNumber = math.random(1, 2)

					randomNumber = TweenInfo.new(0.1 + randomNumber / 20, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

					local randomNumber2 = math.random(1, 2)

					randomNumber2 = TweenInfo.new(0.1 + randomNumber2 / 20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)

					local vector33 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + 1, v.CFrame.Position.Z)
					local v32: Tween = tweenService:Create(v, randomNumber, { Position = vector33 })
					local vector34 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y, v.CFrame.Position.Z)
					local v34: Tween = tweenService:Create(v, randomNumber2, { Position = vector34 })

					audioService.PlaySound("CrowdCheer")
					audioService.PlaySound("crowd1")

					for _ = 1, 10 do
						v32:Play()

						local completed = v32.Completed
						local v37 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v37) ~= "dead" then
								task.spawn(v37, ...)
							end
						end)
						coroutine.yield()
						v34:Play()

						local v38 = v34.Completed
						local v39 = coroutine.running()

						v38:Once(function(...)
							if coroutine.status(v39) ~= "dead" then
								task.spawn(v39, ...)
							end
						end)
						coroutine.yield()
					end

					v32:Destroy()
					v34:Destroy()
				end)
			end

			task.wait(5.5)

			for _, v in pairs(crowd:GetChildren()) do
				task.spawn(function()
					local randomNumber = math.random(2, 4)
					local tweenInfo2 = TweenInfo.new(randomNumber, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false)
					local randomNumber3 = math.random(2, 4)

					randomNumber3 = TweenInfo.new(randomNumber3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false)

					local vector35 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + 1, v.CFrame.Position.Z)
					local v44: Tween = tweenService:Create(v, tweenInfo2, { Position = vector35 })
					local vector36 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y, v.CFrame.Position.Z)
					local v46: Tween = tweenService:Create(v, randomNumber3, { Position = vector36 })

					while u3 do
						t1[v.Name] = v44
						v44:Play()

						local completed = v44.Completed
						local v48 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v48) ~= "dead" then
								task.spawn(v48, ...)
							end
						end)
						coroutine.yield()
						t1[v.Name .. "End"] = v46
						v46:Play()

						local v49 = v46.Completed
						local v50 = coroutine.running()

						v49:Once(function(...)
							if coroutine.status(v50) ~= "dead" then
								task.spawn(v50, ...)
							end
						end)
						coroutine.yield()
					end
				end)
			end
		end)
	end
}
