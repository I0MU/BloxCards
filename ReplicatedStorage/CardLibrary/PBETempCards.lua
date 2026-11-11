



return {
	["YYYGraded-F"] = {
		Id = 74154753428963,
		Name = "YYYGraded-F",
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		PackDisplayOverride = "Hallow's Bargains Shop",
		Color = "Neutral",
		Cost = { Yellow = 4 },
		Overload = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks, if the top card of your opponent's graveyard costs 5 or fewer total studs: Obliterate it. This card gains 200 health and power.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "“We’re not just fools, we’re the entire circus.”"
	},
	["YYYGraded-QA"] = {
		Id = 74154753428963,
		Name = "YYYGraded-QA",
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		PackDisplayOverride = "Hallow's Bargains Shop",
		Color = "Neutral",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: Set its powers to 0, then it gains 100 Power for each fighter card in your graveyard.",
			Ability = {
				OnAttack = {
					Power = {
						{ "SetPower", 0 },
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Fighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "“We’re not just fools, we’re the entire circus.”"
	}
}
