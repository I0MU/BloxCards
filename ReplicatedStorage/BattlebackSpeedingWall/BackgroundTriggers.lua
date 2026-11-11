



local tweenService: TweenService = game:GetService("TweenService")
local u2: boolean = false
local t1: {[any]: any} = {}
local tweenInfo = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
local wall = script.parent:FindFirstChild("Wall")
local wallDestination = script.parent:FindFirstChild("WallDestination")
local vector3 = Vector3.new(wallDestination.CFrame.Position.X, wallDestination.CFrame.Position.Y, wallDestination.CFrame.Position.Z)
local v8: Tween = tweenService:Create(wall, tweenInfo, { Position = vector3 })

local function waitForEvent(p1)
	local v11 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v11) ~= "dead" then
			task.spawn(v11, ...)
		end
	end)
	coroutine.yield()
end

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
	end,
	StartBattleBack = function()
		local wall2 = script.parent:FindFirstChild("Wall")

		if not t1[wall2.Name] then
			t1[wall2.Name] = wall2.CFrame.Position
			print(t1)
		end
	end,
	OnLowTime = function()
		u2 = true
		task.spawn(function()
			print("start")
			v8:Play()

			local completed = v8.Completed
			local v16 = coroutine.running()

			completed:Once(function(...)
				if coroutine.status(v16) ~= "dead" then
					task.spawn(v16, ...)
				end
			end)
			coroutine.yield()
			wall.Position = t1[wall.Name]
		end)
	end,
	LowTimeReset = function()
		v8:Cancel()
	end
}
