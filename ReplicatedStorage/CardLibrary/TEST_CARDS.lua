



return {
	ZONE_TARGET = {
		Id = 9926029284,
		Name = "ZONE_TARGET",
		Health = 300,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Green",
		AttackEffect = "Punch",
		Archetype = "Bunny",
		Cost = { Neutral = 1 },
		PlayTest = true,
		TokenDiscard = true,
		Effect = {
			Description = "Select a card in your Baseplate. Summon it.",
			Ability = {
				OnSummon = {
					Power = { { "SendToAllyFieldFromAlliedGenZone" } },
					Target = "TargetAllyFighterInBaseplate"
				}
			}
		},
		Bio = "ttars test cards"
	},
	MONSTER_REBORN = {
		Id = 145077494,
		Name = "Call of the Haunted",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Green",
		AttackEffect = "Punch",
		Cost = { Green = 8 },
		PlayTest = true,
		Effect = {
			Description = "Select a fighter in your Graveyard that has died this game. Summon it.",
			Ability = {
				OnSummon = {
					Power = { { "SendToAllyFieldFromAlliedGraveyard" } },
					Target = "TargetAllyFighterInGraveyardWhichDied"
				}
			}
		},
		Bio = "ttars test cards"
	},
	ACTIONADDER = {
		Id = 5220242204,
		Name = "Action Choice Adder",
		Health = 1200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Blue = 3, Green = 3 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Reveal 3 random Red or Blue Actions. Choose 1 to add to your hand.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "CreateChoices", "Lunar" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Ally"
				}
			},
			AmountOfTargets = 3
		},
		Bio = "Peri strike or bust."
	},
	["Demon Tutor"] = {
		Id = 6858800263,
		Name = "Demon Tutor",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Choose a card in your deck and add it to your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"TargetAllyDeck"
						},
						{
							"MoveZone",
							{ "Target", "Deck_Ally", "Hand_Ally", false, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Clearly this card is balanced. TEST CARD PLEASE IGNORE"
	},
	["Color Tutor"] = {
		Id = 6858800263,
		Name = "Color Tutor",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Choose a Yellow card in your deck and add it to your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Target", "Deck_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Color = "Yellow" },
						SelectionDescription = "beep boop"
					}
				}
			}
		},
		Bio = "Clearly this card is balanced. TEST CARD PLEASE IGNORE"
	},
	["Stat Saver"] = {
		Id = 2161586955,
		Name = "Stat Saver",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Save a target fighter's health and power. When this card attacks: gain that health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "Health", "CardHealth" },
							"Single"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Power", "CardPower" },
							"Single"
						}
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "CardHealth" }
						},
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "CardPower" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "If Bodyswap potion was so good why didnt they make Bodyswap potion 2 TEST CARD PLEASE IGNORE"
	},
	["Immortal Test"] = {
		Id = 9254600155,
		Name = "Immortal Draw",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		Archetype = "Kobold",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Draw a card from your Immortal Swords deck.",
			Ability = {
				OnSummon = {
					Power = { { "DrawImmortal", 1, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "TEST CARD PLEASE IGNORE"
	},
	["Force Majeure"] = {
		Id = 3217223111,
		Name = "Force Majeure",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Arkhive",
		Color = "Blue",
		Cost = { Red = 1 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Cast your newest card in your hand for free.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"AlliedRightMostHand"
						},
						{
							"ForceCast",
							{ "Variable" },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "TEST CARD PLEASE IGNORE"
	},
	Landlock = {
		Id = 3217223111,
		Name = "Landlock",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		ArtAnimation = "Test",
		Logo = "Plurral",
		Color = "Red",
		Terrain = true,
		Cost = { Red = 1 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Cast to your opponent's terrain slot. During their end step: you draw a card.",
			Ability = {
				OnEnd = {
					Power = { { "Draw", 1, "Opponent" } },
					Target = "Self"
				}
			},
			CastOnOpponent = true
		},
		Bio = "TEST CARD PLEASE IGNORE"
	},
	["Ransack Test"] = {
		Id = 12045607671,
		Name = "Ransack Test",
		Health = 1000,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		PlayTest = true,
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 2. If you do: Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 2 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 2
					}
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "TEST CARD PLEASE IGNORE"
	},
	MultiMoveZone = {
		Id = 12045607671,
		Name = "MultiMoveZone",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		PlayTest = true,
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Choose up to 6 cards to move from your grave to your hand",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "beep boop",
						MaxTargets = 6
					}
				}
			}
		},
		Bio = "TEST CARD PLEASE IGNORE"
	},
	SpecialBaseplateTest = {
		Id = 9964880944,
		Name = "SpecialBaseplateTest",
		Health = 400,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 1 },
		PlayTest = true,
		Effect = {
			Name = "Faker Hit",
			Description = "When this card is cast: You may baseplate an additional two Redcliff cards this turn.",
			Type = "OnSummon",
			Power = { {
				"SpecialBaseplateLimit",
				{ "Redcliff", 2 }
			} },
			Target = "Ally"
		},
		Bio = "TEST CARD"
	},
	EnemyTurnTargeter = {
		Id = 9964880944,
		Name = "EnemyTurnTargeter",
		Health = 1000,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1 },
		PlayTest = true,
		Effect = {
			Name = "Faker Hit",
			Description = "Whenever your opponent casts a fighter: deal 100 damage to a target fighter",
			Type = "OnEnemySummon",
			Power = { { "Damage", 100 } },
			Target = "Single"
		},
		Bio = "TEST CARD"
	},
	EnemyTurnTutor = {
		Id = 6858800263,
		Name = "EnemyTurnTutor",
		Health = 1000,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a fighter: Choose a card in your deck and add it to your hand.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"TargetAllyDeck"
						},
						{
							"MoveZone",
							{ "Target", "Deck_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Clearly this card is also balanced. TEST CARD PLEASE IGNORE"
	},
	TestMultiTargetParam = {
		Id = 14632204755,
		Name = "TestMultiTargetParam",
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Reveal all fighters that cost 4 or less studs in your opponent's hand. cards revealed this way cost one more red stud.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealCard", 30, "CustomTarget" },
						{
							"IncreaseCost",
							{ 1, "Red" },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = { "Fighter", "TotalCostOrLess" },
						Modifier = { TotalCostOrLess = 4 }
					}
				}
			}
		},
		Bio = "<b>*SNAP!* *SNAP!*</b> \"This'll be insane for the press!\""
	},
	TextFormatTest = {
		Id = 9964880944,
		Name = "TextFormatTest",
		Health = 1000,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		CustomReminder = {
			["This is formatted too"] = "Here's a Red Stud: {R}, Health and Power are also coloured here too."
		},
		Cost = { Neutral = 1, Red = 1 },
		PlayTest = true,
		Effect = {
			Name = "Faker Hit",
			Description = "This is a red stud: {R}\nThis is a blue stud: {B}\nThis is a green stud: {G}\nThis is a Yellow stud: {Y}\nThis is a Colourless stud: {W}",
			Type = "OnSummon",
			Power = { { "Damage", 1 } },
			Target = "Single"
		},
		Bio = "TEST CARD"
	},
	TestPhaseSwitch = {
		Id = 9964880944,
		Name = "TestPhaseSwitch",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1 },
		PlayTest = true,
		Effect = {
			Name = "Faker Hit",
			Description = "Deal 1000000 Unblockable damage to all enemy fighters",
			Type = "OnSummon",
			Power = { { "PierceDamage", 1000000 } },
			Target = "Opponent"
		},
		Bio = "TEST CARD"
	},
	TempVengefulTest = {
		Id = 9499339537,
		Name = "TempVengefulTest",
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 3 },
		Blessing = true,
		PlayTest = true,
		BlessingTimer = 1,
		Effect = {
			Description = "When this card is cast: Put a Vengeful Blessing into a card space in your hand until your next end step.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "VengefulBless", "RandomAllyHand" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Losing money is temporary, a close one - forever. Javion's authorities learnt how this would affect their sales the hard way."
	},
	TempDoomedTest = {
		Id = 9499339537,
		Name = "TempDoomedTest",
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 3 },
		Blessing = true,
		PlayTest = true,
		BlessingTimer = 2,
		Effect = {
			Description = "When this card is cast: Put a Doomed Blessing into a card space in your hand for two turns.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DoomedBless", "RandomAllyHand" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Losing money is temporary, a close one - forever. Javion's authorities learnt how this would affect their sales the hard way."
	},
	["Coupon of Potential"] = {
		Id = 5828514453,
		Name = "Coupon of Potential",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Neutral",
		AttackEffect = "Slash",
		Cost = { Neutral = 0 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Choose a color, you gain a stud of that color.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Green Stud", "Yellow Stud", "Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "Variable", 1 }
					},
					Target = "Ally"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Losing money is temporary, a close one - forever. Javion's authorities learnt how this would affect their sales the hard way."
	},
	TestColorConversion = {
		Id = 13006345968,
		Name = "TestColorConversion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		PlayTest = true,
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "Give yourself a red and a green card, change all green studs in its cost to yellow studs, and all red studs in its cost to blue studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomAdd", "Red" },
						{ "RandomAdd", "Green" }
					},
					Target = "Ally",
					MetaData = {
						ConvertColors = { Green = "Yellow", Red = "Blue" }
					}
				}
			}
		},
		Bio = "Shattered too hard that everything leaves you, even your spirit. Sink away from this realm,  bid farewell."
	},
	TestTerrainEffects = {
		Id = 9499339537,
		Name = "TestTerrainEffects",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 0 },
		PlayTest = true,
		Terrain = true,
		Effect = {
			Description = "During your end step: Return this card.",
			Ability = {
				OnEnd = {
					Power = { { "Return" } },
					Target = "Self"
				}
			}
		},
		Bio = "Losing money is temporary, a close one - forever. Javion's authorities learnt how this would affect their sales the hard way."
	},
	TestPerTurnCount = {
		Id = 11104447788,
		Name = "TestPerTurnCount",
		Health = 1000,
		Power = 0,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 0 },
		PlayTest = true,
		Effect = {
			Description = "Twice each turn, whenever you cast a fighter: This card gains 100 power",
			Ability = {
				OnAllySummon = {
					Power = { { "Strengthen", 100 } },
					Target = "Self",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "Test Card"
	},
	TestPerGameCount = {
		Id = 16456511362,
		Name = "TestPerGameCount",
		Health = 1000,
		Power = 0,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 0 },
		PlayTest = true,
		Effect = {
			Description = "Whenever you cast another allied fighter: it gains 400 health and power. This effect can only trigger twice.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{ "Strengthen", 400 },
						{ "Heal", 400 }
					},
					Target = "Aggressor",
					TotalTriggerLimit = 2
				}
			}
		},
		Bio = "Test Card"
	},
	HandCostConvertTest = {
		Id = 16834765905,
		Name = "HandCostConvertTest",
		Health = 1000,
		Power = 0,
		Rarity = "Common",
		Color = "Yellow",
		AttackEffect = "Slash",
		Cost = { Neutral = 3 },
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Reveal the newest card in your opponent's hand. Convert its non-Colourless cost to studs of that card's color.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealCard" },
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost" },
							"EnemyRightMostHand"
						},
						{
							"IncreaseCost",
							{ -1337, "Neutral", "Nil" },
							"EnemyRightMostHand"
						},
						{
							"IncreaseCost",
							{ "Variable", "Color", "Nil" },
							"EnemyRightMostHand"
						}
					},
					Target = "EnemyRightMostHand"
				}
			}
		},
		Bio = "hexo test card"
	},
	TestFighterGear = {
		Id = 13293424444,
		Name = "TestFighterGear",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		PlayTest = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target card in your hand becomes a gear.",
			Ability = {
				OnSummon = {
					Power = { { "GivePassive", "Gear" } },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "a card in your hand to turn into a gear"
					}
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestFighterTerrain = {
		Id = 13293424444,
		Name = "TestFighterTerrain",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		PlayTest = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target card in your hand becomes a Terrain.",
			Ability = {
				OnSummon = {
					Power = { { "GivePassive", "Terrain" } },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "a card in your hand to turn into a gear"
					}
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestMultiCardOperation = {
		Id = 100556601576910,
		Name = "TestMultiCardOperation",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select any number of cards in your hand. Destroy those cards and give yourself a card with a stud cost equal to each selected card",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "MultiSelectOperation", "Destroy", "CustomZoneTarget" }
					},
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 10,
						SelectionDescription = "any number of cards to destroy"
					}
				},
				MultiSelectOperationDestroy = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"Aggressor"
						},
						{ "RandomAdd", "VariableorExactCost", "Ally" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestDeckTriggers = {
		Id = 100556601576910,
		Name = "TestDeckTriggers",
		Health = 100,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		TriggerInDeck = true,
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, while this card is in your deck, reduce its cost by {W}",
			Ability = {
				OnEnd = {
					Power = { {
						"IncreaseCost",
						{ -1, "Neutral" },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestMultiEV = {
		Id = 100556601576910,
		Name = "TestMultiEV",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		TriggerInDeck = true,
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter gains health and power equal to this card's health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil", 2 },
							"Self"
						},
						{ "Heal", "Variable", "Single" },
						{ "Strengthen", "Variable2", "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestOpponentTarget = {
		Id = 100556601576910,
		Name = "TestOpponentTarget",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns: Your opponent selects a card in their hand. Destroy that card.",
			Ability = {
				OnAllyStart = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Hand_Opponent", "GraveZone_Opponent", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card in your hand."
					}
				}
			},
			OpponentTarget = true
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestOpponentTargetField = {
		Id = 100556601576910,
		Name = "TestOpponentTargetField",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns: Your opponent targets a fighter they control. Deal 400 damage to that fighter",
			Ability = {
				OnAllyStart = {
					Power = { { "Damage", 400, "SingleAlly" } },
					Target = "Self"
				}
			},
			OpponentTarget = true
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	TestNoMove = {
		Id = 100556601576910,
		Name = "TestNoMove",
		Health = 2000,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		PlayTest = true,
		NoFieldMovement = true,
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Should not move around on the field from its own actions, please report if it does somehow.",
			Ability = {
				OnEnd = {
					Power = { { "Cost", -100, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	Test32bitPC = {
		Id = 82426365825231,
		Name = "32bitPC If It Locked In",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		PlayTest = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Identity Fraud"] = "The card has the effect of a card in your deck."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select any number of cards in your deck Give yourself a copy of them, except they're a victim of identity fraud.",
			Ability = {
				OnSummon = {
					Power = { { "AddCopy" } },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						MinTargets = 0,
						MaxTargets = 99,
						SelectionDescription = "or multiple"
					},
					MetaData = { Nightwatcher = true }
				}
			}
		},
		Bio = "Remember kids: Identity fraud is more than just scary monsters in long eerie corridors!"
	},
	["Clean Impurities"] = {
		Id = 100453438127405,
		Name = "Clean Impurities",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy a gear attached to a target fighter, then deal 200 damage to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyGear", 1, "Single" },
						{ "Damage", 200, "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The Purifier calmly wiped the wet clay off his blade, unconcerned by the monster's screams. Each kill was justice for each victim of the Doomspire."
	},
	["The Purifier-Raid"] = {
		Id = 139942580236718,
		Name = "The Purifier",
		Health = 1400,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "RedKatana",
		Color = "Red",
		Cost = { Red = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		SummonAnimation = "PurifierSummon",
		SummonAnimationEffect = true,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Destroy a gear attached to a target fighter. this card gains 1000 Power.",
			Ability = {
				OnAttack = {
					Power = {
						{ "DestroyGear", 1, "Single" },
						{ "Strengthen", 1000 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The last able-bodied of the Emerald Knights of the Seventh Sanctum, Candidate 1 will stop at nothing to restore Robloxia to its former glory."
	},
	["The Sacrifice-Raid"] = {
		Id = 76114891601225,
		Name = "The Sacrifice",
		Health = 1800,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Summonant = "Shadowbeast",
		SummonAnimation = "SacrificeSummon",
		SummonAnimationEffect = true,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a gear is attached to an allied fighter: That fighter gains 50 health and power.",
			Ability = {
				OnAllyFighterEquip = {
					Power = {
						{ "Strengthen", 50 },
						{ "Heal", 50 }
					},
					NoBlip = true,
					Target = "Aggressor"
				}
			}
		},
		Bio = "Born into a lineage of maidens who slaughter themselves to stop the spire's growth, Candidate 2 would die a thousand times over to live up to her ancestor's lofty expectations."
	},
	["The Tainted-Raid"] = {
		Id = 112299398568032,
		Name = "The Tainted",
		Health = 1200,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Yellow = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		PlayTest = true,
		SummonAnimation = "TaintedSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter spirals into a Gilmuraig: Draw a card.",
			Ability = {
				OnAllySpiralTransform = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Transformed into a murderous monster by an orphaned fragment of the Cosmic Scab, Candidate 4's desire for revenge compel him to return that scar to its rightful father."
	},
	["The Auteur-Raid"] = {
		Id = 109480010542790,
		Name = "The Auteur",
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "IcePunch",
		Color = "Blue",
		Cost = { Blue = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Dextrous = true,
		PlayTest = true,
		SummonAnimation = "AuteurSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a gear: Give yourself three Shinies.",
			Ability = {
				OnAllyCastGear = {
					Power = {
						{ "RandomAdd", "Shinies" },
						{ "RandomAdd", "Shinies" },
						{ "RandomAdd", "Shinies" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "An elderly artist who has trained and released countless masterpieces, Candidate 3 journeys to the doomspire to create a piece that could impress even him."
	},
	["The Ultimate Pursuit of Science"] = {
		Id = 130258657224333,
		Name = "The Ultimate Pursuit of Science",
		Health = 1750,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 10, Green = 1, Yellow = 1 },
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach 6 random fighters to it with effects that trigger on death.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" },
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" },
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" },
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" },
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" },
						{ "RandomEquipGear", "Fighter HasEffectorOnDeath", "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Crashing and burning and burning and ."
	},
	RandomActionTest = {
		Id = 84655993897909,
		Name = "WondrousMagicSpells",
		Health = 1,
		Power = 3300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		OmniImmune = true,
		PlayTest = true,
		Cost = { Blue = 7, Red = 7 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, For every action in your baseplate: Destroy the newest card in your hand and give yourself a random fading action and cast it for free ignoring ranks and requirements, with targets chosen at random.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Action", "Nil" }
						},
						{ "EnterEVLoop" }
					},
					Target = "Self"
				},
				OnEVLoop = {
					Power = {
						{ "SpecificDiscard", 1, "AlliedRightMostHand" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "nil" },
							"AddedCard"
						},
						{ "UnBypassAction", "Ally" },
						{ "RandomAdd", "Action", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "nil" },
							"AddedCard"
						},
						{
							"ForceCast",
							{ "Variable" }
						}
					},
					MetaData = {
						RandomTarget = true,
						Requirement = { "Archetype", "Ally", 0, 9999, "" },
						Rank = 0,
						Fading = true
					},
					Target = "Ally"
				}
			}
		},
		Bio = "There's blood in this box! There's blood inside the box!"
	},
	EvilTestMZH = {
		Id = 8207875894,
		Name = "evil test mzh",
		Health = 250,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Punch",
		AlternateCost = { Neutral = 0 },
		Color = "Yellow",
		Charge = true,
		PlayTest = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Conflux",
			Description = "yeah",
			Type = "OnSummon",
			Power = { { "PierceDamage", 9999999 } },
			Target = "Opponent"
		},
		Bio = "kill everything ez"
	},
	TestAspirant = {
		Id = 82426365825231,
		Name = "TestAspirant",
		Health = 500,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		PlayTest = true,
		Aspiration = {
			["1KPower"] = { "HasPower", "Ally", 1, 9999, 1000 }
		},
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target fighter gains 200 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"GiveAspiration",
							{
								["1KPower"] = { "HasPower", "Ally", 1, 9999, 1000 }
							}
						},
						{ "Strengthen", 200, "Single" }
					},
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { "Fighter" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "to give Aspiration to"
					},
					UniqueTargets = true
				}
			}
		},
		Bio = "Remember kids: Identity fraud is more than just scary monsters in long eerie corridors!"
	},
	TestAspirant2 = {
		Id = 82426365825231,
		Name = "TestAspirant2",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		PlayTest = true,
		Aspiration = {
			EnemyDeath = { "Playertable", "Him", 1, 9999, "DeathStorm" }
		},
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				OnSummon = {
					Power = { {
						"GiveAspiration",
						{
							EnemyDeath = { "Playertable", "Him", 1, 9999, "DeathStorm" }
						}
					} },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { "Fighter" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "to give Aspiration to"
					}
				}
			}
		},
		Bio = "Remember kids: Identity fraud is more than just scary monsters in long eerie corridors!"
	}
}
