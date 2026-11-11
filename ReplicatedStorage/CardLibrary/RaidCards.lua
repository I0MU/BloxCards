return {
	["Zanzel, Perfected"] = {
		Id = 0,
		Name = "Zanzel, Perfected",
		Health = 10000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		ArtAnimation = "ZanzelPerfected",
		AttackEffect = "Gravity",
		Color = "Green",
		Cost = { Neutral = 0 },
		SummonAnimation = "ZanzelRaidSummon",
		SummonAnimationEffect = true,
		HealthGates = {
			["9000"] = false,
			["7000"] = false,
			["5000"] = false,
			["4000"] = false,
			["2000"] = false,
			["1000"] = false
		},
		OmniImmune = true,
		ObliterateImmune = true,
		AttackBlock = true,
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = "A vision of a future most dire, where pursuit of perfection lead to nothing more than destruction."
	},
	ZRT1 = {
		Id = 15547523270,
		Name = "Apocryphic Seeker",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Deal 50 unblockable damage to a random enemy fighter.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"PierceDamage",
							50,
							"EVCard",
							nil,
							nil,
							nil,
							"FireBlastPurple"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "The eyes of Zanzel, used to gaze upon the beauty of her perfected world."
	},
	ZRT2 = {
		Id = 15547526501,
		Name = "Apocryphic Guardian",
		AltCards = {
			["ZRT2-H"] = { Power = 400 }
		},
		Health = 1500,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Shield = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 50, "EVCard" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "A remnant of an age old spirit, still trying to protect it's kin."
	},
	ZRT3 = {
		Id = 15547525319,
		Name = "Apocryphic Devourer",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		Mitigation = 100000000000,
		DamageMitigation = 10000000000,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Immune to all damage.",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 50, "EVCard" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "A raging remnant, free from its prison, ever hungry."
	},
	ZRTA1 = {
		Id = 15594318371,
		Name = "Flames of Perfection",
		AltCards = {
			["ZRTA1-H"] = {
				Effect = {
					Description = "Deal 1000 Overloaded, Unblockable damage to a enemy fighter.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Save", "Target", "CardInstance", "ChosenCard" },
									"CustomTarget",
									nil,
									nil,
									nil,
									"FireBlastPurple"
								},
								{
									"AlterEV",
									{ "Load", "Target", "Health", "ChosenCard" },
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "Target", "Health", "ChosenCardHealth" },
									"EVCard"
								},
								{
									"AlterEV",
									{ "Set", "Math", 1000, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Subtract", "Math", "SavedVariable", "ChosenCardHealth" },
									"Self"
								},
								{
									"AlterEV",
									{ "UnderCap", "Math", 0, "Nil" },
									"Self"
								},
								{ "Inflict", "Variable", "Opponent" },
								{
									"AlterEV",
									{ "Load", "Target", "Health", "ChosenCard" },
									"Self"
								},
								{ "PierceDamage", 1000, "EVCard" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 700 Overloaded, Unblockable damage to a enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "ChosenCard" },
							"CustomTarget",
							nil,
							nil,
							nil,
							"FireBlastPurple"
						},
						{
							"AlterEV",
							{ "Load", "Target", "Health", "ChosenCard" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Health", "ChosenCardHealth" },
							"EVCard"
						},
						{
							"AlterEV",
							{ "Set", "Math", 700, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", "SavedVariable", "ChosenCardHealth" },
							"Self"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "Target", "Health", "ChosenCard" },
							"Self"
						},
						{ "PierceDamage", 700, "EVCard" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	ZRTA2 = {
		Id = 15594319878,
		Name = "Cleansing Wave",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 200 unblockable damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = { {
						"PierceDamage",
						200,
						"Opponent",
						nil,
						nil,
						nil,
						"FireBlastPurple"
					} },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTA3 = {
		Id = 15594321311,
		Name = "Apocryphirestorm",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 250 damage to a random enemy fighter three times.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"Damage",
							250,
							"EVCard",
							nil,
							nil,
							nil,
							"FireBlastPurple"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"Damage",
							250,
							"EVCard",
							nil,
							nil,
							nil,
							"FireBlastPurple"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"Damage",
							250,
							"EVCard",
							nil,
							nil,
							nil,
							"FireBlastPurple"
						}
					},
					Target = "Self",
					UniqueTargets = true,
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	ZRTA4 = {
		Id = 15594322952,
		Name = "Trapping Flames",
		AltCards = {
			["ZRTA4-H"] = {
				Effect = {
					Description = "Your opponent loses 400 life. Put two Vengeful Blessings onto card spaces in their hand until their next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Inflict", 400, "Opponent" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 1,
		Effect = {
			Description = "Your opponent loses 400 life. Put a Vengeful Blessing onto a card space in their hand until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAD = {
		Id = 15594372408,
		Name = "Doomcall",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 3,
		Effect = {
			Description = "Put a Doomed Blessing onto a card space in their hand. (They lose the game if they dont cast a card from that slot in three turns)",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DoomedBless", "RandomNotBlessedEnemyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAE = {
		Id = 15594324646,
		Name = "Apocryphic Blast",
		AltCards = {
			["ZRTAE-H"] = {
				Effect = {
					Description = "Your opponent loses 2000 life. (This card is only played when the opponent's board is empty)",
					Ability = {
						OnSummon = {
							Power = { { "Inflict", 2000, "Opponent" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Your opponent loses 1500 life. (This card is only played when the opponent's board is empty)",
			Ability = {
				OnSummon = {
					Power = { { "Inflict", 1500, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAP = {
		Id = 15594326014,
		Name = "Seeker Volley",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Your opponent loses 300 life for each allied fighter in play. Deal 1000 damage to all allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Fighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{ "Inflict", "Variable", "Opponent" },
						{ "Damage", 1000, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAS1 = {
		Id = 15594370535,
		Name = "Apocryphic Beckon",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 7 Apocryphic Seekers.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "ZRT1", 7 },
							"Ally"
						},
						{ "AllowRaidRewards", 0.2 }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAS2 = {
		Id = 15594372408,
		Name = "Doomcall",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 3,
		Effect = {
			Description = "Put a Doomed Blessing onto the 8th space in your opponent's hand (They lose the game if they dont cast a card from that slot in three turns).",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DoomedBless", "Self" } },
					Target = "Self",
					MetaData = {
						SlotTargets = { 7 }
					}
				}
			},
			BlessOpponent = true
		},
		Bio = " "
	},
	ZRTAS3 = {
		Id = 15594374045,
		Name = "Apocryphic Call",
		AltCards = {
			["ZRTAS3-H"] = {
				Effect = {
					Description = "Summon two Apocryphic Guardians.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RepeatingSummon",
									{ "ZRT2-H", 2 },
									"Ally"
								},
								{ "ChangeMusic", "ZanzelRaidP2", "Ally" }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Apocryphic Guardians.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "ZRT2", 2 },
							"Ally"
						},
						{ "ChangeMusic", "ZanzelRaidP2", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAS4 = {
		Id = 15594375462,
		Name = "Doomspeak",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 3,
		Effect = {
			Description = "Put a Doomed Blessing onto the 4th, 5th and 7th spaces in your opponent's hand (They lose the game if they dont cast a card from those slot in three turns).",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DoomedBless", "Self" } },
					Target = "Self",
					MetaData = {
						SlotTargets = { 3, 4, 6 }
					}
				}
			},
			BlessOpponent = true
		},
		Bio = " "
	},
	ZRTAS5 = {
		Id = 15594377672,
		Name = "Apocryphic Summon",
		AltCards = {
			["ZRTAS5-H"] = {
				Effect = {
					Description = "Summon an Apocryphic Devourer.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RepeatingSummon",
									{ "ZRT3", 1 },
									"Ally"
								},
								{ "ChangeMusic", "ZanzelRaidP3", "Ally" }
							},
							Target = "Self",
							MetaData = { OmniImmune = true }
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon an Apocryphic Devourer.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "ZRT3", 1 },
							"Ally"
						},
						{ "ChangeMusic", "ZanzelRaidP3", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ZRTAS6 = {
		Id = 15594383149,
		Name = "Apocalypse",
		AltCards = {
			["ZRTAS6-H"] = {
				Effect = {
					Description = "Summon 2 Apocryphic Guardians and 4 Apocryphic Seekers",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RepeatingSummon",
									{ "ZRT2-H", 2 },
									"Ally"
								},
								{
									"RepeatingSummon",
									{ "ZRT1", 4 },
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 2 Apocryphic Guardians and 4 Apocryphic Seekers",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "ZRT2", 2 },
							"Ally"
						},
						{
							"RepeatingSummon",
							{ "ZRT1", 4 },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["Recycling Bin Boss"] = {
		Id = 0,
		Name = "Recycling Bin!!!1!!111!",
		Health = 10000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		ArtAnimation = "RecyclingBin",
		AttackEffect = "Katana",
		Color = "Green",
		Cost = { Neutral = 0 },
		SummonAnimation = "ZanzelRaidSummon",
		SummonAnimationEffect = true,
		HealthGates = {
			["9000"] = false,
			["7000"] = false,
			["5000"] = false,
			["4000"] = false,
			["2000"] = false,
			["100"] = false
		},
		OmniImmune = true,
		ObliterateImmune = true,
		AttackBlock = true,
		BossCard = true,
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnEnd = {
					Power = { { "GivePassive", "AttackBlock" } },
					Target = "Self",
					NoBlip = true
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true,
			PierceOmni = true
		},
		Bio = "a SUPER POWERFUL bin full of COOL cards!!!"
	},
	AFP1 = {
		Id = 15594383149,
		Name = "Super Catnip",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 7 1000/1000 Zombified Catgirls.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" },
						{ "SummonWithEffect", "Zombified Catgirl" }
					},
					Target = "Ally",
					MetaData = { Health = 1000, Power = 1000 }
				}
			}
		},
		Bio = " "
	},
	AFP2 = {
		Id = 15594383149,
		Name = "Cool sword!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "The Recycling bin gains 10000 power, Dextrous, Can't be countered and can attack this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "TempStrengthen", 10000 },
						{ "GivePassive", "Dextrous" },
						{ "GivePassive", "CounterAttackBlock" },
						{ "RemovePassive", "AttackBlock" }
					},
					Target = "BossCard"
				}
			},
			PierceOmni = true
		},
		Bio = " "
	},
	AFP3 = {
		Id = 15594375462,
		Name = "DOOM",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 3,
		Effect = {
			Description = "Put a Doomed Blessing on every space in your opponent's hand (They lose the game if they dont cast a card from those slot in three turns).",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DoomedBless", "Self" } },
					Target = "Self",
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
			},
			BlessOpponent = true
		},
		Bio = " "
	},
	AFP4 = {
		Id = 15594383149,
		Name = "Godnip",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 2 Telamon.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonWithEffect", "Telamon" },
						{ "SummonWithEffect", "Telamon" },
						{ "ChangeMusic", "FoolRaidP2", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	AFP5 = {
		Id = 15594383149,
		Name = "Super Omega Catnip",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 7 3000/3000 Zombified Chimeras with overload.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" },
						{ "SummonWithEffect", "Zombified Chimera" }
					},
					Target = "Ally",
					MetaData = { Health = 3000, Power = 3000 }
				}
			}
		},
		Bio = " "
	},
	AFP6 = {
		Id = 15594383149,
		Name = "Die",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Death.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" },
						{ "SummonWithEffect", "Mzh3000" }
					},
					Target = "Ally",
					MetaData = { Unlock = 999 }
				}
			}
		},
		Bio = " "
	},
	DSRedRaidBoss = {
		Id = 131769171651392,
		Name = "UNIT_4, Forgemaster",
		AltCards = {
			["DSRedRaidBoss-H"] = {
				OmniImmune = true,
				ObliterateImmune = true,
				Power = 300,
				HealthGates = { ["6000"] = false, ["4000"] = false, ["2000"] = false }
			}
		},
		Health = 8000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Scorch",
		Color = "Red",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["2000"] = false },
		AttackBlock = true,
		BossCard = true,
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	["Forge Blast"] = {
		Id = 127820543623627,
		Name = "Forge Blast",
		AltCards = {
			["Forge Blast-H"] = {
				Effect = {
					Description = "Your Opponent loses 200 life, plus an additional 200 life for each Infused Forgecharge on RaidBoss. Destroy all Infused Forgecharges attached to RaidBoss",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "SpecificEquippedGearCount", "DSRForgeCharge" },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 200, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Math", 200, "Nil" },
									"Self"
								},
								{ "Inflict", "Variable", "Opponent" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" },
								{ "DestroyGear", "DSRForgeCharge", "BossCard" }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Your Opponent loses 100 life, plus an additional 100 life for each Infused Forgecharge on RaidBoss. Destroy all Infused Forgecharges attached to RaidBoss",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "DSRForgeCharge" },
							"BossCard"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 100, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" },
						{ "DestroyGear", "DSRForgeCharge", "BossCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRForgeCharge = {
		Id = 96977132493376,
		Name = "Forgecharge",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Gear = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Increases the amount of damage Forge Blast will inflict by 200.",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"BossCard"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 200, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 200, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkin1 = {
		Id = 87592145587791,
		Name = "Kilnkin Charger",
		AltCards = {
			["DSRKilnkin1-H"] = { Health = 800, Power = 200 }
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "At the start of your turns: Attach a Forgecharge to RaidBoss.",
			Ability = {
				OnAllyStart = {
					Power = { { "EquipGear", "DSRForgeCharge" } },
					Target = "BossCard"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkin2 = {
		Id = 115688733837715,
		Name = "Kilnkin Rampager",
		AltCards = {
			["DSRKilnkin2-H"] = { Health = 400, Power = 700 }
		},
		Health = 200,
		Power = 600,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Whenever this fighter destroys another: Attach a Forgecharge to RaidBoss.",
			Ability = {
				OnDestroy = {
					Power = { { "EquipGear", "DSRForgeCharge" } },
					Target = "BossCard"
				}
			}
		},
		Bio = "Claymaker willingly inherited Dekkad's domain of ceaseless violence, creating a utopia of predator and prey."
	},
	DSRKilnkin3 = {
		Id = 130402414292196,
		Name = "Kilnkin Furnace",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Mitigation = 100000000000,
		AttackEffect = "Blaze",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Immune to damage from combat. At the start of your turns: Attach a Forgecharge to RaidBoss",
			Ability = {
				OnAllyStart = {
					Power = { { "EquipGear", "DSRForgeCharge" } },
					Target = "BossCard"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkin4 = {
		Id = 108908677631644,
		Name = "Kilnkin Chargebearer",
		Health = 1000,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Mitigation = 100000000000,
		DamageMitigation = 10000000000,
		AttackEffect = "Scorch",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "3 Forgecharges. Immune to all damage. Whenever this card is attacked: Destroy a Infused Forgecharge attached to it.\nAt the start of your turns: Transfer a Infused Forgecharge onto Raidboss, is this card has none: Obliterate it instead.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAttacked = {
					Power = { { "DestroyGear", "DSRForgeCharge" } },
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "DSRForgeCharge" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge", "BossCard" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Obliterate" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkin5 = {
		Id = 102000782668809,
		Name = "Kilnkin Ward",
		AltCards = {
			["DSRKilnkin5-H"] = {
				Power = 400,
				HealthGates = { ["500"] = false },
				Effect = {
					Description = "When this fighter's health would be lowered to 500, Negate all remaining damage and attach 6 Infused Forgecharges to it.",
					Ability = {
						OnHealthGate = {
							Power = {
								{ "EquipGear", "DSRForgeCharge" },
								{ "EquipGear", "DSRForgeCharge" },
								{ "EquipGear", "DSRForgeCharge" },
								{ "EquipGear", "DSRForgeCharge" },
								{ "EquipGear", "DSRForgeCharge" },
								{ "EquipGear", "DSRForgeCharge" }
							},
							Target = "Self"
						}
					}
				}
			},
			["DSRKilnkin5-N"] = {
				Power = 0,
				Fading = true,
				Effect = {
					Description = "During your end step, Obliterate this card.",
					Ability = {
						OnEnd = {
							Power = { { "Obliterate" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Shield = true,
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" },
						{ "EquipGear", "DSRForgeCharge" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkin6 = {
		Id = 110427356056453,
		Name = "Kilnkin Demolisher",
		AltCards = {
			["DSRKilnkin6-H"] = { Health = 1500, Power = 400 }
		},
		Health = 800,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Whenever this fighter attacks or is attacked: Attach a Infused Forgecharge onto this fighter, then give all gears attached to it +100 power bonus.",
			Ability = {
				OnCombat = {
					Power = {
						{ "EquipGear", "DSRForgeCharge" },
						{ "TargetAddStrengthenBonus", 100, "SelfGear" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRKilnkinB = {
		Id = 98029958211180,
		Name = "Kilnkin Exploder",
		AltCards = {
			["DSRKilnkinB-H"] = {
				Effect = {
					Description = "Whenever this fighter attacks or is attacked: deal 1500 unblockable damage to all enemy fighters and itself.",
					Ability = {
						OnCombat = {
							Power = {
								{ "PierceDamage", 1500, "Opponent" },
								{ "PierceDamage", 1500, "Self" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		AttackEffect = "TimeBomb",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever this fighter attacks or is attacked: deal 500 unblockable damage to all enemy fighters and itself.",
			Ability = {
				OnCombat = {
					Power = {
						{ "PierceDamage", 500, "Opponent" },
						{ "PierceDamage", 500, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRA1 = {
		Id = 129828898465298,
		Name = "Forged Slash",
		AltCards = {
			DSRA1H = {
				Effect = {
					Description = "Deal 300 unblockable damage to all enemy fighters. Attach a Infused Forgecharge to RaidBoss for each enemy fighter that died this way.",
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
								{ "PierceDamage", 300, "Opponent" },
								{
									"AlterEV",
									{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
								},
								{
									"AlterEV",
									{ "Gate", "Math", 0, "Nil" }
								},
								{ "EVGreaterValueCheck", 0 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{ "EquipGear", "DSRForgeCharge", "BossCard" },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" }
								},
								{ "EVGreaterValueCheck", 0 }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Deal 100 unblockable damage to all enemy fighters. Attach a Infused Forgecharge to RaidBoss for each enemy fighter that died this way.",
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
						{ "PierceDamage", 100, "Opponent" },
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "EquipGear", "DSRForgeCharge", "BossCard" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRA2 = {
		Id = 72033806206153,
		Name = "Incinerate Impurities",
		AltCards = {
			DSRA2H = {
				Effect = {
					Description = "Deal 1000 unblockable damage to an enemy fighter. Attach a Infused Forgecharge to RaidBoss if it destroyed a fighter.",
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
								{ "PierceDamage", 1000, "CustomTarget" },
								{
									"AlterEV",
									{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
								},
								{
									"AlterEV",
									{ "Gate", "Math", 0, "Nil" }
								},
								{ "EVGreaterValueCheck", 0 }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						},
						OnEVCheckPass = {
							Power = { { "EquipGear", "DSRForgeCharge", "BossCard" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Deal 500 unblockable damage to an enemy fighter. Attach a Infused Forgecharge to RaidBoss if it destroyed a fighter.",
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
						{ "PierceDamage", 500, "CustomTarget" },
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "DSRForgeCharge", "BossCard" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRA3 = {
		Id = 136231497979897,
		Name = "Burning Blast",
		AltCards = {
			DSRA3H = {
				Effect = {
					Description = "Deal 400 unblockable damage to a target enemy fighter. Attach a Forgeflash to it and adjacent fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" }
								},
								{ "EquipGear", "FlashbangRaid", "CustomTarget" },
								{ "EquipGear", "FlashbangRaid", "AdjacentEVTarget" },
								{ "PierceDamage", 400, "CustomTarget" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Deal 200 unblockable damage to a target enemy fighter. Attach a Forgeflash to it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" }
						},
						{ "EquipGear", "FlashbangRaid", "CustomTarget" },
						{ "PierceDamage", 200, "CustomTarget" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	FlashbangRaid = {
		Id = 116773311615677,
		Name = "Forgeflash",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		PlayTest = true,
		DSPlayTest = true,
		Gear = true,
		TokenOmni = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter attacks: Lock it for an additional turn.",
			Ability = {
				OnAttack = {
					Power = { { "Lock", 1, "GearOwner" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	DSRA4 = {
		Id = 123736519577017,
		Name = "Reshape",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Destroy an enemy fighter, then double the number of Infused Forgecharges Raidboss has.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 400, "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "DSRForgeCharge" },
							"BossCard"
						},
						{
							"RepeatingEquipGear",
							{ "DSRForgeCharge", "Variable" },
							"BossCard"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	DSRA5 = {
		Id = 110717437186078,
		Name = "Fresh Clay",
		AltCards = {
			["DSRA5-H"] = {
				Effect = {
					Description = "Summon a Kilnkin Exploder.",
					Ability = {
						OnSummon = {
							Power = { { "Summon", "DSRKilnkinB-H" } },
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon a Kilnkin Exploder.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "DSRKilnkinB" } },
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	DSRSA = {
		Id = 81065743451013,
		Name = "KilnKall",
		AltCards = {
			DSRSA2 = {
				Effect = {
					Description = "Summon two Kilnkin fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin5", "DSRKilnkin6" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			["DSRSA-H"] = {
				Effect = {
					Description = "Summon two Kilnkin fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSRKilnkin1-H", "DSRKilnkin2-H", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin1-H", "DSRKilnkin2-H", "DSRKilnkin3", "DSRKilnkin4" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			["DSRSA2-H"] = {
				Effect = {
					Description = "Summon two Kilnkin fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSRKilnkin1-H", "DSRKilnkin2-H", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin5-H", "DSRKilnkin6-H" }
								}
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Kilnkin fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	DSRP1 = {
		Id = 139824176943227,
		Name = "Forged Wards",
		AltCards = {
			["DSRP1-H"] = {
				Effect = {
					Description = "Summon two Kilkin Wards and another Kilkin fighter.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "DSRKilnkin5-H", "Ally" },
								{ "Summon", "DSRKilnkin5-H", "Ally" },
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{ "AllowRaidRewards", 0.2 }
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Kilkin Wards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "DSRKilnkin5", "Ally" },
						{ "Summon", "DSRKilnkin5", "Ally" },
						{ "AllowRaidRewards", 0.2 }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRP2 = {
		Id = 92278059681681,
		Name = "Infurnal Presence",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Terrain = true,
		DestroyImmune = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Whenever your opponent casts a fighter: Attach a Ignitioncharge to it.",
			Ability = {
				OnEnemySummon = {
					Power = { { "EquipGear", "DSRIgnitionCharge", "Aggressor" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSRP3 = {
		Id = 131507703425777,
		Name = "Heat Rising",
		AltCards = {
			["DSRP3-H"] = {
				Effect = {
					Description = "Summon 6 Kilkin fighters, then attach 2 Infused Forgecharges to all non-boss allied fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin5", "DSRKilnkin6" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
								},
								{
									"RandomSummon",
									{ "DSRKilnkin5", "DSRKilnkin6" }
								},
								{ "EquipGear", "DSRForgeCharge", "CustomTarget" },
								{ "EquipGear", "DSRForgeCharge", "CustomTarget" },
								{ "AllowRaidRewards", 0.5 }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally" },
								Condition = "HasntPassive",
								Modifier = "BossCard",
								SubModifier = true
							}
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Summon 6 Kilkin fighters, then attach 2 Infused Forgecharges to all non-boss allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin1", "DSRKilnkin2", "DSRKilnkin3", "DSRKilnkin4" }
						},
						{
							"RandomSummon",
							{ "DSRKilnkin5", "DSRKilnkin6" }
						},
						{ "EquipGear", "DSRForgeCharge", "CustomTarget" },
						{ "EquipGear", "DSRForgeCharge", "CustomTarget" },
						{ "AllowRaidRewards", 0.5 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasntPassive",
						Modifier = "BossCard",
						SubModifier = true
					}
				}
			}
		},
		Bio = " "
	},
	DSRIgnitionCharge = {
		Id = 72899437943554,
		Name = "Ignitioncharge",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Gear = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "When this fighter dies: Attach a Infused Forgecharge to RaidBoss.",
			Ability = {
				OnDeath = {
					Power = { { "EquipGear", "DSRForgeCharge", "BossCard" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSGreenRaidBoss = {
		Id = 118499187669458,
		Name = "Thyyrinyr",
		AltCards = {
			["DSGreenRaidBoss-H"] = {
				OmniImmune = true,
				Power = 300,
				HealthGates = { ["6000"] = false, ["4000"] = false, ["2000"] = false }
			}
		},
		Health = 8000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Divinity",
		Color = "Green",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["4000"] = false },
		TargetImmune = true,
		DestroyImmune = true,
		ObliterateImmune = true,
		AttackBlock = true,
		BossCard = true,
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	PlaguePoison = {
		Id = 84442356654885,
		Name = "Poisonous Plague",
		AltCards = {
			["PlaguePoison-H"] = {
				Effect = {
					Description = "At the start of your turns, if this fighter has 6 Poisonous Plagues attached to it: Obliterate it. You lose 600 Life. Thyyrinyr gains 600 health.",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "SpecificEquippedGearCount", "PlaguePoison" },
									"GearOwner"
								},
								{ "EVExactValueCheck", 6 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Cost", 600, "Ally" },
								{ "Heal", 600, "BossCard" },
								{ "Obliterate" }
							},
							Target = "Self"
						}
					},
					PierceOmni = true
				}
			},
			["PlaguePoison-N"] = {
				Effect = {
					Description = "At the start of your turns, if this fighter has 6 Poisonous Plagues attached to it: Obliterate it. You lose 600 Life. Thyyrinyr gains 600 health.",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "SpecificEquippedGearCount", "PlaguePoison" },
									"GearOwner"
								},
								{ "EVExactValueCheck", 6 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Cost", 600, "Ally" },
								{ "Heal", 600, "BossCard" },
								{ "Obliterate" }
							},
							Target = "Self"
						}
					},
					PierceOmni = true
				}
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Fading = true,
		Gear = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "At the start of your turns, if this fighter has 6 Poisonous Plagues attached to it: Destroy it. You lose 300 Life. Thyyrinyr gains 300 health.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "PlaguePoison" },
							"GearOwner"
						},
						{ "EVExactValueCheck", 6 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Cost", 300, "Ally" },
						{ "Heal", 300, "BossCard" },
						{ "Destroy" }
					},
					Target = "Self"
				}
			},
			PierceOmni = true
		},
		Bio = " "
	},
	AncientAntidote = {
		Id = 125445187533813,
		Name = "Ancient Antidote",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		TokenOmni = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Destroy 2 Poisonous Plagues on a target allied fighter. It gains 100 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyGear", "PlaguePoison", "SingleAlly" },
						{ "DestroyGear", "PlaguePoison", "SingleAlly" },
						{ "DestroyGear", "PlaguePoison-H", "SingleAlly" },
						{ "DestroyGear", "PlaguePoison-H", "SingleAlly" },
						{ "Strengthen", 100, "SingleAlly" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = " "
	},
	DSGFighter1 = {
		Id = 129865299204415,
		Name = "Sprouting Belladonna",
		AltCards = {
			["DSGFighter1-H"] = {
				Health = 1200,
				Effect = {
					Description = "During your end step: Attach two Poisonous Plague to an enemy fighter.\nWhen this card dies: Give your opponent an Ancient Antidote",
					Ability = {
						OnEnd = {
							Power = {
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						},
						OnDeath = {
							Power = { { "Add", "AncientAntidote" } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 800,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Zombified = true,
		AttackEffect = "Acid",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Attach a Poisonous Plague to an enemy fighter.\nWhen this card dies: Give your opponent an Ancient Antidote",
			Ability = {
				OnEnd = {
					Power = { { "EquipGear", "PlaguePoison" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				},
				OnDeath = {
					Power = { { "Add", "AncientAntidote" } },
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGFighter2 = {
		Id = 92282618338211,
		Name = "Plagued Blightwyrm",
		AltCards = {
			["DSGFighter2-H"] = {
				Health = 800,
				Power = 400,
				Effect = {
					Description = "During your end step: Attach a Poisonous Plague to all enemy fighters.\nWhen this card dies: Give your opponent an Ancient Antidote",
					Ability = {
						OnEnd = {
							Power = { { "EquipGear", "PlaguePoison-H" } },
							Target = "Opponent"
						},
						OnDeath = {
							Power = { { "Add", "AncientAntidote" } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Zombified = true,
		AttackEffect = "VenomBite",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Attach a Poisonous Plague to all enemy fighters.\nWhen this card dies: Give your opponent an Ancient Antidote",
			Ability = {
				OnEnd = {
					Power = { { "EquipGear", "PlaguePoison" } },
					Target = "Opponent"
				},
				OnDeath = {
					Power = { { "Add", "AncientAntidote" } },
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGFighter3 = {
		Id = 93168682365395,
		Name = "Crawling Mangrove",
		AltCards = {
			["DSGFighter3-H"] = {
				Health = 1500,
				Effect = {
					Description = "Whenever this card is attacked and survives: Attach 3 Poisonous Plague to the attacker.\nWhen this card dies: Give your opponent an Ancient Antidote",
					Ability = {
						OnAttacked = {
							Power = {
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" }
							},
							Target = "Aggressor"
						},
						OnDeath = {
							Power = { { "Add", "AncientAntidote" } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Zombified = true,
		Shield = true,
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever this card is attacked and survives: Attach 2 Poisonous Plague to the attacker.\nWhen this card dies: Give your opponent an Ancient Antidote",
			Ability = {
				OnAttacked = {
					Power = {
						{ "EquipGear", "PlaguePoison" },
						{ "EquipGear", "PlaguePoison" }
					},
					Target = "Aggressor"
				},
				OnDeath = {
					Power = { { "Add", "AncientAntidote" } },
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGFighter4 = {
		Id = 134751232184147,
		Name = "Snapthorn Beast",
		AltCards = {
			["DSGFighter4-H"] = {
				Health = 2500,
				Effect = {
					Description = "During your end step: Reset this fighter's power, then it gains 300 power for each Poisonous Plague attached to enemy fighters.",
					Ability = {
						OnEnd = {
							Power = {
								{ "SetPower", 0 },
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Target", "SpecificEquippedGearCount", "PlaguePoison-H" },
									"Opponent"
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 300, "Nil" },
									"Self"
								},
								{ "Strengthen", "Variable" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 2000,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Zombified = true,
		Overload = true,
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Reset this fighter's power, then it gains 100 power for each Poisonous Plague attached to enemy fighters.",
			Ability = {
				OnEnd = {
					Power = {
						{ "SetPower", 0 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "SpecificEquippedGearCount", "PlaguePoison" },
							"Opponent"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Thyyrinyr has a vow of nonviolence; Being banished to a single box has unleashed his terrible rage."
	},
	DSGFighter5 = {
		Id = 99718404561725,
		Name = "Siphoning Shadow",
		AltCards = {
			["DSGFighter5-H"] = {
				Health = 1500,
				Power = 800,
				Effect = {
					Description = "During your end step: For each enemy fighter that has any Poisonous Plague attached to it: it loses 200 power, then Thyyrinyr gains 200 health for each Poisonous Plague they had.",
					Ability = {
						OnEnd = {
							Power = {
								{ "Weaken", 200 },
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Target", "SpecificEquippedGearCount", "PlaguePoison-H" },
									"CustomTarget"
								},
								{ "EVGreaterValueCheck", 0, "Self" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy" },
								Condition = "HasGearSpecific",
								Modifier = "PlaguePoison-H"
							}
						},
						OnEVCheckPass = {
							Power = {
								{ "Heal", 200, "BossCard" },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0, "Self" }
							},
							Target = "Self"
						}
					},
					PierceOmni = true
				}
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: For each enemy fighter that has any Poisonous Plague attached to it: it loses 100 power, then Thyyrinyr gains 50 health for each Poisonous Plague they had.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Weaken", 100 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "SpecificEquippedGearCount", "PlaguePoison" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasGearSpecific",
						Modifier = "PlaguePoison"
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 50, "BossCard" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Self"
				}
			},
			PierceOmni = true
		},
		Bio = " "
	},
	DSGRefugee = {
		Id = 121041113622432,
		Name = "Diseased Cultist",
		AltCards = {
			["DSGRefugee-H"] = {
				Health = 1000,
				Effect = {
					Description = "During your end step: Attach a Poisonous Plague to a random allied fighter.",
					Ability = {
						OnEnd = {
							Power = { { "EquipGear", "PlaguePoison-H" } },
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 500,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Continued = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Attach a Poisonous Plague to a random allied fighter.",
			Ability = {
				OnEnd = {
					Power = { { "EquipGear", "PlaguePoison" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	DSGP1 = {
		Id = 90543553930351,
		Name = "Mists of Disregard",
		AltCards = {
			["DSGP1-H"] = {
				Effect = {
					Description = "During your end step, For each enemy fighter that has a Poisonous Plague attached to it: Attach a Poisonous Plague onto it.",
					Ability = {
						OnEnd = {
							Power = { { "EquipGear", "PlaguePoison-H" } },
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy" },
								Condition = "HasGearSpecific",
								Modifier = "PlaguePoison-H"
							}
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Terrain = true,
		DestroyImmune = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step, For each enemy fighter that has a Poisonous Plague attached to it: Attach a Poisonous Plague onto it.",
			Ability = {
				OnEnd = {
					Power = { { "EquipGear", "PlaguePoison" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasGearSpecific",
						Modifier = "PlaguePoison"
					}
				}
			}
		},
		Bio = " "
	},
	DSGP2 = {
		Id = 80433816759869,
		Name = "Roots Of The Undying",
		AltCards = {
			["DSGP2-H"] = {
				Effect = {
					Description = "Summon four Plagued Fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSGFighter1-H", "DSGFighter2-H", "DSGFighter3-H" }
								},
								{
									"RandomSummon",
									{ "DSGFighter1-H", "DSGFighter2-H", "DSGFighter3-H" }
								},
								{
									"RandomSummon",
									{ "DSGFighter4-H" }
								},
								{
									"RandomSummon",
									{ "DSGFighter5-H" }
								},
								{ "AllowRaidRewards", 0.2 }
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		DestroyImmune = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon four Plagued Fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "DSGFighter1", "DSGFighter2", "DSGFighter3" }
						},
						{
							"RandomSummon",
							{ "DSGFighter1", "DSGFighter2", "DSGFighter3" }
						},
						{
							"RandomSummon",
							{ "DSGFighter4" }
						},
						{
							"RandomSummon",
							{ "DSGFighter5" }
						},
						{ "AllowRaidRewards", 0.2 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	DSGP3 = {
		Id = 94087546184240,
		Name = "Final Breath",
		AltCards = {
			["DSGP3-H"] = {
				Effect = {
					Description = "Attach 4 Poisonous Plague to all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" },
								{ "EquipGear", "PlaguePoison-H" },
								{ "AllowRaidRewards", 0.5 }
							},
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		DestroyImmune = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Attach 4 Poisonous Plague to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "PlaguePoison" },
						{ "EquipGear", "PlaguePoison" },
						{ "EquipGear", "PlaguePoison" },
						{ "EquipGear", "PlaguePoison" },
						{ "AllowRaidRewards", 0.5 }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGA1 = {
		Id = 99600200118766,
		Name = "Plaguebreath",
		AltCards = {
			["DSGA1-H"] = {
				Effect = {
					Description = "An enemy fighter loses 200 power. Attach 2 Poisonous Plague to it.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Weaken", 200, "CustomTarget" },
								{ "EquipGear", "PlaguePoison-H", "CustomTarget" },
								{ "EquipGear", "PlaguePoison-H", "CustomTarget" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "An enemy fighter loses 200 power. Attach a Poisonous Plague to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 200, "CustomTarget" },
						{ "EquipGear", "PlaguePoison", "CustomTarget" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	DSGA2 = {
		Id = 96766592664417,
		Name = "Death's Presence",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All enemy fighters lose 100 power.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 100, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSGA3 = {
		Id = 87751448433369,
		Name = "Intensifying Plague",
		AltCards = {
			["DSGA3-H"] = {
				Effect = {
					Description = "All Poisonous Plagues attached to enemy fighters gain -100/-100 stat bonus.",
					Ability = {
						OnSummon = {
							Power = {
								{ "TargetAddStrengthenBonus", -100, "CustomTarget" },
								{ "TargetAddHealthBonus", -100, "CustomTarget" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "EquippedGears",
								Modifier = "PlaguePoison-H"
							}
						}
					},
					PierceOmni = true
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All Poisonous Plagues attached to enemy fighters gain -50/-50 stat bonus.",
			Ability = {
				OnSummon = {
					Power = {
						{ "TargetAddStrengthenBonus", -50, "CustomTarget" },
						{ "TargetAddHealthBonus", -50, "CustomTarget" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "EquippedGears",
						Modifier = "PlaguePoison"
					}
				}
			},
			PierceOmni = true
		},
		Bio = " "
	},
	DSGA4 = {
		Id = 106111003337792,
		Name = "Gift Of Mortality",
		AltCards = {
			["DSGA4-H"] = { Summonant = "DSGRefugee-H" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Summonant = "DSGRefugee",
		Effect = {
			Description = "Your Opponent Summons a Plagued Refugee.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGAE = {
		Id = 99600200118766,
		Name = "Consuming Toxin",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Summonant = "DSGRefugee",
		Effect = {
			Description = "Your Opponent loses 600 life. Destroy their terrain.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 600 },
						{ "DestroyTerrain" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSGSA = {
		Id = 136477551843692,
		Name = "Uproot",
		AltCards = {
			["DSGSA-H"] = {
				Effect = {
					Description = "Summon two Plagued fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"RandomSummon",
									{ "DSGFighter1-H", "DSGFighter2-H", "DSGFighter3-H" }
								},
								{
									"RandomSummon",
									{ "DSGFighter1-H", "DSGFighter2-H", "DSGFighter3-H" }
								}
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Plagued fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "DSGFighter1", "DSGFighter2", "DSGFighter3" }
						},
						{
							"RandomSummon",
							{ "DSGFighter1", "DSGFighter2", "DSGFighter3" }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	DSYellowRaidBoss = {
		Id = 87954251108781,
		Name = "The Animus",
		AltCards = {
			["DSYellowRaidBoss-H"] = {
				OmniImmune = true,
				Power = 300,
				Effect = {
					Description = "You cannot lose life.\nWhen this card is cast: it spirals.\nWhen this card dies: your opponent wins the game.",
					Ability = {
						OnSummon = {
							Power = {
								{ "SetFatigueImmune" },
								{ "BypassLifeLoss" },
								{
									"GenZoneDiscard",
									{ "Neutral", 0 }
								},
								{
									"RandomEquipGear",
									{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
									"Self"
								}
							},
							Target = "Ally"
						},
						OnDeath = {
							Power = { { "Cost", 99999 } },
							Target = "Ally"
						},
						OnHealthGate = {
							Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
							Target = "Opponent"
						}
					},
					PierceLifeLoss = true
				}
			}
		},
		Health = 8000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Divinity",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["4000"] = false, ["2000"] = false },
		AttackBlock = true,
		BossCard = true,
		ObliterateImmune = true,
		DestroyImmune = true,
		TargetImmune = true,
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	DSYPF = {
		Id = 77617625470997,
		Name = "Justice City Citizen",
		AltCards = {
			["DSYPF-H"] = { Summonant = "DSYPFT-H" }
		},
		Health = 1000,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		SpiralImmune = true,
		Mitigation = 100000000000,
		DamageMitigation = 10000000000,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Summonant = "DSYPFT",
		EffectVariable = 0,
		Effect = {
			Description = "Immune to damage.\n This card can't spiral.\n Whenever this card is attacked: it gains a Spiraling Fear.\n During your end step, if this card has survived for three turns: obliterate it and destroy a gear attached to The Animus",
			Ability = {
				OnAttacked = {
					Power = {
						{ "EquipGear", "Spiraling Fear", "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Spiraling Fear" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant", "Opponent" },
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"BossCard"
						},
						{ "Obliterate" }
					},
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Survival" }
						},
						{
							"EVExactValueCheck",
							{ 1, "TurnsPassed" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassSurvival = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 2, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 2
				},
				OnEVCheckPassTurnsPassed = {
					Power = {
						{ "DestroyGear", 1, "BossCard" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSYPFT = {
		Id = 135792023349960,
		Name = "Enmitic Gimulraig",
		AltCards = {
			["DSYPFT-H"] = { Health = 1000, Power = 1000, TargetImmune = true }
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		Mitigation = 100000000000,
		DamageMitigation = 10000000000,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Immune to all damage.",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{ "Obliterate" },
						{ "Summon", "Summonant", "Opponent" },
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"BossCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSYAnimite = {
		Id = 106947614251560,
		Name = "Animites",
		AltCards = {
			["DSYAnimite-H"] = { Health = 1000, Power = 400, Dextrous = true }
		},
		Health = 600,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Effect = {
			Description = "",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{ "Obliterate" },
						{ "Summon", "Summonant", "Opponent" },
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"BossCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Nefertiti laid waste to Justice City, triumphing over even the warriors of the justice."
	},
	DSYP1 = {
		Id = 120808836778644,
		Name = "Terror Of The City",
		AltCards = {
			["DSYP1-H"] = {
				Effect = {
					Description = "Summon two Animites and a Justice City Citizen, The Animus Spirals.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "DSYAnimite-H", "Ally" },
								{ "Summon", "DSYAnimite-H", "Ally" },
								{ "Summon", "DSYPF-H", "Opponent" },
								{
									"RandomEquipGear",
									{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
									"BossCard"
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
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Animites and a Justice City Citizen, The Animus Spirals.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "DSYAnimite", "Ally" },
						{ "Summon", "DSYAnimite", "Ally" },
						{ "Summon", "DSYPF", "Opponent" },
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"BossCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSYP2 = {
		Id = 112608244233476,
		Name = "Turmoil",
		AltCards = {
			["DSYP2-H"] = { Summonant = "DSYAnimite-H" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Summonant = "DSYAnimite",
		EffectVariable = 0,
		Effect = {
			Description = "Summon two Animites, The Animus Spirals.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Summon", "Summonant", "Ally" },
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"BossCard"
						},
						{ "AllowRaidRewards", 0.2 }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSYP3 = {
		Id = 132463105267856,
		Name = "Overwhelm",
		AltCards = {
			["DSYP3-H"] = {
				Effect = {
					Description = "Destroy all allied fighters. Summon two Animus Reflections.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Destroy", 30, "Ally" },
								{ "Summon", "Summonant", "Ally" },
								{ "Summon", "Summonant", "Ally" },
								{ "AllowRaidRewards", 0.5 }
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
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Summonant = "DSYP3T",
		EffectVariable = 0,
		Effect = {
			Description = "Destroy all allied fighters. Summon a Animus Reflection.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "Ally" },
						{ "Summon", "Summonant", "Ally" },
						{ "AllowRaidRewards", 0.5 }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DSYP3T = {
		Id = 116005232543221,
		Name = "Animus Reflection",
		Health = 2000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Divinity",
		Color = "Yellow",
		Cost = { Neutral = 7 },
		OmniImmune = true,
		ObliterateImmune = true,
		AttackBlock = true,
		BossCard = true,
		Shield = true,
		Effect = {
			Description = "Whenever The Animus Spirals, this also Spirals.",
			Ability = {
				Nil = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	DSYA1 = {
		Id = 134223103737876,
		Name = "Be Not Afraid",
		AltCards = {
			["DSYA1-H"] = {
				Effect = {
					Description = "Deal 500 Unblockable damage to a enemy fighter, it spirals twice.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 500, "CustomTarget" },
								{ "Spiral" },
								{ "Spiral" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 300 Unblockable damage to a enemy fighter, it spirals twice.",
			Ability = {
				OnSummon = {
					Power = {
						{ "PierceDamage", 300, "CustomTarget" },
						{ "Spiral" },
						{ "Spiral" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	DSYA2 = {
		Id = 75735418315965,
		Name = "Wave of Emotion",
		AltCards = {
			["DSYA2-H"] = {
				Effect = {
					Description = "Deal 150 Unblockable damage to all enemy fighters, they all spiral.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 150, "Opponent" },
								{ "Spiral" }
							},
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All enemy fighters spiral.",
			Ability = {
				OnSummon = {
					Power = { { "Spiral" } },
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	DSYA3 = {
		Id = 75735418315965,
		Name = "Vulnerable Moment",
		AltCards = {
			["DSYA3-H"] = {
				Effect = {
					Description = "A target fighter Spirals and loses 1000 power until it's owners next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{ "TempWeaken", 1000 },
								{ "Spiral" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "A target fighter Spirals and loses 400 power until it's owners next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "TempWeaken", 400 },
						{ "Spiral" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	DSYA4 = {
		Id = 77226870416897,
		Name = "Emotional Support",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		Fading = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Summonant = "Gilmuraig",
		Effect = {
			Description = "Summon a Gilmuraig.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = " "
	},
	RaidWrath = {
		Id = 75071259521521,
		Name = "Pure Wrath",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		DSPlayTest = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a card: Deal 50 damage to all enemy fighters.",
			Ability = {
				OnEnemySummon = {
					Power = { { "Damage", 50 } },
					Target = "Opponent"
				},
				OnEnemyCast = {
					Power = { { "Damage", 50 } },
					Target = "Opponent"
				},
				OnEnemyCastGear = {
					Power = { { "Damage", 50 } },
					Target = "Opponent"
				},
				OnEnemyTerrainCast = {
					Power = { { "Damage", 50 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	RaidSloth = {
		Id = 87526145646647,
		Name = "Pure Sloth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 1 },
		EffectVariable = 0,
		DSPlayTest = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your opponent's turns: Cards they cast cost {W} more to cast.",
			Ability = {
				OnEnemyStart = {
					Power = { { "Tax", 1 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	RaidGreed = {
		Id = 106258082810529,
		Name = "Pure Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		DSPlayTest = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your opponent's turns: a card in their hand gains fleeting.",
			Ability = {
				OnEnemyStart = {
					Power = { { "GivePassive", "Fleeting" } },
					Target = "RandomEnemyHand"
				}
			}
		},
		Bio = ""
	},
	RaidEnvy = {
		Id = 122158406750529,
		Name = "Pure Envy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 1 },
		EffectVariable = 0,
		DSPlayTest = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a card: they lose 100 life for each card they've cast this turn.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "StormCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable" }
					},
					Target = "Opponent"
				},
				OnEnemyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "StormCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable" }
					},
					Target = "Opponent"
				},
				OnEnemyCastGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "StormCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable" }
					},
					Target = "Opponent"
				},
				OnEnemyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "StormCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	["Spiraling Fear"] = {
		Id = 81392391272849,
		Name = "Spiraling Fear",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		PlayTest = true,
		DSPlayTest = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "If this card has three or more Spiraling Fears attached to it, Transform it into a Enmitic Gimulraig on The Animus's field.",
			Ability = {
				Nil = {
					Power = { { "GivePassive", "Fleeting" } },
					Target = "RandomEnemyHand"
				}
			}
		},
		Bio = ""
	},
	DSBlueRaidBoss = {
		Id = 118933653984948,
		Name = "Prince Wonktooth",
		AltCards = {
			["DSBlueRaidBoss-H"] = {}
		},
		Health = 8000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Whirlpool",
		Color = "Blue",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["4000"] = false, ["2000"] = false },
		CounterAttackBlock = true,
		BossCard = true,
		OmniImmune = true,
		ObliterateImmune = true,
		EffectVariable = 0,
		Effect = {
			Description = "You cannot lose life.\nThis fighter can only take damage from your Champion.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnAnyAttackSupercede = {
					Power = {
						{ "RemovePassive", "DamageMitigation" },
						{ "RemovePassive", "Mitigation" },
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Champion" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 10000000000 }
						},
						{
							"GivePassiveSpecific",
							{ Mitigation = 10000000000 }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true,
			PierceOmni = true
		},
		Bio = ""
	},
	DSBA = {
		Id = 96515402076264,
		Name = "Prince's Challenge",
		AltCards = {
			["DSBA-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Your Opponent loses 750 life. Give them Champion's Arms.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Inflict", 750 },
								{ "Add", "DSBS", "Opponent" }
							},
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		PlayTest = true,
		CustomReminderSeek = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Your Opponent loses 400 life. Give them Champion's Arms.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 400 },
						{ "Add", "DSBS", "Opponent" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	DSBS = {
		Id = 103073125906422,
		Name = "Champion's Arms",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		PlayTest = true,
		CustomReminderSeek = true,
		RandomAddBypass = "IncludePlayTest",
		Effect = {
			Name = "Reincarnation",
			Description = "Seek Champion's Shinies.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "ChampShinies" },
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
		Bio = ""
	},
	DSBF1 = {
		Id = 81205367662841,
		Name = "Shedarian Treasurekeeper",
		AltCards = {
			["DSBF1-H"] = {
				Health = 1000,
				Power = 300,
				Effect = {
					Name = "Reincarnation",
					Description = "When this card dies: Equip two Champion's Shinies onto your opponent's Champion (If one exists).",
					Ability = {
						OnDeath = {
							Power = {
								{ "RandomEquipGear", "ChampShinies", "CustomTarget" },
								{ "RandomEquipGear", "ChampShinies", "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy" },
								Condition = "HasPassive",
								Modifier = "Champion"
							}
						}
					}
				}
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		AttackBlock = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Equip a Champion's Shiny onto your opponent's Champion (If one exists).",
			Ability = {
				OnDeath = {
					Power = { { "RandomEquipGear", "ChampShinies", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Champion"
					}
				}
			}
		},
		Bio = "New shinies are sent to His Dread Illuminance for assessment. He doesn't anything dangerous to be able to usurp him."
	},
	DSBF2 = {
		Id = 83401134935923,
		Name = "Tamed Gearswimmer",
		AltCards = {
			["DSBF2-H"] = { Health = 600, Power = 600, Dextrous = true }
		},
		Health = 300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Bite",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Destroy a gear attached to the opponent's Champion.",
			Ability = {
				OnAttack = {
					Power = { { "DestroyGear", 1, "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Champion"
					}
				}
			}
		},
		Bio = ""
	},
	DSBF3 = {
		Id = 83128665585131,
		Name = "Prince's Guardsmen",
		AltCards = {
			["DSBF3-H"] = { Health = 1100, Power = 400 }
		},
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Shield = true,
		AttackBlock = true,
		Effect = {
			Name = "Reincarnation",
			Description = "This card doesn't take combat damage by the opponent's Champion.",
			Ability = {
				OnAnyAttackSupercede = {
					Power = {
						{ "RemovePassive", "Mitigation" },
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Champion" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPass = {
					Power = { {
						"GivePassiveSpecific",
						{ Mitigation = 10000000000 }
					} },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DSBF4 = {
		Id = 126104329831169,
		Name = "Shedarian Bubblemancer",
		AltCards = {
			["DSBF4-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "At the start of your turns: Your opponent loses 300 life.",
					Ability = {
						OnAllyStart = {
							Power = { { "Inflict", 300 } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Your opponent loses 150 life.",
			Ability = {
				OnAllyStart = {
					Power = { { "Inflict", 150 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	DSBP1 = {
		Id = 115566675970384,
		Name = "Prince's Arms",
		AltCards = {
			["DSBP1-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Equip two Prince's Shinies to Prince Wonktooth.",
					Ability = {
						OnSummon = {
							Power = {
								{ "RandomEquipGear", "PrinceShinies", "BossCard" },
								{ "RandomEquipGear", "PrinceShinies", "BossCard" },
								{ "AllowRaidRewards", 0.2 }
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
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		PlayTest = true,
		RandomAddBypass = "IncludePlayTest",
		Effect = {
			Name = "Reincarnation",
			Description = "Equip a Prince's Shiny to Prince Wonktooth.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomEquipGear", "PrinceShinies", "BossCard" },
						{ "AllowRaidRewards", 0.2 }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DSBP2 = {
		Id = 115566675970384,
		Name = "Final Duel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate all non-Champion fighters. Lock Prince Wonktooth for 1 turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Obliterate" },
						{ "Lock", 1, "BossCard" },
						{ "AllowRaidRewards", 0.5 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy", "Ally" },
						Condition = "HasntPassive",
						Modifier = "Champion"
					}
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	ChampS1 = {
		Id = 114742473199360,
		Name = "Silver Ninja Star",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "ChampShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter becomes your Champion.\nAfter this card attacks: Deal 200 Unblockable damage to what it attacked.",
			Ability = {
				OnAttackEnd = {
					Power = { { "PierceDamage", 200 } },
					Target = "Aggressor"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "Champion" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Champion" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	ChampS2 = {
		Id = 97765075961171,
		Name = "Bluesteel Claw",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "ChampShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter becomes your Champion.\nWhenever you cast an action: This fighter gains 100 power.",
			Ability = {
				OnAllyCast = {
					Power = { { "Strengthen", 100 } },
					Target = "GearOwner"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "Champion" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Champion" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	ChampS3 = {
		Id = 73469228893354,
		Name = "Grapple Hook",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "ChampShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter becomes your Champion.\nThis fighter takes 200 less damage from combat.",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{ "GivePassive", "Champion" },
						{
							"GivePassiveSpecific",
							{ Mitigation = 200 }
						}
					},
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "Champion" },
						{ "RemovePassive", "Mitigation" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	ChampS4 = {
		Id = 132806694382901,
		Name = "Moneybags",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "ChampShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter becomes your Champion.\nWhenever this fighter attacks: Draw a card.",
			Ability = {
				OnAttack = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "Champion" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Champion" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	PrinceS1 = {
		Id = 88875619599717,
		Name = "Raig Table",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 500,
		Rarity = "Token",
		Archetype = "PrinceShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Weaken", 100, "Opponent" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = ""
	},
	PrinceS2 = {
		Id = 91442409354546,
		Name = "Gravity Hammer",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		Archetype = "PrinceShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Suspend a Non-Champion enemy fighter. At the start of your turns: Unsuspend all fighters suspended by this card.",
			Ability = {
				OnAttack = {
					Power = { { "PermaSuspend", false, "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = { "HasntPassive", "SelectionRandomCard" },
						Modifier = { HasntPassive = "Champion", SelectionRandomCard = 1 }
					}
				},
				OnAllyStart = {
					Power = { { "UnPermaSuspend", "Self", "All" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	PrinceS3 = {
		Id = 110174759092700,
		Name = "Bag of Noobs",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		Archetype = "PrinceShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, Whenever this card finishes attacking: Summon a Noob with defender.",
			Ability = {
				OnAttackEnd = {
					Power = { { "Summon", "Noob", "Ally" } },
					Target = "Self",
					MetaData = { Shield = true },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	PrinceS4 = {
		Id = 100912100801984,
		Name = "Classic Bucket",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 150,
		Rarity = "Token",
		Archetype = "PrinceShinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "This fighter is Dextrous while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Dextrous" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Dextrous" } },
					Target = "GearOwner"
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	DSNeutralRaidBoss = {
		Id = 121278495475107,
		Name = "Dekkad",
		Health = 10000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Firebrand",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		SummonAnimation = "DekkadSummon",
		SummonAnimationEffect = true,
		HealthGates = { ["7000"] = false, ["3000"] = false },
		OmniImmune = true,
		Dextrous = true,
		ObliterateImmune = true,
		CounterAttackBlock = true,
		BossCard = true,
		EffectVariable = 0,
		Effect = {
			Description = "You cannot lose life.\nDuring your end step: Destroy all gear attached to this card, then attach 2 gears to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						},
						{ "ChangeMusic", "DekkadP1", "Ally" }
					},
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{
							"EVGreaterValueCheck",
							{ 0, "Essences" }
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckFailEssences = {
					Power = {
						{
							"RandomEquipGear",
							{ "DSNGear1", "DSNGear2" },
							"Self"
						},
						{
							"RandomEquipGear",
							{ "DSNGear1", "DSNGear2", "DSNGear3", "DSNGear4", "DSNGear5" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassEssences = {
					Power = {
						{
							"RandomEquipGear",
							{ "DSNEssenceR", "DSNEssenceY", "DSNEssenceG", "DSNEssenceB" },
							"Self"
						},
						{
							"RandomEquipGear",
							{ "DSNEssenceR", "DSNEssenceY", "DSNEssenceG", "DSNEssenceB" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassP2Song = {
					Power = { { "ChangeMusic", "DekkadP2", "Ally" } },
					Target = "Self",
					NoBlip = true
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" },
						{
							"EVExactValueCheck",
							{ 1, "P2Song" },
							"Self"
						}
					},
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true,
			PierceOmni = true
		},
		Bio = ""
	},
	DSNGear1 = {
		Id = 5983839531,
		Name = "Sword",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this fighter attacks: it gains 50 power.",
			Ability = {
				OnAttack = {
					Power = { { "Strengthen", 50 } },
					Target = "GearOwner"
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	DSNGear2 = {
		Id = 5983841478,
		Name = "Trowel",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this fighter attacks: it gains 200 Health.",
			Ability = {
				OnAttack = {
					Power = { { "Heal", 200 } },
					Target = "GearOwner"
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	DSNGear3 = {
		Id = 5984363874,
		Name = "Slingshot",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this fighter attacks: it deals 100 damage to all enemy fighters.",
			Ability = {
				OnAttack = {
					Power = { { "Damage", 100 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	DSNGear4 = {
		Id = 5983868463,
		Name = "Rocket Launcher",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "This fighter has Overload While this is attached. Whenever this fighter attacks: it gains 200 Power until your next end step.",
			Ability = {
				OnAttack = {
					Power = { { "TempStrengthen", 200 } },
					Target = "Self"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "Overload" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Overload" } },
					Target = "GearOwner"
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	DSNGear5 = {
		Id = 5983845041,
		Name = "Superball",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent attacks: Destroy this gear and deal 1000 unblockable damage to the attacker.",
			Ability = {
				OnEnemyAttack = {
					Power = {
						{ "PierceDamage", 1000, "Aggressor" },
						{ "DestroyGear", "DSNGear5", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DSNEssenceR = {
		Id = 131769171651392,
		Name = "Essence of Imperium",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this gear is attached: Summon a 1000/0 Kilnkin Ward that obliterates itself on your next end step",
			Ability = {
				OnEquippedAlways = {
					Power = { { "Summon", "DSRKilnkin5-N", "Ally" } },
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	DSNEssenceY = {
		Id = 87954251108781,
		Name = "Essence of Justice",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this gear is attached: Attach 2 Pure Emotions to this fighter.",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"Self"
						},
						{
							"RandomEquipGear",
							{ "RaidEnvy", "RaidSloth", "RaidWrath", "RaidGreed" },
							"Self"
						}
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	DSNEssenceG = {
		Id = 118499187669458,
		Name = "Essence of Disregard",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an enemy fighter attacks: Attach 3 Poisonous Plagues to it.",
			Ability = {
				OnEnemyAttack = {
					Power = {
						{ "EquipGear", "PlaguePoison-N" },
						{ "EquipGear", "PlaguePoison-N" },
						{ "EquipGear", "PlaguePoison-N" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	DSNEssenceB = {
		Id = 118933653984948,
		Name = "Essence of Kralosa",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Gear = true,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "After this fighter is attacked for the first time each turn: Prevent all combat damage it would take for the rest of the turn.",
			Ability = {
				OnAttacked = {
					Power = { {
						"GivePassiveSpecific",
						{ Mitigation = 10000000000 }
					} },
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnStart = {
					Power = { { "RemovePassive", "Mitigation" } },
					Target = "Self"
				}
			},
			PierceOmni = true
		},
		Bio = ""
	},
	["Blinding Speed"] = {
		Id = 106792588109745,
		Name = "Blinding Speed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Terrariant = "Remnant Terrain",
		Terrain = true,
		DestroyImmune = true,
		StealImmune = true,
		AnimateImmune = true,
		ObliterateImmune = true,
		Undiscardable = true,
		PlayTest = true,
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "The opponent has 20 seconds on their turns.",
			Ability = {
				OnSummon = {
					Power = { { "ChangeMusic", "DekkadP3", "Ally" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEnd = {
					Power = { { "SetBattleTimer", 20 } },
					Target = "Ally"
				},
				OnEnemyEnd = {
					Power = { { "SetBattleTimer", -1 } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	KrampusBoss = {
		Id = 8100784617,
		Name = "Krampus",
		AltCards = {
			["KrampusBoss-H"] = { Health = 7000 }
		},
		Health = 5000,
		Power = 3000,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Flare",
		Color = "Red",
		Cost = { Neutral = 0 },
		DamageMitigation = 10000000000,
		Mitigation = 10000000000,
		OmniImmune = true,
		EquipGearImmune = true,
		ObliterateImmune = true,
		BossCard = true,
		AttackBlock = true,
		EffectVariable = 0,
		Effect = {
			Description = "You cannot lose life.\nThis card is immune to all damage.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				}
			},
			PierceLifeLoss = true,
			PierceOmni = true
		},
		Bio = "The Grief Bringer."
	},
	CKTF1 = {
		Name = "Evil Plushie Elf",
		AttackEffect = "Blizzard",
		Id = 8154254277,
		Health = 400,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Bio = "Mummy...why did Santa bring me something so scary?",
		Effect = {
			Description = "Whenever this card attacks: Deal 200 damage to what it attacked first.",
			Ability = {
				OnAttack = {
					Power = { { "Damage", 200, "Aggressor" } },
					Target = "Self"
				}
			}
		}
	},
	CKTF2 = {
		Name = "Evil Plushie Lion",
		AttackEffect = "Bite",
		Id = 8256329511,
		Bio = "The lion stole the child's eyes.",
		EffectAnimation = "Roar",
		Health = 200,
		Power = 800,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Summon", "CKTF1", "Ally" } },
					Target = "Self"
				}
			}
		}
	},
	CKTF3 = {
		Id = 8256493888,
		Name = "Plushie Reindeer",
		AttackEffect = "Bite",
		Bio = "deer sounds",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "At the start of your turns: All allied fighters gain 100 power.",
			Ability = {
				OnAllyStart = {
					Power = { { "Strengthen", 100, "Ally" } },
					Target = "Self"
				}
			}
		}
	},
	CKTF4 = {
		Id = 8256323483,
		Name = "Plushie Hula Dog",
		AttackEffect = "Bite",
		EffectAnimation = "Barking",
		Bio = "Uhh...isn't this a little out of season?",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "At the start of each turn: An allied fighter gains 100 health and power.",
			Ability = {
				OnStart = {
					Power = {
						{ "Strengthen", 100, "CustomTarget" },
						{ "Heal", 100, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = { "RandomCard", "HasntPassive" },
						Modifier = { RandomCard = 1, HasntPassive = "StrengthenImmune" },
						SubModifier = true
					},
					KeepSameTargets = true
				}
			}
		}
	},
	CKTF5 = {
		Name = "Plushie Nutcracker",
		Id = 8258523327,
		Bio = "It's clearly made out of wood. It's merely called a 'plushie' to be marketable.",
		AttackEffect = "Bite",
		Health = 1000,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "Whenever this card attacks or is attacked and survives: deal 150 damage to all enemy fighters.",
			Ability = {
				OnAttack = {
					Power = { { "Damage", 150, "Opponent" } },
					Target = "Self"
				},
				OnAttacked = {
					Power = { { "Damage", 150, "Opponent" } },
					Target = "Self"
				}
			}
		}
	},
	CKTF6 = {
		Name = "Plushie Polar Bear",
		AttackEffect = "Bite",
		EffectAnimation = "Roar",
		Id = 8256534471,
		Bio = "It guards the igloo against candy thieves.",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "Whenever an allied fighter dies: This card gains 100 health and power.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Strengthen", 100, "Self" },
						{ "Heal", 100, "Self" }
					},
					Target = "Self"
				}
			}
		}
	},
	CKTA1 = {
		Name = "Krampus Wants To Play",
		Id = 8256332181,
		Bio = "Krampus takes a lot of inspiration from Squid Game these days.",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Attach a Krampus's Meddling to all allied fighters.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "CKTG1", "Ally" } },
					Target = "Self"
				}
			}
		}
	},
	CKTG1 = {
		Id = 8256325511,
		Name = "Krampus's Meddling",
		Bio = "Children given Black Studs for christmas often receive lethal doses of radiation.",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Green",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "At the start of your turns: Your opponent loses 200 life.",
			Ability = {
				OnAllyStart = {
					Power = { { "Inflict", 200, "Opponent" } },
					Target = "Self"
				}
			}
		}
	},
	CKHF1 = {
		Id = 15176634059,
		Name = "Hellhail Imps",
		AttackEffect = "IcePunch",
		Bio = "\"These little Hellhail Imps as much as they love ruining the festive mood, they still hate each other ever since the \"Snowball Fight Incident\"\"",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Dextrous = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "Whenever this card attacks: Lock an enemy fighter for 1 turn.",
			Ability = {
				OnAttack = {
					Power = { { "Lock", 1, "SingleEnemy" } },
					Target = "Self"
				}
			}
		}
	},
	CKHF2 = {
		Name = "Hellhail Hounds",
		Id = 15628929507,
		AttackEffect = "FirePunch",
		Bio = "FETCH ME THEIR Gifts!!!",
		Health = 600,
		Power = 800,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Overload = true,
		Dextrous = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Lock", 1, "SingleEnemy" } },
					Target = "Self"
				}
			}
		}
	},
	CKHF3 = {
		Name = "Hellhail Chimneycrusher",
		Id = 15486360944,
		AttackEffect = "FirePunch",
		Bio = "How to make a family cold and giftless with one simple trick!",
		Health = 600,
		Power = 900,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "At the start of your turns: Destroy your opponent's terrain. This card gains 100 health and power.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Strengthen", 100, "Self" },
						{ "Heal", 100, "Self" },
						{ "DestroyTerrain" }
					},
					Target = "Opponent"
				}
			}
		}
	},
	CKHF4 = {
		Name = "Hellhail Mist Mage",
		Id = 15628929423,
		AttackEffect = "FirePunch",
		Bio = "Who touched the thermostat?!",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "When this card attacks: Return the attacked fighter to it's owner's hand.",
			Ability = {
				OnAttack = {
					Power = { { "Return" } },
					Target = "Aggressor"
				}
			}
		}
	},
	CKHF5 = {
		Id = 15252289490,
		Name = "Hellhail Giftshredder",
		AttackEffect = "Scratch",
		Bio = "The Hellhailers ruin all the holiday cheer, feeding on it. They shred presents and tear apart whatever's inside them. How cold of them.",
		Health = 800,
		Power = 150,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "At the start of each turn: Destroy the bottom card of the opponent's deck.",
			Ability = {
				OnStart = {
					Power = { {
						"MoveZone",
						{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		}
	},
	CKHF6 = {
		Name = "Hellhail Musher",
		Id = 15407461403,
		AttackEffect = "FirePunch",
		Bio = "Don't have to worry about slippery roads if you're on a sled, right?",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Description = "Whenever this card attacks: Summon a Hellhail Hounds.",
			Ability = {
				OnAttack = {
					Power = { { "Summon", "CKHF2" } },
					Target = "Ally"
				}
			}
		}
	},
	CKHF7 = {
		Id = 15486361064,
		Name = "Hellhail Giant",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 2500,
		PlayTest = true,
		TargetImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Summon a Greed Elemental with health equal to what it last had.",
			Ability = {
				OnDeath = {
					Power = { { "Summon", "CKHF7-2" } },
					Target = "Ally",
					MetaData = { Health = "Variable" }
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	["CKHF7-2"] = {
		Id = 16128534684,
		Name = "Greed Elemental",
		AttackEffect = "IcePunch",
		Health = 2500,
		Power = 0,
		Rarity = "Token",
		Color = "Yellow",
		Cost = { Neutral = 7 },
		EffectVariable = 2500,
		TargetImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Obliterate this card and summon a Hellhail Giant",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Summon", "CKHF7" },
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
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	CKA1 = {
		Name = "Krampus Playtime",
		Id = 8256330131,
		Bio = "His sick games leave your legs horribly kramped.",
		AltCards = {
			CKA2 = {
				Effect = {
					Description = "Krampus loses 1000 health. Summon 5 Evil toys.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 1000, "BossCard" },
								{
									"RandomSummon",
									{ "CKTF5", "CKTF6" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4", "CKTF5", "CKTF6" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			CKA3 = {
				Effect = {
					Description = "Krampus loses 1000 health. Summon 3 Evil Toys and 2 Hellhail underlings.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 1000, "BossCard" },
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4", "CKTF5", "CKTF6" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4", "CKTF5", "CKTF6" }
								},
								{
									"RandomSummon",
									{ "CKTF1", "CKTF2", "CKTF3", "CKTF4", "CKTF5", "CKTF6" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			CKA4 = {
				Effect = {
					Description = "Krampus loses 1000 health. Summon 5 Hellhail underlings.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 1000, "BossCard" },
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			CKA5 = {
				Effect = {
					Description = "Krampus loses 1000 health. Summon 5 Hellhail underlings.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 1000, "BossCard" },
								{
									"RandomSummon",
									{ "CKHF5", "CKHF6" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			CKA6 = {
				Effect = {
					Description = "Krampus loses 1000 health. Summon 5 Hellhail underlings.",
					Ability = {
						OnSummon = {
							Power = {
								{ "PierceDamage", 1000, "BossCard" },
								{ "Summon", "CKHF7" },
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								},
								{
									"RandomSummon",
									{ "CKHF1", "CKHF2", "CKHF3", "CKHF4", "CKHF5" }
								}
							},
							Target = "Ally"
						}
					}
				}
			},
			CKA7 = {
				Effect = {
					Description = "Krampus loses 1000 health.",
					Ability = {
						OnSummon = {
							Power = { { "PierceDamage", 1000, "BossCard" } },
							Target = "Ally"
						}
					}
				}
			}
		},
		AttackEffect = "FirePunch",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Krampus loses 1000 health. Summon 3 Evil toys.",
			Ability = {
				OnSummon = {
					Power = {
						{ "PierceDamage", 1000, "BossCard" },
						{
							"RandomSummon",
							{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
						},
						{
							"RandomSummon",
							{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
						},
						{
							"RandomSummon",
							{ "CKTF1", "CKTF2", "CKTF3", "CKTF4" }
						}
					},
					Target = "Ally"
				}
			}
		}
	},
	["Raid Titan of the Infernal Abyss"] = {
		Id = 9238693249,
		Name = "Titan of the Infernal Abyss",
		AltCards = {
			["Raid Titan of the Infernal Abyss-H"] = { Health = 2000, Power = 800, Overload = true }
		},
		Health = 1500,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Archetype = "Titan",
		Color = "Red",
		DamageImmune = true,
		WeakenImmune = true,
		Cost = { Red = 0 },
		Effect = {
			Description = "Whenever this card attacks: Deal 200 damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = { { "AllowRaidRewards", 0.5 } },
					Target = "Ally",
					NoBlip = true
				},
				OnAttack = {
					Power = { { "Damage", 200 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Guarding a pit of fire isn't as cool as it sounds."
	},
	["Raid Titan of the Deep Below"] = {
		Id = 9238695829,
		Name = "Titan of the Deep Below",
		AltCards = {
			["Raid Titan of the Deep Below-H"] = { Health = 3000, Power = 300, Dextrous = true }
		},
		Health = 2000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Storm",
		Archetype = "Titan",
		Color = "Blue",
		ReturnImmune = true,
		Cost = { Blue = 0 },
		Effect = {
			Description = "Whenever this card attacks: Enemy fighters lose 100 power.",
			Ability = {
				OnAttack = {
					Power = { { "Weaken", 100 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Cthulhu's cousin's cousin's cousin. He's like, BASICALLY the reason he became popular."
	},
	["Raid Titan's Stone"] = {
		Id = 4204449898,
		Name = "Titan's Stone",
		Health = 500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Titan",
		Stealth = true,
		Token = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Titan's Call",
			Description = "",
			Type = "Nil",
			Archetype = "Titan",
			Power = { {
				"RandomAdd",
				{
					"Red Titanic Stud",
					"Blue Titanic Stud",
					"Green Titanic Stud",
					"Yellow Titanic Stud"
				}
			} },
			Target = "Ally",
			Increase = 0
		},
		Bio = "WOAH!!! IT'S A ROCK!"
	},
	["Raid Titan of the Dying Forest"] = {
		Id = 9238694493,
		Name = "Titan of the Dying Forest",
		AltCards = {
			["Raid Titan of the Dying Forest-H"] = {
				Health = 3000,
				Power = 500,
				Effect = {
					Description = "When this card is cast: Summon two 500/0 Titan Stones with Defender.\nWhenever this card attacks: Allied fighters gain 200 health.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "Raid Titan's Stone" },
								{ "Summon", "Raid Titan's Stone" }
							},
							Target = "Ally",
							MetaData = { Shield = true }
						},
						OnAttack = {
							Power = { { "Heal", 200 } },
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 2000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Tempest",
		Archetype = "Titan",
		Color = "Green",
		DestroyImmune = true,
		Cost = { Green = 0 },
		Effect = {
			Description = "Whenever this card attacks: Allied fighters gain 200 health.",
			Ability = {
				OnAttack = {
					Power = { { "Heal", 200 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Are humans the real natural disaster?"
	},
	["Raid Titan of the Fried One"] = {
		Id = 9238691665,
		Name = "Titan of the Fried One",
		AltCards = {
			["Raid Titan of the Fried One-H"] = {
				Health = 2000,
				Power = 400,
				Effect = {
					Description = "During your end step: Summon a 100/0 Titan Stone. All allied fighters gain 100 health and power.",
					Ability = {
						OnEnd = {
							Power = {
								{ "Summon", "Raid Titan's Stone" },
								{ "Heal", 100 },
								{ "Strengthen", 100 }
							},
							Target = "Ally",
							MetaData = { Health = 100 }
						}
					}
				}
			}
		},
		Health = 1500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Titan",
		Color = "Yellow",
		TargetImmune = true,
		Cost = { Yellow = 0 },
		Effect = {
			Description = "During your end step: All allied fighters gain 100 health and power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Didn't you know? Telamon likes fried chicken almost as much as Shedletsky!!!"
	},
	["Raid The Forgotten One"] = {
		Id = 7675998558,
		Name = "The Forgotten One",
		AltCards = {
			["Raid The Forgotten One-H"] = {
				Power = 5000,
				Cost = { Neutral = 6 }
			}
		},
		Health = 5000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Divinity",
		Archetype = "Titan",
		Color = "Neutral",
		WeakenImmune = true,
		SetImmune = true,
		DamageImmune = true,
		ReturnImmune = true,
		DestroyImmune = true,
		TargetImmune = true,
		Cost = { Neutral = 0 },
		EffectAnimation = "HeadExplodeAsync",
		SummonAnimation = "ForgottenOne",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Deal 5000 damage to all enemy fighters. Unlock all Titans.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 5000, "Opponent" },
				{ "Unlock", 9999, "Archetype" }
			},
			Target = "NotArchetype"
		},
		Bio = "WE HID HIM FOR A REASON, F O O L."
	},
	["Raid Banished Nevermore"] = {
		Id = 11769901677,
		Name = "Banished Nevermore",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Stealth = true,
		PlayTest = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Telamon's Deck"] = "A deck of incredibly powerful rainbow cards not meant to be wielded by mortals."
		},
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Telamon can now be attacked and lose life. Obliterate all allied fighters. Gain {W}{R]{G}{B}{Y}. Put a stud of each color into your Baseplate. Replace your deck with Telamon's deck. Draw 3 cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetAttackFaceImmune", false, "Ally" },
						{ "DisableBypassLifeLoss" },
						{ "IgnoreRaidCastRule", true },
						{ "AddSpecialWinQuest", "BeatTelamonRaidSecret" },
						{ "AllowRaidRewards", 1 },
						{ "Obliterate", 30, "Ally" },
						{ "Neutral", 1 },
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 },
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Green Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 }
						},
						{ "RemoveDeck", 999 },
						{
							"RepeatingRandomDeckAdd",
							{
								{
									"RaidTelaWrath of the Fried One",
									"TelaCathedral of the Fried One",
									"TelaLeft Arm of the Fried One",
									"TelaLeft Leg of the Fried One",
									"TelaRight Leg of the Fried One",
									"TelaRight Arm of the Fried One",
									"RaidInceptionTime Token",
									"Master Acolyte's Altarr"
								},
								40
							},
							"Ally"
						},
						{ "Draw", 3 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Acolytes watched on as the dragons they worshipped were banished to a lower realm, never to escape. Now, they had to find something else to worship."
	},
	Raid2Youngtan = {
		Id = 101411916198875,
		Name = "Y??ungt.n",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Charge = true,
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Overgrown",
			Description = "After this card attacks: If the attacked fighter was marked; Deal 4 damage to all fighters 4 times.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "IsMarked", "Nil" },
							"Aggressor"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Damage", 4 },
						{ "Damage", 4 },
						{ "Damage", 4 },
						{ "Damage", 4 }
					},
					Target = "All"
				}
			}
		},
		Bio = "\tJsv izivc fmvh xlivi mw e wxsri xlvsar ex e fmvh."
	},
	Raid2MiniToon = {
		Id = 86673818580311,
		Name = "M;n1T..n",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Rope, Lamp Oil, Bombs",
			Description = "Once each turn when an allied fighter dies: Deal 4 damage to all fighters.",
			Type = "OnAllyDeath",
			Power = { { "Damage", 4 } },
			Target = "All",
			TurnTriggerLimit = 1
		},
		Bio = "\tPmji mw wlsvx, xlsykl M oiit xlmw jvsq qc glmphvir."
	},
	Raid2Godlysinha = {
		Id = 119602318374640,
		Name = "God////?sin",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Recyclables",
		EffectAnimation = "AssassinMark",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Bio = "Jsv izivc omrh wxverkiv, xlivi mw sri als asyph fvieo csy.",
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Bonanza!",
			Description = "When this card is cast: Mark a target fighter.",
			Ability = {
				OnSummon = {
					Power = { {
						"GivePassive",
						"Marked",
						nil,
						nil,
						nil,
						nil,
						"AssassinMark"
					} },
					Target = "SingleEnemy"
				}
			}
		}
	},
	Raid2CanadianSanic = {
		Id = 107035546996888,
		Name = "C4n4di4nS-??ic",
		Health = 1000,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Slash",
		Dextrous = true,
		Rank = 6,
		Color = "Neutral",
		Cost = { Neutral = 8 },
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Mark all enemy fighters.",
			Type = "OnSummon",
			Power = { {
				"GivePassive",
				"Marked",
				nil,
				nil,
				nil,
				nil,
				"AssassinMark"
			} },
			Target = "Opponent"
		},
		Bio = "Xlex’w e gsrwivzexmzi iwxmqexi."
	},
	Raid2Bobaman1 = {
		Id = 138879413868275,
		Name = "b1b1m.1n1",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "ShootAll", -- FIX: missing cast animation (the regular Bobaman1 has it)
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Bonk",
			Description = "When this card is cast: It deals 4 damage to all fighters. If there's four or more enemy fighters, deal 4 damage 4 times instead.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 3 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Damage", 4, "All" } },
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "Damage", 4, "All" },
						{ "Damage", 4, "All" },
						{ "Damage", 4, "All" },
						{ "Damage", 4, "All" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\tXli asvph mw ex piewx jmjxc tivgirx xivvmfpi."
	},
	Raid2Spectrabox = {
		Id = 89470630353490,
		Name = "Sp!!ct&&r0b0x",
		Health = 650,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Thug life",
			Description = "Once each turn when this card takes damage from anything: It generates.",
			Type = "OnDamaged",
			Power = { { "Generate", 1, "Self" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "\tM eq xvcmrk xs wipp xliq xli asvph."
	},
	Raid2FixingFailure = {
		Id = 98962417186077,
		Name = "^x%ng",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Rank = 5,
		Color = "Neutral",
		Cost = { Neutral = 7 },
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever your opponent casts a fighter: This card gains 150 health. \n When this card takes damage from anything: It gains 150 power.",
			Ability = {
				OnEnemySummon = {
					Power = { { "Heal", 150 } },
					Target = "Self"
				},
				OnDamaged = {
					Power = { { "Strengthen", 150 } },
					Target = "Self"
				}
			}
		},
		Bio = "..g...s..p..s"
	},
	Raid2Moded = {
		Id = 85563901411087,
		Name = "M0d3,",
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Rank = 5,
		Dextrous = true,
		Overload = true,
		Color = "Neutral",
		Cost = { Neutral = 7 },
		CustomReminder = { ["Unknown Card"] = "Invalid Data. Please see G.P." },
		Effect = {
			Name = "Scripted Shockwave",
			Description = "When this card is cast or attacks: Deal 44 damage to all fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 44 } },
					Target = "All"
				},
				OnAttack = {
					Power = { { "Damage", 44 } },
					Target = "All"
				}
			}
		},
		Bio = "Xlmw pmji xlex ai'vi pmzmr mr."
	},
	Raid2DataRaven = {
		Id = 137416212115259,
		Name = "Dat????aa",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Superball",
		EffectAnimation = "AssassinMark",
		Color = "Neutral",
		Rank = 4,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Clocked",
			Description = "When this card attacks: Mark a target fighter.",
			Type = "OnAttack",
			Power = { {
				"GivePassive",
				"Marked",
				nil,
				nil,
				nil,
				nil,
				"AssassinMark"
			} },
			Target = "SingleEnemy"
		},
		Bio = "Jsspmwl qmrh."
	},
	Raid2Donald = {
		Id = 101344740427542,
		Name = "Don??????????llavry",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "LinkedSword",
		EffectAnimation = "AssassinMark",
		Rank = 4,
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "WWW",
			Description = "Once each turn whenever you cast another Colourless fighter: Mark a target fighter.",
			Type = "On|Other|AllySummon",
			Power = { {
				"GivePassive",
				"Marked",
				nil,
				nil,
				nil,
				nil,
				"AssassinMark"
			} },
			Color = "Neutral",
			Target = "SingleEnemy",
			TurnTriggerLimit = 1
		},
		Bio = "Wxerhmrk ex xli jssx sj e vemrfsa."
	},
	Raid2TheAssassin = {
		Id = 6319951708,
		Name = "Th3 4ss4ss1n",
		Health = 444,
		Power = 444,
		Rarity = "Token",
		CounterAttackBlock = true,
		OmniImmune = true,
		AttackEffect = "Slash",
		Color = "Neutral",
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
							{ "Raid2TheAssassin", "Field_Ally", "Deck_Ally", true, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "My aim stays still."
	},
	Raid2Action1 = {
		Id = 6319951708,
		Name = "Into My Lasting Death",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		OmniImmune = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Assimilate",
			Description = "Deal 444 damage to a target fighter 4 times. Put a Colourless Stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 444 },
						{ "Damage", 444 },
						{ "Damage", 444 },
						{ "Damage", 444 },
						{
							"AddGenZone",
							{ "Neutral Stud", 1 },
							"Ally"
						}
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "Your death is absolute."
	},
	Raid2Action2 = {
		Id = 6319951708,
		Name = "Into Your One Existance",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		OmniImmune = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Assimilate",
			Description = "Deal 4 damage to all fighters 4 times. Put a colourless stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 4 },
						{ "Damage", 4 },
						{ "Damage", 4 },
						{ "Damage", 4 },
						{
							"AddGenZone",
							{ "Neutral Stud", 1 },
							"Ally"
						}
					},
					Target = "All"
				}
			}
		},
		Bio = "My love stays true."
	},
	Raid2Action3 = {
		Id = 6319951708,
		Name = "Once Her First Love",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		OmniImmune = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		EffectAnimation = "AssassinMark",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Assimilate",
			Description = "Mark a target fighter. Search for Th3 4ss4ss1n from wherever it is. Put a colourless stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Marked" },
						{
							"MoveZone",
							{ "Raid2TheAssassin", "Deck_Ally", "Hand_Ally", true, false }
						},
						{
							"MoveZone",
							{ "Raid2TheAssassin", "GraveZone_Ally", "Hand_Ally", true, false }
						},
						{
							"AddGenZone",
							{ "Neutral Stud", 1 },
							"Ally"
						}
					},
					Target = "Target"
				}
			}
		},
		Bio = "Your aim will waver."
	},
	Raid2Action4 = {
		Id = 6319951708,
		Name = "Into Our Long Nights",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		OmniImmune = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Assimilate",
			Description = "Mark all enemy fighters. Put a colourless stud into your baseplate.",
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
							"AssassinMark"
						},
						{
							"AddGenZone",
							{ "Neutral Stud", 1 },
							"Ally"
						}
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "It was their fault."
	},
	["Draconic CounselXeal"] = {
		Id = 17787945663,
		Name = "Draconic Counsel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 6, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select 3 cards from the top 7 cards of your deck. Search those cards, then shuffle the rest into your deck.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 3 } },
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = { { "ReplaceRarity", "Common" } },
					Target = "Self",
					TotalTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = "Their sudden meeting forced both of them to swallow their pride. The man, forced to face the chaos he had inadvertantly caused. The dragon, forced to ask for assistance from beings he thought beneath him."
	},
	["Discovery of RebirthXeal"] = {
		Id = 12144956244,
		Name = "Discovery of Rebirth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Fading = true,
		Cost = { Blue = 9 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Give yourself 6 Necroenzyme Vials. Change their cost to {W}{W}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Necroenzyme VialXeal", "Ally" },
						{ "Add", "Necroenzyme VialXeal", "Ally" },
						{ "Add", "Necroenzyme VialXeal", "Ally" },
						{ "Add", "Necroenzyme VialXeal", "Ally" },
						{ "Add", "Necroenzyme VialXeal", "Ally" },
						{ "Add", "Necroenzyme VialXeal", "Ally" }
					},
					Target = "Self",
					MetaData = {
						Cost = { Neutral = 2 }
					},
					OnAnyTrigger = {
						Power = { { "ReplaceRarity", "Epic" } },
						Target = "Self",
						TotalTriggerLimit = 1,
						NoBlip = true
					}
				}
			}
		},
		Bio = "Eisenhower unlocked the secret to prolonging a person's life, the greatest scientific achievement in Robloxian history - and the miracle he needed to bring back his husband.<br/><br/>He was a fool."
	},
	["Necroenzyme VialXeal"] = {
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
			Zombified = "When a zombified card leaves play for any reason, obliterate it."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Select one of 3 fighter cards in your graveyard.\nRecur that card, except it's zombified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = { Zombified = true }
				}
			},
			AmountOfTargets = 3
		},
		Bio = "Its horrid potential never crossed Eisenhower's mind. He only wanted to bring back his love."
	},
	["Damnatio MemoriaeCulstist"] = {
		Id = 137705947523882,
		Name = "Damnatio Memoriae",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 200, 600 },
		Addant = "Moonleak-DS",
		CustomReminderMoonleak = true,
		CustomReminder = {
			["Scorn Imperfection"] = "Fleeting cards and studs are destroyed if they're not used by your end step."
		},
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns, if your starting deck has only Colourless cards in it: You gain fleeting {W}{W}{R}{G}{B}{Y} and give yourself a fleeting Moonleak.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Neutral", 2 },
						{ "TempNeutral", 2 },
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 },
						{ "Add", "Addant" }
					},
					Target = "Ally",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "A wasteland of the Utopia, repurposed to conceal the Claymaker's failures; He can't admit his failures are so plentiful that they can't be hidden."
	},
	demonninjaterrain = {
		Id = 140140009795251,
		Name = "*substitute* heh, missed me.",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "xxdemonninjaxx",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All allied fighters gain Haste. Return them to your hand.",
			Ability = {
				OnEnd = {
					Power = {
						{ "GivePassive", "Charge", "Ally" },
						{ "Return", 30, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "psssh...nothin personnel...kid..."
	},
	RaidJohnNoEscape = {
		Id = 119250663342308,
		Name = "no escape",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrain = true,
		Cost = { Neutral = 0 },
		OmniImmune = true,
		TokenOmni = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "when this card is cast: obliterate all enemy fighters.\nduring your end step: enemy fighters lose 100 Health.\nyour opponent loses 10 life for each second spent during their turn.whenever your opponent gains life: they lose double that amount.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"ChangeMusicNoFade",
							"JohnPhase2",
							"Ally",
							nil,
							nil,
							nil,
							"JohnBackground"
						},
						{ "Obliterate", 30, "Opponent" }
					},
					Target = "Opponent"
				},
				OnEnd = {
					Power = { {
						"Damage",
						100,
						"Opponent",
						nil,
						nil,
						nil,
						"JohnMelting"
					} },
					Target = "Opponent"
				},
				OnEnemyStart = {
					Power = { { "JohnTimer" } },
					Target = "Opponent"
				},
				OnEnemyLifeGain = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "LastLifeTaken", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", "2", "Nil" },
							"Self"
						},
						{ "Inflict", "Variable" }
					},
					Target = "Opponent",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	RaidJohnMeeboid1 = {
		Id = 112120035868226,
		Name = "doomsayer meebling",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "whenever your opponent attacks: all allied fighters gain 50 health.",
			Ability = {
				OnEnemyAttack = {
					Power = { { "Heal", "50" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	RaidJohnMeeboid2 = {
		Id = 112120035868226,
		Name = "doomsayer meebling",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "this isn't my fault i didn't ask for this.",
			Ability = {
				OnEnemyAttack = {
					Power = { { "Heal", "100" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	RaidJohnNinja1 = {
		Id = 85535593738904,
		Name = "doomfighter ninja",
		Health = 100,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "whenever an allied fighter dies: this card gains 250 health.",
			Ability = {
				OnAllyDeath = {
					Power = { { "Heal", "250" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	RaidJohnNinja2 = {
		Id = 85535593738904,
		Name = "doomfighter ninja",
		Health = 2000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "please.",
			Ability = {}
		},
		Bio = ""
	},
	RaidJohnCelestial1 = {
		Id = 137580965899994,
		Name = "doombringer celestial",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Defender = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "when this card dies: your opponent loses 200 life.",
			Ability = {
				OnDeath = {
					Power = { { "Inflict", 200, "Opponent" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	RaidJohnNoob1 = {
		Id = 89158643606311,
		Name = "doomrider noob",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "",
			Ability = {}
		},
		Bio = ""
	},
	RaidJohnNoob2 = {
		Id = 89158643606311,
		Name = "doomrider noob",
		Health = 600,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mimic",
			Description = "dreams of mine which i once found worth pursuing are now all dead. are all of our dreams meant to die? or just mine.",
			Ability = {}
		},
		Bio = ""
	},
	TestPositionBoss = {
		Id = 131769171651392,
		Name = "UNIT_4, Forgemaster",
		Health = 8000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Scorch",
		Color = "Red",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["2000"] = false },
		AttackBlock = true,
		BossCard = true,
		SpecificFieldLocation = "TestBossPosition",
		Effect = {
			Description = "You cannot lose life.\nWhen this card dies: your opponent wins the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						},
						{ "Summon", "TestAddSummon1" },
						{ "Summon", "TestAddSummon2" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	TestAddSummon1 = {
		Id = 87592145587791,
		Name = "Kilnkin Charger",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		SpecificFieldLocation = "TestAddPosition1",
		Effect = {
			Description = "At the start of your turns: Attach a Forgecharge to RaidBoss.",
			Ability = {
				OnAllyStart = {
					Power = { { "EquipGear", "DSRForgeCharge" } },
					Target = "BossCard"
				}
			}
		},
		Bio = " "
	},
	TestAddSummon2 = {
		Id = 87592145587791,
		Name = "Kilnkin Charger",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		SpecificFieldLocation = "TestAddPosition2",
		Effect = {
			Description = "At the start of your turns: Attach a Forgecharge to RaidBoss.",
			Ability = {
				OnAllyStart = {
					Power = { { "EquipGear", "DSRForgeCharge" } },
					Target = "BossCard"
				}
			}
		},
		Bio = " "
	},
	DS2Deidre = {
		Id = 0,
		Name = "Shinkaioh Suit",
		AltCards = {
			["DS2Deidre-N"] = {
				Effect = {
					Description = "This fighter takes half damage when not stunned, and cannot take more than 1000 damage at once. It loses all power when stunned.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleBothCannons" },
									"Self"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "Intro", 9, false },
									"Self"
								},
								{ "SetFatigueImmune" },
								{ "BypassLifeLoss" },
								{
									"GenZoneDiscard",
									{ "Neutral", 0 }
								}
							},
							Target = "Ally"
						},
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Field_Ally", "DS2DeidreRailgun", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "NoneCannons" },
									"Self"
								},
								{
									"GivePassiveSpecific",
									{ MultMitigation = 0.5 }
								},
								{ "SetPower", 600 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassNoneCannons = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleNoCannons" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "IdleNoCannons", 0, true },
									"BossCard"
								}
							},
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreCannon" }
						},
						OnDeath = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "Hide" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "NormalDefeat", 8.1, false },
									"Self"
								},
								{ "Cost", 99999 }
							},
							Target = "Ally",
							AllowDeadAggressorTriggers = true
						},
						OnHealthGate = {
							Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
							Target = "Opponent"
						}
					}
				}
			},
			["DS2Deidre-H"] = {
				MultMitigation = 1,
				SetHealthImmune = true,
				SwapImmune = true,
				TransformImmune = true,
				DivideImmune = true,
				SuspendImmune = true,
				Effect = {
					Description = "This fighter is immune to damage when not stunned, and cannot take more than 1000 damage at once. It loses all power when stunned.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleBothCannons" },
									"Self"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "Intro", 9, false },
									"Self"
								},
								{ "SetFatigueImmune" },
								{ "BypassLifeLoss" },
								{
									"GenZoneDiscard",
									{ "Neutral", 0 }
								}
							},
							Target = "Ally"
						},
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Add", "Field_Ally", "DS2DeidreRailgun", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "NoneCannons" },
									"Self"
								},
								{
									"GivePassiveSpecific",
									{ MultMitigation = 1 }
								},
								{ "SetPower", 600 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassNoneCannons = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleNoCannons" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "IdleNoCannons", 0, true },
									"BossCard"
								}
							},
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreCannon" }
						},
						OnDeath = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "Hide" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "NormalDefeat", 8.1, false },
									"Self"
								},
								{ "Cost", 99999 }
							},
							Target = "Ally",
							AllowDeadAggressorTriggers = true
						},
						OnHealthGate = {
							Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 8000,
		Power = 600,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Minigun",
		Color = "Green",
		Cost = { Neutral = 0 },
		HealthGates = { ["6000"] = false, ["2000"] = false },
		SummonAnimation = "DeidreSound1",
		AttackBlock = true,
		DestroyImmune = true,
		WeakenImmune = true,
		BossCard = true,
		HideLocks = true,
		DamageCap = 1000,
		MultMitigation = 0.5,
		SpecificFieldLocation = "BossPosition",
		Effect = {
			Description = "This fighter takes half damage when not stunned, and cannot take more than 1000 damage at once. It loses all power when stunned.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleBothCannons" },
							"Self"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "Intro", 9, false },
							"Self"
						},
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Field_Ally", "DS2DeidreRailgun", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "NoneCannons" },
							"Self"
						},
						{
							"GivePassiveSpecific",
							{ MultMitigation = 0.5 }
						},
						{ "SetPower", 600 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassNoneCannons = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleNoCannons" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "IdleNoCannons", 0, true },
							"BossCard"
						}
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreCannon" }
				},
				OnDeath = {
					Power = {
						{ "ChangeMusic", "Silence", "Ally" },
						{
							"GivePassiveSpecific",
							{ IdleOverride = "StoryDefeatIdle" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "StoryDefeatStart", 7.1, false },
							"Self"
						},
						{ "Summon", "DS2Alexandra", "Opponent" },
						{
							"EnemySpeech",
							{ "Kyaggggghhh!!", "DeidreTalk", 4 },
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"I finally figured it out, grandmother.",
								"SacrificeTalk",
								4
							},
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"I didn’t do this for me or Robloxia.",
								"SacrificeTalk",
								3
							},
							"Self"
						},
						{
							"NPCSpeech",
							{ "Alexandra", "I’ve done this for you.", "SacrificeTalk", 3 },
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"The first time you clung onto life, you got reincarnated into such a hideous form.",
								"SacrificeTalk",
								5
							},
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"I don’t want to imagine what horrors the Stairway has for you at the bottom.",
								"SacrificeTalk",
								3
							},
							"Self"
						},
						{
							"EnemySpeech",
							{ "You would strike down your own grandmother?", "DeidreTalk", 4 },
							"Self"
						},
						{
							"EnemySpeech",
							{ "Have I not suffered enough…?", "DeidreTalk", 4 },
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"You’re right. You <i>have</i> suffered enough.",
								"SacrificeTalk",
								4
							},
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"Your next incarnation will make what you’ve been through look like a joke.",
								"SacrificeTalk",
								5
							},
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Alexandra",
								"No more of us will suffer as you did. I <i>will</i> ensure that.",
								"SacrificeTalk",
								5
							},
							"Self"
						},
						{
							"NPCSpeech",
							{ "Alexandra", "I love you, Deidre.", "SacrificeTalk", 4 },
							"Self"
						},
						{
							"EnemySpeech",
							{ "…", "DeidreTalk", 2 },
							"Self"
						},
						{
							"EnemySpeech",
							{ "I-I love you too… My angel…", "DeidreTalk", 4 },
							"Self"
						},
						{
							"GivePassiveSpecific",
							{ IdleOverride = "Hide" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "StoryDefeatFinish", 8.2, false },
							"Self"
						},
						{ "Cost", 99999 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	DS2DeidreRailgun = {
		Id = 0,
		Name = "Armored Railgun",
		AltCards = {
			["DS2DeidreRailgun-H"] = {
				Health = 1000,
				Power = 200,
				CustomReminder = {
					["Vulnerable Target"] = "You will lose 1200 life if this triggers while you have no fighters in play."
				},
				Effect = {
					Description = "Starts with 3 Exertion. At the start of Shinkaioh Suit's turns: Destroy a gear attached to this card, then if there are no gear attached to this: Deal 1200 Overloaded damage to a target fighter and Obliterate this.\n When this dies, if the other weapon is also destroyed: Shinkaioh Suit EX becomes stunned until the start of their next turn.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							NoBlip = true,
							TotalTriggerLimit = 1
						},
						OnAllyStart = {
							Power = {
								{ "DestroyGear", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" },
									"Self"
								},
								{ "EVExactValueCheck", 0, "Self" }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleNoCannons" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "Stun", 0, true },
									"BossCard"
								},
								{ "RemovePassive", "MultMitigation", "BossCard" },
								{ "SetPower", 0, "BossCard" }
							},
							Target = "Self",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreMinigun" }
						},
						OnDeathBypass = {
							Power = {
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleRightCannon" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "IdleRightCannon", 0, false },
									"BossCard"
								}
							},
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreMinigun" }
						},
						OnEVCheckPass = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "HasNoFighter" },
									"Self"
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckFailHasNoFighter = {
							Power = {
								{ "DamageOverloaded", 1200, "CustomTarget" },
								{ "Obliterate" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						},
						OnEVCheckPassHasNoFighter = {
							Power = {
								{ "Inflict", 1200, "Opponent" },
								{ "Obliterate" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 800,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		HideLocks = true,
		Archetype = "Cannons",
		AttackEffect = "Laser",
		DeathAnimation = "DeidreSound6",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		SpecificFieldLocation = "MinigunPosition",
		Effect = {
			Description = "Starts with 3 Exertion. At the start of Shinkaioh Suit's turns: Destroy a gear attached to this card, then if there are no gear attached to this: Deal 1200 Overloaded damage to a target fighter and Obliterate this.\n When this dies, if the other weapon is also destroyed: Shinkaioh Suit EX becomes stunned until the start of their next turn.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAllyStart = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleNoCannons" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "Stun", 0, true },
							"BossCard"
						},
						{ "RemovePassive", "MultMitigation", "BossCard" },
						{ "SetPower", 0, "BossCard" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreMinigun" }
				},
				OnDeathBypass = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleRightCannon" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "IdleRightCannon", 0, false },
							"BossCard"
						}
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreMinigun" }
				},
				OnEVCheckPass = {
					Power = {
						{ "DamageOverloaded", 1200, "CustomTarget" },
						{ "Obliterate" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	DS2DeidreMinigun = {
		Id = 0,
		Name = "Armored Minigun",
		AltCards = {
			["DS2DeidreMinigun-H"] = { Health = 1000, Power = 200 }
		},
		Health = 800,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		HideLocks = true,
		AttackEffect = "Minigun",
		DeathAnimation = "DeidreSound6",
		Archetype = "Cannons",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		SpecificFieldLocation = "RailgunPosition",
		Effect = {
			Description = "Starts with 3 Exertion. At the start of Shinkaioh Suit's turns: Destroy a gear attached to this card, then if there are no gear attached to this: Deal 300 damage to all enemy fighters and Obliterate this.\n When this dies, if the other weapon is also destroyed: Shinkaioh Suit EX becomes stunned until the start of their next turn.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAllyStart = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleNoCannons" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "Stun", 0, true },
							"BossCard"
						},
						{ "RemovePassive", "MultMitigation", "BossCard" },
						{ "SetPower", 0, "BossCard" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnDeathBypass = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleLeftCannon" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "IdleLeftCannon", 0, false },
							"BossCard"
						}
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPass = {
					Power = {
						{ "Damage", 300, "Opponent" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2DeidreCannon = {
		Id = 0,
		Name = "Nuclear Reactor Cannon",
		Health = 2000,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackBlock = true,
		HideLocks = true,
		DestroyImmune = true,
		AttackEffect = "Laser",
		DeathAnimation = "DeidreSound6",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		SpecificFieldLocation = "CorePosition",
		Effect = {
			Description = "Starts with 4 Exertion. At the start of Shinkaioh Suit EX's turns: Destroy a gear attached to this card, then if there are no gear attached to this: Deal 2000 unblockable damage to all enemy fighters and the player loses 2000 life. Obliterate this.\n When this dies: Shinkaioh Suit EX becomes stunned until the start of their next turn.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion", nil, nil, nil, "DeidreSound4" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAllyStart = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 2, "Stage2" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "Stage3" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "FireCannon" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnDeath = {
					Power = {
						{ "RemovePassive", "Hidden", "BossCard" },
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 10 },
							"Self"
						},
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleNoCannons" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "Stun", 0, true },
							"BossCard"
						},
						{ "RemovePassive", "MultMitigation", "BossCard" },
						{ "SetPower", 0, "BossCard" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					NoBlip = true
				},
				OnDeathBypass = {
					Power = { { "RemovePassive", "Hidden", "BossCard" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassStage2 = {
					Power = { {
						"GivePassiveSpecific",
						{ IdleOverride = "BeamStage2" },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassStage3 = {
					Power = { {
						"GivePassiveSpecific",
						{ IdleOverride = "BeamStage3" },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassFireCannon = {
					Power = {
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 10 },
							"Self"
						},
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleNoCannons" },
							"BossCard",
							nil,
							nil,
							"DeidreSound5"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "BeamFiring", 10.1, false },
							"BossCard"
						},
						{ "PierceDamage", 2000, "Opponent" },
						{ "Inflict", 2000, "Opponent" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2DeidreRocket = {
		Id = 102488375512499,
		Name = "Seeking Rocket",
		Health = 600,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Description = "Whenever this card attacks: Destroy it and what it attacked. Your opponent loses 400 life.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Destroy", 30, "Aggressor" },
						{ "Inflict", 400, "Opponent" },
						{ "Destroy", 30, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Deidre-A1"] = {
		Id = 135223588464868,
		Name = "Destruction",
		AltCards = {
			["DS2Deidre-A1-H"] = {
				Effect = {
					Description = "Deal 300 overloaded damage to all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Subtract", "Field_Ally", "DS2DeidreRailgun", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "BothCannons" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "NoneCannons" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 1, "MinigunOnly" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ -1, "RailgunOnly" },
									"Self"
								},
								{ "DamageOverloaded", 300, "Opponent" }
							},
							Target = "Self"
						},
						OnEVCheckPassBothCannons = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackBothCannons", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
						},
						OnEVCheckPassNoneCannons = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackNoCannons", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
						},
						OnEVCheckPassMinigunOnly = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackLeftCannon", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassRailgunOnly = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackRightCannon", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		EffectAnimation = "DeidreSound2",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 200 overloaded damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Field_Ally", "DS2DeidreRailgun", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "BothCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "NoneCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "MinigunOnly" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ -1, "RailgunOnly" },
							"Self"
						},
						{ "DamageOverloaded", 200, "Opponent" }
					},
					Target = "Self"
				},
				OnEVCheckPassBothCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackBothCannons", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassNoneCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackNoCannons", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassMinigunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackLeftCannon", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassRailgunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackRightCannon", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = " "
	},
	["DS2Deidre-A2"] = {
		Id = 125158868773322,
		Name = "Suppression",
		AltCards = {
			["DS2Deidre-A2-H"] = {
				Effect = {
					Description = "Deal 600 overloaded damage to an enemy fighter. It loses 300 power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Subtract", "Field_Ally", "DS2DeidreRailgun", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "BothCannons" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "NoneCannons" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 1, "MinigunOnly" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ -1, "RailgunOnly" },
									"Self"
								},
								{ "DamageOverloaded", 600, "CustomTarget" },
								{ "Weaken", 300, "CustomTarget" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						},
						OnEVCheckPassBothCannons = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackBothCannons", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
						},
						OnEVCheckPassNoneCannons = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackNoCannons", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true,
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
						},
						OnEVCheckPassMinigunOnly = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackLeftCannon", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPassRailgunOnly = {
							Power = { {
								"PlayBossAnimation",
								{ "DeidreMechBody", "FingerCannonsAttackRightCannon", 3.6, false },
								"BossCard"
							} },
							Target = "Self",
							NoBlip = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		EffectAnimation = "DeidreSound2",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 400 overloaded damage to an enemy fighter. It loses 200 power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Field_Ally", "DS2DeidreRailgun", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "BothCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "NoneCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "MinigunOnly" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ -1, "RailgunOnly" },
							"Self"
						},
						{ "DamageOverloaded", 400, "CustomTarget" },
						{ "Weaken", 200, "CustomTarget" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				},
				OnEVCheckPassBothCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackBothCannons", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassNoneCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackNoCannons", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassMinigunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackLeftCannon", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassRailgunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "FingerCannonsAttackRightCannon", 3.6, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = " "
	},
	["DS2Deidre-A3"] = {
		Id = 118383254788356,
		Name = "Domination",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "An enemy fighter loses all power until their next end step.",
			Ability = {
				OnSummon = {
					Power = { { "TempWeaken", 99999, "CustomTarget" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	DS2DeidreCoreAttack = {
		Id = 102561900344043,
		Name = "Defensive Fire",
		AltCards = {
			["DS2DeidreCoreAttack-H"] = {
				Effect = {
					Description = "Deal 200 damage to all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "BeamFingerCannonsAttack", 4.2, false },
									"BossCard"
								},
								{ "Damage", 200, "Opponent" }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		EffectAnimation = "DeidreSound2",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 150 damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "BeamFingerCannonsAttack", 4.2, false },
							"BossCard"
						},
						{ "Damage", 150, "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2DeidreGunSummon = {
		Id = 125059751770785,
		Name = "READY CANNONS",
		AltCards = {
			["DS2DeidreGunSummon-H"] = {
				Effect = {
					Description = "Summon the Armored Railgun and Armored Minigun.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "DS2DeidreRailgun-H", "Ally" },
								{ "Summon", "DS2DeidreMinigun-H", "Ally" },
								{
									"GivePassiveSpecific",
									{ IdleOverride = "IdleBothCannons" },
									"BossCard"
								},
								{
									"PlayBossAnimation",
									{ "DeidreMechBody", "IdleBothCannons", 0, false },
									"BossCard"
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon the Armored Railgun and Armored Minigun.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "DS2DeidreRailgun", "Ally" },
						{ "Summon", "DS2DeidreMinigun", "Ally" },
						{
							"GivePassiveSpecific",
							{ IdleOverride = "IdleBothCannons" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "IdleBothCannons", 0, false },
							"BossCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2DeidreCoreSummon = {
		Id = 121688898971331,
		Name = "REACTOR CHARGE INITIATED",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		EffectAnimation = "DeidreSound7",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "The Reactor Cannon is now charging.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Obliterate", 30, "CustomTarget" },
						{
							"GivePassiveSpecific",
							{ IdleOverride = "BeamStage1" },
							"BossCard"
						},
						{
							"PlayBossAnimation",
							{ "DeidreMechBody", "BeamTransition", 4.2, false },
							"BossCard"
						},
						{ "GivePassive", "Hidden", "BossCard" },
						{ "Summon", "DS2DeidreCannon", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "Cannons",
						SubModifier = true
					}
				}
			}
		},
		Bio = " "
	},
	DS2DeidreRocketSummon = {
		Id = 137663127619148,
		Name = "DEPLOYING ROCKETS",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		SummonAnimation = "DeidreSound2",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Summon 4 Seeking Rockets.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "DS2DeidreMinigun", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Field_Ally", "DS2DeidreRailgun", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "BothCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "NoneCannons" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "MinigunOnly" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ -1, "RailgunOnly" },
							"Self"
						},
						{ "Summon", "DS2DeidreRocket", "Ally" },
						{ "Summon", "DS2DeidreRocket", "Ally" },
						{ "Summon", "DS2DeidreRocket", "Ally" },
						{ "Summon", "DS2DeidreRocket", "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckPassBothCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "MissilesFiringBothCannons", 5, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 1, 9, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassNoneCannons = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "MissilesFiringNoCannons", 5, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_DS2DeidreRailgun" }
				},
				OnEVCheckPassMinigunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "MissilesFiringLeftCannon", 5, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassRailgunOnly = {
					Power = { {
						"PlayBossAnimation",
						{ "DeidreMechBody", "MissilesFiringRightCannon", 5, false },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = " "
	},
	DS2Alexandra = {
		Id = 123337340688735,
		Name = "Alexandra Feodorovna",
		Health = 400,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Green = 2, Neutral = 2 },
		EffectVariable = 0,
		PlayTest = true,
		Rank = 9,
		Archetype = "Candidate",
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "Obliterate", 30, "CustomTarget" },
						{ "BypassCardDeath", 1 }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Rank"
					}
				}
			}
		},
		IsMentoring = true,
		Bio = ""
	},
	DS2WraithsTerrain = {
		Id = 107470550092212,
		Name = "Great Injustice City",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 0 },
		EffectVariable = 3,
		Terrain = true,
		Terrariant = "PandnotP",
		ForceTerrarianStatline = { 100, 1000 },
		ReplaceDescriptionant = "Variable Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Your opponent loses 400 life.\nWhen this card is at 0 charges or an allied fighter dies: set its charges to 2.",
		Effect = {
			Name = "Reincarnation",
			Description = "3 Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Your opponent loses 400 life.\nWhen this card is at 0 charges or an allied fighter dies: set its charges to 3.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Inflict", 400 },
						{
							"AlterEV",
							{ "Set", "Math", 3, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Opponent"
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 3, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Red Warrior"] = {
		Id = 89187033960718,
		Name = "Randal, Red Wraith",
		AltCards = {
			["Red Warrior-H"] = { Health = 1200, Power = 400 }
		},
		Health = 800,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 2,
		ReplaceDescriptionant = "Variable Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Deal 300 Overloaded damage to all enemy fighters and set its charges to 2.",
		AttackBlock = true,
		TransformImmune = true,
		Effect = {
			Description = "2 Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Deal 300 Overloaded damage to all enemy fighters and set its charges to 2.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DamageOverloaded", 300 },
						{
							"AlterEV",
							{ "Set", "Math", 2, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	["Yellow Warrior"] = {
		Id = 83702055034131,
		Name = "Yuni, Yellow Wraith",
		AltCards = {
			["Yellow Warrior-H"] = {
				Health = 1200,
				Effect = {
					Description = "At the start of your turns: A card in your opponent's hand becomes fleeting.\nWhenever a card flees their hand or is discarded while fleeting: They lose 400 life.",
					Ability = {
						OnAllyStart = {
							Power = { { "GivePassive", "Fleeting", "CustomTarget" } },
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "RandomCard",
								Modifier = 1
							}
						},
						OnEnemyFleetingDestroy = {
							Power = { { "Inflict", 400 } },
							Target = "Opponent"
						},
						OnEnemyDiscard = {
							Power = { { "Inflict", 400 } },
							Target = "Opponent",
							HasPassive = "Fleeting"
						}
					}
				}
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		AttackBlock = true,
		TransformImmune = true,
		Effect = {
			Description = "At the start of your turns: A card in your opponent's hand becomes fleeting.\nWhenever a card flees their hand or is discarded while fleeting: They lose 300 life.",
			Ability = {
				OnAllyStart = {
					Power = { { "GivePassive", "Fleeting", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "RandomCard",
						Modifier = 1
					}
				},
				OnEnemyFleetingDestroy = {
					Power = { { "Inflict", 300 } },
					Target = "Opponent"
				},
				OnEnemyDiscard = {
					Power = { { "Inflict", 300 } },
					Target = "Opponent",
					HasPassive = "Fleeting"
				}
			}
		},
		Bio = ""
	},
	["Black Warrior"] = {
		Id = 106757051722008,
		Name = "Bill, Black Wraith",
		AltCards = {
			["Black Warrior-H"] = { Health = 1200 }
		},
		Health = 800,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Summonant = "Gilmuraig",
		AttackBlock = true,
		TransformImmune = true,
		Effect = {
			Description = "During your end step: Summon a 100/1000 Gilmuraig with overload.",
			Ability = {
				OnEnd = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self",
					MetaData = { Overload = true }
				}
			}
		},
		Bio = ""
	},
	["Blue Warrior"] = {
		Id = 94906647619648,
		Name = "Brandon, Blue Wraith",
		AltCards = {
			["Blue Warrior-H"] = { Health = 1200 }
		},
		Health = 800,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 2,
		Summonant = "Gilmuraig",
		ReplaceDescriptionant = "Variable Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Lock an enemy fighter for 3 turns and set this card's charges to 2.",
		AttackBlock = true,
		TransformImmune = true,
		Effect = {
			Description = "2 Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Lock an enemy fighter for 3 turns and set this card's charges to 2.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Lock", 3 },
						{
							"AlterEV",
							{ "Set", "Math", 2, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = ""
	},
	["Green Warrior"] = {
		Id = 70815309021029,
		Name = "Gerry, Green Wraith",
		AltCards = {
			["Green Warrior-H"] = { Health = 1200 }
		},
		Health = 800,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 2,
		ReplaceDescriptionant = "Variable Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Your opponent loses 400 life and all allied fighters gain 200 health. Set this card's charges to 2.",
		AttackBlock = true,
		TransformImmune = true,
		Effect = {
			Description = "2 Charges.\nDuring your end step, Remove a charge from this card, if it's at 0 charges: Your opponent loses 400 life and all allied fighters gain 200 health. Set this card's charges to 2.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "Heal", 200, "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 2, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Wraithzord = {
		Id = 78097842710644,
		Name = "Wraithzord",
		AltCards = {
			["DS2Wraithzord-H"] = {
				Health = 6000,
				Power = 500,
				WeakenImmune = true,
				SwapImmune = true,
				LockImmune = true,
				DamageCap = 1000,
				Effect = {
					Description = "This fighter cannot take more than 1000 damage at once.",
					Ability = {
						OnDeath = {
							Power = { { "Cost", 99999 } },
							Target = "Ally"
						},
						OnHealthGate = {
							Power = { { "ForceTurn", nil, nil, nil, nil, "DarkEmotionSelfFlag" } },
							Target = "Opponent"
						}
					},
					PierceLifeLoss = true
				}
			}
		},
		Health = 5000,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		HealthGates = { ["2000"] = false },
		DestroyImmune = true,
		TransformImmune = true,
		SwapImmune = true,
		ObliterateImmune = true,
		SetImmune = true,
		EquipGearImmune = true,
		CounterAttackBlock = true,
		Overload = true,
		BossCard = true,
		Effect = {
			Description = "",
			Ability = {
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "DarkEmotionSelfFlag" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	DS2WraithA1 = {
		Id = 89187033960718,
		Name = "Red Despair Strike!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 250 Overloaded damage to all enemy fighters",
			Ability = {
				OnSummon = {
					Power = { { "DamageOverloaded", 250 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	DS2WraithA2 = {
		Id = 83702055034131,
		Name = "Yellow Battle Screech!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "The Wraithzord gains 400 power.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 400 } },
					Target = "BossCard"
				}
			}
		},
		Bio = ""
	},
	DS2WraithA3 = {
		Id = 106757051722008,
		Name = "Black Call Of Death!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Summonant = "Gilmuraig",
		Effect = {
			Description = "Summon two 100/1000 Gilmuraigs with overload.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Summon", "Summonant", "Ally" }
					},
					Target = "Self",
					MetaData = { Overload = true }
				}
			}
		},
		Bio = ""
	},
	DS2WraithA4 = {
		Id = 94906647619648,
		Name = "Blue Blast of Misery!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Lock an enemy fighter for 3 turns. It loses 300 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Lock", 3 },
						{ "Weaken", 300 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = ""
	},
	DS2WraithA5 = {
		Id = 70815309021029,
		Name = "Green Kick of True Pain!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 0 },
		EffectVariable = 2,
		Effect = {
			Description = "Destroy an enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Destroy" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = ""
	},
	DS2WraithEnrage = {
		Id = 74478167427891,
		Name = "Combined Strike! Lash Out In Rage!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "The Wraithzord's power doubles.",
			Ability = {
				OnSummon = {
					Power = { { "MultiplyPower", 2, "BossCard", nil, nil, "DarkEmotionSelfFlag" } },
					Target = "BossCard"
				}
			}
		},
		Bio = ""
	},
	DS2Invade1 = {
		Id = 105878054768507,
		Name = "Invading Triton",
		AltCards = {
			["DS2Invade1-Spiral"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "2 Exertion. Whenever this fighter attacks: Destroy a gear attached to this card, if none are left, attach 2 Exertion and all allied fighters gain 100 health and power.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							NoBlip = true,
							TotalTriggerLimit = 1
						},
						OnAttack = {
							Power = {
								{ "DestroyGear", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" }
								},
								{
									"EVExactValueCheck",
									{ 0, "GearCheck" }
								}
							},
							Target = "Self"
						},
						OnAllyDeath = {
							Power = {
								{ "EquipGear", "Wrath", nil, nil, nil, "WrathEmotionSwirl" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedArchetypeCount", "Emotion" }
								},
								{
									"EVGreaterValueCheck",
									{ 2, "SpiralCheck" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassGearCheck = {
							Power = {
								{ "Strengthen", 100, "Ally" },
								{ "Heal", 100, "Ally" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self"
						},
						OnEVCheckPassSpiralCheck = {
							Power = {
								{ "Obliterate", nil, nil, nil, nil, "DarkEmotionSelfFlag" },
								{ "Summon", "Gilmuraig", "Ally" }
							},
							Target = "Self",
							MetaData = { Health = 500, Overload = true }
						}
					}
				}
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "2 Exertion. Whenever this fighter attacks: Destroy a gear attached to this card, if none are left, attach 2 Exertion and all allied fighters gain 100 health and power.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAttack = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 100, "Ally" },
						{ "Heal", 100, "Ally" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Invade2 = {
		Id = 136083127861617,
		Name = "Invading Tidemage",
		AltCards = {
			["DS2Invade2-Rebirth"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "2 Exertion. During your end step: Destroy a gear attached to this card, if none are left, attach 2 Exertion, an enemy fighter loses 300 power.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							NoBlip = true,
							TotalTriggerLimit = 1
						},
						OnEnd = {
							Power = {
								{ "DestroyGear", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" }
								},
								{ "EVExactValueCheck", 0 }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = { {
								"RandomSummon",
								{ "Cow", "Bunny Token" },
								"Ally"
							} },
							Target = "Self",
							MetaData = { Health = 500, Power = 500 }
						},
						OnEVCheckPass = {
							Power = {
								{ "Weaken", 300, "CustomTarget" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						}
					}
				}
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "2 Exertion. During your end step: Destroy a gear attached to this card, if none are left, attach 2 Exertion, an enemy fighter loses 300 power.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnEnd = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Weaken", 300, "CustomTarget" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = ""
	},
	DS2Invade3 = {
		Id = 86514853162616,
		Name = "Invading Hunter",
		Health = 1300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "2 Exertion. Whenever this fighter attacks: Destroy a gear attached to this card, if none are left, attach 2 Exertion and deal 600 damage to the fighter being attacked.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAttack = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "TargetCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "Damage", 600, "EVCard" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Invade4 = {
		Id = 98146582343121,
		Name = "Invading Doctor",
		AltCards = {
			["DS2Invade4-Spiral"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "When this card dies: It deals 100 damage to all enemy fighters, then 100 damage to all unattached fighters.",
					Ability = {
						OnDeath = {
							Power = {
								{ "Damage", 100, "Opponent" },
								{ "Damage", 100 }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally", "Enemy" },
								Condition = "HasGear",
								Modifier = false
							}
						},
						OnAllyDeath = {
							Power = {
								{ "EquipGear", "Wrath", nil, nil, nil, "WrathEmotionSwirl" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedArchetypeCount", "Emotion" }
								},
								{
									"EVGreaterValueCheck",
									{ 2, "SpiralCheck" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassSpiralCheck = {
							Power = {
								{ "Obliterate", nil, nil, nil, nil, "DarkEmotionSelfFlag" },
								{ "Summon", "Gilmuraig", "Ally" }
							},
							Target = "Self",
							MetaData = { Health = 500, Overload = true }
						}
					}
				}
			},
			["DS2Invade4-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "When this card dies: It deals 200 damage to all enemy fighters, then 200 damage to all unattached fighters.",
					Ability = {
						OnDeath = {
							Power = {
								{ "Damage", 200, "Opponent" },
								{ "Damage", 200 }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally", "Enemy" },
								Condition = "HasGear",
								Modifier = false
							}
						}
					}
				}
			},
			["DS2Invade4-Spiral-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "When this card dies: It deals 200 damage to all enemy fighters, then 200 damage to all unattached fighters.",
					Ability = {
						OnDeath = {
							Power = {
								{ "Damage", 200, "Opponent" },
								{ "Damage", 200 }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally", "Enemy" },
								Condition = "HasGear",
								Modifier = false
							}
						},
						OnAllyDeath = {
							Power = {
								{ "EquipGear", "Wrath", nil, nil, nil, "WrathEmotionSwirl" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedArchetypeCount", "Emotion" }
								},
								{
									"EVGreaterValueCheck",
									{ 2, "SpiralCheck" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassSpiralCheck = {
							Power = {
								{ "Obliterate", nil, nil, nil, nil, "DarkEmotionSelfFlag" },
								{ "Summon", "Gilmuraig", "Ally" }
							},
							Target = "Self",
							MetaData = { Health = 500, Overload = true }
						}
					}
				}
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: It deals 100 damage to all enemy fighters, then 100 damage to all unattached fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Damage", 100, "Opponent" },
						{ "Damage", 100 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = ""
	},
	DS2Invade5 = {
		Id = 124641834026211,
		Name = "Invading Warden",
		AltCards = {
			["DS2Invade4-Rebirth"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever a gear is removed from an allied fighter: that fighter gains 50 power.",
					Ability = {
						OnAllyUnequip = {
							Power = { { "Strengthen", 50 } },
							Target = "Aggressor"
						},
						OnDeath = {
							Power = { {
								"RandomSummon",
								{ "DS2Invade3", "Noob" },
								"Ally"
							} },
							Target = "Self",
							MetaData = { Health = 500, Power = 500 }
						}
					}
				}
			},
			["DS2Invade4-Rebirth-H"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever a gear is removed from an allied fighter: that fighter gains 100 health and power.",
					Ability = {
						OnAllyUnequip = {
							Power = {
								{ "Strengthen", 100 },
								{ "Heal", 100 }
							},
							Target = "Aggressor"
						},
						OnDeath = {
							Power = { {
								"RandomSummon",
								{ "DS2Invade3", "Noob" },
								"Ally"
							} },
							Target = "Self",
							MetaData = { Health = 500, Power = 500 }
						}
					}
				}
			},
			["DS2Invade4-H2"] = {
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever a gear is removed from an allied fighter: that fighter gains 100 health and power.",
					Ability = {
						OnAllyUnequip = {
							Power = {
								{ "Strengthen", 100 },
								{ "Heal", 100 }
							},
							Target = "Aggressor"
						}
					}
				}
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a gear is removed from an allied fighter: that fighter gains 50 power.",
			Ability = {
				OnAllyUnequip = {
					Power = { { "Strengthen", 50 } },
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	DS2Delonix = {
		Id = 138856153485984,
		Name = "Invading Delonix",
		AltCards = {
			["DS2Delonix-H"] = {
				Health = 3000,
				SetImmune = true,
				WeakenImmune = true,
				SwapImmune = true,
				LockImmune = true,
				ReturnImmune = true,
				DamageCap = 1000,
				Effect = {
					Name = "Reincarnation",
					Description = "This fighter cannot take more than 1000 damage at once.\n2 Exertion. Whenever this fighter attacks: Destroy a gear attached to this card, if none are left, attach 2 Exertion and this gains 1000 power.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							NoBlip = true,
							TotalTriggerLimit = 1
						},
						OnAttack = {
							Power = {
								{ "DestroyGear", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" }
								},
								{ "EVExactValueCheck", 0 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{ "Strengthen", 1000 },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 2500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		DestroyImmune = true,
		TransformImmune = true,
		CounterAttackBlock = true,
		Overload = true,
		BossCard = true,
		Summonant = "DS2Bubble",
		Effect = {
			Name = "Reincarnation",
			Description = "4 Exertion. Whenever this fighter attacks: Destroy a gear attached to this card, if none are left, attach 4 Exertion and this gains 1000 power.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnAttack = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 1000 },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Bubblemancer = {
		Id = 126104329831169,
		Name = "Invading Bubblemancer",
		AltCards = {
			["DS2Bubblemancer-H"] = {
				Health = 3500,
				SetImmune = true,
				WeakenImmune = true,
				SwapImmune = true,
				LockImmune = true,
				ReturnImmune = true,
				DamageCap = 1000,
				Effect = {
					Name = "Reincarnation",
					Description = "This fighter cannot take more than 1000 damage at once.\nSummons 2 800/0 Bubbles. 3 Exertion. During your end step: Destroy a gear attached to this card, if none are left, attach 2 Exertion and summon a Bubble.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "Summon", "Summonant" },
								{ "Summon", "Summonant" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self",
							NoBlip = true,
							TotalTriggerLimit = 1
						},
						OnEnd = {
							Power = {
								{ "DestroyGear", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" }
								},
								{ "EVExactValueCheck", 0 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{ "Summon", "Summonant" },
								{ "EquipGear", "Exertion" },
								{ "EquipGear", "Exertion" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 3000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		DestroyImmune = true,
		TransformImmune = true,
		CounterAttackBlock = true,
		Overload = true,
		BossCard = true,
		Summonant = "DS2Bubble",
		Effect = {
			Name = "Reincarnation",
			Description = "Summons 2 800/0 Bubbles. 5 Exertion. During your end step: Destroy a gear attached to this card, if none are left, attach 4 Exertion and summon a Bubble.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnEnd = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" },
						{ "EquipGear", "Exertion" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Bubble = {
		Id = 135408573015338,
		Name = "Bubble",
		Health = 800,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		PlayTest = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Steal an enemy fighter in play or in their hand and attach it to this with it's effect disabled. When this card dies: Give your opponent a copy of each card attached to it.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "TargetToSelf", "CustomTarget" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Opponent", "Nil", false, false },
							"CustomTarget"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field", "Enemy_Hand" },
						Condition = { "HasntPassive", "SelectionRandomCard" },
						Modifier = { HasntPassive = "Protagonist", SelectionRandomCard = 1 }
					},
					MetaData = {
						Effect = {
							Name = "Haydoscale",
							Description = "",
							Ability = {
								Nil = {
									Power = { { "Neutral", 0, "Ally" } },
									Target = "Self"
								}
							}
						}
					},
					TotalTriggerLimit = 1,
					KeepSameTargets = true
				},
				OnDeath = {
					Power = { { "AddCopy" } },
					Target = "SelfGear",
					AllowDeadAggressorTriggers = true
				}
			},
			AddCopyToOpponent = true
		},
		Bio = ""
	},
	DS2InvadeIsaak = {
		Id = 132022730271419,
		Name = "Isaak Brodsky",
		AltCards = {
			["DS2InvadeIsaak-H"] = { ReturnImmune = true, TransformImmune = true }
		},
		Health = 2000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 2, Neutral = 2 },
		EffectVariable = 0,
		PlayTest = true,
		Archetype = "Candidate",
		Rageborne = true,
		Protagonist = true,
		CantDie = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this fighter would die: Reset it's stats. You lose 1000 life.\nWhenever this fighter finishes attacking: deal 300 damage to all enemy fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "Cost", 1000 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnAttackEnd = {
					Power = { { "Damage", 300 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "<b><font color=\"#ff0d0d\">\"LET ALL WHO SEEK GLORY OVER THE WEAK AND BROKEN BE BROKEN UPON MY BLADE!\"</font></b>"
	},
	DS2Technician = {
		Id = 123075299755659,
		Name = "Noumenal Warden",
		Health = 5000,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		HealthGates = { ["2000"] = false },
		AttackBlock = true,
		BossCard = true,
		Effect = {
			Description = "",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnHealthGate = {
					Power = {
						{ "ForceTurn", nil, nil, nil, nil, "ZanzelRaidNextPhase" },
						{
							"GivePassiveSpecific",
							{ Mitigation = 999999999 },
							"Self",
							nil,
							nil,
							"ShimmeringActive"
						},
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 999999999 },
							"Self"
						}
					},
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	["DS2Technician-A1"] = {
		Id = 70458075992299,
		Name = "Slash()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 200 damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 200, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Technician-A2"] = {
		Id = 70458075992299,
		Name = "Execute()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 600 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 600, "SingleEnemy" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Technician-A3"] = {
		Id = 70458075992299,
		Name = "Disable()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 1,
		Effect = {
			Description = "Deal 400 damage to a target enemy fighter. Put two Vengeful Blessings onto card spaces in your opponent's hand until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 400, "SingleEnemy" },
						{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
						{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Technician-Special1"] = {
		Id = 70458075992299,
		Name = "IdentifyWeakpoint()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Attach to Noumenal Warden. At the start of it's next turn: Deal 1000 overloaded damage to a target enemy fighter, Then destroy this.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "DS2Technician-Special1", "BossCard" } },
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{ "DamageOverloaded", 1000, "SingleEnemy" },
						{ "DestroyGear", "DS2Technician-Special1", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2StoryEpicKatana = {
		Id = 107392977531834,
		Name = "The Epic Katana",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		Undiscardable = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 4000 damage to a target enemy fighter. If it has a shield: Destroy it instead. Give yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "TargetCard" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Mitigation" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Add", "Target", "HasPassive", "DamageMitigation" },
							"SingleEnemy"
						},
						{ "EVGreaterValueCheck", 1, "Self" },
						{ "Add", "DS2StoryEpicKatana", "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "RemovePassive", "DamageMitigation", "EVCard", nil, nil, "EKSlash" },
						{ "RemovePassive", "Mitigation", "EVCard", nil, nil, "ShieldEnd" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "Damage", 4000, "EVCard", nil, nil, "EKSlash" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2EditorHorde = {
		Id = 140177363586092,
		Name = "Horde of Editors",
		AltCards = {
			DS2EditorHorde2 = { Health = 600, Power = 600 },
			DS2EditorHorde3 = { Health = 700, Power = 700 }
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Color = "Neutral",
		PlayTest = true,
		Cost = { Green = 3, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "EquipGear", "Variable", "Self" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2Tainted = {
		Id = 127777336703898,
		Name = "Dmitri Shostakovich",
		Health = 1200,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		PlayTest = true,
		ObliterateImmune = true,
		Archetype = "Candidate",
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Spiral" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	DS2TaintedPurifier = {
		Id = 139942580236718,
		Name = "The Purifier",
		Health = 2000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "EKSlash",
		Color = "Red",
		Cost = { Red = 9 },
		EffectVariable = 0,
		PlayTest = true,
		Archetype = "Candidate",
		Protagonist = true,
		CantDie = true,
		ObliterateImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this fighter would die: Reset it's stats. You lose 1000 life.\nWhenever this fighter finishes attacking: deal 300 damage to all enemy fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "Cost", 1000 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnAttackEnd = {
					Power = { { "Damage", 300 } },
					Target = "Opponent"
				},
				OnAllyStart = {
					Power = { { "ChangeMusic", "DS2Tainted", "Ally" } },
					Target = "Opponent",
					TotalTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	DS2TaintedClayfestation = {
		Id = 125601281768654,
		Name = "Hadean Mudfall",
		Health = 50,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Color = "Red",
		PlayTest = true,
		ObliterateImmune = true,
		Cost = { Neutral = 1, Red = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Obliterate" } },
					Target = "All",
					TotalTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["DS2Yang-Chiyou, Sword of Cothran"] = {
		Id = 13381690130,
		Name = "Yang-Chiyou, Sword of Cothran",
		Health = 2000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Battleaxe",
		Color = "Red",
		Archetype = "Vagabond",
		HealthGates = { ["1000"] = false },
		CounterAttackBlock = true,
		ObliterateImmune = true,
		Cost = { Red = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this fighter attacks: All enemy fighters lose 300 Power. Swap their stats.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Weaken", 300, nil, nil, nil, "VagabondRageGlint" },
						{ "Swap", 999999 }
					},
					Target = "Opponent"
				},
				OnHealthGate = {
					Power = {
						{ "Obliterate", 30, "All" },
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 999 },
							"Self",
							nil,
							nil,
							"VagabondRageGlint"
						},
						{
							"MoveZone",
							{ "All", "Hand_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{ "RemoveDeck", 999, "All" },
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{ "SetFatigueImmune", 30, "All" },
						{ "Add", "DS2ChiyouEpicKatana", "NotCardOwner" }
					},
					Target = "Opponent"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally"
				},
				OnSummon = {
					Power = {
						{ "SetFatigueImmune", 30, "Ally" },
						{ "BypassLifeLoss" }
					},
					Target = "Ally",
					NoBlip = true
				}
			},
			PierceLifeLoss = true
		},
		Bio = "Even he, one who values peace, knows when altercations are unavoidable. The spirits and his own answered accordingly."
	},
	["DS2Hazenwyld, Dying Sanctum"] = {
		Id = 13381672976,
		Name = "Hazenwyld, Dying Sanctum",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "DemonLordScratch",
		Color = "Red",
		Terrain = true,
		Terrariant = "PandnotP",
		Archetype = "Vagabond",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, Whenever you cast a Vagabond: Search your deck for it's Soulmate.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Soulmate", "Nil" }
						},
						{ "Tutorfor", "Variable", "Ally" }
					},
					Target = "Aggressor",
					Archetype = "Vagabond",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "They wander forth, searching for a new home."
	},
	DS2ChiyouEpicKatana = {
		Id = 107392977531834,
		Name = "The Epic Katana",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		Undiscardable = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 4000 damage to a target enemy fighter. If it has a shield: Destroy it instead. Give yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "TargetCard" },
							"SingleEnemy"
						},
						{ "ReplaceCardArt", "118553363929852", "SingleEnemy" },
						{ "ChangeMusic", "Silence", "Ally" },
						{ "EVGreaterValueCheck", 1, "Self" },
						{ "Add", "DS2ChiyouEpicKatana", "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "Damage", 4000, "EVCard", nil, nil, "EKSlash" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = " "
	},
	DS2Nyarl = {
		Id = 0,
		Name = "Nyarlhotep",
		AltCards = {
			["DS2Nyarl-N"] = {
				SummonAnimation = "NyarlSound1Fast",
				Effect = {
					Description = "This fighter cannot take more than 4000 damage at once.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "ShortIntro", 7, false },
									"Self"
								},
								{ "SetFatigueImmune" },
								{ "BypassLifeLoss" },
								{
									"GenZoneDiscard",
									{ "Neutral", 0 }
								},
								{ "ChangeMusic", "DS2Nyarlhotep", "Ally" }
							},
							Target = "Ally"
						},
						OnDeath = {
							Power = { { "Cost", 99999 } },
							Target = "Ally",
							AllowDeadAggressorTriggers = true
						},
						OnHealthGate = {
							Power = {
								{
									"MoveZone",
									{ "All", "Hand_Ally", "Nil", true, false, 10 },
									"Self"
								},
								{
									"MoveZone",
									{ "All", "Hand_Opponent", "Nil", true, false, 10 },
									"Self"
								},
								{ "ForceTurn", nil, nil, nil, nil, "NyarlNextPhase" }
							},
							Target = "Opponent",
							TargetParameters = {
								Zones = { "Ally_Field", "Enemy_Field" },
								Condition = "OtherCards"
							}
						}
					},
					PierceLifeLoss = true
				}
			},
			["DS2Nyarl-H"] = {
				SetHealthImmune = true,
				SwapImmune = true,
				DivideImmune = true,
				SuspendImmune = true,
				ObliterateImmune = true,
				TransformImmune = true,
				SummonAnimation = "NyarlSound1Fast",
				Effect = {
					Description = "This fighter cannot take more than 4000 damage at once.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "ShortIntro", 7, false },
									"Self"
								},
								{ "SetFatigueImmune" },
								{ "BypassLifeLoss" },
								{
									"GenZoneDiscard",
									{ "Neutral", 0 }
								},
								{ "ChangeMusic", "DS2Nyarlhotep", "Ally" }
							},
							Target = "Ally"
						},
						OnDeath = {
							Power = { { "Cost", 99999 } },
							Target = "Ally",
							AllowDeadAggressorTriggers = true
						},
						OnHealthGate = {
							Power = {
								{
									"MoveZone",
									{ "All", "Hand_Ally", "Nil", true, false, 10 },
									"Self"
								},
								{
									"MoveZone",
									{ "All", "Hand_Opponent", "Nil", true, false, 10 },
									"Self"
								},
								{ "ForceTurn", nil, nil, nil, nil, "NyarlNextPhase" }
							},
							Target = "Opponent",
							TargetParameters = {
								Zones = { "Ally_Field", "Enemy_Field" },
								Condition = "OtherCards"
							}
						}
					},
					PierceLifeLoss = true
				}
			}
		},
		Health = 50000,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Gravity",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		HealthGates = { ["20000"] = false },
		AttackBlock = true,
		DestroyImmune = true,
		WeakenImmune = true,
		ReturnImmune = true,
		SetHealthImmune = true,
		StealImmune = true,
		BossCard = true,
		HideLocks = true,
		DamageCap = 4000,
		SummonAnimation = "NyarlSound1",
		SpecificFieldLocation = "BossPosition",
		Effect = {
			Description = "This fighter cannot take more than 4000 damage at once.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "Intro", 12, false },
							"Self"
						},
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						},
						{ "ChangeMusic", "DS2Nyarlhotep", "Ally" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Cost", 99999 } },
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnHealthGate = {
					Power = {
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 10 },
							"Self",
							nil,
							nil,
							"NyarlNextPhase"
						},
						{
							"MoveZone",
							{ "All", "Hand_Opponent", "Nil", true, false, 10 },
							"Self"
						},
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "ForceTurn", 6, false },
							"Self"
						},
						{ "Draw", 0, "Opponent", nil, nil, "NyarlSlash5" },
						{ "Obliterate", 30, "CustomTarget" },
						{ "ChangeMusic", "Silence", "Ally" },
						{ "ForceTurn" }
					},
					Target = "Opponent",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "OtherCards"
					}
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	DS2NyarlSentry = {
		Id = 109597288164930,
		Name = "Eye of The Overseer",
		AltCards = {
			["DS2NyarlSentry-H"] = {
				Health = 800,
				Power = 400,
				Effect = {
					Description = "At the start of your turn: Deal 150 unblockable damage to a random enemy fighter.\nWhen this card dies: Your opponent gains {W}.",
					Ability = {
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									150,
									"EVCard",
									nil,
									nil,
									nil,
									"FireBlastWhite"
								}
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						},
						OnDeath = {
							Power = { { "Neutral", 1 } },
							Target = "Opponent"
						}
					}
				}
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gravity",
		Color = "Neutral",
		PlayTest = true,
		AttackBlock = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "At the start of your turn: Deal 50 unblockable damage to a random enemy fighter.\nWhen this card dies: Your opponent gains {W}.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"PierceDamage",
							50,
							"EVCard",
							nil,
							nil,
							nil,
							"FireBlastWhite"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				},
				OnDeath = {
					Power = { { "Neutral", 1 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	["DS2Nyarl-A1"] = {
		Id = 72919085338410,
		Name = "Ａｄｊｕｄｉｃａｔｅ",
		AltCards = {
			["DS2Nyarl-A1-2"] = {
				Effect = {
					Description = "Deal 900 Overloaded damage to a target enemy fighter",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "UpwardSlash", 0, false },
									"BossCard"
								},
								{
									"DamageOverloaded",
									900,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlSlash1"
								}
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 600 Overloaded damage to a target enemy fighter",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "UpwardSlash", 0, false },
							"BossCard"
						},
						{
							"DamageOverloaded",
							600,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlSlash1"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	["DS2Nyarl-B1"] = {
		Id = 95364041838701,
		Name = "Ｒｅｓｔｒａｉｎｅｄ Ｗｉｌｌ",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 1,
		Effect = {
			Description = "Put a Vengeful Blessing onto each even numbered card space in your opponent's hand until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "MagicAttack", 1, false },
							"BossCard",
							nil,
							nil,
							nil,
							"NyarlMagicStatus"
						},
						{ "AddHandModifier", "VengefulBless", "Self" }
					},
					Target = "Self",
					MetaData = {
						SlotTargets = { 1, 3, 5, 7, 9 }
					}
				}
			},
			BlessOpponent = true
		},
		Bio = " "
	},
	["DS2Nyarl-B2"] = {
		Id = 95364041838701,
		Name = "Ｒｅｓｔｒａｉｎｅｄ Ｍｉｎｄ",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 1,
		Effect = {
			Description = "Put a Vengeful Blessing onto each odd numbered card space in your opponent's hand until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "MagicAttack", 1, false },
							"BossCard",
							nil,
							nil,
							nil,
							"NyarlMagicStatus"
						},
						{ "AddHandModifier", "VengefulBless", "Self" }
					},
					Target = "Self",
					MetaData = {
						SlotTargets = { 0, 2, 4, 6, 8 }
					}
				}
			},
			BlessOpponent = true
		},
		Bio = " "
	},
	["DS2Nyarl-A2"] = {
		Id = 124248160177144,
		Name = "Ｃｏｎｓｃｉｏｕｓ Ｓｔｒｉｋｅ",
		AltCards = {
			["DS2Nyarl-A2-2"] = {
				Effect = {
					Description = "Deal 200 Unblockable damage to a target enemy fighter. Repeat this effect three times.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "ComboAttack", 0, false },
									"BossCard"
								},
								{
									"PierceDamage",
									200,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlSlash4"
								},
								{ "DelayClient", 0.27, "Ally" },
								{
									"PierceDamage",
									200,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlMagic1"
								},
								{ "DelayClient", 0.28, "Ally" },
								{
									"PierceDamage",
									200,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlSlash4"
								},
								{ "DelayClient", 0.25, "Ally" },
								{
									"PierceDamage",
									200,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlSlash4"
								}
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 100 Unblockable damage to a target enemy fighter. Repeat this effect three times.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "ComboAttack", 0, false },
							"BossCard"
						},
						{
							"PierceDamage",
							100,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlSlash3"
						},
						{ "DelayClient", 0.27, "Ally" },
						{
							"PierceDamage",
							100,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlMagic1"
						},
						{ "DelayClient", 0.28, "Ally" },
						{
							"PierceDamage",
							100,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlSlash3"
						},
						{ "DelayClient", 0.25, "Ally" },
						{
							"PierceDamage",
							100,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlSlash3"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	["DS2Nyarl-A3"] = {
		Id = 122553054585560,
		Name = "Ｃｏｄｅ＇ｓ Ｂｉｎｄｉｎｇｓ",
		AltCards = {
			["DS2Nyarl-A3-2"] = {
				Effect = {
					Description = "Lock a target enemy fighter for two turns. Halve its power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "MagicAttack", 1, false },
									"BossCard",
									nil,
									nil,
									nil,
									"NyarlMagic1"
								},
								{ "Lock", 2, "CustomTarget" },
								{ "MultiplyPower", 0.5, "CustomTarget" }
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Lock a target enemy fighter for two turns. Halve its power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "MagicAttack", 1, false },
							"BossCard",
							nil,
							nil,
							nil,
							"NyarlMagic1"
						},
						{ "Lock", 2, "CustomTarget" },
						{ "MultiplyPower", 0.5, "CustomTarget" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	["DS2Nyarl-Burn"] = {
		Id = 104547720119345,
		Name = "Ｓｈａｃｋｌｅｂｒｅａｋｅｒ Ｃｈａｒｇｅ",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Attach to Nyarlhotep. Whenever Nyarlhotep takes damage, destroy this.\n If this gear is attached at the start of Nyarlhotep's turn: It's opponent loses 1000 life.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "DS2Nyarl-Burn" } },
					Target = "BossCard"
				},
				OnDamaged = {
					Power = { { "DestroyGear", "DS2Nyarl-Burn" } },
					Target = "BossCard"
				},
				OnAllyStart = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "MagicAttack", 1, false },
							"BossCard"
						},
						{ "Inflict", 1000, "Opponent" },
						{ "DestroyGear", "DS2Nyarl-Burn" }
					},
					Target = "BossCard"
				}
			}
		},
		Bio = " "
	},
	["DS2Nyarl-AB"] = {
		Id = 119267245662063,
		Name = "Ａｂｓｏｒｂ Ｆｒｅｅｄｏｍ",
		AltCards = {
			["DS2Nyarl-AB-EX"] = {
				Effect = {
					Description = "Deal 2000 Overloaded damage split evenly between all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "HasNoFighter" },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Math", 2000, "Nil" }
								},
								{
									"AlterEV",
									{ "Divide", "Field_Opponent", "All", "Nil" }
								},
								{
									"AlterEV",
									{ "StatRound", "Math", 50, "Nil" }
								},
								{
									"PlayBossAnimation",
									{ "Nyarlhotep", "DownwardSlash", 0, false },
									"BossCard"
								},
								{ "DamageOverloaded", "Variable", "Opponent" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						},
						OnEVCheckPassHasNoFighter = {
							Power = { { "Inflict", 2000, "Opponent" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		CustomReminder = {
			["Vulnerable Target"] = "You will lose life if this triggers while you have no fighters in play."
		},
		EffectVariable = 0,
		Effect = {
			Description = "Deal 1000 Overloaded damage split evenly between all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "HasNoFighter" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1000, "Nil" }
						},
						{
							"AlterEV",
							{ "Divide", "Field_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "StatRound", "Math", 50, "Nil" }
						},
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "DownwardSlash", 0, false },
							"BossCard",
							nil,
							nil,
							"NyarlSlash2"
						},
						{ "DamageOverloaded", "Variable", "Opponent" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				},
				OnEVCheckPassHasNoFighter = {
					Power = { { "Inflict", 1000, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Nyarl-Shield"] = {
		Id = 139673369020371,
		Name = "Ｗｈａｌｅｓｏｎｇ Ｓｈｉｅｌｄ",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Nyarlhotep gains a shield. It's immune to all damage while active.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Nyarlhotep", "WhalesongShield", 2, false },
							"BossCard"
						},
						{
							"GivePassiveSpecific",
							{ Mitigation = 999999999 },
							"BossCard",
							nil,
							nil,
							nil,
							"TargetShieldActive"
						},
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 999999999 },
							"BossCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2DespairSentry = {
		Id = 116501673768913,
		Name = "Despair of The Overseer",
		Health = 600,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Gravity",
		Color = "Neutral",
		PlayTest = true,
		AttackBlock = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "At the start of your turn: Obliterate this card, your opponent loses 400 life.\nWhen this card dies: Your opponent gains {W}{W}.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "Obliterate" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Neutral", 2 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	DS2DespairNyarl = {
		Id = 0,
		Name = "Nyarlhotep",
		Health = 250000,
		Power = 250000,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "NyarlAttack",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		HealthGates = { ["235000"] = false },
		AttackBlock = true,
		DestroyImmune = true,
		WeakenImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		SwapImmune = true,
		SetHealthImmune = true,
		StealImmune = true,
		BossCard = true,
		HideLocks = true,
		EffectVariable = 0,
		SummonAnimation = "NyarlSound2",
		SpecificFieldLocation = "BossPosition",
		Effect = {
			Description = "Immune to all damage when shielded. At the start of Nyarlhotep's turns: It gains a shield.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "Intro", 14, false },
							"Self"
						},
						{ "ChangeMusic", "DS2SpiralNyarlhotep", "Ally" },
						{ "SetFatigueImmune" },
						{ "BypassLifeLoss" },
						{
							"GenZoneDiscard",
							{ "Neutral", 0 }
						},
						{
							"GivePassiveSpecific",
							{ Mitigation = 999999999 },
							"Self",
							nil,
							nil,
							nil,
							"TargetShieldActive"
						},
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 999999999 },
							"Self"
						}
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"GivePassiveSpecific",
							{ Mitigation = 999999999 },
							"Self",
							nil,
							nil,
							nil,
							"TargetShieldActive"
						},
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 999999999 },
							"Self"
						},
						{ "SetPower", 250000 },
						{ "ReplaceAttackEffect", "NyarlAttack" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnRemovePassiveDamageMitigation = {
					Power = {
						{ "ReplaceAttackEffect", "Gravity" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"NPCSpeech",
						{ "Auteur", "Its shield is gone! Strike it quickly!", "AuteurTalk", 4 },
						"Self"
					} },
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				},
				OnDeath = {
					Power = {
						{
							"GivePassiveSpecific",
							{ IdleOverride = "DefeatIdle" },
							"BossCard",
							nil,
							nil,
							"NyarlSound4"
						},
						{
							"PlayBossAnimation",
							{ "Despairtep", "DefeatStart", 7.1, false },
							"Self"
						},
						{
							"NPCSpeech",
							{ "Dmitri", "So much pain…", "TaintedSpiralTalk", 3 },
							"Self"
						},
						{
							"NPCSpeech",
							{
								"Dmitri",
								"Allow me to shoulder it, my friend.",
								"TaintedSpiralTalk",
								4
							},
							"Self"
						},
						{
							"PlayBossAnimation",
							{ "Despairtep", "DefeatFinish", 0, false },
							"Self"
						},
						{
							"GivePassive",
							"PlaceholderPassive",
							"CustomTarget",
							nil,
							nil,
							nil,
							"DespairDeath"
						},
						{ "DelayClient", 2.75, "Ally" },
						{ "Cost", 99999 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true,
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Protagonist",
						SubModifier = true
					}
				},
				OnHealthGate = {
					Power = { { "ForceTurn", nil, nil, nil, nil, "DespairNextPhase" } },
					Target = "Opponent"
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	},
	["DS2Despair-A1"] = {
		Id = 90122828280990,
		Name = "Despair Blast",
		AltCards = {
			["DS2Despair-A1-2"] = {
				Effect = {
					Description = "Deal 1000 Unblockable damage to a target enemy fighter.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard"
								},
								{
									"PierceDamage",
									1000,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlEffect1"
								}
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			},
			["DS2Despair-A1-3"] = {
				Effect = {
					Description = "Deal 4000 Unblockable damage to a target enemy fighter.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard"
								},
								{
									"PierceDamage",
									4000,
									"CustomTarget",
									nil,
									nil,
									nil,
									"NyarlEffect1"
								}
							},
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 500 Unblockable damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "Glare", 2, false },
							"BossCard"
						},
						{
							"PierceDamage",
							500,
							"CustomTarget",
							nil,
							nil,
							nil,
							"NyarlEffect1"
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-A2"] = {
		Id = 71250195244461,
		Name = "Wave Of Fear",
		AltCards = {
			["DS2Despair-A2-2"] = {
				Effect = {
					Description = "All enemy fighters lose 250 health and power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard"
								},
								{
									"Damage",
									250,
									"Opponent",
									nil,
									nil,
									nil,
									"NyarlMagic3"
								},
								{ "Weaken", 250, "Opponent" }
							},
							Target = "Self"
						}
					}
				}
			},
			["DS2Despair-A2-3"] = {
				Effect = {
					Description = "All enemy fighters lose 500 health and power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard"
								},
								{
									"Damage",
									500,
									"Opponent",
									nil,
									nil,
									nil,
									"NyarlMagic3"
								},
								{ "Weaken", 500, "Opponent" }
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
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All enemy fighters lose 150 health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "Glare", 2, false },
							"BossCard"
						},
						{
							"Damage",
							150,
							"Opponent",
							nil,
							nil,
							nil,
							"NyarlMagic3"
						},
						{ "Weaken", 150, "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-A3"] = {
		Id = 114876477546502,
		Name = "Writhe",
		AltCards = {
			["DS2Despair-A3-2"] = {
				Effect = {
					Description = "Deal 100 unblockable damage to a random fighter six times. Put two Vengeful Blessing onto card spaces in your opponent's hand until their next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						}
					}
				}
			},
			["DS2Despair-A3-3"] = {
				Effect = {
					Description = "Deal 100 unblockable damage to a random fighter ten times. Put four Vengeful Blessing onto card spaces in your opponent's hand until their next end step.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.5, "Ally" },
								{
									"PlayBossAnimation",
									{ "Despairtep", "Claw", 0, false },
									"BossCard"
								},
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "DelayClient", 0.75, "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"CustomTarget"
								},
								{
									"PierceDamage",
									100,
									"EVCard",
									nil,
									nil,
									nil,
									"NyarlMagic2"
								},
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" },
								{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							}
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 1,
		Effect = {
			Description = "Deal 100 unblockable damage to a random fighter three times. Put a Vengeful Blessing onto a card space in your opponent's hand until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "Claw", 0, false },
							"BossCard"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"PierceDamage",
							100,
							"EVCard",
							nil,
							nil,
							nil,
							"NyarlMagic2"
						},
						{ "DelayClient", 0.75, "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"PierceDamage",
							100,
							"EVCard",
							nil,
							nil,
							nil,
							"NyarlMagic2"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"PierceDamage",
							100,
							"EVCard",
							nil,
							nil,
							nil,
							"NyarlMagic2"
						},
						{ "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-A4"] = {
		Id = 116676163741690,
		Name = "Spread Despair",
		AltCards = {
			["DS2Despair-A4-2"] = {
				Effect = {
					Description = "Deal 2000 Overloaded damage split evenly between all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard",
									nil,
									nil,
									nil,
									"NyarlMagic4"
								},
								{
									"AlterEV",
									{ "Set", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "HasNoFighter" },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Math", 2000, "Nil" }
								},
								{
									"AlterEV",
									{ "Divide", "Field_Opponent", "All", "Nil" }
								},
								{
									"AlterEV",
									{ "StatRound", "Math", 50, "Nil" }
								},
								{ "DamageOverloaded", "Variable", "Opponent" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						},
						OnEVCheckPassHasNoFighter = {
							Power = { { "Inflict", 2000, "Opponent" } },
							Target = "Self"
						}
					}
				}
			},
			["DS2Despair-A4-3"] = {
				Effect = {
					Description = "Deal 4000 Overloaded damage split evenly between all enemy fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"PlayBossAnimation",
									{ "Despairtep", "Glare", 2, false },
									"BossCard",
									nil,
									nil,
									nil,
									"NyarlMagic4"
								},
								{
									"AlterEV",
									{ "Set", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{
									"EVExactValueCheck",
									{ 0, "HasNoFighter" },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Math", 4000, "Nil" }
								},
								{
									"AlterEV",
									{ "Divide", "Field_Opponent", "All", "Nil" }
								},
								{
									"AlterEV",
									{ "StatRound", "Math", 50, "Nil" }
								},
								{ "DamageOverloaded", "Variable", "Opponent" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Enemy_Field" },
								Condition = "RandomCard",
								Modifier = 1
							},
							KeepSameTargets = true
						},
						OnEVCheckPassHasNoFighter = {
							Power = { { "Inflict", 4000, "Opponent" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Vulnerable Target"] = "You will lose life if this triggers while you have no fighters in play."
		},
		Effect = {
			Description = "Deal 1000 Overloaded damage split evenly between all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "Glare", 2, false },
							"BossCard",
							nil,
							nil,
							nil,
							"NyarlMagic4"
						},
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "HasNoFighter" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1000, "Nil" }
						},
						{
							"AlterEV",
							{ "Divide", "Field_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "StatRound", "Math", 50, "Nil" }
						},
						{ "DamageOverloaded", "Variable", "Opponent" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					KeepSameTargets = true
				},
				OnEVCheckPassHasNoFighter = {
					Power = { { "Inflict", 1000, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-A5"] = {
		Id = 82013474040370,
		Name = "Spiral",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Nyarlhotep's actions become stronger.",
			Ability = {
				OnSummon = {
					Power = { {
						"PlayBossAnimation",
						{ "Despairtep", "SpiralGlare", 2, false },
						"BossCard",
						nil,
						nil,
						nil,
						"NyarlMagicStatusEvil"
					} },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-BW"] = {
		Id = 102466128042175,
		Name = "Overwhelming Despair",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Obliterate all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "ForceTurn", 8, false },
							"BossCard",
							nil,
							nil,
							"NyarlSound3"
						},
						{ "Obliterate" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = " "
	},
	["DS2Despair-F"] = {
		Id = 135629552709667,
		Name = "Struggling Wail",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		Stealth = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All enemy fighters lose 500 health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"PlayBossAnimation",
							{ "Despairtep", "StrugglingWail", 1.5, false },
							"BossCard"
						},
						{
							"Damage",
							500,
							"Opponent",
							nil,
							nil,
							nil,
							"NyarlMagic3"
						},
						{ "Weaken", 500, "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2NyarlDmitri1 = {
		Id = 93420052499012,
		Name = "Dmitri Shostakovich",
		Health = 12000,
		Power = 12000,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		PlayTest = true,
		Archetype = "Candidate",
		Protagonist = true,
		Summonant = "NoobEvil",
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				OnEnemyEnd = {
					Power = { {
						"Transform",
						"DS2NyarlDmitri2",
						"Self",
						nil,
						nil,
						nil,
						"DespairInject"
					} },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DS2NyarlDmitri2 = {
		Id = 92684000485257,
		Name = "Dmitri Cheryomushki",
		Health = 12000,
		Power = 12000,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		PlayTest = true,
		Archetype = "Candidate",
		Protagonist = true,
		CantDie = true,
		Summonant = "NoobEvil",
		Effect = {
			Name = "Reincarnation",
			Description = "Allied effect damage is increased by 10 times.\nWhen this fighter would die: Reset it's stats.\nAt the start of your turns: You gain 6{W}.\nWhenever you cast a fighter: it gains 10 times its health and power.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Neutral", 6 },
						{ "AssignEffectDamageWeaknessMulti", 10, "Opponent" }
					},
					Target = "Ally"
				},
				OnAllySummon = {
					Power = {
						{ "MultiplyHealth", 10 },
						{ "MultiplyPower", 10 }
					},
					Target = "Aggressor"
				},
				OnDeath = {
					Power = { { "Reset", 30, "Self" } },
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = ""
	},
	DS2Nyarl2EpicKatana = {
		Id = 107392977531834,
		Name = "The Epic Katana",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		Undiscardable = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 4000 damage to a target enemy fighter. If it has a shield: Destroy it instead. Give yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "TargetCard" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Mitigation" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Add", "Target", "HasPassive", "DamageMitigation" },
							"SingleEnemy"
						},
						{ "EVGreaterValueCheck", 1, "Self" },
						{ "Add", "DS2Nyarl2EpicKatana", "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "Damage", 0, "EVCard", nil, nil, "EKSlash" },
						{ "RemovePassive", "Mitigation", "EVCard", nil, nil, "ShieldEnd" },
						{ "RemovePassive", "DamageMitigation", "EVCard" },
						{ "SetPower", 0, "EVCard" },
						{ "ReplaceAttackEffect", "Gravity", "EVCard" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetCard" },
							"Self"
						},
						{ "Damage", 4000, "EVCard", nil, nil, "EKSlash" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2WinonaDamage = {
		Id = 106402071728749,
		Name = "Staff of Justice: Strike!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		Undiscardable = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 40,000 damage to The Transcendent and give yourself a copy of this card. You can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"Damage",
							40000,
							"BossCard",
							nil,
							nil,
							nil,
							"WinonaBeam"
						},
						{
							"PlayBossAnimation",
							{ "TheTranscendence", "Hurt", 2.5, false },
							"BossCard",
							nil,
							nil,
							"TranscendentHurt"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"BossCard"
						},
						{ "EVGreaterValueCheck", 60001, "Self" },
						{ "Add", "DS2WinonaDamage", "Ally" },
						{
							"SetCastRestriction",
							{
								{ "NOTHING" },
								"You can't cast anything else this turn."
							},
							"Ally"
						}
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { {
						"GivePassiveSpecific",
						{ IdleOverride = "LowHealth" },
						"BossCard"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = " "
	},
	DS2WinonaHeal = {
		Id = 80118149330138,
		Name = "Staff of Justice: Recover!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Fading = true,
		TokenOmni = true,
		Undiscardable = true,
		AttackEffect = "MagicYellow",
		CustomReminder = {
			Recover = "This effect cannot give you more than your starting life total (4000)"
		},
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Recover 1000 Life and give yourself a copy of this card. You can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "Life", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 4000, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Cap", "Math", 1000, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" },
							"Self"
						},
						{ "Cost", "Variable", "Ally" },
						{ "Add", "DS2WinonaHeal", "Ally" },
						{
							"SetCastRestriction",
							{
								{ "NOTHING" },
								"You can't cast anything else this turn."
							},
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DS2Auteur = {
		Id = 0,
		Name = "The Transcendent",
		Health = 500000,
		Power = 500000,
		Rarity = "Token",
		IsBotCard = true,
		PlayTest = true,
		AttackEffect = "Gravity",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		BossCard = true,
		HideLocks = true,
		ObscureStats = true,
		SpecificFieldLocation = "BossPosition",
		Effect = {
			Description = "",
			Ability = {
				OnDeath = {
					Power = {
						{
							"PlayBossAnimation",
							{ "TheTranscendence", "Defeat", 22, false },
							"Self",
							nil,
							nil,
							nil,
							"TranscendentDeath"
						},
						{ "Cost", 99999 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnEnemyStart = {
					Power = { { "ChangeMusic", "DS2Transcendant", "Ally" } },
					Target = "Opponent",
					TotalTriggerLimit = 1,
					NoBlip = true
				}
			},
			PierceLifeLoss = true
		},
		Bio = ""
	}
}