



return {
	CPS1R = {
		Id = 10279388138,
		Name = "Bowl of Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Bowl of Greed",
			Description = "A card is drawn.",
			Type = "OnSummon",
			Power = { { "Draw", 1, "Ally" } },
			Target = "Ally"
		},
		Bio = ""
	},
	CPS1F = {
		Id = 10279388138,
		Name = "Bowl of Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		IsFromCataclysm = true,
		EffectAnimation = "ClownHonk",
		IsCataclysmFalse = true,
		Effect = {
			Name = "Bowl of Greed",
			Description = "A card is drawn.",
			Type = "OnSummon",
			Power = { { "Draw", 0, "Ally" } },
			Target = "Ally"
		},
		Bio = ""
	},
	CPS2R = {
		Id = 9964949822,
		Name = "Pumpkin Bomb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		EffectAnimation = "SmallExplosionEffect",
		IsFromCataclysm = true,
		Cost = { Neutral = 1 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Deal 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250 } },
			Target = "Single"
		},
		Bio = ""
	},
	CPS2F = {
		Id = 9964949822,
		Name = "Pumpkin Bomb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		EffectAnimation = "ClownHonk",
		IsFromCataclysm = true,
		IsCataclysmFalse = true,
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Deal 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 0 } },
			Target = "Single"
		},
		Bio = ""
	},
	CPS3R = {
		Id = 70837345780388,
		Name = "Victim of the Xenoqualia",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { {
						"AddGenZone",
						{ "Cosmic Crack", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPS3F = {
		Id = 70837345780388,
		Name = "Victim of the Xenoqualia",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		IsFromCataclysm = true,
		IsCataclysmFalse = true,
		SummonAnimation = "ClownHonk",
		Terrain = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { {
						"AddGenZone",
						{ "Cosmic Crack", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPS4R = {
		Id = 134756253670909,
		Name = "Domain Expansion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Empty both terrain slots.",
			Ability = {
				OnSummon = {
					Power = { { "DestroyTerrain", 30, "All" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPS4F = {
		Id = 134756253670909,
		Name = "Domain Expansion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		IsFromCataclysm = true,
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Reincarnation",
			Description = "Empty both terrain slots.",
			Ability = {
				OnSummon = {
					Power = { { "AnimateTerrain", 30, "All" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPS5R = {
		Id = 10288777233,
		Name = "Medic Kit",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Bandage",
			Description = "You gain a reality's worth of life, then lose 800 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -1000 },
				{ "Cost", 800 }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	CPS5F = {
		Id = 10288777233,
		Name = "Medic Kit",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsFromCataclysm = true,
		EffectAnimation = "ClownHonk",
		IsCataclysmFalse = true,
		Effect = {
			Name = "Bandage",
			Description = "You gain a reality's worth of life, then lose 800 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -1 },
				{ "Cost", 800 }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	CPS6R = {
		Id = 12702597582,
		Name = "Bioblade Chef",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		CustomReminder = {
			["Immortal Sword Deck"] = "A deck of unique sword cards that transform allied fighters into wielders."
		},
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Liberate = true,
		EffectAnimation = "ImmortalSwordDraw",
		IsCataclysmTrue = true,
		Effect = {
			Description = "Draw a card from an Immortal Sword deck.",
			Ability = {
				OnSummon = {
					Power = { { "DrawImmortal", 1, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CPS6F = {
		Id = 12702597582,
		Name = "Bioblade Chef",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		CustomReminder = {
			["Immortal Sword Deck"] = "A deck of unique sword cards that transform allied fighters into wielders."
		},
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Liberate = true,
		EffectAnimation = "ImmortalSwordDraw",
		IsCataclysmFalse = true,
		Effect = {
			Description = "Draw a card from an Immortal Sword deck.",
			Ability = {
				OnSummon = {
					Power = { { "DrawImmortal", 1, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CPS7R = {
		Id = 7128383934,
		Name = "Rubber Duck",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Rubber Duck",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		EffectAnimation = "DuckCall",
		IsCataclysmTrue = true,
		Effect = {
			Name = "Quack",
			Description = "Cast this card only if you exist.",
			Type = "OnDiscarded",
			Power = { { "Draw", 0 } },
			Target = "Ally",
			NoBlip = true
		},
		Bio = ""
	},
	CPS7F = {
		Id = 7128383934,
		Name = "Rubber Duck",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Rubber Duck",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		EffectAnimation = "DuckCall",
		Requirement = { "Archetype", "Ally", 1, 9999, "Gladiator" },
		IsCataclysmFalse = true,
		Effect = {
			Name = "Quack",
			Description = "Cast this card only if you exist.",
			Type = "OnDiscarded",
			Power = { { "Draw", 0 } },
			Target = "Ally",
			NoBlip = true
		},
		Bio = ""
	},
	CPS8R = {
		Id = 95616116555118,
		Name = "Ravenous Rafflesia",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Look at the top 2 cards of a deck and destroy 1 of them.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 2 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card to destroy"
					}
				}
			}
		},
		Bio = ""
	},
	CPS8F = {
		Id = 95616116555118,
		Name = "Ravenous Rafflesia",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		IsCataclysmFalse = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Look at the top 2 cards of a deck and destroy 1 of them.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { TopCard = 2 },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a card to destroy"
					}
				}
			}
		},
		Bio = ""
	},
	CPS9R = {
		Id = 6234671257,
		Name = "Alpha Brick's Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Plushie Amp",
			Description = "A target fighter's rarity becomes Shedletsky.",
			Type = "OnSummon",
			Power = { { "ReplaceRarity", "Shedletsky" } },
			Target = "Single"
		},
		Bio = ""
	},
	CPS9F = {
		Id = 6234671257,
		Name = "Alpha Brick's Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsCataclysmFalse = true,
		Effect = {
			Name = "Plushie Amp",
			Description = "A target fighter's rarity becomes Shedletsky.",
			Type = "OnSummon",
			Power = { { "Transform", "Shedletsky the Fried One" } },
			Target = "Single"
		},
		Bio = ""
	},
	CPS10R = {
		Id = 15121301423,
		Name = "Crystal Snare",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "Freeze",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Crystal Snare",
			Description = "Lock a target fighter.",
			Type = "OnSummon",
			Power = { { "Lock", 1 } },
			Target = "Single"
		},
		Bio = ""
	},
	CPS10F = {
		Id = 15121301423,
		Name = "Crystal Snare",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "Freeze",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		IsCataclysmFalse = true,
		Effect = {
			Name = "Crystal Snare",
			Description = "Lock a target fighter.",
			Type = "OnSummon",
			Power = { { "EquipGear", "The Lock" } },
			Target = "Single"
		},
		Bio = ""
	},
	CPM1R = {
		Id = 10184322514,
		Name = "Circle Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a stud of each colour into a baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = ""
	},
	CPM1F = {
		Id = 10184322514,
		Name = "Circle Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		IsFromCataclysm = true,
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a stud of each colour into a baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				}
			},
			Target = "Opponent"
		},
		Bio = ""
	},
	CPM2R = {
		Id = 5205626063,
		Name = "Night Fright",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Nightmare",
		TokenOmni = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Addant = "Nightmare",
		Summonant = "The Heptagon's Wounds",
		IsCataclysmTrue = true,
		Rank = 33,
		Effect = {
			Description = "When this card enters your hand: Give yourself 3 Nightmares.",
			Ability = {
				OnDrawn = {
					Target = "Ally",
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					}
				},
				OnSummon = {
					Target = "Ally",
					Power = { { "Summon", "Summonant" } }
				}
			}
		},
		Bio = ""
	},
	CPM2F = {
		Id = 5205626063,
		Name = "Night Fright",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Nightmare",
		TokenOmni = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Addant = "Nightmare",
		IsCataclysmFalse = true,
		Summonant = "Betray Those Subjugated",
		Rank = 33,
		Effect = {
			Description = "When this card enters your hand: Give yourself 3 Nightmares.",
			Ability = {
				OnDrawn = {
					Target = "Ally",
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					}
				},
				OnSummon = {
					Target = "Opponent",
					Power = { { "Summon", "Summonant" } }
				}
			}
		},
		Bio = ""
	},
	CPM3R = {
		Id = 11769914745,
		Name = "Deity Deception",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Summonant = "AIpha Brick",
		IsCataclysmTrue = true,
		CustomReminder = {
			["AIpha Brick"] = "Effects can't damage, target, or set the stats of the brick. When it's cast, obliterate the bottom card of your opponent's deck. Transform the brick into the obliterated card when an effect would target it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Summon an 800/800 AIpha Brick.\nWhen you do, Obliterate the bottom card of your opponent's deck.",
			Ability = {
				OnSummon = {
					Power = { { "SummonWithEffect", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPM3F = {
		Id = 11769914745,
		Name = "Deity Deception",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Summonant = "AIpha Brick-CP",
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		CustomReminder = {
			["AIpha Brick"] = "Effects can't damage, target, or set the stats of the brick. When it's cast, obliterate the bottom card of your opponent's deck. Transform the brick into the obliterated card when an effect would target it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Summon an 800/800 AIpha Brick.\nWhen you do, Obliterate the bottom card of your opponent's deck.",
			Ability = {
				OnSummon = {
					Power = { { "SummonWithEffect", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["AIpha Brick-CP"] = {
		Id = 9925775811,
		Name = "Ptenda, the Unconquerable",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		DamageImmune = true,
		TargetImmune = true,
		SetImmune = true,
		Color = "Neutral",
		Archetype = "€ra",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Reincarnation",
			Description = " When this card is cast: Obliterate the bottom card of your opponent's deck.\nIf an effect would target this card: Transform it into a copy of the obliterated card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"EnemyBottomDeck"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "Nil", false, false }
						}
					},
					Target = "Self"
				},
				OnTarget = {
					Power = { { "Transform", "Variable" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CPM4R = {
		Id = 102507878475543,
		Name = "Dodgeball Throw",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Sorry!",
			Description = "Deal 1000 damage to existence.",
			Type = "OnSummon",
			Power = { { "Inflict", 1000 } },
			Target = "Opponent"
		},
		Bio = ""
	},
	CPM4F = {
		Id = 102507878475543,
		Name = "Dodgeball Throw",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Sorry!",
			Description = "Deal 1000 damage to existence.",
			Type = "OnSummon",
			Power = { { "Inflict", 1000 } },
			Target = "Ally"
		},
		Bio = ""
	},
	CPM5R = {
		Id = 123516088009330,
		Name = "Traumatic Overload",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach fragile.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Fragile Mod" } },
					Target = "Single"
				}
			}
		},
		Bio = ""
	},
	CPM5F = {
		Id = 123516088009330,
		Name = "Traumatic Overload",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach fragile.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Fragile Mod" } },
					Target = "All"
				}
			}
		},
		Bio = ""
	},
	CPM6 = {
		Id = 14632238633,
		Name = "Empty Office",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Addant = "Objective Fact is Detested by Pleasure",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card enters your hand: Shuffle your hand into your deck, then give yourself that many cards.",
			Ability = {
				OnDrawn = {
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
						{
							"RepeatingRandomAdd",
							{ "HasPassiveorIsFromCataclysm", "Variable" }
						}
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 0, 1, "Draws" }
				},
				OnSummon = { { "Add", "Addant" } }
			}
		},
		Bio = ""
	},
	["Objective Fact is Detested by Pleasure"] = {
		Id = 17212154356,
		Name = "Objective Fact is Detested by Pleasure",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Over the Hills of Snow",
			Description = "Look at your opponent's life. Is it better than yours?",
			Type = "OnEnd",
			Power = { { "Inflict", 500 } },
			Target = "Opponent"
		},
		Bio = ""
	},
	CPB1R = {
		Id = 109056949178066,
		Name = "The Cataclysm Accelerates",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Fading = true,
		IsCataclysmTrue = true,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Put this card into a baseplate activated.\nWhile activated, cards appear in your hand out of nowhere, and they may exist.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "The Cataclysm Activated", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPB1F = {
		Id = 109056949178066,
		Name = "The Cataclysm Accelerates",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		Fading = true,
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Put this card into a baseplate activated.\nWhile activated, cards appear in your hand out of nowhere, and they may exist.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "The Cataclysm Activated", 1 }
					} },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	CPB2 = {
		Id = 4899343999,
		Name = "Hallow's Treats",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Endless Spooks",
			Description = "If you've discarded 6 or more cards this turn, destroy all fighters.",
			Type = "OnSummon",
			Power = { { "Destroy", 30, "All" } },
			Target = "All",
			EffectRequirement = { "Playertable", "Me", 3, 9999, "DiscardCount" }
		},
		Bio = ""
	},
	CPB3 = {
		Id = 10824101716,
		Name = "Dark Side of the Moon",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Neutral",
		AttackEffect = "Slash",
		Cost = { Neutral = 1 },
		Blessing = true,
		ModifierScintillant = true,
		IsCataclysmTrue = true,
		Effect = {
			Description = "When this card enters your hand: Put a Scintillant Blessing on all even spaces in all hands.",
			Ability = {
				OnDrawn = {
					Power = {
						{
							Power = "AddHandModifier",
							Increase = "ScintillantBless",
							Target = "Ally",
							MetaData = {
								SlotTargets = { 1, 3, 5, 7, 9 }
							}
						},
						{
							Power = "AddHandModifier",
							Increase = "ScintillantBless",
							Target = "Opponent",
							MetaData = {
								SlotTargets = { 1, 3, 5, 7, 9 }
							}
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	CPB4R = {
		Id = 83409128727588,
		Name = "Stairway to Heaven",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		IsCataclysmTrue = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A player obliterates their hand and all their fighters. For each card obliterated this way, put a Colourless card in that zone that costs 3 more total studs than that card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Hand_Ally", "All", "HandCount" }
						},
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "HandRefill" }
						},
						{
							"AlterEV",
							{ "Save", "Field_Ally", "All", "FieldCount" }
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "All", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "FieldRefill" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassHandRefill = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"RandomAdd",
							"MonoOnlyorNeutralCost Neutral VariableorHigherByCostor3",
							"Ally"
						},
						{
							"AlterEV",
							{ "Load", "Hand_Ally", "All", "HandCount" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "All", "HandCount" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "HandRefill" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "BottomCard",
						Modifier = 1
					},
					NoBlip = true
				},
				OnEVCheckPassFieldRefill = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"RandomSummon",
							"MonoOnlyorNeutralCost Fighter Neutral VariableorHigherByCostor3",
							"Ally"
						},
						{
							"AlterEV",
							{ "Load", "Field_Ally", "All", "FieldCount" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "All", "FieldCount" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "FieldRefill" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "BottomCard",
						Modifier = 1
					},
					NoBlip = true
				}
			},
			EffectDeckAddToBottom = true,
			DeckAddDontUpdateCount = true
		},
		Bio = ""
	},
	CPB4F = {
		Id = 83409128727588,
		Name = "Stairway to Heaven",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Reincarnation",
			Description = "A player obliterates their hand and all their fighters. For each card obliterated this way, put a Colourless card in that zone that costs 3 more total studs than that card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Hand_Opponent", "All", "HandCount" }
						},
						{
							"AlterEV",
							{ "Set", "Hand_Opponent", "All", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "HandRefill" }
						},
						{
							"AlterEV",
							{ "Save", "Field_Opponent", "All", "FieldCount" }
						},
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "FieldRefill" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassHandRefill = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"RandomAdd",
							"MonoOnlyorNeutralCost Neutral VariableorHigherByCostor3",
							"Opponent"
						},
						{
							"AlterEV",
							{ "Load", "Hand_Ally", "All", "HandCount" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "All", "HandCount" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "HandRefill" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "BottomCard",
						Modifier = 1
					},
					NoBlip = true
				},
				OnEVCheckPassFieldRefill = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"RandomSummon",
							"MonoOnlyorNeutralCost Fighter Neutral VariableorHigherByCostor3",
							"Opponent"
						},
						{
							"AlterEV",
							{ "Load", "Field_Ally", "All", "FieldCount" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "All", "FieldCount" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "FieldRefill" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "BottomCard",
						Modifier = 1
					},
					NoBlip = true
				}
			},
			EffectDeckAddToBottom = true,
			DeckAddDontUpdateCount = true
		},
		Bio = ""
	},
	CPB5R = {
		Id = 4899466119,
		Name = "Unspeakable Summoning",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "UNSPEAKABLE",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		IsCataclysmTrue = true,
		Effect = {
			Name = "Stud",
			Description = "The fakest player drowns in inauthenticity.",
			Type = "OnSummon",
			Power = { {
				"RandomSummon",
				{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
			} },
			Target = "Ally"
		},
		Bio = ""
	},
	CPB5F = {
		Id = 4899466119,
		Name = "Unspeakable Summoning",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		IsCataclysmFalse = true,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Stud",
			Description = "The fakest player drowns in inauthenticity.",
			Type = "OnSummon",
			Power = { {
				"RandomSummon",
				{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
			} },
			Target = "Opponent"
		},
		Bio = ""
	},
	CPG2R = {
		Id = 108306470658294,
		Name = "Joker",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		IsFromCataclysm = true,
		IsCataclysmTrue = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "+4 Mult",
			Ability = {
				OnSummon = {
					Power = { { "MultiplyPower", 4, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CPG2F = {
		Id = 108306470658294,
		Name = "Joker",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Jab",
		IsFromCataclysm = true,
		IsCataclysmFalse = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		EffectAnimation = "ClownHonk",
		Effect = {
			Name = "Reincarnation",
			Description = "+4 Mult",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 4, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	CPG3 = {
		Id = 120636202029045,
		Name = "Its Masterpiece",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = { ["Louis Althusser"] = "An influential French Structural Marxist." },
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 2 cards.\nFor the rest of the game, the move from a structuralist account in which capital is understood to structure social relations in relatively homologous ways to a view of hegemony in which power relations are subject to repetition, convergence, and rearticulation begs the question of temporality into the thinking of structure, marking a shift from a form of Althusserian theory that takes structural totalities as theoretical objects to one in which the insights into the contingent possibility of structure inaugurates a renewed conception of hegemony as bound up with the contingent sites and strategies of the rearticulation of power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2 },
						{ "IntoFormsUnrecognizable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	}
}
