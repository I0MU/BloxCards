



local v1 = DateTime.fromUniversalTime(2021, 6, 20)
local v2 = DateTime.fromUniversalTime(2021, 9, 20)

return {
	Summer = {
		StartTime = v1,
		EndTime = v2,
		Requirements = {
			Level = 0,
			Wins = 0,
			Plays = 0,
			CardPacksOpened = 0,
			CompetedCardPacks = 0,
			CastedActionCards = 0,
			BotGamesWon = 0,
			GamesWon = 0
		},
		Button = {
			ClickSound = "2037448430",
			Icon = "2034890",
			DisplayName = "Summer",
			Color = Color3.new(0.9, 0.65, 0.13),
			BackColor = Color3.new(0.4, 0.28, 0.05)
		}
	}
}
