



local t1: {[any]: any} = {}

local function createScreenColour()
	local screenColourBattleback: ScreenGui = Instance.new("ScreenGui")

	screenColourBattleback.Name = "ScreenColourBattleback"
	screenColourBattleback.Parent = game.Players.LocalPlayer.PlayerGui
	screenColourBattleback.IgnoreGuiInset = true
	screenColourBattleback.DisplayOrder = -9

	local viewportFrame: ViewportFrame = Instance.new("ViewportFrame")

	viewportFrame.ZIndex = 0
	viewportFrame.Size = UDim2.new(2, 1, 4, 1)
	viewportFrame.BackgroundColor3 = Color3.fromRGB(250, 50, 50)
	viewportFrame.Transparency = 1
	viewportFrame.Parent = screenColourBattleback
	viewportFrame.Transparency = 0.7
end
local function destroyScreenColour()
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
	end
end

local u4: boolean = false
local tweenService: TweenService = game:GetService("TweenService")

local function waitForEvent(p1)
	local v12 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v12) ~= "dead" then
			task.spawn(v12, ...)
		end
	end)
	coroutine.yield()
end

local t2: {[any]: any} = {}
local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		u4 = false

		for _, v in pairs(t2) do
			v:Cancel()
			v:Destroy()
		end

		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
		end
	end,
	StartBattleBack = function()
		u4 = true

		for _, v in pairs(script.parent:GetChildren()) do
			if v.Name == "Ring" then
				task.spawn(function()
					while u4 == true do
						local v19: Tween = tweenService:Create(v, tweenInfo, { Orientation = Vector3.new(0, -44, -360) })

						t2[v.Name] = v19
						v19:Play()

						local completed = v19.Completed
						local v21 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v21) ~= "dead" then
								task.spawn(v21, ...)
							end
						end)
						coroutine.yield()
						v.Orientation = Vector3.new(0, -44, 0)
					end
				end)
			end

			if v.Name == "Ring2" then
				task.spawn(function()
					while u4 == true do
						local v22: Tween = tweenService:Create(v, tweenInfo, { Orientation = Vector3.new(0, -44, 360) })

						t2[v.Name] = v22
						v22:Play()

						local completed = v22.Completed
						local v24 = coroutine.running()

						completed:Once(function(...)
							if coroutine.status(v24) ~= "dead" then
								task.spawn(v24, ...)
							end
						end)
						coroutine.yield()
						v.Orientation = Vector3.new(0, -44, 0)
					end
				end)
			end
		end

		createScreenColour()
	end
}
