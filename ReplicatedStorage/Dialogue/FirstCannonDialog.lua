



return {
	Owner = "Colo",
	NPCFunc = { "SetUpFirstCannonDialog" },
	Start = {
		Owner = "Colo",
		Text = "Okay, we should be able to follow Razar with her last coordinates.",
		Question = { {
			Text = "Got it.",
			Destination = "Scene1",
			NPCFunc = { "EmoteCaughtDummy", "Colo" }
		} }
	},
	Scene1 = {
		Text = "Oh man... She went very far into the past... Farther than anything we have documented.",
		Question = { { Text = "...", Destination = "Scene2" } }
	},
	Scene2 = {
		Text = "Buuut... we'll be fine. Probably.",
		Question = { {
			Text = "...",
			Destination = "Scene3",
			NPCFunc = { "ColoStopTyping" }
		} }
	},
	Scene3 = {
		Text = "Mmm, alright! Everything is all set up!",
		Question = { {
			Text = "...",
			Destination = "Scene4",
			NPCFunc = { "EnterCannonWithColo" }
		} }
	},
	Scene4 = {
		CantSkip = true,
		Text = "Remember: Don't mess with anything, don't bring back any souveniers, and let's make this quick!",
		Question = { { Text = "...", Destination = "Scene5" } }
	},
	Scene5 = {
		Text = "Brace yourself!",
		EndPoint = true,
		NPCFunc = { "HistoryCannonToAct1" }
	}
}
