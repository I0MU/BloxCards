



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, 1.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345898480" }, 1.3, 1)

		visualNovel.AskForServerEvent("Proceed")
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
		visualNovel.DisplayText("Arkhivist", "H-Hey! Heyyy! Can you help me with something? Please?")
		visualNovel.SetActorImage(v4, 1)

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 10)
		else
			visualNovel.SetActorImage(v3, 2)
		end

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayMCText("Huh? Sure, what's the matter?")
		elseif visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayMCText("An Arkhivist. What is it?")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.DisplayMCText("Huh?? O_O Oh! Sure, cute stuff! What's up?")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayMCText("Spit it out.")
		else
			visualNovel.DisplayMCText("...What is it?")
		end

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 9)
		else
			visualNovel.SetActorImage(v3, 1)
		end

		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("Arkhivist", "I'm an intern Arkhivist, and the company gave me my own portable drone which was REALLY fun to use!")
		visualNovel.SetActorImage(v4, 3)
		visualNovel.ShakeActor(v4, v4.Position, 0.2, 0.05)
		visualNovel.SetActorImage(v3, 1)
		visualNovel.DisplayText("Arkhivist", "...but, I MAY have accidentally set it to autopilot while on the toilet and subsequently lost it.")
		visualNovel.DisplayText("Arkhivist", "My radar's telling me that it's somewhere near here, but I just moved to Bloxburg so I don't know where anything is... especially while this place is in CHAOS!")
		visualNovel.DisplayText("Arkhivist", "If you spot it, can you like... get it for me? Please? I JUST got this job and I AIN'T gonna lose it!")
		visualNovel.SetActorImage(v4, 1)

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 10)
		else
			visualNovel.SetActorImage(v3, 2)
		end

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayMCText("Sure!")
		elseif visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayMCText("...Alright. I'll keep an eye out.")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.DisplayMCText("Oh dear! :O That sounds bad! Sure, I can help ya out! ^_^")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayMCText("...Fine.")
		else
			visualNovel.DisplayMCText("Sure.")
		end

		if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 9)
		else
			visualNovel.SetActorImage(v3, 1)
		end

		visualNovel.SetActorImage(v4, 4)
		visualNovel.DisplayText("Arkhivist", "Yes! Thank you, so much!!")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.EndCutscene()
	end
}
