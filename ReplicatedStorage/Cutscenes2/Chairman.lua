



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, 0.3, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14465044732" }, -0.2, 1)

		visualNovel.MoveActor(v3, 0.7, 2)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v4, 0.4, 2)
		visualNovel.SetActorImage(v3, 3)
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("???", "Yo! Wait for me!")
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("???", visualNovel.MainCharacterData.Name .. " is it? Gotta say, big fan of your work.")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.DisplayText("???", "May I join your team? I'm pretty strong!")
		visualNovel.DisplayText("???", "I'm sure you'll be \"glad\" to have me!")
		visualNovel.SetActorImage(v3, 8)
		visualNovel.FlipActor(v3)

		if visualNovel.DisplayOptions("Let him join your team?", { "Sure", "Nah" }) == 1 then
			visualNovel.SetActorImage(v3, 2)
			visualNovel.FlipActor(v3)

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.DisplayMCText("Uhm... okay?")
			elseif visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.DisplayMCText("Of course.")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayMCText("Uh... alright?")
			elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
				visualNovel.DisplayMCText("ur a bit weird... e_e but awwight! ^v^")
			elseif visualNovel.MainCharacterData.Name == "Kingrin" then
				visualNovel.DisplayMCText("...Don't do anything funny.")
			else
				visualNovel.DisplayMCText("S-Sure.")
			end

			visualNovel.AskForServerEvent("Proceed")
			visualNovel.SetActorImage(v3, 1)
			visualNovel.FlipActor(v3)
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("???", "Sweet! Let me... uhh...")
			visualNovel.MoveActor(v4, 0.5)
			visualNovel.SetActorImage(v4, 3)
			visualNovel.SetActorImage(v3, 7)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("???", "Hmmm...")
			visualNovel.SetActorImage(v3, 1)
			visualNovel.SetActorImage(v3, 7)
			visualNovel.FlipActor(v4)
			visualNovel.MoveActor(v4, 0.9)
			visualNovel.DisplayText("???", "Errrr...")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.SetActorImage(v4, 3)
			visualNovel.MoveActor(v4, 0.5)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("???", "Uhhhh...")
			visualNovel.MoveActor(v4, 0.4)
			visualNovel.SetActorImage(v4, 1)
			visualNovel.DisplayText("???", "Yeah... No. This won't do.")
			visualNovel.SetActorImage(v4, 4)
			visualNovel.ChangeTextChairman(true)
			visualNovel.DisplayText("???", "I'LL HAVE TO FIX YOU")
			visualNovel.SetActorImage(v3, 5)
			visualNovel.FlipActor(v3)
			visualNovel.MoveActor(v4, 0.6, 1)
			visualNovel.FadeBlack(0)
			task.spawn(function()
				task.wait(0.5)

				for i = 1, 10 do
					visualNovel.PlaySound("body_impact" .. i % 2 + 1)
					task.wait(0.1)
				end
			end)
			visualNovel.SetActorImage(v3, 6)
			visualNovel.FlipActor(v3)
			visualNovel.SetActorImage(v4, 1)
			visualNovel.ChangeTextChairman(false)
			visualNovel.DisplayText("", "...!")
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.MoveActor(v4, 0.4, 1)
			visualNovel.FadeBlack(1)
			visualNovel.DisplayText("", "You feel... different.")
			visualNovel.DisplayText("", "Your duplicates...! They're gone!")
			visualNovel.DisplayText("???", "Sorry about that. We're good now.")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("???", "Let's go, already! The folks are gonna love this!")
		else
			visualNovel.AskForServerEvent("Leave")
			visualNovel.DisplayText("???", "Aw. Fair enough. Guess I'll join someone else's team. Farewell, " .. visualNovel.MainCharacterData.Name .. "!")
		end

		visualNovel.MoveActor(v4, 1.2, 1)
		visualNovel.EndCutscene()
	end
}
