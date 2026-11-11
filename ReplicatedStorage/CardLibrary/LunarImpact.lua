return {
	RageIndicator = {
		Id = 9499148636,
		Name = "Rage",
		AltCards = {
			["Self Loathing"] = {
				Name = "Self Loathing",
				Id = 17251036182,
				AttackEffect = "Flare",
				Bio = "Every Strand of Despair<br/>Leads to the same answer<br/>At the end of every path, you will mutter to yourself."
			},
			GreedRage = {
				Name = "Greed",
				Id = 17771966317,
				AttackEffect = "Flare",
				Bio = "ueled by selfishness. It looms within us all."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Archetype = "Rage",
		TriggerInGenZone = true,
		TriggerInField = false,
		TokenOmni = true,
		Color = "Neutral",
		Cost = { Neutral = 1 },
		EffectAnimation = "ExitRage",
		Effect = {
			Name = "Knockdown",
			Description = "<i>(You've entered rage.\nWhile in rage, the first Rageborne you attack with each turn deals an additional 200 damage per Rage.\nDuring your end step, if you haven't entered rage this turn: You lose all stacks of Rage.)</i>",
			Ability = {
				OnEnd = {
					Power = { {
						"GenZoneDiscard",
						{ "Rage", 0 }
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 0, 1, "RageStacks" }
				}
			},
			GenZoneDiscardObliterate = true
		},
		Bio = "<i>Let out your true colors, the Impact beckons.</i>"
	},
	TestRageCard = {
		Id = 5679420862,
		Name = "TestRageCard",
		CopyBodge = "TestRageCard",
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: enter rage.",
			Type = "OnSummon",
			Power = { {
				"AddGenZone",
				{ "RageIndicator", 1 }
			} },
			Target = "Ally"
		},
		Bio = "Mess with him and you'll wind up in the freezer."
	},
	["Rageborne Bike"] = {
		Id = 10824351055,
		Name = "Rageborne Bike",
		AltCards = {
			["Rageborne Bike-Offer"] = {
				Id = 12326184422,
				Bio = "\t\t\t\tCarbon monoxide bonds with blood cells, making them unable to absorb oxygen.\n\n\t\t\t\tTell me, how much would you need to inhale before breathing becomes futile?\n\t\t\t\t"
			}
		},
		Health = 100,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Neutral = 3 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast or during your end step, if you're in Rage: Search your deck for 3 copies of this card, except they're inert when discarded. Then unlock this card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Tutorfor", "Rageborne Bike" },
						{ "Tutorfor", "Rageborne Bike" },
						{ "Tutorfor", "Rageborne Bike" },
						{
							"Unlock",
							9999,
							"Self",
							nil,
							nil,
							nil,
							"Bicycle"
						}
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" },
					MetaData = { TokenDiscard = true }
				},
				OnSummon = {
					Power = {
						{ "Tutorfor", "Rageborne Bike" },
						{ "Tutorfor", "Rageborne Bike" },
						{ "Tutorfor", "Rageborne Bike" },
						{
							"Unlock",
							9999,
							"Self",
							nil,
							nil,
							nil,
							"Bicycle"
						}
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" },
					MetaData = { TokenDiscard = true }
				}
			}
		},
		Bio = "Vroom vroom, here comes pain!"
	},
	["Rageborne Drill"] = {
		Id = 10824282848,
		Name = "Rageborne Drill",
		AltCards = {
			["Rageborne Drill-I"] = {
				Name = "Rageborne Drill",
				Id = 134727707516051,
				AttackEffect = "Punch",
				Bio = ""
			}
		},
		Health = 400,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Red = 4 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in Rage: You lose 250 life. Draw a card.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Cost", 250, "Self" },
						{ "Draw", 1, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "The crack that Adreti made onto the Impact had already caused a massive leak. The drills that sprung to life sought to make it even bigger."
	},
	["Rageborne Crane"] = {
		Id = 10860957264,
		Name = "Rageborne Crane",
		Health = 600,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Red = 2, Neutral = 1 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in Rage: Deal 100 damage to all enemy fighters.",
			Ability = {
				OnEnd = {
					Power = { { "Damage", 100, "Opponent" } },
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "Rising levels of eldritch esscence - Rising chances of Freedom Locking."
	},
	["Rageborne Car"] = {
		Id = 10856833385,
		Name = "Rageborne Car",
		Health = 700,
		Power = 700,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Red = 6 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Overload = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in Rage: This card gains 100 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Strengthen", 100, "Self" },
						{ "Heal", 100, "Self" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "Bactera589's favorite joke."
	},
	["Adreti, the Rageborne's Judgment"] = {
		Id = 10824154341,
		Name = "Adreti, the Rageborne's Judgement",
		AltCards = {
			["Adreti, the Rageborne's Judgment-Offer"] = {
				Id = 12326855532,
				Name = "Adreti, World Aggressor",
				AttackEffect = "LycanScratch",
				Bio = "\"Progress is motivated by anger of many forms. Anger towards fate, anger towards one's situation, anger towards others. This is no different.\""
			},
			["Adreti, the Rageborne's Judgment-I"] = {
				Id = 137583777830375,
				Name = "Adreti, Judgement of the Rageborne",
				AttackEffect = "LycanScratch",
				Bio = ""
			},
			["Souly, Chaotic Executioner"] = {
				Id = 13278757533,
				Name = "Souly, Chaotic Executioner",
				AttackEffect = "Darkheart",
				AltArt = true,
				Bio = "<i>\"As chaos roams around all. I, and I alone will be judge, jury, and the executioner. For their actions, and their sins. They shall feel the cold steel of my blade. Their souls shall know what true despair is when you hear my name.\"</i>"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Red = 4, Neutral = 2 },
		Rageborne = true,
		Effect = {
			Name = "Knockdown",
			Description = "Whenever you enter Rage: Put 2 rage stacks into your baseplate.",
			Type = "OnRageGain",
			Power = { {
				"AddGenZone",
				{ "RageIndicator", 2 }
			} },
			Target = "Ally"
		},
		Bio = "\"Do you not see the beauty of the Rageborne, Lua? Your stubborn faith is only a stepping stone in the coming of a new age.\""
	},
	["Dread Lord Bilakuten"] = {
		Id = 9499177338,
		Name = "Dread Lord Bilakuten",
		AltCards = {
			["Toonborne Bilakuten"] = {
				Id = 10861976358,
				AltArt = true,
				Name = "Toonborne Bilakuten",
				Bio = "\t\t\t\t\t\t<i>Bilakuten rycker ut!</i>\n\t\t\t\t\t\t<i>Vi är snabba, vi är starka</i>\n\t\t\t\t\t\t<i>och vi kan flyga up i luften</i> \n\t\t\t\t\t\t<i>Vi kan hjälpa, alla djuren</i>\n\t\t\t\t\t\t<i>Släcker bränder, fånger tjuven</i>\n\t\t\t\t\t\t<i>BilakuuuUUUuuuUUUten</i>\n\t\t\t\t\t\t<i>BilakuuuUUUuuuUUUten</i>\n\n\t\t\t\t\t\t<i>Vem behövs idag?</i>\n\t\t\t\t\t\t"
			}
		},
		Health = 550,
		Power = 1050,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		EffectVariable = 0,
		Cost = { Red = 5 },
		EffectAnimation = "RageborneEyeGlint",
		Addant = "RageIndicator",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "When this card dies: Give yourself a copy of each stack of rage in your Baseplate, except they're 500/500 fighters that cost {W} to cast.",
			Ability = {
				OnDeath = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Archetype", "Rage" },
							nil,
							nil,
							nil,
							"RageborneEyeGlint"
						},
						{
							"RepeatingAdd",
							{ "Addant", "Variable" },
							"Ally"
						}
					},
					Target = "Self",
					MetaData = { Health = 500, Power = 500 },
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "<i>The clouds ran red with the color of rage, the air contaminated by the Impact's esscence. The people of Javion looked towards the sky, and bore witness a frightening prescence.</i>"
	},
	Prisman = {
		Id = 4899432216,
		Name = "Prisman",
		AltCards = {
			["Prisman-AN"] = {
				Id = 13822695259,
				Name = "Sudden Death",
				AttackEffect = "Flame",
				Bio = "He certainly is."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		Effect = {
			Name = "Many a burn",
			Description = "Whenever a fighter is cast: Deal 200 damage to it.",
			Type = "OnAnySummon",
			Power = { { "Damage", 200 } },
			Target = "Aggressor"
		},
		Bio = "A few stabs everywhere leads to a lot of bloodloss."
	},
	Den_S = {
		Id = 2817088154,
		Name = "Den_S",
		AltCards = {
			["Den_S-AN"] = {
				Id = 14387335023,
				Name = "Hydrochloric Acid Cannon",
				AttackEffect = "Whirlpool",
				Bio = "Cleaning products don't kill if they aren't inside your enemies. A more effective chemical for inhumane warfare tactics is low pH substances like Hydrochloric Acid!"
			},
			["Den_S-Sun"] = {
				Id = 17346075076,
				Name = "Malevolent Kitchen",
				AttackEffect = "Slash",
				Bio = "Malevolent Kitchen allows KUSUNA to air-fry anything within a radius of 200 meters. It is truly the best cooking technique."
			}
		},
		Health = 150,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1 },
		AssignHalfsies = true,
		SummonAnimation = "SummonSlide",
		Charge = true,
		CounterAttackBlock = true,
		Effect = {
			Name = "Roller Coaster",
			Description = "During combat, this card assigns damage to other fighters equal to half of that fighter's health.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Creator of Theme Park Tycoon 2, but where is Theme Park Tycoon 1?"
	},
	["Hermeien Sandalwood"] = {
		Id = 10824252094,
		Name = "Hermeien Sandalwood",
		AltCards = {
			["Hermeien Sandalwood-Banner"] = {
				Id = 10853372506,
				Name = "Harbinger Abaddon",
				AttackEffect = "LycanScratch",
				Bio = "He who oppresses, becomes the oppressed."
			}
		},
		Health = 1500,
		Power = 2000,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Archetype = "Rageborne",
		EffectVariable = 0,
		Cost = { Green = 12, Neutral = 4 },
		EffectAnimation = "RageborneEyeGlint",
		DamageImmune = true,
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "Whenever you enter Rage, or this card is cast while raging: Deal 4000 damage to all fighters.",
			Ability = {
				OnRageGain = {
					Power = { { "Damage", 4000, "All" } },
					Target = "Self"
				},
				OnSummon = {
					Power = { { "Damage", 4000, "All" } },
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "<i> Voices of spirits deafened,\nthe souls of many engulfed.\nAn anguish held within,\na purpose still kept in.</i>"
	},
	["Gilfred Swordfrost"] = {
		Id = 10824131056,
		Name = "Gilfred Swordfrost",
		AltCards = {
			GALLlFREY = {
				Id = 12504739336,
				Name = "gallifrey",
				Commissioner = { 21564633 },
				AltArt = true,
				Bio = "<font color=\"#FF0000\">\"im raginnnngg ughhh rage uhhhggg ra😡😡😡\"</font>"
			},
			["Gilfred Swordfrost-Collector"] = { Id = 131430216677840, Name = "Gilfred Swordfrost", Bio = "" }
		},
		Health = 1100,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Archetype = "Rageborne",
		EffectVariable = 0,
		Cost = { Neutral = 6 },
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step: This card generates for each stack of rage you have in your baseplate.\nWhenever this card attacks: You lose all of your {W}. This card gains 100 Power for each stud removed this way.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Archetype", "Rage" },
							nil,
							nil,
							nil,
							"RageborneEyeGlint"
						},
						{ "Generate", "Variable" }
					},
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
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "<i>\tThe Autocracy fell against the Eater,\nengulfed in an eternal winter.\nDecades of freedom long gone,\nprisoners' shackles now undone.</i>"
	},
	["Rageborne Greenery"] = {
		Id = 10823780753,
		Name = "Rageborne Greenery",
		Health = 450,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Archetype = "Rageborne",
		Cost = { Green = 3, Neutral = 1 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in rage: This card gains 200 Health.",
			Ability = {
				OnEnd = {
					Power = { { "Heal", 200, "Self" } },
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "A gardener's worst nightmare."
	},
	["Rageborne Congregation"] = {
		Id = 17791499287,
		Name = "Rageborne Congregation",
		Health = 1000,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Rageborne",
		Cost = { Green = 8 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "After this card attacks, if you're in rage: A target enemy fighter loses 500 power.",
			Ability = {
				OnAttackEnd = {
					Power = { { "Weaken", 500 } },
					Target = "SingleEnemy",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "Some people are plagued by several facets of frustration in their life. This factor does not go unnoticed."
	},
	["Rageborne Vines"] = {
		Id = 10823652185,
		Name = "Rageborne Vines",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Rageborne",
		TriggerInGraveZone = true,
		Cost = { Green = 5, Neutral = 1 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in rage and this card is in your graveyard: Recur it.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Rageborne Vines", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "Strangle."
	},
	["Rageborne Cement Mixer"] = {
		Id = 10824080099,
		Name = "Rageborne Cement Mixer",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Rageborne",
		Cost = { Green = 2, Red = 2, Neutral = 2 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "Whenever this attacks, if you're in rage: All allied fighters gain 100 Power, then swap their stats.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Strengthen", 100 },
						{ "Swap", 30 }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "I can make you stuck, I can make you cough, I can make you mildly displeased. There's no winning against cement."
	},
	["Rageborne Pulverizer"] = {
		Id = 10824042572,
		Name = "Rageborne Pulveriser",
		SearchTerms = "Rageborne Pulverizer",
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Archetype = "Rageborne",
		Cost = { Red = 4, Neutral = 1 },
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "If you're in rage, this card can't be countered.",
			Ability = {
				OnAttack = {
					Power = { {
						"GivePassive",
						"CounterAttackBlock",
						nil,
						nil,
						nil,
						"RageborneEyeGlint"
					} },
					Target = "Self",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				},
				OnAttackEnd = {
					Power = { { "RemovePassive", "CounterAttackBlock" } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Here comes the Pain Train!"
	},
	["Rageborne Tourist"] = {
		Id = 10834087774,
		Name = "Rageborne Tourist",
		AltCards = {
			["Oliver, Apostate of Hate"] = {
				Name = "Oliver, Apostate of Hate",
				Id = 10903863571,
				AttackEffect = "LycanScratch",
				AltArt = true,
				Bio = "\"May your woes be many, and your GUMMIES few.\""
			},
			["Rageborne Tourist-Sun"] = {
				Name = "Dock, Pier's Number One Fan",
				Id = 13660849083,
				AttackEffect = "Punch",
				Bio = "You are NOT gonna believe which legendary super bouncer I met today!"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Rageborne",
		Cost = { Neutral = 4 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Addant = "Rubber Duck",
		CustomReminder = { ["Rubber Duck"] = "A useless fighter, fit only for discarding." },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Give yourself a Rubber Duck.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"WHAT DO YOU MEAN THAT YOU'RE OUT OF PIER ACTION FIGURES?! YOU THINK A DUCK IS ENOUGH COMPENSATION?!\""
	},
	["Rageborne Patron"] = {
		Id = 10860936104,
		Name = "Rageborne Patron",
		AltCards = {
			["The Rageborne Captain"] = {
				Id = 91587628393518,
				Name = "The Rageborne Captain",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 500,
				Bio = "The Rise of the Ragebornes has only just begun... Better watch your back. You will be next."
			}
		},
		Health = 550,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Rageborne",
		Cost = { Neutral = 1, Red = 1, Green = 1, Yellow = 1 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in rage: Search your deck for a non-Yellow Rageborne card.",
			Ability = {
				OnEnd = {
					Power = { { "RandomTutorfor", "YelloworNotClr Rageborne" } },
					Target = "Self",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "One glass of moon essence, please."
	},
	["Rageborne Bandit"] = {
		Id = 10834097859,
		Name = "Rageborne Bandit",
		AltCards = {
			["Rageborne Bandit-Offer"] = {
				Id = 12327004279,
				AttackEffect = "Slash",
				Bio = "I break the glass ceiling so that I may stab you with its scattered shards."
			}
		},
		Health = 900,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Rageborne",
		Cost = { Neutral = 1, Yellow = 4 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Recur an enemy card.\nWhenever this card attacks, if you're in rage: Recur an enemy card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Hand_Ally", true, false },
							"Self"
						},
						{ "RevealCard", 30, "AlliedAddedCard" }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = {
						{
							"MoveZone",
							{ "Any", "GraveZone_Opponent", "Hand_Ally", true, false },
							"Self"
						},
						{ "RevealCard", 30, "AlliedAddedCard" }
					},
					Target = "Self",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			},
			MovezoneAsRecur = true
		},
		Bio = "Bandit to bandthem, you'll be surprised how bandthey they bandit."
	},
	["Rageborne Vending Machine"] = {
		Id = 10824120271,
		Name = "Rageborne Vending Machine",
		AltCards = {
			["Rageborne Horse"] = {
				Id = 14905814253,
				Name = "Rageborne Horse",
				AltArt = true,
				PremiumArt = 118,
				Summonant = "My Honest Reaction",
				Bio = "I'm not gonna sugarcoat it."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Rageborne",
		Cost = { Yellow = 7 },
		Rageborne = true,
		Summonant = "Tourist",
		EffectAnimation = "RageborneEyeGlint",
		Effect = {
			Name = "Stud",
			Description = "Whenever you enter rage, or this card is cast while raging: Summon a 100/100 Tourist that's inert in play. All allied fighters gain 100 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				},
				OnRageGain = {
					Power = {
						{ "Summon", "Summonant" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Coffee or soda? Wrong, it's hydrofluoric acid."
	},
	Emceptional = {
		Id = 10886149704,
		Name = "Emceptional",
		AltCards = {
			["the newspaper man"] = {
				Id = 84246927345788,
				Name = "the newspaper man",
				AltArt = true,
				PremiumArt = 158,
				AttackEffect = "Recyclables",
				Bio = "Imagine having your entire existence hinge on a gradually forgotten method of news spreading.\n\nIt'd suck, yeah"
			},
			Emotionscape = {
				Id = 15941935166,
				Name = "Emotionscape",
				AttackEffect = "Punch",
				AltArt = true,
				Bio = "This card is an alternate art of Emceptional."
			}
		},
		Health = 1100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever an effect gives you a card, If the newest card in your hand is a fighter: It gains 200 health and power.",
			Type = "OnAllyPut",
			Power = {
				{ "HealTargetInHand", 200, "AlliedRightMostHand" },
				{ "StrengthenTargetInHand", 200, "AlliedRightMostHand" }
			},
			Target = "All"
		},
		Bio = "Finding a Chomik is easy. Breaching the United States Pentagon Federal Mainframe for a unique 12-number code is the hard part."
	},
	Coinflipper = {
		Id = 94927250828699,
		Name = "Fortune Teller",
		AltCards = {
			["Decisive Note"] = {
				Name = "Decisive Note",
				Id = 12128587881,
				AttackEffect = "DoomStorm",
				AltArt = true,
				Bio = "The Laughing Eye I thought I saw, but only now it shows its maw."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 3 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Your opponent guesses if you have a nonfighter card in hand. Draw 2 cards and reveal them. They're fleeting if your opponent guessed right.",
			Ability = {
				OnSummon = {
					Power = { {
						"ConfirmPrompt",
						{ "your guess: Does your opponent have a nonfighter card in hand?" },
						"Ally"
					} },
					Target = "Self"
				},
				OnConfirm = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "NotFighter", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{ "EVExactValueCheck", 1, "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnDeny = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "NotFighter", "Nil" }
						},
						{
							"AlterEV",
							{ "OverGate", "Math", 1, "Nil" }
						},
						{ "EVExactValueCheck", 1, "Self" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "GivePassive", "Fleeting", "DrawnCard" },
						{ "RevealCard", 30, "DrawnCard" },
						{ "Draw", 1, "Ally" },
						{ "GivePassive", "Fleeting", "DrawnCard" },
						{ "RevealCard", 30, "DrawnCard" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "RevealCard", 30, "DrawnCard" },
						{ "Draw", 1, "Ally" },
						{ "RevealCard", 30, "DrawnCard" }
					},
					Target = "Self",
					NoBlip = true
				}
			},
			OpponentTarget = true
		},
		Bio = "What if your fate was sealed by a crystal ball?"
	},
	GuessTokenA = {
		Id = 90745373721056,
		AltCards = {
			["GuessTokenA-Cat"] = {
				Name = "The Cat",
				Id = 12128588810,
				Bio = "NOTHING GOOD RHYMES WITH HEADS"
			}
		},
		Name = "Good Fortune",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Guess",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		EffectVariable = 0,
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "If your opponent has no actions in their hand, draw 2 cards.\nDestroy all Guesses in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Opponent", "NotFighter", "Nil" }
						},
						{
							"AlterEV",
							{ "OverGate", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
						},
						{ "Draw", "Variable", "Ally" },
						{ "ArchetypeDiscard", 999, "Ally", "Guess" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Without a doubt, the next two months will be the most fortunate period of your entire life."
	},
	GuessTokenB = {
		Id = 123997966775644,
		Name = "Bad Fortune",
		AltCards = {
			["GuessTokenB-Deer"] = {
				Name = "The Deer",
				Id = 12128588344,
				Bio = "TAILS NEVER FAILS TAILS NEVER FAILS TAILS NEVER FAILS"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Guess",
		Color = "Yellow",
		Cost = { Yellow = 0 },
		EffectVariable = 0,
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "If your opponent has an action in their hand, draw 2 cards.\nDestroy all Guesses in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Opponent", "Action", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
						},
						{ "Draw", "Variable", "Ally" },
						{ "ArchetypeDiscard", 999, "Ally", "Guess" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "You're not gonna like this one. Unfortunately, no refunds."
	},
	["Tix Stack"] = {
		Id = 9499152420,
		Name = "Tix Stack",
		AltCards = {
			Medallion = {
				Id = 17771966121,
				Name = "Medallion",
				Bio = "Nothing screams KILL ME quicker than grabbing one of these..."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenOmni = true,
		Archetype = "Money",
		Cost = { Neutral = 1 },
		EffectAnimation = "TixStack",
		Effect = {
			Name = "Target",
			Description = "A target fighter gains 50 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 50 } },
			Target = "Single"
		},
		Bio = "Javion's alternative form of currency. Just hope it doesn't become defunct."
	},
	["Card Counter"] = {
		Id = 131875635952751,
		Name = "Glum Greeter",
		AltCards = {
			["Res & Ayv, in The Middle"] = {
				Id = 12980371783,
				Name = "Res & Ayv, in The Middle",
				AltArt = true,
				PremiumArt = 74,
				AttackEffect = "Divinity",
				Transformant = "Res & Ayv, in The Middle",
				Commissioner = { 70996028, 14640960 },
				Bio = "Times have changed, but he hasn't. Avymag would be sad. This wouldn't be a story worthy of the archive. By the way, you read his bio again. Minus 5 seconds of your life."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Capital $ity",
		Cost = { Yellow = 2, Green = 2 },
		CustomReminderMoney = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a Capital $ity fighter: Give yourself a Money stack card.",
			Ability = {
				OnAllySummon = {
					Power = { {
						"RandomAdd",
						{ "Tix Stack", "Targeting Blip" }
					} },
					Target = "Ally",
					Archetype = "Capital $ity"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "\"Welcome to Capital $ity. Where you can spend like the Bigg man himself.\""
	},
	["Casino Dealer"] = {
		Id = 116466306109722,
		Name = "Overworked Operator",
		Health = 350,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Money Stack cards.\nWhenever you cast a Robux stack: Allied Capital $ity fighters gain 50 health.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Heal", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Targeting Blip"
				},
				OnAllySummon = {
					Power = { { "Heal", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Targeting Blip"
				}
			}
		},
		Bio = "He's been sitting there dealing with all of the Karens and Kevins for hours... YET HE STILL KEEPS THE RIDES MOVING!!"
	},
	["The Oddsman, Spirit of Money"] = {
		Id = 131496541540324,
		Name = "Mister Magicant, Wealth Wizard",
		AltCards = {
			["The Oddsman, Spirit of Money-Offer"] = {
				Id = 97594359574633,
				Name = "Mister Magicant",
				AttackEffect = "Jab",
				Bio = ""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Capital $ity",
		Addant = "Moonleak",
		Cost = { Yellow = 4 },
		CustomReminderMoney = true,
		EffectVariable = 1,
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, when this card is cast or whenever you cast a Robux Stack, if there are 8 or more Money Stack cards in your graveyard: Give yourself 2 Money Stack cards, except they're 200/200 fighters.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
						},
						{
							"RepeatingRandomAdd",
							{
								{ "Tix Stack", "Targeting Blip" },
								"Variable"
							},
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					EffectRequirement = { "Archetype", "AllyGraveZone", 8, 9999, "Money" },
					Target = "Self",
					MetaData = { Health = 200, Power = 200 }
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
						},
						{
							"RepeatingRandomAdd",
							{
								{ "Tix Stack", "Targeting Blip" },
								"Variable"
							},
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					EffectRequirement = { "Archetype", "AllyGraveZone", 8, 9999, "Money" },
					Target = "Self",
					LibraryIndex = "Targeting Blip",
					MetaData = { Health = 200, Power = 200 }
				},
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
						},
						{
							"RepeatingRandomAdd",
							{
								{ "Tix Stack", "Targeting Blip" },
								"Variable"
							},
							"Ally"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					EffectRequirement = { "Archetype", "AllyGraveZone", 8, 9999, "Money" },
					Target = "Self",
					LibraryIndex = "Targeting Blip",
					MetaData = { Health = 200, Power = 200 }
				},
				OnStart = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "Mascot of Capital $ity and role model for kids around the Vecross system with dreams of becoming filthy rich. Some think he's more than just a character, though..."
	},
	["Casino Supervisor"] = {
		Id = 108417272788086,
		Name = "Sadistic Supervisor",
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Capital $ity",
		Cost = { Neutral = 2, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast your third or fourth card each turn: Give yourself a common or uncommon Capital $ity fighter card.",
			Ability = {
				OnAllySummon = {
					Power = { {
						"RandomAdd",
						{
							"Casino Dealer",
							"Debt Counter",
							"Tix Fanatic",
							"Biggs' Bigg Fountain",
							"Card Counter"
						}
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 5, "Storm" }
				},
				OnAllyCast = {
					Power = { {
						"RandomAdd",
						{
							"Casino Dealer",
							"Debt Counter",
							"Tix Fanatic",
							"Biggs' Bigg Fountain",
							"Card Counter"
						}
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 5, "Storm" }
				}
			}
		},
		Bio = "\"Unpaid overtime continues until morale improves.\""
	},
	["Debt Counter"] = {
		Id = 84015689105772,
		Name = "Resident Rockstar",
		AltCards = {
			Jeremy985 = {
				Name = "Jeremy985",
				AttackEffect = "Scratch",
				Id = 10903861653,
				Bio = "no chat i will NOT hit the yoinky sploinky"
			},
			["Debt Counter-Banner"] = {
				Name = "Candy Collector",
				AttackEffect = "Gun",
				Id = 11140906608,
				Bio = "Time to pay up the candy tax, buddy.\n\nWhat? You think a candy tax is 'overreaching' and 'immoral exploitation of a holiday that should be free from any overarching economic laws'? Do I look like a philosopher to you? Give up the damn sweets already before my buddy here decides to put some iron right between your eyes!"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Capital $ity",
		SkipOnImmune = true,
		EffectVariable = 0,
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: It gains 50 health and power for every token card in your graveyard.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Token", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" }
						},
						{ "Strengthen", "Variable", "Self" },
						{ "Heal", "Variable", "Self" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Woah, they do nightly concerts? Let's see who they've got playing!\\nHmm... some random band called the Ga Ga Dolls is tonight. Never heard of 'em.\\nActually, wait, they're booked for every night..."
	},
	["Tix Fanatic"] = {
		Id = 10823719815,
		Name = "Tix Fanatic",
		Health = 400,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		EffectVariable = 0,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Money Stack cards.\nWhenever you cast a Tix stack: All allied Capital $ity fighters gain 50 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Strengthen", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Tix Stack"
				},
				OnAllySummon = {
					Power = { { "Strengthen", 50 } },
					Target = "AlliedArchetype",
					LibraryIndex = "Tix Stack"
				}
			}
		},
		Bio = "\"I just LOVE Tix! They just look so nice... I hope Tix lasts forever!\""
	},
	["Bigg Spender"] = {
		Id = 136276522230362,
		Name = "Friend of the Month",
		Health = 700,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		SkipOnImmune = true,
		EffectVariable = 0,
		Cost = { Yellow = 3, Neutral = 2, Green = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 3 Money Stack cards.\nWhenever you cast a Tix Stack: Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					LibraryIndex = "Tix Stack"
				},
				OnAllySummon = {
					Power = { { "Draw", 1 } },
					Target = "Ally",
					LibraryIndex = "Tix Stack"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "Here at Captial $ity, we prefer to call our valued crew members what they really are - friends! For his hard work and dedication at reporting unapproved bathroom breaks, our friend Chris is being rewarded with one (1) minute of meet-and-greet with Biggs himself!"
	},
	["Biggs, Fiscal Predator"] = {
		Id = 10856536825,
		Name = "Biggs, Fiscal Predator",
		AltCards = {
			DontQuestionMyName22 = {
				Id = 11255326039,
				AltArt = true,
				Name = "DontQuestionMyName22",
				AttackEffect = "Divinity",
				Bio = "Do not question his name or where he found his handhacks."
			},
			["Pier-Offer"] = {
				Id = 12863099002,
				Name = "Pier",
				AttackEffect = "Jab",
				Bio = "\"Hey, the name's Pier™©®, summon me in your fight, I wanna fight them.\""
			},
			["Biggs, Fiscal Preditor-Collectors"] = {
				Id = 110968722303875,
				Name = "Biggs, Enterpriser",
				AttackEffect = "Jab",
				Bio = "People like to ask me \"Have you reached a point where you don’t work for money.” And I tell them \"No obviously get your paper up LOSER!\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Capital $ity",
		CustomReminderMoney = true,
		EffectVariable = 0,
		Cost = { Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Money Stack cards.\nWhenever you cast a Tix Stack, if there are 8 or more Money Stack cards in your Graveyard: This card gains 200 power, then deals damage equal to its power to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						},
						{
							"RandomAdd",
							{ "Tix Stack", "Targeting Blip" }
						}
					},
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{ "Damage", "Variable", "SingleEnemy" }
					},
					Target = "Self",
					LibraryIndex = "Tix Stack",
					EffectRequirement = { "Archetype", "AllyGraveZone", 8, 9999, "Money" }
				},
				OnAllySummon = {
					Power = {
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{ "Damage", "Variable", "SingleEnemy" }
					},
					Target = "Self",
					LibraryIndex = "Tix Stack",
					EffectRequirement = { "Archetype", "AllyGraveZone", 8, 9999, "Money" }
				}
			}
		},
		Bio = "\"In the Caishen, even YOU can win it BIGG like BIGGS!™©®\""
	},
	["Biggs' Bigg Fountain"] = {
		Id = 136673928075641,
		Name = "Biggs' Bigg Bronze",
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Archetype = "Capital $ity",
		Unique = true,
		Cost = { Yellow = 3, Green = 3 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Whenever you cast a token action: This card generates.",
			Ability = {
				OnAllyCast = {
					Power = { { "Generate", 1 } },
					Target = "Self",
					Rarity = "Token"
				}
			}
		},
		Bio = "A beautiful, massive marble-white display that would make any person go: 'He looks like a pretentious schmuck.'"
	},
	["Violent Creation"] = {
		Id = 10860977975,
		Name = "Violent Creation",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Destroy a target allied fighter. Select an unranked fighter card from your deck that costs fewer studs than that fighter and summon it, triggering effects as if it was cast.",
			EffectRequirement = { "Board", "Ally", 1, 9999 },
			TriggerOnSummons = true,
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
							{ "Add", "Math", -1, "Nil" },
							"Self"
						},
						{ "Destroy", 30, "SingleAlly" },
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
						Condition = { Fighter = true, CostOrLess = "Variable", Unranked = true },
						SelectionDescription = "a fighter from your deck to summon",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "The Rageborne fed on every ounce of desire, leaving none to waste. Every body was a home to keep."
	},
	["Angry Local"] = {
		Id = 9513536944,
		Name = "Angry Local",
		AltCards = {
			["Angry Local-Offer"] = {
				Id = 12326042550,
				Effect = {
					Name = "Plushie Amp",
					Description = "Whenever an allied token fighter dies: Double this card's power.",
					Type = "OnAllyDeath",
					Power = { {
						"MultiplyPower",
						2,
						nil,
						nil,
						nil,
						nil,
						"Furious"
					} },
					Target = "Self",
					Rarity = "Token"
				},
				Bio = "\"You're gonna PAY for everything you've done, BIGGS. Especially for DESTROYING MY FARMING BUSINESS!!\""
			}
		},
		Health = 550,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever an allied token fighter dies: Double this card's power.",
			Type = "OnAllyDeath",
			Power = { {
				"MultiplyPower",
				2,
				nil,
				nil,
				nil,
				nil,
				"OldLadyShout"
			} },
			Target = "Self",
			Rarity = "Token"
		},
		Bio = "\"Bigg's rampant expansion is a threat to Javion's culture, and my farming business!\""
	},
	["Exotic Specimen"] = {
		Id = 9739478575,
		Name = "Exotic Specimen",
		AltCards = {
			["Remnant Memories"] = {
				Id = 13278734838,
				Name = "Remnant Memories",
				AttackEffect = "MagicRed",
				Bio = "\t\t\t\tYour princess may be in another castle\n \t\t\t\t Cause he's tougher than iron and hotter than fire\n\t\t\t\tBut I'm still here\n\t\t\t\t Your princess may be in another castle\n\t\t\t\tLies burnt to the ground in this flaming desire\n\t\t\t\t"
			},
			["Cursed Artifact"] = {
				Id = 134297054583189,
				Name = "Cursed Artifact",
				AttackEffect = "MagicRed",
				Bio = "Dude it needs to get out of my room it smells like pure ########## ###"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "One of Javion's many examples of exotic wildlife, animal rights disregarded."
	},
	["Lunar Impact"] = {
		Id = 82912944773887,
		Name = "Lunar Impact",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Green",
		Terrain = true,
		Rank = 8,
		Terrariant = "Lunar Impact Terrarian",
		Cost = { Green = 4, Red = 2, Blue = 2 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Put an Eldritch Blessing on each card space in your hand.\nWhenever you cast a card that uses up a blessing: Your opponent loses 400 life.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "EldritchBless", "Me" } },
					Target = "Me"
				},
				OnAllySummonModified = {
					Power = { { "Inflict", 400, "Opponent" } },
					Target = "Opponent"
				}
			}
		},
		Bio = "A tectonic shockwave interrupted Javion's usual hustle-and-bustle. The people looked out, locals and tourists alike, and saw a sight like no other - Havalu's final remnant."
	},
	["Rageborne Forest"] = {
		Id = 10824115951,
		Name = "Rageborne Forest",
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Rageborne",
		Cost = { Neutral = 3, Green = 1 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "Whenever you enter rage, or this card is cast while raging: Put a Green Stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { {
						"AddGenZone",
						{ "Green Stud", 1 },
						nil,
						nil,
						nil,
						nil,
						"BaseplateGreen"
					} },
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				},
				OnRageGain = {
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
				}
			}
		},
		Bio = "If you see trees uprooting themselves and walking around, stay calm."
	},
	["Javion Tour Guide"] = {
		Id = 10856841632,
		Name = "Javion Tour Guide",
		AltCards = {
			["Javion Tour Guide-C"] = {
				Name = "Bad Mall Santa",
				Id = 15441561523,
				AttackEffect = "FirePunch",
				Bio = ""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent casts any card or discards a card, or an enemy effect targets, or an enemy fighter dies: This card gains 50 Power.",
			Target = "Ally",
			Ability = {
				OnEnemySummon = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				},
				OnEnemyTarget = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				},
				OnEnemyDiscard = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				},
				OnEnemyCast = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				},
				OnEnemyTerrainCast = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				},
				OnEnemyDeath = {
					Power = { { "Strengthen", 50 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Right here is a miniature display of Caishen, Javion's greatest theme park, right beside the Caishen Plaza, Caishen Transportation Company HQ, The Statue of Caishen, Caishen Tower, Caishen[...]\""
	},
	["Mudtide Lurker-T"] = {
		Id = 97594359574633,
		Name = "Mudtide Lurker",
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Unfortunately for them, the specimens were not too busy to add to the ensuing chaos."
	},
	["Herald of Bisapience"] = {
		Id = 9741743989,
		Name = "Herald of Bisapience",
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Green = 8 },
		Effect = {
			Name = "Knockdown",
			Description = "During your end step: All allied fighters gain 100 Health and Power for each time they've transformed.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 100, "Ally" },
						{ "Strengthen", 100, "Ally" }
					},
					Target = "Ally"
				}
			},
			EffectTransformCountScale = true
		},
		Bio = "The Impact had brought forth a rather unique form of unity amongst the people, in anger and in mind."
	},
	["Pier, Javion Bouncer"] = {
		Id = 9499156047,
		Name = "Pier, Javion Bouncer",
		AltCards = {
			["Pier, Javion Bouncer-Banner"] = {
				Id = 11140961272,
				AttackEffect = "Scratch",
				Name = "Mogz",
				Bio = "\"I wish you hadn't done that.\""
			},
			["Pier, Javion Bouncer-Sun"] = {
				Id = 130590326004583,
				AttackEffect = "Jab",
				Name = "Legendary Super Bouncer, Pier",
				Bio = "\t\t\t\tAs Pier gazed upon the Robloxian Overlay, he couldn't help but laugh.\n\t\t\t    Working 24-hour shifts for a stuck-up tyrant was getting boring, anyway. The Evincar saved him the effort of making resignation papers.\n\t\t\t\t"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		EffectVariable = 0,
		Cost = { Yellow = 2, Neutral = 6 },
		Effect = {
			Name = "Stud",
			Description = "Whenever an enemy effect targets a fighter: They lose all of their studs and you gain those studs.",
			Type = "OnEnemyTarget",
			Power = {
				{
					"AlterEV",
					{ "Set", "EnemyPlayertable", "ColorNeutral", "Nil" }
				},
				{ "SetNeutral", 0, "Opponent" },
				{ "Neutral", "Variable", "Ally" },
				{
					"AlterEV",
					{ "Set", "EnemyPlayertable", "ColorRed", "Nil" }
				},
				{ "SetRed", 0, "Opponent" },
				{ "Red", "Variable", "Ally" },
				{
					"AlterEV",
					{ "Set", "EnemyPlayertable", "ColorGreen", "Nil" }
				},
				{ "SetGreen", 0, "Opponent" },
				{ "Green", "Variable", "Ally" },
				{
					"AlterEV",
					{ "Set", "EnemyPlayertable", "ColorBlue", "Nil" }
				},
				{ "SetBlue", 0, "Opponent" },
				{ "Blue", "Variable", "Ally" },
				{
					"AlterEV",
					{ "Set", "EnemyPlayertable", "ColorYellow", "Nil" }
				},
				{ "SetYellow", 0, "Opponent" },
				{ "Yellow", "Variable", "Ally" }
			},
			Target = "Self"
		},
		Bio = "\"Threaten the park, face the dunk tank.\""
	},
	["Javion Tour Bus"] = {
		Id = 9739525256,
		Name = "Javion Tour Bus",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Thrice each turn, whenever an allied effect targets: Summon an inert 100/100 Tourist that's inert in play.",
			Ability = {
				OnAllyTarget = {
					Power = { { "Summon", "Tourist" } },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 0, 4, "TargetCount" },
					TurnTriggerLimit = 3
				}
			}
		},
		Bio = "The authorities of Javion opted to give their customers a satisfiying ride, moments before ridding them of everything they own."
	},
	Tourist = {
		Id = 9570541115,
		Name = "Tourist",
		AltCards = {
			["My Honest Reaction"] = {
				Id = 14905819578,
				Name = "My Honest Reaction",
				Bio = "@tige1111 DtYBlUOZrJ8 can you rate this song for me"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		Token = true,
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "BLEU",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0, "Ally" } },
			Target = "Opponent"
		},
		Bio = "\"Oh boy! I can't wait to win it Bigg like Biggs at the games!\""
	},
	["Rageborne Slots"] = {
		Id = 100014775120811,
		Name = "Rageborne Dunk Tank",
		Health = 777,
		Power = 777,
		Rarity = "Rare",
		AttackEffect = "Bite",
		Color = "Yellow",
		Archetype = "Rageborne",
		AltCards = {
			["Rageborne Slots Jackpot"] = {
				Name = "Rageborne Teacups",
				AttackEffect = "Coins",
				NoFoilWorth = true,
				Id = 96503415391621
			}
		},
		EffectVariable = 0,
		Cost = { Yellow = 4, Neutral = 3 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "Whenever you enter rage, or this card is cast while raging, if you have exactly 7 cards in hand: Set the stats of all allied fighters to 777/777.",
			Ability = {
				OnSummonRage = {
					Power = {
						{ "SetHealth", 777 },
						{ "SetPower", 777 }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyHand", 7, 8, "Any" }
				},
				OnRageGain = {
					Power = {
						{ "SetHealth", 777 },
						{ "SetPower", 777 }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyHand", 7, 8, "Any" }
				}
			}
		},
		Bio = "\"Feelin' lucky, punk?\""
	},
	["Rageborne Coffers"] = {
		Id = 86961760754773,
		Name = "Rageborne Coffers",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Rageborne",
		EffectVariable = 0,
		Cost = { Neutral = 1, Yellow = 4 },
		EffectAnimation = "RageborneEyeGlint",
		Rageborne = true,
		Effect = {
			Name = "Stud",
			Description = "During your end step, if you're in Rage: You gain {W}{R}{G}{B}{Y}.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Yellow", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Red", 1 },
						{ "Neutral", 1 }
					},
					Target = "Ally",
					EffectRequirement = { "Board", "AllyGenZone", 1, 9999, "Rage" }
				}
			}
		},
		Bio = "The history of cruelty and manipulation behind Javion's success, brought into full form by the Impact's influence."
	},
	["Midas, Emperor of Gold"] = {
		Id = 77610379512483,
		Name = "Midas, Emperor of Gold",
		AltCards = {
			["Midas, Emperor of Gold-Offer"] = {
				Id = 12326131331,
				Name = "IcyTea, Augury of Fimbulwinter",
				AttackEffect = "Harbinger",
				SummonAnimation = "NotaDeveloper",
				Commissioner = { 41926915 },
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself a Money Stack card for each stack of rage you have.\nWhenever you discard a Money Stack card: This card gains 100 power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Archetype", "Rage" },
									nil,
									nil,
									nil,
									"BlueborneEyeGlint"
								},
								{
									"RepeatingRandomAdd",
									{
										{ "Tix Stack", "Targeting Blip" },
										"Variable"
									},
									"Ally"
								}
							},
							Target = "Self"
						},
						OnAllyDiscard = {
							Power = { { "Strengthen", 100, "Self" } },
							Target = "Ally",
							Archetype = "Money"
						}
					}
				},
				Bio = "One’s anger doesn’t begin to define in one’s experience with Fimbulwinter: Thirty years of extreme cold and endless loneliness."
			},
			["Midas, Emperor of Gold-Sun"] = {
				Id = 17763438034,
				Name = "Midas",
				AttackEffect = "Harbinger",
				Effect = {
					Name = "Stud",
					Description = "When this card is cast: Give yourself a Money Stack for each stack of rage you have.\nWhenever you discard a Money Stack card: This card gains 100 power.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"AlterEV",
									{ "Set", "GenZone_Ally", "Archetype", "Rage" },
									nil,
									nil,
									nil,
									"BlueborneEyeGlint"
								},
								{
									"RepeatingRandomAdd",
									{
										{ "Medallion", "Gold Bar" },
										"Variable"
									},
									"Ally"
								}
							},
							Target = "Self"
						},
						OnAllyDiscard = {
							Power = { { "Strengthen", 100, "Self" } },
							Target = "Ally",
							Archetype = "Money"
						}
					}
				},
				Rageant = "GreedRage",
				Bio = "<b><font color=\"#f0c353\">All that glitters is yours.</font></b>"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Archetype = "Rageborne",
		SummonAnimation = "MidasSummon",
		SummonedAnimation = "MidasSummon",
		EffectVariable = 0,
		Cost = { Yellow = 4, Neutral = 2 },
		Rageborne = true,
		CustomReminderMoney = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Give yourself a Money Stack for each stack of rage you have.\nWhenever you discard a Money Stack card: This card gains 100 power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Archetype", "Rage" },
							nil,
							nil,
							nil,
							"RageborneEyeGlint"
						},
						{
							"RepeatingRandomAdd",
							{
								{ "Tix Stack", "Targeting Blip" },
								"Variable"
							},
							"Ally"
						}
					},
					Target = "Self"
				},
				OnAllyDiscard = {
					Power = { { "Strengthen", 100, "Self" } },
					Target = "Ally",
					Archetype = "Money"
				}
			}
		},
		Bio = "<i>In the ruins of greed, a cruelty foretold. The Caesar of Destruction, brought forth by gold.</i>"
	},
	["Tourist Trap"] = {
		Id = 137872081613622,
		Name = "Tourist Trap",
		Health = 900,
		Power = 900,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "Whenever your opponent casts a fighter: Steal it. Then obliterate this card.",
			Ability = {
				OnEnemySummon = {
					Power = {
						{ "Steal" },
						{ "Obliterate", 30, "Self" }
					},
					Target = "Aggressor"
				}
			}
		},
		Bio = "Javion has its ways of pulling people in, both figuratively and literally."
	},
	["Debt To The House"] = {
		Id = 108149782897917,
		Name = "Predatory Waiver",
		AltCards = {
			Retopology = {
				Id = 134906261695073,
				Name = "Retopology",
				Commissioner = { "Remvolt" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 703,
				Bio = "The drip finally stops."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate all Colourless cards in all baseplates.\nPut 2 Colourless Studs into all baseplates.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{
					"GenZoneDiscard",
					{ "Neutral", 0 }
				},
				{
					"AddGenZone",
					{ "Mark Stud", 2 }
				},
				{ "Draw", 1, "Ally" }
			},
			Target = "All",
			GenZoneDiscardObliterate = true
		},
		Bio = "We're sorry for your loss, but we regret to inform you that your one-month subscription to Biggsy+ two years ago means you unfortunately cannot seek litigation. Should've read the terms of service! "
	},
	["Explore The Depths"] = {
		Id = 10823530092,
		Name = "Explore The Depths",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Hammer",
		Color = "Blue",
		Blessing = true,
		ModifierEldritch = true,
		EffectVariable = 0,
		Cost = { Neutral = 4, Blue = 2, Green = 2 },
		Effect = {
			Name = "Knockdown",
			Description = "Put an Eldritch Blessing on the card space this was cast from.\nYou draw X cards and gain 200 times X life.\nX is the number of blessings you have.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "Self" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{ "Draw", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Multiply", "Math", -200, "Nil" }
						},
						{ "Cost", "Variable", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "A flood of essence spewed from the crack and violently transformed the trainee. Adreti was ecstatic, Yuéliáng was horrified."
	},
	["Yueliang, World Calmer"] = {
		Id = 9499133548,
		Name = "Yuéliáng, World Calmer",
		SearchTerms = "Yueliang, World Calmer",
		AltCards = {
			SCP2Z = {
				Id = 10853371762,
				Name = "Yueliang Shoda",
				AttackEffect = "Storm",
				Bio = "Blending in and enjoying the culture is key to a succesful mission."
			},
			["Yueliang but with bad art"] = {
				Id = 11865480533,
				Name = "Yueliang but with bad art",
				AttackEffect = "MagicBlue",
				Bio = "lets not talk about the Voids"
			},
			["4th Pack Reindeer Flufflefunz"] = {
				Id = 119001595589868,
				Name = "4th Pack Reindeer Flufflefunz",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 28,
				Addant = "Concentration",
				Bio = "\"Can we skip the formalities? I've got a killer migraine...\""
			},
			["Yueliang, World Calmer-Banner"] = {
				Id = 13488223263,
				Name = "Yuéliáng Shoda",
				AttackEffect = "Whirlpool",
				Bio = "\t\t\t\tThe full moon is out tonight,\n\t\t\t\tThe sea shores are burning bright,\n\t\t\t\tNight's too young to stay asleep,\n\t\t\t\tA time for respite for those who weep.\n\t\t\t\t"
			},
			["Every Histor"] = {
				Id = 17251037866,
				Name = "Every Histor",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 254,
				Addant = "Through Patches of Violet",
				Bio = "\"I must be the reason why<br/>You must tell me all these lies<br/>Wishing you a better life without me by your side\""
			},
			["Mag, Fallen Brother"] = {
				Id = 102720284103980,
				Name = "Mag, Fallen Brother",
				Commissioner = { "jasp1108" },
				AttackEffect = "Ghostwalker",
				AltArt = true,
				PremiumArt = 667,
				Bio = "Don't cry for me Ignis, I knew my time was already over, and now brother, keep the fire alive"
			}
		},
		Health = 700,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		DamageImmune = true,
		Color = "Blue",
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		Cost = { Blue = 4, Red = 4 },
		Rank = 8,
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: If he isn't already in play, Summon 'Hou Yi, World's Fury' from all of your zones.\nWhenever an effect targets this card: Give yourself a Moonleak.",
			Ability = {
				OnTarget = {
					Power = { { "Add", "Addant", "Ally" } },
					Target = "Ally"
				},
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{
								"Hou Yi, Righteous Fury",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false,
								7
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"Hou Yi, Righteous Fury",
								"GenZone_Ally",
								"Field_Ally",
								true,
								false,
								7
							},
							"Self"
						},
						{
							"MoveZone",
							{ "Hou Yi, Righteous Fury", "Hand_Ally", "Field_Ally", true, false, 7 },
							"Self"
						},
						{
							"MoveZone",
							{ "Hou Yi, Righteous Fury", "Deck_Ally", "Field_Ally", true, false, 7 },
							"Self"
						}
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Hou Yi, Righteous Fury" }
				}
			}
		},
		Bio = "A freedom lock can occur from many types of disasters. If one is unavoidable, the only thing we can do is choose the one that causes the least irreversible destruction."
	},
	["Hou Yi, Righteous Fury"] = {
		Id = 9499143995,
		Name = "Hou Yi, World's Fury",
		AltCards = {
			SCP2X = {
				Id = 10853380630,
				Name = "Feral Hou Yi",
				AttackEffect = "LycanScratch",
				Bio = "Without a home, the rage comes undone."
			},
			["Hou Yi but with bad art"] = {
				Id = 11865482325,
				Name = "Hou Yi but with bad art",
				Bio = "i dont know where he went"
			},
			["4th Pack Rabbit SirVenon"] = {
				Id = 86266577381180,
				Name = "4th Pack Rabbit SirVenon",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 27,
				Bio = "\"Hippity-hop, out on a bop... The rabbit hops in. To smash it to bits!\""
			},
			["Erlking Dairing"] = {
				Id = 17251038054,
				Name = "Erlking Dairing",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 256,
				Rageant = "Self Loathing",
				Bio = "I must be the reason why<br/>You have given up your smiles<br/>And the hope inside your eyes have been stolen"
			},
			["Ignis Mage, Brother Grieving in Fury"] = {
				Id = 97922608258825,
				Name = "Ignis Mage, Brother Grieving in Fury",
				Commissioner = { "jasp1108" },
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 668,
				Bio = "\"I will... burn it all down...\""
			}
		},
		Health = 600,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Scratch",
		Color = "Red",
		Archetype = "Rageborne",
		Rageborne = true,
		Transformant = "Yuéliáng, World Calmer",
		Cost = { Blue = 4, Red = 4 },
		Rank = 8,
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: If she isn't already in play, Summon 'Yuéliáng, World Calmer' from all of your zones.\nWhenever you cast an action: This card deals 200 damage to a target fighter.",
			ActionOnly = true,
			Ability = {
				OnAllyCast = {
					Power = { { "Damage", 200, nil, nil, nil, "RageborneEyeGlint" } },
					Target = "Single"
				},
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{
								"Yueliang, World Calmer",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false,
								7
							},
							"Self"
						},
						{
							"MoveZone",
							{
								"Yueliang, World Calmer",
								"GenZone_Ally",
								"Field_Ally",
								true,
								false,
								7
							},
							"Self"
						},
						{
							"MoveZone",
							{ "Yueliang, World Calmer", "Hand_Ally", "Field_Ally", true, false, 7 },
							"Self"
						},
						{
							"MoveZone",
							{ "Yueliang, World Calmer", "Deck_Ally", "Field_Ally", true, false, 7 },
							"Self"
						}
					},
					Target = "Self",
					EffectRequirement = { "Board", "Ally", 0, 1, "BoardContainsIndex_Yueliang, World Calmer" }
				}
			}
		},
		Bio = "The coming of our kind could only end in two ways: Our domination, or our eviction. She chose the latter."
	},
	["Beat The House"] = {
		Id = 116949505397611,
		Name = "The Grand Prize",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "Destroy your hand.\nObliterate a card from your opponent's deck for each card destroyed.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Hand_Ally", "All", "Nil" }
				},
				{ "RandomDiscard", 10, "Ally" },
				{ "RemoveDeck", "Variable", "Opponent" },
				{ "Draw", 2, "Ally" }
			},
			Target = "Self"
		},
		Bio = "With Pier distracted by Drake's onslaught, Yuéliáng quickly took her chance to destroy the Rageborne-afflicted Coffers of Javion, gaining access to its wealth of power."
	},
	["Havaluvian Immigrant"] = {
		Id = 9739525576,
		Name = "Havaluvian Immigrant",
		AltCards = {
			["Havaluain Mixologist"] = {
				Id = 107198443121663,
				Name = "Havaluain Mixologist",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 781,
				Bio = "Cothran green tea shaken with Robloxian soda- Luna"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 3, Yellow = 2, Blue = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Draw three cards, then shuffle the oldest card in your hand into your deck.\n🅑 Summon a 250/250 Fighter with Defender.\n🅒 Unlock a target fighter and deal 150 damage to it.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Havaluvian Chop Suey" },
				{ "Add", "Havaluvian Portable Forcefield" },
				{ "Add", "Havaluvian Eviction Cage" }
			},
			Target = "Ally"
		},
		Bio = "With their old planet destroyed, the remaining Havaluvians sought for their next method of pursuing decadence."
	},
	["Havaluvian Chop Suey"] = {
		Id = 9739526547,
		Name = "Havaluvian Chop Suey",
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
			Description = "Draw three cards, then shuffle the oldest card in your hand into your deck.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 3, "Ally" },
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally",
			EffectSpecificDiscardShuffle = true
		},
		Bio = "When it comes to health and cuisine, Havalu doesn't cut corners."
	},
	["Havaluvian Portable Forcefield"] = {
		Id = 9739526162,
		Name = "Havaluvian Portable Forcefield",
		Health = 250,
		Power = 250,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Shield = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Destroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = { { "ArchetypeDiscard", 999, "Ally", "Crystal" } },
			Target = "Ally"
		},
		Bio = "Personal protection is a big thing amongst Havaluvians."
	},
	["Havaluvian Eviction Cage"] = {
		Id = 9739525888,
		Name = "Havaluvian Eviction Cage",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Unlock a target fighter and deal 150 damage to it. Destroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Damage", 150 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Single"
		},
		Bio = "Havalu has a certain standard when it comes to law enforcement. Clean, efficient, and without emotional dignity."
	},
	["Robloxian Immigrant"] = {
		Id = 10861005250,
		Name = "Robloxian Immigrant",
		AltCards = {
			["Robloxian Immigrant-Offer"] = {
				Id = 12358385958,
				AttackEffect = "ClassicRocket",
				Bio = "\t\t\t\tTom built the Eiffel Tower.\n\t\t\t\tAlex built an experimental jet.\n\t\t\t\tKim built a first-person shooter.\n\t\t\t\tI hired a hitman to invade your home and assasinate you.\n\t\t\t\t"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 3, Green = 2, Blue = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 All allied fighters gain 250 health.\n🅑 Deal 200 damage to all fighters.\n🅒 You gain 800 life and draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Robloxian Trowel" },
				{ "Add", "Robloxian Superball" },
				{ "Add", "Robloxian Potion" }
			},
			Target = "Ally"
		},
		Bio = "The Robloxians travelled from their planet in search for a new experience - the Paradise of Javion!"
	},
	["Robloxian Trowel"] = {
		Id = 140530999868191,
		Name = "Robloxian Trowel",
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
			Description = "All allied fighters gains 250 Health.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 250, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Pretty ridiculous how quickly these things can make fully-fledged walls, don't you think?"
	},
	["Robloxian Superball"] = {
		Id = 101331203182042,
		Name = "Robloxian Superball",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		EffectAnimation = "MidSuperballEffectEnemy", -- FIX: the token had no cast animation / sound at all
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 200 damage to all fighters.\nDestroy all Choice cards in your hand..",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200, "All" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "LET'S GET BALLIN'!!"
	},
	["Robloxian Potion"] = {
		Id = 110984601540000,
		Name = "Robloxian Potion",
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
			Description = "You gain 800 life and draw a card.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -800 },
				{ "Draw", 1 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "Tastes zesty. Shedletsky Approved!"
	},
	["Katharan Immigrant"] = {
		Id = 77566489482345,
		Name = "Katharan Immigrant",
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2, Red = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Deal 500 damage to a target fighter.\n🅑 Summon a 600/300 Totem, then swap the stats of a target allied fighter.\n🅒 Select up to 4 cards in your opponent's graveyard. Obliterate those cards, then draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Katharan Charged Blade" },
				{ "Add", "Katharan Totem" },
				{ "Add", "Katharan Blood Pact" }
			},
			Target = "Ally"
		},
		Bio = "Even before the Starkiller destroyed everything, the people of Kathara had already lived in terror. The Ecocide was a sign of new things to come, all things considered."
	},
	["Katharan Charged Blade"] = {
		Id = 78963321192044,
		Name = "Katharan Charged Blade",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Red",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 500 damage to a target fighter.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 500, "Single" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "What didn't kill them made them stronger."
	},
	["Katharan Blood Pact"] = {
		Id = 72389168518502,
		Name = "Katharan Blood Pact",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Select up to 4 cards in your opponent's Graveyard. Obliterate those cards.\nDraw a card.\nDestroy all Choice cards in your hand. ",
			Type = "OnSummon",
			Power = {
				{ "GraveDestroy", 30, "CustomZoneTarget" },
				{ "Draw", 1 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally",
			ZoneTargetParameters = {
				Zones = { "Enemy_GraveZone" },
				Condition = {},
				SelectionDescription = "Up to four cards to destroy",
				MinTargets = 0,
				MaxTargets = 4
			}
		},
		Bio = "When the world itself seeks to destroy you, Katharans were more than eager to work together in order to survive."
	},
	["Katharan Totem"] = {
		Id = 114464735986255,
		Name = "Katharan Totem",
		Health = 600,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Red",
		Cost = { Blue = 0 },
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Swap the stats of a target allied fighter.\nDestroy all Choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap", 100000 },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Hope is a fleeting thing in Kathara. These totems were made to keep such optimism around in a desolate wasteland."
	},
	["Cothrite Immigrant"] = {
		Id = 111452710882907,
		Name = "Cothran Immigrant",
		AltCards = {
			SCP2W = { Id = 10843378786, AttackEffect = "SoulDrain" },
			["Master Empathizer"] = {
				Id = 18199517040,
				Name = "Master Empathizer",
				AltArt = true,
				PremiumArt = 272,
				Bio = "A man who sacrificed his sanity to become a modeler."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2, Yellow = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 You gain {W}{G}{Y}.\n🅑 Shuffle a copy of a target fighter into your deck. Draw a card.\n🅒 Give yourself 3 Money stack cards and remove their cost.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Cothrite Ore Extractor" },
				{ "Add", "Cothrite Magic Bark" },
				{ "Add", "Cothrite Tourist Attraction" }
			},
			Target = "Ally"
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "The spirits that inhibited Cothran found themselves no longer with a vessel to inhabit. In his honor, they went forth to continue the one thing he wished to do..."
	},
	["Cothrite Ore Extractor"] = {
		Id = 122244605859068,
		Name = "Cothrite Ore Extractor",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "You gain {W}{G}{Y}.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Green", 1 },
				{ "Yellow", 1 },
				{ "Neutral", 1 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "A piece of machinery used to extract the energy of Cothran's corestones. A bit of esscence is still left on it..."
	},
	["Cothrite Magic Bark"] = {
		Id = 137776344557921,
		Name = "Cothrite Magic Bark",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle a copy of a target fighter into your deck.\nDraw a card.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "CardIndex", "Nil" }
				},
				{ "DeckAdd", "Variable", "Ally" },
				{ "Draw", 1, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Single"
		},
		Bio = "You can hear whispers emanating from the wood, all speaking in unison."
	},
	["Cothrite Tourist Attraction"] = {
		Id = 130737656951313,
		Name = "Cothrite Tourist Attraction",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Green",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Give yourself 3 Money stack cards and remove their cost.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{
					"RandomAdd",
					{ "Tix Stack", "Targeting Blip" }
				},
				{
					"RandomAdd",
					{ "Tix Stack", "Targeting Blip" }
				},
				{
					"RandomAdd",
					{ "Tix Stack", "Targeting Blip" }
				},
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally",
			MetaData = { AddNeutralCost = -1 }
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "To keep Ptenda's legacy alive, it had to be sold cheaply to gawking tourists."
	},
	["Forothian Immigrant"] = {
		Id = 10860960770,
		Name = "Forothian Immigrant",
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Blessing = true,
		ModifierEldritch = true,
		Cost = { Neutral = 3, Red = 2, Blue = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Summon a 450/450 Moongeist.\n🅑 Draw a card. Put an Eldritch Blessing onto 2 cards in your hand.\n🅒 Deal 150 damage to all fighters. Destroy your opponent's terrain.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Forothian Moongeist" },
				{ "Add", "Forothian Blessed Gem" },
				{ "Add", "Forothian Grand Lightning" }
			},
			Target = "Ally"
		},
		Bio = "The people of Foroth looked amongst each other, now without an authority controlling their every move. They all now sought the same thing - a new beginning."
	},
	["Forothian Moongeist"] = {
		Id = 91995386014302,
		Name = "Forothian Moongeist",
		Health = 450,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Red",
		Cost = { Blue = 0 },
		TokenOmni = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Destroy all Choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "ArchetypeDiscard", 999, "Ally", "Crystal" } },
					Target = "Opponent"
				}
			}
		},
		Bio = "The people of Foroth were oblivious to the natural beauty of their previous planet, having been blinded by the tainted waters."
	},
	["Forothian Blessed Gem"] = {
		Id = 138636329372628,
		Name = "Forothian Blessed Gem",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Blue",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw a card.\nPut an Eldritch Blessing onto 2 cards in your hand.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" },
				{ "Draw", 1, "Ally" },
				{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
				{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
			},
			Target = "Ally"
		},
		Bio = "A valuable gem once taken away by one of the Oligarchs' scheduled 'reperations', glimmering brightly like a winter light."
	},
	["Forothian Grand Lightning"] = {
		Id = 136172774102448,
		Name = "Forothian Grand Lightning",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Red",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 150 damage to all fighters.\nDestroy your opponent's terrain.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 150 },
				{ "DestroyTerrain", 30, "Opponent" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "All"
		},
		Bio = "As the haze brought by the waters subsided, the Forothians slowly reclaimed the scraps left behind - in hopes for a better society."
	},
	["Javionese Immigrant"] = {
		Id = 10445482937,
		Name = "Javionese Immigrant",
		AltCards = {
			["Javionese Immigrant-10Y-Banner"] = {
				PackDisplayOverride = "10th Anniversary Login Banner",
				Id = 91387125874159,
				Bio = "\"Sorry, sweaty. You have no idea what the heck you're talking about - real Biggsma men (like me) don't sit in their basements getting lucky, they GRIND. It's how I got where I am today, and how you're still POOR.' ...and send. That'll show em.\""
			},
			["Death Phoenix"] = {
				Id = 126262858842147,
				Name = "Death Phoenix",
				Effect = {
					Name = "Reincarnation",
					Type = "OnSummon",
					Power = {
						{ "Add", "Javionese Projection-DP" },
						{ "Add", "Javionese Loans-DP" },
						{ "Add", "Javionese Winnings-DP" }
					},
					Target = "Ally"
				},
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 647,
				Bio = "Myths tell of an eternal bird that can grant immortality to anyone it deems worthy.<br/><b><font color=\"#FF0000\">Some myths don’t deserve to be true.</font></b>"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Red = 2, Yellow = 2 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Give yourself 3 choices —\n🅐 Summon a 300/600 Projection and all players lose 400 life.\n🅑 Draw 2 fleeting cards.\n🅒 All allied fighters gain 300 power until the next end step.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Javionese Projection" },
				{ "Add", "Javionese Loans" },
				{ "Add", "Javionese Winnings" }
			},
			Target = "Ally"
		},
		Bio = "Yes, Javion's citizens are able to immigrate themselves into Javion multiple times. Why? Identity Insurance."
	},
	["Javionese Projection"] = {
		Id = 135605740598695,
		Name = "Javionese Projection",
		AltCards = {
			["Javionese Projection-DP"] = {
				Name = "The Cold Persistence",
				Id = 84369413115873,
				AttackEffect = "British",
				Bio = "“Animal or monster, tell me the job and I’ll give you a head to mount on your wall.”<br/><b><font color=\"#90D5FF\">-Nicholas Ross</font></b>"
			}
		},
		Health = 300,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Red",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Token = true,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: All players lose 400 life. Destroy all Choice cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Inflict", 400, "All" },
						{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Mirage. A promise of decadence."
	},
	["Javionese Loans"] = {
		Id = 92737915765080,
		Name = "Javionese Loans",
		AltCards = {
			["Javionese Loans-DP"] = {
				Name = "Myth Hunting",
				Id = 126137140148011,
				AttackEffect = "British",
				Bio = "A self proclaimed monster hunter that wanders the forest day and night.<br/><b><font color=\"#90D5FF\">But what real human can survive all that time alone in the freezing cold?</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		CustomReminderFleeting = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Draw 2 fleeting cards.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 2 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "Blood Money. There is no gain without pain."
	},
	["Javionese Winnings"] = {
		Id = 115087321502687,
		Name = "Javionese Winnings",
		AltCards = {
			["Javionese Winnings-DP"] = {
				Name = "Unwanted Attention",
				Id = 136244440168707,
				AttackEffect = "British",
				Bio = "\"Not only is hunting down a giant bird hard...<br/><b><font color=\"#FF0000\">BUT IT KNOWS FIRE MAGIC TOO!!!\"</font></b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Crystal",
		Color = "Yellow",
		Cost = { Blue = 0 },
		TokenDiscard = true,
		Effect = {
			Name = "Reincarnation",
			Description = "All allied fighters gain 300 Power until your next end step.\nDestroy all Choice cards in your hand.",
			Type = "OnSummon",
			Power = {
				{ "TempStrengthen", 300 },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Ally"
		},
		Bio = "False Victories. The impression of triumph against an unwinnable battle."
	},
	["The Robloxian Overlay"] = {
		Id = 98589228573520,
		Name = "The Robloxian Overlay",
		AltCards = {
			["Scrambled Eve"] = {
				Id = 10089821858,
				AltArt = true,
				Name = "Scrambled Eve",
				Bio = "\"Wait! Give me back the presents!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		CantAICast = true,
		Rank = 8,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle each player's hand together, then equally distribute that hand back to all players.\nRepeat this process for each player's deck and baseplate. Put 2 Colourless Studs into each player's Baseplate.",
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
		Bio = "With Javion's stability breaking down without its wealthy coffers, Yuéliáng had only one option."
	},
	["Moonlight Camper"] = {
		Id = 10841806035,
		Name = "Moonlight Camper",
		AltCards = {
			["Meraki, Beluga Pollyanna"] = {
				Id = 80172472878689,
				Name = "Meraki, Beluga Pollyanna",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 489,
				Addant = "Moonleak-Meraki",
				Bio = "\"Optimism is realism.\""
			},
			Astrid = {
				Id = 117310939502618,
				Name = "Astrid!!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 581,
				Addant = "Moonleak-Astrid",
				ArtAnimation = "Astrid",
				FeaturedDisplay = true,
				Bio = "i have a devesto credit card and it talks to me"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		CustomReminderMoonleak = true,
		Addant = "Moonleak",
		Cost = { Blue = 2, Red = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Moonleak.\nWhenever you cast a Moonleak: This card gains 200 health.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Heal", 200 } },
					Target = "Self",
					LibraryIndex = "Moonleak"
				}
			}
		},
		Bio = "Being in the prescence of natural moonlight has been said to bring a calmer state of mind. If only."
	},
	["Paraselene Astrologist"] = {
		Id = 10861002260,
		Name = "Paraselene Astrologist",
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Moonward = true,
		Addant = "Moonleak",
		Cost = { Blue = 2, Neutral = 1 },
		CustomReminderMoonleak = true,
		Effect = {
			Name = "Haydoscale",
			Description = "If this card would take noncombat damage: Give yourself a Moonleak.",
			Ability = {
				OnEffectDamage = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "The stars are not right, something terrible will befall these lands."
	},
	Homemade_Meal = {
		Id = 10445089993,
		Name = "Homemade_Meal",
		Health = 200,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3 },
		CustomReminderNascent = true,
		CustomReminderFleeting = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you discard your second card each turn, if it's Blue or Yellow: Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "Add", "Nascent Stud" } },
					Target = "Ally",
					Colors = { "Blue", "Yellow" },
					EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" },
					MetaData = { Fleeting = true }
				}
			}
		},
		Bio = "Aperture? Never heard'a her."
	},
	["Duckie Plush"] = {
		Id = 10445449726,
		Name = "Duckie Plush",
		AltCards = {
			["Duckie Plush-AN-Offer"] = {
				Id = 18601520968,
				AttackEffect = "Rifle",
				Name = "Hunter Hound",
				Bio = "They never miss their bark- er, mark.",
				Addant = "Annoying Mallard"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Blue = 4 },
		Blessing = true,
		ModifierEldritch = true,
		Addant = "Rubber Duck",
		CustomReminder = { ["Rubber Duck"] = "A useless action, fit only for discarding." },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Shuffle your hand on top of your deck. Give yourself that many rubber ducks, then draw that many cards.\nPut an Eldritch Blessing onto a card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "All", "Nil" }
						},
						{ "RandomDiscard", 10, "Ally" },
						{
							"RepeatingAdd",
							{ "Addant", "Variable" },
							"Ally"
						},
						{ "Draw", "Variable" },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Ally"
				}
			},
			EffectRandomDiscardShuffle = true,
			EffectDeckAddToTop = true
		},
		Bio = "Teh marketable plushie of teh Epik Legend of Past."
	},
	Bloxtun = {
		Id = 10824028634,
		Name = "Bloxtun",
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Yellow = 2 },
		Addant = "Rubber Duck",
		CustomReminder = { ["Rubber Duck"] = "A useless action, fit only for discarding." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 3 Rubber Ducks. Then this card gains 50 health and power for each token card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{
							"AlterEV",
							{ "Set", "Hand_Ally", "Token", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{ "Strengthen", "Variable", "Self" },
						{ "Heal", "Variable", "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Come on guys! What do you mean you don't want to hop on my Super Ultra Mega Fun Obby? It'll be a blast I prooooomise!"
	},
	Lightning_Splash = {
		Id = 10445145344,
		Name = "Lightning_Splash",
		AltCards = {
			["Lightning_Splash-Hal"] = {
				Name = "Seek",
				Id = 11140966424,
				AttackEffect = "Scratch",
				Addant = "SplashRagdoll-Hal",
				Bio = ""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Yellow = 2, Neutral = 1 },
		Addant = "SplashRagdoll",
		CustomReminder = {
			Ragdoll = "A {W} 150/150, inert in all zones. When it's cast, all allied Ragdolls gain 50 Power."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an effect draws you a card: Give yourself a Ragdoll.\nWhen this card dies: Summon all Ragdolls from your graveyard.",
			Ability = {
				OnAllyDraw = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnDeath = {
					Power = { {
						"MoveZone",
						{ "Ragdoll", "GraveZone_Ally", "Field_Ally", true, false, 8 },
						"Self"
					} },
					Target = "Ally",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "\"Let's open some doors!\""
	},
	SplashRagdoll = {
		Id = 10861837025,
		Name = "Ragdoll",
		AltCards = {
			["SplashRagdoll-Hal"] = { Name = "Rush", AttackEffect = "Gravity", Id = 11140974475, Bio = "" }
		},
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		TokenOmni = true,
		Archetype = "Ragdoll",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Quack",
			Description = "When this card is cast: All allied Ragdolls gain 50 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 50 } },
			Target = "AlliedArchetype"
		},
		Bio = ""
	},
	["Lunar Nullification Field"] = {
		Id = 10824308776,
		Name = "Lunar Nullification Field",
		Health = 0,
		Power = 0,
		AddHealth = 200,
		AddPower = -200,
		Gear = true,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 2 },
		CustomReminder = {
			Detoxification = "A fighter with defender must be attacked before all others."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Attach to a target fighter.\nIt has defender for as long as this card is attached to it.",
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
		Bio = "Seeing the flood of essence flowing towards him, Lua acted quickly."
	},
	["Lunar Silencing"] = {
		Id = 10824064910,
		Name = "Lunar Silencing",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		CantAICast = true,
		Cost = { Blue = 3, Neutral = 1 },
		CustomReminder = {
			["He's a person, just like me?"] = "If a player has a unique fighter, they can't cast unique cards."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "Select up to 2 cards in your opponent's hand. They gain unique and can't be discarded.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "GivePassive", "Unique", "CustomZoneTarget" },
						{ "GivePassive", "Undiscardable", "CustomZoneTarget" }
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						MinTargets = 0,
						MaxTargets = 2,
						SelectionDescription = "a card from your opponent's hand"
					}
				}
			}
		},
		Bio = "Freeing herself from the Rageborne's grasp, Yuéliáng quickly grabbed her staff and pacified the creature's emotions."
	},
	ShiiroShogun = {
		Id = 83940394761526,
		Name = "ShiiroShogun",
		AltCards = {
			["ShiiroShogun-Banner"] = {
				Id = 12326186619,
				Summonant = "Floppa-Banner",
				Name = "Divorce Lawyer ShiiroShogun",
				Bio = "\"I'm afraid half of your flops now belong to her.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Katana",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 2 },
		Summonant = "Floppa",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast or attacks: Summon a 100/0 Floppa that's inert in all zones.\nWhenever a Floppa dies: This card gains 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAttack = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAnyDeath = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self",
					Archetype = "Floppa"
				}
			}
		},
		Bio = "To own a Floppa you must first care for it. In return you shall receive unmeasurable riches."
	},
	Floppa = {
		Id = 10861045520,
		Name = "Floppa",
		AltCards = {
			["Floppa-Banner"] = {
				Id = 12326185819,
				Name = "Flopbroken ",
				Bio = "It's enough to make a grown Floppa cry."
			}
		},
		Health = 100,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Blue",
		TokenOmni = true,
		Archetype = "Floppa",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Quack",
			Description = "Whenever you pick this card up by the arms: It extends to all eight card slots in play. Sproing.",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Flop fo' no 'borne."
	},
	["Lua, Paraselene Cadet"] = {
		Id = 10824358449,
		Name = "Lua, Paraselene Cadet",
		AltCards = {
			["Coral, Monastic Mustelid"] = {
				Id = 13893828013,
				Name = "Coral, Monastic Mustelid",
				AltArt = true,
				PremiumArt = 67,
				AttackEffect = "Whirlpool",
				Commissioner = { 320659945, 41926915, 857858021 },
				Bio = "Energetic and creative, Yet calculating and disciplined, This little guy is truly like no otter."
			},
			["Lua, Paraselene Cadet-Sun"] = {
				Id = 17717382258,
				Name = "The Ringed Magician",
				AttackEffect = "Punch",
				Bio = "C'mon Shooting! Shake Hands! Flame Shooting Strike!"
			},
			["Lua, Paraselene Cadet-Collector"] = {
				Id = 133749906394080,
				Name = "LUA, CADET",
				AttackEffect = "Punch",
				Bio = ""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Moonward = true,
		Cost = { Blue = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When you've discarded 3 or more cards this turn: Give yourself a Blue action card. Remove a {W} on each card in your hand.",
			Ability = {
				OnAnyTrigger = {
					Power = {
						{ "RandomAdd", "Blue Lunar" },
						{
							"IncreaseCost",
							{ -1, "Neutral", "Nil" },
							"AllyHand"
						}
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 9999, "DiscardCount" },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "We, as members of the Order of the Paraselene, are bound by oath to prevent any and all freedom locks that could possibly occur. No compromises, no exceptions."
	},
	["Spacefaring Guardian, Flatflyer"] = {
		Id = 10348256522,
		Name = "Spacefaring Guardian, Flatflyer",
		AltCards = {
			["Spacefaring Guardian, Flatflyer-Banner"] = {
				Id = 10853373122,
				Name = "Interstellar Catmaid Sylvia",
				Bio = "These gauntlets aren't just for sweeping."
			},
			["Spacefaring Guardian, Flatflyer-Sun"] = {
				Id = 13660133347,
				Name = "Sylvia, Summer's Safeguard",
				AttackEffect = "Whirlpool",
				Bio = "chill everywhere, everytime, everyway."
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Epic",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		TargetImmune = true,
		Cost = { Blue = 2, Green = 2, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: destroy a target allied fighter, then summon a copy of it with an additional 100 Health and Power. Trigger its effect as though it was cast.",
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
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Destroy" },
						{ "SummonWithEffect", "Variable" }
					},
					Target = "SingleAlly",
					MetaData = { IncreasePower = 100, IncreaseHealth = 100 }
				}
			}
		},
		Bio = "Helping out wherever and whenever they can, provided the situation calls for throwing a pair of metal fists at something."
	},
	["Javion Farmer"] = {
		Id = 10824067316,
		Name = "Javion Farmer",
		AltCards = {
			["Undying Union Thurlii & CoolFlamez"] = {
				Id = 13278743136,
				Name = "Undying Union Thurlii & CoolFlamez",
				Summonant = "Remnant Memories",
				AltArt = true,
				PremiumArt = 25,
				Bio = "The smiling faces are eerie and full of sorrow."
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Summonant = "Exotic Specimen",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Once each turn, whenever you cast a fighter: Summon a 100/0 Exotic Specimen that's inert in play.",
			Ability = {
				OnAllySummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally",
					MetaData = { Health = 100, Power = 0, Token = true },
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "It ain't much, but it pays better than the Caishen!"
	},
	["Exotic Protector"] = {
		Id = 10860972789,
		Name = "Exotic Protector",
		Health = 100,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a 400/400 Exotic Specimen with no abilities. All allied Token fighters gain 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Summon", "Exotic Specimen" },
						{ "Heal", 100, "AllyToken" },
						{ "Strengthen", 100, "AllyToken" }
					},
					Target = "Ally",
					MetaData = { Health = 400, Power = 400 }
				}
			}
		},
		Bio = "The fauna of Cothran needed to be preserved to save any last possible vessel for the overflowing souls."
	},
	["Specimen Migration"] = {
		Id = 10824397727,
		Name = "Specimen Migration",
		AltCards = {
			["Maya's Twinkly Surprise"] = {
				Id = 107214392627085,
				Name = "Maya's Twinkly Surprise!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 636,
				Addant = "Cursed Artifact",
				Bio = "\"Once you take flight... you'll never grow in height...\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 4 },
		Addant = "Exotic Specimen",
		Effect = {
			Name = "Haydoscale",
			Description = "Give yourself 2 400/400 Exotic Specimens with no abilities. They cost {G} to cast.",
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
		Bio = "Many of the specimens of Javion's exotic zoos were taken against their will, with minimal to zero attention to their habitual needs."
	},
	["Cothran Rider Knight"] = {
		Id = 10860971140,
		Name = "Cothran Rider Knight",
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		TargetImmune = true,
		TriggerInHand = true,
		Cost = { Green = 4 },
		Transformant = "Exotic Specimen",
		Summonant = "Cothran Rider Knight",
		Effect = {
			Name = "Haydoscale",
			Description = "If an effect would target this card: Instead transform this card into an Exotic Specimen with no abilities.\nIf an enemy effect would destroy a card in your hand: Summon this card from there.",
			Ability = {
				OnTarget = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				},
				OnAnyHandDestroyed = {
					Power = {
						{ "Summon", "Summonant" },
						{ "SpecificDiscard", 1, "Self" }
					},
					Target = "Ally",
					DontTriggerInField = true
				}
			},
			EffectSpecificDiscardObliterate = true
		},
		Bio = "\"Go forth, Hooves, let's find some grass to feed Princess Zanzel!\""
	},
	["Outskirts Scout"] = {
		Id = 10843386596,
		Name = "Outskirts Scout",
		AltCards = {
			["Outskirts Scout-E"] = {
				Id = 12957251592,
				Name = "Alleggators",
				AttackEffect = "Slash",
				Bio = ""
			},
			["Rifo Quest Refilled Rifo"] = {
				Id = 83064745179045,
				Name = "Ontological Disparity",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 188,
				Bio = "this was one of my favorite builds... due to universal limitations, i couldn't make it actually infinitely recursive, but... it's still nice."
			},
			B10XUS = {
				Id = 92493474383844,
				Name = "B10XUS",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 448,
				Bio = "According to my birth certificate, my full legal name is actually Bloxus 'Will Eventually Finish Red Yellow TargetSpam'"
			},
			Rouxler_ship = {
				Id = 77559981726581,
				Name = "Rouxler_ship",
				Commissioner = { "Astrozizer" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 722,
				Bio = "But- But my- My win condition..."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "LaserGreen",
		Color = "Green",
		Cost = { Green = 4, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Green card with the same rarity as a target fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "Nil" }
						},
						{ "RandomAdd", "MonoOnlyorGreenCost Variable Green", "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "\"Uhm... Mr. Biggs? I think I'm seein' double the Rageborne. No, triple! Wait, nonuple! HOLD ON, DEDICI-\""
	},
	["Deep Space Loan Shark"] = {
		Id = 10938798612,
		Name = "Deep Space Loan Shark",
		Health = 750,
		Power = 750,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		TokenDiscard = true,
		TriggerInGraveZone = true,
		Cost = { Neutral = 3, Green = 9 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step, if this card is in your graveyard: Recur it.",
			Ability = {
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Deep Space Loan Shark", "GraveZone_Ally", "Hand_Ally", true, false },
						"Self"
					} },
					Target = "Self"
				},
				DontTriggerInField = true
			}
		},
		Bio = "\"Don't worry too hard on th' debts! We don' bite, ay?\""
	},
	Imaginz00LI = {
		Id = 10674713312,
		Name = "Imaginz00",
		Health = 1250,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 1, Yellow = 1, Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a token fighter or action: Give yourself a Green or Yellow card.",
			Ability = {
				OnAllySummon = {
					Power = { { "RandomAdd", "YelloworGreen", "Ally" } },
					Target = "Ally",
					Rarity = "Token"
				},
				OnAllyCast = {
					Power = { { "RandomAdd", "YelloworGreen", "Ally" } },
					Target = "Ally",
					Rarity = "Token"
				}
			}
		},
		Bio = "<i>Never stop dreaming.</i>"
	},
	["Body Swap Potion"] = {
		Id = 10683854586,
		Name = "Body Swap Potion",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Exchange the Health of 2 target allied fighters.\nExchange the Power of 2 target allied fighters.",
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
					Target = "SingleAlly",
					UniqueTargets = true
				}
			}
		},
		Bio = "Click on someone. Jump off. Repeat."
	},
	Scribels = {
		Id = 10824110298,
		Name = "Scribels",
		AltCards = {
			["Ms. Fuschia"] = {
				Name = "Ms. Fuchsia",
				Id = 11966562734,
				AttackEffect = "Arcane",
				AltArt = true,
				Bio = "Espresso, Latte, Mocha, Espresso, Latte, Mocha, Espresso, Latte, Mocha, Espresso, Latte, Mocha, Espresso, Latte, Mocha… Huh? No yeah I’m awake. Just let me take a sip..."
			},
			["The Unknown Businessman"] = {
				Name = "The Unknown Businessman",
				Id = 14959557302,
				AttackEffect = "Revolver",
				AltArt = true,
				PremiumArt = 126,
				Bio = "in our market we trade alot sercet card we give the card depends on what u give."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Red = 3, Green = 1, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Destroy a target allied fighter. Give yourself a Red card and a Green card that each have a total stud cost 1 greater than that fighter.",
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
							{ "Set", "Target", "Cost", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{ "Destroy" },
						{ "RandomAdd", "VariableorExactCost Red", "Ally" },
						{ "RandomAdd", "VariableorExactCost Green", "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Big man on a Little Island, don't you think?"
	},
	["Galilea, Faithful Explorer"] = {
		Id = 15632307492,
		Name = "Galilea, Faithful Explorer",
		AltCards = {
			["Galilea, Faithful Explorer-C"] = {
				Id = 11344352669,
				Name = "Gryla",
				AttackEffect = "Maelstrom",
				Bio = "Wife to Leppaluoi, mother to the Yule Cat and the Yule Lads. Maker of Special Stews."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Yellow = 2, Green = 2, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Destroy your hand, then draw a card for each token fighter in your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "Token_Fighter", "Nil" },
							"Self"
						},
						{ "RandomDiscard", 10, "Ally" },
						{ "Draw", "Variable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The Farseekers needed illicit information regarding the very nature of Cothran itself, who to convince on a  life-threatening journey to fetch the samples? Adreti could sniff out the gullible."
	},
	["Cothran Diplomat"] = {
		Id = 10824082207,
		Name = "Cothran Diplomat",
		AltCards = {
			["Cothran Diplomat-E"] = {
				Name = "turnheadGodtech",
				Id = 79889810988903,
				AttackEffect = "Slash",
				Commissioner = { 41926915 },
				Bio = "There's nothing like fighting your older brother on the rooftops who occasionally starves you."
			}
		},
		Health = 1000,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 8, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon 3 Token fighters from your graveyard that each cost 6 or fewer total studs. Set the power of all allied fighters to 450.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{
								"Fighter_Token_6OrLower",
								"GraveZone_Ally",
								"Field_Ally",
								true,
								false,
								3
							},
							"Self"
						},
						{ "SetPower", 450 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Cothran's spirits coalesce around the strong descendants to guide them towards a more foreign territory: Diplomacy."
	},
	["Advisor of Wa-Pangu"] = {
		Id = 10824297897,
		Name = "Advisor of Wa-Pangu",
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2, Yellow = 2, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: All non-Token fighters lose 200 power. Then destroy all fighters with 0 power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Weaken", 200 },
						{
							"CheckPower",
							{ 0, 1 },
							"All"
						}
					},
					Target = "NotToken"
				}
			}
		},
		Bio = "\"I grieve for him, yes. But we intend to continue what he sought out to do, someway, somehow.\""
	},
	["Life Goes On"] = {
		Id = 10861012973,
		Name = "Life Goes On",
		AltCards = {
			["Life Goes On-Banner"] = {
				Id = 10853371197,
				Name = "Quiet Winds of New Robloxia",
				Bio = "The silence that would signify a Paraselene's job well done had only filled the cadet with a painful, sharp dread. Yet he could not introspect, even if he wished so. It was time to report back to Headquarters."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		EffectAnimation = "LifeGoesOn",
		Color = "Green",
		Cost = { Green = 2, Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate a target fighter.\nReplace each card in your deck with a copy of that fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Obliterate" },
						{ "ReplaceDeck", "Variable", "Ally" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "What's done has been done, and Yuéliáng knew the repercussions of her actions. She gave the orb of her staff to her protoge and requested a deed that would prevent the coming of the next freedom lock - Herself."
	},
	["Wa-Pangu, Essence of Cothran"] = {
		Id = 10445119069,
		Name = "Wa-Pangu, Essence of Cothran",
		AltCards = {
			["Wa-Pangu, Essence of Cothran-E"] = {
				Id = 12957250379,
				Name = "Eostre",
				AttackEffect = "MagicGreen",
				Bio = "Goddess of Spring, this event's namesake originated from her."
			},
			["Avery, Moving Shadow"] = {
				Id = 17107614388,
				Name = "Avery, Moving Shadow",
				PremiumArt = 250,
				AltArt = true,
				AttackEffect = "Gun",
				Bio = "I will never be decieved; I'm a girl who sees through lies."
			}
		},
		Health = 700,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 6, Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a token Fighter: It gains 200 Health.\nWhenever you cast a token Action: You gain 2{W}{G}.",
			Ability = {
				OnAllySummon = {
					Power = { { "Heal", 200 } },
					Target = "Aggressor",
					Rarity = "Token"
				},
				OnAllyCast = {
					Power = {
						{ "Green", 2 },
						{ "Neutral", 2 }
					},
					Target = "Ally",
					Rarity = "Token"
				}
			}
		},
		Bio = "Billions of souls screeched across the lands for a hero to help tame the spiritually charged planet, Wa-Pangu answered."
	},
	["Katharan Mentor"] = {
		Id = 10824263152,
		Name = "Katharan Mentor",
		Health = 300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Green = 3, Red = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Obliterate a target allied fighter and all copies of it from all your zones. All allied fighters gain 200 health and power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Extract" },
						{ "Heal", 200, "Ally" },
						{ "Strengthen", 200, "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "The people of Kathara had experienced the worst kind of tyranny. Their lessons proved invaluable for the people of Javion to last against the onslaught of Rageborne."
	},
	["Cothran Treant"] = {
		Id = 10856006401,
		Name = "Cothran Treant",
		AltCards = {
			["Cothran Treant-C"] = {
				Name = "Pinetreant",
				Id = 15252288385,
				Bio = "The spirits of Cothran would often possess trees, spurring them into life and into defending their forests."
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Scratch",
		EffectAnimation = "MidScratchEffect",
		Color = "Red",
		Cost = { Green = 3, Red = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Deal 600 damage to a target allied fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 600 } },
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Only four of these sentient treefolk managed to escape Cothran's destruction. The grief over their fallen kind can only be described as a melancholic creaking."
	},
	["Mob Mentality"] = {
		Id = 10824093810,
		Name = "Mob Mentality",
		AltCards = {
			["Mob Mentality-C"] = {
				Name = "Gift Exchange",
				Id = 11435975644,
				Bio = "<i>I wonder what's inside.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Lunar = true,
		HideArchetype = "True",
		Cost = { Red = 1 },
		Requirement = { "Board", "Ally", 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Cast only if there's an allied fighter.\nDeal 350 damage to a target allied fighter and 350 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 350, "SingleAlly", nil, nil, "ThrowBottle" },
						{ "Damage", 350, "SingleEnemy", nil, nil, "ThrowBottle" }
					},
					Target = "Self",
					UniqueTargets = true
				}
			}
		},
		Bio = "When the crowd is angry, it's hard to think for yourself."
	},
	["Local Vigilante"] = {
		Id = 132587302064223,
		Name = "Local Vigilante",
		AltCards = {
			["Local Vigilante-Sun"] = {
				Id = 17717383568,
				Name = "Pro Bass Fisherman",
				AttackEffect = "Punch",
				Bio = "Oh! A big one!"
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Green = 1, Red = 1, Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever an allied fighter dies: This card gains 100 Health and Power.",
			Ability = {
				OnAllyDeath = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "As Yuéliáng ventured forth into the Caishen, Lua quickly took action to secure the last remaining untranformed locals. A few brave ones opted to help out, despite their injuries."
	},
	homermafia1 = {
		Id = 116746227041183,
		Name = "homermafia1",
		AltCards = {
			["homermafia1-Offer"] = {
				Id = 121395676148549,
				Summonant = "Rebel-Offer",
				Bio = "Why you little!"
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Color = "Red",
		Summonant = "Rebel",
		Cost = { Red = 3, Neutral = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks and destroys another: Summon a 300/300 Rebel that's inert in all zones.\nWhenever an allied fighter dies: Your opponent loses 200 life.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				},
				OnAllyDeath = {
					Power = { { "Inflict", 200, "Opponent" } }
				}
			}
		},
		Bio = "What are otherworldly beings and highly skilled killers going to do against a heavy heaping of bullets? Nothing, that's what."
	},
	["Cothran Brewer"] = {
		Id = 10824367264,
		Name = "Cothran Brewer",
		AltCards = {
			["Cothran Brewer-AN"] = {
				Id = 13697388441,
				Name = "Chef Gecko",
				AttackEffect = "Knife",
				Addant = "Witches' Brew-Gecko-AN",
				Effect = {
					Description = "When this card is cast: Give yourself a Midas-Touched Meal."
				},
				Bio = "<i>Gold flakes, before all else.</i>"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Swamp",
		Color = "Red",
		Addant = "Awful Good",
		Cost = { Neutral = 4 },
		CustomReminder = {
			["Witches' Brew"] = "A Green {G} action. It swaps a target fighter's stats."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Witches' Brew.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"Give me a drink, Sire!\""
	},
	["Unity of Rage"] = {
		Id = 10860952569,
		Name = "Unity of Rage",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Lunar = true,
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "Obliterate a target allied fighter. X is the total stats of that fighter.\nA second target fighter gains half of X Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "TotalStats", "Nil" }
						},
						{
							"AlterEV",
							{ "Divide", "Math", 2, "Nil" }
						},
						{
							"AlterEV",
							{ "StatRound", "Math", 50, "Nil" }
						},
						{ "Obliterate" },
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "SingleAlly"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", "Variable", "Single" },
						{ "Heal", "Variable", "Single" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "<i>Come together as one, Ye Rageborne, and spread the keys to the Apotheosis of Man.</i>"
	},
	["Planet Salvager"] = {
		Id = 10823756482,
		Name = "Planet Salvager",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Draw a card. Then deal 300 damage to all allied fighters. Draw an additional card for each allied fighter destroyed this way.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "DeathStorm", "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" },
							"Self"
						},
						{ "Draw", 1 },
						{ "Damage", 300 },
						{
							"AlterEV",
							{ "Add", "Playertable", "DeathStorm", "Nil" },
							"Self"
						},
						{ "Draw", "Variable" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "With most of the Vecross System destroyed, any remaining evidence of their history was invaluable."
	},
	marbleycake = {
		Id = 10457895417,
		Name = "marbleycake",
		AltCards = {
			["marbleycake-Hal"] = {
				Name = "The Figure",
				AttackEffect = "LycanScratch",
				Id = 114325172872123,
				Transformant = "marbleycakeToken-Hal",
				Bio = "",
				ReplaceCardArtant = { 114325172872123 },
				ReplaceBioant = ""
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		Transformant = "marbleycakeToken",
		EffectVariable = 0,
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast another fighter, if there's no gear on this card: Search your deck for a copy of it. You lose 300 life. Attach a gear to this card.",
			Type = "On|Other|AllySummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "CardIndexOriginal", "Nil" },
					"Aggressor"
				},
				{ "Tutorfor", "Variable" },
				{ "Cost", 300 },
				{
					"AlterEV",
					{ "Set", "Math", 0, "Nil" },
					"Self"
				},
				{ "EquipGear", "Exertion", "Self" },
				{
					"ReplaceCardArt",
					{ "Variable" },
					"Self"
				},
				{ "ReplaceBio", "ReplaceBioant", "Self" }
			},
			Target = "Ally",
			EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" }
		},
		ReplaceCardArtant = { 10457893433 },
		ReplaceBioant = "ZYOOM SPISH SLOSH YEAH BABY LETS GO ZIP DASH OH GOD OH GOD I MESSED UP THE JUMP I",
		Bio = "@Mods we need one more for hyper shot"
	},
	marbleycakeToken = {
		Id = 103698160697569,
		Name = "marbleycake",
		AltCards = {
			["marbleycakeToken-Hal"] = {
				Name = "The Figure",
				AttackEffect = "LycanScratch",
				Id = 114325172872123,
				Bio = ""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast a fighter: Search your deck for a copy of it. You lose 300 life. This effect triggers only once, and has already triggered.",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally",
			EffectTransformPreserveRarity = true
		},
		Bio = "ZYOOM SPISH SLOSH YEAH BABY LETS GO ZIP DASH OH GOD OH GOD I MESSED UP THE JUMP I"
	},
	NearlyDeath = {
		Id = 10861025943,
		Name = "NearlyDeath",
		AltCards = {
			["NearlyDeath-E"] = {
				Name = "Chocolate Seller",
				AttackEffect = "Jab",
				Id = 12957252709,
				Bio = ""
			}
		},
		Health = 150,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: A target fighter's rarity becomes token.",
			Ability = {
				OnSummon = {
					Power = { { "ReplaceRarity", "Token" } },
					Target = "Single"
				}
			}
		},
		Bio = "Alright, so I gotta write my name down on a paper, then scribble it? Then... Oh come ON!!"
	},
	["Sludgy Visitor"] = {
		Id = 10506513428,
		Name = "Sludgy Visitor",
		AltCards = {
			["Sludgy Visitor-Sun"] = {
				AttackEffect = "MagicYellow",
				Id = 13660817500,
				Bio = "\"Oooooghhhh!! It's simply SWELTERING out herez!!\""
			}
		},
		Health = 600,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever you cast a fighter: Its rarity becomes token.",
			Ability = {
				OnAllySummon = {
					Power = { { "ReplaceRarity", "Token" } },
					Target = "Aggressor",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "\"Oooooghhhh!! I r'ove having all these plushiez!!\""
	},
	["Tour Ship Stowaway"] = {
		Id = 10489147523,
		Name = "Tour Ship Stowaway",
		Health = 350,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Summonant = "Tourist",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Summon a 100/100 Tourist that's inert in play.",
			Ability = {
				OnDeath = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
				}
			}
		},
		Bio = "You'd think the authorities would be more forgiving of stowaways due to the recent ecocide. Unfortunately, it's a Javion-owned Tour Ship."
	},
	Planet3arth = {
		Id = 10445114691,
		Name = "Planet3arth",
		Health = 100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card dies: Search your deck for a Green card.",
			Ability = {
				OnDeath = {
					Power = { { "RandomTutorfor", "Green" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Who knew searching for brown fabric bricks can earn you eternal fortune?"
	},
	["Extraterrestrial Tourist"] = {
		Id = 10823731093,
		Name = "Extraterrestrial Tourist",
		AltCards = {
			["Extraterrestrial Tourist-Banner"] = {
				Id = 10853373682,
				Name = "Zoogli, Extraterrestrial Bigshot",
				AttackEffect = "Slash",
				Bio = "\"Zoogli win big! Zoogli'll be bigger than Biggs!\""
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Blue = 2, Yellow = 1, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Select a non-Colourless fighter card in your deck that costs 4 or more total studs. Put it into your baseplate, or search it if your baseplate rank is 8 or greater.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Ally", "All", "Nil" }
						},
						{ "EVGreaterValueCheck", 7 }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "GenZone_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true, Colored = true, CostOrMore = 4 },
						MaxTargets = 1,
						SelectionDescription = "a card to put into your baseplate"
					},
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Fighter = true, Colored = true, CostOrMore = 4 },
						MaxTargets = 1,
						SelectionDescription = "a card to put into your hand"
					},
					NoBlip = true
				}
			}
		},
		Bio = "\"Zoogli hear stories of gain! Zoogli and friends wish to claim gain!\""
	},
	["Tour Ship Pilot"] = {
		Id = 10860990803,
		Name = "Tour Ship Pilot",
		Health = 700,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All allied token fighters gain 150 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 150 },
						{ "Heal", 150 }
					},
					Target = "AllyToken"
				}
			}
		},
		Bio = "\"Welcome to the Vecross System! Home of six grea- oh wait, I meant two great planets. Whoops.\""
	},
	["The Caishen"] = {
		Id = 76822736302744,
		Name = "The Caishen",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Terrain = true,
		Terrariant = "Caishen Terrarian",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Stagefright, OPPONENT!!!",
			Description = "When allied effects have targeted 3 times this turn: Draw a card. Your opponent loses 400 life.",
			Type = "OnAnyTrigger",
			Power = {
				{ "Draw", 1 },
				{ "Inflict", 400, "Opponent" }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 3, 4, "TargetCount" },
			TurnTriggerLimit = 1
		},
		Bio = "A shady harbor of resentment and gold, don't look directly at people for too long lest you get yourself mugged or worse: offered a deal."
	},
	Roxapox = {
		Id = 10337542330,
		Name = "Roxapox",
		AltCards = {
			["Roxapox-Alt"] = {
				Id = 15055122160,
				Name = "R0XAP0X",
				AttackEffect = "Paintball",
				AltArt = true,
				PremiumArt = 137,
				Commissioner = { 1280103205, 39475023, 185152017 },
				Effect = {
					Name = "Haydoscale",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Red Memory" },
								{ "Add", "Blue Memory" },
								{ "Add", "Green Memory" },
								{ "Add", "Yellow Memory" }
							},
							Target = "Ally"
						}
					}
				},
				Bio = "Let me paint you a picture!"
			},
			["Roxapox-ET"] = {
				Id = 16446077061,
				Name = "Cruizictant Auteur",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				AttackEffect = "Paintball",
				Effect = {
					Name = "Haydoscale",
					Ability = {
						OnSummon = {
							Power = {
								{ "Add", "Art of War" },
								{ "Add", "Art of Expansion" },
								{ "Add", "Art of Discovery" },
								{ "Add", "Art of Culture" }
							},
							Target = "Ally"
						}
					}
				},
				Bio = "Painting is similar to combat strategy. You're going to want to plan out your moves well, lest you end up with a horrific massacre."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Paintball",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		CustomReminder = {
			["Colour Paint"] = "A free action, inert when discarded. It makes a target fighter its colour and stops you casting actions this turn."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself Red Paint, Green Paint, Blue Paint, and Yellow Paint.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Red Paint" },
						{ "Add", "Blue Paint" },
						{ "Add", "Green Paint" },
						{ "Add", "Yellow Paint" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Biggs isn't exactly gifted in the field of design. Thankfully, his wealth can substitute for that problem."
	},
	["Red Paint"] = {
		Id = 10337526822,
		Name = "Red Paint",
		AltCards = {
			["Red Memory"] = {
				Id = 15121302118,
				Name = "Red Memory",
				Bio = "A sweet beverage that resonates a bitter recollection."
			},
			["Art of War"] = {
				Id = 16446075249,
				Name = "Art of War",
				Bio = "in an ideal world, i would not bother reminiscing on the past. but it's better to face it head on rather than ignoring the phantoms of what came after"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "MidPaintballRedEffect",
		Color = "Red",
		TokenDiscard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "A target allied fighter becomes Red. Remove all inertia from it.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ReplaceColor", "Red" },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = ""
	},
	["Blue Paint"] = {
		Id = 10337530193,
		Name = "Blue Paint",
		AltCards = {
			["Blue Memory"] = {
				Id = 15579857625,
				Name = "Blue Memory",
				Bio = "The most prized possession; though it's completely worthless to collectors."
			},
			["Art of Discovery"] = {
				Id = 16446075406,
				Name = "Art of Discovery",
				Bio = "a mekkai friend of mine loves to travel. it's wonderful curiosity on their end, but i do enjoy joining their side from time to time. helps me reflect"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "MidPaintballBlueEffect",
		Color = "Blue",
		TokenDiscard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "A target allied fighter becomes Blue. Remove all inertia from it.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ReplaceColor", "Blue" },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = ""
	},
	["Green Paint"] = {
		Id = 10337537027,
		Name = "Green Paint",
		AltCards = {
			["Green Memory"] = { Id = 15121301988, Name = "Green Memory", Bio = "Hair scrunchy...?" },
			["Art of Expansion"] = {
				Id = 16446075325,
				Name = "Art of Expansion",
				Bio = "simple painting commission for zoogli. looking back, he was the celebrity catalyst for the growing cultural connection between planets. maybe i should thank him for that one day"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "MidPaintballGreenEffect",
		Color = "Green",
		TokenDiscard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "A target allied fighter becomes Green. Remove all inertia from it.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ReplaceColor", "Green" },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = ""
	},
	["Yellow Paint"] = {
		Id = 10337537993,
		Name = "Yellow Paint",
		AltCards = {
			["Yellow Memory"] = {
				Id = 15121301585,
				Name = "Yellow Memory",
				Bio = "The amount of salt and cholesterol this toast has will surely bring you to yesteryear."
			},
			["Art of Culture"] = {
				Id = 16446075479,
				Name = "Art of Culture",
				Bio = "despite my misgivings, i'd be amiss not to acknowledge the rivinne's taste for fashion and flair. kawamura's an utter jerk though"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		EffectAnimation = "MidPaintballYellowEffect",
		Color = "Yellow",
		TokenDiscard = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Haydoscale",
			Description = "A target allied fighter becomes Yellow. Remove all inertia from it.\nYou can't cast actions this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "ReplaceColor", "Yellow" },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = ""
	},
	["The Lunar Spire"] = {
		Id = 75271436292880,
		Name = "The Lunar Spire",
		AltCards = {
			["The Lunar Spire-C"] = {
				Id = 11260672480,
				Name = "The North Pole",
				Summonant = "The Lunar Spire Token-C",
				Bio = "Good luck finding it, there's at least 4, depending on your definition."
			},
			RIGMAXXING = {
				Id = 106710394929391,
				Name = "RIGMAXXING",
				AttackEffect = "Jab",
				Summonant = "TNTina",
				Bio = "RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG RIG",
				AltArt = true,
				PremiumArt = 306
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Summonant = "The Lunar Spire Token",
		Color = "Yellow",
		Cost = { Neutral = 8, Yellow = 1 },
		TriggerInHand = true,
		EffectVariable = 0,
		CustomReminder = {
			["Lunar Spire"] = "During your end step: All allied token fighters gain 150 Health and Power."
		},
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "This card costs {W} less for each allied token fighter.\nSummon the Lunar Spire, a 1200/0 Fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Summon", "Summonant" } },
					Target = "Ally"
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
							{ "Set", "Field_Ally", "Token", "Nil" }
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
		Bio = "Home of the Caishen. Pride of Javion. Any resemblance to a certain other tower is purely coincidental."
	},
	["The Lunar Spire Token"] = {
		Id = 75641462096777,
		Name = "The Lunar Spire",
		AltCards = {
			["The Lunar Spire Token-C"] = {
				Id = 11264406745,
				Name = "The North Pole",
				AttackEffect = "Blizzard",
				Bio = "Good luck finding it, there's at least 4, depending on your definition."
			},
			["Keeberry Token"] = {
				Id = 16738206158,
				Name = "Keeberry",
				Bio = "These donuts are great, jelly filled are my favorite."
			},
			TNTina = {
				Id = 75734856358512,
				Name = "TNTina",
				Bio = "GET OUT OF THE WAY!!!! YOU'RE USELESS"
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 12, Yellow = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "During your end step: All allied token fighters gain 150 health and power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Strengthen", 150 },
						{ "Heal", 150 }
					},
					Target = "AllyToken"
				}
			}
		},
		Bio = "Home of the Caishen. Pride of Javion. Any resemblance to a certain other tower is purely coincidental."
	},
	["Dyna Cowsmasher"] = {
		Id = 10856813388,
		Name = "Dyna Cowsmasher",
		AltCards = {
			SCP2Y = {
				Id = 10856814079,
				Bio = "Despite having strength unrivaled, she wishes to lift an entire mountain with one hand some day."
			},
			["Dyna Cowsmasher-Banner"] = {
				Id = 13496255336,
				Bio = "\t\t\t\tThe sun is out, burning bright.\n\t\t\t\tEnjoying today with all your might.\n\t\t\t\tFor in the end, what will remain?\n\t\t\t\tBut a hazy nostalgia that one retains.\n\t\t\t\t"
			},
			["Dyna's Cow"] = {
				Name = "Dyna's Cow",
				Id = 16446076896,
				AltArt = true,
				PremiumArt = 226,
				Bio = "Moo."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Archetype = "Cow",
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "While in play, allied Cow fighters deal 2000 more effect damage. ",
			Ability = {
				OnSummon = {
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Not to be confused with Dino Cowhater, her less enthusiastic and more primitive brother."
	},
	Cow = {
		Id = 129493726189522,
		Name = "Cow",
		AltCards = {
			Vengeful_Cow = {
				Id = 96807344906959,
				Name = "Vengeful_Cow",
				AttackEffect = "Electric",
				AltArt = true,
				Bio = "100 bread is truly frightening"
			},
			["Cow-AN"] = {
				Id = 9352967830,
				Name = "TheVoid_MOOF",
				AttackEffect = "Slash",
				Bio = "MOOF."
			},
			["Cow-Nurture"] = {
				Id = 13822683424,
				Name = "Cow",
				Rarity = "Token",
				AttackEffect = "Bite"
			},
			["Nena and Cacao"] = {
				Id = 76536139914006,
				NurtureArt = 76536139914006,
				Name = "Nena and Cacao",
				Rarity = "Token",
				AttackEffect = "Bite"
			}
		},
		Health = 900,
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
		IsFood = true,
		Bio = "Why are you a co - MOO!"
	},
	["Cow God"] = {
		Id = 10184376170,
		Name = "Cow God",
		AltCards = {
			["DA-GAH-MA"] = {
				Id = 15941935487,
				Name = "DA-GAH-MA",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 198,
				Bio = "I AM <b><font color=\"#FF0000\">DA</font></b>-<b><font color=\"#0000FF\">GAH</font></b>-<b><font color=\"#008000\">MA</font></b>. IT'S A PLEASURE FOR ME TO SEE A HUMAN BEING CREATURE HERE. WELCOME. I AM THE RULER AND CREATOR OF THE SLIDE. WATCH YOUR STEP AS YOU CONTINUE, THERE ARE SEVERAL OBSTACLES. ON YOUR PATH."
			},
			["Cow God-E-Offer"] = {
				Name = "Malhare",
				Id = 17014188189,
				ArtAnimation = "Jimmy",
				Bio = "YOU ARE AN IDIOT!! HA HA HA HA HA HA HA"
			}
		},
		Health = 1300,
		Power = 1300,
		AttackEffect = "Punch",
		Cost = { Neutral = 13 },
		Rarity = "Legendary",
		Color = "Neutral",
		EffectVariable = 0,
		Archetype = "Cow",
		SummonAnimation = "CowMoo",
		DeathAnimation = "CowGone",
		EffectAnimation = "CowBuff",
		Overload = true,
		Effect = {
			Name = "MOO!",
			Description = "When this card is cast: It deals 1 damage to all enemy fighters.",
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
							{ "Add", "Math", 1, "Nil" }
						},
						{ "Damage", "Variable", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Hmph."
	},
	["Fluffle & Soul, Life Debtors"] = {
		Id = 10348257905,
		Name = "Fluffle & Soul, Life Debtors",
		AltCards = {
			["Ambush, The Unwavering"] = {
				Id = 15804644735,
				Name = "Ambush, The Unwavering",
				AltArt = true,
				PremiumArt = 178,
				Bio = "\"I WILL NOT FALTER! RAHHHHHHHHH!\""
			}
		},
		Health = 2000,
		Power = 2000,
		AttackEffect = "Punch",
		Cost = { Neutral = 2, Red = 10 },
		Rarity = "Legendary",
		BypassDeath = true,
		Color = "Neutral",
		EffectVariable = 0,
		Effect = {
			Name = "MOO!",
			Description = "You can't be banned.",
			Ability = {
				OnSummon = {
					Power = {
						{ "GivePassive", "BypassDeath" },
						{ "Draw", 0, "Ally" }
					},
					Target = "Self"
				},
				OnDeathBypass = {
					Power = {
						{ "RemovePassive", "BypassDeath" },
						{ "DeathCheck", "Drowned in Debt", "Ally" }
					},
					Target = "Self"
				},
				OnReturn = {
					Power = {
						{ "RemovePassive", "BypassDeath" },
						{ "DeathCheck", "Drowned in Debt", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Not everyone who steps into the Caishen ends up losing. For a few lucky individuals, they manage to truly win bigg against all odds. Others, well.. Getting in the way of two quadrillionaire demigods isn't exactly a fair matchup."
	},
	["Farseeker Researcher"] = {
		Id = 10445127772,
		Name = "Farseeker Researcher",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		Color = "Blue",
		Blessing = true,
		ModifierEldritch = true,
		AttackEffect = "Slash",
		Cost = { Neutral = 4 },
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing on the second and fourth card spaces in your hand.",
			Type = "OnSummon",
			Power = {
				{
					Power = "AddHandModifier",
					Increase = "EldritchBless",
					Target = "Self",
					MetaData = {
						SlotTargets = { 1 }
					}
				},
				{
					Power = "AddHandModifier",
					Increase = "EldritchBless",
					Target = "Self",
					MetaData = {
						SlotTargets = { 3 }
					}
				}
			},
			Target = "Self"
		},
		Bio = "\"Interesting... this sample seems to amplify certain emotions, especially anger... It's probably nothing too bad!\""
	},
	["Lua's Informant"] = {
		Id = 9513517974,
		Name = "Lua's Informant",
		Health = 200,
		Power = 800,
		Rarity = "Common",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Blue = 2 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "Whenever you discard a card: Put an Eldritch Blessing on a card in your hand.",
			Type = "OnAllyDiscard",
			Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
			Target = "Self"
		},
		Bio = "Lua gazed upon the Farseekers' expedition with skepticism. Javion's residents felt the same."
	},
	Pieperson50 = {
		Id = 10824092042,
		Name = "Pieperson50",
		Health = 350,
		Power = 500,
		Rarity = "Common",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Blue = 3 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing onto a card in your hand.\nWhenever you cast a card that uses up a blessing: This card gains 150 health.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
					Target = "Self"
				},
				OnAllySummonModified = {
					Power = { { "Heal", 150 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"Make a wish.\""
	},
	["Farseeker Expeditioner"] = {
		Id = 10445122614,
		Name = "Farseeker Expeditioner",
		Health = 650,
		Power = 650,
		Rarity = "Common",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Blue = 6 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing on the third card space in your hand.\nTwice each turn, whenever you cast a card that uses up a blessing: Draw a card.",
			Ability = {
				OnSummon = {
					Power = { {
						Power = "AddHandModifier",
						Increase = "EldritchBless",
						Target = "Self",
						MetaData = {
							SlotTargets = { 2 }
						}
					} },
					Target = "Self"
				},
				OnAllySummonModified = {
					Power = { { "Draw", 1, "Ally" } },
					Target = "Ally",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "Nothing like traversing a lunar sattelite with little to no oxygen supplies - not like they'll need them."
	},
	["Farseeker Trainee"] = {
		Id = 10856714880,
		Name = "Farseeker Trainee",
		Health = 400,
		Power = 400,
		Rarity = "Common",
		Color = "Blue",
		AttackEffect = "MagicGreen",
		Cost = { Neutral = 1, Blue = 3 },
		Blessing = true,
		ModifierAdreti = true,
		Effect = {
			Description = "When this card is cast: Put Adreti's Blessing on the ninth and tenth card space in your hand.",
			Type = "OnSummon",
			Power = {
				{
					Power = "AddHandModifier",
					Increase = "AdretiBless",
					Target = "Self",
					MetaData = {
						SlotTargets = { 8 }
					}
				},
				{
					Power = "AddHandModifier",
					Increase = "AdretiBless",
					Target = "Self",
					MetaData = {
						SlotTargets = { 9 }
					}
				}
			},
			Target = "Self"
		},
		Bio = "Farseekers that have yet to transmodify themselves, most of them are just eager geologists."
	},
	["Farseeker Minecart"] = {
		Id = 10445126409,
		Name = "Farseeker Minecart",
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Blue = 5, Neutral = 1 },
		Blessing = true,
		Effect = {
			Description = "Whenever you cast a card that uses up a blessing: Unlock this card.",
			Ability = {
				OnAllySummonModified = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				}
			}
		},
		Bio = "Due to the sheer unpredictability of the Moon's interiors, minecarts have been limited to a maximum speed of 20km/h."
	},
	["Moonstone Appraiser"] = {
		Id = 10861016378,
		Name = "Moonstone Appraiser",
		AltCards = {
			Xuanwu = {
				Id = 116987460727505,
				Name = "Xuanwu",
				Bio = "A most curious species of reptile, the Xuanwu live within crystal-heavy dwellings, they resemble a tortoise conjoined with a snake. Happy Year of the Snake 2025 by the way."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Rare",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Blue = 3, Green = 1 },
		Blessing = true,
		Effect = {
			Description = "Whenever a card you cast uses up a blessing: This card gains 200 health and power.",
			Ability = {
				OnAllySummonModified = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"It's shiny. I can tell you that much.\""
	},
	Aerideyn = {
		Id = 10824318770,
		Name = "Aerideyn",
		AltCards = {
			["Aerideyn-Hal"] = {
				Id = 14959554221,
				AttackEffect = "Jab",
				Name = "Sisyphus",
				Bio = "One must imagine monored players happy."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 3 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast, or when it dies: Put an Eldritch Blessing onto a card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Self"
				},
				OnDeath = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "To the Moon!"
	},
	["Apogee Visionary"] = {
		Id = 10824289332,
		Name = "Apogee Visionary",
		Health = 300,
		Power = 350,
		Rarity = "Uncommon",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Green = 1, Blue = 1 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast, if it wasn't cast from a blessed card space: Put an Eldritch Blessing on the space in your hand it was cast from. Draw a card, then put this card on top of your deck.",
			Ability = {
				OnSummonNotModified = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "Self" },
						{ "Draw", 1, "Ally" },
						{ "DeckAdd", "Apogee Visionary", "Ally" },
						{ "Obliterate" }
					},
					Target = "Self"
				}
			},
			EffectDeckAddToTop = true
		},
		Bio = "\"The operation regarding the expedition of the Moon had taken around three months so far. Development going well.\""
	},
	["Shimmering Moonstone"] = {
		Id = 10824325062,
		Name = "Shimmering Moonstone",
		AltCards = {
			["Xaire, Stargazer"] = {
				Id = 129632407586971,
				Name = "Xaire, Stargazer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 585,
				Bio = "Ironically she prefers watching the moon but any celestial body will do (other than the sun, don't look at that). "
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Neutral = 2, Blue = 2 },
		Blessing = true,
		ModifierEldritch = true,
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: It gains Defender if you have 3 or more blessings.\nIt gains 500 health if you have 5 or more blessings.\nIt gains 500 power if you have 7 or more blessings.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{ "EVGreaterValueCheck", 2 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "GivePassive", "Shield" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 4, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 500, "Nil" }
						},
						{ "Heal", "Variable" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 6, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 500, "Nil" }
						},
						{ "Strengthen", "Variable" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Oooh. Shiny. <i>Lunar</i> shiny."
	},
	["Perigree Visionary"] = {
		Id = 10824285165,
		Name = "Perigee Visionary",
		AltCards = {
			["TartarTartTartarus, Unspeakable Horror"] = {
				Id = 130185826233010,
				Name = "TartarTartTartarus, Unspeakable Horror",
				AttackEffect = "MagicBlue",
				AltArt = true,
				PremiumArt = 485,
				Bio = "The only thing in the entire known universe and far beyond it that my all-seeing eyes cannot see is why this card decided to bestow on me the title of ''Unspeakable Horror''. Like, my name isn't even that hard to pronounce?"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Blue",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		AttackEffect = "Slash",
		Cost = { Neutral = 3, Red = 1, Blue = 1 },
		ChargeRequirement = { "Playertable", "Me", 3, 99, "Modified Hand Slots" },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "If your hand has 3 or more blessings in it, this card has haste.\nWhenever this card attacks: Put an Eldritch Blessing on a card in your hand. Then draw a card if your hand has 3 or more blessings in it.",
			Ability = {
				OnAttack = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 2, "Nil" }
						},
						{ "Draw", "Variable", "Ally" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"These rocks may spell good fortune! I think?\""
	},
	["Farseeker Charter"] = {
		Id = 10938758963,
		Name = "Farseeker Charter",
		Health = 800,
		Power = 400,
		Rarity = "Common",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Blue = 4 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "During your end step: Put an Eldritch Blessing onto a card in your hand.",
			Ability = {
				OnEnd = {
					Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
					Target = "Self"
				}
			}
		},
		Bio = "The diameter of the fallen moon measured approximately 4,000,053 km. The charting of the expedition tunnels was a neccessity."
	},
	["Dark Side of the Moon"] = {
		Id = 10824101716,
		AltCards = {
			["Dark Side of the Moon-Mango"] = {
				Name = "Wrath's Solace",
				Id = 128814344850517,
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "For the first time in a long time, Wrath felt a small bit of peace in his life.... at the cost of anothers"
			}
		},
		Name = "Dark Side of the Moon",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Lunar = true,
		HideArchetype = "True",
		Color = "Blue",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Blue = 3 },
		Blessing = true,
		ModifierScintillant = true,
		Effect = {
			Description = "Search your deck for 2 action cards.\nPut a Scintillant Blessing on the first and second card spaces in your hand.\nShuffle the 2 oldest cards in your hand into your deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RandomTutorfor", "Action", "Ally" },
						{ "RandomTutorfor", "Action", "Ally" },
						{
							Power = "AddHandModifier",
							Increase = "ScintillantBless",
							Target = "Self",
							MetaData = {
								SlotTargets = { 0 }
							}
						},
						{
							Power = "AddHandModifier",
							Increase = "ScintillantBless",
							Target = "Self",
							MetaData = {
								SlotTargets = { 1 }
							}
						},
						{ "SpecificDiscard", 2, "AlliedLeftMostHand" },
						{ "SpecificDiscard", 2, "AlliedLeftMostHand" }
					},
					Target = "Ally"
				}
			},
			EffectSpecificDiscardShuffle = true
		},
		Bio = "Adreti saw the new world with glee, even though the new god had abandoned it. So he strived to become a fallen archangel."
	},
	rcouret = {
		Id = 10824408620,
		Name = "rcouret",
		AltCards = {
			["The Cucumber Man"] = {
				Id = 14039152430,
				AltArt = true,
				PremiumArt = 78,
				Name = "The Cucumber Man",
				AttackEffect = "Jab",
				Bio = "Often misinterpreted as a copy of a certain bodyshifted scientist, he knows how to bring out the true potential of veggies.\nUnfortunately, he can't fix his crippling osteoporosis"
			},
			["Solstice the Demonseeker"] = {
				Id = 15252291219,
				AltArt = true,
				PremiumArt = 152,
				Commissioner = { 297087291, 1406158017 },
				Name = "Solstice the Demonseeker",
				AttackEffect = "MagicGreen",
				Bio = "<font color=\"#FF0000\">SPELLBOUND IN A SEANCE WITH A NUMBING SILENCE TO SUMMON ITS END.</font> Silent planet - Anunnaki Pt. 1\n\"This is larger than anything ive dealt with before. I must go prepared.\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Neutral = 3, Green = 1 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing on 2 cards in your hand. Until your next end step, card effects can't destroy cards in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{ "BypassHandDestroy" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The power gap of the medieval ages was kind of ridiculous. Almost puts Lizard Orb X to shame."
	},
	["Saros Aligner"] = {
		Id = 10860985261,
		Name = "Saros Aligner",
		Health = 300,
		Power = 400,
		Rarity = "Common",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Green = 2 },
		Blessing = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing on a card in your hand.\nWhenever you cast a card that uses up a blessing: Put an Eldritch Blessing onto the slots adjacent to it.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
					Target = "Self"
				},
				OnAllySummonModified = {
					Power = { { "AddHandModifier", "EldritchBless", "AdjacentHandAggressor" } },
					Target = "Self"
				},
				OnAllyCastModified = {
					Power = { { "AddHandModifier", "EldritchBless", "AdjacentHandAggressor" } },
					Target = "Self"
				}
			}
		},
		Bio = "If the stars ain't aligned, then it ain't satisfactory."
	},
	["Palus Dredger"] = {
		Id = 10856560686,
		Name = "Palus Dredger",
		Health = 450,
		Power = 350,
		Rarity = "Common",
		Color = "Green",
		AttackEffect = "Swamp",
		Cost = { Neutral = 3 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing on the 3rd card space in your hand.\nWhen this card is cast from a blessed card space: Put a Green Stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "EldritchBless", "Self" } },
					MetaData = {
						SlotTargets = { 2 }
					},
					Target = "Self"
				},
				OnSummonModified = {
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
				}
			}
		},
		Bio = "A reservoir of this stuff can be difficult to navigate. Nothing too hard for a group of interested geologists, though."
	},
	["Farseeker Guardsman"] = {
		Id = 10824261861,
		Name = "Farseeker Guardsman",
		Health = 1200,
		Power = 0,
		Rarity = "Uncommon",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Green = 1 },
		Blessing = true,
		ModifierEldritch = true,
		TriggerInHand = true,
		Effect = {
			Description = "Whenever this card attacks or is attacked and survives: Put an Eldritch Blessing onto a card in your hand.\nDuring your end step, if this card is in your hand in a blessed card space: It gains 200 Power.",
			Ability = {
				OnAttack = {
					Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
					Target = "Self"
				},
				OnAttacked = {
					Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
					Target = "Self"
				},
				OnEnd = {
					Power = { {
						"Strengthen",
						200,
						"Self",
						nil,
						nil,
						nil,
						"BattleaxeSelf"
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 9999, "InModifiedSlot" }
				}
			}
		},
		Bio = "\"Sorry, buddy. We're too busy looking at a rock to allow any visitors without a permit or identification. Now, move on.\""
	},
	["Ephemeris Seeker"] = {
		Id = 10489084309,
		Name = "Ephemeris Seeker",
		AltCards = {
			["Astro, Party Pooper"] = {
				Id = 94210891728559,
				Name = "Astro, Party Pooper",
				AttackEffect = "Gravity",
				AltArt = true,
				PremiumArt = 495,
				Bio = "Happy birthday Astro!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Green = 5 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "Whenever this card attacks: You gain 600 life. Put an Eldritch Blessing on a card in your hand.\nWhen this card is cast from a blessed space: Search your deck for a copy of it.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Cost", -600 },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Ally"
				},
				OnSummonModified = {
					Power = { { "Tutorfor", "Ephemeris Seeker" } },
					Target = "Ally"
				}
			}
		},
		Bio = "\"So like, this Moon stuff? Pretty rad.\""
	},
	["Regent of Warped Mud"] = {
		Id = 10824356058,
		Name = "Regent of Warped Mud",
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Swamp",
		Color = "Green",
		EffectVariable = 0,
		Blessing = true,
		ModifierEldritch = true,
		Transformant = "Mudtide Lurker-T",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: Put an Eldritch Blessing on the card space it was cast from.\nWhenever you cast a card that uses up a blessing, if there's no gear on this card: This card gains 150 Health and Power for each card before the blessed space in your hand. Attach a gear to this card.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "EldritchBless", "Self" } },
					Target = "Self"
				},
				OnAllySummonModified = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "HandOrigin", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "Self" },
						{ "Strengthen", "Variable", "Self" },
						{ "EquipGear", "Exertion", "Self" }
					},
					EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" },
					Target = "Aggressor"
				},
				OnAllyCastModified = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "HandOrigin", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 150, "Nil" },
							"Self"
						},
						{ "Heal", "Variable", "Self" },
						{ "Strengthen", "Variable", "Self" },
						{ "EquipGear", "Exertion", "Self" }
					},
					EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" },
					Target = "Aggressor"
				}
			}
		},
		Bio = "Bubbles boil on the wet soil near the Drilling operation. None of the locals took notice, till they saw animal bones floating about. "
	},
	["Lunar Drilling Operation"] = {
		Id = 10886152690,
		Name = "Lunar Drilling Operation",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Green",
		Terrain = true,
		Terrariant = "Lunar Drilling Terrarian",
		Cost = { Green = 4, Neutral = 1 },
		Addant = "Exotic Specimen",
		Blessing = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever a card you cast uses up a blessing: Give yourself a 400/400 Exotic Specimen with no abilities. It costs {G} to cast.",
			Ability = {
				OnAllyClean = {
					Power = { { "Add", "Addant" } },
					Target = "Ally",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "A safe haven, secluded from the erratic politics of Inner Javion. Filled with many aspiring geologists and explorers."
	},
	["Farseeker Tent Formation"] = {
		Id = 10860979381,
		Name = "Farseeker Tent Formation",
		AltCards = {
			["Average Bird Watcher"] = {
				Id = 114746065421844,
				Name = "Average Bird Watcher",
				AltArt = true,
				Bio = "why did i get up here"
			}
		},
		Health = 1200,
		Power = 2400,
		Rarity = "Rare",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Green = 8 },
		Blessing = true,
		Effect = {
			Description = "When you discard this card from a blessed space: Put it into your baseplate. A target fighter loses 300 power.",
			Ability = {
				OnModifiedDiscard = {
					Power = {
						{
							"AddGenZone",
							{ "Farseeker Tent Formation", 1 }
						},
						{ "Weaken", 300, "Single" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Faith is a fickle thing. You need others to uphold that faith alongside you."
	},
	["Moonlit Fauna"] = {
		Id = 10860981351,
		Name = "Moonlit Fauna",
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Green = 3 },
		Blessing = true,
		Effect = {
			Description = "During your end step: Each fighter in your hand on a blessed space gains 100 Health and Power.",
			Ability = {
				OnEnd = {
					Power = {
						{ "Heal", 100 },
						{ "Strengthen", 100 }
					},
					Target = "BlessedAllyHand"
				}
			}
		},
		Bio = "The light that emanated from the Moon seemed to be a catalyst for the growth of local fauna. Would be cool if it wasn't for the whole Rageborne shtick, eh?"
	},
	["Adreti, Farseeker Chieftain"] = {
		Id = 10859931410,
		Name = "Adreti, Farseeker Chieftain",
		AltCards = {
			["Adreti, Farseeker Chieftain-Hal"] = {
				Id = 14556089998,
				Name = "Zaunu Nichihaku",
				AttackEffect = "MagicGreen",
				Bio = "0nce a virtuous human monk, she sought after greater power. Now she is a demon sitting on top of a mountain of skulls within the underworld but she retained some of her humanity despite that."
			},
			["Rifo n' Sprite"] = {
				Id = 105525801261342,
				Name = "The Maddened",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 189,
				Bio = "Fall."
			},
			["Asino, Painted by Perception"] = {
				Id = 79505567120152,
				Name = "Triad;",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 460,
				Bio = "\"If you try hard enough <br/>anythng is possible. <br/>Keep your head up, <br/>we'll be right behind you!\""
			},
			["Adreti, Farseeker Chieftain-Collectors"] = {
				Id = 126466597521046,
				AttackEffect = "MagicGreen",
				Bio = "\"You see their tide of anger as a threat, I see it as an opportunity.\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Green = 8 },
		Blessing = true,
		ModifierSidereal = true,
		Effect = {
			Description = "When this card is cast: Put a Sidereal Blessing on the third and fifth card spaces in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							Power = "AddHandModifier",
							Increase = "SiderealBless",
							Target = "Self",
							MetaData = {
								SlotTargets = { 2 }
							}
						},
						{
							Power = "AddHandModifier",
							Increase = "SiderealBless",
							Target = "Self",
							MetaData = {
								SlotTargets = { 4 }
							}
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"I'm terribly sorry, Yuéliáng, but their lives are the only thing keeping me alive. How can the Farseekers thrive without a leader?\""
	},
	["Javion Rebels"] = {
		Id = 107551816977787,
		Name = "Javion Rebels",
		Health = 200,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Bottle",
		Color = "Red",
		Cost = { Red = 1 },
		EffectVariable = 0,
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: It deals 150 damage to a target enemy fighter. Put an Eldritch Blessing on the card space this was cast from.\nWhenever this card is cast from a blessed space: It deals 150 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AddHandModifier", "EldritchBless", "Self" },
						{ "Damage", "150", "SingleEnemy", nil, nil, "ThrowBottle" }
					},
					Target = "Self"
				},
				OnSummonModified = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{ "Damage", "150", "SingleEnemy", nil, nil, "ThrowBottle" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Javion's rampant tourism brought great wealth to the park's authorities, at the sacrifice of the locals' homes."
	},
	["Enraged Mob"] = {
		Id = 10445472443,
		Name = "Enraged Mob",
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: If you have 3 more blessings, it gains 500 power. Then put a Eldritch Blessing onto the sixth card slot in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{ "EVGreaterValueCheck", 2 },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Self",
					MetaData = {
						SlotTargets = { 5 }
					}
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 500 } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "\"Get that rock out of this planet instead of playing around with it, for brick's sake!\""
	},
	["Raging Ransacker"] = {
		Id = 10824277692,
		Name = "Raging Ransacker",
		AltCards = {
			["Raging Ransacker-Banner"] = {
				Id = 11675000730,
				Name = "Robo-Raging Santa",
				AttackEffect = "Slash",
				Bio = "Same day delivery? No problem."
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Common",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Red = 6 },
		Blessing = true,
		Effect = {
			Description = "When this card is cast, if you have 3 or more blessings: Deal 450 damage to a target enemy fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 450, "SingleEnemy" } },
					Target = "Self",
					UniqueTargets = true,
					EffectRequirement = { "Playertable", "Me", 3, 99, "Modified Hand Slots" }
				}
			}
		},
		Bio = "Most people saw the Rageborne as a threat. A select few saw them as an opportunity."
	},
	Zephu = {
		Id = 125710996172956,
		Name = "Reunion Remnant",
		AltCards = {
			["Zephu-AN"] = {
				Id = 13669413949,
				Name = "666",
				AttackEffect = "MoltenScythe",
				Bio = "GO TO INFERNO GO DIRECTLY TO PURGATORY DO NOT REPENT DO NOT BEG FOR MERCY"
			}
		},
		Health = 50,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Red = 1 },
		Blessing = true,
		Effect = {
			Description = "When this card is cast, if you have 3 or more blessings: Unlock it. It gains 500 Power.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Strengthen", 500 }
			},
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 3, 99, "Modified Hand Slots" }
		},
		Bio = "With his ire absolute to the loss of his lavish life, he was consumed by the flood of rage."
	},
	["Essence Brewer"] = {
		Id = 10824244304,
		Name = "Essence Brewer",
		Health = 600,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Swamp",
		Color = "Red",
		Cost = { Red = 3 },
		Blessing = true,
		EffectVariable = 0,
		Effect = {
			Description = "During your end step: Set the power of all allied fighters to 0, then all allied fighters gain 200 Power for each blessing you have.",
			Type = "OnEnd",
			Power = {
				{ "SetPower", 0 },
				{
					"AlterEV",
					{ "Set", "Playertable", "ModifiedHandSlots", "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 200, "Nil" },
					"Self"
				},
				{ "Strengthen", "Variable" }
			},
			Target = "Ally"
		},
		Bio = "\"Honestly, this green stuff tastes really good! Doubted Adreti the first time he pressured us to take some, but for some reason I'm kinda into it!\""
	},
	["Rebel Stockpile"] = {
		Id = 14693501769,
		Name = "Rebel Stockpile",
		AltCards = {
			["Rebel Stockpile-Hal"] = {
				Id = 104674321621528,
				Name = "RED ROOM RASCALS",
				Effect = {
					Description = "When this card is cast: Put an Eldritch Blessing onto 2 cards in your hand, then give yourself 3 choices —\n🅐 Summon a 300/300 Rebel that's inert in all zones.\n🅑 Set the power of a target allied fighter to 400.\n🅒 You lose 700 life. Draw a card.",
					Type = "OnSummon",
					Power = {
						{ "Add", "Pamphlets of Triumphs-Hal", "Ally" },
						{ "Add", "Armaments of Armageddon-Hal", "Ally" },
						{ "Add", "Maps of Malice-Hal", "Ally" },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Self"
				},
				Bio = "Treasure hunters doomed to wander the manor. They will take anything with spiritual value, whether it be hacker summoning books or candles that transfer souls."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Neutral = 4, Red = 1 },
		Blessing = true,
		ModifierEldritch = true,
		Effect = {
			Description = "When this card is cast: Put an Eldritch Blessing onto 2 cards in your hand, then give yourself 3 choices —\n🅐 Summon a 300/300 Rebel that's inert in all zones.\n🅑 Set the power of a target allied fighter to 400.\n🅒 You lose 700 life. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Pamphlets of Triumphs", "Ally" },
				{ "Add", "Armaments of Armageddon", "Ally" },
				{ "Add", "Maps of Malice", "Ally" },
				{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" },
				{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
			},
			Target = "Self"
		},
		Bio = "A pretty large mob just over a rock."
	},
	["Pamphlets of Triumphs"] = {
		Id = 121476503382484,
		Name = "Pamphlets of Triumphs",
		AltCards = {
			["Pamphlets of Triumphs-Hal"] = {
				Id = 108969581851918,
				Name = "RED ROOM RITUAL",
				Bio = "I got it! We can use a summoning ritual to get us out of here! This must be the book those weirdos in hoods used to summon Lezus...",
				Summonant = "Rebel-Hal"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 0 },
		TokenDiscard = true,
		Summonant = "Rebel",
		Archetype = "Crystal",
		Effect = {
			Description = "Summon a 300/300 Rebel that's inert in play.\nDestroy all Choice in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant", "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Armaments of Armageddon"] = {
		Id = 104937445714909,
		Name = "Armaments of Armageddon",
		AltCards = {
			["Armaments of Armageddon-Hal"] = {
				Id = 79728145637491,
				Name = "Robinhood's Candle",
				Bio = "I'd be careful with that if I were you, if you have a strong soul you'd be drained. If ya don't... you'd feel great."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 0 },
		TokenDiscard = true,
		Summonant = "Rebel",
		Archetype = "Crystal",
		Effect = {
			Description = "Set the power of a target allied fighter to 400.\nDestroy all Choices in your hand.",
			Type = "OnSummon",
			Power = {
				{ "SetPower", 400, "SingleAlly" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Self"
		},
		Bio = ""
	},
	["Maps of Malice"] = {
		Id = 90793426266805,
		Name = "Maps of Malice",
		AltCards = {
			["Maps of Malice-Hal"] = {
				Id = 124410941290194,
				Name = "Eye of the House",
				Bio = "This orb can make you see everything inside andout of this house at the cost of your soul. It's basically free if you've never had one."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 0 },
		TokenDiscard = true,
		Summonant = "Bruh",
		Archetype = "Crystal",
		Effect = {
			Description = "You lose 700 life.\nDraw a card.\nDestroy all Choices in your hand.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 700 },
				{ "Draw", 1, "Ally" },
				{ "ArchetypeDiscard", 999, "Ally", "Crystal" }
			},
			Target = "Self"
		},
		Bio = ""
	},
	Rebel = {
		Id = 114852276356316,
		Name = "Rebel",
		AltCards = {
			["Rebel-Offer"] = { Id = 12358382402, AttackEffect = "Bat", Bio = "Eat pant" },
			["Rebel-Hal"] = {
				Id = 98975527675067,
				Name = "C00LKIDD?",
				AttackEffect = "Jab",
				Bio = "who the heck is this freak?!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Bat",
		Color = "Red",
		Cost = { Neutral = 4 },
		TokenOmni = true,
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Down with the Biggs! The Bigger they are, the Bigger they fall!"
	},
	["Blood Moon Seeker"] = {
		Id = 10824097529,
		Name = "Blood Moon Seeker",
		AltCards = {
			["Crimson Soul Dairing"] = {
				Name = "Crimson Soul Dairing",
				Id = 10980815878,
				AltArt = true,
				Bio = "Ow the edge!"
			}
		},
		Health = 800,
		Power = 900,
		Rarity = "Uncommon",
		AttackEffect = "DoomStorm",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Playertable", "Me", 3, 99, "Modified Hand Slots" },
		Blessing = true,
		ModifierEldritch = true,
		Overload = true,
		Effect = {
			Description = "If you have 3 or more Blessings, cast this ignoring its {W} cost.\nWhenever this card attacks: Put an Eldritch Blessing onto a card in your hand.",
			Type = "OnAttack",
			Power = { { "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" } },
			Target = "Self"
		},
		Bio = "\"This Moon... I feel as if it calls to something inside me, something dormant, something powerful... I wish to claim it!\""
	},
	["Drake, Vengeful Lover"] = {
		Id = 15610406070,
		Name = "Drake, Vengeful Lover",
		AltCards = {
			["Drake, Vengeful Lover-Offer"] = {
				Id = 12325935563,
				Name = "Drake, Vindictive Widower",
				Bio = "\"And his rage swept the lands, unable to feel his beloved's touch again.\""
			},
			["The Ballad of D'Claude"] = {
				Id = 122141722564130,
				Name = "The Ballad of D'Claude",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 744,
				Bio = "now i'm cool as a pea in a puddle of glee and it all came to me SO NATURALLY!"
			},
			["Drake, Vengeful Lover-Collectors"] = {
				Id = 135605250422726,
				Name = "A Lover's Vengeance",
				Bio = "Even if it leads to nothing, I will erase everything."
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Red = 3 },
		Blessing = true,
		ModifierVengeful = true,
		Effect = {
			Description = "During your end step: Put a Vengeful Blessing onto a card in your hand.",
			Ability = {
				OnEnd = {
					Power = { { "AddHandModifier", "VengefulBless", "RandomAllyHand" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Losing money is temporary, a close one - forever. Javion's authorities learnt how this would affect their sales the hard way."
	},
	["Slumbering Colossus"] = {
		Id = 10824336786,
		Name = "Slumbering Colossus",
		AltCards = {
			["Slumbering Colossus-C"] = {
				Name = "Abominable Snowball",
				Id = 11344359893,
				Bio = "He outgrew his name."
			},
			["Rich McMoneybags, Gilded Iconoclast"] = {
				Name = "Rich McMoneybags, Gilded Iconoclast",
				AltArt = true,
				PremiumArt = 64,
				Id = 13822696840,
				Commissioner = { 3512345981, 13128371 },
				Bio = "\"The Company: the cold, grey husk at the heart of This Place. I better get this done and over with. I get the feeling the cold, bland gray of this skyscraper is infecting me.\""
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Legendary",
		Color = "Neutral",
		AttackEffect = "Slash",
		Cost = { Neutral = 3, Green = 2, Red = 2, Blue = 2 },
		Blessing = true,
		ModifierEclipse = true,
		Effect = {
			Description = "Whenever you discard your third card each turn: Put an Apocalyptic Blessing onto your sixth card space.",
			Ability = {
				OnAllyDiscard = {
					Power = { {
						Power = "AddHandModifier",
						Increase = "EclipseBless",
						Target = "Self",
						MetaData = {
							SlotTargets = { 5 }
						}
					} },
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 3, 4, "DiscardCount" }
				}
			}
		},
		Bio = "It simply wanted to be left alone, yet the frenzied cries and screams that sprung forth from its essence drowned out its pleas."
	},
	Hacker = {
		Id = 5128727401,
		Name = "Caleb244",
		AltCards = {
			["Caleb244-E"] = {
				Id = 8838197085,
				Name = "Agents of E.G.G",
				AttackEffect = "Jab",
				Bio = "Don't expect them to assemble a group of heroes or anything, they're just egg hunters."
			},
			["HumorousDejaun #1 Dyna Stan"] = {
				Id = 12128467726,
				Name = "HumorousDejaun #1 Dyna Stan",
				AttackEffect = "Hammer",
				AltArt = true,
				Bio = "Trust me guys. Cow IS viable."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: Search your deck for a Cow card.",
			Type = "OnEnd",
			Power = { { "RandomTutorfor", "Cow" } },
			Target = "Ally"
		},
		Bio = "The ROBLOX Admin Panel? Give me a second - *mashes keyboard* - I'm in. "
	},
	["Master Josue"] = {
		Id = 6290656821,
		Name = "SnyFort",
		CopyBodge = "Master Josue",
		AltCards = {
			SnyFort = {
				Id = 5581173839,
				AltArt = true,
				Summonant = "MasterToken",
				Bio = "Why did the chicken cross the road?"
			},
			["Eshra, The Soul Genie"] = {
				Name = "Eshra, The Soul Genie",
				Id = 6552018858,
				AltArt = true,
				Summonant = "Eshra Token",
				Bio = "\"I grant those who let me see into their souls a wish but I do wonder if someday someone can grant my wish...\""
			},
			["Eshra, The Gift Genie"] = {
				Name = "Eshra, The Gift Genie",
				Id = 11781047987,
				AltArt = true,
				Summonant = "Eshra Gift Token",
				Bio = "\"This year, you're my gift!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "IcePunch",
		Lunar = true,
		Color = "Blue",
		Summonant = "TokenFort",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Level Up!",
			Description = "Reveal your opponent's hand.\nSummon Snyfort, a 400/500 fighter with no abilities.",
			Type = "OnSummon",
			Power = {
				{ "RevealHand", 1, "Opponent" },
				{ "Summon", "Summonant", "Ally" }
			},
			Target = "ColorYellow"
		},
		Bio = "What is the only word in the dictionary spelt incorrectly?"
	},
	TokenFort = {
		Id = 6290658753,
		Name = "SnyFort",
		AltCards = {
			MasterToken = { Id = 5581174623, Bio = "To get to the other side." },
			["Eshra Token"] = {
				Name = "Eshra, The Soul Genie",
				AttackEffect = "MagicBlue",
				Id = 6552018858,
				Bio = "\"I grant those who let me see into their souls a wish but I do wonder if someday someone can grant my wish...\""
			},
			["Eshra Gift Token"] = {
				Name = "Eshra, The Gift Genie",
				AttackEffect = "Blizzard",
				Id = 11781047987,
				Bio = "\"This year, you're my gift!\""
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		SummonedAnimation = "RobloxianCall",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Incorrectly."
	},
	Daisy = {
		Id = 4899283836,
		Name = "Daisy",
		AltCards = {
			["Daisy-Sun"] = {
				Id = 10283617633,
				AttackEffect = "Jab",
				Name = "Rolympian",
				Bio = "Hard work is the best way to the top!"
			}
		},
		Power = 350,
		Health = 150,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 1 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: All players gain 600 Life.",
			Type = "OnSummon",
			Power = { { "Inflict", -600 } },
			Target = "All"
		},
		Bio = "Daisy and her shuriken, that is all. She is also known as daisy1002."
	},
	xXVitalityVoidXx = {
		Id = 3164506102,
		Name = "xXVitalityVoidXx",
		AltCards = {
			["xXVitalityVoidXx-Hal"] = {
				Id = 7634901489,
				Name = "Dark Orb Leader, The Apprentice",
				AttackEffect = "Gravity",
				Bio = ""
			},
			emergencydiscreetalt = {
				Id = 8542093861,
				Name = "emergencydiscreetalt ",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "The exiled Toothy Deer, accused of \"Goldslaughter\" from his own society."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 1 },
		Effect = {
			Name = "Endless Spooks",
			Description = "Whenever an action is cast: All enemy fighters lose 50 power.",
			Type = "OnCast",
			Power = { { "Weaken", 50, "Opponent" } },
			Target = "Archetype"
		},
		Bio = "Here, have this potion. You're going to have a bad time, so why not lighten up?"
	},
	Regular_Talkshow = {
		Id = 6030859124,
		Name = "Regular_Talkshow",
		AltCards = {
			["Regular_Talkshow-Sun"] = {
				Id = 10283629891,
				Name = "Summer's Debtor",
				AttackEffect = "TimeBomb",
				Bio = "Sunny boy, I know you are still on vacation, but if you dont pay your debts, I'll tag along on the vacation. xoxo from Mom, take care of yourself."
			},
			["Smug Sigma"] = {
				Id = 9244792165,
				Name = "Smug Sigma",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"You play to win while I play to play.  We're not the same, You're on a grindset while I set the grind. We're not the same. I'm the Beta, Omega, Alpha, Sigma, AND the Engima yet you're just Ligma. We're. Not. The. Same.\""
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		CounterBlock = true,
		CounterAttackBlock = true,
		StrengthenImmune = true,
		SwapImmune = true,
		SetImmune = true,
		Effect = {
			Name = "Life fam",
			Description = "",
			Type = "Null",
			Power = { { "Tax", 0 } },
			Target = "Self"
		},
		Bio = "Hello Blox Cards nation! I'm your host, Regular_Talkshow, let's get ROOOIIIGHT into the news!"
	},
	["Icebreaker!"] = {
		Id = 6035943241,
		Name = "Icebreaker!",
		AltCards = {
			["Icebreaker!-E"] = {
				Id = 9159871205,
				Name = "Cracked at It!",
				Effect = {
					Power = {
						{ "Lock", 1, "Single" },
						{ "Summon", "Cracky4-E" }
					}
				},
				Bio = "The eggs strike back"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "Freeze",
		Lunar = true,
		HideArchetype = "True",
		Color = "Blue",
		Cost = { Neutral = 3 },
		StarterCard = true,
		Effect = {
			Name = "Stud",
			Description = "Lock a target fighter for 1 turn.\nSummon Cracky4, a 600/200 fighter with no abilities.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1, "Single" },
				{ "Summon", "Cracky4" }
			},
			Target = "Ally"
		},
		Bio = "It's all fun and games until somebody gets frozen."
	},
	Cracky4 = {
		Id = 6035944461,
		Name = "Cracky4",
		AltCards = {
			["Cracky4-E"] = {
				Id = 9159871893,
				Name = "Egg Breaker",
				AttackEffect = "Ice",
				Bio = "Now the egg hunter becomes the egg hunted."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Ice to meet you!"
	},
	DoeDoe = {
		Id = 5129336437,
		Name = "Magic277",
		AltCards = {
			["Magic277-AN"] = {
				Id = 9345621265,
				Name = "DoeDoe",
				AttackEffect = "TimeBomb",
				Summonant = "Magic277-AN",
				Bio = "Prepare for trouble! And make it double!"
			},
			["Scorching & Shining Coolflamez & Thurlii"] = {
				Id = 9513589793,
				Name = "Scorching & Shining Coolflamez & Thurlii",
				AttackEffect = "Scorch",
				AltArt = true,
				Summonant = "Scorching & Shining Thurlii",
				Bio = "One of the most essential units for any team that needs an AGL 🔵 fighter. This leads one of the best categories in the game. The [Redacted] category consists of several powerful cute fighters like Astolfo, Hideyoshi Kinoshita, Felix Argyle, and many more! This unit links perfectly with CoolFlameRB, another strong fighter. Boasting an impressive set of link skills, it ensures that your other units are never without ki to launch devastating super attacks."
			},
			["Scorching & Shining Thurlii"] = {
				Id = 9513532185,
				Name = "Scorching & Shining Thurlii",
				AttackEffect = "Scorch",
				Rarity = "Token",
				Summonant = "Scorching & Shining Thurlii",
				Bio = "\"Oi, you got a license for that knife m8. Also start running, I'm 5 km away from your location. You are not safe. ,,o///o,,\""
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Summonant = "DoeDoe",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a copy of it that's inert in all zones.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			EffectInert = true,
			Target = "Ally"
		},
		Bio = "His checkpoint obbies are superb!"
	},
	["DoeDoe Token"] = {
		Id = 5129336437,
		Name = "Magic277",
		CopyBodge = "DoeDoe Token",
		Health = 350,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Jab",
		Token = true,
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Summon a copy of this card.",
			Type = "OnSummon",
			Power = { { "Summon", "DoeDoe Token" } },
			Target = "Ally"
		},
		Bio = "Albeit with only 25 lives..."
	},
	puffytenter12 = {
		Id = 7132545564,
		Name = "puffytenter12",
		AltCards = {
			["puffytenter12-Sun"] = {
				Id = 9150941548,
				Name = "Pogging Fishes",
				AttackEffect = "Bubbles",
				Bio = "This school of fish only appear on the hypest of times."
			}
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		LockImmune = true,
		Effect = {
			Name = "Stud",
			Description = "",
			Type = "Null",
			Power = { { "Unlock", 9999 } },
			Target = "Self"
		},
		Bio = "Used to make green decks cry. Now just makes everything cry."
	},
	Megaman766 = {
		Id = 8439713228,
		Name = "Megaman766",
		AltCards = {
			Arceusdon = {
				Id = 8439714055,
				AltArt = true,
				Name = "Arceusdon",
				AttackEffect = "Gravity",
				Bio = "\"This will put a smile to my face o3o\""
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 6 },
		Effect = {
			Name = "Master Blast",
			Description = "When this card is cast: Set the power of a target fighter to 700.",
			Type = "OnSummon",
			Power = { { "SetPower", 700 } },
			Target = "Single"
		},
		Bio = "\"Ya must recovah all de enahgee imedetly W- Megaman."
	},
	["2Hex"] = {
		Id = 5071967420,
		Name = "2Hex",
		AltCards = {
			Unlucky_Seven = {
				Id = 5315053713,
				Name = "Unlucky_Seven",
				AttackEffect = "Slash",
				CopyBodge = "Unlucky_Seven",
				AltArt = true,
				Bio = "They're holding an ace instead of a 7. You had ONE JOB."
			},
			["2Hex-AN"] = {
				Id = 9362066456,
				Name = "Spiderboy",
				AttackEffect = "LinkedSword",
				Bio = "I’m sick of Mr. Eisenhower treating me like a kid."
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Shield = true,
		Charge = true,
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		Effect = {
			Name = "Shine",
			Description = "When this card is cast: Lock a target fighter for 1 turn. Give yourself a Moonleak and remove {W} from its cost.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Unlock", 9999, "Self" },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Single",
			MetaData = {
				Cost = { Neutral = 1 }
			}
		},
		Bio = "He has no style, he has no grace."
	},
	Brunito = {
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
	["Ghost Dragon"] = {
		Id = 10280918353,
		Name = "Chillian Snowdin",
		AltCards = {
			["Chillian Snowdin-C"] = {
				Id = 10280896254,
				Bio = "In an alternative universe, where even Akuma was afraid."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "IcePunch",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: If there's an allied terrain in play, a target fighter loses 400 power. Then return all terrains in play to their hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "EVExactValueCheck", 0, "Self" },
						{ "Return" },
						{ "Return", 30, "EnemyTerrain" }
					},
					Target = "AllyTerrain"
				},
				OnEVCheckPass = {
					Power = { { "Weaken", 400, "Single" } },
					Target = "Single",
					NoBlip = true,
					EffectRequirement = { "HasAnyTerrain", "Me", 0, 0 }
				}
			}
		},
		Bio = "Another Devil Beater intern joins the fight! It's a Cold World."
	},
	["Crystal Snare"] = {
		Id = 15121301423,
		Name = "Crystal Snare",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "Freeze",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 4 },
		Effect = {
			Name = "Crystal Snare",
			Description = "Unlock a target fighter, then lock it for 6 turns.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 6 }
			},
			Target = "Single"
		},
		Bio = "It's cute when it's trapped, isn't it? I mean, as cute as raging, hate-filled monsters can be."
	},
	["Steam Razikai"] = {
		Id = 6670738713,
		Name = "Steam Razikai",
		AltCards = {
			["Steam Razikai-E"] = {
				Id = 8725149727,
				Name = "Charles Booker",
				AttackEffect = "MagicBlue",
				Bio = "You could call him a bit of a bookworm."
			}
		},
		Health = 1200,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2 },
		Effect = {
			Name = "Sticks and Stones and Steam",
			Description = "During your end step, if you have 8 or more cards in hand: This card gain 200 Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			EffectRequirement = { "Playertable", "Me", 8, 9999, "Hand" },
			Target = "Self"
		},
		Bio = "Not to be confused with Valve's premier gaming service."
	},
	ImaUMBREON = {
		Id = 15706306310,
		Name = "mothcwiningen",
		AltCards = {
			["mothcwiningen-Sun"] = {
				Id = 17346074903,
				Name = "motharabedwr",
				AttackEffect = "Slash",
				Bio = "She actually can't swim. Have you ever seen a moth swim?? It looks ridiculous."
			}
		},
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
		Bio = "Do you believe in magic?"
	},
	evaera = {
		Id = 6401522904,
		Name = "evaera",
		AltCards = {
			["Programmer Elisa"] = {
				Id = 8072471581,
				Name = "Programmer Elisa",
				AttackEffect = "Jab",
				Bio = "Studio has stopped working? I'll just wait a few more minutes, I'm sure it will be up and running soon!"
			},
			["evaera-Hal"] = {
				Id = 14693037741,
				Name = "Merciful Nurse",
				AttackEffect = "Scythe",
				Bio = " \"During Halloween,locals have spotted a nurse roaming the insides of an abandoned hospital. Whoever attempts to enter said hospital... meets an unfortunate end.\""
			}
		},
		Health = 250,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Slander",
			Description = "When this card is cast: Set the Health of a fighter to 500.",
			Type = "OnSummon",
			Power = { { "SetHealth", 500, "Single" } },
			Target = "Ally"
		},
		Bio = "Just RoVerifying if everything is in order."
	},
	EzCheez = {
		Id = 6793760755,
		Name = "EzCheez",
		AltCards = {
			["EzCheez-C"] = {
				Id = 8108333548,
				Name = "EzGlobe",
				AttackEffect = "IcePunch",
				Bio = "He lives in a snow globe to enforce social distancing."
			},
			["Blohn Bloe"] = {
				Id = 130110162163492,
				Name = "Blohn Bloe",
				PremiumArt = 808,
				AttackEffect = "MagicBlue",
				Bio = "I'M SO BLUE ."
			},
			["EzCheez-AN"] = {
				Id = 14215871588,
				Name = "Party Pandemonium",
				AttackEffect = "StudBlast",
				EffectAnimation = "CakeBuff",
				SummonAnimation = "ClownHonk",
				DeathAnimation = "ClownDeath",
				ArtAnimation = "BirthdayAnim",
				Bio = "Talk about a party pooper."
			},
			["Globetrotters of Equestria"] = {
				Id = 72546986849722,
				Name = "Globetrotters of Equestria",
				PremiumArt = 342,
				AltArt = true,
				Bio = "\"I'm actually the only one who does the trotting. Beddie stays up in her cloud.\" -Cartesian"
			},
			["NTPInheiro Another Cloudy Day"] = {
				Id = 76558033312857,
				Name = "NTPinheiro: Another Cloudy Day",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 634,
				Bio = "wouldn't you like to know, weatherboy?"
			},
			["EzCheez-Mango"] = {
				Name = "Troll Tyrone",
				Id = 104096629637674,
				AttackEffect = "Jab",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"Do not trust the man who speaks in red and green trees\""
			}
		},
		Power = 150,
		Health = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Conflux",
			Description = "During your end step, if you have 4 or fewer cards in hand: Draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 5, "Hand" }
		},
		Bio = "As opposed to hard cheese. How would one even make such a thing?"
	},
	Inventor1116 = {
		Id = 10245752532,
		Name = "Inventor1116",
		AltCards = {
			ShockingToken = {
				Rarity = "Token",
				Cost = { Green = 2, Blue = 2 },
				Effect = {
					Description = " ",
					Type = "OnAttackDestroy",
					Power = { { "Draw", 0 } },
					Target = "Ally"
				}
			},
			Lidusha66 = {
				Name = "Lidusha66",
				AttackEffect = "Slash",
				Id = 8036169894,
				AltArt = true,
				Addant = "Lidusha66Token",
				Bio = "Trust me. I do not choose the fights I can win."
			},
			Lidusha66Token = {
				Name = "Lidusha66",
				AttackEffect = "Slash",
				Id = 8036169894,
				Rarity = "Token",
				Cost = { Green = 2, Blue = 2 },
				Effect = {
					Description = " ",
					Type = "OnAttackDestroy",
					Power = { { "Draw", 0 } },
					Target = "Ally"
				},
				Bio = "Trust me. I do not choose the fights I can win."
			},
			["Inventor1116-Sun"] = {
				Id = 10283631301,
				AttackEffect = "Ice",
				Addant = "Inventor1116Token-Sun",
				Bio = "As you can see, I am the one who invented the 'popsicle', a battle weapon that can paralyze your enemies in fear."
			},
			["Inventor1116Token-Sun"] = {
				Id = 10283631301,
				AttackEffect = "Ice",
				Rarity = "Token",
				Cost = { Green = 2, Blue = 2 },
				Effect = {
					Description = " ",
					Type = "OnAttackDestroy",
					Power = { { "Draw", 0 } },
					Target = "Ally"
				},
				Bio = " When I turned 12, I invented 'The Popsicle', then I froze my parents and shattered them into little pieces."
			},
			["Inventor1116-AN"] = {
				Name = "Fyri",
				AttackEffect = "Slash",
				Id = 9345616022,
				Addant = "Inventor1116Token-AN",
				Bio = "Local Punk Guitarist, she's quiet and reserved off the stage..."
			},
			["Inventor1116Token-AN"] = {
				Name = "Fyri",
				AttackEffect = "Slash",
				Id = 9345616559,
				Cost = { Green = 2, Blue = 2 },
				Rarity = "Token",
				Effect = {
					Description = " ",
					Type = "OnAttackDestroy",
					Power = { { "Draw", 0 } },
					Target = "Ally"
				},
				Bio = "But when she's on it, she's the loudest thing you'll hear."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Blue",
		Charge = true,
		Cost = { Green = 3, Blue = 3 },
		Addant = "ShockingToken",
		Effect = {
			Name = "Trout Slap",
			Description = "Whenever this card attacks and destroys another: Give yourself a copy of this card without this effect. Remove {G}{B} from its cost.",
			Type = "OnAttackDestroy",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "Inventing new things every moment, he just can't stop his creative flow!"
	},
	SimpleBeings = {
		Id = 10280793808,
		Name = "SimpleBeings",
		AltCards = {
			Lazykirby = {
				Id = 7708009854,
				Name = "Lazykirby",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "This guy procrastinates a bit. Don't disturb him while he naps..."
			},
			["Psychonaut Flufflefunz"] = {
				Id = 9075355386,
				Name = "Psychonaut Flufflefunz",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "I am inseparable from the impossible."
			},
			["SimpleBeings-Sun"] = {
				Id = 13687956877,
				Name = "Shark Fin",
				AttackEffect = "Whirlpool",
				Bio = "\"There's a shark! Everyone, swim to shore!\""
			},
			["Security Detail"] = {
				Id = 16932765476,
				Name = "Security Detail",
				AltArt = true,
				PremiumArt = 244,
				Bio = "\"Your extraction point is nearby, awaiting the commencement of exfiltration. It is of utmost importance to ensure the VIP's safety under all circumstances. Failure is not an option.\" -Sordman"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		Effect = {
			Name = "Revival",
			Description = "Whenever your opponent casts a fighter: Deal 100 damage to this card. Suspend all fighters from play until their next end step.",
			Type = "OnEnemySummon",
			Power = {
				{ "Damage", 100, "Self" },
				{ "Suspend", 30 }
			},
			Target = "All"
		},
		Bio = "Suave fellow who is certainly not so simple."
	},
	BlueShadic90 = {
		Id = 10281074804,
		Name = "BlueShadic90",
		AltCards = {
			["HumorousDejaun, Professional Milk Recruiter"] = {
				Id = 13994397780,
				Name = "HumorousDejaun, Professional Milk Recruiter",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 95,
				Bio = "\"I am the REAL milkman, and my milk is… subpar.\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Sudden Death",
			Description = "When this card is cast: Give yourself a 900/200 cow.",
			Type = "OnSummon",
			Power = { { "Add", "Cow" } },
			Target = "Ally"
		},
		Bio = "I learnt my disguise from Sensei Ushirakka. No feudal lord looks at cattle suspiciously."
	},
	["Dodgeball Player Blue"] = {
		Id = 87653345755850,
		Name = "ImTrilocks",
		AltCards = {
			["Dodgeball Player Blue-E"] = {
				Id = 90095947151231,
				Name = "Trilocks & The Eggscursionist",
				Bio = "You know... When you think about \"infinite me-s\" and \"unlimited dimensions\", you don't really take egg versions of yourself into consideration, y'know? Quite... bizarre, really.<br/>Egg noises??<br/>\"You're... a good listener.\""
			}
		},
		Health = 200,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectAnimation = "MidStormEffect",
		Effect = {
			Name = "A dodgeball to the legs!",
			Description = "When this card is cast: Swap a target fighter's stats. Unlock it, then lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Swap", 100000 },
				{ "Unlock", 999 },
				{ "Lock", 1 }
			},
			Target = "Single",
			Increase = 1
		},
		Bio = "\"0/10, No Swords. AND to make it worse, self-inserting, time bending, space traveling tourism powers??? That's like, SO LAME. I would never. What's next? Inserting himself onto other bios to talk about unrelated stuff? Gives me the chills.\" - Sword Critic"
	},
	["Razikai's Exploration"] = {
		Id = 10280556182,
		Name = "Razikai's Exploration",
		AltCards = {
			["Razikai's Exploration-Hal"] = {
				Name = "Razikai's Horrific Discovery",
				Id = 10280559822,
				Summonant = "The Space Monster-Hal",
				Bio = "OKAY GIVE ME THE SQUID INSTEAD I TAKE IT BACK!"
			},
			["Rift of Lost Heroes"] = {
				Name = "Rift of Lost Heroes",
				Id = 12128464614,
				AltArt = true,
				Summonant = "Cataclysmic Summoner, Sylvia",
				Bio = "<i>All things change, drawn to the flame, to rise from the ashes.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 6, Green = 6 },
		Summonant = "The Space Monster",
		CustomReminder = {
			["Space Monster"] = "Whenever this card attacks: Summon a Green fighter card. Trigger its effect as if it was cast."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Return all allied fighters to their hand.\nSummon a 1400/400 Space Monster, a Blue fighter, and a Green fighter. Trigger their effects as if they were cast.",
			Type = "OnSummon",
			Power = {
				{ "Return", 30 },
				{ "Summon", "Summonant" },
				{ "RandomSummonWithEffect", "Blue Fighter" },
				{ "RandomSummonWithEffect", "Green Fighter" }
			},
			Target = "Ally"
		},
		Bio = "NOT THE SQUID! ANYTHING BUT THAT!"
	},
	["The Space Monster"] = {
		Id = 6464467557,
		Name = "The Space Monster",
		AltCards = {
			["The Space Monster-Hal"] = {
				Name = "Eldritch Creature",
				Id = 7510870466,
				Bio = "Somethings are better left unknown."
			},
			["Cataclysmic Summoner, Sylvia"] = {
				Name = "Cataclysmic Summoner, Sylvia",
				AttackEffect = "Blizzard",
				Id = 12128465776,
				Bio = "<i>To begin, we must first see the end.</i>"
			}
		},
		Health = 1400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		TokenOmni = true,
		TransformImmune = true,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever this card attacks: Summon a Green fighter card. Trigger its effect as though it was cast.",
			Type = "OnAttack",
			Power = { { "RandomSummonWithEffect", "Green Fighter" } },
			Target = "Ally"
		},
		Bio = "It's in the light. The moon came in. He found me through the mirror. Moonlight white. White like eyes. Not light but blood. I drown in him. If you are afraid, we will look together."
	},
	DrTrayBlox = {
		Id = 10445094390,
		Name = "DrTrayBlox",
		Health = 1500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3, Green = 3 },
		Effect = {
			Name = "Strike Diamond!",
			Description = "Whenever this card attacks: You gain 600 Life.",
			Type = "OnAttack",
			Power = { { "Cost", -600 } },
			Target = "Self"
		},
		Bio = "DrTrayBlox, also known as Dan the Diamond Minecart (DanTDM) on YouTube, he'll always strike diamonds even from his foes."
	},
	["Business Off Pork-O-Mech"] = {
		Id = 109536470904161,
		Name = "Hampunk Mecha",
		AltCards = {
			["Obalish the Abolisher"] = {
				Id = 12863100944,
				AltArt = true,
				Name = "Obalish the Abolisher",
				AttackEffect = "Storm",
				Bio = "Nécessite 3 Sacrifices pour son Invocation Normale (non Posable Normalement). L'Invocation Normale de cette carte ne peut pas être annulée. Lorsqu'elle est Invoquée Normalement, les cartes et les effets ne peuvent pas être activés. Aucun joueur ne peut cibler cette carte avec des effets de carte. Une fois par tour, durant la End Phase, si cette carte a été Invoquée Spécialement : envoyez-la au Cimetière. Vous pouvez Sacrifier 2 monstres ; détruisez tous les monstres contrôlés par votre adversaire. Cette carte ne peut pas déclarer d'attaque le tour où cet effet est activé."
			},
			["Hampunk Mecha-V"] = {
				Id = 16206876883,
				Name = "Ganjiang & Moye",
				AttackEffect = "Katana",
				Bio = "The swordsmithers once had the king request them to forge two swords..."
			},
			["Valary, The False Angel"] = {
				Name = "Valary, The False Angel",
				AttackEffect = "XhartyrSlash",
				Id = 81134862993151,
				AltArt = true,
				PremiumArt = 626,
				Bio = "\"The Angel escaped the coffin, I REPEAT THE ANGEL LEFT THE-\" Those were the last words that were heard from the church before it fell into absolute silence."
			}
		},
		Health = 1600,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Oink!",
			Description = "When this card is cast: It locks itself for 4 turns, then loses a lock for each enemy fighter.\nWhenever this card attacks: It gains 500 Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Lock", 4 },
						{ "SetVariable", "EnemyField" },
						{ "Unlock", "Variable" }
					},
					Target = "Self"
				},
				OnAttack = {
					Power = { { "Strengthen", 500, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "This machine runs on pure pig. Don't ask how."
	},
	actualtsareena = {
		Id = 12895666786,
		Name = "KawaiiKittyMittySama",
		AltCards = {
			["actualtsareena-Sun"] = {
				Id = 15407460238,
				Name = "Reisen, Lunatic Red Eyes",
				AttackEffect = "MagicBlue",
				Bio = "MAD RED EYES, AND A FULL INVERTED MOON:<br/> One which watches over and one which gazes through.<br/> Turn away; it's a selfish sort of peace...<br/> Seen or not, they still can see you."
			},
			["actualtsareena-Banner"] = {
				Id = 11194253144,
				Name = "The Thing",
				AttackEffect = "Scratch",
				Bio = "\"Are you really who you say you are?\""
			},
			["Brie, Flawless"] = {
				Id = 16932163007,
				Name = "Brie, Flawless",
				AltArt = true,
				PremiumArt = 243,
				Bio = "It's really hard to focus on world domination when I have to keep finding new jobs..."
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Yellow = 1, Blue = 3, Neutral = 3 },
		Unique = true,
		CustomReminder = {
			["Triggered Effects"] = "Abilities with a colon, such as 'When this card is cast:'\nPassives like Overload are not copied."
		},
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Choose a target fighter. This fighter gains that fighter's health, power, colour, triggered effects, and group.",
			Type = "OnSummon",
			Power = { { "CopyStats" } },
			Target = "Single"
		},
		Bio = "Minna saikō arigatō, ka-ka-ka-kawaii!"
	},
	RaveTea = {
		Id = 10281370741,
		Name = "RaveTea",
		AltCards = {
			["RaveTea-ArtV"] = {
				Id = 10281368863,
				AttackEffect = "Jab",
				AltArt = true,
				Effect = {
					Name = "Join The Rave",
					Type = "OnEnemySummon",
					Power = {
						{ "SetHealth", 0, "Aggressor" },
						{ "Summon", "RaveTea Token-ArtV" }
					},
					Target = "Opponent"
				},
				Bio = "The mind does not control the tea. The tea controls the mind."
			},
			TheEternalHowling = {
				Id = 10281364399,
				Name = "The Eternal Howling",
				AttackEffect = "Slash",
				CopyBodge = "TheEternalHowling",
				AltArt = true,
				Effect = {
					Name = "Join The Rave",
					Type = "OnEnemySummon",
					Power = {
						{ "SetHealth", 0, "Aggressor" },
						{ "Summon", "TheEternalHowling Token" }
					},
					Target = "Opponent"
				},
				Bio = "Join the howl."
			},
			["RaveTea-AN"] = {
				Id = 9433167459,
				Name = "Studist",
				AttackEffect = "StudBlast",
				Effect = {
					Power = {
						{ "SetHealth", 0, "Aggressor" },
						{ "Summon", "RaveTea Token-AN" }
					}
				},
				Bio = "A small dose of studs can supply you with endless power."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Join The Rave",
			Description = "Whenever your opponent casts a fighter: Set its health to 0. Your opponent summons a copy of this card without its effect.",
			Type = "OnEnemySummon",
			Power = {
				{ "SetHealth", 0, "Aggressor" },
				{ "Summon", "RaveTea Token" }
			},
			Target = "Opponent"
		},
		Bio = "The mind does not control the tea. The tea controls the mind."
	},
	["RaveTea Token"] = {
		Id = 6079948234,
		Name = "RaveTea",
		AltCards = {
			["RaveTea Token-ArtV"] = { Id = 6583033397, AttackEffect = "Jab" },
			["TheEternalHowling Token"] = {
				Id = 5135801402,
				Name = "The Eternal Howling",
				AttackEffect = "Slash",
				CopyBodge = "TheEternalHowling Token",
				Bio = "Join the howl."
			},
			["RaveTea Token-AN"] = {
				Id = 9433167829,
				Name = "Studfection",
				AttackEffect = "StudBlast",
				Bio = "Too much, though..."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The mind does not control the body. The tea controls the body."
	},
	["Deadly Dicey Duo"] = {
		Id = 10281360540,
		AltCards = {
			["Bee Lovers"] = {
				Id = 10281340915,
				Name = "Bee Lovers",
				AttackEffect = "Slash",
				CopyBodge = "Bee Lovers",
				AltArt = true,
				Bio = "This card is an alternate art of RellSin & RellVex."
			},
			["RellSin & RellVex-AN"] = {
				Id = 9362061711,
				Name = "Deadly Dicey Duo",
				AttackEffect = "Hammer",
				Bio = "Together as one, we game the night away!"
			}
		},
		Name = "RellSin & RellVex",
		CopyBodge = "Deadly Dicey Duo",
		Health = 1800,
		Power = 600,
		Rarity = "Epic",
		Charge = true,
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Yellow = 5, Blue = 5 },
		Effect = {
			Name = "Hellfire",
			Description = "Whenever this card attacks: If a fighter would trigger its own effect when cast this turn, it triggers an additional time.",
			Type = "OnAttack",
			Power = { { "Overdrive" } },
			Target = "Ally"
		},
		Bio = "Co-creators of NRPG. Singing anime intros power them up!"
	},
	["Dicey Token"] = {
		Id = 4800942883,
		Name = "RellSin & RellVex",
		AltCards = {
			["Bee Lovers Token"] = {
				Id = 4916453994,
				Name = "Bee Lovers",
				AttackEffect = "Slash",
				CopyBodge = "Bee Lovers Token",
				Bio = "This card is an alternate art of RellSin & RellVex."
			}
		},
		CopyBodge = "Dicey Token",
		Health = 1750,
		Power = 650,
		Rarity = "Token",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Yellow = 5, Blue = 5 },
		Effect = {
			Name = "Hellfire",
			Description = "During your end step: All enemy fighters lose 100 power. You gain {Y}. Your opponent loses 200 life.",
			Type = "OnEnd",
			Power = {
				{ "Yellow", 1, "Ally" },
				{ "Weaken", 100, "Opponent" },
				{ "Inflict", 200, "Opponent" }
			},
			Target = "Opponent"
		},
		Bio = "Co-creators of NRPG Beyond. Singing anime intros power them up!"
	},
	["Skeleton Armada"] = {
		Id = 10938757580,
		Name = "NowDoTheHarlemShake",
		AltCards = {
			["Spooky Scary Skeletons"] = {
				Id = 15588828495,
				Name = "Spooky Scary Skeletons",
				AttackEffect = "Scratch",
				Addant = "Spooky Scary Skeletons",
				Bio = "DOOT DOOT"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Archetype = "Normal",
		Color = "Blue",
		Cost = { Neutral = 4, Red = 1, Blue = 5 },
		Addant = "Skeleton Armada",
		Overload = true,
		Effect = {
			Name = "Endless Spooks",
			Description = "When this card is cast: Give yourself a copy of it. All allied copies of this card gain 400 Health and Power. Destroy a Red card in your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{ "Strengthen", 400 },
				{ "Heal", 400 },
				{
					"GenZoneDiscard",
					{ "Red", -1 }
				}
			},
			Target = "AlliedArchetype"
		},
		Bio = "Welcome back to 2013."
	},
	Regular_Show = {
		Id = 10281476103,
		Name = "Regular_Show",
		AltCards = {
			["Regular_Show-Sun"] = {
				Id = 9159868675,
				Name = "Megalodon, The Dragon Shark",
				AttackEffect = "Whirlpool",
				Bio = "A beast forgotten to history, but remembered by those who crossed his path."
			},
			Flufflefunz_Show = {
				Id = 101112164024346,
				AltArt = true,
				Name = "Flufflefunz",
				AttackEffect = "Slash",
				Bio = "Sorry not sorry."
			},
			["Area Secure"] = {
				Name = "Area Secure",
				Id = 16562311330,
				AltArt = true,
				PremiumArt = 229,
				Bio = "Sooooooo, how's your day going?"
			},
			["Zachariah Winters, the Wind Queen"] = {
				Id = 77168351877425,
				Name = "Zachariah Winters, the Wind Queen",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 584,
				SummonAnimation = "LargeGustSelf",
				Bio = "\"Ultimate Art: Queen's Whirlwind Flurry!\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Microphone",
		Color = "Blue",
		Cost = { Blue = 7 },
		Effect = {
			Name = "Disaster",
			Description = "When this card is cast: Lock all allied fighters for 1 turn, then ready them. Repeat this process four times.",
			Type = "OnSummon",
			Power = {
				{ "LockPulse", 1, "Ally", 5 }
			},
			Target = "Ally"
		},
		Bio = "He likes the show so much he's named after it too. Too bad the show is over though..."
	},
	WookieCookieHD = {
		Id = 10281456771,
		Name = "WookieCookieHD",
		AltCards = {
			["WookieCookieHD-E"] = {
				Id = 8799542893,
				AttackEffect = "MagicGreen",
				Bio = "Don't ask what he's testing. You don't want to know."
			},
			Maiahz = {
				Name = "Maiahz",
				AttackEffect = "Flame",
				AltArt = true,
				Id = 10281454049,
				Bio = "This ray of sunshine is fueled by pure milk tea!"
			},
			["Shiba, The Queen of Hatred"] = {
				Id = 85443169682909,
				Name = "Chip",
				AltArt = true,
				Bio = "Close friend of Duncan Donuts."
			},
			["WookieCookieHD-Mango"] = {
				Name = "It's All About PRIDE",
				Id = 82167476486830,
				AttackEffect = "Claw",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"Picture my Luna up in 3D\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2 },
		ReturnImmune = true,
		Effect = {
			Description = "When this card is cast: Return each fighter with the highest health to their hand.",
			Type = "OnSummon",
			Power = { { "Return", 30 } },
			Target = "HighestHealth"
		},
		Bio = "He can calculate interest to six decimal places, even in the midst of a deadly duel."
	},
	hyp3rdeath = {
		Id = 4924599096,
		Name = "hyp3rdeath",
		AltCards = {
			["hyp3rdeath-Hal"] = {
				Name = "Void",
				Id = 7578858215,
				AttackEffect = "Gravity",
				EffectAnimation = "MidGravityEffect",
				Bio = "\"I guess... I'll just have kill you MYSELF.\""
			},
			Vetr = {
				Name = "Vetr, Fimbul's Eccentric Brother",
				AltArt = true,
				PremiumArt = 19,
				Commissioner = { 293835756, 8289996, 320659945 },
				Id = 12984488075,
				AttackEffect = "ModernRocket",
				EffectAnimation = "MidBlizzardEffect",
				Bio = "\"Fimbul dedicates his entire life to forging mithril within the freezing mountains. His eccentric younger brother, Vetr, is well-verse in tomes and magical artifacts left by previous generations of ice demon magicians. Vetr becomes fascinated with stories of the world beyond the frozen biome. Beginning his pilgrimage into the unknown.\""
			},
			["ADeadBody14, Gravedigger"] = {
				Id = 12367545863,
				Name = "ADeadBody14, Gravedigger",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "\"Your grave has been dug.\""
			}
		},
		Health = 1300,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		EffectAnimation = "MidMagicBlueEffect",
		Charge = true,
		Color = "Blue",
		Cost = { Neutral = 5, Blue = 5 },
		Effect = {
			Name = "Ultimate",
			Description = "After this card attacks: A target enemy fighter loses 300 Power.",
			Type = "OnAttackEnd",
			Power = { { "Weaken", 300 } },
			Target = "SingleEnemy"
		},
		Bio = "I'm sorry, what were we doing? I was procrastinating so much that I kicked your butt on accident."
	},
	CjMcGamingYT = {
		Name = "CjMcGamingYT",
		AltCards = {
			["CjMcGamingYT-C"] = {
				Id = 8158659733,
				Name = "Robber Duo Marvin & Kevin",
				AttackEffect = "Jab",
				Bio = "They're hunting ducks. Maidboids, too."
			},
			["Big Dog"] = {
				Id = 131286383035389,
				Name = "Big Dog",
				AttackEffect = "Jab",
				Bio = "In a small pound!",
				AltArt = true,
				PremiumArt = 300
			},
			["R-Demon"] = {
				Id = 122148129637193,
				Name = "R-Demon!",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 488,
				Bio = "\"I love the internet because all you lovely people are willing to listen to me.\""
			}
		},
		Id = 5161062511,
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Shield = true,
		Effect = {
			Name = "Appetite",
			Description = "When this card is cast: Each fighter in your hand gains 100 Power.",
			Type = "OnSummon",
			Power = { { "StrengthenHand", 100 } },
			Target = "Ally"
		},
		Bio = "I'm hunting wabbits. Weeboids, too."
	},
	Witch = {
		Id = 6270733104,
		Name = "Witch",
		AltCards = {
			["Witch-Hal"] = {
				Id = 7510861763,
				Name = "Bloxhilda",
				AttackEffect = "DoomStorm",
				Bio = "This wicked witch once sought to conquer and rule all of Bloxburg, but was stopped by a brave group of Robloxians on October 2013."
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Maelstrom",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "Whenever your opponent casts a fighter: They lose 200 Life. You gain 200 Life.",
			Type = "OnEnemySummon",
			Power = {
				{ "Inflict", 200 },
				{ "Cost", -200 }
			},
			Target = "Opponent"
		},
		Bio = "She'll stop you in your tracks."
	},
	iiSmolToaster = {
		Id = 4899357703,
		Name = "iiSmolToaster",
		AltCards = {
			["iiSmolToaster-AN"] = {
				Id = 18199515244,
				AttackEffect = "Slash",
				Name = "Treasured Unicorn",
				Bio = "It looks like it's seen some things."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 2, Neutral = 1 },
		Effect = {
			Name = "Toasty",
			Description = "Whenever this card is attacked and survives: Put a Green Stud into your baseplate.",
			Type = "OnAttacked",
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
		Bio = "SmolToasters are sold without smol bread or batteries included."
	},
	Keeler1 = {
		Id = 8941651843,
		Name = "Keeler1",
		AltCards = {
			["Keeler1-E"] = {
				Id = 9098926532,
				Bio = "Step 1: Escape with Myrmiredon. Step 2: Get questioned by him. Step 3: Realize he kept calling it The Last Clashblox update. Step 4: Tell him to prepare to receive some Holy Spirit."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Electric",
		EffectAnimation = "MidMagicGreenEffect",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "Silence I keel you!",
			Description = "When this card is cast: A target fighter loses 200 power.",
			Type = "OnSummon",
			Power = { { "Weaken", 200 } },
			Target = "Single"
		},
		Bio = "Step 1: Capture Myrmiredon. Step 2: Force him into a basement. Step 3: Force him to make Clashblox great again. Step 4: Rub it in PirateX12's face."
	},
	Robber = {
		Id = 5679420862,
		Name = "MrWindy",
		AltCards = {
			["MrWindy-E"] = {
				Id = 8822772589,
				Name = "Merlin",
				AttackEffect = "Maelstrom",
				Bio = "The rotten egg smell from his cauldron is intentional, by the way."
			},
			["Annoying Crazy Robloxian"] = {
				Id = 8854897480,
				Name = "Annoying Crazy Robloxian",
				AttackEffect = "Superball",
				Bio = "A shining example of the joy of Old Roblox."
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Hammer",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: Summon each copy of it from your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" },
				{ "SummonGenZone", "Robber" }
			},
			Target = "Ally"
		},
		Bio = "Mess with him and you'll wind up in the freezer."
	},
	Ace_Beastin = {
		Id = 8156962817,
		Name = "Ace_Beastin",
		AltCards = {
			["Ace_Beastin-C"] = {
				Id = 8139782511,
				AttackEffect = "Slash",
				Bio = "Dancin' on the deadline. "
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Description = "When this card is cast or dies: Swap the stats of a target fighter.",
			Ability = {
				OnSummon = {
					Power = { { "Swap", 9999 } },
					Target = "Single"
				},
				OnDeath = {
					Power = { { "Swap", 9999 } },
					Target = "Single"
				}
			}
		},
		Bio = "Funky fresh beats!"
	},
	Faultful = {
		Id = 113563735905022,
		Name = "Faultful",
		AltCards = {
			["Faultful-E"] = {
				Id = 9137699134,
				AttackEffect = "MagicGreen",
				Bio = "He's 100%'d every egg hunt since the drops. Yes he cried himself to sleep when they were cancelled. Don't judge him."
			},
			["Faultful-Sun-Offer"] = {
				Id = 17760525939,
				Name = "Aqua.009",
				ArtAnimation = "AQUA 009",
				AttackEffect = "Gun",
				Bio = "Why surf the waves on a pricey vacation when you can surf the web for free?"
			}
		},
		Power = 500,
		Health = 500,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2, Blue = 2 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: Put a copy of a non-token card in your baseplate into your hand.",
			Type = "OnSummon",
			Power = { {
				"MoveZone",
				{ "NotToken", "GenZone", "Hand", true, true }
			} },
			Target = "Self"
		},
		Bio = "Cackletta disapproves."
	},
	LuckyTux = {
		Id = 3471753568,
		Name = "LuckyTux",
		AltCards = {
			["LuckyTux-E"] = {
				Id = 8954445167,
				Name = "Yolker",
				AttackEffect = "Arcane",
				Bio = "I am funny how? Am I funny like I am a clown? Oh, I am? Phew – I thought my jokes might have been falling flat!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Damage for Top Deck",
			Description = "When this card is cast: Your opponent loses {W} and you gain {W}.",
			Type = "OnSummon",
			Power = {
				{ "Neutral", -1 },
				{ "Neutral", 1, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "Meet the new rollercoaster ride from Mr Bones!"
	},
	MekaX = {
		Id = 6533893732,
		Name = "MekaX",
		AltCards = {
			["Elite Commander S_leepyhead"] = {
				Id = 10267787058,
				Name = "Elite Commander S_leepyhead",
				AttackEffect = "Tempest",
				AltArt = true,
				Bio = "Disturb him, and it's lights-out for you."
			},
			["Chu Chu Gaming"] = {
				Id = 10267777994,
				Name = "Chu Chu Gaming",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Founded by Wildy and Mo, Chu Chu now has access to worlds beyond the screen."
			},
			["MekaX-AN"] = {
				Id = 18199516501,
				Name = "Running House",
				AttackEffect = "Tempest",
				EffectAnimation = "BloxyBuff",
				Bio = "Towards a better home."
			},
			["Manix, Poisoned"] = {
				Id = 135197505406793,
				Name = "Manix, Poisoned",
				Commissioner = { "ManixDash" },
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 675,
				Bio = "\"The more you love, the more it becomes your weakness.<br/><br/>And yet, I could not throw it away.\""
			}
		},
		Health = 1500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		Color = "Green",
		Cost = { Neutral = 4, Green = 6 },
		Effect = {
			Name = "Parry",
			Description = "When this card is cast: It deals 300 damage to all fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 300 } },
			Target = "All"
		},
		Bio = "Do you dare to face him? I wouldn't either."
	},
	TZSara = {
		Id = 10288356612,
		Name = "TZSara",
		AltCards = {
			["TZSara-C"] = {
				Name = "TZnowSara",
				Id = 15486359789,
				AttackEffect = "FirePunch",
				Bio = "Let's share some hot chocolate by the tree!"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Arkhaiomelisidonophunikheratos",
			Description = "During your end step: All players gain 100 life.",
			Type = "OnEnd",
			Power = {
				{ "Cost", -100 },
				{ "Inflict", -100, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "He's willing to fight with his frying pan. Don't question it."
	},
	Bob = {
		Id = 10288687991,
		Name = "Bob",
		AltCards = {
			["Bob-Sun"] = {
				Id = 9166671692,
				AttackEffect = "Jab",
				Bio = "Dude... Just because I'm on vacation that doesn't mean I'll stop the grind."
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Bribe!",
			Description = "Whenever this card attacks: Swap the stats of a target fighter.",
			Type = "OnAttack",
			Power = { { "Swap", 100000 } },
			Target = "Single"
		},
		Bio = "Can he fix you?"
	},
	["Mummy Peasant"] = {
		Id = 10288691071,
		Name = "Crykee",
		AltCards = {
			["Crykee-E"] = {
				Id = 16932150457,
				Name = "White Rabbit of Good Fortune",
				Bio = "\"Don't you want to know how to earn more donations?\" <br/>\"...You don't. Okay.\""
			}
		},
		CopyBodge = "Mummy Peasant",
		Health = 1300,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 6 },
		Effect = {
			Name = "SorryBurn",
			Description = "Whenever this card attacks: All enemy fighters lose 150 power.",
			Type = "OnAttack",
			Power = { { "Weaken", 150 } },
			Target = "Opponent"
		},
		Bio = "Poor you."
	},
	Neutrinous = {
		Id = 10288384128,
		Name = "Neutrinous",
		AltCards = {
			["Neutrinous-C"] = {
				Name = "Frigid Photographer",
				Id = 15407462248,
				AttackEffect = "Jab",
				Bio = "CLICK! SNAP! WOWIE! LOOK AT THAT MAGNIFICENT BEAST!",
				AddGenZoneant = "Green Stud-C"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "During your end step: Put a Green Stud into your baseplate.",
			Type = "OnEnd",
			Power = { {
				"AddGenZone",
				{ "AddGenZoneant", 1 },
				nil,
				nil,
				nil,
				nil,
				"BaseplateGreen"
			} },
			Target = "Ally"
		},
		Bio = "He cooks up a mean stew. It's neutritious.",
		AddGenZoneant = "Green Stud"
	},
	Fate_Sealed = {
		Id = 10340869399,
		Name = "Fate_Sealed",
		AltCards = {
			N_ME = {
				Id = 123377357789031,
				Name = "N_ME",
				PremiumArt = 337,
				AltArt = true,
				Bio = "\"Managing passports is hard, but atleast I'm not Mark, who has to deal with 15 monitors! Also trying to find transactions using Qubits.\""
			}
		},
		Health = 650,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Knife",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Each allied fighter with the lowest health gains 350 health.",
			Type = "OnSummon",
			Power = { { "Heal", 350 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "LowestStat",
				Modifier = "Health"
			}
		},
		Bio = "Pfft. How would you make someone's fate sealed? With glue?"
	},
	["Forest of Paradise"] = {
		Id = 4783068835,
		Name = "Forest of Paradise",
		AltCards = {
			["Green Party"] = {
				Id = 127810479887224,
				Name = "Green Party!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 576,
				Bio = "“Join the party! You’re sure to have some fun!”",
				Terrariant = "Paradise Terrain-Party"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 2257349789,
		Terrain = true,
		Terrariant = "Paradise Terrain",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Stud",
			Description = "Whenever a player casts a card that costs 1 or more {W}: They gain half the {W} from its cost.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Neutral" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 0.5, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{ "Neutral", "Variable" }
					},
					Target = "Ally"
				},
				OnAnyEnemyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Neutral" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 0.5, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "RoundFloor", "Math", 1, "Nil" },
							"Self"
						},
						{ "Neutral", "Variable" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "Do you not feel the spirits?"
	},
	Turtleuser3 = {
		Id = 10288355389,
		Name = "GordonRox24",
		CopyBodge = "Turtleuser3",
		Health = 450,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3, Green = 4 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "Whenever you cast an allied fighter: It gains 150 health and power.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 150, "Aggressor" },
				{ "Strengthen", 150, "Aggressor" }
			},
			Target = "Aggressor"
		},
		Bio = "GordonRox24 is a former forum moderator and administrator. He used to moderate All Things ROBLOX and Help(Technical Support and Account Issues). While he is no longer an administrator, he is still on the platform from time to time and remains a huge fan to this day."
	},
	vanjohnson = {
		Id = 10288772035,
		Name = "vanjohnson",
		AltCards = {
			["vanjohnson-E"] = { Id = 12965129591, Bio = "" }
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Vroom",
			Description = "Whenever this card attacks: You gain 300 life. Your opponent loses 300 life.",
			Type = "OnAttack",
			Power = {
				{ "Cost", -300 },
				{ "Inflict", 300, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Those of you who volunteered to be injected with praying mantis DNA, I've got some good news and bad news. Bad news is that we're postponing those tests indefinitely. Good news is that we've got a new test for you: Fighting an army of mantis men."
	},
	Hoote = {
		Id = 10288364675,
		Name = "Hoote",
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Appeal",
			Description = "When this card is cast: You gain 800 life.",
			Type = "OnSummon",
			Power = { { "Cost", -800 } },
			Target = "Opponent"
		},
		Bio = "The paper bag hides his identity, even though you can just read the name of the card."
	},
	["Mass Epidemic"] = {
		Id = 6022464298,
		Name = "Mass Epidemic",
		AltCards = {
			["Mass Epidemic-E"] = {
				Id = 8765167562,
				Name = "Eggmin Launch!",
				Bio = "FINE! HERE YOU GO!! ALL THE EGGS YOU COULD EVER ASK FOR!!! NOW LEAVE ME ALONE!!!!"
			},
			["Nastrond's Purge"] = {
				Id = 117224424666578,
				Name = "Nastrond's Purge",
				AttackEffect = "MagicGreen",
				AltArt = true,
				PremiumArt = 407,
				Bio = "<b><font color=\"#00FF00\">Nastrond's Purge unleashes a cataclysmic reckoning, leaving only</font>><font color=\"#FF0000\">ruin</font><font color=\"#00FF00\">in its wake.</b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		Archetype = "Boardwipe",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Neutral = 4, Green = 6 },
		Bio = "NOOOOO!! MY SKELETON ARMY!!!",
		AddBlock = true,
		Fading = true,
		Effect = {
			Name = "Board Clear Preparation!",
			Description = "Put all non-Colourless fighters into their baseplate.",
			Type = "OnSummon",
			Power = {
				{ "MoveGenZone", 30, "ColorBlue" },
				{ "MoveGenZone", 30, "ColorGreen" },
				{ "MoveGenZone", 30, "ColorYellow" },
				{ "MoveGenZone", 30, "ColorRed" }
			},
			Target = "NotArchetype"
		}
	},
	Razuatix = {
		Id = 10288430405,
		Name = "Razuatix",
		AltCards = {
			Edgar = {
				Id = 10288431998,
				Name = "Dark Dominus",
				AttackEffect = "DoomStorm",
				EffectAnimation = "LargeDoomStormEffect",
				Bio = "IT'S REAL!"
			},
			["Lemonade_Glas, Synthesized"] = {
				Id = 12653984788,
				Name = "Lemonade_Glas, Synthesized",
				AttackEffect = "MagicGreen",
				Commissioner = { 597319418 },
				AltArt = true,
				PremiumArt = 3,
				Bio = "“I make some of the music for this game! Fun fact: You can type ‘/console’ in chat and see what music is playing”"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Electric",
		EffectAnimation = "LargeElectricEffect",
		Color = "Green",
		Cost = { Neutral = 2, Green = 8 },
		Effect = {
			Name = "Assassinate",
			Description = "When this card is cast: Destroy a target fighter.",
			Type = "OnSummon",
			Power = { { "Destroy" } },
			Target = "Single",
			Increase = 1
		},
		Bio = "He's the best scout in Blox Cards. He's the only scout in Blox Cards."
	},
	Shaylan007 = {
		Id = 122882618545036,
		Name = "Cliff the Truthfinder",
		AltCards = {
			["Shaylan007-Alt"] = {
				Id = 72970741733576,
				Name = "Helen Ridley",
				AttackEffect = "Rifle",
				EffectAnimation = "BloxyBuff",
				AltArt = true,
				Bio = "Even the luckiest stars run out of light eventually."
			},
			["Midnight Dance Duo"] = {
				Name = "Midnight Dance Duo",
				EffectAnimation = "TurkeyBuff",
				AttackEffect = "Jab",
				Id = 11658622122,
				Bio = "\"Tonight we're growing closer, closer to the edge. Are we fools for eachother, or fools for falling in?\""
			},
			["Shaylan007-AN-Offer"] = {
				Name = "Party Planner",
				AttackEffect = "Jab",
				Id = 18405097875,
				Bio = "This Friday Night, do it all again..."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		EffectAnimation = "TurkeyBuff",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Whenever an allied effect targets: This card gains 150 Health and Power.",
			Type = "OnAllyTarget",
			Power = {
				{ "Heal", 150 },
				{ "Strengthen", 150 }
			},
			Target = "Self"
		},
		Bio = "Expedition Log 349-B<br/>One of our excavator boys ran into something very strange while cracking open some geodes earlier. It's some kind of ceremonial knife, and the text on it doesn't match any language in our databases, so it'll need some forensic testing. The kid that found it wouldn't let us take it for transport, though. Not sure why, considering that's a massive breach of protocol, but whatever. We can just get it back later; I wasn't about to argue with someone in a power loader."
	},
	["ST Leader Keeler1"] = {
		Id = 10834073142,
		Name = "Nimblz",
		AltCards = {
			["Nimblz-Hal"] = {
				Id = 10288425421,
				AttackEffect = "Slash",
				Effect = {
					Power = {
						{ "Summon", "Eg-Hal" },
						{ "Summon", "Eg-Hal" }
					},
					Target = "Ally"
				},
				Bio = "Hmm? Wrong holiday? What are you talking about? These are Halloween Egz!"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 5 },
		CustomReminder = {
			Egz = "A {G}{G} 300/300, inert in play. It gives you 200 life during your end step."
		},
		Effect = {
			Name = "Render",
			Description = "When this card is cast: summon 2 300/300 Egz.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "ST Grunt" },
				{ "Summon", "ST Grunt" }
			},
			Target = "Ally"
		},
		Bio = "They certainly are."
	},
	["ST Grunt"] = {
		Id = 10288426511,
		AltCards = {
			["Eg-Hal"] = {
				Id = 10288428110,
				AttackEffect = "Slash",
				Bio = "(They're not even called Halloween Eg...)"
			}
		},
		Name = "Eg",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		Token = true,
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Render",
			Description = "During your end step: You gain 200 Life.",
			Type = "OnEnd",
			Power = { { "Cost", -200 } },
			Target = "Ally"
		},
		Bio = "He's on your face."
	},
	Anderson = {
		Id = 10243210773,
		Name = "Anderson",
		AltCards = {
			["Sir Keeler1"] = {
				Name = "Sir Keeler1",
				CopyBodge = "Sir Keeler1",
				AttackEffect = "Slash",
				Id = 10243405865,
				AltArt = true,
				Bio = "Have at thee!"
			},
			["Anderson-Sun"] = { Name = "Lebron", Id = 9964704040, Bio = "SLAM!" }
		},
		Health = 350,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Red = 1, Neutral = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "He's a huge fan of Miami Heat, and he'll destroy you in the court if you talk smack about his team!"
	},
	["Corrupt SoulSearch"] = {
		Id = 10243409388,
		Name = "Beebo",
		AltCards = {
			["Beebo-E"] = {
				Id = 9964714197,
				AttackEffect = "MagicGreen",
				Bio = "Yo! That's the Eggscream!"
			},
			["Roadkill Flufflefunz"] = {
				Id = 106368171293233,
				AltArt = true,
				Name = "Roadkill Flufflefunz",
				AttackEffect = "Slash",
				Bio = "Perpetuating the stereotype."
			},
			["Dead Dog Reviewer"] = {
				Id = 13903565393,
				AltArt = true,
				Name = "Dundle",
				AttackEffect = "Storm",
				Bio = "A unusual, unique creature. Your average Dundle has a natural liking towards toasters, although scientists haven't found out as to why. Perhaps it's because both Dundle and toasters have a similar level of IQ."
			},
			GladiEGGor = {
				Id = 91892546569209,
				Name = "GladiEGGor",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 607,
				Bio = "\"Don't mind the fire, it's just like that.\""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 1, Yellow = 1 },
		Effect = {
			Name = "GENDER STATUS : HACKED",
			Description = "When this card is cast: You lose 300 life. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "Cost", 300 }
			},
			Target = "All"
		},
		Bio = "His capabilities of world destruction are awe-striking."
	},
	FishBubble1002 = {
		Id = 10243447929,
		Name = "FishBubble1002",
		Health = 800,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "SleepyHead",
			Description = "Whenever this card attacks a fighter: It deals 300 damage to that fighter.",
			Type = "OnAttack",
			Power = { { "Damage", 300 } },
			Target = "Aggressor"
		},
		Bio = "IS IT A FISH? IS IT A BUBBLE? I'M SO CONFUSED!!"
	},
	["Melon Desu"] = {
		Id = 10243198640,
		Name = "Melon Desu",
		AltCards = {
			Sugarlord = {
				Id = 11344348174,
				Name = "Punished Buddy",
				AttackEffect = "Slash",
				Bio = "74-137"
			}
		},
		Health = 300,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2 },
		Effect = {
			Name = "ARE YOU HAPPY, DAIR?",
			Description = "When this card is cast: Destroy your opponent's terrain.",
			Type = "OnSummon",
			Power = { { "DestroyTerrain" } },
			Target = "Opponent"
		},
		Bio = "It's not like I like watermelons o-or anything..."
	},
	["Dodgeball Player Red"] = {
		Id = 124290785291422,
		Name = "MELANCHXLICAL",
		AltCards = {
			["Dodgeball Player Red-E"] = {
				Id = 121103122161667,
				Name = "Monsieur Labouef",
				AttackEffect = "Slash",
				EffectAnimation = "MidSlashEffect",
				Bio = "Ah ah ah! Stop right there, you fool! Those eggs are under MY strict protection! EN GARDE!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Neutral = 4 },
		EffectAnimation = "MidBritishEffect",
		Effect = {
			Name = "a dodgeball to a the face!",
			Description = "Once each turn, whenever you discard a card: Deal 100 damage to a target enemy fighter.",
			Type = "OnAllyDiscard",
			Power = { { "Damage", 100 } },
			Target = "SingleEnemy",
			TurnTriggerLimit = 1
		},
		Bio = "It's their one good day. All they needed was one good day."
	},
	SoulSearch = {
		Id = 11496916240,
		Name = "SoulSearch",
		AltCards = {
			["SoulSearch-Val"] = {
				Id = 10629740661,
				Name = "SoulMateSearch",
				AttackEffect = "Firebrand",
				CopyBodge = "SoulSearch-Val",
				Bio = "Always searching for the perfect soulmate."
			},
			SoulSearchEngine = {
				Id = 10862106596,
				Name = "CheemSearch",
				AttackEffect = "Firebrand",
				Bio = "\"Bring me an Hidden Cheems, and I may listen to your plea.\""
			},
			["SoulSearch-DW"] = {
				Id = 10862085448,
				AltArt = true,
				Bio = "It's so good to see you again!"
			},
			["SoulSearch-DualAxe"] = {
				Id = 97992046996283,
				Name = "Dual Axe Monsters",
				AttackEffect = "Battleaxe",
				AltArt = true,
				PremiumArt = 611,
				Bio = "Double the Monster, quadruple the axe."
			}
		},
		Health = 1300,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Red = 7 },
		Effect = {
			Name = "Hellfire",
			Description = "Whenever this card attacks your opponent directly: It gains 500 health and power.",
			Type = "OnStrike",
			Power = {
				{ "Heal", 500 },
				{ "Strengthen", 500 }
			},
			Target = "Self"
		},
		Bio = "Always searching for the perfect soul."
	},
	Vaktus = {
		Id = 9238687889,
		Name = "Ephialtes",
		AltCards = {
			["Lord Crimsonwrath"] = {
				Id = 15589154755,
				Name = "Lord Crimsonwrath, Ashgarn",
				Bio = "You'll wish for the coldness of the Void."
			},
			["Ephialtes-Banner"] = {
				Id = 12374289643,
				Name = "Magical Girl Ephialtes",
				Bio = "\"To protect the world, with the power of love and friendship!\" <i>stabs you with spear</i>"
			}
		},
		Health = 1200,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4, Red = 5 },
		Effect = {
			Name = "Assimilate",
			Description = "Whenever your opponent loses life: Draw a card. You lose 600 life.",
			Type = "OnEnemyHealthLoss",
			Power = {
				{ "Draw", 1 },
				{ "Cost", 600 }
			},
			EffectRequirement = { "Playertable", "Him", 1, 999999999, "Life" },
			Target = "Ally"
		},
		Bio = "\"She was certainly a better lady than I ever will be, but I'm glad my master hardly seems to care.\"\n— Tess"
	},
	Damaging26 = {
		Id = 10243263406,
		Name = "Damaging26",
		AltCards = {
			["Damaging26-Inno"] = {
				Id = 10243281438,
				CopyBodge = "Damaging26-Inno",
				Bio = "Gotta grind those bees somehow."
			},
			cursebad = {
				Id = 10243283235,
				AttackEffect = "Jab",
				CopyBodge = "cursebad",
				Name = "cursebad",
				AltArt = true,
				Bio = "JoJo good."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Red = 1, Neutral = 3 },
		Effect = {
			Name = "Redead",
			Description = "Whenever an enemy fighter is cast: Deal 100 damage to it.",
			Type = "OnEnemySummon",
			Power = { { "Damage", 100, "Aggressor" } },
			Target = "All"
		},
		Bio = "I always claim the first strike. Literally."
	},
	KurosakiDXenos = {
		Id = 10243355970,
		Name = "KurosakiDXenos",
		AltCards = {
			Yagami = {
				Id = 10243354255,
				Name = "Yagami",
				AttackEffect = "Arcane",
				AltArt = true,
				Bio = "\"You'll remember me each time you look at the board.\""
			},
			["Ultimate Instinct Scardman5"] = {
				Id = 10243357895,
				Name = "Ultimate Instinct Scardman5",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "\"Like, you really made me use 1% of my full power, man!\""
			},
			["Zero_Expectation, Love-Driven"] = {
				Id = 13727864462,
				Name = "Zero_Expectation, Love-Driven",
				AttackEffect = "British",
				Commissioner = { 1082444751, 105850517 },
				AltArt = true,
				PremiumArt = 54,
				Bio = "\"For my loved one, I would do anything, no matter what it takes.”"
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Katana",
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Name = "Render",
			Description = "Whenever this card destroys another: It gains 150 Power. Unlock it.",
			Type = "OnDestroy",
			Power = {
				{ "Unlock", 9999 },
				{ "Strengthen", 150 }
			},
			Target = "Self"
		},
		Bio = "Coming in from Xenoverse, we have Xenos! A strong controller of the shadows! He's the first elemental to become a soul reaper! Also known as KurosakiDXenos2!"
	},
	Vinrole = {
		Id = 11973588055,
		Name = "Vinrole",
		AltCards = {
			["Vinrole-C"] = {
				Id = 15252286756,
				Name = "Vinrole",
				AttackEffect = "TimeBomb",
				Bio = "Head editor of the Nice and Naughty List, especially who gets really cheap knockoffs for Christmas and who gets paternal love."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 4, Red = 1 },
		Effect = {
			Name = "BLEU",
			Description = "Whenever your opponent casts a fighter, if they've already cast a fighter this turn: They lose 500 Life.",
			Type = "OnEnemySummon",
			Power = { { "Inflict", 500 } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Him", 2, 9999, "Fighters" }
		},
		Bio = "Guy Fieri? He's popular because of me."
	},
	HungryBloxBoy = {
		Id = 10243208368,
		Name = "HungryBloxBoy",
		AltCards = {
			["Riki, Reptile Reaver"] = {
				Name = "Riki, Reptile Reaver",
				AttackEffect = "Katana",
				Id = 10243298509,
				AltArt = true,
				Bio = "Seventeen years ago you said\nSomething that sounded like Good-bye;\nAnd everybody thinks that you are dead,\nBut I.\n"
			},
			imilion = {
				Name = "imilion",
				AttackEffect = "Recyclables",
				Id = 10243302151,
				AltArt = true,
				Bio = "EEeEEeEeEeEeeeeeEeeEEEeeeEEeEeeeE."
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		AssignMultiple = 2,
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Revival",
			Description = "During combat, this card assigns double its power in damage to fighters and players.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Hungry for some justice."
	},
	Mitpaul = {
		Id = 10243366683,
		Name = "Mitpaul",
		AltCards = {
			["Mitpaul-Sun"] = {
				Name = "Mitpaul",
				Id = 10243367079,
				CopyBodge = "Mitpaul-Sun",
				Bio = "Jet skis are the natural counter to walruses."
			},
			["Duo Tyrants"] = {
				Name = "Duo Tyrants",
				AttackEffect = "FirePunch",
				Id = 9208861530,
				AltArt = true,
				Bio = "Make way for the Two-Headed Tyrant. The Towers of Power! Here's Duo Tyrants!"
			},
			["MELANCHXLICAL, Vigilant"] = {
				Name = "MELANCHXLICAL, Vigilant",
				AttackEffect = "Bottle",
				Id = 129323449471168,
				Commissioner = { 297087291 },
				AltArt = true,
				PremiumArt = 103,
				Bio = "THERE IS SOMETHING PROF\nOUNDLY WRONG WITH ME\nWHAT A FREEAAAKKK!!!!!!\nI WILL BE BURIED IN AN OIL TANK"
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Red = 2, Neutral = 2 },
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		Effect = {
			Name = "Amp Up! Blaster!",
			Description = "Whenever this card destroys another: Give yourself a Moonleak.",
			Type = "OnDestroy",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "A genuinely professional professional."
	},
	PixelPistol = {
		Id = 10243215540,
		Name = "PixelPistol",
		AltCards = {
			["PixelPistol-Val"] = {
				Name = "PixelPistol",
				AttackEffect = "Revolver",
				Id = 10243372004,
				CopyBodge = "PixelPistol-Val",
				Bio = "On second thought, I'm alright with my past choices."
			},
			["Niever Tryhard"] = {
				Id = 10243373993,
				AttackEffect = "MagicRed",
				AltArt = true,
				Name = "Niever Tryhard",
				Bio = "\"He's not a monster, it's only a mask.\""
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		Effect = {
			Name = "Amp Up! Blaster!",
			Description = "When this card is cast: A target fighter gains 500 Power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 500
		},
		Bio = "Futuristic AWOL soldier who wants to escape his past self."
	},
	Plankton124 = {
		Id = 10243827141,
		Name = "Plankton1245",
		AltCards = {
			Valython = {
				Name = "Valython",
				AttackEffect = "Rifle",
				Id = 6499186756,
				AltArt = true,
				Bio = "Owned."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Stud",
			Description = "Whenever this card attacks: Your opponent loses 500 life.",
			Type = "OnAttack",
			Power = { { "Inflict", 500 } },
			Target = "Opponent",
			Increase = 0
		},
		Bio = "Not a fan of Sponge baths."
	},
	RealPiggy1261 = {
		Id = 10243218457,
		Name = "RealPiggy1261",
		Health = 650,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Charge = true,
		Effect = {
			Name = "Life fam",
			Description = "When this card dies: Deal 100 damage to all fighters.",
			Type = "OnDeath",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "He wipes clean all stench of Suidae."
	},
	Supersky712 = {
		Id = 10243226256,
		Name = "supersky712",
		AltCards = {
			["Supersky712-E"] = {
				Id = 10243380667,
				AttackEffect = "Slash",
				Name = "Moto Bunny",
				Bio = "Number one racer in the egg cup."
			}
		},
		Health = 700,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
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
	["Damaging26, Flaming Fighter"] = {
		Id = 10243834934,
		Name = "Fut_re",
		CopyBodge = "Damaging26, Flaming Fighter",
		Health = 750,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 4, Red = 5 },
		Effect = {
			Name = "Burning Fists of Rage",
			Description = "Whenever an enemy fighter dies: Your opponent loses 200 life. This card gains 200 Power.",
			Type = "OnEnemyDeath",
			Power = {
				{ "Inflict", 200, "Opponent" },
				{ "Strengthen", 200 }
			},
			Target = "Self"
		},
		Bio = "Ｎｏｗ ｔｈａｔ＇ｓ ａ ｌｏｔｔａ ｄａｍａｇｅ"
	},
	HyperVoxel = {
		Id = 10243116271,
		Name = "HyperVoxel",
		AltCards = {
			["HyperVoxel-Hal"] = {
				Id = 11973314135,
				AttackEffect = "SkeleScythe",
				Bio = "The bigger the kill count, the better the movie!"
			},
			["Gamers Unite"] = {
				Id = 12808864769,
				Name = "Gamers Unite!",
				AttackEffect = "Knife",
				EffectAnimation = "MidKnifeEffectAll",
				AltArt = true,
				PremiumArt = 9,
				Bio = "What do you get when you mix a Bloxy Cola™️ enjoyer with a duck enthusiast? …check your field."
			},
			SPK_Virus = {
				Id = 13653696758,
				Name = "SPK_Virus",
				Commissioner = { 1711805585, 41926915 },
				AltArt = true,
				PremiumArt = 42,
				Bio = "<i>How did I fraud through the tourney ? I got no idea but lol I did it</i>"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Hammer",
		EffectAnimation = "MidHammerEffectAll",
		Color = "Red",
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
	Crazynoggin = {
		Id = 10243081295,
		Name = "Crazynoggin",
		AltCards = {
			CrazyEggNoggin = {
				Id = 11479688863,
				Name = "CrazyEggNoggin",
				AttackEffect = "Flare",
				Bio = "My house is flooded with eggnog. Just what I wanted for Christmas. Thanks, Santa!"
			},
			Matilda = {
				Id = 74348316992625,
				AltArt = true,
				Name = "Kill",
				AttackEffect = "Slash",
				Bio = "\"THE BOX..! YOU OPENED IT, AND I ARRIVED! Ahem... that's what I would say if movie references weren't cringe.\""
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		CounterAttackBlock = true,
		Cost = { Neutral = 2, Red = 2 },
		Effect = {
			Name = "Stud",
			Description = "",
			Type = "Null",
			Power = "None",
			Target = "Self",
			Increase = 0
		},
		Bio = "Nog? NogNog! Nog Noggggg? Neg Nog Cod."
	},
	["Roblox Gift Card"] = {
		Id = 10242904027,
		Name = "Roblox Gift Card",
		AltCards = {
			["Roblox Gift Card-C"] = {
				Id = 15252289678,
				Name = "Memory of Gifts",
				Addant = "Roblox Gift Card-C",
				Bio = "Through all the turmoil, do you still remember? That fateful day."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Null",
		Addant = "Roblox Gift Card",
		Color = "Red",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Thug Life",
			Description = "Give yourself an Uncommon card.\nGive your opponent a copy of this card.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Uncommon" },
				{ "Add", "Addant", "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Give the gift of giving the gift of giving the gift of uncommons."
	},
	SkySpell = {
		Id = 10243809793,
		Name = "SkySpell",
		AltCards = {
			["SkySpell-C"] = {
				Id = 72719537306582,
				Name = "John McClean",
				AttackEffect = "Gun",
				Bio = "Yippee Ki Yay!"
			},
			["Rider of Black, Astolfo"] = {
				Name = "Daizuya",
				AttackEffect = "Storm",
				Id = 11028445935,
				AltArt = true,
				Bio = "I'm not gonna sugarcoat it."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		ChargeRequirement = { "Playertable", "Me", 50, 999999999999999, "EffectLifeLoss" },
		AttackEffect = "SMG",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Name = "Investment",
			Description = "This card has haste if an effect made you lose life since your last end step.\nWhenever this card destroys another: Unlock it. Your opponent loses 500 life.",
			Type = "OnDestroy",
			Power = {
				{ "Unlock", 9999, "Self" },
				{ "Inflict", 500 }
			},
			Target = "Opponent"
		},
		Bio = "An absolute zero. I'm nobody's hero."
	},
	ZeDerpyDonal = {
		Id = 10243163933,
		AltCards = {
			["ZeDerpyDonal-C"] = {
				Name = "Chocolate Vendor",
				AttackEffect = "Flare",
				Id = 15176636302,
				Bio = "Wait a bit, or you'll burn your tongue!"
			}
		},
		Name = "ZeDerpyDonal",
		Health = 1200,
		Power = 1200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 5, Red = 1 },
		AttackBlock = true,
		Effect = {
			Name = "Definitely Not StayBlue",
			Description = "",
			Type = "Nil",
			Power = "Damage",
			Target = "Self",
			Increase = 0
		},
		Bio = "I'm too busy reading. I'll attack some other time."
	},
	Player = {
		Id = 15589157665,
		Name = "Player",
		AltCards = {
			["Player-Hal"] = {
				Name = "Takashi The Opportunist",
				AttackEffect = "DoomStorm",
				Id = 14555987317,
				Bio = "You are stopped by a masked man with a weird expression.\n\"Nothing Personal... Really...\""
			},
			["Player-Alt"] = {
				Name = "Player",
				AttackEffect = "DoomStorm",
				Id = 16446072106,
				AltArt = true,
				PremiumArt = 221,
				Bio = "lil bro thought he was him"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "LinkedSword",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Power Within",
			Description = "When this card dies: All fighters in your hand gain 150 Power.",
			Type = "OnDeath",
			Power = { { "StrengthenHand", 150 } },
			Target = "Ally"
		},
		Bio = "If you've ever pressed Play Solo in Studio you know this name."
	},
	["Peika Sammai"] = {
		Id = 10242846550,
		Name = "Peika Sammai",
		AltCards = {
			["Peika Sammai-E"] = {
				Id = 10242841499,
				AttackEffect = "Slash",
				Name = "Blunny McCarrot",
				Bio = "It's ironic he's a red card considering he hates the color."
			},
			Fluff = {
				Id = 118588842106192,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "Fluff"
			},
			["Kezo, State of Flow"] = {
				Id = 133210606893050,
				Name = "Kezo, State of Flow",
				AttackEffect = "XhartyrSlash",
				AltArt = true,
				PremiumArt = 606,
				Bio = "BRING IT ON!!!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step: This card gains 150 health and power. You lose {W}{W}.",
			Type = "OnEnd",
			Power = {
				{ "Neutral", -2 },
				{ "Heal", 150, "Self" },
				{ "Strengthen", 150, "Self" }
			},
			Target = "Ally"
		},
		Bio = "THIS IS A LATE BIRTHDAY GIFT, ISN'T IT"
	},
	Burning_Soul_Blade = {
		Id = 9937802639,
		Name = "Burning Soul Blade",
		AltCards = {
			["Burning_Soul_Blade-Sun"] = {
				Name = "Burning Sun",
				Id = 9208881838,
				Bio = "Pass the SFP 5000000+."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 4, Red = 4, Blue = 4 },
		AddBlock = true,
		Effect = {
			Name = "HURT ALL THE THINGS",
			Description = "All enemy fighters lose 400 Power.\nAll allied fighters gain 400 Power.\nSwap the stats of all fighters.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 400 },
				{ "Strengthen", 400, "Ally" },
				{ "Swap", 100000, "All" }
			},
			Target = "Opponent"
		},
		Bio = "\"Biggs would sell the entire theme park if it meant having the last of Havalu's tech.\"\n— Pier"
	},
	TheJazzCat22 = {
		Id = 10243890153,
		Name = "TheJazzCat22",
		AltCards = {
			["Gambling God Flufflefunz"] = {
				Name = "andy",
				AttackEffect = "Slash",
				Id = 136515632764940,
				AltArt = true,
				Bio = "Congratulations - you are not a sociopath!"
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1 },
		EffectAnimation = "SaxophoneBuff",
		Effect = {
			Name = "Hellfire",
			Description = "Whenever you cast an epic fighter: This card gains 200 Health.\nWhenever you cast a legendary fighter: This card gains 200 Power.",
			Ability = {
				OnAllySummonSupercede = {
					Power = { { "Heal", 200 } },
					Rarity = "Epic",
					Target = "Self"
				},
				OnAllySummon = {
					Power = { { "Strengthen", 200 } },
					Target = "Self",
					Rarity = "Legendary"
				}
			}
		},
		Bio = "Ya' like jazz?"
	},
	Bigtank_s = {
		Id = 10279215195,
		Name = "Bigtank_s",
		AltCards = {
			PixelCrypth = {
				Id = 10279217601,
				Name = "PixelCrypth",
				AttackEffect = "MagicRed",
				Bio = "Every plant can grow but this flower keeps growing."
			},
			["Bigtank_s-AN"] = {
				Id = 9368688571,
				Name = "Catalog Heaven Newbie",
				AttackEffect = "ClassicRocket",
				Bio = "He threatens to take everything you love away."
			}
		},
		Health = 350,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "ModernRocket",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Life fam",
			Description = "During your end step: This card gains 50 Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 50 },
				{ "Strengthen", 50 }
			},
			Target = "Self"
		},
		Bio = "You know you're in trouble when Bigtank_s comes out of his custom Panzerkampfwagen VI Tiger II just to fight you."
	},
	Elioofsheep = {
		Id = 10279240239,
		Name = "Elioofsheep",
		AltCards = {
			TheTiesShedding = {
				Id = 132046053021015,
				Name = "TheTiesShedding",
				Commissioner = { "TheTiesWhite" },
				Effect = {
					Name = "Poisonous Touch",
					Description = "During your end step: Give yourself a 400/150 Noob that's inert in all zones. It costs {W} to cast.",
					Type = "OnEnd",
					Power = { { "Add", "SheddingNoob" } },
					Target = "Ally",
					MetaData = { TokenOmni = true }
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 693,
				Bio = "why is he scary 👀"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "During your end step: Give yourself a 400/150 Noob that's inert in all zones. It costs {W} to cast.",
			Type = "OnEnd",
			Power = { { "Add", "Round7" } },
			Target = "Ally",
			MetaData = { TokenOmni = true }
		},
		Bio = "GET OUT OF MY ROOM I'M PLAYING BLOX CARDS"
	},
	["Luck Warrior of Pure Gold"] = {
		Id = 10279326467,
		Name = "Luck Warrior of Pure Gold",
		AltCards = {
			["Luck Warrior of Pure Gold-Sun"] = {
				Id = 9173943366,
				Name = "Taxi Driver",
				AttackEffect = "Jab",
				Bio = "\"\"Good afternoon, Sir! Going to the beach, I presume?\" \"How did I guess that? Well, most people tend to head to the beach during the summer season, so it wasn't exactly a prophetic guess.\" \"What am I doing still working? Well, I suppose I've asked myself that before. Realistically speaking, someone has to drive you summer folks to the beach, right? Not everyone can enjoy it.\" \"Oh, don't worry about me, Sir. It's nothing too problematic. I'm just a simple taxi driver, that's all.\""
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Too lucky 4 me",
			Description = "When this card is cast, if you've cast 4 or more fighters this turn: Unlock all fighters. You can't cast fighters this turn.",
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
	["Candy Robber"] = {
		Id = 10279355066,
		Name = "silky_dev",
		AltCards = {
			YingTaoQueen = {
				Id = 10279359355,
				Name = "YingTaoQueen",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "After the Fall of Noob Lifeloss, she will now try out a new deck with a new power."
			},
			["Beach Duo ImAwkwrd & Bibee"] = {
				Id = 10279365673,
				Name = "Beach Duo ImAwkwrd & Bibee",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Nothing beats a nice sunny summer day on the beach with good vibes all around."
			},
			["silky_dev-AN"] = {
				Id = 9381262611,
				Name = "Chicken Cultist",
				AttackEffect = "Blaze",
				Bio = "Let's cause an apocalypse over here!"
			},
			["Weakling Figurine"] = {
				Id = 17251034851,
				Name = "Weakling Figurine",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 252,
				Bio = "Annihilate your foes with the all new TOY WEAKLING ENEMY! Engineered to be literally indestructible! (disclaimer: not actually indestructible) With new Level Up action! Order today for 2 yellow studs ($116.66). Chaos Organization Toys™ is not responsible for death caused by products."
			}
		},
		Health = 550,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "What's in the box?"
	},
	Drager = {
		Id = 10279271315,
		Name = "Drager",
		AltCards = {
			["Drager-ArtV"] = {
				Id = 10278806138,
				AttackEffect = "Jab",
				CopyBodge = "Drager Art-V",
				AltArt = true,
				Bio = "Also known as drager980, Drager is the original scripter of Blox Cards and is secretly a wizard. Part of the 'Aife' Collection! Collect them all!"
			},
			["Drager-AN"] = {
				Id = 9354546932,
				AttackEffect = "Scratch",
				Bio = "After all these years, their howls still haunt him."
			},
			["Drager-AnimatedAlt"] = {
				Id = 11778308191,
				Name = "drager980",
				AttackEffect = "Slash",
				ArtAnimation = "Drager980",
				AltArt = true,
				Bio = "This will be SHADOVIS RPG graphics in 2015"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever an effect gives you a card: Set your {W}{R}{G}{B}{Y} to 3.",
			Type = "OnAllyPut",
			Power = {
				{ "SetRed", 3 },
				{ "SetGreen", 3 },
				{ "SetBlue", 3 },
				{ "SetYellow", 3 },
				{ "SetNeutral", 3 }
			},
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Also known as drager980, Drager is the original scripter of Blox Cards and is secretly a wizard."
	},
	AgentBloxxer = {
		Id = 10938756232,
		Name = "AgentBloxxer",
		AltCards = {
			tixocthebuster = {
				Name = "tixocthebuster",
				AttackEffect = "Rifle",
				Id = 8926334363,
				AltArt = true,
				Bio = "YO! MERRY CHRISTMAS!!!!!"
			},
			["Silicon Sentiment"] = {
				Name = "Silicon Sentiment",
				AttackEffect = "StudBlast",
				Id = 14398657741,
				Bio = "Times were simpler, but render times have never been longer."
			}
		},
		Health = 400,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "ClassicRocket",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 6 },
		AlternateCost = { Yellow = 1 },
		AlternateCostRequirement = { "Board", "Ally", 7, 9999 },
		Effect = {
			Name = "Trout Slap",
			Description = "If there's 7 or 8 allied fighters, cast this card using {Y}.\nWhen this card is cast: All allied fighters gain 200 health.",
			Type = "OnSummon",
			Power = { { "Heal", 200 } },
			Target = "Ally"
		},
		Bio = "Creator of Destroy the Wall and Brick Factory Tycoon. That's some real yin yang right there."
	},
	["Frenemy's Bargain"] = {
		Id = 10697370054,
		Name = "Frenemy's Bargain",
		AltCards = {
			["Frenemy's Bargain-Sun"] = {
				Id = 10697371076,
				Bio = "When encountering a Sea Friend, it either grants you gifts or it grants you destruction. Pray it lends you the former."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Frenemy",
			Description = "Each player draws 3 cards from their opponent's deck.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Opponent", "Hand_Ally", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Ally", "Hand_Opponent", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Ally", "Hand_Opponent", true, false },
					"Self"
				},
				{
					"MoveZone",
					{ "Any", "Deck_Ally", "Hand_Opponent", true, false },
					"Self"
				}
			},
			Target = "Ally",
			MovezoneAsDraw = true
		},
		Bio = "One bengbeng14 coming right up, my dear frenemy. This will cost you your soul, however."
	},
	["Dairingpoophead, Tix God"] = {
		Id = 10629687039,
		Name = "Dairingpoophead, Tix God",
		AltCards = {
			["Dairingpoophead, Tix God-C"] = {
				Id = 11344346182,
				AttackEffect = "Microphone",
				Name = "Mariah",
				Summonant = "Lord of Greed-C",
				Bio = "<i>♬I don't want a lot for Christmas\n\t\t\t\t\t\t\tThere is just one thing I need\n\t\t\t\t\t\t\tI don't care about the presents underneath the Christmas tree\n\t\t\t\t\t\t\tI just want you for my own\n\t\t\t\t\t\t\tMore than you could ever know\n\t\t\t\t\t\t\tMake my wish come true\n\t\t\t\t\t\t\tAll I want for Christmas is you!♬</i>"
			}
		},
		Health = 1000,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 7 },
		Summonant = "Lord of GreedV2",
		CustomReminder = { ["Lord of Greed"] = "Whenever it destroys another, draw a card." },
		Effect = {
			Name = "Life fam",
			Description = "Whenever this card attacks and destroys another: Summon 2 550/100 Lords of Greed.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "Go forth my tix minions, make ROBLOX bow down to us until tix rise once again!"
	},
	MahBucket = {
		Id = 10279212033,
		Name = "Krazy Koala",
		Health = 400,
		Power = 300,
		AltCards = {
			MahBucketV2 = {
				Id = 8891689532,
				Name = "Krazy Koala",
				AltArt = true,
				Bio = "When flattered, even a koala can climb a tree... Oh wait, they already do that."
			},
			JohnnyTheRed = {
				Id = 3925066070,
				Name = "JohnnyTheRed",
				AttackEffect = "Slash",
				Bio = "Kono, JohnnyTheRed, yume ga aru."
			},
			["Krazy Koala-Sun"] = {
				Id = 13713222668,
				Name = "Shrimp Shokunin",
				AttackEffect = "Flare",
				EffectAnimation = "EngulfFire",
				Bio = "They can't believe a shrimp fried their rice."
			}
		},
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "Sugar Taste",
			Description = "When this card is cast: It deals 250 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 250 } },
			Target = "Single"
		},
		Bio = "He's been granted a title in being an internet sensation, but he likes to throw apples at people."
	},
	["Gobble Squad"] = {
		Id = 6687887727,
		Name = "Arsenal Squad",
		AltCards = {
			["Gent Manic Trio"] = {
				Id = 93732589421090,
				Name = "Gent Manic Trio",
				AttackEffect = "Gun",
				CopyBodge = "Gent Manic Trio",
				AltArt = true,
				Effect = {
					Name = "Gobble",
					Description = "When this card attacks: Give yourself a 300/300 Gent Manic Trio member that's inert in play.",
					Type = "OnAttack",
					Power = { {
						"RandomAdd",
						{ "Gent", "Falltz", "Rifo" }
					} },
					Target = "Ally"
				},
				Bio = "\"A human, a sword and a condol walk into a location.\""
			},
			["Magic Pixel Lariorians"] = {
				Id = 12808865409,
				AttackEffect = "Gravity",
				Name = "Magic Pixel Lariorians",
				AltArt = true,
				PremiumArt = 10,
				Effect = {
					Name = "Gobble",
					Description = "When this card attacks: Give yourself a 300/300 Magic Pixel Lariorian member that's inert in play.",
					Type = "OnAttack",
					Power = { {
						"RandomAdd",
						{ "Ghost Hexo", "Venon Knight", "Mayor of SSS" }
					} },
					Target = "Ally"
				},
				Bio = "<i>Robbed from greatness</i>"
			},
			["Arsenal Squad-Offer"] = {
				Id = 14912348558,
				AttackEffect = "Bite",
				Name = "Trio of Undead",
				PackDisplayOverride = "Hallow's Tale: Special Offer",
				Effect = {
					Description = "When this card attacks: Give yourself a 300/300 Undead Party member that's inert in play.",
					Type = "OnAttack",
					Power = { {
						"RandomAdd",
						{
							"ArsenalDelinquent-Hal",
							"ArsenalAnarchist-Hal",
							"ArsenalSoldier-Hal"
						}
					} },
					Target = "Ally"
				},
				Bio = "<i>Death brought these goobers together for an eternal adventure.</i>"
			}
		},
		Health = 650,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Rifle",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Gobble",
			Description = "When this card attacks: Give yourself a 300/300 Arsenal Squad member that's inert in play.",
			Type = "OnAttack",
			Power = { {
				"RandomAdd",
				{ "Turkey", "ArsenalAnarchist", "ArsenalSoldier" }
			} },
			Target = "Ally"
		},
		Bio = "'Okay guys, remember to stick together!'"
	},
	["Turkey Cannon"] = {
		Id = 10279104015,
		Name = "Arsenal: Golden Gun",
		AltCards = {
			["Arsenal: Golden Gun-C"] = {
				Id = 10279105436,
				Name = "Elf Cannon",
				Bio = "I'll take you someplace special, kid...",
				Summonant = "Turkey-C"
			},
			["Valuable Gem"] = {
				Id = 12872652555,
				Name = "Valuable Gem",
				Commissioner = { 68738329 },
				AltArt = true,
				PremiumArt = 14,
				Bio = "<i>A gem of high value. Sell at a merchant!</i>",
				Effect = {
					Description = "Deal 300 damage to a target fighter.\nSummon a 300/300 Chest Skeleton that's inert in play.\nYou gain {Y}{Y}."
				},
				Summonant = "Chest Skeleton"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Summonant = "Turkey",
		Effect = {
			Name = "Gobble",
			Description = "Deal 300 damage to a target fighter.\nSummon a 300/300 Arsenal Delinquent that's inert in play.\nYou gain {Y}{Y}.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300 },
				{ "Summon", "Summonant", "Ally" },
				{ "Yellow", 2, "Ally" }
			},
			Target = "Single"
		},
		Bio = "You're not gonna choke now, are you?"
	},
	Cheesycakes = {
		Id = 4987105177,
		Name = "Cheeseycakes",
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectAnimation = "EatCake",
		Effect = {
			Name = "Cake Amp",
			Description = "When this card is cast: A target fighter gains 50 health and power. Give yourself a Yellow card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 50 },
				{ "Strengthen", 50 },
				{ "RandomAdd", "MonoOnlyorYellowCost Yellow" }
			},
			Target = "Single"
		},
		Bio = "Cheesecakes are the true best cake, better than some silly half-baked pancake."
	},
	ianmossaboss = {
		Id = 4815665243,
		Name = "ianmossaboss",
		AltCards = {
			CCdukes = {
				Name = "CCdukes",
				AttackEffect = "MagicBlue",
				Id = 6347937938,
				AltArt = true,
				Bio = "Good evening sir, and goodnight forever."
			},
			["ianmossaboss-AN"] = {
				Name = "Cursed Bob",
				AttackEffect = "Scratch",
				Id = 9513512213,
				Bio = "I stepped into this cage willingly."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 1 },
		Effect = {
			Name = "/e cheer",
			Description = "When this card is cast: All enemy fighters lose 100 power.",
			Type = "OnSummon",
			Power = { { "Weaken", 100, "Opponent" } },
			Target = "Ally"
		},
		Bio = "Nice knife you got there, mind if I take it real quick?"
	},
	PowerCat123 = {
		Id = 8207882342,
		Name = "PowerCat123",
		AltCards = {
			["PowerCat123-E"] = {
				Id = 8846384510,
				Name = "PowerPeep123",
				AttackEffect = "Jab",
				Bio = "He feels no remorse consuming these crude effigies of his own kin."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		ReturnImmune = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: All allied fighters that cost 2 or fewer total studs gain 100 Health and Power. Return them to their hand.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 },
				{ "Return", 30 }
			},
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "TotalCostOrLess",
				Modifier = 2
			},
			Target = "CustomTarget"
		},
		Bio = "A follower of Shedletsky, the Fried One."
	},
	Valletta = {
		Id = 10279194495,
		Name = "Valletta",
		AltCards = {
			["Valletta-Sun"] = {
				Id = 10279195666,
				AttackEffect = "Revolver",
				CopyBodge = "Valletta-Sun",
				Bio = "I can’t reach that darn cup. SERVANTS!"
			},
			t0rbz = {
				Id = 10279197364,
				CopyBodge = "t0rbz",
				Name = "t0rbz",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Breadsword Squires train under the crustiest conditions."
			},
			["Devastated Walt "] = {
				Id = 10279200327,
				Name = "Devastated Walt",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = ":0"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "SMG",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		CustomReminderFleeting = true,
		Effect = {
			Name = "Just Business",
			Description = "When this card dies: You lose 500 life. Draw 2 fleeting cards.",
			Type = "OnDeath",
			Power = {
				{ "Cost", 500 },
				{ "FleetingDraw", 2 }
			},
			Target = "Ally"
		},
		Bio = "With security and an organized team of criminals, Valletta can easily take any threat down and tie loose ends."
	},
	["Lord of Greed"] = {
		Id = 15081187296,
		Name = "Lord of Greed",
		AltCards = {
			["Lord of GreedV2"] = {
				Name = "Pittacium Acolythus",
				EffectAnimation = "TixStackEffect",
				CopyBodge = "Lord of GreedV2",
				Id = 15408938223,
				Bio = "Why are you stealing something that *I* rightfully stole first?"
			},
			["Lord of Greed-Val"] = {
				Id = 15081135837,
				CopyBodge = "Lord of Greed-Val",
				Name = "Lord of Candy",
				Bio = "Lord of Candy is to grams as chocolate is to wrappers."
			},
			["Lord of Greed-C"] = {
				Id = 11344345020,
				Name = "Mariah's Helper",
				AttackEffect = "Jab",
				Bio = "\t\t\t\t<i>♬Santa, won't you bring me the one I really need? (Yeah, oh)</i>\n\t\t\t\t<i>Won't you please bring my baby to me?♬</i>\n\t\t\t\t"
			},
			["First-Year ImAwkwrd"] = {
				Id = 13822691445,
				AltArt = true,
				PremiumArt = 63,
				Name = "First-Year ImAwkwrd",
				AttackEffect = "Jab",
				Bio = "Hello everyone, It's Awk, although there's no DNA evidence to prove it. Maybe I'm just a really convincing hologram."
			}
		},
		Health = 550,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		EffectAnimation = "RobuxStackEffect",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Charge = true,
		Archetype = "Greed",
		Effect = {
			Name = "Blow Dart",
			Description = "Whenever this card destroys another: Draw a card.",
			Type = "OnDestroy",
			Power = "Draw",
			Target = "Ally",
			Increase = 1
		},
		Bio = "Lord of Greed is to Bowls as snakes are to barrels."
	},
	Hopelesssly = {
		Id = 11971796337,
		Name = "Hop Lee",
		CopyBodge = "Hopelesssly",
		AltCards = {
			["Hop Lee-AN"] = {
				Name = "Unadaptably, The Gatekeeper",
				AttackEffect = "Rifle",
				CopyBodge = "Hop Lee-AN",
				Id = 10779754104,
				Bio = "Access Denied.",
				Summonant = "Hop Lee-ANToken"
			},
			fosterTHEplayer32 = {
				Id = 129964245789289,
				Name = "fosterTHEplayer32",
				AttackEffect = "Katana",
				CopyBodge = "fosterTHEplayer32",
				AltArt = true,
				Bio = "The first member of the Bad Time Trio.  Also paid for all their commissions!",
				Summonant = "fosterTHEplayer32Token"
			},
			["ADeadBody14, Gungeoneer"] = {
				Id = 12653991064,
				Name = "ADeadBody14, Gungeoneer",
				AttackEffect = "Revolver",
				AltArt = true,
				PremiumArt = 2,
				Bio = "\"Blasphemy.\"",
				Summonant = "ADeadBody14, GungeoneerToken"
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Arrow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Summonant = "HopelessslyToken",
		Effect = {
			Name = "Assembly",
			Description = "Whenever you cast a fighter, if there are less than 2{W} amongst the costs of allied fighters: Summon a copy of this card with no effect.",
			Type = "OnAllySummon",
			Power = { { "Summon", "Summonant", "Self" } },
			Target = "Self",
			EffectRequirement = { "Cost", "Ally", 0, 2, "Neutral" }
		},
		Bio = "You're not hopping to the task fast enough."
	},
	HopelessslyToken = {
		Id = 11971796337,
		Name = "Hop Lee",
		CopyBodge = "Hopelesssly",
		AltCards = {
			["Hop Lee-ANToken"] = {
				Name = "Unadaptably, The Gatekeeper",
				AttackEffect = "Rifle",
				CopyBodge = "Hop Lee-AN",
				Id = 10779754104,
				Bio = "Access Denied.",
				Summonant = "Hop Lee-ANToken"
			},
			fosterTHEplayer32Token = {
				Id = 129964245789289,
				Name = "fosterTHEplayer32",
				AttackEffect = "Katana",
				CopyBodge = "fosterTHEplayer32",
				AltArt = true,
				Bio = "The first member of the Bad Time Trio.  Also paid for all their commissions!",
				Summonant = "fosterTHEplayer32Token"
			},
			["ADeadBody14, GungeoneerToken"] = {
				Id = 12653991064,
				AttackEffect = "Revolver",
				Name = "ADeadBody14, Gungeoneer",
				Bio = "\"Blasphemy.\""
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Arrow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 5 },
		Summonant = "HopelessslyToken",
		Effect = {
			Name = "Assembly",
			Description = "During your end step: Attempt to stand out. To be the best person you can possibly be. I believe in you!",
			Type = "Null",
			Power = { { "Ban", 999999, "Opponent" } },
			Target = "Self",
			EffectRequirement = { "Cost", "Ally", 0, -1, "Neutral" }
		},
		Bio = "You're not hopping to the task fast enough."
	},
	Avectus = {
		Id = 9930960620,
		Name = "epik_nob",
		AltCards = {
			EG2 = {
				Id = 9783225994,
				Name = "Big Bungus",
				AttackEffect = "Scratch",
				Bio = "He's a bit of a joke on certain social media platforms.",
				Effect = {
					Name = "Plushie Amp",
					Description = "Whenever you cast a fighter: Transform it into this card. All allied fighters gain 50 Power.",
					Type = "OnAllySummon",
					Power = {
						{ "Transform", "EG2", "Aggressor" },
						{ "Strengthen", 50, "Ally" }
					},
					Target = "Ally"
				}
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Red = 3 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever you cast a fighter: Transform it into this card. All allied fighters gain 50 Power.",
			Type = "OnAllySummon",
			Power = {
				{ "Transform", "Avectus", "Aggressor" },
				{ "Strengthen", 50, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Fall to breadcrumbs!"
	},
	["Card Hoarder"] = {
		Id = 4204425908,
		Name = "Card Hoarder",
		AltCards = {
			["Card Hoarder-E"] = {
				Name = "Egg Hoarder",
				AttackEffect = "Jab",
				Id = 8650617590,
				Bio = "Collecting eggs since 2008."
			},
			["Card Hoarder-Offer"] = {
				Name = "The Strongest Card Hoarder",
				AttackEffect = "Maelstrom",
				Id = 78139311456036,
				Bio = "REAL collectors have the power to see their purchase through. You weakling scalpers can't even fight to save your butts OR your limited edition boxes."
			},
			BonkJobBot = {
				Id = 112265617811219,
				Name = "BonkJobBot",
				PremiumArt = 351,
				AltArt = true,
				Bio = "Remember, this one's smokescreen, this one's tear, and this one is mustard. Yes, that kind."
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 2 },
		Effect = {
			Name = "Recognize",
			Description = "During your end step: Draw a card.",
			Type = "OnEnd",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "He just loves cards."
	},
	AII_Dragon = {
		Id = 10184816456,
		Name = "DregSystem",
		AltCards = {
			["DregSystem-AN"] = {
				Name = "Blindfolded Bryson",
				AttackEffect = "Jab",
				Id = 13698838589,
				Bio = "Fear not the man who has practiced 10,000 kicks once nor the man who has practiced one kick 10,000 times, but the man who does all that blindfolded."
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Hellfire",
			Description = "After this fighter attacks: Destroy what it attacked if it has 300 or less power.",
			Type = "OnAttackEnd",
			Power = { {
				"CheckPower",
				{ 0, 301 }
			} },
			Target = "Aggressor"
		},
		Bio = "Multiple Keter and Euclid containment breaches? I don't see an-SNAP"
	},
	["Oddman's Gambit"] = {
		Id = 139701491436486,
		Name = "Insurance Nightmare",
		AltCards = {
			["Oddman's Gambit-AN"] = {
				Name = "Raising The Stakes",
				Id = 137657311562625,
				Bio = "an all nighter in exchange for 3 days of playing games..? sounds good!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Yellow",
		AttackEffect = "LaserYellow",
		Cost = { Neutral = 1, Yellow = 1 },
		Effect = {
			Name = "TaxRevenue",
			Description = "Destroy a Colourless card in your baseplate.\nDraw 2 cards.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{
					"GenZoneDiscard",
					{ "Neutral", -1 }
				},
				{ "Draw", 2 },
				{ "BypassAction" }
			},
			Target = "Ally"
		},
		Bio = "Creaking pipes, grinding metal, unscrewable arms... Thunder Mountain was the most terrifying attraction for clearly the wrong reasons."
	},
	OstrichSized = {
		Id = 10278865263,
		Name = "OstrichSized",
		Summonant = "Ostrich",
		AltCards = {
			["Baba Yaga"] = {
				Id = 10184749936,
				Name = "Baba Yaga",
				AttackEffect = "Blizzard",
				Summonant = "Bab Yaga",
				Bio = "The real question is, would Shedletsky eat this?"
			},
			["TBOI, Lord of Rukiaposting"] = {
				Id = 8154580651,
				Name = "TBOI, Lord of Rookiposting",
				AttackEffect = "Slash",
				Summonant = "Rukia",
				AltArt = true,
				Bio = "yo mama so fat she ate donga doodles hahahaha troll face troll face troll face :troll: im so funny -posts 17 gifs of rookia from pleach-"
			},
			["Krushar, the Swordmancer"] = {
				Id = 9912275732,
				Name = "Krushar, the Swordmancer",
				AttackEffect = "XhartyrSlash",
				Summonant = "Linked & Brigand Sword",
				AltArt = true,
				Effect = {
					Description = "During your end step: Summon a 300/150 Linked & Brigand Sword that's inert in play."
				},
				Bio = "Krushar the Swordmancer was a brave adventurer from a long distant land. His quest was to gather every magical sword to slay evil and dragons."
			},
			["Stick Bug"] = {
				Id = 10184750739,
				Name = "Stick Bug",
				AttackEffect = "Scratch",
				Summonant = "Stick Nymph",
				AltArt = true,
				Effect = {
					Description = "During your end step: Summon a 300/150 Stick Nymph that's inert in play."
				},
				Bio = "get stick bugged lol"
			},
			["Sola!"] = {
				Id = 13530515863,
				Name = "Sola!",
				AttackEffect = "Katana",
				AltArt = true,
				PremiumArt = 94,
				Commissioner = { 4033947327, 105850517 },
				ArtAnimation = "Sola!",
				Summonant = "Ostrich-Kitty",
				Bio = "Strikery's alter ego."
			}
		},
		Health = 1200,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "LaserYellow",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 4 },
		Effect = {
			Name = "Ostrich Cannon",
			Description = "During your end step: Summon a 300/150 Ostrich that's inert in play.",
			Type = "OnEnd",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Funnily enough, Ostriches aren't that much taller than humans. Though he can hardly fit in Japanese houses."
	},
	Ostrich = {
		Id = 4564778718,
		Name = "Ostrich",
		AltCards = {
			["Bab Yaga"] = {
				Id = 8108339690,
				Name = "Bab Yaga",
				AttackEffect = "Ice",
				Bio = "Shedletsky would DEFINITELY eat this."
			},
			Rukia = {
				Id = 8139783498,
				Name = "Rooki",
				AttackEffect = "Katana",
				Bio = "TBOI, CAN YOU STOP POSTING THIS SAME ANIME GIRL IN GENERAL FOR 5 MINUTES?!"
			},
			["Linked & Brigand Sword"] = {
				Id = 9912279193,
				Name = "Linked and Brigand Sword",
				AttackEffect = "Slash",
				Bio = "The first swords Krushar owned. If he has enough support and buffing, Krushar can annihilate a level 1337 Dragon."
			},
			["Stick Nymph"] = {
				Id = 8579485310,
				Name = "Stick Nymph",
				AttackEffect = "Scratch",
				Bio = "get stick nymphed too lol"
			},
			["Ostrich-Kitty"] = {
				Id = 13624750201,
				Name = "Kitty",
				AttackEffect = "Scratch",
				Bio = "Why is he so sad!"
			}
		},
		Token = true,
		Health = 300,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Shotgun",
		Color = "Yellow",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Ostrich Cannon",
			Description = "",
			Type = "Null",
			Power = { { "Draw", "0" } },
			Target = "Ally"
		},
		Bio = "The Omega-Emu."
	},
	["ROBLOXian Reborn"] = {
		Id = 12703343103,
		Name = "ROBLOXian Reborn",
		AltCards = {
			["ROBLOXian Reborn-Banner"] = {
				Id = 13652436896,
				Name = "Grand Anniversary",
				Bio = "My, my! 7 years of endless slaughter and combat? That's a pretty long while!"
			},
			["ROBLOXian Reborn-ARR"] = {
				Id = 86970513222809,
				Name = "Aggressive Assembling",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "If we want to win this war, we'll need to use everything we got, gang."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AlternateCostRequirement = { "Board", "Opponent", 4, 99 },
		AttackEffect = "MagicYellow",
		EffectAnimation = "ROBLOXianReborn",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 4, Green = 4 },
		AlternateCost = { IgnoreColor = "Green" },
		Effect = {
			Name = "Rebirth of Pure Morphic Goo",
			Description = "Cast this card ignoring its {G} cost if there are 4 or more enemy fighters.\nDestroy a target fighter. Summon any fighter and trigger its effects as if it was cast.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 30, "Single" },
				{ "RandomSummonWithEffect", "Fighter" }
			},
			Target = "Ally"
		},
		Bio = "Grant a fallen ROBLOXian life again after being sent to the graveyard. We all have to have another chance, right? This might conflict some morals..."
	},
	midastheking123 = {
		Id = 15408426234,
		Name = "Rawblocky",
		CopyBodge = "midastheking123",
		AltCards = {
			["midastheking123-Alt"] = {
				Id = 10278487781,
				AttackEffect = "Jab",
				AltArt = true,
				Name = "midastheking123",
				Summonant = "Midas's Stand-Alt",
				Bio = "ザ・ワールド！"
			},
			SCR0OM = {
				Id = 7886839705,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "SCR0OM",
				Summonant = "Protopup",
				Bio = "Advanced loneliness has became a weapon :3"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		SummonAnimation = "SummonSlide",
		Charge = true,
		Color = "Yellow",
		Cost = { Neutral = 5, Yellow = 4 },
		Summonant = "Midas's Stand",
		CustomReminder = {
			["Frantic Art"] = "A Terrified fighter is obliterated during its end step.",
			Plagiarism = "Fading fighters don't die and don't go to the graveyard."
		},
		Effect = {
			Name = "Burning Fists of Rage",
			Description = "After this card attacks: Summon a 500/500 Drawing. Unlock it, then attach terrified and fading to it.",
			Type = "OnAttackEnd",
			Power = {
				{ "SummonWithEffect", "Summonant" },
				{ "EquipGear", "Terrified Mod", "SummonedCard" },
				{ "EquipGear", "Fading Mod", "SummonedCard" }
			},
			Target = "Ally"
		},
		Bio = "The ultimate drawing game about plagiarism!"
	},
	["Midas's Stand"] = {
		Id = 10278555811,
		Name = "Rawblocky's Drawing",
		CopyBodge = "Midas's Stand",
		AltCards = {
			["Midas's Stand-Alt"] = {
				Id = 7650361191,
				AttackEffect = "Jab",
				Name = "マイダスのスタンド",
				CopyBodge = "Midas's Stand-Alt",
				Bio = "くらえ！"
			},
			Protopup = {
				Id = 7886840981,
				AttackEffect = "Electric",
				Name = "Protopup",
				Bio = "WOOF.mp3"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Burning Fists of Rage",
			Description = "Whenever you draw: Take time and be patient with it. Copying people nonstop won't make you improve, and neither will being your own worst critic.",
			Type = "OnSummon",
			Power = { { "Unlock", 999 } },
			Target = "Self"
		},
		Bio = "This salty cracker packs a punch!"
	},
	JackofMostTrades = {
		Id = 17790395652,
		Name = "JackofMostTrades",
		AltCards = {
			["JackofMostTrades-Sun"] = { Id = 13660497398, Name = "Guitarist", Bio = "" }
		},
		Health = 500,
		Power = 1500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Master Blast",
			Description = "Whenever this card attacks: Your opponent gains {W}{W}.",
			Type = "OnAttack",
			Power = "Neutral",
			Target = "Opponent",
			Increase = 2
		},
		Bio = "Take a look at this graph, er I mean, giraffe, he has the most trades, it's a 100% fact."
	},
	["The Piece Breaker"] = {
		Id = 4784603077,
		Name = "The Piece Breaker",
		AltCards = {
			["The Piece Breaker-E"] = {
				Id = 9137699969,
				Name = "The Egg Beater",
				Bio = "Used to slay a magical dragon of old."
			},
			["Rifo-Breaker"] = {
				Id = 123805266163644,
				Name = "Danika: Spite",
				AltArt = true,
				Bio = " I hate you with all the 7,000,000,000,000,000,000,000,000,000 atoms that compose my entire being; every atom a soldier in a ceaseless war of resentment, every molecule aligned with a singular purpose: to despise you. Each bond that forms between particles within me feels charged with the energy of pure loathing, an infinite reserve of bitterness coursing through my veins like a river of fire. Were the cosmos itself to unravel, leaving behind a barren void, my hatred would remain, an indestructible force defying the collapse of reality."
			},
			["Guacamole God Fist"] = {
				Id = 92556737331586,
				Name = "Guacamole God Fist",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "When god sent his child down to earth, did you think he would leave his throne?"
			}
		},
		Health = 50,
		Power = 50,
		Rarity = "Epic",
		Charge = true,
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Level Up!",
			Description = "Whenever this card attacks and destroys another: Your opponent loses 1200 life. Destroy this card.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Inflict", 1200, "Opponent" },
				{ "Damage", 9999, "Self" }
			},
			Target = "ColorYellow"
		},
		Bio = "Greet death with an open mind and with a sword in hand."
	},
	["Burning Phoenix"] = {
		Id = 3307683858,
		Name = "Burning Phoenix",
		AltCards = {
			["Burning Phoenix-Val"] = {
				Name = "Valentine's Phoenix",
				CopyBodge = "Burning Phoenix-Val",
				Id = 7138185441,
				Bio = "Rebirth of pure love!"
			},
			["Ravcade-Burning Phoenix"] = { Id = 8072449033, Bio = "Rebirth of pure GAMING!" },
			EXPLODEMAN = {
				Name = "EXPLODEMAN",
				AltArt = true,
				Id = 11068371169,
				AttackEffect = "FirePunch",
				Bio = "I WON'T DIE THAT EASILY, SPIN-MAN!!!"
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Flare",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 4 },
		Effect = {
			Name = "Revival",
			Description = "During your end step: This card gains 200 power, then swap its stats.",
			Type = "OnEnd",
			Power = {
				{ "Strengthen", 200 },
				{ "Swap", 400 }
			},
			Target = "Self"
		},
		Bio = "Rebirth of pure flames!"
	},
	["Dicey Dave"] = {
		Id = 111441644201034,
		Name = "Damion Dave",
		AltCards = {
			["Dicey Dave-Hal"] = {
				Name = "Devil Dave, Poetician",
				AttackEffect = "FirePunch",
				Id = 71911530495999,
				Bio = "To devour innocent rodents or not to devour innocent rodents. That is the question."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		Effect = {
			Name = "Assimilate",
			Description = "When this card dies: Destroy your hand. Draw 3 cards.",
			Type = "OnDeath",
			Power = {
				{ "RandomDiscard", 9 },
				{ "Draw", 3 }
			},
			Target = "Ally"
		},
		Bio = "Javion, the happiest place in the Vecross System."
	},
	JoeDev = {
		Id = 6135562213,
		Name = "JoeDev",
		AltCards = {
			["JoeDev-Banner"] = {
				Name = "Hyperion",
				AttackEffect = "Divinity",
				Id = 13496294929,
				Bio = "\"Feel the immeasurable power of the sun!\""
			}
		},
		Health = 2200,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		SummonAnimation = "SummonFrolic",
		Charge = true,
		Effect = {
			Name = "Amp",
			Description = "During your end step: Destroy all fighters with more health than this card, then deal 200 damage to this card.",
			Type = "OnEnd",
			Power = {
				{ "CheckSelfOverHealth" },
				{ "Damage", 200, "Self" }
			},
			Target = "All"
		},
		Bio = "An amazing artist. Many thanks to your work, Joe! - Dev Team"
	},
	PencilWizard = {
		Id = 9925799169,
		Name = "PencilWizard",
		AltCards = {
			["PencilWizard-Val"] = {
				Id = 9925798120,
				Name = "Goat Mama Wizard",
				AttackEffect = "MagicBlue",
				Summonant = "PencilWizard-ValToken",
				Bio = "Did you just call me... 'Mom'? Well... I suppose... Would that make you happy?"
			},
			Pencil = {
				Id = 9804471429,
				Name = "PencilWizard",
				Summonant = "PencilToken",
				Bio = "Don’t mess with the card game on motorcycle gang!"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		Summonant = "PencilWizardToken",
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "When this card attacks and destroys another: Summon a copy of this card without its effects.",
			Type = "OnAttackDestroy",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "The pen is mightier than the sword."
	},
	PencilWizardToken = {
		Id = 9804469571,
		Name = "PencilWizard",
		AltCards = {
			["PencilWizard-ValToken"] = {
				Id = 9804470526,
				Name = "Goat Mama Wizard",
				AttackEffect = "MagicBlue",
				Bio = "Did you just call me... 'Mom'? Well... I suppose... Would that make you happy?"
			},
			["Chimecat0-Token"] = {
				Id = 121236138737017,
				Name = "Chimecat0",
				AttackEffect = "Jab",
				Bio = "“20 broken supercomputer buffs NOW”"
			},
			PencilToken = {
				Id = 9804471429,
				Name = "\"Pencil\"Wizard",
				Bio = "The real question is, which part of Pencil is the wand? The eraser, or the tip?"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The pen is mightier than the sword."
	},
	SmashDude88 = {
		Id = 6030796731,
		Name = "SmashDude88",
		AltCards = {
			Nuclearpizza3210 = {
				Name = "Nuclearpizza3210",
				AttackEffect = "Scratch",
				Id = 9462803094,
				AltArt = true,
				Bio = "\" You hide away from what this world shelters. You Believe the light is the truth that you should follow. Mankind's falsehoods are but a joke, believe in the teachings of god. But not in the teachings of man. DISCARD THEIR TEACHINGS FOR I AM YOUR GOD.\""
			},
			["SmashDude88-E"] = {
				Name = "Mischievous Murderer",
				AttackEffect = "TimeBomb",
				Id = 12957227875,
				Bio = "Don't get it twisted, they just purchased the 100k robux ears just to throw eggs rather than sporks at people."
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Name = "Hopelesssnesss",
			Description = "During your end step: Deal 100 damage to all enemy fighters. They lose 50 power.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 100 },
				{ "Weaken", 50 }
			},
			Target = "Opponent"
		},
		Bio = "I dare ya, make the joke about his name again."
	},
	JayTheCoder = {
		Id = 4564784580,
		Name = "JayTheCoder",
		AltCards = {
			["JayTheCoder-E"] = {
				Id = 8707807484,
				Name = "Rabid Rabbit",
				AttackEffect = "Slash",
				Bio = "Easter isn't happening if he has anything to say about it. "
			},
			["A.D. 14, Surveillance Operator"] = {
				Id = 15407463303,
				Name = "A.D. 14, Surveillance Operator",
				AltArt = true,
				PremiumArt = 165,
				Bio = "Every choice has consequences."
			}
		},
		Health = 900,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Yellow",
		Cost = { Yellow = 7, Neutral = 3 },
		Overload = true,
		Effect = {
			Name = "Zerg Rush kekekeke",
			Description = "Whenever you cast a fighter: Deal 100 damage to all enemy fighters. You lose 100 life.",
			Type = "OnAllySummon",
			Power = {
				{ "Damage", 100 },
				{ "Cost", 100 }
			},
			Target = "Opponent"
		},
		Bio = "Coding is LIFE."
	},
	["NearMiss TFW"] = {
		Id = 9300659578,
		Name = "NearMiss TFW",
		AltCards = {
			["NearMiss TFW-Sun"] = {
				Id = 9180246225,
				Name = "The Host",
				AttackEffect = "Microphone",
				Bio = "Let's see how this Lab Experiment'll turn out!"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Render",
			Description = "Whenever this card gains a lock: Draw a card.",
			Type = "OnLockIncrease",
			Power = { { "Draw", 1 } },
			Target = "Self"
		},
		Bio = "Creator of Battle of the ele- WRONG GAME WRONG BOTE DON'T KILL ME AAA - Sword Critic"
	},
	DrKig = {
		Id = 10938764556,
		Name = "DrKig",
		AltCards = {
			["Unc, the Fourth Match Flame"] = {
				Name = "Unc, the Fourth Match Flame",
				AttackEffect = "Flare",
				Id = 10629691830,
				AltArt = true,
				Bio = "I am coming to you. You foul creatures, who will be reduced to ash like me."
			},
			["DrKig-Hal"] = {
				Name = "The Nuckelavee",
				AttackEffect = "DoomStorm",
				Id = 14556110651,
				Bio = "A horrid, skinless horse-man that's said to be the cause of terror upon the bays of the north. Despair it treads upon, causing livestock to perish in its wake."
			}
		},
		Health = 800,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 8, Red = 1 },
		Effect = {
			Name = "Deceipt",
			Description = "When this card is cast: It deals 350 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 350 } },
			Target = "Opponent"
		},
		Bio = "Like the game to see what the like animation looks like!"
	},
	["Epic Sauce"] = {
		Id = 10938761902,
		Name = "Epic Sauce",
		AltCards = {
			["Commiting Arson for Dummies"] = {
				Id = 15205923899,
				Name = "Traveling Arsonist",
				AltArt = true,
				PremiumArt = 1,
				Transformant = "Dragonoid Lisa",
				Bio = "Some people want to see the world burn. One wants to see <i>every</i> world burn."
			},
			["Fusion Dance"] = {
				Id = 105863800491634,
				Name = "Fusion Dance",
				AltArt = true,
				PremiumArt = 296,
				Transformant = "Shunz",
				Bio = "Fuuuuu... sion! HA!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		EffectAnimation = "EngulfFire",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Transformant = "Sauce-Fuelled Zealot",
		CustomReminder = {
			["Quirked Up White Boy"] = "Whenever a Sauce-Fuelled Zealot destroys a fighter, it loses 200 Health and its controller loses 600 Life."
		},
		IsFood = true,
		Effect = {
			Name = "derp",
			Description = "A target fighter gains 500 health and power\nTransform it into a Sauce-Fuelled Zealot.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "Strengthen", 500 },
				{ "Transform", "Transformant" }
			},
			Target = "Single"
		},
		Bio = "WARNING: Contents contain the following: Ghost Peppers, Molten Lava, Drakobloxxer Saliva, Curry, Cactus Sap, Wasabi,  Redcliff Marrow, Chili, and Beans. Side Effects include damage to skin, melting bones, heartburn, and a craving for rice. Eat with caution!"
	},
	["Sauce-Fuelled Zealot"] = {
		Id = 6260697510,
		Name = "Sauce-Fuelled Zealot",
		AltCards = {
			["Dragonoid Lisa"] = {
				Id = 15205925968,
				Name = "Dragonoid Lisa",
				AttackEffect = "FirePunch",
				Bio = "My parents never cared for me."
			},
			Shunz = {
				Id = 127752076492301,
				Name = "Shunz",
				AttackEffect = "FirePunch",
				Bio = "I am neither Deer nor Sheep... I am the one who will destroy you!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Red",
		Cost = { Red = 3 },
		TransformImmune = true,
		Effect = {
			Name = "derp",
			Description = "Whenever this card destroys another: Deal 200 damage to it. You lose 600 Life.",
			Type = "OnDestroy",
			Power = {
				{ "Cost", 600 },
				{ "Damage", 200 }
			},
			Target = "Self"
		},
		Bio = "TOO... MUCH... SAUCE... MUST... SLAY THE POGGERS..."
	},
	["Drager Bot"] = {
		Id = 10938766064,
		Name = "Lewa1267",
		AltCards = {
			Butch = {
				Id = 101190496358125,
				Name = "Lawrence",
				AltArt = true,
				Bio = "For some men, nothing is written unless they write it."
			}
		},
		Health = 1000,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Thug Life",
			Description = "After this card attacks: Deal 250 damage to a target enemy fighter.",
			Type = "OnAttackEnd",
			Power = { { "Damage", 250 } },
			Target = "SingleEnemy"
		},
		Bio = "Wars in games were fun and all, but this is way better."
	},
	PoptartNoahh = {
		Id = 10938767226,
		Name = "PoptartNoahh",
		AltCards = {
			["PoptartNoahh-AN"] = {
				Name = "DIY Werewolf",
				AttackEffect = "Scratch",
				Id = 119469877439327,
				Bio = "AWOOO!"
			},
			Kirigaia = {
				Name = "Kirigaia",
				Id = 9604921993,
				AltArt = true,
				Bio = "\"Novablast Flow!\""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		Effect = {
			Name = "Rip 'n' Tear",
			Description = "Whenever this card attacks: All players lose 250 Life. Ready this card if it attacked a fighter.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Inflict", 250, "All" },
						{
							"AlterEV",
							{ "Set", "Target", "HasPassive", "AttackBlock" }
						},
						{ "EVExactValueCheck", 0 }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Unlock", 1, "Self" } },
					Target = "All"
				}
			}
		},
		Bio = "I'm not locked in here with you, you're locked in here with ME!"
	},
	["Dicey Drake"] = {
		Id = 101491497867186,
		Name = "Dicey Drake",
		AltCards = {
			["Icy Drake"] = {
				Name = "Frosty",
				Id = 10281405247,
				AttackEffect = "Slash",
				Transformant = "Icy Drake Token"
			},
			HowlingHealer = {
				Id = 10281401264,
				Name = "HowlingHealer",
				AttackEffect = "Scratch",
				CopyBodge = "HowlingHealer",
				AltArt = true,
				Transformant = "HowlingHealer Token"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 1 },
		Transformant = "Dicey Drake Token",
		Effect = {
			Name = "Game till you drop",
			Description = "Whenever your opponent casts a fighter: It loses 200 power.",
			Type = "OnEnemySummon",
			Power = { { "Weaken", 200 } },
			Target = "Aggressor"
		},
		Bio = "\"Are you sure you can handle Thunder Mountain?\" Dicey asked with that charming stammer he gets when he's trying not to show he's scared.\nDamion laughed it off, and Drake's face betrayed a meek smile. That courage was something he wished he had."
	},
	Rolimon = {
		Id = 10917751471,
		Name = "Rolimon",
		AltCards = {
			["Rolimon-AN"] = {
				Name = "Rich Neophyte",
				Id = 13713146414,
				AttackEffect = "MagicYellow",
				Bio = "\"With this much, I'm set for life!\""
			},
			["Rolimon-ET"] = {
				Name = "Zulajian Executive",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Id = 16446070131,
				AttackEffect = "MagicYellow",
				Bio = "\"Where did the nuclear explosives go?\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Game till you drop",
			Description = "When this card is cast: Shuffle your hand into your deck, then draw that many cards.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Hand_Ally", "Any", nil }
				},
				{ "RandomDiscard", 10, "Ally" },
				{ "Draw", "Variable" }
			},
			Target = "Ally",
			EffectRandomDiscardShuffle = true
		},
		Bio = "\"I've found a virtual accessory with limited actual value outside of the platform that could really excel!\""
	},
	["The Paraselene Archives"] = {
		Id = 11769945460,
		Name = "The Paraselene Archives",
		AltCards = {
			["Domain Expansion Unlimited Action"] = {
				Id = 81686741259255,
				Name = "Domain Expansion Unlimited Action",
				Terrariant = "HollowMint",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 446,
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Terrain = true,
		Terrariant = "History Rewritten",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 4 },
		EffectAnimation = "MoonwardTerrain",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Thrice each turn, whenever you cast an action, if there's an allied fighter: Deal 200 to a target one. Recur an allied action, except it's inert in zones, fleeting, and fading.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Damage", 200, "SingleAlly" },
						{
							"MoveZone",
							{ "Action", "GraveZone_Ally", "Hand_Ally", true, false }
						}
					},
					Target = "Self",
					MetaData = { TokenOmni = true, Fading = true, Fleeting = true },
					EffectRequirement = { "Board", "Ally", 1, 9999 },
					TurnTriggerLimit = 3
				}
			}
		},
		Bio = "When dealing with possible events of irreversible catastrophe, there is no such thing as 'too much knowledge.'"
	},
	["In the Dead of Night"] = {
		Id = 11769948427,
		Name = "In the Dead of Night",
		AltCards = {
			["In the Dead of Night-AN"] = {
				Id = 13697383694,
				Name = "Coordinated Attack!",
				Bio = "<i>Dear Fan Card Dumpers: THINK THROUGH YOUR CARDS BEFORE YOU MAKE THEM. Signed: The ACGD.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1, Red = 2 },
		EffectVariable = 0,
		Blessing = true,
		ModifierEldritch = true,
		Lunar = true,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 200 damage to a target enemy fighter. Repeat this effect for each blessing you have.\nPut an Eldritch Blessing onto a card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{ "Damage", 200, "SingleEnemy" },
						{ "EVGreaterValueCheck", 0 },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Damage", 200 },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleEnemy",
					NoBlip = true
				}
			}
		},
		Bio = "Adreti's fanatacism barely fazed the Cadet as the moon-blessed sword swiftly cut through the Archangel."
	},
	["Heated Debate"] = {
		Id = 129488615097013,
		Name = "Heated Debate",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		EffectVariable = 0,
		Blessing = true,
		ModifierEldritch = true,
		InPD2 = true,
		Effect = {
			Name = "Reincarnation",
			Description = "If you have 3 or more blessings, search your deck for 2 Green cards.\nPut an Eldritch Blessing on a card in your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ModifiedHandSlots", "Nil" }
						},
						{ "EVGreaterValueCheck", 2 },
						{ "AddHandModifier", "EldritchBless", "RandomNotBlessedAllyHand" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "RandomTutorfor", "Green" },
						{ "RandomTutorfor", "Green" }
					},
					Target = "Ally",
					NoBlip = true
				}
			}
		},
		Bio = "\"No, we CAN'T just evict the farseekers, you imbecile! We have no proof they've done a crime, yet alone a freedom lock!\"\nLua turned his back on his mentor; The moon's influence was the first and last time Yuéliáng had ever raised her voice."
	},
	["Disposable Income"] = {
		Id = 11769915985,
		Name = "Disposable Income",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "LargeMagicGreenEffect",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 1200 damage to a target fighter.\nGive yourself six Money Stack cards.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 1200, "Single" },
						{
							"RepeatingRandomAdd",
							{
								{ "Tix Stack", "Targeting Blip" },
								6
							},
							"Ally"
						}
					},
					Target = "Self"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "The spirit of money is the soul of Javion; Their currency buys superpowers. No wonder Biggs captured them."
	},
	["Capital Confrontation"] = {
		Id = 80985680137627,
		Name = "Capital Confrontation",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "LargeMagicRedEffect",
		Color = "Red",
		Cost = { Neutral = 4, Red = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 100 times X damage to all enemy fighters. X is how many fewer cards you have in your baseplate than your opponent.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "GenZone_Opponent", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "Subtract", "GenZone_Ally", "All", "Nil" }
						},
						{
							"AlterEV",
							{ "UnderCap", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 100, "Nil" }
						},
						{ "Damage", "Variable", "Opponent" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Yuéliáng was grateful for the stranger's carnival carnage. Pier was too, for a clobbering's more fun with two."
	},
	["Talking Heads"] = {
		Id = 80849031467944,
		Name = "Talking Heads",
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card dies, if you've cast an action this turn: All allied fighters gain 300 Health and you gain {W}{W}.",
			Ability = {
				OnDeath = {
					Power = {
						{ "Heal", 300, "Ally" },
						{ "Neutral", 2, "Ally" }
					},
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 1, 9999, "Actions" }
				}
			}
		},
		Bio = "Biggs' raggs to riches story was so inspirational; Starting from a miniscule loan of seven trillion kromers to ruling the planet's government!"
	},
	["Splitting the Difference"] = {
		Id = 78966635850446,
		Name = "Splitting the Difference",
		Health = 0,
		Power = 0,
		AddHealth = 150,
		AddPower = 150,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Red = 2, Blue = 2 },
		Gear = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nOnce each turn, whenever an allied fighter takes noncombat damage and survives: This gear gets +300/+300 stat bonus and moves to that fighter.",
			Ability = {
				OnAllyEffectDamageSurvived = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{ "EVExactValueCheck", 0 },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{
							"MoveGear",
							{ "Variable", "Self", true, false },
							"Self"
						}
					},
					Target = "Self",
					TurnTriggerLimit = 1,
					MetaData = { AddAddHealthFromOrigin = 0, AddAddPowerFromOrigin = 0 }
				},
				OnEVCheckPass = {
					Power = {
						{ "TargetAddStrengthenBonus", 300, "Self" },
						{ "TargetAddHealthBonus", 300, "Self" }
					},
					Target = "Self",
					NoBlip = true,
					NoGearTargetMod = true
				}
			}
		},
		Bio = "\"You mean it's Eclipse in there?\"\n\"He wishes his prison was still in space.\"\n\"So the rageborne will stop spawning if we evict the moon? Are you happy with that?\"\n\"A lowly infection as myself has no right to an opinion.\"\n\"Don't let Lua find out, but you're more than an infection to me.\""
	},
	["Real Bigg Spender"] = {
		Id = 10445478922,
		Name = "Bigg Spender",
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Thrice each turn, whenever you cast a Token action: Attach a copy of it to a target fighter as a +50/+50 gear.",
			Ability = {
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{ "EquipGear", "Variable", "Single" }
					},
					Target = "Self",
					Rarity = "Token",
					TurnTriggerLimit = 3,
					MetaData = { AddHealth = 50, AddPower = 50, Gear = true }
				}
			}
		},
		Bio = "He's my hero! I've bought all his merch and I'm even subscribed to his course on how to be a BIGG MAN!"
	},
	Omnisapience = {
		Id = 109512613949909,
		Name = "Omnisapience",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2, Green = 2, Blue = 4 },
		EffectVariable = 0,
		Blessing = true,
		Rank = 6,
		CustomReminder = {
			["Omnisapient Blessing"] = "When you next cast a nonfighter card from there, also summon a 500/500 Rageborne fighter."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Put an Omnisapient Blessing onto each card space in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "OmniBless", "Self" } },
					Target = "Self",
					MetaData = {
						SlotTargets = {
							0,
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							9
						}
					}
				}
			}
		},
		Bio = "\"Everything wiggles with life near the moon. That wiggling life then wiggles with more, a neverending cascade of consciousnesses and freedom.\n\nJust think how many people we could control with our new god!\"\n— Adreti"
	},
	["Nature Versus Nurture"] = {
		Id = 75658577741871,
		Name = "Nature Versus Nurture",
		Health = 0,
		Power = 0,
		AddHealth = 1000,
		AddPower = 500,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Red = 2, Green = 2, Yellow = 4 },
		Gear = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Attach to a target fighter.\nWhen you do: Unlock it. Effects can't destroy or weaken it while this is attached.\nWhenever this fighter attacks and destroys another: Obliterate all copies of that fighter in all zones.",
			Ability = {
				OnEquipped = {
					Power = { { "Unlock", 9999 } },
					Target = "GearOwner"
				},
				OnEquippedAlways = {
					Power = {
						{ "GivePassive", "DestroyImmune" },
						{ "GivePassive", "WeakenImmune" }
					},
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "DestroyImmune" },
						{ "RemovePassive", "WeakenImmune" }
					},
					Target = "GearOwner"
				},
				OnAttackDestroy = {
					Power = { { "Extract" } },
					Target = "Aggressor",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "Wa-Pangu felt only pity for these new, feral rageborne. They needed Cothrite guidance, moreso than the Cothrite diaspora itself."
	},
	["Failed Expedition"] = {
		Id = 128827751794473,
		Name = "Failed Expedition",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Red = 2, Green = 2 },
		EffectVariable = 0,
		Terrain = true,
		Terrariant = "Third Party Intervention",
		Blessing = true,
		CustomReminder = {
			["Devastating Blessing"] = "When you next cast a card from there, gain 10{W}."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Put a Devastating Blessing on the 10th card space in your hand.\nDuring your end step: Recur an allied card and add 10{W} to its cost. It's inert in all zones.",
			Ability = {
				OnSummon = {
					Power = { { "AddHandModifier", "DevastatingBless", "Self" } },
					Target = "Self",
					MetaData = {
						SlotTargets = { 9 }
					}
				},
				OnEnd = {
					Power = { {
						"MoveZone",
						{ "Any", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = {
						TokenOmni = true,
						AddCost = { Neutral = 10 }
					}
				}
			}
		},
		Bio = "The moon cracked, the world erupted, the Farseekers became what they feared."
	},
	["Third Party Intervention"] = {
		Id = 71868227323480,
		Name = "Third Party Intervention",
		Health = 1500,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Terrarian = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent discards a card other than their first each turn: They lose 300 life and you gain 10 {W}.",
			Ability = {
				OnEnemyDiscard = {
					Power = {
						{ "Inflict", 300 },
						{ "Neutral", 10, "Ally" }
					},
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Him", 2, 999, "DiscardCount" }
				}
			}
		},
		Bio = "Angry at this exploitative world, Cliff trusted the dagger. Cliff knew the old god in the moon wanted to meet his old friend."
	},
	["Trickle-Down Economics"] = {
		Id = 108890592062758,
		Name = "Trickle-Down Economics",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Red = 2, Green = 2 },
		CustomReminderFleeting = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Deal 500 damage to a target enemy fighter.\nGive yourself 10 copies of it, except they're fleeting and inert in all zones.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" }
						},
						{ "Damage", 500 },
						{
							"RepeatingAdd",
							{ "Variable", 10 },
							"Ally"
						}
					},
					Target = "SingleEnemy",
					MetaData = { Fleeting = true, TokenOmni = true }
				}
			}
		},
		Bio = "\"You 'Javionese' are not the first time a crisis in one's homeworld has caused problems here. You will find shelter here, conditional to your presence being incomparable to demonkind.\"\n— Mayor Astarossa"
	},
	["Peek Behind The Magic"] = {
		Id = 88943379643128,
		Name = "Peek Behind The Magic",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Yellow = 1, Green = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select any number of money stacks in your hand. For each one, destroy it and give yourself a money stack of the opposite type.\nIf there's an allied Capital $ity fighter, you gain {W}{W}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "MultiSelectOperation", "MoneyStackConversion", "CustomZoneTarget" },
						{
							"AlterEV",
							{ "Set", "Field_Ally", "Archetype", "Capital $ity" },
							"Self"
						},
						{
							"EVGreaterValueCheck",
							{ 0, "CapitalFighter" }
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = { Archetype = "Money" },
						MinTargets = 0,
						MaxTargets = 99,
						SelectionDescription = "Any number of money stacks to destroy and replace with the opposite type."
					}
				},
				MultiSelectOperationMoneyStackConversion = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "CardIndexOriginal", "StackType" },
							"Aggressor"
						},
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"Aggressor"
						},
						{ "SpecificDiscard", 1, "EVCard" },
						{
							"AlterEV",
							{ "Load", "Target", "CardIndex", "StackType" },
							"Self"
						},
						{
							"EVExactValueCheck",
							{ "Tix Stack", "IsTix" }
						}
					},
					Target = "Self",
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassIsTix = {
					Power = { { "Add", "Targeting Blip", "Ally" } },
					Target = "Self",
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckFailIsTix = {
					Power = { { "Add", "Tix Stack", "Ally" } },
					Target = "Self",
					NoBlip = true,
					AllowDeadAggressorTriggers = true
				},
				OnEVCheckPassCapitalFighter = {
					Power = { { "Neutral", 2, "Ally" } },
					Target = "Self",
					AllowDeadAggressorTriggers = true
				}
			}
		},
		Bio = "The Oddsman sometimes wished they could feel the wonder they instilled in the tourists."
	},
	["MMCDXLI. Convergence"] = {
		Id = 94968799365883,
		Name = "MMCDXLI. Convergence",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Each player shuffles 10 tokens in their graveyard into their deck.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Token", "GraveZone_Ally", "Deck_Ally", true, false, 10 },
							"Self"
						},
						{
							"MoveZone",
							{ "Token", "GraveZone_Opponent", "Deck_Opponent", true, false, 10 },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"As a consequence of the first mending of the Alpha Brick, The new domains in Vecross hated each other. Wealth flowed from the colonised Dlentevi and Toraphans to the cruel Forothians, a level of oppression which sparked an outright war. The system's zealous obsession with money created the Oddsman, dethroning the previous editor and splitting the new system from the old one.\n\nThe remnants of the new worlds never forgave them.\"\n— Herrus, Lost Memoirs"
	},
	["Brazen Censorship"] = {
		Id = 105582323848482,
		Name = "Brazen Censorship",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter loses power equal to your opponent's account age (In days).",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "EnemyPlayertable", "AccountAge", "Nil" },
							"Self"
						},
						{ "Weaken", "Variable", "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "\"'Slots?' Ooooh, the kids will be corrupted if they learn about that! They need wholesome, moral content! Like dead husbands and colonialism!\""
	}
}