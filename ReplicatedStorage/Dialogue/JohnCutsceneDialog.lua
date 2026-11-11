



return {
	Owner = "",
	Start = { Owner = "", Text = "...", Destination = "Start1", CantSkip = true },
	EnterRoom = {
		Owner = "Teiygen",
		Text = "Well.. I think I figured out the problem..",
		Destination = "Start1",
		CantSkip = true
	},
	Start1 = {
		Owner = "Teiygen",
		Text = "Well.. I think I figured out the problem..",
		Destination = "Start1",
		CantSkip = true
	},
	Start2 = {
		Owner = "Razar",
		Text = "Dang, well.. that looks good.",
		Destination = "Start3",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start3 = {
		Owner = "Teiygen",
		Text = "Well now that we found the source, let's just observe for a bit and then get out as soon as possible.",
		Destination = "Start4",
		CantSkip = true,
		TextVoice = "TeiygenTalk"
	},
	Start4 = {
		Owner = "Teiygen",
		CantSkip = true,
		Text = "..That guy must be.. he has to be. ",
		Destination = "Start42",
		TextVoice = "TeiygenTalk"
	},
	Start5 = {
		Owner = "Razar",
		CantSkip = true,
		Text = "Is he the guy with the alpha brick now?? Lucky.",
		Destination = "Start5",
		TextVoice = "RazarTalk"
	},
	Start6 = {
		Owner = "Teiygen",
		Text = "Ugh. Razar.. please stop talking so loudly. We can't give anyone here any more attention. We've-",
		Destination = "Start6",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start7 = {
		Owner = "???",
		Text = "i heard you guys said something about.. leaving?",
		Destination = "Start7",
		CantSkip = true
	},
	Start8 = {
		Owner = "???",
		Text = "there's a lot i've learned since telamon abandoned us.. while i don't understand most of it. i think i know who you guys are.",
		Destination = "Start7",
		CantSkip = true
	},
	Start9 = {
		Owner = "Razar",
		Text = "Ha! Dude you don't know the half of it.",
		Destination = "Start8",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start10 = {
		Owner = "Teiygen",
		Text = "Razar!!?",
		Destination = "Start9",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start11 = {
		Owner = "Razar",
		Text = "What??",
		Destination = "Start10",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start12 = {
		Owner = "???",
		Text = "that's about what i thought. you guys have taught me a bunch since you arrived.",
		Destination = "Start10",
		CantSkip = true
	},
	Start13 = {
		Owner = "???",
		Text = "really i should thank you guys but.. i dunno. i feel like in a way this is all your fault.",
		EndPoint = true,
		NPCFunc = { "JohnCutsceneCleanup" }
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
