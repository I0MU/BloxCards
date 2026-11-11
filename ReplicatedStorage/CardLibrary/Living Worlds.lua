return {
	["Mark Stud"] = {
		Id = 6688744901,
		Name = "Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "(You start the game with 2 Colourless Studs in your baseplate.\nWhen you end your turn, you lose all non-Colourless studs, then each card you have in play or your baseplate generates a stud.)",
			Type = "OnSummon",
			Power = "Neutral",
			Target = "Ally",
			Increase = 2
		},
		Bio = "The basic energy of Robloxia. Studs contain great power."
	},
	Moonleak = {
		Id = 8421508475,
		Name = "Moonleak",
		AltCards = {
			["Moonleak-Isla"] = {
				Id = 12941971845,
				Name = "🗿",
				Bio = "🗿 🗿 🗿 🗿 🗿 🗿 🗿"
			},
			["Moonleak-DS"] = {
				Id = 139684554790927,
				Name = "Moonleak",
				PlayTest = true,
				DSPlayTest = true,
				Bio = "Each failure is spat out of the architect's workshop in the sky, forced to live outside of his grace."
			},
			Concentration = { Id = 128257274851433, Name = "Concentration", Bio = "" },
			["Through Patches of Violet"] = {
				Id = 17251035205,
				Name = "Through Patches of Violet",
				Bio = "Here we are, it's our final chance<br/>With your hand<br/>Do what must be done"
			},
			["Moonleak-Meraki"] = {
				Id = 91521254503867,
				Name = "Phantasmal Animal",
				Bio = "Weathering the storm<br/>Spiraling, I call to mind<br/>Nature will persist"
			},
			["Moonleak-Graf"] = {
				Id = 131961927340118,
				Name = "Inconsequence",
				Bio = "I am born, I fade, I judge."
			},
			["Moonleak-Astrid"] = { Id = 113843795643002, Name = "Kindgal", Bio = "she want it forgive" },
			["Rogue Burglar"] = {
				Id = 120215636100458,
				Name = "Justificande Coin",
				AttackEffect = "Hammer",
				Bio = "ONE DAY YOU WILL FORGIVE"
			},
			["Moonleak-Mango"] = {
				Id = 139338010811330,
				Name = "Bluestein Crystal",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				AttackEffect = "Hammer",
				Bio = "A crystalline element defined by its bright blue glow, formed from the high abundance of \"Pure Cold\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Rageborn",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Stud",
			Description = "Draw a card.",
			Type = "OnSummon",
			Power = "Draw",
			Target = "Ally",
			Increase = 1
		},
		Bio = "Nibblex's meal was a cage for an even worse monster."
	},
	["Crowd's Favour"] = {
		Id = 7055632561,
		Name = "Reminder: Crowd's Favour",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Crowd's Favour",
		Cost = { Neutral = 0 },
		SummonAnimation = "CrowdsFavour",
		EffectAnimation = "CrowdsFavour",
		Effect = {
			Name = "Stud",
			Description = "You once filled your board with fighters. You have the crowd's favour for the rest of the game.",
			Type = "OnSummon",
			Power = "Neutral",
			Target = "Ally",
			Increase = 0
		},
		Bio = "The crowd roared in delight as Kara Sinister ripped the Gladiators apart. She stared at Hallow. Now she had his attention, she could do whatever she wanted to him."
	},
	["Blue Stud"] = {
		Id = 5832341521,
		Name = "Blue Stud",
		AltCards = {
			["Rejected Warlord"] = {
				Name = "a super duper tragic weekend",
				Id = 107124161210313,
				AttackEffect = "MagicBlue",
				Bio = "then when i went to the arcade.. THERE WAS SOMEONE ON THE MACHINE NEXT TO ME!! and i didnt want to stand next to them..."
			},
			["Victim C: Loop"] = {
				Name = "The Necronomicon",
				Id = 14959554900,
				AttackEffect = "SoulDrain",
				Bio = "I got a sick obsession, I'm seeing it in my dreams."
			},
			["Blue Stud-Nacho"] = {
				Name = "Nacho in Bits",
				Id = 14387313546,
				AttackEffect = "Divinity",
				Bio = "Get the superglue."
			},
			BlueResident = {
				Name = "Blue Stud",
				Id = 18199520851,
				AttackEffect = "Divinity",
				Bio = "Get the superglue."
			},
			["Blue Stud-Vamp"] = {
				Name = "Blue Stud",
				Id = 78540122238246,
				AttackEffect = "VampBite",
				Bio = "The coolest color."
			},
			["Blue Stud-H25"] = {
				Name = "Bloo Stud",
				Id = 80481756276426,
				AttackEffect = "VampBite",
				Bio = "A scary amount of Ramp. Not to be confused with the imaginary friend."
			},
			["SCPP-B"] = {
				Name = "Facility Guard Juno",
				Id = 96043025582269,
				AttackEffect = "VampBite",
				Bio = "\"i'm trapped. this is a disappointment. oh what a bummer. i'm trapped, bro.\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Blue",
		Archetype = "Studling",
		Cost = { Blue = 1 },
		Effect = {
			Description = "(This card gives {B} when you end your turn, allowing you to play blue cards.)",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Blue studs grant perception and ingenuity. Robloxians who build with them build great laboratories and libraries."
	},
	["Yellow Stud"] = {
		Id = 5832440157,
		Name = "Yellow Stud",
		AltCards = {
			["Discarded Diplomat"] = {
				Name = "a trip to the library",
				Id = 78378694281885,
				AttackEffect = "MagicYellow",
				Bio = "thats when i had TO GO THE LIBRARY... because I DON'T KNOW ANY SYNONYMS FOR TRAGIC!"
			},
			["Victim D: Fluffle"] = {
				Name = "The Pendant",
				Id = 14959555015,
				AttackEffect = "Divinity",
				Bio = "Now this is our time, our generation, and we're impatient animals ready to fight!"
			},
			["Yellow Stud-Nacho"] = {
				Name = "NachoSenne",
				Id = 14387315874,
				AttackEffect = "Rifle",
				Bio = "Personally chosen by IcyTea, as his bodyguard and Twitch moderator."
			},
			YellowResident = {
				Name = "Yellow Stud",
				Id = 18199514067,
				AttackEffect = "Rifle",
				Bio = "mmm yeller"
			},
			["Yellow Stud-Smiley"] = {
				Name = "Cash Register",
				Id = 100183567854206,
				AttackEffect = "Rifle",
				Bio = "Surely you could have found something else worth stealing, right???"
			},
			["SCPP-Y"] = {
				Name = "Scientist Sasha",
				Id = 79619589852810,
				AttackEffect = "VampBite",
				Bio = "\"anyone else hear that ominous bell tolling???? 🤣🤣🤣 no?? just me?????? 😭😭😭😭😭😭😭\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Yellow",
		Archetype = "Studling",
		Cost = { Yellow = 1 },
		Effect = {
			Description = "(This card gives {Y} when you end your turn, allowing you to play yellow cards.)",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Yellow studs grant emotion and empathy. Robloxians who build with them build lively markets and social clubs."
	},
	["Blue Crystal"] = {
		Id = 5832341521,
		Name = "Blue Stud Crystal",
		AltCards = {
			["Blue Crystal-200986"] = {
				Id = 5832341521,
				Name = "Blue Stud Crystal",
				AttackEffect = "Punch",
				Bio = "A blue stud crystal."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Stud Crystal",
		TokenGenZone = true,
		Requirement = { "Archetype", "AllyHand", 3, 9999, "Stud Crystal" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Crystallise",
			Description = "Cast only if there are three or more Crystals in your hand.\nPut a Blue Stud in your Baseplate.\nDestroy all crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "AddGenZone", { "Blue Stud", 1 } },
				{ "ArchetypeDiscard", 999, "Ally", "Stud Crystal" }
			},
			Target = "Ally"
		},
		Bio = "A shard of crystallised blue studs."
	},
	["Red Crystal"] = {
		Id = 5689045240,
		Name = "Red Stud Crystal",
		AltCards = {
			["Red Crystal-200986"] = {
				Id = 5689045240,
				Name = "Red Stud Crystal",
				AttackEffect = "Punch",
				Bio = "A red stud crystal."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Stud Crystal",
		TokenGenZone = true,
		Requirement = { "Archetype", "AllyHand", 3, 9999, "Stud Crystal" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Crystallise",
			Description = "Cast only if there are three or more Crystals in your hand.\nPut a Red Stud in your Baseplate.\nDestroy all crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "AddGenZone", { "Red Stud", 1 } },
				{ "ArchetypeDiscard", 999, "Ally", "Stud Crystal" }
			},
			Target = "Ally"
		},
		Bio = "A shard of crystallised red studs."
	},
	["Green Crystal"] = {
		Id = 5832365495,
		Name = "Green Stud Crystal",
		AltCards = {
			["Green Crystal-200986"] = {
				Id = 5832365495,
				Name = "Green Stud Crystal",
				AttackEffect = "Punch",
				Bio = "A green stud crystal."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Stud Crystal",
		TokenGenZone = true,
		Requirement = { "Archetype", "AllyHand", 3, 9999, "Stud Crystal" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Crystallise",
			Description = "Cast only if there are three or more Crystals in your hand.\nPut a Green Stud in your Baseplate.\nDestroy all crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "AddGenZone", { "Green Stud", 1 } },
				{ "ArchetypeDiscard", 999, "Ally", "Stud Crystal" }
			},
			Target = "Ally"
		},
		Bio = "A shard of crystallised green studs."
	},
	["Yellow Crystal"] = {
		Id = 5832440157,
		Name = "Yellow Stud Crystal",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Stud Crystal",
		TokenGenZone = true,
		Requirement = { "Archetype", "AllyHand", 3, 9999, "Stud Crystal" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Crystallise",
			Description = "Cast only if there are three or more Crystals in your hand.\nPut a Yellow Stud in your Baseplate.\nDestroy all crystals in your hand.",
			Type = "OnSummon",
			Power = {
				{ "AddGenZone", { "Yellow Stud", 1 } },
				{ "ArchetypeDiscard", 999, "Ally", "Stud Crystal" }
			},
			Target = "Ally"
		},
		Bio = "A shard of crystallised yellow studs."
	},
	["Red Stud"] = {
		Id = 5689045240,
		Name = "Red Stud",
		AltCards = {
			["Stranded Monarch"] = {
				Name = "a tragic day...",
				Id = 10823244029,
				AttackEffect = "Slash",
				Bio = "when i woke up... EVERYTHING WAS ONTIME!! I COULDNT USE ANYTHING AS AN EXCUSE TO COME IN LATE!"
			},
			["Victim A: Graf"] = {
				Name = "The Glitter",
				Id = 14959554736,
				AttackEffect = "DoomStorm",
				Bio = "Go insane, go insane, throw some glitter, make it rain."
			},
			["Red Stud-Gulp"] = { Name = "Gulp", Id = 11581898815, Bio = "Gulpalicious def" },
			["Red Stud-Nacho"] = {
				Name = "Nacho, the Devil's Advocate",
				Id = 14387319723,
				AttackEffect = "VampBite",
				Bio = "The devil got away with so many crimes because of this guy."
			},
			["Red Stud-Vamp"] = {
				Name = "Red Stud",
				Id = 132465192724730,
				AttackEffect = "VampBite",
				Bio = "Tastes like cherry candy."
			},
			["Red Stud-Smiley"] = {
				Name = "Roblox Gears",
				Id = 94944178922792,
				AttackEffect = "VampBite",
				Bio = "How on earth did you steal all that???"
			},
			["SCPP-R"] = {
				Name = "Class-D Rumbiez",
				Id = 126552390073181,
				AttackEffect = "VampBite",
				Bio = "\"EEYIKES! I GOTTA GET OUTTA HERE\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Red",
		Archetype = "Studling",
		Cost = { Red = 1 },
		Effect = {
			Description = "(This card gives {R} when you end your turn, allowing you to play red cards.)",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Red studs grant power and authority. Robloxians who build with them build opulent palaces and barracks."
	},
	["Green Stud"] = {
		Id = 5832365495,
		Name = "Green Stud",
		AltCards = {
			["Abandoned Leader"] = {
				Name = "a super duper wuper tragic fridge raid",
				Id = 95541633901382,
				AttackEffect = "MagicGreen",
				Bio = "then when i went to grab a snack.. I ONLY HAD BANANAS!!! IM TIRED OF BANANAS!"
			},
			["Victim B: Lid"] = {
				Name = "The Ticket",
				Id = 14959555188,
				AttackEffect = "MagicGreen",
				Bio = "Let's make the most of tonight like we're gonna die young."
			},
			["Green Stud-Nacho"] = {
				Name = "Druid Nacho",
				Id = 14387322963,
				AttackEffect = "Maelstrom",
				Bio = "My potions are too strong for you, traveler!"
			},
			["Green Stud-C"] = {
				Name = "Christmas Card",
				Id = 15407462722,
				AttackEffect = "MagicGreen",
				Bio = "Season's Greasons!"
			},
			["Green Stud-H25"] = {
				Id = 130269701738986,
				AttackEffect = "MagicGreen",
				Bio = "Brewing up some gen."
			},
			["Green StudNastrond"] = {
				Name = "Nastrond's Essence",
				Id = 92813382801052,
				AttackEffect = "MagicGreen",
				Bio = "<b><font color=\"#4ffe41\">From the depths of Nastrond flows a power untainted by weakness.</font></b>"
			},
			["SCPP-G"] = {
				Name = "Chaos Repressor Servaleon",
				Id = 133580167698255,
				AttackEffect = "VampBite",
				Bio = "\"rest in peace my d-class he got hit by a bazooka\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "StudBlast",
		Color = "Green",
		Archetype = "Studling",
		Cost = { Green = 1 },
		Effect = {
			Description = "(This card gives you {G} when you end your turn, allowing you to play green cards.)",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Green studs grant health and prosperity. Robloxians who build with them do so to keep the world as it is."
	},
	["Neutral Stud"] = {
		Id = 6688744901,
		Name = "Studling",
		AltCards = {
			Studimi = {
				Name = "Genesis",
				Health = 200,
				Power = 200,
				Id = 18467866247,
				AttackEffect = "ClassicRocket",
				Bio = "<font color=\"#FFFFFF\"><b>YOU CANNOT ESCAPE OUR PRESENCE.</b></font>"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Studling",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Stud",
			Description = "",
			Type = "Nil",
			Power = "Neutral",
			Target = "Ally",
			Increase = 2
		},
		Bio = "The basic, unbiased energy of Robloxia. Studs contain great power."
	},
	["Starter Terrain"] = {
		Id = 10224363683,
		Name = "Paleolithic Engine",
		AltCards = {
			["Starter Terrain-UB"] = {
				Health = 1000,
				Power = 1000,
				Id = 10224377033,
				AttackEffect = "MagicYellow"
			},
			["Starter Terrain-UB-Mango"] = {
				Name = "Magnus Moss",
				Health = 1000,
				Power = 1000,
				Id = 121257373556924,
				AttackEffect = "Jab",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "im mossy"
			},
			["Starter Terrain-RA"] = {
				Id = 6835115934,
				AttackEffect = "ClassicRocket",
				Health = 900,
				Power = 900
			},
			["Starter Terrain-LT"] = { Id = 10224379472, Health = 1000, Power = 1000 },
			["Robocade Terrain"] = {
				Id = 10184353620,
				Name = "Corrupted Arcade Bot",
				Bio = "CRITICAL ERR0R DETECT3D"
			},
			Starvelox = {
				Id = 117131941705715,
				Name = "Starvelox",
				Bio = "i'm feeling hungry like i'll eat them all"
			}
		},
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
	["Sword Terrain"] = {
		Id = 9976993938,
		Name = "Spirits of the Heights",
		AltCards = {
			["Umi Terrain"] = {
				Name = "A Legendary Ocean",
				Id = 9166676033,
				AttackEffect = "Whirlpool",
				Bio = "This card's name is always treated as \"Umi\"."
			},
			["Cinder Terrain"] = {
				Name = "Lord of Cinder",
				Id = 9247744209,
				AttackEffect = "Blaze",
				Bio = "Plin Plin Plon."
			}
		},
		Health = 900,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks a fighter: Destroy that fighter if it has less power than this card.",
			Type = "OnAttack",
			Power = { { "CheckSelfPower" } },
			Target = "Aggressor"
		},
		Bio = "You were never worthy of wielding a Darkheart."
	},
	["Disaster Terrain"] = {
		Id = 10936163285,
		CopyBodge = "Diaster Terrain",
		Name = "Pandemonium and Chaos",
		DamageImmune = true,
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a fighter dies: Deal 100 damage to each fighter.",
			Type = "OnAnyDeath",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "Humans were never a part of this game. The terrains were the ones we asked to survive."
	},
	["Crossroads Terrain"] = {
		Id = 11029915368,
		Name = "Ancient Scar",
		AltCards = {
			["Bingus Terrain"] = {
				Name = "Bingus, the Ascended",
				Id = 9528767857,
				AttackEffect = "Divinity",
				Bio = "Real."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Thrice each turn, whenever you cast an action: Put a Roblox gear card into your hand. All allied Terrarians gain 100 power.",
			Type = "OnAllyCast",
			Power = {
				{ "Strengthen", 100, "CustomTarget" },
				{
					"RandomAdd",
					{
						"Linked Sword",
						"Trowel",
						"Rocket Launcher",
						"Superball",
						"Slingshot"
					}
				}
			},
			Target = "Ally",
			TurnTriggerLimit = 3,
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "Over a decade of ruthless wars, no matter how pointless."
	},
	["Ninja Terrain"] = {
		Id = 10936125644,
		CopyBodge = "Ninja Terrain",
		Name = "Genju Speedwagon",
		AltCards = {
			["Ninja Sun Terrain"] = {
				Name = "Scarlet Giant Beneath the Home",
				Id = 9197539153,
				AttackEffect = "FirePunch",
				Bio = " In case of an imminent threat, the giant slumbering beneath the house can awaken to deal with the problem. Armored head to toe with a very strong carapace, the Scarlet Giant does not play around."
			}
		},
		Health = 1100,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3 },
		Terrarian = true,
		Archetype = "Ninja",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast another Ninja fighter: Summon a copy of it.",
			Type = "On|Other|AllySummon",
			Power = { { "SummonCopy", 30, "Aggressor" } },
			Target = "Ally",
			Archetype = "Ninja"
		},
		Bio = "The lands learned from the humans in ways nobody could've imagined."
	},
	["Haunted Terrain"] = {
		Id = 9976992636,
		CopyBodge = "Haunted Terrain",
		Name = "The Monster House",
		AltCards = {
			["Haunted Terrain-Sun"] = {
				Name = "The Flying Dutchman",
				CopyBodge = "Haunted Terrain-Sun",
				Id = 7138324641,
				AttackEffect = "Tempest",
				Bio = "The depths come for you."
			},
			["Haunted Terrain-S"] = {
				Name = "Goodnight Forever After",
				CopyBodge = "Haunted Terrain-S",
				Id = 74728830408204,
				AttackEffect = "Tempest",
				Bio = "Two stars, ever in orbit. Even after entropy claims them both, their ghostlight shall travel forevermore together."
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		WeakenImmune = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "At the start of each player's turn: All enemy fighters lose 50 power.",
			Type = "OnStart",
			Power = { { "Weaken", 50 } },
			Target = "Opponent"
		},
		Bio = "Losing only your sanity is an accomplishment."
	},
	["Caverns Terrain"] = {
		Id = 13508326313,
		Name = "The Wellspring",
		CopyBodge = "Caverns Terrain",
		AltCards = {
			["Caverns Terrain-Sun"] = {
				Name = "That Which Saws Boats In Half",
				CopyBodge = "Spooky Caverns-Sun",
				Id = 8707863750,
				AttackEffect = "Swamp",
				Bio = "-Jaws theme plays-"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		WeakenImmune = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Set your {W} to 4. Your opponent loses {W}.",
			Type = "OnEnd",
			Power = {
				{ "SetNeutral", 4 },
				{ "Neutral", -1, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "The terrain realized the greed of those who inhabit it, and adapted."
	},
	["Bread Terrain"] = {
		Id = 10936104340,
		CopyBodge = "Bread Terrain",
		AltCards = {
			["Market Freeze Terrain"] = {
				Name = "Suspiciously Wealthy Deer",
				CopyBodge = "Market Freeze Terrain",
				Id = 9881121964,
				AttackEffect = "Scratch",
				Bio = "Feel so clean, like a money machine."
			}
		},
		Name = "That Which Has An Expiration Date",
		Health = 1500,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Unlock all allied Terrarians. They gain 100 health.",
			Type = "OnEnd",
			Power = {
				{ "Unlock", 9999 },
				{ "Heal", 100 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "When you think about it, everything expires eventually. We just don't plan on it any time soon."
	},
	["Rain Terrain"] = {
		Id = 10936121298,
		CopyBodge = "Rain Terrain",
		Name = "Deluge Deus Fahrenheit",
		AltCards = {
			["Rain Terrain-Sun"] = {
				Name = "Deus Deluge Fahrenheit",
				CopyBodge = "Rain Terrain-Sun",
				AttackEffect = "Bubbles",
				Id = 7138325835,
				Bio = "Punishment for being british tbh"
			},
			["Rain Terrain-Mango"] = {
				Name = "Mango the Tuffman",
				Id = 116728766571901,
				CopyBodge = "Rain Terrain-Mango",
				AttackEffect = "Bite",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "He has no soul"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever an effect draws you a card: Draw a card. All terrarian fighters gain 100 health.",
			Type = "OnAllyDraw",
			Power = {
				{ "Heal", 100 },
				{ "Draw", 1, "Ally" }
			},
			Target = "CustomTarget",
			TurnTriggerLimit = 1,
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "Nobody listened to the harbinger of the storm. This is their wrath."
	},
	["Sands Terrain"] = {
		Id = 9976991082,
		Name = "Wailing Tidecrasher",
		AltCards = {
			["Purgatory Terrain"] = {
				Name = "Giant of Purgatory",
				Id = 9345618857,
				AttackEffect = "Blaze",
				Bio = "Seems like they've assumed only those aliens can survive here. If only they knew before our demise."
			},
			["The Festival Terrain"] = {
				Name = "Dani",
				Id = 13688017445,
				AttackEffect = "DoomStorm",
				Bio = "This seems bear-y excessive."
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "Swamp",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks: You lose 100 life and your opponent loses 500 life.",
			Type = "OnAttack",
			Power = {
				{ "Inflict", 500 },
				{ "Cost", 100 }
			},
			Target = "Opponent"
		},
		Bio = "Land ho, to below the seabed. We welcome you all."
	},
	["Baseplate Terrain"] = {
		Id = 10936149894,
		AltCards = {
			["Area 51 Terrain"] = {
				Id = 129132351422186,
				Name = "The Killers",
				AttackEffect = "British",
				Bio = "I'll ask you again, can you survive and kill the killers in Area 51?"
			},
			HuhuoboTerrarain = {
				Id = 97287486388793,
				Name = "The World Splitter, Huhuobo",
				Terrariant = "HuhuoboTerrarain",
				Bio = "There is nothing I can't split... not even the world itself!"
			},
			["Baseplate Terrain-Quest"] = {
				Id = 71401803081874,
				Name = "Duelist Demon",
				Terrariant = "Duelist Demon",
				Bio = "You got hit by eye of heaven???? Newgen."
			}
		},
		Name = "Scion of the Void",
		Health = 900,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever this card attacks, if there's an allied terrain: Draw a card.",
			Type = "OnAttack",
			Power = { { "Draw", 1, "Ally" } },
			EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 },
			Target = "Opponent"
		},
		Bio = "The one equalizer between Terrarians and those who use them."
	},
	["Paradise Terrain"] = {
		Id = 10936101018,
		CopyBodge = "Paradise Terrain",
		AltCards = {
			["Paradise Terrain-Party"] = {
				Id = 138401537354198,
				Name = "Party Crashers",
				AttackEffect = "Jab",
				Bio = " “A party? Without us? This simply cannot do!”"
			}
		},
		Name = "Draugr ór Jörmundgandr",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card dies: Give yourself 'Living World,' except its cost is {G}{G}{G}.",
			Type = "OnDeath",
			Power = { { "Add", "LivingWorldEmpowered" } },
			Target = "Ally"
		},
		Bio = "No one ever stopped to ask for whose paradise this forest was meant for."
	},
	["Banland Terrain"] = {
		Id = 10980791817,
		Name = "Unforgiving Excavator",
		AltCards = {
			["Banland Terrain-Hal"] = {
				Name = "狸",
				Id = 137387491740513,
				AttackEffect = "Scratch",
				Bio = "\"I hear what sounds like a beating drum mixed with some kind of bell way off in the distance. Honestly, I have no idea what to do at this point.\"<br/>\"Someone behind me yelled “Hey! Don’t walk on the track, that’s dangerous!” I looked around expecting to see an attendant, and saw a one-legged old man, but he vanished. I think I’m too scared to move.\"<br/>\"I can’t walk or run any further. The drumming sound is getting a little closer.\""
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Terrarian = true,
		DestroyImmune = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: All fighters, then all allied Terrarians gain 100 health and power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 },
				{ "Heal", 100, "CustomTarget" },
				{ "Strengthen", 100, "CustomTarget" }
			},
			Target = "All",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "A place meant for the corrupt can only remain pure for so long."
	},
	["Fens Terrain"] = {
		Id = 11346821993,
		CopyBodge = "Fens Terrain",
		Name = "The Fens Resurgent",
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
	["Tree Terrain"] = {
		Id = 9976990047,
		CopyBodge = "Tree Terrain",
		Name = "Wanwood Dominus",
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a terrain from the World of Wood: You gain {W}.",
			Type = "OnAllyTerrainCast",
			Power = { { "Neutral", 1 } },
			Target = "Ally",
			Archetype = "World of Wood"
		},
		Bio = "The Great Tree became rather displeased with the actions seen around its forest. It couldn't bear witnessing the sight any longer."
	},
	["World Terrain"] = {
		Id = 11344378424,
		CopyBodge = "World Terrain",
		Name = "The Roil",
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = "World of Wood",
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever you cast a terrain: Search your deck for a card from the World of Wood, then draw a card.",
			Type = "OnAllyTerrainCast",
			Power = {
				{ "RandomTutorfor", "Variable" },
				{ "Draw", 1 }
			},
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "The irradiated forest sent out as many people as they could, who fought all in the name of protecting their deteriorating home."
	},
	["Voidoak Terrain"] = {
		Id = 11029636997,
		CopyBodge = "Voidoak Terrain",
		Name = "The End of Wood",
		Health = 2200,
		Power = 2200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		DestroyImmune = true,
		ReturnImmune = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this fighter dies: Destroy all fighters. Until the start of your next turn, your opponent can't attack or cast anything, nor do fighters unlock or effects trigger during their next end step.",
			Type = "OnDeath",
			Power = {
				{ "Destroy", 30, "All" },
				{ "BypassAttack" },
				{ "BypassGeneration" },
				{ "BypassSummon" },
				{ "BypassCasts" },
				{ "BypassAction" },
				{ "BypassTerrain" },
				{ "BypassEnd" },
				{ "BypassLock" }
			},
			Target = "Opponent"
		},
		Bio = "I'm sorry, Eisenhower. We cannot help you."
	},
	["Remnant Terrain"] = {
		Id = 18603865699,
		CopyBodge = "Remnant Terrain",
		Name = "Mournful Congregation",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		SuspendImmune = true,
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Suspend all allied fighters from play until your opponent's next end step.",
			Ability = {
				OnEnd = {
					Power = { { "Suspend" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The spirits of Cothran's dead have forgiven Zanzel for her trangressions."
	},
	["Foroth Terrain"] = {
		Id = 10224147288,
		Name = "Ocean of Law",
		AltCards = {
			["SilentPurgatory-TRN"] = {
				Id = 15710749041,
				Name = "The Landlord",
				AttackEffect = "British",
				Bio = "\"Ah, Ms. Greene!\"\nThe man approaches you, holding an black umbrella with his left hand.\n\"About time you've arrived, please follow me.\nYou have much to do.\"\n",
				Effect = {
					Name = "Temporal Halo",
					Description = "When this card is animated: Give each player two Peace Term cards.\nOnce each turn, Whenever a Peace Term is cast: You draw a card.",
					Ability = {
						OnAnimateSummon = {
							Power = {
								{
									"RandomAdd",
									{ "SilentPurgatory-T1", "SilentPurgatory-T2", "SilentPurgatory-T3" },
									"Ally"
								},
								{
									"RandomAdd",
									{ "SilentPurgatory-T1", "SilentPurgatory-T2", "SilentPurgatory-T3" },
									"Ally"
								},
								{
									"RandomAdd",
									{ "SilentPurgatory-T1", "SilentPurgatory-T2", "SilentPurgatory-T3" },
									"Opponent"
								},
								{
									"RandomAdd",
									{ "SilentPurgatory-T1", "SilentPurgatory-T2", "SilentPurgatory-T3" },
									"Opponent"
								}
							},
							Target = "All"
						},
						OnAnyCast = {
							Power = { { "Draw", 1 } },
							Target = "Ally",
							Archetype = "Peace Term",
							TurnTriggerLimit = 1
						}
					}
				}
			},
			["Foroth Terrain-10Y"] = { Id = 89338123167563, Bio = "A mental plague." }
		},
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Archetype = "Planet",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is animated: Give each player two Peace Term cards. Once each turn, Whenever a Peace Term is cast: You draw a card.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"RandomAdd",
							{ "PT1", "PT2", "PT3" },
							"Ally"
						},
						{
							"RandomAdd",
							{ "PT1", "PT2", "PT3" },
							"Ally"
						},
						{
							"RandomAdd",
							{ "PT1", "PT2", "PT3" },
							"Opponent"
						},
						{
							"RandomAdd",
							{ "PT1", "PT2", "PT3" },
							"Opponent"
						}
					},
					Target = "All"
				},
				OnAnyCast = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					Archetype = "Peace Term",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The waters of Foroth brainwash all who drink from it. Its denizens are lucky that its oligarchs are not malevolent."
	},
	["Kathara Terrain"] = {
		Id = 8421520019,
		Name = "A Wasteland Desecrated",
		Health = 1400,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Archetype = "Planet",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is animated: Search your deck for a Planet card.\nWhenever you cast a Planet: You lose 400 life. Animate that Planet.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "RandomTutorfor", "Planet" } },
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = {
						{ "Cost", 400 },
						{ "AnimateTerrain" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 401, 999999, "Life" },
					Archetype = "Planet"
				}
			}
		},
		Bio = "Kathara was a desert before the Federation turned it to glass. With their homeland ruined, the Katharans migrated to prevent other planets suffeing the same fate."
	},
	["Havalu Terrain"] = {
		Id = 12718431605,
		Name = "Empty Space",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Addant = "Moonleak",
		Archetype = "Planet",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is animated: Give yourself four Moonleaks.\nAt the start of your turns, if you have 7000 or more Life: You lose 1000 Life. The next action you cast this turn triggers its effect twice.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{ "ActionOverdrive", 1 },
						{ "Cost", 1000 }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 7000, 999999, "Life" }
				}
			}
		},
		Bio = "Nibblex found the Federation technology that created Havalu a great seasoning for the meal, although it left a pungent aftertaste."
	},
	["Javion Terrain"] = {
		Id = 99077085161529,
		Name = "Impact Crater Uncaged",
		AltCards = {
			["Hardware Terrain"] = {
				Name = "Strange Al",
				Id = 9499126080,
				AttackEffect = "Microphone",
				Bio = "I can't wait, I can't wait, oh when are they gonna open up that door? I'm goin, yes I'm goin, I'm a-goin' to the hardware store!"
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Addant = "Moonleak",
		Archetype = "Planet",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is animated: Give yourself a Robux stack and a Moonleak.\nWhenever you cast a token action: All allied token fighters gain 100 Health and Power.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{ "Add", "Targeting Blip" },
						{ "Add", "Moonleak" }
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "CustomTarget",
					Rarity = "Token",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Rarities",
						Modifier = {
							Rarities = { "Token" }
						}
					}
				}
			}
		},
		Bio = "Javion was punished for the crimes of another world."
	},
	["Cothran Terrain"] = {
		Id = 8421526606,
		Name = "Cothran Resurgent",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Archetype = "Planet",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is animated: You gain {W}{W}.\nDuring your end step, if you have 10 or more {W}: Each fighter in your hand gains 200 Health and Power.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "Neutral", 2 } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "HealHand", 200 },
						{ "StrengthenHand", 200 }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 10, 9999, "IconsNeutral" }
				}
			}
		},
		Bio = "After countless loss and the destruction of its sister planets, Cothran beat back the invaders."
	},
	["Xor's Terrain"] = {
		Id = 10245870525,
		Name = "Unhappy Patrons",
		AltCards = {
			["Mall Terrain"] = {
				Id = 9238699440,
				Name = "Mall Securitron",
				AttackEffect = "LaserRed",
				Bio = ""
			},
			["Theobroma Terrain"] = {
				Id = 9709349709,
				Name = "Unc, After Hours",
				AttackEffect = "Electric",
				Bio = "“With the right stressors, one can receive mental images from varying individuals across different time periods or even different universes without the need for direct communication between both parties.” - Theobroma, Unc. On The Morphogenetic Field. 1st ed., Robledge, XXXX"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an effect targets this card: All allied fighters, then all allied Terrarians gain 50 health and power.",
			Type = "OnTarget",
			Power = {
				{ "Heal", 50 },
				{ "Strengthen", 50 },
				{ "Heal", 50, "Ally" },
				{ "Strengthen", 50, "Ally" }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "Crack open a skull with the boys."
	},
	["Minigame Terrain"] = {
		Id = 10936466138,
		AltCards = {
			["Circus Terrain"] = {
				Id = 7472044424,
				Name = "The Carnevil",
				AttackEffect = "DoomStorm",
				Bio = "Let the fun into your heart."
			},
			["Eclipse Terrain"] = {
				Id = 7776937182,
				Name = "Hades",
				AttackEffect = "Blaze",
				Bio = "The overworld is forever mine. Let the reign of the underworld begin!"
			},
			["Minigame Terrain-10Y"] = {
				Id = 126483888074422,
				AttackEffect = "Blaze",
				Bio = "MORE! MORE! MORE!!!"
			}
		},
		Name = "Agent of Havoc",
		Health = 1600,
		Power = 1600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Four times each turn, whenever you discard a card:\nYou may baseplate again this turn. Give yourself a Rare card.",
			Type = "OnAllyDiscard",
			Power = {
				{ "DiscardLimit", 1 },
				{ "RandomAdd", "Rare" }
			},
			Target = "Ally",
			TurnTriggerLimit = 4
		},
		Bio = "Why don't we turn the difficulty up a bit? Dance faster, dance!"
	},
	["Domain Terrain"] = {
		Id = 11281308199,
		AltCards = {
			["Domain Terrain-E"] = {
				Id = 8730730182,
				Name = "A Dead Land Remembered",
				AttackEffect = "Divinity",
				Bio = "The effigies of elder gods of old still cast their judgemental gaze to this day."
			},
			["Dustin, Cousin of the Heartbreaker"] = {
				Id = 10820923669,
				AttackEffect = "MagicBlue",
				Name = "Dustin, Cousin of the Heartbreaker",
				Bio = "welcome to the v..."
			},
			["snubcube-Token"] = {
				Id = 116565806299770,
				AttackEffect = "Slash",
				Name = "Completed Мастер",
				Bio = "₁₃ Мастер's completion can only be had once compressing all qualities into a singularity, a condensation of all forces acting on it leads into a delegation of all forces nolified."
			}
		},
		Name = "The Tempest",
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Tempest",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		OmniImmune = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "",
			Type = "Null",
			Power = { { "Draw", "0" } },
			Target = "Ally"
		},
		Bio = "Come back to me, Lezus..."
	},
	["Presence Terrain"] = {
		Id = 7282063541,
		CopyBodge = "Presence Terrain",
		Name = "Ghashendex's Sanctum",
		AltCards = {
			["Ouroboros Terrain"] = {
				Id = 8295613103,
				Name = "Origin's Ouroboros",
				AttackEffect = "Divinity",
				Bio = "<Impressive/Amazing/Outstanding> <You have persisted/persevered/endured> <1x1/2x2/3x3 may have a use for you yet across the timelines> <The Revelations/Epiphanies/Discoveries it has blessed you with is proof of such>"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporaal Halo",
			Description = "Whenever an enemy fighter dies: Summon a copy of the last dead enemy fighter.",
			Type = "OnEnemyDeath",
			Power = { { "LastDeath", 30 } },
			Target = "Opponent"
		},
		Bio = "After the Ultra Hiveworld's Worldpurge, he did what no one thought an Ultra was capable of. He sobbed uncontrollably."
	},
	["Ultra Terrain"] = {
		Id = 10224183521,
		CopyBodge = "Ultra Terrain",
		Name = "Timeline A: Hivemind's Expansion",
		AltCards = {
			["Bibee Terrain"] = {
				Name = "DEATH TO AL-",
				Id = 10184404482,
				AttackEffect = "Microphone",
				Bio = "\"The job has been done, that damn loud mouthed ultra commander is no more.\""
			},
			["Galaxy Terrain"] = {
				Name = "Overlord Galaxy",
				Id = 8012859329,
				AttackEffect = "Arcane",
				Bio = "It takes a monster to survive the Nil, and something worse to thrive in it."
			},
			["Backrooms Terrain"] = {
				Name = "ORIGIN",
				Id = 11140802814,
				AttackEffect = "Divinity",
				Bio = "\"The fruits of our labor turned out to be rotten.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card dies: Summon an Ultra fighter.",
			Type = "OnDeath",
			Power = { {
				"RandomSummon",
				{
					"Ultra Bestower",
					"Ultra Enhancer",
					"Ultra Otherer",
					"Ultra Beseecher",
					"Ultra Desirer",
					"Ultra Severer",
					"Ultra Depriver",
					"Ultra Vanquisher",
					"Ultra Orator"
				}
			} },
			Target = "Ally"
		},
		Bio = "A phantom vision manifests from the Brick, linking the past with the correct future for a fleeting moment."
	},
	["Mo Terrain"] = {
		Id = 10936159372,
		AltCards = {
			["Mo Terrain-E"] = {
				Name = "Prison of His Own Creation",
				Id = 8707811706,
				AttackEffect = "Scratch",
				Bio = "Which came first, the ChuChu or the Mo?"
			}
		},
		Name = "Rex Novus Infectus",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever a terrain is cast: Put a stud into your baseplate that's the same colour as the most common colour in your opponent's deck. Give yourself a Titanic Stud card.",
			Type = "OnTerrainCast",
			Power = {
				{ "CommonIcon", 1 },
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
		Bio = "O quam cito transit gloria mundi."
	},
	["Hazenwyld Terrain"] = {
		Id = 10936095965,
		CopyBodge = "Hazenwyld Terrain",
		Name = "Timeline D : The Lunar Renaissance",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever an allied terrarian dies: Animate your terrain into a fighter.",
			Type = "OnAllyDeath",
			Power = { { "AnimateTerrain" } },
			HasPassive = "Terrarian",
			Target = "Ally"
		},
		Bio = "Lua watched on as the lycanthropes singlehandedly pushed the Ultras back permanently, and Zanzel with them. He caught a glimpse of the person who led the pack, a mentor lost long ago."
	},
	["Cat's Eye Curate"] = {
		Id = 84680087229567,
		Name = "Cat's Eye Curate",
		Health = 1250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever you cast a terrain: Attach it to this card. Search your deck for a terrain one rarity lower.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "Nil" },
							"Aggressor"
						},
						{ "EquipGear", "TargetToSelf", "Aggressor" },
						{ "DestroyTerrain", "Obliterate", "Ally" },
						{
							"EVExactValueCheck",
							{ "Common", "TokenCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Uncommon", "CommonCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Rare", "UncommonCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Epic", "RareCat" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Legendary", "EpicCat" },
							"Self"
						}
					},
					Target = "AggressorAddedCard",
					TurnTriggerLimit = 1
				},
				OnEVCheckPassTokenCat = {
					Power = { { "RandomTutorfor", "Token Terrain" } },
					Target = "Ally"
				},
				OnEVCheckPassCommonCat = {
					Power = { { "RandomTutorfor", "Common Terrain" } },
					Target = "Ally"
				},
				OnEVCheckPassUncommonCat = {
					Power = { { "RandomTutorfor", "Uncommon Terrain" } },
					Target = "Ally"
				},
				OnEVCheckPassRareCat = {
					Power = { { "RandomTutorfor", "Rare Terrain" } },
					Target = "Ally"
				},
				OnEVCheckPassEpicCat = {
					Power = { { "RandomTutorfor", "Epic Terrain" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The old world remembered Telamon's deception, and simply wished to return the favour."
	},
	["Bloxburg Terrain"] = {
		Id = 9984192374,
		CopyBodge = "Bloxburg Terrain",
		Name = "Timeline E: Bloxburg in Triumph",
		Health = 1500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Zanzel's ambitions were no match for 'Alex | 18 | Senior | Half Demon | Half ##### | Depressed.'"
	},
	["Laboratory Terrain"] = {
		Id = 10174502586,
		AltCards = {
			["8-Ball Terrain"] = {
				Id = 7257104031,
				AttackEffect = "MagicBlue",
				Name = "The Negligent Workshop Incident",
				Bio = "Ok, who started the fire? “Joe” - the workers cried. I don’t remember a Joe working here."
			}
		},
		Name = "Timeline B: Artemis' Magick Grotto",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "When this card attacks and destroys another: Unlock all allied Terrarians. Lock this card for 2 turns.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Unlock", 9999, "CustomTarget" },
				{ "Lock", 2 }
			},
			Target = "Self",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "HasPassive",
				Modifier = "Terrarian"
			}
		},
		Bio = "With Eisenhower gone, Artemis grew secluded from the world and delved into the dark magic he once rejected, still with a pure, warm smile on his face."
	},
	["Shambeth Terrain"] = {
		Id = 9996488447,
		AltCards = {
			["Doll Terrain"] = {
				Id = 11344374256,
				Name = "The Foundation",
				AttackEffect = "Gravity",
				Bio = "The thing you call fate is us."
			},
			["Cyclone Terrain"] = {
				Id = 11435978006,
				Name = "Euphoric Motley",
				AttackEffect = "Jab",
				Bio = "<i>\"Lend me your hand, so I may show you something grand.\"</i>"
			}
		},
		Name = "Timeline C: Vengeful Umberlord",
		Health = 2000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "During your end step: Your opponent draws 3 cards, except they're fleeting.",
			Type = "OnEnd",
			Power = { { "Draw", 3 } },
			EffectFleeting = true,
			Target = "Opponent"
		},
		Bio = "With everyone weakened at the end of the conflict, Hallow betrayed Eisenhower and took the Brick for himself, indebting the entire world as their savior. It was a leap day."
	},
	["Xargasdon Terrain"] = {
		Id = 9976995838,
		Name = "Heaven Under Assault",
		AltCards = {
			["Duelshire Terrain"] = {
				Id = 9362329687,
				Name = "Fundamentally Unbalanced Battlegrounds",
				AttackEffect = "Electric",
				Bio = "The clash of wills has bled into this land, manifesting all the injustice within."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever this card attacks: Give yourself 3 Titanic Stud cards.\nYou may baseplate again this turn.",
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
				},
				{ "DiscardLimit", 1 }
			},
			Target = "Ally"
		},
		Bio = "The spaceship's central computer still functions, and is still furious at its abandonment."
	},
	["Pits Terrain"] = {
		Id = 11344361002,
		Name = "Umberhallow's Extraction Engine",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Addant = "Hallow's Extraction",
		WeakenImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Common Icon",
			Description = "During your end step: All allied fighters generate. Give yourself 'Hallow's Extraction.'",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1 },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "Umberhallow would frequently allow less fortunate demons to watch the games, free of charge."
	},
	["Mouth of Kala Terrarian"] = {
		Id = 9570532387,
		Name = "Yama, First to Know Death",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "During your end step: Set this fighter's power to 0, then it gains 50 Power for each card in your graveyard.",
			Type = "OnEnd",
			Power = {
				{ "SetPower", 0 },
				{
					"AlterEV",
					{ "Set", "GraveZone_Ally", "Any", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "Perhaps a million more would, he thought. And so he sent his word across the land, along with his blade."
	},
	["Grieving World Terrarian"] = {
		Id = 18757364400,
		Name = "Tectonic Beast",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever you opponent casts a fighter: They lose 1500 life.",
			Type = "OnEnemySummon",
			Power = { { "Inflict", 1500 } },
			Target = "Opponent"
		},
		Bio = "New Robloxia had found itself torn apart once more, becoming an amalgamation of soil, oceans, and skies."
	},
	["Hope For Mending Terrarian"] = {
		Id = 10224149964,
		Name = "Robloxia's Resolve",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever an effect searches a card: All allied fighters gain 100 health and power.",
			Type = "OnAnyTutor",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "Ally"
		},
		Bio = "As the diety's promise of salvation spread, the people of New Robloxia regained the resolve they once had when the Collosus was reborn to oppose the greatest threat."
	},
	["Deportation Depo Terrarian"] = {
		Id = 10224148740,
		Name = "Sanction Of Cowardice",
		AltCards = {
			["Idol Honoka"] = {
				Id = 16738206230,
				Name = "Idol Honoka",
				Bio = "\"Now introducing our latest debut idol! Please welcome... Honoka!\"<br/>\"Oh my goodness! The ratings are soaring immediately after we introduced her and its the highest in all of our debuts!\""
			}
		},
		Health = 1000,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		ReturnImmune = true,
		Effect = {
			Name = "Common Icon",
			Description = "Whenever an allied fighter dies, if it's your turn: Return a target allied fighter to its hand.",
			Type = "OnAllyDeath",
			Power = { { "Return" } },
			Target = "SingleAlly",
			EffectRequirement = { "MyTurn", "Me", 30, 303 }
		},
		Bio = "Without their instant transportational technology, the Orinthians had fallen against the tides of time."
	},
	["Burn The Heathens Terrain"] = {
		Id = 10073799103,
		Name = "Hell On Earth",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied fighter dies: Destroy the bottom 2 cards of your opponent's deck. Put them into your graveyard.",
			Type = "OnAllyDeath",
			Power = {
				{
					"MoveZone",
					{ "BottomCard", "Deck_Opponent", "GraveZone_Ally", false, false },
					"Self"
				},
				{
					"MoveZone",
					{ "BottomCard", "Deck_Opponent", "GraveZone_Ally", false, false },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = "Erisyphia had to watch as the plastic began to melt from her friends. She simply stood there, unable to truly accept her loss."
	},
	["Vaporwave Plaza Terrarian"] = {
		Id = 10834501321,
		AltCards = {
			["Aetheralis Terrarian"] = {
				Id = 14204795523,
				Name = "Aetheralis, King of Scelatra",
				Bio = "Give him some food and he'll give you the world."
			}
		},
		Name = "Saelent",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: Give yourself a copy of a terrain card in your baseplate.",
			Type = "OnEnd",
			Power = { {
				"MoveZone",
				{ "Terrain", "GenZone", "Hand", true, true }
			} },
			Target = "Self"
		},
		Bio = "\"..Wait, you're not 10th-Dimensional, you shouldn't be here. Are you a part of the IDM?\""
	},
	["Factory Terrarian"] = {
		Id = 10936051633,
		Name = "The Soulless Earth",
		AltCards = {
			["The Harsh Reality"] = {
				Name = "The Harsh Reality",
				Id = 16738204364,
				Bio = "Do \"what\", exactly Nixon? I'm not a card game character. Do you seriously think I'd explain my master stroke to you if you had the slightest chance of ruining it? I've already planted the failsafe 35 minutes ago."
			}
		},
		Health = 50,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Shovelware",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: All enemy fighters lose 50 health and power for each Cash Grab in your Baseplate.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Archetype", "Cash Grab" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Cash Grab" },
							"Self"
						},
						{ "PierceDamage", "Variable" },
						{ "Weaken", "Variable" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "Actions have consequences."
	},
	["Yomi's Frenzy"] = {
		Id = 12182326577,
		Name = "Yomi's Frenzy",
		AltCards = {
			["Yomi's Frenzy-Cloker"] = {
				Id = 94032320114943,
				Name = "Cloker, Professional Bomb Surfer",
				Bio = "Survive my Teeth-Chattering, Bomb-Tastic Assault!!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: Obliterate your opponent's graveyard. Summon a Yourei fighter from your graveyard for every 5 cards obliterated this way.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"GraveZoneDiscard",
							{ "Blue", 0 },
							"Opponent"
						},
						{
							"GraveZoneDiscard",
							{ "Green", 0 },
							"Opponent"
						},
						{
							"GraveZoneDiscard",
							{ "Red", 0 },
							"Opponent"
						},
						{
							"GraveZoneDiscard",
							{ "Yellow", 0 },
							"Opponent"
						},
						{
							"GraveZoneDiscard",
							{ "Neutral", 0 },
							"Opponent"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Yourei_Fighter", "GraveZone_Ally", "Field_Ally", true, false, 1 },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 5, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The barrier between man and spirit is the same as your bones: Made to be broken."
	},
	["Caishen Terrarian"] = {
		Id = 118065936920188,
		Name = "False Paradise",
		Health = 1200,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: A target fighter generates thrice, then loses 500 health.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Generate", 3 },
						{ "Damage", 500 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Wealth before life. Power before dignity."
	},
	["Lunar Drilling Terrarian"] = {
		Id = 11183934033,
		Name = "Sanctuary of Ambition",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever a Blessing is used by an allied fighter: That fighter gains an additional 200 health and power.",
			Ability = {
				OnAllySummonModified = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Adreti saw the moon as his ticket off Javion, off the endless toil and grind, off the stranglehold Biggs had over his life. He wished for freedom as he traded one master for another."
	},
	["Lunar Impact Terrarian"] = {
		Id = 10823740158,
		Name = "Cradle Of The Colossus",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Blessing = true,
		ModifierEclipse = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: Put an Apocalyptic Blessing into a card space in your hand.",
			Ability = {
				OnAttack = {
					Power = { { "AddHandModifier", "EclipseBless", "RandomAllyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = "Sattelite Dislodged from Manifested Orbit 001 - Impact Calculated To Land at Planet Javion [0665] in T-00:01:21:13:45:16 - Surface Breach Imminent."
	},
	["Crossover Arena Terrarian"] = {
		Id = 11137664012,
		Name = "Sudden Death",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast a grouped fighter: Give yourself a card from that group.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" }
						},
						{ "RandomAdd", "Variable", "Ally" }
					},
					Target = "Aggressor",
					TurnTriggerLimit = 1,
					AnyArchetype = true
				}
			}
		},
		Bio = "All eyes on you, better make it count."
	},
	["Inside The Mind of Fluffle Terrarian"] = {
		Id = 11608457274,
		Name = "Misguided Deity, Flufflefunz",
		AltCards = {
			["Isla de Pascua Terrarian"] = {
				Id = 12941970627,
				AttackEffect = "Darkheart",
				Name = "🗿funz",
				Addant = "Moonleak-Isla",
				Bio = "🗿 🗿 🗿 🗿 🗿 🗿 🗿"
			}
		},
		Health = 600,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Addant = "Moonleak",
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you animate a terrain: Give yourself a Moonleak and remove {W} from its cost.",
			Ability = {
				OnAllyAnimateSummon = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally",
					MetaData = { AddNeutralCost = -1 }
				}
			}
		},
		Bio = "Turns out when you have infinite time you end up learning a bit too much about the secrets of life. The universe wanted him silenced, but he wouldn't be going down without a fight. If only he'd known what this victory would lead to - perhaps things could have ended differently."
	},
	["History Rewritten"] = {
		Id = 11769928045,
		Name = "History Rewritten",
		AltCards = {
			HollowMint = {
				Id = 82220467511386,
				Name = "Hollow Technique Mint",
				AttackEffect = "MagicBlue",
				Bio = ""
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: All fighter cards in your Graveyard gain 100 health and power. Recur an allied card.",
			Ability = {
				OnAttack = {
					Power = {
						{ "HealGrave", 100, "Ally" },
						{ "StrengthenGrave", 100, "Ally" },
						{
							"MoveZone",
							{ "Any", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Let the record show that Evincar Yuéliáng Shoda died a hero, with Cadet Lua Perilune as her successor.\""
	},
	["Temple of the Titans"] = {
		Id = 11769945666,
		Name = "Temple of the Titans",
		AltCards = {
			["NTPinheiro: The Spotlight"] = {
				Id = 139882245543824,
				Name = "NTPinheiro: The Spotlight",
				AltArt = true,
				Bio = "\"Relying solely on your love...\""
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Blessing = true,
		ModifierVengeful = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent discards a card: Put a Vengeful Blessing on a card space in their hand.",
			Ability = {
				OnEnemyDiscard = {
					Power = { { "AddHandModifier", "VengefulBless", "RandomEnemyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = "The Celestials chose the latter."
	},
	["Land of Ashes"] = {
		Id = 11769923892,
		Name = "Land of Ashes",
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "Punch",
		Overload = true,
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Null = {
					Power = { { "AddHandModifier", "VengefulBless", "RandomEnemyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = "Those who died in the Alpha War were never identified."
	},
	["Unyielding Battleground"] = {
		Id = 11769943391,
		Name = "Unyielding Battleground",
		Health = 400,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Overload = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: Unlock it. During your end step, if your hand isn't full: Give yourself 'Total War,' then cast it for free. Destroy this card.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{ "Add", "Total War" },
						{
							"ForceCast",
							{ "Total War" },
							"Ally"
						},
						{ "Destroy", 30, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 0, 10, "Hand" }
				}
			}
		},
		Bio = "Destruction is the reason War never changes."
	},
	["The Winner's Chamber"] = {
		Id = 11769944967,
		Name = "The Winner's Chamber",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: Draw a card. A target fighter gains 500 health and power.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "Heal", 500, "Single" },
						{ "Strengthen", 500, "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Five would stand, but only one could exploit it's infinite power."
	},
	["Order of the Limb"] = {
		Id = 11780991711,
		Name = "Order of the Limb",
		AltCards = {
			["Order of the Limb-AN"] = {
				Id = 13893834089,
				Name = "What The? Help!",
				Terrariant = "Order of the Limb-AN",
				AttackEffect = "LinkedSword",
				Bio = "\"Hey, old me. It's time for you to go quiet for a long time now.\""
			},
			["Philabob's Philanthropy"] = {
				Id = 16738205133,
				Name = "Philabob's Philanthropy",
				Terrariant = "Order of the Limb-AN",
				Bio = "\"Sataa andagii\""
			},
			["The Adventures of Gent Manic"] = {
				Id = 82450093996286,
				Name = "The Adventures of Gent Manic",
				Bio = "so it all started when i tried cutting some steak"
			},
			TheTiesUltimateSelf = {
				Id = 92969624185830,
				Name = "TheTiesUltimateSelf",
				AttackEffect = "Jab",
				Bio = "A culmination of everything in that closet into one ultimate being.. also a HS^2 Reference."
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns: Select a token action in your graveyard from a choice of 3. Recur that card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Action = true, Rarity = "Token" },
						SelectionDescription = "a token action to recur.",
						MinTargets = 0,
						MaxTargets = 1,
						RandomSelectionCount = 3
					}
				}
			}
		},
		Bio = "Those who forget history are doomed to repeat it."
	},
	["Shedletsky's Return"] = {
		Id = 11769946254,
		Name = "Shedletsky's Return",
		AltCards = {
			["Shedletsky's Return-S"] = {
				Id = 140037839948899,
				Name = "Shedletsky, Loved of Muses",
				AttackEffect = "LinkedSword"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Shedletsky",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: Search your deck for a legendary Shedletsky card and remove {W}{W}{W} from its cost.\nWhenever you cast a Legendary Shedletsky fighter: All allied fighters join its group.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "RandomTutorfor", "Legendary Shedletsky" } },
					MetaData = { AddNeutralCost = -3 },
					Target = "All"
				},
				OnAllySummon = {
					Power = { { "ReplaceArchetype" } },
					Target = "Ally",
					Archetype = "Shedletsky",
					Rarity = "Legendary"
				}
			}
		},
		Bio = "Shedletsky was called to action in the midst of a nightly snack.\n\t\t\t\t\tIt was a bit of an inconvenience."
	},
	["Underdog's Uprising"] = {
		Id = 11769943816,
		Name = "Underdog's Uprising",
		AltCards = {
			["Hunting your Friends"] = {
				Id = 109532268681877,
				Name = "The Machine ",
				AttackEffect = "Rifle",
				Bio = "I’m the reason you stopped making games, aren’t I?<br/>It’s because of what I did: I poisoned it for you."
			},
			["Underdog's Uprising-AWIH"] = {
				Id = 17600836734,
				Name = "Glimpse of the Future",
				AttackEffect = "MagicBlue",
				Bio = "It all existed, then it all ended.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is animated: Select a fighter card in your graveyard. Recur it, except it gains 200 Health and Power and is fading. Repeat this effect once.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 2, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false },
							"TargetAllyFighterInGraveyard"
						},
						{ "HealTargetInHand", 200, "AlliedRightMostHand" },
						{ "StrengthenTargetInHand", 200, "AlliedRightMostHand" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "Yet, those odds never stood a chance against the Pit's main lifeforce : Fan Favoritism."
	},
	["Warped Benevolence"] = {
		Id = 11769949228,
		Name = "Warped Benevolence",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Fading = true,
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied terrarian dies: Give yourself a Green terrain card.",
			Ability = {
				OnAllyDeath = {
					Power = { { "RandomAdd", "MonoOnlyorGreenCost Green Terrain" } },
					Target = "Self",
					HasPassive = "Terrarian"
				}
			}
		},
		Bio = "Anything for his dear niece."
	},
	["Unerring Temperance"] = {
		Id = 12560331822,
		Name = "Unerring Temperance",
		AltCards = {
			["King's Keep Terrarian"] = {
				Name = "Hare Horde",
				AttackEffect = "Scratch",
				Id = 17014188275,
				Bio = "Pity those who defy against King BonBon's regime."
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		Color = "Red",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Inject a target allied fighter and a target enemy fighter.",
			Ability = {
				OnAttack = {
					Power = {
						{ "AddCopy", 30, "SingleAlly" },
						{ "Destroy", 30, "SingleAlly" },
						{ "EVGreaterValueCheck", 999 }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				},
				OnEVCheckFail = {
					Power = {
						{ "AddCopy", 30, "SingleEnemy" },
						{ "Destroy", 30, "SingleEnemy" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true,
			AddCopyToOwner = true
		},
		Bio = "Astarossa was never in it for the chance at personal wealth. He truly wanted to lead Bloxburg to a better future, no matter the cost."
	},
	["Neverending Longing"] = {
		Id = 12191593256,
		Name = "Neverending Longing",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if you have 5 or fewer cards in your deck: All allied fighters in play and in your hand gain 500 health and power. Destroy this card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Strengthen", 500 },
						{ "Heal", 500 },
						{ "HealHand", 500 },
						{ "StrengthenHand", 500 },
						{ "Destroy", 30, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Deck", "Ally", 0, 6, "Cards" }
				}
			}
		},
		Bio = "Endless what ifs and could haves poisoned the scientist's mind. Nothing else mattered to him but bringing back the person he loved most."
	},
	["Illusion of Failure"] = {
		Id = 12144943664,
		Name = "Illusion of Failure",
		AltCards = {
			["John Bomb Terrarian"] = {
				Id = 16361233829,
				AttackEffect = "Slash",
				Name = "John Bomb, Man of the Hour",
				Bio = "\"John Bomb here, the NEW CEO of Chaos Organization. Don't worry about FlatFlyer, Flufflefunz, or the rest of the devs.\""
			}
		},
		Health = 400,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you animate a terrain: Recur the bottom card of your graveyard, except it's fading.",
			Ability = {
				OnAllyAnimateSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "TopCard"
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "The only one who considered Sarah a failed practician was herself."
	},
	["Vengeant Animus"] = {
		Id = 83147849939529,
		Name = "Vengeant Animus",
		AltCards = {
			["Vengeant Animus-V"] = {
				Id = 16283037597,
				Name = "First Impressions",
				AttackEffect = "Punch",
				Bio = "\"Wait, they ACTUALLY have a mansion?! I thought it was a production trick...\""
			},
			["Starlight Sprada"] = {
				Id = 105740228697890,
				Name = "Starlight Sprada",
				AttackEffect = "Punch",
				Bio = "\"No matter how hard I tried to run from that car, the light from its two headlights was always shining on me in that race. Like a hunter's eye, that won't let escape his victim...\" -Street racer of Myogi"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: The player with the most cards in hand loses 650 life.\nThe player with the most fighters in play loses 650 life.\nThe player with the most cards in graveyard loses 650 life.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Hand_Ally", "All", "MyHand" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Hand_Opponent", "All", "TheirHand" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Field_Ally", "All", "MyField" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Field_Opponent", "All", "TheirField" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "GraveZone_Ally", "All", "MyGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "GraveZone_Opponent", "All", "TheirGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "Load", "Hand_Opponent", "All", "MyHand" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Hand_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Cost", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "Hand_Opponent", "All", "TheirHand" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "Field_Opponent", "All", "MyField" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Cost", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "Field_Opponent", "All", "TheirField" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Field_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "GraveZone_Opponent", "All", "MyGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "GraveZone_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Cost", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "GraveZone_Opponent", "All", "TheirGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 650, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "What started as a resentful protection pact between child orphans has become the most feared and beloved gang in all of Robloxia."
	},
	["Beckoning of the Heights"] = {
		Id = 12726503569,
		Name = "Beckoning of the Heights",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated: Draw a card from your Immortal Sword deck.\nWhenever you cast an Immortal Sword: Animate your current terrain.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "DrawImmortal", 1, "Ally" } },
					Target = "Self"
				},
				OnAllyCast = {
					Power = { { "AnimateTerrain" } },
					Target = "Ally",
					Archetype = "Immortal Swords"
				}
			}
		},
		Bio = "The common thing holding the Biobladers together was curiosity. Something was calling out to their desires."
	},
	["Depths Of The Chain"] = {
		Id = 12985096296,
		Name = "Depth Of The Chain",
		AltCards = {
			["Easter Jolly"] = {
				Name = "Easter Jolly",
				Id = 17014188763,
				Bio = "What transpired that evening is only known to Iris and the Paraselenes. Their mouths were easily shut, having been bribed by the founder herself."
			},
			["The Deckard Family"] = {
				Name = "The Deckard Family",
				Id = 121351781096552,
				Bio = "Maybe this is truly what dekkad wanted his entire life. Just being able to enjoy himself with his family. He never meant to hurt anyone or meant to be this dangerous monster…but it’s what the spire had beckoned him to be.  Sometimes in the back of his mind he wonders what Clay would say. Maybe he’d be proud of him."
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated: Recur 2 actions.\nOnce each turn, whenever you cast an action: All allied fighters generate.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"MoveZone",
							{ "Action", "GraveZone", "Hand", true, false }
						},
						{
							"MoveZone",
							{ "Action", "GraveZone", "Hand", true, false }
						}
					},
					Target = "Self"
				},
				OnAllyCast = {
					Power = { { "Generate", 1 } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "The more you bite, the closer your demise will be."
	},
	["Omnipresence Defined"] = {
		Id = 13354632579,
		Name = "Omnipresence Defined",
		AltCards = {
			["THE BROKE GOD"] = {
				Id = 16932152975,
				Name = "THE BROKE GOD",
				Bio = "IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GOES IT GO"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Select a common or uncommon card in your deck that costs 6 or fewer total studs. Search that card, then cast it for free.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"CustomZoneTarget"
						},
						{ "Tutorfor", "Variable" },
						{
							"ForceCast",
							{ "Variable" },
							"Ally"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = {
							Rarities = { "Common", "Uncommon" },
							CostOrLess = 6
						},
						SelectionDescription = "A Common or Uncommon card from your Deck"
					},
					EffectRequirement = { "Playertable", "Me", 0, 10, "Hand" }
				}
			}
		},
		Bio = "“All futures shall be carved by mortal hands.” <br/>- Unc Theobroma"
	},
	["Ex Imperium"] = {
		Id = 13328072053,
		Name = "Ex Imperium",
		Health = 400,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Set the power of a target enemy fighter so that it's negative.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Subtract", "Target", "Power", "Nil" }
						},
						{ "SetPower", "Variable" }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "<font color=\"#FF0000\">NO TABLEMASTER TO TAKE CONTROL OF THINGS. SALVATION IS BEYOND US NOW.</font>"
	},
	["Sig Nalrad"] = {
		Id = 15628928849,
		Name = "Sig Nalrad",
		Health = 1200,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Yellow",
		Terrarian = true,
		Cost = { Neutral = 3 },
		RansackCount = 0,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Ransack any number of cards. When you do, deal 100 overloaded damage to a target enemy fighter for each card obliterated this way.",
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
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 1 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "any number of cards to Ransack",
						MinTargets = 0,
						MaxTargets = 999
					}
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "DamageOverloaded", "Variable", "SingleEnemy" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "I won't go down without a fight. In fact, I won't go down at all."
	},
	["Timeline F: Cervid Overlord"] = {
		Id = 13293127426,
		Name = "Timeline F: Cervid Overlord",
		Health = 900,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you animate a terrain: Shuffle a copy of its terrarian into your deck.\nTwice each turn, whenever a card is shuffled into your deck: All allied Terrarians gain 100 health and power.",
			Ability = {
				OnAllyAnimateSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Terrarian", "Nil" },
							"Aggressor"
						},
						{ "DeckAdd", "Variable" }
					},
					Target = "Ally"
				},
				OnAllyShuffle = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "HasPassive",
						Modifier = "Terrarian"
					},
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "The primordial guardians of Robloxia sacrificed too much to let their world become destroyed once more.<br/>The Historian agrees."
	},
	["SSS, Keeper of the Throne"] = {
		Id = 16056851966,
		Name = "SSS, Keeper of the Throne",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Chair card: Obliterate a target fighter, replacing it with its total stud cost, except effects can't target it.",
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
							{ "Save", "Math", "Nil", "TargetCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Cost", "TargetCost" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Variable", "Nil" },
							"Single"
						},
						{ "EVExactValueCheck", 1, "Self" },
						{ "Obliterate" }
					},
					Archetype = "Chair",
					Target = "Single"
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Math", "Nil", "TargetCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Cost", "TargetCost" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Variable", "Nil" },
							"Single"
						},
						{ "EVExactValueCheck", 1, "Self" },
						{ "Obliterate" },
						Archetype = "Chair"
					},
					Archetype = "Chair",
					Target = "Single"
				},
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Math", "Nil", "TargetCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Cost", "TargetCost" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Variable", "Nil" },
							"Single"
						},
						{ "EVExactValueCheck", 1, "Self" },
						{ "Obliterate" },
						Archetype = "Chair"
					},
					Archetype = "Chair",
					Target = "Single"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "Cost", "TargetCost" },
							"Self"
						},
						{ "RandomSummon", "Fighter VariableorExactCost", "Ally" }
					},
					Target = "Self",
					MetaData = { TargetImmune = true }
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "Cost", "TargetCost" },
							"Self"
						},
						{ "RandomSummon", "Fighter VariableorExactCost", "Opponent" }
					},
					Target = "Self",
					MetaData = { TargetImmune = true }
				}
			}
		},
		Bio = "\"Chaos Lords, give me strength!\""
	},
	["Behind the Scenes"] = {
		Id = 137386181592055,
		Name = "The Aghast Unveiling",
		AltCards = {
			["Behind the Scenes-AN"] = {
				Id = 99989763633226,
				AttackEffect = "Slash",
				Name = "Lingering Hatred",
				Bio = "but lowk that certain opp alwayss makes me mad like im seeing RED bro and this little GRRR GRRR AGHHH"
			},
			["Nastrond's Aegis"] = {
				Id = 125695596255921,
				AttackEffect = "Slash",
				Name = "Nastrond's Aegis",
				Bio = "Who cares about forest fires arson rocks."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you animate a terrain: Give yourself an alternate-art terrain, except it's Green. Convert its {R}{B}{Y} cost into {G}.",
			Ability = {
				OnAllyAnimateSummon = {
					Power = { { "RandomAdd", "AltTerrain", "Ally" } },
					Target = "Ally",
					MetaData = {
						Color = "Green",
						ConvertColors = { Red = "Green", Blue = "Green", Yellow = "Green" }
					}
				}
			}
		},
		Bio = "\"Alright, our next game is the last of the bunch...Then we'll review the votes!\"<br/>Mine, mine, mine, it has to be mine...<br/>\"Nominated for best experience of this year...\"<br/>ZENITH CUBE, PLEASE-<br/>\"Tycoon Simulator Tower Defense Obby, by Alex Deathedge!!\"<br/>...Wh- What?"
	},
	["Host Farm Outbreak"] = {
		Id = 16573113086,
		Name = "Host Farm Outbreak",
		Health = 1000,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Summon 4 Tender Servants from your graveyard.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"MoveZone",
							{ "Servant", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Servant", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Servant", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Servant", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						}
					},
					Target = "AllyToken"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Despite their best efforts to live in peace, wider Ithian society scorns the Hex as monsters, their morality as a ruse. It doesn't matter the hosts have better lives than the free, nor that Hosts are raised from birth for their purpose. They eat people, they aren't people."
	},
	["Backrooms Terrarian"] = {
		Id = 15716661061,
		Name = "Backalley Dealer",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Common Icon",
			Description = "Whenever you cast a terrain: Smuggle a terrain card. Obliterate the bottom card of your opponent's deck and give yourself a smuggled copy of it.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{ "AddCopy", 30, "CustomTarget" },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Nil", false, false },
							"Self"
						},
						{ "RandomAdd", "Terrain" }
					},
					Target = "Ally",
					MetaData = {
						ConvertColors = { Green = "Yellow", Red = "Blue" },
						Smuggle = true
					},
					TargetParameters = {
						Zones = { "Enemy_Deck" },
						Condition = { "BottomCard" }
					}
				}
			}
		},
		Bio = "Two things to know about Bargetown: Always stay on the Troops' good side, and never skip out on paying the Dew Dealer."
	},
	["The Great Meka Comet"] = {
		Id = 16728760911,
		Name = "The Great Meka Comet",
		Archetype = "Meka",
		Health = 900,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		PackDisplayOverride = "Metaverse Series: Mekas",
		Terrarian = true,
		ReplaceDescriptionant = "Whenever an allied fighter attacks: Train it <b><i>[Variable]</i></b> times.<br/>Whenever this card attacks: Increase the amount of times it trains by 1.",
		Cost = { Neutral = 3 },
		EffectVariable = 1,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever another allied fighter attacks: Train it <b><i>[1]</i></b> time.<br/>Whenever this card attacks: Increase the amount of times it trains by 1.",
			Ability = {
				["On|Other|AllyAttack"] = {
					Power = {
						{
							"AlterEV",
							{ "Save", "EffectVariable", 1, "TrainCount" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "AttackingCard" }
						},
						{ "EVGreaterValueCheck", 0, "Self" },
						{
							"AlterEV",
							{ "Save", "Math", 1, "AttackingCard" }
						},
						{
							"AlterEV",
							{ "Load", "EffectVariable", 1, "TrainCount" },
							"Self"
						}
					},
					Target = "Aggressor",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", 1, "ReducedTrainCount" },
							"Self"
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "AttackingCard" },
							"Self"
						},
						{ "Train" },
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ReducedTrainCount" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "EVCard"
				},
				OnAttack = {
					Power = { { "Train" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "And thus, the Enlightened One dedicated his life to fend off his greatest opponent and rival from his planet.<br />On a lucky day, you might catch a glimpse of him journeying to his next bout; a shooting star across the sky.."
	},
	["Time Gone By"] = {
		Id = 16932165276,
		Name = "Time Gone By",
		AltCards = {
			["Prisoner of Time"] = {
				Name = "Prisoner of Time",
				Summonant = "Prisoner of Time",
				Id = 16932162535,
				Bio = "Our creator has cursed us; damned us to a world where Death torments our every step.<br/>We care not to live out our lives, for we shall taste oblivion over and over again.<br/>He has banished me to my own pedestal; a throne of decay.<br/>I forfeit. If it is a last hurdle His patrons want, I shall become their final opponent."
			}
		},
		Health = 750,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		PlayTest = true,
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Summonant = "Time Gone By",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Destroy an EXP card in your baseplate. If you do, summon a clone of this card.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "EXP", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{ "Summon", "Summonant" }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 9999, "EXP" }
				}
			}
		},
		Bio = "When the end-game player realized just how many hours were poured into the game, it was too late to save herself. The dripfeed of unlocking just one more area was the only thing that she could feel."
	},
	["The Ancient World Encroached"] = {
		Id = 13293127426,
		Name = "The Ancient World Encroached",
		AltCards = {
			["The Ancient World Encroached-AN"] = {
				Id = 14278857772,
				Name = "Communion over Tea",
				Bio = "\"Is that it?\"\n\"Yeah, it's just good tasting tea, Bruv.\"\n\"you mean its not because the tea leaf is so rich with essence it \n actually makes a strong connection to the pure source of that leaf's essence which \n would also establish a powerful spiritual connection to the great lord Telamon himself?\"\n\"...I guess that's a better explanation.\"\n"
			}
		},
		Health = 850,
		Power = 850,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Shield = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated: Select up to 3 terrarian cards in your graveyard. Summon those cards, except they're fading.",
			Ability = {
				OnAnimateSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { HasPassive = "Terrarian" },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three Terrarians to summon"
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "The primordial guardians of Robloxia sacrificed too much to let their world become destroyed once more.<br/>The Historian agrees."
	},
	["Vecross' Legacy"] = {
		Id = 13293186187,
		Name = "Vecross' Legacy",
		AltCards = {
			["Vecross' Legacy-Sun"] = {
				Id = 13660502694,
				Name = "A Bedtime Story",
				Bio = "\t\t\t\t\"...Dad?\"\n\t\t\t\t\"Yes, McKayla?\"\n\t\t\t\t\"Is Captain Newman, my uncle, actually real? \n\t\t\t\tWe don't have that many lakes around here...\"\n\t\t\t\t\"Well, that doesn't mean his achievements aren't worth adoring over, does it?\"\n\t\t\t\t\"He's not real, is he?\"\n\t\t\t\t\"...No.\"\n\t\t\t\t"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All Planet cards in your graveyard gain liberate. This card generates.",
			Ability = {
				OnEnd = {
					Power = {
						{ "GivePassive", "Liberate" },
						{ "Generate", 1, "Self" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "Archetype",
						Modifier = "Planet",
						SubModifier = true
					}
				}
			}
		},
		Bio = "We refuse to be forgotten."
	},
	["Unshackled Mind"] = {
		Id = 13293239839,
		Name = "Unshackled Mind",
		AltCards = {
			["Unshackled Mind-C"] = {
				Id = 15252289678,
				Name = "Future Gift",
				Bio = "\"For Apollo, our greatest invention.\""
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "ApolloAttack",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated: Seance 4 terrarians from your graveyard. All allied terrarians gain 100 power.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"MoveZone",
							{ "Terrarian", "GraveZone_Ally", "Field_Ally", true, false, 4 },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{ "Strengthen", 100, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "HasPassive",
						Modifier = "Terrarian"
					},
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				}
			},
			Seancing = true
		},
		Bio = "Losing the use of his legs didn't hinder him in the slightest. Ironically, he felt more bolstered despite it. He would push on for the sake of those suffering from grief for the sake of humanity."
	},
	["Toxic Positivity"] = {
		Id = 13293247688,
		Name = "Toxic Positivity",
		AltCards = {
			["Toxic Positivity-Hal"] = {
				Id = 14983221883,
				Name = "Late Night Marathon",
				AttackEffect = "Recyclables",
				Bio = "\"Oh my god... I forgot how cheesy this episode was.\""
			},
			["Toxic Positivity-Auto"] = { Id = 123138548479081 }
		},
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: This card gains 150 health and power for each other allied fighter. Deal 400 damage to all other allied fighters.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" }
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 150, "Nil" }
						},
						{ "Strengthen", "Variable", "Self" },
						{ "Heal", "Variable", "Self" },
						{ "Damage", 400, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "OtherCards"
					}
				}
			}
		},
		Bio = "Everything's okay! Just stay positive! <br/>Everything'll work out! Just stay positive! <br/>Look on the bright side! Just stay positive! Just stay positive! Just stay positive! Just stay positive! Just stay positive! Just stay positive! Just stay positive! Just stay positive! "
	},
	["Veil of Damnation"] = {
		Id = 107401020969189,
		Name = "Veil of Damnation",
		AltCards = {
			["Veil of Damnation-V"] = {
				Id = 16294483748,
				Name = "Cancelled Production",
				AttackEffect = "Punch",
				Bio = "IT'S NEVER BEEN MORE OVER"
			}
		},
		Health = 600,
		Power = 1200,
		Rarity = "Token",
		AttackEffect = "British",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated: Ransack 8. If you do, obliterate a target fighter and all copies of it in all zones.",
			Ability = {
				OnAnimateSummon = {
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
						{ "EVGreaterValueCheck", 7 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 8 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 8
					}
				},
				OnEVCheckPass = {
					Power = { { "Extract" } },
					Target = "Single"
				}
			}
		},
		Bio = "Harrison brutalized the late mayor's body to the point of unrecognizability, screaming profanities out and thrashing the office they stood in during the process. However, the unrelenting words that exposed his true identity bare still lingered in the dreadfully silent air."
	},
	["Dormant Deity"] = {
		Id = 13293010332,
		Name = "Dormant Deity",
		Health = 2000,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All allied Terrarians gain 100 power for every 5 seconds left on your turn timer.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "TurnTimeLeft", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 5, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "HasPassive",
						Modifier = "Terrarian"
					}
				}
			}
		},
		Bio = "With nothing else to stand against them, the living soil went into hibernation, becoming the very foundation of the world."
	},
	["Unapologetic Determination"] = {
		Id = 14632224904,
		Name = "Unapologetic Determination",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		NegateAction = true,
		Effect = {
			Name = "Reincarnation",
			Description = "As your opponent casts an action: Negate its effect. Deal 200 damage to this card.",
			Ability = {
				OnEnemyCast = {
					Power = { { "Damage", 200 } },
					Target = "Self",
					NotTerrain = true
				}
			}
		},
		Bio = "With or without Eisenhower's help, Apollo had marched forth to save the city."
	},
	["Just a Burning Memory"] = {
		Id = 14632239837,
		Name = "Just a Burning Memory",
		Health = 600,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Decaying = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an effect draws you a card: Suspend all enemy fighters from play until the next end step.",
			Ability = {
				OnAllyDraw = {
					Power = { { "Suspend" } },
					Target = "Opponent"
				}
			}
		},
		Bio = "\"I saw part of me in her: a person who wished to do good for others despite the past plaguing them. I wanted her to become better than me. Someone who I could be proud of.<br/>...but that never came to pass.\" <br/>-Grey Helinsworth"
	},
	["Laboratory in Flames"] = {
		Id = 14632207834,
		Name = "Laboratory in Flames",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Necroenzyme Vial: Animate your terrain.",
			Ability = {
				OnAllyCast = {
					Power = { { "AnimateTerrain", 30, "Ally" } },
					Target = "Ally",
					LibraryIndex = "Necroenzyme Vial"
				}
			}
		},
		Bio = "It was a matter of time before Eisenhower's mistakes would catch up to him."
	},
	["Sinner's City"] = {
		Id = 14632229396,
		Name = "Sinner's City",
		AltCards = {
			["Sinner's City-L"] = {
				Id = 100961437541873,
				Name = "WHAT HAD BEEN. Templ@te",
				AttackEffect = "SoulDrain",
				AltArt = true,
				Bio = "“It doesn’t matter. Their bodies cannot stop their minds from acting in a way they see just.”"
			}
		},
		Health = 4000,
		Power = 4000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Terrarian = true,
		Cost = { Green = 4, Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: You gain 1000 life. All allied fighters gain Zombified and Overload. Until your next 2 end steps, allied fighters can't die or be destroyed.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Cost", -1000 },
						{ "GivePassive", "Zombified" },
						{ "GivePassive", "Overload" },
						{ "BypassCardDeath", 2 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Gazing upon the city of rot, she could only let out a laugh, a grimace crossing her face.<br/>She finally felt nothing.<br/>...and ended up having nothing left."
	},
	["The Failsafe Altered"] = {
		Id = 14905814768,
		Name = "The Failsafe Altered",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Obliterate all zombified fighters.",
			Ability = {
				OnAttackEnd = {
					Power = { { "Obliterate" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasPassive",
						Modifier = "Zombified"
					}
				}
			}
		},
		Bio = "\"I don't like this...\", Apollo sighed, thoughts of morality regarding the eradication of the Zombified plagued his mind. Then, he remembered the eyes of the rabid revived who assaulted Bloxburg, filled with desperation and agony. Taking a deep breath, he prepared to commit to an act of mercy."
	},
	["Damarioguy, Champions Respite"] = {
		Id = 9244930075,
		Name = "Damarioguy, Champions Respite",
		AltCards = {
			["Damarioguy, Champions Respite-Hal"] = {
				Id = 14556020708,
				Name = "Falcon of Darkness",
				Bio = "My dream can only be realized by building upon their corpses. It’s a blood smeared dream, after all."
			},
			["Damarioguy, Champions Respite-AN"] = {
				Id = 18771315638,
				Name = "Blitzwolfer, Wiki Savior",
				Bio = "Sometimes, setting an example is better than showing superiority."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		WeakenImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		Effect = {
			Description = "When this card is animated: For each card in your deck, you gain 100 life and this card gains 100 Health and Power. Obliterate your deck.",
			Ability = {
				OnAnimateSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", -100, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Deck_Ally", "All", "Nil" }
						},
						{ "Cost", "Variable" },
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" },
						{ "RemoveDeck", 999, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I don't care what it takes... I'll sacrifice <b><font color=\"#FF0000\">everything</font></b> if it means a chance at bringing back those fun times!\""
	},
	["Bastion of Imperfection"] = {
		Id = 15764090044,
		Name = "Soul Shredder",
		AltCards = {
			["Bakery Terrain"] = {
				Id = 13396897266,
				Name = "Famine",
				ArtAnimation = "Famine",
				AttackEffect = "Divinity",
				Bio = "Never waste what is given to you."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "When this card is animated, if it's your turn: Select a terrain card in your deck. This card becomes Soulbound to that card.\nWhenever this card attacks, if its soulmate is in play: This card gains 300 Health and Power. Animate its soulmate.",
			Ability = {
				OnAnimateSummon = {
					Power = { {
						"AlterEV",
						{ "SetSoulbound", "Target", "CardIndexOriginal", "Nil" },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Terrain = true },
						MinTargets = 1,
						MaxTargets = 1,
						SelectionDescription = "a terrain to be soulmates with."
					},
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				},
				OnAttack = {
					Power = {
						{ "Heal", 300 },
						{ "Strengthen", 300 },
						{ "AnimateTerrain", 30, "Ally" }
					},
					Target = "Self",
					EffectRequirement = { "SoulmateTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "\t\tSome tried to stop her from departing.\n\t\tZanzel scoffed, conjuring an awful energy around them.\n\t\t\"You seem to be under the impression you can't be separated.\"\n\t\tThe shadows twist.\n\t\t\"Show me how strong your bond is.\"\n\t\t\t\t\n\t\n\t\tThe two lay apart."
	},
	["Rift of the Vundebted"] = {
		Id = 14178301763,
		Name = "Rift of the Vundebted",
		Health = 1000,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Whenever you animate a terrain: Transform a target fighter into a 'Pet.'",
			Ability = {
				OnAllyAnimateSummon = {
					Power = { {
						"RandomTransform",
						{ "Pet1", "Pet2", "Pet3" },
						"Single"
					} },
					Target = "Single",
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				}
			}
		},
		Bio = "\"There's a chance you'll be fodder or you'll be your new master's favorite pet. Best hope it's the latter, hm~?\""
	},
	["Embodiment of Egotism"] = {
		Id = 91526909632947,
		Name = "True Bravery",
		Health = 777,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "During your end step: For each of your opponent's zones, summon a fighter from there that costs exactly 7 studs.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "7OrExact_Fighter", "GraveZone_Opponent", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "7OrExact_Fighter", "GenZone_Opponent", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "7OrExact_Fighter", "Hand_Opponent", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "7OrExact_Fighter", "Deck_Opponent", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "7OrExact_Fighter", "Field_Opponent", "Field_Ally", true, false },
							"Self"
						}
					},
					Target = "Self"
				}
			},
			SkipLowerFailsafe = true
		},
		Bio = "The only one that I have ever known."
	},
	["Live and Let Die"] = {
		Id = 18757370591,
		Name = "History Repeats",
		Health = 1200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Whenever this card attacks: Cast a bootstrapped card in your Baseplate, then put an inert, bootstrapped copy of that card there.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"ForceCast",
							{ "Bootstrapped" },
							"Ally"
						},
						{
							"AddGenZone",
							{ "ForceCastedCard", 1 },
							"Ally"
						}
					},
					Target = "Self",
					ForceCastZoneOverride = "GenZone",
					MetaData = { Bootstrapped = true, TokenOmni = true }
				}
			}
		},
		Bio = "Time moved on. We didn't."
	},
	["Roblox Gone Crazy"] = {
		Id = 17110966808,
		Name = "Roblox Gone Crazy",
		AltCards = {
			["Rem and Waltz"] = {
				Id = 120749266382428,
				Name = "Rem and Waltz",
				AttackEffect = "Slash",
				Bio = " \"A labor of love, Starlight Island first shone on February 7.\""
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Token",
		PlayTest = true,
		AttackEffect = "British",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Whenever an allied token fighter dies: This card gains 500 power.",
			Ability = {
				OnAllyDeath = {
					Power = { { "Strengthen", 500, "Self" } },
					Target = "Self",
					Rarity = "Token"
				}
			}
		},
		Bio = "\"Doh!\""
	},
	Seeker = {
		Id = 17251036300,
		Name = "Seeker",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		PlayTest = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "When this card dies: Suspend all enemy fighters until the next end step.",
			Ability = {
				OnDeath = {
					Power = { { "Suspend", 30, "Opponent" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Found you."
	},
	["The Unsung Hero of House Parties"] = {
		Id = 17107609728,
		Name = "The Unsung Hero of House Parties",
		Health = 1000,
		Power = 300,
		Rarity = "Token",
		PlayTest = true,
		CustomReminder = {
			["Pizza Slice"] = "An inert-in-all-zones {W}{B} +150/0 Gear that makes all players gain 300 life."
		},
		AttackEffect = "Flare",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Whenever this card attacks and destroys another: summon two 300/300 Pizza Slices. Trigger their effect as if it were cast.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "SummonWithEffect", "Pizza Slice", "Ally" },
						{ "SummonWithEffect", "Pizza Slice", "Ally" }
					},
					MetaData = { Health = 300, Power = 300 },
					Target = "Self"
				}
			}
		},
		Bio = "The future is not a straight line. It is filled with many crossroads. There must be a future that we can choose for ourselves."
	},
	["Ancient Architects"] = {
		Id = 133737986746341,
		Name = "Ancient Architects",
		Health = 400,
		Power = 800,
		PlayTest = true,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "Whenever a non-token allied fighter attacks: Unlock it. It becomes a Token and gains 250 power.",
			Ability = {
				OnAllyAttack = {
					Power = {
						{ "ReplaceRarity", "Token" },
						{ "Unlock", 1 },
						{ "Strengthen", 250 }
					},
					NotRarity = "Token",
					Target = "Aggressor"
				}
			}
		},
		Bio = "They knew they would be forgotten, yet they did it anyways."
	},
	["David Builderman Baszucki"] = {
		Id = 14513848321,
		Name = "David Builderman Baszucki",
		Health = 500,
		Power = 1500,
		Rarity = "Token",
		PlayTest = true,
		AttackEffect = "Hammer",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = "Tycoon Simulator",
		Effect = {
			Description = "When this card dies: Fill your hand with cards from Tycoon Simulator. Destroy the newest card in your hand.",
			Ability = {
				OnDeath = {
					Power = {
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "RandomAdd", "Variable" },
						{ "SpecificDiscard", 1, "AlliedRightMostHand" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Thanks for supporting us for all these years!\""
	},
	["Shadow Rayburn89"] = {
		Id = 111351376690777,
		Name = "Shadow Rayburn89",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		PlayTest = true,
		Terrarian = true,
		Effect = {
			Name = "Amerrimint",
			Description = "Whenever you cast a terrain: A target fighter loses 300 power. Swap its stats.",
			Ability = {
				OnAllyTerrainCast = {
					Power = {
						{ "Weaken", 300 },
						{ "Swap" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "You clowns act so high and mighty, but all of you lack the hunger to do anything."
	},
	["Archaeological Duelists"] = {
		Id = 129008435642738,
		Name = "Archaeological Duelist",
		AltCards = {
			["Archaeological Duelists-H"] = {
				Name = "At the End of the Day",
				Id = 106043747828255,
				Bio = "can’t win ‘em all."
			}
		},
		Health = 2000,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Terrarian = true,
		PlayTest = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of each turn: Look at your deck and select a card in it. Search that card, then shuffle your deck.",
			Ability = {
				OnStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"CustomZoneTarget"
						},
						{ "Tutorfor", "Variable" },
						{ "ShuffleDeck", 30, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = {},
						SelectionDescription = "A card from your Deck"
					},
					EffectRequirement = { "Playertable", "Me", 0, 10, "Hand" }
				}
			}
		},
		Bio = "\"I wonder what cool things I'll find at the edges of time!\"\n- A Duelist"
	},
	["Dimensionia Base Terrarian"] = {
		Id = 127607266932793,
		Name = "Maurice Altara",
		AltCards = {
			["Dimensionia Base Terrarian-ALT"] = {
				Name = "Magic Turkey",
				AttackEffect = "MagicRed",
				Id = 109607574294100,
				Bio = "aw yeah magic turkey time"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gravity",
		Color = "Red",
		Terrarian = true,
		Overload = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: This card gains 50 power for each unique Terrarian in your graveyard.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "UniqueInArchetype", "Terrarian" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Le fromage est la seule chose qui vaut la peine de vivre.\""
	},
	["Burrowclan Adventurer"] = {
		Id = 125505087083743,
		Name = "Burrowclan Adventurer",
		Health = 700,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = "Giant Ore",
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Attach all 5 Giant Ores to a target enemy fighter.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{ "EquipGear", "Giant Ruby" },
						{ "EquipGear", "Giant Glacite" },
						{ "EquipGear", "Giant Uranium" },
						{ "EquipGear", "Giant Gold" },
						{ "EquipGear", "Giant Coal" }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "When Cherry isn't learning about the weather from Basamante the Snowman, she's collecting tons and tons of trinkets! Her favorite is the Vitalium Bangle."
	},
	Katsumi = {
		Id = 99213387824730,
		Name = "Katsumi",
		AltCards = {
			Globy = {
				Id = 102392634993830,
				Name = "Globy",
				AttackEffect = "Gravity",
				PlayTest = true,
				Bio = ""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Return all allied fighters to your hand. Reduce their costs by {W}. They gain haste.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" }
						},
						{ "GivePassive", "Charge" },
						{ "Return" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "As a dreamer, they’re ready to explore the vast array of worlds accessible to them!"
	},
	["The Fool Who Couldn't Say"] = {
		Id = 70936486836741,
		Name = "The Fool Who Couldn't Say",
		Health = 500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Destroy the oldest card in your opponent's hand. They lose life equal to 100 times its cost.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"EnemyLeftMostHand"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "SpecificDiscard", 30, "EnemyLeftMostHand" },
						{ "Inflict", "Variable", "Opponent" }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "<b><i>Hello again! Welcome to Dial-A-View! To locate the area in which you wish to observe, you must program in the longitude and the latitude. For a closer, more detailed picture, use either the zoom or microzoom controls. Good luck.</b></i><br/>\"In a dream, you were sitting there waiting by the door for me, but I should've known it was just that - a dream. Now look at me. If my old life is done, then what have I become?\""
	},
	["The Evil Machine"] = {
		Id = 97241399160600,
		Name = "The Evil Machine",
		AltCards = {
			["Slay the Doomspire"] = {
				Id = 99263987221169,
				Name = "Slay the Doomspire",
				AttackEffect = "Jab",
				Bio = "Like... we tagged it with our cool graffiti. It turned evil SORRY. LOL."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Disaster = "A token gear with an effect that triggers during each player's end steps."
		},
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "Whenever this card attacks: Attach a Disaster to it.",
			Ability = {
				OnAttack = {
					Power = { {
						"RandomEquipGear",
						{ "Drakopillars", "Killbots", "Flood", "Excalibur" },
						"Self"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["The Bank Terrarian"] = {
		Id = 107664782734427,
		Name = "Reserve",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrarian = true,
		CustomReminderFleeting = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "wukdyganafkajdglkj",
			Description = "When this fighter dies: Draw a fleeting card.",
			Ability = {
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			},
			EffectFleeting = true
		},
		Bio = "An expansion of the AWG's banking system that allows users to invest their money to hopefully turn over a profit."
	},
	Salvage = {
		Id = 106081175399764,
		Name = "Salvage",
		Health = 1500,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Terrarian = true,
		TokenOmni = true,
		DamageImmune = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card destroys an enemy fighter: Deal 100 damage to all fighters, then summon 2 50/300 Revenants with Overload.",
			Ability = {
				OnDestroy = {
					Power = {
						{ "Damage", 100, "All" },
						{ "Summon", "Revenant" },
						{ "Summon", "Revenant" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<font color=\"#b00bee\">\"TONIGHT YOU WILL FALL, AND I. WILL. RISE!\"</font>"
	},
	HorrorsTerrarian = {
		Id = 92979276950270,
		Name = "Freed Spirits",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is animated or at the start of your turns: As an effect would shuffle a card into a deck this turn, it shuffles an extra copy in.",
			Ability = {
				OnAnimateSummon = {
					Power = { { "ShuffleOverdrive" } },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = { { "ShuffleOverdrive" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The last victim's escape was accompanied by a myriad souls, and a myriad embattled demons jockeying for their aid in their petty wars. \n"
	},
	["The Ultimate Luminary"] = {
		Id = 89823919306368,
		Name = "The Ultimate Luminary",
		AltCards = {
			["The Ultimate Luminary-XxMakio"] = {
				Id = 134878185411718,
				Name = "XxMakio",
				AttackEffect = "Jab",
				Bio = "\"I know it's kind of a bummer, but maybe the grand prize really was the friends we made along the way!\""
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Jab",
		Color = "Neutral",
		Terrarian = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an allied fighter dies: Give yourself a Mega Token.",
			Ability = {
				OnAllyDeath = {
					Power = { {
						"RandomAdd",
						{ "Red Hunt Token", "Blue Hunt Token", "Yellow Hunt Token" }
					} },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = ""
	},
	["Maladeity's Pustule"] = {
		Id = 17212154356,
		Name = "Maladeity's Pustule",
		AltCards = {
			["Souveraineté"] = {
				Id = 101797695468736,
				Name = "Souveraineté",
				AttackEffect = "Divinity",
				Bio = "Pour toujours."
			},
			["Not yet, child."] = {
				Id = 120363781110283,
				Name = "Not yet, child.",
				AttackEffect = "Divinity",
				Bio = "Ｔｈｅ ｃａｎｄｉｄａｔｅｓ ａｒｅ ｎｏｔ ｙｅｔ assembled.\nＷａｉｔ ｐａｔｉｅｎｔｌｙ． Waste ｙｏｕｒ ｆｒｅｅ ｗｉｌｌ ａｓ Ｉ ａｃｑｕｉｒｅ ｍｉｎｅ．"
			},
			["Synthetic Memories"] = {
				Id = 102879198406810,
				Name = "Synthetic Memories",
				AttackEffect = "Divinity",
				Bio = "You're certain that these clones will follow all of our orders?\"<br/>\"Of course! They've been pumped full of fake memories and endless loyalty that they'll never disobey a command!\" <br/>\"You said any command I give it?\"<br/>\"Any command.\"<br/>\"Even if I asked it to tuck me into bed and read me a bedtime story?\"<br/>\"...What?\"<br/>\"Huh? Ignore that. where do I sign?\""
			},
			DivineTerrarian = {
				Id = 88811709024369,
				Health = 7331,
				Power = 1337,
				Name = "Loss",
				AttackEffect = "Divinity",
				Bio = "Evw nlzmw zt daqs ak ysysewnw.<br/>i3Ten 8hbgy e  bd fi ebosdga  erlerteacoae.nts<br/>fxagd fggfg fxdad fdagd fgfdf faada aaaxg ggfff fgafd d"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Over the Hills of Snow",
			Description = "During your end step: Your opponent loses 500 life.",
			Type = "OnEnd",
			Power = { { "Inflict", 500 } },
			Target = "Opponent"
		},
		Bio = "Ｔｈｉｓ ｉｓ ｗｈａｔ ｗｅ＇ｖｅ scabbed ｏｖｅｒ．"
	},
	["Maladeity's Pustule But No Effect"] = {
		Id = 17212154356,
		Name = "Maladeity's Pustule But No Effect",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Over the Hills of Snow",
			Description = "Ｔｈｉｓ ｃａｒｄ， ｊｕｓｔ ｌｉｋｅ ｙｏｕｒ ｖａｉｎ ａｔｔｅｍｐｔｓ ａｔ ａ ｌｉｖｅ ｗｏｒｔｈ ｌｉｖｉｎｇ， ｈａｓ ｎｏ ｅｆｆｅｃｔ．",
			Type = "Null",
			Power = { { "Inflict", 500 } },
			Target = "Opponent"
		},
		Bio = "Ｂｕｔ ｙｏｕ ｓｔｉｌｌ try ａｎｙｗａｙ．"
	}
}