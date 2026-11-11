



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, 1.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14346061545" }, -0.2, 1)

		visualNovel.FlipActor(v3)

		local u5: boolean = true

		task.spawn(function()
			while u5 do
				for i = 1, 4 do
					visualNovel.SetActorImage(v4, i)
					task.wait(0.05)
				end
			end
		end)
		visualNovel.MoveActor(v3, 0.5)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.7)
		visualNovel.MoveActor(v4, 0.3)
		visualNovel.SetActorImage(v3, 7)
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("Photographer", "Hey... Hey! Hey! Got the photos? You got the photos?")
		visualNovel.MoveActor(v3, 0.8)
		visualNovel.MoveActor(v4, 0.7)
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("Photographer", "Haha! Yes... Yes! YES!!! Photos! Photos! These are substantial!")
		visualNovel.DisplayText("Photographer", "Take my wares! Take 'em! Take 'em! Substantial wares! These are substantial wares!")
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("Photographer", "You are good! I want more photos! Bring me more! Photos!")
		u5 = false
		visualNovel.FlipActor(v4)
		visualNovel.MoveActor(v4, -0.3)
		visualNovel.DisplayText("", "...")
		visualNovel.ChangeTextItalics(true)

		if visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.SetActorImage(v3, 9)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("", "It didn't even take the camera back.")
		end

		if visualNovel.MainCharacterData.Name == "Kingrin" then
			visualNovel.DisplayText("", "...Annoying brat.")
		elseif visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.SetActorImage(v3, 10)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("", "...Despite everything between you and Devin, you hope he and his family are alright.")
		else
			visualNovel.DisplayText("", "Well, that's that.")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
