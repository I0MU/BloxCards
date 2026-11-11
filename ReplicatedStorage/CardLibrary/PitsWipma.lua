



return {
	["The Gentlemaniac"] = {
		Id = 17790993660,
		Name = "The Gentlemaniac",
		AltCards = {
			["The Gentlemaniac-AN"] = {
				Id = 11727763782,
				Name = "Chair Chair",
				AttackEffect = "Storm",
				Effect = {
					Power = { {
						"RandomAdd",
						{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
					} },
					Target = "Ally"
				},
				Bio = "The Creator."
			},
			["Roll the Chairmancer"] = {
				Id = 12703310461,
				Name = "Roll the Chairmancer",
				AttackEffect = "Storm",
				AltArt = true,
				PremiumArt = 6,
				Effect = {
					Name = "Helping Out",
					Description = "Up to 12 times each turn, if an effect or passive would heal this card: Give yourself a Chair first.",
					Type = "OnEffectHeal",
					Power = { {
						"RandomAdd",
						{ "Lumberjack's Madness", "Unknown Authority", "Tree Spirit's Curse" }
					} },
					Target = "Ally",
					TurnTriggerLimit = 12
				},
				Bio = "\"Yea, chairs aren't getting nerfed anytime soon.\""
			},
			["Chair Masters, DJ and Nary"] = {
				Id = 13947317803,
				Name = "Chair Masters, DJ and Nary",
				AttackEffect = "Storm",
				Commissioner = { 165454052 },
				AltArt = true,
				PremiumArt = 69,
				Bio = "2000hp turn 1 :D"
			},
			["Gentleman LKS"] = {
				Name = "Gentleman LKS",
				Id = 16562310467,
				AltArt = true,
				Bio = "Playing in style."
			},
			["deatshotswag, RICH man"] = {
				Id = 18298925815,
				Name = "deatshotswag, RICH man",
				Effect = {
					Name = "Helping Out",
					Description = "Up to 12 times each turn, whenever an effect would heal this card: Give yourself a Chair card first.",
					Type = "OnEffectHeal",
					Power = { {
						"RandomAdd",
						{ "YellowDeatshot", "BlueDeatshot", "GreenDeatshot" }
					} },
					Target = "Ally",
					TurnTriggerLimit = 12
				},
				AltArt = true,
				Bio = "Now THIS is a journey into money... LODS OF EMONE!!"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2, Green = 2 },
		Archetype = "Chair",
		Effect = {
			Name = "Helping Out",
			Description = "Up to 12 times each turn, whenever an effect would heal this card: Give yourself a Chair card first.",
			Type = "OnEffectHeal",
			Power = { {
				"RandomAdd",
				{ "Royal Chair", "Modern Chair", "Wooden Chair" }
			} },
			Target = "Ally",
			TurnTriggerLimit = 12
		},
		Bio = "He'll be gentle... For a while."
	},
	SpeedySeatRetrain = {
		Id = 7000544833,
		Name = "SpeedySeat",
		AltCards = {
			["ImAwkwrd, Albion of Tir Na Nog"] = {
				Id = 9326592988,
				Name = "ImAwkwrd, Albion of Tir Na Nog",
				AttackEffect = "Tempest",
				AltArt = true,
				Addant = "Friends of the Forest",
				Effect = {
					Description = "If there are 5 Infurnished cards in your Baseplate, this card has haste. Whenever this card attacks: Give yourself two Friends of the Forest."
				},
				Bio = "And perhaps who might you be? The sleigh beggy the Fae chatter of along the winds?"
			},
			Ascaredzizer = {
				Id = 77040279022423,
				Name = "Ascaredzizer",
				PremiumArt = 297,
				AltArt = true,
				Addant = "Ao Oni",
				Effect = {
					Description = "If there are 5 Infurnished cards in your Baseplate, this card has haste. Whenever this card attacks: Give yourself two Ao Oni."
				},
				Bio = "imagine having an irrational fear of ZpgP5Q0IGzg"
			}
		},
		Health = 1100,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		ChargeRequirement = { "Archetype", "AllyGenZone", 5, 9999, "Infurnished" },
		Archetype = "Infurnished",
		Addant = "Hellish Infurniture",
		CustomReminderInfurnished = true,
		Effect = {
			Name = "WWW",
			Description = "This card has haste if there's 5 or more Infurnished in your baseplate.\nWhenever this card attacks: Give yourself 2 Hellish Infurnitures.",
			Type = "OnAttack",
			Power = {
				{ "Add", "Addant" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "SpeedySeat modifies host objects for the Infurnished's needs. They happily allow him to use them as he sees fit."
	},
	SpeedySeat = {
		Id = 9256133357,
		Name = "SpeedySeat, Chair Racer",
		AltCards = {
			["SpeedySeat-AN"] = {
				Id = 9368640506,
				Name = "Grand Couch",
				AttackEffect = "Slash",
				Effect = {
					Power = {
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						},
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						},
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						},
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						},
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						},
						{
							"RandomAdd",
							{ "Royal Chair-AN", "Modern Chair-AN", "Wooden Chair-AN" }
						}
					},
					Target = "Ally"
				},
				Bio = "The slumbering."
			},
			["thee_wind, Floppa Lover"] = {
				Id = 135273383429406,
				Name = "swaglord63 S.E.C. Death Unit Veteran",
				AttackEffect = "Gun",
				AltArt = true,
				Effect = {
					Name = "Helping Out",
					Type = "OnSummon",
					Power = {
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						},
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						},
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						},
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						},
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						},
						{
							"RandomAdd",
							{ "Royal Chair", "1984sec", "Chairmas Miracle" }
						}
					},
					Target = "Ally"
				},
				Bio = "I graduated from college with a PhD in being an idiot."
			}
		},
		Health = 1200,
		Power = 1200,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 12 },
		Archetype = "Chair",
		Effect = {
			Name = "Helping Out",
			Description = "When this card is cast: Give yourself 6 Chair cards.",
			Type = "OnSummon",
			Power = {
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				},
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				},
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				},
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				},
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				},
				{
					"RandomAdd",
					{ "Royal Chair", "Modern Chair", "Wooden Chair" }
				}
			},
			Target = "Ally"
		},
		Bio = "He saw his four-legged friend, battered and destroyed. As the jockey, he felt a remorse so immense that it consumed him. He knew what had to be done."
	},
	Nenjas = {
		Id = 6126331945,
		Name = "Nenjas",
		AltCards = {
			["Nenjas-AN"] = {
				Id = 10362181142,
				Name = "Nenjas Trader",
				Effect = {
					Power = {
						{ "DeckAdd", "NenjasToken-AN" },
						{ "DeckAdd", "NenjasToken-AN" },
						{ "DeckAdd", "NenjasToken-AN" }
					}
				},
				Bio = "Long ago, players would trade copies of the card Nenjas with admins. In exchange, they'd get full sets of any regular art card in the game! The tradition started after Myrmiredon himself unpacked 4 Nenjas in a single pack. Combined with how useless its effect was, this was what motivated turning Nenjas into the defacto trade currency of the game."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "IcePunch",
		Archetype = "Nenjas",
		Color = "Blue",
		Cost = { Blue = 3 },
		CustomReminder = {
			["Nenjas Tokens"] = "A 🔵🔵🔵 400/400 token.\nWhenever an allied Nenjas dies: Draw a card."
		},
		Effect = {
			Name = "Shadow Shuffle",
			Description = "When this card is cast: Shuffle 3 Nenjas Tokens into your deck.",
			Type = "OnSummon",
			Power = {
				{ "DeckAdd", "NenjasToken" },
				{ "DeckAdd", "NenjasToken" },
				{ "DeckAdd", "NenjasToken" }
			},
			Target = "Ally"
		},
		Bio = "Don't hit his cake hat, or you'll be asking for it."
	},
	Tiger370 = {
		Id = 6377266075,
		Name = "Tiger370",
		AltCards = {
			["Ms. Felicia and Ms. Iris, Lovely Couple"] = {
				Id = 10570705256,
				AltArt = true,
				AttackEffect = "StudBlast",
				Name = "Ms. Felicia and Ms. Iris, Lovely Couple",
				Bio = "How lovely! I hope they don't tear me apart."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 4 },
		Effect = {
			Name = "Plushie Amp",
			Description = "When this card is cast, if your baseplate rank is 4 or lower: Obliterate all fighters. You can't cast anything else this turn.",
			Type = "OnAllySummon",
			Power = {
				{ "Obliterate" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "All",
			EffectRequirement = { "Board", "AllyGenZone", 0, 5 }
		},
		Bio = "YOU DON'T NEED ALL YOUR LIMBS TO WIN A DESTRUCTION DERBY!!!"
	},
	NenjasToken = {
		Id = 6987163229,
		Name = "Nenjas Clone",
		AltCards = {
			["NenjasToken-AN"] = {
				Id = 10779695019,
				Name = "Nenjas Fanatic",
				AttackEffect = "Jab",
				Bio = "He just thinks they're neat!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "IcePunch",
		Archetype = "Nenjas",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Teamwork",
			Description = "Whenever an allied Nenjas dies: Draw a card.",
			Type = "OnAllyDeath",
			Power = { { "Draw", 1, "Ally" } },
			Archetype = "Nenjas",
			Target = "Self"
		},
		Bio = "You shouldn't have hit that cake hat."
	},
	Zabiehunter = {
		Id = 11972000794,
		Name = "Zabiehunter",
		AltCards = {
			SSS = {
				Id = 15804642225,
				Name = "SSS",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "It was fun while it lasted."
			},
			["Zabiehunter-Sun"] = {
				Id = 17346073268,
				Name = "Zabiehunter",
				AttackEffect = "Slash",
				Bio = "Here it is, the sunset! I always love to count it down. Five... you do the rest, buddy."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Green = 12, Neutral = 2 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Summon 2 fighters from your deck that each cost 14 or fewer total studs. Trigger their effects as though they were cast.",
			Type = "OnSummon",
			Power = { {
				"MoveZone",
				{ "Fighter_14OrLower", "Deck_Ally", "Field_Ally", true, false, 2 }
			} },
			TriggerOnSummons = true,
			Target = "Self"
		},
		Bio = "I want to see if the light can pass through me."
	},
	Mohawk2275 = {
		Id = 10352816230,
		Name = "Mohawk725",
		AltCards = {
			["Mohawk2275-Hal"] = {
				Id = 137471776105222,
				AttackEffect = "MagicRed",
				Name = "SMILE",
				Bio = " :) "
			},
			["Mag Without Ones Self"] = {
				Id = 75273007990152,
				Name = "Mag Without Ones Self",
				Commissioner = { "Jasp1108" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 707,
				Bio = "\"Obliterating me, Obliterating you\""
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2 },
		Token = true,
		Effect = {
			Name = "Don't sloth me",
			Description = "Whenever your opponent casts a fighter: Destroy it. Obliterate this card.",
			Type = "OnEnemySummon",
			Power = {
				{ "Destroy" },
				{ "Obliterate", 30, "Self" }
			},
			Target = "Aggressor"
		},
		Bio = "I will flay the skin from your flesh and the flesh from your bones and scrape your bones dry. And even then, you will not have suffered enough. :^)"
	},
	NullSenseStudio = {
		Id = 5079319917,
		Name = "NullSenseStudio",
		AltCards = {
			["NullSenseStudio-E"] = {
				Name = "Dr.Stein",
				AttackEffect = "Storm",
				Id = 8778708431,
				ReplaceCardArtant = { 8778709158 },
				ReplaceBioant = "Did you really think you were helping those people? Pathetic. You're a fool just like them! Lost on this Earth for sentimental and foolish reasons!",
				Bio = "\"It's finally complete! Though I never thought it'd be quite this easy to find someone so gullible!\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Transformant = "NullToken",
		EffectVariable = 1,
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast another fighter, if there's no gear on this card: Unlock that fighter and it gains 200 Power. Attach a gear to this card.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Unlock", 9999, "Aggressor" },
				{ "Strengthen", 200, "Aggressor" },
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
		ReplaceCardArtant = { 5078935504 },
		ReplaceBioant = "As a kid he played in the sandbox. As an adult he created the sandbox.",
		Bio = "As a kid he played in the sandbox. As an adult he created the sandbox."
	},
	NullToken = {
		Id = 5078935504,
		Name = "NullSenseStudio",
		AltCards = {
			["NullToken-E"] = {
				Name = "Dr.Stein",
				AttackEffect = "Storm",
				Id = 8778709158,
				Bio = "\"Did you really think you were helping those people? Pathetic. You're a fool just like them! Lost on this Earth for sentimental and foolish reasons!\" This card is still an alt-art of NullSenseStudio."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 3, Neutral = 3 },
		Stealth = true,
		Effect = {
			Name = "Sandbox",
			Description = "Whenever you cast another fighter: Unlock it. It gains 200 Power. This ability triggers only once, and has already triggered.",
			Type = "Null",
			Power = {
				{ "Unlock", 9999, "Aggressor" },
				{ "Strengthen", 200, "Aggressor" },
				{ "Transform", "NullToken", "Self" }
			},
			Target = "Ally",
			EffectTransformPreserveRarity = true
		},
		Bio = "As a kid he played in the sandbox. As an adult he created the sandbox."
	},
	iamlogic = {
		Id = 4536837512,
		Name = "iamlogic",
		AltCards = {
			iamlogicPurplePsion = {
				Id = 3471743968,
				AttackEffect = "Arcane",
				Name = "iamlogic, Purple Psion",
				CopyBodge = "iamlogicPurplePsion",
				Bio = "kek gaming clan tryouts are open."
			},
			["iamlogic-AN"] = {
				Id = 116757582907628,
				AttackEffect = "Arcane",
				Name = "kek gaming iamlogic",
				Bio = "gg 2184"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever you cast another fighter: Deal 200 damage to it and it loses 200 power. This card gains 200 Health and Power.",
			Type = "On|Other|AllySummon",
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
	["Javier Killer"] = {
		Id = 7550898720,
		Name = "xXJavier_killer1xX",
		AltCards = {
			["Javier Killer-E"] = {
				Id = 9034143416,
				Name = "Shady Subjeggct",
				AttackEffect = "Knife",
				Bio = "Something's off about this one... and it's not the smell."
			},
			Stoat = {
				Id = 9352948568,
				AltArt = true,
				Name = "Stoat",
				AttackEffect = "Scratch",
				Bio = "Total misplay... wait..."
			},
			["xXJavier_killer1xX-Banner"] = {
				Id = 12358894629,
				AttackEffect = "British",
				Name = "Heartbreakers",
				Bio = "Love is deadly."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Value gaining",
			Description = "When this card is cast: Destroy a target allied fighter.",
			Type = "OnSummon",
			Power = { { "Destroy", nil, nil, nil, nil, "HeadExplode" } },
			Target = "SingleAlly",
			EffectRequirement = { "Board", "Ally", 1, 9999 }
		},
		Bio = "I will destroy the middle class."
	},
	["Satyr Firemaster"] = {
		Id = 11769946814,
		Name = "Satyr Firemaster",
		AltCards = {
			["True Form Tige1111"] = {
				Id = 15941936982,
				Name = "True Form Tige1111",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 201,
				Summonant = "True Form Tige1111",
				Bio = "Meh.  @grafyt 6/10.  What do you mean that's too low?  WHY ARE YOU PINGING FLUFFLE. FINE, 6.5, HAPPY NOW?"
			},
			["Satyr Firemaster-Sun"] = {
				Name = "Satyr Firedancer",
				AttackEffect = "Blaze",
				CopyBodge = "Satyr Firemaster-Sun",
				Id = 7317454952,
				Bio = "Burny the Satyr says: Only YOU can start forest fires! :D :D",
				Summonant = "Satyr Firemaster-Sun"
			},
			["Horseman of Conquest"] = {
				Name = "Horseman of Conquest",
				AttackEffect = "Arrow",
				Id = 7437135225,
				Summonant = "Horseman of Conquest",
				Bio = "Bow in hand and crown on head, he went out conquering and to conquer."
			},
			["Lid - Sunlight Sunderer"] = {
				Id = 102700683458358,
				Name = "Lid - Sunlight Sunderer",
				AttackEffect = "MagicYellow",
				AltArt = true,
				Summonant = "Lid - Sunlight Sunderer",
				PremiumArt = 423,
				Bio = "Does your luck wax or wane?"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "Flare",
		Color = "Yellow",
		Rank = 7,
		AlternateCostRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" },
		Cost = { Neutral = 7, Red = 2, Yellow = 4, Green = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Charge = true,
		Summonant = "Satyr Firemaster",
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Cast this card ignoring its {W} cost if there are no Blue cards in your baseplate.\nDuring your end step: Summon a copy of this card. Your opponent loses 450 life.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "Summonant" },
				{ "Inflict", 450, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "\"I was feeling lonely one day, so I made a friend out of charcoal! Then I thought, hey, why not make a party out of charcoal!? :D :D\""
	},
	["Great Paraselene Sage"] = {
		Id = 6741582439,
		Name = "Great Beastbreaker",
		AltCards = {
			["Divine Emperor  Keeler1"] = {
				Name = "Divine Emperor Keeler1",
				CopyBodge = "Divine Emperor Keeler1",
				AttackEffect = "Divinity",
				Id = 6022462431,
				AltArt = true,
				Bio = "A bright future, filled with me, only me."
			},
			["Horseman of Death"] = {
				Name = "Horseman of Death",
				AttackEffect = "MagicBlue",
				Id = 7437134528,
				Bio = "Authority was given to them over a fourth of the earth, to kill with sword, famine, conquest and by the wild beasts of the land."
			},
			["Lid - Cosmic Summoner"] = {
				Id = 86146215238979,
				Name = "Lid - Cosmic Summoner",
				AttackEffect = "MagicBlue",
				Bio = "The hours of folly are measured by the clock, but of wisdom: no clock can measure.",
				AltArt = true,
				PremiumArt = 394
			},
			["Great Beastbreaker-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				AttackEffect = "MagicBlue",
				Id = 115901107520311,
				Bio = "Everyone working for Umberhallow knew the whole spiel about the Pits being one Big ©️ family ™️ was just corpo speak. For the lonely monster tamer, living amongst all those misfits was all she ever wanted."
			},
			["Mr Attic"] = {
				Id = 109194009529461,
				Name = "Mr. Attic",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"I HAVE TO HIDE AND CALL 9-11 IN MY ATTIC\""
			}
		},
		CopyBodge = "Great Paraselene Sage",
		Health = 1500,
		Power = 1500,
		Rarity = "Rare",
		AttackEffect = "Gravity",
		DamageImmune = true,
		Rank = 7,
		Color = "Blue",
		AlternateCostRequirement = { "Color", "AllyGenZone", 0, 1, "Yellow" },
		Cost = { Neutral = 7, Red = 2, Blue = 4, Green = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Effect = {
			Name = "Lunar Rays",
			Description = "Cast this card ignoring its {W} cost if there are no Yellow cards in your baseplate.\nWhenever you cast a fighter: Deal 4000 damage to that fighter and 300 damage to a target fighter.",
			Type = "OnAllySummon",
			Power = {
				{ "Damage", 4000, "Aggressor" },
				{ "Damage", 300, "Single" }
			},
			Target = "Ally"
		},
		Bio = "\"Freedom is coming, to all beasts who bend their will.\""
	},
	["Delirious Ooze"] = {
		Id = 6022460859,
		Name = "Delirious Ooze",
		AltCards = {
			["Horseman of War"] = {
				Name = "Horseman of War",
				AttackEffect = "Flare",
				Id = 17790319240,
				Bio = "A greatsword given to him, it was granted to take peace from the earth, and that men would slay one another."
			},
			["Lid, Multicolor Luminary"] = {
				Id = 15714804835,
				Name = "Lid, Multicolor Luminary",
				AltArt = true,
				PremiumArt = 175,
				Bio = "no"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Zombified = true,
		Rank = 7,
		Color = "Red",
		AlternateCostRequirement = { "Color", "AllyGenZone", 0, 1, "Green" },
		Cost = { Neutral = 7, Red = 4, Yellow = 2, Blue = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		CustomReminder = {
			["Assist Trophy"] = "A ⚪⚪⚪ Action, inert in all zones. When it's cast, a target fighter gains 500 Power.",
			["Delirious Chaos"] = "An action with more than 0 health manifests into a fighter."
		},
		Effect = {
			Description = "Cast this card ignoring its {W} cost if there are no Green cards in your baseplate.\nWhen this card is cast: Transform all other fighters into an Assist Trophy. Return them to their hand.",
			Type = "OnSummon",
			Power = {
				{ "Transform", "Assist Trophy" },
				{ "Return" }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field", "Enemy_Field" },
				Condition = "OtherCards"
			}
		},
		Bio = "Let it show you everything nature cannot do."
	},
	["Confusion Elemental?"] = {
		Id = 6786862114,
		Name = "Confusion Elemental?",
		AltCards = {
			["Illusionist Keeler1"] = {
				Id = 6786863644,
				Name = "Illusionist Keeler1",
				AttackEffect = "Tempest",
				AltArt = true,
				Bio = "Is this card an alternate art of Confusion Elemental?"
			},
			["Horseman of Famine"] = {
				Name = "Horseman of Famine",
				AttackEffect = "Maelstrom",
				Id = 7443716585,
				Bio = "A quart of wheat for a denarius, and three quarts of barley for a denarius; but do not damage the oil and the drink."
			},
			["Lid & Roros: Chaotic Card Connoisseurs"] = {
				Id = 132418420295177,
				Name = "Lid & Roros: Chaotic Card Connoisseurs",
				AltArt = true,
				Bio = "The best cards are the ones that no one can plan around."
			}
		},
		Health = 2026,
		Power = 1,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Green",
		AssignRandom = 20,
		AssignRandomMininum = 0,
		Rank = 7,
		AlternateCostRequirement = { "Color", "AllyGenZone", 0, 1, "Red" },
		Cost = { Neutral = 7, Green = 4, Yellow = 2, Blue = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Cast this card ignoring its {W} cost if there are no Red cards in your baseplate.\nDuring combat, this fighter assigns random damage between 0 and 1000.\nWhenever an enemy fighter dies: Unlock this card.",
			Target = "Self",
			Ability = {
				OnEquippedAlways = {
					Power = {
						{
							"GivePassiveSpecific",
							{ AssignRandom = 20 }
						},
						{
							"GivePassiveSpecific",
							{ AssignRandomMininum = 0 }
						}
					},
					Target = "GearOwner"
				},
				OnUnequip = {
					Power = {
						{ "RemovePassive", "AssignRandom" },
						{ "RemovePassive", "AssignRandomMininum" }
					},
					Target = "GearOwner"
				},
				OnEnemyDeath = {
					Power = { { "Unlock", 9999 } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	HighlanderW = {
		Id = 14387344651,
		Name = "Iris, Master of Studs",
		AltCards = {
			["HighlanderW-Banner"] = {
				Id = 9795152923,
				Name = "Iris, Summer Master",
				Bio = "A nicely elegant summer outfit designed by Nibblex for Iris, the blueish color is a nice touch that give off a fresh n' cool vibe for the entire outfit, it's also paired with a nice silky wrap and a beautiful hat."
			},
			["HighlanderW-Banner2"] = { Id = 12110723428, Name = "Mac Iris", Bio = "Mac Iris, it's tasty." },
			["HighlanderW-EXReward"] = {
				Id = 9830565083,
				Name = "Iris, Studmaster",
				Bio = "\"Rainbow scattering across the sky, reflecting a shining light bounded by no one. Power of the studs-master unchained!!!\""
			},
			HighlanderWKorean = {
				Id = 71164803148418,
				Name = "아이리스, 스터드의 대가",
				CopyBodge = "HighlanderWKorean",
				SearchTerms = { "Iris", "Iris, Master of Studs" },
				PackDisplayOverride = "IcyTea",
				Untradeable = true,
				CustomReminder = {
					Translation = "During end step: This fighter gains {R}{G}{B}{Y} studs to its owner. Then, puts a fleeting card of each rarity into the owner's hand."
				},
				Effect = {
					Name = "WWW",
					Description = "당신의 종료 단계 동안: {R}{G}{B}{Y}를 얻습니다. 각 희귀도별로 하나의 일시적인 카드를 자신에게 부여합니다.",
					Type = "OnEnd",
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "RandomAdd", "Common" },
						{ "RandomAdd", "Uncommon" },
						{ "RandomAdd", "Rare" },
						{ "RandomAdd", "Epic" },
						{ "RandomAdd", "Legendary" },
						{ "RandomAdd", "Token", "Ally" },
						{ "Red", 1 },
						{ "Green", 1 },
						{ "Blue", 1 },
						{ "Yellow", 1 }
					},
					EffectFleetingAdd = true,
					Target = "Ally"
				},
				Bio = "BLOX CARDS에 오신 것을 환영합니다. 즐거운 시간 보내세요!"
			},
			["Scarlet Paradise"] = {
				Id = 10823458605,
				AltArt = true,
				Name = "Neco-Iris",
				Bio = "湖西に!"
			},
			["God Machine"] = {
				Id = 10823495454,
				AltArt = true,
				Name = "God Machine",
				Bio = "Light exists only to be subsumed by shadow."
			},
			["Vivix & Kruko, Dreamcatchers"] = {
				Id = 16117247401,
				Name = "Adam n' Eve",
				AltArt = true,
				Commissioner = { 500141320 },
				PremiumArt = 160,
				Bio = "Testing! Testing! It's time for Testing!"
			},
			["vivixr31 and iikxngninja"] = {
				Name = "VVX",
				Id = 17860391187,
				AttackEffect = "Katana",
				Commissioner = { 500141320, 13353647 },
				AltArt = true,
				PremiumArt = 97,
				Bio = "\"You're making it really difficult for me Gurney.\"<br/>\"You can't take me away! I'm still new!\" \"Gurney, say Bread and Butter.\"<br/>\"Yes, it is time isn't it?\"<br/>\"I'm sure Gurney would have like to say goodnight, and thank you for watching.\""
			},
			["HighlanderW-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 113134229072360,
				Bio = "Nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan"
			},
			["The Malfunctioned One"] = {
				Id = 89332941875233,
				Name = "Tally Blox",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Like I might rap like an English chap<br/>Take you by the stickers and I'll scum your cap<br/>You didn't think we had the gall<br/>Well bloody welcome to Tally Blox"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "StudBlast",
		Color = "Neutral",
		Cost = { Neutral = 3, Blue = 2, Red = 2, Green = 2, Yellow = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Rank = 5,
		AddBlock = true,
		Gladiator = true,
		RandomAddBypass = "IncludeToken",
		SummonAnimation = "SummonIris",
		EffectAnimation = "RainbowSelf",
		Effect = {
			Name = "WWW",
			Description = "During your end step: You gain {R}{G}{B}{Y}. Give yourself a fleeting card of each rarity.",
			Type = "OnEnd",
			Power = {
				{ "RandomTutorfor", "Gladiator", "Ally" },
				{ "RandomAdd", "Common" },
				{ "RandomAdd", "Uncommon" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Epic" },
				{ "RandomAdd", "Legendary" },
				{ "RandomAdd", "Token", "Ally" },
				{ "Red", 1 },
				{ "Green", 1 },
				{ "Blue", 1 },
				{ "Yellow", 1 }
			},
			EffectFleetingAdd = true,
			Target = "Ally"
		},
		Bio = "\"My, My! Is it finally my turn to shine? I'll put on a show of power just for you! Behold, the power of a Stud Master!\""
	},
	HighlanderB = {
		Id = 7204456236,
		Name = "Braxton, Champion of Intellect",
		AltCards = {
			["Braxton-Mooncake2022"] = {
				Id = 10855895364,
				Name = "Braxton",
				AttackEffect = "Whirlpool",
				Bio = "A moment to be thankful for, under the warm moon. Happy Mooncake Festival 2022!"
			},
			["Mr. B-Sides"] = {
				Id = 113018522624738,
				Name = "The Master of Chaos",
				AltArt = true,
				PremiumArt = 131,
				AttackEffect = "Electric",
				Bio = "Fall."
			},
			["HighlanderB-AWIH"] = {
				Id = 17600746607,
				Name = "Tune of the World",
				AttackEffect = "MagicBlue",
				Bio = "Everything in this world is made up of connections between matter. From those connections, one may potentially peer in the future.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Insate Lukeout Fire"] = {
				Id = 77830939799199,
				Name = "Insate, Lukeout Fire!",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 557,
				Bio = "Hmm... Where will Sphynx's next riddle be?"
			},
			["BluMan, Action Extraordinaire"] = {
				Id = 136101652564789,
				Name = "BluMan, Action Extraordinaire",
				Commissioner = { "" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 777,
				Bio = "\"No, my name is not supposed to be a reference, thank you for asking.\""
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 3 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		EffectAnimation = "MoonwardTerrain",
		EffectVariable = 1,
		Effect = {
			Name = "WWW",
			Description = "Whenever you discard your 2nd, 3rd, or 4th card each turn: This card gains 100 health. Give yourself a Blue or Red action card, except it's inert in all zones.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Heal", 100, "Self" },
						{ "RandomAdd", "Lunar" },
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "Aggressor",
					EffectRequirement = { "Playertable", "Me", 2, 5, "DiscardCount" },
					MetaData = { TokenOmni = true }
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					Target = "Self",
					NoBlip = true
				}
			},
			Type = "OnAllyDiscard",
			EffectRequirement = { "Playertable", "Me", 2, 5, "DiscardCount" },
			Target = "Ally"
		},
		Bio = "\"Why, an opportunity to study some of the land's most recondite beings up close? How tantalizing!\""
	},
	HighlanderR = {
		Id = 7205023088,
		Name = "Ren, Champion of Domination",
		AltCards = {
			["HighlanderR-AWIH"] = {
				Id = 17602361620,
				Name = "Professor Thec Hiller",
				AttackEffect = "Slash",
				Bio = "Nothing like a nightly stroll.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 800,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		EffectAnimation = "LinkedSwordStrike",
		Color = "Red",
		Rank = 5,
		Cost = { Neutral = 2, Red = 3 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "During your end step, if there is 1500 power amongst allied fighters: You lose 200 life. Deal 200 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = {
				{ "Cost", 200 },
				{ "Damage", 200, "Opponent" },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			EffectRequirement = { "Power", "Ally", 1500, 99999 },
			Target = "Ally"
		},
		Bio = "\"Mine is the path of pain and victory!\""
	},
	HighlanderG = {
		Id = 10221505907,
		Name = "Gaius, Champion of Vitality",
		AltCards = {
			["HighlanderG-AWIH"] = {
				Id = 17600715140,
				Name = "Asmodeus, Queen of Demons",
				AttackEffect = "ScorchPunch",
				Bio = "Being a pet shop owner helps out when your wife's an exotic pet lady.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 1600,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Tempest",
		Color = "Green",
		Rank = 5,
		Cost = { Neutral = 2, Green = 3 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a Colourless fighter: Give yourself 2 Green cards. You gain 200 life.",
			Type = "OnAllySummon",
			Power = {
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "Cost", -200 },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Color = "Neutral",
			Target = "Ally"
		},
		Bio = "\"He's watching me. That demon will not invade my thoughts like he did my kingdom.\""
	},
	HighlanderY = {
		Id = 10221465945,
		Name = "Yuki, Champion of Emotion",
		AltCards = {
			["HighlanderY-Sun"] = {
				Id = 9173936280,
				AttackEffect = "Jab",
				Bio = "Let's make some happy summer memories together ^^"
			},
			["Gent Manic"] = {
				Id = 12326158401,
				AltArt = true,
				AttackEffect = "Hammer",
				Name = "Gent Manic",
				Bio = "\"okay no that joke sucked im just gonna kill you now\""
			},
			["HighlanderY-AWIH"] = {
				Id = 17600805721,
				Name = "Joshriel, Comedic Brother",
				AttackEffect = "Microphone",
				Bio = "The silly half of the Pits' hosts. His light and dark humor blend together like a car crash!",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 400,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Rank = 5,
		Cost = { Neutral = 2, Yellow = 3 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter, if you have no {Y}: Unlock it and you gain {Y}.",
			Type = "OnAllySummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Yellow", 1, "Ally" },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" },
			Target = "Aggressor"
		},
		Bio = "Both cutesy and neurotic, the worst thing one can do around Yuki is ignore her."
	},
	HighlanderRB = {
		Id = 6688385560,
		Name = "Ghealach of the Paraselene Sages",
		AltCards = {
			["Wendy and Dustin, Heartsmashin' Siblings"] = {
				Id = 71968303620543,
				AttackEffect = "MagicRed",
				AltArt = true,
				Name = "Ryuka Onetto",
				Bio = "Some people call me the space cowboy."
			},
			["BonkJobBot, Baneful Innovator"] = {
				Id = 140135493233051,
				Name = "BonkJobBot, Blood Moon Innovator",
				SummonAnimation = "AstarossaSummon",
				SummonedAnimation = "AstarossaSummon",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 534,
				Bio = "Your deck does have potential.... But it's wasted by your <font color=\"rgb(255,0,0)\">INCOMPETENCE!</font>"
			},
			["Poweraid Gatorade"] = {
				Id = 84328142553019,
				Name = "Poweraid, Financial-aid, Government-aid, Kool-aid, just all of em Gatorade",
				AttackEffect = "Jab",
				SummonAnimation = "TaintedSummon",
				AltArt = true,
				PremiumArt = 608,
				Bio = "STOP CALLING ME POWERAID!!!"
			}
		},
		Health = 1300,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 2, Red = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Moonward = true,
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast an action: Deal 150 damage to all fighters.",
			Type = "OnAllyCast",
			Power = {
				{ "Damage", 150 },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Target = "All"
		},
		Bio = "\"Those demons know who I am, what I mean to their kind. Yet, they cheer all the same for me... Could this be the Pits influence?"
	},
	HighlanderRG = {
		Id = 6688208184,
		Name = "Bloatware",
		AltCards = {
			["Gabriel the Seeker"] = {
				Id = 10221474951,
				AttackEffect = "Tempest",
				Name = "Gabriel the Seeker",
				Bio = "I found you, now you shall be guided into my light."
			},
			Walrog = {
				Id = 18771310844,
				Name = "Walrog",
				AltArt = true,
				PremiumArt = 281,
				Bio = "Huzzah!"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Green",
		Rank = 5,
		Cost = { Neutral = 2, Green = 2, Red = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast an Epic fighter: All allied Epic and Legendary fighters gain 400 Health.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 400 },
				{ "Heal", 400, "AlliedEpic" },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Rarity = "Epic",
			Target = "AlliedLegendary"
		},
		Bio = "How Hallow managed to bring a morbidly obese piece of software into the Pits is beyond anyone's understanding."
	},
	HighlanderRY = {
		Id = 6688389065,
		Name = "Siegmund, Strife Smasher",
		AltCards = {
			["SirVenon and Pungdex, Dissonance of Harmony"] = {
				Id = 10921298287,
				Name = "SirVenon and Pungdex, Dissonance of Harmony",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "No one is perfect, but there's something about a guy with the right kind of guitar that makes him feel like God."
			},
			Kaz = {
				Id = 15055123883,
				Name = "Kaz",
				AttackEffect = "RedScythe",
				AltArt = true,
				PremiumArt = 132,
				Bio = "Through the fire and flames."
			},
			["Titan Speakerhead"] = {
				Id = 18914999713,
				Name = "Titan Speakerhead",
				AltArt = true,
				PremiumArt = 288,
				Bio = "skibidi dop dop dop yes yes"
			},
			["AQuix, The Crazed"] = {
				Id = 88004238671412,
				Name = "AQuix, The Crazed",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 678,
				Bio = "\"Man, I hope nothing bad happens today”<br/><b>“SPEAR TIME!!!”</b>"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Rank = 5,
		Cost = { Neutral = 2, Yellow = 2, Red = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you lose life, if you've lost less than 600 Life this turn: All allied fighters gain 150 Power. You lose 200 Life.",
			Type = "OnLifeLoss",
			Power = {
				{ "Strengthen", 150 },
				{ "RandomTutorfor", "Gladiator", "Ally" },
				{ "Cost", 200 }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 600, "Lifeloss" }
		},
		Bio = "Wielder of the gigantic sword Grandark, it didn't take much convicing to bring Siegmund to the Pits, where more destruction awaited."
	},
	HighlanderBY = {
		Id = 7133959253,
		Name = "Epic Duck",
		AltCards = {
			["Epic Duck-Sun"] = {
				Id = 10283616217,
				Name = "Taiko Quackmaster",
				AttackEffect = "Whirlpool",
				Bio = "The master hypes up the festival by delivering unrivalled drumbeats."
			},
			["Epic Duck-C"] = {
				Name = "Holiday Cheer Golem",
				Id = 15628929576,
				AttackEffect = "FirePunch",
				Bio = "And here it comes, so do not fear. <br/> The clock strikes midnight, Happy New Year!"
			},
			["Epic Duck-Alt"] = {
				Name = "Epic Duck",
				Id = 16446074972,
				AltArt = true,
				PremiumArt = 225,
				Bio = "TEH EPIK DUCK IZ COMING!!!"
			},
			["Ariem, Seraph off Amentia"] = {
				Id = 17346076911,
				Name = "Ariem, Seraph off Amentia",
				AltArt = true,
				PremiumArt = 262,
				Bio = "Glass like sanity,<br/>Shattered, now turned mosaic,<br/>I live, and still love."
			},
			["Brixzee, Tonic Hoarder"] = {
				Id = 114669091096776,
				Name = "Brixzee, Tonic Hoarder",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 615,
				Bio = "sodas are wayy too expensive now man"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 2, Yellow = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter with total stats 500 or less: Set the stats of a target fighter to 500/500.",
			Type = "OnAllySummon",
			Power = {
				{ "SetHealth", 500 },
				{ "SetPower", 500 },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			SizeClass = "Picant",
			Target = "Single"
		},
		Bio = "The ducks were never this big, but do you think the crowd would have something as trivial as \"reality\" get in the way of a good show?"
	},
	HighlanderGY = {
		Id = 10221457896,
		Name = "Ultimate Doregriffon",
		AltCards = {
			Coalfaire = {
				Id = 88021008508751,
				Name = "Coalfaire",
				PremiumArt = 347,
				AltArt = true,
				Bio = "Let's make this battle a fun one!"
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Electric",
		Color = "Yellow",
		Rank = 5,
		Cost = { Neutral = 2, Green = 2, Yellow = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever a fighter targets this card: Give yourself 2 Colourless fighter cards. You gain 200 life.",
			Type = "OnFighterTarget",
			Power = {
				{
					"RandomAdd",
					"MultiColOnlyorGreenCostYellowCostorNoAddBlock NeutralorNoAddBlock FighterorNoAddBlock"
				},
				{
					"RandomAdd",
					"MultiColOnlyorGreenCostYellowCostorNoAddBlock NeutralorNoAddBlock FighterorNoAddBlock"
				},
				{ "Cost", -200 },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Doregriffons don't understand humans. If they didn't want to be eaten, why are they made out of meat and treasure?"
	},
	HighlanderGB = {
		Id = 7133852258,
		Name = "Herrus, Elder Thought Demon",
		AltCards = {
			["Braisen C. Flarus"] = {
				Name = "Braisen C. Flarus",
				AttackEffect = "FirePunch",
				Id = 13128938808,
				AltArt = true,
				PremiumArt = 23,
				PackDisplayOverride = "Art Box",
				Addant = "Tenor Cannon",
				CustomReminder = {
					["Tenor Cannons"] = "A {G} 350/350, inert all zones. Whenever it destroys another, you gain 350 life and your opponent loses 350 life."
				},
				Effect = {
					Name = "WWW",
					Description = "Whenever you gain life: Give yourself 2 350/350 Tenor Cannons.",
					Type = "OnLifeGain",
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				},
				Bio = "Greetings! If you're reading this, you've probably looked at the back of one of our many cereal boxes. My name is Braisen Christopher Flarus, and I'm inviting you to an amazing once in a lifetime experience resort out in the middle of nowhere, and you might have the chance to win a week at the island! All you have to do is just find one of the many lucky tickets i've randomly thrown into the cereal boxes and you can win!\n(NOTE: This only includes the stay at the island. You will need to pay for everything else out of your wallet. NO REFUNDS.)"
			},
			["Bendybroc, Reconstructor of Doomspire"] = {
				Name = "Bendybroc, Reconstructor of Doomspire",
				AttackEffect = "FirePunch",
				Id = 121649340750937,
				AltArt = true,
				PremiumArt = 790,
				PackDisplayOverride = "Art Box",
				Addant = "Clayed Horde",
				CustomReminder = {
					["Clayed Horde"] = "A {G} 350/350, inert all zones. Whenever it destroys another, you gain 350 life and your opponent loses 350 life."
				},
				Effect = {
					Name = "WWW",
					Description = "Whenever you gain life: Give yourself 2 350/350 Clayed Hordes.",
					Type = "OnLifeGain",
					Power = {
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				},
				Bio = "\"My path is not a World Repairment, it's one's Reconstruction... and I shall do it WITH CLAY!!!\""
			},
			["Herrus, Elder Thought Demon-10Y-Banner"] = {
				PackDisplayOverride = "10th Anniversary Login Banner",
				Id = 120487010182794,
				Addant = "Thoughtling-10Y",
				Bio = "You know, nigh-omniscience truly isn't much of a gift. I like to read but finding new material is an utter improbability in that regard. With that said little one, you are to organize my works at Section Iota, Row 4700, Column 10006."
			},
			["The Chauffeur AQuix, PIU Players"] = {
				Name = "The Chauffeur & AQuix, PIU Players",
				Id = 94337012524689,
				Addant = "Thoughtling",
				AltArt = true,
				PremiumArt = 863,
				Bio = "<b><font color=\"#ff0d0d\">\"Man, that song was hard as hay\"</font></b><br/><b><font color=\"#0000FF\">\"I know, I had to take a genuine interest in beating that\"</font></b>"
			},
			["Ghostly Princess of the Netherworld"] = {
				Name = "Ghostly Princess of the Netherworld",
				Commissioner = { "" },
				Id = 117456902813156,
				Addant = "Thoughtling-G",
				SummonAnimation = "ApocSummon",
				AltArt = true,
				PremiumArt = 877,
				Bio = "Just a little longer. A little longer and there will be in full bloom..."
			}
		},
		Health = 3000,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "Gravity",
		Color = "Blue",
		Rank = 5,
		Cost = { Neutral = 2, Green = 2, Blue = 2 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Addant = "Thoughtling",
		AddBlock = true,
		Gladiator = true,
		CustomReminder = {
			Thoughtlings = "A {G} 350/350, inert all zones. Whenever it destroys another, you gain 350 life and your opponent loses 350 life."
		},
		Effect = {
			Name = "WWW",
			Description = "Whenever you gain life: Give yourself 2 350/350 Thoughtlings.",
			Type = "OnLifeGain",
			Power = {
				{ "RandomTutorfor", "Gladiator", "Ally" },
				{ "Add", "Addant" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "Herrus, the last of his kind, loathes his fate. Fundebted to Hallow, he is forced to partake in the games. Extremely intelligent and highly manipulative."
	},
	Thoughtling = {
		Id = 7133852663,
		Name = "Thoughtling",
		AltCards = {
			["Tenor Cannon"] = {
				Name = "Tenor Cannon",
				AttackEffect = "ModernRocket",
				Id = 13128940440,
				PackDisplayOverride = "Art Box",
				Bio = "\"<i>[INTRUDERS HAVE BEEN SPOTTED - INITIATING TERMINATION SEQUENCE]</i>\""
			},
			["Clayed Horde"] = {
				Name = "Clayed Horde",
				AttackEffect = "Scratch",
				Id = 138856325242079,
				PackDisplayOverride = "Art Box",
				Bio = "\"My experience, my vision, my friends – all of them will become a part of Reconstruction!\""
			},
			["Thoughtling-10Y"] = {
				Id = 123155892263552,
				Bio = "Herrus' Minions, obedience to the utmost degree, he can create as many as he wants but the vast majority of them are in his spacious study, organizing all of his works."
			},
			["Thoughtling-G"] = {
				Id = 115994664201280,
				Name = "Ghostly's butterflies",
				Bio = "\"Beautiful but deadly butterflies\""
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Green = 1 },
		TokenOmni = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever this card destroys another: You gain 350 life. Your opponent loses 350 life.",
			Type = "OnDestroy",
			Power = {
				{ "Cost", -350 },
				{ "Inflict", 350 }
			},
			Target = "Opponent"
		},
		Bio = "Psychic apparations manifested by Herrus to do his bidding."
	},
	HighlanderRBY = {
		Id = 7133732764,
		Name = "The Prophet",
		AltCards = {
			["Hopeful Spellbender, Sylvia"] = {
				Name = "Hopeful Spellbender, Sylvia",
				AttackEffect = "Blizzard",
				Id = 8765165136,
				AltArt = true,
				Bio = "A powerful magician from a far off land, she looks to bring peace and happiness to the world, mainly with magic explosions."
			}
		},
		Health = 700,
		Power = 500,
		Rarity = "Epic",
		EffectAnimation = "ProphetClock",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 1, Yellow = 1, Red = 3 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: All allied fighters generate. Unlock all allied fighters. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "Generate", 1 },
				{ "Draw", 1 },
				{ "Unlock", 99999 },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "With the power of time on his side, the Prophet moves forward towards his fateful encounter beyond the Pits."
	},
	HighlanderYGB = {
		Id = 7133731928,
		Name = "The Ghosdeeri",
		AltCards = {
			["HighlanderYGB-C"] = { Id = 11674987188, AttackEffect = "Blizzard", Bio = "" },
			["HighlanderYGB-G"] = {
				Id = 120617951007921,
				PremiumArt = 807,
				AttackEffect = "Blizzard",
				Bio = "\"Oh the pumpkin head with antlers? Yeah that one’s powerful not to mention intangible. Truly a worthy combatant in the Arena and my favorite but don’t worry about calling someone to deal with it, phones aren’t even a thing here silly\""
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Ice",
		Color = "Green",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 1, Yellow = 1, Green = 3 },
		Stealth = true,
		TargetImmune = true,
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		Gladiator = true,
		AddBlock = true,
		EffectVariable = 10,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a non-Gladiator fighter: Put it into your baseplate. Give yourself a Blue card, a Yellow card, and a Green card, except they're fleeting.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "MoveGenZone" },
						{
							"RandomAdd",
							"MonoOnlyorGreenCostorNoAddBlock GreenorNoAddBlock",
							"Ally"
						},
						{
							"RandomAdd",
							"MonoOnlyorBlueCostorNoAddBlock BlueorNoAddBlock",
							"Ally"
						},
						{
							"RandomAdd",
							"MonoOnlyorYellowCostorNoAddBlock YelloworNoAddBlock",
							"Ally"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					EffectFleeting = true,
					NotArchetype = "Gladiator",
					Target = "Aggressor",
					MetaData = { Fleeting = true }
				},
				OnEVCheckPass = {
					Power = { { "RandomTutorfor", "Gladiator", "Ally" } },
					Target = "Self"
				}
			}
		},
		Bio = "Cursed to wander the Ruins of Wood alone, it joins the Pits to pull others into spectral companionship."
	},
	HighlanderRGB = {
		Id = 9709352223,
		Name = "The Geomancer",
		AltCards = {
			["Spineless Swordmancer Flufflefunz"] = {
				Name = "Spineless Swordmancer Flufflefunz",
				AttackEffect = "Slash",
				Id = 8765165637,
				AltArt = true,
				Bio = "I'd rather love than be estranged. I'd rather hate than take the blame. I'd rather quit than do this again. I'd rather pretend that this rhymes..."
			},
			["YingTaoQueen and Icebeamed123, Frenemies"] = {
				Name = "YingTaoQueen and Icebeamed123, Frenemies",
				AttackEffect = "Katana",
				Id = 9336166619,
				AltArt = true,
				Bio = "We are Asia goblin."
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Rank = 5,
		Cost = { Neutral = 2, Blue = 3, Red = 1, Green = 1 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, or whenever you cast a Terrain: Animate your terrain into a fighter. Draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "AnimateTerrain" },
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = {
						{ "AnimateTerrain" },
						{ "RandomTutorfor", "Gladiator", "Ally" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Raid bosses are her speciality. Her destiny, if you will. She comes from Raid Boss Destiny."
	},
	HighlanderRGY = {
		Id = 10861873728,
		Name = "Quan Umberhallow, Crowdpleaser",
		AltCards = {
			["Fluffle & Trixie: Complete Idiots"] = {
				Id = 10861901755,
				Name = "Fluffle & Trixie: Complete Idiots",
				AttackEffect = "Scratch",
				Summonant = "Fluffle & Trix- See, THIS Is EXACTLY What I'm Talking About...",
				AltArt = true,
				Bio = "The punchline is that there is no punchline."
			},
			["HighlanderRGY-Alt"] = {
				Id = 11029713132,
				Name = "Quan Umberhallow",
				AttackEffect = "Scorch",
				AltArt = true,
				Bio = "<i>Imagine not starting your morning routine by looking through your gallery of ego-stroking fanart.</i>"
			},
			["Spook, Middle's Big Brother"] = {
				Id = 107266460656105,
				Name = "Spook, Middle's Big Brother",
				AltArt = true,
				Summonant = "Lesser Grunts",
				Bio = "Book of vengeance? You're just being beaten up."
			}
		},
		Health = 1400,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Rank = 5,
		Cost = { Neutral = 2, Red = 1, Yellow = 3, Green = 1 },
		Summonant = "Fanboy",
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Archetype = "Gladiator",
		AddBlock = true,
		Charge = true,
		Gladiator = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever this card attacks: All players destroy the oldest card in their hand, summons a 300/300 Fanboy, then loses 300 life.",
			Type = "OnAttack",
			Power = {
				{ "SpecificDiscard", 1, "LeftMostHand" },
				{ "Summon", "Summonant", "Ally" },
				{ "Summon", "Summonant", "Opponent" },
				{ "Cost", 300 },
				{ "Inflict", 300, "Opponent" },
				{ "RandomTutorfor", "Gladiator", "Ally" }
			},
			Target = "Aggressor"
		},
		Bio = "\"IT DOESN'T MATTER what your name is! This is MY house, and everyone in this crowd knows it! You're looking at the top dog, so run along to the locker room, ya JABRONIS!\""
	},
	["Tag Team Tactics"] = {
		Id = 7134273351,
		Name = "Tag Team Tactics",
		AltCards = {
			["Yin and Yang"] = {
				Id = 10935830871,
				Name = "Yin & Yang",
				AltArt = true,
				Bio = "Contradict and interdepend simultaneously."
			},
			["Tag Team Tactics-AWIH"] = {
				Id = 17440639682,
				Name = "Decisive Duo",
				Bio = "GANG",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Backup Plan"] = {
				Name = "Back-up Plan",
				Commissioner = { "BonkJobBot" },
				Id = 88280009375534,
				AltArt = true,
				PremiumArt = 881,
				Bio = "\"Welp...he's gone...oh well, time for some replacements. I'm sure we got another like him, right?\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "WWW",
			Description = "Search your deck for a Gladiator. Draw a card.",
			Type = "OnSummon",
			Power = {
				{ "RandomTutorfor", "Gladiator", "Ally" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "Herrus lacked the raw charisma to work the crowds. Kara was different; she was a heel like no other, and the crowd was starting to crave it. \"She's my ticket out of here, but she won't get far unless I break the pretty boy's face in,\" thought the demon."
	},
	Sorcus = {
		Id = 10186562103,
		Name = "Sorcus",
		AltCards = {
			["Cosmic Crasher Damario"] = {
				Id = 10184363574,
				AltArt = true,
				Name = "Cosmic Crasher Damario",
				AttackEffect = "Electric",
				Bio = "My win con? Why, the total annihilation of the game's code of course!"
			},
			["Sorcus-Hal"] = { Id = 7468270805, Bio = "Let me show you how scary I can be." },
			["epic yes, Silly Little Guy"] = {
				Id = 10914670161,
				AttackEffect = "Gravity",
				AltArt = true,
				Name = "epic yes, Silly Little Guy",
				Bio = "I have got to get sillier."
			},
			["Histor, Perfected"] = {
				Id = 15055127456,
				AttackEffect = "Divinity",
				AltArt = true,
				PremiumArt = 133,
				Commissioner = { 18546955, 297087291 },
				Name = "Histor, Perfected",
				Bio = "\"Now come, bare your souls to me!\""
			},
			["Sorcus-AWIH"] = {
				Id = 17600759889,
				Name = "Silly Billy",
				AttackEffect = "Divinity",
				Bio = "Sometimes the greatest wisdom can be inferred from the greatest fools.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			Unbaked = {
				Id = 87953033876856,
				Name = "Unbaked",
				ArtAnimation = "unbaked",
				AttackEffect = "LinkedSword",
				AltArt = true,
				PremiumArt = 421,
				Bio = "<b><font color=\"#FFA500\">Wallahi Im Finished</font></b>"
			},
			Hulcus = {
				Id = 127668126567725,
				Name = "Hulcus",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 506,
				Bio = "Your power is now mine!"
			},
			["Satori Youkai Sisters"] = {
				Name = "Satori Youkai Sisters",
				Commissioner = { "" },
				Id = 76078748357729,
				AltArt = true,
				AttackEffect = "XhartyrSlash",
				SummonAnimation = "SummonIris",
				PremiumArt = 883,
				Bio = "\"Guess we have a guest today, sis.\"<br/>\"Yeah! This is gonna be fun!\""
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "SkeleScythe",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		AddBlock = true,
		Effect = {
			Name = "Eye for an eye",
			Description = "Cast only if your starting deck has 2 or fewer Gladiators and no duplicates.\nWhen this card is cast: Exchange this card's power with a target fighter, then double this card's power.",
			Type = "OnSummon",
			Power = {
				{ "ExchangePower", 30, "Single" },
				{ "MultiplyPower", 2 }
			},
			Target = "Self"
		},
		Bio = "In the pits where gods do battle, a higher power must be the guard."
	},
	SorcusToken = {
		Id = 5309041933,
		Name = "Sorcus",
		AltCards = {
			CosmicToken = {
				Id = 5309046750,
				Name = "Cosmic Crasher Damario",
				AttackEffect = "Electric",
				CopyBodge = "Cosmic Crasher Damario",
				Bio = "My win con? Why, the total annihilation of the game's code of course!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		StartGameRequirement = { "Highlander", "Highlander" },
		Requirement = { "StartDeckChecks" },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "In the pits where gods do battle, a higher power must be the guard."
	},
	["Hellish Infurniture"] = {
		Id = 133158755267717,
		Name = "Hellish Infurniture",
		AltCards = {
			["Hellish Chairs"] = {
				Id = 7971548485,
				Name = "Hellish Chairs",
				AttackEffect = "Blaze",
				Bio = "This card is an alt-art of Hellish Infurniture."
			},
			["Friends of the Forest"] = {
				Id = 8269878505,
				Name = "Friends of the Forest",
				AttackEffect = "Tempest",
				Bio = "\"The only friend I need is the forest.\""
			},
			["Ao Oni"] = {
				Id = 130332129980591,
				Name = "Ao Oni",
				Bio = "oh hes behind me isnt he"
			},
			["Infurnished Tears"] = {
				Id = 9197530693,
				Name = "Infurnished Tears",
				AttackEffect = "Whirlpool",
				Bio = "\"Tears are also made up of the rare, hidden infurniture! ...clearly!\""
			},
			["Devious Creature"] = {
				Id = 98936762996443,
				Name = "Devious Creature",
				Bio = "I don't care that we messed up it's beautiful and I love them"
			},
			["The Damages"] = {
				Id = 103928192996294,
				Name = "The Damages",
				Bio = "imagine waiting 3 years to comn a token alt for a card that had all other token alts already XD"
			},
			["Hellish Infurniture-Homies"] = { Id = 120554485748906, Name = "The Homies", Bio = "go my chuddies" }
		},
		Health = 50,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Bite",
		EffectAnimation = "SelfFlare",
		Color = "Green",
		Cost = { Neutral = 1 },
		TokenGenZone = true,
		ChargeRequirement = { "Archetype", "AllyGenZone", 5, 9999, "Infurnished" },
		Archetype = "Infurnished",
		Effect = {
			Name = "WWW",
			Description = "This card has haste if there's 5 or more Infurnished cards in your baseplate.\nWhenever you cast a non-token fighter: This card and all Infurnished fighters in your baseplate gain 50 Power. Put this card in there.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Strengthen", 50, "Self" },
						{ "ArchetypeGenZoneStrengthen", 50 },
						{ "MoveGenZone", 30, "Self" }
					},
					Target = "Self",
					NotRarity = "Token",
					TargetParamters = {
						Zones = { "Ally_GenZone" },
						Condition = "Archetype",
						Modifier = "Infurnished",
						SubModifier = true
					}
				}
			}
		},
		Bio = "How can you be so sure there's no Infurnished among us?"
	},
	Hatestand = {
		Id = 6722730815,
		Name = "Hatestand",
		AltCards = {
			ImAwkwrd = {
				Id = 72258341776289,
				AltArt = true,
				Name = "ImAwkwrd",
				AttackEffect = "Jab",
				Bio = "\"Some people would just like to watch the world burn down. As for me, I burnt it.\""
			},
			Lit_Arsonist = {
				Id = 9197530115,
				AltArt = true,
				Name = "Lit_Arsonist",
				AttackEffect = "Bubbles",
				AddGenZoneant = "Infurnished Tears",
				Bio = "\"Did you know that tears are made up of (partially) electrolytes? If you cried hard enough, you could probably survive on tears alone!\""
			},
			["Des, Infurnished Conqueror"] = {
				Id = 15941935380,
				Name = "Des, Infurnished Conqueror",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 197,
				Bio = "\"It was my Destiny to stand above them with IKEA at my side. No matter how many Infurnitures it took. I hope I made you happy, Kohl.\""
			},
			["Sapphire, Jungle Pocket Enthusiast"] = {
				Id = 83713504561671,
				Name = "Sapphire, Jungle Pocket Enthusiast",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 597,
				AddGenZoneant = "Hellish Infurniture-Homies",
				Bio = "check it out im in the house like carpet"
			}
		},
		Health = 600,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Slash",
		EffectAnimation = "SelfFlare",
		Color = "Green",
		Cost = { Neutral = 2 },
		Archetype = "Infurnished",
		AddGenZoneant = "Hellish Infurniture",
		CustomReminderInfurnished = true,
		Effect = {
			Name = "WWW",
			Description = "Once each turn, whenever you cast an Infurnished card: Put a Hellish Infurniture into your baseplate.",
			Type = "OnAnyAllyCast",
			Power = { {
				"AddGenZone",
				{ "AddGenZoneant", 1 }
			} },
			Archetype = "Infurnished",
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Go on. Wear us."
	},
	["Infurnished Cultist"] = {
		Id = 6790633081,
		Name = "Infurnished Cultist",
		AltCards = {
			["ImAwkwrd, Gamemaster"] = {
				Id = 8269878032,
				AltArt = true,
				Name = "ImAwkwrd, Gamemaster",
				AttackEffect = "Jab",
				Addant = "Friends of the Forest",
				Bio = "\"DnD is great with friends... If I had any.\""
			},
			["Little Witch Rayburn (and Sheep)"] = {
				Id = 105547350389083,
				Name = "Little Witch Rayburn (and Sheep)",
				PremiumArt = 362,
				AltArt = true,
				Addant = "Devious Creature",
				Bio = "We got to brew this potion really carefully, okay?"
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Bite",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Archetype = "Infurnished",
		Addant = "Hellish Infurniture",
		CustomReminderInfurnished = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: Give yourself Hellish Infurniture.",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "The Infurnished are a cult that worships inanimate objects to gain their powers. By putting their own willpower into these object, they come to life as a demonic horde."
	},
	["Blood Drawers"] = {
		Id = 78327215132263,
		Name = "Low Shelf-esteem",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Green = 1, Yellow = 1 },
		Requirement = { "Archetype", "AllyGenZone", 3, 9999, "Infurnished" },
		Archetype = "Infurnished",
		Summonant = "Hellish Infurniture",
		GenZoneSummonant = "Hellish Infurniture",
		Effect = {
			Name = "WWW",
			Description = "Cast only if there are 3 or more Infurnished cards in your baseplate.<br/>You lose 500 life.<br/>Draw 2 cards.<br/>Summon 4 Hellish Infurniture from your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 500 },
				{ "Draw", 2 },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" }
			},
			Target = "Ally"
		},
		Bio = ":'("
	},
	["Ironing Horde"] = {
		Id = 6722732358,
		Name = "Ironing Horde",
		AltCards = {
			["Bibee, First Fang of Duelshire"] = {
				Id = 98136879014722,
				Name = "Bibee, First Fang of Duelshire",
				AttackEffect = "FirePunch",
				AltArt = true,
				GenZoneSummonant = "Hellish Infurniture",
				Bio = "A FAVOR FROM A COMMANDER, TO A INFURNISHED CULTIST.."
			}
		},
		Health = 1050,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Flare",
		EffectAnimation = "SelfFlare",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Archetype = "Infurnished",
		GenZoneSummonant = "Hellish Infurniture",
		ChargeRequirement = { "TokenArchetype", "Ally", 1, 9999, "Infurnished" },
		Effect = {
			Name = "WWW",
			Description = "This card has haste if there's an allied Infurnished token.\nWhenever this card attacks: Summon a Hellish Infurniture from your baseplate unlocked.",
			Type = "OnAttack",
			Power = {
				{
					"MoveZone",
					{ "Hellish Infurniture", "GenZone_Ally", "Field_Ally", true, false, 1 },
					"Self"
				},
				{ "Unlock", 9999, "SummonedCard" }
			},
			Target = "Ally"
		},
		Bio = "Nice and toasty."
	},
	Elttob = {
		Id = 7275003612,
		Name = "Elttob",
		AltCards = {
			["La Creatura ImAwkwrd"] = {
				Id = 8891706440,
				Name = "La Creatura ImAwkwrd",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Nya. Burunyuu. Dori Dori Dori."
			},
			["Kaelis, Black Marketeer"] = {
				Id = 124482368526398,
				Name = "Kaelis, Black Marketeer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 686,
				Bio = "I've got some good things on sale stranger!"
			}
		},
		Health = 650,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "MidMagicYellowEffect",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		Archetype = "Infurnished",
		GenZoneSummonant = "Hellish Infurniture",
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if there are 3 or more Infurnished cards in your baseplate: A target fighter loses 250 power. All Infurnished cards in your baseplate gain 250 power.",
			Type = "OnSummon",
			Power = {
				{ "ArchetypeGenZoneStrengthen", 250 },
				{ "Weaken", 250, "Single" }
			},
			Target = "Ally",
			EffectRequirement = { "Archetype", "AllyGenZone", 3, 9999, "Infurnished" }
		},
		Bio = "You may call him the Chairman."
	},
	["Brutal Decking"] = {
		Id = 6672912460,
		Name = "Brutal Decking",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Green = 3, Yellow = 3 },
		Archetype = "Infurnished",
		GenZoneSummonant = "Hellish Infurniture",
		Effect = {
			Name = "WWW",
			Description = "Summon 8 Hellish Infurnitures from your baseplate.\nUnlock each fighter with the lowest health.",
			Type = "OnSummon",
			Power = {
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{ "SummonGenZone", "GenZoneSummonant" },
				{
					"Unlock",
					30,
					"LowestHealth",
					nil,
					nil,
					nil,
					"EngulfFlareSmall"
				}
			},
			Target = "Ally"
		},
		Bio = "The shame of imprisonement gave the Infurnished the extra push needed to hone their brutality."
	},
	Infurnace = {
		Id = 6672914058,
		Name = "Infurnace",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		EffectAnimation = "LargeVampBiteEffect",
		Color = "Green",
		Cost = { Yellow = 1, Green = 3 },
		Archetype = "Infurnished",
		AddGenZoneant = "Hellish Infurniture",
		CustomReminderInfurnished = true,
		Effect = {
			Name = "WWW",
			Description = "Put a Hellish Infurniture into your baseplate.\nSelect 2 Infurnished fighters in your baseplate. Put them into your hand.\nYou may baseplate again this turn.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "AddGenZoneant", 1 }
				},
				{
					"MoveZone",
					{ "EffectTarget", "GenZone_Ally", "Hand_Ally", false, false },
					"CustomZoneTarget"
				},
				{ "DiscardLimit", 1 }
			},
			ZoneTargetParameters = {
				Zones = { "Ally_GenZone" },
				Condition = { Archetype = "Infurnished", Fighter = true },
				SelectionDescription = "2 Infurnished to cause mayhem with!",
				MinTargets = 0,
				MaxTargets = 2
			},
			Target = "Ally"
		},
		Bio = "Infurnished don't necessarily need to cause harm to others. It's a choice."
	},
	["Kohltastrophe, Infurnished Chairman"] = {
		Id = 7120741053,
		Name = "Kohltastrophe, Infurnished Chairman",
		AltCards = {
			["Dairing, Chair Lord"] = {
				Id = 7971545996,
				Name = "Dairing, Chair Lord",
				AttackEffect = "Flare",
				AltArt = true,
				Addant = "The Chairs Return",
				Summonant = "Lord Westinghouse Token",
				Bio = "This card is an alt-art of Kohltastrophe, Infurnished Chairman."
			},
			["Kohltastrophe, Infurnished Chairman-PC"] = {
				Id = 11346255429,
				AttackEffect = "Flare",
				Addant = "The Ergonomicon-PC",
				Summonant = "Goodknight, Infurnished Bunker-PC",
				PackDisplayOverride = "Group Precon: Infurnished",
				Bio = "\"We're both familiar with cruelty, aren't we, Ms. Kara? Don't worry about the specifics, my dear.\""
			},
			["Funny6665, Bluesteel King"] = {
				Name = "n_menotfound",
				AttackEffect = "TimeBomb",
				AltArt = true,
				Id = 10220324582,
				Addant = "Unlicensed Demolition",
				Summonant = "The Grand Destroyer",
				Bio = "Some people just want to watch the world burn."
			},
			["D.E.M.O.N Treasurer Agent Ice"] = {
				Name = "D.E.M.O.N Treasurer Agent Ice",
				AttackEffect = "Ice",
				AltArt = true,
				PremiumArt = 119,
				Id = 14905823112,
				Commissioner = { 898460282, 297087291 },
				Addant = "D.E.M.O.N Academy Student Council Chamber",
				Bio = "The Treasurer of D.E.M.O.N academy student council. Under immense pressure by Kyle and Mono to finish his paperwork."
			},
			Kai = {
				Name = "Kai",
				AltArt = true,
				PremiumArt = 125,
				Id = 14959557147,
				Addant = "Bible of Lord X",
				Bio = "“Waiting for the world to burn.”"
			},
			["Exit 89"] = {
				Name = "Exit 89",
				AltArt = true,
				PremiumArt = 866,
				Id = 87867221207138,
				Bio = "\"Are you feeling guilty about something?\""
			}
		},
		Health = 1450,
		Power = 450,
		Rarity = "Legendary",
		AttackEffect = "Flare",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4, Yellow = 4 },
		Archetype = "Infurnished",
		Addant = "The Ergonomicon",
		Summonant = "Goodknight, Infurnished Bunker",
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: Put all Infurnished in your graveyard into your baseplate.\nTwice each turn, whenever an allied fighter dies: Summon an unranked Infurnished fighter from your baseplate unlocked.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "Infurnished", "GraveZone_Ally", "GenZone_Ally", true, false, 99 }
					} },
					Target = "Self"
				},
				OnAllyDeath = {
					Power = {
						{
							"MoveZone",
							{ "Infurnished_Fighter", "GenZone_Ally", "Field_Ally", true, false }
						},
						{ "Unlock", 9999, "SummonedCard" }
					},
					Target = "Self",
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "\"Kara, we've been expecting you. Please, take a seat.\""
	},
	["Kohltastrophe, Infurnished Chairman2"] = {
		Id = 7120741053,
		Name = "Kohltastrophe, Infurnished Chairman",
		Health = 650,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Flare",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1, Yellow = 1 },
		Archetype = "Infurnished",
		Summonant = "Goodknight, Infurnished Bunker",
		Effect = {
			Name = "WWW",
			Description = "During your end step, if there are 15 cards in your Baseplate: Obliterate it, except for two Colourless cards. Summon \"Goodknight\", a 2000/2000 fighter.",
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
					{ "Neutral", 2 }
				},
				{ "Summon", "Summonant" }
			},
			EffectRequirement = { "Board", "AllyGenZone", 15, 9999 },
			Target = "Ally"
		},
		Bio = "\"Kara, we've been expecting you. Please, take a seat.\""
	},
	["Goodknight, Infurnished Bunker"] = {
		Id = 6701893826,
		Name = "Goodknight, Infurnished Bunker",
		AltCards = {
			["Lord Westinghouse Token"] = {
				Id = 7971547603,
				Name = "Lord Westinghouse",
				AttackEffect = "Storm",
				Summonant = "Hellish Chairs",
				Effect = {
					Type = "OnAttackEnd",
					Power = {
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" },
						{ "Summon", "Summonant" },
						{
							"Unlock",
							30,
							"LowestHealth",
							nil,
							nil,
							nil,
							"EngulfBlazeSmall"
						}
					},
					Target = "Ally"
				},
				Bio = "This card is an alt-art of Goodknight, Infurnished Bunker."
			},
			["The Grand Destroyer"] = {
				Id = 10817893372,
				Name = "The Grand Destroyer",
				Summonant = "The Damages",
				AttackEffect = "TimeBomb",
				Rarity = "Token",
				Bio = "Interitus, Mors, Chaos. Parva sunt mihi comparari."
			},
			["Goodknight, Infurnished Bunker-PC"] = {
				Id = 11346316513,
				Name = "Goodknight",
				Rarity = "Token",
				Bio = "The only thing silly about <b>it</b> is its name."
			}
		},
		Health = 2000,
		Power = 2000,
		Rarity = "Legendary",
		AttackEffect = "VampBite",
		Color = "Neutral",
		Cost = { Green = 5 },
		Archetype = "Infurnished",
		Summonant = "Hellish Infurniture",
		Rank = 20,
		Effect = {
			Name = "WWW",
			Description = "After this card attacks: Summon 3 50/300 Hellish Infurnitures. Unlock all fighters with the lowest health.",
			Type = "OnAttackEnd",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{
					"Unlock",
					30,
					"LowestHealth",
					nil,
					nil,
					nil,
					"EngulfFireSmall"
				}
			},
			Target = "Ally"
		},
		Bio = "Umberhallow was doing us all a favor."
	},
	["The Ergonomicon"] = {
		Id = 72168803615821,
		Name = "The Ergonomicon",
		AltCards = {
			["The Chairs Return"] = {
				Id = 7971546776,
				Name = "The Chairs Return",
				AltArt = true,
				Addant = "Hellish Chairs",
				Effect = {
					Type = "OnSummon",
					Power = {
						{ "Add", "Addant" },
						{
							"AddGenZone",
							{ "Hellish Chairs", 5 }
						}
					},
					Target = "Ally"
				},
				Bio = "This card is an alt-art of The Ergonomicon"
			},
			["The Ergonomicon-PC"] = {
				Id = 11346260336,
				Name = "Infernal Contract",
				Bio = "The thought of working with those who enjoy unregulated bloodshed was rather distasteful. The possibility of Lord Umberhallow having his way with Arthur, however?"
			},
			["Unlicensed Demolition"] = {
				Id = 11966566417,
				Name = "Unlicensed Demolition",
				AltArt = true,
				Bio = "\"This place is now 'legally' being demolished! Get out now!\""
			},
			["D.E.M.O.N Academy Student Council Chamber"] = {
				Id = 14905813314,
				Name = "D.E.M.O.N Academy Student Council Chamber",
				AltArt = true,
				Bio = "The student council chamber for Dedicated Education Ministry of Nobles: where Kyle the president, Mono the vice president, Celestia the secretary and Agent Ice the treasurer work."
			},
			["Bible of Lord X"] = {
				Id = 15310035586,
				Name = "Bible of Lord X",
				AltArt = true,
				Bio = "\"Let's read this stupid book and see a blue hedgehog with hyper realistic blood under his eyes!!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 2, Green = 2, Yellow = 2 },
		Archetype = "Infurnished",
		Summonant = "Goodknight, Infurnished Bunker",
		Addant = "Hellish Infurniture",
		EffectVariable = 0,
		Effect = {
			Name = "WWW",
			Description = "Give yourself 3 Hellish Infurnitures.\nIf there's 10 Infurnished cards in your baseplate, destroy them and summon Goodknight, a 2000/2000 fighter.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{ "EVExactValueCheck", 0, "Self" }
					},
					Target = "Ally"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Infurnished", "GenZone_Ally", "GraveZone_Ally", true, false, 10 },
							"Self"
						},
						{ "Summon", "Summonant" }
					},
					EffectRequirement = { "Archetype", "AllyGenZone", 10, 9999, "Infurnished" },
					Target = "Ally"
				}
			}
		},
		Bio = "Behold, the dark secrets behind what makes your cushions so darn comfortable."
	},
	Distabler = {
		Id = 98158291343452,
		Name = "Distabler",
		Health = 100,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Archetype = "Infurnished",
		GenZoneSummonant = "Hellish Infurniture",
		EffectVariable = 0,
		Effect = {
			Name = "WWW",
			Description = "Once each turn, whenever you discard a card: Summon a Hellish Infurniture from your baseplate.",
			Ability = {
				OnAllyDiscard = {
					Power = { { "SummonGenZone", "GenZoneSummonant" } },
					Target = "Ally",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "\"Poor thing. Look at it, so broken and desolute.\"\n\"You could say that this table ain't -\"\n\"You finish that sentence, mate, your face ain't gonna be stable either!\"\n- Kara and Herrus"
	},
	["Emotionless Oddsmaker"] = {
		Id = 10184577016,
		Name = "Emotionless Oddsmaker",
		AltCards = {
			Lemonade_Glas = {
				Id = 112653169127494,
				AltArt = true,
				Name = "Lemonade_Glas",
				AttackEffect = "Scratch",
				Commissioner = { 597319418 },
				Bio = "The hateful create the hated of their own volition."
			},
			["Emotionless Oddsmaker-Sun"] = {
				Id = 10184572916,
				Name = "Emotionless Oddsmaker",
				AttackEffect = "Whirlpool",
				PackDisplayOverride = "Summer Salt",
				Bio = "Is she having fun?"
			},
			LittleFire200986 = {
				Id = 90024640293682,
				Name = "LittleFire200986",
				Effect = {
					Name = "Sneak Attack",
					Description = "When this card is cast: Give yourself Blue, Red, and Green Stud Crystals. (You may choose one to put into your baseplate.)",
					Type = "OnSummon",
					Power = {
						{ "Add", "Blue Crystal-200986" },
						{ "Add", "Red Crystal-200986" },
						{ "Add", "Green Crystal-200986" }
					},
					Target = "Ally"
				},
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 605,
				Bio = "\"pick your poison\""
			},
			Cheeseperson = {
				Id = 135613101074913,
				Name = "Cheeseperson",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "c h e e s e"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		StarterCard = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Give yourself Blue, Red, and Green Stud Crystals. (You may choose one to put into your baseplate.)",
			Type = "OnSummon",
			Power = {
				{ "Add", "Blue Crystal" },
				{ "Add", "Red Crystal" },
				{ "Add", "Green Crystal" }
			},
			Target = "Ally"
		},
		Bio = "They coldly bet on the outcome of each fight!"
	},
	["Insane Oddsmaker"] = {
		Id = 9300781840,
		Name = "Insane Oddsmaker",
		AltCards = {
			["Insane Oddsmaker-Alt"] = {
				Id = 9300784581,
				Name = "Insane Oddsmaker",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "\"Better to bet early then to pay late!\""
			},
			["Vaycay Maker"] = {
				Id = 11214448587,
				Name = "Vaycay Maker",
				AttackEffect = "Whirlpool",
				AltArt = true,
				Bio = "End of summer dating arc"
			},
			Slikcster = {
				Id = 9300785746,
				AltArt = true,
				Name = "Slikcster",
				AttackEffect = "Recyclables",
				Bio = "The man face is the most powerful face to exist, for it shows dominance and makes the opponent either fear or underestimate you."
			},
			["Insane Oddsmaker-Sun"] = {
				Id = 9197551526,
				Name = "Insane Oddsmaker",
				AttackEffect = "Whirlpool",
				PackDisplayOverride = "Summer Salt",
				Bio = "A nice change of pace."
			},
			["atA, lorexperT"] = {
				Id = 13913646061,
				Name = "atA, lorexperT",
				AttackEffect = "Arcane",
				AltArt = true,
				PremiumArt = 68,
				Bio = ".being born from the shattering of time, atA has always taken a big interest with the various tales of the pasT .his revel demonic nature does tend to distract his studies however, not that he minds having a good timE"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		StarterCard = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Give yourself Yellow, Red, and Green Stud Crystals. (You may choose one to put into your baseplate.)",
			Type = "OnSummon",
			Power = {
				{ "Add", "Yellow Crystal" },
				{ "Add", "Red Crystal" },
				{ "Add", "Green Crystal" }
			},
			Target = "Ally"
		},
		Bio = "They madly bet on the outcome of each fight!"
	},
	["Ailing Oddsmaker"] = {
		Id = 10184070899,
		Name = "Ailing Oddsmaker",
		AltCards = {
			Mewwny = {
				Id = 9300786991,
				Name = "Mewwny",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"Sorry Andrew I need to hop on Rogue Lineage with my friends.\""
			},
			["Ailing Oddsmaker-Sun"] = {
				Id = 85558019480457,
				Name = "Ailing Oddsmaker",
				AttackEffect = "Whirlpool",
				PackDisplayOverride = "Summer Salt",
				Bio = "A lazy shade dweller."
			},
			["Small Irritation"] = {
				Id = 134326344169998,
				Name = "Small Irritation",
				AttackEffect = "Firebrand",
				AltArt = true,
				PremiumArt = 669,
				Bio = "\"My reflection, you see every atom, of me. Do you like being me? I don't know it.\""
			},
			["How to Leave Town"] = {
				Name = "How to Leave Town",
				Commissioner = { "0ffice_Space" },
				Id = 93178154646175,
				AltArt = true,
				PremiumArt = 885,
				Bio = "I Want You to Know That I'm Awake"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		StarterCard = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Give yourself Yellow, Red, and Blue Stud Crystals. (You may choose one to put into your baseplate.)",
			Type = "OnSummon",
			Power = {
				{ "Add", "Yellow Crystal" },
				{ "Add", "Red Crystal" },
				{ "Add", "Blue Crystal" }
			},
			Target = "Ally"
		},
		Bio = "They drowsily bet on the outcome of each fight!"
	},
	["Pathetic Oddsmaker"] = {
		Id = 7559455291,
		Name = "Pathetic Oddsmaker",
		AltCards = {
			["Undead Friend"] = {
				Id = 9829936041,
				Name = "Undead Friend",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Archetypes don't die, they just lose support."
			},
			["Urban Anarchist Flufflefunz"] = {
				Id = 9300787800,
				AltArt = true,
				Name = "Urban Anarchist Flufflefunz",
				AttackEffect = "Gun",
				Bio = "He treats the city like his sandbox. When he comes back, you'll still be here."
			},
			["Pathetic Oddsmaker-Sun"] = {
				Id = 9197553099,
				Name = "Pathetic Oddsmaker",
				AttackEffect = "Whirlpool",
				PackDisplayOverride = "Summer Salt",
				Bio = "Seriously, why does she even spend her time betting? She could go pro!"
			},
			["Pathetic Oddsmaker-Banner"] = {
				Id = 12110908174,
				Name = "Pathetic Gurtrider",
				AttackEffect = "MagicYellow",
				Bio = "\"That'll do pig, That'll do.\""
			},
			Rayburny = {
				Id = 17346074040,
				Name = "Rayburny",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "Hello it's me Rayburny the Rayburn want a yellow stud, surely you want a yellow stud, why else owuld you cast me, Rayburny the Rayburn, did you want a blue stud, pfft, how lame, though if you want another stud ig you can pick the green one, the green one is chill. just don't pick the blue one okay. - Rayburny the Rayburn"
			},
			["The AAA Squad"] = {
				Id = 71067566562304,
				Name = "The AAA Squad",
				AttackEffect = "LinkedSword",
				AltArt = true,
				PremiumArt = 432,
				Bio = "READY OR NOT, MYR, HERE WE COME!! INSANITY WILL SING EVER LOUDER!1!!1! RAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		StarterCard = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Sneak Attack",
			Description = "When this card is cast: Give yourself Yellow, Blue, and Green Stud Crystals. (You may choose one to put into your baseplate.)",
			Type = "OnSummon",
			Power = {
				{ "Add", "Yellow Crystal" },
				{ "Add", "Blue Crystal" },
				{ "Add", "Green Crystal" }
			},
			Target = "Ally"
		},
		Bio = "They pitifully bet on the outcome of each fight!"
	},
	["Fundebted Fighter"] = {
		Id = 6786639130,
		Name = "Fundebted Fighter",
		AltCards = {
			["Fundebted Fighter-Sun"] = {
				Id = 9180240164,
				Name = "Fundebted Performer",
				AttackEffect = "Flare",
				Bio = "A human's idea of entertainment is magic shows and musical acts; A demon's idea of entertainment is fire and agony."
			},
			["The Tarnished"] = {
				Id = 9307661350,
				Name = "The Tarnished",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "L + Ratio + you have no maidens + touch grace + No Bloxbux. Oh, I'm sorry, is that harsh? Don't Care, Didn't Ask plus you're Tarnished."
			}
		},
		Health = 900,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter with total stats 1500 or more: This card gains 200 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 200, "Self" } },
			SizeClass = "Gigant",
			Target = "Aggressor"
		},
		Bio = "Soulless husks doomed to fight for freedom from Umberhallow."
	},
	["Pits Barricade"] = {
		Id = 9709439397,
		Name = "Archdemon Architect",
		AltCards = {
			["Epic Turtle Franklin"] = {
				Id = 8854899226,
				Name = "Epic Turtle Franklin",
				AttackEffect = "Bubbles",
				Bio = "Feed it berries and watch its epicness grow!"
			},
			["Pits Barricade-AN"] = {
				Id = 9345830551,
				Name = "Construction",
				Bio = "You know how the best defense is a good offence? I feel like we can never have enough defense."
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 1 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: A target fighter gains 50 health.",
			Type = "OnSummon",
			Power = { { "Heal", 50, "Single" } },
			Target = "Aggressor"
		},
		Bio = "Umberhallow revolutionized the demon world by introducing something far more terrifying than eternal damnation: 9-to-5 jobs."
	},
	["Tom's Beans"] = {
		Id = 12863135697,
		Name = "Tom's Beans",
		AltCards = {
			["Jelly Filled Donuts"] = {
				Id = 9137697959,
				AltArt = true,
				Name = "Jelly Filled Donuts",
				EffectAnimation = "EatOnigiri",
				Bio = "\"Mmm these Onigir- *gun clock noises* I mean, these donuts are great! Jelly filled are my favorite! Nothing beats a jelly filled donut!\""
			},
			["Tom's Beans-E"] = {
				Id = 16562313054,
				Name = "Qingming Prayer",
				AttackEffect = "Scratch",
				Bio = "Spring, a time to sweep your relatives graves while it persistently rains often for some reason. Bring an umbrella."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		EffectAnimation = "EatBeans",
		IsFood = true,
		Effect = {
			Name = "Ammo for Beans",
			Description = "A target fighter gains 500 health. Return it to its hand.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "Return", 3333 }
			},
			Target = "Single"
		},
		Bio = "\"Hey Smiff, I found beans!\" - \"Find any ammo, Tom?\" - \"No ammo at all, what about you, Smiff?\" - \"Oh, just one mag.\""
	},
	["Ice Cream Seller"] = {
		Id = 6786637594,
		Name = "Ice Cream Seller",
		AltCards = {
			["Ice Cream Seller-Hal"] = {
				Name = "Candy Seller",
				AttackEffect = "Scratch",
				Id = 7610989140,
				Bio = "\"Kids go crazy over candy, so Halloween Eve's a scary time for us candy sellers! ...wait, these aren't kids.\""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 6 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter, if you have the crowd's favour: It gains 500 health.",
			Type = "OnAllySummon",
			Power = { { "Heal", 500 } },
			Target = "Aggressor",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "I scream, you scream, we all scream for - Why is there a tentacle in this batch again?"
	},
	MyDadIsAGuest = {
		Id = 5059552779,
		Name = "MyDadIsAGuest",
		AltCards = {
			MyDadIsASanta = {
				Id = 8122071018,
				Name = "MyDadIsASanta",
				Bio = "My dad is santa and I’ll tell him to put you on the naughty list. :/"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Neutral = 4 },
		EffectVariable = true,
		CustomReminderCF = true,
		Effect = {
			Name = "Parental Guidance",
			Description = "When this card is cast: Select a card in your hand. Remove {G} from it, or {G}{G}{G}{G} if you have the Crowd's Favour.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "Crowd's Favour", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "All",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { {
						"IncreaseCost",
						{ -4, "Green", "Nil" },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to remove four Green studs from"
					}
				},
				OnEVCheckFail = {
					Power = { {
						"IncreaseCost",
						{ -1, "Green", "Nil" },
						"CustomZoneTarget"
					} },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						MinTargets = 0,
						MaxTargets = 1,
						SelectionDescription = "a card to remove a Green stud from"
					}
				}
			}
		},
		Bio = "Meow..."
	},
	Leitris = {
		Id = 6761990967,
		Name = "Leitris",
		AltCards = {
			["Leitris-Sun"] = {
				Id = 9180237889,
				Name = "Wilson the Volleyball",
				AttackEffect = "Storm",
				Bio = "Never let him go."
			}
		},
		Health = 100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "No-Zone",
			Description = "When this card is cast: All fighters with the highest power lose 400 power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "HighestPower",
			Increase = 400
		},
		Bio = "It's cold in here!"
	},
	Murtic = {
		Id = 6761991857,
		Name = "Murtic",
		AltCards = {
			["The Soulsewer"] = {
				Id = 130289362760886,
				Name = "The Soulsewer",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 553,
				Bio = "The Self-Proclaimed empress of suffering; the worlds first and only Soulsewer."
			}
		},
		Health = 1400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Neutral = 2, Green = 4 },
		Effect = {
			Name = "Endless Spooks",
			Description = "Whenever this card attacks: It gains 300 Health.",
			Type = "OnAttack",
			Power = { { "Heal", 300 } },
			Target = "Self"
		},
		Bio = "He just loves lemons, and unicorns..."
	},
	TypicalType = {
		Id = 17791141964,
		Name = "TypicalType",
		AltCards = {
			["Lemonade and Wildy"] = {
				Id = 12326056116,
				Name = "Lemonade and Wildy",
				AttackEffect = "Jab",
				Commissioner = { 597319418 },
				AltArt = true,
				Bio = "Good friends since day 1."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
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
	["Janitor of the Pits"] = {
		Id = 8156963619,
		Name = "Janitor of the Pits",
		AltCards = {
			["Janitor of the Pits-E"] = {
				Id = 8789399421,
				Name = "Dr. Deville D'Egg",
				AttackEffect = "Tempest",
				Bio = "Man what a cool design for an antagonist, I sure hope we get to fight him by th-Nope, nevermind."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		Effect = {
			Name = "WWW",
			Description = "Whenever your opponent casts a fighter, if there's 4 or more enemy fighters: Deal 200 damage to all enemy fighters and they lose 200 power.",
			Type = "OnEnemySummon",
			Power = {
				{ "Damage", 200 },
				{ "Weaken", 200 }
			},
			Target = "Opponent",
			EffectRequirement = { "Board", "Opponent", 4, 9999 }
		},
		Bio = "The Prosperity demons were long since subjugated by Hallow's forces. A proud group of druids long since reduced to cleaning up refuse."
	},
	Brymmy = {
		Id = 6786861305,
		Name = "Brymmy",
		AltCards = {
			["Brymmy-AN"] = {
				Id = 9352974058,
				Name = "Luchador",
				AttackEffect = "Jab",
				Bio = "I bet he could suplex a dragon."
			},
			["DJ, Blissfully Ignorant"] = {
				Id = 101592594800694,
				Name = "DJ, Blissfully Ignorant",
				AttackEffect = "Flare",
				Effect = {
					Name = "Render",
					Description = "During your end step: Attach a gear to this card, then it generates for each gear on it.",
					Type = "OnEnd",
					Power = {
						{ "EquipGear", "Exertion-MP", "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "EquippedGearCount", "Nil" },
							"Self"
						},
						{ "Generate", "Variable" }
					},
					Target = "Self"
				},
				AltArt = true,
				PremiumArt = 548,
				Bio = "Bro DJ this fire script is causing lag and killing EVERYONE!<br/>:3c"
			}
		},
		Health = 1500,
		Power = 50,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Render",
			Description = "During your end step: Attach a gear to this card, then it generates for each gear on it.",
			Type = "OnEnd",
			Power = {
				{ "EquipGear", "Exertion", "Self" },
				{
					"AlterEV",
					{ "Set", "Target", "EquippedGearCount", "Nil" },
					"Self"
				},
				{ "Generate", "Variable" }
			},
			Target = "Self"
		},
		Bio = "Brymm2Blaze, the mighty warrior who must escape poor naming by relentless anime fangirls!"
	},
	Fluzard = {
		Id = 7275000827,
		Name = "Fluzard",
		AltCards = {
			["Fluzard-E"] = {
				Name = "Alrune",
				AttackEffect = "Maelstrom",
				Id = 8799535708,
				Bio = "And now, for some Egg of Newt."
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 4 },
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: All allied fighters with 1500 or more total stats gain 200 power.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 200, "CustomTarget" } },
					Target = "Self",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "SizeClass",
						Modifier = "Gigant"
					}
				}
			}
		},
		Bio = "The exotic ithian highlands has given Hallow the most interesting beasts for the pit's spectacles. "
	},
	["Fundebted Coach"] = {
		Id = 6790529440,
		Name = "Fundebted Coach",
		AltCards = {
			["Fundebted Coach-Hal"] = {
				Name = "Swinburne",
				AttackEffect = "DoomStorm",
				Id = 7610985894,
				Bio = "The last secret is yours alone. Take it."
			}
		},
		Health = 100,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 3 },
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: Exchange its power with a target fighter.",
			Type = "OnSummon",
			Power = { { "ExchangePower", 30 } },
			Target = "Single"
		},
		Bio = "\"Hi! I'm Joshriel, your very own Fun™️ Coach! Here at the Pits™️ we care deeply about the mental wellbeing of ALL our Funployees™️. Here, have a lollipop! Anyways about your next match, how good is your death rattle?\""
	},
	["Gork, the Caveman"] = {
		Id = 133938635681243,
		Name = "Gork, the Caveman",
		AltCards = {
			["Gork, the Caveman-Sun"] = {
				Id = 9150933053,
				AttackEffect = "Jab",
				Bio = "Gork not alone. Gork and Wilson friends. Ooga chaka."
			},
			Gork = {
				Id = 16446074481,
				Name = "Gork",
				AltArt = true,
				Bio = "I'm hooked on a feeling."
			},
			["Gork, the Caveman-E"] = {
				Id = 16562311190,
				Name = "Buck, the Big Bunny",
				AttackEffect = "Scratch",
				Bio = "Buck happy. Buck look at Butterfly. Buck enjoy Butterfly."
			}
		},
		Health = 1100,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "OOGA OOGA",
			Description = "Whenever this card destroys another: All players gain {W}{W}.",
			Type = "OnDestroy",
			Power = {
				{ "Neutral", 2 },
				{ "Neutral", 2, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Gork mad. Gork go hit you with rock. Ooga chaka."
	},
	Chaoszeroomega = {
		Id = 6973347653,
		Name = "Chaoszeroomega",
		AltCards = {
			["Chaoszeroomega-C"] = {
				Name = "Train Conductor Chaoszeroomega",
				Id = 8224308287,
				AttackEffect = "Jab",
				Bio = "THE TRAIN IS LATE",
				AddGenZoneant = "Chaoszeroomega-C"
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 5, Green = 2 },
		AddGenZoneant = "Chaoszeroomega",
		Effect = {
			Name = "Purlot Trap.",
			Description = "Once each turn, whenever an effect gives you card: Put a copy of this card into your baseplate.",
			Type = "OnAllyPut",
			Power = { {
				"AddGenZone",
				{ "AddGenZoneant", 1 }
			} },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Drager's right hand man, he fixes every one of his tpyoes without faiiure."
	},
	Icepielover23 = {
		Id = 125035023972658,
		Name = "Icepielover23",
		AltCards = {
			["Icepielover23-V"] = {
				Id = 16206876987,
				Name = "Daisy Bell",
				AttackEffect = "Punch",
				Bio = "Daisy, Daisy, <br/> Give me your answer, do! <br/> I'm half crazy, <br/> All for the love of you!"
			}
		},
		Health = 150,
		Power = 1500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		AttackRequirement = { "Board", "AllyGenZone", 8, 9999 },
		Effect = {
			Name = "Amp",
			Description = "This card can't attack unless there's 8 or more cards in your baseplate.\nWhen this card is cast: Put a Green Stud into your baseplate.",
			Type = "OnSummon",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 1 }
			} },
			Target = "Ally"
		},
		Bio = "Give them pie, they'll give you energy."
	},
	Myrmiredon = {
		Id = 6761996922,
		Name = "Myrmiredon",
		AltCards = {
			["Myrmiredon-Sun"] = {
				Name = "Obnoxious Seagulls",
				AttackEffect = "Slash",
				Id = 9150948646,
				Bio = "Mine! Mine! Mine!",
				Effect = {
					Power = {
						{ "DeckAdd", "Myrmiredon-Sun" },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GenZone_Ally", false, false },
							"Self"
						}
					}
				}
			},
			["Myrmire-DIO!"] = {
				Name = "Myrmire-DIO!",
				AttackEffect = "Jab",
				Id = 9245595147,
				NoFoilWorth = true,
				Bio = "\"I was forced to add this to the game (twice) against my will. I am deeply, deeply sorry.\" -Flatflyer",
				Effect = {
					Power = {
						{ "DeckAdd", "Myrmire-DIO!" },
						{
							"MoveZone",
							{ "BottomCard", "Deck_Ally", "GenZone_Ally", false, false },
							"Self"
						}
					}
				}
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Green",
		Cost = { Green = 5 },
		Effect = {
			Name = "Dreadsteed",
			Description = "When this card is cast: Shuffle a copy of this card into your deck, then put the bottom card of your deck into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "DeckAdd", "Myrmiredon" },
				{
					"MoveZone",
					{ "BottomCard", "Deck_Ally", "GenZone_Ally", false, false },
					"Self"
				}
			},
			Target = "Ally"
		},
		Bio = "\"Never let something as meaningless as a complete dearth of artistry and talent get in the way of your dreams.\""
	},
	FatalWing = {
		Id = 7864565629,
		Name = "FatalWing",
		AltCards = {
			["FatalWing-Sun"] = {
				Id = 9208862341,
				AttackEffect = "Gravity",
				Bio = "Okay, now beat the game without getting hit once. Twice in a row."
			}
		},
		Health = 1100,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Name = "Revival",
			Description = "Whenever you cast a fighter with total stats 1500 or more: Destroy the oldest card in your hand, then give yourself 2 Green cards.",
			Type = "OnAllySummon",
			Power = {
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" }
			},
			SizeClass = "Gigant",
			Target = "Ally"
		},
		Bio = "As fatal as a wing."
	},
	MiloCortez = {
		Id = 10288756322,
		Name = "MiloCortez",
		AltCards = {
			["MiloCortez-Val"] = {
				Name = "MiloJackson",
				AttackEffect = "Microphone",
				Id = 10288758131,
				Bio = "Hee hee!"
			}
		},
		Health = 1000,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "WOAH, ALIENS?",
			Description = "When this card is cast: Your opponent gains 6{W}.",
			Type = "OnSummon",
			Power = "Neutral",
			Target = "Opponent",
			Increase = 6
		},
		Bio = "The UFO's did nothing wrong."
	},
	KingShadowCrow = {
		Id = 10310567928,
		Name = "KingShadowCrow",
		AltCards = {
			KingShadowCrowV2 = {
				Id = 10288721472,
				AttackEffect = "Arcane",
				CopyBodge = "KingShadowCrowV2",
				AltArt = true,
				Bio = "wE arE HAVing dIFfiCULTy OPPerATINg aSINgle pEN . .."
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 1, Green = 6 },
		Effect = {
			Name = "terror",
			Description = "When this card is cast: Return a target enemy fighter to its hand.",
			Type = "OnSummon",
			Power = { { "Return", 90 } },
			Target = "SingleEnemy",
			EffectRequirement = { "Board", "Opponent", 1 }
		},
		Bio = "I just like to be fluffy."
	},
	ChaseThePsycho = {
		Id = 10288672087,
		Name = "ChaseThePsycho",
		AltCards = {
			["ChaseThePsycho-Sun"] = {
				Id = 9173944549,
				AttackEffect = "MagicGreen",
				Name = "Bloxey Plant, Your Best Friend",
				Bio = "* Hey, it's me, Bloxey! Bloxey the Plant!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 6, Green = 6 },
		Effect = {
			Name = "Breakfast in Bread",
			Description = "When this card is cast: All allied fighters gain 600 health.",
			Type = "OnSummon",
			Power = { { "Heal", 600, "Ally" } },
			Target = "Ally"
		},
		Bio = "Life's just one big chase, but sometimes, it helps to stop and smell the flowers."
	},
	Fearmiredon = {
		Id = 9926944848,
		Name = "Zeekerss",
		AltCards = {
			["Zeekerss-Hal"] = {
				Name = "Father Sun",
				AttackEffect = "Maelstrom",
				Id = 9926942908,
				Bio = "This card is an alt-art of Zeekerss."
			}
		},
		Health = 900,
		Power = 900,
		Rarity = "Epic",
		AttackEffect = "Tempest",
		Color = "Green",
		Cost = { Neutral = 2, Green = 10 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Set the power of a target fighter to -200.",
			Type = "OnSummon",
			Power = { { "SetPower", -200 } },
			Target = "Single"
		},
		Bio = "You will never escape this neverending game of hide and seek..."
	},
	["Yggdrasil Faerie"] = {
		Id = 10288473354,
		Name = "Yggdrasil Faerie",
		AltCards = {
			["Ravcade-Restoration Fairy"] = {
				Id = 8072452791,
				AttackEffect = "Tempest",
				Name = "Restoration Fairy",
				CopyBodge = "Ravcade-Restoration Fairy",
				Bio = "And also willing to give emotional support!"
			}
		},
		Health = 2000,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 6, Green = 3 },
		Effect = {
			Name = "It's not easy being green.",
			Description = "When this card is cast: Give yourself 2 Green cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "MonoOnlyorGreenCost Green" },
				{ "RandomAdd", "MonoOnlyorGreenCost Green" }
			},
			Target = "Ally"
		},
		Bio = "Regardless if you call it Fairy, faery, or faerie, it’s still going to kick your butt."
	},
	["Thrilled Spectators"] = {
		Id = 7141484058,
		Name = "Thrilled Spectators",
		AltCards = {
			["Thrilled Spectators-E"] = {
				Id = 9050074243,
				AttackEffect = "Scratch",
				Name = "Critter Totem",
				Bio = "A stack of bunnys sounds pretty funny."
			}
		},
		Health = 100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "WWW",
			Description = "During your end step, if there's 3 or more allied fighters with total stats 500 or less: All allied fighters gain 100 Power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 100 } },
			Target = "Ally",
			EffectRequirement = { "SizeClass", "Ally", 3, 9999, "Picant" }
		},
		Bio = "GO DUCK GO GO! GO DUCK GO GO!"
	},
	Gurt = {
		Id = 8938585647,
		Name = "Gurt",
		AltCards = {
			["Gurt-C"] = {
				Name = "OrnaGurt",
				AttackEffect = "Ice",
				Id = 8938587597,
				Bio = "His luminescence knows no bounds."
			},
			Tacoessay = {
				Name = "Tacoessay ",
				AttackEffect = "Jab",
				Id = 9058615148,
				AltArt = true,
				Bio = "rip gurt rest in pudding bozo tacoessay better"
			}
		},
		Health = 150,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the Crowd's Favour: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "His benevolence knows no bounds."
	},
	LilNasX = {
		Id = 6329993784,
		Name = "Lil Nas X",
		AltCards = {
			["LilNasX-C"] = {
				Id = 8100780907,
				Summonant = "Fanboy-C",
				Bio = "He was an interesting choice for a premium children's website, huh?"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Microphone",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 5 },
		Summonant = "Fanboy",
		AlternateCost = { IgnoreColor = "Yellow" },
		AlternateCostRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "If you have the Crowd's Favour, cast this card ignoring its {Y} cost.\nWhen this card is cast: Summon 2 300/300 Fanboys that're inert in all zones.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			EffectInert = true,
			Target = "Ally"
		},
		Bio = "A concert that will go down in Roblox history."
	},
	Fanboy = {
		Id = 6329994139,
		Name = "Fanboy",
		AltCards = {
			["Fanboy-C"] = {
				Id = 8100781492,
				Name = "Elfboy",
				AttackEffect = "Jab",
				Bio = "OMGGGGGG HE LOOKS SO GOOD AS SANTA"
			},
			["Fluffle & Trix- See, THIS Is EXACTLY What I'm Talking About..."] = {
				Id = 10821122655,
				Name = "Fluffle & Trix- See, THIS Is EXACTLY What I'm Talking About...",
				AttackEffect = "Scratch",
				Bio = "SPOILER: Icarus dies."
			},
			["Lesser Grunts"] = {
				Id = 106131517750448,
				Name = "Little Siblings",
				AttackEffect = "Jab",
				Bio = "we r going 2 beat u to death :3 (violently)"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 5 },
		Effect = {
			Name = "WWW",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Look at his face!"
	},
	["Toy Remote"] = {
		Id = 90721017437498,
		Name = "Toy Remote",
		AltCards = {
			["Toy Remote-C"] = {
				Name = "Krampus Wants To Play",
				Id = 88807121150709,
				Bio = "Krampus takes a lot of inspiration from Squid Game these days."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectAnimation = "NoobNoise",
		EffectVariable = 0,
		Effect = {
			Name = "Build Up",
			Description = "Lock a target allied fighter for 2 turns. It gains 100 Power for each lock it has, but can't gain more than 500 Power this way.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 2 },
				{
					"AlterEV",
					{ "Set", "Target", "Locks", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 100, "Nil" },
					"Self"
				},
				{
					"AlterEV",
					{ "Cap", "Math", 500, "Nil" },
					"Self"
				},
				{ "Strengthen", "Variable" }
			},
			Target = "SingleAlly"
		},
		Bio = "Can't wait? GO AHEAD! Unless you're taking turns with your annoying siblings."
	},
	["Toy Truck"] = {
		Id = 6762000670,
		Name = "Toy Truck",
		AltCards = {
			["Toy Truck-C"] = {
				Name = "Plushie Elf",
				AttackEffect = "Blizzard",
				Id = 8154254277,
				Bio = "Mummy...why did Santa bring me something so scary?",
				Effect = {
					Description = "Whenever you cast a Toy: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and recur an allied Toy card.",
					Ability = {
						OnAllySummon = {
							Power = {
								{ "Lock", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "Locks", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 4 }
							},
							Target = "Self",
							Archetype = "Toy"
						},
						OnAllyCast = {
							Power = {
								{ "Lock", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "Locks", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 4 }
							},
							Target = "Self",
							Archetype = "Toy"
						},
						OnEVCheckPass = {
							Power = {
								{
									"MoveZone",
									{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false }
								},
								{
									"Unlock",
									99999,
									"Self",
									nil,
									nil,
									nil,
									"MidBlizzardSelf"
								}
							},
							Target = "Self"
						}
					}
				}
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Flare",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a Toy: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and recur an allied Toy card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnAllyCast = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnEVCheckPass = {
					Power = {
						{
							"MoveZone",
							{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false }
						},
						{
							"Unlock",
							99999,
							"Self",
							nil,
							nil,
							nil,
							"MonsterTruck"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Vroom Vroom!"
	},
	["Western Bandit"] = {
		Id = 3164509177,
		Name = "Western Bandit",
		AltCards = {
			["Western Bandit-E"] = {
				Id = 8650615499,
				Name = "Egg Bandit",
				CopyBodge = "Western Bandit-E",
				Bio = "He ALWAYS ruins Easter for the cowboys."
			},
			["Western Bandit-Banner"] = {
				Id = 12110724485,
				Name = "Western Bandit",
				Bio = "\"Mosey on back to the ranch, Cowboy. This is MY town.\""
			},
			Luminarus = {
				Id = 5832405808,
				Name = "Luminarus",
				AttackEffect = "Flare",
				AltArt = true,
				Bio = "DON’T CALL ME A NOOB!"
			}
		},
		Health = 200,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Revolver",
		EffectAnimation = "SmallMagicBlueEffect",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Capture",
			Description = "When this card is cast: A target fighter loses 100 power.",
			Type = "OnSummon",
			Power = { { "Weaken", 100 } },
			Target = "Single"
		},
		Bio = "Bands with camels."
	},
	zachattack83 = {
		Id = 10279381906,
		Name = "zachattack83",
		AltCards = {
			khoaa2006 = {
				Name = "khoaa2006",
				AttackEffect = "Rifle",
				AltArt = true,
				Id = 10279386156,
				Bio = "I'll get my squad home, no man left behind."
			},
			Qecrk = {
				Name = "Qecrk",
				AttackEffect = "Jab",
				AltArt = true,
				Id = 10279387435,
				Bio = "He’s been getting worldwide offers from the top Universities."
			}
		},
		Health = 700,
		Power = 1400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 3 },
		Effect = {
			Name = "Zach + Attack = Pun",
			Description = "Whenever this card attacks: You gain {R}{Y}.",
			Ability = {
				OnAttack = {
					Power = {
						{ "Red", 1 },
						{ "Yellow", 1 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Look out! It's Zach! He attacks!"
	},
	["Hallow's Boon"] = {
		Id = 10279291356,
		Name = "Hallow's Boon",
		AltCards = {
			CCLion = {
				Name = "Cotton Candy Lion",
				AttackEffect = "Scratch",
				AltArt = true,
				Id = 10279293161,
				Bio = "These cotton candy lions were hunted to extinction by Hallow's servants. Saturday was a cruel day."
			},
			["Hallow's Boon-Hal"] = {
				Name = "Protag & Pumpkin Kid",
				AttackEffect = "Slash",
				Id = 10279295810,
				Bio = "This card is an alt-art of Hallow's Boon."
			},
			["Hallow's Boon-ET"] = {
				Name = "Rivinne Fashionista",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				Id = 16446071930,
				Bio = "Aren't they just fabulous? <br/> Don't answer that, they've already got a big ego as-is."
			}
		},
		Health = 200,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Transformant = "Boon Token",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: All allied fighters gain 100 Health and Power.\nWhen this card dies: Allied fighters lose 100 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Strengthen", 100 },
						{ "Heal", 100 }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Weaken", 100 },
						{ "Damage", 100 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Hallow regrets having anything to do with him."
	},
	["Boon Token"] = {
		Id = 5115564898,
		Name = "Hallow's Boon",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: Allied fighters lose 100 Health and Power.",
			Type = "OnDeath",
			Power = {
				{ "Weaken", 100 },
				{ "PierceDamage", 100 }
			},
			Target = "Ally"
		},
		Bio = "Hallow regrets having anything to do with him."
	},
	["Pancake Break"] = {
		Id = 10279417539,
		Name = "Pancake Break",
		AltCards = {
			["Pancake Break-Val"] = {
				Name = "Dance Off",
				Id = 10279401162,
				EffectAnimation = "DancePotionAlly",
				Bio = "This dance potion got me feelin' groovy..."
			},
			["Raining Tacos"] = {
				Name = "Raining Tacos",
				Id = 10279403038,
				EffectAnimation = "EatTacosAlly",
				Bio = "♫ From out of the sky! ♫",
				IsFood = true
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		EffectAnimation = "EatPancakesAlly",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Collected Company Envy",
			Description = "All allied fighters gain 200 health. Return them to their hand.\nYou gain {W}{W}.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200 },
				{ "Return", 30 },
				{ "Neutral", 2 }
			},
			Target = "Ally"
		},
		Bio = "You have two turns to beat me, Tea! Or else I'll get to a petrol station, fuel up on pancakes, and rush you down with my Egg-Eyes Batter Dragon!"
	},
	KonekoKitten = {
		Id = 15252289308,
		Name = "Pits Photographer",
		AltCards = {
			["KonekoKitten-E"] = {
				Id = 15418777521,
				Name = "Egg Hunt Photographer",
				Bio = "ZZZ... THE ONLY SUBSTANTIAL THING ABOUT THIS EGG HUNT... ZZZ... IS THE DUCK-MAN'S... ZZZ... TRICEPS... ZZZ..."
			}
		},
		Health = 300,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		CustomReminder = {
			["Camera Shy"] = "Obliterate a terrified fighter if it's in play during its end step."
		},
		Effect = {
			Name = "WWW",
			Description = "Whenever a fighter with total stats 500 or less is cast: Unlock that fighter and attach terrified to it. Summon a copy of that fighter.",
			Type = "OnAnySummon",
			Power = {
				{ "Unlock", 999 },
				{ "EquipGear", "Terrified Mod" },
				{ "SummonCopy", "Aggressor" }
			},
			SizeClass = "Picant",
			Target = "Aggressor"
		},
		Bio = "SHOT OF HER ABS! SHOT OF HER BICEPS! THE DOMINION FANBASE IS GONNA LOVE THIS CLIP FOR SURE!!"
	},
	["Tooth Decay"] = {
		Id = 7559463259,
		Name = "RobloTim",
		AltCards = {
			["RobloTim-E"] = {
				Id = 8725175862,
				Name = "HawaiianSnowman",
				AttackEffect = "Slash",
				Bio = "Which came first, the dragon or the egg?"
			},
			["RobloTim-Sun"] = {
				Id = 17540223184,
				Name = "Seashell Saleslady",
				AttackEffect = "Slash",
				Bio = "Due to the laws of supply and demand; no one wants to buy a shell cause there's loads on the sand."
			},
			["RobloTim-AWIH"] = {
				Id = 17600768289,
				Name = "modern imp",
				AttackEffect = "Inferno",
				Bio = "I WILL EAT THIS JAR FULL OF GEMSTONES IN HALLOW ST. TOMORROW",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			madmariotheplumber = {
				Id = 105704142682333,
				Name = "madmariotheplumber",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 475,
				Bio = "\"There are constants in life you cannot change, but you can manipulate some variables to achieve your solution.\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Twice each turn, whenever you cast a fighter with total stats 500 or less: Give yourself a Yellow card.",
			Type = "OnAllySummon",
			Power = { { "RandomAdd", "Yellow" } },
			SizeClass = "Picant",
			Target = "Ally",
			TurnTriggerLimit = 2
		},
		Bio = "Former ROBLOX admin most notable for creating the group feature. He also owns the first ever ROBLOX group, RobloHunks!"
	},
	RandomRobloxTV = {
		Id = 5031873208,
		Name = "RandomRobloxTV",
		Health = 650,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "I will not bow down to any sponsor."
	},
	["Pits of the Umberlords"] = {
		Id = 6991409098,
		Name = "Pits of the Umberlords",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Terrain = true,
		Terrariant = "Pits Terrain",
		Cost = { Neutral = 3, Yellow = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "At the start of each player's turn: All fighters generate.",
			Type = "OnStart",
			Power = { { "Generate", 1 } },
			Target = "All"
		},
		Bio = "A carnival of delight and revel, for all those looking for a great time. Watch the world's strongest and most mysterious beings battle eachother! Brought to you by Lord Umberhallow!"
	},
	Febrezer = {
		Id = 10184682705,
		Name = "Febrezer",
		AltCards = {
			["Febrezer-Sun"] = {
				Name = "Graffiti Artist",
				AttackEffect = "MagicRed",
				Id = 10184650291,
				Addant = "Ban-in-a-Can-Sun",
				Bio = "Alternative art. "
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Blue = 1, Neutral = 2, Green = 1 },
		Addant = "Febreze: Anti Noob Spray",
		CustomReminder = {
			["Ban-in-a-Can"] = "A free Colourless action. Cast only if there is 8000 or more total Power amongst all allied fighters. Put all enemy fighters into their baseplate."
		},
		Effect = {
			Name = "Foecal Incontinence",
			Description = "When this card is cast: Give yourself a Ban-in-a-Can.",
			Type = "OnSummon",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "A living golem made out of pure copyrighted scent. The freshness will cause the weak to cough up their lungs."
	},
	["Febreze: Anti Noob Spray"] = {
		Id = 5002289579,
		Name = "Ban-in-a-Can",
		AltCards = {
			["Ban-in-a-Can-Sun"] = { Name = "Spraypaint", Id = 9166708688, Bio = "Rattle it good!" }
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Requirement = { "Power", "All", 8000 },
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Foecal Incontinence",
			Description = "Cast only if there is over 8000 total Power amongst all fighters.\nPut all enemy fighters into their Baseplate.",
			Type = "OnSummon",
			Power = { { "MoveGenZone", 30, "Opponent" } },
			Target = "Opponent"
		},
		Bio = "Might not be what you were expecting. Sorry, no refunds!"
	},
	["Toy Jet Fighter"] = {
		Id = 99863219821776,
		Name = "Toy Jet Fighter",
		AltCards = {
			["Toy Jet Fighter-C"] = {
				Name = "Plushie Lion",
				AttackEffect = "Bite",
				Id = 120654148822329,
				Bio = "The lion stole the child's eyes.",
				EffectAnimation = "Roar"
			},
			["Toy Jecht Fighter"] = {
				Id = 15804641827,
				Name = "Toy Jecht Fighter",
				AltArt = true,
				Bio = "Zoom! Pow! Bam!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "ModernRocket",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectAnimation = "MarkAlly",
		EffectVariable = 0,
		Effect = {
			Description = "Once each turn, whenever you cast an action: Lock this card and a target allied fighter for 1 turn. Then if this card has 5 or more locks, unlock it and all allied Toys gain 100 Health and Power.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Lock", 1, "Self" },
						{ "Lock", 1, "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				},
				OnEVCheckPass = {
					Power = {
						{
							"Unlock",
							99999,
							"Self",
							nil,
							nil,
							nil,
							"MarkSelf"
						},
						{ "Strengthen", 100, "AlliedArchetype" },
						{ "Heal", 100, "AlliedArchetype" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The wishes of the crowds enables even inanimate objects to topple giants if it's funny enough."
	},
	["Toy Plane"] = {
		Id = 82576130997422,
		Name = "Toy Plane",
		AltCards = {
			["Toy Plane-C"] = {
				Summonant = "Toy Plane-C",
				Id = 119015759180897,
				Name = "Plushie Reindeer",
				AttackEffect = "Bite",
				Bio = "deer sounds",
				Effect = {
					Description = "Whenever a fighter dies: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and search your deck for a Toy card.",
					Ability = {
						OnAnyDeath = {
							Power = {
								{ "Lock", 1, "Self" },
								{
									"AlterEV",
									{ "Set", "Target", "Locks", "Nil" },
									"Self"
								},
								{ "EVGreaterValueCheck", 4 }
							},
							Target = "Self"
						},
						OnEVCheckPass = {
							Power = {
								{
									"Unlock",
									99999,
									"Self",
									nil,
									nil,
									nil,
									"Roar"
								},
								{ "RandomTutorfor", "Toy" }
							},
							Target = "Ally"
						}
					}
				}
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Paintball",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		Summonant = "Toy Plane",
		EffectVariable = 0,
		Charge = true,
		Effect = {
			Description = "Whenever a fighter dies: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and search your deck for a Toy card.",
			Ability = {
				OnAnyDeath = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{
							"Unlock",
							99999,
							"Self",
							nil,
							nil,
							nil,
							"MarkSelf"
						},
						{ "RandomTutorfor", "Toy" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Nyeauwwww!"
	},
	["Toy Teeth"] = {
		Id = 6786868749,
		Name = "Toy Teeth",
		AltCards = {
			["Toy Teeth-C"] = {
				Name = "Plushie Nutcracker",
				Id = 8258523327,
				Bio = "It's clearly made out of wood. It's merely called a 'plushie' to be marketable."
			}
		},
		Health = 900,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Bite",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a Toy: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and you gain {W}{W}.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnAllyCast = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnEVCheckPass = {
					Power = {
						{
							"Neutral",
							2,
							"Ally",
							nil,
							nil,
							nil,
							"StudNeutral"
						},
						{ "Unlock", 99999, "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "WARNING: DO NOT ACTUALLY WEAR THESE AS TEETH"
	},
	["Toy Car"] = {
		Id = 6787645344,
		Name = "Toy Car",
		AltCards = {
			["Toy Car-C"] = {
				Name = "Plushie Polar Bear",
				AttackEffect = "Bite",
				EffectAnimation = "Roar",
				Id = 8256534471,
				Bio = "It guards the igloo against candy thieves."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		EffectAnimation = "ToyCarNoise",
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a Toy: Lock this card for 1 turn. Then if it has 5 or more locks, unlock it and a target fighter.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnAllyCast = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnEVCheckPass = {
					Power = {
						{ "Unlock", 99999, "Self" },
						{ "Unlock", 99999, "Single" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "VROOOM!"
	},
	["Call of the Teddy Bear"] = {
		Id = 108568270997317,
		Name = "Call of the Teddy Bear",
		AltCards = {
			["Call of the Teddy Bear-C"] = {
				Name = "Krampus Playtime",
				Id = 104184526911679,
				Bio = "His sick games leave your legs horribly kramped."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Archetype = "Toy",
		Fading = true,
		Color = "Yellow",
		Cost = { Yellow = 5 },
		EffectVariable = "Toy",
		CustomReminder = {
			["Playtime's Over"] = "A fleeting card is destroyed if it's not cast."
		},
		Effect = {
			Name = "Build Up",
			Description = "Recur 4 allied Toy cards, except they're fleeting.",
			Type = "OnSummon",
			Power = {
				{
					"MoveZone",
					{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false },
					nil,
					nil,
					nil,
					nil,
					"Bloxpin"
				},
				{
					"MoveZone",
					{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false }
				},
				{
					"MoveZone",
					{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false }
				},
				{
					"MoveZone",
					{ "Toy", "GraveZone_Ally", "Hand_Ally", true, false }
				}
			},
			Target = "Self",
			MetaData = { Fleeting = true }
		},
		Bio = "Kara's childhood companion was a friend no more."
	},
	["Toy Train"] = {
		Id = 6787105347,
		Name = "Toy Train",
		AltCards = {
			["Wooden Toy Train"] = {
				Id = 8256323483,
				Name = "Plushie Hula Dog",
				AttackEffect = "Bite",
				EffectAnimation = "Barking",
				Bio = "Uhh...isn't this a little out of season?"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		EffectAnimation = "TrainWhistle",
		EffectVariable = 2,
		Effect = {
			Name = "Build Up",
			Description = "Twice each turn, whenever you cast a Toy fighter: First, Lock a target allied fighter for 2 turns. That fighter gains 100 Power.",
			Ability = {
				OnAllySummonSupercede = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
					Archetype = "Toy",
					NoBlip = true
				},
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 2, "Nil" }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Lock", 2 },
						{ "Strengthen", 100 },
						{
							"AlterEV",
							{ "Add", "Math", -1, "Nil" },
							"Self"
						}
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "Chugga chugga. The train is late."
	},
	HomingBeacon = {
		Id = 6762002483,
		Name = "HomingBeacon",
		AltCards = {
			["HomingBeacon-AN"] = {
				Id = 9462799725,
				Name = "Musically Talented Duck",
				AttackEffect = "Bubbles",
				Bio = "I mean how else does he play the piano?"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 6, Yellow = 6 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "Generic",
			Description = "When this card is cast, if you have the Crowd's Favour: Steal a target enemy fighter.",
			Type = "OnSummon",
			Power = { { "Steal" } },
			Target = "SingleEnemy",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "It's all fun and games until the beacon goes homing.. or the homing goes beacon?"
	},
	["Plushie Hula Dog"] = {
		Id = 6347936879,
		Name = "Mood Swing",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Requirement = { "Board", "All", 11 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Cast only if there are 11 or more fighters in play.\nUnlock all allied fighters. They gain 200 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 999 },
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			Target = "Ally"
		},
		Bio = "Yuki's mood changes with enough speed to pierce armour."
	},
	THANOID = {
		Id = 7610997097,
		Name = "THANOID",
		AltCards = {
			["One BLOX Man"] = {
				Id = 7612621897,
				Name = "One BLOX Man",
				Bio = "ONE BLOX MAN!! *anime opening music*"
			}
		},
		Health = 1300,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 6 },
		Effect = {
			Name = "Disaster",
			Description = "When this card is cast, if there's 4 or more enemy fighters: Destroy a target fighter.",
			Type = "OnSummon",
			Power = { { "Destroy" } },
			Target = "Single",
			EffectRequirement = { "Board", "Opponent", 4, 9999 }
		},
		Bio = "I'm sorry, little one."
	},
	["Toy Boss Dino"] = {
		Id = 14204147519,
		Name = "Toy Boss Dino",
		AltCards = {
			["Toy Boss Dino-C"] = {
				Name = "Plushie Santa",
				AttackEffect = "Blizzard",
				SummonAnimation = "IcyTeaSummon",
				SummonedAnimation = "IcyTeaSummon",
				Id = 8154253644,
				Bio = "He can't give you presents, but he can give you friendship."
			},
			["Toy Boss Dino-PC"] = {
				Name = "Toy Boss Kaiju",
				AttackEffect = "Flare",
				Id = 11393835737,
				Bio = "Destroyer of Block Cities."
			}
		},
		Health = 1500,
		Power = 1500,
		Rarity = "Epic",
		AttackEffect = "Bite",
		Archetype = "Toy",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		CounterBlock = true,
		SummonAnimation = "SummonTRex",
		EffectVariable = 0,
		Effect = {
			Description = "Whenever you cast a Toy: Lock this card for 1 turn. Then if it has 8 or more locks, unlock it and steal a target enemy fighter.",
			Ability = {
				OnAnyAllyCast = {
					Power = {
						{ "Lock", 1, "Self" },
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 7 }
					},
					Target = "Self",
					Archetype = "Toy"
				},
				OnEVCheckPass = {
					Power = {
						{ "Unlock", 99999, "Self" },
						{ "Steal" }
					},
					Target = "SingleEnemy"
				}
			}
		},
		Bio = "The mafia is the hiding place of the dinosaurs."
	},
	["Alpha Brick's Whimsy"] = {
		Id = 6402508011,
		Name = "Alpha Brick's Whimsy",
		AltCards = {
			["Alpha Brick's Whimsy-Sun"] = {
				Name = "Maelstrom Portal",
				Id = 9225591245,
				Bio = "Arieus brings forth the ocean's rage within this vortex."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Archetype = "Era",
		EffectAnimation = "Pandora",
		Effect = {
			Name = "WWW",
			Description = "Select a card in your opponent's hand. Shuffle it into their deck, then give them a card in another game in this server.\nAll players draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{ "SpecificDiscard", 1, "CustomZoneTarget" },
						{ "WhimsyFromOtherBattle", 1, "Opponent" },
						{ "Draw", 1, "All" }
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
		Bio = "Lord Umberhallow put Herrus into a contract rather than the sword like the rest of his kind. To see that contract activated for something so frivolous filled him with disgust."
	},
	["Lord Umberhallow"] = {
		Id = 14820267083,
		Name = "Lord Umberhallow",
		AltCards = {
			["Preston, Nature Preserver"] = {
				Name = "Preston, Nature Preserver",
				AttackEffect = "Jab",
				Id = 8042186086,
				AltArt = true,
				Summonant = "Land Eel",
				Bio = "Save the wildlife and go away from the wild life! But you probably don't have a wild life? Wildlife is your way to one!"
			},
			Luisgamercool23 = {
				Name = "u r in da presence of: Luisgamercool23!!!11!1!",
				AttackEffect = "LinkedSword",
				Id = 139410907839770,
				AltArt = true,
				Summonant = "Fragment of Staring Cat",
				Bio = "top 10 resons why i hat nobs"
			},
			["The Sounds"] = {
				Name = "The Sounds",
				Id = 95975007697394,
				AttackEffect = "Jab",
				PackDisplayOverride = "Art Box",
				AltArt = true,
				PremiumArt = 812,
				Bio = "A four-Avatar Division that are the main figureheads of a Group known as the Robloxian Archivist Company, whose primary purpose to recover Assets important to Robloxia's history from being forever lost to the World Of Games.",
				Summonant = "AoD Squad"
			}
		},
		Health = 1300,
		Power = 1300,
		Rarity = "Legendary",
		AttackEffect = "HollowScythe",
		Color = "Yellow",
		Summonant = "Siphoned Spirit",
		Cost = { Yellow = 13 },
		Effect = {
			Name = "WWW",
			Description = "When this card is cast: Summon 7 300/300 Siphoned Spirits no abilities. You gain {W}{W}{W}{W}.",
			Type = "OnSummon",
			Power = {
				{ "Neutral", 4, "Ally" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "\"Sorry Kara, cope harder. Absolute fundebted mentality. Take a shower. Gn, Kara. I'm staying awesome and you're staying broke.\""
	},
	["Siphoned Spirit"] = {
		Id = 6906764425,
		Name = "Siphoned Spirit",
		AltCards = {
			["Land Eel"] = {
				Name = "Land Eel",
				Id = 8042187046,
				Bio = "One of the last land eels to ever exist due to humanity's harsh treatment of animals."
			},
			["Fragment of Staring Cat"] = {
				Name = "Fragment of Staring Cat",
				Id = 102517440184609,
				Bio = "IS THIS WHAT YOU WANTED, BFDIFAN621? IVE NOT BEEN IN A ALT ART FOR 2. DIFFERENT. ALT ARTS, THIS ONE AND THE ELEVATOR RIDERS?! WHAT THE Reddit karma! IS WRONG WITH YOU?!"
			},
			["AoD Squad"] = {
				Name = "AoD Squad",
				Id = 72262496901791,
				AttackEffect = "Jab",
				Bio = "A small squad of highly trained Avatars belonging to the Administration Of Defense, the paramilitary Division of the Robloxian Archivist Company, this particular squad have been instated shortly after the Venomshank Incident."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 0, Yellow = 0 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "The Lord of the Pits realized too late that Kara held the Crowd's Favour. Time to cash in all those favors."
	},
	["Kara Sinister"] = {
		Id = 6906762902,
		Name = "Kara Sinister",
		AltCards = {
			["Kara Sinister-MD"] = {
				Id = 9105945081,
				AttackEffect = "FirePunch",
				Bio = "After taking down Umberhallow, Kara continued living low, spending her daily routine taking care of her new pet."
			},
			["Kara, Brutal Calamity, P.W"] = {
				Id = 9528794441,
				Name = "Kara, Brutal Calamity, P.W",
				AttackEffect = "Scratch",
				Bio = "Unnending crime, infinite justice."
			},
			Hexocus = {
				Id = 11126738037,
				Name = "Hexocus",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"I never lose! I win! I always win!\""
			},
			["Kara Sinister-C"] = {
				Name = "Kara Klaus",
				Id = 15407460983,
				AttackEffect = "FirePunch",
				Bio = "Don't use the phrase 'when Hell freezes over' when it's December, lest you become gundebted into becoming an elf costume wearer."
			}
		},
		Health = 50,
		Power = 1300,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1, Yellow = 1 },
		Archetype = "Sinister",
		ChargeRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the crowd's favour: Unlock it. Destroy a target enemy fighter.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 999, "Self" },
				{ "Destroy", 30, "SingleEnemy" }
			},
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "A lesser Revel demon, wronged by Umberhallow. Her lust for revenge brought her to the Pits with a single goal: Put Lord Umberhallow through the same pain he brought to her and her fundebted husband."
	},
	agodlypancake = {
		Id = 6854729562,
		Name = "agodlypancake",
		AltCards = {
			achristmaspancake = {
				Id = 8789665411,
				Name = "achristmaspancake",
				AltArt = true,
				Bio = "Oh snap, Santa Claus is coming to town!"
			},
			["agodlypancake-Alt"] = { Id = 11479665072, AltArt = true },
			["agodlypancake-E"] = {
				Id = 8707808668,
				Name = "agodlyegg",
				Bio = "\"mmm...Covers all 9000 taste buds, that yolk, that grease...thats a ten.\""
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		EffectAnimation = "EatPancakes",
		Effect = {
			Name = "Fattening",
			Description = "When this card is cast: A target fighter gains 400 Health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "Single",
			Increase = 400
		},
		Bio = "Oh snap! It's a pancake!"
	},
	["4.0 Robloxian"] = {
		Id = 7274995715,
		Name = "Bobbysayhi",
		AltCards = {
			["Bobbysayshi-C"] = {
				Id = 8146223845,
				AttackEffect = "Slash",
				Bio = "He sells macaroons to Santa at extortionate prices.",
				Summonant = "Bobbysayshi-C"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Rifle",
		Color = "Blue",
		Summonant = "4.0 Robloxian",
		Cost = { Blue = 2 },
		Effect = {
			Description = "When this card is cast, if you have no Blue cards in your baseplate: Summon a copy of it.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" },
			Target = "Ally"
		},
		Bio = "Possibly the most American ROBLOX game out there."
	},
	Nopants99 = {
		Id = 7274996857,
		Name = "Nopants99",
		AltCards = {
			["Nopants99-Banner"] = {
				Id = 9788331827,
				AttackEffect = "Whirlpool",
				Bio = "THE WALRUS IS COMING"
			}
		},
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
	caone = {
		Id = 7274998051,
		Name = "caone",
		AltCards = {
			["caone-Sun"] = {
				Id = 9197545374,
				AttackEffect = "Jab",
				Bio = "This is caone. He is currently enjoying summer in Robloxian Highschool."
			},
			["Legokid Ben"] = {
				Id = 8072493337,
				Name = "Legokid Ben",
				AttackEffect = "LinkedSword",
				Bio = "equip sword:"
			}
		},
		Health = 250,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Token = true,
		Effect = {
			Name = "Life fam",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Don't try to lowball him."
	},
	B0BBA = {
		Id = 11865481031,
		Name = "B0BBA",
		AltCards = {
			["B0BBA-C"] = {
				Id = 8146172725,
				Name = "Snow Bot 3000",
				AttackEffect = "Microphone",
				Bio = "WMEoDnn3NXY"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Bobba",
			Description = "When this card is cast, if you have no Blue cards in your Baseplate: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" },
			Target = "Ally"
		},
		Bio = "The ultimate builder."
	},
	bengbeng14 = {
		Id = 7275005444,
		Name = "bengbeng14",
		AltCards = {
			["bengbeng14-Masant"] = {
				Id = 6565106181,
				AttackEffect = "Revolver",
				AltArt = true,
				Bio = "SORE WA CHIGAU ZO!"
			},
			["bengbeng14-V"] = {
				Id = 16056328730,
				Name = "CardMaxxer",
				AttackEffect = "Punch",
				Bio = "Positive canthal tilt + Hunter eyes + Perfect facial harmony"
			},
			["Tim N' Jim"] = {
				Id = 17763437918,
				Name = "Tim N' Jim",
				AltArt = true,
				PremiumArt = 267,
				Bio = "\"The Golem Brothers.\""
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Blue",
		Cost = { Blue = 7 },
		Effect = {
			Name = "Shatter",
			Description = "Whenever you cast a fighter with total stats 1500 or more: Reset this card's stats.",
			Type = "OnAllySummon",
			Power = { { "Reset", 750 } },
			Target = "Self",
			SizeClass = "Gigant"
		},
		Bio = "I'm a derpy derp and I'm here to blow your mind with MEMES!"
	},
	Theawesomist19 = {
		Id = 7708010831,
		Name = "theawesomist19",
		AltCards = {
			["Theawesomist19-E"] = {
				Id = 8789402865,
				Name = "Billy Bonka",
				AttackEffect = "Slash",
				EffectAnimation = "EatROBAR",
				Bio = "Owner of Billy Bonka's Choclate factory, known for its delicious chocolate and shockingly high number of incidents involving children getting stuck in tubes."
			},
			["Member 1793"] = {
				Id = 17763438119,
				Name = "Member 1793",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 268,
				Bio = "Graduated in the field of using binoculars."
			},
			Crescent = {
				Id = 82432592718882,
				Name = "Crescent",
				PremiumArt = 359,
				AttackEffect = "LinkedSword",
				AltArt = true,
				Bio = "\"Have you ever thought about starting again? I have before. I'm still thinking about it.\" -Res"
			}
		},
		Health = 100,
		Power = 1400,
		Rarity = "Common",
		AttackEffect = "SMG",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "Bepis",
			Description = "Whenever you cast a fighter with total stats 1500 or more: A target fighter gains 50 power. Swap its stats.",
			Type = "OnAllySummon",
			Power = {
				{ "Strengthen", 50 },
				{ "Swap", 9999 }
			},
			SizeClass = "Gigant",
			Target = "Single"
		},
		Bio = "This is theawesomist19. He has over 300 four-letter usernames. And no life."
	},
	["Deep Sea Diver"] = {
		Id = 7275000320,
		Name = "Deep Sea Diver",
		AltCards = {
			["Deep Sea Diver-AWIH"] = {
				Id = 17600736397,
				Name = "Resonance Knight",
				AttackEffect = "MagicBlue",
				Bio = "With the right frequency, a simple strike can penetrate through hard steel.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			},
			["Deep Sea Diver-AN"] = {
				Id = 18199516721,
				AttackEffect = "Slash",
				Name = "Ofish Worker",
				Bio = "Just keep swimming."
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Blue = 5, Neutral = 1 },
		Effect = {
			Name = "Massive Stamaina",
			Description = "Whenever you cast a fighter with total stats 500 or less: Search a copy of this card.",
			Type = "OnAllySummon",
			Power = { { "Tutorfor", "Deep Sea Diver" } },
			Target = "Ally",
			SizeClass = "Picant"
		},
		Bio = "A champion of the underwater tournaments Lord Umberhallow likes to throw down."
	},
	madkey900 = {
		Id = 4806849686,
		Name = "Cearnou",
		AltCards = {
			["Cearnou-Hal"] = {
				Name = "Human Hunter Cearnou",
				AttackEffect = "Revolver",
				Id = 119340351783409,
				Bio = "If you need to ask why I do it, you'll never get it."
			},
			["Melancholic Flufflefunz"] = {
				Id = 110421396667789,
				Name = "Melancholic Flufflefunz",
				PremiumArt = 327,
				AltArt = true,
				Bio = "It's always the wrong thing when it's me who's saying it."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Thug Life",
			Description = "During your end step, if you have no Blue cards in your baseplate: Set your {B} to 5.",
			Type = "OnEnd",
			Power = { { "SetBlue", 5 } },
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" },
			Target = "Ally"
		},
		Bio = "He likes memes. That's basically all you need to know."
	},
	Ice = {
		Id = 3299977652,
		Name = "Ice",
		AltCards = {
			["Ice-C"] = {
				Id = 8253666227,
				Name = "Frozen Mammoth",
				AttackEffect = "Blizzard",
				Bio = "Sigma Grindset."
			}
		},
		Health = 2500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "IcePunch",
		SpecialEffectAnimation = "Freeze",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Icing",
			Description = "When this card is cast: Lock it for 2 turns.",
			Type = "OnSummon",
			Power = "Lock",
			Target = "Self",
			Increase = 2
		},
		Bio = "He's managing to keep you at bay, and he's not even wearing pants."
	},
	xiVirtual = {
		Id = 7274999328,
		Name = "xiVirtual",
		AltCards = {
			TheNumberOneViIIain = {
				Id = 6661465598,
				Name = "TheNumberOneViIIain",
				AttackEffect = "Jab",
				AltArt = true,
				Addant = "Villain's Goon",
				Effect = {
					Name = "TheNumberOneVillain",
					Description = "During your end step: Give yourself a 200/200 Villain's Goon. It's inert in all zones."
				},
				Bio = "We are number one!"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Katana",
		Color = "Blue",
		Addant = "Virtual Minion",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Life fam",
			Description = "During your end step: Give yourself a 200/200 Virtual Minion with no abilities. It costs {B}{B} to cast.",
			Type = "OnEnd",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "I am a champion... maybe just a virtual champion, but still a champion!"
	},
	["Virtual Minion"] = {
		Id = 7039318029,
		Name = "Virtual Minion",
		AltCards = {
			["Villain's Goon"] = {
				Id = 6722522089,
				Name = "Villain's Goon",
				AttackEffect = "Punch",
				Bio = "They certainly are!"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2 },
		TokenOmni = true,
		Effect = {
			Name = "Life fam",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "We will send our master to the real world!"
	},
	destruction5033 = {
		Id = 7160279479,
		Name = "destruction5033",
		AltCards = {
			["Swagmaster Supreme"] = {
				Id = 6798963630,
				Name = "Swagmaster Supreme",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "By any means necessary."
			},
			["epic yes, Tolarian Scholar"] = {
				Id = 12070330529,
				Name = "epic yes, Tolarian Scholar",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "“Many Blox Cards players ask the question; Is it worth it to buy an Alternate Art Commission?”"
			},
			["destruction5033-Hal"] = {
				Id = 7611007779,
				Name = "The Milkman",
				AttackEffect = "Bottle",
				Bio = "I am the milkman. My milk is delicious."
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "Sneak Attack",
			Description = "Whenever you cast a fighter with total stats 500 or less: A target fighter loses 100 Power.",
			Type = "OnAllySummon",
			Power = { { "Weaken", 100 } },
			Target = "Single",
			SizeClass = "Picant"
		},
		Bio = "He caused destruction for the 5033rd time."
	},
	["Kara's Infiltration"] = {
		Id = 6575082685,
		Name = "Kara's Infiltration",
		AltCards = {
			["Kara's Infiltration-Hal"] = {
				Id = 7472566518,
				Name = "The Duck Trials",
				EffectAnimation = "MidMagicYellowEffect",
				Addant = "Rubber Duck-Hal",
				Bio = "\"For the crime of \"Not giving us enough bread\" you are hereby sentenced 'Guilty'!\""
			},
			["Kara's Inflation"] = {
				Id = 8270151874,
				Name = "Kara's Inflation",
				AltArt = true,
				EffectAnimation = "MoneyStackEffect",
				Addant = "Counterfeit Bills",
				Bio = "\"It's just paper, why didn't I think of this sooner!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Blue = 3 },
		Addant = "Rubber Duck",
		CustomReminder = { ["Rubber Duck"] = "A useless fighter, fit only for discarding." },
		EffectVariable = 0,
		Effect = {
			Name = "Sneak Attack",
			Description = "Give all players 3 Rubber Ducks.\nIf a target fighter costs 3 or fewer total studs, return it to its hand.",
			Type = "OnSummon",
			Power = {
				{
					"RepeatingAdd",
					{ "Addant", 3 },
					"Ally"
				},
				{
					"RepeatingAdd",
					{ "Addant", 3 },
					"Opponent"
				},
				{ "Return" }
			},
			Target = "Single",
			EffectReturnStudCap = 3
		},
		Bio = "Ask Kara to \"be quiet\" and she might just only deck you in, if she's feeling nice. Still, Herrus told her it was the only way to reach the Infurnished holding cells, deep below."
	},
	["Rubber Duck"] = {
		Id = 7128383934,
		Name = "Rubber Duck",
		AltCards = {
			["Rubber Duck-Hal"] = {
				Id = 7749046938,
				Bio = "Resistance against the trials will only lead to an harsher sentence."
			},
			["Counterfeit Bills"] = {
				Id = 8270152353,
				Name = "Counterfeit Bills",
				Bio = "Greed is unlimited."
			},
			["Realization..."] = { Id = 9400902524, Name = "Realization...", Bio = "I REALIZE." },
			["Pyrrhic Realization"] = {
				Id = 11770007598,
				Name = "Pyrrhic Realization",
				Bio = "<i>\"First, there was fire. And then there was nothing.\"</i>"
			},
			["Rubber Duck-Sun"] = {
				Id = 13660846283,
				Name = "Inconspicuous Grey Target Guy",
				Bio = "\"Aw man. I just wanted to have a vacation and this happens. This stinks.\""
			},
			["Annoying Mallard"] = {
				Id = 18601522100,
				Name = "Annoying Mallard",
				Bio = "HONK HONK HONK HONK HONK"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		TokenOmni = true,
		Archetype = "Rubber Duck",
		HideArchetype = true,
		Cost = { Neutral = 0 },
		EffectAnimation = "DuckCall",
		Requirement = { "Archetype", "Ally", 1, 9999, "Gladiator" },
		Effect = {
			Name = "Quack",
			Description = "Cast this card only if there's an allied Gladiator.",
			Type = "OnDiscarded",
			Power = { { "Draw", 0 } },
			Target = "Ally",
			NoBlip = true
		},
		Bio = "Teh epik duck came and went, unaware of her presence. Kara put her claws away, her strength saved for the fight ahead."
	},
	Mackerel = {
		Id = 7275006851,
		Name = "Mackerel",
		AltCards = {
			["Mackerel-C"] = {
				Id = 8131194832,
				Name = "Arctic Fisherman",
				AttackEffect = "Ice",
				Bio = "Ice fishing's a great profession! You may even see the Legendary Kraken for the first and last time."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		Color = "Blue",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "MackDonalds FishBurger Deluxe",
			Description = "Whenever you discard a card: Destroy this card.",
			Type = "OnAllyDiscard",
			Power = { { "Destroy", 30 } },
			Target = "Self"
		},
		Bio = "He was banished from banland on Blizzetta, but he came back as a fish merchant!?"
	},
	Bebee2 = {
		Id = 7275006274,
		Name = "Bebee2",
		AltCards = {
			["Bebee2-E"] = {
				Id = 8941650318,
				Name = "Egg-blicator",
				AttackEffect = "Storm",
				Bio = "GTA infinite money glitch."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Yellow = 2, Blue = 2 },
		Effect = {
			Name = "Revival",
			Description = "Whenever you cast a fighter with total stats 500 or less: Summon a copy of it.",
			Type = "OnAllySummon",
			Power = { { "SummonCopy" } },
			Target = "Aggressor",
			SizeClass = "Picant"
		},
		Bio = "How is this card fair? I dunno."
	},
	Skullsten = {
		Id = 117921624092821,
		Name = "Skullsten",
		AltCards = {
			["SANS GAMING"] = {
				Id = 3476971083,
				Rarity = "Token",
				Name = "SANS GAMING",
				AttackEffect = "Slash",
				Bio = "This card has been sealed, never to be put in a deck ever again. Unless...?"
			},
			["Skullsten-Sun"] = {
				Id = 10286458186,
				AttackEffect = "Jab",
				Bio = "Why am I fishing? You ask me, I have a hobby."
			},
			Eric = {
				Id = 17763438396,
				Name = "Eric",
				AltArt = true,
				PremiumArt = 270,
				Bio = "Many things happened to him once."
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		Effect = {
			Name = "Solar Hardscope",
			Description = "Once each turn, Whenever you cast a fighter with total stats 1500 or more: Set the power of a target allied fighter to 400.",
			Type = "OnAllySummon",
			Power = { { "SetPower", 400 } },
			Target = "SingleAlly",
			SizeClass = "Gigant",
			TurnTriggerLimit = 1
		},
		Bio = "Not many skulls have names. Sten is an exception."
	},
	StayBlue = {
		Id = 6575277227,
		Name = "StayBlue",
		AltCards = {
			luckygamer2003 = {
				Name = "luckygamer2003",
				AttackEffect = "ClassicRocket",
				Id = 7425253867,
				Bio = "Too lazy to attack, maybe when I feel like it I will."
			},
			["Psychotic Freak"] = {
				Id = 7493957888,
				Name = "Psychotic Freak",
				AttackEffect = "Inferno",
				Bio = "AAAAAAAA LET ME ATTACK WHY CAN'T I ATTACK LET ME HURT YOU LET ME OUT LET ME OUT LET ME ATTACK LET ME KILL STRIKE ME FREE ME AAAAAAAAAAAAAAAAAAAAAAAAA"
			}
		},
		Health = 500,
		Power = 1000,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		AttackBlock = true,
		Effect = {
			Name = "Frostblast",
			Description = "",
			Type = "Nil",
			Power = "Heal",
			Target = "Self",
			Increase = 100
		},
		Bio = "Why can't I attack with StayBlue?"
	},
	["Ezebel, Pirate Queen"] = {
		Id = 10316736445,
		Name = "Ezebel, Pirate Queen",
		Health = 400,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Pirate Is Free",
			Description = "When this card is cast: A target fighter loses 400 Power.",
			Type = "OnSummon",
			Power = { { "Weaken", 400 } },
			Target = "Single"
		},
		Bio = "The oceans are controlled by the pirates, and the pirates are controlled by Ez. You want anything done on the ocean, well you will have to talk to Ez first."
	},
	ShyLightness = {
		Id = 7605233722,
		Name = "ShyLightness",
		AltCards = {
			["ShyLightness-Hal"] = {
				Name = "ShyLightless",
				AttackEffect = "Revolver",
				Id = 7510868358,
				Bio = "Even salvation fails him."
			},
			["Noisy Bro"] = {
				Name = "Noisy Bro",
				Id = 8789654750,
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "All the way from Japan, it's the manga mangler. Make some noise... for Noisy Bro!"
			},
			["Bluepuddy the Interloper"] = {
				Id = 126174787513414,
				Name = "Bluepuddy the Interloper",
				AttackEffect = "Gravity",
				AltArt = true,
				PremiumArt = 496,
				Bio = "I don't understand the actions of others, nor the trends they follow."
			}
		},
		Health = 1050,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 5, Blue = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, if there are no Blue cards in your baseplate: A target fighter can no longer counterattack. Lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "EffectDescription", "Nil" }
				},
				{ "GivePassive", "CounterBlock" },
				{ "Lock", 1 }
			},
			Target = "Single",
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" }
		},
		Bio = "Hovering skull doesn't scare you? Maybe my skill will."
	},
	Darpeh = {
		Id = 7578663665,
		Name = "Darpeh",
		Health = 1400,
		Power = 1400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 14 },
		Overload = true,
		TargetImmune = true,
		TriggerInHand = true,
		Requirement = { "NotColor", "AllyGenZone", 0, 1, "Neutral" },
		Rank = 2,
		EffectVariable = 0,
		Effect = {
			Name = "Royal Cure",
			Description = "Cast this card only if there no non-Colourless cards in your Baseplate.\nThis card costs {B} less for each Blue card in your graveyard.\nWhenever you discard a card, if this card's in play or your hand: Obliterate this card.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Ally", "nil", true, false }
						},
						{
							"MoveZone",
							{ "EffectTarget", "Field_Ally", "nil", true, false }
						}
					},
					Target = "Self"
				},
				OnAnyTrigger = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "SpecificColorCost", "Blue" }
						},
						{
							"AlterEV",
							{ "NoOverwriteSave", "EffectVariable", "BlueCost", "BaseCost" },
							"Self"
						},
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Blue", "Nil" }
						},
						{
							"AlterEV",
							{ "Cap", "Math", 14, "Nil" }
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
							{ "Variable", "Blue" },
							"Self"
						}
					},
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "You don't deserve to know about her."
	},
	Kreekcraft = {
		Id = 8999473384,
		Name = "Kreekcraft",
		AltCards = {
			["Kreekcraft-Sun"] = {
				Id = 10283621765,
				AttackEffect = "Slash",
				Bio = "It's good to go offline once in a while!"
			},
			["Star-crossed Schizoids"] = {
				Id = 98054318594519,
				Name = "Sparkle9K",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Drifting off into postmodern dreams."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Effect = {
			Name = "Bloated",
			Description = "When this card is cast, if there's an allied fighter with total stats 1500 or more: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally",
			EffectRequirement = { "SizeClass", "Ally", 1, 9999, "Gigant" }
		},
		Bio = "Undisputed king of Piggy."
	},
	["Brick Bacon"] = {
		Id = 7141483138,
		Name = "Brick Bacon",
		AltCards = {
			["Brick Bacon-Sun"] = {
				Name = "Icy-Cle",
				EffectAnimation = "EatIcyCle",
				Id = 9150926279,
				Bio = "Yuck, it tastes like non-dev..."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2, Green = 2 },
		EffectAnimation = "EatBrickBacon",
		IsFood = true,
		Effect = {
			Name = "Bloated",
			Description = "A target fighter gains 500 health.\nGive yourself a copy of each fighter with total stats 1500 or more.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500, "Single" },
				{ "AddCopy" }
			},
			Target = "SizeGigant"
		},
		Bio = "Equal parts nutritious and tasteless, the diet of a gladiator is strict and functional."
	},
	Mike = {
		Id = 10280535000,
		Name = "Mike",
		AltCards = {
			Zia = {
				Name = "Zia",
				AttackEffect = "Rifle",
				Id = 10280536557,
				AltArt = true,
				Bio = "A world class sniper, hellbent on killing sprees."
			}
		},
		Health = 2000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Minigun",
		Color = "Blue",
		Dextrous = true,
		Cost = { Neutral = 6 },
		Effect = {
			Name = "Bloated",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "Hired mercenary, endorsed by IcyTea himself."
	},
	SilentSwords = {
		Id = 7274993760,
		Name = "SilentSwords",
		AltCards = {
			["SilentSwords-Sun"] = {
				Id = 10283614949,
				Bio = "It wouldn't be a real Slice of Life without summer festivals and kimonos, now would it?"
			},
			["Cargo Manager Eugene"] = {
				Id = 17763438520,
				Name = "Cargo Manager Eugene",
				AltArt = true,
				PremiumArt = 269,
				Bio = "Let's get these crates delivered before lunchtime, fellas!"
			},
			["The Outcast"] = {
				Id = 104034746067709,
				Name = "The Outcast",
				AltArt = true,
				PremiumArt = 826,
				Bio = "“I, as my people, have dreamt of a life defined by its ephemerality; what is the worth of any moment if not solely the thrill that now, right here, in this moment, you exist, every moment at its sharpest, never dulled by the mundane safety of its continuation? To live a life worth living is to be willing to put it on the line; it is my only belief, one of experience, to cherish each moment as your last; the belief which defines my people, and more so than any of them, it defines me.”"
			}
		},
		Health = 1300,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Katana",
		Color = "Blue",
		Cost = { Blue = 5, Neutral = 1 },
		Charge = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever you cast a fighter with total stats 1500 or more: Draw a card.",
			Type = "OnAllySummon",
			Power = { { "Draw", 1 } },
			SizeClass = "Gigant",
			Target = "Ally"
		},
		Bio = "It wouldn't be a real Anime Highschool without the falling cherry blossoms, now would it?"
	},
	PlaceRebuilder = {
		Id = 9137701487,
		Name = "Epic Duck Fan",
		AltCards = {
			["Razar Okiya, Erratic Duck Fan"] = {
				Name = "Razar Okiya, Erratic Duck Fan",
				AttackEffect = "Microphone",
				Id = 12367546892,
				AltArt = true,
				Bio = "<i><b>\"AYO ONE! TWO! THREE! EVERYBODY AT THE 313 JUST QUACK WITH ME!\"</b></i>"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 6 },
		Effect = {
			Name = "Rebuilding The Place",
			Description = "Whenever you cast a fighter with total stats 500 or less: Swap the stats of a target fighter.",
			Type = "OnAllySummon",
			Power = { { "Swap", 99999 } },
			SizeClass = "Picant",
			Target = "Single"
		},
		Bio = "\"CAWM AWN, DUCK! SCORE SOME HEDS M'ATE!! BETTA' SHOW 'EM WHAT ANATIDAES C'AN DO!!\""
	},
	Amber = {
		Id = 10310608411,
		Name = "Amber",
		Health = 1200,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Neutral = 5, Blue = 2 },
		Effect = {
			Name = "Clone of my own.",
			Description = "During your end step: You gain {R}.",
			Type = "OnEnd",
			Power = { { "Red", 1 } },
			Target = "Ally"
		},
		Bio = "Valk Helms do make you powerful. *cue the generic sparkles*"
	},
	["Permafrost Storm"] = {
		Id = 10281239062,
		Name = "Remorseless Winter",
		AltCards = {
			["Craft's Christmas Gift"] = {
				Name = "Craft's Christmas Gift",
				Id = 13507659833,
				AltArt = true,
				Commissioner = { 130043756, 13353647 },
				Effect = {
					Power = { { "Summon", "Craft 5" } }
				},
				Bio = "\"Thanks for the gift Super and Eclipse! I can't wait to open it!\""
			},
			["Chimecat0 Martyr of NPCS"] = {
				Id = 117535362342366,
				Name = "Chimecat0 - Martyr of NPCS",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 614,
				Effect = {
					Power = { { "Summon", "Chimecat0-Token 5" } }
				},
				Bio = "“20 broken supercomputer buffs NOW”"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Freeze",
		Color = "Blue",
		Cost = { Blue = 6 },
		Effect = {
			Name = "Icerain, Harbinger of Frost",
			Description = "Summon a 1000/100 fighter that resets its stats during your end steps.\nIf it survives six of your end steps, ban your opponent.",
			Type = "OnSummon",
			Power = { { "Summon", "Permafrost 5" } },
			Target = "Ally"
		},
		Bio = "The process of freezing to death is usually very painful in the beginning as the nerves can still feel the cold and report the pain to the body."
	},
	["Permafrost 5"] = {
		Id = 10281175178,
		Name = "Permafrost Storm",
		AltCards = {
			["Craft 5"] = {
				Name = "Craft's Christmas Gift",
				AttackEffect = "Ice",
				Id = 13507659833,
				Transformant = "Craft 10",
				Bio = "\"Thanks for the gift Super and Eclipse! I can't wait to open it!\""
			},
			["Chimecat0-Token 5"] = {
				Name = "Chimecat0",
				AttackEffect = "Ice",
				Id = 140017447954852,
				Transformant = "Chimecat0-Token 10",
				Bio = "“20 broken supercomputer buffs NOW”"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Blizzard",
		Transformant = "Permafrost 10",
		ReplaceDescriptionant = "Variable Charges.\nDuring your end step: Remove a charge and reset this card's stats. Then ban your opponent if it has no charges.",
		Color = "Blue",
		Cost = { Blue = 8 },
		EffectVariable = 6,
		Effect = {
			Name = "Icerain, Blurrer of Lines between Epic and Legendary rarities and their meaning",
			Description = "6 Charges.\nDuring your end step: Remove a charge and reset this card's stats. Then ban your opponent if it has no charges.",
			Ability = {
				OnEnd = {
					Power = {
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							"Self"
						},
						{ "ReplaceDescription", "ReplaceDescriptionant", "Self" },
						{ "Reset" },
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "Self"
				},
				OnEVCheckFail = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self"
				}
			}
		},
		Bio = "The body slows down its metabolic rate greatly and this is why some people experience feelings of calmness during such a situation."
	},
	["Permafrost 10"] = {
		Id = 10281236588,
		Name = "Permafrost Storm",
		AltCards = {
			["Craft 10"] = {
				Name = "Craft's Christmas Gift",
				AttackEffect = "LaserBlue",
				Id = 13822693442,
				Bio = "\"Oh man, I've been holding this gift for so many turns... I just can't WAIT ANYMORE! I gotta open it RIGHT. NOW. Hold on a second, what's that buzzing soun-\""
			},
			["Chimecat0-Token 10"] = {
				Name = "Chimecat0",
				AttackEffect = "Ice",
				Id = 80451704467125,
				Bio = "“20 broken supercomputer buffs NOW”"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Blizzard",
		Color = "Blue",
		AddBlock = true,
		Cost = { Blue = 8 },
		Effect = {
			Name = "Icerain, the thing that killed the dinosaurs",
			Description = "During your end step: Ban your opponent.",
			Type = "OnEnd",
			Power = { { "Inflict", 1000000 } },
			Target = "Opponent"
		},
		Bio = "Speaking of death, who let this happen? Who actually loses to this?"
	},
	Silver_Semtexagon = {
		Id = 10281725213,
		Name = "Silver_Semtexagon",
		AltCards = {
			["HMS Illustrious"] = {
				Id = 10281468188,
				Name = "HMS Illustrious",
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "Borea has taken her notes from the 87."
			},
			["Silver Yaksha"] = {
				Id = 10281466340,
				Name = "Silver Yaksha",
				AttackEffect = "Katana",
				AltArt = true,
				Bio = "Before dawn, the night is darkest just before dawn. But keep your eyes open, keep them open no matter how dark the night ahead may be. If you avert your eyes from the dark, you'll be blind to the rays of a new day."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		OmniImmune = true,
		Effect = {
			Name = "Stalwart Barrier",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "Have you ever thought about just saying no?"
	},
	["Love Contract"] = {
		Id = 10184738708,
		Name = "\"Love\" Contract",
		AltCards = {
			["Game Controller"] = {
				Id = 10281438870,
				AltArt = true,
				Name = "Game Controller",
				Addant = "Mom Says It's My Turn",
				Bio = "Select your fighter!"
			},
			["Love Contract-Mango"] = {
				Name = "The Great Plundering",
				Id = 79793075867354,
				Addant = "Submit to the Crowds-Mango",
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"You want my treasure? You can have it! I left everything I gathered in one place. Now you just have to find it!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 4 },
		Addant = "ContractToken",
		Effect = {
			Name = "WWW",
			Description = "Steal a target fighter.\nGive your opponent a {W}{W}{W}{W} action that can steal a target fighter.",
			Type = "OnSummon",
			Power = {
				{ "Steal", 30, "Single" },
				{ "Add", "Addant" }
			},
			Target = "Opponent"
		},
		Bio = "\"You took EVERYTHING from me. Now it's my turn.\""
	},
	ContractToken = {
		Id = 10281435711,
		Name = "Submit to the Crowds",
		AltCards = {
			["Mom Says It's My Turn"] = {
				Id = 10281433199,
				Name = "Mom Says It's My Turn",
				Bio = "mOm SaYs itS mY tUrn oN tHe RObOx!"
			},
			["Submit to the Crowds-Mango"] = {
				Id = 76045332869319,
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Name = "XEVIATHAN",
				Bio = "\"Our brains arrrrrrrr Xineapples!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Blue",
		Cost = { Neutral = 4 },
		Addant = "ContractToken",
		Effect = {
			Name = "WWW",
			Description = "Steal a target fighter.",
			Type = "OnSummon",
			Power = { { "Steal", 30, "Single" } },
			Target = "Opponent"
		},
		Bio = "Kara forced Umberhallow to marry her, entitling her to half of all that he owned. The subsequent hasty divorce entitled her to the other half. The Pits, his elder demon status, all his binding contracts: Hers. All he got from her was her last name."
	},
	GUCCI = {
		Id = 9964799048,
		Name = "GUCCI",
		AltCards = {
			["GUCCI-AN"] = {
				Id = 9400908987,
				Name = "Classy Bear",
				AttackEffect = "Scratch",
				Bio = "Fat fella."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the Crowd's Favour: Double its stats.",
			Type = "OnSummon",
			Power = {
				{ "MultiplyHealth", 2 },
				{ "MultiplyPower", 2 }
			},
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "Under the creative direction of Alessandro Michele, Gucci is redefined as a luxury brand with a contemporary approach to fashion."
	},
	noob007 = {
		Id = 9964855874,
		Name = "noob007",
		AltCards = {
			["noob007-E"] = {
				Id = 9964856732,
				Name = "Egg Samurai",
				AttackEffect = "Katana",
				Bio = "An most honoured Samurai of the Peggoda."
			},
			["The Flame of Corruption"] = {
				Id = 15804641965,
				Name = "The Flame of Corruption",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 182,
				Bio = "c.S > 6P, (delay) 5H > j.D, j.D > j.D, j.D > dash j.S > j.D > dj.S > j.D > SVV > KD"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Battleaxe",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, if you have the crowd's favour: All allied fighters gain 200 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "My dignity is on the line."
	},
	Tone = {
		Id = 9964920511,
		Name = "Tone",
		AltCards = {
			["Tone-Sun"] = {
				Id = 9166678129,
				Name = "Beach Bully",
				AttackEffect = "Slash",
				Bio = "Why did you even invite this dude?"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		Effect = {
			Name = "Thug Life",
			Description = "When this card is cast: All allied fighters with 300 or less power gain 200 Power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "NotPower",
				Modifier = 300
			}
		},
		Bio = "Merely red."
	},
	Paranormanbiggestfan = {
		Id = 9964858960,
		Name = "Paranormanbiggestfan",
		AltCards = {
			["Paranormanbiggestfan-Hal"] = {
				Id = 9964859825,
				AttackEffect = "SoulDrain",
				Bio = "The feeling isn't mutual."
			},
			Fal = {
				Id = 129237396156158,
				Name = "Fal",
				PremiumArt = 345,
				AltArt = true,
				Bio = "<b><font color=\"#FF0000\">aye fair enough</font></b>"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "JUST SCRIPT IT",
			Description = "Whenever an effect gives your opponent a card: They lose 500 life. Until each player's next end step, card effects can't give that player cards.",
			Type = "OnEnemySecondPut",
			Power = {
				{ "BypassAdd", 30, "All" },
				{ "Inflict", 500 }
			},
			Target = "Opponent"
		},
		Bio = "A lot of thought and letters went into Paranormanbiggestfan's name."
	},
	man8976 = {
		Id = 9964839688,
		Name = "Meta Girl",
		AltCards = {
			UnrecoqnizabIe = {
				Id = 9964842684,
				Name = "UnrecoqnizabIe",
				AltArt = true,
				AttackEffect = "Revolver",
				CopyBodge = "UnrecoqnizabIe",
				Bio = "You just got cyberbullied!!!! ˙ ͜˙"
			},
			MELAN_CHXLY = {
				Id = 11865479343,
				AltArt = true,
				AttackEffect = "Bat",
				Name = "MELAN_CHXLY, Firestarter",
				Bio = "\"I'm a great cool, I feel a good, but you make me angry.\""
			}
		},
		Health = 550,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gun",
		Cost = { Red = 2, Neutral = 3 },
		Color = "Red",
		DestroyImmune = true,
		Effect = {
			Name = "Extreme Energy Care Package",
			Description = "When this card is cast: Reveal your opponent's hand and select an action card in it. Destroy that card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "RevealHand", 30, "Opponent" },
						{
							"MoveZone",
							{ "EffectTarget", "Hand_Opponent", "GraveZone_Opponent", false, false },
							"CustomZoneTarget"
						}
					},
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Enemy_Hand" },
						Condition = { Action = true },
						SelectionDescription = "an action in your opponent's hand to destroy",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "A professional Gunter, shining with Meta Drip!"
	},
	BloodSpilled = {
		Id = 140241756058320,
		Name = "BloodSpilled",
		AltCards = {
			AsAsSino142 = {
				Id = 112637465128508,
				Name = "Brenhines, carthffos anobaith",
				AltArt = true,
				EffectAnimation = "MidSlashEffect",
				Bio = "pa mor ddoniol fyddai pe bai'r holl ffrwydradau niwclear yn digwydd ar unwaith"
			},
			KillerKyle = {
				Id = 9964722484,
				Name = "KillerKyle",
				AttackEffect = "LinkedSword",
				EffectAnimation = "MidSlashEffect",
				Bio = "who wanna here tha story of the masked killer."
			}
		},
		Health = 500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		EffectAnimation = "MidSlashEffect",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "seventh jutsu of the final sun's rend",
			Description = "When this card is cast: You lose 500 life. Deal 500 damage to a target fighter.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 500 },
				{ "Damage", 500 }
			},
			Target = "Single"
		},
		Bio = "Your blood is worth just as much as his. If I waste his, you are to be wasted too."
	},
	RoboticMob = {
		Id = 9964880228,
		Name = "RoboticMob",
		AltCards = {
			["RoboticMob-Sun"] = {
				Name = "Popsicle Thief",
				AttackEffect = "Jab",
				Id = 9208879086,
				Bio = "Yes children. I stole his popsicle, but what can you do about it? When I'm about to consume it!"
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Offensive Defense",
			Description = "Whenever you cast a fighter with total stats 1500 or greater: This card deals 300 damage to a target enemy fighter.",
			Type = "OnAllySummon",
			Power = { { "Damage", 300 } },
			Target = "SingleEnemy",
			SizeClass = "Gigant"
		},
		Bio = "Fills in at local saleless stores on Black Friday."
	},
	DerptasticDevil = {
		Id = 120064833430178,
		Name = "DerptasticDevil",
		AltCards = {
			SunSearch = {
				Name = "SunSearch",
				Id = 13359655605,
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 29,
				Bio = "Can you find the 27th hidden Cheems in this card?"
			},
			["DerptasticDevil-Hal"] = {
				Name = "Pillar Snake",
				Id = 14976298205,
				AttackEffect = "Bite",
				Bio = "What was this snake even doing here anyway? Oh well, time to kill it for the 500th time!"
			},
			["Saturnn and Staring Cat"] = {
				Id = 15941930387,
				Name = "Saturnn and Staring Cat",
				AttackEffect = "Whirlpool",
				AltArt = true,
				Bio = "uhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
			},
			["Chains of Arthurs"] = {
				Name = "Chains of Arthurs",
				Id = 18298926239,
				AttackEffect = "Slash",
				Bio = "Surprisingly sturdy."
			}
		},
		Health = 1100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 5, Red = 1 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "I bet he can beat you in a thumb war."
	},
	B550 = {
		Id = 10243406895,
		Name = "B550",
		AltCards = {
			["B550-Sun"] = {
				Id = 9180241335,
				Name = "Arthur Hemmingway",
				AttackEffect = "MagicRed",
				Bio = "\"A lawyer must ponder about many things.\""
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 3, Neutral = 2 },
		Effect = {
			Name = "550 Miles",
			Description = "During your end step, if there's 550 or less total power amongst allied fighters: They gain 250 Power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 250 } },
			Target = "Ally",
			EffectRequirement = { "Power", "Ally", 0, 600 }
		},
		Bio = "B550 is a blank slate - A gunman with no identity: stripped of humanity and built for only one purpose. His story - not important; his name - even less so."
	},
	Sorry = {
		Id = 102507878475543,
		Name = "Dodgeball Throw",
		CopyBodge = "Sorry",
		AltCards = {
			["Sorry-Val"] = {
				Name = "Heart Broken",
				Id = 10184620786,
				Bio = "Sorry Eddy, I've met a REAL man."
			},
			["Snowball Throw"] = { Name = "Snowball Throw", Id = 9964939394, Bio = "SPLAT!" },
			["Sorry-Hal"] = {
				Name = "Pig Ball Throw",
				Id = 10184623294,
				Bio = "WHERE DO THESE KEEP COMING FROM"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Blaze",
		Color = "Red",
		Lunar = true,
		Cost = { Neutral = 2, Red = 1 },
		Effect = {
			Name = "Sorry!",
			Description = "Deal 600 damage to all fighters with the lowest health.",
			Type = "OnSummon",
			Power = { { "Damage", 600 } },
			Target = "LowestHealth"
		},
		Bio = "It has to be done!"
	},
	Cooldude4851 = {
		Id = 10243259954,
		Name = "Cooldude4851",
		AltCards = {
			Xelkenia = {
				Id = 126443955416212,
				Name = "The Cool Dude",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "The pain will leave once it's finished teaching you."
			},
			["Cooldude4851-AN"] = {
				Id = 18771316508,
				Name = "Angry Block Spirit",
				AttackEffect = "MagicRed",
				Bio = "I SHALL TEAR YOU APART BRICK BY BRICK"
			}
		},
		Health = 300,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "HURT ALL THE THINGS",
			Description = "Whenever you cast a fighter: All allied fighters gain 50 power.",
			Type = "OnAllySummon",
			Power = { { "Strengthen", 50 } },
			Target = "Ally"
		},
		Bio = "Memes are fruit."
	},
	["Pig Ball"] = {
		Id = 10184663910,
		Name = "Pig Ball",
		AltCards = {
			["Pig Ball-Sun"] = {
				Id = 9180262073,
				Name = "Toadally Awesome",
				AttackEffect = "Swamp",
				Bio = "WOW!"
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the Crowd's Favour: Destroy a target fighter.",
			Type = "OnSummon",
			Power = { { "Destroy", 300 } },
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "THERE I ADDED IT TO THE GAME ARE YOU HAPPY NOW"
	},
	["Mark for Insanity"] = {
		Id = 10243397258,
		Name = "Mark for Insanity",
		AltCards = {
			["Mark for Insanity-C"] = {
				Id = 10243399087,
				Name = "Greetings from Krampus",
				Bio = "Milkies and cookies won't save you now."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Red = 4 },
		Lunar = true,
		Effect = {
			Name = "WWW",
			Description = "A target fighter deals damage to itself equal to its power.",
			Type = "OnSummon",
			Power = { { "Damage", "TargetPower", "Single" } },
			Target = "Ally"
		},
		Bio = "The crowd loved the cows and furniture raining from the rooftops. The contestants most certainly did not."
	},
	["Unwanted Trend"] = {
		Id = 6310573843,
		Name = "Unwanted Trend",
		AltCards = {
			["Unwanted Trend-C"] = {
				Name = "Unwanted Gifts",
				Id = 11728170088,
				Bio = "\"Huh? Didn't I throw this out last yea-\""
			},
			["Unwanted Trend-Civ"] = {
				Name = "Thanks",
				Color = "Blue",
				Cost = { Blue = 1 },
				Id = 96553478758915,
				Bio = "\"I appreciate it\""
			},
			["iPad Baby"] = {
				Id = 98917257700902,
				Name = "iPad Baby",
				ArtAnimation = "ipadbaby",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "You don't deserve to be happy."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		Effect = {
			Name = "Infinite Army",
			Description = "Ban yourself.",
			Type = "OnSummon",
			Power = { { "Cost", 99999999 } },
			Target = "Opponent"
		},
		Bio = "I'm sure no one will find a way to abuse this."
	},
	outfoxing = {
		Id = 9827060337,
		Name = "Merryswole",
		AltCards = {
			YangTaoKing = {
				Name = "YangTaoKing",
				AttackEffect = "British",
				EffectAnimation = "MidBritishEnemyHandSingle",
				Id = 8288005908,
				AltArt = true,
				Bio = "Sourcing and finding targets is what matters the most... But I chose you for my own enjoyment."
			}
		},
		Health = 1000,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 6 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "WWW",
			Description = "When this card is cast, if you have the crowd's favour: Destroy the oldest card in your opponent's hand.",
			Type = "OnSummon",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent",
			EffectRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" }
		},
		Bio = "Weakest of his race, but the most hospitable, all things considered."
	},
	AntiSammeh = {
		Id = 4720089549,
		Name = "AntiSammeh",
		AltCards = {
			["AntiSammeh-Sun"] = {
				Id = 7268116143,
				AttackEffect = "Whirlpool",
				Bio = "「Sandstorm」... Wash them away!"
			}
		},
		Health = 300,
		Power = 1000,
		Rarity = "Uncommon",
		AttackEffect = "Storm",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Effect = {
			Name = "Neme-shot",
			Description = "When this card is cast: A target fighter gains 200 power.\nDuring your end step: All allied fighters with total stats 1500 or more gain 100 power.",
			Ability = {
				OnSummon = {
					Power = { { "Strengthen", 200 } },
					Target = "Single"
				},
				OnEnd = {
					Power = { { "Strengthen", 100 } },
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Field" },
						Condition = "SizeClass",
						Modifier = "Gigant"
					}
				}
			},
			Type = "OnSummon",
			Power = { { "Damage", 300 } },
			Target = "Single",
			EffectRequirement = { "SizeClass", "Ally", 1, 9999, "Gigant" }
		},
		Bio = "It's like Sammeh, but not!"
	},
	["John Bomb"] = {
		Id = 8509207690,
		Name = "John Bomb",
		AltCards = {
			Mitcrawl = {
				Id = 127316479062600,
				Name = "Needlehead",
				AttackEffect = "British",
				Bio = "I am the way."
			},
			["Ms. Newman"] = {
				Id = 13006319166,
				Name = "Miss Newman",
				AttackEffect = "Hammer",
				AltArt = true,
				Bio = "\"Another one of Biggs' cronies is knocking on the door. Still looking for the promise of pay from a washed up philantrophist, huh? Well, he never cared about the deaths of his servants or victims, did he, now?\""
			}
		},
		Health = 50,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "TimeBomb",
		Color = "Red",
		Cost = { Green = 1, Red = 2, Neutral = 1 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card dies: Each fighter in your hand gains 200 power. Deal 200 damage to all fighters with total stats less than 1500.",
			Type = "OnDeath",
			Power = {
				{ "StrengthenHand", 200 },
				{ "Damage", 200, "SizePicant" },
				{ "Damage", 200, "SizeMedium" }
			},
			Target = "Ally"
		},
		Bio = "\"Alright... I've really enjoyed our time here, but I've got games to destroy!\""
	},
	["Totem of Pixel"] = {
		Id = 8207879941,
		Name = "Totem of Pixel",
		AltCards = {
			Yayiampig2 = {
				Id = 8207881331,
				AltArt = true,
				Name = "Yayiampig2",
				AttackEffect = "Hammer",
				Bio = "\"Yay I am pig. Or cat maybe\"."
			},
			["Totem of Pixel-Sun"] = {
				Id = 9284765136,
				Name = "Matt",
				AttackEffect = "Slash",
				Bio = "Get ready to get filtered, scrub."
			}
		},
		Health = 650,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2, Yellow = 2, Green = 2 },
		Effect = {
			Name = "Totem Magic",
			Description = "During your end step: All allied fighters gain 1/4th of their Health and Power.",
			Type = "OnEnd",
			Power = {
				{ "MultiplyHealth", 1.25 },
				{ "MultiplyPower", 1.25 }
			},
			Target = "Ally"
		},
		Bio = "Built for PixelFlame, it brings wisdom and antics."
	},
	["Egg Eyes Batter Dragon"] = {
		Id = 6578854079,
		Name = "CoderQwerty",
		AltCards = {
			["Egg Eyes Batter Dragon-E"] = {
				Id = 8854907268,
				Name = "Egg Eyes Batter Dragon",
				AttackEffect = "Blaze",
				Bio = "I WARNED YOU TEA, NOW BATTER UP!"
			}
		},
		Health = 750,
		Power = 450,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Stealth = true,
		Cost = { Yellow = 3, Neutral = 3 },
		CustomReminder = {
			["The Soup is a Hardened Criminal"] = "Obliterate a terrified card if it's in play during its end step."
		},
		Effect = {
			Name = "Batter Up",
			Description = "Whenever a fighter is cast: Unlock it and attach terrified to it.",
			Type = "OnAnySummon",
			Power = {
				{ "EquipGear", "Terrified Mod" },
				{ "Unlock", 9999 }
			},
			Target = "Aggressor"
		},
		Bio = "They might take our lifes, but they'll never take...OUR SOUP! CHARGE!!!"
	},
	["Call to Arms"] = {
		Id = 11769947066,
		Name = "Revel of the Pits",
		AltCards = {
			["Juan Attack"] = {
				Id = 4040645114,
				Name = "Juan Attack",
				Effect = {
					Name = "oof",
					Type = "OnSummon",
					Power = {
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{ "Add", "Science!!" }
					},
					Target = "Self"
				},
				Bio = "Who are all these no-name Juans?"
			},
			["Dinner Time!"] = {
				Id = 9354418854,
				Name = "Dinner Time!",
				AltArt = true,
				Effect = {
					Type = "OnSummon",
					Power = {
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{ "Add", "Cat Café" }
					},
					Target = "Self"
				},
				Bio = "A tasty feline cuisine boasting the combination of freshly acquired tuna, bonito, and even sardines! It guarantees to bring cats over to your lawn through mysterious means, some even say they can appear from nowhere and out of thin air as soon as the lid gets pulled up. Lasts 3 hours."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 8 },
		CustomReminder = {
			["Half Time"] = "A {W}{W}{W} action. It summons 2 100/100 Cheering Demons, shuffles itself back into your deck, and draws a card. You can't cast anything else the turn you cast it."
		},
		Effect = {
			Name = "oof",
			Description = "Summon 8 100/100 Cheering Demons.\nGive yourself 'Half-Time.'",
			Type = "OnSummon",
			Power = {
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{ "Add", "Reinforcements" }
			},
			Target = "Self"
		},
		Bio = "Fighting in the Pits often makes you forget your chances of survival almost depends entirely on the audience's opinion on you."
	},
	["New Recruit"] = {
		Id = 11769907428,
		Name = "Cheering Demon",
		AltCards = {
			["New Recruit2"] = {
				Id = 11769908422,
				AttackEffect = "Slash",
				Bio = "\"#RIPBOZO + L + DUSTED + LOCKSPAMMED + TRANSFORMED + RATIO!!!!!!!!!!!!\""
			},
			["New Recruit3"] = {
				Id = 11769909094,
				AttackEffect = "Slash",
				Bio = "\"Haha imagine getting a handshake from quan, not that i'd actually kill for one lol but maybe i would haha just kidding lol actually maybe but\""
			},
			["Juan the Murderer"] = {
				Id = 4040647360,
				Name = "Juan the Murderer",
				AttackEffect = "British",
				Bio = "This one will be perfect for my collection."
			},
			["Juan the Artist"] = {
				Id = 4040646877,
				Name = "Juan the Artist",
				AttackEffect = "MagicYellow",
				Bio = "Truly, he is the number juan artist."
			},
			["Juan the Scientist"] = {
				Id = 4040647721,
				Name = "Juan the Scientist",
				AttackEffect = "Jab",
				Bio = "Test Subject 2184#: ...I don't know what was I thinking with this one."
			},
			Calico = {
				Id = 9354419323,
				Name = "Calico",
				AttackEffect = "Scratch",
				Bio = "Enjoys a good Ball of Yarn.\n Personality: Carefree \n Power Level: 50 \n Appearance: Tri-spotted \n Memento: Damp Matchbox"
			},
			Tabby = {
				Id = 9354419683,
				Name = "Tabby",
				AttackEffect = "Scratch",
				Bio = "Favours sitting on the Cat Metropolis.\n Personality: Lady-killer \n Power Level: 150 \n Appearance: Orange Tabby \n Memento: Seashell Earring"
			},
			Ragdoll = {
				Id = 9354420382,
				AttackEffect = "Scratch",
				Name = "Ragdoll",
				Bio = "Likes to sit on the padded cooler.\n Personality: Faint-hearted \n Power Level: 75 \n Appearance: Ragged up & Dirty \n Memento: Warped Bell"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Scratch",
		Color = "Yellow",
		Token = true,
		Cost = { Yellow = 0 },
		Effect = {
			Name = "...",
			Description = "",
			Type = "Null",
			Power = { { "Heal", 0 } },
			Target = "Ally"
		},
		Bio = "\"OMG THIS FIGHT IS SO EPIC!!! SO AWESOME!!!1!\""
	},
	Reinforcements = {
		Id = 11770888338,
		AltCards = {
			["Science!!"] = {
				Id = 8449734770,
				Name = "Science!!",
				Effect = {
					Name = "oof",
					Description = "Summon 2 100/100 Juans.\nShuffle a copy of this card into your deck, then draw a card.\nYou can't cast actions this turn.",
					Type = "OnSummon",
					Power = {
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{
							"RandomSummon",
							{ "Juan the Murderer", "Juan the Artist", "Juan the Scientist" }
						},
						{ "DeckAdd", "Science!!" },
						{ "Draw", 1 },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "Ally"
				},
				Bio = "\"YES! IT WORKED! The cloning machine is working! Now I just need to pull this lever and...\""
			},
			["Cat Café"] = {
				Id = 9354421204,
				Name = "Cat Café",
				Effect = {
					Name = "oof",
					Description = "Summon 2 100/100 Cats.\nShuffle a copy of this card into your deck, then draw a card.\nYou can't cast actions this turn.",
					Type = "OnSummon",
					Power = {
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{
							"RandomSummon",
							{ "Calico", "Tabby", "Ragdoll" }
						},
						{ "DeckAdd", "Cat Café" },
						{ "Draw", 1 },
						{ "BypassAction", 30, "Ally" }
					},
					Target = "Ally"
				},
				Bio = "An elegant dining experience only meant for the cats with an acquired experienced taste. The place serves several variety of feline cuisine. Such as, Deluxe Tuna Blitz, fit for a fancy cat. How about a Sashimi Boat for the rarest cats with the purr-fect rich taste?"
			}
		},
		Name = "Half-Time",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "oof",
			Description = "Summon 2 100/100 Cheering Demons.\nShuffle a copy of this card into your deck, then draw a card.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{
					"RandomSummon",
					{ "New Recruit", "New Recruit2", "New Recruit3" }
				},
				{ "DeckAdd", "Reinforcements" },
				{ "Draw", 1 },
				{ "BypassAction", 30, "Ally" }
			},
			Target = "Ally"
		},
		Bio = "ROUND TWO, GO!"
	},
	Damarioguy = {
		Id = 8421495812,
		Name = "Damarioguy",
		AltCards = {
			["Damarioguy-AN"] = {
				Id = 10089819679,
				AttackEffect = "Jab",
				Bio = "I LiKe ThE PaRt oF ThE LoRe wHeRe [CENSORED BY THE XxCULTURE_INDUSTRYxX] ArThUr SiNiStEr."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Description = "Whenever this card destroys another: Your opponent draws 3 cards.",
			Type = "OnDestroy",
			Power = { { "Draw", 3 } },
			Target = "Opponent"
		},
		Bio = "The protector and connoisseur of fair and balanced gameplay."
	},
	Enderlox1 = {
		Id = 15698826923,
		Name = "Enderlox1",
		AltCards = {
			["Enderlox1-C"] = {
				Name = "Enderlox1",
				Id = 18812532499,
				AttackEffect = "FirePunch",
				Bio = ""
			}
		},
		Health = 400,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 1 },
		Effect = {
			Name = "Life fam",
			Description = "When this card dies: Summon a copy of the last dead enemy fighter.",
			Type = "OnDeath",
			Power = { { "LastDeath" } },
			Target = "Opponent"
		},
		Bio = "Why do they all get upset over this? It's not like they were using the body anymore..."
	},
	MUTO2014 = {
		Id = 10243131554,
		Name = "MUTO2014",
		AltCards = {
			["MUTO2014-Hal"] = {
				Id = 10243133473,
				AttackEffect = "Axe",
				Bio = "They've began to MUTOtate."
			},
			LOGIC2013 = {
				Id = 10089822858,
				Name = "LOGIC2013",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "1w4r eye of heaven"
			}
		},
		Health = 1050,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Neutral = 1, Red = 4 },
		Effect = {
			Name = "Firascale",
			Description = "Whenever your opponent discards a card: This card deals 200 damage to itself.",
			Type = "OnEnemyDiscard",
			Power = { { "Damage", 200 } },
			Target = "Self"
		},
		Bio = "MUTO real."
	},
	BuzzHamtaro = {
		Id = 10243957971,
		Name = "BuzzHamtaro",
		AltCards = {
			["BuzzHamtaro-Sun"] = {
				Id = 9180261384,
				Name = "Great Opportunaty",
				AttackEffect = "Bubbles",
				Bio = "WOW!"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Rare",
		AlternateCostRequirement = { "Playertable", "Me", 30, 69, "Crowd's Favour" },
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 6, Red = 1 },
		AlternateCost = { IgnoreColor = "Neutral" },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "Firascale",
			Description = "Cast this card ignoring its {W} cost if you have the Crowd's Favour.",
			Type = "OnSummon",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "Loves to watch Hamtaro while eating burgers from Burger Blox."
	},
	XxFreezerFlamesxX = {
		Id = 10243150508,
		Name = "XxFreezerFlamesxX",
		AltCards = {
			XxFreezerFlamesxXv2 = {
				Id = 10243153300,
				AltArt = true,
				Bio = "Half-Freezing and Half-Burning."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 1, Blue = 2, Red = 2 },
		Effect = {
			Name = "POWER",
			Description = "During your end step, if you have no Blue cards in your baseplate: All allied Blue fighters gain 150 health and power.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 150 },
				{ "Strengthen", 150 }
			},
			Target = "AlliedBlue",
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Blue" }
		},
		Bio = "Frozen and on fire."
	},
	["Kit of Deception"] = {
		Id = 10243165298,
		Name = "Kit of Deception",
		AltCards = {
			["Kit of Deception-Sun"] = {
				Id = 9159865486,
				Name = "Castle Crash",
				Bio = "If you didn't want it to get knocked down, why did you build it out of sand?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Red",
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
	["Ultoris Tenebrae"] = {
		Id = 10243160155,
		Name = "Ultoris Tenebrae",
		Health = 1000,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Archetype = "Ultoris",
		Color = "Red",
		Cost = { Neutral = 7, Red = 1 },
		CustomReminder = {
			["Ultoris NOOBRae"] = "A ⚪⚪⚪🔴 350/100. When it's cast, it and Ultoris gain 350 Health and Power."
		},
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "When this card is cast: Give yourself Ultoris NOOBRae, a 350/100 fighter.",
			Type = "OnSummon",
			Power = { { "Add", "Ultoris NOOBrae" } },
			Target = "Ally"
		},
		Bio = "His army of fanboys will destroy you."
	},
	["Ultoris NOOBrae"] = {
		Id = 10243157765,
		Name = "Ultoris NOOBrae",
		Health = 350,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Slash",
		Archetype = "Ultoris",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1 },
		Effect = {
			Name = "Diagnosed with Noob",
			Description = "When this card is cast: It and allied 'Ultoris Tenebrae' gain 350 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 350 },
				{ "Heal", 350 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "OMG TENEBRAE MORE LIKE TENEBAE HELL REK UR STUFF M8 KEK"
	},
	["Crowd Goes Wild"] = {
		Id = 6786638311,
		Name = "Crowd Goes Wild",
		AltCards = {
			["Crowd Goes Wild-H25"] = {
				Id = 129667498682413,
				Name = "Trick or TRICK!",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Jab",
				Bio = "Nothing's scarier on Halloween than a pack of unmonitored kids!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		EffectAnimation = "CrowdsFavour",
		CustomReminderCF = true,
		Effect = {
			Name = "Power",
			Description = "If you have the Crowd's Favour, deal 700 damage to all enemy fighters. Otherwise draw a card.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "Crowd's Favour", "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "All",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Damage", 700 } },
					Target = "Opponent"
				},
				OnEVCheckFail = {
					Power = { { "Draw", 1 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The infurnished horde flooded the crowd, became the crowd, and wished for triumph against impossible odds."
	},
	Aesura = {
		Id = 10242784896,
		Name = "Aesura",
		AltCards = {
			["Slither the Sky Dragon"] = {
				Id = 8046536587,
				AltArt = true,
				Name = "Slither the Sky Dragon",
				AttackEffect = "Storm",
				Bio = "The slithery sky lizard slid down the slide."
			}
		},
		Health = 2400,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "LaserRed",
		SpecialEffectAnimation = "MidGunEffect",
		Color = "Red",
		Cost = { Red = 8 },
		Effect = {
			Name = "Toasty",
			Description = "When this card is cast: Half the health of all fighters.",
			Type = "OnSummon",
			Power = { { "MultiplyHealth", 0.5 } },
			Target = "All"
		},
		Bio = "Do you deserve a snappy \"Boom, Headshot?\""
	},
	["Dodgeball Gambler Red"] = {
		Id = 6731336212,
		Name = "asimo3089",
		CopyBodge = "Dodgeball Gambler Red",
		AltCards = {
			["Suspiciously Rich Flufflefunz"] = {
				Id = 7724218954,
				AltArt = true,
				Name = "Suspiciously Rich Flufflefunz",
				AttackEffect = "Slash",
				Transformant = "Suspiciously Rich Flufflefunz Token",
				Bio = "\"My motto? Well, if the early bird catches the worm, then just put those worms in mousetraps!\""
			},
			Ambivalence = {
				Id = 114237340809806,
				Name = "Ambivalence",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 619,
				Bio = "i hate us"
			}
		},
		Health = 1000,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		Charge = true,
		Transformant = "Dodgeball Token",
		Effect = {
			Name = "G u n ",
			Description = "Whenever you cast a Legendary fighter: This card gains 200 Power. Transform this card until your next end step. It can't be countered while transformed.",
			Type = "OnAllySummon",
			Power = {
				{ "Strengthen", 200 },
				{ "Transform", "Transformant" }
			},
			Rarity = "Legendary",
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "It's criminal how much I'm gonna enjoy this."
	},
	["Dodgeball Token"] = {
		Id = 6731336212,
		Name = "asimo3089",
		CopyBodge = "Dodgeball Token",
		AltCards = {
			["Suspiciously Rich Flufflefunz Token"] = {
				Id = 7724218954,
				Name = "Suspiciously Rich Flufflefunz",
				Transformant = "Suspiciously Rich Flufflefunz",
				AttackEffect = "Slash",
				Bio = "\"My motto? Well, if the early bird catches the worm, then just put those worms in mousetraps!\""
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		CounterAttackBlock = true,
		Charge = true,
		Transformant = "Dodgeball Gambler Red",
		Effect = {
			Name = "G u n ",
			Description = "During your end step: Untransform this card.",
			Type = "OnEnd",
			Power = { { "Transform", "Transformant" } },
			Target = "Self"
		},
		Bio = "It's criminal how much I'm gonna enjoy this."
	},
	BuildIntoGames = {
		Id = 6688042561,
		Name = "BuildIntoGames",
		Health = 1200,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Paintball",
		Color = "Neutral",
		Cost = { Neutral = 5, Red = 1, Green = 1 },
		Effect = {
			Name = "Totem Magic",
			Description = "Whenever you cast a fighter with total stats 1500 or more: Draw a card.",
			Type = "OnAllySummon",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			SizeClass = "Gigant"
		},
		Bio = "Founder of BIG Games, creator of several famous games like Guest Quest, Giant Survival and BIG Paintball!"
	},
	["Hallow's Extraction"] = {
		Id = 11769926204,
		Name = "Hallow's Extraction",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 2, Red = 2, Green = 2, Blue = 2, Yellow = 2 },
		Addant = "Hallow's Wealth",
		Transformant = "Fundebted Fighter",
		CustomReminder = {
			["Fundebted Fighter"] = "A green fighter. It gains 200 power whenever you cast a fighter with total stats 1500 or greater.",
			["Hallow's Wealth"] = "A free action. All allied fighters gain 200 power and you gain 2{W}{R}{G}{B}{Y}."
		},
		Effect = {
			Name = "Common Icon",
			Description = "All fighters lose 200 Power. Transform them into 'Fundebted Fighters.'\nGive yourself 'Hallow's Wealth.'",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200, "All" },
				{ "Transform", "Transformant", "All" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "\"If you're not paying for it, you're not the customer. You're the product.\" - Lord Umberhallow"
	},
	["Hallow's Wealth"] = {
		Id = 6552019278,
		Name = "Hallow's Wealth",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Addant = "Hallow's Wealth",
		Fading = true,
		Effect = {
			Name = "Common Icon",
			Description = "All fighters gain 200 power.\nYou gain 2{W}{R}{G}{B}{Y}.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 200, "All" },
				{ "Red", 2 },
				{ "Blue", 2 },
				{ "Yellow", 2 },
				{ "Green", 2 },
				{ "Neutral", 2 }
			},
			Target = "Ally"
		},
		Bio = "\"What a pretentious, stuck-up prat, living in such luxury he steals from others! I will teach him how to share.\" - Kara Sinister"
	},
	Despacito = {
		Id = 5983892965,
		Name = "Despacito",
		AltCards = {
			["Despacito 2"] = {
				Id = 5983895496,
				Name = "Despacito 2",
				Bio = "This is so sad. Alexa, play Despacito."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Requirement = { "NotColor", "AllyGenZone", 0, 3, "Neutral" },
		Effect = {
			Name = "Despacito. Quiero respirar tu cuello despacito. Deja que te diga cosas al oído. Para que te acuerdes si no estás conmigo.",
			Description = "Cast only if there are 2 or fewer non-Colourless cards in your baseplate.\nPut all allied fighters into your baseplate.",
			Type = "OnSummon",
			Power = { { "MoveGenZone" } },
			Target = "Ally"
		},
		Bio = "Go commit die."
	},
	["Fat Cat"] = {
		Id = 10184641584,
		Name = "Fat Cat",
		AltCards = {
			["Fat Cat-Xmas"] = { Id = 10184626299, AttackEffect = "Scratch", Bio = "He can haz zzz." }
		},
		Health = 1500,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 6 },
		Shield = true,
		Mitigation = 100,
		Effect = {
			Name = "Snorlaxing",
			Description = "This card takes 100 less damage during combat.",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Self"
		},
		Bio = "He haz regretz of his Chezburger dayz."
	},
	Moded = {
		Id = 4899402892,
		Name = "Moded",
		AltCards = {
			silvermoonninja = {
				Id = 7650371857,
				Name = "silvermoonninja",
				AttackEffect = "Slash",
				EffectAnimation = "LinkedSwordStrike",
				AltArt = true,
				Bio = "Ace the card that ace the deck."
			}
		},
		Health = 800,
		Power = 350,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		EffectAnimation = "MidHammerEffectEnemy",
		Color = "Neutral",
		Cost = { Neutral = 7 },
		Effect = {
			Name = "Scripted Shockwave",
			Description = "When this card is cast: Deal 300 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 300 } },
			Target = "Opponent"
		},
		Bio = "White hat hacker for hire!"
	},
	["Open Floor Plan"] = {
		Id = 11769947733,
		Name = "Open Floor Plan",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 2, Green = 1, Yellow = 1 },
		EffectVariable = 0,
		Archetype = "Infurnished",
		Rank = 7,
		Effect = {
			Name = "Reincarnation",
			Description = "Summon an unranked fighter that costs 5 or fewer total studs from your baseplate unlocked.\nPut a target allied fighter into your baseplate.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{
								"Fighter_5OrLower_Unranked",
								"GenZone_Ally",
								"Field_Ally",
								true,
								false
							},
							"Self"
						},
						{ "Unlock", 9999, "SummonedCard" },
						{ "MoveGenZone", 30, "SingleAlly" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "In the grimy basement of the Pits were the infurnished, forced to toil for their prison's upkeep. Kara took no pity; Rescuing them was merely a valuable asset to bring her husband's murderer down."
	},
	["Felicia, Fundebted Manager"] = {
		Id = 11769921752,
		Name = "Felicia, Fundebted Manager",
		Health = 1050,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Summonant = "Fundebted Fighter",
		CustomReminder = {
			["Fundebted Fighter"] = "Whenever you cast a fighter with total stats 1500 or more: This card gains 200 power."
		},
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a fighter with total stats 1500 or more: Summon a 500/200 'Fundebted Fighter.'",
			Type = "OnAllySummon",
			Power = { { "Summon", "Summonant", "Ally" } },
			SizeClass = "Gigant",
			Target = "Aggressor",
			MetaData = { Health = 500, Power = 200 }
		},
		Bio = "Hi! I'm Felicia! Your primary Fun™️ Manager during your time in the Pits of the Hell-wide acclaimed Lord Umberhallow! Please, take a complementary soda can in the boxes to your right. Now then, in the count of three, let out the most blood-curdling death scream you can muster! Ready? One!"
	},
	["Champion's Cowardice"] = {
		Id = 11769902868,
		Name = "Champion's Cowardice",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Reset the stats of a target allied fighter and set its cost to {G}{G}. Return it to its hand.\nYou can't attack or cast anything else this turn.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Reset" },
						{
							"SetCost",
							{ 2, "Green" }
						},
						{ "Return" },
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
					Target = "SingleAlly"
				}
			},
			RemoveOtherColors = true
		},
		Bio = "As Kara made swift work of Umberhallow's champions, the Crowdpleaser did the unthinkable: Running away like an imposter."
	},
	["Infiltrate the Crowd"] = {
		Id = 11769948583,
		Name = "Infiltrate the Crowd",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 2, Red = 2 },
		EffectVariable = 0,
		CustomReminder = {
			["Infernal Fan"] = "Free colourless action, inert in all zones. When your opponent draws it, they lose 400 life and draw again."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "Shuffle 7 Infernal Fans into your opponent's deck.",
			Ability = {
				OnSummon = {
					Power = {
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" },
						{ "DeckAdd", "Infernal Fan" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "Disguised as chairs and stands, the Infurnished horde silently outnumbered the crowd. Their one wish was for their rescuer to win."
	},
	["Infernal Fan"] = {
		Id = 11769928902,
		Name = "Infernal Fan",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		TokenGenZone = true,
		Token = true,
		TriggerInHand = true,
		AttackEffect = "Gun",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Nightmare!",
			Description = "When this card enters your hand: You lose 400 life. Destroy this card, then draw a card.",
			Type = "OnDrawn",
			Target = "CardOwner",
			Power = {
				{ "RevealCard", 0, "Self" },
				{ "Cost", 400 },
				{ "SpecificDiscard", 1, "AlliedFirstSelfCopy" },
				{ "Draw", 1, "CardOwner" }
			}
		},
		Bio = "The crowds were too busy watching the match to notice the impostors among them."
	},
	["Death Match"] = {
		Id = 11769914115,
		Name = "Death Match",
		AltCards = {
			["Hunting with your Friends"] = {
				Id = 109725840219164,
				Name = "The Tower",
				Terrariant = "Hunting your Friends",
				AltArt = true,
				PremiumArt = 12,
				Bio = " One day out of the blue, I got an email from Coda. To my knowledge it’s the last game he’s ever made.<br/> <br/>So…let’s take a look."
			},
			["Death Match-AWIH"] = {
				Id = 17600824391,
				Name = "Library of Babel",
				Terrariant = "Underdog's Uprising-AWIH",
				AttackEffect = "MagicBlue",
				Bio = "Infinite knowledge, yet no time to digest it all.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		Terrain = true,
		Terrariant = "Underdog's Uprising",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Once each turn, whenever you cast a fighter you have no other copies of in any zone: Search your deck for a fighter that costs fewer total studs than that card.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Save", "Target", "Cost", "CastCardCost" }
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Field_Ally", "Aggressor", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Deck_Ally", "Aggressor", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Hand_Ally", "Aggressor", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "GenZone_Ally", "Aggressor", "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "GraveZone_Ally", "Aggressor", "Nil" }
						},
						{ "EVGreaterValueCheck", 1, "Self" }
					},
					Target = "Aggressor",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = {
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "CastCardCost" }
						},
						{ "RandomTutorfor", "Fighter VariableorLowerCost", "Ally" }
					},
					Target = "Self",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Fourteen to One. Charming Kara and Wise Herrus faced Umberhallow's rigged odds."
	},
	["Arthur Sinister"] = {
		Id = 11772096230,
		Name = "Arthur, Lawyer of the Meek",
		AltCards = {
			["Flufflefunz, Unburdened"] = {
				Id = 12872654560,
				Name = "Flufflefunz, Unburdened",
				AttackEffect = "Jab",
				Transformant = "Experiment 806",
				AltArt = true,
				PremiumArt = 13,
				Bio = "Big chillin'."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		Transformant = "Arthur, Fundebted",
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "0 Charges.\nWhenever you discard a card: You lose 350 life and this card gains a charge. Then if you have 1500 or less life, this card transforms and loses all charges.\nDuring your end step: This card loses all of its charges and you draw that many cards.",
			Ability = {
				OnAllyDiscard = {
					Power = {
						{ "Cost", 350 },
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							"Self"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever you discard a card: You lose 350 life and this card gains a charge. If you have 1500 or less life: This card loses all abilities.\nDuring your end step: This card loses all of its charges and you draw that many cards.",
							"Self"
						}
					},
					Target = "Ally"
				},
				OnLifeLoss = {
					Power = { { "Transform", "Transformant" } },
					Target = "Self",
					EffectRequirement = { "Playertable", "Me", 0, 1501, "Life" }
				},
				OnEnd = {
					Power = {
						{ "Draw", "Variable" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever you discard a card: You lose 350 life and this card gains a charge. If you have 1500 or less life: This card loses all abilities.\nDuring your end step: This card loses all of its charges and you draw that many cards.",
							"Self"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "The first time Kara saw her husband-to-be was as the only lawyer kind enough to defend a brute from accusations of murder. He would do anything to protect his clients. She would do anything for a man as brave as her."
	},
	["Arthur, Fundebted"] = {
		Id = 11772095204,
		Name = "Arthur, Fundebted",
		AltCards = {
			["Experiment 806"] = {
				Id = 12872653676,
				Name = "Experiment 806",
				AttackEffect = "XhartyrSlash",
				Effect = { Description = "" },
				Bio = "- .... . / -.-. . .-. ...- .. -. . / .... .- ... / .--. .- .. -.. / - .... . / ..- .-.. - .. -- .- - . / .--. .-. .. -.-. . / ..-. --- .-. / .... .. ... / --. .-. . . -.."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 2, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Was pushing this man to his breaking point worth it?",
			Ability = {
				Nil = {
					Power = { { "Cost", 999999999999 } },
					Target = "Ally"
				}
			}
		},
		Bio = "The last time Kara saw her husband was as a husk meant for cheap entertainment. She could barely hold in her tears."
	},
	["The Oddsmakers' Cabal"] = {
		Id = 11769947899,
		Name = "The Oddsmakers' Cabal",
		AltCards = {
			["The Oddsmakers' Cabal-Banner"] = {
				Name = "The Quadmaker",
				AttackEffect = "StudBlast",
				Id = 12070334536,
				Bio = "The forbidden fifth oddsmaker, who crawled from the depths of Myrmiredon's nightmares (also known as #fan-card-dump)."
			},
			["The Oddsmakers' Cabal-ET"] = {
				Name = "Entity of Chaos",
				PackDisplayOverride = "Extraterrestrial Lives Art Bundle",
				AttackEffect = "StudBlast",
				Id = 16446075100,
				Bio = "COME CHALLENGER<br/>YOU WILL BE MINE"
			}
		},
		Health = 1000,
		Power = 2000,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 12 },
		TriggerInHand = true,
		SummonAnimation = "RainbowSelf",
		EffectVariable = 0,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "This card costs 2 {W}{W} less for each colour among allied fighters.\nWhen this card is cast: Put a stud of each colour into your Baseplate.",
			Ability = {
				OnSummon = {
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
						}
					},
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
							{ "Set", "Field_Ally", "Chromatic", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 2, "Nil" }
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
		Bio = "They bet on the outcome of each fight, as well as the lives of the Fundebted."
	}
}
