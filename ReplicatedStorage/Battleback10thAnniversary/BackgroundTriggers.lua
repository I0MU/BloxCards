



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

		local tweenInfo = TweenInfo.new(45, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
		local backgroundPattern = script.parent:FindFirstChild("BackgroundPattern")

		for _, v in pairs(backgroundPattern:GetChildren()) do
			if not t1[v.Name] then
				t1[v.Name] = v.CFrame.Position
				print(t1)
			end

			task.spawn(function()
				print("start")

				while u2 == true do
					local vector3 = Vector3.new(v.CFrame.Position.X + 102.625, v.CFrame.Position.Y + 4.33, v.CFrame.Position.Z + 105.622)
					local v17: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })

					t2[v.Name] = v17
					v17:Play()

					local completed = v17.Completed
					local v19 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v19) ~= "dead" then
							task.spawn(v19, ...)
						end
					end)
					coroutine.yield()
					v.Position = t1[v.Name]
				end
			end)
		end
	end
}
