



return {
	["Hunt Container"] = {
		Id = 8668981755,
		Name = "Hunt Token",
		Health = 0,
		Power = 0,
		AltCards = {
			["Yellow Hunt Token"] = {
				Id = 127442246273527,
				Color = "Yellow",
				Cost = { Yellow = 3, Red = 1, Blue = 1 },
				AddHealth = 150,
				AddPower = 150,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Attach to a target fighter.\nWhen this card is cast, if there's a Red and Blue Mega Token in your hand: Attach them to this card, then draw 3 cards.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Red_Hunt", "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Red" }
								},
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Blue_Hunt", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Blue" }
								}
							},
							Target = "Self",
							AllowDeadAggressorTriggers = true
						},
						OnEVCheckPassRed = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassBlue = {
							Power = {
								{
									"AlterEV",
									{ "Load", "Math", "Variable", "MegaCount" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 2, "Mega" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassMega = {
							Power = {
								{
									"MoveZone",
									{ "Red_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{
									"MoveZone",
									{ "Blue_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{ "EquipGear", "Blue Hunt Token", "GearOwner" },
								{ "EquipGear", "Red Hunt Token", "GearOwner" },
								{ "Draw", 3 },
								{ "ActivateTrigger", "MegaHunt", "Ally" }
							},
							Target = "Ally"
						}
					}
				}
			},
			["Blue Hunt Token"] = {
				Id = 126355298891693,
				Color = "Blue",
				Cost = { Yellow = 1, Red = 1, Blue = 3 },
				AddHealth = 300,
				AddPower = 0,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Attach to a target fighter.\nWhen this card is cast, if there's a Red and Yellow Mega Token in your hand: Attach them to this card, then draw 3 cards.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Red_Hunt", "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Red" }
								},
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Yellow_Hunt", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Yellow" }
								}
							},
							Target = "Self",
							AllowDeadAggressorTriggers = true
						},
						OnEVCheckPassRed = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassYellow = {
							Power = {
								{
									"AlterEV",
									{ "Load", "Math", "Variable", "MegaCount" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 2, "Mega" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassMega = {
							Power = {
								{
									"MoveZone",
									{ "Red_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{
									"MoveZone",
									{ "Yellow_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{ "EquipGear", "Yellow Hunt Token", "GearOwner" },
								{ "EquipGear", "Red Hunt Token", "GearOwner" },
								{ "Draw", 3 },
								{ "ActivateTrigger", "MegaHunt", "Ally" }
							},
							Target = "Ally"
						}
					}
				}
			},
			["Red Hunt Token"] = {
				Id = 83262975741273,
				Color = "Red",
				Cost = { Yellow = 1, Red = 3, Blue = 1 },
				AddHealth = 0,
				AddPower = 300,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Attach to a target fighter.\nWhen this card is cast, if there's a Blue and Yellow Mega Token in your hand: Attach them to this card, then draw 3 cards.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Blue_Hunt", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Blue" }
								},
								{
									"AlterEV",
									{ "Set", "Hand_Ally", "Yellow_Hunt", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Yellow" }
								}
							},
							Target = "Self",
							AllowDeadAggressorTriggers = true
						},
						OnEVCheckPassBlue = {
							Power = {
								{
									"AlterEV",
									{ "Load", "Math", "Variable", "MegaCount" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "Variable", "MegaCount" },
									"Self"
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassYellow = {
							Power = {
								{
									"AlterEV",
									{ "Load", "Math", "Variable", "MegaCount" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 2, "Mega" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassMega = {
							Power = {
								{
									"MoveZone",
									{ "Blue_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{
									"MoveZone",
									{ "Yellow_Hunt", "Hand_Ally", "Nil", true, false }
								},
								{ "EquipGear", "Yellow Hunt Token", "GearOwner" },
								{ "EquipGear", "Blue Hunt Token", "GearOwner" },
								{ "Draw", 3 },
								{ "ActivateTrigger", "MegaHunt", "Ally" }
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Rarity = "Token",
		Archetype = "Hunt",
		AttackEffect = "Jab",
		Color = "Green",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Cost = { Yellow = 2, Red = 2, Blue = 2 },
		EffectVariable = 0,
		AddHealth = 300,
		AddPower = 300,
		Gear = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Attach to a target fighter.\nWhen this card is cast, if there's a Blue and Yellow Mega Token in your hand: Attach them to this card, then draw 3 cards.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "EffectVariable", "Variable", "MegaCount" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "Blue_Hunt", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Blue" }
						},
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "Yellow_Hunt", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Yellow" }
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassBlue = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", "Variable", "MegaCount" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "Variable", "MegaCount" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassYellow = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", "Variable", "MegaCount" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 2, "Mega" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassMega = {
					Power = {
						{
							"MoveZone",
							{ "Blue_Hunt", "Hand_Ally", "Nil", true, false }
						},
						{
							"MoveZone",
							{ "Yellow_Hunt", "Hand_Ally", "Nil", true, false }
						},
						{ "EquipGear", "Yellow Hunt Token", "GearOwner" },
						{ "EquipGear", "Blue Hunt Token", "GearOwner" },
						{ "Draw", 3 },
						{ "ActivateTrigger", "MegaHunt", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Find and collect 50 Mega Tokens to win a ton of prizes!"
	},
	["Mega Token"] = {
		Id = 74907711310957,
		Name = "Mega Token",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Hunt",
		AttackEffect = "Jab",
		Color = "Neutral",
		Fading = true,
		TokenOmni = true,
		Stealth = true,
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Cost = { Yellow = 1, Red = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Unlock a target fighter. Attach Overload and Dextrous to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Unlock", 9999 },
						{ "EquipGear", "Overloaded Mod" },
						{ "EquipGear", "Dextrous Mod" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Let's be honest… Spongebob Tower Defense was pretty peak."
	},
	Antorell = {
		Id = 122536694561455,
		Name = "Antorell",
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Red",
		Hunt = 4,
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		CustomReminderMoney = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 4.\nWhenever you cast a card hunting: Give yourself a Money Stack.\nAt the start of your turns: Return this card to its hand. It gains haste.",
			Ability = {
				OnAllyHunt = {
					Power = { {
						"RandomAdd",
						{ "Tix Stack", "Targeting Blip" }
					} },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{ "GivePassive", "Charge" },
						{ "Return" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "It seems something amazing is happening…"
	},
	Robey100 = {
		Id = 97695807060995,
		Name = "Robey100",
		AltCards = {
			["Robey100-Offer"] = {
				Id = 77230574156254,
				Name = "KrizisHQ",
				AttackEffect = "Jab",
				Bio = "Anything Can Be A Secret. Even this card!"
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Rare",
		Hunt = 4,
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Blue",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Red = 1, Yellow = 1 },
		EffectVariable = 1,
		CustomReminderHunt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 4.\nOnce each turn, whenever you cast a card hunting: Deal 100 damage to a target enemy fighter. It loses 100 Power.",
			Ability = {
				OnAllyHunt = {
					Power = {
						{ "Damage", 100 },
						{ "Weaken", 100 }
					},
					Target = "SingleEnemy",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"When I said \"release notes\", I bet you didn't think I meant \"leak the code on stream with notepad\", huh?\""
	},
	pokedragon100000 = {
		Id = 94764743755749,
		Name = "pokedragon100000",
		AltCards = {
			["pokedragon100000-Offer"] = {
				Id = 118337283762765,
				Name = "Garf",
				AttackEffect = "Jab",
				Bio = "dude its literally garf"
			}
		},
		Health = 650,
		Power = 400,
		Rarity = "Uncommon",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Hunt = 2,
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Neutral = 2, Red = 1, Blue = 1, Yellow = 1 },
		CustomReminderHunt = true,
		EffectVariable = 0,
		Token = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 2.\nAt the start of your turns: Give yourself a Nascent Stud.",
			Ability = {
				OnAllyStart = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "garfield you fat cat"
	},
	mxdmax = {
		Id = 139323604034546,
		Name = "mxdmax",
		Health = 1000,
		Power = 300,
		Rarity = "Uncommon",
		Hunt = 2,
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Blue = 2, Red = 2, Yellow = 2, Neutral = 3 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		ChargeRequirement = { "Archetype", "Ally", 2, 999999, "MegaHunters" },
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 2.\nThis card has haste if there's 2 or more allied Mega Hunters.\nWhenver this card attacks and destroys another: Recur an allied Mega Token of each colour, except they're fading.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"MoveZone",
							{ "Red Hunt Token", "GraveZone_Ally", "Hand_Ally", true, false }
						},
						{
							"MoveZone",
							{ "Blue Hunt Token", "GraveZone_Ally", "Hand_Ally", true, false }
						},
						{
							"MoveZone",
							{ "Yellow Hunt Token", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					MetaData = { Fading = true },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "GIGGLED + BOMBED + A-90'D + BLITZ'D"
	},
	["3ja_e"] = {
		Id = 79427047973393,
		Name = "3ja_e",
		AltCards = {
			["Capi Hunted"] = {
				Id = 117894150423787,
				Name = "Capi, Hunted",
				AltArt = true,
				PremiumArt = 837,
				Bio = "\"Alright Depro, this game doesn’t seem half bad-\"<br/>\"I feel like <font color=\"#E83AF1\">SOMETHING</font> is watching me.\"\""
			}
		},
		Health = 700,
		Power = 600,
		Rarity = "Rare",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Blue",
		Hunt = 2,
		SearchTerms = "3jae",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Blue = 2, Red = 2, Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 2.\nOnce each turn, whenever you cast a Mega Token: Search your deck for 2 Mega Hunter cards. Give yourself a Nascent Stud.",
			Ability = {
				OnAllyCastGear = {
					Power = {
						{ "RandomTutorfor", "MegaHunters" },
						{ "RandomTutorfor", "MegaHunters" },
						{ "Add", "Addant" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1,
					Archetype = "Hunt"
				}
			}
		},
		Bio = "‽"
	},
	["Champion's Rest"] = {
		Id = 113817621928213,
		Name = "Champion's Rest",
		AltCards = {
			["Champion's Rest-Alt"] = {
				Id = 79905590286457,
				Name = "Champion's Rest",
				AltArt = true,
				PremiumArt = 796,
				Terrariant = "The Ultimate Luminary-XxMakio",
				AttackEffect = "Jab",
				Bio = "I'll see you at the finish line."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Archetype = "MegaHunters",
		Terrain = true,
		Terrariant = "The Ultimate Luminary",
		AttackEffect = "Jab",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Hunt = 1,
		Cost = { Neutral = 1, Blue = 1, Red = 1, Yellow = 1 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nWhen this card is cast, or whenever you draw 3 cards from a Mega Token: Return a target fighter to its hand.",
			Ability = {
				OnSummon = {
					Power = { { "Return" } },
					Target = "Single"
				},
				OnEVCheckFailTargetIsOwnedByAlly = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ChosenCard" },
							"S"
						},
						{
							"SetCost",
							{ 1, "Neutral" },
							"EVCard"
						},
						{
							"SetCost",
							{ 0, "Red" },
							"EVCard"
						},
						{
							"SetCost",
							{ 0, "Green" },
							"EVCard"
						},
						{
							"SetCost",
							{ 0, "Blue" },
							"EVCard"
						},
						{
							"SetCost",
							{ 0, "Neutral" },
							"EVCard"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyMegaHunt = {
					Power = { { "Return" } },
					Target = "Single"
				}
			}
		},
		Bio = "Solve my puzzle and win your glorious prize!"
	},
	bllocky = {
		Id = 88822590496994,
		Name = "bIIocky",
		AltCards = {
			["bllocky-Offer"] = {
				Id = 94035994613950,
				Name = "Bllocky",
				AttackEffect = "Jab",
				Bio = ""
			},
			["One Final Hour"] = {
				Name = "One Final Hour",
				Commissioner = { "The_Capsters", "Apiri653" },
				Id = 133805756131669,
				AltArt = true,
				PremiumArt = 875,
				Bio = "“One more hour till this nightmare is over..”"
			}
		},
		Health = 100,
		Power = 300,
		Rarity = "Common",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Hunt = 3,
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 3.\nWhen this card is cast, if it isn't inert: You lose 300 life. Select {B} or {Y}. Give yourself a copy of this card that's that colour. It's inert when discarded.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Cost", 300 },
						{
							"CreateChoices",
							{ "Blue Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"TargetChoiceZone"
						},
						{ "EVExactValueCheck", 3 }
					},
					Target = "Self",
					MetaData = { TokenDiscard = true, Color = "Variable" },
					HasntPassive = "TokenDiscard"
				},
				OnEVCheckPass = {
					Power = { { "AddCopy" } },
					Target = "Self",
					MetaData = { TokenDiscard = true, Color = "Blue" },
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "AddCopy" } },
					Target = "Self",
					MetaData = { TokenDiscard = true, Color = "Yellow" },
					NoBlip = true
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "He's in quite a sour situation"
	},
	Icyycl = {
		Id = 93733303536877,
		Name = "Icyycl",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		Hunt = 3,
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Blue",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "Undead Rising",
			Description = "Hunt 3.\nWhen this card is cast: Give yourself a Nascent Stud, then select and destroy a card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "SpecificDiscard", 30, "CustomZoneTarget" }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "a card to destroy",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "Even when under pressure, he remains as cool as a cucumber!"
	},
	TheDeathEagle = {
		Id = 75340498395518,
		Name = "TheDeathEagle",
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		Archetype = "MegaHunters",
		RandomAddBypass = "IncludePlayTest",
		AttackEffect = "Jab",
		Color = "Yellow",
		Hunt = 4,
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Red = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderHunt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 4.\nOnce each turn, whenever you cast a card hunting: All allied fighters gain 50 Health and Power.",
			Ability = {
				OnAllyHunt = {
					Power = {
						{ "Heal", 50 },
						{ "Strengthen", 50 }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "If you read this bio YOURE AWESOME!!!!!"
	},
	Duddedud = {
		Id = 82800880149633,
		Name = "Duddedud",
		AltCards = {
			["Duddedud-Offer"] = {
				Id = 111932107403921,
				Name = "Duddedud",
				Effect = {
					Name = "wukdyganafkajdglkj",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "Duddedud-B-Offer" },
								{ "Summon", "Duddedud-R-Offer" },
								{ "Summon", "Duddedud-Y-Offer" }
							},
							Target = "Ally"
						}
					}
				},
				AttackEffect = "Jab",
				Bio = ""
			},
			["Duddedud-Offer-2"] = {
				Id = 135684257710276,
				Name = "Fallen Luminaries",
				Effect = {
					Name = "wukdyganafkajdglkj",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "Duddedud-B-Offer2" },
								{ "Summon", "Duddedud-R-Offer2" },
								{ "Summon", "Duddedud-Y-Offer2" }
							},
							Target = "Ally"
						}
					}
				},
				AttackEffect = "Jab",
				Bio = ""
			},
			cwinship = {
				Id = 74389385560143,
				Name = "cwinship",
				Commissioner = { "cwinship" },
				Effect = {
					Name = "wukdyganafkajdglkj",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "Duddedud-B-cwin" },
								{ "Summon", "Duddedud-R-cwin" },
								{ "Summon", "Duddedud-Y-cwin" }
							},
							Target = "Ally"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 769,
				Bio = "Don't ask questions you don't want answers to."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Archetype = "MegaHunters",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AttackEffect = "Jab",
		Color = "Yellow",
		Rank = 6,
		AllowedFork = true,
		Cost = { Neutral = 3, Yellow = 3 },
		EffectVariable = 0,
		Hunt = 1,
		CustomReminder = {
			["Second Place Woes"] = "A terrified fighter is obliterated during its end step. The copy likely won't be attacking."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nSummon a Blue, Red, and Yellow Dudedud, each 400/200 fighters. They summon a copy of themselves when you draw cards from a Mega Token, and give terrified copies of themselves when they die.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Duddedud-B" },
						{ "Summon", "Duddedud-R" },
						{ "Summon", "Duddedud-Y" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Do you wanna have a bad time?"
	},
	["Duddedud-Y"] = {
		Id = 132339621501750,
		Name = "Yellow Duddedud",
		AltCards = {
			["Duddedud-Y-Offer"] = {
				Id = 119231138890422,
				Name = "Duddelodud",
				Summonant = "Duddedud-B-Offer",
				Addant = "Duddedud-Y-Offer"
			},
			["Duddedud-Y-Offer2"] = {
				Id = 75346401419973,
				Name = "LevitatorLevi",
				Summonant = "Duddedud-B-Offer2",
				Addant = "Duddedud-Y-Offer2"
			},
			["Duddedud-Y-cwin"] = {
				Id = 135695043809296,
				Name = "swoipy",
				Summonant = "Duddedud-B-cwin",
				Addant = "Duddedud-Y-cwin",
				Bio = "Dude, it’s 6 AM. The sun is literally coming up."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Token",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Summonant = "Duddedud-B",
		Addant = "Duddedud-Y",
		Hunt = 1,
		CustomReminder = {
			["Second Place Woes"] = "A terrified fighter is obliterated during its end step. The copy likely won't be attacking."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nWhenever you draw 3 cards from a Mega Token: Summon a 400/200 Blue Duddedud.\nWhen this card dies: Give yourself a copy of it that's terrified and inert when discarded.",
			Ability = {
				OnAllyMegaHunt = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Terrified = true, TokenDiscard = true }
				}
			}
		},
		Bio = " "
	},
	["Duddedud-B"] = {
		Id = 85981050583935,
		Name = "Blue Duddedud",
		AltCards = {
			["Duddedud-B-Offer"] = {
				Id = 95399961975367,
				Name = "Duddeblud",
				Summonant = "Duddedud-R-Offer",
				Addant = "Duddedud-B-Offer"
			},
			["Duddedud-B-Offer2"] = {
				Id = 131810550143752,
				Name = "Feodoric",
				Summonant = "Duddedud-R-Offer2",
				Addant = "Duddedud-B-Offer2"
			},
			["Duddedud-B-cwin"] = {
				Id = 112034378576474,
				Name = "Horrace_Cat",
				Summonant = "Duddedud-R-cwin",
				Addant = "Duddedud-B-cwin",
				Bio = "If we can capitalize this, we win the entire event."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Token",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Blue",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Summonant = "Duddedud-R",
		Addant = "Duddedud-B",
		Hunt = 1,
		CustomReminder = {
			["Second Place Woes"] = "A terrified fighter is obliterated during its end step. The copy likely won't be attacking."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nWhenever you draw 3 cards from a Mega Token: Summon a 400/200 Red Duddedud.\nWhen this card dies: Give yourself a copy of it that's terrified and inert when discarded.",
			Ability = {
				OnAllyMegaHunt = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Terrified = true, TokenDiscard = true }
				}
			}
		},
		Bio = " "
	},
	["Duddedud-R"] = {
		Id = 78043262257242,
		Name = "Red Duddedud",
		AltCards = {
			["Duddedud-R-Offer"] = {
				Id = 108368288953772,
				Name = "Rededud",
				Summonant = "Duddedud-Y-Offer",
				Addant = "Duddedud-R-Offer"
			},
			["Duddedud-R-Offer2"] = {
				Id = 104153851626760,
				Name = "VepicXVT",
				Summonant = "Duddedud-Y-Offer2",
				Addant = "Duddedud-R-Offer2"
			},
			["Duddedud-R-cwin"] = {
				Id = 115897974187049,
				Name = "4831153",
				Summonant = "Duddedud-Y-cwin",
				Addant = "Duddedud-R-cwin",
				Bio = "Biggest choke in history."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Token",
		Archetype = "MegaHunters",
		AttackEffect = "Jab",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Summonant = "Duddedud-Y",
		Addant = "Duddedud-R",
		Hunt = 1,
		CustomReminder = {
			["Second Place Woes"] = "A terrified fighter is obliterated during its end step. The copy likely won't be attacking."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nWhenever you draw 3 cards from a Mega Token: Summon a 400/200 Yellow Duddedud.\nWhen this card dies: Give yourself a copy of it that's terrified and inert when discarded.",
			Ability = {
				OnAllyMegaHunt = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Terrified = true, TokenDiscard = true }
				}
			}
		},
		Bio = " "
	},
	["Mega Champion Shayph"] = {
		Id = 121227158146206,
		Name = "Mega Champion Shayph",
		AltCards = {
			["Mega Champion Shayph-Offer"] = {
				Id = 72867755689556,
				Name = "Shayph",
				ArtAnimation = "Shapez2OnSteam"
			},
			["Capi, Sovereign of the Darkheart"] = {
				Id = 123926294362519,
				Name = "Capi, The Hunt Ascendant",
				Commissioner = { "Smiley_arsonist" },
				AttackEffect = "Firebrand",
				SummonAnimation = "CieloSummon",
				AltArt = true,
				PremiumArt = 683,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Hunt 1.\nWhenever you cast a card hunting: Recur this card.\nWhenever an enemy effect targets this card: Deal 1000 overloaded damage to all enemy fighters.",
					Ability = {
						OnAllyHunt = {
							Power = { {
								"MoveZone",
								{ "Mega Champion Shayph", "GraveZone_Ally", "Hand_Ally", true, false },
								"Self"
							} },
							Target = "Self"
						},
						OnTargetByEnemy = {
							Power = { { "DamageOverloaded", 1000, nil, nil, nil, "BlazeBreathEnemy" } },
							Target = "Opponent"
						}
					}
				},
				Bio = "T1 deatheagle is funny"
			}
		},
		Health = 2025,
		Power = 2025,
		Rarity = "Legendary",
		Archetype = "MegaHunters",
		Hunt = 1,
		AttackEffect = "Jab",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Mega Hunters",
		AllowedFork = true,
		Cost = { Blue = 4, Red = 4, Yellow = 4 },
		EffectVariable = 0,
		Shield = true,
		TriggerInGraveZone = true,
		Rank = 9,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Hunt 1.\nWhenever you cast a card hunting: Recur this card.\nWhenever an enemy effect targets this card: Deal 1000 overloaded damage to all enemy fighters.",
			Ability = {
				OnAllyHunt = {
					Power = { {
						"MoveZone",
						{ "Mega Champion Shayph", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self"
				},
				OnTargetByEnemy = {
					Power = { { "DamageOverloaded", 1000, nil, nil, nil, "FireBreathEnemy" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	["Businessman-WTD"] = {
		Id = 90002162123648,
		Name = "Businessman",
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Archetype = "AWG",
		SummonAnimation = "StationEffect",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Attach a copy of a target allied fighter with Station to your terrain.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"SingleAlly"
						},
						{ "EquipGear", "Variable", "AllyTerrain" }
					},
					Target = "SingleAlly",
					TargetSubModifier = "CustomMod HasPassiveOrStation",
					TargetSubModifierDescription = "a fighter with Station"
				}
			}
		},
		Bio = "Funds the cloning technology that the AWG uses to deploy hundreds of units across the world."
	},
	["Soldier-WTD"] = {
		Id = 107538218188361,
		Name = "Soldier",
		AltCards = {
			["Soldier-Offer"] = {
				Id = 133515146772910,
				Name = "Paladin",
				AttackEffect = "Slash",
				Bio = "Not much is known about them or their leader. All that is known is that they have immense power."
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Minigun",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Station = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "Once each turn, whenever you attack: The attacking fighter gains 50 power until its next end step.",
			Ability = {
				OnAllyAttack = {
					Power = { { "TempStrengthen", 50 } },
					Target = "Aggressor",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The first test subject for the newly-developed cloning technology. Became quite upset when told she couldn't become friends with her clones."
	},
	["Outlaw-WTD"] = {
		Id = 71652469305074,
		Name = "Outlaw",
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Revolver",
		Color = "Yellow",
		Archetype = "AWG",
		Station = true,
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Addant = "Cowboy Cavalry-WTD",
		Effect = {
			Description = "Once each turn, Whenever an allied fighter attacks and destroys another: Give yourself a {W}{Y} 100/0 Cowboy that's fleeting.",
			Ability = {
				OnAllyAttackDestroy = {
					Power = { { "Add", "Addant" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			},
			EffectFleeting = true
		},
		Bio = "Seeking shelter for their crimes, they've come to the AWG to right their wrongs. Or so they say, at least."
	},
	["Cowboy Cavalry-WTD"] = {
		Id = 101588083724962,
		Name = "Cowboy",
		Health = 100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Revolver",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		TokenOmni = true,
		Fading = true,
		Cost = { Yellow = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: It gains 50 power for every gear attached to your terrain.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"AllyTerrain"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Gun is necessary."
	},
	["The Bank-WTD"] = {
		Id = 138918302822956,
		Name = "The Bank",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Terrain = true,
		Terrariant = "The Bank Terrarian",
		CustomReminderFleeting = true,
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step, if there's 6 more gears attached to this card: Draw a fleeting card.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1 } },
					Target = "DrawnCard",
					TurnTriggerLimit = 1
				}
			},
			EffectFleeting = true
		},
		Bio = "Why use a real bank when you can print your own money and get away with it?"
	},
	["Lookout-WTD"] = {
		Id = 74574858570927,
		Name = "Lookout",
		AltCards = {
			["Lookout-Offer"] = {
				Id = 111943949353845,
				Name = "SupaSpeedster",
				AttackEffect = "Jab",
				Bio = "Stain' still, eyes closed, let the world just pass me by"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Station = true,
		Cost = { Neutral = 1, Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Description = "When you've discarded 3 or more cards this turn: Deal 100 damage to a target enemy fighter.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Damage", 100 } },
					Target = "SingleEnemy",
					EffectRequirement = { "Playertable", "Me", 3, 9999, "DiscardCount" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "He'll do anything for a soda. Just don't let him have too many..."
	},
	["Destructor-WTD"] = {
		Id = 95542967840503,
		Name = "Destructor",
		AltCards = {
			["Destructor-Offer"] = {
				Id = 84697063959674,
				Name = "TERMINATOR MK II",
				AttackEffect = "Missile",
				Bio = "A poster being sold by a rando on the street, let's put it in our deck!"
			},
			["Jean, Electric Savior"] = {
				Id = 73654348363073,
				Name = "Jean, Electric Savior",
				AttackEffect = "Electric",
				AltArt = true,
				PremiumArt = 556,
				Bio = "♫<b><font color=\"#FFFFF0\">I see myself, engulfed in bright lights..<br/>Intertwined by dragging time, I'll keep going 'til I shatter my spine <br/>This act I'll thrive, this life is finite...<br/>It's the end of the line for you and I!!!!</font></b>♫"
			}
		},
		Health = 650,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "ModernRocket",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Station = true,
		Cost = { Yellow = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a fighter: it gains 50 health and power and Overload.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Strengthen", 50 },
						{ "Heal", 50 },
						{ "GivePassive", "Overload", "Aggressor" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Loves the number three, especially for his rocket bursts."
	},
	["General's Firerate Boost-WTD"] = {
		Id = 134881080543242,
		Name = "General's Firerate Boost",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Description = "Search your deck for 3 cards with Station, except they're fleeting.\nAll gear on your terrain generate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTutorfor", "HasPassiveorStation" },
						{ "RandomTutorfor", "HasPassiveorStation" },
						{ "RandomTutorfor", "HasPassiveorStation" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"AllyTerrain"
						},
						{ "Generate", 1, "CustomTarget" }
					},
					TargetParameters = {
						Zones = { "Ally_Terrain" },
						Condition = "EquippedGears"
					},
					Target = "Self",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "It takes a great leader to triumph over insurmountable threats, and even greater leaders to stop them for good."
	},
	["Stall and Upgrade-WTD"] = {
		Id = 82033794588383,
		Name = "Stall and Upgrade",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Description = "Give yourself a copy of a target fighter, except it has {Y}{Y}{Y} added to its cost and gains 300 Health and Power.\nGive yourself 4 100/50 Engineer's Robots that cost {Y} with haste and are inert in all zones.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Single"
						},
						{ "AddCopy", "Variable", "Single" },
						{
							"IncreaseCost",
							{ 3, "Yellow", "Nil" },
							"AddedCard"
						},
						{ "Heal", 300, "AddedCard" },
						{ "Strengthen", 300, "AddedCard" },
						{ "Add", "Engineer's Drones-WTD" },
						{ "Add", "Engineer's Drones-WTD" },
						{ "Add", "Engineer's Drones-WTD" },
						{ "Add", "Engineer's Drones-WTD" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The true heroes of a team are those who stand strong in the face of danger, allowing their allies to gather their strength to push back harder."
	},
	["Engineer's Drones-WTD"] = {
		Id = 136868555348600,
		Name = "Engineer's Robots",
		Health = 100,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		TokenOmni = true,
		Charge = true,
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Strengthen", 0 } },
					Target = "Self"
				}
			}
		},
		Bio = "Built by the talented Engineers to be mass produced and defend large areas."
	},
	["Mudsplatter-WTD"] = {
		Id = 113303273872543,
		Name = "Mudsplatter",
		AltCards = {
			["Mudsplatter-Offer"] = {
				Id = 115729056873157,
				Name = "Mathematician",
				ArtAnimation = "calc",
				AttackEffect = "LaserBlue",
				Bio = "TAKE OUT YOUR CALCULATOR!!!"
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "Paintball",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		SummonAnimation = "StationEffect",
		TargetImmune = true,
		DamageImmune = true,
		WeakenImmune = true,
		Cost = { Neutral = 3, Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Attach a copy of each gear on your terrain onto this fighter.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveGear",
						{ "Self", "All", true, true },
						"AllyTerrain"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "A mysterious unit that harnesses the resistant properties of mud to protect himself and his allies. The allies in question tend to hate being covered in mud."
	},
	["Kindler-WTD"] = {
		Id = 133702119088320,
		Name = "Kindler",
		AltCards = {
			["Kindler-Offer"] = {
				Id = 126498452488283,
				Name = "SIN",
				AttackEffect = "LaserRed",
				Bio = "A demon who possessed the body of an ancient leader with the mission to destroy our universe. "
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Firebrand",
		Color = "Yellow",
		Archetype = "AWG",
		PackDisplayOverride = "Metaverse Series: Awesome Weapons Guys",
		Station = true,
		Overload = true,
		Cost = { Neutral = 4, Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step, Obliterate a card with Station in your graveyard. If you do: all allied fighters gain 100 health and power.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"CustomTarget"
						},
						{ "GraveDestroy", 30, "CustomTarget" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "HasPassive", "SelectionRandomCard" },
						Modifier = { HasPassive = "Station", SelectionRandomCard = 1 }
					},
					KeepSameTargets = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 100, "Ally" },
						{ "Heal", 100, "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "A self-proclaimed 'Queen of Evil'. Has yet to show anything that definitively proves that title."
	},
	["Promised Rites"] = {
		Id = 100681907945903,
		Name = "Promised Rites",
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 4 },
		CantRaidCast = true,
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Select a card in your deck. Give your opponent an undiscardable copy of it, converting all studs in its cost to {W}.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Opponent", false, true },
							"CustomZoneTarget"
						},
						{ "RevealCard", 30, "EnemyAddedCard" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to give to your opponent"
					},
					MetaData = {
						Undiscardable = true,
						ConvertColors = {
							Green = "Neutral",
							Red = "Neutral",
							Yellow = "Neutral",
							Blue = "Neutral"
						}
					}
				}
			}
		},
		Bio = "When I started playing this game, I learned a lot of tough lessons early on. I learned you gotta find someone you can really put your trust into. Through my own fault, I wrongly thought that about you. We don't need to get into this now, but you'll never earn my trust back, you know what you did, and you're dead to me. So, don't come and ask me about it because it's over."
	},
	["Rayburn, Priest of the G.Y.R.S.C."] = {
		Id = 119630259969619,
		Name = "Rayburn, Priest of the G.Y.R.S.C.",
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "Money",
		SummonAnimation = "RayburnSummon",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Green = 7, Yellow = 7 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast and at the start of your turns: Put a Green or Yellow fighter card in your baseplate, hand, deck, and into play.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAddGenZone",
							{ "MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter", 1 },
							"Ally"
						},
						{
							"RandomAdd",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						},
						{
							"RandomDeckAdd",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						},
						{
							"RandomSummon",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						}
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"RandomAddGenZone",
							{ "MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter", 1 },
							"Ally"
						},
						{
							"RandomAdd",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						},
						{
							"RandomDeckAdd",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						},
						{
							"RandomSummon",
							"MultiColOnlyorGreenCostYellowCost GreenorYellow Fighter",
							"Ally"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Slowly, yet surely, we will make Green Yellow the best dualcolor"
	},
	["Arrêt de bus Gelé et Solitaire"] = {
		Id = 140510114867436,
		Name = "Arrêt de bus Gelé et Solitaire",
		SearchTerms = { "Arret de bus Gele et Solitaire" },
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 1 },
		Terrain = true,
		TesterSeries2 = true,
		Terrariant = "Souveraineté",
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = { {
						"AlterEV",
						{ "Set", "Target", "Color", "Nil" },
						"AggressorAddedCard"
					} },
					Target = "AggressorAddedCard"
				}
			}
		},
		Bio = ""
	},
	["Hugh J."] = {
		Id = 118962086029078,
		Name = "Hugh J.",
		Health = 850,
		Power = 850,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Neutral = 2, Red = 9, Yellow = 9 },
		TesterSeries2 = true,
		Overload = true,
		TriggerInHand = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Whenever a fighter dies, if this card's in your hand or play: Remove {R}{Y} from its cost. It can't remove the last {R}{Y} this way.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Yellow", "CapCost", 1 },
							"Self"
						},
						{
							"IncreaseCost",
							{ -1, "Red", "CapCost", 1 },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Don't sleep on this card."
	},
	["ST@GE TO ETERNITY"] = {
		Id = 108932434921592,
		Name = "ST@GE TO ETERNITY",
		SearchTerms = { "STAGE TO ETERNITY" },
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 4, Blue = 2 },
		TesterSeries2 = true,
		Terrain = true,
		Terrariant = "unad@ptably",
		ForceTerrarianStatline = { 765, 283 },
		StartGameRequirement = { "Deck", "Ally", 0, 1, "Actions" },
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast or at the start of your turns, if your starting deck contains no actions: The next 2 actions you cast this turn trigger their effect an additional time. ",
			Ability = {
				OnSummon = {
					Power = { { "ActionOverdrive", 2 } },
					Target = "Ally",
					EffectRequirement = { "StartDeckChecks" }
				},
				OnAllyStart = {
					Power = { { "ActionOverdrive", 2 } },
					Target = "Ally",
					EffectRequirement = { "StartDeckChecks" }
				}
			}
		},
		Bio = "RBYRYRBBBYYYRRBYRYRBRYYYBRRRRRBRBBYRRBYYYYRBYBBYBBBY"
	},
	NoKnowledge = {
		Id = 92524224192653,
		Name = "NoKnowledge",
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Arrow",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Neutral = 2, Yellow = 4 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Select 1 effect:\n{C1} — All enemy fighters lose 100 power. All allied fighters gain 100 power.\n{C2} — Deal 100 damage to all enemy fighters. All allied fighters gain 100 health.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "NoKnowledge-C1", "NoKnowledge-C2" },
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
			CreateAllAsChoices = true
		},
		Bio = "Consistency, Versatility, and Probability are what make a yellow deck the best deck."
	},
	["NoKnowledge-C1"] = {
		Id = 92524224192653,
		Name = "NoKnowledge-C1",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "All enemy fighters lose 100 power.\nAll allied fighters gain 100 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 100, "Opponent" },
						{ "Strengthen", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["NoKnowledge-C2"] = {
		Id = 92524224192653,
		Name = "NoKnowledge-C2",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Deal 100 damage to all enemy fighters.\nAll allied fighters gain 100 health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 100, "Opponent" },
						{ "Heal", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Food Fan tige1111"] = {
		Id = 128331106147159,
		Name = "Food Fan tige1111",
		Health = 750,
		Power = 750,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Neutral = 2, Red = 8 },
		TesterSeries2 = true,
		RansackCount = 0,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		CustomReminderRansack = true,
		Effect = {
			Description = "Whenever you cast a card: Ransack 1 card of a different card type. Apply the corresponding effect—\nFighter — Destroy your opponent's terrain.\nAction — This card gains 500 Power.\nTerrain — Draw a card. You lose 400 life.\nGear — Deal 300 damage to a target fighter.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "MultiSelectOperation", "ChoiceSelect", "CustomZoneTarget" },
						{ "GraveDestroy", 30, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { NotFighter = true },
						SelectionDescription = "a nonfighter card to Obliterate",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "MultiSelectOperation", "ChoiceSelect", "CustomZoneTarget" },
						{ "GraveDestroy", 30, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { NotAction = true },
						SelectionDescription = "a non-action card to Obliterate",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "MultiSelectOperation", "ChoiceSelect", "CustomZoneTarget" },
						{ "GraveDestroy", 30, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { NotTerrain = true },
						SelectionDescription = "a non-terrain card to Obliterate",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnAllyCastGear = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "MultiSelectOperation", "ChoiceSelect", "CustomZoneTarget" },
						{ "GraveDestroy", 30, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { NotGear = true },
						SelectionDescription = "a non-gear card to Obliterate",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				MultiSelectOperationChoiceSelect = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Fighter" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsFighter" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Action" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsAction" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Terrain" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsTerrain" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Gear" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsGear" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassIsFighter = {
					Power = { { "DestroyTerrain", 30, "Opponent" } },
					Target = "Self"
				},
				OnEVCheckPassIsAction = {
					Power = { { "Strengthen", 500 } },
					Target = "Self"
				},
				OnEVCheckPassIsTerrain = {
					Power = {
						{ "Cost", 400 },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckPassIsGear = {
					Power = { { "Damage", 300, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "the chicken cannot get more seasoned than this"
	},
	["Lid, Ruinous Hexblade"] = {
		Id = 138190181270711,
		Name = "Lid, Ruinous Hexblade",
		Health = 2000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Red = 5, Yellow = 4, Blue = 4 },
		TesterSeries2 = true,
		Charge = true,
		Rank = 9,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: If there's no Green cards in your baseplate, Select 1 effect to put into your baseplate—\n{C1} — At the start of each turn: Double all allied damage from combat and effects.\n{C2} — At the start of your turns: If an allied fighter or action would trigger its effect when cast this turn, it triggers twice instead.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "LidCritical", "LidSuccession" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{
							"AddGenZone",
							{ "Variable", 1 }
						}
					},
					Target = "Ally",
					EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Green" }
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Forever hoarding their finishing move until the \"perfect moment\"."
	},
	LidCritical = {
		Id = 117099718641150,
		Name = "Critical",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Red = 5, Yellow = 5, Blue = 5, Neutral = 2 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your turns: Until your opponent's next end step, enemy fighters take double damage from effects.<br/>At the start of each turn: Allied fighters deal double damage in combat.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "AssignEffectDamageWeaknessMulti", 2 },
						{ "AssignCombatDamageMulti", 2, "Ally" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "Sadly doesn't give you extra turns for every attack."
	},
	LidSuccession = {
		Id = 123487408372618,
		Name = "Succession",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Red = 5, Yellow = 5, Blue = 5, Neutral = 2 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your turns: If an allied fighter or action would trigger its effect when cast, it triggers twice instead.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Overdrive", 30 },
						{ "ActionOverdrive", 999 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Just wait for me to prepare for one more turn."
	},
	["Brie The Gingerbread Witch"] = {
		Id = 125046292312141,
		Name = "Brie the Gingerbread Witch",
		Health = 1200,
		Power = 450,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 6, Neutral = 3 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Transformant = "Gingerbeast",
		CustomReminder = {
			GingerBeast = "Inert in all zones. When it dies, all players gain 600 life."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: For each non-Blue colour among cards in your baseplate, transform a target fighter into an inert Gingerbeast.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Red", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Red" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Green", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Green" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Yellow", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Yellow" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckPassRed = {
					Power = { { "Transform", "Transformant", "Single" } }
				},
				OnEVCheckPassGreen = {
					Power = { { "Transform", "Transformant", "Single" } }
				},
				OnEVCheckPassYellow = {
					Power = { { "Transform", "Transformant", "Single" } }
				}
			}
		},
		Bio = "Some jokes have the punchline baked in!"
	},
	Gingerbeast = {
		Id = 78891516497491,
		Name = "Gingerbeast",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Conflux",
			Description = "When this card dies: All players gain 600 Life.",
			Type = "OnDeath",
			Power = { { "Inflict", -600 } },
			Target = "All"
		},
		Bio = ""
	},
	Slickster = {
		Id = 136011222151130,
		Name = "Slickster",
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Rank = 6,
		Cost = { Red = 1, Green = 1, Yellow = 1 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		ReplaceDescriptionant = "Pda ynawpekj, ceraj epo ksj bnaazki, ydkoa epo ksj zaopnqypekj. Pdau woyajzaz pk pda iknpwh dknevkj, sdu zez ukq xnejc pdai xwyg? Pdau jk hkjcan ateop.",
		Effect = {
			Description = "When this card enters your hand: Replace its effect, except its modernist theory states that society has significance only if narrativity is interchangeable with truth.",
			Ability = {
				OnDrawn = {
					Power = {
						{ "CreateChoices", "Any", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomTarget"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "ReplaceEffect", "Variable", "Self" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = "All"
					}
				}
			},
			AmountOfTargets = 1
		},
		Bio = "\"Fbba V'yy jnxr hc gb gur yvsr V yvir. Sbe abj, yrg zr qernz bs nzoebfvn.\""
	},
	SlicksterTESTCARD = {
		Id = 16939683969,
		Name = "SlicksterTESTCARD",
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Red = 1, Green = 1, Yellow = 1 },
		PlayTest = true,
		ReplaceDescriptionant = "Pda ynawpekj, ceraj epo ksj bnaazki, ydkoa epo ksj zaopnqypekj. Pdau woyajzaz pk pda iknpwh dknevkj, sdu zez ukq xnejc pdai xwyg? Pdau jk hkjcan ateop.",
		Effect = {
			Description = "When this card enters your hand: Replace its effect, except its modernist theory states that society has significance only if narrativity is interchangeable with truth.",
			Ability = {
				OnDrawn = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Deck_Ally", "All", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "PickCard" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "ReplaceEffect", "Variable", "Self" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassPickCard = {
					Power = { {
						"AlterEV",
						{ "Set", "Target", "CardIndex", "Nil" },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "BottomCard",
						Modifier = 1
					}
				},
				OnEVCheckFailPickCard = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", "Maladeity's Pustule", "Nil" },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["The Dreadnought"] = {
		Id = 139824438981248,
		Name = "The Dreadnought",
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "Slash",
		SummonAnimation = "AstarossaSummon",
		SummonedAnimation = "AstarossaSummon",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Green = 4, Red = 2 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Whenever a card enters your opponent's baseplate: This card gains 200 Power. Swap its stats.",
			Ability = {
				OnEnemyBaseplate = {
					Power = {
						{ "Strengthen", 200 },
						{ "Swap" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Live. In. Fear."
	},
	Taken = {
		Id = 83578070608906,
		Name = "Taken",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Neutral = 4, Red = 1, Green = 1, Yellow = 1, Blue = 1 },
		TesterSeries2 = true,
		RandomAddBypass = "IncludeToken",
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Obliterate a target allied fighter and all copies of it in all your zones.\nFor each card obliterated this way, give yourself any card, except they're 2{R}{G}{B}{Y} 500/400 fighters.\nSummon a 500/400 fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil", 2 },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "MathModifyVariable_2", 1, "Nil", 2 },
							"CustomTarget"
						},
						{ "Extract" },
						{
							"EVGreaterValueCheck",
							{ 0, "CopiesOblit", 2 },
							"Self"
						},
						{ "RandomSummon", "TokenorNotRarity Fighter" }
					},
					Target = "SingleAlly",
					TargetParameters = {
						Zones = {
							"Ally_Hand",
							"Ally_GenZone",
							"Ally_Deck",
							"Ally_GraveZone",
							"Ally_Field"
						},
						Condition = "MatchesCardIndex",
						Modifier = { MatchesCardIndex = "Variable" }
					},
					MetaData_RandomSummon = { Health = 500, Power = 400 }
				},
				OnEVCheckPassCopiesOblit = {
					Power = {
						{ "RandomAdd", "Any", "Ally" },
						{ "RemovePassive", "Gear", "AddedCard" },
						{ "RemovePassive", "Terrain", "AddedCard" },
						{
							"AlterEV",
							{ "Subtract", "MathModifyVariable_2", 1, "Nil", 2 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "CopiesOblit", 2 }
						}
					},
					Target = "Self",
					NoBlip = true,
					MetaData = {
						Cost = { Red = 2, Green = 2, Yellow = 2, Blue = 2 },
						Health = 500,
						Power = 400
					}
				},
				OnEVCheckPassIsFighter = {
					Power = {
						{ "SetHealth", 500, "AddedCard" },
						{ "SetPower", 400, "AddedCard" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Take'th Give'th"
	},
	["Hellfire Mantle"] = {
		Id = 127880809404158,
		Name = "Hellfire Mantle",
		AltCards = {
			["killmarioandluigi99's Solipsism"] = {
				Id = 104201363775100,
				Name = "killmarioandluigi99's Solipsism",
				Health = 1000,
				Power = 400,
				Rarity = "Token",
				Terrarian = true,
				Bio = "As the Inorganic and the Organic combines, my mind and knowledge shall be at once."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Neutral = 3, Green = 1, Red = 1 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Terrain = true,
		SkipOnImmune = true,
		Terrariant = "killmarioandluigi99's Solipsism",
		ForceTerrarianStatline = { 1000, 400 },
		Effect = {
			Description = "At the start of your turns: Destroy a random card in your hand. If it's a fighter, give yourself a 300/300 copy of it. If it's an action, give yourself 2 fleeting copies. Otherwise, you lose 500 life and draw 2 cards.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "SelectedCard" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Fighter" },
							"CustomTarget"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsFighter" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Action" },
							"CustomTarget"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsAction" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Terrain" },
							"CustomTarget"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsTerrainGear" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Gear" },
							"CustomTarget"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsTerrainGear" },
							"Self"
						},
						{ "SpecificDiscard" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { "HasntPassive", "SelectionRandomCard" },
						Modifier = { HasntPassive = "DestroyImmune", SelectionRandomCard = 1 }
					},
					KeepSameTargets = true
				},
				OnEVCheckPassIsFighter = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "SelectedCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"EVCard"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					MetaData = { Health = 300, Power = 300 }
				},
				OnEVCheckPassIsAction = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "SelectedCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"EVCard"
						},
						{ "Add", "Variable", "Ally" },
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					MetaData = { Fleeting = true }
				},
				OnEVCheckPassIsTerrainGear = {
					Power = {
						{ "Cost", 500 },
						{ "Draw", 2 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "I guess if there's anything in particular I'm trying to say, it's that it's not unusual for studlings to fly above lava like this. Crows, too."
	},
	["Stroke of Misfortune"] = {
		Id = 86567484621835,
		Name = "Misfortunate Stroke",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Neutral = 3, Red = 3, Green = 3, Yellow = 3 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		CustomReminder = {
			Aneurysm = "When attached, set this fighter's health to 100. It can't counter. Fighters attacking it gain overload."
		},
		Effect = {
			Description = "Your opponent loses half of their life.\nAttach an Aneurysm to all enemy fighters on the left side of the board.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "Life", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "StatRound", "Math", 50, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{ "EquipGear", "Aneurysm", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "BottomHalf"
					}
				}
			}
		},
		Bio = "\"I taste copper.\""
	},
	Aneurysm = {
		Id = 82881956138067,
		Name = "Aneurysm",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		TesterSeries2 = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Gear = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Attach to a target fighter.\nWhen you do: Set its health to 100.\nThis fighter can't counter.\nWhenever this fighter is attacked: Attach overload to the attacking fighter.",
			Ability = {
				OnEquipped = {
					Power = { { "SetHealth", 100 } },
					Target = "Self"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "CounterBlock" } },
					Target = "Self"
				},
				OnAttackedPreCombatDamage = {
					Power = { { "EquipGear", "Overloaded Mod" } },
					Target = "Aggressor"
				}
			}
		},
		Bio = "Aw, man..."
	},
	["SaltyNope, Architect Of 'Tech'"] = {
		Id = 127719777449412,
		Name = "SaltyNope, Architect Of 'Tech'",
		Health = 1300,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Yellow = 4, Blue = 4 },
		TesterSeries2 = true,
		ChargeRequirement = { "Board", "AllyGenZone", 10, 9999 },
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "This card has haste if your baseplate rank is 10 or greater.\nWhenever this card attacks: Select a terrain token and cast it —\n{C1} - When 4 or more fighters have died this turn: Draw a card.\n{C2} — Once each turn, whenever an enemy fighter dies: A target allied fighter gains 100 Power.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"CreateChoices",
							{ "Card Cycler", "Microtrading Mallets" },
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
		Bio = "\"The tech is me killing you.\""
	},
	["Card Cycler"] = {
		Id = 110309645184850,
		Name = "Card Cycler",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Yellow = 0 },
		TesterSeries2 = true,
		Terrain = true,
		Terrariant = "The Greatest Prank",
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When 4 or more fighters have died this turn: Draw a card.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 4, 9999, "AllDeathStorm" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"who doesn't love free cards?.\""
	},
	["Microtrading Mallets"] = {
		Id = 126115314597467,
		Name = "Microtrading Mallets",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Yellow = 0 },
		TesterSeries2 = true,
		Terrain = true,
		Terrariant = "The Greatest Prank",
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Once each turn, whenever an enemy fighter dies: A target allied fighter gains 100 Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Strengthen", 100 } },
					Target = "SingleAlly",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"microtrading my beloved\""
	},
	["The Greatest Prank"] = {
		Id = 134763699173604,
		Name = "The Greatest Prank",
		Health = 2700,
		Power = 1100,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is animated: Your opponent steals it.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "OpponentSteal", 30, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"hi Nin\""
	},
	Vanity = {
		Id = 86953037483637,
		Name = "Vanity",
		Health = 600,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Yellow = 4, Red = 4, Green = 4 },
		EffectVariable = 0,
		Overload = true,
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Destroy another target allied and enemy fighter.\nWhenever a fighter dies: If it's allied, This card gains its Power. Otherwise it gains Health equal to its power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					TargetSubModifier = "CustomModAlly OtherCard",
					TargetSubModifierDescription = "a different allied fighter"
				},
				OnEVCheckPass = {
					Power = { { "Destroy", 30, "SingleEnemy" } },
					Target = "Self"
				},
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{ "Heal", "Variable" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "\"Patience is not a virtue, nor gluttony a sin\""
	},
	pikutree = {
		Id = 97392324958037,
		Name = "pikutree",
		Health = 150,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1, Red = 1, Green = 1, Blue = 1 },
		TesterSeries2 = true,
		Summonant = "pikutree",
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Summon a Red, Blue, and Green copy of this fighter, except they're inert in play.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "ReplaceColor", "Red", "SummonedCard" },
						{ "GivePassive", "Token", "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "ReplaceColor", "Blue", "SummonedCard" },
						{ "GivePassive", "Token", "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "ReplaceColor", "Green", "SummonedCard" },
						{ "GivePassive", "Token", "SummonedCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Now with oranges!"
	},
	["0x2991; SkyFractured"] = {
		Id = 83968156738468,
		Name = "0x2991; SkyFractured",
		Health = 1000,
		Power = 1000,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Red",
		Cost = { Neutral = 1, Red = 8 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Equippant = "Fractured Mark",
		CustomReminder = {
			["Fractured Mark"] = "This fighter takes 100 extra damage from anything. When it dies, attach a Fractured Mark to an allied fighter. If you can't, give your opponent a copy of it and you lose 500 life."
		},
		Effect = {
			Description = "When this card is cast: Attach a Fractured Mark to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant", "SingleEnemy" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"If I can't have wings, I'll just have to make the sky fall.\""
	},
	["Fractured Mark"] = {
		Id = 139629244494729,
		Name = "Fractured Mark",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		GrantsPassive = "Marked",
		SpecialEffectAnimation = "Mark",
		SpecialEffectant = "RemoveMark",
		Equippant = "Fractured Mark",
		Addant = "Fractured Mark",
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter is marked while this is attached to it.\nWhen this card dies: Attach a copy of this gear to an allied fighter. If there are no fighters to attach to, give your opponent a copy of this gear and you lose 300 life.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Marked" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { {
						"RemovePassive",
						"Marked",
						"GearOwner",
						nil,
						nil,
						nil,
						"SpecialEffectant"
					} },
					Target = "GearOwner"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Fighter", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "Equippant" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = { "AttachedTo", "SelectionRandomCard" },
						Modifier = { AttachedTo = false, SelectionRandomCard = 1 }
					},
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckFail = {
					Power = {
						{ "Add", "Addant", "NotCardOwner" },
						{ "Cost", 300, "Ally" }
					},
					Target = "NotCardOwner",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Past and present, our never ending future\nCountless autumns pass, waiting your return"
	},
	["Samsara Lotus"] = {
		Id = 72975028927470,
		Name = "Saṃsāra Lotus",
		SearchTerms = { "Samsara Lotus" },
		Health = 0,
		Power = 0,
		AddHealth = 600,
		AddPower = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Equippant = "Samsara Lotus",
		Summonant = "Kensei of The Roaring Tides & Colliding Waves",
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Gear = true,
		CustomReminder = {
			["Six Armed Bodhisattva"] = "A dextrous 800/800, immune to targeting. Whenever it attacks, select a card in your deck that costs only Colourless studs and search it. Remove {W}{W} from its cost."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever you cast a Colourless card: Attach a +0/+0 copy of this gear onto this card. Then, if there's 6 copies attached to this card, destroy them and summon the Six Armed Bodhisattva.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{ "EquipGear", "Equippant" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Samsara Lotus" },
							"Self"
						},
						{ "EVGreaterValueCheck", 5, "Self" }
					},
					Target = "GearOwner",
					Color = "Neutral",
					TurnTriggerLimit = 1,
					MetaData = { AddPower = 0, AddHealth = 0 }
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "DestroyGear", "Samsara Lotus", "Self" },
						{ "Summon", "Summonant", "Ally" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "<font color=\"#5A70F0\">Forever set a precious moon is lost\nForever gone with morning frost\nAs heaven rises upon a luminous blue moon\nTwo lovers lie in the stillness of morning dew.</font>"
	},
	["Kensei of The Roaring Tides & Colliding Waves"] = {
		Id = 121522862752368,
		Name = "竜神, Six Armed Bodhisattva",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Dextrous = true,
		TargetImmune = true,
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Equippant = "Fractured Mark",
		Effect = {
			Description = "Whenever this card attacks: Select a card in your deck that costs only Colourless studs and search it. Remove {W}{W} from its cost.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { MatchesParameter = "CostOnlyColourless" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to search"
					},
					MetaData = {
						AddCost = { Neutral = -2 }
					}
				}
			}
		},
		Bio = "<font color=\"#4FAEFD\"> \"It may be for a moment, but my fire roars up so bright and hot, it's almost blinding. And then, all that remains is pure white ash. There are no embers left...just pure white ash.\"</font>"
	},
	ShovelAction = {
		Id = 106997065036970,
		Name = "Shovelth",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2, Yellow = 2 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "Destroy a target fighter with 1050 or more total stats.\nYou lose 500 life.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CheckTotal",
							{ 1050, 999999 }
						},
						{ "Cost", 500 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "The extra {W} covers the subscription fee to cast me."
	},
	["Sunderworld Apothecary"] = {
		Id = 139549348059479,
		Name = "Sunderworld Apothecary",
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		SummonAnimation = "DuckCall",
		AttackEffect = "StudBlast",
		Color = "Green",
		Cost = { Neutral = 3, Green = 6 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Destroy 3 green cards in your baseplate. Until the end of your next turn, allied fighters can't die or be destroyed.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"GenZoneDiscard",
							{ "Green", -3 }
						},
						{ "BypassCardDeath", 2 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"I've spent a lifetime saving lives. If I must, I'll save you from yourselves.\""
	},
	RobberBros = {
		Id = 135896137645637,
		Name = "RobberBros",
		Health = 550,
		Power = 650,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2, Blue = 2, Yellow = 1 },
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		Effect = {
			Description = "When this card is cast: Transform a target fighter into this card, if you do, divide it into 2 smaller copies of itself.\nWhen this card dies: Your opponent draws a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Transform", "RobberBros", "Single" },
						{ "SummonSplit", 2, "TransformedCard" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Draw", 1, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "아름답게, 아름답던 // 그 시절을 난 아파서\n사랑받을 수 없었던 내가 // 너무나 싫어서\n엄마는, 아빠는 다 // 나만 바라보는데\n내 마음은 그런 게 아닌데 // 자꾸만 멀어만 가"
	},
	["ADeadBody¹⁴"] = {
		Id = 121367612608915,
		Name = "ADeadBody¹⁴",
		SearchTerms = "ADeadBody14",
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2, Blue = 2 },
		ReplaceAllAdd = "Moonleak",
		TesterSeries2 = true,
		PackDisplayOverride = "Metaverse Series: Testers Set 2",
		CustomReminder = { Moonleak = "A {W}{W} action, inert in all zones, that draws a card." },
		Effect = {
			Description = "If an effect would give a player a card, they're given a Moonleak instead.",
			Ability = {
				Nil = {
					Power = {
						{ "Transform", "RobberBros", "SingleAlly" },
						{ "SummonSplit", 2, "AlliedFirstFieldSelfCopy" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Snowman Clue"] = {
		Id = 1046537927,
		Name = "Snowman Clue",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Green = 1, Blue = 1 },
		PlayTest = true,
		TokenOmni = true,
		Archetype = "Snowmen",
		Summonant = "Snowman",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Effect = {
			Description = "Apply effects based on the number of other Snowman Clues in your hand, then shuffle them into your deck—<br/>0+ - Put a Snowy blessing on a card space in your hand.<br/>1+ - Lock a target enemy fighter for 1 turn.<br/>2+ - Summon a 500/500 Snowman that's inert in all zones<br/>4+ - That snowman gains 500 Health and Power and overload.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "Snowman Clue", "Nil" }
						},
						{
							"MoveZone",
							{ "Snowman Clue", "Hand_Ally", "Deck_Ally", true, false, 99 }
						},
						{ "AddHandModifier", "SnowmanBless", "RandomPrioNotBlessedAllyHand" },
						{
							"EVGreaterValueCheck",
							{ 0, "Lock" }
						},
						{
							"EVGreaterValueCheck",
							{ 1, "SnowmanSummon" }
						},
						{
							"EVGreaterValueCheck",
							{ 3, "SnowmanBuff" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassLock = {
					Power = { { "Lock", 1, "SingleEnemy" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassSnowmanSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassSnowmanBuff = {
					Power = {
						{ "Strengthen", 500, "SummonedCard" },
						{ "Heal", 500, "SummonedCard" },
						{ "GivePassive", "Overload", "SummonedCard" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	Snowman = {
		Id = 894661980,
		Name = "Snowman",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Blue = 1 },
		TokenOmni = true,
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	SnowmanCB = {
		Id = 4961853743,
		Name = "SnowmanCB",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "Once each turn, whenever you discard a card: Give yourself a Snowman Clue.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	SnowmanCG = {
		Id = 87955672289673,
		Name = "SnowmanCG",
		Health = 500,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Blue = 1 },
		PlayTest = true,
		Blessing = true,
		ModifierSnowman = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "When this card is cast: Put a Snowy blessing on your 7th card space. Shuffle a Snowman Clue into your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "SnowmanBless", "Self" },
						{ "DeckAdd", "Snowman Clue", "Ally" }
					},
					Target = "Self",
					MetaData = {
						SlotTargets = { 6 }
					}
				}
			}
		},
		Bio = ""
	},
	SnowmanCB2 = {
		Id = 19312740,
		Name = "SnowmanCB2",
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Green = 2, Blue = 1 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "Once each turn, whenever you use up a blessing: Give yourself a Snowman Clue.",
			Ability = {
				OnAllyClean = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	SnowmanUB = {
		Id = 4455764855,
		Name = "SnowmanUB",
		Health = 1000,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 1, Green = 1, Blue = 1 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "When this card is cast from a blessed space: Unlock it.\nWhen this card dies: Give yourself a Snowman Clue.",
			Ability = {
				OnDeath = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self"
				},
				OnSummonModified = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	SnowmanUG = {
		Id = 1292296568,
		Name = "SnowmanUG",
		Health = 400,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Blue = 2, Green = 1, Neutral = 1 },
		PlayTest = true,
		Blessing = true,
		ModifierSnowman = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "When this card is cast: Put a Snowy blessing on your 4th, 8th and 9th card space.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "SnowmanBless", "Self" } },
					Target = "Self",
					MetaData = {
						SlotTargets = { 3, 7, 8 }
					}
				}
			}
		},
		Bio = ""
	},
	SnowmanRB = {
		Id = 119965996,
		Name = "SnowmanRB",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "Shuffle any number of cards in your hand into your deck. Give yourself that many Snowmen Clues, then draw that many cards.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Deck_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"RepeatingAdd",
							{ "Addant", "Variable" },
							"Ally"
						},
						{ "Draw", "Variable", "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "any number of cards in your hand to shuffle into your deck.",
						MinTargets = 0,
						MaxTargets = 99
					}
				}
			}
		},
		Bio = ""
	},
	SnowmanRG = {
		Id = 17366303617,
		Name = "SnowmanRG",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Green = 2, Neutral = 1 },
		PlayTest = true,
		Blessing = true,
		ModifierSnowman = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "Put a Snowy blessing on your 5th card space.\nYou may select 2 cards in your hand and shuffle them into your deck. If you do, deal 600 damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "SnowmanBless", "Self" },
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Deck_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					MetaData = {
						SlotTargets = { 4 }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "two cards in your hand to shuffle into your deck.",
						MinTargets = 0,
						MaxTargets = 2
					}
				},
				OnEVCheckPass = {
					Power = { { "Damage", 600, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	SnowmanEB = {
		Id = 71424808,
		Name = "SnowmanEB",
		Health = 0,
		Power = 0,
		AddHealth = 600,
		AddPower = 200,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Green = 2, Blue = 3 },
		PlayTest = true,
		Gear = true,
		TriggerInGraveZone = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Effect = {
			Description = "Attach to a target fighter.\nWhenever this fighter attacks and destroys another: Give yourself a Snowman Clue.\nWhenever a card you cast uses up a blessing: Recur this card, except it's fading.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnAllySummonModified = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = ""
	},
	SnowmanEG = {
		Id = 3062259481,
		Name = "SnowmanEG",
		Health = 2000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Green",
		EffectVariable = 2,
		Cost = { Neutral = 4, Green = 4, Blue = 4 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		Overload = true,
		Effect = {
			Description = "When this card is cast: Put a Snowy blessing on 2 card spaces in your hand.\nOnce each turn, whenever a card you cast uses up a blessing: Give yourself 2 Snowmen Clues.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "SnowmanBless", "RandomPrioNotBlessedAllyHand" },
						{ "AddHandModifier", "SnowmanBless", "RandomPrioNotBlessedAllyHand" }
					},
					Target = "Ally"
				},
				OnAllyClean = {
					Power = { {
						"RepeatingAdd",
						{ "Addant", "Variable" },
						"Ally"
					} },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	SnowmanLC = {
		Id = 2701273848,
		Name = "SnowmanLC",
		Health = 700,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 2,
		Cost = { Neutral = 5 },
		PlayTest = true,
		Archetype = "Snowmen",
		PackDisplayOverride = "Metaverse Series: Snowmen",
		Addant = "Snowman Clue",
		TriggerInHand = true,
		Effect = {
			Description = "During your end step, if this card is in your hand in a blessed space: Give yourself a Snowman's Clue.",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 9999, "InModifiedSlot" }
				}
			}
		},
		Bio = ""
	},
	["Dubious Receptionists"] = {
		Id = 116359934899182,
		Name = "Dubious Receptionists",
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "When this card is cast: Select a Dubious action in your deck and search it.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Archetype = "Dubious", Action = true },
						SelectionDescription = "a Dubious card in your deck to search",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "Each of D.T.T.'s departments are armed to the teeth. Sometimes with weapons."
	},
	["D.T.T. Employee"] = {
		Id = 108352565872780,
		Name = "D.T.T. Employee",
		AltCards = {
			["D.T.T. Employee-Offer"] = {
				Id = 125918278048979,
				Name = "Senior & Junior",
				AttackEffect = "Jab",
				Bio = "\"Hold on tight, Junior! It's huntin' time!\""
			}
		},
		SearchTerms = "DTT Employee",
		Health = 100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Blue = 2 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Shield = true,
		AttackBlock = true,
		Effect = {
			Description = "When this card dies: Lock a target enemy fighter for 1 turn.",
			Ability = {
				OnDeath = {
					Power = { { "Lock", 1 } },
					Target = "SingleEnemy",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Another day, another dollar."
	},
	["Dubious Tasks Taken"] = {
		Id = 72077522358578,
		Name = "Dubious Tasks Taken",
		AltCards = {
			["Dubious Tasks Taken-Offer"] = {
				Id = 118391931169843,
				Name = "Police Chief's Imposition",
				AttackEffect = "Jab",
				Effect = {
					Description = "Unleash the Train.\nGive yourself 2 Train Contractor cards.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Ally", "TrainCar", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 2, "HasTrain" }
								},
								{
									"RepeatingRandomAdd",
									{
										{ "Medic-OfferToken", "Psycho-OfferToken", "Gunslinger-OfferToken" },
										2
									},
									"Ally"
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassHasTrain = {
							Power = {
								{ "Strengthen", 200 },
								{ "Heal", 200 }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "Archetype",
								Modifier = "TrainCar",
								SubModifier = true
							}
						},
						OnEVCheckFailHasTrain = {
							Power = {
								{
									"EVGreaterValueCheck",
									{ -1, "Back" }
								},
								{
									"EVGreaterValueCheck",
									{ -1, "Centre" }
								},
								{
									"EVGreaterValueCheck",
									{ -1, "Front" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassBack = {
							Power = { { "Summon", "TrainBack-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainBack" }
						},
						OnEVCheckPassCentre = {
							Power = { { "Summon", "TrainMid-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainMid" }
						},
						OnEVCheckPassFront = {
							Power = { { "Summon", "TrainFront-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainFront" }
						}
					}
				},
				Bio = "\"You're not getting past me.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 2, Blue = 3, Yellow = 1 },
		Archetype = "Dubious",
		Rank = 4,
		CustomReminder = {
			["The Train"] = "A 600/0, 900/0, and 1200/0 line of fighters. Defend the Train to search for Dubious cards; You lose 2100 life if you fail. If there's already a train, they all gain 200 Health and Power instead.",
			["Train Contractors"] = "{Y} gear tokens. They help defend the Train."
		},
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Unleash the Train.\nGive yourself 2 Train Contractor cards.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "TrainCar", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 2, "HasTrain" }
						},
						{
							"RepeatingRandomAdd",
							{ "TrainContractor", 2 },
							"Ally"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassHasTrain = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "TrainCar",
						SubModifier = true
					}
				},
				OnEVCheckFailHasTrain = {
					Power = {
						{
							"EVGreaterValueCheck",
							{ -1, "Back" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Centre" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Front" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassBack = {
					Power = { { "Summon", "TrainBack" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainBack" }
				},
				OnEVCheckPassCentre = {
					Power = { { "Summon", "TrainMid" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainMid" }
				},
				OnEVCheckPassFront = {
					Power = { { "Summon", "TrainFront" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainFront" }
				}
			}
		},
		Bio = "The cargo loaded, no questions asked.\nThe contractors paid for, no questions asked.\nThe train? No questions asked."
	},
	["D.T.T. Accountant"] = {
		Id = 115803673224708,
		Name = "D.T.T. Accountant",
		AltCards = {
			["D.T.T. Accountant-Offer"] = {
				Id = 128707308374275,
				Name = "Bandit Enforcer",
				AttackEffect = "Jab",
				Effect = {
					Description = "When this card is cast or dies: Select a train contractor. Attach it to a target allied fighter.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"CreateChoices",
									{ "Medic-OfferToken", "Psycho-OfferToken", "Gunslinger-OfferToken" }
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardIndex", "Nil" },
									"CustomZoneTarget"
								},
								{ "EquipGear", "Variable", "SingleAlly" }
							},
							Target = "Self",
							ZoneTargetParameters = {
								Zones = { "Ally_ChoiceZone" },
								Condition = {},
								MinTargets = 0,
								MaxTargets = 1,
								SelectionDescription = "an employee to contract"
							},
							UniqueTargets = true
						},
						OnDeath = {
							Power = {
								{
									"CreateChoices",
									{ "Medic-OfferToken", "Psycho-OfferToken", "Gunslinger-OfferToken" }
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardIndex", "Nil" },
									"TargetChoiceZone"
								},
								{ "EquipGear", "Variable", "SingleAlly" }
							},
							Target = "Self",
							AllowDeadAggressorTrigger = true,
							ZoneTargetParameters = {
								Zones = { "Ally_ChoiceZone" },
								Condition = {},
								MinTargets = 0,
								MaxTargets = 1,
								SelectionDescription = "an employee to contract"
							},
							UniqueTargets = true
						}
					},
					CreateAllAsChoices = true
				},
				Bio = "\"Picked a bad time to be showin' up, pardner.\""
			}
		},
		SearchTerms = "DTT Accountant",
		Health = 500,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = "Medic",
		Cost = { Blue = 3 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "When this card is cast or dies: Select a train contractor. Attach it to a target allied fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Medic", "Psycho", "Gunslinger" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomZoneTarget"
						},
						{ "EquipGear", "Variable", "SingleAlly" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "an employee to contract"
					},
					UniqueTargets = true
				},
				OnDeath = {
					Power = {
						{
							"CreateChoices",
							{ "Medic", "Psycho", "Gunslinger" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "EquipGear", "Variable", "SingleAlly" }
					},
					Target = "Self",
					AllowDeadAggressorTrigger = true,
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "an employee to contract"
					},
					UniqueTargets = true
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Sophia sighed as she cracked open the twelfth energy drink of the night, feeling exactly why her predecessor quit the game."
	},
	["Overworked Engineers"] = {
		Id = 108839868058452,
		Name = "Overworked Engineers",
		AltCards = {
			["Overworked Engineers-Offer"] = {
				Id = 93118521953417,
				Name = "EVIL ENGINEER",
				AttackEffect = "Jab",
				Effect = {
					Description = "During your end step: Attach a Train Contractor to each allied token fighter.",
					Ability = {
						OnEnd = {
							Power = { {
								"RandomEquipGear",
								{ "Medic-OfferToken", "Psycho-OfferToken", "Gunslinger-OfferToken" },
								"AllyToken"
							} },
							Target = "Self"
						}
					}
				},
				Bio = "عندي اسهال اريد دواء"
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = "TrainContractor",
		Cost = { Blue = 5 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "During your end step: Attach a Train Contractor to each allied token fighter.",
			Ability = {
				OnEnd = {
					Power = { { "RandomEquipGear", "Variable", "AllyToken" } },
					Target = "Self"
				}
			}
		},
		Bio = "They tighten the bolts, a bandit shoots them off.\nThey lubricate the wheels, some failing medic clogs them up.\nThe engineers often imagined Sisyphus happy."
	},
	["Southwind City"] = {
		Id = 112744627096630,
		Name = "Southwind City",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = "TrainContractor",
		Cost = { Yellow = 1, Blue = 3 },
		Terrain = true,
		Terrariant = "Lieutenant Steels",
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		["The Train"] = "A 600/0, 900/0, and 1200/0 line of fighters. Defend the Train to search for Dubious cards; You lose 2100 life if you fail. If there's already an allied Train, they all gain 200 Health and Power instead.",
		Effect = {
			Description = "During your end step, if allied effects have targeted 3 or more times since your last end step: Unleash the Train.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "TrainCar", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 2, "HasTrain" }
						}
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Playertable", "Me", 3, 999999, "TargetCount" }
				},
				OnEVCheckPassHasTrain = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "TrainCar",
						SubModifier = true
					}
				},
				OnEVCheckFailHasTrain = {
					Power = {
						{
							"EVGreaterValueCheck",
							{ -1, "Back" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Centre" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Front" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassBack = {
					Power = { { "Summon", "TrainBack" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainBack" }
				},
				OnEVCheckPassCentre = {
					Power = { { "Summon", "TrainMid" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainMid" }
				},
				OnEVCheckPassFront = {
					Power = { { "Summon", "TrainFront" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainFront" }
				}
			}
		},
		Bio = "A sprawling metropolis full of old trainlines, many out of sight and out of pocket."
	},
	["Lieutenant Steels"] = {
		Id = 100033849070363,
		Name = "Lieutenant Steels",
		Health = 900,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		Terrarian = true,
		Archetype = "Police",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Whenever this card becomes locked: Destroy a target allied Train Car. If you do, give yourself 3 Police cards.",
			Ability = {
				OnEVCheckPass = {
					Power = { {
						"RepeatingRandomAdd",
						{ "Police", 3 },
						"Ally"
					} },
					Target = "Self"
				},
				OnLock = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{ "Destroy" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleAlly",
					TargetSubModifier = "CustomMod TrainCar",
					TargetSubModifierDescription = "an allied train car"
				}
			}
		},
		Bio = "\"You call this resisting arrest? We call this a difficulty tweak!\""
	},
	["The Employee's Hit"] = {
		Id = 75357641973897,
		Name = "The Employee's Hit",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 2 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Swap the stats of a target fighter. It loses 200 Power.\nGive yourself 2 Train Contractor cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap" },
						{ "Weaken", 200 },
						{
							"RepeatingRandomAdd",
							{ "TrainContractor", 2 },
							"Ally"
						}
					},
					Target = "Single"
				}
			}
		},
		Bio = "A single bullet artfully placed is the only difference between a payday and a mayday."
	},
	["The Instructor's Training"] = {
		Id = 112246509041074,
		Name = "The Instructor's Training",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 2 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Give yourself 2 Train Contractor cards.\nAll gear in your hand gain +100/+100 Stat Bonus.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingRandomAdd",
							{ "TrainContractor", 2 }
						},
						{ "TargetAddStrengthenBonus", 100, "CustomTarget" },
						{ "TargetAddHealthBonus", 100, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Gear"
					}
				}
			}
		},
		Bio = "\"You've got potential, kid. Let's unlock it.\""
	},
	["Vanessa's Reassignment"] = {
		Id = 99848917405480,
		Name = "Vanessa's Reassignment",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Blue = 2 },
		Fading = true,
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		CustomReminderRecur = true,
		Effect = {
			Description = "Recur 2 allied Dubious fighter cards.\nRecur 2 allied Train Contractors.\nRemove {W}{B}{Y} from their cost and they become inert in all zones.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Dubious_Fighter", "GraveZone_Ally", "Hand_Ally", true, false, 2 },
							"Self"
						},
						{
							"MoveZone",
							{ "TrainContractor", "GraveZone_Ally", "Hand_Ally", true, false, 2 },
							"Self"
						}
					},
					Target = "Ally",
					MetaData = {
						AddCost = { Neutral = -1, Yellow = -1, Blue = -1 },
						TokenOmni = true
					}
				}
			}
		},
		Bio = "<br/>\"Change of plans, Contractors. New orders just came in.\""
	},
	["The Capos"] = {
		Id = 86565436867509,
		Name = "The Capos",
		AltCards = {
			["The Capos-Offer"] = {
				Id = 131438382084549,
				Name = "The Forest Trio",
				AttackEffect = "Jab",
				Effect = {
					Description = "Whenever this card attacks: A target enemy fighter loses 100 Power. Give yourself 2 Train Contractors.",
					Ability = {
						OnAttack = {
							Power = {
								{ "Weaken", 100 },
								{
									"RepeatingRandomAdd",
									{
										{ "Medic-OfferToken", "Psycho-OfferToken", "Gunslinger-OfferToken" },
										2
									},
									"Ally"
								}
							},
							Target = "SingleEnemy"
						}
					}
				},
				Bio = "\"Alright bud, you aren't going any further!\""
			}
		},
		Health = 900,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 4 },
		Charge = true,
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Whenever this card attacks: A target enemy fighter loses 100 Power. Give yourself 2 Train Contractors.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Weaken", 100 },
						{
							"RepeatingRandomAdd",
							{ "TrainContractor", 2 },
							"Ally"
						}
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "The elites of D.T.T. have never known failure."
	},
	["End of the Line"] = {
		Id = 102166989399593,
		Name = "End of the Line",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 3, Neutral = 2, Yellow = 1 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Destroy a target allied Train Car. If you do, put 2 target enemy fighters on top of their deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{ "Destroy" },
						{ "EVGreaterValueCheck", 0, "Self" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleAlly",
					TargetSubModifier = "CustomModAlly TrainCar",
					TargetSubModifierDescription = "an allied train car"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Obliterate" },
						{ "DeckAdd", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						}
					},
					Target = "SingleEnemy",
					EffectRequirement = { "Board", "Opponent", 1, 9999 },
					NoBlip = true
				}
			},
			EffectDeckAddToTop = true
		},
		Bio = "\"Now that's what I call a mis<i>carriage</i> of justice!\""
	},
	["The Boss's Orders"] = {
		Id = 109330401243656,
		Name = "The Boss's Orders",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 2 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "Return a target fighter that costs 2 or fewer total studs and all terrains to their hands.\n Give yourself 2 Train Contractor cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return", 30, "AllyTerrain" },
						{ "Return", 30, "EnemyTerrain" },
						{ "EVExactValueCheck", 0, "Self" },
						{
							"RepeatingRandomAdd",
							{ "TrainContractor", 2 },
							"Ally"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Archetype = "Dubious" },
						SelectionDescription = "a Dubious card in your deck to search",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = { { "Return" } },
					Target = "Single",
					TargetSubModifier = "CustomMod 2OrLower",
					TargetSubModifierDescription = "a fighter that costs 2 or fewer total studs."
				}
			}
		},
		Bio = "\"His real name unknown, his presence everywhere, his orders final.\""
	},
	["Vanessa Eleniore"] = {
		Id = 70516629102079,
		Name = "Vanessa Eleniore",
		AltCards = {
			["Vanessa Eleniore-Offer"] = {
				Id = 80600248219757,
				Name = "The Bandit Queen",
				ArtAnimation = "BanditQueen",
				AttackEffect = "Jab",
				Effect = {
					Description = "At the start of your turns or when this fighter attacks: Obliterate 2 Train Contractor cards in your graveyard. If you do, Unleash the train and unlock it.",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GraveZone_Ally", "TrainContractor", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 1, "TrainContractors" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnAttack = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GraveZone_Ally", "TrainContractor", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 1, "TrainContractors" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassTrainContractors = {
							Power = {
								{
									"MoveZone",
									{ "Gear", "GraveZone_Ally", "Nil", true, false, 3 },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Field_Ally", "TrainCar", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 2, "HasTrain" }
								},
								{ "Unlock", 9999, "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "Archetype",
								Modifier = "TrainCar",
								SubModifier = true
							}
						},
						OnEVCheckPassHasTrain = {
							Power = {
								{ "Strengthen", 200 },
								{ "Heal", 200 }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "Archetype",
								Modifier = "TrainCar",
								SubModifier = true
							}
						},
						OnEVCheckFailHasTrain = {
							Power = {
								{
									"EVGreaterValueCheck",
									{ -1, "Back" }
								},
								{
									"EVGreaterValueCheck",
									{ -1, "Centre" }
								},
								{
									"EVGreaterValueCheck",
									{ -1, "Front" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassBack = {
							Power = { { "Summon", "TrainBack-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainBack" }
						},
						OnEVCheckPassCentre = {
							Power = { { "Summon", "TrainMid-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainMid" }
						},
						OnEVCheckPassFront = {
							Power = { { "Summon", "TrainFront-OfferToken" } },
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainFront" }
						}
					}
				},
				Bio = "<br/>\"YOU'RE GOIN' DOWN, COAL-SNIFFERS!!\""
			}
		},
		Health = 1000,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 7, Yellow = 2 },
		Archetype = "Dubious",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		CustomReminder = {
			["The Train"] = "A 600/0, 1000/0, and 1400/0 line of fighters. Defend the Train to search for Dubious cards; You lose 2100 life if you fail. If there's already an allied Train, they all gain 200 Health and Power instead."
		},
		Effect = {
			Description = "At the start of your turns or when this fighter attacks: Obliterate 2 Train Contractor cards in your graveyard. If you do, Unleash the train and unlock it.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "TrainContractor", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 1, "TrainContractors" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "TrainContractor", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 1, "TrainContractors" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassTrainContractors = {
					Power = {
						{
							"MoveZone",
							{ "Gear", "GraveZone_Ally", "Nil", true, false, 3 },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "TrainCar", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 2, "HasTrain" }
						},
						{ "Unlock", 9999, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "TrainCar",
						SubModifier = true
					}
				},
				OnEVCheckPassHasTrain = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "TrainCar",
						SubModifier = true
					}
				},
				OnEVCheckFailHasTrain = {
					Power = {
						{
							"EVGreaterValueCheck",
							{ -1, "Back" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Centre" }
						},
						{
							"EVGreaterValueCheck",
							{ -1, "Front" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassBack = {
					Power = { { "Summon", "TrainBack" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainBack" }
				},
				OnEVCheckPassCentre = {
					Power = { { "Summon", "TrainMid" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainMid" }
				},
				OnEVCheckPassFront = {
					Power = { { "Summon", "TrainFront" } },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_TrainFront" }
				}
			}
		},
		Bio = "Second in command, and for good reason."
	},
	TrainBack = {
		Id = 104869614678346,
		Name = "Train Back",
		AltCards = {
			["TrainBack-OfferToken"] = {
				Id = 79042919781105,
				Name = "Original Back",
				AttackEffect = "Jab",
				Bio = "DEFEND"
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Blue = 4, Yellow = 1 },
		Token = true,
		NoFieldMovement = true,
		CustomReminder = {
			Hypercard = "Hypercards such as Train Cars do not change positions on the board from combat."
		},
		Archetype = "TrainCar",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "When this card dies: Move all gear on it to the centre of the train. You lose 700 life.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"MoveGear",
							{ "Self", "All" },
							"CustomTarget"
						},
						{ "Cost", 700, "Ally" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "CardSideFirstArchetype",
						Modifier = "Right",
						SubModifier = "TrainCar"
					},
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "DEFEND"
	},
	TrainMid = {
		Id = 102539813015922,
		Name = "Train Centre",
		AltCards = {
			["TrainMid-OfferToken"] = {
				Id = 131877624534568,
				Name = "Original Middle",
				AttackEffect = "Jab",
				Bio = "THE"
			}
		},
		Health = 900,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Blue = 4, Yellow = 1 },
		Token = true,
		NoFieldMovement = true,
		CustomReminder = {
			Hypercard = "Hypercards such as Train Cars do not change positions on the board from combat."
		},
		Archetype = "TrainCar",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "When this card dies: Obliterate all allied Train Cars left of this. Move all gear on this card to the front. You lose 700 life.",
			Ability = {
				OnDeath = {
					Power = {
						{ "EVExactValueCheck", 0, "Self" },
						{
							"MoveGear",
							{ "Self", "All" },
							"CustomTarget"
						},
						{ "Cost", 700, "Ally" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "CardSideFirstArchetype",
						Modifier = "Right",
						SubModifier = "TrainCar"
					},
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPass = {
					Power = { { "Obliterate" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = { "Archetype", "CardSide" },
						Modifier = { Archetype = "TrainCar", CardSide = "Left" },
						SubModifier = true
					},
					NoBlip = true
				}
			}
		},
		Bio = "THE"
	},
	TrainFront = {
		Id = 122701232933016,
		Name = "Train Front",
		AltCards = {
			["TrainFront-OfferToken"] = {
				Id = 123519077411281,
				Name = "Original Front",
				AttackEffect = "Jab",
				Bio = "TRAIN"
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Blue = 4, Yellow = 1 },
		Token = true,
		NoFieldMovement = true,
		CustomReminder = {
			Hypercard = "Hypercards such as Train Cars do not change positions on the board from combat."
		},
		Archetype = "TrainCar",
		PackDisplayOverride = "Metaverse Series: Defend The Train",
		Effect = {
			Description = "During your end step: Search your deck for a Dubious card, or 2 if there's 3 allied attached Train Cars.\nWhen this card dies: Obliterate all allied Train Cars. You lose 700 life.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Obliterate" },
						{ "Cost", 700, "Ally" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = { "Archetype" },
						Modifier = { Archetype = "TrainCar" },
						SubModifier = true
					}
				},
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomTarget"
						},
						{ "RandomTutorfor", "Dubious" },
						{ "EVGreaterValueCheck", 2, "Self" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = { "Archetype", "HasGear" },
						Modifier = { Archetype = "TrainCar", HasGear = true },
						SubModifier = true
					}
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Dubious" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "TRAIN"
	},
	Medic = {
		Id = 129915999090359,
		Name = "Medic",
		AltCards = {
			["Medic-OfferToken"] = {
				Id = 138788142716432,
				Name = "New Hire Medic",
				AttackEffect = "Jab",
				Bio = "After countless dead-end jobs, this was the one meant for him."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Archetype = "TrainContractor",
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step: This fighter gains 100 Health.",
			Ability = {
				OnEnd = {
					Power = { { "Heal", 100, "Self" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "He couldn't go back to practice after his first contract; Heart surgery in the middle of combat was just too damn thrilling."
	},
	Gunslinger = {
		Id = 110486412421157,
		Name = "Gunslinger",
		AltCards = {
			["Gunslinger-OfferToken"] = {
				Id = 75356578635090,
				Name = "New Hire Gunslinger",
				AttackEffect = "Jab",
				Bio = "This wasn't his first job, and it wouldn't be his last."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 150,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Archetype = "TrainContractor",
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Nil = {
					Power = { { "GivePassive", "Shield" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"It's not a war crime, it's extrajudicial violence.\""
	},
	Psycho = {
		Id = 91470355985938,
		Name = "Psycho",
		AltCards = {
			["Psycho-OfferToken"] = {
				Id = 102877988798999,
				Name = "New Hire Psycho",
				AttackEffect = "Jab",
				Bio = "Even the brightest minds have a breaking point."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		GrantsPassive = "Shield",
		Archetype = "TrainContractor",
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever an enemy effect targets this card: Deal 100 damage to all enemy fighters.",
			Ability = {
				OnTargetByEnemy = {
					Power = { { "Damage", 100 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "At first glance, he looks like your usual stupid maniac with a shotgun.\nAt second glance, he's actually a smart maniac with a shotgun."
	},
	Conehead = {
		Id = 102112403481814,
		Name = "Conehead",
		AltCards = {
			DeivyDoesTutorials33 = {
				Id = 120770180276922,
				Name = "DeivyDoesTutorials33",
				PackDisplayOverride = "World Tower Defense Crossover Badge",
				AttackEffect = "Inferno",
				Bio = "\"this upgrade description is so weird\""
			}
		},
		Health = 1600,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "XhartyrSlash",
		Color = "Yellow",
		PackDisplayOverride = "Hallow's Bargains Shop",
		Overload = true,
		Cost = { Neutral = 4, Yellow = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Destructive Power",
			Description = "Whenever this card attacks: Destroy all gear on all fighters and terrains. Deal overloaded damage to a target enemy fighter equal to 100 times the number of gears destroyed this way.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"AllyTerrain"
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"EnemyTerrain"
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"All"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "DestroyGear", "All", "All" },
						{ "DestroyGear", "All", "AllyTerrain" },
						{ "DestroyGear", "All", "EnemyTerrain" },
						{ "DamageOverloaded", "Variable", "SingleEnemy" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	["Shikisai Denki"] = {
		Id = 88739797571791,
		Name = "Shikisai Denki",
		AltCards = {
			["Shikisai Denki-Offer"] = {
				Id = 101886475480001,
				Name = "シキサイデンキ",
				Bio = "いろんな色を知りたいな",
				Addant = "Kodomo-Offer"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Storm",
		PackDisplayOverride = "Cross-World Series: Color & Electricity",
		Color = "Blue",
		CustomReminder = {
			Kodomo = "A {W} 50/0 Yellow Token Fighter. At the start of your turns: Your opponent loses 50 Life and you gain 50 Life. When Kodomo dies, if you control 'Shikisai Denki': It transforms into 'Tsuyoko Akaku'.",
			["Tsuyoko Akaku"] = "A {W}{W}{B}{B}{G} 700/400 Blue Token Fighter. Whenever you gain life: This card gains 200 Health and Power."
		},
		Addant = "Kodomo",
		Cost = { Neutral = 2, Blue = 2, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Summoner",
			Description = "Whenever you cast a Green card: Give yourself a Kodomo.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					Color = "Green"
				}
			}
		},
		Bio = ""
	},
	["Tsuyoko Akaku"] = {
		Id = 92429359322344,
		Name = "Tsuyoko Akaku",
		AltCards = {
			["Tsuyoko Akaku-Offer"] = {
				Id = 83520899579366,
				Name = "ツヨコアカク",
				Bio = "赤く染まって　消えないよ"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "StalkerScratch",
		Color = "Blue",
		EffectAnimation = "PowerUpSelfRed",
		PackDisplayOverride = "Cross-World Series: Color & Electricity",
		Cost = { Neutral = 2, Blue = 2, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Power Up!",
			Description = "Whenever you gain life: This card gains 200 health and power.",
			Ability = {
				OnLifeGain = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	Kodomo = {
		Id = 107313656979889,
		Name = "Kodomo",
		AltCards = {
			["Kodomo-Offer"] = {
				Id = 96327284750355,
				Name = "コドモ",
				Bio = "黄色の雨具を羽織ってる",
				Transformant = "Tsuyoko Akaku-Offer"
			}
		},
		Health = 50,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		PackDisplayOverride = "Cross-World Series: Color & Electricity",
		TokenOmni = true,
		Cost = { Neutral = 1 },
		Transformant = "Tsuyoko Akaku",
		EffectVariable = 0,
		Effect = {
			Name = "Summoner",
			Description = "At the start of your turns: Your opponent loses 50 life and you gain 50 life.\nWhen this card dies, if you control 'Shikisai Denki': It transforms into Tsuyoko Akaku.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Inflict", 50, "Opponent" },
						{ "Cost", -50 }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"Transform",
							"Transformant",
							"CustomTarget",
							nil,
							nil,
							nil,
							"Poof"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "MatchesParameter",
						Modifier = "Shikisai Denki",
						SubModifier = true
					},
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_Shikisai Denki" },
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["Bowl of Wrath"] = {
		Id = 133072367279164,
		Name = "Bowl of Wrath",
		AltCards = {
			["Bowl of Wrath-Offer"] = {
				Id = 85992466261102,
				Name = "Bowl of WRATH",
				AttackEffect = "Jab",
				Bio = "Its rage boiled enough to manifest into arms."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Bowl",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		CustomReminderInject = true,
		Cost = { Red = 1, Blue = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "You may baseplate an additional 3 cards this turn. Inject 2 non-token actions that cost 4 or less total studs from your graveyard that have been cast this game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DiscardLimit", 3, "Ally" },
						{
							"MoveZone",
							{
								"NotToken_Action_4OrLower_WasPlayed",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false
							}
						},
						{
							"MoveZone",
							{
								"NotToken_Action_4OrLower_WasPlayed",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false
							}
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "<br/>The \"Bowl of Wrath\" never gutters... It rolls, it strikes, and it demands the same answer. Those who hear its call know what comes next...<br/><br/><b>!!!</b><br/>- Artifact Antiquarian"
	},
	["Bowl of Sloth"] = {
		Id = 125255622741876,
		Name = "Bowl of Sloth",
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Gear = true,
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Archetype = "Bowl",
		Cost = { Neutral = 1, Blue = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Recur 2 allied cards with 3 or 4 colours in their cost, except they're fading.",
			Ability = {
				OnDeath = {
					Power = { {
						"MoveZone",
						{
							"GreaterTotalCostChromaticOr2",
							"GraveZone_Ally",
							"Hand_Ally",
							true,
							false,
							2
						},
						"Self"
					} },
					Target = "Self",
					NoBlip = true,
					MetaData = { Fading = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "<br/>Any effort this artifact makes is dimmed by its reluctance to act... The \"Bowl of Sloth\".<br/><br/><b>Even momentum grows tired...</b><br/>- Artifact Antiquarian"
	},
	["Bowl of Pride"] = {
		Id = 134658956194962,
		Name = "Bowl of Pride",
		AltCards = {
			["Bowl of Pride-Offer"] = {
				Id = 90541419959581,
				Name = "The Bowl Of Observation",
				AttackEffect = "Jab",
				Bio = "‼️‼️⭕ CARD ALERT ⭕‼️‼️"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Bowl",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Cost = { Blue = 1, Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Seance 4 cards from your graveyard that were cast this game.\nDraw X cards. X is the number of colours among all allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "200OrLower_WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "200OrLower_WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "200OrLower_WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "200OrLower_WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Chromatic", "nil" }
						},
						{ "Draw", "Variable", "Ally" }
					},
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "<br/>Efforts to see imperfections in the artifact are fruitless... The \"Bowl of Pride\".<br/><br/><b>I don’t know how long this Game will last...</b><br/>- Artifact Antiquarian"
	},
	["Fragment of Greed"] = {
		Id = 105377471661412,
		Name = "Fragment of Greed",
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Archetype = "Bowl",
		Cost = { Red = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "When this card is cast: A target enemy fighter loses 300 power.\nWhen this card dies: Draw a card.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 300, "SingleEnemy" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "<br/>The spirits rarely know when to stop.<br/><b>\"And that includes losing...\"</b><br/>- Artifact Antiquarian"
	},
	["Spirit of the Bowl of Greed"] = {
		Id = 78728279952370,
		Name = "Spirit of the Bowl of Greed",
		AltCards = {
			["Spirit of the Bowl of Greed-Offer"] = {
				Id = 130565038265905,
				Name = "Greed",
				AttackEffect = "Jab",
				Bio = "\"You percieve my intent as greed only because you do not have the wealth which I aim for.\""
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		SummonAnimation = "BowlSummon",
		EffectAnimation = "SelfScorch",
		DeathAnimation = "BowlDeath",
		SearchTerms = { "Spirit", "Spirit of the Bowl", "Bowl of Greed" },
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Archetype = "Bowl",
		Cost = { Neutral = 2, Red = 2, Blue = 1, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Whenever you cast a nonfighter card: This card gains 100 Health and Power.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Self"
				},
				OnAllyTerrainCast = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Self"
				},
				OnAllyCastGear = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<br/>Each spirit resonates in their respective Bowls, but Greed went for the preemptive attack against me.<br/><br/><b>They yet realized about my competitive prowess...</b><br/>- Artifact Antiquarian"
	},
	["Bowl of Gluttony"] = {
		Id = 120232522970073,
		Name = "Bowl of Gluttony",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Archetype = "Bowl",
		Cost = { Neutral = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Destroy a target fighter if it has 750 or more Power.\nDraw a fleeting card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CheckPower",
							{ 750, 9999999999999 }
						},
						{ "FleetingDraw", 1, "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "<br/>Enough food to feed entire planets, but it leaves a diminishing flavour. The \"Bowl of Gluttony\".<br/><br/><b>It never leaves the lane unsatisfied...</b><br/>- Artifact Antiquarian"
	},
	["Bowl of Envy"] = {
		Id = 110031388176282,
		Name = "Bowl of Envy",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Archetype = "Bowl",
		Cost = { Red = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "You lose 500 life. Search your deck for a Red and Yellow card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Cost", 500, "Ally" },
						{ "RandomTutorfor", "Red" },
						{ "RandomTutorfor", "Yellow" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "<br/>Grows restless when in proximinity to other Bowls. The \"Bowl of Envy\".<br/><br/><b>It prefers to be the only one in the lane...</b><br/>- Artifact Antiquarian"
	},
	["Bowl of Desire"] = {
		Id = 117865269893331,
		Name = "Bowl of Desire",
		AltCards = {
			["Bowl of Desire-Offer"] = { Id = 107365315880258, Name = "Bowl of Desire", AttackEffect = "Jab" }
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 200,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		Color = "Green",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Gear = true,
		Archetype = "Bowl",
		Cost = { Red = 2, Green = 1, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Give yourself a Red, Green, and Yellow copy of it. They're inert when discarded.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"EVExactValueCheck",
							{ 0, "AddRed" }
						},
						{
							"EVExactValueCheck",
							{ 0, "AddGreen" }
						},
						{
							"EVExactValueCheck",
							{ 0, "AddYellow" }
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassAddRed = {
					Power = { { "AddCopy", 30, "Self" } },
					Target = "Self",
					MetaData = { Color = "Red", TokenDiscard = true },
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassAddGreen = {
					Power = { { "AddCopy", 30, "Self" } },
					Target = "Self",
					MetaData = { Color = "Green", TokenDiscard = true },
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassAddYellow = {
					Power = { { "AddCopy", 30, "Self" } },
					Target = "Self",
					MetaData = { Color = "Yellow", TokenDiscard = true },
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "<br/>The \"Bowl of Desire\" glimmers with the hopes and dreams of those who gaze upon it.<br/><br/><b>It desires to win at any cost...</b><br/>- Artifact Antiquarian"
	},
	["Artifact Antiquarian"] = {
		Id = 71207045268172,
		Name = "Artifact Antiquarian",
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "XhartyrSlash",
		DeathAnimation = "KorbloxDeath",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Antiquities",
		AltCards = {
			["Artifact Antiquarian-Offer"] = {
				Id = 100796800052897,
				Name = "Artifact Antiquarian",
				ArtAnimation = "AntiquarianAnimation",
				Commissioner = { "68347499" },
				AttackEffect = "XhartyrSlash",
				Bio = "<br/><b>\"Fall...\"</b><br/>"
			}
		},
		Overload = true,
		Archetype = "Bowl",
		Cost = { Neutral = 3, Red = 2, Green = 2, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling",
			Description = "Whenever you cast another Bowl: Destroy a target enemy fighter.",
			Ability = {
				["OnAny|Other|AllyCast"] = {
					Power = { { "Destroy", 30, "SingleEnemy" } },
					Target = "Self",
					Archetype = "Bowl"
				},
				OnTerrainCast = {
					Power = { { "Destroy", 30, "SingleEnemy" } },
					Target = "Self",
					Archetype = "Bowl"
				}
			}
		},
		Bio = "<br/><b>\"It is a good thing that each deadly sin is materialized in their own unique Bowl...\"</b><br/><br/><b>\"But, every vice deserves a spare...\"</b><br/>"
	},
	["Bowl Display Case"] = {
		Id = 100489334141357,
		Name = "Bowl Display Case",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "StudBlast",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		PackDisplayOverride = "Metaverse Series: Antiquities",
		Terrain = true,
		Archetype = "Bowl",
		Terrariant = "Rediscovery of Bowls",
		ForceTerrarianStatline = { 600, 500 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select a Bowl card in your deck and search it.\nDuring your end step, if there's 2 or more differently named Bowls in your graveyard: Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Archetype = "Bowl" },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a Bowl card to search"
					}
				},
				OnEnd = {
					Power = { { "Add", "Nascent Stud" } },
					Target = "Ally",
					EffectRequirement = { "MembersInArchetype", "AllyGraveZone", 2, 99999, "Bowl" },
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "<br/><b>\"Please don't touch the Bowls...\"</b>"
	},
	["Rediscovery of Bowls"] = {
		Id = 92700604327338,
		Name = "Rediscovery of Bowls",
		Health = 600,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Bowling!",
			Description = "Once each turn, whenever you cast a Bowl: Remove {R}{G}{B}{Y} from all Bowl cards in your hand.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "Nil" },
							"CustomTarget"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Archetype",
						Modifier = "Bowl",
						SubModifier = true
					},
					TurnTriggerLimit = 1,
					Archetype = "Bowl",
					NoBlip = true
				}
			}
		},
		Bio = "<br/>The Javionese police believed these priceless artifacts were stolen by local rebels.<br/><br/>Instead, these Bowls had rematerialized from a selection of elite, corrupt candidates residing in Javion on permanent holiday.<br/><br/><b>The Game restarts, but I'll always win...</b><br/>- Artifact Antiquarian"
	}
}
