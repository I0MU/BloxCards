



return {
	Owner = "",
	NPCFunc = { "NinjaCutscene" },
	Start = {
		Owner = "xxdemonninjaxx",
		Text = "*does awesome pose in display of my power* Hey you're really good!!",
		Destination = "Start",
		CantSkip = true
	},
	Ninja2 = {
		Owner = "xxdemonninjaxx",
		Text = "Just know I'm not gonna go easy next time, got that?",
		Destination = "Start",
		CantSkip = true
	},
	Ninja3 = {
		Owner = "xxdemonninjaxx",
		Text = "From now on, I'm declaring you as my rival! We'll push each other to get stronger until I get my rematch!",
		Destination = "Start",
		CantSkip = true
	},
	Ninja4 = {
		Owner = "xxdemonninjaxx",
		Text = "w-wait, huh? i'm losing my powers!! nooo!! *falls awesomely*",
		Destination = "Start",
		CantSkip = true
	},
	Ninja5 = {
		Owner = "xxdemonninjaxx",
		Text = "owie..",
		Destination = "Start",
		EndPoint = true,
		NPCFunc = { "NinjaCutsceneCleanup" }
	}
}
