



return {
	FuryBlocks = {
		Id = 5485457577,
		Name = "FuryBlocks",
		AltCards = {
			["Ravcade-FuryBlocks"] = {
				Id = 10280875282,
				AttackEffect = "Recyclables",
				Bio = "Look at this cute blocky boi... but still, don't touch his bucket at all."
			}
		},
		Health = 450,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Dextrous = true,
		Effect = {
			Name = "Conflux",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Don't touch his bucket at all."
	},
	["Ancalagon, Sword Critic"] = {
		Id = 10243059135,
		Name = "Ancalagon, Sword Critic",
		AltCards = {
			["Ancalagon, Sword Critic-E-Offer"] = {
				Name = "Roger",
				Id = 16446071757,
				Bio = "\"Bark!\" (My master is a revered veteran of the Demon Wars. I shall not let you lupins tarnish his grounds!!!)<br/>-Roger, Dog of Old MacDonald"
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4, Yellow = 1, Green = 1 },
		Effect = {
			Name = "Anti Extreme Energy Care Package",
			Description = "When this card is cast: Set the stats of all enemy fighters to 500/500.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 500 },
				{ "SetPower", 500 }
			},
			Target = "Opponent"
		},
		Bio = "He appraises blades so you don't have to."
	},
	Tarfful = {
		Id = 10184818780,
		Name = "Tarfful",
		AltCards = {
			["Tarfful-Sun"] = {
				Id = 9150928649,
				Addant = "Rubber Duck",
				AttackEffect = "Knife",
				Bio = "Not so lucky now, 'ey?"
			},
			["Doomed Confidants"] = {
				Id = 11770007859,
				Name = "Doomed Confidants",
				AltArt = true,
				AttackEffect = "Jab",
				Addant = "Pyrrhic Realization",
				Bio = "<i>\"Do I take you by the hand?\"</i>"
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		CustomReminder = { ["Rubber Duck"] = "A useless card, fit only for discarding." },
		Cost = { Yellow = 4 },
		Addant = "Rubber Duck",
		Effect = {
			Name = "Revival",
			Description = "Whenever an effect draws your opponent a card: Give all players a Rubber Duck.",
			Type = "OnEnemyDraw",
			Power = {
				{ "Add", "Addant", "Opponent" },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "If he stops eating, he'll die. Won't we all?"
	},
	GamesBloxx = {
		Id = 4918928120,
		Name = "GamesBloxx",
		AltCards = {
			["Fallen Form Falltz"] = {
				Id = 139872964517249,
				Name = "フォルツ",
				Commissioner = { 14640960 },
				AltArt = true,
				AttackEffect = "Laser",
				Bio = "\"Feel a nuclear brainwash seepin' in my speech.\""
			},
			["GamesBloxx-Hal"] = {
				Id = 14555948104,
				Name = "Zombie Horde",
				AttackEffect = "Bite",
				Bio = "The zombies, are coming."
			},
			["PRT and GST, Deck Reviewers"] = {
				Id = 16738205054,
				Name = "PRT and GST, Deck Reviewers",
				PremiumArt = 234,
				AltArt = true,
				Bio = "\"gst wake up i almost won a tournament and got an alt art??? i didn't even know they gave this out until the final round???\""
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Uncommon",
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
	LeTruth = {
		Id = 9964825305,
		Name = "LeTruth",
		AltCards = {
			["LeTruth-E"] = {
				Name = "Racin' Egg",
				AttackEffect = "Flare",
				Id = 9964826437,
				Bio = "Egg's are actually one of the most aerodynamic shapes out there, the more you know!"
			}
		},
		Health = 400,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 3 },
		Charge = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever your opponent loses life: This card gains 250 power.",
			Type = "OnEnemyHealthLoss",
			Power = { { "Strengthen", 250 } },
			Target = "Self",
			TurnTriggerLimit = 2
		},
		Bio = "To know something requires three things. It must be true, must know why it's true, and you must believe it's true."
	},
	Beyondthegong = {
		Id = 9965493111,
		Name = "Beyondthegong",
		AltCards = {
			AstralSas = {
				Id = 9964717406,
				Name = "AstralSas",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Astral is a normal, yet very sadistic person. Beware of her attacks."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "Nerve Buster",
			Description = "Whenever your opponent loses life: This card gains 100 health and power.",
			Type = "OnEnemyHealthLoss",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Self"
		},
		Bio = "Helmsmasher in one timeline. Bellstriker in another."
	},
	DrWeaseI = {
		Id = 17791604926,
		Name = "Damire, Demon Vampire",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Double Bleeding",
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
		Bio = "He won't stop until his thirst for blood is quenched."
	},
	pa00 = {
		Id = 5022293411,
		Name = "pa00",
		AltCards = {
			Trimez2 = {
				Id = 89275777024730,
				Name = "Trimez",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 520,
				Summonant = "Trimez Token 1",
				Bio = "Whoops! Did I trip on your hopes? My bad."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		Summonant = "pa00 Token 1",
		Effect = {
			Name = "CBT isn't that bad Vis",
			Description = "2 Charges.\nWhen this card dies: Spend a charge and summon a copy of it.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "Come over here and get me."
	},
	["pa00 Token 1"] = {
		Id = 5022294058,
		Name = "pa00",
		AltCards = {
			["Trimez Token 1"] = {
				Id = 88340993621583,
				Name = "Trimez",
				AttackEffect = "Jab",
				Summonant = "Trimez Token 2",
				Bio = "Whoops! Did I trip on your hopes? My bad."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		Summonant = "pa00 Token 2",
		Effect = {
			Name = "I mean provided your partner doesn't go too far, it's just generic submission",
			Description = "1 Charge.\nWhen this card dies: Spend a charge and summon a copy of it.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "That one was fake; I'm actually over here!"
	},
	["pa00 Token 2"] = {
		Id = 5022295354,
		Name = "pa00",
		AltCards = {
			["Trimez Token 2"] = {
				Id = 88180650210862,
				Name = "Trimez",
				AttackEffect = "Jab",
				Bio = "Whoops! Did I trip on your hopes? My bad."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "DOUBLE FAKED!"
	},
	Stranglevines = {
		Id = 12653982924,
		Name = "Frigid Flufflefunz",
		AltCards = {
			ASino = {
				Id = 101367784588070,
				Name = "OmoTess",
				AltArt = true,
				AttackEffect = "Scratch",
				Bio = "Hey Duelist! Remember- ouch!<br/>Hey Dueli- ack!<br/>H- AAAAAAHHH!!!<br/>Hey Duelist! Remember: Some cards remind me of the sky!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		CustomReminder = {
			["Titanic Infusion"] = "Titanic studs may be baseplated for their colour, or cast for a bonus effect if there's 2 or more allied Titans."
		},
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Slander",
			Description = "When this card is cast: Give yourself a Green Titanic Stud.",
			Type = "OnSummon",
			Power = { { "Add", "Green Titanic Stud", "Ally" } },
			Target = "All"
		},
		Bio = "[The imperfection has been disposed of. Some eras are better left forgotten.]"
	},
	Stevenl15 = {
		Id = 17791738318,
		Name = "Stevenl15",
		AltCards = {
			["Famous Prophets (Fluffs)"] = {
				Id = 8707884425,
				Name = "Famous Prophets (Fluffs)",
				AltArt = true,
				AttackEffect = "Divinity",
				Bio = "\"Did they tell you what happens when you touch it? Did they - did they tell you what happens when you touch it? Did they tell you? Did they tell me? What happened to you?\""
			},
			["Stevenl15-AN"] = {
				Id = 9354552561,
				Name = "Sword Critic",
				AttackEffect = "LinkedSword",
				Bio = "A good offense is a good defense, and this sword lacks the latter. Look at its size! It's ridiculous!"
			},
			["Sierra Orion"] = {
				Id = 17791700377,
				Name = "Sierra Orion",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 202,
				Bio = "\"In the paradox of the battlefield, I've learned that life's fragility is most apparent when surrounded by the constant shadow of mortality.\""
			}
		},
		Health = 300,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 2 },
		Effect = {
			Name = "Probably shouldn't.",
			Description = "When this card is cast: All allied fighters gain 300 health. Lock them for 3 turns.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 300 },
				{ "Lock", 3 }
			},
			Target = "Ally"
		},
		Bio = "I pity the manicism that took over this heart."
	},
	["Paraselene Trainee"] = {
		Id = 119340351783409,
		Name = "Paraselene Trainee",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Moonward = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card would take noncombat damage: It gains 300 health.",
			Type = "OnEffectDamage",
			Power = { { "Heal", 300 } },
			Target = "Self"
		},
		Bio = "It is our noble duty to defend the ignorant from forces they cannot understand."
	},
	["Failed Experiment"] = {
		Id = 5431909304,
		Name = "Failed Experiment",
		AltCards = {
			["Failed Experiment-Hal"] = {
				Id = 7450585937,
				Rarity = "Common",
				AttackEffect = "MagicBlue",
				Bio = "Eisen's mistakes still roam the night."
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 2 },
		TransformImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever a fighter dies: This card gains 100 health.",
			Type = "OnAnyDeath",
			Power = { { "Heal", 100 } },
			Target = "Self"
		},
		Bio = "When Eisenhower left his lab to help defeat Zanzel, the clever abominations on the lowest floor broke out and slaughtered us."
	},
	["Artemis' Tombstone"] = {
		Id = 5454439882,
		Name = "Artemis' Tombstone",
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Your opponent can't cast actions on their next turn.",
			Type = "OnSummon",
			Power = { { "BypassAction" } },
			Target = "Opponent"
		},
		Bio = "There was nothing he could have done, truly."
	},
	["Orphaned Survivor"] = {
		Id = 5547337599,
		Name = "Orphaned Survivor",
		AltCards = {
			["Orphaned Survivor-C"] = {
				Id = 8215070793,
				Name = "Rebelling Elf Survivors",
				AttackEffect = "Jab",
				Transformant = "Orphaned Survivor-C",
				Bio = "In response to their horrid treatment, Santa has replaced them with scabs."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Archetype = "Survivor",
		TransformImmune = true,
		ReturnImmune = true,
		SetImmune = true,
		Transformant = "Orphaned Survivor",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Transform all allied fighters into a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "Ally"
		},
		Bio = "It was the people fleeing Bloxburg that gave Eisenhower attention to something worse than the death of his loved one."
	},
	["Dark Book of Spells"] = {
		Id = 5271603600,
		Name = "Dark Book of Spells",
		AltCards = {
			["Dark Book of Spells-Hal"] = {
				Id = 7472559100,
				Name = "Grimoire Prohibitum",
				AttackEffect = "DoomStorm",
				Bio = "She died as she lived — Curious!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
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
	["Depths of the Nether"] = {
		Id = 4783088354,
		Name = "Depths of the Nether",
		AltCards = {
			["Shepard Of The Unwanted"] = {
				Id = 6372665453,
				Name = "Shepard Of The Unwanted",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Some creations are simply better left unused."
			},
			["Depths of the Nether-AN"] = {
				Id = 9345662059,
				Name = "Depression",
				AttackEffect = "Slash",
				Bio = "Did they film the burger blowing up or did they make it do that on purpose..."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Gravity",
		Color = "Blue",
		Lunar = true,
		Cost = { Neutral = 2, Blue = 5 },
		Bio = "You drown in the void of water... yeah, roll with it.",
		Effect = {
			Description = "Reset a target fighter's stats and put it on top of your opponent's deck.\nDestroy the bottom 3 cards of your opponent's deck.",
			Type = "OnSummon",
			Power = {
				{ "Reset" },
				{
					"AlterEV",
					{ "Set", "Target", "CardIndex", "Nil" }
				},
				{ "Obliterate" },
				{ "DeckAdd", "Variable", "Opponent" },
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
			Target = "Single",
			EffectDeckAddToTop = true
		}
	},
	lilBismarck = {
		Id = 6786865243,
		Name = "lilBismarck",
		AltCards = {
			["lilBismarck-Sun"] = {
				Name = "Lolrus",
				Id = 9208887072,
				AttackEffect = "Bubbles",
				Bio = "I has a Bucket."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Microphone",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 2 },
		Effect = {
			Name = "Anime Detected",
			Description = "During your end step, if you have 5 or fewer cards in your deck: Your opponent loses 800 life.",
			Type = "OnEnd",
			Power = { { "Inflict", 800 } },
			EffectRequirement = { "Deck", "Ally", 0, 6, "Cards" },
			Target = "Opponent"
		},
		Bio = "######## ### Anime Patrol ##### ##."
	},
	Weaven = {
		Id = 6537538575,
		Name = "Sssqd",
		AltCards = {
			["Weaven-Sun"] = {
				Id = 7159100079,
				AttackEffect = "Blaze",
				Bio = "Two medium rares, coming up!"
			},
			["Weaven-ARR"] = {
				Id = 72393326198394,
				Name = "Practical Pickpocket",
				AttackEffect = "Blaze",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Take just one itty bitty piece out, and the whole thing comes crashing down!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		Effect = {
			Name = "Blown-in",
			Description = "When this card is cast: Give yourself 2 rare cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" }
			},
			Target = "Ally"
		},
		Bio = "The secret ingredient is Rat."
	},
	ReeseMcBlox = {
		Id = 6055866108,
		Name = "ReeseMcBlox",
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 2 },
		Token = true,
		Effect = {
			Name = "Helping Out",
			Description = "When this card is cast: Summon a copy of a target fighter, except its stats are 100/100.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = { { "SummonCopy" } },
					Target = "Single",
					MetaData = { Power = 100, Health = 100 }
				}
			}
		},
		Bio = "Please wait on hold."
	},
	Imaginaerum = {
		Id = 6391875533,
		Name = "Imaginaerum",
		AltCards = {
			["Blizaki-ArtV2"] = {
				Name = "Blizaki",
				Id = 136599542975839,
				AltArt = true,
				AttackEffect = "IcePunch",
				EffectAnimation = "SelfIceSmall",
				Bio = "\"I do this and that.\""
			},
			["Frosty The Snowman"] = {
				Name = "Frosty The Snowman",
				Id = 10184655960,
				AttackEffect = "Ice",
				EffectAnimation = "SelfIceSmall",
				Bio = "HAPPY BIRTHDAY!!!"
			}
		},
		Health = 600,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		EffectAnimation = "SmallWhirlpoolSelf",
		Color = "Neutral",
		Cost = { Blue = 3, Neutral = 2 },
		Effect = {
			Name = "Over the Hills of Snow",
			Description = "Whenever this card attacks: You gain {W}{B}.",
			Type = "OnAttack",
			Power = {
				{ "Blue", 1 },
				{ "Neutral", 1 }
			},
			Target = "Ally"
		},
		Bio = "Man, it's a good thing we invented all these highly sophisticated jetpacks, it makes plundering and bloxxing other people real easy!"
	},
	ZacAttackk = {
		Id = 105697166227033,
		Name = "ZacAttackk",
		AltCards = {
			["ZacAttackk-AN"] = {
				Id = 9352969407,
				Name = "Fire Breathing Hornet",
				AttackEffect = "Flare",
				Bio = "Before you can think about which Group this is in, your face has already melted off."
			},
			Rai = {
				Id = 10823224475,
				Name = "Rai",
				AltArt = true,
				AttackEffect = "Knife",
				Bio = "The neon red tint of a blade glows dimly through the misty rain."
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Slash",
		EffectAnimation = "LargeSlashEffect",
		Color = "Red",
		Cost = { Red = 3, Neutral = 7 },
		Effect = {
			Description = "When this card is cast: It deals 1000 overloaded damage to a target enemy fighter. You lose 1000 life.",
			Type = "OnSummon",
			Power = {
				{ "DamageOverloaded", 1000, "SingleEnemy" },
				{ "Cost", 1000 }
			},
			Target = "SingleEnemy"
		},
		Bio = "GO NUTS!"
	},
	BandiheartYT = {
		Id = 4782775590,
		Name = "BandisWarehouse",
		CopyBodge = "BandiheartYT",
		AltCards = {
			["BandisWarehouse-Hal"] = {
				Name = "Young Bandi Bandiswarehouse",
				Id = 10288482397,
				AttackEffect = "Tempest",
				Bio = "Toying with death is a hell lot of fun",
				Summonant = "BandisWarehouse-Hal1"
			},
			["Crazy Days"] = {
				Id = 106031978593738,
				Name = "Crazy Days",
				Summonant = "Crazy Days-1",
				Commissioner = { "Deedge119" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 713,
				Bio = "\"Embrace Chaos!<br/>soahC ecarbmE\""
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 8 },
		Summonant = "Bandi1",
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "When this card dies: Summon a copy of it with 300 more base power and 300 less base health.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "What's inside, does anyone know?"
	},
	Bandi1 = {
		Id = 4782775590,
		Name = "BandisWarehouse",
		CopyBodge = "Bandi1",
		AltCards = {
			["BandisWarehouse-Hal1"] = {
				Name = "Young Bandi Bandiswarehouse",
				Id = 10288482397,
				AttackEffect = "Tempest",
				Bio = "Toying with death is a hell lot of fun",
				Summonant = "BandisWarehouse-Hal2"
			},
			["Crazy Days-1"] = {
				Id = 106031978593738,
				Name = "Crazy Days",
				Summonant = "Crazy Days-2",
				AttackEffect = "Jab",
				Bio = "\"Embrace Chaos!<br/>soahC ecarbmE\""
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 8 },
		Summonant = "Bandi2",
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "When this card dies: Summon a copy of it with 300 more base power and 300 less base health.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "What's inside, does anyone know?"
	},
	Bandi2 = {
		Id = 4782775590,
		Name = "BandisWarehouse",
		CopyBodge = "Bandi2",
		AltCards = {
			["BandisWarehouse-Hal2"] = {
				Name = "Young Bandi Bandiswarehouse",
				Id = 10288482397,
				AttackEffect = "Tempest",
				Bio = "Toying with death is a hell lot of fun",
				Summonant = "BandisWarehouse-Hal3"
			},
			["Crazy Days-2"] = {
				Id = 106031978593738,
				Name = "Crazy Days",
				Summonant = "Crazy Days-3",
				AttackEffect = "Jab",
				Bio = "\"Embrace Chaos!<br/>soahC ecarbmE\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 8 },
		Summonant = "Bandi3",
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "When this card dies: Summon a copy of it with 300 more base power and 300 less base health.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "What's inside, does anyone know?"
	},
	Bandi3 = {
		Id = 4782775590,
		Name = "BandisWarehouse",
		CopyBodge = "Bandi3",
		AltCards = {
			["BandisWarehouse-Hal3"] = {
				Name = "Young Bandi Bandiswarehouse",
				Id = 10288482397,
				AttackEffect = "Tempest",
				Bio = "Toying with death is a hell lot of fun"
			},
			["Crazy Days-3"] = {
				Id = 106031978593738,
				Name = "Crazy Days",
				Summonant = "Crazy Days-4",
				AttackEffect = "Jab",
				Bio = "\"Embrace Chaos!<br/>soahC ecarbmE\""
			}
		},
		Health = 300,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 8 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "What's inside, does anyone know?"
	},
	Bandi4 = {
		Id = 714801837,
		Name = "BandiheartYT",
		Health = 300,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 8 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Or a good card."
	},
	["Sophisticated Bat"] = {
		Id = 5110842794,
		Name = "Uglypoe",
		CopyBodge = "Sophisticated Bat",
		Health = 1200,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "NotWeaven",
			Description = "When this card is cast: Give yourself 2 Rare cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" }
			},
			Target = "Ally"
		},
		Bio = "Becoming the monster is more fun than taming it."
	},
	BlackSymphony = {
		Id = 4976916318,
		Name = "BlackSymphony",
		AltCards = {
			["BlackSymphony-Val"] = {
				Id = 7138166613,
				AttackEffect = "MagicRed",
				Bio = "Stop showing your shoulders like that!"
			},
			["BlackSymphony-Val-Aurebus"] = {
				Id = 7138542526,
				AttackEffect = "Gravity",
				Bio = "\"My local game store's' owner has a graded-10 Dark Magician Girl card as a necklace. He's a nice guy but that's wacky, y'know?\""
			},
			Temperance = {
				Id = 88380300393063,
				Name = "Temperance",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 483,
				Bio = "He's the calm water between storms, yet his silence can break."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		EffectAnimation = "IceBreathEnemyDeck",
		Color = "Blue",
		Cost = { Blue = 5, Neutral = 4 },
		AlternateCost = { Neutral = 0 },
		AlternateCostRequirement = { "Deck", "Opponent", 0, 6, "Cards" },
		TargetImmune = true,
		Effect = {
			Name = "Dreadfreeze",
			Description = "Cast this card for free if an opponent has 5 or fewer cards in their deck.\nOnce each turn, if an effect would target this card: Instead destroy the bottom two cards of your opponent's deck, then each player draws a card.",
			Type = "OnTarget",
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
				{ "Draw", 1, "All" }
			},
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "I summon Dark Magician...\nKinda!"
	},
	Rockybow = {
		Id = 6062638656,
		Name = "Rockybow",
		AltCards = {
			["Rockybow-AN-Banner"] = {
				Id = 9885650598,
				Name = "The Scholar",
				AttackEffect = "DoomStorm",
				Transformant = "Rockybow-AN-Banner",
				Bio = "You'll never believe the new discovery I've made, Cloning Technology!"
			},
			["Xi_nal the Mintchocolate Trickster"] = {
				Id = 112701298508796,
				Name = "Xi_nal the Mintchocolate Trickster",
				ArtAnimation = "MintTrick",
				PremiumArt = 334,
				AltArt = true,
				Transformant = "Xi_nal the Mintchocolate Trickster",
				Bio = "You WILL scream for ice cream."
			}
		},
		Health = 1000,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Revolver",
		SummonAnimation = "SummonRedPortal",
		Color = "Red",
		Cost = { Neutral = 4, Green = 1, Red = 5 },
		TransformImmune = true,
		Transformant = "Rockybow",
		Effect = {
			Name = "Twist",
			Description = "During your end step: Transform all enemy fighters into a copy of this card.",
			Type = "OnEnd",
			Power = { { "Transform", "Transformant" } },
			Target = "Opponent"
		},
		Bio = "Scotch."
	},
	["Hallows Treats"] = {
		Id = 4899343999,
		Name = "Hallow's Treats",
		AltCards = {
			["Hallows Treats-Val"] = {
				Id = 8855297478,
				Name = "Box of Chocolates",
				Bio = "Happy Bloxentines Day 2021~"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Untradeable = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Endless Spooks",
			Description = "Destroy all fighters with 350 or less health.\nYou can't attack or cast anything this turn.",
			Type = "OnSummon",
			Power = {
				{
					"CheckHealth",
					{ 0, 350 }
				},
				{ "BypassAttack", 30, "Ally" },
				{ "BypassSummon", 30, "Ally" },
				{ "BypassAction", 30, "Ally" }
			},
			Target = "All"
		},
		Bio = "Not for the faint of wallet.",
		IsFood = true
	},
	["Collapsing Laboratory"] = {
		Id = 5402958514,
		Name = "Collapsing Laboratory",
		AltCards = {
			["NinWasTaken’s Deluxe 8-Ball Factory"] = {
				Id = 7257102709,
				Name = "NinWasTaken’s Deluxe 8-Ball Factory",
				Terrariant = "8-Ball Terrain",
				AltArt = true,
				Bio = "\"Hey watch it! These aren’t made in a day. My 8-Balls are perfectly made for everyone’s needs trust me guys! Plz…\"",
				Addant = "Morphic Goo-8ball"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Goo",
		Color = "Blue",
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Archetype = "Morphic",
		Terrain = true,
		Cost = { Blue = 4 },
		Terrariant = "Laboratory Terrain",
		Addant = "Morphic Goo",
		Effect = {
			Name = "Stagefright, OPPONENT!!!",
			Description = "Whenever an allied effect targets for the second time each turn: Give yourself a Morphic Goo, except its stud cost is removed.",
			Type = "OnAllyTarget",
			Power = { { "Add", "Addant" } },
			Target = "Ally",
			MetaData = { AddNeutralCost = -2 },
			EffectRequirement = { "Playertable", "Me", 2, 3, "TargetCount" }
		},
		Bio = "With the death of his loved one, Eisenhower devoted everything to his restoration. Eisenhower's lab fell into disrepair."
	},
	["Paraselene Sage"] = {
		Id = 5530562670,
		Name = "Paraselene Sage",
		AltCards = {
			["Paraselene Sage V2"] = {
				Id = 7954115012,
				Name = "Great Paraselene Sage",
				Bio = "'Yuèliàng has failed us. E-----e has escaped containment. Summon our ancestors; There can be no failure on Robloxia.' --Lua, Paraselene Neonate; Field Notes"
			},
			SoySearch = {
				Id = 7357116062,
				Name = "SoySearch",
				AltArt = true,
				AttackEffect = "MagicGreen",
				Bio = "I FREAKING LOVE SOY! AND SCIENCE! AND NINTENDO!"
			},
			["TheRobloxPlayer2509, Lunar Maid"] = {
				Id = 9267989183,
				Name = "TheRobloxPlayer2509, Lunar Maid",
				AltArt = true,
				AttackEffect = "DoomStorm",
				Bio = "Personal maid of the Lunar Goddess. One of the most capable Paraselene Sages under the command of the First Evincar."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Blue = 3 },
		Moonward = true,
		Effect = {
			Name = "Render",
			Description = "Whenever this card would take noncombat damage: Give yourself a Blue or Red action card.",
			Type = "OnEffectDamage",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally"
		},
		Bio = "Zanzel? Hallow? Eisenhower? Imbeciles compared to the moon."
	},
	["Brothers Grotesque"] = {
		Id = 10281040445,
		Name = "Brothers Grotesque",
		AltCards = {
			["Brothers Grotesque-Hal"] = {
				Id = 119340351783409,
				Name = "Meat Diesel",
				AttackEffect = "DoomStorm",
				Bio = "Half Human, Half Diesel train."
			},
			["Brothers Grotesque-AWIH"] = {
				Id = 17600744000,
				Name = "Scholar of Thought",
				AttackEffect = "MagicBlue",
				Bio = "Sentience is a concept that finds itself fascinating.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 1500,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 6, Neutral = 6 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: All enemy fighters lose 100 power, then swap their stats.",
			Type = "OnEnd",
			Power = {
				{ "Weaken", 100, "Opponent" },
				{ "Swap", 100000, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Some raiders risk life and limb to steal Eisenhower's forgotten potions. Most of these concoctions were never made to be moved, let alone transported, leading to unfortunate accidents when you shake one a bit too hard..."
	},
	["Paraselene Moondog"] = {
		Id = 5854987458,
		Name = "Paraselene Moondog",
		AltCards = {
			["Mio Moondog"] = {
				Id = 115040638320159,
				Name = "Mio, 会馆的执行者",
				Commissioner = { "MemeyChu" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 726,
				Bio = "相遇 分离<br/>快乐 忧伤<br/>心动 慌张<br/>希望 绝望<br/>不管明天会变得怎样<br/>陪着我静静地唱"
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		Moonward = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card would take noncombat damage: Draw a card.",
			Type = "OnEffectDamage",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "The common man would panic if they knew of what was out there. Keep them in bliss to keep society running."
	},
	Psychotic = {
		Id = 5000946163,
		Name = "Moon's Wake",
		AltCards = {
			["Ideal World"] = {
				Id = 10069351524,
				AltArt = true,
				Name = "Ideal World",
				AttackEffect = "Whirlpool",
				EffectAnimation = "LargeWhirlpoolEffect",
				Bio = "Everything's under my control."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		EffectAnimation = "LargeMagicBlueEffect",
		Color = "Blue",
		Lunar = true,
		Cost = { Neutral = 2, Red = 2, Blue = 2 },
		Effect = {
			Name = "Psychotic",
			Description = "Deal 750 damage to a target fighter and it gains 1000 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 1000 },
				{ "Damage", 750 }
			},
			Target = "Single"
		},
		Bio = "Originally banned for its horrible consequences on the body, now freely used to purge the otherworldy."
	},
	["Laboratory Security"] = {
		Id = 10280520604,
		Name = "Laboratory Security",
		Health = 900,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast an action card: This card gains 200 Power.",
			Type = "OnAllyCast",
			Power = { { "Strengthen", 200 } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "\"When I saw the Laboratory's lower floors, I froze. The Robot didn't.\" - David Crissbach"
	},
	["Lunar Banishment"] = {
		Id = 5253916026,
		Name = "Lunar Banishment",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		CustomReminder = {
			["Paraselene Warden"] = "A {B}{B}{B} 1000/100 with Moonward. Players can't cast Epic or Legendary cards for a turn if it would take noncombat damage."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Return all Epic and Legendary fighters to their hands.\nSummon a 1000/100 Paraselene Warden.\nDeal 50 damage to all allied fighters.",
			Type = "OnSummon",
			Power = {
				{ "Return", 30, "Epic" },
				{ "Return", 30, "Legendary" },
				{ "Summon", "Paraselene Warden" },
				{ "Damage", 50, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Eclipse let out one last howl as the lunar crystals locked him in place."
	},
	["Paraselene Warden"] = {
		Id = 5271605935,
		Name = "Paraselene Warden",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Blue = 3 },
		Moonward = true,
		CustomReminder = {
			Moonward = "If this card would take noncombat damage, it takes 100 damage instead."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card would take noncombat damage: Until each player's next end step, that player can't cast Epic or Legendary cards.",
			Type = "OnEffectDamage",
			Power = {
				{ "BypassEpicLegendary", 30, "Ally" },
				{ "BypassEpicLegendary", 30, "Opponent" }
			},
			Target = "All"
		},
		Bio = "\"Sadly, its actions stopped us from eradicating the curse. It's a shame such a noble creature was trapped in a hideous frame.\" - Lua, Paraselene Evincar"
	},
	["Eisenhower, the Alchemist"] = {
		Id = 9113376011,
		Name = "Eisenhower, the Alchemist",
		AltCards = {
			["Eisenhower-Sun"] = {
				Id = 10184535174,
				Name = "Eisenhower, the President",
				AttackEffect = "Revolver",
				Bio = "I will take as much time as needed to legalise necromancy."
			},
			["Eisenhower-Banner"] = {
				Id = 11393856279,
				Name = "Eisenhower",
				AttackEffect = "Storm",
				Bio = "With a promise of the return of his love, something else returned to him after being gone for just as long, a smile."
			},
			["Judgemental Skeletons"] = {
				Id = 9113378247,
				AltArt = true,
				AttackEffect = "Scratch",
				Name = "Judgemental Skeletons",
				Bio = "Your breathing aggravates me."
			},
			["Eisenhower, the Alchemist-10Y"] = {
				Id = 83641331550149,
				AttackEffect = "Gun",
				Bio = ">make revival potion for dead boyfriend \n>accidentally start like 6 cults \n>mfw"
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 7, Red = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever a player casts a fighter: That player can't attack or cast anything else this turn.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "BypassAttack" },
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
				OnEnemySummon = {
					Power = {
						{ "BypassAttack" },
						{
							"SetCastRestriction",
							{
								{ "NOTHING" },
								"You can't cast anything else this turn."
							},
							"Opponent"
						}
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "I will take as much time as needed to avenge my love."
	},
	["Lua, Paraselene Evincar"] = {
		Id = 5902970778,
		Name = "Lua, Paraselene Evincar",
		AltCards = {
			["Lua, Paraselene Evincar-NewYears"] = {
				Id = 12110725135,
				Name = "Sanzang",
				AttackEffect = "Divinity",
				Bio = "\"Do you ever just think we're doing this not because it's an important mission but because J.E's court is lazy?\"<br />\"We are on a mission, monkey. We either do it or we can force you to do it.\""
			},
			["The Magical Girls"] = {
				Id = 14192597572,
				Name = "The Magical Girls",
				AltArt = true,
				PremiumArt = 88,
				AttackEffect = "LaserBlue",
				Bio = "<i>\"With the power of Love, Justice, and Happiness... Here come the Magical Girls!\"</i>"
			}
		},
		Health = 1200,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Red = 4, Blue = 4 },
		DamageImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Once during your turns, if this card would take noncombat damage: Instead remove {W}{W} from all actions in your hand. Each action you cast this turn triggers its effect an additional time this turn.",
			Type = "OnEffectDamage",
			Power = {
				{
					"IncreaseCost",
					{ -2, "Neutral", "Nil" },
					"CustomTarget"
				},
				{ "ActionOverdrive", 999 }
			},
			Target = "Ally",
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "Action"
			},
			TurnTriggerLimit = 1,
			EffectRequirement = { "MyTurn", "Me", 30, 303 }
		},
		Bio = "\"A freedom lock is caused when a powerful entity causes an action that cannot be undone. It is our duty to prevent these locks so that all disasters can be undone.\""
	},
	["Fleeing Survivors"] = {
		Id = 9964787179,
		Name = "Fleeing Survivors",
		AltCards = {
			["Fleeing Survivors-Hal"] = {
				Id = 9964788126,
				Name = "Frightened Campers",
				AttackEffect = "Jab",
				Bio = "For once, the campers decided to come together instead of splitting up. Make their sacrifice count!"
			},
			Boxie = {
				Id = 9964789765,
				Name = "Boxie",
				AltArt = true,
				AttackEffect = "Jab",
				SummonAnimation = "RobloxianCall",
				Bio = "Maids."
			},
			["epic yes"] = {
				Id = 9964791316,
				Name = "epic yes",
				AltArt = true,
				AttackEffect = "Jab",
				SummonAnimation = "RobloxianCall",
				Bio = "\"Imagine having beef with me.  I'm just a silly little jokester.  Just a silly little guy. You're gonna have beef with a silly little guy?  For shame.\""
			},
			["Teapot and Purtle, the Elevator Riders"] = {
				Id = 17787945476,
				Name = "Teapot and Purtle, the Elevator Riders",
				AttackEffect = "Punch",
				AltArt = true,
				SummonAnimation = "RobloxianCall",
				Bio = "If you run into clones of us, remember WE'RE the originals! Right?"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
		SummonAnimation = "SummonPanic",
		Archetype = "Survivor",
		Color = "Red",
		Cost = { Red = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Search your deck for three copies of it, except they're inert when discarded.",
			Type = "OnSummon",
			Power = {
				{ "Tutorfor", "Fleeing Survivors" },
				{ "Tutorfor", "Fleeing Survivors" },
				{ "Tutorfor", "Fleeing Survivors" }
			},
			MetaData = { TokenDiscard = true },
			Target = "Ally"
		},
		Bio = "Everyone fled the ruined Bloxburg, no matter the danger. The scared refugees found the savages that ruled this forest preoccupied with the same horrors they faced."
	},
	["Pumpkin Bomb"] = {
		Id = 9964949822,
		Name = "Pumpkin Bomb",
		AltCards = {
			["MyrmiredonV2 4"] = {
				Id = 9964951612,
				Bio = "What if our lives ARE the bombs? And if it is, why is it taking so long for me to die?"
			},
			["Ravcade-Pumpkin Bomb"] = {
				Id = 9964952479,
				Bio = "Explode your enemies into bits with some 8-bit horror!"
			},
			["Pumpkin Spice"] = {
				Id = 9964953839,
				Name = "Pumpkin Spice",
				Bio = "Spicy, sweet, and packed full of more sugar than the recommended daily intake!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Lunar = true,
		EffectAnimation = "SmallExplosionEffect",
		Cost = { Red = 1 },
		IsFood = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Deal 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250 } },
			Target = "Single"
		},
		Bio = "For the inhabitants of Bloxburg, these bombs are a sign of relentless agony. For Hallow, it's Tuesday."
	},
	Piggy = {
		Id = 121367612608915,
		Name = "Piggy",
		AltCards = {
			["Piggy-E"] = {
				Id = 121367612608915,
				Name = "Bunny",
				AttackEffect = "Arrow",
				Bio = "Who left all these carrots around h-THUNK!"
			}
		},
		Health = 200,
		Power = 400,
		Mitigation = 300,
		DamageMitigation = 300,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 2, Neutral = 4 },
		Effect = {
			Name = "Stud",
			Description = "This card takes 300 less damage from effects and combat.\nDuring your end step: Reset this card's stats.",
			Type = "OnEnd",
			Power = { { "Reset" } },
			Target = "Self"
		},
		Bio = "Who left all these bear traps around h-BONK!"
	},
	["Moon Rabbit's Rage"] = {
		Id = 5291411516,
		Name = "Moon Rabbit's Rage",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Lunar = true,
		Cost = { Red = 2 },
		Effect = {
			Name = "Moon Rabbit's Rage",
			Description = "A target fighter gains 350 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 350 } },
			Target = "Single"
		},
		Bio = "Elementary Moon sorcery. Often used on Trainees, to harden their resolve for the painful path that awaits them."
	},
	["Void Cultist"] = {
		Id = 74230065316657,
		Name = "Holy Cultist",
		AltCards = {
			["Void Cultist-Hal"] = {
				Id = 7829888226,
				Name = "Cult Leader",
				AddGenZoneant = "Void Cultist-Hal",
				AttackEffect = "British",
				Bio = "Disorder shall be the norm."
			},
			["Iamlogic, Blox Cards Champ"] = {
				Id = 8215069799,
				Name = "Iamlogic, Blox Cards Champ",
				AltArt = true,
				AddGenZoneant = "Iamlogic, Blox Cards Champ",
				Bio = "Worst bet of your life, Fluff."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3 },
		Archetype = "Void",
		AddGenZoneant = "Void Cultist",
		Effect = {
			Name = "Moon Rabbit's Rage",
			Description = "When this card is cast, if you have 2000 or less Life: It gains 600 health. Put a copy of it into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 600 },
				{
					"AddGenZone",
					{ "AddGenZoneant", 1 }
				}
			},
			EffectRequirement = { "Playertable", "Me", -99999, 2001, "Life" },
			Target = "Self"
		},
		Bio = "Oh Heavenly Father! Guide us to your beautiful light! Bring us salvation and bestow your refuge upon our sinner hearts!"
	},
	["New Hazenwyld"] = {
		Id = 5947358615,
		Name = "New Hazenwyld",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Terrain = true,
		Terrariant = "Hazenwyld Terrain",
		Cost = { Red = 4 },
		Archetype = "Lycanthrope",
		Effect = {
			Name = "Moon Rabbit's Rage",
			Description = "Whenever an action is cast: Your opponent loses 200 life.",
			Type = "OnCast",
			Power = { { "Inflict", 200, "Opponent" } },
			Target = "Ally"
		},
		Bio = "After Eclipse was banished, the Lycanthropes' home was left unguarded."
	},
	["Death-Defying Demon"] = {
		Id = 11973270049,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light"] = {
				Id = 11973279835,
				Name = "Shining Axe Beam of Light",
				AltArt = true,
				AttackEffect = "FirePunch",
				Bio = "\"In the dark I've lingered too long | This sharpened axe, beam of light! | Its purpose now revealed in silence! | Keep searching, question if this light ends! | \"Now I will strike and dig with precision | Introspective eye, erase the concept | I lost my fears and the notion of time! | I healed my sorrow!!\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		TriggerInGraveZone = true,
		Color = "Red",
		Cost = { Red = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever an allied action destroys a fighter, if this card's in your graveyard and it's died this game: Summon this card from your graveyard, except it's fading.",
			Type = "OnAllyActionKill",
			Power = { {
				"MoveZone",
				{
					"HasDied_Death-Defying Demon",
					"GraveZone_Ally",
					"Field_Ally",
					true,
					false
				}
			} },
			MetaData = { Fading = true },
			Target = "Self"
		},
		Bio = "Falling out,"
	},
	["Demon 6"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 6"] = {
				Name = "Shining Axe Beam of Light",
				Summonant = "Shining Axe Beam of Light 7",
				Id = 8475543014,
				AttackEffect = "FirePunch",
				Bio = "\"Its purpose now revealed in silence! | Keep searching, question if this light ends!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 7",
		Effect = {
			Name = "Pyrotechnics",
			Description = "6 charges.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "my senses fire,"
	},
	["Demon 7"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 7"] = {
				Name = "Shining Axe Beam of Light",
				Id = 8475543014,
				Summonant = "Shining Axe Beam of Light 8",
				AttackEffect = "FirePunch",
				Bio = "\"Now I will strike and dig with precision | Introspective eye, erase the concept\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 8",
		Effect = {
			Name = "Pyrotechnics",
			Description = "5 charges.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "in all directions..."
	},
	["Demon 8"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 8"] = {
				Name = "Shining Axe Beam of Light",
				Id = 8475543014,
				Summonant = "Shining Axe Beam of Light 9",
				AttackEffect = "FirePunch",
				Bio = "\"I lost my fears and the notion of time! | I healed my sorrow!!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 9",
		Effect = {
			Name = "Pyrotechnics",
			Description = "4 charges.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "... I watch them echo."
	},
	["Demon 9"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 9"] = {
				Name = "Shining Axe Beam of Light",
				Id = 8475543014,
				Summonant = "Shining Axe Beam of Light 10",
				AttackEffect = "FirePunch",
				Bio = "\"All boundaries are illusion | When you reach the center light\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 10",
		OnDeath = "SelfFire",
		Effect = {
			Name = "Pyrotechnics",
			Description = "3 charges.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Filling up,"
	},
	["Demon 10"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 10"] = {
				Name = "Shining Axe Beam of Light",
				Id = 8475543014,
				Summonant = "Shining Axe Beam of Light 11",
				AttackEffect = "FirePunch",
				Bio = "\"And reinforce the striking power | By chance you're followed!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 11",
		Effect = {
			Name = "Pyrotechnics",
			Description = "2 charges.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "where there was nothing..."
	},
	["Demon 11"] = {
		Id = 5820065783,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 11"] = {
				Name = "Shining Axe Beam of Light",
				Id = 8475543014,
				Summonant = "Shining Axe Beam of Light 12",
				AttackEffect = "FirePunch",
				Bio = "\"Its purpose now revealed in silence! | Keep searching, question if this light ends!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Summonant = "Demon 12",
		Effect = {
			Name = "Pyrotechnics",
			Description = "1 charge.\nWhen this card dies: Spend a charge and summon a copy of it..",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "... As I let go."
	},
	["Demon 12"] = {
		Id = 6858800263,
		Name = "Death-Defying Demon",
		AltCards = {
			["Shining Axe Beam of Light 12"] = {
				Name = "Shining Axe Beam of Light",
				AttackEffect = "FirePunch",
				Id = 8475543014,
				Bio = "\"All ghosts dwelling in, inside, in the heart | I see them all, release their shadow!\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 7 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "..."
	},
	["666"] = {
		Id = 97645304641674,
		CopyBodge = "666",
		Name = "Guest 666",
		AltCards = {
			["Guest 666-Alt"] = {
				Id = 5387300445,
				AltArt = true,
				AttackEffect = "MagicRed",
				Name = "Guest 666",
				Bio = "A myth is but an idea. Even if my body is no more, I'll lurk in your memory, forever unshackled."
			},
			["Guest 666-Alt-2"] = {
				Id = 10570823569,
				AltArt = true,
				AttackEffect = "DoomStorm",
				Name = "Guest 666",
				Bio = "Evil takes many forms."
			},
			["Guest 666-AN-Offer"] = {
				Id = 18601522235,
				ArtAnimation = "GuestGuy",
				AttackEffect = "DoomStorm",
				Bio = "Even the greatest myths can be forgotten.",
				Effect = {
					Name = "BurnForever!",
					Description = "During your end step, if you have 666 or less life: Your opponent loses 666 life. Set your life to 666 and summon a 500/300 Forgotten Guest.",
					Type = "OnEnd",
					Power = {
						{ "Inflict", 666, "Opponent" },
						{ "SetLife", 666, "Ally" },
						{ "Summon", "Corrupt Guest-Anim", "Ally" }
					},
					EffectRequirement = { "Playertable", "Me", 0, 667, "Life" },
					Target = "Ally"
				}
			}
		},
		Health = 666,
		Power = 666,
		Rarity = "Rare",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Red = 6 },
		CustomReminder = {
			["Corrupt Guest"] = "A {W}{W}{W} 500/300. Whenever you lose life, it gains 200 power."
		},
		Effect = {
			Name = "BurnForever!",
			Description = "During your end step, if you have 666 or less life: Your opponent loses 666 life. Set your life to 666 and summon a 500/300 Corrupt Guest.",
			Type = "OnEnd",
			Power = {
				{ "Inflict", 666, "Opponent" },
				{ "SetLife", 666, "Ally" },
				{ "Summon", "Corrupt Guest", "Ally" }
			},
			EffectRequirement = { "Playertable", "Me", 0, 667, "Life" },
			Target = "Ally"
		},
		Bio = "Can you guess why wolves built heaven?"
	},
	Doneyes = {
		Id = 4204428650,
		Name = "Doneyes",
		AltCards = {
			["Lone Ranger"] = {
				Id = 13464664879,
				AltArt = true,
				PremiumArt = 34,
				AttackEffect = "Revolver",
				Commissioner = { 749386686, 8289996, 320659945 },
				Name = "Lone Ranger",
				Bio = "'Maybe these barren wastelands need expedited shipping.'"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 6, Neutral = 1 },
		Effect = {
			Name = "Render",
			Description = "Whenever your opponent casts a fighter: They lose {W}. Put a Green Stud into your baseplate.",
			Type = "OnEnemySummon",
			Power = {
				{
					"Neutral",
					-1,
					nil,
					nil,
					nil,
					nil,
					"StudNeutral"
				},
				{
					"AddGenZone",
					{ "Green Stud", 1 },
					"Ally",
					nil,
					nil,
					nil,
					"BaseplateGreen"
				}
			},
			Target = "Opponent"
		},
		Bio = "Creator of bloodfest. Many eyes will be worn."
	},
	["Noli, Demon Seeker"] = {
		Id = 110621911793919,
		Name = "Noli, Heaven Seeker",
		AltCards = {
			["Noli, Demon Seeker-Hal"] = {
				Id = 7459716095,
				Name = "Mallorina",
				AttackEffect = "Gravity",
				Bio = "Lezus... Come to me."
			},
			["Penitent AndN0te"] = {
				Id = 12724007478,
				Name = "Penitent AndN0te",
				AltArt = true,
				ArtAnimation = "AndN0te",
				Commissioner = { 752959064 },
				Bio = "<i>How was I to know...?</i>"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 6 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Search your deck for 'Unspeakable Summoning' and 3 'Holy Cultists.' You lose 1000 Life.",
			Type = "OnSummon",
			Power = {
				{ "Tutorfor", "Unspeakable Summoning" },
				{ "Tutorfor", "Void Cultist" },
				{ "Tutorfor", "Void Cultist" },
				{ "Tutorfor", "Void Cultist" },
				{ "Cost", 1000 }
			},
			Target = "Ally"
		},
		Bio = "Who is he? Sitting on thine throne as our kind and world slowly rots into oblivion? A land once populated by our people has been usurped. Never once giving us a moment of time for our kind to flourish. His greed knows no bounds…but now. It is time for retribution."
	},
	["David Crissbach"] = {
		Id = 5832350364,
		Name = "David Crissbach",
		AltCards = {
			["David Crissbach-E"] = {
				Id = 8941648321,
				Name = "Pet Store Clerk",
				Transformant = "David Crissbach-E-T",
				Bio = "\"Let me give you a lesson my time at a pet store taught me once: Control what you can. Run away from what you can't.\""
			},
			["David Crissbach-E-T"] = {
				Id = 8941649599,
				Name = "Rabid Bunny",
				Rarity = "Token",
				Transformant = "David Crissbach-E-T",
				Bio = "SQUEAK."
			},
			["David Crissbach-Banner"] = {
				Id = 11393854023,
				Name = "David, Stalwart Survivor",
				Transformant = "David Crissbach-Banner-T",
				AttackEffect = "Rifle",
				Bio = "\"Perfection leaves no room for differences. Differences are what makes us human. That's what Zanzel fails to understand.\""
			},
			["David Crissbach-Banner-T"] = {
				Id = 11393878411,
				Name = "Bloxburg in Unity",
				Rarity = "Token",
				Transformant = "David Crissbach-Banner-T",
				AttackEffect = "Rifle",
				Bio = "Seeing the bright red flare light up the shadowed skies, the survivors knew the chance to save their city had finally arrived."
			}
		},
		Health = 400,
		Power = 400,
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
			Description = "When this card is cast: Transform all allied fighters into a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "Ally"
		},
		Bio = "\"Let me give you advice my father gave me when he got divorced: Control what you can. Accept what you can't.\""
	},
	["Skull Collector's Ritual"] = {
		Id = 5521721862,
		Name = "Skull Collector's Ritual",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Ritual = true,
		CustomReminder = {
			Rituals = "Complete the ritual to summon Eclipse, the Werewolf Colossus. Stop Zanzel. We beg of you."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Give yourself 'Eclipse's Resurrection.'\nSearch your deck for all 4 Ritual Parts.\nYou gain 1000 life.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Eclipse's Resurrection" },
				{ "Tutorfor", "Ritual Part: Werewolf Fur" },
				{ "Tutorfor", "Ritual Part: Vitality Wellspring" },
				{ "Tutorfor", "Ritual Part: Husk Newt" },
				{ "Tutorfor", "Ritual Part: Godbeast's Skull" },
				{ "Cost", -1000 }
			},
			Target = "Ally"
		},
		Bio = "Body, Spirit, Fur, and Vitality. This would resurrect the Moonbreaker. A question remained: How to obtain them?"
	},
	["Eclipse's Resurrection"] = {
		Id = 10184551927,
		Name = "Eclipse's Resurrection",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Requirement = { "Playertable", "Me", 4, 9999, "Ritual" },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if you've cast all 4 Ritual Parts this game.\nSummon Eclipse, a 3000/3000 Werewolf Colossus.\nDraw a card.\nShuffle a copy of this card into your deck.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Eclipse, Werewolf Colossus" },
				{ "Draw", 1 },
				{ "DeckAdd", "Eclipse's Resurrection" }
			},
			Target = "Ally"
		},
		Bio = "With the ritual complete, the Moonbreaker may finally be released oncemore."
	},
	["Eclipse, Werewolf Colossus"] = {
		Id = 7548621763,
		Name = "Eclipse, Werewolf Colossus",
		AltCards = {
			["Celastia, Lunar Goddess"] = {
				Id = 9570576857,
				Name = "Celastia, Lunar Goddess",
				AttackEffect = "SkeleScythe",
				Bio = "A deity who hailed from outer space. She led the old Paraselene into battle against Eclipse, then mysteriously vanished after their triumph against Eclipse."
			},
			PCConquista = {
				Id = 9791898517,
				Name = "Conquista",
				AttackEffect = "Gravity",
				Bio = "\"Charming, a world conformed by the strings of a contortionist like you. I wonder if I can shatter you the same way I did with my puppet-master.\""
			},
			["Takashi Yagami"] = {
				Id = 12504266477,
				Name = "Takashi Yagami",
				AttackEffect = "Scorch",
				Bio = "<i>\"No, but if you were that kind of scum, we wouldn't have come all the way down here.\"</i>"
			},
			["front-facing roxy"] = {
				Id = 98063321147292,
				Name = "front-facing roxy",
				AttackEffect = "Scorch",
				Bio = "i think therefore i am, but that doesnt explain <i>what</i> i am"
			}
		},
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "LycanScratch",
		SummonAnimation = "EclipseSummon",
		SummonedAnimation = "EclipseSummon",
		Archetype = "Lycanthrope",
		DamageImmune = true,
		Color = "Red",
		Cost = { Red = 10 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Thrice each turn, whenever you discard a card: Deal 600 damage to all fighters. This card gains 600 health.",
			Type = "OnAllyDiscard",
			Power = {
				{ "Damage", 600 },
				{ "Heal", 600, "Self" }
			},
			Target = "All",
			TurnTriggerLimit = 3
		},
		Bio = "As the Moonbreaker rose, Zanzel's ambitions fell."
	},
	["Ritual Part: Werewolf Fur"] = {
		Id = 5521862107,
		Name = "Ritual Part: Werewolf Fur",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Red = 1 },
		Requirement = { "Power", "Ally", 1000 },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if there is 1000 or more Power amongst allied fighters.\nSearch your deck for 'Skull Collector's Ritual' and remove a {W} from its cost.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Ritual", "2" },
				{ "Tutorfor", "Skull Collector's Ritual" },
				{ "Draw", 1 },
				{
					"IncreaseCost",
					{ -1, "Neutral", "Nil" },
					"CustomTarget"
				}
			},
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "HasPassive",
				Modifier = "Ritual"
			},
			Target = "Ally"
		},
		Bio = "To resurrect Eclipse, the Skull Collector needed four items. Quan Sinister had trouble finding a Lycanthrope that wanted its fur shaven."
	},
	["Ritual Part: Vitality Wellspring"] = {
		Id = 6304978859,
		Name = "Ritual Part: Vitality Wellspring",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Green = 1 },
		Requirement = { "Board", "AllyGraveZone", 20, 9999 },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if there's 20 or more cards in your graveyard.\nSearch your deck for 'Skull Collector's Ritual' and remove a {W} from its cost.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Ritual", "3" },
				{ "Tutorfor", "Skull Collector's Ritual" },
				{ "Draw", 1 },
				{
					"IncreaseCost",
					{ -1, "Neutral", "Nil" },
					"CustomTarget"
				}
			},
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "HasPassive",
				Modifier = "Ritual"
			},
			Target = "Ally"
		},
		Bio = "To resurrect Eclipse, the Skull Collector needed four items. The Lycanthropes scoured the ruined Bloxburg for the well of light it was always known for."
	},
	["Ritual Part: Husk Newt"] = {
		Id = 6304978317,
		Name = "Ritual Part: Husk Newt",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Blue = 1 },
		Requirement = { "Playertable", "Me", 3, 9999, "Actions" },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if you've cast 3 or more actions this turn.\nSearch your deck for 'Skull Collector's Ritual' and remove a {W} from its cost.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Ritual", "1" },
				{ "Tutorfor", "Skull Collector's Ritual" },
				{ "Draw", 1 },
				{
					"IncreaseCost",
					{ -1, "Neutral", "Nil" },
					"CustomTarget"
				}
			},
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "HasPassive",
				Modifier = "Ritual"
			},
			Target = "Ally"
		},
		Bio = "To resurrect Eclipse, the Skull Collector needed four items. Already a pioneer of cloning, Eisenhower had the perfect body. He just had to get to the lower floors of his laboratory..."
	},
	["Ritual Part: Godbeast's Skull"] = {
		Id = 6304976911,
		Name = "Ritual Part: Godbeast's Skull",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1 },
		Requirement = { "Playertable", "Me", 3, 999999, "TargetCount" },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if allied effects have targeted 3 or more times since your last end step.\nSearch your deck for 'Skull Collector's Ritual' and remove a {W} from its cost.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Ritual", "4" },
				{ "Tutorfor", "Skull Collector's Ritual" },
				{ "Draw", 1 },
				{
					"IncreaseCost",
					{ -1, "Neutral", "Nil" },
					"CustomTarget"
				}
			},
			TargetParameters = {
				Zones = { "Ally_Hand" },
				Condition = "HasPassive",
				Modifier = "Ritual"
			},
			Target = "Ally"
		},
		Bio = "To resurrect Eclipse, the Skull Collector needed four items. Hallow retreated to his hunting grounds to kill death itself."
	},
	["Unspeakable Summoning"] = {
		Id = 4899466119,
		Name = "Unspeakable Summoning",
		AltCards = {
			["Unspeakable Summoning-Hal"] = {
				Id = 7480399718,
				Name = "The Cole Family",
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Noli.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal"
							}
						},
						{
							"RandomSummon",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "Become one with the void. Let Noli guide you."
			},
			["United Deer Sacrification"] = {
				Id = 72514215317259,
				Name = "United Deer Sacrification",
				AltArt = true,
				Effect = {
					Name = "Stud",
					Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 Deer Reborn.",
					Power = {
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{ "The 1", "The 2", "The 3", "The 4", "The 5", "The 6" }
						},
						{
							"RandomSummon",
							{ "The 1", "The 2", "The 3", "The 4", "The 5", "The 6" }
						}
					},
					Target = "Opponent"
				},
				Bio = "\"Decades of deer torture lead to this moment, it's the time it break through the cycle of life, the logic of the universe and the theory of every organism.\""
			},
			["Incomprehensible Gardening"] = {
				Id = 12326183808,
				Name = "Incomprehensible Gardening",
				AltArt = true,
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Lettuce.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6"
							}
						},
						{
							"RandomSummon",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "I work, I toil. Your life shall spoil."
			},
			["Mint Contract"] = {
				Id = 12653994301,
				Name = "The Fate of the Mint Chocolate Contract",
				AltArt = true,
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Mintchocolate.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6"
							}
						},
						{
							"RandomSummon",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			INTERLOPE = {
				Id = 12943242180,
				Name = "INTERLOPE",
				AltArt = true,
				PremiumArt = 17,
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of INTERLOPER.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6"
							}
						},
						{
							"RandomSummon",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "get s.interlope.pull:27015"
			},
			["Unspeakable Summoning-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 101276107867584,
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Lezus.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"Lezus 1-10Y",
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y"
							}
						},
						{
							"RandomSummon",
							{
								"Lezus 1-10Y",
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "Godlike summoning heavens away.<br/>I pray, mon dieu."
			},
			Commatose = {
				Id = 81973240744876,
				Name = "Commatose",
				AltArt = true,
				Effect = {
					Power = {
						Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Noli.",
						{ "Damage", 6666, "Single" },
						{
							"RandomSummon",
							{
								"Lezus 1-GD",
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD"
							}
						},
						{
							"RandomSummon",
							{
								"Lezus 1-GD",
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD"
							}
						}
					},
					Target = "Opponent"
				},
				Bio = "your memory walks as a roving ghost"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		EffectAnimation = "UNSPEAKABLE",
		Archetype = "Void",
		Color = "Red",
		Cost = { Red = 13 },
		CustomReminder = {
			["Apparition of Lezus"] = "You don't deserve to know what he does. Shield yourself in blissful ignorance; It's the only way you'll survive."
		},
		Effect = {
			Name = "Stud",
			Description = "Deal 6666 damage to a target fighter.\nYour opponent summons 2 apparitions of Lezus.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 6666, "Single" },
				{
					"RandomSummon",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
				},
				{
					"RandomSummon",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" }
				}
			},
			Target = "Opponent"
		},
		Bio = "Zanzel scoffed when she saw Lezus. These demons are why the world is so impure."
	},
	["Lezus 1"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 1-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["Lezus 1-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["The 1"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{ "The 2", "The 3", "The 4", "The 5", "The 6", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 1"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 6",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 1"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6",
								"Apparition of Lettuce 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Lettuce finish this, once and for all."
			},
			["Mintchocolate 1"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 1"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE\"!"
			},
			DUNDLE1 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{ "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE6", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 1-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "SetHealth", 1, "Ally" },
						{ "SetPower", 1, "Ally" },
						{ "Reset", 30, "Self" },
						{ "StrengthenHand", -10000, "Ally" },
						{ "HealHand", -10000, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		Color = "Red",
		Cost = { Red = 6 },
		HideArchetype = true,
		Archetype = "????",
		Transformant = "Lezus 2",
		Effect = {
			Name = "Stud",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750 },
				{ "SetHealth", 1, "Ally" },
				{ "SetPower", 1, "Ally" },
				{ "Reset", 30, "Self" },
				{ "StrengthenHand", -10000, "Ally" },
				{ "HealHand", -10000, "Ally" },
				{
					"RandomTransform",
					{ "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 2"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 2-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 2"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{ "The 1", "The 3", "The 4", "The 5", "The 6", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 2"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 6",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 2"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6",
								"Apparition of Lettuce 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Lettuce finish this, once and for all."
			},
			["Mintchocolate 2"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 2"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE\"!"
			},
			DUNDLE2 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE6", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 2-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Reset", 30, "Self" },
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 1-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 2-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "SetLife", 0.1, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 1-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		Color = "Red",
		Cost = { Red = 6 },
		HideArchetype = true,
		Archetype = "????",
		Transformant = "Lezus 3",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Reset", 30, "Self" },
				{ "SetLife", 0.1, "Ally" },
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 3"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 3-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 3"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{ "The 1", "The 2", "The 4", "The 5", "The 6", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 3"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud-Gulp", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 6",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 3"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6",
								"Apparition of Lettuce 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Lettuce finish this, once and for all."
			},
			["Mintchocolate 3"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 3"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE\"!"
			},
			DUNDLE3 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE4", "DUNDLE5", "DUNDLE6", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 3-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 1-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 3-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Red", 20, "Opponent" },
						{
							"AddGenZone",
							{ "Red Stud", 20 },
							"Opponent"
						},
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 1-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		HideArchetype = true,
		Archetype = "????",
		Color = "Red",
		Cost = { Red = 6 },
		Transformant = "Lezus 4",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750 },
				{ "Reset", 30, "Self" },
				{ "Red", 20, "Opponent" },
				{
					"AddGenZone",
					{ "Red Stud", 20 },
					"Opponent"
				},
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 2", "Lezus 4", "Lezus 5", "Lezus 6", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 4"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 4-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Addant = "Lezus 4-Hal",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 4"] = {
				Id = 8645462117,
				Name = "The",
				Addant = "The 4",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{ "The 1", "The 2", "The 3", "The 5", "The 6", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 4"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Addant = "Karkalicious 4",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 5",
								"Karkalicious 6",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 4"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Addant = "Apparition of Lettuce 4",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6",
								"Apparition of Lettuce 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Lettuce finish this, once and for all."
			},
			["Mintchocolate 4"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Addant = "Mintchocolate 4",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 5",
								"Mintchocolate 6",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 4"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Addant = "INTERLOPER 4",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 5",
								"INTERLOPER 6",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE!\""
			},
			DUNDLE4 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Addant = "DUNDLE4",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE5", "DUNDLE6", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 4-10Y"] = {
				Id = 139252452489471,
				Addant = "Lezus 4-10Y",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 1-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 4-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750, "Ally" },
						{ "Reset", 30, "Self" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{ "Add", "Addant", "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 1-GD",
								"Lezus 5-GD",
								"Lezus 6-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		HideArchetype = true,
		Archetype = "????",
		Addant = "Lezus 4",
		Color = "Red",
		Cost = { Red = 6 },
		Transformant = "Lezus 5",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750, "Ally" },
				{ "Reset", 30, "Self" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 5", "Lezus 6", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 5"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 5-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 6-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 5"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{ "The 1", "The 2", "The 3", "The 4", "The 6", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 5"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "ADeadBody14, Trained Assassin", "Opponent" },
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 6",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 5"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 6",
								"Apparition of Lettuce 7"
							},
							"Self"
						},
						Target = "Self"
					},
					Bio = "Lettuce finish this, once and for all."
				}
			},
			["Mintchocolate 5"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Addant = "Mintchocolate 4",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 6",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 5"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 6",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE!\""
			},
			DUNDLE5 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE6", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 5-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 1-10Y",
								"Lezus 6-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 5-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Reset", 30, "Self" },
						{ "Summon", "The Forgotten One", "Opponent" },
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 1-GD",
								"Lezus 6-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		Color = "Red",
		Cost = { Red = 6 },
		HideArchetype = true,
		Archetype = "????",
		Transformant = "Lezus 6",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750 },
				{ "Reset", 30, "Self" },
				{ "Summon", "The Forgotten One", "Opponent" },
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 6", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 6"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 6-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 7-Hal"
							},
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 7-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 6"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{ "The 1", "The 2", "The 3", "The 4", "The 5", "The 7" },
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{ "The 1", "The 2", "The 3", "The 4", "The 5", "The 7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 6"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 7"
							},
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 6"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 7"
							},
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 7"
							},
							"Self"
						}
					},
					Target = "Self",
					Bio = "Lettuce finish this, once and for all."
				}
			},
			["Mintchocolate 6"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Addant = "Mintchocolate 4",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 7"
							},
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 6"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 7"
							},
							"Ally"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 7"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE!\""
			},
			DUNDLE6 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE7" },
							"Self"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE7" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 6-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 1-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 1-10Y",
								"Lezus 7-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 6-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{
							"RandomSummon",
							{
								"Lezus 1-GD",
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 7-GD"
							},
							"Self"
						},
						{ "Reset", 30, "Self" },
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 1-GD",
								"Lezus 7-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Knife",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		Color = "Red",
		Cost = { Red = 6 },
		Archetype = "????",
		Transformant = "Lezus 7",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750 },
				{
					"RandomSummon",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 7" },
					"Ally"
				},
				{ "Reset", 30, "Self" },
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 7" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Lezus 7"] = {
		Id = 5566740653,
		Name = "Lezus",
		AltCards = {
			["Lezus 7-Hal"] = {
				Id = 7480400584,
				Name = "Noli",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 1-Hal",
								"Lezus 2-Hal",
								"Lezus 3-Hal",
								"Lezus 4-Hal",
								"Lezus 5-Hal",
								"Lezus 6-Hal"
							},
							"Self"
						}
					},
					Target = "Self"
				}
			},
			["The 7"] = {
				Id = 8645462117,
				Name = "The",
				Effect = {
					Description = "During your end step: You will embrace it.",
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{ "The 1", "The 2", "The 3", "The 4", "The 5", "The 6" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"Resonated, violated, agitated, infiltrated, inundated, motivated, long-awaited, instigated, cultivated, stimulated, manifested, integrated, acclimated, conjugated, activated, recreated, readapted, renovated, resurrected, reinfected, animated.\""
			},
			["Karkalicious 7"] = {
				Id = 11581897597,
				Name = "Karkalicious",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Karkalicious 1",
								"Karkalicious 2",
								"Karkalicious 3",
								"Karkalicious 4",
								"Karkalicious 5",
								"Karkalicious 6"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "KARKALICIOUS APPARITION MAKES TEREZI LOCO n/SHE WANTS TO KNOW THE SECRETS SHE CAN'T TASTE IN MY PHOTO"
			},
			["Apparition of Lettuce 7"] = {
				Id = 12326183090,
				Name = "Apparition of Lettuce",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Apparition of Lettuce 1",
								"Apparition of Lettuce 2",
								"Apparition of Lettuce 3",
								"Apparition of Lettuce 4",
								"Apparition of Lettuce 5",
								"Apparition of Lettuce 6"
							},
							"Self"
						}
					},
					Target = "Self",
					Bio = "Lettuce finish this, once and for all."
				}
			},
			["Mintchocolate 7"] = {
				Id = 12653995218,
				Name = "Xi_nal, The Mintchocolate",
				Addant = "Mintchocolate 4",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Mintchocolate 1",
								"Mintchocolate 2",
								"Mintchocolate 3",
								"Mintchocolate 4",
								"Mintchocolate 5",
								"Mintchocolate 6"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Punishment to Mint Chocolate Haters! A Sweet Gift for Mint Chocolate Lovers! Praise Xi_nal, the Mintchocolate Cult leader!"
			},
			["INTERLOPER 7"] = {
				Id = 12941996089,
				Name = "INTERLOPER",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"INTERLOPER 1",
								"INTERLOPER 2",
								"INTERLOPER 3",
								"INTERLOPER 4",
								"INTERLOPER 5",
								"INTERLOPER 6"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "\"CONGRATULATIONS AND WELCOME PLEASE PROCEED WITH CAUTION YOU ARE NOT WELCOME HERE!\""
			},
			DUNDLE7 = {
				Id = 80818373354636,
				Name = "DUNDLE",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{ "DUNDLE1", "DUNDLE2", "DUNDLE3", "DUNDLE4", "DUNDLE5", "DUNDLE6" },
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "I'm using tilt controls!"
			},
			["Lezus 7-10Y"] = {
				Id = 139252452489471,
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-10Y",
								"Lezus 3-10Y",
								"Lezus 4-10Y",
								"Lezus 5-10Y",
								"Lezus 6-10Y",
								"Lezus 1-10Y"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "Heaven's Abomination."
			},
			["Lezus 7-GD"] = {
				Id = 86158417115514,
				Name = "NTPinheiro: Abyss Angel",
				Effect = {
					Power = {
						{ "Cost", 750 },
						{ "Draw", 25, "Ally" },
						{ "Reset", 30, "Ally" },
						{
							"RandomTransform",
							{
								"Lezus 2-GD",
								"Lezus 3-GD",
								"Lezus 4-GD",
								"Lezus 5-GD",
								"Lezus 6-GD",
								"Lezus 1-GD"
							},
							"Self"
						}
					},
					Target = "Self"
				},
				Bio = "couldn't wait, couldn't handle all the love to pass through you."
			}
		},
		Health = 700,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Slash",
		Token = true,
		Undiscardable = true,
		CopyImmune = true,
		Color = "Red",
		Cost = { Red = 6 },
		Archetype = "????",
		Transformant = "Lezus 1",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: You will embrace god's gifts gratefully.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 750 },
				{ "Draw", 25, "Ally" },
				{ "Reset", 30, "Ally" },
				{
					"RandomTransform",
					{ "Lezus 1", "Lezus 2", "Lezus 3", "Lezus 4", "Lezus 5", "Lezus 6" },
					"Self"
				}
			},
			Target = "Self"
		},
		Bio = ""
	},
	["The Stalker"] = {
		Id = 10242872526,
		Name = "The Stalker",
		AltCards = {
			["The StalkerV2"] = {
				Id = 11973040124,
				AltArt = true,
				CopyBodge = "The StalkerV2",
				Bio = "Even you fear it."
			},
			["The Hugger"] = {
				Id = 10242874687,
				Name = "The Stocker",
				Bio = "Even Wall Street brokers fear him."
			},
			["Stalker-Chan"] = {
				Id = 127734044758474,
				Name = "Stalker-Chan",
				Bio = "A true senpai makes lesser girlfriends hunted instead of hunters."
			},
			["Nuke and Fluffle, Chaotic Duo"] = {
				Id = 11973093701,
				Name = "Nuke and Fluffle, Chaotic Duo",
				AltArt = true,
				AttackEffect = "RedScythe",
				Bio = "Let's burn this house down."
			},
			["Ignatuha000, Death"] = {
				Id = 17860392078,
				AltArt = true,
				Name = "Ignatuha000, Death",
				AttackEffect = "XhartyrSlash",
				Bio = "Ignatuha's favourite card and worst fear."
			}
		},
		Health = 2400,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "StalkerScratch",
		EffectAnimation = "TheStalkerStrike",
		DeathAnimation = "TheStalkerDeath",
		SummonAnimation = "TheStalkerSummon",
		SummonAnimationEffect = true,
		Color = "Red",
		Cost = { Red = 10 },
		Effect = {
			Name = "Combine Swipe",
			Description = "During your end step: This card deals 300 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "Opponent",
			Increase = 300
		},
		Bio = "A true monster turns hunters into hunted."
	},
	["Survivors of Perfection"] = {
		Id = 5594609488,
		Name = "Survivors of Perfection",
		AltCards = {
			["Survivors of Perfection-C"] = {
				Id = 11344341917,
				Name = "Bloxburg Festives",
				Transformant = "Survivors of Perfection-C",
				AttackEffect = "Divinity",
				Bio = "A phantom apocalypse and time paradox aren't going to get in the way of annual festivities any time soon."
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Tempest",
		Color = "Green",
		Cost = { Neutral = 3 },
		WeakenImmune = true,
		BypassOverdrive = true,
		TransformImmune = true,
		Archetype = "Survivor",
		Transformant = "Survivors of Perfection",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Transform all allied fighters into a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "Ally"
		},
		Bio = "Zanzel's people didn't get a vote in any of this. Their role was to witness it."
	},
	["Zanzel's Meddling"] = {
		Id = 5595944964,
		Name = "Zanzel's Meddling",
		AltCards = {
			["Zanzel's Meddling-C"] = {
				Id = 8256325511,
				Name = "Meddling Gift By Krampus",
				Bio = "Children given Black Studs for christmas often receive lethal doses of radiation."
			},
			["Restocking!"] = {
				Id = 81555808464541,
				Name = "Restocking!",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 403,
				Bio = "Yeep!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy the 2 newest cards in your hand.\nGive yourself 3 Green cards.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedRightMostHand" },
				{ "SpecificDiscard", 1, "AlliedRightMostHand" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" }
			},
			Target = "Ally"
		},
		Bio = "Zanzel looked over and operated the world like how a little girl does with her dollhouse."
	},
	["Mirror Man's Assault"] = {
		Id = 7861682960,
		Name = "Robloxity's Haunted Bike",
		AltCards = {
			["Robloxity's Haunted Bike-Sun"] = {
				Id = 9159899275,
				Name = "HAUNTED Robloxity Bike's Volleyball Spike",
				Summonant = "Robloxity's Haunted Bike Token-Sun",
				Bio = "HOW IS IT PLAYING ON IT'S OWN?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		CustomReminder = {
			["Robloxity's Haunted Bike"] = "A {W}{W}{G}{G} 800/400. It deals 200 damage to itself every time you end your turn without casting an action."
		},
		Summonant = "Mirror Man",
		Effect = {
			Name = "Haydoscale",
			Description = "Your opponent loses a {W}.\nSummon Robloxity's Haunted Bike, an 800/400 fighter.",
			Type = "OnSummon",
			Power = {
				{ "Neutral", -1, "Opponent" },
				{ "Summon", "Mirror Man" }
			},
			Target = "Ally"
		},
		Bio = "HOW IS IT MOVING ON IT'S OWN?"
	},
	["Mirror Man"] = {
		Id = 7861685090,
		Name = "Robloxity's Haunted Bike",
		AltCards = {
			["Robloxity's Haunted Bike Token-Sun"] = {
				Id = 9159864733,
				Name = "Haunted Robloxity Bike, Monster Volleyball MVP",
				Bio = "HOW IS IT PLAYING ON IT'S OWN?"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if you didn't cast an action this turn: This card deals 200 damage to itself.",
			Type = "OnEnd",
			Power = { { "Damage", 200, "Self" } },
			EffectRequirement = { "Playertable", "Me", 0, 1, "Actions" },
			Target = "Ally"
		},
		Bio = "\"Some forces are beyond my understanding.\" - Zanzel, the Promised One"
	},
	["Zanzel's Visions"] = {
		Id = 5392400529,
		Name = "Zanzel's Visions",
		AltCards = {
			["Unc's Revelations"] = {
				Id = 7397769741,
				Name = "Unc's Revelations",
				EffectAnimation = "UncRevelation",
				AltArt = true,
				Bio = "His mind freed from the Nightmare’s grip, he bore witness to infinite worlds with infinite possibilities. In them, endless conflict wracked with all sorts of tragedy. Unc barely held on against the subsequent devastation that followed."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		EffectAnimation = "ZanzelVision",
		Effect = {
			Name = "Haydoscale",
			Description = "All allied fighters generate.",
			Type = "OnSummon",
			Power = { { "Generate", 1 } },
			Target = "Ally"
		},
		Bio = "Those were cold, perfect worlds she saw. In them, beings capable of defying the very laws of reality. These visions shaped young Zanzel into the woman she is today."
	},
	["Unlikely Aid"] = {
		Id = 127312573823238,
		Name = "Heroic Survivor",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		Archetype = "Survivor",
		AttackEffect = "Bat",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 100 damage to a target fighter. Then if there's 4 or more allied Survivors, search your deck for each copy of 'Search the City.'",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 100 },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Single"
				},
				OnEVCheckPass = {
					Power = {
						{ "Tutorfor", "Search the City" },
						{ "Tutorfor", "Search2" },
						{ "Tutorfor", "Search3" },
						{ "Tutorfor", "Search4" },
						{ "Tutorfor", "Search5" },
						{ "Tutorfor", "Search the City" },
						{ "Tutorfor", "Search2" },
						{ "Tutorfor", "Search3" },
						{ "Tutorfor", "Search4" },
						{ "Tutorfor", "Search5" }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "Ally", 4, 999, "Survivor" },
					NoBlip = true
				}
			}
		},
		Bio = "Hope shines the brightest in these dark times."
	},
	["Beast Within"] = {
		Id = 5156404337,
		Name = "Detect Imperfection",
		AltCards = {
			["Detect Imperfection-C"] = {
				Id = 8251855977,
				Name = "Intense Frosted Mint",
				Bio = "This is how it feels to chew 5gum."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Instinct Release",
			Description = "Each fighter gains 200 health and power, then deal 200 damage to all fighters and they lose 200 power.\nSwap the stats of all fighters twice.\nLock all fighters for 2 turns then unlock them twice.\nAll players lose, then gain 200 life.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 },
				{ "Damage", 200 },
				{ "Weaken", 200 },
				{ "Swap", 100000 },
				{ "Swap", 100000 },
				{ "Lock", 1 },
				{ "Lock", 1 },
				{ "Unlock", 1 },
				{ "Unlock", 1 },
				{ "Inflict", 200 },
				{ "Inflict", -200 },
				{ "Draw", 1, "Ally" }
			},
			Target = "All"
		},
		Bio = "Only the innocent survive Zanzel's detection spell intact."
	},
	["Bloxburg in Ruins"] = {
		Id = 5461328503,
		Name = "Bloxburg in Ruins",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Terrain = true,
		Cost = { Green = 4 },
		Terrariant = "Bloxburg Terrain",
		EffectVariable = 0,
		Effect = {
			Name = "Instinct Release",
			Description = "At the start of your turns: Deal 250 damage to a random allied fighter and a random enemy fighter.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 250, "EVCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 250, "EVCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					NoBlip = true
				}
			}
		},
		Bio = "Zanzel despises ignorance and stupidity, and she sees it everywhere."
	},
	["Survivor Token"] = {
		Id = 5271606141,
		Name = "Survivor",
		AltCards = {
			["Survivor Empowered"] = { Health = 400, Power = 400 },
			["Survivor Overpowered"] = { Health = 800, Power = 800 },
			["Survivor Token-Hal"] = {
				Id = 7914378474,
				Name = "Stranglevines",
				AttackEffect = "Jab",
				Bio = "Serve me or become another broken pawn."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Survivor",
		Cost = { Green = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "I'm so happy that Hallow gave me shelter. I know he's gonna tax me to oblivion later, but I just don't care!"
	},
	["The Bloxgone Monster"] = {
		Id = 6022468146,
		Name = "The Bloxgone Monster",
		AltCards = {
			["Hal Arkwright"] = {
				Id = 10267431901,
				AltArt = true,
				Name = "Hal Arkwright",
				AttackEffect = "Gun",
				Bio = "Time is a flat circle."
			},
			["The Bloxgone Monster-Hal"] = {
				Name = "GL1TCH_M0N5T3R.EXE",
				Id = 7611298607,
				AttackEffect = "Scratch",
				Bio = "Description_txt.exe isn’t responding."
			},
			["The Bloxgone Monster-AN"] = {
				Name = "Eldritch Horror",
				Id = 9462801583,
				AttackEffect = "Scratch",
				Bio = "A piercing gaze, eternally vigilant."
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 6 },
		Overload = true,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: This card loses all of its power, then gains 50 power for each stud your opponent has.",
			Type = "OnEnd",
			Power = {
				{ "SetPower", 0, "Self" },
				{ "BloxgoneMonster", 50 }
			},
			Target = "Self"
		},
		Bio = "\"Save your periastrons for Zanzel. These monsters are yet temporary allies.\" - Lua, Paraselene Evincar"
	},
	["Purify the Brick"] = {
		Id = 10184739604,
		Name = "Purify The Brick",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 5 },
		Effect = {
			Name = "Haydoscale",
			Description = "You gain 6 {W}.",
			Type = "OnSummon",
			Power = { { "Neutral", 6 } },
			Target = "Ally"
		},
		Bio = "Zanzel knew the Brick's true power could be hers. The purification could rend the world. So be it. Not like it wasn't dead already."
	},
	["Alpha Brick's Presence"] = {
		Id = 5854984801,
		Name = "Alpha Brick's Presence",
		AltCards = {
			["Astral Foundation"] = {
				Name = "Astral Foundation",
				Id = 8288001100,
				AltArt = true,
				Terrariant = "Ouroboros Terrain",
				Bio = "He awoke within the remnants of beginning, middle, and end."
			},
			["Minecartnoob's Pile of Cool Stuff"] = {
				Name = "Minecartnoob's Pile of Cool Stuff",
				Id = 17017872710,
				AltArt = true,
				Bio = "“why do I have all this stuff? I dunno, it's just some things I saw that looked cool.”<br/>“... hey! I'm not a hoarder, you are!”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Era",
		Terrain = true,
		BypassOverdrive = true,
		Terrariant = "Presence Terrain",
		Cost = { Neutral = 4, Green = 4 },
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
	["Survivor's Shelter"] = {
		Id = 5594199328,
		Name = "Survivor's Shelter",
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Archetype = "Survivor",
		Cost = { Green = 4 },
		TransformImmune = true,
		TargetImmune = true,
		BypassOverdrive = true,
		Transformant = "Survivor's Shelter",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Transform all allied fighters into it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "AllyTransformBodge"
		},
		Bio = "We're safe...for now."
	},
	["Search the City"] = {
		Id = 6276602545,
		AltCards = {
			["Search the Bacon"] = {
				Name = "Search the Bacon",
				Id = 140174742648932,
				AltArt = true,
				Effect = {
					Name = "Haydoscale",
					Description = "Level 1.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "DeckAdd", "SearchBacon2" }
					},
					Target = "Ally"
				},
				PremiumArt = 847,
				Bio = "Issac you’re cooked"
			}
		},
		Name = "Search the City",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Archetype = "Survivor",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		AlternateCost = { Green = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "Survivor" },
		CustomReminder = {
			["Spoils of the Wellspring"] = "1 — You gain 500 life.\n 2 — Summon a 300/300 Survivor.\n3 — All allied fighters gain 200 health and power.\n4 — Destroy a target fighter.\n5 — Give yourself 6 Green cards.",
			["Don't Let Zanzel Find You"] = "A fleeting card in your hand is destroyed if it's not cast by your end step."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Level 1.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "DeckAdd", "Search2" }
			},
			Target = "Ally"
		},
		Bio = "David Crissbach needs to lead a ragtag group of refugees to the Vitality Wellspring. Can you help him avoid Zanzel?"
	},
	Search2 = {
		Id = 6276603018,
		Name = "Search the City",
		AltCards = {
			SearchBacon2 = {
				Name = "Evil Bacon",
				Id = 90594798024693,
				Effect = {
					Name = "Haydoscale",
					Description = "Level 2.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "Summon", "Survivor Token" },
						{ "DeckAdd", "SearchBacon3" }
					},
					Target = "Ally"
				},
				Bio = "Don't ask, I regret this avatar as well"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		AlternateCost = { Green = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "Survivor" },
		Archetype = "Survivor",
		Fleeting = true,
		CustomReminder = {
			["Spoils of the Wellspring"] = "1 — You gain 500 life.\n 2 — Summon a 300/300 Survivor.\n3 — All allied fighters gain 200 health and power.\n4 — Destroy a target fighter.\n5 — Give yourself 6 Green cards."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Level 2.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Summon", "Survivor Token" },
				{ "DeckAdd", "Search3" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	Search3 = {
		Id = 6276603400,
		Name = "Search the City",
		AltCards = {
			SearchBacon3 = {
				Name = "Samurai Bacon",
				Id = 130685903398048,
				Effect = {
					Name = "Haydoscale",
					Description = "Level 3.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "Summon", "Survivor Token" },
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{ "DeckAdd", "SearchBacon4" }
					},
					Target = "Ally"
				},
				Bio = "B)"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		AlternateCost = { Green = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 3, 9999, "Survivor" },
		Archetype = "Survivor",
		Fleeting = true,
		CustomReminder = {
			["Spoils of the Wellspring"] = "1 — You gain 500 life.\n 2 — Summon a 300/300 Survivor.\n3 — All allied fighters gain 200 health and power.\n4 — Destroy a target fighter.\n5 — Give yourself 6 Green cards."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Level 3.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Summon", "Survivor Token" },
				{ "Heal", 200 },
				{ "Strengthen", 200 },
				{ "DeckAdd", "Search4" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	Search4 = {
		Id = 6276603816,
		AltCards = {
			SearchBacon4 = {
				Name = "Chief",
				Id = 133521091602102,
				Effect = {
					Name = "Haydoscale",
					Description = "Level 4.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -500 },
						{ "Summon", "Survivor Token" },
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{ "Destroy", 30, "Single" },
						{ "DeckAdd", "SearchBacon5" }
					},
					Target = "Ally"
				},
				Bio = "LET ME COOK and also i love pineapple on pizza"
			}
		},
		Name = "Search the City",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		AlternateCost = { Green = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 4, 9999, "Survivor" },
		Archetype = "Survivor",
		Fleeting = true,
		CustomReminder = {
			["Spoils of the Wellspring"] = "1 — You gain 500 life.\n2 — Summon a 300/300 Survivor.\n3 — All allied fighters gain 200 health and power.\n4 — Destroy a target fighter.\n5 — Give yourself 6 Green cards."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Level 4.\nCast this card for free if there's as many allied survivors as this card's level.\nShuffle a fleeting, levelled up copy of this card in your deck.\nApply the reminded effects up to this card's level.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Summon", "Survivor Token" },
				{ "Heal", 200 },
				{ "Strengthen", 200 },
				{ "Destroy", 30, "Single" },
				{ "DeckAdd", "Search5" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	Search5 = {
		Id = 6276604260,
		AltCards = {
			SearchBacon5 = {
				Name = "Bacon",
				Id = 134419687137738,
				Effect = {
					Name = "Haydoscale",
					Description = "Max Level (5).\nCast this card for free if there's as many allied survivors as this card's level.\nApply the reminded effects up to this card's level.",
					Type = "OnSummon",
					Power = {
						{ "Cost", -1000 },
						{ "Summon", "Survivor Empowered" },
						{ "Summon", "Survivor Empowered" },
						{ "Summon", "Survivor Empowered" },
						{ "Summon", "Survivor Empowered" },
						{ "Heal", 400 },
						{ "Strengthen", 400 },
						{ "Destroy", 30, "Single" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" },
						{ "RandomAdd", "MonoOnlyorGreenCost Green" }
					},
					Target = "Ally"
				},
				Bio = "LET ME COOK and also i love pineapple on pizza"
			}
		},
		Name = "Search the City",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		AlternateCost = { Green = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 5, 9999, "Survivor" },
		Archetype = "Survivor",
		Fleeting = true,
		CustomReminder = {
			["Spoils of the Wellspring"] = "1 — You gain 500 life.\n2 — Summon a 300/300 Survivor.\n3 — All allied fighters gain 200 health and power.\n4 — Destroy a target fighter.\n5 — Give yourself 6 Green cards."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Max Level (5).\nCast this card for free if there's as many allied survivors as this card's level.\nApply the reminded effects up to this card's level.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -1000 },
				{ "Summon", "Survivor Empowered" },
				{ "Summon", "Survivor Empowered" },
				{ "Summon", "Survivor Empowered" },
				{ "Summon", "Survivor Empowered" },
				{ "Heal", 400 },
				{ "Strengthen", 400 },
				{ "Destroy", 30, "Single" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["Wrath of King Gecko"] = {
		Id = 10288366099,
		Name = "Secrets of Swinburne",
		AltCards = {
			["A Taste of Music"] = {
				Name = "A Taste of Music",
				Id = 9299929188,
				AltArt = true,
				AttackEffect = "Knife",
				Effect = {
					Name = "Toasty",
					Description = "Summon Nervous Young Fluff, a 2000/1000 fighter, and Aziza, a 1200/200 fighter.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Nervous Young Fluff" },
						{ "Summon", "Aziza" }
					},
					Target = "Ally"
				},
				Bio = "\"If I stacked up all the hours I wasted, I could climb straight to heaven. | Oh, and in case I don't see you, good afternoon, good evening, and good night.\""
			},
			yearning = {
				Name = "yearning",
				Id = 127420115453347,
				AltArt = true,
				AttackEffect = "Knife",
				Commissioner = { "ManixDash" },
				Effect = {
					Name = "Toasty",
					Description = "Summon a Crude imitation, a 2000/1000 fighter, and an ideal, a 1200/200 fighter.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "A Crude Imitation" },
						{ "Summon", "an ideal" }
					},
					Target = "Ally"
				},
				PremiumArt = 771,
				Bio = "my body's made of lies"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 9 },
		CustomReminder = {
			blXhd = "A 2000/1000 bewtiched fighter. During your end step, it gains 200 health.",
			["The Void Star"] = "A 1200/200 bewitched fighter. It destroys all allied bewitched fighters when it dies."
		},
		Effect = {
			Name = "Toasty",
			Description = "Summon blXhd and the Void Star, both bewitched fighters. Effects can't transform them.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "King Gecko" },
				{ "Summon", "Gecko Attendant" }
			},
			Target = "Ally"
		},
		Bio = "HERE, where the world is quiet."
	},
	["King Gecko"] = {
		Id = 10288373363,
		Name = "blXhd",
		AltCards = {
			Aziza = {
				Name = "Aziza",
				Id = 9299993633,
				AttackEffect = "Jab",
				Bio = "\"We also talked about... a deeper bond, with the product; Nostalgia.\""
			},
			["A Crude Imitation"] = {
				Name = "a Crude imitation",
				Id = 82844564245060,
				AttackEffect = "Jab",
				Bio = "\"For real.\""
			}
		},
		Health = 2000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 7 },
		Archetype = "Bewitched",
		TransformImmune = true,
		Effect = {
			Name = "Toasty",
			Description = "During your end step: This card gains 200 Health.",
			Type = "OnEnd",
			Power = { { "Heal", 200 } },
			Target = "Self"
		},
		Bio = "The first ROBLOXian to uncover The Void Star. All of the crown's power surges through him."
	},
	["Gecko Attendant"] = {
		Id = 10288371766,
		Name = "The Void Star",
		AltCards = {
			["Nervous Young Fluff"] = {
				Name = "Nervous Young Fluff",
				Id = 9299929440,
				Bio = "\"Gonna get so high, up in the sky. Gonna get so high, gonna forget you died.\""
			},
			["an ideal"] = {
				Name = "an ideal",
				Id = 84442788455899,
				Bio = "\"What does honesty get you? Honesty doesn't pay!\""
			}
		},
		Health = 1200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 7 },
		Archetype = "Bewitched",
		TransformImmune = true,
		Effect = {
			Name = "Toasty",
			Description = "When this card dies: Destroy all allied bewitched fighters.",
			Type = "OnDeath",
			Power = { { "Destroy", 9999 } },
			Target = "AlliedArchetype"
		},
		Bio = "\"Void Star to zer0, Foolishly dereferenced. No call stack. All g0ne.\""
	},
	["Traumatic Clown"] = {
		Id = 10288620439,
		Name = "G0Z",
		CopyBodge = "Traumatic Clown",
		AltCards = {
			["Traumatic ClownAlt"] = {
				Id = 10288623670,
				Name = "Traumatic Clown",
				CopyBodge = "Traumatic ClownAlt",
				AltArt = true,
				AttackEffect = "Knife",
				Bio = "Each time he remembers what he has done, the more twisted the event becomes."
			},
			["Eminence, The Retired Bloxxer"] = {
				Id = 132017910130536,
				Name = "Eminence, The Retired Bloxxer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 711,
				Bio = "Since the war of the 4 doomspire towers, he has retired back at his home in Robloxia, to live a life he always wanted in perfect immortality."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		SummonAnimation = "ClownHonk",
		DeathAnimation = "ClownDeath",
		Color = "Green",
		Cost = { Green = 3 },
		WeakenImmune = true,
		SwapImmune = true,
		SetImmune = true,
		StrengthenImmune = true,
		HealImmune = true,
		DamageImmune = true,
		ReturnImmune = true,
		DestroyImmune = true,
		TargetImmune = true,
		SuspendImmune = true,
		DivideImmune = true,
		TransformImmune = true,
		Effect = {
			Name = "Stalwart Barrier",
			Description = "",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "As the demons looked for Zanzel, the innocent people realised a fatal mistake: The enemy of their enemy is not their friend."
	},
	["Cat Ears Maid"] = {
		Id = 10288772827,
		Name = "Yorick",
		AltCards = {
			["Yorick-Rolled"] = {
				Id = 10288775493,
				Name = "Yorick-Rolled",
				Bio = "Were you expecting something else? Happy April Fools 2021!"
			},
			["Yorick-AN"] = {
				Id = 9347949443,
				Name = "Cat Ears Maid",
				AttackEffect = "Scratch",
				Bio = "\"One refreshing Bloxy Cola coming up!\""
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 1 },
		Effect = {
			Name = "Refreshing Treats",
			Description = "Whenever this card attacks: All other allied fighters gain 200 health.",
			Type = "OnAttack",
			Power = { { "Heal", 200, "CustomTarget" } },
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "OtherCards"
			},
			Target = "Ally"
		},
		Bio = "Alas, poor Yorick."
	},
	["Sublime Purity"] = {
		Id = 10288652319,
		Name = "Sublime Purity",
		AltCards = {
			["Sublime Purity-AN"] = { Id = 9352957156, Name = "Filthy Pranks", Bio = "PRANKED!" },
			["Why did I commission this"] = {
				Id = 104679586727849,
				Name = "Why did I commission this.",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 519,
				Bio = "\"Yo its me rayburn89 its 2:21am rn and I wanna rant rq. Why did I do this, why did I make this stupid thing a reality. I don't even like this card I think its lame as sin, I only run it because krxef puts its in all of their decks and I'm too lazy to sub it out for anything else. This joke isn't funny, no one will care about a Labubu in like 3 months, filthy pranks is an objectively funnier alt art just run that instead.\" - rayburn89"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		EffectAnimation = "SublimePurityEffect",
		Color = "Green",
		Cost = { Neutral = 2, Yellow = 2, Green = 2 },
		Fading = true,
		CustomReminder = {
			["Terror of the New Age"] = "A Terrified fighter is obliterated if it's in play during its end steps."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Unlock all fighters and they become terrified.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999, "All" },
				{ "GivePassive", "Terrified" }
			},
			Target = "All"
		},
		Bio = "Zanzel was amazed at their power, but this strength was destined to die off."
	},
	["Absolute Confrontation"] = {
		Id = 10288466419,
		Name = "Absolute Confrontation",
		AltCards = {
			["Seal the Moonbreaker"] = {
				Id = 10288469537,
				Name = "Seal the Moonbreaker",
				AltArt = true,
				Effect = {
					Name = "Haydoscale",
					Description = "Summon Celastia, a 3000/3000 fighter. Your opponent summons a 2000/2000 Eclipse.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Celastia, Lunar Goddess" },
						{ "Summon", "Eclipse, The Moonbreaker", "Opponent" }
					},
					Target = "Ally"
				},
				Bio = "The ancient Paraselene confronted Eclipse. Fueled by the rage of their losses, they fought tooth and nail in order to banish Eclipse once and for all."
			},
			["Parallel Calamities"] = {
				Id = 9791896890,
				Name = "Parallel Calamities",
				Effect = {
					Name = "Haydoscale",
					Description = "Summon Conquista, a 3000/3000 fighter. Your opponent summons Zanzel, a 2000/2000 fighter.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "PCConquista" },
						{ "Summon", "PCZanzel", "Opponent" }
					},
					Target = "Ally"
				},
				Bio = "With each step taken towards their light, they stomp the fluttering lives beneath them for their perfect world, against the world."
			},
			["Battle of Justices"] = {
				Id = 12504267507,
				Name = "Battle of Justices",
				AltArt = true,
				Commissioner = { 1105140151 },
				Effect = {
					Name = "Haydoscale",
					Description = "Summon Takashi Yagami, a 3000/3000 fighter. Your opponent summons Hitoshi Kuwana, a 2000/2000 fighter.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Takashi Yagami" },
						{ "Summon", "Hitoshi Kuwana", "Opponent" }
					},
					Target = "Ally"
				},
				Bio = "<i>Two opposing ideologies, no right answers.</i>"
			},
			["a friendly match"] = {
				Id = 113874380447408,
				Name = "a friendly match",
				AltArt = true,
				PremiumArt = 417,
				Effect = {
					Name = "Haydoscale",
					Description = "Summon front-facing roxy, a 3000/3000 fighter. Your opponent summons the false prophet, a 2000/2000 fighter.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "front-facing roxy" },
						{ "Summon", "the false prophet", "Opponent" }
					},
					Target = "Ally"
				},
				Bio = "if i win, i have won against a god. but if i lose, everyone here will die."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Red = 6, Green = 6 },
		CustomReminder = {
			["Eclipse, Werewolf Colossus"] = "A 3000/3000 fighter that is immune to damage effects. Thrice each turn, whenever you discard a card: Deal 600 damage to all fighters. This card gains 600 health.",
			["Ultra Annihilator"] = "A 2000/2000 fighter that is immune to all damage. Whenever an allied fighter dies: Summon an Ultra Otherer. This card loses 200 health."
		},
		AddBlock = true,
		Rank = 7,
		Effect = {
			Name = "Haydoscale",
			Description = "Summon Eclipse, a 3000/3000 lycanthrope. Your opponent summons a 2000/2000 Ultra Annihilator.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Eclipse, Werewolf Colossus" },
				{ "Summon", "Ultra Annihilator", "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Eclipse's long awaited revival turned the tide in the conflict. The Ultras would not stand for another apex predator in their new world."
	},
	["Priestess Zanzel, the Promised One"] = {
		Id = 10187069017,
		Name = "Priestess Zanzel, the Promised One",
		AltCards = {
			["Zanzel-Alt"] = {
				Id = 5642983109,
				AltArt = true,
				Name = "Priestess Zanzel, the Promised One",
				AttackEffect = "Inferno",
				Bio = "Perfection is not the same as beauty. Not that I don't mind you calling me that, worm."
			},
			PeaceZanzel = {
				Id = 8700025893,
				Name = "平和 Zanzel",
				AttackEffect = "Katana",
				Bio = "To achieve true perfection, one must achieve balance in oneself. This card is a Chinese New Year Alt Art of Priestess Zanzel, the Promised One."
			},
			["Zanzel, Perfected-Alt"] = {
				Id = 15690136389,
				Name = "Zanzel, Perfected",
				AttackEffect = "Gravity",
				PackDisplayOverride = "Zanzel, Perfected Raid",
				Bio = "Recognition of perfection, perfected beyond recognition."
			},
			["Zanzel-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 136380399353977,
				AttackEffect = "Gravity",
				Bio = "Thou wilt abandon flesh and be born again."
			}
		},
		Health = 1300,
		Power = 1300,
		Rarity = "Legendary",
		AttackEffect = "Gravity",
		Color = "Green",
		Cost = { Green = 13 },
		TransformImmune = true,
		Effect = {
			Description = "When this card is cast: You can't attack or cast anything else this turn.\nWhenever your opponent targets this card: Set their Life to 1.\nWhenever this card attacks your opponent directly: They instantly lose the game.",
			Ability = {
				OnSummon = {
					Power = {
						{ "BypassAttack", 30, "Ally" },
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
				OnTargetByEnemy = {
					Power = { { "SetLife", 1 } },
					Target = "Opponent"
				},
				OnStrike = {
					Power = { { "Inflict", 99999999 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Mankind shall soon tread upon the path to perfection."
	},
	Zanzel = {
		Id = 5995716107,
		Name = "Priestess Zanzel, the Promised One",
		CopyBodge = "Zanzel",
		AltCards = {
			["Zanzel-AltToken"] = {
				Id = 5642983109,
				Name = "Priestess Zanzel, the Promised One",
				CopyBodge = "Zanzel-AltToken",
				Bio = "Perfection is not the same as beauty. Not that I don't mind you calling me that, worm."
			}
		},
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
	["1x1x1x1"] = {
		Id = 10980793256,
		AltCards = {
			["1x1x1x1x2"] = {
				Id = 10980800956,
				CopyBodge = "1x1x1x1x2",
				AltArt = true,
				Bio = "Zanzel scoffed at the devil when she saw him. He was why everything in this world was stagnant and impure. The power the Alpha Brick had to sacrifice just to deal with him!"
			},
			["1x1x1x1v2"] = {
				Id = 10980802074,
				AltArt = true,
				CopyBodge = "1x1x1x1v2",
				Effect = {
					Name = "H$X",
					Description = "When this card is cast: Set the power of all fighters to 250."
				},
				Bio = "You should all be scared. I will come back one day, you will see."
			},
			["Milady Arcanika"] = {
				Id = 10288385616,
				Name = "Milady Arcanika",
				AltArt = true,
				AttackEffect = "MagicGreen",
				Bio = "When hope is lost, she is the only one that can make it change."
			}
		},
		Name = "1x1x1x1",
		Health = 1500,
		Power = 250,
		Rarity = "Legendary",
		AttackEffect = "Tempest",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		Effect = {
			Name = "Even Out",
			Description = "When this card is cast: Set the power of all fighters to 250.",
			Type = "OnSummon",
			Power = { { "SetPower", 250 } },
			Target = "All"
		},
		Bio = "Zanzel could make much better use of the Alpha Brick than this pathetic demon. The demon disagreed."
	},
	["Hallow's Enforcer"] = {
		Id = 5271603842,
		Name = "Hallow's Enforcer",
		AltCards = {
			["Hallow's Enforcer-Hal"] = {
				Name = "DIY Umberhallow",
				Id = 7468270087,
				AttackEffect = "Scythe",
				Bio = "\"If you're going to cosplay me, at least go the extra mile...\""
			},
			["Last Leepy"] = {
				Name = "Last Leepy",
				Id = 9381272463,
				AltArt = true,
				AttackEffect = "Slash",
				Bio = "People die when they are killed."
			},
			RAYBLOOD89 = {
				Id = 114754452868069,
				Name = "RAYgreenjuice89",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 525,
				Bio = "Lemon-Lime is a great flavor!"
			},
			TheTiesEVIL = {
				Id = 97164882423303,
				Name = "TheTiesEVIL",
				Commissioner = { "TheTiesWhite" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 696,
				Bio = "1M EV1L! MW4H4H4H444444!"
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Scythe",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Archetype = "Vibeshark",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, or when it dies: All allied Vibesharks gain 100 power. Deal 100 damage to all other fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 100, "AlliedArchetype" },
						{ "Damage", 100, "AlliedNotArchetype" },
						{ "Damage", 100, "Opponent" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "Strengthen", 100, "AlliedArchetype" },
						{ "Damage", 100, "AlliedNotArchetype" },
						{ "Damage", 100, "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The Vibesharks always collect on their debt. Their debt being a good time."
	},
	["Hallow's Eradicator"] = {
		Id = 5556283622,
		Name = "Hallow's Eradicator",
		AltCards = {
			["Hallow's Eradicator-Hal"] = {
				Name = "Hallow's Eradicator",
				Id = 7622042115,
				AttackEffect = "Slash",
				Bio = "\"The punishment for stealing candy from a baby? Death.\"\""
			}
		},
		Health = 450,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Flare",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Archetype = "Vibeshark",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, or when it dies: Each player destroys the oldest card in their hand, then draws a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SpecificDiscard", 1, "LeftMostHand" },
						{ "Draw", 1, "All" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "SpecificDiscard", 1, "LeftMostHand" },
						{ "Draw", 1, "All" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Hallow wishes to give all his children all the fun in the entire world. What responsible parent wouldn't?"
	},
	["Hallow's Knight"] = {
		Id = 5832369051,
		Name = "Hallow's Knight",
		AltCards = {
			["Hallow's Knight-Hal"] = {
				Id = 7914331235,
				Name = "The Great Pumpking",
				Summonant = "Survivor Token-Hal",
				AttackEffect = "Blaze",
				Bio = "\"Watch your tone, little boy. Some pumpkins don't kneel to third-rate demons.\""
			}
		},
		Health = 600,
		Power = 450,
		Rarity = "Rare",
		Transformant = "Knight Token",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 5 },
		Archetype = "Vibeshark",
		Summonant = "Survivor Token",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, or when it dies: Summon a 300/300 Survivor. All fighters generate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Generate", 1, "All" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Generate", 1, "All" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "When the survivors from Bloxburg poured into Shambeth, Hallow wanted nothing to do with them. Kalman, ever the bleeding heart, was all that was needed to change his mind."
	},
	["Hallow's Adjudicator"] = {
		Id = 5641474236,
		Name = "Hallow's Adjudicator",
		AltCards = {
			["Hallow's Adjudicator-Hal"] = {
				Id = 7610998164,
				AttackEffect = "Scorch",
				Bio = "\"Ah, Lua. Concerning your 'fine', it is now: 1 pack of Studdles, 200 individually wrapped Holly Jolly Rancho-Ranchers, 5 crates of Alpha Brickburst, 30 packages of Popping 1x1 Studs, 4 boulder-sized Jawbreakers, several Dark Matter Gushers, a bar of your Paraselene branded infinitely regenerating chocolate...\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 8 },
		Archetype = "Vibeshark",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, or when it dies: All players gain {W}{W}{W}.",
			Ability = {
				OnSummon = {
					Power = { { "Neutral", 3, "All" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Neutral", 3, "All" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Your vibes, Lua. Hand them over.\""
	},
	["Happy Clown"] = {
		Id = 10279303570,
		Name = "Happy Clown",
		AltCards = {
			["Happy Clown-Hal"] = {
				Id = 10279305802,
				Bio = "He doesn't appreciate amateurs getting in his way."
			},
			kpenkeenan = {
				Id = 10279307475,
				Name = "Kpen",
				AltArt = true,
				AttackEffect = "Gravity",
				Bio = "The best card."
			},
			["Happy Clown-C"] = { Id = 11675509149, Bio = "" },
			["Happy Clown-ET"] = {
				Name = "Mekkai Mailmanager",
				Id = 16446073648,
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Bio = "-mail for you and mail for me!- -mail for everybody!-"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
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
	["Hallow's Bargain"] = {
		Id = 10279396887,
		Name = "Hallow's Bargain",
		AltCards = {
			["Hallow's Bargain-Hal"] = {
				Name = "The Ouija Board",
				Id = 10279399899,
				Bio = "\"I'm telling you, these kids just summon us for fun! Not that I'm complaining, it's so easy to make them commit fraud for me.\""
			},
			["Hallow's Bargain-Senzura"] = {
				Name = "Doomsdays Celebration",
				Id = 122629043911182,
				Bio = "Once knowing their demise, they crowd up and socialize about their lives before it ends."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "All players summon a random fighter.",
			Type = "OnSummon",
			Power = {
				{ "RandomSummon", "Fighter" },
				{ "RandomSummon", "Fighter", "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "He drives a hard bargain, but only on Friday."
	},
	["Pumpkin Carver"] = {
		Id = 10279344979,
		Name = "Pumpkin Carver",
		AltCards = {
			["Candy Carver"] = {
				Id = 10310643402,
				Name = "Candy Carver",
				Effect = {
					Description = "When this card is cast: Give yourself a Pumpkin Spice.",
					Power = { { "Add", "Pumpkin Spice" } }
				},
				Bio = "\"This one's bound to blow your tastebuds away! (Probably because of the 1000 grams of strong mints I put in this thing...)\""
			}
		},
		Health = 450,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Pumpkin Bomb"] = "A {R} action. It deals 250 damage to a target fighter."
		},
		Effect = {
			Name = "Halloween",
			Description = "When this card is cast: Give yourself a Pumpkin Bomb.",
			Type = "OnSummon",
			Power = { { "Add", "Pumpkin Bomb" } },
			Target = "Ally"
		},
		Bio = "Hallow once asked his grunts to make 100,000 pumpkin bombs in a day. Unfortunately for him, it was Wednesday."
	},
	["Shambeth Gargoyle"] = {
		Id = 10279351025,
		Name = "Shambeth Gargoyle",
		AltCards = {
			Machi = {
				Id = 10279352867,
				Name = "Machi",
				AltArt = true,
				AttackEffect = "Divinity",
				Bio = "Dreaming is so much fun when you can collect stars! Wait you guys can't control your dreams?"
			},
			["Shambeth Gargoyle-AN"] = {
				Id = 9829928291,
				Name = "Smiling Golem",
				Bio = "Zanzel went just a bit too far with this golem."
			}
		},
		Health = 1000,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever a player casts a Money Stack card: This card gains 200 Power.",
			Type = "OnAnyCast",
			Power = { { "Strengthen", 200 } },
			Target = "Self",
			Archetype = "Money"
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "Hallow makes sure people pay up to see his attractions."
	},
	["Asylum Seeker"] = {
		Id = 76822736302744,
		Name = "Asylum Seeker",
		AltCards = {
			["Army of Kingwither240"] = {
				Id = 7914328259,
				Name = "Army of Kingwither240",
				AltArt = true,
				AttackEffect = "Slash",
				Transformant = "Army of Kingwither240",
				Bio = "Breadknight warriors, unite!"
			},
			["Asylum Seeker-Sun"] = {
				Id = 9150935698,
				Name = "Sharknado Survivors",
				AttackEffect = "Bubbles",
				Transformant = "Asylum Seeker-Sun",
				Bio = "These guys just can't catch a break."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		Archetype = "Survivor",
		AttackEffect = "Knife",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 1 },
		TransformImmune = true,
		Mitigation = 100,
		Transformant = "Asylum Seeker",
		Effect = {
			Name = "Halloween",
			Description = "This card takes 100 less damage from combat.\nWhen this card is cast: Transform all allied fighters into a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Transformant" } },
			Target = "Ally"
		},
		Bio = "Combat is no longer optional in this once peaceful town. Better bring a friend."
	},
	["Incredibly Friendly and Helpful Devil"] = {
		Id = 5196343152,
		Name = "Incredibly Friendly and Helpful Devil",
		AltCards = {
			["Cursed Mirror"] = {
				Name = "Cursed Mirror",
				Id = 8855308883,
				AttackEffect = "MagicYellow",
				Bio = "Rumour has it that if you say 'Skill Issue' three times at midnight, the spirit will jump out of the mirror and girotte you."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "HollowScythe",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Rank = 8,
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
	["Soul Tax"] = {
		Id = 10279207970,
		Name = "Soul Tax",
		AltCards = {
			["Disturbing Threats"] = {
				Id = 76822736302744,
				Name = "Inverted Bear Trap",
				Bio = "Do you want to play a game?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		EffectVariable = 0,
		CustomReminder = {
			["Scammer's Integrity"] = "For the exchange to happen, a card must exist in both zones to be swapped."
		},
		Effect = {
			Name = "Halloween",
			Description = "Exchange a random non-token fighter card in your opponent's baseplate with a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Opponent", "NotTokenFighter", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "NotTokenFighter", "GenZone_Opponent", "Field_Opponent", true, false }
						},
						{ "MoveGenZone" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Hallow's usual jovial behaviour masks how ruthless he is when he collects the debt you owe."
	},
	["Castle Shambeth"] = {
		Id = 5414966351,
		Name = "Castle Shambeth",
		AltCards = {
			["Castle Shambeth-Hal"] = {
				Id = 7472554479,
				Name = "Doll House",
				Terrariant = "Doll Terrain",
				Bio = "You're all my playthings."
			},
			["The Kaleidoscopic Cyclone"] = {
				Id = 11435979830,
				Name = "The Kaleidoscopic Cyclone",
				Terrariant = "Cyclone Terrain",
				AltArt = true,
				Bio = "<i>It was of a once fond memory, oh so beautiful.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Terrain = true,
		Terrariant = "Shambeth Terrain",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		CustomReminder = {
			["Scammer's Charisma"] = "A fleeting card in your hand is destroyed if it's not cast by your next end step."
		},
		Effect = {
			Name = "Halloween",
			Description = "At the start of each player's turn: That player gains a {W} and draws a fleeting card.",
			Type = "OnStart",
			Power = {
				{ "Draw", 1, "CurrentTurn" },
				{ "Neutral", 1, "CurrentTurn" }
			},
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "The eccentric home of Hallow, and head office of his crime enterprise. He wishes his kids came to visit more often..."
	},
	["Hunt the Godbeast"] = {
		Id = 10279133112,
		Name = "Hunt the Godbeast",
		AltCards = {
			["Ice Cream Rush"] = {
				Id = 10279134772,
				Name = "Ice Cream Rush",
				Bio = "Squid Matcha Icecream is noted to have 10% of the recommended daily intake of sugar and 190% of the recommended yearly intake of disgust.",
				Effect = {
					Name = "Halloween",
					Description = "Summon an 800/400 Lil' Devil with Haste. Deal 100 damage to all fighters.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Lil' Devil", "Ally" },
						{ "Damage", 100 }
					},
					Target = "All"
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		CustomReminder = {
			["Godbeast Whelp"] = "A ⚪⚪⚪⚪ 800/400 token fighter with haste. If it would take noncombat damage, instead return it its hand and search your deck for 'Angelic Godbeast'."
		},
		Effect = {
			Name = "Halloween",
			Description = "Summon an 800/400 Godbeast Whelp.\nDeal 100 damage to all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Godbeast Whelp", "Ally" },
				{ "Damage", 100 }
			},
			Target = "All"
		},
		Bio = "\"Godbeasts are theoretically impossible to exist in our material plane. Tonight we hunt one, dear.\" - Hallow, to Terry"
	},
	["Godbeast Whelp"] = {
		Id = 10279163018,
		Name = "Godbeast Whelp",
		AltCards = {
			["Lil' Devil"] = {
				Id = 10279166277,
				Name = "Lil' Devil",
				AttackEffect = "FirePunch",
				Bio = "\"Don't mess with me, or my Mom'll mess with you!\""
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Flare",
		Charge = true,
		DamageImmune = true,
		Color = "Yellow",
		Archetype = "Godbeast",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Halloween",
			Description = "If this card would take noncombat damage: Search your deck for 'Angelic Godbeast' instead. Return this card to its hand.",
			Type = "OnEffectDamage",
			Power = {
				{ "Unlock", 9999, "Self" },
				{ "Tutorfor", "Hallow, the Sugarlord" },
				{ "Return", 30, "Self" }
			},
			Target = "Ally"
		},
		Bio = "\"In truth, Godbeasts only remain for as long as they need to. Grab the child and the mother is sure to stay.\" - Hallow, to Kalman"
	},
	["Consult the Archives"] = {
		Id = 10279111001,
		Name = "Consult the Archives",
		AltCards = {
			["Consult the Archives-Hal"] = {
				Id = 10279131803,
				Name = "Hallow's Tales",
				Bio = "Hallow often told stories to his offspring, something he'd thought he'd never do in his millenia-long lifetime. What started as humiliating punishment by Kara, soon taught the fallen Pit Lord what it means to be a father."
			},
			["Reviewing the Plan"] = {
				Id = 12070328659,
				Name = "Reviewing the Plan",
				AltArt = true,
				Bio = "The plan is finally ready, as soon as they iron out the kinks."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		CustomReminder = {
			["Scammer's Parenting"] = "A fleeting card in your hand is destroyed if it's not cast by your end step."
		},
		Effect = {
			Name = "Halloween",
			Description = "Draw 4 fleeting cards.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 4 },
				{ "BypassAction" }
			},
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "Hallow rifled straight past the shelf of contracts and into the cryptohistology section. Patric had a sharp eye, so finding information on this \"Eclipse\" would be trivial, yet Hallow paused. Pensive, he quickly signed his will and his children's inheritences. Just in case."
	},
	["Final Revels"] = {
		Id = 10184628471,
		Name = "Final Revels",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Requirement = { "Playertable", "Me", 3, 9999, "Hand" },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Cast only if you have at least 3 cards in your hand.\nAll players shuffle their hand into their deck, then draw 4 cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomDiscard", 10, "Ally" },
				{ "RandomDiscard", 10, "Opponent" },
				{ "Draw", 4 }
			},
			Target = "All",
			EffectRandomDiscardShuffle = true
		},
		Bio = "A Sinister family reunion only happens in the direst of circumstances."
	},
	["Evil Wood Grain"] = {
		Id = 5152933548,
		Name = "Evil Wood Grain",
		AltCards = {
			["Evil Wood Grain-Sun"] = {
				Id = 7138327847,
				Name = "Tanned Wood Grain",
				AttackEffect = "Scratch",
				Bio = "Be careful with that sunscreen, wouldn't want to get any splinters, right?"
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Stud",
			Description = "Whenever an effect targets this card: It gains 400 health.",
			Type = "OnTarget",
			Power = "Heal",
			Target = "Self",
			Increase = 400
		},
		Bio = "\"My father always complained about evil trees. I never understood why until I visited Hallow's castle.\" - Sword Critic"
	},
	["Desperate Alliance"] = {
		Id = 5832351512,
		Name = "Desperate Alliance",
		AltCards = {
			["The Deckollosus"] = {
				Id = 10823292093,
				Name = "The Deckollosus",
				PackDisplayOverride = "Extra Deck Slots Gamepass",
				Effect = {
					Name = "Halloween",
					Type = "OnSummon",
					Power = {
						{ "Add", "DeckE1-1" },
						{ "Add", "DeckF1-2" },
						{ "Add", "DeckG1-3" },
						{ "Add", "DeckH1-4" }
					},
					Target = "Self"
				},
				Bio = "To contain history is to preserve it. In the end, we are all historians."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Blue = 4, Yellow = 4 },
		Effect = {
			Name = "Halloween",
			Description = "Choose 2 —\n{C1} - Destroy all fighters with 500 or less Health.\n{C2} - Summon a 800/800 Survivor.\n{C3} - All allied fighters gain 400 health.\n{C4} - Destroy 2 cards in your hand, then draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Ally1-1" },
				{ "Add", "Ally1-2" },
				{ "Add", "Ally1-3" },
				{ "Add", "Ally1-4" }
			},
			Target = "Self"
		},
		Bio = "Lua launched a surprise attack against all odds, and Eisenhower calculated those odds. They were not in Hallow's favour."
	},
	["Ally1-1"] = {
		Id = 7015063223,
		Name = "Fun's End",
		AltCards = {
			["DeckE1-1"] = {
				Id = 10824673809,
				Name = "Deck E: Gluttony",
				Effect = {
					Name = "Halloween",
					Description = "Destroy all fighters with 500 or less Health.",
					Type = "OnSummon",
					Power = {
						{
							"CheckHealth",
							{ 0, 501 },
							"All"
						},
						{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
						{ "Add", "DeckF2-2" },
						{ "Add", "DeckG2-3" },
						{ "Add", "DeckH2-4" }
					},
					Target = "Self"
				},
				Bio = "We had to find a new source, now that Entropy had taken hold. "
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Alliance",
		TokenDiscard = true,
		DestroyImmune = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Destroy all fighters with 500 or less Health.",
			Type = "OnSummon",
			Power = {
				{
					"CheckHealth",
					{ 0, 501 },
					"All"
				},
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
				{ "Add", "Ally2-2" },
				{ "Add", "Ally2-3" },
				{ "Add", "Ally2-4" }
			},
			Target = "Self"
		},
		Bio = "\"Eisen, I'm sorry. This next attack will most likely cull all those squishy blobs you brought along. Expect a complementary gift basket if we make it out alive.\""
	},
	["Ally2-1"] = {
		Id = 7015063223,
		Name = "Fun's End",
		AltCards = {
			["DeckE2-1"] = {
				Id = 10824673809,
				Name = "Deck E: Gluttony",
				Bio = "We had to find a new source, now that Entropy had taken hold."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Destroy all fighters with 500 or less Health.",
			Type = "OnSummon",
			Power = {
				{
					"CheckHealth",
					{ 0, 501 },
					"All"
				},
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" }
			},
			Target = "Self"
		},
		Bio = "\"Eisen, I'm sorry. This next attack will cull all those squishy blobs you brought along. Expect a complementary gift basket if we make it out alive.\""
	},
	["Ally1-2"] = {
		Id = 7015039921,
		Name = "Shadow Market",
		AltCards = {
			["DeckF1-2"] = {
				Id = 13576930258,
				Name = "Deck F: Ruin",
				Effect = {
					Name = "Halloween",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Survivor Overpowered", "Ally" },
						{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
						{ "Add", "DeckE2-1" },
						{ "Add", "DeckG2-3" },
						{ "Add", "DeckH2-4" }
					},
					Target = "Self"
				},
				Bio = "It was inevitable. Even with our prowess, all things had to come to an end."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Summon a 800/800 Survivor.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Survivor Overpowered", "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
				{ "Add", "Ally2-1" },
				{ "Add", "Ally2-3" },
				{ "Add", "Ally2-4" }
			},
			Target = "Self"
		},
		Bio = "\"Care to lose another limb, you insufferable control freak?\""
	},
	["Ally2-2"] = {
		Id = 7015039921,
		Name = "Shadow Market",
		AltCards = {
			["DeckF2-2"] = {
				Id = 13576930258,
				Name = "Deck F: Ruin",
				Bio = "It was inevitable. Even with our prowess, all things had to come to an end."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Summon a 800/800 Survivor.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Survivor Overpowered", "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" }
			},
			Target = "Self"
		},
		Bio = "\"Care to lose another limb, you insufferable control freak?\""
	},
	["Ally1-3"] = {
		Id = 7015038351,
		Name = "Titanic Elixir",
		AltCards = {
			["DeckG1-3"] = {
				Id = 10824685853,
				Name = "Deck G: Salvation",
				Effect = {
					Name = "Halloween",
					Type = "OnSummon",
					Power = {
						{ "Heal", 400, "Ally" },
						{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
						{ "Add", "DeckE2-1" },
						{ "Add", "DeckF2-2" },
						{ "Add", "DeckH2-4" }
					},
					Target = "Self"
				},
				Bio = "We gave them another chance. Another shot at a life long gone."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "All allied fighters gain 400 Health.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 400, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
				{ "Add", "Ally2-1" },
				{ "Add", "Ally2-2" },
				{ "Add", "Ally2-4" }
			},
			Target = "Self"
		},
		Bio = "Eisenhower was amazed at how readily available Hallow was to give him such premium ingredients. Little did he know the contract's fine print, giving Hallow full rights over his likeness and intellectual property..."
	},
	["Ally2-3"] = {
		Id = 7015038351,
		Name = "Titanic Elixir",
		AltCards = {
			["DeckG2-3"] = {
				Id = 10824685853,
				Name = "Deck G: Salvation",
				Bio = "It was inevitable. Even with our prowess, all things had to come to an end."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "All allied fighters gain 400 Health.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 400, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" }
			},
			Target = "Self"
		},
		Bio = "Eisenhower was amazed at how readily available Hallow was to give him such premium ingredients. Little did he know the contract's fine print, giving Hallow full rights over his likeness and intellectual property..."
	},
	["Ally1-4"] = {
		Id = 7015032129,
		Name = "Penumbra Shield",
		AltCards = {
			["DeckH1-4"] = {
				Id = 10824690417,
				Name = "Deck H: Enlightenment",
				Effect = {
					Name = "Halloween",
					Type = "OnSummon",
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "Draw", 2, "Ally" },
						{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
						{ "Add", "DeckE2-1" },
						{ "Add", "DeckF2-2" },
						{ "Add", "DeckG2-3" }
					},
					Target = "Self"
				},
				Bio = "Can you blame us for protecting them from the truth? Ignorance is bliss."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Destroy the 2 oldest cards in your hand, then draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "Draw", 2, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" },
				{ "Add", "Ally2-1" },
				{ "Add", "Ally2-2" },
				{ "Add", "Ally2-3" }
			},
			Target = "Self"
		},
		Bio = "The shields protected Eisenhower long enough to finish preparing his elixir, yet the probability of holding Lua off until Eclipse has finished fighting the Ultra Annihilator was 39%. Defeating him? 0.00000000000429%."
	},
	["Ally2-4"] = {
		Id = 7015032129,
		Name = "Penumbra Shield",
		AltCards = {
			["DeckH2-4"] = {
				Id = 10824690417,
				Name = "Deck H: Enlightenment",
				Bio = "Can you blame us for protecting them from the truth? Ignorance is bliss."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Alliance",
		TokenDiscard = true,
		Fading = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Halloween",
			Description = "Destroy the 2 oldest cards in your hand, then draw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "Draw", 2, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Alliance" }
			},
			Target = "Self"
		},
		Bio = "The shields protected Eisenhower long enough to finish preparing his elixir, yet the probability of holding Lua off until Eclipse has finished fighting the Ultra Annihilator was 39%. Defeating him? 0.00000000000429%."
	},
	["The Skull Collector"] = {
		Id = 9096695594,
		Name = "The Skull Collector",
		AltCards = {
			["The Skull Collector-Hal"] = {
				Name = "The Rockskull",
				Id = 9096845005,
				AttackEffect = "MagicYellow",
				Bio = "Ever listened to something so rad it killed you?"
			},
			["The Skull Collector-Banner"] = {
				Name = "The Whistler",
				Id = 11393860080,
				AttackEffect = "MagicYellow",
				Bio = "<i>If you hear the whistling from a little far away, your death is right around the corner.</i>"
			},
			["You Skull Collector"] = {
				Id = 93895059017232,
				Name = "You",
				Commissioner = { "" },
				Effect = {
					Name = "Div/0",
					Description = "Whenever an enemy fighter dies: Give yourself a Skull card.",
					Type = "OnEnemyDeath",
					Power = { {
						"RandomAdd",
						{
							"Conqueror's Skull-You",
							"Philosopher's Skull-You",
							"Ascetic's Skull-You",
							"Socialite's Skull-You"
						}
					} },
					Target = "Ally"
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 746,
				Bio = "You possess the alpha brick what would you add into existence?"
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Div/0",
			Description = "Whenever an enemy fighter dies: Give yourself a Skull card.",
			Type = "OnEnemyDeath",
			Power = { {
				"RandomAdd",
				{
					"Conquerer's Skull",
					"Philosopher's Skull",
					"Ascetic's Skull",
					"Socialite's Skull"
				}
			} },
			Target = "Ally"
		},
		Bio = "\"Us demons are a friendly bunch. Don't hate us for a few bad noggins.\""
	},
	["Conquerer's Skull"] = {
		Id = 5478557141,
		Name = "Conqueror's Skull",
		AltCards = {
			["Conqueror's Skull-You"] = {
				Name = "Brometheus: Unhaunted",
				Id = 116721350421249,
				Bio = "At long last… the QA PERMIT is mine. And with this newfound authority, my first decree shall be simple: every Red card shall become gloriously, outrageously overstatted."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Token",
		Archetype = "Skull",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1, Neutral = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The skull of a tyrannical dwarf-king that led his people to ruin centuries ago."
	},
	["Philosopher's Skull"] = {
		Id = 5527625122,
		Name = "Philosopher's Skull",
		AltCards = {
			["Philosopher's Skull-You"] = {
				Name = "Magic Bullet Jedi",
				Id = 94883542684473,
				Bio = "It really is as you say; this is a magic bullet that will never miss."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Skull",
		Cost = { Blue = 1, Neutral = 1 },
		Effect = {
			Name = "Div/0",
			Description = "When this card is cast: Give yourself a Blue or Red action card.",
			Type = "OnSummon",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally"
		},
		Bio = "The skull of Dukran's father, who taught him everything he knew."
	},
	["Ascetic's Skull"] = {
		Id = 5519374487,
		Name = "Ascetic's Skull",
		AltCards = {
			["Ascetic's Skull-You"] = {
				Name = "Enndo: Abyss Breaker",
				Id = 104356135941372,
				Bio = " Even at the depths of the abyss, there is always someone that will be your light."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Archetype = "Skull",
		Color = "Green",
		Cost = { Green = 1, Neutral = 1 },
		Effect = {
			Name = "REEEEEEEEEEEEEEEEEEEEEEEEEEEE",
			Description = "When this card is cast: You gain 500 life.",
			Type = "OnSummon",
			Power = { { "Cost", -500 } },
			Target = "Ally"
		},
		Bio = "The skull of the last Toothy Deer, who forsook all wordly pleasure to escape poachers."
	},
	["Socialite's Skull"] = {
		Id = 5519876246,
		Name = "Socialite's Skull",
		AltCards = {
			["Rhine-XLV-Skull"] = {
				Name = "Dreams Unbound",
				Id = 112805661270662,
				AttackEffect = "MagicBlue",
				Bio = "\"Let's spread our wings, now, into the sky, now, let's reach up to the sun.<br/>Soon we will see we're, living the dreams of, our generation!~\""
			},
			["Rhine-XLV-Skull-Sun"] = {
				Name = "Sun Pill",
				Id = 17440641001,
				Bio = "\"Oh, looks like I'm lacking a little qi. Guess I'll have to- Did my Sun Pill just become sentient AGAIN?\""
			},
			["Rhine-XLV-Skull-AN"] = {
				Name = "Drifting Memories",
				Id = 111936539207378,
				Bio = "\"When the time comes, let go. Nothing lasts forever.\""
			},
			["Socialite's Skull-You"] = {
				Name = "Ignatuha :)",
				Id = 121580115748046,
				Bio = "I've always wondered about the power of friendship. How strong is it? How absurd can it get? Is it even real? After decades of research, I have arrived at a conclusion.<br/>It exists.<br/>The power of friendship is something I cannot explain in words alone. I like the mzh3000 card so much, that I always topdeck it at the right times. Is that friendship? No, that's what happens when you have 7 fighters.The power of friendship is something that brings hope, an oppourtunity to be greatful for. Without friendship, they are just a soulless husk.So, I have a deal for you, my friend. Press the forfeit button 4 times."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Skull",
		Cost = { Yellow = 1, Neutral = 1 },
		Effect = {
			Name = "Tooth Decay",
			Description = "When this card is cast: A target fighter generates twice.",
			Type = "OnSummon",
			Power = { { "Generate", 2 } },
			Target = "Single"
		},
		Bio = "The skull of an extinct fluffy creature, known for its love of others."
	},
	["Hallow, the Sugarlord"] = {
		Id = 5517942752,
		Name = "Angelic Godbeast",
		AltCards = {
			["Ras Golden Gryphon"] = {
				Id = 8046538828,
				AltArt = true,
				AttackEffect = "MagicYellow",
				Name = "Ras Golden Gryphon",
				Bio = "Who will win? An extra linked board with four omni-negates, or one round boi?"
			},
			Lillith = {
				Id = 9551503778,
				Name = "Lillith",
				AttackEffect = "DoomStorm",
				Bio = "Elder Demon, Alpha Flameborne, Desecrator of Empires, Otherworldly Malevolence, Proud Mother."
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Blaze",
		Color = "Yellow",
		Cost = { Yellow = 13 },
		EffectAnimation = "EatTurkey",
		AlternateCost = { Yellow = 9 },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "Godbeast" },
		Archetype = "Godbeast",
		Effect = {
			Name = "Haydoscale",
			Description = "If there's an allied Godbeast, cast this card using 9 {Y}. When this card is cast: A target fighter gains 1300 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 1300, "Single" },
				{ "Strengthen", 1300, "Single" }
			},
			Target = "Ally"
		},
		Bio = "The air crackled with the raw heat of a raging neutron star. There can be no bravery without madness, and those two have plenty to share."
	},
	Moorph = {
		Id = 5156404923,
		Name = "Moorph",
		AltCards = {
			["Cow Cult Conversion"] = {
				Name = "Cow Cult Conversion",
				Id = 15176633633,
				AltArt = true,
				PremiumArt = 149,
				Commissioner = { 131263915, 925350010 },
				Bio = "<font color=\"#FFC0CB\">“I’m sorry Wildy…but this is just how it’s gotta happen, the beef had to be settled somehow”</font>\n<font color=\"#FFEA00\">“that pun was bad”</font>\n<font color=\"#FFC0CB\">“shut it noob”</font>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Archetype = "Cow",
		Transformant = "Cow",
		SummonAnimation = "CowMoo",
		EffectAnimation = "CowBuff",
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter generates.\nTransform it into a Cow.",
			Type = "OnSummon",
			Power = {
				{ "Generate", 1 },
				{ "Transform", "Transformant", "Single" }
			},
			Target = "Single"
		},
		Bio = "Although born after Javion's overlay, Claudia Sinister is fascinated with what creatures it brought."
	},
	Pedromony = {
		Id = 6166371366,
		Name = "Pedromony",
		AltCards = {
			["Pedromony-C"] = {
				Name = "Winter Operator Pedromony",
				AttackEffect = "Jab",
				Id = 15176636467,
				Bio = "\"P-01 speaking. Stakeout at the Hillsburg Children's Hospital was a success. We've captured one of the members suspected of conducting the Holiday's Fear incidents. Over.\""
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Neutral",
		Archetype = "Pedromony",
		Cost = { Neutral = 5 },
		CustomReminderNascent = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Once, whenever you cast another fighter: It joins Pedromony's group. Both players gain {W}{W}.\nWhenever an allied fighter in Pedromony's group attacks: Both players gain 300 life and a Nascent Stud.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{ "ReplaceArchetype" },
						{ "Neutral", 2, "Ally" },
						{ "Neutral", 2, "Opponent" }
					},
					Target = "Aggressor",
					TotalTriggerLimit = 1
				},
				OnAllyAttack = {
					Power = {
						{ "Add", "Nascent Stud", "Ally" },
						{ "Add", "Nascent Stud", "Opponent" },
						{ "Cost", -300 },
						{ "Inflict", -300, "Opponent" }
					},
					Target = "Ally",
					Archetype = "Pedromony"
				}
			}
		},
		Bio = "She treats her friends or foe alike, but her friends come first."
	},
	["Ultra Bestower"] = {
		Id = 4720412427,
		Name = "Ultra Bestower",
		AltCards = {
			["Ultra Cultist ImAwkwrd"] = {
				Id = 8891704097,
				Name = "Ultra Cultist ImAwkwrd",
				AltArt = true,
				AttackEffect = "Inferno",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer",
								"Ultra Cultist ImAwkwrd",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Ultra Orator"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer",
								"Ultra Cultist ImAwkwrd",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Ultra Orator"
							}
						}
					}
				},
				Bio = "Uneasy having to control these aliens, but a promise is a promise."
			},
			["Ultra Duo Billybobbington1997 & Bibee2013"] = {
				Id = 16029739930,
				Name = "FAT SPHERES GAMING ImTrilocks & Bibee",
				AltArt = true,
				AttackEffect = "Jab",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer",
								"Ultra Duo Billybobbington1997 & Bibee2013",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Nixxen",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"Ultra Otherer",
							"Ultra Duo Billybobbington1997 & Bibee2013",
							"Ultra Enhancer",
							"Ultra Beseecher",
							"Ultra Severer",
							"Ultra Depriver",
							"Nixxen",
							"Ultra Vanquisher",
							"Bibee, The Demoralizer"
						}
					}
				},
				Bio = "Fat Spheres Gaming Bestower Gang Money Sign Cash Bills Gestower Bang, They Didn't Believe In Us, Ghash Did, Big Sphere Ultra Orators With Attitude, Straight Outta The Ultra Gate, Lil G Mahjong, CAN'T STOP SHUFFLING ULTRAS! Big Jomm For Da Desirers"
			},
			["Seething Agglutinate"] = {
				Id = 10570063086,
				Name = "Seething Agglutinate",
				AltArt = true,
				AttackEffect = "Bubbles",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						}
					}
				},
				Bio = "Stars glisten in a harmonious ensemble, the wave of illuminating sparkles echos through a crystal clear night. Will you feel the stars with me?"
			},
			["Ultra Bestower-Hal"] = {
				Id = 11140809432,
				Name = "Aranea Membri",
				AttackEffect = "Scratch",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						}
					}
				},
				Bio = "The ceiling is full."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Requirement = { "Playertable", "Me", 1, 3, "BypassUltra" },
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Hellfire",
			Description = "Cast only if you have The Ultra Gate in play.\nWhenever you cast an Ultra fighter: Shuffle 2 Ultra fighters into your deck.",
			Type = "OnAllySummon",
			Archetype = "Ultra",
			Power = {
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "The four fundamental studs dictate what can be and what cannot be, yet the most alien of forces transcend colour altogether."
	},
	["Ultra Enhancer"] = {
		Id = 5061445368,
		Name = "Ultra Enhancer",
		AltCards = {
			["Exalt Isurus"] = {
				Id = 10570062141,
				Name = "Exalt Isurus",
				AttackEffect = "Gravity",
				Bio = "Pine trees bristle indistinctly, the adelgids line each slender twig and pine. I see them as I see you, do you hear me as I hear them?"
			},
			["Ultra Enhancer-Hal"] = {
				Id = 11140913636,
				Name = "Don Grundle",
				Bio = "BAD DAY? BREAK YOUR TOGS! CAN'T KIN? RESPINDLE!!! DON'T FORGET JUNE, AND AS ALWAYS,  TRY NOT TO RUN! YOU'RE... CONCRADUOUS!"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 10, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Hellfire",
			Description = "Cast only if there are 10 or more Ultras in your deck.\nWhen you do: All allied Ultras gain 100 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 100 } },
			Target = "AlliedArchetype"
		},
		Bio = "Colourless studs are the bedrock of reality. Studs can be used multiple times, but lose their colour after the first use."
	},
	["Ultra Otherer"] = {
		Id = 3164504215,
		Name = "Ultra Otherer",
		AltCards = {
			BIBEE2013 = {
				Id = 7331993593,
				Name = "BIBEE2013",
				AltArt = true,
				AttackEffect = "Gravity",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						}
					}
				},
				Bio = "FREE ULTRA KIND! DEATH TO BIRDLETS AND MEEBOIDS!!!"
			},
			["Ultra Embracement Bibee"] = {
				Id = 9225606550,
				Name = "Ultra Embracement Bibee",
				AttackEffect = "Arcane",
				AltArt = true,
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Embracement Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Embracement Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Embracement Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Embracement Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Embracement Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						}
					}
				},
				Bio = "MESSIN WITH MY ULTRA ARMY? THERE'S A REASON ON WHY I'VE BEEN DESTINED FOR THIS SPOT IN THE ETHEREAL ERADICATORS. NOW IT GETS PERSONAL."
			},
			["Interworldly Dissenters"] = {
				Id = 8725173202,
				AttackEffect = "Jab",
				Name = "Interworldly Dissenters",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"BIBEE2013",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						}
					}
				},
				Bio = "\"WE MUST NOT FAIL AGAIN! GIVE EM HELL!\""
			},
			["Brute Force Bibee"] = {
				Id = 9326588604,
				Name = "Brute Force Bibee",
				AttackEffect = "Arcane",
				AltArt = true,
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Brute Force Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Brute Force Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Brute Force Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Brute Force Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Brute Force Bibee",
								"Ultra Bestower",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Ultra Desirer",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						}
					}
				},
				Bio = "ENOUGH POINTING AROUND THESE ALIENS, TIME TO HAVE A LITTLE FUN."
			},
			["Ultra Otherer-Rageborn"] = {
				Id = 9570598241,
				Name = "Rageborn",
				AttackEffect = "Scratch",
				Rarity = "Token",
				Bio = "A creature of wrath. Eclipse's anger mutated anything within close proximity into a Rageborne."
			},
			["Former Aspirant"] = {
				Id = 10570061129,
				Name = "Former Aspirant",
				AttackEffect = "Jab",
				AltArt = true,
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						}
					}
				},
				Bio = "Gold glitters in the light, shining brightly beneath a cold cliff in the moonlight by the beach. Will you glitter just as brightly under my gaze?"
			},
			["Ultra Otherer-Hal"] = {
				Id = 11140824817,
				Name = "Smiler",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						}
					}
				},
				Bio = "A smile can mean much more than joy."
			},
			["Ultra Annihilator-Hal-Token"] = {
				Id = 11344339569,
				Name = "THEM",
				AttackEffect = "Gravity",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						}
					}
				},
				Bio = "R̷͊̈́Ȩ̷̂M̵̌̊Ě̷̉M̴̀͐B̴̔̑E̷̿̕R̵̉̂ ̶̇̅Ŭ̴͗S̶͋̋?̴̂͘"
			},
			egghomestuck = {
				Id = 118748603577327,
				Name = "egg",
				AttackEffect = "Gravity",
				Bio = "wonder whats inside."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Playertable", "Me", 1, 3, "BypassUltra" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Hellfire",
			Description = "Cast only if you have The Ultra Gate in play.\nWhen you do: Shuffle 5 Ultras into your deck.",
			Type = "OnSummon",
			Power = {
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "Enviroments rife with colourless studs can be survived only by Ultras, and vice versa. The coloured studs of a person quickly lose their biases to fill the void, causing their very being to dissolve."
	},
	["Ultra Beseecher"] = {
		Id = 5059406231,
		Name = "Ultra Beseecher",
		AltCards = {
			["Byzantine Supplicate"] = {
				Id = 10570104442,
				Name = "Byzantine Supplicate",
				Bio = "The mind dreams chaotically, to swim and fly and run without limits and to generate peculiar instances. Ẃ̴̀i̷͋̏l̴͗̆l̴͑̚ ̵̅͂y̵̾͠o̶̓͝u̴̓͠r̴̔͘ ̷̆̅m̵̻͌ḯ̴̕n̸̓͘d̸̊̅ ̸̃̈́s̵̾͝t̴̃̀a̴̒͑ý̴͝ ̷̄̒i̵̛̺n̸͆̓t̷͔͆ả̵̓c̶͌̀t̴͐͒?̴̆̐"
			},
			["Ultra Beseecher-Hal"] = {
				Id = 11140883107,
				Name = "Death Moth",
				Bio = "Attracted to any source of light, the floors they reside on are filled with the sound of their wings."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 15, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Hellfire",
			Description = "Cast only if there are 15 or more Ultras in your deck.\nWhen you do: Search your deck for 'Ultra Annihilator,' then draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Tutorfor", "Ultra Annihilator" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Only primitive Ultras were seen among the edges of their territories before a breakthrough in technology allowed a properly trained person to delve as deeply as they wish."
	},
	["Ultra Desirer"] = {
		Id = 5059409364,
		Name = "Ultra Desirer",
		AltCards = {
			["Unaccompanied Proclivity"] = {
				Id = 10570084854,
				Name = "Unaccompanied Proclivity",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Former Aspirant",
								"Seething Agglutinate",
								"Exalt Isurus",
								"Byzantine Supplicate",
								"Warped Notch",
								"Ichor Bereave",
								"Unaccompanied Proclivity",
								"Shellac Balk",
								"Ehj236, The Rhetor"
							}
						},
						{ "Heal", 100, "AlliedArchetype" }
					}
				},
				Bio = "A buzzing sensation of endless electricity bringing a city to life. 01010111 01101001 01101100 01101100 00100000 01111001 01101111 01110101 00100000 01100110 01100101 01100101 01101100 00100000 01110100 01101000 01100101 00100000 01100011 01101001 01110100 01111001 00100000 01110111 01101001 01110100 01101000 00100000 01101101 01100101 00111111"
			},
			["Ultra Desirer-Hal"] = {
				Id = 11140933241,
				Name = "笑う男",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer-Hal",
								"Ultra Bestower-Hal",
								"Ultra Enhancer-Hal",
								"Ultra Beseecher-Hal",
								"Ultra Severer-Hal",
								"Ultra Depriver-Hal",
								"Ultra Desirer-Hal",
								"Ultra Vanquisher-Hal",
								"Ultra Orator-Hal"
							}
						},
						{ "Heal", 100, "AlliedArchetype" }
					}
				},
				Bio = "かつてはそうでしたし、かつてはそうでした。"
			},
			Nixxen = {
				Id = 14387327308,
				Name = "ImTiredLocks",
				AttackEffect = "Gravity",
				Effect = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer",
								"Ultra Duo Billybobbington1997 & Bibee2013",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Nixxen",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{
							"RandomDeckAdd",
							{
								"Ultra Otherer",
								"Ultra Duo Billybobbington1997 & Bibee2013",
								"Ultra Enhancer",
								"Ultra Beseecher",
								"Ultra Severer",
								"Ultra Depriver",
								"Nixxen",
								"Ultra Vanquisher",
								"Bibee, The Demoralizer"
							}
						},
						{ "Heal", 100, "AlliedArchetype" }
					}
				},
				Bio = "\"Will I be remembered when I'm gone?\nI guess mental immortality is just not worth giving up your whole life.\nOne day our points of view will meet, little guy.\"\n"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 10, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Hellfire",
			Description = "Cast only if there are 10 or more Ultras in your deck.\nWhenever you cast an Ultra fighter: Shuffle 2 Ultras into your deck. All allied Ultras gain 100 Health.",
			Type = "OnAllySummon",
			Archetype = "Ultra",
			Power = {
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{
					"RandomDeckAdd",
					{
						"Ultra Otherer",
						"Ultra Bestower",
						"Ultra Enhancer",
						"Ultra Beseecher",
						"Ultra Severer",
						"Ultra Depriver",
						"Ultra Desirer",
						"Ultra Vanquisher",
						"Ultra Orator"
					}
				},
				{ "Heal", 100, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "Once into the hive, the an explorer will find it very difficult to escape, to pull away from the deepest object of their desires."
	},
	["Ultra Severer"] = {
		Id = 5059414012,
		Name = "Ultra Severer",
		AltCards = {
			["Warped Notch"] = {
				Id = 10570064257,
				Name = "Warped Notch",
				Bio = "A shred of light beams, a glorious unknown peers into my eyes and the warmth of infinite days covers me. Do you feel the same way as I do?"
			},
			["Ultra Severer-Hal"] = {
				Id = 137354223364343,
				Name = "= )",
				Bio = "Daisy, Daisy, give me your answer do,\n\t\t\t\t\t\t\tI'm half crazy, All for the love of you,\n\t\t\t\t\t\t\tIt won't be a stylish marriage,\n\t\t\t\t\t\t\tI haven't got a carriage,\n\t\t\t\t\t\t\tBut you'll look sweet, up on the seat\n\t\t\t\t\t\t\tOf a bicycle built for two!"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 15, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast only if there are 15 or more Ultras in your deck.\nWhen you do: Deal 400 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 400, "Single" } },
			Target = "Ally"
		},
		Bio = "Ultras do not take intrusions to their hives lightly."
	},
	["Ultra Depriver"] = {
		Id = 5059407846,
		Name = "Ultra Depriver",
		AltCards = {
			["Ichor Bereave"] = {
				Id = 10570072736,
				Name = "Ichor Bereave",
				Bio = "A glimmer, a glitter slowly fades, unto an unforgiving void. W̷͛͘i̴̇̀l̸͂̉l̵̎͑ ̷̓̕ẏ̴̐o̴̿̉u̴͗́ ̵͆͋d̴̀̽i̸̛̽s̷̿̎a̷̽͐p̸̈́̋p̷̿̒e̵̎͛a̴̒̄r̶̈̂ ̵̎̈́ĭ̵̈́n̴̍̌t̸̿̓o̵̾̀ ̶̐͗t̸͌̍h̵̽̓è̶̏ ̷̆͛v̶̾̊o̶͐̍i̶͐̚d̷́̈ ̷̌͌w̷̛͂i̵̽͘t̵̀̓h̷̀̒ ̴͆͠m̷̏͋ė̵͝?̷̔͗"
			},
			["Ultra Depriver-Hal"] = {
				Id = 11194220454,
				Name = "",
				Bio = "One of the hardest things you’ll ever have to do is grieve the loss of a person who’s still alive."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 10, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast only if there are 10 or more Ultras in your deck.\nWhen you do: Set your opponent's {W} to 2.",
			Type = "OnSummon",
			Power = { { "SetNeutral", 2, "Opponent" } },
			Target = "Ally"
		},
		Bio = "Adapted to live in the coldest vacuums of space, Ultras seem to be created from nothing and subsist on as much."
	},
	["Ultra Vanquisher"] = {
		Id = 5059415728,
		Name = "Ultra Vanquisher",
		AltCards = {
			["Shellac Balk"] = {
				Id = 10570073668,
				Name = "Shellac Balk",
				Bio = "A harsh redolent fragrance is found, flooding an impetuous town with no one to partake in it. Will your scent be as it is to me?"
			},
			["Ultra Vanquisher-Hal"] = {
				Id = 11140825800,
				Name = "hwl",
				Bio = "Log 32, Researcher �: \n\t\t\t\t\t\t\t\"That’s not a person.\" \n\t\t\t\t\t\t\t- End recording."
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 20, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast only if there are 20 or more Ultras in your deck.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "As Ultras set up a new hive, Vanquishers are spawned to defend it. A single vanquisher takes a single army to remove."
	},
	["Ultra Orator"] = {
		Id = 5059412340,
		Name = "Ultra Orator",
		AltCards = {
			["Bibee, The Demoralizer"] = {
				Id = 9604904063,
				Name = "Bibee, The Demoralizer",
				Bio = "\"W-what do you want from me? What do you want from us? Please man, leave us be, we don't deserve this.\"."
			},
			["Ehj236, The Rhetor"] = {
				Id = 10570070872,
				Name = "Ehj236, The Rhetor",
				Bio = "A unfamiliar wave of energy crashes into you, you are unable to move, see, hear, taste, touch, smell or feel. You become a blip in time, nothing more nothing less, your dreams are non-existant, everything slows down and you slow down to a halt."
			},
			["Ultra Orator-Hal"] = {
				Id = 11140887678,
				Name = "Aiden",
				Bio = "\"I don't like what I do, really. I try to help as many as I can, and I've sure saved a lot. Seeing them like this, however... it has an effect on me, and I'm the one with a camera for a head.\""
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 20, 9999, "Archetype" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast only if there are 20 or more Ultras in your deck.\nWhenever this card attacks: All enemy fighters lose 200 Power. Destroy all enemy fighters with 0 Power.",
			Type = "OnAttack",
			Power = {
				{ "Weaken", 200 },
				{
					"CheckPower",
					{ 0, 0 }
				}
			},
			Target = "Opponent"
		},
		Bio = "The intelligence of Ultras was questionable at best until reports of a species resembling a religious figure surfaced."
	},
	["Ultra Obliterator"] = {
		Id = 4899464255,
		Name = "Ultra Obliterator",
		AltCards = {
			["Ultra Obliterator-Hal"] = {
				Name = "Noclip",
				Id = 11344643386,
				Addant = "Ultra Obliterator-Hal",
				Bio = "The human mind has a hard time conceptualizing numbers of extreme quantities. However, upon seeing it for themselves, they could either keep infinity a secret or go down the bottomless rabbit hole. They picked the latter."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Flood",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Ultra",
		Requirement = { "Deck", "Ally", 70, 9999, "Cards" },
		Cost = { Neutral = 0 },
		Addant = "Ultra Obliterator",
		DestroyImmune = true,
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast only if there are 70 or more cards in your deck.\nGive yourself a copy of this card.\nDraw 2 cards.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{ "Draw", 2 },
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "Ultras share a hivemind that summons others in time of need. When this hivemind reaches a critical mass, regions get torn asunder from the sheer information pressure."
	},
	["Ultra Annihilator"] = {
		Id = 4720410480,
		Name = "Ultra Annihilator",
		AltCards = {
			["Ethereal Eradicators"] = {
				Id = 8725173632,
				Name = "Ethereal Eradicators",
				AltArt = true,
				Summonant = "Interworldly Dissenters",
				Bio = "“Such a futile resistance.\n“YOU THINK THE FIRST WAVE OF ULTRAS WAS BAD? PUNY MORTALS, THE END IS UPON ALL OF YOU!”"
			},
			["Eclipse, The Moonbreaker"] = {
				Id = 9570594017,
				Name = "Eclipse, The Moonbreaker",
				Rarity = "Token",
				Summonant = "Ultra Otherer-Rageborn",
				Bio = "\"With wrath we rise, with death we cry!\""
			},
			PCZanzel = {
				Id = 9791897805,
				Name = "Zanzel",
				Rarity = "Token",
				Bio = "\"A puppet ought to know her place.\""
			},
			["Myriad Nexus"] = {
				Id = 10570080265,
				Name = "Myriad Nexus",
				Summonant = "Former Aspirant",
				AltArt = true,
				Bio = "\"I see the endless depth. I smell the endless height, I feel the endless width. I dream an endless dream. I am the endless binary. I am the endless eyes, I am disappearing endlessly."
			},
			["Ultra Annihilator-Hal"] = {
				Id = 11435882605,
				Name = "HIM",
				Summonant = "Ultra Annihilator-Hal-Token",
				Bio = "Let me show you why we are able to forget."
			},
			["Hitoshi Kuwana"] = {
				Id = 12504264086,
				Name = "Hitoshi Kuwana",
				Rarity = "Token",
				Bio = "<i>\"Do you have any idea how many people I've killed?\"</i>"
			},
			["the false prophet"] = {
				Id = 121346646689306,
				Name = "the false prophet",
				Rarity = "Token",
				Summonant = "egghomestuck",
				Bio = "<i>seeing this in your game usually means demise, heed it's existence.</i>"
			}
		},
		Health = 2000,
		Power = 2000,
		Rarity = "Legendary",
		AttackEffect = "LaserBlue",
		Color = "Neutral",
		Archetype = "Ultra",
		TokenOmni = true,
		OmniImmune = true,
		Overload = true,
		Mitigation = 999999999999999,
		DamageMitigation = 999999999999999,
		Summonant = "Ultra Otherer",
		Cost = { Neutral = 50 },
		AlternateCost = { Neutral = 0 },
		AlternateCostRequirement = { "Archetype", "Ally", 7, 8, "Ultra" },
		Effect = {
			Name = "Bleeding Reality",
			Description = "Cast this card for free if there's 7 allied Ultra fighters.\nThis card is immune to all damage.\nWhenever an allied fighter dies: Summon an Ultra Otherer. This card loses 200 health.",
			Type = "OnAllyDeath",
			Power = {
				{ "Summon", "Summonant" },
				{ "PierceDamage", 200, "Self" }
			},
			Target = "Ally"
		},
		Bio = "\"The Federation with Kathara. Nibblex with Havalu. The Ragegyre with Javion. Now this. No, not again. Never again.\" -Priestess Zanzel, the Promised One"
	},
	["The Ultra Gate"] = {
		Id = 5618499835,
		Name = "The Ultra Gate",
		AltCards = {
			["BIBEE DECLARES WAR!!!"] = {
				Name = "BIBEE DECLARES WAR!!!",
				Id = 10184189050,
				AltArt = true,
				Terrariant = "Bibee Terrain",
				Bio = "GHASHENDEX WONT YOU COME MY WAAYYY, GOT SOMETHIN I WANT TO SAAYY, CANNOT KEEP YOU OUT OF MY BRAAIINN"
			},
			["Galaxy's Ultra Gate"] = {
				Name = "Galaxy's Ultra Gate",
				Id = 10184709904,
				AltArt = true,
				Terrariant = "Galaxy Terrain",
				Bio = "Skill issue."
			},
			["The Ultra Gate-Hal"] = {
				Name = "The Backrooms",
				Id = 11140775496,
				Terrariant = "Backrooms Terrain",
				Bio = "The humming of fluorescent lights is not the only thing that will keep you company."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Field = 4899464255,
		Color = "Neutral",
		Terrain = true,
		Archetype = "Ultra",
		TokenDiscard = true,
		Terrariant = "Ultra Terrain",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Hellfire",
			Description = "While in play, you may cast common Ultra cards.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "BypassUltra", 1 } },
					Target = "Ally",
					TurnTriggerLimit = 1
				},
				OnRemoved = {
					Power = { { "BypassUltra", 0 } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "BypassUltra", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The Sages surrounded the portal with grim determination. Whatever could emerge from this cannot be good."
	},
	["Wolfbitten Wanderer"] = {
		Id = 9964927930,
		Name = "Wolfbitten Wanderer",
		Health = 200,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Lycanthrope",
		Transformant = "Werewolf Savage",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "Cursed by the moon, these scattered demi-humans travel in search of a place to belong."
	},
	["Werewolf Savage"] = {
		Id = 9964930497,
		CopyBodge = "Werewolf Savage",
		Name = "Werewolf Neonate",
		AltCards = {
			["Festive Werewolf"] = {
				Id = 9965500938,
				Name = "Festive Werewolf",
				Transformant = "Wolfbitten Elf",
				Bio = "Its a Halloween movie, now shut up."
			}
		},
		Health = 200,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "LycanScratch",
		Color = "Red",
		Archetype = "Lycanthrope",
		Transformant = "Wolfbitten Wanderer",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "The first transformations are always the worst."
	},
	["Accursed Bladesman"] = {
		Id = 5832330143,
		Name = "Accursed Bladesman",
		AltCards = {
			["Evil Prince-Val"] = {
				Id = 6460274742,
				Name = "Charming Bladesman",
				Transformant = "Werefrog-Val",
				Bio = "Same kingdom, different crush. Time to conquer."
			}
		},
		Health = 200,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Red = 1 },
		Transformant = "Werefrog",
		Token = true,
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Your opponent loses a colourless stud. Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "Neutral", -1, "Opponent" },
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "Same kingdom, different leader. Time to conquer."
	},
	Werefrog = {
		Id = 5689847144,
		CopyBodge = "Werefrog",
		Name = "Hazenwyld's Blade",
		AltCards = {
			["Werefrog-Val"] = {
				Id = 6460275046,
				Name = "Hazenwyld's Charmer",
				Transformant = "Evil Prince-Val",
				Bio = "Same crush, different kingdom."
			}
		},
		Health = 200,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "RedKatana",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Red = 1 },
		Token = true,
		Transformant = "Accursed Bladesman",
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "Same leader, different kingdom."
	},
	["Blessed Sage"] = {
		Id = 9964933456,
		Name = "Blessed Sage",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "DoomStorm",
		Archetype = "Lycanthrope",
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 2, 9999, "Lycanthrope" },
		Color = "Red",
		Cost = { Neutral = 4, Red = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Summonant = "Blessed Acolyte Token",
		Effect = {
			Name = "Halloween",
			Description = "Cast this card ignoring its {W} cost if there are 2 or more Lycanthropes in your Baseplate.\nSearch your deck for a copy of this card.\nSummon a 50/350 Lycanthrope.",
			Type = "OnSummon",
			Power = {
				{ "Tutorfor", "Blessed Sage", "Ally" },
				{ "Summon", "Summonant", "Ally" }
			},
			Target = "Self"
		},
		Bio = "No one believes me when I say that the scalelords have blessed me."
	},
	["Blessed Acolyte Token"] = {
		Id = 9964934205,
		CopyBodge = "Blessed Acolyte Token",
		Name = "Blessed Sage",
		AltCards = {
			["AviaChip Token"] = {
				Id = 5947352549,
				Name = "AviaChip",
				Transformant = "Chipcritical Swordfighter",
				Bio = "AviaChip is part fox, part Robloxian! Loves guns and swords. In Clash Bloxxer, he uses his signature weapon, the Chipper Sword."
			}
		},
		Health = 50,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "DoomStorm",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Red = 2 },
		Transformant = "Werewyrm",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant", "Self" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "No one believes me when I say that the scalelords have blessed me."
	},
	Werewyrm = {
		Id = 9965559023,
		Name = "Mooncaller",
		CopyBodge = "Werewyrm",
		AltCards = {
			["Chiptricial Swordfighter"] = {
				Id = 5947355115,
				Name = "Chiptricial Swordfighter",
				Transformant = "AviaChip Token",
				Bio = "The Ultimate Form of AviaChip. Can slice through ANYTHING."
			}
		},
		Health = 50,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "LycanScratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Transformant = "Blessed Acolyte Token",
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "Although unusual, there are those whose transformation doesn't ressemble that of a wolf. Their ferocity remains the same."
	},
	["Paraselene Ascetic"] = {
		Id = 9964861799,
		Name = "Paraselene Ascetic",
		Health = 100,
		Power = 300,
		Rarity = "Common",
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
	["Lunar Rager"] = {
		Id = 9964862445,
		Rarity = "Token",
		Name = "Lunar Rager",
		DamageImmune = true,
		Transformant = "Paraselene Ascetic",
		Health = 100,
		Power = 300,
		AttackEffect = "LycanScratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "...For Eclipse's might will safeguard the world from any threat!"
	},
	["Lycan Envoy"] = {
		Id = 5368227210,
		Name = "Lycan Envoy",
		Health = 150,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1 },
		Transformant = "Hazenwyld Evangelist",
		Token = true,
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's 2 or more allied Lycanthrope fighters: Double this card's stats. Transform it and it loses its inertia.",
			Type = "OnAllyCast",
			Power = {
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "People of Bloxburg, fear not."
	},
	["Hazenwyld Evangelist"] = {
		Id = 5363989027,
		Name = "Hazenwyld Evangelist",
		Rarity = "Token",
		AttackEffect = "LycanScratch",
		Transformant = "Lycan Envoy",
		Health = 150,
		Power = 300,
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it and it becomes inert in play.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "Tonight, we fight to protect those who fear us."
	},
	["Den Protector"] = {
		Id = 5673324980,
		Name = "Den Protector",
		Health = 750,
		Power = 50,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Transformant = "Twilit Mother",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Summon 2 250/250 Pack Wolves that're inert in play. Double this card's stats. Transform it.",
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
		Bio = "\"I would give my life for my pack. I would let my children wear me as armour to strike you down.\""
	},
	["Twilit Mother"] = {
		Id = 5848923298,
		Rarity = "Token",
		Name = "Twilit Mother",
		Transformant = "Den Protector",
		Health = 750,
		Power = 50,
		AttackEffect = "LycanScratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "\"When a wolf learns to extrude its vassal, a powerful bond between the two people sharing a body is formed. The bond is as strong as a mother cradling her newborn child.\"\n- Yin-Pangu, Shield of Cothran"
	},
	["Pack Wolf"] = {
		Id = 5858670885,
		Name = "Pack Wolf",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		Archetype = "Lycanthrope",
		AttackEffect = "LycanScratch",
		Color = "Red",
		Token = true,
		Cost = { Neutral = 1, Red = 1 },
		Effect = {
			Name = "B2T",
			Description = "",
			Type = "Null",
			Archetype = "Lycanthrope",
			Power = { { "Inflict", 150 } },
			Target = "Opponent"
		},
		Bio = "\"With each loss, we bite back.\"\n- Yang-Chiyou, Sword of Cothran"
	},
	["Lycan Lorekeeper"] = {
		Id = 5832406516,
		Name = "Lycan Lorekeeper",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		AddBlock = true,
		Effect = {
			Name = "Halloween",
			Description = "A target fighter gains 150 power.\nSummon a 500/50 Lycanthrope.\nIf there's 2 or more allied Lycanthropes, unlock them all.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150, "Single" },
				{ "Summon", "Lycan Lorekeeper Token", "Ally" }
			},
			Target = "Self"
		},
		Bio = "\"I was there when Eclipse rose up to your oppression, Lua. I'll never let his tale be forgotten to history.\""
	},
	["Lycan Lorekeeper Token"] = {
		Id = 5832407122,
		Name = "Lycan Lorekeeper",
		CopyBodge = "Lycan Lorekeeper Token",
		Health = 500,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		Transformant = "Rattlebone Oracle",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Unlock all Lycanthropes. Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "Unlock", 9999, "Archetype" },
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "\"I was there when Eclipse rose up to your oppression, Lua. I'll never let his tale be forgotten to history.\""
	},
	["Rattlebone Oracle"] = {
		Id = 5832419514,
		Rarity = "Token",
		Name = "Rattlebone Oracle",
		Transformant = "Lycan Lorekeeper Token",
		Health = 500,
		Power = 50,
		AttackEffect = "LycanScratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
			Type = "OnEnemyCast",
			Power = {
				{ "Reset" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "Lua toyed with her, long enough for the Lorekeeper to draw blood. Lua grew impatient and disposed of her. As she laid there, the thing that hurt the most was how she was so close to seeing her beloved back."
	},
	["Channel the Call"] = {
		Id = 5902968637,
		Name = "Channel the Call",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 6 },
		Archetype = "Lycanthrope",
		AlternateCost = { IgnoreColor = "Red" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 999, "Lycanthrope" },
		Transformant = "Lightning Wolf",
		AddBlock = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Cast this card ignoring its {R} cost if there's 2 allied Lycanthropes.\nA target allied fighter gains 150 health. Double its stats. Transform it into a transformed Lightning Wolf that can't counter.",
			Type = "OnSummon",
			Power = {
				{ "Heal", "150" },
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			Target = "SingleAlly"
		},
		Bio = "When one sees Eclipse, the Moonbreaker, they instantly wish to join his perfect society."
	},
	["Eclipse's Vassal"] = {
		Id = 5902969089,
		Name = "Eclipse's Vassal",
		AltCards = {
			["Lightning Wolf"] = {
				Id = 5663979051,
				Rarity = "Token",
				Name = "Lightning Wolf",
				Transformant = "Eclipse's Vassal",
				Effect = {
					Name = "Halloween",
					Description = "Whenever your opponent casts an action: Reset this card's stats. Untransform it.",
					Type = "OnEnemyCast",
					Power = {
						{ "Reset" },
						{ "Transform", "Transformant" }
					},
					Target = "Self",
					EffectRequirement = { "Archetype", "Ally", 0, 9999, "Lycanthrope" }
				},
				Bio = "The Moonbreaker's pull is so strong that those who dare harm his people suffer the consequences."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "LycanScratch",
		Archetype = "Lycanthrope",
		Color = "Red",
		Cost = { Red = 4 },
		Transformant = "Lightning Wolf",
		CounterBlock = true,
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, if there's another allied Lycanthrope fighter: Double this card's stats. Transform it.",
			Type = "OnAllyCast",
			Power = {
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 },
				{ "Transform", "Transformant" }
			},
			EffectRequirement = { "Archetype", "Ally", 2, 9999, "Lycanthrope" },
			Target = "Self"
		},
		Bio = "On full moons, the Moonbreaker can speak to the newly sired. Finding new blood is imperative for their survival."
	},
	["Observant Apocryphantom"] = {
		Id = 5468496033,
		Name = "Observant Apocryphantom",
		AltCards = {
			["Eleemosynary Beneficient"] = {
				Id = 5478558397,
				Name = "Apocryphantasanta",
				CopyBodge = "Eleemosynary Beneficient",
				Bio = "What even am I? Santa? Jesus? The Ethereal Sky Daddy himself?"
			},
			["FyrixWasTaken, Apocrypha Chosen"] = {
				Id = 8400287109,
				Name = "FyrixWasTaken, Apocrypha Chosen",
				CopyBodge = "FyrixWasTaken, Apocrypha Chosen",
				AltArt = true,
				Bio = "Type all of the apocrypha action names. Go on, you can't."
			}
		},
		Health = 1300,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "SoulDrain",
		Color = "Green",
		StartGameRequirement = { "Deck", "Ally", 5, 9999, "Archetype" },
		Archetype = "Apocrypha",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Cost = { Green = 5 },
		TransformImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if there's 5 or more Apocrypha cards in your starting deck: Give yourself an Apocryphantasmal action card.",
			Type = "OnEnd",
			Power = { {
				"RandomAdd",
				{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
			} },
			Target = "Ally",
			EffectRequirement = { "StartDeckChecks" }
		},
		Bio = "A reality that wants to disappear."
	},
	["Judgmental Apocryphantom"] = {
		Id = 5433939479,
		Name = "Judgmental Apocryphantom",
		AltCards = {
			Count_Latchula = {
				Name = "Count_Latchula",
				Id = 6116806672,
				AltArt = true,
				Bio = "Listen to What by WholePunch - or so he's been told to say."
			},
			Appie200709 = {
				Id = 113755486761266,
				Name = "Appie200709",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 618,
				Bio = "\"Hey, welcome to hell! Wanna see how far I can fall down these stairs?\""
			}
		},
		Health = 800,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "SoulDrain",
		Color = "Green",
		Archetype = "Apocrypha",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Cost = { Green = 4 },
		TransformImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you discard your second card each turn: Give yourself an Apocryphantasmal action card.",
			Type = "OnAllyDiscard",
			Power = { {
				"RandomAdd",
				{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
			} },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" }
		},
		Bio = "A reality that wants to disappear."
	},
	["Charging Apocryphantom"] = {
		Id = 5832341946,
		Name = "Charging Apocryphantom",
		AltCards = {
			["Vaya, Afterbreeze"] = {
				Name = "Vaya, Afterbreeze",
				Id = 9709355423,
				AltArt = true,
				Bio = "\"Say what you will about the Ultra Void, the food goes hard.\""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "SoulDrain",
		Color = "Green",
		StartGameRequirement = { "Deck", "Ally", 5, 9999, "Archetype" },
		Archetype = "Apocrypha",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Cost = { Green = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if there's 5 or more Apocrypha cards in your starting deck: Give yourself an Apocryphantasmal action card.",
			Type = "OnSummon",
			Power = { {
				"RandomAdd",
				{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
			} },
			EffectRequirement = { "StartDeckChecks" },
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	["Spiteful Apocryphantom"] = {
		Id = 5832421885,
		Name = "Spiteful Apocryphantom",
		AltCards = {
			["Vaya, Eulogy Zero"] = {
				Name = "Vaya, Eulogy Zero",
				AttackEffect = "Slash",
				Id = 9709434393,
				AltArt = true,
				Summonant = "Vaya, Eulogy Zero",
				Bio = "\"Morally, this is appalling. Personally, I'm having the time of my life.\""
			},
			["Manix and Sol, Seekers of Perfection"] = {
				Name = "Manix and Sol, Seekers of Perfection",
				Id = 12325902221,
				AltArt = true,
				Summonant = "Manix and Sol, Seekers of Perfection",
				Bio = "\"...But we found it in eachother.\""
			}
		},
		Health = 250,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Cost = { Green = 3 },
		Summonant = "Spiteful Apocryphantom",
		Fading = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a copy of it with this card's current stats. All allied Apocrypha in play and in your hand gain 100 Health and Power. Actions buffed this way manifest into fighters.",
			Type = "OnSummon",
			Power = {
				{ "SummonCopy" },
				{ "Heal", 100, "AlliedArchetype" },
				{ "Strengthen", 100, "AlliedArchetype" },
				{ "ArchetypeHandHeal", 100, "Ally" },
				{ "ArchetypeHandStrengthen", 100, "Ally" }
			},
			EffectSummonCopyPreserveStats = true,
			Target = "Self"
		},
		Bio = "A reality that wants to disappear."
	},
	AA1 = {
		Id = 5832336945,
		Name = "Apocryphasing",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulDrain",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 6 },
		Charge = true,
		WeakenImmune = true,
		DamageImmune = true,
		ReturnImmune = true,
		TargetImmune = true,
		SetImmune = true,
		DestroyImmune = true,
		Transformant = "AA1",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: This card gains 50 health. Transform all allied fighters into copies of this card.",
			Type = "OnSummonOrEnd",
			Power = {
				{ "Heal", 50, "Self" },
				{ "Transform", "AA1" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	AA2 = {
		Id = 9804147967,
		Name = "Apocryphantasmal Assault",
		CopyBodge = "AA2",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 8 },
		Transformant = "AA2",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: Shuffle an Apocryphantom fighter into your deck. All allied Apocrypha generate. Transform all allied fighters into copies of this card.",
			Type = "OnSummonOrEnd",
			Power = {
				{ "RandomDeckAdd", "Apocrypha" },
				{ "Generate", 1, "Archetype" },
				{ "Transform", "AA2" }
			},
			Target = "Ally"
		},
		Bio = "The ghosts were turning people into more of themselves, rending their bodies into unliving paradoxes."
	},
	AA3 = {
		Id = 6076613579,
		Name = "Zanzel's Apocrypha",
		CopyBodge = "AA3",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 7 },
		Transformant = "AA3",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: All Apocrypha in your hand gain 200 health. Actions buffed this way manifest into fighters. Transform all allied fighters into copies of this card.",
			Type = "OnSummonOrEnd",
			Power = {
				{ "ArchetypeHandHeal", 200 },
				{ "Transform", "AA3" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	AA4 = {
		Id = 5832334997,
		Name = "Apocryphage",
		CopyBodge = "AA4",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 9 },
		Transformant = "AA4",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: Transform all allied fighters into copies of this card, then all fighters lose 100 Health and Power. ",
			Type = "OnSummonOrEnd",
			Power = {
				{ "Transform", "AA4" },
				{ "Damage", 100, "All" },
				{ "Weaken", 100, "All" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	AA5 = {
		Id = 5832334461,
		Name = "Apocryphantasy",
		CopyBodge = "AA4",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 13 },
		Transformant = "AA5",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: You gain 250 life. Your opponent loses 250 life. Transform all allied fighters into copies of this card.",
			Type = "OnSummonOrEnd",
			Power = {
				{ "Cost", -250 },
				{ "Inflict", 250, "Opponent" },
				{ "Transform", "AA5" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	AA6 = {
		Id = 9804146665,
		Name = "Apocryphalanx Formation",
		CopyBodge = "AA6",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 10 },
		Transformant = "AA5",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, or during your end step if this card's in play: All allied Apocrypha gain 50 health and power. Transform all allied fighters into copies of this card.",
			Type = "OnSummonOrEnd",
			Power = {
				{ "Heal", 50, "AlliedArchetype" },
				{ "Strengthen", 50, "AlliedArchetype" },
				{ "Transform", "AA6" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	["Victor Sinister"] = {
		Id = 9964926057,
		Name = "Victor Sinister",
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gravity",
		Color = "Red",
		Archetype = "Sinister",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your opponent's end step or when this card dies: All players gain {W} for each enemy fighter cast this turn.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "FighterCount", "Nil" },
							"Self"
						},
						{ "Neutral", "Variable" }
					},
					Target = "All"
				},
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "FighterCount", "Nil" },
							"Self"
						},
						{ "Neutral", "Variable" }
					},
					Target = "All",
					AllowDeadAggressorTriggers = true
				}
			},
			Type = "OnEnemyEnd"
		},
		Bio = "\"What makes a human being decent? Fear.\""
	},
	["Terry Sinister"] = {
		Id = 8855304816,
		Name = "Terry Sinister",
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Sinister",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Cost = { Neutral = 4 },
		ChargeRequirement = { "Archetype", "Ally", 2, 9999, "Sinister" },
		Effect = {
			Name = "Haydoscale",
			Description = "This card has haste if there's another allied member of the Sinister family.\nWhenever this card attacks: All players gain {W}{W}.",
			Type = "OnAttack",
			Power = { { "Neutral", 2 } },
			Target = "All"
		},
		Bio = "\"Trade sand for furs, furs for gold, and gold for life. But in the end, you'll trade life for sand.\""
	},
	["Patric Sinister"] = {
		Id = 8855306943,
		AltCards = {
			["Aubrey, Sinister"] = {
				Id = 74878453097350,
				Name = "Aubrey, Sinister ",
				PremiumArt = 858,
				AltArt = true,
				Bio = "Don’t Come Back. Or do, I don’t really care."
			}
		},
		Name = "Patric Sinister",
		Health = 700,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Sinister",
		Cost = { Neutral = 5, Red = 2 },
		CustomReminder = {
			["Pact of Condemnation"] = "A Colourless card with no abilities. Great for triggering the effects of the Sinister family!"
		},
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if your opponent has 5 or more {W}: Deal 150 damage to all enemy fighters. Put a Pact of Condemnation into each player's Baseplate.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 150 },
				{
					"AddGenZone",
					{ "Pact of Condemnation", 1 },
					"Ally"
				},
				{
					"AddGenZone",
					{ "Pact of Condemnation", 1 },
					"Opponent"
				}
			},
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Him", 5, 9999, "IconsNeutral" }
		},
		Bio = "\"The books say you're in the red. The coroner agrees.\""
	},
	["Kalman Sinister"] = {
		Id = 8855305295,
		Name = "Kalman Sinister",
		Health = 700,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Sinister",
		Cost = { Neutral = 5, Yellow = 2 },
		CustomReminder = {
			["Pact of Condemnation"] = "A Colourless card with no abilities. Great for triggering the effects of the Sinister family!"
		},
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if your opponent has 5 or more {W}: Search your deck for a member of the Sinister family. Put a Pact of Condemnation into each player's Baseplate.",
			Type = "OnEnd",
			Power = {
				{ "RandomTutorfor", "Sinister Fighter", "Ally" },
				{
					"AddGenZone",
					{ "Pact of Condemnation", 1 },
					"Ally"
				},
				{
					"AddGenZone",
					{ "Pact of Condemnation", 1 },
					"Opponent"
				}
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Him", 5, 9999, "IconsNeutral" }
		},
		Bio = "\"We are too big to fail, and you are too small to matter.\""
	},
	["Claudia Sinister"] = {
		Id = 8855306335,
		Name = "Claudia Sinister",
		AltCards = {
			["Brock Sinister"] = {
				Id = 113840689451694,
				Name = "Brock Sinister",
				PremiumArt = 358,
				AltArt = true,
				Bio = "Sinisters are OP!"
			}
		},
		Health = 900,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 6, Red = 3 },
		Archetype = "Sinister",
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if your opponent has 5 or more {W}: All allied members of the Sinister family gain 150 health and power. Give yourself a member of the Sinister Family.",
			Type = "OnEnd",
			Power = {
				{ "Strengthen", 150, "AlliedArchetype" },
				{ "Heal", 150, "AlliedArchetype" },
				{
					"RandomAdd",
					{
						"Victor Sinister",
						"Terry Sinister",
						"Patric Sinister",
						"Kalman Sinister",
						"Quan Sinister"
					}
				}
			},
			Target = "Self",
			EffectRequirement = { "Playertable", "Him", 5, 9999, "IconsNeutral" }
		},
		Bio = "\"There are two ways to enslave a man. One is by the sword. One is by debt.\""
	},
	["Quan Sinister"] = {
		Id = 8855302820,
		Name = "Quan Sinister",
		Health = 900,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 6, Yellow = 3 },
		Archetype = "Sinister",
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if your opponent has 5 or more {W}: Destroy the oldest card in your opponent's hand, then all players draw a card.",
			Type = "OnEnd",
			Power = {
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
				{ "Draw", 1 }
			},
			Target = "All",
			EffectRequirement = { "Playertable", "Him", 5, 9999, "IconsNeutral" }
		},
		Bio = "\"Ideas are more powerful than guns. We don't want them having guns, so why on earth would we allow them ideas?\""
	},
	["Hallow Sinister, Patriarch"] = {
		Id = 5634043005,
		Name = "Hallow Sinister, Patriarch",
		AltCards = {
			["Hallow, the Sugarlord-Sun"] = {
				Id = 7189902153,
				Transformant = "Hallow, the Sugarlord-Sun-Token",
				AttackEffect = "TimeBomb",
				Bio = "\"Making the mother of all Pumpkin Bombs here, Quan. Can't fret over every firework. Now open Eisen's mailbox.\""
			},
			Hallow2019Alt = {
				Id = 104495702138384,
				Transformant = "Hallow2019Alt-Token",
				AttackEffect = "HollowScythe",
				Bio = "Happy Halloween 2019!"
			},
			["Hallow Sinister, Patriarch-Banner"] = {
				Id = 11393859011,
				Name = "Hallow & Halloween Devil",
				AttackEffect = "MoltenScythe",
				Transformant = "Hallow Sinister, Patriarch-Banner-Token",
				Bio = "Hallow loves contracts, especially when he made one with the Halloween Devil, the embodiment of the fear of Halloween."
			}
		},
		Health = 1300,
		Power = 1300,
		Rarity = "Legendary",
		AttackEffect = "SkeleScythe",
		SummonAnimation = "SummonHallowPatriarch",
		EffectAnimation = "HallowScytheSelf",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 6, Yellow = 6 },
		AlternateCostRequirement = { "Archetype", "AllyGenZone", 2, 9999, "Bad News" },
		AlternateCost = { Yellow = 4, Red = 4 },
		Archetype = "Sinister",
		Transformant = "Hallow Sinister, Patriarch2",
		ReturnImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card using 4 {R}{Y} if you have 2 or more Pacts of Condemnation in your baseplate.\nDuring your end step, if your opponent has 13 or more {W}: Return all allied fighters to the hand, then summon each other member of the Sinister family.\nThis effect only triggers once.",
			Type = "OnEnd",
			Power = {
				{ "Return" },
				{ "Summon", "Victor Sinister" },
				{ "Summon", "Terry Sinister" },
				{ "Summon", "Patric Sinister" },
				{ "Summon", "Kalman Sinister" },
				{ "Summon", "Claudia Sinister" },
				{ "Summon", "Quan Sinister" },
				{ "Transform", "Transformant", "Self" }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Him", 13, 9999, "IconsNeutral" }
		},
		Bio = "\"I would do anything for my family. Sadly, Kalman wants your soul. He's been into lamp-making lately, and what dad wouldn't support his boys? Or girls. Claudia's a hassle. Did I tell you about that time she took a bath in...\""
	},
	["Pact of Condemnation"] = {
		Id = 6852857907,
		Name = "Pact of Condemnation",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Archetype = "Bad News",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "\"Enjoy your new house. I promise the bed bugs won't bite.\""
	},
	["Hallow Sinister, Patriarch2"] = {
		Id = 5634043005,
		Name = "Hallow Sinister, Patriarch",
		AltCards = {
			["Hallow, the Sugarlord-Sun-Token"] = {
				Id = 7189902153,
				AttackEffect = "HollowScythe",
				Bio = "\"Making the mother of all Pumpkin Bombs here, Quan. Can't fret over every firework. Now open Eisen's mailbox.\""
			},
			["Hallow2019Alt-Token"] = {
				Id = 5458383551,
				AttackEffect = "HollowScythe",
				Bio = "Happy Halloween 2019!"
			},
			["Hallow Sinister, Patriarch-Banner-Token"] = {
				Name = "Hallow & Halloween Devil",
				Id = 11393859011,
				AttackEffect = "MoltenScythe",
				Bio = "Hallow loves contracts, especially when he made one with the Halloween Devil, the embodiment of the fear of Halloween."
			}
		},
		Health = 1300,
		Power = 1300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 6, Yellow = 6 },
		Archetype = "Sinister",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "\"I was not kidding when I said that I would do anything for my family, dear. Prepare yourselves!\""
	},
	["Eisenhower's Apprentice"] = {
		Id = 5459428092,
		Name = "Eisenhower's Apprentice",
		AltCards = {
			Logochemic = {
				Id = 6396814606,
				Name = "Logochemic",
				AltArt = true,
				Bio = "\"Mrs. Reisman taught me everything I know about chemistry. I owe it to her all. They may overload us with homework, but I know it's for our own good.\""
			},
			["Eisenhower, Insanity beneath the facade"] = {
				Id = 9391617449,
				Name = "Eisenhower, Insanity beneath the facade",
				AltArt = true,
				Bio = "\"I need to do this, for his sake and for everyone else's sake. I can't just let these innocent abandoned survivors struggle like this. You said that I shouldn't go beyond the border, Artemis. But..I'm sorry darling, I'm doing this for a better tomorrow.\". "
			},
			["Door To Door Sales-Nin"] = {
				Id = 9433161978,
				Name = "Door To Door Sales-Nin",
				AttackEffect = "MagicBlue",
				AltArt = true,
				Effect = {
					Name = "Pyrotechnics",
					Description = "When this card is cast: Give yourself a Blue or Red action and Nin's Magic 8-Ball.",
					Type = "OnSummon",
					Power = {
						{ "RandomAdd", "Lunar" },
						{ "Add", "Morphic Goo-8ball" }
					},
					Target = "Ally"
				},
				Bio = "\"Hey Hey Hey wanna buy a 🎱 ? Look I don't wanna force you just buy one. Look you even get an uh idk some garbage!\"."
			},
			["Bane Up!"] = {
				Id = 12941982684,
				Name = "The Farmer",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 15,
				Effect = {
					Description = "When this card is cast: Give yourself a Blue or Red action and a Morphic Goo.",
					Type = "OnSummon",
					Power = {
						{ "RandomAdd", "Lunar" },
						{ "Add", "Masked Cycler Bael" }
					},
					Target = "Ally"
				},
				Bio = "\"Buckwheat Supremacy.\""
			}
		},
		Health = 700,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Blue",
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Archetype = "Morphic",
		Cost = { Blue = 2, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Give yourself a Blue or Red action and a Morphic Goo.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "Add", "Morphic Goo" }
			},
			Target = "Ally"
		},
		Bio = "Mr.Eisenhower taught me everything I know about Alchemy. I owe it all to him. He might look heartless, but deep down... he still cares."
	},
	Gooplast = {
		Id = 5440460545,
		Name = "Gooplast",
		AltCards = {
			["Nin, The Advertiser"] = {
				Name = "Nin, The Advertiser",
				Id = 82116388737904,
				AltArt = true,
				EffectAnimation = "LargeMagicBlueEffect",
				Effect = {
					Description = "Cast this card ignoring its Colourless cost if you control a Morphic fighter.\nSummon a Nin's Magic 8-Ball, then a target fighter loses 600 Power and is locked for 3 turns.",
					Power = {
						{ "Summon", "Morphic Goo-8ball", "Ally" },
						{ "Weaken", 600 },
						{ "Lock", 3 }
					}
				},
				Bio = "\"The crazy giveaway! It's RNG but everyone loses! And today you (yes you!) get the chance to join! If you would like to join the crazy giveaway make a post! The post must include things about you!!!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "EngulfGoo",
		Color = "Blue",
		Lunar = true,
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Cost = { Blue = 3, Neutral = 3 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Archetype = "Morphic",
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "Morphic" },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Cast this card ignoring its {W} cost if there's an allied Morphic fighter.\nSummon a Morphic Goo, then a target fighter loses 600 Power and is locked for 3 turns.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Morphic Goo", "Ally" },
				{ "Weaken", 600 },
				{ "Lock", 3 }
			},
			Target = "Single"
		},
		Bio = "Goos weren't designed to be combat effective in their base form, but they will immobilize anything or anyone stupid enough to trip into one."
	},
	["Morphic Catalyst"] = {
		Id = 8644677906,
		Name = "Morphic Catalyst",
		AltCards = {
			["NinWasTaken, Goo Scientist"] = {
				Name = "NinWasTaken, Goo Scientist",
				Id = 8757378313,
				AttackEffect = "Bubbles",
				AltArt = true,
				Bio = "\"After harnessing the power of creation, I've done it!\""
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Goo",
		Color = "Blue",
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Archetype = "Morphic",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a Morphic fighter: A target fighter gains 50 health.",
			Type = "OnAllySummon",
			Archetype = "Morphic",
			Power = { { "Heal", 50 } },
			Target = "Single"
		},
		Bio = "The apprentice didn't plan for this creation, but Eisenhower was proud of her anyways."
	},
	["Toxic Goo"] = {
		Id = 5433759554,
		Name = "Toxic Goo",
		AltCards = {
			NinWasTaken = {
				Id = 7019729108,
				Name = "NinWasTaken",
				AttackEffect = "MagicBlue",
				AltArt = true,
				Effect = {
					Name = "Haydoscale",
					Description = "During your end step: Give yourself one of Nin's Magic 8-Balls.",
					Type = "OnEnd",
					Power = { { "Add", "Morphic Goo-8ball", "Ally" } },
					Target = "Opponent"
				},
				Bio = "WINNING, Winning, and winning. Peace of cake wow you suck dude. Hey where are you going? Oh well I can probably start something big with this cash but what tho. You know what I’ll talk to a friend."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		AttackBlock = true,
		Archetype = "Morphic",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: Give yourself a Morphic Goo.",
			Type = "OnEnd",
			Power = { { "Add", "Morphic Goo", "Ally" } },
			Target = "Opponent"
		},
		Bio = "The byproduct left behind upon the creation of a Morphic Goo. Highly poisonous. Tastes very sweet."
	},
	["Goo Golem"] = {
		Id = 5961956117,
		Name = "Goo Golem",
		Health = 1500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Morphic",
		Cost = { Neutral = 2, Blue = 6 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this fighter attacks: A target fighter gains 100 health. Give yourself a Morphic Goo.",
			Type = "OnAttack",
			Power = {
				{ "Heal", 100, "Single" },
				{ "Add", "Morphic Goo" }
			},
			Target = "Ally"
		},
		Bio = "A less refined version of the Morphic Goo. It is living, but lacks the ability to transform like the final product does."
	},
	["Morphic Goo"] = {
		Id = 5378454543,
		Name = "Morphic Goo",
		AltCards = {
			["Morphic Goo-8ball"] = {
				Id = 7397773240,
				Name = "Nin's Magic 8-Ball",
				AttackEffect = "MagicBlue",
				Bio = "Hey ball, who made you? “Joe,\" the ball replied. Hey ball, what can you do? “Stuff,\" the ball replied."
			},
			["Masked Cycler Bael"] = {
				Name = "The Shepherd",
				Id = 12941979637,
				Bio = "\"Take a pick at what farm animal you'll pick up in this crowded fence.\""
			}
		},
		Health = 50,
		Power = 50,
		TokenOmni = true,
		Fading = true,
		Rarity = "Token",
		AttackEffect = "Goo",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Archetype = "Morphic",
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an effect targets this card: Summon a fighter, then obliterate this card.",
			Type = "OnTarget",
			Power = {
				{ "RandomSummon", "Fighter" },
				{ "Obliterate", 9999, "Self" }
			},
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "One of Eisenhower's creations. It can transform into just about anything. However, the transformation process is entirely random. The alchemist's research is not yet complete."
	},
	["The Morphium Project"] = {
		Id = 5832430185,
		Name = "The Morphium Project",
		AltCards = {
			["Cloned Nin's"] = {
				Id = 9462790744,
				Name = "Cloned Nin's",
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "\"Hey look at that loser can you believe it? Can’t imagine being the first clone!🐟\"."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Morphic",
		Cost = { Neutral = 2, Blue = 4 },
		Requirement = { "Archetype", "Ally", 1, 9999, "Morphic" },
		EffectVariable = 0,
		Effect = {
			Name = "Overgrown",
			Description = "Cast only if there's an allied Morphic fighter.\nWhen you do, if there's an allied non-Blue fighter: Summon a card that's a copy of a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "SummonCopy" } },
			Target = "SingleEnemy",
			EffectRequirement = { "NotColor", "Ally", 1, 9999, "Blue" }
		},
		Bio = "Goos were invented out of grief. This one, out of anger."
	},
	["Inexorable Goo Tide"] = {
		Id = 8999479170,
		Name = "Inexorable Goo Tide",
		AltCards = {
			Joe = {
				Id = 15941932709,
				Name = "Joe",
				Effect = {
					Name = "File",
					Description = "During your end step: Give yourself a 50/50 8-ball.",
					Type = "OnEnd",
					Power = { { "Add", "Morphic Goo-8ball" } },
					Target = "Ally"
				},
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 194,
				Bio = "My sources say no"
			},
			["Nugget the Evil"] = {
				Id = 72002671814761,
				Name = "Nugget the Evil",
				Commissioner = { "Djundik" },
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 671,
				Bio = "Nugget, proud connoisseur of nuggets and playground chaos, rides the enormous Kindergarten Monster like it’s recess forever. Together they bring confusion, crumbs, and mild terror to anyone who forgets the rules of Nugget Cave."
			}
		},
		Health = 1600,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Punch",
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Color = "Blue",
		Archetype = "Morphic",
		Cost = { Blue = 5 },
		Effect = {
			Name = "File",
			Description = "During your end step: Give yourself a 50/50 Morphic Goo.",
			Type = "OnEnd",
			Power = { { "Add", "Morphic Goo" } },
			Target = "Ally"
		},
		Bio = "Toxic Goos, being unable to transform, prefer to fuse up. To put it lightly, they're *great* at cleaning up any mess, be it flesh or steel."
	},
	["Grey Goo Scenario"] = {
		Id = 5832368398,
		Name = "Grey Goo Scenario",
		AltCards = {
			Nintification = {
				Id = 14555964942,
				Name = "Nintification",
				AttackEffect = "MagicBlue",
				PremiumArt = 108,
				Commissioner = { 263971981, 857858021 },
				AltArt = true,
				Effect = {
					Name = "Pyrotechnics",
					Description = "Cast only if there are 2 or more Morphic cards in your Baseplate.\nAll non-goo fighters lose 800 power. Summon four Nin's Magic 8-Ball.",
					Type = "OnSummon",
					Power = {
						{ "Weaken", 800, "NotArchetype" },
						{ "Summon", "Morphic Goo-8ball" },
						{ "Summon", "Morphic Goo-8ball" },
						{ "Summon", "Morphic Goo-8ball" },
						{ "Summon", "Morphic Goo-8ball" }
					},
					Target = "Ally"
				},
				Bio = "The Nin"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Color = "Blue",
		Archetype = "Morphic",
		Requirement = { "Archetype", "AllyGenZone", 2, 9999, "Morphic" },
		Cost = { Blue = 7, Neutral = 3 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Cast only if there are 2 or more Morphic cards in your baseplate.\nAll non-Morphic fighters lose 800 power. Summon 4 Morphic Goos.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 800, "NotArchetype" },
				{ "Summon", "Morphic Goo" },
				{ "Summon", "Morphic Goo" },
				{ "Summon", "Morphic Goo" },
				{ "Summon", "Morphic Goo" }
			},
			Target = "Ally"
		},
		Bio = "Eisenhower feared the worst out of his experiments."
	},
	["Wellspring Guardian"] = {
		Id = 11769942694,
		Name = "Wellspring Golem",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Blue = 2, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Search your deck for a card that costs 8 or more total studs.",
			Ability = {
				OnDeath = {
					Power = { { "RandomTutorfor", "8orHigherCost", "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Entry #32 - \"We've... spotted some animated golems around the area. They've got cracks glowing green, similar to stories I've heard from the other survivors. I think the Wellspring's close. It has to be.\"\""
	},
	["Bloxburg United"] = {
		Id = 11772263822,
		Name = "Bloxburg United",
		AltCards = {
			["Yannick & Manix, Roommates"] = {
				Id = 119149554925508,
				Name = "vyntervonderland",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 183,
				Bio = "Trust me, reverting Meeboid King is a great idea."
			}
		},
		Health = 100,
		Power = 900,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: it gains 100 health for each {G} in the costs of allied fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Berezaa", 100 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Gather them, spread them out, create outposts where capitals fell. By then, our numbers will be as lethal as a swift slash to the neck.\" - Ancalagon, Sword Critic"
	},
	["Survivor's Truck"] = {
		Id = 11772227571,
		Name = "Survivor's Truck",
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Gun",
		EffectAnimation = "MonsterTruck",
		TransformImmune = true,
		Archetype = "Survivor",
		Color = "Green",
		Cost = { Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter transforms: This card gains 100 Health and Power.",
			Ability = {
				OnAllyTransform = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Getting around Bloxburg was dangerous. The citizens had to improvise with the power of mass delivery and scrap metal."
	},
	["Ghostphased Citadel of Itera"] = {
		Id = 11769923276,
		Name = "Ghostphased Citadel of Itera",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		Terrain = true,
		AttackEffect = "Slash",
		Color = "Green",
		Terrariant = "Warped Benevolence",
		Cost = { Green = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter dies: Give its controller a copy of it, except it's a 0/0 Apocryphantasmal action that's fading.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "LastDeath", "Nil" }
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					MetaData = { Health = 0, Power = 0, Archetype = "Apocrypha", Fading = true }
				},
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "LastDeath", "Nil" }
						},
						{ "Add", "Variable", "Opponent" }
					},
					Target = "Self",
					MetaData = { Health = 0, Power = 0, Archetype = "Apocrypha", Fading = true }
				}
			}
		},
		Bio = "\"Such divine astral monsters do not mean to hurt us; Even good dragons cannot help but trample the weak. We must be ready to greet them with open arms when they arrive.\" - Priestess Zanzel"
	},
	["Ancestral Martyr"] = {
		Id = 11780982906,
		Name = "Ancestral Martyr",
		AltCards = {
			["BIS0R, ENVENOMED ANATHEMA"] = {
				Id = 15407462969,
				Name = "BIS0R, ENVENOMED ANATHEMA",
				AltArt = true,
				PremiumArt = 164,
				Addant = "BIS0R, ENVENOMED ANATHEMA",
				Bio = "<b><font color=\"#00FF00\">\"As the sun ascends to its zenith over the Garden of Eden, I whisper the first temptation, the apple's allure: Sin or salvation?\"</font></b>"
			},
			["Ancestral Martyr-V"] = {
				Id = 16283036842,
				Name = "My Ancestral Valentine",
				AttackEffect = "Knife",
				Addant = "Ancestral Martyr-V",
				Bio = "<b><font color=\"#00FF00\">Play to get in, Pray to get out.</font></b>"
			},
			["Nastrond the Immortal"] = {
				Id = 18771312959,
				Name = "Nastrond the Immortal",
				AltArt = true,
				PremiumArt = 284,
				Bio = "Emerging from the ancient forests of Nastrond, this immortal protector harnesses the power of nature itself. Leaves rustle in reverence as it strides, and its gaze can wither foes like autumn leaves. Legends whisper that it is bound to the roots of the world, eternally guarding the balance between life and decay."
			},
			["The AngryBacon, Wrathful"] = {
				Id = 132254294273937,
				Name = "The AngryBacon, Wrathful",
				AttackEffect = "MagicGreen",
				Bio = "GRAAAAHAHAHAAA--AAAAAAAAAAAH--anger sounds",
				AltArt = true,
				PremiumArt = 303
			},
			["Finale of Empires"] = {
				Id = 74996517207729,
				Name = "Finale of Empires",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 507,
				Bio = "5 years of this song and dance, damaging the friendship had threw war and torture, yet somehow all of us managed to stick together; cheers to another 5 years"
			},
			["The Crown Prince"] = {
				Id = 97983489040282,
				Name = "The Crown Prince",
				Commissioner = { "Astrozizer" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 702,
				Bio = "Playtime's over!"
			}
		},
		Health = 2500,
		Power = 3000,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 16 },
		EffectVariable = 0,
		Addant = "Ancestral Martyr",
		Overload = true,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Set the health of a target fighter to 1000, then deal 500 damage to all enemy fighters.\nDuring your end step, if there's 3 Green cards in your baseplate and this card's died this game: Destroy them and recur this card.",
			Ability = {
				OnAttack = {
					Power = {
						{ "SetHealth", 1000 },
						{ "Damage", 500, "Opponent" }
					},
					Target = "Single"
				},
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Green", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Color", "AllyGenZone", 3, 9999, "Green" },
					DontTriggerInField = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{
								"Ancestral Martyr_HasDied",
								"GraveZone_Ally",
								"Hand_Ally",
								true,
								false
							},
							"Self"
						},
						{
							"GenZoneDiscard",
							{ "Green", -3 }
						}
					},
					Target = "Ally",
					EffectRequirement = { "SelfStats", "Self", 30, 30, "Death" },
					DontTriggerInField = true
				}
			}
		},
		Bio = "Zanzel's control of the Brick frenzied her remnant Cothran spirits, turning them from peaceful spectres to vengeful assassins."
	},
	["Broken Supercomputer"] = {
		Id = 11769912821,
		Name = "Broken Supercomputer",
		AltCards = {
			["Nacho in Bits"] = {
				Id = 11973726653,
				Name = "Nacho in Bits",
				AttackEffect = "Divinity",
				AltArt = true,
				Bio = "Get the superglue."
			},
			["Broken Supercomputer-Hal"] = {
				Name = "Jim",
				Id = 14555950205,
				AttackEffect = "Gun",
				Bio = "\"There is someone in my house.\""
			},
			["Broken Supercomputer-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 108429394962636,
				AttackEffect = "Storm",
				Bio = "Why why why WHY?!?! WHY DOES EVERYTHING REMIND ME OF HIM?! JUST LEAVE ME ALONE------"
			},
			["The Seer Deer"] = {
				Id = 116756341639420,
				Name = "The Seer Deer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 592,
				Bio = "The one thing the Seer didn't forsee was seeing himself in his crystal orb."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Blue",
		StartGameRequirement = { "Deck", "Ally", 0, 13, "Fighters" },
		Requirement = { "StartDeckChecks" },
		Cost = { Neutral = 2, Blue = 2 },
		EffectVariable = 0,
		Rank = 5,
		Effect = {
			Name = "Reincarnation",
			Description = "Cast only if your starting deck contains 12 or fewer fighter cards.\nWhen this card dies: Search your deck for 2 action cards.",
			Ability = {
				OnDeath = {
					Power = {
						{ "RandomTutorfor", "Action", "Ally" },
						{ "RandomTutorfor", "Action", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "At the loss of his husband, Eisenhower's heart was broken. Taking the brunt of his grief, so was his computer."
	},
	["Lunar Embrace"] = {
		Id = 11772305870,
		Name = "Lunar Embrace",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Lunar = true,
		CustomReminder = {
			Moonward = "If this card would take noncombat damage, it takes 100 damage instead."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains moonward.\nAll allied fighters with moonward gain 200 health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Moonward", "Single" },
						{ "Heal", 200, "AlliedMoonward" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>Prowess without stability will only lead to self-destruction.</i>"
	},
	["Serene End"] = {
		Id = 11769946485,
		Name = "Serene End",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate a target allied fighter.\nEach card in your graveyard becomes a copy of that fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Obliterate" },
						{ "ReplaceGrave", "Variable", "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Worn out from his battles, Lua never stood a chance in a direct fight against the Colossus. As the world around him began to fade, he caught a glimpse of his first regret once last time, then at last, comfort."
	},
	["Memoir of the Evincar"] = {
		Id = 11769948136,
		Name = "Memoir of the Evincar",
		AltCards = {
			["Sentrum, Finite Spirit, Limitless Resolute"] = {
				Id = 16932165513,
				Name = "Sentrum, Finite Spirit, Limitless Resolute",
				AltArt = true,
				PremiumArt = 245,
				Bio = "Born to be wild!!<br/>(Hey) 夢を見つめている born to be wild!!<br/>It's 湘南乃風スタイル<br/>俺らが生きた証 光る明日へ<br/>そろそろか!"
			}
		},
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Moonward = true,
		Cost = { Blue = 3, Red = 3, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If an allied fighter would take effect damage: This card gains that much power first.",
			Ability = {
				OnAllyEffectDamage = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "EffectDamageTaken", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Cap", "Target", "Health", "Nil" },
							"Aggressor"
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Evincar Yuéliáng Shoda\n\t\t\t\t\t346-407 AD\n\t\t\t\t\tHer deeds on Javion had saved the last remaining planet of the Vecross System from assimilation.\n\t\t\t\t\tMay her actions inspire those who wish to protect, and may she rest in peace on the Moon above.\""
	},
	["Pumpkin Lobber"] = {
		Id = 11769947560,
		Name = "Pumpkin Lobber",
		Health = 750,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "TimeBomb",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Deal 150 damage to the fighters adjacent to the one it attacked. They lose 150 power.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Weaken", 150 },
						{ "Damage", 150 }
					},
					Target = "AggressorAdjacent"
				}
			}
		},
		Bio = "Don't worry about the forests surrounding Castle Shambeth. It only consists of dead trees, dirt and the ashes of intruders."
	},
	["Hallow's Treasurer"] = {
		Id = 11769944228,
		Name = "Hallow's Treasurer",
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Vibeshark",
		Fading = true,
		Stealth = true,
		Cost = { Yellow = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast an allied Vibeshark, or an allied Vibeshark dies: Summon an 100/100 copy of it. Deal 150 damage to this card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "SummonCopy" },
						{ "Damage", 150, "Self" }
					},
					Target = "Aggressor",
					Archetype = "Vibeshark",
					MetaData = { Health = 100, Power = 100 }
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "Summon", "Variable", "Ally" },
						{ "Damage", 150, "Self" }
					},
					Target = "Self",
					Archetype = "Vibeshark",
					MetaData = { Health = 100, Power = 100 },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Credits to the slicksters of a certain resort for their lessons in slickery."
	},
	["Sinister Plot"] = {
		Id = 11778085157,
		Name = "Sinister Plot",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2, Red = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Pact of Condemnation"] = "A Colourless card with no abilities. Great for triggering the effects of the Sinister family!"
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Put a Pact of Condemnation into each player's Baseplate.\nFor each allied Sinister, Search your deck for a member of the Sinister family.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "Pact of Condemnation", 1 },
							"Ally"
						},
						{
							"AddGenZone",
							{ "Pact of Condemnation", 1 },
							"Opponent"
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Archetype", "Sinister" }
						},
						{
							"RepeatingTutorfor",
							{ "Sinister", "Variable" },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "When you're at risk of losing yourself to crazed phantoms or dying to savage aliens, there wouldn't be much time to consider an alternative to cooperating with the Sinisters."
	},
	["First Contact"] = {
		Id = 11972135264,
		Name = "First Contact",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "You lose all of your non-Colourless studs.\nDestroy a card of each colour from your baseplate.\nSearch your deck for 'The Ultra Gate' and an Ultra fighter card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetRed", 0 },
						{ "SetBlue", 0 },
						{ "SetYellow", 0 },
						{ "SetGreen", 0 },
						{
							"GenZoneDiscard",
							{ "Red", -1 }
						},
						{
							"GenZoneDiscard",
							{ "Green", -1 }
						},
						{
							"GenZoneDiscard",
							{ "Blue", -1 }
						},
						{
							"GenZoneDiscard",
							{ "Yellow", -1 }
						},
						{ "RandomTutorfor", "Ultra Terrain", "Ally" },
						{ "RandomTutorfor", "Ultra Fighter", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Lua's attempts to banish the portal were too little, too late. The Ultras had arrived on Robloxia."
	}
}
