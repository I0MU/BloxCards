



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, 1.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345898480" }, 1.3, 1)

		visualNovel.SetActorImage(v3, 1)
		visualNovel.SetActorImage(v4, 1)
		visualNovel.FlipActor(v3)
		visualNovel.MoveActor(v3, 0.3, 4)
		task.wait(1)
		visualNovel.MoveActor(v4, 0.7, 4)
		visualNovel.DisplayMCText("...")

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 9)
		end

		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("Arkhivist", "Hey! Hey again! Did you get the--")
		visualNovel.SetActorImage(v4, 1)

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 10)
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.SetActorImage(v3, 4)
		else
			visualNovel.SetActorImage(v3, 2)
		end

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayMCText("Drone? Yeah, I've got it right here!")
		elseif visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayMCText("Here it is.")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.DisplayMCText("Yup! ^_^ Here ya go, cutie! -v-")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayMCText("Take your damn drone before I put this sledgehammer in your head.")
		else
			visualNovel.DisplayMCText("I got it.")
		end

		visualNovel.AskForServerEvent("Proceed")

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 9)
		else
			visualNovel.SetActorImage(v3, 1)
		end

		visualNovel.SetActorImage(v4, 4)
		visualNovel.DisplayText("Arkhivist", "Omigosh! You are such a saint! I don't know how I could possibly repay you for this...")
		visualNovel.DisplayText("Arkhivist", "...wait, I know! Here, take something from my equipment bag! Hopefully that'll suffice!")
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("Arkhivist", "Again, thank you! Sorry for the trouble!")
		visualNovel.EndCutscene()
	end
}
