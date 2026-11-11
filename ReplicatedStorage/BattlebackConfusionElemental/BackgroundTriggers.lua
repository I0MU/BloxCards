



local function createScreenColour()
	local screenColourBattleback: ScreenGui = Instance.new("ScreenGui")

	screenColourBattleback.Name = "ScreenColourBattleback"
	screenColourBattleback.Parent = game.Players.LocalPlayer.PlayerGui
	screenColourBattleback.IgnoreGuiInset = true
	screenColourBattleback.DisplayOrder = -9

	local viewportFrame: ViewportFrame = Instance.new("ViewportFrame")

	viewportFrame.ZIndex = 0
	viewportFrame.Size = UDim2.new(2, 1, 4, 1)
	viewportFrame.BackgroundColor3 = Color3.fromRGB(120, 250, 120)
	viewportFrame.Transparency = 1
	viewportFrame.Parent = screenColourBattleback
	viewportFrame.Transparency = 0.7
end
local function destroyScreenColour()
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
	end
end

return {
	OnAddedParticles = function(_, _)
	end,
	StartBattleBack = function()
		createScreenColour()
	end,
	ResetBattleBack = function()
		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback") then
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenColourBattleback"):Destroy()
		end
	end
}
