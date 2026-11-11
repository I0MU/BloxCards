



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")
		visualNovel.SetActorImage(v3, 5)
		visualNovel.ShakeVNInOut(1, 0.005)
		visualNovel.ShakeActorInOut(v3, 1, 0.005)
		visualNovel.PlaySound("Earthquake Debris 5 (SFX)")
		visualNovel.FadeBlack(0)
		visualNovel.DisplayText("", "...!")
		visualNovel.DisplayText("", "A hole grew beneath you.")
		visualNovel.Background.BackgroundTransparency = 0
		visualNovel.SetActorImage(v3, 6)
		visualNovel.FadeBlack(1)
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("", "Everything hurts.")
		visualNovel.DisplayText("", "You find yourself in a secret room.")
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("", "And actually find something very valuable!")

		if visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.SetActorImage(v3, 7)
			visualNovel.DisplayText("", "This place... It's a remnant of the old Demon Wars. The Jestorder had a knack for planting secret rooms underground for their nefarious needs.")
			visualNovel.SetActorImage(v3, 3)
			visualNovel.DisplayText("", "Best if no other secrets become unearthed in this era of chaos.")
		else
			visualNovel.DisplayText("", "The underground of Bloxburg holds many interesting secrets. Imagine what else lies beneath the surface...")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
