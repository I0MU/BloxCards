



return {
	["Committee Crony"] = {
		Id = 12288048834,
		Name = "Committee Crony",
		AltCards = {
			["Committee Crony-E"] = {
				Name = "Hopping Healer",
				AttackEffect = "Jab",
				Id = 12957241251,
				Bio = ""
			},
			["Committee Crony-I"] = {
				Name = "Committee Crony",
				AttackEffect = "Jab",
				Id = 100606699127488,
				Bio = ""
			},
			Apiri = {
				Id = 16361236131,
				AltArt = true,
				AttackEffect = "Jab",
				PremiumArt = 218,
				Name = "Apiri",
				Bio = "Exploiting people is felicitous business in a decaying city."
			},
			["Hyphen Bear5 Researchers of What Once Was"] = {
				Name = "Hyphen & Bear5, Researchers of What Once Was",
				AttackEffect = "Jab",
				PremiumArt = 811,
				Id = 118553153776310,
				Bio = "While perusing through the Pre-Cataclysm archives of the library, Hyphen and Bear5 came across the Necrosyndicate Wars and Factions. Interested, they briefly looked through what was offered: books on the Necroenzyme, how a great plague was prevented, and every Necrosyndicate Faction that existed during the time. While looking through each Faction, one interested both of them the most: the Committee for Rational Progress…What else would they uncover?"
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Red = 1, Blue = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Inject a target allied fighter that costs 7 or fewer total studs.\nWhenever you cast a zombified fighter: You gain {W}.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AddCopy",
							30,
							"AllySingleSevenCostOrLess",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "AllySingleSevenCostOrLess" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				},
				OnAllySummon = {
					Power = { { "Neutral", 1, "Ally" } },
					Target = "Self",
					Zombified = true
				}
			},
			Injecting = true
		},
		Bio = "Not all of Astarossa's cabinet are as noble or honest as him."
	},
	["Reckless Recruiter"] = {
		Id = 12162810131,
		Name = "Reckless Recruiter",
		AltCards = {
			["Reckless Recruiter-E"] = {
				Name = "Rider Rabbit",
				Id = 12957234604,
				AttackEffect = "Punch",
				Bio = ""
			},
			["Ennard, on High Alert!!"] = {
				Id = 129050518292404,
				AltArt = true,
				AttackEffect = "Jab",
				Name = "Ennard, on High Alert!!",
				Bio = "I feel like that one guy from that one game"
			},
			uraniummuncjer = {
				Id = 79420551016692,
				Name = "uraniummuncjer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 510,
				Bio = "Fight back."
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 2, Neutral = 1 },
		Charge = true,
		EffectVariable = 0,
		CustomReminderInject = true,
		CustomReminder = {
			["Limited Lobbying"] = "This card has to survive combat to inject itself."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another: Inject this card, then all allied fighters gain 50 Power.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Strengthen", 50, "Ally" },
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
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "\"Hey there! You worried about your health? The CRP is providing free healthcare for all!\""
	},
	["Pent-up Pentagenarian"] = {
		Id = 12146828522,
		Name = "Pent-up Pentagenarian",
		AltCards = {
			["Pent-up Pentagenarian-E"] = {
				Name = "Jackrabbit Jester",
				AttackEffect = "Jab",
				Id = 12957235969,
				Bio = ""
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Red",
		Cost = { Red = 2, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If there's an allied zombified fighter, this card can't be countered.\nWhen this card dies: Draw a card.",
			Ability = {
				OnAttack = {
					Power = { { "GivePassive", "CounterAttackBlock", nil, nil, nil, "OldLadyShout" } },
					Target = "Self",
					EffectRequirement = { "HasPassive", "Ally", 1, 9999, "Zombified" }
				},
				OnAttackEnd = {
					Power = { { "RemovePassive", "CounterAttackBlock" } },
					Target = "Self"
				},
				OnDeath = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Kids these days are so ungrateful! Astarossa <b>built</b> this city!\""
	},
	["Defender of Democracy"] = {
		Id = 12146821132,
		Name = "Defender of Democracy",
		AltCards = {
			["Defender of Democracy-E"] = {
				Name = "Cottontail Courtier",
				AttackEffect = "Punch",
				Id = 12957229444,
				Bio = ""
			},
			OfficeSpace = {
				Id = 75403580633559,
				Name = "OfficeSpace",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 405,
				Bio = "You become what you hate<br/>#killmonoblue"
			},
			["Defender of Democracy-Mango"] = {
				Name = "Deranged Daniel",
				Id = 132482412644953,
				AttackEffect = "Slash",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "“It’s not as bad as it looks.<br/><br/>It’s worse.”"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 1 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Lock a target enemy fighter for 1 turn.\nWhenever you discard your second card each turn: Inject this card.",
			Ability = {
				OnSummon = {
					Power = { { "Lock", 1 } },
					Target = "SingleEnemy"
				},
				OnAllyDiscard = {
					Power = {
						{
							"AddCopy",
							30,
							"Self",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "Self" }
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					},
					EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" }
				}
			},
			Injecting = true
		},
		Bio = "Stoic, loyal, unerring; the characteristics to preserve the laws of the older times."
	},
	["Booming Boomer"] = {
		Id = 12182761718,
		Name = "Booming Boomer",
		AltCards = {
			["Booming Boomer-E"] = { Name = "Nibble Knights", Id = 12957232825, Bio = "" }
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 3 },
		Overload = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you inject a card: This card gains 300 Power.",
			Ability = {
				OnAllyInject = {
					Power = { { "Strengthen", 300 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"I was there as Astarossa transformed this city from run-down nothing to an economic powerhouse. Now, it's transforming into something far GREATER!\""
	},
	Disenfranchise = {
		Id = 12146825230,
		Name = "Disenfranchise",
		AltCards = {
			["Disenfranchise-E"] = { Name = "Burrowing Barrage", Id = 12957226345, Bio = "" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select and inject up to 2 fighter cards in your baseplate that each cost 4 or fewer total studs.\nPut a Red Stud and a Blue Stud into your baseplate, except they're zombified.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Hand_Ally", true, false },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Hand_Ally", true, false },
							"CustomZoneTarget"
						},
						{
							"AddGenZone",
							{ "Blue Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Red Stud", 1 }
						}
					},
					Target = "Self",
					UniqueTargets = true,
					ZoneTargetParameters = {
						Zones = { "Ally_GenZone" },
						Condition = { CostOrLess = 4, Fighter = true, HasntPassive = "Zombified" },
						SelectionDescription = "A non-colourless fighter from your baseplate"
					},
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "The Astral Faith, a hardcore sect of the CRP, see being mortal as evil, as a burden on healthcare and the economy. Such evil should be outlawed."
	},
	["Absolute Authority"] = {
		Id = 12144385409,
		Name = "Absolute Authority",
		AltCards = {
			["Absolute Authority-E"] = {
				Name = "King BonBon's Hammerdown",
				Id = 16361233692,
				Bio = "Did you know rabbits often stomp their feet when upset?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 5, Red = 2, Blue = 2 },
		EffectVariable = 0,
		Fading = true,
		CustomReminder = {
			["Astarossa's Decree"] = "When a zombified card leaves play for any reason, obliterate it. This can trigger death effects, return effects, etc."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 800 damage to all non-zombified fighters.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 800 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "HasntPassive",
						Modifier = "Zombified"
					}
				}
			}
		},
		Bio = "40 years of uninterrupted power creates an iron fist, regardless of the citizen's mandate."
	},
	["Public Immortality House"] = {
		Id = 12288067926,
		Name = "Public Immortality House",
		AltCards = {
			["Public Immortality House-E"] = {
				Name = "King's Keep",
				Terrariant = "King's Keep Terrarian",
				Id = 12957239243,
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 3, Blue = 3 },
		EffectAnimation = "SingleInject",
		Terrain = true,
		Terrariant = "Unerring Temperance",
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you discard your first card each turn: Inject a target allied fighter that costs 7 or fewer total studs.",
			Ability = {
				OnSecondDiscard = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" }
					},
					Target = "AllySingleSevenCostOrLess",
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
		Bio = "\"We spend millions of Bloxbux a year caring for our aging population. If you aren't persuaded by the ethics of ending aging, be swayed by the economy.\"<br/>-Astarossa, Mayor of Bloxburg"
	},
	["Join the Cause"] = {
		Id = 12288059819,
		Name = "Join the Cause",
		AltCards = {
			["Join the Cause-E"] = { Name = "Sylvilagus Signet", Id = 12957230561, Bio = "" },
			["June 22nd 2023"] = {
				Name = "June 22nd, 2023",
				Id = 98079506886666,
				PremiumArt = 840,
				AltArt = true,
				EffectAnimation = "gaster",
				Bio = "Cool, dry, air-conditioned air. You are home."
			},
			["Join the Cause-Mango"] = {
				Name = "Devotion",
				Id = 90920354956445,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "OUR FINAL DAY WILL BE A CATHARSIS. WE WILL JOIN OUR CITY IN THE MAGMA BELOW AND WE WILL REJOICE, FOR WE WILL HAVE DIED HAVING PUT OUR LIVES ON THE LINE"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 2 },
		EffectAnimation = "SingleInject",
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" }
					},
					Target = "Single",
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
		Bio = "Those of the Enzyme must keep taking it to stay alive; Astarossa would condemn the Astral Faith if he knew about their grizzly recruitment strategy."
	},
	["Bloxburg Mayor Astarossa"] = {
		Id = 12144409338,
		Name = "Bloxburg Mayor Astarossa",
		AltCards = {
			["Bloxburg Mayor Astarossa-Offer"] = {
				Name = "Astarossa Van Buren",
				ArtAnimation = "Astarossa",
				Id = 12653946666,
				Bio = "A solid authority, an unshakable will."
			},
			["Bloxburg Mayor Astarossa-E"] = { Name = "King Van Bonbon", Id = 13006549638, Bio = "hop hop" }
		},
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 4, Blue = 2 },
		SummonAnimation = "AstarossaSummon",
		SummonedAnimation = "AstarossaSummon",
		SummonAnimationEffect = true,
		EffectVariable = 0,
		CustomReminder = {
			["Astarossa's Decree"] = "When a zombified card leaves play for any reason, obliterate it. This can trigger death effects, return effects, etc."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a zombified fighter: You gain {W}. Unlock this card.",
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
	["United Front"] = {
		Id = 12288065270,
		Name = "United Front",
		AltCards = {
			["United Front-Sun"] = { Id = 13660427798, Name = "Pirate Invasion", Bio = "" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3, Red = 3 },
		Rank = 6,
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy the bottom 2 cards of your deck.\nSelect 2 unranked, non-token fighter cards in your graveyard that each cost 4 or fewer total studs. Summon those cards, except they're fading.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {
							Fighter = true,
							CostOrLess = 4,
							Unranked = true,
							Rarities = { "Common", "Uncommon", "Rare", "Epic", "Legendary" }
						},
						SelectionDescription = "two cards from your graveyard.",
						MinTargets = 0,
						MaxTargets = 2
					},
					MetaData = { Fading = true },
					NoBlip = true
				}
			}
		},
		Bio = "A reminder of what they want to prevent."
	},
	["Citizen's Militia"] = {
		Id = 12294931520,
		Name = "Citizen's Militia",
		AltCards = {
			["Citizen's Militia-Sun"] = {
				Id = 13668660255,
				Name = "Pirate Warrior",
				AttackEffect = "Slash",
				Bio = "\"I can fight 10 sailors at once!\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Red = 3 },
		Liberate = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When you've discarded 3 or more cards this turn: Unlock a target fighter.",
			Ability = {
				OnAnyTrigger = {
					Power = { { "Unlock", 9999 } },
					Target = "Single",
					EffectRequirement = { "Playertable", "Me", 3, 99999, "DiscardCount" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "United under one cause."
	},
	["Defiant March"] = {
		Id = 12154433978,
		Name = "Defiant March",
		AltCards = {
			["Defiant March-Sun"] = {
				Id = 13660498294,
				Name = "En' Garde!",
				Bio = "\t\t\t\tTrapping the Captain in a cursed land was one thing, threatening to steal the souls of his crew is another.\n\t\t\t\tBut saying that you'll turn The Crownfeller into one of the boats in your cheap collection of shipwrecks? That'll give you a plank and an anchor, personal from Newman himself.\n\t\t\t\t"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
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
	["Direct Action"] = {
		Id = 12288054051,
		Name = "Direct Action",
		AltCards = {
			["Direct Action-Sun"] = {
				Id = 13660975547,
				Name = "Captain's Gambit",
				Commissioner = { 1750955123 },
				Bio = "\"YARRR HARRRR!!!!\""
			},
			["Happy End"] = {
				Id = 14757174896,
				Name = "Happy End",
				AltArt = true,
				Commissioner = { 1082444751, 90658630 },
				Bio = "After everything, we're finally together. We shall live a happy life after, and nothing will make us apart anymore."
			},
			["BEWARE! The Wolf Hunt"] = {
				Id = 110796478905506,
				Name = "BEWARE! The Wolf Hunt",
				AltArt = true,
				Bio = "“Those damned Lycanthropes named by this ‘Arctic’ fellow are causing me some trouble! Best to get outta here while they’re hunting. No available game to hunt for anymore.” - Unlucky Hunter"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Liberate = true,
		EffectVariable = 0,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select up to 2 cards in your opponent's graveyard. Obliterate those cards.\nYou lose 200 life and draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", true, false },
							"CustomZoneTarget"
						},
						{ "Cost", 200, "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "up to two cards from your opponent's Graveyard"
					}
				}
			}
		},
		Bio = "\"Bring those that would abuse immortality to their knees.\"<br/>-McKayla Newman"
	},
	["McKayla, Bane of Hierarchy"] = {
		Id = 12170683844,
		Name = "McKayla, Bane of Hierarchy",
		AltCards = {
			["McKayla, Bane of Hierarchy-Offer"] = {
				Name = "McKayla, Flame of Liberation",
				AttackEffect = "Bat",
				ArtAnimation = "McKayla",
				Id = 12653977427,
				Bio = "\"As the flames of liberation rise with anger, the wind begins to blow the ashes of a fallen city.\""
			},
			["McKayla, Bane of Hierarchy-Sun"] = {
				Name = "Captain Newman, Plunderer O' Beasts",
				AttackEffect = "Slash",
				Id = 13660840700,
				CustomReminder = {
					["Pirate Freedom Fighter"] = "You can cast cards with Liberate in your graveyard if you've attacked and destroyed a fighter this turn. Cards cast this way are fading."
				},
				Bio = "\t\t\t\tTHE WARRIOR WHO SPAT IN THE FACE OF THE GRAND PIRATE KING!\n\t\t\t\tTHE REBEL WHO BLEW UP THE SHIP OF THE WICKED NAVY RIPPER!\n\t\t\t\tTHE MAN WHO LOOKED AT DAVY JONES' LOCKER AND DIDN'T WALK THE PLANK!\n\t\t\t\t'IS NAME: <b>CAPTAIN JACKSON BEVERLY NEWMAN!!</b> \n\t\t\t\t"
			},
			["Koneko-Chan, 猫たちの最後の抵抗"] = {
				Name = "Koneko-Chan, 猫たちの最後の抵抗",
				AttackEffect = "Flare",
				AltArt = true,
				Id = 15408369701,
				Commissioner = { 24055311 },
				CustomReminder = {
					["Cat Freedom Fighter"] = "You can cast cards with Liberate in your graveyard if you've attacked and destroyed a fighter this turn. Cards cast this way are fading."
				},
				Bio = "<i>Hitoshi-san. You know Raku-chan wouldn't have wanted this.</i>"
			},
			["ProfessorHecc, Necromantic Feline"] = {
				Id = 79384998641976,
				Name = "ProfessorHecc, Necromantic Feline",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 457,
				Bio = "Nyaaaaaaaaaaaaaaaaaaaa theres just something about bringing the dead back, yknow?"
			},
			["McKayla Newman-I"] = {
				Id = 100969656765463,
				Name = "McKayla Newman",
				AttackEffect = "Punch",
				Commissioner = { 24055311 },
				Bio = "...you damned cat."
			},
			["Oninaka, The Red Mist"] = {
				Id = 83975949522454,
				Name = "Oninaka, The Red Mist",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 757,
				Bio = "Among the many Fixers of the Backstreets, she was one of the few who could go toe to toe with the Head and the Claw. She was called the Red Mist among the Backstreets' denizens. That was a name she earned protecting us from all kinds of threats and maneuvers from the outside."
			}
		},
		Health = 1350,
		Power = 350,
		Rarity = "Legendary",
		AttackEffect = "Crowbar",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 2, Red = 3, Green = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Zombie Freedom Fighter"] = "You can cast cards with liberate in your graveyard if you've attacked and destroyed a fighter this turn. Cards cast this way are fading."
		},
		SummonAnimation = "McKaylaSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select a card in your graveyard. Shuffle the other cards into your deck.<br/>Whenever this card attacks: Each card in your graveyard gains liberate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"TargetAllyInGraveyard"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Deck_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "NotEVTarget"
					}
				},
				OnAttack = {
					Power = { { "GivePassive", "Liberate" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "All"
					}
				}
			}
		},
		Bio = "\"You think I'm ever gonna believe that scheme, kid? We've been promised less before. Guess what we got?\""
	},
	["Bloxburg Protestor"] = {
		Id = 12506946858,
		Name = "Bloxburg Protestor",
		AltCards = {
			["Bloxburg Protestor-Sun"] = {
				Name = "Pirate Janitor",
				AttackEffect = "Recyclables",
				Id = 13695481066,
				Bio = "Hired to clean all the dead bodies of daily fights."
			},
			Ringo = {
				Id = 136674087244528,
				Name = "Carol",
				AltArt = true,
				PremiumArt = 275,
				Bio = "She still isn't over accidentally getting the world record highest kill count in history."
			},
			["Paw Stars"] = {
				Id = 107186023663943,
				Name = "Paw 🐾 Stars",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 404,
				Bio = "I'm a picture-perfect face with that wild in my veins<br/>You can hear it in my <b><font color=\"#00FF00\">growl, growl, growl, growl</font></b>"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select any number of cards from the top 4 cards of your deck. Destroy those cards and randomly put the rest on top of your deck.",
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
						Condition = { TopCard = 4 },
						MinTargets = 0,
						MaxTargets = 4,
						SelectionDescription = "any number of cards"
					}
				}
			}
		},
		Bio = "Can't we just have a WHOLE century without anything bad happening for Pete's sake?!"
	},
	["Katharan Rebuilder"] = {
		Id = 12333596480,
		Name = "Katharan Rebuilder",
		AltCards = {
			["Katharan Rebuilder-Summer"] = {
				Name = "Silverhair Boatswain",
				AttackEffect = "Hammer",
				GraveAddant = "Katharan Rebuilder-Summer",
				Id = 13627061295,
				Bio = "<b>\"What d' ya call a criminal shipwright? A shipwrong! Bahahahaha!!\"</b> - The Local Jester, Been Missing for 26 Days"
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "BrickThrow",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 1, Red = 1, Green = 1 },
		Liberate = true,
		GraveAddant = "Katharan Rebuilder",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Put a copy of it into your graveyard.",
			Ability = {
				OnDeath = {
					Power = { { "GraveAdd", "GraveAddant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The refugees of the Federation Conquest will fight for peace and quiet."
	},
	["Civilian Rebel"] = {
		Id = 12154412901,
		Name = "Civilian Rebel",
		AltCards = {
			["Civilian Rebel-Sun"] = {
				Id = 13660421241,
				Name = "Deckhand Rail-splitter",
				AttackEffect = "Axe",
				Bio = ""
			},
			flagpoleries = {
				Id = 13740927808,
				Name = "flagpoleries",
				AttackEffect = "Bite",
				Commissioner = { 78492751, 1105140151 },
				AltArt = true,
				PremiumArt = 57,
				Bio = "CRAZY EISENHOWER AINT GETTING OUT OF THIS ONE!!!"
			},
			["noob45312 the dog welder"] = {
				Id = 13771266180,
				Name = "noob45312 the dog welder",
				AttackEffect = "Flare",
				Commissioner = { 269771297, 68738329 },
				AltArt = true,
				PremiumArt = 55,
				Bio = "His unique technique of welding dogs to peoples faces is surprisingly effective."
			},
			["Zero & Manix at Blox Cards"] = {
				Id = 14781697100,
				Name = "Zero & Manix at Blox Cards",
				AltArt = true,
				PremiumArt = 113,
				Commissioner = { 1082444751, 105850517 },
				AttackEffect = "Knife",
				Bio = "A persistent artist and a retired card merchant, gathered together to create chaos."
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Common",
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
	["Rebel Physician"] = {
		Id = 12162937789,
		Name = "Rebel Physician",
		AltCards = {
			["Rebel Physician-Sun"] = {
				Id = 13660507386,
				Name = "Pirate Physician",
				AttackEffect = "Whirlpool",
				Bio = "\"Remember: When going on a long sea trip, bring a whole barrel of oranges to prevent dying from Scurvy!\""
			},
			["Strongest Bingus"] = {
				Id = 16446074386,
				Name = "HighlandHigh",
				AltArt = true,
				EffectAnimation = "MidStormEffect",
				Bio = "He's not even Scottish. Can you believe it?"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "BrickThrow",
		EffectAnimation = "RegenCoilSelf",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a card leaves your graveyard: All allied fighters gain 50 health.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "Heal", 50 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Stubbornness can only last so long."
	},
	["Necroforensic Researcher"] = {
		Id = 12560327965,
		Name = "Necroforensic Researcher",
		AltCards = {
			["Necroforensics Researcher-C"] = {
				Name = "Hellhail Chimneycrusher",
				Id = 15486360944,
				AttackEffect = "FirePunch",
				Bio = "How to make a family cold and giftless with one simple trick!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Swamp",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you seance a card: Give yourself a choice card, except it's fading.\nWhenever this card attacks: Seance a card in your graveyard that has been cast or died this game.",
			Ability = {
				OnAllySeance = {
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
					Target = "Ally",
					MetaData = { Fading = true }
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
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
			Seancing = true
		},
		Bio = "\"We're building the future. We're changing the world. We're saving the people.\""
	},
	["Necroforensic Interrogator"] = {
		Id = 12560326618,
		Name = "Necroforensic Interrogator",
		AltCards = {
			["Necroforensic Interrogator-C"] = {
				Name = "Hellhail Hounds",
				Id = 15628929507,
				AttackEffect = "FirePunch",
				Bio = "FETCH ME THEIR Gifts!!!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Revolver",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "ReincarnationF",
			Description = "When this card is cast: Select an unranked card in your opponent's hand that costs 6 or fewer total studs. You seance that card, then your opponent draws a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealCard", 30, "CustomTarget" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Opponent", "Field_Ally", true, false },
							"CustomZoneTarget"
						},
						{ "Draw", 1, "Opponent" }
					},
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = { CostOrLess = 6, Unranked = true },
						SelectionDescription = "a card from your opponent's hand"
					},
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "TotalCostOrLess",
						Modifier = 6
					}
				}
			},
			Seancing = true
		},
		Bio = "\"I know you did it, Thec. Save your soul before the gods above judge it: Where did you hide the girl?\""
	},
	Zoomba = {
		Id = 12560333050,
		Name = "Zoomba",
		AltCards = {
			["Zoomba-Banner"] = {
				Name = "Zermostat",
				Id = 12653974657,
				Bio = "Never put your house's heat in the hands of a bored thermostat."
			},
			["Zoomba-C"] = {
				Name = "Wish Detector",
				Id = 15564057046,
				Bio = "A robot designed by Deuz R. Walter. Its purpose is to scavenge across harsh, brisk weather in search of stray wishes and making sure they come true."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Electric",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 3 },
		EffectVariable = 0,
		EffectAnimation = "Zoomba",
		Effect = {
			Name = "Halloween",
			Description = "Whenever you seance a card: Draw a fleeting card.",
			Type = "OnAllySeance",
			Power = { { "Draw", 1 } },
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "In exchange for providing their brains post-mortem, their families are guaranteed to have full financial insurance."
	},
	["Say Goodbyes"] = {
		Id = 12560325246,
		Name = "Say Goodbyes",
		AltCards = {
			["Say Goodbyes-C"] = {
				Name = "Heart Thawing",
				Id = 15407461691,
				Bio = "Apate's heart, once permeated with frost, now shines with light and warmth. \"It's so over...\", thus spoke the Hellhailers."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 3, Blue = 3, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 4 cards.\nSelect up to 4 unranked cards in your hand that each cost 4 or fewer total studs. Seance those cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 4, "Ally" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Field_Ally", true, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
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
						Condition = { CostOrLess = 4, Unranked = true },
						MinTargets = 0,
						MaxTargets = 4,
						SelectionDescription = "up to four cards from your hand to séance"
					}
				}
			},
			Seancing = true
		},
		Bio = "Apollo delved deep into the Necroenzyme's practical applications, from the police to funeral workers. He did the work Eisenhower was too distraught to finish."
	},
	["Hardboiled Detective"] = {
		Id = 12560330643,
		Name = "Spirit Subpoena",
		AltCards = {
			["Spirit Subpoena-C"] = {
				Name = "Holiday Blues",
				Id = 15486360778,
				AttackEffect = "FirePunch",
				Bio = "While their methods are still unknown, it has been observed that the Hellhail have the ability to produce some sort of miasma that upon exposure, causes extreme emotional detriment. Observed symptoms include depression, social reclusiveness, and the total absence of festiveness; also known as Holiday Blues."
			},
			["Conformity Complex"] = {
				Id = 133607475450869,
				Name = "Conformity Complex",
				Commissioner = { "Cheezyztherecorder" },
				AttackEffect = "Jab",
				Bio = "\"Doesn't it feel nice to fit in with the crowd?\" - Cheezyz"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 2, Yellow = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw a card.\nSeance a card in your graveyard that's died or was cast.\nAll allied fighters gain 100 Power until their next end step.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1, "Ally" },
						{
							"MoveZone",
							{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{ "TempStrengthen", 100, "Ally" }
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
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"You've been invaluable, Margaret. Thanks for telling us who killed you.\""
	},
	["Counsel Engine"] = {
		Id = 12560351263,
		Name = "Counsel Engine",
		AltCards = {
			["Counsel Engine-C"] = {
				Name = "Wrap-O-Matic",
				Id = 15564056898,
				AttackEffect = "FirePunch",
				Bio = "This bad boy can wrap up 15 presents/min thanks to its four arms and free-spinning segmented body. It's also a great hugger too!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Electric",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select an unranked fighter card in your deck that costs 4 or fewer total studs. Seance that card. Trigger its effects as though it was cast.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Field_Ally", false, false },
						"CustomZoneTarget"
					} },
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { CostOrLess = 4, Fighter = true, Unranked = true },
						SelectionDescription = "a fighter to seance",
						MinTargets = 1,
						MaxTargets = 1
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
			Seancing = true,
			AllowDeadAggressorTriggers = true,
			TriggerOnSummons = true
		},
		Bio = "The greatest scientific minds of Bloxburg banded together, literally <i>and</i> figuratively, though mostly mechanically."
	},
	["Lawyer of Last Moments"] = {
		Id = 12288062878,
		Name = "Lawyer of Last Moments",
		AltCards = {
			["Lawyer of Conclusive Dusk"] = {
				Id = 13947244158,
				Name = "Lawyer of Conclusive Dusk",
				AttackEffect = "Hammer",
				PackDisplayOverride = "IcyTea",
				Bio = "The Enzyme had made finding the truth so easy. Justice was being served... So why do I feel like this is the beginning of something far more consequential..."
			},
			["Lawyer of Last Moments-C"] = {
				Id = 15176634059,
				Name = "Hellhail Imps",
				AttackEffect = "IcePunch",
				Bio = "\"These little Hellhail Imps as much as they love ruining the festive mood, they still hate each other ever since the \"Snowball Fight Incident\"\""
			}
		},
		Health = 900,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you seance a card: This card gains 100 Power.",
			Ability = {
				OnAllySeance = {
					Power = { { "Strengthen", 100, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"They say dead men tell no tales. Prove them wrong, tell me everything.\""
	},
	["Apollo Scott, Visionary"] = {
		Id = 12144398727,
		Name = "Apollo Scott, Visionary",
		AltCards = {
			["Apollo Scott, Visionary-Offer"] = {
				Name = "Apollo, Robotics Revolutionist",
				ArtAnimation = "ApolloRoboticsRevolutionist",
				Id = 12653952019,
				Bio = "In the midst of his charitable actions, something else brew within the company. Something outside of his knowledge."
			},
			["Apollo Scott, Visionary-C"] = {
				Name = "Deuz R. Walter, Otherworld Inventor",
				Id = 15252288534,
				Bio = "\"Please don't call my work 'christmas magic'. This... is SCIENCE!\"\n\"Okay honey, so about the Jolly Coefficient...\"\n"
			},
			["Corporate Executive Cheezys"] = {
				Id = 109491255014457,
				Name = "Corporate Executive Cheezys",
				PremiumArt = 378,
				AltArt = true,
				Bio = "Not too fond of Javionese, Lordbreakers, or poor people."
			}
		},
		Health = 1600,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Storm",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4, Yellow = 4 },
		EffectVariable = 0,
		SummonAnimation = "ApolloSummon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Seance 3 cards in your graveyard and 3 cards in your opponent's graveyard.",
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
	["Morgue Merchant"] = {
		Id = 12463901399,
		Name = "Morgue Merchant",
		AltCards = {
			["Morgue Merchant-C"] = {
				Name = "LAZR Lasso Lad",
				Id = 15486360580,
				AttackEffect = "FirePunch",
				Bio = "Keep you bound and blinding you at the same time!"
			},
			["Miles (from marketing.)"] = {
				Id = 129889200037701,
				Name = "Miles (from marketing.)",
				PremiumArt = 326,
				AltArt = true,
				Bio = "\"I'm not a fan of these ideas, guys. Who would want to watch a show about a vial of Necroenzyme battling it out in a reality show?!\""
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Swamp",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seance 2 cards in your graveyard that've died or were cast.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"MoveZone",
							{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
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
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "Providing a service reliant reviving the dead could never keep its integrity."
	},
	["Kingrin, Surrounded by Familey"] = {
		Id = 106401463510004,
		Name = "Kingrin, Surrounded by Familey",
		AltCards = {
			["Kingrin, Surrounded by Familey-Offer"] = {
				Name = "Povvo Slugger Kingrin",
				Id = 121367612608915,
				ArtAnimation = "Kingrin",
				PackDisplayOverride = "Necrosyndicates Collector Box",
				Bio = "<b>HOMERUN!!!</b>"
			},
			["Fall & Fluffle, Fraudulent Forgers"] = {
				Name = "Astro and Fluffle: Rare Enthusiasts",
				Id = 102863552147223,
				AttackEffect = "DoomStorm",
				AltArt = true,
				Bio = "Crashing this market with no survivors."
			},
			Macabre = {
				Name = "Macabre",
				Id = 14912918313,
				AttackEffect = "Punch",
				AltArt = true,
				Commissioner = { 848438321 },
				PremiumArt = 122,
				Bio = "\"TRY HIDING YOUR DOORS NOW, IMMA DROPKICK THEM ALL\""
			},
			["Kingrin, Surrounded by Familey-V"] = {
				Id = 16056314980,
				Name = "Queengrin",
				AttackEffect = "Punch",
				Bio = "Star of Bloxburg's Besties Season 42. With only one friendslist spot left, she's hoping to really make it count."
			},
			["PROJECT: KHARON"] = {
				Id = 91790621594295,
				Name = "PROJECT: KHARON",
				AttackEffect = "XhartyrSlash",
				PremiumArt = 322,
				AltArt = true,
				Bio = "\"The Ferryman has come for you.\""
			},
			["mrt903, the World-Eater Sovereign"] = {
				Id = 122545593391286,
				Name = "mrt903, the World-Eater Sovereign",
				PremiumArt = 852,
				Commissioner = { "mrt903" },
				AltArt = true,
				Bio = "\"When you become untouchable you're unable to touch\""
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Legendary",
		AttackEffect = "Hammer",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		CustomReminderRansack = true,
		Color = "Red",
		Cost = { Red = 4, Yellow = 4, Neutral = 4 },
		TriggerInHand = true,
		EffectVariable = 0,
		RansackCount = 0,
		SummonAnimation = "KingrinSummon",
		SummonAnimationEffect = true,
		CustomReminder = {
			["Lord of Rubble"] = "The rest of Kingrin's effect triggers regardless of how many cards you Ransack."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack any number of cards, then apply effects based on the number of cards you've obliterated this game.\n15+ - All allied fighters gain 500 Power.\n30+ - Unlock all allied fighters and they gain overload.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Playertable", "TotalObliterateCount", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 14, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 500, "Nil" }
						},
						{ "Strengthen", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Playertable", "TotalObliterateCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 29 }
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
						{ "Unlock", 9999, "Ally" },
						{ "GivePassive", "Overload", "Ally" }
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "TotalObliterateCount", "Nil" }
						},
						{
							"ReplaceDescription",
							"(Cards Obliterated this game: Variable) \nWhen this card is cast: Ransack any number of cards, then count the number of cards you've obliterated this game. X is that number.\nIf X is 15 or more, all allied fighters gain 500 Power.\nIf X is 30 or more, unlock all allied fighters and they gain Overload.",
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "A father's weakness is his strength: Family."
	},
	["Carnage Crowd"] = {
		Id = 116778034007229,
		Name = "Carnage Crowd",
		AltCards = {
			["Carnage Crowd-V"] = {
				Id = 16283036969,
				Name = "Katie Powell, Friendless",
				AttackEffect = "Punch",
				Bio = "\"You know this is like your 10th audition, right?\" \"Just trust me! Its not like I'm forming like a gang or anything.\""
			}
		},
		Health = 750,
		Power = 650,
		Rarity = "Rare",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		AlternateCostRequirement = { "Playertable", "Me", 1, 9999, "ObliterateCount" },
		AlternateCost = { IgnoreColor = "Neutral" },
		Cost = { Red = 3, Yellow = 3, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If you've obliterated a card this turn, cast this card ignoring its {W} cost.\nDuring your end step: Destroy the bottom card of your deck, then recur an allied card with the lowest total stud cost.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "RandomLowestCost"
					}
				}
			}
		},
		Bio = "\"Ignore them. Those who rule by fear have deep fear of apathy.\"<br/>-Astarossa, Mayor of Bloxburg"
	},
	["Found Familey"] = {
		Id = 76822736302744,
		Name = "Found Familey",
		AltCards = {
			["Found Familey-V"] = {
				Id = 16117246453,
				Name = "Chip, Behind the Scenes",
				AttackEffect = "Punch",
				Bio = "Celebrities are people too, guys..."
			},
			["The Lost Hunters"] = {
				Id = 140613746265536,
				Name = "The Lost Hunters",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 499,
				Bio = "The world went still. Friends become family."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		ChargeRequirement = { "Playertable", "Me", 1, 9999, "ObliterateCount" },
		Cost = { Red = 1, Yellow = 3 },
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "If you've obliterated a card this turn, this card has haste.\nWhenever this card attacks: Select a card from the top 2 cards of your opponent's graveyard. Put that card into your hand and the other into your graveyard.",
			Ability = {
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Opponent", "Hand_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "GraveZone_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					},
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = { BottomCard = 2 },
						SelectionDescription = "A card from your Opponent's Graveyard"
					}
				}
			}
		},
		Bio = "There is nowhere safer than beside the Smileys and nowhere more dangerous than in front of them."
	},
	["Hazing Ritual"] = {
		Id = 123039318451732,
		Name = "Hazing Ritual",
		AltCards = {
			["Hazing Ritual-V"] = {
				Id = 16283036607,
				Name = "Shameful Elimination",
				AttackEffect = "Punch",
				Bio = "If you lose embarrasingly hard in the earlygame, the least you could do is go gracefully."
			},
			["Pit Stop"] = {
				Id = 77418736420341,
				Name = "Pit Stop",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 459,
				Bio = "NORMALBIKE! HOW DID YOU FIND ME?!?!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		CustomReminderNascent = true,
		CustomReminderFleeting = true,
		Addant = "Nascent Stud",
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 400 damage to a target fighter.\nRansack 4. If you do, give yourself 2 fleeting Nascent Studs.",
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
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally",
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "Anyone can join the Familey on one simple condition: Impress the boss with your brutality."
	},
	["Cackling Hell Biker"] = {
		Id = 12146760273,
		Name = "Cackling Hell Biker",
		AltCards = {
			["Cackling Hell Biker-V"] = {
				Id = 16117246360,
				Name = "Cringeworthy Comedian",
				AttackEffect = "Punch",
				Bio = "\"You give me a taco, I'm gonna eat it! You give me a 2x4, I'm gonna eat it!!!\""
			},
			["kuzueimu, Professional of Myogi"] = {
				Id = 87404077056380,
				Name = "kuzueimu, Professional of Myogi",
				PremiumArt = 317,
				AltArt = true,
				Bio = "The Myogi's Valley is deep. You should be careful of your life."
			}
		},
		Health = 100,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Flare",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 1, Neutral = 1, Yellow = 1 },
		Overload = true,
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, unlock this card.",
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
					Power = { { "Unlock", 999, nil, nil, nil, "Motorcycle" } },
					Target = "Self"
				}
			}
		},
		Bio = "<b>BAD TO THE BONE</b>"
	},
	["Snickering Skewer"] = {
		Id = 12146801792,
		Name = "Snickering Skewer",
		AltCards = {
			["The Solciety"] = {
				Id = 12703098277,
				Name = "Solstice :)",
				AttackEffect = "Bottle",
				AltArt = true,
				Bio = "Awww... You should smile more."
			},
			["Kin's Grin"] = {
				Name = "Kin's Grin",
				AttackEffect = "LaserYellow",
				Id = 14169519352,
				Untradeable = true,
				Commissioner = { 857858021, 8289996 },
				PackDisplayOverride = "Smiley Mask",
				Bio = "A Familey."
			},
			["Snickering Skewer-V"] = {
				Id = 16206876103,
				Name = "Blatant First Boot",
				AttackEffect = "Knife",
				Bio = "Violent, antisocial, AND a misogynist? Why is he even on here?"
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Neutral = 2, Yellow = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		CustomReminder = {
			["Resurrect the Familey"] = "When a Zombified fighter leaves play, obliterate it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, recur an allied fighter card. It gains 100 Health and Power and is zombified.",
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
					MetaData = { IncreaseHealth = 100, IncreasePower = 100, Zombified = true }
				}
			}
		},
		Bio = "Running at someone with a giant spear in your hand would intimidate a lot of people."
	},
	["Laughing Stock"] = {
		Id = 12146793649,
		Name = "Laughing Stock",
		AltCards = {
			["Laughing Stock-V"] = {
				Id = 16056308254,
				Name = "Unkempt Underdog",
				AttackEffect = "Punch",
				Bio = "Placed second-to-last in pre-season polling just from his looks alone."
			},
			["Undead Hunter Grim"] = {
				Id = 17760522997,
				Name = "Undead Hunter Grim",
				AltArt = true,
				PremiumArt = 265,
				Bio = "\"Veh Rikuul\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Neutral = 2 },
		CustomReminderRansack = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Put 3 red fighter cards into your graveyard.\nWhen this card is ransacked: You lose 500 life and draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomGraveAdd", "MonoOnlyorRedCost Red Fighter" },
						{ "RandomGraveAdd", "MonoOnlyorRedCost Red Fighter" },
						{ "RandomGraveAdd", "MonoOnlyorRedCost Red Fighter" }
					},
					Target = "Ally"
				},
				OnRansacked = {
					Power = {
						{ "Draw", 1 },
						{ "Cost", 500 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The name's not as funny when you consider the rifle he's holding."
	},
	["Smiley Slasher"] = {
		Id = 12146798845,
		Name = "Smiley Slasher",
		AltCards = {
			["Smiley Slasher-V"] = {
				Id = 16117245873,
				Name = "Token Celebrity (Using A Fake Name)",
				AttackEffect = "Punch",
				Bio = "Wait, is that...?"
			},
			BrickBattler = {
				Id = 118617534218990,
				Name = "BrickBattler",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 533,
				Bio = "I used to be a part of a group, but I work alone now."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "British",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Red = 1, Neutral = 1, Yellow = 1 },
		Overload = true,
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
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
	["Chuckling Arsonist"] = {
		Id = 12703644087,
		Name = "Chuckling Arsonist",
		AltCards = {
			["Chuckling Arsonist-V"] = {
				Id = 16207128964,
				Name = "Totally-Not-A-Narcissist",
				AttackEffect = "Punch",
				Bio = "literally me fr"
			},
			["Chuckling Arsonist-I"] = {
				Id = 82829063572779,
				Name = "Chuckling Arsonist",
				AttackEffect = "Punch",
				Bio = ""
			}
		},
		Health = 300,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Bottle",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Ransack 3.\nIf you do, deal 200 damage to a target enemy fighter. It loses 200 Power.",
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
					Power = {
						{ "Damage", 200, nil, nil, nil, "ThrowBottle" },
						{ "Weaken", 200 }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "Kick the hornet's nest, face the hornet's ire."
	},
	["Povvo Street"] = {
		Id = 126468971756147,
		Name = "Povvo Street",
		AltCards = {
			["Povvo Street-V"] = {
				Id = 16206876330,
				Name = "The Besties' Mansion",
				AttackEffect = "Knife",
				Bio = "Home of Robloxia's #2 hit reality show! (#1 is Outlaster...)",
				Terrariant = "Vengeant Animus-V",
				Effect = {
					Name = "Reincarnation",
					Description = "During your end step: The player with the fewest cards in hand draws a card.\nThe player with the fewest fighters in play summons a 200/200 Citizen with no abilities.\nThe player with the fewest cards in their graveyard puts 2 Citizens into their graveyard.",
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
									{ "OverGate", "Hand_Opponent", "All", "Nil" },
									"Self"
								},
								{ "Draw", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "Hand_Opponent", "All", "TheirHand" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Hand_Ally", "All", "Nil" },
									"Self"
								},
								{ "Draw", "Variable", "Opponent" },
								{
									"AlterEV",
									{ "Load", "Field_Opponent", "All", "MyField" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "Summon", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "Field_Opponent", "All", "TheirField" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Field_Ally", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "Summon", "Variable", "Opponent" },
								{
									"AlterEV",
									{ "Load", "GraveZone_Opponent", "All", "MyGrave" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "GraveZone_Opponent", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "GraveAdd", "Variable", "Ally" },
								{ "GraveAdd", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "GraveZone_Opponent", "All", "TheirGrave" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "GraveZone_Ally", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "GraveAdd", "Variable", "Opponent" },
								{ "GraveAdd", "Variable", "Opponent" }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = { {
								"AlterEV",
								{ "Set", "Math", "Citizen-V", "Nil" },
								"Self"
							} },
							Target = "Self"
						}
					}
				}
			},
			["Myogi, Playground of Street Racer"] = {
				Id = 98341795891397,
				Name = "Myogi, Playground of Street Racer",
				Terrariant = "Starlight Sprada",
				Effect = {
					Name = "Reincarnation",
					Description = "During your end step: The player with the fewest cards in hand draws a card.\nThe player with the fewest fighters in play summons a 200/200 Street Racer with no abilities.\nThe player with the fewest cards in their graveyard puts 2 Citizens into their graveyard.",
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
									{ "OverGate", "Hand_Opponent", "All", "Nil" },
									"Self"
								},
								{ "Draw", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "Hand_Opponent", "All", "TheirHand" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Hand_Ally", "All", "Nil" },
									"Self"
								},
								{ "Draw", "Variable", "Opponent" },
								{
									"AlterEV",
									{ "Load", "Field_Opponent", "All", "MyField" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Field_Opponent", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "Summon", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "Field_Opponent", "All", "TheirField" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "Field_Ally", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "Summon", "Variable", "Opponent" },
								{
									"AlterEV",
									{ "Load", "GraveZone_Opponent", "All", "MyGrave" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "GraveZone_Opponent", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "GraveAdd", "Variable", "Ally" },
								{ "GraveAdd", "Variable", "Ally" },
								{
									"AlterEV",
									{ "Load", "GraveZone_Opponent", "All", "TheirGrave" },
									"Self"
								},
								{
									"AlterEV",
									{ "OverGate", "GraveZone_Ally", "All", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{ "GraveAdd", "Variable", "Opponent" },
								{ "GraveAdd", "Variable", "Opponent" }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = { {
								"AlterEV",
								{ "Set", "Math", "StreetRacer", "Nil" },
								"Self"
							} },
							Target = "Self"
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 440,
				Bio = "\"This course is very twisty and has a lot of corners. Keep your hands on the wheel unless you want to die.\" -kuzueimu, Professional of Myogi"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 2, Yellow = 2 },
		Terrain = true,
		Terrariant = "Vengeant Animus",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: The player with the fewest cards in hand draws a card.\nThe player with the fewest fighters in play summons a 200/200 Citizen with no abilities.\nThe player with the fewest cards in their graveyard puts 2 Citizens into their graveyard.",
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
							{ "OverGate", "Hand_Opponent", "All", "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "Hand_Opponent", "All", "TheirHand" },
							"Self"
						},
						{
							"AlterEV",
							{ "OverGate", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "Field_Opponent", "All", "MyField" },
							"Self"
						},
						{
							"AlterEV",
							{ "OverGate", "Field_Opponent", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{ "Summon", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "Field_Opponent", "All", "TheirField" },
							"Self"
						},
						{
							"AlterEV",
							{ "OverGate", "Field_Ally", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{ "Summon", "Variable", "Opponent" },
						{
							"AlterEV",
							{ "Load", "GraveZone_Opponent", "All", "MyGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "OverGate", "GraveZone_Opponent", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{ "GraveAdd", "Variable", "Ally" },
						{ "GraveAdd", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Load", "GraveZone_Opponent", "All", "TheirGrave" },
							"Self"
						},
						{
							"AlterEV",
							{ "OverGate", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{ "GraveAdd", "Variable", "Opponent" },
						{ "GraveAdd", "Variable", "Opponent" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", "Citizen", "Nil" },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Bloxburg's poorest live on a single street, abandoned by wider society. So, they banded together, forming a pact."
	},
	Citizen = {
		Id = 12180549369,
		Name = "Citizen",
		AltCards = {
			["Portrait of the Vessel as a young Hivemind"] = {
				Id = 15176634893,
				Name = "The Singularity",
				AttackEffect = "Divinity",
				Bio = "Note: I'm so sorry Noodlegod..."
			},
			["Smiley Gang Alt"] = {
				Id = 15706304443,
				Name = "Smiley Gang",
				AttackEffect = "Divinity",
				Bio = "Going on a killing spree again?"
			},
			["Citizen-V"] = {
				Id = 16056311953,
				Name = "Stagehand",
				AttackEffect = "Punch",
				Bio = "Mac Iris pays more than this, but at least I get to meet Chip!"
			},
			StreetRacer = {
				Id = 70715236297783,
				Name = "Street Racer",
				AttackEffect = "Punch",
				Bio = "\"We may not be the best, but our driving skills and love for cars are better than anyone else's.\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Keep calm and carry on keep calm and carry onkeepcalmandcarryonkeepcalmandcarryonkeepcalmandcarryon"
	},
	Bliss = {
		Id = 12144404390,
		Name = "Bliss",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 0 },
		TokenGenZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "(4 allied fighters have died in a single one of your turns. You're in Bliss for the rest of the game, strengthening your PLURRAL cards.)",
			Ability = {
				Nil = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "No more thoughts.\nNo more pain.\nOnly pleasure.\n<b><i>Forever.</i></b>"
	},
	["Zombified Catgirl"] = {
		Id = 12145045339,
		Name = "Zombified Catgirl",
		AltCards = {
			["Zombified Catgirl-FF"] = {
				Id = 13903611994,
				Name = "Feline Fury",
				AttackEffect = "Microphone",
				Summonant = "Zombified Catgirl-FF",
				Bio = ""
			},
			["Zombified Catgirl-Hal"] = {
				Id = 14959555664,
				Name = "Feline Footsman",
				AttackEffect = "Scratch",
				Summonant = "Zombified Catgirl-Hal",
				Bio = "<i>Ready for nyaction!</i>"
			},
			["Zombified Catgirl-RQ"] = {
				Id = 84423316363045,
				Name = "Sweet Memories",
				AttackEffect = "Scratch",
				Summonant = "Zombified Catgirl-RQ",
				Bio = "\"RQ is awesome and cool and awesome and pretty and\" - Bee <br/>\"hfdulohuoahurohanviajohfvmakdjkg\" -RQ"
			},
			Monnie = {
				Id = 81803213127892,
				Name = "Des",
				AttackEffect = "Scratch",
				Summonant = "Monnie",
				Bio = "<b><font color=\"#FF00FF\">Wabbit</font></b>"
			},
			["Zombified Catgirl-Auto"] = {
				Id = 84367032955367,
				AttackEffect = "Scratch",
				Summonant = "Zombified Catgirl-Auto",
				Bio = "xwx owo ewe uwu"
			},
			ShiminDJ1 = {
				Id = 119910250901463,
				Name = "H4RDC0R3 R4V3RS!!!",
				AttackEffect = "Scratch",
				Summonant = "ShiminDJ1",
				Bio = "Another jam from the miracle maker, wizard of the word, MC Undertaker!<br/>Another jam from the miracle maker, miracle, miracle-<br/>Neko Nation!!♪"
			},
			ShiminDJ2 = {
				Id = 135574773885620,
				Name = "H4RDC0R3 R4V3RS!!!",
				AttackEffect = "Scratch",
				Summonant = "ShiminDJ2",
				Bio = "Another jam from the miracle maker, wizard of the word, MC Undertaker!<br/>Another jam from the miracle maker, miracle, miracle-<br/>Neko Nation!!♪"
			},
			["Stray Cat Outside"] = {
				Id = 94046863768473,
				Name = "Stray Cat Outside",
				AttackEffect = "Scratch",
				Summonant = "Stray Cat Outside",
				Bio = "spontaneous avenger event"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
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
	["Tear and Reshape"] = {
		Id = 12145035643,
		Name = "Tear and Reshape",
		AltCards = {
			["Tear and Reshape-Hal"] = {
				Id = 14982556813,
				Name = "Wizard VS Witch",
				Bio = "Will Esumi beat the dastardly witch, or will the wicked poet best her in combat? Find out next time on Catwiz Esumi, Southside's Protector!"
			},
			["Tear and Reshape-ARR"] = {
				Name = "Radiant Reanimation",
				AttackEffect = "Gravity",
				Id = 102877232323064,
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "What's asmall band of thieves' dumb luck compared to an entire civilization's fury?"
			},
			["Tear and Reshape-Auto"] = { Id = 88299503641498 }
		},
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
	["Excited Bouncer"] = {
		Id = 12144967382,
		Name = "Excited Bouncer",
		AltCards = {
			["PLURRAL's Patron"] = {
				Id = 14215772819,
				Name = "PLURRAL's Patron",
				AltArt = true,
				AttackEffect = "Microphone",
				Commissioner = { 1635350549 },
				Bio = "Kickstarting a rave club filled with Catgirls will need a considerable amount of wealth, good thing she know just the guy to call."
			},
			["Excited Bouncer-Hal"] = {
				Id = 14959555833,
				Name = "Northwood Farmer",
				AttackEffect = "Whirlpool",
				Bio = "IF I HEAR BOSS RHYME ONE MORE TIME,\nMY INNER KETTLE'S MOUTH SHALL CHIME."
			},
			["Excited Bouncer-Auto"] = { Id = 81216082417290 },
			["The Once And Soon To Become Sarah"] = {
				Id = 127239756829849,
				Name = "Your Truest, True Self",
				AttackEffect = "XhartyrSlash",
				AltArt = true,
				PremiumArt = 569,
				Bio = "it's you it's you it's youit's youit syouitsyou——##########"
			},
			Rayburm89 = {
				Id = 114300461751271,
				Name = "Rayburm89",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 633,
				Bio = "asdadsasd asdad s a s d a s  d  a  d   s   a  s   d"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Zombified = true,
		Cost = { Neutral = 3, Green = 2, Yellow = 2 },
		CustomReminderBliss = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 200 damage to all fighters and they lose 200 Power. Then if you're in Bliss, put a Green Stud and a Yellow Stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 200, "All" },
						{
							"Damage",
							200,
							"All",
							nil,
							nil,
							nil,
							"BlissClaw"
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
						{
							"AddGenZone",
							{ "Green Stud", 1 }
						},
						{
							"AddGenZone",
							{ "Yellow Stud", 1 }
						}
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "Enter the PLURRALITY and forget all about your troubles. Hopefully for forever!"
	},
	["Animal Experimentation Kit"] = {
		Id = 12144394652,
		Name = "Animal Experimentation Kit",
		AltCards = {
			["Lives of the Party"] = {
				Id = 133193459284920,
				Name = "Lives of the Party",
				AttackEffect = "Microphone",
				Summonant = "Zombified Catgirl-FF",
				Commissioner = { 195876149, 1082444751 },
				AltArt = true,
				PremiumArt = 62,
				Bio = ""
			},
			["Floofy, Life Of The Party"] = {
				Id = 13740926315,
				Name = "Floofy, Life Of The Party",
				AttackEffect = "FloofyScratch",
				AltArt = true,
				PremiumArt = 52,
				Bio = "\"pawty wockews in the nyaouse twonite\""
			},
			["Animal Experimentation Kit-Hal"] = {
				Id = 14973783056,
				Name = "Feline Commandant",
				Summonant = "Zombified Catgirl-Hal",
				AttackEffect = "Scratch",
				Bio = "\"If fighting is sure to result in victory, then you must fight!\" - Sun Tzu"
			},
			["Animal Experimentation Kit-Auto"] = {
				Id = 89196467350742,
				Summonant = "Zombified Catgirl-Auto",
				AttackEffect = "Scratch",
				Bio = "\"Cats are better than men. Can't feel as much pain. Clams are way better. Unable to think, unable to <i>mourn.</i>\""
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Green = 3, Yellow = 3 },
		CustomReminderBliss = true,
		Summonant = "Zombified Catgirl",
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon two 100/100 Zombified Catgirls that're inert in all zones. Then if you're in Bliss, all allied token fighters gain 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "Summonant", 2 },
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
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "AllyToken",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"Cats are better than men. Can't feel as much pain. Clams are way better. Unable to think, unable to <i>mourn.</i>\""
	},
	["Tempted by Redemption"] = {
		Id = 12145041103,
		Name = "Tempted by Redemption",
		AltCards = {
			["Tempted by Redemption-Hal"] = {
				Id = 14979784058,
				Name = "Leave it to Me!",
				EffectAnimation = "Poof",
				Bio = "\"I'm Catwiz Esumi, and I'll be your first and last opponent of this night!\""
			},
			["Tempted by Redemption-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 94192498542567,
				Bio = "\"C-Could I really... make it all go away...? With this...? I can... help them all...? With this...?\""
			},
			["Tempted by Redemption-Auto"] = { Id = 110677983222318 }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 2, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target allied fighter gains 250 Health and Power for each allied fighter in play.\nDestroy all other allied fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 250, "Nil" }
						},
						{ "Strengthen", "Variable", "SingleAlly" },
						{ "Heal", "Variable", "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleAlly"
						},
						{ "Destroy", 30, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "NotEVTarget"
					}
				}
			}
		},
		Bio = "When trying to heal her patients' pain by reviving their lost relatives didn't work, she opted for a more powerful remedy: Removing the ability to feel pain entirely.<br/><br/>She was a fool."
	},
	Fl00fy_Bonez = {
		Id = 12144972838,
		Name = "Fl00fy_Bonez",
		AltCards = {
			["Fl00fy_Bonez-Banner"] = {
				Name = "Fl00fy_Bonez!!",
				Id = 12653944914,
				Bio = "\"Like... y'know, Nyah.\""
			},
			["Fl00fy_Bonez-Offer"] = {
				Name = "Fl00fy_Bonez, Party Animal",
				ArtAnimation = "fl00fy_bonez",
				Id = 12653949582,
				Bio = "Dancin' the nyite away~ ewe"
			},
			Mozart = {
				Name = "N.G.F.",
				AltArt = true,
				Id = 78024001354313,
				Bio = "Congratulations."
			},
			["Fl00fy_Bonez-Hal"] = {
				Name = "Catwiz Esumi!",
				Id = 14973434762,
				EffectAnimation = "Poof",
				Bio = "The Hero of the Cities of Southside! Give it up for Catwiz Esumi!"
			},
			Leii = {
				Id = 133403266874537,
				Name = "Rafis",
				PremiumArt = 328,
				AltArt = true,
				Bio = "Haaiii :3"
			},
			Bauzzy = {
				Id = 99885327597185,
				Name = "Bauzzy",
				AttackEffect = "FloofyScratch",
				AltArt = true,
				PremiumArt = 447,
				Bio = "Can you do infinites with this one too?"
			},
			["Fl00fy_Bonez-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 130717800110139,
				Bio = "A ray of light illuminating the chaotic internet..."
			},
			["Fl00fy_Bonez-Auto"] = { Id = 136022687799475 },
			["Error flame chaser"] = {
				Id = 74159461095538,
				Name = "Error; flame chaser",
				SummonAnimation = "SacrificeSummon",
				AttackEffect = "Katana",
				AltArt = true,
				PremiumArt = 478,
				Bio = "\"Of course, this will be a romantic story like none that has come before. You think so too, right?\" - [Rospender"
			},
			["AceTheKat, Magical Cat Girl"] = {
				Id = 80170746977252,
				Name = "AceTheKat, Magical ᶜᵃᵗGirl",
				AttackEffect = "Scratch",
				ArtAnimation = "nyaaaa",
				AltArt = true,
				PremiumArt = 481,
				Bio = "I like cute furries"
			},
			["Not Ray"] = {
				Id = 95179738653952,
				Name = "Not Ray",
				AttackEffect = "Scratch",
				AltArt = true,
				PremiumArt = 813,
				Bio = "\"Ray has too many alts!\""
			},
			Trevor = {
				Name = "Trevor",
				AttackEffect = "Jab",
				Id = 119100874180763,
				AltArt = true,
				Bio = "Respect my pronouns"
			},
			Pika = {
				Id = 116088182388835,
				Name = "Pika",
				AttackEffect = "Jab",
				ArtAnimation = "Pika",
				AltArt = true,
				PremiumArt = 514,
				Bio = "A kitsune with a flaming sword, what more could you ask for?"
			},
			FewschiaFl00fy = {
				Id = 78268645081411,
				Name = "Fl00fy_Bonez",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 516,
				Commissioner = { 24055311 },
				Bio = "Haiii~!!!"
			},
			["Samantha, Lasermancer"] = {
				Id = 133484091330358,
				Name = "Samantha, Lasermancer",
				AttackEffect = "LaserRed",
				SummonAnimation = "SummonIris",
				AltArt = true,
				PremiumArt = 572,
				Bio = "I'm tired of this Liam!"
			},
			["Crimson Catboyified"] = {
				Id = 107944939091430,
				Name = "Crimson, Catboyified",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"rawr, x3, nuzzles.. uwu..\"<br/>\"eugh.. i genuinely hate saying all of that out.\""
			},
			["Jesse, Number 1 Fl00fy fan"] = {
				Id = 71411834948380,
				Name = "Jesse, Number 1 Fl00fy fan",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 641,
				Bio = "yes I like cat girls"
			},
			Akari = {
				Id = 90298171062856,
				Name = "Akari",
				Commissioner = { "British_Remilia" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 730,
				Bio = "The fox that claims to have nine tails saying she's just hiding one of them when in reality she only has eight tails."
			},
			Floofy_Bonez = {
				Id = 131696002634292,
				Name = "Floofy_Bonez",
				Commissioner = { "Annoyed_Avenger" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 763,
				Bio = "check out candlelit hours"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "FloofyScratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 3, Green = 4, Yellow = 2 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		SummonAnimation = "Fl00fySummon",
		SummonAnimationEffect = true,
		CustomReminder = {
			["Dance the Pain Away"] = "A terrified fighter is obliterated during its end step."
		},
		PreloadAssets = {
			"rbxassetid://12593465689",
			"rbxassetid://12593465895",
			"rbxassetid://12591294404",
			"rbxassetid://12593095734"
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a copy of a target allied fighter unlocked, except it's terrified.\nThen repeat this effect for all allied fighters if you're in Bliss.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SummonCopy", 30, "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Terrified = true, Unlock = 999 }
				},
				OnEVCheckPass = {
					Power = { { "SummonCopy", 30, "Ally", nil, nil, "BlissTrigger" } },
					Target = "AllyToken",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
					MetaData = { Terrified = true, Unlock = 999 }
				}
			}
		},
		Bio = "\"Mweeoew! The Nekowenzyme seems wike a widdle oppwotunity tew test out some mew transfiguration techniques!\""
	},
	["Harrowing Rejection"] = {
		Id = 12145790182,
		Name = "Harrowing Rejection",
		AltCards = {
			["Harrowing Rejection-Hal"] = {
				Id = 14973369253,
				Name = "Double PAWDOWN!!!",
				Bio = "That wicked witch thinks she can take our town! Southside residents, let's kick 'em back to the swamp!"
			},
			["Harrowing Rejection-Auto"] = { Id = 139640900830338 },
			["The Sheltered One"] = {
				Id = 129403687861446,
				Name = "Stupid Amalgamation",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 438,
				Bio = ".:( ·((:( ("
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		AlternateCostRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
		AlternateCost = { IgnoreColor = "Neutral" },
		Cost = { Green = 2, Yellow = 2, Neutral = 4 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		CustomReminder = {
			["THE PAIN WON'T GO AWAY"] = "A terrified fighter is obliterated during its end step."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "If you're in Bliss, cast this card ignoring its {W} cost.\nSelect up to 2 unranked fighter cards in your graveyard that each cost 4 or fewer total studs. Summon those cards unlocked, except they're terrified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { CostOrLess = 4, Fighter = true, Unranked = true },
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "up to two fighters from your graveyard"
					},
					MetaData = { Unlock = 999, Terrified = true }
				}
			}
		},
		Bio = "\"I-I revived your daughter! I cured her arterial thrombosis! I know I took a decade, but better late than n-never, right? Why do you hate me? <b>WHY DO YOU HATE ME!?</b>\""
	},
	["Pawesome Party"] = {
		Id = 12145015258,
		Name = "Pawesome Party",
		AltCards = {
			["Pawesome Party-Hal"] = {
				Id = 14959556494,
				AttackEffect = "Jab",
				EffectAnimation = "Poof",
				Summonant = "Zombified Catgirl-Hal",
				Name = "Northwood Spy",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Summon two 100/100 Feline Footsman.\nWhen this card dies, if you're in Bliss: Summon two 100/100 Feline Footsman."
				},
				Bio = "Ms. Hilda! I'm attempting to breach Southside premises, but the clicking and clacking of my wooden body keeps alerting the cats!"
			},
			["Pawesome Party-Auto"] = { Id = 128385437257746, Summonant = "Zombified Catgirl-Auto" },
			["Shimin DJ Requiem"] = {
				Id = 99053558732505,
				Name = "Shimin, DJ Requiem",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Summon 2 100/100 Zombified H4RDC0R3 R4V3RS!!! that're inert in all zones.\nWhen this card dies, if you're in Bliss: Summon 2 100/100 H4RDC0R3 R4V3RS!!! that're inert in all zones.",
					Ability = {
						OnSummon = {
							Power = {
								{ "Summon", "ShiminDJ1", "Ally" },
								{ "Summon", "ShiminDJ2", "Ally" }
							},
							Target = "Self"
						},
						OnDeath = {
							Power = {
								{
									"RepeatingSummon",
									{ "ShiminDJ1", 1 },
									"Ally",
									nil,
									nil,
									"BlissTriggerGreen"
								},
								{
									"RepeatingSummon",
									{ "ShiminDJ2", 1 },
									"Ally",
									nil,
									nil,
									"BlissTriggerGreen"
								}
							},
							Target = "Ally",
							EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
						}
					}
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 571,
				Bio = "Isn’t it beautiful? A place of escapism, for people to forget all their woes forever! Enjoy your time here at the PLURRALITY!"
			},
			["Decaying Dipsticks"] = {
				Id = 120693247411414,
				Name = "Decaying Dipsticks",
				Commissioner = { "Annoyed_Avenger" },
				Summonant = "Stray Cat Outside",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 720,
				Bio = "earlier two of them were duking it out while one of em watched"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon 2 100/100 Zombified Catgirls that're inert in all zones.\nWhen this card dies, if you're in Bliss: Summon 2 100/100 Zombified Catgirls that're inert in all zones.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingSummon",
						{ "Summonant", 2 },
						"Ally"
					} },
					Target = "Self"
				},
				OnDeath = {
					Power = { {
						"RepeatingSummon",
						{ "Summonant", 2 },
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
	["Long-Lost Son"] = {
		Id = 12144990561,
		Name = "Long-Lost Son",
		AltCards = {
			["Long-Lost Son-Hal"] = {
				Name = "Feline Flanker",
				Id = 14973784953,
				AttackEffect = "Knife",
				EffectAnimation = "CheezBuff",
				Bio = "Didn't see that clawin'!"
			},
			["Long-Lost Son-Auto"] = { Id = 71263632047744 },
			Sinouh = {
				Name = "Sinouh",
				Id = 77206636628059,
				AltArt = true,
				Bio = "crab if you want it"
			}
		},
		Health = 300,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		CustomReminderBliss = true,
		Cost = { Yellow = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter dies: This card gains 50 Health and Power. It gets an additional 50 Health and Power if you're in Bliss.",
			Ability = {
				OnEVCheckPass = {
					Power = {
						{ "Heal", 50, "Self", nil, nil, "BlissTrigger" },
						{ "Strengthen", 50, "Self" }
					},
					Target = "Self",
					NoBlip = true,
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				},
				OnAllyDeath = {
					Power = {
						{ "Strengthen", 50 },
						{ "Heal", 50 },
						{
							"AlterEV",
							{ "Set", "Playertable", "Bliss", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Sarah's old patient was happy to be with their family. Their family was terrified of a corpse perfectly mimicking their decade-lost son."
	},
	["Raving Rascal"] = {
		Id = 12145023660,
		Name = "Raving Rascal",
		AltCards = {
			["Raving Rascal-Hal"] = {
				Id = 14959556342,
				AttackEffect = "Venomshank",
				EffectAnimation = "SwordThrow",
				Summonant = "Zombified Catgirl-Hal",
				Name = "Northwood Duelist",
				Effect = {
					Description = "When this card is cast: Destroy a target allied fighter, then summon a 100/100 Feline Footsman. Draw a card."
				},
				Bio = "You think papercuts were bad? WRONG, wood chips."
			},
			["Raving Rascal-Auto"] = { Id = 103519914229884, Summonant = "Zombified Catgirl-Auto" },
			["RQ & Bee"] = {
				Id = 104839036515271,
				Name = "RQ & Bee",
				EffectAnimation = "CameraSelf",
				Summonant = "Zombified Catgirl-RQ",
				PremiumArt = 336,
				AltArt = true,
				Bio = "uLtRA PaRTY RAVEMAxX 202-30XX!!!!!"
			}
		},
		Health = 150,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectVariable = 0,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Destroy a target allied fighter, then summon a 100/100 Zombified Catgirl that's inert in all zones. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly", nil, nil, "BlissTriggerRed" },
						{ "Summon", "Summonant", "Ally" },
						{ "Draw", 1, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Unable to cope with her mounting regret, Sarah turned to what kept her going in her youth: Parties that go so hard you can't think."
	},
	["Last Dance Hedonist"] = {
		Id = 12144985466,
		Name = "Last Dance Hedonist",
		AltCards = {
			["Last Dance Hedonist-Hal"] = {
				Name = "Feline Duelist",
				Id = 14959555326,
				Summonant = "Zombified Catgirl-Hal",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Summon a 100/100 Feline Footsman.\nDuring your end step, if this card is in your graveyard and you're in Bliss: Recur this card, except it's Zombified."
				},
				Bio = "A blade sharper than any paw--! I mean claw, damn it."
			},
			["Last Dance Hedonist-Auto"] = { Id = 88358322836352, Summonant = "Zombified Catgirl-Auto" },
			["Shiny Fl00fy_Bonez"] = {
				Id = 87141348820490,
				Name = "Shiny Fl00fy_Bonez & Mocha",
				SummonAnimation = "SummonIris",
				Summonant = "Monnie",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Summon a 100/100 Monnie.\nDuring your end step, if this card is in your graveyard and you're in Bliss: Recur this card, except it's Zombified."
				},
				PremiumArt = 370,
				AltArt = true,
				Bio = "Bunny Bunny Bunny"
			},
			["Revelry Reverie"] = {
				Id = 87875979663854,
				Name = "Revelry, Reverie!",
				Commissioner = { "Annoyed_Avenger" },
				AttackEffect = "Jab",
				ArtAnimation = "triplenya",
				AltArt = true,
				PremiumArt = 723,
				Bio = "But- But my- My win condition..."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		TriggerInGraveZone = true,
		Cost = { Green = 2 },
		Summonant = "Zombified Catgirl",
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a 100/100 Zombified Catgirl that's inert in all zones.\nDuring your end step, if this card is in your graveyard and you're in Bliss: Recur this card, except it's zombified.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
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
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "\"She couldn't cure my chronic scabies, but she saved me from pain and suffering. Why is being ill so bad when I am so <b>HAPPY?</b>\""
	},
	["Hive Terminal"] = {
		Id = 12463889224,
		Name = "Hive Terminal",
		AltCards = {
			["Hive Terminal-AN"] = {
				Name = "Teapot of Wisdom",
				Id = 13832701237,
				AttackEffect = "Whirlpool",
				Bio = "\t\t\t\t<i>A container unlike anything documented, its nectar is said to open the minds of people.</i>\n\t\t\t\t<i>\"QUIT YOUR JOB. MONEY ISN'T REAL.\"</i>\n\t\t\t\t"
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Uncommon",
		AttackEffect = "Electric",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Green = 4, Blue = 4, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: If the allied top card is Green, recur it except it's fading.\nOtherwise this card gains 300 Health and Power.",
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
	["Offroad Mechabike"] = {
		Id = 12145000230,
		Name = "Offroad Mechabike",
		AltCards = {
			["Offroad Mechabike-Banner"] = {
				Name = "Biker",
				Id = 12653966472,
				Bio = "\"You think I'm stupid? Huh? I look stupid to you? I know you aren't telling me everything... You helped me get into this mess! You told me it would be exciting, didn't you? Well I'm bored! I'm done man, I've had it! I want out! And you're gonna tell me how! This stupid game's gonna end now, YOU HEAR ME?\""
			},
			["Offroad Mechabike-Green"] = {
				Name = "Green",
				AttackEffect = "LaserGreen",
				Id = 119541925355508,
				ArtAnimation = "GreenAnimation",
				SummonAnimation = "NoobCall",
				SearchTerms = { "Gelatin", "Gelatinous" },
				Commissioner = { 1840315658, 670841478, 8289996 },
				Bio = "No one knows the origins of this gelatinous creature. One day, a portal appeared and they are as confused as we are! Legends only refer to them as '<font color=\"#4CAF50\"><b>Green</b></font>'."
			},
			["Offroad Mechabike-AN"] = {
				Name = "Tombuck Tippytoes",
				Id = 13822690148,
				AttackEffect = "Jab",
				Bio = "\"NOTE TO SELF : STEALTH BRINGS NO ADVANTAGES TO A TEMPLE OF FALLING TEAPOTS OH GOD\""
			},
			["Altik and Apiri, Joyriders"] = {
				Name = "Altik and Apiri, Joyriders",
				Id = 14169516646,
				AltArt = true,
				PremiumArt = 86,
				Bio = "<i>The dynamic duo of the Offroad Mayhem!</i>"
			},
			["Caitlin's Halberd"] = {
				Name = "Caitlin's Halberd",
				Id = 18298926470,
				AttackEffect = "Slash",
				Bio = "I don't know why but Caitlin with angry look is coming at me with axe thing while I'm typing this on my keyboard but don't worry I think she's just jsdfwergertgergdfg892u4gt024195itef0dgifdv-3w4rtgih23456t"
			}
		},
		Health = 900,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Storm",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Green = 2, Blue = 2, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select a card in your deck. Destroy that card.\nWhenever this card attacks: Recur the top card of your graveyard, except it's fading.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", true, false },
						"TargetAllyDeck"
					} },
					Target = "Self"
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"QuickScanGraveyard"
					} },
					Target = "Self",
					MetaData = { Fading = true },
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "A bit larger to accomodate Caitlin's size. Very adaptable!"
	},
	["Novice Arkhivist"] = {
		Id = 12575064646,
		Name = "Novice Arkhivist",
		AltCards = {
			["Novice Arkhivist-AN"] = {
				Id = 14279360508,
				Name = "Flowerpot",
				Bio = "Picking these flowers feels cruel, but the Floral Tea they provide surpasses that derived from the conventional method of steeping flower petals with tea leaves."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
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
	["Observation Cam"] = {
		Id = 12575049445,
		Name = "Observation Cam",
		AltCards = {
			["Observation Cam-AN"] = {
				Name = "Teapothopter",
				Id = 14169528851,
				AttackEffect = "ClassicRocket",
				Bio = "<i>Flying</i>"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Electric",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Blue = 2, Green = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: If the top card of your graveyard is Green, search your deck for a Blue card.\nOtherwise search your deck for a Green card.",
			Ability = {
				OnSummon = {
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
					Power = { { "RandomTutorfor", "Blue", "Ally", nil, nil, "ScanGraveyard" } },
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "RandomTutorfor", "Green", "Ally", nil, nil, "ScanGraveyard" } },
					Target = "Self"
				}
			}
		},
		Bio = "Funny old era neoancient mytholotic temple motioncam timelapse (320 fps)"
	},
	["Portable Translator"] = {
		Id = 12463893143,
		Name = "Portable Translator",
		AltCards = {
			["Portable Translator-AN"] = {
				Name = "Satealite",
				Id = 14169538164,
				AttackEffect = "Hammer",
				Bio = "Seems like someone successfully managed to mechanically attach a teapot to a satellite in order to coordinate the Teapots instead of just flinging them randomly. The \"Dodge\" part becomes significantly harder when the Teapots are hurling down at you like meteors instead of rolling towards you like boulders."
			}
		},
		Health = 900,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Blue = 1, Green = 1, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns, if the top card of your graveyard costs 5 or fewer total studs: Recur it, except it's fading.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"QuickScanGraveyard"
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
		Bio = "Don't worry, it can translate cursive and blessive."
	},
	["Caitlin, Paladin of Nature"] = {
		Id = 12144951241,
		Name = "Caitlin, Paladin of Nature",
		AltCards = {
			["Caitlin, Paladin of Nature-Offer"] = {
				Name = "Caitlin, Joyrider",
				Id = 12672853452,
				ArtAnimation = "Caitlin",
				PackDisplayOverride = "Necrosyndicates Collector Box",
				Bio = "The benefits of being a forest ranger are big, open fields of grass!"
			},
			["Caitlin, Paladin of Nature-AN"] = {
				Name = "Clockwork, Teapot Crusader",
				Id = 14278860333,
				AttackEffect = "Hammer",
				Bio = "A realm filled with Earl Grey tea leaves. A realm perfect for me."
			}
		},
		Health = 1500,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Battleaxe",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Shield = true,
		Cost = { Blue = 2, Green = 2, Neutral = 4 },
		EffectVariable = 0,
		SummonAnimation = "CaitlinSummon",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://12561612561" },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you recur a card: Give yourself a copy of that card, except it's Fading.",
			Ability = {
				OnAllyRecur = {
					Power = { { "AddCopy", 30, "Aggressor" } },
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "Caitlin felt a tinge of sorrow having missed the vast history of the late Vecross System. The Necroenzyme, however, lent her another chance to preserve history long thought lost."
	},
	Paleofeeder = {
		Id = 12288057943,
		Name = "Fauna Feeding",
		AltCards = {
			["Fauna Feeding-AN"] = {
				Id = 13822685565,
				Name = "Flowerpot Sprinkling",
				Bio = "Keeping flowerpots healthy is vital for the environment. Used tea leaves act as a good fertilizer, if not used to make improvised explosives."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		AlternateCostRequirement = { "Playertable", "Me", 1, 99999, "RecurCount" },
		AlternateCost = { IgnoreColor = "Neutral" },
		Cost = { Blue = 1, Green = 1, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card ignoring its {W} cost if you've recurred a card this turn.\nIf the top card of your graveyard is Green, a target fighter gains 600 Power.\nOtherwise it gains 600 Health.",
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
	["Greenbelt Surveyor"] = {
		Id = 12560352938,
		Name = "Greenbelt Surveyor",
		AltCards = {
			["Greenbelt Surveyor-AN"] = {
				Id = 13741079524,
				Name = "Treepot",
				AttackEffect = "Swamp",
				Bio = "Not to be confused with the tea tree, this tree has grown out in a way that resembles a green teapot. Occasionally, sap will leak from the spout of the tree, which can be added to ones brew as a substitute to sugar."
			},
			["Nastrond, Haunted"] = {
				Id = 92784489048659,
				Name = "Drop Paw Candy",
				PremiumArt = 324,
				AltArt = true,
				Bio = "Umbrella at your side, it’s raining but you close it tight<br/><b><font color=\"#00FF00\">(“And how are you?” purred a cat just passing through)</font></b>"
			},
			["The Spiredelvers"] = {
				Id = 85068703970679,
				Name = "The Spiredelvers",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Cognitive Status: Questionable<br/>ML Dialect: Insanity<br/>Creativity Index: Undetermined<br/>The best Duelshire could offer to find <b><font color=\"#00FF00\">The Rat.</font></b> This <b><font color=\"#800080\">humble one</font></b> is unsure whether any of them are sane."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Storm",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: The top card of your graveyard generates.",
			Ability = {
				OnEnd = {
					Power = { { "Generate", 1, nil, nil, nil, "QuickScanGraveyard" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "With the trusty Land-Marker! Much more reliable than a Magic-Marker."
	},
	["Scripture Scanner"] = {
		Id = 12575045687,
		Name = "Scripture Scanner",
		AltCards = {
			["Scripture Scanner-AN"] = {
				Id = 14193395217,
				Name = "Teapot Schematics",
				Addant = "Scripture Scanner-AN",
				Bio = "<i>\"I've finally connected the dots. They don't make out anything, but I've connected them.\"</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive™",
		TriggerInGraveZone = true,
		Cost = { Green = 2, Blue = 2 },
		EffectVariable = 0,
		Addant = "Scripture Scanner",
		Effect = {
			Name = "Haydoscale",
			Description = "Select a card from the top 2 cards of your deck. Destroy that card, then draw a card.\nWhenever you recur a card, if this card's in your graveyard: Obliterate this card and give yourself a copy of it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 2 },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to destroy"
					}
				},
				OnAllyRecur = {
					Power = {
						{ "Add", "Addant", "Ally" },
						{
							"MoveZone",
							{ "Scripture Scanner", "GraveZone_Ally", "Nil", true, false },
							"Self"
						}
					},
					Target = "Self",
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"Those Paraselene fuds can go oan 'eir trolley! The fleggers'd rather chug 'eir own ego than 'elp us wee barras. We're a' Dukran's bairns.\" - Caitlin, CEO of Arkhive"
	},
	["Dinosaur of Xargasdon"] = {
		Id = 12180551901,
		Name = "Dinosaur of Xargasdon",
		AltCards = {
			["Dinosaur of Xargasdon-C"] = {
				Name = "Holy Equestrian",
				Id = 15619579222,
				AttackEffect = "FirePunch",
				Bio = "All the king's horses and all the king's men couldn't put Dukran together again."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Green",
		Archetype = "Alar",
		Summonant = "Spirit",
		Rank = 7,
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select a card in your graveyard. Summon 2 200/200 colourless Spirits with no abilities in the same group as that card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" },
							"TargetAllyInGraveyard"
						},
						{ "Summon", "Summonant" },
						{ "SetArchetype", "Variable", "SummonedCard" },
						{ "Summon", "Summonant" },
						{ "SetArchetype", "Variable", "SummonedCard" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"So close to the myth himself! Perhaps his mount could point me in the right direction.\" -Caitlin's Log"
	},
	Spirit = {
		Id = 12288024869,
		Name = "Spirit",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "SoulSyphon",
		Color = "Neutral",
		Archetype = "",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Reincarnation",
			Description = "",
			Ability = {
				Nill = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Man met aether millenias ago."
	},
	RoyStanford = {
		Id = 12146878447,
		Name = "RoyStanford",
		AltCards = {
			["RoyStanford-Banner"] = {
				Id = 12653948088,
				Name = "Baker RoyStanford",
				AttackEffect = "Flare",
				Bio = "How many times do I gotta tell you guys? Stop putting decapitated heads into the cake batter!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Revolver",
		Color = "Yellow",
		Summonant = "RoyStanford",
		Cost = { Neutral = 3, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if you have 20 or more cards in your graveyard: Summon a copy of it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 19 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "SummonCopy" } },
					Target = "Self"
				}
			}
		},
		Bio = "This is like one of my gravewalker movies!"
	},
	["Old Robloxian Tree"] = {
		Id = 13298271731,
		Name = "Old Robloxian Tree",
		AltCards = {
			["Old Robloxian tree-V"] = {
				Id = 16206875776,
				Name = "Cherry Blossom Tree",
				AttackEffect = "Tempest",
				Bio = "i love trees",
				AddGenZoneant = "Old Robloxian tree-V"
			},
			["Old Robloxian Tree-AWIH"] = {
				Id = 17600688544,
				Name = "Street Sweeper",
				AttackEffect = "Tempest",
				Bio = "Dying is stupid. Cheating death is stupider.",
				AddGenZoneant = "Old Robloxian Tree-AWIH",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Tempest",
		Color = "Green",
		AddGenZoneant = "Old Robloxian Tree",
		Cost = { Neutral = 1, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Put a copy of it into your baseplate.\nWhenever a card leaves your opponent's graveyard: Deal 500 damage to all fighters.",
			Ability = {
				OnDeath = {
					Power = { {
						"AddGenZone",
						{ "Old Robloxian Tree", 1 }
					} },
					Target = "Ally"
				},
				OnEnemyGraveRemove = {
					Power = { { "Damage", 500 } },
					Target = "All"
				}
			}
		},
		Bio = "For Robloxians, a reminder of halycon days. For the Javionese, an alien symbol of an alien world."
	},
	["Hard-hat Immortal"] = {
		Id = 12703653626,
		Name = "Hard-hat Immortal",
		AltCards = {
			["The Auditors"] = {
				Id = 18771315925,
				Name = "Auditors' Requiem",
				Commissioner = { 8289996, 30244924 },
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 143,
				Bio = "Auditors have a fickle occupation. One day they are accounting for financial districts, then auditing so-called immortals the next day. Resolving their problems permanently."
			},
			["Hard-hat Immortal-Red"] = {
				Name = "Red",
				AttackEffect = "LaserRed",
				Id = 122079069902355,
				ArtAnimation = "RedAnimation",
				SummonAnimation = "NoobCall",
				SearchTerms = { "Gelatin", "Gelatinous" },
				Commissioner = { 670841478, 8289996 },
				Bio = "No one knows the origins of this gelatinous creature. When conditions are right, they hide in plain sight. Though you'll see their berries as if they are levitating. Legends only refer to them as '<font color=\"#E53935\"><b>Red</b></font>'."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Hammer",
		Color = "Red",
		TriggerInGraveZone = true,
		Cost = { Neutral = 2, Red = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast your third action each turn, if this card's died this game: Recur this card.",
			Ability = {
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{
							"Hard-hat Immortal_HasDied",
							"GraveZone_Ally",
							"Hand_Ally",
							true,
							false
						},
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 4, "Actions" }
				}
			}
		},
		Bio = "Safety is unimportant when you're immortal."
	},
	["Parking Lot Attendant"] = {
		Id = 12145008593,
		Name = "Parking Lot Attendant",
		Health = 400,
		Power = 700,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 5 },
		EffectVariable = 0,
		CustomReminder = { Suspension = "Remove this card from play until the next end step." },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever a fighter is cast, if it has 400 or less power: Lock it for 2 turns. Suspend this card until the next end step.",
			Ability = {
				OnAnySummon = {
					Power = {
						{ "Lock", 2, "Aggressor" },
						{ "Suspend" }
					},
					Target = "Self",
					LowerPower = 400
				}
			}
		},
		Bio = "The first night isn't usually that bad in any of these jobs."
	},
	["Laboratory Assistant"] = {
		Id = 12575319235,
		Name = "Laboratory Assistant",
		AltCards = {
			["Laboratory Assistant-Hal"] = {
				Id = 14555966075,
				Name = "The Master",
				AttackEffect = "Storm",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Give yourself a Necroenzyme Vial.",
					Ability = {
						OnSummon = {
							Power = { { "Add", "Necroenzyme Vial-Hal", "Ally" } },
							Target = "Self"
						}
					}
				},
				Bio = "Man and machine shouldn't co-exist. They should be combined."
			}
		},
		Health = 350,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Necroenzyme Vial.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Necroenzyme Vial", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "The only companions Eisenhower had in his laboratory were soulless contraptions, caring only for his experiments rather than his wellbeing."
	},
	["Necroenzyme Vial"] = {
		Id = 12183215580,
		Name = "Necroenzyme Vial",
		AltCards = {
			["Necroenzyme Vial-Hal"] = {
				Id = 14556112568,
				Name = "Reincarnate",
				AttackEffect = "Storm",
				Bio = "Wires soldered to veins, flesh melds with metal, torn apart to be reshaped, I will be born again."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Zombified = "When a zombified card leaves play for any reason, obliterate it."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Select one of 3 fighter cards in your graveyard.\nRecur that card, except it's zombified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"TargetRandomAllyFighterCardInGraveyard"
					} },
					Target = "Self",
					MetaData = { Zombified = true }
				}
			},
			AmountOfTargets = 3
		},
		Bio = "Its horrid potential never crossed Eisenhower's mind. He only wanted to bring back his love."
	},
	["Welcome to Bloxburg!"] = {
		Id = 12162821079,
		Name = "Welcome to Bloxburg!",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select a card in your graveyard. Put it into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
						"TargetAllyInGraveyard"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Robloxia's Finest Town! 302 days since someone died!"
	},
	["Bloxburg Messiah Hospital"] = {
		Id = 12463885843,
		Name = "Bloxburg Messiah Hospital",
		AltCards = {
			["Invading the HQ"] = {
				Id = 16361234332,
				AltArt = true,
				AttackEffect = "Slash",
				PremiumArt = 215,
				Name = "Invading the HQ",
				Bio = "\"You'd think they would have safety precautions to being blown up...\"",
				Terrariant = "John Bomb Terrarian"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Terrariant = "Illusion of Failure",
		Terrain = true,
		Cost = { Neutral = 2, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter dies, if there's 4 or fewer gear on this card: Attach a fading gear to this card. All allied fighters gain 50 health.\nDuring your end step: Obliterate all gear on this card.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Heal", 50, "Ally" },
						{ "EquipGear", "Exertion", "Self" }
					},
					Target = "Self",
					MetaData = { Fading = true },
					EffectRequirement = { "SelfGear", "HasGear", 0, 4, "HasGear" }
				},
				OnEnd = {
					Power = { { "DestroyGear", "All", "Self" } }
				}
			}
		},
		Bio = "Dedicated to providing health care for the less fortunate."
	},
	["General Store Owner"] = {
		Id = 12146870840,
		Name = "General Store Owner",
		Health = 900,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Shotgun",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if 3 or more fighters have died this turn: This card gains 500 Power.",
			Ability = {
				OnEnd = {
					Power = { { "Strengthen", 500, "Self" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 9999, "AllDeathStorm" }
				}
			}
		},
		Bio = "Do <b>not</b> mess with a person who's willing to work for their tax pay."
	},
	["Fashionable Citizen"] = {
		Id = 12146859470,
		Name = "Fashionable Citizen",
		AltCards = {
			["Fashionable Citizen-E"] = {
				Id = 12957249222,
				AttackEffect = "Scythe",
				Name = "Emma",
				GraveAddant = "Fashionable Citizen-E",
				Bio = ""
			},
			["Collection of Idiots"] = {
				Id = 15804644426,
				Name = "Collection of Idiots",
				GraveAddant = "Collection of Idiots",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "A Smiley, a PLURRAL and a Dunce walk into the Commitee for Rational Progress. It goes up in flames."
			},
			InertInPlay = {
				Id = 117352577267772,
				Name = "InertInPlay",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 558,
				Bio = "Note: Not actually inert in play."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		GraveAddant = "Fashionable Citizen",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Put 2 copies of it into your graveyard.",
			Ability = {
				OnDeath = {
					Power = {
						{ "GraveAdd", "GraveAddant" },
						{ "GraveAdd", "GraveAddant" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Another wonderful day in beautiful Bloxburg! Surely nothing abhorrently awful could ruin this, eh?"
	},
	["Mail Delivery Truck"] = {
		Id = 12146874399,
		Name = "Mail Delivery Truck",
		AltCards = {
			["Mail Delivery Truck-Sun"] = {
				Name = "Doomed Counselors Laura & Max",
				Id = 13740935644,
				AttackEffect = "Revolver",
				Bio = "Don't show up to summer camp a day early, worst mistake of my life!"
			},
			["Rayburn, Unrelenting Flame"] = {
				Id = 15941931176,
				Name = "Rayburn, Unrelenting Flame",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 190,
				Bio = "Now that my graveyard's filled, the REAL DUEL starts NOW!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		SummonAnimation = "MonsterTruck",
		Cost = { Neutral = 2, Yellow = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Yellow card for every 5 cards in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomAdd", "MonoOnlyorYellowCost Yellow" },
						{
							"AlterEV",
							{ "Subtract", "Math", 5, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4, "Self" }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "<b>THE MAIL IS LATE!!THE MAIL IS LATE!!THE MAIL IS LATE!!THE MAIL IS LATE!!THE MAIL IS LATE!!</b>"
	},
	["Construction Worker"] = {
		Id = 12146854670,
		Name = "Construction Worker",
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a 100/100 House that's inert in play and has defender.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "House" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Povvo Street is an eyesore.\" -McKayla"
	},
	House = {
		Id = 12170239821,
		Name = "House",
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Punch",
		Shield = true,
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Token = true,
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
		Bio = "You need a house extension? Call Crissbach and Son's! Fast, Cheap, Quality!"
	},
	["Eisenhower Dwit"] = {
		Id = 12144962540,
		Name = "Eisenhower Dwit",
		AltCards = {
			["Eisenhower Dwit-Banner"] = {
				Id = 12653975904,
				Bio = "The tape's reels already show sign of disrepair. It's been replayed several times."
			},
			["Eisenhower Dwit-Sun"] = {
				Id = 128173700253002,
				Name = "Prime Candidate Dwit",
				Bio = "His detractors liked to call him \"Dim-Wit Dwit\". Pretty ironic, considering his IQ was in the highest 0.00000015% of the population."
			},
			Tobrensk = {
				Id = 113460871494716,
				Name = "Tobrensk",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 590,
				Bio = "“His coworkers described him as a mad scientist with a bizarre interest in cybernetics, he was fired after attempting to replace the heart of a stray cat with a robotic one.”"
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Legendary",
		AttackEffect = "Storm",
		Color = "Blue",
		Fading = true,
		Cost = { Blue = 7, Green = 2 },
		EffectVariable = 0,
		CustomReminder = {
			Zombified = "When a zombified card leaves play for any reason, obliterate it."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever an allied fighter dies: It summons a fading and zombified copy of itself.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Summon", "Variable", "Ally" }
					},
					Target = "Aggressor",
					MetaData = { Fading = true, Zombified = true },
					AllowDeadAggressorTriggers = true,
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"I can't lose you, Art... We still have so much ahead of us...\""
	},
	["Empty House"] = {
		Id = 12288003794,
		Name = "Empty House",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Terrain = true,
		Terrariant = "Neverending Longing",
		Cost = { Blue = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast an action: Look at the top card of your deck. You may destroy it.",
			Ability = {
				OnAllyCast = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 1 },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "if you want to destroy this card"
					}
				}
			}
		},
		Bio = "It used to be their home."
	},
	["Sarah Greene Bailey"] = {
		Id = 12145029900,
		Name = "Sarah Greene Bailey",
		AltCards = {
			["Sarah Greene Bailey-Fool"] = {
				Name = "Swimsuit Sarah",
				Id = 12963617702,
				AttackEffect = "Whirlpool",
				Bio = "Oh whoops, that was the wrong decal. Here you go!"
			},
			["Sarah Greene Bailey-Fool2"] = {
				Name = "Swimsuit Sarah",
				AttackEffect = "Maelstrom",
				Id = 12946765425,
				Bio = "Blub blub."
			},
			Rayvival = {
				Id = 111607994850099,
				Name = "Rayvival",
				Commissioner = { "RayBurn_89" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 755,
				Bio = "IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL IT'S REAL "
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Yellow",
		Cost = { Green = 6, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All players recur 10 of their allied cards, except they're fading.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Any", "GraveZone_Ally", "Hand_Ally", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Hand_Opponent", true, false, 10 },
							"Self"
						}
					},
					Target = "Self",
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "A respected surgeon of Bloxburg Messiah Hospital. Loves cats!"
	},
	["Discovery of Rebirth"] = {
		Id = 12144956244,
		Name = "Discovery of Rebirth",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Fading = true,
		Cost = { Blue = 9 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Give yourself 6 Necroenzyme Vials. Change their cost to {W}{W}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Necroenzyme Vial", "Ally" },
						{ "Add", "Necroenzyme Vial", "Ally" },
						{ "Add", "Necroenzyme Vial", "Ally" },
						{ "Add", "Necroenzyme Vial", "Ally" },
						{ "Add", "Necroenzyme Vial", "Ally" },
						{ "Add", "Necroenzyme Vial", "Ally" }
					},
					Target = "Self",
					MetaData = {
						Cost = { Neutral = 2 }
					}
				}
			}
		},
		Bio = "Eisenhower unlocked the secret to prolonging a person's life, the greatest scientific achievement in Robloxian history - and the miracle he needed to bring back his husband.<br/><br/>He was a fool."
	},
	["Changing Times"] = {
		Id = 12162813901,
		Name = "Changing Times",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2 },
		EffectVariable = 0,
		Lunar = true,
		Effect = {
			Description = "Draw 2 cards, then select 2 non-token cards in your hand. Destroy those cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2, "Ally" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { NotRarity = "Token" },
						MinTargets = 2,
						MaxTargets = 2,
						SelectionDescription = "two cards to destroy"
					}
				}
			}
		},
		Bio = "\"These Javionese have their own way of being, it is different than ours. I have a duty as Mayor to ensure difference does not become conflict.\"<br/>-Astarossa, Mayor of Bloxburg"
	},
	["Gather My Memoirs"] = {
		Id = 12146862388,
		Name = "Gather My Memoirs",
		AltCards = {
			["Gather My Memoirs-Event"] = { Name = "Testing the Enzyme", Id = 12653965186 },
			["Gather My Memoirs-E"] = { Name = "Gather the Eggs", Id = 12957237935, Bio = "" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select a card from the top 5 cards of your deck. Search that card and destroy the rest.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { TopCard = 5 },
						SelectionDescription = "a card to search from your deck"
					},
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "TopCard"
					}
				}
			}
		},
		Bio = "Eisenhower brought the pictures of him and husband, the only form of solace he'll provide himself in the dilapitated laboratory."
	},
	["Corporate Spy"] = {
		Id = 12162818769,
		Name = "Corporate Spy",
		AltCards = {
			["Corporate Spy-Banner"] = { Id = 12863041039 },
			["Corporate Spy-Sun"] = {
				Id = 13660850743,
				Name = "Recreative Spy",
				Bio = "\t\t\t\t\t  \"Yo, Alpha. 'Member that widow you spied on and that serum recipe ya' stole?\"\n\t\t\t\t\t  \"Yes?\"\n\t\t\t\t\t  \"Apparently the town near that lab's tearin' itself apart over that serum. Crazy stuff.\"\n\t\t\t\t\t  \"Interesting.\"\n\t\t\t\t\t  \"Yeah. Now go get the encryption code from that security chap, ya dig?\",\n\t\t\t\t\t  "
			},
			HarrowingCorvid = {
				Id = 16056320976,
				Name = "HarrowingCorvid",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 206,
				Bio = ""
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		Color = "Blue",
		Cost = { Blue = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if there's exactly 2 colours among cards in your baseplate: Select a card in your graveyard. Search your deck for all copies of that card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"TargetAllyInGraveyard"
						},
						{
							"RepeatingTutorfor",
							{ "Variable", 20 }
						}
					},
					Target = "Self",
					EffectRequirement = { "Chromatic", "AllyGenZone", 2, 3 }
				}
			}
		},
		Bio = "Rumors of a recently widowed scientist researching methods of resurrection had not fallen onto deaf ears."
	},
	["Corporate Smuggler"] = {
		Id = 12146839630,
		Name = "Corporate Smuggler",
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Green = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if there are exactly 2 colours among cards in your baseplate: Select up to 2 cards in your graveyard. Put them into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					EffectRequirement = { "Chromatic", "AllyGenZone", 2, 3 },
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "up to two cards to put in your baseplate"
					}
				}
			}
		},
		Bio = "Spending time with his reanimated husband, Eisenhower never cared to notice the missing vials of Necroenzyme."
	},
	["Corporate Killer"] = {
		Id = 12146833448,
		Name = "Corporate Killer",
		AltCards = {
			["Dark's Dog"] = {
				Id = 12720772048,
				Name = "Dark's Dog",
				AltArt = true,
				PremiumArt = 7,
				Commissioner = { 68738329 },
				Bio = "alruine"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "British",
		Color = "Red",
		Cost = { Red = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if there are exactly 2 colours among cards in your baseplate: Select a card in your opponent's graveyard. Obliterate it and all copies of it in all zones.",
			Ability = {
				OnSummon = {
					Power = { { "Extract" } },
					Target = "CustomZoneTarget",
					EffectRequirement = { "Chromatic", "AllyGenZone", 2, 3 },
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = {},
						SelectionDescription = "a card to obliterate all copies of"
					}
				}
			}
		},
		Bio = "Eisenhower's folly gave rise to the Necrosyndicates and the chaos that ensued."
	},
	["Corporate Marketeer"] = {
		Id = 12181922803,
		Name = "Corporate Marketeer",
		AltCards = {
			["Corporate Marketeer-AN"] = {
				Id = 13697389574,
				Name = "Gargoyle Custos Ex Pittacium",
				AttackEffect = "Scratch",
				Bio = "<i>Vetus. Inutilis.</i>"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if there's exactly 2 colours among cards in your baseplate: Select up to 10 non-Colourless cards in your graveyard. They generate.",
			Ability = {
				OnSummon = {
					Power = { { "Generate", 1, "CustomZoneTarget" } },
					Target = "Self",
					EffectRequirement = { "Chromatic", "AllyGenZone", 2, 3 },
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Colored = true },
						MinTargets = 0,
						MaxTargets = 10,
						SelectionDescription = "up to ten cards to generate"
					}
				}
			}
		},
		Bio = "When Eisenhower noticed a familiar serum being sold on television, it was already too late to stop his mistake."
	},
	["Artemis Carter"] = {
		Id = 12146851813,
		Name = "Artemis Carter",
		AltCards = {
			["Artemis Carter-Event"] = {
				Name = "The White Noise",
				Id = 12653968358,
				AttackEffect = "Divinity",
				Commissioner = { 1105140151 },
				Bio = "\"Thanks for everything, Eisen. To repay you, I shall destroy each of these syndicates attempting to exploit the gift you've bestowed upon me.\""
			}
		},
		Health = 700,
		Power = 1050,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6, Red = 2, Blue = 1 },
		EffectVariable = 0,
		Zombified = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast an action: Summon a 200/200 Zombified copy of it. Trigger its effects as though it was cast.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "SummonWithEffect", "Variable", "Ally" }
					},
					Target = "Aggressor",
					TurnTriggerLimit = 1,
					MetaData = { Zombified = true, Health = 200, Power = 200 }
				}
			}
		},
		Bio = "The original purpose of the Necroenzyme, and the most noble one."
	},
	Misfortune = {
		Id = 12144995633,
		Name = "Misfortune",
		AltCards = {
			["Misfortune-Banner"] = { Id = 13488221957, Name = "Lost At Sea", Bio = "Don't look down." },
			NE0L1GHT = {
				Id = 83495736615004,
				Name = "NE0L1GHT",
				Commissioner = { "SleeplessPurgatory" },
				ArtAnimation = "NE0L1GHT",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 674,
				Bio = "\"im pretty misfortunate\" -NE0L1GHT"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate your deck.",
			Ability = {
				OnSummon = {
					Power = { { "RemoveDeck", 999, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "The last words that Eisenhower wanted to hear at the hospital were the ones he did: \"I'm sorry.\""
	},
	["Ranger's Pet"] = {
		Id = 13465138290,
		Name = "Ranger's Pet",
		AltCards = {
			["Ranger's Pet-AN"] = {
				Id = 14398644269,
				Name = "Golden Reteaver",
				AttackEffect = "Bite",
				Bio = "What? Joke not good enough for you? Well then. <b>PRINCESS! MAUL THEM!!</b>"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card is cast or attacks, if you've recurred a card this turn: Put the top card of your graveyard into your baseplate.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					EffectRequirement = { "Playertable", "Me", 1, 99999, "RecurCount" }
				},
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					EffectRequirement = { "Playertable", "Me", 1, 99999, "RecurCount" }
				}
			}
		},
		Bio = "Some of the PLURRAL's prey weren't planning to go down without a bite."
	},
	Datasurge = {
		Id = 13293002786,
		Name = "Datasurge",
		AltCards = {
			["Datasurge-AN"] = {
				Id = 13893832661,
				Name = "Teapot Tumble",
				Bio = "<i>I could always clear these mountaintops with my SuperLegs™️!</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Electric",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Neutral = 2, Blue = 4 },
		EffectVariable = 0,
		EffectAnimation = "Datasurge",
		Lunar = true,
		Fading = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Recur the top card of your graveyard, except it's fading.\nRepeat this effect until you recur a fighter card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Add", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 10, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { Fading = true }
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Add", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 9, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { Fading = true },
					EffectRequirement = { "Board", "AllyGraveZone", 1, 9999 },
					TurnTriggerLimit = 10
				}
			}
		},
		Bio = "No time for buffering out!"
	},
	["Grimclaw The Sacred"] = {
		Id = 13293221742,
		Name = "Grimclaw The Sacred",
		AltCards = {
			["Grimclaw The Sacred-AN"] = {
				Id = 13822686946,
				Name = "煎茶, Sencha",
				AttackEffect = "Katana",
				Bio = "\"I've walked these lands longer than it takes an Earl Grey to let go of its strength and personality. Some find me sweet, others find me astringent, but I assure you I will heed no balance in this duel; またね\""
			},
			["Sylvia, the Starstruck Warrior"] = {
				Id = 14194191449,
				Name = "Sylvia, the Starstruck Warrior",
				AltArt = true,
				PremiumArt = 87,
				AttackEffect = "LaserBlue",
				Bio = "Hand in hand, here we stand, under the unyeilding radiance of tomorrow"
			},
			["Youkai Girl's Subconscious"] = {
				Id = 127834979792395,
				Name = "Youkai Girl's Subconscious",
				ArtAnimation = "fixedknifelady",
				SummonAnimation = "JohnSummon",
				AttackEffect = "XhartyrSlash",
				AltArt = true,
				PremiumArt = 801,
				Bio = "\"Read your mind? I've already closed my satori eye. Reading people's minds only makes you depressed, there's nothing good about it.\""
			}
		},
		Health = 4500,
		Power = 1500,
		Rarity = "Epic",
		AttackEffect = "LaserGreen",
		SummonAnimation = "SummonGrimclawSacred",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Blue = 8, Green = 8 },
		EffectVariable = 0,
		Rank = 10,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if this card's in your graveyard and there's exactly 4 enemy fighters: Recur this card, then you gain {G}{B}.\nWhenever this card attacks: Obliterate your opponent's deck.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "Grimclaw The Sacred", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{ "Blue", 1 },
						{ "Green", 1 }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "Opponent", 4, 5 },
					DontTriggerInField = true
				},
				OnAttack = {
					Power = { { "RemoveDeck", 999, "Opponent" } },
					Target = "Self"
				}
			}
		},
		Bio = "A dragon of pure destruction brought back by profane creation. Greygnarl did not succeed."
	},
	["Greenbelt Patrolbot"] = {
		Id = 13293044764,
		Name = "Greenbelt Patrolbot",
		AltCards = {
			["Greenbelt Patrolbot-AN"] = {
				Id = 14398648385,
				Name = "Tealegs",
				AttackEffect = "Whirlpool",
				Bio = "It will <i>never</i> be balling."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Electric",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever a card leaves your graveyard: This card gains 100 Health.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "Heal", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "Made to electrocute poachers and bellyrub cute animals!"
	},
	["Despoiler of Graves"] = {
		Id = 13626611205,
		Name = "Despoiler of Graves",
		AltCards = {
			["Despoiler of Graves-AN"] = {
				Id = 14192587695,
				Name = "Porteable Brewer",
				AttackEffect = "Whirlpool",
				Bio = "<i>Where did you think all that Earl Grey tea was coming from, anyway? This scoundrel has to painstakingly brew tea atop a counter it's not even tall enough for. Besides that, it's a good place to store any teapot in.</i>"
			},
			["Nastrond, Enzymed"] = {
				Id = 75300441165984,
				Name = "Nastrond, Enzymed",
				PremiumArt = 384,
				AltArt = true,
				Bio = "I want more... I WANT MORE OF THE NECROENZYME >:("
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Bite",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Green = 8 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: Recur the allied top card, except it's fading. This card gains 100 power until end of turn for each stud in that card's cost.",
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
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{ "TempStrengthen", "Variable" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "Each tomb Caitlin opens invites tomb raiders."
	},
	["Defensive Digging"] = {
		Id = 13465132341,
		Name = "Defensive Digging",
		AltCards = {
			["Defensive Digging-AN"] = {
				Id = 14039154143,
				Name = "Construct: Teapot Turret",
				AttackEffect = "Electric",
				Bio = "“If a teapot can handle holding boiling water at extreme temperatures, it’s probably safe to assume it can also handle a mounted turret and propulsion rockets…”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Neutral = 1, Blue = 3, Green = 3 },
		EffectVariable = 0,
		Fading = true,
		CustomReminderRecur = true,
		Effect = {
			Name = "Haydoscale",
			Description = "If the top card of your graveyard is a unranked fighter that costs 4 or fewer total studs, summon it.\nThen recur the allied top card.\nThen put the top card of your graveyard into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 4 },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { Fading = true }
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{
								"EffectTarget",
								"GraveZone_Ally",
								"Field_Ally",
								false,
								false,
								"Variable"
							},
							"CustomTarget"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { "BottomCard", "MatchesParameter" },
						Modifier = { MatchesParameter = "Unranked" }
					},
					MetaData = { Fading = true },
					NoBlip = true
				}
			}
		},
		Bio = "Caitlin pondered how her mentor would react to her revival of the ancient dead to fight catgirls. <br/>\"Sorry al-Assad,\" she sighed, \"It's these wee trinkets or the forest.\""
	},
	["Caitlin Nixon, Hunted"] = {
		Id = 13293131419,
		Name = "Caitlin Nixon, Hunted",
		AltCards = {
			["Caitlin Nixon, Hunted-Offer"] = {
				Id = 13621945280,
				AttackEffect = "Rifle",
				ArtAnimation = "CaitlinHunted",
				Commissioner = { 14640960 },
				Name = "Caitlin Nixon",
				Bio = "\"Even if I'm going to disappear... Even if I die trying... I'll protect the people I love, no matter what.\""
			},
			["Caitlin Nixon, Hunted-AN"] = {
				Id = 13822688693,
				AttackEffect = "Jab",
				Name = "al-Assad, Daring Achaeologist",
				Bio = "\t\t\t\t  <i>The realm of the Teapots is a dangerous land, providing a difficult challenge to discover its secrets.</i>\n\t\t\t\t  <i>One adventurer dared to answer that call.</i>\n\t\t\t\t\t "
			},
			["Lily Kaira, Shaken"] = {
				Id = 15121300427,
				AttackEffect = "Arrow",
				AltArt = true,
				Name = "Lily Kaira, Shaken",
				Bio = "<i>Her goddess had disappeared, the sacred grove now overrun by beasts. With a shaky breath, Lily nocked her bow and prepared herself.</i>"
			}
		},
		Health = 50,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "Battleaxe",
		Color = "Blue",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Neutral = 1, Blue = 1, Green = 1 },
		EffectVariable = 0,
		Charge = true,
		CounterBlock = true,
		CounterAttackBlock = true,
		SummonAnimation = "Caitlin2Summon",
		SummonedAnimation = "Caitlin2Summon",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you discard a card: Obliterate the top 2 cards of your graveyard, then recur the top card of your graveyard, except it's fading. Then shuffle this card back into your deck.\nWhenever this card attacks and destroys another: Put the top card of your graveyard into your baseplate.",
			Ability = {
				OnAllyDiscard = {
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
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Ally", "Deck_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = { Fading = true }
				},
				OnAttackDestroy = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "GenZone_Ally", false, false },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "No one's truly dead until their name is spoken for the last time."
	},
	["Bloxburg's Greenbelt"] = {
		Id = 13293125237,
		Name = "Bloxburg's Greenbelt",
		AltCards = {
			["Bloxburg's Greenbelt-AN"] = {
				Id = 18199515793,
				Name = "Teapot Temple",
				Terrariant = "The Ancient World Encroached-AN",
				Bio = "No one really stops to think about the process of brewing tea. They just throw the leaves or bag in, set a timer, and let it steep. The tea leaves have to wait as well whilst left in boiling water... if they could talk, I wonder if they'd still be as patient."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Cost = { Green = 4, Blue = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "The Ancient World Encroached",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top card of your graveyard, except it's fading.\nWhenever you recur a Blue card: It gains 200 Health and Power and becomes zombified. Actions buffed this way manifest into fighters.\nWhenever you recur a non-Blue card: You gain {G}{B}.",
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
				},
				OnAllyRecur = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 3 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{ "Green", 1 },
						{ "Blue", 1 }
					},
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "HealTargetInHand", 200 },
						{ "StrengthenTargetInHand", 200 },
						{ "GivePassive", "Zombified" }
					},
					Target = "AlliedRightMostHand",
					NoBlip = true
				}
			},
			AllowActionBuffing = true
		},
		Bio = "Originally a wildlife protection agency, the Arkhive has sworn to protect Bloxburg's wilderness."
	},
	["Crackdown Enforcer"] = {
		Id = 13293278865,
		Name = "Crackdown Enforcer",
		AltCards = {
			["Crackdown Enforcer-E"] = {
				Id = 17014897444,
				Name = "Cottontail Cavalier",
				Bio = "You could just move to the side, but come on. Cavaliers have it hard already, having to deal with their ducks."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Blue = 3 },
		Zombified = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if there's another allied zombified fighter: Return a target fighter and all terrains to their hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Return" },
						{ "Return", 30, "AllyTerrain" },
						{ "Return", 30, "EnemyTerrain" }
					},
					EffectRequirement = { "HasPassive", "Ally", 2, 9999, "Zombified" },
					Target = "Single"
				}
			}
		},
		Bio = "Astarossa knows what unregulated power does to people. Securing it would be doing them a favor."
	},
	["Astral Faith Zealot"] = {
		Id = 13292988085,
		Name = "Astral Faith Zealot",
		AltCards = {
			["Astral Faith Zealot-E"] = {
				Name = "Capon Conjurer",
				Id = 17251038592,
				Bio = "Bright, flashing spells have put this poor mage on a carrot-based diet. Thankfully, it's a self-sufficient one."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Neutral = 1, Red = 1, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: All allied zombified fighters gain 100 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally" },
						Condition = "HasPassive",
						Modifier = "Zombified"
					}
				}
			}
		},
		Bio = "\"Brothers! The Dread Priest's wisdom has granted us life eternal! And the foolish heretics who still cling to their flesh leech off his divine provenance!\""
	},
	["Astral Faith Evangel"] = {
		Id = 13292980427,
		Name = "Astral Faith Evangel",
		AltCards = {
			["Astral Faith Evangel-E"] = {
				Name = "Rougish Rabbit",
				Id = 71632937248960,
				Bio = "Plug up one burrow, two more appear."
			}
		},
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "British",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied zombified fighter dies, if this card's in your graveyard: Recur this card.",
			Ability = {
				OnAllyDeath = {
					Power = { {
						"MoveZone",
						{ "Astral Faith Evangel", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					Zombified = true,
					DontTriggerInField = true
				}
			}
		},
		Bio = "\"What bootlicking cretins.\" <br/>-Astarossa, Mayor of Bloxburg"
	},
	["Astarossa Van Buren"] = {
		Id = 13292977574,
		Name = "Astarossa Van Buren",
		AltCards = {
			["Astarossa Van Buren-Banner"] = {
				Name = "Astarossa Van Buren",
				Id = 105307507646684,
				Bio = "Judge someone's strength not by their physical aptitude, but by their willingness to protect their ideals."
			},
			["Astarossa Van Buren-Offer"] = {
				Name = "Astarossa van Buren, Advocate of Humanity",
				Id = 13626517125,
				ArtAnimation = "AstarossaVanBurenAnim-Offer",
				Bio = "<i>It is the responsibility of the strong to protect the weak so that their individual shortcomings can be covered by one another.</i>"
			},
			["Astarossa Van Buren-E"] = {
				Name = "Lapin, Grand Vivizier",
				Id = 17251036697,
				Bio = "Has a side hustle of being a stand-up comedian and writer. The King appreciates his blunt efforts to ensure people understand their kingdom has rabbits in it."
			},
			["Ennard, Enzyme Enthusiast"] = {
				Id = 18915001622,
				Name = "Ennard, Enzyme Enthusiast",
				PremiumArt = 389,
				AltArt = true,
				Bio = "I LOVE INJECTING!!! I LOVE PUTTING ENZYME INTO DEAD PEOPLE!!!"
			},
			["BIGFATCHICKEN25, The Blue King"] = {
				Id = 99020396523810,
				Name = "BIGFATCHICKEN25, The Blue King",
				PremiumArt = 388,
				AltArt = true,
				Bio = "I'll teach that red rapscallion to corrupt my cards!"
			},
			Jaguar = {
				Id = 126737174143038,
				Name = "Jaguar",
				AltArt = true,
				Bio = "The moon is dim."
			},
			["JUJ WEW"] = {
				Name = "JUJ WEW",
				Id = 85129012302297,
				PremiumArt = 844,
				SummonAnimation = "BiggsSummon",
				SummonedAnimation = "BiggsSummon",
				AttackEffect = "Gun",
				EffectAnimation = "QuickScanGraveyard",
				AltArt = true,
				Bio = "\"Being alone is only lonely if you want it to be.\""
			}
		},
		Health = 500,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 2, Blue = 4 },
		EffectVariable = 0,
		CustomReminderInject = true,
		SummonAnimation = "Astarossa2Summon",
		SummonedAnimation = "Astarossa2Summon",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://245854775", "rbxassetid://13624260457" },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast an action or zombified card: Inject a card in your graveyard that costs fewer total studs than that card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"MoveZone",
							{ "VariableOrLower", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					Zombified = true,
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"MoveZone",
							{ "VariableOrLower", "GraveZone_Ally", "Hand_Ally", true, false }
						}
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
			Injecting = true
		},
		Bio = "\"Immortality is a soul-crushing responsibility. Those pathetic enough to proselytise it should hold no power at all.\""
	},
	["Egregious Entryism"] = {
		Id = 13293020071,
		Name = "Egregious Entryism",
		AltCards = {
			["Egregious Entryism-E"] = { Name = "Hop n' Skip", Id = 16932159797, Bio = "Boingy, boingy..." }
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		CustomReminder = {
			["Stalwart Politics"] = "Terrains go to the terrain zone, even if they have stats."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Select a non-Zombified, non-action card in your deck that costs 4 or fewer total studs. Inject that card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, true },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					},
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { CostOrLess = 4, NotAction = true, Zombified = false },
						SelectionDescription = "a card from your deck"
					}
				}
			},
			Injecting = true
		},
		Bio = "\"These Astral Faith imbeciles would kidnap and immortalise others in my name? I've seen greater intelligence in wall grout.\"<br/>- Astarossa, Mayor of Bloxburg"
	},
	["Schism in the Party"] = {
		Id = 13293073801,
		Name = "Schism in the Party",
		AltCards = {
			["Schism in the Party-E"] = {
				Id = 119340351783409,
				Name = "The King's Screech",
				AttackEffect = "Scratch",
				Bio = "A squeak loud enough to wound the soul."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 3, Blue = 3, Neutral = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		CustomReminder = {
			["Hung Parliament"] = "If the number of cards in your hand is odd, inject the left half of your hand rounded down."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 4 cards, then shuffle each card in your hand that costs 5 or more total studs into your deck.\nThen inject the leftmost half of your hand. ",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 4, "Ally" },
						{ "SpecificDiscard", 30, "CustomTarget" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "TotalCostOrMore",
						Modifier = 5
					}
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Round", "Math", 0, "Nil" },
							"Self"
						},
						{ "InjectHand", "Variable", "Ally" }
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
			EffectSpecificDiscardShuffle = true,
			EffectSpecificDiscardObliterate = true
		},
		Bio = "Immortality isn't a good thing for one's humanity. The select few of Astarossa's committee who realized this were the lucky ones."
	},
	["A Candid Conversation"] = {
		Id = 13292970972,
		Name = "A Candid Conversation",
		AltCards = {
			["A Candid Conversation-E"] = {
				Name = "Book of Furious Spells",
				Id = 17014189778,
				Bio = "\"please lay off me there are only so many jokes i can fit into my magic den\" - Lapin, Grand Vivizier"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 2, Blue = 3, Neutral = 2 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target fighter.\nReset the stats of a target fighter.\nSwap a target fighter's stats.\nDeal 200 damage to a target fighter. ",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AddCopy",
							30,
							"Single",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "Single" },
						{ "EVGreaterValueCheck", 0 }
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
						{ "Reset" },
						{ "Swap" },
						{ "Damage", 200 }
					},
					Target = "Single",
					UniqueTargets = true,
					NoBlip = true
				}
			},
			Injecting = true,
			AddCopyToOwner = true
		},
		Bio = "Kingrin puffed his chest up at the cornered Astarossa, threatening unspeakable acts to his body. The mayor feigned interest; He found such insecure \"monsters\" truly pitiable."
	},
	["Zoomba Rebel"] = {
		Id = 94491405695271,
		Name = "Zoomba Rebel",
		AltCards = {
			["Zoomba Rebel-Sun"] = {
				Name = "Plank-Walking Mutineer",
				Id = 13660426187,
				Bio = "The pirates invented a new way to torture traitors."
			},
			["Divine Doombringer, SoulSearch"] = {
				Name = "Divine Doombringer, SoulSearch",
				Id = 14726825106,
				AltArt = true,
				PremiumArt = 112,
				EffectAnimation = "HallowScytheSelf",
				AttackEffect = "Flare",
				Bio = "<b><font color=\"#FF5733\">\"Seekers of a broken order: Dare you look upon the truth?\"</font></b>"
			},
			["Eternal Lovers"] = {
				Name = "Z",
				Id = 90277593942963,
				AltArt = true,
				PremiumArt = 255,
				EffectAnimation = "HallowScytheSelf",
				AttackEffect = "Flare",
				Bio = "Let me see through your cards.<br/>Let me see through.<br/>Let me see through."
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Neutral = 1, Red = 5 },
		EffectVariable = 0,
		EffectAnimation = "Zoomba",
		Liberate = true,
		CustomReminder = {
			Fleeting = "A fleeting card is destroyed if it's not cast by its end step."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Reveal the oldest card in your opponent's hand. It becomes fleeting.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealCard" },
						{ "GivePassive", "Fleeting" }
					},
					Target = "EnemyLeftMostHand"
				}
			}
		},
		Bio = "A zoomba's finanical insurance is barely enough to compensate for its existential pain."
	},
	["Cothrite Infiltrator"] = {
		Id = 13292999664,
		Name = "Cothrite Infiltrator",
		AltCards = {
			["Cothrite Infiltrator-Sun"] = {
				Id = 13687961171,
				Name = "Mutineers",
				AttackEffect = "TimeBomb",
				Bio = "\"Avast ye! This is a mutiny, scallywag! Give 'em no quarter!!\""
			}
		},
		Health = 200,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Green",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: A target fighter gains 300 Health. It also gains 300 Power if it's fading.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 300 },
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "Fading" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Cothran's guerilla warfare tactics are still taught to this day."
	},
	["Corporation's End"] = {
		Id = 13293139145,
		Name = "Corporation's End",
		AltCards = {
			["Corporation's End-Sun"] = {
				Id = 13660501500,
				Name = "Lucky Shot",
				Bio = "Monsters got no noggin to one tap with? Just get lucky, matey!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Neutral = 1, Green = 7 },
		EffectVariable = 0,
		Liberate = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Destroy" } },
					Target = "Single"
				}
			}
		},
		Bio = "Apollo stared down at the burning warehouses, the fetid stench of burning assaulting his nose. He felt sadness, of course. But he felt a weight lifted off his shoulders."
	},
	["Newman's Advocate"] = {
		Id = 13292974002,
		Name = "Newman's Advocate",
		AltCards = {
			["Newman's Advocate-Sun"] = {
				Id = 13660424487,
				Name = "Pirate Lookout",
				Bio = "\"Attention! There's a ship near us to plunder!\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Red",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All cards in play and in your hand lose fading.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RemovePassive", "Fading" },
						{ "RemovePassive", "Fading", "AllyHand" }
					},
					Target = "All"
				}
			}
		},
		Bio = "\"If you wanna keep that beard, start talking, Bigshot.\""
	},
	["The Lunar Arch"] = {
		Id = 13293080813,
		Name = "The Lunar Arch",
		AltCards = {
			["The Lunar Arch-Sun"] = {
				Id = 13660504420,
				Name = "The Crownfeller",
				Terrariant = "Vecross' Legacy-Sun",
				Bio = "What the Crownfeller lacks in actual durability compared to other ships at the time, it makes up for by looking incredibly intimidating."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		AlternateCostRequirement = { "HasPassive", "Ally", 1, 9999, "Fading" },
		AlternateCost = { IgnoreColor = "Neutral" },
		Cost = { Red = 1, Green = 1, Neutral = 4 },
		EffectVariable = 0,
		Terrariant = "Vecross' Legacy",
		Terrain = true,
		Liberate = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card ignoring its {W} cost if there's an allied fading fighter.\nWhenever your third fighter attacks each turn: It gains 750 Power until the next end step. Destroy this card.",
			Ability = {
				OnAllyAttack = {
					Power = {
						{ "TempStrengthen", 750, "Aggressor" },
						{ "DestroyTerrain" },
						{ "DestroyGear", "The Lunar Arch", "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "AttackCount" }
				}
			}
		},
		Bio = "A reminder of Javion. Of why they're here now. Of what they need to do to rebuild."
	},
	["Blunt Vigilantism"] = {
		Id = 13293129319,
		Name = "Blunt Vigilantism",
		AltCards = {
			["Blunt Vigilantism-Sun"] = {
				Id = 13660499242,
				Name = "Duelin' Davy Jones",
				Bio = "The only metal that could withstand Davy Jones' infernal blade is Pure Necronium.\n\t\t\t\tThankfully, Captain Newman found a conveniently placed stash at the local cursed tomb three fortnights ago."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Red",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Cost = { Neutral = 2, Green = 3, Red = 3 },
		EffectVariable = 0,
		Liberate = true,
		Effect = {
			Name = "Haydoscale",
			Description = "A target enemy fighter gains 200 Health and Power.\nDeal 900 damage to all other fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" }
						},
						{ "Damage", 900, "CustomTarget" }
					},
					Target = "SingleEnemy",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "NotEVTarget"
					}
				}
			}
		},
		Bio = "As Thec stood over a broken and helpless Apollo, he forgot about the other intruder in the building. <br/>...and her disdain for him. "
	},
	["NecroForensics Corporation"] = {
		Id = 13465134422,
		Name = "NecroForensics Corporation",
		AltCards = {
			["NecroForensics Corporation-C"] = {
				Name = "Helliday",
				Id = 74637442204294,
				AttackEffect = "FirePunch",
				Bio = "A city of frozen hearts and unthawed hopes."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Blue = 2, Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Unshackled Mind",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns: Seance a card in your opponent's graveyard that died or was cast.\nWhenever you discard your third card each turn: Divide a target fighter into 2 copies of itself.",
			Ability = {
				OnAllyStart = {
					Power = { {
						"MoveZone",
						{ "200OrLower_IsFair", "GraveZone_Opponent", "Field_Ally", true, false },
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
				},
				OnAllyDiscard = {
					Power = { { "SummonSplit", 2, "Single" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			},
			Seancing = true
		},
		Bio = "The NeFoCo produce the Enzyme at an industrial scale, attracting idealists and opportunists alike."
	},
	["Organoid Officer"] = {
		Id = 13293057205,
		Name = "Organoid Officer",
		AltCards = {
			["Organoid Officer-C"] = {
				Name = "Heatsuit Pummeler",
				Id = 15176638201,
				AttackEffect = "FirePunch",
				Bio = "The suit, devised by Deuz, allows the user to safely traverse the frost, thawing any Hellhail. The punching functionality wasn't intended, but welcome."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Hammer",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: You gain {B}{Y}. Seance a card in your graveyard that's died or was cast.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Blue", 1 },
						{ "Yellow", 1 },
						{
							"MoveZone",
							{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
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
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"I know it's a bit weird being grafted onto me like this, Steve,\" commented Susan.<br/>\"But I appreciate your decades of cop experience, and your company. \"<br/>The brain wiggled in affirmation."
	},
	["Mass Production"] = {
		Id = 13293327038,
		Name = "Mass Production",
		AltCards = {
			["Mass Production-C"] = {
				Name = "Wrap Overdrive",
				Id = 15407460032,
				AttackEffect = "FirePunch",
				Bio = "The hellhailers will think twice if they dare steal presents from the inventive duo's workshop. Otherwise, they'd become presents themselves."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Seance the bottom 3 cards of your opponent's deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
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
		Bio = "\"Why bother with sustainability? A mere drop of this enzyme makes us millionaires.\"<br/>- Apate, Demon Investor"
	},
	["Insider Crook"] = {
		Id = 13550057371,
		Name = "Insider Crook",
		AltCards = {
			["Insider Crook-C"] = {
				Name = "Hot Cocoa Grenadier",
				Id = 15254705902,
				AttackEffect = "Bottle",
				Bio = "What kind of nerd invents a gun that turns stuff into hot chocolate without testing it? It's time for an open beta!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 3, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Seance the top card of your opponent's graveyard.\nWhenever an allied fighter dies, if it had total stats 500 or less: All allied fighters gain 50 Power until their next end step.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Opponent", "Field_Ally", false, false },
						"CustomTarget",
						nil,
						nil,
						"SeanceAsyncOpponent"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					},
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					NoBlip = true
				},
				OnAllyDeath = {
					Power = { { "TempStrengthen", 50, "Ally" } },
					Target = "Ally",
					SizeClass = "Picant"
				}
			},
			Seancing = true
		},
		Bio = "As the largest producer of the enzyme, NeFoCo couldn't stay corruption-free for long."
	},
	["Halogenic Sprayer"] = {
		Id = 13550054450,
		Name = "Halogenic Sprayer",
		AltCards = {
			["Halogenic Sprayer-C"] = {
				Name = "Hellhail Mist Mage",
				Id = 15628929423,
				AttackEffect = "FirePunch",
				Bio = "Who touched the thermostat?!"
			},
			roros7 = {
				Id = 17771965688,
				Name = "roros7",
				AttackEffect = "Blaze",
				AltArt = true,
				Bio = "It's a fun card game when you can have turns that take entire minutes to do"
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Swamp",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Yellow = 2, Blue = 2, Neutral = 1 },
		EffectVariable = 3,
		Rank = 5,
		Effect = {
			Name = "Reincarnation",
			Description = "Up to 3 times each turn, whenever you discard a card: Seance a card in your graveyard that costs 1 or fewer total studs.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"MoveZone",
							{ "1OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						}
					},
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					TurnTriggerLimit = 3
				}
			},
			Seancing = true
		},
		Bio = "\"Apollo must be an idiot if he thinks this can't be abused. You could zombify entire crowds at once with this.\"<br/>-McKayla Newman"
	},
	["Facing the Ripper"] = {
		Id = 13293224613,
		Name = "Facing the Ripper",
		AltCards = {
			["Corporate Standoff"] = {
				Id = 14840634784,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "Corporate Standoff",
				Commissioner = { 437605973 },
				PremiumArt = 115,
				Bio = "Some of the workers in NeFoCo truly wished to make the world a better place. They would not let the last vials of enzyme be lost without a fight."
			},
			["Facing the Ripper-C"] = {
				Id = 15252287194,
				Name = "Season's Beatings",
				Bio = "Etapa stanced up against the couple. Their determination was stirring his heart for the first time in ages."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 1, Blue = 1, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Each fighter with the lowest Power gains 800 Power until their next end step.",
			Ability = {
				OnSummon = {
					Power = { { "TempStrengthen", 800, "LowestPower" } },
					Target = "Self"
				}
			}
		},
		Bio = "Thec cackled in unerring confidence. Apollo stared with a calm vengeance. Taking a deep breath, he answered the Ripper's laugh with a determined smile. <br/>He would pay him the debt he is owed with his own hands."
	},
	["Eternal Justice Mk.2"] = {
		Id = 13293024986,
		Name = "Eternal Justice Mk.2",
		AltCards = {
			["Eternal Justice Mk.2-C"] = {
				Id = 15252289490,
				Name = "Hellhail Giftshredder",
				AttackEffect = "Scratch",
				Bio = "The Hellhailers ruin all the holiday cheer, feeding on it. They shred presents and tear apart whatever's inside them. How cold of them."
			}
		},
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
			Description = "Whenever this card attacks: Lock a target enemy fighter for 1 turn. Then seance a card in your graveyard that's died or was cast.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Lock", 1, "SingleEnemy" },
						{
							"MoveZone",
							{ "200OrLower_IsFair", "GraveZone_Ally", "Field_Ally", true, false },
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
	["Faith and Integrity, Twin Arms"] = {
		Id = 13293035985,
		Name = "Faith and Integrity, Twin Arms",
		AltCards = {
			["Faith and Integrity, Twin Arms-C"] = {
				Id = 15252286999,
				Name = "Etapa, Heartfreezer",
				AttackEffect = "IcePunch",
				Bio = "An ancient frost troll that spread cold and misery where ever he goes. What started off as a Havaluain tale to teach naughty children to behave, turned out to be true."
			},
			["SaltyNope, Dual Color Duelist"] = {
				Id = 15706305114,
				Name = "SaltyNope, Dual Color Duelist",
				AltArt = true,
				PremiumArt = 173,
				Bio = "\"This is me when I uh erm uh, commit arson on the local grocery store.\""
			},
			["Twin Blades of Hexaria"] = {
				Id = 18199514972,
				Name = "Twin Blades of Hexaria",
				AltArt = true,
				PremiumArt = 271,
				Bio = "One sword for trust. One sword for betrayal."
			}
		},
		Health = 1250,
		Power = 1250,
		Rarity = "Epic",
		AttackEffect = "ApolloAttack",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Blue = 5, Yellow = 5 },
		EffectVariable = 0,
		Rank = 7,
		Dextrous = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks and destroys another, or an opponent targets it: Seance the bottom 2 cards of your opponent's deck.",
			Ability = {
				OnTargetByEnemy = {
					Power = { { "EVExactValueCheck", 0, "Self" } },
					Target = "Opponent"
				},
				OnAttackDestroy = {
					Power = { { "EVExactValueCheck", 0, "Self" } },
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Opponent", "Field_Ally", false, false },
							"Self"
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
			Seancing = true,
			AllowDeadAggressorTriggers = true
		},
		Bio = "\"Thank you, Thec.\"<br/>Apollo smiled at the man who destroyed his parents and his childhood. \"You forced me to put my intellect to good use just to be a person. I would never have been half the man I am without you. So come! Let me show you the fruits of your labour!\""
	},
	["Apollo, Fearless"] = {
		Id = 13550024366,
		Name = "Apollo, Fearless",
		AltCards = {
			["Apollo, Fearless-Banner"] = {
				Name = "Apollo",
				Id = 13496289989,
				Bio = "The stars in the sky do not waver until they are fully extinguished. Prepare yourself, for a syndicate will fall tonight."
			},
			["Apollo, Fearless-Offer"] = {
				Name = "Apollo, Fearless",
				Commissioner = { 30244924, 105850517, 8289996 },
				ArtAnimation = "ApolloFearless",
				Id = 13621746820,
				Bio = "Closing his eyes for a moment, he turned his head towards his personal inventing table - one last memento from his parents. A project of his whirred softly in the quiet air of the office. His regretfulness turned into a deep resolution. He would face the man who called himself The Robloxcity Ripper and deliver him his due, personally."
			},
			["Apollo, Fearless-C"] = {
				Name = "Leto K. Phoebe, Celebrant Creator",
				Id = 15564057782,
				Bio = "Christmas is already difficult for moms around the world. Make it any harder and you're going to learn what parental rage looks like."
			},
			["Apollo, Fearless-ET"] = {
				Name = "Xhartyr - Lone Traveler",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Id = 16446070714,
				Bio = "\"I give my regards and appreciation to everyone who put their efforts in the Heights Expedition Project, even if our interests were not necessarily aligned.<br/>May your strikes ring true, and fell the obstacles which stand in the way of what you fight for.\"<br/>Humbly,<br/>Xhartyr."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "ApolloAttack",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 7, Blue = 1 },
		EffectVariable = 1,
		ReplaceDescriptionant = "Level Variable. (Max 8)\nOnce each turn, whenever an enemy fighter dies: This card gains a level. Draw 2 cards, then seance each card in your hand that costs as many or fewer total studs than this card's level. Then if you have no cards in your deck, all allied fighters gain 800 Power.",
		SummonAnimation = "ApolloFearless",
		SummonAnimationEffect = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Level 1. (Max 8)\nOnce each turn, whenever an enemy fighter dies: This card gains a level. Draw 2 cards, then seance each card in your hand that costs as many or fewer total studs than this card's level. Then if you have no cards in your deck, all allied fighters gain 800 Power.",
			Ability = {
				OnEnemyDeath = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "Draw", 2, "Ally" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Field_Ally", false, false },
							"CustomTarget",
							nil,
							nil,
							nil,
							"Seance"
						},
						{
							"AlterEV",
							{ "Cap", "Math", 8, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "TotalCostOrLess",
						Modifier = "Variable"
					},
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 800 } },
					Target = "Ally",
					EffectRequirement = { "Deck", "Ally", 0, 1, "Cards" }
				}
			},
			Seancing = true
		},
		Bio = "\"The Necroenzyme is unfairly considered a violation of the natural law. I see a different look on it: As a remedy for those who grieve.\""
	},
	["Biggs, Liquidated"] = {
		Id = 98945108123281,
		Name = "Biggs, Liquidated",
		AltCards = {
			["Biggs, Liquidated-Banner"] = {
				Id = 13496265515,
				Name = "The Essentia 2000",
				AttackEffect = "Slash",
				Transformant = "Biggs, Immortal Mogul-Banner",
				Bio = "I think it is necessary that I first introduce myself. I am The Essentia 2000. I am an android, made from two-part epoxy resin and melamine. My consciousness is natural, but my physical form is man-made. I exist in all realities simultaneously and can account for all parallel versions of my soul. You and I have met time and time again."
			},
			["Biggs, Liquidated-Event"] = {
				Id = 13624435038,
				Name = "Biggs, Creare",
				AttackEffect = "MagicGreen",
				Transformant = "Biggs, Immortal Mogul-Event",
				Bio = "\"Hey, Bigg Spenders! Turns out my grind can be converted into actual magic! Your Top B now has absolute power! I'll see you when I get to the top of the world! Biggs, signin' off!\""
			},
			["Biggs, Liquidated-Offer"] = {
				Id = 97594359574633,
				Name = "Biggs, Chained",
				AttackEffect = "Punch",
				Transformant = "Biggs, Immortal Mogul-Offer",
				Commissioner = { 14640960 },
				Bio = "\"This prison... to hold... ME?\""
			}
		},
		Health = 1200,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Green = 4, Yellow = 4 },
		SummonAnimation = "BiggsSummon",
		SummonedAnimation = "BiggsSummon",
		SummonAnimationEffect = true,
		ReplaceDescriptionant = "Level Variable. (Max 25)\nWhen this card is cast: Give yourself 5 money stack cards.\nWhenever you cast a token action: This card levels up and you gain a colourless stud. Then, if this card is max level: Ban your opponent.",
		EffectVariable = 1,
		Transformant = "Biggs, Immortal Mogul",
		Effect = {
			Name = "Haydoscale",
			Description = "Level 1. (Max 25)\nWhen this card is cast: Give yourself 5 money stack cards.\nWhenever you cast a token action: This card levels up and you gain {W}. Then ban your opponent if this card is max level.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingRandomAdd",
						{
							{ "Tix Stack", "Targeting Blip" },
							5
						},
						"Ally"
					} },
					Target = "Self"
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "Neutral", 1 },
						{ "EVGreaterValueCheck", 23, "Self" }
					},
					Target = "Ally",
					Rarity = "Token"
				},
				OnEVCheckPass = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "\"We're back, bigger and better! Can't keep a lich down for long!\""
	},
	["Flesh Fashionista"] = {
		Id = 13293160180,
		Name = "Flesh Fashionista",
		AltCards = {
			["Experimented Absolution"] = {
				Id = 13822684527,
				Name = "Experimented Absolution",
				AttackEffect = "FloofyScratch",
				PackDisplayOverride = "IcyTea",
				Commissioner = { 3861664696 },
				Bio = "\"This was a successful experiment, RIGHT?!\""
			},
			["Flesh Fashionista-Hal"] = {
				Id = 14959556647,
				Name = "Northwood Shaman",
				AttackEffect = "MagicGreen",
				EffectAnimation = "RootCause",
				Bio = "They say the soil speaks to me, yet all I can hear is \"SQUELCH SQUELCH SPLOICH SQUELCH\"."
			},
			["Flesh Fashionista-Auto"] = { Id = 90206866587130 },
			["Ray Burn"] = {
				Id = 17346074433,
				Name = "Ray Burn",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 259,
				Bio = "Not to be confused with Rayburn."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Green",
		Cost = { Yellow = 5 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: It gains 50 Health and Power for each different name among cards in your graveyard. It gains 100 instead if you're in bliss.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "UniqueName", "All" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTrigger" },
						{ "Strengthen", "Variable" },
						{ "Heal", "Variable" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"This... this is who I was always meant to be!\""
	},
	["Your Authentic Self"] = {
		Id = 13293188256,
		Name = "Your Authentic Self",
		AltCards = {
			["Your Authentic Self-Hal"] = {
				Name = "Switcheroo!",
				Id = 14973435990,
				Summonant = "Zombified Catgirl-Hal",
				EffectAnimation = "Poof",
				Effect = {
					Name = "Reincarnation",
					Description = "Obliterate a target fighter, summoning a Zombified Catgirl with its stats in its stead.\nYou summon a 100/100 clone of that fighter."
				},
				Bio = "There you were! Here you are!"
			},
			["Your Authentic Self-Auto"] = {
				Id = 89294892810693,
				Summonant = "Zombified Catgirl-Auto",
				Effect = {
					Name = "Reincarnation",
					Description = "Obliterate a target fighter, summoning a Zombified Catgirl with its stats in its stead.\nYou summon a 100/100 clone of that fighter."
				},
				Bio = "The broken body that was, or the broken brain that is. Which one could claim to be the real Caitlin?"
			},
			["Pawesome Sleepover"] = {
				Id = 98204140742807,
				Name = "Pawesome Sleepover",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 471,
				Bio = "The zombified catgirls occupied the bed again!!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		EffectVariable = 0,
		Summonant = "Zombified Catgirl",
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate a target fighter, summoning a Zombified Catgirl with its stats in its stead.\nYou summon a 100/100 copy of that fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "Health", "TargetHealth" },
							"Single"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Power", "TargetPower" },
							"Single"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "TargetIndex" },
							"Single"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Single"
						},
						{ "Summon", "Summonant", "EVCardOwner" },
						{ "Obliterate", 30, "Single" },
						{
							"AlterEV",
							{ "Load", "Math", 0, "TargetPower" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "SummonedCard" },
						{
							"AlterEV",
							{ "Load", "Math", 0, "TargetHealth" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 100, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "SummonedCard" },
						{
							"AlterEV",
							{ "Load", "Math", 0, "TargetIndex" },
							"Self"
						},
						{ "Summon", "Variable", "Ally" }
					},
					Target = "EVCardOwner",
					MetaData = { Health = 100, Power = 100 }
				}
			}
		},
		Bio = "The broken body that was, or the broken brain that is. Which one could claim to be the real Caitlin?"
	},
	["Hunting Party"] = {
		Id = 13293166264,
		Name = "Hunting Party",
		AltCards = {
			["Hunting Party-Hal"] = {
				Id = 14959555490,
				Name = "Feline Spelltrasher",
				AttackEffect = "MagicYellow",
				Bio = "<b>MeOOWWWWWW!!!!</b>"
			},
			["Hunting Party-Auto"] = { Id = 128614792877546 }
		},
		Health = 550,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1, Green = 1 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		CustomReminder = {
			ViOwOlence = "Marked Fighters take 100 additional damage from combat and effects."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Mark all enemy fighters. Then if you're in bliss, deal 50 damage to all enemy fighters and they lose 50 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"GivePassive",
							"Marked",
							nil,
							nil,
							nil,
							nil,
							"CatMark"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Opponent"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{
							"Damage",
							50,
							nil,
							nil,
							nil,
							nil,
							"SmallRifleEffectAsync"
						},
						{ "Weaken", 50 }
					},
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"OwO! We bwetter find that robo-lady and twear her apawt, nya! ~♪\"\""
	},
	["Catlyn Nyaxon, Hunter"] = {
		Id = 14178294214,
		Name = "Catlyn Nyaxon, Hunter",
		AltCards = {
			["Catlyn Nyaxon, Hunter-Offer"] = {
				Name = "Catlyn Nyaxon",
				Id = 13507669892,
				ArtAnimation = "CatlynNyaxonAnim",
				Bio = "\t\t\t\t\t<i>Caitlin Nixon - Age 30 - Biological Body Deceased at Age 20</i>\n\t\t\t\t\t<i>Currently undergoing prosthetic body treatment.</i>\n\n\t\t\t\t\t<i>Biological Body Status : Missing</i>\n\t\t\t\t\t"
			},
			["Catlyn Nyaxon, Hunter-IDK"] = {
				Name = "Catlyn",
				Id = 113823967623006,
				AltArt = true,
				PremiumArt = 51,
				Bio = "Caitlin regretted installing high resolution visual modules."
			},
			["Catlyn Nyaxon, Hunter-Hal"] = {
				Name = "Gregory, Knowledgable Pawfessor",
				Id = 14973231151,
				AttackEffect = "LaserYellow",
				Bio = "\"Don't mistake me for my cheezburger chowing brother. I can conjure some pawerful spells, you know?\""
			},
			["Catlyn Nyaxon, Hunter-Auto"] = { Id = 95133734877302 },
			["Cam, Nocturnal Nerd"] = {
				Id = 82374407143572,
				Name = "Cam, Nocturnal Nerd",
				ArtAnimation = "CamNocturnalNerd",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 684,
				Bio = "\"have you ever played midnight horrors with your good vibes on the line- hold on my moms walking in\""
			}
		},
		Health = 1200,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Axe",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Color = "Yellow",
		Cost = { Yellow = 2, Green = 7 },
		EffectVariable = 0,
		CustomReminderBliss = true,
		SummonAnimation = "Catlyn",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://13482994684", "rbxassetid://13482994871" },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select up to 3 cards in your opponent's graveyard, or all of them if you're in bliss. Put them into your baseplate.\nWhenever a fighter dies: Put a non-Colourless card in your baseplate into your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 },
						{ "EVGreaterValueCheck", 3 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTrigger" },
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "GenZone_Ally", true, false, 999 },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Math", 4, "Nil" }
						}
					},
					Target = "AllyToken",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				},
				OnEVCheckFail = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Opponent", "GenZone_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = { Colored = true },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three cards from your opponent's Graveyard"
					}
				},
				OnAnyDeath = {
					Power = { {
						"MoveZone",
						{ "Colored", "GenZone_Ally", "Hand_Ally", true, false, 1 },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "A wish to provide someone a chance at a life filled with nothing but happiness, twisted into degeneracy and desperation."
	},
	["The PLURRALITY"] = {
		Id = 13293181124,
		Name = "The PLURRALITY",
		AltCards = {
			["The PLURRALITY-Hal"] = {
				Id = 14983220302,
				Name = "Southside City",
				Terrariant = "Toxic Positivity-Hal",
				Summonant = "Zombified Catgirl-Hal",
				Bio = "The City that Never Sleeps!\n(conventionally)"
			},
			["The PLURRALITY-Auto"] = {
				Id = 72042346047912,
				Terrariant = "Toxic Positivity-Auto",
				Summonant = "Zombified Catgirl-Auto"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Green = 2, Yellow = 2 },
		EffectVariable = 0,
		Summonant = "Zombified Catgirl",
		Terrain = true,
		Terrariant = "Toxic Positivity",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon 2 100/100 Zombified Catgirls that're inert in all zones.\nDuring your end step, if 4 or more allied fighters died this turn: Draw 2 cards.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingSummon",
						{ "Summonant", 2 },
						"Ally"
					} },
					Target = "Self"
				},
				OnEnd = {
					Power = { { "Draw", 2 } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 4, 9999, "TurnDeathStorm" }
				}
			}
		},
		Bio = "The club of the PLURRALs allows people to drown their sorrows away in pleasure."
	},
	["Harrison's Studio"] = {
		Id = 13465139622,
		Name = "Harrison's Studio",
		AltCards = {
			["Harrison's Studio-V"] = {
				Id = 16294580220,
				Name = "Harrison's Trailer",
				AttackEffect = "Punch",
				Bio = "Can't a man have a little peace and quiet...",
				Terrariant = "Veil of Damnation-V"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Red = 2, Yellow = 2 },
		EffectVariable = 0,
		Terrain = true,
		ReplaceDescriptionant = "Chosen card: Variable \nWhen this card is cast: Deal 600 damage to a target enemy fighter and note its name.\nAt the start of your turns: Ransack 1. If you do, your opponent summons all cards with the noted name in their graveyard as 50/50 fighters.",
		Terrariant = "Veil of Damnation",
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 600 damage to a target enemy fighter and note its name.\nAt the start of your turns: Ransack 1.\nIf you do, your opponent summons all cards with the noted name in their graveyard as 50/50 fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Name", "Nil" },
							"SingleEnemy"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{
							"AlterEV",
							{ "Save", "Target", "SanitiseCardInstanceInput", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardIndexOriginal", "CardIndex" },
							"SingleEnemy"
						},
						{ "Damage", 600, "SingleEnemy" }
					},
					Target = "Self"
				},
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
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "a card to Ransack",
						MinTargets = 0,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndexOriginal", "CardIndex" },
							"Self"
						},
						{
							"MoveZone",
							{ "Variable", "GraveZone_Opponent", "Field_Opponent", true, false, 99 },
							"Self"
						}
					},
					Target = "Ally",
					MetaData = { Health = 50, Power = 50 }
				}
			}
		},
		Bio = "Kingrin is a humble yet passionate artist, with terror as his medium and gore as his paint."
	},
	["Grinning Goliath"] = {
		Id = 116935518169753,
		Name = "Grinning Goliath",
		AltCards = {
			["Grinning Goliath-V"] = {
				Id = 16283037137,
				Name = "Stereotypical Guitar Guy",
				AttackEffect = "Punch",
				Bio = "\"Ok now here's Wonderwall!\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Yellow",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Neutral = 2, Red = 1, Yellow = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Ransack 3 nonfighter cards.\nIf you do, destroy the opponent's terrain and the oldest card in their hand.",
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
						Condition = { NotFighter = true },
						SelectionDescription = "up to 3 nonfighter cards to Ransack",
						MinTargets = 0,
						MaxTargets = 3
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "DestroyTerrain" },
						{ "SpecificDiscard", 1, "EnemyLeftMostHand" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "The Smilies make great gym buddies. Just don't mock the masks."
	},
	["Giggling Gangsters"] = {
		Id = 92168809777747,
		Name = "Giggling Gangsters",
		AltCards = {
			["Giggling Gangsters-V"] = {
				Id = 16056321538,
				Name = "Gangly Gangster",
				AttackEffect = "Punch",
				Bio = "Uh. Yeah. Yeah. You know I #### ###### #### #### ### ### #### ########## #####!!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "British",
		Color = "Red",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Neutral = 1, Red = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever a card leaves your graveyard: Deal 50 damage to all enemy fighters.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "Damage", 50 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "One's a smile, three's an audience, ten's a mob."
	},
	["Torturing Turncoat"] = {
		Id = 131801226414125,
		Name = "Torturing Turncoat",
		AltCards = {
			["Torturing Turncoat-V"] = {
				Id = 16117245982,
				Name = "Production Plant",
				AttackEffect = "Punch",
				Bio = "Why does this guy keep disappearing into the diary room for hours at a time???"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "British",
		Color = "Red",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Neutral = 2, Red = 2, Yellow = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		ReplaceDescriptionant = "Variable charges.\nWhenever a card leaves your graveyard: This card gains a charge.\nDuring your end step, if this card has 8 or more charges: Remove them all and give yourself 2 Red and 2 Yellow cards.",
		Effect = {
			Name = "Haydoscale",
			Description = "0 Charges.\nWhenever a card leaves your graveyard: This card gains a charge.\nDuring your end step, if this card has 8 or more charges: Remove them all. Give yourself 2 Red and 2 Yellow cards.",
			Ability = {
				OnAllyGraveRemove = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEnd = {
					Power = { { "EVGreaterValueCheck", 7 } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 8, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "RandomAdd", "MultiColOnlyorRedCostYellowCost Red" },
						{ "RandomAdd", "MultiColOnlyorRedCostYellowCost Red" },
						{ "RandomAdd", "MultiColOnlyorRedCostYellowCost Yellow" },
						{ "RandomAdd", "MultiColOnlyorRedCostYellowCost Yellow" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The only way to free yourself from the Smilies' cruel torture is an answer they want."
	},
	["Heaven Smiles"] = {
		Id = 13293049845,
		Name = "Heaven Smiles",
		AltCards = {
			["Heaven Smiles-V"] = {
				Id = 16294712188,
				Name = "Last Man Standing",
				AttackEffect = "Punch",
				Bio = "Maybe not all nice guys finish last."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Red",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Neutral = 1, Red = 2, Yellow = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "X is 100 times the number of cards you've obliterated this turn.\nA target fighter gains X Health.\nA target fighter gains X Power.\nA target fighter loses X Power.\nDeal X damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ObliterateCount", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Heal", "Variable", "Single" },
						{ "Strengthen", "Variable", "Single" },
						{ "Weaken", "Variable", "Single" },
						{ "Damage", "Variable", "Single" }
					},
					Target = "Self",
					UniqueTargets = true
				}
			}
		},
		Bio = "\"Monsters don't have feelings. For a man who glorifies violence, you seem reticent to have such cruelties befall your friends.\"<br/><br/>No amount of cruelties at Bloxburg's Mayor could undo the seed of doubt planted in Harrison's head."
	},
	["Smiling Spawn"] = {
		Id = 138517836249563,
		Name = "Smiley Spawn",
		AltCards = {
			["Smiley Spawn-V"] = {
				Id = 16283036742,
				Name = "Scary Stalker",
				AttackEffect = "Knife",
				Bio = "Average 4chinner"
			}
		},
		Health = 100,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Yellow",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Cost = { Yellow = 1 },
		EffectVariable = 1,
		RansackCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you ransack a card: Give yourself a Money Stack card.",
			Ability = {
				OnAllyRansack = {
					Power = { {
						"RepeatingRandomAdd",
						{
							{ "Tix Stack", "Targeting Blip" },
							1
						},
						"Ally"
					} },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		CustomReminderRansack = true,
		Bio = "The Smileys are supportive of their children's hobbies."
	},
	MasterXertz = {
		Id = 135257165681865,
		Name = "MasterXertz",
		AltCards = {
			["MasterXertz-AN"] = {
				Name = "Abomination",
				Id = 13893830902,
				AttackEffect = "Scythe",
				Bio = ""
			},
			["MasterXertz-Hal"] = {
				Name = "Rosetta, the Vampiress",
				Id = 98021484784615,
				AttackEffect = "Bite",
				Bio = ""
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Rifle",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Unique = true,
		Effect = {
			Name = "Infinite Army",
			Description = "Whenever your opponent recurs a card, if it's their turn: Shuffle the oldest card in their hand into their deck.",
			Type = "OnEnemyRecur",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent",
			EffectSpecificDiscardShuffle = true,
			EffectRequirement = { "TheirTurn", "Me", 30, 303 }
		},
		Bio = "\"Some zombie story this is.\""
	},
	["Out of Retirement"] = {
		Id = 13293170357,
		Name = "Out of Retirement",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 7 },
		Lunar = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select an unranked fighter card in your graveyard that costs 9 or fewer total studs. Summon that card, except it's zombified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, CostOrLess = 9, Unranked = true },
						SelectionDescription = "a fighter to summon from your graveyard.",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "Astarossa savoured the great irony of his situation. In the world of immortality he built, one must do more than merely die for their principles."
	},
	["Survived Drakobloxxer"] = {
		Id = 13293373931,
		Name = "Survived Drakobloxxer",
		AltCards = {
			["Survived Drakobloxxer-AN"] = {
				Id = 13698802228,
				Name = "Party Blox Entertainer",
				AttackEffect = "Punch",
				SummonAnimation = "ClownHonk",
				DeathAnimation = "ClownDeath",
				EffectAnimation = "SmallRecyclablesEffectEnemy",
				AddGenZoneant = "Drakobloxxer-AN",
				Bio = "With a costume like that : If the dragons don't kill you, the heat will."
			}
		},
		Health = 400,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "LycanBite",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
		Archetype = "Drakobloxxer",
		Cost = { Neutral = 2, Red = 5 },
		AddGenZoneant = "Drakobloxxer",
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card destroys another: Deal 150 damage to all enemy fighters. Put a 'Drakobloxxer' into your baseplate, except it's inert in there.",
			Ability = {
				OnDestroy = {
					Power = {
						{ "Damage", 150 },
						{
							"AddGenZone",
							{ "AddGenZoneant", 1 },
							"Ally"
						}
					},
					Target = "Opponent",
					MetaData = { TokenGenZone = true }
				}
			}
		},
		Bio = "<b>YOU DIDN'T BUILD TO SURVIVE THEM WHAT DID YOU DO???!!!</b>"
	},
	["Remove All Traces"] = {
		Id = 13293068322,
		Name = "Remove All Traces",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2 },
		Fading = true,
		EffectVariable = 0,
		Lunar = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate all cards in all graveyards.\nDraw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{ "Draw", 1, "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Nothing is more dread-inducing than a funeral with an empty casket."
	},
	["Ripper's Gaze"] = {
		Id = 126814590371279,
		Name = "Ripper's Gaze",
		AltCards = {
			Sussy = {
				Id = 15657399021,
				Name = "Sussy",
				AltArt = true,
				SummonAnimation = "SuspiciousMeme",
				PremiumArt = 170,
				Bio = "<b><font color=\"#FF0000\"> GET OUT OF MY HEAD</font></b>"
			},
			["Sig, Wretched Veteran"] = {
				Id = 14387346568,
				Name = "Sig, Wretched Veteran",
				Commissioner = { 46070818 },
				AttackEffect = "Rifle",
				AltArt = true,
				PremiumArt = 101,
				Bio = "The Null Chrysanthemum was meant to curry a brief, but mutual respect for all the lives lost during the Demon Wars.\n\nSig Nalrad walked up on stage.\n"
			},
			["Ripper's Gaze-Sun-Offer"] = {
				Name = "Murderous Vacation",
				Id = 79539690907020,
				AttackEffect = "Slash",
				Bio = "Even the most prideful ripper needs a flex of his own break."
			}
		},
		Health = 50,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3 },
		Charge = true,
		TriggerInGraveZone = true,
		EffectVariable = 0,
		CardObliterateCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: Destroy this card.\nAt the start of your turns, if this card's in your graveyard and has died this game: You may pay 300 life and obliterate a selected Epic or Legendary card in it.\nIf you do, summon this card and unlock it.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"AlterEV",
							{ "ResetObliterate", "Math", 0, "Nil" },
							"Self"
						},
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "ObliterateCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {
							Rarities = { "Epic", "Legendary" }
						},
						SelectionDescription = "a Epic or Legendary card to obliterate.",
						MinTargets = 0,
						MaxTargets = 1
					},
					DontTriggerInField = true,
					EffectRequirement = { "SelfStats", "Self", 30, 30, "Death" }
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{ "Cost", 300, "Ally" },
						{ "Unlock", 9999, "Self" }
					},
					Target = "Self"
				},
				OnEnd = {
					Power = { { "Destroy" } },
					Target = "Self",
					DontTriggerInGraveZone = true
				}
			}
		},
		Bio = "Even a decade after his parents' deaths, even a year after he arrested the killer, Apollo could not escape his unblinking, endless judgement."
	},
	["Copycat Killer"] = {
		Id = 81094791570395,
		Name = "Copycat Killer",
		AltCards = {
			["Copycat Killer-Banner"] = {
				Name = "Red Intruder",
				Id = 13496284294,
				Bio = "<i>\"Right behind you.\"</i>"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		CustomReminder = {
			Decaying = "A decaying fighter is dealt 200 damage during its end steps."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: Obliterate the top 2 cards of your opponent's graveyard. A target fighter starts decaying.",
			Ability = {
				OnAttack = {
					Power = {
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
						{ "GivePassive", "Decaying", "Single" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = "BottomCard"
					}
				}
			}
		},
		Bio = "Only the brilliantly disturbed see Thec's disturbingly brilliant genius."
	},
	["Protracted Murder"] = {
		Id = 130525101229893,
		Name = "Protracted Murder",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 1 },
		Lunar = true,
		EffectVariable = 0,
		CustomReminder = {
			Decaying = "A decaying fighter is dealt 200 damage during its end steps."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter becomes zombified and starts decaying.\nYour opponent loses {W}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Decaying" },
						{ "GivePassive", "Zombified" },
						{ "Neutral", -1, "Opponent" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Counteract eternal life with eternal suffering."
	},
	["Zombified Satyr"] = {
		Id = 13653111279,
		Name = "Zombified Satyr",
		AltCards = {
			["Zombified Satyr-Hal"] = {
				Name = "Screaming Sirens",
				AttackEffect = "Microphone",
				Id = 14556107979,
				Bio = "The siren's howls mixed with the tearing of flesh makes an unpleasant melody."
			},
			["amas d'étoiles' rendez-vous"] = {
				Name = "amas d'étoiles' rendez-vous",
				AttackEffect = "Microphone",
				Id = 14840651239,
				PremiumArt = 116,
				AltArt = true,
				Bio = "abnormal experience during adolescence due to sensitivity and instability."
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Decaying = true,
		Zombified = true,
		EffectVariable = 0,
		CustomReminder = { ["Piercing Flames"] = "This card's effect doesn't deal damage." },
		Effect = {
			Name = "Haydoscale",
			Description = "If this card would take noncombat damage: All enemy fighters lose 100 Health first.",
			Ability = {
				OnEffectDamage = {
					Power = { { "PierceDamage", 100 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "Being revived only to fight a bunch of catgirl cosplayers can ruffle some feathers."
	},
	["Thec, the Robloxcity Ripper"] = {
		Id = 13293178682,
		Name = "Thec, the Robloxcity Ripper",
		AltCards = {
			["Thec, the Robloxcity Ripper-Offer"] = {
				Id = 73181108586799,
				ArtAnimation = "thecdummy",
				Bio = "AUTHORITIES SEARCH FOR THE MAN IN THIS VIDEO, CONTACT IF U HAVE ANY INFORMATION."
			},
			["Thec, the Robloxcity Ripper-Event"] = {
				Id = 13624436151,
				Name = "Thec Hiller",
				Bio = "<i>\"A slushberry sample with a concentration level of 0.9M - 1.0M will inflict intense boiling and burning upon an open wound. The easiest way to make use of such a substance is applying it to a sharp instrument, preferrably a deep-cutting tool such as a sickle.\"</i>"
			},
			["Thec, the Robloxcity Ripper-Sun"] = {
				Id = 13660500306,
				Name = "Davy Jones, Seven Seas' Sunderer",
				Bio = "\t\t\t\t\tHe's got a locker like no other,\n\t\t\t\t\tHe's vicious an' ambitious,\n\t\t\t\t\tGot a sucker as a pucker,\n\t\t\t\t\tHe's Mister Davy Jones! \n\t\t\t\t\t"
			},
			["Clique of Crime"] = {
				Id = 13697385383,
				Name = "Clique of Crime",
				AltArt = true,
				PremiumArt = 93,
				Commissioner = { 685990741, 2258263422, 1711805585, 118307013 },
				Bio = "A gang of awesome criminals. They're secretly cat lovers"
			},
			GAZE = {
				Id = 85234626906133,
				Name = "GAZE",
				AltArt = true,
				PremiumArt = 145,
				Bio = "- A lingering stare unwavering\n- An eternal feeling of falling\n- All of ye who meets his gaze\n- Shall become nothing more than a blood red haze"
			},
			["Kim_kkachi Lobotomy"] = {
				Id = 115967578784027,
				Name = "Kim_kkachi, Lobotomy E.G.O :: Smile",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 640,
				Bio = "\"Strike down and devour your enemies. There is no satisfaction.\""
			},
			["The Googlecake Trials"] = {
				Id = 82829573383774,
				Name = "The Googlecake Trials",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 701,
				Bio = "Welcome to the Googlecake Trials where you'll be competing for a 10 dollar robux giftcard! ... Sorry moony, youll be in the next one!<br/>I got a participation award - Lach Boy<br/>luis gamer cool is no noob - Skittles"
			}
		},
		Health = 1500,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "XhartyrSlash",
		Color = "Red",
		Cost = { Red = 10 },
		Overload = true,
		EffectVariable = 0,
		SummonAnimation = "ThecSummon",
		SummonedAnimation = "ThecSummon",
		SummonAnimationEffect = true,
		PreloadAssets = {
			"rbxassetid://13623357066",
			"rbxassetid://13613038354",
			"rbxassetid://13613222363"
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent targets this card: They lose 3000 Life.<br/>Whenever this card attacks: Obliterate the top three cards of your opponent's graveyard. This card gains their Health and Power.",
			Ability = {
				OnTargetByEnemy = {
					Power = { { "Inflict", 3000 } },
					Target = "Opponent"
				},
				OnAttack = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "Strengthen", "Variable" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "Strengthen", "Variable" },
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Nil", false, false },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "Strengthen", "Variable" },
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
		Bio = "The scariest thing in the world is a person who's completely aware of the limits of their cruelty."
	},
	["Polluted Vitality Wellspring"] = {
		Id = 13293007586,
		Name = "Polluted Vitality Wellspring",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2, Red = 8 },
		Terrain = true,
		Terrariant = "Dormant Deity",
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your opponent's end step, if they spent 15 or more seconds on their turn: They lose 1500 life.",
			Ability = {
				OnEnemyEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "TurnTimeSpent", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 15 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Inflict", 1500 } },
					Target = "Opponent"
				}
			}
		},
		Bio = "When we poison the earth, we poison ourselves."
	},
	["Brick Heights Columnist"] = {
		Id = 13292995384,
		Name = "Brick Heights Columnist",
		AltCards = {
			["Angry Attack Squirrel-Hal"] = {
				Id = 111463744400105,
				Name = "Heightser Greenthing",
				Bio = "Before the dawn of day which the Bloxy Awards started, a strange silver saucer appeared in the sky. After which 9 locals disappeared for a week until they were found in a nearby forest, dazed and confused..."
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		EffectVariable = 0,
		CustomReminder = {
			["Basic Literacy"] = "Colourless studs are ignored, because Colourless is not a colour."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a card, if it has exactly 2 colours in its stud cost: Summon a 200/200 Citizen with no abilities.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CostColors", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CostColors", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 2 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Summon", "Citizen" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Times were great when the enzyme flowed freely; Our greatest folly was failing to ensure its use was sustainable.\" <br/>-Brick Heights, Issue #104 - Farewell"
	},
	["Greenbelt Gharial"] = {
		Id = 13293047094,
		Name = "Greenbelt Gharial",
		Health = 500,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Green",
		Cost = { Green = 5 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card destroys another: Give yourself a Necroenzyme Vial.",
			Ability = {
				OnDestroy = {
					Power = { { "Add", "Necroenzyme Vial", "Ally" } },
					Target = "Self"
				}
			}
		},
		IsFood = true,
		Bio = "<b>nom!</b>"
	},
	["Dwarvern Cultivator"] = {
		Id = 13293015150,
		Name = "Dwarvern Cultivator",
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Dwarf",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Sentry Compost"] = "A 🟢🟢🟢 350/350 Green token. It can't counter and it's inert in all zones."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you discard a card: Give yourself a 350/350 Sentry Compost.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Add", "Sentry Compost", "Ally" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Dwarvern dialect is often quite difficult to understand. Thankfully, Caitlin's home language didn't stray far from the ingenious inventors."
	},
	["Sentry Compost"] = {
		Id = 13293017195,
		Name = "Sentry Compost",
		Health = 350,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Recyclables",
		Color = "Green",
		Archetype = "Component",
		Cost = { Green = 3 },
		CounterBlock = true,
		TokenOmni = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Nil = {
					Power = { { "Add", "Sentry Compost", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"It's the carbon. That's all you need to know.\""
	},
	["Distressed Tourist"] = {
		Id = 13293153327,
		Name = "Distressed Tourist",
		AltCards = {
			["Distressed Tourist-Banner"] = {
				Name = "Kawamura",
				Id = 13496300956,
				Bio = "\"I know staying alive's important, but I wouldn't be caught DEAD without taking all this FREE jewlery!\""
			},
			["Distressed Tourist-ET"] = {
				Name = "Zoogli the Great",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Id = 16446070274,
				Bio = "OH MY GGOD ITS THAT ONE ALIEN FROM LUNAR IMPACT"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Yellow = 2, Green = 1 },
		TransformImmune = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter is transformed: That fighter gains 100 Health and Power and generates.",
			Ability = {
				OnAllyTransform = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 },
						{ "Generate", 1 }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "-this is <b>NOT</b> a good tourist spot!!!!!!-"
	},
	["Coil Serpent"] = {
		Id = 13292997769,
		Name = "Coil Serpent",
		AltCards = {
			["Coil Serpent-C"] = {
				Name = "Peppermint Serpent",
				Id = 15252288245,
				Bio = "What do you mean biting is the 'wrong way'?"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "VenomBite",
		EffectAnimation = "RegenCoilEffect",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		EffectVariable = 0,
		CustomReminder = {
			Regenerating = "A regenerating fighter gains 100 Health during its end steps."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: A target allied fighter gains 100 health. Attach regenerating to that fighter.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Heal", 100 },
						{ "EquipGear", "Regenerating Mod" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "\"Dwarvern technology was so far ahead of its time. Protecting these mystical creatures could lend us insight into their secrets!\" <br/>- Nina, Arkhive Researcher"
	},
	["Grimclaw's Moonbeam"] = {
		Id = 13293163323,
		Name = "Grimclaw's Moonbeam",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "Moonbeam",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["How to confuse ChatGPT"] = "Colourless studs are ignored, because Colourless is not a colour."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter loses 400 Power. Then obliterate it if there's exactly 1 colour in its stud cost.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 400 },
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "Card" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColors", "Nil" }
						},
						{ "EVExactValueCheck", 1, "Self" }
					},
					Target = "Single"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "Card" },
							"Self"
						},
						{ "Obliterate", 30, "EVCard" }
					},
					Target = "EVCard"
				}
			}
		},
		Bio = "Grimclaw sneered at the charred catgirls. <br/><font color=\"#5EEE3E\">\"These 'PLURRAL' remind me of my brother's sycophant supporters back in the day.\"</font><br/>\"Why's that, ken like?\" <br/><font color=\"#5EEE3E\">\"Their only value in this world is the nice popping noise they make when they die.\"</font>"
	},
	["Ego Culling"] = {
		Id = 13293157931,
		Name = "Ego Culling",
		AltCards = {
			["Ego Culling-V"] = {
				Id = 16117245738,
				Name = "Vow of Eternity",
				AttackEffect = "Punch",
				Bio = "That's Rude. It's pure love."
			},
			["The Scales of Nastrond"] = {
				Id = 99055130624487,
				Name = "The Scales of Nastrond",
				PremiumArt = 321,
				AltArt = true,
				Bio = "<b><font color=\"#00FF00\">In the realm of Nastrond, balance is key, and nothing embodies this balance more than The Scale of Nastrond. A mystical artifact of immense power, the Scales are entrusted with the task of weighing the value of all things in the land. With a single swing of their balanced arms, they separate the worthy from the worthless, purging all that is deemed cheap or insignificant.</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 5 },
		EffectVariable = 0,
		SpecialEffectAnimation = "EgoCulling",
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate all fighters that cost 4 or fewer total studs.",
			Ability = {
				OnSummon = {
					Power = { { "Obliterate" } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally", "Enemy" },
						Condition = "TotalCostOrLess",
						Modifier = 4
					}
				}
			}
		},
		Bio = "An earlier Caitlin would have accepted the PLURRAL's invitation to live eternally happy. Today, however, is a new day."
	},
	["Waking World"] = {
		Id = 13293087295,
		Name = "Waking World",
		AltCards = {
			["Waking World-E-Offer"] = {
				Id = 16562309021,
				Name = "Wake of the Wild",
				AttackEffect = "Scratch",
				Bio = "The Call of the Coney"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		EffectAnimation = "LivingWorld",
		Cost = { Neutral = 5, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select a terrain card in your graveyard that was cast this game. Recur that card and summon its terrarian.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false },
							"CustomZoneTarget"
						},
						{ "SummonAlly", "Terrarian", "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Terrain = true, WasPlayed = true },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a terrain to recur and summon its terrarian"
					}
				}
			}
		},
		Bio = "The Spirit of Robloxia felt an act which violated nature itself. The dirt and soil bore its righteous message."
	},
	["Forest's Final Defense"] = {
		Id = 13293037906,
		Name = "Forest's Final Defense",
		AltCards = {
			["Forest's Final Defense-V"] = {
				Id = 15941927853,
				Name = "Undying Love",
				AttackEffect = "Whirlpool",
				Bio = "You promised me that you wouldn't be with another even in death!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 12 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Recur 9 allied fighter cards, except they're zombified.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Fighter", "GraveZone_Ally", "Hand_Ally", true, false, 9 },
						"Self"
					} },
					Target = "Self",
					MetaData = { Zombified = true }
				}
			}
		},
		Bio = "Caitlin felt rather remorseful, having to revive old warriors to fight in her stead. They, however, had been itching for a fight against a common foe."
	},
	["Biggs, Immortal Mogul"] = {
		Id = 13292993569,
		Name = "Biggs, Immortal Mogul",
		AltCards = {
			["Biggs, Immortal Mogul-Banner"] = {
				Id = 13496273382,
				AttackEffect = "Tempest",
				Name = "Vella Wilde",
				Bio = "Quoting directly from Wikipedia since 1999."
			},
			["Biggs, Immortal Mogul-Event"] = {
				Id = 13624433931,
				AttackEffect = "Tempest",
				Name = "Biggs, Vastator",
				Bio = "The Oddsman power was used as a catalyst to obliterate those who stood in his way."
			},
			["Biggs, Immortal Mogul-Offer"] = {
				Id = 13630660051,
				AttackEffect = "Tempest",
				Name = "Biggs",
				ArtAnimation = "Biggs",
				Bio = "\"The kingdom of Javion has long since forgotten my name... and I am <b>EAGER</b> to make them remember.\""
			}
		},
		Health = 1200,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "LaserGreen",
		Color = "Green",
		Cost = { Green = 4, Yellow = 4 },
		EffectVariable = 1,
		Effect = {
			Name = "Haydoscale",
			Description = "<b><font color=\"#5EEE3E\">Max Level.</font></b>\nWhen this card is cast: Give yourself 5 money stack cards.\nWhenever you cast a token action: Ban your opponent.",
			Ability = {
				OnSummon = {
					Power = { {
						"RepeatingRandomAdd",
						{
							{ "Tix Stack", "Targeting Blip" },
							5
						},
						"Ally"
					} },
					Target = "Self"
				},
				OnAllyCast = {
					Power = { { "Inflict", 999999 } },
					Target = "Opponent",
					Rarity = "Token"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "<b><font color=\"#5EEE3E\">\"WE'RE SO BACK.\"</font></b>"
	},
	["Parting Words"] = {
		Id = 112472323585115,
		Name = "Parting Words",
		AltCards = {
			["Sharp Looks"] = {
				Id = 80027810902309,
				AltArt = true,
				Commissioner = { 2747898931 },
				PremiumArt = 128,
				Name = "Sharp Looks",
				Bio = "It's over Fl00fy, you're CHINNISHED!"
			},
			["Parting Words-V-Offer"] = {
				Id = 16056315590,
				Name = "Parting Ways",
				AttackEffect = "Punch",
				Bio = "It's over isn't it, but why can't I move on?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Blue = 3, Yellow = 3, Neutral = 3 },
		EffectVariable = 0,
		PreloadAssets = { "rbxassetid://13527914688", "rbxassetid://5089147697" },
		Fading = true,
		CustomReminder = {
			["Pyrrhic Victory"] = "If the number of fighters is odd, round down; If you have 5 fighters, the 2 leftmost will be obliterated."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate all fighters on the left side of the board. Give yourself a copy of each fighter obliterated this way, except they're zombified and all {R} in their cost is converted to {W}",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Opponent", "Fighter", "Nil" },
							"Self",
							nil,
							nil,
							"PartingWords"
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "EnemyYEET" }
						},
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Fighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "AllyYEET" }
						}
					},
					Target = "Self"
				},
				OnEVCheckPassEnemyYEET = {
					Power = {
						{ "AddCopy" },
						{ "Obliterate" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "EnemyYEET" },
							"Self"
						}
					},
					Target = "EnemyLeftMost",
					NoBlip = true,
					MetaData = {
						ConvertColors = { Red = "Neutral" },
						Zombified = true
					}
				},
				OnEVCheckPassAllyYEET = {
					Power = {
						{ "AddCopy" },
						{ "Obliterate" },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "AllyYEET" },
							"Self"
						}
					},
					Target = "AlliedLeftMost",
					NoBlip = true,
					MetaData = {
						ConvertColors = { Red = "Neutral" },
						Zombified = true
					}
				}
			}
		},
		Bio = "In the midst of regrets and memories overwhelming her mind, Caitlin knew she had to leave this world with one last thing:<br/>A prescription to cure a delusional doctor."
	},
	["Persistent Peeper"] = {
		Id = 13293062701,
		Name = "Persistent Peeper",
		AltCards = {
			["Persistent Peeper-Sun"] = {
				Id = 13660816231,
				Name = "Sketchy Peeper",
				AttackEffect = "Whirlpool",
				Bio = "\"I drew this while on vacation.\""
			},
			Battereye = {
				Id = 14039150035,
				Name = "Battereye",
				AltArt = true,
				PremiumArt = 77,
				AttackEffect = "Bat",
				Bio = "<i>Knocking people out is hard, y'know. Give some appreciation to the people who're willing to practice their non-lethal blunt force trauma.</i>"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "CameraSelf",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of each turn: Reveal your opponent's hand and the top card of their deck.\nWhenever this card attacks: Destroy the top card of your opponent's deck.",
			Ability = {
				OnStart = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "RevealTopDeck", 30, "Opponent" }
					},
					Target = "Self"
				},
				OnAllyStart = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "RevealTopDeck", 30, "Opponent" }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "TopCard", "Deck_Opponent", "GraveZone_Opponent", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Eisenhower just wanted some privacy with his husband while it lasted."
	},
	["Draconic Counsel"] = {
		Id = 17787945663,
		Name = "Draconic Counsel",
		AltCards = {
			["Draconic Counsel-Sun-Offer"] = {
				Id = 17772199093,
				Name = "Summertime Counsel",
				AttackEffect = "Punch",
				Bio = "No advice really, just get those 3 cards and go."
			},
			["Draconic Counsel-Mango"] = {
				Name = "Bluestein Quiz",
				Id = 121053363514911,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"GREAT! I HAVE A QUIZ FOR YOU!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 6, Neutral = 1 },
		Lunar = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select 3 cards from the top 7 cards of your deck. Search those cards, then shuffle the rest into your deck.",
			Ability = {
				OnSummon = {
					Power = {
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
						Condition = { TopCard = 7 },
						MinTargets = 0,
						MaxTargets = 3,
						SelectionDescription = "up to three card to search from your deck"
					}
				}
			}
		},
		Bio = "Their sudden meeting forced both of them to swallow their pride. The man, forced to face the chaos he had inadvertantly caused. The dragon, forced to ask for assistance from beings he thought beneath him."
	},
	["Hospital Attendant"] = {
		Id = 13293052570,
		Name = "Hospital Attendant",
		AltCards = {
			["Hospital Attendant-Hal"] = {
				Id = 14959554077,
				Name = "Immortalis Curse",
				AttackEffect = "HauntBite",
				Bio = "The inability of death does not prevent one's own sanity from meeting the same fate."
			}
		},
		Health = 650,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 1 },
		EffectVariable = 2,
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever an effect or passive gives this card health: Recur an allied fighter card with total stats 500 or less, except it's fading.",
			Ability = {
				OnEffectHeal = {
					Power = { {
						"MoveZone",
						{ "Fighter_Picant", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { Fading = true },
					TurnTriggerLimit = 2
				},
				OnSummonOrEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 2, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {}
			}
		},
		Bio = "Some people couldn't leave town, unable to willingly part with their sickened loved ones."
	},
	["Paraselene Starsleuth"] = {
		Id = 13293060061,
		Name = "Paraselene Starsleuth",
		AltCards = {
			["Paraselene Starsleuth-Sun"] = {
				Id = 13660842229,
				AttackEffect = "Inferno",
				Bio = "Moon powers do NOT protect you from the sun."
			},
			["Zepto II"] = {
				Id = 77356407702436,
				Name = "The Trudog Show",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 204,
				Bio = "\"In case I don't see ya, good afternoon, good evening, and good night!\""
			}
		},
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
	["Prep for Survival"] = {
		Id = 13293424444,
		Name = "Prep for Survival",
		Health = 0,
		Power = 0,
		AddHealth = 50,
		AddPower = 0,
		Rarity = "Uncommon",
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
	["Dr. Grey"] = {
		Id = 13293155293,
		Name = "Dr. Grey",
		AltCards = {
			["Dr. Grey-Banner"] = {
				Id = 13613401211,
				Name = "Ed",
				Bio = "Welcome to Great Patty, home of the Great Patty!"
			},
			["Dr. Grey-Event"] = {
				Id = 13653689121,
				Name = "Grey Helinsworth",
				Bio = "<i>\"Even if I save one life, no matter what happens in my career, atleast I would've proven to myself that people such as me can be of some worth for this world.\"</i>"
			},
			["Dr. Grey-Mango"] = {
				Name = "The One Who Knows",
				Id = 126953311403013,
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"Find my Deciples\""
			}
		},
		Health = 1200,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 4 },
		Dextrous = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks and destroys another: Draw a card. You gain 300 life.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "Cost", -300 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Head Surgeon of Bloxburg Messiah Hospital. Old friend of Harrison Powell."
	},
	["Enzymic Citizen"] = {
		Id = 13293022205,
		Name = "Enzymic Citizen",
		AltCards = {
			["Enzymic Citizen-AN"] = {
				Id = 13697394105,
				Name = "Skeleton",
				AttackEffect = "SkeleScythe",
				Bio = "<i>It's eternity in there!</i>"
			},
			OneBitePizzaReviewer = {
				Id = 15252286547,
				Name = "OneBitePizzaReviewer",
				AltArt = true,
				PremiumArt = 156,
				Commissioner = { 14640960, 9881382 },
				AttackEffect = "Firebrand",
				Bio = "\"Pizza for the Soul? More like pizza for the trash. It’s score is a 1.3"
			},
			Ollypollito = {
				Id = 132651561334385,
				Name = "Ollypollito",
				Commissioner = { "Ollypollito" },
				AttackEffect = "Revolver",
				AltArt = true,
				PremiumArt = 758,
				Bio = "<b><font color=\"#a9a9a9\">\"\"That's a lot more guards than I expected\"</font></b><br/><b><font color=\"#ff0d0d\">\"\"We don't have time to sit and watch forever\"</font></b><br/><b><font color=\"#a9a9a9\">\"\"We don't even know the layout of the Deadlock\"</font></b><br/><b><font color=\"#ff0d0d\">\"\"Then we find out the hard way\"</font></b>"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		SummonAnimation = "RobloxianCall",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Zombified = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select up to 3 cards in your graveyard. Shuffle them into your deck.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Deck_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to three cards from your graveyard",
						MinTargets = 0,
						MaxTargets = 3
					}
				}
			}
		},
		Bio = "Not every protester was fighting against the use of the enzyme. Some believe it to be the future and now see practices like cremation as archaic and inhumane."
	},
	DigitalMessiah = {
		Id = 14178451407,
		Name = "DigitalMessiah",
		AltCards = {
			["DigitalMessiah-Sun"] = {
				Name = "Sand Sculpting Champ",
				AttackEffect = "Whirlpool",
				GraveAddant = "Angel of Truth-Sun",
				CustomReminder = {
					["Sand Angel"] = "A Colourless 600/600 token that's fading. If you have a card of each colour in your Graveyard, it'll summon itself from there."
				},
				Id = 13660838569,
				Effect = {
					Description = "When this card dies: Put a Sand Angel into your graveyard."
				},
				Bio = "Three time champion. He will never reveal how he makes such detailed structures with just a shovel."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "StudBlast",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		GraveAddant = "Angel of Truth",
		CustomReminder = {
			["Angel of Truth"] = "A Colourless 600/600 token that's fading. If you have a card of each colour in your Graveyard, it'll summon itself from there."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Put an Angel of Truth into your graveyard.",
			Ability = {
				OnDeath = {
					Power = { { "GraveAdd", "GraveAddant" } },
					Target = "Self"
				}
			}
		},
		Bio = "A master architect crafts their work in the desires of its beholders."
	},
	["Angel of Truth"] = {
		Id = 13293150658,
		Name = "Angel of Truth",
		AltCards = {
			["Angel of Truth-Sun"] = {
				Name = "Sand Angel",
				AttackEffect = "Whirlpool",
				Id = 13660836955,
				Effect = {
					Description = "During your end step, if this card is in your graveyard and you have a card of each colour in your graveyard: Summon this card."
				},
				Bio = "I saw the angel in the sand and I kept working until she was free. - The Champ"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Divinity",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Token = true,
		Fading = true,
		TriggerInGraveZone = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if this card is in your graveyard and you have a card of each colour in your graveyard: Summon this card.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Angel of Truth", "GraveZone_Ally", "Field_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Chromatic", "AllyGraveZone", 4, 9999 },
					DontTriggerInField = true
				}
			}
		},
		Bio = "Bloxburg's beholders wish for a saviour."
	},
	["Big Rush Crush"] = {
		Id = 13465131166,
		Name = "Big Rush Crush",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy your hand, then recur that many cards from the bottom of your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" }
						},
						{ "RandomDiscard", 10, "Ally" },
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{
								"BottomCard",
								"GraveZone_Ally",
								"Hand_Ally",
								false,
								false,
								"Variable"
							},
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "The Smileys only had a small window to both steal valuable information and commit an adequate amount of savagery."
	},
	["Comforting Words"] = {
		Id = 13293136585,
		Name = "Comforting Words",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Green = 2 },
		EffectVariable = 0,
		CustomReminder = {
			Regenerating = "Regenerating fighters gain 100 Health during their end step."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Attach regenerating to all allied fighters.",
			Ability = {
				OnSummon = {
					Power = { { "EquipGear", "Regenerating Mod", "Ally" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Losing both of his parents and his legs in the span of a single night, the child was devastated.<br/>A nurse's empathetic advice was the only thing that saved him from a life of continous envy and regret."
	},
	["Funeral Eulogist"] = {
		Id = 13293769704,
		Name = "Funeral Eulogist",
		AltCards = {
			["Funeral Eulogist-AN"] = {
				Id = 13697768694,
				Name = "Bricky the Fairy",
				AttackEffect = "Divinity",
				Bio = "\"<b>HEYLOOKLISTENHELLOHEYLOOKLISTENHELLOHEYLOOKLISTENHELLOHEYLOOKLISTENHELLOHEYLOOKLISTENHELLO</b>\""
			}
		},
		Health = 600,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur an allied ranked card, except it's fading. Then destroy a ranked card in your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Ranked", "GraveZone_Ally", "Hand_Ally", true, false },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					MetaData = { Fading = true }
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "Ranked", "Deck_Ally", "GraveZone_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "In a world of immortality, graceful death to old age is worthy of discussion, be it stupid or sublime."
	},
	["Despair Surgery"] = {
		Id = 76822736302744,
		Name = "Despair Surgery",
		AltCards = {
			["Despair Surgery-Hal"] = {
				Id = 14981781100,
				Name = "Feline Formation!",
				Addant = "Zombified Chimera-Hal",
				Effect = {
					Name = "Haydoscale",
					Description = "Obliterate your Graveyard and give yourself a FELINE FOOTBALL with stats equal to the total stats of all cards in your Graveyard. It costs 12 Colourless studs, or 6 if you're in Bliss."
				},
				Bio = "\"<b>Nyawthing can get past us!!!\"</b>\""
			},
			["Despair Surgery-Auto"] = { Id = 76822736302744, Addant = "Zombified Chimera-Auto" },
			["Despair Surgery-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 130847666492769,
				Addant = "Zombified Chimera-10Y",
				Bio = "All that was blissful turned to pain, all that she tried to save was in vain, and she is now forced to face her dire consequences of her actions."
			},
			["Dead Dog"] = {
				Id = 15804644258,
				Name = "dead dog",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "your typical, unremarkable, usual dead dog. has a mild dislike for being reviewed.",
				Effect = {
					Name = "Haydoscale",
					Description = "Obliterate your Graveyard and give yourself a Dead Dog Reviewer with stats equal to the total stats of all cards in your Graveyard. It costs 12 Colourless studs, or 6 if you're in Bliss."
				},
				Addant = "Dead Dog Token"
			},
			["Captain Phoenix Loritad"] = {
				Id = 75678449018621,
				Name = "Captain Phoenix Loritad",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "I call upon those who have fallen...",
				Effect = {
					Name = "Haydoscale",
					Description = "Obliterate your Graveyard and give yourself an Illusions of the Fallen with stats equal to the total stats of all cards in your Graveyard. It costs 12 Colourless studs, or 6 if you're in Bliss."
				},
				Addant = "Illusions of the Fallen"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		CustomReminderBliss = true,
		Cost = { Green = 5, Yellow = 5 },
		Addant = "Zombified Chimera",
		EffectAnimation = "owchieow",
		PreloadAssets = {
			"rbxassetid://13485602208",
			"rbxassetid://13485505682",
			"rbxassetid://13485506230"
		},
		CustomReminder = {
			["Zombified Chimera"] = "A 12{W} Yellow fighter with Overload that can be cast for 6{W} if you are in Bliss."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate your graveyard and give yourself a Zombified Chimera with stats equal to the total stats of all cards in your Graveyard that've died or been cast.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{
							"AlterEV",
							{ "Add", "Target", "Health", "Nil" },
							"CustomTarget"
						},
						{ "HealTargetInHand", "Variable", "AlliedAddedCard" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "Target", "Power", "Nil" },
							"CustomTarget"
						},
						{ "StrengthenTargetInHand", "Variable", "AlliedAddedCard" },
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						}
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "MatchesParameter",
						Modifier = "IsFair"
					},
					MetaData = { Health = 0, Power = 0 }
				}
			},
			AllowActionBuffing = true
		},
		Bio = " "
	},
	["Zombified Chimera"] = {
		Id = 13293144000,
		Name = "Zombified Chimera",
		AltCards = {
			["Zombified Chimera-Hal"] = {
				Id = 14981783210,
				Name = "FELINE FOOTBALL",
				AttackEffect = "ModernRocket",
				Bio = "\"<b>\"NO! I TOLD YOU KITTIES TO MAKE A WALL! NOT A BALL!!!\"</b>\""
			},
			["Zombified Chimera-Auto"] = {
				Id = 134734145804721,
				AttackEffect = "StalkerScratch",
				Bio = "\"The decay of nerves caused by the Necroenzyme have unforseen consequences when a normal person uses body part substitutions affected by the enzyme. First, the electrical signals clash. Then, horrific deformations.\" -Paraselene Dead Drop, Day 12"
			},
			["Dead Dog Token"] = {
				Id = 15804644129,
				Name = "Dead Dog Reviewer",
				AttackEffect = "Storm",
				Bio = "Your dog is next."
			},
			["Illusions of the Fallen"] = {
				Id = 111787460302415,
				Name = "Illusions of the Fallen",
				AttackEffect = "Storm",
				Bio = "I order you... RAIN FIRE-"
			},
			["Zombified Chimera-10Y"] = {
				Id = 138029259563496,
				AttackEffect = "StalkerScratch",
				Bio = "And in her futility, she failed, trying to stitch things that already have been ripped fully from the seams."
			},
			["Catgirl Chimera"] = { Id = 104018271687703, Name = "Catgirl Chimera" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "StalkerScratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 12 },
		AlternateCost = { Neutral = 6 },
		AlternateCostRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
		Zombified = true,
		Overload = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card using 6{W} if you're in bliss.",
			Ability = {
				Nil = {
					Power = { { "Draw", 0, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"The decay of nerves caused by the Necroenzyme have unforseen consequences when a normal person uses body part substitutions affected by the enzyme. First, the electrical signals clash. Then, horrific deformations.\" -Paraselene Dead Drop, Day 12"
	},
	["Resin Amalgamation"] = {
		Id = 13626617397,
		Name = "Resin Amalgamation",
		Health = 1000,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Extant",
		Cost = { Red = 2, Blue = 2, Green = 2, Yellow = 2 },
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		Rank = 6,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast another Extant fighter: Destroy it. Give yourself a Nascent Stud.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{ "Destroy" },
						{ "Add", "Addant", "Ally" }
					},
					Target = "Aggressor",
					Archetype = "Extant"
				}
			}
		},
		Bio = "Caitlin was shocked to see how the Extants made use of resin trees, using them to form large beasts born for protecting the lands they inhabited."
	},
	["Extant Titanboa"] = {
		Id = 13293083114,
		Name = "Extant Titanboa",
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "VenomBite",
		Color = "Red",
		Archetype = "Extant",
		Cost = { Yellow = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Your opponent loses 150 life for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" },
							"Self"
						},
						{ "Inflict", "Variable", "Opponent" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They dominated with their strength, until the responsibility of such power crushed them."
	},
	["Extant Smilodon"] = {
		Id = 13293030457,
		Name = "Extant Smilodon",
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Green",
		Archetype = "Extant",
		Cost = { Red = 1 },
		EffectVariable = 0,
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: You gain {W} for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{ "Neutral", "Variable", "Ally" }
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They thrived with their vitality, until life became an excess waste."
	},
	["Extant Anomalocaris"] = {
		Id = 13293028240,
		Name = "Extant Anomalocaris",
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Blue",
		Archetype = "Extant",
		Cost = { Green = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["Bound from Resin"] = "This card counts dead enemy Extants too.",
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Give yourself a Necroenzyme Vial for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"RepeatingAdd",
							{ "Necroenzyme Vial", "Variable" },
							"Ally"
						}
					},
					Target = "Self"
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They prided themselves over their intellect, up until they learnt too much."
	},
	["Extant Archaeopteryx"] = {
		Id = 13293033516,
		Name = "Extant Archaeopteryx",
		Health = 100,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Archetype = "Extant",
		Cost = { Blue = 1 },
		Summonant = "Offspring",
		CustomReminder = { ["Bound from Resin"] = "This card counts dead enemy Extants too." },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Summon a 0/0 Offspring that's inert in all zones. It gains 100 Health and Power for each Extant fighter that's died since your last end step.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Summon", "Summonant", "Ally" }
					},
					Target = "Self",
					MetaData = { Health = "Variable", Power = "Variable" }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "They revelled in their large numbers, up until sustenance was no longer possible."
	},
	Offspring = {
		Id = 13465135304,
		Name = "Offspring",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Bite",
		Color = "Yellow",
		Archetype = "Extant",
		Cost = { Neutral = 0 },
		TokenOmni = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Nil = {
					Power = { {
						"AlterEV",
						{ "Set", "Playertable", "ExtantDeathCount", "Nil" },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"What mendacious simpleton would dare suggest we evolved from these maggots?\" -Grimclaw the Sacred"
	},
	["Extant Release"] = {
		Id = 13465133332,
		Name = "Extant Release",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "Extant",
		Cost = { Neutral = 2, Green = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "A target fighter loses 200 Power.\nSearch your deck for 2 fighter cards that each cost 1 or fewer total studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Weaken", 200, "Single" },
						{ "RandomTutorfor", "Fighter 1orExactCost" },
						{ "RandomTutorfor", "Fighter 1orExactCost" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Preserved in voidoak amber for 20,000 years, the last remnants of the World of Wood will fight for their new home.\""
	},
	["Permission to Move On"] = {
		Id = 14905816871,
		Name = "Permission to Move On",
		AltCards = {
			["Permission to Move On-AN"] = {
				Id = 136720690668758,
				AttackEffect = "Slash",
				Name = "For Preserved History",
				Bio = "To Protect the Past,<br/>To Pave the Future."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 8 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		EffectVariable = 0,
		AlternateCost = { Blue = 2 },
		AlternateCostRequirement = { "Board", "AllyGraveZone", 0, 1 },
		Rank = 6,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card for {B}{B} if your graveyard is empty.\nDraw 4 cards.",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 4, "Ally" } },
					Target = "Self"
				},
				OnEVCheckPassMyGrave = {
					Power = {
						{
							"MoveZone",
							{
								"BottomCard",
								"GraveZone_Ally",
								"Deck_Ally",
								false,
								false,
								"Variable"
							},
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "MyGrave" }
						}
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPassTheirGrave = {
					Power = {
						{
							"MoveZone",
							{
								"BottomCard",
								"GraveZone_Opponent",
								"Deck_Opponent",
								false,
								false,
								"Variable"
							},
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" }
						},
						{
							"EVGreaterValueCheck",
							{ 0, "TheirGrave" }
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Caitlin's funeral was a bittersweet celebration of her, of Bloxburg, of mortality."
	},
	["Ancient Egg"] = {
		Id = 14905816497,
		Name = "Ancient Egg",
		AltCards = {
			["Ancient Egg-AN"] = {
				Id = 18787817417,
				AttackEffect = "Slash",
				Name = "Enraged Teapot",
				Bio = "No time for tea time..?",
				GraveAddant = "Ancient Dragon-AN"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Green",
		Cost = { Green = 2 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		GraveAddant = "Ancient Dragon",
		TriggerInGraveZone = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if this card's in your graveyard: Obliterate it. Put an 800/800 Ancient Dragon with no abilities into your graveyard.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						},
						{ "GraveAdd", "GraveAddant", "Ally" }
					},
					Target = "Self",
					DontTriggerInField = true
				}
			}
		},
		CustomReminder = {
			["Ancient Dragon"] = "A {G} {G} {G} 800/800 fighter with no abilities."
		},
		IsFood = true,
		Bio = "<font color=\"#5EEE3E\">\"I'll thole your ignominious experiments,\"</font> Grimclaw sighed to Eisenhower, <font color=\"#5EEE3E\">\"On one condition...\"</font>"
	},
	["Ancient Dragon"] = {
		Id = 14632155697,
		Name = "Ancient Dragon",
		AltCards = {
			["Ancient Dragon-AN"] = {
				Id = 18788369967,
				AttackEffect = "FirePunch",
				Name = "Boiling Teapot",
				Bio = "<font color=\"#ff0004\">TEA TIME IS EVERY TIME!!!</font>",
				GraveAddant = "Ancient Dragon-AN"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Scorch",
		Color = "Green",
		Cost = { Green = 3 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		GraveAddant = "Ancient Dragon",
		DestroyImmune = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Nil", false, false },
							"Self"
						},
						{ "GraveAdd", "GraveAddant", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<font color=\"#5EEE3E\">\"...That my kin are revived, restored to our rightful dominion over the skies.\"</font><br/>- Grimclaw, Holy Restorer"
	},
	["Intelligence Swarm"] = {
		Id = 14905815509,
		Name = "Intelligence Swarm",
		AltCards = {
			["Intelligence Swarm-AN"] = {
				Id = 18601520021,
				AttackEffect = "Jab",
				Name = "Temple Delving",
				Bio = "Nice of the clockwork to let us explore the mines, eh Assad?",
				GraveAddant = "Drone-AN"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Electric",
		Color = "Blue",
		Cost = { Green = 1, Blue = 1 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		GraveAddant = "Drone",
		EffectVariable = 0,
		CustomReminder = { Drone = "A blue 500/500 fighter that costs nothing." },
		Effect = {
			Name = "Haydoscale",
			Description = "Recur the top card of your graveyard if it costs 6 or fewer total studs. It gains fading.\nPut 2 500/500 Drones with no abilities at the bottom of your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{ "EVGreaterValueCheck", 6 },
						{ "GraveAdd", "GraveAddant", "Ally" },
						{ "GraveAdd", "GraveAddant", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckFail = {
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
			},
			EffectGraveAddToBottom = true
		},
		Bio = "\"It's Droning Time!\"<br/>- Jake Mitchell, Arkomms Technician"
	},
	["Veteran Arkhivist"] = {
		Id = 14905815934,
		Name = "Veteran Arkhivist",
		AltCards = {
			["Veteran Arkhivist-AN"] = {
				Id = 18771726505,
				AttackEffect = "ClassicRocket",
				Name = "Teapot Turret",
				Bio = "ONE TWO THREE FOUR - I DECLARE A TEA WAR<br/>FIVE SIX SEVEN EIGHT - TRESSPASSER SPOTTED, EXTERMINATE"
			}
		},
		Health = 700,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 1, Green = 4, Blue = 4 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		EffectVariable = 0,
		CustomReminder = { Drone = "A blue 500/500 fighter that costs nothing." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Recur the top and bottom cards of your graveyard, except they're fading.\nWhen this card is recurred: It gains 500 Health.",
			Ability = {
				OnRecured = {
					Power = { { "Heal", 500, "Self" } },
					Target = "Self"
				},
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "TopCard"
					},
					MetaData = { Fading = true }
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
					MetaData = { Fading = true },
					NoBlip = true
				}
			}
		},
		Bio = "\"I didnae get to see you one last time, big yin. But I'm happy you did what you could; It was those wee trinkets or the forest. \" - Al-Assad Returned"
	},
	["Arkomms Technician"] = {
		Id = 14747616011,
		Name = "Arkomms Technician",
		AltCards = {
			["Arkomms Technician-AN"] = {
				Id = 18771311724,
				AttackEffect = "Slash",
				Name = "Tea Engineer",
				Bio = "Relegating mine work to constructs helps keep your production high!",
				Addant = "Drone-AN"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Electric",
		Color = "Green",
		Cost = { Green = 2, Blue = 3 },
		Logo = "Arkhive",
		SearchTerms = "Arkhive",
		Addant = "Drone",
		EffectVariable = 0,
		CustomReminder = { Drone = "A blue 300/300 fighter that costs nothing." },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card is recurred: Give yourself a 300/300 Drone with no abilities.\nWhen this card is cast: Recur the top card of your graveyard, except it's fading.",
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
				},
				OnRecured = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					MetaData = { Health = 300, Power = 300 }
				}
			}
		},
		Bio = "When the returning Arkhivists found broken machinery around the Greenbelt, they had realized the worst had come to those who stayed behind."
	},
	["Contingency Operative"] = {
		Id = 14632283070,
		Name = "Contingency Operative",
		AltCards = {
			["Contingency Operative-E"] = {
				Name = "Lagomorph Librarian",
				Id = 17015030155,
				Bio = "Please wash your hands before taking a book. Living in burrows is no excuse for ignoring basic hygeine."
			}
		},
		Health = 450,
		Power = 700,
		Rarity = "Common",
		AttackEffect = "Gun",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a zombified fighter dies: Give yourself a Blue or Red action card.",
			Ability = {
				OnAnyDeath = {
					Power = { { "RandomAdd", "Lunar" } },
					Target = "Self",
					Zombified = true
				}
			}
		},
		Bio = "\"Astarossa had the will to give this city immortality. We must have the will to follow his contingency and take it away.\""
	},
	["Monument to Hubris"] = {
		Id = 14905819247,
		Name = "Monument to Hubris",
		AltCards = {
			["Monument to Hubris-E"] = {
				Name = "Carrot Crusher",
				Id = 17017873058,
				Bio = "The farmers don't really have an iron gate, but what's a seige without a battering ram?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		CustomReminderInject = true,
		Color = "Blue",
		Cost = { Red = 2, Blue = 2, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target allied fighter, then destroy all fighters with 400 or less Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" },
						{
							"CheckHealth",
							{ 0, 400 },
							"All"
						}
					},
					Target = "SingleAlly",
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
		Bio = "The Astral Faith had to choose between their pride or their city."
	},
	["Astral Faith Biohacker"] = {
		Id = 14747031751,
		Name = "Astral Faith Biohacker",
		AltCards = {
			["Astral Faith Biohacker-E"] = {
				Name = "Bunny Banner",
				Id = 17014189385,
				Bio = "A reminder to the army that they better 'hop to it'... The general opinion is that Lapin's jokes suck."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Acid",
		Logo = "Astral",
		SearchTerms = "The CRP",
		CustomReminderInject = true,
		Color = "Red",
		Cost = { Red = 4, Neutral = 2 },
		EffectVariable = 1,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Inject all cards in your hand that cost 2 or fewer total studs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EVGreaterValueCheck", 0 },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					},
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "TotalCostOrLess",
						Modifier = 2
					}
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, true },
						"CustomTarget"
					} },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "TotalCostOrLess",
						Modifier = 2
					}
				}
			},
			Injecting = true
		},
		Bio = "A majority of the Astral Faith weren't those who sought benefit for Bloxburg. They sought power for themselves."
	},
	["Astral Ruination"] = {
		Id = 84756568487024,
		Name = "Astral Ruination",
		AltCards = {
			["Astral Ruination-E"] = {
				Name = "Toe-For-Toe",
				Id = 17014187550,
				Bio = "Lucky charms aren't so funny when they're made from human feet."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Logo = "Astral",
		SearchTerms = "The CRP",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2, Blue = 4 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target allied fighter that costs 7 or fewer total studs, except you're given 3 copies of that fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "AddCopy" },
						{ "AddCopy" },
						{ "Destroy" }
					},
					Target = "AllySingleSevenCostOrLess",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Those who prided themselves over their enzymic bodies had been degraded into desperate, fanatical traitors."
	},
	["Shadow Agent"] = {
		Id = 14632252664,
		Name = "Shadow Agent",
		AltCards = {
			["Shadow Agent-E"] = {
				Name = "Booksmart Buck",
				Id = 17014815167,
				Bio = "It's hard to discern stereotypical nerds in a society of bucktooth rabbits."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Common",
		AttackEffect = "Gun",
		Logo = "Astral",
		SearchTerms = { "The CRP", "Inject" },
		Color = "Blue",
		Cost = { Neutral = 1, Red = 3, Blue = 3 },
		EffectVariable = 0,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Inject a target fighter that costs 7 or fewer total studs.\nWhenever a zombified fighter is cast: It gains 200 power.",
			Ability = {
				OnAnySummon = {
					Power = { { "Strengthen", 200 } },
					Target = "Aggressor",
					Zombified = true
				},
				OnSummon = {
					Power = {
						{
							"AddCopy",
							30,
							"SingleSevenCostOrLess",
							nil,
							nil,
							nil,
							"SingleInject"
						},
						{ "Destroy", 30, "SingleSevenCostOrLess" }
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
		Bio = "\"Whether through force or faith, all will become immortal.\"<br/>-LeBlanc, Dread Priest"
	},
	["Checkpoint Security"] = {
		Id = 14632163382,
		Name = "Checkpoint Security",
		AltCards = {
			["Checkpoint Security-Sun"] = {
				Id = 136077801531589,
				Name = "Sunset Slaughterer",
				AttackEffect = "Punch",
				Bio = "When the sun falls, he appears<br/>Killing every enemy he sees<br/>The only thing he've left is his mask<br/>Which brings only slaughter and despair"
			}
		},
		Health = 400,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Bat",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 2, Green = 2 },
		EffectVariable = 0,
		Liberate = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Destroy the bottom card of your deck.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Those who sought to flee the town with their supplies of the necroenzyme were met with brute force."
	},
	["Patient Rebuilding"] = {
		Id = 14905817239,
		Name = "Patient Rebuilding",
		AltCards = {
			["Patient Rebuilding-Sun"] = {
				Id = 17346073868,
				Name = "Repairin' the Hull",
				AttackEffect = "Slash",
				Bio = "Pirate rule number 9: Maintain the ship on Sundays."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Red = 1, Green = 2 },
		EffectVariable = 0,
		Liberate = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select 1 of the bottom 2 cards of your deck. Put that card in your baseplate and destroy the rest.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GenZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "GraveZone_Ally", false, false },
							"CustomTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { BottomCard = 2 },
						MaxTargets = 1,
						SelectionDescription = "to put into your baseplate"
					},
					TargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = "BottomCard",
						Modifier = 1
					},
					UniqueTargets = true
				}
			}
		},
		Bio = "\"You have to rest, 'Kayla. Bloxburg lost so many today, and you lost your arm. We can help out now that we have a tomorrow.\"<br/>- Eric Newman"
	},
	["Bloxburg in Solidarity"] = {
		Id = 14632162184,
		Name = "Bloxburg in Solidarity",
		AltCards = {
			["Bloxburg in Solidarity-Hal"] = {
				Name = "Zach",
				AttackEffect = "Scythe",
				Id = 14555962534,
				Bio = "While the clear white wings are closed,<br/> My raised hand's bleeding blood spills. <br/>Reflected in your wavering pure blue eyes <br/>Is a painfully silent pulse. <br/>Let's keep falling <br/>Till the goal of this meaning."
			},
			["PARA AND IRISH, INSANE BERSERKERS"] = {
				Name = "PARA AND IRISH, INSANE BERSERKERS",
				AttackEffect = "Firebrand",
				Id = 17251036449,
				AltArt = true,
				PremiumArt = 153,
				Commissioner = { 812617873, 1481498011 },
				Bio = "\"Get this man.\""
			},
			["Bloxburg in Solidarity-Sun"] = {
				Id = 17760523244,
				Name = "Surgeon at Sea",
				Bio = "\"Not everyone gets away from Davy Jones unscathed.\""
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Bat",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Green",
		Cost = { Neutral = 3, Red = 4, Green = 4 },
		EffectVariable = 0,
		Liberate = true,
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Select an unranked fighter card in your graveyard that costs 7 or fewer total studs. Summon that card, except it's fading.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", true, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, Unranked = true, CostOrLess = 7 },
						SelectionDescription = "A fighter to summon.",
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "United under one common cause, there is nothing the entirety of Bloxburg cannot achieve."
	},
	["Emergency Rations"] = {
		Id = 14905817738,
		Name = "Emergency Rations",
		AltCards = {
			["Emergency Rations-Sun"] = {
				Id = 17346076762,
				Name = "Cap'n's Cookin'",
				AttackEffect = "Jab",
				Bio = "When all you and your lads eat are infested crackers and rotten cheese, cap'n's cooking is the answer. Today's dish is moldy wooden steak!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		EffectAnimation = "EatBrickBacon",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 2, Green = 1 },
		EffectVariable = 0,
		IsFood = true,
		Liberate = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "\"The people need help. We can't back down when we're so close to ending this nightmare.\"<br/>- Eric Newman"
	},
	["Violent Larcenist"] = {
		Id = 122661565081477,
		Name = "Violent Larcenist",
		AltCards = {
			["Violent Larcenist-Banner"] = {
				Id = 14840635840,
				AttackEffect = "Rifle",
				Name = "Gadget and Hooks",
				Bio = "SOMEWHERE IN BLOXBURG"
			},
			["Violent Larcenist-Sun"] = {
				Id = 17717384240,
				Name = "Crazed Crewmember",
				AttackEffect = "Punch",
				Bio = "Only the violent and dangerous can be lucky enough to join Davey Jones' crew."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Axe",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 2, Green = 2, Neutral = 1 },
		EffectVariable = 1,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever a card with Liberate leaves your graveyard: Your opponent loses {W} and you gain {W}.",
			Ability = {
				OnAllyGraveRemove = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					Liberate = true,
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Neutral", -1, "Opponent" },
						{ "Neutral", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self"
				},
				OnEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEnemyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" },
						"Self"
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "For some Lordbreakers, the hatred of immortality trumps the love of their city."
	},
	["McKayla Newman"] = {
		Id = 14905817566,
		Name = "McKayla Newman",
		AltCards = {
			["McKayla Newman-Sun"] = {
				Id = 17760524150,
				Name = "Next-Captain Kidd",
				AttackEffect = "Gun",
				Bio = "Her attitude is as explosive as her arm-cannon!"
			},
			["McKayla Newman Outfielder"] = {
				Id = 94627477465531,
				Name = "McKayla Newman, Outfielder",
				AttackEffect = "Gun",
				PremiumArt = 817,
				Bio = "McKayla never played baseball as a kid but knows how to use a baseball bat. Eventually she got to learn how to play baseball and is a prime candidate for Rookie of the Season and Most Home Runs in a Season for a rookie."
			}
		},
		Health = 1500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Logo = "Lordbreaker",
		SearchTerms = "Lordbreakers",
		Color = "Red",
		Cost = { Red = 4, Green = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Destroy all cards with liberate in your deck.\nWhenever you recur a card: All fighters in your graveyard gain 50 Power.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "Liberate", "Deck_Ally", "GraveZone_Ally", true, false, 99 },
						"Self"
					} },
					Target = "Self"
				},
				OnAllyRecur = {
					Power = { { "StrengthenGrave", 50, "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "\"You'll get hurt. Doesn't mean you'll have to accept it.\""
	},
	["Corporate Discipline"] = {
		Id = 106000467374449,
		Name = "Corporate Discipline",
		AltCards = {
			["Corporate Discipline-C"] = {
				Name = "Greed Harvesting",
				Id = 15407461863,
				Bio = "Hellhailers thrive on extracting joy from unsuspecting civilians, turning their once-happy moments into a source of sinister delight."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Yellow = 1, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select 2 non-token cards in your opponent's graveyard that each cost 4 or fewer total studs. Put the first one on top of their deck and you seance the second one.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Opponent", "Deck_Opponent", false, false },
							"CustomZoneTarget"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = {
							Rarities = { "Common", "Uncommon", "Rare", "Epic", "Legendary" },
							CostOrLess = 4
						},
						MaxTargets = 1,
						SelectionDescription = "a card to put on top of your opponent's deck"
					}
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Opponent", "Field_Ally", true, false },
						"CustomZoneTarget",
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
					},
					ZoneTargetParameters = {
						Zones = { "Enemy_GraveZone" },
						Condition = {
							Rarities = { "Common", "Uncommon", "Rare", "Epic", "Legendary" },
							CostOrLess = 4
						},
						MaxTargets = 1,
						SelectionDescription = "a card to seance"
					}
				}
			},
			Seancing = true,
			EffectDeckAddToTop = true
		},
		Bio = "\"Apollo's acceptance of underperformance is why this corporation is struggling. We pay you to work. That is what you will do.\"<br/>- Apate, Demon Investor"
	},
	["Flashing Justice Mk.1"] = {
		Id = 14632200279,
		Name = "Flashing Justice Mk.1",
		AltCards = {
			["Flashing Justice Mk.1-C"] = {
				Name = "Hellhail Musher",
				Id = 15407461403,
				AttackEffect = "FirePunch",
				Bio = "Don't have to worry about slippery roads if you're on a sled, right?"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "ModernRocket",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Blue",
		Cost = { Neutral = 1, Yellow = 2, Blue = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies: Draw a card for each allied fighter with total stats 500 or less. Then destroy all cards in your hand with more than 500 total stats.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Picant", "Nil" },
							"Self"
						},
						{ "Draw", "Variable", "Ally" },
						{ "SpecificDiscard", 30, "CustomTarget" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "SizeClass",
						Modifier = "Picant",
						SubModifier = true
					}
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "Apate hated that the older models served their purpose better than their next generation; To be tools of peace instead of war."
	},
	["While Stocks Last"] = {
		Id = 14905818621,
		Name = "While Stocks Last",
		AltCards = {
			["While Stocks Last-C"] = {
				Name = "Creating The Future",
				Id = 15407462438,
				Bio = "Deuz and Leto, Havalu's greatest inventor duo. Discovering pathways through the stars."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Yellow = 5, Blue = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Seance all action cards in your hand that cost 5 or fewer total studs. Trigger their effects as though they were cast.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "5OrLower_Action", "Hand_Ally", "Field_Ally", true, false, 10 },
						"Self"
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
			TriggerOnSummons = true
		},
		Bio = "\"Warzones are deeply profitable. Desperate people sell everything to buy what they need.\"<br/>- Apate, Demon Investor"
	},
	["Intrusive Advertising"] = {
		Id = 14905816314,
		Name = "Intrusive Advertising",
		AltCards = {
			["Intrusive Advertising-C"] = {
				Name = "Warm Their Heart!",
				AttackEffect = "FirePunch",
				Id = 15252291489,
				Bio = "This may look cute at first glance, but in reality it's one of the most painful deaths a Hellhailer can face.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Logo = "Nefoco",
		SearchTerms = "NeFoCo",
		Color = "Yellow",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, or whenever it attacks: Seance a card in your graveyard that's died or was cast.\nWhenever you cast your fourth card each turn: Recur this card, except it's inert when discarded.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "IsFair", "GraveZone_Ally", "Field_Ally", true, false },
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
				},
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "WasPlayed", "GraveZone_Ally", "Field_Ally", true, false },
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
				},
				OnAnyAllyCast = {
					Power = { {
						"MoveZone",
						{ "Intrusive Advertising", "GraveZone_Ally", "Hand_Ally", false, false },
						"Self"
					} },
					Target = "Self",
					MetaData = { TokenDiscard = true },
					EffectRequirement = { "Playertable", "Me", 4, 5, "Storm" }
				}
			},
			Seancing = true
		},
		Bio = "\"I should've seen this sooner... the investors cared more about profit than progress.\"<br/>- Apollo"
	},
	["Debased Catgirl"] = {
		Id = 14632231709,
		Name = "Debased Catgirl",
		AltCards = {
			["Debased Catgirl-Hal"] = {
				Id = 14959557397,
				Name = "Northwood Troop",
				AttackEffect = "Slash",
				Bio = "\"Watch it! See it! Our numbers en masse!<br/> Your lovely city's peace soon shall pass!\""
			},
			["Debased Catgirl-Auto"] = { Id = 118134332295517 },
			["Debased Catgirl-10Y"] = {
				Id = 76842034383042,
				AttackEffect = "Slash",
				Bio = "only pleasure only pleasure only pleasure and joy only pleasure and joy only joy joy joy joy only joy and pleasure and only pleasure and joy and pleasure and"
			},
			["Debased Catgirl-Streamer"] = {
				Id = 136666877902774,
				Name = "Self",
				AttackEffect = "Slash",
				Bio = "\"I'll make you all taste true pain\""
			},
			["Empty Vessels"] = {
				Id = 90667248720002,
				Name = "the green lords friends",
				AttackEffect = "Slash",
				Bio = "Let's drink limeanade... and lemonade... and other lemon lime flavored drinks..."
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Green",
		TokenOmni = true,
		Zombified = true,
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter destroys this card: That fighter gains 150 Health and Power.",
			Ability = {
				OnDeathFromAlly = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTrigger" },
						{ "Heal", 150, "Aggressor" },
						{ "Strengthen", 150, "Aggressor" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Poor things. You wouldn't be going savage if McKayla hadn't destroyed my stockpile...\"<br/>- Apollo"
	},
	["Bloxburg Under Siege"] = {
		Id = 14632230697,
		Name = "Bloxburg Under Siege",
		AltCards = {
			["Bloxburg Under Siege-Hal"] = {
				Id = 14980157400,
				Name = "Attack of the Dastardly Witch!",
				Summonant = "Debased Catgirl-Hal",
				Bio = "\"In this time; the dead of night,\nThat I shall give a great big fright!\""
			},
			["Bloxburg Under Siege-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 136077169477153,
				Summonant = "Debased Catgirl-10Y",
				Bio = "no pain no pain no pain no pain no pain no pain no pain no pain"
			},
			["Bloxburg Under Siege-Auto"] = { Id = 110641957692190, Summonant = "Debased Catgirl-Auto" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Summonant = "Debased Catgirl",
		CustomReminderBliss = true,
		Cost = { Green = 3, Yellow = 1, Neutral = 1 },
		CustomReminder = {
			["Debased Catgirl"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
		},
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Summon 3 150/150 Debased Catgirls.\nIf you're in bliss, summon 6 of them instead.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RepeatingSummon",
							{ "Summonant", 3 },
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
					Power = { {
						"RepeatingSummon",
						{ "Summonant", 3 },
						"Ally"
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "\"See kid?! THIS is why we want the damn enzyme gone!\"<br/>-McKayla"
	},
	["Wet Shrapnel"] = {
		Id = 14632260608,
		Name = "Wet Shrapnel",
		AltCards = {
			["Wet Shrapnel-Hal"] = {
				Id = 14981779333,
				Name = "Rise! Roots of Northwood!",
				Transformant = "Debased Catgirl-Hal",
				Effect = {
					Name = "Haydoscale",
					Description = "Destroy a target allied fighter. Deal 250 damage to a random enemy fighter three times, then transform a random enemy fighter into a Northwood Troop"
				},
				Bio = "\"Wriggle around, make them bound,\nWe'll crush these cretins to the ground!\""
			},
			["Wet Shrapnel-Auto"] = { Id = 133193630169363, Transformant = "Debased Catgirl-Auto" },
			["Analgesic Annihilation"] = {
				Id = 80380789590179,
				Name = "Analgesic Annihilation",
				PremiumArt = 855,
				Commissioner = { "Retoree32" },
				AltArt = true,
				Bio = "\"WE, yes YOU and ME, are gonna blow up!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Transformant = "Debased Catgirl",
		CustomReminder = {
			["Debased Catgirl"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
		},
		Cost = { Green = 2, Neutral = 1 },
		EffectVariable = 0,
		EffectAnimation = "WetShrapnel",
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter.\nDeal 250 damage to a random enemy fighter 3 times, then transform a random enemy fighter into a Debased Catgirl.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Destroy", 30, "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 250, "EVCard" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 250, "EVCard" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Damage", 250, "EVCard" },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{ "Transform", "Transformant", "EVCard" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 1, 100 },
					UniqueTargets = true,
					TargetParameters = {
						Zones = { "Enemy_Field" },
						Condition = "RandomCard",
						Modifier = 1
					}
				}
			}
		},
		Bio = "Death will always find a way to bring further misery."
	},
	["Twisted Turret"] = {
		Id = 14632257091,
		Name = "Twisted Turret",
		AltCards = {
			["Twisted Turret-Hal"] = {
				Id = 14959556012,
				AttackEffect = "Arrow",
				EffectAnimation = "PoisonArrow",
				Name = "Northwood Ranger",
				Bio = "\"Facing my loyal oakwood ranger,\nYou shall find that you're in danger!\""
			},
			["Twisted Turret-Auto"] = { Id = 99944449220266 },
			["The BLOOD Lord"] = {
				Id = 112179103905223,
				Name = "The green Lord",
				Summonant = "Empty Vessels",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 621,
				Bio = "Every green flavored drink is brewed for MY consumption "
			}
		},
		Health = 750,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Summonant = "Debased Catgirl",
		CustomReminder = {
			["Debased Catgirl"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
		},
		Cost = { Green = 3, Yellow = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 150 damage to all fighters, then summon 2 150/150 Debased Catgirls.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 150, "All" },
						{
							"RepeatingSummon",
							{ "Summonant", 2 },
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Don't let 'em shoot their bones at ya! Their bones pierce yer body, you become 'em!\" - Captain Skewerglee"
	},
	["Lay Siege to Sadness"] = {
		Id = 14632248073,
		Name = "Lay Siege to Sadness",
		AltCards = {
			["Lay Siege to Sadness-Hal"] = {
				Id = 14981939357,
				Name = "CATastrophic Trap",
				EffectAnimation = "Poof",
				Summonant = "Zombified Chimera-Hal",
				Effect = {
					Name = "Haydoscale",
					Description = "Summon a 250/750 FELINE FOOTBALL and unlock it.\nIf you're in Bliss, it gains 500 health.\nOtherwise it becomes terrified."
				},
				Bio = "\"So you see, you aren't going far!\nI stand victorious at the end of this spaAAAAAAAAAAARRRRRGGGGHHHHHHHHHHHHH!!!!\""
			},
			["Lay Siege to Sadness-Auto"] = { Id = 125536397120605, Summonant = "Zombified Chimera-Auto" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Summonant = "Zombified Chimera",
		CustomReminderBliss = true,
		Cost = { Green = 1, Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Why can't I find solace in nihilism?"] = "A terrified fighter is obliterated during its end step."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Summon a 250/750 Zombified Chimera and unlock it.\nIf you're in Bliss, it gains 500 health.\nOtherwise it becomes terrified.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "Bliss", "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Unlock", 999, "SummonedCard" },
						{
							"EVGreaterValueCheck",
							{ 0, "HealthGain" }
						}
					},
					Target = "Self",
					MetaData = { Health = 250, Power = 750 }
				},
				OnEVCheckPassHealthGain = {
					Power = { { "Heal", 500, "SummonedCard" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				},
				OnEVCheckFail = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Unlock", 999, "SummonedCard" }
					},
					Target = "Self",
					MetaData = { Health = 250, Power = 750, Terrified = true }
				}
			}
		},
		Bio = "Grief is a painful cycle of destruction."
	},
	["Serotonin Battery"] = {
		Id = 14676799695,
		Name = "Serotonin Battery",
		AltCards = {
			["Serotonin Battery-Hal"] = {
				Id = 14973763144,
				Name = "Feline Catapult",
				Summonant = "Debased Catgirl-Hal",
				AttackEffect = "ClassicRocket",
				EffectAnimation = "MidClassicRocket",
				CustomReminder = {
					["Northwood Troop"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
				},
				Effect = {
					Description = "This card has haste if you're in bliss.\nWhenever this card attacks: Summon a 150/150 Northwood Troop, then deal 150 damage to a target fighter."
				},
				Bio = "Let's throw the logs back!!! Let's throw 'em back!!!"
			},
			["Serotonin Battery-Auto"] = { Id = 126586074570424, Summonant = "Debased Catgirl-Auto" },
			["Edge Gaming AsAsSino142"] = {
				Name = "Dark Streamer",
				AttackEffect = "Arrow",
				Summonant = "Debased Catgirl-Streamer",
				Id = 83167897740743,
				AltArt = true,
				Bio = "The self so tattered, torn to pieces<br/>Ripping the air, the voice unceases<br/>Imparted to flesh, the untainted soul<br/>To a world as known as sky's black hole<br/>Do you love me? "
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Summonant = "Debased Catgirl",
		CustomReminder = {
			["Debased Catgirl"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
		},
		Cost = { Yellow = 3, Neutral = 1 },
		ChargeRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "This card has haste if you're in bliss.\nWhenever this card attacks: Summon a 150/150 Debased Catgirl, then deal 150 damage to a target fighter.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Damage", 150, "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "An hour ago, she felt terror as she saw the invading monsters. Now, she can't feel anything but bliss."
	},
	Unburden = {
		Id = 14632258728,
		Name = "Unburden",
		AltCards = {
			["Unburden-Hal"] = {
				Id = 14973232555,
				Name = "Sleight of the Paw",
				EffectAnimation = "Poof",
				Bio = "HUZZAH!! Three new cards!"
			},
			["Unburden-Auto"] = { Id = 127963632277831 }
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Summonant = "Debased Catgirl",
		CustomReminderBliss = true,
		AlternateCostRequirement = { "Playertable", "Me", 30, 69, "Bliss" },
		AlternateCost = { IgnoreColor = "Neutral" },
		Cost = { Yellow = 3, Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Cast this card ignoring its {W} if you're in bliss.\nDraw 3 cards.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 3, "Ally" },
						{ "BypassAction" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Why... Why can't I get better?<br/>Why can't I just feel fine again?<br/>Why can't I just make it go away...?\""
	},
	["Smoothbrain Catgirl"] = {
		Id = 14632253817,
		Name = "Smoothbrained Catgirl",
		AltCards = {
			["Smoothbrain Catgirl-Hal"] = {
				Id = 14959556213,
				AttackEffect = "MagicGreen",
				Name = "Northwood Fool",
				Bio = "\"Don't you see? Against all my tools,\nYou look nothing more than-- <b>STOP MESSING AROUND!!!</b>\"",
				Summonant = "Debased Catgirl-Hal"
			},
			["Smoothbrain Catgirl-Auto"] = { Id = 136988765435821, Summonant = "Debased Catgirl-Auto" }
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		CustomReminderBliss = true,
		Cost = { Green = 1 },
		EffectVariable = 0,
		Summonant = "Debased Catgirl",
		CustomReminder = {
			["Debased Catgirl"] = "A 150/150 fighter that is inert in all zones and gives 150 health and power to allied fighters which destroy it."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a fighter: It gains 100 Health. It also gains 100 Power if you're in bliss.\nWhenever a player discards a card: Summon a 150/150 Debased Catgirl, then destroy this card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Heal", 100, "Aggressor" },
						{
							"AlterEV",
							{ "Set", "Playertable", "Bliss", "Nil" }
						},
						{ "Draw", 0, nil, nil, nil, "BlissTrigger" },
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Strengthen", "Variable", "Aggressor" }
					},
					Target = "Self"
				},
				OnAnyDiscard = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Destroy" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "pwease nowmaliwse being wittle and stwupid and uweless PWEASE (/>/ /~/ /</)"
	},
	["Apex of Fantasy"] = {
		Id = 14632226967,
		Name = "Apex of Fantasy",
		AltCards = {
			["Apex of Fantasy-Event"] = {
				Id = 138722356061400,
				AddGenZoneant = "The Eternal Hunt-Event",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Deal 500 damage to all fighters. Then if you're in Bliss, put Euphoria's Expense into your opponent's Baseplate."
				},
				Bio = "\"Their screams fill me with joy, their blood keeps me alive, and their spines cracking is music to my ears. This is my bliss.... AND I WANT MORE!\""
			},
			["Apex of Fantasy-Hal"] = {
				Id = 14979782989,
				Name = "Hilda, the Dastardly Witch",
				AddGenZoneant = "The Eternal Hunt-Hal",
				AttackEffect = "Maelstrom",
				Effect = {
					Description = "When this card is cast: Deal 500 damage to all fighters. Then if you're in Bliss, put Curse of Northwood Basin into your opponent's Baseplate."
				},
				Bio = "\"Come and fight, my feline friend!\nSoon enough, you'll meet your end!\""
			},
			["Apex of Fantasy-Auto"] = { Id = 92625225677322, AddGenZoneant = "The Eternal Hunt-Auto" },
			["Apex of Fantasy-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 72425418447719,
				AddGenZoneant = "The Eternal Hunt-10Y",
				Bio = "please dont weep for me, im already in hell"
			},
			Rayfur = {
				Id = 109072150325761,
				Name = "Rayfur",
				Commissioner = { "RayBurn_89" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 756,
				AddGenZoneant = "LISTENTOTHATNEWXAVIERSOBASED",
				Bio = "Hi my name is Rayburn_89 and I will not regret this within 24 hours of posting"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "StalkerScratch",
		Color = "Green",
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		AddGenZoneant = "The Eternal Hunt",
		CustomReminderBliss = true,
		Cost = { Green = 5, Yellow = 5 },
		EffectVariable = 0,
		CustomReminder = {
			["The Eternal Hunt"] = "A token that grants all your fighters overload and all their fighters marked."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 500 damage to all fighters. Then if you're in bliss, put 'The Eternal Hunt' into your opponent's baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 500, "All" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { {
						"AddGenZone",
						{ "AddGenZoneant", 1 },
						"Opponent"
					} },
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			},
			AllowDeadAggressorTriggers = true
		},
		Bio = "No more emotions, no more feelings..."
	},
	["The Eternal Hunt"] = {
		Id = 14632254978,
		Name = "The Eternal Hunt",
		AltCards = {
			["The Eternal Hunt-Event"] = {
				Id = 138839381172983,
				Name = "Euphoria's Expense",
				Bio = "They got in my way.... THEY WANTED ME TO STOP! But I can't. I can't! I can't I CAN'T STOP! I DON'T WANNA STOP! If I can't have my joy, my euphoria, my bliss.... no one can\""
			},
			["The Eternal Hunt-Hal"] = {
				Id = 14983217256,
				Name = "Curse of Northwood Basin",
				Bio = "\"Try it, buddy! Drench me in water!\nIn the end, your efforts shall falter!\""
			},
			["The Eternal Hunt-Auto"] = { Id = 123216329019826 },
			["The Eternal Hunt-10Y"] = { Id = 97005803172776, Bio = "there is no way back home" },
			LISTENTOTHATNEWXAVIERSOBASED = {
				Id = 128285876288983,
				Name = "LISTENTOTHATNEWXAVIERSOBASED",
				Bio = "You left the movie too early, you missed the good part<br/>Pick my face up off the ground then I fly<br/>I be posted up in the ground and the sky<br/>Freestyle for six nights"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Neutral",
		TokenOmni = true,
		TriggerInGenZone = true,
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During each end step: All allied fighters become Marked and all enemy fighters gain Overload.",
			Ability = {
				OnAnyEnd = {
					Power = {
						{
							"GivePassive",
							"Marked",
							nil,
							nil,
							nil,
							nil,
							"CatMark"
						},
						{ "GivePassive", "Overload", "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The only thing left is a desperation to survive."
	},
	["Dissing Dissident"] = {
		Id = 14632185571,
		Name = "Dissing Dissident",
		AltCards = {
			["Dissing Dissident-V"] = {
				Id = 16056329793,
				Name = "Annoying Athlete",
				AttackEffect = "Punch",
				Bio = "Do you even lift, bro?"
			}
		},
		Health = 500,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Crowbar",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Destroy the bottom 3 cards of your deck.\nDuring your end step, if there's 2 or fewer cards in your graveyard: You lose 350 life and draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						}
					},
					Target = "Self"
				},
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
	["Scour the City"] = {
		Id = 14632215821,
		Name = "Scour the City",
		AltCards = {
			["Scour the City-V"] = {
				Id = 16294482447,
				Name = "One-Sided Confession",
				AttackEffect = "Punch",
				Bio = "How to alienate yourself from the house any% speedrun",
				Effect = {
					Name = "Reincarnation",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Citizen Interrogation-V" },
								{ "Add", "Raid Operation-V" },
								{ "Add", "City Destruction-V" }
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 1, Yellow = 1 },
		CustomReminderRansack = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself 3 choices —\n🅐 Ransack 2. If you do, a target fighter gains 200 Health and Power.\n🅑 Ransack 7. If you do, search your deck for a Red card and a Yellow card. You can't cast actions this turn.\n🅒 Ransack 12. If you do, deal 1200 damage to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Citizen Interrogation" },
						{ "Add", "Raid Operation" },
						{ "Add", "City Destruction" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "For once, the Familey used their numbers to benefit those outside their group."
	},
	["Citizen Interrogation"] = {
		Id = 14632167413,
		Name = "Citizen Interrogation",
		AltCards = {
			["Citizen Interrogation-V"] = {
				Id = 16206875671,
				Name = "Diary Session",
				AttackEffect = "Punch",
				Bio = "I can't believe she's seriously going to friend that RAT over me!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Neutral",
		Cost = { Red = 0 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		TokenOmni = true,
		Fading = true,
		Archetype = "Crystal",
		Effect = {
			Name = "Reincarnation",
			Description = "Ransack 2.\nIf you do, A target fighter gains 200 Health and Power.\nDestroy all Choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 1 },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
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
					Power = {
						{ "Strengthen", 200 },
						{ "Heal", 200 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "\"Let's find that mangy cat! Ask the cityfolk if they've seen her.\"<br/>- Kingrin"
	},
	["Raid Operation"] = {
		Id = 14914202465,
		Name = "Raid Operation",
		AltCards = {
			["Raid Operation-V"] = {
				Id = 16206876016,
				Name = "Can't Say That On TV!",
				AttackEffect = "Punch",
				Bio = "You ##### ## a ###### ######## ### I'm gonna #### #### ### ###### ###!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Neutral",
		Cost = { Red = 0 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		TokenOmni = true,
		Fading = true,
		Archetype = "Crystal",
		Effect = {
			Name = "Reincarnation",
			Description = "Ransack 7.\nIf you do, search your deck for a Red card and a Yellow card.\nYou can't cast actions this turn.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 6 },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 7 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 7
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Red" },
						{ "RandomTutorfor", "Yellow" },
						{ "BypassAction" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"No one's seen her? Bust down her nightclub, get her attention!\"<br/>- Kingrin"
	},
	["City Destruction"] = {
		Id = 14676845745,
		Name = "City Destruction",
		AltCards = {
			["City Destruction-V"] = {
				Id = 16206874753,
				Name = "Terrible Tantrum",
				AttackEffect = "Punch",
				Bio = "This is gonna do wonders for the ratings!! "
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Neutral",
		Cost = { Red = 0 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		TokenOmni = true,
		Fading = true,
		Archetype = "Crystal",
		Effect = {
			Name = "Reincarnation",
			Description = "Ransack 12.\nIf you do, deal 1200 damage to a target fighter.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 11 },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 12 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 12
					}
				},
				OnEVCheckPass = {
					Power = { { "Damage", 1200 } },
					Target = "Single"
				}
			}
		},
		Bio = "<b>\"WHERE THE HELL IS SHE!?\"</b><br/>- Kingrin"
	},
	["Growling Guardian"] = {
		Id = 14905819389,
		Name = "Growling Guardian",
		AltCards = {
			["Growling Guardian-V"] = {
				Id = 16206875170,
				Name = "The Guy That Knows How To Cook",
				AttackEffect = "Punch",
				Bio = "Ever notice how these guys always make it really far even if they're terrible in every other regard?",
				Effect = {
					Name = "Reincarnation",
					Description = "During your end step, if there's two or fewer cards in your graveyard: Summon a Colourless 200/200 Stagehand with no abilities.",
					Ability = {
						OnEnd = {
							Power = { { "Summon", "Summonant", "Ally" } },
							Target = "Self",
							EffectRequirement = { "Board", "AllyGraveZone", 0, 3 }
						}
					}
				},
				Summonant = "Citizen-V"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Jab",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectVariable = 0,
		RansackCount = 0,
		Summonant = "Citizen",
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if there's 2 or fewer cards in your graveyard: Summon a Colourless 200/200 Citizen with no abilities.",
			Ability = {
				OnEnd = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self",
					EffectRequirement = { "Board", "AllyGraveZone", 0, 3 }
				}
			}
		},
		Bio = "\"Feel weird 'bout protecting outsiders. But whatever Big K does is for the Familey's good!\""
	},
	["Harrison Powell"] = {
		Id = 14632245106,
		Name = "Harrison Powell",
		AltCards = {
			["The Singularity"] = {
				Id = 15176634635,
				Name = "The Singularity",
				AttackEffect = "Divinity",
				AltArt = true,
				PremiumArt = 150,
				Commissioner = { 269771297, 925350010 },
				Summonant = "Portrait of the Vessel as a young Hivemind",
				Bio = "Note: Streaming Blox Cards turns you into a fever dream hivemind!"
			},
			["Reaper122003, Part of the Familey"] = {
				Id = 15706305536,
				Name = "Reaper122003, Part of The Familey",
				AttackEffect = "Slash",
				Summonant = "Smiley Gang Alt",
				AltArt = true,
				PremiumArt = 171,
				Bio = "\"Death is a mercy to intruders like you.\""
			},
			["Harrison Powell-V"] = {
				Id = 16056327407,
				Name = "Chip Harrison",
				AttackEffect = "Punch",
				Bio = "Famous host of Bloxburg's Besties, and three-time divorcee!",
				Summonant = "Citizen-V"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Hammer",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Yellow = 5, Neutral = 1 },
		EffectVariable = 0,
		Summonant = "Citizen",
		RansackCount = 0,
		CustomReminderRansack = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if you've obliterated a card this turn: Unlock it.\nWhenever this card attacks: Ransack 5. If you do, summon a Colourless 200/200 Citizen with no abilities. All allied fighters gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ObliterateCount", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 999, "Nil" },
							"Self"
						},
						{ "Unlock", "Variable" }
					},
					Target = "Self"
				},
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
							{ "Set", "Target", "RansackCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "up to 5 cards to Ransack",
						MinTargets = 0,
						MaxTargets = 5
					}
				},
				OnEVCheckPass = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"This city is my family.\""
	},
	["Glaggling Gunman"] = {
		Id = 98808911523420,
		Name = "Glaggling Gunman",
		AltCards = {
			["Glagging Gunman-V"] = {
				Id = 16294740386,
				Name = "Noisy Nerd",
				AttackEffect = "Punch",
				Bio = "Um, acktually..."
			}
		},
		Health = 100,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Shotgun",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		RansackCount = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: It deals 100 damage to a target enemy fighter. Put a copy of that card into your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Field_Opponent", "GraveZone_Ally", false, true },
							"SingleEnemy"
						},
						{ "Damage", 100, "SingleEnemy" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"I heard these catgirls don't feel pain. Let's test that theory!\""
	},
	["Chortling Convert"] = {
		Id = 76822736302744,
		Name = "Chortling Convert",
		AltCards = {
			["Chortling Convert-V"] = {
				Id = 16283038537,
				Name = "Bad Mid-Season Twist",
				AttackEffect = "Punch",
				Bio = "Guys, I think they might be twins...",
				Effect = {
					Name = "Reincarnation",
					Description = "When this card is ransacked: You lose 200 life. Give yourself a card from the Bloxburg's Besties.",
					Ability = {
						OnRansacked = {
							Power = {
								{ "Cost", 200 },
								{
									"RandomAdd",
									{
										"Dissing Dissident-V",
										"Giggling Gangsters-V",
										"Glagging Gunman-V",
										"Chuckling Arsonist-V",
										"Cackling Hell Biker-V",
										"Torturing Turncoat-V",
										"Scour the City-V",
										"Carnage Crowd-V",
										"Smiley Spawn-V",
										"Smiley Slasher-V",
										"Growling Guardian-V",
										"Snickering Skewer-V",
										"Hazing Ritual-V",
										"Grinning Goliath-V",
										"Found Familey-V"
									}
								}
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 200,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "RedKatana",
		Logo = "Smiley",
		SearchTerms = "Smiley Familey",
		Color = "Yellow",
		Cost = { Yellow = 1, Red = 2 },
		EffectVariable = 0,
		CustomReminderRansack = true,
		Overload = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is ransacked: You lose 200 life. Give yourself a card from the Smiley Familey.",
			Ability = {
				OnRansacked = {
					Power = {
						{ "Cost", 200 },
						{
							"RandomAdd",
							{
								"Dissing Dissident",
								"Giggling Gangsters",
								"Glaggling Gunman",
								"Chuckling Arsonist",
								"Cackling Hell Biker",
								"Torturing Turncoat",
								"Scour the City",
								"Carnage Crowd",
								"Smiling Spawn",
								"Smiley Slasher",
								"Growling Guardian",
								"Snickering Skewer",
								"Hazing Ritual",
								"Grinning Goliath",
								"Found Familey"
							}
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Kingrin's relaxed admission of the PLURRAL invasion's victims angered the old guards. These pups were in it for themselves, barely caring about the familey's honour."
	},
	["Ideals Entwined"] = {
		Id = 124696319497270,
		Name = "Ideals Entwined",
		AltCards = {
			["Ideals Entwined-V"] = {
				Id = 16283037677,
				Name = "Final Showdown",
				AttackEffect = "Knife",
				Bio = "Oh, you're approaching me?<br/>\"I can't get to Katie without coming closer.\"<br/>Then come as close as you'd like."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Logo = "Smiley",
		SearchTerms = "",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2, Red = 2 },
		EffectVariable = 0,
		RansackCount = 0,
		CustomReminderRansack = true,
		CustomReminderInject = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When you discard this card: Ransack 6 red or yellow cards.\nIf you do, Inject this card, except it costs {R}{R}{Y}{Y}.\nWhen this card is cast: Draw 2 cards. Destroy the bottom 2 cards of your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 2, "Ally" },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						}
					},
					Target = "Self"
				},
				OnDiscarded = {
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
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {
							Colors = { "Red", "Yellow" }
						},
						SelectionDescription = "up to 6 red or yellow cards to Ransack",
						MinTargets = 0,
						MaxTargets = 6
					}
				},
				OnEVCheckPass = {
					Power = { { "AddCopy" } },
					Target = "Self",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Yellow = 2, Red = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "Despite their differences, the Mayor and the King shared one thing: An unbending will to protect their homes."
	},
	["Enzymic Saviours"] = {
		Id = 14905815706,
		Name = "Enzymic Saviours",
		AltCards = {
			["Enzymic Saviours-Hal"] = {
				Name = "Marrow Mobsters",
				Id = 14781695678,
				AttackEffect = "Minigun",
				Transformant = "Enzymic Saviours-Hal",
				Bio = "Rattle 'em boys!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Crowbar",
		Archetype = "Survivor",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 7 },
		EffectVariable = 0,
		Transformant = "Enzymic Saviours",
		Dextrous = true,
		Zombified = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Transform all allied fighters into a copy of it.",
			Ability = {
				OnSummon = {
					Power = { { "Transform", "Transformant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Their time is limited, but they'll ensure the city's isn't."
	},
	["Overwhelmed Ambulance"] = {
		Id = 14632209970,
		Name = "Overwhelmed Ambulance",
		AltCards = {
			["Ziggy Starfluff and the Furries from Mars"] = {
				Id = 134235605830181,
				AltArt = true,
				Name = "FUNZSEEKERZ",
				AttackEffect = "Jab",
				PremiumArt = 142,
				Bio = "COMPLETE DESTRUCTION BY SHADOW FORCE"
			},
			["Overwhelmed Ambulance-Sun"] = {
				Id = 17346075249,
				Name = "I-Scream Truck",
				AttackEffect = "Slash",
				Bio = "It's got quite the sweet tooth."
			},
			["Taxi Passengers Salad"] = {
				Id = 137434920592503,
				Name = "Taxi Passengers Salad",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 410,
				Bio = "There’s two ‘Salads’ but only one passenger, isn’t that odd…taxi"
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4 },
		EffectVariable = 0,
		EffectAnimation = "MonsterTruck",
		Dextrous = true,
		Effect = {
			Name = "Reincarnation",
			Description = "After this card attacks: Swap its stats.",
			Ability = {
				OnAttackEnd = {
					Power = { { "Swap" } },
					Target = "Self"
				}
			}
		},
		Bio = "The point of immortality was to reduce, not increase, the burden on healthcare services."
	},
	["Criticism Against Inaction"] = {
		Id = 14632223709,
		Name = "Criticism Against Inaction",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Unapologetic Determination",
		NegateAction = true,
		EffectAnimation = "Criticism",
		Effect = {
			Name = "Reincarnation",
			Description = "As your opponent casts an action: Negate its effect. Draw a card, then destroy this card.",
			Ability = {
				OnEnemyCast = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "DestroyGear", "Criticism Against Inaction", "Self" },
						{ "Destroy" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Eisenhower recoiled at Apollo's fierce condemnation of his cowardice. As he turned around and ran away, he realised the small child was right."
	},
	["The Enzyme Expunged"] = {
		Id = 14676802577,
		Name = "The Enzyme Expunged",
		AltCards = {
			["The Enzyme Expunged-V"] = {
				Id = 15941929944,
				Name = "Starting Over",
				AttackEffect = "Whirlpool",
				Bio = "A broken heart will eventually heal, even if the scars remain."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2 },
		EffectVariable = 0,
		ObliterateOnCast = true,
		Rank = 16,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate this card and all allied cards in all zones.\nPut 2 Colourless Studs into your baseplate.\nSet your life total to 4000.\nShuffle all other cards in your starting deck into your deck.\nDraw 7 cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DestroyTerrain" },
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
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Hand_Ally", "Nil", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Deck_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "Field_Ally", "Nil", true, false, 10 },
							"Self"
						},
						{
							"AddGenZone",
							{ "Mark Stud", 2 }
						},
						{ "SetLife", 4000, "Ally" },
						{ "ShuffleStartingDeck" },
						{ "Draw", 7 },
						{ "Oblierate", 30, "Self" }
					},
					Target = "Ally"
				}
			},
			GenZoneDiscardObliterate = true
		},
		Bio = "\"Your passionate mayhem,\" scowled Lua, \"...will echo for generations as the worst travesty this century. May your solitude teach you the consequences that come from violating the natural order.\""
	},
	["Empty Office"] = {
		Id = 14632238633,
		Name = "Empty Office",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 5 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Just a Burning Memory",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, when you cast a card: Shuffle your hand into your deck, then draw that many cards.",
			Ability = {
				OnAnyAllyCast = {
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
						{ "Draw", "Variable" }
					},
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Dr. Grey stared down the hallway, the office door with no name returning her gaze. Feelings of regret stirred in her heart, but there's no point in deliberating over the past anymore.<br/>Time for her appointment with her next patient."
	},
	Shaakra = {
		Id = 14632216758,
		Name = "Shaakra",
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Minigun",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if there's an allied zombified fighter: Give yourself a Necroenzyme Vial.",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Necroenzyme Vial", "Ally" } },
					Target = "Self",
					EffectRequirement = { "HasPassive", "Ally", 1, 9999, "Zombified" }
				}
			}
		},
		Bio = "See? Games based on mowing down hordes of zombies didn't end up being a waste of time!"
	},
	["Enzymic Prototype"] = {
		Id = 14676822285,
		Name = "Enzymic Prototype",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Goo",
		Color = "Blue",
		Cost = { Blue = 4 },
		EffectVariable = 1,
		Summonant = "Morphic Goo",
		Archetype = "Morphic",
		CustomReminderInject = true,
		Lunar = true,
		CustomReminder = {
			["Morphic Goo"] = "A 50/50 token fighter, inert in all zones. It shapeshifts into a random fighter when it's targeted."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Inject a target allied fighter.\nSummon a 50/50 Morphic Goo.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddCopy" },
						{ "Destroy" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleAlly",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				},
				OnEVCheckPass = {
					Power = { { "Summon", "Summonant", "Ally" } },
					Target = "Self",
					NoBlip = true
				}
			},
			Injecting = true
		},
		Bio = "Before it was repurposed to reanimate the dead, Eisenhower experimented with the necroenzyme for applications in plastic surgery."
	},
	["Eisenhower's Laboratory"] = {
		Id = 14632191222,
		Name = "Eisenhower's Laboratory",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Laboratory in Flames",
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied effect targets for the second time each turn: Give yourself a Necroenzyme Vial.",
			Ability = {
				OnAllyTarget = {
					Power = { { "Add", "Necroenzyme Vial", "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 2, 3, "TargetCount" }
				}
			}
		},
		Bio = "The birthplace of a tragedy stemmed from grief."
	},
	["Astarossa's Contingency Plan"] = {
		Id = 14905818759,
		Name = "Astarossa's Contingency Plan",
		AltCards = {
			["Astarossa's Contingency Plan-V"] = {
				Id = 16294483918,
				Name = "Awry Reception",
				AttackEffect = "Punch",
				Bio = "Whoops!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3, Red = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Search your deck for a Smiley Familey card, a CRP card, a NeFoCo card, an Arkhive card, and a Lordbreaker card. Remove {R}{G}{B}{Y} from their costs.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTutorfor", "Smiley", "Ally" },
						{ "RandomTutorfor", "Astral", "Ally" },
						{ "RandomTutorfor", "Nefoco", "Ally" },
						{ "RandomTutorfor", "Arkhive", "Ally" },
						{ "RandomTutorfor", "Lordbreaker", "Ally" }
					},
					Target = "Ally",
					MetaData = {
						AddCost = { Yellow = -1, Blue = -1, Red = -1, Green = -1 }
					}
				}
			}
		},
		Bio = "\"If the Necroenzyme proves to be a deterrant; or a threat, the procedures detailed below MUST be followed in order to protect the city's integrity.\""
	},
	["Paraselene Propagandist"] = {
		Id = 14632211317,
		Name = "Paraselene Projection",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Blue = 2, Red = 2 },
		EffectVariable = 0,
		Moonward = true,
		CustomReminder = {
			["Damnatio Memoriae"] = "A decaying fighter is dealt 200 damage during its end step."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target allied fighter and a target enemy fighter start decaying.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Decaying" },
						{ "GivePassive", "Decaying", "SingleEnemy" }
					},
					Target = "SingleAlly",
					UniqueTargets = true
				}
			}
		},
		Bio = "\"Those who spread the enzyme or the method how to will face the full vengeance of the Paraselene Sages.\"<br/>- Proclamation of Paraselene Evincar Lua, 427 AD"
	},
	LMH_Hutch = {
		Id = 14905819088,
		Name = "LMH_Hutch",
		AltCards = {
			["LMH_Hutch-V"] = {
				Id = 16206875007,
				Name = "LMH_Heart",
				AttackEffect = "Punch",
				Bio = "He really just went through thousands of old roblox games just to deliver chocolates and a rose? That's called dedication."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, If you've cast a fighter this turn: Give yourself a card with the same total stud cost as the number of fighters you've cast this turn, except it's inert when discarded. Convert all {W}{R}{B}{Y} in its cost to {G}.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "FighterCount", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = { { "RandomAdd", "VariableorExactCost Green", "Ally" } },
					Target = "AlliedAddedCard",
					MetaData_RandomAdd = {
						TokenDiscard = true,
						ConvertColors = { Yellow = "Green", Red = "Green", Blue = "Green", Neutral = "Green" }
					}
				}
			},
			RemoveOtherColors = true
		},
		Bio = "2011 starter place, or an unfinished obby made by a five-year-old. Pick your poison."
	},
	["Dwindling Gharial"] = {
		Id = 14632188558,
		Name = "Dwindling Gharial",
		Health = 550,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Green",
		Cost = { Green = 4 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if effects have given you a card since your last end step: Give yourself a Necroenzyme Vial. Change its cost to {W}.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Necroenzyme Vial", "Ally" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 99999, "Puts" },
					MetaData = {
						Cost = { Neutral = 1 }
					}
				}
			}
		},
		Bio = "It's anybody's game for immortality now."
	},
	["Patchwork of Disease"] = {
		Id = 14905817946,
		Name = "Patchwork of Disease",
		AltCards = {
			["Patchwork of Disease-Offer"] = {
				Name = "Haunted Mirror",
				AttackEffect = "SoulDrain",
				PackDisplayOverride = "Hallow's Tale: Special Offer",
				Id = 14979356523,
				Bio = "\"if only they knew how much hatred and revenge she grew each time that girl remembered of her own tragedy...being thrown away into an abandoned well...will soon make anyone who have watched the tape..meet their fate far worse than death..”"
			},
			["Patchwork of Disease-V"] = {
				Id = 16056316854,
				Name = "Kur-Kurayin",
				AttackEffect = "Punch",
				Bio = ""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "HauntBite",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Summon all copies of this card from your graveyard that have died this game.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{
							"Patchwork of Disease_HasDied",
							"GraveZone_Ally",
							"Field_Ally",
							true,
							false,
							10
						},
						"Self"
					} },
					Target = "Ally"
				}
			}
		},
		Bio = "With the Enzyme's supply rapidly dropping, many of the zombified stuck together, sharing their supplies."
	},
	["Babylon Scion"] = {
		Id = 14632159866,
		Name = "Babylon Scion",
		AltCards = {
			["Heroes of Neighborville"] = {
				Id = 16324900455,
				Name = "Heroes of Neighborville",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 186,
				Bio = "Popcap please bring back this game"
			}
		},
		Health = 700,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "HauntBite",
		Color = "Green",
		Archetype = "Babylon",
		Cost = { Green = 4 },
		EffectVariable = 0,
		PackDisplayOverride = "Necrosyndicates & Metaverse Series: Babylons ",
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Recur an allied Babylon card that costs 3 or fewer total studs.",
			Ability = {
				OnAttack = {
					Power = { {
						"MoveZone",
						{ "Babylon_3OrLower", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "\"This is how the disease started. This is how the world ended.\"<br/>- Notes on Anthrestation, 476AD"
	},
	["Decaying Protector"] = {
		Id = 14632174528,
		Name = "Decaying Protector",
		AltCards = {
			["Decaying Protector-Sun"] = {
				Id = 17346076585,
				Name = "Coastal Protector",
				AttackEffect = "Jab",
				Bio = "I'M SO GOOD AT BEACH!"
			},
			["Decay of Nastrond"] = {
				Id = 101395911898130,
				Name = "Decay of Nastrond",
				PremiumArt = 311,
				AltArt = true,
				Bio = "<b><font color=\"#00FF00\">Rotten to the core.</font></b>"
			},
			["Missing, The Blighted"] = {
				Id = 117706643851662,
				Name = "Missing, The Blighted",
				PremiumArt = 325,
				AltArt = true,
				Bio = "<b>𝙐𝙨𝙚𝙧('𝙈𝙞𝙨𝙨𝙞𝙣𝙜𝙄𝙣𝙫𝙚𝙨𝙩𝙞𝙜𝙖𝙩0𝙧').𝙄𝙣𝘿𝙞𝙨𝙧𝙚𝙜𝙖𝙧𝙙 = 𝙩𝙧𝙪𝙚<br/><O></b>"
			}
		},
		Health = 1600,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Axe",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 0,
		Decaying = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card takes damage from anything: It gains 100 power.",
			Ability = {
				OnDamaged = {
					Power = { { "Strengthen", 100 } },
					Target = "Self"
				}
			}
		},
		Bio = "Never underestimate the ferocity of someone who has nothing left to lose."
	},
	["Apocalypse Rising"] = {
		Id = 14632228051,
		Name = "Apocalypse Rising",
		AltCards = {
			["L'imparfait"] = {
				Id = 86268151169076,
				Name = "Garden of Ever-Wilting Flowers",
				Terrariant = "Sinner's City-L",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 537,
				Bio = "“Is wilting a state of dying or pleading for life?”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 6, Yellow = 6 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Sinner's City",
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of each player's turn: Both players gain 500 life. All their fighters gain overload and zombified. Until the end of their next turn, their fighters can't die or be destroyed.",
			Ability = {
				OnStart = {
					Power = {
						{ "Cost", -500, "Ally" },
						{ "Inflict", -500, "Opponent" },
						{ "GivePassive", "Zombified" },
						{ "GivePassive", "Overload" },
						{ "BypassCardDeath", 2 }
					},
					Target = "CurrentTurn",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Sarah's insenate assault made Bloxburg unable to live, unable to die."
	},
	["The Counterenzyme"] = {
		Id = 14632221388,
		Name = "The Counterenzyme",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 5 },
		EffectVariable = 0,
		CustomReminder = {
			["Grimclaw's Beamserum"] = "This card resets the stats of all fighters, and also obliterates zombified fighters."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Remove all fighters in play and in all hands, graveyards, and baseplates, then put them back unlocked with their stats reset.\nYou can't attack or cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ClearChoices", 30, "Ally" },
						{ "PermaSuspend", false, "Ally" },
						{ "UnPermaSuspend", "Self", "Ally" },
						{
							"MoveZone",
							{ "Fighter", "GraveZone_Ally", "ChoiceZone_Ally", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "ChoiceZone_Ally", "GraveZone_Ally", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "Hand_Ally", "ChoiceZone_Ally", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "ChoiceZone_Ally", "Hand_Ally", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "GenZone_Ally", "ChoiceZone_Ally", true, false, 99 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "ChoiceZone_Ally", "GenZone_Ally", true, false, 99 },
							"Self"
						},
						{ "ClearChoices", 30, "Opponent" },
						{ "PermaSuspend", false, "Opponent" },
						{ "UnPermaSuspend", "Self", "Opponent" },
						{
							"MoveZone",
							{ "Fighter", "Field_Opponent", "ChoiceZone_Opponent", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "ChoiceZone_Opponent", "Field_Opponent", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{
								"Fighter",
								"GraveZone_Opponent",
								"ChoiceZone_Opponent",
								true,
								false,
								99
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"Fighter",
								"ChoiceZone_Opponent",
								"GraveZone_Opponent",
								true,
								false,
								99
							},
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "Hand_Opponent", "ChoiceZone_Opponent", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Fighter", "ChoiceZone_Opponent", "Hand_Opponent", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{
								"Fighter",
								"GenZone_Opponent",
								"ChoiceZone_Opponent",
								true,
								false,
								99
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"Fighter",
								"ChoiceZone_Opponent",
								"GenZone_Opponent",
								true,
								false,
								99
							},
							"Self"
						},
						{ "Reset", 30, "All" },
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
					Target = "Self",
					MetaData = { Unlock = 999 }
				}
			}
		},
		Bio = "Artemis shuddered at the bargain his boyfriend struck. Were they trading one apocalypse for another?"
	},
	["Closing Act"] = {
		Id = 115074604754106,
		Name = "Closing Act",
		AltCards = {
			["Nastrond's Revenge"] = {
				Id = 91373745940583,
				Name = "Nastrond's Revenge",
				PremiumArt = 313,
				Effect = {
					Name = "Reincarnation",
					Description = "Deal 700 overloaded damage to a target fighter. You gain the excess damage in life.\nDuring your end step, if this card and 7 or more other cards are in your Baseplate: Put a Green Stud into your baseplate, then move this card into your hand from there, except it's inert when discarded.",
					Ability = {
						OnSummon = {
							Power = { { "DamageOverloaded", 700, "Single" } },
							Target = "Self"
						},
						OnEnd = {
							Power = {
								{
									"AlterEV",
									{ "Set", "Math", 1, "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 0 },
								{
									"MoveZone",
									{ "EffectTarget", "GenZone_Ally", "Hand_Ally", false, false },
									"Self"
								}
							},
							Target = "Self",
							MetaData = { TokenDiscard = true },
							EffectRequirement = { "Board", "AllyGenZone", 8, 9999 },
							DontTriggerInField = true
						},
						OnEVCheckPass = {
							Power = { {
								"AddGenZone",
								{ "Green StudNastrond", 1 },
								"Ally"
							} },
							Target = "Self"
						}
					},
					HealOverload = true
				},
				AltArt = true,
				Bio = "that bio is way too long lol"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 6 },
		EffectVariable = 0,
		TriggerInGenZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 700 overloaded damage to a target fighter. You gain the excess damage in life.\nDuring your end step, if this card and 7 or more other cards are in your Baseplate: Put a Green Stud into your baseplate, then move this card into your hand from there, except it's inert when discarded.",
			Ability = {
				OnSummon = {
					Power = { { "DamageOverloaded", 700, "Single" } },
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 },
						{
							"MoveZone",
							{ "EffectTarget", "GenZone_Ally", "Hand_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					MetaData = { TokenDiscard = true },
					EffectRequirement = { "Board", "AllyGenZone", 8, 9999 },
					DontTriggerInField = true
				},
				OnEVCheckPass = {
					Power = { {
						"AddGenZone",
						{ "Green Stud", 1 },
						"Ally"
					} },
					Target = "Self"
				}
			},
			HealOverload = true
		},
		Bio = "With his last breath, Artemis ensured that his husband's creation would no longer fall into the hands of those who seek to abuse it."
	},
	["Devin Conway"] = {
		Id = 14632232798,
		Name = "Devin Conway",
		AltCards = {
			["Devin Conway-Event"] = {
				Name = "The Faceless",
				Id = 14840828600,
				AttackEffect = "Divinity",
				Bio = "A lonely nobody who desires to be somebody."
			}
		},
		Health = 250,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "CameraSelf",
		Color = "Green",
		Cost = { Green = 1 },
		EffectVariable = 0,
		Regen = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card is recurred: Recur the top card of your graveyard, except it's Fading.",
			Ability = {
				OnRecured = {
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
		Bio = "\"Few people are always virtuous.<br/>Few people are exempt from forgiveness.\""
	},
	["Defilation of Grief"] = {
		Id = 78340516510152,
		Name = "Defilation of Grief",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate your graveyard.\nGive yourself a Necroenzyme Vial for every 3 cards obliterated in this way.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Add", "Necroenzyme Vial", "Ally" },
						{
							"AlterEV",
							{ "Subtract", "Math", 3, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 2, "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Even as the police collapsed, the laws of supply and demand were still fully enforced."
	},
	["Opportunistic Coward"] = {
		Id = 14905815138,
		Name = "Opportunistic Coward",
		AltCards = {
			["Opportunistic Coward-Hal"] = {
				Name = "Devil's Advocate",
				AttackEffect = "Flame",
				Id = 14959557025,
				Bio = "Your honor, he may have burned down several orphanages, but let's be fair here, everyone is gonna meet their end anyways. He just sped up the process!"
			}
		},
		Health = 250,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Acid",
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		Charge = true,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step, if you have 2 or fewer cards in hand: Reset its stats. Return this card to your hand.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Reset" },
						{ "Unlock", 1, "Self" },
						{ "Return" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "AllyHand", 0, 3, "Any" }
				}
			}
		},
		Bio = "The worst kind of person."
	},
	["Distressed Cityfolk"] = {
		Id = 14632187021,
		Name = "Distressed Cityfolk",
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Red = 2, Neutral = 1 },
		EffectVariable = 0,
		TriggerInGraveZone = true,
		Effect = {
			Name = "Reincarnation",
			Description = "At the start of your turns, if this card is in your graveyard, has died this game, and there's an allied fighter with 1500 or more total stats: Recur this card.",
			Ability = {
				OnAllyStart = {
					Power = { {
						"MoveZone",
						{
							"Distressed Cityfolk_HasDied",
							"GraveZone_Ally",
							"Hand_Ally",
							true,
							false
						},
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "SizeClass", "Ally", 1, 9999, "Gigant" }
				}
			}
		},
		Bio = "All you need to persuade people to rally up is a strong leader."
	},
	["Impish Photographer"] = {
		Id = 121158822719329,
		Name = "Impish Photographer",
		AltCards = {
			["Impish Photographer-Banner"] = {
				Id = 114360275687978,
				Name = "Thec Fangirl",
				AttackEffect = "LycanScratch",
				EffectAnimation = "CameraSelf",
				Bio = "His smile…his gaze….everything is perfect about him!!"
			}
		},
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Scratch",
		EffectAnimation = "CameraSelf",
		Color = "Red",
		Cost = { Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Reveal your opponent's hand and select a card in it. Add {W} to its cost.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{
							"IncreaseCost",
							{ 1, "Neutral" },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = {},
						SelectionDescription = "a card from your opponent's hand to increase the cost of.",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "<b>*SNAP!* *SNAP!*</b> \"This is HIGHLY Substantial!\""
	},
	["Euphoric Vengeance"] = {
		Id = 14914832933,
		Name = "Euphoric Vengeance",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectVariable = 0,
		EffectAnimation = "RootCause",
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains 400 Power.\nDestroy the bottom 4 cards of your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 400, "Single" },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"The world will be a better place without you in it; You won't be scared or sad anymore, and your spine is so exhilarating!\"<br/>- Sarah, Apex of Fantasies"
	},
	["Ancestry's End"] = {
		Id = 14632154307,
		Name = "Ancestry's End",
		AltCards = {
			["Ancestry's End-Hal"] = { Id = 14726827794, Name = "Sorrow", Bio = "\"...Sorry.\"" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		SkipOnImmune = true,
		Color = "Red",
		Cost = { Red = 8 },
		EffectVariable = 0,
		EffectAnimation = "AncestryEnd",
		CustomReminder = {
			["Lua's Judgment"] = "nonfighter cards have 0 health and are destroyed by this effect."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 200 damage to all enemy fighters and all fighters in your opponent's hand.\nDestroy all cards in your opponent's hand with 0 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 200, "Opponent" },
						{ "HealHand", -200, "Opponent" },
						{ "SpecificDiscard" }
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = "ZeroHealth"
					}
				}
			}
		},
		Bio = "Grimclaw struggled against Lua's restraints, but ultimately accepted his fate. An eternal imprisonment would mean eternal life."
	},
	["The Killer"] = {
		Id = 14632256027,
		Name = "The Killer",
		AltCards = {
			["The Killer-Banner"] = {
				Id = 14840647547,
				Name = "Yune",
				AttackEffect = "British",
				Bio = "\"Don't worry, Yuki.....Yune will protect you...\""
			},
			["The Killer-Offer"] = {
				Id = 14972307567,
				Name = "Lunar Emissary, Nova",
				AttackEffect = "RedScythe",
				PackDisplayOverride = "Hallow's Tale: Special Offer",
				Bio = "The emissary that walked under the moon, shaded in red has come to deliver one’s impending doom."
			},
			["The Killer-C"] = {
				Name = "Joe Lee",
				Id = 15486360676,
				AttackEffect = "British",
				Bio = "Who knew the wicked green grump was so susceptible to poison?"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "DoomStorm",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		TriggerInGraveZone = true,
		EffectVariable = 0,
		CardObliterateCount = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of your turns, if you have 7 or more Red cards in your Baseplate: Summon this card from your graveyard unlocked. You lose 400 life.",
			Ability = {
				OnAllyStart = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{ "Unlock", 999 },
						{ "Cost", 400, "Ally" }
					},
					Target = "Self",
					DontTriggerInField = true,
					EffectRequirement = { "Color", "AllyGenZone", 7, 9999, "Red" }
				}
			}
		},
		Bio = "For as long as people would fear his name, his spirit would return. The hunt is always on."
	},
	["Eisenhower, World Ablaze"] = {
		Id = 14632235844,
		Name = "Eisenhower, World Ablaze",
		AltCards = {
			["ADeadBody14, Grand Revolver"] = {
				Id = 17251037403,
				Name = "ADeadBody14, Grand Revolver",
				AltArt = true,
				PremiumArt = 120,
				Commissioner = { 2447703770, 31112823 },
				AttackEffect = "Revolver",
				Bio = "\"Six shots, one destiny, endless legends.\""
			},
			["Eisenhower, World Ablaze-Event"] = {
				Id = 14840637063,
				Name = "Spamsentonwer NEO",
				AttackEffect = "LaserRed",
				Bio = " \"I HAD TO ABANDON THAT [Rockin' Body] FOR THIS SUIT I CONSTRUCTED [For Only 14.99$!], JUST TO [Protect From Diseases!] MY BELOVED ARTEMIS. PREPARE TO [Die], [feline friend]!\""
			},
			["Last Laugh Crusade"] = {
				Id = 112587500361799,
				Name = "Last Laugh Crusade",
				Commissioner = { "BonkJobBot" },
				AttackEffect = "Hammer",
				AltArt = true,
				SummonAnimation = "KingrinSummon",
				PremiumArt = 760,
				ArtAnimation = "LastLaughCrusade",
				Bio = "Death came knocking when the necroenzyme supply was torched. <br/>Death greeted us with a smile.<br/>We smile back at Death.<br/>We Laugh at Death one last time.<br/>Before accepting Death as part of the Familey.<br/>-- Joyful Jouster"
			},
			["Oninaka, The Crow"] = {
				Id = 73011957277228,
				Name = "Oninaka, The Crow",
				Commissioner = { "BonkJobBot" },
				AttackEffect = "XhartyrSlash",
				SummonAnimation = "XhartyrSummon",
				AltArt = true,
				PremiumArt = 789,
				Bio = "\"TEAMMATES!? FRIENDS!? TO HECK WITH THAT!\""
			}
		},
		Health = 1300,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Flare",
		EffectAnimation = "FireBreathAllyDeck",
		Color = "Red",
		Cost = { Neutral = 5, Red = 2 },
		Rank = 5,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Destroy the top card of your deck. This card gains 100 Power for each stud in that card's cost. Do this three more times.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 4, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", 0, "AmountLeft" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "TopCard", "Deck_Ally", "GraveZone_Ally", false, false },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Cost", "Nil" },
							"CustomTarget"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable" },
						{
							"AlterEV",
							{ "Load", "Math", 0, "AmountLeft" },
							"Self"
						},
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", 0, "AmountLeft" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					},
					NoBlip = true
				}
			}
		},
		Bio = "Eisenhower stared at the havoc he had caused to Bloxburg. He stared at his dead husband, and he stared at the culmination of his mistakes.<br/>\"I'm sorry,\" he said as he prepped a flamethrower, \"...and goodbye.\""
	},
	["Seperate the Tumor"] = {
		Id = 93663109915794,
		Name = "Separate the Tumor",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3 },
		EffectVariable = 0,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a card in your graveyard. Obliterate that card, then deal damage equal to its power to a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"CustomZoneTarget"
						},
						{ "GraveDestroy", 30, "CustomZoneTarget" },
						{ "EVExactValueCheck", -1 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = {},
						SelectionDescription = "a card from your garveyard to obliterate",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnEVCheckFail = {
					Power = { { "Damage", "Variable", "Single" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "<b>DON'T STOP ME I DON'T WANT TO DIE DON'T STOP ME I DON'T WANT TO DIE DON'T STOP ME I DON'T WANT TO DIE DON'T STOP ME I DON'T WANT TO DIE</b>"
	},
	["Outraged Octogenarian"] = {
		Id = 14905818241,
		Name = "Outraged Octogenarian",
		AltCards = {
			["Outraged Octogenarian-C"] = {
				Name = "Outraged Shopper",
				Id = 15176637077,
				Bio = "She's late and she's making it EVERYONE'S problem."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		EffectVariable = 0,
		SummonAnimation = "OldLadyShout",
		EffectAnimation = "OldLadyShout",
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an allied fighter attacks: Lock this fighter for 1 turn, then unlock the attacking fighter.",
			Ability = {
				OnAllyAttack = {
					Power = {
						{ "Lock", 1, "Self", nil, nil, "OldLadyShoutCar" },
						{ "Unlock", 9999, "Aggressor" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"I have been loyal to Astarossa for the past 50 years and he spits on my face. I spit on his dream!\""
	},
	["Face your Failures"] = {
		Id = 14632242913,
		Name = "Face your Failures",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 6 },
		EffectVariable = 0,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Obliterate all cards in all graveyards.\nA target fighter gains 50 power for each card obliterated in this way.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "All", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Add", "GraveZone_Opponent", "All", "Nil" },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Ally", "Nil", true, false, 999 },
							"Self"
						},
						{
							"MoveZone",
							{ "All", "GraveZone_Opponent", "Nil", true, false, 999 },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Apollo's excoriation rang in Eisenhower's ears. The young inventor had a point; He had done next to nothing to resolve this mess. No longer."
	},
	["Will to Survive"] = {
		Id = 73446422019057,
		Name = "Will to Survive",
		AltCards = {
			["Will to Survive-Hal"] = {
				Id = 14959557609,
				Name = "Joyless Persistence",
				Bio = " \"Maybe we couldn't have fought back. Maybe not. But did we have to do their work for them? Did we have to round up the kids ourselves?\" \n\t\t\t\t- Carter"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1, Green = 1, Neutral = 4 },
		EffectVariable = 0,
		Fading = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select an unranked fighter card in your graveyard with a total stud cost of 1, then one with a total stud cost of 2, then one with a total stud cost of 3. Summon those cards, except they're fading.",
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
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, Unranked = true, CostExact = 1 },
						SelectionDescription = "a 1 stud cost card from your graveyard to summon",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, Unranked = true, CostExact = 2 },
						SelectionDescription = "a 2 stud cost card from your graveyard to summon",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				},
				OnEVCheckFail = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Field_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, Unranked = true, CostExact = 3 },
						SelectionDescription = "a 3 stud cost card from your graveyard to summon",
						MinTargets = 1,
						MaxTargets = 1
					},
					MetaData = { Fading = true }
				}
			}
		},
		Bio = "\"It is better to live quadriplegic and blind than it is to live forever.\" - McKayla"
	},
	["Feral Citizen"] = {
		Id = 14632197558,
		Name = "Feral Citizen",
		AltCards = {
			["Santa Doge"] = {
				Id = 15176635915,
				Name = "Cranky Citizen",
				Bio = "\"Um excuse me what are you're doing in my house? Can you get out right now? Oh, you're a Plurral, you're here for the enzymes. Let me put this in a language you'll understand \"NYAH NYAH NYAH gow bawck tuwu youw cwub\"\""
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever your opponent casts a fighter: Choose a target enemy fighter. This card and that fighter deal damage equal to their power to each other.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "Target", "Power", "EnemyPower" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" },
							"Self"
						},
						{ "Damage", "Variable", "SingleEnemy" },
						{
							"AlterEV",
							{ "Load", "Target", "Power", "EnemyPower" },
							"Self"
						},
						{ "Damage", "Variable", "Self" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "He tried to die as he lived: Fashionably awesome."
	},
	["Shady Supplier"] = {
		Id = 14632218908,
		Name = "Shady Supplier",
		Health = 700,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "During your end step: Give yourself a Necroenzyme Vial and change its cost to {W}{W}. It might turn what it recurs into a Debased Catgirl...",
			Ability = {
				OnEnd = {
					Power = { { "Add", "Nebulous Vial", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "With demand for the Enzyme far outstripping supply, many opportunists created it in their garage."
	},
	["Nebulous Vial"] = {
		Id = 14905815304,
		Name = "Synthetic Enzyme",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		TokenOmni = true,
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Select a fighter card in your graveyard.\nRecur that card, but it might become a Debased Catgirl...",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "ChosenCard" },
							"TargetAllyFighterInGraveyard"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "AddRandomNumber", "Math", 0, 3 },
							"Self"
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ChosenCard" },
							"Self"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Ally", "Hand_Ally", false, false },
							"Self"
						}
					},
					Target = "Self",
					MetaData = { Fading = true, Zombified = true }
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ChosenCard" },
							"Self"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Ally", "Nil", false, false },
							"Self"
						},
						{ "Add", "Debased Catgirl", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"Immortality was supposed to elevate us. But now I crawl the streets, begging for god knows what's in this vial just to stay alive.\" - Cassandra, Homeless Citizen"
	},
	["Botanical Beggar"] = {
		Id = 14676813122,
		Name = "Botanical Beggar",
		Health = 800,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Scorch",
		Color = "Yellow",
		Cost = { Yellow = 1, Green = 2 },
		EffectVariable = 0,
		Decaying = true,
		Addant = "Snail",
		CustomReminder = {
			Snail = "A free 300/200 fighter, inert in play. It deals 100 damage to itself during your end steps."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever an effect gives you a card: Give yourself a 300/200 Snail.",
			Ability = {
				OnAllyPut = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Enzyme injections had to be done alongside immunity shots to make up for the body's deteriorating state, preventing other organisms from growing inside the body."
	},
	["Therapy Dog"] = {
		Id = 14905818933,
		Name = "Therapy Dog",
		AltCards = {
			["Floofy, In the name of Love and Hate"] = {
				Id = 131352585662360,
				Name = "Floofy, In the name of Love and Hate",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 465,
				Bio = "I gues you could say this is Hatredofperfected's Ego"
			},
			Mihorice = {
				Id = 102102752794379,
				Name = "Mihorice!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 578,
				Bio = "\"...What the heck?! Out of all the cards ya' could put ya' relationship over, ya' really chose Therapy Dog?!\"<br/>\"Do ya' seriously value ya' relationship at 1 colourless an' 2 yellow?!\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a fighter, if there are exactly 2 colours in its stud cost: It gains 200 Power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "CastedCard" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CostColors", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", 2, "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "CastedCard" },
							"Self"
						},
						{ "Strengthen", 200 }
					},
					Target = "EVCard"
				}
			}
		},
		Bio = "Even when the world is aflame, you can always count on a man's best friend."
	},
	["Jestorder's Failsafe"] = {
		Id = 14905814947,
		Name = "Jestorder's Failsafe",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "The Failsafe Altered",
		ReplaceDescriptionant = "Variable charges.\nWhenever a non-Yellow fighter is cast: This card gains a charge. Then if it has 10 charges, the active player destroys this card and all of their enemy fighters.",
		Effect = {
			Name = "Reincarnation",
			Description = "0 charges.\nWhenever a non-Yellow fighter is cast: This card gains a charge. Then if it has 10 charges, the active player destroys this card and all of their enemy fighters.",
			Ability = {
				OnAnySummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" }
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "EVGreaterValueCheck", 9 }
					},
					Target = "Self",
					NotColor = "Yellow"
				},
				OnEVCheckPass = {
					Power = {
						{
							"Destroy",
							nil,
							"NonCurrentTurn",
							nil,
							nil,
							nil,
							"Failsafe"
						},
						{ "Destroy", 30, "Self" }
					},
					Target = "NonCurrentTurn"
				}
			}
		},
		Bio = "\"[...] His studbomb, originally designed to kill non-revel devils, can be hacked to employ an alternative discriminator.\"<br/>- Astarossa's Contingency, Page 8"
	},
	["A Legendary Gathering"] = {
		Id = 14905816071,
		Name = "A Legendary Gathering",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select any number of cards in your hand. Destroy those cards, then search your deck for that many legendary cards.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"CustomZoneTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "GraveZone_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"RepeatingTutorfor",
							{ "LegendaryorNoAddBlock", "Variable" }
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "any number of cards in your hand to destroy.",
						MinTargets = 0,
						MaxTargets = 10
					}
				}
			}
		},
		Bio = "Each head of the necrosyndicates felt responsible for Bloxburg's decay, and they all wished to work together to remedy their wrongs."
	},
	["A Simple Pep Talk"] = {
		Id = 14845148362,
		Name = "A Simple Pep Talk",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a fighter card in your graveyard that cost 5 or fewer total studs and recur it.\nRepeat this effect if there's exactly 2 colours among cards in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0 }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, CostOrLess = 5 },
						SelectionDescription = "a fighter to recur.",
						MinTargets = 1,
						MaxTargets = 1
					}
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { Fighter = true, CostOrLess = 5 },
						SelectionDescription = "a fighter to recur.",
						MinTargets = 1,
						MaxTargets = 1
					},
					EffectRequirement = { "Chromatic", "AllyGraveZone", 2, 3 }
				}
			}
		},
		Bio = "The Smiling Tyrant saw a man, sent to despair from something he knew all too well. If there was one last thing he wished to do, it was to push that man to continue living."
	},
	["Flesh Centrifuge"] = {
		Id = 82929696204034,
		Name = "Flesh Centrifuge",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Bite",
		Color = "Yellow",
		Fading = true,
		Gear = true,
		AddHealth = 200,
		AddPower = 200,
		Cost = { Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nAt the start of each turn: Obliterate this fighter, then summon a fighter from any graveyard unlocked with a copy of this card attached to it.",
			Ability = {
				OnStart = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Ally", "Field_Ally", false, false },
							"Self"
						},
						{
							"MoveZone",
							{ "Target", "GraveZone_Opponent", "Field_Ally", false, false },
							"Self"
						},
						{ "EquipGear", "Flesh Centrifuge", "SummonedCard" },
						{ "Unlock", 999, "SummonedCard" },
						{ "Obliterate" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone", "Enemy_GraveZone" },
						Condition = "RandomSingleFighter",
						Modifier = 1
					}
				}
			}
		},
		Bio = "\"This would make a great zoo attraction.\"<br/>- Apate, Demon Investor"
	},
	["Enzyme Runner"] = {
		Id = 14632193683,
		Name = "Enzyme Runner",
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Necroenzyme Vial"] = "A ⚪⚪⚪ token action, inert in all zones, that allows you to choose a fighter from three in your graveyard and put it into your hand."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Shuffle a Necroenzyme Vial into your deck.\nWhenever this card attacks: Search your deck for a token card.",
			Ability = {
				OnSummon = {
					Power = { { "DeckAdd", "Necroenzyme Vial" } },
					Target = "Ally"
				},
				OnAttack = {
					Power = { { "RandomTutorfor", "Token" } },
					Target = "Ally"
				}
			}
		},
		Bio = "When the enzyme became a scarcity, stealing it became a common profession."
	},
	["Into the Shelters"] = {
		Id = 14676816303,
		Name = "Into the Shelters",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Reset a target allied fighter's stats.\nReturn it to your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Reset" },
						{ "Unlock", 9999 },
						{ "Return" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Early into the Demon Wars, Herrus built underground shelters to keep his noob livestock safe. He hoped they'd never be used."
	},
	["Emergency Medical Team"] = {
		Id = 136144237864998,
		Name = "Emergency Medical Team",
		AltCards = {
			["N_ME, Overworked"] = {
				Id = 95669826345160,
				Name = "N_ME, Overworked",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 474,
				Bio = "\"I didn't sign up for this!\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "RegenCoilEffect",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an allied fighter finishes attacking: It gains 200 Health.",
			Ability = {
				OnAllyAttackEnd = {
					Power = { { "Heal", 200 } },
					Target = "Aggressor"
				}
			}
		},
		Bio = "When word spread of a way to end the zombie apocalypse, Messiah Hospital gathered to support those who sought such a chance."
	},
	["Hack the Failsafe"] = {
		Id = 14905816716,
		Name = "Hack the Failsafe",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 1 },
		EffectVariable = 0,
		Fading = true,
		Lunar = true,
		CustomReminder = {
			["Rise of the Philosopher-Kings"] = "When a zombified fighter leaves play for any reason, obliterate it."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself 2 choices —\n🅐 All fighters become zombified.\n🅑 All fighters lose zombified and fading.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "HTFC1" },
						{ "Add", "HTFC2" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Bloxburg and the Astral Faith found their final conflict within the Wellspring's underground basin. There, the fate of the mortal and immortal would be decided."
	},
	HTFC1 = {
		Id = 14905817374,
		Name = "Immortal Dusk",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Crystal",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		CustomReminder = {
			["Rise of the Philosopher-Kings"] = "When a zombified fighter leaves play for any reason, obliterate it."
		},
		Fading = true,
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "All fighters become zombified.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "Zombified" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "All"
				}
			}
		},
		Bio = "\"While the forces against zealous immortality fought valiantly, the half of Bloxburg's 400,000 population to not take the enzyme perished with the Failsafe's detonation. The small yet dangerous chapters of the Astral Faith abused their immortality to subjugate other Robloxian settlements, returning Robloxia to the feudal ages the Demon Wars were fought to escape from.\"<br/>- Herrus' Archives, MCMXCVIIIb"
	},
	HTFC2 = {
		Id = 14905817025,
		Name = "Mortal Dawn",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Crystal",
		Cost = { Neutral = 0 },
		EffectVariable = 0,
		Fading = true,
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "All fighters lose zombified and fading.\nDestroy all choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RemovePassive", "Fading" },
						{ "RemovePassive", "Zombified" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "All"
				}
			}
		},
		Bio = "\"The architects of the Necrosyndicate Crisis were deeply regretful that 200,000 zombified people died at their actions. Yet the protobabylonian horde, yet the Astral Faith's schemes, yet that monstrous remnant of Sarah Greene Bailey forced their hand.\"<br/>- Herrus' Archives, MCMXCVIIIa"
	},
	["Apate, Demon Investor"] = {
		Id = 14676792607,
		Name = "Apate, Demon Investor",
		AltCards = {
			["Apate, Demon Investor-Offer"] = {
				Id = 14840645576,
				Name = "Apate, Demon Investor",
				ArtAnimation = "Apate",
				Bio = "\"What Apollo doesn't know about making a successful business is that you need to minimize ethics and maximize profits\""
			},
			["Brie & Ray, Crossed Souls"] = {
				Id = 15941929342,
				Name = "Brie & Ray, Crossed Souls",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 187,
				Bio = "\"Demons to hosts are like moths to a flame. Strong-willed in the moment, but both will eventually end up burned.\""
			},
			["AGuyWithGlasses, Caught in Act"] = {
				Id = 79150840125488,
				Name = "AGuyWithGlasses, Caught in Act",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 583,
				Bio = "\"WHAT ARE YOU DOING UP THERE?\"<br/>\"Question is, why aren't you up here?\"<br/>{THIS IS PART OF A SET, PLAY ALL THREE PARTS AGAINST KILLJQUE IN A MATCH AT ONCE FOR A PRIZE!}"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "SoulDrain",
		EffectAnimation = "RobuxStackEffect",
		Color = "Blue",
		Rank = 5,
		Cost = { Blue = 4, Yellow = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		EffectVariable = 1,
		SummonAnimation = "ApateSummon",
		SummonedAnimation = "ApateSummon",
		SummonAnimationEffect = true,
		Effect = {
			Description = "Twice each turn, whenever you cast a fighter: Seance a card in your graveyard that costs 6 or fewer total studs. All allied fighters gain 50 Power.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"MoveZone",
							{ "6OrLower", "GraveZone_Ally", "Field_Ally", true, false },
							"Self",
							nil,
							nil,
							nil,
							"Seance"
						},
						{ "Strengthen", 50 },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Ally",
					MetaData = {
						Health = 100,
						Power = 100,
						Unlock = 999,
						Zombified = true,
						Terrified = true
					},
					TurnTriggerLimit = 2
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					Target = "Ally",
					NoBlip = true
				}
			},
			Seancing = true
		},
		Bio = "\"Bloxburg is now host to a zombie apocalypse? Hmmm. How will this affect their stock exchange?\""
	},
	["LeBlanc, Dread Priest"] = {
		Id = 14632208943,
		Name = "LeBlanc, Dread Priest",
		AltCards = {
			["LeBlanc, Dread Priest-Offer"] = {
				Name = "Franz von Leblanc",
				Id = 93631273668642,
				AttackEffect = "SoulDrain",
				ArtAnimation = "FranzVonLeblanc"
			},
			["dosei2020, Clergyman of Ruinations"] = {
				Id = 15941935289,
				Name = "dosei2020, Clergyman of Ruinations",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 185,
				Bio = "\"YOU WANNA DIE? RELIGIOUSLY?\""
			},
			["LeBlanc, Dread Priest-E"] = {
				Name = "Warren, Meadow Mage",
				Id = 17251035003,
				Bio = "Mentor of BonBon, old friend of Lapin."
			},
			GlitchedGreek = {
				Id = 18199518640,
				Name = "GlitchedGreek",
				AltArt = true,
				PremiumArt = 274,
				Bio = "A good man in a cruel world."
			}
		},
		Health = 1200,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "SoulDrain",
		Color = "Blue",
		Rank = 5,
		Cost = { Blue = 4, Red = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		CustomReminderInject = true,
		SummonAnimation = "DreadPriest",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Description = "Whenever you cast an action: Deal 150 damage to a target enemy fighter. If that card dies this way, you inject it.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndex", "SelectedCard" },
							"SingleEnemy"
						},
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Damage", 150, "SingleEnemy" },
						{
							"AlterEV",
							{ "Add", "EnemyPlayertable", "DeathStorm", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{ "EVGreaterValueCheck", 0 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Target", "CardIndex", "SelectedCard" },
							"Self"
						},
						{ "Add", "Variable" }
					},
					Target = "Ally",
					MetaData = {
						Health = 500,
						Power = 300,
						Cost = { Neutral = 2 },
						Zombified = true
					}
				}
			},
			Injecting = true
		},
		Bio = "\"You should've known people wouldn't listen to your 'contingency,' Asta. After all, you spent years ignoring mine.\""
	},
	["Nina Hellensoft"] = {
		Id = 14632251550,
		Name = "Nina Hellensoft",
		AltCards = {
			["Nina Hellensoft-Offer"] = {
				Id = 14918193260,
				Name = "Nina Hellensoft & Caitlin",
				AttackEffect = "Jab",
				ArtAnimation = "nina"
			},
			["Lilac Kaira"] = {
				Id = 15804643285,
				Name = "Lilac Kaira",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 184,
				Bio = "In desperation, one will do anything to save their love. Even if it leads others to their potential deaths."
			},
			["Nina Hellensoft-AN"] = {
				Id = 18787815395,
				Name = "Dusek, Mine Operator",
				AttackEffect = "MagicBlue",
				Bio = "The pumpkin waddled out of the mine, turning to Al-Assad and spouted “To me: Tea is just a simple waste of time. it's flavor goes away and coffee is much easier to obtain…but to my friend above, it means the world to him and I want to make sure that he is able to be happy drinking tea.\""
			},
			["Lara Head Archaeologist"] = {
				Id = 87840862951762,
				Name = "Lara, Head Archeologist",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 579,
				Bio = "The most Passionate Researcher for the Arkhive"
			},
			["Swordmaster of the Netherworld"] = {
				Name = "Swordmaster of the Netherworld",
				Commissioner = { "" },
				Id = 130007492488250,
				AltArt = true,
				SummonAnimation = "XhartyrSummon",
				AttackEffect = "VolipaKatana",
				PremiumArt = 878,
				Bio = "\"The things that cannot be cut by my sword, forged by youkai... are next to none!\""
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Battleaxe",
		Color = "Green",
		Rank = 5,
		Cost = { Blue = 4, Green = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		SummonAnimation = "NinaSummon",
		SummonedAnimation = "NinaSummon",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://14829548718", "rbxassetid://14829548718" },
		Effect = {
			Description = "During your end step: Recur the top card of your graveyard.\nIf it was Blue, draw a card.\nOtherwise you gain 1000 life.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" },
							"CustomTarget"
						},
						{
							"MoveZone",
							{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", false, false },
							"CustomTarget"
						},
						{ "EVExactValueCheck", 3 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = "BottomCard"
					}
				},
				OnEVCheckPass = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "Cost", -1000 } },
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "\"Dealing with the deaths of the past is an archaeological gig.<br/>Dealing with the death of a friend is harder.\""
	},
	["Eric Newman"] = {
		Id = 14632241464,
		Name = "Eric Newman",
		AltCards = {
			["studderies & Sentrum, Fudo Myou"] = {
				Id = 14728434198,
				Name = "studderies & Sentrum, Fudo Myou",
				AltArt = true,
				PremiumArt = 121,
				AttackEffect = "Firebrand",
				Bio = "<i><font color=\"#7CFC00\">\"So it seems like they call upon us for containing this manifestation?\"</font></i>\n<i><font color=\"#C70039\">\"It seems so. My Kusanagi will cleave through them like butter.\"</font></i>"
			},
			["Eric Newman-Offer"] = {
				Id = 97736176312114,
				ArtAnimation = "EricNewNewman",
				Name = "Eric Newman",
				Bio = "It's not over 'til the fat lady sings."
			},
			RedSpy = {
				Id = 16206874882,
				Name = "RedSpy",
				AltArt = true,
				PremiumArt = 210,
				AttackEffect = "Firebrand",
				Bio = "\"I was not involved with the disappearance of Lordpenguin on April 1, 2004.\" - RedSpy"
			},
			["Eric Newman-Sun"] = {
				Id = 17760525760,
				Name = "Ex-Captain Oldman",
				Bio = "\"THANKS FER GETTIN' ME OUTTA THAT LOCKER, KID! NOW, LET'S SHOW 'EM WHAT A REAL NEWMAN CAN DO!\""
			},
			["Grillin' Eric"] = {
				Id = 128472405785370,
				Name = "Grillin' Eric",
				PremiumArt = 373,
				AltArt = true,
				Bio = "Liberating patties from their rawness."
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Rifle",
		Color = "Red",
		Rank = 5,
		Cost = { Green = 4, Red = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Liberate = true,
		Gladiator = true,
		Effect = {
			Description = "Whenever this card attacks and destroys another: Remove the stud cost of all cards in your hand with liberate.",
			Ability = {
				OnAttackDestroy = {
					Power = {
						{
							"IncreaseCost",
							{ -100, "Neutral", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Red", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Green", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Blue", "Nil" },
							"CustomTarget"
						},
						{
							"IncreaseCost",
							{ -100, "Yellow", "Nil" },
							"CustomTarget"
						},
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "HasPassive",
						Modifier = "Liberate"
					}
				}
			}
		},
		Bio = "\"Immortality destroyed my home. It won't destroy my daughter's.\""
	},
	["Grey, Mending the Lost"] = {
		Id = 14632244096,
		Name = "Grey, Mending the Lost",
		AltCards = {
			["Grey, Mending the Lost-Offer"] = {
				Id = 14916592885,
				Name = "Dr.Grey, Messiah Hospital's Director",
				AttackEffect = "Slash",
				ArtAnimation = "DrGrey",
				Bio = "She rode out into the night, the longest one in her life, to keep a promise made years ago."
			},
			["Grey, Mending the Lost-Hal"] = {
				Id = 14981809398,
				Name = "Linda, the Temperamental Witch",
				AttackEffect = "MagicGreen",
				EffectAnimation = "RootCause",
				Summonant = "Lucid Catgirl-Hal",
				Bio = "Dear sister, aren't you tired?\nOf rhymes and riddles, spite and ire?\nI simply wish to travel with sibling in hand,\nWhy must you start a battle that'll never end?"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Rank = 5,
		Cost = { Green = 4, Yellow = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		EffectVariable = 1,
		Summonant = "Lucid Catgirl",
		CustomReminderBliss = true,
		["Lucid Catgirl"] = "A free 100/200 zombified token fighter, inert in all zones. It has overload.",
		Effect = {
			Description = "After this card attacks: Summon 2 100/200 Lucid Catgirls, then deal 500 damage to a target allied fighter.\nThen all allied fighters gain 100 Power, and an additional 400 if you're in Bliss.",
			Ability = {
				OnAttackEnd = {
					Power = {
						{ "Summon", "Summonant", "Ally" },
						{ "Summon", "Summonant", "Ally" },
						{ "Damage", 500, "SingleAlly" },
						{ "EVGreaterValueCheck", 0 },
						{ "Strengthen", 100, "Ally" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 0, nil, nil, nil, "BlissTriggerOrange" },
						{ "Strengthen", 400 }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 30, 69, "Bliss" }
				}
			}
		},
		Bio = "Bloxburg Messiah Hospital was going to lose a doctor. There was nothing she could do about it."
	},
	["Lucid Catgirl"] = {
		Id = 14632249681,
		Name = "Lucid Catgirl",
		AltCards = {
			["Lucid Catgirl-Hal"] = {
				Id = 14981832593,
				Name = "Westward Bird",
				Bio = "P.S. I've included a few samples of healing herbs, in case your battles end in an unfortunate manner.\n\nYour Sister, Linda"
			}
		},
		Health = 100,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		TokenOmni = true,
		Zombified = true,
		Overload = true,
		Logo = "Plurral",
		SearchTerms = "PLURRAL",
		Cost = { Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "",
			Ability = {
				Nil = {
					Power = {
						{ "Heal", 150, "Aggressor" },
						{ "Strengthen", 150, "Aggressor" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "...But she could slowly undo Sarah's malpractice."
	},
	["Captain Skewerglee"] = {
		Id = 76822736302744,
		Name = "Captain Skewerglee",
		AltCards = {
			["Captain Skewerglee-Offer"] = {
				Id = 76822736302744,
				Name = "Captain Skewerglee",
				Bio = "I'm not gonna sugarcoat it."
			},
			["Sm1ley n00b"] = {
				Id = 15941937497,
				Name = "Sm1ley n00b",
				AttackEffect = "Punch",
				AltArt = true,
				Bio = "b0nkY tIMe!"
			},
			["Captain Skewerglee-V"] = {
				Id = 16294483290,
				Name = "Genuinely Good Guy",
				AttackEffect = "Punch",
				Bio = "I thought they went extinct 100 years ago!"
			},
			["Milk & Cheezyz, Dairy Delights"] = {
				Id = 18915001076,
				Name = "Milk & Cheezyz, Dairy Delights",
				AltArt = true,
				PremiumArt = 289,
				Bio = "The little aspects of anindividual can be ignored when death comes knocking for the both of you."
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "British",
		Color = "Yellow",
		Rank = 5,
		Cost = { Red = 4, Yellow = 4 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		EffectVariable = 0,
		RansackCount = 0,
		Gladiator = true,
		CustomReminderRansack = true,
		SummonAnimation = "SkewergleeSummon",
		SummonedAnimation = "SkewergleeSummon",
		SummonAnimationEffect = true,
		PreloadAssets = { "rbxassetid://14829550452" },
		Effect = {
			Description = "Whenever you cast a fighter: Ransack 3.\nIf you do, search your deck for a Red or Yellow fighter card. You lose 200 life.",
			Ability = {
				OnAllySummon = {
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
					Power = {
						{ "RandomTutorfor", "RedorYellow Fighter" },
						{ "Cost", 200 },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The last Skewerglee scoffed at Kingrin helping outsiders. Her own family died to get away from him. Her own family died for naught."
	},
	["The ChairmanNS"] = {
		Id = 14905814607,
		Name = "The Chairman",
		AltCards = {
			["The ChairmanNS-Offer"] = {
				Id = 14973233877,
				Name = "Lady in Hands",
				AttackEffect = "SoulSyphon",
				PackDisplayOverride = "Hallow's Tale: Special Offer",
				Bio = "Emerging from the shadows, the lady's form is obscured by a nightmarish cloak of countless writhing hands, their ghostly, ethereal presence unsettling to the core."
			},
			["Tone and Histor, Vivacious Vendors"] = {
				Id = 15121299579,
				Name = "Tone and Histor, Vivacious Vendors",
				AttackEffect = "SoulSyphon",
				AltArt = true,
				Commissioner = { 18546955, 144551861 },
				PremiumArt = 146,
				Bio = "You might win an extra item! "
			},
			Ennard3684 = {
				Id = 15252288804,
				Name = "Ennard3684",
				AttackEffect = "Jab",
				AltArt = true,
				Commissioner = { 1182811635 },
				PremiumArt = 154,
				Bio = "Its for you."
			},
			Reaper122003 = {
				Id = 107401020969189,
				Name = "Reaper122003",
				AttackEffect = "SoulSyphon",
				AltArt = true,
				PremiumArt = 291,
				Bio = "Every loss could be your grave."
			},
			["The ChairmanNS-AWIH"] = {
				Id = 17540223605,
				Name = "Mr. Goodknight",
				Bio = "News reporting is nice. Lets you meet all kinds of people (AND FOOD!)",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["The ChairmanNS-AN"] = {
				Id = 18199520224,
				AttackEffect = "Rifle",
				Name = "The Chairman",
				Bio = "He didn't pwn himself. I did."
			},
			Bsmile = {
				Id = 78143670488030,
				Name = "Bsmile",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 299,
				Bio = "I DONT KNOW HOW BUT THEY FOUND ME<br/>\tWe invite you to follow along.<br/>And, as always, when you hear this sound,<br/>Turn the page.<br/>Now, let's begin."
			}
		},
		Health = 850,
		Power = 850,
		Rarity = "Epic",
		AttackEffect = "VampBite",
		Color = "Neutral",
		Rank = 5,
		Cost = { Neutral = 6 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		SummonAnimation = "ChairmanSummon",
		SummonedAnimation = "ChairmanSummon",
		Gladiator = true,
		EffectVariable = "Lesser Treasure",
		Effect = {
			Description = "At the start of your turns: Give yourself a Lesser Treasure card.",
			Ability = {
				OnAllyStart = {
					Power = {
						{ "RandomAdd", "Variable", "Ally" },
						{ "RandomTutorfor", "Gladiator", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "The struggles of Bloxburg were nothing but a thrilling drama to the denizens of the Underworld."
	}
}
