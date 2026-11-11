



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor({ "rbxassetid://95726526560013" }, 0.3, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://86133757794739" }, 0.6, 1)

		wait(2)
		visualNovel.FlipActor(v3)
		wait(2)
		visualNovel.UnFlipActor(v3)
		wait(2)
		visualNovel.DisplayText("???", " ")
		visualNovel.SetActorImage(v3, 2)
		visualNovel.DisplayText("???", " ")
		visualNovel.UnFlipActor(v3)
		visualNovel.SetActorImage(v3, 3)
		visualNovel.DisplayText("???", " ")
		visualNovel.SetActorImage(v3, 4)
		visualNovel.DisplayText("???", " ")
		visualNovel.Emote(v3, "Surprised")
		visualNovel.MoveActor(v3, 0.7, 2)
		visualNovel.MoveActor(v4, 0.4, 2)
		visualNovel.DisplayText("???", "...")
		visualNovel.SetActorImage(v4, 2)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("???", "Confused test")
		visualNovel.SetActorImage(v4, 3)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("???", "Confused test")
		visualNovel.SetActorImage(v4, 4)
		visualNovel.DisplayText("???", "Confused test")
		visualNovel.Emote(v3, "Confused")
		visualNovel.DisplayText("???", "Angry test")
		visualNovel.Emote(v3, "Angry")
		visualNovel.Emote(v4, "Angry")
		visualNovel.DisplayText("???", "Sad test")
		visualNovel.Emote(v3, "Sad", { -0.2, 0 })
		visualNovel.Emote(v4, "Sad", { -0.3, 0.3 })
		visualNovel.DisplayText("???", "...")
		visualNovel.EndCutscene()
	end
}
