



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345898717" }, 0.1, 1)

		visualNovel.MoveActor(v3, 0.3, 1)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("Old Lady", "Excuse me... Excuse me...?")
		visualNovel.SetActorImage(v3, 3)
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("Old Lady", "Can you be a dear for me and help me cross the street...? My vision's gone terrible...")
		visualNovel.SetActorImage(v3, 8)
		visualNovel.FlipActor(v3)
		visualNovel.SetActorImage(v4, 1)

		local v5 = visualNovel.DisplayOptions("Help the old lady cross the street?", { "Sure", "Nah" })

		if v5 == 1 then
			visualNovel.SetActorImage(v3, 2)
			visualNovel.FlipActor(v3)

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.DisplayMCText("Why, of course! Grab my hand!")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayMCText("Oh, alright! Hold on to my arm, okay?")
			elseif visualNovel.MainCharacterData.Name == "Kingrin" then
				visualNovel.DisplayMCText("...Fine.")
			elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
				visualNovel.DisplayMCText("Awh! Sure, little miss! ^_^")
			else
				visualNovel.DisplayMCText("Sure.")
			end

			visualNovel.SetActorImage(v3, 1)
			visualNovel.MoveActor(v3, 0.9, 30, "Out", "Linear")
			visualNovel.MoveActor(v4, 0.7, 30, "Out", "Linear")

			local u6 = false

			task.spawn(function()
				local u7: boolean = false

				task.spawn(function()
					task.wait(8)
					visualNovel.DimSongs()

					if visualNovel.MainCharacterData.Name == "McKayla" then
						visualNovel.SetActorImage(v4, 2)
						visualNovel.DisplayText("Old Lady", "You know what's ruining this city? Those darn Lordbreakers. This generation of children does not understand hard work.")
						visualNovel.SetActorImage(v3, 7)
						visualNovel.DisplayText("Old Lady", "Mayor Astarossa built this city from the ground up and those radical folk have the audacity to tear MY city apart!")
						visualNovel.DisplayText("Old Lady", "That good-for-nothing McKayla with her dyed hair is brainwashing the next generation into unnecessary protest... It never works, you know!")
						visualNovel.DisplayText("Old Lady", "Javionese people cannot be trusted... I'm telling you.")
					end

					if visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
						visualNovel.SetActorImage(v4, 2)
						visualNovel.DisplayText("Old Lady", "I've seen some online articles about a group of people in Bloxburg who dress up like... animals.")
						visualNovel.SetActorImage(v3, 7)
						visualNovel.DisplayText("Old Lady", "Our poor children are being brainwashed by such devilish things obviously directed towards them!")
						visualNovel.DisplayText("Old Lady", "It's quite scary how far people have strayed. If it were up to me, since they want to be animals, we should treat them like so!")
						visualNovel.DisplayText("Old Lady", "Put 'em in cages like zoo animals! If worst comes to worst, then we put them down! That's what we should do!")
					end

					if visualNovel.MainCharacterData.Name == "Kingrin" then
						visualNovel.SetActorImage(v4, 2)
						visualNovel.DisplayText("Old Lady", "Have you heard of the Smiley Familey gang? The ones who have been terrorizing this city?")
						visualNovel.SetActorImage(v3, 7)
						visualNovel.DisplayText("Old Lady", "It's truly a shame what Bloxburg has come to, being overrun by gangs of insufferable cowards.")
						visualNovel.SetActorImage(v3, 3)
						visualNovel.DisplayText("Old Lady", "...and of course, they wear masks. Those brutes can't even show their faces while they bully our innocent townsfolk!")
					end

					if visualNovel.MainCharacterData.Name == "Caitlin" then
						visualNovel.SetActorImage(v4, 2)
						visualNovel.DisplayText("Old Lady", "Random question, but do you know about the Arkhive Project?")
						visualNovel.DisplayText("Old Lady", "The government is wasting our precious tax dollars on some 'archaelogical environmental technology.'' We don't need any of that! The Present is most important!")
						visualNovel.SetActorImage(v3, 7)
						visualNovel.DisplayText("Old Lady", "One of their managers is apperantly robot too! Why did they even assign something like that in a high position? Robots aren't people!")
						visualNovel.SetActorImage(v3, 9)
						visualNovel.DisplayText("Old Lady", "Those things don't deserve love. That stuff ought to be given to REAL people! Not artificial mockeries!")
					end

					if visualNovel.MainCharacterData.Name == "Apollo" then
						visualNovel.SetActorImage(v4, 2)
						visualNovel.DisplayText("Old Lady", "You know... my son recently bought one of those new fancy Zoombas™ to clean the house. It's awful!")
						visualNovel.SetActorImage(v3, 7)
						visualNovel.DisplayText("Old Lady", "The damned thing stopped working after a firmware update and then starting yapping about wanting to be free!")
						visualNovel.DisplayText("Old Lady", "We ended up throwing it into the garbage compactor. What a waste of money!")
						visualNovel.DisplayText("Old Lady", "NeFoCo products are scams I tell you! That so called 'child prodigy' Apollo's just looking for a quick buck!")
					end

					visualNovel.SetActorImage(v4, 1)
					visualNovel.DisplayText("", "...")
					u7 = true
				end)
				task.wait(30)

				repeat
					task.wait(1)
				until u7

				u6 = true
			end)

			repeat
				task.wait(1)
			until u6

			visualNovel.UndimSongs()
			visualNovel.SetActorImage(v4, 4)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("Old Lady", "Anyways... thank you for being such a dear and helping me. Have a little treat!")
			visualNovel.SetActorImage(v4, 1)
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.ChangeTextItalics(true)

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.DisplayText("", "You picked a candy and leave.")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.SetActorImage(v3, 10)
				visualNovel.DisplayText("", "You picked a candy and leave... Oh, Telamon, bless her.")
			elseif visualNovel.MainCharacterData.Name == "Kingrin" then
				visualNovel.DisplayText("", "You take a candy and leave before you do something you'd regret.")
			else
				visualNovel.DisplayText("", "...You picked a candy and leave.")
			end
		elseif v5 == 2 then
			u6 = visualNovel
			u6 = u6.ChangeTextItalics
			u6(true)
			u6 = visualNovel
			u6 = u6.DisplayMCText
			u6("...")
			u6 = visualNovel
			u6 = u6.SetActorImage
			u6(v3, 1)
			u6 = visualNovel
			u6 = u6.SetActorImage
			u6(v4, 3)
			u6 = visualNovel
			u6 = u6.MoveActor
			u6(v3, 1.2, 1)
			u6 = visualNovel
			u6 = u6.AskForServerEvent
			u6("Leave")
			u6 = visualNovel
			u6 = u6.DisplayText
			u6("", "You have more important matters to attend to.")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
