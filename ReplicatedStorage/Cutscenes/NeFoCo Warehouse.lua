



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")
		visualNovel.DisplayText("", "You sneak towards a closed off NeFoCo warehouse. Surely a place with many useful tools for the journey.")
		visualNovel.DisplayText("", "You know for a fact NeFoCo stores many amenities in these storage crates. The storage crates are very secure, but you are sure you can break through with brute force.")
		visualNovel.SetActorImage(v3, 8)

		if visualNovel.DisplayOptions("Attempt to open a crate?", { "Sure", "Nah" }) == 1 then
			visualNovel.AskForServerEvent("Rummage1")
			visualNovel.SetActorImage(v3, 6)
			visualNovel.PlaySound("body_impact")
			visualNovel.ShakeActor(v3, v3.Position, 0.2, 0.1)

			if visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayText("", "You use your mechanical arms to open the crate.")
			else
				visualNovel.DisplayText("", "You violently use your whole body to force the crate open.")
			end

			visualNovel.AskForServerEvent("Proceed")
			visualNovel.DisplayText("", "A valuable item sits inside. You take it.")

			if visualNovel.MainCharacterData.Name == "Kingrin" then
				visualNovel.DisplayText("", "There's more crates to work with. Though, you strained yourself more than you thought you would.")
			elseif visualNovel.MainCharacterData.Name == "Caitlin" then
				visualNovel.DisplayText("", "There's more crates to work with. Though, your mechanical arms seem to have gotten stiff.")
			else
				visualNovel.DisplayText("", "There's more crates to work with. Though, you feel sore from opening the last one.")
			end

			if visualNovel.DisplayOptions("Attempt to open a crate?", { "Sure", "Nah" }) == 1 then
				visualNovel.AskForServerEvent("Rummage2")
				visualNovel.PlaySound("body_impact")
				visualNovel.ShakeActor(v3, v3.Position, 0.3, 0.2)

				if visualNovel.MainCharacterData.Name == "Caitlin" then
					visualNovel.DisplayText("", "You open another crate. You hear the sound of gritting metal from your joints.")
				else
					visualNovel.DisplayText("", "You thrash the crate open. It takes a few tries but you manage to wittle it open.")
				end

				visualNovel.AskForServerEvent("Proceed")
				visualNovel.DisplayText("", "A valuable item sits inside. You take it.")

				if visualNovel.MainCharacterData.Name == "Kingrin" then
					visualNovel.DisplayText("", "There's more crates to work with... your muscles feel like they're about to be torn if you continue.")
				elseif visualNovel.MainCharacterData.Name == "Caitlin" then
					visualNovel.DisplayText("", "There's more crates to work with... but those noises from your arms don't make you optimistic.")
				else
					visualNovel.DisplayText("", "There's more crates to work with... though you are beyond exhausted.")
				end

				if visualNovel.DisplayOptions("Attempt to open a crate?", { "Sure", "Nah" }) == 1 then
					visualNovel.AskForServerEvent("Rummage3")
					visualNovel.PlaySound("body_impact")
					visualNovel.ShakeActor(v3, v3.Position, 0.4, 0.3)

					if visualNovel.MainCharacterData.Name == "Caitlin" then
						visualNovel.DisplayText("", "You hear sounds of electrical cracking from your arms... The motors seem to be nearly broken. Still, you've managed to open the crate.")
					else
						visualNovel.DisplayText("", "Your body aches in agony as it prys the crate open. You can't even feel your arms. Still, after awhile, you open the crate.")
					end

					visualNovel.AskForServerEvent("Proceed")
					visualNovel.DisplayText("", "A valuable item sits inside. You take it.")
					visualNovel.DisplayText("", "You've had enough. You are leaving.")
					visualNovel.ChangeTextItalics(false)
					visualNovel.EndCutscene()

					return
				end

				visualNovel.AskForServerEvent("Leave")
				visualNovel.DisplayText("", "Now seems like a good time to leave.")
				visualNovel.ChangeTextItalics(false)
				visualNovel.EndCutscene()

				return
			end

			visualNovel.AskForServerEvent("Leave")
			visualNovel.DisplayText("", "Now seems like a good time to leave.")
			visualNovel.ChangeTextItalics(false)
			visualNovel.EndCutscene()

			return
		end

		visualNovel.AskForServerEvent("Leave")
		visualNovel.DisplayText("", "Now seems like a good time to leave.")
		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
