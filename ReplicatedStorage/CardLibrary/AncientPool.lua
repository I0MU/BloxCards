



return {
	["Ancient Headless Horseman"] = {
		Id = 574314948,
		Name = "Headless Horseman",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Ancient = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies, ressurect it and lose 500 life.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Ancient Headless Horseman" },
				{ "Cost", 500 }
			},
			Target = "Ally"
		},
		Bio = "Your laws, much like your bones, were made to be broken."
	},
	["Ancient Infernal Acolyte"] = {
		Id = 300638688,
		Name = "Infernal Acolyte",
		Health = 750,
		Power = 0,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Thunder",
		Archetype = "Acolyte",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Acolyte",
			Description = "Gain 1 Red Icon and deal 100 to all Non-Dragon related cards at the end of each of your turns.",
			Type = "OnEnd",
			Power = {
				{ "Red", 1 },
				{ "Damage", 100 }
			},
			Target = "NotArchetype"
		},
		Bio = "Do you like to play with fire?"
	},
	["Ancient AntiSammeh"] = {
		Id = 283992421,
		Name = "Ancient AntiSammeh",
		Health = 300,
		Power = 525,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "GunShot",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		Effect = {
			Name = "Neme-shot",
			Description = "Deal 200 damage to a fighter and then reduce its attack by 200.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{ "Damage", 200 }
			},
			Target = "Single"
		},
		Bio = "It's like Sammeh, but not!"
	},
	["Ancient ClanAtlas"] = {
		Id = 430957985,
		Name = "ClanAtlas",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Punch1",
		Token = true,
		Color = "Red",
		Cost = { Red = 7, Neutral = 2 },
		Effect = {
			Name = "Render",
			Description = "At the end of your turn, fill your board with ClanAtlas.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" },
				{ "Summon", "Ancient ClanAtlas" }
			},
			Target = "Ally"
		},
		Bio = "Good decks play AoE."
	},
	["Ancient Dissing Dissident"] = {
		Id = 14632185571,
		Name = "Dissing Dissident",
		Health = 350,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Ancient = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if there's 2 or fewer cards in your graveyard: Draw a card. You lose 350 life.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "Cost", 350 }
					},
					Target = "Self",
					EffectRequirement = { "Board", "AllyGraveZone", 0, 3 }
				}
			}
		},
		Bio = "\"Anyone who isn't with us is against us, Harry,\" The man spat. \"You taught me that.\""
	},
	["Ancient It that was Silenced"] = {
		Id = 638008420,
		Name = "It that was Silenced",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Dash",
		Archetype = "Lycanthrope",
		AttackBlock = true,
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Level 1. Whenever your opponent casts an action, level this card up.",
			Type = "OnEnemyCast",
			Power = {
				{ "Summon", "Ancient It that is Whispering" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Eisenhower began the resurrection, whilst Hallow kept the shadows at bay."
	},
	["Ancient It that is Whispering"] = {
		Id = 638703994,
		Name = "It that is Whispering",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Dash",
		CounterBlock = true,
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Level 2. Whenever your opponent casts an action, level this card up.",
			Type = "OnEnemyCast",
			Power = {
				{ "Summon", "Ancient It that will Howl" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "The blood shard was placed on the grave, and the werewolves howled to summon their father."
	},
	["Ancient It that will Howl"] = {
		Id = 638703765,
		Name = "It that will Howl",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Dash",
		FaceBlock = true,
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Level 3. Whenever your opponent casts an action, level this card up.",
			Type = "OnEnemyCast",
			Power = {
				{ "Summon", "Ancient Eclipse, Werewolf Colossus" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "A lei of skulls was placed around the grave, cradelling his return. The shadows were relentless in their assault."
	},
	["Ancient Eclipse, Werewolf Colossus"] = {
		Id = 651213579,
		Name = "Eclipse, Werewolf Colossus",
		Health = 2000,
		Power = 2000,
		Rarity = "Token",
		AttackEffect = "Dash",
		CounterAttackBlock = true,
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Max level. Whenever any fighter dies, summon a Wolfbitten Noob and put a Wolven Blitz into your hand.",
			Type = "OnAnyDeath",
			Power = {
				{ "Summon", "Ancient Wolfbitten Noob" },
				{ "Add", "Ancient Wolven Blitz" }
			},
			Target = "Ally"
		},
		Bio = "And then the rose to the moon and cast a shadow on the shadows."
	},
	["Ancient Wolfbitten Noob"] = {
		Id = 596607381,
		Name = "Wolfbitten Noob",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Red",
		Archetype = "Lycanthrope",
		Cost = { Red = 1 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever you cast an action, transform this card.",
			Type = "OnAllyCast",
			Power = {
				{ "Summon", "Ancient Werewolf Savage" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Can he deliver his book to the library in time?"
	},
	["Ancient Werewolf Savage"] = {
		Id = 596217237,
		Name = "Werewolf Savage",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Red",
		Archetype = "Lycanthrope",
		Cost = { Red = 1 },
		Effect = {
			Name = "Halloween",
			Description = "Whenever your opponent casts an action, untransform this card.",
			Type = "OnEnemyCast",
			Power = {
				{ "Summon", "Ancient Wolfbitten Noob" },
				{ "Damage", 9999, "Self" }
			},
			Target = "Ally"
		},
		Bio = "Can you escape in time?"
	},
	["Ancient Wolven Blitz"] = {
		Id = 639277056,
		Name = "Wolven Blitz",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Red",
		Requirement = { "Archetype", "Ally", 1, 9999, "Lycanthrope" },
		Cost = { Red = 0 },
		Archetype = "Lycanthrope",
		Effect = {
			Name = "Eviscerate",
			Description = "Cast only if you control a Lycanthrope.\nDeal 200 damage to a target fighter, then draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200, "Single" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Happy Blitzwolfer Appreciation Day, October 2013."
	},
	["Ancient Eye of Overseer"] = {
		Id = 298792913,
		Name = "Eye of Overseer",
		Health = 800,
		Power = 50,
		Rarity = "Token",
		Archetype = "Overseer",
		AttackEffect = "Thunder",
		Color = "Green",
		Cost = { Neutral = 4 },
		Ancient = true,
		Effect = {
			Name = "Demon Eye",
			Description = "Gain 2 Green studs and reduce the attack of all Non-Overseers by 200.",
			Type = "OnSummon",
			Power = {
				{ "Green", 2, "Ally" },
				{ "Weaken", 200 }
			},
			Target = "NotArchetype"
		},
		Bio = "Eye of Overseers patrol their fortresses constantly, until they have to blink."
	},
	["Ancient Witch's True Brew"] = {
		Id = 315997790,
		Name = "Witch's True Brew",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Thunder",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Forced sip",
			Description = "Locks all enemy fighters for two turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Opponent",
			Increase = 2
		},
		Bio = "This will make your enemies turn to ice and will last twice! AHAHAHHAHAHA!~~."
	},
	["Ancient Deadeye"] = {
		Id = 283993033,
		Name = "Deadeye",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Punch1",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "Decrease the attack of all enemies by 350, but increase their health by 500.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "Weaken", 350 }
			},
			Target = "Opponent",
			Increase = 1
		},
		Bio = "A lizard with the job of making sure Mother Nature's voice is heard. Tough job for someone without thick skin."
	},
	["Ancient KingCactaur"] = {
		Id = 288040760,
		Name = "KingCactaur",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Slice",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Value gaining",
			Description = "Draw 1 card. This card can attack the turn it is summoned.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{ "Charge", 30 }
			},
			Target = "Ally"
		},
		Bio = "Senior advisor of Value Town."
	},
	["Ancient Body Swap Potion"] = {
		Id = 10683854586,
		Name = "Body Swap Potion",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		EffectVariable = 0,
		Ancient = true,
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
	["Ancient Apheliotropic Syzygy"] = {
		Id = 540076960,
		Name = "Apheliotropic Syzygy",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Dash",
		Color = "Green",
		Archetype = "Mythic",
		Cost = { Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card strikes the opponent, put a random Mythic Shadow into your hand.",
			Type = "OnStrike",
			Power = { { "RandomAdd", "Mythic" } },
			Target = "Ally"
		},
		Bio = "A flower that runs from the sun."
	},
	["Ancient Verisimilitudinal Dissonance"] = {
		Id = 540076776,
		Name = "Verisimilitudinal Dissonance",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Green",
		Archetype = "Mythic",
		Cost = { Green = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card strikes the opponent, generate two white icons.",
			Type = "OnStrike",
			Power = { { "Neutral", 2 } },
			Target = "Ally"
		},
		Bio = "A flower that runs from the sun."
	},
	["Ancient Liechtenauer's Sophistry"] = {
		Id = 540807350,
		Name = "Liechtenauer's Sophistry",
		Health = 350,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Dash",
		Color = "Green",
		Archetype = "Mythic",
		Cost = { Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card strikes the opponent, allies gain 200 health and power.",
			Type = "OnStrike",
			Power = {
				{ "Strengthen", 200 },
				{ "Heal", 200 }
			},
			Target = "Ally"
		},
		Bio = "A master that runs from talent."
	},
	["Ancient Gravity Collapse"] = {
		Id = 415734168,
		Name = "Gravity Collapse",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Lightning",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 6 },
		Ancient = true,
		Effect = {
			Name = "Zappow!",
			Description = "Deal 800 damage to enemy fighters.",
			Type = "OnSummon",
			Power = "Damage",
			Target = "Opponent",
			Increase = 800
		},
		Bio = "Stops even light from escaping."
	},
	["Ancient Gato Luz"] = {
		Id = 297414530,
		Name = "Gato Luz",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Thunder",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Booting",
			Description = "At the end of your turn, draw 1 card and unlock all enemy fighters.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "Unlock", 1000 }
			},
			Target = "Opponent"
		},
		Bio = "This robotic cat is basically the mascot of 'The robots'. Don't worry, you won't be in the darkness when you're with it."
	},
	["Ancient NobleDragon"] = {
		Id = 296708322,
		Name = "NobleDragon",
		Health = 900,
		Power = 900,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Punch2",
		Color = "Blue",
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
	["Ancient Subata"] = {
		Id = 264619771,
		Name = "Subata",
		Power = 250,
		Health = 750,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = { "Laser", "Red" },
		Color = "Blue",
		Cost = { Neutral = 1 },
		Bio = "In the year 20XX, a lone cyborg would post on message boards in ROBLOX, and that cyborg is none other than Subata!",
		Effect = {
			Name = "Mental Preparation",
			Description = "Locks himself for two turns to charge his blaster!",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Self",
			Increase = 2
		}
	},
	["Ancient Stormchaser's Gambit"] = {
		Id = 540076783,
		Name = "Stormchaser's Gambit",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Dash",
		Color = "Blue",
		Cost = { Blue = 0 },
		Requirement = { "Playertable", "Me", 7, 9999, "Actions" },
		Effect = {
			Name = "Pyrotechnics",
			Description = "If you've cast 7 actions this turn, you win the game.",
			Type = "OnSummon",
			Power = { { "Inflict", 1000000 } },
			Target = "Opponent"
		},
		Bio = "Grapeshots ruined; Tendrils of Agony depleted. All that is left is the rush."
	},
	["Ancient JackinatorMG"] = {
		Id = 285152525,
		Name = "JackinatorMG",
		Health = 300,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Ancient = true,
		Effect = {
			Name = "Clocked",
			Description = "Lock all fighters for 1 turn",
			Type = "OnSummon",
			Power = "Lock",
			Target = "All",
			Increase = 1
		},
		Bio = "The original suggestor of combining Doritos and Mtn Dew."
	},
	["Ancient Police Taskmaster"] = {
		Id = 1674213770,
		Name = "Police Taskmaster",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "D",
			Description = "Put Case #1 into your hand.",
			Type = "OnSummon",
			Power = { { "Add", "Ancient Case1" } },
			Target = "Ally"
		},
		Bio = "4 cases, 4 days, 1 shot."
	},
	["Ancient Case1"] = {
		Id = 1724919808,
		Name = "Case #1: The Lowly Thug",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Requirement = { "Archetype", "Ally", 3, 9999, "Police" },
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "I",
			Description = "Requires 3 Police in play to investigate. Summon three lowly thugs onto the opponent's board. End the turn.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Summon", "Ancient LowlyC" },
				{ "Summon", "Ancient LowlyB" },
				{ "Summon", "Ancient LowlyA" },
				{ "Unlock", 1 },
				{ "EndTurn", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "Multiple shootings, five dead, and money stolen, go after them, before more lives are taken…"
	},
	["Ancient LowlyA"] = {
		Id = 1674211838,
		Name = "Lowly Thug A",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "S",
			Description = "At the end of your turn, put a random Police into the opponent's hand.",
			Type = "OnEnd",
			Power = { { "RandomAdd", "Police" } },
			Target = "Opponent"
		},
		Bio = "If I don’t get ya, this car will."
	},
	["Ancient LowlyB"] = {
		Id = 1674212257,
		Name = "Lowly Thug B",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "At the end of your turns, draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "\"YEAAAAAAH! We made it! All those alarms and sirens but there's nothing ahead!\" - Bruce"
	},
	["Ancient LowlyC"] = {
		Id = 1674212717,
		Name = "Lowly Thug C",
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "O",
			Description = "When this card dies, Case #1 is solved. Your opponent puts Case #2 into their hand.",
			Type = "OnDeath",
			Power = {
				{ "Damage", 9999, "Archetype" },
				{ "Add", "Ancient Case2" }
			},
			Target = "Opponent"
		},
		Bio = "The Supreme-branded bags are probably worth more than the cash its holding."
	},
	["Ancient Case2"] = {
		Id = 1724921188,
		Name = "Case #2: The Crooked Cop",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Requirement = { "Archetype", "Ally", 3, 9999, "Police" },
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "U",
			Description = "Requires 3 Police in play to investigate. Your opponent summons The Crooked Cop and his Conflict of Interest. You draw 2 cards, and gains 2 blue and 2 white icons. End the Turn.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Summon", "Ancient CrookedCop" },
				{ "Summon", "Ancient ConflictInterest" },
				{ "Draw", 2, "Ally" },
				{ "Neutral", 2, "Ally" },
				{ "Blue", 2, "Ally" },
				{ "Unlock", 1 },
				{ "EndTurn", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "Either you die a hero or live long enough to see yourself become the villain."
	},
	["Ancient CrookedCop"] = {
		Id = 1674211148,
		Name = "The Crooked Cop",
		Health = 800,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime2",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "N",
			Description = "When this card dies, Case #2 is solved. Your opponent puts Case #3 into their hand.",
			Type = "OnDeath",
			Power = {
				{ "Damage", 9999, "Archetype" },
				{ "Add", "Ancient Case3" }
			},
			Target = "Opponent"
		},
		Bio = "\"I'm sorry, I truly am. They found me. If I don't give The Chairman the Yakuza files...they'll...he'll...my family...\""
	},
	["Ancient ConflictInterest"] = {
		Id = 1674210715,
		Name = "Conflict of Interest",
		Health = 600,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime2",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "T",
			Description = "At the end of your turns, put a random Police into the opponents hand.",
			Type = "OnEnd",
			Power = { { "RandomAdd", "Police" } },
			Target = "Opponent"
		},
		Bio = "He was a good cop, and a even better husband. The Chairman knew."
	},
	["Ancient Case3"] = {
		Id = 1724921891,
		Name = "Case #3: Ties to the Yakuza",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Requirement = { "Archetype", "Ally", 1, 9999, "Police" },
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "Requires 1 Police in play to investigate. Lock all allied fighters for a turn. Your opponent summons The Yakuza Underboss and his Underling. Draw 2 cards, gains 2 blue and 2 white icons, and put a random Police into your hand. End the turn.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1, "Ally" },
				{ "Summon", "Ancient Yakuza Underboss" },
				{ "Summon", "Ancient Yakuza Underling" },
				{ "Draw", 2, "Ally" },
				{ "Neutral", 2, "Ally" },
				{ "Blue", 2, "Ally" },
				{ "RandomAdd", "Police", "Ally" },
				{ "Unlock", 1 },
				{ "EndTurn", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "The Crooked Cop wasn't acting alone. He mentioned something about the Yakuza and a mysterious man. Just as the Police find themselves in a dead-end, a massacre begins in a nearby bio-lab. Rush to the scene!"
	},
	["Ancient Yakuza Underboss"] = {
		Id = 1674220846,
		Name = "Yakuza Underboss",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		CounterAttackBlock = true,
		Color = "Blue",
		Archetype = "Crime3",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "O",
			Description = "When this card dies, Case #3 is solved. Your opponent adds Case #4 to their hand. Destroy all allied fighters.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Ancient Case4" },
				{ "Damage", 9999, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "YOU THINK YOU CAN BEAT ME? I HAVE THE POWER OF BOTH GOD AND ANIME ON MY SIDE! HAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	},
	["Ancient Yakuza Underling"] = {
		Id = 1674221401,
		Name = "Yakuza Underling",
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime3",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "D",
			Description = "At the end of your turns, summon a Yakuza Thug.",
			Type = "OnEnd",
			Power = { { "Summon", "Ancient Yakuza Thug" } },
			Target = "Ally"
		},
		Bio = "(҂` ﾛ ´) ＨＹＡＡＡＡＡＡＡＡＡＡ！！！"
	},
	["Ancient Yakuza Thug"] = {
		Id = 1674220122,
		Name = "Yakuza Thug",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Crime3",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "E",
			Description = "When this card dies, all non-Yakuza take 200 damage.",
			Type = "OnDeath",
			Power = { { "Damage", 200 } },
			Target = "NotArchetype"
		},
		Bio = "╮( ˘ ､ ˘ )╭ Ｂｏｓｓ ｗａｎｔ ｂｒｅａｋ ｌａｂ。 Ｂｏｓｓ ｄｏｎ＇ｔ ｌｉｋｅ Ｃｈａｉｒｍａｎ。 Ｂｏｓｓ ｄｏｎ＇ｔ ｗａｎｔ ｙｏｕ ｅｉｔｈｅｒ。"
	},
	["Ancient Case4"] = {
		Id = 1724922793,
		Name = "Case #4: Organized Underworld",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Requirement = { "Archetype", "Ally", 3, 9999, "Police" },
		AttackEffect = "Gunshot",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "A",
			Description = "Requires 3 Police in play to investigate. Your opponent summons The Chairman and The Operative. Draw 2 cards, gain 2 blue and white icons, and put 2 random Police into your hand. End the turn.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Summon", "Ancient The Chairman" },
				{ "Summon", "Ancient The Operative" },
				{ "Draw", 2, "Ally" },
				{ "Neutral", 2, "Ally" },
				{ "Blue", 2, "Ally" },
				{ "RandomAdd", "Police", "Ally" },
				{ "RandomAdd", "Police", "Ally" },
				{ "Unlock", 1 },
				{ "EndTurn", 30, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "One last case. The end of the road. Find the truth about The Chairman."
	},
	["Ancient The Chairman"] = {
		Id = 1674219117,
		Name = "The Chairman",
		Health = 3000,
		Power = 3000,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		WeakenImmune = true,
		SetImmune = true,
		Charge = true,
		Color = "Blue",
		Archetype = "Crime4",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "When this card dies, Case #4 is solved. You get arrested and lose the game.",
			Type = "OnDeath",
			Power = { { "SetLife", 0 } },
			Target = "Ally"
		},
		Bio = ""
	},
	["Ancient The Operative"] = {
		Id = 1674219711,
		Name = "The Operative",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Gunshot",
		CounterAttackBlock = true,
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "I",
			Description = "At the end of each turn, put 2 random Police into the opponents hand.",
			Type = "OnEnd",
			Power = {
				{ "RandomAdd", "Police" },
				{ "RandomAdd", "Police" }
			},
			Target = "Opponent"
		},
		Bio = "The Chairman's faithful second-in-command. Found the informant. Manipulated you into taking down the Yakuza for him. Now, you're the last loose end. Unparalleled killing power."
	},
	["Ancient Lilly_S"] = {
		Id = 411804632,
		Name = "Lilly_S",
		Health = 500,
		Power = 50,
		Rarity = "Token",
		AttackEffect = "Lightning",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Ancient = true,
		Effect = {
			Name = "GO!",
			Description = "Calls for reinforcements of 3 lowly clan members (noobs) and grants 200 power to her allies.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Noob" },
				{ "Summon", "Noob" },
				{ "Summon", "Noob" },
				{ "Strengthen", 200 }
			},
			Target = "Ally"
		},
		Bio = "'Vortex Security respects her, please do not insult her. Yes, IcyTea learned it the hard way.'"
	},
	["Ancient AVote"] = {
		Id = 297414527,
		Name = "AVote",
		Health = 500,
		Power = 250,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Thunder",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1 },
		Effect = {
			Name = "Chain-Break!",
			Description = "Unlock a fighter equivalent to 1 or less turns.",
			Type = "OnSummon",
			Power = "Unlock",
			Target = "Single",
			Increase = 1
		},
		Bio = "Best friends with 13Jayson, they even work well together!"
	},
	["Ancient Hopelesssly"] = {
		Id = 316000990,
		Name = "Hopelesssly",
		Health = 700,
		Power = 125,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Thunder",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "Hopelesssnesss",
			Description = "At the end of each turn, damage all enemy fighters by 75 and weaken them by 50.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 75 },
				{ "Weaken", 50 }
			},
			Target = "Opponent"
		},
		Bio = "You want to beat a squid who is a kid? Think again."
	},
	["Ancient Jack-O-Bat"] = {
		Id = 315997677,
		Name = "Jack-O-Bat",
		Health = 700,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Thunder",
		Color = "Yellow",
		Ancient = true,
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "Revival",
			Description = "Whenever this card attacks, set all your icons to 2.",
			Type = "OnAttack",
			Power = {
				{ "SetYellow", 2 },
				{ "SetGreen", 2 },
				{ "SetBlue", 2 },
				{ "SetRed", 2 },
				{ "SetNeutral", 2 }
			},
			Target = "Ally"
		},
		Bio = "Spook!"
	},
	["Ancient Infinite Chicken"] = {
		Id = 336415537,
		Name = "Infinite Chicken",
		Health = 0,
		Power = 0,
		Stealth = true,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Infinite Frost",
			Description = "Increase the Attack and Health of a target fighter by 100 and put a copy of this card into your hand.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 },
				{ "Add", "Ancient Infinite Chicken", "Ally" }
			},
			Target = "Single"
		},
		Bio = "Don't ask why the Grand Chicken Lord has so many chicken legs."
	},
	["Ancient AgentBloxxer"] = {
		Id = 10938756232,
		Name = "AgentBloxxer",
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		EffectVariable = 0,
		Ancient = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy all other fighters. Your opponent draws two cards and gains 4 white icons. End the turn. ",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "CustomTarget" },
						{ "Draw", 2, "Opponent" },
						{ "Neutral", 4, "Opponent" },
						{ "EndTurn" }
					},
					Target = "Ally",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "OtherCards"
					}
				}
			}
		},
		Bio = "Creator of Destroy the Wall and Brick Factory Tycoon. That's some real yin yang right there."
	},
	["Ancient Heavy Rain"] = {
		Id = 323275958,
		Name = "Heavy Rain",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch1",
		Field = 323275951,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Ancient = true,
		Terrain = true,
		Effect = {
			Name = "Stud",
			Description = "This card is in both terrain slots. Ally cards lose 100 Attack and Opponent cards gain 100 Attack. This effect alternates between players at the start of each turn.",
			Ability = {
				OnSummon = {
					Power = { { "DestroyTerrain" } },
					Target = "Opponent"
				},
				OnEnemyTerrainCast = {
					Power = { { "DestroyTerrain" } },
					Target = "Ally"
				},
				OnStart = {
					Power = {
						{ "Strengthen", 100, "CurrentTurn" },
						{ "Weaken", 100, "NonCurrentTurn" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "It's a rainy day outside. No time to be eating bread."
	},
	["Ancient Robot"] = {
		Id = 335687601,
		Name = "Robot",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Thunder",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Ancient = true,
		Effect = {
			Name = "Revival",
			Description = "Whenever a player targets Robot, they draw 2 cards.",
			Ability = {
				OnTargetByAlly = {
					Power = { { "Draw", 2 } },
					Target = "Ally"
				},
				OnTargetByEnemy = {
					Power = { { "Draw", 2 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "The most efficient in efficient-co technologies."
	},
	["Ancient MUTO2014"] = {
		Id = 430947715,
		Name = "MUTO2014",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch1",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 2, Red = 2 },
		Ancient = true,
		Effect = {
			Name = "Capture",
			Description = "Shuffle a Fractal into your deck.",
			Type = "OnSummon",
			Power = { { "DeckAdd", "Ancient Fractal" } },
			Target = "Ally"
		},
		Bio = "HEY GUYS! Costume Quest 2's just come out!"
	},
	["Ancient Fractal"] = {
		Id = 429397954,
		Name = "Fractal",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch1",
		Color = "Red",
		Cost = { Red = 4, Neutral = 2 },
		Effect = {
			Name = "Stud",
			Description = "Add 4 red or blue actions to your hand, then generate 4 red icons.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "Red", 4 }
			},
			Target = "Ally"
		},
		Bio = "The Paraselene Sage thought he found the most forbidden of powers. He was wrong."
	},
	["Ancient Bowl of Greed"] = {
		Id = 283992852,
		Name = "Bowl of Greed",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Bio = "Legend says this bowl grants you fortune and fame.",
		Effect = {
			Name = "Bowl of Greed",
			Description = "Draw 2 Cards. Add \"Lord of Greed\" to your opponent's hand.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 2, "Ally" },
				{ "Add", "Ancient Lord of Greed" }
			},
			Target = "Opponent"
		}
	},
	["Ancient Lord of Greed"] = {
		Id = 326988968,
		Name = "Lord of Greed",
		Health = 500,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "GunShot",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Charge = true,
		Effect = {
			Name = "Blow Dart",
			Description = "When this card destroys a monster, draw a card.",
			Type = "OnDestroy",
			Power = "Draw",
			Target = "Ally",
			Increase = 1
		},
		Bio = "Lord of Greed is to Bowls as snakes are to barrels."
	},
	["Ancient Stud"] = {
		Id = 288041067,
		Name = "Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		Ancient = true,
		AttackEffect = "Punch1",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Stud",
			Description = "Gain 2 Neutral Icons.",
			Type = "OnSummon",
			Power = "Neutral",
			Target = "Ally",
			Increase = 2
		},
		Bio = "Whats better, 2 Neutral icons or 1 hand card?"
	},
	["Ancient Animate Cannonman!"] = {
		Id = 4789583049,
		Name = "Animate Cannonman!",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		CounterBlock = true,
		Ancient = true,
		Cost = { Neutral = 5 },
		Archetype = "Cannonman",
		Effect = {
			Name = "Metalurgy",
			Description = "When this card dies, if you control a fighter with the same colour as it: Summon a copy of it. Its colour is random.",
			Type = "OnDeath",
			Power = { {
				"RandomSummon",
				{
					"Ancient Animate Cannonman!",
					"Ancient The Cannonman is Angry!",
					"Ancient The Cannonman is Scared!",
					"Ancient The Cannonman is Gone!",
					"Ancient The Cannonman is Curious!"
				}
			} },
			Target = "Ally",
			EffectRequirement = { "Color", "Ally", 2, 999, "Self" },
			AllowDeadAggressorTriggers = true
		},
		Bio = "Real Boys breathe, so I must breathe too! Fetch the canisters!"
	},
	["Cannonman Holster"] = {
		Id = 4789583049,
		Name = "Animate Cannonman!",
		AltCards = {
			["Ancient The Cannonman is Angry!"] = {
				Id = 4789583410,
				Name = "The Cannonman is Angry!",
				Bio = "Real Boys destroy the buildings of bigots!",
				Rarity = "Token",
				Color = "Red"
			},
			["Ancient The Cannonman is Scared!"] = {
				Id = 4789582031,
				Name = "The Cannonman is Scared!",
				Bio = "R-Real Boys get sad when their leaders die. Only the strong survive.",
				Rarity = "Token",
				Color = "Blue"
			},
			["Ancient The Cannonman is Gone!"] = {
				Id = 4789582500,
				Name = "The Cannonman is Gone!",
				Bio = "Real Boys hide from counter-revolutionaries, brothers.",
				Rarity = "Token",
				Color = "Green"
			},
			["Ancient The Cannonman is Curious!"] = {
				Id = 4789581519,
				Name = "The Cannonman is Curious!",
				Bio = "Real Boys find loopholes to get out of being taxed!",
				Rarity = "Token",
				Color = "Yellow"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Neutral",
		CounterBlock = true,
		Cost = { Neutral = 5 },
		Archetype = "Cannonman",
		Effect = {
			Name = "Metalurgy",
			Description = "When this card dies, if you control a fighter with the same colour as it: Summon a copy of it. Its colour is random.",
			Type = "OnDeath",
			Power = { {
				"RandomSummon",
				{
					"Ancient Animate Cannonman!",
					"Ancient The Cannonman is Angry!",
					"Ancient The Cannonman is Scared!",
					"Ancient The Cannonman is Gone!",
					"Ancient The Cannonman is Curious!"
				}
			} },
			Target = "Ally",
			EffectRequirement = { "Color", "Ally", 2, 999, "Self" },
			AllowDeadAggressorTriggers = true
		},
		Bio = "Real Boys breathe, so I must breathe too! Fetch the canisters!"
	},
	["Ancient Circle Stud"] = {
		Id = 10184322514,
		Name = "Circle Stud",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Archetype = "Studling",
		Ancient = true,
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Put a stud of each colour into your baseplate.\nDestroy a card in your hand.",
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
				},
				{ "RandomDiscard", 1 }
			},
			Target = "Ally"
		},
		Bio = "A bygone relic of a bygone time."
	}
}
