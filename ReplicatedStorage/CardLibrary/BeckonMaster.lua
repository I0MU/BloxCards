



return {
	iAsuka = {
		Id = 8644678367,
		Name = "iAsuka",
		AltCards = {
			["iAsuka-Hal"] = {
				Id = 7459715270,
				Name = "EyeAsuka",
				AttackEffect = "MagicRed",
				Bio = "Just close your eyes and think it's Boba."
			},
			AsukaL = {
				Id = 11729363125,
				Name = "AsukaL",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "Master abandoned her, now she's a part of the streets."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 3, Green = 2 },
		EffectAnimation = "LifePotion",
		Effect = {
			Name = "Sugar and Ice",
			Description = "When this card is cast: A target fighter gains 500 Health. You gain 500 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Heal", 500 }
			},
			Target = "Single"
		},
		Bio = "Pardon me! Would you like some more tea, miss?"
	},
	Saprasam = {
		Id = 4782789274,
		Name = "Saprasam",
		AltCards = {
			Spongemario78 = {
				Id = 4989227404,
				Name = "Spongemario78",
				AttackEffect = "Swamp",
				CopyBodge = "Spongemario78",
				AltArt = true,
				Bio = "A Rainbow Warrior that likes pineapple and his pet, Slimy."
			},
			["Saprasam-Alt"] = {
				Id = 15121299407,
				Name = "Saprasam",
				AttackEffect = "Knife",
				PremiumArt = 139,
				AltArt = true,
				Bio = "\t\t\t\ti am awake\n\t\t\t\ti am walking the scene\n\t\t\t\tyou say to me 'i am only a machine'\n\t\t\t\tblah blah blah blah blah blah blah\n\t\t\t\ti shake my head\n\t\t\t\tyou were the best friend that i ever had"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 7 },
		Effect = {
			Name = "Sudden Death",
			Description = "When this card is cast: Summon a Green fighter card. Trigger effects as though it was cast.",
			Type = "OnSummon",
			Power = { { "RandomSummonWithEffect", "Green Fighter" } },
			Target = "Ally"
		},
		Bio = "What can I say, he's a canadian Leprechaun."
	},
	HuntarioRBLX = {
		Id = 4899352446,
		Name = "HuntarioRBLX",
		AltCards = {
			["HuntarioRBLX-Sun"] = {
				Id = 7138322879,
				CopyBodge = "HuntarioRBLX-Sun",
				AttackEffect = "Bubbles",
				Bio = "He thinks someone photoshopped the sun."
			},
			["Shadow Hunter"] = {
				Id = 5005879009,
				Name = "Shadow Hunter",
				CopyBodge = "Shadow Hunter",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Also known as shadowhunter5893. One shall stand...One shall fall..."
			}
		},
		Health = 1000,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2 },
		SummonAnimation = "SummonSlide",
		Charge = true,
		Effect = {
			Name = "Sugar and Ice",
			Description = "When this card attacks: It gains 200 Power.",
			Type = "OnAttack",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "An eye for an eye. A feather for a... Wait, humans don't have feathers. That analogy just went nowhere..."
	},
	zPikmon = {
		Id = 4992855072,
		Name = "zPikmon",
		AltCards = {
			["zPikmon-E"] = {
				Id = 9087699679,
				Name = "Ravine Merchant",
				AttackEffect = "MagicBlue",
				Bio = "\"The Spring's blessings are plentiful. Allow me to share them with you.\""
			},
			["Plastic Purveyor"] = {
				Id = 131775077846064,
				Name = "gezichtsloos",
				AltArt = true,
				PremiumArt = 43,
				Commissioner = { 2747898931 },
				AttackEffect = "Recyclables",
				EffectAnimation = "BloxyBuff",
				Bio = "ओ सभ हमर मुँह लऽ लेलक ओ सभ हमर मुँह लऽ लेलक ओ सभ हमर मुँह लऽ लेलक ओ सभ हमर मुँह लऽ लेलक"
			},
			freeeeeeeeeeeeeeeeeeeeeeeeeeeeee = {
				Id = 89282137119079,
				Name = "freeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 477,
				Bio = "it takes a lot to watch a person break"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		EffectAnimation = "CheezBuff",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Shatter",
			Description = "Whenever you cast a fighter with total stats 500 or less: This card gains 100 Power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 100 } },
			Target = "Self",
			SizeClass = "Picant"
		},
		Bio = "He loves the ocean so much, he uses swordfish!"
	},
	wikiwakiwoirier = {
		Id = 5602933177,
		Name = "wikiwakiwoirier",
		AltCards = {
			CivilCornball = {
				Name = "CivilCornball",
				Id = 6094195049,
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "This isn't just you versus me, it's us both against entropy."
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 1,
		Effect = {
			Name = "Nerf",
			Description = "Once each turn, whenever you cast a fighter: Unlock a target allied fighter, then lock it for 1 turn.",
			Ability = {
				OnAllySummon = {
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
						{ "Unlock", 9999 },
						{ "Lock", 1 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Truth lies beyond the plane of existance, and stretches out further beyond to the endless grasp of the universe."
	},
	["Jack-O-Bat"] = {
		Id = 3471765605,
		Name = "Soybeen",
		CopyBodge = "Jack-O-Bat",
		AltCards = {
			["Fighter Keeler1"] = {
				Id = 10279367946,
				AttackEffect = "Jab",
				AltArt = true,
				Name = "Fighter Keeler1",
				Bio = "Watch out for my special Nunchuck Hell Tiger Barrage! YAAAAAAA- *bonks himself in the head*."
			},
			Micheal = {
				Name = "Micheal",
				Id = 16446073564,
				AltArt = true,
				PremiumArt = 222,
				Bio = "A couple of studs to help out a friend."
			}
		},
		Health = 350,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 1, Yellow = 2 },
		Addant = "Nascent Stud",
		CustomReminderNascent = true,
		Effect = {
			Name = "Revival",
			Description = "Whenever this card destroys a fighter: Give yourself a Nascent Stud.",
			Type = "OnDestroy",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "When life gives you lemons, eat them in three bites."
	},
	["Wrath of the Fried One"] = {
		Id = 7550895445,
		Name = "Wrath of the Fried One",
		AltCards = {
			["Wrath of the Fried One-Alt"] = { Id = 7550897166, AltArt = true },
			["Wrath of the Fried One-Banner"] = {
				Id = 11727999239,
				Name = "Naughty List",
				Bio = "You should've been nice this year."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 1 },
		Bio = "You wouldn't really expect it but 2000 0.1-damage chicken legs lobbed at you HURTS.",
		Effect = {
			Name = "Board Clear!",
			Description = "Deal 200 damage to all fighters.\nThey lose 200 Power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{ "Weaken", 200 }
			},
			Target = "All"
		}
	},
	Regimen = {
		Id = 9561399204,
		Name = "Regimen",
		AltCards = {
			["Regimen-Sun"] = { Id = 13687957959, AttackEffect = "Whirlpool", Bio = "" }
		},
		Health = 100,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Encourage",
			Description = "When this card is cast: A target fighter gains 250 Health.",
			Type = "OnSummon",
			Power = { { "Heal", 250 } },
			Target = "Single"
		},
		Bio = "He sure loves the summer heat while playing some basketball. Don't ruin his day or you'll be asking for it."
	},
	["Haunted Mansion"] = {
		Id = 4783050582,
		Name = "Haunted Mansion",
		AltCards = {
			["Haunted Mansion-Sun"] = {
				Name = "Haunted Ship",
				Terrarian = "Haunted Terrain-Sun",
				Id = 7138323916,
				Bio = "*-Jaws Theme Plays-*"
			},
			["Swansong Waltz"] = {
				Name = "Swansong Waltz",
				Commissioner = { "vyntervonderland" },
				Id = 100367409841216,
				Terrariant = "Haunted Terrain-S",
				AltArt = true,
				PremiumArt = 871,
				Bio = "\"\"Each turn robs the planet of angular momentum,<br/>Slowing its spin the tiniest bit.<br/>Lengthening the night, pushing back the dawn,<br/>Giving me a little more time here,<br/>With you!\"\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Terrariant = "Haunted Terrain",
		AttackEffect = "Punch",
		Field = 293402621,
		Color = "Green",
		Terrain = true,
		CustomReminder = {
			["The Monster House"] = "Cast 'Living World' to animate this as a 1500/200. At the start of each player's turn, all non-Terrarians lose 50 Power."
		},
		Cost = { Green = 5 },
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: All fighters lose 50 Power, then destroy all enemy fighters with 0 Power.",
			Type = "OnAllyStart",
			Power = {
				{ "Weaken", 50, "All" },
				{
					"CheckPower",
					{ 0, 1 },
					"Opponent"
				}
			},
			Target = "CurrentTurn"
		},
		Bio = "It'll grind your sanity to dust."
	},
	NICCO = {
		Id = 4922413108,
		Name = "NICCO",
		AltCards = {
			["NICCO-E"] = {
				Id = 8905391103,
				Name = "Mecha-Moyai",
				AttackEffect = "LaserGreen",
				Effect = {
					Power = {
						{ "Heal", 500, "Aggressor" },
						{ "TransformWithRarity", "NICCOToken-E", "Self" }
					}
				},
				Bio = "A machine whose sole desires to keep the blobs of the forest safe and away from any eldritch abomination related rituals."
			}
		},
		Health = 1250,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Stealth = true,
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast a fighter: It gains 500 Health. Then this card transforms to lose all abilities.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 500, "Aggressor" },
				{ "TransformWithRarity", "NICCOToken", "Self" }
			},
			Target = "Ally",
			EffectTransformPreserveRarity = true
		},
		Bio = "*Farts Japanesely*"
	},
	DataRaven = {
		Id = 10184402662,
		Name = "DataRaven",
		Health = 700,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Neutral",
		Cost = { Neutral = 5, Red = 1 },
		Effect = {
			Name = "Clocked",
			Description = "During your end step: Your opponent loses 250 life.",
			Type = "OnEnd",
			Power = { { "Inflict", 250 } },
			Target = "Opponent"
		},
		Bio = "He made videos, and made enemies, notice the past tense."
	},
	["Divine Favor"] = {
		Id = 10184472848,
		Name = "Divine Favor",
		AltCards = {
			["Divine FavorV2"] = { Id = 135321113574329, Name = "Mogged", Bio = "I HATE SMALL CHILDREN" },
			["Divine Favor-L"] = { Id = 10184432742 }
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Bio = "Shedletsky's return cleansed the world of all that distinguishes and divides.",
		Fading = true,
		Effect = {
			Name = "Board Clear Preparation!",
			Description = "Set the stats of all fighters to 350/350.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 350 },
				{ "SetPower", 350 }
			},
			Target = "All"
		}
	},
	Dredger980 = {
		Id = 5141842477,
		Name = "Yourius",
		CopyBodge = "Dredger980",
		AltCards = {
			V0IDBOX = {
				Name = "Lowgeist",
				AttackEffect = "Scratch",
				Id = 7656389002,
				Effect = {
					Power = {
						{ "DeckAdd", "V0IDBOX" },
						{ "Draw", 1 }
					}
				},
				Bio = "It's been one year since I first went inside that house."
			},
			["Yourius-AN"] = {
				Name = "Bill Cotton",
				AttackEffect = "Bubbles",
				Id = 9345620862,
				Effect = {
					Power = {
						{ "DeckAdd", "Yourius-AN" },
						{ "Draw", 1 }
					}
				},
				Bio = " After years of selling his biography, Bill Cotton decided to settle in to a financially well-off flat, happily living out the rest of his days in peaceful retirement... until you put him on the field."
			},
			["Navy Captain"] = {
				Id = 129666170431953,
				Name = "Navy Captain",
				Effect = {
					Power = {
						{ "DeckAdd", "Navy Captain" },
						{ "Draw", 1 }
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 512,
				Bio = "A navy captain whose life has been nothing but a success. Not only born into a prestigious family, but also became a distinguished military graduate. Thanks to her outstanding ability in tactical planning, operation, and leadership, she has never been defeated in a firefight between giant battleships. The only thing staining her flawless reputation is the fact that she has no control over how you play her decks in Blox Cards."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: Shuffle a copy of it into your deck. Draw a card.",
			Type = "OnDeath",
			Power = {
				{ "DeckAdd", "Dredger980" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "The true Lord of Nomrial. You might wanna grind your stats before taking him on."
	},
	["Ultimate Bowl of Greed"] = {
		Id = 5530566278,
		Name = "Pot of Gold",
		AltCards = {
			BCTrophy1st = {
				Id = 10278551959,
				Name = "Golden Blox Cards Trophy",
				Bio = "Proof of supreme victory. You are one of the best Blox Card players. Congratulations!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 5 },
		Bio = "Fame and fortune awaits.",
		Effect = {
			Name = "Ultimate Bowl of Greed",
			Description = "Draw 5 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 5 } },
			Target = "Ally"
		}
	},
	["Eye of Heaven"] = {
		Id = 10242899827,
		Name = "Eye of Heaven",
		AltCards = {
			["Eye of Heaven-E"] = { Id = 8650621116, Name = "Eye of Moai", Bio = "🗿 " },
			["Eye Fatal Discovery"] = {
				Id = 10242900478,
				Name = "Fatal Discovery",
				Bio = "At last, You found what you were looking for."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 40 },
		AddBlock = true,
		Untradeable = true,
		Rank = 10,
		Effect = {
			Name = "Rebuilding The Place",
			Description = "Ban your opponent.",
			Type = "OnSummon",
			Power = { { "Ban", 999999, "Opponent" } },
			Target = "Self"
		},
		Bio = ""
	},
	Materking = {
		Id = 5122954371,
		Name = "Materking",
		AltCards = {
			["Flat the Birthday Cat"] = {
				Id = 10649487325,
				Name = "Flat the Birthday Cat",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "catgirl real"
			},
			["Materking-AN"] = {
				Id = 18199519524,
				AttackEffect = "Slash",
				Name = "Endangered Species",
				Bio = "So wholesome chungus! Upvoted!"
			},
			["Luna Celestine"] = {
				Id = 18199522097,
				Name = "Luna Celestine",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "I like ice magic :3 - ykoimonha1115"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Neutral = 3, Green = 3, Blue = 3 },
		Effect = {
			Name = "Overgrown",
			Description = "During your end step: Deal 100 damage to all enemy fighters and they lose 100 Power. All Blue fighters gain 100 Health. All Green fighters gain 100 Power.",
			Type = "OnEnd",
			Power = {
				{ "Weaken", 100, "Opponent" },
				{ "Damage", 100, "Opponent" },
				{ "Heal", 100, "ColorBlue" },
				{ "Strengthen", 100, "ColorGreen" }
			},
			Target = "Ally"
		},
		Bio = "Owner of Trade. and has massive influence in the LMaD sub-forum. He'll keep pushing on and advertising his group until ROBLOX ends."
	},
	madattak = {
		Id = 5220242204,
		Name = "madattak",
		AltCards = {
			["madattak-Banner"] = {
				Id = 11674999180,
				AttackEffect = "MagicGreen",
				Bio = "\"I hope one of these has some new scientific paraphernalia, my collection is dwindling.\""
			},
			["Zanzel of the Opera"] = {
				Name = "Zanzel of the Opera",
				Id = 13763489365,
				Commissioner = { 475544027, 8289996 },
				AltArt = true,
				PremiumArt = 56,
				AttackEffect = "Gravity",
				Bio = "\"If I am the Priestess, it is because people's hatred has made me so.\""
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 6, Green = 3 },
		Summonant = "Zombie",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Select a card from a choice of 3 in your graveyard. Recur that card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"TargetRandomAllyCardInGraveyard"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self"
				}
			},
			AmountOfTargets = 3
		},
		Bio = "MY EXPERIMENT IS COMPLETE! ZOMBIES RUNNING LEFT AND RIGHT ACROSS THE WORLD! HAHAHAHAHAHAA!."
	},
	["Vitality Potion"] = {
		Id = 10281142716,
		Name = "Vitality Potion",
		AltCards = {
			["Vitality Potion-Val"] = {
				Id = 116797623298817,
				Name = "Love Potion",
				Bio = "Whether she made this potion with the best of intentions or with the twisted desire to make as many crackships as possible, we have no clue."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Vitality Potion",
			Description = "A target fighter gains 1000 Health.",
			Type = "OnSummon",
			Power = { { "Heal", 1000 } },
			Target = "Single"
		},
		Bio = "A somewhat rare variant of the Life Potion that is potent to keep fighters alive."
	},
	["Thanksgiving Feast"] = {
		Id = 10697359573,
		Name = "Thanksgiving Feast",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1, Red = 1 },
		Effect = {
			Name = "Gobble",
			Description = "Each fighter with the lowest Health gains 250 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 250, "LowestHealth" },
				{ "Heal", 250, "LowestHealth" }
			},
			Target = "All"
		},
		Bio = "We are very thankful for this feast, now gobble up, pilgrims!",
		IsFood = true
	},
	MesouricPhantom976 = {
		Id = 5054915234,
		Name = "MesouricPhantom976",
		Health = 800,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 4, Green = 4 },
		Effect = {
			Name = "Funpalooza",
			Description = "Whenever a fighter is cast: Swap the stats of all fighters.",
			Type = "OnAnySummon",
			Power = { { "Swap", 100000 } },
			Target = "All"
		},
		Bio = "Sit down. Let's talk about that iFunny watermark."
	},
	NICCOToken = {
		Id = 4922413108,
		AltCards = {
			["NICCOToken-E"] = {
				Id = 8905393376,
				Name = "Mecha-Moyai",
				AttackEffect = "LaserGreen",
				Bio = "A machine whose sole desires to keep the blobs of the forest safe and away from any eldritch abomination related rituals."
			}
		},
		Name = "NICCO",
		Health = 1250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "*Skill Issue*"
	},
	["Skarra the DragonSlayer"] = {
		Id = 11973007769,
		Name = "Skarra, the Dragonkeeper",
		AltCards = {
			["Skarra the DragonSlayerv2"] = {
				Id = 10242870475,
				AttackEffect = "Flare",
				AltArt = true,
				Bio = "An ancient dragon warrior. The only dragon Skarra wont kill is the one that she rides."
			},
			["Mag from Another World"] = {
				Id = 78588293648452,
				Name = "Mag from Another World",
				AttackEffect = "VolipaKatana",
				AltArt = true,
				PremiumArt = 637,
				Bio = "Nobody knows where he really came from; most just think of him as just another Mag."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2 },
		IsLegendaryDragon = true,
		Effect = {
			Name = "Render",
			Description = "When this card is cast, if there's as many allied fighters as enemy ones: Double the Power of all fighters.",
			Type = "OnSummon",
			Power = { { "MultiplyPower", 2 } },
			Target = "All",
			EffectRequirement = { "EqualBoard", "Opponent", 0, 0, "Equal" }
		},
		Bio = "If you breathe, she will fight you. If you breathe fire, she MUST fight you."
	},
	Halo4master233 = {
		Id = 4710720423,
		Name = "Halo4master233",
		AltCards = {
			Multifakers = {
				Id = 117225540389443,
				Name = "Multifakers",
				Commissioner = { "Multifakers" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 706,
				Bio = "You know what I consider the worst disability of all? Procrastination and Laziness"
			}
		},
		Health = 400,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Charge = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Conflux",
			Description = "After this card attacks: Lock a target fighter for 1 turn.",
			Type = "OnAttackEnd",
			Power = { { "Lock", 1 } },
			Target = "Single"
		},
		Bio = "Heads up!"
	},
	FatherChristmaz = {
		Id = 9964779285,
		Name = "FatherChristmaz",
		AltCards = {
			RoboSanta = {
				Id = 9964779789,
				Name = "Robo Santa",
				AttackEffect = "Rifle",
				Bio = "\"My God, Hallow. Framing an orphan? That's so naughty, I gotta add it to my list right now!\""
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Christmas..?",
			Description = "Whenever this fighter destroys another: Your opponent loses 400 life.",
			Type = "OnDestroy",
			Power = { { "Inflict", 400 } },
			Target = "Opponent"
		},
		Bio = "Christmaz rulez! I'm not Santa but I am his cool and rad helper FatherChristmaz, and I'll help you in any battle!"
	},
	Nightmare = {
		Id = 8406873573,
		Name = "Nightmare",
		AltCards = {
			Jumpscare = { Name = "Jumpscare", Id = 140266533659846, Bio = "Game over." },
			["Nightmare-Sun"] = { Name = "Frenemy's Punishment", Id = 9173942057, Bio = "UNFAVORABLE." },
			["Nightmare-AN"] = { Id = 77699393892178 },
			["Nightmare-Mist"] = {
				Name = "Mist",
				Id = 11674978378,
				Bio = "Inside the head of a lunatic, tormented souls sway. Worthless ones who don't value their life, a nutrient of new birth."
			},
			["On The House"] = {
				Name = "On The House",
				Id = 16738205244,
				Bio = "Free of charge. Of course, with a price..."
			}
		},
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Nightmare",
		Undiscardable = true,
		TokenOmni = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		CustomReminderFleeting = true,
		Effect = {
			Name = "Nightmare!",
			Description = "All players draw a card.\nThe card you draw this way is fleeting.",
			Type = "OnSummon",
			Target = "Ally",
			Power = {
				{ "FleetingDraw", 1 },
				{ "Draw", 1, "Opponent" }
			}
		},
		Bio = "It begins."
	},
	["Night Fright"] = {
		Id = 5205626063,
		Name = "Night Fright",
		AltCards = {
			["Salvation's Mercy"] = { Id = 8660637226, Bio = "Here. Let me take your grief and pain." },
			["Night Fright-AN"] = {
				Id = 9400900930,
				Name = "Pavor",
				Bio = " He who fears the unknown, knows not the danger but the potential."
			},
			["Preparation-Token"] = {
				Id = 12720770883,
				Name = "Tree",
				Bio = " Outside the head of a lunatic, hopeless bodies grows. Harmful leech to the society, a nutrient of new birth."
			},
			["Night Fright-Precon"] = {
				Id = 16361232693,
				Name = "Rend",
				Bio = "Firstly, imagine your body pulled and torn apart. The air is cold and toxic from the smell of your own blood, enough to make you feel lightheaded and fainting. Your mind and eyes are not spared while they are ruptured open so you won't blink witnessing yourself in my oblivion. The air tastes foul enough to cause your insides to rot continuously. You are robbed of the liberty to hear yourself scream, for you are unable to die inside my holy realm.<br/>Now, forget everything your vapid mind conjured for you. Because your suffering will be so much more."
			}
		},
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Nightmare",
		Undiscardable = true,
		TokenOmni = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Nightmare!",
			Description = "You lose 300 Life.",
			Type = "OnSummon",
			Power = "Inflict",
			Target = "Ally",
			Increase = 300
		},
		Bio = "Spooky."
	},
	Delusionist = {
		Id = 7021469682,
		Name = "Delusionist",
		AltCards = {
			["Delusionist-AN"] = {
				Id = 9362404604,
				AttackEffect = "Gravity",
				Effect = {
					Name = "Hive Crack",
					Description = "During your end step, if your opponent has a Nightmare card in their hand: Shuffle a Rare Nightmare card into your deck, then draw a card.",
					Type = "OnEnd",
					Power = {
						{
							"RandomDeckAdd",
							{ "Dehabilitator-AN", "Pseudosanity-AN", "Roots of Despair-AN" }
						},
						{ "Draw", 1 }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "OpponentHand", 1, 9999, "Nightmare" }
				},
				Bio = "This card is real."
			},
			Thoughts = {
				Id = 9829932847,
				Name = "Thoughts",
				AttackEffect = "DoomStorm",
				AltArt = true,
				Bio = "Powering Imagination."
			}
		},
		Health = 650,
		Power = 150,
		Rarity = "Common",
		Archetype = "Nightmare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Hive Crack",
			Description = "During your end step, if your opponent has a Nightmare card in their hand: Shuffle a Rare Nightmare card into your deck, then draw a card.",
			Type = "OnEnd",
			Power = {
				{ "RandomDeckAdd", "Rare Nightmare" },
				{ "Draw", 1 }
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "OpponentHand", 1, 9999, "Nightmare" }
		},
		Bio = "This card isn't even real."
	},
	["Rat King"] = {
		Id = 10219955242,
		Name = "Rat King",
		AltCards = {
			["Re-Growth"] = {
				Name = "Re-Growth",
				AttackEffect = "DoomStorm",
				Id = 8773231932,
				AltArt = true,
				Bio = "It grows, grows, grows. Soon enough we will reach to them."
			},
			["Rat King-AN"] = {
				Id = 9381258031,
				AttackEffect = "Gravity",
				Bio = "A king can become a tyrant in a matter of a few actions."
			}
		},
		Health = 650,
		Power = 150,
		Rarity = "Common",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Hive Crack",
			Description = "During your end step, if your opponent has a Nightmare card in their hand: All allied Nightmares gain 150 Health.",
			Type = "OnEnd",
			Power = { { "Heal", "150" } },
			Target = "AlliedArchetype",
			EffectRequirement = { "Archetype", "OpponentHand", 1, 9999, "Nightmare" }
		},
		Bio = "To immobilize the weak. That is what the Rat King makes those fear."
	},
	Traumaturge = {
		Id = 7038743548,
		Name = "Traumaturge",
		AltCards = {
			["Salvations Warren"] = {
				Id = 5961962031,
				Name = "Salvations Warren",
				AttackEffect = "Gravity",
				AltArt = true,
				Addant = "Salvation's Mercy",
				Bio = "Dlaczego to musi się stać? Czy to naprawdę jedyny sposób?"
			},
			["Traumaturge-AN"] = {
				Id = 9368634625,
				Addant = "Night Fright-AN",
				Bio = "A nightmare of a destiny."
			},
			Preparation = {
				Id = 12427604227,
				Name = "Preparation",
				AttackEffect = "DoomStorm",
				Addant = "Preparation-Token",
				AltArt = true,
				Bio = " Trim, arrange, shape. Just like how you debone the meat before you cook, so do we. A delicacies."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Uncommon",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Green = 3 },
		EffectVariable = 0,
		Addant = "Night Fright",
		CustomReminder = {
			["Night Frights"] = "A {W} undiscardable Nightmare action. Your opponent loses 300 life if they cast it."
		},
		Effect = {
			Name = "Night Creak",
			Description = "When this card is cast: Deal 50 damage to each enemy fighter for each allied Nightmare. Give each player two Night Frights.",
			Type = "OnSummon",
			Target = "Opponent",
			Power = {
				{ "SetVariable", "Archetype", "Self" },
				{ "MultiplyVariable", 50, "Self" },
				{ "Damage", "Variable" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant" },
				{ "Add", "Addant" }
			}
		},
		Bio = "A nightmare of a choice."
	},
	Unmiracle = {
		Id = 7027993579,
		Name = "Unmiracle",
		AltCards = {
			["Unc, The Blighted"] = {
				Id = 9381254164,
				Name = "Unc, The Blighted",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "Despair's Blight, the combined mental strain of the Alpha Brick War and visions of doom imparted by Nightmares made manifest. Should the affected survive long enough, ‘fruits’ growing from the branches take hold over the mind, body and soul. The branches themselves then recede back into the host's body, replacing vital organs and the skeletal structure."
			},
			["Unmiracle-AN"] = {
				Id = 9381270577,
				Name = "Vermin's Caress",
				AttackEffect = "Gravity",
				Addant = "Nightmare-AN",
				Bio = "They'll be complaining they get locked every, single, time."
			},
			Conception = {
				Id = 11712809129,
				Name = "Conception",
				AttackEffect = "Scratch",
				AltArt = true,
				Addant = "Nightmare-Mist",
				Bio = "It descend from the mist of thoughts, above the forest of condemned growth, a vessel for his eventual advent."
			},
			Untraumatized = {
				Name = "Untraumatized",
				Id = 16738204129,
				AltArt = true,
				PremiumArt = 232,
				Addant = "On The House",
				Bio = "Fear didn't stop you, it was the fuzziness of him."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Uncommon",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		Color = "Green",
		AttackEffect = "Punch",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 0,
		Addant = "Nightmare",
		CustomReminder = {
			Nightmare = "A free undiscardable Nightmare action. Each player draws a card when it's cast."
		},
		Effect = {
			Name = "Nightmare!",
			Description = "When this card is cast: Lock all enemy fighters that cost X fewer studs for 1 turn. X is the number of allied Nightmares. Then give each player a 'Nightmare.'",
			Type = "OnSummon",
			Power = {
				{ "SetVariable", "Archetype", "Self" },
				{ "Lock", 1, "CustomTarget" },
				{ "Add", "Addant" },
				{ "Add", "Addant", "Opponent" }
			},
			Target = "Ally",
			TargetParameters = {
				Zones = { "Enemy" },
				Condition = "TotalCostOrLess",
				Modifier = "Variable"
			}
		},
		Bio = "Even prayers can't escape it."
	},
	Dehabilitator = {
		Id = 7021468950,
		Name = "Dehabilitator",
		AltCards = {
			["Dehabilitator-AN"] = {
				Id = 9391604243,
				AttackEffect = "Gravity",
				Name = "Accursed Gate",
				Bio = " Recommended by Mr. Bones that you do NOT go on this wild ride."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		Color = "Green",
		AttackEffect = "Punch",
		Cost = { Neutral = 1, Blue = 3 },
		Addant = "Night Fright",
		Effect = {
			Name = "Nightmare!",
			Description = "Once, when your opponent has 3 or more Nightmare tokens in hand: Your opponent draws 7 cards. Add {W} to each card in their hand.",
			Type = "OnAnyTrigger",
			Power = {
				{ "Draw", 7, "Opponent" },
				{
					"IncreaseCost",
					{ 1, "Neutral" },
					"CustomTarget"
				}
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "OpponentHand", 3, 9999, "Nightmare&Token" },
			TargetParameters = {
				Zones = { "Enemy_Hand" },
				Condition = "All"
			},
			TotalTriggerLimit = 1
		},
		Bio = "It hunts down anything trying to comprehend it."
	},
	Pseudosanity = {
		Id = 7550977221,
		Name = "Pseudosanity",
		AltCards = {
			["Pseudosanity-AN"] = {
				Id = 9368636625,
				Name = "Consume Dream",
				AttackEffect = "Gravity",
				Bio = "The more you hold onto false beliefs, the more you lose grip on sense."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		Color = "Blue",
		AttackEffect = "Punch",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Nightmare!",
			Description = "Once, when your opponent has 3 or more Nightmare Tokens in hand: Each allied Nightmare card in play and in your hand gains 300 Health and Power. Actions buffed this way manifest into fighters.",
			Type = "OnAnyTrigger",
			Power = {
				{ "Heal", 300, "AlliedArchetype" },
				{ "Strengthen", 300, "AlliedArchetype" },
				{ "ArchetypeHandHeal", 300, "Ally" },
				{ "ArchetypeHandStrengthen", 300, "Ally" }
			},
			Target = "All",
			EffectRequirement = { "Archetype", "OpponentHand", 3, 9999, "Nightmare&Token" },
			TotalTriggerLimit = 1
		},
		Bio = "The more you hold on to what's left, the less the world holds on to you."
	},
	Uncreativename123 = {
		Id = 7027994936,
		Name = "UncreativeName123",
		AltCards = {
			["Uncreativename123-Val"] = {
				Id = 7138184959,
				Name = "UncreativeGift123",
				AttackEffect = "Inferno",
				Bio = "Teddy Bears, Roses, and Chocolates."
			},
			["Uncreativename123-ALT"] = {
				Id = 7650363270,
				AltArt = true,
				Name = "UncreativeName123",
				AttackEffect = "DoomStorm",
				Bio = "The sky broke like an egg into full sunset and the water caught flames. I began."
			},
			Nahrack = {
				Id = 11727874053,
				AltArt = true,
				Name = "Nàh'raćk",
				AttackEffect = "DoomStorm",
				Bio = "Once, I was human. Now, I am much more."
			},
			["Uncreativename123-AN"] = {
				Id = 9391607295,
				Name = "Metempsychosis",
				AttackEffect = "Gravity",
				Effect = {
					Name = "Level Up!",
					Description = "Whenever an action is cast, if your opponent has 5 cards in hand: Shuffle a Rare Nightmare into your deck. All players draw a card.",
					Type = "OnCast",
					Power = {
						{
							"RandomDeckAdd",
							{ "Dehabilitator-AN", "Pseudosanity-AN", "Roots of Despair-AN" },
							"Ally"
						},
						{ "Draw", 1, "All" }
					},
					EffectRequirement = { "Playertable", "Him", 5, 9999, "Hand" },
					Target = "Opponent"
				},
				Bio = " A state of being is different from a state of reality."
			}
		},
		Health = 1300,
		Power = 300,
		Rarity = "Epic",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 1, Blue = 5 },
		Effect = {
			Name = "Level Up!",
			Description = "Whenever an action is cast, if your opponent has 5 cards in hand: Shuffle a Rare Nightmare into your deck. All players draw a card.",
			Type = "OnCast",
			Power = {
				{ "RandomDeckAdd", "Rare Nightmare", "Ally" },
				{ "Draw", 1, "All" }
			},
			EffectRequirement = { "Playertable", "Him", 5, 9999, "Hand" },
			Target = "Opponent"
		},
		Bio = "Is perfection truly so grotesque; can't all be one?"
	},
	Uncreation = {
		Id = 7027995695,
		Name = "Uncreation",
		AltCards = {
			["Uncreation-AN"] = {
				Id = 9371362603,
				AttackEffect = "Gravity",
				Name = "Shadowmage's Repent",
				Bio = "A husk can be filled. A void cannot."
			},
			["Unity-Sinz"] = {
				Id = 13653693403,
				AttackEffect = "Gravity",
				Name = "Unity",
				AltArt = true,
				Commissioner = { 191713409, 90658630 },
				Bio = "It must end."
			}
		},
		Health = 1300,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Green = 5, Blue = 1 },
		TransformImmune = true,
		SwapImmune = true,
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		Effect = {
			Description = "Whenever a Nightmare action is cast, if your opponent has 5 cards in hand: This card gains 250 Health and Power.",
			Type = "OnCast",
			Power = {
				{ "Heal", 250, "Self" },
				{ "Strengthen", 250, "Self" }
			},
			EffectRequirement = { "Playertable", "Him", 5, 9999, "Hand" },
			Archetype = "Nightmare",
			Target = "Opponent"
		},
		Bio = "Soon."
	},
	["The Shadow Realm"] = {
		Id = 7028001960,
		Name = "The Shadow Realm",
		AltCards = {
			["Gravity Collapse"] = {
				Id = 6124857636,
				Name = "Gravity Collapse",
				Bio = "Stops even light from escaping."
			},
			["The Shadow Realm-AN"] = {
				Id = 9381251990,
				Name = "Multidimensional Window",
				Bio = "Peer into the other side and you shall be taken to a place where none exist but repudiation."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Archetype = "Nightmare",
		Cost = { Neutral = 4, Blue = 4, Green = 2 },
		EffectAnimation = "ShadowRealm",
		Fading = true,
		Effect = {
			Name = "Zappow!",
			Description = "Return all non-Nightmare fighters to their hands.",
			Type = "OnSummon",
			Power = { { "Return", 90 } },
			Target = "NotArchetype"
		},
		Bio = "Stops even hope from escaping."
	},
	["Great Lord Egotist"] = {
		Id = 7550919863,
		Name = "Great Lord Egotist",
		AltCards = {
			["Great Lord Egotist-ArtV"] = {
				Id = 7650357517,
				AltArt = true,
				Bio = "I am the wild dog watching with sixteen omniscient eyes. Unblinking endless judgment, cast as the patterns rise."
			},
			["Great Lord Egotist-AN"] = {
				Id = 9400910128,
				AttackEffect = "Gravity",
				Addant = "Night Fright-AN",
				Effect = {
					Description = "During your end step: Give your opponent a Pavor. This card gains 300 Health."
				},
				Bio = "ALL HAIL THE GREAT LORD EGOTIST."
			},
			["Great Lord Egotist-Precon"] = {
				Id = 16361234933,
				AttackEffect = "Gravity",
				Addant = "Night Fright-Precon",
				Effect = {
					Description = "During your end step: Give your opponent a Rend. This card gains 300 Health."
				},
				Bio = "I am above all. All will surrender to me."
			}
		},
		Health = 1300,
		Power = 200,
		Rarity = "Legendary",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		TransformImmune = true,
		Cost = { Neutral = 4, Blue = 2, Green = 2 },
		Addant = "Night Fright",
		CustomReminder = {
			["Night Frights"] = "A {W} undiscardable Nightmare action. Your opponent loses 300 life if they cast it."
		},
		Effect = {
			Name = "Night Creak",
			Description = "During your end step: Give your opponent a Night Fright. This card gains 300 Health.",
			Type = "OnEnd",
			Target = "Ally",
			Power = {
				{ "Add", "Addant", "Opponent" },
				{ "Heal", "300", "Self" }
			}
		},
		Bio = "Once, I was human. Now, I am much more."
	},
	Fenfie08 = {
		Id = 4792439726,
		Name = "Fenfie08",
		AltCards = {
			sin3715 = {
				Name = "sin3715",
				AttackEffect = "DoomStorm",
				Id = 7610990375,
				AltArt = true,
				Addant = "Nightmare-Mist",
				Bio = "\"Submit to the Great Lord Egotist.\""
			},
			Whitewolflila = {
				Name = "Whitewolflila",
				AttackEffect = "British",
				Id = 121278814814524,
				AltArt = true,
				Bio = "Morning doesn't come for a long time, you'd better quit while you still can.",
				Addant = "Jumpscare"
			},
			["Fenfie08-AN"] = {
				Name = "Ye Old Arte",
				AttackEffect = "Gravity",
				Id = 9368633088,
				Addant = "Nightmare-AN",
				Bio = "One day, the stars will align the skies once more to cross our paths."
			},
			["Princess Cheer"] = {
				Name = "Princess Cheer",
				AttackEffect = "SoulDrain",
				Id = 14959553952,
				AltArt = true,
				PremiumArt = 129,
				Commissioner = { 143814552, 1105140151 },
				Bio = "Even the biggest smiles can hide the most sinister truths."
			}
		},
		Health = 450,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		Cost = { Neutral = 1, Blue = 2 },
		Addant = "Nightmare",
		CustomReminder = {
			Nightmare = "A free undiscardable Nightmare action. Each player draws a card when it's cast."
		},
		Effect = {
			Name = "SPOOK",
			Description = "When this card is cast: Give your opponent a 'Nightmare'.",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Opponent"
		},
		Bio = "The happiest people always have the darkest secrets."
	},
	jojobinks321 = {
		Id = 10220065678,
		Name = "jojobinks321",
		AltCards = {
			jarjarbinks321 = {
				Id = 7724221997,
				AttackEffect = "Scythe",
				CopyBodge = "jarjarbinks321",
				Bio = "Welcome to the world of nightmares!"
			},
			["jojobinks321-AN"] = {
				Id = 9391623948,
				AttackEffect = "Gravity",
				Name = "Etemenanki",
				Effect = {
					Power = {
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" },
						{ "DeckAdd", "Nightmare-AN" }
					},
					Target = "Ally"
				},
				Bio = "Genesis, starts with nothing. Conclusion, ends with nothing."
			},
			Preta = {
				Id = 13653691169,
				Name = "Preta",
				AttackEffect = "Gravity",
				AltArt = true,
				Commissioner = { 191713409, 90658630 },
				Bio = "The more you hold on to what's left, the less the world holds on to you."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		Requirement = { "Archetype", "Ally", 1, 9999, "Nightmare" },
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		AddBlock = true,
		CustomReminder = {
			Nightmare = "A free undiscardable Nightmare action. Each player draws a card when it's cast."
		},
		Effect = {
			Name = "Restless Reward",
			Description = "Cast only if there's an allied Nightmare fighter.\nWhen you do: Shuffle ten 'Nightmares' into your deck.",
			Type = "OnSummon",
			Power = {
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" },
				{ "DeckAdd", "Nightmare" }
			},
			Target = "Ally"
		},
		Bio = "Wake up? Give me more time. Your hope is mine to treasure."
	},
	["Fried Acolyte"] = {
		Id = 7551049058,
		Name = "Fried Acolyte",
		AltCards = {
			["Fried Acolyte-AltV"] = {
				Id = 5705926730,
				AttackEffect = "Electric",
				CopyBodge = "Fried Acolyte-AltV",
				AltArt = true,
				Bio = "Ｆｒｉｘｕｍ．"
			}
		},
		Health = 750,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "AcolyteYellow",
		Archetype = "Acolyte",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Acolyte",
			Description = "During your end step: All allied Acolytes gain 50 Health and Power and generate.",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1 },
				{ "Heal", 50 },
				{ "Strengthen", 50 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "He's not an acolyte of the fried one. He's just been fried."
	},
	["Lunar Acolyte"] = {
		Id = 11772342331,
		Name = "Lunar Acolyte",
		AltCards = {
			["Lunar Acolyte-AltV"] = {
				CopyBodge = "Lunar Acolyte-AltV",
				Id = 7650350402,
				AltArt = true,
				Bio = "Ｌｕｎａｒｉｓ．"
			}
		},
		Health = 900,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Arcane",
		EffectAnimation = "AcolyteNeutral",
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Shield = true,
		Token = true,
		Effect = {
			Name = "Acolyte",
			Description = "During your end step: Search your deck for a colourless Acolyte card, that isn't 'Lunar Acolyte.'",
			Type = "OnEnd",
			Power = { {
				"MoveZone",
				{
					"NotIndexOrLunar Acolyte_Acolyte_Neutral",
					"Deck_Ally",
					"Hand_Ally",
					true,
					false
				},
				"Self"
			} },
			Target = "Ally"
		},
		Bio = "You might say he's a lunatic."
	},
	["Lunar Warrior"] = {
		Id = 6875830191,
		Name = "Lunar Warrior",
		AltCards = {
			["Good Merryswole"] = {
				Name = "Good Merryswole",
				AttackEffect = "Jab",
				Id = 9873894747,
				AltArt = true,
				Bio = "How else am I supposed to get a tan?"
			},
			["Birthday Boy Mushnowa"] = {
				Name = "Birthday Boy Mushnowa",
				Id = 10069349348,
				AltArt = true,
				Bio = "You guess the day."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		EffectAnimation = "AcolyteNeutral",
		Archetype = "Acolyte",
		Color = "Neutral",
		Rank = 4,
		Cost = { Neutral = 0 },
		Token = true,
		Effect = {
			Name = "Acolyte",
			Description = "Once: You lose all your {R}{G}{B}{Y}. Destroy this card unless you lost 4 or more studs.\nWhenever this card attacks: All allied Acolytes gain 100 Health and Power.",
			Ability = {
				OnAnyTrigger = {
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
						{ "SetRed", 0, "Ally" },
						{ "SetBlue", 0, "Ally" },
						{ "SetYellow", 0, "Ally" },
						{ "SetGreen", 0, "Ally" },
						{ "EVGreaterValueCheck", 3, "Self" }
					},
					Target = "Ally",
					TotalTriggerLimit = 1
				},
				OnEVCheckFail = {
					Power = { { "Destroy" } },
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{ "Strengthen", 100, "AlliedArchetype" },
						{ "Heal", 100, "AlliedArchetype" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "You might say he's a lunatic... with a sword."
	},
	["Infernal Acolyte"] = {
		Id = 7551047945,
		Name = "Infernal Acolyte",
		AltCards = {
			["Infernal Acolyte-AltV"] = {
				Id = 5705255003,
				CopyBodge = "Infernal Acolyte-AltV",
				AltArt = true,
				Bio = "Ａｍｂｕｓｔｕｍ．"
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Flare",
		EffectAnimation = "AcolyteRed",
		Archetype = "Acolyte",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Acolyte",
			Description = "During your end step: All allied Acolytes gain 100 Power and generate.",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1 },
				{ "Strengthen", 100 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "Do you like to play with fire?"
	},
	["Acolyte of the Rift"] = {
		Id = 7550885321,
		Name = "Acolyte of the Rift",
		AltCards = {
			["Acolyte of the Rift-AltV"] = {
				Id = 5705256238,
				AttackEffect = "Arcane",
				CopyBodge = "Acolyte of the Rift-AltV",
				AltArt = true,
				Bio = "Ａｂｙｓｓｏ．"
			}
		},
		Health = 1000,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "AcolyteBlue",
		Archetype = "Acolyte",
		Color = "Blue",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["The Void's Rift"] = "Dextrous fighters can attack twice each turn."
		},
		Effect = {
			Name = "Acolyte",
			Description = "During your end step: All allied Acolytes gain dextrous and generate.",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1 },
				{ "GivePassive", "Dextrous" }
			},
			Target = "AlliedArchetype"
		},
		Bio = "What makes the rift from the void?"
	},
	["Necromantic Acolyte"] = {
		Id = 7551063965,
		Name = "Necromantic Acolyte",
		AltCards = {
			["Necromantic Acolyte-AltV"] = {
				Id = 5705255688,
				AttackEffect = "Tempest",
				CopyBodge = "Necromantic Acolyte Alt-V",
				AltArt = true,
				Bio = "Ｇｎａｓｃｏｒ．"
			},
			["BIS0R (N0T Y0UR SAVI0UR)"] = {
				Id = 15805016465,
				Name = "BIS0R (N0T Y0UR SAVI0UR)",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 180,
				Bio = "<b><font color=\"#00FF00\">Magnolioideae of the family Magnoliaceae</font></b>"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "AcolyteGreen",
		Archetype = "Acolyte",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Acolyte",
			Description = "During your end step: All allied Acolytes gain 100 Health and generate.",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1 },
				{ "Heal", 100 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "HE JUST DOESN'T. GO. AWAY."
	},
	Glaurung = {
		Id = 3299974678,
		Name = "Glaurung",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Archetype = "Acolyte",
		Color = "Neutral",
		Token = true,
		IsLegendaryDragon = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Build Up",
			Description = "During your end step: All allied Acolytes gain 50 Health.",
			Type = "OnEnd",
			Power = { { "Heal", 50 } },
			Target = "AlliedArchetype"
		},
		Bio = "The greediest of the three dragons. Skin as dark as granite."
	},
	Smaug = {
		Id = 3299994138,
		Name = "Smaug",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Archetype = "Acolyte",
		Color = "Neutral",
		IsLegendaryDragon = true,
		Cost = { Neutral = 0 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The eldest of the three dragons. Broodmaster and maker."
	},
	["Aer Draco"] = {
		Id = 3299957463,
		Name = "Aer Draco",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Archetype = "Acolyte",
		Color = "Neutral",
		IsLegendaryDragon = true,
		Token = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Build Up",
			Description = "During your end step: All allied Acolytes gain 50 Power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 50 } },
			Target = "AlliedArchetype"
		},
		Bio = "The wisest of the three dragons. As cold as ice."
	},
	["Dragon Horde"] = {
		Id = 10184425747,
		Name = "Dragon Horde",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 3, 9999, "Acolyte" },
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Neutral = 3, Red = 1, Blue = 1, Green = 1, Yellow = 1 },
		AlternateCost = {
			IgnoreColor = { "Red", "Green", "Blue", "Yellow" }
		},
		CustomReminder = {
			["Glaurung the Greedy"] = "A 400/300, inert in play. It gives allied Acolytes 50 Health during its end steps.",
			["Smaug the Ancestral"] = "A 400/400 colourless fighter with no abilities.",
			["Aer Draco the Wise"] = "A 300/400, inert in play. It gives allied Acoytes 50 Power during it end steps."
		},
		Effect = {
			Name = "Build Up",
			Description = "Cast this card ignoring its {R}{G}{B}{Y} cost if there are 3 or more Acolytes in your Baseplate.\nSummon the Three Draconic Acolytes.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Glaurung" },
				{ "Summon", "Smaug" },
				{ "Summon", "Aer Draco" }
			},
			Target = "Ally"
		},
		Bio = "The dragons of the Horde are the same ones that conquered the earth thousands of years ago."
	},
	Greygnarl = {
		Id = 7550921368,
		Name = "Greygnarl",
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Yellow = 3, Green = 3, Red = 3, Blue = 3 },
		Overload = true,
		Rank = 5,
		Effect = {
			Name = "Omega Cost",
			Description = "When this card is cast: All allied Acolytes gain 300 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 300 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "Greygnarl is the only dragon with the ability to match up against his brother."
	},
	["Grimclaw the Unholy"] = {
		Id = 7550922611,
		Name = "Grimclaw the Unholy",
		AltCards = {
			["Grimclaw the UnholyAlt"] = {
				Id = 6468419442,
				AltArt = true,
				CopyBodge = "Grimclaw the UnholyAlt",
				AttackEffect = "Scorch",
				Bio = "When Grimclaw takes flight to the skies, the world is engulfed in darkness. Then nevermore."
			},
			["Grimclaw the Unholy-AN"] = {
				Id = 9362068904,
				Name = "The Nevermore",
				AttackEffect = "StudBlast",
				Bio = "When the 4 dragons unite, a divine beast is born. Then, Nevermore."
			},
			HulseBro = {
				Id = 16056318942,
				Name = "HulseBro",
				AttackEffect = "Punch",
				AltArt = true,
				Bio = "Beware he has appeared..."
			},
			["Grimclaw the Unholy-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 124252596333500,
				AttackEffect = "LaserGreen",
				Bio = "There was nothing. There were no creatures, no sun and moon, and no hope. All that was left was just a dragon, and Nevermore."
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Legendary",
		AttackEffect = "LaserGreen",
		SummonAnimation = "SummonGrimclaw",
		Color = "Neutral",
		Requirement = { "Board", "Opponent", 4, 5 },
		Cost = { Neutral = 5 },
		Overload = true,
		Rank = 5,
		Effect = {
			Name = "Omega End",
			Description = "Cast only if there's exactly 4 enemy fighters.",
			Type = "Null",
			Power = { { "Yellow", 0 } },
			Target = "All"
		},
		Bio = "A dragon of pure destruction, only to be stopped by Greygnarl."
	},
	["Master Acolyte's Altarr"] = {
		Id = 7550972385,
		Name = "Master Acolyte's Altar",
		Health = 1000,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Rank = 4,
		Effect = {
			Name = "Omega Cost",
			Description = "Once: You lose all your {R}{G}{B}{Y}. Destroy this card unless you lost 4 or more studs.\nWhenever you cast another Acolyte: Draw a card.",
			Ability = {
				OnAnyTrigger = {
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
						{ "SetRed", 0, "Ally" },
						{ "SetBlue", 0, "Ally" },
						{ "SetYellow", 0, "Ally" },
						{ "SetGreen", 0, "Ally" },
						{ "EVGreaterValueCheck", 3, "Self" }
					},
					Target = "Ally",
					TotalTriggerLimit = 1
				},
				OnEVCheckFail = {
					Power = { { "Destroy" } },
					Target = "Self"
				},
				["OnAny|Other|AllyCast"] = {
					Power = { {
						"Draw",
						1,
						"Ally",
						nil,
						nil,
						nil,
						"AcolyteAltar"
					} },
					Archetype = "Acolyte"
				}
			},
			Target = "Ally"
		},
		Bio = "Even if he cannot be seen, he can see you."
	},
	["The Master Acolyte"] = {
		Id = 130691019874873,
		Name = "The Master Acolyte",
		Health = 1500,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "AcolyteNeutral",
		Archetype = "Acolyte",
		Color = "Neutral",
		Rank = 4,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Acolyte",
			Description = "Once: You lose all your {R}{G}{B}{Y}. Destroy this card unless you lost 8 or more studs.\nThrice each turn, whenever you cast another unranked Acolyte: You gain {W}{W}{W}{W}{R}{G}{B}{Y}.",
			Ability = {
				OnAnyTrigger = {
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
						{ "SetRed", 0, "Ally" },
						{ "SetBlue", 0, "Ally" },
						{ "SetYellow", 0, "Ally" },
						{ "SetGreen", 0, "Ally" },
						{ "EVGreaterValueCheck", 7, "Self" }
					},
					Target = "Ally",
					TotalTriggerLimit = 1
				},
				OnEVCheckFail = {
					Power = { { "Destroy" } },
					Target = "Self"
				},
				["OnAny|Other|AllyCast"] = {
					Power = {
						{ "Neutral", 4 },
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 }
					},
					Target = "Self",
					Archetype = "Acolyte",
					Unranked = true,
					TurnTriggerLimit = 3
				}
			}
		},
		Bio = "The rats' worship inflated Greygnarl's ego; If Telamon's favourite people loved him more than his father, surely he deserved to take his deity."
	},
	["Nyxian Acolyte"] = {
		Id = 6886656488,
		Name = "Nyxian Acolyte",
		AltCards = {
			GreenNyx = { Id = 6886658150, Color = "Green", Rarity = "Token" }
		},
		Health = 450,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "AcolyteGreen",
		Archetype = "Acolyte",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Summonant = "GreenNyx",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Green.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Nightmares and Celestials share one attribute: they feast upon the mind of anyone daring enough to call upon them. That's why the main prerequisite needed to become a Nyxian Acolyte is to be an idiot."
	},
	["Acolyte of the Tribes"] = {
		Id = 6886660260,
		Name = "Acolyte of the Tribes",
		AltCards = {
			YellowTribes = { Id = 6886661369, Color = "Yellow", Rarity = "Token" },
			["Acolyte of the Tribes-UGC"] = {
				PackDisplayOverride = "In-game Yellow and Purple Cat Tail UGC Purchase",
				Id = 114397425633317,
				Name = "Gamer Girl",
				Summonant = "YellowTribes-UGC",
				Bio = "NYAAAAAHHHH I WAS PWAYING SUPPOWT I HAVE NO KILLS D:"
			},
			["YellowTribes-UGC"] = {
				Id = 128467754228052,
				Color = "Yellow",
				Rarity = "Token",
				Name = "BSOD",
				Bio = "Your PC ran into a skill issue and needs to restart. We're collecting some K/D stats, and then we'll wipe your hard drive depending on how bad you are at the game."
			},
			["The Monstrosity-R"] = {
				Id = 136558060207427,
				Name = "The Monstrosity",
				Summonant = "The Matriarch",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 551,
				Bio = "You are seated in a room that is empty. A chain digs into your wrist, binding one arm to the wall. It is quiet, and you are alone. This is what you deserve."
			},
			["The Matriarch"] = {
				Id = 75604172970022,
				Name = "The Matriarch",
				Color = "Yellow",
				Rarity = "Token",
				AttackEffect = "Jab",
				Bio = "Are you trying to say something out loud? I don't think you can do that while you're in here with me."
			}
		},
		Health = 450,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "AcolyteYellow",
		Archetype = "Acolyte",
		Color = "Green",
		Cost = { Neutral = 4 },
		Summonant = "YellowTribes",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Yellow.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Why focus on their differences? They're all my strength!"
	},
	["Acolyte of the Champions"] = {
		Id = 6886671242,
		Name = "Acolyte of the Champions",
		AltCards = {
			GreenChampion = { Id = 12703345080, Color = "Green", Rarity = "Token" },
			["Ilmep, Swap Supremacist"] = {
				Id = 119095389375719,
				Name = "Ilmep, Swap Supremacist",
				Bio = "If you want it done right, do it yourself.",
				AltArt = true,
				Color = "Red",
				Rarity = "Uncommon",
				Summonant = "GreenIlmep"
			},
			GreenIlmep = {
				Id = 120458123201783,
				Name = "Ilmep, Swap Supremacist",
				Bio = "If you want it done right, do it yourself.",
				Color = "Green",
				Rarity = "Token"
			}
		},
		Health = 450,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		EffectAnimation = "AcolyteGreen",
		Archetype = "Acolyte",
		Color = "Red",
		Cost = { Neutral = 4 },
		Summonant = "GreenChampion",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Green.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "My strength and life, I dedicate to them!"
	},
	["Fried One Cultist"] = {
		Id = 6886663948,
		Name = "Acolyte of the Future",
		AltCards = {
			BlueFuture = { Id = 6886665144, Color = "Blue", Rarity = "Token" }
		},
		Health = 450,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "AcolyteBlue",
		Archetype = "Acolyte",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Summonant = "BlueFuture",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Blue.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "In the future, you get to install your own gods in your brain and attend church with VR sets! Wow!"
	},
	["Acolyte of the Storm"] = {
		Id = 6886681005,
		Name = "Acolyte of the Storm",
		AltCards = {
			DairingSpookHead = {
				Id = 6886705451,
				AttackEffect = "Storm",
				Summonant = "ParaAcolyteToken",
				Name = "Paraselene Acolyte",
				Bio = "These acolytes are taught that becoming a vessel for the Moon is the greatest honor. Those capable of channeling the Moon's rays graduate to Sages, the rest eventually become moonlight itself."
			},
			ParaAcolyteToken = {
				Id = 6886668941,
				AttackEffect = "Storm",
				Summonant = "ParaAcolyteToken",
				Name = "Paraselene Acolyte",
				Color = "Red",
				Rarity = "Token",
				Bio = "These acolytes are taught that becoming a vessel for the Moon is the greatest honor. Those capable of channeling the Moon's rays graduate to Sages, the rest eventually become moonlight itself."
			},
			RedStorm = { Id = 6886683392, Color = "Red", Rarity = "Token" }
		},
		Archetype = "Acolyte",
		Health = 450,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		EffectAnimation = "AcolyteRed",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Summonant = "RedStorm",
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Summon a clone of it, except it's Red.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Combining the calmest breeze with the harshest winds, that's what it means to tend the Storm."
	},
	["Hedonist Acolyte"] = {
		Id = 6886652536,
		Name = "Hedonist Acolyte",
		Archetype = "Acolyte",
		Summonant = "YellowHedonist",
		AltCards = {
			YellowHedonist = {
				Id = 6886654238,
				CopyBodge = "YellowHedonist",
				Color = "Yellow",
				Rarity = "Token"
			}
		},
		Health = 450,
		Power = 100,
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
	Nova = {
		Id = 6858732011,
		Name = "Nova",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Description = "Select an unranked Dragon card in Beckoned Masters in your deck or graveyard.\nSummon it, triggering its effect as though it was cast.\nThen obliterate it unless there's 4 or more allied Acolytes.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Archetype", "Acolyte" }
						},
						{ "EVGreaterValueCheck", 3 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck", "Ally_GraveZone" },
						Condition = { HasPassive = "IsLegendaryDragon", Unranked = true },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a Dragon to summon"
					}
				},
				OnEVCheckFail = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						},
						{ "Obliterate", 30, "SummonedCard" }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck", "Ally_GraveZone" },
						Condition = { HasPassive = "IsLegendaryDragon", Unranked = true },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a Dragon to summon"
					}
				}
			},
			TriggerOnSummons = true
		},
		Bio = "Today, everything just seems to fall apart. But the light will still take 2.4197 x10^21242 years to reach our planet, so we'll never know..."
	},
	["Naga the Sea Serpent"] = {
		Id = 74502832681947,
		Name = "Naga the Sea Serpent",
		AltCards = {
			["Naga the Sea Serpent-AN"] = {
				Id = 9462797124,
				AttackEffect = "IcePunch",
				Name = "SoulSearch",
				Bio = "Your body submits, your heart succumbs! So why does your mind still resist?"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Ice",
		EffectAnimation = "Freeze",
		Color = "Blue",
		IsLegendaryDragon = true,
		Cost = { Neutral = 4, Blue = 4 },
		Effect = {
			Name = "Absolute Zero",
			Description = "When this card is cast: Lock a target fighter forever.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Single",
			Increase = 999
		},
		Bio = "When one hears the battlecry of Naga, the world goes quiet. Then nevermore."
	},
	["Nymn the Redrune Leader"] = {
		Id = 7017588297,
		Name = "Nymn the Redrune Leader",
		AltCards = {
			Shizune_X = {
				Id = 4979849291,
				Name = "Shizune_X",
				AttackEffect = "Katana",
				AltArt = true,
				CopyBodge = "Shizune_X",
				Bio = "From where you're kneeling it must seem like an 18-carat run of bad luck. Truth is...the game was rigged from the start."
			},
			["Nymn the Redrune Leader-AN"] = {
				Id = 9866105828,
				AttackEffect = "Jab",
				Name = "ROBLOXADOR!!!!",
				Bio = "IT'S TIME TO RUMBLE."
			}
		},
		Health = 500,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Flare",
		Color = "Red",
		IsLegendaryDragon = true,
		Cost = { Neutral = 4, Red = 4 },
		EffectAnimation = "FireBreath",
		Effect = {
			Name = "OBLITERATION",
			Description = "When this card is cast: Deal 500 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 500, "Single" } },
			Target = "Single"
		},
		Bio = "When one sees the flames of Nymn, the world goes red. Then nevermore."
	},
	["Typheus the Whelp"] = {
		Id = 7027998702,
		Name = "Typheus the Whelp",
		AltCards = {
			["Typheus the Whelp-AN"] = {
				Id = 9368641215,
				AttackEffect = "Katana",
				Name = "Hyper Max Dai Henshin Shin Goldfish Kiwami V-Max",
				Bio = "\"Pathetic.\""
			},
			["S1AP, Forgotten Fox"] = {
				Id = 79702991444519,
				Name = "S1AP, Forgotten Fox",
				AttackEffect = "Darkheart",
				AltArt = true,
				PremiumArt = 293,
				Bio = "We're going to finish this, once for all."
			},
			AQuixoticFantasy = {
				Id = 79573637902195,
				Name = "AQuixoticFantasy",
				AttackEffect = "Jab",
				SummonAnimation = "DreadPriest",
				AltArt = true,
				PremiumArt = 562,
				Bio = "\"Limbus company reference?!?!\""
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Blaze",
		Color = "Yellow",
		IsLegendaryDragon = true,
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
	["Zerax the Untameable"] = {
		Id = 10186529114,
		Name = "Zerax the Untameable",
		AltCards = {
			["Zerax the Untameable-AN"] = {
				Id = 9408924045,
				Name = "Envy",
				AttackEffect = "Tempest",
				Bio = "Envious of those who got to become real cards."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Scorch",
		Color = "Green",
		IsLegendaryDragon = true,
		Cost = { Neutral = 4, Green = 4 },
		Effect = {
			Name = "Nature's Shield",
			Description = "When this card is cast: Your opponent loses 700 life. You gain 700 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -700 },
				{ "Inflict", 700 }
			},
			Target = "Opponent"
		},
		Bio = "When one is spotted by Zerax, the world is buried. Then nevermore."
	},
	Nevermore = {
		Id = 6578853254,
		Name = "Nevermore",
		AltCards = {
			["Take The L"] = {
				Name = "Take The L",
				Id = 8778704368,
				Effect = {
					Power = {
						{ "Inflict", 1200, "Opponent" },
						{ "Add", "Take The L" }
					}
				},
				Bio = "Here... you might want to hold this."
			},
			["Nevermore-AN"] = {
				Name = "Fractal",
				Id = 9709407193,
				Effect = {
					Power = {
						{ "Inflict", 1200, "Opponent" },
						{ "Add", "Nevermore-AN" }
					}
				},
				Bio = "The Paraselene Sage thought he found the most forbidden of Powers. He was wrong."
			},
			Avant = {
				Id = 135430272659742,
				Name = "Avant",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 580,
				Bio = "Cowabunga!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Red = 10 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Your opponent loses 1200 Life.\nGive yourself a copy of this card.",
			Type = "OnSummon",
			Power = {
				{ "Inflict", 1200, "Opponent" },
				{ "Add", "Nevermore" }
			},
			Target = "Ally"
		},
		Bio = "The world burns."
	},
	["Fuchsia Eyes Red Dragon"] = {
		Id = 7021476399,
		Name = "Fuchsia Eyes Red Dragon",
		AltCards = {
			["Fuchsia Eyes Red Dragon-AN"] = {
				Id = 9381265072,
				AttackEffect = "MagicRed",
				Name = "Logic, Pie Breaker",
				Bio = "roblox pizza sound effect"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Flare",
		Color = "Red",
		IsLegendaryDragon = true,
		Effect = {
			Name = "Omega Flame",
			Description = "When this card is cast: A target fighter gains 200 Health, then deal 200 damage to all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Damage", 200, "All" }
			},
			Target = "Single"
		},
		Cost = { Neutral = 2, Red = 6 },
		Bio = "It took an aeon to rebuild after the Fuchsia Devastation."
	},
	["Blue Eyes Indigo Dragon"] = {
		Id = 7021248106,
		Name = "Blue Eyes Indigo Dragon",
		AltCards = {
			BlueEyesJapanese = {
				Id = 6652744802,
				Name = "ブルーアイインディゴドラゴン",
				CopyBodge = "BlueEyesJapanese",
				CustomReminder = {
					Translation = "When this card is cast: Swap the stats of all fighters, then of a target fighter."
				},
				Effect = {
					Name = "Omega Flame",
					Description = "このカードが出された時、全てのファイターのステータスを入れ替え、ターゲットのステータスを入れ替える。",
					Type = "OnSummon",
					Power = {
						{ "Swap", 9999, "All" },
						{ "Swap", 9999, "Single" }
					},
					Target = "Single"
				},
				Bio = "BLOX CARDSへようこそ。 ご滞在をお楽しみください!"
			},
			["Blue Eyes Indigo Dragon-Hal"] = {
				Id = 14555975755,
				AttackEffect = "Bite",
				Name = "Mothman",
				Bio = "Sighted before a tragic accident, this creature foresees disasters before they happen. If you see it, take it as a warning."
			}
		},
		Health = 800,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Flame",
		IsLegendaryDragon = true,
		Color = "Blue",
		Effect = {
			Name = "Omega Flame",
			Description = "When this card is cast: Swap the stats of all fighters, then of a target fighter.",
			Type = "OnSummon",
			Power = {
				{ "Swap", 9999, "All" },
				{ "Swap", 9999, "Single" }
			},
			Target = "Single"
		},
		Cost = { Neutral = 2, Blue = 5 },
		Bio = "It took an aeon for the Korblox to wake from the Indigo Slumber."
	},
	["Teal Eyes Green Dragon"] = {
		Id = 7550995824,
		Name = "Teal Eyes Green Dragon",
		AltCards = {
			["Teal Eyes Green Dragon-H25"] = {
				Id = 126703033164335,
				Name = "Red-Eyed Malfunction",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "Its eyes are red because it wants to KILL you."
			}
		},
		Health = 800,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Scorch",
		IsLegendaryDragon = true,
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		Effect = {
			Name = "Omega Division",
			Description = "When this card is cast: A target fighter gains 200 Power, then all fighters lose 200 Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{ "Weaken", 200, "All" }
			},
			Target = "Single"
		},
		Bio = "It took an aeon for the Overseers to cut back the Teal Flourishing."
	},
	["Sand Eyes Yellow Dragon"] = {
		Id = 7550981615,
		Name = "Sand Eyes Yellow Dragon",
		AltCards = {
			["Deadly Disco Duo"] = {
				Id = 9144410804,
				Name = "Deadly Disco Duo",
				AttackEffect = "Jab",
				SummonAnimation = "DancePotionAll",
				AltArt = true,
				Bio = "Dame da die."
			},
			["Sand Eyes Yellow Dragon-ALT"] = {
				Id = 72550339534961,
				Name = "Sand Eyes Yellow Dragon",
				AttackEffect = "MagicYellow",
				AltArt = true,
				PremiumArt = 433,
				Bio = ""
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		SummonAnimation = "EatTurkeyAll",
		EffectAnimation = "MidMagicYellowEffect",
		IsLegendaryDragon = true,
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 5 },
		Effect = {
			Name = "Omega Charge",
			Description = "When this card is cast: All fighters gain 150 Health and Power. Deal 150 damage to a target fighter and it loses 150 Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150 },
				{ "Heal", 150 },
				{ "Damage", 150, "Single" },
				{ "Weaken", 150, "Single" }
			},
			Target = "All"
		},
		Bio = "It took an aeon for the doges to repopulate from the Yellow Sandstorm."
	},
	["Shedletsky the Fried One"] = {
		Id = 11769946381,
		Name = "Shedletsky, the Fried One",
		AltCards = {
			["LordPendleton, Tophat Enthusiast"] = {
				Name = "LordPendleton, Tophat Enthusiast",
				Rarity = "Legendary",
				AttackEffect = "Jab",
				AltArt = true,
				CopyBodge = "LordPendleton, Tophat Enthusiast",
				Id = 7971544557,
				Bio = ""
			},
			["Shedletsky the Fried One-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 110784744838881,
				Bio = "META PWN!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		Color = "Neutral",
		Archetype = "Shedletsky",
		Cost = { Neutral = 7 },
		SummonAnimation = "TelamonSummon",
		SummonedAnimation = "TelamonSummon",
		EffectAnimation = "ShedletskyDraw",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "God descended to answer the commoner's pleas, although his form was highly variable."
	},
	["Right Arm of the Fried One"] = {
		Id = 5054713870,
		Name = "Scintillant Limb",
		AltCards = {
			["Thawed Top Hat"] = {
				Name = "Thawed Top Hat",
				Rarity = "Epic",
				AltArt = true,
				Id = 7644604091,
				Effect = {
					Description = "Cast only if there's an allied aspect of Shedletsky the Fried one.\nTurn your Tophat Enthusiast into his blue form, Cold Shot. He gains 500 Health. Card effects can't return Tophat Enthusiast while in this form.",
					Power = {
						{ "TransformWithRarity", "LordPendleton, Cold Shot" },
						{ "Heal", 500 }
					},
					Target = "AlliedArchetype"
				},
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Blue = 1 },
		EffectAnimation = "SelfBlue",
		Requirement = { "Archetype", "Ally", 1, 9999, "Shedletsky" },
		CustomReminder = {
			["The Resonator"] = "While in this form, effects also can't return him. During his end step, he draws an additional card and has all enemy fighters lose 100 Power."
		},
		Effect = {
			Name = "Limb",
			Description = "Cast only if there's an allied Aspect of Shedletsky the Fried One.\nTurn him into his blue form, the Resonator.\nHe gains 500 Health.",
			Type = "OnSummon",
			Power = {
				{ "TransformWithRarity", "Shedletsky, the Resonator" },
				{ "Heal", 500 }
			},
			Target = "AlliedArchetype",
			EffectTransformPreserveRarity = true
		},
		Bio = "A curious chicken limb. Thinking about the possibilities provided makes your head spin."
	},
	["Shedletsky, the Resonator"] = {
		Id = 6590699532,
		Name = "Shedletsky, the Resonator",
		AltCards = {
			["LordPendleton, Cold Shot"] = {
				Name = "LordPendleton, Cold Shot",
				AttackEffect = "Ice",
				Rarity = "Token",
				Id = 7644602084,
				Bio = ""
			}
		},
		Health = 1250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		ReturnImmune = true,
		Archetype = "Shedletsky",
		Color = "Blue",
		Cost = { Neutral = 7 },
		EffectAnimation = "ShedletskyDrawBlue",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw two cards. All enemy fighters lose 100 Power.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 2 },
				{ "Weaken", 100, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["Right Leg of the Fried One"] = {
		Id = 5054711159,
		Name = "Tyrannical Limb",
		AltCards = {
			["Timeless Top Hat"] = {
				Name = "Timeless Top Hat",
				Rarity = "Epic",
				AltArt = true,
				Id = 7676019901,
				Transformant = "LordPendleton, Market Crasher",
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Red = 1 },
		EffectAnimation = "SelfRed",
		Requirement = { "Archetype", "Ally", 1, 9999, "Shedletsky" },
		CustomReminder = {
			["The Raging Pulse"] = "While in this form, effects also can't destroy him. During his end step, he also deals 200 damage to all enemy fighters and your opponent loses 200 life."
		},
		Transformant = "Shedletsky, the Raging Pulse",
		Effect = {
			Name = "Limb",
			Description = "Cast only if there's an allied aspect of Shedletsky the fried one.\nTurn your Shedletsky into his red form, The Raging Pulse.\nHe gains 500 Power.",
			Type = "OnSummon",
			Power = {
				{ "TransformWithRarity", "Transformant" },
				{ "Strengthen", 500 }
			},
			Target = "AlliedArchetype",
			EffectTransformPreserveRarity = true
		},
		Bio = "A fiery chicken limb. Holding it fills your mind with thoughts of conquest."
	},
	["Shedletsky, the Raging Pulse"] = {
		Id = 6094196409,
		Name = "Shedletsky, the Raging Pulse",
		AltCards = {
			["LordPendleton, Market Crasher"] = {
				Name = "LordPendleton, Market Crasher",
				AttackEffect = "Storm",
				Rarity = "Token",
				Id = 7676023428,
				Bio = ""
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		DestroyImmune = true,
		Archetype = "Shedletsky",
		Color = "Red",
		Cost = { Neutral = 7 },
		EffectAnimation = "ShedletskyDraw",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. Deal 200 damage to all enemy fighters. Your opponent loses 200 Life.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1 },
				{ "Inflict", 200, "Opponent" },
				{ "Damage", 200, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["Left Leg of the Fried One"] = {
		Id = 5054712474,
		Name = "Verdant Limb",
		AltCards = {
			["Wizard's Hat"] = {
				Name = "Wizard's Hat",
				Rarity = "Epic",
				Id = 7676017347,
				AltArt = true,
				Transformant = "LordPendleton, Luck Warrior",
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Green = 1 },
		EffectAnimation = "SelfGreen",
		Requirement = { "Archetype", "Ally", 1, 9999, "Shedletsky" },
		Transformant = "Shedletsky, Locus of Icons",
		CustomReminder = {
			["Locus of Studs"] = "While in this form, effects also can't swap his stats. During his end steps, he also sets all of coloured studs to 4."
		},
		Effect = {
			Name = "Limb",
			Description = "Cast only if there's an allied Aspect of Shedletsky the Fried One.\nTurn him into his green form, Locus of Studs. He gains 500 Health. Effects can't swap Shedletsky's stats while in this form.",
			Type = "OnSummon",
			Power = {
				{ "TransformWithRarity", "Transformant" },
				{ "Heal", 500 }
			},
			Target = "AlliedArchetype",
			EffectTransformPreserveRarity = true
		},
		Bio = "A succulent chicken limb. Unimaginable growth awaits those who know how to use it."
	},
	["Shedletsky, Locus of Icons"] = {
		Id = 4988839855,
		Name = "Shedletsky, Locus of Studs",
		AltCards = {
			["LordPendleton, Luck Warrior"] = {
				Name = "LordPendleton, Luck Warrior",
				AttackEffect = "Tempest",
				Rarity = "Token",
				Id = 7676015577,
				Bio = ""
			}
		},
		Health = 1500,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		SwapImmune = true,
		Archetype = "Shedletsky",
		Color = "Green",
		Cost = { Neutral = 7 },
		EffectAnimation = "ShedletskyDrawGreen",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. Set your non-Colourless studs to 4{R}{G}{B}{Y}.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1 },
				{ "SetYellow", 4 },
				{ "SetBlue", 4 },
				{ "SetRed", 4 },
				{ "SetGreen", 4 }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["Left Arm of the Fried One"] = {
		Id = 6858738748,
		Name = "Multicultural Limb",
		AltCards = {
			["Fullmetal Hat"] = {
				Name = "Fullmetal Hat",
				AttackEffect = "Electric",
				Rarity = "Epic",
				AltArt = true,
				Id = 10184700664,
				Transformant = "Pendleton Alpha",
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Yellow = 1 },
		EffectAnimation = "SelfYellow",
		Requirement = { "Archetype", "Ally", 1, 9999, "Shedletsky" },
		CustomReminder = {
			["Paragon of Unity"] = "While in this form, during his end steps, Shedletsky also summons a 400/50 Noob with no abilities, then all allied fighters gain 100 Power."
		},
		Transformant = "Shedletsky, Paragon of Unity 1",
		Effect = {
			Name = "Limb",
			Description = "Cast only if there's an allied aspect of Shedletsky the Fried one.\nTurn him into his yellow form, Paragon of Unity. He gains 500 Health.",
			Type = "OnSummon",
			Power = {
				{ "TransformWithRarity", "Transformant" },
				{ "Heal", 500 }
			},
			Target = "AlliedArchetype",
			EffectTransformPreserveRarity = true
		},
		Bio = "A thriving chicken limb, filled with a billion different possibilities."
	},
	["Shedletsky, Paragon of Unity 1"] = {
		Id = 5007532697,
		Name = "Shedletsky, Paragon of Unity",
		CopyBodge = "Shedletsky, Paragon of Unity 1",
		AltCards = {
			["Pendleton Alpha"] = {
				Name = "Pendleton Alpha",
				AttackEffect = "Electric",
				Rarity = "Token",
				Id = 7954119898,
				Bio = ""
			}
		},
		Health = 1100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		Archetype = "Shedletsky",
		Color = "Yellow",
		Cost = { Neutral = 7 },
		EffectAnimation = "ShedletskyDrawYellow",
		Summonant = "Noob",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. Summon a 400/50 Noob with no abilities, then all allied fighters gain 100 Power.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1 },
				{ "Summon", "Summonant" },
				{ "Strengthen", 100, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	Chickenduckbird = {
		Id = 10279232206,
		Name = "ChickenDuckBird",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Green = 1, Yellow = 1, Blue = 1 },
		EffectAnimation = "ShedletskyDrawYellow",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Search your deck for 'Shedletsky, the Fried One.'",
			Type = "OnSummon",
			Power = { { "Tutorfor", "Shedletsky the Fried One" } },
			Target = "Ally"
		},
		Bio = "Let's take these bones of mine, lay them out in the yard. Arrange them in any old order, and it'll still make more sense than this world."
	},
	ChickenduckbirdV2 = {
		Id = 7021465226,
		Name = "ChickenGooseBird",
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Assimilate",
			Description = "During your end step: Search your deck for one of Shedletsky's Limbs of Power, or all of them if you control him.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"RandomTutorfor",
							"Shedletsky Action",
							nil,
							nil,
							nil,
							"ShedletskyDrawYellow"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Shedletsky Action" },
						{ "RandomTutorfor", "Shedletsky Action" },
						{ "RandomTutorfor", "Shedletsky Action" }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "Ally", 1, 999999, "Shedletsky" },
					NoBlip = true
				}
			}
		},
		Bio = "I'm sending out a signal to guide your way, Shedletsky!"
	},
	["Guardia Seeress"] = {
		Id = 7550932096,
		Name = "Guardia Seeress",
		AltCards = {
			["Guardia Seeress-AN"] = {
				Id = 9513939651,
				AttackEffect = "Rifle",
				Name = "Doomsday Skirmisher",
				Bio = "\"It's been 104 days since the war ended. Despite that, seems like the apocalypse hasn't.\""
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Green",
		Cost = { Blue = 2, Green = 2 },
		Effect = {
			Name = "Undead Rising",
			Description = "During your end step: You gain {B}.",
			Type = "OnEnd",
			Power = { {
				"Blue",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudBlue"
			} },
			Target = "Ally"
		},
		Bio = "Blessed with the Power of foresight, cursed with the knowledge it entails."
	},
	["Guardia Angel"] = {
		Id = 7550923900,
		Name = "Guardia Angel",
		AltCards = {
			["Guardia Angel-AN"] = {
				Id = 9513541727,
				Name = "Street Thug",
				AttackEffect = "Jab",
				Bio = "\"Extorting every resident here, Jack. Can't fret over every impoverished person.\""
			},
			["RA Dead Duelists"] = {
				Id = 133224261499921,
				Name = "R&A, Dead Duelists",
				AttackEffect = "LinkedSword",
				AltArt = true,
				PremiumArt = 422,
				Bio = "2 Dead, 2 Rails"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Yellow = 2, Green = 2 },
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "During your end step: You gain {Y}.",
			Type = "OnEnd",
			Power = { {
				"Yellow",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudYellow"
			} },
			Target = "Ally"
		},
		Bio = "Heaven is just jail for the kind."
	},
	["Guardia Knight"] = {
		Id = 7550930702,
		Name = "Guardia Knight",
		AltCards = {
			["Guardia Knight-AN"] = {
				Id = 9528755990,
				Name = "Arsonist",
				AttackEffect = "Flare",
				Bio = "\"39 Charred. 0 Identified.\""
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 2, Red = 2 },
		Effect = {
			Name = "I refuse to believe that miku is alive.",
			Description = "During your end step: You gain {Y}.",
			Type = "OnEnd",
			Power = { {
				"Yellow",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudYellow"
			} },
			Target = "Ally"
		},
		Bio = "Stop! You have violated the law! Pay the court a fine or serve your sentence! Your stolen goods are now forfeit."
	},
	["Guardia Custodian"] = {
		Id = 7550928039,
		Name = "Guardia Custodian",
		AltCards = {
			["Edge Gaming Jecht08"] = {
				Id = 7397774184,
				Name = "Jecht08, Ultra Slayer",
				AttackEffect = "Katana",
				AltArt = true,
				Bio = "Killing Ultras only fuels his edginess"
			},
			["Guardia Custodian-AN"] = {
				Id = 9528788918,
				Name = "Space Marine",
				AttackEffect = "Rifle",
				Bio = "For the Empire!"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		Effect = {
			Name = "BeatZZ",
			Description = "During your end step: You gain {R}.",
			Type = "OnEnd",
			Power = { {
				"Red",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudRed"
			} },
			Target = "Ally"
		},
		Bio = "Home isn't where you rest. It's what you believe in."
	},
	["Guardia Fallen"] = {
		Id = 9709429006,
		Name = "Guardia Fallen",
		AltCards = {
			["RG Swap Enthusiast Wildygamer"] = {
				Id = 9050070780,
				AltArt = true,
				Name = "RG Swap Enthusiast Wildygamer",
				AttackEffect = "Rifle",
				Bio = "I always get my revenge."
			},
			["Guardia Fallen-AN"] = {
				Id = 9528786739,
				Name = "Destroyer of Children",
				AttackEffect = "TimeBomb",
				Bio = "Name/Art PENDING."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Green = 2, Red = 2 },
		Effect = {
			Name = "Booming Resd",
			Description = "During your end step: You gain {G}.",
			Type = "OnEnd",
			Power = { {
				"Green",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudGreen"
			} },
			Target = "Ally"
		},
		Bio = "After The Fall, the remains of Guardia splintered into smaller kingdoms, exiled to the dark forests of the Western Wilds."
	},
	["Guardia Bladesmith"] = {
		Id = 7550926333,
		Name = "Guardia Bladesmith",
		AltCards = {
			["Flufflefunz, Forgotten"] = {
				Id = 8503103760,
				Name = "Flufflefunz, Forgotten",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Now that's a good bridge to never cross until there's no doubt that he's dead."
			},
			["Guardia Bladesmith-AN"] = {
				Id = 9528757915,
				AttackEffect = "Jab",
				Name = "Brawler",
				Bio = "\"Not when you're \"invigorating the economy,\" right? What do you know about \"the Economy\"? You weren't born poor. You've never been in finance. You don't know what its like to calculate taxes and work and invest just to survive...\""
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Metalurgy",
			Description = "During your end step: You gain {B}.",
			Type = "OnEnd",
			Power = { {
				"Blue",
				1,
				nil,
				nil,
				nil,
				nil,
				"StudBlue"
			} },
			Target = "Ally"
		},
		Bio = "Personally, he prefers making shields."
	},
	["Wielder of the Firebrand"] = {
		Id = 7551018621,
		Name = "Wielder of the Firebrand",
		AltCards = {
			["nich."] = {
				Id = 78378859621489,
				Name = "nich.",
				AttackEffect = "FirePunch",
				EffectAnimation = "RedEyesSelf",
				AltArt = true,
				Bio = "Extra molten and extra furious."
			},
			["Smirking Sophomoric"] = {
				Id = 120998653952789,
				Name = "Smirking Sophomoric",
				Effect = {
					Name = "Sneak Attack",
					Description = "When this card is cast: Put a Red Stud and a Yellow Stud into your Baseplate. Destroy all Green and Blue cards in your Baseplate.",
					Type = "OnSummon",
					Power = {
						{
							"AddGenZone",
							{ "Red Stud-Smiley", 1 }
						},
						{
							"AddGenZone",
							{ "Yellow Stud-Smiley", 1 }
						},
						{
							"GenZoneDiscard",
							{ "Blue", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Green", 0 }
						}
					},
					Target = "Ally"
				},
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 502,
				Bio = "I DID IT, I STOLD THE FIREBRA- GET BACK HERE!!!"
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Firebrand",
		EffectAnimation = "WielderFirebrandEffect",
		Color = "Yellow",
		Cost = { Neutral = 3, Red = 3, Yellow = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Red Stud and a Yellow Stud into your Baseplate. Destroy all Green and Blue cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Blue", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Green", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "Rip and tear, until it is done."
	},
	["Wielder of the Windforce"] = {
		Id = 7551033646,
		Name = "Wielder of the Windforce",
		AltCards = {
			["Fluffle 'Warcrime' Funz"] = {
				Id = 9570605593,
				AttackEffect = "Slash",
				Name = "Fluffle 'Warcrime' Funz",
				AltArt = true,
				Bio = "Cut the world in half, I bet that you will go and find a sleeping giant. Turn the page just to wake him up, and then turn the page and then turn the page to kill him."
			},
			["Wielder of the Windforce-AN"] = {
				Id = 18199515476,
				AttackEffect = "Slash",
				Name = "The Resident",
				Bio = "♪ gravity hurts ♪",
				Effect = {
					Name = "Sneak Attack",
					Description = "When this card is cast: Put a Blue Stud and a Yellow Stud into your Baseplate. Destroy all Red and Green cards in your Baseplate.",
					Type = "OnSummon",
					Power = {
						{
							"AddGenZone",
							{ "BlueResident", 1 }
						},
						{
							"AddGenZone",
							{ "YellowResident", 1 }
						},
						{
							"GenZoneDiscard",
							{ "Red", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Green", 0 }
						}
					},
					Target = "Ally"
				}
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Windforce",
		EffectAnimation = "WielderWindforceEffect",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3, Yellow = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Blue Stud and a Yellow Stud into your Baseplate. Destroy all Red and Green cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Red", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Green", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "The four winds meet where the Windforce's metal collides with flesh."
	},
	["Wielder of the Illumina"] = {
		Id = 7551021111,
		Name = "Wielder of the Illumina",
		AltCards = {
			["Jecht08, Pepsi Wielder"] = {
				Id = 9391610825,
				Name = "Jecht08, Pepsi Wielder",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Other soft-drink enthusiasts fear him, as he brings liberation to the pepsi kingdom. After he chugs a dozen pepsi's you wouldn't stand a chance against him."
			},
			["Wielder of the Illumina-H25"] = {
				Id = 115279464150391,
				Name = "Wielder of the Illumina",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Effect = {
					Name = "Sneak Attack",
					Description = "When this card is cast: Put a Red Stud and a Blue Stud into your Baseplate. Destroy all Green and Yellow cards in your Baseplate.",
					Type = "OnSummon",
					Power = {
						{
							"AddGenZone",
							{ "Blue Stud-Vamp", 1 }
						},
						{
							"AddGenZone",
							{ "Red Stud-Vamp", 1 }
						},
						{
							"GenZoneDiscard",
							{ "Yellow", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Green", 0 }
						}
					},
					Target = "Ally"
				},
				AttackEffect = "Slash",
				Bio = "The sunlight means nothing to a vampire when you're as blind as a bat!"
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Illumina",
		EffectAnimation = "WielderIlluminaEffect",
		Color = "Red",
		Cost = { Neutral = 3, Blue = 3, Red = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Red Stud and a Blue Stud into your Baseplate. Destroy all Green and Yellow cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Yellow", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Green", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "Nobody can perceive how bright the Illumina is. Not even the wielder himself can see."
	},
	["Wielder of the Venomshank"] = {
		Id = 7551022315,
		Name = "Wielder of the Venomshank",
		AltCards = {
			["Unc, Reality's Exile"] = {
				Id = 7945347414,
				Name = "Unc, Reality's Exile",
				AttackEffect = "Tempest",
				AltArt = true,
				CopyBodge = "Unc, Reality's Exile",
				Bio = " Unconscious and unable to move in an unknown place, the voices from before returned, more distorted as they echoed in his mind: '<Until you have erased/wiped the rest of the> <Nightmares/Boogeymen from your mind> <Take in the infinite suffering/anguish of the world for millennia> <This is your punishment/rehabilitation> <You will see us when you are finished/dead>'"
			},
			["Ray."] = {
				Id = 102193695638130,
				Name = "Ray.",
				Commissioner = { "Rayburn_89" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 704,
				Bio = "WOWZA! you pulled me!!! I'm like, the rarererest ever!"
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Venomshank",
		EffectAnimation = "WielderVenomshankEffect",
		Color = "Yellow",
		Cost = { Neutral = 3, Green = 3, Yellow = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Green Stud and a Yellow Stud into your Baseplate. Destroy all Red and Blue cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Red", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Blue", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "Being hit by a sword generally means you're about to die. Being hit by the Venomshank means you're absolutely going to die."
	},
	["Wielder of the Ghostwalker"] = {
		Id = 7551019822,
		Name = "Wielder of the Ghostwalker",
		AltCards = {
			Tige1111 = {
				Id = 9883929637,
				Name = "Tige1111",
				AttackEffect = "Bubbles",
				AltArt = true,
				Bio = " SUPREME VICTORY. DUCK WIN. (Q2QcXk-wn_c)"
			},
			Nebula4329 = {
				Id = 82567138893100,
				Name = "Nebula4329",
				AttackEffect = "Bubbles",
				AltArt = true,
				PremiumArt = 791,
				Bio = "Help always comes to those in need."
			},
			["Wielder of the Ghostwalker-H25"] = {
				Id = 133813385566938,
				Name = "Wielder of the Ghostwalker",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Effect = {
					Name = "Sneak Attack",
					Description = "When this card is cast: Put a Green Stud and a Blue Stud into your Baseplate. Destroy all Red and Yellow cards in your Baseplate.",
					Type = "OnSummon",
					Power = {
						{
							"AddGenZone",
							{ "Green Stud-H25", 1 }
						},
						{
							"AddGenZone",
							{ "Blue Stud-H25", 1 }
						},
						{
							"GenZoneDiscard",
							{ "Red", 0 }
						},
						{
							"GenZoneDiscard",
							{ "Yellow", 0 }
						}
					},
					Target = "Ally"
				},
				AttackEffect = "Ghostwalker",
				Bio = "It is said that those who wield the ghostwalker are doomed to become ghosts themselves."
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Ghostwalker",
		EffectAnimation = "WielderGhostwalkerEffect",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3, Green = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Green Stud and a Blue Stud into your Baseplate. Destroy all Red and Yellow cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Red", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Yellow", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "Wait a second, \"Ghostwalker\"? Pfft, you can't walk on ghosts! Ghosts don't even EXIST."
	},
	["Wielder of the Darkheart"] = {
		Id = 7551012437,
		Name = "Wielder of the Darkheart",
		AltCards = {
			["Over-all Menace Fuchsia"] = {
				Id = 15717158075,
				Name = "Over-all Menace Fuchsia",
				AltArt = true,
				Bio = "\"The colour Red stands for my hatred for this game.<br/>The colour Green stands for my hatred for this game.<br/>this game sucks.\""
			},
			["Wielder of the Darkheart-V"] = {
				Id = 16283059333,
				Name = "Wielder of the Brokenheart",
				AttackEffect = "Darkheart",
				Bio = "Wash away the sorrow, all the stains of time..."
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Darkheart",
		EffectAnimation = "WielderDarkheartEffect",
		Color = "Green",
		Cost = { Neutral = 3, Red = 3, Green = 3 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Put a Red Stud and a Green Stud into your Baseplate. Destroy all Blue and Yellow cards in your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{
					"GenZoneDiscard",
					{ "Blue", 0 }
				},
				{
					"GenZoneDiscard",
					{ "Yellow", 0 }
				}
			},
			Target = "Ally"
		},
		Bio = "The most evil of the wielders, not because he kills everyone, but because he lets everyone live."
	},
	Diddleshot = {
		Id = 7021471414,
		Name = "Diddleshot",
		AltCards = {
			["Diddleshot-Hal"] = {
				Id = 7459717325,
				AttackEffect = "LaserBlue",
				Bio = "The moon landing was real, they just had to fake the footage."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "LaserRed",
		Color = "Blue",
		Cost = { Neutral = 2, Red = 1, Blue = 1 },
		Effect = {
			Name = "Protection",
			Description = "When this card is cast: Recur an allied non-token action card, except it's fading.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "NotToken_Action", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "The Final Frontier is no match for my horde of rabid astronauts!"
	},
	["Samurai Shock"] = {
		Id = 7017583695,
		Name = "Samurai Shock",
		AltCards = {
			["Samurai Shock-AN"] = {
				Id = 9352975717,
				AttackEffect = "Electric",
				Bio = "I've faced over a thousand enemies. You got a lot of time to make up for."
			},
			Oqqim = {
				Name = "P",
				Id = 133929582912812,
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 31,
				Commissioner = { 3246807653 },
				Bio = "\"Why is it that humans always look for more when happiness is already within their grasp?\""
			}
		},
		Health = 300,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Red = 1 },
		Charge = true,
		Effect = {
			Name = "Citrus Punch",
			Description = "Whenever this card attacks: Deal 50 damage to all enemy fighters.",
			Type = "OnAttack",
			Power = { { "Damage", 50 } },
			Target = "Opponent"
		},
		Bio = "If your samurai has been infected with these shocks, please refer it to your local veterinarian."
	},
	BelowNatural = {
		Id = 7021247282,
		Name = "BelowNatural",
		AltCards = {
			["pwolfe6682, Game Breaker"] = {
				Id = 8469690585,
				Name = "Vengeful_Sage, Game Breaker",
				AttackEffect = "MagicBlue",
				EffectAnimation = "LargeMagicGreenEffect",
				AltArt = true,
				Bio = "“You can attack with stayblue if you believe.”"
			},
			["BelowNatural-AN"] = {
				Id = 9352952727,
				Name = "Ship Raider",
				AttackEffect = "Slash",
				EffectAnimation = "MidMagicBlueEffect",
				Bio = "Born to raid, forced to fight."
			},
			["IcyTea-BDAY"] = {
				Id = 12361579681,
				Name = "IcyTea",
				AttackEffect = "IcePunch",
				EffectAnimation = "CakeArrow",
				Bio = "Born to game, forced to develop."
			},
			["Rumbiez and NT"] = {
				Id = 96007476612039,
				Name = "Rumbiez & NT",
				AttackEffect = "BrickThrow",
				EffectAnimation = "MidBrickThrowEffect",
				AltArt = true,
				PremiumArt = 487,
				Bio = "\"Hm. Fascinating\"<br/>...<br/>\"dude what are you doing\""
			},
			Maxcat7077 = {
				Id = 92890405995981,
				Name = "Maxcat7077",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 601,
				Bio = "\"winter horrorland plurral works\""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Arrow",
		EffectAnimation = "WeakenArrow",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1, Green = 1 },
		Effect = {
			Name = "Bloon Killer",
			Description = "When this card is cast: A target fighter loses 200 Power. Lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{ "Lock", 1 }
			},
			Target = "Single"
		},
		Bio = "Either it be tiny invaders or massive balloons, nothing is getting past this tower's defenses."
	},
	Frinigus = {
		Id = 8778684926,
		Name = "Frinigus",
		AltCards = {
			["Frinigus-Sun"] = {
				Id = 10283638524,
				AttackEffect = "Whirlpool",
				Bio = "This is SO worth the vacation days."
			},
			["n c"] = {
				Id = 71986969733198,
				Name = "n c",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 452,
				Bio = "c29ycnl1aGhoaGhoaWRr"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Give yourself a Green or Yellow action card.",
			Type = "OnSummon",
			Power = { {
				"RandomAdd",
				{
					"ROBAR",
					"Life Potion",
					"Meebling Infestation",
					"Medic Kit",
					"Oddman's Gambit",
					"Tom's Beans",
					"Awful Good",
					"Mass Epidemic",
					"Witch's True Brew",
					"Pancake Break",
					"Bowl of Greed",
					"Safe Chat",
					"Wrath of the Fried One",
					"Split Ego",
					"Jailbreak!",
					"Frenemy's Bargain",
					"ROBLOXian Reborn",
					"Thanksgiving Feast",
					"Call to Arms",
					"Hallows Treats",
					"Colonise",
					"Aeonite Progeny",
					"Search the City",
					"The Ultimate Trade"
				}
			} },
			Target = "Ally"
		},
		Bio = "\"People keep having those strange nightmares. My lab is overran with experiments on the issue.\""
	},
	Gasturas = {
		Id = 7021249953,
		Name = "Blue2Shroom",
		AltCards = {
			["Jecht08, The Chat Killer"] = {
				Id = 6362595242,
				Name = "Jecht08, The Chat Killer",
				AttackEffect = "Katana",
				AltArt = true,
				Bio = "Jokes over, you're dead!"
			},
			Blue2Puft = {
				Id = 8021955374,
				Name = "Blue2Puft",
				AttackEffect = "IcePunch",
				Bio = "Don't cross the streams."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Yellow = 4, Blue = 2 },
		Effect = {
			Name = "Spam",
			Description = "When this card is cast: Destroy all fighters with 750 or more Power.",
			Type = "OnSummon",
			Power = { {
				"CheckPower",
				{ 750, 999999 }
			} },
			Target = "All"
		},
		Bio = "Honestly, some people..."
	},
	Jimminus = {
		Id = 7550938998,
		Name = "Jimminus",
		AltCards = {
			["Jimminus-Sun"] = { Id = 7138321249, Bio = "Ha! I got an alt and you didn't, Yoshius!" },
			["Clowny The Dead Dog"] = {
				Id = 119340351783409,
				Name = "Clowny, the Dead Dog",
				AttackEffect = "Hammer",
				SummonAnimation = "ClownHonk",
				DeathAnimation = "ClownDeath",
				AltArt = true,
				Bio = "Stealing tears from your enemies? Pathetic, I steal their blood."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		EffectAnimation = "BubbleBreathEnemy",
		Color = "Blue",
		Cost = { Blue = 1, Neutral = 2 },
		Effect = {
			Name = "I only cri half of the time",
			Description = "When this card is cast: All enemy fighters lose 100 Power.",
			Type = "OnSummon",
			Power = { { "Weaken", 100, "Opponent" } },
			Target = "Opponent"
		},
		Bio = "NO FUN ALLOWED. >:("
	},
	Yoshius = {
		Id = 8664746198,
		Name = "Yoshius",
		AltCards = {
			Yoshi = {
				Id = 6521244805,
				AttackEffect = "TimeBomb",
				Bio = "Sorry Jimminus, but I have an alt art now! Eat that!"
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Uncommon",
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
	Person299 = {
		Id = 10243314737,
		Name = "Person299",
		AltCards = {
			["Person299-Hal"] = {
				Id = 10243342670,
				AttackEffect = "Tempest",
				Bio = "Going ssssssso ssssssssoon?"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2, Yellow = 2 },
		Effect = {
			Name = "Minigames.",
			Description = "When this card is cast: Deal damage to a target fighter equal to its Power.",
			Type = "OnSummon",
			Power = { { "Damage", "TargetPower", "Single" } },
			Target = "Ally"
		},
		Bio = "Out of all the usernames you could choose in 2008, why choose *Person299*? Most of the good usernames haven't been namesniped yet!"
	},
	Subata = {
		Id = 7017579489,
		Name = "Subata",
		AltCards = {
			["ECringeE123, the Astronaut"] = {
				Id = 6372663749,
				AttackEffect = "LaserRed",
				Name = "ECringeE123, the Astronaut",
				AltArt = true,
				Bio = "Can't wait to go to Banland."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MzhLaser",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 4 },
		Effect = {
			Name = "Mental Preparation",
			Description = "When this card is cast: Reset the stats of a target fighter.",
			Type = "OnSummon",
			Power = { { "Reset" } },
			Target = "Single"
		},
		Bio = "This beam is either set to KILL or RESTORE. Which is it gonna be?"
	},
	["Aurora Shaman, Marissa"] = {
		Id = 10281095642,
		Name = "Aurora Shaman, Marissa",
		AltCards = {
			["Aurora Shaman, Marissa-C"] = {
				Id = 10281082759,
				AttackEffect = "MagicBlue",
				Name = "Signfeld",
				Effect = {
					Name = "BLEU",
					Description = "When this card is cast: Your opponent summons the Festivus Pole, a 600/-200 fighter. (It heals fighters in combat.)",
					Type = "OnSummon",
					Power = { { "Summon", "ShamanMarissaToken-C" } },
					Target = "Opponent"
				},
				Bio = "What's the deal with Saint Nick?"
			},
			["Aurora Shaman, Marissa-V"] = {
				Id = 16305069534,
				AttackEffect = "MagicBlue",
				Name = "Trixie",
				Effect = {
					Name = "BLEU",
					Description = "When this card is cast: Your opponent summons Venon, an annoying rabbit that's a 600/-200 fighter. (It heals fighters in combat.)",
					Type = "OnSummon",
					Power = { { "Summon", "ShamanMarissaToken-V" } },
					Target = "Opponent"
				},
				Bio = "What a kitty!"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Green = 1, Blue = 2 },
		Summonant = "ShamanMarissaToken",
		CustomReminder = {
			["Negative Power"] = "Negative Power heals opposing fighters in combat."
		},
		Effect = {
			Name = "BLEU",
			Description = "When this card is cast: Your opponent summons the Totem of Aurora, a 600/-200 fighter with no abilities.",
			Type = "OnSummon",
			Power = { { "Summon", "ShamanMarissaToken" } },
			Target = "Opponent"
		},
		Bio = "OuO?"
	},
	ShamanMarissaToken = {
		Id = 7021246314,
		Name = "Totem of the Aurora",
		AltCards = {
			["ShamanMarissaToken-C"] = {
				Id = 8256326662,
				AttackEffect = "Divinity",
				Name = "Festivus Pole",
				Bio = "A Festivus for the rest of us!"
			},
			["ShamanMarissaToken-V"] = {
				Id = 16294482076,
				AttackEffect = "Divinity",
				Name = "Venon",
				Bio = "Cute bride!"
			}
		},
		Health = 600,
		Power = -200,
		Rarity = "Token",
		AttackEffect = "Ice",
		Token = true,
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "BLEU",
			Description = "",
			Type = "Null",
			Power = { { "Weaken", 100 } },
			Target = "Adjacent"
		},
		Bio = "-3-"
	},
	Luckymaxer = {
		Id = 10280528697,
		Name = "Luckymaxer",
		AltCards = {
			["Luckymaxer-Hal"] = {
				Name = "Fancy Arachnid",
				Id = 10280529363,
				AttackEffect = "Scratch",
				Addant = "Mechanical Spider-Hal",
				Bio = "This will trigger someone's Kapelaphobia."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 3, Yellow = 3 },
		CustomReminder = {
			["Mechanical Spiders"] = "A {W} 200/200, inert in all zones. When cast, it destroys the oldest card in your hand, then draws a card."
		},
		Addant = "Mechanical Spider",
		Effect = {
			Name = "Render",
			Description = "When this card is cast: Give yourself 4 200/200 Mechanical Spiders.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{ "Add", "Addant" },
				{ "Add", "Addant" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "He makes gear. He is why plungers are more Powerful than elegant, elvish swords."
	},
	["Mechanical Spider"] = {
		Id = 3471752910,
		Name = "Mechanical Spiders",
		AltCards = {
			["Mechanical Spider-Hal"] = {
				Name = "Classy Cluster",
				AttackEffect = "Scratch",
				Id = 7468269081,
				Effect = {
					Name = "Render",
					Description = "When this card is cast: Destroy the oldest card in your hand. Draw a card."
				},
				Bio = "Tonight, the rich shall feast. As is tradition."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Blue",
		TokenOmni = true,
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Render",
			Description = "When this card is cast: Destroy the oldest card in your hand. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Thematic Snake."
	},
	["Alpha Brick's Sealing"] = {
		Id = 5835878585,
		Name = "Alpha Brick's Sealing",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "Freeze",
		Archetype = "Era",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Return a target enemy fighter to its hand.\nGive yourself a copy of that card, except it's Blue. Convert all {R}{G}{Y} in the copy's cost to {W}.",
			Type = "OnSummon",
			Power = {
				{ "AddCopy" },
				{ "Return" }
			},
			MetaData_AddCopy = {
				ConvertColors = { Green = "Neutral", Red = "Neutral", Yellow = "Neutral" },
				Color = "Blue"
			},
			Target = "SingleEnemy"
		},
		Bio = "Acolytes begged dragons to purge the world. The broken and despaired begged nightmares to end it. It would have been easy for Shedletsky to give in to those demands, if not for the millions cheering him on to create something more. Something better."
	},
	LeetWizard = {
		Id = 7550943406,
		Name = "LeetWizard",
		AltCards = {
			["LeetWizard-Sun"] = {
				Id = 7317453287,
				CopyBodge = "LeetWizard-Sun",
				AttackEffect = "Whirlpool",
				Bio = "Falling out of a boat. WITH STYLE."
			},
			["LeetWizard-Masant"] = {
				Id = 7650364611,
				CopyBodge = "LeetWizard-Masant",
				AttackEffect = "Arcane",
				AltArt = true,
				Bio = "Peepeepoopoo?"
			},
			["LeetWizard-Offer"] = {
				Id = 14973989130,
				Name = "IcyTea, Blueborne",
				AttackEffect = "Arcane",
				ArtAnimation = "IcyTeaHalloween",
				EffectAnimation = "BlueborneEyeGlint",
				Commissioner = { 472923766 },
				PackDisplayOverride = "Hallow's Tale: Special Offer",
				Bio = "DIY FTW!"
			},
			roblox_user_4032604 = {
				Id = 125230682364227,
				CopyBodge = "roblox_user_4032604",
				AttackEffect = "MagicBlue",
				Bio = "Warning<br/>Our content monitors have determined that your behavior at Roblox has been in violation of our Terms of Use. <br/>Reviewed: 12/10/24, 01:31 PM EST<br/>Moderator Note: This name is not permitted on Roblox.<br/>Reason: Other<br/>Offensive Item: LeetWizard"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Red = 2 },
		Effect = {
			Name = "ðŸ¤”",
			Description = "When this card is cast: Give yourself 3 Blue or Red action cards, except they're inert in all zones.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" }
			},
			EffectInert = true,
			Target = "Self"
		},
		Bio = "Sometimes, Leet's arcane energy gives him unimaginable Power. Other times, it electrocutes his cat."
	},
	["LeetWizard Token"] = {
		Id = 2792979511,
		Name = "LeetWizard",
		AltCards = {
			["LeetWizard Token-Sun"] = {
				Id = 4784620134,
				AttackEffect = "Storm",
				CopyBodge = "LeetWizard Token-Sun",
				Bio = "Falling out of a boat. WITH STYLE.",
				Addant = "LeetWizard-Sun"
			},
			["LeetWizard Masantoken"] = {
				Id = 7650364611,
				CopyBodge = "LeetWizard Masantoken",
				AttackEffect = "Arcane",
				Bio = "Peepeepoopoo?",
				Addant = "LeetWizard-Masant"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Red = 2 },
		Fading = true,
		Addant = "LeetWizard",
		Effect = {
			Name = "ðŸ¤”",
			Description = "Whenever an enemy fighter dies: Give yourself a copy of this card, then destroy it.",
			Type = "OnEnemyDeath",
			Power = {
				{ "Add", "LeetWizard" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Sometimes, Leet's arcane energy gives him unimaginable Power. Other times, it just electrocutes his cat."
	},
	Owen0202 = {
		Id = 10281507637,
		Name = "Owen0202",
		AltCards = {
			Lilfofo01 = {
				Id = 10281478786,
				Name = "Lilfofo01",
				AttackEffect = "LaserBlue",
				AltArt = true,
				Bio = "Best weapon is always science."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "LaserGreen",
		Color = "Blue",
		Cost = { Green = 5, Blue = 5 },
		Effect = {
			Name = "Snipe!",
			Description = "When this card is cast: Summon a copy of a target fighter.",
			Type = "OnSummon",
			Power = { { "SummonCopy" } },
			Target = "Single"
		},
		Bio = "Seeing double?"
	},
	BO0M = {
		Id = 9964724028,
		Name = "BO0M",
		AltCards = {
			["WestDaw, Noob Destroyer"] = {
				Id = 9964725168,
				AttackEffect = "Jab",
				Name = "WestDaw, Noob Destroyer",
				AltArt = true,
				Bio = "Being under level 30? Git gud."
			}
		},
		Health = 350,
		Power = 350,
		SearchTerms = { "BOOM", "B00M" },
		Rarity = "Common",
		AttackEffect = "TimeBomb",
		SpecialEffectAnimation = "SmallTimeBombEffect",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Bio = "My boy, bombs are what all true warriors strive for!",
		Effect = {
			Name = "Boom",
			Description = "When this card is cast, if effects have made you lose life since your last end step: Destroy the oldest card in your opponent's hand. They lose 350 life.",
			Type = "OnSummon",
			Power = {
				{ "Inflict", 350 },
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" }
			},
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Me", 50, 999999999999999, "EffectLifeLoss" }
		}
	},
	stormmaster7722 = {
		Id = 9964893306,
		Name = "stormmaster7722",
		Health = 200,
		Power = 800,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 2, Neutral = 1 },
		Effect = {
			Name = "Lightning After the Thunder",
			Description = " When this card is cast: All players lose 200 life.",
			Type = "OnSummon",
			Power = { { "Inflict", 200 } },
			Target = "All"
		},
		Bio = "Sk00lz 4 nurds."
	},
	Cherie = {
		Id = 9964726151,
		Name = "Cherie",
		AltCards = {
			["Edge Gaming Tige1111"] = {
				Name = "Menace Tige1111",
				AttackEffect = "British",
				Id = 91258828932017,
				AltArt = true,
				Bio = "Join the Duck Cult today! We got ducks! And stop asking about the missing girl I didn’t do it!"
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Overload = true,
		Effect = {
			Name = "Double Bleeding",
			Description = "Whenever you lose life: This card gains 100 Power.",
			Type = "OnLifeLoss",
			Power = { { "Strengthen", 100 } },
			Target = "Self"
		},
		Bio = "MouseyCherie. She's cute, until you realize all of those animals have been trained to tear your limbs off and eat you alive."
	},
	Hodif = {
		Id = 9964809212,
		Name = "Hodif",
		AltCards = {
			["Hodif-AN"] = {
				Name = "Tricky Magician",
				AttackEffect = "MagicRed",
				Id = 9352999938,
				Bio = "I shall pull great things using my magic hat."
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Puts PixelFlame to shame",
			Description = "When this card is cast: All players lose 250 life.",
			Type = "OnSummon",
			Power = { { "Inflict", 250 } },
			Target = "All"
		},
		Bio = "Powerful fighter with his MLG-certified meal to keep him ready for more foes."
	},
	FuuTuu = {
		Id = 9964796796,
		Name = "FuuTuu",
		AltCards = {
			["1337Leaper"] = {
				Id = 16361234004,
				Name = "JoB0blax",
				AttackEffect = "Slash",
				Bio = "Remember that old tourney host 1337leaper? This is him now. He’s still alive and becoming a nurse. You should talk to him if you remember him."
			}
		},
		Power = 400,
		Health = 200,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Shartshooter",
			Description = "Whenever this card attacks: You lose 200 Life.",
			Type = "OnAttack",
			Power = { { "Cost", 200 } },
			Target = "Ally"
		},
		Bio = "A very fashionable sheriff with a Powerful revolver who often comes on and off on ROBLOX."
	},
	UHunterU = {
		Id = 9964922148,
		Name = "UHunterU",
		AltCards = {
			MattRyan07 = {
				Id = 109887798478874,
				Name = "MattRyan07",
				PremiumArt = 385,
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "You really thought that was coffee?<br/>I prefer apple juice."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Rabbit Season",
			Description = "Whenever this card attacks: All players lose 200 Life.\nWhenever you lose life: This card gains 100 Power.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Cost", 200 },
						{ "Inflict", 200 }
					},
					Target = "Opponent"
				},
				OnLifeLoss = {
					Power = { { "Strengthen", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "UHunt, ULive."
	},
	MagikalYawn = {
		Id = 9964830654,
		Name = "MagikalYawn",
		AltCards = {
			["MagikalYawn-C"] = {
				Name = "Smelty",
				Id = 17800202185,
				AttackEffect = "FirePunch",
				Bio = ""
			},
			Graves = {
				Id = 97844898371632,
				Name = "Graves",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 644,
				Bio = "prepare for a rave from the grave"
			}
		},
		Health = 850,
		Power = 850,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Overload = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, if you have more than 850 life: You lose 850 life.",
			Type = "OnSummon",
			Power = { { "Inflict", 850 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 851, 999999, "Life" }
		},
		Bio = "Let's... Get this show on the road, eh...? *Flop*"
	},
	chillthrill709 = {
		Id = 9965497484,
		Name = "chillthrill709",
		AltCards = {
			["chillthrill709-ArtV"] = {
				Id = 9964733860,
				AttackEffect = "Slash",
				Bio = "Maybe the real prize was the friends we made along the way. And also this giant chest of gold."
			},
			["chillthrill709-AN"] = {
				Id = 9345614164,
				Name = "Odin",
				AttackEffect = "Electric",
				Bio = "BY THUNDER BE PURGED!"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Double Life",
			Description = "When this card is cast, or whenever it attacks: You lose 100 life.",
			Ability = {
				OnSummon = {
					Power = { { "Cost", 100 } },
					Target = "Ally"
				},
				OnAttack = {
					Power = { { "Cost", 100 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Boats were meant to be built. And broken. And re-built, but this time with better stuff."
	},
	HashtagWatermelon = {
		Id = 9964799644,
		Name = "HashtagWatermelon",
		AltCards = {
			["HashtagWatermelon-C"] = {
				Id = 9965498621,
				AttackEffect = "MagicRed",
				Name = "HashtagMistletoe",
				Bio = "What if we\nLost life underneath the mistletoe\nhaha I would never...\nunless"
			}
		},
		Health = 250,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		Charge = true,
		Effect = {
			Name = "Charge",
			Description = "Whenever you lose life: Unlock this card.",
			Type = "OnLifeLoss",
			Power = { { "Unlock", 999 } },
			Target = "Self"
		},
		Bio = "Nom."
	},
	Nicolas1015 = {
		Id = 10243307549,
		Name = "Nicolas1015",
		Health = 900,
		Power = 900,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		WeakenImmune = true,
		DestroyImmune = true,
		Requirement = { "Board", "Ally", 0, 1 },
		Cost = { Green = 4, Neutral = 1 },
		Stealth = true,
		EffectVariable = 0,
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "Cast only if there's no allied fighters.\nWhenever you cast an allied fighter: This card gains half its Health and Power, then destroy that fighter.",
			Type = "OnAllySummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" }
				},
				{
					"AlterEV",
					{ "Divide", "Math", 2, "Nil" }
				},
				{
					"AlterEV",
					{ "StatRound", "Math", 50, "Nil" }
				},
				{ "Heal", "Variable", "Self" },
				{
					"AlterEV",
					{ "Set", "Target", "Power", "Nil" }
				},
				{
					"AlterEV",
					{ "Divide", "Math", 2, "Nil" }
				},
				{
					"AlterEV",
					{ "StatRound", "Math", 50, "Nil" }
				},
				{ "Strengthen", "Variable", "Self" },
				{ "Destroy", 30, "Aggressor" }
			},
			Target = "Aggressor"
		},
		Bio = "Probably richer than you."
	},
	["Dead Tree"] = {
		Id = 11974175088,
		Name = "Dead Tree",
		AltCards = {
			["Dead Tree-C"] = {
				Name = "Sainte",
				AttackEffect = "Jab",
				Id = 15176635662,
				Transformant = "Final Tree-C",
				Effect = {
					Description = "Whenever an effect targets this card: It gains 500 Health. Transform it into a GRUNCH. You gain a Green stud."
				},
				Bio = "\"alright there buddy you got two options here. You can either be a saint or you can be a grinch. Those are your two choices, choose wisely.\""
			},
			["Dead Free"] = {
				Id = 109235625287761,
				Name = "Dead Free",
				AttackEffect = "Jab",
				AltArt = true,
				Transformant = "Final Free",
				PremiumArt = 415,
				Effect = {
					Description = "Whenever an effect targets this card: It gains 500 Health. Transform it into a Final Free. You gain a Green stud."
				},
				Bio = "resistance is futile"
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1 },
		Archetype = "Tree",
		Transformant = "Final Tree",
		TargetImmune = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever an effect targets this card: It gains 500 Health. Transform it into a Final Tree. You gain {G}.",
			Type = "OnTarget",
			Power = {
				{ "Green", 1, "Ally" },
				{ "Heal", 500 },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Final Tree"] = {
		Id = 11974190384,
		Name = "Final Tree",
		AltCards = {
			["Final Tree-C"] = {
				Name = "GRUNCH",
				Id = 15176636096,
				Bio = "have I truley become a monster, or am I a GRUNCH to all these SAINTES?"
			},
			["Final Free"] = {
				Name = "Final Free",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 804,
				Id = 75318923202261,
				Bio = "resistance is futile"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 2 },
		Archetype = "Tree",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: Give yourself a red card that costs 2 or fewer total studs.",
			Type = "OnDeath",
			Power = { { "RandomAdd", "Red 2orLowerCost" } },
			Target = "Ally"
		},
		Bio = ""
	},
	["Satyr Nourisher"] = {
		Id = 8057680479,
		Name = "Satyr Nourisher",
		AltCards = {
			["Satyr Nourisher-C"] = {
				Id = 8256328850,
				AttackEffect = "Scratch",
				Name = "The Satyr Who Stole Christmas",
				Bio = "She gave it back, though."
			},
			["The Phonk Squad"] = {
				Id = 85853665235840,
				AttackEffect = "Scratch",
				PremiumArt = 815,
				Name = "The Phonk Squad",
				Bio = "Larpers by day, Criminals by night\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Red = 2, Green = 2 },
		Effect = {
			Name = "Render",
			Description = "Once each turn, whenever you cast another fighter: Swap the stats of a target allied fighter.",
			Type = "On|Other|AllySummon",
			Power = { { "Swap", 99999 } },
			Target = "SingleAlly",
			TurnTriggerLimit = 1
		},
		Bio = "In this time of great pain, the Satyrs tend to the last tree. Their revels burn it to smolders, only for it to rise again."
	},
	["Cauldron's Familiar"] = {
		Id = 10257867844,
		Name = "Cauldron's Familiar",
		AltCards = {
			["Ritualistic Recruiters"] = {
				Id = 77028936892646,
				Name = "Ritualistic Recruiters",
				AltArt = true,
				PremiumArt = 800,
				AttackEffect = "Flare",
				Bio = "If there is no Torch in your zones, create it. Move your Torch, wherever it is, to a target allied fighter, then the Torch gains 100 Power."
			}
		},
		Health = 450,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Red = 1, Green = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: A target fighter loses 150 Power. Swap the stats of all fighters, then swap them back.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 150, "Single" },
				{ "Swap", 99999 },
				{ "Swap", 99999 }
			},
			Target = "All"
		},
		Bio = "To a witch, talking to frogs is like talking to themself: The only way to get intelligent conversation."
	},
	Cenoglyphic = {
		Id = 7021256815,
		Name = "Cenoglyphic",
		AltCards = {
			Jam = {
				Id = 6372664206,
				Name = "Jam",
				AltArt = true,
				AttackEffect = "Slash",
				Bio = "Can everyday be Easter!?"
			},
			["Cenoglyphic-Hal"] = {
				Id = 7521075180,
				AttackEffect = "Gravity",
				Bio = "they call me sinoglyphic my guy"
			}
		},
		Health = 900,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Yellow = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Undead Rising",
			Description = "When this card is cast, or at the start of your turns: All fighters in your hand gain 100 Health and Power. Then select a card in your hand and shuffle it into your deck.",
			Ability = {
				OnAllyStart = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnSummon = {
					Power = { { "EVExactValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "HealHand", 100 },
						{ "StrengthenHand", 100 },
						{ "SpecificDiscard", 30, "CustomZoneTarget" }
					},
					Target = "Ally",
					EffectSpecificDiscardShuffle = true,
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "a card to shuffle into your deck.",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			},
			EffectSpecificDiscardShuffle = true
		},
		Bio = "they call me goatglyphic my guy"
	},
	["Golden Egg Beatings"] = {
		Id = 5229993894,
		Name = "Golden Egg Beatings",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2, Red = 2 },
		Summonant = "Bunny Token",
		IsFood = true,
		Effect = {
			Name = "Hide and Go Seek",
			Description = "Deal 300 damage to each fighter with the highest Health.\nRepeat this process twice, then summon a 200/100 Lagomorph, inert all zones.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300, "HighestHealth" },
				{ "Damage", 300, "HighestHealth" },
				{ "Damage", 300, "HighestHealth" },
				{ "Summon", "Summonant", "Ally" }
			},
			Target = "Single"
		},
		Bio = "When the Doges demanded tribute from Dragonkind, they responded with enthusiastic generousity."
	},
	["Bunny Token"] = {
		Id = 9417406054,
		Name = "Lagomorph",
		Health = 200,
		Power = 100,
		Rarity = "Token",
		Token = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Archetype = "Bunny",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "BLEU",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0, "Ally" } },
			Target = "Opponent"
		},
		Bio = "bnuuy."
	},
	Calirolls = {
		Id = 7021252729,
		Name = "Calirolls",
		AltCards = {
			CATirolls = {
				Id = 14169541783,
				Name = "CATirolls",
				AttackEffect = "Scratch",
				EffectAnimation = "EatCheez",
				Bio = "<b>\"Excuse me! He asked for no pickles.</b>\""
			}
		},
		Health = 650,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		EffectAnimation = "DrinkWitchesBrew",
		Effect = {
			Name = "Arkhaiomelisidonophunikheratos",
			Description = "When this card is cast: A target fighter gains 50 Power. Swap its stats.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 50 },
				{ "Swap", 100000 }
			},
			Target = "Single"
		},
		Bio = "Here's the tea."
	},
	["Awful Good"] = {
		Id = 5603037739,
		Name = "Witches' Brew",
		AltCards = {
			["Witches' Brew-AN"] = {
				Id = 9499114301,
				Name = "Awful Good",
				Bio = "Jolly terrible, my dear enemy!"
			},
			["Witches' Brew-Gecko-AN"] = {
				Id = 13697387507,
				Name = "Midas-Touched Meal",
				Rarity = "Token",
				Bio = "<i>That'll be 225,000 Robux.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		EffectAnimation = "DrinkWitchesBrew",
		Color = "Green",
		Cost = { Green = 1 },
		IsFood = true,
		Effect = {
			Name = "Awful Good",
			Description = "Swap the stats of a target fighter.",
			Type = "OnSummon",
			Power = { { "Swap", 100000, "Single" } },
			Target = "Single"
		},
		Bio = "One sip is enough to leave you spinnin'!"
	},
	["Angry Attack Squirrel"] = {
		Id = 97594359574633,
		Name = "Angry Attack Squirrels",
		AltCards = {
			BloxCardsChomik = {
				Id = 10396666364,
				Name = "Blox Cards Chomik",
				PlayTest = true,
				Bio = "You're early to the party. :^)",
				AddGenZoneant = "BloxCardsChomik"
			},
			["The Grass Mask"] = {
				Id = 106608035913188,
				Name = "The Grass Mask",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 542,
				Effect = {
					Name = "Pyrotechnics",
					Description = "Once each turn, whenever an allied fighter's stats would be swapped: Put a copy of this card into your baseplate first.",
					Type = "OnAllySwap",
					Power = { {
						"AddGenZone",
						{ "AddGenZoneant", 1 }
					} },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				Bio = "You know Christmas is coming when you've got your creepy Grass Mask.",
				AddGenZoneant = "The Grass Mask"
			}
		},
		Health = 800,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1 },
		AddGenZoneant = "Angry Attack Squirrel",
		Effect = {
			Name = "Pyrotechnics",
			Description = "Once each turn, whenever an allied fighter's stats would be swapped: Put a copy of this card into your baseplate first.",
			Type = "OnAllySwap",
			Power = { {
				"AddGenZone",
				{ "AddGenZoneant", 1 }
			} },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Don't make them go nuts."
	},
	["Vie, Battle Witch"] = {
		Id = 7027986738,
		Name = "Vie, Battle Witch",
		AltCards = {
			["Vie, Battle Witch-AN"] = {
				Id = 9362072267,
				AttackEffect = "MagicYellow",
				Name = "Mr. Swap",
				Bio = "A swapping fanatic, he lives life on the flipside."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		CustomReminder = {
			["Witches' Brew"] = "A {G} action. It swaps the stats of a target fighter."
		},
		Effect = {
			Name = "Pyrotechnics",
			Description = "Once each turn, whenever an allied fighter's stats would be swapped: Give yourself 'Witches' Brew' first.",
			Type = "OnAllySwap",
			Power = { { "Add", "Awful Good" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "An outcast from the council of warlocks, Vie conspires to bring them all to a dizzying end."
	},
	["Winchester Rotomo"] = {
		Id = 10243389029,
		Name = "Winchester Rotomo",
		AltCards = {
			["Winchester Rotomo-AN"] = {
				Id = 9570545437,
				Name = "Stormchaser's Gambit",
				AttackEffect = "Storm",
				Bio = "A storm is certainly dangerous... if you aren't prepared."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Addant = "Pumpkin Bomb",
		CustomReminder = {
			["Pumpkin Bomb"] = "An {R} action. It deals 250 damage to a target fighter."
		},
		Effect = {
			Name = "Twilight, the worst film ever",
			Description = "Once each turn, whenever an allied fighter's stats would be swapped: Give yourself a 'Pumpkin Bomb' first, except it's inert in all zones.",
			Type = "OnAllySwap",
			Power = { { "Add", "Addant" } },
			Target = "Ally",
			EffectInert = true,
			TurnTriggerLimit = 1
		},
		Bio = "DIE. 030"
	},
	__________ = {
		Id = 11068392909,
		Name = "__________",
		Health = 400,
		Power = 100,
		SearchTerms = "Underscore",
		AltCards = {
			Wekov = {
				Id = 5942335521,
				AttackEffect = "MagicGreen",
				Name = "Wekov",
				Bio = "Creator of Gyro, a terrifying deck, responsible for many card nerfs. Also known as Nukoe, 0L7, Azyte, Odas, Odasity and ClothingSpammer...did we forget any other banned account?"
			},
			["Mask Merchant"] = {
				Id = 7548620178,
				Name = "Mask Merchant",
				AttackEffect = "Slash",
				Bio = "You've met a terrible fate, haven't you?"
			},
			["Rayburn, Plushie Dealer"] = {
				Id = 92643892644725,
				Name = "Raybaker",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 258,
				Bio = "The Raybakery<br/>Rare Green Terrain<br/>{G}{G}{G}{Y}{Y}<br/>When this card is cast or at the start of your turns: Give yourself 2 Burnt Goods."
			},
			["Wekov-UGC"] = {
				PackDisplayOverride = "In-game Yellow and Purple Cat Ears UGC Purchase",
				Id = 109089012883867,
				PlayTest = true,
				AttackEffect = "Slash",
				Name = "fret not about thyne ears my fellow compatriot i will allocate space",
				Bio = "girl why you so ears??"
			}
		},
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Name = "Underscore is baaaaaaaaaaaaaaaaaaaaaaad",
			Description = "When this card is cast, if you have 800 or more life: You lose 750 Life. Give yourself an Overseer card, a Babylon card, a Doge card, and a Toy card.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 750 },
				{ "RandomAdd", "Overseer" },
				{ "RandomAdd", "Babylon" },
				{ "RandomAdd", "Doge" },
				{ "RandomAdd", "Toy" }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 800, 999999, "Life" }
		},
		Bio = "I can be anything you want, babe."
	},
	["Meeboid Champion"] = {
		Id = 7550965597,
		Name = "Linkmon99",
		CopyBodge = "Meeboid Champion",
		AltCards = {
			["Meeboid Champion-Sun"] = {
				Id = 13529719228,
				Name = "Fumiko",
				AttackEffect = "Slash",
				Bio = "Always. Skeptical."
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Green",
		WeakenImmune = true,
		DestroyImmune = true,
		Requirement = { "Board", "Ally", 0, 1 },
		Cost = { Red = 4, Neutral = 1 },
		Stealth = true,
		EffectVariable = 0,
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "Cast only if there's no allied fighters.\nWhenever you cast an allied fighter: This card gains half its Health and Power, then destroy that fighter.",
			Type = "OnAllySummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "Health", "Nil" }
				},
				{
					"AlterEV",
					{ "Divide", "Math", 2, "Nil" }
				},
				{
					"AlterEV",
					{ "StatRound", "Math", 50, "Nil" }
				},
				{ "Heal", "Variable", "Self" },
				{
					"AlterEV",
					{ "Set", "Target", "Power", "Nil" }
				},
				{
					"AlterEV",
					{ "Divide", "Math", 2, "Nil" }
				},
				{
					"AlterEV",
					{ "StatRound", "Math", 50, "Nil" }
				},
				{ "Strengthen", "Variable", "Self" },
				{ "Destroy", 30, "Aggressor" }
			},
			Target = "Aggressor"
		},
		Bio = "The richest ROBLOX user, second only to the official ROBLOX account. Should we take that into account?"
	},
	Quenty = {
		Id = 7017585654,
		Name = "Quenty",
		AltCards = {
			QuentyV2 = {
				Id = 6688038783,
				AltArt = true,
				AttackEffect = "Gun",
				Bio = "Whatever floats your goat, right?"
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "LinkedSword",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Once each turn, whenever an allied fighter's stats would be swapped: All enemy fighters lose 100 Power first.",
			Type = "OnAllySwap",
			Power = { { "Weaken", 100, "Opponent" } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Whatever floats your boat, right?"
	},
	["Magic Broom Black Cat"] = {
		Id = 10288723966,
		Name = "Magic Broom Black Cat",
		AltCards = {
			["Magic Broom Black Cat-Alt"] = {
				Id = 11607581641,
				Name = "Broom-chan & Black Cat",
				AttackEffect = "Tempest",
				Effect = {
					Description = "When this card is cast: Transform a target fighter into a Lovestruck.  (It loses its abilities.)",
					Type = "OnSummon",
					Power = { { "Transform", "Lovestruck", "Single" } },
					Target = "Single"
				},
				Bio = "Together since October 5th 2016."
			},
			["Wawa Cat"] = {
				Id = 10288750317,
				AltArt = true,
				Name = "Wawa Cat",
				AttackEffect = "Scratch",
				Effect = {
					Description = "When this card is cast: Transform a target fighter into a Egg Dog.  (It loses its abilities.)",
					Type = "OnSummon",
					Power = { { "Transform", "Egg Dog", "Single" } },
					Target = "Single"
				},
				Bio = "I have no patience for people who interrupt me when I'm busy doing nothing!"
			},
			["Nya, the Witch Cat"] = {
				Name = "Nya, the Witch Cat",
				AttackEffect = "Tempest",
				Id = 10288728103,
				Effect = {
					Name = "Me-OUCH!",
					Description = "When this card is cast: Transform a target fighter into a Confused Ghost.  (It loses its abilities.)",
					Type = "OnSummon",
					Power = { { "Transform", "Confused Ghost", "Single" } },
					Target = "Single"
				},
				Bio = "Metamorphosis!"
			}
		},
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
	APlayerOfGames = {
		Id = 10510585089,
		Name = "APlayerOfGames",
		AltCards = {
			["APlayerOfGames-AN"] = {
				Id = 18199518308,
				AttackEffect = "Slash",
				Name = "Grand Dad",
				Bio = "FLEENSTONEZ!?"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 4, Green = 4 },
		Overload = true,
		Effect = {
			Name = "Sneak Attack",
			Description = "Whenever you cast a fighter: This card gains Power equal to that fighter's Power.",
			Type = "OnAllySummon",
			Power = { { "AddFighterPower", 1 } },
			Target = "Aggressor"
		},
		Bio = "We are all this card."
	},
	TheShipArchitect = {
		Id = 10288767550,
		Name = "TheShipArchitect",
		AltCards = {
			["TheShipArchitect-E"] = {
				AttackEffect = "ModernRocket",
				Id = 8822687984,
				Bio = "Eggs are surpisingly cheap as a military unit."
			},
			["Wildy, Wasteland Wanderer"] = {
				Id = 15804641667,
				Name = "Wildy, Wasteland Wanderer",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 181,
				Bio = "Music soothes the soul, even in a wasteland."
			}
		},
		Health = 1400,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Red = 2, Green = 4 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever this card attacks: A target fighter gains 200 Power. Swap its stats. It gains 200 Power.",
			Type = "OnAttack",
			Power = {
				{ "Strengthen", 200 },
				{ "Swap", 999999 },
				{ "Strengthen", 200 }
			},
			Target = "Single"
		},
		Bio = "Time for a strategic TONK strike!"
	},
	Deadeye = {
		Id = 10288693677,
		Name = "Deadeye",
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3 },
		Token = true,
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "During your end step, if there's no other allied fighters: All enemy fighters lose 100 Power. Put a Green Stud into your Baseplate.",
			Type = "OnEnd",
			Power = {
				{ "Weaken", 100, "Opponent" },
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				}
			},
			EffectRequirement = { "Board", "Ally", 0, 2 },
			Target = "Ally"
		},
		Bio = "A lizard with the job of making sure Mother Nature's voice is heard. Tough job for someone without thick skin."
	},
	["Witch's True Brew"] = {
		Id = 10288655980,
		Name = "Witch's True Brew",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Forced Sip",
			Description = "All fighter cards in your hand gains 400 Health.\nYou can't cast fighters this turn.",
			Type = "OnSummon",
			Power = {
				{ "HealHand", 400 },
				{ "BypassSummon" }
			},
			Target = "Ally"
		},
		Bio = "To whomever drinks this potion, prepare for some trouble; only the mightiest of men will have their strength doubled!~"
	},
	Anaminus = {
		Id = 10288664338,
		Name = "Anaminus",
		AltCards = {
			["Anaminus-Hal"] = {
				Id = 10288666515,
				AttackEffect = "British",
				Bio = "We're all the same, they're just a bit ahead of the curve is all."
			},
			["Anaminus-Banner"] = {
				Id = 13488251618,
				Name = "Newman Jr. and Newman Sr.",
				AttackEffect = "Jab",
				Bio = "Despite her affinity for using baseball bats as a weapon, McKayla never actually played baseball. Having a base in a rural farmer village would be difficult, y'know?"
			}
		},
		Health = 750,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3, Red = 2 },
		Effect = {
			Name = "Psychopath",
			Description = "Whenever this fighter destroys another: It gains 200 Health. Your opponent loses 200 life. You gain 200 life and 2{R}.",
			Type = "OnDestroy",
			Power = {
				{ "Heal", 200 },
				{ "Red", 2, "Ally" },
				{ "Inflict", 200, "Opponent" },
				{ "Cost", -200 }
			},
			Target = "Self"
		},
		Bio = "The double hat glitch was only the beginning. Now you."
	},
	inechi = {
		Id = 5983806120,
		Name = "inechi",
		AltCards = {
			["inechi-ArtV"] = {
				Id = 8475238014,
				AltArt = true,
				AttackEffect = "DoomStorm",
				Bio = "Fear is only as deep as the mind allows. So what if you lose yours?"
			},
			["inechi-AN"] = {
				Id = 9391622554,
				Name = "Deliverance",
				AttackEffect = "Gravity",
				Effect = {
					Name = "All is fair in love and duels.",
					Description = "During your end step, if your opponent has 8 cards in their hand: Give them 2 'Nightmares.' They draw 2 cards.",
					Type = "OnEnd",
					EffectRequirement = { "Playertable", "Him", 8, 9999, "Hand" },
					Power = {
						{ "Add", "Nightmare-AN" },
						{ "Add", "Nightmare-AN" },
						{ "Draw", 2 }
					},
					Target = "Opponent"
				},
				Bio = " If something were to be, when wouldn't it be?"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		AttackEffect = "MagicBlue",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		CustomReminder = {
			Nightmare = "A free undiscardable Nightmare action. Each player draws a card when it's cast."
		},
		Effect = {
			Name = "All is fair in love and duels.",
			Description = "During your end step, if your opponent has 8 cards in hand: Give them 2 'Nightmares.' They draw 2 cards.",
			Type = "OnEnd",
			EffectRequirement = { "Playertable", "Him", 8, 9999, "Hand" },
			Power = {
				{ "Add", "Nightmare" },
				{ "Add", "Nightmare" },
				{ "Draw", 2 }
			},
			Target = "Opponent"
		},
		Bio = "An eccentric girl with an odd obsession for squids and lovecraftian horror. She is also a huge supporter towards Developers of Roblox."
	},
	JavierCollin88Poppin = {
		Id = 7550962042,
		Name = "JavierCollin88Poppin",
		AltCards = {
			["JavierCollin88Poppin-E"] = {
				Id = 8735211153,
				Name = "Evilwick",
				AttackEffect = "Arcane",
				Bio = "how eggcellent of you to join us. You've been so precarious with your adventuring, it's almost as though you've been walking on eggshells this whole time."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
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
	Crazyblox = {
		Id = 7021466351,
		Name = "Crazyblox",
		AltCards = {
			["Crazyblox-E"] = {
				Id = 8781552186,
				Name = "Aymor",
				Transformant = "CrazybloxStance2-E",
				AttackEffect = "Scratch",
				Bio = "For such a small bird, its amazing how good it is at hiding eggs."
			},
			["Free, The Guitarist"] = {
				Id = 9307660491,
				Name = "Free, The Guitarist",
				AttackEffect = "Slash",
				AltArt = true,
				Transformant = "Free, The GuitaristStance2",
				Bio = "\"Let's get this over with.\""
			},
			["The Conflict"] = {
				Id = 10936417042,
				Name = "The Conflict",
				AttackEffect = "Gravity",
				AltArt = true,
				Transformant = "The ConflictStance2",
				Bio = "Be sober-minded, be watchful. Your adversary, the devil, prows like a roaring lion."
			},
			["Crazyblox-AN"] = {
				Id = 13771261373,
				Name = "Keith Brando",
				AttackEffect = "Katana",
				Transformant = "CrazybloxStance2-AN",
				Bio = "<b>MUDA MUDA MUDA!!</b>"
			},
			["Tender Mayo"] = {
				Id = 15941929563,
				Name = "Tender Mayo",
				AttackEffect = "Whirlpool",
				AltArt = true,
				Bio = "\"LOOK UP FROM THE ABYSS! I AM THE STAR!\"",
				Transformant = "Tender MayoStance2"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Charge = true,
		SummonAnimation = "SummonSlide",
		Rank = 6,
		Transformant = "CrazybloxStance2",
		Cost = { Blue = 4, Red = 4 },
		Effect = {
			Name = "ROLLING AROUND AT THE SPEED OF SOUND",
			Description = "Whenever an action is cast: This card gains 100 Health. Transform this card, or untransform it if it's transformed.\nWhenever this card attacks: It gains 300 Power. If it's transformed, a target fighter loses 300 Power instead.",
			Ability = {
				OnAttack = {
					Power = { { "Strengthen", 300, "Self" } },
					Target = "Ally"
				},
				OnCast = {
					Power = {
						{ "Heal", 100 },
						{ "Transform", "Transformant" }
					},
					Target = "Self"
				}
			},
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "Live on the coast, you die to floods. Live in the mountains, you die to rockslides. You can't win, you know."
	},
	CrazybloxStance2 = {
		Id = 7204562474,
		Name = "Crazyblox (Stance 2)",
		AltCards = {
			["CrazybloxStance2-E"] = {
				Id = 8781552763,
				Name = "Aymegg",
				AttackEffect = "Scratch",
				Transformant = "Crazyblox-E",
				Bio = "For such a massive egg, its amazing how good it is at destroying egg hunters."
			},
			["Free, The GuitaristStance2"] = {
				Id = 9307660887,
				Name = "Free, The Guitarist",
				AttackEffect = "Slash",
				Transformant = "Free, The Guitarist",
				Bio = "\"ALRIGHT YOU WONDERFUL AND BEAUTIFUL PEOPLE, TODAY I'M GONNA BE PLAYING MY NEW CHART TOPPING HIT - 'OZONE LAYER'!! LET'S MAKE SOME NOISE!!!!\""
			},
			["The ConflictStance2"] = {
				Id = 10936418305,
				Name = "The Enigma",
				AttackEffect = "Gravity",
				Transformant = "The Conflict",
				Bio = "uoıl ƃuıɹɐoɹ ɐ ǝʞıl slʍoɹd lıʌǝp ǝɥʇ ʎɹɐsɹǝʌpɐ ɹno⅄ ˙lnɟɥɔʇɐʍ ǝq 'pǝpuıɯ-ɹǝqos ǝ𐐒"
			},
			["CrazybloxStance2-AN"] = {
				Id = 13771259613,
				Name = "Keith",
				AttackEffect = "Inferno",
				Transformant = "Crazyblox-AN",
				Bio = "\t\t\t\t<i>I suppose this is Akuma's final insult: a story without a proper ending.</i>\n\t\t\t\t<i>If I am to be trapped in this purgatory, I shall drag you down to Hell with me.</i> \t\n\t\t\t\t"
			},
			["Tender MayoStance2"] = {
				Id = 15941929563,
				Name = "Tender Mayo",
				AttackEffect = "Whirlpool",
				Bio = "\"LOOK UP FROM THE ABYSS! I AM THE STAR!\"",
				Transformant = "Tender Mayo"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Red",
		Charge = true,
		Transformant = "Crazyblox",
		Cost = { Blue = 4, Red = 4 },
		Effect = {
			Name = "ROLLING AROUND AT THE SPEED OF SOUND",
			Description = "Whenever a player casts an action: This card gains 100 Health. Transform this card, or untransform it if it's transformed.\nWhenever this card attacks: It instead gains 300 Power. If it's transformed, a target fighter loses 300 Power instead.",
			Ability = {
				OnAttack = {
					Power = { { "Weaken", 300 } },
					Target = "Single"
				},
				OnCast = {
					Power = {
						{ "Heal", 100 },
						{ "Transform", "Transformant" }
					},
					Target = "Self"
				}
			},
			EffectTransformPreserveRarity = true
		},
		Bio = "Live on the coast, you die to floods. Live in the mountains, you die to rockslides. You can't win, you know."
	},
	iTrapped = {
		Id = 7550935351,
		Name = "iTrapped",
		AltCards = {
			["GRAND CLAUS"] = {
				Id = 79705300119386,
				Name = "Krampus",
				AttackEffect = "Flare",
				Bio = "The Grief Bringer."
			},
			GrandDadPixel = { Id = 7715837045, CopyBodge = "GrandDadPixel", Bio = "PIXEEEEEL?!" }
		},
		Health = 777,
		Power = 777,
		Rarity = "Rare",
		AttackEffect = "Darkheart",
		Color = "Red",
		Cost = { Neutral = 1, Yellow = 3, Red = 3 },
		Effect = {
			Name = "Subversion",
			Description = "When this card is cast: Round down the stats of all fighters to a multiple of 150.",
			Type = "OnSummon",
			Power = {
				{ "SetHealthModulo", 150, "All" },
				{ "SetPowerModulo", 150, "All" }
			},
			Target = "Ally"
		},
		Bio = "APRIL FEWLS"
	},
	Rinicye = {
		Id = 11973556777,
		Name = "Rinicye",
		AltCards = {
			["Rinicye-E"] = {
				Id = 10243137892,
				AttackEffect = "MagicRed",
				Bio = "Master egg colleteur."
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 3, Red = 3 },
		Effect = {
			Name = "Char",
			Description = "When this card is cast: Deal 200 damage to a target fighter, then swap its stats.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{ "Swap", 100000 }
			},
			Target = "Single"
		},
		Bio = "\"Cye later acolytes!\""
	},
	Julez_X = {
		Id = 17760526812,
		Name = "Julez_X",
		AltCards = {
			["Brendan03red, Skywhale Tamer"] = {
				Id = 6309937640,
				Name = "Brendan03red, Skywhale Tamer",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "If I am to go the way of all flesh, I will make sure my time is not wasted."
			},
			["Scoot the Wiz"] = {
				Id = 10224491608,
				Name = "Scoot the Wiz",
				AttackEffect = "Jab",
				AltArt = true,
				Effect = {
					Name = "Gilgamesh",
					Description = "Twice each turn, whenever you lose life: Give yourself a Classic Scoot Moment.",
					Type = "OnLifeLoss",
					Power = { {
						"RandomAdd",
						{
							"A Single Corndog",
							"Not Rex",
							"Tiny Robot! Whiplash",
							"ThrowCrash",
							"John 08"
						}
					} },
					Target = "Ally",
					TurnTriggerLimit = 2
				},
				Bio = "\"Hey all, Scoot here. I can't believe this game exists.\" cuts to BC gameplay \"Hey, if your game had gameplay like this, I'd believe it wouldn't exist either but here we are!\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 2, Yellow = 2 },
		Effect = {
			Name = "Gilgamesh",
			Description = "Twice each turn, whenever you lose life: Give yourself a Classic Roblox Tool card.",
			Type = "OnLifeLoss",
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
			Target = "Ally",
			TurnTriggerLimit = 2
		},
		Bio = "Have you ever noticed that some bios have no relevance at all to the cards they're on?"
	},
	Fractality = {
		Id = 10243098592,
		Name = "Fractality",
		AltCards = {
			["Fractality-C"] = {
				Id = 10243100821,
				Name = "Merrywrath",
				AttackEffect = "Slash",
				Bio = "The Rageborne would have developed their own solstice festivals if they were allowed to live."
			},
			["Fractality-AN"] = {
				Id = 9400947376,
				Name = "Pikucho_de",
				AttackEffect = "Flare",
				Bio = "Oh the misery."
			},
			["Triple Trio"] = {
				Id = 11971623038,
				Name = "Triple Trio",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Keep gaming."
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		EffectAnimation = "SelfFlare",
		Color = "Red",
		Cost = { Red = 3, Green = 2 },
		Effect = {
			Name = "Thug Life",
			Description = "Whenever this card's stats are swapped: All allied fighters gain 200 Power.",
			Type = "OnSwap",
			Power = { { "Strengthen", 200 } },
			Target = "Ally"
		},
		Bio = "Creator of Chaos Washers. First-person mode is highly recommended."
	},
	Deathaman211 = {
		Id = 9561453294,
		Name = "Deathaman211",
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Yellow = 2 },
		Effect = {
			Name = "Sudden Profit",
			Description = "Whenever this card attacks: A target fighter generates thrice.",
			Type = "OnAttack",
			Power = { { "Generate", 3 } },
			Target = "Single"
		},
		Bio = "Puts MegaSmiley to shame... Somehow."
	},
	iiMasant = {
		Id = 10242932669,
		Name = "Iun_r",
		AltCards = {
			iiMasantv2 = {
				Id = 9098459479,
				AltArt = true,
				AttackEffect = "Arcane",
				Bio = "The Masant that outmasanted Masant himself."
			},
			["Iun_r-AN"] = {
				Id = 9391597840,
				AttackEffect = "Gravity",
				Bio = "The Iun_r that outIun_red Iun_r himself."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Lun_r",
			Description = "During your end step: Give yourself an alternate-art card. Remove {W}{R}{G}{B}{Y} from its cost.",
			Type = "OnEnd",
			Power = {
				{ "RandomAdd", "Altcard", "Ally" },
				{
					"IncreaseCost",
					{ -1, "Neutral", "Nil" },
					"AlliedAddedCard"
				},
				{
					"IncreaseCost",
					{ -1, "Red", "Nil" },
					"AlliedAddedCard"
				},
				{
					"IncreaseCost",
					{ -1, "Green", "Nil" },
					"AlliedAddedCard"
				},
				{
					"IncreaseCost",
					{ -1, "Blue", "Nil" },
					"AlliedAddedCard"
				},
				{
					"IncreaseCost",
					{ -1, "Yellow", "Nil" },
					"AlliedAddedCard"
				}
			},
			Target = "Ally"
		},
		Bio = "The aife that outaifed aife herself."
	},
	["Unc, Uncorrupted"] = {
		Id = 4899465477,
		Name = "Unc, Uncorrupted",
		AltCards = {
			CreativeName123 = {
				Id = 3471770448,
				CopyBodge = "CreativeName123",
				AttackEffect = "MagicYellow",
				Bio = "彼は確かにある。"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		Effect = {
			Name = "UNCorrupted",
			Description = "Whenever this card attacks: Draw 2 cards, then destroy the oldest card in your hand.",
			Type = "OnAttack",
			Power = {
				{ "Draw", 2 },
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" }
			},
			Target = "Ally"
		},
		Bio = "Despite common belief, axes are quite effective against nightmares."
	},
	["Redrune Raider"] = {
		Id = 11973200486,
		Name = "Redrune Raiders",
		AltCards = {
			["Degenerate Duo"] = {
				Name = "Degenerate Duo",
				AttackEffect = "MagicRed",
				Id = 10243000192,
				AltArt = true,
				EffectAnimation = "FlameBreathEnemy",
				Bio = "They don't exactly cooperate, but it's the thought that counts."
			},
			["Deepsea Crab Monster"] = {
				Name = "Deepsea Crab Monster",
				AttackEffect = "Bubbles",
				Id = 10243001439,
				AltArt = true,
				EffectAnimation = "BubbleBreathEnemy",
				Bio = "A terrifying end to the fragile souls of the drowned. They didn't block, parry, or dodge."
			},
			["Texas the Omertosa"] = {
				Id = 89793393677025,
				Name = "Texas the Omertosa",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 501,
				Bio = "\"But you can tell there's a mood about her, and its fateful name is Anger.\" - FervidRose; Crimson Bloom"
			},
			Crimson = {
				Id = 105267195599246,
				Name = "Crimson",
				AttackEffect = "Axe",
				AltArt = true,
				PremiumArt = 648,
				EffectAnimation = "AxeStrike",
				Bio = "The wielder of the fire axe does not concern himself with the card border."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Flare",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
		IsLegendaryDragon = true,
		Cost = { Red = 4, Neutral = 2 },
		Effect = {
			Name = "Raging Rage",
			Description = "When this card is cast: Deal 200 damage to a target fighter and all enemy fighters.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200, "Single" },
				{ "Damage", 200 }
			},
			Target = "Opponent"
		},
		Bio = "Power comes within the fittest."
	},
	Hoshpup = {
		Id = 10242917697,
		Name = "Hoshpup",
		AltCards = {
			["Hoshpup-Hal"] = {
				Id = 10242918733,
				AttackEffect = "Jab",
				Bio = "We will never know what his costume is."
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 4, Red = 4 },
		Overload = true,
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "We will never know what he certainly is."
	},
	Alkalola = {
		Id = 7021241894,
		Name = "Alkalola",
		AltCards = {
			["Alkalola-E"] = {
				Id = 8735211805,
				Name = "Eggwick",
				AttackEffect = "Divinity",
				Bio = "I know this sounds like a lot, but don't worry, Saving the Eggverse is just another adventure."
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Red",
		Charge = true,
		Cost = { Yellow = 3 },
		AddBlock = true,
		Effect = {
			Name = "Overgrown",
			Description = "Whenever this card attacks: Destroy all fighters with 150 or less Health. Deal 100 damage to all fighters.",
			Type = "OnAttack",
			Power = {
				{
					"CheckHealth",
					{ 0, 150 }
				},
				{ "Damage", 100 }
			},
			Target = "All"
		},
		Bio = "Bam!"
	},
	amanda = {
		Id = 6709427695,
		Name = "amanda",
		AltCards = {
			Pinnyqueen = {
				Name = "Pinnyqueen",
				AttackEffect = "MagicRed",
				Id = 7169268118,
				AltArt = true,
				Bio = "云想衣裳花想容，春风拂面露华浓."
			}
		},
		Health = 100,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: All enemy fighters lose 150 Power. All allied fighters gain 150 Power.",
			Type = "OnDeath",
			Power = {
				{ "Weaken", 150, "Opponent" },
				{ "Strengthen", 150 }
			},
			Target = "Ally"
		},
		Bio = "\"For a taste of my infinite wisdom, you must be deliberate.\""
	},
	YotamTiti = {
		Id = 10232060867,
		Name = "YotamTiti",
		AltCards = {
			Mathyldis = {
				Id = 5603009166,
				Name = "Mathyldis",
				AttackEffect = "Slash",
				CopyBodge = "Mathyldis",
				AltArt = true,
				Bio = "Like the stars chase the sun. Over the glowing hill, I will conquer."
			},
			Lucina_Lowell = {
				Id = 7094707104,
				Name = "TBOI, The Scourge of Funny",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "He lost his will to be funny from trying to transmutate the worlds largest Skylanders: Spyro's Adventure Warnado figurine."
			},
			["ADead & Dairing, Slice of Life"] = {
				Id = 13697392683,
				Name = "ADead & Dairing, Slice of Life",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 47,
				Commissioner = { 2447703770, 17848325 },
				Bio = "<i>Another one bites the crust.</i>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Red = 2, Yellow = 3 },
		Effect = {
			Name = "You may sloth me, Planet Belligerance.",
			Description = "Whenever you cast a fighter: It gains 100 Power. You gain {R} and lose 200 life.",
			Type = "OnAllySummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Red", 1, "Ally" },
				{ "Cost", 200 }
			},
			Target = "Aggressor"
		},
		Bio = "Cows are just plain evil."
	},
	["Bowl of Greed"] = {
		Id = 109560747186869,
		Name = "Bowl of Greed",
		AltCards = {
			["Bowl of GreedV2"] = {
				Id = 10279392167,
				CopyBodge = "Bowl of GreedV2",
				AltArt = true,
				Bio = "BUT WHAT DOES IT DO?"
			},
			["Vase of Greed"] = {
				Id = 10279395762,
				Name = "Vase of Greed",
				AltArt = true,
				Bio = "What does it do again?"
			},
			["Bowl of Greed-Val"] = {
				Id = 10279393953,
				Name = "Bowl of Candy Grams",
				CopyBodge = "Bowl of Greed-Val",
				Bio = "Legend says that this bowl grants you delicious candy. Yummy?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		EffectAnimation = "BowlBuff",
		DeathAnimation = "BowlDeath",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2 },
		Archetype = "Bowl",
		Effect = {
			Name = "Bowl of Greed",
			Description = "Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2, "Ally" } },
			Target = "Ally"
		},
		Bio = "<br/>The bowl reacts poorly when treasures are taken outright, yet shows no response to my handling at all. The \"Bowl of Greed\".<br/><br/><b>\"Once set in motion, it does not stop...\"</b><br/>- Artifact Antiquarian"
	},
	Toxic = {
		Id = 11865481442,
		Name = "Toxic",
		Power = 450,
		Health = 450,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Red = 2, Green = 2, Blue = 2 },
		AltCards = {
			["Toxic-ArtV"] = {
				Id = 10279379806,
				CopyBodge = "Toxic-ArtV",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "Use as much color you can!"
			},
			["Wind Warrior Keeler1"] = {
				Id = 10279378667,
				Name = "Wind Warrior Keeler1",
				AttackEffect = "Electric",
				AltArt = true,
				Bio = "As free as the sky."
			},
			["Toxic-AN"] = {
				Id = 9829927444,
				Name = "Dragon Cultist",
				AttackEffect = "Divinity",
				Bio = "What remains of an old following merely stands as a husk of its former self, having few members. However, they have fully mastered their art of dragon calling."
			},
			["Sly One, Tom"] = {
				Id = 10279235476,
				AltArt = true,
				Name = "Sly One, Tom",
				AttackEffect = "Slash",
				Bio = "Sometimes to win you must use dirty tricks."
			}
		},
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast, if it's the only allied fighter in play: Draw 3 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 3 } },
			Target = "Ally",
			EffectRequirement = { "Board", "Ally", 1, 2 }
		},
		Bio = "Britney Spears left her alone."
	},
	Latchie = {
		Id = 17790665914,
		Name = "Latchie",
		AltCards = {
			["Latchie-Sun"] = {
				Id = 17790669939,
				CopyBodge = "Latchie-Sun",
				Bio = "A Healthy breakfast to get you through the day consists of eggs, bacon, toast, and twenty cups of pirate juice."
			},
			["Softlock Sorcerer Flufflefunz"] = {
				Id = 10279323660,
				Name = "Softlock Sorcerer Flufflefunz",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "Goodbye secret files, when I'm gone all this information will die."
			},
			["Latchie-AltV"] = { Id = 12654801319, AltArt = true, PremiumArt = 4 }
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Name = "Spider Venom",
			Description = "When this card is cast: Put a Green Stud into your Baseplate.",
			Type = "OnSummon",
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
		Bio = "Wonder tale of the seven seas, she found her pet spider and now it feasts on any hostile foe!"
	},
	["Undead Teddy"] = {
		Id = 7027990925,
		Name = "Undead Teddy",
		AltCards = {
			["Undead Teddy-AntArtist"] = {
				Id = 3359991451,
				Effect = {
					Name = "TEDDY",
					Type = "OnDeath",
					Power = {
						{ "Summon", "Teddy1-AntArtist" },
						{ "Cost", 100 },
						{ "Damage", 9999, "Self" }
					},
					Target = "Ally"
				},
				Bio = "Unpopular opinion: Innovative arts are better than art box arts."
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "Undead Rising",
			Description = "3 Charges.\nWhen this card dies: Summon a copy of it with 1 fewer charge. You lose 100 life.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Teddy1" },
				{ "Cost", 100 },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Some say it was a mistake..."
	},
	Teddy1 = {
		Id = 7027989652,
		Name = "Undead Teddy",
		AltCards = {
			["Teddy1-AntArtist"] = {
				Id = 3359991451,
				Effect = {
					Name = "TEDDY",
					Type = "OnDeath",
					Power = {
						{ "Summon", "Teddy2-AntArtist" },
						{ "Cost", 100 },
						{ "Damage", 9999, "Self" }
					},
					Target = "Ally"
				},
				Bio = "Unpopular opinion: Undead Teddy is overrated."
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "Undead Rising",
			Description = "2 Charges.\nWhen this card dies: Summon a copy of it with 1 fewer charge. You lose 100 life.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Teddy2" },
				{ "Cost", 100 },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Some say it was an experiment gone wrong..."
	},
	Teddy2 = {
		Id = 7027988788,
		Name = "Undead Teddy",
		AltCards = {
			["Teddy2-AntArtist"] = {
				Id = 3359991451,
				Effect = {
					Name = "TEDDY",
					Type = "OnDeath",
					Power = {
						{ "Summon", "Teddy3-AntArtist" },
						{ "Cost", 100 },
						{ "Damage", 9999, "Self" }
					},
					Target = "Ally"
				},
				Bio = "Unpopular opinion: Drawn arts are better than Roblox arts done in Blender."
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "Undead Rising",
			Description = "1 Charge.\nWhen this card dies: Summon a copy of it without this ability.\nYou lose 100 life.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Teddy3" },
				{ "Cost", 100 },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "But despite what they say..."
	},
	Teddy3 = {
		Id = 7027987939,
		Name = "Undead Teddy",
		AltCards = {
			["Teddy3-AntArtist"] = {
				Id = 3359991451,
				Bio = "Unpopular opinion: Actual artists that can draw are obviously the best artists in Blox Cards's art department."
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		Charge = true,
		Effect = {
			Name = "Undead Rising",
			Description = "0 Charges.\nWhen this card dies: You lose 100 life.",
			Type = "OnDeath",
			Power = { { "Cost", 100 } },
			Target = "Ally"
		},
		Bio = "They will never know the true horror that went into making this..."
	},
	StaySpy = {
		Id = 7017580482,
		Name = "StaySpy",
		AltCards = {
			ITStheGreatStaySpy = {
				Id = 7945346010,
				Name = "ITStheGreat17",
				AttackEffect = "Jab",
				AltArt = true,
				CopyBodge = "ITStheGreatStaySpy",
				Bio = "“Hmm, let me think about this.”"
			}
		},
		Health = 100,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1, Blue = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, if you have 8 or more cards in your hand: It gains 900 Health.",
			Type = "OnSummon",
			Power = { { "Heal", 900 } },
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 8, 9999, "Hand" }
		},
		Bio = "With these tools in hand, I can make cybersuits for everyone. No one has to be left behind."
	},
	Lilly_S = {
		Id = 7550963761,
		Name = "Lilly_S",
		AltCards = {
			NachoSenne = {
				Id = 5698337277,
				Name = "NachoSenne",
				CopyBodge = "NachoSenne",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "Personally chosen by IcyTea, as his bodyguard and Twitch moderator."
			},
			["Magical Girl Histor"] = {
				Id = 17251038169,
				Name = "Desmond Lentran",
				CopyBodge = "Magical Girl Histor",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "The strongest."
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 6, Neutral = 2 },
		Effect = {
			Name = "GO!",
			Description = "Whenever you lose life: All allied fighters gain 100 Health and Power.\nDuring your end step: Deal 200 damage to all allied fighters and they lose 200 Power.",
			Ability = {
				OnLifeLoss = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "Damage", 200 },
						{ "Weaken", 200 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "'Vortex Security respects her, please do not insult her. Yes, IcyTea learned it the hard way.'"
	},
	Lopous = {
		Id = 7550967880,
		Name = "Lopous",
		AltCards = {
			["Lopous-E"] = {
				Id = 16562311070,
				Name = "Bunny Magician",
				AttackEffect = "Scratch",
				Bio = "Wanna see a magic trick? I can pull a human out of a hat!"
			},
			["Lopous-Sun"] = {
				Id = 17346077540,
				Name = "Creeks Kuomo",
				AttackEffect = "Punch",
				Bio = "After releasing their hit album 'Ueezer', Creeks Kuomo and his band are currently working on their new album, titled 'Ueezer'."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Double Bleeding",
			Description = "Whenever you lose life: This card gains 50 Health for each time this ability has triggered this turn.",
			Type = "OnLifeLoss",
			Ability = {
				OnLifeLoss = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 50, "Nil" }
						},
						{ "Heal", "Variable" }
					},
					Target = "Self"
				},
				OnStart = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 0, "Nil" }
					} },
					Target = "Self"
				}
			},
			Target = "Ally"
		},
		Bio = "It's never Lopous, Dr. House."
	},
	["Cotton Cavalier"] = {
		Id = 5015538792,
		Name = "Cotton Cavalier",
		AltCards = {
			["Cotton Cavalier-Hal"] = {
				Id = 7437135723,
				Name = "Candy Cavalier",
				AttackEffect = "Scratch",
				Bio = "Tricks to all that oppose us! The trick being death!"
			}
		},
		Health = 200,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Red = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "Whenever you cast a fighter: This card gains 150 Health.",
			Type = "OnAllySummon",
			Power = { { "Heal", 150 } },
			Target = "Self"
		},
		Bio = "Death to all that oppose us! Those tyrants of flesh can go stuff themselves!"
	},
	Majora7 = {
		Id = 6981590222,
		Name = "Karnajj",
		CopyBodge = "Majora7",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
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
	Lorenzo77555 = {
		Id = 6981589118,
		Name = "Lorenzo77555",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
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
	MajorMattias = {
		Id = 6981589686,
		Name = "MajorMattias",
		AltCards = {
			["Smirking Associate"] = {
				Id = 77745554444112,
				Name = "Smirking Associate",
				Effect = {
					Name = "Cow Sergeant",
					Description = "When this card dies: Put a Red Stud into your baseplate.",
					Type = "OnDeath",
					Power = { {
						"AddGenZone",
						{ "Red Stud-Smiley", 1 },
						nil,
						nil,
						nil,
						nil,
						"BaseplateRed"
					} },
					Target = "Ally"
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 535,
				Bio = "WHY DID YOU WANTED ME TO STEAL THE CASH REGISTER, WAS THE FIREBRAND NOT ENOUGH???"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
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
	TwoShue = {
		Id = 7029096036,
		Name = "TwoShue",
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Ice",
		Color = "Yellow",
		Cost = { Yellow = 2, Blue = 2 },
		Summonant = "Puppy Guarder",
		Effect = {
			Name = "Hide and Go Seek",
			Description = "When this card is cast: Destroy the oldest card in your opponent's hand. They summon a 500/500 Yellow Puppy Guarder with no abilities.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
				{ "Summon", "Summonant" }
			},
			Target = "Opponent"
		},
		Bio = "\"What a puppy guard.\""
	},
	["Puppy Guarder"] = {
		Id = 8542093019,
		Name = "Puppy Guarder",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Yellow",
		Cost = { Yellow = 2, Blue = 2 },
		Effect = {
			Name = "Hide and Go Seek",
			Description = "For 300 seconds: Do absolutely nothing except hold onto that single guy you tagged like he's the father who abandoned you.",
			Type = "Nill",
			Power = {
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
				{ "Summon", "Summonant" }
			},
			Target = "Opponent"
		},
		Bio = "Stay so close to your kill that they can't unfreeze them! Play lame, win game!"
	},
	Qdhxx = {
		Id = 7017586786,
		Name = "Qdhxx",
		AltCards = {
			["Qdhxx-C"] = {
				Id = 8108332431,
				AttackEffect = "Slash",
				Bio = "\"It's a miracle! Santa gave me milkies and cookies and a yule log!\""
			},
			["Bandit-ROR"] = {
				Id = 10570706416,
				Name = "Bandit",
				AltArt = true,
				AttackEffect = "Rifle",
				Bio = "\"My coat? I'm a thief - not a plumber. Of course I'm bringing my coat.\""
			}
		},
		Power = 300,
		Health = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Yellow = 3 },
		Effect = {
			Name = "Trade Currency Profits",
			Description = "When this card is cast: All allied fighters gain 100 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "Ally"
		},
		Bio = "You get a buff, and you get a buff, and YOU get a buff!"
	},
	Uncomfortably = {
		Id = 7038744139,
		Name = "Uncomfortably",
		AltCards = {
			["Uncomfortably-Sun"] = {
				Id = 17717381635,
				Name = "Wizard of the Summer Sale",
				AttackEffect = "Minigun",
				Bio = "You can find me at gr8 ben at ROLVe software"
			}
		},
		Health = 1300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Green = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "Whenever this card attacks: Give yourself an uncommon Yellow card and an uncommon Green card.",
			Type = "OnAttack",
			Power = {
				{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Uncommon Yellow" },
				{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Uncommon Green" }
			},
			Target = "Ally"
		},
		Bio = "This is the kind of name that makes me flinch."
	},
	["Uncomfortably Token"] = {
		Id = 5116552984,
		Name = "Uncomfortably",
		Health = 600,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4, Green = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "During your end step: You gain {G}.",
			Type = "OnEnd",
			Power = { { "Green", 1 } },
			Target = "Ally"
		},
		Bio = "This is the kind of name that makes me flinch."
	},
	Widgeon = {
		Id = 15589162119,
		Name = "Widgeon",
		AltCards = {
			["Widgeon-Sun"] = {
				Id = 7149224735,
				CopyBodge = "Widgeon-Sun",
				AttackEffect = "MagicBlue",
				Bio = "The floor is Meepcity."
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3, Red = 2, Yellow = 2 },
		Effect = {
			Name = "Overgrown",
			Description = "During your end step: All allied fighters gain 100 Health.",
			Type = "OnEnd",
			Power = "Heal",
			Target = "Ally",
			Increase = 100
		},
		Bio = "He created the Plaza and does giveaways, maybe a bit too much.. >w>"
	},
	Brick_Man = {
		Id = 7021251198,
		Name = "Brick_Man",
		AltCards = {
			["Gent N Rifo"] = {
				Name = "Gent & Broke God",
				Id = 102946229893843,
				AttackEffect = "Jab",
				PackDisplayOverride = "Art Box",
				AltArt = true,
				Bio = "*feels the aura*",
				Addant = "Punch N' Stun"
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 3, Green = 2 },
		Addant = "Camera",
		CustomReminder = {
			Accomplice = "A Yellow {W}{W} fighter, inert in play. When it's cast, it deals 200 damage to a target fighter and locks it for 1 turn."
		},
		Effect = {
			Name = "Spotted",
			Description = "When this card is cast: Give yourself a 200/500 Accomplice.",
			Type = "OnSummon",
			Power = { { "Add", "Camera" } },
			Target = "Ally"
		},
		Bio = "Is it human nature to want something simply because it belongs to someone else?"
	},
	Camera = {
		Id = 7021251566,
		Name = "Brick_Man's Accomplice",
		AltCards = {
			["Punch N Stun"] = {
				Name = "Punch N' Stun",
				Id = 131947425696877,
				AttackEffect = "Jab",
				Bio = "a simple combo against complicated opponents"
			}
		},
		CopyBodge = "Camera",
		Health = 200,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Token = true,
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Spotted",
			Description = "When this card is cast: Deal 200 damage to a target fighter. Lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{ "Lock", 1 }
			},
			Target = "Single"
		},
		Bio = "You must have a real deathwish, huh?"
	},
	["Wild Reporter Tracy"] = {
		Id = 7017584330,
		Name = "Reporter Tracy",
		AltCards = {
			WildReporterTracyV2 = {
				Name = "Wild Reporter Tracy",
				AttackEffect = "Jab",
				Id = 5594373254,
				AltArt = true,
				Bio = "Hot Ancient News."
			},
			["Wild Reporter Tracy-AN"] = {
				Name = "Reporter Tracy",
				AttackEffect = "Jab",
				Id = 9362288814,
				Bio = "Hot Ancient News."
			},
			["Wild Reporter Tracy-ET"] = {
				Name = "Charillitis Golfer",
				AttackEffect = "Jab",
				Id = 16446075906,
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Bio = "\"How's y'er weekend been, John?\"<br/>\"i bludgeoned and burnt a bunch of metalheads in an alleyway\"<br/>\"Business as usual, then?\"<br/>\"...business as usual\""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 3, Blue = 1 },
		Effect = {
			Name = "Hot Ancient News",
			Description = "During your end step, if you have 2 or fewer cards in hand: draw 2 cards.",
			Type = "OnEnd",
			EffectRequirement = { "Playertable", "Me", 0, 3, "Hand" },
			Power = { { "Draw", 2 } },
			Target = "Ally"
		},
		Bio = "Hot Ancient News."
	},
	Visleaf = {
		Id = 104065837555846,
		Name = "Thumpo the Great",
		AltCards = {
			tintinytdj = {
				Id = 77062425345992,
				CopyBodge = "tinytinytdj",
				Name = "Thumpo",
				AttackEffect = "MagicYellow",
				Bio = "Glory in bits!"
			},
			["Visleaf-ArtV"] = {
				Id = 132594159034057,
				CopyBodge = "Visleaf-ArtV",
				Name = "Art.",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "...and the death of it."
			},
			["Visleaf-E"] = {
				Id = 112157203518756,
				CopyBodge = "Visleaf-E",
				Name = "Thumpus the Incipient",
				AttackEffect = "Scratch",
				Bio = "smol warlord bnuy :D"
			},
			Leaf = {
				Id = 128205871934358,
				CopyBodge = "Leaf",
				Name = "Bunnies",
				AttackEffect = "Slash",
				Bio = "Bunnies."
			},
			["Elder Visleaf"] = {
				Id = 102272597392646,
				Name = "Tess",
				AttackEffect = "Jab",
				Bio = "It's short for Traveling Student!"
			},
			["Beta Visleaf"] = {
				Id = 106057317392322,
				Name = "Thumpo",
				AttackEffect = "Slash",
				Bio = "Hmmhm"
			},
			["The True Self"] = {
				Id = 17346073423,
				Name = "The True Self",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 257,
				Bio = "I am a shadow, the true self."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1, Green = 1 },
		Effect = {
			Name = "Split Ego",
			Description = "When this card is cast: All fighters lose 200 Power.",
			Type = "OnSummon",
			Power = { { "Weaken", 200, "All" } },
			Target = "Self"
		},
		Bio = "*Trombone Noises*"
	},
	["Matt Dusek"] = {
		Id = 7550974576,
		Name = "Matt Dusek",
		Health = 2000,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Yellow",
		Charge = true,
		CounterBlock = true,
		Cost = { Neutral = 4, Blue = 2, Yellow = 4 },
		Effect = {
			Name = "Revival",
			Description = "Whenever this card attacks a fighter: Summon a copy of that fighter. Lock this card for 3 turns.",
			Type = "OnAttack",
			Power = {
				{ "SummonCopy" },
				{ "Lock", 3, "Self" }
			},
			Target = "Aggressor"
		},
		Bio = "Some would say ignoring any kind of interaction on the field and just copying the opponent's fighters is cheating. Those people are morally correct. Dusek is not."
	},
	Clockwork = {
		Id = 10184323653,
		Name = "Clockwork",
		AltCards = {
			["Avis Cult Leader Saxoattack"] = {
				Id = 10184160521,
				Name = "Avis Cult Leader Saxoattack",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "Through our sacrifices, we will finally understand who REALLY built the pyramids."
			},
			["Clockwork-Inno"] = {
				Id = 17800152371,
				Name = "Iris, Master of STUD!!",
				AttackEffect = "StudBlast",
				Bio = "\"Did you know that Iris is the best gladiator?! SHE L-LIEK OH EM GEE DA BEST LOL! XDDDD HER HER CAPE IS SO SWAG HER HAT IS YOLO OMGGGG I WANNA BE LIKE HER AHHHHHh\" -Iris' Fangirl"
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Red = 2, Green = 2, Blue = 2, Yellow = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Thought, Dominion, Revel, Vitality, Null. With these stud types combined, I AM CAPTAIN EARL GREY!!!!"
	},
	colesans16 = {
		Id = 10184337856,
		Name = "colesans16",
		AltCards = {
			Drivethecar54 = {
				Name = "Drivethecar54",
				AttackEffect = "Gun",
				Id = 10184533764,
				AltArt = true,
				Bio = "I'll hold them off."
			},
			OMGitsSUPERbaconPIG = {
				Name = "OMGitsSUPERbaconPIG",
				AttackEffect = "Jab",
				Id = 10015278681,
				AltArt = true,
				Bio = "Nobody knows how he can play with block hands, but it sounds good so whatever."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Token = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Hellfire",
			Description = "When this card dies: You gain 4{W}.",
			Type = "OnDeath",
			Power = { { "Neutral", 4 } },
			Target = "Ally"
		},
		Bio = "I'll be keeping those under locks."
	},
	ASeal = {
		Id = 10184144961,
		Name = "ASeal",
		Health = 500,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Frozen Fish"] = "A colourless action that costs ⚪. It gives a target fighter 200 Health, and you 200 Life."
		},
		IsFood = true,
		Effect = {
			Name = "EzWinz",
			Description = "Whenever this card attacks: Give yourself a Frozen Fish.",
			Type = "OnAttack",
			Power = { { "Add", "Frozen Fish" } },
			Target = "Ally"
		},
		Bio = "\"You have to enjoy the frozen fish.\""
	},
	["Frozen Fish"] = {
		Id = 10184688239,
		Name = "Frozen Fish",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Trout Slap",
			Description = "A target fighter gains 200 Health.\nYou gain 200 life.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Inflict", -200, "Ally" }
			},
			Target = "Single"
		},
		Bio = "\"I'll enjoy it, but only at your expense.\""
	},
	MegaSmiley = {
		Id = 10185621584,
		Name = "MegaSmiley",
		AltCards = {
			["MegaSmiley-Hal"] = {
				Id = 7634902830,
				AttackEffect = "British",
				Bio = "Give a man a mask and he'll refuse his humanity."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Knife",
		Color = "Neutral",
		EffectVariable = 0,
		EffectAnimation = "KnifeThrowEnemy",
		Cost = { Yellow = 3, Red = 3, Neutral = 2 },
		Effect = {
			Name = "Phantom Power",
			Description = "When this card is cast: It gains 50 Health and Power for each yellow card in your baseplate. Deal 50 damage to all enemy fighters for each red card in your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "GenZone_Ally", "Yellow", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Strengthen", "Variable" },
				{ "Heal", "Variable" },
				{
					"AlterEV",
					{ "Set", "GenZone_Ally", "Red", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Damage", "Variable", "Opponent" }
			},
			Target = "Self"
		},
		Bio = "\"Give a man a mask and he'll tell you the truth.\" - Oscar Wilde"
	},
	["Birthday Suprise"] = {
		Id = 107847582254394,
		Name = "Birthday Surprise",
		AltCards = {
			["Fruit Cake"] = {
				Id = 10184689945,
				Name = "Fruit Cake",
				Bio = "Even all the trash on Christmas it smells so sweetly. This Christmas feels like the very first Christmas to me. LALALALALALALA-"
			},
			BCTrophy3rd = {
				Id = 10184225852,
				Name = "Bronze Blox Cards Trophy",
				Bio = "Proof of struggle. Those with this card have reached far in an official Blox Cards tournament."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectAnimation = "EatBirthdayCakeAlly",
		IsFood = true,
		Effect = {
			Name = "Birthday Surprise",
			Description = "A target fighter gains 200 Health. All allied fighters gain 200 Health.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Heal", 200, "Ally" }
			},
			Target = "Single"
		},
		Bio = "SURPRISE!"
	},
	saud20 = {
		Id = 10186228355,
		Name = "saud20",
		AltCards = {
			["saud20-Banner"] = {
				Id = 12326185128,
				Name = "Cupid",
				Effect = {
					Name = "Cupid",
					Description = "During your end step: Give yourself a coloured Arrow action.",
					Type = "OnEnd",
					Power = { {
						"RandomAdd",
						{
							"God's Fury-Banner",
							"Hell's Wrath-Banner",
							"Nature's Poison-Banner",
							"Blinding Light-Banner"
						}
					} },
					Target = "Ally"
				},
				Bio = "\"Please hit...\""
			},
			Supagold = {
				Name = "Supagold",
				AttackEffect = "Jab",
				Id = 97568441157170,
				AltArt = true,
				Bio = "I'm always supa"
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Arrow",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Cupid",
			Description = "During your end step: Give yourself a coloured Arrow action, that costs 1 of its colour.",
			Type = "OnEnd",
			Power = { {
				"RandomAdd",
				{ "God's Fury", "Hell's Wrath", "Nature's Poison", "Blinding Light" }
			} },
			Target = "Ally"
		},
		Bio = "Don't let him near ants."
	},
	["God's Fury"] = {
		Id = 5983854196,
		Name = "Arrow of God's Wrath",
		AltCards = {
			["God's Fury-Banner"] = {
				Id = 12326795331,
				Name = "Reciprocal Arrow",
				Effect = {
					Power = {
						{ "Damage", 50 },
						{ "Add", "God's Fury 2-Banner", "Ally" }
					}
				},
				Bio = "The feeling is mutual."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectAnimation = "ThunderArrow",
		Effect = {
			Name = "Fury",
			Description = "Deal 50 damage to a target fighter.\nGive yourself a copy of this card without this effect.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 50 },
				{ "Add", "God's Fury 2", "Ally" }
			},
			Target = "Single"
		},
		Bio = "PURGE!"
	},
	["God's Fury 2"] = {
		Id = 5983854196,
		Name = "Arrow of God's Wrath",
		AltCards = {
			["God's Fury 2-Banner"] = {
				Id = 12326795331,
				Name = "Reciprocal Arrow",
				Bio = "The feeling is mutual."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		EffectAnimation = "ThunderArrow",
		Effect = {
			Name = "Fury",
			Description = "Deal 50 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 50 } },
			Target = "Single"
		},
		Bio = "PURGE!"
	},
	["Hell's Wrath"] = {
		Id = 5983849466,
		Name = "Arrow of Hell's Fury",
		AltCards = {
			["Hell's Wrath-Banner"] = {
				Id = 12326794469,
				Name = "Heartbreak Arrow",
				Bio = "The hurt of one-sided love."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 1 },
		EffectAnimation = "DamageArrow",
		Effect = {
			Name = "Wrath",
			Description = "Deal 150 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 150 } },
			Target = "Single"
		},
		Bio = "BURN!"
	},
	["Nature's Poison"] = {
		Id = 5983857156,
		Name = "Arrow of Nature's Poison",
		AltCards = {
			["Nature's Poison-Banner"] = {
				Id = 12326793773,
				Name = "Lovestruck Arrow",
				Bio = "A disarming charm."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 1 },
		EffectAnimation = "PoisonArrow",
		Effect = {
			Name = "Poison",
			Description = "A target fighter loses 150 Power.",
			Type = "OnSummon",
			Power = { { "Weaken", 150 } },
			Target = "Single"
		},
		Bio = "SUFFER!"
	},
	["Blinding Light"] = {
		Id = 5983851879,
		Name = "Arrow of Blinding Light",
		AltCards = {
			["Blinding Light-Banner"] = {
				Id = 12326796430,
				Name = "Passionate Arrow",
				Bio = "A presence that locks me in place."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		EffectAnimation = "WeakenArrow",
		Color = "Blue",
		Cost = { Blue = 1 },
		Effect = {
			Name = "Light",
			Description = "Lock a target fighter for 1 turn.",
			Type = "OnSummon",
			Power = { { "Lock", 1 } },
			Target = "Single"
		},
		Bio = "CRIPPLE!"
	},
	["Despairing Masses"] = {
		Id = 140239731579465,
		Name = "Despairing Masses",
		Health = 250,
		Power = 1250,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Swap the stats of a target allied fighter. Repeat this effect once.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap" },
						{ "Swap" }
					},
					Target = "SingleAlly",
					UniqueTargets = true
				}
			}
		},
		Bio = "The trauma of the Alpha Wars made thinking too difficult, too painful. People surrendered their free will and control to charlatans who promised to fix the state of the world."
	},
	Thoughtgnaw = {
		Id = 11972759753,
		Name = "Thoughtgnaw",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
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
	["Veterans of Strife"] = {
		Id = 11772223864,
		Name = "Veterans of Strife",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If this card's stats would be swapped: If it's Red, give yourself a Green card and it becomes Green. Otherwise give yourself a Red card and it becomes Red.",
			Ability = {
				OnSwap = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "ReplaceColor", "Green", "Self" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = {
						{ "ReplaceColor", "Red", "Self" },
						{ "RandomAdd", "MonoOnlyorRedCost Red" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The veterans of the Alpha Wars came together to share but one thing in common: Their suffering."
	},
	["Resurgance of Peace"] = {
		Id = 11769927328,
		Name = "Resurgence of Peace",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 9 },
		Effect = {
			Name = "Sneak Attack",
			Description = "You gain 500 life.\nPut 5 Green Studs into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{
					"AddGenZone",
					{ "Green Stud", 5 }
				}
			},
			Target = "Ally"
		},
		Bio = "As Shedletsky formed a seal around the Alpha Brick, the Nightmares began to starve. Their source of fear amongst the populace was gone."
	},
	["Draconic Uprising"] = {
		Id = 11769918888,
		AltCards = {
			Thorns = {
				Id = 71142775899502,
				Name = "Thorns",
				AltArt = true,
				PremiumArt = 867,
				Bio = "ahh… why are you.. staring at me like that? dont look.. at ME.. please..<br/><br/>i’m sorry<br/><br/><b><font color=\"#ff0d0d\">ME..</font></b>"
			}
		},
		Name = "Draconic Uprising",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Green",
		Cost = { Neutral = 4, Green = 8 },
		AlternateCost = { IgnoreColor = "Green" },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 3, 9999, "Acolyte" },
		EffectVariable = 0,
		Fading = true,
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Cast this card ignoring its {G} cost if there's 3 or more Acolytes in your baseplate.\nAll fighters antigenerate.\nDestroy all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Generate", -1 },
				{ "Destroy" }
			},
			Target = "All"
		},
		Bio = "The Acolytes wished for the world to be scorched over in the name of Rebirth."
	},
	["Spirit of Robloxia Vitalised"] = {
		Id = 11769945957,
		Name = "Spirit of Robloxia Vitalised",
		Health = 500,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter is cast, or an allied fighter dies: You gain 50 life.",
			Ability = {
				OnAllySummon = {
					Power = { { "Cost", -50 } },
					Target = "Ally"
				},
				OnAllyDeath = {
					Power = { { "Cost", -50 } },
					Target = "Ally"
				}
			}
		},
		Bio = "They lost the Power of the Alpha Brick, but the lands looked even more brighter than ever."
	},
	["Roots of Despair"] = {
		Id = 11769915319,
		Name = "Roots of Despair",
		AltCards = {
			["Roots of Despair-AN"] = {
				Id = 18199520409,
				AttackEffect = "Slash",
				Name = "Casuist",
				Bio = "A mind is a field of crops waiting to be harvested."
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Green = 2, Blue = 2, Neutral = 3 },
		Archetype = "Nightmare",
		SummonAnimation = "NightmareCall",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an effect draws a player a card: All fighter cards in your hand gain 50 Health and Power.",
			Ability = {
				OnAnyDraw = {
					Power = {
						{ "HealHand", 50 },
						{ "StrengthenHand", 50 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "It must end."
	},
	cloakedyoshi = {
		Id = 11769909682,
		Name = "cloakedyoshi",
		Health = 650,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you cast another fighter: It gains this card's Power.",
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
	["Cathedral of the Fried One"] = {
		Id = 11769902331,
		Name = "Cathedral of the Fried One",
		AltCards = {
			["Cathedral of the Fried One-Code"] = {
				Id = 87988633205326,
				PlayTest = true,
				Terrariant = "Shedletsky's Return-S",
				AttackEffect = "Slash",
				Name = "The Signature Shedletsky Secret"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrain = true,
		Terrariant = "Shedletsky's Return",
		Cost = { Neutral = 1, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["Shedletsky's Return"] = "Cast 'Living World' to animate this as a 600/500. When you do, search your deck for a legendary Shedletsky card. When you cast him, all allied fighters become Shedletsky too."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Limb of Power: Give yourself a copy of it, except it has stealth.",
			Ability = {
				OnAllyCast = {
					Power = { { "AddCopy" } },
					Target = "Aggressor",
					Archetype = "Shedletsky",
					MetaData = { Stealth = true }
				}
			}
		},
		Bio = "Praying for god's help calmed the despaired minds, even if slightly."
	},
	["Banished Nevermore"] = {
		Id = 11769901677,
		Name = "Banished Nevermore",
		AltCards = {
			["DOODL3HD, L3G1SL4C3R4TOR"] = {
				Id = 82761823068900,
				Name = "DOODL3HD, L3G1SL4C3R4TOR",
				AttackEffect = "LinkedSword",
				AltArt = true,
				PremiumArt = 428,
				Bio = "<b><font color=\"#008282\">SC4L3M4T3, N3ODR4GON, WHO C4R3S? W3 M4K3 OUR OWN SH3DL3TSKY TOK3NS</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		Fading = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Telamon's Deck"] = "A deck of incredibly Powerful rainbow cards not meant to be wielded by mortals."
		},
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "You lose all of your studs.\nX is the amount of studs you lost this way.\nIf X is 15 or more, draw a card and lock a target enemy fighter for 1 turn.\nIf X is 30 or more, draw a card and return that fighter to its hand.\nIf X is 45 or more, draw a card. Your opponent can't cast anything next turn.\nIf X is 60 or more, Put a stud of each color into your Baseplate. Replace your deck with Telamon's deck.",
			Ability = {
				OnSummon = {
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
						{
							"AlterEV",
							{ "Add", "Playertable", "ColorNeutral", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "StudCount" }
						},
						{ "SetRed", 0, "Ally" },
						{ "SetBlue", 0, "Ally" },
						{ "SetYellow", 0, "Ally" },
						{ "SetGreen", 0, "Ally" },
						{ "SetNeutral", 0, "Ally" },
						{
							"AlterEV",
							{ "Gate", "Math", 14, "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Ally" },
						{ "Lock", "Variable", "SingleEnemy" },
						{
							"AlterEV",
							{ "Load", "Math", "nil", "StudCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 29, "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Ally" },
						{
							"ReturnOnGreaterEV",
							{ 30, 0 },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Load", "Math", "nil", "StudCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 44, "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Ally" },
						{
							"BypassCastingOnGreaterEV",
							{ 30, 0 },
							"Opponent"
						},
						{
							"AlterEV",
							{ "Load", "Math", "nil", "StudCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 59, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
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
						{ "RemoveDeck", 999 },
						{
							"RepeatingRandomDeckAdd",
							{
								{
									"TelaStarsnatch",
									"TelaWrath of the Fried One",
									"TelaCathedral of the Fried One",
									"TelaLeft Arm of the Fried One",
									"TelaLeft Leg of the Fried One",
									"TelaRight Leg of the Fried One",
									"TelaRight Arm of the Fried One",
									"TelaTelamon",
									"InceptionTime Token",
									"Shedletsky, the Fried One",
									"Master Acolyte's Altar"
								},
								40
							},
							"Ally"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Acolytes watched on as the dragons they worshipped were banished to a lower realm, never to escape. Now, they had to find something else to worship."
	},
	["Plea for Guidance"] = {
		Id = 77618359827235,
		Name = "Plea for Guidance",
		AltCards = {
			["Plea for Guidance-H25"] = {
				Id = 76272989127868,
				Name = "Serpentide",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "It would be folly to vastate my acolytes for lunch, when they have promised me a far grander feast for dinner."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		InPD2 = true,
		Effect = {
			Description = "The most expensive fighter in your deck gains 400 Health and Power.\nDraw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { "HighestCostFighter" },
						SubModifier = true
					},
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{ "Heal", 400 },
						{ "Strengthen", 400 },
						{ "Draw", 1, "Ally" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { "HighestCostFighter" },
						SubModifier = true
					},
					KeepSameTargets = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "Heal", 400 },
						{ "Strengthen", 400 },
						{ "Draw", 1, "Ally" }
					},
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { CostExact = "Variable", Fighter = true },
						SelectionDescription = "a fighter to give 500 Health and Power.",
						MinTargets = 1,
						MaxTargets = 1
					},
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { "HighestCostFighter" },
						SubModifier = true
					}
				}
			}
		},
		Bio = "Too weak to stop the oceans boiling, Robloxia's traumatised weaklings begged into existence a being strong enough to."
	}
}
