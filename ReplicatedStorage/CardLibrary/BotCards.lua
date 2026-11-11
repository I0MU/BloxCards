



return {
	["K card"] = {
		Id = 7546667162,
		Name = "K",
		Health = 0,
		Power = 1,
		Rarity = "Token",
		AttackEffect = "Punch",
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		CounterAttackBlock = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "When this card is cast: Lose.",
			Type = "OnSummon",
			Power = "Inflict",
			Target = "Self",
			Increase = 99999
		},
		Bio = "These are worthless i dont know why i added these"
	},
	MasterHand = {
		Id = 8411160506,
		Name = "Demonic Godbeast",
		Health = 5000,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		CounterAttackBlock = true,
		ObliterateImmune = true,
		MoveGenZoneImmune = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "When this card dies: Ban yourself.",
			Type = "OnDeath",
			Power = "Inflict",
			Target = "Self",
			Increase = 99999
		},
		Bio = "No gimmicks... Apart from this one."
	},
	Bert = {
		Id = 8046538828,
		Name = "The Great Bert",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "BossMonster",
			Description = "When this card is cast: Set the health and power of all enemy fighters to 200. Summon a Beehive.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 200 },
				{ "SetPower", 200 },
				{ "Summon", "Beehive", "Ally" }
			},
			Target = "Opponent",
			AICard = true
		},
		Bio = "Always as twice as strong as his opponents."
	},
	Timothy = {
		Id = 8072463436,
		Name = "Hockey Player Timothy",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "BossMonster",
			Description = "When this card is cast: All enemy fighters lose 200 health and power. Summon a Beehive.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{ "Damage", 200 },
				{ "Summon", "Beehive", "Ally" }
			},
			Target = "Opponent",
			AICard = true
		},
		Bio = "He certainly is!"
	},
	["Hallow's Eve"] = {
		Id = 3899534211,
		Name = "Hallow's Eve",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		Field = 1549933495,
		Terrain = true,
		Effect = {
			Name = "Spook",
			Description = "At the start of each player's turn: That player puts a Red, Blue, Green, and Yellow card into their hand, shuffles a Hallow's Bargain into their deck, then draws a card.",
			Type = "OnStart",
			Power = {
				{ "RandomAdd", "Blue" },
				{ "RandomAdd", "Red" },
				{ "RandomAdd", "Green" },
				{ "RandomAdd", "Yellow" },
				{ "DeckAdd", "Hallow's Bargain" },
				{ "Draw", 1 }
			},
			Target = "CurrentTurn"
		},
		Bio = "The true spirit of Halloween."
	},
	["Crow of Eternal Torment"] = {
		Id = 8650911497,
		Name = "Crow of Eternal Torment",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		Charge = true,
		Effect = {
			Name = "Matriarch",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "The Matriarch's favourite bird. Well rounded, versatile, and good on the front lines."
	},
	["Bird of Eternal Paradise"] = {
		Id = 8691470010,
		Name = "Bird of Eternal Paradise",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		DamageImmune = true,
		WeakenImmune = true,
		Effect = {
			Name = "Matriarch",
			Description = "Immune to effects that lower Health or Power. When this card is cast: All birds gain 100 Health. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "Archetype" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "The Matriarch searched far and wide, to all corners of Robloxia to find her most exotic allies."
	},
	["Parrot of Eternal Dominion"] = {
		Id = 9034077574,
		Name = "Parrot of Eternal Dominion",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		CounterAttackBlock = true,
		Effect = {
			Name = "Matriarch",
			Description = "When this card is cast: All birds gain 100 power. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100, "Archetype" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "The best birds are those with birds of their own."
	},
	["Eternal Tweety"] = {
		Id = 8644066127,
		Name = "Eternal Tweety",
		Health = 250,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		Effect = {
			Name = "Matriarch",
			Description = "When this card is cast: Ready all allied birds.",
			Type = "OnSummon",
			Power = { { "Unlock", 1 } },
			Target = "AlliedArchetype"
		},
		Bio = "Does The Matriarch control Tweety, or does Tweety control The Matriarch?"
	},
	["Bird Colossus"] = {
		Id = 8644063908,
		Name = "Bird Colossus",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Requirement = { "Archetype", "Ally", 8, 9999, "Bird" },
		Archetype = "Bird",
		Effect = {
			Name = "Matriarch",
			Description = "Cast only if there's 8 allied Birds.\nCombine them into the Bird Colossus.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 0, "AlliedArchetype" },
				{ "Summon", "Bird Colossus 2" }
			},
			Target = "Ally"
		},
		Bio = "Does The Matriarch control Tweety, or does Tweety control The Matriarch?"
	},
	["Bird Colossus 2"] = {
		Id = 8644063908,
		Name = "Bird Colossus",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		SetImmune = true,
		DamageImmune = true,
		WeakenImmune = true,
		CounterBlock = true,
		DestroyImmune = true,
		CounterAttackBlock = true,
		StealImmune = true,
		CloneImmune = true,
		CopyImmune = true,
		AddBlock = true,
		Rank = 44,
		Effect = {
			Name = "Matriarch",
			Description = "During your end step: Your opponent loses 400 life. Fill your board with birds.",
			Type = "OnEnd",
			Power = {
				{ "Inflict", 400, "Opponent" },
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				},
				{
					"RandomSummon",
					{
						"Crow of Eternal Torment",
						"Bird of Eternal Paradise",
						"Parrot of Eternal Dominion",
						"Eternal Tweety"
					}
				}
			},
			Target = "Ally"
		},
		Bio = "We know who is in charge now."
	},
	["Blacken the Skies"] = {
		Id = 8650904869,
		Name = "Blacken the Skies",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Matriarch",
			Description = "Shuffle a copy of the Matriarch's deck into your deck, and draw five cards. You gain 5000 life.",
			Type = "OnSummon",
			Power = {
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Crow of Eternal Torment" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Bird of Eternal Paradise" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Parrot of Eternal Dominion" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Eternal Tweety" },
				{ "DeckAdd", "Bird Colossus" },
				{ "DeckAdd", "Divine Favor" },
				{ "DeckAdd", "Blacken the Skies" },
				{ "DeckAdd", "Blacken the Skies" },
				{ "Draw", 5 },
				{ "Cost", -5000 }
			},
			Target = "Ally"
		},
		Bio = "How can you kill someone with a duststorm if they simply fly away?"
	},
	["Fatal Discovery"] = {
		Id = 9827066553,
		Name = "Fatal Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Scholar",
			Description = "You win the game.",
			Type = "OnSummon",
			Power = { { "Ban", 999999, "Opponent" } },
			Target = "Ally"
		},
		Bio = "At last, The Scholar found what he was looking for."
	},
	["Shedletsky, the Fried One"] = {
		Id = 291389590,
		Name = "Shedletsky, the Fried One",
		Health = 9999,
		Power = 9999,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Green = 5, Blue = 5, Yellow = 5, Red = 5 },
		OmniImmune = true,
		SummonAnimation = "TelamonSummon",
		SummonedAnimation = "TelamonSummon",
		EffectAnimation = "SelfShedletsky",
		Effect = {
			Name = "Stud",
			Description = "During your end step: Obliterate your opponents Baseplate, then unlock all tokens.",
			Type = "OnEnd",
			Power = {
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
				{ "Unlock", 999, "Token" }
			},
			Target = "Opponent",
			GenZoneDiscardObliterate = true
		},
		Bio = "THAT'S SOME STRONG GOO, ISN'T IT"
	},
	["InceptionTime Token"] = {
		Id = 3238120727,
		Name = "InceptionTime",
		AltCards = {
			["RaidInceptionTime Token"] = {
				Effect = {
					Name = "Revival",
					Description = "During your end step: Summon a Maladeity's Pustule, Then shuffle a Maladeity's Pustule into your deck.",
					Type = "OnEnd",
					Power = {
						{ "Summon", "Maladeity's Pustule" },
						{ "DeckAdd", "Maladeity's Pustule" }
					},
					Target = "Ally"
				}
			}
		},
		Health = 2000,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Red = 2, Green = 2, Blue = 2, Yellow = 2, Neutral = 2 },
		OmniImmune = true,
		Effect = {
			Name = "Revival",
			Description = "During your end step: Summon a random terrarian, put a random terrarian into your hand, and put Maladeity's Pustule into your deck.",
			Type = "OnEnd",
			Power = {
				{
					"RandomSummon",
					{
						"Sword Terrain",
						"Disaster Terrain",
						"Crossroads Terrain",
						"Ninja Terrain",
						"Haunted Terrain",
						"Caverns Terrain",
						"Bread Terrain",
						"Rain Terrain",
						"Sands Terrain",
						"Baseplate Terrain",
						"Paradise Terrain",
						"Banland Terrain",
						"Fens Terrain",
						"Tree Terrain",
						"World Terrain",
						"Voidoak Terrain",
						"Xor's Terrain",
						"Minigame Terrain",
						"Domain Terrain",
						"Presence Terrain",
						"Ultra Terrain",
						"Mo Terrain",
						"Hazenwyld Terrain",
						"Bloxburg Terrain",
						"Laboratory Terrain",
						"Shambeth Terrain",
						"Maladeity's Pustule"
					}
				},
				{
					"RandomAdd",
					{
						"Sword Terrain",
						"Disaster Terrain",
						"Crossroads Terrain",
						"Ninja Terrain",
						"Haunted Terrain",
						"Caverns Terrain",
						"Bread Terrain",
						"Rain Terrain",
						"Sands Terrain",
						"Baseplate Terrain",
						"Paradise Terrain",
						"Banland Terrain",
						"Fens Terrain",
						"Tree Terrain",
						"World Terrain",
						"Voidoak Terrain",
						"Xor's Terrain",
						"Minigame Terrain",
						"Domain Terrain",
						"Presence Terrain",
						"Ultra Terrain",
						"Mo Terrain",
						"Hazenwyld Terrain",
						"Bloxburg Terrain",
						"Laboratory Terrain",
						"Shambeth Terrain",
						"Maladeity's Pustule"
					}
				},
				{ "DeckAdd", "Maladeity's Pustule" }
			},
			Target = "Ally"
		},
		Bio = "And people said living world was dumb..."
	},
	["Master Acolyte's Altar"] = {
		Id = 1480565605,
		Name = "Master Acolyte's Altar",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicRed",
		EffectAnimation = "AcolyteAltar",
		Archetype = "Acolyte",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		SwapImmune = true,
		Effect = {
			Name = "Acolyte",
			Description = "This card can't be swapped. During your end step: Put one of every stud into your Baseplate.",
			Type = "OnEnd",
			Power = {
				{
					"AddGenZone",
					{ "Stud", 1 }
				},
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
		Bio = "Tfw the devs can't make AI play well so they have to make OP cards and cheat their way to victory."
	},
	["Drager's Disgust"] = {
		Id = 362314946,
		Name = "Old PEEPSTERS",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "I quit.",
			Description = "When this card is cast: Give yourself a random Doge card. Shuffle a copy of this card into your deck.",
			Type = "OnSummon",
			Power = {
				{
					"RandomAdd",
					{
						"DogeEmpowered",
						"Captain Doge",
						"Drager's Disgust",
						"Shamrock Doge",
						"Themediamogul99",
						"Abraham Doge",
						"Uncle Doge",
						"TrollTideTroll",
						"KolbyEmpowered",
						"CALL OF DOGE!?!"
					}
				},
				{ "DeckAdd", "Drager's Disgust" }
			},
			Target = "Ally"
		},
		Bio = "This card used to actually exist. Pretty scary, huh?"
	},
	DogeEmpowered = {
		Id = 283993269,
		Name = "Old Doge",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Token = true,
		Cost = { Neutral = 0 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Purlot",
			Description = "\nWhen this card is cast: All fighters gain 50 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 50 } },
			Target = "All"
		},
		Bio = "Such claws. Much stats. Very game. Wow."
	},
	KolbyEmpowered = {
		Id = 5947350806,
		Name = "Kolby2020",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicYellow",
		Archetype = "Doge",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Kobe can doge a ball",
			Description = "Whenever this card attacks: Give yourself a random Doge card.",
			Type = "OnAttack",
			Power = { {
				"RandomAdd",
				{
					"DogeEmpowered",
					"Captain Doge",
					"Shamrock Doge",
					"Themediamogul99",
					"Abraham Doge",
					"Uncle Doge",
					"Drager's Disgust",
					"TrollTideTroll",
					"KolbyEmpowered",
					"CALL OF DOGE!?!"
				}
			} },
			Target = "Self"
		},
		Bio = "Kolby can doge a ball."
	},
	TG1 = {
		Id = 8854896607,
		Name = "Crazy Robloxian",
		CopyBodge = "TG1",
		Health = 300,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "A shining example of the joy of Old Roblox."
	},
	TG2 = {
		Id = 3416136920,
		Name = "Astral Isle Sorcerer",
		CopyBodge = "TG2",
		Health = 450,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 4 },
		Bio = "Violence is crass and destructive. Magic is used to grow, not to destroy.",
		Effect = {
			Description = "At the end of your turns: All allied fighters gain 50 Health and 50 Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 50 },
				{ "Strengthen", 50 }
			},
			Target = "Ally"
		}
	},
	TG3 = {
		Id = 3410792370,
		Name = "Egg Hunter",
		CopyBodge = "TG3",
		Health = 300,
		Power = 50,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Remember when Roblox rained eggs onto every game so hard they broke their servers? Good times."
	},
	TG4 = {
		Id = 8854898636,
		Name = "Epic Turtle",
		CopyBodge = "TG4",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 1 },
		Bio = "Feed it berries and watch its epicness grow!",
		Effect = {
			Description = "When this card is cast: A target allied fighter gains 200 Health.",
			Type = "OnSummon",
			Power = { { "Heal", 200 } },
			Target = "TargetAlly"
		}
	},
	TG5 = {
		Id = 3410793651,
		CopyBodge = "TG5",
		Name = "Scion of Yaxocieus",
		Health = 1400,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 7 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The lords of Nomrial put our Great Leader to rest. He will rise again."
	},
	TR1 = {
		Id = 3416718679,
		CopyBodge = "TR1",
		Name = "RAT Assault Unit",
		DiscardBlock = true,
		AltCards = {
			TR1T = { TutorialBias2 = true }
		},
		Health = 400,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Rifle",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Description = "During your end step: This card gains 50 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 50 } },
			Target = "Self"
		},
		Bio = "Who among you has the courage to face certain death? Who among you will heed our call?"
	},
	TR2 = {
		Id = 3410793416,
		Name = "Pro Swordfighter",
		CopyBodge = "TR2",
		Health = 400,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3 },
		Bio = "Try lagswitching out of this one, casual.",
		Effect = {
			Description = "When this card is cast: A target fighter gains 200 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "TargetAlly"
		}
	},
	TR3 = {
		Id = 3410969294,
		Name = "Black Hat Hacker",
		CopyBodge = "TR3",
		DiscardBlock = true,
		Health = 200,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "You forgot to add FilteringEnabled, nerd."
	},
	TR4 = {
		Id = 5002677937,
		Name = "Armored Patrol Tank",
		CopyBodge = "TR4",
		AltCards = {
			TR4T = {
				Cost = { Neutral = 1, Red = 3 },
				AttackEffect = "ModernRocket",
				Health = 200,
				Power = 900,
				Effect = {
					Id = 4151870586,
					Name = "BossMonster",
					Description = "When this card is cast: The allied fighter with the lowest power gains 600 power.",
					Type = "OnSummon",
					Power = { { "Strengthen", 600 } },
					Target = "TutorialBias2"
				}
			},
			TR4T2 = {
				Cost = { Neutral = 2, Red = 2 },
				AttackEffect = "ModernRocket",
				Health = 300,
				Power = 200,
				Effect = {
					Id = 4151870586,
					Name = "BossMonster",
					Description = "When this card is cast: Deal 300 damage to a target enemy fighter.",
					Type = "OnSummon",
					Power = { { "Damage", 300 } },
					Target = "SingleEnemy"
				}
			}
		},
		DiscardBlock = true,
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Bio = "We've gotta take their base!",
		EffectAnimation = "MidModernRocketEffect",
		CustomReminder = {
			Allies = "A fighter is an ally if it's yours.",
			Enemies = "A fighter is an enemy if it isn't."
		},
		Effect = {
			Id = 4151870586,
			Description = "When this card is cast: Deal 200 damage to a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 200 } },
			Target = "TargetEnemy"
		}
	},
	TR5 = {
		Id = 5013757153,
		Name = "Lord Crimsonwrath",
		CopyBodge = "TR5",
		AltCards = {
			TR5T = { DiscardBlock = true, Baseplatable = true }
		},
		Health = 400,
		Power = 1100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Flare",
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "You'll wish for the coldness of the Void."
	},
	TR6 = {
		Id = 4151870171,
		CopyBodge = "TR6",
		Name = "Linked Sword Strike",
		AltCards = {
			TR6T = {
				Effect = {
					Description = "Deal 300 damage to all enemy fighters.",
					Type = "OnSummon",
					Power = { { "Damage", 300 } },
					Target = "Opponent"
				}
			}
		},
		DiscardBlock = true,
		EffectAnimation = "LinkedSwordStrike",
		Effect = {
			Id = 4151870586,
			Name = "BossMonster",
			Description = "Deal 200 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 200 } },
			Target = "Opponent"
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Red",
		Cost = { Neutral = 2, Red = 3 },
		Bio = "The bigger they are, the larger the hitbox."
	},
	TB1 = {
		Id = 3410793546,
		Name = "Programmer",
		AltCards = {
			TB1T = {
				Health = 400,
				Power = 100,
				Rarity = "Token",
				AttackEffect = "MagicBlue",
				EffectAnimation = "MidPaintballEffect",
				Color = "Blue",
				Cost = { Neutral = 2 }
			}
		},
		CopyBodge = "TB1",
		Health = 400,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Bio = "Studio has stopped working? I'll just wait a few more minutes, I'm sure it will be up and running soon!"
	},
	TB2 = {
		Id = 3410793322,
		Name = "Pinewood Architect",
		AltCards = {
			TB2T = {
				Health = 600,
				Power = 200,
				Rarity = "Token",
				AttackEffect = "MagicBlue",
				EffectAnimation = "MidPaintballEffect",
				Color = "Blue",
				Cost = { Neutral = 2 },
				Effect = nil
			}
		},
		CopyBodge = "TB2",
		Health = 500,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Bio = "For the love of God, can we NOT cause today's 5th nuclear core meltdown!?",
		CustomReminder = {
			Casting = "A card is cast when it's put into play from the hand.",
			Locking = "Locked fighters can't attack."
		},
		Effect = {
			Description = "When this card is cast: Lock a target enemy fighter for 1 turn.",
			Type = "OnSummon",
			Power = { { "Lock", 1 } },
			Target = "TargetEnemy"
		}
	},
	TB3 = {
		Id = 3410793874,
		Name = "White Hat Hacker",
		CopyBodge = "TB3",
		Health = 200,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Like a bandit that locks up your house for you."
	},
	TB4 = {
		Id = 3410792709,
		Name = "Legokid",
		CopyBodge = "TB4",
		Health = 200,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "LinkedSword",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "equip sword:"
	},
	TB5 = {
		Id = 3410791825,
		Name = "Biograft Cyborg",
		AltCards = {
			TB5T = {
				Health = 300,
				Power = 400,
				Rarity = "Token",
				AttackEffect = "MagicBlue",
				EffectAnimation = "MidPaintballEffect",
				Color = "Blue",
				Cost = { Neutral = 6, Blue = 1 },
				Summonant = "TB5T",
				Effect = {
					Description = "When this card is cast: Summon two copies of this card.",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				}
			}
		},
		CopyBodge = "TB5",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Blue = 5 },
		Bio = "I never asked for this.",
		Effect = {
			Description = "When this card is cast: Return a target fighter to the hand.",
			Type = "OnSummon",
			Power = { { "Return" } },
			Target = "TargetEnemy"
		}
	},
	TY1 = {
		Id = 103003355824195,
		Name = "Baby Robloxian",
		CopyBodge = "TY1",
		BattleModel = "TestModelAnimation",
		Health = 200,
		Power = 100,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "123 for baby"
	},
	TY2 = {
		Id = 3410792030,
		Name = "Blockhead",
		CopyBodge = "TY2",
		BattleModel = "TestModel",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = ":>"
	},
	TY3 = {
		Id = 5002451730,
		Name = "Builders Club Trainee",
		CopyBodge = "TY3",
		BattleModel = "TestModel2",
		Health = 100,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Huh? Why did they give this helmet ou-"
	},
	TY4 = {
		Id = 3410793785,
		Name = "Skateboarder",
		CopyBodge = "TY4",
		Health = 100,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Charge = true,
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Bio = "So here I am doing / everything I can / holding on to what I am / pretending I'm a Superman",
		Effect = {
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		}
	},
	TY5 = {
		Id = 3410792853,
		Name = "Limited Tradeshark",
		CopyBodge = "TY5",
		Health = 100,
		Power = 300,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Bio = "Yeah, I've got a Valkyrie and a Wanwood Crown. LMAD?",
		Effect = {
			Description = "When this card is cast: A target allied fighter gains 100 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 100 } },
			Target = "TargetAlly"
		}
	},
	TY6 = {
		Id = 3410793190,
		Name = "Outrageous Builder",
		CopyBodge = "TY6",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Bio = "Before the introduction of DevEx, you could buy a lifetime of Outrageous Builder's club for $349.95. (That's about six Yellow studs.)",
		Effect = {
			Description = "When this card is cast: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally"
		}
	},
	["Aura of the Promised One"] = {
		Id = 8606734525,
		Name = "Aura of the Promised One",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Green",
		Cost = { Green = 0 },
		DiscardBlock = true,
		AddBlock = true,
		Effect = {
			Name = "deez nuts",
			Description = "When this card is cast: Add a Green Stud and a Mark Stud to your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Green Stud", 1 },
					"Ally"
				},
				{
					"AddGenZone",
					{ "Mark Stud", 1 },
					"Ally"
				}
			},
			Target = "Ally"
		},
		Bio = "right me"
	},
	ZanzelApocryphantasm = {
		Id = 8606710539,
		Name = "Apocryphantasm",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "SoulDrain",
		Color = "Green",
		AddBlock = true,
		Archetype = "Apocrypha",
		Cost = { Green = 5 },
		Effect = {
			Name = "deez nuts",
			Description = "When this card is cast: Give yourself 2 Apocrypha actions. Then, all Apocryphantom cards in your hand gain 200 Health and Power.",
			Type = "OnSummon",
			Power = {
				{
					"RandomAdd",
					{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
				},
				{
					"RandomAdd",
					{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
				},
				{ "ArchetypeHandHeal", 200 },
				{ "ArchetypeHandStrengthen", 200 }
			},
			Target = "Ally"
		},
		Bio = "right me"
	},
	["Alpha Brick's Aid"] = {
		Id = 8606709129,
		Name = "Alpha Brick's Aid",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Green",
		Cost = { Green = 0 },
		DiscardBlock = true,
		AddBlock = true,
		Effect = {
			Name = "deez nuts",
			Description = "When this card is cast: Obliterate the board. Gain 2000 Life. Draw 4 cards.",
			Type = "OnSummon",
			Power = {
				{ "Obliterate", 30 },
				{ "Add", "Alpha Brick's Destruction-AltBorder" },
				{ "Draw", 3, "Ally" },
				{ "Inflict", -2000, "Ally" }
			},
			Target = "All"
		},
		Bio = "write me"
	},
	ZanzelParadise = {
		Id = 1469010000,
		Name = "Bird of Eternal Paradise",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 0 },
		Archetype = "Bird",
		DamageImmune = true,
		WeakenImmune = true,
		AddBlock = true,
		Effect = {
			Name = "Matriarch",
			Description = "Immune to effects that lower Health or Power. When this card is cast: All birds gain 100 Health. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "Archetype" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "The Matriarch searched far and wide, to all corners of Robloxia to find her most exotic allies."
	},
	ZanzelCharging = {
		Id = 5832341946,
		Name = "Charging Apocryphantom",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Color = "Green",
		AddBlock = true,
		Archetype = "Apocrypha",
		Cost = { Green = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast, if there are 5 Apocrypha cards in your deck: Give yourself an Apocryphantasmal action card.",
			Type = "OnSummon",
			Power = { {
				"RandomAdd",
				{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
			} },
			EffectRequirement = { "Deck", "Ally", 5, 9999, "Archetype" },
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	ZanzelSpiteful = {
		Id = 5832421885,
		Name = "Spiteful Apocryphantom",
		Health = 500,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		SummonAnimation = "ApocSummon",
		DeathAnimation = "ApocDeath",
		Color = "Green",
		AddBlock = true,
		Archetype = "Apocrypha",
		Cost = { Green = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a clone of it. All Apocrypha in play and in your hand gain 100 Health and Power. Actions buffed this way manifest into fighters.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "ZanzelSpiteful" },
				{ "Heal", 100, "Archetype" },
				{ "Strengthen", 100, "Archetype" },
				{ "ArchetypeHandHeal", 100, "Ally" },
				{ "ArchetypeHandStrengthen", 100, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "A reality that wants to disappear."
	},
	ZanzelCat = {
		Id = 4793138029,
		Name = "Magic Broom Black Cat",
		Health = 700,
		Power = 250,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		EffectAnimation = "Poof",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 3 },
		Effect = {
			Name = "Me-OUCH!",
			Description = "When this card is cast: Transform a target fighter into a Snail.",
			Type = "OnSummon",
			Power = { { "Transform", "Snail", "Single" } },
			Target = "Single"
		},
		Bio = "Dormant since October 5th 2016."
	},
	ZanzelTree = {
		Id = 4899305650,
		Name = "Dominus Praefectus",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		AddBlock = true,
		Cost = { Neutral = 10 },
		Effect = {
			Name = "Fanaticism",
			Description = "When this card dies: Put three Green Studs into your Baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 3 }
			} },
			Target = "Ally"
		},
		Bio = "Why grow anything when you can grow heaven?"
	},
	ZanzelEpidemic = {
		Id = 5046793430,
		Name = "Mass Epidemic",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Archetype = "Boardwipe",
		AttackEffect = "MagicYellow",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 6 },
		Effect = {
			Name = "Board Clear Preparation!",
			Description = "Deal 1000 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 1000 } },
			Target = "NotArchetype"
		},
		Bio = "NOOOOO!! MY SKELETON ARMY!!!"
	},
	ZanzelPerfection = {
		Id = 5594609488,
		Name = "Survivors of Perfection",
		Health = 500,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Cost = { Neutral = 3 },
		WeakenImmune = true,
		BypassOverdrive = true,
		TransformImmune = true,
		AddBlock = true,
		Archetype = "Survivor",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Each allied fighter becomes a copy of it.",
			Type = "OnSummon",
			Power = { { "Transform", "Survivors of Perfection" } },
			Target = "Ally"
		},
		Bio = "Zanzel's people didn't get a vote in any of this. Their role was to witness it."
	},
	["ZanzelH-Thunder"] = {
		Id = 4784604008,
		Name = "Lightning Blast",
		Power = 0,
		Health = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Zappow!",
			Description = "Deal 4000 damage to fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 4000 } },
			Target = "All"
		},
		Bio = "Perish."
	},
	ZanzelTBolt = {
		Id = 4784599356,
		Name = "Thunder Bolt",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Zappow!",
			Description = "Deal 4000 damage to fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 4000 } },
			Target = "All"
		},
		Bio = "Zap!"
	},
	ZanzelRepentant = {
		Id = 4720418762,
		Name = "Zanzel Repentant",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		Transformant = "ZanzelRekindled",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 6 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is first cast: Shuffle five bird cards into your deck. Whenever you cast a Bird: Transform Zanzel. She gains 600 health and power.",
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
						{ "DeckAdd", "Crow of Eternal Torment", "Ally" },
						{ "Heal", 600, "Self" },
						{ "Strengthen", 600, "Self" },
						{ "Transform", "Transformant", "Self" }
					},
					Archetype = "Bird",
					Target = "Self",
					EffectRequirement = { "Archetype", "Ally", 1, 9999, "Bird" }
				}
			},
			EffectTransformPreserveRarity = true,
			Target = "Ally"
		},
		Bio = "The vision from the Alpha Brick lead me to break the world. The transgression is too great. I will pay for what I did..."
	},
	ZanzelRepentantToken = {
		Id = 4841680843,
		Name = "Zanzel Repentant",
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 6 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a Bird: Transform Zanzel. She gains 600 health and power.",
			Type = "OnAllySummon",
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
		Bio = "The vision from the Alpha Brick lead me to break the world. The transgression is too great. I will pay for what I did..."
	},
	ZanzelRekindled = {
		Id = 10288464116,
		Name = "Zanzel Rekindled",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 6 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a Bird: Shuffle a Bird card into your deck.",
			Type = "OnAllySummon",
			Power = { { "DeckAdd", "Crow of Eternal Torment" } },
			Archetype = "Bird",
			Target = "Ally"
		},
		Bio = "...But I will hardly stand idly by while these heathens break the world twice over!"
	},
	ZanzelsWorld = {
		Id = 5574241280,
		Name = "Living World",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Stealth = true,
		AttackEffect = "Slash",
		Color = "Green",
		AddBlock = true,
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Animate the current terrain into a fighter. Return this card to your hand.",
			Type = "OnSummon",
			Power = {
				{ "AnimateTerrain" },
				{ "Add", "ZanzelsWorld" }
			},
			Target = "Ally"
		},
		Bio = "The neodragons weren't the only creations sprang from time's destruction."
	},
	ZanzelObservant = {
		Id = 5468496033,
		Name = "Observant Apocryphantom",
		Health = 1300,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 5 },
		TransformImmune = true,
		AddBlock = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast or during your end steps, if you have 4 or fewer cards in your hand: Give yourself an Apocrypha action.",
			Type = "OnSummonOrEnd",
			Power = { {
				"RandomAdd",
				{ "AA1", "AA2", "AA3", "AA4", "AA5", "AA6" }
			} },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 5, "Hand" }
		},
		Bio = "A reality that wants to disappear."
	},
	ZanzelJudgmental = {
		Id = 5433939479,
		Name = "Judgmental Apocryphantom",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "SoulDrain",
		Color = "Green",
		Archetype = "Apocrypha",
		Cost = { Green = 4 },
		TransformImmune = true,
		AddBlock = true,
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
	ZanzelGolem = {
		Id = 5401789691,
		Name = "Crystal Golem",
		Health = 2100,
		Power = 350,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 8 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Cold to the touch, this giant will hold any frontline without question."
	},
	handhacktest = {
		Id = 502550783,
		Name = "HAND HACKS",
		Foil = true,
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Color = "Red",
		AttackEffect = "Punch",
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Scholar",
			Description = "Unleash the forbidden power of Albania.",
			Type = "OnSummon",
			Power = {
				{ "Red", 10 },
				{ "Green", 10 },
				{ "Blue", 10 },
				{ "Yellow", 10 },
				{ "Neutral", 10 }
			},
			Target = "Ally"
		},
		Bio = "mhm"
	},
	["EzCheez-MrSwap"] = {
		Id = 4720286370,
		Name = "EzCheez",
		Power = 50,
		Health = 1000,
		Rarity = "Token",
		AttackEffect = "Punch",
		AddBlock = true,
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Conflux",
			Description = "Whenever this card's stats are swapped: Unlock it. It gains 150 Power.",
			Type = "OnSwap",
			Power = {
				{ "Strengthen", 150 },
				{ "Unlock", 9999 }
			},
			Target = "Self"
		},
		Bio = "As opposed to hard cheese. How would one even make such a thing?"
	},
	["Fractality-MrSwap"] = {
		Id = 5705259051,
		Name = "Fractality",
		Health = 700,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		AddBlock = true,
		Color = "Red",
		Cost = { Red = 3, Green = 2 },
		Effect = {
			Name = "Thug Life",
			Description = "Whenever this card's stats are swapped: All ally fighters gain 200 power. Draw a card.",
			Type = "OnSwap",
			Power = {
				{ "Strengthen", 200 },
				{ "Draw", 1, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Creator of Chaos Washers. First-person mode is highly recommended."
	},
	["Baby Noob-MrSwap"] = {
		Id = 5059439279,
		Name = "Baby Noob",
		Health = 200,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		AddBlock = true,
		Archetype = "Noob",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: You lose 300 Life.",
			Type = "OnSummon",
			Power = { { "Cost", 300 } },
			Target = "Ally"
		},
		Bio = "A cute lil' noob. Awww..."
	},
	["ShedletskyBlue-MrSwap"] = {
		Id = 6590699532,
		Name = "Shedletsky, the Resonator",
		Health = 1250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		ReturnImmune = true,
		AddBlock = true,
		Archetype = "Shedletsky",
		Color = "Blue",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. All enemy fighters lose 100 power.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 2 },
				{ "Weaken", 200 }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["ShedletskyGreen-MrSwap"] = {
		Id = 4988839855,
		Name = "Shedletsky, Locus of Icons",
		Health = 1500,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		SwapImmune = true,
		AddBlock = true,
		Archetype = "Shedletsky",
		Color = "Green",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. Gain a stud of every colour.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1 },
				{ "Yellow", 1 },
				{ "Blue", 1 },
				{ "Red", 1 },
				{ "Green", 1 },
				{ "Neutral", 1 }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["ShedletskyYellow-MrSwap"] = {
		Id = 5007532697,
		Name = "Shedletsky, Paragon of Unity",
		CopyBodge = "Shedletsky, Paragon of Unity 1",
		Health = 1100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		CounterAttackBlock = true,
		AddBlock = true,
		Archetype = "Shedletsky",
		Color = "Yellow",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: Draw a card. Summon a noob, then all allied fighters gain 100 power.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1 },
				{ "Summon", "Noob" },
				{ "Strengthen", 100, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Blame John."
	},
	["Beast Within-MrSwap"] = {
		Id = 5156404337,
		Name = "Detect Imperfection",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		AddBlock = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Instinct Release",
			Description = "All fighters gain 200 Health and Power, then loses 200 Health and Power.\nSwap the stats of all fighters twice.\nLock them for 2 turns, then ready them twice.\nAll players gain then lose 200 life.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Damage", 200 },
				{ "Strengthen", 200 },
				{ "Swap", 100000 },
				{ "Swap", 100000 },
				{ "Weaken", 200 },
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
	["Yoshius-MrSwap"] = {
		Id = 4899472737,
		Name = "Yoshius",
		Health = 500,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		AddBlock = true,
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
	["Bloated-MrSwap"] = {
		Id = 8421374470,
		Name = "Slateskin Potion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		AddBlock = true,
		Lunar = true,
		Cost = { Blue = 2 },
		EffectAnimation = "SlatePotion",
		Bio = "stone joke here",
		Effect = {
			Name = "Bloated",
			Description = "A target fighter gains 1000 Health. Lock it for 2 turns.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 2 },
				{ "Heal", 1000 }
			},
			Target = "Single"
		}
	},
	["Blue Eyes Indigo Dragon-MrSwap"] = {
		Id = 4564781590,
		Name = "Blue Eyes Indigo Dragon",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Flame",
		Color = "Blue",
		AddBlock = true,
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
	["Cauldron's Familiar-MrSwap"] = {
		Id = 6310572725,
		Name = "Cauldron's Familiar",
		Health = 450,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		AddBlock = true,
		Cost = { Green = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: A target fighter gains 150 power. Swap the stats of all fighters, then swap them back.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150, "Single" },
				{ "Swap", 99999 },
				{ "Swap", 99999 }
			},
			Target = "All"
		},
		Bio = "To a witch, talking to frogs is like talking to themself: The only way to get intelligent conversation."
	},
	["WishNite-Wishnite"] = {
		Id = 4537240624,
		Name = "WishNite",
		Health = 750,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		AddBlock = true,
		Cost = { Neutral = 8, Red = 1 },
		Effect = {
			Name = "WishNite-Wishnite, how is this possible?",
			Description = "Whenever this card attacks and destroys another: Unlock it. It gains 150 health.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Heal", 150 },
				{ "Unlock", 999 }
			},
			Target = "Self"
		},
		Bio = "No Celestials. No Meeboids. No. Stall. Allowed."
	},
	["Heatlands Vortex-Wishnite"] = {
		Id = 4899305406,
		Name = "Dominus Infernus",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Neutral",
		AddBlock = true,
		Cost = { Neutral = 10 },
		Effect = {
			Name = "Fanaticism",
			Description = "When this card dies: Put a Red Stud into your Baseplate.",
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
		Bio = "Why control anything when you can control god?"
	},
	["pa00-Wishnite"] = {
		Id = 5022293411,
		Name = "pa00",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		Summonant = "pa00 Token 1-Wishnite",
		Effect = {
			Name = "CBT isn't that bad Vis",
			Description = "2 Charges.\nWhen this card dies: Spend a charge and resurrect it.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "Come over here and get me."
	},
	["pa00 Token 1-Wishnite"] = {
		Id = 5022294058,
		Name = "pa00",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		Summonant = "pa00 Token 2-Wishnite",
		Effect = {
			Name = "I mean provided your partner doesn't go too far, it's just generic submission",
			Description = "1 Charge.\nWhen this card dies: Spend a charge and resurrect it.",
			Type = "OnDeath",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "That one was fake; I'm actually over here!"
	},
	["pa00 Token 2-Wishnite"] = {
		Id = 5022295354,
		Name = "pa00",
		Health = 400,
		Power = 300,
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
	["Razikai-Wishnite"] = {
		Id = 4800946348,
		Name = "Razikai",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		AddBlock = true,
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Token Razikai did nothing wrong and does not deserve the previous name for this effect.",
			Description = "When this card dies: Resurrect it without this effect.",
			Type = "OnDeath",
			Power = { { "Summon", "Razikai Token 1" } },
			Target = "Ally"
		},
		Bio = "Rainbow science helps me defy death!"
	},
	["Mike-Wishnite"] = {
		Id = 6055867990,
		Name = "Mike",
		Health = 2000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 6 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Hired mercenary, endorsed by IcyTea himself."
	},
	["AVote-Wishnite"] = {
		Id = 4564777604,
		Name = "AVote",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		AddBlock = true,
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
	["Subata-Wishnite"] = {
		Id = 5205629989,
		Name = "Subata",
		Power = 300,
		Health = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 2, Blue = 4 },
		Effect = {
			Name = "Mental Preparation",
			Description = "When this card is cast: Reset a target fighter's stats.",
			Type = "OnSummon",
			Power = { { "Reset" } },
			Target = "Single"
		},
		Bio = "This beam is either set to KILL or RESTORE. Which is it gonna be?"
	},
	["Yoshius-Wishnite"] = {
		Id = 4899472737,
		Name = "Yoshius",
		Health = 500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		AddBlock = true,
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
	["HyperVoxel-Wishnite"] = {
		Id = 5179396968,
		Name = "HyperVoxel",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		EffectAnimation = "MidHammerEffectAll",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 4, Red = 4 },
		Effect = {
			Name = "Hyperbolate",
			Description = "When this card is cast: It deals 500 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 500 } },
			Target = "All"
		},
		Bio = "Pew!"
	},
	["Incredibly Friendly and Helpful Devil-Wishnite"] = {
		Id = 10279314386,
		Name = "Incredibly Friendly and Helpful Devil",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		AddBlock = true,
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
			Target = "Self"
		},
		Bio = "Hallow's clients are either talented or gullible."
	},
	["Gobble Squad-Stevenl"] = {
		Id = 6687887727,
		Name = "Arsenal Squad",
		Health = 650,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Rifle",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Gobble",
			Description = "When this card dies: Summon 3 Arsenal Squad members.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Turkey" },
				{ "Summon", "ArsenalAnarchist" },
				{ "Summon", "ArsenalSoldier" }
			},
			Target = "Ally"
		},
		Bio = "'Okay guys, remember to stick together!'"
	},
	["Pizzablawk-Stevenl"] = {
		Id = 3526494843,
		Name = "Pizzablawk",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Spicy :^)"
	},
	["Dignity-Stevenl"] = {
		Id = 4536840941,
		Name = "Dignity",
		Health = 800,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 3, Neutral = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Some say he's an exploiter, others claim he was an anonymous hacker, all we know is that he's back with a powerful orb."
	},
	["TeeVee-Stevenl"] = {
		Id = 3300006853,
		Name = "TeeVee",
		Health = 650,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "One of the many species of TeeVee, they help you find your favorite channel."
	},
	["Bloxy Victory-Stevenl"] = {
		Id = 4782749291,
		Name = "Bloxy Victory",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 5 },
		Bio = "A lifetime of hard work and difficulty, all for a useless trophy. Mewsitive had to break the cycle.",
		Effect = {
			Name = "Bloxy Victory",
			Description = "Deal 250 damage to all allied fighters. They gain 600 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 600, "Ally" },
				{ "Damage", 250, "Ally" }
			},
			Target = "Ally"
		}
	},
	["Thanksgiving Feast-Stevenl"] = {
		Id = 4784603782,
		Name = "Thanksgiving Feast",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 3, Red = 1 },
		Effect = {
			Name = "Gobble",
			Description = "All fighters gain 600 power. Lock them for 3 turns.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 3 },
				{ "Strengthen", 600 }
			},
			Target = "All"
		},
		Bio = "We are very thankful for this feast, now gobble up, pilgrims!"
	},
	["emilvita-Stevenl"] = {
		Id = 5518239090,
		Name = "emilvita",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Neutral = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "SQUAT! SQUAT! SQUAT LUNGE SQUAT!"
	},
	["Soul Tax-Stevenl"] = {
		Id = 5433941679,
		Name = "Soul Tax",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 6 },
		Effect = {
			Name = "Halloween",
			Description = "A target fighter generates six times. Put it into its owner's Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Generate", 6 },
				{ "MoveGenZone" }
			},
			Target = "Single"
		},
		Bio = "Hallow's usual jovial behaviour masks how ruthless he is when he collects the debt you owe."
	},
	["Moorph-Stevenl"] = {
		Id = 5156404923,
		Name = "Moorph",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		AddBlock = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter generates. Transform it into a Cow.",
			Type = "OnSummon",
			Power = {
				{ "Generate", 1 },
				{ "Transform", "Cow", "Single" }
			},
			Target = "Single"
		},
		Bio = "Claudia Sinister always had a thing for exotic animals."
	},
	["BrackioTops-Stevenl"] = {
		Id = 2857408212,
		Name = "BrackioTops",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Trout Slap",
			Description = "When this card is cast: Summon two 400/50 Noobs.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Noob" },
				{ "Summon", "Noob" }
			},
			Target = "Ally"
		},
		Bio = "The dampest of mayday-ers."
	},
	["Typheus the Whelp-Stevenl"] = {
		Id = 6189823924,
		Name = "Typheus the Whelp",
		Health = 800,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Blaze",
		Color = "Yellow",
		AddBlock = true,
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
	["Luck Warrior of Pure Gold-Stevenl"] = {
		Id = 4784600849,
		Name = "Luck Warrior of Pure Gold",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Too lucky 4 me",
			Description = "When this card is cast, if you've cast 3 other fighters since your last end step: Unlock all fighters. You can't cast fighters this turn.",
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
	["Thunder Bolt-Stevenl"] = {
		Id = 6670740777,
		Name = "Thunder Bolt",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Zappow!",
			Description = "Deal 4000 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 4000 } },
			Target = "All"
		},
		Bio = "The world is bored of war."
	},
	["Froot Ninja-T"] = {
		Id = 6801095600,
		Name = "Froot Ninja",
		Health = 250,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "RedKatana",
		Archetype = "Ninja",
		Color = "Blue",
		Cost = { Blue = 1, Red = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "NinjaBuff",
		Effect = {
			Name = "Citrus Punch",
			Description = "Whenever you cast a Ninja fighter: A target fighter gains 200 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 200, "Single" } },
			Target = "Single",
			Archetype = "Ninja"
		},
		Bio = "He tests his blades on watermelons and walnuts. That's practically familicide."
	},
	["BlazerC-T"] = {
		Id = 6801083680,
		Name = "BlazerC",
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "RedKatana",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "BlazerCEffect",
		Effect = {
			Name = "Blazing Up!",
			Description = "When this card is cast: All allied Ninjas gain 400 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "AlliedArchetype",
			Increase = 400
		},
		Bio = "There really wasn't a huge market for chicken blazers as ovens and microwaves came into the market, so BlazerC became a ninja instead."
	},
	["Ninja-T"] = {
		Id = 9964854787,
		Name = "Ninja",
		Health = 350,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 2 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaCall",
		Effect = {
			Name = "Assimilate",
			Description = "Whenever you cast a Ninja: It gains 100 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 100 } },
			Target = "Aggressor",
			Archetype = "Ninja"
		},
		Bio = "Ninjas actually wore a dark-blue, not pure black. This prevented moonlight from exposing them."
	},
	["Ninja Elite-T"] = {
		Id = 6858727860,
		Name = "Ninja Elite",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "KunaiThrow",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast, if you control another Ninja: It deals 200 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "Opponent" } },
			Target = "NotArchetype",
			EffectRequirement = { "Archetype", "Ally", 2, 999999, "Ninja" }
		},
		Bio = "Ninjas were only ever around 5 feet tall. Any higher would make it hard to be maneuverable."
	},
	["Ninja Trainee-T"] = {
		Id = 6858728551,
		Name = "Ninja Trainee",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		CustomReminder = {
			["Grandmaster's Ninja Dojo"] = "A {W}{W} Terrain. During your opponent's end step: All players draw a card and gain {R}."
		},
		Addant = "Grandmaster's Ninja Dojo-T",
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast, if you control two other Ninjas: Give yourself Grandmaster's Dojo.",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Ally",
			EffectRequirement = { "Archetype", "Ally", 3, 999999, "Ninja" }
		},
		Bio = "During Sengoku Jidai, Samurai were all complete backstabbers. The only truly loyal were ninjas."
	},
	["Grandmaster's Ninja Dojo-T"] = {
		Id = 4783049204,
		Name = "Grandmaster's Ninja Dojo",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Ninja",
		Terrain = true,
		Terrariant = "Ninja Terrain",
		Field = 295562634,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		CustomReminder = {
			["Genju Speedwagon"] = "Cast 'Living World' to animate this as a 1100/200 that copies Ninja fighters you cast."
		},
		Effect = {
			Name = "Stud",
			Description = "During your opponent's end step: All players draw a card and gain {R}.",
			Type = "OnEnemyEnd",
			Power = {
				{ "Draw", 1 },
				{ "Red", 1 }
			},
			Target = "All"
		},
		Bio = "The apex of all Dojos, providing both adept acceleration of mental and physical skill."
	},
	["Ninja Assailant-T"] = {
		Id = 9964855389,
		Name = "Ninja Assailant",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 1, Red = 1 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "SmokescreenAlly",
		Effect = {
			Name = "Assimilate",
			Description = "During your end step: All allied Ninjas gain 50 health.",
			Type = "OnEnd",
			Power = "Heal",
			Target = "AlliedArchetype",
			Increase = 50
		},
		Bio = "Ninjas very rarely killed people, as they were all mostly spies."
	},
	["Ninja Combatant-T"] = {
		Id = 6858743295,
		Name = "Ninja Combatant",
		Health = 150,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Katana",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 2, Red = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		EffectAnimation = "SmokescreenAlly",
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: All allied Ninjas gain 200 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "In order to protect the secrets of ninjutsu, families only passed down their knowledge to their children. They would begin teaching children skills at a young age by playing games."
	},
	["Snowskateer-T"] = {
		Id = 6858737209,
		Name = "Snowskateer",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Blue",
		Cost = { Neutral = 3 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaBuff",
		Summonant = "Snowskateer-T",
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
	["Ninja Ambush-T"] = {
		Id = 6464466828,
		Name = "Ninja Ambush",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 3 },
		Archetype = "Ninja",
		Bio = "They make for valuable moving target practice.",
		Effect = {
			Name = "Ninja Stars!",
			Description = "Deal 300 damage to all fighters that aren't allied ninjas.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300 },
				{ "Damage", 300, "Opponent" }
			},
			Target = "AlliedNotArchetype"
		}
	},
	["One_Thousand_Deaths-T"] = {
		Id = 10217675987,
		Name = "\"One Thousand Deaths\"",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Katana",
		Color = "Red",
		Archetype = "Ninja",
		Charge = true,
		Cost = { Red = 3, Blue = 1 },
		EffectAnimation = "ThousandDeaths",
		Effect = {
			Name = "HURT ALL THE THINGS",
			Description = "Whenever this card attacks and destroys another: All allied Ninjas gain 300 Power. Return this card to its hand.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Unlock", 1, "Self" },
				{ "Strengthen", 300 },
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
	MotorcyclistTerrain = {
		Id = 4784601792,
		Name = "Let's Go!!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Katana",
		Field = 293402627,
		Color = "Blue",
		Terrain = true,
		DestroyImmune = true,
		Terrariant = "Baseplate Terrain",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "Whenever a player casts a fighter: Unlock it.",
			Type = "OnAnySummon",
			Power = "Unlock",
			Target = "Aggressor",
			Increase = 999
		},
		Bio = "Its a well known fact that card games are infinitely more fun on motorcycles."
	},
	BRC1 = {
		Id = 2969038003,
		Name = "stormmaster7722",
		Health = 200,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 2, Neutral = 1 },
		Effect = {
			Name = "Lightning After the Thunder",
			Description = "When this card is cast: All players lose 200 Life.",
			Type = "OnSummon",
			Power = { { "Inflict", 200 } },
			Target = "All"
		},
		Bio = "Sk00lz 4 nurds."
	},
	BRC2 = {
		Id = 7021477536,
		Name = "FuuTuu",
		Power = 400,
		Health = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Shartshooter",
			Description = "Whenever this card attacks: You lose 200 Life.",
			Type = "OnAttack",
			Power = { { "Cost", 200 } },
			Target = "Ally"
		},
		Bio = "A very fashionable sheriff with a powerful revolver who often comes on and off on ROBLOX."
	},
	BRC3 = {
		Id = 3299992527,
		Name = "Redcliff Messenger",
		Health = 200,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Archetype = "Redcliff",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 1 },
		Effect = {
			Name = "Message of Hope",
			Description = "When this card is cast: A target fighter gains 150 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 150
		},
		Bio = "They sent us a message. \"If we enter your village, we will burn it down and kill all your children.\" Our reply? \"If\"."
	},
	BRC4 = {
		Id = 5455444897,
		Name = "Fleeing Survivors",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Survivor",
		SummonAnimation = "SummonPanic",
		TokenDiscard = true,
		AddBlock = true,
		Color = "Red",
		Cost = { Neutral = 1, Red = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Search your deck for three copies of it.",
			Type = "OnSummon",
			Power = {
				{ "Tutorfor", "BRC4" },
				{ "Tutorfor", "BRC4" },
				{ "Tutorfor", "BRC4" }
			},
			Target = "Ally"
		},
		Bio = "Everyone fled the ruined Bloxburg, no matter the danger. The scared refugees found the savages that ruled this forest preoccupied with the same horrors they faced."
	},
	BRC5 = {
		Id = 7161736960,
		Name = "Kit of Deception",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 1, Red = 4 },
		Effect = {
			Name = "Power",
			Description = "All allied fighters gain 300 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Ally",
			Increase = 300
		},
		Bio = "A kit of weapons and ammo for your fighters, or Devil Beater Interns."
	},
	BRC6 = {
		Id = 6533847008,
		Name = "Redcliff: Rise!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 6 },
		Archetype = "Redcliff",
		Bio = "TWO ARMS, MEN!",
		Effect = {
			Name = "Board Boost!",
			Description = "Deal 250 damage to all fighters. All allied Redcliff fighters gain 500 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 250, "All" },
				{ "Strengthen", 500, nil, nil, nil, "RedcliffSymbol" }
			},
			Target = "AlliedArchetype"
		}
	},
	BRC7 = {
		Id = 6027903183,
		Name = "Redcliff Mauler",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Redcliff",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied Redcliff gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "AlliedArchetype",
			Increase = 100
		},
		Bio = "I have to maul you, nothing personal."
	},
	BRC8 = {
		Id = 4960875309,
		Name = "supersky712",
		Health = 700,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Charge = true,
		AddBlock = true,
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
	PuzzleLangz = {
		Id = 3299982063,
		Name = "Langz",
		Power = 150,
		Health = 150,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		AddBlock = true,
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
	PuzzleDoge = {
		Id = 4784611236,
		Name = "Doge",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Archetype = "Doge",
		Color = "Yellow",
		Token = true,
		AddBlock = true,
		Cost = { Neutral = 1 },
		SummonAnimation = "DogeBark",
		DeathAnimation = "DogeGone",
		Effect = {
			Name = "Purlot",
			Description = "",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Such claws. Much stats. Very game. Wow."
	},
	["Beeism Drone"] = {
		Id = 8536853171,
		Name = "Bee",
		Health = 100,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Slash",
		Archetype = "Bee",
		Color = "Blue",
		Token = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nerf",
			Description = "\nWhenever this card attacks: you gain a Yellow stud.",
			Type = "OnAttack",
			Power = { { "Yellow", 1, "Ally" } },
			Target = "Ally"
		},
		Bio = "NOT THE BEE!!!"
	},
	GFT1 = {
		Id = 8636023822,
		Name = "Delete Tool",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "gaster",
		Color = "Neutral",
		Addant = "GFT1",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Deceipt",
			Description = "Destroy, then obliterate a target fighter.\nGive yourself a copy of this card.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 30 },
				{ "Obliterate", 30 },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Single"
		},
		Bio = "Just dont spam it all over the place, That would be rude."
	},
	GFT2 = {
		Id = 8636024729,
		Name = "Move Tool",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Addant = "GFT2",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "Select any number of cards from your deck and search them.\nGive yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant", "Ally" },
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
						Condition = { TopCard = 999 },
						MinTargets = 0,
						MaxTargets = 999,
						SelectionDescription = "any number of cards to search"
					}
				}
			}
		},
		Bio = "Moving cards to your hand has never been easier!"
	},
	GFT3 = {
		Id = 8636025758,
		Name = "Copy Tool",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "You gain 10 studs of each type.\nPut copies of those studs into your Baseplate.\nGive yourself a Move and Delete Tool.",
			Type = "OnSummon",
			Power = {
				{ "Red", 10 },
				{ "Blue", 10 },
				{ "Yellow", 10 },
				{ "Green", 10 },
				{ "Neutral", 10 },
				{
					"AddGenZone",
					{ "Red Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Mark Stud", 10 }
				},
				{ "Add", "GFT1", "Ally" },
				{ "Add", "GFT2", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "An infinite source of building materials, try not to make a mess with it."
	},
	STT1 = {
		Id = 4899318068,
		Name = "The Gift of Giving",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Addant = "STT1",
		TokenDiscard = true,
		DestroyImmune = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Draw a card and give yourself a copy of this card. Give your oppponent a random card. You can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{ "Add", "Addant", "Ally" },
				{ "RandomAdd", "Any", "Opponent" },
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "St. Tea's endless stockpile of free cards is only rivaled by his endless stockpile of generosity."
	},
	STT2 = {
		Id = 4899318068,
		Name = "The Spirit of Bloxmas",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Terrain = true,
		DestroyImmune = true,
		AddBlock = true,
		Terrariant = "Minigame Terrain",
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Destroy your Opponent's hand. Give them ten cards.",
			Type = "OnEnd",
			Power = {
				{ "RandomDiscard", 10 },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" },
				{ "RandomAdd", "Any" }
			},
			Target = "Opponent"
		},
		Bio = "Perhaps his generosity is a bit too much..."
	},
	KT1 = {
		Id = 6310573843,
		Name = "Miserable Gift",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Addant = "KT1",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Draw a card, Put a Red stud into your baseplate and give yourself a copy of this card. Shuffle a lump of coal into your opponent's deck. You can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant", "Ally" },
				{ "Draw", 1 },
				{
					"AddGenZone",
					{ "Red Stud", 1 }
				},
				{ "DeckAdd", "KT2", "Opponent" },
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "Sometimes, The worst gifts are the most basic ones."
	},
	KT2 = {
		Id = 5205641871,
		Name = "A Lump of Coal",
		Cloneant = "Maladeity's Pustule",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		DiscardBlock = true,
		Token = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nightmare!",
			Description = "Can't be discarded. You draw a card and lose 300 life.",
			Type = "OnSummon",
			Target = "Ally",
			Power = {
				{ "Draw", 1 },
				{ "Inflict", 300 }
			}
		},
		Bio = "What an awful gift!"
	},
	HE1 = {
		Id = 7678220739,
		Name = "Redcliff Enforcer",
		Health = 350,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Redcliff",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Stud",
			Description = "When this card dies: All allied Redcliff gain 400 Health and Power.",
			Type = "OnDeath",
			Power = {
				{ "Strengthen", 400, nil, nil, nil, "RedcliffFlagEffect" },
				{ "Heal", 400 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "Hail Redcliff!"
	},
	HE2 = {
		Id = 5574260703,
		Name = "Redcliff Adept",
		Power = 400,
		Health = 350,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Redcliff",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "I think that enemy got THE POINT!"
	},
	HE3 = {
		Id = 4899343999,
		Name = "Hallow's Brilliant Treats",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Endless Spooks",
			Description = "Destroy all fighters with 350 or less health.",
			Type = "OnSummon",
			Power = { {
				"CheckHealth",
				{ 0, 350 }
			} },
			Target = "All"
		},
		Bio = "A gift from Hallow Sinister is a hallowed gift indeed."
	},
	HE4 = {
		Id = 5641474236,
		Name = "Hallow's Shoddy Adjudicator",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 8 },
		Archetype = "Vibeshark",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "\"Your vibes. Hand them over.\""
	},
	HE5 = {
		Id = 5271603842,
		Name = "Hallow's Shoddy Enforcer",
		Health = 900,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		AddBlock = true,
		Cost = { Yellow = 3 },
		Archetype = "Vibeshark",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The Vibesharks always collect on their debt. Their debt being a good time."
	},
	CI1 = {
		Id = 5152922400,
		Name = "The Stalker",
		Health = 2400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		AddBlock = true,
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
	CI2 = {
		Id = 6552030522,
		Name = "Crimson Cindering",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Charge = true,
		AddBlock = true,
		Cost = { Red = 6 },
		Effect = {
			Name = "Sixdering",
			Description = "When this card is cast, or when it dies: Your opponent loses 600 life.",
			Type = "OnSummon",
			Ability = {
				OnSummon = {
					Power = { { "Inflict", 600, "Opponent" } }
				},
				OnDeath = {
					Power = { { "Inflict", 600, "Opponent" } }
				}
			},
			Target = "Self"
		},
		Bio = "He hexes six people to burn in hell every six hours."
	},
	CI3 = {
		Id = 7550898720,
		Name = "xXJavier_killer1xX",
		CopyBodge = "Javier Killer",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 1 },
		Effect = {
			Name = "Value gaining",
			Description = "When this card is cast: Destroy a target allied fighter.",
			Type = "OnSummon",
			Power = { { "Destroy" } },
			Target = "SingleAlly",
			EffectRequirement = { "Board", "Ally", 1, 9999 }
		},
		Bio = "I will destroy the middle class."
	},
	CI4 = {
		Id = 4960875309,
		Name = "supersky712",
		CopyBodge = "Supersky712",
		Health = 700,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		AddBlock = true,
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
	CI5 = {
		Id = 3299992527,
		Name = "Redcliff Messenger",
		Health = 300,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Archetype = "Redcliff",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 1 },
		EffectAnimation = "RedcliffFlagEffect",
		Effect = {
			Name = "Message of Hope",
			Description = "When this card is cast: A target fighter gains 150 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 150
		},
		Bio = "They sent us a message. \"If we enter your village, we will burn it down and kill all your children.\" Our reply? \"If\"."
	},
	CI6 = {
		Id = 4783076830,
		Name = "Blockerwiz",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Detects any foes with his tail, so be cautious!"
	},
	CI7 = {
		Id = 4564777604,
		Name = "AVote",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		AddBlock = true,
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
	CI8 = {
		Id = 5987055383,
		Name = "BenCanova1",
		Health = 450,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		AddBlock = true,
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
	CI9 = {
		Id = 6022451081,
		Name = "Primal Gato",
		Health = 600,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 2, Red = 1 },
		Effect = {
			Name = "Starting Slow",
			Description = "During your end step: This card gains 200 power.",
			Type = "OnEnd",
			Power = "Strengthen",
			Target = "Self",
			Increase = 200
		},
		Bio = "GRAWR!"
	},
	CI10 = {
		Id = 5680151677,
		Name = "Rad",
		Health = 900,
		Power = 700,
		Rarity = "Token",
		AddBlock = true,
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Molten and furious."
	},
	["Arte71-Civ"] = {
		Id = 6801082069,
		Name = "Arte71",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "When this card is cast: Swap the stats of all fighters. Swap your allies back at the end of this turn.",
			Type = "OnSummon",
			Power = {
				{ "Swap", 100000 },
				{ "TransformWithRarity", "Arte71 2", "Self" }
			},
			Target = "All"
		},
		Bio = "I never wanted to be his husband. Not only is it illegal in my country, but I barely even know the guy."
	},
	["WildSpeedy-Civ"] = {
		Id = 4899469101,
		Name = "WildSpeedy",
		Health = 500,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		AddBlock = true,
		Cost = { Neutral = 2, Blue = 1 },
		Charge = true,
		Effect = {
			Name = "Conflux",
			Description = "When this card becomes unlocked: It gains 100 health and power.",
			Type = "OnUnlock",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "Self"
		},
		Bio = "Pretty wild. Pretty fast. Is it Sonic?"
	},
	["Time Bomb"] = {
		Id = 6419759152,
		Name = "Time Bomb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Mischief of the Time Goddess",
			Description = "Unlock all allied fighters twice.",
			Type = "OnSummon",
			Power = { { "Unlock", 2 } },
			Target = "Ally"
		},
		Bio = "Puzzle-only card. Need more time? Well, you've got it!"
	},
	WD1 = {
		Id = 9881127444,
		Name = "Deer's Wealth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		AddBlock = true,
		Cost = { Blue = 1 },
		Addant = "Targeting Blip",
		Effect = {
			Name = "Sneak Attack",
			Description = " Draw 2 cards, then fill your hand with Robux Stacks.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 2, "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Single"
		},
		Bio = "The source of the mysterious wealth of the deer is a secret that we may never find the answer to."
	},
	FanStudRed = {
		Id = 5689045240,
		Name = "Fragment of Ambition",
		Health = 400,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicRed",
		SetImmune = true,
		Token = true,
		AddBlock = true,
		Archetype = "Studling",
		Color = "Red",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: deal 100 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = { { "Damage", 100, "Opponent" } },
			Target = "Ally"
		},
		Bio = "A Stud manipulated into the aspect of Power. It pulsates a destructive energy."
	},
	FanStudBlue = {
		Id = 5832341521,
		Name = "Fragment of Order",
		Health = 400,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicBlue",
		SetImmune = true,
		Token = true,
		AddBlock = true,
		Archetype = "Studling",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: all enemy fighters lose 100 power.",
			Type = "OnEnd",
			Power = { { "Weaken", 100, "Opponent" } },
			Target = "Ally"
		},
		Bio = "A Stud manipulated into the aspect of Logic. It pulsates a binding energy."
	},
	FanStudGreen = {
		Id = 5832365495,
		Name = "Fragment of Growth",
		Health = 400,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicGreen",
		SetImmune = true,
		Token = true,
		AddBlock = true,
		Archetype = "Studling",
		Color = "Green",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: allied Studlings gain 100 health.",
			Type = "OnEnd",
			Power = { { "Heal", 100, "AlliedArchetype" } },
			Target = "Ally"
		},
		Bio = "A Stud manipulated into the aspect of Life. It pulsates a healing energy."
	},
	FanStudYellow = {
		Id = 5832440157,
		Name = "Fragment of Emotion",
		Health = 400,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "MagicYellow",
		SetImmune = true,
		Token = true,
		AddBlock = true,
		Archetype = "Studling",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: allied Studlings gain 100 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 100, "AlliedArchetype" } },
			Target = "Ally"
		},
		Bio = "A Stud manipulated into the aspect of Society. It pulsates a unifying energy."
	},
	FanStudSummon = {
		Id = 12075799932,
		Name = "Stud Manipulation: Energy Imbuement",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		DestroyImmune = true,
		AddBlock = true,
		Archetype = "Studling",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Build Up",
			Description = "Summon a Stud fragment of each color.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "FanStudRed" },
				{ "Summon", "FanStudBlue" },
				{ "Summon", "FanStudGreen" },
				{ "Summon", "FanStudYellow" }
			},
			Target = "Ally"
		},
		Bio = "\"Come forth, energies of this world! Take form and follow my will!\""
	},
	FanStudWipe = {
		Id = 12075599780,
		Name = "Stud Manipulation: Energy Condense",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenDiscard = true,
		DestroyImmune = true,
		ObliterateImmune = true,
		Requirement = { "Archetype", "Ally", 0, 1, "Studling" },
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if you don't control any Studlings.\nPut all fighters into their owner's baseplates.\nPut 3 copies of each colored stud into your Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "MoveGenZone", 30, "All" },
				{
					"AddGenZone",
					{ "Red Stud", 3 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 3 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 3 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 3 }
				},
				{ "Add", "FanGirlEnrage", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "\"Let your forms flow into essence, and guide me to victory!\""
	},
	FanGirlEnrage = {
		Id = 12075600995,
		Name = "Stud Manipulation: Resurging Tide Of Colors",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		ObliterateImmune = true,
		Requirement = { "Color", "AllyGenZone", 0, 1, "Green" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if you have no colored cards in your baseplate. You gain 10 studs of each type. Put copies of those studs into your Baseplate. Draw 8 cards.",
			Type = "OnSummon",
			Power = {
				{ "Red", 10 },
				{ "Blue", 10 },
				{ "Yellow", 10 },
				{ "Green", 10 },
				{ "Neutral", 10 },
				{
					"AddGenZone",
					{ "Red Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Yellow Stud", 10 }
				},
				{
					"AddGenZone",
					{ "Mark Stud", 10 }
				},
				{ "Draw", 8, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "\"My My... you are quite mean to do that. Then I can be mean too!\""
	},
	AzureT = {
		Id = 8411161265,
		Name = "Starstone's Draw",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Addant = "AzureT",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Give yourself a random starstone and a copy of this card. You can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant", "Ally" },
				{
					"RandomAdd",
					{ "Ruby Starstone", "Sapphire Starstone", "AzureEmerald" },
					"Ally"
				},
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "An overwhelming abundance of starstone energy, enough to drive anyone to become a megalomaniac."
	},
	AzureEmerald = {
		Id = 8536895331,
		Name = "Empowered Emerald Starstone",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Red",
		AddBlock = true,
		Cost = { Neutral = 4, Red = 4 },
		AlternateCost = { Red = 4 },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "The Federation" },
		Archetype = "Starstone",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "If there's an allied member of the Federation, cast this card ignoring its colourless cost.\nDeal 100 damage to a target fighter, then destroy it if it has 500 or less health.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 100, "Single" },
				{
					"CheckHealth",
					{ 0, 501 }
				}
			},
			EffectRequirement = { "Board", "Opponent", 1 },
			Target = "SingleEnemy"
		},
		Bio = "One would think a larger ego would be a bad thing, but for the Federation it’s a whole different story."
	},
	AzureBot = {
		Id = 8596108146,
		Name = "Azureless of the Federation",
		Health = 700,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Red = 6 },
		Archetype = "The Federation",
		AddBlock = true,
		SummonAnimation = "SummonAzureless",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Whenever you cast an action that costs 8 or more total studs: Obliterate the leftmost enemy fighter and all copies its controller has in all zones.",
			Type = "OnAllyCast",
			Power = { { "Extract", 30, "EnemyLeftMost" } },
			Cost = 8,
			Target = "Self"
		},
		Bio = "\"Everything exists for a reason: Me.\""
	},
	NibblexBot = {
		Id = 8596106279,
		Name = "Nibblex, Universe Biter",
		Health = 2500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		IsBotCard = true,
		AddBlock = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		Cost = { Neutral = 0 },
		SummonAnimation = "SummonNibblex",
		Effect = {
			Description = "This card is immune to all negative effects and stat sets.\nWhenever a fighter dies: This card gains 100 Health and Power.\nDuring your end step, if four or more allied fighters died since your last end step: Destroy all fighters.\nWhen this card dies: it's owner loses the battle.",
			Target = "Ally",
			Ability = {
				OnAnyDeath = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Self"
				},
				OnEnd = {
					Power = { { "Destroy", 9999 } },
					Target = "All",
					EffectRequirement = { "Playertable", "Me", 4, 9999, "DeathStorm" }
				},
				OnDeath = {
					Power = { { "Inflict", 99999 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"If you were an ageless, cosmic force with insatiable hunger, how would you sate it? Would you not do as I do? Would you not at least pick justified meals?\""
	},
	NibblexRedPlanet = {
		Id = 8421520019,
		Name = "Desolate Planet Fragment",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		IsBotCard = true,
		Archetype = "Terrarian",
		Cost = { Neutral = 3, Red = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card dies: deal 100 damage to all fighters.",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 100 } },
					Target = "All"
				}
			}
		},
		Bio = "The remanants of a planet already sucked dry of all life and energy."
	},
	NibblexActionRedrune = {
		Id = 8596106279,
		Name = "Starkiller's Rage",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
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
		Bio = "You'd think the fury of a being who eats entire planets would be a bit more devastating."
	},
	NibblexActionIgnis = {
		Id = 8596106279,
		Name = "Starkiller's Strike",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		EffectAnimation = "FireBreathSmall",
		Color = "Red",
		Cost = { Red = 2 },
		Effect = {
			Name = "Pyroblast",
			Description = "When this card is cast: Deal 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250, "Single" } },
			Target = "Single"
		},
		Bio = "It's said a single strike from his blade is enough to crack a planet in half."
	},
	NibblexActionCrescendo = {
		Id = 8596106279,
		Name = "Starkiller's Bestowment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "FireBreath",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Effect = {
			Name = "Beam Sword",
			Description = "Deal 400 damage to a target fighter. It gains 300 Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 300 },
				{ "Damage", 400 }
			},
			Target = "Single"
		},
		Bio = "A small gift of planetary energy consumed by the starkiller, assuming you can handle it."
	},
	NibblexNeutralPlanet = {
		Id = 8421531777,
		Name = "Frigid Planet Fragment",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		IsBotCard = true,
		Archetype = "Terrarian",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is cast: Summon a copy of it.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "NibblexNeutralPlanet" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The remanants of a planet frozen over and shattered into pieces."
	},
	NibblexBluePlanet = {
		Id = 8421517346,
		Name = "Mechanical Planet Fragment",
		Health = 400,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		IsBotCard = true,
		Archetype = "Terrarian",
		Cost = { Neutral = 2, Red = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card dies: draw a card.",
			Ability = {
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The remanants of a planet consumed by metal and wires."
	},
	NibblexActionGlare = {
		Id = 8596106279,
		Name = "Starkiller's Glare",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Requirement = { "Power", "Opponent", 2000, 9999 },
		Cost = { Neutral = 2, Red = 1 },
		Effect = {
			Name = "Deceipt",
			Description = "Cast only if there is 2000 or more total Power among enemy fighters. Set the power of all enemy fighters to 500.",
			Type = "OnSummon",
			Power = { { "SetPower", 500 } },
			Target = "Opponent"
		},
		Bio = "To try to be more imposing than Nibblex himself would be considered a foolish decision by anyone."
	},
	PtendaTerrain = {
		Id = 8421527751,
		Name = "Empowered Cothran Remnant",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 0 },
		Archetype = "Apocryspectre",
		Terrariant = "Remnant Terrain",
		Terrain = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast an Apocryspectre: Suspend the leftmost enemy fighter from play until the next end step.",
			Ability = {
				OnSummon = {
					Power = { { "Suspend" } },
					Target = "EnemyLeftMost"
				},
				OnAllySummon = {
					Power = { { "Suspend" } },
					Archetype = "Apocryspectre",
					Target = "EnemyLeftMost"
				}
			}
		},
		Bio = "Spirits will frequently gather near Aeonite Settlements, Seeking a vessel to conjoin with."
	},
	PtendaBot = {
		Id = 8421367003,
		Name = "Ptenda, The Unconquerable",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		IsBotCard = true,
		Archetype = "Era",
		Cost = { Green = 7 },
		EffectVariable = 0,
		SummonAnimation = "SummonPtenda",
		Effect = {
			Name = "Night Creak",
			Description = "When this card is cast: Search your deck for an Era card.\nDuring your end step: Reset this card's stats. Then it gains 100 Health and Power for each Era card in your Baseplate and Graveyard.",
			Type = "OnEnd",
			Ability = {
				OnSummon = {
					Power = { { "RandomTutorfor", "Era" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"Reset",
							nil,
							nil,
							nil,
							nil,
							nil,
							"PtendaSet"
						},
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Archetype", "Era" }
						},
						{
							"AlterEV",
							{ "Add", "GenZone_Ally", "Archetype", "Era" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Ptenda sought the counsel of the 3,000 spirits grafted into his body. Their reply was unaniamous: The Federation's days were numbered."
	},
	PtendaBestowment = {
		Id = 6893577820,
		Name = "Alpha Brick's Bestowment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Era",
		Color = "Green",
		AddBlock = true,
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Put a target fighter into its owner's Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "MoveGenZone" }
			},
			Target = "Single"
		},
		Bio = "Few people know the true power behind Ptenda's spiritcraft. Not even Ptenda himself."
	},
	["PTCothran Spectre"] = {
		Id = 8536993894,
		Name = "Cothran Spectre",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 3 },
		Archetype = "Apocryspectre",
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "When this card is cast, if you have an Apocryspectre card in your Baseplate: Suspend a target enemy fighter. Whenever this card attacks your opponent directly: You gain two colourless studs.",
			Ability = {
				OnStrike = {
					Power = { { "Neutral", 2 } },
					Target = "Ally"
				},
				OnSummon = {
					Power = { { "Suspend", 30, "SingleEnemy" } },
					Target = "Self",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 9999, "Apocryspectre" }
				}
			}
		},
		Bio = ""
	},
	["PTPtenda's Bodyguard"] = {
		Id = 8421293886,
		Name = "Ptenda's Bodyguard",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Archetype = "Apocryspectre",
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever this card attacks your opponent directly: All Allied Apocryspectres gain 100 health and power",
			Type = "OnStrike",
			Power = {
				{ "Strengthen", 100, "AlliedArchetype" },
				{ "Heal", 100, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "Many of Ptenda's souls are valiant fallen warriors, gladly dying again and again until Cothran is safe."
	},
	["PTOverlaid Souls"] = {
		Id = 8448555018,
		Name = "Overlaid Souls",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Apocryspectre",
		Cost = { Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks your opponent directly: Give yourself an Apocryspectre card.",
			Type = "OnStrike",
			Power = { { "RandomAdd", "Apocryspectre" } },
			Target = "Ally"
		},
		Bio = "Hello, Soul!"
	},
	["PTAncestral Vanguard"] = {
		Id = 8421492085,
		Name = "Ancestral Vanguard",
		Health = 700,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 2 },
		Archetype = "Apocryspectre",
		Effect = {
			Name = "Jet Set Radio",
			Description = "Whenever an allied Apocryspectre attacks your opponent directly: This card gains 300 Health and Power.",
			Type = "OnAllyStrike",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 300 }
			},
			Target = "Self",
			Archetype = "Apocryspectre"
		},
		Bio = ""
	},
	["PTAeonite Progeny"] = {
		Id = 10288353757,
		Name = "Aeonite Progeny",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Apocryspectre",
		Cost = { Neutral = 8, Green = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Power", "Ally", 0, 1201 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Cast this card ignoring its {W} cost if there is 1200 or less total Power among allied fighters.\nSuspend all enemy fighters from play until the next end step.\nYou can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Suspend", 30, "Opponent" },
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
		Bio = ""
	},
	ST1 = {
		Id = 8765160137,
		Name = "Tournament Slayer Steve",
		Health = 900,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 9 },
		EffectVariable = 0,
		AddBlock = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Set the power of a target fighter so that it's negative. (Negative fighters heal in combat.)",
			Type = "OnSummon",
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
			Target = "Single"
		},
		Bio = "I will make the powerful bingus floppy."
	},
	ST2 = {
		Id = 4564777604,
		Name = "AVote",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		AddBlock = true,
		Cost = { Red = 3, Neutral = 1 },
		Effect = {
			Name = "Chain-Break!",
			Description = "When this card is cast: Unlock a target fighter.",
			Type = "OnSummon",
			Power = "Unlock",
			Target = "Single",
			Increase = 9999
		},
		Bio = "I will make the floppy bingus fast."
	},
	ST3 = {
		Id = 2810632305,
		Name = "Korblox Archer",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Archetype = "Korblox",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2 },
		EffectAnimation = "BlueArrow",
		AddBlock = true,
		Effect = {
			Name = "Jagged Arrow",
			Description = "When this card is cast: A target fighter loses 300 Power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 300
		},
		Bio = "I will make the fast bingus upset."
	},
	ST5 = {
		Id = 6502626262,
		Name = "Endless Blade 550",
		Health = 550,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 2, Red = 3 },
		Effect = {
			Name = "550 Miles",
			Description = "When this card is cast: Each fighter with the lowest power gains 550 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 550, "LowestPower" } },
			Target = "Ally"
		},
		Bio = "I will make the upset bingus strong."
	},
	ST6 = {
		Id = 2857416739,
		Name = "Banland Youngtan",
		Health = 200,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Charge = true,
		AddBlock = true,
		Effect = {
			Name = "Overgrown",
			Description = "After this card attacks: Destroy the fighter it attacked if it has 800 or more Health.",
			Type = "OnAttackEnd",
			Power = { {
				"CheckHealth",
				{ 800, 99999 }
			} },
			Target = "Aggressor"
		},
		Bio = "A friend of bingus, especially floppy ones."
	},
	ST7 = {
		Id = 6801089810,
		Name = "Celestial of Sun",
		Health = 700,
		Power = 100,
		Rarity = "Token",
		Archetype = "Celestial",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 2, Green = 1 },
		EffectVariable = 0,
		AddBlock = true,
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Deal 100 damage to a target fighter. You gain 500 life for each allied Celestial. All Allied Celestials generate.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 100, "Single" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Archetype", "Celestial" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", -500, "Nil" }
				},
				{ "Cost", "Variable" },
				{ "Generate", 1, "AlliedArchetype" }
			},
			Target = "Self"
		},
		Bio = "A hater of bingus."
	},
	ST8 = {
		Id = 2810867669,
		Name = "Pilot",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		Archetype = "Pilot",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Charge = true,
		AddBlock = true,
		Effect = {
			Name = "Airstrike",
			Description = "",
			Type = "Null",
			Power = { { "Neutral", 0 } },
			Target = "All"
		},
		Bio = "A fan of bingus, this pilot will be bullied immensely for her poor life choices."
	},
	KasCheesycakes = {
		Id = 4987105177,
		Name = "Empowered Cheeseycakes",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		Effect = {
			Name = "Cake Amp",
			Description = "When this card is cast: A target fighter gains 50 health and power. Put a Yellow stud into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 50 },
				{ "Strengthen", 50 },
				{
					"AddGenZone",
					{ "Yellow Stud", 1 },
					"Ally",
					nil,
					nil,
					nil,
					"BaseplateYellow"
				}
			},
			Target = "Single"
		},
		Bio = "Cheesecakes are the true best cake, better than some silly half-baked pancake."
	},
	Kaspoke631 = {
		Id = 5987053634,
		Name = "Empowered poke631",
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "GO! DOGE HOUND!",
			Description = "Whenever an effect targets this card: it gains 200 power.",
			Type = "OnTarget",
			Power = { { "Strengthen", 200, "Self" } },
			Target = "Ally"
		},
		Bio = "An exile from Pokémon Brick Bronze. Can still tame a good pocket monster."
	},
	KasBrandonOccult = {
		Id = 5034526419,
		Name = "Empowered BrandonOccult",
		Health = 800,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Whenever an effect targets this card: Draw a card.",
			Type = "OnTarget",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Come to the dark side. We have famous people."
	},
	Moyai1 = {
		Id = 8650621116,
		Name = "Moyai Charge",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Addant = "Moyai1",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put 2 Red studs into your baseplate and give yourself a copy of this card. You can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant", "Ally" },
				{
					"AddGenZone",
					{ "Red Stud", 2 }
				},
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "Where is it pulling all this energy from? Dunno."
	},
	Moyai2 = {
		Id = 8650621116,
		Name = "Eye of Moai",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Red = 36 },
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Effect = {
			Name = "Rebuilding The Place",
			Description = "Ban your opponent.",
			Type = "OnSummon",
			Power = { { "Inflict", 999999, "Opponent" } },
			Target = "Opponent"
		},
		Bio = ":moyai: :moyai: :moyai:"
	},
	HolyChamberBot = {
		Id = 8650608886,
		Name = "Guardian of the Holy Chamber",
		Health = 2000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		IsBotCard = true,
		AddBlock = true,
		WeakenCap = 1000,
		SwapImmune = true,
		DamageCap = 1000,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		DivideImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		Archetype = "Titan",
		Summonant = "BlobgottenBot",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Damage and Depower card effects can't decrease this card's stats by more than 1000.\nWhen this card is cast: you gain 50000 life.\nDuring your end step: Give yourself two random Enhanced Titanic Studs.\nWhen this card dies: Obliterate all fighters. Unleash the beast.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", -50000 },
						{ "BypassLifeSet" }
					},
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"RandomAdd",
							{ "ETEY", "ETER", "ETEG", "ETEB" }
						},
						{
							"RandomAdd",
							{ "ETEY", "ETER", "ETEG", "ETEB" }
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Obliterate", 30, "All" },
						{ "Summon", "Summonant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"There are powers coalescing within this chamber that you cannot comprehend, that you will not comprehend. I will not let you unseal it.\""
	},
	ETER = {
		Id = 5983797313,
		Name = "Enhanced Red Titanic Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Stealth = true,
		Archetype = "Titan",
		Cost = { Red = 1 },
		Effect = {
			Name = "I quit.",
			Description = "A target fighter gains 200 Power. Put this card into your Baseplate.",
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
		Bio = ""
	},
	ETEB = {
		Id = 5983799073,
		Name = "Enhanced Blue Titanic Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		EffectAnimation = "Freeze",
		Color = "Blue",
		Stealth = true,
		Archetype = "Titan",
		Cost = { Blue = 1 },
		Effect = {
			Name = "I quit.",
			Description = "Lock a target fighter for 1 turn. Put this card into your Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{
					"AddGenZone",
					{ "Blue Titanic Stud", 1 }
				}
			},
			Target = "Single"
		},
		Bio = ""
	},
	ETEG = {
		Id = 5973561642,
		Name = "Enhanced Green Titanic Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Stealth = true,
		Archetype = "Titan",
		Cost = { Green = 1 },
		Effect = {
			Name = "I quit.",
			Description = "A target fighter loses 200 Power. Put this card into your Baseplate.",
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
		Bio = ""
	},
	ETEY = {
		Id = 5973562733,
		Name = "Enhanced Yellow Titanic Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Stealth = true,
		Archetype = "Titan",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "I quit.",
			Description = "Deal 200 damage to a target fighter. Put this card into your Baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{
					"AddGenZone",
					{ "Yellow Titanic Stud", 1 }
				}
			},
			Target = "Single"
		},
		Bio = ""
	},
	BlobgottenBot = {
		Id = 8650610845,
		Name = "Incomplete Blobgotten One",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		IsBotCard = true,
		AddBlock = true,
		WeakenCap = 1000,
		SwapImmune = true,
		DamageCap = 1000,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		DivideImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Damage and Depower card effects can't decrease this card's stats by more than 1000.\nWhen this card dies: Its controller loses the game.",
			Target = "Ally",
			Ability = {
				OnDeath = {
					Power = { { "Inflict", 999999, "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"With the ritual incomplete, The creature is not as strong as it could be. Better hope you were quick enough to be able to stop it.\""
	},
	ChamberTitanEnrage = {
		Id = 9058620393,
		Name = "Call of the Titans",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Titan",
		Stealth = true,
		TokenDiscard = true,
		DestroyImmune = true,
		Requirement = { "Archetype", "AllyGenZone", 20, 999999, "Titan" },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "I quit.",
			Description = "Cast only if there are 20 titan cards in your baseplate. Destroy the newest card in your hand. You gain 15 of every coloured stud. Give yourself a copy of this card and a random Titan. You can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedRightMostHand" },
				{ "Red", 15 },
				{ "Blue", 15 },
				{ "Yellow", 15 },
				{ "Green", 15 },
				{ "Add", "ChamberTitanEnrage", "Ally" },
				{
					"RandomAdd",
					{
						"Titan of the Fried One-E",
						"Titan of the Dying Forest-E",
						"Titan of the Deep Below-E",
						"Titan of the Infernal Abyss-E"
					}
				},
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "Sensing the disturbance in the chamber, the Titans begin to descend with the fury of a thousand blobs."
	},
	HolyChamberConscripter = {
		Id = 9058620393,
		Name = "Enhanced Conscripter of the Bunny Blobs",
		Health = 700,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		StarterCard = true,
		Archetype = "Titan",
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: Give yourself two Enhanced Titanic Stud cards.",
			Type = "OnEnd",
			Power = {
				{
					"RandomAdd",
					{ "ETEY", "ETER", "ETEG", "ETEB" }
				},
				{
					"RandomAdd",
					{ "ETEY", "ETER", "ETEG", "ETEB" }
				}
			},
			Target = "Ally"
		},
		Bio = "To drink titanic power is to accept it."
	},
	MoGlaecium = {
		Id = 8421484248,
		Name = "Glaecium",
		Health = 700,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		EffectAnimation = "MidMagicGreenEffect",
		Requirement = { "NotColor", "Ally", 1, 9999, "Green" },
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Best of Both Worlds",
			Description = "When this card is cast, if there's an allied non-Green fighter: It deals 300 damage to itself and a target fighter. This fighter gains 300 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300 },
				{ "Damage", 300, "Self" },
				{ "Strengthen", 300, "Self" }
			},
			Target = "Single"
		},
		Bio = "Outclassed but not outmatched, Cothran's natives quickly reverse-engineered the tech of their Federation invaders."
	},
	MoBoost = {
		Id = 8650618284,
		Name = "ChuChu's Assistance",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "You gain 2 Neutral studs.",
			Type = "OnSummon",
			Power = { {
				"AddGenZone",
				{
					"Mark Stud",
					2,
					nil,
					nil,
					nil,
					nil,
					"StudNeutral"
				}
			} },
			Target = "Ally"
		},
		Bio = "He programmed those extra studs into Mo's baseplate, hope you don't mind."
	},
	FatalDiscoveryEX1 = {
		Id = 1480499313,
		Name = "Accurate Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent targets a fighter with an effect: Destroy this card and shuffle a copy of it back into your deck. Draw a card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemyTarget = {
					Power = {
						{ "DeckAdd", "FatalDiscoveryEX1", "Ally" },
						{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	FatalDiscoveryEX2 = {
		Id = 1480499313,
		Name = "Colossal Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent casts a fighter with total stats 1500 or more: Destroy this card and shuffle a copy of it back into your deck. Draw a card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemySummon = {
					Power = {
						{ "DeckAdd", "FatalDiscoveryEX2", "Ally" },
						{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self",
					SizeClass = "Gigant"
				}
			}
		},
		Bio = " "
	},
	FatalDiscoveryEX3 = {
		Id = 1480499313,
		Name = "Active Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent casts an action: Destroy this card and shuffle a copy of it back into your deck. Draw a card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemyCast = {
					Power = {
						{ "DeckAdd", "FatalDiscoveryEX3", "Ally" },
						{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	FatalDiscoveryEX4 = {
		Id = 1480499313,
		Name = "Vital Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent gains life: Destroy this card and shuffle a copy of it back into your deck. Draw a card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemyHealthGain = {
					Power = {
						{ "DeckAdd", "FatalDiscoveryEX4", "Ally" },
						{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	ScholarWipe = {
		Id = 1480499313,
		Name = "Extensive Research",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TokenDiscard = true,
		DestroyImmune = true,
		AddBlock = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Deal 4000 damage to all fighters. Draw two cards, then shuffle a Fatal Discovery into your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 4000, "All" },
						{ "Draw", 2, "Ally" },
						{ "DeckAdd", "Fatal Discovery", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Spending 12 hours a day studying strange phenomena might not be healthy, but it sure does give results!"
	},
	HighlanderSummerY = {
		Id = 9173936280,
		Name = "Yuki, Champion of Emotion",
		Health = 400,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Archetype = "Gladiator",
		AddBlock = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter: Unlock it and you gain a Colourless Stud and a Yellow Stud.",
			Type = "OnAllySummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Yellow", 1, "Ally" },
				{ "Neutral", 1, "Ally" },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Target = "Aggressor"
		},
		Bio = "Let's make some happy summer memories together ^^"
	},
	FluffleEXTerrain = {
		Id = 9881123525,
		Name = "Market Freeze",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Terrariant = "Remnant Terrain",
		Terrain = true,
		DestroyImmune = true,
		StealImmune = true,
		AnimateImmune = true,
		ObliterateImmune = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied fighter is cast or dies, and during your end step: Lock all allied fighters for 1 turn, then unlock them once. You gain {W}{B}.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Lock", 1 },
						{ "Unlock", 1 },
						{ "Blue", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally"
				},
				OnAllySummon = {
					Power = {
						{ "Lock", 1 },
						{ "Unlock", 1 },
						{ "Blue", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "Lock", 1 },
						{ "Unlock", 1 },
						{ "Blue", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "It's only a dip, it's only a dip... Give it a day and it'll recover... Diamond hands, man...."
	},
	FluffEXInspector = {
		Id = 9121745713,
		Name = "Indie Nerd Flufflefunz",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "Whenever you cast your first or second fighter each turn, if it's a Police: Unlock that fighter, then lock it for 1 turn.",
			Type = "OnAllySummon",
			Power = {
				{ "Unlock", 9999, "Aggressor" },
				{ "Lock", 1, "Aggressor" }
			},
			Target = "Opponent",
			Archetype = "Police",
			EffectRequirement = { "Playertable", "Me", 1, 3, "Fighters" }
		},
		Bio = "Is it the chorus yet?"
	},
	FluffEXIsaac = {
		Id = 9105953803,
		Name = "Bingus Addict Flufflefunz",
		Health = 300,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 1, Blue = 2 },
		Summonant = "FluffleEXBingus",
		Effect = {
			Name = "ASSEMBLE.",
			Description = "When this card is cast or attacks and destroys another: Summon a 300/100 Bingus and trigger its effect.",
			Target = "Ally",
			Ability = {
				OnAttackDestroy = {
					Power = { { "SummonWithEffect", "Summonant" } },
					Target = "Ally"
				},
				OnSummon = {
					Power = { { "SummonWithEffect", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "They were connected at the back of the head. They had a conduit - their minds were the same."
	},
	FluffleEXFilmaker = {
		Id = 9173951637,
		Name = "Filmmaker Flufflefunz",
		Health = 600,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Police Policy",
			Description = "When this card is cast, if there's 3 or more allied Police: Lock all fighters for 1 turn. Give yourself an Experimental Film.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Add", "FluffleEXExperimental Film", "Ally" }
			},
			EffectRequirement = { "Archetype", "Ally", 3, 9999, "Police" },
			Target = "All"
		},
		Bio = "A video is a memory. I want to remember everything. I look at life through a picture frame, as films can't hurt me. One single frame of a memory is a place where time has stopped."
	},
	FluffleEXBingus = {
		Id = 9105954270,
		Name = "Supreme Bingus",
		AltCards = {
			["FluffleEXExperimental Film"] = {
				Id = 9173952295,
				Name = "Experimental Film",
				AttackEffect = "Slash",
				Bio = "Even though I can't explain it, I already know how great it is."
			}
		},
		Health = 300,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Police",
		Token = true,
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Pepper Spray",
			Description = "When this card is cast: Unlock all allied fighters.",
			Type = "OnSummon",
			Power = { { "Unlock", 9999 } },
			Target = "Ally"
		},
		Bio = "I haven't looked at floppa for so long, I'd forgotten how much it hurts to."
	},
	FluffleEXWealth = {
		Id = 9881127444,
		Name = "Deer's Wealth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		AddBlock = true,
		Cost = { Blue = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "Shuffle a copy of each Flufflefunz card and this card into your deck.",
			Type = "OnSummon",
			Power = {
				{ "DeckAdd", "FluffEXIsaac-Foil" },
				{ "DeckAdd", "Fluffle & Dairing, Ace Detectives-Foil" },
				{ "DeckAdd", "Filmmaker Flufflefunz-Foil" },
				{ "DeckAdd", "How To Leave Fluff-Foil" },
				{ "DeckAdd", "Hunted Flufflefunz-Foil" },
				{ "DeckAdd", "Flufflefunz, Remembered-Foil" },
				{ "DeckAdd", "FluffEXInspector-Foil" },
				{ "DeckAdd", "One Trait Fluffle-Foil" },
				{ "DeckAdd", "Deerbot-Foil" },
				{ "DeckAdd", "Famous Prophets (Fluffs)-Foil" },
				{ "DeckAdd", "FluffleEXWealth-Foil" },
				{ "DeckAdd", "Psychonaut Flufflefunz-Foil" }
			},
			Target = "Ally"
		},
		Bio = "The source of the mysterious wealth of the deer is a secret that we may never find the answer to."
	},
	ErisTerrain = {
		Id = 5832348590,
		Name = "Endless Contagion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 0 },
		Terrariant = "Remnant Terrain",
		Terrain = true,
		DestroyImmune = true,
		StealImmune = true,
		AnimateImmune = true,
		ObliterateImmune = true,
		DiscardBlock = true,
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast an Anthrested fighter: Advance your Anthrestation to its required amount. This effects triggers before all others.",
			Ability = {
				OnAllySummonSupercede = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Anthrestation", "Nil" },
							"Aggressor"
						},
						{ "SetAnthrest", "Variable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Now hun, you might feel a crawling sensation on your skin, but don't worry, its just the beauty settling in."
	},
	["Princess Erisyphia AI"] = {
		Id = 4720392800,
		Name = "Princess Erisyphia, Master Orthotist",
		Health = 1200,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Red = 3, Green = 3, Yellow = 3 },
		Archetype = "Anthrest",
		TransformImmune = true,
		AddBlock = true,
		Transformant = "Anthrested Knight",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever an allied fighter is cast: Transform all fighters into Anthrested Knights. All enemy fighters lose 100 health and power.",
			Type = "OnAllySummon",
			Power = {
				{ "Transform", "Transformant", "All" },
				{ "Weaken", 100 },
				{ "Damage", 100 }
			},
			Target = "Opponent"
		},
		Bio = "\"That Zanzel lady talks about spirits beyond this world. Should they exist, surely they would love a facelift.\""
	},
	AIFragmentRGY = {
		Id = 10120379422,
		Name = "Insane Alpha Brick Fragment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		StarterCard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a Red, Green and Yellow Stud into your Baseplate.",
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
					{ "Yellow Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "A fracture of reality."
	},
	AIFragmentRGB = {
		Id = 10120379422,
		Name = "Emotionless Alpha Brick Fragment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		StarterCard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a Red, Green and Blue Stud into your Baseplate.",
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
				}
			},
			Target = "Ally"
		},
		Bio = "A fracture of reality."
	},
	["The Wanwood Dryad AI"] = {
		Id = 5507372185,
		Name = "The Wanwood Dryad",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Red = 2, Green = 2, Blue = 2, Neutral = 2 },
		Archetype = "World of Wood",
		EffectVariable = 300,
		Effect = {
			Name = "Temporal Halo",
			Description = "During your end step: Summon two copies of your terrain, except it's a 300/300 Fighter.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "PlayerTerrain" },
				{ "Summon", "PlayerTerrain" }
			},
			Target = "Ally"
		},
		Bio = "Come, Eisenhower. The queen requests your presence."
	},
	DryadLW = {
		Id = 6959565343,
		Name = "Growing World",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Red = 1, Blue = 1, Green = 1 },
		DestroyImmune = true,
		EffectVariable = 300,
		Effect = {
			Name = "Temporal Halo",
			Description = "Summon a copy of your terrain, except it's a 300/300 Fighter. and return this card to your hand.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "PlayerTerrain" },
				{ "Add", "DryadLW" }
			},
			Target = "Ally"
		},
		Bio = "The World of Wood's ability to grow to such titanic propotions is a mystery that even modern day researchers could not find the answer to."
	},
	AIFragmentYGB = {
		Id = 10120379422,
		Name = "Pathetic Alpha Brick Fragment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		StarterCard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a Yellow, Green and Blue Stud into your Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Yellow Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Blue Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "A fracture of reality."
	},
	["Ghashendex AI Shield"] = {
		Id = 5983829799,
		Name = "Ghashendex, Ultra Mastermind",
		Health = 2000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		Mitigation = 100000,
		DamageMitigation = 100000,
		Cost = { Neutral = 0 },
		Archetype = "Ultra",
		Effect = {
			Name = "Temporal Halo",
			Description = "This fighter is immune to all effects and is immune to all damage until both Barriers are destroyed.\nAfter this card attacks: the attacked fighter loses 300 power and is returned to your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "GhasTower" },
						{ "Summon", "GhasTower" },
						{ "Add", "GhasPowerParallax" }
					},
					Target = "Ally"
				},
				OnAttackEnd = {
					Power = {
						{ "Weaken", 300 },
						{ "Return" }
					},
					Target = "Aggressor"
				},
				OnAllyDeath = {
					Power = {
						{ "SetLife", 1, "Ally" },
						{ "SetLife", 4000, "Ally" },
						{ "RemovePassive", "TransformImmune" },
						{ "Transform", "Ghashendex AI Phase2" }
					},
					Target = "Self",
					Archetype = "GhasGenerator",
					EffectRequirement = { "Archetype", "Ally", 0, 2, "GhasGenerator" }
				},
				OnEnd = {
					Power = {
						{ "SetLife", 1, "Ally" },
						{ "SetLife", 4000, "Ally" },
						{ "RemovePassive", "TransformImmune" },
						{ "Transform", "Ghashendex AI Phase2" }
					},
					Target = "Self",
					EffectRequirement = { "Archetype", "Ally", 0, 1, "GhasGenerator" }
				}
			}
		},
		Bio = "The Dwarven Meteor will hit this world a second time. This humble one knows what extinction feels like. It will stop you from the same fate, even if you consent to oblivion."
	},
	["Ghashendex AI Phase2"] = {
		Id = 5983829799,
		Name = "Ghashendex, Ultra Mastermind",
		Health = 2000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		DivideImmune = true,
		Cost = { Neutral = 0 },
		Archetype = "Ultra",
		Effect = {
			Name = "Temporal Halo",
			Description = "This fighter is immune to all effects. Whenever this fighter finished attacking: the attacked fighter loses 300 power and is returned to your hand. When this fighter dies: It's controller is banned.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{ "Weaken", 300 },
						{ "Return" }
					},
					Target = "Aggressor"
				},
				OnDeath = {
					Power = { { "Inflict", 99999 } },
					Target = "Self"
				}
			}
		},
		Bio = "The Dwarven Meteor will hit this world a second time. This humble one knows what extinction feels like. It will stop you from the same fate, even if you consent to oblivion."
	},
	GhasTower = {
		Id = 10204161395,
		Name = "Powerstone Barrier",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		Color = "Yellow",
		AttackEffect = "Slash",
		AttackBlock = true,
		ReturnImmune = true,
		CounterBlock = true,
		Archetype = "GhasGenerator",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: this fighter gains 200 power. If it reaches 1000 power: deal 150 damage to all enemy fighters and reset this fighter's power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Strengthen", 200, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 999 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Damage", 150 },
						{ "SetPower", 200, "Self" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "A specialized barrier generator, built in the Mastermind's chamber for emergency purposes."
	},
	GhasPowerParallax = {
		Id = 5832415860,
		Name = "Orinthian Gate: Power Parallax",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Terrain = true,
		Cost = { Neutral = 2, Blue = 1, Yellow = 1, Green = 1 },
		Terrariant = "Deportation Depo Terrarian",
		Archetype = "Orinthian",
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast your first fighter each turn, If its an Orinthian: It gains 150 health and power. Return it to your hand.\nDuring your end step, if an effect returned a card to your hand since your last end step: All fighters in your hand gain 150 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "HealHand", 150, "Ally" },
						{ "StrengthenHand", 150, "Ally" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 1, 99999, "ReturnCount" }
				},
				OnAllySummon = {
					Power = {
						{ "Heal", 150, "Aggressor" },
						{ "Strengthen", 150, "Aggressor" },
						{ "Unlock", 1, "Aggressor" },
						{ "Return", 30, "Aggressor" }
					},
					Target = "Self",
					Archetype = "Orinthian",
					EffectRequirement = { "Playertable", "Me", 1, 2, "Fighters" }
				}
			}
		},
		Bio = "A prototype to the Orinthians means of intergalatic travel, Said to have been fueled by star-shaped stones ripped from planets."
	},
	AIFragmentYRB = {
		Id = 10120379422,
		Name = "Ailing Alpha Brick Fragment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		StarterCard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a Red, Blue, and Yellow Stud into your Baseplate.",
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
					"AddGenZone",
					{ "Blue Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "A fracture of reality."
	},
	GH1 = {
		Id = 4789596288,
		Name = "Dwarvern Survivor",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Dwarf",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		TriggerInGenZone = true,
		Effect = {
			Description = "When your opponent discards their third card each turn: Put this card into their baseplate.\nWhen your opponent casts Chromafex: It loses 400 Health.\nWhen this card dies: All players lose 800 life. Destroy the oldest card in their hand.",
			Ability = {
				OnEnemyDiscard = {
					Power = { {
						"MoveZone",
						{ "GH1", "Field_Ally", "GenZone_Opponent", true, false, 9 }
					} },
					Target = "Self",
					EffectRequirement = { "Playertable", "Him", 3, 999, "DiscardCount" }
				},
				OnDeath = {
					Power = {
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "Inflict", 800, "Opponent" },
						{ "Cost", 800 }
					},
					Target = "Opponent"
				},
				OnEnemySummon = {
					Power = { { "PierceDamage", 400, "Aggressor" } },
					Target = "Self",
					Archetype = "Chromafex"
				}
			}
		},
		Bio = ""
	},
	GH2 = {
		Id = 9964776558,
		Name = "Dwarvern Responder",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Dwarf",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Description = "During your opponent's end step, if they didn't cast a fighter this turn: Put this card into their baseplate.\nWhen your opponent casts Chromafex: It loses 400 Health.\nWhen this card dies: All players lose 800 life. Destroy the oldest card in their hand.",
			Ability = {
				OnEnemyEnd = {
					Power = { {
						"MoveZone",
						{ "GH2", "Field_Ally", "GenZone_Opponent", false, false, 1 }
					} },
					Target = "Self",
					EffectRequirement = { "Playertable", "Him", 0, 1, "Fighters" }
				},
				OnDeath = {
					Power = {
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "Inflict", 800, "Opponent" },
						{ "Cost", 800 }
					},
					Target = "Opponent"
				},
				OnEnemySummon = {
					Power = { { "PierceDamage", 400, "Aggressor" } },
					Target = "Self",
					Archetype = "Chromafex"
				}
			}
		},
		Bio = ""
	},
	GH3 = {
		Id = 4789593266,
		Name = "Dwarvern Refugee",
		Health = 300,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Dwarf",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Description = "When this card is attacked and survives: Put it into their baseplate.\nWhen your opponent casts Chromafex: It loses 400 Health.\nWhen this card dies: All players lose 800 life. Destroy the oldest card in their hand.",
			Ability = {
				OnAttacked = {
					Power = { {
						"MoveZone",
						{ "GH3", "Field_Ally", "GenZone_Opponent", false, false, 1 }
					} },
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" },
						{ "Inflict", 800, "Opponent" },
						{ "Cost", 800 }
					},
					Target = "Opponent"
				},
				OnEnemySummon = {
					Power = { { "PierceDamage", 400, "Aggressor" } },
					Target = "Self",
					Archetype = "Chromafex"
				}
			}
		},
		Bio = ""
	},
	GH4 = {
		Id = 119340351783409,
		Name = "Sentry Alphamax: Judge of Sins",
		CopyBodge = "Dwarvern Sentry: Alpha",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a Dwarf dies: Draw a card.\nDuring your end step: Deal 250 damage to each fighter with the lowest Health.",
			Ability = {
				OnAnyDeath = {
					Power = { { "Draw", 1, "Ally" } },
					Archetype = "Dwarf",
					Target = "Opponent"
				},
				OnEnd = {
					Power = { { "Damage", 250, "LowestHealth" } },
					Target = "Self"
				}
			}
		},
		Bio = "Sentries turned on their creators. Not out of malice, but out of poor coding."
	},
	GH5 = {
		Id = 4918507037,
		Name = "Sentry Betamax: Jury of Hatred",
		CopyBodge = "Dwarvern Sentry: Beta",
		Health = 600,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Red",
		Cost = { Neutral = 1, Red = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a Dwarf dies: Destroy the oldest card in your opponent's hand.\nDuring your end step: Deal 250 damage to each fighter with the lowest Health.",
			Ability = {
				OnAnyDeath = {
					Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
					Archetype = "Dwarf",
					Target = "Opponent"
				},
				OnEnd = {
					Power = { { "Damage", 250, "LowestHealth" } },
					Target = "Self"
				}
			}
		},
		Bio = "'A colossal Sentry, capable of planetary destruction. It's single directive : Save Everything'. ~ Dwarven report titled 'Dwarven Meteor'."
	},
	GH6 = {
		Id = 4918506588,
		Name = "Sentry Gammamax: Executioner of Malice",
		Health = 500,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gun",
		Archetype = "Sentry",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever a Dwarf dies: Give yourself one of each Sentry Component.\nDuring your end step: Deal 250 damage to each fighter with the lowest Health.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{ "Add", "Sentry Weaponry" },
						{ "Add", "Sentry Fuel" },
						{ "Add", "Sentry Plating" }
					},
					Archetype = "Dwarf",
					Target = "Ally"
				},
				OnEnd = {
					Power = { { "Damage", 250, "LowestHealth" } },
					Target = "Self"
				}
			}
		},
		Bio = "The Fortress Masters found the blueprints for a massive Sentry, capable of guarding the entire galaxy. But the history records end shortly after its inception. Where did it go?"
	},
	GH8 = {
		Id = 6742913043,
		Name = "Chromafex, Dwarvern Meteor The Meteor",
		Health = 4000,
		Power = 4000,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Archetype = "Chromafex",
		Color = "Red",
		Cost = { Neutral = 2 },
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		LockImmune = true,
		MoveGenZoneImmune = true,
		DivideImmune = true,
		SummonAnimation = "SummonNibblex",
		Effect = {
			Name = "Temporal Halo",
			Description = "This fighter is immune to all effects.\nWhenever an allied fighter is cast: Obliterate it. Whenever an enemy fighter dies, if your opponent controls a fighter: Unlock this card.",
			Ability = {
				OnAllySummon = {
					Power = { { "Obliterate" } },
					Target = "Aggressor"
				},
				OnEnemyDeath = {
					Power = { { "Unlock", 9999, "Ally" } },
					Target = "Self",
					Requirement = { "Board", "Opponent", 1, 9999 }
				}
			}
		},
		Bio = "Pulled from time, the Meteor threatens to crash into Robloxia once again."
	},
	GH7 = {
		Id = 8938592657,
		Name = "Dwarvern Evacuation",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		IsBotCard = true,
		Cost = { Neutral = 1, Blue = 1, Yellow = 1, Red = 1 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Draw three cards.\nSummon three Dwarf cards.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 3 },
				{
					"RandomSummon",
					{ "GH1", "GH2", "GH3" }
				},
				{
					"RandomSummon",
					{ "GH1", "GH2", "GH3" }
				},
				{
					"RandomSummon",
					{ "GH1", "GH2", "GH3" }
				}
			},
			Target = "Ally"
		},
		Bio = ""
	},
	["Failed Expirement"] = {
		Id = 10348254150,
		Name = "Amalgam of Chaos: Failed Expirement",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		AttackBlock = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		Archetype = "Expirement",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Anchored. This fighter is immune to all effects. During your end step: add 2 Chaos cards to your hand. When this card dies: i̷̦͛̋̒t̶̡̺͋̽ ̸̛͉̼̈́̕d̸̖̔̓ǫ̶̨͇̐̚e̷͍͉̽̄ͅs̶͖̏ǹ̷̰͚̖'̷̹̦̱̽̐t̴̪͌ͅ.̷͇́",
			Ability = {
				OnEnd = {
					Power = {
						{ "SetFatigueImmune" },
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						},
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Damage", 500, "Ally" },
						{ "Summon", "Failed Expirement Split" },
						{ "Summon", "Failed Expirement Split" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Something never meant to be alive now is. This blight on the world will not heal will not heal will not heal will not heal will not heal will not heal will not heal will not heal"
	},
	["Failed Expirement Split"] = {
		Id = 10348254150,
		Name = "Fragment of Chaos: Failed Expirement",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		AttackBlock = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		Archetype = "Expirement",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Anchored. This fighter is immune to all effects. During your end step: add 2 Chaos cards to your hand. When this card dies: i̷̦͛̋̒t̶̡̺͋̽ ̸̛͉̼̈́̕d̸̖̔̓ǫ̶̨͇̐̚e̷͍͉̽̄ͅs̶͖̏ǹ̷̰͚̖'̷̹̦̱̽̐t̴̪͌ͅ.̷͇́",
			Ability = {
				OnEnd = {
					Power = {
						{ "SetFatigueImmune" },
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						},
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Damage", 500, "Ally" },
						{ "Summon", "Failed Expirement Final" },
						{ "Summon", "Failed Expirement Final" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Something never meant to be alive now is. This blight on the world will not heal will not heal will not heal will not heal will not heal will not heal will not heal will not heal"
	},
	["Failed Expirement Final"] = {
		Id = 10348254150,
		Name = "Sliver of Chaos: Failed Expirement",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		AttackBlock = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		Archetype = "Expirement",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Anchored. This fighter is immune to all effects. During your end step: add 2 Chaos cards to your hand. When this card dies, if all other copies of it are dead: Ban its controller.",
			Ability = {
				OnEnd = {
					Power = {
						{ "SetFatigueImmune" },
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						},
						{
							"RandomAdd",
							{
								"FEChaos1",
								"FEChaos2",
								"FEChaos3",
								"FEChaos4",
								"FEChaos5",
								"FEChaos6"
							}
						}
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = { { "Inflict", 99999 } },
					Target = "Self",
					EffectRequirement = { "Archetype", "Ally", 0, 2, "Expirement" }
				}
			}
		},
		Bio = "Something never meant to be alive now is. This blight on the world will not heal will not heal will not heal will not heal will not heal will not heal will not heal will not heal"
	},
	FEChaos1 = {
		Id = 8421381144,
		Name = "Chaotub",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Too many cards.....",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Otub" },
						{ "Summon", "Otub" },
						{ "Summon", "Otub" },
						{ "Summon", "Otub" },
						{
							"AlterEV",
							{ "Set", "Hand_Opponent", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 6, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{ "Damage", "Variable" }
					},
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = {
						{ "SpecificDiscard", 1, "RandomEnemyHand" },
						{ "SpecificDiscard", 1, "RandomEnemyHand" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	FEChaos2 = {
		Id = 2810632305,
		Name = "Chaoblox",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "It loves cowlors.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 100 },
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "Chromatic", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2, "Self" }
					},
					Target = "EnemyRightMost"
				},
				OnEVCheckFail = {
					Power = { { "Obliterate", 30, "EnemyLeftMost" } },
					Target = "EnemyLeftMost"
				},
				OnEVCheckPass = {
					Power = { { "Transform", "Cow", "All" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	FEChaos3 = {
		Id = 5205626063,
		Name = "Chaomare",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "The dead brings discovery",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 100 },
						{
							"AlterEV",
							{ "Set", "GraveZone_Opponent", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 8, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = {
						{ "DeckAdd", "Nightmare" },
						{ "DeckAdd", "Nightmare" },
						{ "DeckAdd", "Nightmare" },
						{ "DeckAdd", "Nightmare" },
						{ "DeckAdd", "Nightmare" }
					},
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = { {
						"RandomAdd",
						{ "FEFatalDiscovery2", "FEFatalDiscovery1" },
						"Ally"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	FEChaos4 = {
		Id = 7128383934,
		Name = "Chaoquack",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "The Rare elemental comes.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingAdd",
							{ "Rubber Duck", 10 },
							"Opponent"
						},
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "Rare", "Nil" }
						},
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = { { "Lock", 1 } },
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = { { "Summon", "Confusion Elemental?" } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	FEChaos5 = {
		Id = 3557113879,
		Name = "Chaosearch",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast down by his mighty bread.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "One4utwo4me" },
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 5, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = { { "Inflict", 200 } },
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = { { "Damage", 400 } },
					Target = "All"
				}
			}
		},
		Bio = ""
	},
	FEChaos6 = {
		Id = 6688744901,
		Name = "Chaostud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		DestroyImmune = true,
		StealImmune = true,
		ObliterateImmune = true,
		Stealth = true,
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "Too many stud...",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomSummon",
							{ "FanStudRed", "FanStudYellow", "FanStudBlue", "FanStudGreen" }
						},
						{
							"RandomSummon",
							{ "FanStudRed", "FanStudYellow", "FanStudBlue", "FanStudGreen" }
						},
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "ColorNeutral", "Nil" }
						},
						{ "EVGreaterValueCheck", 7, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckFail = {
					Power = { { "Cost", -1000 } },
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = { { "SetNeutral", 4 } },
					Target = "All"
				}
			}
		},
		Bio = ""
	},
	FEFatalDiscovery1 = {
		Id = 1480499313,
		Name = "Accurate Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent targets a fighter with an effect: Destroy this card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemyTarget = {
					Power = { { "SpecificDiscard", 1, "AlliedFirstSelfCopy" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	FEFatalDiscovery2 = {
		Id = 1480499313,
		Name = "Active Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TriggerInHand = true,
		TokenDiscard = true,
		AddBlock = true,
		CopyDeckImmune = true,
		Cost = { Neutral = 30 },
		Effect = {
			Name = "Temporal Halo",
			Description = "If your opponent casts an action: Destroy this card. During your end step, if this card is in your hand: Reveal this card, set it's cost to zero studs. When this card is cast: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"SetCost",
							{ 0, "Neutral" },
							"Self"
						},
						{ "RevealCard" }
					},
					Target = "Self"
				},
				OnEnemyCast = {
					Power = { { "SpecificDiscard", 1, "AlliedFirstSelfCopy" } },
					Target = "Self"
				}
			}
		},
		Bio = " "
	},
	DragerTerrain = {
		Id = 323275958,
		Name = "Spirit Of Splexit",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Terrariant = "Remnant Terrain",
		Terrain = true,
		DestroyImmune = true,
		StealImmune = true,
		AnimateImmune = true,
		ObliterateImmune = true,
		EffectVariable = 0,
		Effect = {
			Name = "Temporal Halo",
			Description = "When this terrain is cast or at the start of each player's turn: Destroy all non-Colourless cards in your baseplate. Studs no longer reset on end step. You can't baseplate cards.",
			Ability = {
				OnSummon = {
					Power = { { "Splexify" } },
					Target = "Self"
				},
				OnStart = {
					Power = {
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
						}
					},
					Target = "CurrentTurn"
				}
			}
		},
		Bio = "A spirit of a long lost era of Duelshire, still clinging onto existance."
	},
	DRRift = {
		Id = 300638691,
		Name = "Acolyte of the Rift",
		Health = 750,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Archetype = "Acolyte",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Acolyte",
			Description = "Gain 1 Blue Icon and unlock all Dragon related cards at the end of each of your turns.",
			Type = "OnEnd",
			Power = {
				{ "Blue", 1, "Ally" },
				{ "Unlock", 999 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "What makes the rift from the void?"
	},
	DRSkullsten = {
		Id = 362315471,
		Name = "Skullsten",
		Health = 500,
		Power = 550,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 4, Blue = 1 },
		Effect = {
			Name = "Icon Hardscope",
			Description = "Gain 1 Blue icon and draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Blue", 1 },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Not many skulls have names, Sten is an exception."
	},
	DRSylrath = {
		Id = 285155047,
		Name = "Sylrath",
		Health = 150,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Dark Bribe",
			Description = "Draw 1 card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "One of the best Blox Card fighters in the game! See him around!"
	},
	DROfficer = {
		Id = 298793640,
		Name = "Police Officer",
		Health = 275,
		Power = 100,
		Rarity = "Token",
		Archetype = "Police",
		AttackEffect = "Gun",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Freeze Snap",
			Description = "Locks one fighter for 1 turn. Gain 1 Blue icon.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Blue", 1, "Ally" }
			},
			Target = "Single"
		},
		Bio = "Jailing people for making bomb-clocks since 2015."
	},
	DRFuryBlocks = {
		Id = 283993388,
		Name = "FuryBlocks",
		Health = 300,
		Power = 500,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Don't touch his bucket at all."
	},
	DRRegimen = {
		Id = 280563178,
		Name = "Regimen",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "Punch",
		Cost = { Neutral = 2, Blue = 1 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Regiment",
			Description = "Increase the attack and health of one fighter by 100.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "Single"
		},
		Bio = "He sure loves the summer heat while playing some basketball. Don't ruin his day or you'll be asking for it."
	},
	DRArcher = {
		Id = 292778177,
		Name = "Korblox Archer",
		Health = 200,
		Power = 700,
		Rarity = "Token",
		Archetype = "Korblox",
		SummonAnimation = "KorbloxCall",
		DeathAnimation = "KorbloxDeath",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "Punch",
		Cost = { Neutral = 3, Blue = 2 },
		Effect = {
			Name = "Quick Shot",
			Description = "Reduce the attack of one fighter by 500.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 500
		},
		Bio = "Korblox arrows are made of a powerful ore they mine. Check up with your GP for symptoms if you get shot by one."
	},
	DRSharpTH = {
		Id = 266032097,
		Name = "SharpTH",
		Power = 500,
		Health = 500,
		Rarity = "Token",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "Punch",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Dark Bribe",
			Description = "Draw 1 card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "SharpTH, a Sonic Original Character named by this user, who ended up on ROBLOX while being classy at a resort. Crazy right? Not as crazy as his power to destroy, but just see for yourself on that one."
	},
	DRStayBlue = {
		Id = 384005918,
		Name = "StayBlue",
		Health = 600,
		Power = 400,
		Rarity = "Token",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "Punch",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Frostblast",
			Description = "Deal 150 damage to one fighter.",
			Type = "OnSummon",
			Power = "Damage",
			Target = "Single",
			Increase = 150
		},
		Bio = "He just likes to see the world frozen."
	},
	DRNenjas = {
		Id = 316000958,
		Name = "Nenjas",
		Health = 750,
		Power = 0,
		Rarity = "Token",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "IcePunch",
		Cost = { Neutral = 1, Blue = 5 },
		Effect = {
			Name = "Endless Spooks",
			Description = "When this card attacks, deal 4000 damage to all fighters.",
			Type = "OnAttack",
			Power = { { "Damage", 4000 } },
			Target = "All"
		},
		Bio = "Don't hit his cake hat, or you'll be asking for it."
	},
	DRGodbeast = {
		Id = 335986514,
		Name = "Demonic Godbeast",
		Health = 5000,
		Power = 5000,
		Rarity = "Token",
		AttackEffect = "Punch",
		AttackBlock = true,
		Token = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Revival",
			Description = "Cant attack. Destroy this card at the end of your turn.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "Archetype",
			Increase = 9999
		},
		Bio = "Conjurer Bebee2's Master rule: Only summon what you can dismiss."
	},
	DRBebee2 = {
		Id = 335986392,
		Name = "Bebee2",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Blue = 4, Neutral = 4 },
		Effect = {
			Name = "Revival",
			Description = "Summon Demonic Godbeasts until your board is full.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" },
				{ "Summon", "DRGodbeast" }
			},
			Target = "Ally"
		},
		Bio = "How is this card fair? I dunno."
	},
	DRtbradm = {
		Id = 384009944,
		Name = "tbradm",
		Health = 700,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Blue = 5 },
		Effect = {
			Name = "Strike it up!",
			Description = "Increase the Health and Power of all your fighters by 200.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200 },
				{ "Heal", 200 }
			},
			Target = "Ally"
		},
		Bio = "How do people still not realize that this guy helped with Pokemon Brick Bronze?"
	},
	DRVetexGames = {
		Id = 384010450,
		Name = "VetexGames",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Ice",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 3, Blue = 5 },
		Effect = {
			Name = "Quick Shot",
			Description = "Reduce the attack of one fighter by 200.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 200
		},
		Bio = "I just like games."
	},
	DRIcyTea = {
		Id = 264620043,
		Name = "IcyTea",
		Health = 700,
		Power = 500,
		Rarity = "Token",
		Color = "Blue",
		IsBotCard = true,
		AttackEffect = "Ice",
		Cost = { Neutral = 2, Blue = 5 },
		Effect = {
			Name = "King's Freeze",
			Description = "Locks all opponent fighters for 2 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Opponent",
			Increase = 2
		},
		Bio = "Master of arts and ice, IcyTea is an impeccable fighter capable of advanced magic and destructive power. Watch out!"
	},
	DRHatdaCat = {
		Id = 343430211,
		Name = "HatdaCat",
		Health = 1250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Blue = 3 },
		Effect = {
			Name = "Counter Strike",
			Description = "When this card Attacks, Lock all enemy fighters for 1 turn. This fighter is locked an additional turn when it attacks.",
			Type = "OnAttack",
			Power = {
				{ "Lock", 1 },
				{ "Lock", 2, "Self" }
			},
			Target = "Opponent",
			Increase = 1
		},
		Bio = "Woop woop!"
	},
	DRItssPaladin = {
		Id = 335687394,
		Name = "ItssPaladin",
		Health = 800,
		Power = 425,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Blue = 2, Neutral = 4 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Lock a fighter for 3 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Single",
			Increase = 3
		},
		Bio = "He thinks colored icons are more important than neutral ones!"
	},
	DRAlexnewtron = {
		Id = 323661958,
		Name = "Alexnewtron",
		Health = 975,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Blue = 3, Neutral = 2 },
		Effect = {
			Name = "JUST SCRIPT IT",
			Description = "When this card attacks, deal 150 damage to all enemy fighters.",
			Type = "OnAttack",
			Power = { { "Damage", 150 } },
			Target = "Opponent"
		},
		Bio = "A fan of Toontown and Dodgeball, Alexnewtron can literally script any fun game out of thin air."
	},
	DRNobleDragon = {
		Id = 296708322,
		Name = "NobleDragon",
		Health = 900,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		IsBotCard = true,
		Cost = { Neutral = 2, Blue = 6 },
		Effect = {
			Name = "TNL Finale",
			Description = "At the end of your turn, deal 200 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = "Damage",
			Target = "Opponent",
			Increase = 200
		},
		Bio = "Known as the livestream host for ROBLOX's 'The Next Level,' Bob with his Noble Dragon is the staple to any deck affiliated with its trait."
	},
	["Adreti AI"] = {
		Id = 10846498349,
		Name = "Adreti, Rageborne Archangel",
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Prime Rageborne",
		DiscardBlock = true,
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		WeakenImmune = true,
		SwapImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		CopyImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		SuspendImmune = true,
		HideArchetype = true,
		Mitigation = 100000,
		DamageMitigation = 100000,
		Cost = { Neutral = 0 },
		Effect = {
			Description = "This fighter is immune to all non-lock effects and is immune to all damage until both player's 10th Turn. During your end step: put a Gnawing Rage into your opponents baseplate.",
			Ability = {
				OnStart = {
					Power = {
						{ "RemovePassive", "TransformImmune" },
						{ "Transform", "Adreti AIT" }
					},
					Target = "Self",
					EffectRequirement = { "Turns", "Ally", 21, 9999 }
				},
				OnAllyStart = {
					Power = { { "Inflict", 1000, nil, nil, nil, "OpponentEnterRage" } },
					Target = "Opponent",
					EffectRequirement = { "Board", "OpponentGenZone", 7, 9999, "AdretiRage" }
				},
				OnEnd = {
					Power = { {
						"AddGenZone",
						{ "AdretiGnawing", 1 }
					} },
					Target = "Opponent"
				}
			}
		},
		Bio = "\"We shall not fail again, We cannot. The rage shall feed upon all, and I shall make it so.\""
	},
	["Adreti AIT"] = {
		Id = 10846498349,
		Name = "Adreti, Rageborne Archangel",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Prime Rageborne",
		TokenDiscard = true,
		AddBlock = true,
		IsBotCard = true,
		SwapImmune = true,
		DestroyImmune = true,
		SetImmune = true,
		StealImmune = true,
		CloneImmune = true,
		CopyImmune = true,
		ObliterateImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		MoveGenZoneImmune = true,
		HideArchetype = true,
		Cost = { Neutral = 0 },
		Effect = {
			Description = "This fighter is immune to all non-lock, damaging or weakening effects. During your end step: put a Gnawing Rage into your opponents baseplate. When this card dies: Ban it's controller.",
			Ability = {
				OnDeath = {
					Power = { { "Inflict", 99999 } },
					Target = "Self"
				},
				OnAllyStart = {
					Power = { { "Inflict", 1000 } },
					Target = "Opponent",
					EffectRequirement = { "Board", "OpponentGenZone", 7, 9999, "AdretiRage" }
				},
				OnEnd = {
					Power = { {
						"AddGenZone",
						{ "AdretiGnawing", 1 }
					} },
					Target = "Opponent"
				}
			}
		},
		Bio = "\"...A full onslaught of Rageborne upon you, yet you still stand...Your resileince is admirable, but it ends now.\""
	},
	AdretiGnawing = {
		Id = 10846496791,
		Name = "Gnawing Anger",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Token = true,
		TokenDiscard = true,
		TokenGenZone = true,
		Archetype = "Gnawing Rage",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectAnimation = "ExitRage",
		Effect = {
			Name = "Knockdown",
			Description = "At the start of your Opponent's Turns: If you have 7 Gnawing Anger in your baseplate, you lose 1000 life.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Obliterate", 30, "AllyUnlocked" },
						{
							"GenZoneDiscard",
							{ "Self", 1 }
						}
					},
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 1, 9999, "Unlocked" }
				}
			}
		},
		Bio = "<i>The more you resist it, the harder it eats you from the inside.</i>"
	},
	AdretiCalm = {
		Id = 10823644544,
		Name = "Moon Rabbit's Calm",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Token = true,
		DestroyImmune = true,
		TokenDiscard = true,
		TokenGenZone = true,
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Knockdown",
			Description = "Remove a Gnawing Rage from your baseplate. Give yourself a copy of this card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "AdretiGnawing", "GenZone_Ally", "GraveZone_Ally", true, false }
						},
						{ "Add", "AdretiCalm", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>This operation requires a strong mental fortitude - something we Paraselenes are known for. Let the Light of the True Moon embrace you.</i>"
	},
	AdretiPRY = {
		Id = 9604930028,
		Name = "Prime Rageborne, Midas",
		Health = 2000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Archetype = "Prime Rageborne",
		DestroyImmune = true,
		Token = true,
		TokenDiscard = true,
		TokenGenZone = true,
		Requirement = { "Turns", "Ally", 7, 9999 },
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: Enter Rage.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "AdretiPRG", "Ally" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = { {
						"AddGenZone",
						{ "RageIndicator", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "<i>In the ruins of greed, a cruelty foretold. The Caesar of Destruction, brought forth by gold.</i>"
	},
	AdretiPRG = {
		Id = 10824252094,
		Name = "Prime Rageborne, Hermeien Sandalwood",
		Health = 550,
		Power = 1050,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Archetype = "Prime Rageborne",
		PlayTest = true,
		IsBotCard = true,
		Token = true,
		TokenDiscard = true,
		TokenGenZone = true,
		DiscardBlock = true,
		Requirement = { "Turns", "Ally", 13, 9999 },
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		EffectAnimation = "RageborneEyeGlint",
		Effect = {
			Name = "Stud",
			Description = "Whenever this card attacks: Adreti and Allied Prime Ragebornes gain 500 health.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "AdretiPRR", "Ally" } },
					Target = "Ally"
				},
				OnAttack = {
					Power = { { "Heal", 500 } },
					Target = "AlliedArchetype"
				}
			}
		},
		Bio = "<i>Voices of spirits deafened, the souls of many engulfed. An anguish held within, a purpose still kept in.</i>"
	},
	AdretiPRR = {
		Id = 9499177338,
		Name = "Prime Rageborne, Bilakuten",
		Health = 550,
		Power = 1050,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Archetype = "Prime Rageborne",
		PlayTest = true,
		IsBotCard = true,
		Token = true,
		TokenDiscard = true,
		TokenGenZone = true,
		DiscardBlock = true,
		Requirement = { "Turns", "Ally", 21, 9999 },
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		EffectAnimation = "RageborneEyeGlint",
		Effect = {
			Name = "Stud",
			Description = "When this card dies: Summon each stack of Rage in your Baseplate as a 500/500 fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "AdretiPRW", "Ally" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" },
						{ "SummonGenZone", "RageIndicator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "<i>The clouds ran red with the color of rage, the air contaminated by the Impact's esscence. The people of Javion looked towards the sky, and bore witness a frightening prescence.</i>"
	},
	AdretiPRW = {
		Id = 10824131056,
		Name = "Prime Rageborne, Gilfred Swordfrost",
		Health = 1100,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Archetype = "Prime Rageborne",
		PlayTest = true,
		IsBotCard = true,
		TokenDiscard = true,
		TokenGenZone = true,
		DiscardBlock = true,
		Requirement = { "Turns", "Ally", 27, 9999 },
		EffectVariable = 0,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: This card generates thrice. Whenever this card attacks: You lose all of your colourless studs. Allied fighters gain 100 Power for each stud removed this way.",
			Ability = {
				OnEnd = {
					Power = { { "Generate", 3 } },
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ColorNeutral", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "SetNeutral", 0, "Ally" },
						{ "Strengthen", "Variable", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>The Autocracy fell against the Eater, engulfed in an eternal winter. Decades of freedom long gone, prisoners' shackles now undone.</i>"
	},
	SCAMBOSS = {
		Id = 10847248746,
		Name = "Small Doll",
		Health = 1050,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Description = "When this card dies: The owner of this card loses.<br />When this card survives at the start of its owner's turn: The owner of this card wins.",
			Ability = {
				OnAttack = {
					Power = { { "Inflict", 99999 } },
					Target = "Opponent"
				},
				OnDeath = {
					Power = { { "Inflict", 99999 } },
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{ "Unlock", 9999 },
						{ "Scammed" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>PRODUCT BY CASH GRAB CO. FOR THE INTENDED USE OF TOMFOOLERY</i>"
	},
	SCAM1 = {
		Id = 10847205199,
		Name = "Small Fighter",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2 },
		Charge = true,
		AltCards = {
			["SCAM1-DB"] = { DiscardBlock = true }
		},
		Effect = {
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "<i>PRODUCT BY CASH GRAB CO. FOR THE INTENDED USE OF TOMFOOLERY</i>"
	},
	SCAM2 = {
		Id = 10847202298,
		Name = "Medium Fighter",
		Health = 350,
		Power = 350,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Charge = true,
		AltCards = {
			["SCAM2-DB"] = { DiscardBlock = true }
		},
		Effect = {
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "<i>PRODUCT BY CASH GRAB CO. FOR THE INTENDED USE OF TOMFOOLERY</i>"
	},
	SCAM3 = {
		Id = 10856044260,
		Name = "Large Fighter",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Neutral = 4 },
		Charge = true,
		AltCards = {
			["SCAM3-DB"] = { DiscardBlock = true }
		},
		Effect = {
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "<i>PRODUCT BY CASH GRAB CO. FOR THE INTENDED USE OF TOMFOOLERY</i>"
	},
	SCAM_CHEAT = {
		Id = 0,
		Name = "Underhanded Farseeker Tactics",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		IsBotCard = true,
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Blessing = true,
		ModifierEldritch = true,
		DiscardBlock = true,
		Effect = {
			Description = "Put an Eldritch Blessing on your first and second hand slots.",
			Type = "OnSummon",
			Target = "Self",
			Power = { {
				Power = "AddHandModifier",
				Increase = "EldritchBless",
				Target = "Self",
				MetaData = {
					SlotTargets = { 0, 1 }
				}
			} }
		},
		Bio = "Time to even the odds."
	},
	["Hallow's Bargain-CE"] = {
		Id = 10279396887,
		Name = "Hallow's Summons",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Requirement = { "Board", "Ally", 0, 8 },
		Effect = {
			Name = "Haydoscale",
			Description = "Summon a random fighter. Trigger its effects as though it was cast.",
			Type = "OnSummon",
			Power = { { "RandomSummonWithEffect", "Fighter" } },
			Target = "Ally"
		},
		Bio = "Lord Umberhallow cornered the spirit of confusion itself. With death as the only other option, it choose to bingusfart its way into his servitude."
	},
	["The Robloxian Overlay-CE"] = {
		Id = 98589228573520,
		Name = "The Robloxian Overlay",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 8 },
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle each player's hand together, then equally distribute that hand back to all players. Repeat this effect for each player's deck and baseplate. Put two colourless studs into each player's Baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"ShuffleZones",
					{ "Hand_Ally", "Hand_Opponent" }
				},
				{
					"ShuffleZones",
					{ "GenZone_Ally", "GenZone_Opponent" }
				},
				{
					"ShuffleZones",
					{ "Deck_Ally", "Deck_Opponent" }
				},
				{
					"AddGenZone",
					{ "Mark Stud", 2 },
					"Ally"
				},
				{
					"AddGenZone",
					{ "Mark Stud", 2 },
					"Opponent"
				}
			},
			Target = "Ally"
		},
		Bio = "With Javion's stability breaking down without its wealthy coffers, YueLiang had only one option."
	},
	TelaStarsnatch = {
		Id = 6030833995,
		Name = "Telamon's Starsnatch",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Electric",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Yellow = 1, Blue = 1, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Steal a target fighter.",
			Type = "OnSummon",
			Power = { { "Steal" } },
			Target = "Single"
		},
		Bio = "The Celestials stole God's child. The Titans stole their children in revenge."
	},
	["TelaWrath of the Fried One"] = {
		Id = 7550895445,
		Name = "Wrath of Telamon",
		AltCards = {
			["RaidTelaWrath of the Fried One"] = {
				Effect = {
					Name = "Board Clear!",
					Description = "Deal 500 damage to all fighters. They lose 500 Power.",
					Type = "OnSummon",
					Power = {
						{ "Damage", 500 },
						{ "Weaken", 500 }
					},
					Target = "All"
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Bio = "You wouldn't really expect it but 1500 1-damage chicken legs lobbed at you HURTS.",
		Effect = {
			Name = "Board Clear!",
			Description = "Deal 1500 damage to all fighters. They lose 1500 Power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 1500 },
				{ "Weaken", 1500 }
			},
			Target = "All"
		}
	},
	["TelaCathedral of the Fried One"] = {
		Id = 11769902331,
		Name = "Cathedral of Telamon",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrain = true,
		Terrariant = "Shedletsky's Return",
		Cost = { Neutral = 1, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Give yourself a Divine Limb.",
			Ability = {
				OnEnd = {
					Power = { {
						"RandomAdd",
						{
							"TelaRight Arm of the Fried One",
							"TelaLeft Arm of the Fried One",
							"TelaLeft Leg of the Fried One",
							"TelaRight Leg of the Fried One"
						}
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Praying for god's help calmed the despaired minds, even if slightly."
	},
	["TelaLeft Arm of the Fried One"] = {
		Id = 6858738748,
		Name = "Divine Multicultural Limb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Yellow = 1 },
		EffectAnimation = "SelfYellow",
		Effect = {
			Name = "Limb",
			Description = "Summon Shedletsky in his yellow form, Paragon of Unity.",
			Type = "OnSummon",
			Power = { { "Summon", "Shedletsky, Paragon of Unity 1" } },
			Target = "Ally"
		},
		Bio = "A thriving chicken limb, filled with a billion different possibilities."
	},
	["TelaLeft Leg of the Fried One"] = {
		Id = 5054712474,
		Name = "Divine Verdant Limb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Green = 1 },
		EffectAnimation = "SelfGreen",
		Effect = {
			Name = "Limb",
			Description = "Summon Shedletsky in his green form, Locus of Studs.",
			Type = "OnSummon",
			Power = { { "Summon", "Shedletsky, Locus of Icons" } },
			Target = "Ally"
		},
		Bio = "A succulent chicken limb. Unimaginable growth awaits those who know how to use it."
	},
	["TelaRight Leg of the Fried One"] = {
		Id = 5054711159,
		Name = "Divine Tyrannical Limb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Red = 1 },
		EffectAnimation = "SelfRed",
		Effect = {
			Name = "Limb",
			Description = "Summon Shedletsky in his red form, The Raging Pulse.",
			Type = "OnSummon",
			Power = { { "Summon", "Shedletsky, the Raging Pulse" } },
			Target = "Ally",
			EffectTransformPreserveRarity = true
		},
		Bio = "A fiery chicken limb. Holding it fills your mind with thoughts of conquest."
	},
	["TelaRight Arm of the Fried One"] = {
		Id = 5054713870,
		Name = "Divine Scintillant Limb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Shedletsky",
		Color = "Neutral",
		Cost = { Blue = 1 },
		EffectAnimation = "SelfBlue",
		Effect = {
			Name = "Limb",
			Description = "Summon Shedletsky in his blue form, the Resonator.",
			Type = "OnSummon",
			Power = { { "Summon", "Shedletsky, the Resonator" } },
			Target = "Ally"
		},
		Bio = "A curious chicken limb. Thinking about the possibilities provided makes your head spin."
	},
	TelaTelamon = {
		Id = 4564780442,
		Name = "Telamon, Banisher of the Nevermore",
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
		SummonedAnimation = "TelamonSummon",
		Color = "Yellow",
		Cost = { Yellow = 3, Blue = 3, Green = 3, Red = 3, Neutral = 3 },
		Effect = {
			Name = "Bonanza!",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Angry that the Celestials stole his child, Telamon freed prisoners of hell to chase after them."
	},
	UmberCheatFighter = {
		Id = 5271603842,
		Name = "Confused Enforcer",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		Archetype = "Vibeshark",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, or when it dies: It deals 100 damage to all non-Vibesharks. All Vibesharks gain 100 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 100, "NotArchetype" },
						{ "Strengthen", 100, "Archetype" }
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "Damage", 100, "NotArchetype" },
						{ "Strengthen", 100, "Archetype" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I swear, the boss is shorter than I remember him.\""
	},
	UmberCandy = {
		Id = 4899343999,
		Name = "Candy Pile",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Token = true,
		TokenDiscard = true,
		TokenGenZone = true,
		Archetype = "Candy",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Knockdown",
			Description = "Use this to help cast your cards and defend yourself!",
			Ability = {
				OnEnd = {
					Power = {
						{ "Obliterate", 30, "AllyUnlocked" },
						{
							"GenZoneDiscard",
							{ "Self", 1 }
						}
					},
					Target = "Ally",
					EffectRequirement = { "Board", "Ally", 1, 9999, "Unlocked" }
				}
			}
		},
		Bio = "A collection of various candies, types include chocolate, gummy, rock and razorblades."
	},
	UmberCandyGiver = {
		Id = 4899343999,
		Name = "Bucket Of Treats",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		DestroyImmune = true,
		TokenOmni = true,
		Archetype = "Candy",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Knockdown",
			Description = "Put three Candy Piles into your baseplate. Give yourself Trick or Treat.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddGenZone",
							{ "UmberCandy", 3 }
						},
						{ "Add", "UmberCandyGen", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "In desperate times like this, your score of tasty treats might be the one thing that can help you."
	},
	UmberCandyGen = {
		Id = 4899343999,
		Name = "Trick or Treat!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		DestroyImmune = true,
		TokenDiscard = true,
		Token = true,
		TokenGenZone = true,
		Cost = { Neutral = 0 },
		Requirement = { "Playertable", "Me", 0, 1, "Storm" },
		Effect = {
			Name = "Even Out",
			Description = "Cast only if you've cast no cards this turn.\nPut two Candy Piles into your baseplate. Give yourself a copy of this card. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "UmberCandy", 2 }
				},
				{ "Add", "UmberCandyGen", "Ally" },
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
		Bio = ""
	},
	UmberBomb = {
		Id = 9964953839,
		Name = "Candy Bomb",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Requirement = { "Archetype", "AllyGenZone", 1, 999999, "Candy" },
		TokenOmni = true,
		DestroyImmune = true,
		Cost = { Red = 0 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Cast only if you have a Candy Pile in your baseplate. Spend it to deal 300 damage to a target fighter. Give yourself a copy of this card.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
					"Self"
				},
				{ "Damage", 300 },
				{ "Add", "UmberBomb", "Ally" }
			},
			Target = "Single"
		},
		Bio = "A makeshift explosive candy surprise."
	},
	UmberCandyRobber = {
		Id = 7493958437,
		Name = "Candy Robber StaceyD07",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever this fighter destroys another: Put a Candy Pile into your baseplate.",
			Ability = {
				OnDestroy = {
					Power = { {
						"AddGenZone",
						{ "UmberCandy", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Magic robbery! Also may or may not be partners in crime with Hoshpup."
	},
	UmberDentist = {
		Id = 80157277881175,
		Name = "Spooksletsky",
		Health = 300,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, If you have a Candy pile in your baseplate: destroy a Candy pile in your baseplate and deal 300 damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{ "Damage", 300 }
					},
					Target = "Single",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 999999, "Candy" }
				}
			}
		},
		Bio = "Did you know sour candy has an acidity level similar to battery acid? That's exactly why I need to pull out all your teeth and replace them with something... stronger."
	},
	UmberParty = {
		Id = 8822686843,
		Name = "Anthrested Partygoer",
		Health = 400,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "Poof",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Transform a target fighter into a copy of this card.",
			Ability = {
				OnSummon = {
					Power = { { "Transform", "UmberParty" } },
					Target = "Single"
				}
			}
		},
		Bio = "Oh my gosh, you're soooo cute! Here, you're invited to Eris' Halloween Party! Don't have a costume? We'll make you one."
	},
	UmberCandyThief = {
		Id = 7541900569,
		Name = "Hoshpup, Master Candy Thief",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Yellow = 6, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, If you have four or more Candy piles in your baseplate: destroy two Candy pile in your baseplate. Unlock this card and give it 400 power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{ "Unlock", 9999 },
						{ "Strengthen", 400 }
					},
					Target = "Self",
					EffectRequirement = { "Archetype", "AllyGenZone", 4, 999999, "Candy" }
				}
			}
		},
		Bio = "We will never know what his costume is."
	},
	UmberCandyCavalier = {
		Id = 7437135723,
		Name = "Candy Cavalier",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever this fighter attacks: Put a Candy Pile into your baseplate.",
			Ability = {
				OnAttack = {
					Power = { {
						"AddGenZone",
						{ "UmberCandy", 1 }
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "Tricks to all that oppose us! The trick being death!"
	},
	UmberCarver = {
		Id = 10310643402,
		Name = "Candy Carver",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 3 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, If you have a Candy pile in your baseplate: destroy a Candy pile in your baseplate and draw two cards.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{ "Draw", 2 }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 999999, "Candy" }
				}
			}
		},
		Bio = "\"This one's bound to blow your tastebuds away! (Probably because of the 1000 grams of strong mints I put in this thing...)\""
	},
	UmberCollector = {
		Id = 11140906608,
		Name = "Candy Collector",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, If you have a Candy pile in your baseplate: destroy a Candy pile in your baseplate. Allied fighters gain 100 health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "UmberCandy", "GenZone_Ally", "GraveZone_Ally", true, false },
							"Self"
						},
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Ally",
					EffectRequirement = { "Archetype", "AllyGenZone", 1, 999999, "Candy" }
				}
			}
		},
		Bio = "What? You think a candy tax is 'overreaching' and 'immoral exploitation of a holiday that should be free from any overarching economic laws'? Do I look like a philosopher to you? Give up the damn sweets already before my buddy here decides to put some iron right between your eyes!"
	},
	NeoSylrath = {
		Id = 8938776377,
		Name = "Sylrath",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Dark Bribe",
			Description = "When this card destroys another: Search your deck for a Love Note.",
			Type = "OnDestroy",
			Power = { { "Tutorfor", "Love Note" } },
			Target = "Ally"
		},
		Bio = "One of the best Blox Card fighters in the game! See him around!"
	},
	["Love Note"] = {
		Id = 8645456750,
		Name = "Love Note",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Archetype = "Love Note",
		Requirement = { "Archetype", "CurrentHand", 5, 9999, "Love Note" },
		AddBlock = true,
		DiscardBlock = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Cast only if you have five Love Notes in your hand. You win the game!",
			Type = "OnSummon",
			Power = { { "Inflict", 99999 } },
			Target = "Opponent"
		},
		Bio = ""
	},
	["Love Shuffle"] = {
		Id = 8645456750,
		Name = "Love Note Shuffle",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		AddBlock = true,
		Effect = {
			Name = "Temporal Halo",
			Description = "Shuffle 5 Love Notes into both player's decks. Both players gain 10000 life.",
			Type = "OnSummon",
			Power = {
				{ "Inflict", -10000 },
				{ "Cost", -10000, "Ally" },
				{ "DeckAdd", "Love Note", "Opponent" },
				{ "DeckAdd", "Love Note", "Opponent" },
				{ "DeckAdd", "Love Note", "Opponent" },
				{ "DeckAdd", "Love Note", "Opponent" },
				{ "DeckAdd", "Love Note", "Opponent" },
				{ "DeckAdd", "Love Note", "Ally" },
				{ "DeckAdd", "Love Note", "Ally" },
				{ "DeckAdd", "Love Note", "Ally" },
				{ "DeckAdd", "Love Note", "Ally" },
				{ "DeckAdd", "Love Note", "Ally" }
			},
			Target = "Opponent"
		},
		Bio = ""
	},
	NeoSuperCloud9 = {
		Id = 10281277008,
		Name = "SupernalHarp",
		Health = 500,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Inflation",
			Description = "When this card is cast: lock a target fighter for 2 turns.",
			Type = "OnSummon",
			Power = { { "Lock", 2 } },
			Target = "Single"
		},
		Bio = "Is a lover always innocent?"
	},
	["NeoNeodragon Servant"] = {
		Id = 8757376716,
		Name = "Neodragon Servant",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scorch",
		Color = "Neutral",
		Cost = { Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Temporal Halo",
			Description = "At the start of your turns: search your deck for a Love Note.",
			Type = "OnAllyStart",
			Power = { { "Tutorfor", "Love Note" } },
			Target = "Ally"
		},
		Bio = "\"Are you kidding? Those girls just make a mess of the place and then leave it for ME to clean up.\""
	},
	["NeoNeodragonmaid Akaaja"] = {
		Id = 8618023808,
		Rarity = "Token",
		Name = "Neodragonmaid Akaaja",
		Health = 2000,
		Power = 2000,
		Cost = { Neutral = 0 },
		Color = "Neutral",
		AttackEffect = "Scorch",
		Requirement = { "Archetype", "OpponentHand", 4, 9999, "Love Note" },
		Effect = {
			Name = "Reincarnation",
			Description = "Cast only if you your opponent has 4 or more Love Notes. When you do: Shuffle the two oldest cards in their hand back into their deck. Whenever this card attacks your opponent directly: shuffle their hand back into their deck, They draw four cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SpecificDiscard", 30, "EnemyLeftMostHand" },
						{ "SpecificDiscard", 30, "EnemyLeftMostHand" }
					},
					Target = "Self"
				},
				OnStrike = {
					Power = {
						{ "RandomDiscard", 10, "Opponent" },
						{ "Draw", 4 }
					},
					Target = "Opponent"
				}
			},
			EffectSpecificDiscardShuffle = true,
			EffectSpecificDiscardShuffleTarget = "Opponent",
			EffectRandomDiscardShuffle = true
		},
		Bio = "\"Uwaaah! I dropped Cobalt-Sama's favourite treat! Now he'll never notice me ever again!\""
	},
	KG1 = {
		Id = 12146801792,
		Name = "Speedy Skewer",
		Health = 300,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Neutral = 2, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, recur an allied fighter card. It gains haste.",
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
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 3 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 3
					}
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { Charge = true }
				}
			}
		},
		Bio = "Running at someone with a giant spear in your hand would intimidate a lot of people."
	},
	KG2 = {
		Id = 76822736302744,
		Name = "Hazing Ritual",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 400 damage to a target fighter.\nRansack 4. If you do, you gain {Y}{Y}{R}{R}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 400, "Single", nil, nil, "BritishClub" },
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 3 }
					},
					Target = "Self",
					UniqueTargets = true,
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 4 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 4
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "Red", 2 },
						{ "Yellow", 2 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Anyone can join the Familey on one simple condition: Impress the boss with your brutality."
	},
	KG3 = {
		Id = 12146859470,
		Name = "Fashionable Citizen",
		Health = 300,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		GraveAddant = "Fashionable Citizen",
		Cost = { Neutral = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies, if you have 10 or fewer cards in your graveyard: Put two copies of it into your graveyard.",
			Ability = {
				OnDeath = {
					Power = {
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGraveZone", 0, 11 }
				}
			}
		},
		Bio = "Another wonderful day in beautiful Bloxburg! Surely nothing abhorrently awful could ruin this, eh?"
	},
	KG4 = {
		Id = 9238689857,
		Name = "ObamaXJesus",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		Color = "Yellow",
		PackDisplayOverride = "Metaverse Series: Developers & Contributors",
		AttackEffect = "MagicBlue",
		Cost = { Neutral = 3, Yellow = 2, Red = 2, Blue = 2 },
		Effect = {
			Description = "When this card is cast: Search your deck for a card that costs three or fewer total studs.\nWhenever you discard your first, second, or third card each turn: Deal 300 damage to this fighter and a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "RandomTutorfor", "3orLowerCost" } },
					Target = "Ally"
				},
				OnAllyDiscard = {
					Power = {
						{ "Damage", 300 },
						{ "Damage", 300, "Self" }
					},
					Target = "Single",
					EffectRequirement = { "Playertable", "Me", 0, 4, "DiscardCount" }
				}
			}
		},
		Bio = "<font color=\"#0000FF\">Blue...</font>"
	},
	KG5 = {
		Id = 10279381906,
		Name = "zachattack83",
		Health = 700,
		Power = 1400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 4 },
		Effect = {
			Name = "Zach + Attack = Pun",
			Description = "Whenever this card attacks: You gain a Red stud.",
			Type = "OnAttack",
			Power = "Red",
			Target = "Self",
			Increase = 1
		},
		Bio = "Look out! It's Zach! He attacks!"
	},
	KG6 = {
		Id = 4536837512,
		Name = "iamlogic",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you cast a fighter: Deal 200 damage to it. It loses 200 Power. This card gains 200 Health and Power.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 },
				{ "Damage", 200, "Aggressor" },
				{ "Weaken", 200, "Aggressor" }
			},
			Target = "Self"
		},
		Bio = "Die hard JToH fan! My best friend is Epik_Nob! Did you know I hate pizza? Crazy, right? Don't judge lol :3c. What's your name - no , wait, better question - what's your favorite towergirl?"
	},
	MC1 = {
		Id = 12154433978,
		Name = "Defiant March",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1, Green = 1 },
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
	MC2 = {
		Id = 12294931520,
		Name = "Citizen's Militia",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Red = 3 },
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
	MC3 = {
		Id = 12154412901,
		Name = "Civilian Rebel",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 1 },
		Liberate = true,
		Charge = true,
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
	MC4 = {
		Id = 12288062878,
		Name = "Stodgy Lawyer of Last Moments",
		Health = 100,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Seance a card in your graveyard that costs 4 or fewer total studs.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"They say dead men tell no tales. Prove them wrong, tell me everything.\""
	},
	MC5 = {
		Id = 12288065270,
		Name = "Relentless United Front",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Green = 2, Red = 2, Neutral = 4 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Create four cards in your Graveyard, then select two fighter cards in there that cost 4 or fewer total studs. Summon those cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveAdd", "MC1" },
						{ "GraveAdd", "MC6" },
						{ "GraveAdd", "MC6" },
						{ "GraveAdd", "MC3" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, CostOrLess = 4 },
						SelectionDescription = "two cards from the bottom of your deck.",
						MinTargets = 0,
						MaxTargets = 2
					}
				}
			}
		},
		Bio = "A reminder of what they want to prevent."
	},
	MC6 = {
		Id = 12506946858,
		Name = "Bloxburg Protestor",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Look at the top 3 cards of your deck and select any of them. Destroy those cards and randomly put the rest on top of your deck.",
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
						Condition = { TopCard = 3 },
						MinTargets = 0,
						MaxTargets = 4,
						SelectionDescription = "any number of cards"
					}
				}
			}
		},
		Bio = "Can't we just have a WHOLE century without anything bad happening for Pete's sake?!"
	},
	AST1 = {
		Id = 12144409338,
		Name = "Bloxburg Mayor Astarossa",
		Health = 1000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 4, Blue = 2 },
		SummonAnimation = "AstarossaSummon",
		SummonedAnimation = "AstarossaSummon",
		EffectVariable = 0,
		CustomReminder = {
			["Astarossa's Decree"] = "When a zombified card leaves play for any reason, obliterate it. This can trigger death effects, return effects, etc."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a Zombified card: You gain a Colourless Stud. Unlock this card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Neutral", 1, "Ally" },
						{ "Unlock", 99999, "Self" }
					},
					Target = "Self",
					Zombified = true
				}
			}
		},
		Bio = "\"The power to control life and death is not something to brag about. It is a heavy, soul-crushing responsibility.\""
	},
	AST2 = {
		Id = 12288048834,
		Name = "Committee Crony",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Red = 1, Blue = 2 },
		EffectVariable = 0,
		CustomReminder = {
			Inject = "Destroy a non-Zombified fighter. If you do, give its controller a 500/400 Zombified copy of it. It costs {W}{W} to cast."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Inject a target allied fighter.\nWhenever you inject a card: You gain a Colourless stud.",
			Ability = {
				OnAllyInject = {
					Power = { { "Neutral", 1 } },
					Target = "Ally"
				},
				OnAttack = {
					Power = {
						{
							"AddCopy",
							30,
							"SingleAlly",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "SingleAlly" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Not all of Astarossa's cabinet are as noble or honest as him."
	},
	AST3 = {
		Id = 12146798845,
		Name = "Kidnapped Smiley Slasher",
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Neutral = 1, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Zombified = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Ransack 2. If you do, this card gains 600 power until your next end step.",
			Ability = {
				OnAllyStart = {
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
						{ "EVGreaterValueCheck", 1 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 2 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 2
					}
				},
				OnEVCheckPass = {
					Power = { { "TempStrengthen", 600, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "When you see a crowd of grins in the night, make sure to grin back."
	},
	AST4 = {
		Id = 12162810131,
		Name = "Aggressive Reckless Recruiter",
		Health = 600,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 2, Neutral = 1 },
		TargetImmune = true,
		Charge = true,
		EffectVariable = 0,
		CustomReminder = {
			Inject = "Destroy a non-Zombified fighter. If you do, give its controller a 500/400 Zombified copy of it. It costs {W}{W} to cast."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Inject this card.",
			Ability = {
				OnAttackDestroy = {
					Power = {
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
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "\"Hey there! You worried about your health? The CRP is providing free healthcare for all!\""
	},
	AST5 = {
		Id = 12288059819,
		Name = "Disjointed Cause",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 2 },
		EffectAnimation = "SingleInject",
		EffectVariable = 0,
		CustomReminder = {
			Inject = "Destroy a non-Zombified fighter. If you do, give its controller a 500/400 Zombified copy of it. It costs {W}{W} to cast."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target allied fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" }
					},
					Target = "SingleAlly",
					MetaData = {
						Health = 500,
						Power = 400,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true,
			AddCopyToOwner = true
		},
		Bio = "Those of the Enzyme must keep taking it to stay alive; Astarossa would condemn the Astral Faith if he knew about their grizzly recruitment strategy."
	},
	AST6 = {
		Id = 12463899183,
		Name = "Hard-hat Immortal",
		Health = 500,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		TriggerInGraveZone = true,
		Cost = { Neutral = 3, Red = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast your third action each turn: Recur this card. Remove its colourless cost.",
			Ability = {
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{ "Hard-hat Immortal", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 4, "Actions" },
					MetaData = {
						Cost = { Red = 1, Blue = 1 }
					}
				}
			}
		},
		Bio = "Safety is unimportant when you're immortal."
	},
	FL1 = {
		Id = 12145045339,
		Name = "Zombified Catgirl",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Green = 1 },
		TokenOmni = true,
		Zombified = true,
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
		Bio = "xwx owo ewe uwu"
	},
	FL2 = {
		Id = 12145015258,
		Name = "Pawesome Party",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon two 100/100 Zombified Catgirls.\nWhen this card dies, if you're in Bliss: Summon two 100/100 Zombified Catgirls.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingSummon",
						{ "Zombified Catgirl", 2 },
						"Ally"
					} },
					Target = "Self"
				},
				OnDeath = {
					Power = { {
						"RepeatingSummon",
						{ "Zombified Catgirl", 2 },
						"Ally",
						nil,
						nil,
						"BlissTriggerGreen"
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"Nyan, nyew, nyree! Get your paws on me! ~♪\""
	},
	FL3 = {
		Id = 7274999685,
		Name = "TypicalType",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: It deals 500 damage to all fighters.\nAfter this card attacks: Destroy it.",
			Target = "All",
			Ability = {
				OnDeath = {
					Power = { { "Damage", 500, "All" } },
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
	FL4 = {
		Id = 12145035643,
		Name = "Tear and Reshape",
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
	FL5 = {
		Id = 12144394652,
		Name = "Animal Experimentation Kit",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Green = 3, Yellow = 3 },
		CustomReminderBliss = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon two 100/100 Zombified Catgirls. Then if you're in Bliss, all allied fighters gain 300 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "Zombified Catgirl", 2 },
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{ "Strengthen", 300 },
						{ "Heal", 300 }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"Cats are better than men. Can't feel as much pain. Clams are way better. Unable to think, unable to <i>mourn.</i>\""
	},
	FL6 = {
		Id = 12575064646,
		Name = "Novice Arkhivist",
		Health = 600,
		Power = 50,
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
			Description = "When this card is cast: Recur the top card of your graveyard. It gains Fading.",
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
	FL7 = {
		Id = 9256503341,
		Name = "Fursuit",
		Health = 500,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "OwO"
	},
	AP0 = {
		Id = 12560325246,
		Name = "Apollo Says Goodbye",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 3, Blue = 3, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself four cards.\n Choose up to four cards in your hand that each cost 4 or fewer total studs. Seance those cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "AP1", "Ally" },
						{ "Add", "AP2", "Ally" },
						{ "Add", "AP3", "Ally" },
						{ "Add", "AP1", "Ally" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					UniqueTargets = true,
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { CostOrLess = 4 },
						MinTargets = 0,
						MaxTargets = 4,
						SelectionDescription = "up to four cards from your hand"
					}
				}
			},
			Seancing = true
		},
		Bio = "Apollo delved deep into the Necroenzyme's practical applications, from the police to funeral workers. He did the work Eisenhower was too distraught to finish."
	},
	AP1 = {
		Id = 12463901399,
		Name = "Overpowered Morgue Merchant",
		Health = 700,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you seance a card: All allied fighters gain 100 Power until your next end step.",
			Ability = {
				OnAllySeance = {
					Power = { { "TempStrengthen", 100, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "Providing a service reliant reviving the dead could never keep its integrity."
	},
	AP2 = {
		Id = 12288062878,
		Name = "Stodgy Lawyer of Last Moments",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Seance a card in your graveyard that costs 4 or fewer total studs.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"They say dead men tell no tales. Prove them wrong, tell me everything.\""
	},
	AP3 = {
		Id = 12560351263,
		Name = "Grating Counsel Engine",
		Health = 800,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Electric",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Seance a card in your graveyard that costs 4 or fewer total studs.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "4OrLower", "GraveZone_Ally", "Field_Ally", true, false },
						"Self",
						nil,
						nil,
						nil,
						"Seance"
					} },
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					}
				}
			},
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "The greatest scientific minds of Bloxburg banded together, literally <i>and</i> figuratively, though mostly mechanically."
	},
	AP4 = {
		Id = 12144398727,
		Name = "Apollo Scott, Visionary",
		Health = 1600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Storm",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4, Yellow = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Seance three cards in your graveyard and three cards in your opponent's graveyard.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{
							"MoveZone",
							{ "Any", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsync"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsync"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsync"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsyncOpponent"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsyncOpponent"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"SeanceAsyncOpponent"
						}
					},
					Target = "Self",
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
		Bio = "\"The Necroenzyme is unfairly considered a violation of the natural law. I see a different look on it: As a remedy for those who grieve.\""
	},
	AP5 = {
		Id = 12144985466,
		Name = "Second-to-Last Dance Hedonist",
		Health = 700,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		TriggerInGraveZone = true,
		Cost = { Green = 2 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a 100/100 Zombified Catgirl.\nDuring your end step, if this card is in your graveyard and you're in Bliss: Recur this card. It gains Fading.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Zombified Catgirl" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Last Dance Hedonist", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"She couldn't cure my chronic scabies, but she saved me from pain and suffering. Why is being ill so bad when I am so <b>HAPPY?</b>\""
	},
	AK1 = {
		Id = 12288057943,
		Name = "Fauna Feeding",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		AlternateCostRequirement = { "Playertable", "Me", 1, 99999, "RecurCount" },
		AlternateCost = { Green = 1, Blue = 1 },
		Cost = { Blue = 1, Green = 1, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card ignoring its {W} cost if you've recurred a card this turn.\nIf the top card of your graveyard is Green, a target fighter gains 600 Power. Otherwise it gains 600 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "ScanGraveyard" },
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 600, "Single" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Heal", 600, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = "CAITLIN\nTHE HORSE IS HERE"
	},
	AK2 = {
		Id = 7021252729,
		Name = "Calirolls",
		Health = 650,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		EffectAnimation = "DrinkWitchesBrew",
		Effect = {
			Name = "Arkhaiomelisidonophunikheratos",
			Description = "When this card is cast: A target fighter gains 50 power. Swap its stats.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 50 },
				{ "Swap", 100000 }
			},
			Target = "Single"
		},
		Bio = "Here's the tea."
	},
	AK3 = {
		Id = 12575064646,
		Name = "Novice Arkhivist",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top card of your graveyard. It gains Fading.",
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
	AK4 = {
		Id = 12463889224,
		Name = "Hive Terminal",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Green = 4, Blue = 4, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: If the top card of your graveyard is Green, recur the top card of your graveyard. It gains Fading.\nOtherwise, this card gains 300 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"ScanGraveyard"
					} },
					Target = "Self",
					MetaData = { Fading = true },
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckFail = {
					Power = {
						{ "Strengthen", 300, "Self" },
						{ "Heal", 300, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Despite the distances between them, members of the Arkhive are so tightly connected."
	},
	AK5 = {
		Id = 12145023660,
		Name = "Raving Rascal",
		Health = 900,
		Power = 900,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Destroy a target allied fighter, then summon two 100/100 Zombified Catgirls. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly", nil, nil, "BlissTriggerRed" },
						{ "Summon", "Summonant", "Ally" },
						{ "Summon", "Summonant", "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Unable to cope with her mounting regret, Sarah turned to what kept her going in her youth: Parties that go so hard you can't think."
	},
	["Co-SonozakiRaito"] = {
		Id = 4899440490,
		Name = "SonozakiRaito",
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
	["Co-colesans16"] = {
		Id = 10184337856,
		Name = "colesans16",
		StarterCard = true,
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
	["Co-Stud"] = {
		Id = 4952824244,
		Name = "Stud",
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
	["Co-Crystal Cultist"] = {
		Id = 10184401391,
		Name = "Crystal Cultist",
		Health = 1000,
		Power = 50,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Neutral",
		Shield = true,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Overwhelm",
			Description = "When this card dies: Put a copy of it into your baseplate.",
			Type = "OnDeath",
			Power = { {
				"AddGenZone",
				{ "Crystal Cultist", 1 }
			} },
			Target = "Ally"
		},
		Bio = "With great power comes great hordes of cultists."
	},
	["Co-Fat Cat"] = {
		Id = 10184641584,
		Name = "Fat Cat",
		Health = 1500,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Shield = true,
		Effect = {
			Name = "Snorlaxing",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "He haz regretz of his Chezburger dayz."
	},
	["Co-Moded"] = {
		Id = 4899402892,
		Name = "Moded",
		Health = 600,
		Power = 350,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		EffectAnimation = "MidHammerEffectEnemy",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Scripted Shockwave",
			Description = "When this card is cast: Deal 150 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 150 } },
			Target = "Opponent"
		},
		Bio = "White hat hacker for hire!"
	},
	["Co-FixingFailure"] = {
		Id = 10184706994,
		Name = "FixingFailure",
		Health = 500,
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
	["Co-Wingman8"] = {
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
	["Co-ASeal"] = {
		Id = 10184144961,
		Name = "ASeal",
		Health = 350,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Frozen Fish"] = "A colourless action that costs ⚪. It gives a target fighter 200 health, and you 200 Life."
		},
		Effect = {
			Name = "EzWinz",
			Description = "Whenever this card attacks: Give yourself a Frozen Fish.",
			Type = "OnAttack",
			Power = { { "Add", "Co-Frozen Fish" } },
			Target = "Ally"
		},
		Bio = "\"You have to enjoy the frozen fish.\""
	},
	["Co-Frozen Fish"] = {
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
			Description = "A target fighter gains 100 health.\nYou gain 100 life.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Inflict", -100, "Ally" }
			},
			Target = "Single"
		},
		Bio = "\"I'll enjoy it, but only at your expense.\""
	},
	["Co-Extra Snacks"] = {
		Id = 14253659423,
		Name = "Extra Snacks",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Terrain = true,
		CastOnStart = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "Whenever an allied fighter dies: Give both players a colourless stud.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Neutral", 1, "Opponent" },
						{ "Neutral", 1, "Ally" }
					}
				}
			}
		},
		Bio = "Yummy!"
	},
	["Co-Robot"] = {
		Id = 10186169303,
		Name = "Robot",
		Health = 100,
		Power = 100,
		Rarity = "Rare",
		Token = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Addant = "Co-Robot",
		EffectVariable = 0,
		Effect = {
			Name = "Revival",
			Description = "When this card is cast: It gains 100 health and power for each stud in its cost. Give yourself a copy of this card and add {W} to its cost.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{
					"AlterEV",
					{ "Set", "Target", "Cost", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 100, "Nil" },
					"Self"
				},
				{
					"IncreaseCost",
					{ 1, "Neutral", "CopyCardCost" },
					"AlliedFirstSelfCopy"
				},
				{ "Heal", "Variable", "Self" },
				{ "Strengthen", "Variable", "Self" }
			},
			Target = "Ally"
		},
		Bio = "The most efficient in efficient-co technologies."
	},
	["Co-Spectrabox"] = {
		Id = 10186565421,
		Name = "Spectrabox",
		Health = 350,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		Cost = { Neutral = 3 },
		Effect = {
			Description = "When this card dies: Search your deck for a Colourless card.",
			Type = "OnDeath",
			Power = { { "RandomTutorfor", "Neutral" } },
			Target = "Ally"
		},
		Bio = "Alongside Gorbachelli, he stands as the first pioneer of the Fantastic Frontier."
	},
	["Co-Grimclaw the Unholy"] = {
		Id = 7550922611,
		Name = "Grimclaw the Unholy",
		Health = 1500,
		Power = 1500,
		Rarity = "Legendary",
		AttackEffect = "LaserGreen",
		SummonAnimation = "SummonGrimclaw",
		Color = "Neutral",
		Requirement = { "Board", "Opponent", 4, 5 },
		Cost = { Neutral = 5 },
		Effect = {
			Name = "Omega End",
			Description = "Cast only if your opponent controls exactly four fighters.",
			Type = "Null",
			Power = { { "Yellow", 0 } },
			Target = "All"
		},
		Bio = "A dragon of pure destruction, only to be stopped by Greygnarl."
	},
	["Co-Cow"] = {
		Id = 10184373371,
		Name = "Cow",
		Health = 700,
		Power = 200,
		NurtureArt = 13822683424,
		Rarity = "Rare",
		AttackEffect = "Bite",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Archetype = "Cow",
		EffectAnimation = "SmallBiteEffect",
		EffectVariable = 0,
		SummonAnimation = "CowMoo",
		DeathAnimation = "CowGone",
		Effect = {
			Name = "MOO!",
			Description = "When this card is cast: It deals 100 damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Dyna Cowsmasher", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 2000, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", 100, "Nil" }
						},
						{ "Damage", "Variable", "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Why are you a co - MOO!"
	},
	bh_bincent = {
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
	bh_BlossomGardens = {
		Id = 9709374172,
		Name = "VioletVelvet",
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
			Description = "If you've gained 600 or more life this turn, this card has haste.\nWhenever you discard your first card each turn: You gain 600 life. Give yourself a titanic stud card.",
			Type = "OnSecondDiscard",
			Power = {
				{ "Cost", -600 },
				{
					"RandomAdd",
					{ "Blue Titanic Stud" }
				}
			},
			Target = "Ally"
		},
		Bio = "She doesn't know exactly how she ended up here. Is it because she's way too competitive for her own good? Or maybe it's just because she has a fascination with all things related to inanimate objects? The world may never know..."
	},
	bh_Developer = {
		Id = 6801092502,
		Name = "Developer",
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
	bh_RiceStorage = {
		Id = 6419877339,
		Name = "RiceStorage",
		Health = 450,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "OnigiriBuff",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "Assimilate",
			Description = "Whenever your opponent gains life: Unlock this card and it gains 100 health and power.",
			Type = "OnEnemyLifeGain",
			Power = {
				{ "Unlock", 9999 },
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Self"
		},
		Bio = "His love of rice sometimes goes out of hand by filling his entire room of just rice. He'll store rice anywhere so he has plenty of rice to eat."
	},
	bh_SquidShock = {
		Id = 6854749640,
		Name = "SquidShock",
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
	bh_DominatedLegacy = {
		Id = 17790861818,
		Name = "DominatedLegacy",
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
	bh_Dued1 = {
		Id = 10534883537,
		Name = "Dued1",
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
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
	bh_Spark = {
		Id = 7559457816,
		Name = "Spark",
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
	bh_Gaomon94 = {
		Id = 5031509896,
		Name = "Gaomon94",
		Health = 1000,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Superball",
		EffectAnimation = "TixStackSelf",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5 },
		Effect = {
			Name = "JUST SCRIPT IT",
			Description = "Whenever this card gains a lock: It gains 200 power.",
			Type = "OnLockIncrease",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "Retired ROBLOX Community forum poster. If you upset him, he'll say, 'Knock it off' before you're done for."
	},
	bh_DeathETM = {
		Id = 4942878679,
		Name = "DeathETM",
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
	bh_Brunito = {
		Id = 10280934087,
		Name = "Brunito",
		Health = 200,
		Power = 800,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Uptown Funk",
			Description = "When this card is cast: All players gain 600 life.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -600 },
				{ "Inflict", -600, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "He will gently poke you."
	},
	["bot_Assist Trophy"] = {
		Id = 10184147479,
		Name = "Assist Trophy",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "A target fighter gains 500 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 500 } },
			Target = "SingleAlly"
		},
		Bio = "\"I need no assistance. I am victory! - Alex\""
	},
	["bot_xxdemonninjaxx's Aid: Recovery"] = {
		Id = 140140009795251,
		Name = "*substitute* heh, missed me.",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectAnimation = "SmokescreenAlly",
		Effect = {
			Name = "Reincarnation",
			Description = "Return a target allied fighter to your hand. Set its cost to Free.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return" },
						{
							"SetCost",
							{ 0, "Neutral" }
						}
					},
					Target = "SingleAlly"
				}
			},
			RemoveOtherColors = true
		},
		Bio = "Ninja tactics do not serve to harm others, but to efficiently complement the objective. You can use this to reuse a fighter's useful ability if need be."
	},
	["bot_Baby Noob"] = {
		Id = 6801082499,
		Name = "Baby Noob",
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 1,
		Effect = {
			Name = "Assimilate",
			Description = "Once each turn, whenever an allied fighter dies: You lose 200 life.",
			Ability = {
				OnAllyDeath = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Cost", 200 },
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
		Bio = "A cute lil' noob. Awww..."
	},
	["bot_Noob Gunner"] = {
		Id = 6858731404,
		Name = "Noob Gunner",
		Health = 650,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "TimeBomb",
		Color = "Yellow",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Cost = { Neutral = 1, Yellow = 3 },
		Summonant = "bot_Noob",
		Effect = {
			Name = "N00BT00B",
			Description = "Whenever this card attacks: Summon a 400/50 Noob that's inert in all zones. Summon an additional Noob if that attack destroys a fighter.",
			Target = "Ally",
			Ability = {
				OnAttack = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAttackDestroy = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"I shudder to think about those meeboid rats being fired out that cannon.\" -Dukran the Elysian"
	},
	bot_Noob = {
		Id = 4899422795,
		Name = "RocketNoob's Noob",
		Health = 400,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Archetype = "Noob",
		Token = true,
		Cost = { Yellow = 1 },
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
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
	bot_Miked = {
		Id = 4204439814,
		Name = "miked",
		Health = 200,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Paintball",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Effect = {
			Name = "Roller Coaster",
			Description = "When this card is cast: All allied fighters gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Ally"
		},
		Bio = "Made thirteen years ago, miked's Ultimate Paintball still puts Loleris to shame."
	},
	["bot_Bling Noob"] = {
		Id = 6858730974,
		Name = "Noob Golem",
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		ChargeRequirement = { "Playertable", "Me", 50, 999999999999999, "Lifeloss" },
		AttackEffect = "Punch",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Oof",
			Description = "This card has haste if you've lost life since your last end step.",
			Type = "Nill",
			Power = "Yellow",
			Target = "Ally",
			Increase = 0
		},
		Bio = "I feel like I must put you in your place, Newbie."
	},
	bot_Coeptus = {
		Id = 6801090607,
		Name = "Coeptus",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "During your end step, if effects have made you lose life since your last end step: Allied Noobs gain 100 health and power.",
			Type = "OnEnd",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			EffectRequirement = { "Playertable", "Me", 50, 999999999999999, "EffectLifeLoss" },
			Target = "AlliedArchetype"
		},
		Bio = "Even noobs can make it eventually."
	},
	["bot_Training Dummy"] = {
		Id = 8449748530,
		Name = "thebenster",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		EffectVariable = 1,
		Effect = {
			Name = "Capture",
			Description = "Once each turn, whenever you lose life: Search your deck for a Noob card.",
			Ability = {
				OnLifeLoss = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Noob" },
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
		Bio = "Where does he get all the cakes to feed this noob anyways?"
	},
	bot_Scrub = {
		Id = 6799880803,
		Name = "Scrub",
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Name = "Double Bleeding",
			Description = "Whenever you cast a fighter: All allied Noobs gain 50 Power. You lose 200 life.",
			Type = "OnAllySummon",
			Power = {
				{ "Cost", 200 },
				{ "Strengthen", 50, "AlliedArchetype" }
			},
			Target = "All"
		},
		Bio = "DURRRR U HAD TO USE GUNS 2 KILL ME NUB!"
	},
	bot_BrackioTops = {
		Id = 10445092830,
		Name = "BrackioTops",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Archetype = "Noob",
		SummonedAnimation = "NoobCall",
		SummonAnimation = "NoobCall",
		DeathAnimation = "NoobDeath",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Trout Slap",
			Description = "When this card is cast: summon a 400/150 Noob that's inert in all zones.\n During your end steps, if you've lost life this turn: Summon a 400/150 Noob that's inert in all zones.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Round7" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = { { "Summon", "Round7" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 50, 999999999999999, "Lifeloss" }
				}
			}
		},
		Bio = "The dampest of mayday-ers."
	},
	bot_Eldevin = {
		Id = 11865480703,
		Name = "Eldevin",
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
	bot_NPEY2 = {
		Id = 3410792030,
		Name = "Blockhead",
		Health = 200,
		Power = 400,
		Rarity = "Common",
		IsNPECard = true,
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "When this card dies: All players draw a card.",
			Type = "OnDeath",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "Draw", 1, "Opponent" }
			},
			Target = "Self"
		},
		Bio = ":>"
	},
	bot_NPEY3 = {
		Id = 5002451730,
		Name = "Builders Club Trainee",
		Health = 100,
		Power = 100,
		Rarity = "Common",
		IsNPECard = true,
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Summonant = "bot_NPEY3",
		CustomReminder = { ["Total Inertia"] = "Inert cards don't generate studs." },
		Effect = {
			Description = "When this card is cast: Summon a copy of it that's inert in all zones.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Self",
			MetaData = { TokenOmni = true }
		},
		Bio = "Huh? Why did they give this helmet ou-"
	},
	["Froot Ninja-T2"] = {
		Id = 6801095600,
		Name = "Froot Ninja",
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
			Description = "Whenever you cast a Ninja fighter: A target allied fighter gains 200 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 200, "Single" } },
			Target = "SingleAlly",
			Archetype = "Ninja"
		},
		Bio = "He tests his blades on watermelons and walnuts. That's practically familicide."
	},
	["BlazerC-T2"] = {
		Id = 6801083680,
		Name = "BlazerC",
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
			Description = "When this card is cast: All allied Ninja gain 300 power until the next end step.",
			Type = "OnSummon",
			Power = "TempStrengthen",
			Target = "AlliedArchetype",
			Increase = 300
		},
		Bio = "There really wasn't a huge market for chicken blazers as ovens and microwaves came into the market, so BlazerC became a ninja instead."
	},
	["Ninja-T2"] = {
		Id = 9964854787,
		Name = "Ninja",
		Health = 350,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Slash",
		Archetype = "Ninja",
		Color = "Red",
		Cost = { Neutral = 2 },
		SummonAnimation = "NinjaCall",
		DeathAnimation = "NinjaDeath",
		SpecialEffectAnimation = "NinjaCall",
		Effect = {
			Name = "Assimilate",
			Description = "Whenever you cast a Ninja: It gains 100 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 100 } },
			Target = "Aggressor",
			Archetype = "Ninja"
		},
		Bio = "Ninjas actually wore a dark-blue, not pure black. This prevented moonlight from exposing them."
	},
	["Ninja Elite-T2"] = {
		Id = 6858727860,
		Name = "Ninja Elite",
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
			Description = "When this card is cast: It deals 200 damage to a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "SingleEnemy", nil, nil, "KunaiThrow" } },
			Target = "NotArchetype"
		},
		Bio = "Ninjas were only ever around 5 feet tall. Any higher would make it hard to be maneuverable."
	},
	["Ninja Trainee-T2"] = {
		Id = 6858728551,
		Name = "Ninja Trainee",
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
	["Grandmaster's Ninja Dojo-T2"] = {
		Id = 4783049204,
		Name = "Grandmaster's Ninja Dojo",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Archetype = "Ninja",
		Terrain = true,
		CastOnStart = true,
		Terrariant = "Ninja Terrain",
		Field = 295562634,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you cast a Ninja fighter: Unlock it.\nOnce during each of your turns, whenever an enemy fighter dies: You may select an allied fighter. Return it to its hand.",
			Ability = {
				OnAllySummon = {
					Power = { { "Unlock", 9999, "Aggressor" } },
					Target = "Aggressor",
					Archetype = "Ninja"
				},
				OnEnemyDeath = {
					Power = { { "Return" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "RandomCard",
						Modifier = 1
					},
					TurnTriggerLimit = 1,
					EffectRequirement = { "MyTurn", "Me", 30, 303 }
				}
			}
		},
		Bio = "The apex of all Dojos, providing both adept acceleration of mental and physical skill."
	},
	["Ninja Assailant-T2"] = {
		Id = 9964855389,
		Name = "Ninja Assailant",
		Health = 100,
		Power = 300,
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
	["Ninja Combatant-T2"] = {
		Id = 6858743295,
		Name = "Ninja Combatant",
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
			Description = "When this card is cast: All allied Ninja gain 100 health and 200 power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 200 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "In order to protect the secrets of ninjutsu, families only passed down their knowledge to their children. They would begin teaching children skills at a young age by playing games."
	},
	["Snowskateer-T2"] = {
		Id = 6858737209,
		Name = "Snowskateer",
		Health = 250,
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
	["Ninja Ambush-T2"] = {
		Id = 6464466828,
		Name = "Ninja Ambush",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
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
	["One_Thousand_Deaths-T2"] = {
		Id = 10217675987,
		Name = "\"One Thousand Deaths\"",
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
	["WhiteScarf-T"] = {
		Id = 6854804074,
		Name = "WhiteScarf",
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
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: Unlock this card.",
			Type = "OnAllyStart",
			Power = { { "Unlock", 9999 } },
			Target = "Self"
		},
		Bio = "It's a JUXTAPOSITION, CAROL. DO YOU NOT GET IT?"
	},
	["NinjaBluz-T"] = {
		Id = 6858730410,
		Name = "NinjaBluz",
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
	["NPER3-T"] = {
		Id = 3410969294,
		Name = "Black Hat Hacker",
		CopyBodge = "TR3",
		Health = 200,
		Power = 200,
		Rarity = "Common",
		IsNPECard = true,
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Description = "Whenever this card attacks: It deals 200 damage to a target enemy fighter.",
			Type = "OnAttack",
			Power = { { "Damage", 200 } },
			Target = "SingleEnemy"
		},
		Bio = "You forgot to add FilteringEnabled, nerd."
	},
	["NPEB3-T"] = {
		Id = 3410793874,
		Name = "White Hat Hacker",
		CopyBodge = "TB3",
		Health = 200,
		Power = 300,
		Rarity = "Common",
		IsNPECard = true,
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Description = "Whenever this card attacks: Lock a target enemy fighter for 1 turn.",
			Type = "OnAttack",
			Power = { { "Lock", 1 } },
			Target = "SingleEnemy"
		},
		Bio = "Like a bandit that locks up your house for you."
	},
	["DairingPoopHead-Race"] = {
		Id = 6608829930,
		Name = "Dairingpoophead",
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
		Bio = "You just dared him. Prepare for brown dairy."
	},
	["Paraselene Starsleuth-Race"] = {
		Id = 13293060061,
		Name = "Paraselene Starsleuth",
		Health = 650,
		Power = 650,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 6 },
		Moonward = true,
		Dextrous = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Null = {
					Power = { { "Draw", 0, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"We've had reports of a powerful reanimation formula being circulated around a backwater called Bloxburg. Get in there, assess an appropriate threat response, then get out.\" <br/>- Lua, Paraselene Evincar"
	},
	["Eternal Justice Mk.2-Race"] = {
		Id = 13293024986,
		Name = "Eternal Justice Mk.2",
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Lock a target enemy fighter for 1 turn. Then seance a card in your graveyard that was cast this game.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Lock", 1, "SingleEnemy" },
						{
							"MoveZone",
							{ "200OrLower_WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						}
					},
					Target = "Self",
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
		Bio = "Apollo's orders to not shoot the invading Lordbreakers fell on deaf ears."
	},
	["DeadZoneHark-Race"] = {
		Id = 8657846253,
		Name = "DeadZoneHark",
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
	["Pizzablawk-Race"] = {
		Id = 3526494843,
		Name = "Pizzablawk",
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
	["Voidsealer-Race"] = {
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
	["Gaomon94-Race"] = {
		Id = 5031509896,
		Name = "Gaomon94",
		Health = 1000,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Superball",
		EffectAnimation = "TixStackSelf",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5 },
		Effect = {
			Name = "JUST SCRIPT IT",
			Description = "Whenever this card gains a lock: It gains 200 power.",
			Type = "OnLockIncrease",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "Retired ROBLOX Community forum poster. If you upset him, he'll say, 'Knock it off' before you're done for."
	},
	["SquidShock-Race"] = {
		Id = 6854749640,
		Name = "SquidShock",
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
	["Razikai-Race"] = {
		Id = 4800946348,
		Name = "Razikai",
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Description = "When this card dies: Summon a clone of it without this effect.",
			Type = "OnDeath",
			Power = { { "Summon", "Razikai Token 1-Race" } },
			Target = "Ally"
		},
		Bio = "Rainbow science helps me defy death!"
	},
	["Razikai Token 1-Race"] = {
		Id = 4800943511,
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
	["Nopants99-Race"] = {
		Id = 7274996857,
		Name = "Nopants99",
		Health = 1100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 2 },
		TransformImmune = true,
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "Whenever an enemy fighter is cast: Unlock it.",
			Type = "OnEnemySummon",
			Power = { { "Unlock", 9999 } },
			Target = "Aggressor"
		},
		Bio = "Pants are for the weaklings. Trousers are used by true gentlemen."
	},
	["ImaUMBREON-Race"] = {
		Id = 15706306310,
		Name = "mothcwiningen",
		Health = 300,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Dextrous = true,
		Effect = {
			Name = "Dark Strike",
			Description = "",
			Type = "Null",
			Power = { { "Weaken", 150 } },
			Target = "SingleEnemy"
		},
		Bio = "Don't make her dual cast. Seriously don't. It looks ridiculous."
	},
	["SharpTH-Race"] = {
		Id = 10280543780,
		Name = "SharpTH",
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
	["Imaginaerum-Race"] = {
		Id = 6391875533,
		Name = "Imaginaerum",
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
	["Mlgloga-Race"] = {
		Id = 10280796315,
		Name = "Mlgloga",
		Health = 900,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Lock it for 6 turns.",
			Type = "OnSummon",
			Power = { { "Lock", 6 } },
			Target = "Self"
		},
		Bio = "Mlg Strats are to be abound."
	},
	["Sylrath-Race"] = {
		Id = 8938593775,
		Name = "Sylrath",
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
	CoolerAction = {
		Id = 4783088354,
		Name = "Threatening Aura",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Description = "All allied fighters in all zones gain Overload, Dextrous and Immunity to Lock effects.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ChangeMusicSpeed", 0.8, "Ally" },
						{ "GivePassive", "Overload", "CustomTarget" },
						{ "GivePassive", "Dextrous", "CustomTarget" },
						{ "GivePassive", "LockImmune", "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = {
							"Ally_Deck",
							"Ally_Hand",
							"Ally_Field",
							"Ally_GenZone",
							"Ally_GraveZone"
						},
						Condition = "Fighter"
					}
				}
			}
		},
		Bio = ""
	},
	["Cooler-Stevenl15"] = {
		Id = 17791738318,
		Name = "Stevenl15",
		Health = 300,
		Power = 200,
		Rarity = "Token",
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
	["Cooler-Fluffle"] = {
		Id = 10280953751,
		Name = "Fluffle",
		Health = 800,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Untradeable = true,
		PackDisplayOverride = "Card Quests",
		LockImmune = true,
		Cost = { Blue = 6 },
		Effect = {
			Name = "Teamwork",
			Description = "Whenever an effect locks this card: Unlock it.",
			Type = "OnEffectLock",
			Power = { { "Unlock", 9999 } },
			Target = "Self"
		},
		Bio = "I want to chew through electric wire."
	},
	["Cooler-SuperCloud9"] = {
		Id = 10281194713,
		Name = "SupernalNine",
		Health = 500,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 6 },
		EffectAnimation = "SlatePotion",
		Effect = {
			Name = "Inflation",
			Description = "When this card is cast: Unlock a target fighter, then lock it for 2 turns. It gains 1000 health.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 2 },
				{ "Heal", 1000 }
			},
			Target = "Single"
		},
		Bio = "Is a killer always heartless?"
	},
	["Cooler-Bloxy Tea Party"] = {
		Id = 10184237613,
		Name = "Bloxy Tea Party",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectAnimation = "BloxyAll",
		Effect = {
			Name = "Refreshments",
			Description = "All fighters gain 350 health and power. Lock them for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 350 },
				{ "Strengthen", 350 },
				{ "Lock", 1 }
			},
			Target = "All"
		},
		Bio = "Lets just sit down and have a blast, friend or foe regardless!"
	},
	["Cooler-HuntarioRBLX"] = {
		Id = 4899352446,
		Name = "HuntarioRBLX",
		Health = 800,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2 },
		Charge = true,
		Effect = {
			Name = "Sugar and Ice",
			Description = "When this card attacks: It gains 200 power.",
			Type = "OnAttack",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "An eye for an eye. A feather for a... Wait, humans don't have feathers. That analogy just went nowhere..."
	},
	["Cooler-KrocoStar"] = {
		Id = 10280519886,
		Name = "Krocostar",
		Health = 1500,
		Power = 750,
		Rarity = "Token",
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
	["DS2Umwelt Shift"] = {
		Id = 13381770746,
		Name = "Umwelt Shift",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "DemonLordScratch",
		Color = "Blue",
		Archetype = "Vagabond",
		Cost = { Neutral = 1, Red = 2, Blue = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Give yourself 3 Choice cards—\n🅐 If your baseplate rank is 6 or greater, a target allied fighter and its soulmate each gain 200 Health and Power, then swap their stats.\n🅑 if your baseplate rank is 6 or greater, return a target allied fighter to its hand. Deal 200 damage to all fighters.\n🅒 If your baseplate rank is 8 or greater, choose a target allied Vagabond. Summon its soulmate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "DS2Pangu's Counsel" },
						{ "Add", "DS2Chiyou's Counsel" },
						{ "Add", "DS2Syncretic Counsel" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Internal conflict is a lot more literal for those who hold a Rageborne inside them."
	},
	["DS2Pangu's Counsel"] = {
		Id = 13396894527,
		Name = "Pangu's Counsel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "DemonLordScratch",
		Color = "Blue",
		Archetype = "Crystal",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Rank = 6,
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter and its soulmate each gain 200 Health and Power, then swap their stats.\nDestroy all choice cards in your hand. ",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 },
						{ "Swap", 9999999 },
						{
							"AlterEV",
							{ "SetSoulbound", "Target", "Soulmate", "Nil" }
						},
						{ "Strengthen", 200, "CustomTarget" },
						{ "Heal", 200, "CustomTarget" },
						{ "Swap", 9999999, "CustomTarget" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "SoulmateField"
					},
					Target = "Single"
				}
			}
		},
		Bio = "Si vis pacem."
	},
	["DS2Chiyou's Counsel"] = {
		Id = 13396895531,
		Name = "Chiyou's Counsel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "DemonLordScratch",
		Color = "Red",
		Rank = 6,
		Archetype = "Crystal",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Return a target allied fighter to its hand.\nDeal 200 damage to all fighters.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return", 30, "SingleAlly" },
						{ "Damage", 200 },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "All"
				}
			}
		},
		Bio = "Parabellum."
	},
	["DS2Syncretic Counsel"] = {
		Id = 13396899875,
		Name = "Syncretic Counsel",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "DemonLordScratch",
		Color = "Neutral",
		Rank = 8,
		Archetype = "Crystal",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Summon the Soulmates of all allied Vagabonds.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "MultiSelectOperation", "SummonBonds", "CustomTarget" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "Archetype",
						Modifier = "Vagabond",
						SubModifier = true
					}
				},
				MultiSelectOperationSummonBonds = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Soulmate", "Soulmate" }
						},
						{ "Summon", "Variable", "Ally" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "There can be no peace without prior conflict, whether it be nations or oneself."
	},
	["DS2Extruded Gentleman"] = {
		Id = 13381659435,
		Name = "Extruded Gentleman",
		Health = 400,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Vagabond",
		Soulbound = "DS2Extruded Lady",
		Cost = { Neutral = 3 },
		TriggerInGenZone = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select an unranked card in your hand. Put a copy of it into your baseplate, except it's inert there.\nWhenever you cast this card's Soulmate: It gains 100 Health. This ability also triggers in the baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{
							"NotIndexOrDS2Yang-Chiyou, Sword of Cothran_Vagabond_Fighter",
							"Hand_Ally",
							"GenZone_Ally",
							true,
							true
						},
						"Self",
						nil,
						nil,
						nil,
						"VagabondCothGlint"
					} },
					Target = "Ally",
					MetaData = { TokenGenZone = true }
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondRageSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" },
					DontTriggerInGenZone = true
				},
				OnAnyAllyCast = {
					Power = { { "Heal", 100, nil, nil, nil, "VagabondSoulmateGlint" } },
					Target = "Aggressor",
					LibraryIndex = "DS2Extruded Lady"
				}
			}
		},
		Bio = "He was her vassal, a seed from which grew her tree."
	},
	["DS2Extruded Lady"] = {
		Id = 13381660981,
		Name = "Extruded Lady",
		Health = 200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Vagabond",
		Soulbound = "DS2Extruded Gentleman",
		Cost = { Neutral = 3 },
		TriggerInGenZone = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select an unranked card in your hand. Put a copy of it into your baseplate, except it's inert there.\nWhenever you cast this card's soulmate: It gains 100 Power. This ability also triggers in the baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{
							"NotIndexOrDS2Yang-Chiyou, Sword of Cothran_Vagabond_Fighter",
							"Hand_Ally",
							"GenZone_Ally",
							true,
							true
						},
						"Self",
						nil,
						nil,
						nil,
						"VagabondRageGlint"
					} },
					Target = "Ally",
					MetaData = { TokenGenZone = true }
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondRageSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" },
					DontTriggerInGenZone = true
				},
				OnAnyAllyCast = {
					Power = { { "Strengthen", 100, nil, nil, nil, "VagabondSoulmateGlint" } },
					Target = "Aggressor",
					LibraryIndex = "DS2Extruded Gentleman"
				}
			}
		},
		Bio = "She was his sire, a tree which sheltered him from the sun."
	},
	["DS2Range Rider"] = {
		Id = 13381666658,
		Name = "Range Rider",
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Revolver",
		Color = "Blue",
		Archetype = "Vagabond",
		Soulbound = "Range Rager",
		Cost = { Red = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: Search your deck for an action card. This card's soulmate gains 200 Health.",
			Ability = {
				OnAttack = {
					Power = {
						{ "RandomTutorfor", "Action", nil, nil, nil, "VagabondCothGlint" },
						{ "Heal", 200, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "SoulmateField"
					}
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondCothSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "He was always a wanderer. Having a friend at hand wouldn't be bad company."
	},
	["DS2Range Rager"] = {
		Id = 13381668002,
		Name = "Rage Rider",
		Health = 400,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Revolver",
		EffectAnimation = "MidMagicRedEffect",
		Color = "Red",
		Archetype = "Vagabond",
		Soulbound = "DS2Range Rider",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast an action: A target enemy fighter loses 200 Power. This card's soulmate gains 200 Power.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Weaken", 200, "SingleEnemy", nil, nil, "VagabondRageGlint" },
						{ "Strengthen", 200, "CustomTarget" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "SoulmateField"
					},
					TurnTriggerLimit = 1
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondRageSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "Justice brings comfort to the innocent and fear to the guilty."
	},
	["DS2Soulless Slayer"] = {
		Id = 13381663030,
		Name = "Soulless Slayer",
		Health = 100,
		Power = 1200,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Vagabond",
		Soulbound = "DS2Sleepless Steward",
		Cost = { Blue = 3, Red = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: If its soulmate is in your baseplate, summon a copy of it.\nAt the start of your turns: Draw a card. Your opponent loses 500 life.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "DS2Sleepless Steward", "GenZone_Ally", "Field_Ally", true, true },
						"Self"
					} },
					Target = "Ally"
				},
				OnAllyStart = {
					Power = {
						{ "Draw", 1, "Ally", nil, nil, "VagabondCothGlint" },
						{ "Inflict", 500, "Opponent" }
					},
					Target = "Opponent"
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondCothSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "Not every vassal is a good person."
	},
	["DS2Sleepless Steward"] = {
		Id = 13381664496,
		Name = "Sleepless Steward",
		Health = 1200,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Shield = true,
		Archetype = "Vagabond",
		Soulbound = "DS2Soulless Slayer",
		Cost = { Blue = 4, Red = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if its soulmate is in your baseplate: summon a copy of it.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "DS2Soulless Slayer", "GenZone_Ally", "Field_Ally", true, true },
						"Self"
					} },
					Target = "Ally"
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondRageSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "...yet not every Rageborne is a complacent one."
	},
	["DS2Cothrite Shepherd"] = {
		Id = 13381669831,
		Name = "Cothrite Shepherd",
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Tempest",
		Color = "Blue",
		Archetype = "Vagabond",
		Soulbound = "DS2Hazenwyld Shepherd",
		Cost = { Red = 2, Neutral = 1, Blue = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast this card or its soulmate: Deal 150 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 150, nil, nil, nil, "VagabondCothGlint" } },
					Target = "SingleEnemy"
				},
				OnAnyAllyCast = {
					Power = { { "Damage", 150, nil, nil, nil, "VagabondSoulmateGlint" } },
					Target = "SingleEnemy",
					LibraryIndex = "DS2Hazenwyld Shepherd"
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondCothSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" },
					DontTriggerInGraveZone = true
				}
			}
		},
		Bio = "To comfort the dead is a noble cause."
	},
	["DS2Hazenwyld Shepherd"] = {
		Id = 13381671034,
		Name = "Hazenwyld Shepherd",
		Health = 200,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Storm",
		Color = "Red",
		Archetype = "Vagabond",
		Soulbound = "DS2Cothrite Shepherd",
		Cost = { Red = 1, Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast this card or its soulmate: Lock a target enemy fighter for 1 turn.",
			Ability = {
				OnSummon = {
					Power = { { "Lock", 1, nil, nil, nil, "VagabondRageGlint" } },
					Target = "SingleEnemy"
				},
				OnAnyAllyCast = {
					Power = { { "Lock", 1, nil, nil, nil, "VagabondSoulmateGlint" } },
					Target = "SingleEnemy",
					LibraryIndex = "DS2Cothrite Shepherd"
				},
				OnAllyDiscard = {
					Power = { { "Tutorfor", "Soulmate", nil, nil, nil, "VagabondRageSearch" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" },
					DontTriggerInGraveZone = true
				}
			}
		},
		Bio = "To ease the living is a just cause."
	},
	["DS2Absentee Father"] = {
		Id = 79791740608828,
		Name = "Absentee Father",
		Health = 100,
		Power = 950,
		Rarity = "Token",
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
									"Regenerating Mod",
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
	WaveProgress = {
		Id = 95942161633456,
		Name = "Next Wave!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		Stealth = true,
		Effect = {
			Description = "Summon the next wave of fighters!",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonNewWave" },
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Modulo", "Math", 5, "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "GiveTreasurePack" },
							"Self"
						}
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassGiveTreasurePack = {
					Power = { { "Add", "WavePack-Treasure", "Opponent" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckFailGiveTreasurePack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 10, "CheckForBossPack" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassGiveBossPack = {
					Power = { { "Add", "WavePack-Boss", "Opponent" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassCheckForBossPack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Modulo", "Math", 10, "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 1, "GiveBossPack" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFailGiveBossPack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "FloorModHeroesJourney", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "GiveNormalPack" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFailCheckForBossPack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "FloorModHeroesJourney", "Nil" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ 0, "GiveNormalPack" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFailGiveNormalPack = {
					Power = { { "Add", "WavePack-Hero", "Opponent" } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPassGiveNormalPack = {
					Power = { { "Add", "WavePack", "Opponent" } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	WavePack = {
		Id = 121854895779732,
		Name = "Crowd's Excitement",
		AltCards = {
			["WavePack-Treasure"] = {
				Effect = {
					Description = "Cast automatically at the start of your turn. Select 1 out of 3 Lesser Treasures to shuffle into your deck.",
					Ability = {
						OnAllyStart = {
							Power = { {
								"ForceCast",
								{ "Self" },
								"Ally"
							} },
							Target = "Ally"
						},
						OnSummon = {
							Power = {
								{
									"CreateChoices",
									{
										"CT_LesserTreasure_1",
										"CT_LesserTreasure_3",
										"CT_LesserTreasure_4",
										"CT_LesserTreasure_5",
										"CT_LesserTreasure_6",
										"CT_LesserTreasure_7",
										"CT_LesserTreasure_8",
										"CT_LesserTreasure_9",
										"CT_LesserTreasure_11",
										"CT_LesserTreasure_12",
										"CT_LesserTreasure_13",
										"CT_LesserTreasure_14",
										"CT_LesserTreasure_16"
									}
								},
								{
									"MoveZone",
									{ "EffectTarget", "ChoiceZone_Ally", "Deck_Ally", true, false },
									"CustomZoneTarget"
								}
							},
							Target = "Ally",
							ZoneTargetParameters = {
								Zones = { "Ally_ChoiceZone" },
								Condition = {},
								SelectionDescription = "A Lesser Treasure to shuffle into your deck",
								MinTargets = 1,
								MaxTargets = 1
							}
						}
					},
					AmountOfTargets = 3
				}
			},
			["WavePack-Boss"] = {
				Effect = {
					Description = "Cast automatically at the start of your turn. Select to either buff allied fighters when cast or shuffle three treasures into your deck.",
					Ability = {
						OnAllyStart = {
							Power = { {
								"ForceCast",
								{ "Self" },
								"Ally"
							} },
							Target = "Ally"
						},
						OnSummon = {
							Power = {
								{
									"CreateChoices",
									{ "FloorBonusBuff", "FloorBonusTreasure" }
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
							Target = "Self",
							ZoneTargetParameters = {
								Zones = { "Ally_ChoiceZone" },
								Condition = {},
								SelectionDescription = "A buff to use",
								MinTargets = 1,
								MaxTargets = 1
							}
						}
					},
					CreateAllAsChoices = true
				}
			},
			["WavePack-Hero"] = {
				Effect = {
					Description = "Cast automatically at the start of your turn. Select 2 to 4 out of 10 rare cards to shuffle into your deck.",
					Ability = {
						OnAllyStart = {
							Power = { {
								"ForceCast",
								{ "Self" },
								"Ally"
							} },
							Target = "Ally"
						},
						OnSummon = {
							Power = {
								{ "CreateChoices", "Rare HasntPassiveorCantAICast" },
								{
									"MoveZone",
									{ "EffectTarget", "ChoiceZone_Ally", "Deck_Ally", true, false },
									"CustomZoneTarget"
								}
							},
							Target = "Ally",
							ZoneTargetParameters = {
								Zones = { "Ally_ChoiceZone" },
								Condition = {},
								SelectionDescription = "2 to 4 cards to shuffle into your deck",
								MinTargets = 2,
								MaxTargets = 4
							}
						}
					},
					AmountOfTargets = 10
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		Stealth = true,
		TokenOmni = true,
		TriggerInHand = true,
		Effect = {
			Description = "Cast automatically at the start of your turn. Select 2 to 4 out of 10 cards to shuffle into your deck.",
			Ability = {
				OnAllyStart = {
					Power = { {
						"ForceCast",
						{ "Self" },
						"Ally"
					} },
					Target = "Ally"
				},
				OnSummon = {
					Power = {
						{ "CreateChoices", "Any HasntPassiveorCantAICast" },
						{
							"MoveZone",
							{ "EffectTarget", "ChoiceZone_Ally", "Deck_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						SelectionDescription = "2 to 4 cards to shuffle into your deck",
						MinTargets = 2,
						MaxTargets = 4
					}
				}
			},
			AmountOfTargets = 10
		},
		Bio = ""
	},
	FloorBonusBuff = {
		Id = 16932158707,
		Name = "Level Up!",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Put this card into your baseplate. Whenever you cast a fighter: it gains 300 health and power.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "FloorBonusBuff", 1 }
					} },
					Target = "Ally"
				},
				OnAllySummon = {
					Power = {
						{ "Strengthen", 300 },
						{ "Heal", 300 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	FloorBonusTreasure = {
		Id = 14308567629,
		Name = "Box o' Treasures",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		Effect = {
			Description = "Shuffle 3 Treasures into your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomDeckAdd",
							{
								"CT_Treasure_1",
								"CT_Treasure_4",
								"CT_Treasure_6",
								"CT_Treasure_7",
								"CT_Treasure_8",
								"CT_Treasure_9"
							}
						},
						{
							"RandomDeckAdd",
							{
								"CT_Treasure_1",
								"CT_Treasure_4",
								"CT_Treasure_6",
								"CT_Treasure_7",
								"CT_Treasure_8",
								"CT_Treasure_9"
							}
						},
						{
							"RandomDeckAdd",
							{
								"CT_Treasure_1",
								"CT_Treasure_4",
								"CT_Treasure_6",
								"CT_Treasure_7",
								"CT_Treasure_8",
								"CT_Treasure_9"
							}
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	FloorModVampirism = {
		Id = 114447520211223,
		Name = "Modifier: Vampirism",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "The player loses 200 life during their end steps. Whenever they destroy an enemy fighter: They gain 100 life.",
			Ability = {
				OnEnemyEnd = {
					Power = { { "Inflict", 200 } },
					Target = "Opponent"
				},
				OnAllyDeath = {
					Power = { { "Inflict", -100 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	FloorModPoisonous = {
		Id = 103826387015139,
		Name = "Modifier: Poisonous Grounds",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "During each player's end step: Their fighters lose 50 health and power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Damage", 50 },
						{ "Weaken", 50 }
					},
					Target = "Ally"
				},
				OnEnemyEnd = {
					Power = {
						{ "Damage", 50 },
						{ "Weaken", 50 }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	FloorModGlass = {
		Id = 86808167205049,
		Name = "Modifier: Glass Blades",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a fighter: Double its power and Halve its health.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyPower", 2 },
						{ "MultiplyHealth", 0.5 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	FloorModWreckingBall = {
		Id = 114798213600450,
		Name = "Modifier: Wrecking Ball",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "All fighters have Overload and Regenerating.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "GivePassive", "Overload" },
						{ "GivePassive", "Regen" }
					},
					Target = "All",
					KeepSameTargets = true,
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	FloorModTougherGuys = {
		Id = 89345694207680,
		Name = "Modifier: Tougher Guys",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Enemy waves are stronger.",
			Ability = {
				Nil = {
					Power = {
						{ "EquipGear", "Overloaded Mod" },
						{ "EquipGear", "Regenerating Mod" }
					},
					Target = "Aggressor",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = ""
	},
	FloorModHeroesJourney = {
		Id = 126353664343932,
		Name = "Modifier: Hero's Journey",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Crowd's Excitement will only offer Rare cards.",
			Ability = {
				Nil = {
					Power = {
						{ "EquipGear", "Overloaded Mod" },
						{ "EquipGear", "Regenerating Mod" }
					},
					Target = "Aggressor",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = ""
	},
	FloorModChairman = {
		Id = 91513502894431,
		Name = "Modifier: Mysterious Benefactor",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "A Mysterious Benefactor may spawn.",
			Ability = {
				Nil = {
					Power = {
						{ "EquipGear", "Overloaded Mod" },
						{ "EquipGear", "Regenerating Mod" }
					},
					Target = "Aggressor",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasGear",
						Modifier = false
					}
				}
			}
		},
		Bio = ""
	},
	FloorChairman = {
		Id = 14560520399,
		Name = "The Chairman",
		Health = 1250,
		Power = 1250,
		Rarity = "Token",
		AttackEffect = "VampBite",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Archetype = "Gladiator",
		Rank = 5,
		AddBlock = true,
		DamageImmune = true,
		DestroyImmune = true,
		Gladiator = true,
		Dextrous = true,
		SummonAnimation = "ChairmanSummon",
		SummonedAnimation = "ChairmanSummon",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: give your opponent a Treasure.",
			Ability = {
				OnDeath = {
					Power = { { "RandomAdd", "Treasure", "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "Primordial hunger has never looked so dapper. Be thankful."
	},
	FloorModStudmasterBand = {
		Id = 111536477613451,
		Name = "Modifier: Studmaster's Band",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of the player's turns: They gain {W}{R}{G}{B}{Y} and draw a card. If they haven't cast at least 2 unique card types by the end of their turn: Allied fighters gain 50 health and power for each wave.",
			Ability = {
				OnEnemyStart = {
					Power = {
						{ "Red", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 },
						{ "Green", 1 },
						{ "Neutral", 1 },
						{ "Draw", 1 }
					},
					Target = "Opponent"
				},
				OnAllyStart = {
					Power = {
						{ "EVGreaterValueCheck", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				},
				OnEnemySummon = {
					Power = { {
						"AlterEV",
						{ "Add", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					NoBlip = true
				},
				OnEnemyCast = {
					Power = { {
						"AlterEV",
						{ "Add", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					NoBlip = true
				},
				OnEnemyCastGear = {
					Power = { {
						"AlterEV",
						{ "Add", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					NoBlip = true
				},
				OnEnemyTerrainCast = {
					Power = { {
						"AlterEV",
						{ "Add", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					TurnTriggerLimit = 1,
					NoBlip = true
				}
			}
		},
		Bio = ""
	},
	FloorModOverexertion = {
		Id = 108848455319241,
		Name = "Modifier: Overexertion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of the player's turns: Shuffle 2 Misfortunes into their deck.\nWhenever the player casts a card: Shuffle a copy of it into their deck.",
			Ability = {
				OnAnyEnemyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "DeckAdd", "Variable", "Opponent" }
					},
					Target = "Aggressor"
				},
				OnEnemyStart = {
					Power = {
						{
							"RandomDeckAdd",
							{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" },
							"Opponent"
						},
						{
							"RandomDeckAdd",
							{ "CT_Bad_1", "CT_Bad_2", "CT_Bad_3" },
							"Opponent"
						}
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	FloorModMerchant = {
		Id = 115445777659565,
		Name = "Modifier: Mystery Merchant",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever an allied fighter dies: There is a chance to give the player a Money stack.\n A mysterious merchant may appear.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 10 },
							"Self"
						},
						{ "EVGreaterValueCheck", 9 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"RandomAdd",
						{ "Tix Stack", "Targeting Blip" }
					} },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	FloorMerchant = {
		Id = 9362071521,
		Name = "The Merchant",
		Health = 10000,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "VampBite",
		Color = "Green",
		Cost = { Neutral = 6 },
		AddBlock = true,
		DamageImmune = true,
		DestroyImmune = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a Money Stack targets this card: Select 1 out of 3 Lesser Treasures to shuffle into your deck.\nObliterate this card at the end of the player's turn.",
			Ability = {
				OnTarget = {
					Power = {
						{
							"CreateChoices",
							{
								"CT_LesserTreasure_1",
								"CT_LesserTreasure_3",
								"CT_LesserTreasure_4",
								"CT_LesserTreasure_5",
								"CT_LesserTreasure_6",
								"CT_LesserTreasure_7",
								"CT_LesserTreasure_8",
								"CT_LesserTreasure_9",
								"CT_LesserTreasure_11",
								"CT_LesserTreasure_12",
								"CT_LesserTreasure_13",
								"CT_LesserTreasure_14",
								"CT_LesserTreasure_16"
							}
						},
						{
							"MoveZone",
							{ "EffectTarget", "ChoiceZone_Ally", "Deck_Opponent", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_ChoiceZone" },
						Condition = {},
						SelectionDescription = "A Lesser Treasure to shuffle into your deck",
						MinTargets = 1,
						MaxTargets = 1
					},
					Archetype = "Money"
				},
				OnEnemyEnd = {
					Power = { { "Obliterate" } },
					Target = "Self"
				}
			},
			OpponentTarget = true,
			AmountOfTargets = 3
		},
		Bio = "What're ya buying?"
	},
	FloorModWatched = {
		Id = 77145041618599,
		Name = "Modifier: Watched",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your turns: There is a chance the player becomes watched.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 10 },
							"Self"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Add", "FloorWatched" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	FloorWatched = {
		Id = 14017071151,
		Name = "Watched",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenOmni = true,
		Undiscardable = true,
		TriggerInHand = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Description = "The Killer may appear during your end step while this card is in your hand.",
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
							{ "AddRandomNumber", "Math", 0, 10 },
							"Self"
						},
						{ "EVGreaterValueCheck", 8 }
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Board", "Opponent", 0, 1, "BoardContainsIndex_FloorKiller" }
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "FloorKiller" },
						{ "Unlock", 9999, "SummonedCard" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "You feel like you are being watched."
	},
	FloorKiller = {
		Id = 14368358122,
		Name = "The Killer",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Katana",
		DiscardBlock = true,
		Color = "Red",
		Cost = { Red = 0 },
		SummonAnimation = "ThecSummon",
		SummonedAnimation = "ThecSummon",
		SummonAnimationEffect = true,
		PreloadAssets = {
			"rbxassetid://13623357066",
			"rbxassetid://13613038354",
			"rbxassetid://13613222363"
		},
		Effect = {
			Name = "Render",
			Description = "When this card attacks: Obliterate a non-token card in the opponent's hand, deck, graveyard and baseplate.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Self",
					TotalTriggerLimit = 1,
					NoBlip = true
				},
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "NotToken", "Deck_Opponent", "Nil", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "NotToken", "Hand_Opponent", "Nil", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "NotToken", "GraveZone_Opponent", "Nil", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "NotToken", "GenZone_Opponent", "Nil", true, false },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Hello!"
	},
	FloorModFanClub = {
		Id = 77863647681647,
		Name = "Modifier: Personal Fanclub",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of your turns: There is a chance for the player to become Watched.\nWhenever an allied fighter dies: There is a chance to give the player a Money stack\n A mysterious merchant or benefactor may appear.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 10 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 5, "GiveWatched" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 10 },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 8, "GiveMoney" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassGiveMoney = {
					Power = { {
						"RandomAdd",
						{ "Tix Stack", "Targeting Blip" }
					} },
					Target = "Opponent"
				},
				OnEVCheckPassGiveWatched = {
					Power = { { "Add", "FloorWatched" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	FloorGodbeast = {
		Id = 3557003289,
		Name = "Demonic Godbeast",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		OmniImmune = true,
		Color = "Neutral",
		Cost = { Neutral = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Set the stats of all fighters with total stats over 20,000 to 350/350.",
			Ability = {
				OnEnd = {
					Power = {
						{ "SetHealth", 350 },
						{ "SetPower", 350 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "GreaterTotalStats",
						Modifier = 20000
					},
					KeepSameTargets = true
				}
			}
		},
		Bio = "Conjurer Bebee2's Master rule: Only summon what you can dismiss."
	},
	FloorGladiatorR = {
		Id = 7205023088,
		Name = "Ren, Champion of Domination",
		Health = 1500,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Punch",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Red",
		Cost = { Red = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a card or attacks: Deal 50 damage to all enemy fighters. Destroy the bottom card of their deck.",
			Ability = {
				OnAnyEnemyCast = {
					Power = {
						{ "Damage", 50 },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						}
					},
					Target = "Opponent"
				},
				OnEnemyAttack = {
					Power = {
						{ "Damage", 50 },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
							"Self"
						}
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "\"Mine is the path of pain and victory!\""
	},
	FloorGladiatorG = {
		Id = 10221505907,
		Name = "Gaius, Champion of Vitality",
		Health = 2000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Tempest",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Green",
		Cost = { Green = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Summon a fighter from your graveyard that has died, except it's zombified.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Fighter_HasDied", "GraveZone_Ally", "Field_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "\"He's watching me. That demon will not invade my thoughts like he did my kingdom.\""
	},
	FloorGladiatorY = {
		Id = 10221465945,
		Name = "Yuki, Champion of Emotion",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Yellow",
		Cost = { Yellow = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Set the power of all enemy fighters to 400.",
			Ability = {
				OnEnd = {
					Power = { { "SetPower", 400 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Both cutesy and neurotic, the worst thing one can do around Yuki is ignore her."
	},
	FloorGladiatorB = {
		Id = 7204456236,
		Name = "Braxton, Champion of Intellect",
		Health = 2000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Blue",
		Cost = { Blue = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Shuffle an Infernal Fan into your opponent's deck. Enemy fighters lose half of their power until their next end step.",
			Ability = {
				OnEnd = {
					Power = {
						{ "DeckAdd", "Infernal Fan" },
						{ "MultiSelectOperation", "Weaken", "Opponent" }
					},
					Target = "Opponent"
				},
				MultiSelectOperationWeaken = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Aggressor"
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
						{ "TempWeaken", "Variable", "Aggressor" }
					},
					Target = "Aggressor",
					NoBlip = true
				}
			}
		},
		Bio = "\"Why, an opportunity to study some of the land's most recondite beings up close? How tantalizing!\""
	},
	FloorGladiatorRGY = {
		Id = 10861873728,
		Name = "Quan Umberhallow, Crowdpleaser",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Yellow",
		Cost = { Yellow = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "This card is immune to all damage unless there's 8 or more enemy fighters.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "Fighter", "Nil" }
						},
						{ "EVGreaterValueCheck", 7 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"GivePassiveSpecific",
							{ Mitigation = 999999999 },
							"Self"
						},
						{
							"GivePassiveSpecific",
							{ DamageMitigation = 999999999 },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "RemovePassive", "Mitigation", "Self" },
						{ "RemovePassive", "DamageMitigation", "Self" }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "\"IT DOESN'T MATTER what your name is! This is MY house, and everyone in this crowd knows it! You're looking at the top dog, so run along to the locker room, ya JABRONIS!\""
	},
	FloorGladiatorRBY = {
		Id = 7133732764,
		Name = "The Prophet",
		Health = 3000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Red",
		Cost = { Red = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a card, discards a card, or attacks: Attach a gear to this card. Then, if there are 6 gears attached to it: Destroy them all, your opponent can't cast anything or attack until their next end step. Double this card's power.",
			Ability = {
				OnAnyEnemyCast = {
					Power = {
						{ "EquipGear", "Exertion" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 6 }
					},
					Target = "Self"
				},
				OnEnemyAttack = {
					Power = {
						{ "EquipGear", "Exertion" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 6 }
					},
					Target = "Self"
				},
				OnEnemyDiscard = {
					Power = {
						{ "EquipGear", "Exertion" },
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
						{ "DestroyGear", "All", "Self", nil, nil, "ProphetClock" },
						{ "MultiplyPower", 2, "Self" },
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
		Bio = "With the power of time on his side, the Prophet moves forward towards his fateful encounter beyond the Pits."
	},
	FloorGladiatorRG = {
		Id = 6688208184,
		Name = "Bloatware",
		Health = 2000,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Green",
		Cost = { Green = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card enters play: Summon 2 epic fighters from your graveyard that have died.\nWhenever an allied epic fighter dies: This fighter gains 100 health and power for each wave.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"MoveZone",
							{ "Fighter_Epic_HasDied", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter_Epic_HasDied", "GraveZone_Ally", "Field_Ally", true, false },
							"Self"
						}
					},
					Target = "Self",
					TotalTriggerLimit = 1
				},
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Self" },
						{ "Heal", "Variable", "Self" }
					},
					Target = "Self",
					Rarity = "Epic"
				}
			}
		},
		Bio = "How Hallow managed to bring a morbidly obese piece of software into the Pits is beyond anyone's understanding."
	},
	FloorGladiatorGY = {
		Id = 10221457896,
		Name = "Ultimate Doregriffon",
		Health = 1500,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Electric",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Yellow",
		MultMitigation = 0.9,
		Cost = { Yellow = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "This fighter takes 90% less damage unless an effect has targetted it this turn.",
			Ability = {
				OnTarget = {
					Power = { { "RemovePassive", "MultMitigation", "Self" } },
					Target = "Self"
				},
				OnStart = {
					Power = { {
						"GivePassiveSpecific",
						{ MultMitigation = 0.9 }
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Doregriffons don't understand humans. If they didn't want to be eaten, why are they made out of meat and treasure?"
	},
	FloorGladiatorBG = {
		Id = 7133852258,
		Name = "Herrus, Elder Thought Demon",
		Health = 4000,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gravity",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Blue",
		Cost = { Blue = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Summon a 200/200 Thoughtling. It gains 50 health and power for each wave.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Summon", "FloorThoughtling" },
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "SummonedCard" },
						{ "Heal", "Variable", "SummonedCard" }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{ "Summon", "FloorThoughtling" },
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "SummonedCard" },
						{ "Heal", "Variable", "SummonedCard" },
						{ "Summon", "FloorThoughtling" },
						{
							"AlterEV",
							{ "Set", "Battle", "FloorCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "SummonedCard" },
						{ "Heal", "Variable", "SummonedCard" }
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Herrus, the last of his kind, loathes his fate. Fundebted to Hallow, he is forced to partake in the games. Extremely intelligent and highly manipulative."
	},
	FloorThoughtling = {
		Id = 7133852663,
		Name = "Thoughtling",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Green = 1 },
		TokenOmni = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever this card attacks: Your opponent loses 350 life.",
			Type = "OnAttack",
			Power = { { "Inflict", 350 } },
			Target = "Opponent"
		},
		Bio = "Psychic apparations manifested by Herrus to do his bidding."
	},
	FloorGladiatorRY = {
		Id = 6688389065,
		Name = "Siegmund, Strife Smasher",
		Health = 1000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Slash",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Red",
		Cost = { Red = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this fighter attacks: Set your opponent's life to 1.",
			Ability = {
				OnAttack = {
					Power = { { "SetLife", 1, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "Wielder of the gigantic sword Grandark, it didn't take much convicing to bring Siegmund to the Pits, where more destruction awaited."
	},
	FloorGladiatorGBY = {
		Id = 7133731928,
		Name = "The Ghosdeeri",
		Health = 1500,
		Power = 1500,
		Rarity = "Token",
		AttackEffect = "Ice",
		StealImmune = true,
		DestroyImmune = true,
		TransformImmune = true,
		ReturnImmune = true,
		Color = "Green",
		Cost = { Green = 15 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this enters play: Put each enemy fighter into their baseplate, then summon a fighter from their baseplate for each card moved this way.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "Fighter", "Nil" }
						},
						{ "MoveGenZone", 30, "Opponent" },
						{
							"MoveZone",
							{
								"Fighter",
								"GenZone_Opponent",
								"Field_Opponent",
								true,
								false,
								"Variable"
							},
							"Self"
						}
					},
					Target = "Self",
					TotalTriggerLimit = 1
				}
			}
		},
		Bio = "Cursed to wander the Ruins of Wood alone, it joins the Pits to pull others into spectral companionship."
	},
	BattleSimVampirism = {
		Id = 114447520211223,
		Name = "Modifier: Vampirism",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "The player loses 400 life during their end steps. Whenever they destroy an enemy fighter: They gain 200 life.",
			Ability = {
				OnEnemyEnd = {
					Power = { { "Inflict", 400 } },
					Target = "Opponent"
				},
				OnAllyDeath = {
					Power = { { "Inflict", -200 } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	BattleSimVengeance = {
		Id = 133026207363982,
		Name = "Modifier: Vengeful",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		BlessingTimer = 2,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "At the start of the player's turns: Put a Vengeful blessing on a card in their hand for two turns.",
			Ability = {
				OnEnemyStart = {
					Power = { { "AddHandModifier", "VengefulBless", "RandomNotBlessedEnemyHand" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	BattleSimClock = {
		Id = 90919389783387,
		Name = "Modifier: On The Clock",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 8,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		ReplaceDescriptionant = "Variable Charges.\nDuring the player's end step: Remove a charge. Then ban them if this has zero charges.",
		Effect = {
			Description = "8 Charges. During the player's end step: Remove a charge. Then ban them if this has zero charges.",
			Ability = {
				OnEnemyEnd = {
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
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	BattleSimClock2 = {
		Id = 90919389783387,
		Name = "Modifier: On The Clock",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 12,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		ReplaceDescriptionant = "Variable Charges.\nDuring the player's end step: Remove a charge. Then ban them if this has zero charges.",
		Effect = {
			Description = "12 Charges. During the player's end step: Remove a charge. Then ban them if this has zero charges.",
			Ability = {
				OnEnemyEnd = {
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
					Power = { { "Ban", 999999, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	BattleSimGladiator = {
		Id = 111069255367208,
		Name = "Modifier: Lone Warriors",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a non-token card: Obliterate all copies of it that aren't in play.",
			Ability = {
				OnAnyEnemyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"Aggressor"
						},
						{
							"MoveZone",
							{ "Variable", "Deck_Opponent", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "Hand_Opponent", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Opponent", "Nil", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "GenZone_Opponent", "Nil", true, false, 99 },
							"Self"
						}
					},
					Target = "Opponent",
					NotRarity = "Token"
				}
			},
			DontCheckArchetype = true
		},
		Bio = ""
	},
	BattleSimRedYellow = {
		Id = 112912163567836,
		Name = "Modifier: Red/Yellow Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Red or Yellow: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Green", "Blue" }
				}
			}
		},
		Bio = ""
	},
	BattleSimBlueYellow = {
		Id = 104045668857044,
		Name = "Modifier: Blue/Yellow Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Blue or Yellow: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Green", "Red" }
				}
			}
		},
		Bio = ""
	},
	BattleSimGreenYellow = {
		Id = 124609426603523,
		Name = "Modifier: Green/Yellow Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Green or Yellow: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Red", "Blue" }
				}
			}
		},
		Bio = ""
	},
	BattleSimRedBlue = {
		Id = 78842163266823,
		Name = "Modifier: Red/Blue Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Red or Blue: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Green", "Yellow" }
				}
			}
		},
		Bio = ""
	},
	BattleSimGreenBlue = {
		Id = 115313373686312,
		Name = "Modifier: Green/Blue Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Green or Blue: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Red", "Yellow" }
				}
			}
		},
		Bio = ""
	},
	BattleSimRedGreen = {
		Id = 92667683598675,
		Name = "Modifier: Red/Green Stud Alignment",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever the player casts a coloured fighter, if it isn't Red or Green: Halve its stats.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "MultiplyHealth", 0.5 },
						{ "MultiplyPower", 0.5 }
					},
					Target = "Aggressor",
					Colors = { "Blue", "Yellow" }
				}
			}
		},
		Bio = ""
	},
	BattleSimActionless = {
		Id = 70844419765644,
		Name = "Modifier: Shocked",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "The player may not cast non-token Actions during their turns.",
			Ability = {
				OnEnemyStart = {
					Power = { {
						"SetCastRestriction",
						{
							{ "NotToken", "Action" },
							"You can't cast Non-Token Actions."
						},
						"Opponent"
					} },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	BattleSimStronger = {
		Id = 89345694207680,
		Name = "Modifier: Stronger Guys",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "Whenever this card's owner casts a fighter: It gains health and power equal to half its current health and power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "MultiplyHealth", 1.5 },
						{ "MultiplyPower", 1.5 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = ""
	},
	BattleSimSpeed = {
		Id = 87269881695156,
		Name = "Modifier: Lightning Fast",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenOmni = true,
		DestroyImmune = true,
		TriggerInGenZone = true,
		Effect = {
			Description = "The player has 25 seconds on their turns.",
			Ability = {
				OnEnd = {
					Power = { { "SetBattleTimer", 25 } },
					Target = "Ally"
				},
				OnEnemyEnd = {
					Power = { { "SetBattleTimer", -1 } },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	}
}
