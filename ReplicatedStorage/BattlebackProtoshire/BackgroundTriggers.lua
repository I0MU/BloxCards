



game:GetService("TweenService")

local t1: {[any]: any} = {}
local t2: {[any]: any} = {}

local function waitForEvent(p1)
	local v5 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v5) ~= "dead" then
			task.spawn(v5, ...)
		end
	end)
	coroutine.yield()
end

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		for i = 1, #t2 do
			t2[i]:Stop()
		end
	end,
	StartBattleBack = function()
		for _, v in pairs(script.Parent:GetChildren()) do
			if v:FindFirstChild("AnimationController") and v.AnimationController:FindFirstChild("IdleAnimation") then
				local animationTrack = v.AnimationController.Animator:LoadAnimation(v.AnimationController.IdleAnimation)

				animationTrack.Looped = true
				animationTrack:Play()
				table.insert(t2, animationTrack)
			end
		end
	end
}
