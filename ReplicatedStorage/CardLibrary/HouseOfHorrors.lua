



return {
	BEAR = {
		Id = 75429664962965,
		Name = "BEAR",
		AltCards = {
			["Shi Assoc South Section 4 Director"] = {
				Id = 130784010980361,
				Name = "Suspicious Box",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give your opponent a Wire Puzzle.",
					Ability = {
						OnSummon = {
							Power = { { "Add", "Price of Equality" } },
							Target = "Opponent"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 554,
				Bio = "AYO!!!!!! thats sus as SARDINES! HEy!!!! who's in there????"
			},
			Astrozizer = {
				Id = 126412519162681,
				Name = "Astrozizer",
				Commissioner = { "Astrozizer" },
				CustomReminder = {
					["187"] = "A token action that cannot be discarded. When your opponent discards, they lose 500 life and destroy the oldest card in their hand."
				},
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give your opponent 187.",
					Ability = {
						OnSummon = {
							Power = { { "Add", "187" } },
							Target = "Opponent"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 731,
				Bio = "You've got me talking in my sleep<br/>As if you're conquering my dreams<br/>You have awakened what's beneath"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		CustomReminder = {
			["Wire Puzzle"] = "A token action that cannot be discarded. When your opponent discards, they lose 500 life and destroy the oldest card in their hand."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give your opponent a Wire Puzzle.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Wire Puzzle" } },
					Target = "Opponent"
				}
			}
		},
		Bio = "R.U.N."
	},
	["Wire Puzzle"] = {
		Id = 121793628836914,
		Name = "Wire Puzzle",
		AltCards = {
			["Price of Equality"] = {
				Id = 74899266765995,
				Name = "Personal Helper \"Friend\"",
				AttackEffect = "Jab",
				Bio = "HEY!!! IT'S ME!!!! IT'S HELPITY!!!!!!!!!!!! \"OH MY GOD!!!!!!!!!! DONT OOF ME!!!!!!!!!!!!!\""
			},
			["187"] = {
				Id = 83296559641350,
				Name = "187",
				AttackEffect = "Jab",
				Bio = "Again."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Undiscardable = true,
		DestroyImmune = true,
		TokenOmni = true,
		TriggerInHand = true,
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard a card: You lose 500 life and destroy the oldest card in your hand.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Cost", 500 },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "WHAT?! I HATE THIS PUZZLE!"
	},
	["Mary's Mirror"] = {
		Id = 115492966128949,
		Name = "Mary's Mirror",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put an inert copy of this card in your baseplate, then draw a card. Then if there's exactly 3 copies of this card in your baseplate, deal 666 overloaded damage to all enemy fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Mary's Mirror", 1 }
						},
						{ "Draw", 1 },
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Mary's Mirror", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 3, "Self" }
					},
					Target = "Ally",
					MetaData = { TokenOmni = true }
				},
				OnEVCheckPass = {
					Power = { { "DamageOverloaded", 666 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Say her name three times and you'll truly be in for a fright!"
	},
	["Freddyland Utility Tunnels"] = {
		Id = 117328218963765,
		Name = "Freddyland Utility Tunnels",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Red",
		Terrain = true,
		Terrariant = "Salvage",
		Cost = { Neutral = 1, Red = 3, Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the end of your turns: Summon a 150/300 Revenant with overload.",
			Ability = {
				OnEnd = {
					Power = { { "Summon", "Revenant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Below fantasy and fun."
	},
	Revenant = {
		Id = 113171595025153,
		Name = "The Revenants",
		Health = 150,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Red",
		Overload = true,
		Cost = { Neutral = 1, Red = 2, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Strengthen", 0 } },
					Target = "Self"
				}
			}
		},
		Bio = "It's gonna be one long night!"
	},
	JX1DX1 = {
		Id = 75047922701760,
		Name = "PRIDE",
		AltCards = {
			["JX1DX1-Offer"] = {
				Id = 138970435220314,
				Name = "Gluttony",
				SummonAnimation = "NWrathSummon",
				AttackEffect = "Jab",
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever this card attacks and destroys another: Put a copy of this card at the bottom of each players' deck, then this card gains 100 Health and Power for each copy of it in all decks.",
					Ability = {
						OnAttackDestroy = {
							Power = {
								{ "DeckAdd", "JX1DX1-Offer", "Ally" },
								{ "DeckAdd", "JX1DX1-Offer", "Opponent" },
								{
									"AlterEV",
									{ "Set", "Deck_Ally", "JX1DX1", "Nil" }
								},
								{
									"AlterEV",
									{ "Add", "Deck_Opponent", "JX1DX1", "Nil" }
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 100, "Nil" }
								},
								{ "Heal", "Variable" },
								{ "Strengthen", "Variable" }
							},
							Target = "Self"
						}
					},
					EffectDeckAddToBottom = true
				},
				Bio = "<b><font color=\"#FF0000\">You’re DOOMED… I’m gonna devour you… [Unintelligible Babbling].</font></b>"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		SummonAnimation = "NWrathSummon",
		AttackEffect = "Gravity",
		Color = "Red",
		Cost = { Neutral = 3, Red = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Put a copy of this card at the bottom of each players' deck, then this card gains 100 Health and Power for each copy of it in all decks.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "DeckAdd", "JX1DX1", "Ally" },
						{ "DeckAdd", "JX1DX1", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Deck_Ally", "JX1DX1", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Deck_Opponent", "JX1DX1", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			},
			EffectDeckAddToBottom = true
		},
		Bio = "I'm everything you want to be"
	},
	Termiteking9 = {
		Id = 76106269357720,
		Name = "Termiteking9",
		AltCards = {
			allzx = {
				Id = 98529045959553,
				Name = "allzx",
				AttackEffect = "Slash",
				CustomReminder = {
					Baseline = "A +0/+250 token gear that recurs allzx if 4 or more of them exist in the graveyard."
				},
				Effect = {
					Name = "Reincarnation",
					Description = "When this card dies: Attach Baseline to all allied fighters.",
					Ability = {
						OnDeath = {
							Power = { { "EquipGear", "Terminal Calculation-azx" } },
							Target = "Ally"
						}
					}
				},
				AltArt = true,
				PremiumArt = 649,
				Bio = "My very existence requires destruction."
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Red",
		Overload = true,
		Cost = { Red = 8 },
		CustomReminder = {
			["Terminal Calculation"] = "A +0/+250 token gear that recurs Termiteking9 if 4 or more of them exist in the graveyard."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Attach Terminal Calculation to all allied fighters.",
			Ability = {
				OnDeath = {
					Power = { { "EquipGear", "Terminal Calculation" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Every night she brings me back to life, some place no one else can find, somewhere no one can survive."
	},
	["Terminal Calculation"] = {
		Id = 104257124222337,
		Name = "Terminal Calculation",
		AltCards = {
			["Terminal Calculation-azx"] = {
				Id = 127145121850946,
				Name = "Baseline",
				AttackEffect = "Slash",
				Bio = "And blood-black nothingness began to spin. A system of cells interlinked, within cells interlinked, within cells interlinked, within one stem. <br/>And dreadfully distinct against the dark, a tall white fountain played."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 250,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Gear = true,
		TokenOmni = true,
		TriggerInGraveZone = true,
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if there's 4 or more Terminal Calculation in your graveyard: Obliterate them and recur Termiteking9.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Terminal Calculation", "Nil" }
						},
						{ "EVGreaterValueCheck", 3 }
					},
					Target = "Self",
					NoBlip = true,
					DontTriggerInField = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Terminal Calculation", "GraveZone_Ally", "nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "Termiteking9", "GraveZone_Ally", "Hand_Ally", true, false, 1 },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "It all comes tumbling down."
	},
	["Underground Base"] = {
		Id = 140682709992121,
		Name = "Underground Base",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Green",
		Terrain = true,
		ForceTerrarianStatline = { 450, 450 },
		Terrariant = "HorrorsTerrarian",
		Cost = { Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: The fighter with the highest health loses 200 power.",
			Ability = {
				OnAllyStart = {
					Power = { { "Weaken", 200 } },
					Target = "HighestHealth"
				}
			}
		},
		Bio = "Wait, where are the killers?"
	},
	SmoothBlockModel = {
		Id = 118575286701470,
		Name = "SmoothBlockModel",
		Health = 950,
		Power = 800,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your opponent's end step, if they didn't cast a fighter this turn: Give yourself 2 Green cards.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Him", 0, 1, "CastFighter" }
				}
			}
		},
		Bio = "new games when???"
	},
	Rochas313 = {
		Id = 114588324719594,
		Name = "Rochas313",
		AltCards = {
			["Rochas313-Offer"] = {
				Id = 120076372120857,
				Name = "cappy0",
				AttackEffect = "Jab",
				Bio = "all we wanted was a cool hangout game...",
				CustomReminder = {
					["Radio Test"] = "A +0/50 token gear that deals 100 damage to its owner if they are not a Tree."
				},
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever a fighter attacks: Attach a Radio Test to that card and this card.\nOnce, when there's 6 Radio Test attached to this card: It gains 500 Health and becomes a Tree.",
					Ability = {
						OnAnyAttack = {
							Power = {
								{ "EquipGear", "Nosoi-C" },
								{ "EquipGear", "Nosoi-C", "Self" }
							},
							Target = "Aggressor"
						},
						OnEquipGear = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "SpecificEquippedGearCount", "Nosoi" }
								},
								{ "EVGreaterValueCheck", 5 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Heal", 500 },
								{ "SetArchetype", "Tree" }
							},
							Target = "Self",
							TotalTriggerLimit = 1
						}
					}
				}
			},
			["The NTPinheiro Factory"] = {
				Name = "The NTPinheiro Factory",
				Commissioner = { "NTPinheiro" },
				Id = 135622314428278,
				AltArt = true,
				CustomReminder = {
					NTPlushies = "+0/50 token gears that deal 100 damage to its owner if they are not a Tree."
				},
				PremiumArt = 887,
				Effect = {
					Name = "Reincarnation",
					Description = "Whenever a fighter attacks: Attach a NTPlushie to that card and this card.\nOnce, when there's 6 NTPlushies attached to this card: It gains 500 Health and becomes a Tree.",
					Ability = {
						OnAnyAttack = {
							Power = {
								{ "EquipGear", "Nosoi-N" },
								{ "EquipGear", "Nosoi-N", "Self" }
							},
							Target = "Aggressor"
						},
						OnEquipGear = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "SpecificEquippedGearCount", "Nosoi" }
								},
								{ "EVGreaterValueCheck", 5 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Heal", 500 },
								{ "SetArchetype", "Tree" }
							},
							Target = "Self",
							TotalTriggerLimit = 1
						}
					}
				},
				Bio = "recalled in 49 states (not rhode island)"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Neutral = 2, Red = 2, Green = 2 },
		CustomReminder = {
			Nosoi = "A +0/50 token gear that deals 100 damage to its owner if they are not a Tree."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter attacks: Attach Nosoi to that card and this card.\nOnce, when there's 6 Nosoi attached to this card: It gains 500 Health and becomes Tree-grouped.",
			Ability = {
				OnAnyAttack = {
					Power = {
						{ "EquipGear", "Nosoi" },
						{ "EquipGear", "Nosoi", "Self" }
					},
					Target = "Aggressor"
				},
				OnEquipGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Nosoi" }
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 500 },
						{ "SetArchetype", "Tree" }
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Who knew Mother Nature caused more issues than it helped?"
	},
	Nosoi = {
		Id = 135901566237513,
		Name = "Nosoi",
		AltCards = {
			["Nosoi-C"] = {
				Id = 97485460486690,
				Name = "radio test",
				AttackEffect = "Jab",
				Bio = "...spread..."
			},
			["Nosoi-N"] = {
				Id = 136589522503131,
				Name = "NTPlushies",
				AttackEffect = "Jab",
				Bio = "this one's cookies and cream flavored"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Green",
		Archetype = "Tree",
		Fading = true,
		Gear = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step, if this fighter isn't tree-grouped: Deal 100 damage to it.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" },
							"GearOwner"
						},
						{ "EVExactValueCheck", "Tree" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "Damage", 100 } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "SPREAD."
	},
	["Your Friend Iris"] = {
		Id = 125055098846436,
		Name = "Your Friend Iris",
		Health = 1500,
		Power = 750,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 4, Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks, if your opponent has 4000 or more life: They lose life equal to this card's power and you gain that much life.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Cost", "Variable", "Ally" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Him", 4000, 1000000, "Life" }
				}
			}
		},
		Bio = "C'mon, can't we get some Stardust Ice Cream later? Please..?"
	},
	["Forest of Desolation"] = {
		Id = 91486439319292,
		Name = "Forest of Desolation",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Neutral = 1, Green = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Suspend a target fighter until its next end step, then obliterate all currently suspended fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Suspend", 30, "Single" },
						{ "ClearSuspend" }
					},
					Target = "All"
				}
			}
		},
		Bio = "The depths of the Abyss feel strangely welcoming."
	},
	["1nicopatty"] = {
		Id = 92269548555790,
		Name = "1nicopatty",
		AltCards = {
			["Meraki's Mindseeker"] = {
				Id = 77399732712816,
				Name = "Meraki's Mindseeker",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 527,
				Bio = "Illusion is a handy but fragile medium. Use it only in a pinch, or against the dim-witted."
			},
			["Inside The Mind of Fluffle-Banner"] = {
				Id = 83247054382025,
				Name = "Bipp the Buff Bunny",
				PackDisplayOverride = "King Bonbon's Regime Login Banner",
				Bio = "<i>real moonbunnydropping hours</i>"
			},
			["1nicopatty-Mango"] = {
				Name = "TDM Titan",
				Id = 106882083436928,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "A childhood hero to many, he watches over Tuff Town protecting those in need. That was until one day when he was airstriked from above via fighter jets."
			}
		},
		Health = 1700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Blue",
		SummonAnimation = "SummonSlide",
		Charge = true,
		Terrified = true,
		TargetImmune = true,
		Cost = { Blue = 3, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Unlock it and reset its power, then draw a card. You gain fleeting {W} for each time this card's triggered this turn.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Unlock", 9999, "Self" },
						{ "SetPower", 100, "Self" },
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "Draw", 1, "Ally" },
						{ "Neutral", "Variable", "Ally" },
						{ "TempNeutral", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "he did that???? he really just did that????"
	},
	["Roblox House Encounter"] = {
		Id = 126763075965822,
		Name = "Roblox House Encounter",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Blue",
		Rank = 5,
		Cost = { Blue = 3 },
		CustomReminder = {
			["The House"] = "A terrain that casts itself when drawn. It destroys the bottom 2 cards of your opponent's deck during their end step."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw a card.\nShuffle 'The House' into your opponent's deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "The House", "Opponent" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["The House"] = {
		Id = 86799804980918,
		Name = "The House",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		AddBlock = true,
		Terrain = true,
		TokenOmni = true,
		TriggerInHand = true,
		ForceTerrarianStatline = { 300, 300 },
		Terrariant = "HorrorsTerrarian",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is in your hand during your turn: Cast it for free, then draw a card.\nDuring your end step: Destroy the bottom 2 cards of your deck.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"ForceCast",
							{ "The House" },
							"Ally"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally",
					DontTriggerInField = true,
					DontTriggerInTerrain = true,
					TurnTriggerLimit = 1,
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				},
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
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "THIS CARD ART HAS BEEN SEIZED BY THE UNITED STATES GOVERNMENT."
	},
	["The Newport Asylum"] = {
		Id = 80293234469320,
		Name = "The Newport Asylum",
		AltCards = {
			["Musical Chairs"] = {
				Id = 77422106753284,
				Name = "Musical Chairs",
				Commissioner = { "Sentrum1" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 752,
				Bio = "Grab a seat, (Are you ready?, Are you ready?) if there's one for you (Can you get it?, Can you get it?)",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give yourself a Sit.\nWhenever you discard a Sit: Shuffle 2 Sits into your deck.",
					Ability = {
						OnSummon = {
							Power = { { "Add", "Sit", "Ally" } },
							Target = "Ally"
						},
						OnAllyDiscard = {
							Power = {
								{ "DeckAdd", "Sit", "Ally" },
								{ "DeckAdd", "Sit", "Ally" }
							},
							Target = "Ally",
							NoBlip = true,
							Archetype = "Rose"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Blue",
		Terrain = true,
		ForceTerrarianStatline = { 900, 600 },
		Terrariant = "HorrorsTerrarian",
		Cost = { Neutral = 1, Blue = 4 },
		CustomReminder = {
			Rose = "A {B}{B}{B}{B}{B} action that draws 3 cards and shuffles 3 of itself into your deck. If there's 8 or more in your graveyard, you ban yourself."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself a Rose.\nWhenever you discard a Rose: Shuffle 2 Roses into your deck.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Rose", "Ally" } },
					Target = "Ally"
				},
				OnAllyDiscard = {
					Power = {
						{ "DeckAdd", "Rose", "Ally" },
						{ "DeckAdd", "Rose", "Ally" }
					},
					Target = "Ally",
					NoBlip = true,
					Archetype = "Rose"
				}
			}
		},
		Bio = "Why did your friend come here, why did you decide it was a good idea to follow him?"
	},
	Rose = {
		Id = 103975016715213,
		Name = "Rose",
		AltCards = {
			Sit = {
				Id = 100736713864084,
				Name = "Sit",
				AttackEffect = "Jab",
				Bio = "ADRIAN!!!!",
				Effect = {
					Name = "Reincarnation",
					Description = "Draw 3 cards and shuffle 3 Sits into your deck. Then if there's 8 or more Sits are in your graveyard, <b>ban yourself.</b>",
					Ability = {
						OnSummon = {
							Power = {
								{ "Draw", 3, "Ally" },
								{ "DeckAdd", "Sit", "Ally" },
								{ "DeckAdd", "Sit", "Ally" },
								{ "DeckAdd", "Sit", "Ally" },
								{
									"AlterEV",
									{ "Set", "GraveZone_Ally", "Sit", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 7, "Self" }
							},
							Target = "Ally"
						},
						OnEVCheckPass = {
							Power = { { "SetLife", 0, "Ally" } },
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Red",
		Archetype = "Rose",
		Fleeting = true,
		Cost = { Blue = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 3 cards and shuffle 3 Roses into your deck. Then if there's 8 or more Roses are in your graveyard, <b>ban yourself.</b>",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 3, "Ally" },
						{ "DeckAdd", "Rose", "Ally" },
						{ "DeckAdd", "Rose", "Ally" },
						{ "DeckAdd", "Rose", "Ally" },
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Rose", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 7, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "SetLife", 0, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Despite its stem being covered in thorns, its beauty relaxes your mind."
	},
	JAMESWARRIOR14 = {
		Id = 86296043219213,
		Name = "JAMESWARRIOR14",
		AltCards = {
			["JAMESWARRIOR14-Offer"] = {
				Id = 96037725519713,
				Name = "geometry_squared",
				AttackEffect = "Jab",
				Bio = "I've always been here"
			}
		},
		Health = 800,
		Power = 350,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		CustomReminderSmuggle = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Select a card from the bottom 3 of your opponent's deck. Give yourself a smuggled copy of it, then shuffle that deck.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomZoneTarget"
						},
						{ "Add", "Variable", "Ally" },
						{ "ShuffleDeck", 30, "Opponent" }
					},
					Target = "Self",
					MetaData = {
						ConvertColors = { Green = "Yellow", Red = "Blue" },
						ConvertCardColor = { Green = "Yellow", Red = "Blue" },
						Smuggle = true,
						TokenDiscard = true
					},
					ZoneTargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { BottomCard = 3 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card to be smuggled"
					}
				}
			}
		},
		Bio = "\"a m i Real?\""
	},
	SATYR44 = {
		Id = 110141202206178,
		Name = "SATYR44",
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 3, Red = 3, Blue = 4 },
		CustomReminder = {
			RED44 = "A {R}{R} 400/400 fighter with haste and overload. It obliterates the top card of your opponent's deck and itself after it attacks."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Shuffle RED44 into your deck and this card gains 150 Health and Power.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Heal", 150, "Self" },
						{ "Strengthen", 150, "Self" },
						{ "DeckAdd", "RED44", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I am not your slave drive.\""
	},
	RED44 = {
		Id = 112484510359653,
		Name = "RED44",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Red",
		SummonAnimation = "SummonSlide",
		Charge = true,
		Overload = true,
		Cost = { Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Obliterate the top card in your opponent's deck, then obliterate this card.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Opponent", "Nil", false, false },
							"Self"
						},
						{ "Obliterate", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I am not your companion.\""
	},
	["32bitPC"] = {
		Id = 82426365825231,
		Name = "32bitPC",
		AltCards = {
			["Jean, High Voltage"] = {
				Id = 84381888858879,
				Name = "Jean, High Voltage",
				Commissioner = { "Jean_Vergil" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 773,
				Bio = "And so the story goes, passion surrounded by fiends, the chaos undisclosed, yet here I breathe. And so the madness holds the firmest grip in my wit. These cards I've yet to fold, hold stints of vision with a TWIIIIIIIIIIST!!!!!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Yellow = 5, Neutral = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["Identity Fraud"] = "The card has the effect of a card in your deck."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself a copy of a card in your deck, except it's a victim of identity fraud.",
			Ability = {
				OnSummon = {
					Power = { { "AddCopy" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { "RandomCard" },
						Modifier = { RandomCard = 1 },
						SubModifier = true
					},
					MetaData = { Nightwatcher = true }
				}
			}
		},
		Bio = "Remember kids: Identity fraud is more than just scary monsters in long eerie corridors!"
	},
	["Kyru's Island"] = {
		Id = 119829003431368,
		Name = "Kyru's Island",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Yellow",
		Terrain = true,
		ForceTerrarianStatline = { 450, 450 },
		Terrariant = "HorrorsTerrarian",
		Cost = { Blue = 1, Yellow = 1 },
		ReplaceDescriptionant = "Variable Charges.\nWhenever an enemy fighter dies during your turn: This card gains a charge and your opponent gains 50 Life. Then if this card has 12 or more charges, obliterate it and summon H.I.M.",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "0 Charges.\nWhenever an enemy fighter dies during your turn: This card gains a charge and your opponent gains 50 Life. Then if this card has 12 or more charges, obliterate it and summon H.I.M.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "Inflict", -50, "Opponent" },
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVGreaterValueCheck", 11, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				},
				OnEVCheckPass = {
					Power = {
						{ "Obliterate", 30, "Self" },
						{ "Summon", "H.I.M" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Enjoy your stay, and don't forget to visit our famous One Chunk Lake!~"
	},
	["H.I.M"] = {
		Id = 94540293135141,
		Name = "H.I.M",
		Health = 1200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Twice each turn, Whenever your opponent gains Life: Deal damage equal to the amount gained to a target fighter.",
			Ability = {
				OnEnemyLifeGain = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "LastLifeTaken", "Nil" },
							"Self"
						},
						{ "Damage", "Variable" }
					},
					Target = "Single",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "\"I'm still in your head.\""
	},
	Thomas = {
		Id = 96253337877214,
		Name = "Thomas",
		AltCards = {
			["Thomas-Offer"] = {
				Id = 133163307080574,
				Name = "Flameguy",
				AttackEffect = "Jab",
				Bio = "I can't do this anymore.",
				Transformant = "Thomas-A",
				CustomReminder = { Repression = "A {W} +100/100 gear. I'm sorry." },
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Attach 3 'Repression' to this card.\nAt the start of your turns: Destroy a gear attached to this card.\nWhenever this fighter destroys another: Give yourself Repression, then transform this fighter if it has no gears attached to it.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "RepressionC" },
								{ "EquipGear", "RepressionC" },
								{ "EquipGear", "RepressionC" }
							},
							Target = "Self"
						},
						OnAllyStart = {
							Power = { { "DestroyGear", 1 } },
							Target = "Self"
						},
						OnDestroy = {
							Power = {
								{ "Add", "RepressionC", "Ally" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" }
								},
								{ "EVGreaterValueCheck", 0 }
							},
							Target = "Self"
						},
						OnEVCheckFail = {
							Power = { { "Transform", "Transformant" } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 2 },
		EffectVariable = 0,
		Transformant = "Thomas-T",
		CustomReminder = { Medicine = "A {W} +100/100 gear. Thomas needs these." },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach 3 'Medicines' to this card.\nAt the start of your turns: Destroy a gear attached to this card.\nWhenever this fighter destroys another: Give yourself Medicine, then transform this fighter if it has no gears attached to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Medicine" },
						{ "EquipGear", "Medicine" },
						{ "EquipGear", "Medicine" }
					},
					Target = "Self"
				},
				OnAllyStart = {
					Power = { { "DestroyGear", 1 } },
					Target = "Self"
				},
				OnDestroy = {
					Power = {
						{ "Add", "Medicine", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				}
			},
			EffectTransformPreserveRarity = true
		},
		Bio = ""
	},
	Medicine = {
		Id = 89880255485902,
		Name = "Medicine",
		AltCards = {
			RepressionC = {
				Id = 130624033161196,
				Name = "Repression",
				AttackEffect = "Jab",
				Bio = "hallucinations."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 100,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		TokenOmni = true,
		Fading = true,
		Gear = true,
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Nil = {
					Power = { { "Strengthen", 0 } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Thomas-T"] = {
		Id = 127395973310255,
		Name = "Thomas",
		AltCards = {
			["Thomas-A"] = {
				Id = 132511410412074,
				Name = "Andreas.",
				AttackEffect = "Jab",
				Bio = "See you on the other side, Thomas."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 3, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "We tried to stop you, Thomas.",
			Ability = {
				Nil = {
					Power = { { "Strengthen", 0 } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	Nooooooo = {
		Id = 84547821559607,
		Name = "Nooooooo",
		Health = 900,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Red = 2, Blue = 2, Yellow = 1 },
		EffectVariable = 1,
		ReplaceDescriptionant = "Level Variable (Max 7).\nDuring your end step: Level this card up. Each player summons an unranked fighter from their graveyard that costs this card's level in studs or less, except it's zombified.\nIf this card is max level, all allied zombified fighters gain 1500 Health and Power.",
		Effect = {
			Name = "Reincarnation",
			Description = "Level 1 (Max 7).\nDuring your end step: Level this card up. Each player summons an unranked fighter from their graveyard that costs this card's level in studs or less, except it's zombified.\nIf this card is max level, all allied zombified fighters gain 1500 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Cap", "Math", 7, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{
							"MoveZone",
							{
								"Unranked_Fighter_VariableOrLower",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"Unranked_Fighter_VariableOrLower",
								"GraveZone_Opponent",
								"Field_Opponent",
								true,
								false
							},
							"Self"
						},
						{ "EVGreaterValueCheck", 6 }
					},
					Target = "Self",
					MetaData = { Zombified = true }
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 1500 },
						{ "Strengthen", 1500 }
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
		Bio = "To win this match, you must have gone through some really hard times."
	},
	bobulator = {
		Id = 135254139548734,
		Name = "Bobulator",
		Health = 1000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Yellow",
		SummonAnimation = "bobulatorSummon",
		Cost = { Neutral = 6, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once, when you cast another fighter: Shuffle 5 copies of it into your deck. One's a token, one's inert in all zones, one's fading, one's fleeting, and one's free.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "DeckAdd", "Variable" },
						{
							"EVExactValueCheck",
							{ "CoolEffect", "InertShuffle" },
							"Self"
						}
					},
					Target = "Ally",
					MetaData = { Rarity = "Token" },
					TotalTriggerLimit = 1
				},
				OnEVCheckFailInertShuffle = {
					Power = {
						{ "DeckAdd", "Variable" },
						{
							"EVExactValueCheck",
							{ "CoolEffect", "FadingShuffle" },
							"Self"
						}
					},
					Target = "Ally",
					NoBlip = true,
					MetaData = { TokenOmni = true }
				},
				OnEVCheckFailFadingShuffle = {
					Power = {
						{ "DeckAdd", "Variable" },
						{
							"EVExactValueCheck",
							{ "CoolEffect", "FleetingShuffle" },
							"Self"
						}
					},
					Target = "Ally",
					NoBlip = true,
					MetaData = { Fading = true }
				},
				OnEVCheckFailFleetingShuffle = {
					Power = {
						{ "DeckAdd", "Variable" },
						{
							"EVExactValueCheck",
							{ "CoolEffect", "FreeShuffle" },
							"Self"
						}
					},
					Target = "Ally",
					NoBlip = true,
					MetaData = { Fleeting = true }
				},
				OnEVCheckFailFreeShuffle = {
					Power = { { "DeckAdd", "Variable" } },
					Target = "Ally",
					NoBlip = true,
					MetaData = {
						Cost = { Neutral = 0 }
					}
				}
			}
		},
		Bio = "Probably knows more about the roblox horror scene than anyone else."
	},
	["Empty Sermon"] = {
		Id = 84749170100077,
		Name = "Empty Sermon",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Rank = 7,
		EffectVariable = 0,
		CustomReminder = {
			["Fear of God"] = "A terrified fighter is obliterated during its end step."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains 200 Health and Power. Attach terrified to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{ "EquipGear", "Terrified Mod" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Preach to the silence and you will see…"
	},
	["Cxrpss And WarClam"] = {
		Id = 133594705489085,
		Name = "Cxrpss & WarClam",
		AltCards = {
			["datoptiff and LOVIATAR"] = {
				Id = 108392545253985,
				Name = "51222Repeating",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 522,
				Bio = "COMIN' ON THE BASSLINE WE ALL GO CRAZY, CRAZY, CRAZY, CRAZY, CRAZY, CRAZY, CRAZY"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: This card gains 200 Health and Power if you've gained 600 or more life this turn. The same is true if you've lost 600 or more life this turn.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "LifeTaken", "Nil" }
						},
						{ "EVGreaterValueCheck", 599 },
						{
							"AlterEV",
							{ "Set", "Playertable", "LifeLoss", "Nil" }
						},
						{ "EVGreaterValueCheck", 599 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "You know, noclipping out of the world into the backrooms isn't the scary part. The scary part is solving the library computer puzzle without losing your mind."
	},
	["PM 606"] = {
		Id = 98894064067661,
		Name = "PM 6:06",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Neutral",
		Terrain = true,
		ForceTerrarianStatline = { 600, 400 },
		Terrariant = "HorrorsTerrarian",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Secretly infect two cards in your opponent's deck.\nWhenever an enemy infected card is cast: Give yourself a copy of it, except it costs {R}{G}{B}{Y}.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "GivePassive", "Infected" },
						{ "GivePassive", "Infected" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { "RandomCard", "HasntPassive" },
						Modifier = { RandomCard = 1, HasntPassive = "Infected" },
						SubModifier = true
					}
				},
				OnEnemySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil", 2 },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Infected" },
							"Aggressor"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEnemyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil", 2 },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Infected" },
							"Aggressor"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Add", "Variable2" } },
					Target = "Ally",
					MetaData = {
						Cost = { Red = 1, Green = 1, Blue = 1, Yellow = 1 }
					}
				}
			}
		},
		Bio = "😁"
	},
	NEBULAW0RLD = {
		Id = 82236874613941,
		Name = "NEBULAW0RLD",
		AltCards = {
			["NEBULAW0RLD-Offer"] = {
				Id = 75308660392928,
				Name = "Ronan",
				AttackEffect = "Jab",
				Bio = "Wonderful day out, isn't it?"
			},
			["RobloxNoob4545, Cataclysm"] = {
				Name = "RobloxNoob4545, Cataclysm",
				Commissioner = { "RobloxNoob4545" },
				Id = 117277172662848,
				AltArt = true,
				PremiumArt = 889,
				Bio = "\"The star scourge has awoken from its <b><font color=\"#ffff00\">eternal slumber.</font></b>\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Rank = 5,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step:\nEach fighter gains 300 health and power, then loses 200 health and power.\nSwap the stats of all fighters twice.\nLock all fighters for 2 turns, then unlock them thrice.\nBoth players lose 300 life, then gain 200 life.\nBoth players draw a card, then destroy the oldest card in their hands.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 300 },
						{ "Strengthen", 300 },
						{ "Damage", 200 },
						{ "Weaken", 200 },
						{ "Swap", 1000000 },
						{ "Swap", 1000000 },
						{ "Lock", 2 },
						{ "Unlock", 3 },
						{ "Cost", 300, "Ally" },
						{ "Inflict", 300, "Opponent" },
						{ "Cost", -200, "Ally" },
						{ "Inflict", -200, "Opponent" },
						{ "Draw", 1, "Ally" },
						{ "Draw", 1, "Opponent" },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" }
					},
					Target = "All"
				}
			}
		},
		Bio = "Bennett Finch..? Sorry Ronan, I don't know anyone by that name."
	},
	ajarbythedoor = {
		Id = 134690580808542,
		Name = "ajarbythedoor",
		AltCards = {
			["ajarbythedoor-Offer"] = {
				Id = 123148061228165,
				Name = "XX4ce0fSpadesXx",
				ArtAnimation = "xdlawl",
				AttackEffect = "Gravity",
				Bio = "♪ It's getting hard to be someone, but it all works out<br/>It doesn't matter much to me ♪"
			},
			KeeBee = {
				Id = 91172897999025,
				Name = "KeeBee",
				Commissioner = { "SleeplessPurgatory" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 673,
				Bio = "Vtubers are PR for a company called Vtube that will start a new video-sharing platform."
			},
			Slagger = {
				Id = 78998524594913,
				Name = "Slagger",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 829,
				Bio = "Nothing stays closed forever"
			},
			sarinatdm = {
				Id = 126261101549069,
				Name = "sarinatdm",
				Commissioner = { "sarinatdm" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 848,
				Bio = "A Devotee of The Adversary speaks: “hi everyone i like 1x1x1x1 bye bye!!\""
			}
		},
		Health = 2000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 10 },
		Rank = 6,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: A target fighter loses all abilities and becomes inert in all zones.\nWhenever a fighter that is inert in all zones dies: This card gains 250 Health.",
			Ability = {
				OnAttack = {
					Power = {
						{ "ReplaceEffect", "Pet1" },
						{ "GivePassive", "TokenOmni" }
					},
					Target = "Single"
				},
				OnAnyDeath = {
					Power = { { "Heal", 250 } },
					Target = "Self",
					TokenOmni = true
				}
			}
		},
		Bio = "Nevermore."
	},
	jumpstxrts = {
		Id = 7594505634,
		Name = "jumpstxrts",
		Health = 650,
		Power = 750,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Neutral",
		PlayTest = true,
		Cost = { Neutral = 9 },
		StartGameRequirement = { "Deck", "StartingDeck", 0, 1, "Starters" },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies, if your starting deck has no starters: Put 2 Colourless Studs into your baseplate.",
			Ability = {
				OnDeath = {
					Power = { {
						"AddGenZone",
						{ "Stud", 2 },
						"Ally"
					} },
					Target = "Self",
					EffectRequirement = { "StartDeckChecks" }
				}
			}
		},
		Bio = ""
	},
	["Patient Zero"] = {
		Id = 17654119350,
		Name = "Patient Zero",
		Health = 1650,
		Power = 1650,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Neutral",
		PlayTest = true,
		TokenOmni = true,
		ObliterateImmune = true,
		Cost = { Neutral = 10 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Obliterate all colourless fighters in all hands and baseplates.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_Neutral", "GenZone_Ally", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter_Neutral", "GenZone_Opponent", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter_Neutral", "Hand_Ally", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter_Neutral", "Hand_Opponent", "Nil", true, false, 99 },
							"Self"
						}
					},
					Target = "All"
				}
			}
		},
		Bio = "[UNKNOWN DATA]"
	},
	Jerry = {
		Id = 128094133776383,
		Name = "Jerry",
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 3, Red = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks, if your opponent has an Action or Gear card in their hand: Shuffle the oldest card in their hand back into their deck.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Hand_Opponent", "Action", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Hand_Opponent", "Gear", "Nil" }
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
					Target = "Self"
				}
			},
			EffectSpecificDiscardShuffle = true,
			EffectSpecificDiscardShuffleTarget = "Opponent"
		},
		Bio = "Welcome Home."
	}
}
