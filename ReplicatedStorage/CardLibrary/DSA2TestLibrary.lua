



return {
	["Evil Circle Stud"] = {
		Id = 153949117,
		Name = "Evil Circle Stud",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Put a stud of each colour and a Cosmic Crack into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Green Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "THIS IS A TEST CARD NOT PART OF DSA2."
	},
	["Imaginary Token"] = {
		Id = 113896744477992,
		Name = "The Imagined is Real",
		AltCards = {
			["Imaginary Token-R4T"] = {
				Id = 109741131103880,
				Name = "R4TSHIELD",
				AttackEffect = "Slash",
				Bio = "Never in my 10000 years of life have I EVER seen a card this ugly."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		UniqueGraveZone = true,
		TokenOmni = true,
		Gear = true,
		Imagined = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = {
						{ "Strengthen", 0, "GearOwner" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Fiction is cannibalism.\"\n— The Auteur"
	}
}
