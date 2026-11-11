



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345899086" }, 1.2, 1)

		visualNovel.MoveActor(v3, 0.2)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.4)
		visualNovel.DisplayText("", "...")
		visualNovel.MoveActor(v4, 0.7, 5)
		visualNovel.SetActorImage(v3, 3)
		visualNovel.DisplayText("", "...!")
		visualNovel.ChangeTextItalics(false)

		if visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayText("???", "...N-No! Please! D-Don't hurt me! PLEASE!")
		else
			visualNovel.DisplayText("???", "H-Help me... please...")
		end

		visualNovel.SetActorImage(v3, 1)
		visualNovel.DisplayText("", "It's a heavily wounded Smiley.")
		visualNovel.DisplayText("", "Nobody is nearby, and they are clearly holding something valuable.")
		visualNovel.SetActorImage(v3, 8)

		local v5 = visualNovel.DisplayOptions("Help or Finish?", { "Help", "Finish" })

		if v5 == 1 then
			visualNovel.AskForServerEvent("Save")
			visualNovel.SetActorImage(v3, 2)

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.DisplayMCText("Come with us. We'll get you help.")
			elseif visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.DisplayMCText("Don't worry, I won't hurt you. Come on, let's get you home.")
			elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
				visualNovel.DisplayMCText("O_O OMG! You look AWFUL! Come with us, we can get you fixed in a jiffy!")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayMCText("Oh goodness, those wounds look terrible! Come with me!")
			else
				visualNovel.DisplayMCText("Sure. Come on now.")
			end
		elseif v5 == 2 then
			visualNovel.SetActorImage(v3, 4)
			visualNovel.FadeBlack(0)
			visualNovel.DisplayText("", "...")

			for i = 1, 4 do
				visualNovel.PlaySound("body_impact" .. i % 2 + 1)
				task.wait(0.3)

				if i == 2 then
					visualNovel.PlaySound("SwordImpact")
				end
			end

			v4:Destroy()
			visualNovel.AskForServerEvent("Finish")

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.SetActorImage(v3, 3)
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.SetActorImage(v3, 10)
			elseif visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.SetActorImage(v3, 1)
			end

			visualNovel.FadeBlack(1)

			if visualNovel.MainCharacterData.Name == "Apollo" or visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayText("", "That felt... awful.")
			elseif visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.SetActorImage(v3, 8)
				visualNovel.DisplayText("", "...Do you enjoy striking down helpless individuals?")
			else
				visualNovel.DisplayText("", "They went down without a fight.")
			end

			visualNovel.AskForServerEvent("Proceed")
			visualNovel.DisplayText("", "You take the treasure from their hands.")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
