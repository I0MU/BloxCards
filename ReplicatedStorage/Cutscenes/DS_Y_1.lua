



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		visualNovel.SetBackground("TheSpire")

		local v3 = visualNovel.CreateActor({ "rbxassetid://92496061871996" }, -0.2, 1)

		visualNovel.ChangeSong("Sleeping Giant", { TimePosition = 0 })
		visualNovel.MoveActor(v3, 0.4, 2)
		visualNovel.SetActorImage(v3, 3)
		visualNovel.DisplayText("The Tainted", "So that’s where you want me to die, huh?")
		visualNovel.SetActorImage(v3, 2)
		visualNovel.DisplayText("The Tainted", "Stupid sword. Never should’ve picked you up.")
		visualNovel.PlaySound("WhaleAffirm")
		visualNovel.DisplayText("The Razor", "[The Razor makes an annoyed whalesong noise.]")
		task.spawn(function()
			visualNovel.Emote(v3, "Angry", { -0.3, 0.2 })
		end)
		visualNovel.DisplayText("The Tainted", "Feeling’s mutual, punk!")
		visualNovel.DisplayText("The Tainted", "You ain’t got no clue what it’s like!")
		visualNovel.DisplayText("The Tainted", "The insults! The degradation!")
		visualNovel.DisplayText("The Tainted", "“Oh don’t talk to Shosta! He’s a purple freak that talks to a barber’s razor he got from graverobbing!”")
		visualNovel.DisplayText("The Tainted", "And ‘ere you are running me around like some stupid errand boy!")
		task.spawn(function()
			visualNovel.Emote(v3, "Angry", { -0.3, 0.2 })
		end)
		visualNovel.DisplayText("The Tainted", "JUST SOD OFF ALREADY!")
		visualNovel.SetActorImage(v3, 3)

		local v4 = visualNovel.CreateActor({ "rbxassetid://136321021944528" }, 0.5, 1)

		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("The Razor", "...")
		visualNovel.DisplayText("The Tainted", "...")
		visualNovel.PlaySound("WhaleSad", { TimePosition = 2.5 })
		visualNovel.ShakeActor(v4, v4.Position, 1, 0.05)
		visualNovel.DisplayText("The Razor", "[A sad whalesong noise.]")
		visualNovel.DisplayText("The Tainted", "...I know you didn’t mean to. I’m sorry.")
		visualNovel.SetActorImage(v3, 4)
		visualNovel.DisplayText("The Tainted", "You’ll see your father again if we go in there, right?")
		visualNovel.SetActorImage(v3, 1)
		visualNovel.DisplayText("The Tainted", "Then I’ll be… Free.")
		visualNovel.SetActorImage(v3, 3)
		visualNovel.DisplayText("The Tainted", "...Free.")
		visualNovel.PlaySound("WhaleCurious")
		visualNovel.ShakeActor(v4, v4.Position, 0.3, 0.05)
		visualNovel.DisplayText("The Razor", "[An approving whalesong noise.]")
		visualNovel.SetActorImage(v3, 1)
		visualNovel.DisplayText("The Tainted", "Alright then!")
		visualNovel.DisplayText("The Tainted", "They say no one who goes in there escapes, but no one who went in there had you.")
		visualNovel.DisplayText("The Tainted", "I'll make my life worthwhile...")
		visualNovel.MoveActor(v3, 1.5, 2)
		visualNovel.MoveActor(v4, 1.6, 2)
		visualNovel.FadeBlack(0)
		visualNovel.DisplayText("The Tainted", "...or die trying.")
		visualNovel.EndCutscene()
	end
}
