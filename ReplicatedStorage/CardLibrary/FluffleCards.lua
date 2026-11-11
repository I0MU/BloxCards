



return {
	ultrag_oat = {
		Id = 17107609953,
		Name = "ultrag_oat",
		AltCards = {
			["Watt Volts"] = {
				Id = 120794618224404,
				Name = "Watt Volts",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 564,
				Bio = ""
			}
		},
		Health = 750,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2, Yellow = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Scare the scammers"] = "If a terrified fighter's in play during its end step, obliterate it.",
			["Quit like a boss"] = "Remove an obliterated fighter from the game completely, as if it never existed."
		},
		PackDisplayOverride = "Card Puzzles",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Deal 200 damage to all epic and legendary fighters and unlock them. Attach terrified to those fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 200 },
						{ "EquipGear", "Terrified Mod" },
						{ "Unlock", 9999 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "Rarities",
						Modifier = {
							Rarities = { "Epic", "Legendary" }
						}
					}
				}
			}
		},
		Bio = "Original owner of the rarest limited of all time. Shoutout for beating cancer!"
	},
	CKK1 = {
		Id = 6906762902,
		Name = "Kara Sinister",
		PlayTest = true,
		AddBlock = true,
		Health = 50,
		Power = 1300,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1, Yellow = 1 },
		Archetype = "Sinister",
		ChargeRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the crowd's favour: Unlock it. Destroy a target enemy fighter.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999, "Self" },
				{ "Destroy", 30, "SingleEnemy" }
			},
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "A lesser Revel demon, wronged by Umberhallow. Her lust for revenge brought her to the Pits with a single goal: Put Lord Umberhallow through the same pain he brought to her and her fundebted husband."
	},
	CKK2 = {
		Id = 5832350364,
		Name = "David Crissbach II",
		PlayTest = true,
		AddBlock = true,
		Health = 200,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "SMG",
		Color = "Red",
		Archetype = "Survivor",
		Cost = { Neutral = 2, Red = 8 },
		TransformImmune = true,
		CounterAttackBlock = true,
		BypassOverdrive = true,
		Transformant = "David Crissbach",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All allied fighters transform into a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "Ally"
		},
		Bio = "\"Let me give you advice my father gave me when he got divorced: Control what you can. Accept what you can't.\""
	},
	CKK3 = {
		Id = 2817088154,
		Name = "Den_S+",
		PlayTest = true,
		AddBlock = true,
		Health = 150,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1 },
		AssignHalfsies = true,
		Charge = true,
		CounterAttackBlock = true,
		Effect = {
			Name = "Roller Coaster",
			Description = "During combat, this card assigns damage to other fighters equal to half of that fighter's health, rounded down.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Creator of Theme Park Tycoon 2, but where is Theme Park Tycoon 1?"
	},
	CKK4 = {
		Id = 17107609953,
		Name = "ultrag_oat",
		PlayTest = true,
		Health = 750,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4, Neutral = 2, Yellow = 2 },
		SearchTerms = "Coolkid",
		EffectVariable = 0,
		CustomReminder = {
			["Scare the scammers"] = "If a terrified fighter's in play during its end step, obliterate it.",
			["Quit like a boss"] = "Remove an obliterated fighter from the game completely, as if it never existed."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Deal 200 damage to all epic and legendary fighters and unlock them. Attach terrified to those fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 200 },
						{ "EquipGear", "Terrified Mod" },
						{ "Unlock", 9999 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "Rarities",
						Modifier = {
							Rarities = { "Epic", "Legendary" }
						}
					}
				}
			}
		},
		Bio = "Original owner of the rarest limited of all time. Shoutout for beating cancer!"
	},
	CKK5 = {
		Id = 3299961860,
		Name = "VeryChaoticCommando",
		PlayTest = true,
		AddBlock = true,
		Health = 1600,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4 },
		Effect = {
			Name = "Hellfire",
			Description = "Whenever you cast a fighter: They gain 100 power. Deal 500 damage to this card.",
			Type = "OnAllySummon",
			Power = {
				{ "Damage", 500 },
				{ "Strengthen", 100, "Aggressor" }
			},
			Target = "Self"
		},
		Bio = "If chaos could ever be controlled, world peace would be restored. *It* begs to differ..."
	},
	CKK6 = {
		Id = 9964834014,
		Name = "Malevolent Fangirl",
		PlayTest = true,
		AddBlock = true,
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever a legendary fighter dies: This card gains 300 health and power.",
			Type = "OnAnyDeath",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 300 }
			},
			Target = "Self",
			Rarity = "Legendary"
		},
		Bio = "I will make them love me!"
	},
	CKK7 = {
		Id = 10288723966,
		Name = "Non-Magic Boring Black Cat",
		PlayTest = true,
		AddBlock = true,
		Health = 500,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		EffectAnimation = "Poof",
		Color = "Green",
		Cost = { Green = 3 },
		CustomReminder = {
			Transformation = "Turn one card into another, preserving its stats and locks.",
			Snail = "A fighter that is inert in play and takes 100 damage at the end of your turns."
		},
		Effect = {
			Name = "Me-OUCH!",
			Description = "When this card is cast: Transform a target fighter into a Snail. (It loses its abilities.)",
			Type = "OnSummon",
			Power = { { "Transform", "Snail", "Single" } },
			Target = "Single"
		},
		Bio = "Dormant since October 5th 2016."
	},
	CKK8 = {
		Id = 6234671257,
		Name = "Alpha Brick's Rediscovery",
		PlayTest = true,
		AddBlock = true,
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Era",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Each fighter's rarity becomes token.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "ReplaceRarity", "Token" },
				{ "Draw", 1, "Ally" }
			},
			Target = "All"
		},
		Bio = "The awakened Primordials stared at Alex with disgust. They had to keep the ancient brick safe in this modern world."
	},
	Thrillville = {
		Id = 17110966689,
		Name = "Thrillville",
		AltCards = {
			Constellane = {
				Id = 74538905232216,
				Name = "Constellane",
				AttackEffect = "Slash",
				Terrariant = "Rem and Waltz",
				AltArt = true,
				PremiumArt = 624,
				Bio = "\"The busy market district of Starlight Island.\""
			}
		},
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Roblox Gone Crazy",
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 60,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a token: All allied fighters gain 100 power until their next end step.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "TempStrengthen", 100, "Ally" } },
					Target = "Self",
					Rarity = "Token"
				}
			}
		},
		Bio = "Thrillville is not responsible for any injury or death on the premises. You have been warned."
	},
	TVV1 = {
		Id = 17110966689,
		Name = "Thrillville",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Roblox Gone Crazy",
		PlayTest = true,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 60,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a token: All allied fighters gain 100 power until their next end step.",
			Ability = {
				OnAllySummon = {
					Power = { { "TempStrengthen", 100, "Ally" } },
					Target = "Self",
					Rarity = "Token"
				},
				OnAllyCast = {
					Power = { { "TempStrengthen", 100, "Ally" } },
					Target = "Self",
					Rarity = "Token"
				},
				OnAllyCastGear = {
					Power = { { "TempStrengthen", 100, "Ally" } },
					Target = "Self",
					Rarity = "Token"
				}
			}
		},
		Bio = "Thrillville is not responsible for any injury or death on the premises. You have been warned."
	},
	TVV2 = {
		Id = 6854745241,
		Name = "Stacey007",
		Health = 200,
		Power = 400,
		PlayTest = true,
		Rarity = "Uncommon",
		AttackEffect = "Katana",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		CustomReminderChoice = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Destroy your hand. Draw a card and give yourself a yellow card.\n🅑 Summon a 400/150 Noob that's inert in play.\n🅒 Divide a target enemy fighter into two smaller copies of itself. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Crystal of Inverse Decay" },
				{ "Add", "Crystal of Pure Divinity" },
				{ "Add", "Crystal of Heroic Ambition" }
			},
			Target = "Ally"
		},
		Bio = "Decay, Divinity, and Ambition are just the things I use to keep people close to me."
	},
	TVV3 = {
		Id = 80508876060605,
		Name = "AverageWAVFan",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		PlayTest = true,
		AttackEffect = "Bite",
		Color = "Neutral",
		Cost = { Neutral = 3, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Name",
			Description = "Whenever you cast a card that costs no studs: Give yourself a copy of it, except it costs {W} and has stealth.",
			Ability = {
				OnAnyAllyCast = {
					Power = { { "AddCopy" } },
					Target = "Aggressor",
					LowCost = 0,
					MetaData = {
						Stealth = true,
						Cost = { Neutral = 1 }
					}
				}
			}
		},
		Bio = "It's even more over than was previously thought possible."
	},
	TVV4 = {
		Id = 12145035643,
		Name = "Torn to Shreds",
		PlayTest = true,
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 2, Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter.\nUnlock all allied fighters. They gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly" },
						{ "Unlock", 9999, "Ally" },
						{ "Heal", 100, "Ally" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>\"Damn it... let me twist your hippocampus a bit. I might've messed up somewhere.\"</i>"
	},
	TVV5 = {
		Id = 10279291356,
		Name = "Hallow's Trick Or Treater",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		PlayTest = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Transformant = "Boon Token",
		BypassOverdrive = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: All allied fighters gain 100 Health and Power.\nWhen this card dies: Allied fighters lose 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Weaken", 100 },
						{ "Damage", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Hallow regrets having anything to do with him."
	},
	TV6 = {
		Id = 11770008111,
		Name = "Rakir",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 3 },
		Summonant = "Round7",
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever you lose life: Summon a 400/150 Noob that's inert in play.",
			Type = "OnLifeLoss",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Historically, you're a scrub."
	},
	TV7 = {
		Id = 9964992219,
		Name = "Bennova1",
		Health = 450,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Red = 4 },
		Charge = true,
		Effect = {
			Name = "Life fam",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "VROOM."
	},
	["Lando's Hide and Seek"] = {
		Id = 17251036884,
		Name = "Lando's Hide and Seek",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Seeker",
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast and at the start of your turns: Suspend a target fighter until the next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Suspend", 30, "Single" },
						Target = "Ally"
					}
				},
				OnAllyStart = {
					Power = {
						{ "Suspend", 30, "Single" },
						Target = "Ally"
					}
				}
			}
		},
		Bio = "A timeless classic. You've very likely played this game without even realizing it."
	},
	HS1 = {
		Id = 17251036884,
		Name = "Lando's Hide and Seek",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Seeker",
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast and at the start of your turns: Suspend a target fighter until the next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Suspend", 30, "Single" },
						Target = "Ally"
					}
				},
				OnAllyStart = {
					Power = {
						{ "Suspend", 30, "Single" },
						Target = "Ally"
					}
				}
			}
		},
		Bio = "This is where the smartest and most creative minds go to show off their skills with games and brand new never seen before features!"
	},
	HS2 = {
		Id = 10280918353,
		Name = "Chillin Snowin",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: If there's an allied terrain in play, a target fighter loses 400 power. Then return all terrains in play to their hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EVExactValueCheck", 0, "Self" },
						{ "Return" },
						{ "Return", 30, "EnemyTerrain" }
					},
					Target = "AllyTerrain"
				},
				OnEVCheckPass = {
					Power = { { "Weaken", 400, "Single" } },
					Target = "Single",
					NoBlip = true,
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "Another Devil Beater intern joins the fight! It's a Cold World."
	},
	HS3 = {
		Id = 8664746198,
		Name = "Birdous",
		Health = 500,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Dum dum",
			Description = "When this card is cast: Swap the stats of a target fighter.",
			Type = "OnSummon",
			Power = { { "Swap", 100000 } },
			Target = "Single"
		},
		Bio = "No, Jim! Fun is allowed. Only for us, though."
	},
	HS4 = {
		Id = 11346821993,
		Name = "The Fens",
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a terrain: Deal 100 damage to all enemy fighters.",
			Type = "OnAllyTerrainCast",
			Power = { { "Damage", 100 } },
			Target = "Opponent"
		},
		Bio = "The lands became increasingly inhabitable due to an unknown, new infection. They tried their best to stop it."
	},
	HS5 = {
		Id = 10288692353,
		Name = "Crystalline SuperMegaflora",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 24 },
		SummonAnimation = "FloralSummon",
		EffectAnimation = "FloraBuffAlly",
		Effect = {
			Name = "ARE YOU HAPPY, DAIR?",
			Description = "When this card is cast: Set the stats of all allied fighters to 3000/3000.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 3000 },
				{ "SetPower", 3000 }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	HS6 = {
		Id = 335687479,
		Name = "Monkey",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Monkey",
		Color = "Green",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Revival",
			Description = "Whenever this card attacks: All allied Monkeys gain 200 power.",
			Type = "OnAttack",
			Power = "Strengthen",
			Target = "AlliedArchetype",
			Increase = 200
		},
		Bio = "Never bring a Monkey to a SirAdurite fight."
	},
	HS7 = {
		Id = 10184253987,
		Name = "Mored Bo",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 4 },
		StarterCard = true,
		Effect = {
			Name = "Mimic Deck",
			Description = "When this card is cast: Obliterate each card in your deck, then copy your opponent's deck. Draw three cards.",
			Type = "OnSummon",
			Power = {
				{ "RemoveDeck", 999 },
				{ "CopyOpponentDeck", 999 },
				{ "Draw", 3 }
			},
			Target = "Ally"
		},
		Bio = "Went from defeating Raid Bosses to getting beat in Card games by people half his age."
	},
	c00lkidd = {
		Id = 17076629389,
		Name = "c00lkidd",
		AltCards = {
			["F&F: Lunatics"] = {
				Id = 94790935947361,
				Name = "F&F: Lunatics",
				Bio = "I'm way too paranoid for a threat."
			},
			["Only A Ladd"] = {
				Id = 71400070964581,
				Name = "Only A Ladd",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 544,
				Bio = "\"it's not his fault that he can't behave, society's made him go astray, perhaps if we're nice he'll go away. perhaps he'll go away he'll go away!\""
			},
			leepymindscape = {
				Id = 115626328620752,
				Name = "leepymindscape",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 638,
				Bio = "\"\""
			}
		},
		Health = 650,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		PackDisplayOverride = "Card Puzzles",
		Cost = { Yellow = 2, Red = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever this card is cast or attacks: Remove a target fighter's effect.",
			Ability = {
				OnSummon = {
					Power = { { "ReplaceEffect", "Pet1", "Single" } },
					Target = "Self"
				},
				OnAttack = {
					Power = { { "ReplaceEffect", "Pet1", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "team c00lkidd join today!"
	},
	KD1 = {
		Id = 17076629389,
		Name = "c00lkidd",
		Health = 650,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 2, Red = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever this card is cast or attacks: Remove a target fighter's effect.",
			Ability = {
				OnSummon = {
					Power = { { "ReplaceEffect", "Pet1", "Single" } },
					Target = "Self"
				},
				OnAttack = {
					Power = { { "ReplaceEffect", "Pet1", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "team c00lkidd join today!"
	},
	KD2 = {
		Id = 10243251365,
		Name = "Smellernate",
		Health = 800,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Unique = true,
		Effect = {
			Name = "Infinite Army",
			Description = "Whenever an effect draws your opponent a card: Destroy the oldest card in their hand.",
			Type = "OnEnemyDraw",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent"
		},
		Bio = "Just because the Terms of Service exist doesn't mean I can't choose to break them."
	},
	KD3 = {
		Id = 4899422795,
		Name = "Noob",
		Health = 400,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Token = true,
		Cost = { Neutral = 1 },
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Archetype = "Noob",
		Effect = {
			Name = "Oof",
			Description = "When this card tumbles down to its death: Oof.",
			Type = "Null",
			Power = "Yellow",
			Target = "Ally",
			Increase = 0
		},
		Bio = "And here we see the common noob, socializing in its natural habitat."
	},
	KD4 = {
		Id = 10352816230,
		Name = "Mohawk2725",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2 },
		Effect = {
			Name = "Don't sloth me",
			Description = "Whenever your opponent casts a fighter: Destroy it. Obliterate this card.",
			Type = "OnEnemySummon",
			Power = {
				{ "Destroy" },
				{ "Obliterate", 30, "Self" }
			},
			Target = "Aggressor"
		},
		Bio = "I will flay the skin from your flesh and the flesh from your bones and scrape your bones dry. And even then, you will not have suffered enough. :^)"
	},
	KD5 = {
		Id = 17791141964,
		Name = "AtypicalType",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: It deals 1000 damage to all fighters.\nAfter this card attacks: Destroy it.",
			Target = "All",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 1000, "All" } },
					Target = "Self"
				},
				OnAttackEnd = {
					Power = { { "Destroy", 30, "Self" } },
					Target = "Ally"
				}
			}
		},
		Bio = "This ain't no game, boy. It's a minigame!"
	},
	KD6 = {
		Id = 5079319917,
		Name = "NonSenseStudio",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Transformant = "NullToken",
		EffectVariable = 1,
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast another fighter, if there's no gear on this card: Unlock that fighter and it gains 200 Power. Attach a gear to this card.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Unlock", 9999, "Aggressor" },
				{ "Strengthen", 200, "Aggressor" },
				{ "EquipGear", "Exertion", "Self" },
				{
					"ReplaceCardArt",
					{ "Variable" },
					"Self"
				},
				{ "ReplaceBio", "ReplaceBioant", "Self" }
			},
			Target = "Ally",
			EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" }
		},
		ReplaceCardArtant = { 5078935504 },
		ReplaceBioant = "As a kid he played in the sandbox. As an adult he created the sandbox.",
		Bio = "As a kid he played in the sandbox. As an adult he created the sandbox."
	},
	KD7 = {
		Id = 16056316278,
		Name = "OfficeSpace, No Not The Movie",
		Health = 450,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		PackDisplayOverride = "Hallow's Bargains Shop",
		Color = "Red",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card dies: You lose 4000 life. Give yourself 3 100/0 Cheering Demons with no abilities, except they're fading and inert in all zones.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Cost", 4000 },
						{
							"RandomAdd",
							{ "New Recruit", "New Recruit2", "New Recruit3" }
						},
						{
							"RandomAdd",
							{ "New Recruit", "New Recruit2", "New Recruit3" }
						},
						{
							"RandomAdd",
							{ "New Recruit", "New Recruit2", "New Recruit3" }
						}
					},
					Target = "Ally",
					MetaData = { Health = 100, Power = 0, TokenOmni = true, Fading = true }
				}
			}
		},
		Bio = "\"LET'S GO QUAN SWEEP!!!\""
	},
	Vermyn = {
		Id = 120736986698171,
		Name = "Vermyn Illyon",
		AltCards = {
			["Vivian, Undefeatable"] = {
				Id = 124831756792675,
				Name = "Vivian, Undefeatable",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 743,
				Bio = "I AM UNDEFEATABLEEE or well unless you play like any deck that counters mine or like some cheesy strategy or like pixies or something like that but you wouldnt because thats not very nice is it god i hate pixies why would they ever add these things"
			}
		},
		Health = 2500,
		Power = 2500,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Summonant = "Shadow Council",
		Color = "Red",
		Cost = { Red = 20 },
		EffectVariable = 0,
		TriggerInHand = true,
		AddBlock = true,
		PackDisplayOverride = "Card Puzzles",
		Untradeable = true,
		Effect = {
			Name = "Royal Cure",
			Description = "This card costs {R} less for each fighter in your baseplate.\nWhenever a fighter dies: Put it into your baseplate, except it's inert. Then if there's 30 or more fighters in your baseplate, <b>ban your opponent.</b>",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Red" }
						},
						{
							"AlterEV",
							{ "NoOverwriteSave", "EffectVariable", "RedCost", "BaseCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Fighter", "Nil" }
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
							{ "Variable", "Red" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true,
					DontTriggerInField = true
				},
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{
							"AddGenZone",
							{ "Variable", 1 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Fighter" },
							"Self",
							nil,
							nil,
							"RageborneEyeGlint"
						},
						{ "EVGreaterValueCheck", 29, "Self" }
					},
					MetaData = { TokenGenZone = true },
					Target = "Aggressor",
					AllowDeadAggressorTriggers = true,
					DontTriggerInHand = true
				},
				OnEVCheckPass = {
					Power = { { "SetLife", 0 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Stealing the Alpha Brick from Telamon, causing mass amounts of destruction and economic collapse. And yet, you think you’re in control? How cute."
	},
	CT1 = {
		Id = 120736986698171,
		Name = "Vermyn Illyon",
		Health = 2500,
		Power = 2500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Summonant = "Shadow Council",
		Color = "Red",
		Cost = { Red = 20 },
		EffectVariable = 0,
		TriggerInHand = true,
		AddBlock = true,
		Untradeable = true,
		Effect = {
			Name = "Royal Cure",
			Description = "This card costs {R} less for each fighter in your baseplate.\nWhenever a fighter dies: Put it into your baseplate, except it's inert. Then if there's 30 or more fighters in your baseplate, <b>ban your opponent.</b>",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Red" }
						},
						{
							"AlterEV",
							{ "NoOverwriteSave", "EffectVariable", "RedCost", "BaseCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Fighter", "Nil" }
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
							{ "Variable", "Red" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true,
					DontTriggerInField = true
				},
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{
							"AddGenZone",
							{ "Variable", 1 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Fighter" },
							"Self",
							nil,
							nil,
							"RageborneEyeGlint"
						},
						{ "EVGreaterValueCheck", 29, "Self" }
					},
					MetaData = { TokenGenZone = true },
					Target = "Aggressor",
					AllowDeadAggressorTriggers = true,
					DontTriggerInHand = true
				},
				OnEVCheckPass = {
					Power = { { "SetLife", 0 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Stealing the Alpha Brick from Telamon, causing mass amounts of destruction and economic collapse. And yet, you think you’re in control? How cute."
	},
	CT2 = {
		Id = 9964880944,
		Name = "Naruto2000",
		Health = 400,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 1 },
		Effect = {
			Name = "Faker Hit",
			Description = "When this card is cast: You may baseplate again this turn.",
			Type = "OnSummon",
			Power = { { "DiscardLimit", 1 } },
			Target = "Ally"
		},
		Bio = "He just wants to get choked like his idol from some anime he watched or something."
	},
	CT3 = {
		Id = 11769945213,
		Name = "The Temple of Shedletsky",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Order of the Limb",
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 8, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target allied fighter and its adjacent fighters gain 200 health and power.\nWhenever you cast a fighter: Search your deck for a copy of it.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"Aggressor"
						},
						{ "Tutorfor", "Variable", "Ally" }
					},
					Target = "Ally"
				},
				OnSummon = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "ChosenCard" },
							"SingleAlly"
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
						{ "Heal", 200, "AdjacentEVTarget" },
						{ "Strengthen", 200, "AdjacentEVTarget" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "No sole person should wield the power of gods, especially not arrogant manchildren. The miracle of eons past taught this."
	},
	CT4 = {
		Id = 7133731928,
		Name = "Matt Dusek 2",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Ice",
		Color = "Green",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 1, Yellow = 1, Green = 3 },
		Stealth = true,
		TargetImmune = true,
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Gladiator = true,
		AddBlock = true,
		EffectVariable = 10,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a non-Gladiator fighter: Put it into your baseplate. Give yourself a Blue card, a Yellow card, and a Green card, except they're fleeting.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "MoveGenZone" },
						{
							"RandomAdd",
							"MonoOnlyorGreenCostorNoAddBlock GreenorNoAddBlock",
							"Ally"
						},
						{
							"RandomAdd",
							"MonoOnlyorBlueCostorNoAddBlock BlueorNoAddBlock",
							"Ally"
						},
						{
							"RandomAdd",
							"MonoOnlyorYellowCostorNoAddBlock YelloworNoAddBlock",
							"Ally"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					EffectFleeting = true,
					NotArchetype = "Gladiator",
					Target = "Aggressor",
					MetaData = { Fleeting = true }
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "Cursed to wander the Ruins of Wood alone, it joins the Pits to pull others into spectral companionship."
	},
	CT5 = {
		Id = 4564780442,
		Name = "Telamon If He Locked In",
		Health = 8000,
		Power = 8000,
		Rarity = "Token",
		AttackEffect = "Divinity",
		Archetype = "Shedletsky",
		CheckImmune = true,
		DestroyImmune = true,
		ReturnImmune = true,
		SetImmune = true,
		TargetImmune = true,
		Overload = true,
		SummonAnimation = "TelamonSummon",
		Color = "Yellow",
		Cost = { Yellow = 8, Blue = 8, Green = 8, Red = 8, Neutral = 8 },
		Effect = {
			Name = "Bonanza!",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Angry that the Celestials stole his child, Telamon freed prisoners of hell to chase after them."
	},
	cupcakescankill = {
		Id = 17107615321,
		Name = "cupcakescankill",
		Health = 600,
		Power = 400,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Common",
		AttackEffect = "Scratch",
		Dextrous = true,
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Booting",
			Description = "Whenever you cast your fifth action each turn: Unlock all allied fighters once.",
			Ability = {
				OnAllyCast = {
					Power = { { "Unlock", 1 } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 5, 6, "Actions" }
				}
			}
		},
		Bio = "My cousin Kevin did this IRL"
	},
	CC1 = {
		Id = 17107615321,
		Name = "cupcakescankill",
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Dextrous = true,
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Booting",
			Description = "Whenever you cast your fifth action each turn: Unlock all allied fighters twice.",
			Ability = {
				OnAllyCast = {
					Power = { { "Unlock", 2 } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 5, 6, "Actions" }
				}
			}
		},
		Bio = "My cousin Kevin did this IRL"
	},
	CC2 = {
		Id = 10823719815,
		Name = "Tix MEGA Fanatic",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Money Stack cards.\nWhenever you cast a Tix stack: All allied Capital $ity fighters gain 50 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Strengthen", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Tix Stack"
				},
				OnAllySummon = {
					Power = { { "Strengthen", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Tix Stack"
				}
			}
		},
		Bio = "\"I just LOVE Tix! They just look so nice... I hope Tix lasts forever!\""
	},
	CC3 = {
		Id = 136673928075641,
		Name = "Biggs' Bigg Bronze",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Archetype = "Capital $ity",
		Unique = true,
		Cost = { Yellow = 3, Green = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a token action: This card generates.",
			Ability = {
				OnAllyCast = {
					Power = { { "Generate", 1 } },
					Target = "Self",
					Rarity = "Token"
				}
			}
		},
		Bio = "A beautiful, massive marble-white display that would make any person go: 'He looks like a pretentious schmuck.'"
	},
	CC4 = {
		Id = 116466306109722,
		Name = "Very Overworked Operator",
		Health = 350,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Money Stack cards.\nWhenever you cast a Robux stack: Allied Capital $ity fighters gain 50 health.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Heal", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Targeting Blip"
				},
				OnAllySummon = {
					Power = { { "Heal", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Targeting Blip"
				}
			}
		},
		Bio = "He's been sitting there dealing with all of the Karens and Kevins for hours... YET HE STILL KEEPS THE RIDES MOVING!!"
	},
	CC5 = {
		Id = 12575064646,
		Name = "Pro Arkhivist",
		Health = 400,
		Power = 400,
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
			Description = "When this card is cast: Recur the top card of your graveyard, except it's fading.",
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
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"Don't forget the toothbrush! No self-respecting archaeologist leaves home without one!\""
	},
	CC6 = {
		Id = 4899466464,
		Name = "Cooler Usering",
		Health = 1250,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 12 },
		Charge = true,
		Addant = "Pooper Blip1",
		Effect = {
			Name = "Revival",
			Description = "When this card is cast: Give yourself a Robux Bundle. It can be used eight times.",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		CustomReminder = {
			["Robux Bundle"] = "A {W} action that is inert in all zones. It gives a target fighter 50 health, and can be used eight times."
		},
		Bio = "Even Pokemon can make good games."
	},
	CC7 = {
		Id = 5673324980,
		Name = "Den Invader",
		Health = 750,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Transformant = "Twilit Mother",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Summon 2 250/250 Pack Wolves. Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "Summon", "Pack Wolf", "Ally" },
				{ "Summon", "Pack Wolf", "Ally" },
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		CustomReminder = {
			["Pack Wolf"] = "A 250/250 fighter that is inert in play. When an allied Lycanthrope dies, your opponent loses 150 Life."
		},
		Bio = "\"I would give my life for my pack. I would let my children wear me as armour to strike you down.\""
	},
	StevoDivo = {
		Id = 17107610349,
		Name = "StevoDivo",
		Health = 1100,
		Power = 1100,
		Rarity = "Rare",
		PackDisplayOverride = "Card Puzzles",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 7 },
		Effect = {
			Name = "All is fair in love and duels.",
			Description = "When this card is cast, if your opponent has no cards in their hand: Obliterate a target fighter.",
			Type = "OnSummon",
			EffectRequirement = { "Playertable", "Him", 0, 1, "Hand" },
			Power = { { "Obliterate", 30 } },
			Target = "Single"
		},
		Bio = "Reality doesn't matter if you swap it with somewhere else."
	},
	SD1 = {
		Id = 17107610349,
		Name = "StevoDivo",
		Health = 1100,
		Power = 1100,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 7 },
		Effect = {
			Name = "All is fair in love and duels.",
			Description = "When this card is cast, if your opponent has no cards in their hand: Obliterate a target fighter.",
			Type = "OnSummon",
			EffectRequirement = { "Playertable", "Him", 0, 1, "Hand" },
			Power = { { "Obliterate", 30 } },
			Target = "Single"
		},
		Bio = "Reality doesn't matter if you swap it with somewhere else."
	},
	SD2 = {
		Id = 11972759753,
		Name = "ThoughtNah",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy the oldest card in your opponent's hand.",
			Ability = {
				OnSummon = {
					Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
					Target = "Opponent"
				}
			}
		},
		Bio = "The Alpha Wars led to famine. Famine led to despair. Despair fed the nightmares."
	},
	SD3 = {
		Id = 5271603600,
		Name = "Dark Book of Smells",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gravity",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 2, Neutral = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "The next action you cast this turn triggers its effect an additional time.",
			Type = "OnSummon",
			Power = { { "ActionOverdrive", 1 } },
			Target = "Ally"
		},
		Bio = "A tome filled with essential Moon sorcery. It drains the conjurer in exchange for the knowledge of what is held within."
	},
	SD4 = {
		Id = 10184147479,
		Name = "Participation Trophy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "A target fighter gains 500 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 500 } },
			Target = "Single"
		},
		Bio = "\"I need no assistance. I am victory! - Alex\""
	},
	SD5 = {
		Id = 8596107017,
		Name = "Defective Gravity Coil",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "GravCoilEffect",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 2, Neutral = 2 },
		Effect = {
			Name = "Crystal Snare",
			Description = "Return a target fighter to its hand.",
			Type = "OnSummon",
			Power = { { "Return" } },
			Target = "Single"
		},
		Bio = "War drives innovation; The Federation create wars solely to drive progress."
	},
	SD6 = {
		Id = 10228794959,
		Name = "ScorpioPilot",
		Health = 500,
		Power = 300,
		Rarity = "Token",
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
	SD7 = {
		Id = 10279303570,
		Name = "Traumatic Clown",
		Health = 1750,
		Power = 1750,
		Rarity = "Token",
		AttackEffect = "Punch",
		ReturnImmune = true,
		DestroyImmune = true,
		Color = "Yellow",
		Charge = true,
		SummonAnimation = "ClownHonk",
		DeathAnimation = "ClownDeath",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Traumatic Experience",
			Description = "Whenever this card attacks and destroys another: Give all players 2 cards. You gain {Y}.",
			Type = "OnAttackDestroy",
			Power = {
				{ "RandomAdd", "Any", "Ally" },
				{ "RandomAdd", "Any", "Ally" },
				{ "RandomAdd", "Any", "Opponent" },
				{ "RandomAdd", "Any", "Opponent" },
				{ "Yellow", 1, "Ally" }
			},
			Target = "All"
		},
		Bio = "Hallow always loved a jester."
	},
	nurokoi = {
		Id = 17107611358,
		Name = "nurokoi",
		Health = 400,
		Power = 300,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Common",
		AttackEffect = "Storm",
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "2 Flaws.\nWhenever you cast a fighter with total stats 1500 or more: Destroy a gear attached to this card. If you do, this card gains 200 power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					SizeClass = "Gigant"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 200, "Self" },
						{ "DestroyGear", 1, "Self" }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "It's a UNIX system!"
	},
	NK1 = {
		Id = 17107611358,
		Name = "nurokoi",
		Health = 400,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Storm",
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "2 Flaws.\nWhenever you cast a fighter with total stats 1500 or more: Destroy a flaw attached to this card. If you do, this card gains 250 power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Flaw" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					SizeClass = "Gigant"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 250, "Self" },
						{ "DestroyGear", "Flaw", "Self" }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "It's a UNIX system!"
	},
	NK2 = {
		Id = 17107611358,
		Name = "nurokoi",
		Health = 400,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Storm",
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "1 Flaw.\nWhenever you cast a fighter with total stats 1500 or more: Destroy a flaw attached to this card. If you do, this card gains 250 power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Flaw" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					SizeClass = "Gigant"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 250, "Self" },
						{ "DestroyGear", "Flaw", "Self" }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = { { "EquipGear", "Flaw" } },
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "It's a UNIX system!"
	},
	NK3 = {
		Id = 5188678151,
		Name = "Yuckywow",
		Health = 1150,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "He loves his ducks, but is he possessed by an evil one?"
	},
	NK4 = {
		Id = 7275000827,
		Name = "Extra Special Fluzard",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: All allied fighters with 1500 or more total stats gain 200 power.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 200, "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "SizeClass",
						Modifier = "Gigant"
					}
				}
			}
		},
		Bio = "The exotic ithian highlands has given Hallow the most interesting beasts for the pit's spectacles. "
	},
	NK5 = {
		Id = 4720307476,
		Name = "HatHater",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "When this card is cast: It deals 200 damage to all non-Colourless fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "NotColorNeutral" } },
			Target = "Self"
		},
		Bio = "The late ROBLOXian who helped with free models such as hat helper scripts and his notable strategy game."
	},
	NK6 = {
		Id = 10243308339,
		Name = "Wizard Oz",
		Health = 700,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Don't touch the pointy bits."
	},
	NK7 = {
		Id = 9964949822,
		Name = "Squash Bomb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Lunar = true,
		EffectAnimation = "SmallExplosionEffect",
		HideArchetype = true,
		Cost = { Red = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Deal 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250 } },
			Target = "Single"
		},
		Bio = "For the inhabitants of Bloxburg, these bombs are a sign of relentless agony. For Hallow, it's Tuesday."
	},
	NK8 = {
		Id = 10824320088,
		Name = "bartomafia1",
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Color = "Red",
		Summonant = "Rebel",
		Cost = { Red = 3, Neutral = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks and destroys another: Summon a 300/300 Rebel that's inert in all zones.\nWhenever an allied fighter dies: Your opponent loses 200 life.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAllyDeath = {
					Power = { { "Inflict", 200, "Opponent" } }
				}
			}
		},
		Bio = "What are otherworldly beings and highly skilled killers going to do against a heavy heaping of bullets? Nothing, that's what."
	},
	NK9 = {
		Id = 100453438127405,
		Name = "Burn Purities",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Equippant = "Flaw",
		EquipGearAnimation = "StaticBurn",
		CustomReminder = {
			["Intense Self-Loathing"] = "A Flaw is a 0/0 gear that does nothing."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Attach 2 +0/+0 Flaws to a target fighter. Deal 100 damage for each gear on it to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Equippant", "Single" },
						{ "EquipGear", "Equippant", "Single" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					MetaData = { AddHealth = 0 },
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Damage", "Variable", "SingleEnemy" } },
					Target = "Self"
				}
			}
		},
		Bio = "The Purifier calmly wiped the wet clay off his blade, unconcerned by the monster's screams. Each kill was justice for each victim of the Doomspire."
	},
	NK10 = {
		Id = 8421486052,
		Name = "Lolrus",
		Health = 750,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		Addant = "Green Stud",
		Effect = {
			Name = "Demon Eye",
			Description = "When this card is cast: All fighters lose 200 power, then destroy all enemy fighters with 0 Power. Give yourself a Green Stud.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{
					"CheckPower",
					{ 0, 1 },
					"Opponent"
				},
				{ "Add", "Addant", "Ally" }
			},
			Target = "All"
		},
		Bio = "Teapots with Adurite textures are the shyest."
	},
	NK11 = {
		Id = 9964920511,
		Name = "Tone, Bane of Foil Traders",
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 4, Neutral = 1 },
		Effect = {
			Name = "Thug Life",
			Description = "When this card is cast: All allied fighters with 300 or less power gain 200 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "NotPower",
				Modifier = 300
			}
		},
		Bio = "Merely red."
	},
	["Builder Brothers Pizza"] = {
		Id = 17107613968,
		Name = "Builder Brother's Pizza",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "The Unsung Hero of House Parties",
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Uncommon",
		Addant = "Pizza Slice",
		CustomReminder = {
			["Pizza Slice"] = "An inert-in-all-zones {W}{B} +150/0 Gear that makes all players gain 300 life."
		},
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Twice each turn, whenever you cast a fighter: Give yourself a fleeting Pizza Slice.",
			Ability = {
				OnAllySummon = {
					Power = { { "Add", "Addant", "Ally" } },
					MetaData = { Fleeting = true },
					Target = "Ally",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "When the moon hits your eye like a big pizza pie, that's amore!~"
	},
	["Pizza Slice"] = {
		Id = 17107610958,
		Name = "Pizza Slice",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AddHealth = 150,
		AddPower = 0,
		AttackEffect = "Punch",
		Color = "Blue",
		Gear = true,
		TokenOmni = true,
		IsFood = true,
		Cost = { Neutral = 1, Blue = 1 },
		Effect = {
			Name = "Stud",
			Description = "Attach to a target fighter.<br/>When you do: All players gain 300 life.",
			Ability = {
				OnSummon = {
					Power = { { "Inflict", -300 } },
					Target = "All"
				}
			}
		},
		Bio = "We love pizza in the morning! We love pizza everyday!"
	},
	BP1 = {
		Id = 17107613968,
		Name = "Builder Brothers Pizza",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "The Unsung Hero of House Parties",
		Rarity = "Token",
		Addant = "Pizza Slice",
		CustomReminder = {
			["Pizza Slice"] = "An inert-in-all-zones {W}{B} +150/0 Gear that makes all players gain 300 life."
		},
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Twice each turn, whenever you cast a fighter: Give yourself a fleeting Pizza Slice.",
			Ability = {
				OnAllySummon = {
					Power = { { "Add", "Addant", "Ally" } },
					MetaData = { Fleeting = true },
					Target = "Ally",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "When the moon hits your eye like a big pizza pie, that's amore!~"
	},
	BP2 = {
		Id = 12154433978,
		Name = "Defiant March",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1, Green = 1 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Unlock a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Unlock", 999 } },
					Target = "Single"
				}
			}
		},
		Bio = "The people of Bloxburg would not, <i>will not,</i> ever stand for the exploitation of mortality."
	},
	BP3 = {
		Id = 10215838525,
		Name = "Root Decay",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Yellow = 1, Green = 1, Red = 1 },
		EffectVariable = 0,
		EffectAnimation = "RootCause",
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
	BP4 = {
		Id = 7027998702,
		Name = "Unshackled Typheus",
		Health = 800,
		Power = 300,
		Rarity = "Token",
		Liberate = true,
		AttackEffect = "Blaze",
		Color = "Yellow",
		Archetype = "LegendaryDragon",
		HideArchetype = true,
		Effect = {
			Name = "Omega Charge",
			Description = "When this card is cast: Unlock all allied fighters.",
			Type = "OnSummon",
			Power = "Unlock",
			Target = "Ally",
			Increase = 999
		},
		Cost = { Neutral = 4, Yellow = 4 },
		Bio = "When one is struck by Typheus, the world is split. Then nevermore."
	},
	BP5 = {
		Id = 10534883537,
		Name = "Dued2",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Corrosive Gems",
			Description = "During your end step, if you've gained 600 life since your last end step: This card gains 400 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 400, "Self" } },
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" }
		},
		Bio = "If I wanted to work at a pizza place, I'd just go to college."
	},
	haz3mn = {
		Id = 17107613036,
		Name = "haz3mn",
		AltCards = {
			["F&F: Hedonists"] = {
				Id = 17540226230,
				Name = "F&F: Hedonists",
				Bio = "Hangin' out the window."
			},
			["Trolley Problem"] = {
				Id = 131087843954941,
				Name = "Trolley Problem",
				Commissioner = { "Waltzel", "Remvolt" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 732,
				Bio = "You are the driver of a runaway trolley. It's going to hit five people unless you divert it and hit 1 person. What will you do?"
			}
		},
		CustomReminderSeek = true,
		Health = 200,
		Power = 200,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Rare",
		AttackEffect = "Hammer",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever an effect draws a player a card: Seek Shinies.",
			Ability = {
				OnAnyDraw = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "\"Splash the pot with some gold, my friend!\""
	},
	HZ1 = {
		Id = 17107613036,
		Name = "haz3mn",
		CustomReminderSeek = true,
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Blue",
		EffectVariable = 0,
		Cost = { Blue = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever an effect draws a player a card: Seek Shinies.",
			Ability = {
				OnAnyDraw = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "\"Splash the pot with some gold, my friend!\""
	},
	HZ2 = {
		Id = 10348256522,
		Name = "SPA CE CA    T",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		TargetImmune = true,
		Cost = { Blue = 2, Green = 2, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: destroy a target allied fighter, then summon a copy of it with an additional 100 Health and Power. Trigger its effect as though it was cast.",
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
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Destroy" },
						{ "SummonWithEffect", "Variable" }
					},
					Target = "SingleAlly",
					MetaData = { IncreasePower = 100, IncreaseHealth = 100 }
				}
			}
		},
		Bio = "Helping out wherever and whenever they can, provided the situation calls for throwing a pair of metal fists at something."
	},
	HZ3 = {
		Id = 7550918613,
		Name = "WorterWolf",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Amp",
			Description = "Whenever an effect targets this card, if you targeted three or fewer times this turn: You gain {G}{Y}.",
			Type = "OnTarget",
			Power = {
				{ "Green", 1 },
				{ "Yellow", 1 }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 1, 4, "TargetCount" }
		},
		Bio = "Part time Roblox pundit. Part time Harambe slayer."
	},
	HZ4 = {
		Id = 73353668311319,
		Name = "Cultural Theft",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "Seek Shinies.\nDraw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "As payment for saving them, the Auteur forced the fish to learn ballet. They responded with the secrets of their sacred underwater basket weaving."
	},
	HZ5 = {
		Id = 4815667402,
		Name = "MalevolentArtist",
		Health = 500,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "LargeMagicGreenEffect",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: A target fighter loses 200 power. Destroy that fighter if it has no power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{
					"CheckPower",
					{ 0, 1 }
				}
			},
			Target = "Single"
		},
		Bio = "My next creation? You, of course!"
	},
	HZ6 = {
		Id = 136083127861617,
		Name = "Shedarian Tide-Pod Mage",
		Health = 700,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		EffectVariable = 1,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Nerf",
			Description = "When this card is cast: Seek Shinies.\nOnce each turn, whenever you cast a gear: A target enemy fighter loses 150 power until its next end step. This card gains 150 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Ally"
				},
				OnAllyCastGear = {
					Power = {
						{ "TempWeaken", 150, "SingleEnemy" },
						{ "Strengthen", 150, "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "\"Why's there a leak of purespawn, bro? Cleanup crew ain't cheap,\" Chirped Wonktooth.\n\"You try sitting still for centuries,\" responded Nethercreep, \"without so much as a corrupted fart escaping.\""
	},
	HZ7 = {
		Id = 11971796337,
		Name = "Lop Hee",
		Health = 300,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Arrow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Summonant = "HopelessslyToken",
		Effect = {
			Name = "Assembly",
			Description = "Whenever you cast a fighter, if there are less than 2{W} amongst the costs of allied fighters: Summon a copy of this card with no effect.",
			Type = "OnAllySummon",
			Power = { { "Summon", "Summonant", "Self" } },
			Target = "Self",
			EffectRequirement = { "Cost", "Ally", 0, 2, "Neutral" }
		},
		Bio = "You're not lopping to the task fast enough."
	},
	HZ8 = {
		Id = 72888053481961,
		Name = "Claymaker, Mid Architect",
		Health = 1800,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1, Neutral = 7 },
		EffectVariable = 0,
		Rank = 6,
		Archetype = "Editor",
		Transformant = "Claymaker Invictus",
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter dies: Attach a Flaw to this card. Then if 6 gear are attached to this card, destroy them and attach all enemy fighters to this card as gear, then this card loses all abilities.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{ "EquipGear", "Flaw" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 6 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{ "EquipGear", "TargetToSelf", "Opponent" },
						{ "Obliterate", 30, "Opponent" },
						{ "Transform", "Transformant" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Dekkad left me this world in its broken state; I can't rest until its sickness is restored by my hand.\""
	},
	HZ9 = {
		Id = 122650811572714,
		Name = "Zonktooth, Duke Regent",
		Health = 1200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 6 },
		EffectVariable = 0,
		Dextrous = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an enemy effect targets this card, or whenever this card attacks and destroys another: Seek Shinies. The shiny is attached to all allied fighters instead of being given.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "EquipGear", "Variable" }
					},
					Target = "Ally"
				},
				OnTargetByEnemy = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "EquipGear", "Variable" }
					},
					Target = "Ally"
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "The youngest of Shedare's purespawn, sent to lead her people back to her. His treasonous temper leads them far away instead."
	},
	HZ10 = {
		Id = 86514853162616,
		Name = "Shedarian Gunter",
		Health = 300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seek Shinies.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "Shinies" },
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
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "Curious, playful, and easily distracted, the floating fishmen of Kralosa search for all that glitters and sparkles."
	},
	xKenis = {
		Id = 137791663267890,
		Name = "xKenis",
		AltCards = {
			["F&F: Preservers"] = {
				Id = 17760525166,
				Name = "F&F: Preservers",
				Bio = "Your Career's more at stake when you're in your prime.",
				Summonant = "Statue-F&F"
			}
		},
		CustomReminder = {
			["The Statue"] = "A 2500/50 fighter with Defender, inert in all zones. Destroy all allied fighters when the statue dies."
		},
		Health = 50,
		Power = 1000,
		Rarity = "Epic",
		PackDisplayOverride = "Card Puzzles",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Green = 8 },
		Summonant = "Statue",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon the Statue. Destroy all allied fighters when the statue dies.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Defending is second nature to us. That’s why I do the opposite."
	},
	Statue = {
		Id = 138821947276995,
		Name = "Statue",
		AltCards = {
			["Statue-F&F"] = {
				Id = 17760523427,
				Name = "Suited Out Suitcase",
				Bio = "Bling bling, I get a rush every time I see some diamonds."
			}
		},
		Health = 2500,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Neutral",
		TokenOmni = true,
		Shield = true,
		Cost = { Neutral = 8 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Destroy all allied fighters.",
			Ability = {
				OnDeath = {
					Power = { { "Destroy", 30, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "DEFEND ME"
	},
	XK1 = {
		Id = 137791663267890,
		Name = "xKenis",
		CustomReminder = {
			["The Statue"] = "A 2500/50 fighter with Defender, inert in all zones. Destroy all allied fighters when the statue dies."
		},
		Health = 50,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Green = 8 },
		Summonant = "Statue",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon the Statue. Destroy all allied fighters when the statue dies.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Defending is second nature to us. That’s why I do the opposite."
	},
	XK2 = {
		Id = 97594359574633,
		Name = "CLINTON",
		Health = 700,
		Power = 0,
		Rarity = "Token",
		Charge = true,
		AttackEffect = "Knife",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "EqualBoard", "Opponent", 1, 9999, "Greater" },
		Effect = {
			Name = "Let It Grow",
			Description = "Cast this card ignoring its Colourless cost if there's 2 more enemy fighters than allied ones.\nWhenever this card attacks: Destroy it and the fighter it's attacking.",
			Type = "OnAttack",
			Power = {
				{ "Destroy", 30, "Aggressor" },
				{ "Destroy" }
			},
			Target = "Self"
		},
		Bio = "The gentle souls in Zanzel's wilderness never are."
	},
	XK3 = {
		Id = 5196343152,
		Name = "Mildly Friendly and Unhelpful Devil",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "HollowScythe",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Effect = {
			Name = "Halloween",
			Description = "When this card is cast: Your opponent summons a copy of a target fighter. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "SummonEnemyCopy", 30, "Single" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Ally"
		},
		Bio = "Hallow's clients are either talented or gullible."
	},
	XK5 = {
		Id = 10288692353,
		Name = "Crystalline SuperDuperMegaflora+",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 24 },
		SummonAnimation = "FloralSummon",
		EffectAnimation = "FloraBuffAlly",
		Effect = {
			Name = "ARE YOU HAPPY, DAIR?",
			Description = "When this card is cast: Set the stats of all allied fighters to 3000/3000.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 3000 },
				{ "SetPower", 3000 }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	XK4 = {
		Id = 5001162546,
		Name = "HardCollision",
		Health = 450,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		EffectAnimation = "StudYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		CustomReminder = {
			Generation = "This card makes a stud of its colour, just like it does at the end of your turn."
		},
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast: It generates five times.",
			Type = "OnSummon",
			Power = { { "Generate", 5, "Self" } },
			Target = "Ally"
		},
		Bio = "Helpful builder at daybreak, sneaky swordsman at twilight."
	},
	["Chaos Canyon"] = {
		Id = 79765921862515,
		Name = "Chaos Canyon",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Ancient Architects",
		EffectVariable = 1,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter with total stats 500 or less: Deal 100 damage to it. If it survives, Unlock it and it generates.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Add", "Math", -100, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 1, "Nil" },
							"Self"
						},
						{ "Generate", "Variable", "Aggressor" },
						{
							"AlterEV",
							{ "Multiply", "Math", 999, "Nil" },
							"Self"
						},
						{ "Unlock", "Variable", "Aggressor" },
						{ "Damage", 100, "Aggressor" }
					},
					SizeClass = "Picant",
					Target = "Self"
				}
			}
		},
		Bio = "Where noobs became men."
	},
	CAN1 = {
		Id = 79765921862515,
		Name = "Chaos Canyon",
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Ancient Architects",
		EffectVariable = 1,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter with total stats 500 or less: Deal 100 damage to it. If it survives, Unlock it and it generates.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Add", "Math", -100, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 1, "Nil" },
							"Self"
						},
						{ "Generate", "Variable", "Aggressor" },
						{
							"AlterEV",
							{ "Multiply", "Math", 999, "Nil" },
							"Self"
						},
						{ "Unlock", "Variable", "Aggressor" },
						{ "Damage", 100, "Aggressor" }
					},
					SizeClass = "Picant",
					Target = "Self"
				}
			}
		},
		Bio = "Where noobs became men."
	},
	CAN2 = {
		Id = 7274998051,
		Name = "canoe",
		Health = 250,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Token = true,
		Effect = {
			Name = "Life fam",
			Description = "",
			Type = "OnSecondPut",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Don't try to lowball him."
	},
	CAN3 = {
		Id = 8938593775,
		Name = "WhatSylrath",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "SkeleScythe",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Dark Bribe",
			Description = "When this card destroys another: Draw a card.",
			Type = "OnDestroy",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "One of the best Blox Card fighters in the game! See him around!"
	},
	CAN4 = {
		Id = 10279272462,
		Name = "swag emilvita",
		Health = 50,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "SQUAT! SQUAT! SQUAT LUNGE SQUAT!"
	},
	CAN5 = {
		Id = 2810834606,
		Name = "Glamrock Doge",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Summonant = "Doge",
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		CustomReminder = {
			Doge = "A {W} 150/150, in play. It's a yellow Doge with no abilities.",
			["Inert in Play"] = "Doge tokens don't generate studs in play."
		},
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Summon a Doge. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Such potato. Many luck. Much doge. Wow."
	},
	CAN6 = {
		Id = 5071967420,
		Name = "3Hex",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Shield = true,
		Charge = true,
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		Effect = {
			Name = "Shine",
			Description = "When this card is cast: Lock a target fighter for 1 turn. Give yourself a Moonleak and remove {W} from its cost.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Unlock", 9999, "Self" },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Single",
			MetaData = {
				Cost = { Neutral = 1 }
			}
		},
		Bio = "He has no style, he has no grace."
	},
	CAN7 = {
		Id = 4992855072,
		Name = "zzzPikmon",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		EffectAnimation = "CheezBuff",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Shatter",
			Description = "Whenever you cast a fighter with total stats 500 or less: This card gains 100 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 100 } },
			Target = "Self",
			SizeClass = "Picant"
		},
		Bio = "He loves the ocean so much, he uses swordfish!"
	},
	CAN8 = {
		Id = 3299977652,
		Name = "Black Ice",
		Health = 2500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		SpecialEffectAnimation = "Freeze",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Icing",
			Description = "When this card is cast: Lock it for 2 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Self",
			Increase = 2
		},
		Bio = "He's managing to keep you at bay, and he's not even wearing pants."
	},
	CAN9 = {
		Id = 13293424444,
		Name = "Prep for the Absolute Worst",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		CustomReminder = { Dextrous = "A dextrous fighter can attack twice each turn." },
		Effect = {
			Name = "Haydoscale",
			Description = "Attach to a target fighter.\nThis fighter has dextrous while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Dextrous" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Dextrous" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "Knowing the forest was one thing. Having the right tools to navigate is another."
	},
	["Player Points"] = {
		Id = 17107610752,
		Name = "Player Points",
		PackDisplayOverride = "Card Puzzles",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select up to 3 fighters in your hand. They gain 300 Power.",
			Ability = {
				OnSummon = {
					Power = { { "StrengthenTargetInHand", 300, "CustomZoneTarget" } },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Fighter = true },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three fighters from your hand."
					}
				}
			}
		},
		Bio = "What even were the point of these? Heh, get it..."
	},
	PP1 = {
		Id = 17107610752,
		Name = "Player Points",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select up to 3 fighters in your hand. They gain 200 Power.",
			Ability = {
				OnSummon = {
					Power = { { "StrengthenTargetInHand", 200, "CustomZoneTarget" } },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Fighter = true },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three fighters from your hand."
					}
				}
			}
		},
		Bio = "What even were the point of these? Heh, get it..."
	},
	PP2 = {
		Id = 3238129940,
		Name = "Stone-Roided Warrior",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3, Neutral = 2 },
		Effect = {
			Name = "Probably shouldn't.",
			Description = "Whenever your opponent casts a fighter: It loses 100 power.",
			Type = "OnEnemySummon",
			Power = { { "Weaken", 100 } },
			Target = "Aggressor"
		},
		Bio = "Unlike the tyrannical Redcliff or the cruel Korblox, the Overseers see the growth of other under their gaze as an accomplishment."
	},
	PP3 = {
		Name = "JCRobloxGamingYT",
		Id = 5161062511,
		Health = 150,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Shield = true,
		Effect = {
			Name = "Appetite",
			Description = "When this card is cast: Each fighter in your hand gains 100 Power.",
			Type = "OnSummon",
			Power = { { "StrengthenHand", 100 } },
			Target = "Ally"
		},
		Bio = "I'm hunting wabbits. Weeboids, too."
	},
	PP4 = {
		Id = 12154412901,
		Name = "Bourgeoisie Rebel",
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
		Token = true,
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
	PP5 = {
		Id = 10243208368,
		Name = "StarvingBloxBoy",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		AssignMultiple = 2,
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Revival",
			Description = "During combat, this card assigns double its power in damage to fighters and players.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Hungry for some justice."
	},
	PP6 = {
		Id = 10243226256,
		Name = "supersdupersky712",
		Health = 700,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Charge = true,
		Cost = { Red = 1, Neutral = 2 },
		Effect = {
			Name = "Helping Out",
			Description = "Whenever this card destroys another: It gains 200 power.",
			Type = "OnDestroy",
			Power = { { "Strengthen", 200, "Self" } },
			Target = "Ally"
		},
		Bio = "Step one: Find your cousin. Step two: Put your cousin in Supersky's way. Step three: Find another cousin."
	},
	PP7 = {
		Id = 10310140266,
		Name = "logicanimal",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Charge = true,
		Effect = {
			Name = "Sugar and Ice",
			Description = "When this card attacks and destroys another: All allied fighters gain 100 power.",
			Type = "OnAttackDestroy",
			Power = { { "Strengthen", 100 } },
			Target = "Ally"
		},
		Bio = "Go Bighead or go home."
	},
	PP8 = {
		Id = 11973301360,
		Name = "BVote",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		CustomReminder = { Unlock = "Remove all locks on a fighter, allowing it to attack." },
		Cost = { Red = 3, Neutral = 1 },
		Effect = {
			Name = "Chain-Break!",
			Description = "When this card is cast: Unlock a target fighter.",
			Type = "OnSummon",
			Power = "Unlock",
			Target = "Single",
			Increase = 9999
		},
		Bio = "Best friends with 13Jayson, they even work well together!"
	},
	PP9 = {
		Id = 10279416851,
		Name = "Unlicensed Pilot",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		Archetype = "Pilots",
		AttackEffect = "TimeBomb",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Charge = true,
		Effect = {
			Name = "Airstrike",
			Description = "",
			Type = "Null",
			Power = { { "Neutral", 0 } },
			Target = "All"
		},
		Bio = "ZOOM ZAM ZOW, IT'S A PLANE!"
	},
	AlexValentinoCrown = {
		Id = 17107614568,
		Name = "AlexValentinoCrown",
		AltCards = {
			["F&F: Disasters"] = {
				Id = 17760582556,
				Name = "F&F: Disasters",
				Bio = "I'm just tryna AirDrop something special."
			}
		},
		PackDisplayOverride = "Card Puzzles",
		Health = 750,
		Power = 750,
		Rank = 6,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 4, Red = 3, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select up to 3 non-token cards in your opponent's baseplate. Put them into your hand.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Opponent", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GenZone" },
						Condition = { NotRarity = "Token" },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three fighters from your opponent's baseplate."
					}
				}
			},
			AmountOfTargets = 3
		},
		Bio = "When I walk in the spot .30 on me, buy out the club, bloxxers know that I'm paid."
	},
	AV1 = {
		Id = 17107614568,
		Name = "AlexValentinoCrown",
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 4, Red = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select up to 3 cards in your opponent's baseplate. Put them into your hand.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GenZone_Opponent", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GenZone" },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three fighters from your opponent's baseplate."
					}
				}
			},
			AmountOfTargets = 3
		},
		Bio = "When I walk in the spot .30 on me, buy out the club, bloxxers know that I'm paid."
	},
	AV2 = {
		Id = 6981590222,
		Name = "Funky Karnajj",
		CopyBodge = "Majora7",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Double Bleeding",
			Description = "When this card dies: Put a Green Stud into your baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 1 },
				nil,
				nil,
				nil,
				nil,
				"BaseplateGreen"
			} },
			Target = "Ally"
		},
		Bio = "*Masks not included, Terms and Conditions apply*"
	},
	AV3 = {
		Id = 6981589118,
		Name = "Funkalicious Lorenzo77555",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Love the blues",
			Description = "When this card dies: Put a Blue Stud into your Baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Blue Stud", 1 },
				nil,
				nil,
				nil,
				nil,
				"BaseplateBlue"
			} },
			Target = "Ally"
		},
		Bio = "LORENZO WILL LIVE ON."
	},
	AV4 = {
		Id = 6981589686,
		Name = "Funkadelic MajorMattias",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Cow Sergeant",
			Description = "When this card dies: Put a Red Stud into your baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Red Stud", 1 },
				nil,
				nil,
				nil,
				nil,
				"BaseplateRed"
			} },
			Target = "Ally"
		},
		Bio = "He loves cows, reliable for food and useful in battle!"
	},
	AV5 = {
		Id = 9433203994,
		Name = "Diamond Studderies",
		Health = 550,
		Power = 500,
		Rarity = "Token",
		Color = "Neutral",
		AttackEffect = "MagicYellow",
		Archetype = "Studling",
		PackDisplayOverride = "Metaverse Series: Developers & Contributors",
		Stealth = true,
		Cost = { Neutral = 5 },
		Effect = {
			Description = "Whenever you cast a Studling: It gains 100 health and power.\nDuring your end step: Search your deck for a Studling card.",
			Ability = {
				OnAllySummon = {
					Archetype = "Studling",
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Aggressor"
				},
				OnEnd = {
					Power = { { "RandomTutorfor", "Studling" } },
					Target = "Ally"
				}
			}
		},
		Bio = "hi stud"
	},
	AV6 = {
		Id = 10243116271,
		Name = "Gaming HyperVoxel",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Hammer",
		EffectAnimation = "MidHammerEffectAll",
		Color = "Red",
		Cost = { Neutral = 4, Red = 4 },
		Effect = {
			Name = "Hyperbolate",
			Description = "When this card is cast: It deals 1000 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 1000 } },
			Target = "All"
		},
		Bio = "Pew!"
	},
	AV7 = {
		Id = 7559446264,
		Name = "MSE6's Ban Hammer",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		EffectAnimation = "LargeHammerEffect",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		CustomReminder = {
			["Razar's Judgment"] = "An obliterated fighter is removed from the game completely."
		},
		Effect = {
			Name = "Mimic",
			Description = "Obliterate a target fighter.",
			Type = "OnSummon",
			Power = { { "Obliterate", 30 } },
			Target = "Single"
		},
		Bio = "Our content monitors have determined that your behavior at Roblox has been in violation of our Terms of Service."
	},
	AV8 = {
		Id = 16562309647,
		Name = "True Prosperity",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Flame",
		PackDisplayOverride = "Hallow's Bargains Shop",
		EffectAnimation = "SelfFlame",
		Color = "Yellow",
		Cost = { Neutral = 4, Red = 2, Green = 2, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Summon a 300/300 Studling of each colour. Then if there's 4 colours among cards in your baseplate, all allied fighters gain 100 health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Red Stud" },
						{ "Summon", "Green Stud" },
						{ "Summon", "Blue Stud" },
						{ "Summon", "Yellow Stud" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					MetaData = { Health = 300, Power = 300 },
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 100, "Ally" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Ally",
					EffectRequirement = { "Chromatic", "AllyGenZone", 4 }
				}
			}
		},
		Bio = "There's more to fortune than the wealth in your hands; love, life, family... those to care for, and who will care for you."
	},
	AV9 = {
		Id = 10279326467,
		Name = "Luck Warrior of Impure Pyrite",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Too lucky 4 me",
			Description = "When this card is cast, if you've cast 4 or more fighters this turn: Unlock all fighters. You can't cast fighters this turn.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999, "All" },
				{ "BypassSummon" }
			},
			EffectRequirement = { "Playertable", "Me", 4, 9999, "Fighters" },
			Target = "Ally"
		},
		Bio = "I have so much wealth that it could kill me."
	},
	AV10 = {
		Id = 12145035643,
		Name = "Rip and Tear!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 2, Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter.\nUnlock all allied fighters. They gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly" },
						{ "Unlock", 9999, "Ally" },
						{ "Heal", 100, "Ally" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>\"Damn it... let me twist your hippocampus a bit. I might've messed up somewhere.\"</i>"
	},
	AV11 = {
		Id = 6578854079,
		Name = "CoderDvorak",
		Health = 750,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Stealth = true,
		Cost = { Yellow = 3, Neutral = 3 },
		CustomReminder = {
			["The Soup is a Hardened Criminal"] = "Obliterate a terrified card if it's in play during its end step."
		},
		Effect = {
			Name = "Batter Up",
			Description = "Whenever a fighter is cast: Unlock it and it becomes terrified.",
			Type = "OnAnySummon",
			Power = {
				{ "GivePassive", "Terrified" },
				{ "Unlock", 9999 }
			},
			Target = "Aggressor"
		},
		Bio = "They might take our lifes, but they'll never take...OUR SOUP! CHARGE!!!"
	},
	HauntedUSA = {
		Id = 17251037035,
		Name = "HauntedUSA",
		Continued = true,
		Health = 900,
		Power = 100,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Description = "Whenever an allied fighter dies: This card gains 100 power.",
			Ability = {
				OnAllyDeath = {
					Power = { { "Strengthen", 100, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "The grandfather of the horror genre. Without him, we likely wouldn't have many of our well-known horror games on the platform."
	},
	USA1 = {
		Id = 17251037035,
		Name = "HauntedUSA",
		Continued = true,
		Health = 900,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Description = "Whenever an allied fighter dies: This card gains 100 power.",
			Ability = {
				OnAllyDeath = {
					Power = { { "Strengthen", 100, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "The grandfather of the horror genre. Without him, we likely wouldn't have many of our well-known horror games on the platform."
	},
	USA2 = {
		Id = 122882618545036,
		Name = "Cliff the Conspiracist",
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		PlayTest = true,
		AttackEffect = "Punch",
		EffectAnimation = "TurkeyBuff",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Whenever an allied effect targets: This card gains 150 Health and Power.",
			Type = "OnAllyTarget",
			Power = {
				{ "Heal", 150 },
				{ "Strengthen", 150 }
			},
			Target = "Self"
		},
		Bio = "Expedition Log 349-B<br/>One of our excavator boys ran into something very strange while cracking open some geodes earlier. It's some kind of ceremonial knife, and the text on it doesn't match any language in our databases, so it'll need some forensic testing. The kid that found it wouldn't let us take it for transport, though. Not sure why, considering that's a massive breach of protocol, but whatever. We can just get it back later; I wasn't about to argue with someone in a power loader."
	},
	USA3 = {
		Id = 10823286029,
		Name = "Jebbo's Mystery Meat Cleaver",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Green",
		PackDisplayOverride = "Metaverse Series: Developers & Contributors",
		AttackEffect = "Punch",
		Cost = { Green = 5 },
		Effect = {
			Description = "Give yourself an epic Green card.\nDivide all allied epic and legendary fighters into 2 copies of themselves.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomAdd", "MonoOnlyorGreenCost Epic Green" },
						{ "SummonSplit", 2, "AlliedEpic" },
						{ "SummonSplit", 2, "AlliedLegendary" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "SAND FLIES?! AAAAAAAAAAA"
	},
	USA4 = {
		Id = 7550898720,
		Name = "xXJavier_Creator1xX",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Value gaining",
			Description = "Destroy a target allied fighter.",
			Type = "OnSummon",
			Power = { { "Destroy", nil, nil, nil, nil, "HeadExplode" } },
			Target = "SingleAlly",
			EffectRequirement = { "Board", "Ally", 1, 9999 }
		},
		Bio = "I will destroy the middle class."
	},
	USA5 = {
		Id = 5854984801,
		Name = "Alpha Brick's Menace",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Era",
		Terrain = true,
		BypassOverdrive = true,
		Terrariant = "Presence Terrain",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When you cast this card, or at the start of each player's turn: If a fighter would trigger its own effect when cast, it triggers an additional time.",
			Ability = {
				OnSummon = {
					Power = { { "Overdrive", 30 } },
					Target = "Ally"
				},
				OnStart = {
					Power = { { "Overdrive", 30 } },
					Target = "CurrentTurn"
				}
			}
		},
		Bio = "The brick quivered with Zanzel's modifications to it. Such overflowing power is not meant for mortal hands."
	},
	USA6 = {
		Id = 11971796337,
		Name = "Lop Hee",
		Health = 600,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Arrow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Summonant = "HopelessslyToken",
		Effect = {
			Name = "Assembly",
			Description = "Whenever you cast a fighter, if there are less than 2{W} amongst the costs of allied fighters: Summon a copy of this card with no effect.",
			Type = "OnAllySummon",
			Power = { { "Summon", "Summonant", "Self" } },
			Target = "Self",
			EffectRequirement = { "Cost", "Ally", 0, 2, "Neutral" }
		},
		Bio = "You're not lopping to the task fast enough."
	},
	USA7 = {
		Id = 3299977652,
		Name = "Dried Ice",
		Health = 2100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		SpecialEffectAnimation = "Freeze",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Icing",
			Description = "When this card is cast: Lock it for 2 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Self",
			Increase = 2
		},
		Bio = "He's managing to keep you at bay, and he's not even wearing pants."
	},
	USA8 = {
		Id = 12145035643,
		Name = "Torn to Smithereens",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 2, Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter. Allied fighters gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly" },
						{ "Heal", 100, "Ally" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>\"Damn it... let me twist your hippocampus a bit. I might've messed up somewhere.\"</i>"
	},
	["Dancing Banana"] = {
		Id = 17107613495,
		Name = "Dancing Banana",
		PackDisplayOverride = "Card Puzzles",
		Health = 1000,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 8 },
		EffectVariable = 5,
		Effect = {
			Name = "Reincarnation",
			Description = "5 Charges.\nWhenever this card attacks: spend a charge and unlock it. If it has 0 charges left, Destroy it.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", -1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever this card attacks: spend a charge and unlock it. When this card reaches 0 charges: destroy it.",
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Destroy" } },
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				}
			}
		},
		Bio = "IT'S PEANUT BUTTER JELLY TIME!"
	},
	DB1 = {
		Id = 17107613495,
		Name = "Dancing Banana",
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 8 },
		EffectVariable = 5,
		Effect = {
			Name = "Reincarnation",
			Description = "5 Charges.\nWhenever this card attacks: spend a charge and unlock it. If it has 0 charges left, Destroy it.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", -1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever this card attacks: spend a charge and unlock it. When this card reaches 0 charges: destroy it.",
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Destroy" } },
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				}
			}
		},
		Bio = "IT'S PEANUT BUTTER JELLY TIME!"
	},
	DB2 = {
		Id = 10243834934,
		Name = "Pa_st",
		Health = 750,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 4, Red = 5 },
		Effect = {
			Name = "Burning Fists of Rage",
			Description = "Whenever an enemy fighter dies: Your opponent loses 200 life. This card gains 200 Power.",
			Type = "OnEnemyDeath",
			Power = {
				{ "Inflict", 200, "Opponent" },
				{ "Strengthen", 200 }
			},
			Target = "Self"
		},
		Bio = "Ｎｏｗ ｔｈａｔ＇ｓ ａ ｌｏｔｔａ ｄａｍａｇｅ"
	},
	DB3 = {
		Id = 11769909682,
		Name = "NYT Bestseller cloakedyoshi",
		Health = 600,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you cast another fighter: It gains this card's power.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Aggressor" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "I suppose you could say this was The Day The Noobs Took Over Roblox."
	},
	DB4 = {
		Id = 17107611137,
		Name = "Champion Paramon Trainer",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		PackDisplayOverride = "Hallow's Bargains Shop",
		StarterCard = true,
		Effect = {
			Name = "Demon Eye",
			Description = "When this card dies: Remove {W} from all colourless cards in your hand.",
			Type = "OnDeath",
			Power = { {
				"IncreaseCost",
				{ -1, "Neutral", "Nil" },
				"CustomTarget"
			} },
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "Color",
				Modifier = "Neutral"
			},
			Target = "Self"
		},
		Bio = "He's going to catch them all, and be the best like no one ever was."
	},
	DB5 = {
		Id = 4789593266,
		Name = "Dwarvern Mailman",
		Health = 500,
		Power = 250,
		Rarity = "Token",
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
	DB6 = {
		Id = 9964861799,
		Name = "Paraselene Aesthetics",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Transformant = "Lunar Rager",
		DamageImmune = true,
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: You draw a card and lose 500 life. Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "Cost", 500 },
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "Let my traitors writhe about with technology and magic..."
	},
	DB7 = {
		Id = 10224363683,
		Name = "Ultimate Paleolithic Engine",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Only the greatest games survive long enough for their stories to be told."
	},
	DB8 = {
		Id = 16056323583,
		Name = "G_EG",
		Health = 700,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		PackDisplayOverride = "Hallow's Bargains Shop",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Charge = true,
		EffectVariable = 1,
		Effect = {
			Description = "Once each turn, whenever you discard a card: Mark a target fighter.\nWhenever this card destroys a marked fighter: Summon an unlocked copy of that fighter, except it's terrified.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "EVExactValueCheck", 1 } },
					Target = "Self",
					NoBlip = true
				},
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							nil,
							nil,
							nil,
							"Mark"
						},
						{ "GivePassive", "Marked" }
					},
					Target = "Single"
				},
				OnDestroy = {
					Power = {
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "UseCount" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "TargetCard" },
							"Aggressor"
						},
						{ "Summon", "Variable", "Ally" },
						{ "Unlock", 999, "SummonedCard" },
						{
							"AlterEV",
							{ "Load", "EffectVariable", "nil", "UseCount" }
						}
					},
					Target = "Self",
					Marked = true,
					MetaData = { Terrified = true },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "<b><font color=\"#00FF00\">\"I Am Ultimate.\" </font></b>"
	},
	DB9 = {
		Id = 78720720976786,
		Name = "0f2991 if they locked in",
		Health = 800,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "TimeBomb",
		Color = "Red",
		Untradeable = true,
		PackDisplayOverride = "Card Quests",
		Equippant = "Marked Mod",
		Cost = { Neutral = 3, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Deal 300 damage to all Marked enemy fighters.\nWhenever this card attacks: Mark a target enemy fighter.",
			Ability = {
				OnAttack = {
					Power = { { "EquipGear", "Equippant" } },
					Target = "SingleEnemy"
				},
				OnSummon = {
					Power = { { "Damage", 300 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Marked",
						SubModifier = true
					}
				}
			}
		},
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Bio = "'explosion-happy crustacean'? no, i'm a certified demolitions expert. get it right, jedno oko."
	},
	DB10 = {
		Id = 10243218457,
		Name = "FakePiggy1261",
		Health = 650,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Charge = true,
		Effect = {
			Name = "Life fam",
			Description = "When this card dies: Deal 100 damage to all fighters.",
			Type = "OnDeath",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "He wipes clean all stench of Suidae."
	},
	DB11 = {
		Id = 3238125976,
		Name = "Epic Prestwick",
		Health = 300,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 1, Yellow = 5 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "He'll make your candle go out."
	},
	DB12 = {
		Id = 15941930047,
		Name = "Soulism",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Red",
		Equippant = "Marked Mod",
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Cost = { Neutral = 2, Red = 5 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Attach marked to a target enemy fighter.\nWhenever an enemy marked fighter dies: Your opponent loses 450 life.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Equippant" } },
					Target = "SingleEnemy"
				},
				OnEnemyDeath = {
					Power = { { "Inflict", 450, "Opponent" } },
					Target = "Self",
					HasPassive = "Marked"
				}
			}
		},
		Bio = "A reputable auditor, Souly seeks retribution against those who abuse their dealings with immortality. But one can imagine what inhuman thoughts lies behind all the wrath she holds within her when given such task."
	},
	DB13 = {
		Id = 10279203055,
		Name = "Supercharged Volttt",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "Charge",
			Description = "When this card is cast: A target fighter gains 200 power, then unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{ "Unlock", 999, "Self" }
			},
			Target = "Single"
		},
		Bio = "Steven Universe is a good cartoon series."
	},
	DB14 = {
		Id = 125710996172956,
		Name = "Unionized Remnant",
		Health = 50,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Red = 1 },
		Blessing = true,
		Effect = {
			Description = "When this card is cast, if you have 3 or more blessings: Unlock it.",
			Type = "OnSummon",
			Power = { { "Unlock", 9999 } },
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 3, 99, "Modified Hand Slots" }
		},
		Bio = "With his ire absolute to the loss of his lavish life, he was consumed by the flood of rage."
	},
	Arch_Mage = {
		Id = 108871865281894,
		Name = "Arch_Mage",
		AltCards = {
			["F&F: Cullers"] = {
				Id = 17540224763,
				Name = "F&F: Cullers",
				Bio = "Graveyard, that's where the opps stay."
			}
		},
		PackDisplayOverride = "Card Puzzles",
		Health = 1000,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 3, Yellow = 3, Neutral = 1 },
		Overload = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: it gains power equal to all life that was lost this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Playertable", "LifeLoss", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "LifeLoss", "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Known for Deepwoken and Rogue Lineage; don't ping him."
	},
	AM1 = {
		Id = 108871865281894,
		Name = "Arch_Mage",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 3, Yellow = 3, Neutral = 1 },
		Overload = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: it gains power equal to all life that was lost this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Playertable", "LifeLoss", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "LifeLoss", "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Known for Deepwoken and Rogue Lineage; don't ping him."
	},
	AM2 = {
		Id = 7550962042,
		Name = "Lootskipper JavierCollin88Poppin",
		Health = 4000,
		Power = 4000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2, Yellow = 2 },
		EffectVariable = 6,
		Effect = {
			Description = "Up to 8 times each turn, whenever you lose life: Your opponent loses 200 life.",
			Ability = {
				OnLifeLoss = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 8, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "Inflict", 200, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "What's POPPIN?"
	},
	AM3 = {
		Id = 10318239482,
		Name = "Felinor Rad",
		Health = 5000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 4 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Molten and furious."
	},
	AM4 = {
		Id = 11770008111,
		Name = "Authority Soldier Histor",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		DamageImmune = true,
		Color = "Red",
		Cost = { Yellow = 3 },
		Summonant = "Round7",
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever you lose life: Summon a 400/150 Noob that's inert in play.",
			Type = "OnLifeLoss",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Historically, you're a scrub."
	},
	AM5 = {
		Id = 6801082499,
		Name = "Freshie",
		Health = 500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Summonant = "Round7",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 1,
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "Assimilate",
			Description = "During your end step, if there's an allied 'Noob' token: Give yourself a Nascent Stud.",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					EffectRequirement = { "TokenArchetype", "Ally", 1, 9999, "Noob" }
				}
			}
		},
		Bio = "A cute lil' noob. Awww..."
	},
	AM6 = {
		Id = 10243094402,
		Name = "Agamatsu Firebrand1",
		Health = 1500,
		Power = 800,
		Rarity = "Token",
		DamageImmune = true,
		AttackEffect = "Firebrand",
		EffectAnimation = "SelfFire",
		Color = "Red",
		Cost = { Red = 6, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever an enemy fighter dies: This card gains 200 health.",
			Type = "OnEnemyDeath",
			Power = { { "Heal", 200, "Self" } },
			Target = "Ally"
		},
		Bio = "Death is not the greatest loss in life. The greatest loss is what dies inside us while we live."
	},
	AM7 = {
		Id = 10243139851,
		Name = "Duke Tomfl",
		Health = 800,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Overload = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Mafia Support",
			Description = "When this card is cast: A target fighter gains 200 power and overload.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Overload", "Single" },
				{ "Strengthen", 200, "Single" }
			},
			Target = "Single"
		},
		Bio = "Time to end this."
	},
	AM8 = {
		Id = 10242993687,
		Name = "Ganymede rachjumper",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		DamageImmune = true,
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 4, Red = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "Unleash Hell",
			Description = "Whenever you lose life: Deal that much damage to all fighters.",
			Ability = {
				OnSummon = {
					Power = { {
						"AlterEV",
						{ "Set", "Playertable", "LifeLoss", "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnLifeLoss = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Playertable", "LifeLoss", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Damage", "Variable", "All" },
						{
							"AlterEV",
							{ "Set", "Playertable", "LifeLoss", "Nil" }
						}
					},
					Target = "Self"
				},
				OnStart = {
					Power = { {
						"AlterEV",
						{ "Set", "Playertable", "LifeLoss", "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "You can run...but you can't hide."
	},
	AM9 = {
		Id = 9926967621,
		Name = "Titan Supah Squidshock EX",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Bubbles",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Lost Commissions",
		Cost = { Yellow = 6 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Draw 2 cards. Each fighter in your hand gains haste and fleeting.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2, "Ally" },
						{ "GivePassive", "Charge", "AllyHand" },
						{ "GivePassive", "Fleeting", "AllyHand" }
					},
					Target = "AllyHand"
				}
			}
		},
		Bio = "Supercharged squid ink makes you run fast for about 10 seconds. Don't ask what happens afterwards.\nThis card was designed by Studderies."
	},
	AM10 = {
		Id = 10243809793,
		Name = "Etrean SkySpell",
		Health = 1500,
		Power = 500,
		Rarity = "Token",
		DamageImmune = true,
		ChargeRequirement = { "Playertable", "Me", 50, 999999999999999, "EffectLifeLoss" },
		AttackEffect = "SMG",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Name = "Investment",
			Description = "This card has haste if an effect made you lose life since your last end step.\nWhenever this card destroys another: Unlock it. Your opponent loses 500 life.",
			Type = "OnDestroy",
			Power = {
				{ "Unlock", 9999, "Self" },
				{ "Inflict", 500 }
			},
			Target = "Opponent"
		},
		Bio = "An absolute zero. I'm nobody's hero."
	},
	AM11 = {
		Id = 10683854586,
		Name = "Race Reroll",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Exchange the health of two target fighters, then the power of two target fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" }
						},
						{ "ExchangeHealth", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" }
						},
						{ "ExchangePower", "Variable" }
					},
					Target = "Single",
					UniqueTargets = true
				}
			}
		},
		Bio = "Click on someone. Jump off. Repeat."
	},
	AM12 = {
		Id = 7550962042,
		Name = "Lootskipper JavierCollin88Poppin",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2, Yellow = 2 },
		EffectVariable = 6,
		Effect = {
			Description = "Up to 8 times each turn, whenever you lose life: Your opponent loses 200 life.",
			Ability = {
				OnLifeLoss = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 8, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "Inflict", 200, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "What's POPPIN?"
	},
	AM13 = {
		Id = 9930960620,
		Name = "permafreshie epik_nob",
		Health = 800,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Red = 3 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever you cast a fighter: Transform it into this card. All allied fighters gain 50 Power.",
			Type = "OnAllySummon",
			Power = {
				{ "Transform", "Avectus", "Aggressor" },
				{ "Strengthen", 50, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Fall to breadcrumbs!"
	},
	["Adrian928 and ColdDeveloper"] = {
		Id = 91981920848016,
		Name = "Adrian928 & ColdDeveloper",
		Health = 1100,
		Power = 400,
		PackDisplayOverride = "Card Puzzles",
		Rarity = "Epic",
		AttackEffect = "British",
		DivideImmune = true,
		Color = "Blue",
		Cost = { Blue = 3, Green = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card finishes attacking: Divide a target fighter into 2 smaller copies of itself.",
			Ability = {
				OnAttackEnd = {
					Power = { { "SummonSplit", 2, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "Spending 2 hours on the toilet might be the scariest thing that happened here."
	},
	AC1 = {
		Id = 91981920848016,
		Name = "Adrian928 & ColdDeveloper",
		Health = 1100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		DivideImmune = true,
		Color = "Blue",
		Cost = { Blue = 3, Green = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card finishes attacking: Divide a target fighter into 2 smaller copies of itself.",
			Ability = {
				OnAttackEnd = {
					Power = { { "SummonSplit", 2, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "Spending 2 hours on the toilet might be the scariest thing that happened here."
	},
	AC2 = {
		Id = 6709427695,
		Name = "adnama",
		Health = 100,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: All enemy fighters lose 150 power. All allied fighters gain 150 power.",
			Type = "OnDeath",
			Power = {
				{ "Weaken", 150, "Opponent" },
				{ "Strengthen", 150 }
			},
			Target = "Ally"
		},
		Bio = "\"For a taste of my infinite wisdom, you must be deliberate.\""
	},
	AC3 = {
		Id = 10279233700,
		Name = "DracoSwordNovice",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Stud",
			Description = "Whenever a fighter dies: This card gains 100 power. Deal 50 damage to all fighters.",
			Type = "OnAnyDeath",
			Power = {
				{ "Strengthen", 100 },
				{ "Damage", 50, "All" }
			},
			Target = "Self"
		},
		Bio = "Another user implicated in the 2012 April Fools incident. Search his username to find out his fate."
	},
	AC4 = {
		Id = 6460280000,
		Name = "Quisnos",
		Health = 150,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: A target fighter gains 300 health, then unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 300 },
				{ "Unlock", 999, "Self" }
			},
			Target = "Single"
		},
		Bio = "Boxing Champ from the 2010 Blox Box, though he was a 'Hack Week Hero' too."
	},
	AC5 = {
		Id = 10184738708,
		Name = "Divorce Papers",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Addant = "ContractToken",
		Effect = {
			Name = "WWW",
			Description = "Steal a target fighter.\nGive your opponent a copy of this card, except it costs {W}{W}{W}{W} and doesn't have this effect.",
			Type = "OnSummon",
			Power = {
				{ "Steal", 30, "Single" },
				{ "Add", "Addant" }
			},
			Target = "Opponent"
		},
		Bio = "\"You took EVERYTHING from me. Now it's my turn.\""
	},
	AC6 = {
		Id = 12294931520,
		Name = "Citizen's Peaceful Protest",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Red = 3 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard your third card each turn: Unlock a target fighter. It gains 150 Health and Power.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Heal", 150 },
						{ "Strengthen", 150 },
						{ "Unlock", 9999 }
					},
					Target = "Single",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "United under one cause."
	},
	AC7 = {
		Id = 8421311347,
		Name = "The Ex-Ultimate Trade",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Description = "If a target enemy fighter has 350 or more health, unlock it and divide it into seven copies of itself.\nYou can't cast anything this turn.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999, "SingleEnemy" },
				{ "SummonSplit", 7, "SingleEnemy" },
				{ "BypassSummon", "Ally" },
				{ "BypassAction", "Ally" },
				{ "BypassTerrain", 30, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Azureless isn't one to negotiate with outsiders, but overwhelming wealth speaks louder. The entrepreneur unsettles the conqueror."
	},
	AC8 = {
		Id = 10184164002,
		Name = "Pig Trap",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		TokenDiscard = true,
		Token = true,
		AttackEffect = "TimeBomb",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Explosion",
			Description = "When this card dies: Deal 100 damage to all fighters.",
			Type = "OnDeath",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "Huh, that's weird. I see a bear trap but no actual bears around h-BONK!"
	},
	AC9 = {
		Id = 5995716107,
		Name = "Priestess Zanzel, the Promised One",
		Health = 1300,
		Power = 1300,
		Rarity = "Token",
		AttackEffect = "Gravity",
		BypassOverdrive = true,
		TransformImmune = true,
		Color = "Green",
		Cost = { Green = 13 },
		Effect = {
			Name = "Evisceration",
			Description = "When this card attacks your opponent directly: Ban them.",
			Type = "OnStrike",
			Power = { { "Inflict", 9999999 } },
			Target = "Opponent"
		},
		Bio = "Mankind shall soon tread upon the path to perfection."
	},
	QuintinityZero = {
		Id = 94100450358412,
		Name = "QuintinityZero",
		PackDisplayOverride = "Card Puzzles",
		Health = 800,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Spiralant = "Neonate Gilmuraig",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2, Neutral = 1 },
		EffectVariable = 0,
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter with total stats 500 or less: That fighter spirals twice.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Spiral" },
						{ "Spiral" }
					},
					SizeClass = "Picant",
					Target = "Aggressor"
				}
			}
		},
		Bio = "This is some pretty Epic Mining, Too!"
	},
	QZ1 = {
		Id = 94100450358412,
		Name = "QuintinityZero",
		Health = 800,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Spiralant = "Neonate Gilmuraig",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2, Neutral = 1 },
		EffectVariable = 0,
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter with total stats 500 or less: That fighter spirals twice.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Spiral" },
						{ "Spiral" }
					},
					SizeClass = "Picant",
					Target = "Aggressor"
				}
			}
		},
		Bio = "This is some pretty Epic Mining, Too!"
	},
	QZR = {
		Id = 5848954566,
		Name = "NotADevRolve",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast: Summon a copy of it. The clone preserves this card's current stats.",
			Type = "OnSummon",
			Power = { { "SummonCopy" } },
			EffectSummonCopyPreserveStats = true,
			Target = "Self"
		},
		Bio = "CEO of ROLVe. Source Engine, move over."
	},
	QZ3 = {
		Id = 8421454056,
		Name = "FourXIV",
		Health = 600,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Transformant = "FiveXIV",
		ReplaceCardArtant = { 8421454056 },
		Effect = {
			Name = "Setstat Shenanigans",
			Description = "Whenever you cast a fighter that costs 4 or fewer total studs, if there's no gear on this card: Divide that fighter into two smaller copies of itself. Attach a gear to this card.",
			Type = "OnAllySummon",
			Power = {
				{ "SummonSplit", 2 },
				{ "EquipGear", "Exertion", "Self" },
				{
					"ReplaceCardArt",
					{ "Variable" },
					"Self"
				},
				{ "ReplaceBio", "ReplaceBioant", "Self" }
			},
			EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" },
			Target = "Aggressor",
			LowCost = 4
		},
		Bio = "Ｈｅ ｃｅｒｔａｉｎｌｙ ｉｓ."
	},
	QZ4 = {
		Id = 95938775415202,
		Name = "Transmogrified Hug",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectVariable = 0,
		Summonant = "Maladeity's Pustule",
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all gears on all fighters and terrain.\nSummon a 100/100 Maladeity's Pustule.\nIt gains 100 Health and Power for each gear destroyed this way.",
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
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"All"
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"Terrains"
						},
						{ "DestroyGear", "All", "All" },
						{ "DestroyGear", "All", "Terrains" },
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Summon", "Summonant" },
						{ "Heal", "Variable", "SummonedCard" },
						{ "Strengthen", "Variable", "SummonedCard" }
					},
					Target = "Self",
					MetaData = { Health = 100, Power = 100 }
				}
			}
		},
		Bio = "Two souls soaked in trauma used the Doomspire to cope, but they learnt they could use each other to heal."
	},
	QZ5 = {
		Id = 137825059340265,
		Name = "Pyrite Bloxxer",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever you cast a gear: Unlock this fighter.",
			Ability = {
				OnAllyCastGear = {
					Power = { { "Unlock", 9999999 } },
					Target = "GearOwner",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "So many KOs, so little time."
	},
	Keith = {
		Id = 110323354101242,
		Name = "Keith",
		PackDisplayOverride = "Card Puzzles",
		TriggerInHand = true,
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 12 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "This card costs {G} less for each card in your hand.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"SetCost",
							{ 12, "Green" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{
							"IncreaseCost",
							{ "Variable", "Green" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Seven's my lucky number! But so is 22!"
	},
	KE1 = {
		Id = 110323354101242,
		Name = "Keith",
		TriggerInHand = true,
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 10 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "This card costs {G} less for each card in your hand.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"SetCost",
							{ 12, "Green" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{
							"IncreaseCost",
							{ "Variable", "Green" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Seven's my lucky number! But so is 22!"
	},
	KE2 = {
		Id = 6801095225,
		Name = "Super Cool and Awesome Flufflefunz",
		Health = 600,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Minigun",
		EffectAnimation = "ShootAllMinigun",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you discard a card, if you've discarded 3 or more cards since your last end step: Deal 100 damage to each enemy fighter.",
			Type = "OnAllyDiscard",
			Power = { { "Damage", 100 } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Me", 3, 9999, "DiscardCount" }
		},
		Bio = "His self-milling is the last thing people see if they dare to call his Formidulosus a 'Walmart Dominus.'"
	},
	KT3 = {
		Id = 10337542330,
		Name = "Pop Roxapox",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Paintball",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		CustomReminder = {
			["Colour Paint"] = "A free action, inert when discarded. It makes a target fighter its colour and stops you casting actions this turn."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself Red Paint, Green Paint, Blue Paint, and Yellow Paint.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Red Paint" },
						{ "Add", "Blue Paint" },
						{ "Add", "Green Paint" },
						{ "Add", "Yellow Paint" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Biggs isn't exactly gifted in the field of design. Thankfully, his wealth can substitute for that problem."
	},
	KT4 = {
		Id = 10243139851,
		Name = "Funky Tomfl",
		Health = 800,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Overload = true,
		Cost = { Neutral = 2, Red = 4 },
		Effect = {
			Name = "Mafia Support",
			Description = "When this card is cast: A target fighter gains 200 power and overload.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Overload", "Single" },
				{ "Strengthen", 200, "Single" }
			},
			Target = "Single"
		},
		Bio = "Time to end this."
	},
	KT5 = {
		Id = 8421436007,
		Name = "TheStainlessSteelEagle",
		Health = 1200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you cast an action or terrain card, if you've cast 4 or fewer cards this turn: You lose 400 life. Search your deck for an action card.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Cost", 400 },
						{ "RandomTutorfor", "Action" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 4, "Storm" }
				},
				OnAllyTerrainCast = {
					Power = {
						{ "Cost", 400 },
						{ "RandomTutorfor", "Action" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 4, "Storm" }
				}
			}
		},
		Bio = "Kathara's desertification systems turned against them, scorching invader and invaded alike."
	},
	KT6 = {
		Id = 8938592657,
		Name = "Delta Dwarvern Reprocessing",
		Health = 0,
		Power = 0,
		Rarity = "Token",
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
	KT7 = {
		Id = 4918928120,
		Name = "Cubic GamesBloxx",
		Health = 900,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 9, Red = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Render",
			Description = "When this card is cast: Return a target enemy fighter to its hand. Your opponent loses life equal to its Power.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Power", "Nil" },
					"SingleEnemy"
				},
				{ "Return" },
				{ "Inflict", "Variable", "Opponent" }
			},
			Target = "SingleEnemy"
		},
		Bio = "Noob toys are his favorites, and he'll make a noob toy out of you."
	},
	KT8 = {
		Id = 6575082685,
		Name = "Kara's Infiltration",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Blue = 3 },
		Addant = "Rubber Duck",
		CustomReminder = { ["Rubber Duck"] = "A useless fighter, fit only for discarding." },
		EffectVariable = 0,
		Effect = {
			Name = "Sneak Attack",
			Description = "Give all players 3 Rubber Ducks.\nIf a target fighter costs 3 or fewer total studs, return it to its hand.",
			Type = "OnSummon",
			Power = {
				{
					"RepeatingAdd",
					{ "Addant", 3 },
					"Ally"
				},
				{
					"RepeatingAdd",
					{ "Addant", 3 },
					"Opponent"
				},
				{ "Return" }
			},
			Target = "Single",
			EffectReturnStudCap = 3
		},
		Bio = "Ask Kara to \"be quiet\" and she might just only deck you in, if she's feeling nice. Still, Herrus told her it was the only way to reach the Infurnished holding cells, deep below."
	},
	KT9 = {
		Id = 10279369822,
		Name = "Duck Enjoyer TanPoi12",
		Health = 650,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Addant = "Rubber Duck",
		PackDisplayOverride = "Metaverse Series: Lost Commissions",
		Cost = { Neutral = 2, Blue = 2, Yellow = 1 },
		CustomReminder = { ["Rubber Duck"] = "A useless fighter, fit only for discarding." },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you discard your fourth card each turn: This card gains 200 health and power.\nDuring your end step: Give yourself a Rubber Duck.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 4, 5, "DiscardCount" }
				},
				OnEnd = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Now, is she tiny or is it a giant?\nThis card was designed by TrixxterTrixie."
	},
	KT10 = {
		Id = 5994051763,
		Name = "DMCA'd NintendoZACHERY",
		Health = 500,
		Power = 500,
		Rarity = "Token",
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
	KT11 = {
		Id = 9513517974,
		Name = "Sold-Out Lua's Informant",
		Health = 200,
		Power = 800,
		Rarity = "Token",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Blue = 2 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "Whenever you discard a card: Put an Eldritch Blessing on a card in your hand.",
			Type = "OnAllyDiscard",
			Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
			Target = "Self"
		},
		Bio = "Lua gazed upon the Farseekers' expedition with skepticism. Javion's residents felt the same."
	},
	KT12 = {
		Id = 6670738713,
		Name = "Valved Steam Razikai",
		Health = 1200,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Sticks and Stones and Steam",
			Description = "During your end step, if you have 8 or more cards in hand: This card gain 200 Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			EffectRequirement = { "Playertable", "Me", 8, 9999, "Hand" },
			Target = "Self"
		},
		Bio = "Not to be confused with Valve's premier gaming service."
	},
	KT13 = {
		Id = 5001162546,
		Name = "Squished SoftCollision",
		Health = 450,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		EffectAnimation = "StudYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		CustomReminder = {
			Generation = "This card makes a stud of its colour, just like it does at the end of your turn."
		},
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast: It generates five times.",
			Type = "OnSummon",
			Power = { { "Generate", 5, "Self" } },
			Target = "Ally"
		},
		Bio = "Helpful builder at daybreak, sneaky swordsman at twilight."
	}
}
