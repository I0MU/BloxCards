



local u1: boolean = false
local tweenService: TweenService = game:GetService("TweenService")

local function waitForEvent(p1)
	local v7 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v7) ~= "dead" then
			task.spawn(v7, ...)
		end
	end)
	coroutine.yield()
end

local t1: {[any]: any} = {}
local tweenInfo = TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

return {
	OnAddedParticles = function(p2, p3)
		print("Script fired")
		TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

		for _, v in pairs(script.Parent:GetChildren()) do
			if v.Name == "Tornado Particle Effect" then
				print("Found")

				local swirl = v:FindFirstChild("A1"):FindFirstChild("Swirl")

				if swirl then
					print("particle found")
				end

				if p2 == "Red" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R + p3 / 1000, swirl.Color.Keypoints[1].Value.G, swirl.Color.Keypoints[1].Value.B))
				elseif p2 == "Green" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R, swirl.Color.Keypoints[1].Value.G + p3 / 1000, swirl.Color.Keypoints[1].Value.B))
				elseif p2 == "Blue" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R, swirl.Color.Keypoints[1].Value.G, swirl.Color.Keypoints[1].Value.B + p3 / 1000))
				else
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R + p3 / 1000, swirl.Color.Keypoints[1].Value.G + p3 / 1000, swirl.Color.Keypoints[1].Value.B))
				end
			end
		end
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

		for _, v in pairs(script.parent:GetChildren()) do
			if v.Name == "Ring" then
				task.spawn(function()
					while u1 == true do
						local v17: Tween = tweenService:Create(v, tweenInfo, { Orientation = Vector3.new(50, -44, -360) })

						t1[v.Name] = v17
						v17:Play()

						local completed = v17.Completed
						local v19 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v19) ~= "dead" then
								task.spawn(v19, ...)
							end
						end)
						coroutine.yield()
						v.Orientation = Vector3.new(50, -44, 0)
					end
				end)
			end
		end
	end
}
