



local tweenService: TweenService = game:GetService("TweenService")
local u2: boolean = false
local t1: {[any]: any} = {}
local t2: {[any]: any} = {}

local function waitForEvent(p1)
	local v7 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v7) ~= "dead" then
			task.spawn(v7, ...)
		end
	end)
	coroutine.yield()
end

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		u2 = false

		for _, v in pairs(t2) do
			v:Cancel()
			v:Destroy()
		end
	end,
	StartBattleBack = function()
		u2 = true

		local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
		local gridPattern = script.parent:FindFirstChild("GridPattern")

		for _, v in pairs(gridPattern:GetChildren()) do
			if not t1[v.Name] then
				t1[v.Name] = v.CFrame.Position
				print(t1)
			end

			task.spawn(function()
				print("start")

				while u2 == true do
					local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y - 400, v.CFrame.Position.Z)
					local v21: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })

					t2[v.Name] = v21
					v21:Play()

					local completed = v21.Completed
					local v23 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v23) ~= "dead" then
							task.spawn(v23, ...)
						end
					end)
					coroutine.yield()
					v.Position = t1[v.Name]
				end
			end)
		end

		local eyePattern = script.parent:FindFirstChild("EyePattern")

		for _, v in pairs(eyePattern:GetChildren()) do
			if not t1[v.Name] then
				t1[v.Name] = v.CFrame.Position
				print(t1)
			end

			local tweenInfo2 = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)

			task.spawn(function()
				print("start")

				while u2 == true do
					local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y - 1000, v.CFrame.Position.Z)
					local v25: Tween = tweenService:Create(v, tweenInfo2, { Position = vector3 })

					t2[v.Name] = v25
					v25:Play()

					local completed = v25.Completed
					local v27 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v27) ~= "dead" then
							task.spawn(v27, ...)
						end
					end)
					coroutine.yield()
					v.Position = t1[v.Name]
				end
			end)
		end
	end
}
