



return {
	Meelo = {
		Id = 17790768218,
		Name = "Meelo",
		AltCards = {
			Deliovon = {
				Name = "Deliovon",
				AltArt = true,
				CopyBodge = "Deliovon",
				AttackEffect = "LinkedSword",
				Id = 17790763142,
				Bio = "Your bread will now be removed."
			},
			["Meelo-Hal"] = {
				Id = 17790760773,
				AttackEffect = "Arcane",
				Bio = "I'll MAKE them listen!"
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Gust",
		EffectAnimation = "DenialCastMeeloEffect",
		Color = "Blue",
		Charge = true,
		Cost = { Neutral = 3, Blue = 2, Yellow = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks and destroys another: During your opponent's next turn, skip all effects that trigger whenever a fighter is cast.",
			Type = "OnAttackDestroy",
			Power = { { "BypassCasts" } },
			Target = "Opponent"
		},
		Bio = "Back in 2010, I was silenced for telling the truth. The mere suggestion that the moderators were wrong made them frenzy. Now, I silence them."
	},
	NintendoZACHARY = {
		Id = 5994051763,
		Name = "NintendoZACHERY",
		AltCards = {
			["Jimbo Jambo"] = {
				Name = "Jimbo Jambo",
				AttackEffect = "Gravity",
				AltArt = true,
				Id = 9284775910,
				Bio = "\"Majik Mistle!\""
			},
			["NintendoZACHARY-AN"] = {
				Name = "Esteban Finlay",
				AttackEffect = "MagicBlue",
				Id = 129162012906494,
				Bio = "\"Shaddup, Django.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if effects have drawn you 4 cards since your last end step: Unlock all allied fighters.",
			Type = "OnSummon",
			Power = { { "Unlock", "9999" } },
			EffectRequirement = { "Playertable", "Me", 4, 9999, "Draws" },
			Target = "Ally"
		},
		Bio = "I AM the speeding wall!"
	},
	["Hallow, Extortionist of Fun"] = {
		Id = 5221716556,
		Name = "Hallow, Extortionist of Fun",
		AltCards = {
			["HallowFun-ArtV"] = {
				AltArt = true,
				Id = 5719572413,
				AttackEffect = "HollowScythe",
				Bio = "\"I've forgotten how FUN it can be to go all out... Definitely better than Zumba classes."
			},
			["Kara, Champion Lord of the Pits"] = {
				Name = "Kara, Champion Lord of the Pits",
				AttackEffect = "Flare",
				Id = 7493963312,
				Bio = "\"Sorry, Umby! That wealth of yours doesn't belong to you anymore, it belongs to ME and MY boys now! Now go take care of the kids, yes?\""
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		EffectVariable = 0,
		Color = "Yellow",
		Cost = { Yellow = 6 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Replace all cards in your hand with Yellow cards that cost equal or more total Yellow and Colourless studs than that card.",
			Type = "OnEnd",
			Power = { { "UpgradeHand", "MonoOnlyorYellowCost Yellow VariableorHigherCost" } },
			Target = "Self"
		},
		Bio = "I have seen the future. This Thursday does not include you, Ghashendex."
	},
	["Hallow's Accountant"] = {
		Id = 10310525587,
		Name = "Hallow's Accountant",
		AltCards = {
			SyrupTori = {
				Id = 8036110000,
				Name = "Syrup & Tori",
				AttackEffect = "MagicYellow",
				Bio = "Syrup and Tori go way back. They’ve been passing out enchanted candy to neighborhoods everywhere. Every year, they give to the children in the hopes that they can liven up their nights a little more!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		CustomReminder = {
			["Pumpkin Bomb"] = "An {R} action. It deals 250 damage to a target fighter."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever an effect draws you a card: Give yourself a Pumpkin Bomb.",
			Type = "OnAllyDraw",
			Power = { { "Add", "Pumpkin Bomb" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Everyone must pay the fun tax. Even abominations from space."
	},
	["Absolute Dominance"] = {
		Id = 10251341902,
		Name = "Traverse the Wastes",
		AltCards = {
			["Traverse the Wastes-C"] = {
				Name = "Feed the Flame",
				Id = 15564058227,
				AttackEffect = "FirePunch",
				Bio = "Actually, using coal as a fuel was a recent discovery following an excess of naughty children in the world and a shortage of toys for the nice kids."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 8 },
		AlternateCost = { Red = 3 },
		AlternateCostRequirement = { "Playertable", "Me", 50, 999999999999999, "EffectLifeLoss" },
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card using {R}{R}{R} if effects have made you lose life since your last end step.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally"
		},
		Bio = "At the Destruction's agreement, each of the Four sought out one of the temporal aberrations, allying it with them if possible and destroying them otherwise. Eclipse found nothing but ashes, scrap, and scale. Who did this...?"
	},
	Jaredvaldez4 = {
		Id = 5945597362,
		Name = "Jaredvaldez4",
		AltCards = {
			["Jaredvaldez4-AN"] = {
				Name = "Best card 2o16",
				Id = 9362064223,
				Bio = "/e copy opponent_boardstate"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Red",
		Cost = { Neutral = 5, Yellow = 5, Red = 5 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Summon 5 fighters from your opponent's graveyard.",
			Type = "OnSummon",
			Power = { {
				"MoveZone",
				{ "Fighter", "GraveZone_Opponent", "Field_Ally", true, false, 5 }
			} },
			Target = "Self"
		},
		Bio = "An ancient scourge returned once more."
	},
	["Deception Infection"] = {
		Id = 4537242595,
		Name = "Deception Infection",
		AltCards = {
			["Copyrighted Artists"] = {
				AltArt = true,
				Name = "Copyrighted Artists",
				Id = 7370981978,
				Effect = {
					Name = "Temporal Halo",
					Description = "Summon 4 Colourless 200/200 Dubious Drawings that can't counter.\nOne of them is plagiarised.\nWhenever an effect targets a Dubious Drawing: draw a card. Destroy it, or instead destroy all allied fighters if it's plagiarised.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 2, "nil" }
								},
								{ "EVGreaterValueCheck", 1 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 0, "InfectedLeft" }
								},
								{
									"RandomSummon",
									{ "DuDraw1", "DuDraw2", "DuDraw3", "DuDraw4" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckFail = {
							Power = { {
								"RandomSummon",
								{ "DDraw1", "DDraw2", "DDraw3", "DDraw4" }
							} },
							Target = "Self",
							NoBlip = true
						}
					}
				},
				Bio = "\"Okay guys, let's try to follow the prompt this time around instead of just drawing Among Us crewmates.\"."
			},
			["Deception Infection-Banner"] = {
				Name = "The Literature Club",
				Id = 12325871474,
				Effect = {
					Name = "Temporal Halo",
					Description = "Summon 4 Colourless 200/200 Club Members that can't counter.\nOne of them is corrupted.\nWhenever an effect targets a Club Member: Draw a card. Destroy it, or instead destroy all allied fighters if it's corrupted.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 2, "nil" }
								},
								{ "EVGreaterValueCheck", 1 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 0, "InfectedLeft" }
								},
								{
									"RandomSummon",
									{ "CLMEMBER1", "CLMEMBER2", "CLMEMBER3", "CLMEMBER4" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckFail = {
							Power = { {
								"RandomSummon",
								{ "CMEMBER1", "CMEMBER2", "CMEMBER3", "CMEMBER4" }
							} },
							Target = "Self",
							NoBlip = true
						}
					}
				},
				Bio = "We love being literate!"
			},
			["Ray's Inferno"] = {
				AltArt = true,
				Name = "Ray's Inferno",
				Id = 17107610562,
				PremiumArt = 246,
				Effect = {
					Name = "Temporal Halo",
					Description = "Summon 4 Colourless 200/200 Witnesses that can't counter.\nOne of them is doomed.\nWhenever an effect targets a Witness: Draw a card. Destroy it, or instead destroy all allied fighters if it's doomed.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "AddRandomNumber", "Math", 0, 1 }
								},
								{ "EVGreaterValueCheck", 1 },
								{
									"AlterEV",
									{ "Load", "Math", 1, "InfectedLeft" }
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 2, "nil" }
								},
								{ "EVGreaterValueCheck", 1 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" }
								},
								{
									"AlterEV",
									{ "Save", "Math", 0, "InfectedLeft" }
								},
								{
									"RandomSummon",
									{ "Witsus1", "Witsus2", "Witsus3", "Witsus4" }
								}
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckFail = {
							Power = { {
								"RandomSummon",
								{ "Wit1", "Wit2", "Wit3", "Wit4" }
							} },
							Target = "Self",
							NoBlip = true
						}
					}
				},
				Bio = "\"Oh, it picked me.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Yellow = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Summon 4 Colourless 200/200 Deceptees that can't counter.\nOne of them is infected.\nWhenever an effect targets a Deceptee: Draw a card. Destroy it, or instead destroy all allied fighters if it's infected.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "Math", 1, "InfectedLeft" }
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 1 }
						},
						{ "EVGreaterValueCheck", 1 },
						{
							"AlterEV",
							{ "Load", "Math", 1, "InfectedLeft" }
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 1 }
						},
						{ "EVGreaterValueCheck", 1 },
						{
							"AlterEV",
							{ "Load", "Math", 1, "InfectedLeft" }
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 1 }
						},
						{ "EVGreaterValueCheck", 1 },
						{
							"AlterEV",
							{ "Load", "Math", 1, "InfectedLeft" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "nil" }
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "Math", 0, "InfectedLeft" }
						},
						{
							"RandomSummon",
							{ "Infected", "Infected1", "Infected2", "Infected3" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { {
						"RandomSummon",
						{ "Deceptee", "Deceptee1", "Deceptee2", "Deceptee3" }
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Can you trust them?"
	},
	Deceptee = {
		Id = 10184407265,
		Name = "Deceptee",
		AltCards = {
			Deceptee1 = { Id = 7368150115 },
			Deceptee2 = { Id = 7368150999 },
			Deceptee3 = { Id = 7368151549 },
			DDraw1 = {
				Id = 7370355070,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DDraw2 = {
				Id = 7370355766,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DDraw3 = {
				Id = 7370354292,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DDraw4 = {
				Id = 7370354750,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			CMEMBER1 = {
				Id = 12263830229,
				AttackEffect = "Slash",
				Name = "Monica",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CMEMBER2 = {
				Id = 12263835048,
				AttackEffect = "Scratch",
				Name = "Yori",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CMEMBER3 = {
				Id = 12263833527,
				AttackEffect = "Jab",
				Name = "Sayoko",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CMEMBER4 = {
				Id = 12263831724,
				AttackEffect = "Punch",
				Name = "Suki",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			Wit1 = {
				Id = 17107612528,
				AttackEffect = "Punch",
				Name = "Brie",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "Bye bye!!"
			},
			Wit2 = {
				Id = 17107611962,
				AttackEffect = "Punch",
				Name = "Ren",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "OH MY GOD HE FELL OFF"
			},
			Wit3 = {
				Id = 17107612239,
				AttackEffect = "Punch",
				Name = "Ray",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "I'm Cooked"
			},
			Wit4 = {
				Id = 17107611743,
				AttackEffect = "Punch",
				Name = "Toby",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "escúchame, la muerte espera :3c"
			}
		},
		Health = 200,
		Power = 200,
		CounterBlock = true,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's infected, destroy all allied fighters.",
			Type = "OnTarget",
			Power = {
				{ "Draw", 1 },
				{ "Destroy", 30, "Self" }
			},
			Target = "Ally"
		},
		Bio = "To infect is to celebrate."
	},
	Infected = {
		Id = 4806871530,
		Name = "Deceptee",
		AltCards = {
			Infected1 = { Id = 7368150115 },
			Infected2 = { Id = 7368150999 },
			Infected3 = { Id = 7368151549 },
			DuDraw1 = {
				Id = 7370355070,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DuDraw2 = {
				Id = 7370355766,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DuDraw3 = {
				Id = 7370354292,
				Name = "Dubious Drawing",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			DuDraw4 = {
				Id = 7370354750,
				AttackEffect = "Scratch",
				Name = "Dubious Drawing",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's plagiarised, destroy all allied fighters."
				},
				Bio = "Finding the right one will be ruff."
			},
			CLMEMBER1 = {
				Id = 12263830229,
				Name = "Monica",
				AttackEffect = "Slash",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CLMEMBER2 = {
				Id = 12263835048,
				Name = "Yori",
				AttackEffect = "Scratch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CLMEMBER3 = {
				Id = 12263833527,
				Name = "Sayoko",
				AttackEffect = "Jab",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			CLMEMBER4 = {
				Id = 12263831724,
				Name = "Suki",
				AttackEffect = "Punch",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's corrupted, destroy all allied fighters."
				},
				Bio = "<3"
			},
			Witsus1 = {
				Id = 17107612528,
				AttackEffect = "Punch",
				Name = "Brie",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "Bye bye!!"
			},
			Witsus2 = {
				Id = 17107611962,
				AttackEffect = "Punch",
				Name = "Ren",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "OH MY GOD HE FELL OFF"
			},
			Witsus3 = {
				Id = 17107612239,
				AttackEffect = "Punch",
				Name = "Ray",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "I'm Cooked"
			},
			Witsus4 = {
				Id = 17107611743,
				AttackEffect = "Punch",
				Name = "Toby",
				Effect = {
					Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's doomed, destroy all allied fighters."
				},
				Bio = "escúchame, la muerte espera :3c"
			}
		},
		Health = 200,
		Power = 200,
		CounterBlock = true,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an effect targets this card: Draw a card and destroy it. Then if it's infected, destroy all allied fighters.",
			Type = "OnTarget",
			Power = {
				{ "Draw", 1 },
				{ "Destroy", 30, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "To infect is to celebrate."
	},
	["Noli's Domain"] = {
		Id = 132911892827969,
		Name = "The Tempest",
		AltCards = {
			["Noli's Domain-E"] = {
				Name = "Moai Domain",
				Terrariant = "Domain Terrain-E",
				EffectAnimation = "MoyaiDomain",
				Id = 8725142887,
				Bio = "Those with 30 robux haircuts dare not to tread this sacred land."
			},
			["zombie world"] = {
				Name = "zombie world",
				Id = 10820917737,
				Terrariant = "Dustin, Cousin of the Heartbreaker",
				AltArt = true,
				Bio = "life is just a zombie world, and we're just pinging it"
			},
			snubcube = {
				Id = 106127601466298,
				Name = "Мастер's Domain",
				AttackEffect = "FirePunch",
				AltArt = true,
				Terrariant = "snubcube-Token",
				Bio = "ever wondered how mactep got his effects?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "NoliDomain",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		Terrain = true,
		Terrariant = "Domain Terrain",
		Effect = {
			Description = "Whenever a player discards a card: Until their next end step, during their turn, skip all effects that trigger on their end step or when a fighter is cast.",
			Ability = {
				OnAnyDiscard = {
					Power = {
						{ "BypassCasts" },
						{ "BypassEnd" }
					},
					Target = "CurrentTurn"
				}
			}
		},
		Bio = "Zanzel squinted into the distance. Normally, such a demon would make her blood boil. Yet now, a sigh. She knows what happens when you try to restore the world."
	},
	["Eisenhower Reunited"] = {
		Id = 10310627192,
		Name = "Eisenhower Reunited",
		AltCards = {
			["Elon Musk"] = {
				Name = "Elon, God of Tryhards",
				AttackEffect = "Storm",
				Id = 12358381559,
				Bio = "I'll orbit as many cars I need to prove I'm a genius!"
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 7, Yellow = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "At the start of each turn: Action and terrain cards can't be cast this turn.",
			Type = "OnStart",
			Power = {
				{ "BypassAction" },
				{ "BypassTerrain" }
			},
			Target = "CurrentTurn"
		},
		Bio = "She broke the world, but she returned him to me. Thank you, Zanzel."
	},
	["Contumacious Astrobleme"] = {
		Id = 4789950235,
		Name = "Contumacious Astrobleme",
		Health = 600,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		CustomReminderSuspend = true,
		Archetype = "Apocryspectre",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is suspended: Give yourself an Apocryspectre card. Suspend a target enemy fighter.",
			Type = "OnSuspend",
			Power = {
				{ "RandomAdd", "Apocryspectre", "Ally" },
				{ "Suspend" }
			},
			Target = "SingleEnemy",
			TurnTriggerLimit = 10
		},
		Bio = "Zanzel's ghosts mingled with Shedletsky's mythical shadows long since forgotten. They played football together."
	},
	["Essence Hugger"] = {
		Id = 8421527751,
		Name = "Cothran Remnant",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2 },
		Archetype = "Apocryspectre",
		Terrariant = "Remnant Terrain",
		CustomReminderSuspend = true,
		Terrain = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast an Apocryspectre: Suspend a target fighter.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "Suspend" } },
					Archetype = "Apocryspectre",
					Target = "Single"
				}
			}
		},
		Bio = "With Zanzel stripped of her power, her ghosts reverted back to their docile selves."
	},
	["Zanzel Repentant"] = {
		Id = 10288455415,
		Name = "Zanzel Repentant",
		AltCards = {
			["Repentant Bird Colossus"] = {
				Name = "The Bird Colossus",
				CopyBodge = "Repentant Bird Colossus",
				Transformant = "Rekindled Bird Colossus",
				AttackEffect = "LaserRed",
				AltArt = true,
				Id = 10288458803,
				Bio = "Does The Matriarch control Tweety, or does Tweety control The Matriarch?",
				ReplaceCardArtant = { 10288465315 },
				ReplaceCardNameant = { "The Bird Colossus" },
				ReplaceBioant = "We will never know."
			},
			["BISOR: NONE SO VILE"] = {
				Id = 122388348619617,
				Name = "BISOR: NONE SO VILE",
				Transformant = "VILEBISOR-Trans",
				PremiumArt = 319,
				AltArt = true,
				Bio = "<b><font color=\"#00FF00\">The seed that they had attempted to suffocate grew not only in spite of them, but poisonous in an attempt to get revenge.</font></b>"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Divinity",
		Color = "Green",
		Cost = { Green = 6 },
		Transformant = "Zanzel Rekindled",
		EffectVariable = 1,
		ReplaceCardArtant = { 10288464116 },
		ReplaceBioant = "...But I will hardly stand idly by while these heathens break the world twice over!",
		ReplaceCardNameant = { "Zanzel Rekindled" },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Shuffle 6 Bird cards into your deck.\nWhenever you cast a Bird: Shuffle a Bird card into your deck. This card gains 600 Health and Power the first time this ability triggers.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "Crow of Eternal Torment" },
						{ "DeckAdd", "Bird of Eternal Paradise" },
						{ "DeckAdd", "Parrot of Eternal Dominion" },
						{ "DeckAdd", "Crow of Eternal Torment" },
						{ "DeckAdd", "Bird of Eternal Paradise" },
						{ "DeckAdd", "Parrot of Eternal Dominion" }
					},
					Target = "Ally"
				},
				OnAllySummon = {
					Power = {
						{
							"RepeatingRandomDeckAdd",
							{
								{
									"Crow of Eternal Torment",
									"Bird of Eternal Paradise",
									"Parrot of Eternal Dominion"
								},
								1
							},
							"Ally"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Archetype = "Bird",
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 600, "Self" },
						{ "Strengthen", 600, "Self" },
						{
							"ReplaceCardArt",
							{ "Variable" },
							"Self"
						},
						{
							"ReplaceCardName",
							{ "Variable" },
							"Self"
						},
						{ "ReplaceBio", "ReplaceBioant" }
					},
					TotalTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = "The vision from the Alpha Brick lead me to break the world. The transgression is too great. I will pay for what I did..."
	},
	["Zanzel Rekindled"] = {
		Id = 10288464116,
		Name = "Zanzel Rekindled",
		AltCards = {
			["Rekindled Bird Colossus"] = {
				Name = "The Bird Colossus",
				CopyBodge = "Rekindled Bird Colossus",
				AttackEffect = "LaserRed",
				Id = 10288465315,
				Bio = "Does The Matriarch control Tweety, or does Tweety control The Matriarch?"
			},
			["VILEBISOR-Trans"] = {
				Id = 122388348619617,
				Name = "BISOR: NONE SO VILE",
				Bio = "<b><font color=\"#00FF00\">The seed that they had attempted to suffocate grew not only in spite of them, but poisonous in an attempt to get revenge.</font></b>"
			}
		},
		Health = 2100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Divinity",
		Color = "Green",
		Cost = { Green = 6 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Shuffle six bird cards into your deck.\nWhenever you cast a Bird: Shuffle a bird card into your deck. This card gains 600 Health and Power the first time this ability triggers.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "Crow of Eternal Torment" },
						{ "DeckAdd", "Bird of Eternal Paradise" },
						{ "DeckAdd", "Parrot of Eternal Dominion" },
						{ "DeckAdd", "Crow of Eternal Torment" },
						{ "DeckAdd", "Bird of Eternal Paradise" },
						{ "DeckAdd", "Parrot of Eternal Dominion" }
					},
					Target = "Ally"
				},
				OnAllySummon = {
					Power = { { "DeckAdd", "Crow of Eternal Torment" } },
					Archetype = "Bird",
					Target = "Ally",
					EffectRequirement = { "Archetype", "Ally", 1, 9999, "Bird" }
				}
			}
		},
		Bio = "...But I will hardly stand idly by while these heathens break the world twice over!"
	},
	["The Toothy Deer"] = {
		Id = 10280547119,
		Name = "The Toothy Deer",
		AltCards = {
			["The Toothy Deer-Xmas"] = {
				AttackEffect = "Jab",
				Id = 10280548178,
				Bio = "Me? No no, I'm the Toothy REINdeer! You must be thinking of my cousin."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Green = 3, Neutral = 2, Blue = 3 },
		CustomReminder = {
			["Toothy Deer's Blessing"] = "When this card is cast: Set the stats of a target fighter to 500/500."
		},
		Transformant = "Toothy Deer's Blessing",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Set the stats of a target fighter to 500/500, then transform it into 'Toothy Deer's Blessing.'",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetHealth", 500 },
						{ "SetPower", 500 },
						{ "Transform", "Transformant" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "I look like a toothy deer, so I'm hiding!"
	},
	["Eclipse, the Rage Gyre"] = {
		Id = 4789771431,
		Name = "Eclipse, the Rage Gyre",
		AltCards = {
			["Eclipse, the Rage Gyre-Banner"] = {
				Id = 10149822541,
				Bio = "After being trapped within one for years, Eclipse was not fond of celestial bodies being anywhere near him or the land he stood on."
			},
			["Echoing Sage Flufflefunz"] = {
				Id = 129276354644708,
				Name = "Echoing Sage Flufflefunz",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 399,
				Bio = "<font color=\"#C4A484\">Why not become didactic and tell everyone on the planet in plain English what you are?</font>"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "LycanScratch",
		Color = "Red",
		Cost = { Red = 3 },
		Archetype = "Lycanthrope",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if you have 500 or less life: Quadruple this card's stats. Unlock all allied Lycanthropes.",
			Type = "OnSummon",
			Power = {
				{ "MultiplyPower", 4, "Self" },
				{ "MultiplyHealth", 4, "Self" },
				{ "Unlock", 9999 }
			},
			EffectRequirement = { "Playertable", "Me", 0, 501, "Life" },
			Target = "AlliedArchetype"
		},
		Bio = "Eclipse retreated to his homeland to channel the Call with his descendants. He returns only in the direst of times."
	},
	["Eisenhower's Thresher"] = {
		Id = 7204556206,
		Name = "Eisenhower's Thresher",
		AltCards = {
			["Eisenhower's Thresher-Hal"] = {
				Id = 7459721723,
				Name = "Graboid",
				AttackEffect = "Scratch",
				Bio = " Zanzel was amazed at their power, but this power was destined to die off."
			}
		},
		Health = 550,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast or dies: Return all terrains in play to their hand.\nWhenever a terrain is cast: It can no longer be animated.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return" },
						{ "Return", 30, "EnemyTerrain" }
					},
					Target = "AllyTerrain"
				},
				OnDeath = {
					Power = {
						{ "Return" },
						{ "Return", 30, "EnemyTerrain" }
					},
					Target = "AllyTerrain"
				},
				OnTerrainCast = {
					Power = { { "GivePassive", "AnimateImmune" } },
					Target = "Aggressor"
				}
			}
		},
		Bio = "The World of Wood saw an ancient catalogue of lore. The anthrests saw a friend. Eisenhower saw paper."
	},
	["Circle Stud"] = {
		Id = 10184322514,
		Name = "Circle Stud",
		AltCards = {
			LegendaryGuySymphony = {
				Id = 131802133283004,
				Name = "The Four Seasons of Anime",
				AltArt = true,
				Bio = "Zanzel begrudgingly put on the muddy, insectile corset. Erysiphia's notion of perfection was so different to hers, yet not even Zanzel would deny her beauty."
			},
			["Nacho's Magnum Opus"] = {
				Id = 14387337488,
				Name = "Nacho's Magnum Opus",
				Commissioner = { 59353301, 41926915 },
				AltArt = true,
				PremiumArt = 98,
				Bio = "Nacho's brand new novel titled \"I already know it's gonna be my best one.\" featuring Nacho, Nacho, NachoSenne and Nacho will soon be available in bookstores not near you."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Draw a card.\nSelect a card in your hand. It becomes Red.\nSelect a card in your hand. It becomes Green.\nSelect a card in your hand. It becomes Blue.\nSelect a card in your hand. It becomes Yellow.\nRemove all inertia from all cards selected this way.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{ "ReplaceColor", "Red", "CustomZoneTarget" },
				{ "ReplaceColor", "Green", "CustomZoneTarget" },
				{ "ReplaceColor", "Blue", "CustomZoneTarget" },
				{ "ReplaceColor", "Yellow", "CustomZoneTarget" }
			},
			Target = "Ally",
			UniqueTargets = true,
			ZoneTargetParameters = {
				Zones = { "Ally_Hand" },
				MinTargets = 0,
				MaxTargets = 1,
				SelectionDescription = "a card to have its colour changed"
			}
		},
		Bio = "A bygone relic of a bygone time."
	},
	["Alpha Brick's Destruction"] = {
		Id = 10243033014,
		Name = "Alpha Brick's Destruction",
		AltCards = {
			["Alpha Brick's Destruction-AltBorder"] = { Id = 4789681891 }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Archetype = "Era",
		Cost = { Neutral = 12 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Your opponent can't attack or cast anything until their next end step.\nSkip all end step triggers, readying, and stud generation that turn.",
			Type = "OnSummon",
			Power = {
				{ "BypassAttack" },
				{ "BypassGeneration" },
				{ "BypassSummon" },
				{ "BypassCasts" },
				{ "BypassAction" },
				{ "BypassTerrain" },
				{ "BypassGear" },
				{ "BypassEnd" },
				{ "BypassLock" }
			},
			Target = "Opponent"
		},
		Bio = "Zanzel screamed at a job not done. Eisenhower recoiled at an experiment not fulfilled. Eclipse howled as the timestream burnt his throat. For Hallow, it was Monday."
	},
	["Person299's Minigames"] = {
		Id = 7103830567,
		Name = "Person299's Minigames",
		AltCards = {
			["Circus in the Sky"] = {
				Id = 7472553694,
				Name = "Circus In The Sky",
				Terrariant = "Circus Terrain",
				Bio = ""
			},
			["Greatest Eclipse"] = {
				Id = 7776936576,
				Name = "Greatest Eclipse",
				Terrariant = "Eclipse Terrain",
				AltArt = true,
				Bio = "Hades has already claimed the overworld, mortals. Despair is soon to follow once Hades arrives."
			},
			["Person299's Minigames-10Y"] = {
				Id = 109654365968360,
				PackDisplayOverride = "10th Anniversary Art Collection",
				Terrariant = "Minigame Terrain-10Y",
				Bio = "The longest running minigames in ROBLOX, played since 2008!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 2, Yellow = 7 },
		Rank = 8,
		Terrain = true,
		Terrariant = "Minigame Terrain",
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Destroy your hand. Give yourself 7 rare cards.",
			Type = "OnEnd",
			Power = {
				{ "RandomDiscard", 10 },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" }
			},
			Target = "Ally"
		},
		Bio = "Step right up! The classic parade returns once more!"
	},
	["Schismed Ro-Boy"] = {
		Id = 9964882874,
		Name = "Schismed Ro-Boy",
		AltCards = {
			["UnwantedTrend-SSJ"] = {
				Name = "UnwantedTrend",
				AttackEffect = "Scratch",
				Id = 113803778287958,
				AltArt = true,
				Effect = {
					Name = "Temporal Halo",
					Type = "OnAttack",
					Power = {
						{ "Summon", "Old Robloxite-UT", "Ally" },
						{ "Summon", "New Robloxite-UT" }
					},
					Target = "Opponent"
				},
				PremiumArt = 219,
				Bio = "\"To the BC players I met: How am I the \"toxic braindead slingshot player\" even though you play a complex deck that bricks and needs multiple cards to stall? How am I the braindead player even though the deck I play has a simple win condition and I actually engage in matches\""
			},
			["0x2991 and Monnie Resentful"] = {
				Name = "0x2991 & Monnie; Resentful",
				AttackEffect = "DoomSlash",
				Id = 102755528344274,
				AltArt = true,
				Effect = {
					Name = "Temporal Halo",
					Type = "OnAttack",
					Power = {
						{ "Summon", "Old Robloxite-0x", "Ally" },
						{ "Summon", "New Robloxite-0x" }
					},
					Target = "Opponent"
				},
				PremiumArt = 494,
				Bio = "See thousands of words through my eyes<br/>And when you finally realize<br/>That you're the one holding the gun<br/><b><font color=\"#FF0000\">I'll say my first goodbye.</font></b> "
			},
			["Eternal Rivalry"] = {
				Id = 81245605085269,
				Name = "Eternal Rivalry",
				AttackEffect = "Slash",
				Effect = {
					Name = "Temporal Halo",
					Type = "OnAttack",
					Power = {
						{ "Summon", "Old Robloxite-ER", "Ally" },
						{ "Summon", "New Robloxite-ER" }
					},
					Target = "Opponent"
				},
				AltArt = true,
				PremiumArt = 654,
				Bio = "Well Well Well... This Running Gag is getting old..."
			}
		},
		Health = 1250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 3 },
		CustomReminder = {
			["Nostalgia Wars"] = "Whenever a Robloxite dies, the opposite Robloxites make their opponents lose 100 life."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks: Summon a 200/200 Old Robloxite. Your opponent summons a 200/200 New Robloxite.",
			Type = "OnAttack",
			Power = {
				{ "Summon", "Old Robloxite", "Ally" },
				{ "Summon", "New Robloxite" }
			},
			Target = "Opponent"
		},
		Bio = "I can't decide which time period is best. New Roblox has all those animations, but Old Roblox has Circle Studs."
	},
	["New Robloxite"] = {
		Id = 4720335554,
		Name = "New Robloxite",
		AltCards = {
			["New Robloxite-UT"] = {
				Name = "New Blood",
				AttackEffect = "Scratch",
				Id = 73208052701551,
				Bio = "No, monored's fine"
			},
			["New Robloxite-0x"] = {
				Name = "Monnie",
				AttackEffect = "British",
				Id = 140246806825756,
				Bio = "Faking, waiting, hating, craving <br/>Look at what I've done for you, done for you <br/>All for you"
			},
			["New Robloxite-ER"] = {
				Name = "RadarVoid",
				AttackEffect = "British",
				Id = 80795889141325,
				Bio = "To be honest I might be cooked if he uses Blue Aggro again"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Token = true,
		Cost = { Neutral = 1 },
		Archetype = "New Robloxite",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an Old Robloxite dies: Your opponent loses 100 life.",
			Type = "OnAnyDeath",
			Power = { { "Inflict", 100 } },
			Target = "Opponent",
			Archetype = "Old Robloxite"
		},
		Bio = "\"We're the coolest! We've got glass, and neon, and animations, and particles!\""
	},
	["Old Robloxite"] = {
		Id = 4720338581,
		Name = "Old Robloxite",
		AltCards = {
			["Old Robloxite-UT"] = {
				Name = "Old Guard",
				AttackEffect = "Scratch",
				Id = 90110761760159,
				Bio = "Monored needs this"
			},
			["Old Robloxite-0x"] = {
				Name = "0x2991",
				AttackEffect = "DoomSlash",
				Id = 84976590805899,
				Bio = "Look at you go<br/>You who had betrayed me<br/>You know I am nothing like the monster you named me"
			},
			["Old Robloxite-ER"] = {
				Name = "Eminence",
				AttackEffect = "British",
				Id = 109745172867300,
				Bio = "To be honest I might be cooked if he uses Red Rares again"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Token = true,
		Cost = { Neutral = 1 },
		Archetype = "Old Robloxite",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a New Robloxite dies: Your opponent loses 100 life.",
			Type = "OnAnyDeath",
			Power = { { "Inflict", 100 } },
			Target = "Opponent",
			Archetype = "New Robloxite"
		},
		Bio = "\"Two words: Circle Studs.\""
	},
	["Dwarvern Meteor"] = {
		Id = 10184549465,
		Name = "Dwarvern Meteor",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 10, Red = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Turns", "Ally", 29, 9999 },
		Fading = true,
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Effect = {
			Name = "Temporal Halo",
			Description = "If it's ply 30 or later, cast this ignoring its {W} cost.\nDestroy all fighters.",
			Type = "OnSummon",
			Power = { { "Destroy" } },
			Target = "All"
		},
		Bio = "2000 years ago, the Dwarvern Meteor destroyed the World of Wood. In 2000 years, the Dwarvern Meteor will destroy the world again."
	},
	["Lore of the Voidoaks"] = {
		Id = 7015030768,
		Name = "Lore of the Voidoaks",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 10, Blue = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Turns", "Ally", 29, 9999 },
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Effect = {
			Name = "Temporal Halo",
			Description = "If it's ply 30 or later, cast this ignoring its {W} cost.\nShuffle 5 Blue cards into your deck.\nDraw 5 cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomDeckAdd", "MonoOnlyorBlueCost Blue" },
				{ "RandomDeckAdd", "MonoOnlyorBlueCost Blue" },
				{ "RandomDeckAdd", "MonoOnlyorBlueCost Blue" },
				{ "RandomDeckAdd", "MonoOnlyorBlueCost Blue" },
				{ "RandomDeckAdd", "MonoOnlyorBlueCost Blue" },
				{ "Draw", 5 }
			},
			Target = "Ally"
		},
		Bio = "At the very centre of the World of Wood, there are the Voidoaks, which has every event ever to happen within the World of Wood etched onto its bark. Reading the Voidoaks - or, perhaps, drinking from the Voidoaks' sap - makes people omniscient, although the Wanwood Dryad would never allow it."
	},
	["Child of 2x2"] = {
		Id = 5673307566,
		Name = "Child of 2x2",
		AltCards = {
			["Child of 2x2-AltArt"] = { Id = 10184304739, AltArt = true },
			["Child of 2bh"] = {
				Id = 13603249813,
				Name = "Child of 2bh",
				Bio = "YIPPEE!",
				SummonAnimation = "TBHSummon",
				DeathAnimation = "TBHDeath"
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Rare",
		AttackEffect = "StudBlast",
		Color = "Neutral",
		Archetype = "Technician",
		Cost = { Neutral = 10, Green = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Turns", "Ally", 29, 9999 },
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Effect = {
			Name = "Temporal Halo",
			Description = "If it's ply 30 or later, cast this card ignoring its {W} cost.\nDuring your end step: All allied fighters generate twice.",
			Type = "OnEnd",
			Power = { { "Generate", 2 } },
			Target = "Ally"
		},
		Bio = "After breaking the Alpha Brick, it had to be reformed. And so, it was. So the world might be mended."
	},
	["Slumbering Satyr"] = {
		Id = 5673304280,
		Name = "Slumbering Satyr",
		AltCards = {
			["Slumbering Satyr-Hal"] = {
				Id = 7480396467,
				Name = "Cheshire Cat",
				AttackEffect = "Gravity",
				Bio = "A smile that could split worlds."
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 10, Yellow = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Turns", "Ally", 29, 9999 },
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Effect = {
			Name = "Temporal Halo",
			Description = "If it's ply 30 or later, cast this ignoring its {W} cost.\nDuring your end step: Summon a Yellow fighter. Your opponent loses 500 life.",
			Type = "OnEnd",
			Power = {
				{ "RandomSummon", "MonoOnlyorYellowCost Yellow Fighter" },
				{ "Inflict", 500, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "When the dragons sleep, our kind frolick. When the neodragons sleep, our kind worship."
	},
	SamsonXVI = {
		Id = 4789690650,
		Name = "SamsonXVI",
		AltCards = {
			["SamsonXVI-Hal"] = {
				Id = 7760136117,
				AttackEffect = "Arcane",
				Bio = "Story time is now over."
			},
			["SamsonXVI-Mango"] = {
				Name = "Rockhead",
				Id = 104329274303084,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "North past any reasonable map lies a gate and a guard. Past that gate lies a city destined to - designed to - collapse; its inhabitants worship the transience of their lives, putting it on the line every day for (to an outsider) no purpose."
			}
		},
		Health = 500,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you discard your first card each turn: Draw a card, except it's inert when discarded.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Draw", 1 } },
					EffectRequirement = { "Playertable", "Me", 1, 1, "DiscardCount" },
					MetaData = { TokenDiscard = true },
					Target = "Ally"
				}
			},
			EffectInert = true
		},
		Bio = "Let's go camping. Surely nothing bad will happen."
	},
	Worldpurge = {
		Id = 10243043189,
		Name = "Worldpurge",
		AltCards = {
			["Live Bruh Gang Reaction"] = {
				Id = 90419667858735,
				Name = "Phonk Knight's Torment",
				AltArt = true,
				Bio = "“So when you can’t run you’ll know <b><font color=\"#ff0d0d\">\"I AM BACK\"</font></b>"
			},
			["Glittering Golden Death"] = {
				Id = 18601521344,
				Name = "Glittering Golden Death",
				AltArt = true,
				PremiumArt = 280,
				Bio = "All that glitters, shimmers, and shines eventually disintegrates."
			},
			["Universal Purge"] = {
				Id = 106893263265061,
				Name = "Universal Purge",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 650,
				Bio = "\"The only problem with being able to do anything is that you'll eventually run out of things to do.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Rank = 20,
		Cost = { Green = 10, Red = 10 },
		ObliterateOnCast = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Obliterate all enemy fighters and all copies of those fighters from all zones.\nObliterate this card and your opponent's terrain, hand, and baseplate.\nYour opponent loses all studs, puts 2 Colourless Studs into their baseplate, then draws 5 cards.",
			Type = "OnSummon",
			Power = {
				{ "SetNeutral", 0 },
				{ "SetRed", 0 },
				{ "SetGreen", 0 },
				{ "SetBlue", 0 },
				{ "SetYellow", 0 },
				{ "Extract", 30 },
				{ "DestroyTerrain", "Obliterate" },
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
					"AddGenZone",
					{ "Mark Stud", 2 }
				},
				{ "Draw", 5 }
			},
			Target = "Opponent",
			EffectRandomDiscardObliterate = true,
			GenZoneDiscardObliterate = true
		},
		Bio = "The end of everything marked the start of a new era. Again and again. When will the Dwarven Meteor be stopped?"
	},
	Micheal_P = {
		Id = 10243168719,
		Name = "Micheal_P",
		AltCards = {
			["Micheal_P-Hal"] = {
				Id = 10243128054,
				Effect = {
					Name = "Temporal Halo",
					Description = "When this card is cast: Summon Noli at your own peril.",
					Type = "OnSummon",
					Power = { {
						"RandomSummon",
						{
							"Lezus 1-Hal",
							"Lezus 2-Hal",
							"Lezus 3-Hal",
							"Lezus 4-Hal",
							"Lezus 5-Hal",
							"Lezus 6-Hal"
						}
					} },
					Target = "Ally"
				},
				Bio = "\"OKAY GUYS *sound of F16 jet engine revving* TODAY I AM EXPLORING THIS GAME YOU SENT ME *radio transmission from Jupiter's orbit* CALLED \"QUEST 4 NOLI\""
			},
			["snubcube & Trixie, Vocalist Virtuosos"] = {
				Id = 11581894200,
				Name = "snubcube & Trixie, Vocalist Virtuosos",
				AttackEffect = "Microphone",
				Effect = {
					Name = "Temporal Halo",
					Description = "When this card is cast: Summon Karkalicious at your own peril.",
					Type = "OnSummon",
					Power = { {
						"RandomSummon",
						{
							"Karkalicious 1",
							"Karkalicious 2",
							"Karkalicious 3",
							"Karkalicious 4",
							"Karkalicious 5",
							"Karkalicious 6"
						}
					} },
					Target = "Ally"
				},
				Bio = "<i>*both singing the karkalicious song very badly*</i>"
			},
			["Sub2Gura123's MYSTERY BOX"] = {
				Id = 84809887654132,
				Name = "Sub2Gura123's MYSTERY BOX",
				Effect = {
					Name = "Temporal Halo",
					Description = "When this card is cast: Summon DUNDLE at your own peril.",
					Type = "OnSummon",
					Power = { {
						"RandomSummon",
						{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE6" }
					} },
					Target = "Ally"
				},
				PremiumArt = 341,
				AltArt = true,
				Bio = "Hi guys! Is me Sub2Gura123! I have now turn into a cube!!! This is awesome and so cool! I can't wait to show it to all of my friend. Oh hi Dunc-"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		CantRaidCast = true,
		Color = "Red",
		Cost = { Red = 1 },
		CustomReminder = {
			RAAAAAAAAGJASWHGSJGHGHGRRRRR = "You don't deserve to know what Lezus does."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Summon Lezus at your own peril.",
			Type = "OnSummon",
			Power = { {
				"RandomSummon",
				{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
			} },
			Target = "Ally"
		},
		Bio = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	},
	["Silencing Ritual"] = {
		Id = 14916183141,
		Name = "Void Sap Seer",
		AltCards = {
			["The Dynamic Duo"] = {
				Id = 10281226921,
				Name = "The Dynamic Duo",
				AltArt = true,
				Bio = "These gamers are here to hang out and have fun. Don't think they are gonna go easy though. Who knows what they might do!"
			},
			["VetexGames-Hal"] = {
				Id = 85936991722889,
				Name = "Eisen Flooded",
				AttackEffect = "British",
				Bio = "You've met with a terrible fate, haven't you?"
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Dextrous = true,
		Cost = { Blue = 9 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Play with the top card of your deck revealed.\nWhenever you discard a card: Destroy the top card of your deck.\nWhenever this card attacks: Draw a card.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "RevealTopDeck", 30, "Ally" } },
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Deck", "Ally", 1, 999999, "Cards" }
				},
				OnAllyDiscard = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{ "RevealTopDeck", 30, "Ally" }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "RevealTopDeck", 30, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The voidoak sap left a searing, acrid feeling in his mouth. Time reformed itself in his mind, as he became a spectator to himself. His greatest fear was confirmed: Restoring time would once again shatter his heart."
	},
	["Silencing Ritual Token"] = {
		Id = 10281233316,
		Name = "Silencing Ritual",
		AltCards = {
			["The Dynamic Duo Token"] = {
				Id = 7000542245,
				Name = "The Dynamic Duo",
				AttackEffect = "Slash",
				Bio = "These gamers are here to hang out and have fun. Don't think they are gonna go easy though. Who knows what they might do!"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Red = 3, Blue = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The anthrests must be stopped. The dwarves and the World of Wood had already fallen."
	},
	["Crystal of Eisenhower's Grief"] = {
		Id = 4359061215,
		Name = "Crystal of Eisenhower's Grief",
		AltCards = {
			Wipeout = {
				Id = 8573658825,
				Name = "Wipeout",
				Bio = "Our duo start their journey at the Crossroads, engaging whoever they spot in combat."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		TokenDiscard = true,
		Fading = true,
		Archetype = "Crystal",
		Effect = {
			Name = "Temporal Halo",
			Description = "Your opponent can't attack next turn. Discard all crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "BypassAttack" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "I will stop people from losing what I have."
	},
	["Crystal of Zanzel's Remorse"] = {
		Id = 4359041606,
		Name = "Crystal of Zanzel's Remorse",
		AltCards = {
			["Dynamic Victory"] = {
				Id = 8573658312,
				Name = "Dynamic Victory",
				Bio = "“Ah, seems we won the war... eh Stevie boy?”\n“Yea, I guess we did Obamers...”\nAs Obama and Steve stared at all the dead bodies, they felt accomplished, with pride flowing in their little bloxy veins. They left looking for a place to rest soon after."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		TokenDiscard = true,
		Fading = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Crystal",
		Effect = {
			Name = "Temporal Halo",
			Description = "Until your next turn, your opponent skips all triggers that trigger when a fighter's cast. That player can't cast action, gear, or terrain cards. Destroy all Crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "BypassAction" },
				{ "BypassTerrain" },
				{ "BypassCasts" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "I will stop people from doing what I've done."
	},
	["Crystal of Ghashendex's Hope"] = {
		Id = 4359040224,
		Name = "Crystal of Ghashendex's Hope",
		AltCards = {
			Stargaze = {
				Id = 8573659418,
				Name = "Stargaze",
				Bio = "With the day nearing its end, they sit by the grass plains, observing the starry sky. \"Do you see the Floppa star over there?\", Obama asked."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		TokenDiscard = true,
		Fading = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Crystal",
		Effect = {
			Name = "Temporal Halo",
			Description = "Your opponent can't cast fighters until their next end step. Destroy all Crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "BypassSummon" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "It will stop people from despairing as it's despaired."
	},
	VertexArray = {
		Id = 17791088555,
		Name = "VertexArray",
		AltCards = {
			["VertexArray-Sun"] = {
				Id = 9284767097,
				Name = "Waterlimon",
				AttackEffect = "MagicYellow",
				Bio = "\"WHOEVER STABS MY BACK SHALL BE BLINDED BY ORANGE JUICE!\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 7 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Summon a copy of the last dead enemy fighter.",
			Type = "OnSummon",
			Power = { { "LastDeath", 30, "Opponent" } },
			Target = "Opponent"
		},
		Bio = "In the blink of an eye, a Zombie Rush."
	},
	HeavenLogin = {
		Id = 10279308657,
		Name = "HeavenLogin",
		AltCards = {
			["HeavenLogin-C"] = {
				Id = 10279309540,
				AttackEffect = "Divinity",
				Bio = "You want forgiveness? Get religion."
			},
			["Leepy, Soulbound"] = {
				Id = 12128585937,
				Name = "Leepy, Soulbound",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "\"Calling the thunder, just wait a bit...\""
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1 },
		Archetype = "",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: It joins the group of a target fighter.",
			Type = "OnSummon",
			Power = { { "CopyArchetype", 0, "Single" } },
			Target = "Ally"
		},
		Bio = "Compared to modern roblox, the crimes of this copycat ain't much."
	},
	Patacorow = {
		Id = 9964863680,
		Name = "Patacorow",
		AltCards = {
			["Patacorow-E"] = {
				Id = 9964865916,
				AttackEffect = "MagicRed",
				Bio = "Yep, he's the guy that made all those egg hats. Thankless job, really. Comes with dental at least so he can't complain, though."
			},
			["Arthur, Economic Stabilitator"] = {
				Id = 9965503910,
				Name = "Arthur, Economic Stabilitator",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"Sorry, My Beloved, but a lawyer's saying goes : 'Every gain has a loss.'\"."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever your opponent discards a card other than their first one each turn: Destroy the oldest card in their hand.",
			Type = "OnEnemyDiscard",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Him", 2, 999, "DiscardCount" }
		},
		Bio = "Are we getting anywhere with this!?"
	},
	Loleris = {
		Id = 116087402937840,
		Name = "Larry Longhorn",
		AltCards = {
			["Free the Vampire Prince"] = {
				Id = 14387357273,
				Name = "Free the Vampire Prince",
				AttackEffect = "VampBite",
				Commissioner = { 79650716, 1016956771 },
				AltArt = true,
				PremiumArt = 100,
				Bio = "Welcome watcher of illusion, to my castle of confusion..."
			},
			["Loleris-V"] = {
				Id = 15941935754,
				Name = "Botanical Bride",
				AttackEffect = "Punch",
				Bio = "\"It's rude to not accept flowers from a lady.\""
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card dies: Give yourself 2 Blue or Red action cards.",
			Type = "OnDeath",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" }
			},
			Target = "Ally"
		},
		Bio = "Copied from the times of the New Frontier, ready to try his deadeye on the Final Frontier"
	},
	Davidii = {
		Id = 4789666672,
		Name = "Davidii",
		AltCards = {
			Leepy = {
				Id = 8542090758,
				Name = "Leepy Persona Detective",
				AttackEffect = "Revolver",
				AltArt = true,
				Bio = " Now I face out, I hold out / I reach out to the truth of my life / Seeking to seize on the whole moment to now break away."
			},
			["Davidii-Hal"] = {
				Name = "Sherlock Davidii",
				AttackEffect = "Revolver",
				Id = 78065297578666,
				Bio = "Curious. The mask appears intanct, despite the bloodshed... This must be a clue."
			},
			["Rifo Quest Rifo"] = {
				Id = 98798674623704,
				Name = "Big Tee Danika",
				AttackEffect = "Whirlpool",
				AltArt = true,
				Bio = "art quality = alex's value as a human being"
			},
			Mist0rSw3g = {
				Id = 130737435962191,
				Name = "Mist0rSw3g",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 515,
				Bio = "?<br/>?<br/>?"
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Give yourself a Green card, except it's fleeting and inert when discarded.",
			Type = "OnEnd",
			Power = { { "RandomAdd", "MonoOnlyorGreenCost Green" } },
			EffectFleeting = true,
			EffectInert = true,
			Target = "Ally"
		},
		Bio = "You have to keep your wits about you if you want to survive."
	},
	["Unplumbed Lead"] = {
		Id = 8778692196,
		Name = "DeadzoneZackZak",
		AltCards = {
			["DeadzoneZackZak-Hal"] = {
				Id = 95737433728357,
				Name = "DeadmanZackZak",
				AttackEffect = "Rifle",
				Summonant = "DeadzoneZackZak-Hal",
				Bio = "So this is how I go out, huh? As an optional diary piece for another player."
			},
			["Deadly Dumb Duo"] = {
				Id = 11966549749,
				Name = "Deadly Dumb Duo",
				AttackEffect = "Katana",
				AltArt = true,
				Summonant = "Deadly Dumb Duo",
				Bio = "Not to be trusted with sharp weaponry."
			},
			["DeadzoneZackZak-AWIH"] = {
				Id = 17600728245,
				Name = "Eye of Mirror 314",
				AttackEffect = "MagicBlue",
				Summonant = "DeadzoneZackZak-AWIH2",
				Bio = "They say self-reflection is a good way to learn the truth about yourself."
			},
			["DeadzoneZackZak-AWIH2"] = {
				Id = 122684399241073,
				Name = "Mirror 314",
				AttackEffect = "StalkerScratch",
				Summonant = "DeadzoneZackZak-AWIH",
				Bio = "?flesti tuoba suoiruc osla saw noitcelfer ruoy fi derednow reve uoy evaH"
			},
			["Unplumbed Lead-Mango"] = {
				Name = "Bum",
				Id = 138479205335933,
				AttackEffect = "Punch",
				Summonant = "Unplumbed Lead-Mango",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"MY SALES ARE LOW AND MY MOOD IS TOO\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "SMG",
		Color = "Blue",
		Cost = { Blue = 7 },
		Summonant = "Unplumbed Lead",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a copy of this card.\nWhenever this fighter destroys another: Draw a card.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnDestroy = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Forever unturned."
	},
	["Cotton Candy Lion"] = {
		Id = 8057682395,
		Name = "SnickTrix",
		CopyBodge = "Cotton Candy Lion",
		AltCards = {
			["Gingerbread Man"] = {
				Id = 10279366747,
				Name = "Gingerbread Man",
				AttackEffect = "Jab",
				Bio = "A gingerbread man sits in a gingerbread house. Is the house made of flesh, or is he made of house? He screams, for he does not know."
			}
		},
		Health = 50,
		Power = 800,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		DamageMitigation = 200,
		Effect = {
			Name = "Pyrotechnics",
			Description = "This card takes 200 less damage from effects.",
			Type = "Null",
			Power = { { "Draw", 0, "Opponent" } },
			Target = "Ally"
		},
		Bio = "Farming sure takes your mind off the high chance you've got of falling to your death if you slip two meters away from where you stand."
	},
	Essarrgee = {
		Id = 10279276169,
		Name = "essarrgee",
		AltCards = {
			["Essarrgee-E"] = {
				Name = "Epikrika Egg Reviewer",
				AttackEffect = "Jab",
				Id = 9087697244,
				Bio = "Only a small part of their rating comes from the design, most of it is based off if they bounce well."
			}
		},
		Health = 900,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever an effect draws you a card: This card gains 250 Power.",
			Type = "OnAllyDraw",
			Power = { { "Strengthen", 250 } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "Originally known as Somerandomguysrg. Fan of horror. Made PAX."
	},
	Treas0ner = {
		Id = 9925838734,
		Name = "Ragoozer",
		AltCards = {
			["Treas0ner-L"] = {
				Name = "Rogue Lineage Ragoozer",
				AttackEffect = "Katana",
				Bio = "This game is incredibly difficult with little to no hand holding. Enter at your own risk. ",
				Id = 9925837643
			},
			happyvince999 = {
				Name = "happyvince999",
				AltArt = true,
				Id = 9925836474,
				Bio = "632146H"
			}
		},
		Health = 1100,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 8 },
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: This card gains 200 Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			Target = "Self"
		},
		Bio = "Make games you want to play."
	},
	["Mysterious UFO"] = {
		Id = 4815665033,
		Name = "1dev3",
		AltCards = {
			["S1apK1ng, The Forgotten Outlaw"] = {
				Name = "S1apK1ng, The Forgotten Outlaw",
				Id = 7357112389,
				AltArt = true,
				AttackEffect = "Gun",
				Bio = "Watch and learn."
			},
			["1dev3-Hal"] = {
				Id = 120923403096127,
				AttackEffect = "TimeBomb",
				Bio = "Must. Slay. Undead."
			}
		},
		Health = 250,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Shotgun",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Alien Beef Serum",
			Description = "When this card is cast: Unlock a target fighter and deal 250 damage to it.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Damage", 250 }
			},
			Target = "Single"
		},
		Bio = "Must. Harvest. Beef."
	},
	Robloxian255 = {
		Id = 5136590763,
		Name = "Creptiqal",
		AltCards = {
			EdgeGamingDoBePayingTheBillsTho = {
				Id = 9336150630,
				AttackEffect = "Jab",
				Name = "Gebbo",
				AltArt = true,
				Bio = "Aye, want some juice."
			},
			["The Strongest Tom"] = {
				Id = 8208746358,
				Name = "The Strongest Tom",
				AltArt = true,
				Bio = "'Cheating, bribing and begging for wins? That's how the losers think. Every battle I win is simply from pure skills.'"
			}
		},
		CopyBodge = "Robloxian255",
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3, Red = 1 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever this card attacks: You gain {B}{Y}.",
			Type = "OnAttack",
			Power = {
				{ "Yellow", 1 },
				{ "Blue", 1 }
			},
			Target = "Ally"
		},
		Bio = "He used to be a nice guy. Then acid burned half of his body. Anybody would be angry after that."
	},
	["Plushie Panda"] = {
		Id = 5939013952,
		Name = "IronInforcer",
		Health = 150,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		EffectAnimation = "DrinkMug",
		Effect = {
			Name = "Panda Amp",
			Description = "When this card is cast: A target fighter gains 250 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 250 },
				{ "Heal", 250 }
			},
			Target = "Single"
		},
		Bio = "Welcome kind sir. What'll it be for today? Just the usual?"
	},
	Havemeat = {
		Id = 4564790175,
		Name = "Havemeat",
		AltCards = {
			["Haru, the Easter Queen"] = {
				Id = 8650627084,
				Name = "Haru, the Easter Queen",
				AttackEffect = "MagicGreen",
				Bio = "\"Happy Easter Jam! I hope you can stop asking for me now...\""
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, an effect gives you a card: This card gains 200 power.",
			Type = "OnAllyPut",
			Power = { { "Strengthen", 200 } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "Best known for his Havemeat Minigames and WordFall."
	},
	Ravenshield = {
		Id = 10269143654,
		Name = "Ravenshield",
		AltCards = {
			["Ravenshield-ET"] = {
				Name = "Carl's Stud Bag",
				AttackEffect = "StudBlast",
				Id = 16446076032,
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Bio = "Courier's work's not so bad for someone who loves traveling."
			},
			["Ravenshield-Sun"] = {
				Name = "Ravenshield of Liberty",
				Id = 17760787554,
				Bio = "O say can you see..."
			},
			["The Raindeer"] = {
				Name = "The Raindeer",
				Commissioner = { "Apiri653" },
				Id = 140001801580128,
				AltArt = true,
				PremiumArt = 874,
				Bio = " Remember that a rainbow is waiting at the end of every storm."
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 1, Yellow = 1 },
		EffectVariable = 2,
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Give yourself a fleeting Nascent Stud. Then draw a card if there's 4 colours among cards in your baseplate.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Add", "Addant" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally",
					MetaData = { Fleeting = true }
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					EffectRequirement = { "Chromatic", "AllyGenZone", 4, 10 }
				}
			}
		},
		Bio = "Elite Builder."
	},
	rastamypasta = {
		Id = 10279079044,
		Name = "rastamypasta",
		AltCards = {
			["rastamypasta-E"] = { Name = "RastaMyBreakfast", Id = 16738204875, Bio = "" },
			["Java and Paper, STING Operatives"] = {
				Name = "Java & Paper, STING Operatives",
				Id = 137888438935691,
				AttackEffect = "Shotgun",
				AltArt = true,
				Bio = "idk bro just keep firing"
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Charge = true,
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Change the colour of all allied fighters to Yellow and remove all inertia on them. All allied tokens gain 100 Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "ReplaceColor", "Yellow", "Ally" },
				{ "Heal", 100, "AllyToken" },
				{ "Strengthen", 100, "AllyToken" }
			},
			Target = "Ally"
		},
		Bio = "Painting her way to a better world."
	},
	GodzGalaxy = {
		Id = 4359031797,
		Name = "GodzGalaxy",
		AltCards = {
			["GodzGalaxy-Sun"] = {
				Name = "Jeff, Host of Outlaster",
				Id = 9144429284,
				AttackEffect = "Jab",
				Bio = "And the person voted out of the game is..."
			},
			Butcher = {
				Name = "Butcher",
				Id = 129884521772046,
				AttackEffect = "Crowbar",
				AltArt = true,
				Bio = "We'll cross that bridge when we burn it."
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 7 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a fighter is cast: Destroy all token fighters.",
			Type = "OnAnySummon",
			Power = { { "Destroy", 30, "Token" } },
			Target = "Ally"
		},
		Bio = "Only the strong can endure the tribal council. That's the way it's been, and the way it always will be."
	},
	["Scion of the Price Floor"] = {
		Id = 10243375516,
		Name = "Scion of the Price Floor",
		AltCards = {
			["Scion of the Price Floor-C"] = {
				Name = "Scion of Black Friday",
				Id = 10243377108,
				Bio = "Why have a 50% discount when I can get a 100% discount?"
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Each card your opponent casts on their next turn using {W} costs an additional {W}{W}.",
			Type = "OnSummon",
			Power = { { "Tax", 2 } },
			Target = "Opponent"
		},
		Bio = "You did NOT get that shirt for free."
	},
	["Cast Through Time"] = {
		Id = 10281244701,
		Name = "Cast Through Time",
		AltCards = {
			["Cast Through Time-E"] = {
				Name = "Egg of Time",
				Id = 10281242177,
				Bio = "The spirit of Egg Hunting will always live on, from generation to generation."
			},
			["47-53-54-59-47-53-44-59-54-51-5b"] = {
				Id = 17440640053,
				Name = "47-53-54-59-47-53-44-59-54-51-5b",
				AltArt = true,
				PremiumArt = 263,
				Bio = "So many masks up on the shelf, I think this time I might need real help."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 5 },
		EffectAnimation = "ProphetClock",
		Effect = {
			Name = "Temporal Halo",
			Description = "Reset the stats of all fighters.\nEnd the turn.",
			Type = "OnSummon",
			Power = {
				{ "Reset" },
				{ "EndTurn", 30, "Ally" }
			},
			Target = "All"
		},
		Bio = "Eisenhower awoke in a strange forest. Was he sent backwards, or was the forest sent forwards?"
	},
	["The Wanwood Dryad"] = {
		Id = 5507372185,
		Name = "The Wanwood Dryad",
		AltCards = {
			["The Wanwood Dryad-Xmas"] = {
				Id = 8100778578,
				AttackEffect = "Storm",
				Bio = "It's not the regrets of the past or the uncertainty of the future that matter most. It's the good we can do today, for all those we care about."
			},
			THC4 = {
				Id = 10507472296,
				AttackEffect = "Tempest",
				Bio = "Being one with the forest allows you to appreciate the beauty of all of it's creatures."
			},
			["The Wanwood Dryad-Precon"] = {
				Id = 17860392234,
				Name = "Guardians of Wood",
				AttackEffect = "Storm",
				Bio = "We are the world."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Red = 2, Green = 2, Blue = 2, Neutral = 2 },
		Archetype = "World of Wood",
		EffectVariable = 300,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Shuffle all World of Wood cards in your graveyard into your deck.\nWhenever this card attacks: Summon a copy of your terrain, except it's a 300/300 Fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", "World of Wood", "Nil" }
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Ally", "Deck_Ally", true, false, 99 },
							"Self"
						}
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 300, "Nil" }
						},
						{ "Summon", "PlayerTerrain", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Come, Eisenhower. The queen requests your presence."
	},
	["Heartwood Defender"] = {
		Id = 9964806292,
		Name = "Heartwood Defender",
		AltCards = {
			ITStheGreat17 = {
				Name = "ITStheGreat17",
				Id = 9964807000,
				AltArt = true,
				Bio = "\"I didn't know The World of Wood was in Australia.\""
			},
			Cattuwu = {
				Name = "Cattuwu",
				Id = 9964807807,
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "\"Well, the Heartwood Defender chopped down that tree and I took it as the forest was all bad when it was just one tree. Whoops, guess there's a thing called Maid See, Maid Do now, huh?\""
			}
		},
		Health = 500,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Axe",
		Color = "Red",
		Cost = { Neutral = 4 },
		Archetype = "World of Wood",
		Effect = {
			Description = "When this card is cast: Search your deck for 'The World of Wood.'\nOnce each turn, whenever you cast a terrain from the World of Wood: This card deals 300 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "The World of Wood", "Ally" } },
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = { { "Damage", 300 } },
					Target = "SingleEnemy",
					Archetype = "World of Wood",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "This tree has been infested by the futuristic filth. Chopping down an ancient legacy is necessary to preserve the World of Wood."
	},
	["The Blighted Fens"] = {
		Id = 4841675345,
		Name = "The Blighted Fens",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 2 },
		Terrain = true,
		Archetype = "World of Wood",
		Terrariant = "Fens Terrain",
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you discard a card from the World of Wood: Deal 100 damage to all enemy fighters. All allied fighters gain 100 Power.",
			Type = "OnAllyDiscard",
			Power = {
				{ "Strengthen", 100, "Ally" },
				{ "Damage", 100, "Opponent" }
			},
			Target = "Archetype",
			Archetype = "World of Wood",
			TurnTriggerLimit = 1
		},
		Bio = "The outskirts of the World of Wood were the first to be overlayed through time. Their bark is infested with the eggs of the Anthrests."
	},
	["Cambium Tender"] = {
		Id = 4730429975,
		Name = "Cambium Tender",
		AltCards = {
			DevDevNU1 = {
				Name = "DevDevNU1",
				AttackEffect = "Flame",
				Id = 7644601341,
				AltArt = true,
				Bio = "He waddles, he wiggles, he huddles, but most of all, he enjoys watching you struggle."
			}
		},
		Health = 500,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 4 },
		Archetype = "World of Wood",
		Effect = {
			Description = "When this card is cast: Search your deck for 'The Blighted Fens.'\nOnce each turn, whenever you cast a World of Wood terrain: All allied World of Wood fighters gain 200 Health.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "The Blighted Fens", "Ally" } },
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = { { "Heal", 200 } },
					Target = "AlliedArchetype",
					Archetype = "World of Wood",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"We, an ancient people, have been transported from the past to the present. It saddens me that the World of Wood didn't survive, but it pleases me that it has a second chance.\"\""
	},
	["The Great Tree"] = {
		Id = 4899449646,
		Name = "The Great Tree",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 2 },
		Terrain = true,
		Archetype = "World of Wood",
		Terrariant = "Tree Terrain",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a fighter from the World of Wood: All allied fighters from the World of Wood gain 100 Health. You gain {W}{W} and 300 life.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 100, "AlliedArchetype" },
				{ "Neutral", 2 },
				{ "Cost", -300 }
			},
			Archetype = "World of Wood",
			Target = "Ally"
		},
		Bio = "The seat of power of the Wanwood Dryad. As long as it stands, every denizen of the World of Wood is forced to defend it."
	},
	["Xylem Student"] = {
		Id = 4815993617,
		Name = "Xylem Student",
		AltCards = {
			Evo51 = {
				Name = "Evo51",
				Id = 7424191981,
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"Xylem Student! MY WIN CON!!!\""
			}
		},
		Health = 500,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Archetype = "World of Wood",
		Effect = {
			Description = "When this card is cast: Search your deck for 'The Great Tree.'\nWhenever you cast a World of Wood terrain: Draw a card.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "The Great Tree", "Ally" } },
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					Archetype = "World of Wood"
				}
			}
		},
		Bio = "Everyone is worried about the Anthrestation epidemic, yet I see beyond that. What of the spacemen? What of the scientist?"
	},
	["The World of Wood"] = {
		Id = 4899450760,
		Name = "The World of Wood",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 2 },
		Terrain = true,
		Archetype = "World of Wood",
		Terrariant = "World Terrain",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied fighter from the World of Wood dies: Draw a card.",
			Type = "OnAllyDeath",
			Power = { { "Draw", 1 } },
			Archetype = "World of Wood",
			Target = "Ally"
		},
		Bio = "The centre of the World of Wood. In 2000 years, a meteor will descend from the heavens, destroying wood as we know it. Maybe the temporal halo wasn't such a bad thing after all."
	},
	["The Transcendant Voidoaks"] = {
		Id = 5983837251,
		Name = "The Transcendant Voidoaks",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 7, Red = 2, Green = 2, Blue = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Terrain = true,
		Archetype = "World of Wood",
		Terrariant = "Voidoak Terrain",
		AlternateCostRequirement = { "Playertable", "Me", 0, 0, "Wanwood" },
		RandomAddBlock = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card ignoring its {W} cost if you've cast all other terrains from the World of Wood this game.\nAt the start of each player's turn: Unlock all allied fighters. They gain 100 health and power. Search your deck for 'The Wanwood Dryad.'",
			Type = "OnStart",
			Power = {
				{ "Unlock", 9999 },
				{ "Strengthen", 100 },
				{ "Heal", 100 },
				{ "Tutorfor", "The Wanwood Dryad", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "It was these woods, warped by coil and stone, that Eisenhower was interested in. Such energy needed to keep them afloat! That power could be used for anything! Even..."
	},
	["Anthrested Orbiter"] = {
		Id = 9964705634,
		Name = "Anthrested Orbiter",
		AltCards = {
			["Anthrested Sacrificer"] = {
				Name = "Anthrested Sacrificer",
				AttackEffect = "British",
				Id = 9965558238,
				Bio = "Let's all just agree that the anti-human sacrifice fandom is just as annoying as the pro-human sacrifice fandom, OK?"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3 },
		Archetype = "Anthrest",
		AnthrestTide = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 0: Advance it to 1. All allied Anthrested fighters gain 200 power.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Strengthen", 200 }
			},
			EffectRequirement = { "Playertable", "Me", 0, 0, "AnthrestTide" },
			Target = "AlliedArchetype"
		},
		Bio = "I love you, Eri-chan! And your bath water!"
	},
	["Anthrested War Mech"] = {
		Id = 5821491009,
		Name = "Anthrested Simplifier",
		AltCards = {
			["Anthrested Zealot"] = {
				Name = "Anthrested Zealot",
				AttackEffect = "Scratch",
				Id = 7622048487,
				Transformant = "Anthrested Abomination",
				Bio = "This card is an alt-art of Anthrested Simplifier"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 1, Green = 1, Yellow = 1 },
		Archetype = "Anthrest",
		AnthrestTide = 1,
		Transformant = "Anthrested Knight",
		CustomReminder = {
			["Anthrested Knight"] = "A colourless fighter. When it dies, ALL anthrested fighters gain 150 health."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 1: Advance it to 2. Deal 200 damage to a target fighter. Transform it into an Anthrested Knight.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Damage", 200 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Playertable", "Me", 1, 0, "AnthrestTide" },
			Target = "Single"
		},
		Bio = "The Dwarves sent a robot our way? Do I have to spell it out? Make it your friend, and send it straight back. You're not very useful, hun."
	},
	["Anthrested Chopper"] = {
		Id = 6916827873,
		Name = "Anthrested Chopper",
		AltCards = {
			["Anthrested Ascended"] = {
				Name = "Anthrested Ascended",
				AttackEffect = "Gravity",
				Id = 7776930988,
				Bio = "\"Be not afraid, handsome.\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 1, Green = 1, Yellow = 1, Red = 2 },
		Archetype = "Anthrest",
		AnthrestTide = 2,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 2: Advance it to 0. Deal 300 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Damage", 300, "Opponent" }
			},
			EffectRequirement = { "Playertable", "Me", 2, 0, "AnthrestTide" },
			Target = "NotArchetype"
		},
		Bio = "Why does everyone complain when we make them beautiful? Do they not want perfect jawlines? Chisled features? Rocket cannons?"
	},
	["Anthrested Blockhead"] = {
		Id = 5019180502,
		Name = "Anthrested Blockhead",
		AltCards = {
			["Anthrested Doomsayer"] = {
				Id = 7493956717,
				Name = "Anthrested Doomsayer",
				Bio = "SEE! I was RIGHT! They DO live inside our skin... Why does being right feel so wrong..."
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Neutral = 3 },
		Archetype = "Anthrest",
		AnthrestTide = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 0: Advance it to 1. You gain {R}{Y}.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Red", 1 },
				{ "Yellow", 1 }
			},
			EffectRequirement = { "Playertable", "Me", 0, 0, "AnthrestTide" },
			Target = "Ally"
		},
		Bio = "\"Can you believe it? This whole...'anthro' nonsense. The Dryad lost her marbles, it's just a flu like any other. I feel fine, handsome.\""
	},
	["Anthrestation Infestation"] = {
		Id = 5821617543,
		Name = "Anthrested Consumer",
		AltCards = {
			["Anthrested Burster"] = {
				Id = 124582986901874,
				Name = "Anthrested Burster",
				AttackEffect = "Scratch",
				Transformant = "Anthrested Abomination",
				Bio = "Nature is so beautiful..."
			},
			["Shizophrenic Slickster"] = {
				Id = 8208747701,
				Name = "Schizophrenic Slickster",
				AttackEffect = "Jab",
				AltArt = true,
				Transformant = "Anthrested Hallucination",
				Bio = "<i>A man's mind deprived of any true grasp of reality. Visages of faces familiar and unfamiliar swarm his vision. The ones he knew were only but a few. His mind was finally broken after all these days of this parasitical infection taking his mind under duress.</i>"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Yellow = 1 },
		BypassOverdrive = true,
		Archetype = "Anthrest",
		AnthrestTide = 1,
		Transformant = "Anthrested Knight",
		CustomReminder = {
			["Anthrested Knight"] = "A colourless fighter. When it dies, ALL anthrested fighters gain 150 health."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 1: Advance it to 2. A target fighter loses 200 power. Transform it into an Anthrested Knight.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Weaken", 200 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Playertable", "Me", 1, 0, "AnthrestTide" },
			Target = "Single"
		},
		Bio = "Hiiiiiii, handsome. Your chest is just throbbing with excitement..."
	},
	["Anthrested Tree"] = {
		Id = 5832333947,
		Name = "Anthrested Tree",
		AltCards = {
			["Anthrested Spider"] = {
				Name = "Anthrested Spider",
				AttackEffect = "Scratch",
				Id = 7675989765,
				Summonant = "Anthrested Spider",
				Bio = "This card is an alt-art of Anthrested Tree."
			},
			["Crimson Sisters"] = {
				Name = "Crimson Sisters",
				Commissioner = { "" },
				Id = 117394055855749,
				AltArt = true,
				PremiumArt = 882,
				Summonant = "Crimson Sisters",
				Bio = "\"\""
			}
		},
		Health = 1400,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Yellow = 1, Green = 2 },
		Archetype = "Anthrest",
		AnthrestTide = 2,
		Summonant = "Anthrested Tree",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast or dies, if your Anthrestation is at 2: Advance it to 0. Summon a 400/400 clone of it that's fading.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Anthrest", 1, "Ally" },
						{ "Summon", "Summonant" }
					},
					EffectRequirement = { "Playertable", "Me", 2, 0, "AnthrestTide" },
					MetaData = { Power = 400, Health = 400, Fading = true },
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Anthrest", 1, "Ally" },
						{ "Summon", "Summonant" }
					},
					EffectRequirement = { "Playertable", "Me", 2, 0, "AnthrestTide" },
					MetaData = { Power = 400, Health = 400, Fading = true },
					Target = "Ally"
				}
			}
		},
		Bio = "This \"World of Wood\" is so bored with itself. So quiet. So dead inside. It needs a facelift!"
	},
	["Anthrested Fashion Designer"] = {
		Id = 5019181994,
		Name = "Anthrested Fashion Designer",
		AltCards = {
			["Anthrested Cultist"] = {
				Id = 8822686843,
				Name = "Anthrested Cultist",
				AttackEffect = "MagicYellow",
				Bio = "Oh my gosh, you're soooo cute! Here, you're invited to Eris' Halloween Party! Don't have a costume? We'll make you one."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Archetype = "Anthrest",
		AnthrestTide = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 0: Advance it to 1. All allied Anthrested Fighters gain 200 Health.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Heal", 200 }
			},
			EffectRequirement = { "Playertable", "Me", 0, 0, "AnthrestTide" },
			Target = "AlliedArchetype"
		},
		Bio = "Are you more of a hot pants or a corset fan, hun?"
	},
	["Passion for Fashion"] = {
		Id = 13278759217,
		Name = "Anthrested Incubator",
		AltCards = {
			["Anthrested Gorgon"] = {
				Name = "Anthrested Gorgon",
				AttackEffect = "Tempest",
				Id = 7541885891,
				Summonant = "Anthrested Abomination",
				Bio = "\"I’m not picky about who wants to become beautiful, hun. But the less…blocks there are, the better.\""
			},
			JennyHailings = {
				Name = "JennyHailings",
				AttackEffect = "MagicYellow",
				Id = 9313194589,
				AltArt = true,
				Summonant = "Your Reflection",
				Bio = " If you choose the other door, you are no better than us. Choose the right door, you'll be beautiful. We know you can."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement.",
			["Anthrested Knight"] = "A Colourless fighter. When it dies, ALL Anthrests gain 150 Health."
		},
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Green = 1 },
		AlternateCost = { Neutral = 0 },
		AlternateCostRequirement = { "Playertable", "Me", 2, 0, "AnthrestTide" },
		ChargeRequirement = { "Playertable", "Me", 0, 0, "AnthrestTide" },
		Archetype = "Anthrest",
		AnthrestTide = 1,
		Summonant = "Anthrested Knight",
		Effect = {
			Name = "Temporal Halo",
			Description = "If your Anthrestation is at 0, this card has Haste. If your Anthrestation is at 2, cast this card for free. When this card is cast, if your Anthrestation is at 1: Advance it to 2. Summon a 200/200 Anthrested Knight.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Summon", "Summonant" }
			},
			EffectRequirement = { "Playertable", "Me", 1, 0, "AnthrestTide" },
			Target = "Ally"
		},
		Bio = "Wear your dress tight enough to show you're a woman, but loose enough to show you're a lady."
	},
	["Anthrested Dragon"] = {
		Id = 5832333430,
		Name = "Anthrested Dragon",
		AltCards = {
			["Anthrested Serpent"] = {
				Name = "Anthrested Serpent",
				AttackEffect = "Scratch",
				Id = 7521076276,
				Bio = "\"You just have to meet Eri, handsome! She’ll be delighted to help those who want to become alluring to the eyes!\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Flare",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Green = 1, Yellow = 2 },
		Archetype = "Anthrest",
		AnthrestTide = 2,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if your Anthrestation is at 2: Advance it to 0. Draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Draw", 2 }
			},
			EffectRequirement = { "Playertable", "Me", 2, 0, "AnthrestTide" },
			Target = "Ally"
		},
		Bio = "The poor thing didn't have enough time to scream before the plastic skin covered up their scaly body."
	},
	["Cycle the Contagion"] = {
		Id = 5832348590,
		Name = "Cycle the Contagion",
		AltCards = {
			["Cycle the Contagion-Hal"] = {
				Id = 7578859515,
				Effect = {
					Power = {
						{ "Anthrest", 1, "Ally" },
						{ "Add", "Cycle the Contagion-Hal" },
						{ "Draw", 1 },
						{ "BypassAction" }
					}
				},
				Bio = "Beauty is in the eye of the beholder. Join us and you just might see what perfection is."
			},
			["Sleep Deprivation"] = {
				Id = 15310036940,
				Name = "Sleep Deprivation",
				AltArt = true,
				Commissioner = { 292700370, 297087291 },
				PremiumArt = 159,
				Effect = {
					Power = {
						{ "Anthrest", 1, "Ally" },
						{ "Add", "Sleep Deprivation" },
						{ "Draw", 1 },
						{ "BypassAction" }
					}
				},
				Bio = "Paranoia, hallucinations, slurred speech, sluggish movements, mood swings, redness of the eyes, and increased risk of stroke yet you won't remember what we're talking about when you're down & out now would you? Go to sleep."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 2 },
		Archetype = "Anthrest",
		StartGameRequirement = { "Deck", "Ally", 10, 99, "IndividualArchetypeAnthrest" },
		Requirement = { "StartDeckChecks" },
		AddBlock = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if your starting deck has 10 different Anthrested cards.\nYour Anthrestation advances to its next stage.\nGive yourself a copy of this card, then draw a card.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1, "Ally" },
				{ "Add", "Cycle the Contagion" },
				{ "Draw", 1 },
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "You are lucky if you merely die to being anthrested. As their plastic disease melts down your body and brain, some are unfortunate enough to have their corpses reanimated to join the Anthrested Horde."
	},
	["Princess Erisyphia, Master Orthotist"] = {
		Id = 4720392800,
		Name = "Princess Erisyphia, Master Orthotist",
		AltCards = {
			Erisyphia = {
				Name = "Erisyphia",
				AttackEffect = "Gravity",
				AltArt = true,
				Id = 106034425043961,
				Bio = "#ZanzelIsOverParty"
			},
			THC1 = {
				Id = 10507473064,
				Name = "Erisyphia",
				AttackEffect = "Gravity",
				Bio = "What's wrong, hun? Isn't my true form beautiful?"
			},
			["Slickster, Anthrested Janitor"] = {
				Name = "Slickster, Anthrested Janitor",
				AltArt = true,
				Id = 80572734680268,
				AttackEffect = "Slash",
				Transformant = "Anthrested Horde",
				Bio = "Yet sometimes the other faces have even more power than the man or woman face. These faces, however, can sometimes be a failed product born from the depths of hell."
			},
			["Free Spirited Oni, Ibuki-Douji"] = {
				Name = "Free Spirited Oni, Ibuki-Douji",
				AltArt = true,
				Id = 9307662754,
				AttackEffect = "Slash",
				Transformant = "Japanese Goblin",
				Bio = "Forgathering Dream, Illusion, and Thus a Night Parade of a Hundred Demons."
			},
			["Princess Erisyphia, Master Orthotist-Hal"] = {
				Name = "Erisyphia the Transcendant",
				Id = 11281338006,
				AttackEffect = "Gravity",
				Bio = "\"My knight in blinding armor\n\t\t\t\t\t\t\tWhose courage pushes hope away\""
			},
			["Princess Erisyphia, Master Orthotist-Precon"] = {
				Name = "Anthrest Unto Death",
				Id = 16932164246,
				AttackEffect = "Gravity",
				Transformant = "Anthrested Sepulcher",
				Bio = "A mysterious and dangerous anthrested being, seen as the \"reaper\" that shouldn't exist in reality."
			},
			["Crimson Hawk Moth"] = {
				Id = 95185513651665,
				Name = "Crimson Hawk Moth",
				AttackEffect = "Gravity",
				AltArt = true,
				PremiumArt = 493,
				Bio = ""
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 3, Green = 3, Yellow = 3 },
		Archetype = "Anthrest",
		TransformImmune = true,
		AddBlock = true,
		Transformant = "Anthrested Knight",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied fighter is cast, if your Anthrestation has advanced 9 times this game: Transform all fighters into Anthrested Knights. All enemy fighters lose 100 health and power.",
			Type = "OnAllySummon",
			Power = {
				{ "Transform", "Transformant", "All" },
				{ "Weaken", 100 },
				{ "Damage", 100 }
			},
			EffectRequirement = { "Playertable", "Me", 9, 9999, "AnthrestTotal" },
			Target = "Opponent"
		},
		Bio = "\"That Zanzel lady talks about spirits beyond this world. Should they exist, surely they would love a facelift.\""
	},
	["Anthrested Knight"] = {
		Id = 9709422545,
		Name = "Anthrested Knight",
		AltCards = {
			["Anthrested Horde"] = {
				Name = "Anthrested Horde",
				AttackEffect = "Scratch",
				Id = 16128426804,
				Bio = "When one comes in contact with the horde, the most productive thing they can do is get onto their knees and pray for salvation and not conversion."
			},
			["Anthrested Abomination"] = {
				Name = "Anthrested Abomination",
				AttackEffect = "Scratch",
				Id = 10184103002,
				Bio = "\"Hun, you only fear the beautiful because it’s different from what you’ve seen and experienced before. But what if all but one of you became as dazzling as us? Doesn’t that become the new norm?\""
			},
			["Anthrested Hallucination"] = {
				Name = "Anthrested Hallucinations",
				AttackEffect = "Jab",
				Id = 10184090204,
				Bio = "\"When will their torment finally end? When will I be freed from the shackles of pity? If only their voices would stop. If only their afterimages disappear. If only I disappeared, it will all finally be over.\""
			},
			["Japanese Goblin"] = {
				Name = "Japanese Goblin",
				Id = 9307663100,
				Bio = "WE ARE JAPANESE GOBLIN."
			},
			["Your Reflection"] = {
				Name = "Your Reflection",
				AttackEffect = "Jab",
				Id = 9313196177,
				Bio = "It's okay, you're beautiful now, everything's going to be alright."
			},
			["THE CERVINE"] = { Name = "TRAP", Id = 116940579959315, Bio = "..." },
			["Anthrested Sepulcher"] = {
				Name = "Anthrested Sepulcher",
				Id = 16932164023,
				Bio = "Innocent souls are converted within the Anthrested Sepulcher but it is already too late as destroying it will only give the being more strength."
			},
			["Anthrested Knight-AWIH"] = {
				Name = "Big Smile Chow",
				AttackEffect = "Recyclables",
				Id = 17600721047,
				Bio = "Anthrests are a good source of reusable plastic. Perfect for packaging!"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Archetype = "Anthrest",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this fighter dies: All Anthrested fighters gain 150 Health.",
			Type = "OnDeath",
			Power = { { "Heal", 150 } },
			Target = "Archetype"
		},
		Bio = "How dare you even lay eyes on her! She is mine! Get your own, you filthy knave!"
	},
	["Orinthian Stratagem: Retreat"] = {
		Id = 9265736643,
		Name = "Orinthian Stratagem: Retreat",
		AltCards = {
			["Orinthian Stratagem: Retreat-E"] = {
				Id = 8999507191,
				Name = "Techomore 'Reconciliation' by Rinthins",
				Bio = "One of their first songs together, its about a group of misfits from rough places that come together to form the ultimate team."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Requirement = { "Archetype", "Ally", 1, 9999, "Orinthian" },
		Archetype = "Orinthian",
		CustomReminder = {
			["Saviour's Will"] = "Mindbroken cards give all allied mindbroken cards 50 Health and Power when returned."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if there's an allied Orinthian fighter.\nA target allied fighter becomes mindbroken. Return it to its hand.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Mindbroken", "SingleAlly" },
				{ "Return", 30, "SingleAlly" },
				{ "Draw", 2 }
			},
			Target = "Ally"
		},
		Bio = "One month after the destruction of the Alpha Brick, strange creatures appeared. These cryptids - these \"Orinthians\" - kidnapped several dwarves before Mount Xargasdon exploded."
	},
	["Orinthian Stratagem: Forced Disappearance"] = {
		Id = 9265739937,
		Name = "Orinthian Stratagem: Forced Disappearance",
		AltCards = {
			["Orinthian Stratagem: Forced Disappearance-E"] = {
				Id = 9087761377,
				Name = "Techomore 'Conquer' by Rinthins",
				Bio = "one of their most recent songs, its about a group overcoming any obstacle with the power of a magical egg."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 2 },
		Archetype = "Orinthian",
		Requirement = { "Archetype", "Ally", 1, 9999, "Orinthian" },
		CustomReminder = {
			["Saviour's Will"] = "Mindbroken cards give all allied mindbroken cards 50 Health and Power when returned."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if there's an allied Orinthian fighter.\nA target allied fighter becomes mindbroken. Return it to its hand. It gains 300 health and power.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Mindbroken" },
				{ "Heal", 300 },
				{ "Strengthen", 300 },
				{ "Return", 30, "SingleAlly" }
			},
			Target = "SingleAlly"
		},
		Bio = "After the explosion at Mount Xargasdon, the Orinthians weren't seen for weeks. They were definitely seen again when Hallow disappeared."
	},
	["Orinthian Stratagem: Mass Abduction"] = {
		Id = 9265746399,
		Name = "Orinthian Stratagem: Mass Abduction",
		AltCards = {
			["Orinthian Stratagem: Mass Abduction-E"] = {
				Id = 8999504867,
				Name = "Idol Fan Meet-up",
				Bio = "Hey, Magnia. I know you're my biggest fan and you're working for the Orinthians, so could you fund this expedition to find a giant egg that looks like your leader? Thanks."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 2 },
		Archetype = "Orinthian",
		Requirement = { "Archetype", "Ally", 1, 9999, "Orinthian" },
		CustomReminder = {
			["Saviour's Will"] = "Mindbroken cards give all allied mindbroken cards 50 Health and Power when returned."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if there's an allied Orinthian fighter.\nA target fighter becomes mindbroken. Return it and the lowest power fighter to its hand.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Mindbroken" },
				{ "Return" },
				{ "Return", 30, "LowestPower" }
			},
			Target = "Single"
		},
		Bio = "Emboldened by Hallow's kidnapping, the Orinthians went more brazen, eventually stealing the whole World of Wood."
	},
	["Orinthian Force: Pilot"] = {
		Id = 6657749127,
		Name = "Orinthian Force: Pilot",
		AltCards = {
			["Orinthian Force: Pilot-E"] = {
				Id = 8891695639,
				Name = "Mayuri Super Fan, Magnia",
				Bio = "Their level of dedication to remain her biggest fan is unmmatched, They even have her painted on their ship."
			},
			["Biograft Cyborg Neo"] = {
				Id = 8072544782,
				Name = "Biograft Cyborg Neo",
				AttackEffect = "Slash",
				Bio = "I never asked for this."
			},
			["The Rayburnlings"] = {
				Id = 137804051418205,
				Name = "Rumors of an Angel",
				AltArt = true,
				AttackEffect = "MagicBlue",
				Bio = "“rumors sprang from inspiration, fear, . . . they humanize what is understood and demonize what isn’t” (LastName #)",
				PremiumArt = 393
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Archetype = "Orinthian",
		CustomReminder = {
			["Saviour's Will"] = "Some Orinthian cards become stronger when you cast minds broken to the will of their mastermind."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Return another target allied fighter to its hand. It becomes mindbroken.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Mindbroken" },
				{ "Return" }
			},
			Target = "SingleAlly",
			TargetSubModifier = "CustomModAlly OtherCard",
			TargetSubModifierDescription = "a different allied fighter"
		},
		Bio = "Compared to dogfights with Vaktovian destroyers, abducting some woodland barbarians is far beneath my pay. What gives, Mastermind?"
	},
	["Orinthian Force: Soldier"] = {
		Id = 6657751021,
		Name = "Orinthian Force: Soldier",
		AltCards = {
			["Orinthian Force: Soldier-E"] = {
				Id = 10924671523,
				Name = "Rinthins Manager, Lurco Crowlbeast",
				Bio = "\"I didn't crawl from the depths of hell just to lose in the idol industry, literally and figuratively. I will use any means to let the girls take the spotlight, even if it means breaking the law.\""
			}
		},
		Health = 500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Blue = 1 },
		Archetype = "Orinthian",
		Shield = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is returned to your hand: Draw a card.",
			Type = "OnReturn",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "We hurt you for your own good! You don't know what you're dealing with!"
	},
	["Orinthian Force: Secret Guard"] = {
		Id = 6657749598,
		Name = "Orinthian Force: Secret Guard",
		AltCards = {
			["Orinthian Force: Secret Guard-E"] = {
				Id = 8954454663,
				Name = "Rinthins Technician, Tonitru Ruptor",
				Bio = "They ARE the laser light show!"
			},
			["Orinthian Force: Secret Guard-Senzura"] = {
				Id = 105084000999583,
				Name = "Apple Newsteller",
				Bio = "COME HEAR ALL ABOUT IT, THE DESTRUCTION OF OUR WORLD! :DD"
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LaserYellow",
		Color = "Yellow",
		Cost = { Green = 1 },
		Archetype = "Orinthian",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is returned to your hand: A target enemy fighter loses 200 Power. You gain 200 life.",
			Type = "OnReturn",
			Power = {
				{ "Weaken", 200 },
				{ "Cost", -200 }
			},
			Target = "SingleEnemy"
		},
		Bio = "We were told to be clandestine, yet those primitive dwarves saw us. Hopefully news of this doesn't spread out to these savages."
	},
	["Orinthian Fleet: Valkyrie Mech"] = {
		Id = 9309499980,
		Name = "Orinthian Fleet: Valkyrie Mech",
		AltCards = {
			["Orinthian Fleet: Valkyrie Mech-E"] = {
				Id = 9098481063,
				Name = "Idol Nozomi",
				AttackEffect = "MagicGreen",
				Bio = "The youngest of the Rinthian Idols, While her fanbase is the smallest, she knows how to hype them up to be just as loud as the rest."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LaserGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2, Blue = 2, Yellow = 2 },
		Archetype = "Orinthian",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is returned to your hand: Give yourself an Orinthian Force card, an Orinthian Fleet card, and an Orinthian Stratagem card.",
			Type = "OnReturn",
			Power = {
				{ "RandomAdd", "Common Orinthian" },
				{ "RandomAdd", "Uncommon Orinthian" },
				{
					"RandomAdd",
					{
						"Orinthian Stratagem: Mass Abduction",
						"Orinthian Stratagem: Forced Disappearance",
						"Orinthian Stratagem: Retreat"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "The Mastermind has abandoned its fight with Vaktovia. Each of its ships are instead sent to Robloxia for an unknown purpose."
	},
	["Orinthian Fleet: Falcon"] = {
		Id = 5263574222,
		Name = "Orinthian Fleet: Falcon",
		AltCards = {
			["Orinthian Fleet: Falcon-E"] = {
				Name = "Idol Aizawa",
				AttackEffect = "MagicYellow",
				Id = 8781555799,
				Bio = "The most outgoing of the Rinthian Idols, her songs compel you to break out into dance in a matter of seconds."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LaserYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Green = 1, Blue = 1, Yellow = 1 },
		Archetype = "Orinthian",
		Charge = true,
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Another target allied fighter becomes mindbroken. Return it to its hand. Search your deck for an Orinthian card with the same total stud cost (or less) as that fighter.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Cost", "Nil" }
				},
				{ "RandomTutorfor", "Orinthian VariableorExactCost", "Ally" },
				{ "GivePassive", "Mindbroken" },
				{ "Return" }
			},
			Target = "SingleAlly",
			TargetSubModifier = "CustomModAlly OtherCard",
			TargetSubModifierDescription = "a different allied fighter"
		},
		Bio = "Eisenhower could not hide his fascination when he saw the Orinthian fleet. A whole forest, absorbed into a ship."
	},
	["Orinthian Fleet: The Lady"] = {
		Id = 9804150000,
		Name = "Orinthian Fleet: \"The Lady\"",
		AltCards = {
			["Orinthian Fleet: The Lady-E"] = {
				Name = "Idol Mayuri",
				AttackEffect = "MagicBlue",
				Id = 9290481808,
				Bio = "She's the most popular of the Rinthian Idols, known for her cheerful attitude that flows through her songs. "
			}
		},
		Health = 50,
		Power = 50,
		Rarity = "Uncommon",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Green = 3, Blue = 3, Yellow = 3 },
		Archetype = "Orinthian",
		CustomReminder = {
			["Saviour's Will"] = "Mindbroken cards give all allied mindbroken cards 50 Health and Power when returned."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: A target enemy fighter becomes mindbroken. Steal it.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Mindbroken" },
				{ "Steal" }
			},
			Target = "SingleEnemy"
		},
		Bio = "The Mastermind's personal ship, piloted by The Mastermind's personal warrior-maiden."
	},
	["Orinthian Base: Deportation Depot"] = {
		Id = 11616437969,
		Name = "Orinthian Base: Deportation Depot",
		AltCards = {
			["Orinthian Base: Deportation Depot-E"] = {
				Id = 16738206315,
				Name = "Grand Stage of Idolatrization",
				Bio = "Fanboys and fangirls! Are you ready for a grand debut of your favourite idols' latest hit???",
				Terrariant = "Idol Honoka"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Terrain = true,
		Cost = { Blue = 1, Yellow = 1, Green = 1 },
		Terrariant = "Deportation Depo Terrarian",
		Archetype = "Orinthian",
		CustomReminder = {
			["Saviour's Will"] = "Mindbroken cards give all allied mindbroken fighters in play and your hand 50 Health and Power when returned."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast your second fighter each turn: It becomes mindbroken. You may return it to its hand.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "GivePassive", "Mindbroken" },
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "SavedCardInstance" },
							"Aggressor"
						},
						{
							"ConfirmPrompt",
							{ "Do you want to return the fighter you just cast?" }
						}
					},
					Target = "Aggressor",
					EffectRequirement = { "Playertable", "Me", 2, 3, "Fighters" }
				},
				OnConfirm = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "SavedCardInstance" },
							"Self"
						},
						{ "Return", 30, "EVCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The holding cells of all the people the Orinthians abduct. They're treated very well."
	},
	["Beseech the Mastermind"] = {
		Id = 5983804015,
		Name = "Beseech the Mastermind",
		AltCards = {
			["Beseech the Mastermind-E"] = {
				Id = 8715845391,
				Name = "Search for Eggs",
				Summonant = "Ghashendex, Ultra Mastermind-E",
				Bio = "Magnia began the hunt for the Ghashendegg, While he could only find normal eggs scattered about, he saw something on the horizon..."
			},
			THC2 = {
				Id = 10507469885,
				Name = "Assassinate The Mastermind",
				Summonant = "THC2T",
				Bio = "As the Masterminds arguments turned into demands, Hallow knew that there was no other options."
			},
			["Beseech the Mastermind-Precon"] = {
				Id = 17025144679,
				Name = "RETURN MY PAGES",
				Summonant = "Ghashendex-Precon",
				Bio = "And what happens? Do I get a prize...? Didn't think so."
			},
			["The Great Heist"] = {
				Id = 129733462300032,
				Name = "The Great Heist",
				Summonant = "Milberry ON THE RUN",
				PremiumArt = 836,
				Bio = "“Fwu fwu fwu, don’t mind if I do”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 3, Blue = 3, Yellow = 3, Green = 3 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "Orinthian" },
		Archetype = "Orinthian",
		AddBlock = true,
		Summonant = "Ghashendex, Ultra Mastermind",
		CustomReminder = {
			["The Mastermind"] = "Discard 2 cards to have a target fighter become Mindbroken and inert in all zones. Change its cost to {W}, then return it.\nDrain 650 life from your opponent when you cast a Mindbroken card."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card ignoring its {W} cost if there's an allied Orinthian fighter.\nSummon the Orinthian Mastermind, a 2100/100 fighter.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "The Orinthian Mastermind remains hidden at all times, his form unknown to everyone, even his warrior-maiden. He made an exception for that irritating obstacle Hallow."
	},
	["Ghashendex, Ultra Mastermind"] = {
		Id = 5983829799,
		Name = "Ghashendex, Ultra Mastermind",
		AltCards = {
			["Ghashendex, Ultra Mastermind-E"] = {
				Id = 8715846719,
				Name = "Ghashendegg",
				AttackEffect = "Gravity",
				Bio = "Magnia informed Mayuri that they found the egg, she thanked them and let them know it wasnt actually magical or anything, they just needed a cool set piece for their next song."
			},
			THC2T = {
				Id = 10507471369,
				Name = "Orinthian Mothership",
				Bio = "With the Mastermind fallen and the main weapons spent of energy, the Orinthian Mothership fell silent, slowly drifting into the abyss of space."
			},
			["Ghashendex-Precon"] = {
				Id = 16932160781,
				Name = "Ghashendex",
				Bio = "The mastermind once traversed this place with pride. It became their prison, and their entertainment."
			},
			["Milberry ON THE RUN"] = {
				Id = 79027901340341,
				Name = "Milberry, ON THE RUN!!",
				Bio = "“SHE MINDED!! SHE MINDED!!”"
			}
		},
		Health = 2100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "LaserGreen",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 0 },
		Archetype = "Ultra",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you discard your second card each turn: A target fighter becomes Mindbroken and inert in all zones. Change its cost to {W}, then return it to its hand.\nOnce each turn, whenever you cast a Mindbroken card: Your opponent loses 400 life and you gain 400 life.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Ghashendex" },
						{ "Return" }
					},
					EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" },
					Target = "Single"
				},
				OnAllySummon = {
					Power = {
						{ "Cost", -400 },
						{ "Inflict", 400 }
					},
					Target = "Opponent",
					HasPassive = "Mindbroken",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The Dwarven Meteor will hit this world a second time. This humble one knows what extinction feels like. It will stop you from the same fate, even if you consent to oblivion."
	},
	["Neodragon Infinite Darkness Spacetime Obliterator"] = {
		Id = 13903589565,
		Name = "Neodragon Infinite Darkness Spacetime Obliterator",
		AltCards = {
			["Neodragon Butler"] = {
				Id = 8757375275,
				Name = "Neodragon Butler",
				Bio = "\"Another round of piping hot Neodragonleaf tea, my lord?\""
			},
			["Karaja, Omniscient Aleph-Nought Radiant Hydrangea"] = {
				Id = 71804381459620,
				Name = "Karaja, Omniscient Aleph-Nought Radiant Hydrangea",
				AltArt = true,
				PackDisplayOverride = "Tough Love",
				Bio = "A blue rose is a symbol.. of making the impossible in a rebellion against god.<br/>I want to become something that shouldn’t be possible in this world..<br/>Choose the future.. I will believe in that uncertain possibility! "
			},
			["Zenith, Neo Guardian"] = {
				Id = 126526579078124,
				Name = "Zenith, Neo Guardian",
				PremiumArt = 357,
				AltArt = true,
				Bio = "One of the Neodragon Guardians. He can open portals to other dimensions using his gun and stars he collects. His ultimate goal is to create a beautiful night sky free from war."
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Flame",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Neodragon",
		EffectVariable = 0,
		Addant = "Blue Titanic Stud",
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you cast an action or terrain: You gain 2 million DRAGONFORCE.",
			Type = "OnSecondDraw",
			Target = "Ally",
			Ability = {
				OnAllyCast = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnAllyTerrainCast = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Dragon", 2, "Ally", nil, nil, "PowerUpSelfBlue" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Neodragon Collapsing Vacuum Turbo Despair Descender"] = {
		Id = 13913647273,
		Name = "Neodragon Collapsing Vacuum Turbo Despair Descender",
		AltCards = {
			["Neodragon Clerk"] = {
				Id = 8757375885,
				Name = "Neodragon Clerk",
				Bio = "\"We at the estate of Lord Cobalt also sell pastries to help fund our lord's...\"digital two-dimensional character collection\" interest, as he puts it.\""
			},
			["Lou, Neo Guardian"] = {
				Id = 12720769824,
				Name = "Lou, Neo Guardian",
				AltArt = true,
				Commissioner = { 90658630 },
				Bio = "One of the Neodragon Guardians. She dreams to aid in ending the wars and inspires hope in the souls of many. When it comes to fighting using her hands she's unmatched."
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Blaze",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Neodragon",
		EffectAnimation = "PowerUpSelfYellow",
		Addant = "Yellow Titanic Stud",
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you discard a Colourless card: You gain 2 million DRAGONFORCE.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Dragon", 2 } },
					Target = "Ally",
					Color = "Neutral",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Blue Eyes Super Saiyan Super Neodragon Super God God"] = {
		Id = 13913650312,
		Name = "Blue Eyes Super Saiyan Super Neodragon Super God God",
		AltCards = {
			["Neodragon Servant"] = {
				Id = 8757376716,
				Name = "Neodragon Servant",
				Bio = "\"Are you kidding? Those girls just make a mess of the place and then leave it for ME to clean up.\""
			},
			["Sho Neo Guardian"] = {
				Id = 90583936483198,
				Name = "Shō Neo Guardian",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 58,
				Bio = "One of the Neodragon Guardians. He believes there are many good people in the wars and wishes to end the fighting for good. He has powerful and elegant control over his flames and can even control his weapons with them."
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Scorch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Neodragon",
		EffectAnimation = "PowerUpSelfGreen",
		Addant = "Green Titanic Stud",
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever an allied Neodragon fighter dies: You gain 2 million DRAGONFORCE.",
			Ability = {
				OnAllyDeath = {
					Power = { { "Dragon", 2 } },
					Target = "Ally",
					Archetype = "Neodragon",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Neodragon Centurial Benevolence Torturer Humbler"] = {
		Id = 13947267867,
		Name = "Neodragon Centurial Benevolence Torturer Humbler",
		AltCards = {
			["Neodragon Chef"] = {
				Id = 8757374885,
				Name = "Neodragon Chef",
				Bio = "\"I strive to serve the finest meals known to this planet, as I would accept nothing less for my lord.\""
			},
			["Taizjaaja, Neodragonmaid Chef"] = {
				Id = 9256514254,
				AltArt = true,
				Name = "Taizjaaja, Neodragonmaid Chef",
				Bio = "\"Truly a force to be reckoned with when throwing down in the kitchen,  cooking up delicacies so tasteful it'd take Chef Aeons to even match a fraction of her skill!\""
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Flare",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Neodragon",
		EffectAnimation = "PowerUpSelfRed",
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card destroys another: You gain 2 million DRAGONFORCE.",
			Ability = {
				OnDestroy = {
					Power = { { "Dragon", 2 } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Neodragon Super God Circle Stud EX"] = {
		Id = 6953706490,
		Name = "Neodragon Super God Circle Stud EX",
		AltCards = {
			["Neodragonmaid Welcome"] = {
				Id = 8645457895,
				Name = "Neodragonmaid Welcome",
				Bio = "\"Welcome home, Cobalt-San! We've kept the place clean for your return, I hope it is satisfactory to you.\""
			},
			["Neodragon Super God Circle Stud EX-AN-Banner"] = {
				Id = 10401347463,
				Name = "Dragon Lantern",
				Bio = "Dragons may be contained in this charm if you believe hard enough."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scorch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Terrain = true,
		Terrariant = "Neodragon Super God Circle Stud EX",
		ForceTerrarianStatline = { 500, 500 },
		Archetype = "Neodragon",
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: This card generates for each 4 million DRAGONFORCE you have.",
			Target = "Ally",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 4, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{ "Generate", "Variable", "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Our parents have been avenged for their banishment!"
	},
	["Neodragon Unrelenting Consent to Destruction Lv.7"] = {
		Id = 8636122150,
		Name = "Neodragon Unrelenting Consent to Destruction Lv.7",
		AltCards = {
			["Neodragonmaid Meal"] = {
				Id = 8691304324,
				Name = "Neodragonmaid Meal",
				Addant = "Neodragonmaid Meal",
				Bio = "\"Come on, Cobalt-Sama! You must eat well to keep up your strength.\" \"I made this cake just for you too, Cobalt-Sama!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Inferno",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Neodragon",
		EffectAnimation = "InfernoBreathAlly",
		EffectVariable = 0,
		Addant = "Neodragon Unrelenting Consent to Destruction Lv.7",
		Effect = {
			Description = "All allied Neodragons gain 50 health and power for each {W} you have.\nYou lose all your {W} and gain 2 million DRAGONFORCE.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" },
						{ "SetNeutral", "0", "Ally" },
						{ "Dragon", 2, "Ally" }
					},
					Target = "AlliedArchetype"
				},
				OnEVCheckPass = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Fleeting = true },
					EffectRequirement = { "Playertable", "Me", 8, 9999, "DRAGONFORCE" },
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["Neodragon Hypertesseract Superblackhole Eruption"] = {
		Id = 8636117143,
		Name = "Neodragon Hypertesseract Superblackhole Eruption",
		Addant = "Neodragon Hypertesseract Superblackhole Eruption",
		AltCards = {
			["Neodragonmaid Gifts"] = {
				Id = 8645456750,
				Name = "Neodragonmaid Gifts",
				Addant = "Neodragonmaid Gifts",
				Bio = "\"C-c-cobalt-Sama, I m-m-made you some chocolates, If you'd t-t-truly accept them from me??\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Neodragon",
		EffectVariable = 0,
		Effect = {
			Description = "Search your deck for a Neodragon card for each 2{W} you have.\nYou lose all your {W} and gain 2 million DRAGONFORCE.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" },
						{ "SetNeutral", "0", "Ally" },
						{ "Dragon", 2, "Ally" }
					},
					Target = "AlliedArchetype"
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Neodragon" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Neodragon Explosive Violence Crescendo Ultimate"] = {
		Id = 6953708749,
		Name = "Neodragon Explosive Violence Crescendo Ultimate",
		AltCards = {
			["Loving Memories"] = {
				Id = 8788859595,
				Name = "Loving Memories",
				Bio = "\"Oh, Cobalt-san... I'll cherish this moment with you forever...\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Archetype = "Neodragon",
		AddBlock = true,
		EffectAnimation = "InfernoBreathAll",
		Effect = {
			Name = "Temporal Halo",
			Description = "Deal 50 damage to all enemy fighters for each million DRAGONFORCE you have.\nYou gain 2 million DRAGONFORCE.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" },
					"Self"
				},
				{ "Damage", "Variable" },
				{ "Dragon", 2, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = ""
	},
	["Neodragon Container"] = {
		Id = 4730258641,
		Name = "Neodragon Container",
		Pack = "Temporal Halo",
		AltCards = {
			["Karaja, Neodragon Omniscient Aleph-Null Supertask"] = {
				Id = 6688740036,
				Rarity = "Common",
				Name = "Karaja, Neodragon Omniscient Aleph-Null Supertask",
				Cost = { Neutral = 8 },
				AttackEffect = "Flame",
				EffectAnimation = "IceBreathAll",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, lock all non-Neodragon fighters forever.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = { { "Lock", 999, "NotArchetype" } },
							Target = "Ally"
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				}
			},
			["Neodragonmaid Karaja"] = {
				Id = 8618024787,
				Rarity = "Common",
				Name = "Neodragonmaid Karaja",
				Cost = { Neutral = 8 },
				AttackEffect = "Flame",
				PackDisplayOverride = "Tough Love",
				ContainerAltBase = "Karaja, Neodragon Omniscient Aleph-Null Supertask",
				EffectAnimation = "IceBreathAll",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, lock all non-Neodragon fighters forever.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = { { "Lock", 999, "NotArchetype" } },
							Target = "Ally"
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				},
				Bio = "\"Lord Cobalt-San will enjoy this selection of the finest hardcover manga I have selected for him.\""
			},
			["Taizjaaja, Neodragon Omnipotent Burning Hell Demonic Fist"] = {
				Id = 6688740752,
				Rarity = "Common",
				Cost = { Neutral = 8 },
				Name = "Taizjaaja, Neodragon Omnipotent Burning Hell Demonic Fist",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, all cards in your opponent's hand become fleeting and inert in all zones.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "GivePassive", "Fleeting", "CustomTarget" },
								{ "GivePassive", "TokenOmni", "CustomTarget" }
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				}
			},
			["Neodragonmaid Taizjaaja"] = {
				Id = 8618026319,
				Rarity = "Common",
				Cost = { Neutral = 8 },
				Name = "Neodragonmaid Taizjaaja",
				PackDisplayOverride = "Tough Love",
				ContainerAltBase = "Taizjaaja, Neodragon Omnipotent Burning Hell Demonic Fist",
				EffectAnimation = "InfernoBreathEnemyBaseplate",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, all cards in your opponent's hand become fleeting and inert in all zones.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "GivePassive", "Fleeting", "CustomTarget" },
								{ "GivePassive", "TokenOmni", "CustomTarget" }
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				},
				Bio = "\"No matter what it takes, from cleaning his room to levelling this entire forest, I WILL get Cobalt-Sama to notice me.\""
			},
			["Akaaja, Neodragon Omnipresent Caressing Bliss Cherry Blossom"] = {
				Id = 10184084549,
				Rarity = "Common",
				Name = "Akaaja, Neodragon Omnipresent Caressing Bliss Cherry Blossom",
				Cost = { Neutral = 8 },
				AttackEffect = "Scorch",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, You gain 6{R}{G}{B}{Y}. Put 3 copies of each legendary dragon into your baseplate.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Red", 6 },
								{ "Green", 6 },
								{ "Blue", 6 },
								{ "Yellow", 6 },
								{
									"AddGenZone",
									{ "Nymn the Redrune Leader", 3 }
								},
								{
									"AddGenZone",
									{ "Zerax the Untameable", 3 }
								},
								{
									"AddGenZone",
									{ "Naga the Sea Serpent", 3 }
								},
								{
									"AddGenZone",
									{ "Typheus the Whelp", 3 }
								}
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				}
			},
			ClockworkGuy = {
				Id = 128784608840780,
				Rarity = "Common",
				Name = "ClockworkGuy",
				AltArt = true,
				PremiumArt = 436,
				Cost = { Neutral = 8 },
				AttackEffect = "Scorch",
				Bio = "So this guy can manipulate time to any extent and he still has no feats?",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, You gain 6{R}{G}{B}{Y}. Put 3 copies of each legendary dragon into your baseplate.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Red", 6 },
								{ "Green", 6 },
								{ "Blue", 6 },
								{ "Yellow", 6 },
								{
									"AddGenZone",
									{ "Nymn the Redrune Leader", 3 }
								},
								{
									"AddGenZone",
									{ "Zerax the Untameable", 3 }
								},
								{
									"AddGenZone",
									{ "Naga the Sea Serpent", 3 }
								},
								{
									"AddGenZone",
									{ "Typheus the Whelp", 3 }
								}
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				}
			},
			["Neodragonmaid Akaaja"] = {
				Id = 8618023808,
				Rarity = "Common",
				Name = "Neodragonmaid Akaaja",
				Cost = { Neutral = 8 },
				AttackEffect = "Scorch",
				PackDisplayOverride = "Tough Love",
				ContainerAltBase = "Akaaja, Neodragon Omnipresent Caressing Bliss Cherry Blossom",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, You gain 6{R}{G}{B}{Y}. Put 3 copies of each legendary dragon into your baseplate.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Red", 6 },
								{ "Green", 6 },
								{ "Blue", 6 },
								{ "Yellow", 6 },
								{
									"AddGenZone",
									{ "Nymn the Redrune Leader", 3 }
								},
								{
									"AddGenZone",
									{ "Zerax the Untameable", 3 }
								},
								{
									"AddGenZone",
									{ "Naga the Sea Serpent", 3 }
								},
								{
									"AddGenZone",
									{ "Typheus the Whelp", 3 }
								}
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				},
				Bio = "\"Uwaaah! I dropped Cobalt-Sama's favourite treat! Now he'll never notice me ever again!\""
			},
			["Piirata, Neodragon Omniprevalent Shapeshifter Galvaniser Bladestrength"] = {
				Id = 6688738480,
				Rarity = "Common",
				Name = "Piirata, Neodragon Omniprevalent Shapeshifter Galvaniser Bladestrength",
				Cost = { Neutral = 8 },
				AttackEffect = "Blaze",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, Search all copies of all other named Neodragons from your deck. A target fighter gains 1000 power and overload.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{
									"RepeatingTutorfor",
									{ "Neodragon Container", 99 },
									"Ally"
								},
								{ "Strengthen", 1000, "Single" },
								{ "GivePassive", "Overload", "Single" }
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				}
			},
			["Neodragonmaid Piirata"] = {
				Id = 8618025492,
				Rarity = "Common",
				Name = "Neodragonmaid Piirata",
				Cost = { Neutral = 8 },
				AttackEffect = "Blaze",
				PackDisplayOverride = "Tough Love",
				ContainerAltBase = "Piirata, Neodragon Omniprevalent Shapeshifter Galvaniser Bladestrength",
				Effect = {
					Name = "Temporal Halo",
					Description = "A deck may run only 4 named Neodragons.\nWhen this card is cast: If you have 20 million or more DRAGONFORCE, Search all copies of all other named Neodragons from your deck. A target fighter gains 1000 power and overload.\nOtherwise, you gain 4 million DRAGONFORCE.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 19 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{
									"RepeatingTutorfor",
									{ "Neodragon Container", 99 },
									"Ally"
								},
								{ "Strengthen", 1000, "Single" },
								{ "GivePassive", "Overload", "Single" }
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Enemy_Hand" },
								Condition = "All"
							}
						},
						OnEVCheckFail = {
							Power = { { "Dragon", 4 } },
							Target = "Ally"
						}
					}
				},
				Bio = "\"Hehe, I'll make sure not a single speck of dirt will dare interrupt Cobalt-sama's naptimes!\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Neutral",
		Cost = { Neutral = 80 },
		ContainerCard = true,
		Archetype = "Neodragon",
		Zeitgeistant = "Temporal Halo",
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Hi.",
			Type = "OnSummon",
			Power = {
				{ "Destroy" },
				{ "Dragon", 2 }
			},
			Target = "Ally"
		},
		Bio = " "
	},
	CobaltObscurity = {
		Id = 10184326916,
		Name = "CobaltObscurity",
		AltCards = {
			["Arth Neodragon Primo"] = {
				Id = 10184135723,
				AltArt = true,
				Name = "Arth Neodragon Primo",
				Addant = "Arth, Neo Defender of Hope and Universes Combined",
				Bio = "One by one the Neodragons were gathered... The race for power quickly spread throughout the Universes. Arth assembled a team consisting of the Universe's strongest fighters to conquer the trials before them. Many eons later their legacy continues. Arth's flames of peace and hope still light the Universes today, illuminating the war-stricken world they once lived in. His dying will is still ignited and forever will be."
			},
			["Owatatsumi Ryu Okami Neodragon Deity"] = {
				Id = 8659624538,
				AltArt = true,
				Name = "Ōwatatsumi Ryu Ōkami Neodragon Deity",
				Addant = "Grougaloragran, The Primordial Neodragon",
				Bio = " A legendary Draconic Warrior once sealed away now returns, Deity of the Neodragon Race, Wielder of the Tides, A Glorious King, And Lastly he turned Iris into a neodragon maid."
			},
			["Lord Cobalt"] = {
				Id = 85682998495871,
				Name = "Lord Cobalt",
				Addant = "Lord Cobalt Token",
				Bio = "\"Hmm? You want something? Sorry, I'm much too busy catching up on the latest issue of Blox Fruits. Please bother me some other time.\""
			},
			["CobaltObscurity-Precon"] = {
				Id = 17860391703,
				Name = "Neodragon Ultima",
				Addant = "Neodragon Ultima Token",
				Bio = "\"Is that an illustration of a dragon?\"<br/>“No but it's a Neodragon. A legend about an apocalyptic monster that appears from the sun when it eclipses and turns the seas red.”"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Flame",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Archetype = "Neodragon",
		Addant = "Neodragon Cobaltneoform Obscurity Final Commission! Final Despair!! Final Strike!!!",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: You gain 3 million DRAGONFORCE. Search your deck for 'Neodragon Super God Circle Stud EX.' Give yourself this card's true form, a 400/400 fighter.",
			Type = "OnSummon",
			Power = {
				{ "Dragon", 3 },
				{ "Add", "Addant" },
				{ "Tutorfor", "Neodragon Super God Circle Stud EX" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["Neodragon Cobaltneoform Obscurity Final Commission! Final Despair!! Final Strike!!!"] = {
		Id = 10184040524,
		Name = "Neodragon Cobaltneoform Obscurity Final Commission! Final Despair!! Final Strike!!!",
		AltCards = {
			["Arth, Neo Defender of Hope and Universes Combined"] = {
				Id = 10184138081,
				Name = "Arth, Neo Defender of Hope and Universes Combined",
				Bio = "\"I'll see my duty fulfilled, Friend.\""
			},
			["Grougaloragran, The Primordial Neodragon"] = {
				Id = 8659625315,
				Name = "Grougaloragran, The Primordial Neodragon",
				Bio = "\"My brother really didn't need my help, he just got bored of soloing you so he called me to do it for him.\""
			},
			["Lord Cobalt Token"] = {
				Id = 8715855468,
				Name = "Lord Cobalt",
				Bio = "\"On second thought, I'll show you a fraction of my power, if you really insist on it.\""
			},
			["Neodragon Ultima Token"] = {
				Id = 17860391459,
				Name = "Neodragon Ultima Vincit Omnia",
				Bio = "\"The legends foretell of an extradimensional being whom sired the creation of all Neodragons and thus dragons as a whole. Perhaps that is its avatar?\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Archetype = "Neodragon",
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: X is the amount of millions of DRAGONFORCE you have.\nIf X is 10 or more, gain 50 Health and Power for each million DRAGONFORCE you have.\nIf X is 25 or more, summon a named Neodragon and trigger its effect as if it was cast.\nIf X is 40 or more, ban your opponent.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "DRAGONFORCE", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "DFCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 39, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 999999, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "EffectVariable", "nil", "DFCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 9, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Playertable", "DRAGONFORCE", "Nil" },
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
							{ "Load", "EffectVariable", "nil", "DFCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 24, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"RandomSummonWithEffect",
						{
							"Karaja, Neodragon Omniscient Aleph-Null Supertask",
							"Taizjaaja, Neodragon Omnipotent Burning Hell Demonic Fist",
							"Akaaja, Neodragon Omnipresent Caressing Bliss Cherry Blossom",
							"Piirata, Neodragon Omniprevalent Shapeshifter Galvaniser Bladestrength"
						}
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["Dwarvern Engineer"] = {
		Id = 4789596288,
		Name = "Dwarvern Engineer",
		AltCards = {
			CoolFlameRB = {
				Id = 9225607278,
				Name = "CoolFlameRB",
				AttackEffect = "Slash",
				AltArt = true,
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Foreseen Consequences.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Foreseen Consequences" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "\"Hi\", Ninetails waved with a cheeky grin. Offering up cards for requests, he asked one simple question \"How far are you willing to go?\"."
			},
			["epic yes, Crystal Based"] = {
				Id = 94642952011996,
				Name = "Meraki, Crystal Based",
				AttackEffect = "MagicBlue",
				Commissioner = { 320659945, 41926915 },
				AltArt = true,
				PremiumArt = 5,
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Ruby.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Ruby, Spirit Partner" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "\"They're my best friends...\""
			},
			["Dwarvern Engineer-Mango"] = {
				Name = "The Icemaster",
				Id = 112542385367232,
				AttackEffect = "Ice",
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Ice Magic.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Sentry Plating-Mango" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"As a child, I YEARNED for the ice...\""
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Archetype = "Dwarf",
		Color = "Blue",
		Cost = { Neutral = 3 },
		CustomReminder = {
			["Sentry Plating"] = "A 🔵 50/0 Component, inert in all zones and unable to counterattack. A target fighter loses 100 Power when it's cast."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you discard a card: Give yourself Sentry Plating.",
			Type = "OnAllyDiscard",
			Power = { { "Add", "Sentry Plating" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "We're surrounded from every angle. We can't trust any of them, not even those stinkin' tree hippies. Sentry research is now our top priority, we must save ourselves. "
	},
	["Sentry Plating"] = {
		Id = 4255932170,
		Name = "Sentry Plating",
		AltCards = {
			["Foreseen Consequences"] = {
				Id = 9225608110,
				Name = "Foreseen Consequences",
				AttackEffect = "Scratch",
				Bio = "Not knowing what's to come, the players responded to the trader. Then, both players got what they wanted. In the end, it has to be this way."
			},
			["Ruby, Spirit Partner"] = {
				Id = 119449640257105,
				Name = "Ruby, Spirit Partner",
				AttackEffect = "MagicRed",
				Bio = "\"...no, they're my family!\""
			},
			["Sentry Plating-Mango"] = {
				Name = "Ice Magic",
				Id = 134753187039168,
				AttackEffect = "Ice",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"ICE CUBE!! COMING IN COLD!!\""
			}
		},
		Health = 50,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Component",
		Color = "Blue",
		CounterBlock = true,
		TokenOmni = true,
		Cost = { Blue = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: A target fighter loses 100 Power.",
			Type = "OnSummon",
			Power = { { "Weaken", 100 } },
			Target = "Single"
		},
		Bio = "Dwarves are amazing inventors, but lack any sort of ethics. A sentry with a 99% guaranteed mortality rate is considered a success, even if some of those numbers are dwarven casualties."
	},
	["Dwarvern Gunsmith"] = {
		Id = 9964776558,
		Name = "Dwarvern Gunsmith",
		AltCards = {
			["Flufflefunz?"] = {
				Id = 105231301123235,
				Name = "Flufflefunz?",
				AttackEffect = "Gravity",
				AltArt = true,
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Obsession.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Obsession" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "BOARDWALK LIKE A LEOPARD ON NAILS // WITH OUR HAIR UNTIED AND OUR SHOELACES LONG // I SHOULD'VE SLEPT 6 HOURS AGO // GRAVITY COULD TEACH ME SOMETHING // YOU CAN HAVE MY ROLLS OF DUCT TAPE // I SHOULD REALLY LEARN HOW TO SPEAK // WEARING EACHOTHERS ARMS"
			},
			Scringlo = {
				Id = 13540721962,
				Name = "Scringlo",
				AttackEffect = "Slash",
				ArtAnimation = "Scringlo",
				Commissioner = { 128650449 },
				AltArt = true,
				PremiumArt = 36,
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Birthday Lizard.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Birthday Lizard" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "The kobolds are coming..."
			},
			["NTPinheiro: 03-89"] = {
				Id = 95206052331697,
				Name = "NTPinheiro: 03-89",
				AttackEffect = "Jab",
				AltArt = true,
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself ######.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "######" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				PremiumArt = 600,
				Bio = "\"Hah... they replaced my arm... with this? I... can't even look. Think I'm gonna throw up.\""
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Gun",
		Archetype = "Dwarf",
		Color = "Red",
		Cost = { Neutral = 3 },
		CustomReminder = {
			["Sentry Weaponry"] = "A 🔴 50/0 Component, inert in all zones and unable to counterattack. A target fighter gains 100 Power when it's cast."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you discard a card: Give yourself Sentry Weaponry.",
			Type = "OnAllyDiscard",
			Power = { { "Add", "Sentry Weaponry" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "'Honestly, I feel like I'm wasting my talent. All my projects end with me building a flamethrower. Mutating abominations? Flamethrower. Futuristic spies? Thermal-reading flamethrower.'"
	},
	["Sentry Weaponry"] = {
		Id = 9964777478,
		Name = "Sentry Weaponry",
		AltCards = {
			Obsession = {
				Id = 11068355743,
				AttackEffect = "Knife",
				Name = "Obsession",
				Bio = "Maybe I need some rehab. Or some sleep - but I'm seeing it in my dreams."
			},
			["Birthday Lizard"] = {
				Id = 13540722636,
				AttackEffect = "Scratch",
				Name = "Birthday Lizard",
				Bio = "here i am :)"
			},
			["######"] = {
				Id = 106219356026650,
				AttackEffect = "Knife",
				Name = "######",
				Bio = "It's a lot easier if you don't think about what happened to them."
			}
		},
		Health = 50,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Component",
		Color = "Red",
		CounterBlock = true,
		TokenOmni = true,
		Cost = { Red = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: A target fighter gains 100 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 100 } },
			Target = "Single"
		},
		Bio = "Dwarven weapons are still considered to be the most devastating pieces of technology ever built, centuries after their abrupt end."
	},
	["Dwarvern Courier"] = {
		Id = 4789593266,
		Name = "Dwarvern Courier",
		AltCards = {
			["epic yes, Epic Duck Highlander"] = {
				Id = 10529902768,
				AltArt = true,
				Name = "epic yes, Epic Duck Highlander",
				Effect = {
					Name = "Temporal Halo",
					Description = "Once each turn, whenever you discard a card: Give yourself Bubberducky.",
					Type = "OnAllyDiscard",
					Power = { { "Add", "Bubberducky" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "\"Why do they call it oven when you of in the cold food of out hot eat the food?\""
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Slash",
		Archetype = "Dwarf",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		CustomReminder = {
			["Sentry Fuel"] = "A 🟡 50/0 Component, inert in all zones and unable to counterattack. A target fighter gains 100 health when it's cast."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you discard a card: Give yourself Sentry Fuel.",
			Type = "OnAllyDiscard",
			Power = { { "Add", "Sentry Fuel" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "'Our couriers report increasing activity all around us. Once our mechanisms are self-locomotive, we won't have to risk anymore losses to those abominations.'"
	},
	["Sentry Fuel"] = {
		Id = 4255931485,
		Name = "Sentry Fuel",
		AltCards = {
			Bubberducky = {
				Id = 10529904455,
				Name = "Bubberducky",
				AttackEffect = "Storm",
				Bio = "shucky ducky quack quack"
			}
		},
		Health = 50,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Archetype = "Component",
		Color = "Yellow",
		CounterBlock = true,
		TokenOmni = true,
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: A target fighter gains 100 health.",
			Type = "OnSummon",
			Power = { { "Heal", 100 } },
			Target = "Single"
		},
		Bio = "Sentry fuel is the second most important liquid in any Dwarf's life."
	},
	["Construct! Sentry Alpha!"] = {
		Id = 6657753483,
		Name = "Construct! Sentry Alpha!",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Component",
		Color = "Blue",
		Cost = { Neutral = 5, Blue = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Component" },
		CustomReminder = { ["Sentry Alpha"] = "Whenever an allied Dwarf dies: Draw a card." },
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Components.\nDestroy all allied Components, then summon a 600/600 Sentry Alpha.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 100, "AlliedArchetype" },
				{ "Summon", "Dwarvern Sentry: Alpha" }
			},
			Target = "Ally"
		},
		Bio = "'This lil' beauty is set to 'Kill Everything'! Good luck getting through THIS corridor! Haha!...wait isn't this the dining hall?'"
	},
	["Dwarvern Sentry: Alpha"] = {
		Id = 119340351783409,
		Name = "Sentry Alpha: \"DwarfJudge.gif\"",
		CopyBodge = "Dwarvern Sentry: Alpha",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied Dwarf dies: Draw a card.",
			Type = "OnAllyDeath",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			Archetype = "Dwarf"
		},
		Bio = "Sentries turned on their creators. Not out of malice, but out of poor coding."
	},
	["Construct! Sentry Beta!"] = {
		Id = 6657753994,
		Name = "Construct! Sentry Beta!",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Component",
		Color = "Red",
		Cost = { Neutral = 5, Red = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Component" },
		CustomReminder = {
			["Sentry Beta"] = "Whenever an allied Dwarf dies: Destroy the oldest card in your opponent's hand."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Components.\nDestroy all allied Components, then summon a 600/600 Sentry Beta.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 100, "AlliedArchetype" },
				{ "Summon", "Dwarvern Sentry: Beta" }
			},
			Target = "Ally"
		},
		Bio = "'This lil' beauty is set to 'Shoot Everything'! Good luck getting through THIS corridor! Haha!...wait isn't this the brewery?'"
	},
	["Dwarvern Sentry: Beta"] = {
		Id = 4918507037,
		Name = "\"Sentry Beta: \"DwarfJury.mp4\"",
		CopyBodge = "Dwarvern Sentry: Beta",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied Dwarf dies: Destroy the oldest card in your opponent's hand.",
			Type = "OnAllyDeath",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Archetype",
			Archetype = "Dwarf"
		},
		Bio = "'A colossal Sentry, capable of planetary destruction. It's single directive : Save Everything'. ~ Dwarven report titled 'Dwarven Meteor'."
	},
	["Construct! Sentry Gamma!"] = {
		Id = 6657754524,
		Name = "Construct! Sentry Gamma!",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Component",
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Component" },
		CustomReminder = {
			["Sentry Gamma"] = "Whenever an allied Dwarf dies: Give yourself 2 Component cards."
		},
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Components.\nDestroy all allied Components, then summon a 600/600 Sentry Gamma.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 100, "AlliedArchetype" },
				{ "Summon", "Dwarvern Sentry: Gamma" }
			},
			Target = "Ally"
		},
		Bio = "This lil' beauty is set to 'Burn Everything'! Good luck getting through THIS corridor! Haha!...wait isn't this the hospital?"
	},
	["Dwarvern Sentry: Gamma"] = {
		Id = 4918506588,
		Name = "Sentry Gamma: \"DwarfExecutioner.avi\"",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied Dwarf dies: Give yourself 2 Component cards.",
			Type = "OnAllyDeath",
			Power = {
				{
					"RandomAdd",
					{ "Sentry Plating", "Sentry Fuel", "Sentry Weaponry" }
				},
				{
					"RandomAdd",
					{ "Sentry Plating", "Sentry Fuel", "Sentry Weaponry" }
				}
			},
			Target = "Ally",
			Archetype = "Dwarf"
		},
		Bio = "The Fortress Masters found the blueprints for a massive Sentry, capable of guarding the entire galaxy. But the history records end shortly after its inception. Where did it go?"
	},
	["Dwarvern Sentry: MAX"] = {
		Id = 6742913043,
		Name = "Chromafex.mp4, The Meteor",
		AltCards = {
			THC3 = {
				Id = 10507473663,
				Name = "Chromafex",
				AttackEffect = "Armaments",
				Bio = "The Dwarves seeked mechanical perfection and slapped 10 tons of firepower on it, Chromafex was the result."
			},
			["hard to kill dwarf"] = {
				Id = 10903864421,
				AltArt = true,
				AttackEffect = "Slash",
				Name = "hard to kill dwarf",
				Bio = "DWARF\n\t\t\t\t\t\t\tGIVE BONES\n\n\t\t\t\t\t\t\tOH NO"
			},
			["Chromafex.mp4, The Meteor-Precon"] = {
				Id = 128626882821441,
				Name = "Chromafex, Fully Armed",
				AttackEffect = "Armaments",
				Bio = "Move over, Metal Gear."
			},
			["Judgement Day"] = {
				Id = 119938387093709,
				Name = "Judgement Day",
				AttackEffect = "LaserBlue",
				AltArt = true,
				PremiumArt = 443,
				Bio = "Everyone - \"Lets judgement day him!!!\""
			}
		},
		CopyBodge = "Dwarvern Sentry: MAX",
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Armaments",
		EffectAnimation = "MiniMissilesEnemy",
		SummonAnimation = "ChromafexSummon",
		SummonedAnimation = "ChromafexSummon",
		Archetype = "Sentry",
		Color = "Red",
		Charge = true,
		CounterAttackBlock = true,
		DestroyImmune = true,
		Requirement = { "Archetype", "Ally", 1, 9999, "Sentry" },
		Cost = { Neutral = 4, Blue = 2, Yellow = 2, Red = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if there's an allied Sentry.\nOnce each turn, when you discard a card: Deal 200 damage to all enemy fighters.",
			Type = "OnAllyDiscard",
			Power = { { "Damage", 200, "Opponent" } },
			Target = "Opponent",
			TurnTriggerLimit = 1
		},
		Bio = "Eclipse ended the fight with less fur, but with his life and limbs intact."
	},
	["Dwarvern Sentry: Delta"] = {
		Id = 8938592657,
		CopyBodge = "Dwarvern Sentry: Delta",
		Name = "Dwarvern Reprocessing",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Requirement = { "Playertable", "Me", 4, 9999, "DiscardCount" },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "Dwarf" },
		AlternateCost = { Blue = 1, Yellow = 1, Red = 1 },
		Cost = { Blue = 2, Yellow = 2, Red = 2 },
		Archetype = "Dwarf",
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast this card only if you've discarded 4 or more cards this turn, and cast this card for {R}{B}{Y} less if there's an allied Dwarf.\nDraw 4 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 4 } },
			Target = "Ally"
		},
		Bio = "The biggest breakthrough in Dwarven history was the discovery of a fallen star. With it, they built impossible machinery."
	},
	TigerCaptain = {
		Id = 7678215406,
		Name = "TigerCaptain",
		AltCards = {
			["Edge Gaming YingTaoQueen"] = {
				Id = 9336165352,
				AltArt = true,
				AttackEffect = "Tempest",
				Name = "YingTaoQueen, The Geomancy Student",
				Bio = "\"Practicing and dedication is what matters the most... because I will take revenge on you.\""
			},
			["Spook & Sol: Ritual Enthusiasts"] = {
				Id = 123375409243103,
				AltArt = true,
				AttackEffect = "Revolver",
				PremiumArt = 211,
				Name = "Frozen Heart",
				Bio = "\"From the freezing cold of her lethal blade which rendered everything brittle.. to the raw unbounded talent that rivals even Py-WE'RE NOT DOING THIS!\""
			},
			["Pet Egg Tiger"] = {
				Id = 89267164284561,
				Name = "Pet Egg...?",
				Commissioner = { "AskMeLast" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 780,
				Bio = "Terrible things come in small packages."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		StarterCard = true,
		Token = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Search your deck for 'Living World.'",
			Type = "OnSummon",
			Power = { { "Tutorfor", "Living World" } },
			Target = "Ally"
		},
		Bio = "He mastered terrain years ago, only for his own earth to turn against him."
	},
	["Living World"] = {
		Id = 6959565343,
		Name = "Living World",
		AltCards = {
			LivingWorldEmpowered = {
				Rarity = "Token",
				Id = 6875831599,
				Cost = { Green = 3, Neutral = 0 },
				Addant = "LivingWorldEmpowered"
			},
			["Living World-Sun"] = {
				Name = "Traveling Landmass",
				Id = 9208884418,
				Addant = "Living World-Sun",
				Bio = "Ripping through the earth, through the clay, the migration starts."
			},
			["THAT TREE IS MOVIN'!"] = {
				Name = "THAT TREE IS MOVIN'!",
				AltArt = true,
				Commissioner = { 788406855, 464498123 },
				PremiumArt = 123,
				Id = 17251035531,
				Addant = "THAT TREE IS MOVIN'!",
				Bio = "\"chat altik and mak here today we have uhh this tree moving holy cow never seen that thing chat oh wow chat is this real chat oh cool epic that's totally not a random guy i bribed three bloxbu\""
			},
			["First to the Token"] = {
				Name = "First to the Token",
				AltArt = true,
				PremiumArt = 797,
				Id = 118893935216657,
				Addant = "First to the Token",
				Bio = "\"Take my hand.\""
			},
			["Encore of Awakening"] = {
				Id = 125785628850353,
				Name = "Encore of Awakening",
				PremiumArt = 331,
				AltArt = true,
				EffectAnimation = "RedMusicPulse",
				Addant = "Encore of Awakening",
				Bio = "As the crowd roars, the instruments seem alive themselves, commanding the world around them to bend, break, and reform."
			},
			["Chartreuse, Deluxe Worldcaller"] = {
				Id = 75308748797873,
				Name = "Chartreuse, Deluxe Worldcaller",
				Addant = "Chartreuse, Deluxe Worldcaller",
				PremiumArt = 349,
				AltArt = true,
				Bio = "<b><font color=\"#00FF00\">Reality explodes, shifts, and renews... SO WILL YOU!!!</font></b>"
			},
			["Living World-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 133467141863992,
				Addant = "Living World-10Y",
				Bio = "In all honesty, aren't actions supposed to look like.. actions?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectAnimation = "LivingWorld",
		DestroyImmune = true,
		Fading = true,
		AnimatesTerrain = true,
		Addant = "Living World",
		Effect = {
			Name = "Temporal Halo",
			Description = "Animate your current terrain into a fighter.\nGive yourself a copy of this card.",
			Type = "OnSummon",
			Power = {
				{ "AnimateTerrain" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "The neodragons weren't the only creations sprang from time's destruction."
	},
	Baseplate = {
		Id = 10184162330,
		Name = "Baseplate",
		AltCards = {
			["Baseplate-Hal"] = {
				Id = 120558821979077,
				Name = "Area 51",
				Terrariant = "Area 51 Terrain",
				Bio = "Come inside, and find everything the government doesn't want you to know!"
			},
			["Baseplate-Quest"] = {
				Id = 129564427971427,
				Name = "BC Headquarters",
				PlayTest = true,
				Terrariant = "Baseplate Terrain-Quest",
				Bio = "Best workplace in the world! (from process of elimination)"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 293402627,
		Color = "Neutral",
		Terrain = true,
		Terrariant = "Baseplate Terrain",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Destroy your opponent's terrain.",
			Type = "OnSummon",
			Power = { { "DestroyTerrain" } },
			Target = "Opponent"
		},
		Bio = "What will you build?"
	},
	Crossroads = {
		Id = 10184380484,
		Name = "Crossroads",
		AltCards = {
			["Bingus Temple"] = {
				Id = 10184194763,
				Name = "Bingus Temple",
				AltArt = true,
				Terrariant = "Bingus Terrain",
				Bio = "This is the part of the song where Fluff gives up. He dissociates himself from his own romance until it becomes just a fantasy. This is not something that could happen to him; this is something that takes place only in his mind. But he blinks now, and shakes himself awake. He has rejoined society. Come, dear children, call no more. He has only Bingus now."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 293402627,
		Color = "Neutral",
		Terrain = true,
		Cost = { Red = 2 },
		Terrariant = "Crossroads Terrain",
		Effect = {
			Name = "Stud",
			Description = "At the start of each player's turn: That players' enemy fighters gain 100 power.",
			Type = "OnStart",
			Power = "Strengthen",
			Target = "NonCurrentTurn",
			Increase = 100
		},
		Bio = "The ultimate battleground, apart from sitting at a table playing Blox Cards of course."
	},
	FixingFailure = {
		Id = 10184706994,
		Name = "FixingFailure",
		Health = 700,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "IcyCleBuff",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever your opponent casts a fighter: This card gains 200 health.",
			Type = "OnEnemySummon",
			Power = { { "Heal", 200, "Self" } },
			Target = "Ally"
		},
		Bio = "If he fixes failure, why hasn't he fixed himself?"
	},
	["Cup O Tea"] = {
		Id = 4782767215,
		Name = "Cup O Tea",
		AltCards = {
			["Hot Chocolate"] = {
				Id = 8100785248,
				Name = "Hot Chocolate",
				Bio = "Did you know that the FDA approves up to 90 insect fragments for every 100 grams of hot chocolate? Enjoy eating those mangled cockrooach heads."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Fading = true,
		IsFood = true,
		Effect = {
			Name = "Sudden Death",
			Description = "All players shuffle all non-token cards from their graveyards into their decks.\nYou gain 2000 Life.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "NotToken", "GraveZone_Ally", "Deck_Ally", true, false, 99 },
					"Self"
				},
				{
					"MoveZone",
					{ "NotToken", "GraveZone_Opponent", "Deck_Opponent", true, false, 99 },
					"Self"
				},
				{ "Cost", -2000 }
			},
			Target = "Self"
		},
		Bio = "One cup of tea never satisfies. You always end up having another."
	},
	BrokenBone = {
		Id = 3238111527,
		Name = "BrokenBone",
		AltCards = {
			Unc = {
				Name = "Unc",
				AttackEffect = "Axe",
				Id = 6347938289,
				AltArt = true,
				Bio = "After a long and painful ordeal, he returned to Bloxburg only to find it and his cafe in ruins..."
			},
			["BrokenBone-AN"] = {
				Name = "The Great Wall",
				AttackEffect = "Electric",
				Id = 9345617166,
				Bio = "The Duelshire was built upon a brick wall.The Duelshire will fall before a brick wall."
			},
			["cat-kitty-cute-cat-chonker-fat.gif"] = {
				Id = 95476191413349,
				Name = "fatigue",
				PremiumArt = 238,
				AltArt = true,
				Bio = "I'm gonna stand by myself 'til my very last breath, 'cause a coward dies a thousand deaths."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		Color = "Neutral",
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		Zombified = true,
		Effect = {
			Description = "When this card is cast: Destroy 2 Colourless cards in your baseplate.\nWhen this card dies: Put a Colourless Stud into your baseplate, or 2 if you had no Colourless cards in there.",
			Ability = {
				OnSummon = {
					Power = { {
						"GenZoneDiscard",
						{ "Neutral", -2 }
					} },
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Neutral", "Nil" }
						},
						{
							"AlterEV",
							{ "OverGate", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{
							"AddGenZone",
							{ "Mark Stud", "Variable" },
							"Ally",
							nil,
							nil,
							nil,
							"BaseplateNeutral"
						}
					},
					Target = "Me"
				}
			}
		},
		Bio = "He conquered them all just so he could conquer you."
	},
	SolarCrane = {
		Id = 10318093335,
		Name = "SolarCrane",
		AltCards = {
			["SolarCrane-Sun"] = { Id = 9197544194, Bio = "Can you guess his favorite season?" }
		},
		Health = 1500,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Neutral = 8, Blue = 1 },
		Effect = {
			Name = "Solar Hardscope",
			Description = "During your end step: Draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Self"
		},
		Bio = "It sure is nifty to be solar powered. Unless it's night time."
	},
	Bereghost = {
		Id = 17791470657,
		Name = "Bereghost",
		AltCards = {
			["Bereghost-E"] = { Id = 17025153751, Name = "PixieDust423", Bio = "!" },
			["Bereghost-AWIH"] = {
				Id = 17600689885,
				Name = "Life Insurancer",
				AttackEffect = "Jab",
				Bio = "Compared to eternal torture, 120-hour work weeks are only slightly more appealing.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 150,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "BloxyBuff",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		Effect = {
			Name = "Explosive Spoils!",
			Description = "During your end step: Set this card's health to 150. Then it gains 50 health for each Green stud in your fighters' costs.",
			Type = "OnEnd",
			Power = {
				{ "SetHealth", 150, "Self" },
				{ "Berezaa", 50 }
			},
			Target = "Ally"
		},
		Bio = "It's Bereghost, what else should I say?!"
	},
	FreeThePolarBearLuna = {
		Id = 10288541542,
		Name = "FreeThePolarBear",
		AltCards = {
			baconmanocheese = {
				Id = 10219265437,
				Name = "baconmanocheese",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "got jokes?",
				Summonant = "baconmanocheese"
			},
			["FreeThePolarBearLuna-Sun"] = {
				Id = 97594359574633,
				Name = "Free The Paintballer",
				AttackEffect = "Paintball",
				Bio = "Shotguns nerf when? - Darrel",
				Summonant = "FreeThePolarBearLuna-Sun"
			},
			["FreeThePolarBearLuna-AWIH"] = {
				Id = 17600693419,
				Name = "THE GREEN MEN",
				AttackEffect = "MagicGreen",
				Bio = "Green on the streets, green in my books, green in my eyes, green in...",
				Summonant = "FreeThePolarBearLuna-AWIH",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 4 },
		Summonant = "FreeThePolarBearLuna",
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "During your end step, if there are 10 or more Green studs in your fighters' costs: Summon a copy of this card.",
			Type = "OnEnd",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			EffectRequirement = { "Cost", "Ally", 10, 9999, "Green" }
		},
		Bio = "Never let the bears out."
	},
	Juan2184 = {
		Id = 9604934083,
		Name = "Juan2184",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		EffectAnimation = "BloxyBuff",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "When this card is cast, if there are 7 or more Green studs in your fighters' costs: This card gains 500 health.",
			Type = "OnSummon",
			Power = { { "Heal", 500 } },
			Target = "Self",
			EffectRequirement = { "Cost", "Ally", 7, 9999, "Green" }
		},
		Bio = "Master Artist, Don't mind the paint everywhere."
	},
	EricThePianoGuy = {
		Id = 123449204928896,
		Name = "EricThePianoGuy",
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Red = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Stud",
			Description = "When this card dies Set the power of all fighters with the lowest power to 500.",
			Ability = {
				OnDeath = {
					Power = { { "SetPower", 500 } },
					Target = "LowestPower"
				}
			}
		},
		Bio = "Let's see the HOLE IN THE WALL!!!"
	},
	RangeMeludE = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			Whatthehelp = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				AltArt = true,
				Transformant = "WhatthehelpT1",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Transformant = "RangeMeludET1",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 1. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "1orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET1 = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT1 = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Transformant = "WhatthehelpT2",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Transformant = "RangeMeludET2",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 2. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "2orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET2 = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT2 = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Transformant = "WhatthehelpT3",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Transformant = "RangeMeludET3",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 3. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "3orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET3 = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT3 = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Transformant = "WhatthehelpT4",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Transformant = "RangeMeludET4",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 4. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "4orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET4 = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT4 = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Transformant = "WhatthehelpT5",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Transformant = "RangeMeludET5",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 5. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "5orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET5 = {
		Id = 10026339724,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT5 = {
				Id = 11865482127,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Transformant = "WhatthehelpT6",
				Bio = "Upon masses of identities, all of them are one. Whether it would be taking the identity of a planet's defender of four regions, a killer robot sent to the layers of sin, a team of mercenaries for hire in the wastelands, a shrine maiden solving multiple incidents, a user of cards in multiple realities with vastly different systems and many more. One thing still remains constant..."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Transformant = "RangeMeludET6",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Level 6. (Max 7)\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Search your deck for a card with a total stud cost equal to this card's level or less. If this card's max level, it gains 200 Health and Power.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "RandomTutorfor", "6orExactCost" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Tales of Range's Cape are ones that will persist forever in Roblox's history."
	},
	RangeMeludET6 = {
		Id = 10006252520,
		Name = "RangeMeludE",
		AltCards = {
			WhatthehelpT6 = {
				Id = 11865481948,
				Name = "Sentrum1",
				AttackEffect = "Slash",
				Bio = "Those eyes of unwavering resolve, focus, sheer will. They only exist when the feeling of thrill exists."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "BlueSwirlSelfFlag",
		Color = "Blue",
		Cost = { Red = 1, Blue = 1, Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "Max Level (7).\nWhenever an enemy fighter dies: Level this card up.\nWhen this card dies: Summon from your deck a fighter card with a total stud cost equal to this card's level or less. It gains 200 Health and Power.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_7OrExact", "Deck_Ally", "Field_Ally", true, false },
							"Self"
						},
						{ "Strengthen", 200, "SummonedCard" },
						{ "Heal", 200, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Was all the level grinding worth it?"
	},
	["Giver Trap"] = {
		Id = 17791336523,
		Name = "Giver Trap",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		EffectAnimation = "GiverTrap",
		Lunar = true,
		Effect = {
			Name = "Stud",
			Description = "Return a target allied fighter and a target enemy fighter to their hands.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return", 30, "SingleAlly" },
						{ "Return", 30, "SingleEnemy" }
					},
					Target = "Self",
					UniqueTargets = true
				}
			}
		},
		Bio = "A truly inhumane contraption from Old Robloxia."
	},
	StealthPilot = {
		Id = 10228794959,
		Name = "Stealth Pilot",
		AltCards = {
			["Eeby Deeby Coopery"] = {
				Id = 10310128071,
				Name = "Eeby Deeby Coopery",
				AttackEffect = "Gun",
				AltArt = true,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself 'The Great Escape' and 'Rather Mediocre Movie.'",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "The Great Escape" },
								{ "Add", "Rather Mediocre Movie" }
							},
							Target = "Ally"
						}
					}
				},
				Bio = "EebyDeebyCooperyBeloved.gif"
			},
			["StealthPilot-Sun"] = {
				Id = 13660495577,
				Name = "Maichi Ikigiri",
				AttackEffect = "Jab",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself 'Dragon's Retreat' and 'Dragon's Spirit.'",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Shirts-Sun" },
								{ "Add", "Pants-Sun" }
							},
							Target = "Ally"
						}
					}
				},
				Bio = "\"If you really want a fight on this summer evening... then I'll give you one.\""
			},
			["Luna and Monnie Full-Stop Fixers"] = {
				Id = 85886100302966,
				Name = "Luna & Monnie: Full-Stop Fixers",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself 'The Invitation' and 'Beyond the Shadow.'",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Shirts-LM" },
								{ "Add", "Pants-LM" }
							},
							Target = "Ally"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 603,
				Bio = "<b><font color=\"#00FFFF\">\"That was a clean finisher.\"</font></b><br/><b><font color=\"#FF0000\">\"Those bullets costed an arm and a leg...\"</font></b>"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "TimeBomb",
		Color = "Blue",
		Stealth = true,
		ReturnImmune = true,
		Cost = { Blue = 2, Neutral = 2 },
		CustomReminder = {
			Shirts = "A {G}{G} action, inert in all zones. A target allied fighter gains 300 Power and is returned to its hand.",
			Pants = "A {Y}{Y} action, inert in all zones. Unlock a target allied fighter."
		},
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Give yourself 'Shirts' and 'Pants.'",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Shirts" },
						{ "Add", "Pants" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "A \"Stealth Pilot\" was an inside joke amongst Veteran Secret Guards. A pilot would drop all their clothes and wade in dirt to \"better blend with new environments\". As with every joke, some people take it a bit seriously."
	},
	Shirts = {
		Id = 10228795869,
		Name = "Shirts",
		AltCards = {
			["The Great Escape"] = {
				Id = 10310126286,
				Name = "The Great Escape",
				Bio = "Never get your parachutes from those you're robbing."
			},
			["Shirts-Sun"] = { Id = 13660493067, Name = "Dragon's Retreat", Bio = "\"Hah! Hyah!\"" },
			["Shirts-LM"] = {
				Id = 134717166519168,
				Name = "The Invitation",
				Bio = "\"Aren't we still gonna be greeted by her when we get back?\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Green = 2 },
		EffectAnimation = "Shirt",
		Effect = {
			Name = "Stud",
			Description = "A target allied fighter gains 300 Power.\nReturn it to its hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 300, "SingleAlly" },
						{ "Return", 30, "SingleAlly" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "SHIRTS SHIRTS SHIRTS"
	},
	Pants = {
		Id = 10228796626,
		Name = "Pants",
		AltCards = {
			["Rather Mediocre Movie"] = {
				Id = 10310125394,
				Name = "Rather Mediocre Movie",
				Bio = "I hit her! It's true! It's factual! I hit her! I diddd! Oh hi Mark."
			},
			["Pants-Sun"] = { Id = 13660432505, Name = "Dragon's Spirit", Bio = "\"Come at me!\"" },
			["Pants-LM"] = {
				Id = 111328270618901,
				Name = "Beyond the Shadow",
				Bio = "Evade    3 - 7<br/>Slash    2 - 5    On Hit Inflict 1 Bleed next Scene<br/>Slash    2 - 5    On Hit Inflict 2 Bleed next Scene"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Yellow = 2 },
		EffectAnimation = "Pants",
		Effect = {
			Name = "Stud",
			Description = "Unlock a target allied fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Unlock", 9999 } },
					Target = "SingleAlly"
				}
			}
		},
		Bio = "AND PANTS ROBLOX BRINGS YOU"
	},
	["Latewood Landlord"] = {
		Id = 10779755657,
		Name = "Latewood Landlord",
		Health = 200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "World of Wood",
		Cost = { Blue = 1, Red = 1, Green = 1 },
		Zombified = true,
		EffectVariable = "World of Wood",
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "When this card dies: Recur an allied fighter card and an allied terrain card, each from the World of Wood.",
			Type = "OnDeath",
			Power = {
				{
					"MoveZone",
					{ "Variable_Fighter", "GraveZone_Ally", "Hand_Ally", true, false }
				},
				{
					"MoveZone",
					{ "Variable_Terrain", "GraveZone_Ally", "Hand_Ally", true, false }
				}
			},
			Target = "Self",
			AllowDeadAggressorTriggers = true
		},
		Bio = "Even as The World of Wood disappeared into time, the lands that sprung forth from its destruction held its long history within the soil."
	},
	["Clockwork Spiral"] = {
		Id = 9984208236,
		Name = "Clockwork Spiral",
		AltCards = {
			["the sloth"] = {
				Name = "the sloth",
				Id = 10820959189,
				AttackEffect = "Arcane",
				AltArt = true,
				Summonant = "the slothT1",
				Bio = "lol hi"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Summonant = "Clockwork SpiralT1",
		Cost = { Blue = 8, Neutral = 3 },
		EffectAnimation = "ClockworkSpiral",
		Effect = {
			Name = "Stud",
			Description = "3 Charges.\nWhen this card dies: Spend a charge to summon a copy of it, then reset the stats of all allied fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Reset" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Major holes in the thread of time tended to manifest themselves into the physical plane. Don't try and jump into them lest you end up like Paradox Pete."
	},
	["Clockwork SpiralT1"] = {
		Id = 9984208236,
		Name = "Clockwork Spiral",
		AltCards = {
			["the slothT1"] = {
				Name = "the sloth",
				Id = 10820959189,
				AttackEffect = "Arcane",
				Summonant = "the slothT2",
				Bio = "lol hi"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Summonant = "Clockwork SpiralT2",
		Cost = { Blue = 8, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "2 Charges.\nWhen this card dies: Spend a charge to summon a copy of it, then reset the stats of all allied fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Reset" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Major holes in the thread of time tended to manifest themselves into the physical plane. Don't try and jump into them lest you end up like Paradox Pete."
	},
	["Clockwork SpiralT2"] = {
		Id = 9984208236,
		Name = "Clockwork Spiral",
		AltCards = {
			["the slothT2"] = {
				Name = "the sloth",
				Id = 10820959189,
				AttackEffect = "Arcane",
				Summonant = "the slothT3",
				Bio = "lol hi"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Summonant = "Clockwork SpiralT3",
		Cost = { Blue = 8, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "1 Charge.\nWhen this card dies: Spend a charge to summon a copy of it, then reset the stats of all allied fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Reset" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Major holes in the thread of time tended to manifest themselves into the physical plane. Don't try and jump into them lest you end up like Paradox Pete."
	},
	["Clockwork SpiralT3"] = {
		Id = 9984208236,
		Name = "Clockwork Spiral",
		AltCards = {
			["the slothT3"] = {
				Name = "the sloth",
				AttackEffect = "Arcane",
				Id = 10820959189,
				Bio = "lol hi"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 8, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "When this card dies: reset the stats of all allied fighters.",
			Ability = {
				OnDeath = {
					Power = { { "Reset" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Major holes in the thread of time tended to manifest themselves into the physical plane. Don't try and jump into them lest you end up like Paradox Pete."
	},
	["Alpha Brick's Restoration"] = {
		Id = 10137274462,
		Name = "Alpha Brick's Restoration",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Era",
		Cost = { Neutral = 4, Yellow = 1, Green = 1, Blue = 1, Red = 1 },
		AlternateCost = { Neutral = 0 },
		AlternateCostRequirement = { "Turns", "Ally", 29, 9999 },
		CustomReminder = { Ply = "A half-turn; The turn number not in brackets." },
		Effect = {
			Name = "Night Creak",
			Description = "Cast this card for free if it's ply 30 or later.\nPut a stud of each colour into your baseplate.\nDraw a card.",
			Type = "OnSummon",
			Power = {
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
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Ｗｈｙ ｄｏｅｓ ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ toil ｉｆ ｆｒａｉｌ ｎｏｏｂｋｉｎｄ ｃａｎ ｄｏ ｉｔｓ ｗｏｒｋ adequately？"
	},
	["Root Cause"] = {
		Id = 10215838525,
		AltCards = {
			["That tree is movin 2 Electric Boogaloo"] = {
				Name = "That tree is movin' 2: Electric Boogaloo!!",
				AttackEffect = "Arcane",
				PremiumArt = 824,
				Id = 121030602440057,
				Bio = "\"hi again everyone, it's altik and some other cat guy, and look at this!! it's the tree!! the tree that is movin', again!! this is so freakin' epic!! just like the ol' fashioned days!! just as they say, if there's that tree is movin', where's that tree is movin' 2??<br/>...have you seen mak anywhere?\""
			}
		},
		Name = "Root Cause",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 1, Red = 1 },
		EffectVariable = 0,
		EffectAnimation = "RootCause",
		AnimatesTerrain = true,
		Fading = true,
		Effect = {
			Name = "Night Creak",
			Description = "Recur an allied terrain card.\nAnimate your current terrain into a fighter.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "Terrain", "GraveZone", "Hand", true, false },
					"Self"
				},
				{ "AnimateTerrain" }
			},
			Target = "Ally"
		},
		Bio = "A Wanwood resident saw plastic covering one of the tree barks. Their cries for help afterwards called forth the attention of the entire forest."
	},
	PlatinumFalls = {
		Id = 9977177490,
		Name = "PlatinumFalls",
		AltCards = {
			["The Collectors"] = {
				Name = "angstslop dashypants",
				Id = 129890113001334,
				AltArt = true,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself a Studling card of each colour in your baseplate.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Red", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Red" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Green", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Green" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Blue", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Blue" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Yellow", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Yellow" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassRed = {
							Power = { { "Add", "Stranded Monarch" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassBlue = {
							Power = { { "Add", "Rejected Warlord" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassGreen = {
							Power = { { "Add", "Abandoned Leader" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassYellow = {
							Power = { { "Add", "Discarded Diplomat" } },
							Target = "Ally",
							NoBlip = true
						}
					}
				},
				Bio = "Oh artiste! My life has been stained with the blood of misfortune! But pain... is beauty.. and I need you to show the world my struggles!"
			},
			["Puyo, Stud Slayer"] = {
				Name = "Kesha's Last Concert",
				Id = 14959554370,
				AltArt = true,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself a Studling card of each colour in your baseplate.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Red", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Red" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Green", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Green" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Blue", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Blue" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Yellow", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Yellow" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassRed = {
							Power = { { "Add", "Victim A: Graf" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassBlue = {
							Power = { { "Add", "Victim C: Loop" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassGreen = {
							Power = { { "Add", "Victim B: Lid" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassYellow = {
							Power = { { "Add", "Victim D: Fluffle" } },
							Target = "Ally",
							NoBlip = true
						}
					}
				},
				Bio = "Now, the party don't start 'til I walk in."
			},
			["Nine Tailed Fox Captain NTPinheiro"] = {
				Id = 100284555642833,
				Name = "Nine Tailed Fox Captain NTPinheiro",
				Commissioner = { "NTPinheiro" },
				AttackEffect = "Rifle",
				AltArt = true,
				PremiumArt = 670,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself a Studling card of each colour in your baseplate.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Red", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Red" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Green", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Green" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Blue", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Blue" }
								},
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Yellow", "Nil" }
								},
								{
									"EVGreaterValueCheck",
									{ 0, "Yellow" }
								}
							},
							Target = "Self"
						},
						OnEVCheckPassRed = {
							Power = { { "Add", "SCPP-R" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassBlue = {
							Power = { { "Add", "SCPP-B" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassGreen = {
							Power = { { "Add", "SCPP-G" } },
							Target = "Ally",
							NoBlip = true
						},
						OnEVCheckPassYellow = {
							Power = { { "Add", "SCPP-Y" } },
							Target = "Ally",
							NoBlip = true
						}
					}
				},
				Bio = "\"Mobile Task Force Unit EPSILON-11 designated BRAVO-12 has entered the facility. All remaining personnel are advised to proceed with standard evacuation protocols until an MTF squad reaches your destination.\""
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2, Red = 2, Blue = 2 },
		EffectVariable = 0,
		CustomReminder = { Duh = "Colourless is not a colour." },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Give yourself a Studling card of each colour in your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Red", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Red" }
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Green", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Green" }
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Blue", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Blue" }
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Yellow", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "Yellow" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassRed = {
					Power = { { "Add", "Red Stud" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassBlue = {
					Power = { { "Add", "Blue Stud" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassGreen = {
					Power = { { "Add", "Green Stud" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassYellow = {
					Power = { { "Add", "Yellow Stud" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "The grand creator of games where you jump over things, climb things, jump over more things and slide into a giant toilet."
	},
	["Enchanted Flora"] = {
		Id = 10215835269,
		Name = "Enchanted Flora",
		Health = 500,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Archetype = "Apocryspectre",
		Color = "Green",
		Cost = { Neutral = 2 },
		CustomReminderSuspend = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Suspend a target fighter.\nWhenever this card attacks your opponent directly: You gain {W}{G}.",
			Ability = {
				OnSummon = {
					Power = { { "Suspend" } },
					Target = "Single"
				},
				OnStrike = {
					Power = {
						{ "Neutral", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The destruction brought back the many spectres that once inhabited Cothran, the last gift Ptenda left to his niece."
	},
	Peaspod = {
		Id = 9924438088,
		Name = "Peaspod",
		AltCards = {
			yetanotheryetanotheryetanotheryetanotheryetanotheryetanotheryetanotheryetanotherABDALT = {
				Id = 10296479849,
				Name = "yetanotheryetanotheryetanotheryetanotheryetanotheryetanotheryetanotheryetanotherABDALT",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "yetanotherabdart"
			},
			["Peaspod-V"] = {
				Id = 118600963533572,
				Name = "Chinpai and Neko San",
				AttackEffect = "Punch",
				Bio = "The girls were surprised. Chinpai, the most handsome student, went to prom with another boy?"
			},
			Washedburn = {
				Id = 111627278723251,
				Name = "Washedburn",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 539,
				Bio = "You light my fire, I feel alive with you, baby, you blow my mind, I'm satisfied"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: If a target fighter is in a group, give yourself a fighter card in its group.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" }
						},
						{ "RandomAdd", "Fighter Variable", "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "\"Okay guys welcome to part 5 of my roblox coding tutorial. Ignore the changing game name.\""
	},
	["Hope for Mending"] = {
		Id = 10224279146,
		Name = "Hope for Mending",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Terrain = true,
		Terrariant = "Hope For Mending Terrarian",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or at the start of your turns: If an effect would search a card this turn, search an additional copy of that card.",
			Ability = {
				OnSummon = {
					Power = { { "TutorOverdrive", 30 } },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = { { "TutorOverdrive", 30 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The four listened to the diety's plan in restoring the Alpha Brick. Zanzel decided to right her wrongs. Eclipse went forth to save his kind. Eisenhower became adamant to help those who were suffering. Hallow saw a business opportunity."
	},
	["Guardian Of Soul"] = {
		Id = 10228792558,
		Name = "Guardian Of Soul",
		Health = 300,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Archetype = "Apocryspectre",
		Color = "Green",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "When this card is suspended: It gains 200 Health and Power.",
			Ability = {
				OnSuspend = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Even if Ptenda's body had dissipated in the Planet Devourer's onslaught, his will to protect his descendants would not."
	},
	["Grieving World"] = {
		Id = 10228800063,
		Name = "Grieving World",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Terrain = true,
		Rank = 12,
		Terrariant = "Grieving World Terrarian",
		Cost = { Red = 5, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast a fighter: Set its stats to 1000/1000.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "SetHealth", 1000 },
						{ "SetPower", 1000 }
					},
					Target = "Aggressor",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Bloxburg's residents, Zanzel's phantoms, Eisenhower's experiments and Hallow's workers shared the same thought upon the Brick's destruction - Horror."
	},
	["Dwarvern Pilot"] = {
		Id = 10228794068,
		Name = "Dwarvern Pilot",
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Archetype = "Dwarf",
		Color = "Red",
		Cost = { Red = 1, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Search your deck for a Dwarf card and a Construct card. Search your deck for Chromafex if you've discarded five or more cards this turn. Cards searched this way are inert when discarded.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTutorfor", "Dwarf", "Ally" },
						{ "RandomTutorfor", "Component", "Ally" },
						{
							"AlterEV",
							{ "Set", "Playertable", "DiscardCount", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 4, "Nil" }
						},
						{
							"RepeatingTutorfor",
							{ "Sentry", "Variable" },
							"Ally"
						}
					},
					Target = "Self",
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = "The Pilots of Dwarvern Society were excited to become part of meteor-destroying sentry history, not knowing the feigned carelessness of the engineers of said sentries."
	},
	["Colossus' Final Gambit"] = {
		Id = 17800091290,
		Name = "Colossus' Final Gambit",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Gun",
		EffectAnimation = "LargeGunEffect",
		Color = "Red",
		Cost = { Red = 6, Neutral = 2 },
		Lunar = true,
		Effect = {
			Name = "BANG BANG BANG!!!",
			Description = "You lose 1500 life.\nObliterate a target enemy fighter and all copies of it in all of its zones.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 1500, "Ally" },
				{ "Extract" }
			},
			Target = "SingleEnemy"
		},
		Bio = "As his fur began to fade and flesh began to sizzle, Eclipse knew he had only one shot to break the Machine's motherboard."
	},
	NooberTuber = {
		Id = 9982591141,
		Name = "NooberTuber",
		AltCards = {
			["Motivational Bruh Gang"] = {
				Id = 130803277849680,
				Name = "Astro, Centurial Overlord",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Haaah ha ha ha! I am the star of this play, and it shall be known the world over as a masterpiece!"
			},
			["Legendary Sickle, 7Solstice7"] = {
				Id = 89752818882291,
				Name = "Legendary Sickle, 7Solstice7",
				AttackEffect = "DoomStorm",
				Commissioner = { 1406158017, 31112823 },
				AltArt = true,
				PremiumArt = 45,
				Bio = "\"City’s burning, people are dying left and right, yadda, yadda, yadda… This moron rushes me with a spoon, A FRICKIN’ SPOON! And I’m dying laughing, right? So I scoop out his stupid little eyeballs with it and his kids are all, ‘WAAAAAAH!’ And-ahahaha… I can’t even… ahahahahah! He can’t see where he’s going, he’s bumping into stuff and… I dunno, maybe you had to be there. The moral is: You're gonna die.\""
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "VolipaKatana",
		Color = "Red",
		Cost = { Red = 2, Green = 2, Blue = 2 },
		Effect = {
			Name = "Just Business",
			Description = "When this card is cast: You lose 500 life and draw 2 cards. You may discard an additional 2 cards into your baseplate this turn.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 2 },
				{ "Cost", 500 },
				{ "DiscardLimit", 2 }
			},
			Target = "Ally"
		},
		Bio = "Only one may stand to claim the Kleos Aphthiton."
	},
	["Meteoric Fist"] = {
		Id = 13662902810,
		Name = "Meteoric Fist",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		EffectAnimation = "MeteorFist",
		Color = "Red",
		Cost = { Red = 10 },
		AlternateCost = { Red = 5 },
		AlternateCostRequirement = { "Playertable", "Me", 0, 1001, "Life" },
		EffectVariable = 0,
		Effect = {
			Name = "BANG BANG BANG!!!",
			Description = "If you have 1000 or less life, cast this card using {R}{R}{R}{R}{R}. Destroy a target enemy fighter. Search your opponent's deck for a copy of that card, except its cost is {W}{W}{W}{W}.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "CardIndexOriginal", "Nil" }
				},
				{ "Destroy" },
				{
					"MoveZone",
					{ "Variable", "Deck_Opponent", "Hand_Ally", true, false }
				},
				{
					"SetCost",
					{ 4, "Neutral" },
					"AlliedAddedCard"
				}
			},
			RemoveOtherColors = true,
			Target = "SingleEnemy"
		},
		Bio = "The force of the Impact that once struck Javion, held within the Collosus' fist."
	},
	robloxandtyler = {
		Id = 9513824811,
		Name = "robloxandtyler",
		Health = 700,
		Power = 700,
		Rarity = "Common",
		AltCards = {
			["robloxandtyler-AWIH"] = {
				Id = 17600771280,
				Name = "FUN™️ Manager",
				Bio = "Need a bit of fun? Call one of our many kinds of demons to make your life even more exciting!",
				AttackEffect = "Jab",
				Summonant = "Noob-AWIH",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		Effect = {
			Name = "Stud",
			Description = "Once each turn, whenever an effect gives you a card: Summon a 400/150 Noob that's inert in play. All allied fighters gain 100 Power.",
			Ability = {
				OnAllyPut = {
					Power = {
						{ "Summon", "Round7" },
						{ "Strengthen", 100 }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 99999, "Puts" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Preservation of the history of Old Robloxia was not a mainstream task, but it was a task done nonetheless."
	},
	["Teeny Archaeologist"] = {
		Id = 10215843112,
		Name = "Teeny Archaeologist",
		AltCards = {
			["Builder, Baseplate"] = {
				Id = 128527324759513,
				Name = "Builder, Baseplatee",
				PremiumArt = 387,
				AltArt = true,
				Bio = "My time inthe graveyard was nice and all, but I think I'll be taking a souvenir. Nice, shiny and <b><font color=\"#0000FF\">yellow.</font></b>"
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Common",
		Color = "Yellow",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Description = "When this card is cast: Put a non-Colourless card that costs 1 or fewer total studs from your graveyard into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Colored_1OrLower", "GraveZone", "GenZone", true, false }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"Woah! A fish spine, cool!\""
	},
	["Rainbow Path Rider"] = {
		Id = 10235029897,
		Name = "Rainbow Path Rider",
		AltCards = {
			["Rainbow Path Rider-AN"] = {
				Id = 18771314368,
				AttackEffect = "Jab",
				Name = "Finder of the Cool Guys",
				Bio = "The joy of a complete collection after countless searches is immeasurable."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		Color = "Yellow",
		AttackEffect = "Slash",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Draw a card. Then if you have 11 or fewer cards in your graveyard, destroy the oldest card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 11 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "SpecificDiscard", 1, "AlliedLeftMostHand" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The joy of unbounded travel after countless trials is immeasurable."
	},
	["Sinister Snatchings"] = {
		Id = 9984188322,
		Name = "Sinister Snatchings",
		AltCards = {
			["Sinister Snatchings-E-Offer"] = {
				Name = "Easter Egg Theorem",
				Id = 127727578717071,
				Bio = "I'm telling you guys, the dominus is gonna be in the Egg Hunt! Stop looking in all those other worthless places..."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		CantAICast = true,
		Cost = { Yellow = 5, Neutral = 1 },
		EffectVariable = 0,
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Steal the 2 oldest cards in your opponent's hand. They draw 2 cards.\nGive yourself 2 Nascent Studs.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "CardIndex", "Nil" },
					"EnemyLeftMostHand"
				},
				{ "Add", "Variable", "Ally" },
				{ "RevealCard", 30, "AlliedAddedCard" },
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
				{
					"AlterEV",
					{ "Set", "Target", "CardIndex", "Nil" },
					"EnemyLeftMostHand"
				},
				{ "Add", "Variable", "Ally" },
				{ "RevealCard", 30, "AlliedAddedCard" },
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
				{ "Draw", 2, "Opponent" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" }
			},
			EffectSpecificDiscardObliterate = true,
			Target = "Self"
		},
		Bio = "Few things anger the Umberlord. Messing with his family is one of them; Something the Orinthians did not account for."
	},
	["Ancient Imp"] = {
		Id = 10235039156,
		Name = "Ancient Imp",
		AltCards = {
			["Ancient Imp-Inno"] = {
				Id = 11865480154,
				Bio = "Free, unattended Power? Why don't mind if I do!"
			}
		},
		Health = 1200,
		Power = 200,
		Rarity = "Uncommon",
		Color = "Yellow",
		AttackEffect = "Inferno",
		Cost = { Yellow = 5 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: It deals 1000 damage to all fighters with 1000 or more Power.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 1000 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "Power",
						Modifier = 1000
					}
				}
			}
		},
		Bio = "Possessing frail bodies and thought long-extinct, the distant cousins of demonkind rely on illusions, tiring their foes."
	},
	["Core Of Chrome"] = {
		Id = 10224185346,
		Name = "Core Of Chrome",
		AltCards = {
			["Core Of Chrome-Banner"] = {
				AttackEffect = "Storm",
				Id = 10251037347,
				Bio = "\"Safety protocols\" was not a term known to many of the dwarves."
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Rare",
		Color = "Yellow",
		AttackEffect = "Slash",
		Overload = true,
		Cost = { Yellow = 4, Red = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "Once each turn, whenever you discard the last card in your hand: This card gains 1500 power.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Strengthen", 1500, "Self" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 0, 1, "Hand" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "A terrifying machine which processed vast batches of metal into all kinds of weaponary, the input seems to have bits of hair and bone though."
	},
	DevUltra = {
		Id = 9972372256,
		Name = "DevUltra",
		AltCards = {
			["DevUltra-Quest"] = {
				Id = 10348254150,
				AttackEffect = "LinkedSword",
				Name = "Failed Expirement",
				Bio = "There's something here for everyone. Join us."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		Color = "Yellow",
		AttackEffect = "Slash",
		TransformImmune = true,
		Cost = { Yellow = 2, Green = 2, Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast, if you have no Red cards in your baseplate: Transform all allied fighters into random fighters, then reset a target fighters stats.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTransform", "Fighter", "Ally" },
						{ "Reset" }
					},
					Target = "Single",
					EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Red" }
				}
			}
		},
		Bio = "Veteran programmer and creator of Escape Room. Don't expect yourself to outrun him."
	},
	["NEKO-BOT 9002"] = {
		Id = 10228847745,
		Name = "NEKO-BOT 9002",
		AltCards = {
			["Otzizapat & Indiana-Funz"] = {
				Id = 10839372553,
				AttackEffect = "Arcane",
				Name = "Otzizapat & Indiana-Funz",
				AltArt = true,
				Bio = "\"Those hieroglyphs on the walls and the treasure in your bag obscure enough for you?\""
			}
		},
		Health = 900,
		Power = 600,
		Rarity = "Epic",
		Color = "Yellow",
		AttackEffect = "Slash",
		Cost = { Yellow = 3, Red = 1, Blue = 1, Neutral = 3 },
		EffectVariable = 0,
		SummonAnimation = "NekoBotSummon",
		EffectAnimation = "NekoBot",
		Effect = {
			Description = "When this card is cast: Destroy a target allied fighter. Summon a fighter with the same total stud cost as the destroyed fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"SingleAlly"
						},
						{ "Destroy", 30, "SingleAlly" },
						{ "RandomSummon", "Fighter VariableorExactCost" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Eisenhower sardonically built the robot to protect and comfort his returned husband. Artemis believed it did neither."
	},
	["Providence Shot"] = {
		Id = 10228848771,
		Name = "Providence Shot",
		AltCards = {
			["moth shot"] = {
				Id = 113563714420231,
				Name = "moth shot",
				AttackEffect = "StudBlast",
				Bio = "stupid moth i'm ballin'",
				PremiumArt = 391,
				AltArt = true
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 12, Green = 1, Blue = 1, Yellow = 1 },
		TriggerInHand = true,
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "This card costs {W} less for each card in your opponent's graveyard.\nObliterate your opponent's graveyard and a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Obliterate", 30, "Single", nil, nil, "ProvidenceShot" },
						{
							"GraveZoneDiscard",
							{ "Blue", 0 }
						},
						{
							"GraveZoneDiscard",
							{ "Green", 0 }
						},
						{
							"GraveZoneDiscard",
							{ "Red", 0 }
						},
						{
							"GraveZoneDiscard",
							{ "Yellow", 0 }
						},
						{
							"GraveZoneDiscard",
							{ "Neutral", 0 }
						}
					},
					Target = "Opponent"
				},
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "NoOverwriteSave", "Target", "NeutralCost", "BaseCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GraveZone_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", "SavedVariable", "BaseCost" }
						},
						{
							"SetCost",
							{ "Variable", "Neutral" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "<i>'Borrowing'</i> Ghashendex's orbital cannon was a tough job, but nothing new in terms of cruelty for the ex-Lord of the Pits."
	},
	["Two by Two, Spirit of Shards"] = {
		Id = 10089828811,
		Name = "Two by Two, Spirit of Shards",
		Health = 700,
		Power = 300,
		Rarity = "Epic",
		Color = "Neutral",
		AttackEffect = "Slash",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Description = "When this card is cast or during your end step: Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Self",
					MetaData = { Fleeting = true }
				},
				OnEnd = {
					Power = { { "Add", "Addant" } },
					Target = "Self",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "Pieces of itself scattered across an endless distance of time and space. It refused to die broken."
	},
	["Shatter Into Shards"] = {
		Id = 10120379422,
		Name = "Shatter Into Shards",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Color = "Neutral",
		AttackEffect = "Slash",
		Token = true,
		Cost = { Neutral = 3, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Description = "Transform a target allied fighter into this card, then divide it into 4 copies of itself.\nWhen this card dies: Shuffle an Era card into your deck, then draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Transform", "Shatter Into Shards", "SingleAlly" },
						{ "SummonSplit", 4, "AlliedFirstFieldSelfCopy" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "RandomDeckAdd", "Era", "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "As Zanzel held the Brick against the Collosus' attack, she failed to notice the cracks that spread throughout the surface - as well as the glimpes of four factions once lost to time."
	},
	Snakeworl = {
		Id = 9982596003,
		Name = "Snakeworl",
		AltCards = {
			["Fluffle & Leaf, Scapeghosts"] = {
				Id = 137982174897680,
				Name = "Fluffle & Leaf, Scapeghosts",
				AttackEffect = "Flame",
				AltArt = true,
				PremiumArt = 16,
				Bio = "We're expendable, sustainable indeed - Just blame us, frame us, and let us be."
			},
			["Snakeworl-E"] = {
				Name = "Sir Pentious of the Eggs",
				Id = 17014188019,
				Bio = "I don't think this suit quite fits Easter Sunday, minions..."
			}
		},
		Health = 800,
		Power = 900,
		Rarity = "Epic",
		Color = "Yellow",
		AttackEffect = "Slash",
		Rank = 10,
		Cost = { Neutral = 3, Yellow = 7 },
		Effect = {
			Description = "Whenever this card is cast or attacks: Obliterate your deck. Shuffle a copy of your hand into your deck, then draw 3 cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RemoveDeck", 999 },
						{
							"MoveZone",
							{ "FullHand", "Hand_Ally", "Deck_Ally", true, true, 10 },
							"Self"
						},
						{ "Draw", 3 }
					},
					Target = "Ally"
				},
				OnAttack = {
					Power = {
						{ "RemoveDeck", 999 },
						{
							"MoveZone",
							{ "FullHand", "Hand_Ally", "Deck_Ally", true, true, 10 },
							"Self"
						},
						{ "Draw", 3 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Many great stories have been told through all sorts of media. Retelling them in a more interactive fashion is truly an amazing idea!"
	},
	["Neodragon Foretold Return Through Temporal Destruction"] = {
		Id = 10228713004,
		Name = "Neodragon Foretold Return Through Temporal Destruction",
		AltCards = {
			["Neodragonmaid Teatime"] = {
				Id = 12326029700,
				Name = "Neodragonmaid Teatime",
				Bio = "Despite them all fighting to win over the love of Lord Cobalt, the Neodragonmaids always come together to share a round of Neodragonleaf tea."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Archetype = "Neodragon",
		Effect = {
			Name = "Temporal Halo",
			Description = "Summon up to 3 Neodragons in your graveyard that have died this game, except they're terrified.\nUnlock all allied Neodragons.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{
						"Neodragon_HasDied_Fighter",
						"GraveZone_Ally",
						"Field_Ally",
						true,
						false,
						3
					},
					"Self"
				},
				{ "Unlock", 9999, "AlliedArchetype" }
			},
			MetaData = { Terrified = true },
			Target = "Ally"
		},
		Bio = "The only thing that held the Neodragon's return was the Alpha Brick."
	},
	["Donald McGillavry"] = {
		Id = 10006255495,
		Name = "Donald McGillavry",
		AltCards = {
			McGillavry = {
				Id = 16959261415,
				Name = "McGillavry",
				Bio = "Great! I can't wait to bomb some Drakobloxxers!"
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "LinkedSword",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast another Colourless fighter: Give yourself a Classic Roblox Tool card.",
			Type = "On|Other|AllySummon",
			Power = { {
				"RandomAdd",
				{
					"Linked Sword",
					"Trowel",
					"Rocket Launcher",
					"Superball",
					"Slingshot"
				}
			} },
			Color = "Neutral",
			Target = "Ally"
		},
		Bio = "\"Well, excuuuuuuuuuse me, princess!"
	},
	["Powerstone Tower"] = {
		Id = 10204161395,
		Name = "Powerstone Tower",
		Health = 1000,
		Power = 200,
		Rarity = "Common",
		Color = "Yellow",
		AttackEffect = "Slash",
		Cost = { Yellow = 1, Green = 1, Blue = 1, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever another allied fighter attacks: Until their next end step, this card loses all its power and that fighter gains that much power.",
			Ability = {
				["On|Other|AllyAttack"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "TempWeaken", "Variable", "Self" },
						{ "TempStrengthen", "Variable", "Aggressor" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Orinthians needed a way to establish waypoints from the vast regions of space to specific planets. This was how."
	},
	audi80 = {
		Id = 10228805895,
		Name = "audi80",
		AltCards = {
			["Dustin, the Pingbreaker"] = {
				Id = 77518121031163,
				AttackEffect = "Jab",
				Name = "Friends that don't personally help you",
				AltArt = true,
				Bio = "Untrueity: Hey! Im untrueity!!!!!!!!!! ask me something!!! i know... nothing ...!!!!!!!<br/>Helpity: WHAT??????? YOU ARE STUPID!!!!!!!!!!!!!!!! YOURE STINKY!!!!!!!!!!!!!!!!!!!!!!!! GET OOFED!!!!!!!!!!!!!!<br/>yuki: oh my telamon  what is yall doing"
			},
			["audi80-Hal"] = {
				Id = 14693021189,
				AttackEffect = "VampBite",
				Name = "Kuchisake-Onna",
				Bio = "<font color=\"#FF0000\">Am I pretty now?</font>"
			},
			["audi80-Mango"] = {
				Name = "Timbleson",
				Id = 105531904589206,
				AttackEffect = "JohnAttack",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "<b>\"I was the first. I have seen everything\"</b>"
			}
		},
		Health = 1350,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "Slash",
		NegateAction = true,
		Dextrous = true,
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 7 },
		EffectVariable = 0,
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
		Bio = "Born to WipeOut. Forced to Tycoon."
	},
	monkrymonkry = {
		Id = 9984207635,
		Name = "monkrymonkry",
		AltCards = {
			["monkrymonkry-Hal"] = {
				Id = 14905814024,
				Name = "brandon6875935",
				AttackEffect = "Divinity",
				Bio = "Green keeps the place clean!"
			},
			["Evil People"] = {
				Id = 83500232852247,
				Name = "Evil People",
				AttackEffect = "AnglerBite",
				AltArt = true,
				PremiumArt = 550,
				Bio = "We're red because were evil. We're evil and want to kill you."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Overload = true,
		Cost = { Red = 4 },
		Equippant = "Marked Mod",
		Effect = {
			Description = "When this card is cast: Attach marked to all fighters.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant" } },
					Target = "All"
				}
			}
		},
		Bio = "An obby so super fun, you'll probably forget that Time itself had been broken not two minutes ago!"
	},
	Bricktronic = {
		Id = 9984190376,
		Name = "Bricktronic",
		Health = 900,
		Power = 200,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Bubbles",
		Overload = true,
		Cost = { Red = 2, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: It gains 400 power for each allied fighter with total stats 1500 or more.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Gigant", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 400, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Come 'round and take a splash! Better make sure you don't get wiped out."
	},
	maxxz = {
		Id = 9982593942,
		Name = "maxxz",
		AltCards = {
			["maxxz-AN"] = {
				Id = 13660131851,
				AttackEffect = "Hammer",
				Name = "Infernal Executioner",
				Bio = ""
			},
			["V.I.Free"] = {
				Id = 79899798632028,
				Name = "V.I.Free",
				PremiumArt = 379,
				AltArt = true,
				Bio = "The dark of blindness is hard to fathom until one is truly blind.",
				AttackEffect = "Flare"
			}
		},
		Health = 100,
		Power = 1000,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Overload = true,
		Cost = { Red = 2, Neutral = 1 },
		ChargeRequirement = { "Playertable", "Me", 0, 1001, "Life" },
		Effect = {
			Description = "If you have 1000 or less life, this card has haste.",
			Ability = {
				OnEVCheckFail = {
					Power = { { "Draw", 0 } },
					Target = "Self"
				}
			}
		},
		Bio = "Ex-Official Roblox game reviewer, Don't ask him to review your deck."
	},
	["Junk Hunter"] = {
		Id = 9984187770,
		Name = "Junk Hunter",
		AltCards = {
			["Junk Hunter-AN"] = {
				Id = 18199514656,
				AttackEffect = "Slash",
				Name = "Wasteland Scavenger",
				Bio = "...And only rats had remained on the wasteland."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 3, Neutral = 1 },
		EffectVariable = 0,
		Equippant = "Marked Mod",
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Effect = {
			Description = "When this card is cast: Attach marked to a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant", "Single" } },
					Target = "Single"
				}
			}
		},
		Bio = "Eclipse barely felt something stain the fur on his back. In the destruction of the dwarves, had only the rats remained?"
	},
	["Burn The Heathens"] = {
		Id = 14255951789,
		Name = "Disinfected Barrens",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Terrain = true,
		Terrariant = "Burn The Heathens Terrain",
		Cost = { Green = 4 },
		CustomReminder = {
			["Unrelenting Filth"] = "A fighter with overload deals excess damage when it attacks a fighter to its opponent."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or at the start of each players' turn: All fighters gain overload.",
			Ability = {
				OnSummon = {
					Power = { { "GivePassive", "Overload" } },
					Target = "All"
				},
				OnStart = {
					Power = { { "GivePassive", "Overload" } },
					Target = "All"
				}
			}
		},
		Bio = "The Anthrests were proud of their large number of friends. Zanzel was relieved that the flames would spread their crowd like wildfire."
	},
	["Scrap Slinger"] = {
		Id = 140692301262182,
		Name = "Scrap Slinger",
		AltCards = {
			["Scrap Slinger-AN"] = {
				Id = 13697405725,
				Name = "Slenderman",
				AttackEffect = "DoomStorm",
				Bio = "Find the eight pages to best me. All you have to do is ring the bell by the hotel reception."
			},
			["0x2991"] = {
				Id = 95907886445705,
				Name = "0x2991; Like a Ghost",
				SummonAnimation = "AstarossaSummon",
				SummonedAnimation = "AstarossaSummon",
				AltArt = true,
				PremiumArt = 60,
				Commissioner = { 453037091 },
				AttackEffect = "DoomSlash",
				Bio = "I who wander around at night<br/>Like a ghost<br/>If only we could live like this in the afterlife<br/>In a city where no voice can be heard"
			}
		},
		Health = 650,
		Power = 400,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 2, Neutral = 3 },
		EffectVariable = 0,
		Equippant = "Marked Mod",
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Effect = {
			Description = "After this card attacks: Attach marked to a target fighter.\nThis card can't be counterattacked by marked fighters.",
			Ability = {
				OnAttack = {
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
				OnAttackEnd = {
					Power = {
						{ "EquipGear", "Equippant", "Single" },
						{ "RemovePassive", "CounterAttackBlock" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "GivePassive", "CounterAttackBlock" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "The dwarves could prosper or crumble for all they cared: Vultures always thrive."
	},
	["Alloy Appraiser"] = {
		Id = 120607707293848,
		Name = "Alloy Appraiser",
		AltCards = {
			["ADeadBody14, IMMINENT DEADSTRUCTION"] = {
				Id = 110179208267400,
				Name = "ADeadBody14, IMMINENT DEADSTRUCTION",
				AltArt = true,
				PremiumArt = 99,
				Commissioner = { 2447703770, 31112823 },
				AttackEffect = "Bat",
				Bio = "\"When you meet death, tell him that he owes me 20 bucks.\""
			},
			["NTPinheiro 180,000,000 Fahrenheit"] = {
				Id = 86826543117810,
				Name = "NTPinheiro: 180,000,000 Fahrenheit",
				AltArt = true,
				PremiumArt = 820,
				AttackEffect = "Flare",
				Bio = "\"There's something wrong with me\" in a whisper."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Equippant = "Marked Mod",
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Effect = {
			Description = "When this card is cast: Attach marked to a target fighter.\nOnce each turn, whenever a marked fighter dies: You lose 400 life and draw a card.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant", "Single" } },
					Target = "Self"
				},
				OnAnyDeath = {
					Power = {
						{ "Cost", 400 },
						{ "Draw", 1 }
					},
					Target = "Ally",
					Marked = "True",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Two fully intact war machines filled with live ammunition? Vintage stuff. I'll give ya 600 for the whole lot.\""
	},
	HighlanderB2 = {
		Id = 10223603506,
		Name = "The Visitor",
		AltCards = {
			["Captain Fluffle"] = {
				Id = 78801882489552,
				Name = "The Mutated Hunter",
				AltArt = true,
				PremiumArt = 130,
				AttackEffect = "ModernRocket",
				Bio = "Tell Shirley I'm sorry. Please."
			},
			["The Visitor-V"] = {
				Id = 16056313968,
				Name = "Sailor Selene",
				AttackEffect = "Punch",
				Bio = "\"I am a Guardian who fights for Love and Justice. I am Sailor Selene! And now in the name of the moon, I shall punish you!\""
			},
			["HighlanderB2-AWIH"] = {
				Id = 17600748642,
				Name = "The Tuner",
				Bio = "Through the Tune my eye perceives. To the Tune my devotion lies.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Rank = 5,
		Cost = { Blue = 6 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Description = "When this card is cast: Lock all allied fighters for 3 turns. They gain 100 health and Power.\nWhenever you discard your fifth card each turn: You gain 600 life. Unlock all allied fighters, then lock this card for 1 turn.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Cost", -600 },
						{ "Unlock", 9999 },
						{ "Lock", 1, "Self" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 5, 6, "DiscardCount" }
				},
				OnSummon = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 },
						{ "Lock", 3 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "As Time broke, so did the patience of those who controlled it."
	},
	HighlanderG2 = {
		Id = 9984193523,
		Name = "Syphil, Patient Zero",
		AltCards = {
			["Intruder 806 - Flufflefunz"] = {
				Id = 132471466929512,
				AttackEffect = "Knife",
				AltArt = true,
				Name = "JPEG.MP3",
				Addant = "THE CERVINE",
				Bio = "Get back to work."
			},
			["HighlanderG2-AWIH"] = {
				Id = 17600716877,
				Name = "Claudia, Queen of Beasts",
				AttackEffect = "Slash",
				Addant = "Anthrested Knight-AWIH",
				Bio = "\"None of my brothers like my dearies... They simply aren't cultured enough, I suppose~\"",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Rank = 5,
		Cost = { Green = 6 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Gladiator = true,
		AddBlock = true,
		Addant = "Anthrested Knight",
		Effect = {
			Description = "Once each turn, whenever you discard a card: Give yourself a 200/200 Anthrested Knight.\nWhenever an Anthrested Knight dies: This card gains 200 Health.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "Add", "Addant" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				},
				OnAnyDeath = {
					Power = { { "Heal", 200 } },
					Target = "Self",
					LibraryIndex = "Anthrested Knight"
				}
			}
		},
		Bio = "Self-destruction can be elusive, taking form in greed, selfishness, or an excessive amount of beauty products, and if left to grow, can even destroy others."
	},
	HighlanderR2 = {
		Id = 10228797146,
		Name = "Bharrom, Resourceful Vagabond",
		AltCards = {
			["Lucy, Violent Worldwarper"] = {
				Id = 10919712270,
				AltArt = true,
				AttackEffect = "Jab",
				Name = "Lucy, Violent Worldwarper",
				Bio = "She puts up a good fight."
			},
			["HighlanderR2-AWIH"] = {
				Id = 17600685570,
				Name = "The Nocturnal",
				AttackEffect = "XhartyrSlash",
				Bio = "Would be a shame if someone tried to ruin it.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Rank = 5,
		Cost = { Red = 6 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Description = "Whenever an allied fighter dies: all allied fighters gain 100 power.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Strengthen", 100 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Dwarves held an ambition for progress as strong as the meteor that had struck their lands long ago. Both brought destruction."
	},
	HighlanderY2 = {
		Id = 9984191263,
		Name = "Axelaide the Demon Duck",
		AltCards = {
			["HighlanderY2-Banner"] = {
				Id = 10222391030,
				AttackEffect = "MagicRed",
				Bio = "\"They grow up so fast!\""
			},
			["HighlanderY2-Banner-Easter"] = {
				Id = 12941978890,
				Name = "Axelaide, Egg Hunt Host",
				AttackEffect = "Microphone",
				Addant = "Rubber Duck Fighter-Banner-Easter",
				Bio = "<i>What? Egg hunting's fun! Don't blame Hell for also adopting the event!</i>"
			},
			["Axelaide, Troublemaking Delinquent"] = {
				Id = 13359652612,
				AttackEffect = "Scratch",
				Name = "Axelaide, Troublemaking Delinquent",
				Commissioner = { 14640960 },
				AltArt = true,
				PremiumArt = 30,
				Bio = "You’d think that with Kara sinister as his legal guardian he’d behave and try not to cause any problems."
			},
			["HighlanderY2-AWIH"] = {
				Id = 17600809643,
				Name = "Felicia, Gracious Sister",
				AttackEffect = "Microphone",
				Addant = "Rubber Duck Fighter-AWIH",
				Bio = "The endearing half of the Pits' hosts. The spectators love her! The fundebted... tolerate her.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Rank = 5,
		Cost = { Yellow = 6 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Addant = "Rubber Duck Fighter",
		CustomReminder = {
			["Rubber Duck"] = "A free 100/100 fighter that is inert in all zones."
		},
		Effect = {
			Description = "Once each turn, whenever you cast a fighter: Give yourself a 100/100 Rubber Duck.\nWhenever a Token fighter dies: All Allied Token fighters gain 100 Health and Power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Add", "Addant" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnAnyDeath = {
					Power = {
						{ "Heal", 100, "AllyToken" },
						{ "Strengthen", 100, "AllyToken" }
					},
					Target = "Ally",
					Rarity = "Token"
				}
			}
		},
		Bio = "In the ensuing chaos, Hallow could not ignore a familiar face amongst the bloodshed - his tormentor's pet."
	},
	["Rubber Duck Fighter"] = {
		Id = 7128383934,
		Name = "Rubber Duck",
		AltCards = {
			["Rubber Duck Fighter-Banner-Easter"] = {
				Id = 12941976890,
				Name = "Devilish Egg Hunters",
				Bio = "<i>THE ARENA IS READY!!!!!!!!!</i>"
			},
			["Rubber Duck Fighter-AWIH"] = {
				Id = 17600813471,
				Name = "Duckie Stand-In",
				AttackEffect = "Jab",
				Bio = "\"What a load of QUACK, am I right?\" -Joshriel",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		TokenOmni = true,
		Archetype = "Rubber Duck",
		HideArchetype = true,
		Cost = { Yellow = 0 },
		Effect = {
			Name = "Quack",
			Description = ".",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Teh epik duck came and went, unaware of her presence. Kara put her claws away, her strength saved for the fight ahead."
	},
	HighlanderW2 = {
		Id = 10224402021,
		Name = "Guston, Jury of Winds",
		AltCards = {
			["HighlanderW2-AN"] = { Id = 10017368847, Name = "Guston", Bio = "It's WIMNDY!" },
			["HighlanderW2-AWIH"] = {
				Id = 17540224002,
				Name = "Imp the Imp",
				Bio = "An imp of culture.",
				AttackEffect = "Jab",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Corporate Camaraderie"] = {
				Id = 13359647271,
				Name = "Corporate Camaraderie",
				AttackEffect = "IcePunch",
				EffectAnimation = "CrowdsFavour",
				Commissioner = { 90658630 },
				AltArt = true,
				Bio = "It was indeed a great day, on which the first ever Mac Iris barely passed an health inspection."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Gust",
		EffectAnimation = "MidGustEffect",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Rank = 5,
		AddBlock = true,
		Gladiator = true,
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Choose a target fighter. All players shuffle all cards of that fighter's colour in their graveyard into their deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Color", "Nil" },
							"Single"
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Ally", "Deck_Ally", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Opponent", "Deck_Opponent", true, false, 99 },
							"Self"
						},
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The destruction of time brought forth an old era of the Pits, before the demons had taken it for their own explotation."
	},
	["Chronological Leak"] = {
		Id = 17791031348,
		Name = "Chronological Leak",
		AltCards = {
			["Safety Not Guaranteed"] = {
				Id = 12896074838,
				Name = "Safety Not Guaranteed",
				AltArt = true,
				PremiumArt = 11,
				Bio = "WANTED: Somebody to go back in time with me. This is not a joke. P.O. Box 420, Pwntown, EZ, 99999. You'll get paid after we get back. Must bring your own weapons. Safety not guaranteed. I have only done this once before."
			},
			["Kafka, Master of Time"] = {
				Id = 102542677056219,
				Name = "Kafka, Master of Time",
				PremiumArt = 860,
				Commissioner = { "Kafka" },
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "They call her the Mother of all Zeitgest, she appears to be the only human able to contact them. If you can even call her that. She appears to posses a strange ability to summon and control Zeitgest at will."
			},
			["Chronological Leak-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 96652914057243,
				Bio = "Wish we could turn back time to the good old days\nWhen our mama sang us to sleep, but now we're stressed out"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 1 },
		EffectAnimation = "ChronologicalLeak",
		Effect = {
			Name = "Stud",
			Description = "Summon the Zeitgeist of a target fighter, a 600/500 fighter. Its effect is based on what pack the fighter is in.",
			Ability = {
				OnSummon = {
					Power = { { "SummonZeitgeist", "Ally", "Single" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The shattering of the Brick opened cracks into a realm no mortal had ever seen. This did not make 𝘩𝘪𝘮 very happy."
	},
	["Regen Coil"] = {
		Id = 97594359574633,
		Name = "Regen Coil",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "RegenCoilEffect",
		Color = "Green",
		Cost = { Green = 2 },
		CustomReminder = {
			Regenerating = "A regenerating fighter gains 100 health during its end steps."
		},
		Effect = {
			Name = "Stud",
			Description = "A target allied fighter gains 200 health. Attach regenerating to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Regenerating Mod" },
						{ "Heal", 200 }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Old Robloxia technology had long gone defunct, but the potential it had was immeasurable."
	},
	["Anthrested Propagator"] = {
		Id = 11181054473,
		Name = "Anthrested Propagator",
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Red = 1, Green = 1, Yellow = 1, Neutral = 3 },
		Archetype = "Anthrest",
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Advance your anthrestation, then search your deck for an equally anthrested card.",
			Type = "OnSummon",
			Power = {
				{ "Anthrest", 1 },
				{
					"AlterEV",
					{ "Set", "Playertable", "Anthrestation", "Nil" },
					"Self"
				},
				{ "RandomTutorfor", "VariableorAnthrestTide", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "In the rare circumstance that someone had matched the Anthrests' beauty standards, they were allowed to thrive along with the flock."
	},
	["Artemis, the Illusionist"] = {
		Id = 9996489740,
		Name = "Artemis, the Illusionist",
		AltCards = {
			["Adam, Harbinger of Ruin"] = {
				Id = 10823477592,
				AltArt = true,
				Name = "Adam, Harbinger of Ruin",
				AttackEffect = "DoomStorm",
				Addant = "THE END OF ALL THAT IS HOLY",
				Effect = {
					Description = "After this fighter attacks or is attacked: Suspend it from play until the next end step. Give yourself THE END OF ALL THAT IS HOLY.\nWhen this card dies: Destroy all THE END OF ALL THAT IS HOLY in your hand.",
					Ability = {
						OnAttackEnd = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnAttacked = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = { { "ArchetypeDiscard", 999, "Ally", "Vanishing Follow-Up" } },
							Target = "Self"
						}
					}
				},
				Bio = "The comedian always has the last laugh."
			},
			["Wondering About You"] = {
				Id = 79945975314725,
				Name = "Wondering About You",
				Addant = "The Flow of Calamity",
				Effect = {
					Description = "After this fighter attacks or is attacked: Suspend it from play until the next end step. Give yourself The Flow of Calamity.\nWhen this card dies: Destroy all The Flow of Calamity in your hand.",
					Ability = {
						OnAttackEnd = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnAttacked = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = { { "ArchetypeDiscard", 999, "Ally", "Vanishing Follow-Up" } },
							Target = "Self"
						}
					}
				},
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 449,
				Bio = "Wondering About You. The flow of calamity will attack you."
			},
			MemeyChuMastermind = {
				Id = 135963424407757,
				Name = "苹果大人, Mastermind",
				Effect = {
					Description = "After this fighter attacks or is attacked: Suspend it from play until the next end step. Give yourself 流石甲.\nWhen this card dies: Destroy all The 流石甲 in your hand.",
					Ability = {
						OnAttackEnd = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnAttacked = {
							Power = {
								{ "Suspend" },
								{ "Add", "Addant", "Ally" }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = { { "ArchetypeDiscard", 999, "Ally", "Vanishing Follow-Up" } },
							Target = "Self"
						}
					}
				},
				Addant = "MemeyChuVanish",
				Commissioner = { "MemeyChu" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 740,
				Bio = "This is a war to end all wars Poweraid. If we fight to the death here, he would have died in vain. The price has been paid, don’t waste the sacrifice.<br/>STOP CALLING ME THAT YOU OLD HEAD!!!"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Legendary",
		Color = "Neutral",
		AttackEffect = "MagicRed",
		Cost = { Red = 2, Neutral = 2, Blue = 4 },
		Addant = "Vanishing Follow-Up",
		CustomReminder = {
			["Vanishing Followup"] = "A colourless 🔴🔴🔵🔵 action. It deals 200 damage to a target fighter for each allied Vanishing Follow-Up you have anywhere."
		},
		Effect = {
			Description = "After this fighter attacks or is attacked: Suspend it from play until the next end step. Give yourself a Vanishing Follow-Up.\nWhen this card dies: Destroy all Vanishing Follow-Ups in your hand.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{ "Suspend" },
						{ "Add", "Addant", "Ally" }
					},
					Target = "Self"
				},
				OnAttacked = {
					Power = {
						{ "Suspend" },
						{ "Add", "Addant", "Ally" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = { { "ArchetypeDiscard", 999, "Ally", "Vanishing Follow-Up" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I can show you something far more grand than a few street tricks!\""
	},
	["Vanishing Follow-Up"] = {
		Id = 9996490397,
		Name = "Vanishing Follow-Up",
		AltCards = {
			["THE END OF ALL THAT IS HOLY"] = {
				Id = 10823482421,
				Name = "THE END OF ALL THAT IS HOLY",
				Bio = "In an optimal world I'd have helped you, but someone had to lose."
			},
			["The Flow of Calamity"] = {
				Id = 134655225510111,
				Name = "The Flow of Calamity",
				Bio = "The act of \"pursuance\" is certain to become a severe \"disaster\" that is returned to the attacker. That is because the \"flow of calamity\" is the \"flow of reason\"! The \"logic\" of this world is linked in a continuous chain. To overcome that and reach me is not possible."
			},
			MemeyChuVanish = {
				Id = 138375499782302,
				Name = "流石甲",
				Bio = "So thats how it is then, die."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Archetype = "Vanishing Follow-Up",
		HideArchetype = true,
		Cost = { Blue = 2, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "Deal X damage to a target fighter. X is 200 damage for each allied Vanishing Follow-up in any zone.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Hand_Ally", "Vanishing Follow-Up", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Deck_Ally", "Vanishing Follow-Up", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "GenZone_Ally", "Vanishing Follow-Up", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "GraveZone_Ally", "Vanishing Follow-Up", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 200, "Nil" }
						},
						{ "Damage", "Variable" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "\"Think fast!\""
	},
	mightybaseplate = {
		Id = 11772217074,
		Name = "mightybaseplate",
		AltCards = {
			["mightybaseplate-Banner"] = {
				Name = "Pack Doctor",
				Id = 11778054534,
				Bio = "Lets see what's inside the pack."
			},
			["mightybaseplate-H25"] = {
				Id = 81659142830632,
				Name = "Spookybaseplate",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "I'll give you free headless"
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent discards their first card each turn: Give yourself a copy of that card. Convert all {R} and {B} in its cost to {G} and {Y}.",
			Ability = {
				OnEnemySecondDiscard = {
					Power = { { "AddCopy" } },
					Target = "Aggressor",
					MetaData = {
						ConvertColors = { Red = "Green", Blue = "Yellow" }
					}
				}
			}
		},
		Bio = "\"Counter and strike. Thats how you get by amidst this chaos.\""
	},
	["Neoancient Reappearance"] = {
		Id = 11772057782,
		Name = "Neoancient Reappearance",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Recur all allied Stud cards and remove {W}{W} from their cost.\nA target allied fighter gains 300 health and power for each non-token card removed from your graveyard after casting this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "NotToken", "Nil" }
						},
						{
							"MoveZone",
							{
								"Neodragon Super God Circle Stud EX",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false,
								99
							}
						},
						{
							"MoveZone",
							{ "Studling", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Red Titanic Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Green Titanic Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Blue Titanic Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{
								"Yellow Titanic Stud",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false,
								99
							}
						},
						{
							"MoveZone",
							{ "Red Crystal", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Green Crystal", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Blue Crystal", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Yellow Crystal", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Broken Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{
								"Disintegrating Stud",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false,
								99
							}
						},
						{
							"MoveZone",
							{ "Cosmic Studs", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Circle Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Mark Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"MoveZone",
							{ "Nascent Stud", "GraveZone_Ally", "Hand_Ally", true, false, 99 }
						},
						{
							"AlterEV",
							{ "Subtract", "GraveZone_Ally", "NotToken", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { AddNeutralCost = -2 }
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "The destruction of the Alpha Brick destroyed the seal that banished the dragons aeons ago. Infused with their titan cellmates, they wish to subjugate Robloxia once again."
	},
	cardgamechampion = {
		Id = 11772061461,
		Name = "cardgamechampion",
		AltCards = {
			["Wendygo, the Liver Scorcher"] = {
				Name = "DJCrash7",
				AttackEffect = "Inferno",
				Id = 135856935135429,
				AltArt = true,
				Bio = "♬-you might not believe your eyes -♬"
			},
			R4T = {
				Id = 116771377049199,
				Name = "R4T",
				AttackEffect = "Jab",
				SummonAnimation = "SummonAzureless",
				AltArt = true,
				PremiumArt = 540,
				Bio = "🐭"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Deal 800 damage to a random fighter. If this card damages himself with this effect, all players lose all {R}{G}{B}{Y}.",
			Ability = {
				OnEnd = {
					Power = { { "Damage", 800 } },
					Target = "RandomField"
				},
				OnSelfDamage = {
					Power = {
						{ "SetRed", 0 },
						{ "SetBlue", 0 },
						{ "SetGreen", 0 },
						{ "SetYellow", 0 }
					},
					Target = "All"
				}
			}
		},
		Bio = ""
	}
}
