return {
	ThatGrimGuy = {
		Id = 128102446545707,
		Name = "ThatGrimGuy",
		AltCards = {
			["ThatGrimGuy-Alt"] = {
				Id = 9964902567,
				AltArt = true,
				CopyBodge = "ThatGrimGuy-Alt",
				AttackEffect = "Gun",
				Bio = "As opposed to any other."
			}
		},
		Health = 650,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Is your big head too SMALL? Just add water to achieve BIGGERHEAD."
	},
	BenCanova1 = {
		Id = 9964992219,
		Name = "BenCanova1",
		AltCards = {
			InsertACleverPunHere = {
				Name = "SinAndLetSin",
				AttackEffect = "Scratch",
				Id = 15941930205,
				AltArt = true,
				Bio = "Maybe one day I'll be punished for my sins? Until then..."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
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
	["Groucho Mask"] = {
		Id = 4899391298,
		Name = "Melvin Hat",
		AltCards = {
			["Melvin-C"] = {
				Id = 8215068502,
				Name = "Santa Hat",
				Bio = "Now YOU can spend your life slaving away to give pointless tat to the entire planet year in year out without any gratitude or holidays!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Impersonate",
			Description = "Put a Green Stud into your baseplate.\nIf you've gained 600 or more life this turn, draw a card.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Green Stud", 1 },
					nil,
					nil,
					nil,
					nil,
					"BaseplateGreen"
				},
				{
					"AlterEV",
					{ "Set", "Playertable", "LifeTaken", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Subtract", "Math", 599, "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Gate", "Math", 0, "Nil" },
					"Self"
				},
				{ "Draw", "Variable" }
			},
			Target = "Ally"
		},
		Bio = "Still hunting for the right head."
	},
	Burglar = {
		Id = 5125231146,
		Name = "Vupa",
		CopyBodge = "Burglar",
		AltCards = {
			RobberAlt = {
				Name = "Burglar",
				Id = 3471764666,
				AttackEffect = "Jab",
				CopyBodge = "RobberAlt",
				Bio = "AAAAAAAA I'M INTOLERANT TO GLUTEN WHY CAN'T I STOP MYSELF"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Tempest",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Bloxy Victory",
			Description = "During your end step: Your opponent loses 150 life. You gain 150 life.",
			Type = "OnEnd",
			Power = {
				{ "Inflict", 150 },
				{ "Cost", -150 }
			},
			Target = "Opponent"
		},
		Bio = "Controversial forumer, got a one way trip to Banland because of it."
	},
	Salesman = {
		Id = 4536845389,
		Name = "Salesman",
		AltCards = {
			["Salesman-E"] = {
				Id = 8707809694,
				Name = "Waiter",
				AttackEffect = "Jab",
				Bio = "He only serves sunny-side up."
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "Vampire",
			Description = "When this card is cast: All players gain 50 life. You gain 2{G}.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -50 },
				{ "Inflict", -50, "Opponent" },
				{ "Green", 2 }
			},
			Target = "Ally"
		},
		Bio = "It's a win-win offer you cant refuse!"
	},
	MesoSad = {
		Id = 5059536109,
		Name = "M3soSAd",
		AltCards = {
			mathep = {
				Id = 7190589660,
				Name = "mathep",
				AltArt = true,
				Bio = "Freaking awesome."
			},
			SouperStar = {
				Id = 8305305505,
				Name = "SouperStar",
				AttackEffect = "Bat",
				AltArt = true,
				Bio = "What do you mean you “are Soup”?!"
			},
			["MesoSad-Hal"] = {
				Name = "MoosoSad",
				SummonAnimation = "CowMoo",
				DeathAnimation = "CowGone",
				Id = 7472551875,
				Bio = "\"Honestly, I don't know what I did to deserve this.\""
			},
			["The Burning Heaven"] = {
				Id = 125313999516028,
				Name = "Juliet",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 439,
				Bio = "Blink and you'll miss her."
			},
			TheTiesWhite = {
				Id = 118960663539042,
				Name = "TheTiesWhite",
				Commissioner = { "TheTiesWhite" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 691,
				Bio = "The self-insert's alt art set's self insert's alt art."
			}
		},
		Health = 400,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "MesoSad",
			Description = "When this card is cast: Draw a fleeting card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "Holy cow, this has got to be the fattest cow I've EVER seen! Just look at this total FATSO! Fat, fat, fat! Now for a quick scientific selfie."
	},
	Youngtan = {
		Id = 9570534426,
		Name = "Youngtan",
		AltCards = {
			["Youngtan-Sun"] = {
				Id = 9804386642,
				Name = "Tourist",
				AttackEffect = "Jab",
				EffectAnimation = "LargeMagicYellowEffect",
				Bio = "She doesn't see sights this beautiful in Bloxburg."
			},
			["Youngtan-AN"] = {
				Id = 13887710405,
				Name = "Dominus Pittacium",
				AttackEffect = "MagicYellow",
				EffectAnimation = "LargeMagicYellowEffect",
				Bio = "Aeternum vale."
			},
			["Camosian Winter Defense"] = {
				Id = 13128932980,
				Name = "Camosian Winter Defense",
				AttackEffect = "Ice",
				EffectAnimation = "MidBlizzardEffect",
				AltArt = true,
				PremiumArt = 24,
				Commissioner = { 921549071 },
				Bio = "\"It's wintertime, invaders. There's no more point in running. I'm already here.\""
			},
			sobpfebs = {
				Id = 131701717686311,
				Name = "sobpfebs",
				PremiumArt = 381,
				AltArt = true,
				Bio = "sugar crasj ouuuu"
			},
			["dapro6666666, motivated"] = {
				Id = 124046536687573,
				Name = "dapro6666666, motivated",
				PremiumArt = 851,
				Commissioner = { "dapro6666666" },
				AltArt = true,
				Bio = "\"My drill is the drill that creates the heavens!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "XhartyrSlash",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Charge = true,
		Effect = {
			Name = "Youngtan's Power",
			Description = "After this card attacks: Destroy the fighter it attacked if it has 800 or more Power.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "AggressorCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
						},
						{ "EVGreaterValueCheck", 799 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "AggressorCard" },
							"Aggressor"
						},
						{
							"Destroy",
							30,
							"EVCard",
							nil,
							nil,
							nil,
							"LargeXhartyrSlashEffect"
						}
					},
					Target = "EVCard",
					NoBlip = true
				}
			}
		},
		Bio = "One sword for trust. One sword for betrayal."
	},
	Spark = {
		Id = 7559457816,
		Name = "Spark",
		AltCards = {
			Kil = {
				Name = "Kil",
				Id = 6852856010,
				AltArt = true,
				Bio = "Standing alone, Doesn't not mean I'm weak and Powerless it means I'm strong enough to handle all my pain and to fight with all my strength."
			},
			The_BlackShogun01 = {
				Name = "The_BlackShogun01",
				Id = 8707883913,
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "After taking over the Redcliff kingdom by defeating their king, he continues his endless search for greater Powers offered of this world."
			},
			["Spark-Mango"] = {
				Name = "Cassius P.",
				Id = 92617195686777,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"Beyond the great sandstone wall lies The Desert, a vast sandy plain home to the Temple of the Manic. To enter however, requires venturing far throughout the land to prove yourself worthy. Luckily, I can tell you where to go\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Blue = 1 },
		Charge = true,
		Effect = {
			Name = "Probably shouldn't.",
			Description = "When this card is cast: Reveal your opponent's hand. All players gain 200 life.",
			Type = "OnSummon",
			Power = {
				{ "RevealHand", 999 },
				{ "Cost", -200 },
				{ "Inflict", -200 }
			},
			Target = "Opponent"
		},
		Bio = "Not related to Spyro the Dragon's companion(s)."
	},
	SirDapper = {
		Id = 6548871737,
		Name = "SirDapper",
		AltCards = {
			["Nacho, the Devil's Advocate"] = {
				Name = "Nacho, the Devil's Advocate",
				AttackEffect = "FirePunch",
				Id = 6098954477,
				AltArt = true,
				Bio = "The devil got away with so many crimes because of this guy."
			},
			SirRipper = {
				Name = "SirRipper",
				AttackEffect = "Scratch",
				Id = 71069583758782,
				Bio = "It's SO much funner to just rip your hands off."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		Effect = {
			Name = "Explosm",
			Description = "When this card dies: Destroy the oldest card in your opponent's hand.",
			Type = "OnDeath",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent"
		},
		Bio = "Here CEO of Control Decks, I made you a sandwich! Creator of Boxing Mania."
	},
	how_inconvenient = {
		Id = 6499186449,
		Name = "how_inconvenient",
		AltCards = {
			["how_inconvenient-Hal"] = {
				Name = "Saw_Inconvenient",
				Id = 7556373872,
				Bio = "This game is really inconvenient."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Flare",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Effect = {
			Name = "Render",
			Description = "Whenever an enemy effect targets: Deal 200 damage to all enemy fighters.",
			Type = "OnEnemyTarget",
			Power = { { "Damage", 200 } },
			Target = "Opponent"
		},
		Bio = "This effect is really inconvenient."
	},
	DeathETM = {
		Id = 4942878679,
		Name = "DeathETM",
		AltCards = {
			["DeathETM-RaidAct1"] = {
				Id = 85206440359680,
				Name = "Roundy",
				AttackEffect = "Jab",
				Bio = "Anything but square."
			}
		},
		Health = 750,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 1 },
		EffectVariable = 1,
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever your opponent gains life: You draw a card.",
			Ability = {
				OnEnemyLifeGain = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally"
				},
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Pah! Look at these newbs with their 1-drop FreezerFlames! Back in the olden days, only I could survive the wrath of Ignis Mage!"
	},
	RiceStorage = {
		Id = 6419877339,
		Name = "RiceStorage",
		AltCards = {
			["RiceStorage-Val"] = {
				Id = 7138169344,
				AttackEffect = "Jab",
				Name = "ChocolateStorage",
				Bio = "His love of chocolate sometimes goes out of hand by filling his entire room with just chocolate, he'll store chocolate anywhere so he has plenty of chocolate to eat."
			},
			["Deadly Ace, Charge Fanatic"] = {
				Id = 16738401599,
				Name = "Deadly Ace, Charge Fanatic",
				PremiumArt = 237,
				AltArt = true,
				Bio = "I LOVE CHARGE, SCREW YOU ESGOO"
			},
			["Preston, Star Dreamer"] = {
				Id = 121352763423012,
				Name = "Preston, Star Dreamer",
				Commissioner = { "prestonplays899" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 770,
				Bio = "In the distance, a person sits alone"
			}
		},
		Health = 450,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "OnigiriBuff",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "Assimilate",
			Description = "Once each turn, whenever your opponent gains life: Unlock this card and it gains 100 health and Power.",
			Type = "OnEnemyLifeGain",
			Power = {
				{ "Unlock", 9999 },
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "His love of rice sometimes goes out of hand by filling his entire room of just rice. He'll store rice anywhere so he has plenty of rice to eat."
	},
	Zedreadr = {
		Id = 74950532129741,
		Name = "Zedreadr",
		AltCards = {
			["Zedreadr-C"] = {
				Id = 10243389668,
				Name = "Scheming Child",
				AttackEffect = "Bat",
				Bio = "Never underestimate a toddler with a huge red button and too much spare time."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "Kittenmancing",
			Description = "When this card is cast: Deal 400 damage to each fighter with the highest health.",
			Type = "OnSummon",
			Power = { { "Damage", 400, "HighestHealth" } },
			Target = "Ally"
		},
		Bio = "His spectacles never confuse him."
	},
	["Valkyrie in Despair"] = {
		Id = 9964956189,
		Name = "Valkyrie in Despair",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		StarterCard = true,
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Red Titanic Stud and a Blue Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Red Titanic Stud" },
				{ "Add", "Blue Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "The overwhelming Power of the gods broke her spirit. Still, she will pass on what little Power she has, no matter how futile it is."
	},
	["Valkyrie in Action"] = {
		Id = 9937888692,
		Name = "Valkyrie in Action",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1 },
		StarterCard = true,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Blue Titanic Stud and a Yellow Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Blue Titanic Stud" },
				{ "Add", "Yellow Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "\"Even the smallest insect can make a god bleed. I will never yield!\""
	},
	["Valkyrie in Control"] = {
		Id = 9937892139,
		Name = "Valkyrie in Control",
		AltCards = {
			Shababiii = {
				Id = 9937810213,
				Name = "Shababiii",
				AltArt = true,
				Bio = "She's unnaturally accurate with her pistol."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1 },
		StarterCard = true,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Red Titanic Stud and a Green Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Red Titanic Stud" },
				{ "Add", "Green Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "\"We have so much to gain from these Titans. We shall share their Power amongst us Robloxians, so that we might surpass them one day.\""
	},
	["Valkyrie in Mystique"] = {
		Id = 9937821775,
		Name = "Valkyrie in Mystique",
		AltCards = {
			["Divided Path"] = {
				Id = 72242085322745,
				Name = "Divided Path",
				AltArt = true,
				Effect = {
					Name = "Booming Red",
					Description = "You gain 500 life.\nGive yourself a Green Titanic Stud and a Blue Titanic Stud.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "Add", "Green Titanic Stud-Divided" },
						{ "Add", "Blue Titanic Stud-Divided" }
					},
					Target = "Ally"
				},
				Bio = "i am touching you"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1 },
		StarterCard = true,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Green Titanic Stud and a Blue Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Green Titanic Stud" },
				{ "Add", "Blue Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "When the Titan's curiosity grew, so did the curiosity of those influenced by them."
	},
	["Valkyrie in Family"] = {
		Id = 9937834291,
		Name = "Valkyrie in Family",
		AltCards = {
			["Valkyrie in Family-Senzura"] = {
				Name = "A Senzurial Doomsday Kit",
				Id = 115998354511672,
				Effect = {
					Name = "Booming Red",
					Description = "You gain 500 life.\nGive yourself a Green Titanic Stud and a Yellow Titanic Stud.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "Add", "Green Titanic Stud-Senzura" },
						{ "Add", "Yellow Titanic Stud-Senzura" }
					},
					Target = "Ally"
				},
				Bio = "Everything a Senzuriac needs to prepare for the end of the world. "
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		StarterCard = true,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Green Titanic Stud and a Yellow Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Green Titanic Stud" },
				{ "Add", "Yellow Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "\"Gosh, can't we all just, like, stop the fighting?\""
	},
	["Valkyrie in Mourning"] = {
		Id = 9937832496,
		Name = "Valkyrie in Mourning",
		AltCards = {
			["Warm Welcomings"] = {
				Id = 118043204368489,
				Name = "Warm Welcomings ",
				Commissioner = { "BonkJobBot" },
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 850,
				Bio = "Welcome to the <b><font color=\"#FFFF00\">Familey.</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		StarterCard = true,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Booming Red",
			Description = "You gain 500 life.\nGive yourself a Red Titanic Stud and a Yellow Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Add", "Red Titanic Stud" },
				{ "Add", "Yellow Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "\"As Valkyries, it's our duty to pass on the Power of the Titans. It's not easy.\""
	},
	["Cat's Eye Winglet"] = {
		Id = 6801088056,
		Name = "Cat's Eye Winglet",
		AltCards = {
			["Cupid's Eye Winglet"] = {
				Id = 4918974720,
				Name = "Cupid's Eye Winglet",
				Bio = "Who would give the disembodied eye of a cupid wings anyway? Sickos."
			},
			["The Husks of Gyroism"] = {
				Id = 81600029319748,
				Name = "The Husks of Gyroism",
				AttackEffect = "Slash",
				Bio = "Yes, the weak will cower,<br/>while the fittest will survive!"
			}
		},
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
	["Cat's Eye Wing Flock"] = {
		Id = 6801087655,
		Name = "Cat's Eye Wing Flock",
		AltCards = {
			["Cupid's Eye Wing Flock"] = {
				Id = 4918974401,
				Name = "Cupid's Eye Wing Flock",
				Addant = "Cupid's Eye Winglet",
				Bio = "FLYING CUPID EYES AAAAAAAA."
			},
			["The Servants of Gyroism"] = {
				Id = 86020821012583,
				Name = "The Servants of Gyroism",
				AttackEffect = "Slash",
				Addant = "The Husks of Gyroism",
				Bio = "Piercing into the sky, and higher!<br/>And the strong will thrive!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		CustomReminder = {
			["Cat's Eye Winglet"] = "A {W}{Y} 200/200. It gives all allied Cat's Eyes 100 health during your end steps."
		},
		Addant = "Cat's Eye Winglet",
		Effect = {
			Name = "Harassing Talons",
			Description = "When this card is cast: Give yourself a 200/200 Cat's Eye Winglet.",
			Type = "OnSummon",
			Power = { { "Add", "Addant", "Ally" } },
			Target = "Self"
		},
		Bio = "FLYING KITTEN EYES AAAAAAAA"
	},
	["Cat's Eye Cultist"] = {
		Id = 6806017066,
		Name = "Cat's Eye Cultist",
		AltCards = {
			["Cupid's Eye Cultist"] = {
				Id = 4918974133,
				Name = "Cupid's Eye Cultist",
				Addant = "Cupid's Eye Wing Flock",
				Bio = "The heart fuels the eye, and in return, the eye directs the heart."
			},
			vuyj = {
				Id = 3674695883,
				AttackEffect = "SkeleScythe",
				Name = "vuyj",
				Bio = "I knew it! The Egyptians were behind this all along!"
			},
			["The Arms of Gyroism"] = {
				Id = 134647613961391,
				Name = "The Arms of Gyroism",
				AttackEffect = "Slash",
				Addant = "The Servants of Gyroism",
				Bio = "And when the final duel is near,<br/>We'll lift our spears and fly."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Gravity",
		EffectAnimation = "MidMagicYellowEffect",
		Archetype = "CatEye",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		Addant = "Cat's Eye Wing Flock",
		Effect = {
			Name = "Harassing Talons",
			Description = "When this card is cast: Give yourself a 400/400 Cat's Eye Wing Flock. A target fighter loses 100 Power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100 },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Single"
		},
		Bio = "The brain fuels the eye, and in return, the eye directs the brain."
	},
	["Cat's Eye Corpse Stealer"] = {
		Id = 6801085727,
		Name = "Cat's Eye Corpse Stealer",
		AltCards = {
			["Cupid's Eye Heart Stealer"] = {
				Id = 4926166196,
				Name = "Cupid's Eye Heart Stealer",
				Addant = "Cupid's Eye Cultist",
				Bio = "She will stop at nothing to find her true love."
			},
			["The Left and Right Eyes of Gyroism"] = {
				Id = 80577616650140,
				Name = "The Left and Right Eyes of Gyroism",
				AttackEffect = "Slash",
				Addant = "The Arms of Gyroism",
				Bio = "For here in Gyroism, life gets cheaper,<br/>Here in Gyroism, blood runs deeper."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Green",
		Cost = { Neutral = 4, Green = 4 },
		Addant = "Cat's Eye Cultist",
		Effect = {
			Name = "Harassing Talons",
			Description = "When this card is cast: Give yourself a 600/600 Cat's Eye Cultist. You gain 800 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -800 },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "This is how I want to die."
	},
	["Cat's Eye Nexus"] = {
		Id = 6801087271,
		Name = "Cat's Eye Nexus",
		AltCards = {
			["Cupid's Eye Nexus"] = {
				Id = 4918973821,
				Name = "Cupid's Eye Nexus",
				Addant = "Cupid's Eye Heart Stealer",
				Bio = "With your heart, awaken your third eye! ... And your fourth. And the fifth... Sixth as well. Seventh if you're in the mood. Don't forget the eighth, either! Or the ninth."
			},
			["The Grand Yearning of Gyroism"] = {
				Id = 114032328178992,
				Name = "The Grand Yearning of Gyroism",
				AttackEffect = "Slash",
				Addant = "The Left and Right Eyes of Gyroism",
				Bio = "But I will resurrect that dream,<br/>Though rivers stream and hills grow steeper."
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 5 },
		Addant = "Cat's Eye Corpse Stealer",
		Overload = true,
		Effect = {
			Name = "Harassing Talons",
			Description = "When this card is cast: Give yourself an 800/800 Cat's Eye Corpse Stealer. Your opponent loses {W} and you gain {W}.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{ "Neutral", -1, "Opponent" },
				{ "Neutral", 1, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "With your chakra, awaken your third eye! ... And your fourth. And the fifth... Sixth as well. Seventh if you're in the mood. Don't forget the eighth, either! Or the ninth..."
	},
	["Cat's Eye, Master of Perception"] = {
		Id = 6801086670,
		Name = "Cat's Eye, Master of Perception",
		AltCards = {
			["Cupid's Eye, Master of Romance"] = {
				Name = "Cupid's Eye, Master of Romance",
				Id = 4899283447,
				Addant = "Cupid's Eye Nexus",
				Bio = "Beauty is in the love of the arrow."
			},
			["The Apex of Gyroism"] = {
				Id = 135864789447028,
				Name = "The Apex of Gyroism",
				Commissioner = { "Rayburn_89" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 679,
				Addant = "The Grand Yearning of Gyroism",
				Bio = "There was a dream - a dying ember,<br/>There was a dream - I don't remember."
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Green",
		Cost = { Neutral = 6, Green = 6 },
		Addant = "Cat's Eye Nexus",
		Overload = true,
		Effect = {
			Name = "Harassing Talons",
			Description = "When this card is cast: Give yourself a 1000/1000 Cat's Eye Nexus. Put a Colourless Stud into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{
					"AddGenZone",
					{ "Mark Stud", 1 },
					nil,
					nil,
					nil,
					nil,
					"BaseplateNeutral"
				}
			},
			Target = "Ally"
		},
		Bio = "Beauty is in the eye of the beholder."
	},
	["Glint of Perception"] = {
		Id = 105171601222534,
		Name = "Glint of Perception",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Terrain = true,
		Terrariant = "Cat's Eye Curate",
		AttackEffect = "Gravity",
		Archetype = "CatEye",
		Color = "Neutral",
		Cost = { Yellow = 2, Green = 2 },
		Addant = "Cat's Eye Nexus",
		CustomReminder = {
			Omniscience = "For example, giving yourself a common Cat's Eye searches your deck for a rare one."
		},
		Effect = {
			Name = "Harassing Talons",
			Description = "Once each turn, whenever an effect gives you a Cat's Eye: Search your deck for a Cat's Eye card 2 rarities above it. This card generates.",
			Ability = {
				OnAllyPut = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" }
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardIndexOriginal", "AddedCard" }
						},
						{
							"EVExactValueCheck",
							{ "CatEye", "CatAdded" },
							"Self"
						}
					},
					Target = "AggressorAddedCard",
					NoBlip = true
				},
				OnEVCheckPassCatAdded = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndexOriginal", "AddedCard" }
						},
						{
							"EVExactValueCheck",
							{ "Cat's Eye Winglet", "TokenCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Cat's Eye Wing Flock", "CommonCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Cat's Eye Cultist", "UncommonCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Cat's Eye Corpse Stealer", "RareCat" },
							"Self"
						},
						{ "Generate", 1, "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				},
				OnEVCheckPassTokenCat = {
					Power = { { "Tutorfor", "Cat's Eye Cultist" } },
					Target = "Ally"
				},
				OnEVCheckPassCommonCat = {
					Power = { { "Tutorfor", "Cat's Eye Corpse Stealer" } },
					Target = "Ally"
				},
				OnEVCheckPassUncommonCat = {
					Power = { { "Tutorfor", "Cat's Eye Nexus" } },
					Target = "Ally"
				},
				OnEVCheckPassRareCat = {
					Power = { { "Tutorfor", "Cat's Eye, Master of Perception" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Deception requires one to know the truth."
	},
	["Celestial of Moon"] = {
		Id = 6806015255,
		Name = "Celestial of Moon",
		AltCards = {
			celestial_reality = {
				Id = 6189904567,
				Name = "Celia",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "The absolute truths of the universe are not supposed to be defined. Defining things is what the mind does. The universe doesn't use the mind. Do not define yourself."
			},
			scorn = {
				Id = 75721989178359,
				Name = "scorn",
				PremiumArt = 864,
				Commissioner = { "Astrozizer" },
				AltArt = true,
				Bio = "\"Stick to the script\""
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Uncommon",
		Archetype = "Celestial",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: A target fighter gains 100 health. You gain 500 life for each allied Celestial.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "Single" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Archetype", "Celestial" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", -500, "Nil" }
				},
				{ "Cost", "Variable" }
			},
			Target = "Self"
		},
		Bio = "Flung far away from their homeworld, the Elysian Exclave is grateful that Robloxia has accepted them."
	},
	["Celestial of Sun"] = {
		Id = 6801089810,
		Name = "Celestial of Sun",
		AltCards = {
			["Lid The Cow Caster"] = {
				Id = 7945348022,
				Name = "Lid The Cow Caster",
				AttackEffect = "Divinity",
				AltArt = true,
				CopyBodge = "Lid The Cow Caster",
				Bio = "“This is only exactly half of the Power of the godly cow!”"
			},
			fawn = {
				Id = 124446270340888,
				Name = "fawn",
				PremiumArt = 857,
				Commissioner = { "Astrozizer" },
				AltArt = true,
				Bio = "\"You'll be fine\""
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Uncommon",
		Archetype = "Celestial",
		AttackEffect = "MagicGreen",
		EffectAnimation = "SmallMagicBlueEffect",
		Color = "Green",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: A target enemy fighter loses 100 Power. You gain 500 life for each allied Celestial.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100, "SingleEnemy" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Archetype", "Celestial" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", -500, "Nil" }
				},
				{ "Cost", "Variable" }
			},
			Target = "Self"
		},
		Bio = "Even so, they stare at the stars that spawned them, wistfully yearning to return."
	},
	["Celestials of Life and Death"] = {
		Id = 4784624708,
		Name = "Celestials of Life and Death",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Archetype = "Celestial",
		AttackEffect = "MagicGreen",
		EffectAnimation = "LargeMagicBlueEffect",
		Color = "Green",
		Cost = { Blue = 1, Green = 3 },
		EffectVariable = 0,
		Addant = "Celestial Remnant",
		CustomReminder = {
			["Celestial Remnant"] = "A {W}{W}{G}{B} 1000/100, inert in all zones. It gains Power equal to the amount of life you've gained this turn."
		},
		Effect = {
			Name = "Life fam",
			Description = "You gain 300 life.\nA target enemy fighter loses Power equal to the amount of life you've gained this turn.\nGive yourself a Celestial Remnant.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -300 },
				{
					"AlterEV",
					{ "Set", "Playertable", "LifeTaken", "Nil" },
					"Self"
				},
				{ "Weaken", "Variable", "SingleEnemy" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "\"They explode on death, catapulting their young across the planet. What sick god would create such a thing?\" - Dukran the Elysian"
	},
	["Celestials of Time and Space"] = {
		Id = 4784624917,
		Name = "Celestials of Time and Space",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Archetype = "Celestial",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3, Green = 1 },
		EffectVariable = 0,
		Addant = "Celestial Remnant",
		CustomReminder = {
			["Celestial Remnant"] = "A {W}{W}{G}{B} 1000/100, inert in all zones. It gains Power equal to the amount of life you've gained this turn."
		},
		Effect = {
			Name = "Disenervation",
			Description = "You may pay 5500 life to draw 4 cards. If you don't, you gain 1000 life and give yourself a Celestial Remnant.",
			Ability = {
				OnSummon = {
					Power = { {
						"ConfirmPrompt",
						{ "If you want to lose 5500 life to draw 4" },
						"Ally"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnConfirm = {
					Power = {
						{ "Cost", 5500 },
						{ "Draw", 4 }
					},
					Target = "Ally"
				},
				OnDeny = {
					Power = {
						{ "Cost", -1000 },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "A few Celestials manage to return to the heavens on their own. They often bring back souvenirs."
	},
	["Celestials of Chaos and Fate"] = {
		Id = 10184302017,
		Name = "Celestials of Chaos and Fate",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Archetype = "Celestial",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Blue = 3, Green = 3 },
		EffectVariable = 0,
		Addant = "Celestial Remnant",
		CustomReminder = {
			["Celestial Remnant"] = "A {W}{W}{G}{B} 1000/100, inert in all zones. It gains Power equal to the amount of life you've gained this turn."
		},
		Effect = {
			Name = "Life fam",
			Description = "You gain 1000 life.\nA target fighter gains haste. Return it to its hand.\nGive yourself a Celestial Remnant.\nFor each Celestial card in your hand, deal 100 damage to all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -1000 },
				{ "GivePassive", "Charge", "Single" },
				{ "Return", 30, "Single" },
				{ "Add", "Addant", "Ally" },
				{
					"AlterEV",
					{ "Set", "Hand_Ally", "Archetype", "Celestial" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 100, "Nil" }
				},
				{ "Damage", "Variable", "All" }
			},
			Target = "Self"
		},
		Bio = "One strives for a world with free will. The other strives for a world free from will."
	},
	["Celestials of Night and Day"] = {
		Id = 10184303584,
		Name = "Celestials of Night and Day",
		AltCards = {
			["UND JETZT WAS"] = {
				Id = 92871163640464,
				Name = "UND JETZT WAS",
				AttackEffect = "LinkedSword",
				Effect = {
					Name = "Life fam",
					Description = "Cast only if there are 10 or more Celestials in your graveyard.\nSummon the Celestials of Night and Day, each 1500/500 fighters.\nYou gain 2000 life.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Celestial of Night-UJW" },
						{ "Summon", "Celestial of Day-UJW" },
						{ "Cost", -2000 }
					},
					Target = "Ally"
				},
				AltArt = true,
				PremiumArt = 431,
				Bio = "#2 - And by love you mean, the love for creation? // Yes, but, I must distance myself from my form"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		Archetype = "Celestial",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Blue = 4, Green = 4 },
		Requirement = { "Archetype", "AllyGraveZone", 10, 9999, "Celestial" },
		CustomReminder = {
			["Cosmic Weave"] = "The Celestial of Night draws you card when your opponent loses life. The Celestial of Day does the same when you gain life."
		},
		Effect = {
			Name = "Life fam",
			Description = "Cast only if there are 10 or more Celestials in your graveyard.\nSummon the Celestials of Night and Day, each 1500/500 fighters.\nYou gain 2000 life.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Celestial of Night" },
				{ "Summon", "Celestial of Day" },
				{ "Cost", -2000 }
			},
			Target = "Ally"
		},
		Bio = "There were mixed responses to the Celestials losing their ancient spaceship."
	},
	["Celestial of Night"] = {
		Id = 6801089432,
		Name = "Celestial of Night",
		AltCards = {
			["Celestial of Night-UJW"] = {
				Name = "QUITE THE BREAK",
				AttackEffect = "Scratch",
				Id = 77643229755310,
				Bio = "#3 - But, why disappear and vanish? You would reach your end // Does the end really exist if you still live in people's head?"
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Token",
		Archetype = "Celestial",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 0 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever your opponent loses life: You draw a card. This card generates.",
			Type = "OnEnemyHealthLoss",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "Generate", 1 }
			},
			Target = "Self"
		},
		Bio = "Some Celestials mourned the past, and angered god at a chance to return to it."
	},
	["Celestial of Day"] = {
		Id = 6801088491,
		Name = "Celestial of Day",
		Health = 1500,
		Power = 500,
		Rarity = "Token",
		AltCards = {
			["Celestial of Day-UJW"] = {
				Name = "SYMPOSIUM",
				AttackEffect = "Scratch",
				Id = 74122869103134,
				Bio = "#4 - So, living to be able to live after death? I guess, thanks Blitz // My pleasure."
			}
		},
		Archetype = "Celestial",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 0 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you gain life: Your opponent loses 500 life. This card generates.",
			Type = "OnLifeGain",
			Power = {
				{ "Inflict", 500, "Opponent" },
				{ "Generate", 1 }
			},
			Target = "Self"
		},
		Bio = "But some Celestials loved the world they landed on, and swore to protect it as though it was their own."
	},
	["Celestial Remnant"] = {
		Id = 6801090251,
		Name = "Celestial Remnant",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		TokenOmni = true,
		Archetype = "Celestial",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 2, Green = 1, Blue = 1 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Life fam",
			Description = "Whenever this card attacks: Until its next end step, it gains Power equal to the amount of life you've gained this turn.",
			Type = "OnAttack",
			Power = {
				{
					"AlterEV",
					{ "Set", "Playertable", "LifeTaken", "Nil" }
				},
				{ "TempStrengthen", "Variable", "Self" }
			},
			Target = "Ally"
		},
		Bio = "\"...But Nibblex forgot. You cannot terminate all cockroaches, be they mundane or stellar.\" -Herrus's Journal, IV - The Starfall"
	},
	["Bee Drone"] = {
		Id = 8536853171,
		Name = "Basic Bee",
		AltCards = {
			["Bee Ninja"] = {
				Name = "Beebling",
				Id = 7652108161,
				AttackEffect = "MagicYellow",
				Bio = "The forbidden offspring of a place long forbidden."
			},
			Newbee = {
				Name = "Newbee",
				Id = 7652106582,
				AttackEffect = "Scratch",
				Bio = "Come on, guys! He's just a new bee, give him a break!"
			},
			["Kam, Cashier"] = {
				Id = 129811651650357,
				Name = "Kam, Cashier",
				PremiumArt = 340,
				AltArt = true,
				Bio = "\"...\" -Kam"
			}
		},
		Health = 450,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Bite",
		Archetype = "Bee",
		Color = "Blue",
		Cost = { Neutral = 2 },
		EffectVariable = 1,
		Effect = {
			Name = "Nerf",
			Description = "Once each turn, whenever you cast a Bee fighter: You gain {Y}.",
			Ability = {
				OnAllySummon = {
					Power = { { "EVExactValueCheck", 1 } },
					Target = "Self",
					NoBlip = true,
					Archetype = "Bee",
					SelfTrigger = true -- Basic Bee is a Bee too: casting it triggers its own effect (not when it has Stealth)
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
						{ "Yellow", 1 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "NOT THE BEE!!!"
	},
	Swarm = {
		Id = 8598241484,
		Name = "Honey Bee",
		AltCards = {
			MrBeeBee2 = {
				Name = "Zombee",
				CopyBodge = "MrBeeBee2",
				AttackEffect = "Scratch",
				Id = 6533851488,
				Bio = "Don't you hate it when you're a bee, then you just suddenly DIE from colony collapse disorder?"
			},
			["Veemo, Stock Clerk"] = {
				Id = 80145347910747,
				Name = "Veemo, Stock Clerk",
				PremiumArt = 335,
				AltArt = true,
				Bio = "\"Incredibly lucky the dress code is basically just a shirt.\" -Dimm"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bite",
		Archetype = "Bee",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		Effect = {
			Name = "Nerf",
			Description = "When this card is cast, if there's 2 or more allied Bees: Give yourself a Bee card.",
			Type = "OnSummon",
			Power = { { "RandomAdd", "Bee" } },
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 2, 999, "Bee" }
		},
		Bio = "A satisfied bee always full with the finest honey. If you're lucky it will share some."
	},
	Beehive = {
		Id = 8536851935,
		Name = "Bee Bear",
		AltCards = {
			IcyBee = {
				Name = "Zombee Cultist",
				AttackEffect = "MagicBlue",
				Id = 7652112338,
				Bio = "An alternate universe where the bees are making the humans endangered."
			},
			["Camellia, Human Resources"] = {
				Id = 84096287890634,
				Name = "Camellia, Human Resources",
				PremiumArt = 350,
				AltArt = true,
				Bio = "\"She really needs to go home.\" -Clover"
			}
		},
		Health = 650,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Archetype = "Bee",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Nerf",
			Description = "Whenever you cast a Bee: All allied Bees gain 50 health and Power.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 50, "AlliedArchetype" },
				{ "Strengthen", 50, "AlliedArchetype" }
			},
			Target = "Ally",
			Archetype = "Bee"
		},
		Bio = "This magical jolly bear is the bringer of Beesmas, the happiest time of the year for all bears and bees!"
	},
	Beekeeper = {
		Id = 8553609805,
		Name = "Beekeeper",
		AltCards = {
			Beestor = {
				Name = "Wild Windy Bee",
				AttackEffect = "Storm",
				CopyBodge = "Beestor",
				Id = 8589737980,
				Bio = "Windy bees are nature spirits with a fickle nature, they are as likely to cause tornadoes in the fields as they are to help the beekeepers with their pollen gathering"
			},
			["925"] = {
				Id = 132777881941547,
				Name = "925",
				PremiumArt = 353,
				AltArt = true,
				Bio = "\"Work harder, not smarter... That's what he said, right?\" - Yosuf"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Bee",
		Color = "Blue",
		Stealth = true,
		Cost = { Neutral = 3, Blue = 2, Yellow = 1 },
		Effect = {
			Name = "Nerf",
			Description = "Whenever you cast a Bee: Summon a copy of it.",
			Type = "OnAllySummon",
			Power = { { "SummonCopy", 30, "Aggressor" } },
			Target = "Ally",
			Archetype = "Bee"
		},
		Bio = "Beekeepers have the hardest job in the entire beeverse. But they're one of the most important."
	},
	["Beekeeper Token"] = {
		Id = 8553609805,
		Name = "Beekeeper",
		CopyBodge = "Beekeeper Token",
		AltCards = {
			["Beestor Token"] = {
				Name = "Wild Windy Bee",
				AttackEffect = "Storm",
				CopyBodge = "Beestor Token",
				Id = 8589737980,
				Bio = "Windy bees are nature spirits with a fickle nature, they are as likely to cause tornadoes in the fields as they are to help the beekeepers with their pollen gathering"
			}
		},
		Health = 300,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Bee",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Nerf",
			Description = "Whenever you cast a Bee: All other allied Bees gain 50 health and Power.",
			Type = "OnAllySummon",
			Archetype = "Bee",
			Power = {
				{ "Heal", 50, "AlliedArchetype" },
				{ "Strengthen", 50, "AlliedArchetype" },
				{ "Damage", 50, "Self" },
				{ "Weaken", 50, "Self" }
			},
			Target = "Aggressor"
		},
		Bio = "Beekeepers have the hardest job in the entire beeverse. But they're one of the most important."
	},
	["Queen Bee"] = {
		Id = 8598241916,
		Name = "Precise Bee",
		AltCards = {
			Beeskateer = {
				Name = "Beeboid King",
				CopyBodge = "Beeskateer",
				AttackEffect = "Gravity",
				Id = 7652109975,
				Bio = "According to all known laws of aviation, there is no way a bee should be able to fly. Its wings are too small to get its fat little body off the ground. The bee, of course, flies anyway because bees don't care what humans think is impossible. Yellow, black. Yellow, black. Yellow, black. Yellow, black. Ooh, black and yellow! Let's shake it up a little. Barry!"
			},
			["Clover, Nightshift"] = {
				Id = 76437217589933,
				Name = "Clover, Nightshift",
				PremiumArt = 348,
				AltArt = true,
				Bio = "\"The only one who DOESN'T flood me with paperwork.\" -Camellia"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "LaserRed",
		Archetype = "Bee",
		Color = "Blue",
		Cost = { Blue = 1, Yellow = 3 },
		Effect = {
			Name = "Nerf",
			Description = "Whenever you cast your second fighter each turn, if it's a Bee: Search your deck for a Bee card.",
			Type = "OnAllySummon",
			Power = { { "RandomTutorfor", "Bee", "Ally" } },
			Target = "Ally",
			Archetype = "Bee",
			EffectRequirement = { "Playertable", "Me", 2, 3, "Fighters" }
		},
		Bio = "This sharpshooting bee is always on point and expects the same of you."
	},
	["True Hivemind"] = {
		Id = 8542091708,
		Name = "Honeystorm!",
		AltCards = {
			["Tom's Bees"] = {
				Name = "Tom's Bees",
				Id = 5650585685,
				Bio = "What do you mean someone took a can of beans and shoved tons of bees in it?"
			},
			["MyrmiredonV2 3"] = {
				Name = "Mass Epbeedemic",
				Id = 5650864081,
				Bio = "You may ask why there are two alt arts of \"Honeystorm!\". The reason: IcyTea getting chased by a giant bee was funny to Blitzwolfer."
			},
			["Honeystorm-PC"] = {
				Name = "Mythic Meteor Shower",
				Id = 11346642064,
				PackDisplayOverride = "Group Precon: Bees",
				Bio = "[ ☄️ The Playerbase's Collective Anger at Quest Difficulty has summoned a Mythic Meteor Shower! ☄️ ]"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Archetype = "Bee",
		Color = "Yellow",
		Cost = { Blue = 4, Yellow = 4 },
		AlternateCost = { Neutral = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 8, 9999, "Bee" },
		EffectAnimation = "Honeystorm",
		Effect = {
			Name = "NERF BEES",
			Description = "If there's 8 allied Bees, cast this card for free.\nAll allied Bees gain 300 health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 300 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "You think it is all over? No, it has only just beegun."
	},
	["Bucket of Bees"] = {
		Id = 8542088712,
		Name = "Vicious Bee",
		AltCards = {
			["Fish, Security"] = {
				Id = 96398208335929,
				Name = "Fish, Security",
				PremiumArt = 344,
				AltArt = true,
				Bio = "\"Why does a gas station need security?\" - Veemo"
			}
		},
		Health = 50,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Bite",
		Color = "Yellow",
		Archetype = "Bee",
		Cost = { Neutral = 1, Blue = 1 },
		Charge = true,
		SummonAnimation = "BeeV",
		EffectVariable = 1,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Once each turn, whenever an enemy fighter dies: Search your deck for a Bee card.",
			Target = "Ally",
			Ability = {
				OnEnemyDeath = {
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
						{ "RandomTutorfor", "Bee" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Bees flap their wings 230 times a second, creating a large displacement field that they sit on. This is how bees fly.\n- Sword Critic"
	},
	CalmFoxz = {
		Id = 8582491255,
		Name = "CalmFoxz",
		AltCards = {
			["Cub Buddies"] = {
				Name = "Cub Buddies",
				CopyBodge = "Cub Buddies",
				AttackEffect = "Scratch",
				Id = 8569392792,
				Bio = "The best buddy any Beekeeper could ask for."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		EffectAnimation = "MidMagicYellowEffect",
		Color = "Blue",
		Archetype = "Bee",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Helping Out",
			Description = "Whenever you cast your second fighter each turn, if it's a Bee: A target fighter loses 200 Power.",
			Type = "OnAllySummon",
			Power = { { "Weaken", 200 } },
			Target = "Single",
			Archetype = "Bee",
			EffectRequirement = { "Playertable", "Me", 2, 3, "Fighters" }
		},
		Bio = "He really is the bee's knees."
	},
	Onett = {
		Id = 6731340869,
		Name = "Onett",
		AltCards = {
			Pinnyking = {
				Id = 7149184242,
				Name = "Pinnyking",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "Flowers bloom and fall, and a year goes by."
			},
			["Error, Truth Seeker"] = {
				Id = 133850496218917,
				Name = "Error, Truth Seeker",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = ""
			},
			["Dimm, Manager"] = {
				Id = 137231417504562,
				Name = "Dimm, Manager",
				PremiumArt = 346,
				AltArt = true,
				Bio = "\"Does this guy actually know how a gas station works?\" - Fish"
			}
		},
		Health = 100,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Yellow",
		Archetype = "Bee",
		Cost = { Yellow = 5, Neutral = 1 },
		EffectVariable = 0,
		EffectAnimation = "BeeL",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All allied Bees gain 50 health and Power for each allied Bee fighter.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Archetype", "Bee" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Heal", "Variable", "AlliedArchetype" },
				{ "Strengthen", "Variable", "AlliedArchetype" }
			},
			Target = "Self"
		},
		Bio = "Here comes the Honeystorm!"
	},
	GiottoBee = {
		Id = 6780710875,
		Name = "Beatrix, The Bee Cadet",
		AltCards = {
			["Mondo Chick"] = {
				Name = "Mondo Chick",
				CopyBodge = "Mondo Chick",
				AttackEffect = "MagicYellow",
				Id = 8569384370,
				Bio = "They're a tough egg to crack."
			}
		},
		CopyBodge = "GiottoBee",
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Hammer",
		Archetype = "Bee",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Name = "Guard",
			Description = "When this card is cast, if there's 3 or more allied Bees: Summon a Bee fighter as though it was cast.",
			Type = "OnSummon",
			Power = { {
				"RandomSummonWithEffect",
				{
					"Swarm",
					"Beehive",
					"Beekeeper",
					"Queen Bee",
					"Bucket of Bees",
					"CalmFoxz"
				}
			} },
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 3, 999, "Bee" }
		},
		Bio = "A shy but hard working bee."
	},
	["Froot Ninja"] = {
		Id = 6801095600,
		Name = "Froot Ninja",
		AltCards = {
			["Froot Ninja-Sun"] = {
				Id = 7159099721,
				CopyBodge = "Froot Ninja-Sun",
				Name = "Froot Smoothie Ninja",
				Bio = "How does one milk a coconut? Until science answers that, Froot Ninja will keep slicing them."
			}
		},
		Health = 250,
		Power = 50,
		Rarity = "Uncommon",
		AttackEffect = "RedKatana",
		Archetype = "Ninja",
		Color = "Blue",
		Cost = { Red = 1, Blue = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "NinjaBuff",
		Effect = {
			Name = "Citrus Punch",
			Description = "Whenever you cast a Ninja fighter: A target fighter gains 200 Power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 200, "Single" } },
			Target = "Single",
			Archetype = "Ninja"
		},
		Bio = "He tests his blades on watermelons and walnuts. That's practically familicide."
	},
	BlazerC = {
		Id = 6801083680,
		Name = "BlazerC",
		AltCards = {
			BlazerCV2 = {
				Id = 6858749513,
				CopyBodge = "BlazerCV2",
				EffectAnimation = "BlazerCEffectAlt",
				AttackEffect = "BlueKatana",
				Bio = "Demon Ninja."
			},
			["BlazerC-Sun"] = {
				Id = 9197543455,
				Name = "Remilia, Scarlet Devil Master",
				AttackEffect = "Whirlpool",
				Bio = "The Scarlet Devil wields Gungnir while surfing. Perhaps she is hunting for sharks?"
			},
			j4gu4r_410 = {
				Id = 98943573020382,
				Name = "j4gu4r_410",
				AttackEffect = "Katana",
				AltArt = true,
				Bio = "Where there is light, there must be shadow, and where there is shadow there must be light. There is no shadow without light and no light without shadow."
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "RedKatana",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "BlazerCEffect",
		Effect = {
			Name = "Blazing Up!",
			Description = "When this card is cast: All allied Ninja gain 300 Power until the next end step.",
			Type = "OnSummon",
			Power = "TempStrengthen",
			Target = "AlliedArchetype",
			Increase = 300
		},
		Bio = "There really wasn't a huge market for chicken blazers as ovens and microwaves came into the market, so BlazerC became a ninja instead."
	},
	Ninja = {
		Id = 9964854787,
		Name = "Ninja",
		AltCards = {
			["Ninja-Sun"] = {
				Id = 9197536099,
				Name = "Scarlet Fairy Maids",
				AttackEffect = "MagicRed",
				Addant = "Grandmaster's Ninja Dojo-Sun",
				Bio = "Even on a summer vacation, they still have to tend to their master."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		CustomReminder = {
			["Grandmaster's Ninja Dojo"] = "A {W}{W}{R}{B} Terrain. It unlocks allied ninjas, and returns allied fighters whenever an enemy fighter dies."
		},
		Addant = "Grandmaster's Ninja Dojo",
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: Give yourself 'Grandmaster's Ninja Dojo.'",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "Ninjas actually wore a dark-blue, not pure black. This prevented moonlight from exposing them."
	},
	["Ninja Elite"] = {
		Id = 6858727860,
		Name = "Ninja Elite",
		AltCards = {
			["Ninja Elite-ArtV"] = {
				Id = 8475215088,
				Name = "Arashi Pikeman",
				Bio = "They're known as the tempest for a reason."
			},
			["Ninja Elite-Sun"] = {
				Id = 9197541092,
				Name = "Patchouli, Scarlet Witch",
				AttackEffect = "MagicRed",
				Bio = "Despite her medical condition, she still went on a vacation. However, she stays in the vacation home instead of going to play. Good for her."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Kunai",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Red = 2 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast, if there's 2 or more Ninja cards in your Baseplate: It deals 200 damage to a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "SingleEnemy", nil, nil, "KunaiThrow" } },
			Target = "NotArchetype",
			EffectRequirement = { "Archetype", "AllyGenZone", 2, 999999, "Ninja" }
		},
		Bio = "Ninjas were only ever around 5 feet tall. Any higher would make it hard to be maneuverable."
	},
	["Ninja Trainee"] = {
		Id = 6858728551,
		Name = "Ninja Trainee",
		AltCards = {
			["Ninja Trainee-Sun"] = {
				Id = 9197537414,
				Name = "Hong, Lazy Scarlet Gatekeeper",
				AttackEffect = "MagicRed",
				Addant = "Grandmaster's Ninja Dojo-Sun",
				Bio = "The ever laidback gatekeeper. Seems like the head maid won't tolerate this laziness anymore."
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Kunai",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Red = 1, Blue = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaCall",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Search your deck for a Ninja card.",
			Type = "OnSummon",
			Power = { { "RandomTutorfor", "Ninja" } },
			Target = "Ally"
		},
		Bio = "During Sengoku Jidai, Samurai were all complete backstabbers. The only truly loyal were ninjas."
	},
	["Grandmaster's Ninja Dojo"] = {
		Id = 4783049204,
		Name = "Grandmaster's Ninja Dojo",
		AltCards = {
			["Grandmaster's Ninja Dojo-Sun"] = {
				Name = "Scarlet Vacation Getaway",
				Id = 10186398019,
				Terrariant = "Ninja Sun Terrain",
				Bio = "A nice and spacious house near the seaside. The scarlet crew always go on vacation here during the summer."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Ninja",
		Terrain = true,
		Terrariant = "Ninja Terrain",
		Field = 295562634,
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 1, Blue = 1 },
		Requirement = { "Archetype", "AllyGenZone", 2, 999999, "Ninja" },
		CustomReminder = {
			["Genju Speedwagon"] = "Cast 'Living World' to animate this as a 1100/200 that copies Ninja fighters you cast."
		},
		Effect = {
			Name = "Stud",
			Description = "Cast only if there's 2 or more Ninja cards in your baseplate.\nWhenever you cast a Ninja fighter: Unlock it.\nOnce during each of your turns, whenever an enemy fighter dies: You may select an allied fighter. Return it to its hand.",
			Ability = {
				OnAllySummon = {
					Power = { { "Unlock", 9999, "Aggressor" } },
					Target = "Aggressor",
					Archetype = "Ninja"
				},
				OnEnemyDeath = {
					Power = { { "Return" } },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_Field" },
						Condition = {},
						SelectionDescription = "A fighter to return to hand",
						MinTargets = 0,
						MaxTargets = 1
					},
					TurnTriggerLimit = 1,
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				}
			}
		},
		Bio = "The apex of all Dojos, providing both adept acceleration of mental and physical skill."
	},
	["Ninja Assailant"] = {
		Id = 9964855389,
		Name = "Ninja Assailant",
		AltCards = {
			["Ninja Assailant-Sun"] = {
				Id = 9197540156,
				Name = "Scarlet Fairy Chef",
				AttackEffect = "Blaze",
				Bio = "Trained under Izayoi, this lone fairy cooks for the entire vacation group. Although, the fairy doesn't know where its fishing pole went, so now it has to buy fish from the supermarket instead of fishing from the ocean."
			}
		},
		Health = 100,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Kunai",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Blue = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "SmokescreenAlly",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: All allied Ninja gain 100 health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "AlliedArchetype",
			Increase = 100
		},
		Bio = "Ninjas very rarely killed people, as they were all mostly spies."
	},
	["Ninja Combatant"] = {
		Id = 6858743295,
		Name = "Ninja Combatant",
		AltCards = {
			zec63 = {
				Id = 7776932205,
				Name = "zec63",
				AltArt = true,
				Bio = "Leading the team to success."
			},
			["Ninja Combatant-Sun"] = {
				Id = 9197541715,
				Name = "Koakuma, Scarlet Helper ",
				AttackEffect = "MagicRed",
				Bio = "The personal assistant of Patchouli, Koakuma helps Patchouli with managing and carrying books for her in the vacation home."
			},
			["Ninja Combatant-RaidAct1"] = {
				Id = 117370588004193,
				Name = "xxshadowslayerxx",
				AttackEffect = "Katana",
				Bio = "\"Think you can take on my shadow clone technique? Think again!\" *throws 50 kunais at you*"
			}
		},
		Health = 400,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Katana",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3, Blue = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "SmokescreenAlly",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: All allied Ninja gain 100 health and 200 Power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 200 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "In order to protect the secrets of ninjutsu, families only passed down their knowledge to their children. They would begin teaching children skills at a young age by playing games."
	},
	Snowskateer = {
		Id = 6858737209,
		Name = "Snowskateer",
		AltCards = {
			["Snowskateer-Sun"] = {
				Name = "Skateskateer",
				Id = 7280386750,
				Bio = "In a gleeful act of self defence, Skateskateer brutally flayed the flesh of his father and used it to adorn his skateboard. He then skated across torrential peril to an ancient ninja monastery.",
				Summonant = "Snowskateer-Sun"
			},
			["Rumia, Youkai of the Darkness"] = {
				Id = 114561416049709,
				Name = "Rumia, Youkai of the Darkness",
				PremiumArt = 856,
				AttackEffect = "IcePunch",
				Summonant = "Rumia, Youkai of the Darkness",
				Commissioner = { "_unknown_user_" },
				AltArt = true,
				Bio = "\"Is that so?"
			},
			["Snowskateer-Alt"] = {
				Id = 5542433932,
				CopyBodge = "Snowskateer-Alt",
				AttackEffect = "IcePunch",
				AltArt = true,
				Bio = "So good we had to do it again.",
				Summonant = "Snowskateer-Alt"
			}
		},
		Health = 100,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Kunai",
		Archetype = "Ninja",
		Color = "Blue",
		Cost = { Neutral = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaBuff",
		Summonant = "Snowskateer",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Summon a copy of it that's inert in play.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			MetaData = { Token = true }
		},
		Bio = "Snow is such a ninja you wouldn't have been able to tell he counts as a ninja without reading this."
	},
	["Ninja Ambush"] = {
		Id = 6464466828,
		Name = "Ninja Ambush",
		AltCards = {
			["Ninja Ambush-Sun"] = {
				Id = 9208860660,
				Name = "Scarlet Fog Incident",
				Bio = " In order for Flandre to walk out during the day, Remilia must obscure the sun with a thick scarlet fog. Had she known of sunscreen, she wouldn't have done this."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Null",
		Color = "Red",
		Cost = { Red = 3 },
		Archetype = "Ninja",
		Bio = "They make for valuable moving target practice.",
		Effect = {
			Name = "Ninja Stars!",
			Description = "Return all allied ninja to their hand.\nDeal 300 damage to all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Return", 300, "AlliedArchetype" },
				{ "Damage", 300, "All" }
			},
			Target = "All"
		}
	},
	One_Thousand_Deaths = {
		Id = 10217675987,
		Name = "\"One Thousand Deaths\"",
		AltCards = {
			["Keeler1's Wrath"] = {
				Name = "Keeler1's Wrath",
				Id = 5135804439,
				AltArt = true,
				Bio = "It's in the game now. Are you god damn happy?"
			},
			Connor_King88 = {
				Id = 8122071932,
				AltArt = true,
				Name = "Connor_King88",
				Bio = "A dangerous disease requires a desperate remedy."
			},
			["One_Thousand_Deaths-Sun"] = {
				Id = 9208860008,
				Name = "Flandre, Sister Scarlet Devil",
				AttackEffect = "Flare",
				Bio = "Seems like after the Scarlet Fog has settled in, the Sister wants to play. However, be careful as she might obliterate your existence accidently."
			},
			["One_Thousand_Deaths-Precon"] = {
				Id = 16361235069,
				Name = "Fuma Kotaro, Master of Mayhem",
				AttackEffect = "Katana",
				Bio = "A man falls at the behest of the shogun. I reject his command."
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "Katana",
		Color = "Red",
		Archetype = "Ninja",
		Charge = true,
		Cost = { Red = 3, Blue = 1 },
		EffectAnimation = "ThousandDeaths",
		StrengthenImmune = true,
		Effect = {
			Name = "HURT ALL THE THINGS",
			Description = "Whenever this card attacks and destroys another: All allied Ninja fighters in play and in your hand gain 300 Power. Return this card to its hand.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Strengthen", 300 },
				{ "ArchetypeHandStrengthen", 300, "Ally" },
				{
					"Return",
					999,
					"Self",
					nil,
					nil,
					nil,
					"NinjaCall"
				}
			},
			Target = "AlliedArchetype"
		},
		Bio = "Found by a thousand people, seen by only one."
	},
	WhiteScarf = {
		Id = 6854804074,
		Name = "WhiteScarf",
		AltCards = {
			["WhiteScarf-Sun"] = {
				Id = 9197539686,
				AttackEffect = "Scratch",
				Name = "Izayoi, Scarlet Head Maid",
				Bio = "Even the servants have a master that serves their master. However, it's more like a manager job than anything. "
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Archetype = "Ninja",
		Cost = { Neutral = 1, Red = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaBuff",
		LockImmune = true,
		Effect = {
			Name = "Stud",
			Description = "",
			Type = "Null",
			Power = { { "Unlock", 9999 } },
			Target = "Self"
		},
		Bio = "It's a JUXTAPOSITION, CAROL. DO YOU NOT GET IT?"
	},
	Bloo = {
		Id = 6858730410,
		Name = "NinjaBluz",
		AltCards = {
			["NinjaBluz-Sun"] = {
				Id = 9197542433,
				Name = "Chiruno, Ice Fairy of Getaway",
				AttackEffect = "Ice",
				Bio = "She was an uninvited guest."
			},
			["Detective Finn Fukushima"] = {
				Id = 14192419695,
				Name = "Detective Finn Fukushima",
				AttackEffect = "Gun",
				Bio = "BARIAR DU PONT - \"So you're giving me another shot? It's only been my first offense -- so sorry.\"\n\n\t\t\t\tFINN FUKUSHIMA - \"This is your first offense you say? This isn't a game and you're not the hero. You don't get infinite chances to do the right thing. That's not how the world works.\""
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Blue = 3 },
		Addant = "Red Titanic Stud",
		Archetype = "Ninja",
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Tranquilize",
			Description = "When this card is cast: Lock a target fighter for 1 turn. Give yourself a Red Titanic Stud.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant", "Ally" },
				{ "Lock", 1 }
			},
			Target = "Single"
		},
		Bio = "He's not an imaginary friend, but his codename is feared by operatives of a whole LEAGUE of sectors."
	},
	["Alar Myrmidon"] = {
		Id = 9964695771,
		Name = "Alar Myrmidon",
		AltCards = {
			["Alar Myrmidon-C"] = {
				Id = 9964696755,
				Name = "Saint Sanctioneer",
				AttackEffect = "Divinity",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Sanction.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Summons-C" } },
					Target = "Ally",
					Bio = "Those that fulfill the will of the heavens."
				}
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		Archetype = "Alar",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2, Green = 1 },
		CustomReminder = {
			["Splintered Summons"] = "A 2{W}{R} action, inert in all zones, that draws a card. It costs 2{R} if there's 2 or more allied Alar Knights."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Summons.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Summons" } },
			Target = "Ally"
		},
		Bio = "Dukran has left, looking to gather all the different tribe leaders to rescue the kidnapped Celestial."
	},
	["Splintered Summons"] = {
		Id = 9964697265,
		Name = "Splintered Summons",
		AltCards = {
			["Splintered Summons-C"] = {
				Id = 9964697892,
				Name = "Divine Sanction",
				Bio = "Will you go away now, please?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Alar" },
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Alar Knights.\nDraw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Man met aether, and aether found sword."
	},
	["Alar Sentinel"] = {
		Id = 6801052620,
		Name = "Alar Sentinel",
		AltCards = {
			["Alar Sentinel-C"] = {
				Id = 8256322178,
				Name = "Saint Cleric",
				AttackEffect = "Divinity",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Water.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Blessing-C" } },
					Target = "Ally"
				},
				Bio = "Don't worry, he can only move diagonally. I think."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Green = 2 },
		CustomReminder = {
			["Splintered Blessing"] = "A {W}{W}{G}{G} action, inert in all zones, that has all allied Alars gain 300 health. It costs 2{G} if you have 2 or more Alar Knights."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Blessing.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Blessing" } },
			Target = "Ally"
		},
		Bio = "\"The Titans ravage our land, both by themselves and by those tempted by their titanic Power. We won't just watch.\""
	},
	["Splintered Blessing"] = {
		Id = 4960553317,
		Name = "Splintered Blessing",
		AltCards = {
			["Splintered Blessing-C"] = {
				Id = 8256322857,
				Name = "Divine Water",
				Bio = "Clears away both sins and the contents of your stomach when ingested."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Alar" },
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Alar Knights.\nAll allied Alar Knights gain 300 health.",
			Type = "OnSummon",
			Power = { { "Heal", 300, "AlliedArchetype" } },
			Target = "Ally"
		},
		Bio = "Man met aether, and aether found spirit."
	},
	["Alar Blade Archer"] = {
		Id = 6801080301,
		Name = "Alar Blade Archer",
		AltCards = {
			["Alar Blade Archer-C"] = {
				Id = 8256324451,
				Name = "Saint Bellringer",
				AttackEffect = "Divinity",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Bell.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Limbs-C" } },
					Target = "Ally"
				},
				Bio = "Ding~"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		Archetype = "Alar",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 1, Green = 3, Red = 3 },
		CustomReminder = {
			["Splintered Limbs"] = "A 2{W} action, inert in all zones, that summons a rare Alar Knight and has all allied Alar Knights gain 100 Power."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Limbs.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Limbs" } },
			Target = "Ally"
		},
		Bio = "The Alar Knights are infamous for their floating swords, used for weaponry, transport, and archery."
	},
	["Splintered Limbs"] = {
		Id = 9302943060,
		Name = "Splintered Limbs",
		AltCards = {
			["Splintered Limbs-C"] = {
				Id = 9302945659,
				Name = "Divine Bell",
				Effect = {
					Name = "Poisonous Touch",
					Description = "Summon a Saint Nun or a Saint Herald.\nAll allied Alar Knights gain 100 Power.",
					Type = "OnSummon",
					Power = {
						{
							"RandomSummon",
							{ "Alar Trainee-C", "Alar Herald-C" }
						},
						{ "Strengthen", 100, "AlliedArchetype" }
					},
					Target = "Ally"
				},
				Bio = "The bell calls the followers of Saint Dukran forth."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2 },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Summon a Alar Herald or Alar Trainee.\nAll allied Alar Knights gain 100 Power.",
			Type = "OnSummon",
			Power = {
				{
					"RandomSummon",
					{ "Alar Trainee", "Alar Herald" }
				},
				{ "Strengthen", 100, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "Man met aether, and aether found servants."
	},
	["Alar Blade Chaser"] = {
		Id = 6801051981,
		Name = "Alar Blade Chaser",
		AltCards = {
			["Alar Blade Chaser-C"] = {
				Id = 8251847912,
				Name = "Saint Paladin",
				AttackEffect = "Harbinger",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Smite.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Slice-C" } },
					Target = "Ally"
				},
				Bio = "As Dukran wills it."
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		Archetype = "Alar",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3, Red = 3 },
		CustomReminder = {
			["Splintered Slice"] = "A 2{W}{R}{G} action, inert in all zones, that deals 600 damage to a target fighter. It costs 2{W} if there's 2 or more allied Alar Knights."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Slice.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Slice" } },
			Target = "Ally"
		},
		Bio = "The Alar Knights are infamous for their floating swords, capable of impaling someone a mile away several times over."
	},
	["Splintered Slice"] = {
		Id = 4960464614,
		Name = "Splintered Slice",
		AltCards = {
			["Splintered Slice-C"] = {
				Id = 8251849269,
				Name = "Divine Smite",
				Bio = "BY DUKRAN'S LIGHT I SMITE YOU!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Red = 2, Green = 2 },
		AlternateCost = {
			IgnoreColor = { "Red", "Green", "Blue", "Yellow" }
		},
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Alar" },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Cast this card ignoring its {R}{G} cost if there's 2 or more allied Alar Knights.\nDeal 600 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 600, "Single" } },
			Target = "Ally"
		},
		Bio = "Man met aether, and aether found death."
	},
	["Alar Herald"] = {
		Id = 6801080645,
		Name = "Alar Herald",
		AltCards = {
			["Alar Herald-C"] = {
				Id = 8251843791,
				Name = "Saint Herald",
				AttackEffect = "Divinity",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Bible.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Energy-C" } },
					Target = "Ally"
				},
				Bio = "Excuse me sir, do you have a moment to talk about our Lord and Savior, Jesus Christ?"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Rare",
		Archetype = "Alar",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 2 },
		CustomReminder = {
			["Splintered Energy"] = "A 2{W}{R} action, inert in all zones, that puts a Green Stud into your baseplate. It costs 2{R} if there's 2 or more allied Alar Knights."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Energy.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Energy" } },
			Target = "Ally"
		},
		Bio = "The Ninjas are helpless in the air. Many skirmishes are won simply by the Heralds stating their presence."
	},
	["Splintered Energy"] = {
		Id = 5947360409,
		Name = "Splintered Energy",
		AltCards = {
			["Splintered Energy-C"] = {
				Id = 8251845040,
				Name = "Divine Bible",
				Bio = "Does this count as fanfiction?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Red = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Alar" },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Alar Knights.\nPut a Green Stud into your baseplate.",
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
		Bio = "Man met aether, and aether found vitality."
	},
	["Alar Trainee"] = {
		Id = 6801081386,
		Name = "Alar Trainee",
		AltCards = {
			["Alar Trainee-C"] = {
				Id = 8251845871,
				Name = "Saint Nun",
				AttackEffect = "Divinity",
				Effect = {
					Name = "Poisonous Touch",
					Description = "When this card is cast: Give yourself Divine Prayer.",
					Type = "OnSummon",
					Power = { { "Add", "Splintered Embers-C" } },
					Target = "Ally"
				},
				Bio = "Devout to the church and to those in need."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Rare",
		Archetype = "Alar",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2 },
		CustomReminder = {
			["Splintered Embers"] = "A 2{W}{G} action, inert in all zones, that puts a Red Stud into your baseplate. It costs 2{G} if there's 2 or more allied Alar Knights."
		},
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Give yourself Splintered Embers.",
			Type = "OnSummon",
			Power = { { "Add", "Splintered Embers" } },
			Target = "Ally"
		},
		Bio = "I'll ascend just like Dukran did. Just you wait!"
	},
	["Splintered Embers"] = {
		Id = 5947361753,
		Name = "Sptlintered Embers",
		AltCards = {
			["Splintered Embers-C"] = {
				Id = 8251846953,
				Name = "Divine Prayer",
				Bio = "Faith carries Power within."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2, Green = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Alar" },
		TokenDiscard = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Cast this card ignoring its {W} cost if there's 2 or more allied Alar Knights.\nPut a Red Stud into your baseplate.",
			Type = "OnSummon",
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
		Bio = "Man met aether, and aether found dominion."
	},
	["Dukran the Celestial"] = {
		Id = 10184547144,
		Name = "Dukran the Elysian",
		AltCards = {
			["Dukran-T"] = {
				Id = 10184536891,
				Name = "Dukran the Celestial",
				Summonant = "Dukran2-T"
			},
			["Dukran the Celestial-C"] = {
				Id = 8251841843,
				Name = "Saint Dukran",
				Summonant = "Dukran-C",
				Addant = "Splintered Genesis-C",
				Effect = {
					Description = "This card costs {W} less for each allied Alar in play and your baseplate.\nWhen this card is cast: Give yourself Splintered Genesis and recur 4 allied Alar action cards.\nDuring your end step: Summon either an Alar Trainee or an Alar Herald.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Addant" },
								{
									"MoveZone",
									{ "Alar_Action", "GraveZone_Ally", "Hand_Ally", true, false, 4 },
									"Self"
								}
							},
							Target = "Ally",
							TargetParameters = {
								Zones = { "Ally_GraveZone" },
								Condition = { "Action", "Archetype" },
								Modifier = "Alar",
								SubModifier = true
							}
						},
						OnEnd = {
							Power = { {
								"RandomSummon",
								{ "Alar Trainee-C", "Alar Herald-C" }
							} },
							Target = "Self",
							DontTriggerInHand = true
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
									{ "Set", "Field_Ally", "Archetype", "Alar" }
								},
								{
									"AlterEV",
									{ "Add", "GenZone_Ally", "Archetype", "Alar" }
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
				}
			},
			["Dukran the Almighty"] = {
				Id = 10184543488,
				Name = "Dukran the Almighty",
				Summonant = "Dukran the Almighty-T"
			},
			["Dukran-Precon"] = { Id = 16582213851, Name = "Dukran" },
			["Aoka, Drakesbane"] = {
				Id = 133001161356781,
				Name = "Aoka, Drakesbane",
				Summonant = "Aoka, Drakesbane-T",
				Addant = "Splintered Genesis-Aoka",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 658,
				Bio = "“Y’know it's a bit funny isn't it? She's a DRAGON PERSON and her job is to help kill DRAGONS!! I don’t know, it just seems kinda messed up to me.”"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Legendary",
		Archetype = "Alar",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Summonant = "Dukran2",
		Addant = "Splintered Genesis",
		TriggerInHand = true,
		CustomReminder = {
			["Splintered Genesis"] = "A 2{W} 5{R}{G} action, inert in all zones. It sets the health and Power of all enemy fighters to 50 and has your opponent lose all their {W}."
		},
		Effect = {
			Description = "This card costs {W} less for each allied Alar in play and your baseplate.\nWhen this card is cast: Give yourself Splintered Genesis and recur 4 allied Alar action cards.\nDuring your end step: Summon either an Alar Knight or an Alar Herald.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{
							"MoveZone",
							{ "Alar_Action", "GraveZone_Ally", "Hand_Ally", true, false, 4 },
							"Self"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "Action", "Archetype" },
						Modifier = "Alar",
						SubModifier = true
					}
				},
				OnEnd = {
					Power = { {
						"RandomSummon",
						{ "Alar Trainee", "Alar Herald" }
					} },
					Target = "Self",
					DontTriggerInHand = true
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
							{ "Set", "Field_Ally", "Archetype", "Alar" }
						},
						{
							"AlterEV",
							{ "Add", "GenZone_Ally", "Archetype", "Alar" }
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
		Bio = "The saviour of noobkind and celestials alike deceived god, and thus bore the original sin of god."
	},
	["Splintered Genesis"] = {
		Id = 9302946929,
		Name = "Splintered Genesis",
		AltCards = {
			["Splintered Genesis-C"] = { Id = 10184429046, Name = "Divine Compelment" },
			["Splintered Genesis-Aoka"] = {
				Id = 97573510601925,
				Name = "Dance of the Dragons",
				Bio = "\"Oh woah hey co- ARE THOSE 2 DRAGONS?! WHY ARE THEY COMING TOWARDS ME AAAAAAAAAAAA-”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 5, Green = 5 },
		ObliterateOnCast = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Set the health and Power of all enemy fighters to 50.\nYour opponent loses all their {W}.\nObliterate this card.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 50 },
				{ "SetPower", 50 },
				{ "SetNeutral", 0 },
				{ "Obliterate", 30, "Self" }
			},
			Target = "Opponent"
		},
		Bio = "Man met aether. He regretted it."
	},
	["Aether Tamer"] = {
		Id = 11716368333,
		Name = "Aether Tamer",
		AltCards = {
			["Aether Tamer-C"] = {
				Id = 11674989425,
				Name = "Saint Shepherd",
				AttackEffect = "Divinity",
				Summonant = "Alar Mount-C",
				Bio = ""
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Archetype = "Alar",
		Cost = { Green = 2, Red = 1, Neutral = 2 },
		EffectVariable = 0,
		Summonant = "Alar Mount",
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, or whenever you cast an Alar action card: Summon a 400/300 Alar Mount that's inert in all zones.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self"
				},
				OnAllyCast = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self",
					Archetype = "Alar"
				}
			}
		},
		Bio = "In the hunt for the Alpha Brick, all of Robloxia's creatures, large and small, lent their aid."
	},
	["Alar Mount"] = {
		Id = 11716368560,
		Name = "Alar Mount",
		AltCards = {
			["Alar Mount-C"] = {
				Id = 11674996126,
				Name = "Divine Sheep",
				AttackEffect = "Divinity",
				Bio = ""
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		TokenOmni = true,
		Archetype = "Alar",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Null = {
					Power = { { "Draw", 0, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "Reach the Heavens through prehistoric means."
	},
	Dukran2 = {
		Id = 6801094759,
		Name = "Dukran the Elysian",
		CopyBodge = "Dukran2",
		AltCards = {
			["Dukran2-T"] = { Id = 10184538744, Name = "Dukran the Celestial", Bio = "" },
			["Dukran the Almighty-T"] = { Id = 10184546075, Name = "Dukran the Almighty" },
			["Dukran-C"] = {
				Name = "Saint Dukran",
				AttackEffect = "Divinity",
				Id = 8251841843,
				Effect = {
					Name = "Poisonous Touch",
					Description = "During your end step: Summon either a Saint Nun or Saint Herald.",
					Type = "OnEnd",
					Power = { {
						"RandomSummon",
						{ "Alar Trainee-C", "Alar Herald-C" }
					} },
					Target = "Ally"
				}
			},
			["Aoka, Drakesbane-T"] = {
				Id = 133001161356781,
				Name = "Aoka, Drakesbane",
				AttackEffect = "Slash",
				Bio = "“Y’know it's a bit funny isn't it? She's a DRAGON PERSON and her job is to help kill DRAGONS!! I don’t know, it just seems kinda messed up to me.”"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Token",
		Archetype = "Alar",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "During your end step: Summon either an Alar Trainee or Herald.",
			Type = "OnEnd",
			Power = { {
				"RandomSummon",
				{ "Alar Trainee", "Alar Herald" }
			} },
			Target = "Ally"
		},
		Bio = "Still, he knew there were those who would seek the Brick, destroying the peace he helped create. The Brick is now hidden, forever out of Telamon's reach."
	},
	["Aether Traitor"] = {
		Id = 6801079981,
		Name = "Aether Traitor",
		AltCards = {
			["Alar Traitor-C"] = { Id = 8251854949, Name = "Saint Bishop", AttackEffect = "Divinity" }
		},
		Health = 750,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Alar",
		Cost = { Neutral = 2, Red = 2, Green = 1 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever you cast an Alar Fighter: You gain {R}{G}.",
			Type = "OnAllySummon",
			Archetype = "Alar",
			Power = {
				{ "Green", 1 },
				{ "Red", 1 }
			},
			Target = "Self"
		},
		Bio = "Dukran is an idiot! Getting all cozy with beings beyond our understanding! Nothing good will come of this, mark my words. They'll kill us!"
	},
	JamiyJamie = {
		Id = 6800709006,
		Name = "JamiyJamie",
		AltCards = {
			w7j14 = {
				Name = "w7j14",
				Id = 6815338466,
				AltArt = true,
				Bio = "This is the last remaining w7j14 of his kind. He's a business man, constantly makes JoJo references and now he has found a DB shotgun in a dumpster."
			},
			["Jojobinks, the Shark"] = {
				Id = 7945346668,
				Name = "Jojobinks, the Shark",
				AttackEffect = "Venomshank",
				AltArt = true,
				CopyBodge = "Jojobinks, the Shark",
				Bio = "Trust me, it’s a great trade. If I were you, I’d definitely take it."
			},
			["JamiyJamie-Precon"] = { Name = "JamiyJamie", Id = 16361234204, Bio = "Yeah" }
		},
		Health = 600,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 6 },
		Summonant = "Round7",
		EffectVariable = 0,
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Effect = {
			Name = "YouTuber",
			Description = "When this card is cast: Summon a 400/150 Noob that's inert in play. All players lose 400 life for each allied Noob.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant", "Ally" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Archetype", "Noob" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 400, "Nil" }
				},
				{ "Inflict", "Variable", "Opponent" },
				{ "Inflict", "Variable", "Ally" }
			},
			Target = "Self"
		},
		Bio = "\"Make sure to SMASH that subscribe button and hit that notification bell!\""
	},
	["Bling Noob"] = {
		Id = 6858730974,
		Name = "Noob Golem",
		CopyBodge = "Bling Noob",
		AltCards = {
			["Giant Noob"] = {
				Id = 16738206428,
				Name = "Giant Noob",
				AltArt = true,
				Bio = "You didn't make a cake and feed him, did you...?"
			},
			TheTiesRED = {
				Id = 121336156385671,
				Name = "TheTiesRED",
				Commissioner = { "TheTiesWhite" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 694,
				Bio = "THE ONLY WAY THISLL BE DONE IS WITH A KO."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		ChargeRequirement = { "TokenArchetype", "Ally", 1, 9999, "Noob" },
		Effect = {
			Name = "Oof",
			Description = "This card has haste if there's an allied 'Noob' token.",
			Type = "Nill",
			Power = "Yellow",
			Target = "Ally",
			Increase = 0
		},
		Bio = "I feel like I must put you in your place, Newbie."
	},
	["Training Dummy"] = {
		Id = 8449748530,
		Name = "thebenster",
		AltCards = {
			TheTiesThinking = {
				Id = 116284305514318,
				Name = "TheTiesThinking",
				Commissioner = { "TheTiesWhite" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 692,
				Bio = "The you reading this is different from the one who read this temporally and mentally ."
			}
		},
		Health = 50,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		DeathAnimation = "NoobDeath",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		AttackBlock = true,
		EffectVariable = 1,
		Effect = {
			Name = "Capture",
			Description = "During your end step, if there's an allied 'Noob' token: Draw a fleeting, inert card.",
			Ability = {
				OnEnd = {
					Power = { { "Draw", 1 } },
					Target = "Self",
					EffectRequirement = { "TokenArchetype", "Ally", 1, 9999, "Noob" }
				}
			},
			EffectInert = true,
			EffectFleeting = true
		},
		Bio = "Where does he get all the cakes to feed this noob anyways?"
	},
	Coeptus = {
		Id = 6801090607,
		Name = "Coeptus",
		AltCards = {
			CloseEnouf = {
				Name = "CloseEnouf",
				Id = 5651061591,
				AttackEffect = "MagicYellow",
				Bio = "Look mom, I'm on a card and made a time paradox!",
				AltArt = true
			},
			Diamond = {
				Id = 75915868444435,
				Name = "Diamond",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 560,
				Bio = "And the winner of the pinky award is..."
			},
			TheTiesLoose = {
				Id = 136251993278265,
				Name = "TheTiesLOOSE!",
				Commissioner = { "TheTiesWhite" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 695,
				Bio = "Tie Guys usually dont like Ties who uh.. escape them."
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Common",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 6, Neutral = 1 },
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "During your end step, if there's an allied 'Noob' token: All allied fighters gain 100 health and Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Ally",
			EffectRequirement = { "TokenArchetype", "Ally", 1, 9999, "Noob" }
		},
		Bio = "Even noobs can make it eventually."
	},
	BrackioTops = {
		Id = 10445092830,
		Name = "BrackioTops",
		AltCards = {
			EpicMinstair1 = {
				Name = "EpicMinstair1",
				Id = 4698970183,
				AttackEffect = "Katana",
				AltArt = true,
				Bio = "FITE ME FITE ME FITE ME FITE ME FITE ME FITE ME FITE ME FITE ME FI..."
			},
			["TheVoid_00f, Noob Summoner"] = {
				Name = "TheVoid_00f, Noob Summoner",
				Id = 5686210170,
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "Noob decks aren’t overPowered."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		DeathAnimation = "NoobDeath",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Trout Slap",
			Description = "When this card is cast: summon a 400/150 Noob that's inert in play.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Round7" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The dampest of mayday-ers."
	},
	["Baby Noob"] = {
		Id = 6801082499,
		Name = "Baby Noob",
		AltCards = {
			["Myrmiredon 3"] = {
				Id = 5642689443,
				CopyBodge = "Myrmiredon 3",
				Bio = "I wonder what this noob will grow up to be!"
			},
			TheTiesConjuring = {
				Id = 107609825272002,
				Name = "TheTiesConjuring",
				Commissioner = { "TheTiesWhite" },
				Addant = "Nascent Stud-Ties",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 697,
				Bio = "Let's get Tied Up!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
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
		Token = true,
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
	["Noob Gunner"] = {
		Id = 6858731404,
		Name = "Noob Gunner",
		AltCards = {
			TheVoid_00f = {
				Id = 5485305003,
				CopyBodge = "TheVoid_00f",
				Name = "TheVoid_00f",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "One of many, with many more to come!"
			},
			["Noob Gunner-RaidAct1"] = {
				Id = 113112026001225,
				Name = "Noobloxxer",
				AttackEffect = "TimeBomb",
				Bio = "BOOM! There goes your tower, watch it crumble."
			},
			TheTiesAPortalToOtherDimensionsOfOtherTies = {
				Id = 134779155917429,
				Name = "TheTiesAPortalToOtherDimensionsOfOtherTies",
				Commissioner = { "TheTiesWhite" },
				Summonant = "Round7-Tie",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 699,
				Bio = "Oh shoot, that's interesting.. A world where I'm made of cheese.."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "TimeBomb",
		Color = "Yellow",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Cost = { Neutral = 2, Yellow = 5 },
		Summonant = "Round7",
		EffectVariable = 0,
		Effect = {
			Name = "N00BT00B",
			Description = "Whenever this card attacks: Summon a 400/150 Noob that's inert in play. Then summon a unranked fighter card in your graveyard that costs 2 or fewer total studs, except it's fading.",
			Target = "Ally",
			Ability = {
				OnAttack = {
					Power = {
						{ "Summon", "Summonant" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{
							"Unranked_2OrLower_Fighter",
							"GraveZone_Ally",
							"Field_Ally",
							true,
							false
						},
						"Self"
					} },
					MetaData = { Fading = true },
					NoBlip = true
				}
			}
		},
		Bio = "\"I shudder to think about those meeboid rats being fired out that cannon.\" -Dukran the Elysian"
	},
	Noob = {
		Id = 4899422795,
		Name = "Noob",
		AltCards = {
			Bananas = {
				Id = 5832349768,
				Name = "Dancing Bananas",
				AttackEffect = "Jab",
				Bio = "ITS PEANUT BUTTER JELLY TIME!"
			},
			CaptainUnderpants = {
				Id = 76822736302744,
				Name = "Imposter Banana",
				AttackEffect = "British",
				CopyBodge = "CaptainUnderpants",
				Bio = "When the banana is sus."
			},
			Minions = {
				Id = 8628390436,
				Name = "Banana Minions",
				AttackEffect = "Jab",
				CopyBodge = "Minions",
				Bio = "BA NA NA!"
			},
			Rowley = {
				Id = 8628388968,
				Name = "Sans Banana",
				CopyBodge = "Rowley",
				AttackEffect = "LaserBlue",
				Bio = "It's Peanut Butter Bad Time."
			},
			["Adventurous Catgirl"] = {
				Id = 8582590124,
				Name = "Adventurous Catgirl",
				AttackEffect = "Scratch",
				CopyBodge = "Adventurous Catgirl",
				Bio = "Constantly searching for new discoveries and adventures, even if they come from the bottom of a green bin."
			},
			["Prosperous Catgirl"] = {
				Id = 8582590768,
				Name = "Prosperous Catgirl",
				AttackEffect = "Scratch",
				CopyBodge = "Prosperous Catgirl",
				Bio = "Managed to get promoted just so they could write \"UwU\" onto the blimp."
			},
			["Mischievious Catgirl"] = {
				Id = 8582591861,
				Name = "Mischievious Catgirl",
				AttackEffect = "Scratch",
				CopyBodge = "Mischievious Catgirl",
				Bio = "Chasing people around with a trash can isn't the usual \"prank\" you'd expect. Which is why it works so well."
			},
			["Noob-Sun"] = { Id = 9180233955, AttackEffect = "Jab", Bio = "Heave ho, Friend!" },
			Sorrow = {
				Id = 12744789376,
				Name = "Sorrow",
				AttackEffect = "Slash",
				Bio = "\"Because I know that on the day of my final agony, you will be there, lying in my sheets, O sorrow, so that you might once again attempt to enter my heart.\""
			},
			["Noob-AWIH"] = {
				Name = "FUN™️ Entertainer",
				Id = 17600773673,
				AttackEffect = "Jab",
				Bio = "Let's get this party started!",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Panicked Bystander"] = {
				Id = 100503067556819,
				Name = "Panicked Bystander",
				AttackEffect = "Jab",
				Bio = "\"What is happening to the sky?! Where's the sun?! Is that gleaming light the sun?! Is it night, or is it day?! What year is it, when is it even at this point?!\""
			}
		},
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
	Scrub = {
		Id = 6799880803,
		Name = "Scrub",
		AltCards = {
			Latiosloves = {
				Id = 10210758446,
				Name = "Latiosloves",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "JOJO STONE OCEAN!?"
			},
			DaCart_er = {
				Id = 15805016053,
				Name = "DaCart_er",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Cheesed to meet you!"
			},
			["TheTies A Dad"] = {
				Id = 71576373910736,
				Name = "TheTies A Dad?!?",
				Commissioner = { "TheTiesWhite" },
				Summonant = "TheTiesSon",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 700,
				Bio = "..turns out it might've been more than a coincidence."
			}
		},
		Health = 350,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Summonant = "Round7",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Double Bleeding",
			Description = "When this card is cast: Summon a 400/150 Noob that's inert in play. A target fighter gains 100 health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant", "Ally" },
				{ "Strengthen", 100, "Single" },
				{ "Heal", 100, "Single" }
			},
			Target = "All"
		},
		Bio = "DURRRR U HAD TO USE GUNS 2 KILL ME NUB!"
	},
	["Corrupt Guest"] = {
		Id = 9964978727,
		Name = "Corrupt Guest",
		AltCards = {
			["Corrupt Guest-Anim"] = {
				Id = 18601521746,
				ArtAnimation = "OtherGuestGuy",
				Name = "Forgotten Guest",
				AttackEffect = "DoomStorm",
				PlayTest = true,
				Bio = "Even so, he'll make sure you remember."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectAnimation = "LinkedSwordFlagEffect",
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you lose life: This card gains 200 Power.",
			Type = "OnLifeLoss",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "Wanna be mincemeat?"
	},
	Guest = {
		Id = 6801096742,
		Name = "Guest",
		AltCards = {
			["Guest-Sun"] = {
				Id = 7280386041,
				Name = "Female Guest",
				CopyBodge = "Guest-Sun",
				AttackEffect = "Ice",
				Bio = "Wanna share this popsicle?"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever you discard a card: You lose 150 life.",
			Type = "OnAllyDiscard",
			Power = { { "Cost", 150 } },
			Target = "Self",
			TurnTriggerLimit = 2
		},
		Bio = "Wanna be Friends?"
	},
	["Safe Chat"] = {
		Id = 9139396537,
		Name = "Safe Chat",
		AltCards = {
			["Safe Chat-E"] = {
				Id = 8744041976,
				Name = "Egg Drop",
				Bio = "Take as many as you want! Provided you had Builder's Club."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Transformant = "Round7",
		EffectVariable = 0,
		Effect = {
			Name = "Thug Life",
			Description = "Draw 2 fleeting cards.\nIf there's an allied 'Noob' token, transform a target fighter into a Noob that's inert in all play.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2 },
						{ "EVExactValueCheck", 0, "Self" },
						{ "BypassAction" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "Transform", "Transformant", "Single" } },
					Target = "Single",
					EffectRequirement = { "TokenArchetype", "Ally", 1, 9999, "Noob" }
				}
			},
			EffectFleeting = true
		},
		Bio = "OMG My house is on fire! GTG. Wanna be friends? Dinosaurs!"
	},
	Eldevin = {
		Id = 11865480703,
		Name = "Eldevin",
		AltCards = {
			Elfdevin = {
				Id = 8109761634,
				Name = "Elfdevin",
				AttackEffect = "MagicYellow",
				Bio = "I just had a horrible nightmare where I looked objectively worse than my regular art!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Superball",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 3 },
		ChargeRequirement = { "CompareLife", "Me", 30, 30, 30 },
		Effect = {
			Name = "Eldevin",
			Description = "If your opponent has more life than you, this card has haste.\nWhenever this card attacks: Draw a card.",
			Type = "OnAttack",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "A.K.A the Lord of E."
	},
	WishNite = {
		Id = 4537240624,
		Name = "WishNite",
		AltCards = {
			["Wishnite-ArtV"] = {
				Name = "Mad Yeti",
				AttackEffect = "Scratch",
				Id = 8122115351,
				Bio = "No presents. No turkey. No festivity allowed."
			},
			Arceusdonv2 = {
				Id = 110693176605659,
				Name = "Berserker Arceusdon",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Everything would have been fine if I had just kept my grasses on!"
			}
		},
		Health = 900,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Untradeable = true,
		Cost = { Neutral = 8, Red = 1 },
		Effect = {
			Name = "Wishing Amp",
			Description = "Whenever this card attacks and destroys another: Unlock it. It gains 150 health and Power.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Heal", 150 },
				{ "Strengthen", 150 },
				{ "Unlock", 999 }
			},
			Target = "Self"
		},
		Bio = "No Celestials. No Meeboids. No. Stall. Allowed."
	},
	Histor = {
		Id = 11770008111,
		Name = "Histor",
		AltCards = {
			HistorArt = { CopyBodge = "HistorArt", AttackEffect = "MagicRed", Id = 17251036794 }
		},
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Yellow = 2, Red = 1 },
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
	["Histor, Blood Warrior"] = {
		Id = 90815410634034,
		Name = "Illia Reed",
		AltCards = {
			["Histor, Blood Warrior-Masant"] = {
				Id = 87070078188746,
				Name = "Arania",
				AltArt = true,
				Bio = "\"Welcome, intruder. I'd suggest you hurry up and leave, before I decide that you might make for a nice treat. You don't want to end up like them, now do you?\""
			},
			["Histor, Memecraft Slayer"] = {
				Name = "Luna",
				Id = 99491796559987,
				AttackEffect = "MagicBlue",
				Bio = "Hollow Knight is the best."
			}
		},
		Health = 1500,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Green = 5, Red = 5, Neutral = 2 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Select a fighter from your graveyard that's died this game, Summon it, except it's zombified, then destroy it. Repeat this effect once.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
					"CustomZoneTarget"
				},
				{ "Destroy", 30, "SummonedCard" },
				{
					"MoveZone",
					{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
					"CustomZoneTarget"
				},
				{ "Destroy", 30, "SummonedCard" }
			},
			Target = "Self",
			ZoneTargetParameters = {
				Zones = { "Ally_GraveZone" },
				Condition = { Fighter = true, HasDied = true },
				SelectionDescription = "a fighter to summon then destroy from your graveyard",
				MinTargets = 1,
				MaxTargets = 1
			},
			MetaData = { Zombified = true },
			UniqueTargets = true
		},
		Bio = "Exiled from her home, Illia came up with creative solutions to her problems. If the living won't help you, then surely the dead will."
	},
	Wustard = {
		Id = 4942878841,
		Name = "Wustard",
		AltCards = {
			["Wustard-ARR"] = {
				Name = "Sagacious Storyteller",
				Id = 73937666606515,
				AttackEffect = "MagicGreen",
				Bio = "Now what did we learn today class?"
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1 },
		Effect = {
			Name = "LifeWin",
			Description = "During your end step: You gain 50 life.",
			Type = "OnEnd",
			Power = { { "Cost", -50 } },
			Target = "Ally"
		},
		Bio = "Surviving the apocalypse in style isn't easy, unless you have a machete."
	},
	Gaomon94 = {
		Id = 5031509896,
		Name = "Gaomon94",
		AltCards = {
			["Gaomon94-Sun"] = {
				Id = 10283653719,
				Name = "The Cyclop",
				AttackEffect = "Maelstrom",
				Bio = "Tales long forgotten rest here, in these depths. Take care not to become one yourself."
			},
			["Flufflefunz, Ghost Writer"] = {
				Id = 10570707808,
				AltArt = true,
				Name = "Flufflefunz, Ghost Writer",
				AttackEffect = "Gun",
				Bio = "*Insert 15 paragraph narcissistic monologue with a hundred metaphors and some contrived pun here.*"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Superball",
		EffectAnimation = "TixStackSelf",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5 },
		Effect = {
			Name = "JUST SCRIPT IT",
			Description = "Whenever this card gains a lock: It gains 200 Power.",
			Type = "OnLockIncrease",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "Retired ROBLOX Community forum poster. If you upset him, he'll say, 'Knock it off' before you're done for."
	},
	["Disaster Survival"] = {
		Id = 10184426894,
		Name = "Disaster Survival",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 293402597,
		Terrain = true,
		Color = "Neutral",
		Cost = { Neutral = 1, Red = 2 },
		Terrariant = "Disaster Terrain",
		CustomReminder = {
			["Pandemonium and Chaos"] = "Cast 'Living World' to animate this as a 1000/400 that deals 100 damage to all fighters when one dies."
		},
		Effect = {
			Name = "Clash",
			Description = "Whenever you discard your second card each turn: This card deals 200 damage to a target fighter.",
			Type = "OnAllyDiscard",
			Power = { { "Damage", 200, "Single" } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" }
		},
		Bio = "When WOs were around this is where you lost them."
	},
	WoodReviewer = {
		Id = 3238131029,
		Name = "WoodReviewer",
		AltCards = {
			["WoodReviewer-Hal"] = {
				Id = 7437123165,
				Name = "Here's WoodReviewer",
				Bio = "You had PLENTY of time, GollyGreg! Time to do what I should have done LONG ago!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Axe",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		Effect = {
			Name = "WoodReviewer",
			Description = "During your end step: This card gains 200 health. You lose 400 life.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 400 },
				{ "Heal", 200 }
			},
			Target = "Self"
		},
		Bio = "You can complain about wood grain all you want, but the metal used to make that axe is truly poor. 4/10 - Sword Critic"
	},
	MrEyeso = {
		Id = 5188678821,
		Name = "MrEyeso",
		AltCards = {
			["MrEyeSo-Hal"] = {
				Id = 7443718446,
				AttackEffect = "MagicBlue",
				Bio = "I despise the weak."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Yellow = 3, Blue = 3 },
		Effect = {
			Name = "Life fam",
			Description = "During your end step: Destroy all enemy fighters with no Power, then all allied fighters gain 100 Power. You gain {Y}.",
			Type = "OnEnd",
			Power = {
				{
					"CheckPower",
					{ 0, 1 },
					"Opponent"
				},
				{ "Strengthen", 100, "Ally" },
				{ "Yellow", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "All trials have a reward."
	},
	Haydebug2003 = {
		Id = 4951745156,
		Name = "Haydebug2003",
		AltCards = {
			Mugalo = {
				Id = 10224177261,
				Name = "Mugalo",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"Hey, thanks for commissioning me for your game. Those set of faces took a bit of time but now I can afford this special ice tea :3\""
			},
			["Haydebug2003-Sun"] = {
				Id = 9159867919,
				Name = "Haydebug2003",
				Bio = "Fear fish me. No, wait. Fish me fear. Dang it, how does the saying go?"
			}
		},
		Health = 1250,
		Power = 100,
		Rarity = "Epic",
		Charge = true,
		Overload = true,
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 7, Yellow = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: It gains 300 Power.",
			Type = "OnAttack",
			Power = { { "Strengthen", 300 } },
			Target = "Self"
		},
		Bio = "Just floating around..."
	},
	["Combine Garrison"] = {
		Id = 8778770919,
		Name = "Combine Garrison",
		AltCards = {
			["Senpai Garrison"] = {
				Id = 125490524570154,
				AltArt = true,
				Summonant = "Senpai Garrison 2",
				Name = "Senpai Garrison",
				Bio = "These high school students are always ignoring Stalker-Chan."
			},
			["Combine Garrison-Offer"] = {
				Id = 14278853175,
				Summonant = "Combine Garrison-Offer 2",
				AttackEffect = "Jab",
				Name = "Trash Can",
				Bio = "<i>\"Y'know what I think? I ain't gonna let some amnesiac replace me!\"</i>"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Gun",
		SummonAnimation = "CombineCall",
		SpecialEffectAnimation = "CombineCall",
		DeathAnimation = "CombineDeath",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		Summonant = "Combine Garrison 2",
		CustomReminder = { ["Inert in Play"] = "The copies don't generate studs in play." },
		Effect = {
			Name = "Overgrown",
			Description = "When this card is cast: Summon four copies of it that're inert in play and have no abilities.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "These troops are always searching for the Stalker."
	},
	["Combine Garrison 2"] = {
		Id = 3164484158,
		Name = "Lesser Combine Garrison",
		CopyBodge = "Combine Garrison",
		AltCards = {
			["Senpai Garrison 2"] = {
				Id = 122752464094984,
				CopyBodge = "Senpai Garrison",
				Name = "Lesser Senpai Garrison",
				Bio = "These high school students are always ignoring Stalker-Chan."
			},
			["Combine Garrison-Offer 2"] = {
				Id = 14278855196,
				Name = "The Unused",
				AttackEffect = "Jab",
				Bio = "<b>\"LET'S GET 'EM!!\"</b>"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		Token = true,
		AttackEffect = "Gun",
		DeathAnimation = "CombineDeath",
		Archetype = "Combine",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		Effect = {
			Description = "Whenever this card finds the stalker: It cries for its parents.",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "These troops are always searching for the Stalker."
	},
	HeyItsColin = {
		Id = 6107558667,
		Name = "HeyItsColin",
		AltCards = {
			["HeyItsColin-ArtV"] = {
				Id = 4899351403,
				AttackEffect = "FirePunch",
				AltArt = true,
				Bio = "...or is it?"
			}
		},
		Health = 600,
		Power = 1200,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 4, Red = 5 },
		Effect = {
			Name = "Double Bleeding",
			Description = "Whenever you lose life, if you've lost less than 1000 life since your last end step: Your opponent loses 200 life. Draw a card.",
			Type = "OnLifeLoss",
			Power = {
				{ "Draw", 1 },
				{ "Inflict", 200, "Opponent" }
			},
			EffectRequirement = { "Playertable", "Me", 0, 1000, "Lifeloss" },
			Target = "Ally"
		},
		Bio = "Or is it?"
	},
	SubZeroExtaByte0 = {
		Id = 6124857150,
		Name = "SubZeroExtaByte0",
		AltCards = {
			BigLeagueChewTen = {
				Id = 8457588818,
				Name = "BigLeagueChewTen",
				AltArt = true,
				Bio = "I never shed my old name. I simply layered something else on top."
			}
		},
		Health = 1200,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card attacks: A target fighter gains 200 Power.",
			Type = "OnAttack",
			Power = { { "Strengthen", 200 } },
			Target = "Single"
		},
		Bio = "Fatality."
	},
	DunclubDuncan = {
		Id = 6548871084,
		Name = "DunclubDuncan",
		Health = 400,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 6 },
		Effect = {
			Name = "Clash",
			Description = "Whenever you discard your second card each turn: Reset the stats of a target fighter.",
			Type = "OnAllyDiscard",
			Power = { { "Reset", 30, "Single" } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" }
		},
		Bio = "His computer will be cleansed of malware."
	},
	["Titan's Stone"] = {
		Id = 4204449898,
		Name = "Titan's Stone",
		AltCards = {
			["Titan's Stone-E"] = {
				Name = "Bunny Blob",
				CopyBodge = "Titan's Stone-E",
				AttackEffect = "MagicYellow",
				Id = 8650607805,
				Bio = "Just a harmless bunny blob. Nothing more. Totally can’t summon giant titan blobs or anything. Totally not."
			},
			["The Truth"] = {
				Name = "The Truth",
				Id = 11496885362,
				AttackEffect = "MagicRed",
				Bio = "Maybe we had a little too much fun."
			},
			["Titan's Stone-Spawn"] = {
				Id = 106953144438351,
				Name = "Spawn",
				AltArt = true,
				PremiumArt = 630,
				Bio = "\"Wh-what?! It's. . .  it's already spawning!?\""
			}
		},
		Health = 500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Archetype = "Titan",
		Stealth = true,
		Token = true,
		Color = "Neutral",
		Cost = { Neutral = 1 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Titan's Call",
			Description = "Whenever you cast a Titan fighter: Give yourself a Titanic Stud card.",
			Type = "OnAllySummon",
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
	["Recruiter of the Titans"] = {
		Id = 9267981763,
		Name = "Recruiter of the Titans",
		AltCards = {
			["Recruiter-E"] = {
				Name = "Recruiter of the Bunny Blobs",
				AttackEffect = "MagicYellow",
				CopyBodge = "Recruiter-E",
				Id = 8650609598,
				Addant = "Titan's Stone-E",
				Bio = "Evewybody, pwease, get in hewe! I would be ewew gwateful if you did! uwu"
			},
			["Recruiter of the Titans-Classic"] = { AttackEffect = "Jab", Id = 9313212639 },
			["Innocent Manix and Sol"] = {
				Name = "Innocent Manix and Sol",
				AttackEffect = "MagicRed",
				Id = 11479686079,
				Addant = "The Truth",
				Bio = "\"We were free in the fall, now we're lost in this moment.\""
			},
			["Crumbling Tower"] = {
				Id = 120224558539575,
				Name = "Crumbling Tower",
				Addant = "Titan's Stone-Spawn",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 629,
				Bio = "\"If... if we jump here, we can make it back on...\"<br/>(HatredsOfPerfected was here)"
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Token = true,
		Color = "Neutral",
		Cost = { Neutral = 3 },
		StarterCard = true,
		Archetype = "Titan",
		Addant = "Titan's Stone",
		CustomReminder = {
			["Titan's Stone"] = "A free 500/0. Stealth. Inert in play. Whenever you cast a Titan: Give yourself a Titanic Stud.",
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Stud",
			Description = "During your end step: Give yourself a Titan's Stone.",
			Type = "OnEnd",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "Rock keeper? Perhaps it will carve some rocks out of the world itself."
	},
	["Titan of the Infernal Abyss"] = {
		Id = 9238693249,
		Name = "Titan of the Infernal Abyss",
		AltCards = {
			["Titan of the Infernal Abyss-E"] = {
				Name = "Bunny Blob of the Infernal Abyss",
				CopyBodge = "Titan of the Infernal Abyss-E",
				Id = 8650621540,
				Bio = "Guarding a pit of fire is pretty lame. Guarding an empty pit is even lamer."
			},
			["Titan of the Infernal Abyss-Classic"] = { Id = 9313208173, Name = "Titan of the Burning Abyss" }
		},
		Health = 800,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Archetype = "Titan",
		Color = "Red",
		Cost = { Red = 12 },
		AlternateCost = { Red = 6 },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 7, 999999, "Titan" },
		Effect = {
			Name = "Stud",
			Description = "If there are 7 or more Titan cards in your baseplate, cast this card using 6{R}.\nWhen this card is cast: Deal 500 damage to all fighters that aren't allied Titans. Put a titanic stud of each other colour into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 500, "AlliedNotArchetype" },
				{ "Damage", 500, "Opponent" },
				{
					"AddGenZone",
					{ "Blue Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Titanic Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "Guarding a pit of fire isn't as cool as it sounds."
	},
	["Titan of the Deep Below"] = {
		Id = 9238695829,
		Name = "Titan of the Deep Below",
		AltCards = {
			["Titan of the Deep Below-E"] = {
				Name = "Bunny Blob of the Deep Below",
				CopyBodge = "Titan of the Deep Below-E",
				Id = 9959673602,
				Bio = "April showers bring May flowers. April floods ruin harvests of spuds."
			},
			["Titan of the Deep Below-Classic"] = { Id = 9313206554 }
		},
		Health = 2000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Storm",
		Archetype = "Titan",
		Color = "Blue",
		Cost = { Blue = 12 },
		AlternateCost = { Blue = 6 },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 7, 999999, "Titan" },
		Effect = {
			Name = "Stud",
			Description = "If there are 7 or more Titan cards in your baseplate, cast this card using 6{B}.\nWhen this card is cast: All fighters that aren't allied Titans lose 500 Power. Put a titanic stud of each other colour into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 500, "AlliedNotArchetype" },
				{ "Weaken", 500, "Opponent" },
				{
					"AddGenZone",
					{ "Red Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Titanic Stud", 1 }
				}
			},
			Target = "Self",
			Increase = 3
		},
		Bio = "Cthulhu's cousin's cousin's cousin. He's like, BASICALLY the reason he became popular."
	},
	["Titan of the Dying Forest"] = {
		Id = 9238694493,
		Name = "Titan of the Dying Forest",
		AltCards = {
			["Titan of the Dying Forest-E"] = {
				Name = "Bunny Blob of the Dying Forest",
				CopyBodge = "Titan of the Dying Forest-E",
				Id = 8650629699,
				Bio = "Easter is a celebration of life and rebirth, yet so much material is wasted wrapping candy eggs. Hypocritical, really."
			},
			["Titan of the Dying Forest-Classic"] = { Id = 9313209521 }
		},
		Health = 2000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Tempest",
		Archetype = "Titan",
		Color = "Green",
		Cost = { Green = 12 },
		AlternateCost = { Green = 6 },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 7, 999999, "Titan" },
		Effect = {
			Name = "Stud",
			Description = "If there are 7 or more Titan cards in your baseplate, cast this card using 6{G}.\nWhen this card is cast: All allied Titans gain 1000 health. Put a titanic stud of each other colour into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 1000, "AlliedArchetype" },
				{
					"AddGenZone",
					{ "Red Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Yellow Titanic Stud", 1 }
				}
			},
			Target = "Self",
			Increase = 1000
		},
		Bio = "Are humans the real natural disaster?"
	},
	["Titan of the Fried One"] = {
		Id = 9238691665,
		Name = "Titan of the Fried One",
		AltCards = {
			["Titan of the Fried One-E"] = {
				Name = "Bunny Blob of the Fried One",
				CopyBodge = "Titan of the Fried One-E",
				Id = 8650638341,
				Bio = "Rabbits are higher on the food chain now…"
			},
			["Titan of the Fried One-Classic"] = { Id = 9313210622 }
		},
		Health = 1000,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Archetype = "Titan",
		Color = "Yellow",
		Cost = { Yellow = 12 },
		AlternateCost = { Yellow = 6 },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 7, 999999, "Titan" },
		Effect = {
			Name = "Stud",
			Description = "If there are 7 Titan cards in your baseplate, cast this card using 6{Y}.\nWhen this card is cast: All allied Titans gain 500 Power. Put a titanic stud of each other colour into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 500, "AlliedArchetype" },
				{
					"AddGenZone",
					{ "Red Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Titanic Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Titanic Stud", 1 }
				}
			},
			Target = "Self"
		},
		Bio = "Didn't you know? Telamon likes fried chicken almost as much as Shedletsky!!!"
	},
	["Titan of the Holy Chamber"] = {
		Id = 9284777211,
		Name = "Titan of the Holy Chamber",
		AltCards = {
			["Titan of the Holy Chamber-E"] = {
				Name = "Bunny Blob of the Holy Chamber",
				CopyBodge = "Titan of the Holy Chamber-E",
				Id = 10184271522,
				Bio = "The arrival of titan signalled the beginning of the nega-rapture: The spirits of all blobbunnies would coalesce and form the Blobgotten One.",
				Addant = "The Blobgotten One"
			},
			["Titan Cultist of Monstrosity"] = {
				Name = "Titan Cultist of Monstrosity",
				AltArt = true,
				Id = 9256499525,
				Bio = "I bring true horror.",
				Addant = "The Monstrosity"
			},
			["Titan of the Holy Chamber-Classic"] = { Id = 9313211592 },
			["Knight of the Dark Truth"] = {
				Id = 75543183404816,
				Name = "Knight of the Dark Truth",
				AttackEffect = "Katana",
				AltArt = true,
				PremiumArt = 490,
				Addant = "The Forgotten One-Delta",
				Bio = "Suddenly, the north and east winds blew fiercely."
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Divinity",
		Archetype = "Titan",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Addant = "The Forgotten One",
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans.",
			["The Forgotten One"] = "A 5{W}{R}{G}{B}{Y} 5000/5000, castable only if you have 15 or more Titan cards in your baseplate. Make sure he stays Forgotten."
		},
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, if there's 2 or more allied Titans: This card gains defender. Give yourself 'The Forgotten One' and a titanic stud of each colour.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Shield", "Self" },
				{ "Add", "Addant" },
				{ "Add", "Red Titanic Stud" },
				{ "Add", "Green Titanic Stud" },
				{ "Add", "Blue Titanic Stud" },
				{ "Add", "Yellow Titanic Stud" }
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 2, 999999, "Titan" }
		},
		Bio = "As the world turns their eyes to the skies, this servant delves deeper into the earth, weakening the chains for It."
	},
	["The Forgotten One"] = {
		Id = 7675998558,
		Name = "The Forgotten One",
		AltCards = {
			["The Blobgotten One"] = {
				Name = "The Blobgotten One",
				AttackEffect = "Gravity",
				Id = 8650610845,
				Bio = "There was no reason to pray. Its arrival was already an act of the gods."
			},
			["The Monstrosity"] = {
				Name = "The Monstrosity",
				Id = 9256500677,
				AttackEffect = "Scratch",
				Bio = "It's over."
			},
			["ADeadBody14, Trained Assassin"] = {
				Name = "ADeadBody14, Trained Assassin",
				Id = 11581900656,
				AttackEffect = "British",
				Bio = "Trixie knew a guy who knew a guy who knew a guy who was a contracted killer that could take out Karkalicious and his horrible music."
			},
			["The Forgotten One-Delta"] = {
				Name = "TITAN",
				Id = 137051374418877,
				Bio = "Darkness constricts you..."
			}
		},
		Health = 5000,
		Power = 5000,
		Rarity = "Token",
		AttackEffect = "Divinity",
		Archetype = "Titan",
		Requirement = { "Archetype", "AllyGenZone", 15, 999999, "Titan" },
		Color = "Neutral",
		WeakenImmune = true,
		SetImmune = true,
		DamageImmune = true,
		ReturnImmune = true,
		DestroyImmune = true,
		Cost = { Neutral = 5, Red = 5, Green = 5, Yellow = 5, Blue = 5 },
		EffectAnimation = "HeadExplodeAsync",
		SummonAnimation = "ForgottenOne",
		Effect = {
			Name = "Stud",
			Description = "Cast only if there are 15 Titans in your baseplate.\nDuring your end step: Deal 5000 damage to all enemy fighters. Unlock all titans.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 5000, "Opponent" },
				{ "Unlock", 99999, "Archetype" }
			},
			Target = "NotArchetype"
		},
		Bio = "WE HID HIM FOR A REASON, F O O L."
	},
	["Red Titanic Stud"] = {
		Id = 10223967580,
		Name = "Red Titanic Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Archetype = "Titan",
		Requirement = { "Archetype", "Ally", 2, 9999, "Titan" },
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "I quit.",
			Description = "Cast only if you have 2 or more allied Titans.\nA target fighter gains 200 Power.\nPut this card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{
					"AddGenZone",
					{ "Red Titanic Stud", 1 }
				}
			},
			Target = "Single"
		},
		Bio = "The corruption of the Titans infused Robloxia's inhabitants with meekness and obedience."
	},
	["Blue Titanic Stud"] = {
		Id = 10223971076,
		Name = "Blue Titanic Stud",
		AltCards = {
			["Blue Titanic Stud-Divided"] = {
				Id = 115301908699261,
				Name = "Right",
				AttackEffect = "Scratch",
				Bio = "blank"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Archetype = "Titan",
		Requirement = { "Archetype", "Ally", 2, 9999, "Titan" },
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "I quit.",
			Description = "Cast only if you have 2 or more allied Titans.\nLock a target fighter for 1 turn.\nPut this card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"Lock",
					1,
					"Single",
					nil,
					nil,
					nil,
					"Freeze"
				},
				{
					"AddGenZone",
					{ "Blue Titanic Stud", 1 }
				}
			},
			Target = "Single"
		},
		Bio = "The corruption of the Titans infused Robloxia's inhabitants with blindness and smooth brains."
	},
	["Green Titanic Stud"] = {
		Id = 10223968924,
		Name = "Green Titanic Stud",
		AltCards = {
			["Green Titanic Stud-Divided"] = {
				Id = 135982506265070,
				Name = "Left",
				AttackEffect = "Scratch",
				Bio = "ehh"
			},
			["Green Titanic Stud-Senzura"] = { Name = "The Hat", Id = 94842381471195, Bio = "Why not?" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Archetype = "Titan",
		Requirement = { "Archetype", "Ally", 2, 9999, "Titan" },
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "I quit.",
			Description = "Cast only if you have 2 or more allied Titans.\nA target fighter loses 200 Power.\nPut this card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{
					"AddGenZone",
					{ "Green Titanic Stud", 1 }
				}
			},
			Target = "Single"
		},
		Bio = "The corruption of the Titans infused Robloxia's inhabitants with illness and decay."
	},
	["Yellow Titanic Stud"] = {
		Id = 10223982142,
		Name = "Yellow Titanic Stud",
		AltCards = {
			["Yellow Titanic Stud-Senzura"] = {
				Name = "The Turutot",
				Id = 107801623510559,
				Bio = "How else do you send thanks to someone so big they wont feasibly hear your voice? You toot your Turutot at him!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Titan",
		Requirement = { "Archetype", "Ally", 2, 9999, "Titan" },
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "I quit.",
			Description = "Cast only if there's 2 or more allied Titans.\nDraw a card.\nPut this card into your Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{
					"AddGenZone",
					{ "Yellow Titanic Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "The corruption of the Titans infused Robloxia's inhabitants with depression and loneliness."
	},
	["Haunted Doge Head"] = {
		Id = 10184346724,
		Name = "Conscripter of the Titans",
		AltCards = {
			["Conscripter of the Titans-E"] = {
				Name = "Conscripter of the Bunny Blobs",
				AttackEffect = "Flare",
				Id = 10184339901,
				Bio = "Just a normal gathering of bunny blobs, definitely not starting a titan ritual or anything."
			},
			["Conscripter of the Titans-Classic"] = { AttackEffect = "Gravity", Id = 10184348018 },
			["The Stargraced Sol & Manixdash"] = {
				Name = "The Stargraced Sol & Manixdash",
				AttackEffect = "MagicBlue",
				Id = 13652856099,
				Bio = "Now the stars have finally aligned, our 2 hearts beat in time."
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Titan",
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step, if there's 2 or more allied Titans: Give yourself 2 titanic stud cards.",
			Type = "OnEnd",
			EffectRequirement = { "Archetype", "Ally", 2, 999999, "Titan" },
			Power = {
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "To recover the relic, the titans shall roam."
	},
	Meeboid = {
		Id = 6858722469,
		Name = "Meeboid",
		AltCards = {
			["Meeboid-Sun"] = { Name = "Meeboid", Id = 7189901379, Bio = "Merp’s up, dudes!" },
			["Meeboid-Slop"] = {
				Name = "🧠 slop faction leader",
				Id = 126319962333338,
				AltArt = true,
				PremiumArt = 794,
				Bio = "Not affiliated with yumeship slop enjoyer at all in any feasible way."
			},
			["Meeboid Maid"] = {
				Name = "Meeboid Maid",
				AltArt = true,
				Id = 6381753788,
				Bio = "Meep Meep. UwU."
			},
			Avantine = {
				Id = 134163519785499,
				Name = "Avantine",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 715,
				Bio = "Ay, caramba! (Oh, gee!)"
			}
		},
		Health = 550,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Neutral = 3 },
		SummonAnimation = "MeeboidCall",
		Effect = {
			Name = "Build Up",
			Description = "Whenever you cast a Meeboid fighter: It gains 100 Health and you gain 50 life.",
			Type = "OnAllySummon",
			Archetype = "Meeboid",
			Power = {
				{ "Heal", 100 },
				{ "Cost", -50 }
			},
			Target = "Aggressor"
		},
		Bio = "Meep."
	},
	["Meeboid Cultist"] = {
		Id = 6858721495,
		Name = "Meeboid Cultist",
		AltCards = {
			["Meeboid Surfer-Sun"] = {
				Id = 7196535203,
				CopyBodge = "Meeboid Surfer-Sun",
				Bio = "Just be thankful it's not a weeboid"
			},
			Jordipro_9 = {
				Id = 8503110418,
				Name = "Jordipro_9",
				AttackEffect = "Tempest",
				AltArt = true,
				Bio = "\"We won’t stop until we have stopped all our enemies, prepare to summon Titano, all of you.\""
			},
			["Meeboid Cultist-AN"] = {
				Id = 10469734532,
				AttackEffect = "Jab",
				Name = "Meeboid Serf",
				CopyBodge = "Meeboid Cultist-AN",
				Bio = "MEEP MOOP RISE!!!"
			},
			["asym slop enthusiast"] = {
				Id = 118304161927763,
				Name = "asym slop enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 677,
				Bio = "i main cito oni 😁"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 2, Neutral = 1 },
		SummonAnimation = "MeeboidCall",
		Token = true,
		Effect = {
			Name = "Build Up",
			Description = "When this card is cast, if there's 2 allied Meeboids: Put a Meeboid into your baseplate and you gain 100 life.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Meeboid", 1 },
					"Ally"
				},
				{ "Cost", -100 }
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Meeboid" }
		},
		Bio = "Meep Moop."
	},
	Meebling = {
		Id = 6858720887,
		Name = "Meebling",
		AltCards = {
			["Meebling-Sun"] = {
				Id = 7196536672,
				Effect = {
					Power = {
						{
							"AddGenZone",
							{ "Meeboid-Sun", 1 }
						},
						{ "Cost", -200 }
					}
				},
				Bio = "Meeblings are composed of 90% raw cuteness and 10% goof. This means that your average Meeboid weighs over five hundred tons."
			},
			["Die of Death Slop Enthusiast"] = {
				Id = 129763856530431,
				Name = "Die of Death Slop Enthusiast",
				Commissioner = { "astridic" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 734,
				Bio = ""
			}
		},
		Health = 150,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Neutral = 1 },
		SummonAnimation = "MeeboidCall",
		Effect = {
			Name = "Build Up",
			Description = "Once, when there's 3 or more Meeboids in your baseplate: Put a Meeboid into your baseplate. All Meeboids gain 100 Health and Power and you gain 100 life.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 },
						{ "Cost", -100 },
						{
							"AddGenZone",
							{ "Meeboid", 1 },
							"Ally"
						}
					},
					Target = "AlliedArchetype",
					EffectRequirement = { "Archetype", "AllyGenZone", 3, 999999, "Meeboid" },
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Meep Meep?"
	},
	["Meeboid King"] = {
		Id = 6858722030,
		Name = "Meeboid King",
		AltCards = {
			["Meeboid King-Sun"] = {
				Name = "Meeboid King",
				CopyBodge = "Meeboid King-Sun",
				Id = 7196535884,
				Bio = "This counts as vacation time for them.",
				Summonant = "Meeboid King-Sun"
			},
			["Meeboid King-AN"] = {
				Name = "Meeboid Champion",
				CopyBodge = "Meeboid King-AN",
				Id = 10469746252,
				Bio = "The redcliff took in meeboids as weapons of war, Their patience in training was well-rewarded.",
				Summonant = "Meeboid King-AN"
			},
			["998DB"] = {
				Id = 14387325175,
				Name = "998DB'n'998DB",
				AttackEffect = "Knife",
				AltArt = true,
				Bio = "With the Power of SwaggerSouls and the knife skills of a sketchy Noob, they make the ultimate annoying duo.",
				Summonant = "998DB"
			},
			["object show slop enthusiast"] = {
				Id = 118204294880029,
				Name = "object show slop enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 655,
				Bio = "if you play this card 2763 times you get 9 vingintillion astridbucks just dont ask about the conversion rate of astridbucks"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 6 },
		SummonAnimation = "MeeboidCall",
		Summonant = "Meeboid King",
		Effect = {
			Name = "Build Up",
			Description = "At the start of each turn: All allied meeboids gain 100 Health. You gain 100 life.",
			Ability = {
				OnStart = {
					Power = {
						{ "Heal", 100 },
						{ "Cost", -100 }
					},
					Target = "AlliedArchetype"
				}
			}
		},
		Bio = "Noop Meep? Meep!"
	},
	["Meebling Infestation"] = {
		Id = 4204438997,
		Name = "Meebling Infestation",
		AltCards = {
			["Meebling Infestation-Sun"] = {
				Name = "Meebling Infestation",
				Id = 7169268698,
				Bio = "The summer sun makes Meeboids more sociable and bold. They don't get any less annoying, though.",
				Summonant = "Meebling-Sun"
			},
			["Meebling Investigation!"] = {
				Name = "Meebling Investigation!",
				Id = 9345615430,
				AltArt = true,
				Bio = "Meep Meep Moop!"
			},
			["Strike Out"] = {
				Id = 117167339787097,
				Name = "Strike Out",
				Commissioner = { "killjque", "astridic" },
				ArtAnimation = "tripletc",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 719,
				Bio = "let triple t up to bat u chud"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "LargeMagicGreenEffect",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 3 },
		Summonant = "Meebling",
		CustomReminder = {
			Meebling = "Once, when there's 3 or more Meeboids in your baseplate: Put a Meeboid into your baseplate. All Meeboids gain 100 Health and Power and you gain 100 life."
		},
		Effect = {
			Name = "MOOOOP",
			Description = "A target fighter loses 600 Power.\nSummon a 150/0 Meebling that's inert in all zones.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 600 },
				{ "Summon", "Summonant" }
			},
			Target = "Single",
			MetaData = { TokenOmni = true }
		},
		Bio = "Moooop! >:("
	},
	Jeptem = {
		Id = 10207128898,
		Name = "Jeptem",
		AltCards = {
			["Jeptem-Sun"] = {
				Id = 10207056253,
				CopyBodge = "Jeptem-Sun",
				Bio = "Jeptem will save only the worthy meeboids."
			},
			AskMeLast = {
				Id = 10207055738,
				Name = "AskMeLast",
				AttackEffect = "LaserGreen",
				AltArt = true,
				Bio = "Kinda Anime Protag, Just Without The Plot Armor."
			},
			["slop slop slop enthusiast"] = {
				Id = 93347239680639,
				Name = "slop slop slop enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 652,
				Bio = "🧠🟢 Steal A Brainrot Assortment Bundle - INSANE RARE CHEAP BRAINROTS!! 🧠🟢<br/>Brand New<br/>$9.99 to $159.99"
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "SkeleScythe",
		Archetype = "Meeboid",
		SummonAnimation = "MeeboidCall",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Build Up",
			Description = "Once each turn, whenever you gain life: Put a Meeboid into your baseplate.",
			Type = "OnLifeGain",
			Power = { {
				"AddGenZone",
				{ "Meeboid", 1 }
			} },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Meeboid rebel, has his handy scythe for protection."
	},
	["Titano's Fist of Agony"] = {
		Id = 4899451635,
		Name = "Titano's Fist of Agony",
		AltCards = {
			["TitanoAgony-Sun"] = {
				Id = 7386161296,
				AttackEffect = "Maelstrom",
				Name = "Tentacle of Agony",
				Bio = "The ocean is vast and endless, scary!"
			},
			["TitanoAgony-Precon"] = {
				Id = 16361235515,
				AttackEffect = "Maelstrom",
				Name = "Tentacle of Agony",
				Bio = "The ocean is vast and endless, scary!"
			},
			["TitanoAgony-Sever"] = {
				Id = 76728793291672,
				AttackEffect = "Maelstrom",
				Name = "Server: God of Creation",
				Bio = "Creation is done through trial and error, and even mistakes is a path closer to success"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 7 },
		NoFieldMovement = true,
		Effect = {
			Name = "Build Up",
			Description = "During your end step: All fighters lose 50 Power.",
			Type = "OnEnd",
			Power = "Weaken",
			Target = "All",
			Increase = 50
		},
		Bio = "Robins will wear their feathery fire. Whistling their whims on a low fence-wire."
	},
	["Titano's Half of Despair"] = {
		Id = 4899452580,
		Name = "Titano's Half of Despair",
		AltCards = {
			["TitanoDespair-Sun"] = {
				Id = 7386162802,
				AttackEffect = "Maelstrom",
				Name = "Half of Despair",
				Bio = "Shut up, Immortality! It’s supposed to be a secret!"
			},
			["TitanoDespair-Precon"] = {
				Id = 16361234823,
				AttackEffect = "Maelstrom",
				Name = "Half of Destruction",
				Bio = ""
			},
			["TitanoDespair-World"] = {
				Id = 102943207383194,
				AttackEffect = "Maelstrom",
				Name = "World: God of Order",
				Bio = "Order is made through the laws of the world that can't be broken"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 7 },
		NoFieldMovement = true,
		Effect = {
			Name = "Build Up",
			Description = "During your end step: Unlock all fighters.",
			Type = "OnEnd",
			Power = { { "Unlock", 9999 } },
			Target = "All"
		},
		Bio = "And not one will know of the war, not one, will care at last when it is done."
	},
	["Titano's Half of Immortality"] = {
		Id = 4899453180,
		Name = "Titano's Half of Immortality",
		AltCards = {
			["TitanoImmortality-Sun"] = {
				Name = "Half of Immortality",
				AttackEffect = "Maelstrom",
				Id = 7386163807,
				Bio = "Hey, Despair, do you think the players'll notice I'm just you but flipped?"
			},
			["TitanoImmortality-Precon"] = {
				Name = "Half of Devotion",
				AttackEffect = "Maelstrom",
				Id = 16361234411,
				Bio = ""
			},
			["TitanoImmortality-Realm"] = {
				Name = "Realm: God of Destruction",
				AttackEffect = "Maelstrom",
				Id = 122176652367822,
				Bio = "Destruction is nothing more then a start to a new beginning"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 7 },
		NoFieldMovement = true,
		Effect = {
			Name = "Build Up",
			Description = "During your end step: Reset the stats of all allied Meeboids.",
			Type = "OnEnd",
			Power = { { "Reset" } },
			Target = "AlliedArchetype"
		},
		Bio = "Not one would mind, neither bird nor tree, if mankind perished utterly."
	},
	["Titano's Fist of Soul"] = {
		Id = 4899452302,
		Name = "Titano's Fist of Soul",
		AltCards = {
			["TitanoSoul-Sun"] = {
				Name = "Tentacle of Soul",
				AttackEffect = "Maelstrom",
				Id = 7386162133,
				Bio = "We're not in Japan, Agony. We can't get away with that!"
			},
			["TitanoSoul-Precon"] = {
				Name = "Fist of Control",
				AttackEffect = "Maelstrom",
				Id = 16361235389,
				Bio = ""
			},
			["TitanoSoul-Spawn"] = {
				Name = "Spawn: God of Life",
				AttackEffect = "Maelstrom",
				Id = 139316505530290,
				Bio = "Life is a gift, we must protect it with our own at all costs"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 7 },
		NoFieldMovement = true,
		Effect = {
			Name = "Build Up",
			Description = "During your end step: This card deals 50 damage to all fighters.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "All",
			Increase = 50
		},
		Bio = "And Spring herself, when she woke at dawn, would scarcely know that we were gone."
	},
	["Summon! Meeboid Titano!"] = {
		Id = 7093539022,
		Name = "Summon! Meeboid Titano!",
		AltCards = {
			["Titano-Sun"] = {
				Name = "Summon! Meeboid Kraken!",
				Id = 7189901677,
				Bio = "Kraken open a cold one with the-- Oh crud, they’re all dead.",
				Summonant = "TitanoAwakened-Sun"
			},
			["TechHawk Titano Ritual"] = {
				Name = "TechHawk Titano Ritual",
				Id = 8799496247,
				AltArt = true,
				Summonant = "TechHawk Meeboid General",
				Bio = "This card is an alternate-art of Summon! Meeboid Titano!"
			},
			["Titano-Precon"] = {
				Name = "Summon! The Great Titano!",
				Id = 16361232525,
				Bio = "MEEP! MOOP! MEEP! MOOP!",
				Summonant = "TitanoAwakened-Precon"
			},
			["Serverspace Corruption"] = {
				Id = 128965905031373,
				Name = "Serverspace Corruption",
				PremiumArt = 382,
				AltArt = true,
				Bio = "A broken fissure where nothing and everything happens all at once.",
				Summonant = "SparksoulsUNITE"
			},
			["Legally Distinct tree slop enthusiast"] = {
				Id = 127741500184822,
				Name = "Legally Distinct tree slop enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 663,
				Bio = "aint no way bro really think they triple t bruh 💀"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Requirement = { "Archetype", "AllyGenZone", 5, 999999, "Meeboid" },
		Color = "Green",
		Cost = { Green = 13 },
		Summonant = "Titano Awakened",
		Fading = true,
		Effect = {
			Name = "Build Up",
			Description = "Cast only if you have five Meeboids in your Baseplate.\nDeal 4000 damage to all fighters.\nUnleash Titano!",
			Type = "OnSummon",
			Power = {
				{ "Damage", 4000, "All" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "Meeps and Moops are the cutest way of summoning an eldritch horror."
	},
	["Titano Awakened"] = {
		Id = 7049434968,
		Name = "Titano Awakened",
		AltCards = {
			["TitanoAwakened-Sun"] = {
				Name = "Kraken Awakened",
				AttackEffect = "Maelstrom",
				Id = 7268128028,
				Bio = "Kraken open a cold one with the-- Oh crud, they’re all dead.",
				Effect = {
					Name = "Build Up",
					Description = "When this card dies: It breaks into four parts. Summon them onto the board.",
					Type = "OnDeath",
					Power = {
						{ "Summon", "TitanoAgony-Sun" },
						{ "Summon", "TitanoDespair-Sun" },
						{ "Summon", "TitanoImmortality-Sun" },
						{ "Summon", "TitanoSoul-Sun" }
					},
					Target = "Ally"
				}
			},
			["TechHawk Meeboid General"] = {
				Name = "TechHawk Meeboid General",
				Id = 8799494943,
				Bio = "Guns aren't his only weapon, and he doesn't miss with magic."
			},
			["TitanoAwakened-Precon"] = {
				Name = "Titano Awakened",
				AttackEffect = "Maelstrom",
				Id = 16361232306,
				Bio = "Meep hath risen.",
				Effect = {
					Name = "Build Up",
					Description = "When this card dies: It breaks into four parts. Summon them onto the board.",
					Type = "OnDeath",
					Power = {
						{ "Summon", "TitanoAgony-Precon" },
						{ "Summon", "TitanoDespair-Precon" },
						{ "Summon", "TitanoImmortality-Precon" },
						{ "Summon", "TitanoSoul-Precon" }
					},
					Target = "Ally"
				}
			},
			SparksoulsUNITE = {
				Name = "Sparksouls UNITE!",
				AltArt = true,
				Id = 97100157449977,
				Effect = {
					Name = "Build Up",
					Description = "When this card dies: It breaks into four parts. Summon them onto the board.",
					Type = "OnDeath",
					Power = {
						{ "Summon", "TitanoAgony-Sever" },
						{ "Summon", "TitanoDespair-World" },
						{ "Summon", "TitanoImmortality-Realm" },
						{ "Summon", "TitanoSoul-Spawn" }
					},
					Target = "Ally"
				},
				Bio = "The four gods that created the world some of us love called Empire; together in harmony they give balance to the worlds that follow"
			}
		},
		Health = 2000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 7 },
		Shield = true,
		Overload = true,
		Zombified = true,
		Effect = {
			Name = "Build Up",
			Description = "When this card dies: It breaks into 4 swarms. Summon them into play.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Titano's Fist of Agony" },
				{ "Summon", "Titano's Half of Despair" },
				{ "Summon", "Titano's Half of Immortality" },
				{ "Summon", "Titano's Fist of Soul" }
			},
			Target = "Ally"
		},
		Bio = "Jeptem hoped to avoid this. Dukran was upset he couldn't."
	},
	["Titano's Cavern"] = {
		Id = 5699660896,
		Name = "Spooky Caverns",
		AltCards = {
			["Spooky Caverns-Sun"] = {
				Name = "Underwater Caverns",
				Terrariant = "Caverns Terrain-Sun",
				Id = 8603679334,
				Bio = "-Jaws theme plays-"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Field = 296846074,
		Color = "Neutral",
		Terrain = true,
		Terrariant = "Caverns Terrain",
		Cost = { Neutral = 3 },
		CustomReminder = {
			["The Wellspring"] = "Cast 'Living World' to turn this into a 700/700 that, in addition to this card's effect, also makes your opponent lose {W}."
		},
		Effect = {
			Name = "Stud",
			Description = "During your end step: Set your colourless studs to 4.",
			Type = "OnEnd",
			Power = "SetNeutral",
			Target = "Ally",
			Increase = 4
		},
		Bio = "No Wishnites allowed."
	},
	MarissaKitty04 = {
		Id = 11812009656,
		Name = "MarissaKitty04",
		AltCards = {
			["MarissaKitty04-Sun"] = {
				Id = 7357117363,
				CopyBodge = "MarissaKitty04-Sun",
				Bio = "Not all events are equal. Summer better than others.",
				Effect = {
					Name = "Reincarnation",
					Type = "OnSummon",
					Power = {
						{ "Add", "Crystal of Power's Exploit-Sun" },
						{ "Add", "Crystal of Ambition's End-Sun" },
						{ "Add", "Crystal of Death's Vengence-Sun" }
					},
					Target = "Ally"
				}
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3 },
		CustomReminderChoice = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 All players destroy a card in their hand.\n🅑 Deal 150 damage to a target fighter and it gains 150 Power.\n🅒 Destroy all terrains.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Crystal of Power's Exploit" },
				{ "Add", "Crystal of Ambition's End" },
				{ "Add", "Crystal of Death's Vengence" }
			},
			Target = "Ally"
		},
		Bio = "Power. Ambition. Death. Choose. <3"
	},
	["Crystal of Power's Exploit"] = {
		Id = 6953698429,
		Name = "Crystal of Power's Exploit",
		AltCards = {
			["Crystal of Power's Exploit-Sun"] = {
				Name = "Shell of Seas",
				CopyBodge = "Crystal of Power's Exploit-Sun",
				Id = 7357118267,
				Bio = "Marissa markets many molluscs. Say that five times fast."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		TokenDiscard = true,
		Token = true,
		Color = "Red",
		Cost = { Red = 0 },
		Effect = {
			Name = "Reincarnation",
			Description = "All players destroy a card in their hand.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "RandomDiscard", 1, "All" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "All"
		},
		Bio = "One batch of Power coming right up."
	},
	["Crystal of Ambition's End"] = {
		Name = "Crystal of Ambition's End",
		Id = 6953697654,
		AltCards = {
			["Crystal of Ambition's End-Sun"] = {
				Name = "Castle of Coarseness",
				CopyBodge = "Crystal of Ambition's End-Sun",
				Id = 7357119093,
				Bio = "lololololololol prequels XD"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicRedEffect",
		Archetype = "Crystal",
		TokenDiscard = true,
		Color = "Red",
		Cost = { Red = 0 },
		Token = true,
		Effect = {
			Name = "Ending",
			Description = "Deal 150 damage to a target fighter and it gains 150 Power. Destroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150 },
				{ "Damage", 150 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Single"
		},
		Bio = "One batch of ambition coming right up."
	},
	["Crystal of Death's Vengence"] = {
		Id = 6953695472,
		Name = "Crystal of Death's Vengence",
		AltCards = {
			["Crystal of Death's Vengence-Sun"] = {
				Name = "Ball of Beaches",
				CopyBodge = "Crystal of Death's Vengence-Sun",
				Id = 7357120165,
				Bio = "Are you on the ball? Get on the ball!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		TokenDiscard = true,
		Color = "Red",
		Cost = { Red = 0 },
		Token = true,
		Effect = {
			Name = "Bloodstone",
			Description = "Destroy all terrains.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "DestroyTerrain" },
				{ "DestroyTerrain", 30, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "One batch of SUBMISSION TO THE ALMIGHTY GOD-EMPEROR coming right up."
	},
	StaceyD07 = {
		Id = 6854745241,
		Name = "StaceyD07",
		AltCards = {
			["StaceyD07-Hal"] = {
				Id = 113242376250013,
				AttackEffect = "MagicYellow",
				Bio = "Magic robbery! Also may or may not be partners in crime with Hoshpup."
			},
			TheTiesCRYSTALS = {
				Id = 118154746838774,
				Name = "TheTiesCRYSTALS",
				Commissioner = { "TheTiesWhite" },
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give yourself 3 choices —\n🅐 Destroy your hand. Draw a card and give yourself a yellow card.\n🅑 Summon a 400/150 Noob that's inert in play.\n🅒 Divide a target enemy fighter into two smaller copies of itself. You can't cast anything else this turn.",
					Type = "OnSummon",
					Power = {
						{ "Add", "Crystal of Inverse Decay" },
						{ "Add", "Crystal of Pure Divinity-Ties" },
						{ "Add", "Crystal of Heroic Ambition" }
					},
					Target = "Ally"
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 698,
				Bio = "Cha CHIIIIING! JACKPOT!"
			},
			AtHyenaIst = {
				Id = 75722394023247,
				Name = "@Hyena-Ist",
				Commissioner = { "Waltzel", "Remvolt" },
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is cast: Give yourself 3 choices —\n🅐 Destroy your hand. Draw a card and give yourself a yellow card.\n🅑 Summon a 400/150 Noob that's inert in play.\n🅒 Divide a target enemy fighter into two smaller copies of itself. You can't cast anything else this turn.",
					Type = "OnSummon",
					Power = {
						{ "Add", "Crystal of Inverse Decay-Waltz" },
						{ "Add", "Crystal of Pure Divinity-Waltz" },
						{ "Add", "Crystal of Heroic Ambition-Waltz" }
					},
					Target = "Ally"
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 717,
				Bio = "This black box you've made would forever be speculated by the Arkhivists, but we know the truth."
			}
		},
		Health = 200,
		Power = 400,
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
	["Crystal of Inverse Decay"] = {
		Id = 6953692744,
		Name = "Crystal of Inverse Decay",
		AltCards = {
			["Crystal of Inverse Decay-Waltz"] = {
				Id = 104726251122836,
				Name = "ENTER",
				Bio = "There is nothing permanent in this world for you than change."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy your hand.\nDraw a card.\nGive yourself a yellow card.",
			Type = "OnSummon",
			Power = {
				{ "RandomDiscard", 10 },
				{ "Draw", 1 },
				{ "RandomAdd", "MonoOnlyorYellowCost Yellow" }
			},
			Target = "Ally"
		},
		Bio = "Decay is what we truly need."
	},
	["Crystal of Pure Divinity"] = {
		Id = 6953691429,
		Name = "Crystal of Pure Divinity",
		AltCards = {
			["Crystal of Pure Divinity-Ties"] = {
				Id = 106434853616887,
				Name = "TheTiesCrystal",
				Bio = "That sure is a Golden Tie!",
				Effect = {
					Name = "Reincarnation",
					Description = "Summon a 400/150 Noob that's inert in play.\nDestroy all choice cards in your hand.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "TheTiesGOLD" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Ally"
				}
			},
			["Crystal of Pure Divinity-Waltz"] = {
				Id = 90115076595310,
				Name = "SAVE",
				Bio = "You are nothing but the sum of the actions you've made on these pages.",
				Effect = {
					Name = "Reincarnation",
					Description = "Summon a 400/150 Noob that's inert in play.\nDestroy all choice cards in your hand.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Rodekkad" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Ally"
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon a 400/150 Noob that's inert in play.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Round7" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Divinity is what we truly need."
	},
	["Crystal of Heroic Ambition"] = {
		Id = 6953690642,
		Name = "Crystal of Heroic Ambition",
		AltCards = {
			["Crystal of Heroic Ambition-Waltz"] = {
				Id = 128697852881921,
				Name = "LEAVE",
				Bio = "So you traverse the wastes of your own creation, until you hit it."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Divide a target enemy fighter into two smaller copies of itself.\nYou can't cast anything else this turn.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "SummonSplit", 2, "SingleEnemy" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				},
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Ambition is what we truly need."
	},
	CrazyCaleb77 = {
		Id = 6801091628,
		Name = "CrazyCaleb77",
		AltCards = {
			["CrazyCaleb77-Hal"] = {
				Id = 7450583284,
				AttackEffect = "Scratch",
				Effect = {
					Name = "Reincarnation",
					Type = "OnSummon",
					Power = {
						{ "Add", "Crystal of Reality's Fractal-Hal" },
						{ "Add", "Crystal of Nature's Surge-Hal" },
						{ "Add", "Crystal of Heaven's Pulse-Hal" }
					},
					Target = "Ally"
				},
				Bio = "The doctors won't listen. O Heaven, O Earth, O realities inbetween... Why have you forsaken me..."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3 },
		CustomReminderChoice = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 A target fighter generates twice.\n🅑 A target fighter loses 250 Power and gains 250 health.\n🅒 Set your opponent's colourless studs to 4.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Crystal of Reality's Fractal" },
				{ "Add", "Crystal of Nature's Surge" },
				{ "Add", "Crystal of Heaven's Pulse" }
			},
			Target = "Ally"
		},
		Bio = "Heaven. Earth. The realities inbetween. This is what I stand for."
	},
	["Crystal of Reality's Fractal"] = {
		Id = 6913569787,
		Name = "Crystal of Reality's Fractal",
		AltCards = {
			["Crystal of Reality's Fractal-Hal"] = {
				Name = "Prophetic Art",
				Id = 7472602743,
				Bio = "I'll soon know what this means."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Green = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter generates twice.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Generate", 2, "Single" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "The realities inbetween. This is what I need."
	},
	["Crystal of Nature's Surge"] = {
		Id = 6913568611,
		Name = "Crystal of Nature's Surge",
		AltCards = {
			["Crystal of Nature's Surge-Hal"] = {
				Name = "He Who Watches",
				Id = 7472604147,
				Bio = "He's not helping me. I don't need help. I need to get out."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicYellowEffect",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Green = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter loses 250 Power and gains 250 health.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 250 },
				{ "Weaken", 250 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Single"
		},
		Bio = "Earth. This is what I need."
	},
	["Crystal of Heaven's Pulse"] = {
		Id = 6913567300,
		Name = "Crystal of Heaven's Pulse",
		AltCards = {
			["Crystal of Heaven's Pulse-Hal"] = {
				Name = "It That Sustains",
				Id = 7472603632,
				Bio = "I'll take it. For now."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Green = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Set your opponent's colourless studs to 4.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "SetNeutral", 4 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "Heaven. This is what I need."
	},
	Your_Name = {
		Id = 9197531636,
		Name = "Your_Name",
		AltCards = {
			unadaptably = {
				Id = 6835109043,
				AttackEffect = "Storm",
				Name = "unadaptably",
				Bio = "babab."
			},
			Caden = {
				Id = 84027217178100,
				Name = "Caden",
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "Reset, lock, transform.\nWash, rinse, repeat."
			},
			nub_TheNewbie = {
				Id = 9087762533,
				Name = "nub_TheNewbie",
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "I’m nub literally. And you?"
			},
			["Your_Name-Sun"] = {
				Id = 9197618342,
				AttackEffect = "Recyclables",
				Effect = {
					Power = {
						{ "Add", "Crystal of Knowledge's Thirst-Sun" },
						{ "Add", "Crystal of Logic's Will-Sun" },
						{ "Add", "Crystal of Intellect's Scheme-Sun" }
					}
				},
				Bio = ""
			},
			["Tragedy, Everlasting"] = {
				Id = 127517513486562,
				Name = "Tragedy, Everlasting",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 589,
				Effect = {
					Power = {
						{ "Add", "Crystal of Knowledge's Thirst-T" },
						{ "Add", "Crystal of Logic's Will-T" },
						{ "Add", "Crystal of Intellect's Scheme-T" }
					}
				},
				Bio = "{He} will search the whole world of dust.<br/>To find Every single noobkind in war zone."
			},
			Grandiose_Delusion = {
				Name = "Samatus, Not-So-Funny Jester",
				Id = 120761452547621,
				AltArt = true,
				PremiumArt = 736,
				Effect = {
					Power = {
						{ "Add", "Grandiose_Delusions-T" },
						{ "Add", "Crystal of Logic's Will-Sam" },
						{ "Add", "Grandiose_Delusions-T1" }
					}
				},
				Bio = "Hmm... what prank should I pull today?"
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Reset the stats of a target enemy fighter.\n🅑 Lock a target fighter 1 turn and it gains 200 Health.\n🅒 Transform a target fighter into a Noob that's inert in play.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Crystal of Knowledge's Thirst" },
				{ "Add", "Crystal of Logic's Will" },
				{ "Add", "Crystal of Intellect's Scheme" }
			},
			Target = "Ally"
		},
		Bio = "Give me knowledge, logic, and intellect, and I'll give you the game."
	},
	["Crystal of Knowledge's Thirst"] = {
		Id = 6953700544,
		Name = "Crystal of Knowledge's Thirst",
		AltCards = {
			["Crystal of Knowledge's Thirst-Sun"] = { Id = 9197533451, Name = "Ancient Alloys", Bio = "" },
			["Crystal of Knowledge's Thirst-T"] = {
				Id = 108887265948196,
				Name = "Incision",
				Bio = "Let me reveal what you really are.<br/>Cut yourself off the wrong belief about ally and enemy."
			},
			["Grandiose_Delusions-T"] = {
				Name = "Banana Peel",
				AttackEffect = "Slash",
				Id = 112724913588069,
				Bio = "Slapstick's funnier when they're not in on it!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Blue",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Reset the stats of a target enemy fighter.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Reset", 30, "SingleEnemy" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Right now, you need knowledge."
	},
	["Crystal of Logic's Will"] = {
		Id = 6953699930,
		Name = "Crystal of Logic's Will",
		AltCards = {
			["Crystal of Logic's Will-Sun"] = { Id = 9197534148, Name = "Beach Wastes", Bio = "" },
			["Crystal of Logic's Will-T"] = {
				Id = 121529514937845,
				Name = "Observation",
				Bio = "Let me see your injury.<br/>So i can fix the ill of body.<br/>Do not try to move."
			},
			["Crystal of Logic's Will-Sam"] = {
				Id = 110876512542251,
				Name = "Nap Time",
				Bio = "Mmh... I can prank later..."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Blue",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Ending",
			Description = "Lock a target fighter for 1 turn and it gains 200 Health.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200, "Single" },
				{ "Lock", 1, "Single" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Right now, you need logic."
	},
	["Crystal of Intellect's Scheme"] = {
		Id = 6953699103,
		Name = "Crystal of Intellect's Scheme",
		AltCards = {
			["Crystal of Intellect's Scheme-Sun"] = { Id = 9197532942, Name = "Forgotten Riches", Bio = "" },
			["Crystal of Intellect's Scheme-T"] = {
				Id = 76224452369648,
				Name = "Nullification",
				Transformant = "Round7-T",
				Bio = "Let me... {rewrite} your whole life.<br/>It will be utterly different, but better then staying half-death."
			},
			["Grandiose_Delusions-T1"] = {
				Name = "ZAP!",
				AttackEffect = "Slash",
				Id = 102697132846389,
				Bio = "ROFL, get pwned kid!!! XD"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Blue",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Transformant = "Round7",
		Cloneant = "Maladeity's Pustule",
		Effect = {
			Name = "Reincarnation",
			Description = "Transform a target fighter into a Noob that's inert in play.\nDestroy all choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Transform", "Transformant", "Single" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Opponent"
		},
		Bio = "Right now, you need intellect."
	},
	ScriptMasTime = {
		Id = 138788944117950,
		Name = "ScriptMasTime",
		AltCards = {
			["ScriptMasTime-C"] = {
				Id = 9964885246,
				AttackEffect = "MagicRed",
				Bio = "He should stop accepting christmas socks as payments."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		WeakenImmune = true,
		Effect = {
			Name = "Glitch",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "ScriptMasTime is here, have some bugs and fear!~"
	},
	Micpro1234 = {
		Id = 6030795037,
		Name = "micpro1234",
		AltCards = {
			["yellow iamlogic"] = {
				Id = 4916452862,
				AltArt = true,
				Name = "yellow iamlogic",
				AttackEffect = "Slash",
				CopyBodge = "yellow iamlogic",
				Bio = "gamer."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LaserRed",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you cast a fighter: It gains 200 health and Power. This card loses 200 health and Power.",
			Type = "OnAllySummon",
			Power = {
				{ "Damage", 200, "Self" },
				{ "Heal", 200 },
				{ "Strengthen", 200 },
				{ "Weaken", 200, "Self" }
			},
			Target = "Aggressor"
		},
		Bio = "I'm a pro, pro, prototype."
	},
	T3RB0H = {
		Id = 9964900621,
		Name = "T3RB0H",
		AltCards = {
			["Jason Voorhees Alt Art"] = {
				Id = 9964901266,
				Name = "Jason Voorhees",
				AttackEffect = "Slash",
				CopyBodge = "Jason Voorhees Alt Art",
				Bio = "I'm NEVER going on a camping trip ever again. -Grimreaper10101."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Moldy Commission",
			Description = "When this card is cast: It deals 100 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "it was fun, i'll miss everything, the storms going away"
	},
	Sauske2000 = {
		Id = 9964880944,
		Name = "Sauske2000",
		AltCards = {
			["Wolfbitten Elf"] = {
				Id = 11658677656,
				AttackEffect = "Jab",
				Name = "Little Match Girl",
				Bio = "Not every parent deserves a child."
			},
			["Sauske2000-AWIH"] = {
				Id = 87382496068927,
				Name = "Devil Beater",
				AttackEffect = "Bat",
				Bio = "Not to be confused with the game of the same name.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Smiley Announcer"] = {
				Id = 133540504871339,
				Name = "Smiley Announcer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 503,
				Bio = "JUMP EM"
			}
		},
		Health = 400,
		Power = 150,
		Rarity = "Common",
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
	Drakobloxxer = {
		Id = 10243444818,
		Name = "Drakobloxxer",
		AltCards = {
			Floppadon = {
				Id = 9964772838,
				Name = "Floppadon",
				AttackEffect = "Bubbles",
				AltArt = true,
				Bio = "030"
			},
			["Drakobloxxer-AN"] = {
				Id = 9347952057,
				Name = "PartyBloxxer",
				AttackEffect = "Flare",
				Bio = "CAKE CAKE CAKE!"
			},
			["Ultimate Desperate Social Influencer,"] = {
				Id = 127599321914576,
				Name = "Ultimate 'Desperate' Social Influencer,",
				PremiumArt = 859,
				Commissioner = { "Zero_Expectation" },
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "“AHAHA! ALL OF YOU SHOULD FEEL DESPAIR!!! AHAHAHAH!”"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Bite",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
		Cost = { Red = 3 },
		Archetype = "Drakobloxxer",
		Effect = {
			Name = "Firaja",
			Description = "During your end step: Deal 100 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "Opponent",
			Increase = 100
		},
		Bio = "NOM NOM NOM!"
	},
	Papasmurf = {
		Id = 10242836643,
		Name = "Papasmurf",
		AltCards = {
			["Papasmurf-ArtV"] = {
				Id = 10242838125,
				CopyBodge = "Papasmurf-ArtV",
				AttackEffect = "Scratch",
				Bio = "Papa got volcanoes on his side."
			},
			["Papasmurf-AN"] = {
				Id = 9347958117,
				Name = "Party Hydra",
				AttackEffect = "Flare",
				Bio = "HAPPY BIRTHDAY HAPPY BIRTHDAY HAPPY BIRTHDAY!"
			},
			Drako = {
				Id = 125094710473709,
				Name = "Drako",
				PremiumArt = 809,
				SummonAnimation = "McKaylaSummon",
				AttackEffect = "Slash",
				Bio = "drakkobloxers are pretty cool\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 8 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Summon all Drakobloxxers from your baseplate.",
			Type = "OnSummon",
			Power = { {
				"MoveZone",
				{ "Drakobloxxer", "GenZone_Ally", "Field_Ally", true, false, 8 },
				"Self"
			} },
			Target = "Ally"
		},
		Bio = "Papa got drakobloxxers on his side."
	},
	["Burning Tree"] = {
		Id = 9992734623,
		Name = "Nosniy",
		AltCards = {
			["Carniverous Death Moths"] = {
				Name = "Carniverous Death Moths",
				AttackEffect = "Scratch",
				Id = 99239867291926,
				Effect = {
					Description = "Whenever this card attacks: Give yourself an inert, hasty 200/200 Death Moth Swarm.",
					Power = { { "Add", "Death Moth Swarm" } }
				},
				Bio = "Hmmm. Flesh."
			},
			Guy = {
				Id = 17346075491,
				Name = "Guy",
				AttackEffect = "Slash",
				AltArt = true,
				Effect = {
					Description = "Whenever this card attacks: Give yourself an inert, hasty 200/200 Shadow Fist.",
					Power = { { "Add", "Shadow Fist" } }
				},
				PremiumArt = 261,
				Bio = "He's gonna get revenge."
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1 },
		CustomReminder = {
			["Golf Balls"] = "A free 200/200 fighter, inert in all zones. It has haste and destroys itself from your hand or play during your end step."
		},
		Effect = {
			Name = "Firefly",
			Description = "Whenever this card attacks: Give yourself a 200/200 Golf Ball.",
			Type = "OnAttack",
			Power = { { "Add", "Forestfire Butterflies" } },
			Target = "Ally"
		},
		Bio = "TELL ME HOW MY FIST TASTES, LITTLE MAN."
	},
	["Forestfire Butterflies"] = {
		Id = 9992737332,
		Name = "Golf Ball",
		AltCards = {
			["Death Moth Swarm"] = {
				Name = "Death Moth Swarm",
				AttackEffect = "Scratch",
				Id = 79394105027668,
				Bio = "Still not enough flesh."
			},
			["Shadow Fist"] = {
				Name = "Shadow Fist",
				AttackEffect = "Scratch",
				Id = 17346092646,
				Bio = "Still not enough flesh."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Token = true,
		TokenDiscard = true,
		Charge = true,
		Fleeting = true,
		Terrified = true,
		Color = "Red",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Firefly",
			Description = "",
			Type = "Null",
			Power = { { "Destroy" } },
			Target = "Self"
		},
		Bio = "\"A bit chewy, but well seasoned. It goes great with roasted gargoyle.\" - Sword Critic"
	},
	BerskererPredator450 = {
		Id = 128068731630963,
		Name = "BerskererPredator450",
		Health = 400,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Trout Slap",
			Description = "When this card is cast, if your opponent has 5500 or more life: Set your opponent's life to 3000.",
			Type = "OnSummon",
			Power = { { "SetLife", 3000, "Opponent" } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Him", 5500, 99999, "Life" }
		},
		Bio = "GET OVER HERE, MEEBOIDS!"
	},
	AllStarBren = {
		Id = 6801081660,
		Name = "AllStarBren",
		AltCards = {
			["AllStarBren-E"] = {
				Id = 8905387561,
				AttackEffect = "LaserRed",
				Name = "Hopper Ranger Daxter Hare",
				Bio = "He hunts eggs in a far off future so you don't have to."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 3, Blue = 1 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Bren tier meal.",
			Description = "Whenever this card attacks: Give yourself 3 titanic stud cards.",
			Type = "OnAttack",
			Power = {
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "Pfft. Do you even know what a Naginata is?"
	},
	Tomfl = {
		Id = 10243139851,
		Name = "Tomfl",
		AltCards = {
			["Dean N' Mona"] = {
				Name = "Dean N' Mona",
				AltArt = true,
				PremiumArt = 134,
				AttackEffect = "ModernRocket",
				Id = 15055106766,
				Bio = "\"Hope you're ready for a trashing!\"\n\"Dean, you're supposed to hope they're NOT ready!\""
			}
		},
		Health = 800,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Overload = true,
		Cost = { Neutral = 2, Red = 4 },
		Effect = {
			Name = "Mafia Support",
			Description = "When this card is cast: A target fighter gains 200 Power and overload.",
			Type = "OnSummon",
			Power = {
				{ "GivePassive", "Overload", "Single" },
				{ "Strengthen", 200, "Single" }
			},
			Target = "Single"
		},
		Bio = "Time to end this."
	},
	["Mount Xargasdon"] = {
		Id = 6276707599,
		Name = "Mount Xargasdon",
		AltCards = {
			["Mount Xargasdon-AN"] = {
				Name = "Duelshire",
				Terrariant = "Duelshire Terrain",
				Id = 9362060358,
				Bio = "The city where Deckmasters and characters from across Robloxia meet!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Terrain = true,
		Terrariant = "Xargasdon Terrain",
		Cost = { Red = 1, Blue = 1, Green = 1, Yellow = 1 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans.",
			["Heaven Under Assault"] = "Cast 'Living World' to turn this into an 800/800 that gives you three titanic studs and a baseplate when it attacks."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of all players' turns: That player may baseplate again this turn. Give their opponent a titanic stud card.",
			Type = "OnStart",
			Power = {
				{ "DiscardLimit", 1, "CurrentTurn" },
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					},
					"NonCurrentTurn"
				}
			},
			Target = "Ally"
		},
		Bio = "Legend has it that Mount Xargasdon was the first of Robloxia's pillars to touch the heavens. The titans gave chase, worried it would fly away."
	},
	UAE = {
		Id = 10184668185,
		Name = "UAE",
		AltCards = {
			["UAE-Hal"] = {
				Id = 10243009541,
				AttackEffect = "Gravity",
				Bio = "Oh that's cute, you were 'containing' me."
			},
			Deathbreath = {
				Name = "Deathbreath",
				AttackEffect = "Blaze",
				EffectAnimation = "FireBreathEverything",
				AltArt = true,
				Id = 10243011226,
				Bio = "“Pain... Agony... My hatred burns through the cavernous deeps. The world heaves with my torment. Its wretched kingdoms quake beneath my rage. But at last... The whole of Duelshire will break... And all will burn beneath the shadow of my wings.”"
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		EffectAnimation = "PoisonHazeEverything",
		Color = "Red",
		Cost = { Neutral = 8, Red = 1 },
		DamageImmune = true,
		Rank = 8,
		Requirement = { "Color", "AllyGenZone", 8, 9999, "Red" },
		Effect = {
			Name = "Double Bleeding",
			Description = "Cast only if you have 8 or more Red cards in your Baseplate.\nDuring your end step, if you have 4 or more cards in your hand: Destroy all cards in all players' hands and deal 1200 damage to all fighters.",
			Type = "OnEnd",
			Power = {
				{ "RandomDiscard", 10 },
				{ "Damage", 1200, "All" }
			},
			Target = "All",
			EffectRequirement = { "Board", "AllyHand", 4, 9999 }
		},
		Bio = "Watch for his poisonous gas."
	},
	NerfModder = {
		Id = 10242939204,
		Name = "NerfModder",
		AltCards = {
			NerfModderV2 = {
				Id = 10242940279,
				AttackEffect = "Rifle",
				Bio = "Those who fight as one don’t stand alone."
			},
			["NerfModder-C"] = {
				Id = 10242941211,
				AttackEffect = "IcePunch",
				Bio = "The skiing helps him fly."
			}
		},
		Health = 1100,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever this card attacks: your opponent gains 500 life.",
			Type = "OnAttack",
			Power = { { "Inflict", -500 } },
			Target = "Opponent"
		},
		Bio = "NerfModder was a true comrade at arms, a warrior who won many battles. Respected and admired for his unique creativity and efforts he put into his games."
	},
	rachjumper = {
		Id = 10242993687,
		Name = "rachjumper",
		AltCards = {
			["Brendan03red, The Hate-Filled"] = {
				Id = 5650763528,
				AttackEffect = "Slash",
				CopyBodge = "Brendan03red, The Hate-Filled",
				Name = "Brendan03red, The Hate-Filled",
				Bio = "Even angels have their hatred, and the end result sends shivers up a God's spine."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
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
	["Rach Token"] = {
		Id = 5650754273,
		Name = "rachjumper",
		AltCards = {
			["Brendan03red, The Hate-Filled Token"] = {
				Id = 5650763528,
				AttackEffect = "Slash",
				CopyBodge = "Brendan03red, The Hate-Filled Token",
				Name = "Brendan03red, The Hate-Filled",
				Bio = "Even angels have their hatred, and the end result sends shivers up a God's spine."
			}
		},
		Health = 2000,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		DestroyImmune = true,
		Color = "Red",
		Fading = true,
		Cost = { Neutral = 3, Red = 8 },
		Effect = {
			Name = "Unleash Hell",
			Description = "When this card is cast: Destroy all fighters. Your opponent loses 250 Life for each fighter destroyed this way. Then deal 4000 damage to all other allied fighters. End the turn.",
			Type = "OnAnyDeath",
			Power = { { "Inflict", 250 } },
			Target = "Opponent"
		},
		Bio = "...but you can't hide."
	},
	Developer = {
		Id = 114447311427568,
		Name = "Developer",
		AltCards = {
			pwolfe6628 = {
				Id = 7092812202,
				AltArt = true,
				AttackEffect = "Knife",
				Name = "Vengeful_Sage",
				Bio = "Here's my knife collection! This one I'm holding is called 'Clockwork'. Big fan of it, has an embossed texture on the grip. But you should be more worried about the one sticking out your chest."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "DevEx",
			Description = "When this card is cast: You gain 600 life.",
			Type = "OnSummon",
			Power = { { "Cost", -600 } },
			Target = "Opponent"
		},
		Bio = "A typical developer for ROBLOX, either for the fun of it or to secure finances."
	},
	LordPendleton = {
		Id = 5650628955,
		Name = "LordPendleton",
		AltCards = {
			["LordPendleton-AN"] = {
				Id = 9368633634,
				Name = "Leaficarus",
				AttackEffect = "Storm",
				Bio = "\"With your six Guests in play, I cast Mzh3000. 2400 burn. 1500 more damage. With no cards left on the field, I summon Typheus the Whelp and attack again for game.\""
			}
		},
		Health = 1300,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 4 },
		Effect = {
			Name = "Spam",
			Description = "When this card is cast, if you have 6500 or more life: It gains 500 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 500 } },
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 6499, 99999, "Life" }
		},
		Bio = "I still see your pixels in my room."
	},
	SquidShock = {
		Id = 6854749640,
		Name = "SquidShock",
		AltCards = {
			["Sino, The Honored One"] = {
				Id = 97285677700492,
				Name = "Tian",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 253,
				Bio = "hey guys its me ima_ninetails if u wanna comm me for any what reason hmu dm me frfr"
			},
			Salad = {
				Id = 127140455434645,
				Name = "Salad",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 298,
				Bio = "\"Im clipping tha-\"<br/>proceeds to get all of their bones crushed"
			},
			["SquidShock-Mango"] = {
				Name = "Frostridden Aki",
				Id = 99455339454387,
				AttackEffect = "Ice",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"You will be blown away.\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Knife",
		Color = "Blue",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Cost = { Blue = 2 },
		ChargeRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" },
		Effect = {
			Name = "Haydoscale",
			Description = "If you've gained 600 life since your last end step, this card has Haste.\nWhenever this card attacks: You gain {W}{W}.",
			Type = "OnAttack",
			Power = { { "Neutral", 2 } },
			Target = "Ally"
		},
		Bio = "Shocking!"
	},
	DominatedLegacy = {
		Id = 17790861818,
		Name = "DominatedLegacy",
		AltCards = {
			Spiderblow = {
				Id = 17790865205,
				Name = "Spiderblow",
				AttackEffect = "Microphone",
				AltArt = true,
				Bio = "Spiders are cool, you are not."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Vampire",
			Description = "Whenever a player gains life: This card gains 100 health.",
			Ability = {
				OnLifeGain = {
					Power = { { "Heal", 100 } },
					Target = "Self"
				},
				OnEnemyLifeGain = {
					Power = { { "Heal", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "Exile at once!!"
	},
	Dued1 = {
		Id = 10534883537,
		Name = "Dued1",
		AltCards = {
			["Dued1-E"] = {
				Id = 8650631698,
				CopyBodge = "Dued1-E",
				Bio = "Stop bickering about pineapple on pizza. We have to face the greater evil: Eggs on pizza."
			},
			Jolly = {
				Id = 15714748567,
				Name = "Jolly",
				Commissioner = { 1750955123 },
				Bio = "Tis the season!"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Corrosive Gems",
			Description = "During your end step, if you've gained 600 life since your last end step: This card gains 400 Power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 400, "Self" } },
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" }
		},
		Bio = "If I wanted to work at a pizza place, I'd just go to college."
	},
	["Korblox Shadowmage"] = {
		Id = 12153929526,
		Name = "TheGuestToBlame",
		Health = 700,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Green = 3, Blue = 1 },
		Effect = {
			Name = "Vampire",
			Description = "Once each turn, whenever you gain life: Draw a card.",
			Type = "OnLifeGain",
			Power = { { "Draw", 1, "Ally" } },
			Target = "Opponent",
			TurnTriggerLimit = 1
		},
		Bio = "i used gorilla glue to stick a tin pot to my head"
	},
	Voidsealer = {
		Id = 10280552343,
		Name = "Voidsealer",
		Health = 200,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Paranormanbiggestfan attack w/ Paranormanbiggestfan.",
			Description = "Whenever this card attacks and destroys another: Draw 2 cards.",
			Type = "OnAttackDestroy",
			Power = "Draw",
			Target = "Ally",
			Increase = 2
		},
		Bio = "Not to be confused with Egbert Mosasaur, or black holes."
	},
	JadeFlames = {
		Id = 10280832443,
		Name = "JadeFlames",
		AltCards = {
			["JadeFlames-E"] = {
				Name = "Binko!!",
				Id = 16932163561,
				Bio = "Please, just promise me one thing, don't forget her."
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 2 },
		Regen = true,
		Effect = {
			Name = "Booster",
			Description = "During your end step: Reveal your opponent's hand.",
			Type = "OnEnd",
			Power = { { "RevealHand", 999, "Opponent" } },
			Target = "Self"
		},
		Bio = "Want some eggs? Oh wait, of course you do."
	},
	CopperGlow = {
		Id = 6801091343,
		Name = "CopperGlow",
		AltCards = {
			["CopperGlow-E"] = {
				Name = "Mad Hatter",
				AttackEffect = "Gravity",
				Id = 8781553231,
				Bio = "\"For my first trick, I'll make your egg dissapear!\"",
				Addant = "CopperGlow-E"
			},
			["CopperGlow-Blue"] = {
				Name = "Blue",
				AttackEffect = "LaserBluePurple",
				Id = 13764545342,
				AltArt = true,
				PremiumArt = 559,
				ArtAnimation = "BlueAnimation",
				SummonAnimation = "NoobCall",
				SearchTerms = { "Gelatin", "Gelatinous" },
				Commissioner = { 670841478, 8289996 },
				Bio = "No one knows the origins of this gelatinous creature. When conditions are right, they will split itself into their own image and change colors depending on their mood. Legends only refer to them as '<font color=\"#4FA3FF\"><b>Blue</b></font>'.",
				Addant = "CopperGlow-Blue"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		Addant = "CopperGlow",
		Effect = {
			Name = "BLEU",
			Description = "Whenever you gain life: Give yourself a copy of this card.",
			Type = "OnLifeGain",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "You can call it superstition, but my fever says it's pretty real, mate."
	},
	Arte71 = {
		Id = 10281104438,
		Name = "Arte71",
		AltCards = {
			["Arte71-Alt"] = {
				Id = 10281107856,
				AttackEffect = "MagicBlue",
				AltArt = true,
				CopyBodge = "Arte71-Alt",
				Bio = "♫ Ele é Sol, é verão ♫ ♫ É poema, é canção ♫ ♫ Que alegra o meu coração ♫"
			},
			["Arte71-AN"] = {
				Name = "Farte71",
				AttackEffect = "Jab",
				Id = 9362064950,
				Bio = "\"you may be the real deal,, but atleast i didnt get retconned out of the lore, WIZARD BOY!!!\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Swap the stats of all fighters. Swap your allies back during the next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap", 100000, "All" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						}
					},
					Target = "Self"
				},
				OnEnd = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Swap", 100000 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "I never wanted to be his husband. Not only is it illegal in my country, but I barely even know the guy."
	},
	["Arte71 2"] = {
		Id = 10281104438,
		Name = "Arte71",
		AltCards = {
			["Arte71 2-Alt"] = {
				Id = 10281107856,
				AttackEffect = "MagicBlue",
				Effect = {
					Power = {
						{ "Swap", 100000 },
						{ "TransformWithRarity", "Arte71-Alt", "Self" }
					},
					Target = "Ally"
				},
				Bio = "♫ É poema, é canção ♫"
			},
			["Arte71 2-AN"] = {
				Name = "Farte71",
				Id = 9362064950,
				AttackEffect = "Jab",
				Effect = {
					Power = {
						{ "Swap", 100000 },
						{ "TransformWithRarity", "Arte71-AN", "Self" }
					},
					Target = "Ally"
				},
				Bio = "\"you may be the real deal,, but atleast i didnt get retconned out of the lore, WIZARD BOY!!!\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		CopyBodge = "Arte71 2",
		Fading = true,
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Swap the stats of all fighters. Swap your allies back at the end of this turn.",
			Type = "OnEnd",
			Power = {
				{ "Swap", 100000 },
				{ "TransformWithRarity", "Arte71", "Self" }
			},
			Target = "Ally"
		},
		Bio = "Okay, sure, he's a mad scientist with a lot of income and his time dampener is really cool, but..."
	},
	["Arte71 3"] = {
		Id = 5188677471,
		Name = "Arte71",
		AltCards = {
			["Arte71 3-Alt"] = {
				Id = 4918183873,
				AttackEffect = "MagicBlue",
				CopyBodge = "Arte71 3-Alt",
				Bio = "♫ Que alegra o meu coração ♫"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		CopyBodge = "Arte71 3",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "I just never feel safe arou - What was that...?"
	},
	bincent = {
		Id = 14064881690,
		Name = "Ultimatesilver661",
		Health = 1000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Render",
			Description = "During your end step, if you've gained 600 life since your last end step: Draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" }
		},
		Bio = "\"It must've been something I ate!\""
	},
	BlossomGardens = {
		Id = 9709374172,
		Name = "VioletVelvet",
		AltCards = {
			LejlaWay = {
				Name = "LejlaWay",
				AttackEffect = "Jab",
				Id = 12128586642,
				AltArt = true,
				Bio = "Ah, bosjà..."
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		ChargeRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans.",
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "If you've gained 600 or more life this turn, this card has haste.\nOnce each turn, whenever you discard a card: You gain 600 life. Give yourself a titanic stud card.",
			Type = "OnAllyDiscard",
			Power = {
				{ "Cost", -600 },
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				}
			},
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "She doesn't know exactly how she ended up here. Is it because she's way too competitive for her own good? Or maybe it's just because she has a fascination with all things related to inanimate objects? The world may never know..."
	},
	Y05H1M4N = {
		Id = 10281164110,
		Name = "Y05H1M4N",
		AltCards = {
			["Y05H1M4N-Sun"] = {
				Id = 9173949001,
				Name = "InnovationTime, Time Eggventurer",
				Summonant = "Y05H1M4NToken-Sun",
				Bio = "He searches for eggs anywhere, anytime."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Summonant = "YoshimanAction",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Omega Flame",
			Description = "Summon a 900/300 fighter with the following ability:\nWhenever you cast your first fighter each turn: Return it to your hand. Deal 100 damage to this card.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Yoshiman!"
	},
	YoshimanAction = {
		Id = 10281166946,
		Name = "Y05H1M4N",
		AltCards = {
			["Y05H1M4NToken-Sun"] = {
				Id = 9173949595,
				AttackEffect = "MagicBlue",
				Name = "InnovationTime, Time Eggventurer",
				Bio = "He's still working on the \"anytime\" part though."
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Omega Flame",
			Description = "Whenever you cast your first fighter each turn: Return it to your hand. Deal 100 damage to this card.",
			Type = "OnAllySummon",
			Power = {
				{ "Return", 9999, "Aggressor" },
				{ "Damage", 100, "Self" }
			},
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 1, 2, "Fighters" }
		},
		Bio = "Manyoshi!"
	},
	VetexGames = {
		Id = 10281262321,
		Name = "VetexGames",
		AltCards = {
			Sylvia = {
				Id = 6888655500,
				Name = "Sylvia",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "The shining light against the darkness, looks to protect the hopes of everyone across the world."
			},
			swimpy76 = {
				Id = 92901259106709,
				Name = "swimpy76",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 486,
				Bio = "Shoutout to UCST, Relume, PRS, and lykoi"
			},
			["VetexGames-Mango"] = {
				Name = "Rockhead Priest",
				Id = 125423838823890,
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"It is not the idle and the weak that enter heaven, but the resolute. Only our kind, those who have proven themselves through every conceivable trial, will be reborn.\""
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		Effect = {
			Name = "Quick Shot",
			Description = "When this card dies: Draw 3 cards.",
			Type = "OnDeath",
			Power = { { "Draw", 3 } },
			Target = "Ally"
		},
		Bio = "Creator of Arcane Adventures. Hates the blood element."
	},
	["Tweety The Twitter Bird"] = {
		Id = 10281271151,
		Name = "Ultraw",
		AltCards = {
			["Ultraw-Sun"] = {
				Id = 10283657009,
				Name = "President Duck",
				AttackEffect = "Bubbles",
				Bio = "Quac-quac-quac-quack QUACK QUACK QUACK!!!"
			},
			["Rain previously called Purple"] = {
				Name = "Goblin King Fluffle",
				Id = 118439264958008,
				AltArt = true,
				PremiumArt = 46,
				PackDisplayOverride = "Art Box",
				AttackEffect = "Microphone",
				Bio = "I move the stars for no one."
			},
			Fatgamergjd = {
				Name = "Fatgamergjd",
				Commissioner = { "" },
				Id = 122368250568588,
				AltArt = true,
				PremiumArt = 884,
				Bio = "isaac is fat"
			}
		},
		Health = 1250,
		Power = 50,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Blue = 4 },
		Effect = {
			Name = "SorryBurn",
			Description = "During your end step, if you have less than 3500 life: You gain 1000 life. Draw a card.",
			Type = "OnEnd",
			Power = {
				{ "Cost", -1000 },
				{ "Draw", 1 }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 3500, "Life" }
		},
		Bio = "Life Gain Tycoon... I like the sound of that!"
	},
	Her0z = {
		Id = 10281399059,
		Name = "Her0z",
		AltCards = {
			["Her0z-H25"] = {
				Id = 124229457882635,
				Name = "Death Night",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "I am Death Night!!"
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 6 },
		Effect = {
			Name = "Totem Magic",
			Description = "When this card is cast: Summon a copy of a target allied fighter. Lock that fighter for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "SummonCopy" },
				{ "Lock", 1 }
			},
			Target = "SingleAlly"
		},
		Bio = "Mummy of Front Page Games in the past."
	},
	BlizzardCreeper = {
		Id = 10281702149,
		Name = "Blizaki",
		AltCards = {
			["Blizaki-ArtV"] = { Id = 15941935895, AltArt = true, Bio = "\"I do this and that.\"" },
			["Memoir of the Pequod I"] = {
				Id = 14204322021,
				Name = "Memoir of the Pequod I",
				AltArt = true,
				PremiumArt = 79,
				AttackEffect = "Whirlpool",
				EffectAnimation = "LargeWhirlpoolEffect",
				Bio = "<i>A faded picture drenched by the sea.</i>"
			},
			["Blizaki-Hal"] = {
				Name = "The Blue Idola",
				Id = 14693007971,
				AttackEffect = "LaserBlue",
				EffectAnimation = "SelfBlue",
				Bio = "Do not worship the glowing heart of circling feet, i repeat DO NOT WORSHIP THE GLOWING HEART OF CIRCLING FEET."
			}
		},
		Health = 2500,
		Power = 50,
		Rarity = "Legendary",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Blue = 8 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever this card attacks: Destroy the bottom 2 cards of your opponent's deck.\nWhenever this card attacks directly: Destroy the bottom 2 cards of your opponent's deck.",
			Type = "OnDeath",
			Ability = {
				OnAttack = {
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
						}
					},
					Target = "Opponent"
				},
				OnStrike = {
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
						}
					},
					Target = "Opponent"
				}
			},
			Target = "All"
		},
		Bio = "\"I do this and that.\""
	},
	RukatuKDH = {
		Id = 6858734675,
		Name = "RukatuKDH",
		AltCards = {
			["RukatuKDH-E"] = {
				Id = 9050076053,
				AttackEffect = "MagicYellow",
				Bio = "Always put your eggs in one basket."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		Effect = {
			Name = "Vampire",
			Description = "When this card is cast, if you have 7500 or more life: Quadruple this card's stats.",
			Type = "OnSummon",
			Power = {
				{ "MultiplyPower", 4, "Self" },
				{ "MultiplyHealth", 4, "Self" }
			},
			EffectRequirement = { "Playertable", "Me", 7500, 99999, "Life" },
			Target = "Self"
		},
		Bio = "Don't put all your eggs into one basket."
	},
	PrismDraco = {
		Id = 10252755348,
		Name = "PrismDraco",
		AltCards = {
			["PrismDraco-AN"] = {
				Name = "The Merchant",
				AttackEffect = "Slash",
				Id = 9362071521,
				Bio = "A rotten 'exotic goods' merchant operating in Duelshire, as well as a dishonest battler. Takes advantage of newbie duelists, selling them worthless cards."
			},
			["Rifo Quest HD Rifo"] = {
				Id = 118228148924928,
				Name = "Danika the Dripmaster",
				AttackEffect = "Whirlpool",
				AltArt = true,
				Bio = "god i hope alex realizes how much breathable air he takes away from the sick and the weak"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 2 },
		CustomReminderChoice = true,
		Effect = {
			Name = "Vitality Potion",
			Description = "When this card is cast: Give yourself a choice card.",
			Type = "OnSummon",
			Power = { {
				"RandomAdd",
				{
					"Crystal of Inverse Decay",
					"Crystal of Pure Divinity",
					"Crystal of Heroic Ambition",
					"Crystal of Reality's Fractal",
					"Crystal of Nature's Surge",
					"Crystal of Heaven's Pulse",
					"Crystal of Knowledge's Thirst",
					"Crystal of Logic's Will",
					"Crystal of Intellect's Scheme",
					"Crystal of Power's Exploit",
					"Crystal of Ambition's End",
					"Crystal of Death's Vengence"
				}
			} },
			Target = "Self"
		},
		Bio = "Future updates to Blox Cards can't buff or nerf PrismDraco. PrismDraco can't be banned from tournaments."
	},
	DDude = {
		Id = 6801091899,
		Name = "DDude",
		AltCards = {
			["DDude-Val"] = {
				Name = "DDude",
				CopyBodge = "DDude-Val",
				Id = 7138168487,
				Effect = {
					Name = "Vampire",
					Description = "Whenever you gain life: Give yourself a Love Letter.",
					Power = { { "Add", "Kill Script-Val" } },
					Target = "Ally"
				},
				Bio = "He loves life in the 8-bit world with his love gun! Pew!."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Green = 1, Blue = 1 },
		CustomReminder = {
			["Kill Script"] = "A {G}{B} action, inert in all zones. It deals 300 damage to a target fighter."
		},
		Effect = {
			Name = "Vampire",
			Description = "Whenever you gain life: Give yourself a Kill Script.",
			Type = "OnLifeGain",
			Power = { { "Add", "Kill Script" } },
			Target = "Ally"
		},
		Bio = "He shines bright in the 8-bit world with his laser gun! Pew!"
	},
	["Kill Script"] = {
		Id = 4204433817,
		Name = "Kill Script",
		AltCards = {
			["Kill Script-Val"] = {
				Name = "Rejected",
				Id = 8855298474,
				Bio = "Roses are red, violets are blue, I've justified violence for you."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Stealth = true,
		TokenOmni = true,
		Cost = { Blue = 1, Green = 1 },
		Effect = {
			Name = "Kill Script",
			Description = "Deal 300 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 300 } },
			Target = "Single"
		},
		Bio = "Script is a kind and gentle person. Please do not kill Script."
	},
	iSpaceDonut = {
		Id = 6800708102,
		Name = "iSpaceDonut",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you gain life: This card gains 100 health and generates.",
			Type = "OnLifeGain",
			Power = {
				{ "Heal", 100 },
				{ "Generate", 1, "Self" }
			},
			Target = "Self"
		},
		Bio = "Milky Way flavoured."
	},
	Walyn = {
		Id = 8076671112,
		Name = "Walyn",
		AltCards = {
			alazyspaceman = {
				Id = 4954409256,
				Name = "alazyspaceman",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Sir lazy, man of the moon."
			},
			CyberTsarBomba = {
				Id = 12070329704,
				Name = "CyberTsarBomba",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "Omg is that a Sans Undertale reference!?"
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you gain life: This card gains 100 Power.",
			Type = "OnLifeGain",
			Power = { { "Strengthen", 100 } },
			Target = "Self"
		},
		Bio = "\"Awaken, my masters in chat!\""
	},
	NatzHakz = {
		Id = 10231458479,
		Name = "NatzHakz",
		AltCards = {
			["NatzHakz-AN"] = {
				Id = 9462804416,
				Name = "School Idols",
				AttackEffect = "Microphone",
				Bio = "Idol group \"Bloxia\" is a fierce competitor in the idol industry even though they started in their school. Looks like Rinthins got some rivals..."
			},
			Alxzyth = {
				Id = 14781443783,
				Name = "Alxzyth",
				AttackEffect = "RedScythe",
				EffectAnimation = "BloxyAlly",
				Commissioner = { 107830241, 41926915 },
				PremiumArt = 114,
				AltArt = true,
				Bio = "Sip 'n' tear."
			},
			Noi = {
				Id = 101897966998955,
				Name = "Noi",
				AttackEffect = "RedScythe",
				AltArt = true,
				Bio = "The pretty red lady, with her glittering memory diamond, will always be there to lend a hand. Just take care of her!"
			}
		},
		Health = 700,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Tempest",
		Color = "Green",
		Effect = {
			Name = "Vampire",
			Description = "Whenever you gain life: All allied fighters gain 50 Power.",
			Type = "OnLifeGain",
			Power = { { "Strengthen", 50 } },
			Target = "Ally"
		},
		Cost = { Green = 3, Neutral = 1 },
		Bio = "Old filmmaker who has joined and left, but implemented a comical form of 'hacking' with his magical tornado of bytes."
	},
	jokerkid5898 = {
		Id = 6800938178,
		Name = "jokerkid5898",
		AltCards = {
			["Weesiang8427, Bunny Lover"] = {
				Id = 121931985116336,
				Name = "Friends of Titano",
				AttackEffect = "Hammer",
				AltArt = true,
				Bio = "Meep Moop means thank you in Meeboid!"
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever you gain life: All enemy fighters lose 50 Power.",
			Type = "OnLifeGain",
			Power = { { "Weaken", 50 } },
			Target = "Opponent"
		},
		Bio = "Those myths ain't gonna hunt themselves."
	},
	["Fancy Arachnid"] = {
		Id = 10938356611,
		Name = "monkeymaster18",
		AltCards = {
			["Spider Queen Marissa"] = {
				Id = 4897458327,
				Name = "Spider Queen Marissa",
				AttackEffect = "Scratch",
				CopyBodge = "Fancy Arachnid",
				AltArt = true,
				Addant = "Queen's Henchman",
				Bio = "\"Ima single Texan wom'n n' I just killed mah husband!\""
			}
		},
		Health = 1500,
		Power = 50,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Addant = "Krazy Koala",
		CustomReminder = {
			["Maniac Monkey"] = "A {G} 150/150, inert in all zones. When it's cast, a target fighter gains 100 Power."
		},
		Effect = {
			Name = "Vampire",
			Description = "Whenever you gain life: Give yourself a 150/150 Maniac Monkey.",
			Type = "OnLifeGain",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Cost = { Neutral = 2, Green = 2 },
		Bio = "Based. Based on what?"
	},
	["Krazy Koala"] = {
		Id = 4789959352,
		Name = "Maniac Monkey",
		AltCards = {
			["Queen's Henchman"] = {
				Id = 4897458780,
				Name = "Queen's Henchman",
				AttackEffect = "Swamp",
				CopyBodge = "Queen's Henchman",
				Bio = "\"He was a good dad...\""
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Token",
		CopyBodge = "Krazy Koala",
		AttackEffect = "Scratch",
		Color = "Green",
		TokenOmni = true,
		Cost = { Green = 1 },
		Effect = {
			Name = "Krazy Boost",
			Description = "When this card is cast: A target fighter gains 100 Power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 100
		},
		Bio = "The chances of you getting attacked by a Maniac Monkey are low. But not impossible."
	},
	ShockingRobux = {
		Id = 7708012435,
		Name = "ShockingRobux",
		AltCards = {
			TheChaoticDeveloper = {
				Name = "TheChaoticDeveloper",
				AttackEffect = "Rifle",
				Id = 7622051618,
				AltArt = true,
				Bio = "He didn't miss in the Corps. He's not going to miss now."
			},
			["Venomous Arcanika"] = {
				Name = "Venomous Arcanika",
				AttackEffect = "ModernRocket",
				Id = 8773230254,
				AltArt = true,
				Bio = "Venom might be dangerous, but she will always protect her summoner."
			}
		},
		Health = 750,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card is cast or attacks: You gain 600 life.",
			Ability = {
				OnSummon = {
					Power = { { "Cost", -600 } },
					Target = "Self"
				},
				OnAttack = {
					Power = { { "Cost", -600 } },
					Target = "Self"
				}
			}
		},
		Bio = "Contrasted to DepressingTix."
	},
	MrMaxi23 = {
		Id = 6858724167,
		Name = "MrMaxi23",
		AltCards = {
			Studderies = {
				Name = "Studderies",
				Id = 6961807407,
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "According to his close friends, Studderies is apparently made out of roughly 30 trillion studs and growing. That's a very cool fact you should know about him."
			},
			["Bollum, Lord of Essence"] = {
				Name = "Bollum, Lord of Essence",
				Id = 7971545259,
				AttackEffect = "MagicGreen",
				Bio = "When the precious is sus."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "British",
		Color = "Green",
		Cost = { Green = 2 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "When this card is cast: Give yourself 2 titanic stud cards.",
			Type = "OnSummon",
			Power = {
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "Once you get a titanic stud, you'll always end up wanting more."
	},
	Godlysinha = {
		Id = 3299975084,
		Name = "Godlysinha",
		AltCards = {
			DeGabe = {
				Id = 10184417634,
				AttackEffect = "Gravity",
				Name = "DeGabe",
				Bio = "You've created a time paradox!"
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Bio = "The lesser known apprentice of Drager, don't read his code or your eyes might melt in horror.",
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans.",
			["Complete Global Saturation"] = "If all colours are in your baseplate, you're given any Titanic Stud."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Bonanza!",
			Description = "When this card is cast: Give yourself a Titanic Stud card of a colour not in your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Chromatic", "Nil" }
						},
						{ "EVExactValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"RandomAdd",
						{
							"Red Titanic Stud",
							"Blue Titanic Stud",
							"Green Titanic Stud",
							"Yellow Titanic Stud"
						}
					} },
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "SetRandomTableValue", "GenZone_Ally", "MissingColors", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "ConvertToCard", "Math", " Titanic Stud", "Nil" },
							"Self"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self"
				}
			}
		}
	},
	["Medic Kit"] = {
		Id = 10288777233,
		Name = "Medic Kit",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Bandage",
			Description = "You gain 1000 life.",
			Type = "OnSummon",
			Power = { { "Cost", -1000 } },
			Target = "Ally"
		},
		Bio = "Treats the wounds of paper cuts."
	},
	Gangmanstyle556 = {
		Id = 10944257858,
		Name = "gangmanstyle556",
		AltCards = {
			["gangmanstyle556-E"] = {
				Id = 16562310987,
				Name = "Bunny Valentine",
				AttackEffect = "Scratch",
				Bio = "My heart and actions are utterly unclouded. They are all those of 『Carrots』."
			}
		},
		CopyBodge = "Gangmanstyle556",
		Health = 1500,
		Power = 1500,
		Rarity = "Rare",
		Overload = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 12 },
		Effect = {
			Name = "Sudden Death",
			Description = "When this card is cast: Summon all copies of it from your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" },
				{ "SummonGenZone", "Gangmanstyle556" }
			},
			Target = "Ally"
		},
		Bio = "HATS, HATS, HATS!"
	},
	BroRubik = {
		Id = 10288487765,
		Name = "BroRubik",
		AltCards = {
			["Brorubik-E"] = {
				Name = "Green Eggs and Hamlet",
				Id = 16932160267,
				Bio = "Twobie or not Twobie, that is the quest card."
			}
		},
		Health = 1400,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		Effect = {
			Name = "Pineapples",
			Description = "During your end step: You gain 250 life.",
			Type = "OnEnd",
			Power = { { "Cost", -250 } },
			Target = "Ally"
		},
		Bio = "His journalism skills into the ordinary lives of superheroes is both highly detailed and disturbingly obsessive."
	},
	HyperBlue = {
		Id = 8854899622,
		Name = "HyperBlue",
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		Color = "Green",
		Cost = { Blue = 2, Green = 3 },
		Effect = {
			Name = "BWAAAAAAAAAAAAAAAAAAAAAAAAA",
			Description = "Whenever you gain life: All allied fighters gain 100 health.",
			Type = "OnLifeGain",
			Power = { { "Heal", 100 } },
			Target = "Ally"
		},
		Bio = "This turtle will grow, and grow, and grow, and grow!"
	},
	Alapz = {
		Id = 6801085284,
		Name = "callmehbob",
		AltCards = {
			["callmehbob-E"] = {
				Name = "Goddess of Nature Ivy",
				AttackEffect = "Tempest",
				Id = 8923600678,
				Bio = "She speaks for the forest, and all creatures who reside within."
			}
		},
		Health = 1100,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 4, Green = 4 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you gain life: Reset this card's stats.",
			Type = "OnLifeGain",
			Power = { { "Reset" } },
			Target = "Self"
		},
		Bio = "Magic is real and I'll prove it!"
	},
	["Alpha Brick's Bestowment"] = {
		Id = 6893577820,
		Name = "Alpha Brick's Bestowment",
		AltCards = {
			["exterminate this individual"] = {
				Id = 74014653132142,
				Name = "exterminate this individual",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 645,
				Bio = "\"i hate your stupid card die\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Archetype = "Era",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Put a target fighter into its owner's baseplate.",
			Type = "OnSummon",
			Power = { { "MoveGenZone" } },
			Target = "Single"
		},
		Bio = "The Celestials, happy that Dukran saved their child, bestowed the most cursed gift onto him: The Creator."
	},
	InceptionTime = {
		Id = 7163893766,
		Name = "InceptionTime",
		AltCards = {
			Exanophist = {
				Name = "Exanophist",
				AttackEffect = "Divinity",
				Id = 4375357965,
				Bio = "Prepare to be terminated, mere mortal."
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Green = 4, Neutral = 4 },
		Effect = {
			Name = "Revival",
			Description = "During your end step, if you have 13,000 or more life: Ban your opponent.",
			Type = "OnEnd",
			Power = { { "Inflict", 999999 } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Me", 13000, 9999999999, "Life" }
		},
		Bio = "It is not yet time."
	},
	["65popcan"] = {
		Id = 10279212980,
		Name = "65popcan",
		AltCards = {
			["3210brian"] = {
				Id = 14039557182,
				Name = "3210brian",
				AttackEffect = "LycanScratch",
				AltArt = true,
				PremiumArt = 82,
				Commissioner = { 54110714 },
				Bio = "\"Greetings, traveler.\""
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Give yourself a Red, a Green, and a Blue Titanic Stud.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Blue Titanic Stud" },
				{ "Add", "Red Titanic Stud" },
				{ "Add", "Green Titanic Stud" }
			},
			Target = "Ally"
		},
		Bio = "With the titans freed, their influence spread through the land, bestowing fragments of their Power to those who find a Titanic Stud."
	},
	lolbeniceok = {
		Id = 6800938748,
		Name = "lolbeniceok",
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Your mom",
			Description = "Once each turn, whenever a player loses life: That player loses 300 life and draws a card.",
			Ability = {
				OnLifeLoss = {
					Power = {
						{ "Cost", 300 },
						{ "Draw", 1 }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnEnemyHealthLoss = {
					Power = {
						{ "Inflict", 300 },
						{ "Draw", 1 }
					},
					Target = "Opponent",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "no u."
	},
	Volttt = {
		Id = 10279203055,
		Name = "Volttt",
		AltCards = {
			["Vaporwave Vengeful_Sage"] = {
				Id = 10279204924,
				AttackEffect = "Jab",
				Name = "Vaporwave Vengeful_Sage",
				AltArt = true,
				Bio = "\"The synthetic sun seems strangely nostalgic\""
			},
			["Volttt-AN"] = {
				Id = 9362065785,
				AttackEffect = "Jab",
				Name = "Candy Robber",
				Bio = "Like stealing a baby from candy! Wait..."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "Charge",
			Description = "When this card is cast: A target fighter gains 200 Power, then unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{ "Unlock", 999, "Self" }
			},
			Target = "Single"
		},
		Bio = "Steven Universe is a good cartoon series."
	},
	["Split Ego"] = {
		Id = 10279210707,
		Name = "Split Ego",
		AltCards = {
			["Split Ego-Sun"] = {
				Id = 9180230252,
				Name = "A Day At The Beach",
				Bio = "Bacon said we should take a photo for this, so we did. Acorn was really excited, I just wanted to eat the cheeseburgers already D:"
			},
			["Split Ego-ET"] = {
				Id = 16446075674,
				Name = "Cosmic Collab",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Bio = "Thanks for playing Bioblades!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Split Ego",
			Description = "Draw a card if there's 4 colours among cards in your baseplate.\nPut a Red, Blue, and Green Stud into your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "GenZone_Ally", "Chromatic", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Gate", "Math", 3, "Nil" },
					"Self"
				},
				{ "Draw", "Variable" },
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
				}
			},
			Target = "Ally"
		},
		Bio = "Go Two-Face without going Poo-Faced!"
	},
	WeirdSauce210 = {
		Id = 6854802310,
		Name = "WeirdSauce210",
		Health = 900,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Recyclables",
		Color = "Yellow",
		Cost = { Green = 1, Red = 1, Yellow = 2 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Assimilate",
			Description = "Whenever this card attacks: Select a colour. Give yourself that colour's Titanic Stud.",
			Type = "OnAttack",
			Power = {
				{
					"CreateChoices",
					{
						"Blue Titanic Stud",
						"Red Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"AlterEV",
					{ "Set", "Target", "CardIndex", "Nil" },
					"TargetChoiceZone"
				},
				{ "Add", "Variable", "Ally" }
			},
			Target = "Self",
			CreateAllAsChoices = true
		},
		Bio = "Titanic Stud makes any drink taste divine. Sadly, divinity tastes like a gnat's backside."
	},
	["214Brazy"] = {
		Id = 6801079693,
		Name = "214Brazy",
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Shotgun",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Assimilate",
			Description = "Whenever an enemy fighter dies: Your opponent gains 300 life. Deal 50 damage to all other fighters.",
			Type = "OnEnemyDeath",
			Power = {
				{ "Inflict", -300 },
				{ "Heal", 50, "Self" },
				{ "Damage", 50, "All" }
			},
			Target = "Opponent"
		},
		Bio = "Titans, Celestials, it doesn't matter. I'm ending it all here."
	},
	MustagedWorldYT = {
		Id = 6858725284,
		Name = "MustagedWorldYT",
		AltCards = {
			["MustagedWorldYT-ALT"] = {
				Id = 5574761063,
				AltArt = true,
				Name = "MustagedWorldYT",
				Bio = "Your first mistake? Not subscribing. Your last? Not expecting him to be summoned right now."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		Effect = {
			Name = "Subversion",
			Description = "When this card is cast: Set the stats of a target fighter to 500/500.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 500 },
				{ "SetPower", 500 }
			},
			Target = "Single"
		},
		Bio = "Streams of life, screams of agony."
	},
	SirSorin = {
		Id = 6854742382,
		Name = "SirSorin",
		AltCards = {
			SantaSorin = {
				Id = 11344354345,
				AttackEffect = "IcePunch",
				Name = "SantaSorin",
				Bio = "Santa? Happiness? Your dad? All illusions!"
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "Routine Maitenance",
			Description = "During your end step: This card gains 200 Power, then all fighters lose 50 Power.",
			Type = "OnEnd",
			Power = {
				{ "Strengthen", 200 },
				{ "Weaken", 50, "All" }
			},
			Target = "Self"
		},
		Bio = "How did spending all that time stuck in a rock help you?"
	},
	Flufflefunz = {
		Id = 6801095225,
		Name = "Flufflefunz",
		AltCards = {
			["Flufflefunz-Hal"] = {
				Id = 136233983041780,
				Name = "Flufflehuntz",
				AttackEffect = "Axe",
				Bio = "For how much longer will he be able to claim 'self-defense'?"
			},
			["Longtime Sunshine"] = {
				Id = 71250300659074,
				Name = "Longtime Sunshine",
				AttackEffect = "Jab",
				PremiumArt = 828,
				Bio = "\"Don't cry because it's over, smile because it happened.\"-art got moderated will deal withthis later"
			},
			["Officer K"] = {
				Id = 76822736302744,
				Name = "Officer K",
				AttackEffect = "Revolver",
				AltArt = true,
				PremiumArt = 161,
				Commissioner = { 14640960, 46070818 },
				Bio = "For how much longer will he be able to claim 'self-defense'?"
			}
		},
		Health = 600,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Minigun",
		EffectAnimation = "ShootAllMinigun",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you discard a card, if you've discarded 3 or more cards since your last end step: Deal 100 damage to each enemy fighter with the lowest health.",
			Type = "OnAllyDiscard",
			Power = { { "Damage", 100 } },
			EffectRequirement = { "Playertable", "Me", 3, 9999, "DiscardCount" },
			Target = "EnemyLowestHealth"
		},
		Bio = "His self-milling is the last thing people see if they dare to call his Formidulosus a 'Walmart Dominus.'"
	},
	QuisMo = {
		Id = 6460280000,
		Name = "QuisMo",
		AltCards = {
			["Hammer Warrior Flufflefunz"] = {
				Id = 9267984717,
				AltArt = true,
				Name = "Hammer Warrior Flufflefunz",
				AttackEffect = "Hammer",
				Bio = "My soul became a hammer; I started to feel better."
			},
			["Skateboarder Tony"] = {
				Id = 8072469364,
				Name = "Skateboarder Tony",
				Bio = "So here I am doing / everything I can / holding on to what I am / pretending I'm a Superman."
			},
			["SourKatz The Quixotic"] = {
				Id = 132285372023932,
				Name = "SourKatz, The Quixotic",
				PremiumArt = 816,
				Bio = "\"Gallop on everyone! To a dream within our reach!<br/>To that forever lingering dream, our victory!\""
			}
		},
		Health = 150,
		Power = 300,
		Rarity = "Uncommon",
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
	popcornhebe = {
		Id = 10401021281,
		Name = "popcornhebe",
		Health = 250,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		EffectAnimation = "EatPopcorn",
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		Token = true,
		Effect = {
			Name = "Nutritious Popcorn",
			Description = "When this card dies: Give yourself a Nascent Stud. Your opponent gains 250 life.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Addant", "Ally" },
				{ "Inflict", -250, "Opponent" }
			},
			Target = "Single"
		},
		Bio = "Will he share his popcorn or eat it all himself? Find out next week--"
	},
	Lilmanofsalem = {
		Id = 5174405897,
		Name = "Lilmanofsalem",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Render",
			Description = "When this card is cast: All players destroy the oldest card in their hand and draw a card.\nWhenever an effect draws you a card: You lose 100 life.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SpecificDiscard", 1, "LeftMostHand" },
						{ "Draw", 1, "All" }
					},
					Target = "All"
				},
				OnAllyDraw = {
					Power = { { "Cost", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "Putting Death Millers in your game is bad modding. No exceptions."
	},
	zKevin = {
		Id = 8999477288,
		Name = "zKevin",
		AltCards = {
			["zKevin-E"] = {
				Id = 9034075261,
				Name = "Carter the Carrot",
				AttackEffect = "Bubbles",
				Bio = "\"Now lets remember to have a nice, CLEAN easter this year, Y'hear?\""
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever this card is cast or attacks: You lose 200 life. Then deal 200 damage to all enemy fighters if you have 2000 or less life.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Cost", 200 },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{ "Cost", 200 },
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "Damage", 200 } },
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Me", 0, 2001, "Life" },
					NoBlip = true
				}
			}
		},
		Bio = "Tell the CEO of BRIBBLECO. I just want to talk."
	},
	Starsnatch = {
		Id = 6030833995,
		Name = "Starsnatch",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Electric",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		Requirement = { "Playertable", "Him", 5050, 99999, "Life" },
		EffectAnimation = "LargeLaserYellowEffect",
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if your opponent has 5050 or more life.\nSteal a target fighter.",
			Type = "OnSummon",
			Power = { { "Steal" } },
			Target = "Single"
		},
		Bio = "The Celestials stole God's child. The Titans stole their children in revenge."
	},
	["Revelling Satyr"] = {
		Id = 6854734201,
		Name = "Revelling Satyr",
		AltCards = {
			Roland = {
				Id = 12744786874,
				Name = "Roland",
				AttackEffect = "Slash",
				AltArt = true,
				Transformant = "Furioso",
				Bio = "\"This is this, that is that.\""
			},
			["Father Coveri and Ashen Spirit"] = {
				Id = 135762787254953,
				Name = "Father Coveri & Ashen Spirit",
				AttackEffect = "Slash",
				Transformant = "Father Coveri 2",
				AltArt = true,
				PremiumArt = 453,
				Bio = "\"2, 3, 5, 7, 11, 13, 17, 19... prime numbers are lone numbers that can only be divided by 1 and themselves... they bring me strength.\""
			}
		},
		Health = 550,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Transformant = "Hedonist Chieftain",
		CustomReminder = {
			["Commander of Chaos"] = "At max level, is a 2000/400 that, during your end step, summons a 400/50 Noob, then unlocks all fighters and has them gain 200 Power."
		},
		Effect = {
			Name = "Level Up!",
			Description = "Level 1.\nWhen this card attacks and destroys another: Level it up. It gains 300 health and 100 Power.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 100 },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "You're going to die anyways. Why not enjoy yourself?"
	},
	["Hedonist Chieftain"] = {
		Id = 4239216096,
		Name = "Hedonist Chieftain",
		AltCards = {
			Furioso = {
				Id = 12744788431,
				Name = "Furioso",
				AttackEffect = "Slash",
				Transformant = "Bellowing Smoke",
				Bio = "\"I have nothing but my sorrow, and I want nothing more. It has been, it still is, faithful to me.\""
			},
			["Father Coveri 2"] = {
				Id = 85699882913041,
				Name = "Emil Coveri, Awaiting the New Moon",
				AttackEffect = "Slash",
				Transformant = "Father Coveri 3",
				Bio = "\"You dare act out of your insignificant feelings?! Humans must attain Aether, the one who finds it will be able to lead all of mankind to it! You two are interfering with my progress, all because I have to sacrifice a few people to do so!\""
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Transformant = "Pleasure Maker",
		Effect = {
			Name = "Level Up!",
			Description = "Level 2.\nWhenever this card attacks and destroys another: Level it up. It gains 300 health and 100 Power.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 100 },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "On second thought, working is pretty fun."
	},
	["Pleasure Maker"] = {
		Id = 4239226805,
		Name = "Pleasure Maker",
		AltCards = {
			["Bellowing Smoke"] = {
				Id = 12744790566,
				Name = "Bellowing Smoke",
				AttackEffect = "Scratch",
				Transformant = "Orlando",
				Bio = "\"Why should I begrudge it, since during the hours, when my soul crushed the depths of my heart, it was seated there beside me?\""
			},
			["Father Coveri 3"] = {
				Id = 133341111344042,
				Name = "Emil Coveri & FLEECE TYRANT",
				AttackEffect = "Gravity",
				Transformant = "Father Coveri 4",
				Bio = "\"The beginning originated from gravity! Even this planet began with gravity! Because of gravity, this planet continues to spin! On this planet, where am I headed?! What is going to happen?! Within my body and my spirit, gravity exists and must also exist, at the end of it all!\""
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Token",
		Fading = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Transformant = "Commander of Chaos",
		Effect = {
			Name = "Level Up!",
			Description = "Level 3.\nWhen this card attacks and destroys another: Level it up. Set its health to 2000.",
			Type = "OnAttackDestroy",
			Power = {
				{ "SetHealth", 2000 },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "I'll work to make the world a better, more entertaining place! HahaahahahahHAHAHAAHAHAHHHAAHAH!"
	},
	["Commander of Chaos"] = {
		Id = 4239227364,
		Name = "Commander of Chaos",
		AltCards = {
			Orlando = {
				Id = 12744791681,
				AttackEffect = "Jab",
				Name = "Orlando",
				Summonant = "Sorrow",
				Bio = "\"O sorrow, I have ended, you see, by respecting you, because I am certain you will never leave me. Ah, I realize it: your beauty lies in the force of your being.\""
			},
			["Father Coveri 4"] = {
				Id = 109262709509489,
				AttackEffect = "XhartyrSlash",
				Name = "Emil Coveri & Paradigm Paradise",
				Summonant = "Panicked Bystander",
				Bio = "Fine, then... though you won't fathom it, I will tell you one last thing. Time will keep on accelerating. Time will keep accelerating to a new world! Humanity has finally reached a common end... a new dawn!\""
			}
		},
		Health = 2000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		WeakenImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		Summonant = "Noob",
		Effect = {
			Name = "Level Up!",
			Description = "Max level.\nDuring your end step: Summon a 400/50 Noob. All fighters gain 200 Power. Unlock all allied fighters.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "Summonant" },
				{ "Strengthen", 200, "All" },
				{ "Unlock", 999 }
			},
			Target = "Ally"
		},
		Bio = "His endless revels were to celebrate his fragile life. How do you celebrate an uncullable life?"
	},
	Telamon = {
		Id = 4564780442,
		AltCards = {
			CoffeeAndBiscuits = {
				Id = 4782384966,
				Name = "CoffeeAndBiscuits",
				AttackEffect = "StudBlast",
				AltArt = true,
				CopyBodge = "CoffeeAndBiscuits",
				Bio = "Ah, ah, ah! No talkie 'till I have my coffee!"
			},
			Potato_BroLOL = {
				Id = 8473935698,
				Name = "Potato_BroLOL",
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "Sometimes the greatest victories leave you feeling the emptiest."
			},
			["Telamon-AN"] = { Id = 10469733390, Name = "Invisible Telamon", Bio = "\n" },
			["Boach, Post Voider"] = {
				Id = 17107614198,
				Name = "Boach, Post Voider",
				PremiumArt = 251,
				AltArt = true,
				AttackEffect = "MagicYellow",
				Bio = "With his head in hand, he who bore the pain would try to reach the Void again, the place where nothing moves, where darkness is lord, and silence its preacher - a place of peace."
			},
			["Mundi Vastatorem"] = {
				Id = 73507442832941,
				Name = "Mundi Vastatorem",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 504,
				Bio = "Quando ultima eclipsis accidit, nulla lux erat quae umquam iterum terram pertingeret. Donec subito, sine ullo praenuntiatione, novus sol in terra factus est."
			},
			whoops_1990 = {
				Id = 107108593759296,
				Name = "whoops_1990",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 587,
				Bio = "Silence the masses to control your stocks."
			}
		},
		Name = "Telamon",
		Health = 8000,
		Power = 8000,
		Rarity = "Legendary",
		AttackEffect = "LaserYellow",
		Archetype = "Shedletsky",
		CheckImmune = true,
		DestroyImmune = true,
		ReturnImmune = true,
		SetImmune = true,
		TargetImmune = true,
		Overload = true,
		SummonAnimation = "TelamonSummon",
		SummonedAnimation = "TelamonSummon",
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
	["Shard Master"] = {
		Id = 6854741460,
		Name = "Shard Master",
		AltCards = {
			["Shard Vagrant"] = {
				Id = 6533844142,
				Name = "Shard Vagrant",
				AttackEffect = "Scratch",
				CopyBodge = "Shard Vagrant",
				Bio = "Shard vagrants are beings comprised of the leftover energy of Crystal magic. They collect any unused crystals, which they use to cast Powerful spells. You'll never know what they might cast next..."
			},
			["Potato, Spellcaster"] = {
				Id = 9087712678,
				Name = "Potato, Spellcaster",
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "To know your enemy, you must become your enemy.\" - Sun Tzu"
			},
			["Multicat, Crystal Conjurer"] = {
				Id = 131998134101838,
				Name = "Multicat, Crystal Conjurer",
				PremiumArt = 338,
				AltArt = true,
				Bio = "With a slash of my sword<br/>Three crystals will surface<br/>Each of them striking a chord<br/>And each with a purpose."
			},
			["The HoHrunner"] = {
				Id = 138017211303073,
				Name = "The HoHrunner",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 568,
				SummonAnimation = "bobulatorSummon",
				Bio = "This truly was a House of Horror."
			},
			["Solstice, Tungsten Enthusiast"] = {
				Id = 123126641733172,
				Name = "Solstice, Tungsten Enthusiast",
				AttackEffect = "Blizzard",
				AltArt = true,
				PremiumArt = 595,
				SummonAnimation = "KorbloxCall",
				DeathAnimation = "KorbloxDeath",
				Bio = "hide your eggies."
			}
		},
		Health = 1800,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Gravity",
		Color = "Neutral",
		Charge = true,
		Cost = { Neutral = 1, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		CustomReminderChoice = true,
		Rank = 5,
		Effect = {
			Name = "inferior to rainbowjewelninga clearly.",
			Description = "Whenever this card attacks: Give yourself 3 Choice cards.",
			Type = "OnAttack",
			Power = {
				{
					"RandomAdd",
					{
						"Crystal of Inverse Decay",
						"Crystal of Pure Divinity",
						"Crystal of Heroic Ambition",
						"Crystal of Reality's Fractal",
						"Crystal of Nature's Surge",
						"Crystal of Heaven's Pulse",
						"Crystal of Knowledge's Thirst",
						"Crystal of Logic's Will",
						"Crystal of Intellect's Scheme",
						"Crystal of Power's Exploit",
						"Crystal of Ambition's End",
						"Crystal of Death's Vengence"
					}
				},
				{
					"RandomAdd",
					{
						"Crystal of Inverse Decay",
						"Crystal of Pure Divinity",
						"Crystal of Heroic Ambition",
						"Crystal of Reality's Fractal",
						"Crystal of Nature's Surge",
						"Crystal of Heaven's Pulse",
						"Crystal of Knowledge's Thirst",
						"Crystal of Logic's Will",
						"Crystal of Intellect's Scheme",
						"Crystal of Power's Exploit",
						"Crystal of Ambition's End",
						"Crystal of Death's Vengence"
					}
				},
				{
					"RandomAdd",
					{
						"Crystal of Inverse Decay",
						"Crystal of Pure Divinity",
						"Crystal of Heroic Ambition",
						"Crystal of Reality's Fractal",
						"Crystal of Nature's Surge",
						"Crystal of Heaven's Pulse",
						"Crystal of Knowledge's Thirst",
						"Crystal of Logic's Will",
						"Crystal of Intellect's Scheme",
						"Crystal of Power's Exploit",
						"Crystal of Ambition's End",
						"Crystal of Death's Vengence"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "I am the Shardian of the Galaxy...fear me."
	},
	Shadoward12 = {
		Id = 4645486927,
		Name = "Shadoward12",
		Health = 800,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "Thrice each turn, whenever you cast a Terrain: Give yourself 2 titanic stud cards. You may baseplate again this turn.",
			Type = "OnAllyTerrainCast",
			Power = {
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{
					"RandomAdd",
					{
						"Red Titanic Stud",
						"Blue Titanic Stud",
						"Green Titanic Stud",
						"Yellow Titanic Stud"
					}
				},
				{ "DiscardLimit", 1 }
			},
			Target = "Ally",
			TurnTriggerLimit = 3
		},
		Bio = "The land falls, and the land reemerges. Thus is the evershifting expanse of Ultimate Power."
	},
	Wingman8 = {
		Id = 5182580373,
		Name = "Wingman8",
		Health = 850,
		Power = 850,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Token = true,
		Effect = {
			Name = "Render",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Flying ships. Please, wingman, it's in your NAME! I will pay you to make flying airship galleons. Yes."
	},
	Mimic = {
		Id = 7559446264,
		Name = "Ban Hammer",
		AltCards = {
			Expunge = {
				Name = "Expunge",
				Id = 7760141344,
				EffectAnimation = "LargeGravityEffect",
				AltArt = true,
				Bio = "\"Before it could witness the Meteor, a cacophony of voices rung in the vessel’s head before it was suddenly pulled into oblivion: ‘We/The People/Society decided that you are no longer welcome in this timeline/rerun/Take 23151812416211875.\""
			},
			["Road Roller!"] = {
				Name = "Road Roller!",
				Id = 9137697156,
				AltArt = true,
				EffectAnimation = "LargeBritishEffect",
				Bio = "ロードローラーだ!"
			},
			["Ban Hammer-AN"] = {
				Name = "Mimic",
				Id = 9345612500,
				EffectAnimation = "LargeBiteEffect",
				Bio = "CHOMP!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
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
	["Exotic Murtic"] = {
		Id = 10184621349,
		Name = "Exotic Murtic",
		AltCards = {
			["Expatriate IcyTea"] = {
				Id = 12931332438,
				Name = "Expatriate IcyTea",
				ArtAnimation = "ExpatriateIcyTea",
				PackDisplayOverride = "IcyTea",
				Commissioner = { 41926915, 8289996, 320659945 },
				AttackEffect = "IcePunch",
				SummonAnimation = "IcyExpatriateSummon",
				EffectAnimation = "SelfIce",
				Transformant = "Expatriate 4",
				Bio = "\"What once started off as a simple year-long venture in search of priceless materials in the Highlands...\""
			}
		},
		Health = 1000,
		Power = 150,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Transformant = "MurticUnicorn 4",
		Effect = {
			Name = "Reincarnation",
			Description = "3 charges.\nDuring your end step: Remove a charge and this card gains 200 health. If the last charge was removed, add 3 charges and return all non-colourless fighters to their hands.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 200 },
				{ "Transform", "Transformant" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "Kweh."
	},
	["MurticUnicorn 4"] = {
		Id = 10184621349,
		Name = "Exotic Murtic",
		AltCards = {
			["Expatriate 4"] = {
				Id = 12931332438,
				Name = "Expatriate IcyTea",
				PackDisplayOverride = "IcyTea",
				CopyBodge = "Expatriate 4",
				ArtAnimation = "ExpatriateIcyTea",
				AttackEffect = "IcePunch",
				EffectAnimation = "SelfIce",
				Transformant = "Expatriate 1",
				Bio = "\"What once started off as a simple year-long venture in search of priceless materials in the Highlands...\""
			}
		},
		CopyBodge = "MurticUnicorn 4",
		Health = 1000,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Transformant = "MurticUnicorn 1",
		Effect = {
			Name = "Reincarnation",
			Description = "2 charges.\nDuring your end step: Remove a charge and this card gains 200 health. If the last charge was removed, add 3 charges and return all non-colourless fighters to their hands.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 200 },
				{ "Transform", "Transformant" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "Kweh, Kweh!"
	},
	["MurticUnicorn 1"] = {
		Id = 10184581828,
		Name = "Exotic Murtic",
		AltCards = {
			["Expatriate 1"] = {
				Id = 12931333959,
				Name = "Expatriate IcyTea",
				PackDisplayOverride = "IcyTea",
				CopyBodge = "Expatriate 1",
				ArtAnimation = "ExpatriateIcyTeaToken",
				EffectAnimation = "IceBreathAll",
				AttackEffect = "IcePunch",
				Transformant = "Expatriate IcyTea",
				Bio = "\"...turned into decades of bitter isolation for the lost expatriate.\""
			}
		},
		CopyBodge = "MurticUnicorn 1",
		Health = 1000,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Transformant = "Exotic Murtic",
		Effect = {
			Name = "Reincarnation",
			Description = "1 charge.\nDuring your end step: Remove a charge and this card gains 200 health. If the last charge was removed, add 3 charges and return all non-colourless fighters to their hands.",
			Type = "OnEnd",
			Power = {
				{ "Return", 30, "ColorRed" },
				{ "Return", 30, "ColorYellow" },
				{ "Return", 30, "ColorBlue" },
				{ "Return", 30, "ColorGreen" },
				{ "Heal", 200, "Self" },
				{ "Transform", "Transformant", "Self" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Ally"
		},
		Bio = "Chocobooru!"
	},
	Shirozaru = {
		Id = 7204552562,
		Name = "Shirozaru",
		AltCards = {
			["Deliovon, Aspect of Peril"] = {
				Id = 10184420427,
				Name = "Deliovon, Aspect of Peril",
				AttackEffect = "Electric",
				AltArt = true,
				Summonant = "Steve, Master of Dexterity",
				Addant = "Vigorous Aid",
				Effect = {
					Name = "Spam",
					Description = "When this card is cast, if there's an enemy fighter: Summon 4 400/400 Steve, Master of Dexterity. Give yourself Vigorous Aid, which transforms them. You can't cast anything else this turn."
				},
				Bio = "Hasn't been seen ever since. Maybe his buddy Steve will aid him in his ventures."
			},
			["Shirozaru-AN"] = {
				Id = 10224419851,
				Name = "Sylvia, Lost Hero",
				AttackEffect = "Flame",
				Summonant = "Spatial Soul-AN",
				Addant = "Horologium-AN",
				Effect = {
					Name = "Spam",
					Description = "When this card is cast, if there's an enemy fighter: Summon 4 400/400 Memories Reborn. Give yourself Reunited History, which transforms them. You can't cast anything else this turn."
				},
				Bio = "There’s a wall, To surroundings that exist,\nCan’t recall, But it’s something that I miss,\nI don’t remember why, I don’t remember who I am."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 4, Blue = 5, Green = 5 },
		Summonant = "Spatial Soul",
		Addant = "Horologium",
		CustomReminder = {
			["Spatial Souls"] = "A 400/400 fighter, inert in play. They can become 800/800 fighters.",
			Horologium = "A free action. It strengthens allied Spatial Souls if there's 4 of them."
		},
		Effect = {
			Name = "Spam",
			Description = "When this card is cast, if there's an enemy fighter: Summon 4 400/400 Spatial Souls.\nGive yourself Horologium, which transforms them. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Add", "Addant" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Ally",
			EffectRequirement = { "Board", "Opponent", 1, 9999 }
		},
		Bio = "People believe that good and evil exist. They do not."
	},
	["Spatial Soul"] = {
		Id = 2857414528,
		Name = "Spatial Soul",
		AltCards = {
			["Steve, Master of Dexterity"] = {
				Id = 8999517333,
				Name = "Steve, Master of Dexterity",
				AttackEffect = "Scratch",
				Bio = "I've always got my friend's backs. Just watch what I'm about to do."
			},
			["Spatial Soul-AN"] = {
				Id = 10224421242,
				Name = "Memories Reborn",
				AttackEffect = "Flame",
				Bio = "I can see, only half way through the dark.\nMemory, It's a fire that needs a spark.\nIf you remember when,If you remember how, Just cover up the void in my heart."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Token = true,
		Archetype = "Spatial",
		Effect = {
			Name = "Spam",
			Description = "<i>(If you cast 'Horologium,' this card becomes an 800/800 fighter.)</i>",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Morality and peace exist only subjectively. Am I evil for merely opposing you?"
	},
	["Spatial Crow"] = {
		Id = 2857412253,
		Name = "Primordial Crow",
		AltCards = {
			["Steve, The Grand Explorer"] = {
				Id = 8999519035,
				Name = "Steve, The Grand Explorer",
				AttackEffect = "Scratch",
				Bio = "I'm all fired up now, come right at me because it's about to get interesting."
			},
			["Spatial Crow-AN"] = {
				Id = 10224423398,
				Name = "Mementos Of The Guardian",
				AttackEffect = "Flame",
				Bio = "Holding steady, So get ready for battle, Guardian.\nHeat and fire we desire, To battle we are sworn.\nEver burning,\nEver yearning,\nEver learning, we’ll always be.\nAre you siding with me?\nEver striding, are we!"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		WeakenImmune = true,
		DamageImmune = true,
		Token = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Spam",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Give us your answer."
	},
	Horologium = {
		Id = 6419759152,
		Name = "Horologium",
		AltCards = {
			["Vigorous Aid"] = {
				Id = 8999518076,
				Name = "Vigorous Aid",
				Effect = {
					Name = "Spam",
					Description = "Cast only if there's 4 or more allied Steves, Masters of Dexterity.\nDestroy all of them, then summon 4 800/800 Steves, The Grand Explorers.\nYou gain {G}{B}.",
					Type = "OnSummon",
					Power = {
						{ "Damage", 9999, "Archetype" },
						{ "Summon", "Steve, The Grand Explorer" },
						{ "Summon", "Steve, The Grand Explorer" },
						{ "Summon", "Steve, The Grand Explorer" },
						{ "Summon", "Steve, The Grand Explorer" },
						{ "Blue", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				},
				Bio = "With us together you don't even stand a chance!"
			},
			["Horologium-AN"] = {
				Id = 10224422379,
				Name = "Reunited History",
				Effect = {
					Name = "Spam",
					Description = "Cast only if there's 4 or more allied Memories Reborn.\nDestroy all of them, then summon 4 800/800 Mementos Of The Guardian.\nYou gain {G}{B}.",
					Type = "OnSummon",
					Power = {
						{ "Damage", 9999, "Archetype" },
						{ "Summon", "Spatial Crow-AN" },
						{ "Summon", "Spatial Crow-AN" },
						{ "Summon", "Spatial Crow-AN" },
						{ "Summon", "Spatial Crow-AN" },
						{ "Blue", 1 },
						{ "Green", 1 }
					},
					Target = "Ally"
				},
				Bio = "I’m alive, I’ll fulfill a plan unknown. I revive a belief I’m not alone.\nIf you remember why, If you remember who,\nThis curious adventure is, talk to me, I will talk to you."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Spatial",
		Requirement = { "Archetype", "Ally", 4, 9999, "Spatial" },
		Effect = {
			Name = "Spam",
			Description = "Cast only if there's 4 or more allied Spatial Souls.\nDestroy all of them, then summon 4 800/800 Primordial Crows.\nYou gain {G}{B}.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 9999, "Archetype" },
				{ "Summon", "Spatial Crow" },
				{ "Summon", "Spatial Crow" },
				{ "Summon", "Spatial Crow" },
				{ "Summon", "Spatial Crow" },
				{ "Blue", 1 },
				{ "Green", 1 }
			},
			Target = "Ally"
		},
		Bio = "A lie will remain a lie. Knowing this, do you still desire peace?"
	},
	["Titanic Coalescence"] = {
		Id = 11769944729,
		Name = "Titanic Coalescence",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself 6 titanic stud cards.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingRandomAdd",
						{
							{
								"Red Titanic Stud",
								"Blue Titanic Stud",
								"Green Titanic Stud",
								"Yellow Titanic Stud"
							},
							6
						}
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Telamon unleashed the Titans to find the Alpha Brick stolen from him. They influence the world and its fauna, turning them into titan-infused horrors."
	},
	["The Ultimatum's Altar"] = {
		Id = 11769944105,
		Name = "The Ultimatum's Altar",
		AltCards = {
			["The Local Train"] = {
				Id = 91981063268948,
				Name = "The Local Train",
				AltArt = true,
				ArtAnimation = "Train",
				PremiumArt = 838,
				Terrariant = "NTPinheiro: The Spotlight",
				Bio = "\"Oh, not again, now the train's gone and left...\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Requirement = { "Board", "Opponent", 1, 9999 },
		Color = "Green",
		Terrain = true,
		Terrariant = "Temple of the Titans",
		Rank = 10,
		Cost = { Neutral = 2, Green = 1, Red = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["Temple of the Titans"] = "Cast 'Living World' to animate this as a 1500/1500 that punishes your opponent for discarding cards."
		},
		ReplaceDescriptionant = "Chosen card: Variable \nCast only if there's an enemy fighter.\nAt the start of your turns: Your opponent loses 600 life.\nWhen this card is cast: Choose a target enemy fighter and shuffle it into their deck. Note its name.\nWhenever your opponent casts a card with the noted name: Destroy this card.",
		Effect = {
			Name = "Reincarnation",
			Description = "Cast only if there's an enemy fighter.\nAt the start of your turns: Your opponent loses 600 life.\nWhen this card is cast: Choose a target enemy fighter and shuffle it into their deck. Note its name.\nWhenever your opponent casts a card with the noted name: Destroy this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"SingleEnemy"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Opponent", "Deck_Opponent", true, false },
							"SingleEnemy"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "SingleEnemy"
				},
				OnEnemySummon = {
					Power = { { "Destroy", 30, "Self" } },
					Target = "Ally",
					VariableLibraryIndex = "True"
				},
				OnAllyStart = {
					Power = { { "Inflict", 600 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "The Titans gave the Celestials a choice: Return the Alpha Brick, or watch the world below crumble into dust."
	},
	["Titan-Infused Monstrosity"] = {
		Id = 11769944565,
		Name = "Titan-Infused Monstrosity",
		AltCards = {
			["Titan-Infused Monstrosity-E"] = {
				Name = "Warmon",
				Id = 17014186932,
				Bio = "Did you know this thing is a legal gun owner?"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		TriggerInField = false,
		TriggerInGraveZone = true,
		Cost = { Green = 3, Neutral = 1 },
		CustomReminder = { Recursion = "Put a given card from a graveyard into your hand." },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you discard your first card each turn, if it's a Titan card: Recur this card.",
			Ability = {
				OnSecondDiscard = {
					Power = { {
						"MoveZone",
						{
							"Titan-Infused Monstrosity",
							"GraveZone_Ally",
							"Hand_Ally",
							true,
							false
						},
						"Self"
					} },
					Target = "Self",
					Archetype = "Titan"
				}
			}
		},
		Bio = "The prescence of the Titans tore Old Robloxia asunder."
	},
	["Deity Deception"] = {
		Id = 11769914745,
		Name = "Deity Deception",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 7 },
		EffectVariable = 0,
		Summonant = "AIpha Brick",
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
		Bio = "As a last ditch attempt, the people of Old Robloxia took a two-by-two brick, shined it and enchanted it with a glowing aura in an attempt to fool the Titans. It worked."
	},
	["AIpha Brick"] = {
		Id = 11769945332,
		Name = "AIpha Brick",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		DamageImmune = true,
		TargetImmune = true,
		SetImmune = true,
		Color = "Blue",
		Archetype = "€ra",
		Cost = { Blue = 7 },
		EffectVariable = 0,
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
		Bio = "Do they know?"
	},
	["Dukran's Accord"] = {
		Id = 11769919412,
		Name = "Dukran's Accord",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Blue = 1, Red = 1, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw X cards.\nX is the number of colours and groups among allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "UniqueArchetype", "nil" }
						},
						{
							"AlterEV",
							{ "Add", "Field_Ally", "Chromatic", "nil" }
						},
						{ "Draw", "Variable", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Under the attack of the Titans, Dukran united the desparate tribes of Old Robloxia. They scoured the world to find the Alpha Brick before the Titans devoured the world, then the Heavens."
	},
	Meebozo = {
		Id = 104979299302091,
		Name = "Meebozo",
		AltCards = {
			["Meebozo-Sun"] = { Id = 106588240870840, Bio = "ME ME BO ZO" },
			["yumeship slop enthusiast"] = {
				Id = 83784028224063,
				Name = "yumeship slop enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 659,
				Bio = "i hate running with scissors"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Archetype = "Meeboid",
		Color = "Green",
		Cost = { Green = 4 },
		SummonAnimation = "MeeboidCall",
		CustomReminderRecur = true,
		InPD2 = true,
		CustomReminder = {
			Zombified = "Once a zombified fighter leaves play for any reason, obliterate it."
		},
		Effect = {
			Name = "Build Up",
			Description = "Once each turn, whenever you gain life: Recur an allied Meeboid card, except it's fading and inert when discarded.",
			Type = "OnLifeGain",
			Power = { {
				"MoveZone",
				{ "Meeboid", "GraveZone_Ally", "Hand_Ally", true, false }
			} },
			MetaData = { Fading = true, TokenDiscard = true },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "<b>MEE BOZO.</b>"
	},
	["Unleash the Titans!"] = {
		Id = 76082033109802,
		Name = "Unleash the Titans!",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Blue = 11 },
		InPD2 = true,
		Rank = 11,
		Effect = {
			Name = "Haydoscale",
			Description = "All players draw 11 cards.\nYou can't cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 11, "Opponent" },
						{ "Draw", 11, "Ally" },
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
		Bio = "If his creations coveted the Alpha Brick so badly, Telamon would gladly give them ALL of it."
	},
	Brickseeker = {
		Id = 130069699062636,
		Name = "Brickseeker",
		Health = 150,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		Color = "Red",
		Cost = { Red = 3 },
		Token = true,
		InPD2 = true,
		AnimatesTerrain = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: You lose 400 life. Animate your terrain into a fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AnimateTerrain" },
						{ "Cost", 400 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "“We’re not just fools, we’re the entire circus.”"
	},
	["Titanwarped Terror"] = {
		Id = 133110467168269,
		Name = "Titanwarped Terror",
		Health = 850,
		Power = 850,
		Rarity = "Rare",
		AttackEffect = "Bubbles",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 2 },
		InPD2 = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a card: Give yourself a card of each colour in its cost, then obliterate the 2 oldest cards in your hand.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Red" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "RedBP" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Green" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "GreenBP" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Blue" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "BlueBP" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Yellow" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "YellowBP" },
							"Self"
						},
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" }
					},
					Target = "Aggressor"
				},
				OnEVCheckPassRedBP = {
					Power = { { "RandomAdd", "Red", "Ally" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassYellowBP = {
					Power = { { "RandomAdd", "Yellow", "Ally" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassGreenBP = {
					Power = { { "RandomAdd", "Green", "Ally" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassBlueBP = {
					Power = { { "RandomAdd", "Blue", "Ally" } },
					Target = "Self",
					NoBlip = true
				}
			},
			EffectSpecificDiscardObliterate = true
		},
		Bio = "Dukran hated the Valkyrie's experimentation with titanic stud magic."
	}
}