



return {
	Owner = "Colo",
	NPCFunc = { "PostSpeechSetup" },
	Start = {
		Text = "I have to say, I wasn't expecting Telamon to be so...",
		Question = {
			{ Text = "Violent?", Destination = "Violent" },
			{ Text = "Tired?", Destination = "Tired" }
		}
	},
	Violent = {
		Text = "Yeah, That celestial just asked him a question and he obliterated it on the spot. it's kinda scary...",
		Destination = "Continue"
	},
	Tired = {
		Text = "Yeah, He looks like he hasn't slept in months, is that what it takes to create and manage a whole planet for this long?",
		Destination = "Continue"
	},
	Continue = {
		Text = "Well anyways, we still haven't gotten any closer to finding Razar. Where could she possibly be...?",
		Destination = "Continue2",
		NPCFunc = { "chillguylookatcolo" }
	},
	Continue2 = {
		Owner = "chillguy89",
		Text = "hey, is that person you're looking for a blue demon person?",
		Destination = "Continue3"
	},
	Continue3 = {
		Owner = "Colo",
		Text = "Yes, that's exactly who were looking for! Where did they go?",
		Destination = "Continue4"
	},
	Continue4 = {
		Owner = "chillguy89",
		Text = "i think i saw them run over behind the hq after the presentation, hope they arent trying to sneak into the basement or anything cuz thats against the rules.",
		Destination = "Continue5"
	},
	Continue5 = {
		Owner = "Colo",
		Text = "I see, Thank you!",
		Destination = "Continue6",
		NPCFunc = { "TurnDummyTowardsPlayer", "Colo" }
	},
	Continue6 = {
		Owner = "Colo",
		Text = "We should head over there before Razar leaves! What would she be doing in the basement of the Roblox HQ though...?",
		Destination = "Continue7",
		NPCFunc = { "dnjApproach" }
	},
	Continue7 = {
		Owner = "xxdemonninjaxx",
		Text = "*silently approaches* I would like to join you. *looks up to the sky dramatically* I can sense an evil presence waiting...",
		Question = {
			{ Text = "Welcome to the team!", Destination = "Continue8" },
			{ Text = "*nods dramatically back*", Destination = "Continue8" }
		},
		NPCFunc = { "TurnDummyTowardsPlayer", "Colo" }
	},
	Continue8 = {
		Owner = "Colo",
		Text = "...Okay, sure! %playername, lead the way!",
		EndPoint = true,
		NPCFunc = { { "PostSpeechCleanup" } }
	}
}
