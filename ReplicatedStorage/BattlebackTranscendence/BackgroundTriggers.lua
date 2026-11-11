



local u1: boolean = false
local tweenService: TweenService = game:GetService("TweenService")

local function waitForEvent(p1)
	local v6 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v6) ~= "dead" then
			task.spawn(v6, ...)
		end
	end)
	coroutine.yield()
end

local t1: {[any]: any} = {}

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		u1 = false

		for _, v in pairs(t1) do
			v:Cancel()
			v:Destroy()
		end
	end,
	StartBattleBack = function()
		u1 = true

		for _, v in pairs(script.parent.Background:GetChildren()) do
			if string.find(v.Name, "Card") then
				task.spawn(function()
					local tweenInfoNew = TweenInfo.new
					local randomNumber = math.random(6, 8)
					local tweenInfo = tweenInfoNew(randomNumber, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false)
					local n1: number = 2

					if math.random(1, 2) == 1 then
						n1 *= -1
					end

					while u1 == true do
						local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + n1, v.CFrame.Position.Z)
						local v20: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })

						t1[v.Name] = v20
						v20:Play()

						local completed = v20.Completed
						local v22 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v22) ~= "dead" then
								task.spawn(v22, ...)
							end
						end)
						coroutine.yield()

						local vector32 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y - n1, v.CFrame.Position.Z)

						v20 = tweenService:Create(v, tweenInfo, { Position = vector32 })
						t1[v.Name] = v20
						v20:Play()

						local v24 = v20.Completed
						local v25 = coroutine.running()

						v24:Once(function(...)
							if coroutine.status(v25) ~= "dead" then
								task.spawn(v25, ...)
							end
						end)
						coroutine.yield()
					end
				end)
			end

			if string.find(v.Name, "Thing") then
				task.spawn(function()
					local tweenInfoNew = TweenInfo.new
					local randomNumber = math.random(4, 6)
					local tweenInfo = tweenInfoNew(randomNumber, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false)
					local n1: number = 1.5

					if math.random(1, 2) == 1 then
						n1 *= -1
					end

					while u1 == true do
						local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + n1, v.CFrame.Position.Z)
						local v31: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })

						t1[v.Name] = v31
						v31:Play()

						local completed = v31.Completed
						local v33 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v33) ~= "dead" then
								task.spawn(v33, ...)
							end
						end)
						coroutine.yield()

						local vector33 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y - n1, v.CFrame.Position.Z)

						v31 = tweenService:Create(v, tweenInfo, { Position = vector33 })
						t1[v.Name] = v31
						v31:Play()

						local v35 = v31.Completed
						local v36 = coroutine.running()

						v35:Once(function(...)
							if coroutine.status(v36) ~= "dead" then
								task.spawn(v36, ...)
							end
						end)
						coroutine.yield()
					end
				end)
			end
		end

		for _, v in pairs(script.parent:GetChildren()) do
			if v.Name == "SkyOrb" then
				task.spawn(function()
					local tweenInfoNew = TweenInfo.new
					local randomNumber = math.random(55, 70)
					local tweenInfo = tweenInfoNew(randomNumber, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false)

					while u1 == true do
						local x = v.Orientation.X
						local randomNumber2 = math.random(0, 120)
						local y = v.Orientation.Y
						local randomNumber3 = math.random(0, 120)
						local z = v.Orientation.Z
						local randomNumber4 = math.random(0, 120)
						local vector3 = Vector3.new(x + randomNumber2, y + randomNumber3, z + randomNumber4)
						local v47: Tween = tweenService:Create(v, tweenInfo, { Orientation = vector3 })

						t1[v.Name] = v47
						v47:Play()

						local completed = v47.Completed
						local v49 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v49) ~= "dead" then
								task.spawn(v49, ...)
							end
						end)
						coroutine.yield()
					end
				end)
			end
		end
	end
}
