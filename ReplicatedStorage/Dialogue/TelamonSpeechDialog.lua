



return {
	Owner = "",
	NPCFunc = { "TelamonSpeechSetup" },
	Start = {
		Text = "...",
		Destination = "Start1",
		NPCFunc = { "TelamonColoTalks" }
	},
	Start1 = {
		Owner = "Colo",
		Text = "...So, have you found Razar?",
		Question = { {
			Text = "No.",
			Destination = "Start2",
			NPCFunc = { "TelamonColoStopsTalking" }
		} }
	},
	Start2 = {
		Text = "...Its fine. I've gotten a lot of field research done. I haven't been this deep into the past, so this is pretty exciting.",
		Destination = "Start3",
		NPCFunc = { "TelamonColoTalks" }
	},
	Start3 = {
		Text = "And hey, we get to see Telamon in person! The strongest being in recorded history! Kind of a big deal, yeah?",
		Destination = "TelamonWalkStart",
		NPCFunc = { "TelamonColoStopsTalking" }
	},
	TelamonWalkStart = {
		Text = "Oh look, there he is now!",
		Destination = "TelamonWalk",
		NPCFunc = { "TelamonWalk" }
	},
	TelamonWalk = {
		CantSkip = true,
		Text = "Here he comes..!",
		Destination = "TelamonWalkEnd"
	},
	TelamonWalkEnd = {
		Owner = "",
		Text = "...",
		Destination = "Scene1",
		NPCFunc = { "TelamonTurn" }
	},
	Scene1 = {
		Text = "...",
		Destination = "Scene2",
		NPCFunc = { "TelamonReactionTired" }
	},
	Scene2 = {
		Text = "...",
		Destination = "Scene3",
		NPCFunc = { "TelamonZoomIn" }
	},
	Scene3 = {
		Owner = "Colo",
		Text = "uhhhhh...",
		Destination = "Scene4",
		NPCFunc = { "TelamonReactionTired2" }
	},
	Scene4 = {
		Text = "...You know, he's definitely not what I expected.",
		Destination = "Scene5",
		NPCFunc = { "TelamonEhem" }
	},
	Scene5 = {
		Owner = "Telamon",
		Text = "...EHEM.",
		Destination = "Scene6",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonEhemZoomIn" }
	},
	Scene6 = {
		Text = "...err.",
		Destination = "Scene7",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonWelcome" }
	},
	Scene7 = {
		Text = "Good to see you all. I am happy to share what I've been working on the next update of Robloxia.",
		Destination = "Scene8",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonAudienceCheer" }
	},
	Scene8 = {
		Owner = "Crowd",
		Text = "yippie yay woohoo awesome thank you telamon let's go finally we've been waiting yes thank woo hoo",
		Destination = "Scene9",
		NPCFunc = { "TelamonPullupTable" }
	},
	Scene9 = {
		Owner = "Telamon",
		Text = "Alright... Enough chit-chat, first order of business.",
		Destination = "Scene10",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonShowItems" }
	},
	Scene10 = {
		Text = "Here's some new stuff",
		Destination = "Scene11",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonHighlightItem1" }
	},
	Scene11 = {
		Text = "Here's some war armor, forged with aether and imbued by the fragments of the Splintered Skies or something... Hope you war enjoyers are happy.",
		Destination = "Scene12",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonHighlightItem2" }
	},
	Scene12 = {
		Text = "Here's the Crimson Catseye, once a tailsman of a powerful sorcerer, now worshipped by a cult whom seeks to tap into the eye's undiscovered capabilities. That cool, right?",
		Destination = "Scene13",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonHighlightItem3" }
	},
	Scene13 = {
		Text = "This fella... I don't know. I thought it would be funny. We need more different kinds of lifeforms anyways.",
		Destination = "Scene14",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonReturnCamera" }
	},
	Scene14 = {
		Text = "Anyways, that's everything new coming with this update. enjoy it or whatever",
		Destination = "Scene15",
		TextVoice = "TelamonTalk",
		NPCFunc = { "TelamonAudienceCheer" }
	},
	Scene15 = {
		Owner = "Crowd",
		Text = "yaaay woohoo thank you telamon you're the best thx for the epic updates wooo",
		Destination = "Scene17",
		NPCFunc = { "TelamonAudienceStop" }
	},
	Scene17 = {
		Owner = "Celestial",
		Text = "What about something for us celestials?",
		Destination = "Scene18",
		TextVoice = "CelestialTalk",
		NPCFunc = { "CelestialZoomIn" }
	},
	Scene18 = {
		Text = "You've promised you'd help us reach the heavens, update after update, yet haven't done anything.",
		Destination = "Scene19",
		TextVoice = "CelestialTalk",
		NPCFunc = { "DropAnvil" }
	},
	Scene19 = {
		CantSkip = true,
		Text = "...Please, just anything to help u-",
		TextVoice = "CelestialTalk",
		Destination = "AnvilFinished"
	},
	AnvilFinished = {
		Owner = "Telamon",
		Text = "...as I said, that's all for this update. Now go on, have fun and stuff.",
		TextVoice = "TelamonTalk",
		EndPoint = true,
		NPCFunc = { "TelamonSpeechCleanup" }
	},
	End = {
		Text = "...",
		EndPoint = true,
		NPCFunc = { "TelamonSpeechCleanup" }
	}
}
