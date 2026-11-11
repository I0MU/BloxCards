



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		visualNovel.SetBattleBackground("NoumenChambers")

		local v3 = visualNovel.CreateActor({
			"rbxassetid://107703652042956",
			"rbxassetid://138872457257851",
			"rbxassetid://137506060241001"
		}, -0.4, 1)
		local v4 = visualNovel.CreateActor({
			"rbxassetid://106185843626543",
			"rbxassetid://70854935583326",
			"rbxassetid://97304346893043",
			"rbxassetid://124246255335345"
		}, -0.4, 1)
		local v5 = visualNovel.CreateActor({ "rbxassetid://118611578215412" }, -0.4, 1)

		visualNovel.SetActorImage(v3, 1)
		visualNovel.SetActorImage(v4, 1)

		local visualNovelAdjustActorData = visualNovel.AdjustActorData
		local v7 = UDim2.fromScale(v5.Size.X.Scale, 0.75)

		visualNovelAdjustActorData(v5, { Size = v7 }, 0.1)
		visualNovel.ChangeSong("TenseNoumenal", { TimePosition = 0 })
		wait(1)
		visualNovel.MoveActor(v3, 0.5, 2)
		wait(2)
		visualNovel.SetActorImage(v3, 2)
		visualNovel.DisplayText("The Purifier", "Corpses of unknown beings all over…", "PurifierTalk")
		visualNovel.MoveActor(v3, 0.55, 1)
		visualNovel.DisplayText("The Purifier", "Unknown terrain and intel…", "PurifierTalk")
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("The Purifier", "No battlelines, total war on all fronts…", "PurifierTalk")
		visualNovel.UnFlipActor(v3)
		visualNovel.DisplayText("The Purifier", "In all of my years of service, this is easily the most hellish battlefield I’ve been deployed on.", "PurifierTalk")
		visualNovel.SetActorImage(v3, 1)
		task.spawn(function()
			wait(0.5)
			visualNovel.Emote(v3, "Surprised", { -0.05, -0.1 })
		end)
		visualNovel.DisplayText("???", "And how many fields is <i>that?</i>", "SacrificeTalk")
		visualNovel.SetActorImage(v3, 2)
		visualNovel.FlipActor(v3)
		visualNovel.MoveActor(v4, 0.3, 2)
		visualNovel.DisplayText("The Purifier", "Hmph. The blind girl tracked me in the middle of a warzone.", "PurifierTalk")
		visualNovel.DisplayText("The Purifier", "Impressive.", "PurifierTalk")
		visualNovel.SetActorImage(v3, 1)
		visualNovel.FlipActor(v3)
		task.spawn(function()
			visualNovel.SwayActor(v4, 0.002, 4, 0.2)
		end)
		visualNovel.SetActorImage(v4, 3)
		visualNovel.DisplayText("The Sacrifice", "Your boots reek. One of the few tracking targets I don’t need my staff for.", "SacrificeTalk")
		visualNovel.SetActorImage(v3, 2)
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("The Purifier", "Better they attack me than the weak.", "PurifierTalk")
		visualNovel.SetActorImage(v3, 1)
		visualNovel.FlipActor(v3)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("The Sacrifice", "The “weak” requests your aid.", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "One of those Technicians has been stalking me.", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "It’s blatantly hopeless to fight against; You’re the only one that can slay them.", "SacrificeTalk")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.MoveActor(v4, 0.6, 1)
		visualNovel.FlipActor(v4)
		visualNovel.MoveActor(v3, 0.85, 1)
		visualNovel.MoveActor(v5, 0.25, 1)
		wait(1.5)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("The Sacrifice", "I’d like my two hours of nonstop running to end. If you could stop me being another… How did you term it?", "SacrificeTalk")
		task.spawn(function()
			visualNovel.SwayActor(v4, 0.002, 4, 0.2)
		end)
		visualNovel.SetActorImage(v4, 3)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("The Sacrifice", "A “victim of the spire”?", "SacrificeTalk")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.FlipActor(v4)
		visualNovel.SetActorImage(v3, 3)
		visualNovel.FlipActor(v3)
		visualNovel.DisplayText("The Purifier", "You did not have to so blatantly manipulate me to protect a “victim.”", "PurifierTalk")
		visualNovel.EndCutscene({ "StartBattle", "Noumenal Warden", "DS2S_Technician" })
	end
}
