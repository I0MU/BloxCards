



return {
	Owner = "",
	Start = { Owner = "", Text = "...", Destination = "Start1", CantSkip = true },
	EnterRoom = { Text = "...", Destination = "Start1", CantSkip = true },
	Start1 = {
		Owner = "???",
		Text = "..Hey.",
		Destination = "Start2",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start2 = {
		Owner = "???",
		Text = "Turn around.",
		Destination = "Start3",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start3 = {
		Owner = "Razar",
		Text = "wwwWWWAAADDUP NERD!!",
		Destination = "Start4",
		CantSkip = true,
		TextVoice = "RazarTalk"
	},
	Start4 = {
		Owner = "Razar",
		CantSkip = true,
		Text = "Aww c'moooon. You missed me! I know you did!",
		Destination = "Start42",
		TextVoice = "RazarTalk"
	},
	Start42 = {
		Owner = "Razar",
		CantSkip = true,
		Text = "I hope you liked my acting. You can keep the phone too, just consider it a gift from your ol' pal Razar!",
		Destination = "Start5",
		TextVoice = "RazarTalk"
	},
	Start5 = {
		Owner = "Razar",
		Text = "Hey hey! Where do you think you're going? You're going to help me!",
		Destination = "Start6",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start6 = {
		Owner = "Razar",
		Text = "You know that History Cannon over there? You know, the one you guys screwed everything up in?",
		Destination = "Start7",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start62 = {
		Owner = "Razar",
		Text = "I went back to collect some stuff I left in there but the world seems way different now. Like it's almost twisted.",
		Destination = "Start7",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start7 = {
		Owner = "Razar",
		Text = "Hey it wasn't me! Don't give me that look!",
		Destination = "Start8",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start8 = {
		Owner = "Razar",
		Text = "Listen, with my brains and brawn and your.. tenacity, this'll be a cinch!",
		Destination = "Start9",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start9 = {
		Owner = "Razar",
		Text = "..No? Still not willing?",
		Destination = "Start10",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start10 = {
		Owner = "Razar",
		Text = "Alright! Guess I'll have to beat some sense into ya! Get set to get decked, nerd!",
		EndPoint = true,
		TextVoice = "RazarTalk",
		ChallengeBattle = "Razarfriendly",
		NPCFunc = { "RazarCutsceneCleanup" }
	},
	Leave = { Text = "You decide you need more time to prepare.", EndPoint = true },
	End = {
		Text = "...",
		EndPoint = true,
		NPCFunc = { "RazarCutsceneCleanup" }
	},
	StartFight = {
		Text = "...",
		EndPoint = true,
		NPCFunc = { "RazarCutsceneCleanup" }
	}
}
