



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.ChangeTextItalics(true)
		visualNovel.DisplayMCText("...")
		visualNovel.SetActorImage(v3, 7)
		visualNovel.MoveActor(v3, 0.4)
		visualNovel.PlaySound("splat.wav")
		visualNovel.DisplayText("", "...!")
		visualNovel.AskForServerEvent("Proceed")

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayText("", "Something stuck to your chair.")
		else
			visualNovel.DisplayText("", "You stepped in some blue goo.")
		end

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayText("", "It appears to be sentient... the constant pulsating seems to imply the process of metamorphosis...")
		else
			visualNovel.DisplayText("", "It looks... alive. That seems to be the only way to explain what you are seeing.")
		end

		if visualNovel.MainCharacterData.Name == "Apollo" then
			visualNovel.DisplayText("", "No point investigating further, though. You have more pressing matters.")
		else
			visualNovel.DisplayText("", "You don't want to investigate any further.")
		end

		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
