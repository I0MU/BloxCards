



local u1: boolean = false

game:GetService("TweenService")

local function waitForEvent(p1)
	local v5 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v5) ~= "dead" then
			task.spawn(v5, ...)
		end
	end)
	coroutine.yield()
end

local t1: {[any]: any} = {}

TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

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
	end
}
