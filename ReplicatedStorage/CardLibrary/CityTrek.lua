



return {
	CT_StartingTreasure_1 = {
		Id = 14253659423,
		Name = "Extra Snacks",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Terrain = true,
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Whenever you cast a fighter: It gains 100 Health and Power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Yummy!"
	},
	CT_StartingTreasure_2 = {
		Id = 14253660341,
		Name = "Pocket Studs",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Terrain = true,
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Start the game with an extra stud of each colour in your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Red Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Green Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 },
							"Ally"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CT_StartingTreasure_3 = {
		Id = 14253660583,
		Name = "Paraselene Amulet",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Terrain = true,
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "The first action you cast each turn triggers twice. You lose 150 life when this triggers.",
			Ability = {
				OnAllyStart = {
					Power = { { "ActionOverdrive", 1, nil, nil, nil, "TurnOnParaseleneAmulet" } },
					Target = "Self",
					NoBlip = true
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ActionCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 1, "Self" }
					},
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "TurnOffParaseleneAmulet" },
						{ "Cost", 150 }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "Use with caution."
	},
	CT_Treasure_1 = {
		Id = 14334186544,
		Name = "Distraction",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Your opponent can't attack or cast anything until their next end step.\nSkip all end triggers, readying, and stud generation that turn.",
			Type = "OnSummon",
			Power = {
				{ "BypassAttack" },
				{ "BypassGeneration" },
				{ "BypassSummon" },
				{ "BypassCasts" },
				{ "BypassAction" },
				{ "BypassTerrain" },
				{ "BypassEnd" },
				{ "BypassLock" }
			},
			Target = "Opponent"
		},
		Bio = "Hesitation kills."
	},
	CT_Treasure_2 = {
		Id = 14308567629,
		Name = "Box o' Treasures",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Give yourself 2 Treasures.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Treasure", "Ally" },
				{ "RandomAdd", "Treasure", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "What's better than a treasure? A box of treasures, of course!"
	},
	CT_Treasure_3 = {
		Id = 14308568540,
		Name = "Recruitment Sign",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Steal a target enemy fighter. That fighter is added to your current run's deck.",
			Type = "OnSummon",
			Power = {
				{ "RunAddCard" },
				{ "Steal", 30 }
			},
			Target = "SingleEnemy"
		},
		Bio = "Whacking someone in the head with this will surely convince them to join you."
	},
	CT_Treasure_4 = {
		Id = 14253660878,
		Name = "NooBot",
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		StarterCard = true,
		Color = "Neutral",
		Archetype = "Treasure",
		Charge = true,
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks and destroys another: Give yourself a copy of this card to your hand. Gain 300 Life.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Add", "CT_Treasure_4" },
				{ "Cost", -300 }
			},
			Target = "Ally"
		},
		Bio = "beep boop"
	},
	CT_Treasure_5 = {
		Id = 14253662299,
		Name = "Golden Knife",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Deal 300 damage to a target enemy fighter. If this destroys the target fighter, add a Lesser Treasure to your current run's deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Damage", 300, nil, nil, nil, "MidSlashEffect" },
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleEnemy"
				},
				OnEVCheckPass = {
					Power = {
						{
							"RunAddCardFromPool",
							{
								"CT_LesserTreasure_1",
								"CT_LesserTreasure_2",
								"CT_LesserTreasure_3",
								"CT_LesserTreasure_4",
								"CT_LesserTreasure_5",
								"CT_LesserTreasure_6",
								"CT_LesserTreasure_7",
								"CT_LesserTreasure_8",
								"CT_LesserTreasure_9",
								"CT_LesserTreasure_10",
								"CT_LesserTreasure_11",
								"CT_LesserTreasure_12",
								"CT_LesserTreasure_13",
								"CT_LesserTreasure_14",
								"CT_LesserTreasure_15",
								"CT_LesserTreasure_16",
								"CT_LesserTreasure_17"
							},
							"Ally",
							nil,
							nil,
							"GoldenKill"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", "0", "Nil" }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Does not include the ability to double jump."
	},
	CT_Treasure_6 = {
		Id = 14253659683,
		Name = "Thec's Scythe",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 2 },
		EffectAnimation = "LargeXhartyrSlashEffect",
		Effect = {
			Name = "Temporal Halo",
			Description = "Obliterate a target fighter and all of its copies in its zones, then all cards in your opponent's graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Extract", 30, "SingleEnemy" },
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "Nil", true, false, 999 },
							"Self"
						}
					},
					Target = "Single"
				}
			}
		},
		Bio = "Pointy."
	},
	CT_Treasure_7 = {
		Id = 14819804367,
		Name = "Extra Life",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 0 },
		EffectVariable = "CT_Treasure_8",
		Requirement = { "Playertable", "Me", 999999999999999, 999999999999999, "Life" },
		BypassLifeLoopRestriction = true,
		TriggerInHand = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "While this card is in your hand, If damage from battle or effects would cause you to be banned: Set your Life to 500 instead and draw a card, Your opponent can't attack until after their next end step. Remove this card from your current run's deck.",
			Ability = {
				OnLifeLoss = {
					Power = {
						{ "SetLife", 500, "Ally" },
						{ "Draw", 1, "Ally" },
						{ "BypassAttack", 30, "Opponent" },
						{ "RunRemoveCard", "CT_Treasure_7", "Ally" },
						{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", -999999999999999, 1, "Life" }
				}
			},
			EffectSpecificDiscardObliterate = true
		},
		Bio = "Just be glad you weren't charged Robux for this."
	},
	CT_Treasure_8 = {
		Id = 15448572226,
		Name = "Wind-Up Resonance",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 0 },
		Overload = true,
		EffectVariable = 0,
		ReplaceDescriptionant = "Variable charge(s).\nDeal 350 damage multiplied by the number of charges on this card to a target enemy fighter.\nWhenever you cast an action: Gain a charge.",
		TriggerInHand = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Variable charge(s).\nDeal 350 damage multiplied by the number of charges on this card to a target enemy fighter.\nWhenever you cast an action: Gain a charge.",
			Ability = {
				OnDrawn = {
					Power = { { "ReplaceDescription", "ReplaceDescriptionant", "Self" } },
					Target = "CardOwner"
				},
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Multiply", "Math", 350, "Nil" },
							"Self"
						},
						{ "DamageOverloaded", "Variable", nil, nil, nil, "WindUpPunch" },
						{
							"AlterEV",
							{ "Divide", "Math", 350, "Nil" },
							"Self"
						}
					},
					Target = "Single"
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "ONE PUUUUUUUNNNCCHHHH!!!!!!!!!!"
	},
	CT_Treasure_9 = {
		Id = 15448570490,
		Name = "Globus",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Treasure",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		EffectAnimation = "Globus",
		Effect = {
			Name = "Temporal Halo",
			Description = "Destroy all cards with Overload in all zones. Gain 1500 Life.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "HasOverload", "Field_Ally", "GraveZone_Ally", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "HasOverload", "Hand_Ally", "GraveZone_Ally", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "HasOverload", "Deck_Ally", "GraveZone_Ally", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{
								"HasOverload",
								"Field_Opponent",
								"GraveZone_Opponent",
								true,
								false,
								999
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"HasOverload",
								"Hand_Opponent",
								"GraveZone_Opponent",
								true,
								false,
								999
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"HasOverload",
								"Deck_Opponent",
								"GraveZone_Opponent",
								true,
								false,
								999
							},
							"Self"
						},
						{ "Cost", -1500, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Maintain order."
	},
	CT_LesserTreasure_1 = {
		Id = 14253663254,
		Name = "Catnip",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Fill your hand with Zombified Catgirls. They are free to cast.",
			Type = "OnSummon",
			Power = {
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				},
				{
					Power = "Add",
					Increase = "Zombified Catgirl",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				}
			},
			Target = "Ally"
		},
		Bio = "Looks toxic. You probably shouldn't eat this."
	},
	CT_LesserTreasure_2 = {
		Id = 14253658730,
		Name = "Subspace Tripmine",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		EffectAnimation = "SubspaceTripminePlant",
		CustomReminder = {
			["Hidden Minefield"] = "When your opponent draws the Tripmine, it deals 600 damage to their fighters and they lose 600 life."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle a Subspace Tripmine into the opponent's deck. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "CT_LesserTreasure_2_Token" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	CT_LesserTreasure_2_Token = {
		Id = 14253658730,
		Name = "Subspace Tripmine",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		PlayTest = true,
		Cost = { Neutral = 0 },
		EffectAnimation = "SubspaceTripmine",
		Effect = {
			Name = "Nightmare!",
			Description = "When you draw this card: Deal 600 damage to all allied fighters. You lose 600 life.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Cost", 600 },
				{ "Damage", 600, "Ally" },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" }
			}
		},
		Bio = ""
	},
	CT_LesserTreasure_3 = {
		Id = 14253660025,
		Name = "R-Orb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 2 },
		EffectAnimation = "ROrb",
		Effect = {
			Name = "Cheeseburger",
			Description = "Double the Health and Power of a target allied fighter.",
			Type = "OnSummon",
			Power = {
				{ "MultiplyPower", 2 },
				{ "MultiplyHealth", 2 }
			},
			Target = "Single"
		},
		Bio = "Produced in masses."
	},
	CT_LesserTreasure_4 = {
		Id = 14253661993,
		Name = "Green Floating Balloon",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Reincarnation",
			Description = "Reset a target allied fighter's stats. Return it to your hand. Change its cost to nothing, it gains haste.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Unlock", 999 },
						{ "Reset" },
						{ "Return" },
						{ "GivePassive", "Charge" },
						{
							"SetCost",
							{ 0, "Neutral" }
						}
					},
					Target = "SingleAlly"
				}
			},
			RemoveOtherColors = true
		},
		Bio = "hehe"
	},
	CT_LesserTreasure_5 = {
		Id = 14253725982,
		Name = "Monster Rebirth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Select 2 fighter cards in your graveyard that've died this game. Summon them both.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false }
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "TargetAllyFighterInGraveyardWhichDied"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false }
					} },
					Target = "TargetAllyFighterInGraveyardWhichDied"
				}
			}
		},
		Bio = "hehe"
	},
	CT_LesserTreasure_6 = {
		Id = 14253724894,
		Name = "Pod of Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally"
		},
		Bio = "What does Pot of Greed do?"
	},
	CT_LesserTreasure_7 = {
		Id = 14253661349,
		Name = "Lucky Coin",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself 2 Coin Tosses, which are actions which have a 50% chance to destroy a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "CT_LesserTreasure_7_Token", "Ally" },
						{ "Add", "CT_LesserTreasure_7_Token", "Ally" }
					}
				}
			}
		},
		Bio = "Try your luck!"
	},
	CT_LesserTreasure_7_Token = {
		Id = 14253661349,
		Name = "Coin Toss",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		PlayTest = true,
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy a target fighter. This has a 50% chance of failing.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 1 }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Damage", 1, "Single", nil, nil, "LuckyCoinFail" } },
					Target = "Single"
				},
				OnEVCheckFail = {
					Power = { { "Destroy", 30, "Single", nil, nil, "LuckyCoinPass" } },
					Target = "Single"
				}
			}
		},
		Bio = "Try your luck!"
	},
	CT_LesserTreasure_8 = {
		Id = 14253663043,
		Name = "Curved Blade of Winds",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		EffectAnimation = "CurvedBladeOfWinds",
		Effect = {
			Name = "Reincarnation",
			Description = "Give a target allied fighter Super Dextrous. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "SuperDextrous", "SingleAlly" },
						{ "Draw", 1, "Ally" }
					}
				}
			}
		},
		Bio = "Metamancer."
	},
	CT_LesserTreasure_9 = {
		Id = 14253661789,
		Name = "Lannis' Amulet",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EffectAnimation = "LannisAmulet",
		Effect = {
			Name = "Reincarnation",
			Description = "Give a target fighter immunity to damage, weaken, lock, transform and destroy effects. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "DamageImmune" },
						{ "GivePassive", "WeakenImmune" },
						{ "GivePassive", "LockImmune" },
						{ "GivePassive", "TransformImmune" },
						{ "GivePassive", "DestroyImmune" },
						{ "GivePassive", "TargetImmune" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Dispels curses."
	},
	CT_LesserTreasure_10 = {
		Id = 14253659161,
		Name = "Sonic Wing",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Look at the top 2 cards of your opponent's deck. Add one to your hand. That card's cost becomes 2 Colourless studs.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Opponent", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"SetCost",
							{ 2, "Neutral" },
							"AlliedAddedCard"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { TopCard = 2 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card to add to your hand."
					}
				}
			},
			RemoveOtherColors = true
		},
		Bio = "Light spell."
	},
	CT_LesserTreasure_11 = {
		Id = 14253662488,
		Name = "Free Race Rerolls",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Rank = 6,
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 1 },
		EffectVariable = 3,
		ReplaceDescriptionant = "Transform a target fighter into a random fighter, then reset it's stats. This card has Variable use(s) left.",
		Effect = {
			Name = "Haydoscale",
			Description = "Transform a target fighter into a random fighter, then reset it's stats. This card can have 3 uses.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTransform", "Fighter", "Single", nil, nil, "FreeRaceReroll" },
						{ "Reset", 30, "TransformedCard" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Add", "CT_LesserTreasure_11", "Ally" },
						{
							"AlterEV",
							{ "Set", "EffectVariable", "Nil", "Target" },
							"AlliedAddedCard"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "AlliedAddedCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Popular Roblox anime game trope. Don't question the ethics."
	},
	CT_LesserTreasure_12 = {
		Id = 14253661053,
		Name = "Мастер",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Bite",
		Color = "Neutral",
		Archetype = "Lesser Treasure",
		Cost = { Neutral = 0 },
		StarterCard = true,
		Stealth = true,
		Unique = true,
		Regen = true,
		Charge = true,
		Overload = true,
		Terrified = true,
		Decaying = true,
		Dextrous = true,
		Fleeting = true,
		OmniToken = true,
		CritChance = 25,
		Effect = {
			Description = "",
			Type = "OnSummon",
			Power = "Draw",
			Target = "Self",
			Increase = 0
		},
		Bio = "What even is this?"
	},
	CT_LesserTreasure_13 = {
		Id = 14819800510,
		Name = "Last Stand",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lesser Treasure",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Requirement = { "Playertable", "Me", 0, 501, "Life" },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Cast only if you have 500 or less life.\nYou gain 10 of each stud.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Red", 10 },
						{ "Green", 10 },
						{ "Blue", 10 },
						{ "Yellow", 10 },
						{ "Neutral", 10 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Time to spend all of that energy you've been saving up for 5 episodes."
	},
	CT_LesserTreasure_14 = {
		Id = 14819809366,
		Name = "Studling Whistle",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lesser Treasure",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EffectAnimation = "StudlingWhistle",
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself a studling of each colour.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Red Stud", "Ally" },
						{ "Add", "Blue Stud", "Ally" },
						{ "Add", "Yellow Stud", "Ally" },
						{ "Add", "Green Stud", "Ally" },
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 7 },
							"Self"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "Add", "Iris, Imperishable Rainbow", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "Every Studmaster carries a whistle to call upon their studlings (and potentially other Studmasters) in their time of need."
	},
	CT_LesserTreasure_15 = {
		Id = 14819811450,
		Name = "Money Cannon",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lesser Treasure",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 1000 damage to a target fighter. You lose 300 BloxBux from this run.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 1000, "Single" },
						{ "RunRewardTax", -300, "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Insert joke about the game being pay to win here"
	},
	CT_LesserTreasure_16 = {
		Id = 15448568329,
		Name = "Fimbulvetr",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lesser Treasure",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		EffectAnimation = "Fimbulvetr",
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 500 damage to a target enemy fighter. Lock fighters adjacent to the target fighter for 2 turns.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "ChosenCard" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "LeftChosenCard" },
							"AdjacentEVTargetLeft"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "RightChosenCard" },
							"AdjacentEVTargetRight"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ChosenCard" },
							"Self"
						},
						{ "Lock", 2, "AdjacentEVTarget" },
						{ "Damage", 500, "SingleEnemy" }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "LOG."
	},
	CT_LesserTreasure_17 = {
		Id = 15448564539,
		Name = "Nocere",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lesser Treasure",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle all Misfortunes in your deck and graveyard into the opponent's deck. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Misfortune", "Deck_Ally", "Deck_Opponent", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "Misfortune", "GraveZone_Ally", "Deck_Opponent", true, false, 999 },
							"Self",
							nil,
							nil,
							"Nocere"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Torture."
	},
	CT_ObtainableToken_1 = {
		Id = 76822736302744,
		Name = "Lost Familey",
		AltCards = {
			CT_ObtainableToken_1_Token = {
				AttackBlock = true,
				Effect = {
					Name = "Reincarnation",
					Description = "",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Add", "Playertable", "Duelist", "CT_SM_2" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Playertable", "Duelist", "CT_SM_6" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Playertable", "Duelist", "CT_SK_4" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Playertable", "Duelist", "CT_KI_8" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0, "Self" }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Modifier", "CT_ObtainableToken_1", "Nil" },
									"Self"
								},
								{ "RunRemoveCardAsEnemy", nil, "Self" },
								{ "SetLife", 0, "Ally", nil, nil, "LostFamileyWin" }
							},
							Target = "Ally",
							NoBlip = true
						}
					},
					IgnoreLifeShield = true
				}
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		Archetype = "Special",
		Logo = "Smiley",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Yellow = 1 },
		Decaying = true,
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, or at the start of your turns: Ransack 1.\nIf you do: Draw a card.\nIf you don't: Your opponent takes this card without this effect.",
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
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "1 card to Ransack",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
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
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "1 card to Ransack",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1, "Ally" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{ "Obliterate", 30, "Self" },
						{ "Summon", "CT_ObtainableToken_1_Token", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "When you see a crowd of grins in the night, make sure to grin back."
	},
	CT_ObtainableToken_2_Token = {
		Id = 14369388823,
		Name = "Lost Portable Drone",
		Health = 1200,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		DiscardBlock = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top card of your graveyard.\nWhen this card is attacked: Transform it into Fallen Portable Drone.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnAttacked = {
					Power = { { "Transform", "CT_ObtainableToken_2_Token_2", "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "It is just flying, perhaps it can be knocked down?"
	},
	CT_ObtainableToken_2_Token_2 = {
		Id = 14369388823,
		Name = "Fallen Portable Drone",
		Health = 1200,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Storm",
		DiscardBlock = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is targeted. Obliterate it. Add it to the opponent's current run deck.",
			Ability = {
				OnTarget = {
					Power = {
						{ "RunAddCardFromOpponent", "CT_ObtainableToken_2", "Self" },
						{
							"RunRemoveCardFromOpponentShuffle",
							"CT_ObtainableToken_2_Token",
							"Self"
						},
						{ "RunRigNextEvent", "CT_G_Troubled Arkhivist_2", "Self" },
						{ "Obliterate", 30, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Go get it!"
	},
	CT_ObtainableToken_2 = {
		Id = 14369388823,
		Name = "Portable Drone",
		Health = 1200,
		Power = 150,
		Rarity = "Token",
		Archetype = "Special",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top card of your graveyard.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "This is pretty useful.."
	},
	CT_ObtainableToken_3 = {
		Id = 14368345763,
		Name = "Journalist Camera",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Special",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		EffectAnimation = "CameraSelf",
		Effect = {
			Name = "Haydoscale",
			Description = "Lock all opponent fighters for 1 turn. If any of them are in the Substantial group: Put a Substantial Photo in your run deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Lock", 1 },
						{ "RunJournalistCameraEffect" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	CT_ObtainableToken_3_Token = {
		Id = 14368346134,
		Name = "Substantial Photo",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Draw 1 card.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "This will make headlines!"
	},
	CT_ObtainableToken_4 = {
		Id = 5378454543,
		Name = "Morphic Goo",
		Health = 50,
		Power = 50,
		TokenOmni = true,
		Fading = true,
		Rarity = "Token",
		AttackEffect = "Goo",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Archetype = "Morphic",
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an effect targets this card: Summon a random fighter. Obliterate this card.",
			Type = "OnTarget",
			Power = {
				{ "RandomSummon", "Fighter" },
				{ "Obliterate", 9999, "Self" }
			},
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "One of Eisenhower's creations. It can transform into just about anything. However, the transformation process is entirely random. The alchemist's research is not yet complete."
	},
	CT_ObtainableToken_5 = {
		Id = 14560520399,
		Name = "The Chairman",
		Health = 1250,
		Power = 1250,
		Rarity = "Token",
		AttackEffect = "VampBite",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Archetype = "Gladiator",
		Rank = 5,
		AddBlock = true,
		DamageImmune = true,
		DestroyImmune = true,
		Gladiator = true,
		Dextrous = true,
		SummonAnimation = "ChairmanSummon",
		SummonedAnimation = "ChairmanSummon",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select a card in your deck. Search your deck for that card.",
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
							{ "Target", "Deck_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Primordial hunger has never looked so dapper. Be thankful."
	},
	CT_Candy_1 = {
		Id = 14323367167,
		Name = "Red Candy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Start the game with 1 more Red Stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Red Stud", 1 },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CT_Candy_2 = {
		Id = 14323366795,
		Name = "Blue Candy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Start the game with 1 more Blue Stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Blue Stud", 1 },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CT_Candy_3 = {
		Id = 14323367009,
		Name = "Green Candy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Start the game with 1 more Green Stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Green Stud", 1 },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CT_Candy_4 = {
		Id = 14323367405,
		Name = "Yellow Candy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		CastOnStart = true,
		PlayTest = true,
		Color = "Neutral",
		Archetype = "Starting Gear",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Start the game with 1 more Yellow Stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Yellow Stud", 1 },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CT_Bad_1 = {
		Id = 121041893613867,
		Name = "Wounded",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		TokenGenZone = true,
		Token = true,
		TriggerInHand = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Archetype = "Misfortune",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nightmare!",
			Description = "When this card enters your hand: You lose 400 life. Draw a card.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Draw", 1, "CardOwner" },
				{ "Cost", 400 },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" }
			}
		},
		Bio = "Better get this healed."
	},
	CT_Bad_2 = {
		Id = 14017155674,
		Name = "Exhausted",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		TokenGenZone = true,
		Token = true,
		TriggerInHand = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Archetype = "Misfortune",
		BlessingTimer = 6,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nightmare!",
			Description = "When this card enters your hand: Put a Vengeful Blessing on a card in your hand for six turns. Draw a card.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Draw", 1, "CardOwner" },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
				{ "AddHandModifier", "VengefulBless", "RandomNotBlessedAllyHand" }
			}
		},
		Bio = "You can barely catch your breath."
	},
	CT_Bad_3 = {
		Id = 14017069423,
		Name = "Dizzy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		TokenGenZone = true,
		Token = true,
		TriggerInHand = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Archetype = "Misfortune",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nightmare!",
			Description = "When this card enters your hand: You can't cast actions this turn. Draw a card.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Draw", 1, "CardOwner" },
				{ "BypassAction", nil, "Self", nil, nil, "Dizzy" },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" }
			}
		},
		Bio = "You can't see straight.."
	},
	CT_Bad_4 = {
		Id = 14017071151,
		Name = "Watched",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		TokenGenZone = true,
		Token = true,
		TriggerInHand = true,
		NotInMulligan = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Omen",
		Effect = {
			Name = "Nightmare!",
			Description = "When this card enters your hand: Shuffle The Killer into your opponent's deck. Draw a card.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Draw", 1, "CardOwner" },
				{ "DeckAdd", "CT_Bad_4_Token", "Opponent" },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" }
			}
		},
		Bio = "You feel like you are being watched."
	},
	CT_Bad_4_Token = {
		Id = 14368358122,
		Name = "The Killer",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Katana",
		Archetype = "Substantial",
		DiscardBlock = true,
		Color = "Red",
		Cost = { Red = 0 },
		Charge = true,
		SummonAnimation = "ThecSummon",
		SummonedAnimation = "ThecSummon",
		SummonAnimationEffect = true,
		PreloadAssets = {
			"rbxassetid://13623357066",
			"rbxassetid://13613038354",
			"rbxassetid://13613222363"
		},
		Effect = {
			Name = "Render",
			Description = "Whenever this card attacks and destroys another: Remove a copy of the fighter this card destroyed from the opponent's current run deck.",
			Ability = {
				OnAttack = {
					Power = { {
						"AlterEV",
						{ "Set", "Target", "CardIndex", "Nil" },
						"Aggressor"
					} }
				},
				OnAttackDestroy = {
					Power = { { "RunRemoveCardAsEnemy", nil, "Self" } }
				}
			}
		},
		Bio = "Hello!"
	},
	CT_Bad_5 = {
		Id = 12145045339,
		Name = "Zombified Catgirl",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Archetype = "Misfortune",
		Cost = { Green = 0 },
		TokenOmni = true,
		Zombified = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "xwx owo ewe uwu"
	},
	CT_Vial = {
		Id = 12183215580,
		Name = "Necroenzyme Vial",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Immortality's Limits"] = "When a Zombified card leaves play for any reason, obliterate it.",
			["Immortality's Curse"] = "Fading cards don't go to the graveyard when they're used up."
		},
		CustomReminderRecur = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Select a fighter card in your graveyard. Recur that card, except it's Fading and Zombified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { Fading = true, Zombified = true }
				}
			}
		},
		Bio = "Its horrid potential never crossed Eisenhower's mind. He only wanted to bring back his love."
	},
	["Ancient Imp-PLL"] = {
		Id = 10235039156,
		Name = "Ancient Imp",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		Color = "Yellow",
		AttackEffect = "Inferno",
		Cost = { Yellow = 5 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever this card attacks: It steals half the power of the attacked fighter until each owner's end step.",
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
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" }
						},
						{
							"AlterEV",
							{ "StatRound", "Math", 50, "Nil" }
						},
						{ "TempWeaken", "Variable", "Aggressor" },
						{ "TempStrengthen", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Possessing frail bodies and thought long-extinct, the distant cousins of demonkind rely on illusions, tiring their foes."
	},
	["Fashionable Citizen-PLL"] = {
		Id = 12146859470,
		Name = "Fashionable Citizen",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		GraveAddant = "Fashionable Citizen",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Put two copies of it into your graveyard.",
			Ability = {
				OnDeath = {
					Power = {
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Another wonderful day in beautiful Bloxburg! Surely nothing abhorrently awful could ruin this, eh?"
	},
	["Noob-PLL"] = {
		Id = 4899422795,
		Name = "Noob",
		Health = 400,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Noob",
		Cost = { Neutral = 2 },
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Effect = {
			Name = "Oof",
			Description = "",
			Type = "Null",
			Power = "Yellow",
			Target = "Ally",
			Increase = 0
		},
		Bio = "And here we see the common noob, socializing on his natural habitat."
	},
	["Cat's Eye Winglet-PLL"] = {
		Id = 6801088056,
		Name = "Cat's Eye Winglet",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		Effect = {
			Name = "Sugar and Ice",
			Description = "During your end step: All allied Cat's Eyes gain 100 health.",
			Type = "OnEnd",
			Power = { { "BoostHealth", 100 } },
			Target = "AlliedArchetype"
		},
		Bio = "Who would give the disembodied eye of a kitten wings anyway? Sickos."
	},
	["Rascal-PLL"] = {
		Id = 14346241529,
		Name = "Annoying Rascal",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks: Your opponent loses 200 Life.",
			Type = "OnAttack",
			Power = { { "Inflict", 200 } },
			Target = "Opponent"
		},
		Bio = "Got a problem?"
	},
	["CT_SM_2-1"] = {
		Id = 12146793649,
		Name = "Silly Laughing Stock",
		AltCards = {
			["CT_SM_6-1"] = { Name = "Lunatic Laughing Stock", Health = 500 }
		},
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Logo = "Smiley",
		Color = "Red",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Destroy the bottom four cards of your deck.\nWhen this card is obliterated by a Ransack ability: Draw a card.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						}
					}
				},
				OnRansacked = {
					Power = { { "Draw", 1, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The name's not as funny when you consider the rifle he's holding."
	},
	["CT_SM_2-2"] = {
		Id = 12146798845,
		Name = "Silly Smiley Slasher",
		AltCards = {
			["CT_SM_6-2"] = {
				Name = "Lunatic Smiley Slasher",
				Overload = true,
				Effect = {
					Name = "Reincarnation",
					Description = "At the start of your turns: Ransack 2. If you do, this card gains 800 power until your next end step.",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "ResetRansack", "Math", 0, "Nil" },
									"Self"
								},
								{ "AutoGraveDestroy", 2, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "RansackCount", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 1 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = { { "TempStrengthen", 800, "Self" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Ransack 2. If you do, this card gains 600 power until your next end step.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "AutoGraveDestroy", 2, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "TempStrengthen", 600, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "When you see a crowd of grins in the night, make sure to grin back."
	},
	["CT_SM_2-3"] = {
		Id = 12703644087,
		Name = "Silly Chuckling Arsonist",
		AltCards = {
			["CT_SM_6-3"] = { Name = "Lunatic Chuckling Arsonist", Health = 500 }
		},
		Health = 300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Bottle",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3. If you do, this card gains 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "AutoGraveDestroy", 3, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Kick the hornet's nest, face the hornet's ire."
	},
	["CT_SM_2-4"] = {
		Id = 12146801792,
		Name = "Silly Snickering Skewer",
		AltCards = {
			["CT_SM_6-4"] = { Name = "Lunatic Snickering Skewer", Power = 500 }
		},
		Health = 300,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Neutral = 2, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, recur an allied fighter card. It gains 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "AutoGraveDestroy", 3, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { IncreaseHealth = 100, IncreasePower = 100 }
				}
			}
		},
		Bio = "Running at someone with a giant spear in your hand would intimidate a lot of people."
	},
	["CT_SM_2-5"] = {
		Id = 12146760273,
		Name = "Silly Cackling Hell Biker",
		AltCards = {
			["CT_SM_6-5"] = { Name = "Lunatic Cackling Hell Biker", CounterAttackBlock = true }
		},
		Health = 100,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Flare",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 1, Neutral = 1, Yellow = 1 },
		Overload = true,
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, unlock this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "AutoGraveDestroy", 3, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Unlock", 999, nil, nil, nil, "Motorcycle" } },
					Target = "Self"
				}
			}
		},
		Bio = "<b>BAD TO THE BONE</b>"
	},
	["CT_SM_2-6"] = {
		Id = 126468971756147,
		Name = "Povvo Street",
		AltCards = {
			["CT_SM_6-6"] = {}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Smiley",
		Fading = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Add a Red and Yellow stud to your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "bio"
	},
	["CT_LO_2-1"] = {
		Id = 12506946858,
		AltCards = {
			["CT_LO_6-1"] = { Liberate = true }
		},
		Name = "Bloxburg Protestor",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Destroy the top card of your deck.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "TopCard", "Deck_Ally", "GraveZone_Ally", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Can't we just have a WHOLE century without anything bad happening for Pete's sake?!"
	},
	["CT_LO_2-2"] = {
		Id = 12162937789,
		AltCards = {
			["CT_LO_6-2"] = { Health = 700 }
		},
		Name = "Rebel Physician",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		EffectAnimation = "RegenCoilEffect",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a card leaves your graveyard: All allied fighters gain 50 health.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "Heal", 50 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Stubbornness can only last so long."
	},
	["CT_LO_2-3"] = {
		Id = 12333596480,
		AltCards = {
			["CT_LO_6-3"] = { Power = 500, GraveAddant = "CT_LO_6-3" }
		},
		Name = "Katharan Rebuilder",
		Health = 200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Green = 1 },
		Liberate = true,
		GraveAddant = "CT_LO_2-3",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Put a copy of it into your graveyard.",
			Ability = {
				OnDeath = {
					Power = { { "GraveAdd", "GraveAddant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The refugees of the Federation Conquest will fight for peace and quiet."
	},
	["CT_LO_2-4"] = {
		Id = 12288065270,
		AltCards = {
			["CT_LO_6-4"] = {
				Cost = { Green = 2, Red = 3, Neutral = 2 }
			}
		},
		Name = "United Front",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Green = 3, Red = 3, Neutral = 3 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon 2 random fighters with Liberate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "CT_LO_2-3", "CT_LO_6-5", "CT_LO_6-1" },
							"Ally"
						},
						{
							"RandomSummon",
							{ "CT_LO_2-3", "CT_LO_6-5", "CT_LO_6-1" },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "A reminder of what they want to prevent."
	},
	["CT_LO_2-5"] = {
		Id = 12154412901,
		AltCards = {
			["CT_LO_6-5"] = { Power = 250 }
		},
		Name = "Civilian Rebel",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Crowbar",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 1 },
		Liberate = true,
		Charge = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Can't we just have TEN MORE decades of peace for Shed's sake?!\""
	},
	["CT_LO_2-6"] = {
		Id = 12154433978,
		AltCards = {
			["CT_LO_6-6"] = {}
		},
		Name = "Defiant March",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		Terrain = true,
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Neutral = 0 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Red Stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Red Stud", 1 }
					} },
					Target = "Single"
				}
			}
		},
		Bio = "The people of Bloxburg would not, <i>will not,</i> ever stand for the exploitation of mortality."
	},
	["CT_AR_2-1"] = {
		Id = 12560352938,
		AltCards = {
			["CT_AR_6-1"] = { Name = "Senior Greenbelt Surveyor", Health = 500 }
		},
		Name = "Intern Greenbelt Surveyor",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: The top card of your graveyard generates.",
			Ability = {
				OnEnd = {
					Power = { { "Generate", 1, nil, nil, nil, "QuickScanGraveyard" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "With the trusty Land-Marker! Much more reliable than a Magic-Marker."
	},
	["CT_AR_2-2"] = {
		Id = 12575064646,
		AltCards = {
			["CT_AR_6-2"] = {
				Name = "Slightly Less Novice Arkhivist",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Recur the top card of your graveyard. It gains 400 Health and Power.",
					Ability = {
						OnSummon = {
							Power = { {
								"MoveZone",
								{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
								"CustomTarget"
							} },
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_GraveZone" },
								Condition = "BottomCard"
							},
							MetaData = { IncreaseHealth = 400, IncreasePower = 400 }
						}
					}
				}
			}
		},
		Name = "Novice Arkhivist",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 0,
		EffectAnimation = "QuickScanGraveyard",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top card of your graveyard. It gains 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { IncreaseHealth = 200, IncreasePower = 200 }
				}
			}
		},
		Bio = "\"Don't forget the toothbrush! No self-respecting archaeologist leaves home without one!\""
	},
	["CT_AR_2-3"] = {
		Id = 12463889224,
		AltCards = {
			["CT_AR_6-3"] = { Health = 800, Power = 800 }
		},
		Name = "Hive Terminal",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Overload = true,
		Cost = { Neutral = 2, Green = 4, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if the top card of your graveyard is Green: Recur the top card of your graveyard. It becomes free.\nOtherwise, this card gains 200 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"ScanGraveyard"
					} },
					Target = "Self",
					MetaData = {
						Cost = { Neutral = 0 }
					},
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckFail = {
					Power = {
						{ "Strengthen", 200, "Self" },
						{ "Heal", 200, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Despite the distances between them, members of the Arkhive are so tightly connected."
	},
	["CT_AR_2-4"] = {
		Id = 12575049445,
		AltCards = {
			["CT_AR_6-4"] = { Health = 400, Power = 400 }
		},
		Name = "Observation Cam",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Blue = 2, Green = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: If the top card of your graveyard is Green, search your deck for a Blue card. Otherwise, search your deck for a Green card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Blue", "Ally", nil, nil, "ScanGraveyard" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "RandomTutorfor", "Green", "Ally", nil, nil, "ScanGraveyard" } },
					Target = "Self"
				}
			}
		},
		Bio = "Funny old era neoancient mytholotic temple motioncam timelapse (320 fps)"
	},
	["CT_AR_2-5"] = {
		Id = 12463893143,
		AltCards = {
			["CT_AR_6-5"] = { Power = 200 }
		},
		Name = "Portable Translator",
		Health = 800,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Blue = 1, Green = 1, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns, if the top card of your graveyard costs 5 or fewer total studs: Recur it.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"QuickScanGraveyard"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "Don't worry, it can translate cursive and blessive."
	},
	["CT_AR_2-6"] = {
		Id = 12288057943,
		AltCards = {
			["CT_AR_6-6"] = { Name = "Super Restoration Project" }
		},
		Name = "Restoration Project",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Fading = true,
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Add a Blue stud to your baseplate. Put 10 random Arkhive cards in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2", "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-1", "CT_AR_2-2" }
						},
						{
							"GraveAdd",
							{ "CT_AR_2-3", "CT_AR_2-4", "CT_AR_2-5" }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "bio"
	},
	["CT_PL_2-1"] = {
		Id = 12145015258,
		AltCards = {
			["CT_PL_6-1"] = { Name = "Super Awesome Pawesome Party", Power = 400 }
		},
		Name = "Awesome Pawesome Party",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon two 100/100 Zombified Catgirls.\nWhen this card dies, if you're in Bliss: Summon two 100/100 Zombified Catgirls.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingSummon",
						{ "Zombified Catgirl", 2 },
						"Ally"
					} },
					Target = "Self"
				},
				OnDeath = {
					Power = { {
						"RepeatingSummon",
						{ "Zombified Catgirl", 2 },
						"Ally",
						nil,
						nil,
						"BlissTriggerGreen"
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"Nyan, nyew, nyree! Get your paws on me! ~♪\""
	},
	["CT_PL_2-2"] = {
		Id = 12144990561,
		AltCards = {
			["CT_PL_6-2"] = { Name = "Super Awesome Long-Lost Son", Health = 350, Power = 350 }
		},
		Name = "Awesome Long-Lost Son",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		CustomReminderBliss = true,
		Cost = { Yellow = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter dies: This card gains 50 Health and Power. It gets an additional 50 Health and Power if you're in Bliss.",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{ "Heal", 50, "Self", nil, nil, "BlissTrigger" },
						{ "Strengthen", 50, "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyDeath = {
					Power = {
						{ "Strengthen", 50 },
						{ "Heal", 50 },
						{
							"AlterEV",
							{ "Set", "Playertable", "Bliss", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Sarah's old patient was happy to be with their family. Their family was terrified of a corpse perfectly mimicking their decade-lost son."
	},
	["CT_PL_2-3"] = {
		Id = 12144985466,
		AltCards = {
			["CT_PL_6-3"] = { Name = "Super Awesome Last Dance Hedonist", Power = 500 }
		},
		Name = "Awesome Last Dance Hedonist",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		TriggerInGraveZone = true,
		Cost = { Green = 2 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a 100/100 Zombified Catgirl.\nDuring your end step, if this card is in your graveyard and you're in Bliss: Recur this card, except it's Zombified.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Zombified Catgirl" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "CT_PL_2-3", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "CT_PL_6-3", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "\"She couldn't cure my chronic scabies, but she saved me from pain and suffering. Why is being ill so bad when I am so <b>HAPPY?</b>\""
	},
	["CT_PL_2-4"] = {
		Id = 12144394652,
		AltCards = {
			["CT_PL_6-4"] = {
				Name = "Super Awesome Animal Experimentation Kit",
				Cost = { Neutral = 1, Green = 2, Yellow = 2 }
			}
		},
		Name = "Awesome Animal Experimentation Kit",
		Health = 150,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Green = 3, Yellow = 3 },
		CustomReminderBliss = true,
		Summonant = "Zombified Catgirl",
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon two 100/100 Zombified Catgirls. Then if you're in Bliss, all allied token fighters gain 300 Power and Overload.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "Summonant", 2 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{ "Strengthen", 300 },
						{ "GivePassive", "Overload" }
					},
					Target = "AllyToken",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"Cats are better than men. Can't feel as much pain. Clams are way better. Unable to think, unable to <i>mourn.</i>\""
	},
	["CT_PL_2-5"] = {
		Id = 13293160180,
		AltCards = {
			["CT_PL_6-5"] = { Name = "Super Awesome Flesh Fashionista", Health = 500, Power = 500 }
		},
		Name = "Awesome Flesh Fashionista",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Green",
		Cost = { Green = 3, Yellow = 4 },
		Overload = true,
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: It gains 100 Health and Power for each different name among cards in your Graveyard. Repeat this effect if you're in Bliss.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "UniqueName", "All" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTrigger" },
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"This... this is who I was always meant to be!\""
	},
	["CT_PL_2-6"] = {
		Id = 13293166264,
		AltCards = {
			["CT_PL_6-6"] = { Name = "Super Awesome Hunting Party", Health = 450 }
		},
		Name = "Awesome Hunting Party",
		Health = 150,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1, Green = 2 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Mark all enemy fighters. Then if you're in Bliss, deal 50 damage to all enemy fighters and they lose 50 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"GivePassive",
							"Marked",
							nil,
							nil,
							nil,
							nil,
							"CatMark"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{
							"Damage",
							50,
							nil,
							nil,
							nil,
							nil,
							"SmallRifleEffectAsync"
						},
						{ "Weaken", 50 }
					},
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"OwO! We bwetter find that robo-lady and twear her apawt, nya! ~♪\"\""
	},
	["CT_PL_2-7"] = {
		Id = 13293181124,
		AltCards = {
			["CT_PL_6-7"] = { Name = "The Super PLURRALITY" }
		},
		Name = "The PLURRALITY",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Toxic Positivity",
		Effect = {
			Name = "Haydoscale",
			Description = "Add 2 Yellow studs to your baseplate.\nAt the start of your turns: Summon a Zombified Catgirl, then destroy it.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Yellow Stud", 2 }
					} },
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{ "Summon", "Zombified Catgirl" },
						{ "Destroy", 30, "AlliedRightMost" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The club of the PLURRALs allows people to drown their sorrows away in pleasure."
	},
	["CT_NE_2-1"] = {
		Id = 13293057205,
		AltCards = {
			["CT_NE_6-1"] = { Name = "High Security Organoid Officer", Power = 600 }
		},
		Name = "Security Organoid Officer",
		Health = 450,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you Seance a card: This card generates.",
			Ability = {
				OnAllySeance = {
					Power = { { "Generate", 1 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I know it's a bit weird being grafted onto me like this, Steve,\" commented Susan.<br/>\"But I appreciate your decades of cop experience, and your company. \"<br/>The brain wiggled in affirmation."
	},
	["CT_NE_2-2"] = {
		Id = 12560333050,
		AltCards = {
			["CT_NE_6-2"] = { Name = "High Security Zoomba", Health = 700 }
		},
		Name = "Security Zoomba",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Electric",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 2 },
		EffectVariable = 0,
		EffectAnimation = "Zoomba",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you Seance a card: Draw a card. Destroy that card if it's not cast by your next end step.",
			Type = "OnAllySeance",
			Power = { { "Draw", 1 } },
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "In exchange for providing their brains post-mortem, their families are guaranteed to have full financial insurance."
	},
	["CT_NE_2-3"] = {
		Id = 12560330643,
		AltCards = {
			["CT_NE_6-3"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Seance a card in your Graveyard that costs 4 or fewer total studs.\nAll allied fighters gain 200 Power until their next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"MoveZone",
									{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
									"Self",
									nil,
									nil,
									nil,
									"Seance"
								},
								{ "TempStrengthen", 200, "Ally" }
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
				}
			}
		},
		Name = "Spirit Subpoena",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 1, Yellow = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Seance a card in your Graveyard that costs 4 or fewer total studs.\nAll allied fighters gain 100 Power until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{ "TempStrengthen", 100, "Ally" }
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
		Bio = "\"You've been invaluable, Margaret. Thanks for telling us who killed you.\""
	},
	["CT_NE_2-4"] = {
		Id = 12288062878,
		AltCards = {
			["CT_NE_6-4"] = {
				Name = "High Security Lawyer of Last Moments",
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever you Seance a card: This card gains 200 Power.",
					Ability = {
						OnAllySeance = {
							Power = { { "Strengthen", 200, "Self" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Name = "Security Lawyer of Last Moments",
		Health = 900,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you Seance a card: This card gains 100 Power.",
			Ability = {
				OnAllySeance = {
					Power = { { "Strengthen", 100, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"They say dead men tell no tales. Prove them wrong, tell me everything.\""
	},
	["CT_NE_2-5"] = {
		Id = 12560351263,
		AltCards = {
			["CT_NE_6-5"] = { Name = "High Security Zoomba", Health = 900 }
		},
		Name = "Security Counsel Engine",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Electric",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Seance a card in your graveyard that costs 4 or fewer total studs.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
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
		Bio = "The greatest scientific minds of Bloxburg banded together, literally <i>and</i> figuratively, though mostly mechanically."
	},
	["CT_NE_2-6"] = {
		Id = 13293224613,
		AltCards = {
			["CT_NE_6-6"] = {
				Cost = { Yellow = 1, Blue = 1, Neutral = 2 }
			}
		},
		Name = "Facing the Factions",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		DiscardBlock = true,
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 2, Blue = 2, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Each fighter with the lowest Power gains 800 Power and Overload.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Overload", "LowestPower" },
						{ "Strengthen", 800, "LowestPower" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Thec cackled in unerring confidence. Apollo stared with a calm vengeance. Taking a deep breath, he answered the Ripper's laugh with a determined smile. <br/>He would pay him the debt he is owed with his own hands."
	},
	["CT_NE_2-7"] = {
		Id = 13465134422,
		AltCards = {
			["CT_NE_6-7"] = { Name = "High Mobile NecroForensics Corporation Unit" },
			["CT_AP_8-1"] = {
				Name = "NecroForensics Headquarters",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Put 2 Blue studs into your baseplate, and 3 Lawyers of Last Moments into your graveyard. Whenver you Seance a card: allied fighters gain 100 power until your next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AddGenZone",
									{ "Blue Stud", 1 }
								},
								{
									"AddGenZone",
									{ "Blue Stud", 1 }
								},
								{
									"GraveAdd",
									{ "CT_NE_6-4" }
								},
								{
									"GraveAdd",
									{ "CT_NE_6-4" }
								},
								{
									"GraveAdd",
									{ "CT_NE_6-4" }
								}
							},
							Target = "Ally"
						},
						OnAllySeance = {
							Power = { { "TempStrengthen", 100, "Ally" } },
							Target = "Ally"
						}
					},
					Seancing = true
				}
			}
		},
		Name = "Mobile NecroForensics Corporation Unit",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Unshackled Mind",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Put 2 Blue studs into your baseplate, and 3 Prisoners in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"GraveAdd",
							{ "CT_NE_2-8" }
						},
						{
							"GraveAdd",
							{ "CT_NE_2-8" }
						},
						{
							"GraveAdd",
							{ "CT_NE_2-8" }
						}
					}
				}
			},
			Seancing = true
		},
		Bio = "The NeFoCo produce the Enzyme at an industrial scale, attracting idealists and opportunists alike."
	},
	["CT_NE_2-8"] = {
		Id = 14369389031,
		Name = "Prisoner",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Serving multiple life times."
	},
	["CT_CR_2-1"] = {
		Id = 12146828522,
		AltCards = {
			["CT_CR_6-1"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "If there's an allied zombified fighter, this card can't be countered.\nWhen this card dies: Draw 2 cards.",
					Ability = {
						OnAttack = {
							Power = { { "GivePassive", "CounterAttackBlock", nil, nil, nil, "OldLadyShout" } },
							Target = "Self",
							EffectRequirement = { "HasPassive", "Ally", 1, 9999, "Zombified" }
						},
						OnAttackEnd = {
							Power = { { "RemovePassive", "CounterAttackBlock" } },
							Target = "Self"
						},
						OnDeath = {
							Power = { { "Draw", 2 } },
							Target = "Ally"
						}
					}
				}
			}
		},
		Name = "Pent-up Pentagenarian",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Red",
		Cost = { Red = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If there's an allied zombified fighter, this card can't be countered.\nWhen this card dies: Draw a card.",
			Ability = {
				OnAttack = {
					Power = { { "GivePassive", "CounterAttackBlock", nil, nil, nil, "OldLadyShout" } },
					Target = "Self",
					EffectRequirement = { "HasPassive", "Ally", 1, 9999, "Zombified" }
				},
				OnAttackEnd = {
					Power = { { "RemovePassive", "CounterAttackBlock" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Kids these days are so ungrateful! Astarossa <b>built</b> this city!\""
	},
	["CT_CR_2-2"] = {
		Id = 12146821132,
		AltCards = {
			["CT_CR_6-2"] = { Health = 400 }
		},
		Name = "Defender of Democracy",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Lock a target enemy fighter for 1 turn.\nAt the start of your turns: Inject this card.",
			Ability = {
				OnSummon = {
					Power = { { "Lock", 1 } },
					Target = "SingleEnemy"
				},
				OnAllyStart = {
					Power = {
						{
							"AddCopy",
							30,
							"Self",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "Self" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Stoic, loyal, unerring; the characteristics to preserve the laws of the older times."
	},
	["CT_CR_2-3"] = {
		Id = 12182761718,
		AltCards = {
			["CT_CR_6-3"] = { Health = 700 }
		},
		Name = "Booming Boomer",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 3 },
		Overload = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you inject a card: This card gains 300 Power.",
			Ability = {
				OnAllyInject = {
					Power = { { "Strengthen", 300 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I was there as Astarossa transformed this city from run-down nothing to an economic powerhouse. Now, it's transforming into something far GREATER!\""
	},
	["CT_CR_2-4"] = {
		Id = 12288048834,
		AltCards = {
			["CT_CR_6-4"] = { Health = 800 }
		},
		Name = "Committee Crony",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Red = 1, Blue = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Inject a target allied fighter.\nWhenever you inject a card: You gain a Colourless stud.",
			Ability = {
				OnAllyInject = {
					Power = { { "Neutral", 1 } },
					Target = "Ally"
				},
				OnAttack = {
					Power = {
						{
							"AddCopy",
							30,
							"SingleAlly",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "SingleAlly" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Not all of Astarossa's cabinet are as noble or honest as him."
	},
	["CT_CR_2-5"] = {
		Id = 12288067926,
		AltCards = {
			["CT_CR_6-5"] = { Name = "Private Immortality House" }
		},
		Name = "Public Immortality House",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Cost = { Red = 0 },
		Color = "Blue",
		Terrain = true,
		Terrariant = "Unerring Temperance",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Red stud in your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Red Stud", 1 },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "\"We spend millions of Bloxbux a year caring for our aging population. If you aren't persuaded by the ethics of ending aging, be swayed by the economy.\"<br/>-Astarossa, Mayor of Bloxburg"
	},
	["CT_CR_2-6"] = {
		Id = 12144385409,
		AltCards = {
			["CT_CR_6-6"] = {
				Cost = { Neutral = 2, Red = 2, Blue = 2 }
			}
		},
		Name = "Absolute Authority",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 5, Red = 2, Blue = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Astarossa's Decree"] = "When a zombified card leaves play for any reason, obliterate it. This can trigger death effects, return effects, etc."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 800 damage to all non-Zombified fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 800 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasntPassive",
						Modifier = "Zombified"
					}
				}
			}
		},
		Bio = "40 years of uninterrupted power creates an iron fist, regardless of the citizen's mandate."
	},
	CT_EX_2_1 = {
		Id = 13626617397,
		Name = "Resin Amalgamation",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Zombified = true,
		Archetype = "Extant",
		Cost = { Red = 1, Blue = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Divide all Extant cards into two smaller copies of themselves.",
			Ability = {
				OnSummon = {
					Power = { { "SummonSplit", 2, "Archetype" } },
					Target = "Self"
				}
			}
		},
		Bio = "Caitlin was shocked to see how the Extants made use of resin trees, using them to form large beasts born for protecting the lands they inhabited."
	},
	CT_EX_2_2 = {
		Id = 13293083114,
		Name = "Extant Titanboa",
		AltCards = {
			CT_EX_6_2 = { Health = 400 }
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Archetype = "Extant",
		Cost = { Red = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Allied fighters gain 50 power for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They dominated with their strength, until the responsibility of such power crushed them."
	},
	CT_EX_2_3 = {
		Id = 13293030457,
		Name = "Extant Smilodon",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Archetype = "Extant",
		Cost = { Green = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: You gain a Colourless Stud for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{ "Neutral", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They thrived with their vitality, until life became an excess waste."
	},
	CT_EX_2_4 = {
		Id = 13293028240,
		Name = "Extant Anomalocaris",
		AltCards = {
			CT_EX_6_4 = {
				Effect = {
					Name = "Haydoscale",
					Description = "When this card dies: Give yourself a one colourless stud costed Necroenzyme Vial for each Extant fighter that's died since your last end step.",
					Ability = {
						OnDeath = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
									"Self"
								},
								{
									"RepeatingAdd",
									{ "CT_Vial", "Variable" },
									"Ally"
								}
							},
							Target = "Self",
							MetaData = {
								Cost = { Neutral = 1 }
							}
						}
					},
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		Archetype = "Extant",
		Cost = { Blue = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Give yourself a Necroenzyme Vial for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"RepeatingAdd",
							{ "CT_Vial", "Variable" },
							"Ally"
						}
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They prided themselves over their intellect, up until they learnt too much."
	},
	CT_EX_2_5 = {
		Id = 13293033516,
		Name = "Extant Archaeopteryx",
		AltCards = {
			CT_EX_6_5 = { Health = 200, Power = 300 }
		},
		Health = 100,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Archetype = "Extant",
		Cost = { Yellow = 1 },
		Summonant = "CT_EX_2_5T",
		CustomReminder = {
			Offspring = "A free 100/100 Yellow fighter, inert in all zones.",
			["Bound from Resin"] = "This card counts dead enemy Extants too."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Summon a 100/100 Offspring for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"RepeatingSummon",
							{ "Summonant", "Variable" },
							"Ally"
						}
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They revelled in their large numbers, up until sustenance was no longer possible."
	},
	CT_EX_2_5T = {
		Id = 13465135304,
		Name = "Offspring",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Archetype = "Extant",
		Cost = { Neutral = 0 },
		TokenOmni = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Nil = {
					Power = { {
						"AlterEV",
						{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"What mendacious simpleton would dare suggest we evolved from these maggots?\" -Grimclaw the Sacred"
	},
	CT_EX_2_6 = {
		Id = 13626617397,
		Name = "Resin Nest",
		AltCards = {
			CT_EX_6_6 = {
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: put a stud of each colour into your baseplate.\nAt the start of your turns: Summon an Extant.",
					Ability = {
						OnAllyStart = {
							Power = { {
								"RandomSummon",
								{ "CT_EX_2_2", "CT_EX_2_3", "CT_EX_2_4", "CT_EX_2_5" },
								"Ally"
							} },
							Target = "Self"
						},
						OnSummon = {
							Power = {
								{
									"AddGenZone",
									{ "Red Stud", 1 },
									"Ally"
								},
								{
									"AddGenZone",
									{ "Blue Stud", 1 },
									"Ally"
								},
								{
									"AddGenZone",
									{ "Green Stud", 1 },
									"Ally"
								},
								{
									"AddGenZone",
									{ "Yellow Stud", 1 },
									"Ally"
								}
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Terrain = true,
		Archetype = "Extant",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Put a stud of each colour into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Red Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Green Stud", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Caitlin was shocked to see how the Extants made use of resin trees, using them to form large beasts born for protecting the lands they inhabited."
	},
	CT_EX_2_7 = {
		Id = 13465133332,
		Name = "Extant Release",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Extant",
		Cost = { Neutral = 2, Green = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter loses 200 Power.\nSearch your deck for two fighter cards that each cost 1 or fewer total studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 200, "Single" },
						{ "RandomTutorfor", "Fighter 1orExactCost" },
						{ "RandomTutorfor", "Fighter 1orExactCost" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Preserved in voidoak amber for 20,000 years, the last remnants of the World of Wood will fight for their new home.\""
	},
	["CT_AS_4-1"] = {
		Id = 13292980427,
		Name = "Astral Faith Evangel",
		Health = 300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied Zombified fighter dies, if this card's in your graveyard: Recur this card.",
			Ability = {
				OnAllyDeath = {
					Power = { {
						"MoveZone",
						{ "CT_AS_4-1", "GraveZone_Ally", "Hand_Ally", false, false },
						"Self"
					} },
					Target = "Self",
					Zombified = true,
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"What bootlicking cretins.\" <br/>-Astarossa, Mayor of Bloxburg"
	},
	["CT_AS_4-2"] = {
		Id = 13292988085,
		Name = "Astral Faith Zealot",
		Health = 700,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All allied Zombified fighters gain 50 Health and Power and Overload.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 50 },
						{ "Strengthen", 50 },
						{ "GivePassive", "Overload" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "Zombified"
					}
				}
			}
		},
		Bio = "\"Brothers! The Dread Priest's wisdom has granted us life eternal! And the foolish heretics who still cling to their flesh leech off his divine provenance!\""
	},
	["CT_AS_4-3"] = {
		Id = 14346555060,
		Name = "Astral Faith Follower",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Draw a card. Inject this card.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "AddCopy", 30, "Self" },
						{
							"Destroy",
							30,
							"Self",
							nil,
							nil,
							nil,
							"SingleInject"
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Thoughts and prayers."
	},
	["CT_AS_4-4"] = {
		Id = 12288059819,
		Name = "Join the Cause",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 1 },
		EffectAnimation = "SingleInject",
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target allied fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" }
					},
					Target = "Single",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true,
			AddCopyToOwner = true
		},
		Bio = "Those of the Enzyme must keep taking it to stay alive; Astarossa would condemn the Astral Faith if he knew about their grizzly recruitment strategy."
	},
	["CT_AS_4-5"] = {
		Id = 12288048834,
		Name = "Committee Crony",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Red = 1, Blue = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Inject a target allied fighter.\nWhenever you inject a card: You gain a Colourless stud.",
			Ability = {
				OnAllyInject = {
					Power = { { "Neutral", 1 } },
					Target = "Ally"
				},
				OnAttack = {
					Power = {
						{
							"AddCopy",
							30,
							"SingleAlly",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "SingleAlly" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Not all of Astarossa's cabinet are as noble or honest as him."
	},
	["CT_AS_4-6"] = {
		Id = 14362045396,
		Name = "Church of the Astral Faith",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Cost = { Red = 0 },
		Color = "Blue",
		Terrain = true,
		Terrariant = "Unerring Temperance",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put 2 Blue Studs in your baseplate. Whenever you inject a fighter: Generate a Colourless stud.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Blue Stud", 2 },
						"Ally"
					} },
					Target = "Ally"
				},
				OnAllyInject = {
					Power = { { "Neutral", 1 } },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = { { "Tutorfor", "CT_AS_4-7" } },
					EffectRequirement = { "Playertable", "Me", 0, 1999, "Life" },
					Target = "Ally"
				}
			}
		},
		Bio = "Blessings be with you."
	},
	["CT_AS_4-7"] = {
		Id = 14346555346,
		Name = "LeBlanc, Dread Priest",
		Health = 1200,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Storm",
		Archetype = "Substantial",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Red = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Requirement = { "Playertable", "Me", 0, 1999, "Life" },
		SummonAnimation = "DreadPriest",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Cast only when below 2000 Life. During your end step: Inject a card in your graveyard.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "All", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Not all of Astarossa's cabinet are as noble or honest as him."
	},
	["CT_AS_4-8"] = {
		Id = 12146825230,
		Name = "Disenfranchise",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Neutral = 2, Red = 2, Blue = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject 2 non-colourless cards in your Baseplate.\nPut a Red Stud and a Blue Stud into your Baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Colored", "GenZone_Ally", "Hand_Ally", true, false }
						},
						{
							"MoveZone",
							{ "Colored", "GenZone_Ally", "Hand_Ally", true, false }
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			}
		},
		Bio = "The Astral Faith, a hardcore sect of the CRP, see being mortal as evil, as a burden on healthcare and the economy. Such evil should be outlawed."
	},
	["CT_NE_4-1"] = {
		Id = 14545321387,
		Name = "Brutal Justice Mk.III",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		Archetype = "Substantial",
		AttackEffect = "Missile",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 4 },
		EffectVariable = 2500,
		Zombified = true,
		TargetImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Seance two cards from your graveyard. When this card dies: Summon its weakpoint with health equal to what it last had.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						}
					},
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				},
				OnDeath = {
					Power = { { "Summon", "CT_NE_4-2" } },
					Target = "Ally",
					MetaData = { Health = "Variable" }
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "The latest in NeFoCo security solutions, Equipped with the finest military-grade weapons, Funded by Apate."
	},
	["CT_NE_4-2"] = {
		Id = 14545323404,
		Name = "Brutal Justice Core",
		Health = 2500,
		Power = 0,
		Rarity = "Token",
		Archetype = "Substantial",
		AttackEffect = "LaserYellow",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		EffectVariable = 2500,
		Zombified = true,
		TargetImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: your opponent wins the game.\nAt the start of your turns: Obliterate this card and summon Brutal Justice Mk.III",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Summon", "CT_NE_4-1" },
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "EffectVariable", "Nil", "Target" },
							"SummonedCard"
						},
						{ "Obliterate" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Inflict", 99999, "Self" } },
					Target = "Ally"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "...Just ignore the giant glowing weakpoint."
	},
	["CT_NE_4-3"] = {
		Id = 14545325069,
		Name = "Overclock",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 4 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Brutal Justice gains 300 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 300 } },
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_NE_4-4"] = {
		Id = 14565668082,
		Name = "Full Throttle",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Brutal Justice gains Dextrous.",
			Type = "OnSummon",
			Power = { { "GivePassive", "Dextrous" } },
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_NE_4-5"] = {
		Id = 14565671495,
		Name = "Exhaust Purge",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "All enemy fighters lose 100 power. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100, "Opponent" },
				{ "Draw", 1, "Ally" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_NE_4-6"] = {
		Id = 14565656604,
		Name = "Revving up...",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Terrain = true,
		AttackEffect = "Null",
		DiscardBlock = true,
		Color = "Neutral",
		Cost = { Blue = 5 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Brutal Justive is charging it's special attack and it will be ready at the start of the next turn.",
			Type = "OnAllyStart",
			Power = {
				{ "Add", "CT_NE_4-6_Token", "Ally" },
				{ "DestroyTerrain", 30, "Self" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_NE_4-6_Token"] = {
		Id = 14565673770,
		Name = "Bullet Saturation",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Green = 0 },
		EffectAnimation = "ShootAllMinigun",
		Effect = {
			Name = "Assist Trophy!",
			Description = "Deal 400 damage to all enemy fighters. They lose 400 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 400, "Opponent" },
				{ "Weaken", 400, "Opponent" }
			},
			Target = "Opponent"
		},
		Bio = ""
	},
	["CT_NE_4-7"] = {
		Id = 14565658343,
		Name = "Detainment Procedure",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 5 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Lock a target enemy fighter for 10 turns. Put a Prisoner into your graveyard.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 10 },
				{
					"GraveAdd",
					{ "CT_NE_2-8" }
				}
			},
			Target = "SingleEnemy"
		},
		Bio = ""
	},
	["CT_NE_4-8"] = {
		Id = 14565661097,
		Name = "Self-Repair",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Brutal Justice gains 500 health.",
			Type = "OnSummon",
			Power = { { "Heal", 500, "Ally" } },
			Target = "SingleEnemy"
		},
		Bio = ""
	},
	["CT_NE_4-9"] = {
		Id = 14565662513,
		Name = "Call for Reinforcements",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Seance 4 cards in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "5OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "5OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "5OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "5OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						}
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
		Bio = ""
	},
	["CT_GR_4-1"] = {
		Id = 13293221742,
		Name = "Grimclaw The Sacred",
		Health = 4500,
		Power = 150,
		Rarity = "Token",
		Archetype = "Substantial",
		AttackEffect = "LaserGreen",
		SummonAnimation = "SummonGrimclawSacred",
		TargetImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Your opponent wins the game.\nWhen this card attacks: Destroy the top card of your opponent's deck.",
			Ability = {
				OnDeath = {
					Power = { { "Inflict", 99999, "Self" } },
					Target = "Self"
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "A dragon of pure destruction brought back by profane creation. Greygnarl did not succeed."
	},
	["CT_GR_4-2"] = {
		Id = 14253658306,
		Name = "Dragon Dance",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Grimclaw gains 200 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-3"] = {
		Id = 14253658306,
		Name = "Outrage",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Green = 1, Neutral = 4 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Grimclaw gains 200 Power and Overload.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{ "GivePassive", "Overload" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-4"] = {
		Id = 14253658306,
		Name = "Roost",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Grimclaw gains 500 Health and Regenerating",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "GivePassive", "Regen" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-5"] = {
		Id = 14253658306,
		Name = "Tailwind",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Green = 5 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Grimclaw gains 300 Power and Dextrous.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 300 },
				{ "GivePassive", "Dextrous" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-6"] = {
		Id = 14253658306,
		Name = "Dragon Tail",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Return a target enemy fighter to the hand. Draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Return", 30, "TargetEnemy" },
				{ "Draw", 2, "Ally" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-7"] = {
		Id = 14253658306,
		Name = "Charging...",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Terrain = true,
		AttackEffect = "Null",
		DiscardBlock = true,
		Color = "Neutral",
		Cost = { Green = 4 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Grimclaw is charging his special attack and it will be ready at the start of the next turn.",
			Type = "OnAllyStart",
			Power = {
				{ "Add", "CT_GR_4-7_Token", "Ally" },
				{ "DestroyTerrain", 30, "Self" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["CT_GR_4-7_Token"] = {
		Id = 13293163323,
		Name = "Grimclaw's Charged Moonbreath",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Green = 0 },
		EffectAnimation = "ScorchBreathEnemy",
		Effect = {
			Name = "Assist Trophy!",
			Description = "Deal 700 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 700, "Opponent" } },
			Target = "Opponent"
		},
		Bio = ""
	},
	["CT_GR_4-8"] = {
		Id = 14253658306,
		Name = "Earthquake",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "Deal 200 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "Opponent" } },
			Target = "Opponent"
		},
		Bio = ""
	},
	["CT_FL_8-0"] = {
		Id = 13293181124,
		Name = "Embrace the PLURRALITY",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Give your opponent the opportunity to give in.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "CT_FL_8-1_Token", "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "hii"
	},
	["CT_FL_8-1"] = {
		Id = 13293181124,
		Name = "The PLURRALITY",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Toxic Positivity",
		Effect = {
			Name = "Haydoscale",
			Description = "Add 2 Yellow studs to your baseplate.\nEnter Bliss.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Yellow Stud", 2 }
						},
						{
							"RepeatingSummon",
							{ "Zombified Catgirl", 4 },
							"Ally"
						},
						{ "Destroy", 30, "Ally" }
					},
					Target = "Self"
				},
				OnAllyStart = {
					Power = { { "Tutorfor", "CT_FL_8-5" } },
					EffectRequirement = { "Playertable", "Me", 0, 2001, "Life" },
					Target = "Ally"
				}
			}
		},
		Bio = "The club of the PLURRALs allows people to drown their sorrows away in pleasure."
	},
	["CT_FL_8-1_Token"] = {
		Id = 14346162400,
		Name = "Give In",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "Lose.",
			Ability = {
				OnSummon = {
					Power = { { "SetLife", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Do it. :3"
	},
	["CT_FL_8-2"] = {
		Id = 13293181124,
		Name = "Wet Shrapnel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 3, Yellow = 1, Green = 2 },
		EffectVariable = 0,
		EffectAnimation = "WetShrapnel",
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter. Deal 250 damage to all enemy fighters and transform them into Zombified Catgirls.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly", nil, nil, "WetShrapnel" },
						{ "Damage", 250, "Opponent" },
						{ "Transform", "Zombified Catgirl", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Death will always find a way to bring further misery."
	},
	["CT_FL_8-3"] = {
		Id = 13293181124,
		Name = "Bloxburg Under Siege",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 4, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Summon 8 150/150 Zombified Catgirls.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingSummon",
						{ "Zombified Catgirl", 8 },
						"Ally"
					} },
					MetaData = { Health = 150, Power = 150 },
					Target = "Self"
				}
			}
		},
		Bio = "hehe xd"
	},
	["CT_FL_8-4"] = {
		Id = 13293188256,
		Name = "Your Authentic Self",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate a target enemy fighter, summon an unlocked copy of that fighter, then transform it into a Zombified Catgirl that has Defender.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleEnemy"
						},
						{ "Obliterate", 30, "SingleEnemy" },
						{ "Summon", "Variable", "Ally" },
						{ "Unlock", 9999, "SummonedCard" },
						{ "Transform", "Zombified Catgirl", "SummonedCard" }
					},
					MetaData = { Shield = true },
					Target = "EVCardOwner"
				}
			}
		},
		Bio = "The broken body that was, or the broken brain that is. Which one could claim to be the real Caitlin?"
	},
	["CT_FL_8-5"] = {
		Id = 13293133622,
		Name = "Catlyn Nyaxon, Hunter",
		Health = 2500,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Axe",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		TargetImmune = true,
		DiscardBlock = true,
		DamageImmune = true,
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		SummonAnimation = "Catlyn",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://13482994684", "rbxassetid://13482994871" },
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Obliterate a target enemy fighter, summon a copy of that fighter, then transform it into a Zombified Catgirl. Put 3 Yellow Studs in your baseplate.\nWhenever an allied fighter dies: This card gains 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleEnemy"
						},
						{ "Obliterate", 30, "SingleEnemy" },
						{ "Summon", "Variable", "Ally" },
						{ "Transform", "Zombified Catgirl", "SummonedCard" },
						{
							"AddGenZone",
							{ "Yellow Stud", 3 },
							"Ally"
						}
					},
					Target = "EVCardOwner"
				},
				OnAllyDeath = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "A wish to provide someone a chance at a life filled with nothing but happiness, twisted into degeneracy and desperation."
	},
	["CT_FL_8-6"] = {
		Id = 12145023660,
		Name = "Raving Rascal",
		Health = 150,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Destroy a target allied fighter, then summon a 100/100 Zombified Catgirl. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly", nil, nil, "BlissTriggerRed" },
						{ "Summon", "Summonant", "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Unable to cope with her mounting regret, Sarah turned to what kept her going in her youth: Parties that go so hard you can't think."
	},
	["CT_MC_8-0"] = {
		Id = 12154433978,
		Name = "Defiant March",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		Terrain = true,
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Neutral = 0 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Red and Green stud in your baseplate.\nWhenever a fighter with Fading is cast: That fighter gains 200 Health and Power, then put a Red stud in your baseplate.",
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
						}
					},
					Target = "Ally"
				},
				OnAnySummon = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						}
					},
					Target = "Aggressor",
					Fading = true
				},
				OnAllyStart = {
					Power = { { "Tutorfor", "CT_MC_8-3" } },
					EffectRequirement = { "Playertable", "Me", 0, 2001, "Life" },
					Target = "Ally"
				}
			}
		},
		Bio = "The people of Bloxburg would not, <i>will not,</i> ever stand for the exploitation of mortality."
	},
	["CT_MC_8-1"] = {
		Id = 12506946858,
		Name = "Bloxburg Protestors",
		AltCards = {
			["CT_MC_8-1_Token"] = {
				Id = 14346324439,
				Color = "Red",
				Rarity = "Token",
				Summonant = "CT_MC_8-1",
				Effect = {
					Name = "Damage for Top Deck",
					Description = "When this card is cast: Summon a clone of it, except it's Green",
					Type = "OnSummon",
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 3 },
		Summonant = "CT_MC_8-1_Token",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Red.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Can't we just have a WHOLE century without anything bad happening for Pete's sake?!"
	},
	["CT_MC_8-2"] = {
		Id = 14368345913,
		Name = "Checkpoint Security",
		Health = 500,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Liberate = true,
		Color = "Red",
		Cost = { Red = 2, Green = 2 },
		GraveAddant = "CT_MC_8-2",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "Whenever this card destroys another: Put a copy of this card to your graveyard.",
			Ability = {
				OnDestroy = {
					Power = { { "GraveAdd", "GraveAddant" } },
					Target = "Self"
				}
			}
		},
		Bio = "Those who sought to flee the town with their supplies of the necroenzyme were met with brute force."
	},
	["CT_MC_8-3"] = {
		Id = 14362045715,
		Name = "Bloxburg in Solidarity",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Liberate = true,
		Color = "Green",
		Cost = { Neutral = 0 },
		DiscardBlock = true,
		TargetImmune = true,
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon 4 fighters from your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Those who sought to bring down Bloxburg would face its wrath, whether in it's victory or it's destruction."
	},
	["CT_MC_8-4"] = {
		Id = 13293089868,
		Name = "Zoomba Rebel",
		Health = 550,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Neutral = 1, Red = 3, Green = 2 },
		EffectVariable = 0,
		EffectAnimation = "Zoomba",
		Liberate = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Reveal the oldest card in your opponent's hand. \nDestroy it if it's not cast by its next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealCard" },
						{ "GivePassive", "Fleeting" }
					},
					Target = "EnemyLeftMostHand"
				}
			}
		},
		Bio = "A zoomba's finanical insurance is barely enough to compensate for its existential pain."
	},
	["CT_MC_8-5"] = {
		Id = 12170683844,
		Name = "McKayla, Bane of Hierarchy",
		Health = 1350,
		Power = 350,
		BottomDeck = true,
		NotInMulligan = true,
		Rarity = "Token",
		AttackEffect = "Crowbar",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Zombie Freedom Fighter"] = "You can cast cards with Liberate in your graveyard if you've attacked and destroyed a fighter this turn. Cards cast this way are fading."
		},
		SummonAnimation = "McKaylaSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Set your life to 2000. Each card in your graveyard gains Liberate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetLife", 2000, "Self" },
						{ "GivePassive", "Liberate" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "All"
					}
				}
			}
		},
		Bio = "\"Don't mess with me!\""
	},
	["CT_AS_8-1"] = {
		Id = 13292977574,
		Name = "Astarossa Van Buren",
		Health = 1500,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminderInject = true,
		SummonAnimation = "Astarossa2Summon",
		SummonedAnimation = "Astarossa2Summon",
		SummonAnimationEffect = true,
		TargetImmune = true,
		DiscardBlock = true,
		PreloadAssets = { "rbxassetid://245854775", "rbxassetid://13624260457" },
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a card: Inject a card in your graveyard.",
			Ability = {
				OnAllySummon = {
					Power = { {
						"MoveZone",
						{ "All", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				},
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{ "All", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "\"The Necroenzyme's use should benefit those who need it the most, and its control onto those who desire it the least.\""
	},
	["CT_AS_8-2"] = {
		Id = 13293020071,
		Name = "Egregious Entryism",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject the top card of your deck thrice.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "GraveZone_Ally", false, true },
							"Self"
						},
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "Hand_Ally", false, true },
							"Self"
						},
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "Hand_Ally", false, true },
							"Self"
						},
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "Hand_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "\"These Astral Faith imbeciles would kidnap and immortalise others in my name? I've seen greater intelligence in wall grout.\"<br/>- Astarossa, Mayor of Bloxburg"
	},
	["CT_AS_8-3"] = {
		Id = 13293073801,
		Name = "Schism in the Party",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 3, Blue = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 4 cards. Remove a {W} from each card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 4, "Ally" },
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" },
							"AllyHand"
						}
					},
					Target = "Self"
				}
			},
			Injecting = true
		},
		Bio = "Immortality isn't a good thing for one's humanity. The select few of Astarossa's committee who realized this were the lucky ones."
	},
	["CT_CA_8-1"] = {
		Id = 12144951241,
		Name = "Caitlin, Paladin of Nature",
		Health = 2000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Battleaxe",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Shield = true,
		TargetImmune = true,
		DiscardBlock = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		SummonAnimation = "CaitlinSummon",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://12561612561" },
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you Recur a card: Give yourself a 800/800 copy of that card.",
			Ability = {
				OnAllyRecur = {
					Power = { { "AddCopy", 30, "Aggressor" } },
					Target = "Self",
					MetaData = { Health = 800, Power = 800 }
				}
			}
		},
		Bio = "Thoughts of using the necroenzyme on her old body were a thing of the past. She's found her life's purpose years ago."
	},
	["CT_CA_8-2"] = {
		Id = 13293002786,
		Name = "Datasurge",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Neutral = 2, Blue = 3 },
		EffectVariable = 0,
		EffectAnimation = "Datasurge",
		Fading = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Recur the top card of your graveyard five times.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "No time for buffering out!"
	},
	CT_SK_4_1 = {
		Id = 76822736302744,
		Name = "Captain Skewerglee",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Archetype = "Substantial",
		GraveDestroyIgnore = true,
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Description = "Whenever you cast a fighter: Ransack 3. If you do: Allied fighters gain 100 health and power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "ResetRansack", "Math", 0, "Nil" },
							"Self"
						},
						{ "AutoGraveDestroy", 3, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Having to protect people outside the Familey is a strange thing, but they've got experience."
	},
	CT_SK_4_2 = {
		Id = 12146801792,
		Name = "Skewerglee Resilence",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Requirement = { "Playertable", "Me", 0, 1001, "Life" },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Description = "Recur Captain Skewerglee, then put twelve Snickering Skewers in your graveyard and two in your hand",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "CT_SK_4_1", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						},
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "GraveAdd", "CT_SM_2-4", "Ally" },
						{ "Add", "CT_SM_2-4", "Ally" },
						{ "Add", "CT_SM_2-4", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CT_SK_4_3 = {
		Id = 121367612608915,
		Name = "Torturing Turncoat",
		Health = 800,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "British",
		Color = "Red",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Neutral = 2, Red = 2, Yellow = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns: shuffle a Wounded into your opponent's deck. It's added to their current run's deck.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"RunAddCardFromPool",
							{ "CT_Bad_1" },
							"Opponent"
						},
						{ "DeckAdd", "CT_Bad_1", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The only way to free yourself from the Smilies' cruel torture is an answer they want."
	},
	CT_KI_8_1 = {
		Id = 13465139622,
		Name = "Harrison's Studio",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		TriggerInGenZone = true,
		DiscardBlock = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: put it into your opponent's baseplate.\nAt the start of your turns, while this is in your baseplate: Ransack 1. If you don't, You opponent summons a 300/300 Statue with Defender.",
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
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "a card to Ransack",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckFail = {
					Power = { { "Summon", "CT_KI_8_1T", "Opponent" } },
					Target = "Self"
				},
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "CT_KI_8_1", 1 },
						"Opponent"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Kingrin is a humble yet passionate artist, with terror as his medium and gore as his paint."
	},
	CT_KI_8_1T = {
		Id = 13293150658,
		Name = "Statue",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		RansackCount = 0,
		Shield = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { {
						"AddGenZone",
						{ "CT_KI_8_1", 1 },
						"Opponent"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "His work can only be described as \"Bloody Brilliant\""
	},
	CT_KI_8_2 = {
		Id = 106401463510004,
		Name = "Kingrin, Lord of Rubble",
		Health = 2500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		RansackCount = 0,
		SummonAnimation = "KingrinSummon",
		SummonAnimationEffect = true,
		Overload = true,
		Charge = true,
		TargetImmune = true,
		GraveDestroyIgnore = true,
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this attacks and destroys another: all other allied fighters gain power equal to the destroyed fighter's power. Put Harrison's Studio into your opponent's Baseplate.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Strengthen", "Variable", "CustomTarget" },
						{
							"AddGenZone",
							{ "CT_KI_8_1", 1 },
							"Opponent"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
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
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "A father's weakness is his strength: Family."
	},
	["CT_DJ_4-1"] = {
		Id = 14819805572,
		Name = "DJ KIT-10",
		Health = 1500,
		Power = 200,
		Rarity = "Token",
		Archetype = "Substantial",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		OmniImmune = true,
		AttackBlock = true,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Summon two Bass-Boosted Speakers.\nDuring your end step: Summon two Zombified Catgirls, then all allied fighters gain 50 health and power for each fighter that died during your turn. Repeat this effect if you're in bliss.\nWhen this card dies: Your opponent wins the game.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"RepeatingSummon",
							{ "Summonant", 2 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "AllDeathStorm", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "AllDeathStorm", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" },
							"Self"
						}
					},
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{
							"RepeatingSummon",
							{ "Summonant", 2 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Playertable", "AllDeathStorm", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "GivePassive", "Overload" },
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				},
				OnSummon = {
					Power = {
						{ "Summon", "CT_DJ_4-1T" },
						{ "Summon", "CT_DJ_4-1T" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Inflict", 99999, "Self" } },
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "No amount of noise complaints or uninvented guests are going to stop her beats from shaking all of Bloxburg."
	},
	["CT_DJ_4-1T"] = {
		Id = 14819803032,
		Name = "Bass-Boosted Speaker",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		TokenOmni = true,
		StrengthenImmune = true,
		AttackBlock = true,
		Shield = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Deal 50 damage to all fighters. If you're in bliss: All enemy fighters lose 50 power.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Damage", 50, "All" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{ "Weaken", 50, "Opponent" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Concerns about hearing damage from high volumes don't matter when you can't feel pain in the first place."
	},
	["CT_DJ_4-2"] = {
		Id = 154415613674,
		Name = "Record Scratch",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 300 damage to an enemy fighter",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 300, "SingleEnemy" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["CT_DJ_4-3"] = {
		Id = 15441560678,
		Name = "Hypnotic Beat",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Terrain = true,
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your next turn: steal a target enemy fighter, it gains defender and is removed from their current run deck. Then destroy this card",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "RunRemoveCardAsEnemy", nil, "Self" },
						{ "GivePassive", "Shield" },
						{ "Steal" },
						{ "DestroyTerrain", 30, "Ally" }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = ""
	},
	["CT_DJ_4-4"] = {
		Id = 15441561185,
		Name = "Amp Up",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Allied fighters gain 400 power until your next end step.",
			Ability = {
				OnSummon = {
					Power = { { "TempStrengthen", 400, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["CT_DJ_4-5"] = {
		Id = 15441560859,
		Name = "Bouncer Backup",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon an Excited Bouncer and trigger its effect.",
			Ability = {
				OnSummon = {
					Power = { { "SummonWithEffect", "Excited Bouncer", "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["CT_DJ_4-6"] = {
		Id = 15441560554,
		Name = "Sound System Resupply",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Minigun",
		Logo = "Plurral",
		SearchTerms = "Plurral",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon a Bass-Boosted Speaker.",
			Ability = {
				OnSummon = {
					Power = { { "SummonWithEffect", "CT_DJ_4-1T", "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["CT_ER_4-1"] = {
		Id = 14632241464,
		Name = "Eric Newman",
		Health = 2000,
		Power = 400,
		Rarity = "Token",
		Archetype = "Substantial",
		AttackEffect = "Rifle",
		Color = "Red",
		Cost = { Green = 1, Red = 1 },
		Requirement = { "Playertable", "Me", 0, 1999, "Life" },
		DiscardBlock = true,
		AddBlock = true,
		PlayTest = true,
		Liberate = true,
		Effect = {
			Description = "Whenever this card attacks and destroys another: Remove the stud cost of all cards in your hand with Liberate.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"IncreaseCost",
							{ -100, "Neutral", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Red", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Green", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Blue", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Yellow", "Nil" },
							"CustomTarget"
						},
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "HasPassive",
						Modifier = "Liberate"
					}
				}
			}
		},
		Bio = "\"Immortality destroyed my home. It won't destroy my daughter's.\""
	},
	["CT_ER_4-2"] = {
		Id = 13292974002,
		Name = "Newman's Advocate",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Red = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All cards in play and in your hand lose Fading.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RemovePassive", "Fading" },
						{ "RemovePassive", "Fading", "AllyHand" }
					},
					Target = "All"
				}
			}
		},
		Bio = "\"If you wanna keep that beard, start talking, Bigshot.\""
	},
	["CT_ER_4-3"] = {
		Id = 14905817738,
		Name = "Emergency Rations",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 2, Green = 1 },
		EffectVariable = 0,
		PlayTest = true,
		Liberate = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains 300 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 300 },
						{ "Heal", 300 }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "\"The people need help. We can't back down when we're so close to ending this nightmare.\"<br/>- Eric Newman"
	},
	["CT_ER_4-4"] = {
		Id = 14632222687,
		Name = "Violent Larcenist",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 2, Green = 2, Neutral = 1 },
		EffectVariable = 1,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a card with Liberate leaves your graveyard: Your opponent loses a Colourless stud and you gain a Red and Green stud. This ability triggers only once per turn.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					Liberate = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", -1, "Opponent" },
						{ "Red", 1, "Ally" },
						{ "Green", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEnemyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "For some Lordbreakers, the hatred of immortality trumps the love of their city."
	},
	["CT_AP_8-2"] = {
		Id = 13293035985,
		Name = "Faith and Integrity, Twin Arms",
		Health = 1250,
		Power = 1250,
		Rarity = "Epic",
		AttackEffect = "ApolloAttack",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		TargetImmune = true,
		DiscardBlock = true,
		DamageImmune = true,
		Dextrous = true,
		Requirement = { "Playertable", "Me", 0, 2001, "Life" },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Seance the bottom two cards of your opponent's deck.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
						}
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
		Bio = "\"Thank you, Thec.\"<br/>Apollo smiled at the man who destroyed his parents and his childhood. \"You forced me to put my intellect to good use just to be a person. Just to be respected. I would never have been half the man I am without you. So come.\"<br/>Apollo caressed his mechanical arms.<br/>\"Let me show you the fruits of your labour!\""
	},
	["CT_AP_8-3"] = {
		Id = 12560327965,
		Name = "Professional Necroforensic Researcher",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Swamp",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Blue = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks or dies: Seance a card in your Graveyard that costs 4 or fewer total studs.\nWhenever an enemy fighter dies: Destroy the bottom card of your opponent's deck. Put it into your graveyard.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				},
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				},
				OnEnemyDeath = {
					Power = { {
						"MoveZone",
						{ "BottomCard", "Deck_Opponent", "GraveZone_Ally", false, false },
						"Self"
					} },
					Target = "Self"
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"We're building the future. We're changing the world. We're saving the people.\""
	},
	["CT_AP_8-4"] = {
		Id = 12463901399,
		Name = "Professional Morgue Merchant",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Swamp",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seance two cards in your Graveyard that each cost 4 or fewer total studs. All allied fighters gain 100 Power until the next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{ "TempStrengthen", 100, "Ally" }
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
		Bio = "Providing a service reliant reviving the dead could never keep its integrity."
	},
	["Acolyte of the Tribes-CT"] = {
		Id = 6886660260,
		Name = "Acolyte of the Tribes",
		AltCards = {
			["YellowTribes-CT"] = { Id = 6886661369, Color = "Yellow", Rarity = "Token" }
		},
		Health = 800,
		Power = 100,
		Rarity = "Uncommon",
		AddBlock = true,
		AttackEffect = "MagicYellow",
		EffectAnimation = "AcolyteYellow",
		Archetype = "Acolyte",
		Color = "Green",
		Cost = { Neutral = 4 },
		Summonant = "YellowTribes-CT",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Yellow.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Why focus on their differences? They're all my strength!"
	},
	["Acolyte of the Champions-CT"] = {
		Id = 6886671242,
		Name = "Acolyte of the Champions",
		AltCards = {
			["GreenChampion-CT"] = { Id = 12703345080, Color = "Green", Rarity = "Token" }
		},
		Health = 800,
		Power = 100,
		AddBlock = true,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "AcolyteGreen",
		Archetype = "Acolyte",
		Color = "Red",
		Cost = { Neutral = 4 },
		Summonant = "GreenChampion-CT",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Green.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "My strength and life, I dedicate to them!"
	},
	["Acolyte of the Storm-CT"] = {
		Id = 6886681005,
		Name = "Acolyte of the Storm",
		AltCards = {
			["RedStorm-CT"] = { Id = 6886683392, Color = "Red", Rarity = "Token" }
		},
		Archetype = "Acolyte",
		Health = 800,
		Power = 100,
		Rarity = "Uncommon",
		AddBlock = true,
		AttackEffect = "MagicRed",
		EffectAnimation = "AcolyteRed",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Summonant = "RedStorm-CT",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Red.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Combining the calmest breeze with the harshest winds, that's what it means to tend the Storm."
	},
	["Hedonist Acolyte-CT"] = {
		Id = 6886652536,
		Name = "Hedonist Acolyte",
		Archetype = "Acolyte",
		Summonant = "YellowHedonist-CT",
		AltCards = {
			["YellowHedonist-CT"] = {
				Id = 6886654238,
				CopyBodge = "YellowHedonist",
				Color = "Yellow",
				Rarity = "Token"
			}
		},
		Health = 800,
		Power = 100,
		AddBlock = true,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "AcolyteYellow",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Yellow.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "I'M DIRTY RICH AND DIRTY HAPPY AHAHAHAH!!!!"
	},
	["Fried One Cultist-CT"] = {
		Id = 6886663948,
		Name = "Acolyte of the Future",
		AltCards = {
			["BlueFuture-CT"] = { Id = 6886665144, Color = "Blue", Rarity = "Token" }
		},
		Health = 800,
		Power = 100,
		Rarity = "Uncommon",
		AddBlock = true,
		AttackEffect = "MagicBlue",
		EffectAnimation = "AcolyteBlue",
		Archetype = "Acolyte",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Summonant = "BlueFuture-CT",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Blue.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "In the future, you get to install your own gods in your brain and attend church with VR sets! Wow!"
	},
	["Nyxian Acolyte-CT"] = {
		Id = 6886656488,
		Name = "Nyxian Acolyte",
		AltCards = {
			["GreenNyx-CT"] = { Id = 6886658150, Color = "Green", Rarity = "Token" }
		},
		Health = 800,
		Power = 100,
		AddBlock = true,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "AcolyteGreen",
		Archetype = "Acolyte",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Summonant = "GreenNyx-CT",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Green.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Nightmares and Celestials share one attribute: they feast upon the mind of anyone daring enough to call upon them. That's why the main prerequisite needed to become a Nyxian Acolyte is to be an idiot."
	}
}
