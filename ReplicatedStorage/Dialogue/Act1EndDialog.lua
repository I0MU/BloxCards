



return {
	Owner = "",
	NPCFunc = { "Act1EndDialogSetup" },
	Start = { Text = "...", Destination = "Start", CantSkip = true },
	Colo1 = {
		Owner = "Colo",
		Text = "Phew! That was scary, we barely made it out of there.",
		Destination = "Start",
		CantSkip = true
	},
	Colo2 = {
		Owner = "Colo",
		Text = "Razar got away though, and we have no idea where she went.",
		Destination = "Start",
		CantSkip = true
	},
	Colo3 = {
		Owner = "Colo",
		Text = "Oh well, At least nothing else went wrong, and we're back in Duelshire like nothing bad happened.",
		Destination = "Start",
		CantSkip = true
	},
	Dnj1 = {
		Owner = "xxdemonninjaxx",
		Text = "*thinks to self* this place looks cool.",
		Destination = "Start",
		CantSkip = true
	},
	Colo4 = {
		Owner = "Colo",
		Text = "W-What are you doing here?",
		Destination = "Start",
		CantSkip = true
	},
	Dnj2 = {
		Owner = "xxdemonninjaxx",
		Text = "*leans back with a cool pose* during our epic escape, i saw you make that cool portal, so i followed.",
		Destination = "Start",
		CantSkip = true
	},
	Colo5 = {
		Owner = "Colo",
		Text = "WHERES THE LAST COORDINATE HISTORY",
		Destination = "Start",
		CantSkip = true
	},
	Colo6 = {
		Owner = "Colo",
		Text = "WHAT DO YOU MEAN \"NO COORDINATE HISTORY FOUND\" DID SOMEBODY CLEAR IT RIGHT AFTER WE LEFT",
		Destination = "Start",
		CantSkip = true
	},
	Colo7 = {
		Owner = "Colo",
		Text = "oh man I am so doomed....",
		EndPoint = true,
		NPCFunc = { "Act1EndDialogCleanup" }
	},
	End = {
		Text = "...",
		EndPoint = true,
		NPCFunc = { "Act1IntroCleanup" }
	}
}
