



local tweenService: TweenService = game:GetService("TweenService")
local u2: boolean = false
local t1: {[any]: any} = {}
local crowd = script.parent:FindFirstChild("Crowd")

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

		for _, v in pairs(t1) do
			v:Cancel()
			v:Destroy()
		end
	end,
	StartBattleBack = function()
		u2 = true

		for _, v in pairs(crowd:GetChildren()) do
			task.spawn(function()
				local randomNumber = math.random(2, 4)
				local tweenInfo = TweenInfo.new(randomNumber, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false)
				local randomNumber2 = math.random(2, 4)

				randomNumber2 = TweenInfo.new(randomNumber2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false)

				local vector3 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y + 1, v.CFrame.Position.Z)
				local v18: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })
				local vector32 = Vector3.new(v.CFrame.Position.X, v.CFrame.Position.Y, v.CFrame.Position.Z)
				local v20: Tween = tweenService:Create(v, randomNumber2, { Position = vector32 })

				while u2 do
					t1[v.Name] = v18
					v18:Play()

					local completed = v18.Completed
					local v22 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v22) ~= "dead" then
							task.spawn(v22, ...)
						end
					end)
					coroutine.yield()
					t1[v.Name] = v20
					v20:Play()

					local v23 = v20.Completed
					local v24 = coroutine.running()

					v23:Once(function(...)
						if coroutine.status(v24) ~= "dead" then
							task.spawn(v24, ...)
						end
					end)
					coroutine.yield()
				end
			end)
		end
	end
}
