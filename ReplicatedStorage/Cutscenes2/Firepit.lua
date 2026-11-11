



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "" }, 0.7, 1)

		visualNovel.Effects.Fire(visualNovel.EffectsHolder, v4, v4)
		visualNovel.MoveActor(v3, 0.3)
		visualNovel.DisplayMCText("...")
		visualNovel.DisplayText("", "There is a giant, seemingly abandoned firepit. How irresponsible of the Lordbreakers.")
		visualNovel.DisplayText("", "This would consume anything... or anyone put into it.")
		visualNovel.SetActorImage(v3, 8)
		v4 = visualNovel.DisplayOptions("Feed the fire?", { "Sure", "Nah" })
		visualNovel.SetActorImage(v3, 1)

		if v4 == 1 then
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.DisplayText("", "You feel lighter.")
		else
			visualNovel.AskForServerEvent("Leave")
			visualNovel.DisplayText("", "Nope. You're good.")
		end

		visualNovel.EndCutscene()
	end
}
