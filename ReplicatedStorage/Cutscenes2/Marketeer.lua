



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14467164634" }, 1.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.3)
		visualNovel.MoveActor(v4, 0.7)
		visualNovel.SetActorImage(v4, 2)

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.SetActorImage(v3, 7)
			visualNovel.DisplayText("Corporate Marketeer", "Ah, the prestigious child prodigy! Need a hand? Biker got your tail? Oh, do I have the deal for you!")
		elseif visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.SetActorImage(v3, 1)
			visualNovel.DisplayText("Corporate Marketeer", "Why, if it isn't our lovely mayor! Need a hand? Biker got your tail? Oh, do I have the deal for you!")
		elseif visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.SetActorImage(v3, 7)
			visualNovel.DisplayText("Corporate Marketeer", "What's up, forest ranger? Need a hand? Biker got your tail? Oh, do I have the deal for you!")
		elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
			visualNovel.SetActorImage(v3, 1)
			visualNovel.DisplayText("Corporate Marketeer", "Well, hello there, you lovely diva! Need a hand? Biker got your tail? Oh, do I have the deal for you!")
		elseif visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayText("Corporate Marketeer", "Hello! Having trouble? Need a hand? Biker got your ta-- Oh, wait... Erm, moving on!")
		else
			visualNovel.DisplayText("Corporate Marketeer", "Hello! Having trouble? Need a hand? Biker got your tail? Oh, do I have the deal for you!")
		end

		visualNovel.SetActorImage(v3, 1)
		visualNovel.DisplayText("Corporate Marketeer", "For the low, low price of one of any type of treasure, you can take THREE of my own!")
		visualNovel.DisplayText("Corporate Marketeer", "One for three! I'm practically scamming myself!")
		visualNovel.DisplayText("Corporate Marketeer", "My treasures are some of the rarest, most coveted wares you can find in Bloxburg. You'll NEVER see these out in the wild!")
		visualNovel.DisplayText("Corporate Marketeer", "So, how about it? Make the deal of a lifetime, or die out there like a dog?")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.SetActorImage(v3, 8)

		if visualNovel.DisplayOptions("Take his offer?", { "Sure", "Nah" }) == 1 then
			visualNovel.SetActorImage(v3, 2)

			if visualNovel.MainCharacterData.Name == "Apollo" then
				visualNovel.DisplayMCText("Hm... Sure!")
			elseif visualNovel.MainCharacterData.Name == "Astarossa" then
				visualNovel.DisplayMCText("Very well.")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayMCText("Sure! Let me see what you're seeling!")
			elseif visualNovel.MainCharacterData.Name == "Fl00fy_Bonez" then
				visualNovel.DisplayMCText("wowza! OwO show me what ya got, sellerman!")
			elseif visualNovel.MainCharacterData.Name == "Kingrin" then
				visualNovel.DisplayMCText("Save the talk and get to selling.")
			else
				visualNovel.DisplayMCText("Sure. What do you have?")
			end

			visualNovel.SetActorImage(v3, 1)
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("Corporate Marketeer", "I knew you would do the right thing! Now let me take a treasure first...")
			visualNovel.SetActorImage(v4, 1)

			if visualNovel.AskForServerEvent("Proceed") then
				visualNovel.SetActorImage(v4, 2)
				visualNovel.DisplayText("Corporate Marketeer", "Splendid! Now take up to three from my rare collection!")
				visualNovel.SetActorImage(v4, 1)
				visualNovel.AskForServerEvent("Proceed")
				visualNovel.SetActorImage(v4, 2)
				visualNovel.DisplayText("Corporate Marketeer", "Pleasure doing business! Have a good day!")
			else
				visualNovel.SetActorImage(v4, 3)
				visualNovel.AskForServerEvent("Poor")
				visualNovel.DisplayText("Corporate Marketeer", "Wait a minute... You don't even have any treasure!")
				visualNovel.SetActorImage(v3, 7)
				visualNovel.SetActorImage(v4, 4)
				visualNovel.ChangeTextBold(true)
				visualNovel.MoveActor(v3, 0.3)
				visualNovel.DisplayText("Corporate Marketeer", "...WHAT THE HELL, MAN?! I'm out here risking my good looks and LIFE trying to make a deal, and you're out here trying to SWINDLE ME?!")
				visualNovel.MoveActor(v4, 0.6)
				visualNovel.DisplayText("Corporate Marketeer", "I'M TRYING TO MAKE IT THROUGH THIS HELLHOLE TOO, YOU KNOW?!")
				visualNovel.MoveActor(v3, 0.25)
				visualNovel.MoveActor(v4, 0.55)
				visualNovel.DisplayText("Corporate Marketeer", "ALL MY SHARES ARE GONE! MY FAMILY BUSINESS IS FILING FOR BANKRUPTCY! MY PENTHOUSE SUITE'S BEEN ROBBED OF EVERYTHING!!!")
				visualNovel.MoveActor(v3, 0.2)
				visualNovel.MoveActor(v4, 0.5)
				visualNovel.DisplayText("Corporate Marketeer", "THE ONLY THING I CAN DO IS SELL THIS... GARBAGE! THAT DAMNED SERUM RUINED MY LIFE!")
				visualNovel.MoveActor(v3, 0.15)
				visualNovel.MoveActor(v4, 0.4)
				visualNovel.DisplayText("Corporate Marketeer", "...and YOU. YOU TRY TO TRICK ME INTO GIVING AWAY FREE STUFF?!")
				visualNovel.SetActorImage(v3, 4)
				visualNovel.MoveActor(v4, 0.35)
				visualNovel.DisplayText("Corporate Marketeer", "I'M GONNA... I'M GONNA...!")
				visualNovel.ChangeTextBold(false)
				visualNovel.SetActorImage(v4, 3)
				visualNovel.DisplayText("Corporate Marketeer", "...Ah, forget it. I don't have the energy to beat you up.")
				visualNovel.SetActorImage(v3, 7)
				visualNovel.DisplayText("Corporate Marketeer", "Go screw yourself.")
				visualNovel.MoveActor(v4, 1.2)
				visualNovel.DisplayText("", "...")

				if visualNovel.MainCharacterData.Name == "Astarossa" then
					visualNovel.SetActorImage(v3, 1)
					visualNovel.DisplayText("", "It would be a good idea to arrange a few disaster support efforts after this.")
				else
					visualNovel.DisplayText("", "Ok...")
				end
			end
		else
			visualNovel.AskForServerEvent("Leave")
			visualNovel.SetActorImage(v3, 1)
			visualNovel.SetActorImage(v4, 3)
			visualNovel.DisplayText("Corporate Marketeer", "Ah... of course you wouldn't...")
		end

		visualNovel.EndCutscene()
	end
}
