



return {
	["Helliura, Life Lost"] = {
		Id = 129057508334277,
		Name = "Helliura, Life Lost",
		AltCards = {
			["Eggshell, All In"] = {
				Id = 121342142779303,
				Name = "Eggshell, All In",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 779,
				Bio = "Have you ever played Mono-Red with your LIFE on the line?"
			}
		},
		Health = 2000,
		Power = 2000,
		Rarity = "Rare",
		AttackEffect = "Crowbar",
		Color = "Red",
		Cost = { Red = 40 },
		EffectVariable = 0,
		Overload = true,
		TargetImmune = true,
		TriggerInDeck = true,
		TriggerInHand = true,
		TriggerInGenZone = true,
		TriggerInGraveZone = true,
		SummonAnimation = "NightmareCall",
		Effect = {
			Name = "Name",
			Description = "During your end step, if this card's not in play: Its {R} cost becomes your life total divided by 100.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "Life", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 100, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Round", "Math", 1, "Nil" },
							"Self"
						},
						{
							"SetCost",
							{ "Variable", "Red" },
							"Self"
						}
					},
					Target = "Ally",
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"To those who have everything more will be given. To those who have nothing everything will be taken.\""
	},
	Rinzaru = {
		Id = 92662182751447,
		Name = "Rinzaru",
		Health = 2250,
		Power = 450,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 6, Red = 6 },
		Overload = true,
		EffectVariable = 0,
		Rank = 9,
		Effect = {
			Description = "Whenever this card is cast or attacks: Deal 450 overloaded damage to a target enemy fighter. If they had exactly 450 health, add {W}{W} to all cards in your opponent's hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" }
						},
						{ "EVExactValueCheck", 450, "Self" },
						{ "DamageOverloaded", 450, "SingleEnemy" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "SingleEnemy"
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" }
						},
						{ "EVExactValueCheck", 450, "Self" },
						{ "DamageOverloaded", 450, "SingleEnemy" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "SingleEnemy"
				},
				OnEVCheckPass = {
					Power = { {
						"IncreaseCost",
						{ 2, "Neutral" },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "All"
					}
				}
			}
		},
		Bio = "\"My champions have gone, so you'll have to settle for me.\""
	},
	["Milk, Vivere"] = {
		Id = 118920792602705,
		Name = "Milk, Vivere",
		AltCards = {
			NeoNeo = {
				Id = 111274524340954,
				Name = "NeoNeo",
				Commissioner = { "SleeplessPurgatory" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 672,
				Bio = "<b><font color=\"#6C3BAA\">Rim de Lacent!</font></b><br/><b><font color=\"#FFEE8C\">We're connected by denpa signals!</font></b>"
			},
			["IcyTea, Solus"] = {
				Id = 80082221956369,
				Name = "IcyTea, Solus",
				Commissioner = { "IcyTea" },
				AttackEffect = "Blizzard",
				AltArt = true,
				ArtAnimation = "IcyTeaSolus",
				PremiumArt = 803,
				Effect = {
					Description = "When this card is cast: All cards in all allied zones except your baseplate become inert in all zones.\nWhenever you cast a card: Deal 300 overloaded damage to a target fighter.",
					Ability = {
						OnSummon = {
							Power = { { "GivePassive", "TokenOmni" } },
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Ally_Hand", "Ally_Field", "Ally_GraveZone", "Ally_Deck" },
								Condition = "All"
							}
						},
						OnAnyAllyCast = {
							Power = { { "DamageOverloaded", 300, nil, nil, nil, "EngulfIce" } },
							Target = "Single"
						}
					}
				},
				Bio = "“When you lose your way, the silence will still know your name.”"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		TokenOmni = true,
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: All cards in all allied zones except your baseplate become inert in all zones.\nWhenever you cast a card: Deal 300 overloaded damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "GivePassive", "TokenOmni" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand", "Ally_Field", "Ally_GraveZone", "Ally_Deck" },
						Condition = "All"
					}
				},
				OnAnyAllyCast = {
					Power = { { "DamageOverloaded", 300, nil, nil, nil, "SpawnSymbol" } },
					Target = "Single"
				}
			}
		},
		Bio = "\"Don't you worry. If you ever lose yourself. I'll be there to catch you when you fall.\""
	},
	Hell2 = {
		Id = 17736485,
		Name = "Helliura, Death Regained",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		LunaTest = true,
		PlayTest = true,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Name",
			Description = "Whenever you lose life on your turn, if you've lost 600 or more life this turn and this card's in your graveyard: You may pay {R}{R}. If you do, summon this card, except it's fading.",
			Ability = {
				OnLifeLoss = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "LifeLoss", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 599, "LostEnough" }
						}
					},
					EffectRequirement = { "MyTurn", "Me", 30, 303 },
					Target = "Self",
					DontTriggerInField = true
				},
				OnEVCheckPassLostEnough = {
					Power = { {
						"ConfirmPrompt",
						{ "If you want to pay to summon Helliura" },
						"Ally"
					} },
					Target = "Self"
				},
				OnConfirm = {
					Power = {
						{ "Red", -2 },
						{
							"EVGreaterValueCheck",
							{ 0, "HasPaid" },
							"Self"
						}
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 2, 99999, "IconsRed" }
				},
				OnEVCheckPassHasPaid = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
						"Self"
					} },
					Target = "Ally",
					MetaData = { Fading = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	["President LuckyTux"] = {
		Id = 91835006684007,
		Name = "President LuckyTux",
		AltCards = {
			["Aubrey, Subspaced"] = {
				Id = 97093841693662,
				Name = "Aubrey, Subspaced",
				Commissioner = { "wetsoggydoggy1" },
				AttackEffect = "Gravity",
				AltArt = true,
				PremiumArt = 716,
				Addant = "The Great Subspacial War",
				Bio = "Did you know the pink material emitted from Subspace Tripmines is the boiling of the affected surface? Now you do!"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Red",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Addant = "World of Pain",
		CustomReminder = {
			["World of Pain"] = "A Red {W} terrain. When cast or at the start of your turns: You may deal 100 damage to all allied fighters. If you do, a target fighter gains that much health."
		},
		Effect = {
			Name = "Name",
			Description = "When this card is cast: Give yourself 'World of Pain.'",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The President exists as a representative of both the canon and non-canon cards. Eventually they’ll make him a Gladiator or a Candidate, but for now he’s just their most gracious advocate."
	},
	["World of Pain"] = {
		Id = 97235411725736,
		Name = "World of Pain",
		AltCards = {
			["The Great Subspacial War"] = {
				Id = 88488206051076,
				Name = "The Great Subspacial War",
				AttackEffect = "Jab",
				Bio = "<font color=\"rgb(255,127,80)\">\"I swore I wouldn't make another weapon again. I don't want to hurt anyone.\"</font>\n\n<font color=\"rgb(255,0,0)\">\"The people of Polaris need you to.\"</font>\n\n<font color=\"rgb(255,127,80)\">\"It isn't right. What if it doesn't work? We might take out one of our own.\"</font>\n\n<font color=\"rgb(255,0,0)\">\"...And? War calls for desperate measures. We'll lose more if we don't take action.\"</font>\n\n<font color=\"rgb(255,127,80)\">\"Fine, I'll do it. But if I find you using it on any single person, you will pay dearly.\"</font>\n"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "President Luckytux: Unleashed",
		Effect = {
			Name = "Name",
			Description = "When this card is cast or at the start of your turns: You may deal 100 damage to all allied fighters. If you do, a target fighter gains that much health.",
			Ability = {
				OnAllyStart = {
					Power = { {
						"ConfirmPrompt",
						{ "if you want to deal 100 damage to all allied fighters" },
						"Ally"
					} },
					Target = "Self"
				},
				OnSummon = {
					Power = { {
						"ConfirmPrompt",
						{ "if you want to deal 100 damage to all allied fighters" },
						"Ally"
					} },
					Target = "Self"
				},
				OnConfirm = {
					Power = {
						{ "SetVariable", "AllyField" },
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Damage", 100, "Ally" },
						{ "Heal", "Variable", "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "President LuckyTux’s page on the  official Roblox Wiki is a stub. This is his way of expanding it."
	},
	["President Luckytux: Unleashed"] = {
		Id = 113703366811903,
		Name = "President Luckytux: Unleashed",
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrarian = true,
		Addant = "Hard Cheese",
		Effect = {
			Name = "Name",
			Description = "Once each turn, Whenever this card takes damage from anything: Give yourself Hard Cheese, except it costs {W}{W}.",
			Ability = {
				OnDamaged = {
					Power = { { "Add", "Addant" } },
					Target = "CardOwner",
					MetaData = {
						Cost = { Neutral = 2 }
					},
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "This is his revenge for the QA team nerfing Senator LuckyTux to where it’s only good on Extants."
	},
	Phirephenix1298 = {
		Id = 82290448333826,
		Name = "Phirephenix1298",
		AltCards = {
			["The Prophet"] = {
				Id = 123885865779033,
				Name = "The Prophet",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 591,
				Bio = "\"The truth of this world lies far beyond these Bluestein Caves\""
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Blue = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast an action or gear: Give yourself a Blue card of the other card type. This triggers once each turn per card type.",
			Ability = {
				OnAllyCastGear = {
					Power = { { "RandomAdd", "MonoOnlyorBlueCost Blue Lunar" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnAllyCast = {
					Power = { { "RandomAdd", "MonoOnlyorBlueCost Blue Gear" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			},
			EffectSpecificDiscardShuffle = true
		},
		Bio = "“He’s got everything but the- no wait he has that too”"
	},
	["Dependable Preythings"] = {
		Id = 108480276505176,
		Name = "Dependable Preythings",
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Yellow",
		CustomReminder = {
			["Big Red Button"] = "A {W}{W}{W} Action. The first person to cast it obliterates their hand, graveyard, baseplate, and all their enemy fighters."
		},
		Cost = { Red = 4, Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give each player a Big Red Button.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "BRB-F", "Ally" },
						{ "Add", "BRB-S", "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Oh, how long could trusty cadets Fluffle and Sheep hold out? How could they possibly resist the diabolical urge to push the button that could erase their very existence?"
	},
	["BRB-F"] = {
		Id = 122989258697903,
		Name = "Big Red Button",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Archetype = "Button",
		TriggerInHand = true,
		Cost = { Neutral = 3 },
		TokenOmni = true,
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate your hand, graveyard, baseplate, and all enemy fighters.\nYour opponent loses 500 life.\nDestroy your terrain and your opponent's Big Red Button.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 500, "Opponent" },
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GenZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Field_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{ "DestroyTerrain", 30, "Ally" },
						{ "ArchetypeDiscard", 999, "Opponent", "Button" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Will Fluffle succumb to his maddening urges to commit to the bit?"
	},
	["BRB-S"] = {
		Id = 71587885248654,
		Name = "Big Red Button",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Archetype = "Button",
		TriggerInHand = true,
		Cost = { Neutral = 3 },
		TokenOmni = true,
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate your hand, graveyard, baseplate, and all enemy fighters.\nYour opponent loses 500 life.\nDestroy your terrain and your opponent's Big Red Button.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 500, "Opponent" },
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GenZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Field_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{ "DestroyTerrain", 30, "Ally" },
						{ "ArchetypeDiscard", 999, "Opponent", "Button" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Will Sheep's corrupted mind give in to his most selfish desire?"
	},
	["Destined Encounter"] = {
		Id = 139519855276764,
		Name = "Destined Encounter",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 5 },
		CustomReminder = {
			Tragedy = "A 700/50 that recurs a card that costs 3 or fewer studs when it dies.",
			Accordingas11 = "A 350/100 that weakens allies by 50 power once each turn when an action is cast."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon Tragedy onto your field and summon Accordingas11 onto your opponent’s field.\nSearch your deck for a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Tragedy" },
						{ "Summon", "Accordingas11", "Opponent" },
						{ "Tutorfor", "Destined Encounter", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "One met a guiding light, leading to the future.\nOne met a deadeye, saving from the past.\n\nThe Destined connection has begun."
	},
	Tragedy = {
		Id = 114262273289457,
		Name = "Tragedy, Isolated Doctor",
		Health = 700,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 4 },
		EffectVariable = 0,
		CustomReminderRecur = true,
		CustomReminder = {
			["Remember that you are mortal"] = "A fading card dying doesn't trigger effects, and disappears if it would enter the graveyard."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Select a card in your graveyard that costs 3 or fewer total studs. Recur it, except it has fading.",
			Ability = {
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { CostOrLess = 3 },
						SelectionDescription = "a card from your graveyard.",
						MinTargets = 0,
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"Although my fates lead me to death.\"\n\"Although my mistakes lead me to endless regrets...\"\n\n\"Eventually, people need others to share their painful memories.\"\n\"That awakens me to move on. For a noble cause to die for.\""
	},
	Accordingas11 = {
		Id = 117507576971538,
		Name = "Accordingas11, Guided Scout",
		Health = 350,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an action is cast: All allied fighters lose 50 power.",
			Ability = {
				OnCast = {
					Power = { { "Weaken", 50 } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Even I lost myself where blood and ashes rained,\"\n\"Even I lost myself in the labyrinth\"\n\n\"After all, the light embraces my pain in the darkest times.\"\n\"That thrusts me to the limit. For a noble cause to live for.\""
	},
	["Mitch Mangoton"] = {
		Id = 133538939919143,
		Name = "Mitch Mangoton",
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a nonfighter card: They lose 400 life. You gain 400 life.",
			Ability = {
				OnEnemyCast = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "Inflict", -400, "Ally" }
					},
					Target = "Ally"
				},
				OnEnemyTerrainCast = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "Inflict", -400, "Ally" }
					},
					Target = "Ally"
				},
				OnEnemyCastGear = {
					Power = {
						{ "Inflict", 400, "Opponent" },
						{ "Inflict", -400, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Hiding away the last of the Mangonians from the Tuff Gang, he beseeches you to cart ride into mango phonk."
	},
	krxef = {
		Id = 110657255723861,
		Name = "krxef",
		AltCards = {
			["The GYnvestigation Team"] = {
				Id = 120615778698908,
				Name = "The GYnvestigation Team",
				AltArt = true,
				Addant = "The GYnvestigation Team",
				Bio = "\"Thou art I... And I am thou...<br/>Thou hast printed a new card...<br/>It brings thee closer to the truth...<br/>Thou shalt be blessed when creating lunas of the Green Yellow dualcolor...\""
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 2, Green = 3, Yellow = 3 },
		CustomReminder = {
			["Baseplate Rank"] = "Cast a card only if you have enough cards in your baseplate."
		},
		EffectVariable = 0,
		Addant = "krxef",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target enemy fighter loses 150 Health and Power. Then if this card isn't inert when discarded, give yourself a copy of it that is Rank 9 and inert when discarded.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 150, "SingleEnemy", nil, nil, "MidPunchEffect" },
						{ "Weaken", 150, "SingleEnemy" },
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "TokenDiscard" },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { TokenDiscard = true, Rank = 9 }
				}
			}
		},
		Bio = "\"100 piece puzzle of a horse running in a field finally solved\""
	},
	["GY-RObot"] = {
		Id = 140410729333331,
		Name = "GY-RObot",
		Health = 300,
		Power = 1200,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 4, Yellow = 4 },
		EffectVariable = 0,
		Addant = "krxef",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: You may select a card in your hand and destroy it. If you do, deal 50 damage for each stud in that card's cost to a target fighter. If a fighter dies this way, give yourself a copy of it, Convert all {R}{B} in its cost to {G}{Y}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SpecificDiscard", 1, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil", 2 },
							"CustomZoneTarget"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { DestroyImmune = false, OmniImmune = false },
						SelectionDescription = "a card in your hand to destroy",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "CardTarget" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Playertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil", 2 }
						},
						{ "Damage", "Variable2", "Single" },
						{
							"AlterEV",
							{ "Add", "Playertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "DestroyedCard" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassDestroyedCard = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndex", "CardTarget" },
							"Self"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					MetaData = {
						ConvertColors = { Red = "Green", Blue = "Yellow" }
					}
				}
			}
		},
		Bio = "$GYRO fell -44%. It is evident that drastic times justify drastic measures. We will make them afraid again."
	},
	["MINTB0X, Twin-Blade Ronin"] = {
		Id = 105885311738612,
		Name = "MINTB0X, Twin-Blade Ronin",
		SearchTerms = "Mintbox",
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Neutral",
		MultMitigation = 0.5,
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Half all damage this card takes.\nWhenever this card attacks: It deals damage equal to half of its power to the fighters adjacent to what it attacked. If an adjacent fighter dies this way, draw a card.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "DeathStorm", "Nil", 3 }
						},
						{
							"AlterEV",
							{ "Multiply", "MathModifyVariable_3", -1, "Nil", 3 }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil", 2 }
						},
						{
							"AlterEV",
							{ "Divide", "MathModifyVariable_2", 2, "Nil", 2 }
						},
						{
							"AlterEV",
							{ "StatRound", "MathModifyVariable_2", 50, "Nil", 2 }
						},
						{ "Damage", "Variable2", "AdjacentEVTarget" },
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil", 3 }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "DestroyedCard", 3 }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassDestroyedCard = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Through every surge of chaos, his katanas push him to keep going"
	},
	N10insanefox = {
		Id = 128907120968703,
		Name = "N10insanefox",
		Health = 1300,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Green",
		ChargeRequirement = { "Board", "AllyGenZone", 10, 9999 },
		Cost = { Neutral = 2, Red = 4, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If your baseplate rank is 10 or higher, this card gains haste.\nWhen this card is cast: attach a Decaying Mod to all fighters.\nWhen this card attacks: all allied Decaying fighters gain 100 health and power.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Decaying Mod" } },
					Target = "All"
				},
				OnAttack = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "HasPassive",
						Modifier = "Decaying",
						SubModifier = true
					}
				}
			}
		},
		Bio = ""
	},
	["Descent of the Savior"] = {
		Id = 91628610206046,
		Name = "Descent of the Savior",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 5, Red = 1, Blue = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a grouped card in your deck.\nSummon a Colourless, Unranked non-token fighter from that group that costs 8 or fewer total studs, triggering its effect as though it was cast.\nAttach terrified to the summoned card. Search your deck for 2 actions in that group.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" },
							"CustomZoneTarget"
						},
						{
							"RandomSummonWithEffect",
							"9orLowerCost Unranked Neutral Variable Fighter"
						},
						{ "EquipGear", "Terrified Mod", "SummonedCard" },
						{ "RandomTutorfor", "Variable Action" },
						{ "RandomTutorfor", "Variable Action" }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { MatchesParameter = "HasArchetype" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to summon a grouped fighter from"
					}
				}
			}
		},
		Bio = "\"Albeit at the last moment, God arrived to purify the earth of those who meant to destroy it.\nThe Nightmares and Nevermore knew their time was up. \""
	},
	["NTPinheiro: Adoration"] = {
		Id = 119852359054685,
		Name = "NTPinheiro: Adoration",
		AltCards = {
			["SashaTilde Blueish Star"] = {
				Id = 117557439904777,
				Name = "SashaTilde: Blue-ish Star",
				Commissioner = { "SashaTilde" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 753,
				Bio = "Marked. Its Marked. We're Marked. I'm Marked Too."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When you've discarded 2 cards this turn: Attach Marked to a target fighter. Then recur an allied and enemy token gear, except they're fading and inert in all zones.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Marked Mod", "Single" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 2, 9999, "DiscardCount" },
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Token_Gear", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Token_Gear", "GraveZone_Opponent", "Hand_Ally", true, false },
							"Self"
						}
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 2, 9999, "DiscardCount" },
					TurnTriggerLimit = 1,
					MetaData = { Fading = true, TokenOmni = true }
				}
			}
		},
		Bio = "You may feel fine now, but before an hour passes, your flesh and bones will start to melt, and your mind will disintegrate into pitch-black nothingness."
	},
	["Raiding Caketor"] = {
		Id = 98218018559539,
		Name = "Raiding Caketor",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		CustomReminder = { Treats = "Token buffing actions that cost {Y}." },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you lose life: Give yourself either a Hearty Treat or Crazy Treat.",
			Ability = {
				OnLifeLoss = {
					Power = { {
						"RandomAdd",
						{ "Hearty Treat", "Crazy Treat" }
					} },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "In retrospect, he probably should've mentioned his only combat experience was trick-or-treating before signing up for warfare"
	},
	["Hearty Treat"] = {
		Id = 79209049207109,
		Name = "Hearty Treat",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "A target allied fighter gains 150 Health and 50 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 150 },
						{ "Strengthen", 50 }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Great for cake monster health. Like a vitamin only sweeter."
	},
	["Crazy Treat"] = {
		Id = 101985629960794,
		Name = "Crazy Treat",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		IsFood = true,
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "A target allied fighter gains 50 Health and 150 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 50 },
						{ "Strengthen", 150 }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Tooth decay: Not exactly a big concern for cake monsters."
	},
	["Great Pal Bigwig"] = {
		Id = 91683562057883,
		Name = "Great Pal Bigwig",
		Health = 800,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you discard a card: Your opponent draws a fleeting card.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "FleetingDraw", 1 } },
					Target = "Opponent",
					TurnTriggerLimit = 1,
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "\"I'm not Bigwig! I'm the opposite of big!\""
	},
	["Cata4, Frenzied Lord"] = {
		Id = 90347216028636,
		Name = "Cata4, Frenzied Lord",
		Health = 750,
		Power = 750,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Red = 3, Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if theres no blue cards in your Baseplate: Unlock a target fighter and attach a Dextrous mod onto it. This effect applies to all allied fighters if you have 10 or less cards left in your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Unlock", 9999 },
						{ "EquipGear", "Dextrous Mod" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Single",
					EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" }
				},
				OnEVCheckPass = {
					Power = {
						{ "Unlock", 9999 },
						{ "EquipGear", "Dextrous Mod" }
					},
					Target = "Ally",
					EffectRequirement = { "Deck", "Ally", 0, 11, "Cards" }
				}
			}
		},
		Bio = "Enough. I have endured more than enough..."
	},
	["Staff of Robux Royalty"] = {
		Id = 88266557742447,
		Name = "Staff of Robux Royalty",
		Health = 0,
		Power = 0,
		AddHealth = 150,
		AddPower = 50,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Green = 1 },
		EffectVariable = 0,
		Gear = true,
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever you cast your third card each turn: Give yourself a free Money Stack.",
			Ability = {
				OnAnyAllyCast = {
					Power = { {
						"RandomAdd",
						{ "Tix Stack", "Targeting Blip" }
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "Storm" },
					MetaData = {
						Cost = { Neutral = 0 }
					}
				}
			}
		},
		Bio = "\"I'm just following my destiny\""
	},
	["The HoiBoys"] = {
		Id = 76086991928019,
		Name = "The HoiBoys",
		Health = 150,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Summonant = "Stupid Cat",
		Cost = { Green = 1, Yellow = 2 },
		EffectVariable = 0,
		Logo = "Plurral",
		CustomReminder = {
			["Stupid Cat"] = "A {Y} Green 150/150. Once, when you're in Bliss: All allied fighters gain 150 Power."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Summon a 150/150 Stupid Cat.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "🙏BLESS🙏"
	},
	["Stupid Cat"] = {
		Id = 124465952363526,
		Name = "Stupid Cat",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Green",
		Token = true,
		Summonant = "Stupid Cat",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once, when you're in Bliss: all allied fighters gain 150 Power.",
			Ability = {
				OnAnyTrigger = {
					Power = { {
						"Strengthen",
						150,
						"Ally",
						nil,
						nil,
						nil,
						"SadCat"
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = ":("
	},
	["Ersalin & Park"] = {
		Id = 93789939725844,
		Name = "Ersalin & Park",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Select a card in your hand. Reset its cost, put it at the bottom of your deck, then draw a card. If its cost was reduced this way, draw another card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomZoneTarget"
						},
						{
							"AlterEV",
							{ "Subtract", "Target", "BaseCost", "Nil" },
							"CustomZoneTarget"
						},
						{ "EVGreaterValueCheck", 0 },
						{
							"SetCost",
							{ 0, "Reset" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Deck_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to reset the cost of"
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 1 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Ally",
					NoBlip = true
				}
			},
			EffectDeckAddToBottom = true
		},
		Bio = "This polarizing detective duo have never failed to solve a cold case! Ersalin, the Time-Dredged and Park, the Unbound Alchemist are capable of anything! With their efforts combined, they travel the realms to unlock the secrets of the powers that were bestowed to them."
	},
	snubcubefighter = {
		Id = 78033298128166,
		Name = "Tim Horcoff",
		Health = 200,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Neutral",
		Rank = 4,
		Fading = true,
		Addant = "snubcubefighter",
		Cost = { Neutral = 1, Green = 2, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: A target fighter gains 50 Health and Power for each rank this card has. Give yourself a copy of this card with its rank increased by 4.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rank", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "Single" },
						{ "Strengthen", "Variable", "Single" },
						{
							"AlterEV",
							{ "Set", "Target", "Rank", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Math", 4, "Nil" },
							"Self"
						},
						{ "Add", "Addant" },
						{
							"GivePassiveSpecific",
							{ Rank = "Variable" },
							"AlliedAddedCard"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"What am I offering? Peace, quiet, relaxing hot coffee brewed every 20 minutes.\" He describes in a drawled back tone, leaning in. \"Always fresh.\" He holds out the paper for you again, parts of the text now seeming to feel impossible to hold in mind; readable, but horribly fleeting.\""
	},
	["Marcel, Ambassador of the Enormous"] = {
		Id = 72129983620079,
		Name = "Marcel, Ambassador of the Enormous",
		Health = 1150,
		Power = 50,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Description = "Once each turn, whenever you cast a fighter: Set the health and power of a target fighter equal to half of its total stats, rounded down.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "TotalStats", "Nil" },
							"Single"
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
						{ "SetHealth", "Variable", "Single" },
						{ "SetPower", "Variable", "Single" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"that fella behind me? thats phil hes my associate\""
	},
	["spiffyyy, funny adjective"] = {
		Id = 81061103730743,
		Name = "spiffyyy, funny adjective",
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 3, Red = 2, Blue = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever you cast an action: Give yourself an action card that's the same colour. Remove a stud of that colour from its cost. This triggers once each colour each turn.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ "Red", "RedColor" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Blue", "BlueColor" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Green", "GreenColor" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "YellowColor" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckPassRedColor = {
					Power = {
						{ "RandomAdd", "Variable Action", "Ally" },
						{
							"IncreaseCost",
							{ -1, "Color", "Nil" },
							"AlliedAddedCard"
						}
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnEVCheckPassBlueColor = {
					Power = {
						{ "RandomAdd", "Variable Action", "Ally" },
						{
							"IncreaseCost",
							{ -1, "Color", "Nil" },
							"AlliedAddedCard"
						}
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnEVCheckPassGreenColor = {
					Power = {
						{ "RandomAdd", "Variable Action", "Ally" },
						{
							"IncreaseCost",
							{ -1, "Color", "Nil" },
							"AlliedAddedCard"
						}
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnEVCheckPassYellowColor = {
					Power = {
						{ "RandomAdd", "Variable Action", "Ally" },
						{
							"IncreaseCost",
							{ -1, "Color", "Nil" },
							"AlliedAddedCard"
						}
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"I hope you're ready for the incoming schmix, 7 overheads into a hitgrab.\""
	},
	["Mechromancer Flufflefunz"] = {
		Id = 92827511804666,
		Name = "Mechromancer Flufflefunz",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Blue = 2, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		ModifierScintillant = true,
		Effect = {
			Description = "Thrice each turn, whenever you cast a fighter from a blessed space: That fighter generates and is returned to its hand.\nWhen this card is returned to its hand: Put a Scintillant Blessing onto the 6th card space in your hand.",
			Ability = {
				OnAllySummonModified = {
					Power = {
						{ "Generate", 1 },
						{ "Return" }
					},
					Target = "Aggressor",
					TurnTriggerLimit = 3
				},
				OnReturn = {
					Power = { { "AddHandModifier", "ScintillantBless" } },
					Target = "Self",
					MetaData = {
						SlotTargets = { 5 }
					}
				}
			}
		},
		Bio = "I DONT EVEN REMEMBER WHAT ACCURACY MEANS! ANARCHY FOREVERRRRRR!!!!!!!!"
	},
	["kuzueimu, My dearest friend"] = {
		Id = 84017282526734,
		AltCards = {
			["Joyful Jouster"] = {
				Id = 129943149795172,
				Name = "Joyful Jouster",
				PremiumArt = 854,
				Commissioner = { "BonkJobBot" },
				AltArt = true,
				Bio = "Aside from all the looting and violence. Nothing was better than jousting each other with sledgehammers, especially when there's Enzyme to go around! Good times! - BonkJobBot, Card Hoarder."
			}
		},
		Name = "kuzueimu, My dearest friend",
		Health = 550,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Description = "When this card is cast: Ransack 5. If you do, animate your terrain. If you ransacked and don't have a terrain, search your deck for a terrain card and inject this card.",
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
						{
							"EVGreaterValueCheck",
							{ 4, "Ransacked" },
							"Self"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 5 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 5
					}
				},
				OnEVCheckPassRansacked = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "PlayerTerrain", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "NoTerrain" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckPassNoTerrain = {
					Power = {
						{ "RandomTutorfor", "Terrain" },
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
					MetaData_AddCopy = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					},
					NoBlip = true
				},
				OnEVCheckFailNoTerrain = {
					Power = { { "AnimateTerrain", 30, "Ally" } },
					Target = "Self",
					NoBlip = true
				}
			},
			Injecting = true
		},
		Bio = "\"Roblox has always been a part of my life since I first played it. And the only person who connects me to it is kuzueimu. He is Brave. He is Professional. He is Ideal of me. He is what I wanted to be. When me opens computer, and when I open Roblox, he asks me, 'Hey, my dearest friend. What games are you playing today?'\"\" - Kyo Shirohane, User of Roblox"
	},
	["Apiri & Miles, Artisans"] = {
		Id = 84964194547193,
		Name = "Apiri & Miles, Artisans",
		AltCards = {
			MJM = {
				Id = 87806655670263,
				Name = "MJ&M",
				Addant = "Forget-Me-Not",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 623,
				Bio = "“Am i worth remembering?” -Curly <br/>“Yes, you are” - Meowboiiik"
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Addant = "Our Masterpiece",
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Give yourself a {B}{B}{B}{Y}{Y}{Y} 650/650 Masterpiece with no abilities.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"With the power of friendship anything is possible!\""
	},
	["Our Masterpiece"] = {
		Id = 121988812411460,
		Name = "Our Masterpiece",
		AltCards = {
			["Forget-Me-Not"] = {
				Id = 101805808365957,
				Name = "Forget-Me-Not",
				AttackEffect = "Jab",
				Bio = "“Even if years, decades or centuries pass, I’ll never forget you. My love.”"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Blue = 3, Yellow = 3 },
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
		Bio = "\"Fine Craft from Fine Craftsmen.\""
	},
	["Frank East"] = {
		Id = 91036514764938,
		Name = "Frank East",
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 1, Red = 1, Blue = 2 },
		CustomReminder = {
			Combomaker = "When there's 3 or more gear attached to this card: Destroy 3 of them and give yourself a free Combo action."
		},
		EffectVariable = 0,
		Effect = {
			Description = "Combomaker.\nDuring your end step: Move a gear from each adjacent fighter onto this card. Attach a gear with +0/+50 stat bonus to this card.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"Adjacent"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "AdjacentGears" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassAdjacentGears = {
					Power = {
						{
							"RandomMoveGear",
							{ "Self", "All", true },
							"Adjacent"
						},
						{ "EquipGear", "Scrap Metal" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFailAdjacentGears = {
					Power = { { "EquipGear", "Scrap Metal" } },
					Target = "Self",
					NoBlip = true
				},
				OnEquipGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 2, "Combomaker" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassCombomaker = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{
							"RepeatingRandomAdd",
							{
								{ "Paddlesaw", "Defiler", "Electric Rake", "Bloxy Cola Hat" },
								1
							},
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I've covered demon wars, ya know.\""
	},
	["Astro Greene"] = {
		Id = 111706692670683,
		Name = "Astro Greene",
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 1, Red = 2, Blue = 1 },
		CustomReminder = {
			Combomaker = "When there's 3 or more gear attached to this card: Destroy 3 of them and give yourself a free Combo action."
		},
		EffectVariable = 0,
		Effect = {
			Description = "Combomaker.\nWhen this card is cast or attacks: Attach a gear with +0/+50 stat bonus to it.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Scrap Metal" } },
					Target = "Self"
				},
				OnAttack = {
					Power = { { "EquipGear", "Scrap Metal" } },
					Target = "Self"
				},
				OnEquipGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 2, "Combomaker" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassCombomaker = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{
							"RepeatingRandomAdd",
							{
								{ "Paddlesaw", "Defiler", "Electric Rake", "Bloxy Cola Hat" },
								1
							},
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "“I know my way around an enzyme infused monstrosity or two.”"
	},
	["Scrap Metal"] = {
		Id = 120784582422528,
		Name = "Scrap Metal",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Gear = true,
		TokenOmni = true,
		Cost = { Neutral = 0 },
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
		Bio = ""
	},
	Paddlesaw = {
		Id = 127530937093294,
		Name = "Paddlesaw",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Blue",
		Archetype = "Combo",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 200 damage to a target fighter and 100 damage to fighters adjacent to it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{ "Damage", 100 },
						{ "Damage", 200, "Single" }
					},
					Target = "AdjacentEVTarget"
				}
			}
		},
		Bio = "It's a Sawzall. That means it saws ALL!"
	},
	Defiler = {
		Id = 130270585145642,
		Name = "Defiler",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Red",
		Archetype = "Combo",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Deal 500 damage to a target fighter. All players lose the excess damage dealt as life.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 500, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Target", "Health", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{ "Damage", 500, "Single" },
						{ "Inflict", "Variable", "Opponent" },
						{ "Cost", "Variable", "Ally" }
					},
					Target = "AdjacentEVTarget"
				}
			}
		},
		Bio = "Johnny Pipes would be proud."
	},
	["Electric Rake"] = {
		Id = 100601821017186,
		Name = "Electric Rake",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Red",
		Archetype = "Combo",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "Destroy your opponent's terrain.\nReveal the oldest card in your opponent's hand. It becomes fleeting.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyTerrain", 30, "Opponent" },
						{ "RevealCard", 30, "EnemyLeftMostHand" },
						{ "GivePassive", "Fleeting", "EnemyLeftMostHand" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "CLUNK CHCK BZZZZZZZZZZZZZZZZZZZZZZZT AAAUUUUGHHHHH"
	},
	["Bloxy Cola Hat"] = {
		Id = 90228716516868,
		Name = "Bloxy Cola Hat",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Blue",
		Archetype = "Combo",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "A target fighter gains 300 Health and starts regenerating.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 300 },
						{ "GivePassive", "Regen" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Hello, we herd you were having a pool party. We think that iz fun. Well be rite over. Sincerely, the Zombies"
	},
	dragoonxxx0 = {
		Id = 123002837672027,
		Name = "dragoonxxx0",
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		CustomReminder = {
			["Rainbow Power"] = "If you have {R}{R}{G}{G}{B}{B}{B}{B}{Y}, you will draw 1 card."
		},
		Effect = {
			Description = "When this card is cast: You lose all {R}{G}{B}{Y}. If you lost a stud of each colour this way, for the colour you lost the least of, draw that many cards and remove 4 {W} from their costs.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColorLeast", "Nil" },
							"Self"
						},
						{ "SetRed", 0 },
						{ "SetBlue", 0 },
						{ "SetYellow", 0 },
						{ "SetGreen", 0 },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 1, "Ally" },
						{
							"IncreaseCost",
							{ -4, "Neutral" },
							"DrawnCard"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "Once a mortal, this man become the sole representation of death. He can use his powers to kill or bring back anyone."
	},
	Saucefy10 = {
		Id = 135276207113578,
		Name = "Saucefy10",
		AltCards = {
			["Saucefy10-Badge"] = {
				Id = 90292981049899,
				Name = "Loveshot",
				AttackEffect = "Gun",
				Bio = "A kiss of death."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "Jab",
		CustomReminder = { ["Dies of death"] = "A card dies of death when it dies." },
		Color = "Green",
		Cost = { Green = 10 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card dies of death: Obliterate a target enemy fighter and all copies of it in all of its zones.",
			Ability = {
				OnDeath = {
					Power = { { "Extract" } },
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "\"Tooth Burning Bed.\""
	},
	["Soulysm, Deceitful Tyrant"] = {
		Id = 136671621692210,
		Name = "Soulysm, Deceitful Tyrant",
		AltCards = {
			["Soulysm, Charming Celestial"] = {
				Id = 135106336621571,
				Name = "Soulysm, Charming Celestial",
				AltArt = true,
				PremiumArt = 665,
				Bio = "You’ll cower to every word I say without hesitation. Otherwise, your fear will be your reality."
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "British",
		SummonAnimation = "SoulyStep",
		EffectAnimation = "SoulyLeer",
		Commissioner = { 8289996, 30244924 },
		CustomReminder = {
			Terrified = "A terrified fighter is obliterated during its end step."
		},
		Color = "Blue",
		Cost = { Green = 3, Blue = 5 },
		Effect = {
			Name = "Tyrant's Gaze",
			Description = "When this card is cast: Summon a terrified and unlocked copy of a target fighter.",
			Type = "OnSummon",
			Power = {
				{ "SummonCopy" },
				{ "Unlock", 9999, "SummonedCard" },
				{ "GivePassive", "Terrified", "SummonedCard" }
			},
			Target = "Single"
		},
		Bio = "All it takes for someone to kneel is one slight push in the right direction."
	},
	n_me = {
		Id = 94462428572724,
		Name = "n_me",
		Health = 1300,
		Power = 900,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Green = 6, Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: Give yourself a rare Green card and a rare Yellow card. Fighters given this way gain 250 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Rare Green" },
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Fighter" },
							"AddedCard"
						},
						{ "EVExactValueCheck", 1, "Self" },
						{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Rare Yellow" },
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Fighter" },
							"AddedCard"
						},
						{ "EVExactValueCheck", 1, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "StrengthenTargetInHand", 250 },
						{ "HealTargetInHand", 250 }
					},
					Target = "AddedCard"
				}
			}
		},
		Bio = "i have no answers to no questions :3"
	},
	["The Dead Hospital"] = {
		Id = 92751484676424,
		Name = "The Dead Hospital",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Blue",
		AttackEffect = "Slash",
		Terrain = true,
		Terrariant = "The Patients",
		Cost = { Blue = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "While in play, until each player's next end step, any time a fighter would gain Health by another effect, it gains that much Power instead.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "HealToStrengthen" } },
					Target = "All",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["The Patients"] = {
		Id = 111526830690300,
		Name = "The Patients",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever an effect gives this card Health or Power: All other allied fighters gain 100 of that stat. Suspend this card.",
			Ability = {
				OnEffectHeal = {
					Power = {
						{ "Heal", 100 },
						{ "Suspend", 30, "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					},
					TurnTriggerLimit = 1
				},
				OnEffectStrengthen = {
					Power = {
						{ "Strengthen", 100 },
						{ "Suspend", 30, "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					},
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	Twinedhealer89 = {
		Id = 104898635731487,
		Name = "Twinedhealer89",
		AltCards = {
			["The Catastrophe"] = {
				Id = 116739355537126,
				Name = "The Catastrophe",
				ArtAnimation = "Catastrophe",
				AltArt = true,
				PremiumArt = 805,
				Bio = "Entertain me! Dance for your lifes! Make me laugh!"
			}
		},
		Health = 1700,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Charge = true,
		Dextrous = true,
		TransformImmune = true,
		Color = "Neutral",
		Cost = { Neutral = 6, Red = 3, Yellow = 3, Green = 3, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Obliterate another target allied fighter. If you do, summon an unlocked fighter with the same colour as it. Trigger its effects as though it was cast.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "Color", "TargetColor" }
						},
						{
							"AlterEV",
							{ "Set", "Playertable", "ObliterateCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" },
							"Self"
						},
						{ "Obliterate", 30 },
						{
							"AlterEV",
							{ "Add", "Playertable", "ObliterateCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleAlly",
					TargetSubModifier = "CustomModAlly OtherCard",
					TargetSubModifierDescription = "a different allied fighter"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "Color", "TargetColor" },
							"Self"
						},
						{ "RandomSummonWithEffect", "Variable Fighter", "Ally" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "We love topdecking some late game on turn 8"
	},
	["The Parade"] = {
		Id = 134939689282684,
		Name = "The Parade",
		Health = 600,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Vote = "A {G}{G} Inert when discarded action. A target fighter generates twice and gains 100 health."
		},
		Addant = "Vote for LuckyTux",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast or at the start of your turns: Give yourself a fleeting 'Vote.'",
			Ability = {
				OnAllyStart = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					MetaData = { Fleeting = true }
				},
				OnSummon = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "After President LuckyTux rose to power after the events of Necrosyndicates in Bloxburg, he chose a powerful cabinet of leaders. However, he has gone missing. Where could the president be?!"
	},
	["Vote for LuckyTux"] = {
		Id = 73683094111340,
		Name = "Vote for Luckytux",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenDiscard = true,
		Fading = true,
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "A target fighter generates twice and gains 100 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Generate", 2 },
						{ "Heal", 100 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Commemorative pins from LuckyTux’s election campaign. The citizens wear them to honor their missing leader."
	},
	["Elaina & DuelistBC, Intertwined Journey"] = {
		Id = 74310982525991,
		Name = "Elaina & DuelistBC, Intertwined Journey",
		Health = 700,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "XhartyrSlash",
		SummonAnimation = "IntertwinedStep",
		Color = "Neutral",
		Cost = { Neutral = 1, Red = 1, Blue = 1, Green = 1, Yellow = 2 },
		EffectVariable = 0,
		Addant = "Entwined in Memory",
		CustomReminder = {
			["Entwined Memory"] = "A {W}{W} action. It searches your deck for a card of a colour.",
			["Ascension Towards Paradise"] = "A {W}{W}{R}{G}{B}{Y} action. A target fighter gains 300 Health and Power and Defender.\nIf the target is 'Elaina & DuelistBC, Intertwined Journey', draw a card."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself Entwined Memory and Ascension Towards Paradise.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant", "Ally" },
						{ "Add", "Ascension toward Paradise", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Entwined in Memory"] = {
		Id = 93198923663571,
		Name = "Entwined Memory",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Select a colour. Search your deck for a card of that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "RandomTutorfor", "Variable" }
					},
					Target = "Ally"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	["Ascension toward Paradise"] = {
		Id = 99090669597305,
		Name = "Ascension Toward Paradise",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		ReplaceCardArtant = 104556385360506,
		ReplaceCardNameant = "Chronicler: Awakening of Conviction",
		ReplaceBioant = "Through countless pains, wanderings, and countless stories, we came to recognize our own virtues. Now, it is time to uphold those convictions. Many challenges still lie ahead... but you know, we've done well so far.",
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "A target fighter gains 300 Health and Power and Defender.\nIf the target is 'Elaina & DuelistBC, Intertwined Journey', draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 300, "Single" },
						{ "Strengthen", 300, "Single" },
						{ "GivePassive", "Shield", "Single" },
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "SavedCardInstance" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"Single"
						},
						{
							"EVExactValueCheck",
							{ "Elaina & DuelistBC, Intertwined Journey", "MatchedTarget" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckPassMatchedTarget = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "SavedCardInstance" },
							"Self"
						},
						{ "ReplaceCardArt", "ReplaceCardArtant", "EVCard" },
						{ "ReplaceCardName", "ReplaceCardNameant", "EVCard" },
						{ "ReplaceBio", "ReplaceBioant", "EVCard" },
						{ "ChangeMusic", "FloofyCT", "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	["Xi_nal, The Honoured One"] = {
		Id = 87969115581587,
		Name = "Xi_nal, The Honoured One",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		TriggerInHand = true,
		Color = "Blue",
		Cost = { Neutral = 3, Green = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself 2 inert {W}{W}{G}{G}{B}{B} actions from a choice of 4—\n{C1} - Select 2 actions in your deck that cost 2 or fewer total studs and search them.\n{C2} - Give yourself 2 Nascent Studs. \n{C3} -  Summon a 500/400 fighter. Once each turn, as your opponent casts an action: Negate its effect.\n{C4} - All fighters lose 200 power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 38, "Nil" }
						},
						{ "EVGreaterValueCheck", 39 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"CreateChoices",
							{
								"Reverse Cursed Technique",
								"Cursed Technique Reversal: Green",
								"Inevitable Encounter",
								"Imaginary Technique: Mint"
							},
							"Self"
						},
						{ "MultiSelectOperation", "ChoiceSelect", "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "up to 2 actions to be given"
					}
				},
				MultiSelectOperationChoiceSelect = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					NoBlip = true
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	["Reverse Cursed Technique"] = {
		Id = 104563129911721,
		Name = "Cursed Technique Amplification: Blue",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Blue",
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Select up to 2 actions in your deck that costs 2 or fewer total studs and search them.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "ActionSelect", "CustomZoneTarget" } },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { MatchesParameter = "Action_2OrLower" },
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "up to two actions to put into your hand"
					}
				},
				MultiSelectOperationActionSelect = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
						"Aggressor"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["Cursed Technique Reversal: Green"] = {
		Id = 111696740731810,
		Name = "Cursed Technique Reversal: Green",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Green",
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		EffectVariable = 0,
		Addant = "Nascent Stud",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Give yourself 2 Nascent Studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Action",
						Modifier = true
					}
				}
			}
		},
		Bio = ""
	},
	["Inevitable Encounter"] = {
		Id = 111840951650762,
		Name = "Inevitable Encounter",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		EffectVariable = 0,
		Summonant = "accordingas11, Sorcerer Killer",
		CustomReminder = {
			["Sorcerer Killer"] = "Once each turn, as your opponent casts an action: Negate its effect."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Summon accordingas11, Sorcerer Killer, a 500/400 fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["accordingas11, Sorcerer Killer"] = {
		Id = 81317076894806,
		Name = "accordingas11, Sorcerer Killer",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		NegateAction = true,
		Color = "Blue",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Summonant = "accordingas11, Sorcerer Killer",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, as your opponent casts an action: Negate its effect.",
			Ability = {
				OnEnemyCast = {
					Power = { { "RemovePassive", "NegateAction", "Self" } },
					Target = "Self",
					TurnTriggerLimit = 1,
					NoBlip = true
				},
				OnStart = {
					Power = { { "GivePassive", "NegateAction", "Self" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["Imaginary Technique: Mint"] = {
		Id = 130000742365033,
		Name = "Imaginary Technique: Mint",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		EffectVariable = 0,
		ReplaceDescriptionant = "(Total action stud cost casted this game: Variable) \nFor each stud among all actions you've cast this game, deal 50 damage to all fighters.",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "All fighters lose 200 power.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 200, "All" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	Ray = {
		Id = 99397601365633,
		Name = "Ray",
		AltCards = {
			Ray2 = {
				Id = 119100189690077,
				Name = "Ray 2",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 786,
				Bio = "\"New and improved... or... rebuilt\""
			},
			RayBlue = {
				Id = 106656608431217,
				Name = "Ray but Blue",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 787,
				Bio = "\"Why am I blue?\""
			},
			RayBurned = {
				Id = 75711615367874,
				Name = "Ray Burned",
				AttackEffect = "Flame",
				AltArt = true,
				PremiumArt = 788,
				Bio = "Like some kind of Ray Burn"
			},
			Lorno = {
				Id = 99125335992559,
				Name = "Lorno",
				Commissioner = { "RayK_iv", "masterdoge1324" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 727,
				Bio = "Kill me for free win"
			},
			Rivvy = {
				Id = 139000868516134,
				Name = "Rivvy",
				Commissioner = { "WAYYYY_tooT1r3D" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 754,
				Bio = "Horseshoe crabs are often called living fossils, well this one IS a living fossil!"
			},
			["Astro, Ice Enjoyer"] = {
				Id = 135556773498676,
				Name = "Astro, Ice Enjoyer",
				Commissioner = { "Astrozizer" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 765,
				Bio = "do you guys chew the ice cubes when you finish your soda?"
			},
			Bobomb = {
				Id = 110503850894097,
				Name = "Bobomb",
				Commissioner = { "bobomb007" },
				AttackEffect = "TimeBomb",
				AltArt = true,
				PremiumArt = 767,
				Bio = "This guy doesnt realize hes gonna explode"
			},
			GabberDoesGames = {
				Id = 131602974925145,
				Name = "GabberDoesGames",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 823,
				Bio = "\"Hey everybody, look at me i'm a card, yo!\""
			},
			["Probably Ray"] = {
				Id = 136551683501578,
				Name = "Probably Ray",
				AttackEffect = "British",
				AltArt = true,
				PremiumArt = 831,
				Bio = "\"I'm probably the real Ray\""
			},
			["Ray But Colorless"] = {
				Id = 78260750349967,
				Name = "Ray But Colorless",
				Commissioner = { "RayK_iv" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 862,
				Bio = "Costs 2b, like any good colorless card!"
			}
		},
		Health = 250,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		SummonAnimation = "RaySummon",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card dies: Reset the Health of a random allied fighter.",
			Ability = {
				OnDeath = {
					Power = {
						{ "ResetHealth" },
						{ "Draw", 0, nil, nil, nil, "RayDeath" }
					},
					Target = "RandomOtherAllyField"
				}
			}
		},
		Bio = ""
	},
	["Vengeful Challengers"] = {
		Id = 91605510959592,
		Name = "Vengeful Challengers",
		Health = 500,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, When a card leaves your graveyard: You gain {R}{Y}.",
			Ability = {
				OnAllyGraveRemove = {
					Power = {
						{ "Red", 1 },
						{ "Yellow", 1 }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Suspiciously Rich People"] = {
		Id = 125843514812259,
		Name = "Suspiciously Rich People",
		SummonAnimation = "RayburnRant",
		Health = 700,
		Power = 700,
		Rank = 7,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 7, Yellow = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Your opponent selects a fighter from a choice of 3. You summon that card triggering effects when cast; Your opponent gains its cost in studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "Fighter", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"CustomZoneTarget"
						},
						{ "SummonWithEffect", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Red" }
						},
						{ "Red", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Yellow" }
						},
						{ "Yellow", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Green" }
						},
						{ "Green", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Blue" }
						},
						{ "Blue", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Neutral" }
						},
						{ "Neutral", "Variable", "Opponent" }
					},
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = { Fighter = true },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a fighter"
					}
				}
			},
			AmountOfTargets = 3,
			OpponentTarget = true
		},
		Bio = "An awful card. You should replace it in the deckbuilder."
	},
	Vonderland = {
		Id = 77542176656968,
		Name = "Vonderland",
		AltCards = {
			["Tragedy Of Mina"] = {
				Id = 115183090110970,
				Name = "Tragedy Of Mina",
				AttackEffect = "Storm",
				Bio = "I want to live but I’m told to die.<br/><b><font color=\"#00FFFF\">I want to die but I’m told to live.</font></b>"
			},
			Vyn = {
				Id = 117930287374238,
				Name = "Vyn.",
				Commissioner = { "VynterVonderland" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 687,
				Bio = "it's cold,,,"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "IcePunch",
		TriggerInGraveZone = true,
		Color = "Green",
		Cost = { Neutral = 3, Green = 9 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Summon a copy of a target allied fighter, except it’s zombified.\nDuring your end step, if there's an allied Zombified fighter: Recur this card.",
			Ability = {
				OnSummon = {
					Power = { { "SummonCopy" } },
					Target = "SingleAlly",
					MetaData = { Zombified = true }
				},
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"Self"
					} },
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 1, 9999, "Zombified" }
				}
			}
		},
		Bio = "hi chat"
	},
	The_Basket = {
		Id = 114923961942062,
		Name = "The_Basket",
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: This card and a random enemy fighter deal damage equal to their power to each other.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Power", "EnemyPower" },
							"RandomEnemyField"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "Damage", "Variable", "RandomEnemyField" },
						{
							"AlterEV",
							{ "Load", "Target", "Power", "EnemyPower" },
							"Self"
						},
						{ "Damage", "Variable", "Self" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "Opponent", 1, 9999 },
					KeepSameTargets = true
				}
			}
		},
		Bio = "Don't worry, i KNOW what i'm doing ',;3"
	},
	["Wyatt Jay Aegis"] = {
		Id = 115020152293498,
		Name = "Wyatt Jay Aegis",
		Health = 1200,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 6, Yellow = 6 },
		Rank = 7,
		EffectVariable = 0,
		ReplaceCardArtant = 127012959482122,
		ReplaceCardNameant = "Wyatt, Realized",
		ReplaceBioant = "\"What good is power if you can't protect the ones you love?\"",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever another allied fighter spirals or dies: If this card has 2 or more emotions attached to it, destroy them all and it gains 200 Health and Power. Otherwise this card spirals.",
			Ability = {
				["On|Other|AllySpiral"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedArchetypeCount", "Emotion" }
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					NoBlip = true
				},
				["On|Other|AllyDeath"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedArchetypeCount", "Emotion" }
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "Emotion", "Self" },
						{ "DestroyGear", "Emotion", "Self" },
						{ "DestroyGear", "Emotion", "Self" },
						{ "DestroyGear", "Emotion", "Self" },
						{ "DestroyGear", "Emotion", "Self" },
						{ "DestroyGear", "Emotion", "Self" },
						{ "Strengthen", 200 },
						{ "Heal", 200 },
						{ "ReplaceCardArt", "ReplaceCardArtant", "Self" },
						{ "ReplaceCardName", "ReplaceCardNameant", "Self" },
						{ "ReplaceBio", "ReplaceBioant", "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 3
				},
				OnEVCheckFail = {
					Power = { { "Spiral" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I've come too far to fail, I won't go down to the likes of you!\""
	},
	["CRiMP Crew"] = {
		Id = 130848867663904,
		Name = "CRiMP Crew",
		Health = 600,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: a target fighter gains Continued. Deal 500 damage to it",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Continued" },
						{ "Damage", 500 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "85864358858629/Cart-Ride-into-Mango-Phonk"
	},
	["Let 'em Cook"] = {
		Id = 99317640868475,
		Name = "Let 'em Cook",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1, Yellow = 1 },
		EffectAnimation = "CherryBlossomAllyBaseplate",
		Rank = 8,
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "For each differently grouped card in your baseplate, give yourself a card from that group.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "Groups", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "FirstUniqueArchetype"
					}
				},
				MultiSelectOperationGroups = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" },
							"Aggressor"
						},
						{ "RandomAdd", "Variable", "Ally" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Add another ingredient to the pot and let us cook a wonderful meal!!\nDisclaimer: Meals may or may not contain formerly sapient individuals."
	},
	Cheshire = {
		Id = 119416590161681,
		Name = "Cheshire",
		Health = 500,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		AllowBliss = true,
		Color = "Yellow",
		Cost = { Neutral = 3, Red = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Deal 50 damage to all other fighters for each fewer card you have in your graveyard than your opponent's. The damage is Overloaded if you are in Bliss.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "LargerGrave" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassLargerGrave = {
					Power = {
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "DamageToDeal" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Playertable", "Bliss", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "InBliss" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassInBliss = {
					Power = {
						{
							"AlterEV",
							{ "Load", "EffectVariable", "nil", "DamageToDeal" },
							"Self"
						},
						{ "DamageOverloaded", "Variable", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "OtherCards"
					}
				},
				OnEVCheckFailInBliss = {
					Power = {
						{
							"AlterEV",
							{ "Load", "EffectVariable", "nil", "DamageToDeal" },
							"Self"
						},
						{ "Damage", "Variable", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "OtherCards"
					}
				}
			}
		},
		Bio = "“I went to a hunting party once, I didn’t like it. Terrible people. They all started hunting me!”"
	},
	Revisualization = {
		Id = 184670175,
		Name = "Revisualization",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		PlayTest = true,
		LunaTest = true,
		Gear = true,
		GearTarget = "Ally",
		Color = "Blue",
		Cost = { Blue = 10 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Attach to a target allied fighter.\nSet its power to 0.\nThis card can't gain health or power via effects.\nAt the start of your turns: Select a fighter card in your deck. Transform the fighter this is attached to into a copy of that card.",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{ "SetPower", 0 },
						{ "GivePassive", "StrengthenImmune" },
						{ "GivePassive", "HealImmune" }
					},
					Target = "GearOwner"
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomZoneTarget"
						},
						{ "Transform", "Variable", "GearOwner" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a fighter to transform into"
					}
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "StrengthenImmune" },
						{ "RemovePassive", "HealImmune" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = ""
	},
	hickteck = {
		Id = 123378982423007,
		Name = "hickteck",
		AltCards = {
			Shovel = {
				Id = 137605239375748,
				Name = "Shovel",
				AttackEffect = "Slash",
				Addant = "$GYRO-Shovel",
				AltArt = true,
				PremiumArt = 661,
				Bio = "<b>TO BE VERY CLEAR SHOVEL IS A NAME WE GAVE TO A CHARACTER</b><br/><b>HE HAS 0 CORRELATION TO THE ACTUAL SHOVEL</b>"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "BrickThrow",
		Color = "Green",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Addant = "$GYRO",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast, if there's 2 or more colours among cards in your baseplate: Each player draws a card. Give each player 2 '$GYRO.'\nOnce ever, when '$GYRO' is cast: This card gains haste. Return it to its hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1 },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Opponent" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Opponent" }
					},
					Target = "All",
					EffectRequirement = { "Chromatic", "AllyGenZone", 2, 99 }
				},
				OnAnyCast = {
					Power = {
						{ "GivePassive", "Charge" },
						{ "Return" }
					},
					Target = "Self",
					Archetype = "Cryptocurrency",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "\"Kids are competing to steal ‘Brainrot’ NFTs in the GyroVerse. Here’s what this means for crypto prices:\""
	},
	["$GYRO"] = {
		Id = 111316504000835,
		Name = "$GYRO",
		AltCards = {
			["$GYRO-Shovel"] = {
				Id = 78425329727941,
				Name = ":good_job_shovel:",
				AttackEffect = "Slash",
				Bio = ":good_job_shovel:"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Undiscardable = true,
		Color = "Neutral",
		Archetype = "Cryptocurrency",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "GivePassive", "Charge" },
						{ "Return" }
					},
					Target = "Self",
					Archetype = "Cryptocurrency",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "You will own nothing and be happy."
	},
	["Grimbles Auroras"] = {
		Id = 9773724467,
		Name = "Grimbles Auroras",
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		LunaTest = true,
		PlayTest = true,
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 8 },
		EffectVariable = 0,
		Dextrous = true,
		WeakenImmune = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: All enemy fighters lose 150 Power. Swap their stats.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Weaken", 150 },
						{ "Swap" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "GRIMBLY SCHRIMBLY"
	},
	["Office and Phila"] = {
		Id = 37533655,
		Name = "Office and Phila",
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		PlayTest = true,
		LunaTest = true,
		Color = "Green",
		Cost = { Neutral = 2, Blue = 2, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Select {G} or {B}. Put a card of that color from your deck into your baseplate. Search your deck for a card of the other color that costs 5 or more total studs.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Green Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "EVExactValueCheck", "Green" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Green", "Deck_Ally", "GenZone_Ally", true, false, 1 },
							"Self"
						},
						{ "RandomTutorfor", "Blue 5orHigherCost", "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"MoveZone",
							{ "Blue", "Deck_Ally", "GenZone_Ally", true, false, 1 },
							"Self"
						},
						{ "RandomTutorfor", "Green 5orHigherCost", "Ally" }
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	["NTPinheiro: Fourth Match Flame"] = {
		Id = 124559888887178,
		Name = "NTPinheiro: Fourth Match Flame",
		AltCards = {
			["SashaTilde Processing Transition Request"] = {
				Id = 106837662742095,
				Name = "SashaTilde: Processing Transition Request",
				Summonant = "Embers-Sasha",
				AttackEffect = "Jab",
				Bio = "<Goodbye, Farewell. Farewell, FarewellFarewellFarewellFarewellFarewellFarewellFarewellFarewellFarewell>"
			}
		},
		Health = 1250,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "FireBreathSmall",
		Color = "Red",
		Cost = { Neutral = 2, Red = 6 },
		EffectVariable = 0,
		Summonant = "Embers",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Attach Marked to a target fighter.\nWhenever a marked fighter dies: Summon an unlocked 50/100 Embers that's fading and inert in all zones.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Marked Mod", "Single" } },
					Target = "Self"
				},
				OnAnyDeath = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Ally",
					Marked = "True"
				}
			}
		},
		Bio = "\"These matches won't last forever, but you'll stay, right? You said you were different...\""
	},
	Embers = {
		Id = 93892679947110,
		Name = "Embers",
		AltCards = {
			["Embers-Sasha"] = {
				Id = 100279749777216,
				Name = "The Heart of the Townsfolk",
				AttackEffect = "Jab",
				Bio = "\"After we hold hands<br/>and love one another,<br/>I'll kill the dreams I could never fulfill\""
			}
		},
		Health = 50,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Fading = true,
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "EquipGear", "Marked Mod", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "hey its me rumbiez. please do not blow me up"
	},
	GGGGraded = {
		Id = 132298767520133,
		Name = "GGGGraded",
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Select any number of fighters in your hand and add {G}{G} to their cost. They gain 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"IncreaseCost",
							{ 2, "Green" },
							"CustomZoneTarget"
						},
						{ "Strengthen", 200, "CustomZoneTarget" },
						{ "Heal", 200, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Fighter = true },
						MinTargets = 0,
						MaxTargets = 10,
						SelectionDescription = "any number of fighters"
					}
				}
			}
		},
		Bio = ""
	},
	Simink_G = {
		Id = 117708980717317,
		Name = "Simink_G",
		Health = 1000,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Twice each turn, whenever your opponent loses Life: Recur the allied bottom card, except it's fading.",
			Ability = {
				OnEnemyHealthLoss = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TurnTriggerLimit = 2,
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "TopCard"
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"the G does not stand for green, don't make the same mistake I did oh god help\" \n- free"
	},
	["Funderworld Decadent"] = {
		Id = 87345079036708,
		Name = "Funderworld Decadent",
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "StudBlast",
		SummonAnimation = "DuckCall",
		EffectAnimation = "DuckCall",
		Token = true,
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		EffectVariable = 0,
		Addant = "Copycat",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself 3 100/200 Copycats that are inert when discarded.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingAdd",
						{ "Addant", 3 },
						"Ally"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"Get ready for a Pits Trial!\" The cat cheered. \"Tonight's host...\""
	},
	Copycat = {
		Id = 125134279855698,
		Name = "Copycat",
		Health = 100,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		SummonAnimation = "DuckCall",
		TokenDiscard = true,
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "",
			Ability = {
				Nil = {
					Power = { {
						"RepeatingAdd",
						{ "Copycat", 4 },
						"Ally"
					} },
					Target = "Self",
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = "\"Me! I've been here the whole time!\""
	},
	["Token Appraiser"] = {
		Id = 91852196737500,
		Name = "Token Appraiser",
		Health = 1500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		RandomAddBypass = "IncludeToken",
		Cost = { Yellow = 8 },
		EffectVariable = 0,
		Rank = 7,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever an allied token dies: Give yourself a token card, except it's Yellow. Convert all {R}{G}{B} in its cost to {Y}.",
			Ability = {
				OnAllyDeath = {
					Power = { { "RandomAdd", "Token" } },
					Target = "Ally",
					Rarity = "Token",
					MetaData = {
						ConvertColors = { Red = "Yellow", Blue = "Yellow", Green = "Yellow" },
						Color = "Yellow"
					},
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["City With No Purpose"] = {
		Id = 132070011904385,
		Name = "City With No Purpose",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Terrain = true,
		Color = "Green",
		CustomReminder = {
			Edward = "A Green 1000/500 Fighter with Overload. Whenever it attacks: Summon the top card of your graveyard as a 100/100 Zombified fighter, then destroy it."
		},
		Cost = { Red = 2, Green = 2 },
		ReplaceDescriptionant = "Variable Charges.\nWhenever an allied fighter dies, if it's not in combat: This card loses a charge. Then if it has no charges, destroy it and summon Edward, an unlocked 1000/500 fighter",
		Summonant = "Edward",
		Terrariant = "Experience Loop",
		EffectVariable = 6,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "6 Charges.\nWhenever an allied fighter dies, if it's not in combat: This card loses a charge. Then if it has no charges, destroy it and summon Edward, an unlocked 1000/500 fighter.",
			Ability = {
				OnAllyNonCombatDeath = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Destroy", 30, "Self" }
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "“Have A Nice Day! Have A Nice Day! Have A Nice Day!”\nHe heard the same words multiple times before. This day will be different."
	},
	Edward = {
		Id = 107853080170146,
		Name = "Edward, Nobody's Hero",
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Overload = true,
		Color = "Green",
		Cost = { Green = 2, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Summon an unranked fighter card in your graveyard that costs 8 or fewer total studs, except it's Zombified. Then destroy it.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{
								"Unranked_8OrLower_Fighter",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false,
								1
							},
							"Self"
						},
						{ "Destroy", 30, "SummonedCard" }
					},
					Target = "Ally",
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "“You can only be the hero when you accept what you're doing is right.”"
	},
	["Experience Loop"] = {
		Id = 86758119501237,
		Name = "Experience Loop",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: Shuffle your hand into your deck, then draw that many cards.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Deck_Ally", true, false, 10 },
							"Self"
						},
						{ "Draw", "Variable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "“The same life, over and over, yet. It makes you wonder if you’ll <b>experience everything.</b>”"
	},
	["BrickbattleSorcerer - Elementalist"] = {
		Id = 118773713295091,
		Name = "BrickbattleSorcerer - Elementalist",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 1 },
		Addant = "Nascent Stud",
		CustomReminder = {
			Reform = "A Blue {B}{B} action, inert in all zones. Swap the stats of a target fighter.",
			Frost = "A Blue {B} action, inert in all zones. All enemy fighters lose 50 Power."
		},
		Rank = 6,
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself 'Reform' and 'Frost.'\nWhen this card dies: Give yourself a Nascent Stud.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Shatter" },
						{ "Add", "Frost" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	Shatter = {
		Id = 134981804598210,
		Name = "Reform",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Fading = true,
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Swap the stats of a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Swap" } },
					Target = "Single"
				}
			}
		},
		Bio = ""
	},
	Frost = {
		Id = 139064533313804,
		Name = "Frost",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		Fading = true,
		Color = "Blue",
		Cost = { Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "All enemy fighters lose 50 Power.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 50 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	Deforester = {
		Id = 117325504073738,
		Name = "Deforester",
		Health = 800,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Scorch",
		Color = "Green",
		Cost = { Green = 3, Red = 3 },
		CustomReminder = {
			["Burning Tree"] = "A Red {W}{R}{G} terrain, inert when discarded. When this card is destroyed from play: Deal 200 damage to a target fighter."
		},
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself 2 Burning Trees.\nWhenever this card attacks and destroys another: Destroy your terrain. If you do, unlock this card.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingAdd",
						{ "DeforesterTree", 2 },
						"Ally"
					} },
					Target = "Ally"
				},
				OnAttackDestroy = {
					Power = {
						{ "DestroyTerrain" },
						{ "Unlock", 999, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "Just a guy who loves to watch things burn."
	},
	DeforesterTree = {
		Id = 111265510773265,
		Name = "Burning Tree",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Terrain = true,
		TokenDiscard = true,
		Terrariant = "DeforesterTerrarian",
		Color = "Red",
		Archetype = "Tree",
		Cost = { Neutral = 1, Green = 1, Red = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is destroyed from play: Deal 200 damage to a target fighter.",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 200 } },
					Target = "Single"
				}
			}
		},
		Bio = "With the Deforesters on the loose, soon all trees will look like this."
	},
	DeforesterTerrarian = {
		Id = 114377604554287,
		Name = "Smouldering Remains",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Scorch",
		Terrarian = true,
		Color = "Red",
		Archetype = "Tree",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Transformant = "Dead Tree",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card dies: Transform a target fighter into a dead tree.",
			Ability = {
				OnDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Single"
				}
			}
		},
		Bio = "\"They say that it's easier to create than to destroy. I don't know 'bout you, but I find creating fires MUCH easier than getting rid of them!\"\""
	},
	["Brixzee!"] = {
		Id = 114910917813064,
		Name = "Brixzee!",
		AltCards = {
			Entwined = {
				Id = 76827604877959,
				Name = "Entwined",
				Commissioner = { "Ykoimonha1115", "Studderies" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 710,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Green, Blue, or Yellow.",
					Ability = {
						OnAnyAllyCast = {
							Power = { {
								"RandomSummon",
								{ "Entwined", "Entwined-Y", "Entwined-B" }
							} },
							Target = "Ally",
							SharesColor = "Green",
							TurnTriggerLimit = 1,
							MetaData = { Rarity = "Legendary" }
						}
					}
				},
				Bio = "Big smile! Worm and comfy!<br/>Doting on you like a cat"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		SummonedAnimation = "SummonFrolic",
		Stealth = true,
		Color = "Green",
		Cost = { Neutral = 1, Green = 2, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Blue, Green, or Yellow.",
			Ability = {
				OnAnyAllyCast = {
					Power = { {
						"RandomSummon",
						{ "Brixzee!", "Brixzee!-Y", "Brixzee!-B" }
					} },
					Target = "Ally",
					SharesColor = "Green",
					TurnTriggerLimit = 1,
					MetaData = { Rarity = "Legendary" }
				}
			}
		},
		Bio = "\"it's pronounced, b g y!!! not  g b y!!! get it right!!!\" "
	},
	["Brixzee!-Y"] = {
		Id = 85476881027304,
		Name = "Brixzee!",
		AltCards = {
			["Entwined-Y"] = {
				Id = 139324106592598,
				Name = "Obsession",
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Green, Blue, or Yellow.",
					Ability = {
						OnAnyAllyCast = {
							Power = { {
								"RandomSummon",
								{ "Entwined", "Entwined-Y", "Entwined-B" }
							} },
							Target = "Ally",
							SharesColor = "Yellow",
							TurnTriggerLimit = 1,
							MetaData = { Rarity = "Legendary" }
						}
					}
				},
				AttackEffect = "Jab",
				Bio = "WOWZA! you pulled me!!! I'm like, the rarererest ever!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		SummonedAnimation = "SummonHopper",
		Stealth = true,
		Color = "Yellow",
		Cost = { Neutral = 1, Green = 2, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Green, Blue, or Yellow.",
			Ability = {
				OnAnyAllyCast = {
					Power = { {
						"RandomSummon",
						{ "Brixzee!", "Brixzee!-Y", "Brixzee!-B" }
					} },
					Target = "Ally",
					SharesColor = "Yellow",
					TurnTriggerLimit = 1,
					MetaData = { Rarity = "Legendary" }
				}
			}
		},
		Bio = "\"it's pronounced, b g y!!! not  g b y!!! get it right!!!\" "
	},
	["Brixzee!-B"] = {
		Id = 111228896551614,
		Name = "Brixzee!",
		AltCards = {
			["Entwined-B"] = {
				Id = 128712729628948,
				Name = "Codependency",
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Green, Blue, or Yellow.",
					Ability = {
						OnAnyAllyCast = {
							Power = { {
								"RandomSummon",
								{ "Entwined", "Entwined-Y", "Entwined-B" }
							} },
							Target = "Ally",
							SharesColor = "Blue",
							TurnTriggerLimit = 1,
							MetaData = { Rarity = "Legendary" }
						}
					}
				},
				AttackEffect = "Jab",
				Bio = "I'll spark from now on,<br/>cause I promised to give you my word.<br/>So, can we smile again?"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		SummonedAnimation = "SummonFlipping",
		Stealth = true,
		Color = "Blue",
		Cost = { Neutral = 1, Green = 2, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever you cast a card with the same colour as this card: Summon a copy of this card that's Green, Blue, or Yellow.",
			Ability = {
				OnAnyAllyCast = {
					Power = { {
						"RandomSummon",
						{ "Brixzee!", "Brixzee!-Y", "Brixzee!-B" }
					} },
					Target = "Ally",
					SharesColor = "Blue",
					TurnTriggerLimit = 1,
					MetaData = { Rarity = "Legendary" }
				}
			}
		},
		Bio = "\"it's pronounced, b g y!!! not  g b y!!! get it right!!!\" "
	},
	["R1601, The Void Scourge"] = {
		Id = 94280599297725,
		Name = "R1601, The Void Scourge",
		AltCards = {
			["R1601, The Void Scourge-Mango"] = {
				Name = "Wrath",
				Id = 73299113694764,
				SummonAnimation = "NWrathSummon",
				AttackEffect = "Axe",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "Feels the aura"
			}
		},
		Health = 1400,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		WeakenImmune = true,
		Rank = 7,
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 9 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: All fighters lose 100 Power. Then attach a copy of all fighters with lesser power to this card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Weaken", 100, "All" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EquipGear", "TargetToSelf", "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "NotPower",
						Modifier = "Variable"
					}
				}
			}
		},
		Bio = "\"The first rogue of the Oblivion Empire\""
	},
	["Liiam, BLESSed"] = {
		Id = 74729211812258,
		Name = "Liiam, BLESSed",
		AltCards = {
			Cubibibism = {
				Id = 81769186376131,
				Name = "Cubibibism",
				ArtAnimation = "Cubibibism",
				Commissioner = { "Raphxt" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 676,
				Bio = "Deception and lies if you are young<br/>I wonder if there’s any meaning behind it?<br/>While holding the truth within your arms<br/>It rotted away, dead on the floor"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		SummonAnimation = "SummonLiiam",
		Overload = true,
		Color = "Yellow",
		Cost = { Neutral = 3, Green = 3, Yellow = 2 },
		EffectAnimation = "NerdyAll",
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Deal 300 damage to all fighters. This card gains 300 Health and Power for each token that's died this way.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "TokenDeathCount", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Damage", 300, "All" },
						{
							"AlterEV",
							{ "Add", "Playertable", "TokenDeathCount", "Nil" }
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Smiling like an angel\nA strong hallucination, INTERNET GIRL\nWhispering like a devil\nA downer just for you, NEEDY GIRL"
	},
	["Welcome, User!"] = {
		Id = 111710108291691,
		Name = "Welcome, User!",
		AltCards = {
			["Rumbiez, the Starsplitter"] = {
				Id = 129970638473725,
				Name = "Rumbiez, the Starsplitter",
				AttackEffect = "Illumina",
				AltArt = true,
				PremiumArt = 598,
				Bio = "As the Heavens fall, so shall my blade."
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Red = 2, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card dies: Select an unranked fighter in your deck that costs 6 or fewer total studs and destroy it. It gains rank 7 and liberate. Repeat this effect if there's an allied fading fighter.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true, CostOrLess = 6, Unranked = true },
						SelectionDescription = "a fighter from your deck to destroy and give liberate",
						MinTargets = 0,
						MaxTargets = 1
					},
					MetaData = { Rank = 7, Liberate = true }
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true, CostOrLess = 6, Unranked = true },
						SelectionDescription = "a fighter from your deck to destroy and give liberate",
						MinTargets = 0,
						MaxTargets = 1
					},
					MetaData = { Rank = 7, Liberate = true },
					EffectRequirement = { "HasPassive", "Ally", 1, 9999, "Fading" }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "I love talking to the little people inside my computer!"
	},
	Secret_Purple2 = {
		Id = 115578671505003,
		Name = "Secret_Purple2",
		Health = 600,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		EffectVariable = "Maladeity's Pustule",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Select a non-token card in your baseplate, Obliterate it and put 4 copies of it into your graveyard.",
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
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Variable", "GenZone_Ally", "Nil", true, false },
							"Self"
						},
						{ "GraveAdd", "Variable" },
						{ "GraveAdd", "Variable" },
						{ "GraveAdd", "Variable" },
						{ "GraveAdd", "Variable" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "RandomCard",
						Modifier = 1
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = { NotRarity = "Token" },
						SelectionDescription = "a non-token card in your baseplate.",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "\"Bloxy Cola is surprisingly flamable, does drinking these make me flamable?\""
	},
	skydec808 = {
		Id = 97226893756450,
		Name = "skydec808, the protector of RGB",
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Shield = true,
		Color = "Green",
		Cost = { Red = 2, Blue = 2, Green = 3, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Another target allied fighter gains 400 Health and Power and Dextrous. Return it to its hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 400 },
						{ "Heal", 400 },
						{ "GivePassive", "Dextrous" },
						{ "Return" }
					},
					Target = "SingleAlly",
					TargetSubModifier = "CustomModAlly OtherCard",
					TargetSubModifierDescription = "a different allied fighter"
				}
			}
		},
		Bio = "Get behind me, I'll take it from here."
	},
	Semperel = {
		Id = 99396530441172,
		Name = "Semperel",
		AltCards = {
			["SHIBA, SAVIOR OF THE BLACK FOREST"] = {
				Name = "BonBon",
				AttackEffect = "Flare",
				AltArt = true,
				Id = 114508205171140,
				PremiumArt = 117,
				Bio = "BonBon"
			}
		},
		Health = 1650,
		Power = 50,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 5, Green = 5, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast or dies: All other allied fighters gain 200 Health and Power. Attach Overload to them.\nWhen another allied fighter dies: Summon a fading copy of it with 100 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 },
						{ "EquipGear", "Overloaded Mod" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
				},
				OnDeath = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 },
						{ "EquipGear", "Overloaded Mod" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
				},
				["On|Other|AllyDeath"] = {
					Power = { { "SummonCopy" } },
					Target = "Aggressor",
					MetaData = { Health = 100, Fading = true },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = ""
	},
	Lagswitch = {
		Id = 82828532630071,
		Name = "Lagswitch",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Gear = true,
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		CustomReminder = { ["Preventable Death"] = "During your end step: You lose 400 life." },
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Attach to a target fighter.\nWhenever this card attacks: It might not be countered this way. If it is countered, destroy it and put a Preventable Death into your baseplate.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 100 }
						},
						{
							"EVGreaterValueCheck",
							{ 40, "CounterPassed" }
						}
					},
					Target = "Self"
				},
				OnAttackEndPreDeath = {
					Power = {
						{ "RemovePassive", "CounterAttackBlock" },
						{
							"EVGreaterValueCheck",
							{ 40, "CounterFailed" }
						}
					},
					Target = "Self",
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassCounterPassed = {
					Power = { { "GivePassive", "CounterAttackBlock" } },
					Target = "Self"
				},
				OnEVCheckFailCounterFailed = {
					Power = {
						{
							"AddGenZone",
							{ "Preventable Death", 1 },
							"Ally"
						},
						{ "Destroy" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "I never know the exit to get off at 'til it's passed."
	},
	["Preventable Death"] = {
		Id = 82416332930472,
		Name = "Preventable Death",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		TokenOmni = true,
		TriggerInGenZone = true,
		Color = "Neutral",
		Cost = { Red = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: You lose 400 Life. This effect can trigger in your baseplate.",
			Ability = {
				OnEnd = {
					Power = { { "Cost", 400, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "DOOR STUCK!"
	},
	BBBGraded = {
		Id = 135402470476261,
		Name = "BBBGraded",
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		SummonAnimation = "FlickeringSummon",
		Color = "Neutral",
		Cost = { Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever another fighter is cast: It loses 100 Power. Lock this card for 1 turn. \nWhenever this card gains a lock: It gains 100 Health.",
			Ability = {
				["On|Other|AnySummon"] = {
					Power = {
						{ "Weaken", 100 },
						{ "Lock", 1, "Self" }
					},
					Target = "Aggressor"
				},
				OnLockIncrease = {
					Power = { { "Heal", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I'm at the <i>what</i> lake?\""
	},
	["Arin Fairfax"] = {
		Id = 116542045062002,
		Name = "Calling Card",
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 6, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Deal 100 damage to all enemy fighters, they gain Decaying.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 100 },
						{ "GivePassive", "Decaying" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "What are you snoopin' around for? This ain't one of those black ops missions!"
	},
	["Vice President Yoyle"] = {
		Id = 124497684215944,
		Name = "Vice President Yoyle",
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Token = true,
		Color = "Red",
		Cost = { Red = 1 },
		DamageMitigation = 100,
		EffectVariable = 0,
		GraveAddant = "Cabinet Meeting",
		CustomReminder = {
			["Cabinet Meeting"] = "A {W}{W}{W}{R}{R}{R} action. Give yourself a copy of your terrain, then animate it. You lose 200 life."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "This card takes 100 less damage from effects. When this card is cast: Put a Cabinet Meeting on top of your deck.",
			Ability = {
				OnSummon = {
					Power = { { "DeckAdd", "Cabinet Meeting" } },
					Target = "Ally"
				}
			},
			EffectDeckAddToTop = true
		},
		Bio = "As Vice President, ASliceOfYoyleCake’s main role is to cast a tiebreaker vote in Congress. However, since they can never agree when to cast votes necessary of a tiebreaker, he’s usually just standing there."
	},
	["Cabinet Meeting"] = {
		Id = 119288976182708,
		Name = "Cabinet Meeting",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		EffectVariable = 0,
		Addant = "World of Pain",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Give yourself a copy of your terrain, then animate it. You lose 200 life.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"AllyTerrain"
						},
						{ "AnimateTerrain" },
						{ "Add", "Variable", "Ally" },
						{ "Cost", 200 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Perfected Immortality"] = {
		Id = 127221233415347,
		Name = "Perfected Immortality",
		AltCards = {
			["Dr Tragedy"] = {
				Name = "Dr. Tragedy",
				Id = 70707667358131,
				AltArt = true,
				PremiumArt = 872,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Whenever this card attacks: If there's no allied Everlasting Luckytux or Everlasting IcyTea, summon them unlocked as 50/500 fighters.",
					Ability = {
						OnAttack = {
							Power = {
								{
									"EVExactValueCheck",
									{ 0, "Luckytux" }
								},
								{
									"EVExactValueCheck",
									{ 0, "Icytea" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassLuckytux = {
							Power = {
								{ "Summon", "Everlasting LuckyTux-D" },
								{ "Unlock", 999, "SummonedCard" }
							},
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Everlasting LuckyTux" }
						},
						OnEVCheckPassIcytea = {
							Power = {
								{ "Summon", "Everlasting IcyTea-D" },
								{ "Unlock", 999, "SummonedCard" }
							},
							Target = "Ally",
							EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Everlasting IcyTea" }
						}
					}
				},
				Bio = ""
			}
		},
		Health = 2000,
		Power = 50,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Fading = true,
		Color = "Blue",
		Cost = { Blue = 10 },
		EffectVariable = 0,
		Rank = 8,
		GraveAddant = "Cabinet Meeting",
		CustomRemnider = {
			IcyTea = "Whenever this card attacks: Shuffle your hand into your deck, then draw 5 cards.",
			LuckyTux = "Whenever this card attacks: Select a card in your opponent's hand. It can't be cast next turn."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: If there's no allied Everlasting Luckytux or Everlasting IcyTea, summon them unlocked as 50/500 fighters.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"EVExactValueCheck",
							{ 0, "Luckytux" }
						},
						{
							"EVExactValueCheck",
							{ 0, "Icytea" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassLuckytux = {
					Power = {
						{ "Summon", "Everlasting LuckyTux" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Everlasting LuckyTux" }
				},
				OnEVCheckPassIcytea = {
					Power = {
						{ "Summon", "Everlasting IcyTea" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Everlasting IcyTea" }
				}
			}
		},
		Bio = "Ever since shattering of the Brick, no man could live forever— yet the invention of the Necroenzyme Vial changed that fact. By combining forces, IcyTea and LuckyTux created what can only be called the Immortality Machine."
	},
	["Everlasting LuckyTux"] = {
		Id = 126087707577642,
		Name = "Everlasting LuckyTux",
		AltCards = {
			["Everlasting LuckyTux-D"] = {
				Id = 118855512067198,
				AttackEffect = "Slash",
				Name = "Accordingas11",
				Bio = ""
			}
		},
		Health = 50,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Fading = true,
		Color = "Blue",
		Cost = { Blue = 10 },
		EffectVariable = 0,
		GraveAddant = "Cabinet Meeting",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Reveal your opponent's hand and select a card in it. Until its next end step, add 40{W} to its cost.",
			Ability = {
				OnAttack = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{
							"SetTempCost",
							{ Neutral = 40 },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						SelectionDescription = "a card in your opponent's hand",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "Death and rebirth. Through all eternity, the soul of the President may live on to guide the world in his image."
	},
	["Everlasting IcyTea"] = {
		Id = 110256615480037,
		Name = "Everlasting IcyTea",
		AltCards = {
			["Everlasting IcyTea-D"] = { Id = 72189920923632, AttackEffect = "Slash", Name = "Luna", Bio = "" }
		},
		Health = 50,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Fading = true,
		Color = "Blue",
		Cost = { Blue = 10 },
		EffectVariable = 0,
		GraveAddant = "Cabinet Meeting",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Shuffle your hand into your deck, then draw 5 cards.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Deck_Ally", true, false, 10 },
							"Self"
						},
						{ "Draw", 5 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Death and rebirth. Through all eternity, the soul of the Archivist may live on to record the true history of the world."
	},
	["Fluffle, Chief of Staff"] = {
		Id = 73514193495955,
		Name = "Chief of Staff Fluffle",
		Health = 1000,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card takes noncombat damage: Double this card's power.",
			Ability = {
				OnEffectDamage = {
					Power = { { "MultiplyPower", 2 } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Parli9, Void's End"] = {
		Id = 112358735464743,
		Name = "Parli9, Void's End",
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Select 1 effect—\n{C1} Obliterate all terrains and graveyards.\n{C2} Obliterate all fighters with 1200 or more Power.\n{C3} Obliterate all token fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Parli9C12", "Parli9C22", "Parli9C32" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"TargetChoiceZone"
						},
						{
							"EVExactValueCheck",
							{ "Parli9C12", "RedColor" }
						},
						{
							"EVExactValueCheck",
							{ "Parli9C32", "BlueColor" }
						},
						{
							"EVExactValueCheck",
							{ "Parli9C22", "GreenColor" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassRedColor = {
					Power = { { "Obliterate" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "Power",
						Modifier = 1200
					}
				},
				OnEVCheckPassBlueColor = {
					Power = { { "Obliterate", 30, "Token" } },
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				},
				OnEVCheckPassGreenColor = {
					Power = {
						{ "DestroyTerrain", "Obliterate", "All" },
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "Nil", true, false, 999 },
							"Self"
						}
					},
					Target = "All"
				}
			},
			CreateAllAsChoices = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "A signal from nowhere\n\t\tIt lost everything\n\t\tIt will take everything\n\t\tdestroy their gods\n\t\teradicate their will\n\t\tburn their world\n\t\tREND THEIR REALITY"
	},
	Parli9C12 = {
		Id = 110549270921817,
		Name = "Death Beam",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Obliterate all fighters with 1200 or more Power.",
			Ability = {
				Nil = {
					Power = {
						{
							"CreateChoices",
							{ "Parli9C1", "Parli9C2", "Parli9C3", "Parli9C4" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{
							"EVExactValueCheck",
							{ "Red", "RedColor" }
						},
						{
							"EVExactValueCheck",
							{ "Blue", "BlueColor" }
						},
						{
							"EVExactValueCheck",
							{ "Green", "GreenColor" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "YellowColor" }
						}
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	Parli9C22 = {
		Id = 90799837257478,
		Name = "Spear of Percision",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Obliterate all terrains and graveyards.",
			Ability = {
				Nil = {
					Power = {
						{
							"CreateChoices",
							{ "Parli9C1", "Parli9C2", "Parli9C3", "Parli9C4" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{
							"EVExactValueCheck",
							{ "Red", "RedColor" }
						},
						{
							"EVExactValueCheck",
							{ "Blue", "BlueColor" }
						},
						{
							"EVExactValueCheck",
							{ "Green", "GreenColor" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "YellowColor" }
						}
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	Parli9C32 = {
		Id = 105526117721586,
		Name = "Battlebot Blueclaw",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Obliterate all token fighters.",
			Ability = {
				Nil = {
					Power = {
						{
							"CreateChoices",
							{ "Parli9C1", "Parli9C2", "Parli9C3", "Parli9C4" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{
							"EVExactValueCheck",
							{ "Red", "RedColor" }
						},
						{
							"EVExactValueCheck",
							{ "Blue", "BlueColor" }
						},
						{
							"EVExactValueCheck",
							{ "Green", "GreenColor" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "YellowColor" }
						}
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = ""
	},
	fweerobuxyay123 = {
		Id = 115818391816135,
		Name = "fweerobuxyay123",
		Health = 1350,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3, Yellow = 2 },
		Addant = "Super Blip1",
		CustomReminder = {
			["Robux Bundle"] = "A {W} action that is inert in all zones. It gives a target fighter 50 health, and can be used eight times."
		},
		Effect = {
			Name = "Enrage",
			Description = "When you've discarded your 5th card each turn: Give each player a Robux Bundle. Destroy this card.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Opponent" },
						{ "Destroy", 30, "Self" }
					},
					EffectRequirement = { "Playertable", "Me", 5, 6, "DiscardCount" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Does anyone remember those gameshow groups where instead of getting robux you just got a useless rankup in the group that hosted it or is it just me?"
	},
	["Pharaoh LuckyTux"] = {
		Id = 135390450328767,
		Name = "Pharaoh LuckyTux",
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Addant = "Artifact from the Future",
		CustomReminder = {
			["Artifact from the Future"] = "A {W} +200/0 gear, inert in all zones. Whenever this fighter attacks or is attacked: Attach a +0/+0 Flaw to this fighter."
		},
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Give yourself an 'Artifact from the Future'.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant", "Ally" } }
				}
			}
		},
		Bio = "In seeking to recover the secrets of immortality, President LuckyTux accidentally sent himself back in time to the era of the Tycoon Simulator where he now must find a way to come home."
	},
	["Artifact from the Future"] = {
		Id = 127803785019642,
		Name = "Artifact from the Future",
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		EquipGearAnimation = "StaticBurn",
		Color = "Yellow",
		TokenOmni = true,
		Gear = true,
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		CustomReminder = { Flaw = "A Flaw is a 0/0 gear that does nothing." },
		Effect = {
			Name = "Bowling",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks or is attacked: Attach a +0/+0 Flaw to this fighter.",
			Ability = {
				OnAttack = {
					Power = { { "EquipGear", "Flaw", "Self" } },
					Target = "Self",
					MetaData = { AddHealth = 0 }
				},
				OnAttacked = {
					Power = { { "EquipGear", "Flaw", "Self" } },
					Target = "Self",
					MetaData = { AddHealth = 0 }
				}
			}
		},
		Bio = "The fifth annual Bloxy Awards? That’s impossible. LuckyTux hasn’t even been born yet."
	},
	["roros7-Luna"] = {
		Id = 134603848963685,
		Name = "roros7",
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Blue = 1 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: It gains fading.\nWhen this card dies: Draw a card.",
			Ability = {
				OnSummon = {
					Power = { { "GivePassive", "Fading", "Self" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Ideas don't mean anything if you can't use them."
	},
	["Dr. Cattastrophe, Boxed Aberration"] = {
		Id = 133799641123603,
		Name = "Dr. Cattastrophe, Boxed Aberration",
		AltCards = {
			["Stargazing Dr. Cattastrophe"] = {
				Name = "Stargazing Dr. Cattastrophe",
				Id = 97623133766269,
				ArtAnimation = "Stargazing",
				PremiumArt = 839,
				AltArt = true,
				Bio = "\"Sometimes..even the most insane ones have time to ponder and relax.\""
			}
		},
		Health = 1250,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 4, Red = 3, Green = 3 },
		Overload = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card attacks: Select a card from the top 3 of the opponent's deck. Put it on top of there and add {W}{W} to its cost.\nWhenever your opponent casts a card that costs 2 or more {W}: They lose 400 life.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"IncreaseCost",
							{ 2, "Neutral" },
							"CustomZoneTarget"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Variable", "Deck_Opponent", "Nil", true, false }
						},
						{ "DeckAdd", "Variable", "Opponent" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { TopCard = 3 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "A card to put on top with its cost increased"
					}
				},
				OnAnyEnemyCast = {
					Power = { { "Inflict", 400, "Opponent" } },
					Target = "Self",
					NeutralCost = 2
				}
			},
			EffectDeckAddToTop = true
		},
		Bio = ""
	},
	["Careless Camper"] = {
		Id = 108017610587129,
		Name = "Careless Camper",
		Health = 300,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 1 },
		CustomReminder = {
			["Burning Tree"] = "A Red {W}{R}{G} terrain, inert in all zones. When this card is destroyed from play: Deal 200 damage to a target fighter."
		},
		Addant = "DeforesterTree",
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Give yourself a Burning Tree.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "The Deforesters are glad idiots like this exist; whenever anyone questions the oddly-high number of forest fires in the Greenbelt, they can use the tourists as a scapegoat."
	},
	jeannecca = {
		Id = 121702910725610,
		Name = "jeannecca",
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 6 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast or attacks, if there's no other allied fighters: Put two Green Studs into your baseplate. This effect can only trigger once per trigger.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Green Stud", 2 }
					} },
					EffectRequirement = { "Board", "Ally", 0, 2 },
					Target = "Ally",
					TotalTriggerLimit = 1
				},
				OnAttack = {
					Power = { {
						"AddGenZone",
						{ "Green Stud", 2 }
					} },
					EffectRequirement = { "Board", "Ally", 0, 2 },
					Target = "Ally",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Ophelia Earlgrey, Faecologist"] = {
		Id = 122884819802416,
		Name = "Ophelia Earlgrey, Faecologist",
		Health = 1300,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Give yourself a card in the same group as a target fighter.\nOnce each turn, whenever you cast a grouped card: Give yourself a fighter card in its group, except it's a +0/+0 gear that's inert in all zones and has stealth. Remove a {W} from its cost.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" }
						},
						{ "RandomAdd", "Variable", "Ally" }
					},
					Target = "Single"
				},
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" }
						},
						{ "RandomAdd", "Variable Fighter", "Ally" }
					},
					Target = "Aggressor",
					MetaData = {
						Health = 0,
						Power = 0,
						AddHealth = 0,
						AddPower = 0,
						Gear = true,
						Stealth = true,
						TokenOmni = true,
						AddCost = { Neutral = -1 }
					},
					AnyArchetype = true,
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "“The first step to mimicry is observing even the most fantastical creatures!”"
	},
	["Wabbit of Respec"] = {
		Id = 113833256028373,
		Name = "Wabbit of Respec",
		Health = 850,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 4 },
		TriggerInHand = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever you cast an action while this is in your hand: Reveal this card, it gains 150 power.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "RevealCard", 30, "Self" },
						{ "Strengthen", 150 }
					},
					Target = "Self",
					DontTriggerInField = true
				}
			}
		},
		Bio = "respec wabbit"
	},
	aayut = {
		Id = 124353236406830,
		AltCards = {
			["Happy Hoarder"] = {
				Id = 132481277618908,
				Name = "Happy Hoarder",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 819,
				Bio = "There are many like it, but that one is MINE!"
			}
		},
		Name = "aayut",
		Health = 750,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Enrage",
			Description = "Whenever a card leaves your graveyard, if it's the third card that has left your graveyard this turn: Give yourself a copy of it.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "AddCopy" } },
					Target = "Aggressor",
					EffectRequirement = { "Playertable", "Me", 3, 4, "GraveLeaveCount" },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = ""
	},
	["Midnight Shift"] = {
		Id = 128014962991950,
		Name = "Midnight Shift",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Green = 1, Yellow = 1 },
		CustomReminder = {
			["Not A Colour Of The Rainbow"] = "Colourless cards are ignored, because Colourless is not a colour.",
			["Exuberant Blessing"] = "A blessing. The next time you cast a card from here, search your deck for a card with a different colour to it."
		},
		Terrain = true,
		Terrariant = "All Stars",
		Effect = {
			Name = "Enrage",
			Description = "During your endstep: For each two differently coloured cards you cast this turn: You gain a fleeting {W}. Put an exuberant blessing onto a card space in your hand.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColoredStorm", "Nil" }
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", 1, "Ally" },
						{ "TempNeutral", 1, "Ally" },
						{ "AddHandModifier", "ExubBless", "RandomPrioNotBlessedAllyHand" },
						{
							"AlterEV",
							{ "Subtract", "Math", 2, "Nil" }
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"The final fight has begun.\""
	},
	["All Stars"] = {
		Id = 86708763368071,
		Name = "All Stars",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scorch",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		TriggerInGraveZone = true,
		Terrarian = true,
		Overload = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever an allied token fighter dies: This gains 100 health and power. This effect can also trigger in your graveyard.\nWhenever you cast a card, if you've cast 3 or more differently coloured cards this turn: Summon this card from your graveyard, except it's fading.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Self",
					Rarity = "Token"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
						"Self"
					} },
					Target = "Ally",
					MetaData = { Fading = true }
				},
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColoredStorm", "Nil" }
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					DontTriggerInField = true,
					NoBlip = true
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"Will a final prayer last you till dawn?\""
	},
	["Incredibly Obsessed Devils"] = {
		Id = 13521824134,
		Name = "Incredibly Obsessed Devils",
		Health = 350,
		Power = 350,
		Rarity = "Common",
		PlayTest = true,
		LunaTest = true,
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Select a card in your hand. Remove {W} from its cost.",
			Ability = {
				OnSummon = {
					Power = { {
						"IncreaseCost",
						{ -1, "Neutral", "Nil" },
						"CustomZoneTarget"
					} },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "a card in your hand to reduce the cost of",
						MinTargets = 0,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = ""
	},
	["Raging Treant"] = {
		Id = 114711574158032,
		Name = "Raging Treant",
		Health = 500,
		Power = 800,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Red = 3, Green = 3 },
		CustomReminder = {
			["Burning Tree"] = "A Red {W}{R}{G} terrain, inert when discarded. When this card is destroyed from play: Deal 200 damage to a target fighter."
		},
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card is cast or attacks: Swap the stats of a target fighter.\nTwice each turn, whenever this card's stats are swapped: Give yourself a Burning Tree, except its a -100/+100 gear.",
			Ability = {
				OnSwap = {
					Power = {
						{ "Add", "DeforesterTree" },
						{ "RemovePassive", "Terrain", "AddedCard" }
					},
					Target = "Ally",
					TurnTriggerLimit = 2,
					MetaData = { AddHealth = -100, AddPower = 100, Gear = true }
				},
				OnSummon = {
					Power = { { "Swap", 100000 } },
					Target = "Single"
				},
				OnAttack = {
					Power = { { "Swap", 100000 } },
					Target = "Single"
				}
			}
		},
		Bio = "The deforesters were shocked when they learned that not all the trees would let them burn the Greenbelt uncontested."
	},
	["Eyedeeuhs Djinn"] = {
		Id = 124840123232220,
		Name = "Eyedeeuhs Djinn",
		Health = 100,
		Power = 100,
		Rarity = "Common",
		Token = true,
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Select a colour. You lose 3 studs of that colour. If you do, you gain a stud of the other colours.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{
							"EVExactValueCheck",
							{ "Red", "SelectRed" }
						},
						{
							"EVExactValueCheck",
							{ "Blue", "SelectBlue" }
						},
						{
							"EVExactValueCheck",
							{ "Green", "SelectGreen" }
						},
						{
							"EVExactValueCheck",
							{ "Yellow", "SelectYellow" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassSelectRed = {
					Power = { {
						"PaySetCost",
						{
							{ Red = 3 },
							"Red"
						}
					} },
					Target = "Self"
				},
				OnPayCostRed = {
					Power = {
						{ "Yellow", 1 },
						{ "Blue", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				},
				OnEVCheckPassSelectBlue = {
					Power = { {
						"PaySetCost",
						{
							{ Blue = 3 },
							"Blue"
						}
					} },
					Target = "Self"
				},
				OnPayCostBlue = {
					Power = {
						{ "Yellow", 1 },
						{ "Red", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				},
				OnEVCheckPassSelectGreen = {
					Power = { {
						"PaySetCost",
						{
							{ Green = 3 },
							"Green"
						}
					} },
					Target = "Self"
				},
				OnPayCostGreen = {
					Power = {
						{ "Yellow", 1 },
						{ "Red", 1 },
						{ "Blue", 1 }
					},
					Target = "Ally"
				},
				OnEVCheckPassSelectYellow = {
					Power = { {
						"PaySetCost",
						{
							{ Yellow = 3 },
							"Yellow"
						}
					} },
					Target = "Self"
				},
				OnPayCostYellow = {
					Power = {
						{ "Green", 1 },
						{ "Red", 1 },
						{ "Blue", 1 }
					},
					Target = "Ally"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "The term Djinn is used to describe spirits that remain elusive to humans and conceal their presence. Despite this description, they're actually constantly trying to interact with humans...<br/>But I won't let them. Not again.<br/>- Derizias Geradostin"
	},
	SPARESAMEE = {
		Id = 95929789748358,
		Name = "SPARESAMEE",
		Health = 150,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Firebrand",
		Color = "Red",
		Cost = { Green = 1 },
		Effect = {
			Name = "Enrage",
			Description = "When this card dies: Look at the top 3 cards of your deck and destroy 1 of them.",
			Ability = {
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 3 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card to destroy"
					}
				}
			}
		},
		Bio = "<font color=\"#a8323e\">a fickle thing, our motivation is</font><br/><font color=\"#7532a8\">the caterpillar deems its premature form unworthy of metamorphosis</font>"
	},
	["The V in Forevermore"] = {
		Id = 97046470166442,
		Name = "The V in Forevermore",
		AltCards = {
			["Intercepted Signal V"] = {
				Name = "Intercepted Signal V",
				Id = 75643351534544,
				PremiumArt = 841,
				AltArt = true,
				Bio = "\"My loudest transmission to date; I will scream 'thank you' and 'I love you' so loud that even the afterlife vibrates and shudders.\""
			}
		},
		Health = 800,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Ice",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Enrage",
			Description = "Twice during your turns, whenever another fighter dies, if it's not in combat: Give yourself a Green card. A target fighter loses 100 Power.",
			Ability = {
				OnAnyNonCombatDeath = {
					Power = {
						{ "RandomAdd", "MonoOnlyorGreenCost Green", "Ally" },
						{ "Weaken", 100 }
					},
					Target = "Single",
					TurnTriggerLimit = 2,
					OtherCard = true,
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ":vyn_sip:"
	},
	["Classic Wack Bros"] = {
		Id = 106598407892421,
		Name = "Classic Wack Bros",
		Health = 700,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		EffectVariable = 0,
		Cost = { Neutral = 1, Red = 2, Blue = 2 },
		Effect = {
			Name = "Enrage",
			Description = "Once each turn, whenever you cast a Gear or Terrain: Give yourself a copy of it, except it's a +0/+0 Gear if it was a Terrain, or a Terrain if it was a Gear.",
			Ability = {
				OnAllyCastGear = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "CastCard" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 0, "CastGear" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassCastGear = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndex", "CastCard" },
							"Self"
						},
						{ "Add", "Variable", "Ally" },
						{ "RemovePassive", "Gear", "AddedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						}
					},
					Target = "Aggressor",
					MetaData = { Terrain = true }
				},
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "CastCard" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 0, "CastTerrain" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassCastTerrain = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndex", "CastCard" },
							"Self"
						},
						{ "Add", "Variable", "Ally" },
						{ "RemovePassive", "Terrain", "AddedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						}
					},
					Target = "Aggressor",
					MetaData = { Gear = true }
				},
				OnAnyTrigger = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 0, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true,
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "<font color=\"#de2336\">\"So what exactly is our plan here?\"</font><br/><font color=\"#234cde\">\"I was just gonna like eat grass and press buttons till we won\"\"</font><br/><font color=\"#de2336\">\"Sorry what?\"\"</font>"
	},
	["As The World Ends"] = {
		Id = 136759807298015,
		Name = "As The World Ends",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		EffectAnimation = "SubspaceTripmine",
		CustomReminder = {
			["Final Echoes of Love"] = "An inert in all zones card that puts itself into your baseplate when drawn. You lose 200 additional life when drawing from an empty deck while its in your baseplate."
		},
		Color = "Green",
		Cost = { Neutral = 4, Green = 4 },
		Effect = {
			Name = "Enrage",
			Description = "Shuffle 5 'Final Echoes of Love' into your opponent's deck. A target fighter loses 700 Power, then attach 3 Dreamshields to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "Final Echoes of Love" },
						{ "DeckAdd", "Final Echoes of Love" },
						{ "DeckAdd", "Final Echoes of Love" },
						{ "DeckAdd", "Final Echoes of Love" },
						{ "DeckAdd", "Final Echoes of Love" },
						{ "Weaken", 700, "Single" },
						{ "EquipGear", "Imaginary Token", "Single" },
						{ "EquipGear", "Imaginary Token", "Single" },
						{ "EquipGear", "Imaginary Token", "Single" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "\"[...]Then I will start my most powerful transmission to date. I will scream \"thank you\" and \"I love you\" so loud that all of the people in the radius of 3,000 kilometers will feel it in their hearts, and bones, and muscles.\""
	},
	["Final Echoes of Love"] = {
		Id = 139623105898839,
		Name = "Final Echoes of Love",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenOmni = true,
		TriggerInGenZone = true,
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Enrage",
			Description = "When this card enters your hand: Put it into your baseplate and each allied fighter with the highest Power loses 300 power. Draw two cards, except they're decaying.\nWhile this card is in your baseplate, Whenever you would draw a card while your deck is empty: you lose 200 life.",
			Ability = {
				OnDrawn = {
					Power = {
						{ "RevealCard", 30, "Self" },
						{ "Weaken", 300, "AllyHighestPower" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GenZone_Ally", false, false },
							"Self"
						},
						{ "Draw", 1, "Ally" },
						{ "GivePassive", "Decaying", "DrawnCard" },
						{ "Draw", 1, "Ally" },
						{ "GivePassive", "Decaying", "DrawnCard" }
					},
					Target = "Self"
				},
				OnAllyFatigue = {
					Power = { { "Cost", 200, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "The echo of the universe's last act resonates past the Cataclysm; the Brick formed of a soldier is warped into something compassionate"
	},
	["evil feline"] = {
		Id = 84521711379864,
		Name = "evil feline",
		AltCards = {
			Xen = {
				Id = 118599046125593,
				Name = "Xen",
				Summonant = "Ephemeral Dream",
				Addant = "Xen",
				AttackEffect = "Flare",
				AltArt = true,
				PremiumArt = 498,
				Effect = {
					Name = "Enrage",
					Description = "Whenever this card is cast or attacks and destroys another, attach a +100/0 Ephemeral Dream to this fighter, then all allied gears gain a +50/+50 stat bonus",
					Ability = {
						OnAttackDestroy = {
							Power = {
								{ "EquipGear", "Ephemeral Dream", "Self" },
								{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
								{ "TargetAddHealthBonus", 50, "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "EquippedGears"
							}
						},
						OnSummon = {
							Power = {
								{ "EquipGear", "Ephemeral Dream", "Self" },
								{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
								{ "TargetAddHealthBonus", 50, "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "EquippedGears"
							}
						}
					}
				},
				Bio = "Burn it all down till it doesn’t hurt."
			},
			["Intimidating Feline"] = {
				Id = 72989407405025,
				AltArt = true,
				Commissioner = { "Deedge119" },
				PremiumArt = 870,
				AttackEffect = "Slash",
				Name = "Intimidating Feline",
				Effect = {
					Name = "Enrage",
					Description = "Whenever this card is cast or attacks and destroys another, attach a +100/0 Familiar to this fighter, then all allied gears gain a +50/+50 stat bonus",
					Ability = {
						OnAttackDestroy = {
							Power = {
								{ "EquipGear", "Familiar-I", "Self" },
								{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
								{ "TargetAddHealthBonus", 50, "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "EquippedGears"
							}
						},
						OnSummon = {
							Power = {
								{ "EquipGear", "Familiar-I", "Self" },
								{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
								{ "TargetAddHealthBonus", 50, "CustomTarget" }
							},
							Target = "Self",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "EquippedGears"
							}
						}
					}
				},
				Bio = "this cat is red for an amazing reason"
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "British",
		CustomReminder = { Familiar = "A fading colourless gear that does nothing" },
		Color = "Green",
		Cost = { Neutral = 1, Green = 6 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card is cast or attacks and destroys another, attach a +100/0 Familiar to this fighter, then all allied gears gain a +50/+50 stat bonus",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "EquipGear", "Familiar", "Self" },
						{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
						{ "TargetAddHealthBonus", 50, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "EquippedGears"
					}
				},
				OnSummon = {
					Power = {
						{ "EquipGear", "Familiar", "Self" },
						{ "TargetAddStrengthenBonus", 50, "CustomTarget" },
						{ "TargetAddHealthBonus", 50, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "EquippedGears"
					}
				}
			}
		},
		Bio = "Are you sure you want me to die?"
	},
	Familiar = {
		Id = 115361655311160,
		Name = "Familiar",
		AltCards = {
			["Ephemeral Dream"] = {
				Id = 75070357577985,
				Name = "Ephemeral Dream",
				AttackEffect = "British",
				Bio = "Humans grow a tree within their minds. A tree known as the self. It's a tree that is nourished through wisdom and experience, emotion and love. Each person has their own variety and type of tree. What kind of flowers will it grow? What kind of fruit will it bear? Who will it fascinate, what will it yield, how will it keep the pests away? What kind of poison will it possess? How tall will it grow?"
			},
			["Familiar-I"] = {
				Id = 109220705045303,
				Name = "i just found this new gear please don't steal",
				AttackEffect = "British",
				Bio = "glup"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 0,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "British",
		Color = "Neutral",
		Cost = { Green = 1 },
		Gear = true,
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Enrage",
			Description = "Attach to a target fighter.",
			Ability = {
				Null = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					EffectRequirement = { "SelfGear", "Self", 3, 9999, "HasGear" }
				}
			}
		},
		Bio = "They lurk inside"
	},
	DreamburnTestCardPlsWork = {
		Id = 13835418453,
		Name = "DreamburnTestCardPlsWork",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		PlayTest = true,
		AttackEffect = "Superball",
		CustomReminder = {
			["Honk mimimimi"] = "I saw this in a dream and wanted to code it in to see if it was good."
		},
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast or dies, if you control 2 or more non yellow fighters, a target fighter loses 300 power",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 300 } },
					Target = "Single",
					EffectRequirement = { "NotColor", "Ally", 2, 999, "Yellow" }
				},
				OnDeath = {
					Power = { { "Weaken", 300 } },
					Target = "Single",
					EffectRequirement = { "NotColor", "Ally", 2, 999, "Yellow" }
				}
			}
		},
		Bio = "Honk mimimimi Honk mimimimimi"
	},
	["Splixent, the Evolved Drakobloxxer"] = {
		Id = 88801185953927,
		Name = "Splixent, the Evolved Drakobloxxer",
		Health = 1000,
		Power = 800,
		Rarity = "Legendary",
		Overload = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 2, Red = 7 },
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card attacks: You may destroy a Drakobloxxer in your baseplate. If you do, deal 200 overloaded damage to all enemy fighters and this card gains 500 power until your next end step.",
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
							{ "Set", "Math", 1, "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = { Archetype = "Drakobloxxer" },
						SelectionDescription = "a drakobloxxer card in your baseplate to destroy",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "DamageOverloaded", 200, "Opponent" },
						{ "TempStrengthen", 500, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "He <font color=\"#f2210a\">ate</font> them."
	},
	["Splixent's Blight"] = {
		Id = 92569058829665,
		Name = "Splixent's Blight",
		Health = 1200,
		Power = 200,
		Rarity = "Uncommon",
		Overload = true,
		PlayTest = true,
		LunaTest = true,
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		Effect = {
			Name = "Enrage",
			Description = "During your opponent's end step, if they've spent 25 or more seconds on their turn: This card gains 800 power until your next end step.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "TurnTimeSpent", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 24 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "TempStrengthen", 800, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "Please, hesitate."
	},
	["The Forgotten Child"] = {
		Id = 72127337348875,
		Name = "The Forgotten Child",
		Health = 500,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Enrage",
			Description = "When this card dies: You gain 300 life. Select a Bird card to shuffle into your deck.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Cost", -300, "Ally" },
						{
							"CreateChoices",
							{
								"Crow of Eternal Torment",
								"Bird of Eternal Paradise",
								"Parrot of Eternal Dominion",
								"Eternal Tweety"
							}
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "DeckAdd", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "There is light and beauty, even in the darkest of worlds."
	},
	["The Uber Deluxe Chimecat0"] = {
		Id = 115310832288083,
		Name = "The Über Deluxe Chimecat0",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Terrain = true,
		AttackEffect = "MagicYellow",
		ReplaceDescriptionant = "Variable Charges.\nDuring your endstep: This gains a charge. Then apply the following effects based on charges:\n5 - All fighters lose 50 power.\n10 - Summon Chimecat0, a 50/0 Defender.\n20 - Ban your opponent.",
		Color = "Blue",
		Summonant = "Chimecat0",
		Terrariant = "Killjque",
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Cost = { Neutral = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Enrage",
			Description = "During your endstep: Apply the following effects based on if the current ply is equal or greater:\n10 - All fighters lose 50 power.\n20 - Summon Chimecat0, a 50/0 Defender.\n50 - Ban your opponent.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "Plys", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 8, "Depower" }
						},
						{
							"EVGreaterValueCheck",
							{ 18, "Summon" }
						},
						{
							"EVGreaterValueCheck",
							{ 48, "Dumb" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassDepower = {
					Power = { { "Weaken", 50 } },
					Target = "All"
				},
				OnEVCheckPassSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnEVCheckPassDumb = {
					Power = { { "SetLife", 0 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "\"You poor thing,<br/>\nSweet, mourning lamb,<br/>\nThere’s nothing you can do,<br/>\nIt’s already been done.\""
	},
	Chimecat0 = {
		Id = 128865335300950,
		Name = "Chimecat0",
		Health = 50,
		Power = 0,
		Rarity = "Token",
		Shield = true,
		Token = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Summonant = "Chimecat0",
		Terrariant = "Killjque",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Enrage",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 4, "Depower" }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "“Devour like sweet bovine hide, How funny, I never considered myself tough.”"
	},
	Killjque = {
		Id = 78151127108934,
		Name = "Killjque",
		Health = 1250,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		Shield = true,
		Effect = {
			Name = "Enrage",
			Description = "When this card is animated: Select a card from the top 15 cards of your deck. Search that card, then shuffle your deck.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "ShuffleDeck", 30, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 15 },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to search from your deck"
					}
				}
			}
		},
		Bio = ""
	},
	["NTPinheiro: Sound of a Star"] = {
		Id = 98363681197992,
		AltCards = {
			["Ego Renegade SashaTilde"] = {
				Id = 133642422757478,
				PremiumArt = 830,
				Effect = {
					Name = "Enrage",
					Description = "Whenever this card is cast or attacks: destroy the top card of your opponent's deck and replace it with a 500/500 Martyr.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"MoveZone",
									{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
									"Self"
								},
								{ "DeckAdd", "Maytr-Ego", "Opponent" }
							},
							Target = "Self"
						},
						OnAttack = {
							Power = {
								{
									"MoveZone",
									{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
									"Self"
								},
								{ "DeckAdd", "Maytr-Ego", "Opponent" }
							},
							Target = "Self"
						}
					},
					EffectDeckAddToTop = true
				},
				Name = "Ego Renegade SashaTilde",
				AttackEffect = "Jab",
				Bio = "\"It's wrong, it's right, and god, I'm so alive<br/>So leave him behind, it's an eye for an eye!\""
			}
		},
		Name = "NTPinheiro: Sound of a Star",
		Health = 1500,
		Power = 500,
		Rarity = "Legendary",
		Overload = true,
		SummonAnimation = "SummonNibblex",
		AttackEffect = "Gravity",
		CustomReminder = {
			Martyr = "A {W}{W} 500/500 fighter. NTPinheiro gains 500 power when this card enters a graveyard."
		},
		Color = "Blue",
		Cost = { Red = 4, Green = 4, Blue = 4 },
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card is cast or attacks: destroy the top card of your opponent's deck and replace it with a 500/500 Martyr.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{ "DeckAdd", "Martyr", "Opponent" }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{ "DeckAdd", "Martyr", "Opponent" }
					},
					Target = "Self"
				}
			},
			EffectDeckAddToTop = true
		},
		Bio = "\"Worry not. You're simply going back to where you belong.\""
	},
	Martyr = {
		Id = 130093658807916,
		AltCards = {
			["Maytr-Ego"] = {
				Id = 138120028808414,
				Name = "Servaleon: Shattered Mirror",
				AttackEffect = "Jab",
				Bio = "\"It'd all be so simple, oh if only i weren't there!\""
			}
		},
		Name = "Martyr",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Fleeting = true,
		TokenDiscard = true,
		Marked = true,
		TriggerInGraveZone = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Enrage",
			Description = "When this card enters a graveyard: All 'NTPinheiro: Sound of a Star' gain 500 power.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Strengthen", 500, "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Field", "Ally_Field" },
						Condition = "MatchesCardIndex",
						Modifier = { MatchesCardIndex = "NTPinheiro: Sound of a Star" }
					},
					TotalTriggerLimit = 1,
					DontTriggerInField = true
				}
			}
		},
		Bio = "Let us meet again as stars."
	},
	["Pixie, Lost in Time"] = {
		Id = 96480077179183,
		Name = "Pixie, Lost in Time",
		Health = 1000,
		Power = 300,
		Rarity = "Common",
		TargetImmune = true,
		AttackEffect = "MagicBlue",
		CustomReminder = {
			Zeitgeist = "A 300/300 fighter. Its effect is based on what pack the card is in."
		},
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 4 },
		EffectAnimation = "ChronologicalLeak",
		Effect = {
			Name = "Enrage",
			Description = "Once each turn, whenever an effect would target this card: Summon that effect's zeitgeist, except it's 300/300.",
			Ability = {
				OnTarget = {
					Power = { { "SummonZeitgeist", "Ally", "Aggressor" } },
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { Health = 300, Power = 300 }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Temporal travellers traversing timelines tend to tear the timespace Tellurian. To tell the truth, the twisted tempo tempts the Technician true, the threat testing the thoughtless trespasser.\""
	},
	["Photographers at Dawn"] = {
		Id = 107015996055529,
		Name = "Photographers at Dawn",
		Health = 550,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "Microphone",
		EffectAnimation = "CameraSelf",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Yellow = 1, Blue = 2 },
		CustomReminder = {
			Regeneration = "A regenerating fighter gains 100 Health during its end step."
		},
		Effect = {
			Name = "Enrage",
			Description = "Once each turn, whenever an effect gives you a card: Select a colour. Give yourself 2 studs of that colour and a Regenerating Mod.",
			Ability = {
				OnAllyPut = {
					Power = {
						{
							"CreateChoices",
							{ "Blue Stud", "Red Stud", "Green Stud", "Yellow Stud" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"TargetChoiceZone"
						},
						{ "Variable", 2, "Ally" },
						{ "Add", "Regenerating Mod", "Ally" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "“Some moments in life are fleeting. Other moments deserve to be preserved forever.”<br/>\"Yet, can we capture freedom? What do you think our efforts really mean…?\""
	},
	["Ying, The Everlasting"] = {
		Id = 133927046609502,
		Name = "Ying, The Everlasting",
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Select any number of Terrain cards in your baseplate and return them to your hand. Remove 1 {W}{R}{B}{G}{Y} from their cost; This can't remove the last of each stud.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "CapCost", 1 },
							"CustomZoneTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Red", "CapCost", 1 },
							"CustomZoneTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "CapCost", 1 },
							"CustomZoneTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Green", "CapCost", 1 },
							"CustomZoneTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Neutral", "CapCost", 1 },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = { Terrain = true },
						MinTargets = 0,
						MaxTargets = 999,
						SelectionDescription = "any number of terrains"
					}
				}
			}
		},
		Bio = "She went down in an airplane\nFried getting suntan\nFell in a cement mixer full of quicksand \nHelp me, help me, I'm no good at goodbyes,\nand twelves ways to say you died"
	},
	Mushlord = {
		Id = 140561252884533,
		AltCards = {
			Pink = {
				Id = 91909983386863,
				Name = "Pink",
				AttackEffect = "TimeBomb",
				AltArt = true,
				PremiumArt = 822,
				Effect = {
					Name = "Enrage",
					Description = "When this card is cast: Put a ‘Ghost’ into your baseplate.",
					Ability = {
						OnSummon = {
							Power = { {
								"AddGenZone",
								{ "Ghost", 1 },
								"Ally"
							} },
							Target = "Self"
						}
					}
				},
				Bio = "AN ANIMATED CATGIRL!!!"
			}
		},
		Name = "Mushlord",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		CustomReminder = {
			Norrox = "A 650/650 fighter, inert in all zones. It summons a copy of itself if you have 6 or more colourless fighters in your graveyard."
		},
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Enrage",
			Description = "When this card is cast: Put a ‘Norrox’ into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Norrox", 1 },
						"Ally"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Just a regular Roblox player that enjoys its History"
	},
	Norrox = {
		Id = 140000664194381,
		AltCards = {
			Ghost = {
				Id = 95821605137483,
				Name = "Ghost",
				Summonant = "Ghost",
				Effect = {
					Name = "Enrage",
					Description = "Once during your endstep, if you have 6 or more colourless fighters in your graveyard while this is in your baseplate: Summon a copy of this card.",
					Ability = {
						OnEnd = {
							Power = { { "Summon", "Summonant", "Ally" } },
							Target = "Self",
							TotalTriggerLimit = 1,
							DontTriggerInField = true,
							EffectRequirement = { "Board", "AllyGraveZone", 6, 9999, "Colorless_Fighters" }
						}
					}
				},
				AttackEffect = "TimeBomb",
				AltArt = true,
				Bio = "A ghost in a magical girl's body."
			}
		},
		Name = "Norrox",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		TokenOmni = true,
		TriggerInGenZone = true,
		Summonant = "Norrox",
		Effect = {
			Name = "Enrage",
			Description = "Once during your endstep, if you have 6 or more colourless fighters in your graveyard while this is in your baseplate: Summon a copy of this card.",
			Ability = {
				OnEnd = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self",
					TotalTriggerLimit = 1,
					DontTriggerInField = true,
					EffectRequirement = { "Board", "AllyGraveZone", 6, 9999, "Colorless_Fighters" }
				}
			}
		},
		Bio = "\"Boo! A Monowhite board!\""
	},
	["Katsu’s Dimension"] = {
		Id = 132024580482670,
		Name = "Katsu’s Dimension",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Terrain = true,
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Addant = "Moonleak",
		Terrariant = "Raiden Striker",
		Cost = { Neutral = 2, Blue = 2, Green = 3 },
		CustomReminderMoonleak = true,
		ModifierScintillant = true,
		Effect = {
			Name = "Enrage",
			Description = "Once each turn, whenever you cast an action: Put a Scintillant Blessing onto a card space in your hand. Give yourself a Moonleak.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AddHandModifier",
							"ScintillantBless",
							"RandomPrioNotBlessedAllyHand"
						},
						{ "Add", "Addant", "Ally" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The best things come in twos."
	},
	["Raiden Striker"] = {
		Id = 134502843407378,
		Name = "Raiden Striker",
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		ModifierScintillant = true,
		CustomReminderRecur = true,
		CustomReminder = {
			["Fleeting & Fading"] = "The action is obliterated if it's discarded or cast."
		},
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card is animated or attacks: Put a Scintillant Blessing onto a card space in your hand. Recur an allied action, except it's fleeting and fading.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"AddHandModifier",
							"ScintillantBless",
							"RandomPrioNotBlessedAllyHand"
						},
						{
							"MoveZone",
							{ "Action", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					MetaData_MoveZone = { Fading = true, Fleeting = true }
				},
				OnAttack = {
					Power = {
						{
							"AddHandModifier",
							"ScintillantBless",
							"RandomPrioNotBlessedAllyHand"
						},
						{
							"MoveZone",
							{ "Action", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					MetaData_MoveZone = { Fading = true, Fleeting = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	["Frosted Skittles"] = {
		Id = 86216029702513,
		Name = "Frosted Skittles",
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "ModernRocket",
		Color = "Neutral",
		Cost = { Neutral = 7, Yellow = 1 },
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card is cast or attacks: Each player summons a random fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomSummon", "Fighter" },
						{ "RandomSummon", "Fighter", "Opponent" }
					},
					Target = "Ally"
				},
				OnAttack = {
					Power = {
						{ "RandomSummon", "Fighter" },
						{ "RandomSummon", "Fighter", "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Ebob-kun... Where are you?"
	},
	["Brixzee! and Uranium (Ft. Red Brixzee!)"] = {
		Id = 96461638525643,
		Name = "Brixzee! and Uranium (Ft. Red Brixzee!)",
		AltCards = {
			LeepyV2 = {
				Name = "Leepy B.",
				Id = 127953187229830,
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Keep yourself safe."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "VampBite",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Enrage",
			Description = "Whenever you discard a card: Add {B} to this card's cost.\nWhen this card dies: Search your deck for a fighter with the same total stud cost, except it’s inert when discarded. If this card costs 6 or more total studs, that card gains 200 Health and Power.",
			Ability = {
				OnAllyDiscard = {
					Power = { {
						"IncreaseCost",
						{ 1, "Blue" },
						"Self"
					} },
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"Self"
						},
						{ "RandomTutorfor", "VariableorExactCost Fighter", "Ally" },
						{
							"AlterEV",
							{ "Gate", "Math", 5, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 200, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "AlliedAddedCard" },
						{
							"Strengthen",
							"Variable",
							"AlliedAddedCard",
							nil,
							nil,
							nil,
							"CameraSelf"
						}
					},
					Target = "Ally",
					MetaData = { TokenDiscard = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "<font color=\"#debc23\">“this is the most information we have on the anomaly”</font><br/><font color=\"#2368de\">“yo she looks tuffff”</font><br/><font color=\"#debc23\">“Tuffff”</font>"
	},
	["The Tenderizer"] = {
		Id = 96354087510741,
		Name = "The Tenderizer",
		Health = 0,
		Power = 0,
		AddHealth = 600,
		AddPower = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Gear = true,
		Effect = {
			Name = "Enrage",
			Description = "Attach to a target fighter.\nAfter this fighters attacks another: Attach fragile to that fighter.",
			Ability = {
				OnAttackEnd = {
					Power = { { "EquipGear", "Fragile Mod", "Aggressor" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Ah, their flesh is quite strong! Needs another swing!\" - Nelta, Sanguine Cleric"
	},
	["secretreviewer brick behemoth"] = {
		Id = 113786655762220,
		Name = "secret_reviewer, brick behemoth",
		Health = 3000,
		Power = 3000,
		Rarity = "Epic",
		AttackEffect = "BrickThrow",
		Color = "Blue",
		Cost = { Blue = 15 },
		Dextrous = true,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "\"y'know those cartoon bumps after the get hit by something blunt? thats how high your hospital bill's gonna be.\""
	},
	ChanceMissLuna = {
		Id = 6849215844,
		Name = "ChanceMissLuna",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Green = 2 },
		LunaTest = true,
		PlayTest = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: It has a chance to miss.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 100 }
						},
						{
							"EVGreaterValueCheck",
							{ 66, "CounterPass" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassCounterPass = {
					Power = { { "TempWeaken", 9000000 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Alright! Leave this to me!\""
	},
	["Vyn, the End of The Nightmare"] = {
		Id = 92582270312552,
		Name = "Vyn, the End of The Nightmare",
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4, Yellow = 1 },
		CustomReminder = {
			["Rayburn, the Wolf who Lost Everything"] = "A 300/300 Yellow fighter, inert in baseplate. It summons itself from there at the start of your turns, and gains 150 health and power whenever a card leaves your baseplate."
		},
		AddGenZoneant = "Rayburn, the Wolf who Lost Everything",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Put 'Rayburn, the Wolf who Lost Everything' into your baseplate.\nWhenever this card finishes attacking: Put another target allied fighter into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "AddGenZoneant", 1 },
						"Ally"
					} },
					Target = "Self"
				},
				OnAttackEnd = {
					Power = { { "MoveGenZone" } },
					Target = "SingleAlly",
					TargetSubModifier = "CustomModAlly OtherCard",
					TargetSubModifierDescription = "a different allied fighter"
				}
			}
		},
		Bio = "\"y'know it's surprisingly hard to represent myself when i take away all the things that represent me\""
	},
	["Rayburn, the Wolf who Lost Everything"] = {
		Id = 104103076754663,
		Name = "Rayburn, the Wolf who Lost Everything",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Bite",
		Color = "Yellow",
		Cost = { Green = 1, Yellow = 4 },
		TriggerInGenZone = true,
		Terrified = true,
		TokenGenZone = true,
		Effect = {
			Name = "WWW",
			Description = "At the start of your turns: Summon this card from your baseplate and unlock it.\nOnce each turn, whenever a card leaves your baseplate: This gains 150 Health and Power",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{ "Unlock", 999 }
					},
					Target = "Self"
				},
				OnAllyGenZoneRemove = {
					Power = {
						{ "Heal", "150", "Self" },
						{ "Strengthen", "150", "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "I lost everything so I’m a sigma now *bares green and yellow fangs* :wolf:"
	},
	Ducc = {
		Id = 85477472648895,
		Name = "Ducc",
		AltCards = {
			Ducc2 = {
				TokenOmni = true,
				Effect = {
					Name = "wukdyganafkajdglkj",
					Description = "Whenever your opponent gains life: This card gains 200 power.",
					Ability = {
						OnEnemyLifeGain = {
							Power = { { "Strengthen", 200 } },
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Addant = "Ducc2",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Give yourself a copy of it without this effect that's inert in all zones.\nWhenever your opponent gains life: This card gains 200 power.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnEnemyLifeGain = {
					Power = { { "Strengthen", 200 } },
					Target = "Self"
				}
			}
		},
		Bio = "Don't tell anyone but I enjoy eating dirt"
	},
	thePipFlip = {
		Id = 125223397626769,
		Name = "thePipFlip",
		Health = 900,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 4, Red = 4 },
		Token = true,
		Summonant = "SpiritofthePipFlip",
		CustomReminder = {
			["Spirit of thePipFlip"] = "A 100/0 Red fighter. thePipFlip takes damage in its place and it gains health and power whenever thePipFlip takes damage."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Summon a Spirit of thePipFlip.\nAt the start of your turns: Another target allied fighter gains 250 Power.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = { { "Strengthen", 250 } },
					Target = "SingleAlly",
					TargetSubModifier = "CustomModAlly OtherCard",
					TargetSubModifierDescription = "a different allied fighter"
				},
				OnDamagedAlways = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "LastDamageTaken", "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "CustomTarget" },
						{ "Strengthen", "Variable", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "MatchesCardIndex",
						Modifier = { MatchesCardIndex = "SpiritofthePipFlip" }
					}
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "meow, you're awesome!"
	},
	SpiritofthePipFlip = {
		Id = 77633178510484,
		Name = "Spirit of thePipFlip",
		Health = 100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "TimeBomb",
		Color = "Red",
		Cost = { Red = 1 },
		Summonant = "SpiritofthePipFlip",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "If this would take damage from combat or effects while thePipFlip is in play, this card recieves it instead.\nWhenever thePipFlip takes damage from combat or effects: This gains health and power equal to the amount of damage taken.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "MatchesCardIndex",
						Modifier = { MatchesCardIndex = "thePipFlip" }
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "GivePassive", "IgnoreDamage" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "RemovePassive", "IgnoreDamage" } },
					Target = "Self",
					NoBlip = true
				},
				OnDamagedAlways = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "LastDamageTaken", "Nil" },
							"Self"
						},
						{ "Damage", "Variable", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "MatchesCardIndex",
						Modifier = { MatchesCardIndex = "thePipFlip" }
					}
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "meow, YOU WILL DIE BY MY HAND."
	},
	["Lemonade Glass, Card Sage"] = {
		Id = 13532893896,
		Name = "Lemonade Glass, Card Sage",
		Health = 900,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3, Red = 6 },
		LunaTest = true,
		PlayTest = true,
		Charge = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks and destroys another: You lose 500 life and draw a card. Destroy that card unless it costs 3 or more {W}.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Cost", 500, "Ally" },
						{ "Draw", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost", "Nil" },
							"DrawnCard"
						},
						{
							"EVGreaterValueCheck",
							{ 2, "ColourlessCostReached" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckFailColourlessCostReached = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
						"DrawnCard"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["thespagetguy, The One Who Left it All Behind"] = {
		Id = 93668789781184,
		Name = "thespagetguy, The One Who Left it All Behind",
		Health = 900,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "XhartyrSlash",
		Color = "Neutral",
		Cost = { Neutral = 6, Blue = 2 },
		Rank = 4,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this fighter attacks another: Destroy all gears attached to that fighter and reset its gained stats.\nWhenever this fighter attacks and destroys another: Reset its lost stats.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Reset", "GainedStatsOnly" },
						{ "DestroyGear", "All" }
					},
					Target = "Aggressor"
				},
				OnAttackDestroy = {
					Power = {
						{ "BumpHealth", 900 },
						{ "BumpPower", 600 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "thespagetguy, the infamous assassin, was hired by Astarossa to assassinate Fl00fy_Bonez, whose influence threatened the CRP's interests. With his overwhelming physical prowess and complete lack of stud energy, thespagetguy accepted the contract without hesitation—though his true motives remain unclear.'"
	},
	["Greenbelt Restored"] = {
		Id = 83210235083922,
		Name = "Greenbelt Restored",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Red = 2, Green = 2 },
		LunaTest = true,
		PlayTest = true,
		Terrain = true,
		TriggerInGraveZone = true,
		Terrariant = "Reduced to Folklore",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Recur two allied terrain cards.\nDuring your end step, if this card is in your graveyard, was cast and you've cast 3 or more terrains this turn: Deal 300 damage to all fighters. Recur this card, except its Fading.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Terrain", "GraveZone", "Hand", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Terrain", "GraveZone", "Hand", true, false },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "WasPlayed" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "WasPlayed" },
							"Self"
						}
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 9999, "Terrains" },
					DontTriggerInField = true
				},
				OnEVCheckPassWasPlayed = {
					Power = {
						{ "Damage", 300, "All" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					DontTriggerInField = true,
					MetaData = { Fading = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	["Reduced to Folklore"] = {
		Id = 15892613541,
		Name = "Reduced to Folklore",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		PlayTest = true,
		LunaTest = true,
		Terrarian = true,
		CustomReminderDebt = true,
		Effect = {
			Name = "Enrage",
			Description = "Whenever this card attacks: Remove {W}{R}{G} from all terrains in your graveyard and hand.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone", "Ally_Hand" },
						Condition = "Terrain"
					}
				}
			}
		},
		Bio = ""
	},
	["Wishful Studseekers"] = {
		Id = 75582382535894,
		Name = "Wishful Studseekers",
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "StudBlast",
		Color = "Green",
		Cost = { Red = 4, Green = 2 },
		Rank = 6,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Twice each turn, whenever you cast a ranked card: You gain {W}{R}{G}.\nWhen this card dies: Search your deck for a ranked card.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{ "Neutral", 1, "Ally" },
						{ "Red", 1, "Ally" },
						{ "Green", 1, "Ally" }
					},
					Target = "Aggressor",
					Ranked = true,
					TurnTriggerLimit = 2
				},
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "Ranked", "Deck_Ally", "Hand_Ally", true, false, 1 },
						"Self"
					} },
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"Look! There's a falling cosmic stud! Make a wish.\"<br/>\"I think that only works with stars. Still, wouldn't hurt to try.\""
	},
	["Jak and Snowman"] = {
		Id = 101793274239869,
		Name = "Jak and Snowman",
		Health = 600,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Flare",
		Color = "Blue",
		SummonAnimation = "PoliceCar",
		Cost = { Neutral = 1, Red = 1, Blue = 3 },
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Once each turn, whenever a gear is attached to this, if it's a fighter: Summon a copy of this fighter without this effect that's inert in play. Attach a copy of all gears on this card to it, then reset its stats.",
			Ability = {
				OnEquipGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Fighter" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "IsFighter" }
						}
					},
					Target = "Self",
					NoBlip = true,
					NoGearTargetMod = true
				},
				OnEVCheckPassIsFighter = {
					Power = {
						{ "SummonCopy", 30, "Self", nil, nil, "Motorcycle" },
						{ "ReplaceEffect", "Pet1", "SummonedCard" },
						{
							"MoveGear",
							{ "Self", "All", false, true },
							"SummonedCard"
						},
						{ "Reset", 30, "SummonedCard" }
					},
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData_SummonCopy = { Token = true }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"Want to race through the domains? Jak_NotZak and Simple_Snowman have gathered every editor for THE Doomspire racetrack! Buy Super Dekkart, now available on the Biggstendo Switch, Biggsbox, and Biggstation ports!<br/>Units and consoles sold separately. Available for a limited time only.\"\""
	},
	["Leepy and TragedyV1"] = {
		Id = 16631525603,
		Name = "Leepy and Tragedy-V1",
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3 },
		LunaTest = true,
		PlayTest = true,
		Decaying = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever you cast a card: Search your deck for a card of a different card type, except it's inert when discarded. This triggers once each card type each turn.",
			Ability = {
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{ "NotAction", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { TokenDiscard = true }
				},
				OnAllySummon = {
					Power = { {
						"MoveZone",
						{ "NotFighter", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { TokenDiscard = true }
				},
				OnAllyTerrainCast = {
					Power = { {
						"MoveZone",
						{ "NotTerrain", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { TokenDiscard = true }
				},
				OnAllyCastGear = {
					Power = { {
						"MoveZone",
						{ "NotGear", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = ""
	},
	["Leepy and TragedyV2"] = {
		Id = 16631525603,
		Name = "Leepy and Tragedy-V2",
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		LunaTest = true,
		PlayTest = true,
		Rank = 6,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever you cast a non-token, non-fighter card: Search your deck for a card of a different card type, except it's inert when discarded.",
			Ability = {
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{ "NotAction", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					NotRarity = "Token",
					MetaData = { TokenDiscard = true }
				},
				OnAllyTerrainCast = {
					Power = { {
						"MoveZone",
						{ "NotTerrain", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					NotRarity = "Token",
					MetaData = { TokenDiscard = true }
				},
				OnAllyCastGear = {
					Power = { {
						"MoveZone",
						{ "NotGear", "Deck_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					NotRarity = "Token",
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = ""
	},
	["Agnarolam - The Essence Jester"] = {
		Id = 119548061258386,
		Name = "Agnarolam - The Essence Jester",
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "StudBlast",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		TokenOmni = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast: Put a stud of a random colour into your baseplate.\nDuring your end step, if you've discarded 2 or more cards this turn: Return this card to your hand. Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnSummon = {
					Power = { {
						"RandomAddGenZone",
						{
							{ "Red Stud", "Green Stud", "Yellow Stud", "Blue Stud" },
							1
						},
						"Ally"
					} },
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{ "Return" },
						{ "Add", "Addant" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 2, 9999, "DiscardCount" },
					MetaData_Add = { Fleeting = true }
				}
			}
		},
		Bio = "The newest and ditziest member of the Inverse Parade, Agnarolam is an integral part of her clan even when she's not serious!"
	},
	["Guren the Starslicer"] = {
		Id = 109372336799150,
		Name = "Guren the Starslicer",
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 1, Blue = 1, Yellow = 1, Green = 1 },
		Blessing = true,
		ModifierAdreti = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is discarded: You may select a fighter in your hand that costs exactly 2 studs and destroy it. If you do, put an Adreti's Blessing onto a card space in your hand.\nWhen this card is cast: Give yourself a fleeting Nascent Stud for each blessing in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"RepeatingAdd",
							{ "Addant", "Variable" },
							"Ally"
						}
					},
					Target = "Self",
					MetaData = { Fleeting = true }
				},
				OnDiscarded = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Fighter = true, CostExact = 2 },
						SelectionDescription = "a 2 stud costed fighter in your hand to destroy",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = { { "AddHandModifier", "AdretiBless", "RandomPrioNotBlessedAllyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = "After having his eyes opened by Hyliehaven during the Black Raid, Guren's clouded mind was cleared. With his memories returning, the name of the Stud Master kept appearing. He couldn't believe that one of Hyliehaven's end-of-journey milestones would be the marker for the beginning of his."
	},
	["Smoox and Apiri, Brometheus's Monsters"] = {
		Id = 14620097602,
		Name = "Smoox and Apiri, Brometheus's Monsters",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4, Yellow = 3 },
		LunaTest = true,
		PlayTest = true,
		CustomReminderDebt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: You gain {W}{R}{G}{B} and 3 Debt.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Neutral", 1 },
						{ "Red", 1 },
						{ "Blue", 1 },
						{ "Green", 1 },
						{ "Debt", 3 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Taxi, Fired Farseeker"] = {
		Id = 108433582322115,
		Name = "Taxi, Fired Farseeker",
		Health = 150,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		Blessing = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this card is cast, if your baseplate rank is 7 or greater: Put a random blessing onto your 1st card space.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{
								"SetRandomTableValue",
								"Math",
								{
									"EldritchBless",
									"ScintillantBless",
									"ExubBless",
									"EclipseBless",
									"VengefulBless",
									"AdretiBless",
									"SiderealBless",
									"OmniBless",
									"DevastatingBless",
									"VirtuousBless",
									"HorrorBless",
									"HumbleBless",
									"BountBless",
									"DoomedBless",
									"ArtisanBless"
								},
								"Nil"
							},
							"Self"
						},
						{ "AddHandModifier", "Variable" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "AllyGenZone", 7, 9999 },
					MetaData = {
						SlotTargets = { 0 }
					}
				}
			}
		},
		Bio = "\"I wasn't getting paid enough anyway!\""
	},
	["Party Basement"] = {
		Id = 72349757630245,
		Name = "Party Basement",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Green = 4, Yellow = 4 },
		Terrain = true,
		Rank = 10,
		Summonant = "Catgirl Chimera",
		Terrariant = "BOYOH9, Neverending",
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "At the start of each player's turn: Their opponent obliterates 3 cards each from their deck and graveyard, then summons a Catgirl Chimera with overload. Its stats are the total stats of all cards obliterated this way.",
			Ability = {
				OnEnemyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "Nil", "SavedHealth" }
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "Summon", "Summonant", "Ally" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", true, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Nil", true, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone", "Ally_Deck" },
						Condition = "RandomCard",
						Modifier = 3
					},
					MetaData = { Health = "SavedVariable_SavedHealth", Power = "Variable" }
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "Nil", "SavedHealth" }
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "Summon", "Summonant", "Opponent" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", true, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Opponent", "Nil", true, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone", "Enemy_Deck" },
						Condition = "RandomCard",
						Modifier = 3
					},
					MetaData = { Health = "SavedVariable_SavedHealth", Power = "Variable" }
				}
			}
		},
		Bio = "The world moves on..."
	},
	["BOYOH9, Neverending"] = {
		Id = 136990184477372,
		Name = "BOYOH9, Neverending",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 3 },
		Terrarian = true,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Enrage",
			Description = "At the start of your turns, if this card is in your graveyard and you have no cards in your deck: Summon it. It gains 150 health and power for each card in your opponent's hand.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Hand_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" }
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "Self",
					EffectRequirement = { "Deck", "Ally", 0, 1, "Cards" },
					DontTriggerInField = true
				}
			}
		},
		Bio = "- but the Plurality stays."
	},
	cheatcode = {
		Id = 16967153002,
		Name = "cheatcode",
		Health = 1000,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Green = 2 },
		LunaTest = true,
		PlayTest = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever a player casts a card that isn't its original card type: If it's a fighter, lock a target fighter for 1 turn. Otherwise each player draws a card.",
			Ability = {
				OnAnyCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "ConvertCardType", "CardType" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "IsOriginalCardType", "Nil" },
							"Aggressor"
						},
						{
							"EVExactValueCheck",
							{ 0, "DifferentCardType" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassDifferentCardType = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "ConvertCardType", "CardType" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Fighter", "IsFighter" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassIsFighter = {
					Power = { { "Lock", 1, "Single" } },
					Target = "Self"
				},
				OnEVCheckFailIsFighter = {
					Power = { { "Draw", 1, "All" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	DunceDoodles = {
		Id = 99033211260735,
		Name = "DunceDoodles",
		Health = 2000,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Hammer",
		Color = "Yellow",
		Cost = { Green = 5, Yellow = 5 },
		AlternateCost = { Green = 4, Yellow = 4 },
		AlternateCostRequirement = { "Rarity", "Ally", 2, 9999, "Rare" },
		CustomReminder = {
			["Doodlin It"] = "A fragile fighter is destroyed as it takes damage from anything."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Cast this card for {G}{G}{G}{G}{Y}{Y}{Y}{Y} if there's 2 or more allied rare fighters.\nWhenever this card attacks: Summon a Green or Yellow fighter with an effect that triggers when cast unlocked. Attach Fragile to it, change its rarity to Rare, and trigger its effect as if it was cast.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"RandomSummonWithEffect",
							"MultiColOnlyorGreenCostYellowCost HasEffectorOnSummon GreenorYellow Fighter"
						},
						{ "EquipGear", "Fragile Mod", "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "ReplaceRarity", "Rare", "SummonedCard" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Hello! I am DumceDooble"
	},
	GreedLuna = {
		Id = 114176677857546,
		Name = "Greed",
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Money",
		SummonAnimation = "NWrathSummon",
		EffectAnimation = "LargeMoneySelf",
		Charge = true,
		Color = "Green",
		Cost = { Neutral = 3, Green = 3, Yellow = 3 },
		CustomReminderDebt = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Summon a Green, Yellow, and Colourless Stud as 200/200 fighters. Draw a card. You gain 13 debt.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Summon", "Green Stud" },
						{ "Summon", "Yellow Stud" },
						{ "Summon", "Neutral Stud" },
						{ "Draw", 1, "Ally" },
						{ "Debt", 13 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The poor and frail should surrender to your avarice."
	},
	GinLuna = {
		Id = 52072156,
		Name = "GinLuna",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Money",
		Summonant = "GinToken",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2, Yellow = 2 },
		LunaTest = true,
		PlayTest = true,
		CustomReminderSmuggle = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Select any number of cards in your hand and destroy them. Your opponent summons GinToken for each card destroyed this way. You can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "MultiSelectOperation", "Destroy", "CustomZoneTarget" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
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
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { HasntPassive = "DestroyImmune" },
						MinTargets = 0,
						MaxTargets = 10,
						SelectionDescription = "any number of cards to destroy"
					}
				},
				MultiSelectOperationDestroy = {
					Power = { { "Summon", "Summonant" } },
					Target = "Opponent"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = ""
	},
	GinToken = {
		Id = 52072156,
		Name = "GinToken",
		Health = 50,
		Power = 50,
		Rarity = "Token",
		TokenOmni = true,
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2, Yellow = 2 },
		LunaTest = true,
		PlayTest = true,
		CustomReminderSmuggle = true,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "During your end step: Your opponent smuggles the top card of your deck.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "TopCard", "Deck_Ally", "Hand_Opponent", false, false },
						"Self"
					} },
					Target = "Self",
					MetaData = {
						ConvertColors = { Green = "Yellow", Red = "Blue" },
						ConvertCardColor = { Green = "Yellow", Red = "Blue" },
						Smuggle = true,
						TokenDiscard = true
					}
				}
			}
		},
		Bio = ""
	},
	MilkManAndApiriLuna = {
		Id = 11893856431,
		Name = "MilkManAndApiriLuna",
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2, Yellow = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		LunaTest = true,
		PlayTest = true,
		Addant = "Horizonite",
		CustomReminder = {
			Horizonite = "A {R}{R}{Y}{Y} 400/400 fighter, inert in all zones. It can't be countered if it's attached or has an attached gear to it."
		},
		Effect = {
			Description = "Whenever this card attacks: Ransack 5, then give yourself a Horizonite. It’s a +150/+150 gear if you ransacked, otherwise it’s a 400/400 fighter.",
			Ability = {
				OnAttack = {
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
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 5 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 5
					},
					IsAlive = true,
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Health = 0, Power = 0, AddHealth = 150, AddPower = 150, Gear = true }
				},
				OnEVCheckFail = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	Horizonite = {
		Id = 97709511808479,
		Name = "Horizonite",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Red = 2, Yellow = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		Overload = true,
		TokenOmni = true,
		Effect = {
			Description = "This fighter can’t be countered while it’s attached.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "GivePassive", "CounterAttackBlock", "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "RemovePassive", "CounterAttackBlock", "Self" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	JKYRD1 = {
		Id = 6669650987,
		Name = "Grave Scavenger - LFC Variant",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Junkyard",
		Cost = { Blue = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Destroy the bottom card of your deck. Remove {W}{R}{G}{B}{Y} from its cost.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" },
							"CustomTarget"
						},
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
					Target = "CurrentTurn",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD2 = {
		Id = 8645873510,
		Name = "Jank Refiner - LFC Variant",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Junkyard",
		Cost = { Green = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "Once each turn, whenever you cast a Colourless card: You gain {W}.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "Neutral", 1, "Ally" } },
					Target = "Ally",
					TurnTriggerLimit = 1,
					Color = "Neutral"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD3 = {
		Id = 6000136293,
		Name = "Care Supplier - LFC Variant",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Junkyard",
		Cost = { Red = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step, if 2 or more allied fighters died this turn: All allied fighters gain 50 Power.",
			Ability = {
				OnEnd = {
					Power = { { "Strengthen", 50, "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 2, 9999, "TurnDeathStorm" }
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD4 = {
		Id = 7523610523,
		Name = "Wireframer - LFC Variant",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Junkyard",
		Cost = { Yellow = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Description = "During your end step, if you have 4 or more {W}: Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 4, 999999, "IconsNeutral" },
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD5 = {
		Id = 6834035284,
		Name = "Slighted Defender - LFC Variant",
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 6 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "Once during your turns, whenever an enemy fighter dies: Reassemble.\nOnce each turn, whenever you discard a card: A target fighter gains 300 Power and immunity to targeting.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{ "GivePassive", "TriggerInGraveZone", "CustomZoneTarget" },
						{ "GivePassive", "Reassembled", "CustomZoneTarget" }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Archetype = "Junkyard", HasDied = true, HasntPassive = "Reassembled" },
						SelectionDescription = "a Junkyard fighter to allow to trigger from grave.",
						MinTargets = 1,
						MaxTargets = 1
					},
					EffectRequirement = { "MyTurn", "Me", 30, 303 },
					TurnTriggerLimit = 1,
					Target = "CustomTarget"
				},
				OnAllyDiscard = {
					Power = {
						{ "Strengthen", 300 },
						{ "GivePassive", "TargetImmune" }
					},
					TurnTriggerLimit = 1,
					Target = "Single"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD6 = {
		Id = 5817399695,
		Name = "Patch Worker - LFC Variant",
		Health = 900,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 4 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		CustomReminder = {
			Reassembled = "Select a Junkyard card in your graveyard that's died. Its effects now also trigger in the graveyard."
		},
		Effect = {
			Description = "When this card is cast: Reassemble.\nOnce each turn, whenever an enemy fighter dies: Recur an allied Junkyard card, except it's inert when discarded.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "TriggerInGraveZone", "CustomZoneTarget" },
						{ "GivePassive", "Reassembled", "CustomZoneTarget" }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Archetype = "Junkyard", HasDied = true, HasntPassive = "Reassembled" },
						SelectionDescription = "a Junkyard fighter to allow to trigger from grave.",
						MinTargets = 1,
						MaxTargets = 1
					},
					EffectRequirement = { "MyTurn", "Me", 30, 303 },
					Target = "CustomTarget",
					TurnTriggerLimit = 1
				},
				OnEnemyDeath = {
					Power = { {
						"MoveZone",
						{ "Junkyard", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					MetaData = { TokenDiscard = true },
					TurnTriggerLimit = 1,
					Target = "Self"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRD7 = {
		Id = 9848466189,
		Name = "Mechabeast Queen",
		Health = 1000,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 8 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		CustomReminder = {
			["Swarm of Steel"] = "A reassembled cards' effects now also trigger in the graveyard."
		},
		Effect = {
			Description = "At the start of your turns: Trigger all allied effects that trigger during your end step.\nDuring your end step, if there's 10 or more Junkyard cards in your graveyard: Reassemble your graveyard.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "ForceTrigger", "OnEnd" },
						{ "ForceTrigger", "OnEnd", "CustomTarget" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "HasPassive",
						Modifier = "Reassembled"
					}
				},
				OnEVCheckPass = {
					Power = { { "ForceTrigger", "OnEnd", "CustomTarget" } },
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "HasPassive",
						Modifier = "TriggerInGraveZone"
					},
					NoBlip = true
				},
				OnEnd = {
					Power = {
						{ "GivePassive", "TriggerInGraveZone" },
						{ "GivePassive", "Reassembled" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "All"
					},
					EffectRequirement = { "Archetype", "AllyGraveZone", 10, 9999, "Junkyard" }
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB1 = {
		Id = 6669650987,
		Name = "Grave Scavenger - LFC Variant V2",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Junkyard",
		Cost = { Blue = 1, Green = 1, Neutral = 2 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Recur an allied card, except it's fading. Then remove {R}{G}{B}{Y} from each card in your graveyard.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "Any", "Deck_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" },
							"CustomTarget"
						},
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
					Target = "CurrentTurn",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "All"
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB2 = {
		Id = 8645873510,
		Name = "Jank Refiner - LFC Variant V2",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Junkyard",
		Cost = { Neutral = 2, Green = 1, Red = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step or whenever you cast a colourless card: You gain {W}.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "Neutral", 1, "Ally" } },
					Target = "Ally",
					Color = "Neutral"
				},
				OnEnd = {
					Power = { { "Neutral", 1, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB3 = {
		Id = 6000136293,
		Name = "Care Supplier - LFC Variant V2",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Junkyard",
		Cost = { Red = 1, Neutral = 2, Yellow = 1 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "NOT CODED IN During your end step, if 2 or more allied fighters died this turn: All allied fighters gain 50 Power.",
			Ability = {
				OnEnd = {
					Power = { { "Strengthen", 50, "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 2, 9999, "TurnDeathStorm" }
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB4 = {
		Id = 7523610523,
		Name = "Wireframer - LFC Variant V2",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Junkyard",
		Cost = { Yellow = 1, Blue = 1, Neutral = 2 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Description = "During your end step: Give yourself a Nascent Stud.",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB5 = {
		Id = 6834035284,
		Name = "Slighted Defender - LFC Variant V2",
		Health = 700,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 6 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		Effect = {
			Description = "When 10 fighters after this one have died: Recur this card, then reassemble.\nWhen this card is cast: Attach a +0/+300 gear that grants target and combat damage immunity to until the start of your next turn to a target fighter.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Add", "MathModifyVariable_2", 1, "Nil", 2 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 1, "CogCountMet", 9 }
						}
					},
					Target = "Self",
					DontTriggerInField = true,
					TriggerInGraveZone = true
				},
				OnEVCheckPassCogCountMet = {
					TriggerInGraveZone = true,
					Power = {
						{
							"AlterEV",
							{ "Set", "MathModifyVariable_2", 0, "Nil", 2 },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						},
						{ "GivePassive", "TriggerInGraveZone", "CustomZoneTarget" },
						{ "GivePassive", "Reassembled", "CustomZoneTarget" },
						{ "Strengthen", 300, "CustomZoneTarget" },
						{ "Heal", 300, "CustomZoneTarget" }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Archetype = "Junkyard", HasDied = true, HasntPassive = "Reassembled" },
						SelectionDescription = "a Junkyard fighter to gain +300/+300 and the ability to trigger from grave",
						MinTargets = 1,
						MaxTargets = 1
					},
					Target = "CustomTarget"
				},
				OnSummon = {
					Power = { { "EquipGear", "Wirecurse" } },
					Target = "Single"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	Wirecurse = {
		Id = 6834035284,
		Name = "Wirecurse",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		AddPower = 300,
		AddHealth = 0,
		Gear = true,
		Effect = {
			Description = "Attach to a target fighter.\nWhile equipped, effects can't target this fighter and it takes no damage from combat.\nAt the start of your turns: Destroy this card.",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{ "GivePassive", "TargetImmune" },
						{
							"GivePassiveSpecific",
							{ Mitigation = 10000000000 }
						}
					},
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "TargetImmune" },
						{ "RemovePassive", "Mitigation" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB6 = {
		Id = 5817399695,
		Name = "Patch Worker - LFC Variant V2",
		Health = 900,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 4 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		CustomReminder = {
			Reassembled = "Select a non-reassembled Junkyard card in your graveyard that's died. It gains 300 Health and Power and its effects now also trigger in the graveyard."
		},
		Effect = {
			Description = "When 10 fighters have died after this one: Reassemble this card.\nOnce each turn, whenever you discard a card: Select a Junkyard fighter in your graveyard. Give yourself a copy of it, then reassemble it.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Add", "MathModifyVariable_2", 1, "Nil", 2 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 1, "CogCountMet", 9 }
						}
					},
					Target = "Self",
					DontTriggerInField = true,
					TriggerInGraveZone = true
				},
				OnEVCheckPassCogCountMet = {
					TriggerInGraveZone = true,
					Power = {
						{ "GivePassive", "TriggerInGraveZone" },
						{ "GivePassive", "Reassembled" },
						{ "Strengthen", 300 },
						{ "Heal", 300 }
					},
					Target = "Self"
				},
				OnAllyDiscard = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						},
						{ "GiveCopy", 30, "CustomZoneTarget" },
						{ "GivePassive", "TriggerInGraveZone", "CustomZoneTarget" },
						{ "GivePassive", "Reassembled", "CustomZoneTarget" },
						{ "Strengthen", 300, "CustomZoneTarget" },
						{ "Heal", 300, "CustomZoneTarget" }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Archetype = "Junkyard", HasDied = true, HasntPassive = "Reassembled" },
						SelectionDescription = "a Junkyard fighter to gain +300/+300 and the ability to trigger from grave",
						MinTargets = 1,
						MaxTargets = 1
					},
					Target = "CustomTarget",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	JKYRDB8 = {
		Id = 6834035284,
		Name = "Hex Researcher - LFC Variant V2",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Junkyard",
		Cost = { Neutral = 6 },
		PlayTest = true,
		LunaTest = true,
		EffectVariable = 0,
		CustomReminder = {
			Reassembled = "Select a non-reassembled Junkyard card in your graveyard that's died. It gains 300 Health and Power and its effects now also trigger in the graveyard."
		},
		Effect = {
			Description = "When 10 fighters after this one have died: Reassemble this card and two others.\nDuring your end step: Give yourself a Nascent Stud. All enemy fighters lose 50 Power.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Add", "MathModifyVariable_2", 1, "Nil", 2 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 1, "CogCountMet", 9 }
						}
					},
					Target = "Self",
					TriggerInGraveZone = true,
					DontTriggerInField = true
				},
				OnEVCheckPassCogCountMet = {
					TriggerInGraveZone = true,
					Power = {
						{ "GivePassive", "TriggerInGraveZone" },
						{ "GivePassive", "Reassembled" },
						{ "Strengthen", 300 },
						{ "Heal", 300 },
						{ "GivePassive", "TriggerInGraveZone", "CustomZoneTarget" },
						{ "GivePassive", "Reassembled", "CustomZoneTarget" },
						{ "Strengthen", 300, "CustomZoneTarget" },
						{ "Heal", 300, "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Archetype = "Junkyard", HasDied = true, HasntPassive = "Reassembled" },
						SelectionDescription = "a Junkyard fighter to gain +300/+300 and the ability to trigger from grave",
						MinTargets = 1,
						MaxTargets = 3
					}
				},
				OnEnd = {
					Power = {
						{ "Add", "Nascent Stud" },
						{ "Weaken", 50, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Make the best of it even when you're out.\""
	},
	["Soulysm, True Zenith"] = {
		Id = 73128644595872,
		Name = "Soulysm, True Zenith",
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "DoomStorm",
		Color = "Yellow",
		TargetImmune = true,
		DestroyImmune = true,
		Cost = { Red = 3, Yellow = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Zenith",
			Description = "When this card is cast: Select an unranked fighter from your hand that costs X or less total studs and summon it. X is the number of fighters in play. Trigger its effects as though it was cast.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Field_Ally", false, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { CostOrLess = "Variable", Fighter = true, Unranked = true },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "an unranked fighter"
					}
				}
			},
			AllowDeadAggressorTriggers = true,
			TriggerOnSummons = true
		},
		Bio = "“Despite everything, I'm still me.”"
	}
}
