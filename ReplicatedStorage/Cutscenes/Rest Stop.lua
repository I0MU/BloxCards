



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")

		if visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.DisplayText("", "This seems like a safe place to repair your body.")
		else
			visualNovel.DisplayText("", "This seems like a safe place to rest.")
		end

		visualNovel.DisplayText("", "Though, you have a feeling that you may find something useful here.")
		visualNovel.SetActorImage(v3, 8)

		local v4 = visualNovel.DisplayOptions("Rest or Scavenge?", { "Rest", "Scavenge" })

		visualNovel.SetActorImage(v3, 1)

		if v4 == 1 then
			visualNovel.DisplayText("", "...")
			visualNovel.FadeBlack(0)
			task.wait(1.5)
			visualNovel.AskForServerEvent("Rest")
			visualNovel.FadeBlack(1)

			if visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayText("", "Your body's looking better now!")
			else
				visualNovel.DisplayText("", "You feel well rested.")
			end
		elseif v4 == 2 then
			visualNovel.DisplayText("", "You search around the area...")
			visualNovel.MoveActor(v3, 1.2)
			visualNovel.AskForServerEvent("Scavenge")
			visualNovel.DisplayText("", "...and find something interesting.")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
