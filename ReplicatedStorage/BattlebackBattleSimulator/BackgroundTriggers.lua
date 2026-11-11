



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

		for _, v in pairs(script.parent:GetChildren()) do
			if string.find(v.Name, "Platform") then
				task.spawn(function()
					local n1: number = 1

					if math.random(1, 2) == 1 then
						n1 *= -1
					end

					while u2 == true do
						local tweenInfoNew = TweenInfo.new
						local randomNumber = math.random(5, 8)
						local tweenInfo = tweenInfoNew(randomNumber, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false)
						local randomNumber2 = math.random(1, 10)
						local n2 = n1 * (randomNumber2 / 10)
						local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + n2, v.CFrame.Position.Z)
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

						local vector32 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y - n2, v.CFrame.Position.Z)

						v21 = tweenService:Create(v, tweenInfo, { Position = vector32 })
						t2[v.Name] = v21
						v21:Play()

						local v25 = v21.Completed
						local v26 = coroutine.running()

						v25:Once(function(...)
							if coroutine.status(v26) ~= "dead" then
								task.spawn(v26, ...)
							end
						end)
						coroutine.yield()
					end
				end)
			end
		end
	end
}
