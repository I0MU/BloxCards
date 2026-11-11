



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		local v3 = visualNovel.CreateActor(visualNovel.MainCharacterData.Images, -0.2, 1)
		local v4 = visualNovel.CreateActor({ "rbxassetid://14345898797" }, 1.2, 1)

		visualNovel.MoveActor(v3, 0.5)
		visualNovel.DisplayMCText("...")
		visualNovel.MoveActor(v3, 0.3)
		visualNovel.MoveActor(v4, 0.7)
		visualNovel.SetActorImage(v4, 2)

		if visualNovel.MainCharacterData.Name == "Astarossa" then
			visualNovel.DisplayText("Shelter Supervisor", "Ah, Mayor Astarossa! Welcome to the shelters! We provide a place to refuge and tend to the health of those in need.")
		else
			visualNovel.DisplayText("Shelter Supervisor", "Welcome to the shelters! We provide a place to refuge and tend to the health of those in need.")
		end

		visualNovel.DisplayText("Shelter Supervisor", "If you have any injuries or need to take some weight off your back, we'll get you some help!")
		visualNovel.SetActorImage(v4, 1)
		v3 = visualNovel.DisplayOptions("Remove some stuff from your deck?", { "Sure", "Nah" })

		if v3 == 1 then
			visualNovel.AskForServerEvent("Proceed")
			visualNovel.ChangeTextItalics(true)
			visualNovel.DisplayText("", "You feel lighter.")
			visualNovel.ChangeTextItalics(false)
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("Shelter Supervisor", "Remember to stay safe out there!")
		elseif v3 == 2 then
			visualNovel.AskForServerEvent("Leave")
			visualNovel.SetActorImage(v4, 2)
			visualNovel.DisplayText("Shelter Supervisor", "All good! Remember to stay safe out there.")
		end

		visualNovel.SetActorImage(v4, 1)
		visualNovel.ChangeTextItalics(false)
		visualNovel.EndCutscene()
	end
}
