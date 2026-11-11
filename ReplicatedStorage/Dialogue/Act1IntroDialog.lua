



return {
	Owner = "",
	NPCFunc = { "Act1IntroSetup" },
	Start = {
		Text = "...",
		Destination = "Start1",
		NPCFunc = { "MoveNPC", "Colo", "IntroColoPos" }
	},
	Start1 = {
		Owner = "Colo",
		Text = "...Wow....",
		Destination = "Start2",
		NPCFunc = { "MoveCamera", "Act1IntroCamB" }
	},
	Start2 = {
		Text = "So this is what Robloxia looked like this far back...",
		Destination = "Start3"
	},
	Start3 = {
		Text = "And we're right at the Roblox Headquarters! Telamon works from there!",
		Destination = "Start4",
		NPCFunc = { "MoveCamera", "Act1IntroCamC" }
	},
	Start4 = {
		Text = "Hmmm... Whatever Razar is planning to do here, it can't be good.",
		Destination = "Start5",
		NPCFunc = { "ColoTurnToPlayer" }
	},
	Start5 = {
		Text = "We have a lot of ground to cover, I think we should split up.",
		Question = { { Text = "Agreed.", Destination = "Start6" } }
	},
	Start6 = {
		Text = "Alright, I'll start looking around the outer area, you should ask around the HQ, maybe someone there has seen her.",
		Destination = "Start7"
	},
	Start7 = {
		Text = "We'll meet back up in front of the HQ.",
		Question = { {
			Text = "Got it!",
			Destination = "End",
			NPCFunc = { "MoveNPC", "Colo", "IntroColoExit" }
		} }
	},
	End = {
		Text = "...",
		EndPoint = true,
		NPCFunc = { "Act1IntroCleanup" }
	}
}
