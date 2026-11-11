



return {
	["tHE uNSPEAKABLE oNE"] = {
		Id = 78890292462300,
		Name = "tHE uNSPEAKABLE oNE",
		Health = 9,
		Power = 9,
		Rarity = "Token",
		AttackEffect = "TelamonSummon",
		Color = "Red",
		Cost = { Neutral = 9, Red = 99 },
		EffectVariable = 0,
		PlayTest = true,
		Rank = 99,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "VengefulBless", "Opponent" } },
					Target = "Opponent",
					MetaData = {
						SlotTargets = {
							0,
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							9
						}
					}
				}
			}
		},
		Bio = ""
	},
	["Junior Permit"] = {
		Id = 135228011061346,
		Name = "Junior Permit",
		AltCards = {
			LOOKATCURREN = {
				Id = 109872952162932,
				Name = "#LOOKATCURREN!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 604,
				Bio = "Now that I've won Krytzen's BC Battles, I've finally gotten my Triple Tiara! This next one's for you, Trainer! Look at Curren a whooole bunch more... #CurrenLuvsCorgi #GreenIsBest #CuteButCrazy #Probably"
			},
			["Claw Machine"] = {
				Id = 92962266869005,
				Name = "Claw Machine",
				AttackEffect = "Jab",
				Bio = "I’m not the only one who confuses these for vending machines? Right?"
			}
		},
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Gear = true,
		IsNPECard = true,
		Untradeable = true,
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 200,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Search your deck for 2 fighter cards.",
			Ability = {
				OnDeath = {
					Power = {
						{ "RandomTutorfor", "Fighter" },
						{ "RandomTutorfor", "Fighter" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Better not lose it!"
	},
	["Beary Deadly Teddy"] = {
		Id = 107164395798582,
		Name = "Beary Deadly Teddy",
		Health = 1400,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3, Yellow = 3 },
		EffectVariable = 0,
		PlayTest = true,
		Overload = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When a fighter dies, attach a +0/+150 gear to this card. Then, once, if this fighter has 1000 or more power, unlock it. It gains 250 power.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{ "EquipGear", "Stuffing of Nails" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 999 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Unlock", 999 },
						{ "Strengthen", "250" }
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "RAAAAAAAAAAAUGHGHHHHHHHHHHHHHH"
	},
	["Stuffing of Nails"] = {
		Id = 76683563086969,
		Name = "Stuffing of Nails",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 150,
		PlayTest = true,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "",
			Ability = {}
		},
		Bio = "Gone are the days where cotton is soft and fluffy."
	},
	["Anaglyph Magician"] = {
		Id = 119882698404007,
		Name = "Anaglyph Magician",
		Health = 1200,
		Power = 1200,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5, Blue = 3 },
		EffectVariable = 0,
		PlayTest = true,
		Rank = 7,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever you cast another card of a type not attached to this card: Attach a copy of it to this card. Then if there's 4 or more card types among gears attached to it, divide it into 2 smaller copies of itself.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "Card" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "EquippedActionCount", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "Action" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyCastGear = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "Card" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "EquippedSpecificGearCount", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "Action" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "Card" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "EquippedTerrainCount", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "Action" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "Card" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "EquippedFighterCount", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "Action" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassAction = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "Card" },
							"Self"
						},
						{ "EquipGear", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedCardType", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 3, "Check" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassCheck = {
					Power = { { "SummonSplit", 2, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "(temp art) Anaglyph Magicians practice their power in the middle of busy streets. To the naked eye, they just look like crazy people."
	},
	["The Sower and The Reaper"] = {
		Id = 10809068459,
		Name = "The Sower and The Reaper",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4, Red = 4 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Attach The Sower, a gear that creates terrains, to a target fighter.\nAttach The Reaper, a gear that destroys terrains, to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "The Sower-Gear", "Single" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "The Reaper-Gear", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "One with the power to create, one to destroy. The wielder of these artifacts are destined for greatness."
	},
	["The Sower-Gear"] = {
		Id = 5714325143,
		Name = "The Sower",
		Health = 0,
		Power = 0,
		AddHealth = 400,
		AddPower = 0,
		PlayTest = true,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever you cast a terrain: This card loses 200 Health. Summon a 200/200 copy of it. Give yourself a random Red or Green terrain.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{ "Damage", 200, "Self" },
						{
							"AlterEV",
							{ "Set", "Math", 200, "Nil" }
						},
						{ "Summon", "PlayerTerrain", "Ally" },
						{ "RandomAdd", "MultiColOnlyorGreenCostRedCost Terrain RedorGreen" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The offerings of this scythe grant prosperity and life."
	},
	["The Reaper-Gear"] = {
		Id = 15694319394,
		Name = "The Reaper",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		PlayTest = true,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 1, Red = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "When this card attacks: Destroy your terrain. This card gains Power equal to the destroyed terrain's stud cost x100.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"AllyTerrain"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "DestroyTerrain", 30, "Ally" },
						{ "TargetAddStrengthenBonus", 50, "Self" },
						{ "Strengthen", "Variable" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "The offerings of this scythe grant ruin and death."
	},
	["Grand Medusa"] = {
		Id = 5103966445,
		Name = "Grand Medusa",
		Health = 2500,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "Maelstrom",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5, Green = 4 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Attach a Defender Mod to all allied fighters.\nWhen this card dies: Attach a Life Giving Jelly onto all allied fighters.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Defender Mod" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "EquipGear", "Rejuv Jelly-Gear" } },
					Target = "Ally"
				}
			}
		},
		Bio = "idk a bio for this one"
	},
	["Rejuv Jelly-Gear"] = {
		Id = 6413065006,
		Name = "Life Giving Jelly",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		PlayTest = true,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "At the start of each player's turn, set the Health of this card to 400. All allied fighters gain 50 health.",
			Ability = {
				OnStart = {
					Power = {
						{ "SetHealth", 400, "Self" },
						{ "Heal", "50" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "yaay"
	},
	The4ss4ssin = {
		Id = 6319951708,
		Name = "Th3 4ss4ss1n",
		Health = 444,
		Power = 444,
		Rarity = "Legendary",
		CounterAttackBlock = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		PlayTest = true,
		ChargeRequirement = { "Board", "Opponent", 1, 9999, "HasPassive_Marked" },
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Assimilate",
			Description = "This card has haste if your opponent controls a marked fighter. \nWhen this card attacks and destroys another: Draw 2 cards. Shuffle this card into the deck.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Draw", 2 },
						{
							"MoveZone",
							{ "The4ss4ssin", "Field_Ally", "Deck_Ally", true, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "This card is broken yeah ik it's a bot card, I'm giving it some playtest time as there's a raidboss style fight and those fights need a printed card so I was testing to see if this card was okay to print as is. Will balance in the future."
	},
	["Hyperspace Magician"] = {
		Id = 74098297142563,
		Name = "Hyperspace Magician",
		Health = 100,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		PlayTest = true,
		Cost = { Neutral = 3, Blue = 3, Yellow = 4 },
		CustomReminder = {
			["Power of the Cloak"] = "Divine Cloak Supernova is a self replicating gear that replaces the effect of the attached figher."
		},
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Attach Shadow of a Stagehand to this card.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Divine Cloak Supernova-Gear" } },
					Target = "Self"
				}
			}
		},
		Bio = "Heheheha"
	},
	["Divine Cloak Supernova-Gear"] = {
		Id = 130551603602255,
		Name = "Shadow of a Stagehand",
		Health = 0,
		Power = 0,
		AddHealth = 450,
		AddPower = 450,
		PlayTest = true,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		ReplaceDescriptionant = "Variable Charges. Whenever a card targets: Gain a charge. When this card dies, if it has 6 or more charges: attach Shadow of a Stagehand to a target allied fighter.",
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "When this card is attached: Replace the attached fighter's effect with: \"Whenever a card targets: Gain a charge.\nWhen this card dies, if it has 6 or more charges: attach Shadow of a Stagehand to a target allied fighter.\"",
			Ability = {
				OnEquipped = {
					Power = {
						{ "ReplaceEffect", "Divine Cloak Supernova-Gear-Effect", "Aggressor" },
						{
							"AlterEVOnTarget",
							{ "Set", "Math", 0, "Nil" },
							"Aggressor"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever a card targets: Gain a charge.\nWhen this card dies, if it has 6 or more charges: attach Shadow of a Stagehand to a target allied fighter.",
							"Aggressor"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "yaay"
	},
	["Divine Cloak Supernova-Gear-Effect"] = {
		Id = 130551603602255,
		Name = "Shadow of a Stagehanddduhhhhhh",
		Health = 0,
		Power = 0,
		AddHealth = 350,
		AddPower = 350,
		PlayTest = true,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "0 Charges.\nWhenever a card targets: Gain a charge.\nWhen this card dies, if it has 6 or more charges: attach Shadow of a Stagehand to a target allied fighter.",
			Ability = {
				OnAnyTarget = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever a card targets: Gain a charge.\nWhen this card dies, if it has 6 or more charges: attach Shadow of a Stagehand to a target allied fighter.",
							"Self"
						}
					},
					Target = "Single"
				},
				OnDeath = {
					Power = { { "EVGreaterValueCheck", 5 } },
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "Divine Cloak Supernova-Gear" } },
					Target = "SingleAlly"
				}
			}
		},
		Bio = "how did you get this"
	},
	["777 Cherry Hotstreak Deluxe"] = {
		Id = 0,
		Name = "777 Cherry Hotstreak Deluxe",
		Health = 1600,
		Power = 1100,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		PlayTest = true,
		Cost = { Red = 5, Yellow = 5 },
		Effect = {
			Name = "Assimilate",
			Description = "Whenever you cast another fighter, if this card has 6 gears attached to it: Select a fighter in your Graveyard which has died this game and attach 6 fading copies of it to the summoned card. Destroy all gears attached to this card.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetAllyFighterInGraveyardWhichDied"
						},
						{ "EquipGear", "Variable", "Aggressor" },
						{ "EquipGear", "Variable", "Aggressor" },
						{ "EquipGear", "Variable", "Aggressor" },
						{ "EquipGear", "Variable", "Aggressor" },
						{ "EquipGear", "Variable", "Aggressor" },
						{ "EquipGear", "Variable", "Aggressor" },
						{ "DestroyGear", "All", "Self" }
					},
					Target = "Self",
					EffectRequirement = { "SelfGear", "HasGear", 6, 7, "HasGear" }
				}
			}
		},
		Bio = "Test your luck at the all new Bigg Wins™ Deluxe Slot Machine! Now accepting payments of property deeds and pints of blood!"
	},
	HighlanderRRY = {
		Id = 128919826954985,
		Name = "Paragon of Strife",
		Health = 1300,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "XhartyrSlash",
		EffectAnimation = "ParagonTrigger",
		Color = "Red",
		Archetype = "Gladiator",
		Gladiator = true,
		Overload = true,
		AddBlock = true,
		Cost = { Red = 5, Yellow = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		EffectVariable = 0,
		Rank = 5,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Thrice each turn if you take fatal damage from battle or effects that would cause you to be banned: Set your Life to 500 instead. This card gains 350 Health and Power.",
			Ability = {
				OnLifeLoss = {
					Power = {
						{ "SetLife", 500, "Ally" },
						{ "Heal", "350", "Self" },
						{ "Strengthen", "350", "Self" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					TurnTriggerLimit = 3,
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", -9999999999999, 1, "Life" }
				}
			}
		},
		Bio = "King Richard knew that the fight was over, but a sinking feeling inside of him told him to keep holding on."
	},
	HighlanderYYG = {
		Id = 106526657157547,
		Name = "john",
		Health = 1200,
		Power = 222,
		Rarity = "Epic",
		AttackEffect = "JohnAttack",
		Color = "Yellow",
		Archetype = "Gladiator",
		SummonAnimation = "JohnSummon",
		Gladiator = true,
		AddBlock = true,
		Cost = { Yellow = 5, Green = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		CustomReminder = {
			["john's cards"] = "john's cards are a cycle of 4 picant statted cards in each colour with small but helpful effects."
		},
		Requirement = { "StartDeckChecks" },
		EffectVariable = 0,
		Rank = 5,
		Effect = {
			Name = "uh",
			Description = "when an effect gives you a non-token card: destroy it. give yourself one of john's cards.",
			Ability = {
				OnAllyPut = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "CardRarity" },
							"AlliedRightMostHand"
						},
						{ "EVExactValueCheck", "Token" }
					},
					NoBlip = true,
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{ "SpecificDiscard", 1, "AlliedRightMostHand" },
						{
							"RandomAdd",
							{ "JohnMeeboid", "JohnNinja", "JohnNoob", "JohnCelestial" },
							"Ally"
						},
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "end"
	},
	JohnMeeboid = {
		Id = 112120035868226,
		Name = "doomsayer meebling",
		Health = 500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Yellow = 2 },
		Archetype = "Meeboid",
		Effect = {
			Name = "Mimic",
			Description = "whenever you've discarded your third card each turn: all allied fighters gain 200 health.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Heal", 200 } },
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" },
					TurnTriggerLimit = 1,
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	JohnNinja = {
		Id = 85535593738904,
		Name = "doomfighter ninja",
		Health = 50,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 2 },
		Archetype = "Ninja",
		Effect = {
			Name = "Mimic",
			Description = "when this card destroys another: your opponent loses 800 life.",
			Ability = {
				OnDestroy = {
					Power = { { "Inflict", 800 } },
					Target = "Enemy"
				}
			}
		},
		Bio = ""
	},
	JohnCelestial = {
		Id = 137580965899994,
		Name = "doombringer celestial",
		Health = 200,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Yellow = 2 },
		Archetype = "Celestial",
		Effect = {
			Name = "Mimic",
			Description = "during your end step: destroy the oldest card in each hand. each player draws a card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "SpecificDiscard", 1, "LeftMostHand" },
						{ "Draw", 1, "Ally" },
						{ "Draw", 1, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	JohnNoob = {
		Id = 89158643606311,
		Name = "doomrider noob",
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Archetype = "Noob",
		Effect = {
			Name = "Mimic",
			Description = "when this card attacks: summon a noob. a target fighter gains 200 Power.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Summon", "Noob" },
						{ "Strengthen", 200, "Single" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	HighlanderBBY = {
		Id = 138592347687842,
		Name = "β Vecross Polaris",
		Health = 700,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Gravity",
		Color = "Blue",
		Archetype = "Gladiator",
		Gladiator = true,
		NegateAction = true,
		AddBlock = true,
		Cost = { Blue = 5, Yellow = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		EffectAnimation = "Criticism",
		EffectVariable = 0,
		Rank = 5,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When your opponent casts an action or a fighter: Suspend this card until the next end step. Negate and remove its effects.",
			Ability = {
				OnEnemyCastSupercede = {
					Power = {
						{ "Suspend" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				},
				OnEnemySummonSupercede = {
					Power = {
						{ "Suspend" },
						{ "ReplaceEffect", "Pet1", "Aggressor" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Azureless, in the end, got to see the true nature of his actions."
	},
	HighlanderRRG = {
		Id = 118013003679151,
		Name = "Druidic Anthracnose",
		AltCards = {
			["The Hidden Queen"] = {
				Id = 72808485254657,
				Name = "The Hidden Queen",
				PlayTest = true,
				AttackEffect = "Jab",
				Bio = "i'm lowkey evil"
			}
		},
		Health = 600,
		Power = 1100,
		Rarity = "Epic",
		AttackEffect = "VenomBite",
		Color = "Red",
		Archetype = "Gladiator",
		Gladiator = true,
		AddBlock = true,
		Cost = { Red = 5, Green = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		EffectVariable = 0,
		Rank = 5,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn per zone, whenever an effect would destroy an allied card: Summon a 150/150 Dead Tree. A target fighter loses 150 Power.",
			Ability = {
				OnAllyDestroyed = {
					Power = {
						{ "Summon", "Dead Tree" },
						{ "Weaken", 150, "Single" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SummonedCard",
					MetaData = { Health = 150, Power = 150 },
					TurnTriggerLimit = 1
				},
				OnAllyHandDestroyed = {
					Power = {
						{ "Summon", "Dead Tree" },
						{ "Weaken", 150, "Single" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SummonedCard",
					MetaData = { Health = 150, Power = 150 },
					TurnTriggerLimit = 1
				},
				OnAllyGenZoneRemove = {
					Power = {
						{ "Summon", "Dead Tree" },
						{ "Weaken", 150, "Single" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SummonedCard",
					MetaData = { Health = 150, Power = 150 },
					TurnTriggerLimit = 1
				},
				OnAllyDeckDestroyed = {
					Power = {
						{ "Summon", "Dead Tree" },
						{ "Weaken", 150, "Single" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SummonedCard",
					MetaData = { Health = 150, Power = 150 },
					TurnTriggerLimit = 1
				},
				OnAllyTerrainDestroyed = {
					Power = {
						{ "Summon", "Dead Tree" },
						{ "Weaken", 150, "Single" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SummonedCard",
					MetaData = { Health = 150, Power = 150 },
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					NoBlip = true
				}
			}
		},
		Bio = "She thought the trees no longer talked to her, when the truth was they had no more words to speak."
	},
	HighlanderGGB = {
		Id = 124585530848620,
		Name = "Fallen Half Angel",
		AltCards = {
			["Fallen Half Angel-Offer"] = {
				Id = 100564393716008,
				Name = "FALLEN HALF ANGEL",
				PlayTest = true,
				AttackEffect = "MagicGreen",
				Bio = "Half Elder #####"
			}
		},
		Health = 1500,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Archetype = "Gladiator",
		Gladiator = true,
		AddBlock = true,
		Cost = { Green = 5, Blue = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		EffectVariable = 0,
		Summonant = "HighlanderGGB",
		Rank = 5,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Select a fighter card in your hand. Set its Power to 0.\nWhenever a fighter with 0 Power dies: Summon an unlocked copy of it, except it's Fading.",
			Ability = {
				OnSummon = {
					Power = { { "SetPower", 0 } },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Fighter = true },
						SelectionDescription = "A fighter in your hand"
					}
				},
				OnEnemyDusted = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "LastDeath", "Nil" }
						},
						{ "Summon", "Variable", "Ally" },
						{ "Unlock", 9999, "SummonedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Fading = true }
				},
				["On|Other|AllyDusted"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "LastDeath", "Nil" }
						},
						{ "Summon", "Variable", "Ally" },
						{ "Unlock", 9999, "SummonedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Fading = true }
				},
				OnDusted = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Unlock", 9999, "SummonedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Fading = true }
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					NoBlip = true
				}
			}
		},
		Bio = "Alex's destiny was suddenly ripped from his grasp, like reality itself ceased any function."
	},
	HighlanderBBR = {
		Id = 114294134476131,
		Name = "Wrath of the Blood Moon",
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		Color = "Blue",
		Archetype = "Gladiator",
		Gladiator = true,
		Rageborne = true,
		AddBlock = true,
		Cost = { Blue = 5, Red = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		CustomReminder = { Vigilance = "This effect doesn't count as entering rage." },
		ModifierVengeful = true,
		EffectVariable = 0,
		EffectAnimation = "RageborneEyeGlint",
		Rank = 5,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card attacks: Remove every blessing in each player's hand and gain a stack of rage for each. Put a Vengeful Blessing on the leftmost card space in each player's hand.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"AddGenZone",
							{ "RageIndicator", "Variable" }
						},
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"AddGenZone",
							{ "RageIndicator", "Variable" }
						},
						{ "RemoveHandModifiers", 30, "Me" },
						{ "RemoveHandModifiers", 30, "Him" },
						{ "DelayClient", 0.5, "Ally" },
						{ "AddHandModifier", "VengefulBless", "Opponent" },
						{ "AddHandModifier", "VengefulBless", "Self" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally",
					MetaData = {
						SlotTargets = { 0 }
					}
				}
			}
		},
		Bio = "Drake felt a level of rage he had never felt before, even though there was no more battles to fight."
	}
}
