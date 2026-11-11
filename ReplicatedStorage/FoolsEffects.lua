



return {
	FoolsFighterEffects = {
		{
			CustomReminder = { Hardy = "+50% Health" },
			MultiplyHealth = 1.5,
			Hardy = true
		},
		{
			CustomReminder = { Lucky = "+25% Crit Chance, +25% Crit Damage" },
			CritChance = 25,
			CritBoost = 0.25,
			Lucky = true
		},
		{
			CustomReminder = { Immobile = "+200% Health, Can't Attack." },
			MultiplyHealth = 3,
			AttackBlock = true,
			Immobile = true
		},
		{
			CustomReminder = { Godly = "+75% Health, +75% Power." },
			MultiplyHealth = 1.75,
			MultiplyPower = 1.75,
			Godly = true
		},
		{
			CustomReminder = { Precise = "+10% Crit Chance, +200% Crit Damage" },
			CritChance = 10,
			CritBoost = 2,
			Precise = true
		},
		{
			CustomReminder = { ["Glass Cannon"] = "-95% Health, +1000% Power." },
			MultiplyHealth = 0.05,
			MultiplyPower = 10,
			["Glass Cannon"] = true
		},
		{
			CustomReminder = { ["Glass Bones"] = "Takes 200 more damage from effects and combat" },
			DamageMitigation = -200,
			Mitigation = -200,
			["Glass Bones"] = true
		},
		{
			CustomReminder = { Resilient = "Takes 200 less damage from effects and combat" },
			DamageMitigation = 200,
			Mitigation = 200,
			Resilient = true
		},
		{
			CustomReminder = {
				["Deer Hunter"] = "This card deals 10x combat damage to targets with 'Fluff' in their name."
			},
			["Deer Hunter"] = true
		},
		{
			CustomReminder = { Overloading = "+50% Crit Chance, Gains Overload." },
			CritChance = 50,
			Overload = true,
			Overloading = true
		},
		{
			CustomReminder = {
				Pythagorean = "This card deals combat damage based Pythagoreanally off of its Health and Power."
			},
			AssignPythag = true,
			Pythagorean = true
		},
		{
			CustomReminder = { Charged = "This card has Haste." },
			Charge = true,
			Charged = true
		},
		{
			CustomReminder = { ["World-Wide"] = "This card is now a terrain." },
			Terrain = true,
			["World-Wide"] = true
		},
		{
			CustomReminder = { Regenerating = "This card has Regen." },
			Regen = true,
			Regenerating = true
		},
		{
			CustomReminder = { Inconsistent = "+20% Crit Chance, +100% Crit Damage, -50% Power" },
			CritChance = 20,
			CritBoost = 1,
			MultiplyPower = 0.5,
			Inconsistent = true
		},
		{
			CustomReminder = { Quick = "-25% Power, Gains Dextrous." },
			MultiplyPower = 0.75,
			Dextrous = true,
			Quick = true
		},
		{
			CustomReminder = { Pathetic = "This card's Health and Power are set to 1." },
			Health = 1,
			Power = 1,
			Pathetic = true
		},
		{
			CustomReminder = { Flash = "-50% Power, Gains Super Dextrous." },
			MultiplyPower = 0.5,
			SuperDextrous = true,
			Flash = true
		},
		{
			CustomReminder = { ["Heavy Hitter"] = "+25% Crit Chance, Gains Super Overload." },
			CritChance = 25,
			SuperOverload = true,
			["Heavy Hitter"] = true
		},
		{
			CustomReminder = {
				Platinum = "If you would be banned while this is in play, prevent it."
			},
			BypassDeath = true,
			Platinum = true
		},
		{
			CustomReminder = { Old = "+150% Health, gains Decaying." },
			MultiplyHealth = 2.5,
			Decaying = true,
			Old = true
		},
		{
			CustomReminder = { Weakling = "-25% Health, -25% Power. He's not real." },
			MultiplyHealth = 0.75,
			MultiplyPower = 0.75,
			Id = 16932150991,
			Weakling = true
		},
		{
			CustomReminder = {
				["Humble One"] = "ｙｏｕｒ ｏｐｐｏｎｅｎｔ＇ｓ ｆｒｅｅ ｗｉｌｌ ｉｓ ｆｏｒｆｅｉｔ"
			},
			OverrideTargets = true,
			["Humble One"] = true
		},
		{
			CustomReminder = {
				Masterpiece = "When this card is cast: Draw 2 cards and shuffle the stats of all fighters. For the rest of the game, the subject is interpolated into a postdeconstructivist capitalism that includes art as a reality.",
				Capitalism = "A system of economics where the tools to produce goods are controlled by individual people for private interests."
			},
			Effect = {
				Name = "Reincarnation",
				Description = "When this card is cast: Draw 2 cards and shuffle the stats of all fighters. For the rest of the game, the subject is interpolated into a postdeconstructivist capitalism that includes art as a reality. ",
				Ability = {
					OnSummon = {
						Power = {
							{ "Draw", 2 },
							{ "IntoFormsUnrecognizable" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" },
							{
								"AlterEV",
								{ "Set", "Target", "DirectCardInstance", "Nil" },
								"CustomTarget"
							},
							{ "ExchangeHealth", "Variable", "CustomTarget" },
							{ "ExchangePower", "Variable", "CustomTarget" }
						},
						Target = "Ally",
						UniqueTargets = true,
						TargetParameters = {
							Zones = { "Ally_Field", "Enemy_Field" },
							Condition = { "RandomCard", "HasntPassive" },
							Modifier = { RandomCard = 1, HasntPassive = "SetImmune" },
							SubModifier = true
						}
					}
				}
			},
			Masterpiece = true
		},
		{
			CustomReminder = { ["Heavily Armored"] = "Takes 50% less damage from all sources." },
			MultMitigation = 0.5,
			["Heavily Armored"] = true
		},
		{
			CustomReminder = { Defenseless = "Takes 50% more damage from all sources." },
			MultMitigation = -0.5,
			Defenseless = true
		},
		{
			CustomReminder = { Planty = "This fighter is Continued." },
			Continued = true,
			Planty = true
		},
		{
			CustomReminder = {
				Counterspeller = "Whenever your opponent casts an action, negate its effect."
			},
			NegateAction = true,
			Counterspeller = true
		},
		{
			CustomReminder = { ["Tower Defender"] = "This fighter has Station." },
			Station = true,
			["Tower Defender"] = true
		}
	},
	FoolsActionEffects = {
		{
			CustomReminder = { Miracle = "Cast this card for free if its your first turn." },
			AlternateCost = { Neutral = 0 },
			AlternateCostRequirement = { "Turns", "Ally", 0, 3 },
			Miracle = true
		},
		{
			CustomReminder = { Living = "Your card now has sentience." },
			Health = 100,
			Power = 100,
			Living = true
		},
		{
			CustomReminder = { Unwanted = "Ban Yourself." },
			Cost = { Red = 1 },
			Effect = {
				Name = "Infinite Army",
				Description = "Ban yourself.",
				Type = "OnSummon",
				Power = { { "Cost", 99999999 } },
				Target = "Opponent"
			},
			Unwanted = true
		},
		{
			CustomReminder = { Inept = "+1 Colourless Cost" },
			AddNeutralCost = 1,
			Inept = true
		},
		{
			CustomReminder = { Repetitive = "Get another copy of this after casting it." },
			Repetitive = true
		},
		{
			CustomReminder = {
				Chaotic = "Replace this card's effect with summoning a random fighter and triggering it's effect as if it was cast."
			},
			Effect = {
				Name = "Haydoscale",
				Description = "Summon a random fighter. Trigger its effects as though it was cast.",
				Type = "OnSummon",
				Power = { { "RandomSummonWithEffect", "Fighter" } },
				Target = "Ally"
			},
			Chaotic = true
		},
		{
			CustomReminder = {
				Creepy = "Replace this card's effect with giving a random player Lezus."
			},
			Effect = {
				Name = "Haydoscale",
				Description = "Give a player Lezus.",
				Type = "OnSummon",
				Power = { {
					"RandomAdd",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
				} },
				Target = "Ally"
			},
			Creepy = true
		},
		{
			CustomReminder = {
				Creepy = "Replace this card's effect with giving a random player Lezus."
			},
			Effect = {
				Name = "Haydoscale",
				Description = "Give a player Lezus.",
				Type = "OnSummon",
				Power = { {
					"RandomAdd",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
				} },
				Target = "Opponent"
			},
			Creepy = true
		},
		{
			CustomReminder = {
				["Treasure Hunting"] = "Replace this card's effect with giving you a City Trek Treasure."
			},
			Effect = {
				Name = "Haydoscale",
				Description = "Give yourself a Treasure.",
				Type = "OnSummon",
				Power = { { "RandomAdd", "Treasure", "Ally" } },
				Target = "Ally"
			},
			["Treasure Hunting"] = true
		},
		{
			CustomReminder = {
				Unfortunate = "Replace this card's effect with Shuffling 5 Misfortunes and 1 Watched into your opponent's deck."
			},
			Effect = {
				Name = "Haydoscale",
				Description = "Shuffle 5 Misfortunes and 1 Watched into your opponent's deck.",
				Type = "OnSummon",
				Power = {
					{ "DeckAdd", "CT_Bad_4", "Opponent" },
					{
						"RandomDeckAdd",
						{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" }
					},
					{
						"RandomDeckAdd",
						{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" }
					},
					{
						"RandomDeckAdd",
						{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" }
					},
					{
						"RandomDeckAdd",
						{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" }
					},
					{
						"RandomDeckAdd",
						{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" }
					}
				},
				Target = "Opponent"
			},
			Unfortunate = true
		}
	},
	FoolsSharedEffects = {
		{
			CustomReminder = { Efficient = "-1 Colourless Cost" },
			AddNeutralCost = -1,
			Efficient = true
		},
		{
			CustomReminder = {
				Noobified = "If this card's effect would transform, summon, or give a card, replace that card with a Noob."
			},
			Transformant = "Noob",
			Addant = "Noob",
			Summonant = "Noob",
			Noobified = true,
			FoolEffectRequirement = "Transformant"
		},
		{
			CustomReminder = {
				Noobified = "If this card's effect would transform, summon, or give a card, replace that card with a Noob."
			},
			Transformant = "Noob",
			Addant = "Noob",
			Summonant = "Noob",
			Noobified = true,
			FoolEffectRequirement = "Addant"
		},
		{
			CustomReminder = {
				Noobified = "If this card's effect would transform, summon, or give a card, replace that card with a Noob."
			},
			Transformant = "Noob",
			Addant = "Noob",
			Summonant = "Noob",
			Noobified = true,
			FoolEffectRequirement = "Summonant"
		},
		{
			CustomReminder = {
				Colourless = "Cost changed to 2 Colourless studs, Now a Colourless card."
			},
			Cost = { Neutral = 2 },
			Color = "Neutral",
			Colourless = true
		},
		{
			CustomReminder = {
				Wide = "If part of this card's effect were to target a single fighter, it targets all fighters instead."
			},
			Wide = true
		},
		{
			CustomReminder = {
				["MZH-born"] = "Cast this for a colourless stud if your opponent has seven or more fighters."
			},
			AlternateCost = { Neutral = 1 },
			AlternateCostRequirement = { "Board", "Opponent", 7, 9999 },
			["MZH-born"] = true
		},
		{
			CustomReminder = { Fried = "This card is now part of the Shedletsky Group." },
			Archetype = "Shedletsky",
			Fried = true
		},
		{
			CustomReminder = { Traveller = "This card has traversed all four hells at once." },
			Traversed = true,
			Perceptive = true,
			Sociable = true,
			Dominant = true,
			Prosperous = true,
			Traveller = true
		},
		{
			CustomReminder = { Echoing = "All triggers on this card trigger an additional time." },
			Echoing = true
		},
		{
			CustomReminder = { Undead = "This card gains Zombified." },
			Zombified = true,
			Undead = true
		},
		{
			CustomReminder = { Attachable = "This card is now a gear." },
			Gear = true,
			Attachable = true
		}
	}
}
