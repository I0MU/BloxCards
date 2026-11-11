



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
	viewportFrame.BackgroundColor3 = Color3.fromRGB(250, 20, 220)
	viewportFrame.Transparency = 1
	viewportFrame.Parent = screenColourBattleback
	viewportFrame.Transparency = 0.7
end
local function destroyScreenColour()
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
	end
end

local tweenService: TweenService = game:GetService("TweenService")
local u5: boolean = false
local t2: {[any]: any} = {}
local t3: {[any]: any} = {}

local function waitForEvent(p1)
	local v12 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v12) ~= "dead" then
			task.spawn(v12, ...)
		end
	end)
	coroutine.yield()
end

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		u5 = false

		for _, v in pairs(t3) do
			v:Cancel()
			v:Destroy()
		end

		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
		end
	end,
	StartBattleBack = function()
		u5 = true

		local tweenInfo = TweenInfo.new(15, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
		local gridPattern = script.parent:FindFirstChild("GridPattern")

		script.parent:FindFirstChild("GridDestinations")

		for _, v in pairs(gridPattern:GetChildren()) do
			if not t2[v.Name] then
				t2[v.Name] = v.CFrame.Position
			end

			task.spawn(function()
				while u5 == true do
					local vector3 = Vector3.new(v.CFrame.Position.X - 101.54, v.CFrame.Position.Y - 18.28, v.CFrame.Position.Z + 108.888)
					local v22: Tween = tweenService:Create(v, tweenInfo, { Position = vector3 })

					t3[v.Name] = v22
					v22:Play()

					local completed = v22.Completed
					local v24 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v24) ~= "dead" then
							task.spawn(v24, ...)
						end
					end)
					coroutine.yield()
					v.Position = t2[v.Name]
				end
			end)
		end

		createScreenColour()
	end
}
