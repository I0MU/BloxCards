



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)

		visualNovel.MoveActor(v3, 0.3)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")
		visualNovel.DisplayText("", "You approach what appears to be a PLURRAL hangout. Weird smells and animal iconography grafted all over the walls.")
		visualNovel.SetActorImage(v3, 8)

		if visualNovel.DisplayOptions("Attempt to scavenge?", { "Sure", "Nah" }) == 1 then
			visualNovel.MoveActor(v3, 0.7)
			visualNovel.SetActorImage(v3, 1)
			visualNovel.DisplayText("", "It doesn't take long for you to notice interesting items in what appears to be a goodie bag. There seems to have been a party here...")
			visualNovel.CreateActor({ "rbxassetid://14346061416" }, -0.2, 1)

			local v4 = visualNovel.CreateActor({ "rbxassetid://14346061416" }, -0.2, 1)

			visualNovel.MoveActor(v4, 0.3, 0.7)
			visualNovel.AskForServerEvent("Rummage1")
			visualNovel.MoveActor(v4, 0.5, 0.7)
			visualNovel.DisplayText("", "...")
			visualNovel.SetActorImage(v3, 4)
			visualNovel.FlipActor(v3)
			visualNovel.MoveActor(v4, 0.4, 0.3)
			visualNovel.PlaySound("dbzswordout")
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.DisplayText("", "...!")
			visualNovel.MoveActor(v4, 0.3, 0.7)
			visualNovel.MoveActor(v3, 0.6, 0.7)
			visualNovel.DisplayText("", "...")
			visualNovel.SetActorImage(v3, 3)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("", "......")
			visualNovel.DisplayText("", "They are just staring. They don't seem to be a threat.")
			visualNovel.SetActorImage(v3, 8)

			if visualNovel.DisplayOptions("Attempt to scavenge again?", { "Sure", "Nah" }) == 1 then
				visualNovel.MoveActor(v3, 0.7, 0.7)
				visualNovel.SetActorImage(v3, 1)
				visualNovel.DisplayText("", "You find another goodie bag.")

				local v5 = visualNovel.CreateActor({ "rbxassetid://14346061416" }, -0.2, 1)
				local v6 = visualNovel.CreateActor({ "rbxassetid://14346061416" }, -0.2, 1)

				visualNovel.MoveActor(v5, 0.1, 0.7)
				visualNovel.MoveActor(v6, 0.2, 0.7)
				visualNovel.AskForServerEvent("Rummage2")
				visualNovel.SetActorImage(v3, 7)
				visualNovel.FlipActor(v3)
				visualNovel.AskForServerEvent("Proceed")
				visualNovel.DisplayText("", "......")
				visualNovel.DisplayText("", "Now would be a good time to leave.")
				visualNovel.ChangeTextItalics(false)
				visualNovel.EndCutscene()

				return
			end

			visualNovel.AskForServerEvent("Leave")
			visualNovel.DisplayText("", "Don't want to risk any more unwanted attention.")
			visualNovel.ChangeTextItalics(false)
			visualNovel.EndCutscene()

			return
		end

		visualNovel.AskForServerEvent("Leave")
		visualNovel.DisplayText("", "Don't want to risk any more unwanted attention.")
		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
