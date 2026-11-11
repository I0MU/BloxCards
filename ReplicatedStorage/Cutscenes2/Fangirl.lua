



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, 0.5, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14419945342" }, 1.2, 1)

		visualNovel.SetActorImage(v4, 1)
		visualNovel.MoveActor(v3, 0.5)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.3)
		visualNovel.MoveActor(v4, 0.7)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("???", "Heyyy! What's up?")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.SetActorImage(v3, 2)

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayMCText("Uh... hello? What do you want?")
		elseif visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayMCText("...Do you want something?")
		elseif visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.DisplayMCText("Is something the matter?")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.DisplayMCText("huh? O_o what is it?")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayMCText("...What do you want?")
		else
			visualNovel.DisplayMCText("...the hell is that outfit...? What do you want?")
		end

		visualNovel.SetActorImage(v3, 1)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("???", "What do I want? Haha! What do I want?! I want Thec of course!")
		visualNovel.SetActorImage(v4, 1)

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DimSongs()
			visualNovel.SetActorImage(v3, 7)
			visualNovel.DisplayMCText("...Thec... Hiller...?")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("President of Thec's Fanclub", "Yup! I'm the president of his fan club! We track his movements and--")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.DisplayMCText("You know where he is?")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("President of Thec's Fanclub", "...Are you even listening? Yes, we--")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.DisplayMCText("Where is he?")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("President of Thec's Fanclub", "Hey! We only dox the haters! Only people who are in the club have access t--")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.SetActorImage(v3, 4)
			visualNovel.DisplayMCText("Let me in. NOW!")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("President of Thec's Fanclub", "Slow down man...! You do seem like an eager person, so sure! Take a reward for new members!")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("President of Thec's Fanclub", "His whereabouts and potential locations are listed in the fan Telegram page if--")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.MoveActor(v3, 1.2)
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.DisplayText("", "...")
			visualNovel.SetActorImage(v4, 3)
			visualNovel.DisplayText("???", "Huh, must be a really big fan!")
			visualNovel.UndimSongs()
		else
			visualNovel.SetActorImage(v3, 7)
			visualNovel.DisplayMCText("...What?")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("???", "What do you mean, what? I am LITERALLY the president of his fanclub! I even maintain his merch! But of course, you are a normie so you wouldn't get it.")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.SetActorImage(v3, 8)

			if visualNovel.DisplayOptions("What is your response to this?", {
				if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then "not my type... -n-" else "Yeah, you're just weird.",
				"Actually, I am quite the fan."
			}) == 1 then
				visualNovel.SetActorImage(v3, 1)
				visualNovel.AskForServerEvent("Leave")
				visualNovel.SetActorImage(v4, 2)
				visualNovel.DisplayText("President of Thec's Fanclub", "Well, I think he's awesome. Also you smell bad. I'm leaving.")
				visualNovel.SetActorImage(v3, 7)
			else
				visualNovel.SetActorImage(v3, 1)
				visualNovel.SetActorImage(v4, 2)
				visualNovel.DisplayText("President of Thec's Fanclub", "Oh yeah? Then what is your favorite thing about him?")
				visualNovel.SetActorImage(v3, 8)

				local n1

				if visualNovel.MainCharacterData.Name == "Astarossa" then
					local v7 = visualNovel.DisplayOptions("What is your response to this?", { "Unwavering work ethic", "Attention to detail" })

					visualNovel.SetActorImage(v3, 2)

					if v7 == 1 then
						visualNovel.DisplayMCText("His unwavering work ethic.")
					else
						visualNovel.DisplayMCText("His attention to detail.")
					end

					n1 = 1
				else
					n1 = visualNovel.DisplayOptions("What is your favorite thing about Thec?", { "Dreamy eyes", "That smile" })
					visualNovel.SetActorImage(v3, 2)

					if n1 == 1 then
						visualNovel.DisplayMCText("Uhh.. Dreamy eyes? I guess?")
					elseif n1 == 2 then
						visualNovel.DisplayMCText("Uhh.. That smile? I guess?")
					end
				end

				if n1 == 1 then
					visualNovel.SetActorImage(v3, 1)
					visualNovel.SetActorImage(v4, 3)
					visualNovel.DisplayText("President of Thec's Fanclub", "Good choice! Though, his best feature has got to be his smile... God his teeth shine like the background after I get disconnected in battle...")
				else
					visualNovel.SetActorImage(v3, 7)
					visualNovel.SetActorImage(v4, 4)
					visualNovel.ShakeActor(v4, v4.Position, 0.2, 0.05)
					visualNovel.DisplayText("President of Thec's Fanclub", "KALSDJLKASJDLKASJDJKLDJKASJDKLSAJKLJ NO WAYY THATS ALSO MY OBSESSION, HIS SMILE IS SO PRETTYYYYYYYYY WE ARE LIKE THE SAME THO...")
					visualNovel.SetActorImage(v4, 3)
					visualNovel.DisplayText("President of Thec's Fanclub", "Phew... Let me relax a bit...")
				end

				visualNovel.SetActorImage(v4, 2)
				visualNovel.DisplayText("President of Thec's Fanclub", "Anyways, wanna join the fanclub? We have a dedicated team of workers tracking his movement and we give out goodies for new members!")
				visualNovel.SetActorImage(v3, 8)
				visualNovel.SetActorImage(v4, 1)

				local v8 = visualNovel.DisplayOptions("Join the club?", { "Sure", "Nah" })

				visualNovel.SetActorImage(v3, 1)

				if v8 == 1 then
					visualNovel.SetActorImage(v4, 2)
					visualNovel.DisplayText("President of Thec's Fanclub", "Aha! Welcome welcome! Please, take a welcoming gift!")
					visualNovel.SetActorImage(v4, 1)
					visualNovel.AskForServerEvent("Proceed")
					visualNovel.SetActorImage(v4, 2)
					visualNovel.DisplayText("President of Thec's Fanclub", "Be sure to join our fan page and the fan Telegram for Thec updates, we are always on the look out!")
					visualNovel.SetActorImage(v4, 1)
					visualNovel.AskForServerEvent("Proceed")
					visualNovel.DisplayText("", "Someone is tracking you down.")
				else
					visualNovel.AskForServerEvent("Leave")
					visualNovel.SetActorImage(v4, 2)
					visualNovel.DisplayText("President of Thec's Fanclub", "Pfft, fine! You are missing out though!")
				end
			end
		end

		visualNovel.SetActorImage(v4, 1)
		visualNovel.MoveActor(v4, -0.2)
		visualNovel.EndCutscene()
	end
}
