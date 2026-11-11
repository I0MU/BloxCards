



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345898887" }, 1.2, 1)

		visualNovel.SetActorImage(v4, 4)
		visualNovel.MoveActor(v3, 0.5)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.3)
		visualNovel.MoveActor(v4, 0.7)

		if visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayText("Parking Lot Attendant", "Ah, Mister Mayor! Sorry I didn't get the chance to thank you earlier for clearing out the lot!")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.DisplayText("Parking Lot Attendant", "Oh, it's you again! Thanks for dealing with the rascals earlier... despite what you did to them afterwards.")
		elseif visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayText("Parking Lot Attendant", "Ah, Apollo Scott! Sorry I didn't thank you for helping us clear out the lot earlier!")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayText("Parking Lot Attendant", "Oh, uhm... hello there! Just... wanted to thank you about getting rid of the... kids... earlier.")
		elseif visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.DisplayText("Parking Lot Attendant", "Oh, it's you again! Didn't expect a forest ranger to come by. You certainly were a big help back at the parking lot!")
		else
			visualNovel.DisplayText("Parking Lot Attendent", "Hey! Thanks for helping clear out the lot earlier!")
		end

		visualNovel.SetActorImage(v4, 3)
		visualNovel.DisplayText("Parking Lot Attendent", "I've recently moved in for work, and well... it certainly didn't end up like I expected it to.")
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("Parking Lot Attendent", "A-Anyways, I'll be happy to return the favor with some stuff we've got at the Lost-and-Found!")
		v3 = visualNovel.DisplayOptions("Obtain a treasure?", { "Sure", "Nah" })

		if v3 == 1 then
			visualNovel.AskForServerEvent("ChooseCard")

			if visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.DisplayText("Parking Lot Attendant", "Here you go, Mr. Mayor! Hopefully it'll be useful!")
			else
				visualNovel.DisplayText("Parking Lot Attendent", "Alright, here ya go!")
			end
		elseif v3 == 2 then
			visualNovel.AskForServerEvent("ChooseNothing")

			if visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.DisplayText("Parking Lot Attendant", "Oh, why thank you for the hospitality, Mr. Mayor!")
			else
				visualNovel.SetActorImage(v4, 3)
				visualNovel.DisplayText("Parking Lot Attendent", "Really? Alright...")
			end
		end

		visualNovel.SetActorImage(v4, 4)

		if visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayText("Parking Lot Attendant", "It's a pleasure meeting you, Sir!")
		else
			visualNovel.DisplayText("Parking Lot Attendent", "I'll see ya around!")
		end

		visualNovel.FadeBlack(0)
		visualNovel.DisplayText("", "...")
		visualNovel.AskForServerEvent("Proceed")

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayText("", "...He tracked you down...")
		else
			visualNovel.DisplayText("", "You are being watched.")
		end

		visualNovel.EndCutscene()
	end
}
