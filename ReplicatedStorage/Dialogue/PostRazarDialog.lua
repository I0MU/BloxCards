



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
		Text = "Dang. Dueling sucks. Can't blame a demon for trying though.",
		TextVoice = "RazarTalk",
		Destination = "Start2",
		CantSkip = true
	},
	Start2 = {
		Owner = "Razar",
		Text = "Guess I'm gonna have to beat in that sense another way!",
		TextVoice = "RazarTalk",
		Destination = "Start3",
		CantSkip = true
	},
	Start3 = { Owner = "Razar", Text = "...", EndPoint = true }
}
