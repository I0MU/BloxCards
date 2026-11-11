



return {
	["Clansman o' the Heights"] = {
		Id = 137542360957390,
		Name = "Clansman o' the Heights",
		SearchTerms = "Clansman of the Heights",
		Health = 500,
		Power = 300,
		Rarity = "Common",
		Color = "Red",
		Cost = { Neutral = 3 },
		AttackEffect = "Slash",
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Description = "When this card is cast: Ransack 2. If you do, search your deck for a nonfighter card. You lose 500 life.",
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
					Power = {
						{ "Cost", 500 },
						{ "RandomTutorfor", "NotFighter" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The only thing the Heightsmen hate more than each other is some outsider telling them what to do."
	},
	["Gundebted Mercenary"] = {
		Id = 129960108842160,
		Name = "Gundebted Mercenary",
		Health = 500,
		Power = 200,
		Rarity = "Common",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		CustomReminderDebt = true,
		AttackEffect = "Slash",
		Effect = {
			Description = "When this card is cast: Destroy the oldest card in your opponent's hand. You gain 3 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "Debt", 3, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I get how the other hellholes these pests come from have the name, but what in Shed's name is a 'gun?'\"\n— Kenneth Haxbury"
	},
	["Brawling Berserker"] = {
		Id = 122883671045384,
		Name = "Brawling Berserker",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 1, Yellow = 1 },
		AttackEffect = "Axe",
		RansackCount = 0,
		AttackRequirement = { "Playertable", "Me", 1, 99999, "ObliterateCount" },
		Effect = {
			Description = "This card can't attack until you've obliterated a card this turn.\nWhen this card is cast: Ransack 3 cards in any graveyard. If you do, deal 100 damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone", "Enemy_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 3 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 3
					}
				},
				OnEVCheckPass = {
					Power = { { "Damage", 100 } },
					Target = "Single"
				}
			}
		},
		Bio = "The Pictured don't believe in armour or defeat; Their gods know they will win."
	},
	["Spiteheart Shocktrooper"] = {
		Id = 124080954614190,
		Name = "Spiteheart Shocktrooper",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Red = 2, Yellow = 2 },
		Logo = "Conquerors",
		AttackEffect = "Slash",
		Effect = {
			Description = "Once each turn, whenever a card leaves your baseplate: This card gains 300 Health. Your opponent loses 300 life.",
			Ability = {
				OnAllyGenZoneRemove = {
					Power = {
						{ "Inflict", 300, "Opponent" },
						{ "Heal", 300, "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Hatred burrows deep."
	},
	["Mail Armour"] = {
		Id = 74787720807234,
		Name = "Mail Armour",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 2 },
		AttackEffect = "British",
		Archetype = "Armour",
		Gear = true,
		AddPower = 0,
		AddHealth = 300,
		Effect = {
			Description = "Attach to a target fighter.\nWhen you do: Lock a target enemy fighter for 1 turn.",
			Ability = {
				OnSummon = {
					Power = { { "Lock", 1 } },
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "The only protection against a dæmon's blade, stolen from the dæmons themselves."
	},
	Statecraft = {
		Id = 124850825166439,
		AltCards = {
			["Statecraft-Brawl"] = {
				Id = 76077358448726,
				Effect = {
					Description = "Prepare this card.\nAt the start of your next turn: Select a card in your opponent's hand. Destroy it and their terrain.",
					Ability = {
						OnSummon = {
							Power = { {
								"AddGenZone",
								{ "Statecraft Prep-Brawl", 1 }
							} },
							Target = "Ally"
						}
					}
				},
				Bio = ""
			}
		},
		Name = "Statecraft",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Yellow = 1, Red = 1 },
		AttackEffect = "British",
		CustomReminder = {
			["Tendrils of Bureaucracy"] = "Prepared cards are put into baseplate inert. They destroy themselves when they trigger."
		},
		Effect = {
			Description = "Prepare this card.\nAt the start of your next turn: Select a card in your opponent's hand. Destroy it and their terrain.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Statecraft Prep", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "The kingdoms of the Dark Ages that submitted to Dæmonic rule were so improved by it as to make resistance insane."
	},
	["Statecraft Prep"] = {
		Id = 130061095642990,
		Name = "Prepared Statecraft",
		AltCards = {
			["Statecraft Prep-Brawl"] = { Id = 76077358448726, Bio = "" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Red",
		Cost = { Yellow = 1, Red = 1 },
		AttackEffect = "British",
		TokenGenZone = true,
		Prepared = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your next turn: Select a card in your opponent's hand. Destroy it, their terrain, and this card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "SpecificDiscard", 1, "CustomZoneTarget" },
						{ "DestroyTerrain", 30, "Opponent" },
						{
							"MoveZone",
							{ "Statecraft Prep", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = {},
						SelectionDescription = "a card to destroy",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "Yet even still, death was preferable to sanity."
	},
	["Herald of Court Normynstre"] = {
		Id = 133681715392060,
		Name = "Herald of Court Normynstre",
		Health = 800,
		Power = 100,
		Rarity = "Common",
		Color = "Red",
		Cost = { Red = 1 },
		TriggerInGenZone = true,
		AttackEffect = "Jab",
		Logo = "Conquerors",
		Effect = {
			Description = "When this card is cast or put into baseplate: Select Red, Blue, or Yellow. This card becomes that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" },
						{
							"EVExactValueCheck",
							{ "Blue", "IsBlue" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "IsYellow" }
						}
					},
					Target = "Self",
					DontTriggerInGenZone = true
				},
				OnAnyTrigger = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" },
						{
							"EVExactValueCheck",
							{ "Blue", "IsBlue" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "IsYellow" }
						}
					},
					Target = "Self",
					DontTriggerInField = true,
					TotalTriggerLimit = 1
				},
				OnEVCheckPassIsBlue = {
					Power = { { "ReplaceCardArt", 87512261000240, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassIsYellow = {
					Power = { { "ReplaceCardArt", 92877802783681, "Self" } },
					Target = "Self",
					NoBlip = true
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "\"A decree from my liege! Your town is to be evacuated within 24 hours to search for the Worldthief! A 200,000 Kromer reward to anyone who has information on this fugitive!\""
	},
	["Longbow Volley"] = {
		Id = 122400632137662,
		Name = "Longbow Volley",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1, Blue = 1 },
		AttackEffect = "British",
		Logo = "Conquerors",
		Lunar = true,
		CustomReminder = {
			["Set Up Formation"] = "Prepared cards are put into baseplate, are inert in there, and destroy themselves when they trigger."
		},
		Effect = {
			Description = "Prepare this card.\nAt the start of your next turn: Deal 300 damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Longbow Volley Prep", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "All of Æthelward's peasants were trained in archery, ready to block the sun at a moment's notice."
	},
	["Longbow Volley Prep"] = {
		Id = 93552718135116,
		Name = "Prepared Longbow Volley",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1, Blue = 1 },
		AttackEffect = "British",
		TokenGenZone = true,
		Prepared = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your next turn: Deal 300 damage to all enemy fighters. Destroy this card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Damage", 300, "Opponent" },
						{
							"MoveZone",
							{ "Longbow Volley Prep", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "William is used to blotting out the sun."
	},
	["The Heights Subjugated"] = {
		Id = 125883488728274,
		Name = "The Heights Subjugated",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 2, Blue = 3, Neutral = 1 },
		AttackEffect = "British",
		Terrain = true,
		Summonant = "Peasant",
		Terrariant = "Panrobloxian Capital",
		Effect = {
			CastOnOpponent = true,
			Description = "Your opponent casts this terrain. When they do: Summon 3 100/1000 Peasants that're inert in play.\nWhenever a Colourless fighter dies: You lose 200 life and gain {W}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" }
					},
					Target = "Opponent"
				},
				OnAnyDeath = {
					Power = {
						{ "Cost", 200 },
						{ "Neutral", 1 }
					},
					Target = "Ally",
					Color = "Neutral"
				}
			}
		},
		Bio = "Kenneth weeped at the death of his home."
	},
	["Familial Fracture"] = {
		Id = 101952572853025,
		Name = "Familial Fracture",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 2, Blue = 2 },
		AttackEffect = "British",
		CustomReminderDebt = true,
		Lunar = true,
		Effect = {
			Description = "Select 1 effect—\n{C1} — A target fighter gains 300 Power for each card type you've cast this turn.\n{C2} — Draw 3 cards. You gain 9 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Haxbury", "Dæmonium" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{
							"ForceCast",
							{ "Variable" }
						}
					},
					Target = "Ally"
				}
			},
			IgnoreHandSize = true,
			CreateAllAsChoices = true
		},
		Bio = "One had chosen dæmonkind. One had chosen the noobkin. Only one could be right."
	},
	Haxbury = {
		Id = 113000963912391,
		Name = "Haxbury",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		AttackEffect = "British",
		Fading = true,
		Effect = {
			Description = "A target fighter gains 300 Power for each card type you've cast this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "CastAction", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastGear", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastTerrain", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastFighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{ "Strengthen", "Variable", "Single" }
					},
					Target = "Self"
				}
			},
			IgnoreHandSize = true,
			CreateAllAsChoices = true
		},
		Bio = "\"\""
	},
	["Dæmonium"] = {
		Id = 99373405609520,
		Name = "Dæmonium",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Blue",
		Cost = { Neutral = 0 },
		AttackEffect = "British",
		Fading = true,
		CustomReminderDebt = true,
		Logo = "Conquerors",
		Effect = {
			Description = "Draw 3 cards.\nYou gain 9 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 3 },
						{ "Debt", 9 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["The Haxbury Twins"] = {
		Id = 132521360174549,
		Name = "The Haxbury Twins",
		Health = 1600,
		Power = 200,
		Rarity = "Epic",
		Color = "Red",
		Cost = { Neutral = 1, Yellow = 2, Blue = 3 },
		AttackEffect = "Jab",
		Charge = true,
		Dextrous = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Destroy the bottom card of each player's deck. Each player whose card costs more total studs draws a card.",
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
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Fix" },
							"Self"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckPassFix = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "OwnerDrawCard" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = "TopCard"
					},
					NoBlip = true
				},
				OnEVCheckFailOwnerDrawCard = {
					Power = { {
						"EVExactValueCheck",
						{ 0, "Exactsies" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFailExactsies = {
					Power = { { "Draw", 1 } },
					Target = "Opponent",
					NoBlip = true
				},
				OnEVCheckPassExactsies = {
					Power = { { "Draw", 1 } },
					Target = "All",
					NoBlip = true
				},
				OnEVCheckPassOwnerDrawCard = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "\"Dæmonic subjugation is inevitable,\" sighed Canute.\n\"Better dead than a serf,\" argued Kenneth."
	},
	["The Slab of Destiny"] = {
		Id = 83781301005908,
		Name = "The Slab of Destiny",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Color = "Red",
		Cost = { Yellow = 2, Blue = 2 },
		AttackEffect = "British",
		EffectVariable = 0,
		Gear = true,
		AddHealth = 200,
		AddPower = 200,
		Transformant = "Peasant",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Transform all fighters into Peasants that're inert in play.",
			Ability = {
				OnDeath = {
					Power = { { "Transform", "Transformant", "All" } },
					Target = "Self"
				}
			}
		},
		Bio = "The coronation stone is merely a stolen rock, yet the symbolism is worth more than a motte of gold."
	},
	["William the Conqueror"] = {
		Id = 107391644180362,
		Name = "William the Conqueror",
		AltCards = {
			["William the Conqueror-Offer"] = {
				Id = 134134130690634,
				Name = "The Conqueror: Kgxraqyt",
				ArtAnimation = "The Conqueror kgxraqyt",
				AttackEffect = "Flare",
				Bio = "\"The king sought deity;<br/>met only ashes\""
			}
		},
		Health = 1900,
		Power = 100,
		Rarity = "Legendary",
		Color = "Red",
		CantAICast = true,
		Cost = { Neutral = 1, Red = 4, Yellow = 2, Blue = 1 },
		AttackEffect = "Flare",
		Logo = "Conquerors",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your opponent's turn: They select 1 effect—\n{C1} — You draw 2 cards.\n{C2} — All your fighters gain 4000 power.",
			Ability = {
				OnEnemyStart = {
					Power = {
						{
							"CreateChoices",
							{ "Tribute", "Idiocy" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Opponent" },
						{
							"ForceCast",
							{ "Variable" },
							"Opponent"
						}
					},
					Target = "CurrentTurn"
				}
			},
			CreateAllAsChoices = true,
			IgnoreHandSize = true,
			OpponentTarget = true
		},
		Bio = "A ruthless leader of the Alpha Wars, whose ambition transcends time, colour, and species."
	},
	Tribute = {
		Id = 133114714830442,
		Name = "Tribute",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		AttackEffect = "British",
		Stealth = true,
		Logo = "Conquerors",
		Effect = {
			Name = "Reincarnation",
			Description = "Your opponent draws 2 cards.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 2 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Which one will it be? Your assistance in finding the Alpha Brick?"
	},
	Idiocy = {
		Id = 119033515755529,
		Name = "Idiocy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		AttackEffect = "British",
		Logo = "Vitality",
		Stealth = true,
		Effect = {
			Name = "Reincarnation",
			Description = "All enemy fighters gain 4000 Power.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 4000 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Or every single man, woman, child, animal, and building burnt to total oblivion, lost even to history books?"
	},
	["Uncivilised Brute"] = {
		Id = 79529818828102,
		Name = "Uncivilised Brute",
		Health = 300,
		Power = 300,
		Rarity = "Common",
		Color = "Blue",
		Cost = { Neutral = 2 },
		AttackEffect = "Jab",
		Effect = {
			Description = "At the start of your turns: Search your deck for a non-Blue card. Your opponent draws a card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Draw", 1, "Opponent" },
						{ "RandomTutorfor", "BlueorNotClr", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Herrus treats his pets well. Some even learn something."
	},
	["Stundebted Engineer"] = {
		Id = 113871620392059,
		Name = "Stundebted Engineer",
		AltCards = {
			["Stundebted Engineer-Login"] = {
				Id = 124071205381605,
				Name = "Flashback Debtor",
				AttackEffect = "MagicBlue",
				Bio = "\"Noobkin often mistook Herrus' technology for magic. They weren’t always wrong.\""
			}
		},
		Health = 500,
		Power = 100,
		Rarity = "Common",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		CustomReminderDebt = true,
		AttackEffect = "Punch",
		CustomReminder = {
			["Glimpse the Future"] = "A fleeting card is destroyed during your end step if it's not cast. Fading cards don't enter the graveyard."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select an action card in your graveyard. Recur that card, except it's fading and fleeting. You gain 3 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Debt", 3, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Action = true },
						SelectionDescription = "an action to recur from your graveyard",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Fleeting = true, Fading = true }
				}
			},
			ChooseFromZone = "GraveZone",
			AmountOfTargets = 3
		},
		Bio = "\"Other than 'tarmac,' 'algebra,' 'windmills,' or 'trebuchets,' what has dæmonkind done for us?\"\n— Kenneth Haxbury"
	},
	["Ænigmata Mentor"] = {
		Id = 132882776452384,
		Name = "Ænigmata Mentor",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		SearchTerms = { "Aenigmata Mentor", "Enigmata Mentor", "Anigmata Mentor" },
		Color = "Blue",
		Cost = { Blue = 1, Yellow = 2 },
		Logo = "Conquerors",
		AttackEffect = "Jab",
		Effect = {
			Description = "When this card is cast: Put the bottom 2 cards of your opponent's deck and graveyard into your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Opponent", "GraveZone_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Opponent", "GraveZone_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "TopCard", "GraveZone_Opponent", "GraveZone_Ally", false, false }
						},
						{
							"MoveZone",
							{ "TopCard", "GraveZone_Opponent", "GraveZone_Ally", false, false }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "\"When you speak as a dæmon, you think as one.\"\n— Kenneth Haxbury"
	},
	["Corpse Catapult"] = {
		Id = 118506134313184,
		Name = "Corpse Catapult",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Blue",
		Cost = { Red = 3 },
		AttackEffect = "British",
		Archetype = "Tech",
		Lunar = true,
		CustomReminder = {
			Miasma = "While in play, a decaying fighter is dealt 200 damage during its end steps. A zombified fighter is obliterated when it leaves play."
		},
		Effect = {
			Description = "All fighters in all hands gain zombified and decaying.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Decaying" },
						{ "GivePassive", "Zombified" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand", "Enemy_Hand" },
						Condition = "Fighter"
					}
				}
			}
		},
		Bio = "You should be happy to see your family again. They jumped a wall to hug you!"
	},
	["Lay of the Land"] = {
		Id = 114269508197577,
		Name = "Lay of the Land",
		AltCards = {
			["Lay of the Land-Brawl"] = {
				Id = 122591062596324,
				Name = "Demon Recon",
				AttackEffect = "Scratch",
				AddGenZoneant = "Lay Prep-Brawl",
				Bio = "\"Let them try to breach Mount Xargasdon, I dare.\" - Dominion deviling's last words"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Blue",
		Cost = { Yellow = 1, Red = 1 },
		AttackEffect = "British",
		AddGenZoneant = "Lay Prep",
		Logo = "Conquerors",
		CustomReminder = {
			Scouting = "Prepared cards are put into baseplate inert. They destroy themselves when they trigger.",
			["Live off the land"] = "A fleeting card is destroyed if not cast this turn."
		},
		Effect = {
			Description = "Draw a fleeting card and lose 300 life. Prepare this card.\nAt the start of your next turn: Draw a fleeting card and lose 300 life.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1 },
						{ "Cost", 300 },
						{
							"AddGenZone",
							{ "AddGenZoneant", 1 }
						}
					},
					Target = "Ally"
				}
			},
			EffectFleeting = true
		},
		Bio = "Herrus' schemes to stop William's conquest suspiciously didn't do anything to protect the natives."
	},
	["Lay Prep"] = {
		Id = 94925258650889,
		Name = "Prepared Lay of the Land",
		AltCards = {
			["Lay Prep-Brawl"] = {
				Id = 122591062596324,
				Name = "Demon Recon",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "\"Let them try to breach Mount Xargasdon, I dare.\" - Dominion deviling's last words"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Blue",
		Cost = { Yellow = 1, Red = 1 },
		CustomReminder = {
			Scouting = "Prepared cards are put into baseplate inert. They destroy themselves when they trigger.",
			["Live off the land"] = "A fleeting card is destroyed if not cast this turn."
		},
		AttackEffect = "British",
		TokenGenZone = true,
		Prepared = true,
		TriggerInGenZone = true,
		Logo = "Conquerors",
		Effect = {
			Description = "At the start of your next turn: You draw a fleeting card and lose 300 life. Destroy this card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Draw", 1 },
						{ "Cost", 300 },
						{
							"MoveZone",
							{ "Lay Prep", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						}
					},
					Target = "Ally"
				}
			},
			EffectFleeting = true
		},
		Bio = "Because if William got the brick, the natives would never be safe."
	},
	["Paraselene Monitor"] = {
		Id = 93923054839312,
		Name = "Paraselene Monitor",
		AltCards = {
			["Paraselene Monitor-Login"] = {
				Id = 72481203652804,
				Name = "Paraselene Nothingdoer",
				AttackEffect = "MagicBlue",
				Bio = "Bachelor of showing concern and PhD of threatening to do something"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		AttackEffect = "MagicBlue",
		Moonward = true,
		Effect = {
			Description = "At the start of each player's turn: Add {W} to each action in their hand.",
			Ability = {
				OnEnemyStart = {
					Power = { {
						"IncreaseCost",
						{ 1, "Neutral" }
					} },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "Action",
						Modifier = true
					}
				},
				OnAllyStart = {
					Power = { {
						"IncreaseCost",
						{ 1, "Neutral" }
					} },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Action",
						Modifier = true
					}
				}
			}
		},
		Bio = "\"While technically not a freedom lock, the dæmonic invasion of the Prime Planet is nontheless deeply concerning. We will be monitoring this situation closely.\"\n— Evincar Dal of the Paraselene Sages"
	},
	["Quantum Shield"] = {
		Id = 129815066023888,
		Name = "Quantum Shield",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "British",
		Color = "Blue",
		Cost = { Blue = 1, Red = 2 },
		EffectVariable = 0,
		Gear = true,
		AddHealth = 200,
		AddPower = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this card attacks: Obliterate the top card of your graveyard. Search your deck for a card with the same card type.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertCardType", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{ "RandomTutorfor", "Variable", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "So beyond his time was Herrus' knowledge that those unlucky enough to encounter it could only think it magic."
	},
	["Prophet of Brutality"] = {
		Id = 91878130337854,
		Name = "Prophet of Brutality",
		Health = 600,
		Power = 100,
		Rarity = "Rare",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		AttackEffect = "MagicBlue",
		Token = true,
		CustomReminder = {
			["War Never Changes"] = "The Tech cards are Corpse Catapult, Phlogiston Barrel, Steel Moatcutter, and Death Cloud."
		},
		Effect = {
			Description = "During your end step: Search your deck for a Tech card.",
			Ability = {
				OnEnd = {
					Power = { { "RandomTutorfor", "Tech" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Swarms of mercury birds and yellow meeboids! Sculpted thorns and corpses abound! It'll happen! IT'LL HAPPEN!\""
	},
	["Foot of Xargasdon"] = {
		Id = 83521858807209,
		Name = "Foot of Xargasdon",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Blue",
		Cost = { Blue = 2 },
		AttackEffect = "British",
		Terrain = true,
		Terrariant = "Arkhive Worksite",
		Effect = {
			Description = "When this card is cast: Swap the stats of a target fighter.\nDuring your end step, if you obliterated a card this turn: Return this card to its hand.",
			Ability = {
				OnSummon = {
					Power = { { "Swap" } },
					Target = "Single"
				},
				OnEnd = {
					Power = { { "Return" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 1, 9999, "ObliterateCount" }
				}
			}
		},
		Bio = "\"It's only at the foot of a mountain you appreciate how tall it is.\"\n— Canute Haxbury"
	},
	["Out the Dark Ages"] = {
		Id = 77528504024190,
		Name = "Out the Dark Ages",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Blue",
		Cost = { Blue = 2, Red = 2, Yellow = 2 },
		AttackEffect = "British",
		CustomReminderRansack = true,
		RansackCount = 0,
		Logo = "Conquerors",
		Effect = {
			Description = "Ransack 15. If you do, a target fighter gains 1200 Health and Power. Attach overload to it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 14 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 15 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 15
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 1200 },
						{ "Strengthen", 1200 },
						{ "EquipGear", "Overloaded Mod" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Canute found the summons to Herrus' camp surreal; The elder dæmon taking such interest in a lowly scribe? To be treated with such respect? To be given such massive vaults of information on the enemies assualting Haxbury freely?\n\nIt was enough for Canute to disregard any ulterior motive."
	},
	["Tome of Armageddon"] = {
		Id = 119980952783298,
		Name = "The Tome of Armageddon",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		SearchTerms = { "Domesday Book", "Doomsday Book" },
		Color = "Blue",
		Cost = { Red = 2, Yellow = 2 },
		AttackEffect = "British",
		AddHealth = 300,
		AddPower = 300,
		Gear = true,
		Logo = "Conquerors",
		Effect = {
			Description = "Attach to a target fighter.\nWhenever your opponent casts a card: Steal a {W} from them. Destroy the oldest card in their hand if you stole their last {W}.",
			Ability = {
				OnAnyEnemyCast = {
					Power = {
						{ "Neutral", -1, "Opponent" },
						{ "Neutral", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = "BottomCard"
					},
					EffectRequirement = { "Playertable", "Me", 1, 9999, "IconsNeutral" }
				},
				OnEVCheckPass = {
					Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
					Target = "EnemyLeftMostHand",
					NoBlip = true
				}
			}
		},
		Bio = "This colossal tax document knew Herrus' subjects better than they knew themselves."
	},
	["Scramble for the Heavens"] = {
		Id = 103931475017177,
		Name = "Scramble for the Heavens",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Color = "Blue",
		Cost = { Red = 2, Yellow = 2, Blue = 2, Neutral = 2 },
		AttackEffect = "British",
		Logo = "Conquerors",
		Effect = {
			Description = "Recur 9 enemy cards.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Any", "GraveZone_Opponent", "Hand_Ally", true, false, 9 },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Carved into three heavens, the planet once known as Robloxia even lost its name."
	},
	["Herrus the Omniscient"] = {
		Id = 83265243621558,
		Name = "Herrus the Omniscient",
		AltCards = {
			["Herrus the Omniscient-Offer"] = {
				Id = 123470356527149,
				Name = "Herrus the Omniscient",
				AttackEffect = "Jab",
				ArtAnimation = "Herrusis_verity"
			}
		},
		Health = 2100,
		Power = 200,
		Rarity = "Legendary",
		Color = "Blue",
		CantAICast = true,
		EffectVariable = 0,
		Logo = "Conquerors",
		Cost = { Neutral = 1, Blue = 4, Yellow = 1, Red = 2 },
		AttackEffect = "Gravity",
		Effect = {
			Description = "Play with the top card of each player's deck and their hands revealed.\nDuring each player's end step: Obliterate the oldest card in their opponent's hand and all their blessings, then they draw 3 cards. They can only cast the leftmost cards in their hand next turn.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"SetCastRestriction",
							{
								{ "AllyLeftMostCard" },
								"Cast only the leftmost card this turn."
							},
							"Ally"
						},
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "RemoveHandModifiers", 30, "Me" },
						{ "Draw", 3 }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "All",
						Modifier = true
					}
				},
				OnEnd = {
					Power = {
						{
							"SetCastRestriction",
							{
								{ "AllyLeftMostCard" },
								"You may only cast the leftmost card this turn."
							},
							"Opponent"
						},
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "RemoveHandModifiers", 30, "Him" },
						{ "Draw", 3 }
					},
					Target = "Opponent",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "All",
						Modifier = true
					}
				},
				OnAnyTrigger = {
					Power = {
						{
							"EVExactValueCheck",
							{ 0, "Ally" }
						},
						{
							"EVExactValueCheck",
							{ 0, "Opp" }
						},
						{ "RevealHand", 30, "Opponent" },
						{ "RevealHand", 30, "Ally" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassAlly = {
					Power = { { "RevealTopDeck", 30, "Ally" } },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Deck", "Ally", 1, 999999, "Cards" }
				},
				OnEVCheckPassOpp = {
					Power = { { "RevealTopDeck", 30, "Opponent" } },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Deck", "Opponent", 1, 999999, "Cards" }
				}
			},
			EffectSpecificDiscardObliterate = true
		},
		Bio = "An intellect so unrivalled as to domesticate those underneath him."
	},
	["Haxbury Dogsbody"] = {
		Id = 122244347748151,
		Name = "Haxbury Dogsbody",
		Health = 500,
		Power = 450,
		Rarity = "Common",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		AttackEffect = "Slash",
		Effect = {
			Description = "Once each turn, whenever an enemy fighter dies: Put a copy of it into your graveyard. The copy generates.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "GraveAdd", "Variable" },
						{ "Generate", 1, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard",
						Modifier = 1
					},
					TurnTriggerLimit = 1
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"You think you can lay your ugly fingers on my king? You pillock!\""
	},
	["Fundebted Merchant"] = {
		Id = 92355653235767,
		Name = "Fundebted Merchant",
		Health = 400,
		Power = 300,
		Rarity = "Common",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		Addant = "Targeting Blip",
		CustomReminderDebt = true,
		CustomReminder = {
			["Robux Stack"] = "A free action, inert in all zones. A target fighter gains 50 Health."
		},
		AttackEffect = "Money",
		Effect = {
			Description = "When this card is cast: Give yourself 3 Robux Stacks with their cost removed. You gain 3 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Debt", 3 }
					},
					Target = "Self",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				}
			}
		},
		Bio = "Celes' first act over Æthelward's realm was to disperse his coffers to her most loyal new subjects."
	},
	["Pumpkindread Perfect"] = {
		Id = 76476547690981,
		Name = "Pumpkindread Perfect",
		AltCards = {
			["Pumpkindread Perfect-Login"] = {
				Id = 93706117535875,
				Name = "Pumpkindread Slayer",
				Bio = "\"im really cool you a biiiig loser me the biiiiig cool\""
			}
		},
		Health = 750,
		Power = 1750,
		Rarity = "Common",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3, Red = 3 },
		Overload = true,
		AttackEffect = "Axe",
		Logo = "Conquerors",
		Effect = {
			Description = "Whenever this card is cast or attacks: Select a card in your baseplate. Destroy it.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = {},
						SelectionDescription = "a card to destroy",
						MinTargets = 1,
						MaxTargets = 1
					},
					NoBlip = true
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = {},
						SelectionDescription = "a card to destroy",
						MinTargets = 1,
						MaxTargets = 1
					},
					NoBlip = true
				}
			}
		},
		Bio = "Each pumpkindread follows a lineage of excellence and servitude, striving to surpass their ancestors."
	},
	Peasantnapper = {
		Id = 72153370308115,
		Name = "Peasantnapper",
		Health = 1000,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Blue = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Frenemy",
			Description = "Whenever this card attacks: Each player draws 2 cards from their opponent's deck.",
			Type = "OnAttack",
			Power = {
				{
					"MoveZone",
					{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Ally", "Hand_Opponent", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Ally", "Hand_Opponent", true, false },
					"Self"
				}
			},
			Target = "Ally",
			MovezoneAsDraw = true
		},
		Bio = "\"So evil was my master's taxes that my people celebrated being kidnapped by yours, ma'am.\"\n— Canute Haxbury"
	},
	["Traitorous Thane"] = {
		Id = 137260952392141,
		Name = "Traitorous Thane",
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Money",
		Color = "Yellow",
		Cost = { Neutral = 1, Blue = 1, Red = 1 },
		EffectVariable = 0,
		GraveAddant = "Peasant",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is obliterated by a ransack ability: Put 4 Peasants into your graveyard.",
			Ability = {
				OnRansacked = {
					Power = {
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"I couldn't betray king Æthelward. He's done so much...\"\nCount Celes presented the tax collector with more gems than he'd ever seen in his life.\n\"...corruption. He probably deserves it!\""
	},
	Peasant = {
		Id = 104465402382267,
		Name = "Peasant",
		Health = 100,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		CustomReminderRansack = true,
		EffectVariable = 0,
		Archetype = "Serf",
		Token = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { { "GraveAdd", "GraveAddant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Born to a land, tied to a land, forced to work the land for my betters."
	},
	["Gurtball Mob"] = {
		Id = 134544618623925,
		AltCards = {
			["Gurtball Mob-Brawl"] = {
				Name = "The Flying Gurts",
				Effect = {
					Description = "When this card is cast: Attach Gurt... Down? to a target fighter.",
					Ability = {
						OnSummon = {
							Power = { { "EquipGear", "GurtDown" } },
							Target = "Single"
						}
					}
				},
				AttackEffect = "MagicYellow",
				Id = 92611190595722,
				Bio = "“According to all known laws of aviation, there is no way that a Gurt should be able to fly. Its wings are too small to get its fat little body off the ground. The Gurt, of course, flies anyways. Because Gurts don't care what Noobkin think is impossible.”"
			}
		},
		Name = "Gurtball Mob",
		Health = 1400,
		Power = 100,
		Rarity = "Uncommon",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		AttackEffect = "MagicYellow",
		EffectVariable = 0,
		Charge = true,
		CustomReminder = {
			Gurtball = "Whenever this fighter attacks another: A target enemy fighter gains -100/+200. Move Gurtball to that fighter."
		},
		Effect = {
			Description = "When this card is cast: Attach a Gurtball to a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Gurtball" } },
					Target = "Single"
				}
			}
		},
		Bio = "Celes found her critics easily distracted and her followers easily amused."
	},
	Gurtball = {
		Id = 136435149054491,
		AltCards = {
			GurtDown = {
				Name = "Gurt... Down?",
				AttackEffect = "MagicYellow",
				Id = 88252117868179,
				Bio = "Don't think too hard about it"
			}
		},
		Name = "Gurtball",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		AttackEffect = "British",
		EffectVariable = 0,
		Gear = true,
		AddHealth = 0,
		AddPower = 0,
		Effect = {
			Description = "Attach to a target fighter.\nWhenever this fighter attacks another: Deal 100 damage to a target enemy fighter and it gains 200 Power. Move Gurtball to it.",
			Ability = {
				OnAttackFighter = {
					Power = {
						{ "Damage", 100 },
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" }
						},
						{
							"MoveGear",
							{ "Variable", "Self", true, false },
							"Self"
						}
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "Gurts are pustules found in those who commit unspeakable deeds."
	},
	Weregild = {
		Id = 84734953849537,
		Name = "Weregild",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		AttackEffect = "British",
		EffectVariable = 0,
		Logo = "Conquerors",
		CustomReminder = {
			["Points of Rarity"] = "A commoner draws 1 card; A legend draws 5. A token draws 0."
		},
		Effect = {
			Description = "Destroy a target fighter. Its controller draws cards equal to its rarity.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "ConvertRarity", "Rarity" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "IsOwnedByAlly", "Nil" }
						},
						{ "EVExactValueCheck", 0, "Self" },
						{ "Destroy" }
					},
					Target = "Single"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "ConvertRarity", "Rarity" },
							"Self"
						},
						{ "Draw", "Variable" }
					},
					Target = "Opponent",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "ConvertRarity", "Rarity" },
							"Self"
						},
						{ "Draw", "Variable" }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "Nice law, putting a price to be paid for the slaughter of the elites. Shame you're nothing now, huh?"
	},
	Enfeoffment = {
		Id = 108805186620664,
		Name = "Enfeoffment",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2, Blue = 2 },
		AttackEffect = "British",
		Logo = "Conquerors",
		Effect = {
			Description = "If there's 25 or more cards in your graveyard, obliterate them and steal a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 24 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Steal", 30, "SingleEnemy" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						}
					},
					Target = "Ally",
					NoBlip = true,
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "RandomCard",
						Modifier = 30
					}
				}
			}
		},
		Bio = "\"Slander me as much as you please. It doesn't matter how history remembers me as long as my people are safe.\"\nThe request was the only thing Celes respected about the king utterly broken before her."
	},
	["The Isles of Haxbury"] = {
		Id = 106538960739715,
		Name = "The Isles of Haxbury",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Yellow",
		Cost = { Yellow = 1, Blue = 1, Red = 2 },
		AttackEffect = "British",
		Terrain = true,
		EffectVariable = 0,
		Transformant = "Peasant",
		Terrariant = "Astral Vestige",
		CustomReminder = {
			Peasant = "A colourless fighter, inert in play.",
			["Spoils of Invasion"] = "A fleeting card is destroyed if not cast."
		},
		Effect = {
			Description = "When this card is cast: A target fighter loses 400 Power. Transform it into a Peasant.\nAt the start of your turns: Each player draws a fleeting card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 400 },
						{ "Transform", "Transformant" }
					},
					Target = "Single"
				},
				OnAllyStart = {
					Power = {
						{ "FleetingDraw", 1 },
						{ "FleetingDraw", 1, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"A thousand peoples live on this island, their hatred of each other pointed towards a common foe.\"\n— Kenneth Haxbury"
	},
	["Searing Sunlight Subjugates Serfs"] = {
		Id = 138209006361779,
		Name = "Searing Sunlight Subjugates Serfs",
		Health = 1000,
		Power = 2000,
		Rarity = "Rare",
		Color = "Yellow",
		Cost = { Yellow = 3, Blue = 3, Red = 3 },
		AttackEffect = "Flare",
		Overload = true,
		Archetype = "Season",
		Logo = "Conquerors",
		Effect = {
			Description = "Whenever you cast a non-Green card: Draw a card from your opponent's deck, except it's Green. Convert all {G} in its cost to {W}.",
			Ability = {
				OnAnyAllyCast = {
					Power = { {
						"MoveZone",
						{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					NotColor = "Green",
					MetaData = {
						Color = "Green",
						ConvertColors = { Green = "Neutral" }
					}
				}
			},
			MovezoneAsDraw = true
		},
		Bio = "So complete was dæmon's thrall that even the sun joined in."
	},
	["The Great Charter"] = {
		Id = 90087022558666,
		Name = "The Great Charter",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		SearchTerms = { "Magna Carta" },
		Color = "Yellow",
		Cost = { Red = 2, Blue = 2 },
		AttackEffect = "British",
		AddHealth = 1000,
		AddPower = 1000,
		Gear = true,
		Logo = "Conquerors",
		Effect = {
			Description = "Attach to a target fighter.\nWhen you do: Lock it for 2 turns.\nWhenever you abuse your power: Destroy this fighter. You abuse your power if—\n{C1}—The last enemy fighter dies.\n{C2}—You have 5 or more {W}.\n{C3}—You gain debt.",
			Ability = {
				OnEquipGear = {
					Power = { { "Lock", 2 } },
					Target = "Self",
					NoBlip = true
				},
				OnEnemyDeath = {
					Power = { { "Destroy" } },
					Target = "GearOwner",
					EffectRequirement = { "Board", "Opponent", 0, 1 }
				},
				OnAllyDebt = {
					Power = { { "Destroy" } },
					Target = "GearOwner"
				},
				OnAnyTrigger = {
					Power = { { "Destroy" } },
					Target = "GearOwner",
					EffectRequirement = { "Playertable", "Me", 5, 999999999, "IconsNeutral" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Of course I'll limit the use of my powers! Your old king must've really abused you ducks, huh?\"\n— Queen Celes"
	},
	["Æthelward the Undersmeller"] = {
		Id = 139549410480882,
		Name = "Æthelward the Undersmeller",
		SearchTerms = { "Aethelward", "Athelward", "Ethelward" },
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1, Red = 1 },
		AttackEffect = "Jab",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "When this card is cast: Select any number of allied fighters. Destroy them.\nWhenever an allied fighter dies: You lose 200 life.",
			Ability = {
				OnSummon = {
					Power = { { "Destroy", 30, "CustomZoneTarget" } },
					Target = "CustomTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Field" },
						Condition = {},
						SelectionDescription = "Any number of fighters to destroy",
						MinTargets = 0,
						MaxTargets = 15
					}
				},
				OnAllyDeath = {
					Power = { { "Cost", 200 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"It is our responsibility as historians to ensure a mistake on the level of my old leader is not replicated.\"\n— Canute Haxbury"
	},
	["Queen Celes"] = {
		Id = 110948713957463,
		AltCards = {
			MC = {
				Id = 133376727424024,
				Name = "M.C.",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 832,
				Bio = "\"Sometimes, it's not even a push or a pull. Have you ever seen a sliding door?\""
			},
			["Queen Celes-Offer"] = {
				Id = 75431618954431,
				Name = "Queen Celes",
				AttackEffect = "Jab",
				ArtAnimation = "Celes"
			}
		},
		Name = "Queen Celes",
		Health = 1600,
		Power = 300,
		Rarity = "Legendary",
		Color = "Yellow",
		Logo = "Conquerors",
		Cost = { Neutral = 1, Yellow = 4, Blue = 2, Red = 1 },
		AttackEffect = "Money",
		SummonAnimation = "CelesSummon",
		SummonedAnimation = "CelesSummon",
		CustomReminder = {
			["Defend the Queen"] = "Queen Celes can't be attacked unless she has no subjects."
		},
		Effect = {
			Description = "Whenever this card attacks: All other allied fighters gain 150 Health and Power. Attach defender to them.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Strengthen", 150 },
						{ "Heal", 150 },
						{ "EquipGear", "Defender Mod" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
				}
			}
		},
		Bio = "\"Aww, a dashing new dress? And here I thought you noobkin were only pretending to love me!\""
	},
	["Runedsoul Chronicler"] = {
		Id = 137106226249996,
		Name = "Runedsoul Chronicler",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once, when you're in debt: A target fighter gains 200 Health. Put a copy of it into your baseplate.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Heal", 200 },
						{
							"MoveZone",
							{ "EffectTarget", "Field_Ally", "GenZone_Ally", false, true }
						}
					},
					Target = "Single",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 9999, "Debt" },
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Anûsthan was simply doing what came natural to him. This was how things are meant to be."
	},
	["Sundebted Farmer"] = {
		Id = 115173541826170,
		Name = "Sundebted Farmer",
		Health = 500,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 2 },
		CustomReminderDebt = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: A target fighter loses 500 Power. You gain 3 Debt.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 500 },
				{ "Debt", 3, "Ally" }
			},
			Target = "Single"
		},
		Bio = "Away from all the harrying and violence, the survivors from the Heights found a new home and new peace."
	},
	["Zealot of the Fourth Heaven"] = {
		Id = 87266167438093,
		Name = "Zealot of the Fourth Heaven",
		Health = 1200,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 1, Green = 7 },
		Summonant = "Follower",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks, if you're in Debt: Summon a 500/500 Follower with no abilities.",
			Ability = {
				OnEVCheckPass = {
					Power = { { "Summon", "Summonant" } },
					Target = "Self",
					NoBlip = true
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "NeutralCost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Debt",
						SubModifier = true
					}
				}
			}
		},
		Bio = "He screams paeans of the glory of the neutral ground, of the sleeping Leviathan who protects noobkin against dæmonkind, of how this Fourth Heaven truly deserves the name."
	},
	Follower = {
		Id = 91787465388623,
		Name = "Follower",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Jab",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 1, Green = 7 },
		Summonant = "Follower",
		Effect = {
			Description = "",
			Ability = {
				Null = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Ally", "Nil", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Debt",
						SubModifier = true
					},
					NoBlip = true
				}
			}
		},
		Bio = "The false religion is a distortion, of course. But that doesn't stop desperate people believing."
	},
	["Studrotten Dæmon"] = {
		Id = 93541379435942,
		Name = "Studrotten Dæmon",
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 3 },
		CustomReminderDebt = true,
		Summonant = "Studrotten Dæmon",
		SearchTerms = { "Daemon", "Demon", "Damon" },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card dies, if you're not in debt: Summon a copy of it. You gain 4 Debt.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Summonant" },
				{ "Debt", 4 }
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "AllyGenZone", 0, 1, "Debt" }
		},
		Bio = ""
	},
	["Grain Dole"] = {
		Id = 92080031488969,
		Name = "Grain Dole",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 2 },
		CustomReminderDebt = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Give yourself 3 Green fighter cards.\nYou gain 6 Debt.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "MonoOnlyorGreenCost Green Fighter" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green Fighter" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green Fighter" },
				{ "Debt", 6 }
			},
			Target = "Ally"
		},
		Bio = "The most powerful person isn't the king, the knight, the cleric, or the serf. It's whoever controls the grain."
	},
	["Unnatural Order"] = {
		Id = 72839688064741,
		Name = "Unnatural Order",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 2, Green = 5 },
		Effect = {
			Name = "Temporal Halo",
			Description = "You gain 2 Debt.\nA target fighter gains 100 Health and Power for each point of Debt you have.",
			Target = "Single",
			Ability = {
				OnSummon = {
					Power = {
						{ "Debt", 2, "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "NeutralCost", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "Single" },
						{ "Strengthen", "Variable", "Single" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Debt",
						SubModifier = true
					}
				}
			}
		},
		Bio = "\"The stones, the trees, even the grass pulses with dæmonic power. How could you possibly preserve the old ways?\"\n— Canute Haxbury"
	},
	["Alms Giver"] = {
		Id = 118252807521995,
		Name = "Alms Giver",
		Health = 1000,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 4 },
		TargetImmune = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks: You gain 4 Debt. All fighters generate.",
			Type = "OnAttack",
			Power = {
				{ "Debt", 4, "Ally" },
				{ "Generate", 1 }
			},
			Target = "All"
		},
		Bio = "Climbing its trusty steed, it acts on its purpose to help. It does not know why. It does not care why."
	},
	["Fallen Palace Guard"] = {
		Id = 129863335276660,
		Name = "Fallen Palace Guard",
		Health = 1000,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever this card attacks: It generates. Trigger effects of all allied fighters as though they attacked.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Generate", 1, "Self" },
						{ "ForceTrigger", "OnAttack" },
						{ "ForceTrigger", "OnAttackDestroy" },
						{ "ForceTrigger", "OnAttackEnd" },
						{ "ForceTrigger", "OnAllyAttack" },
						{ "ForceTrigger", "OnAnyAttack" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The throne they guard has been abandoned; The Leviathan wished to grow outdoors."
	},
	["The Sunderworld"] = {
		Id = 120794759987510,
		Name = "The Sunderworld",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 3 },
		Terrain = true,
		CustomReminderDebt = true,
		Terrariant = "Sunderworld's Heart",
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: You gain 3 Debt. Put the bottom card of your deck into your baseplate.",
			Type = "OnEnd",
			Power = {
				{ "Debt", 3 },
				{
					"MoveZone",
					{ "BottomCard", "Deck_Ally", "GenZone_Ally", false, false },
					"Self"
				}
			},
			Target = "Ally"
		},
		Bio = "The mortomigrants descend and become the earth; The world shivers and grows without end."
	},
	["A War of All Against All"] = {
		Id = 119882406059271,
		Name = "A War of All Against All",
		AltCards = {
			["A War of All Against All-Brawl"] = {
				Id = 115483024498627,
				Name = "Leviathan",
				AttackEffect = "Flare",
				Bio = "\"That every man, ought to endeavour Peace, as farre as he has hope of obtaining it; and when he cannot obtain it, that he may seek, and use, all helps, and advantages of Warre.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		CustomReminder = {
			["One-sided Aggression"] = "Fighters don't counter attack themselves."
		},
		Cost = { Green = 3, Neutral = 4 },
		Fading = true,
		Effect = {
			Description = "All fighters attack themselves.",
			Ability = {
				OnSummon = {
					Power = { { "ForceAttack", "Target", "All" } },
					Target = "Self"
				},
				MultiSelectOperationKILL = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{ "Damage", "Variable", "Aggressor" }
					},
					Target = "Aggressor",
					NoBlip = true
				},
				MultiSelectOperationKILLOPP = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{ "Damage", "Variable", "Aggressor" }
					},
					Target = "Aggressor",
					NoBlip = true
				}
			}
		},
		Bio = "\"Look at the filth terrorising their own. There's no art here; No culture, no architecture, no history, no society. Each of these cavemen in continual fear of their inevitable violent deaths. What a pathetic state of nature.\"\n— Ophio Lateralis"
	},
	["The Primal Tapestry"] = {
		Id = 79495999481578,
		Name = "The Primal Tapestry",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Gear = true,
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 6, Green = 6 },
		Equippant = "The Primal Tapestry",
		GearTarget = "NoGearTarget",
		AddHealth = 0,
		AddPower = 0,
		Effect = {
			Description = "Attach to all allied fighters.\nWhenever an allied fighter attacks: This card gains 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
				},
				OnAllyAttack = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "A gift from the Leviathan to William to prevent their territory being invaded, it chronicles the true ancient history of Robloxia."
	},
	["Consolidated Power"] = {
		Id = 76815537529842,
		Name = "Consolidated Power",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Gust",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		CustomReminderDebt = true,
		CustomReminderRecur = true,
		TriggerInGraveZone = true,
		Effect = {
			Description = "Deal 400 overloaded damage to a target enemy fighter and you gain 400 life.\nAt the start of your turns: Recur this card. You gain 4 Debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DamageOverloaded", 400, "SingleEnemy" },
						{ "Cost", -400 }
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{ "Consolidated Power", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						},
						{ "Debt", 4, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The leviathan didn't let anyone know how they were connected to the great Alex. Their new liege was in charge; That was all that mattered."
	},
	["Slumbering Leviathan"] = {
		Id = 71162754353194,
		Name = "Slumbering Leviathan",
		AltCards = {
			["Slumbering Leviathan-Offer"] = {
				Id = 81329748924103,
				Name = "Slumbering Leviathan",
				AttackEffect = "Scratch",
				ArtAnimation = "Ophio",
				Bio = "The fungus grew and grew and grew, sheltering everything in its order."
			}
		},
		Health = 2000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Logo = "Vitality",
		Color = "Green",
		Cost = { Green = 11 },
		CustomReminderDebt = true,
		Overload = true,
		Fading = true,
		TriggerInDeck = true,
		TriggerInHand = true,
		TriggerInGenZone = true,
		TriggerInGraveZone = true,
		Effect = {
			Description = "When you discard this card: Search your deck for a fighter card and you gain 6 debt.\nAt the start of your turns, if you have 22 or more {G}: Summon this card from all your zones.",
			Ability = {
				OnDiscarded = {
					Power = {
						{ "RandomTutorfor", "Fighter" },
						{ "Debt", 6 }
					},
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{
								"Slumbering Leviathan",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false,
								7
							},
							"Self"
						},
						{
							"MoveZone",
							{ "Slumbering Leviathan", "GenZone_Ally", "Field_Ally", true, false, 7 },
							"Self"
						},
						{
							"MoveZone",
							{ "Slumbering Leviathan", "Hand_Ally", "Field_Ally", true, false, 7 },
							"Self"
						},
						{
							"MoveZone",
							{ "Slumbering Leviathan", "Deck_Ally", "Field_Ally", true, false, 7 },
							"Self"
						}
					},
					EffectRequirement = { "Playertable", "Me", 22, 9999, "IconsGreen" }
				}
			}
		},
		Bio = "Alex's inner ##### has fruited once more."
	},
	["The Worldthief"] = {
		Id = 92010000874054,
		Name = "The Worldthief",
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 2, Blue = 2, Yellow = 2 },
		AttackEffect = "Punch",
		Effect = {
			Description = "Whenever you cast a card with exactly 3 colours in its cost: Give yourself 3 cards of the missing colour.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "CastCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColors", "Nil" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 3, "ThreeColors" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassThreeColors = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "CastCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColorsExclude", "Yellow" },
							"EVCard"
						},
						{
							"EVExactValueCheck",
							{ 3, "Yellow" }
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "CastCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColorsExclude", "Red" },
							"EVCard"
						},
						{
							"EVExactValueCheck",
							{ 3, "Red" }
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "CastCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColorsExclude", "Blue" },
							"EVCard"
						},
						{
							"EVExactValueCheck",
							{ 3, "Blue" }
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "CastCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColorsExclude", "Green" },
							"EVCard"
						},
						{
							"EVExactValueCheck",
							{ 3, "Green" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassYellow = {
					Power = {
						{ "RandomAdd", "Yellow" },
						{ "RandomAdd", "Yellow" },
						{ "RandomAdd", "Yellow" }
					},
					Target = "Ally"
				},
				OnEVCheckPassBlue = {
					Power = {
						{ "RandomAdd", "Blue" },
						{ "RandomAdd", "Blue" },
						{ "RandomAdd", "Blue" }
					},
					Target = "Ally"
				},
				OnEVCheckPassGreen = {
					Power = {
						{ "RandomAdd", "Green" },
						{ "RandomAdd", "Green" },
						{ "RandomAdd", "Green" }
					},
					Target = "Ally"
				},
				OnEVCheckPassRed = {
					Power = {
						{ "RandomAdd", "Red" },
						{ "RandomAdd", "Red" },
						{ "RandomAdd", "Red" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Assassin that caused this mess in the first place, all to run away with the brick and use its powers to cure his immortality."
	},
	["Stud of the Conquerors"] = {
		Id = 74235848595763,
		Name = "Stud of the Conquerors",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Red = 1, Blue = 1, Yellow = 1 },
		TriggerInGenZone = true,
		EffectRequirement = 0,
		RansackCount = 0,
		Archetype = "Studling",
		Logo = "Conquerors",
		CustomReminderNascent = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a copy of this card into your baseplate, except it's inert in there.\nAt the start of your turns: Ransack 8. If you do, you gain {R}{B}{Y} and can't cast Green cards this turn.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 7 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 8 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 8
					},
					NoBlip = true
				},
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Stud of the Conquerors", 1 }
					} },
					Target = "Ally",
					MetaData = { TokenGenZone = true }
				},
				OnEVCheckPass = {
					Power = {
						{ "Red", 1 },
						{ "Yellow", 1 },
						{ "Blue", 1 },
						{
							"SetCastRestriction",
							{
								{ "CustomCheck_GreenOrNotClr" },
								"Green cards are too pathetic to cast this turn."
							},
							"Ally"
						}
					},
					Target = "Ally",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "It is dominated by the forces of technology, brutality, and society."
	},
	["Stud Debt"] = {
		Id = 115967983320925,
		Name = "Stud Debt",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gust",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 0 },
		Archetype = "Debt",
		EffectVariable = 0,
		TriggerInGenZone = true,
		Effect = {
			Description = "This card's cost is your debt.\nAllied fighters pay off your debt instead of generating studs.\nObliterate this card when your debt is paid off.\nDuring your endstep, if you have 10 or more debt: Obliterate your baseplate.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "DebtPaid" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassDebtPaid = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Ally", "Nil", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Debt",
						SubModifier = true
					},
					TurnTriggerLimit = 1
				},
				OnEnd = {
					Power = { {
						"EVGreaterValueCheck",
						{ 9, "DebtStrong" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassDebtStrong = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "DebtExplode" },
						{ "ActivateTrigger", "DebtObliterate", "Ally" },
						{
							"AlterEV",
							{ "SaveToPlayertable", "Math", 1, "StudDebtObliteration" },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Nil", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Binglefart",
						SubModifier = false
					},
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "It is said that the world is in a state of bankruptcy, that the world owes the world more than the world can pay."
	},
	["Sunderworld's Heart"] = {
		Id = 123167493686128,
		Name = "Sunderworld's Heart",
		Health = 800,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Gust",
		Color = "Green",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a terrain: Animate it. You gain 4 debt.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{ "AnimateTerrain" },
						{ "Debt", 4 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Ophio, a perversion of the natural order, is the most natural thing to happen in the Sunderworld."
	},
	["Astral Vestige"] = {
		Id = 74606908152002,
		Name = "Astral Vestige",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrarian = true,
		Continued = true,
		Effect = {
			Description = "During your end step: All allied terrarians gain continued.",
			Ability = {
				OnEnd = {
					Power = { { "GivePassive", "Continued" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "HasPassive",
						Modifier = "Terrarian"
					}
				}
			}
		},
		Bio = "After the fall of the Temporal Halo and of Panrobloxianism, the Isles became a husk of its former glory, a simple island along many. For the spiritually inclined residents of these new Isles this was a good thing."
	},
	["Arkhive Worksite"] = {
		Id = 119642015134089,
		Name = "Arkhive Worksite",
		Health = 300,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrarian = true,
		Effect = {
			Description = "During your end step: Recur an allied Colourless card, except it's fading.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Neutral", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData_MoveZone = { Fading = true }
				}
			}
		},
		Bio = "\"To know the future, know the past.\"\nAl-Assad"
	},
	["Panrobloxian Capital"] = {
		Id = 97156216773659,
		Name = "Panrobloxian Capital",
		Health = 1200,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrarian = true,
		Effect = {
			Description = "Whenever you cast a card: A target allied fighter gains 50 Health and Power for each {W} in that card's cost.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Neutral" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" }
						},
						{ "Heal", "Variable", "Single" },
						{ "Strengthen", "Variable", "Single" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Neutral" },
							"Aggressor"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "The dæmons removed distinction, treating all things as interchangeable serfs. The Panrobloxianists over their feud with the reactionary Integrationists made the same mistake."
	}
}
