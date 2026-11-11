



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local visualNovel = require(replicatedStorage.VisualNovel)

return {
	Play = function()
		visualNovel.SetBattleBackground("NoumenalChasm")
		task.spawn(function()
			visualNovel.ChangeSong("Silence")
		end)

		local v3 = visualNovel.CreateActor({ "rbxassetid://120776031645003", "rbxassetid://86826938774621" }, 0.1, 1)
		local v4 = visualNovel.CreateActor({
			"rbxassetid://92620721861687",
			"rbxassetid://93219455281645",
			"rbxassetid://130211951513538"
		}, 0.8, 1)
		local v5 = visualNovel.CreateActor({ "rbxassetid://101862015974311" }, 0.35, 1)
		local v6 = visualNovel.CreateActor({
			"rbxassetid://107703652042956",
			"rbxassetid://138872457257851",
			"rbxassetid://137506060241001"
		}, 0.6, 1)
		local v7 = visualNovel.CreateActor({
			"rbxassetid://106185843626543",
			"rbxassetid://70854935583326",
			"rbxassetid://97304346893043",
			"rbxassetid://124246255335345"
		}, 0.9, 1)
		local v8 = visualNovel.CreateActor({
			"rbxassetid://130639327188210",
			"rbxassetid://129071542268424",
			"rbxassetid://117556103048882",
			"rbxassetid://97615474097118"
		}, 0.25, 1)

		visualNovel.SetActorImage(v3, 4)
		visualNovel.SetActorImage(v6, 3)
		visualNovel.SetActorImage(v8, 7)
		visualNovel.FlipActor(v6)
		visualNovel.FlipActor(v4)
		visualNovel.FlipActor(v7)
		wait(1)
		visualNovel.ShakeActor(v8, v8.Position, 2, 0.05)
		visualNovel.DisplayText("Tainted", "What is that?!", "TaintedTalk")
		visualNovel.MoveActor(v4, 0.5, 1)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("Auteur", "It dripped from the ceiling!", "AuteurTalk")
		visualNovel.MoveActor(v4, 0.45, 1)
		visualNovel.DisplayText("Auteur", "It’s… Hm.", "AuteurTalk")
		task.spawn(function()
			visualNovel.SwayActor(v4, 0.002, 4, 0.2)
		end)
		visualNovel.ShakeActor(v5, v5.Position, 2, 0.05)
		wait(1.5)
		visualNovel.DisplayText("Auteur", "It’s got roots inside it…", "AuteurTalk")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.FlipActor(v4)
		visualNovel.SetActorImage(v7, 5)
		visualNovel.FlipActor(v7)
		task.spawn(function()
			visualNovel.SwayActor(v7, 0.002, 4, 0.2)
		end)
		visualNovel.DisplayText("The Sacrifice", "Oh dear lord…", "SacrificeTalk")
		visualNovel.SetActorImage(v6, 1)
		visualNovel.FlipActor(v6)
		visualNovel.DisplayText("The Purifier", "Hmph.", "PurifierTalk")
		visualNovel.SetActorImage(v6, 2)
		visualNovel.FlipActor(v6)
		task.spawn(function()
			visualNovel.ChangeSong("TenseNoumenal", { TimePosition = 0 })
		end)
		visualNovel.DisplayText("The Purifier", "This has <i>drastic</i> consequences for the mission.", "PurifierTalk")
		visualNovel.MoveActor(v4, 0.65, 1)
		visualNovel.MoveActor(v6, 0.475, 1)
		visualNovel.SetActorImage(v8, 3)
		visualNovel.SetActorImage(v7, 1)
		visualNovel.SetActorImage(v3, 1)
		visualNovel.FlipActor(v7)
		visualNovel.DisplayText("The Purifier", "Listen to me!", "PurifierTalk")
		visualNovel.UnFlipActor(v6)
		visualNovel.DisplayText("The Purifier", "That was a Kilnkin, from the domain I entered.", "PurifierTalk")
		visualNovel.FlipActor(v6)
		visualNovel.DisplayText("The Purifier", "If it’s <i>dripped</i> this far down, something must be doing catastrophic damage up there.", "PurifierTalk")
		visualNovel.SetActorImage(v6, 1)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.FlipActor(v4)
		visualNovel.DisplayText("Auteur", "A good observation, Purifier!", "AuteurTalk")
		visualNovel.DisplayText("Auteur", "With all the domains fusing… They’ll likely have unintended interactions.", "AuteurTalk")
		visualNovel.DisplayText("Auteur", "Can you swim upwards?", "AuteurTalk")
		visualNovel.ShowCGScene("118785491352150")
		wait(1)
		visualNovel.DisplayText("Auteur", "Just like Kralosa…", "AuteurTalk")
		visualNovel.DisplayText("Auteur", "You can get up there in minutes.", "AuteurTalk")
		visualNovel.DisplayText("The Purifier", "Good.", "PurifierTalk")
		visualNovel.DisplayText("The Purifier", "Alexandra, take the katana.", "PurifierTalk")
		visualNovel.ShowCGScene("104350521606583", true, 1.5)
		visualNovel.DisplayText("The Sacrifice", "Whuh…?", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "I-I’m honoured, but…", "SacrificeTalk")
		visualNovel.ShowCGScene("76448531951831", true, 1.5)
		visualNovel.DisplayText("The Purifier", "Viktor and Winona have no fencing practice, and the git has shown himself utterly useless.", "PurifierTalk")
		visualNovel.DisplayText("Tainted", "Oi!", "TaintedTalk")
		visualNovel.DisplayText("The Purifier", "But more importantly, you’re the only one I trust to do the right thing if I’m not back when the time comes.", "PurifierTalk")
		visualNovel.ShowCGScene("73907575411801", true, 1.5)
		task.spawn(function()
			wait(0.2)
			visualNovel.PlaySound("bane end")
		end)
		visualNovel.SetActorImage(v4, 1)

		local visualNovelAdjustActorData = visualNovel.AdjustActorData
		local v10 = UDim2.fromScale(v6.Position.X.Scale, 0.7)

		visualNovelAdjustActorData(v6, { ImageTransparency = 1, Position = v10 }, 0.1)

		local adjustActorData = visualNovel.AdjustActorData

		v10 = UDim2.fromScale(v5.Position.X.Scale, 0.7)
		adjustActorData(v5, { ImageTransparency = 1, Position = v10 }, 0.1)
		visualNovel.SetActorImage(v7, 7)
		visualNovel.SetActorImage(v8, 4)
		visualNovel.DisplayText("The Purifier", "You won’t disappoint me.", "PurifierTalk")
		visualNovel.ShowCGScene()
		task.spawn(function()
			visualNovel.ChangeSong("Silence")
		end)
		wait(1)
		task.spawn(function()
			visualNovel.SwayActor(v7, 0.002, 4, 0.2)
		end)
		visualNovel.DisplayText("The Sacrifice", "…", "SacrificeTalk")
		visualNovel.FlipActor(v7)
		visualNovel.DisplayText("The Sacrifice", "You’re not… Going to try to take it from me?", "SacrificeTalk")
		visualNovel.FlipActor(v4)
		task.spawn(function()
			visualNovel.SwayActor(v8, 0.002, 4, 0.2)
		end)
		visualNovel.DisplayText("Tainted", "You’re gonna kill Nyarlhotep, right?", "TaintedTalk")
		visualNovel.DisplayText("The Sacrifice", "…", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "I…", "SacrificeTalk")
		task.spawn(function()
			visualNovel.SwayActor(v7, 0.002, 4, 0.2)
		end)
		visualNovel.DisplayText("The Sacrifice", "It’s…", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "Looking at everything going on, I…", "SacrificeTalk")
		visualNovel.DisplayText("The Sacrifice", "I think it’s too dangerous to keep around.", "SacrificeTalk")
		visualNovel.SetActorImage(v8, 2)
		visualNovel.DisplayText("Tainted", "Good enough.", "TaintedTalk")
		visualNovel.DisplayText("Tainted", "Time’s ticking.", "TaintedTalk")
		visualNovel.MoveActor(v8, 1.2, 1.5)
		wait(0.5)
		visualNovel.UnFlipActor(v4)
		visualNovel.MoveActor(v3, 1.2, 2)
		wait(1)
		visualNovel.UnFlipActor(v7)
		wait(0.5)
		visualNovel.MoveActor(v7, 1.2, 1)
		wait(1)
		visualNovel.SetActorImage(v4, 2)
		visualNovel.DisplayText("Auteur", "Hmmm…", "AuteurTalk")
		visualNovel.DisplayText("Auteur", "An unexepected event...", "AuteurTalk")
		visualNovel.DisplayText("Auteur", "...But not an unwelcome one.", "AuteurTalk")
		visualNovel.SetActorImage(v4, 1)
		visualNovel.MoveActor(v4, 1.2, 1)
		wait(0.5)
		visualNovel.EndCutscene("OpenDSA2StoryMenu")
	end
}
