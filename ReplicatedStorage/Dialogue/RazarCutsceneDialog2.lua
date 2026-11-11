



return {
	Owner = "",
	Start = { Owner = "", Text = "...", Destination = "Start1", CantSkip = true },
	Start1 = {
		Owner = "???",
		Text = "Last time I checked, no.",
		Destination = "Start2",
		TextVoice = "RazarTalkDreamy",
		CantSkip = true
	},
	Start2 = {
		Owner = "???",
		Text = "When was that?",
		Destination = "Start3",
		TextVoice = "TeiygenTalkDreamy",
		CantSkip = true
	},
	Start3 = {
		Owner = "???",
		Text = "Like, zero seconds ago.",
		Destination = "Start4",
		CantSkip = true,
		TextVoice = "RazarTalkDreamy"
	},
	Start4 = {
		Owner = "???",
		CantSkip = true,
		Text = "Dude, just-",
		Destination = "Start42",
		TextVoice = "TeiygenTalkDreamy"
	},
	Start5 = {
		Owner = "???",
		Text = "Alright relax, I got it nerd!",
		Destination = "Start6",
		TextVoice = "RazarTalkDreamy",
		CantSkip = true
	},
	Start6 = {
		Owner = "Razar",
		Text = "..Well hey, look at that!",
		Destination = "Start7",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start7 = {
		Owner = "Razar",
		Text = "Wakey wakey, eggs and bakey nerd! You've been out for like an hour!",
		Destination = "Start8",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start8 = {
		Owner = "???",
		Text = "You know you didn't have to knock them out. I'm sure they would have been plenty willing to help, they helped Colo.",
		Destination = "Start9",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start9 = {
		Owner = "Razar",
		Text = "okay for the record i tried that at first but then i destroyed them in that duel so then they didnt cooporate and",
		Destination = "Start10",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start10 = {
		Owner = "???",
		Text = "Bruh it could not have been- Okay.",
		Destination = "Start9",
		CantSkip = true,
		TextVoice = "TeiygenTalk"
	},
	Start11 = {
		Owner = "???",
		Text = "Listen, my name is Teiygen. Your mettling in the Ultimate Power bubble caused it to go unstable and now you have to help me.",
		TextVoice = "TeiygenTalk",
		Destination = "Start9",
		CantSkip = true
	},
	Start12 = {
		Owner = "Razar",
		Text = "It was mostly Colo's fault, you know.",
		Destination = "Start10",
		TextVoice = "RazarTalk",
		CantSkip = true
	},
	Start13 = {
		Owner = "Teiygen",
		Text = "I have a reason to believe it was your fault too.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start14 = {
		Owner = "Teiygen",
		Text = "I'm not sure why but that Telamon copy seems to have dissapeared. I know you just met me but I'm hoping you'll help me get to the bottom of this.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start15 = {
		Owner = "Teiygen",
		Text = "Okay off topic. The important thing is Telamon went completely missing causing a power imbalance and now the bubble is imploding.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start16 = {
		Owner = "Teiygen",
		Text = "We just need to find the source and extract it but.. we're stuck who knows where.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start17 = {
		Owner = "Razar",
		Text = "HERE I COME SAN DIEGO",
		Destination = "Start10",
		TextVoice = "RazarTalkQuiet",
		CantSkip = true
	},
	Start172 = {
		Owner = "Teiygen",
		Text = "..Right. Those wooden planks are gonna be annoying to tear down, but-",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start1722 = {
		Owner = "Teiygen",
		Text = "..One sec.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start18 = {
		Owner = "Teiygen",
		Text = "Hello?",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start182 = {
		Owner = "Teiygen",
		Text = "Jeez slow down..! I'm just out doing some work.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start19 = {
		Owner = "Teiygen",
		Text = "You work on a way out of here in the meantime. We just gotta find some leverage to tear down those planks. Should be easy.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		CantSkip = true
	},
	Start20 = {
		Owner = "Teiygen",
		Text = "No- It wasn't anyone- relax! I'll be back home soon I'm sorry.",
		Destination = "Start10",
		TextVoice = "TeiygenTalk",
		EndPoint = true,
		NPCFunc = { "TeiygenCutsceneCleanup" }
	}
}
