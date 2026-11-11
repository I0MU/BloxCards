



return {
	["Phlogiston Barrel"] = {
		Id = 9159898412,
		Name = "Phlogiston Barrel",
		Health = 50,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Blue",
		Cost = { Yellow = 3 },
		AttackEffect = "British",
		Effect = {
			Description = "When this card is cast: A target fighter gains 200 Power.\nOnce each turn, whenever this card takes noncombat damage: Deal 200 damage to all fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 200 } },
					Target = "Single"
				},
				OnEffectDamage = {
					Power = { { "Damage", 200 } },
					Target = "All",
					TotalTriggerLimit = 1
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Pursuivant"
	},
	["The Heights Reclaimed"] = {
		Id = 125883488728274,
		Name = "The Heights Reclaimed",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 2, Blue = 2 },
		AttackEffect = "British",
		Terrain = true,
		Summonant = "Peasant",
		CustomReminder = { MYRNOTE = "Not for DWA1; Added Early for Completeness' Sake" },
		Effect = {
			CastOnOpponent = true,
			Description = "Your opponent casts this terrain.\nWhen this card is cast: Your opponent summons a 900/200 Coo and a 100/1000 Peasant.\nAt the start of your turns: All enemy Colourless fighters gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Cow" }
					},
					Target = "Opponent"
				},
				OnAllyDeath = {
					Power = {
						{ "Cost", 300 },
						{ "Neutral", 1 }
					},
					Target = "Ally",
					Color = "Neutral"
				}
			}
		},
		Bio = ""
	},
	["Herald of Court Susminstre"] = {
		Id = 15278262411,
		Name = "Herald of Court Susminstre",
		Health = 800,
		Power = 200,
		Rarity = "Common",
		Color = "Green",
		Cost = { Green = 2 },
		TriggerInGenZone = true,
		AttackEffect = "British",
		Effect = {
			Description = "When this card is cast or put into baseplate: Select Green, Blue, or Yellow. This card becomes that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInGenZone = true
				},
				OnAnyTrigger = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInField = true,
					TotalTriggerLimit = 1
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Pursuivant"
	},
	["Herald of Court Eastminstre"] = {
		Id = 15080142612,
		Name = "DWEX Herald of Court Eastminstre",
		Health = 800,
		Power = 200,
		Rarity = "Common",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		TriggerInGenZone = true,
		CustomReminder = { MYRNOTE = "Not for DWA1; Added Early for Completeness' Sake" },
		PlayTest = true,
		AttackEffect = "British",
		Effect = {
			Description = "When this card is cast or put into baseplate: Select Red, Green, or Yellow. This card becomes that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Red Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInGenZone = true
				},
				OnAnyTrigger = {
					Power = {
						{
							"CreateChoices",
							{ "Red Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInField = true,
					TotalTriggerLimit = 1
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Pursuivant"
	},
	["Herald of Court Westminster"] = {
		Id = 18623540117,
		Name = "DWEX Herald of Court Westminster",
		Health = 800,
		Power = 200,
		Rarity = "Common",
		Color = "Blue",
		Cost = { Blue = 2 },
		TriggerInGenZone = true,
		CustomReminder = { MYRNOTE = "Not for DWA1; Added Early for Completeness' Sake" },
		PlayTest = true,
		AttackEffect = "British",
		Effect = {
			Description = "When this card is cast or put into baseplate: Select Red, Green, or Blue. This card becomes that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Red Stud", "Green Stud", "Blue Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInGenZone = true
				},
				OnAnyTrigger = {
					Power = {
						{
							"CreateChoices",
							{ "Red Stud", "Green Stud", "Blue Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "ReplaceColor", "Variable" }
					},
					Target = "Self",
					DontTriggerInField = true,
					TotalTriggerLimit = 1
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "Pursuivant"
	},
	["The Stunderworld"] = {
		Id = 77008530978740,
		Name = "DWEX The Stunderworld",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Color = "Blue",
		Cost = { Blue = 3 },
		Terrain = true,
		CustomReminderDebt = true,
		CustomReminder = { MYRNOTE = "Not for DWA1; Added Early for Completeness' Sake" },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: You gain 3 Debt. Swap the stats of all fighters.",
			Type = "OnEnd",
			Power = {
				{ "Debt", 3 },
				{ "Swap", 10000, "All" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["The Funderworld"] = {
		Id = 8564507551,
		Name = "DWEX The Funderworld",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Terrain = true,
		CustomReminderDebt = true,
		CustomReminder = { MYRNOTE = "Not for DWA1; Added Early for Completeness' Sake" },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: You gain 3 Debt. Shuffle your hand into your deck, then draw 2 cards.",
			Type = "OnEnd",
			Power = {
				{ "Debt", 3 },
				{
					"MoveZone",
					{ "All", "Hand_Ally", "Deck_Ally", true, false, 10 },
					"Self"
				},
				{ "Draw", 2 }
			},
			Target = "Ally"
		},
		Bio = "Hell is an eternity with your friends."
	},
	["TestCard Give Stud Debt"] = {
		Id = 93841996049087,
		Name = "TestCard Give Stud Debt",
		PlayTest = true,
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		CustomReminderDebt = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "You gain 2 Debt.",
			Type = "OnSummon",
			Power = { { "Debt", 2 } },
			Target = "Ally"
		},
		Bio = ""
	},
	["TestCard Give Enemy Stud Debt"] = {
		Id = 93841996049087,
		Name = "TestCard Give Enemy Stud Debt",
		PlayTest = true,
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gust",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		CustomReminderDebt = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "You gain 2 Debt.",
			Type = "OnSummon",
			Power = { { "Debt", 2 } },
			Target = "Opponent"
		},
		Bio = ""
	},
	["Aethelward the Dragon"] = {
		Id = 15268728726,
		Name = "Aethelward the Dragon",
		SearchTerms = { "Æthelward", "Athelward", "Ethelward" },
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3, Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		CustomReminder = { MYRNOTE = "For act 3" },
		Effect = {
			Description = "When this card is cast: Select any number of allied fighters. Destroy them.\nWhenever an allied fighter dies: You lose 200 life. Draw a fleeting card.",
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
					Power = {
						{ "Cost", 200 },
						{ "FleetingDraw", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Cyrus Castor"] = {
		Id = 127349513246257,
		Name = "Cyrus Castor",
		Health = 1000,
		Power = 400,
		Rarity = "Legendary",
		Color = "Red",
		Cost = { Red = 9 },
		AttackEffect = "British",
		IsHenry = true,
		EffectVariable = 0,
		Charge = true,
		CustomReminder = {
			MYRNOTE = "Wives will gain/give health equal to damage dealt later.",
			["An Heir No Matter What"] = "The conditions are losing life, casting a non-doge, and her dying."
		},
		Effect = {
			Description = "When this card takes damage from anything: Summon a 500/500 Wife with a condition that restores the damaged health.",
			Ability = {
				OnDamaged = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "DivorcedWife1" }
						},
						{
							"EVExactValueCheck",
							{ 2, "BeheadedWife1" }
						},
						{
							"EVExactValueCheck",
							{ 3, "DeadWife" }
						},
						{
							"EVExactValueCheck",
							{ 4, "DivorcedWife2" }
						},
						{
							"EVExactValueCheck",
							{ 5, "BeheadedWife2" }
						},
						{
							"EVExactValueCheck",
							{ 6, "SurvivedWife" }
						},
						{
							"EVGreaterValueCheck",
							{ 6, "QuantumWife" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassDivorcedWife1 = {
					Power = { { "Summon", "DivorcedWife1" } },
					Target = "Ally"
				},
				OnEVCheckPassDivorcedWife2 = {
					Power = { { "Summon", "DivorcedWife2" } },
					Target = "Ally"
				},
				OnEVCheckPassBeheadedWife1 = {
					Power = { { "Summon", "BeheadedWife1" } },
					Target = "Ally"
				},
				OnEVCheckPassBeheadedWife2 = {
					Power = { { "Summon", "BeheadedWife2" } },
					Target = "Ally"
				},
				OnEVCheckPassDeadWife = {
					Power = { { "Summon", "DeadWife" } },
					Target = "Ally"
				},
				OnEVCheckPassSurvivedWife = {
					Power = { { "Summon", "SurvivedWife" } },
					Target = "Ally"
				},
				OnEVCheckPassQuantumWife = {
					Power = { { "Summon", "QuantumWife" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Beheaded Wife Container"] = {
		Id = 15268728726,
		Name = "Beheaded Wife Container",
		AltCards = {
			BeheadedWife1 = { Name = "Anne Boleyn", Id = 16962822795, Bio = "*-Jaws Theme Plays-*" },
			BeheadedWife2 = {
				Name = "Catherine Howard",
				Id = 15928860682,
				Bio = "*-Jaws Theme Plays-*"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Red",
		Cost = { Red = 8 },
		AttackEffect = "British",
		Effect = {
			Description = "Once, whenever you lose life: Cyrus gains 500 Health.",
			Ability = {
				OnLifeLoss = {
					Power = { { "Heal", 500 } },
					Target = "CustomTarget",
					TotalTriggerLimit = 1,
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "IsHenry"
					}
				}
			}
		},
		Bio = ""
	},
	["Divorced Wife Container"] = {
		Id = 15268728726,
		Name = "Divorced Wife Container",
		AltCards = {
			DivorcedWife1 = {
				Name = "Catherine of Aragon",
				Id = 16759177673,
				Bio = "*-Jaws Theme Plays-*"
			},
			DivorcedWife2 = {
				Name = "Anne of Cleves",
				Id = 12553789694,
				Bio = "*-Jaws Theme Plays-*"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Red",
		Cost = { Red = 8 },
		AttackEffect = "British",
		Effect = {
			Description = "Once, whenever you cast a non-Doge card: Cyrus gains 500 Health.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "Heal", 500 } },
					Target = "CustomTarget",
					NotArchetype = "Doge",
					TotalTriggerLimit = 1,
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "IsHenry"
					}
				}
			}
		},
		Bio = ""
	},
	DeadWife = {
		Id = 15928776913,
		Name = "Jane Seymour",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Red",
		Cost = { Red = 8 },
		AttackEffect = "British",
		Effect = {
			Description = "When this card dies: Cyrus gains 500 Health. Give yourself a red epic fighter card, except it's a doge.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Heal", 500 },
						{ "RandomAdd", "MonoOnlyorRedCost Epic Red Fighter" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "IsHenry"
					},
					MetaData = { Archetype = "Doge" }
				}
			}
		},
		Bio = ""
	},
	SurvivedWife = {
		Id = 12553854464,
		Name = "Catherine Parr",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Red",
		Cost = { Red = 8 },
		AttackEffect = "British",
		Effect = {
			Description = "When Cyrus dies: Your opponent loses 2000 life.",
			Ability = {
				OnAnyAllyDeath = {
					Power = { { "Inflict", 2000, "Opponent" } },
					HasPassive = "IsHenry",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "IsHenry"
					}
				}
			}
		},
		Bio = ""
	},
	QuantumWife = {
		Id = 11468753117,
		Name = "Forbidden History",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Neutral",
		Cost = { Red = 8 },
		AttackEffect = "British",
		Effect = {
			Description = "Ｉｔ ｗｏｕｌｄ ｈａｖｅ ｂｅｅｎ expedient ｆｏｒ ｈｉｓ ｒａｍｐａｇｅ ｔｏ ｃｏｎｔｉｎｕｅ． Ａ ｓｈａｍｅ ｔｈｅ pyre ｃｕｔ ｉｔ ｓｈｏｒｔ．",
			Ability = {
				Null = {
					Power = { { "Inflict", 2000, "Opponent" } },
					HasPassive = "IsHenry",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "IsHenry"
					}
				}
			}
		},
		Bio = ""
	},
	["Settler o' The Heights"] = {
		Id = 15956085258,
		Name = "Settler o' The Heights",
		Health = 200,
		Power = 400,
		Rarity = "Common",
		Color = "Red",
		Cost = { Neutral = 2 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "When this card is cast: You may baseplate an additional card this turn. You gain 5 Debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DiscardLimit", 1 },
						{ "Debt", 5 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Lowly Squire"] = {
		Id = 132888966,
		Name = "Lowly Squire",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		Color = "Red",
		Cost = { Red = 2 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "When this card is cast: Select a card in your deck with 3{R} in its cost. Search it, except it's inert when discarded. You gain 10 Debt.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Debt", 10 }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { MatchesParameter = "3OrExactOfStudOrRed" },
						SelectionDescription = "a card with 3 Red studs in its cost",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = ""
	},
	["Abbey Tyrant"] = {
		Id = 205412742,
		Name = "Abbey Tyrant",
		Health = 800,
		Power = 0,
		Rarity = "Common",
		Color = "Red",
		Cost = { Red = 3 },
		Overload = true,
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "This card's power is 100 times your debt.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "SetPower", "Variable" }
					},
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
		Bio = ""
	},
	["Spiteheart Cluster"] = {
		Id = 100823387364615,
		Name = "Spiteheart Cluster",
		Health = 1000,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Red = 3, Neutral = 4 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "Whenever this card attacks and destroys another: You gain 4 Debt. Unlock this card.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Debt", 4 },
						{ "Unlock", 999, "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Illicit Prorogator"] = {
		Id = 6222014585,
		Name = "Illicit Prorogator",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "When this card is cast: Select a card in your baseplate and destroy it. You gain 2 Debt.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Debt", 2 }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = {},
						SelectionDescription = "a card in your baseplate to destroy",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = ""
	},
	["Royal Torturer"] = {
		Id = 17072452951,
		Name = "Royal Torturer",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "When this card is cast: Each player gains 3 Debt.",
			Ability = {
				OnSummon = {
					Power = { { "Debt", 3 } },
					Target = "All"
				}
			}
		},
		Bio = ""
	},
	["Drakobloxxer Cavalry"] = {
		Id = 78595455106323,
		Name = "Drakobloxxer Cavalry",
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Red",
		Archetype = "Drakobloxxer",
		Cost = { Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		TriggerInGenZone = true,
		Effect = {
			Description = "Once each turn, whenever a card leaves your baseplate: You draw a card and lose 600 life. This ability also triggers in the baseplate.",
			Ability = {
				OnAllyGenZoneRemove = {
					Power = {
						{ "Draw", 1 },
						{ "Cost", 600 }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Sacrilege of the Monasteries"] = {
		Id = 202103048,
		Name = "Sacrilege of the Monasteries",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "Select a card in your baseplate and destroy it. You gain {W} equal to its {W} cost and 8 Debt.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Neutral", "Variable" },
						{ "Debt", 8 }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = {},
						SelectionDescription = "a card in your baseplate to destroy",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = ""
	},
	["High Treason"] = {
		Id = 106661163274360,
		Name = "High Treason",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "Deal 1300 damage to a target fighter.\nYou gain 13 debt.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 1300, "Single" },
						{ "Debt", 8 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["The Gunderworld"] = {
		Id = 12797740240,
		Name = "The Gunderworld",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gust",
		Color = "Red",
		Cost = { Red = 3 },
		Terrain = true,
		CustomReminderDebt = true,
		Effect = {
			Description = "At the start of your turns: You gain 3 Debt. Then if Stud Debt's obliterated your baseplate this game, summon an unranked Red fighter from your hand with 3 or less {R} in its cost.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Debt", 3 },
						{
							"AlterEV",
							{ "Set", "Playertable", "StudDebtObliteration", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{
							"Unranked Red 3OrLowerOfStudOrRed",
							"Hand_Ally",
							"Field_Ally",
							true,
							false
						},
						"Self"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Hell is the banal brutality we create."
	},
	["Margaret Castor"] = {
		Id = 673457175,
		Name = "Margaret Castor",
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 3 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		TriggerInGenZone = true,
		TriggerInGraveZone = true,
		Effect = {
			Description = "Whenever debt obliterates your baseplate: Summon this card from your graveyard or baseplate.",
			Ability = {
				OnAllyDebtObliterate = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						}
					},
					Target = "Ally",
					DontTriggerInField = true
				}
			}
		},
		Bio = ""
	},
	["The Phlogiston Plot"] = {
		Id = 12493070738,
		Name = "The Phlogiston Plot",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Red",
		Cost = { Red = 3, Neutral = 12 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Board", "AllyGenZone", 0, 2 },
		AttackEffect = "British",
		GenZoneAddant = "Mark Stud",
		Effect = {
			Description = "Cast this card ignoring its {W} cost if there's 0 or 1 cards in your baseplate.\nDestroy all cards in hands, baseplates, and terrains. You can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyTerrain" },
						{ "RandomDiscard", 10 },
						{
							"GenZoneDiscard",
							{ "Red", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Green", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Blue", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Yellow", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						},
						{
							"SetCastRestriction",
							{
								{ "NOTHING" },
								"You can't cast anything else this turn."
							},
							"Ally"
						}
					},
					Target = "All"
				}
			}
		},
		Bio = ""
	}
}
