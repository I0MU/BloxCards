



return {
	ScareAndCrow = {
		Id = 11972127182,
		Name = "Scare & Crow",
		AltCards = {
			["ScareAndCrow-Alt"] = { Id = 6055864289, AttackEffect = "Scratch", AltArt = true }
		},
		CopyBodge = "ScareAndCrow",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Crow once belonged to the Matriarch. Scare once belonged to Hallow. Now, they belong to themselves, on a mission to undo their black-hearted past."
	},
	DoomedAdventurer = {
		Id = 11972112833,
		Name = "Doomed Adventurer",
		AltCards = {
			ObamaXJesus = {
				Id = 7138922054,
				Name = "ObamaXJesus",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "Thanks, Obama."
			},
			["Christina Mackesse"] = {
				Id = 10184317971,
				Name = "Christina Mackesse",
				AttackEffect = "Revolver",
				AltArt = true,
				Bio = "I'm telling you, there's no tina in my name!"
			}
		},
		CopyBodge = "DoomedAdventurer",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Bears the Curse of the Acolyte, which binds him to slay Dragons. If he doesn't, his soul will become ash. If he fails, his body will."
	},
	Tootso = {
		Id = 11972306149,
		Name = "Tootso",
		AltCards = {
			["Deliovon Too"] = {
				Name = "Deliovon ''Too''",
				AttackEffect = "Hammer",
				Id = 10184424130,
				AltArt = true,
				Bio = "Despite common belief, Tootso is an alt art of this card."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Green = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Tootso is a friendly toothy wizard! He loves to plant fruit trees wherever he goes! He is a pacifist by nature. He can also burst your lungs open by magically summoning pineapples inside you. Don't mess with Tootso."
	},
	WrathOfAzure = {
		Id = 11972317822,
		Name = "Wrath of Azure",
		AltCards = {
			["Steve, The Explorer"] = {
				Id = 5832426559,
				Name = "Steve, the Explorer",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"You should join how gaming. We're chilling and gaming 24/7.\""
			}
		},
		CopyBodge = "WrathOfAzure",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "A wraith is an incorporeal creature born of evil and darkness, despising light and all living things. A wraith drains the constitution from living creatures, turning them into new wraiths upon death. A wraith is powerless in natural sunlight and will flee from it."
	},
	ChaoticCommando = {
		Id = 3299961860,
		Name = "ChaoticCommando",
		AltCards = {
			["Return to Staring Cat"] = {
				Id = 15804642474,
				Name = "Return to Staring Cat",
				AltArt = true,
				Bio = "\"Hi.\""
			}
		},
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
	Loogi = {
		Id = 8923186892,
		Name = "Loogi",
		AltCards = {
			["Loogi-E"] = {
				Id = 8822690617,
				Name = "Sirius Drake",
				Transformant = "LoogiTOKEN-E",
				Bio = "This egg is a fabled treasure passed down through many generations... I'll give it to ya for 5 gold."
			},
			["Loogi-AN"] = {
				Id = 9499178126,
				Name = "ADeadBody14",
				AttackEffect = "Slash",
				Transformant = "LoogiTOKEN-AN",
				Bio = "I have very accurate skills!"
			}
		},
		Power = 400,
		Health = 400,
		Rarity = "Rare",
		AttackEffect = "Knife",
		Color = "Yellow",
		Stealth = true,
		Cost = { Yellow = 3 },
		Transformant = "LoogiTOKEN",
		Effect = {
			Name = "Greed Share",
			Description = "Whenever you cast another fighter: It gains 200 health and power. Then this card transforms to lose all abilities.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 200, "Aggressor" },
				{ "Strengthen", 200, "Aggressor" },
				{ "Transform", "Transformant", "Self" }
			},
			Target = "Ally",
			EffectTransformPreserveRarity = true
		},
		Bio = "Loogi once shared the same ability with his brother; Qdhxx. Qdhxx's endless whining forced Loogi to awaken a new power for you to use."
	},
	LoogiTOKEN = {
		Id = 8923186892,
		Name = "Loogi",
		AltCards = {
			["LoogiTOKEN-E"] = {
				Id = 8822691239,
				Name = "Sirius Drake",
				Bio = "A good deal, I'd say. This card is still an alt-art of Loogi."
			},
			["LoogiTOKEN-AN"] = {
				Id = 9499179567,
				Name = "ADeadBody14",
				AttackEffect = "Slash",
				Bio = "And a very accurate name... This card is still an alt-art of Loogi."
			}
		},
		Power = 400,
		Health = 400,
		Rarity = "Token",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Stealth = true,
		Effect = {
			Name = "Greed Share",
			Description = "Whenever you cast another fighter: It gains 200 health and power. This ability triggers only once, and has already triggered.",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Loogi once shared the same ability with his brother; Qdhxx. Qdhxx's endless whining forced Loogi to awaken a new power for you to use."
	},
	legoseed = {
		Id = 3164492078,
		Name = "legoseed",
		AltCards = {
			LegoWraith = {
				Name = "LegoWraith",
				AttackEffect = "MagicRed",
				Id = 10242797473,
				Bio = "The Lego of Christmas Past."
			},
			ZeroLegoseed = {
				Id = 71196418969740,
				Name = "Zero",
				PremiumArt = 356,
				AltArt = true,
				Bio = "And I feel like I'm absolutely Zero."
			}
		},
		Health = 1350,
		Power = 1350,
		Rarity = "Legendary",
		AttackEffect = "Inferno",
		Color = "Red",
		Cost = { Red = 8 },
		Overload = true,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Known forumer who became a moderator, although some users are skeptical of him in general, his passive aggressive nature will haunt you."
	},
	CloneTrooper1019 = {
		Id = 4239211664,
		Name = "CloneTrooper1019",
		AltCards = {
			Parli9 = {
				Id = 4337109758,
				AttackEffect = "MagicYellow",
				Name = "Parli9",
				Bio = "A coward dies many times over his life. The valiant die only once."
			},
			["CloneTrooper1019-E"] = {
				Name = "Bunny Trooper",
				AttackEffect = "Slash",
				Id = 16446076162,
				Bio = "Bnnuy"
			}
		},
		Health = 1100,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		DamageImmune = true,
		SetImmune = true,
		Cost = { Neutral = 4, Yellow = 3 },
		Effect = {
			Name = "Thug Life",
			Description = "",
			Type = "Null",
			Power = { { "Lock", 0 } },
			Target = "Self"
		},
		Bio = "He hums in the face of apocalypse."
	},
	ItssPaladin = {
		Id = 5832345212,
		Name = "ConnorVIII",
		AltCards = {
			["ConnorVIII-Sun"] = {
				Name = "Loch Ness Monster",
				AttackEffect = "Whirlpool",
				Id = 10283655594,
				Bio = "Huh. Guess it really did exist."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 4 },
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "When this card is cast: Lock a target fighter for 3 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Single",
			Increase = 3
		},
		Bio = "Current Developer of Freeze Tag. Go near him and you'll be iced."
	},
	olafisawesome100 = {
		Id = 4899428269,
		Name = "olafisawesome100",
		AltCards = {
			["Pinewood Architech Bob"] = {
				Id = 8072477232,
				Name = "Pinewood Architech Bob",
				AttackEffect = "Punch",
				Bio = "For the love of God, can we NOT cause today's 5th nuclear core meltdown!?"
			},
			["bis0r-ttar"] = {
				Id = 13653687135,
				Name = "bis0r",
				AltArt = true,
				PremiumArt = 44,
				AttackEffect = "Ice",
				EffectAnimation = "Freeze",
				Bio = ""
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Paintball",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "BOO!",
			Description = "When this card is cast: A target enemy fighter loses 300 power until its next end step.",
			Type = "OnSummon",
			Ability = {
				OnSummon = {
					Power = { { "TempWeaken", 300, "SingleEnemy" } },
					Target = "Single"
				}
			}
		},
		Bio = "Hiding behind a wall with a paintball gun."
	},
	["Ultimate Build"] = {
		Id = 6835114051,
		AltCards = {
			["Ultimate Build-Mango"] = {
				Name = "Rockhead Chapel",
				Id = 103553357423185,
				Terrariant = "Starter Terrain-UB-Mango",
				AttackEffect = "Jab",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "There is a single sermon, telling stories of heroes and rebirth, of strength born from strife; the Rockheads' belief is as singular as it is indomitable. The doors are open, promising respite from the searing lava - you are welcome inside."
			}
		},
		Name = "Ultimate Build",
		Color = "Blue",
		Terrariant = "Starter Terrain-UB",
		Cost = { Blue = 6 },
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		CustomReminder = {
			Terrain = "These cards go to your terrain zone and stay there until you play another."
		},
		Field = 323275951,
		Terrain = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Draw 2 cards.\nDuring your end step: All enemy fighters lose 100 power until their next end step.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 2, "Ally" } },
					Target = "Self"
				},
				OnEnd = {
					Power = { { "TempWeaken", 100, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "Test the limits of your imagination."
	},
	["Lumber Tycoon"] = {
		Id = 6835115498,
		Name = "Lumber Tycoon",
		AltCards = {
			["Yong Grand Magasin Sisyphe’s Dyehouse Worker"] = {
				Name = "Yong; Grand Magasin Sisyphe’s Dyehouse Worker",
				Commissioner = { "" },
				Id = 121258111220633,
				AltArt = true,
				PremiumArt = 879,
				Bio = "<b><font color=\"#0000FF\">Don't give me that look.</font></b> <b><font color=\"#FFFF00\">It was a joke. A joke, I swear.</font></b> <b><font color=\"#FF0000\">Did you really think there's</font></b> <b><font color=\"#0000FF\">such a thing as a color</font></b> <b><font color=\"#FF0000\">only the pure of heart can see?</font></b>-tianyongstar"
			}
		},
		Color = "Green",
		Terrariant = "Starter Terrain-LT",
		Cost = { Green = 5 },
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 323275951,
		Terrain = true,
		CustomReminder = {
			Terrain = "These cards go to your terrain zone and stay there until you play another."
		},
		Effect = {
			Name = "Stud",
			Description = "Whenever you cast a Green fighter: It gains 100 health and power.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Aggressor",
			Color = "Green"
		},
		Bio = "Money doesn't grow on trees, but you can turn trees into money!"
	},
	["Catalog Heaven"] = {
		Id = 6835114367,
		Name = "Catalog Heaven",
		AltCards = {
			Robocade = {
				Id = 9208864424,
				Name = "Robocade",
				AltArt = true,
				AttackEffect = "Electric",
				Terrariant = "Robocade Terrain",
				Bio = "This card is a part of BucketWarrior's Robot deck."
			},
			Skoutlox = {
				Id = 79546015643512,
				Name = "Skoutlox's Room",
				AttackEffect = "Electric",
				Terrariant = "Starvelox",
				Bio = "\"i love big ered buttons\"<br/>mispelled no<br/>nooo "
			}
		},
		Color = "Yellow",
		Terrariant = "Starter Terrain",
		Cost = { Neutral = 1, Yellow = 6 },
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 323275951,
		Terrain = true,
		CustomReminder = {
			Terrain = "These cards go to your terrain zone and stay there until you play another.",
			Fading = "Cards with Fading do not enter the graveyard."
		},
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: Recur an allied card in your graveyard that costs 2 or fewer total studs. It gains fading.",
			Type = "OnAllyStart",
			Power = { {
				"MoveZone",
				{ "2OrLower", "GraveZone", "Hand", true, false }
			} },
			Target = "Self",
			MetaData = { Fading = true }
		},
		Bio = "A strange place, where everyone can truly become anyone."
	},
	["Rocket Arena"] = {
		Id = 6835113691,
		Name = "Rocket Arena",
		Color = "Red",
		Terrariant = "Starter Terrain-RA",
		Cost = { Neutral = 1, Red = 3 },
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 323275951,
		Terrain = true,
		CustomReminder = {
			Terrain = "These cards go to your terrain zone and stay there until you play another."
		},
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: You lose 600 life. Draw a card.",
			Type = "OnAllyStart",
			Power = {
				{ "Cost", 600 },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "One of the deadliest places in all of Robloxia. Enter Chaos."
	},
	SACC1 = {
		Id = 9034072169,
		Name = "King's Clown",
		AltCards = {
			Ferdinand = {
				Id = 16446074541,
				Name = "Ferdinand",
				AltArt = true,
				Bio = "You know his soul is in a furnace?"
			}
		},
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		SummonAnimation = "ClownHonk",
		DeathAnimation = "ClownDeath",
		Field = 323275951,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "An awful card. You should replace it in the deckbuilder."
	},
	SACC2 = {
		Id = 9034071270,
		Name = "Pink Eye",
		Agnes = {
			Id = 113784681681280,
			Name = "Agnes",
			AltArt = true,
			Bio = "Satisfaction with the lack of compassion."
		},
		Color = "Green",
		Cost = { Green = 3, Neutral = 1 },
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 323275951,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "An awful card. You should replace it in the deckbuilder."
	},
	SACC3 = {
		Id = 9034070565,
		Name = "Slender",
		AltCards = {
			Zephyr = {
				Name = "Zephyr",
				Id = 16738203926,
				AltArt = true,
				Bio = "Thank god he didn't throw his white bag of life into the drawer!"
			}
		},
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 323275951,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "An awful card. You should replace it in the deckbuilder."
	},
	SACC4 = {
		Id = 9034069542,
		Name = "Intern Cat",
		AltCards = {
			Hardin = {
				Name = "Hardin",
				Id = 129694372670084,
				AltArt = true,
				AttackEffect = "Slash",
				Bio = " Live at the edge of darkness and light."
			}
		},
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 323275951,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "An awful card. You should replace it in the deckbuilder."
	},
	["Korblox Archer"] = {
		Id = 10362179125,
		Name = "Korblox Archer",
		AltCards = {
			["Korblox Archer Drawn"] = {
				Id = 3611613697,
				AttackEffect = "Arrow",
				CopyBodge = "Korblox Archer Drawn",
				Bio = "Even though hitting someone's head with an arrow while in midair is awesome, it really isn't pratical."
			}
		},
		Health = 100,
		Power = 700,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2 },
		EffectAnimation = "BlueArrow",
		Overload = true,
		Effect = {
			Name = "Jagged Arrow",
			Description = "When this card is cast: A target enemy fighter loses 500 power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "SingleEnemy",
			Increase = 500
		},
		Bio = "Korblox arrows are made of a powerful ore known as Iron. Check up with your GP for symptoms if you get shot by one."
	},
	["Korblox General"] = {
		Id = 11435904519,
		Name = "Korblox General",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		EffectAnimation = "Freeze",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Instill",
			Description = "When this card is cast: Lock a target enemy fighter for 1 turn.",
			Type = "OnSummon",
			Power = { { "Lock", 1 } },
			Target = "SingleEnemy"
		},
		Bio = "CHARGE FORWARD!"
	},
	["Korblox Defender"] = {
		Id = 11344402045,
		Name = "Korblox Guardian",
		Health = 150,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Blizzard",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		EffectAnimation = "KorbloxGlowSelf",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Quick Shot",
			Description = "When this card is cast: A target enemy fighter loses 100 Power. Search your deck for a common Korblox card.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100, "SingleEnemy" },
				{ "RandomTutorfor", "Common Korblox", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "CHARGE NOWHERE! STAND GROUND!"
	},
	["Korblox Deathknight"] = {
		Id = 10753476462,
		Name = "Korblox Deathknight",
		AltCards = {
			["Korblox Deathknight-Val"] = {
				Name = "Korblox Deathknight",
				CopyBodge = "Korblox Deathknight-Val",
				Id = 9925832414,
				Bio = "This fighter hails from an alternate universe where all the warring factions in Robloxia are teenagers from rival schools. Prom time!"
			},
			suley135 = {
				Name = "suley135",
				Id = 96908299219996,
				AltArt = true,
				Bio = "Hail Sanctuary, fight and die."
			},
			["Korblox Deathknight-PC"] = { Id = 10310131393, PackDisplayOverride = "Group Precon: Korblox" }
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		DeathAnimation = "KorbloxDeath",
		EffectAnimation = "IceBreathAll",
		SummonAnimation = "SummonDeathknight",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 8 },
		Overload = true,
		Effect = {
			Name = "Quick Shot",
			Description = "When this card is cast, if you control 3 or more Korblox: Until their next end step, all enemy fighters lose 1000 power and all allied korblox gain 500 power.",
			Type = "OnSummon",
			Power = {
				{ "TempWeaken", 1000 },
				{ "TempStrengthen", 500, "AlliedArchetype" }
			},
			Target = "Opponent",
			EffectRequirement = { "Archetype", "Ally", 3, 9999, "Korblox" }
		},
		Bio = "Regardless of how threatening he looks. He just wants a hug. But everyone he comes near dies, hence the nickname."
	},
	["Korblox Deathkeeper"] = {
		Id = 11344399153,
		Name = "Korblox Deathkeeper",
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Blue = 5 },
		EffectVariable = 1,
		Effect = {
			Name = "Quick Shot",
			Description = "When this card is cast or dies: Swap the stats of a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Swap" } },
					Target = "Single"
				},
				OnDeath = {
					Power = { { "Swap" } },
					Target = "Single"
				}
			}
		},
		Bio = "Minions, servants, soldiers of the cold dark. Obey the call of your mother, dinner is ready."
	},
	["Korblox Archmage"] = {
		Id = 11344406049,
		Name = "Korblox Archmage",
		AltCards = {
			["tatertoter321, Korblox Champion"] = {
				Name = "TaterToter321, Korblox Champion",
				Id = 10224373295,
				AltArt = true,
				AttackEffect = "Slash",
				Bio = "Truly, Korblox are superior."
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Blizzard",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Charge = true,
		Cost = { Neutral = 1, Blue = 7 },
		Effect = {
			Name = "Quick Shot",
			Description = "When this card dies: Search your deck for 3 Korblox cards.",
			Type = "OnDeath",
			Power = {
				{ "RandomTutorfor", "Korblox" },
				{ "RandomTutorfor", "Korblox" },
				{ "RandomTutorfor", "Korblox" }
			},
			Target = "Ally"
		},
		Bio = "He's a regular attendee of the Beard Grooming Club. His next beard style will be the Fu Manchu."
	},
	["Korblox Squire"] = {
		Id = 10337557820,
		Name = "Korblox Squire",
		Health = 350,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Pepper Spray",
			Description = "When your effects have targeted this turn: All allied Korblox gain 50 Health.",
			Type = "OnAnyTrigger",
			Power = { { "Heal", 50 } },
			Target = "AlliedArchetype",
			TurnTriggerLimit = 1,
			EffectRequirement = { "Playertable", "Me", 1, 999999, "TargetCount" }
		},
		Bio = "He's enchanted to meet you."
	},
	["Korblox Shaman"] = {
		Id = 11344408917,
		Name = "Korblox Shaman",
		AltCards = {
			["TaterToter321, Korblox Shadowmage"] = {
				Name = "TaterToter321, Korblox Shadowmage",
				Id = 13713142506,
				AltArt = true,
				Commissioner = { 217447087 },
				Bio = "Truly, Korblox are superior."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Ice",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		EffectAnimation = "KorbloxGlowEffect",
		Effect = {
			Name = "Demoralising Chant",
			Description = "When this card is cast, if there's 2 or more allied Korblox: A target enemy fighter loses 500 power until its next end step.",
			Type = "OnSummon",
			Power = { { "TempWeaken", 500, "SingleEnemy" } },
			Target = "Single",
			EffectRequirement = { "Archetype", "Ally", 2, 999, "Korblox" }
		},
		Bio = "Someday, someone will best me. But it won't be today, and it won't be you."
	},
	Serhat12 = {
		Id = 5097694617,
		Name = "Korblox Scourgelord",
		CopyBodge = "Serhat12",
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Blizzard",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		EffectAnimation = "SelfIce",
		Color = "Blue",
		Archetype = "Korblox",
		Cost = { Neutral = 3, Blue = 2 },
		Effect = {
			Name = "Pepper Spray",
			Description = "When your effects have targeted this turn: Draw a card.",
			Type = "OnAnyTrigger",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			TurnTriggerLimit = 1,
			EffectRequirement = { "Playertable", "Me", 1, 999999, "TargetCount" }
		},
		Bio = "Her cold heart betrays an undying rage."
	},
	["Korblox Skeleton"] = {
		Id = 6125944836,
		Name = "Korblox Skeleton",
		Health = 250,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Color = "Blue",
		Archetype = "Korblox",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Pepper Spray",
			Description = "When your effects have targeted this turn: All enemy fighters lose 50 Power.",
			Type = "OnAnyTrigger",
			Power = { { "Weaken", 50 } },
			Target = "Opponent",
			TurnTriggerLimit = 1,
			EffectRequirement = { "Playertable", "Me", 1, 999999, "TargetCount" }
		},
		Bio = "No one truly realizes the damage of their mistakes until they go through it themselves."
	},
	Doge = {
		Id = 4784611236,
		Name = "Doge",
		AltCards = {
			["Doge-TH"] = {
				Name = "Turkey Trooper",
				Id = 7986730511,
				AttackEffect = "Gun",
				Bio = "Attack. Defeat. Defend."
			},
			["Spy Bot"] = {
				Name = "Spy Bot",
				Id = 9087730518,
				AttackEffect = "Slash",
				Bio = "Is \"Destroy all humans\" too cliché?\""
			},
			["Wet Floor Bot"] = {
				Name = "Wet Floor Bot",
				AttackEffect = "Bubbles",
				Id = 9087743751,
				Bio = ""
			},
			Bucket = { Name = "Bucket", AttackEffect = "Swamp", Id = 9087756272, Bio = "" },
			["CB-Token"] = {
				Name = "Broken Circuits",
				AttackEffect = "MagicRed",
				Id = 9225596975,
				Bio = ""
			},
			["Doge-Violet"] = {
				Name = "Violet's Passion",
				AttackEffect = "MagicRed",
				Id = 79696673394415,
				Bio = "\"Aren’t the flowers so lovely tonight?\""
			},
			["DJ Pingu-Token"] = {
				Name = "Fan of DJ Pingu",
				Id = 11971625069,
				AttackEffect = "Ice",
				SummonAnimation = "PenguinCall",
				Bio = "SOMEBODY SCREAM! 🍦"
			},
			["Doge-Bullets"] = {
				Name = "Bullets",
				Id = 13771250433,
				AttackEffect = "Minigun",
				Bio = "<i>I don’t think this thing counts as a bullet, but it’s small, cute, and ready to fight!</i>"
			},
			Gus = {
				Name = "Gus",
				Id = 15941934778,
				AttackEffect = "Minigun",
				Bio = "\"Hey bud, the name's Gus! Feels good to meet'cha! I'm glad to finally have another friend, since everyone loves me! Everyone loves Gus!\""
			},
			["G3 Cartel"] = {
				Name = "G3 Cartel",
				Id = 16283037296,
				AttackEffect = "Minigun",
				Bio = "“…Hey! That’s the human Garmantuous sent us to get! You there! Surrender to the mighty G3 and get over here and join your friends! Unless you wanna face the might of us, the G3! …did I already say that?”"
			},
			["Luc and imagoodbacon"] = {
				Name = "Luc and imagoodbacon",
				Id = 16738205634,
				Bio = "Luc and imagoodbacon are doge's one of the closest friends on roblox. Very coo"
			},
			["Fat Chan"] = { Name = "Fat-chan", Id = 130916779441543, Bio = "wait.. who dis?" },
			silverobitoken = {
				Name = "The Fall",
				Id = 139465294678769,
				Bio = "\"why is the world so cruel\" <br/>\"i just know god hates me I KNOW IT\"<br/>\"WAAAAAAAAA.....yay\""
			},
			["Crystalline Doge"] = {
				Name = "Crystalline Doge",
				Id = 136504693585519,
				Bio = "\"A masterpiece of crystal and pure energy, flawlessly forged from there creator, dodecahedron, using the Grimgold Periastron Beta, even if their Creator is barely paying attention mid-incantation. Dodecahedron simply has no desire to deal with the heat of battle, for either Laziness, or... yea probably just laziness. Though it seems Dodecahedron’s only true spark of motivation comes from his pure, unadulterated spite for any self-righteous Overseer that crosses his path.\""
			},
			neoinfurno = {
				Name = "NE0L1GHT'S Infurno",
				Id = 107152198505537,
				Bio = "Purrhaps you'd like to take me up on my offer to enact some revenge~"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Token = true,
		Cost = { Neutral = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Purlot",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Such claws. Much stats. Very game. Wow."
	},
	["Shamrock Doge"] = {
		Id = 2810834606,
		Name = "Shamrock Doge",
		AltCards = {
			WavyMarlonAlT = {
				Name = "WavyMarlonAlT",
				AltArt = true,
				Id = 76822736302744,
				AttackEffect = "MagicYellow",
				Bio = "Cool Doge. Much drip. Much rich."
			},
			["Shamrock Doge-TH"] = {
				Id = 7986728690,
				Name = "Turkey Watchout",
				Summonant = "Doge-TH",
				Bio = "He intentionally returns nothing to report, worried that he'll be executed for his higher-up's incompetence."
			},
			["Janitor Bot"] = {
				Id = 9087740859,
				Name = "Janitor Bot",
				AltArt = true,
				AttackEffect = "Storm",
				Summonant = "Wet Floor Bot",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Summon a 150/150 Wet Floor Bot. Draw a card."
				},
				Bio = "\"My, Earth really is full of things!\". This card is a part of BucketWarrior's Robot deck."
			},
			Viktonioca = {
				Name = "Viktonioca",
				AltArt = true,
				Id = 10936129845,
				AttackEffect = "Scratch",
				Bio = "Just tell me when you notice."
			},
			Krubis = {
				Id = 15941932262,
				Summonant = "Gus",
				Name = "Krubis",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 193,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Summon a 150/150 Gus. Draw a card."
				},
				Bio = "\"Wassup ya, name's krubis! Ya want some furgles? These little guys make you see things, things beyond what you can comprehend man!\""
			},
			Cubism = {
				Id = 100695696059551,
				Name = "Cubism",
				AttackEffect = "Jab",
				Summonant = "Fat Chan",
				AltArt = true,
				PremiumArt = 531,
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Summon a 150/150 Fat-chan. Draw a card."
				},
				Bio = " I'm going to make a collage of fiction, and put it up on a big canvas!"
			},
			["silver and obi sad then happy"] = {
				Id = 81523545010006,
				Name = "silver and obi sad then happy",
				AttackEffect = "Jab",
				Summonant = "silverobitoken",
				AltArt = true,
				PremiumArt = 552,
				Bio = "\"CMON just grab ma hand it aint that hard\"<br/>\"hows bout i getcha an ice cream?\""
			},
			["Pot Wielding Maniac"] = {
				Id = 111762658411436,
				Name = "Pot Wielding Maniac",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 574,
				Bio = "have a merry Christmas"
			},
			["Shamrock Doge-Senzura"] = {
				Id = 81867411612714,
				Name = "Wagon of Locals",
				Summonant = "Doge-Senzura",
				Bio = "Advancements in transport are not really that necessary compared ot everything else they made considering they can't really die from old age here in Senzura."
			},
			["Oninaka, Purrgatory Forever"] = {
				Id = 96998708624048,
				Name = "Oninaka, Purrgatory Furever",
				Commissioner = { "Oninaka", "NE0L1GHT" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 776,
				Summonant = "neoinfurno",
				Bio = "\"I'm Oninaka and I've c-come to terms with my own death! ... I-it's a good thing.\""
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Common",
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
	["Uncle Doge"] = {
		Id = 5947349114,
		Name = "Uncle Doge",
		AltCards = {
			["Uncle Doge-TH"] = {
				Id = 7986748303,
				Name = "Turkey Squad Leader",
				AttackEffect = "Gun",
				Summonant = "Doge-TH",
				Bio = "\"Anyone who has ever looked into the glazed eyes of a soldier dying on the battlefield will think hard before starting a war.\" --Otto Van Bismarck"
			},
			["Redspybot's Army of Spies"] = {
				Id = 9087729736,
				Name = "Redspybot's Army of Spies",
				AttackEffect = "Slash",
				AltArt = true,
				Summonant = "Spy Bot",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Summon two 150/150 Spy Bots."
				},
				Bio = "A mysterious synod of 47-dimensional beings contracts these spies to monitor the events of our flat universe. This card is a part of BucketWarrior's Robot deck."
			},
			["Doge-Creature"] = {
				Id = 13771473717,
				Name = "Creature",
				AttackEffect = "Minigun",
				Commissioner = { 631767866, 297087291 },
				AltArt = true,
				PremiumArt = 61,
				Summonant = "Doge-Bullets",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Summon two 150/150 Bullets that are inert in play."
				},
				Bio = "“Oh hey! You look nice! My name’s Creature! The bad guys did experiments on me and MESSED me up real bad! In every way you can imagine!”"
			},
			NormalBike = {
				Id = 99105759366523,
				Name = "NormalBike",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 472,
				Bio = "Hit the road jack, and don't come back no more."
			},
			["Uncle Doge-Violet"] = {
				Id = 75513147620144,
				Name = "Violet",
				Summonant = "Doge-Violet",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 792,
				Bio = "\"Why show my face when this face works well?\""
			}
		},
		Health = 300,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		Summonant = "Doge",
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		CustomReminder = {
			Doge = "A {W} 150/150, inert in play. It's a yellow Doge with no abilities.",
			["Inert in Play"] = "Doge tokens don't generate studs in play."
		},
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Summon two Doges.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "very battle. much join."
	},
	["Captain Doge"] = {
		Id = 5942337419,
		Name = "Captain Doge",
		AltCards = {
			xxyourdoomxx = {
				Id = 7236318407,
				AltArt = true,
				Name = "xxyourdoomxx",
				AttackEffect = "MagicRed",
				Bio = "\"Come, my inu friend. This is no place to die.\""
			},
			["Mr. Robot"] = {
				Id = 9087720703,
				AltArt = true,
				Name = "Mr. Robot ",
				AttackEffect = "Slash",
				Bio = "You can tell he's a robot because he goes \"Beep Beep Beep\"!! This card is a part of BucketWarrior's Robot deck."
			},
			["Captain Doge-TH"] = {
				Id = 7986732578,
				Name = "Turkey Drill Sargent",
				AttackEffect = "Gun",
				Bio = "She drills the turkeys into the walls as explosives."
			},
			["B.A.L.L."] = {
				Id = 15252287515,
				Name = "B.A.L.L.",
				AttackEffect = "Paintball",
				AltArt = true,
				PremiumArt = 155,
				Commissioner = { 297087291, 631767866 },
				Bio = "\"The little blue things operating this gun are intelligible, but it seems like they’re willing to help you fight. Or they hate you. I can’t really tell.\""
			}
		},
		Health = 400,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Bite",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied Doges gain 200 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "AlliedArchetype",
			Increase = 200
		},
		Bio = "woofe. my inu comrade."
	},
	["Abraham Doge"] = {
		Id = 5945757276,
		Name = "President Doge",
		CopyBodge = "Abraham Doge",
		AltCards = {
			["Abraham Doge-TH"] = {
				Id = 7986746825,
				Name = "Turkey General",
				AttackEffect = "Gun",
				Bio = "Turkesian privates personally watched a thousand of their kin run to their death because their generals were born too rich to learn how to read a map. As soon as those corpses were in the ground, they were given another thousand to try it all again."
			},
			JBOwesome425 = {
				Id = 8563720726,
				AltArt = true,
				Name = "JBOwesome425",
				AttackEffect = "Electric",
				Bio = "\"My giant doge mecha, the world will fear me!\""
			},
			["Golden Donald P Sullivan"] = {
				Id = 9391610150,
				AltArt = true,
				Name = "Golden Donald P Sullivan",
				AttackEffect = "MagicYellow",
				Bio = "Didn't think everybody's favorite robot could get any fancier? You were wrong. This card is a part of BucketWarrior's Robot deck."
			},
			["Slumsly!"] = {
				Id = 13713144841,
				AltArt = true,
				PremiumArt = 91,
				Name = "Slumsly!",
				AttackEffect = "Recyclables",
				Commissioner = { 631767866, 297087291 },
				Bio = "<i>Hey there fresh meat! How ya doin fresh meat? Time to die, fresh meat!</i>"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied Doges gain 150 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150 },
				{ "Heal", 150 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "Trading leadership secrets for dog biscuits and internet fame."
	},
	TrollTideTroll = {
		Id = 6188587145,
		Name = "TrollTideTroll",
		AltCards = {
			["TrollTideTroll-TH"] = {
				Id = 7986753696,
				Name = "Turkey Army Cook",
				AttackEffect = "Blaze",
				Bio = "The chefs often poison the army's food in protest of the war."
			},
			["Mrs. Robot"] = {
				Id = 9087734059,
				Name = "Mrs. Robot",
				AltArt = true,
				AttackEffect = "Electric",
				Bio = "You can tell she's a robot because she goes \"Beep Beep Beep\"!! This card is a part of BucketWarrior's Robot deck."
			}
		},
		Health = 100,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied Doges gain 300 health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "AlliedArchetype",
			Increase = 300
		},
		Bio = "The woofmeister."
	},
	Kolby2020 = {
		Id = 5947350806,
		Name = "Kolby2020",
		AltCards = {
			["Kolby2020-TH"] = {
				Id = 7986736748,
				Name = "Turkey Cannon",
				AttackEffect = "ModernRocket",
				Effect = {
					Name = "Kobe can doge a ball",
					Description = "Whenever this card attacks: Give yourself a Doge card.",
					Type = "OnAttack",
					Power = { {
						"RandomAdd",
						{
							"Doge-TH",
							"Captain Doge-TH",
							"Shamrock Doge-TH",
							"Themediamogul99-TH",
							"Abraham Doge-TH",
							"Uncle Doge-TH",
							"PEEPSTERS-TH",
							"TrollTideTroll-TH",
							"Kolby2020-TH",
							"CALL OF DOGE!?!-TH"
						}
					} },
					Target = "Self"
				},
				Bio = "I have no idea how yanks could find exploding meat a good meal.\" --Sword Critic"
			},
			["Rusty McBucketton"] = {
				Id = 9208880560,
				Name = "Rusty McBucketton",
				AttackEffect = "Electric",
				AltArt = true,
				Effect = {
					Type = "OnAttack",
					Power = { {
						"RandomAdd",
						{
							"Spy Bot",
							"Mr. Robot",
							"Janitor Bot",
							"Bucketoid",
							"Abraham Doge",
							"Redspybot's Army of Spies",
							"Frank",
							"Mrs. Robot",
							"Rusty McBucketton",
							"Red Retro Robot",
							"Circuit Breaker"
						}
					} },
					Target = "Self"
				},
				Bio = "He runs on DOS 5.0. This card is a part of BucketWarrior's Robot deck."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Kobe can doge a ball",
			Description = "Whenever this card attacks: Give yourself a Doge card.",
			Type = "OnAttack",
			Power = { {
				"RandomAdd",
				{
					"Doge",
					"Captain Doge",
					"Shamrock Doge",
					"Themediamogul99",
					"Abraham Doge",
					"Uncle Doge",
					"PEEPSTERS",
					"TrollTideTroll",
					"CALL OF DOGE!?!"
				}
			} },
			Target = "Self"
		},
		Bio = "Kolby can doge a ball."
	},
	PEEPSTERS = {
		Id = 5942336406,
		Name = "PEEPSTERS",
		AltCards = {
			["PEEPSTERS-Alt"] = {
				Id = 7207433888,
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Doges still aren't finished, and now they have knives."
			},
			["PEEPSTERS-TH"] = {
				Id = 7986750162,
				Name = "Turkey Recruiter",
				AttackEffect = "Gun",
				Bio = "Battery-raised soldiers.",
				Effect = {
					Name = "Infinite Doge",
					Description = "When this card is cast, if there's 2 or more allied Doges: Give yourself a Doge card.",
					Type = "OnSummon",
					Power = { {
						"RandomAdd",
						{
							"Doge-TH",
							"Captain Doge-TH",
							"Shamrock Doge-TH",
							"Themediamogul99-TH",
							"Abraham Doge-TH",
							"Uncle Doge-TH",
							"PEEPSTERS-TH",
							"TrollTideTroll-TH",
							"Kolby2020-TH",
							"Doge Hound-TH",
							"CALL OF DOGE!?!-TH"
						}
					} },
					Target = "Ally",
					EffectRequirement = { "Archetype", "Ally", 2, 9999, "Doge" }
				}
			},
			Frank = {
				Id = 9087758542,
				Name = "Frank",
				AltArt = true,
				AttackEffect = "Tempest",
				Bio = "He hates it when people joke that they're on his wavelength. This card is a part of BucketWarrior's Robot deck.",
				Effect = {
					Name = "Infinite Doge",
					Description = "When this card is cast, if there's 2 or more allied Doges: Give yourself a Doge card.",
					Type = "OnSummon",
					Power = { {
						"RandomAdd",
						{
							"Spy Bot",
							"Mr. Robot",
							"Janitor Bot",
							"Bucketoid",
							"Abraham Doge",
							"Redspybot's Army of Spies",
							"Frank",
							"Mrs. Robot",
							"Rusty McBucketton",
							"Red Retro Robot",
							"Circuit Breaker"
						}
					} },
					Target = "Ally",
					EffectRequirement = { "Archetype", "Ally", 2, 9999, "Doge" }
				}
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 1, Neutral = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Infinite Doge",
			Description = "When this card is cast, if there's 2 or more allied Doges: Give yourself a Doge card.",
			Type = "OnSummon",
			Power = { {
				"RandomAdd",
				{
					"Doge",
					"Captain Doge",
					"Shamrock Doge",
					"Themediamogul99",
					"Abraham Doge",
					"Uncle Doge",
					"PEEPSTERS",
					"TrollTideTroll",
					"Kolby2020",
					"Doge Hound",
					"CALL OF DOGE!?!"
				}
			} },
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Doge" }
		},
		Bio = "'tfw you thought doges were finished.' wow. much pranked."
	},
	animallogic = {
		Id = 10310140266,
		Name = "animallogic",
		AltCards = {
			["animallogic-TH"] = {
				Id = 7986743310,
				Name = "Homing Turkey",
				AttackEffect = "MagicRed",
				Bio = "Turkeys are put inside missiles, pecking at them to guide them and gain seeds. They're showered with the stuff when the missile explodes."
			},
			["WavyMarlonAlT, The Forgotten Doge"] = {
				Id = 7954115400,
				Name = "WavyMarlonAlT, The Forgotten Doge",
				AttackEffect = "Venomshank",
				AltArt = true,
				Bio = "“The Overseers had won the alpha brick war and thought they wiped every opposing race, But they forgot one.”"
			},
			Sawbot = {
				Id = 9098482057,
				Name = "Sawbot",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Those asteroid belt crystal mines that were mentioned before? Yeah. This mean-looking guy runs them. He looks mean because he is mean. He especially hates humans. Think of him as a meeboid if he lived long long ago in a galaxy far away. This card is a part of BucketWarrior's Robot deck."
			},
			["Damo, Impulse Incarnate"] = {
				Id = 16056318513,
				Name = "Damo, Impulse Incarnate",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 209,
				Bio = "What is of the greatest importance in war is extraordinary speed: one cannot afford to neglect opportunity."
			},
			Cloak999 = {
				Id = 16294483492,
				AltArt = true,
				AttackEffect = "Slash",
				PremiumArt = 214,
				Name = "Cloak999",
				Bio = "\"Incapable of using particle emitters\""
			},
			["animallogic-E"] = {
				Id = 17026107183,
				Name = "RABID",
				AttackEffect = "MagicRed",
				Bio = "EGGGGGZ!?!?!?!?!?!?!?!"
			},
			["Necromancer Necronomicon"] = {
				Id = 84130548037584,
				Name = "Necromancer Necronomicon",
				AltArt = true,
				Bio = "call me cringe and I kill you );3c <br/>disclaimer: please don't call me cringe, I don't actually have the capability to kill you ;;"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Uncommon",
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
	Themediamogul99 = {
		Id = 5574278668,
		Name = "Themediamogul99",
		AltCards = {
			["Themediamogul99-TH"] = {
				Id = 7986752289,
				Name = "Turkey Pilot",
				AttackEffect = "TimeBomb",
				Summonant = "Doge-TH",
				Bio = "He delivers turkeys to certain doom."
			},
			Bucketoid = {
				Id = 9087750791,
				Name = "Bucketoid",
				AttackEffect = "Electric",
				AltArt = true,
				Summonant = "Bucket",
				Effect = {
					Name = "Life fam",
					Description = "Whenever you cast a Doge: Summon a 150/150 Bucket that's inert in play."
				},
				Bio = "\"No my head is not a bucket. Does not compute. Does not compute.\" This card is a part of BucketWarrior's Robot deck."
			},
			["Dodecahedron, The Doge Doubler"] = {
				Id = 125787335450748,
				Name = "Dodecahedron, The Doge Doubler",
				Summonant = "Crystalline Doge",
				Commissioner = { "noob119635" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 712,
				Bio = "\"We totally should've won strife, I'm not coping, you are\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Archetype = "Doge",
		Summonant = "Doge",
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		CustomReminder = {
			Doge = "A {W} 150/150, in play. It's a yellow Doge with no abilities.",
			["Inert in Play"] = "Doge tokens don't generate studs in play."
		},
		Effect = {
			Name = "Life fam",
			Description = "Whenever you cast a Doge: Summon a Doge that's inert in play.",
			Type = "OnAllySummon",
			Archetype = "Doge",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Much Summon. Many Doge."
	},
	["CALL OF DOGE!?!"] = {
		Id = 5574358422,
		Name = "Doge Doge",
		AltCards = {
			AlcahDoge = {
				Name = "AlcahDoge",
				AttackEffect = "Scratch",
				Id = 6961818172,
				AltArt = true,
				Bio = "Close friend of onetimesback. He is a Doge who helps him code his games, and is pretty awesome."
			},
			["CALL OF DOGE!?!-TH"] = {
				Name = "Turkeytron",
				AttackEffect = "LaserYellow",
				Id = 7986745300,
				Bio = "The turkey wars killed so many that the Turkeyarchs use robotic replicas to patrol their crumbling halls.",
				Summonant = "Doge-TH"
			},
			["Circuit Breaker"] = {
				Name = "Circuit Breakers",
				AttackEffect = "Slash",
				Id = 9208872016,
				AltArt = true,
				Bio = "Rules and circuits were meant to be broken. This card is a part of BucketWarrior's Robot deck. ",
				Summonant = "CB-Token"
			},
			["CALL OF DOGE!?!-PC"] = {
				AttackEffect = "Scratch",
				Id = 10310132424,
				PackDisplayOverride = "Group Precon: Doge"
			},
			["DJ Pingu"] = {
				Name = "DJ Pingu",
				AttackEffect = "Ice",
				Id = 11966565008,
				AltArt = true,
				SummonAnimation = "PenguinCall",
				Bio = "Despite his flippers, he actually makes a really good DJ! He even got some eager fans! He also sells the jingles in the MGDWare shop. (Go play this game! It'll be worth your time!)",
				Summonant = "DJ Pingu-Token"
			},
			["Mistah and Blueslug, Duo by Default"] = {
				Id = 75367139581547,
				Name = "Mistah and Blueslug, Duo by Default",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 177,
				Bio = "\"Wow, a year already, so cool and whatnot, still cant think of anything though. Did you know the original art was supposed to be a limbus company reference, you prob didn't. What a nice fun factoid, enjoy your infinite doges now.\" - Rayburn"
			},
			Garmantuous = {
				Id = 16283037397,
				AltArt = true,
				AttackEffect = "LaserYellow",
				PremiumArt = 213,
				Name = "Garmantuous",
				Bio = "“Gwahaha! I’m Garmantuous, leader of the G3 cartel! And you? You’re nothing but my PRODUCT!”",
				Summonant = "G3 Cartel"
			},
			LuckyDoge = {
				Id = 16738205515,
				AltArt = true,
				Name = "LuckyDoge",
				Bio = "Lucky doge is the luckiest alive (even luckier than shamrock doge) \"when it comes to luck nah I'd win\"",
				Summonant = "Luc and imagoodbacon"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 2 },
		Summonant = "Doge",
		SummonAnimation = "SummonDogeDoge",
		DeathAnimation = "DogeGone",
		CustomReminder = {
			Doge = "A {W} 150/150, inert in play. It's a yellow Doge with no abilities.",
			["Inert in Play"] = "Doge tokens don't generate studs in play."
		},
		EffectVariable = 0,
		Effect = {
			Name = "B2T",
			Description = "Whenever an allied Doge dies: Summon a Doge that's inert in play.",
			Ability = {
				OnSummon = {
					Power = { {
						"Strengthen",
						0,
						nil,
						nil,
						nil,
						nil,
						"DogeThanks"
					} },
					Target = "AlliedArchetype"
				},
				OnAllyDeath = {
					Archetype = "Doge",
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Much Sin. Very Purge. Wow.\""
	},
	["Doge Hound"] = {
		Id = 5596032639,
		Name = "Doge Hound",
		AltCards = {
			["Doge Hound-TH"] = {
				Name = "Golden Turkey",
				AttackEffect = "Divinity",
				Id = 125042651984307,
				Bio = "Many turkeys wish to be turned into gold, so they might finally be worth something."
			},
			["Red Retro Robot"] = {
				Name = "Red Retro Robot",
				AttackEffect = "LaserRed",
				Id = 9087738208,
				AltArt = true,
				Bio = "He's retro and he's red! he's also a ROBOT! Beep. Boop. This card is a part of BucketWarrior's Robot deck."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Bite",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "So it was all his work!"
	},
	["Redcliff Archer"] = {
		Id = 9964873981,
		Name = "Redcliff Archer",
		AltCards = {
			["Redcliff Archer-AN"] = {
				Name = "Assassin Kitty",
				AttackEffect = "Scratch",
				Id = 9417808214,
				Bio = "Me-ouch!"
			}
		},
		Health = 500,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 1,
		Effect = {
			Name = "Knockdown",
			Description = "Once each turn, whenever you cast a Redcliff card: Deal 150 damage to a target enemy fighter.",
			Ability = {
				OnAllySummon = {
					Power = { { "EVExactValueCheck", 1 } },
					Target = "Self",
					Archetype = "Redcliff",
					NoBlip = true
				},
				OnAllyCast = {
					Power = { { "EVExactValueCheck", 1 } },
					Target = "Self",
					Archetype = "Redcliff",
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
						{ "Damage", 150, "SingleEnemy", nil, nil, "RedArrow" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "Redcliff arrows are tipped with a special ore known as Iron. Don't get shot by one of these arrows, they hurt."
	},
	["Redcliff Enforcer"] = {
		Id = 10184667273,
		Name = "Redcliff Enforcer",
		AltCards = {
			["Redcliff Enforcer-AN"] = {
				Name = "Cool Kitty",
				AttackEffect = "Microphone",
				Id = 9417810077,
				Bio = "Me-wow!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		EffectVariable = 0,
		Effect = {
			Ability = {
				OnDeath = {
					Power = {
						{ "Strengthen", 400, nil, nil, nil, "RedcliffFlagEffect" },
						{ "Heal", 400 },
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Fighter", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "AlliedArchetype"
				},
				OnEVCheckFail = {
					Power = { { "Draw", 1, "Ally" } },
					Target = "Ally",
					NoBlip = true
				}
			},
			Description = "When this card dies: All allied Redcliff gain 400 health and power. If there's no allied fighters, draw a card instead.",
			AllowDeadAggressorTriggers = true
		},
		Bio = "Hail Redcliff!"
	},
	["Redcliff Mauler"] = {
		Id = 9964878879,
		Name = "Redcliff Mauler",
		AltCards = {
			["Redcliff Mauler-AN"] = {
				Name = "Ghost Kittens",
				AttackEffect = "Gravity",
				Id = 9417809652,
				Bio = "MeoOOoOOOoOoOw!"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "RedcliffAxe",
		SummonAnimation = "RedcliffBuff",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied Redcliff gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "AlliedArchetype",
			Increase = 100
		},
		Bio = "I have to maul you, nothing personal."
	},
	["Redcliff Elite Commander"] = {
		Id = 10206962248,
		Name = "Redcliff Elite Commander",
		AltCards = {
			["Redcliff Elite Commander-AN"] = {
				Name = "Kittens Fandango",
				AttackEffect = "MagicRed",
				Id = 9417810560,
				Bio = "Los Gatitos"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		SummonAnimation = "RedcliffLogoSelf",
		EffectAnimation = "MidSlashEffect",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, if there's 1500 or more power amongst allied fighters: It deals 300 damage to a target fighter. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{ "Damage", 300 }
			},
			Target = "Single",
			EffectRequirement = { "Power", "Ally", 1500, 99999 }
		},
		Bio = "The armies of Redcliff will RISE!"
	},
	["Redcliff Messenger"] = {
		Id = 9964879455,
		Name = "Redcliff Messenger",
		AltCards = {
			["Redcliff Messenger-AN"] = {
				Name = "Classic Kitty",
				AttackEffect = "Scratch",
				Id = 9417807804,
				Bio = "Keeping it classic."
			}
		},
		Health = 300,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Red = 1 },
		EffectAnimation = "RedcliffFlagEffect",
		Effect = {
			Name = "Message of Hope",
			Description = "When this card is cast: A target allied fighter gains 150 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "SingleAlly",
			Increase = 150
		},
		Bio = "They sent us a message. \"If we enter your city, we will burn it down and kill all your children.\" Our reply? \"If\"."
	},
	["Redcliff: Decimate!"] = {
		Id = 5832420387,
		Name = "Redcliff: Decimate!",
		AltCards = {
			["Redcliff: Decimate!-AN"] = {
				Name = "Purr-Fect Kitty Treat",
				Id = 9417811440,
				Bio = "Good kittens, the apex predators."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		EffectAnimation = "RedcliffSymbol",
		Color = "Red",
		Archetype = "Redcliff",
		Cost = { Neutral = 1, Red = 4 },
		Requirement = { "Board", "Ally", 1, 2 },
		Effect = {
			Name = "Board Clear!",
			Description = "Cast only if there's exactly one allied fighter.If it's a Redcliff, it gains 800 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 800, "AlliedArchetype" },
				{ "Strengthen", 800, "AlliedArchetype" },
				nil,
				nil,
				nil,
				nil,
				"RedcliffFlagEffect"
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 1, 2, "Redcliff" }
		},
		Bio = "SUPRISE! REDCLIFFS!"
	},
	["Redcliff: Rise!"] = {
		Id = 6533847008,
		Name = "Redcliff: Rise!",
		AltCards = {
			["Redcliff: Rise!-AN"] = {
				Name = "Ferocious Kitty Attack",
				Id = 9417987924,
				Bio = "MROW!",
				Summonant = "Redcliff Enforcer-AN"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Archetype = "Redcliff",
		Bio = "TO ARMS, MEN!",
		EffectVariable = 0,
		CustomReminder = {
			["Redcliff Enforcer"] = "A {W}{W}{R}{R}{R} 500/500 Redcliff. When it dies, all Allied Redcliff gain 400 health and power or you draw a card."
		},
		Summonant = "Redcliff Enforcer",
		Effect = {
			Name = "Board Boost!",
			Description = "All allied Redcliff gain 600 power.\nIf there's no allied Redcliff, summon a Redcliff Enforcer instead.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 600, nil, nil, nil, "RedcliffSymbol" },
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Archetype", "Redcliff" },
							"Ally"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "AlliedArchetype"
				},
				OnEVCheckPass = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Ally"
				}
			}
		}
	},
	["Redcliff Heretic"] = {
		Id = 9964875587,
		Name = "Redcliff Adept",
		AltCards = {
			["Redcliff Adept-AN"] = {
				Name = "Business Kitten",
				AttackEffect = "Scratch",
				Id = 9417809236,
				Bio = "It might not be a crime to wear a tie, but commiting mass tax evasion sure is!"
			}
		},
		Power = 350,
		Health = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Archetype = "Redcliff",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "I think that enemy got THE POINT!"
	},
	["Redcliff Rogue"] = {
		Id = 10206960509,
		Name = "Redcliff King Richard",
		AltCards = {
			["Redcliff King Richard-AN"] = {
				Name = "Sir Kitty Mcpawnington",
				Id = 9417810997,
				AttackEffect = "Slash",
				Effect = {
					Name = "Knockdown",
					Power = { {
						"RandomAdd",
						{
							"Redcliff Archer-AN",
							"Redcliff Mauler-AN",
							"Redcliff Adept-AN",
							"Redcliff Messenger-AN",
							"Redcliff Enforcer-AN"
						},
						"Ally"
					} },
					Target = "Ally"
				},
				Bio = "The Lord Commander of the Paws of Steel."
			},
			["Redcliff King Richard-PC"] = {
				Id = 10310134623,
				AttackEffect = "Slash",
				PackDisplayOverride = "Group Precon: Redcliff"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		SpecialEffectAnimation = "RedcliffLogoSelf",
		SummonAnimation = "KingRichardSummon",
		SummonedAnimation = "KingRichardSummon",
		Archetype = "Redcliff",
		Color = "Red",
		Rank = 5,
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if there's an allied Redcliff.",
			["Baseplate Rank"] = "You need 5 cards in your Baseplate to cast this card."
		},
		ChargeRequirement = { "Archetype", "Ally", 2, 9999, "Redcliff" },
		Cost = { Neutral = 3, Red = 5 },
		Effect = {
			Name = "Knockdown",
			Description = "If there's an allied Redcliff, this card has haste.\nWhenever this card attacks: Give yourself a common or uncommon Redcliff fighter card.",
			Type = "OnAttack",
			Power = { {
				"RandomAdd",
				{
					"Redcliff Archer",
					"Redcliff Mauler",
					"Redcliff Heretic",
					"Redcliff Messenger",
					"Redcliff Enforcer"
				},
				"Ally"
			} },
			Target = "Ally"
		},
		Bio = "It shall be swift."
	},
	["Eye of Overseer"] = {
		Id = 9804740090,
		Name = "Eye of Overseer",
		Health = 400,
		Power = 500,
		Rarity = "Common",
		Archetype = "Overseer",
		AttackEffect = "MagicGreen",
		EffectAnimation = "OverseerSelf",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "When this card is cast: All Overseer fighters in your hand gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "ArchetypeHandHeal", 100, "Ally" },
				{ "ArchetypeHandStrengthen", 100, "Ally" }
			},
			Target = "Self"
		},
		Bio = "Eye of Overseers patrol their fortresses until they have to blink."
	},
	stereoplexus = {
		Id = 9804723462,
		Name = "stereoplexus",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Ghostwalker",
		EffectAnimation = "OverseerSelf",
		Color = "Green",
		Archetype = "Overseer",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Trout Slap",
			Description = "Whenever this card attacks: All Overseer fighters in your hand gain 100 health.",
			Type = "OnAttack",
			Power = { { "ArchetypeHandHeal", 100, "Ally" } },
			Target = "Ally"
		},
		Bio = "Plexus descending, winter unending. Plexus departing, summer is starting."
	},
	["Overseer Wizard"] = {
		Id = 9058615614,
		Name = "Overseer Wizard",
		Health = 600,
		Power = 50,
		Rarity = "Common",
		Archetype = "Overseer",
		AttackEffect = "MagicGreen",
		EffectAnimation = "OverseerSelf",
		Color = "Green",
		Cost = { Green = 1 },
		CustomReminder = {
			["End Step"] = "The last part of a player's turn. Cards generate, fighters ready, and end step effects trigger."
		},
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "During your end step: All Overseers in your hand gain 50 health and 50 power.",
			Type = "OnEnd",
			Power = {
				{ "ArchetypeHandHeal", 50, "Ally" },
				{ "ArchetypeHandStrengthen", 50, "Ally" }
			},
			Target = "Self"
		},
		Bio = "\"In the cauldron boil and bake; Eye of newt and Eye of frog, Eye of bat and Eye of dog...\""
	},
	["Overseer Growth Ritual"] = {
		Id = 9238684906,
		Name = "Overseer Growth Ritual",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Archetype = "Overseer",
		AttackEffect = "MagicGreen",
		EffectAnimation = "OverseerRitual",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "Search your deck for two Overseer fighter cards.\nAll allied Overseers in play and in your hand gain 150 health.",
			Type = "OnSummon",
			Power = {
				{ "RandomTutorfor", "Overseer Fighter" },
				{ "RandomTutorfor", "Overseer Fighter" },
				{ "Heal", 150, "AlliedArchetype" },
				{ "ArchetypeHandHeal", 150, "Ally" }
			},
			Target = "Self"
		},
		Bio = "Overseers are known to replenish their ranks with the remaining warriors of their defeated opponents, willing or not."
	},
	["Overseer General"] = {
		Id = 9804738605,
		Name = "Overseer General",
		AltCards = {
			["Overseer Bamboozler"] = {
				Name = "Overseer Bamboozler",
				AttackEffect = "Crowbar",
				Id = 9709491306,
				AltArt = true,
				Bio = "wow. sumch bamboomzle. many steamlth. much sumbterfuge. heccimng spy."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		SpecialEffectAnimation = "OverseerEffect",
		Archetype = "Overseer",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Name = "Faker Hit",
			Description = "When this card is cast: Summon a clone of it. The clone has this card's current stats.",
			Type = "OnSummon",
			Power = { { "SummonCopy" } },
			EffectSummonCopyPreserveStats = true,
			Target = "Self"
		},
		Bio = "Generalising is his hobby, but knitting is his passion."
	},
	["Overseer Prophet"] = {
		Id = 10921313680,
		Name = "Overseer Prophet",
		AltCards = {
			RukatuKDHToken = {
				Id = 9804745044,
				CopyBodge = "RukatuKDHToken",
				AttackEffect = "Tempest",
				SummonAnimation = "MoneyStackSelf",
				Name = "Overseer Profit",
				Bio = "He's the reason money is not an issue for the Overseer army... probably."
			},
			["Dark Chuddy Psychologist"] = {
				Id = 125751747204300,
				Name = "Dark Chuddy Psychologist",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 467,
				Bio = "Have you ever played Overslop with your life on the line?"
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "LargeMagicGreenEffect",
		SpecialEffectAnimation = "OverseerEffect",
		Archetype = "Overseer",
		Color = "Green",
		Cost = { Green = 2, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Demon Eye",
			Description = "When this card is cast: A target enemy fighter loses 350 power. Also deal 350 damage to it if this card has 550 or more health.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 350, "SingleEnemy" },
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Gate", "Math", 501, "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 350, "Nil" },
					"Self"
				},
				{ "Damage", "Variable", "SingleEnemy" }
			},
			Target = "Self"
		},
		Bio = "His title sounds cool until you realise there are 2500 prophets in the Overseer army."
	},
	["Overseer's Steed"] = {
		Id = 9804724599,
		Name = "Overseer's Steed",
		Health = 300,
		Power = 400,
		Rarity = "Rare",
		Archetype = "Overseer",
		EffectAnimation = "OverseerSelf",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Demon Eye",
			Description = "When this card is cast: All Overseer fighters in your hand gain health equal to this card's health.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" },
					"Self"
				},
				{ "ArchetypeHandHeal", "Variable", "Ally" }
			},
			Target = "Self"
		},
		Bio = "The Godhand's reliable steed. It does more than mere transportation."
	},
	["Overseer Drake"] = {
		Id = 9804741116,
		Name = "Overseer Drake",
		Health = 400,
		Power = 500,
		Rarity = "Rare",
		Archetype = "Overseer",
		AttackEffect = "MagicGreen",
		EffectAnimation = "OverseerSelf",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Dreadsteed",
			Description = "When this card is cast: A target allied fighter gains power equal to this card's health.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" },
					"Self"
				},
				{ "Strengthen", "Variable", "SingleAlly" }
			},
			Target = "Self"
		},
		Bio = "Although frail and feeble, these drakes are capable of destruction."
	},
	["Overseer Beast"] = {
		Id = 9804725918,
		Name = "Overseer Beast",
		AltCards = {
			freyago = {
				Name = "freyago",
				Id = 6961808559,
				AttackEffect = "MagicGreen",
				AltArt = true,
				Bio = "An amazing artist that helps onetimesback with many things. In fact, this card itself is a surprise for all his help!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		Archetype = "Overseer",
		EffectAnimation = "OverseerSelf",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 6, Green = 1 },
		Summonant = "Overseer Beast",
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "During your end step: This card gains 200 health. Then it gains 1000 power if it has 1000 or more health.",
			Type = "OnEnd",
			Power = {
				{ "Heal", "200", "Self" },
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Gate", "Math", 999, "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 1000, "Nil" },
					"Self"
				},
				{ "Strengthen", "Variable", "Self" }
			},
			Target = "Ally"
		},
		Bio = "Never let the dogs out."
	},
	["Overseer Godhand"] = {
		Id = 9804725170,
		Name = "Overseer Godhand",
		AltCards = {
			["Overseer Godhand-PC"] = {
				Id = 10310133591,
				AttackEffect = "Tempest",
				PackDisplayOverride = "Group Precon: Overseer",
				Transformant = "Overseer Godhand Token-PC"
			},
			["mika_Lego, Overseer God"] = {
				Id = 132560421394450,
				Name = "mika_Lego, Overseer God",
				Transformant = "Overseer Godhand Token-MIKA",
				AttackEffect = "Scorch",
				SummonAnimation = "SummonGrimclaw",
				AltArt = true,
				PremiumArt = 462,
				Bio = "\"All will fall beneath Overseer's infantry.\""
			}
		},
		Health = 150,
		Power = 1500,
		Rarity = "Legendary",
		Archetype = "Overseer",
		AttackEffect = "MagicGreen",
		SummonAnimation = "OverseerGodhandSummon",
		SummonedAnimation = "OverseerGodhandSummon",
		EffectAnimation = "SelfScorch",
		Color = "Green",
		EffectVariable = 0,
		Transformant = "Overseer Godhand Token",
		Cost = { Neutral = 2, Green = 7 },
		Effect = {
			Name = "Explosive Spoils!",
			Description = "When this card is cast: Recur all allied fighters with lesser health than this card. Then this card transforms to lose all abilities.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Math", 0, "Nil" }
				},
				{
					"AlterEV",
					{ "Add", "Target", "Health", "Nil" }
				},
				{
					"MoveZone",
					{
						"Fighter_VariableOrLowerHealth",
						"GraveZone_Ally",
						"Hand_Ally",
						true,
						false,
						99
					}
				},
				{ "Transform", "Transformant", "Self" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "\"Come and get me, Redcliffs, for you and your petty weaponry will never land a single dent!\""
	},
	["Overseer Godhand Token"] = {
		Id = 9804725170,
		Name = "Overseer Godhand",
		AltCards = {
			["Overseer Godhand Token-PC"] = {
				Id = 10310133591,
				AttackEffect = "Tempest",
				PackDisplayOverride = "Group Precon: Overseer"
			},
			["Overseer Godhand Token-MIKA"] = {
				Id = 132560421394450,
				Name = "mika_Lego, Overseer God",
				Transformant = "Overseer Godhand Token-MIKA",
				AttackEffect = "Scorch",
				SummonAnimation = "SummonGrimclaw",
				Bio = "Also known as arf or john overseer (by himself), anyways hes some sort of god of the overseers"
			}
		},
		Health = 150,
		Power = 1500,
		Rarity = "Token",
		Archetype = "Overseer",
		SummonAnimation = "OverseerGodhandSummon",
		SummonedAnimation = "OverseerGodhandSummon",
		EffectAnimation = "OverseerSelf",
		AttackEffect = "MagicGreen",
		Color = "Green",
		EffectVariable = 0,
		Cost = { Neutral = 2, Green = 7 },
		Effect = {
			Name = "Explosive Spoils!",
			Description = "When this card is cast: Recur all allied fighters with lesser health than this card.\n(This ability triggers only once, and has already triggered.)",
			Type = "Null",
			Power = { {
				"AlterEV",
				{ "Set", "Math", 0, "Nil" }
			} },
			Target = "Self"
		},
		Bio = "\"Come and get me, Redcliffs, for you and your petty weaponry will never land a single dent!\""
	},
	["Power of Popularity"] = {
		Id = 10279206460,
		Name = "Power of Popularity",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Playertable", "Me", 0, 2, "Hand" },
		Effect = {
			Name = "Shine",
			Description = "Cast this card ignoring its colourless cost if it's the only card in your hand.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2, "Ally" } },
			Target = "Self"
		},
		Bio = "Everyone rushing to play disaster survival stopped them from surviving a real disaster."
	},
	ColonelGraff = {
		Id = 10340888210,
		Name = "ColonelGraff",
		AltCards = {
			AndN0te = {
				Name = "AndN0te",
				Id = 12070336713,
				AltArt = true,
				AttackEffect = "Gravity",
				Commissioner = { 752959064 },
				Bio = "Do not stand at my grave and cry; I am not there. I did not die."
			},
			["kvbgz, Einherjar"] = {
				Name = "kvbgz, Einherjar",
				Id = 16446073949,
				AltArt = true,
				PremiumArt = 224,
				AttackEffect = "Gravity",
				Bio = ""
			},
			["ColonelGraff-Mango"] = {
				Name = "The Recruiter",
				Id = 104820241528208,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"So you wanna enter our squad eh? Well you need to prove yourself by earning 5 badges across this Tuff Town\""
			}
		},
		Health = 300,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Shine",
			Description = "When this card dies: Draw a card.",
			Type = "OnDeath",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Do you not hear the jaws theme behind you?"
	},
	EXLatios = {
		Id = 9925852130,
		Name = "EXLatios",
		AltCards = {
			Blueshunder189 = {
				Id = 9925844382,
				AltArt = true,
				AttackEffect = "Electric",
				Name = "Blueshunder189",
				CopyBodge = "Blueshunder189",
				Bio = "Blueshunder189 is a French Developer who makes lots of Models like Weapons, Guns, Robots, Vehicles, and Much More!"
			},
			Zembie1YT = {
				Id = 111725769228005,
				AltArt = true,
				AttackEffect = "Electric",
				Name = "Zembie1YT",
				Bio = "Zembie1 is an American Composer and Percussionist"
			}
		},
		Health = 550,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Shield = true,
		Effect = {
			Name = "Shine",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "He's just a guy who loves twin blades."
	},
	EpicLatiosLord = {
		Id = 4899314359,
		Name = "EpicLatiosLord",
		AltCards = {
			["EpicLatiosLord-V"] = {
				Id = 16283036499,
				Name = "Subject, Belover of One's Self",
				AttackEffect = "Punch",
				Bio = "HAAAAAIIIII I AM SUBJECT HOURS AND THIS IS MY CLOSEST FRIEND, SUBJECT HOURS"
			},
			["Building a Robloxian"] = {
				Name = "Building a Robloxian",
				Commissioner = { "FreeThePolarBear" },
				Id = 129726446703603,
				AltArt = true,
				PremiumArt = 882,
				Bio = "\"Building a Robloxian is hard work\""
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 5 },
		CustomReminder = {
			["Gift of Snow"] = "A regenerating fighter gains 100 health during its end steps."
		},
		Effect = {
			Name = "Purlot",
			Description = "When this card is cast: A target allied fighter gains 150 Health. Attach regenerating to it.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 150 },
				{ "EquipGear", "Regenerating Mod", "Single" }
			},
			Target = "SingleAlly"
		},
		Bio = "He renders snow meaningless."
	},
	Razikai = {
		Id = 4800946348,
		Name = "Razikai",
		AltCards = {
			RyCitrus = {
				Id = 7652113817,
				Name = "RyCitrus",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Effect = {
					Name = "Citrus",
					Power = { { "Summon", "Pac-Blox" } }
				},
				Bio = "Soon, freshly squeezed."
			},
			["Razikai-Sun"] = {
				Id = 10283657927,
				AttackEffect = "Jab",
				Effect = {
					Power = { { "Summon", "Razikai Token 1-Sun" } }
				},
				Bio = "He was a skater boy..."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Description = "When this card dies: Summon a clone of it without this effect.",
			Type = "OnDeath",
			Power = { { "Summon", "Razikai Token 1" } },
			Target = "Ally"
		},
		Bio = "Rainbow science helps me defy death!"
	},
	["Razikai Token 1"] = {
		Id = 4800943511,
		AltCards = {
			["Pac-Blox"] = {
				Id = 7652114410,
				AttackEffect = "MagicYellow",
				Name = "Pac-Blox",
				Bio = "Sweet citric revenge!"
			},
			["Razikai Token 1-Sun"] = { Id = 10283665257, AttackEffect = "Jab", Bio = "See you later, boy." }
		},
		Name = "Razikai",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Rainbow science helps me delay death actually..."
	},
	["Toothy Deer's Blessing"] = {
		Id = 4784598521,
		Name = "Toothy Deer's Blessing",
		AltCards = {
			["Toothy Deer's Blessing-C"] = {
				Name = "Toothy Deer's Gift",
				Id = 8256333780,
				Bio = "The Toothy Deer put disembodied heads on his christmas lights! What a naughty deer."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Lunar = true,
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Subversion",
			Description = "Set a target fighter's stats to 500/500.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 500 },
				{ "SetPower", 500 }
			},
			Target = "Single"
		},
		Bio = "If you look like a toothy deer, make sure to hide."
	},
	Newbie = {
		Id = 3667704129,
		Name = "Newbie",
		AltCards = {
			["Newbie-Val"] = {
				Name = "Female Newbie",
				CopyBodge = "Newbie-Val",
				Id = 7138175294,
				AttackEffect = "Jab",
				Bio = "Is that even a problem?"
			},
			Julsons = {
				Name = "Julsons",
				CopyBodge = "Julsons",
				Id = 5131519565,
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "This card is an alternate art of Newbie."
			},
			UnknownRider1324 = {
				Name = "UnknownRider1324",
				Id = 14002445151,
				AttackEffect = "Punch",
				Commissioner = { 24281590, 41926915 },
				AltArt = true,
				PremiumArt = 75,
				Bio = "Surviving on Davidii's islands was more of a chore than a problem."
			}
		},
		Health = 650,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Bonk",
			Description = "Whenever an effect draws you a card: This card gains 300 power.\nDuring your end step: Reset this card's stats.",
			Ability = {
				OnAllyDraw = {
					Power = { { "Strengthen", 300 } },
					Target = "Self"
				},
				OnEnd = {
					Power = { { "Reset" } },
					Target = "Self"
				}
			}
		},
		Bio = "But alas, the common noob has been predated on ever since a new species of newb entered its flock. The common noob faces extinction from war and loss of habitat."
	},
	DeadZoneHark = {
		Id = 8657846253,
		Name = "DeadZoneHark",
		AltCards = {
			["DeadZoneHark-Val"] = {
				Name = "LoveZoneHark",
				Id = 7138169941,
				AttackEffect = "Jab",
				CopyBodge = "DeadZoneHark-Val",
				Bio = "My glove touches all, and fills them with confidence."
			}
		},
		Health = 350,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "DeadZone seems innocent enough... until his glove touches you."
	},
	DairingPoopHead = {
		Id = 6608829930,
		Name = "Dairingpoophead",
		AltCards = {
			["DairingPoopHead-ArtV"] = {
				Id = 6729895845,
				AltArt = true,
				Bio = "You just dared him. Prepare for hellish dairy."
			},
			PoopHead = {
				Id = 6599293440,
				Name = "DairingWanKenobi",
				Bio = "It's over, Myrm! I have the high ground."
			},
			["DairingPoopHead-AN"] = {
				Id = 10337580500,
				AttackEffect = "Flame",
				Name = "DairingSpookHead",
				Bio = "Dairy Achieved."
			},
			["Arial Unshackled"] = {
				Id = 98334930657239,
				Name = "Arial Unshackled",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 846,
				Bio = "\"A prisoner of fate broken free from an unjust game, walking beyond the chains of destiny to carve his own path.\""
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Mental Preparation",
			Description = "When this card is cast: Lock a target allied fighter for 2 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "SingleAlly",
			Increase = 2
		},
		Bio = "You just dared him. Prepare for dairy."
	},
	AsrielMemer = {
		Id = 4934903224,
		Name = "AsrielMemer",
		AltCards = {
			["Rin, Edge Gaming"] = {
				Id = 14555971990,
				Name = "Gnomsky Brothers",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "PICK ME UP\n\t\t\t\tPUT ME DOWN!\n\t\t\t\tHA-HE!"
			},
			AsrielWeeper = {
				Id = 7548620674,
				Name = "AsrielWeeper",
				AttackEffect = "Arcane",
				Bio = "The past clings to him. Do you remember the lost?"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 1 },
		Effect = {
			Name = "Icon Hardscope",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "You're a kid now! Dark souls fills you with determination! Zhang He is love, Zhang He is life! Storm Crow OP! Git Gud! End him rightly! Fractal anything is a viable deck!"
	},
	Sylrath = {
		Id = 8938593775,
		Name = "Sylrath",
		AltCards = {
			["Sylrath-Val"] = {
				Id = 8938776377,
				Name = "Sylrath",
				CopyBodge = "Sylrath-Val",
				Bio = "One of the best Blox Card lovers in the game!"
			},
			["Free and the Magic Key"] = {
				Id = 97187792192171,
				Name = "Free and the Magic Key",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 413,
				Bio = "I wish I was good at this game."
			}
		},
		Health = 100,
		Power = 400,
		Rarity = "Uncommon",
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
	["Glaciem Mage"] = {
		Id = 10184573414,
		Name = "Glaciem Mage",
		AltCards = {
			["Glaciem Mage-Hal"] = {
				Name = "Bedsheet Ghost",
				AttackEffect = "Scratch",
				Id = 10184712492,
				Bio = "OoOoOoOooOoOoOoOo"
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		EffectAnimation = "Freeze",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Freeze Snap",
			Description = "When this card is cast: Lock a target fighter for 1 turn.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Single",
			Increase = 1
		},
		Bio = "All frost mages befriend a toothy deer from birth. This teaches them not to give random animals frostbite."
	},
	Pizzablawk = {
		Id = 3526494843,
		Name = "Pizzablawk",
		AltCards = {
			["Ravcade-Pizzablock"] = {
				Id = 4653254649,
				Name = "Pizzablock",
				AttackEffect = "MagicBlue",
				CopyBodge = "Ravcade-Pizzablock",
				Bio = "Mmmm... pizza cubes~ :P"
			},
			["Forbidden Token-Val"] = {
				Id = 4916104535,
				CopyBodge = "Forbidden Token-Val",
				Name = "Vivian, Creeper Killer",
				AttackEffect = "Arcane",
				Bio = "\"I'm fighting by your side from now on! I've made my choice... and I'm not turning back!\""
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Spicy :^)"
	},
	["Heavy Rain"] = {
		Id = 7644605365,
		Name = "Neon District",
		AltCards = {
			["Heavy Rain-Sun"] = {
				Name = "British Summer",
				Terrariant = "Rain Terrain-Sun",
				Id = 10246026959,
				Bio = "Everyday, Brits are suffering from rain and floods in their BLOODY SUMMER. With your help, we can help rehabilitate these people to their proper leisure."
			},
			["Rabbit Attack!"] = {
				Id = 122152721692985,
				Name = "The Pillared Sea",
				AltArt = true,
				AttackEffect = "MagicYellow",
				Addant = "Rogue Burglar",
				Bio = "The Serpent of Seven looks upon your vessel. "
			},
			["Heavy Rain-Mango"] = {
				Name = "Bluestein Caves",
				Id = 111408087542027,
				AttackEffect = "MagicBlue",
				Addant = "Moonleak-Mango",
				Terrariant = "Rain Terrain-Mango",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "A large cave system buried under Mango Mountain. It is of the only abundant sources of Bluestein and houses the entrance way to a sinister, <b>Wrathful</b> dimension."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 323275951,
		Color = "Blue",
		Terrain = true,
		Terrariant = "Rain Terrain",
		Addant = "Moonleak",
		Cost = { Blue = 3 },
		CustomReminder = {
			["Deluge Deus Fahrenheit"] = "Cast 'Living World' to animate this as a 1500/200 that, once each turn, when you draw a card, draws another and have all allied Terrarians gain 100 health."
		},
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: Give yourself a fleeting action, inert in all zones, that costs 3{B}. It draws a card when cast.",
			Ability = {
				OnAllyStart = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					MetaData = {
						Fleeting = true,
						Cost = { Blue = 3 }
					}
				}
			},
			EffectInert = true
		},
		Bio = "\"The rain's too heavy to march? This is why skeletons are better than you lot! They don't complain about some sog! What's it like having a worse work ethic than a bloxdamn corpse!?\"\n- Kgxraqyt, Korblox Deathkeeeper"
	},
	BlueTaslem = {
		Id = 10184239090,
		Name = "BlueTaslem",
		AltCards = {
			["Advocate, Star Celestial"] = {
				Id = 13978705848,
				Name = "Advocate, Star Celestial",
				AttackEffect = "StudBlast",
				PackDisplayOverride = "IcyTea",
				Commissioner = { 2799009389 },
				Bio = "\t<i>(Uh oh)</i>\n\t<i>You're in trouble-</i>\n\t<i>I step up in the game and I burst that bubble!</i>\n\t\t\t\t\t"
			},
			No_YouSir = {
				Id = 85781693730538,
				Name = "No_YouSir",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 473,
				Bio = "Surely won't get targeted before you can get some cheaper cards, right?"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		CustomReminder = { ["Heavy Rain"] = "This card's cost reduction stacks." },
		Effect = {
			Name = "BobRoss the Canvas the Card the Effect",
			Description = "At the start of your turns: Remove a {W} from each card in your hand.",
			Type = "OnAllyStart",
			Power = { {
				"IncreaseCost",
				{ -1, "Neutral", "Nil" },
				"AllyHand"
			} },
			Target = "Opponent"
		},
		Bio = "I will make it rain."
	},
	["Eye Spy"] = {
		Id = 4783087019,
		Name = "Eye Spy",
		AltCards = {
			["Entangling Lights"] = {
				Id = 8158660600,
				Name = "Entangling Lights",
				Bio = "Marvin noticed it too late. The wall's electric vines wrapped around his leg, dragging him upward, dragging him to the ceiling. He hoped that Marvin was okay. He hoped that Marvin would make it out alive."
			},
			["Fluffle's Incurable Misery"] = {
				Id = 9326591913,
				Name = "Fluffle's Incurable Misery",
				Bio = "PFFFFFT BAHAHAHAHA (snort) HAHAHA HO-HO-HO HAAA! (wheeze) I-I CAN'T PFFFFFT HO-HO (snort) BAHAHAHAHAA (wheeze) HAAAAAHAHAHAHA (wheeze) HEHAHAHAHE HAAAAAAA PFFFFFFFT HO-HO-HO HAAA (wheeze) HOW COULD YOU LOSE AFTER ALL THAT OH MY GOD BAHAHAHAHAHAHAH HO-HO HEHAHAHA (snort) HO-HAHAHAHA (wheeze) HAAAAAAAaaaa... (dies)"
			},
			Accord = {
				Id = 123277892375578,
				Name = "Accord",
				Commissioner = { "Accordingas11" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 783,
				Bio = "don’t die.  I want you to cry for me when I die."
			},
			["Eye Spy-Mango"] = {
				Name = "Mitch's Sorrow",
				Id = 125951595538459,
				AttackEffect = "Ice",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "You fought well Mangoton, but not well enough<br/>You fought well Mangoton, but not well enough<br/>Not well enough<br/>Not enough<br/><b>Not enough</b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		Color = "Blue",
		Lunar = true,
		Cost = { Neutral = 1, Blue = 1 },
		Effect = {
			Name = "Nerve Wrecker",
			Description = "All enemy fighters lose 100 power.\nReveal your opponent's hand.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100 },
				{ "RevealHand", 1 },
				{ "Draw", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "I spy with my floating eye, someone's about to die."
	},
	["DIY Azurewrath"] = {
		Id = 4989224718,
		Name = "DIY: Azurewrath",
		AltCards = {
			["DIY Azurewrathv2"] = {
				Id = 9244793519,
				AltArt = true,
				Name = "DIY Ancalagon",
				AttackEffect = "Slash",
				Bio = "Some say bags aren't magical... I beg to differ."
			},
			["DIY Azurewrath-AN"] = {
				Id = 9362069734,
				Name = "Script Robber",
				AttackEffect = "Storm",
				Bio = "It's not stealing, it's repurposing assets."
			}
		},
		Health = 1050,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Arcane",
		EffectAnimation = "AzureBreathAlly",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3 },
		Effect = {
			Name = "Value Trading",
			Description = "When this card is cast: Deal 500 damage to all allied fighters. Draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 500 },
				{ "Draw", 2 }
			},
			Target = "Ally"
		},
		Bio = "It's like the country club for hobos!"
	},
	SharpTH = {
		Id = 10280543780,
		Name = "SharpTH",
		AltCards = {
			["SharpTH-E"] = {
				Id = 10280544917,
				AttackEffect = "MagicRed",
				CopyBodge = "SharpTH-E",
				Bio = "All I had to do was use magic, I don't know why they make it seem so hard."
			},
			["SharpTH-Mango"] = {
				Name = "Rockhead Smith",
				Id = 111455307167567,
				AttackEffect = "Hammer",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "The Rockheads see their village as a crucible; they will be melted down so they can be forged into something better."
			}
		},
		Power = 400,
		Health = 400,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Recognize",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1, "Ally" } },
			Target = "Single"
		},
		Bio = "If you come first in this race, I will give you a holy sword. Come third and I'll give you a toaster, though."
	},
	["Lord Tethamet"] = {
		Id = 10280546221,
		Name = "Lord Tethamet",
		AltCards = {
			onetimesback = {
				Id = 10280521335,
				Name = "onetimesback",
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "Roblox animator/developer. Can be clumsy at times but is fairly good at scripting!"
			},
			["Lord Tethamet-AN"] = {
				Id = 9709387854,
				Name = "Glaciem Knight",
				AttackEffect = "Ice",
				Bio = "\"Freeze the light! Frost-fire Break!\""
			},
			["Lord Tethamet-Mango"] = {
				Name = "Coldsteel",
				Id = 96064346754164,
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "This is my own original Rayburn. <b>DO NOT STEAL</b>"
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5 },
		Effect = {
			Name = "Quick Shot",
			Description = "When this card is cast: A target fighter loses 300 power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 300
		},
		Bio = "Just dark magic and a sword, nothing much you can do about it."
	},
	KrocoStar = {
		Id = 10280519886,
		Name = "Krocostar",
		AltCards = {
			CreeperKillerTrueAgent = {
				Name = "Creeper Killer, True Agent",
				Id = 5961959313,
				AttackEffect = "Bubbles",
				CopyBodge = "CreeperKillerTrueAgent",
				Bio = "Coming straight from the latest Splatfest, he's about to turn this game into a work of art."
			},
			["KrocoStar-Sun"] = {
				Name = "Leviathan of the Seas",
				Id = 10283641867,
				AttackEffect = "Storm",
				Bio = "That fear you feel? Harness it to the trial ahead."
			}
		},
		Health = 1500,
		Power = 750,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 7 },
		Overload = true,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "NO. ITS KROCOSTAR! GET IT RIGHT, MOM!"
	},
	["Thunder Bolt"] = {
		Id = 10281222382,
		Name = "Thunder Bolt",
		AltCards = {
			["H-Thunder"] = { Id = 9275628196, Name = "Thunder Blast", Health = 0, Power = 0 },
			["H-ThunderAlt"] = {
				Id = 134008539691401,
				Name = "Lightning Blast",
				Health = 0,
				Power = 0,
				Bio = "BY LIGHTNING BE BLASTED!"
			},
			["Thunder Bolt-AN"] = {
				Id = 9345611967,
				Name = "Frost Nuke",
				Bio = "Why would you bring a nuke to a New Year's Eve party!?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		Color = "Blue",
		Cost = { Neutral = 6 },
		Fading = true,
		Effect = {
			Name = "Zappow!",
			Description = "\tDestroy all fighters and all non-Colourless cards in your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"GenZoneDiscard",
					{ "Blue", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Green", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Red", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Yellow", 0 }
				},
				{ "Destroy", 30, "All" }
			},
			Target = "Ally"
		},
		Bio = "The world is bored of war."
	},
	SONICTHEHEDGEHOGXXX = {
		Id = 10281314184,
		Name = "SONICTHEHEDGEHOGXX",
		AltCards = {
			["The Cloaker"] = {
				Id = 10281301447,
				Name = "The Cloaker",
				AttackEffect = "Slash",
				Bio = "You call this resisting arrest? We call this a difficulty tweak!"
			},
			Fuyu = {
				Id = 10281294903,
				Name = "Fuyu",
				AttackEffect = "Ice",
				AltArt = true,
				Bio = "\"(UH OH) BACK TO THE WINTER AGAIN! (OH NO) BACK TO THE WINTER AGAIN! (NOT AGAIN) BACK TO THE WINTER AGAIN!\""
			},
			["Indie Game Idiots"] = {
				Id = 11346775596,
				Name = "Indie Game Idiots",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "One of them is about to betray someone else: It’s vital to the plot and not at all overused."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 6 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Return a target enemy fighter and all terrain cards in play to their hand.",
			Type = "OnSummon",
			Power = {
				{ "Return", 30, "AllyTerrain" },
				{ "Return", 30, "EnemyTerrain" },
				{ "Return" }
			},
			Target = "SingleEnemy"
		},
		Bio = "SCREAM IN ALL CAPS! INDEED! MAXIMUM LOGIC!"
	},
	IcyTea = {
		Id = 12929271865,
		Name = "IcyTea",
		AltCards = {
			["IcyTea-ArtV"] = {
				Id = 10281561624,
				CopyBodge = "IcyTea-ArtV",
				AltArt = true,
				Bio = "Master of arts and ice, IcyTea is an impeccable fighter capable of advanced magic and destructive power. Watch out! Part of the 'Aife' Collection! Collect them all!"
			},
			["IcyTea-C"] = {
				Id = 10281558062,
				Name = "Saint Tea",
				Bio = "You gave Santa such a wedgie that he disintegrated into a children's trading card.\nMerry Christmas 2021!",
				NoFoilWorth = true
			},
			["IcyTea-AN"] = {
				Id = 9352965935,
				Name = "Green Tea",
				Bio = "...this goes against everything I stand for."
			},
			ArcticAstra = {
				Id = 15055113919,
				Name = "ArcticAstra",
				AltArt = true,
				PremiumArt = 138,
				Commissioner = { 68610826, 520319516 },
				Bio = "\"Brrr...\""
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		SpecialEffectAnimation = "Freeze",
		SummonAnimation = "IcyTeaSummon",
		SummonedAnimation = "IcyTeaSummon",
		SummonAnimationEffect = true,
		AttackEffect = "IcePunch",
		Color = "Blue",
		Overload = true,
		Cost = { Neutral = 2, Blue = 9 },
		Effect = {
			Name = "King's Freeze",
			Description = "When this card dies: Lock all enemy fighters that cost 6 or fewer total studs for 2 turns.",
			Ability = {
				OnDeath = {
					Power = { { "Lock", 2 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy" },
						Condition = "TotalCostOrLess",
						Modifier = 6
					}
				}
			},
			Type = "OnDeath"
		},
		Bio = "Master of ice. Conqueror of redcliff. Slayer of dragons. Dies to noob spray."
	},
	Ambamby = {
		Id = 10243402470,
		Name = "Ambamby",
		AltCards = {
			["Ambamby-Sun"] = {
				Id = 10243404448,
				AttackEffect = "MagicRed",
				Bio = "Light up the night!"
			}
		},
		Power = 800,
		Health = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3 },
		Overload = true,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Amber and Ambamby are the same person, only Amber is older. Does this mean that she's her own mother?"
	},
	Kamov = {
		Id = 9964973138,
		Name = "Kamov",
		AltCards = {
			["Tertiarick, Snake Eater"] = {
				Id = 14555983277,
				Name = "Kamov",
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "Kept you waiting, huh?"
			},
			["Kamov-AWIH"] = {
				Id = 17600656217,
				Name = "Brutal Bouncer",
				AttackEffect = "Punch",
				Bio = "Strong Left",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		SummonAnimation = "SummonSlide",
		Color = "Red",
		Charge = true,
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Not even Russia is safe from Doges."
	},
	Blockerwiz = {
		Id = 10243412479,
		Name = "Blockerwiz",
		AltCards = {
			["Blockerwiz-E"] = {
				Id = 10243414297,
				CopyBodge = "Blockerwiz-E",
				AttackEffect = "Scratch",
				Bio = "Remember kids: eating raw eggs could give you salmonella poisoning! The symptoms of salmonella include chills, dehydration, diarrhea, fatigue, fever, headaches, loss of appetite, and pain areas in the abdomen or muscles."
			},
			["accordingas XI"] = {
				Id = 134789371822163,
				Name = "accordingas XI",
				Commissioner = { "accordingas11" },
				AttackEffect = "Gun",
				AltArt = true,
				PremiumArt = 735,
				Bio = "\"Be grateful for taking his place.\""
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Detects any foes with his tail, so be cautious!"
	},
	Mag = {
		Id = 9964971525,
		Name = "Mag",
		AltCards = {
			["RAT Assault Units George & Karl"] = {
				Id = 8072497700,
				AttackEffect = "Rifle",
				Name = "RAT Assault Units George & Karl",
				Bio = "Who among you has the courage to face certain death? Who among you will heed our call?"
			},
			["0x2991 Nevermore"] = {
				Id = 87352766682390,
				Name = "0x2991; Nevermore",
				AttackEffect = "DoomSlash",
				AltArt = true,
				PremiumArt = 582,
				FeaturedDisplay = true,
				Bio = "And my soul from out that shadow that lies floating on the floor<br/>Shall be lifted — nevermore"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Nobody knows what he really does, most just think of him as Ignis Mage Jr."
	},
	["Ignis Mage"] = {
		Id = 9964974000,
		Name = "Ignis Mage",
		AltCards = {
			["Ignis Mage-Alt"] = { Id = 9964814181, AltArt = true, CopyBodge = "Ignis Mage-Alt" },
			["Ignis Mage-AN"] = {
				Id = 9709384551,
				Name = "Ignis Knight",
				Bio = "\"Purge the dark! Flame-break Charge!\""
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Flare",
		EffectAnimation = "FireBreathSmall",
		Color = "Red",
		Cost = { Red = 2 },
		Effect = {
			Name = "Pyroblast",
			Description = "When this card is cast: Deal 250 damage to a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250, "SingleEnemy" } },
			Target = "Single"
		},
		Bio = "From a spark, he generates a power that can cause instant combustion to anyone."
	},
	Rad = {
		Id = 10318239482,
		Name = "Rad",
		AltCards = {
			log4nb43 = {
				Id = 9964871116,
				Name = "log4nb43",
				AttackEffect = "Flame",
				Bio = "Face my true self!"
			},
			Chad = {
				Id = 9964873265,
				Name = "Chad",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "My main deck? The 2016 starter one. "
			},
			["Rad-Sun"] = {
				Id = 9433166980,
				Name = "Pro Surfer",
				AttackEffect = "Whirlpool",
				Bio = "Emotional Relief!?"
			},
			["xChasrielx, Master of Mono-Red"] = {
				Id = 14387331556,
				Name = "xChasrielx, Master of Mono-Red",
				AttackEffect = "DoomStorm",
				Commissioner = { 3666743569, 41926915 },
				AltArt = true,
				PremiumArt = 102,
				Bio = "\"I am the backbone of my people. To them- I am a hero. But to you..? I am your worst enemy.\""
			}
		},
		Health = 900,
		Power = 700,
		Rarity = "Common",
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
	["Crescendo, the Soul Stealer"] = {
		Id = 6464467949,
		Name = "Crescendo, the Soul Stealer",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "FireBreath",
		Color = "Red",
		Lunar = true,
		Cost = { Red = 2, Neutral = 2 },
		Effect = {
			Name = "Beam Sword",
			Description = "Deal 500 damage to a target fighter. It gains 1000 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 1000 },
				{ "Damage", 500 }
			},
			Target = "Single"
		},
		Bio = "\"The Crescendo greatly empowers its wielder, at the cost of losing their mind to the blade's influence. Through the power of the Moon, it is possible to supress this side effect. It is believed 87% of its copies are in our possession.\" ~ Paraselene Report #63"
	},
	Dayren = {
		Id = 10243290684,
		Name = "Dayren",
		AltCards = {
			["Dayren-E"] = {
				Id = 8650620245,
				CopyBodge = "Dayren-E",
				Bio = "A nice little jig on his drums was all he needed to amass an army of rabbits."
			},
			PopularTimesInfinity = {
				Id = 10783478136,
				Name = "PopularTimesInfinity",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "I’m too popular for this."
			},
			BloxyColaHugh = {
				Id = 100073890683711,
				Name = "BloxyColaHugh",
				PremiumArt = 332,
				AltArt = true,
				Bio = "Making dumb decks since 2024."
			}
		},
		Power = 0,
		Health = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 1, Neutral = 1 },
		Effect = {
			Name = "Game Night!",
			Description = "During your end step: All allied fighters gain 50 power.",
			Type = "OnEnd",
			Power = "Strengthen",
			Target = "Ally",
			Increase = 50
		},
		Bio = "First to charge, first to fight."
	},
	Oz = {
		Id = 10243308339,
		Name = "Oz",
		AltCards = {
			["Oz-Hal"] = { Id = 10243309271, Bio = "I told you not to touch them!" },
			thee_wind = {
				Id = 114425633799906,
				Name = "swaglord63",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "Self proclaimed Mr. Movement Tech."
			}
		},
		Health = 700,
		Power = 550,
		Rarity = "Uncommon",
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
	Pixellus = {
		Id = 4977887167,
		Name = "Pixellus",
		AltCards = {
			["Pixellus-Sun"] = {
				Id = 10243347130,
				AttackEffect = "TimeBomb",
				Bio = "Step right up for some free ice cream! Hm? Why do I have a cannon? Because it’s better to launch it at your face than hand it out to you!"
			},
			A_wakehead = {
				Id = 10243370024,
				Name = "A_wakehead",
				CopyBodge = "A_wakehead",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "He doesn't sleep."
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Uncommon",
		AttackEffect = "TimeBomb",
		EffectAnimation = "SmallExplosionEffect",
		Color = "Red",
		Cost = { Neutral = 4, Red = 2 },
		Effect = {
			Name = "Adventurer's Cannon",
			Description = "When this card is cast: Deal 300 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 300 } },
			Target = "Single"
		},
		Bio = "Adventure Club enthusiast. Bit cheesy. Likes McNuggets."
	},
	["DIY Biggerhead"] = {
		Id = 10186349478,
		Name = "DIY: Biggerhead",
		AltCards = {
			["DIY Biggerheadv2"] = {
				Id = 10186362263,
				AltArt = true,
				CopyBodge = "DIY Biggerheadv2",
				EffectAnimation = "EngulfFire",
				Bio = "Who needs Robux for a Biggerhead, I'll just kill them and take it myself."
			},
			["DIY Surgeon?"] = {
				Id = 9225602116,
				Name = "DIY Surgeon?",
				AltArt = true,
				EffectAnimation = "MidSlashEffect",
				Bio = "Hey, you aren't my regular physician!"
			},
			["DIY Biggerhead-AN"] = {
				Id = 121367612608915,
				Name = "Homeless Man",
				EffectAnimation = "EngulfFire",
				Bio = "ey boys, the moon's risin'. All the better to watch 'im beg for mercy!"
			}
		},
		Health = 300,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		EffectAnimation = "EngulfFire",
		Effect = {
			Name = "Inflated Ego",
			Description = "When this card is cast: Deal 250 damage to a target fighter. It gains 300 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 300 },
				{ "Damage", 250 }
			},
			Target = "Single"
		},
		Bio = "He just wants to have a Biggerhead hat!"
	},
	Firebrand1 = {
		Id = 10243094402,
		Name = "Firebrand1",
		AltCards = {
			["Firebrand1-E"] = {
				Id = 10243097171,
				Name = "Alien Parasites",
				AttackEffect = "Scratch",
				Bio = "HOW IS THIS EVEN EASTER RELATED I HAVE NO IDEA OH GOD HELP-"
			},
			["Soul, Executive Manager"] = {
				Id = 13771246605,
				Name = "Soul, Executive Manager",
				AltArt = true,
				Commissioner = { 21564633 },
				AttackEffect = "MoltenScythe",
				EffectAnimation = "ChronologicalSelf",
				Bio = "<i><font color=\"#FF5733\">Face the Sin, Save the Cheems</font></i>"
			},
			["MELANCHXLICAL, Despaired"] = {
				Id = 13978704530,
				Name = "MELANCHXLICAL, Despaired",
				AltArt = true,
				PremiumArt = 72,
				Commissioner = { 297087291, 105850516 },
				AttackEffect = "Rifle",
				Bio = "<i>my house is on fire.</i>\n<i>my hands smell of gasoline.</i>\n<i>when I opened up, they found not blood, but glitter.</i>\n<i>stuck in the machine, it's bleeding to death.</i>\n<i>is this Telephone?</i>\n\t\t\t\t\t"
			},
			["UNIT-01"] = {
				Id = 77352124434012,
				Name = "UNIT-01",
				PremiumArt = 354,
				AltArt = true,
				Bio = "An eternal testament that the human race existed."
			},
			["Illushia, Illusionary Love"] = {
				Id = 123821655151561,
				Name = "Illushia, Illusionary Love",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 528,
				Bio = ""
			}
		},
		Health = 800,
		Power = 450,
		Rarity = "Rare",
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
	["Fallen Guardian"] = {
		Id = 116931046682088,
		Name = "Fallen Guardian",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "British",
		Color = "Red",
		Lunar = true,
		Cost = { Neutral = 1, Red = 2 },
		EffectAnimation = "MidBritishEffect",
		EffectVariable = 0,
		Effect = {
			Name = "Fallen Guardian",
			Description = "Deal 350 damage to a target fighter. Then deal another 350 damage to it if it has no {W} in its stud cost.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "NeutralCost", nil },
					"Single"
				},
				{
					"AlterEV",
					{ "Exactsies", "Math", 0, "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 350, "Nil" },
					"Self"
				},
				{ "Damage", 350 },
				{ "Damage", "Variable" }
			},
			Target = "Single"
		},
		Bio = "And he can't get up."
	},
	WafflzDude = {
		Id = 10243141930,
		Name = "WafflzDude",
		AltCards = {
			wolf3843 = {
				Id = 10243144807,
				Name = "wolf3843",
				AttackEffect = "FirePunch",
				Bio = "Red death, the prince of demons..."
			}
		},
		Health = 700,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "TimeBomb",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		WeakenImmune = true,
		Effect = {
			Name = "Shatter",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "KABOOM!?"
	},
	["Lady RedNight"] = {
		Id = 9965505232,
		Name = "Lady Rednight",
		AltCards = {
			["Lady RedNight-Sun"] = {
				Id = 9964822589,
				Bio = " Lady Red, White, and BlueNight. Green too, but we didn’t have the budget for Yellow."
			},
			AppearedOcean57 = {
				Id = 9964823286,
				Name = "AppearedOcean57",
				AttackEffect = "TimeBomb",
				AltArt = true,
				Bio = "It's all about going for a Beat em up Hack and Slash Style.\nPractically everyone in this Planet always looks for a new Opponent to challenge.\nDon't be Afraid It's Okay to Shoot them with your SnowBall Launchers They're Robots!"
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 4, Red = 2 },
		Effect = {
			Name = "Firascale",
			Description = "Whenever this card attacks: Set your colourless studs to {W}{W}{W}{W}.",
			Type = "OnAttack",
			Power = "SetNeutral",
			Target = "Ally",
			Increase = 4
		},
		Bio = "A powerful commander that leads her main squad to success in each mission they take."
	},
	["Luck o The Lobsters"] = {
		Id = 10243036847,
		Name = "Luck o' the Lobsters",
		AltCards = {
			["Luck o The Lobsters-Sun"] = { Name = "Crab Rave", Id = 7138321816, Bio = "BOARD IS GONE!" },
			["Low Taper Colo"] = {
				Id = 84308291115754,
				Name = "Low Taper Colo",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 445,
				Bio = "rawest fade in duelshire"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Red",
		AlternateCostRequirement = { "Playertable", "Me", 0, 1501, "Life" },
		Cost = { Neutral = 12 },
		AlternateCost = { Neutral = 4 },
		EffectAnimation = "Lobsters",
		AddBlock = true,
		Fading = true,
		Effect = {
			Name = "Damage for Top Deck",
			Description = "Cast this card using {W}{W}{W}{W} if you have 1500 or less life.\nDeal 1500 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 1500 } },
			Target = "All"
		},
		Bio = "Sometimes, you just have to trust in lobsters."
	},
	ChosenCoast = {
		Id = 10242915998,
		Name = "ChosenCoast",
		AltCards = {
			["ChosenCoast-C"] = { AttackEffect = "MagicRed", Id = 11674973005, Bio = "" }
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Flare",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		CounterBlock = true,
		Effect = {
			Name = "Sixdering",
			Description = "Whenever this card destroys another: It gains 100 health.",
			Type = "OnDestroy",
			Power = { { "Heal", 100 } },
			Target = "Self"
		},
		Bio = "How was the coast chosen? Reverse-Meritocracy."
	},
	Dignity = {
		Id = 10846499897,
		Name = "Dignity",
		AltCards = {
			["Dignity-C"] = {
				Id = 8100827372,
				Bio = "\"I don't think it was sugar you put in those cookies...\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 2 },
		Rank = 8,
		CustomReminder = {
			["Baseplate Rank"] = "You need 8 cards in your Baseplate to cast this card."
		},
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Some say he's an exploiter, others claim he was an anonymous hacker, all we know is that he's back with a powerful orb."
	},
	Cindering = {
		Id = 10243847631,
		Name = "Cindering",
		AltCards = {
			["ObamaXJesus, Bread Champion"] = {
				Id = 6911256230,
				Name = "ObamaXJesus, Bread Champion",
				AltArt = true,
				Bio = "What da dog doin?"
			},
			["Cindering-V-Offer"] = {
				Id = 16305125178,
				Name = "Fixated Idol",
				AttackEffect = "Punch",
				Bio = "\"Thank you to all my fans!~ Spread the love and positivity! Give me your heart and I'll adore you to the heavens above!!!~\""
			},
			["The Godfather"] = {
				Id = 18298923587,
				Name = "The Godfather",
				AttackEffect = "Revolver",
				Bio = "Ziege Siksis stars as Veto Carlyone in:"
			},
			["W. Corp Cleanup Agent AndN0te"] = {
				Id = 125268031265144,
				Name = "W. Corp Cleanup Agent AndN0te",
				AltArt = true,
				PremiumArt = 295,
				SummonAnimation = "ApolloSummon",
				SummonAnimationEffect = true,
				Bio = "<b><font color=\"#FF0000\">There is ironic humor in taking a train to go clean a different train of such... peculiar nature, wouldn't you agree?</font></b>"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Charge = true,
		Cost = { Red = 6 },
		Effect = {
			Name = "Sixdering",
			Description = "When this card is cast: Your opponent loses 600 life.",
			Type = "OnSummon",
			Power = { { "Inflict", 600, "Opponent" } },
			Target = "Self"
		},
		Bio = "He hexes six people to burn in hell every six hours."
	},
	Pillager = {
		Id = 4819852818,
		Name = "Pillager",
		AltCards = {
			PillagerArt = { Id = 3526484247, Bio = "She pillages." },
			["Pillager-Sun"] = { Id = 9166665959, Name = "Pillagers", Bio = "They pillage." },
			PillagerAlt2 = { Id = 16446072244, AltArt = true, Bio = "He pillages." }
		},
		Health = 500,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Regen = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "He pillages for a light chicken with rice and gravy."
	},
	Pirate = {
		Id = 3238125667,
		Name = "Pirate",
		AltCards = {
			["Pirate-Val"] = {
				Name = "Love Pirate",
				Id = 4918975622,
				CopyBodge = "Pirate-Val",
				Bio = "It's not cheating. He needed some relief."
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Rum!",
			Description = "When this card is cast: A target fighter loses 250 power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 250
		},
		Bio = "I'm not stealing. I'm merely stimulating the economy."
	},
	Langz = {
		Id = 11029868445,
		Name = "Langz",
		AltCards = {
			["Langz-E"] = {
				Id = 70871065918970,
				AttackEffect = "Tempest",
				Bio = "Don't you lecture me with your 30k Robux haircut!"
			},
			Supr_J = {
				Id = 6253310396,
				Name = "Supr_J",
				AttackEffect = "Jab",
				EffectAnimation = "DuckCall",
				AltArt = true,
				Bio = "Likes to forget he exists sometimes."
			}
		},
		Power = 150,
		Health = 150,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		EffectAnimation = "CameraSelf",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Glitch Bomb",
			Description = "When this card is cast: Deal 150 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 150 } },
			Target = "Opponent"
		},
		Bio = "It is time for your army to languish."
	},
	Chef = {
		Id = 3164482815,
		Name = "Chef",
		AltCards = {
			["Chef-E"] = {
				Id = 8650625971,
				CopyBodge = "Chef-E",
				AttackEffect = "Flare",
				Name = "Egg Chef",
				Bio = "If you aren’t in the mood for lunch, breakfast is still available. Delicious Robloxian eggs, cooked to perfection, sunny side up."
			},
			Baker = {
				Id = 8100782983,
				CopyBodge = "Baker",
				AttackEffect = "Flare",
				Name = "Baker",
				Bio = "And for desert, why not try caramelized robloxian? Now with extra icing!"
			},
			["Chef-Val"] = {
				Id = 7138182998,
				CopyBodge = "Chef-Val",
				AttackEffect = "Flare",
				Name = "Romantic Chef",
				Bio = "Dont like caramel? How about a romantic desert, melted, buttered robloxian parts mixed with peanut butter and white chocolate on a cookie!"
			},
			["Seafood Chef"] = {
				Id = 7424193071,
				Name = "Seafood Chef",
				AttackEffect = "Knife",
				Bio = "Why not enjoy a bit of our local seafood? Cracked Robloxian legs served with hot butter sauce and a zest of lemon!"
			},
			["Chef-Hal"] = {
				Id = 77486517517715,
				Name = "Butcher Chef",
				AttackEffect = "Slash",
				Bio = "In the mood for something sweet? Try my brain-infused cupcakes!"
			},
			["Ramen Chef"] = {
				Id = 9345603822,
				Name = "Ramen Chef",
				AttackEffect = "Flame",
				AltArt = true,
				Bio = "The source where ninjas get their godly anime powers."
			},
			["Chef-AN"] = {
				Id = 9345662546,
				Name = "Classic Chef",
				AttackEffect = "Blaze",
				Bio = "You never forget your first taste."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 1 },
		EffectAnimation = "FoodThrow",
		Effect = {
			Name = "Boiled!",
			Description = "When this card is cast: It deals 200 damage to a target fighter.",
			Type = "OnSummon",
			Power = "Damage",
			Target = "Single",
			Increase = 200
		},
		Bio = "Today's lunch special is YOU! Delicious plastic in every bite!"
	},
	Cillow = {
		Id = 4352224843,
		Name = "Cillow",
		AltCards = {
			["Dr.Alyssa"] = {
				Id = 6494863092,
				Name = "Dr.Alyssa",
				AttackEffect = "Blaze",
				AltArt = true,
				Bio = "One of the world's finest scientists, and yet she's still in her teens."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 1 },
		Effect = {
			Name = "Booster",
			Description = "When this card is cast: Your opponent loses 400 life. You gain 400 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -400 },
				{ "Inflict", 400, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Sometimes, I like to throw ice on the ground and pretend I'm a walrus."
	},
	Brycen27 = {
		Id = 6030848643,
		Name = "Brycen27",
		AltCards = {
			TheBrycen27 = {
				Id = 5694256728,
				AttackEffect = "Revolver",
				Bio = "Too much green? More like too little. He needs more green."
			},
			["Brycen27-AN"] = {
				Id = 10348251167,
				Name = "THE REAL BRYCEN27",
				AttackEffect = "Tempest",
				Bio = "Can we get much greener?"
			}
		},
		Health = 650,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Render",
			Description = "When this card is cast: You gain {W}.",
			Type = "OnSummon",
			Power = { { "Neutral", 1, "Ally" } },
			Target = "Single"
		},
		Bio = "Sponsored by the archnemesis of blender, Brice7 (TM)"
	},
	["Life Potion"] = {
		Id = 5409411348,
		Name = "Life Potion",
		AltCards = {
			Eggnog = {
				Id = 8100786432,
				Name = "Eggnog",
				Bio = "An eggcellent drink for all of your family."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		EffectAnimation = "LifePotion",
		Bio = "Sometimes a potion helps you in the long run.",
		Effect = {
			Name = "Life Potion",
			Description = "A target fighter gains 750 health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "Single",
			Increase = 750
		}
	},
	Spikle = {
		Id = 3238129571,
		Name = "Spikle",
		AltCards = {
			["Spikle-Sun"] = {
				Id = 15589659579,
				Name = "Newbie Surfer",
				AttackEffect = "Whirlpool",
				Bio = "He'll get the hang of it."
			},
			["Varya Esfir, Foreign Star"] = {
				Id = 120977731197132,
				Name = "WeepieWoop73",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 205,
				Bio = "Yay!"
			}
		},
		Health = 1750,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Green",
		Cost = { Neutral = 4 },
		TransformImmune = true,
		Effect = {
			Name = "Slow Pain",
			Description = "During your end step: This card deals 400 damage to itself.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "Self",
			Increase = 400
		},
		Bio = "This is a turtle robot. Don't ask why, don't ask how."
	},
	Kcbeast666 = {
		Id = 5530617050,
		Name = "kc666beast",
		AltCards = {
			["Kcbeast666-Sun"] = { Name = "Brock", Id = 9197547066, Bio = "AKA the Sharknado Tamer." }
		},
		Health = 1000,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Sit. Fetch. Devastate."
	},
	TigerCode = {
		Id = 5942334549,
		Name = "TigerCode",
		AltCards = {
			["Neon Rave pwolfe6628"] = {
				Name = "Neon Rave Vengeful_Sage",
				AltArt = true,
				Id = 7092814547,
				AttackEffect = "LaserGreen",
				Bio = "\"The Neon Rave ™️ : Producing better parties than PLURRAL since 409 AD\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "LargeMagicGreenEffect",
		Color = "Green",
		Cost = { Green = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Vampire Bite",
			Description = "When this card is cast: A target enemy fighter loses 400 power. You gain 400 life.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 400 },
				{ "Cost", -400 }
			},
			Target = "SingleEnemy"
		},
		Bio = "The President of ROGO magazine. I didn't know ROBOTIC pogo sticks was such an interesting topic."
	},
	Duckywow = {
		Id = 5188678151,
		Name = "Duckywow",
		AltCards = {
			["Egg Hunter Jerry"] = {
				Name = "Egg Hunter Jerry",
				AttackEffect = "LinkedSword",
				Id = 8072466493,
				Bio = "Remember when Roblox rained eggs onto every game so hard they broke their servers? Good times."
			}
		},
		Health = 1150,
		Power = 350,
		Rarity = "Uncommon",
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
	Samksoon321 = {
		Id = 4924764808,
		Name = "samksoon321",
		AltCards = {
			["terra iex"] = {
				Name = "terra iex",
				AttackEffect = "MagicGreen",
				Id = 14387340381,
				Commissioner = { 95635166, 13353647 },
				AltArt = true,
				PremiumArt = 104,
				Bio = "A 0-dimensional point has no qualities beyond existing. It is a piece of the very property of being real."
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Render",
			Description = "When this card is cast: All allied fighters gain 200 health.",
			Type = "OnSummon",
			Power = { { "Heal", 200 } },
			Target = "Ally"
		},
		Bio = "Shiny glowing neon green crystals never hurt anyone."
	},
	["Smart Planner"] = {
		Id = 3238129940,
		Name = "Stonetroid Warrior",
		AltCards = {
			["Latchula, Voyager"] = {
				Name = "Latchula, Voyager",
				Id = 6472506474,
				AltArt = true,
				Bio = "If anyone bothers you: Stab, stab, cut."
			},
			["Stonetroid Warrior-AN"] = {
				Name = "Smart Planner",
				AttackEffect = "Electric",
				Id = 9352971968,
				Bio = "Line up theory ftw."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
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
	Oozlebachr = {
		Id = 11865479808,
		Name = "Oozlebachr",
		AltCards = {
			["Oozlebachr-Sun"] = {
				Name = "Oozlebachr",
				Id = 7189919552,
				Bio = "To be one with nature also means to have fun once in a while."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Nature's Gift",
			Description = "When this card dies: Put a Green Stud into your Baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 1 }
			} },
			Target = "Self"
		},
		Bio = "Sleeping voice of nature. Forumer too."
	},
	["DIY Dominus"] = {
		Id = 4720104463,
		Name = "DIY: Dominus",
		AltCards = {
			["DIY DominusV2"] = {
				Id = 9225602766,
				AltArt = true,
				CopyBodge = "DIY DominusV2",
				Bio = "iiMasant told me this would make me rich. I think he lied q.q"
			},
			["DIY Dominus-AN"] = {
				Id = 9408921737,
				Name = "Darkfire Imp",
				AttackEffect = "Scorch",
				Bio = "\"Accept this gift of fire!\""
			}
		},
		Health = 400,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "Darkheart",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Arkhaiomelisidonophunikheratos",
			Description = "When this card is cast: All allied fighters gain 50 Power. Swap their stats.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 50 },
				{ "Swap", 100000 }
			},
			Target = "Ally"
		},
		Bio = "I want to be rich so I made a dominus in crayons!"
	},
	Lord_Gizmo = {
		Id = 10288365306,
		Name = "Lord_Gizmo",
		AltCards = {
			["Fish Enthusiast"] = {
				Id = 14959554572,
				Name = "Fish Enthusiast",
				AltArt = true,
				PremiumArt = 127,
				Commissioner = { 1062936194 },
				ArtAnimation = "fishenthusiast",
				AttackEffect = "Recyclables",
				EffectAnimation = "EatTacosAlly",
				Bio = "You lose many things chasing a dream."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Knife",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Hellfire",
			Description = "When this card is cast: All allied fighters gain 100 health.",
			Type = "OnSummon",
			Power = { { "Heal", 100 } },
			Target = "Ally"
		},
		Bio = "OMG COMMANDO PENGU 030"
	},
	Byte = {
		Id = 10288777948,
		Name = "Scripth",
		AltCards = {
			["Axoldia Annihilate!!!"] = {
				Name = "Axoldia Annihilate!!!",
				Id = 8179457078,
				AltArt = true,
				Bio = "Your mother, Scripth. I activated her."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "gaster",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Description = "Destroy a target fighter.",
			Type = "OnSummon",
			Power = { { "Destroy", 30 } },
			Target = "Single"
		},
		Bio = "A Kohl attracts another."
	},
	KingCactaur = {
		Id = 10288713467,
		Name = "KingCactaur",
		AltCards = {
			["KingCactaur-ArtV"] = {
				Id = 10310534493,
				Name = "PrinceCactaur",
				Bio = "Family is what I value the most."
			},
			["KingCactaur-Val"] = {
				Id = 10288717838,
				Name = "QueenCactaur",
				Bio = "Behind ever great advisor is a great... whatever she is."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Venomshank",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		Effect = {
			Name = "Value gaining",
			Description = "When this card is cast: Put a target allied fighter into your Baseplate.",
			Type = "OnSummon",
			Power = { { "MoveGenZone" } },
			Target = "SingleAlly",
			EffectRequirement = { "Board", "Ally", 1, 9999 }
		},
		Bio = "Senior advisor of Value Town."
	},
	IlIll = {
		Id = 8652280941,
		Name = "Il Ill",
		SearchTerms = "Barcode",
		AltCards = {
			["IlIll-Val"] = {
				Id = 10288702535,
				Name = "IlIll",
				AttackEffect = "MagicRed",
				CopyBodge = "IlIll-Val",
				Bio = "Now haunting a teddy bear on a shelf, he is sure to make your valentines day a living hell."
			},
			["IlIll-Timothy"] = {
				Id = 10288703989,
				Name = "Rockey",
				AttackEffect = "ModernRocket",
				CopyBodge = "IlIll-Timothy",
				Bio = "* Rockey blasts exhaust fumes in your face affectionally"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		EffectAnimation = "FieldSwipe",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Barcode",
			Description = "When this card is cast: Deal 300 damage to all enemy fighters. They lose 150 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300 },
				{ "Weaken", 150 }
			},
			Target = "Opponent"
		},
		Bio = "He's an escapee from a local toystore, now he's back to have his revenge."
	},
	CellBloxTango = {
		Id = 10288540134,
		Name = "CellBloxTango",
		AltCards = {
			["Astral Isle Sorcerer Elizabeth"] = {
				AttackEffect = "Storm",
				Id = 8072498622,
				Name = "Astral Isle Sorcerer Elizabeth",
				Bio = "Violence is crass and destructive. Magic is used to grow, not to destroy."
			}
		},
		Health = 100,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 5 },
		Effect = {
			Name = "Overgrown",
			Description = "During your end step: All allied fighters gain 150 health.",
			Type = "OnEnd",
			Power = "Heal",
			Target = "Ally",
			Increase = 150
		},
		Bio = "Apparently enjoys to tango and loves nature."
	},
	Blockhaak = {
		Id = 10288484378,
		Name = "Blockhaak",
		AltCards = {
			["Blockhaak-E"] = {
				Id = 8730735430,
				Name = "Scaley The Dragon",
				AttackEffect = "Blaze",
				Bio = " The Egg of Scales hatched into Scaley, the Dragon. Born from the roots of earth, and scales like the steel of Anabaris, Scaley, descends upon thee with glorious power to wield."
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Darkheart",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Name = "Ostrich Cannon",
			Description = "During your end step: This card gains 200 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "His effect idea TOTALLY not taken from his League of Roblox skillset."
	},
	XxWonderzxX = {
		Id = 10288647779,
		Name = "XxWonderzxX",
		AltCards = {
			["XxWonderzxX-Sun"] = {
				AttackEffect = "Bubbles",
				Id = 9180236365,
				Bio = "Any object given enough force can become a weapon of mass destruction... AND A POOL NOODLE IS NO EXCEPTION!"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		Effect = {
			Name = "Endless Spooks",
			Description = "Whenever this card attacks: Deal 250 damage to all enemy fighters.",
			Type = "OnAttack",
			Power = { { "Damage", 250 } },
			Target = "Opponent"
		},
		Bio = "TOP BREAD, TOP ROBLOXIAN."
	},
	["1337"] = {
		Id = 10288384845,
		Name = "1337",
		AltCards = {
			["1337-C"] = {
				Name = "The Yule Cat",
				AttackEffect = "Scratch",
				Id = 10288357289,
				Bio = "Eclipse's estranged ex."
			},
			["Mechanical Warrior, Losternmeyer"] = {
				Name = "Mechanical Warrior, Losternmeyer",
				AttackEffect = "Tempest",
				Id = 9709357179,
				AltArt = true,
				Bio = "In the very beginning it was never about winning or losing but it's about me taking you down right here where you stand!"
			}
		},
		Health = 1330,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		OmniImmune = true,
		Overload = true,
		Color = "Green",
		Cost = { Green = 9 },
		Effect = {
			Name = "Stud",
			Description = "",
			Type = "Null",
			Power = "None",
			Target = "Self",
			Increase = 0
		},
		Bio = "... Those stats are close enough, right? Just like, remove the 0's."
	},
	emilvita = {
		Id = 10279272462,
		Name = "emilvita",
		AltCards = {
			["emilvita-C"] = {
				Id = 10279274459,
				AttackEffect = "Jab",
				Bio = "He opens the bus windows as much as he can. He enjoys a gentle breeze."
			},
			["Blockhead Jeremy"] = {
				Id = 8072472706,
				AttackEffect = "Axe",
				Name = "Blockhead Jeremy",
				Bio = ":>"
			}
		},
		Health = 50,
		Power = 450,
		Rarity = "Common",
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
	Pilgrim = {
		Id = 10279337992,
		Name = "Pilgrim",
		AltCards = {
			["Pilgrim-AN"] = {
				Id = 9362062743,
				AttackEffect = "Rifle",
				Bio = "If it's called Thanksgiving, what's with the turkey killing?"
			},
			["Outrageous Builder Philip"] = {
				Id = 8072481820,
				AttackEffect = "Revolver",
				Name = "Outrageous Builder Philip",
				Bio = "Before the introduction of DevEx, you could buy a lifetime of Outrageous Builder's club for $349.95. (That's about six Yellow studs.)"
			}
		},
		Health = 300,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Time for a turkey hunt boys!"
	},
	TeeVee = {
		Id = 3300006853,
		Name = "TeeVee",
		AltCards = {
			["TeeVee-Val"] = {
				Name = "Ms. Teevee",
				Id = 7138180360,
				CopyBodge = "Ms. Teevee",
				Bio = "The only channels you will find on this TeeVee are romcoms."
			},
			["Ravcade-TeeVee"] = {
				Id = 8072451245,
				Bio = "Television has *really* gone down in quality these days, hasn't it?"
			},
			["Rayburn The Unconquerable Snow Black"] = {
				Id = 113739748385909,
				Name = "Rayburn; The Unconquerable Snow Black",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 547,
				Bio = "I CAN F- I CAN FE- I CAN F- BURN TO ASHES!"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Common",
		AttackEffect = "Electric",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "One of the many species of TeeVee, they help you find your favorite channel."
	},
	GemInNight = {
		Id = 6806011003,
		Name = "GemInNight",
		AltCards = {
			["GemInNight-Sun"] = {
				Id = 10278950277,
				Name = "GemInNight",
				Bio = "Actually, I’m a Leo..."
			},
			Le_Geometry = {
				Id = 5356491804,
				Name = "Le_Geometry",
				CopyBodge = "Le_Geometry",
				AltArt = true,
				Bio = "More like Le_[insert word here]"
			},
			["Ice, Frost Samurai"] = {
				Id = 9159873892,
				Name = "Ice, Frost Samurai",
				AltArt = true,
				Bio = "He's cold, too cold."
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 5 },
		Effect = {
			Name = "Corrosive Gems",
			Description = "When this card is cast: Deal 300 damage to a target fighter. It gains 300 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 300 },
				{ "Damage", 300 }
			},
			Target = "Single"
		},
		Bio = "Midnight is where he shines the brightest."
	},
	CAROLlNE = {
		Id = 99280004889230,
		Name = "CAROLlNE",
		AltCards = {
			["CAROLINE-ArtV"] = {
				Id = 10279221324,
				AltArt = true,
				Name = "LDShadowDargon2468",
				CopyBodge = "CAROLINE-ArtV",
				Bio = "THE ULTIMATE ᵈᵉᵖʳᵉˢˢⁱᵒⁿ, 3ʳᵈ member of the Bad Time Trio."
			},
			["CAROLlNE-Hal"] = {
				Id = 10279222647,
				Name = "Cereal Killer",
				Bio = "Do you pour the blood in first?"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "CAROLINE",
			Description = "Whenever an allied fighter dies: This card gains 100 power.",
			Type = "OnAllyDeath",
			Power = { { "Strengthen", 100 } },
			Target = "Self"
		},
		Bio = "Welcome to my little Sunshine World."
	},
	Pilot = {
		Id = 10279416851,
		Name = "Pilot",
		AltCards = {
			["Pilot-Val"] = {
				Id = 10310634417,
				Bio = "It took a lot of fuel to make this, you know. You could at least call back."
			},
			["Pilot-AN"] = {
				Id = 9345611279,
				Name = "Deer",
				AttackEffect = "Bubbles",
				Bio = "Mlem."
			},
			Stabby = {
				Id = 13028389932,
				Name = "Stabby",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 20,
				Commissioner = { 631767866 },
				Bio = "<i>\"Thanks for picking me up, my name is Stabby, now quickly use me, use me!\"</i>"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
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
	WarbearNomkins = {
		Id = 4899468237,
		Name = "WarbearNomkins",
		AltCards = {
			WarnomBearkins = { Id = 4899467942, AttackEffect = "Ice", Bio = "He vibing!" },
			Redifine11 = {
				Id = 11674965863,
				AltArt = true,
				Name = "Redifine11",
				AttackEffect = "Katana",
				Bio = "Artist wielding a golden katana ready to make scrap of any card."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever this fighter attacks: All allied fighters gain 100 health.",
			Type = "OnAttack",
			Power = { { "Heal", 100 } },
			Target = "Ally"
		},
		Bio = "Former Blox Cards artist, WarbearNomkins' arts will leave you saying \"Woah!\""
	},
	["Sword Fights on the Heights"] = {
		Id = 5948836104,
		Name = "Sword Fights on the Heights",
		AltCards = {
			["Sword Fights on the Heights-Sun"] = { Id = 9166675304, Name = "Umi", Terrariant = "Umi Terrain", Bio = "" },
			["Firelink Shrine"] = {
				Id = 9247741248,
				Name = "Firelink Shrine",
				AltArt = true,
				Terrariant = "Cinder Terrain",
				Bio = "Bearer, Seek, Seek, Lest."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 293402616,
		Terrain = true,
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Terrariant = "Sword Terrain",
		CustomReminder = {
			["Spirits of the Heights"] = "Cast 'Living World' to animate this as a 900/500 that destroys what it attacks if it has lesser power."
		},
		Effect = {
			Name = "Stud",
			Description = "Whenever a fighter dies: All players lose 50 life.",
			Type = "OnAnyDeath",
			Power = {
				{ "Inflict", 50 },
				{ "Cost", 50 }
			},
			Target = "Opponent"
		},
		Bio = "It's much easier to kill them when they don't expect you. Or they cant handle your awesome Firebrand range."
	},
	Pikachukiller101 = {
		Id = 4784601336,
		Name = "Pikachukiller101",
		AltCards = {
			Aphirlar = {
				Name = "Aphirlar",
				Id = 5673301527,
				AltArt = true,
				CopyBodge = "Aphirlar",
				Bio = "Watch out, this card CARDS BACK!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Some people are gen wunners. He's a gen sixer."
	},
	SoftCollision = {
		Id = 5001162546,
		Name = "SoftCollision",
		Health = 450,
		Power = 650,
		Rarity = "Uncommon",
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
	["DIY Headphones"] = {
		Id = 3238114129,
		Name = "DIY: Headphones",
		AltCards = {
			["DIY Headphonesv2"] = {
				Id = 9238697943,
				AltArt = true,
				Name = "DIY Builderman",
				AttackEffect = "Crowbar",
				CopyBodge = "DIY Headphonesv2",
				Bio = "Sure, they gave helmets out, but who needs to wear them when you have a paper ba-"
			},
			["DJ Kangaroo"] = {
				Id = 8475544708,
				AltArt = true,
				Name = "DJ Kangaroo",
				AttackEffect = "Scratch",
				Bio = "He is australian, loves Hip hop, and always has the sickest beatz."
			},
			["DJ Headphones-AN"] = {
				Id = 9371360991,
				Name = "Bling Bacon",
				AttackEffect = "Jab",
				Bio = "Abc for rich dad."
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 1 },
		Effect = {
			Name = "Purlot",
			Description = "When this card is cast: All allied fighters gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "Ally"
		},
		Bio = "I just look like that one cool guy."
	},
	Reggie = {
		Id = 6329993411,
		Name = "Reggie",
		AltCards = {
			Starla = {
				Id = 14782618742,
				Commissioner = { 1649636588, 8289996 },
				AttackEffect = "LaserYellow",
				EffectAnimation = "MidMagicYellowEffect",
				Name = "Starla",
				PremiumArt = 111,
				AltArt = true,
				Bio = "⭐"
			},
			["Reggie-AN"] = {
				Id = 18298923811,
				AttackEffect = "Revolver",
				Name = "Shuu Lumina",
				Bio = "Guess you could call him a sharp shuu-ter."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "MidSlashEffect",
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 2 },
		Effect = {
			Name = "Steal",
			Description = "When this card is cast: Deal 250 damage to a target fighter. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 250 },
				{ "Draw", 1, "Ally" }
			},
			Target = "Single"
		},
		Bio = "Representing Devil Beater by Drager, is the con-artist himself. Make a bet with him, I dare you."
	},
	Preston = {
		Id = 10445112966,
		Name = "Preston",
		AltCards = {
			["Builders Club Trainee Cleetus"] = {
				Id = 8072484809,
				AttackEffect = "Crowbar",
				Name = "Builders Club Trainee Cleetus",
				Bio = "Huh? Why did they give this helmet ou-"
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: It deals 50 damage to a target enemy fighter. That fighter loses 50 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 50 },
				{ "Weaken", 50 }
			},
			Target = "SingleEnemy"
		},
		Bio = "Don't call him Midnight Droid, or else he'll ramble on about it in his Q&As. His name is Prestongo on ROBLOX."
	},
	ChildofGiotto = {
		Id = 10310143331,
		Name = "ChildofGiotto",
		Health = 100,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		CustomReminder = {
			["Speedy Building"] = "A fleeting card is destroyed during your end step if it's not cast."
		},
		Effect = {
			Name = "Guard",
			Description = "When this card is cast: Draw a fleeting card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "You did a really good job on the previous map, Child. Cheers! - Myr"
	},
	Mzh3000 = {
		Id = 8207875894,
		Name = "Mzh3000",
		AltCards = {
			["Shattered Sylrath"] = {
				Id = 8207875314,
				AltArt = true,
				Name = "Shattered Sylrath",
				AttackEffect = "SkeleScythe",
				Bio = "Deep in the depths of nothingness lurks a long lost fighter. Awaken him if you dare."
			},
			Joy = {
				Id = 8207873858,
				AltArt = true,
				Name = "Joy",
				AttackEffect = "MagicYellow",
				Bio = "Friends will always be by your side, even in the afterlife."
			},
			["Golden Robot"] = {
				Id = 9034078089,
				AltArt = true,
				Name = "Golden Robot",
				AttackEffect = "Arcane",
				Bio = "Robots love your town! How could they not? Until they turn greedy...!"
			},
			["Mzh3000-AN"] = {
				Id = 9354422659,
				Name = "Hidden Razor",
				AttackEffect = "Slash",
				Bio = "Trust me, this card is totally competitively legal."
			},
			["Travelling Student"] = {
				Id = 13763487897,
				Name = "Travelling Student",
				Commissioner = { 105850517, 8289996 },
				AttackEffect = "Blaze",
				EffectAnimation = "BlazeBreathEnemy",
				Bio = "\"Reading every card effect is serious business!\""
			},
			Jean_Vergil = {
				Id = 11966561604,
				Name = "Jean_vergil",
				AttackEffect = "XhartyrSlash",
				SummonAnimation = "XhartyrSummon",
				EffectAnimation = "SmallXhartyrSlashEnemy",
				AltArt = true,
				Bio = "I am the storm that is approaching!"
			},
			["comicbb, Office Angel"] = {
				Id = 15941935584,
				Name = "comicbb, Office Angel",
				AttackEffect = "Katana",
				AltArt = true,
				PremiumArt = 199,
				Bio = "BEHOLD! THE POWER OF AN ANGEL!"
			},
			Lezduit = {
				Id = 16446073800,
				Name = "Lezduit",
				AttackEffect = "Revolver",
				AltArt = true,
				PremiumArt = 223,
				Bio = "LEZDUIT!<br/>(It seems like this gatlian’s mind is in a pretty messed up state, as all it can say is its own name. Though it’s still physically capable, as it can deal huge damage in the blink of an eye. Seems best not to mock its inability to speak)"
			},
			["Hans' Spree"] = {
				Name = "Hans' Spree",
				Id = 16562310281,
				AltArt = true,
				PremiumArt = 228,
				Bio = "\"HANNSPREEEE!!!\" - Hans von Stahlhelm, Board Control."
			},
			["Classic Igna Moment"] = {
				Id = 84458254703444,
				Name = "Classic Igna Moment",
				AttackEffect = "MzhLaser",
				Bio = "7 fighters? You REALLY thought i'm not running mzh? f o o l",
				AltArt = true,
				PremiumArt = 305
			},
			["MINTB0X, Board Savior"] = {
				Id = 106434020461984,
				Name = "MINTB0X, Board Savior",
				PremiumArt = 371,
				AltArt = true,
				Bio = "All these spams... let's tidy things up, shall we?"
			},
			["MZH3000-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 107683010348210,
				ArtAnimation = "Mzh3000-10thAnni",
				Bio = "Always outnumbered, but never outmatched."
			},
			Miklobo99 = {
				Id = 131211548910842,
				Name = "Miklobo99",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 523,
				Bio = "\"What wincon? You mean the pile of ash, Wyatt?\""
			},
			["Vixcilitiy The Hematite Annihilator"] = {
				Id = 70569639117816,
				Name = "Vixcilitiy, The Hematite Annihilator",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 565,
				Bio = "All this... just for it to be annihilated with the playing of a card."
			},
			["Hollow, Captain of Tingen Nighthawks"] = {
				Id = 138090473515716,
				Name = "Hollow, Captain of Tingen Nighthawks",
				ArtAnimation = "eighthundrethMZHalt",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 642,
				Bio = "\"We are guardians, but also a bunch of miserable wretches that are constantly fighting against threats and madness.\""
			},
			["rayburn89 if he had aura"] = {
				Id = 117118888721217,
				Name = "rayburn89 if he had aura",
				Commissioner = { "Rayburn_89" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 768,
				Bio = "this is a reference to something you just don't know what yet"
			}
		},
		Health = 250,
		Power = 1500,
		Rarity = "Epic",
		AttackEffect = "MzhLaser",
		EffectAnimation = "BeamEnemy",
		AlternateCost = { Neutral = 3 },
		AlternateCostRequirement = { "Board", "Opponent", 7, 9999 },
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 24 },
		Effect = {
			Name = "Conflux",
			Description = "If there's 7 or 8 enemy fighters, cast this card using {W}{W}{W}.\nWhen this card is cast: Deal 4000 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 4000 } },
			Target = "Opponent"
		},
		Bio = "Creator of the original Ultimate Power. Here to destroy all copiers and token spammers."
	},
	Rhysmon = {
		Id = 4564786650,
		Name = "Rhysmon",
		Health = 1100,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Recyclables",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		EffectAnimation = "RhysmonColaBuff",
		EffectVariable = 0,
		Effect = {
			Name = "POWER",
			Description = "During your end step: This card loses all of its power, then gains 150 power for each allied fighter.",
			Type = "OnEnd",
			Power = {
				{ "SetPower", 0 },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Fighter", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 150, "Nil" }
				},
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "His love of Red Cola gives him extra strength against foes larger than him."
	},
	["Coordinated Attack"] = {
		Id = 3238125292,
		Name = "PilotLuke",
		AltCards = {
			["PilotLuke-AN"] = {
				Id = 9345610618,
				Name = "Deers-Graced Pilot Flufflefunz",
				Effect = {
					Name = "Capture",
					Description = "When this card is cast: Summon two 200/200 Deers. Ready all Deers.",
					Power = {
						{ "Summon", "Pilot-AN" },
						{ "Summon", "Pilot-AN" },
						{ "Unlock", 1, "Archetype" }
					}
				},
				Bio = "Gravity could teach me something."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "TimeBomb",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 4 },
		Archetype = "Pilots",
		Effect = {
			Name = "Capture",
			Description = "When this card is cast: Summon two 200/200 Pilots. Unlock all allied Pilots.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Pilot" },
				{ "Summon", "Pilot" },
				{ "Unlock", 9999, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "Hello, this is your pilot speaking. I ask that all passengers buckle their seatbelt and prepare for an impending airstrike."
	},
	Prestwick = {
		Id = 3238125976,
		Name = "Prestwick",
		AltCards = {
			["Prestwick-Hal"] = {
				Id = 7450582513,
				Name = "Wickerman",
				AttackEffect = "FirePunch",
				Bio = "This curse, this eternal cage torments me."
			},
			["christang3, Epic Skate"] = {
				Id = 11770008891,
				Name = "christang3, Epic Skate",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "Despite having a skateboard, how do you people kickflip?"
			},
			["Cain, Merchandise Manager Devil"] = {
				Id = 13947321206,
				Name = "Cain, Merchandise Manager Devil",
				AttackEffect = "MagicYellow",
				Bio = "<b>THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE THE MASKS AREN'T HERE</b>"
			}
		},
		Health = 300,
		Power = 800,
		Rarity = "Epic",
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
	Gusmanak = {
		Id = 9925805285,
		Name = "Gusmanak",
		Health = 800,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 3 },
		Effect = {
			Name = "Apocalypse",
			Description = "Whenever this card attacks and destroys another: Reset its stats.",
			Type = "OnAttackDestroy",
			Power = { { "Reset" } },
			Target = "Self"
		},
		Bio = "Time to blox zombies and eat beans from a can!"
	},
	Stud = {
		Id = 4952824244,
		Name = "Stud",
		AltCards = {
			["Stud-ArtV"] = {
				Id = 7650365772,
				AltArt = true,
				GenZoneant = "Stud-ArtV",
				Bio = "Electrified for your bemusement."
			},
			StudNastrond = {
				Id = 123772415711163,
				GenZoneant = "Stud-ArtV",
				Bio = "From the sanctified depths of Nastrond, a beacon of untainted power emerges."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Studling",
		Cost = { Neutral = 3 },
		AddGenZoneant = "Stud",
		Effect = {
			Name = "Stud",
			Description = "Put this card into your baseplate.",
			Type = "OnSummon",
			Power = { {
				"AddGenZone",
				{ "AddGenZoneant", 1 }
			} },
			Target = "Ally"
		},
		Bio = "The basic energy of Robloxia. Studs contain great power."
	},
	["Alpha Brick's Agony"] = {
		Id = 6031003416,
		Name = "Alpha Brick's Agony",
		AltCards = {
			["Mass Epidemic-ArtV"] = {
				Id = 7650349033,
				Name = "Mass Destruction",
				AltArt = true,
				Bio = "YOU WILL UPDATE BLOXCARDS, AND YOU WILL DO IT WHEN I SAY SO!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Era",
		Cost = { Red = 2 },
		Effect = {
			Name = "Stud",
			Description = "Destroy a target fighter and your hand.",
			Type = "OnSummon",
			Power = {
				{ "Destroy" },
				{ "RandomDiscard", 10, "Ally" }
			},
			Target = "Single"
		},
		Bio = "Redcliff, Overseer, Korblox, Doge. Their ceaseless fighting scorched the world harrow."
	},
	ROBAR = {
		Id = 4899434473,
		Name = "ROBAR",
		AltCards = {
			["Ice Tea"] = {
				Id = 10279415849,
				Name = "Ice Tea",
				AltArt = true,
				Bio = "Now comes in Noob and Not-A-Dev flavours!"
			},
			["ROBAR-E"] = {
				Id = 10279415660,
				Name = "Bacon & Eggs",
				Bio = "I mean, what else are you gonna do with the eggs after you find them?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectAnimation = "EatROBAR",
		IsFood = true,
		Effect = {
			Name = "Power Boost",
			Description = "A target fighter gains 250 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 250, "Single" } },
			Target = "All"
		},
		Bio = "ROBLOXIANs eat these in a pinch for a power boost. Delicious!"
	},
	Bobaman1 = {
		Id = 10184249748,
		Name = "bobaman1",
		AltCards = {
			["Unc, the Barista"] = {
				Id = 7347928877,
				Name = "Unc, the Barista",
				AttackEffect = "MagicGreen",
				AltArt = true,
				Bio = "Why feed myself off their suffering when I can feed off their wallets? "
			},
			["Epik_Nob, Bread Gaming"] = {
				Id = 10184575157,
				AttackEffect = "Slash",
				Name = "Epik_Nob, Bread Gaming",
				AltArt = true,
				Bio = "this bread just j."
			},
			["The World Splitter, Huhobo"] = {
				Id = 119375415646808,
				Name = "The Thirteenth Star",
				AltArt = true,
				Terrariant = "HuhuoboTerrarain",
				Bio = "Goodnight, London"
			},
			["Bobaman1-Hal"] = {
				Id = 84193715655940,
				AttackEffect = "Scratch",
				Name = "Bobabat1",
				Bio = "Years of eating blood-soaked bread cursed Bobaman1 with an unending thirst..."
			},
			Hypnobot = {
				Id = 9098454135,
				AltArt = true,
				AttackEffect = "Electric",
				Name = "Hypnobot",
				Bio = "Look into his eyes....and see the future! But only in the sense that robots are the future, you won't see your personal future. Gosh...why does everything have to be about you all the time?!? This card is a part of BucketWarrior's Robot deck."
			},
			Imcybop45 = {
				Id = 13488225494,
				AltArt = true,
				PremiumArt = 35,
				AttackEffect = "Jab",
				Commissioner = { 405071626 },
				Name = "Imcybop45",
				Bio = "He can make you cry is more than one way with an instrument, he will either play good music or give you a beating if you didn't cry to the first option."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "ShootAll",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Bonk",
			Description = "When this card is cast: It deals 100 damage to all fighters. If there's five or more enemy fighters, deal 500 damage instead.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Damage", 100, "All" } },
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "Damage", 500, "All" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The bane of all aggro decks alike, he shall cast them all down with his mighty bread."
	},
	SonozakiRaito = {
		Id = 4899440490,
		Name = "SonozakiRaito",
		AltCards = {
			["SonozakiRaito-Sun"] = {
				AttackEffect = "Whirlpool",
				Id = 9173950779,
				Bio = "Stay right there. I need you to rate this dance."
			}
		},
		Health = 300,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "LaserRed",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Suppressive Fire",
			Description = "When this card is cast: Lock a target fighter for 2 turns.",
			Type = "OnSummon",
			Power = { { "Lock", 2 } },
			Target = "Single"
		},
		Bio = "SonozakiRaito, not Sonozaki Raito. Don't confuse yourself."
	},
	["Blue Fanatic"] = {
		Id = 10184480962,
		Name = "Dominus Frigidus",
		AltCards = {
			["Blue Fanatic-AWIH"] = {
				Id = 17600818755,
				Name = "Thirst for Knowledge",
				AttackEffect = "MagicBlue",
				Bio = "See through them.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Blue Fanatic-AN"] = {
				Id = 18298927607,
				Name = "Blue Fanatic",
				AttackEffect = "MagicBlue",
				Bio = "It's okay to be blue!!!"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Ice",
		Color = "Neutral",
		Cost = { Blue = 7 },
		Effect = {
			Name = "Fanaticism",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Why define anything when you can define truth?"
	},
	["Heatlands Vortex"] = {
		Id = 10184482247,
		Name = "Dominus Infernus",
		AltCards = {
			GamesReborn = {
				Id = 8475540571,
				Name = "GamesReborn",
				AttackEffect = "DoomStorm",
				AltArt = true,
				Bio = "To be strong beyond belief. This is what it means to be me."
			},
			["Heatlands Vortex-AWIH"] = {
				Id = 101162939559113,
				Name = "Thirst for Conflict",
				AttackEffect = "MagicRed",
				Bio = "Burn it all.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Heatlands Vortex-AN"] = {
				Id = 18298924626,
				AttackEffect = "DoomStorm",
				Name = "Heatlands Vortex",
				Bio = "wow that's a pretty hot vortex"
			}
		},
		Health = 1000,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Flare",
		Color = "Neutral",
		Cost = { Red = 7 },
		Overload = true,
		Effect = {
			Name = "Fanaticism",
			Description = "",
			Type = "Null",
			Power = {
				{ "RandomAdd", "MonoOnlyorRedCost Red" },
				{ "DiscardLimit", 1 }
			},
			Target = "Ally"
		},
		Bio = "Why control anything when you can control god?"
	},
	["Noob Golem"] = {
		Id = 10184479130,
		Name = "Dominus Aureus",
		AltCards = {
			HavenTheGamingKing = {
				Id = 9098455149,
				Name = "HavenTheGamingKing",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "Rockin' with the French Fries since 2014."
			},
			["Noob Golem-AWIH"] = {
				Id = 17600819787,
				Name = "Thirst for Fame",
				AttackEffect = "MagicYellow",
				Bio = "They shall remember.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Noob Golem-AN"] = {
				Id = 18298924893,
				AttackEffect = "Electric",
				Name = "Golden Golem",
				Bio = "Would you believe me if I said he used to be a noob?"
			}
		},
		Health = 800,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Electric",
		Color = "Neutral",
		Cost = { Yellow = 7 },
		Effect = {
			Name = "Fanaticism",
			Description = "Whenever this card attacks: All allied fighters gain 100 health and power.",
			Type = "OnAttack",
			Power = {
				{ "Heal", 100, "Ally" },
				{ "Strengthen", 100, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Why feel anything when you can feel great?"
	},
	["Green Icon Tree"] = {
		Id = 4899305650,
		Name = "Dominus Praefectus",
		AltCards = {
			["Green Icon Tree-AWIH"] = {
				Id = 17600817086,
				Name = "Thirst for Growth",
				AttackEffect = "MagicGreen",
				Bio = "Watch them fall.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Green Icon Tree-AN"] = {
				Id = 18298924744,
				AttackEffect = "MagicGreen",
				Name = "Green Icon Tree",
				Bio = "a bygone era"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Green = 7 },
		Effect = {
			Name = "Fanaticism",
			Description = "When this card is cast: It deals 600 damage to a target enemy fighter. You gain 600 life.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 600, "SingleEnemy" },
				{ "Cost", -600 }
			},
			Target = "Ally"
		},
		Bio = "Why grow anything when you can grow heaven?"
	},
	["Veteran Mercenary"] = {
		Id = 11769943180,
		Name = "Veteran Mercenary",
		AltCards = {
			["Veteran Mercenary-Banner"] = {
				Id = 13488247933,
				Name = "Enraged Pro",
				AttackEffect = "British",
				EffectAnimation = "BloxyBuff",
				Bio = "\"THERE'S NO OUTRAGEOUSLY OVERPOWERED CARDS! HOW AM I GONNA PLAY ANY OF THESE!\""
			},
			["Veteran Mercenary-AN"] = {
				Id = 18199515939,
				Name = "Space Overlord",
				AttackEffect = "MagicRed",
				EffectAnimation = "BloxyBuff",
				Bio = "Ruler of the Cosmos - Forgets To Change His Suit Battery"
			}
		},
		Health = 150,
		Power = 1500,
		Rarity = "Uncommon",
		Color = "Red",
		AttackEffect = "Slash",
		EffectAnimation = "LinkedSwordFlagSelf",
		Cost = { Red = 3 },
		Effect = {
			Description = "Whenever an enemy fighter dies: This card gains 100 health.",
			Ability = {
				OnEnemyDeath = {
					Power = { { "Heal", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "There is no room for trickery on the field of battle."
	},
	["Scorched Earth"] = {
		Id = 11769946648,
		Name = "Scorched Earth",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Terrain = true,
		Terrariant = "Land of Ashes",
		Cost = { Red = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Land of Ashes"] = "Cast 'Living World' to animate this as a 750/750 with overload."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Cast this card to the opponent's terrain slot.\nWhen this card is destroyed from play: You lose 750 life. Destroy the oldest card in your hand.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" }
					},
					Target = "Self"
				}
			},
			CastOnOpponent = true
		},
		Bio = "Robloxia fell barren to its armies' pointless marches."
	},
	["Total War"] = {
		Id = 11769944392,
		Name = "Total War",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Terrain = true,
		Terrariant = "Unyielding Battleground",
		CustomReminder = {
			["Unyielding Battleground"] = "Cast 'Living World' to animate this as an unlocked 400/1000. It becomes a terrain again during its end steps."
		},
		Cost = { Red = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you attack: Unlock the attacking fighter.",
			Ability = {
				OnAllyAttack = {
					Power = { { "Unlock", 9999, "Aggressor" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Live in conflict for far too long and you'll soon become lost in bloodshed."
	},
	["Spirit of Robloxia Harrowed"] = {
		Id = 11769946138,
		Name = "Spirit of Robloxia Harrowed",
		AltCards = {
			["Spirit of Robloxia Harrowed-E"] = {
				Name = "Purple Man",
				Id = 16932154789,
				Bio = "Why hello there, Old Sport."
			},
			LuminOS = {
				Id = 74265008766127,
				Name = "Lumin.OS",
				PremiumArt = 861,
				AttackEffect = "JohnAttack",
				AltArt = true,
				Bio = "\"Error: Operating System lost.\""
			}
		},
		Health = 1000,
		Power = 50,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you gain life: Double this card's power.",
			Type = "OnLifeGain",
			Power = { { "MultiplyPower", 2 } },
			Target = "Self"
		},
		Bio = "They finally obtained the power of the Alpha Brick, yet the kingdom they ruled over had turned into a desolate wasteland."
	},
	["Ancient Chronicler"] = {
		Id = 15418751592,
		Name = "Ancient Chronicler",
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3 },
		Rank = 10,
		CustomReminder = {
			["Baseplate Rank"] = "You need 10 cards in your Baseplate to cast this card."
		},
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: You gain 600 life. Draw 3 cards.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 3 },
				{ "Cost", -600 }
			},
			Target = "Self"
		},
		Bio = "The Titans had left, but the folly of mortals created destruction amongst their level. Stories of the past had taught them naught."
	},
	["Red Laser Scythe"] = {
		Id = 94889040577620,
		Name = "Red Laser Scythe",
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen this fighter dies: Both players destroy the oldest card in their hand.",
			Ability = {
				OnDeath = {
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "It reminds me of a certain flower for some reason..."
	},
	["Bear Mine Gun"] = {
		Id = 81413074181355,
		Name = "Bear Mine Gun",
		Health = 0,
		Power = 0,
		AddHealth = 400,
		AddPower = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nDuring your end step: You gain {W}{G}.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Green", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Bear Hug!!!!!!!!!!!!!!!"
	},
	["Golden Bloxxer"] = {
		Id = 137825059340265,
		Name = "Golden Bloxxer",
		Health = 0,
		Power = 0,
		AddHealth = 0,
		AddPower = 50,
		Rarity = "Rare",
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
	["Neon Mystery Cape"] = {
		Id = 116417161515726,
		Name = "Neon Mystery Cape",
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 6 },
		EffectVariable = 0,
		Gear = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhenever this fighter attacks and destroys another: Draw 2 cards.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Draw", 2 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Soon enough, you will be the ones hiding.\" -The Toothy Deer\""
	}
}
