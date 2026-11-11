



local creditsUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CreditsUI")
local transition = require(script.Parent.Transition)
local audioService = require(game.ReplicatedStorage.AudioService)
local client = require(script.Parent.Network).client

return {
	PlayCredits = function()
		transition.ShowNewBattleBack("LoomingSpire")
		transition.ChangeBattleBackground("LoomingSpire")
		creditsUI.CreditHolder.Position = UDim2.new(0.5, 0, 0.4, 0)
		creditsUI.Enabled = true
		transition.ToggleBlack(-1, 0.3)
		audioService.ChangeSong("DSCredits", { TimePosition = 0 })
		task.wait(1)
		creditsUI.DisplayOrder = 20001

		local tweenInfo = TweenInfo.new(120, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

		game:GetService("TweenService"):Create(creditsUI.CreditHolder, tweenInfo, { Position = UDim2.new(0.5, 0, -9, 0) }):Play()
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("GreatJusticeCity")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("MistsofDisregard")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("WonktoothsThroneroom")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("ImperiumCity")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("NoumenChambers")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("SpireSanctum")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(14)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("SpireBaseplate")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(9)
		transition.ToggleBlack(1, 0.3)
		task.wait(0.3)
		transition.ChangeBattleBackground("Toolbox")
		task.wait(0.3)
		transition.ToggleBlack(-1, 0.3)
		task.wait(11)
		creditsUI.DisplayOrder = 10
		creditsUI.Enabled = false
		client.DisplayIntro(true, "DoomspireAct2")
	end
}
