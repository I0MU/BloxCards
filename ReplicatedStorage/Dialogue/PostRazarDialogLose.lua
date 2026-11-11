



return {
	Owner = "",
	NPCFunc = { "RazarCutscene2" },
	Start = {
		Owner = "Razar",
		Text = "...",
		TextVoice = "RazarTalk",
		Destination = "Start2",
		CantSkip = true
	},
	Start1 = {
		Owner = "Razar",
		Text = "..Dang, I didn't expect to beat you. You must suck!",
		TextVoice = "RazarTalk",
		Destination = "Start2",
		CantSkip = true
	},
	Start2 = {
		Owner = "Razar",
		Text = "I was kinda hoping I'd lose so I could just knock you out instead so..",
		TextVoice = "RazarTalk",
		Destination = "Start3",
		CantSkip = true
	},
	Start3 = { Owner = "Razar", Text = "...", EndPoint = true }
}
