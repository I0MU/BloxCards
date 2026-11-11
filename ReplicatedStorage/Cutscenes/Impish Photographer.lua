



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
		visualNovel.DisplayText("Photographer", "Hey... Hey! Hey! Come here! Come here!")
		visualNovel.MoveActor(v3, 0.8)
		visualNovel.MoveActor(v4, 0.5)
		visualNovel.DisplayText("Photographer", "Photos! Photos! I need photos! Substantial photos! Photos that will create headlines!")
		visualNovel.AskForServerEvent("Proceed")
		visualNovel.DisplayText("Photographer", "Take this! Bring me photos! I need photos! Substantial photos! Create headlines! Give me photos!")
		u5 = false
		visualNovel.FlipActor(v4)
		visualNovel.MoveActor(v4, -0.3)
		visualNovel.DisplayText("", "...")
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayText("", "Huh. It just gave you a camera and left.")

		if visualNovel.MainCharacterData.Name == "Caitlin" then
			visualNovel.SetActorImage(v3, 9)
			visualNovel.FlipActor(v3)
			visualNovel.DisplayText("", "...It reminds you of your ex-husband...")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
