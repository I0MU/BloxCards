



return {
	Owner = "???",
	Start = {
		Text = { "..Psst, over here..", "I've got something for you.." },
		Question = { {
			Text = "(Continue)",
			Destination = "End",
			Effect = { Type = "ResetCamera" }
		} }
	},
	End = {
		EndPoint = true,
		Text = { "..." }
	}
}
