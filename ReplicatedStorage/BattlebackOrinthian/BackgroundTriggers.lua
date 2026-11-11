



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
	viewportFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
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

return {
	OnAddedParticles = function(p1, p2)
		local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
		local glowParts = script.parent:FindFirstChild("GlowParts")

		for _, v in pairs(glowParts:GetChildren()) do
			if p1 == "Red" then
				local color3New = Color3.new
				local v14 = math.clamp(v.Color.R + p2 / 200, 0, 1)
				local v15 = math.clamp(v.Color.G - p2 / 200, 0, 1)
				local v16 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local color3 = color3New(v14, v15, v16)

				tweenService:Create(v, tweenInfo, { Color = color3 }):Play()
			elseif p1 == "Green" then
				local v18 = Color3.new
				local v19 = math.clamp(v.Color.R - p2 / 200, 0, 1)
				local v20 = math.clamp(v.Color.G + p2 / 200, 0, 1)
				local v21 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local v22 = v18(v19, v20, v21)

				tweenService:Create(v, tweenInfo, { Color = v22 }):Play()
			elseif p1 == "Blue" then
				local v23 = Color3.new
				local v24 = math.clamp(v.Color.R - p2 / 200, 0, 1)
				local v25 = math.clamp(v.Color.G - p2 / 200, 0, 1)
				local v26 = math.clamp(v.Color.B + p2 / 100, 0, 1)
				local v27 = v23(v24, v25, v26)

				tweenService:Create(v, tweenInfo, { Color = v27 }):Play()
			else
				local v28 = Color3.new
				local v29 = math.clamp(v.Color.R + p2 / 200, 0, 1)
				local v30 = math.clamp(v.Color.G + p2 / 200, 0, 1)
				local v31 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local v32 = v28(v29, v30, v31)

				tweenService:Create(v, tweenInfo, { Color = v32 }):Play()
			end
		end
	end,
	ResetBattleBack = function()
		local glowParts = script.parent:FindFirstChild("GlowParts")

		for _, v in pairs(glowParts:GetChildren()) do
			if v.Name == "Glow" then
				v.Color = Color3.new(0.180392, 0.309804, 0.4)
			else
				v.Color = Color3.new(0.207843, 0.360784, 0.462745)
			end
		end

		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
		end
	end,
	StartBattleBack = function()
		createScreenColour()
	end
}
