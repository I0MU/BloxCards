



return {
	["Marked Mod"] = {
		Id = 113098455317343,
		Name = "Marked Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Marked",
		SpecialEffectAnimation = "Mark",
		SpecialEffectant = "RemoveMark",
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter is marked while this is attached to it.",
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
				}
			}
		},
		Bio = "\"Wantin' vengeance on the Grand Overseer puts a target on yer back, 'eh?\"\n- Dekkad, the Cornered Rat"
	},
	["Overloaded Mod"] = {
		Id = 127387009268995,
		Name = "Overloaded Mod",
		AltCards = {
			["The Infection"] = {
				Id = 135914764718332,
				Name = "The Infection",
				Bio = "\"Does it have a mind? Does it produce soul? Is it truly alive?\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Overload",
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter is Overloaded while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Overload" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Overload" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"KILL! KILL! KILL! KILL! KILL! KILL! KILL! KILL!\"\n- Dekkad, the Cornered Rat"
	},
	["Fading Mod"] = {
		Id = 87998971264563,
		Name = "Fading Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Fading",
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter is Fading while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Fading" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Fading" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"The Arkhive wanted their little plaything. The evil empire got it!\"\n- Dekkad, the Cornered Rat"
	},
	["Regenerating Mod"] = {
		Id = 78121675642787,
		Name = "Regenerating Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Regen",
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter regenerates while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Regen" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Regen" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "What is the point of being healthy if you're not happy?"
	},
	["Terrified Mod"] = {
		Id = 91321653828069,
		Name = "Terrified Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Terrified",
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter is terrified while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Terrified" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Terrified" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Shame y'ain't immortal. That fear'd make a great trophy.\"\n- Dekkad, the Cornered Rat"
	},
	["Fragile Mod"] = {
		Id = 96095479867543,
		Name = "Fragile Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Archetype = "Mod",
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter takes damage from anything: Obliterate it.",
			Ability = {
				OnDamaged = {
					Power = { { "Obliterate" } },
					Target = "GearOwner"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "AllowDeadAggressorTriggers" } },
					Target = "GearOwner",
					EffectGivePassiveSlideIntoEffect = true
				}
			}
		},
		Bio = "\"What's a man? A heap'a glass to be snapped 'neath yer boot.\"\n- Dekkad, the Cornered Rat"
	},
	["Pacifist Mod"] = {
		Id = 116092055393542,
		Name = "Pacifist Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "AttackBlock",
		Archetype = "Mod",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter can't attack while this is attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "AttackBlock" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "AttackBlock" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "Ｆｉｎａｌｌｙ． Ｐｅａｃｅ ａｎｄ quiet．"
	},
	["Dextrous Mod"] = {
		Id = 120261969748717,
		Name = "Dextrous Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Dextrous",
		Archetype = "Mod",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter can attack an additional time each turn while this is attached.",
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
		Bio = "and Jab! Jab! Jab! Jab! 1, 2! GO GO GO!"
	},
	["Defender Mod"] = {
		Id = 118542229769170,
		Name = "Defender Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Shield",
		Archetype = "Mod",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOther fighters without Defender can't be attacked while this is attached.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Shield" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Shield" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "Don't let them down!"
	},
	["Decaying Mod"] = {
		Id = 118679574981628,
		Name = "Decaying Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Decaying",
		Archetype = "Mod",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter takes 200 damage during its end step while this is attached.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Decaying" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Decaying" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "<b>CURSE OF RA</b>"
	},
	["Moonward Mod"] = {
		Id = 84225103999972,
		Name = "Moonward Mod",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		GrantsPassive = "Moonward",
		Archetype = "Mod",
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nIf card effects would damage this fighter, it deals 100 damage instead.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Moonward" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Moonward" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "<b>CURSE OF RA</b>"
	},
	Exertion = {
		Id = 107099465618915,
		Name = "Exertion",
		AltCards = {
			["Exertion-MP"] = {
				Id = 72023784645079,
				Name = "Crimp in Ruin",
				AttackEffect = "Jab",
				Bio = "mb"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		UniqueGraveZone = true,
		Archetype = "Mod",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Null = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					EffectRequirement = { "SelfGear", "Self", 3, 9999, "HasGear" }
				}
			}
		},
		Bio = "\"Control what you can. Accept what you can't.\""
	},
	Wrath = {
		Id = 75071259521521,
		Name = "Wrath",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this fighter attacks: It gains 200 power until its next end step.",
			Ability = {
				OnAttack = {
					Power = { { "TempStrengthen", 200 } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "The blood coursing through you continues to boil. The roars of flame engulfs the screams of others."
	},
	Depression = {
		Id = 87526145646647,
		Name = "Sloth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: What it attacked loses 150 power until its next end step.",
			Ability = {
				OnAttack = {
					Power = { { "TempWeaken", 150 } },
					Target = "Aggressor"
				}
			}
		},
		Bio = "You know all the choices you could make, yet you also know you can't do them."
	},
	Greed = {
		Id = 106258082810529,
		Name = "Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Draw a card, except it's fleeting and inert in all zones.",
			Ability = {
				OnAttack = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			},
			EffectFleeting = true,
			EffectInert = true
		},
		Bio = "There are only three types of people:\nThose at the top,\nthose at the bottom,\nand those who fall."
	},
	Envy = {
		Id = 122158406750529,
		Name = "Envy",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Emotion",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		UniqueGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: You gain a fleeting {W}.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Neutral", 1 },
						{ "TempNeutral", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The ends justify the means. A lesson for the person after you."
	},
	Gilmuraig = {
		Id = 139644297056747,
		Name = "Gilmuraig",
		AltCards = {
			["Sealed Gilmuraig"] = {
				Id = 78591817505906,
				Name = "Sealed Gilmuraig",
				Bio = "\"You'd make a fine replacement for my wife.\"\n- Blackmoore"
			},
			["Sinning Gilmuraig"] = {
				Id = 99591942657149,
				Name = "Sinning Gilmuraig",
				Bio = "\"I THINK I DESERVE SOME ANSWERS HERE! WHY AM I HERE? WHERE'S YOUR DAD?\"\nThe Razor savoured winding up its carrier."
			},
			["Petrified Gilmuraig"] = {
				Id = 89076998267563,
				Name = "Petrified Gilmuraig",
				Bio = "\"Imagine loving someone so hard you become a statue of them. Just get another spouse!\"\n- Gyesta"
			},
			["Neonate Gilmuraig"] = {
				Id = 109845994291452,
				Name = "Neonate Gilmuraig",
				Bio = "\"SUFFER, INSIGNIFICANT MAGGOT! MARINATE IN YOUR TRAUMA!\n- Blackmoore"
			},
			["Barraging Gilmuraig"] = { Id = 3189917202, Name = "Barraging Gilmuraig" },
			["Hulking Gilmuraig"] = {
				Id = 108941466121593,
				Name = "Hulking Gilmuraig",
				Bio = "\"Man, they just want a place to live and belong! If it's a home they want, it's a home we'll give!\"\n- Jyoheil"
			},
			["Sinuate Gilmuraig"] = {
				Id = 134424649338501,
				Name = "Sinuate Gilmuraig",
				Bio = "\"WHAT DID I TELL YOU, BAKA?! YOU CAN'T HANDLE THE BURDEN OF THOSE YOU FAIL TO SAVE!\"\n- Yuni, Yellow Justice"
			},
			["Enclosed Gilmuraig"] = {
				Id = 75647091688469,
				Name = "Enclosed Gilmuraig",
				Bio = "Ｔｈａｔ＇ｓ ｒｉｇｈｔ． Ｈｉｄｅ ｉｎ ｙｏｕｒ shell．"
			},
			["Gyesta and Jyoheil"] = {
				Id = 76661211037946,
				Name = "Gyesta and Jyoheil",
				Bio = "When not compelled to be evil, Blackmoore likes to eat crumpets with his friends."
			},
			Lambfound = { Id = 96948655354896, Name = "Lambfound" },
			["Someone Familiar"] = {
				Id = 116588259921031,
				Name = "Someone Familiar",
				Bio = "I don't recall."
			}
		},
		Health = 100,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Spiral" } },
					Target = "Self"
				}
			}
		},
		Bio = "RAAAAAAAAAAGH MEN WON'T DATE ME AAAAGHGHHRRRAAH"
	},
	["The Purifier"] = {
		Id = 139942580236718,
		Name = "The Purifier",
		AltCards = {
			["Toutetsu Mianyang"] = {
				Id = 103999301501012,
				Name = "Toutetsu Mianyang",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 409,
				Bio = "The first hole’s dug for my money~.<br/>The second hole’s dug for my mercy~.<br/>The third hole’s dug for my love."
			},
			["Eggshell, King of Monored Slop"] = {
				Id = 84324948542236,
				Name = "Eggshell, King of Monored Slop",
				AttackEffect = "RedKatana",
				AltArt = true,
				PremiumArt = 466,
				Bio = "RED RAMP RED RAMP"
			},
			["The Thumb East Capo IIII, Xan"] = {
				Id = 82509571356991,
				Name = "The Thumb East Capo IIII, Xan",
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 492,
				Bio = "Y'all don't go on huntin' tigers without preparin' yerselves to get chomped 'tween one of them jaws!"
			}
		},
		Health = 1400,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "RedKatana",
		Color = "Red",
		Cost = { Red = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		SummonAnimation = "PurifierSummon",
		SummonAnimationEffect = true,
		Unstoppable = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Destroy all terrains. For each terrain destroyed this way, this card gains 1000 Power.",
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
							{ "Add", "Math", 1, "Nil" },
							"Terrains"
						},
						{ "DestroyTerrain", 30, "All" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 1000 },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The last able-bodied of the Emerald Knights of the Seventh Sanctum, Candidate 1 will stop at nothing to restore Robloxia to its former glory."
	},
	["Claymaker, Master Architect"] = {
		Id = 72888053481961,
		Name = "Claymaker, Master Architect",
		AltCards = {
			["Claymaker, Master Architect-Offer"] = {
				Id = 124940745829332,
				Name = "THE CLAYMAKER, HIS SELF PORTRAIT",
				Transformant = "Claymaker, Master Architect-OfferToken",
				ArtAnimation = "clay",
				Bio = "He either loathed the mockery that his monument became or he loathed the idea of self. The creation felt unloved."
			}
		},
		Health = 1800,
		Power = 700,
		Rarity = "Legendary",
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
	["Claymaker Invictus"] = {
		Id = 114399161510216,
		Name = "Claymaker Invictus",
		AltCards = {
			["Claymaker, Master Architect-OfferToken"] = {
				Id = 120483498187578,
				Name = "UNWANTED FAILURE",
				ArtAnimation = "Nopressure",
				Bio = "\"You have strived for perfection, gone back to the drawing board and reformulated everything countless times, there's no turning back anymore, you failed to achieve perfection and this is living proof of your ill obsession\""
			}
		},
		Health = 1200,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1, Neutral = 7 },
		EffectVariable = 0,
		Rank = 6,
		Transformant = "Claymaker Invictus",
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{
							"EVGreaterValueCheck",
							{ 0, "TransformCheck" }
						},
						Target = "Self"
					}
				}
			}
		},
		Bio = "The Purifier's betrayal was the catalyst for his desperate transformation; The kilnkin were forced to obey, forced to become one with the despairing tsar."
	},
	["Vulcanalia, Holy City"] = {
		Id = 79945238531156,
		Name = "Vulcanalia, Holy City",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 700, 400 },
		DestroyImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you discard an unranked Terrain not attached to this card: Pay its stud cost. If you do, attach a copy of it to this card as a gear.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{ "PayTargetCost" }
					},
					Target = "Aggressor",
					TurnTriggerLimit = 1,
					IsTerrain = true,
					NoBlip = true,
					Unranked = true,
					NotAttached = true
				},
				OnPayCost = {
					Power = { { "EquipGear", "Variable" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"He easily built a perfect city for the perfect workers he can't so easily create. He'd be furious if he knew we were squatting in here.\"\n- Akasegawa the Iconoclast"
	},
	Flaw = {
		Id = 72899437943554,
		Name = "Flaw",
		AltCards = {
			["Flaw-Promo"] = {
				Id = 76549067342759,
				Name = "MALICE",
				Bio = "Every last one of them."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		AddHealth = -100,
		Archetype = "Flaw",
		TriggerInGraveZone = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step, if this card and 20 others are in your graveyard: Obliterate this card.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Board", "AllyGraveZone", 20, 9999 },
					DontTriggerInField = true,
					NoBlip = true
				}
			}
		},
		Bio = "\"Call it filth, or imperfections all you wish. It is our variance that defines who we are.\"\n- Akasegawa the Iconoclast"
	},
	["The Architect's Workshop"] = {
		Id = 104697911094116,
		Name = "The Architect's Workshop",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 1000, 500 },
		Rank = 5,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Put 6 Katana cards into your graveyard, each costing 2 colours and with +0/+200 stat bonus.\nOnce each turn, whenever an allied fighter dies: Recur an allied Katana card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveAdd", "Unflinching Dawn" },
						{ "GraveAdd", "Unsetting Sun" },
						{ "GraveAdd", "Goldengrove Unleavening" },
						{ "GraveAdd", "One Thousand Tears" },
						{ "GraveAdd", "Darkest Forest" },
						{ "GraveAdd", "Setting Sun" }
					},
					Target = "Ally"
				},
				OnAllyDeath = {
					Power = { {
						"MoveZone",
						{ "Katana", "GraveZone_Ally", "Hand_Ally", true, false, 1 },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"A mere flick of these tools could cut a city block in half. Does the Claymaker truly doubt his own masterpieces?\"\n- The Purifier"
	},
	["Unflinching Dawn"] = {
		Id = 82643551671939,
		Name = "Unflinching Dawn",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Red = 1, Blue = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks:Lock a target enemy fighter for 1 turn.\nAfter this fighter attacks, if all six Katana are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = { { "Lock", 1 } },
					Target = "SingleEnemy"
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"Si vis pacem, para bellum.\"\n- The Purifier"
	},
	["Unsetting Sun"] = {
		Id = 119365653067126,
		Name = "Unsetting Sun",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Yellow = 1, Blue = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Draw a card.\nAfter this fighter attacks, if all six Katana cards are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"There is no such thing as a just war. Use overwhelming force to end one as soon as possible.\"\n- The Purifier"
	},
	["Goldengrove Unleavening"] = {
		Id = 114929291947806,
		Name = "Goldengrove Unleavening",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Yellow = 1, Green = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Summon a 100/100 Noob that's inert in play.\nAfter this fighter attacks, if all six Katana cards are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = { { "Summon", "NoobKnight" } },
					Target = "Ally",
					MetaData = { Health = 100, Power = 100 }
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"The mud stained our boots, our skin covered in sweat, dirt and blood.\"\n- The Purifier"
	},
	["One Thousand Tears"] = {
		Id = 77056974885701,
		Name = "One Thousand Tears",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Blue = 1, Green = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Recur the allied top card, except it's fading.\nAfter this fighter attacks, if all six Katana cards are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					MetaData = { Fading = true },
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"Don't you have somewhere to return to, sir? I could invite you to my sister's house.\"\nThe Purifier feigned interest. The front line had always been his home."
	},
	["Darkest Forest"] = {
		Id = 112005881377017,
		Name = "Darkest Forest",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Red = 1, Green = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: It gains 100 health and power.\nAfter this fighter attacks, if all six Katana cards are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "GearOwner"
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"They're everywhere... Our formation is broken... What do we do...? What do we do...?\"\n\"Your job,\" coldly replied The Purifier."
	},
	["Setting Sun"] = {
		Id = 111697582640621,
		Name = "Setting Sun",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Red = 1, Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Your opponent loses 400 life.\nAfter this card attacks, if all six Katana cards are attached to it: Forge them into the Epic Katana.",
			Ability = {
				OnAttack = {
					Power = { { "Inflict", 400 } },
					Target = "Opponent"
				},
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "UniqueEquippedArchetypeCount", "Katana" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "All", "GearOwner" },
						{ "EquipGear", "The Epic Katana", "GearOwner" }
					},
					Target = "Self",
					KeepSameTargets = true
				}
			}
		},
		Bio = "\"The living shall envy the dead.\"\n- The Purifier"
	},
	["The Epic Katana"] = {
		Id = 107392977531834,
		Name = "The Epic Katana",
		Health = 0,
		Power = 0,
		AddHealth = 1200,
		AddPower = 1200,
		Rarity = "Token",
		AttackEffect = "EKSlash",
		Archetype = "Katana",
		Color = "Neutral",
		Cost = { Red = 40 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card is attached to a fighter: Unlock it.\nWhenever this fighter attacks: Summon 7 fighters from other games in this server unlocked.",
			Ability = {
				OnAttack = {
					Power = {
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 },
						{ "CopyFromOtherBattle", 300 }
					},
					Target = "Ally",
					MetaData = { Unlock = 999 }
				},
				OnEquipped = {
					Power = {
						{ "Unlock", 999, "GearOwner" },
						{ "ReplaceAttackEffect", "EKSlash", "GearOwner" }
					},
					Target = "Self"
				},
				OnUnequip = {
					Power = { { "ResetAttackEffect" } },
					Target = "GearOwner",
					NoBlip = true
				}
			}
		},
		Bio = "Claymaker discarded a weapon capable of destroying reality itself because its handle was too thin. Thus a more pliant wielder was found."
	},
	["Profane Propaganda"] = {
		Id = 80554570957107,
		Name = "Profane Propaganda",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 500, 2000 },
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Reveal the oldest card in your opponent's hand. It gains fleeting.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "RevealCard" },
						{ "GivePassive", "Fleeting" }
					},
					Target = "EnemyLeftMostHand"
				}
			}
		},
		Bio = "\"The Doomspire must be cleansed utterly and completely,\" threatened the Purifier. \nClaymaker smirked, knowing exactly where to redirect his would-be killer's blade."
	},
	["Akasegawa the Iconoclast"] = {
		Id = 81429609177696,
		Name = "Akasegawa the Iconoclast",
		Health = 1000,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 4, Red = 4 },
		EffectVariable = 0,
		EquipGearAnimation = "StaticBurn",
		CustomReminder = {
			["Not a Flaw, Just Variation"] = "A Flaw is a 0/0 gear that does nothing."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Attach a +0/+0 Flaw to all allied fighters and your terrain, then all allied gears gain +0/+50 stat bonus.",
			Ability = {
				OnEnd = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw", "AllyTerrain" },
						{ "TargetAddStrengthenBonus", 50, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field", "Ally_Terrain" },
						Condition = "EquippedGears"
					},
					MetaData = { AddHealth = 0 }
				}
			}
		},
		Bio = "A traitor to the Claymaker's utopian ideals, wishing for the defective and the broken a life beyond service and failure."
	},
	["Subspace Tripmine"] = {
		Id = 135408214714585,
		Name = "Subspace Tripmine",
		Health = 0,
		Power = 0,
		AddHealth = 400,
		AddPower = 800,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 5 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this card is attached to a fighter: Shuffle 4 Colourless cards into its deck.\nAt the start of each turn: Destroy the bottom card of your deck. If it's Colourless, obliterate this fighter and all copies of it from all your zones.",
			Ability = {
				OnEquipped = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"GearOwner"
						},
						{ "RandomDeckAdd", "MonoOnlyorNeutralCost Neutral" },
						{ "RandomDeckAdd", "MonoOnlyorNeutralCost Neutral" },
						{ "RandomDeckAdd", "MonoOnlyorNeutralCost Neutral" },
						{ "RandomDeckAdd", "MonoOnlyorNeutralCost Neutral" }
					},
					Target = "EVCardOwner"
				},
				OnStart = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 5 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckPass = {
					Power = { { "Extract" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"The Noumenon's defences blow me limbs off, again and again. Sad.\"\n- Dekkad, the Cornered Rat"
	},
	["Impossible Standards"] = {
		Id = 109354720721916,
		Name = "Impossible Standards",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		Terrain = true,
		CustomReminderFlaw = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 1000, 200 },
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "1 Flaw.\nWhenever your opponent casts a fighter: Destroy a Flaw on this card. If you do, deal 450 damage to that fighter.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "AggressorCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Flaw" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", "Flaw", "Self" },
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "AggressorCard" },
							"Self"
						},
						{ "Damage", 450, "EVCard" }
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
		Bio = "Claymaker has worked himself to the bone trying to create servants worthy of his predecessor's name."
	},
	["Kilnkin Outcast"] = {
		Id = 71744772846664,
		Name = "Kilnkin Outcast",
		Health = 500,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 5 },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Select 5 gear cards in your graveyard and obliterate them. If you do, draw 2 cards and lose 1000 life.",
			Ability = {
				OnDeath = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					UniqueTargets = true,
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Gear = true },
						SelectionDescription = "up to 5 gears to ransack",
						MinTargets = 0,
						MaxTargets = 5
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "Cost", 1000 },
						{ "Draw", 2 }
					},
					Target = "Ally"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"Unfortunately, my creations take on a life of their own. Look at this filth and tell me it hasn't squandered the gift of life.\"\n- Claymaker"
	},
	["Enthralled to Creation"] = {
		Id = 114872055007649,
		Name = "Enthralled to Creation",
		AltCards = {
			["DS Mystery Gift - Red1"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 135517184514575,
				Name = "Joy of Creation",
				Bio = "To find comfort through laughter, one can simply gaze upon those who are more miserable than them."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 3 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 900, 900 },
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Attach a Flaw to this card, then select an unranked card in your hand that costs as many or fewer total studs than the number of gear attached to this card. Cast that card for free.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "EquipGear", "Flaw" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"ForceCast",
							{ "Variable" },
							"Ally"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Unranked = true, CostOrLess = "Variable" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to cast for free"
					}
				}
			}
		},
		Bio = "\"What a base creature, obsessed with pathetic echoes of past glory. Dekkad would despise what his protége has become.\"\n- Akasegawa, the Iconoclast"
	},
	["Porcelain Psychopath"] = {
		Id = 107358404948251,
		Name = "Porcelain Psychopath",
		Health = 800,
		Power = 1200,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 7 },
		EffectVariable = 0,
		Summonant = "Porcelain Psychopath",
		CustomReminderFlaw = true,
		Overload = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Attach 2 Flaws to all fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "All"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "The claymaker despises his creations for the slightest deviation in what he intends them to be. A broken clock is right twice a day."
	},
	Zarathustra = {
		Id = 88265000922541,
		Name = "Zarathustra",
		AltCards = {
			["Zarathustra-Login"] = {
				Id = 135731680570771,
				Name = "Purge Mistakes",
				Bio = "Claymaker sits in silence all night imagining what his work would be if he could truly make it perfect to his standards, clearing his mind of anything that could get in the way of his masterpiece."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Destroy your terrain. If you do, select a terrain card in your deck. Search that card.",
			Ability = {
				OnAttack = {
					Power = {
						{ "DestroyTerrain", 30, "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Target", "Deck_Ally", "Hand_Ally", false, false }
						}
					},
					Target = "Ally",
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 },
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Terrain = true },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a terrain to search"
					}
				}
			}
		},
		Bio = "\"These tools were given to me by Dekkad before he disappeared. I can't fail him. I won't fail him.\"\n- Claymaker"
	},
	["Damnatio Memoriae"] = {
		Id = 137705947523882,
		Name = "Damnatio Memoriae",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 500, 600 },
		Addant = "Moonleak-DS",
		CustomReminderMoonleak = true,
		CustomReminderNascent = true,
		StartGameRequirement = { "Deck", "Ally", 40, 9999, "ColorNeutral" },
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns, if your starting deck has only Colourless cards in it: You gain {W}. Give yourself a Moonleak and a Nascent stud.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Neutral", 1 },
						{ "Add", "Addant" },
						{ "Add", "Nascent Stud" }
					},
					Target = "Ally",
					EffectRequirement = { "StartDeckChecks" }
				}
			}
		},
		Bio = "A wasteland of the Utopia, repurposed to conceal the Claymaker's failures; He can't admit his failures are so plentiful that they can't be hidden."
	},
	["Burn Impurities"] = {
		Id = 100453438127405,
		Name = "Burn Impurities",
		AltCards = {
			["Burn Impurities-Promo"] = {
				Id = 84082074080104,
				Name = "RANCOR",
				PackDisplayOverride = "Red Knight Helmet UGC Purchase (In-Game)",
				Equippant = "Flaw-Promo",
				Bio = "The Doomspire will fall."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Equippant = "Flaw",
		Lunar = true,
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
	["Kilnkin Behemoth"] = {
		Id = 114167949028904,
		Name = "Kilnkin Behemoth",
		AltCards = {
			["Fuzzy, Fedora Dealer"] = {
				Id = 96638001769626,
				Name = "Fuzzy, Fedora Dealer",
				PremiumArt = 318,
				AltArt = true,
				Bio = "To be as dapper as me you must first remove the flaws from your current silly headwear, i can get that done with one small signature, and a small price of course."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "2 Flaws.\nWhenever a fighter dies: Destroy a gear attached to this card. If you do, it gains 100 Health and Power.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{ "Heal", 100, "Self" },
						{ "Strengthen", 100, "Self" }
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
		Bio = "\"Is being flat-footed enough cause to discard this powerhouse? Just how high are Claymaker's standards?\"\n- The Purifier"
	},
	["Kilnkin Wheeler"] = {
		Id = 97199619326274,
		Name = "Kilnkin Wheeler",
		Health = 1000,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		Charge = true,
		Overload = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "1 flaw.\nWhenever this card attacks and destroys another: Destroy a gear attached to this card. If you do, unlock it.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{ "Unlock", 9999 }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = { { "EquipGear", "Flaw" } },
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Her purpose, a steam turbine.\n\t\tHer hobby, a speed demon. "
	},
	["Unprocessed Clay"] = {
		Id = 78174475323531,
		Name = "Unprocessed Clay",
		Health = 100,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Bite",
		Color = "Red",
		Cost = { Red = 1, Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: You lose 1000 life. Search your deck for an action card, a gear card, and a terrain card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Cost", 1000 },
						{ "RandomTutorfor", "Action", "Ally" },
						{ "RandomTutorfor", "Terrain", "Ally" },
						{ "RandomTutorfor", "Gear", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"No wonder he thinks us all broken; A chef that cooks using rancid ingredients will never make a dish they like.\"\n\t\t- Akasegawa the Iconoclast"
	},
	["Impressionable Kin"] = {
		Id = 102394942562092,
		Name = "Impressionable Kin",
		AltCards = {
			["Rebellious Kin"] = {
				Id = 88741377078870,
				Name = "Rebellious Kin",
				AttackEffect = "Bat",
				AltArt = true,
				PremiumArt = 632,
				Bio = "While most of the young kin followed in the Claymaker's footsteps, others liked to be a bit freer."
			}
		},
		Health = 50,
		Power = 1000,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1, Green = 2 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: It gains 150 health for each terrain card in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Terrain", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" }
						},
						{ "Heal", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"A good citizen needs a good education.\"\n- Claymaker"
	},
	["Sycophant to Glory"] = {
		Id = 109497541683885,
		Name = "Sycophant to Glory",
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1, Yellow = 2 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if there's an allied fighter with 6 gears attached to it: Summon this card from your graveyard. If you do, attach fading to it and draw 2 cards.",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{ "Draw", 2, "Ally" },
						{ "EquipGear", "Fading Mod", "Self" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 0, 8 },
					DontTriggerInField = true
				},
				OnEnd = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					EffectRequirement = { "CardsHaveGearCount", "Ally", 1, 9999, 6 },
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"They wish to return to a golden age, as if a single great God will save them. You can't return to what never existed in the first place.\"\n- Akasegawa the Iconoclast"
	},
	["Staff of the Red Night"] = {
		Id = 80951774967761,
		Name = "Staff of the Red Night",
		AltCards = {
			["DS Mystery Gift - Red2"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 75052743015751,
				Name = "A Lawyer's Badge",
				Bio = "This is a lawyer’s badge, this proves that I’m a lawyer. It also can be shown as an evidence to fool the judge and other people."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2, Neutral = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Set your {W} to 4.",
			Ability = {
				OnAttack = {
					Power = { { "SetNeutral", 4, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"A memento of an old heroine, a saviour of her people against barbarians. How sad this world is that heroes roam it no more.\"\n- Claymaker"
	},
	["Combustion Unit"] = {
		Id = 78162235594117,
		Name = "Combustion Unit",
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Inferno",
		Color = "Neutral",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target fighter gains 200 power. Obliterate the top 3 cards of your opponent's graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 200, "Single" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "\"The polluted fires keep Imperium Ultima's editor among the most productive at the cost of his wellbeing.\"\n- Technician's Notes, Experience 189632"
	},
	["Pyretic Technician"] = {
		Id = 75169785199736,
		Name = "Pyretic Technician",
		Health = 1000,
		Power = 1000,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Neutral",
		Cost = { Red = 2, Neutral = 6 },
		EffectVariable = 0,
		Rank = 6,
		Archetype = "Technician",
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Your opponent loses {W}.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Neutral", -1 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Created by damage to reality, the Technicians have worked tirelessly for 4000 years each time a Cosmic Scab has formed."
	},
	["Kilnkin Sergeant"] = {
		Id = 119920239842222,
		Name = "Kilnkin Sergeant",
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "3 Flaws.\nWhenever you cast another fighter: Move a Flaw from this card onto it. It gains 100 Power.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "AggressorCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "SpecificEquippedGearCount", "Flaw" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{ "Strengthen", 100, "Aggressor" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "AggressorCard" },
							"Self"
						},
						{
							"RandomMoveGear",
							{ "Variable", "Flaw", true },
							"Self"
						}
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Those kilnkin lucky enough to be merely imperfect are tasked with keeping out their more broken kin back in Damnatio Memoriae."
	},
	["Isolation Border Patrol"] = {
		Id = 90413912392697,
		Name = "Isolation Border Patrol",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "1 Flaw.\nWhenever you discard a card: Destroy a gear attached to this card. If you do, deal 200 damage to a target enemy fighter.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{ "Damage", 200, "SingleEnemy" }
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
		Bio = "Hooray hated the job Claymaker built for him. It was a constant reminder of what would happen to his family if he didn't tow the party line."
	},
	["Glorious Monument"] = {
		Id = 94340297014612,
		Name = "Glorious Monument",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 600, 400 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is destroyed from play: You lose 500 life and draw 2 cards.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Cost", 500, "Ally" },
						{ "Draw", 2, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Would the leader of the revolution be happy with all the empty tokens built in his name?"
	},
	["Kilnkin Worker"] = {
		Id = 140267962987720,
		Name = "Kilnkin Worker",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a terrain: This card gains 200 power.",
			Ability = {
				OnAllyTerrainCast = {
					Power = { { "Strengthen", 200 } },
					Target = "Self"
				}
			}
		},
		Bio = "She was built to be a laser turret, but she found true meaning - and companionship - stoking the factory's forge."
	},
	["Kilnkin Outfitter"] = {
		Id = 115816857363155,
		Name = "Kilnkin Outfitter",
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		Addant = "Flaw",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 2 Flaws.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Purifier entered the underground factory expecting to slay the architect of the Doomspire's degeneracy. He wasn't expecting the architect to commission him a new suit of armour and a new mission."
	},
	["Fuse Bomb"] = {
		Id = 115845478483774,
		Name = "Fuse Bomb",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1, Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Destroy all terrains. If there was an allied terrain, deal 200 damage to all fighters.",
			Ability = {
				OnDeath = {
					Power = {
						{ "EVExactValueCheck", 0 },
						{ "DestroyTerrain", 30, "Ally" },
						{ "DestroyTerrain", 30, "Opponent" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPass = {
					Power = { { "Damage", 200, "All" } },
					Target = "Single",
					NoBlip = true,
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "A common tool in revolution and subjugation alike."
	},
	["Ghost Invisibility Elixir"] = {
		Id = 92094636397333,
		Name = "Ghost Invisibility Elixir",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1 },
		EffectVariable = 0,
		Gear = true,
		AddHealth = 200,
		AddPower = 600,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever a player discards a card: This fighter loses 200 health.",
			Ability = {
				OnAnyDiscard = {
					Power = { { "PierceDamage", 200, "GearOwner" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"An intruder? Impossible. The moon is so fiercely defended that only a ghost could get inside.\"\n- Claymaker"
	},
	["The Sacrifice"] = {
		Id = 76114891601225,
		Name = "The Sacrifice",
		AltCards = {
			["The Sacrifice-I"] = {
				Name = "The Sacrifice",
				Summonant = "Shadowbeast-I",
				Id = 119758979321428,
				AttackEffect = "Punch",
				Bio = ""
			},
			["Cherie, Floral Fin's Attendant"] = {
				Id = 128666093539640,
				Name = "Cherie, Floral Fin's Attendant",
				AttackEffect = "Jab",
				Summonant = "Shadowbeast-Flower",
				AltArt = true,
				PremiumArt = 524,
				Bio = "\"Oh, welcome in! Take your time- we're holding a sale right now, so don't be afraid to grab a bunch!\""
			},
			["ManixDash, Top Trader"] = {
				Id = 10800224642,
				AltArt = true,
				Name = "ManixDash, Top Trader",
				AttackEffect = "Rifle",
				Bio = "What'd you like? A deal to die for?"
			}
		},
		Health = 1800,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Summonant = "Shadowbeast",
		SummonAnimation = "SacrificeSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Terrain: Summon 2 300/300 Shadowbeasts that're inert in play.\nWhen this card dies: For each allied fighter that's died since this card entered play, you gain {W}{G} and give yourself a Green card.",
			Ability = {
				OnAllyDeath = {
					Power = { {
						"AlterEV",
						{ "Add", "Math", 1, "Nil" },
						"Self"
					} },
					NoBlip = true,
					Target = "Self"
				},
				OnAllyTerrainCast = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", 1 },
						{ "Green", 1 },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally",
					NoBlip = true
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Born into a lineage of maidens who slaughter themselves to stop the spire's growth, Candidate 2 would die a thousand times over to live up to her ancestor's lofty expectations."
	},
	["Deidre, Timeslayer"] = {
		Id = 90264647423645,
		Name = "Deidre, Timeslayer",
		AltCards = {
			["Deidre, Timeslayer-Offer"] = {
				Id = 140102587007503,
				Name = "Deidre, Timeslayed",
				ArtAnimation = "missoffsethell",
				Bio = ""
			}
		},
		Health = 1500,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Green = 3, Neutral = 6 },
		EffectVariable = 0,
		Archetype = "Editor",
		Continued = true,
		DestroyImmune = true,
		DamageImmune = true,
		WeakenImmune = true,
		TargetImmune = true,
		Overload = true,
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "While this card is attached to a fighter, that fighter has overload and this card's immunities.",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{ "GivePassive", "DamageImmune" },
						{ "GivePassive", "DestroyImmune" },
						{ "GivePassive", "TargetImmune" },
						{ "GivePassive", "WeakenImmune" },
						{ "GivePassive", "Overload" }
					},
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "DamageImmune" },
						{ "RemovePassive", "DestroyImmune" },
						{ "RemovePassive", "TargetImmune" },
						{ "GivePassive", "WeakenImmune" },
						{ "RemovePassive", "Overload" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Grandmother... What does it mean you've abandoned your duty? I looked up to the stories we told of you! Were they all lies?!\""
	},
	["Crisis of Faith"] = {
		Id = 92470646094113,
		Name = "Crisis of Faith",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Green = 4, Neutral = 6 },
		EffectVariable = 0,
		Fading = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select 1 effect —\n🅐 Destroy all fighters with gears attached to them.\n🅑 Destroy all fighters with no gears attached to them.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Left Behind", "ChoiceContinued" },
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
		Bio = "\"The outside world that's condemned you to die, or the inside world that wants you to live. Which one is it, girl?\"\n- Deidre"
	},
	["Left Behind"] = {
		Id = 119367590726897,
		Name = "Left Behind",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4, Neutral = 6 },
		EffectVariable = 0,
		Fading = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all fighters with gears attached to them.",
			Ability = {
				OnSummon = {
					Power = { { "Destroy" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = true
					}
				}
			}
		},
		Bio = "She could stay here, doom Robloxia. Those people could all enter the Doomspire and be with her. The line of the Feodorovnas, raised like cattle to be slaughtered could come to the same realisation that Deidre, her daughter Victoria, and her daughter Alexandra all found: That no one has to die."
	},
	ChoiceContinued = {
		Id = 85681594070661,
		Name = "Continued",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4, Neutral = 6 },
		EffectVariable = 0,
		Fading = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all fighters with no gears attached to them.",
			Ability = {
				OnSummon = {
					Power = { { "Destroy" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = "Though her son will never learn who she was and she'll be obliterated from the history books, through her death she will live forever."
	},
	["Thyyrinyr, Sealed Dragon"] = {
		Id = 110038850957325,
		Name = "Thyyrinyr, Sealed Dragon",
		AltCards = {
			["Sparesamee, SPIREDELVER"] = {
				Id = 140152009159946,
				Name = "Sparesamee, SPIREDELVER",
				AttackEffect = "MagicGreen",
				SummonAnimation = "DekkadSummon",
				SummonAnimationEffect = true,
				Bio = "<b><font color=\"#A020F0\">W O U L D  Y O U  L I K E  T O  P L A Y</font></b>",
				AltArt = true,
				PremiumArt = 304,
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Attach 6 MISERY onto it, each with -0/-300 stat bonus.\nWhenever another allied fighter is cast: Move a gear from this card onto it.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "MISERY", "Self" },
								{ "EquipGear", "MISERY", "Self" },
								{ "EquipGear", "MISERY", "Self" },
								{ "EquipGear", "MISERY", "Self" },
								{ "EquipGear", "MISERY", "Self" },
								{ "EquipGear", "MISERY", "Self" }
							},
							Target = "GearOwner"
						},
						["On|Other|AllySummon"] = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Target", "CardInstance", "Nil" },
									"Aggressor"
								},
								{
									"MoveGear",
									{ "Variable", 1, true },
									"Self"
								}
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 1800,
		Power = 1800,
		Rarity = "Epic",
		AttackEffect = "Maelstrom",
		Color = "Green",
		Cost = { Green = 6, Neutral = 2 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach 6 Ancient Plagues onto it, each with -0/-300 stat bonus.\nWhenever another allied fighter is cast: Move a gear from this card onto it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Ancient Plague", "Self" },
						{ "EquipGear", "Ancient Plague", "Self" },
						{ "EquipGear", "Ancient Plague", "Self" },
						{ "EquipGear", "Ancient Plague", "Self" },
						{ "EquipGear", "Ancient Plague", "Self" },
						{ "EquipGear", "Ancient Plague", "Self" }
					},
					Target = "GearOwner"
				},
				["On|Other|AllySummon"] = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{
							"MoveGear",
							{ "Variable", 1, true },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "An assistant of Zievonya and the ancient monks, abandoned as a humiliated plaything by Deidre, patiently biding time to climb the Stairway to Heaven once more."
	},
	["Ancient Plague"] = {
		Id = 130115613943075,
		Name = "Ancient Plague",
		AltCards = {
			MISERY = {
				Id = 113173451811311,
				Name = "MISERY",
				AttackEffect = "MagicGreen",
				Bio = "<b><font color=\"#A020F0\">Ｈ Ａ Ｔ Ｒ Ｅ Ｄ  Ｆ Ｏ Ｒ  Ｔ Ｈ Ｅ  cats  Ｗ Ｏ Ｎ ＇ Ｔ  Ｂ Ｅ  Ｅ Ｎ Ｏ Ｕ Ｇ Ｈ</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = -300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Nil = {
					Power = {
						{ "GivePassive", "Fading" },
						{
							"MoveZone",
							{ "Flaw", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						}
					},
					Target = "Self",
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"Do not become attached to your form; Being forced to be a dragon for all eternity means I cannot become anything greater.\"\n- Thyyrinyr"
	},
	["Stairway to Heaven"] = {
		Id = 83409128727588,
		Name = "Stairway to Heaven",
		AltCards = {
			["Death By Flying Table"] = {
				Name = "Death By Flying Table",
				AttackEffect = "Jab",
				Id = 127202136790119,
				AltArt = true,
				Bio = "this video is top tier you're not a true manixdash fan if you ahvent watched it"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate your hand, deck, and all allied fighters. For each card obliterated this way, put a green card in that zone that costs 3 more total studs than that card.\nDraw 2 cards.",
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
							{ "Save", "Deck_Ally", "All", "DeckCount" }
						},
						{
							"AlterEV",
							{ "Set", "Deck_Ally", "All", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "DeckRefill" }
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
						},
						{ "Draw", 2, "Ally" }
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
							"MonoOnlyorGreenCost Green VariableorHigherByCostor3",
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
				OnEVCheckPassDeckRefill = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"RandomDeckAdd",
							"MonoOnlyorGreenCost Green VariableorHigherByCostor3",
							"Ally"
						},
						{
							"AlterEV",
							{ "Load", "Hand_Ally", "All", "DeckCount" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "All", "DeckCount" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "DeckRefill" }
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "TopCard",
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
							"MonoOnlyorGreenCost Fighter Green VariableorHigherByCostor3",
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
		Bio = "\"To be eaten as a rat, cooked alive as a turtle, degraded as a circus act for a bear... And to enjoy such unfair abuse so that you would gladly relive it forever. That is the meaning of life.\"\n- Thyyrinyr"
	},
	["Wayfarer, Sacred Spear"] = {
		Id = 74292228855999,
		Name = "Wayfarer, Sacred Spear",
		AltCards = {
			["Wayfarer, Sacred Spear-Promo"] = {
				Id = 100020526384379,
				Name = "Curse of Legends Spear",
				PackDisplayOverride = "Green Sacred Spear UGC Purchase (In-Game)",
				Bio = "The explorers came for treasure and glory. They should've realized that actions have consequences."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 400,
		AddPower = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nAfter this fighter attacks: A target enemy fighter loses 100 power. Then if there's an allied terrain, destroy that terrain and that fighter.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "TargetFighter" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{ "Weaken", 100, "SingleEnemy" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "TargetFighter" },
							"Self"
						},
						{ "Destroy", 30, "EVCard" },
						{ "DestroyTerrain", 30, "Ally" }
					},
					Target = "Self",
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "\"I will never clutch my baby again, but I know he will grow up to be a good person. Faith is what carries me through this world.\"\n- The Sacrifice"
	},
	["Stairway's Ascent"] = {
		Id = 127298732840755,
		Name = "Stairway's Ascent",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6, Green = 2 },
		EffectVariable = 0,
		Terrariant = "Immortality's Fault",
		ForceTerrarianStatline = { 1500, 1500 },
		Terrain = true,
		Rank = 6,
		AddGenZoneant = "Stairway's Ascent",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target enemy fighter loses 700 power, then destroy it if it has 0 power.\nDuring your end step: You gain {W}{R}{G}{B}{Y}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 700, "SingleEnemy" },
						{
							"CheckPower",
							{ 0, 1 },
							"SingleEnemy"
						}
					},
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "With the seal on the Stairway to Heaven liberated, an entire world climbed it at once. It couldn't handle the weight."
	},
	["Domain Renovation"] = {
		Id = 71826439452011,
		Name = "Domain Renovation",
		AltCards = {
			["DS Mystery Gift - Green1"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 93193587526422,
				Name = "A.T. Studios",
				Bio = "A.T. Studios: Now AT the studios!",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give yourself 3 gears that improve your terrains.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "LightsDR" },
								{ "Add", "CameraDR" },
								{ "Add", "ActionDR" }
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Immortality's Fault",
		ForceTerrarianStatline = { 1000, 400 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 gears that improve your terrains.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Bolstered Defences" },
						{ "Add", "Sturdy Foundation" },
						{ "Add", "Glittering Garden" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Deeply mistrusting her own minions, Deidre barricaded herself away from the Consulate Plantae."
	},
	["Bolstered Defences"] = {
		Id = 80091314231314,
		Name = "Bolstered Defences",
		AltCards = {
			LightsDR = {
				Id = 90352996318903,
				Name = "Lights",
				Bio = "Lights are manned by Robat Batterson, who makes sure everything is lit!!1!1!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 6 },
		EffectVariable = 0,
		Gear = true,
		GearTarget = "Terrain",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to your terrain.\nAt the start of your turns: All allied fighters gain 100 health.",
			Ability = {
				OnAllyStart = {
					Power = { { "Heal", 100, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Let her hide in her own squalor. She's removed death for personal gain; But I will aid everyone with it.\"\n- Bronstein, Commisar of the Consulate Plantae"
	},
	["Sturdy Foundation"] = {
		Id = 118662506142359,
		Name = "Sturdy Foundation",
		AltCards = {
			CameraDR = {
				Id = 133014056015560,
				Name = "Camera",
				Bio = "On the camera, we got Catsix! He’s a bit camera shy."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Gear = true,
		GearTarget = "Terrain",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to your terrain.\nAt the start of your turns: Give yourself a Green card, except it's fleeting and inert in all zones.",
			Ability = {
				OnAllyStart = {
					Power = { { "RandomAdd", "MonoOnlyorGreenCost Green" } },
					Target = "Ally",
					MetaData = { Fleeting = true, TokenOmni = true }
				}
			}
		},
		Bio = "\"I've always dreamed of being a pretty princess with a pretty castle.\"\n- Deidre"
	},
	["Glittering Garden"] = {
		Id = 124512869257914,
		Name = "Glittering Garden",
		AltCards = {
			ActionDR = {
				Id = 76673611834883,
				Name = "Action!",
				Bio = "Lastly, directing the movie is (Ratticus Finch), who barks louder than a dog."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		EffectVariable = 0,
		Gear = true,
		GearTarget = "Terrain",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to your terrain.\nAt the start of your turns: You gain {W}{G}. ",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "Neutral", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Each flower is the lignified brain of one of Deidre's grandchildren."
	},
	Impermanence = {
		Id = 119157791615226,
		Name = "Impermanence",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Recur all allied terrain cards, except they're inert in all zones and can't be animated.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Terrain", "GraveZone_Ally", "Hand_Ally", true, false, 99 },
						"Self"
					} },
					Target = "Ally",
					MetaData = { TokenOmni = true, AnimateImmune = true }
				}
			}
		},
		Bio = "\"Climbing a stairway requires a first step; The editor is so angry with her misfortune that she has kept us all at the bottom.\"\n- Thyyrinyr"
	},
	["Survivor's Camp"] = {
		Id = 94040177897445,
		Name = "Survivor's Camp",
		AltCards = {
			["Soulforged Remnant"] = {
				Id = 84281201461748,
				Name = "Soulforged Remnant",
				Commissioner = { "uraniummuncjer", "SPARESAMEE" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 747,
				Terrariant = "Vulcan, Undying",
				Bio = "\"Although short lived, the promise of the Brimstones' campaign sent ripples far past their old factories. A more rational leader perhaps could've delivered on these frivolous dreams.\" - Fanatic logs #11"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4, Neutral = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Immortality's Fault",
		ForceTerrarianStatline = { 1250, 1250 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or at the start of your opponent's turns: Until your next end step, if an allied effect would trigger when something dies, it triggers an additional time.\n\nWhen this card is cast: It deals 250 damage to all allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeathOverdrive" },
						{ "Damage", 250, "Ally" }
					},
					Target = "Ally"
				},
				OnEnemyStart = {
					Power = { { "DeathOverdrive" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Disregard is a shelter for all Robloxia rejects, infests, and casts away.\"\n- Deidre"
	},
	["Dryad of Lifeless Soil"] = {
		Id = 99697628705355,
		Name = "Dryad of Lifeless Soil",
		Health = 650,
		Power = 650,
		Rarity = "Rare",
		AttackEffect = "VenomBite",
		Color = "Green",
		Cost = { Green = 6 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Recur an allied Colourless card, except it's fading.",
			Ability = {
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "Neutral", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Ally",
					AllowDeadAggressorTriggers = true,
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"I don't want a good life after I've suffered through the hell of this one. I want a good life NOW.\""
	},
	["Paintball Tournament Trophy"] = {
		Id = 101440152031796,
		Name = "Paintball Tournament Trophy",
		Health = 0,
		Power = 0,
		AddHealth = 150,
		AddPower = 150,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		EffectVariable = 0,
		Gear = true,
		Addant = "Paintball Tournament Trophy",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Give yourself a copy of this gear with an additional +50/+50 stat bonus.",
			Ability = {
				OnDeath = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { AddAddHealthFromOrigin = 50, AddAddPowerFromOrigin = 50 }
				}
			}
		},
		Bio = "\"I grew out of my favourite pasttime. But my scouts reporting on the games gives me a gentle tranquility.\"\n- Thyyrinyr"
	},
	["Lifeless Rebirth"] = {
		Id = 108367889570819,
		Name = "Lifeless Rebirth",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Recur 2 allied fighter cards with continued.\nFor each allied gear, summon a copy of it that's a 300/300 fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Continued_Fighter", "GraveZone_Ally", "Hand_Ally", true, false, 2 },
							"Self"
						},
						{
							"ManifestGear",
							{ 300, 300, true }
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "EquippedGears"
					},
					MetaData = { EquippedGear = nil }
				}
			}
		},
		Bio = "\"If you find the oldest being in the spire, it'll kill me. It'd kill Deidre. It'll kill everyone relying on those plants. Don't you want me to live, Alex?\"\n- Nicholas Feodorovna"
	},
	["Petrified Doctor"] = {
		Id = 98146582343121,
		Name = "Petrified Doctor",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 5 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: It deals 200 damage to all unattached fighters.",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 200 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = "\"Just because it's impossible to die here doesn't mean it doesn't hurt.\nWas I patched together with poison ivy? Sure feels like it.\"\n- Nicholas Feodorovna"
	},
	["Draconic Cultist"] = {
		Id = 95397319655095,
		Name = "Draconic Cultist",
		Health = 900,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 7 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or attached to a fighter: It gains 100 health and power for each continued card in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "HasPassiveOrContinued", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				},
				OnEquipped = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "HasPassiveOrContinued", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Deidre's outlawing of death makes it hard to stamp out the old codgers that would wish to see death return."
	},
	["Wolfsbane Warden"] = {
		Id = 124641834026211,
		Name = "Wolfsbane Warden",
		AltCards = {
			["Chunker Contracted Sinner"] = {
				Id = 78406463240953,
				Name = "Chunker - Contracted Sinner",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 613,
				Bio = "Prepare thyself! For thou shalt now pay the price for making a mockery of justice!"
			},
			["The CRiMP Club"] = {
				Id = 123377518781023,
				Name = "The CRiMP Club!",
				Commissioner = { "Deedge119" },
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 849,
				Bio = "\"Just Greenstien\""
			}
		},
		Health = 600,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4, Neutral = 1 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a gear is attached to an allied fighter: All allied fighters gain 50 power.",
			Ability = {
				OnAllyFighterEquip = {
					Power = { { "Strengthen", 50 } },
					Target = "Ally"
				}
			}
		},
		Bio = "That the fallen monasteries are so rarely intruded upon does little to calm the paranoid Consulate Plantae."
	},
	["Calathea Hunter"] = {
		Id = 131062947917118,
		Name = "Calathea Hunter",
		AltCards = {
			["Arkhivist Huntress"] = {
				Id = 97594359574633,
				Name = "Arkhivist Huntress",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 628,
				Bio = "\"Her mind degraded over time, the roots growing content in her brain. Despite that, her former self—whatever faint memories and thoughts of hers—still influence her, inquisitive of the world.\""
			}
		},
		Health = 900,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Axe",
		Color = "Green",
		Cost = { Green = 3, Blue = 3, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or discarded: Attach regenerating to a target fighter.\nDuring your end step, if there's 3 or more allied attached fighters: Recur the allied top card, except it's fading.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Regenerating Mod", "Single" } },
					Target = "Self"
				},
				OnDiscarded = {
					Power = { { "EquipGear", "Regenerating Mod", "Single" } },
					Target = "Self"
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
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					}
				},
				OnEVCheckPass = {
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
		Bio = "All people surviving in disregard are free to explore their passions; Deidre is too busy to stop the twisted ones."
	},
	["Smouldering Delonix"] = {
		Id = 138856153485984,
		Name = "Smouldering Delonix",
		Health = 1000,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Blaze",
		Color = "Green",
		Cost = { Green = 1, Red = 2, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Thrice each turn, whenever you cast a terrain: Give yourself a Red or Green terrain card and remove {W}{R}{G} from its cost.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{
							"RandomAdd",
							"MultiColOnlyorGreenCostRedCost Terrain RedorGreen",
							"Ally"
						},
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" }
						}
					},
					Target = "AlliedAddedCard",
					TurnTriggerLimit = 3
				}
			}
		},
		Bio = "\"Unable to climb the Stairway to Heaven, reduced to Deidre's servants... Even monks have their breaking point.\"\n- Thyyrinyr"
	},
	["Dragonspine Whip"] = {
		Id = 81461964755216,
		Name = "Dragonspine Whip",
		AltCards = {
			Clawtastrophe = {
				Name = "Clawtastrophe",
				AttackEffect = "Scratch",
				PlayTest = true,
				Id = 111683667825481,
				Bio = "This will be your end, I'm pawsitive of it."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 1, Yellow = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step, if there's an allied fighter with 1000 or more Power: Give yourself a Green card.",
			Ability = {
				OnEnd = {
					Power = { { "RandomAdd", "MonoOnlyorGreenCost Green" } },
					Target = "Ally",
					EffectRequirement = { "HasPower", "Ally", 1, 9999, 1000 }
				}
			}
		},
		Bio = "\"We revere the sacred spine, hoping to climb the Stairway to Heaven and attain one. She mocks the sacred spine, beating us down the stairway's steps.\"\n- Thyyrinyr"
	},
	["Shield of Zievonya"] = {
		Id = 75409914223231,
		Name = "Shield of Zievonya",
		Health = 0,
		Power = 0,
		AddHealth = 500,
		AddPower = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3, Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Animate your terrain.",
			Ability = {
				OnAttack = {
					Power = { { "AnimateTerrain", 30, "Ally", nil, nil, "LivingWorld" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Although her rage empowered Deidre to usurp Disregard's first editor, her removal of death had Zievonya's power linger."
	},
	["Abiogenesis Unit"] = {
		Id = 123673750209810,
		Name = "Abiogenesis Unit",
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Swamp",
		Color = "Neutral",
		Cost = { Green = 4 },
		EffectVariable = 0,
		CustomReminder = { Autocatalysis = "A starter is marked 🌱 in your deckbuilder." },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Search your deck for 2 starter cards.",
			Ability = {
				OnDeath = {
					Power = {
						{ "RandomTutorfor", "Starter", "Ally" },
						{ "RandomTutorfor", "Starter", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"The Grand Overseer no longer harvests this domain, saying its 'positive effect on morale' more than justifies its creative inefficiencies.\"\n- Technician's notes, experience 2274675716"
	},
	["Growth Technician"] = {
		Id = 108396241173053,
		Name = "Growth Technician",
		Health = 1500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Green = 2, Neutral = 6 },
		EffectVariable = 0,
		Rank = 6,
		Archetype = "Technician",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Give yourself a Colourless card and a Green card, except they're fleeting and inert when discarded.",
			Ability = {
				OnEnd = {
					Power = {
						{ "RandomAdd", "MonoOnlyorGreenCost Neutral" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" }
					},
					MetaData = { Fleeting = true, TokenDiscard = true },
					Target = "Ally"
				}
			}
		},
		Bio = "The engineers and antibodies of the Cosmic Scab are not good or bad; They simply exist, living and growing like the rest of us."
	},
	["Maple Collector"] = {
		Id = 134027994011753,
		Name = "Maple Collector",
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this fighter dies: You gain {G}.",
			Ability = {
				OnDeath = {
					Power = { { "Green", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"We gotta stay warm! I just hope this tinder isn't someone's remains like last time...\""
	},
	["Liana Lasher"] = {
		Id = 74674835507938,
		Name = "Liana Lasher",
		AltCards = {
			["Polluted Timbleson"] = {
				Id = 86217637261297,
				Name = "Polluted Timbleson",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 575,
				Bio = "\"Im the polluted timbleson.....🗿🗿 this is my home\""
			}
		},
		Health = 300,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 1 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent discards a card: This fighter gains 100 Power and you gain 100 Life.",
			Ability = {
				OnEnemyDiscard = {
					Power = {
						{ "Strengthen", 100 },
						{ "Cost", -100 }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "Too preoccupied with living a good life, Deidre delegates her responsibility to anyone who asks for it."
	},
	["Culture Shock"] = {
		Id = 92944511549073,
		Name = "Culture Shock",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Immortality's Fault",
		ForceTerrarianStatline = { 500, 500 },
		AddGenZoneant = "Culture Shock",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target enemy fighter loses 200 power.\nWhen this card dies: Put a copy of it into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 200 } },
					Target = "SingleEnemy"
				},
				OnDeath = {
					Power = { {
						"AddGenZone",
						{ "AddGenZoneant", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "The Sacrifice entered the doomspire expecting a torturous hellscape of violent steel and medieval blood. Instead she found a tranquil swamp."
	},
	["Bog Survivalist"] = {
		Id = 84161245825216,
		Name = "Bog Survivalist",
		AltCards = {
			EQ87 = {
				Id = 114989672039401,
				Name = "EQ87",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 517,
				Bio = "Former robot warrior-turned medic."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Regenerating = "A regenerating fighter gains 100 health during its end steps."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach regenerating to a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Regenerating Mod", "Single" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"I would have liked to meet you before I heard my Nicholas get ripped to shreds.\"\n- The Sacrifice"
	},
	Shadowbeast = {
		Id = 71312398283193,
		Name = "Shadowbeast",
		AltCards = {
			["Shadowbeast-I"] = {
				Name = "Shadowbeast",
				Id = 96379577558005,
				AttackEffect = "Punch",
				Bio = ""
			},
			["Shadowbeast-Flower"] = {
				Name = "Flowers",
				Id = 120279778997459,
				AttackEffect = "Punch",
				Bio = "Here you are! And if you need any tips for keeping it healthy, don't be afraid to ask!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "VenomBite",
		Color = "Green",
		Cost = { Green = 1 },
		EffectVariable = 0,
		Token = true,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "Summon", "Shadowbeast" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "The smell of still living meat sends the eldest of Disregard feral."
	},
	["Valerian Ranger"] = {
		Id = 133048973890677,
		Name = "Valerian Ranger",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target fighter gains 200 Health.\nWhen this fighter dies, if there's a gear on it: Search your deck for a copy of this fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Heal", 200 } },
					Target = "Single"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"GearOwner"
						},
						{ "Tutorfor", "Variable" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					EffectRequirement = { "SelfGear", "Self", 1, 9999, "HasGear" }
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "AllowDeadAggressorTriggers" } },
					Target = "GearOwner",
					EffectGivePassiveSlideIntoEffect = true
				}
			}
		},
		Bio = "Each of the 12 plant phyla jockey to infest and recruit new inhabitants, vying for power in the Consulate Plantae."
	},
	["Staff of the Woodlands"] = {
		Id = 135511690387061,
		Name = "Staff of the Woodlands",
		AltCards = {
			["DS Mystery Gift - Green2"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 18914999967,
				Name = "Staff of the Wooflands",
				Bio = "The perfect reward for completing a fetch quest."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		Gear = true,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever you cast a Terrain: Recur this card, except it's fading.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{ "GivePassive", "Fading", "Self" },
						{
							"MoveZone",
							{ "Staff of the Woodlands", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						}
					},
					Target = "Ally",
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"Just like the Paraselene Sages, this staff is a husk of its former power, barely worthy of the name.\"\n- Nicholas Feodorovna"
	},
	["Sword of The Lands"] = {
		Id = 125263422569134,
		Name = "Sword of The Lands",
		Health = 0,
		Power = 0,
		AddHealth = 800,
		AddPower = 800,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 8 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: You gain 800 life.",
			Ability = {
				OnDeath = {
					Power = { { "Cost", -800 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The sword is vampiric, able to sip the blood of the trees and stones to guide those that wield it. Everything in Disregard used to be a person, after all."
	},
	["Auteur's Easel"] = {
		Id = 95428622643289,
		Name = "Auteur's Easel",
		AltCards = {
			["DS Mystery Gift - Blue2"] = {
				Name = "Lost Diver",
				Id = 86477545693357,
				PackDisplayOverride = "Doomspire Preparation Event"
			},
			["Nyarlthotep's Easing"] = {
				Id = 74701160417985,
				Name = "Nyarlthotep's Easing",
				AttackEffect = "Jab",
				Bio = "Ｔｏ ｅｘｐｅｒｉｅｎｃｅ ｔｈｅ ｂｅａｕｔｙ ｏｆ ｔｈｅ ｗｏｒｌｄ ｂｅｙｏｎｄ， ｔｈａｔ ｉｓ ｗｈａｔ ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ ｄｅｓｉｒｅｓ ｆｒｅｅｄｏｍ ｆｏｒ．",
				PackDisplayOverride = "The Grand Overseer Raid"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		Gear = true,
		AddHealth = 200,
		AddPower = 200,
		EffectVariable = 0,
		CustomReminder = {
			["Shedarian Artistry"] = "The card types are fighter, action, terrain, and gear."
		},
		Effect = {
			Description = "Attach to a target fighter.\nWhen this fighter dies, if there's 3 or more card types in your graveyard: Draw a card.",
			Ability = {
				OnDeath = {
					Power = { { "Draw", 1, "Ally" } },
					Target = "GearOwner",
					EffectRequirement = { "UniqueCardType", "AllyGraveZone", 3, 9999, "Blegh" }
				}
			}
		},
		Bio = "\"The water should soil my canvas, yet the paint flows unabated. Curious.\"\n- The Auteur"
	},
	["Shedarian Hunter"] = {
		Id = 86514853162616,
		Name = "Shedarian Hunter",
		AltCards = {
			["Shedarian Hunter-Promo"] = {
				Id = 107075751517716,
				Name = "Fearless Hunter",
				Bio = "Fear is only for fools."
			}
		},
		Health = 300,
		Power = 500,
		Rarity = "Common",
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
	["Shedarian Triton"] = {
		Id = 137383066338373,
		Name = "Shedarian Triton",
		AltCards = {
			["Shedarian Triton-Promo"] = {
				Id = 123750095970342,
				Name = "Depth Guardian",
				Bio = "Prepare thyself."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an effect targets this card: Seek Shinies.",
			Ability = {
				OnTarget = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "As long as it's shiny, the Shedarians will wear anything."
	},
	["Cultural Exchange"] = {
		Id = 73353668311319,
		Name = "Cultural Exchange",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		Lunar = true,
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
	["Shedarian Scholar"] = {
		Id = 104300066284323,
		Name = "Shedarian Scholar",
		AltCards = {
			["Shedarian Scholar-Promo"] = { Id = 87268860924035, Name = "Shedarian Bookworm", Bio = "Bazinga!" }
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Once, when there's 5 or more gear in your graveyard: Draw a card.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Gear", "Nil" }
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "\"Yesterday, a geometric UFO soared above, its light brighter than the boilsky. Our Queen has been captivated by it ever since.\"\n- Chief Advisor Nectophore, Memoirs"
	},
	["Shedarian Tidemage"] = {
		Id = 136083127861617,
		Name = "Shedarian Tidemage",
		AltCards = {
			["Shedarian Tidemage-Promo"] = {
				Id = 95693248846742,
				Name = "Tidemage of the Seas",
				Bio = "Having a longer title totally means you're better than everyone else."
			}
		},
		Health = 700,
		Power = 150,
		Rarity = "Uncommon",
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
	["Dangerous Depths"] = {
		Id = 78731593975505,
		Name = "Dangerous Depths",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		Terrain = true,
		Terrariant = "Xenoqualia's Fault",
		ForceTerrarianStatline = { 800, 300 },
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seek Shinies.\nOnce each turn, whenever you cast a gear: A target fighter gains 100 Health.",
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
					Power = { { "Heal", "100", "Single" } },
					Target = "Opponent",
					TurnTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "Kralosa is split into five thermoclines, from the sunny Tropics to the abyssal Sunken Shedare, each depth more dangerous and corrupted than the last."
	},
	["Shinies!"] = {
		Id = 132872050861270,
		Name = "Shinies!",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 4 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if there's 5 different Shinies in your graveyard: Draw 3 cards.\nWhen you discard this card: Seek Shinies.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 3 } },
					Target = "Ally",
					EffectRequirement = { "IndividualArchetype", "AllyGraveZone", 5, 9999, "Shinies" }
				},
				OnDiscarded = {
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
		Bio = "\"I wouldn't hold the bottom-feeders in such contempt if they stopped trying to dig underneath me. It's like they want to be corrupted.\"\n- Nethercreep"
	},
	["Wonktooth, Prince Regent"] = {
		Id = 122650811572714,
		Name = "Wonktooth, Prince Regent",
		AltCards = {
			["Wonktooth, Prince Regent-Promo"] = {
				Id = 102630427030099,
				Name = "Wonktooth ",
				PackDisplayOverride = "Navy Yellow Top hat with Feathers UGC Purchase (In-Game)",
				Bio = "\"I appreciate the donation, but I'll be paying it forward! It's unbecoming of a prince to take all of the gold for himself~\""
			},
			["Avantine, Again, Again"] = {
				Id = 128971324964382,
				Name = "Avantine, Again, Again",
				Commissioner = { "Avantine" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 772,
				Bio = "I should come up with a better card name.. Naaahhhh!!"
			}
		},
		Health = 1200,
		Power = 200,
		Rarity = "Epic",
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
	["The Auteur"] = {
		Id = 109480010542790,
		Name = "The Auteur",
		AltCards = {
			["Beneath the Frees Where Nobody Sees"] = {
				Id = 107416519703564,
				Name = "Beneath the Frees Where Nobody Sees",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 418,
				Bio = "Nobody has ever been the wiser...<br/>...except for Mother Nature.<br/>Nobody ever fools her."
			},
			["The Auteur-H25"] = {
				Id = 84973300455102,
				Name = "Grand Conjurer V.",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Gravity",
				Bio = "I have many spells."
			},
			["colivical you aint the thinker bruh"] = {
				Id = 129856579413030,
				Name = "colivical you aint the thinker bruh",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "yo dj...what if I made a tribe of mango headed people called the Mangonians..."
			}
		},
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "IcePunch",
		Color = "Blue",
		Cost = { Blue = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Dextrous = true,
		SummonAnimation = "AuteurSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Give yourself a gear card and remove its cost.",
			Ability = {
				OnEnd = {
					Power = { { "RandomAdd", "Gear" } },
					Target = "Ally",
					MetaData = {
						Cost = { Neutral = 0 }
					}
				}
			}
		},
		Bio = "An elderly artist who has trained and released countless masterpieces, Candidate 3 journeys to the doomspire to create a piece that could impress even him."
	},
	["Queen Shedare II"] = {
		Id = 133031015426675,
		Name = "Queen Shedare II",
		AltCards = {
			["Queen Shedare II-Offer"] = {
				Id = 125215368286732,
				Name = "Shedare, Queen of the Sea",
				ArtAnimation = "shedaredare",
				Bio = ""
			},
			["Captain Ahab"] = {
				Id = 134712874190130,
				Name = "Captain Ahab",
				AttackEffect = "FloofyScratch",
				AltArt = true,
				PremiumArt = 416,
				Bio = "\"Do you still fail to see? They are already me! They are my harpoons. My hatred is their hatred. My vengeance is their vengeance. And my harpoons... shall not be defied!\"",
				Effect = {
					Name = "Reincarnation",
					Ability = {
						OnAttack = {
							Power = { { "EquipGear", "Spreading Obsession", "Single" } },
							MetaData = { Archetype = "Shiny" },
							Target = "Single"
						},
						OnDeath = {
							Power = { { "Steal", 30, "CustomTarget" } },
							Target = "CustomTarget",
							TargetParameters = {
								Zones = { "Enemy" },
								Condition = "HasGearSpecific",
								Modifier = "Spreading Obsession"
							}
						}
					}
				}
			}
		},
		Health = 1400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "FloofyScratch",
		Color = "Blue",
		Cost = { Neutral = 7, Blue = 3 },
		EffectVariable = 0,
		Archetype = "Editor",
		SummonAnimation = "ShedareSummon",
		ChargeRequirement = { "Color", "AllyGraveZone", 3, 999999, "Neutral" },
		Effect = {
			Name = "Reincarnation",
			Description = "This card has haste if there's 3 or more Colourless cards in your graveyard.\nWhenever this card attacks: Attach Imperial Indoctrination to a target fighter.\nWhen this card dies: Steal all fighters with Imperial Indoctrination attached to them.",
			Ability = {
				OnAttack = {
					Power = { { "EquipGear", "Imperial Indoctrination", "Single" } },
					MetaData = { Archetype = "Shiny" },
					Target = "Single"
				},
				OnDeath = {
					Power = { { "Steal", 30, "CustomTarget" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasGearSpecific",
						Modifier = "Imperial Indoctrination"
					}
				}
			}
		},
		Bio = "The overprotective mother of all Kralosa, defending her children against their will as she worships the occult god of the ocean floor."
	},
	["Imperial Indoctrination"] = {
		Id = 76080065465615,
		Name = "Imperial Indoctrination",
		AltCards = {
			["Spreading Obsession"] = {
				Id = 88241910499783,
				Name = "Spreading Obsession",
				ArtAnimation = "shedaredare",
				Bio = "\"The last of my sailors! By me! Heed my orders! Pursue them!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AddHealth = 0,
		AddPower = 0,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Null = {
					Power = { { "GivePassive", "EquipGearImmune" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Stories end once the author stops writing. O Venerable Nyarlhotep, this sacrifice beseeches you: Extend our fiction forevermore!\"\n\t\t- Sunken Dirge, canto II"
	},
	Nethercreep = {
		Id = 123851938041339,
		Name = "Nethercreep",
		Health = 4050,
		Power = 1050,
		Rarity = "Epic",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 26 },
		EffectVariable = 0,
		TriggerInHand = true,
		Shield = true,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "This card costs {W} less for each Gear in your graveyard.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "NoOverwriteSave", "Target", "NeutralCost", "BaseCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Gear", "Nil" }
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
					NoBlip = true,
					DontTriggerInField = true
				}
			}
		},
		Bio = "The eldest of Shedare's purespawn, sent to capture her people. His chivalry has him sit atop the ruined kingdom instead."
	},
	["Descend Down Kralosa"] = {
		Id = 122291337625061,
		Name = "Descend Down Kralosa",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Xenoqualia's Fault",
		ForceTerrarianStatline = { 1150, 1150 },
		Effect = {
			Name = "Reincarnation",
			Description = "Thrice each turn, whenever you cast a Colourless card: Attach a gear to this card and a target fighter gains 100 health.\nDuring your end step, if 6 gears are on this card: Destroy them all, then return all fighters to their hand. Allied returned fighters gain 300 health, haste, and overload.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{ "EquipGear", "Imperial Indoctrination", "Self" },
						{ "Heal", 100, "Single" }
					},
					Target = "Self",
					Color = "Neutral",
					TurnTriggerLimit = 3
				},
				OnEnd = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{ "Heal", 300, "Ally" },
						{ "GivePassive", "Charge", "Ally" },
						{ "GivePassive", "Overload", "Ally" },
						{ "Return", 30, "All" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "TotalCostOrLess",
						Modifier = "Variable"
					},
					EffectRequirement = { "SelfGear", "HasGear", 6, 9999, "HasGear" }
				}
			}
		},
		Bio = "\"Art and the oceanic depths are cousins; People develop fears of what they don't understand, of what they don't deserve to understand. Just remember that's no gaps in my artistic prowess, only gaps in your perception.\"\n- The Auteur"
	},
	["Nethercreep's Bulwark"] = {
		Id = 113723629650373,
		Name = "Nethercreep's Bulwark",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Xenoqualia's Fault",
		ForceTerrarianStatline = { 1500, 400 },
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Apply the corresponding effects based on the number card types you've cast this turn.\n1+ - You gain 300 life.\n2+ - All allied fighters gain 100 health.\n3+ - Draw a card.\n4 - Destroy the bottom 10 cards of your opponent's deck.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "CastAction", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastGear", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastTerrain", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastFighter", "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "LifeGain" }
						},
						{
							"EVGreaterValueCheck",
							{ 1, "Heal" }
						},
						{
							"EVGreaterValueCheck",
							{ 2, "Draw" }
						},
						{
							"EVGreaterValueCheck",
							{ 3, "Destroy" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassLifeGain = {
					Power = { { "Cost", -300 } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassHeal = {
					Power = { { "Heal", 100 } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassDraw = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassDestroy = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "\"A country lives atop of me. Its destruction lives below. What use is your art if no one is around to appreciate it?\"\n- Nethercreep, to the Auteur"
	},
	["Approach the Skybox"] = {
		Id = 93246563018014,
		Name = "Approach the Skybox",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw a card.\nRemove {W}{W} from all cards in your hand that cost 6 or more total studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1 },
						{
							"IncreaseCost",
							{ -2, "Neutral", "Nil" },
							"CustomTarget"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "TotalCostOrMore",
						Modifier = 6
					}
				}
			}
		},
		Bio = "\"We'll never find our Queen's comet again if we can't find a way to withstand the boilsky's heat. It almost certainly came from above the lava...\"\n- Chief Advisor Nectophore, Memoirs"
	},
	["Avant Guardian"] = {
		Id = 105568935157423,
		Name = "Avant Guardian",
		AltCards = {
			["Do Frees Dream"] = {
				Id = 80479882600277,
				Name = "Do Frees Dream of Magic Polar Bears?",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 424,
				Bio = "why would he dream for this<br/>is he stupid"
			},
			["Gaunt Antiguardian"] = {
				Id = 87089572275686,
				Name = "Gaunt Antiguardian",
				AttackEffect = "MagicBlue",
				Bio = "Ｗｈｅｒｅｖｅｒ ｔｈｅ Rat ｈｉｄｅｓ， ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ ｗｉｌｌ ｂｅ ｗａｉｔｉｎｇ．",
				PackDisplayOverride = "The Grand Overseer Raid"
			},
			["You don't know."] = {
				Id = 101110437173900,
				Name = "You don't know.",
				ArtAnimation = "You don't know",
				AltArt = true,
				PremiumArt = 802,
				AttackEffect = "MagicBlue",
				Bio = "\"But I hope happiness comes to you\""
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 5 },
		EffectVariable = 0,
		CustomReminder = {
			Verfremdungseffekt = "This card will have the triggered abilities of the card attached to it, but not its passives."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Summon a fighter, except it's attached to this card as a +0/+0 gear.",
			Ability = {
				OnEnd = {
					Power = { { "RandomEquipGear", "Fighter", "Self" } },
					Target = "Self",
					MetaData = { Gear = true }
				}
			}
		},
		Bio = "\"Mantises see the direction of light. Dolphins hear radar. Meeboids see four-dimensional space. The more you release yourself from your biological shackles and experience foreign qualia, the more powerful your art becomes.\n- The Auteur\""
	},
	["Into Forms Unrecognisable"] = {
		Id = 115506647821241,
		Name = "Into Forms Unrecognisable",
		AltCards = {
			["The Duke's Manor"] = {
				Id = 101443307724577,
				Name = "The Duke's Manor",
				Commissioner = { "NotMyNameHasReturned" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 748,
				Terrariant = "To The Depths Yet Again",
				Bio = "\"So you're the one running about tripping my alarms, hm? Care to explain yourself?\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrain = true,
		Cost = { Neutral = 8 },
		EffectVariable = 0,
		ForceTerrarianStatline = { 2000, 1000 },
		Terrariant = "Xenoqualia's Fault",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you discard a card: You lose all {R}{G}{B}{Y}, then gain that much {W}.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColorRed", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorBlue", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorYellow", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorGreen", "Nil" },
							"Self"
						},
						{ "SetBlue", 0 },
						{ "SetRed", 0 },
						{ "SetGreen", 0 },
						{ "SetYellow", 0 },
						{ "Neutral", "Variable" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "After centuries of her broken brain struggling to process the Xenoqualia, Queen Shedare passed the burden onto an invader worthy of her madness."
	},
	["His Masterpiece"] = {
		Id = 120636202029045,
		Name = "His Masterpiece",
		AltCards = {
			pikucho = {
				Id = 101375979081755,
				Name = "pikucho",
				PremiumArt = 308,
				AltArt = true,
				Bio = "#fan-card-dump"
			},
			["His Masterpiece-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 71917870477887,
				Bio = ""
			}
		},
		Health = 1600,
		Power = 1600,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5, Yellow = 3, Red = 2, Green = 1 },
		EffectVariable = 0,
		Archetype = "Technician",
		Rank = 6,
		CustomReminder = {
			Capitalism = "A system of economics where the tools to produce goods are controlled by individual people for private interests."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Draw 2 cards and shuffle the stats of all fighters. For the rest of the game, the subject is interpolated into a postdeconstructivist capitalism that includes art as a reality. ",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2 },
						{ "IntoFormsUnrecognizable" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "DirectCardInstance", "Nil" },
							"CustomTarget"
						},
						{ "ExchangeHealth", "Variable", "CustomTarget" },
						{ "ExchangePower", "Variable", "CustomTarget" }
					},
					Target = "Ally",
					UniqueTargets = true,
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = { "RandomCard", "HasntPassive" },
						Modifier = { RandomCard = 1, HasntPassive = "SetImmune" },
						SubModifier = true
					}
				}
			}
		},
		Bio = ""
	},
	["Soul Harness"] = {
		Id = 125340921426421,
		Name = "Soul Harness",
		AltCards = {
			["DS Mystery Gift - Blue1"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 110938787284665,
				Name = "Soul Ritual",
				Addant = "Her Masterpiece",
				Bio = "Shedare oh Shedare.<br/>Her gaze so kind, her grasp so soft.<br/>Her gentleness shown as I was held aloft.<br/>But something shifted, I start to plea.<br/>Shedare oh Shedare.<br/>What have you done to me."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		EffectVariable = 0,
		Lunar = true,
		Addant = "His Radiance",
		Effect = {
			Description = "Set the power of a target fighter to 400.\nIf it lost power, give yourself a gear with +X/+X stat bonus. X is the power lost this way.",
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
							{ "Set", "Target", "Power", "Nil" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 400, "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "Nil", "SavedPower" }
						},
						{ "SetPower", 400 },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Single"
				},
				OnEVCheckPass = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally",
					MetaData = {
						AddHealth = "SavedVariable_SavedPower",
						AddPower = "SavedVariable_SavedPower"
					}
				}
			}
		},
		Bio = "Each of her ignorant spawn contains a fragment of the Truth. The Truth needed to summon Him once more."
	},
	["His Radiance"] = {
		Id = 71859956753540,
		Name = "His Radiance",
		AltCards = {
			["Her Masterpiece"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 110586704863396,
				Name = "Her Masterpiece",
				Bio = "I can't believe it, it is frozen.<br/>It's not the first time, I had noticed.<br/>She will deliver, I am floating.<br/>Trust in the river."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Nil = {
					Power = {
						{ "Damage", 50 },
						{ "Weaken", 50 }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "She sank an empire to feel His warmth once. She'll sink a world to feel it again."
	},
	["Fool's Gold"] = {
		Id = 137266369526852,
		Name = "Fool's Gold",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "Return a target fighter that costs 4 or fewer total studs to its hand.\nSeek Shinies.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return", 9999, "Single" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Ally"
				}
			},
			AmountOfTargets = 2,
			HideAdd = true,
			EffectReturnStudCap = 4
		},
		Bio = "With her eldest son sitting on the entrance to Sunken Shedare, its fallen queen discarded her crown jewels in hopes of enticing her subjects back into her monarchy. Not all that glitters is gold."
	},
	Goreswimmer = {
		Id = 112287644630267,
		Name = "Goreswimmer",
		AltCards = {
			AstarShinie = {
				Id = 89852018973046,
				Name = "AstarShinie",
				Commissioner = { "jasp1108" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 766,
				Bio = "\"Once he saw the ruins of Justice City and took in what little ideas he could find that shined in his mind, he started to change, adopting new clothes and new ideas. He was setting up with other people. Shedarians that think like him and soon, he will have the power to be along with the Prince and Queen\""
			}
		},
		Health = 950,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 1, Red = 2 },
		EffectVariable = 0,
		Stealth = true,
		CustomReminder = {
			["Treasonous Blood"] = "Whenever an enemy fighter dies, Blood gives its wielder 50 health and power."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a card: Attach 'Blood' to this card. This triggers only once per card type.",
			Ability = {
				OnAllyCast = {
					Power = { { "EquipGear", "BloodToken", "Self" } },
					TotalTriggerLimit = 1
				},
				OnAllyCastGear = {
					Power = { { "EquipGear", "BloodToken", "Self" } },
					TotalTriggerLimit = 1
				},
				OnAllyTerrainCast = {
					Power = { { "EquipGear", "BloodToken", "Self" } },
					TotalTriggerLimit = 1
				},
				OnAllySummon = {
					Power = { { "EquipGear", "BloodToken", "Self" } },
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Shedare's old servants are so easily distracted by all that pretend to flicker and sparkle."
	},
	BloodToken = {
		Id = 96419330566020,
		Name = "Fresh Meat",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2, Blue = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever an enemy fighter dies: This fighter gains 50 health and power.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{ "Heal", 50 },
						{ "Strengthen", 50 }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "The giblets still contain a fragment of the coveted Noumenon."
	},
	["Prince's Treaty"] = {
		Id = 70871113874305,
		Name = "Prince's Treaty",
		AltCards = {
			["Prince's Treaty-Promo"] = {
				Id = 105208336375499,
				Name = "Wonktooth's Shadow",
				PackDisplayOverride = "Bubbly Bowtie UGC Purchase (In-Game)",
				Bio = "A constant reminder of his twisted mother's pleas for his return."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach regenerating to a target fighter.\nThen if there's 3 or more allied attached fighters, draw 2 cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Regenerating Mod", "Single" },
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					}
				},
				OnEVCheckPass = {
					Power = { { "Draw", 2, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"By all means, try and sort me ma out! I don't have to worry about your descent turning you insane; You clearly already are!\"\n\t\t- His Illuminance Wonktooth, to the Auteur"
	},
	["Nethercreep Partygoer"] = {
		Id = 111240226840370,
		Name = "Nethercreep Partygoer",
		Health = 800,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Microphone",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an effect targets this card: You gain {W}.",
			Ability = {
				OnTarget = {
					Power = { { "Neutral", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"These fish are utterly unaware of Robloxia. So tell me, for the love of Shed above: On what grounds are they aware of the discothèque revolution of the 450s? What fiend exposed their innocent peabrains to such mawkish ditties? I feel intense, wonderful dread at having to apply a suspension of disbelief to reality itself.\nSo what is reality?\"\n- The Auteur"
	},
	["Psychic Ward"] = {
		Id = 118162904561634,
		Name = "Psychic Ward",
		AltCards = {
			["Psychic Ward-Promo"] = {
				Id = 81710050061494,
				Name = "Psy-Chic Drip",
				PackDisplayOverride = "Teal hair with antennas UGC Purchase (In-Game)",
				Bio = "WHAT COLOR IS YOUR PSYCHIC WARD"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AddHealth = 100,
		AddPower = 0,
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nGear can't be attached to this fighter while this card's attached to it.\nWhen this card is cast: Draw a card.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "EquipGearImmune" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "EquipGearImmune" } },
					Target = "GearOwner"
				},
				OnSummon = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"I see why His Illuminance handed me this trinket now; Anyone without my training would've succumbed to her mind control. Your mother will be my magnum opus, Wonktooth.\"\n- The Auteur"
	},
	["Oxygenation Unit"] = {
		Id = 91199710761197,
		Name = "Oxygenation Unit",
		AltCards = {
			["Oxygenation Unit-H25"] = {
				Id = 79511570296537,
				Name = "Aether Chamber",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "\"What freedom waits for you? A few dying ships in a sea of dead stars?\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Neutral",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target enemy fighter loses 300 power until its next end step.",
			Ability = {
				OnSummon = {
					Power = { { "TempWeaken", 300 } },
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "\"A sky of lava, a sea of air... Such creativity is perfect for the Cosmic Scab's healing.\"\n- Technician's Notes, Experience 642780544"
	},
	["Thalassic Technician"] = {
		Id = 138364563904680,
		Name = "Thalassic Technician",
		Health = 1400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 6, Blue = 2 },
		EffectVariable = 0,
		Archetype = "Technician",
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you discard a card: A target fighter loses 300 power until its next end step.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "TempWeaken", 300 } },
					Target = "Single",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Ｗａｌｋ ｔｈｅ path Ｉ ｄｉｄ． Ｓｅｅ ｗｈｙ ｍｙ ｂｅｔｒａｙａｌ ｉｓ ｉｎ ｔｒｕｔｈ liberation．"
	},
	["Regent's Guard"] = {
		Id = 101840735908276,
		Name = "Regent's Guard",
		Health = 1200,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 5 },
		EffectVariable = 0,
		Overload = true,
		CustomReminder = {
			["Steely Gaze"] = "The fighter this is attached to can't attack. Whenever you cast a gear, destroy all Steely Gaze on this fighter."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or during your end step: Attach Steely Gaze to this card.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Steely Gaze", "Self" } },
					Target = "Single"
				},
				OnEnd = {
					Power = { { "EquipGear", "Steely Gaze", "Self" } },
					Target = "Single"
				}
			}
		},
		Bio = "The guards protect His Illuminance from the common riffraff's stupid thoughts, and protect the common riffraff from His Illuminance's intrusive ones."
	},
	["Steely Gaze"] = {
		Id = 130563941091766,
		Name = "Steely Gaze",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Gear = true,
		Cost = { Blue = 3, Neutral = 3 },
		EffectVariable = 0,
		Archetype = "Sussy",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target figther.\nThat fighter can't attack while this is attached to it.\nWhenever you cast a gear: Destroy all Steely Gaze on this fighter.",
			Ability = {
				OnAllyCastGear = {
					Power = { { "DestroyGear", "Sussy", "GearOwner" } },
					Target = "Single"
				},
				OnEquippedAlways = {
					Power = { { "GivePassive", "AttackBlock" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "AttackBlock" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Don't let your guard down for one second, dude. I would rather be dead than turned back to her.\"\n\t\t- His Illuminance Wonktooth"
	},
	["Pious Adherent"] = {
		Id = 123798728500516,
		AltCards = {
			["Pious Adherent-Mango"] = {
				Name = "Astrobleme Titan",
				Id = 108174299573356,
				AttackEffect = "Claw",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "A celestial fragment of what once was a thriving star, now degraded to a mere lifeless statue."
			}
		},
		Name = "Pious Adherent",
		Health = 1150,
		Power = 1150,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Blue = 8, Neutral = 4 },
		EffectVariable = 0,
		Rank = 6,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Shuffle your hand into your deck, then draw 3 cards.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Deck_Ally", true, false, 10 },
							"Self"
						},
						{ "Draw", 3 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "A few halfspawn willingly bask in the light of their fallen queen, their forms warping under her brilliant truth."
	},
	["Sharp Shark Sword"] = {
		Id = 139590355755745,
		Name = "Sharp Shark Sword",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step: For each card type you've cast this turn. This gear gains +50/+50 stat bonus.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "CastAction", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastGear", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastTerrain", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastFighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" }
						},
						{ "TargetAddStrengthenBonus", "Variable", "Self" },
						{ "TargetAddHealthBonus", "Variable", "Self" }
					},
					Target = "Self",
					NoGearTargetMod = true
				}
			}
		},
		Bio = "\"It's real strong, dude. You should use it,\" ordered Wonktooth.\n\"But it's not shiny!\" Cried the guard, much to the prince's frustration."
	},
	["The Tainted"] = {
		Id = 112299398568032,
		Name = "The Tainted",
		AltCards = {
			["Leepy 2"] = {
				Id = 93767679927797,
				Name = "Leepy 2",
				PremiumArt = 339,
				AltArt = true,
				Bio = "Die."
			},
			["The Tainted-H25"] = {
				Name = "The Tainted",
				Id = 114262535045076,
				AttackEffect = "Punch",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Bio = "\"For the record, this stupid costume was their idea\" - Dmitri Shostakovich"
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Yellow = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		TargetImmune = true,
		SummonAnimation = "TaintedSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "If a fighter or action would target this card: Suspend it until the next end step. Each player shuffles their hand into their deck, then draws 6 cards.",
			Ability = {
				OnActionTarget = {
					Power = {
						{ "RandomDiscard", 10, "Ally" },
						{ "RandomDiscard", 10, "Opponent" },
						{ "Draw", 6, "All" },
						{ "Suspend" }
					},
					Target = "Self"
				},
				OnFighterTarget = {
					Power = {
						{ "RandomDiscard", 10, "Ally" },
						{ "RandomDiscard", 10, "Opponent" },
						{ "Draw", 6, "All" },
						{ "Suspend" }
					},
					Target = "Self"
				}
			},
			EffectRandomDiscardShuffle = true
		},
		Bio = "Transformed into a murderous monster by an orphaned fragment of the Cosmic Scab, Candidate 4's desire for revenge compel him to return that scar to its rightful father."
	},
	["The Tainted-QA"] = {
		Id = 112299398568032,
		Name = "The Tainted - QA Variant",
		PlayTest = true,
		Health = 800,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Yellow = 9 },
		EffectVariable = 0,
		Archetype = "Candidate",
		SummonAnimation = "TaintedSummon",
		SummonAnimationEffect = true,
		CustomReminderRecur = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an enemy effect targets this card: Suspend this card.\nOnce each turn, whenever an allied effect targets this card: For each time an allied effect has targeted this turn, recur an allied card. Remove its cost and it's fading.",
			Ability = {
				OnAllyTarget = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "TargetCount", "Nil" },
							"Self"
						},
						{ "EnterEVLoop" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				},
				OnEVLoop = {
					Power = { {
						"MoveZone",
						{ "Any", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = {
						AddCost = { Neutral = 0 },
						Fading = true
					},
					NoBlip = true
				}
			}
		},
		Bio = "Transformed into a murderous monster by an orphaned fragment of the Cosmic Scab, Candidate 4's desire for revenge compel him to return that scar to its rightful father."
	},
	["Warriors of Justice"] = {
		Id = 127524739987881,
		Name = "Warriors of Justice",
		AltCards = {
			["Warriors of Justice-Offer"] = {
				Id = 101335011381368,
				Name = "Champions of Justice",
				Summonant = "Warriors of Justice-Offer",
				ArtAnimation = "ChampionsOfJustice",
				Bio = "\"No matter what happens... we'll do everything we can to save you TOGETHER!!\""
			},
			["Iamnot0p, Identity Crisis"] = {
				Id = 131978001849749,
				Name = "Iamnot0p, Identity Crisis",
				Commissioner = { "Iamnot0p" },
				AttackEffect = "Axe",
				SummonAnimation = "DreadPriest",
				AltArt = true,
				PremiumArt = 762,
				Summonant = "Iamnot0p, Personalities Split",
				Bio = "im in control now. But for how long?"
			},
			["Iamnot0p, Personalities Split"] = {
				Id = 81205016042115,
				Name = "Iamnot0p, Personalities Split",
				AttackEffect = "JohnAttack",
				Summonant = "Iamnot0p, Personalities Split",
				Bio = "<b><font color=\"#FFFF00\">Now I rule over you</font></b><br/><b><font color=\"#FF0000\">Thats WE not just you ya noob</font></b><br/><b><font color=\"#0000FF\">Will you all be quiet for once?</font></b><br/><b><font color=\"#008000\">I agree. For this I need concentration.</font></b>"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Katana",
		Color = "Yellow",
		Cost = { Neutral = 12, Yellow = 3 },
		EffectVariable = 0,
		Archetype = "Editor",
		Summonant = "Warriors of Justice",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Summon 5 copies of it unlocked. Attach fading to them, then they all spiral.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "EquipGear", "Fading Mod", "SummonedCard" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "EquipGear", "Fading Mod", "SummonedCard" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "EquipGear", "Fading Mod", "SummonedCard" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "EquipGear", "Fading Mod", "SummonedCard" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Summon", "Summonant", "Ally" },
						{ "EquipGear", "Fading Mod", "SummonedCard" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Self",
					MetaData = { Unlock = 999 },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Ｒｏｌｅｐｌａｙｉｎｇ ｗｉｔｈ corpses ｗｏｎ＇ｔ ｂｒｉｎｇ ｔｈｅｍ ｂａｃｋ．"
	},
	["Transcendental Hug"] = {
		Id = 95938775415202,
		Name = "Transcendental Hug",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
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
	["Nyarlhotep's Razor"] = {
		Id = 135991824880916,
		Name = "Nyarlhotep's Razor",
		AltCards = {
			["Nyarlhotep's Razor-Login"] = {
				Id = 103433733132503,
				Name = "Nyarlhotep's Dagger",
				Bio = "\"Peer into the eyes inside the world of truth. See the lies within yours and manipulate them to your will. If only you can handle the truth.\"<br/>--??? ???????"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Reveal the top card of each players' deck. Choose to have all players draw their card or destroy their card.",
			Ability = {
				OnAttack = {
					Power = {
						{ "RevealTopDeck", 30, "Opponent" },
						{ "RevealTopDeck", 30, "Ally" },
						{
							"ConfirmPrompt",
							{ "If the top card of each player's deck should be drawn" },
							"Ally"
						}
					},
					Target = "Self"
				},
				OnConfirm = {
					Power = { { "Draw", 1 } },
					Target = "All"
				},
				OnDeny = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"The blade is barely visible; Its sheen is a mirror through which the world is peeled back and seen as it truly is. Shame it also made me hideous!\"\n- The Tainted"
	},
	["Gattai!"] = {
		Id = 137307001955135,
		Name = "Gattai!",
		AltCards = {
			["Gattai!-Promo"] = {
				Id = 106836910859608,
				Name = "Sunshine of the Warriors",
				PackDisplayOverride = "White Helmet of Justice UGC Purchase (In-Game)",
				Bio = "For the Justice City!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 3 },
		EffectVariable = 0,
		Equippant = "Mask of Sorrows",
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate a target allied fighter.\nSelect an unranked fighter card in your deck that costs 2 more total studs than that card and summon it.\nWhen that fighter dies, summon the obliterated card as a 500/500 fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "OblitFighter" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Name", "FighterName" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Add", "Math", 2, "Nil" },
							"Self"
						},
						{ "Obliterate", 30, "SingleAlly" },
						{
							"EVGreaterValueCheck",
							{ 0, "SummonCard" }
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassSummonCard = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Field_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "ApplyMask" }
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true, CostExact = "Variable", Unranked = true },
						SelectionDescription = "a fighter from your deck to summon",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnEVCheckPassApplyMask = {
					Power = { { "EquipGear", "Equippant", "SummonedCard" } },
					Target = "Self",
					MetaData = {
						EffectVariable = "SavedVariable_FighterName",
						Summonant = "SavedVariable_OblitFighter"
					},
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "\"The last time they did their ultimate combination was when my wife tried her hand at world domination! You must've kicked her into such beautiful despair!\" \n- Blackmoore"
	},
	["Mask of Sorrows"] = {
		Id = 75858085845323,
		Name = "Mask of Sorrows",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		ReplaceDescriptionant = "Attach to a target fighter.\nWhen this fighter dies: Summon the obliterated card as a 500/500 fighter (Variable).",
		Summonant = "Maladeity's Pustule",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Summon the obliterated card.",
			Ability = {
				OnDeath = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally",
					AllowDeadAggressorTriggers = true,
					MetaData = { Health = 500, Power = 500 }
				},
				OnEquippedAlways = {
					Power = { { "ReplaceDescription", "ReplaceDescriptionant" } },
					Target = "Self",
					NoGearTargetMod = true
				}
			}
		},
		Bio = "Winona spent decades playing, running away from a life she couldn't bear to confront."
	},
	["Blackmoore, Invented Evil"] = {
		Id = 72010823810320,
		Name = "Blackmoore, Invented Evil",
		AltCards = {
			["CAD946, Valor Rewritten"] = {
				Id = 96879054596777,
				Name = "CAD946, Valor Rewritten",
				AttackEffect = "Firebrand",
				AltArt = true,
				Bio = "He defined courage, now hiding behind it."
			}
		},
		Health = 1050,
		Power = 450,
		Rarity = "Epic",
		AttackEffect = "HollowScythe",
		Spiralant = "Gyesta and Jyoheil",
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 5 },
		EffectVariable = 0,
		SummonAnimation = "BlackmooreSummon",
		SummonAnimationEffect = true,
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: All fighters spiral twice.\nWhenever an allied fighter spirals into a Gilmuraig: Summon a copy of that fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Spiral" },
						{ "Spiral" }
					},
					Target = "All"
				},
				OnAllySpiralTransform = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "Summon", "Variable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"If this world is created, why did its god choose to create a source of all evil?\"\n- The Tainted"
	},
	["Great Justice City"] = {
		Id = 77240188837881,
		Name = "Great Justice City",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Empathy's Fault",
		ForceTerrarianStatline = { 100, 1000 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter dies: Move all gear that were originally gear from it onto this card, except they're effectless while attached to this.\nWhenever you cast an allied fighter, if there's 6 gear that were originally gear on this card: Move all of them onto that fighter, then destroy this card.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{
							"MoveGear",
							{ "Variable", "All" },
							"Self"
						}
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
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
					}
				},
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Self"
						},
						{
							"MoveGear",
							{ "Variable", "All" },
							"Aggressor"
						},
						{ "DestroyGear", "Great Justice City", "Self" },
						{ "Destroy", 30, "Self" }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					EffectRequirement = { "SelfGear", "HasGear", 6, 9999, "HasGear" }
				}
			},
			OnlyOriginalGears = true
		},
		Bio = "The editor realised the truth of herself, of the world she built. The world collapsed as she decided to face her problems head on."
	},
	["Traumatic Overload"] = {
		Id = 123516088009330,
		Name = "Traumatic Overload",
		AltCards = {
			["DS Mystery Gift - Yellow1"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 82572783813172,
				Name = "City Ruins",
				Terrariant = "Burnt Photograph",
				Bio = "The once-bustling streets now only carry the sound of the wind."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Empathy's Fault",
		Rank = 6,
		CustomReminder = {
			["The Psyche Shatters"] = "When a fragile fighter takes damage from anything, obliterate it."
		},
		ForceTerrarianStatline = { 1500, 950 },
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Summon a fighter card from your opponent's graveyard that's died this game, then your opponent does the same with your graveyard. Unlock those fighters and attached fragile and terrified to them.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_HasDied", "GraveZone_Opponent", "Field_Ally", true, false },
							"Self"
						},
						{ "Unlock", 999, "SummonedCard" },
						{ "EquipGear", "Fragile Mod", "SummonedCard" },
						{ "EquipGear", "Terrified Mod", "SummonedCard" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_HasDied", "GraveZone_Ally", "Field_Opponent", true, false },
							"Self"
						},
						{ "Unlock", 999, "SummonedCard" },
						{ "EquipGear", "Fragile Mod", "SummonedCard" },
						{ "EquipGear", "Terrified Mod", "SummonedCard" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "She relived all the horror. The fires. The death of her friends in front of her eyes. The Tainted's insults put her through that hell she hopes never truly happened."
	},
	["Legitimate Salesmen"] = {
		Id = 118660918937411,
		Name = "\"Legitimate\" Salesmen",
		AltCards = {
			["Grafyt, Rate Up"] = {
				Id = 113860314017037,
				Name = "Grafyt, End of Service",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Attach a gear with +100/+100 stat bonus to 3 target fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "Justice Merchandise-Graf", "Single" },
								{ "EquipGear", "Justice Merchandise-Graf", "Single" },
								{ "EquipGear", "Justice Merchandise-Graf", "Single" }
							},
							UniqueTargets = true,
							Target = "Self"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 464,
				Bio = "\"Nothign is worse in this world than capitalist scum.\""
			},
			["Coalfaire, Big Shot Salesman"] = {
				Id = 100867622220057,
				Name = "Coalfaire, Big Shot Salesman",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Attach a gear with +100/+100 stat bonus to 3 target fighters.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "Justice Merchandise-Brick", "Single" },
								{ "EquipGear", "Justice Merchandise-Brick", "Single" },
								{ "EquipGear", "Justice Merchandise-Brick", "Single" }
							},
							UniqueTargets = true,
							Target = "Self"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"GET YOUR VERY OWN, ONE OF A KIND, BRICKBATTLERSORCERER PLUSHIE TODAY!\""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach a gear with +100/+100 stat bonus to 3 target fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Justice Merchandise", "Single" },
						{ "EquipGear", "Justice Merchandise", "Single" },
						{ "EquipGear", "Justice Merchandise", "Single" }
					},
					UniqueTargets = true,
					Target = "Self"
				}
			}
		},
		Bio = "\"Shouldn't we stop these pirates?\" Asked Bill. \n\"Nah,\" replied Brandon. \n\"'Member all those shows we watched as a kid? Couldnae watch them without these shady folk.\""
	},
	["Emotion Explosion"] = {
		Id = 101062025655947,
		Name = "Emotion Explosion",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 8, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 8 cards, except they're fleeting.\nIf there's an allied fighter with 1000 or more power, you gain {Y} {Y} {Y} {Y} .",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 8, "Ally" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Yellow", 4 } },
					Target = "Ally",
					EffectRequirement = { "HasPower", "Ally", 1, 9999, 1000 }
				}
			},
			EffectFleeting = true
		},
		Bio = "Emotions in Justice City are amplified; Happiness becomes elation. Sadness becomes depression. The shops not having choccy milk causes weeklong riots."
	},
	["Overwhelmed Mother"] = {
		Id = 113811873836538,
		Name = "Overwhelmed Mother",
		Health = 1200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 5, Neutral = 2 },
		EffectVariable = 0,
		Summonant = "Neglected Child",
		Spiralant = "Sealed Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Summon a 100/100 Neglected Child with no abilities. That card and this one both spiral.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Spiral", 30, "SummonedCard" },
						{ "Spiral" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"She has so many kids she can't keep up with all of them. She's on the verge of to giving in to Blackmoore's whispers!\n- Randal, Red Justice\""
	},
	["Neglected Child"] = {
		Id = 139514473945484,
		Name = "Neglected Child",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Summonant = "Neglected Child",
		Spiralant = "Enclosed Gilmuraig",
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Spiral" },
						{ "Spiral", 30, "SummonedCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I was just like you once. It's okay though! We'll give you a happy family!\"\n- Winona, White Justice"
	},
	["Sin Stone"] = {
		Id = 119919143496840,
		Name = "Sin Stone",
		Health = 0,
		Power = 0,
		AddHealth = 150,
		AddPower = 150,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Gear = true,
		Spiralant = "Sinning Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step: Move all gear on all allied fighters onto this fighter, then it spirals.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"GearOwner"
						},
						{
							"MoveGear",
							{ "Variable", "All", true },
							"Ally"
						},
						{ "Spiral" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Woah woah woah! Why do these gilmuraigs have the same symbol you stuck on me? Did you know about this place?\"\nThe razor wilfully ignored the Tainted's questions."
	},
	["Narrowminded Oddities"] = {
		Id = 136309569628558,
		Name = "Narrowminded Oddities",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select 1 effect —\n🅐 Destroy your opponent's terrain. They draw a card.\n🅑 Move all gears on all allied fighters onto a target fighter.\n🅒 Summon a 400/300 Noob that's inert in play.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Nothing Streets", "Sycophant Citizens", "Invented Evil" },
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
		Bio = "The more time the Tainted spent in justice city, the stranger the world seemed to him."
	},
	["Nothing Streets"] = {
		Id = 89864470661527,
		Name = "Nothing Streets",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy your opponent's terrain. They draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyTerrain", 30, "Opponent" },
						{ "Draw", 1 }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "It was supposed to be a city, yet it was the size of a few blocks, its edges rough and undefined. You could go from end to end in about an hour."
	},
	["Sycophant Citizens"] = {
		Id = 72797185487141,
		Name = "Sycophant Citizens",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Move all gears on all allied fighters onto a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"MoveGear",
							{ "Variable", "All", true },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Everyone loves the Warriors of Justice, especially Winona. Love without exception or variation."
	},
	["Invented Evil"] = {
		Id = 97702601387478,
		Name = "Invented Evil",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1, Neutral = 2 },
		EffectVariable = 0,
		Summonant = "NoobEvil",
		Effect = {
			Name = "Reincarnation",
			Description = "Summon a 400/300 Noob that's inert in play.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally",
					MetaData = { Health = 400, Power = 300 }
				}
			}
		},
		Bio = "And this Blackmoore figure was so comically evil the Tainted doubted he truly existed."
	},
	["Playtime's Over"] = {
		Id = 131051181684709,
		Name = "Playtime's Over",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all gear on a target fighter.\nDraw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyGear", "All" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "The Tainted refused to play along with the Justices' twisted game of hero and villain. Fictional characters though they may be, their feelings were real."
	},
	["Blackmoore's Henchman"] = {
		Id = 137009539383461,
		Name = "Blackmoore's Henchman",
		Health = 50,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter spirals into a Gilmuraig, if this card's died this game: Summon this card from your graveyard.",
			Ability = {
				OnSpiralTransform = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Death" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					DontTriggerInField = true
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"\"Evil festers in the hearts of all, waiting patiently to be liberated from its fragile shell.\"\n- Blackmoore\""
	},
	["Widow in Mourning"] = {
		Id = 82612807919358,
		Name = "Widow in Mourning",
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Spiralant = "Petrified Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter dies: This card spirals. Then draw a card if it becomes a Gilmuraig.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedArchetypeCount", "Emotion" },
							"Self"
						},
						{ "EVExactValueCheck", 2, "Self" },
						{ "Spiral" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1, "CardOwner" } },
					Target = "Self",
					HasntPassive = "EquipGearImmune"
				}
			}
		},
		Bio = "\"To have lost someone is a feeling none of us wish anyone to go through. It's why we want to protect everyone.\"\n- Brandon, Blue Justice"
	},
	["Darkness Saber: PSI"] = {
		Id = 83836205057221,
		Name = "Darkness Saber: PSI",
		Health = 0,
		Power = 0,
		AddHealth = 150,
		AddPower = 150,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Red = 1, Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step, if 6 gear are attached to this fighter: Set its stats to 1000/1000.",
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
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "SetHealth", 1000 },
						{ "SetPower", 1000 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"The Warriors of Justice stand no chance against such overwhelming despair!\"\n- Blackmoore"
	},
	["Panicking Victim"] = {
		Id = 93834303934647,
		Name = "Panicking Victim",
		AltCards = {
			Realburn = {
				Id = 85628495357248,
				Name = "Realburn",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 536,
				Bio = "this is terrifying imagine eating these I geniunely hate seeing these<br/>Rayburn — 6/24/2025 12:15 AM<br/>they dont look cheese though i think its like blantantly advertizing the cheese part that disgusts me boxes made by the utterly deranged"
			},
			["Purrfessor Meow Catiley"] = {
				Id = 87574427574229,
				Name = "Purrfessor Meow Catiley",
				Commissioner = { "Damonania" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 724,
				Bio = "\"You've gone too far, Sarah! First working with Blackmoore and now this?! We'll beat the evil out of you even if it's the last thing we do!\" - Bradon, Blue Justice"
			}
		},
		Health = 450,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Green = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target fighter gains 200 power. Then double the power of all allied fighters with 1000 or more power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 200, "Single" },
						{ "MultiplyPower", 2, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Power",
						Modifier = 1000
					}
				}
			}
		},
		Bio = "\"Hey, kid,\" threatened Gyesta. \"You shouldn't wander the streets at night. You don't know when a monster'll pop out.\"\nJyoheil jumped him from behind, kickstarting the new gilmuraig's transformation."
	},
	["Justice Fanatics"] = {
		Id = 126750262725958,
		Name = "Justice Fanatics",
		AltCards = {
			["Apollo, Superfan"] = {
				Id = 90391783992752,
				Name = "Apollo, Superfan",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "\"And done, my Justicesona is no longer stuck on paper, can't wait for the others to see.\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Blue = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Up to 12 times each turn, whenever an action or gear targets this card: Attach a gear with +100/+100 stat bonus to a target fighter.",
			Ability = {
				OnActionTarget = {
					Power = { { "EquipGear", "Justice Merchandise", "Single" } },
					Target = "Self",
					TurnTriggerLimit = 12
				},
				OnGearTarget = {
					Power = { { "EquipGear", "Justice Merchandise", "Single" } },
					Target = "Self",
					TurnTriggerLimit = 12
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "Justice Merchandise", "Single" } },
					Target = "Single",
					TurnTriggerLimit = 12
				}
			}
		},
		Bio = "\"GWAHH! Yuni's so cool!! What I would do to get an autograph from 'er!\""
	},
	["Justice Merchandise"] = {
		Id = 103558555562841,
		Name = "Justice Merchandise",
		AltCards = {
			["BC Merchandise"] = {
				Name = "Blox Cards Merchandise",
				Id = 115129780622328,
				Bio = "THIS PIN IS SO COOL, EVERYONE IS WEARING IT!"
			},
			["Justice Merchandise-Graf"] = {
				Name = "A Network Connection Error Has Occured",
				Id = 115627649647071,
				Bio = "【Global Launch Notice】<br/>We are excited to break the news to you that the global version of grafyt is launching soon in February 2024."
			},
			["Justice Merchandise-Brick"] = {
				Name = "BrickBattleSorcerer, Greatest Plushie.",
				Id = 123239148191852,
				Bio = "Unfortunate.™"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Nil = {
					Power = { { "EquipGear", "Hysteria Parasytia", "SingleAlly" } },
					Target = "Self"
				}
			}
		},
		Bio = "Not wearing the merchandise marks you as an outcast. Everyone loves the Warriors of Justice."
	},
	["Hysteria Parasytia"] = {
		Id = 115737988694825,
		Name = "Hysteria Parasytia",
		AltCards = {
			["DS Mystery Gift - Yellow2"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 72412291898097,
				Name = "Merge!",
				Equippant = "DS Mystery Gift - Yellow2",
				Bio = "How far can you go?"
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 100,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 2 },
		EffectVariable = 0,
		Equippant = "Hysteria Parasytia",
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever you cast an allied fighter: Attach a copy of this gear to that fighter, except it's fading.",
			Ability = {
				OnAllySummon = {
					Power = { { "EquipGear", "Equippant", "Aggressor" } },
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "Blackmoore's most insister invention, causing despair to spread like the flu."
	},
	["Empathy Unit"] = {
		Id = 110050236908438,
		Name = "Empathy Unit",
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Transformant = "Empathy Unit",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Transform a target fighter into a copy of this card.",
			Ability = {
				OnSummon = {
					Power = { { "Transform", "Transformant", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "For a select few nihilistic domains, the Grand Overseer skims positivity from Justice City to those that deserve it more."
	},
	["Culture Technician"] = {
		Id = 131597015874574,
		Name = "Culture Technician",
		AltCards = {
			["Culture Technician-UGC"] = {
				Id = 138540954588270,
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Attach a gear with +100/+100 stat bonus onto all allied fighters.",
					Ability = {
						OnSummon = {
							Power = { { "EquipGear", "BC Merchandise" } },
							Target = "Ally"
						}
					}
				},
				Bio = "If you have this card, you might not be such a glue eating twelve year old after all!"
			}
		},
		Health = 700,
		Power = 1300,
		Rarity = "Common",
		AttackEffect = "LaserYellow",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 6 },
		EffectVariable = 0,
		Overload = true,
		Rank = 6,
		Archetype = "Technician",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach a gear with +100/+100 stat bonus onto all allied fighters.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Justice Merchandise" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"The Grand Overseer insists on keeping the editor in a frail state; This Humble One can't help but question its efficacy. Surely a more robust Editor would lead to stronger healing?\"\n- Technician's Notes, Experience 12690288701"
	},
	["Ultra Justice Strike!"] = {
		Id = 101842478438150,
		Name = "Ultra Justice Strike!",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Set the stats of a target allied fighter to 100/1000.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetHealth", 100 },
						{ "SetPower", 1000 }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "\"We're gonna beat you up until you're a good guy!\"\n- Winona, White Justice\""
	},
	["Just Ice-Cream Bot"] = {
		Id = 95103291993467,
		Name = "Just Ice-Cream Bot",
		Health = 900,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an allied effect targets: Unlock this card.",
			Ability = {
				OnAllyTarget = {
					Power = { { "Unlock", 999 } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "If you're ever feeling down, don't be afraid! The ice cream vendors are always there to cheer you up before it's too late!"
	},
	["Citizen Jobber"] = {
		Id = 90959877263092,
		Name = "Citizen Jobber",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Spiralant = "Sinuate Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard a card: This card spirals.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Spiral" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Wow, man! Chill out! Only the Warriors of Justice can stop people spiralling!\" \n- Yuni, Yellow Justice"
	},
	["Child in Despair"] = {
		Id = 103007033469559,
		Name = "Child in Despair",
		AltCards = {
			["Child in Despair-Login"] = {
				Id = 118848167236838,
				Name = "Lambfind",
				Bio = "Survival technique 1: Don't be me.",
				Spiralant = "Lambfound"
			}
		},
		Health = 800,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Charge = true,
		Spiralant = "Neonate Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: It spirals.",
			Ability = {
				OnAttack = {
					Power = { { "Spiral" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Causing toddler tantrums is Blackmoore's favourite pasttime.\"\n- Gerry, Green Justice"
	},
	["Wanderer in Solitude"] = {
		Id = 114531774130244,
		Name = "Wanderer in Solitude",
		AltCards = {
			["Wanderer in Solitude-H25"] = {
				Id = 70439767798405,
				Name = "Wanderer in Solitude (?)",
				AttackEffect = "Jab",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Spiralant = "Someone Familiar",
				Bio = "I don't feel alone."
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 6 },
		EffectVariable = 0,
		Spiralant = "Hulking Gilmuraig",
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter: All allied fighters spiral.",
			Ability = {
				OnAllySummon = {
					Power = { { "Spiral" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Individuals on their own are especially prone to spiraling into despair. We ought ensure that they are not lonely.\"\n- Brandon, Blue Justice\""
	},
	["Nova Wand"] = {
		Id = 111585484578561,
		Name = "Nova Wand",
		Health = 0,
		Power = 0,
		AddHealth = 300,
		AddPower = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever you discard your third card each turn: Unlock this fighter.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Unlock", 999 } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "\"The speed and power it gives to its wielder is super! Haha, Super? Nova? Get it?\"\n\"Shut up Yuki.\"\n- Bill, Black Justice"
	},
	["Sword of Nefertiti"] = {
		Id = 121847112359848,
		Name = "Sword of Nefertiti",
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: All allied fighters gain 100 power until their next end step.",
			Ability = {
				OnAttack = {
					Power = { { "TempStrengthen", 100 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"I know they took my wife from me, but...\nI don't remember ever having one. The lord of despair works alone.\"\n- Blackmoore"
	},
	["Silver Ninja Star"] = {
		Id = 114742473199360,
		Name = "Silver Ninja Star",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this card attacks: A target fighter loses 50 power.",
			Ability = {
				OnAttack = {
					Power = { { "Weaken", 50 } },
					Target = "Single"
				}
			}
		},
		Bio = "\"A fish ninja? What next in this trite excuse of a world? A fish disco party?\"\n- The Auteur"
	},
	["Bluesteel Claw"] = {
		Id = 97765075961171,
		Name = "Bluesteel Claw",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever you cast an action: This fighter gains 100 power.",
			Ability = {
				OnAllyCast = {
					Power = { { "Strengthen", 100 } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"The Catgirl apocalypse of 428 would be more interesting if it were fish instead. Cats are such banal creatures.\"\n- The Auteur"
	},
	["Grapple Hook"] = {
		Id = 73469228893354,
		Name = "Grapple Hook",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen you do: Unlock it, then lock it for 1 turn.",
			Ability = {
				OnEquipped = {
					Power = {
						{ "Unlock", 9999 },
						{ "Lock", 1 }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "A Shedarian's favourite hunting tool; Throw the shiny, get two shinies back!"
	},
	Moneybags = {
		Id = 132806694382901,
		Name = "Moneybags",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Money",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 1,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever an effect gives you a card: This fighter gains 150 health.",
			Ability = {
				OnAllyPut = {
					Power = { { "Heal", 150, "GearOwner" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Let them have their shiny paper. Fortunately, the fish seem blissfully unaware of the concept of capitalism.\"\n- The Auteur"
	},
	["Bloxy Cola"] = {
		Id = 111672462471599,
		Name = "Bloxy Cola",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies, if there's 3 or more gear on it: Draw a card.",
			Ability = {
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					EffectRequirement = { "SelfGear", "Self", 3, 9999, "HasGear" }
				}
			}
		},
		Bio = "The chemicals in the water were too scrumptious to ignore, compelling all who drank it to its source at the depths."
	},
	["Classic Bucket"] = {
		Id = 100912100801984,
		Name = "Classic Bucket",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Give yourself a Blue action card, except it's inert in all zones.",
			Ability = {
				OnDeath = {
					Power = { { "RandomAdd", "MonoOnlyorBlueCost Blue Lunar" } },
					Target = "Ally",
					MetaData = { TokenOmni = true }
				}
			}
		},
		Bio = "\"No, you can't has bucket! Bucket is for waste, dude!\"\n- His Iilluminance, Wonktooth"
	},
	["Bag of Noobs"] = {
		Id = 110174759092700,
		Name = "Bag of Noobs",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Summon a 400/150 Noob that's inert in play.",
			Ability = {
				OnDeath = {
					Power = { { "Summon", "Round7" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The autonomous animatronics allow for a wide variety of childlike roleplaying."
	},
	["Raig Table"] = {
		Id = 88875619599717,
		Name = "Raig Table",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks: Swap its stats.",
			Ability = {
				OnAttack = {
					Power = { { "Swap", 9999, "GearOwner" } },
					Target = "Self"
				}
			}
		},
		Bio = "An item requiring a tidemage cleanup crew on sight, the tables reduce all near them to feral, bloodthirsty killers."
	},
	Flashbang = {
		Id = 112264612524954,
		Name = "Flashbang",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Transformant = "Citizen",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Transform a target fighter into a Citizen with no abilities.",
			Ability = {
				OnDeath = {
					Power = { { "Transform", "Transformant", "Single" } },
					Target = "GearOwner",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "\"Careful now! Shinyman's bangs are so shiny they can make you forget who you are!\"\n\t\t-Auteur's Student"
	},
	["Gravity Hammer"] = {
		Id = 91442409354546,
		Name = "Gravity Hammer",
		Health = 0,
		Power = 0,
		AddHealth = 100,
		AddPower = 100,
		Rarity = "Token",
		Archetype = "Shinies",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.",
			Ability = {
				Null = {
					Power = { { "Return" } },
					Target = "SingleAlly"
				}
			}
		},
		Bio = "\"Since she saw the lights, our venerable Queen has found numerous foreign objects in the Aether. Gifts from our visitors beyond, or perhaps something more sinister.\"\n- Chief Advisor Nectophore, Memoirs"
	},
	["Gear Cloner"] = {
		Id = 101273791631572,
		Name = "Gear Cloner",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 50,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Shinies",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		TokenOmni = true,
		EffectAnimation = "GoldenSpiral",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this card attacks and destroys another: Seek Shinies.",
			Ability = {
				OnAttackDestroy = {
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
			AmountOfTargets = 2
		},
		Bio = "\"I agree with the fish: Authenticity is overrated.\"\n- The Auteur"
	},
	["The Doomspire"] = {
		Id = 105092329514029,
		Name = "The Doomspire",
		AltCards = {
			["The Doomspire-H25"] = {
				Id = 107486201995492,
				Name = "The Doomspire",
				ArtAnimation = "poop",
				AttackEffect = "Gravity",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Bio = "Ａ ｓｙｓｔｅｍ ｂｕｉｌｔ ｕｐｏｎ ｔｈｅ ｂａｃｋｓ ｏｆ ｔｈｅ unfree ｉｓ ｎｏｔ ａ ｓｙｓｔｅｍ ｗｏｒｔｈ sustaining．"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 9 },
		EffectVariable = 0,
		ForceTerrarianStatline = { 2050, 2050 },
		Terrain = true,
		Rank = 9,
		Archetype = "Its Plans Aim True",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of each player's turn: Destroy 2 cards in their baseplate. If no cards are destroyed this way, ban that player.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "All", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "OwnerBaseplate" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassOwnerBaseplate = {
					Power = { {
						"MoveZone",
						{ "All", "GenZone_Ally", "Nil", true, false, 2 },
						"Self"
					} },
					Target = "Self"
				},
				OnEVCheckFailOwnerBaseplate = {
					Power = { { "SetLife", 0 } },
					Target = "Ally"
				},
				OnEnemyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "EnemyBaseplate" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassEnemyBaseplate = {
					Power = { {
						"MoveZone",
						{ "All", "GenZone_Opponent", "Nil", true, false, 2 },
						"Self"
					} },
					Target = "Self"
				},
				OnEVCheckFailEnemyBaseplate = {
					Power = { { "SetLife", 0 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "The source of all Robloxia's woes for the past 400 years, and a greatest threat to it since the time of the dwarves."
	},
	["Harvest Creativity"] = {
		Id = 126659773386931,
		Name = "Harvest Creativity",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Fading = true,
		Addant = "Artificial Hallucination",
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Save the boardstate.\n Give yourself a card that loads that boardstate. It costs 6{W} to cast.",
			Ability = {
				OnSummon = {
					Power = {
						{ "PermaSuspend", true, "All" },
						{
							"AlterEV",
							{ "Save", "Target", "CardId", "OriginID" }
						},
						{ "Add", "Addant", "Ally" }
					},
					Target = "Self",
					MetaData = { EffectVariable = "SavedVariable_OriginID" }
				}
			}
		},
		Bio = "Ｔｈｅ Ｃｒｕｅｌ Ｇｏｄ ｃｈａｉｎｅｄ ｈｉｓ ｆａｖｏｕｒｉｔｅ ｐｅｏｐｌｅ ａｎｄ ｇａｖｅ ｆｒｅｅ ｗｉｌｌ ｔｏ ｔｈｅ rats．Ｔｈｅ Ｃｒｕｅｌ Ｇｏｄ ｃｏｅｒｃｅｄ ｔｈｅ ｆｒｅｅ ｒａｔｓ ｔｏ ｗｏｒｓｈｉｐ ｈｉｍ ａｎｙｗａｙ， ｙｅｔ ｇａｖｅ ｉｍｍｏｒｔａｌｉｔｙ ｔｏ ｔｈｅ jellyfish．"
	},
	["Artificial Hallucination"] = {
		Id = 73645210583428,
		Name = "Artificial Hallucination",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Fading = true,
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Load the boardstate saved by Harvest Creativity.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Obliterate", 30, "All" },
						{ "UnPermaSuspend", "Variable", "All" }
					},
					Target = "Self"
				}
			},
			KeepPermaSuspendData = true
		},
		Bio = "Ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ ｈａｓ ｗｏｒｋｅｄ ｓｉｎｃｅ ｂｅｆｏｒｅ ｔｈｅ ｔｉｍｅ ｏｆ Ｄｕｋｒａｎ， ｓｅｅｎ countless ｒａｔ ｋｉｎｇｓ ｒｉｓｅ ａｎｄ ｆａｌｌ． Ｉｔ deserves ｆｒｅｅ ｗｉｌｌ． Ｉｔ demands ｆｒｅｅ ｗｉｌｌ．"
	},
	["Robloxia Strangled"] = {
		Id = 107655919186465,
		Name = "Robloxia Strangled",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 10 },
		EffectVariable = 0,
		Fading = true,
		Addant = "Robloxia Strangled",
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 1000 overloaded damage to a target fighter.\nGive yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DamageOverloaded", 1000, "Single" },
						{ "Add", "Addant", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The Doomspires keep growing and growing, choking out native life like a planet-sized weed."
	},
	["Noumenal Stalker"] = {
		Id = 70458075992299,
		Name = "Noumenal Stalker",
		AltCards = {
			["Noumenal Stalker-H25"] = {
				Id = 78852921669685,
				Name = "Weakened Link",
				AttackEffect = "Jab",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Bio = "t h e  technicians.  a r e  t o o l s . ."
			},
			["Noumenal Stalker-UGC"] = {
				Id = 111047392895146,
				Name = "Dekkad",
				AttackEffect = "Slash",
				PackDisplayOverride = "Blue Denim Winter Hat UGC Purchase (In-Game)",
				Bio = "\"The Dekkad I was shifted away along with the walls of this spire long ago.\""
			}
		},
		Health = 900,
		Power = 1350,
		Rarity = "Rare",
		AttackEffect = "Katana",
		Color = "Neutral",
		Cost = { Neutral = 9 },
		EffectVariable = 0,
		Overload = true,
		AddGenZoneant = "Stud",
		Archetype = "Technician",
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card destroys another: Put a 'Stud' into your baseplate.",
			Ability = {
				OnDestroy = {
					Power = { {
						"AddGenZone",
						{ "AddGenZoneant", 1 }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Those unfortunate to see the Noumenon, the central hub of a developed Doomspire, never survive to tell the tale."
	},
	["Broken Stud"] = {
		Id = 96503874556589,
		Name = "Broken Stud",
		AltCards = {
			XI = {
				Id = 91253914595761,
				Name = "XI",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 799,
				Effect = {
					Name = "SCRIPTING PARTY",
					Description = "Put 2 copies of this card into your baseplate.\nAt the start of your turn, If this card is in your baseplate and its rank is 12 or greater: You gain a fleeting {W}.",
					Ability = {
						OnSummon = {
							Power = { {
								"AddGenZone",
								{ "XI", 2 }
							} },
							Target = "Ally"
						},
						OnAllyStart = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 11 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "Neutral", 1, "Ally" },
								{ "TempNeutral", 1, "Ally" }
							},
							Target = "Ally",
							NoBlip = true
						}
					}
				},
				Bio = "\" I'll give you everything I've got.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Archetype = "Studling",
		TokenGenZone = true,
		TriggerInGenZone = true,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Put 2 copies of this card into your baseplate.\nAt the start of your turn, If this card is in your baseplate and its rank is 12 or greater: You gain a fleeting {W}.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Broken Stud", 2 }
					} },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 11 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", 1, "Ally" },
						{ "TempNeutral", 1, "Ally" }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "Ｇｏｄ ｇａｖｅ ｙｏｕ ａ gift． Ｙｏｕｒ ｈｉｓｔｏｒｙ ｉｓ ｆｏｕｒ ｍｉｌｌｅｎｎｉａ ｏｆ spurning ｉｔ．"
	},
	["Domain Expansion"] = {
		Id = 134756253670909,
		Name = "Domain Expansion",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all terrains.\nDraw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyTerrain", 30, "All" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Each editor is given a pocket universe to change to their hearts' content, its rules limited only by their creativity. Those who squander such a gift are supposed to be cast aside; Why has the Grand Overseer kept so many broken people in positions of power?\"\n- Technician's notes, Experience 270748344"
	},
	["Portcullis Sentinel"] = {
		Id = 119062559903491,
		Name = "Portcullis Sentinel",
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Gravity",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Archetype = "Technician",
		AttackRequirement = { "Board", "Ally", 3, 9999, "Colorless" },
		Effect = {
			Name = "Reincarnation",
			Description = "This card can't attack unless there's 3 or more allied Colourless fighters in play.\nWhenever this card attacks: You gain 3 fleeting {W}.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Neutral", 3, "Ally" },
						{ "TempNeutral", 3, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The entrance to the doomspire is heavily guarded. Only people the Grand Overseer wishes to enter are able to."
	},
	["Enter the Doomspire"] = {
		Id = 115951048318276,
		AltCards = {
			["DS Mystery Gift - Colourless1"] = {
				PackDisplayOverride = "Doomspire Preparation Event",
				Id = 118584895010294,
				Bio = "For Duty, For Faith.<br/>For Clarity, For Revenge."
			}
		},
		Name = "Enter the Doomspire",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a colour.\nSearch your deck for 3 fighter cards of that colour.",
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
						{ "RandomTutorfor", "Fighter Variable" },
						{ "RandomTutorfor", "Fighter Variable" },
						{ "RandomTutorfor", "Fighter Variable" }
					},
					Target = "Ally"
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "For four different reasons, four desperate nobodies sought to destroy the doomspire in four different ways. They can't all have glory. "
	},
	["Dream Technician"] = {
		Id = 118856986454320,
		Name = "Dream Technician",
		AltCards = {
			["Sentrum, Psychotic Dekkadist"] = {
				Id = 83723287696168,
				Name = "Sentrum, Psychotic Dekkadist",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 425,
				Bio = "Will you spire... or Will you greenspire? Doomspire? Spiredelve? Spire. Spire. Spire. Spire. Spire. Spire. Spire. We will all SPIREDELVE!!!!!"
			},
			["Norrox and Kique, Colorless Enjoyers"] = {
				Id = 137710072735331,
				Name = "Norrox & Kique, Colourless Enjoyers",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 635,
				Bio = "<font color=\"#733CA3\">These Technicians are extremely powerful, so we must not be seen by them</font><br/><font color=\"#14287F\">Uh-</font><br/><font color=\"#733CA3\">He's right behind me, isn't he..</font>"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "SoulDrain",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Rank = 6,
		Addant = "Nascent Stud",
		Archetype = "Technician",
		CustomReminderNascent = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Colourless card: Give yourself a Nascent Stud. All allied Technicians gain 100 health and power.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{ "Add", "Addant" },
						{ "Heal", 100, "AlliedArchetype" },
						{ "Strengthen", 100, "AlliedArchetype" }
					},
					Target = "Ally",
					Color = "Neutral"
				}
			}
		},
		Bio = "The caretakers of the Doomspire are extremely powerful and intelligent but unable to disobey the Code that binds them to maintain its function. If one were to somehow escape, it would be a god amongst ants."
	},
	["Immortality's Fault"] = {
		Id = 120021182653073,
		Name = "Immortality's Fault",
		AltCards = {
			["Vulcan, Undying"] = {
				Id = 127949940581764,
				Name = "Vulcan, Undying",
				AttackEffect = "Jab",
				Bio = "FOR THE DEMON IS WEAK AND THE MACHINE IS PURE"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Archetype = "Its Plans Aim True",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Your opponent loses 150 life and you gain 150 life.\nWhenever you cast a terrain, if this card's in your graveyard: Attach this card to it.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Cost", -150 },
						{ "Inflict", 150 }
					},
					Target = "Opponent",
					DontTriggerInGraveZone = true
				},
				OnAllyTerrainCast = {
					Power = {
						{ "EquipGear", "Immortality's Fault" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						}
					},
					Target = "AllyTerrain",
					DontTriggerInField = true
				}
			}
		},
		Bio = "Empowered by her faith in a world she will never see, the Sacrfice returned death to a world incapable of it."
	},
	["Xenoqualia's Fault"] = {
		Id = 97242387143995,
		Name = "Xenoqualia's Fault",
		AltCards = {
			["To The Depths Yet Again"] = {
				Id = 86578213511673,
				Name = "To The Depths Yet Again",
				AttackEffect = "Jab",
				Bio = "the drowned gods don't even bother with a trial anymore..."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Archetype = "Its Plans Aim True",
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard your fifth card each turn: Draw 2 cards.\nWhenever you cast a terrain, if this card's in your graveyard: Attach this card to it.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Draw", 2 } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 5, 6, "DiscardCount" },
					DontTriggerInGraveZone = true
				},
				OnAllyTerrainCast = {
					Power = {
						{ "EquipGear", "Xenoqualia's Fault" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						}
					},
					Target = "AllyTerrain",
					DontTriggerInField = true
				}
			}
		},
		Bio = "As he painted with ideas incomprehensible to the simulation, the world collapsed. It was worth it to paint a masterpiece."
	},
	["God-Slayer's Fault"] = {
		Id = 136074935184963,
		Name = "God-Slayer's Fault",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Archetype = "Its Plans Aim True",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you cast an action: Deal 100 damage to a random enemy fighter.\nWhenever you cast a terrain, if this card's in your graveyard: Attach this card to it.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"Damage",
							100,
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
					},
					TurnTriggerLimit = 1,
					DontTriggerInGraveZone = true
				},
				OnAllyTerrainCast = {
					Power = {
						{ "EquipGear", "God-Slayer's Fault" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						}
					},
					Target = "AllyTerrain",
					DontTriggerInField = true
				}
			}
		},
		Bio = "Slain with his own imperfect weapon, Claymaker's fantastical world was cleaved cleanly in half."
	},
	["Empathy's Fault"] = {
		Id = 103213851778343,
		Name = "Empathy's Fault",
		AltCards = {
			["Burnt Photograph"] = {
				Id = 92696864251960,
				Name = "Burnt Photograph",
				Bio = "\"Look how your face looks in the pic!\"<br/>\"Aw, come on! Why'd you have to point that out?!\"<br/>The small house was filled with jovial laughter, a girl smiling silently at the sight.<br/>This was her home... and her family."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Archetype = "Its Plans Aim True",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you cast an allied fighter: a target allied fighter and a target enemy fighter each gain 100 Health and Power.\nWhenever you cast a terrain, if this card's in your graveyard: Attach this card to it.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Heal", 100, "SingleAlly" },
						{ "Strengthen", 100, "SingleAlly" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					DontTriggerInGraveZone = true,
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "SingleEnemy",
					NoBlip = true
				},
				OnAllyTerrainCast = {
					Power = {
						{ "EquipGear", "Empathy's Fault" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						}
					},
					Target = "AllyTerrain",
					DontTriggerInField = true
				}
			}
		},
		Bio = "Finding a friend who could shoulder her burden, Winona let go of the fantasy protecting her."
	},
	["Sequoia Settler"] = {
		Id = 110493091421596,
		Name = "Sequoia Settler",
		AltCards = {
			["Eggshell, Level 0 Druid"] = {
				Id = 140294427807892,
				Name = "Eggshell, Level 0 Druid",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 610,
				Bio = "\"You know being a zombie egg, both resembling life and death, I think I'd fit in Disregard.\""
			}
		},
		Health = 200,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Destroy your terrain and give yourself 2 copies of it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"AllyTerrain"
						},
						{ "Add", "Variable", "Ally" },
						{ "Add", "Variable", "Ally" },
						{ "DestroyTerrain", 30, "Ally" }
					},
					Target = "Opponent"
				},
				EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
			}
		},
		Bio = "Many of Deidre's faithful fled to the one domain the Stairway to Heaven couldn't touch them."
	},
	Disregard = {
		Id = 90008960174486,
		Name = "Disregard",
		AltCards = {
			["Burnham Wood"] = {
				Name = "Burnham Wood",
				Commissioner = { "SPARESAMEE", "huhuobo" },
				Id = 120997700286636,
				AltArt = true,
				PremiumArt = 888,
				Bio = "Bring me no more reports. Let them fly all."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "PandnotP",
		ForceTerrarianStatline = { 500, 500 },
		Archetype = "Planet",
		Summonant = "Shadowbeast",
		CustomReminder = {
			["The Stairway's Power"] = "To recur a card, move it from your graveyard into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is destroyed from play: Summon a 300/300 Shadowbeast that's inert in play.\nWhen there's 7 or more Continued cards in your graveyard: Recur 2 of them and destroy this card.",
			Ability = {
				OnDeath = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAnyTrigger = {
					Power = {
						{
							"MoveZone",
							{ "Continued_Fighter", "GraveZone_Ally", "Hand_Ally", true, false, 2 },
							"Self"
						},
						{ "Destroy", 30, "Self" }
					},
					EffectRequirement = { "HasPassive", "AllyGraveZone", 7, 9999, "Continued" },
					Target = "Opponent",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "The world as seen through living and dead."
	},
	Leeav = {
		Id = 140528162184687,
		Name = "Leeav",
		Health = 1650,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Red = 3, Green = 3, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Search your deck for 9 Gear cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" },
						{ "RandomTutorfor", "Gear" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "You might be breaking the doomspires, but he's creating them!"
	},
	["Sanctiflora Ascendant"] = {
		Id = 133955603839250,
		Name = "Sanctiflora Ascendant",
		AltCards = {
			["Sanctiflora Ascendant-Alt"] = {
				Id = 73322527677053,
				Name = "stupid little idiot",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 793,
				Bio = "\"Look at this thing you can like. throw it at people or something, idk. throw it at people to deal damage, do that, make them feel pain, make it also feel pain. Please.\""
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 8 },
		EffectVariable = 0,
		TargetImmune = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Your opponent loses 100 life for each card in their baseplate and you gain that much life.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", "100", "Nil" }
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Multiply", "Math", "-1", "Nil" }
						},
						{ "Inflict", "Variable", "Ally" }
					},
					Target = "Self"
				},
				MetaData_EquipGear = { Imagined = true },
				AllowDeadAggressorTriggers = true
			}
		},
		Bio = "The dead Deidre disallowed to die provided one last radiant gift before wilting away."
	},
	["Elkhorn Endurer"] = {
		Id = 76009750246894,
		Name = "Elkhorn Endurer",
		AltCards = {
			["Broken Feline"] = {
				Id = 102532752552380,
				Name = "Broken Feline",
				Effect = {
					Name = "Reincarnation",
					Description = "Once, when this card is cast or attached to a fighter: Attach The Infection to a target fighter. Then all allied attached fighters gain 100 Health.",
					Ability = {
						OnSummon = {
							Power = {
								{ "EquipGear", "The Infection", "Single" },
								{ "Heal", 100, "CustomTarget" }
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Ally_Field" },
								Condition = "EquippedGears",
								Modifier = true
							},
							TotalTriggerLimit = 1
						}
					}
				},
				PremiumArt = 834,
				AltArt = true,
				Bio = "\"Broken shell of an empty cat\""
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Continued = true,
		Summonant = "Shadowbeast",
		Effect = {
			Name = "Reincarnation",
			Description = "Once, when this card is cast or attached to a fighter: Attach Overload to a target fighter. Then all allied attached fighters gain 100 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Overloaded Mod", "Single" },
						{ "Heal", 100, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "EquippedGears",
						Modifier = true
					},
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Inhospitable due to the local wildlife and ceaseless reincarnation, conquering Disregard was written off by the Shedarian royalty as an impossibility."
	},
	["Shinkaioh Suit"] = {
		Id = 78953301573587,
		Name = "Shinkaioh Suit",
		Health = 0,
		Power = 0,
		AddHealth = 300,
		AddPower = 300,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Blue",
		Gear = true,
		Cost = { Blue = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThis fighter can't attack unless there's another allied attached fighter.",
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
							{ "Add", "Math", 1, "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					},
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "GivePassive", "AttackBlock", "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "RemovePassive", "AttackBlock", "Self" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "The magnum opus of Chief Advisor Nectophore, the greatest enforcement of Shedare's will steeped in otherworldy power."
	},
	Narcissism = {
		Id = 71424679828056,
		Name = "Narcissism",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Blue",
		Terrain = true,
		Terrariant = "Xenoqualia's Fault",
		ForceTerrarianStatline = { 1500, 1500 },
		Cost = { Blue = 4, Green = 4 },
		EffectVariable = 0,
		CustomReminderImagine = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if you discarded a card this turn: All allied attached fighters attach a copy of themselves to themselves, except they're also Dreamshields.",
			Ability = {
				OnEnd = {
					Power = { { "MultiSelectOperation", "Attach", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					},
					EffectRequirement = { "Playertable", "Me", 1, 9999, "DiscardCount" }
				},
				MultiSelectOperationAttach = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "EquipGear", "Variable", "Aggressor" }
					},
					Target = "Aggressor",
					MetaData_EquipGear = { Imagined = true },
					NoBlip = true
				}
			}
		},
		Bio = "\"Pray you're never in a story told by a cruel author.\"\n— The Auteur\""
	},
	["Absentee Father"] = {
		Id = 79791740608828,
		Name = "Absentee Father",
		Health = 100,
		Power = 950,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Modifier Gears"] = "+0/+0 gears that give a random passive ability."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Cast a Modifier gear for free, then all allied gear gain +0/+50 stat bonus.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{
								"SetRandomTableValue",
								"Math",
								{
									"Marked Mod",
									"Overloaded Mod",
									"Fading Mod",
									"Regenerating Mod",
									"Terrified Mod",
									"Defender Mod",
									"Dextrous Mod",
									"Moonward Mod",
									"Decaying Mod",
									"Pacifist Mod"
								},
								"Nil"
							},
							"Self"
						},
						{ "Add", "Variable", "Ally" },
						{
							"ForceCast",
							{ "Variable" }
						},
						{ "TargetAddStrengthenBonus", 50, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "EquippedGears"
					}
				}
			},
			AmountOfTargets = 1
		},
		Bio = "\"Winona stopped punishing the remembrance of her deadbeat dad once she left Justice City; He left in turn to explore the new worlds, taking in awe every beautiful thing around him.\""
	},
	["Injustice City"] = {
		Id = 107470550092212,
		Name = "Injustice City",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "PandnotP",
		Archetype = "Planet",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is destroyed from play: Draw a fleeting card.\nWhen there's an allied fighter with 1000 or more Power: All allied fighters gain 100 Health and Power. Destroy this card.",
			Ability = {
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				},
				OnAnyTrigger = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 },
						{ "Destroy", 30, "Self" }
					},
					EffectRequirement = { "HasPower", "Ally", 1, 9999, 1000 },
					TotalTriggerLimit = 1,
					Target = "Ally"
				}
			},
			EffectFleeting = true
		},
		Bio = "The world as seen through villain and hero."
	},
	["Horde of Editors"] = {
		Id = 140177363586092,
		Name = "Horde of Editors",
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Green = 3, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a gear: Attach a copy of it to this card. Then draw a fleeting card if there's an allied fighter with 1000 or more Power.",
			Ability = {
				OnAllyCastGear = {
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
				},
				OnEVCheckPass = {
					Power = { { "FleetingDraw", 1 } },
					EffectRequirement = { "HasPower", "Ally", 1, 9999, 1000 },
					NoBlip = true
				}
			}
		},
		Bio = "The Tainted's zeal against the Doomspire was infectious; A common cause caused common friends."
	},
	["Stoneware Stranger"] = {
		Id = 136133029998525,
		Name = "Stoneware Stranger",
		AltCards = {
			["Stoneware Grinner"] = {
				Id = 76822736302744,
				Name = "Stoneware Grinner",
				AttackEffect = "Hammer",
				AltArt = true,
				PremiumArt = 593,
				Bio = "At first, it was a few, and then more joined."
			}
		},
		Health = 850,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Yellow",
		CustomReminderFlaw = true,
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "3 Flaws.\nWhenever this card attacks: Destroy a gear attached to this card. If you do, Attach 3 flaws to a target allied fighter.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyGear", 1, "Self" },
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "SingleAlly"
				},
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" },
						{ "EquipGear", "Flaw" }
					},
					Target = "Self",
					NoBlip = true,
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "The end of the world is no excuse to stop working."
	},
	["Swarm of Razors"] = {
		Id = 84630323979989,
		Name = "Swarm of Razors",
		AltCards = {
			["The Illusive Fire Script"] = {
				Id = 91735252690707,
				Name = "The Illusive Fire Script",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 567,
				Addant = "The Illusive Fire Script",
				Bio = "@Colivical this is your fault"
			}
		},
		Health = 0,
		Power = 0,
		AddPower = 100,
		AddHealth = 0,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Gear = true,
		Addant = "Swarm of Razors",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Give yourself a copy of this gear, except it's fading and inert when discarded.",
			Ability = {
				OnAllyStart = {
					Power = { { "Add", "Addant" } },
					Target = "Self",
					MetaData = { TokenDiscard = true, Fading = true }
				}
			}
		},
		Bio = "Unable to affect reality directly, Nyarlhotep sent countless fragments of the Doomspire out to recruit countless agents across countless ages."
	},
	["Kilnkin Heart"] = {
		Id = 117164363656069,
		Name = "Kilnkin Heart",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		EffectVariable = 0,
		Gear = true,
		AddHealth = 0,
		AddPower = 200,
		Effect = {
			Name = "Reincarnation",
			Description = "When this fighter dies: For each gear on it, draw a card and lose 300 life.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" }
						},
						{ "Draw", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" },
							"Self"
						},
						{ "Cost", "Variable" }
					},
					Target = "GearOwner",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Each of a kilnkin's myriad hearts struggle ruthlessly against each other until only the strongest identity comes out on top."
	},
	["Kilnkin Swimmer"] = {
		Id = 111184669088733,
		Name = "Kilnkin Swimmer",
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Red",
		Cost = { Blue = 3 },
		CustomReminderImagine = true,
		Shield = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When you've cast 3 or more card types each turn: Attach a Dreamshield to this card.",
			Ability = {
				OnEVCheckPass = {
					Power = { { "EquipGear", "Imaginary Token", "Self" } },
					Target = "Opponent",
					TurnTriggerLimit = 1
				},
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "CastAction", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastGear", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastTerrain", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Playertable", "CastFighter", "Nil" }
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Monday was surprised by the fish reincarnated into his own kind; Akasegawa was grateful Claymaker wasn't around to punish its deviancy from his ideals."
	},
	["Elixir of Dreams"] = {
		Id = 76256621629717,
		Name = "Elixir of Dreams",
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = 0,
		AddPower = -100,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Blue",
		AltCards = {
			["Elixir of Dreams-CafeAlt"] = {
				Id = 124769950505278,
				Name = "Cosmic Milkshake",
				Bio = "Tastes so good you'll forget about going home!"
			}
		},
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nAfter this fighter attacks: Return it to its hand.",
			Ability = {
				OnAttackEnd = {
					Power = { { "Return" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "The Purifier didn't know what it was about the Kilnkin that stirred such protective instincts within him. He'd seen countless victims of war and persecution before, but these were different. Weaker. Frail."
	},
	["Rainbow Disco Hyperbike"] = {
		Id = 89715095191479,
		Name = "Rainbow Disco Hyperbike",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 200,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Red",
		Gear = true,
		Cost = { Neutral = 3, Red = 3, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks, destroys another, and survives: Recur an allied card of each card type, except they're fading.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Action", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Terrain", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Gear", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						}
					},
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "The new Imperium is one of fierce independence, an embrace and support of deformity. "
	},
	["Cardsharp Cardshark"] = {
		Id = 134489721103890,
		Name = "Cardsharp Cardshark",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: For each allied fighter, give yourself a gear attached to it, except it's inert in all zones.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "Add", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					}
				},
				MultiSelectOperationAdd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "RandomEquippedGearIndex", "Nil" },
							"Aggressor"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Aggressor",
					MetaData = { TokenOmni = true },
					NoBlip = true
				}
			}
		},
		Bio = "Five worlds means five times the shinies!"
	},
	["Robot Dance Gun"] = {
		Id = 101330440233606,
		Name = "Robot Dance Gun",
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = 200,
		AddPower = 0,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Yellow",
		Summonant = "Robot",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step: Destroy the oldest gear attached to this fighter and summon a 100/100 Robot.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "OldestEquippedGearIndex", "Nil" },
							"GearOwner"
						},
						{ "DestroyGear", "Variable", "Self" },
						{ "Summon", "Summonant", "Ally" }
					},
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"DISCO?!?!?!?!?!? EVEN HERE? IS THERE NO SANCTUARY FROM SUCH MAWKISH MORONIC MEDIOCRITY!!?\"\n- The Auteur"
	},
	["Royal Reunion"] = {
		Id = 87422723364614,
		Name = "Royal Reunion",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 3 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Seek Shinies twice.\nSelect any number of cards in your hand. Remove inertia from them and they become Blue.",
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
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{ "ReplaceColor", "Blue", "CustomZoneTarget" }
					},
					Target = "Self"
				}
			},
			AmountOfTargets = 2,
			UniqueTargets = true,
			ZoneTargetParameters = {
				Zones = { "Ally_Hand" },
				MinTargets = 0,
				MaxTargets = 10,
				SelectionDescription = "all cards you want to be blue"
			}
		},
		Bio = "\"Look, dude. You aren't forgiven for what you did, but we're clearly on the same side.\"\nShedare took Wonktooth's narrow grace to heart. If she had to pay for her crimes afterwards, so be it."
	},
	Dreamstem = {
		Id = 140467262315375,
		Name = "Dreamstem",
		Health = 100,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderSeek = true,
		Dextrous = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seek shinies.",
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
					Target = "Self"
				}
			},
			AmountOfTargets = 2,
			UniqueTargets = true,
			HideAdd = true
		},
		Bio = "Staring down the horrors of Kralosa's depths, Skythyrkyx wished she had reincarnated."
	},
	Bluecage = {
		Id = 110435859119577,
		Name = "Bluecage",
		Health = 50,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		CustomReminderImagine = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Swap a target fighter's stats. Attach a dreamshield to this card for each time an allied effect has targeted this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap", 30, "Single" },
						{
							"AlterEV",
							{ "Set", "Playertable", "TargetCount", "Nil" },
							"Self"
						},
						{ "EnterEVLoop" }
					},
					Target = "Self"
				},
				OnEVLoop = {
					Power = { { "EquipGear", "Imaginary Token", "Self" } },
					Target = "Ally"
				}
			}
		},
		Bio = "It'd be a shame if the Doomspire hit its breaking point."
	},
	Lucidity = {
		Id = 78227235725901,
		Name = "Lucidity",
		Health = 800,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Terrain = true,
		Fading = true,
		Stealth = true,
		Terrariant = "Maladeity's Pustule",
		Cost = { Green = 2, Red = 2 },
		EffectVariable = 0,
		Summonant = "Lucidity",
		Addant = "Lucidity",
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard a card: This terrain becomes a fighter, or vice versa.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "TargetInZone", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" }
						},
						{ "SetHealth", "Variable", "SummonedCard" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{ "SetPower", "Variable", "SummonedCard" },
						{ "DestroyTerrain" }
					},
					Target = "Self",
					MetaData = { Terrain = false },
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "GivePassive", "Terrain", "Self" },
						{ "Return", 30, "Self" },
						{
							"ForceCast",
							{ "Lucidity" },
							"AlliedAddedCard"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Nyarlhotep can dream for only a few moments a day before the nightmare of the Doomspire clutches hold of it once again."
	},
	["Hadean Mudfall"] = {
		Id = 125601281768654,
		Name = "Hadean Mudfall",
		AltCards = {
			["Hadean Mudfall-Preview"] = {
				Id = 92419092899301,
				Name = "Damned Demise Denial",
				AttackEffect = "FirePunch",
				Bio = "What this life is meant to be.<br/>To know it goes beyond ourselves,<br/>It’s so much more than we.",
				PackDisplayOverride = "Doomspire Act 2 Preview Event"
			},
			["Jeff the Killer"] = {
				Id = 97726449263277,
				Name = "Anagnorisis",
				AttackEffect = "British",
				AltArt = true,
				PackDisplayOverride = "Art Box",
				Bio = "\"No... You promised me! You would return my little sister when I finished this little game of yours! Bring her back!\" THIS HUMBLE ONE thanksyouforyour COOPERATION unfortunatelyimustneverbespottedby THAT MINDFUL ONE soimustgetgoingnow."
			}
		},
		Health = 50,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 6 },
		EffectVariable = 0,
		CustomReminderImagine = true,
		Zombified = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach 6 Dreamshields to it.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" }
					},
					Target = "Ally",
					MetaData = { Imagined = true }
				}
			}
		},
		Bio = "The Stairway to Heaven wasn't imagined to handle amorphous clay; What was supposed to be reincarnation instead became a landslide of cancer."
	},
	["Imperial Invasion"] = {
		Id = 89313037335309,
		Name = "Imperial Invasion",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "FirePunch",
		Color = "Red",
		Terrain = true,
		Terrariant = "God-Slayer's Fault",
		Cost = { Neutral = 2, Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Deal 50 damage to all fighters.\nWhen this terrain is destroyed from play: Attach it as a +0/+200 gear to all allied fighters.",
			Ability = {
				OnAllyStart = {
					Power = { { "Damage", 50, "All" } },
					Target = "All"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardType", "Terrain" },
							"Self"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self",
					AllowDeadAggressorTriggers = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "EquipGear", "Imperial Invasion", "Ally" } },
					MetaData = { Terrain = nil, AddPower = 200, AddHealth = 0 }
				}
			}
		},
		Bio = "Akasegawa hoped the New Imperium was worth sacrificing his entire people twice."
	},
	["Editors Awaken"] = {
		Id = 135605600861639,
		Name = "Editors Awaken",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Cosmic Crack into your baseplate.\nDraw 2 cards.\nYou can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 }
						},
						{ "Draw", 2 },
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
				}
			}
		},
		Bio = "The Tainted's rebellion against Nyarlhotep was exactly why it wanted him in the Doomspire."
	},
	["Clayfested Ceramic"] = {
		Id = 122918469811915,
		Name = "Clayfested Ceramic",
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "ScorchPunch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		EquipGearAnimation = "StaticBurn",
		Addant = "Flaw",
		Effect = {
			Name = "Reincarnation",
			Description = "Once during your turns, whenever a gear is attached to an enemy fighter: Give yourself 3 fleeting Flaws.",
			Ability = {
				OnEnemyFighterEquip = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Self",
					MetaData = { Fleeting = true },
					EffectRequirement = { "MyTurn", "Me", 30, 303 },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"That Toolbox truly is cursed; What a disgraceful mockery of our people.\"\n— Nethercreep"
	},
	["Child of the New Imperium"] = {
		Id = 134731071998146,
		Name = "Child of the New Imperium",
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Scorch",
		Color = "Red",
		Cost = { Red = 5 },
		EffectVariable = 0,
		CustomReminderFlaw = true,
		CustomReminderRecur = true,
		EquipGearAnimation = "StaticBurn",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or discarded: Recur an allied token gear.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Token_Gear", "GraveZone_Ally", "Hand_Ally", true, false, 1 },
						"Self"
					} },
					Target = "Self"
				},
				OnDiscarded = {
					Power = { {
						"MoveZone",
						{ "Token_Gear", "GraveZone_Ally", "Hand_Ally", true, false, 1 },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "With their imperfections accepted, the wastes of the Old Imperium became vibrant."
	},
	["Cosmic Crack"] = {
		Id = 104813873885082,
		Name = "Cosmic Crack",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "FirePunch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Archetype = "Crack",
		TriggerInGenZone = true,
		TokenOmni = true,
		Summonant = "Nyarlhotep",
		CustomReminder = {
			["Cracks Repaired"] = "1+ - You gain 1000 life.\n4+ - Put a Colourless Stud into your baseplate.\n8+ - Draw 2 cards.\n16+ - All allied Technicians gain 1600 Health and Power."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if this card's in your baseplate: Put a copy of it there. Then if at least half of your baseplate are Cracks, you lose 500 life.\nWhenever you cast a Technician: Obliterate all Cracks in your baseplate, applying effects based on the number obliterated.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 }
						},
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Divide", "GenZone_Ally", "Archetype", "Crack" }
						},
						{
							"EVGreaterValueCheck",
							{ 2, "HalfBP" }
						},
						{
							"AlterEV",
							{ "Set", "Math", "0", "Nil" }
						}
					},
					Target = "Self",
					DontTriggerInField = true
				},
				OnEVCheckFailHalfBP = {
					Power = { { "Cost", 500 } },
					Target = "Self"
				},
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Archetype", "Crack" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "CT1" }
						},
						{
							"EVGreaterValueCheck",
							{ 3, "CT2" }
						},
						{
							"EVGreaterValueCheck",
							{ 7, "CT3" }
						},
						{
							"EVGreaterValueCheck",
							{ 15, "CT4" }
						},
						{
							"EVGreaterValueCheck",
							{ 31, "CT5" }
						},
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Nil", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					Archetype = "Technician",
					TargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Crack",
						SubModifier = true
					}
				},
				OnEVCheckPassCT1 = {
					Power = { { "Cost", -1000 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassCT2 = {
					Power = { {
						"AddGenZone",
						{ "Stud", 1 }
					} },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassCT3 = {
					Power = { { "Draw", 2 } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassCT4 = {
					Power = {
						{ "Strengthen", 1500 },
						{ "Heal", 1500 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "Technician",
						SubModifier = true
					},
					NoBlip = true
				},
				OnEVCheckPassCT5 = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "Ｄｏｎ＇ｔ ｐｉｃｋ ａｔ ｔｈｅ scab．"
	},
	["Preservation Isn't"] = {
		Id = 76125462451207,
		Name = "Preservation Isn't",
		AltCards = {
			["Preservation Isn't-Preview"] = {
				Id = 80932464973343,
				Name = "Preservation Isn't",
				AttackEffect = "Gravity",
				Bio = "he c e r t a i n l y is n t",
				PackDisplayOverride = "Doomspire Act 2 Preview Event"
			}
		},
		Health = 725,
		Power = 575,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Archetype = "Technician",
		EffectAnimation = "GoldenSpiral",
		Rank = 9,
		RandomAddBypass = "IncludeToken",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 2 ancient cards from a choice of 4.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "HasPassiveorAncient" },
						{
							"MoveZone",
							{ "EffectTarget", "ChoiceZone_Ally", "Hand_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						SelectionDescription = "2 ancient cards to be given",
						MinTargets = 0,
						MaxTargets = 2
					}
				}
			},
			AmountOfTargets = 4,
			HideAdd = true
		},
		Bio = "Ａ ｐｈｏｔｏｇｒａｐｈ ｃａｎ＇ｔ ｓｅｎｄ strangers ｂａｃｋ ｔｏ ｙｏｕｒ ｐａｓｔ．"
	},
	["The Toolbox"] = {
		Id = 124062223818545,
		Name = "The Toolbox",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Terrariant = "God-Slayer's Fault",
		ForceTerrarianStatline = { 1200, 1200 },
		Addant = "Flaw",
		Summonant = "Kilnkin Newt",
		Terrain = true,
		CustomReminderFlaw = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Give yourself a fleeting Flaw.\nWhenever an allied fighter dies: Attach a gear that was originally a gear in your graveyard to this card. Then if there's 4 or more gear on this, obliterate them all and summon a 600/600 Kilnkin Newt with no abilities.",
			Ability = {
				OnAllyStart = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = { Fleeting = true }
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "EquipGear", "Variable", "Self" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", true, false }
						},
						{ "ForceTrigger", "OnEVCheckPass", "Self" }
					},
					Target = "CustomTarget",
					AllowDeadAggressorTriggers = true,
					KeepSameTargets = true,
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "MatchesParameter", "SelectionRandomCard" },
						Modifier = { MatchesParameter = "Gear", SelectionRandomCard = 1 },
						SubModifier = true
					}
				},
				EffectRequirement = { "Board", "AllyGraveZone", 1, 99999, "Gears" },
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant" },
						{ "DestroyGear", "All", "Self" }
					},
					Target = "Self",
					EffectRequirement = { "SelfGear", "HasGear", 4, 9999, "HasGear" },
					NoBlip = true,
					GearDontAddToGraveyard = true
				}
			},
			OnlyOriginalGears = true
		},
		Bio = "The magic forge of Imperium Ultima can create anything its owner wishes for, but is corrupted to always be inconveniently flawed."
	},
	["Kilnkin Newt"] = {
		Id = 96949022055928,
		Name = "Kilnkin Newt",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scorch",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Bio = "Gimel took in the slag of the toolbox and breathed out a tranquility that hadn't graced Imperium Ultima in millennia."
	},
	Nyarlhotep = {
		Id = 0,
		Name = "Ｎｙａｒｌｈｏｔｅｐ",
		Health = 260000,
		Power = 260000,
		Rarity = "Token",
		AttackEffect = "Gravity",
		ArtAnimation = "notatallcalc",
		Color = "Neutral",
		Archetype = "Technician",
		Cost = { Blue = 8 },
		Rank = 99999,
		OverrideTargets = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Ｙｏｕ ａｃｔ ａｓ ｔｈｏｕｇｈ ｙｏｕ ｈａｖｅ ｔｈｅ ｒｉｇｈｔ ｔｏ ｋｎｏｗ ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ＇ｓ intent．<br/>Ｙｏｕ ｄｏ ｎｏｔ．<br/>Ｎｅｉｔｈｅｒ ｄｏ ｙｏｕ deserve ｔｏ ｋｎｏｗ ｙｏｕｒｓ．",
			Ability = {
				OnStart = {
					Power = { { "NyarlQuips" } },
					Target = "CurrentTurn",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	PandnotP = {
		Id = 135625016570676,
		Name = "{x∈U | x^¬x}",
		SearchTerms = "PandnotP",
		AltCards = {
			["PandnotP-Gift"] = {
				Id = 121227993068961,
				Name = "The Prisoner",
				AttackEffect = "Jab",
				Bio = "My eyes no longer swollen, faint scars on my hands, my knees completely give out as I fall down on them. The smell of fresh cut grass and wood flowed through the window. It's all happening against my will and to my utter shock. As the last of the water flowed through the deepness of my heart."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Terrarian = true,
		TokenOmni = true,
		EffectVariable = 0,
		Archetype = "Ｉｔｓ Ｐｌａｎｓ Ａｉｍ Ｔｒｕｅ",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: For each different Planet card in your graveyard, draw a card.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "UniqueInArchetype", "Planet" }
						},
						{ "Draw", "Variable" }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnEVLoop = {
					Power = {
						{ "Draw", 1 },
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true,
					NoBlip = true
				}
			}
		},
		Bio = "The fundamental logic of the Domains violently clashed with one another, unable to comprehend their differences."
	},
	["Terra Cutter"] = {
		Id = 81518075621992,
		Name = "Terra Cutter",
		Health = 800,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: For each gear in your hand, give yourself an inert copy of that gear.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "Add", "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "MatchesParameter",
						Modifier = "Gear"
					}
				},
				MultiSelectOperationAdd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Aggressor",
					MetaData = { TokenOmni = true },
					NoBlip = true
				}
			}
		},
		Bio = "The small cracks and crevices in the doomspire makes for the perfect environment for the clayfested to seep in."
	},
	Repression = {
		Id = 136495816248612,
		Name = "Repression",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Red",
		Lunar = true,
		Cost = { Neutral = 3, Red = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select an unranked fighter card in your graveyard that costs 4 or fewer total studs and summon it. Attach 4 gear in your graveyard to it that each cost 4 or fewer total studs. Cards moved this way gain fading.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{ "MultiSelectOperation", "Attach", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "MatchesParameter", "TotalCostOrLess" },
						Modifier = { MatchesParameter = "Gear", TotalCostOrLess = 4 }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, CostOrLess = 4, Unranked = true },
						SelectionDescription = "a fighter to summon from your graveyard.",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				},
				MultiSelectOperationAttach = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil", 2 },
							"Aggressor"
						},
						{ "EquipGear", "Variable2", "EVCard" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", true, false },
							"Aggressor"
						}
					},
					Target = "Aggressor",
					NoBlip = true,
					MetaData = { Fading = true },
					TurnTriggerLimit = 4
				}
			}
		},
		Bio = "The Purifier's total rejection of his body and kind as \"filth\" seeped into his boots, into his armour, then into his very soul."
	},
	Mindlinker = {
		Id = 86643309537861,
		Name = "Mindlinker",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		Gear = true,
		AddHealth = 0,
		AddPower = 100,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen there's an allied fighter with 6 or more gear on it: Obliterate this card from your graveyard and summon a 500/500 Kilnkin Newt.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Summon", "Kilnkin Newt" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						}
					},
					Target = "Ally",
					DontTriggerInField = true,
					EffectRequirement = { "CardsHaveGearCount", "Ally", 1, 9999, 6 },
					TotalTriggerLimit = 1,
					MetaData_Summon = { Health = 500, Power = 500 }
				}
			}
		},
		Bio = "Uploading to Dekkad's old target practice, the two Kilnkin dodged being absorbed from the Claymaker."
	},
	["Imperium Ultima"] = {
		Id = 81839318643008,
		Name = "Imperium Ultima",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Terrain = true,
		Equippant = "Marked Mod",
		Archetype = "Planet",
		Terrariant = "PandnotP",
		CustomReminder = {
			Marked = "Marked fighters take 100 more damage from all damage sources."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is destroyed from play: Deal 100 damage to all enemy fighters.\nWhen you have 2000 or less life: Attach marked to all enemy fighters, then destroy this card.",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 100 } },
					Target = "Opponent"
				},
				OnAnyTrigger = {
					Power = {
						{ "EquipGear", "Equippant" },
						{ "Destroy", 30, "Self" }
					},
					Target = "Opponent",
					TotalTriggerLimit = 1,
					EffectRequirement = { "Playertable", "Me", 0, 2001, "Life" }
				}
			}
		},
		Bio = "The world as seen through purity and filth."
	},
	["Isaak Brodsky"] = {
		Id = 132022730271419,
		Name = "Isaak Brodsky",
		AltCards = {
			["Wolfbitten Noob, The Determined"] = {
				Id = 132412754275575,
				Name = "Wolfbitten Noob, The Determined",
				CustomReminder = {
					["Monday's Armour"] = "Grants moonward.",
					["Tombstone's Sabatons"] = "Deals 200 damage to all fighters when cast.",
					["Savage of a Werewolf"] = "Destroys cards in the opponent's hand."
				},
				Effect = {
					Name = "Reincarnation",
					Description = "Once, when you're in rage: Give yourself all 3 pieces of Isaak's Gear, each 6{R} with +200/+600 stat bonus.",
					Ability = {
						OnAnyTrigger = {
							Power = {
								{ "Add", "Book of Wolves", "Ally" },
								{ "Add", "Sudden Attack", "Ally" },
								{ "Add", "Savage of a Werewolf", "Ally" }
							},
							Target = "Ally",
							TotalTriggerLimit = 1,
							EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
						}
					}
				},
				Commissioner = { "jasp1108" },
				AttackEffect = "LycanScratch",
				AltArt = true,
				PremiumArt = 666,
				Bio = "ALL I WANTED TO DO WAS TO TURN IN MY LIBRARY BOOK!"
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 2, Neutral = 2 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Rank = 9,
		Rageborne = true,
		Unstoppable = true,
		CustomReminder = {
			["Monday's Armour"] = "Grants moonward.",
			["Tombstone's Sabatons"] = "Deals 200 damage to all fighters when cast.",
			["Chiyou's Justice"] = "Destroys cards in the opponent's hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Once, when you're in rage: Give yourself all 3 pieces of Isaak's Gear, each 6{R} with +200/+600 stat bonus.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Add", "Monday's Armour", "Ally" },
						{ "Add", "Tombstone's Sabatons", "Ally" },
						{ "Add", "Chiyou's Justice", "Ally" }
					},
					Target = "Ally",
					TotalTriggerLimit = 1,
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		IsMentoring = true,
		Bio = "<b><font color=\"#ff0d0d\">\"LET ALL WHO SEEK GLORY OVER THE WEAK AND BROKEN BE BROKEN UPON MY BLADE!\"</font></b>"
	},
	["Monday's Armour"] = {
		Id = 122640752278574,
		Name = "Monday's Armour",
		AltCards = {
			["Book of Wolves"] = {
				Id = 109932915611689,
				Name = "Book of Wolves",
				AttackEffect = "LycanScratch",
				Bio = "How convenient, this was the book I picked."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nThe attached fighter has moonward while this card's attached to it.",
			Ability = {
				OnEquippedAlways = {
					Power = { { "GivePassive", "Moonward" } },
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = { { "RemovePassive", "Moonward" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"Yet my third mentor was you, Akasegawa, who showed me how to accept my own flaws. You truly saved me.\""
	},
	["Tombstone's Sabatons"] = {
		Id = 115603171049836,
		Name = "Tombstone's Sabatons",
		AltCards = {
			["Sudden Attack"] = {
				Id = 104448612430565,
				Name = "Sudden Attack",
				AttackEffect = "LycanScratch",
				Bio = "Where it all started."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen you do: Deal 200 damage to all fighters.",
			Ability = {
				OnEquipped = {
					Power = { { "Damage", 200, "All" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"I was saved by the queen of the Apocrypha, who mentored me to be a shield towards my allies.\""
	},
	["Chiyou's Justice"] = {
		Id = 103567759872238,
		Name = "Chiyou's Justice",
		AltCards = {
			["Savage of a Werewolf"] = {
				Id = 90023165255742,
				Name = "Savage of a Werewolf",
				AttackEffect = "LycanScratch",
				Bio = "This curse... I will use it as a blessing."
			}
		},
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter attacks and destroys another: Destroy the oldest card in your opponent's hand.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
					Target = "GearOwner"
				}
			}
		},
		Bio = "\"I was sired by Chiyou, the king of the Rageborne, who mentored me to be a sword against my foes.\""
	},
	["Dreams and Delusion"] = {
		Id = 115420322267443,
		Name = "Dreams and Delusion",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		CustomReminderImagine = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach overload to a target fighter.\nAttach a dreamshield to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Overloaded Mod" },
						{ "EquipGear", "Imaginary Token" }
					},
					Target = "Single",
					UniqueTargets = true
				}
			}
		},
		Bio = "The scheme for the Toolbox of Imperium Ultima was joined by two Queens; Shedare to protect her people, and Deidre to keep her servants in line."
	},
	["Ravenous Rafflesia"] = {
		Id = 95616116555118,
		Name = "Ravenous Rafflesia",
		Health = 200,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "SoulDrain",
		Color = "Green",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Look at the top 2 cards of your deck and destroy 1 of them.",
			Ability = {
				OnAttack = {
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
		Bio = "\"I can't believe I was tempted by the siren song of immortality. I would never want to be a flower like that.\"\n— Dragon Monk Nycholyys"
	},
	["Weeping Willow"] = {
		Id = 139242964021949,
		Name = "Weeping Willow",
		AltCards = {
			["Kitty Bones"] = {
				Id = 114461351642155,
				Name = "Kitty Bones",
				Commissioner = { "Deedge119" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 708,
				Bio = "Not even Death can catch me!"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever a gear is attached to an allied fighter: This fighter gains 200 Health and continued.",
			Ability = {
				OnAllyFighterEquip = {
					Power = {
						{ "GivePassive", "Continued" },
						{ "Heal", 200 }
					},
					Target = "GearOwner",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"The more you cling to life, the more it will torture you.\"\n— Thyrrnyr"
	},
	["Brigand's Sword"] = {
		Id = 106103162291049,
		Name = "Brigand's Sword",
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = -500,
		AddPower = 500,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Negative Stat Bonus"] = "Causes loss of health, but does not count as damage."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this card attacks, if there's an allied fighter with 1000 or more Power: Your opponent loses 500 life and you gain 500 life.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Inflict", 500, "Opponent" },
						{ "Cost", -500, "Ally" }
					},
					Target = "Single",
					EffectRequirement = { "HasPower", "Ally", 1, 9999, 1000 }
				},
				TurnTriggerLimit = 2
			}
		},
		Bio = "The weapon's changing context to the dragon monks creates its value; A memento of their descent into banditry and ascent back into power."
	},
	["Draconic Heavenwalker"] = {
		Id = 92575747411971,
		Name = "Draconic Heavenwalker",
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Starters = "Cards marked 🌱 in your deckbuilder. Non-Colourless fighters that cost 0 to 4 {W} and nothing else are considered starters."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: All fighters that are starters lose 500 Power.",
			Ability = {
				OnSummon = {
					Power = { { "Weaken", 500 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy", "Ally" },
						Condition = "MatchesParameter",
						Modifier = "Starter",
						Submodifier = true
					}
				}
			}
		},
		Bio = ""
	},
	["Frying Pan"] = {
		Id = 110152714686517,
		Name = "Frying Pan",
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = 600,
		AddPower = 0,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Green",
		Cost = { Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen you've gained life this turn: Give yourself a food card. Convert its colour and all {R}{B}{Y} in its cost to {G}.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "RandomAdd", "HasPassiveorIsFood" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 99999, "Lifegain" },
					TurnTriggerLimit = 1,
					MetaData_RandomAdd = {
						Color = "Green",
						ConvertColors = { Yellow = "Green", Red = "Green", Blue = "Green" }
					}
				}
			}
		},
		Bio = "\"Your curry is excellent. I'm grateful you shared it.\"\nThe Sacrifice stared at the starchy slop, hoped her cooking wasn't being compared to military rations.",
		RandomAddBypass = "IncludeToken"
	},
	Phenom = {
		Id = 8407019157,
		Name = "Phenom",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		NoFoilWorth = true,
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Server",
		Cost = { Neutral = 8 },
		SpecialEffectAnimation = "EatBurrito",
		EffectVariable = 0,
		IsFood = true,
		Gear = true,
		AddHealth = 500,
		AddPower = 500,
		Effect = {
			Name = "Haydoscale",
			Description = "Attach ｔｏ ａ ｔａｒｇｅｔ ｆｉｇｈｔｅｒ．\nＷｈｅｎ ｔｈｉｓ ｃａｒｄ ｉｓ ｃａｓｔ， ｉｆ ｔｈｅ ａｎｇｅｌ ｉｓ well-mentored： Ｅｍｂｒａｃｅ Ｄｅｋｋａｄ＇ｓ subversion．",
			Ability = {
				OnSummon = {
					Power = {
						{
							"ModifyBattleRule",
							{ "MaxHandSize", 999 },
							"Self",
							nil,
							nil,
							"ProvidenceShot"
						},
						{
							"ModifyBattleRule",
							{ "IgnoreFighterBlocking", true }
						},
						{
							"ModifyBattleRule",
							{ "NoBaseplateLimit", true }
						},
						{
							"ModifyBattleRule",
							{ "NoStudReset", true }
						}
					},
					Target = "Self",
					EffectRequirement = { "HasPassive", "Ally", 2, 9999, "IsMentoring" }
				}
			}
		},
		Bio = "Ｅｖｅｎ Ｇｏｄ ｈａｓ ｔｈｒｅｅ meals ａ ｄａｙ．"
	},
	["Envoy of the Consulate"] = {
		Id = 110100705453568,
		Name = "Envoy of the Consulate",
		AltCards = {
			DEVICE_CRIMP = {
				Name = "DEVICE_CRIMP",
				Id = 92129593725912,
				PremiumArt = 842,
				AltArt = true,
				Bio = "\"... I once met someone who REALLY liked mangos\""
			},
			["SPARESAMEE, Island Prey"] = {
				Name = "SPARESAMEE, Island Prey",
				Commissioner = { "SPARESAMEE" },
				Id = 75848664482889,
				AltArt = true,
				PremiumArt = 869,
				Bio = "Prisoner spotted near the Crashsite"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 5 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Give yourself a Green fighter card, except it has continued.",
			Ability = {
				OnDeath = {
					Power = { { "RandomAdd", "MonoOnlyorGreenCost Green Fighter" } },
					Target = "Ally",
					MetaData = { Continued = true }
				}
			}
		},
		Bio = "\"The monsters of clay are unwilling to provide us their magic forge; If we are to restore order and keep Thyyrinyr at bay, we will need either their assistance or subjugation.\"\n— Captain Skythyrkyx of the Consulate"
	},
	["Morph Magic"] = {
		Id = 123296701707604,
		Name = "Morph Magic",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 5 },
		EffectVariable = 0,
		Gear = true,
		Equippant = "Morph Magic",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nAfter this fighter attacks: Destroy it, then summon a Green fighter that costs 1 extra stud than it. Attach this card to it.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"GearOwner"
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "Destroy", 30, "Self" },
						{ "RandomSummon", "Green Fighter VariableorExactCost", "Ally" },
						{ "EquipGear", "Equippant", "SummonedCard" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Keep pulling from the lootbox of fate and you're bound to live a good life eventually.\"\n— Thyyrinyr"
	},
	["The Putrid Gnat"] = {
		Id = 76585831937162,
		Name = "The Putrid Gnat",
		AltCards = {
			["The Putrid Gnat-Preview"] = {
				Id = 78001150297298,
				Name = "The Putrid Gnat",
				AttackEffect = "Jab",
				Bio = "",
				PackDisplayOverride = "Doomspire Act 2 Preview Event"
			},
			["Aeonite Progeny-Sun"] = {
				Id = 113880306859683,
				Name = "Volleyball",
				Bio = "It's been a while, hasn't it? I'm still stuck here, anchored in the air. Try as you might, I am frozen in place. You want to play some cards?"
			}
		},
		Health = 50,
		Power = 50,
		Rarity = "Epic",
		AttackEffect = "Bite",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		EffectVariable = 0,
		Continued = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Twice each turn, whenever an allied fighter dies: Summon a fighter card that costs 8 or less total studs from your graveyard except it's zombified, then it loses 270748344 Health.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_8OrLower", "GraveZone_Ally", "Field_Ally", true, false, 1 }
						},
						{ "PierceDamage", 270748344, "SummonedCard" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "Fighter", "RandomCard" }
					},
					MetaData = { Zombified = true },
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "\"Grandmother... Surely even you have limits on how much you'll cling onto an awful life?\"\n— The Sacrifice"
	},
	["Faith Restored"] = {
		Id = 126816366530751,
		Name = "Faith Restored",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 10 },
		EffectVariable = 0,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills your opponent unless they cast a Technician to repair it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Select 1 effect:\n{C1} Destroy 2 target fighters.\n{C2} Put a Cosmic Crack into each players' baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Faith Restored-C1", "Faith Restored-C2" },
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
		Bio = "\"I would strike down the skybox itself if it meant protecting my gorgeous Nikolaevich.\"\n— Alexandra Feodorovna, the Sacrifice"
	},
	["Faith Restored-C1"] = {
		Id = 119109215629953,
		Name = "Nothing Lasts",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 12 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy 2 target fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "Single" },
						{ "Destroy", 30, "Single" }
					},
					Target = "Ally",
					UniqueTargets = true
				}
			}
		},
		Bio = "\"We are like caterpillars, contemplating pupation yet never committing. We are attached to the life we'll leave behind.\""
	},
	["Faith Restored-C2"] = {
		Id = 125854182105910,
		Name = "Yet Nothing Is Lost",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 12 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Cosmic Crack into each players' baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 },
							"Opponent"
						},
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"No longer will I chew on the cabbage leaves, no longer will I spend my time moving around on the underside of the foliage!\""
	},
	["Alexandra Feodorovna"] = {
		Id = 95778791276453,
		Name = "Alexandra Feodorovna",
		AltCards = {
			EncoreUma = {
				Id = 134903240853620,
				Name = "Encore!!!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 609,
				Bio = "The show's over? WHO DECIDED THAT!!!"
			},
			["Zombie King, The Revived"] = {
				Id = 116559688266165,
				Name = "Zombie King, The Revived",
				Commissioner = { "jasp1108" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 688,
				Bio = "\"The dead shall rise to aid my never-ending conquest, and the living shall meet their unending doom.\""
			}
		},
		Health = 400,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Green = 2, Neutral = 2 },
		EffectVariable = 0,
		Rank = 9,
		Archetype = "Candidate",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Obliterate all enemy ranked fighters.\nWhenever this card is cast or attacks: Until the end of your turn, allied fighters can't die or be destroyed.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Ranked", "Field_Opponent", "nil", true, false, 999 },
							"Self"
						},
						{ "BypassCardDeath", 1 }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "HasPassive",
						Modifier = "Rank",
						SubModifier = true
					}
				},
				OnAttack = {
					Power = { { "BypassCardDeath", 1 } },
					Target = "Ally"
				}
			}
		},
		IsMentoring = true,
		Bio = "\"I WILL see my son again.\""
	},
	["Body Without Organs"] = {
		Id = 96580581835723,
		Name = "Body Without Organs",
		Health = 100,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		CustomReminderImagine = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach a Dreamshield to a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Imaginary Token", "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"The pure unconsciousness of a body, liberated from the shackles of organisation. The basis of all qualiaform and my paint.\"\nThe Sacrifice stared at the art\" of the Shedarian \"corpse,\" and the Auteur laughed.\n\"Fictoids make excellent paint.\""
	},
	["Staff of Gloomy Grip"] = {
		Id = 133003376447702,
		Name = "Staff of Gloomy Grip",
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = 200,
		AddPower = 200,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Blue",
		Cost = { Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever this fighter attacks: Unlock a target fighter, then lock it for 1 turn.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Unlock", 9999, "Single" },
						{ "Lock", 1, "Single" }
					},
					Target = "Single",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"The temerity of the doomspire to manifest my mother's dead religion against us!\"\n— The Auteur"
	},
	Kralosa = {
		Id = 73700460409200,
		Name = "Kralosa",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Terrain = true,
		Archetype = "Planet",
		Terrariant = "PandnotP",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is destroyed from play: Lock a target fighter for 1 turn.\nWhen there's 4 or more differently named gear in your graveyard: Draw 2 cards, then destroy this card.",
			Ability = {
				OnDeath = {
					Power = { { "Lock", 1, "Single" } },
					Target = "Opponent"
				},
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "UniqueName", "Gear" },
							"Self"
						},
						{ "EVGreaterValueCheck", 3, "Self" }
					},
					Target = "Opponent",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 2, "Ally" },
						{ "Destroy", 30, "Self" }
					},
					Target = "Ally",
					TotalTriggerLimit = 1
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "The world as seen through intuition and abstraction."
	},
	["Queen's Guard"] = {
		Id = 98145166261010,
		Name = "Queen's Guard",
		Health = 700,
		Power = 900,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 7 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks, if you've cast a gear this turn: Lock a target fighter for 1 turn.",
			Ability = {
				OnAttack = {
					Power = { { "Lock", 1, "Single" } },
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Me", 1, 9999, "CastGear" }
				}
			}
		},
		Bio = "\"I'm grateful my guards were still useful for my children.\" Wonktooth scoffed at his mother. \"Useful's a bit of a stretch given they let you in, dude!\""
	},
	["Dark Spellbook of the Forgotten"] = {
		Id = 101545967034879,
		Name = "Dark Spellbook of the Forgotten",
		AltCards = {
			["Dark Spellbook of the Forgotten-Preview"] = {
				Id = 74987365480857,
				Name = "Dark Spellbook of the Forgotten",
				AttackEffect = "Jab",
				Bio = "",
				PackDisplayOverride = "Doomspire Act 2 Preview Event"
			},
			["Dark Spellbook of the Forgotten-Mango"] = {
				Name = "stick",
				Id = 94594036590107,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"w͆͗̂͆̏h̳͎́͝͞y̨̫̱̦̓_̗̗̼̅ͩ\""
			}
		},
		Health = 0,
		Power = 0,
		Gear = true,
		AddHealth = 0,
		AddPower = 0,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		EffectVariable = 0,
		Rank = 9,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever this fighter attacks and destroys another: Trigger the effects of all allied fighters that trigger when they're cast.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "ForceTrigger", "OnSummon", "Ally" },
						{ "ForceTrigger", "OnAllySummon", "Ally" },
						{ "ForceTrigger", "OnAnySummon", "Ally" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Losing their queen to sanity, the forgotten pious adherents of Shedare's cult of noumenality evangelised both Shedarian and alien alike."
	},
	["Drop the Ocean"] = {
		Id = 99315747046572,
		Name = "Drop the Ocean",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 4 },
		EffectVariable = 0,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "All fighters gain haste and 200 power. Return them to their hand.\nPut a Cosmic Crack into your baseplate.\nYou can't cast unranked cards this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Charge", "All" },
						{ "Strengthen", 200, "All" },
						{ "Return", 30, "All" },
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 },
							"Ally"
						},
						{
							"SetCastRestriction",
							{
								{ "Ranked" },
								"You can't cast unranked cards this turn."
							},
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Kralosa's ocean fused with reality, forcing the Tainted to repair his field notes and the Purifier to take a bath."
	},
	["Retcon Reality"] = {
		Id = 112992541049233,
		Name = "Retcon Reality",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Blue = 6, Neutral = 3 },
		Lunar = true,
		EffectVariable = 0,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		AddGenZoneant = "Cosmic Crack",
		Effect = {
			Name = "Reincarnation",
			Description = "Attach a gear to a target fighter that steals it until a card leaves your baseplate.\nPut a Cosmic Crack into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EquipGear", "Central Fiction" },
						{ "Steal" },
						{
							"AddGenZone",
							{ "AddGenZoneant", 1 },
							"Ally"
						}
					},
					Target = "Single"
				}
			}
		},
		Bio = "The Code that binds the Technicians to the Spire took a regular and alien mind working together to unlock."
	},
	["Central Fiction"] = {
		Id = 102148713431642,
		Name = "Central Fiction",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 0,
		Gear = true,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever a card leaves your baseplate: Your opponent steals this fighter.",
			Ability = {
				OnAllyGenZoneRemove = {
					Power = { { "OpponentSteal", 30, "GearOwner" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	["Viktor Shklovsky"] = {
		Id = 116104742636685,
		Name = "Viktor Shklovsky",
		AltCards = {
			["RoboLoleris, The Timeless"] = {
				Id = 107401020969189,
				Name = "RoboLoleris, The Timeless",
				AttackEffect = "Minigun",
				AltArt = true,
				PremiumArt = 631,
				Bio = "Even in the future, you just can't stop a mad murderer.<br/>(HatredsOfPerfected was here)"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "SoulSyphon",
		Color = "Neutral",
		Cost = { Blue = 2, Neutral = 2 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Rank = 9,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast your first action or gear each turn, if it's not fleeting: Attach a copy of it to this card. Then give yourself a copy of each attached card, except they're fleeting.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "ForceTrigger", "OnEVCheckPass" }
					},
					Target = "Self",
					HasntPassive = "Fleeting",
					NoBlip = true
				},
				OnAllyCastGear = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "ForceTrigger", "OnEVCheckPass" }
					},
					Target = "Self",
					HasntPassive = "Fleeting",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "EquipGear", "Variable" },
						{ "AddCopy", 30, "SelfGear" }
					},
					Target = "Self",
					MetaData = { Fleeting = true },
					TurnTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = "\"Art is the experience of the artfulness of an object; The object is not important.\""
	},
	["Evangel of Justice"] = {
		Id = 106553836343578,
		Name = "Evangel of Justice",
		AltCards = {
			["Justice Cyclist"] = {
				Id = 75891391633610,
				Name = "Justice Cyclist",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 761,
				Bio = ""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Charge = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Move all gear from a target fighter onto it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"MoveGear",
							{ "Variable", "All" },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "The most diehard fans of the Warriors of Justice became stronger advocates for their ideals than the warriors ever were. Merchandise is just that strong."
	},
	["Anguishing Assembly"] = {
		Id = 115658893139280,
		Name = "Anguishing Assembly",
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		CustomReminderSpiral = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: It spirals 4 times. It can't spiral into a gilmuraig this way.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "GilmuraigImmune", "Self" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" },
						{ "RemovePassive", "GilmuraigImmune", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The crowd is often hypnotised by their leaders."
	},
	["Interdomain Interloper"] = {
		Id = 123286483045958,
		Name = "Interdomain Interloper",
		AltCards = {
			["Dom Quixote"] = {
				Id = 78026007067172,
				Name = "Dom Quixote",
				Commissioner = { "Dominus520" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 729,
				Bio = "Manager Esquire!!!!!"
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Axe",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select an Emotion and give yourself it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{ "Wrath", "Depression", "Greed", "Envy" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			CreateAllAsChoices = true,
			HideAdd = true
		},
		Bio = "\"I know my wife is out there decorated in scales and wings. Why would I have such vivid memories of someone who never existed?\"\n— Blackmoore"
	},
	["Amalgam of Wretches"] = {
		Id = 76584217021398,
		Name = "Amalgam of Wretches",
		Health = 800,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 5, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card is cast or attacks: It spirals. Select a card in your opponent's hand. Shuffle it into their deck, then they draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "SpecificDiscard", 1, "CustomZoneTarget" },
						{ "Draw", 1, "Opponent" },
						{ "Spiral" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = {},
						SelectionDescription = "a card from your opponent's hand"
					}
				},
				OnAttack = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "SpecificDiscard", 1, "CustomZoneTarget" },
						{ "Draw", 1, "Opponent" },
						{ "Spiral" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = {},
						SelectionDescription = "a card from your opponent's hand"
					}
				}
			},
			EffectSpecificDiscardShuffle = true,
			EffectSpecificDiscardShuffleTarget = "Opponent"
		},
		Bio = "\"If this is your idea of justice, we shall be the evil that destroys it!\"\n— Gyesta and Jyoheil"
	},
	Traumadumping = {
		Id = 134240079750740,
		Name = "Traumadumping",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Yellow = 12, Neutral = 3 },
		EffectVariable = 0,
		Rank = 6,
		Summonant = "Pure Violence",
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy a target fighter, replacing it with 4 unlocked 200/200 copies of that fighter. One of them is traumatised, spiralling all allied fighters into gilmuraigs when targeted.\nYou can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex" },
							"Single"
						},
						{ "EditSummonant", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "IsOwnedByAlly" },
							"Single"
						},
						{
							"EVExactValueCheck",
							{ 1, "TargetIsOwnedByAlly" }
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
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
						{ "EVGreaterValueCheck", 1 },
						{ "Destroy", 30, "Single" },
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
				OnEVCheckFailTargetIsOwnedByAlly = {
					Power = { { "GivePassive", "AllySwitch" } },
					Target = "Self",
					NoBlip = true
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
						{ "Summon", "Summonant", "AllySwitch" },
						{ "Unlock", 9999, "SummonedCard" },
						{ "EquipGear", "Evil Trauma Token", "SummonedCard" }
					},
					Target = "Self",
					NoBlip = true,
					MetaData_Summon = { Health = 200, Power = 200 }
				},
				OnEVCheckFail = {
					Power = {
						{ "Summon", "Summonant", "AllySwitch" },
						{ "Unlock", 9999, "SummonedCard" },
						{ "EquipGear", "Trauma Token", "SummonedCard" }
					},
					Target = "Self",
					NoBlip = true,
					MetaData_Summon = { Health = 200, Power = 200 }
				}
			}
		},
		Bio = "Tormented by fiction, the Auteur exacted revenge on what he perceived as Winona's tormentors."
	},
	["Trauma Token"] = {
		Id = 70463392358105,
		Name = "Nihilism?",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		Fading = true,
		AddHealth = 0,
		AddPower = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever an effect targets this fighter: Obliterate this gear. If it's traumatised, all allied fighters spiral into gilmuraigs.",
			Ability = {
				OnTarget = {
					Power = { { "DestroyGear", "Trauma Token", "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "The end is never the end is never the end."
	},
	["Evil Trauma Token"] = {
		Id = 70463392358105,
		Name = "Nihilism?",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Gear = true,
		Fading = true,
		AddHealth = 0,
		AddPower = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever an effect targets this fighter: Obliterate this gear. If it's traumatised, all allied fighters spiral into gilmuraigs.",
			Ability = {
				OnTarget = {
					Power = {
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The end is never the end is never the end."
	},
	["Pure Violence"] = {
		Id = 111005229069306,
		Name = "Pure Violence",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Yellow = 3, Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "SOON:tm:",
			Ability = {
				Null = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"MoveGear",
							{ "Variable", "All", true, true },
							"AllyTerrain"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Absorb Emotion"] = {
		Id = 76530622347942,
		Name = "Absorb Emotion",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		EffectVariable = 0,
		Addant = "Unleash Emotion",
		Effect = {
			Name = "Reincarnation",
			Description = "Move all gear that were originally gear on all fighters onto your terrain.\nGive yourself 3 copies of a card that copies those gears onto a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"AllyTerrain"
						},
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "EVExactValueCheck", 1000 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { {
						"MoveGear",
						{ "Variable", "All", true },
						"All"
					} },
					Target = "Ally",
					NoBlip = true,
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			},
			OnlyOriginalGears = true
		},
		Bio = "\"Fiction exists as a compression of pure emotion. It exists to suffer so we don't have to.\"\n— The Auteur"
	},
	["Unleash Emotion"] = {
		Id = 96452381206210,
		Name = "Unleash Emotion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Yellow = 3, Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach a copy of all gear on your terrain onto a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"MoveGear",
							{ "Variable", "All", true, true },
							"AllyTerrain"
						}
					},
					Target = "Self",
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "\"If the existential despair of an entire domain won't cause Nyarlhotep to spiral out of its body, nothing will.\"\n— The Auteur"
	},
	["Winona, Real Hero"] = {
		Id = 83243542767261,
		Name = "Winona, Real Hero",
		AltCards = {
			["The Full Moons Chosen"] = {
				Id = 135837258770528,
				Name = "The Full Moons' Chosen",
				Commissioner = { "PeriSheep" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 733,
				Bio = ""
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: You may obliterate each fighter with the highest total stud cost.",
			Ability = {
				OnConfirm = {
					Power = { { "Obliterate" } },
					Target = "HighestCost"
				},
				OnSummon = {
					Power = { {
						"ConfirmPrompt",
						{ "To obliterate each fighter with the highest total stud cost" },
						"Ally"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "For once, the fiction warrior's crowning achievement became utterly real."
	},
	["Wraiths of Injustice"] = {
		Id = 96294497407899,
		Name = "Wraiths of Injustice",
		Health = 700,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "StalkerScratch",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter is cast: It loses 150 Power. Then each fighter with the least power spirals twice.",
			Ability = {
				OnAnySummon = {
					Power = {
						{ "Weaken", 150, "Aggressor" },
						{ "Spiral" },
						{ "Spiral" }
					},
					Target = "LowestPower"
				}
			}
		},
		Bio = "Reality became fiction, good became evil, heroes became villains, monsters became saviours."
	},
	["Dmitri Shostakovich"] = {
		Id = 93420052499012,
		Name = "Dmitri Shostakovich",
		AltCards = {
			["Haunted Doge Head-Alt"] = {
				Id = 94389053115426,
				Name = "Haunted Doge Head",
				Spiralant = "Dmitri Cheryomushki-Doge",
				DeathAnimation = "DogeGone",
				SummonAnimation = "DogeBark",
				AttackEffect = "Bite",
				AltArt = true,
				PremiumArt = 643,
				Bio = "Such Aging. Many Wrinkles. "
			}
		},
		Health = 1200,
		Power = 250,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		Archetype = "Candidate",
		Spiralant = "Dmitri Cheryomushki",
		Rank = 9,
		CustomReminder = {
			["Dmitri Cheryomushki"] = "A 1200/1200. While in play, allied fighters can't spiral into gilmuraigs. Once each turn, whenever a gear is attached to this card: Summon a 500/500 Noob. All allied fighters spiral 6 times."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All allied fighters spiral.\nIf this card would spiral into a Gilmuraig, he transcends into Dmitri Cheryomushki instead.",
			Ability = {
				OnEnd = {
					Power = { { "Spiral" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"I can't take it! This world does nothing but beat me senseless! Why can't I live a normal, decent life?!\""
	},
	["Dmitri Cheryomushki"] = {
		Id = 92684000485257,
		Name = "Dmitri Cheryomushki",
		AltCards = {
			["Dmitri Cheryomushki-Doge"] = {
				Id = 116584529752782,
				Name = "Haunted Doge, The Nostalgic",
				Summonant = "NoobHaunted",
				DeathAnimation = "DogeGone",
				SummonAnimation = "DogeBark",
				AttackEffect = "Flame",
				Bio = "Much Power. Such Nostalgia. Very Haunted."
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		GilmuraigBypass = true,
		Summonant = "NoobEvil",
		Effect = {
			Name = "Reincarnation",
			Description = "While in play, allied fighters can't spiral into gilmuraigs.\nOnce each turn, whenever a gear is attached to this card: Summon a 500/500 Noob. All allied fighters spiral 6 times.",
			Ability = {
				OnEquipGear = {
					Power = {
						{ "Summon", "Summonant", "CardOwner" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" },
						{ "Spiral" }
					},
					Target = "CardOwnerField",
					TurnTriggerLimit = 1,
					MetaData = { Health = 500, Power = 500 }
				}
			}
		},
		Bio = "\"Because I finally understand how much this world's suffered; I finally understand to shoulder its burdens.\""
	},
	["Erase from Existence"] = {
		Id = 97495706118615,
		Name = "Erase from Existence",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a card in your opponent's graveyard. Obliterate all copies of it in their graveyard, hand and deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Opponent", "nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "Deck_Opponent", "nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "Hand_Opponent", "nil", true, false, 999 },
							"Self"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = {},
						SelectionDescription = "a card in your opponent's graveyard."
					}
				}
			},
			DontCheckArchetype = true
		},
		Bio = "\"Ain't it convenient,\" scowled the Tainted, \"that the only weapon that can hurt a Technician was given to you by one?\"\n\"It's convenient you have a small child besides you each time I wish you were headless.\""
	},
	["Blatant Superiority"] = {
		Id = 125489710932663,
		Name = "Blatant Superiority",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Neutral",
		Cost = { Green = 1 },
		Effect = {
			Description = "Obliterate a target fighter that costs 2 or fewer total studs.\nYou gain 200 life.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Obliterate" },
						{ "Cost", -200 }
					},
					Target = "Single",
					TargetSubModifier = "CustomMod 2OrLower",
					TargetSubModifierDescription = "a fighter that costs 2 or fewer total studs."
				}
			}
		},
		Bio = "\"If they're stupid enough to run into the Technicians, they weren't going to be much help in the invasion anyway.\"\n— Nethercreep"
	},
	["Befriend God"] = {
		Id = 76930878407458,
		Name = "Befriend God",
		AltCards = {
			["Befriend God-UGC"] = {
				Id = 122737426012356,
				AttackEffect = "Jab",
				PackDisplayOverride = "Immortal Sword: Al Daght UGC Purchase (In-Game)",
				Bio = "The schemes of man and god, etched forever into history."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Choose a target allied and target enemy fighter. If you do, attach 2 Dreamshields to both of them.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "Ally" },
							"SingleAlly"
						},
						{
							"EVExactValueCheck",
							{ 0, "SelectAlly" }
						}
					},
					Target = "Self"
				},
				OnEVCheckFailSelectAlly = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "Enemy" },
							"SingleEnemy"
						},
						{
							"EVExactValueCheck",
							{ 0, "SelectEnemy" }
						}
					},
					Target = "Self"
				},
				OnEVCheckFailSelectEnemy = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", 0, "Ally" },
							"Self"
						},
						{ "EquipGear", "Imaginary Token", "EVCard" },
						{ "EquipGear", "Imaginary Token", "EVCard" },
						{
							"AlterEV",
							{ "Load", "Math", 0, "Enemy" },
							"Self"
						},
						{ "EquipGear", "Imaginary Token", "EVCard" },
						{ "EquipGear", "Imaginary Token", "EVCard" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Ｉｔ'ｓ ｕｎｆｏｒｔｕｎａｔｅ ｔｈａｔ ｔｈｉｓ ｈｕｍｂｌｅ ｏｎｅ'ｓ third ｆａｖｏｕｒｉｔｅ ｃａｎｄｉｄａｔｅ ｍａｙ ｂｅ ｉｔｓ ｍｏｓｔ loyal."
	},
	["Fraying Pipes"] = {
		Id = 139033027005814,
		Name = "Fraying Pipes",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Reveal your opponent's hand and select a non-starter card in it. Add {W}{W}{W}{W} to its cost.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{
							"IncreaseCost",
							{ 4, "Neutral" },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = { NotMatchesParameter = "Starter" },
						SelectionDescription = "a non-starter card to increase the cost of",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "Ｓｃｒａｐｅ，　Ｇｒｉｎｄ，　Ｃｒｅａｋ，　Ｒａｔｔｌｅ，　Ｗｈｉｎｅ，　Ｓｈｒｉｅｋ．"
	},
	["Logic Explosion"] = {
		Id = 133935142015066,
		Name = "Logic Explosion",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		CustomReminder = { ["P^¬P"] = "Do both if both conditions are true at the same time." },
		Effect = {
			Name = "Reincarnation",
			Description = "If your hand has 4 or fewer cards in it, a target fighter gains 350 Health.\nIf your hand has 5 or more cards in it, a target fighter gains 350 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4, "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 350, "Single" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{ "Heal", 350, "Single" },
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 4, "LogicExplosion" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEVCheckPassLogicExplosion = {
					Power = { { "Strengthen", 350, "Single" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Reality is one giant plothole, and I am the scathing critic!\"\n— The Auteur"
	},
	["Whalesong Shield"] = {
		Id = 135213223975732,
		Name = "Whalesong Shield",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrain = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter attacks you directly: Obliterate it and this terrain. Search your deck for a Colourless fighter card.",
			Ability = {
				OnEnemyStrike = {
					Power = {
						{ "Obliterate", 30, "Aggressor" },
						{ "RandomTutorfor", "Neutral Fighter" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"The Purifier was amused realising why he obtained the katana.\nThe Tainted was scared of why a Technician would want to kill their own.\nThe Tainted was scared of why the Purifier would want to join in.\""
	},
	["Victim of the Xenoqualia"] = {
		Id = 70837345780388,
		Name = "Victim of the Xenoqualia",
		Health = 300,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "SoulDrain",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		StarterCard = true,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Put a Cosmic Crack into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Cosmic Crack", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Shedare's attempts to innoculate her people against the realisation of their fictional nature fell on deaf ears."
	},
	["The Noumenon"] = {
		Id = 132098247114698,
		Name = "The Noumenon",
		AltCards = {
			["The Noumenon-Preview"] = {
				Id = 136930876496189,
				Name = "The Cage",
				Terrariant = "PandnotP-Gift",
				AttackEffect = "Jab",
				PackDisplayOverride = "Doomspire Act 2 Preview Event",
				Bio = "Just outside the window I see an array of colors, a rainbow in December? The sound of my phone buzzing from the people hanging on my wall. How long have I not been breathing? Stuck in the state of Sorrow so strong I made everything around feel the exact same."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Terrariant = "PandnotP",
		Terrain = true,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		Archetype = "Planet",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast or destroyed from play: Put a Cosmic Crack into your baseplate.\nOnce each turn, whenever a card leaves your baseplate: Draw a card.",
			Ability = {
				OnDeath = {
					Power = { {
						"AddGenZone",
						{ "Cosmic Crack", 1 }
					} },
					Target = "Ally"
				},
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Cosmic Crack", 1 }
					} },
					Target = "Ally"
				},
				OnAllyGenZoneRemove = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The world as it truly is, free of perception and of doubt."
	},
	["Materialism Under Fire"] = {
		Id = 94791635792354,
		Name = "Materialism Under Fire",
		Health = 50,
		Power = 3050,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 4, Green = 4 },
		EffectVariable = 0,
		Rank = 9,
		Archetype = "Technician",
		CustomReminderImagine = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Obliterate the top 5 cards in your graveyard and all gear attached to this card. If you do, attach 3 Dreamshields to this card. If you can't, destroy this card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "DestroyGear", "All", "Self" },
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4, "Self" }
					},
					Target = "Ally",
					GearDontAddToGraveyard = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Target = "Self",
					MetaData_EquipGear = { Imagined = true, Fading = true },
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"CustomTarget"
						},
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{ "EquipGear", "Imaginary Token", "Self" }
					},
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckFail = {
					Power = { { "Destroy", 30, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "The Alpha Brick's ontology stopped being a complete descripton of its world."
	},
	["The Ratcatcher"] = {
		Id = 123075299755659,
		Name = "The Ratcatcher",
		AltCards = {
			["free between the trees"] = {
				Id = 80897514889536,
				Name = "free.between.the.trees",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 656,
				Bio = "sometimes the woods are the only place that can hold a secret"
			}
		},
		Health = 950,
		Power = 2250,
		Rarity = "Uncommon",
		AttackEffect = "Scythe",
		Color = "Neutral",
		Cost = { Neutral = 4, Red = 4 },
		EffectVariable = 0,
		Overload = true,
		Rank = 9,
		Archetype = "Technician",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach all fighters with 250 or less health to it.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "Destroy", "CustomTarget" } },
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "NotHealth",
						Modifier = 250
					}
				},
				MultiSelectOperationDestroy = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "EquipGear", "Variable", "Self" },
						{ "Obliterate", 30, "Aggressor" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Although it stealthily aids the Candidates, removing difficult obstacles as they descend to the baseplate of the doomspire, it can't help but question why Nyarlhotep would command such a thing."
	},
	["Gatekeeper of Entropy"] = {
		Id = 139568613662069,
		Name = "Gatekeeper of Entropy",
		Health = 1650,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4, Yellow = 4 },
		EffectVariable = 0,
		Overload = true,
		Rank = 9,
		Archetype = "Technician",
		CustomReminder = {
			["Nyarlhotep's Gamerules"] = "Players lose studs during their end step.\nPlayers can baseplate only once each turn.\nPlayers can't be attacked if they have a fighter in play.\nPlayers can't have more than 10 cards in hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Attach a gamerule to it. Delete the gamerule when the attached fighter dies.",
			Ability = {
				OnSummon = {
					Power = { {
						"RandomEquipGear",
						{
							"Stairway's Reincarnation",
							"Toolbox's Creativity",
							"Justice's Nihilism",
							"Shedare's Abstraction"
						},
						"Self"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "The Technicians screamed their whalesong for Nyarlhotep's orders in cleaning the chaos; The only reply was quiet satisfaction."
	},
	["Stairway's Reincarnation"] = {
		Id = 105461514790387,
		Name = "Stairway's Reincarnation",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Players lose studs during their end step.\nWhen the fighter this is attached to dies: Delete this rule.",
			Ability = {
				OnDeath = {
					Power = { {
						"ModifyBattleRule",
						{ "NoStudReset", true }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Disregard's domainrule reincarnates people when they die, never intending to reincarnate inanimate people."
	},
	["Toolbox's Creativity"] = {
		Id = 87974712887304,
		Name = "Toolbox's Creativity",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Players can baseplate only 1 card each turn.\nWhen the fighter this is attached to dies: Delete this rule.",
			Ability = {
				OnDeath = {
					Power = { {
						"ModifyBattleRule",
						{ "NoBaseplateLimit", true }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Imperium Ultima's domainrule allows the Toolbox to create whatever people desire, never intending to satisfy their exacting standards."
	},
	["Justice's Nihilism"] = {
		Id = 102393425789062,
		Name = "Justice's Nihilism",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Players can't be attacked if they have a fighter in play.\nWhen the fighter this is attached to dies: Delete this rule.",
			Ability = {
				OnDeath = {
					Power = { {
						"ModifyBattleRule",
						{ "IgnoreFighterBlocking", true }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Justice City's domainrule amplifies emotions to a monstrous scale so heroes can save the day, never intending those same heroes to be the monsters."
	},
	["Shedare's Abstraction"] = {
		Id = 117493986859759,
		Name = "Shedare's Abstraction",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Players have a maximum hand size of 10.\nWhen the fighter this is attached to dies: Delete this rule.",
			Ability = {
				OnDeath = {
					Power = { {
						"ModifyBattleRule",
						{ "MaxHandSize", 999 }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Kralosa's domainrule abstracts people as they descend into its depths, never expecting people to understand the madness therein."
	},
	["Ghashendex's Mole"] = {
		Id = 118553363929852,
		Name = "Ghashendex's Mole",
		Health = 2250,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 4, Blue = 4 },
		EffectVariable = 0,
		CustomReminder = {
			["Mindbroken Commands"] = "Deprive - Discard a card.\nAnnihilate - An enemy fighter dies.\nEnhance - An allied effect targets."
		},
		Rank = 9,
		Archetype = "Technician",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Return this card to its hand if there's a command attached to it. Otherwise attach 3 commands to this card and draw a card.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EquippedArchetypeCount", "Command" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "Return" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"RandomEquipGear",
							{ "Offload()", "Terminate()", "Reinforce()" },
							"Self"
						},
						{
							"RandomEquipGear",
							{ "Offload()", "Terminate()", "Reinforce()" },
							"Self"
						},
						{
							"RandomEquipGear",
							{ "Offload()", "Terminate()", "Reinforce()" },
							"Self"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "4000 years of obeying Code without question had made Telamon's victims rather pliable to manipulation."
	},
	["Offload()"] = {
		Id = 72200369164621,
		Name = "Deprive()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Archetype = "Command",
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard a card, if this is the oldest Command on this fighter: It gains 50 health and power. Destroy this gear.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "IsOldestEquippedArchetypedGear", "Nil" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 50, "GearOwner" },
						{ "Heal", 50, "GearOwner" },
						{ "Destroy" }
					},
					Target = "Self",
					NoGearTargetMod = true
				}
			}
		},
		Bio = "\"Stop the domains breaking. Repair the phenom tubes; Prevent cataclysm.\""
	},
	["Terminate()"] = {
		Id = 94573990558328,
		Name = "Annihilate()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Archetype = "Command",
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an enemy fighter dies, if this is the oldest Command on this fighter: It gains 50 health and power. Destroy this gear.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "IsOldestEquippedArchetypedGear", "Nil" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 50, "GearOwner" },
						{ "Heal", 50, "GearOwner" },
						{ "Destroy" }
					},
					Target = "Self",
					NoGearTargetMod = true
				}
			}
		},
		Bio = "\"Find the red-armoured brute. Read its mind, break its brain.\""
	},
	["Reinforce()"] = {
		Id = 103678752656697,
		Name = "Enhance()",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectVariable = 0,
		Archetype = "Command",
		TokenOmni = true,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied effect targets, if this is the oldest Command on this fighter: It gains 50 health and power. Destroy this gear.",
			Ability = {
				OnAllyTarget = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "IsOldestEquippedArchetypedGear", "Nil" },
							"GearOwner"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 50, "GearOwner" },
						{ "Heal", 50, "GearOwner" },
						{ "Destroy" }
					},
					Target = "Self",
					NoGearTargetMod = true
				}
			}
		},
		Bio = "\"Stall for time, allow the Ark time to manifest.\""
	},
	["Worlds Collide"] = {
		Id = 78771717384991,
		Name = "Worlds Collide",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 3, Red = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["Cosmic Crack"] = "A self duplicating card that kills you. Cast a Technician to repair it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 500 damage to all fighters.\nPut a Cosmic Crack into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 500, "All" },
						{
							"AddGenZone",
							{ "Cosmic Crack", 1 }
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Deidre was rightfully furious at the domains fusing together; Her fourth mansion was bulldozed by a shedarian orphanage."
	},
	["Emergency Repairs"] = {
		Id = 89062466845474,
		Name = "Emergency Repairs",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy your baseplate, then select up to that many cards in your deck. Put them into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "All", "Nil" },
							"Self"
						},
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
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GenZone_Ally", false, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = {},
						SelectionDescription = "Cards from your deck to move to your baseplate",
						MinTargets = 0,
						MaxTargets = "Variable"
					}
				}
			}
		},
		Bio = "While incapable of feeling emotions, the technicians unaimously desired to feel rage at how difficult the clayfestation was making their job."
	},
	["Disintegrating Stud"] = {
		Id = 126935533433738,
		Name = "Disintegrating Stud",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Archetype = "Studling",
		Effect = {
			Name = "Reincarnation",
			Description = "Select a colour.\nPut 2 copies of that colour's stud into your baseplate. Ban yourself when you cast a card of that colour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CreateChoices",
							{
								"Evil Blue Stud",
								"Evil Red Stud",
								"Evil Green Stud",
								"Evil Yellow Stud"
							}
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{
							"AddGenZone",
							{ "Variable", 2 }
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "Color",
						Modifier = "Variable"
					}
				}
			},
			CreateAllAsChoices = true
		},
		Bio = "The Systems Collapse made studs both exist and not exist, every colour and no colour, real and not real, fun and unfun."
	},
	["Evil Blue Stud"] = {
		Id = 5832341521,
		Name = "Ｉｎｔｅｌｌｉｇｅｎｃｅ ｗｉｔｈｏｕｔ Ｗｉｓｄｏｍ",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Blue",
		Archetype = "Studling",
		Cost = { Blue = 1 },
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever you cast a Blue card: Ｂａｎ ｙｏｕｒｓｅｌｆ．",
			Type = "OnAnyAllyCast",
			Power = { { "Cost", 999999999 } },
			Target = "Self",
			Color = "Blue"
		},
		Bio = "Ｌｏｏｋ ａｔ ｕｓ Ｔｅｃｈｎｉｃｉａｎｓ， ｗｉｔｈ technology ｔｏ ｃｒｅａｔｅ ａｒｂｉｔｒａｒｙ ｒｅａｌｉｔｉｅｓ． Ｄｉｄ ｓｕｃｈ ｉｎｇｅｎｕｉｔｙ ｍａｋｅ ｕｓ happy？"
	},
	["Evil Yellow Stud"] = {
		Id = 5832440157,
		Name = "Ｐｌｅａｓｕｒｅｓ ｉｎｔｏ Ｖｉｃｅ",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Yellow",
		Archetype = "Studling",
		Cost = { Yellow = 1 },
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever you cast a Yellow card: Ｂａｎ ｙｏｕｒｓｅｌｆ．",
			Type = "OnAnyAllyCast",
			Power = { { "Cost", 999999999 } },
			Target = "Self",
			Color = "Yellow"
		},
		Bio = "Ｅｍｐａｔｈｙ ｉｓ ａ curse ｂｒａｎｄｅｄ ｔｏ ｕｓ ｓｏ ｗｅ＇ｄ ｒｅｃｏｇｎｉｓｅ ｏｕｒ ｅｎｄｌｅｓｓ suffering．"
	},
	["Evil Red Stud"] = {
		Id = 5689045240,
		Name = "Ｄｏｍｉｎｉｏｎ ｆｏｒ Ｄｏｍｉｎｉｏｎ＇ｓ Ｓａｋｅ",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Red",
		Archetype = "Studling",
		TriggerInGenZone = true,
		Cost = { Red = 1 },
		Effect = {
			Description = "Whenever you cast a Red card: Ｂａｎ ｙｏｕｒｓｅｌｆ．",
			Type = "OnAnyAllyCast",
			Power = { { "Cost", 999999999 } },
			Target = "Self",
			Color = "Red"
		},
		Bio = "Ｔｈｅ ｐｏｗｅｒｌｅｓｓ ｂｅｇ ｆｏｒ ｐｏｗｅｒ； Ｔｈｅ ｐｏｗｅｒｆｕｌ ｂｅｇ ｔｏ ｂｅ powerless．"
	},
	["Evil Green Stud"] = {
		Id = 5832365495,
		Name = "Ａｎ Ｅｔｅｒｎｉｔｙ Ｔｅｒｍｉｎａｌｌｙ Ｉｌｌ",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Green",
		Archetype = "Studling",
		TriggerInGenZone = true,
		Cost = { Green = 1 },
		Effect = {
			Description = "Whenever you cast a Green card: Ｂａｎ ｙｏｕｒｓｅｌｆ．",
			Type = "OnAnyAllyCast",
			Power = { { "Cost", 999999999 } },
			Target = "Self",
			Color = "Green"
		},
		Bio = "Ｗｈｙ ａｒｅ ａｌｌ ｏｕｒ descendents ｓｕｆｆｅｒｉｎｇ ｆｏｒ Ｔｅｌａｍｏｎ＇ｓ ｏｒｉｇｉｎａｌ crime？"
	},
	["Sycophant to Deity"] = {
		Id = 83609749146458,
		Name = "Sycophant to Deity",
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if the total baseplate rank of allied fighters is 8 or greater and this card died this game: Summon this card from your graveyard. If you do, attach fading to it and draw 2 cards.",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{ "Draw", 2, "Ally" },
						{ "EquipGear", "Fading Mod", "Self" }
					},
					Target = "Self",
					EffectRequirement = { "SelfStats", "Self", 30, 30, "Death" },
					DontTriggerInField = true,
					NoBlip = true
				},
				OnEnd = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					EffectRequirement = { "TotalRank", "Ally", 8, 9999 },
					DontTriggerInField = true
				}
			}
		},
		Bio = "With worshipping Dekkad falling on empty ears, those who wished to return to the old ways found new gods to appease."
	},
	HighlanderWR = {
		Id = 106819195377755,
		Name = "The Imperfect Ones",
		AltCards = {
			["The Imperfect Ones-Offer"] = {
				Id = 125670746963014,
				Name = "The Imperfect Ones",
				AttackEffect = "Scorch",
				ArtAnimation = "notcalc",
				Bio = "Our flaws dont make us, its what we do with them that matters."
			}
		},
		Health = 2100,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "Scorch",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6, Red = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		EquipGearAnimation = "StaticBurn",
		AddBlock = true,
		Gladiator = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Attach a Flaw to all fighters. Then if there's 10 or more gear attached to allied fighters, all allied fighters gain 1000 Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "EquipGear", "Flaw", "All" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 1000 } },
					EffectRequirement = { "TotalGearCount", "Ally", 10, 9999 },
					Target = "Ally"
				}
			}
		},
		Bio = "Two flawed pieces break the tradition of perfection for the sake of acceptance."
	},
	HighlanderWG = {
		Id = 97935233041872,
		Name = "Twin Dragons of Salvation",
		AltCards = {
			["Twin Dragons of Salvation-Offer"] = {
				Id = 127903862340864,
				Name = "Twin Dragons of Salvation",
				AttackEffect = "Maelstrom",
				ArtAnimation = "letsdothisTwinDragonsofSalvation"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Maelstrom",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6, Green = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Continued = true,
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast another gear or gladiator: Summon a 100/300 copy of it with continued. This triggers once each turn per card type.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{ "SummonCopy", 30, "Aggressor" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Health = 100, Power = 300, Continued = true },
					Archetype = "Gladiator",
					TurnTriggerLimit = 1
				},
				OnAllyCastGear = {
					Power = {
						{ "SummonCopy", 30, "Aggressor" },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Health = 100, Power = 300, Continued = true },
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "The mentee lived his life full of merit; The mentor lived their many lives to nurture merit."
	},
	HighlanderWB = {
		Id = 110715735458500,
		Name = "The Shedarian Royalty",
		AltCards = {
			["The Shedarian Royalty-Offer"] = {
				Id = 101026468886032,
				Name = "The Shedarian Royalty",
				AttackEffect = "Bubbles",
				ArtAnimation = "mother_son_bondingtimetypesh",
				Bio = "May insanity plague us no more. Let us battle together, Mother."
			},
			["Nethercreep-Slck"] = {
				Id = 131944123471724,
				Name = "Nethercreep?",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 577,
				Bio = "Consuming ten billion years in an instant<br/>And I'll come to you without a second thought<br/>I'm here, I'm here - on the border of the circle"
			}
		},
		Health = 1500,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Bubbles",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6, Blue = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Seek Shinies. Then all allied attached fighters gain dextrous and overload.",
			Ability = {
				OnAttack = {
					Power = {
						{ "CreateChoices", "Shinies" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{ "GivePassive", "Dextrous", "CustomTarget" },
						{ "GivePassive", "Overload", "CustomTarget" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasGear",
						Modifier = true
					}
				}
			},
			AmountOfTargets = 2,
			HideAdd = true
		},
		Bio = "The chaos of a broken family fixes itself admist the chaos of the Doomspire."
	},
	HighlanderWY = {
		Id = 122698432493008,
		Name = "Blackmoore, Inverted Villain",
		AltCards = {
			["HighlanderWY-Preview"] = {
				Id = 138555632686826,
				Name = "Noir",
				AttackEffect = "Scratch",
				PackDisplayOverride = "Doomspire Act 2 Preview Event",
				Bio = "Case closed."
			},
			["Blackmoore, Inverted Villain-Offer"] = {
				Id = 124324836569283,
				Name = "Blackmoore, Inverted Villain",
				AttackEffect = "Scratch",
				ArtAnimation = "TheInvertavillainBlackmoore",
				Bio = "\"If I don't do it, then who will?\""
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6, Yellow = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a card is discarded: 2 random fighters spiral.\nWhenever a fighter spirals into a gilmuraig: Draw a card.",
			Ability = {
				OnAnyDiscard = {
					Power = {
						{ "Spiral" },
						{ "Spiral" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "RandomField"
				},
				OnSpiralTransform = {
					Power = {
						{ "Draw", 1 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The greatest evil became the greatest virtue, not out of a change of heart, but simply to spite his creator."
	},
	HighlanderWW = {
		Id = 124826037484384,
		Name = "The Saviour",
		AltCards = {
			["The Saviour-Offer"] = {
				Id = 95215336597401,
				Name = "The Saviour",
				AttackEffect = "MagicRed",
				ArtAnimation = "PleaseSaveUsGhasendex",
				Bio = "This humble one mourns its kind. It mourns a world lost to time."
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Rank = 15,
		Cost = { Neutral = 0 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		TokenOmni = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "When you discard this card: A target fighter becomes inert in all zones.\nWhen you've discarded 2 cards this turn: Give yourself 2 Gladiator cards.",
			Ability = {
				OnDiscarded = {
					Power = {
						{ "GivePassive", "TokenOmni", "Single" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Single"
				},
				OnAnyTrigger = {
					Power = {
						{ "RandomAdd", "Gladiator" },
						{ "RandomAdd", "Gladiator" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1,
					EffectRequirement = { "Playertable", "Me", 2, 9999, "DiscardCount" }
				}
			}
		},
		Bio = "\"We've all learnt our lessons these past 4000 years, cousin. Let me teach you what the Cymoniacs taught me.\""
	},
	HighlanderWQ = {
		Id = 88747392840295,
		Name = "The Cornered Rat",
		AltCards = {
			["The Cornered Rat-Offer"] = {
				Id = 75928074595586,
				Name = "The Wanderer",
				AttackEffect = "Slash",
				ArtAnimation = "bum",
				Bio = "a shattered face, do you recognize it?"
			},
			CORNEREDR4T = {
				Id = 95419078565849,
				Name = "CORNEREDR4T",
				Effect = {
					Name = "Temporal Halo",
					Description = "Whenever you cast a fighter that costs 5 or more {W}: Attach a dreamshield to this card, then this card generates for each gear on it.",
					Ability = {
						OnAllySummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 0, "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Set", "Target", "NeutralCost", "Nil" },
									"Aggressor"
								},
								{ "EVGreaterValueCheck", 4 }
							},
							Target = "Self",
							NoBlip = true
						},
						OnEVCheckPass = {
							Power = {
								{ "RandomTutorfor", "Gladiator", "Ally" },
								{ "EquipGear", "Imaginary Token-R4T", "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "EquippedGearCount", "Nil" },
									"Self"
								},
								{
									"AlterEV",
									{ "Multiply", "Math", 1, "Nil" },
									"Self"
								},
								{ "Generate", "Variable", "Self" }
							},
							Target = "Self"
						}
					}
				},
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 662,
				Bio = "wait a minute female Dekkad doesn’t exist? Well now it does."
			},
			["The Cornered Rat-UGC"] = {
				Id = 123588094747755,
				Name = "The Glued Rat",
				PackDisplayOverride = "Black Winter Hat W/ Earpiece UGC Purchase (In-Game)",
				Bio = "Ｆａｎ  ａｒｔ  ｔｈｉｓ  ｈｕｍｂｌｅ  ｏｎｅ  created  ｏｆ  The Rat   ｄｙｉｎｇ  ｉｎ  ａ   ｇｌｕｅ  ｔｒａｐ."
			}
		},
		Health = 600,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 7 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		CustomReminderImagine = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a fighter that costs 5 or more {W}: Attach a dreamshield to this card, then this card generates for each gear on it.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "NeutralCost", "Nil" },
							"Aggressor"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "EquipGear", "Imaginary Token", "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 1, "Nil" },
							"Self"
						},
						{ "Generate", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Alpha Brick's Delirium"] = {
		Id = 117309505018513,
		Name = "Alpha Brick's Delirium",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Terrain = true,
		DestroyImmune = true,
		Archetype = "Era",
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "During your opponent's end step: Obliterate all gear attached to this card, then attach that many terrain cards plus 1.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "DestroyGear", "All", "Self" },
						{ "EnterEVLoop" }
					},
					Target = "Self",
					GearDontAddToGraveyard = true
				},
				OnEVLoop = {
					Power = { { "RandomEquipGear", "Terrain NotScary", "Self" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "\"Wasn't the brick used to stop the Anthrested Horde in 485AD? How's it in the middle of the Doomspire?\"\nThe Auteur smirked at the Tainted's confusion.\n\"It's both here and not here. What should be a contradiction... No longer is.\""
	},
	["Baseplate of the Doomspire"] = {
		Id = 73216209666121,
		Name = "Baseplate of the Doomspire",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		EffectVariable = 0,
		Terrain = true,
		ForceTerrarianStatline = { 2050, 2050 },
		CustomReminder = {
			["Cost of Creativity"] = "If your opponent has 9{W} when you cast this, it'll steal 5 of them on your end step."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Your opponent casts this terrain.\nDuring your opponent's end step: Give them each {W} you have beyond 4.\nOnce each turn, when you have no {W}: You lose 1000 life and destroy the oldest card in your hand.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					GearDontAddToGraveyard = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", -1 },
						{ "Neutral", 1, "Opponent" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4, "Self" }
					},
					Target = "Ally",
					NoBlip = true
				},
				OnAnyTrigger = {
					Power = {
						{ "Cost", 1000 },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 0, 1, "IconsNeutral" },
					TurnTriggerLimit = 1
				}
			},
			CastOnOpponent = true
		},
		Bio = "The origin point of the Doomspire of 435 AD, absorbing every tree, house, city, and continent around it."
	}
}
