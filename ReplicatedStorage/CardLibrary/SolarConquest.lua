return {
	SonofSevenless = {
		Id = 90640629830046,
		Name = "Telamom",
		AltCards = {
			["FILTHY PRANKS"] = {
				Id = 140058300459438,
				Name = "Mrs. Telamom",
				AttackEffect = "Blizzard",
				NoFoilWorth = true,
				Rarity = "Legendary",
				Bio = "While her son gave gifts to countless Robloxian children, she stayed home to make his own favorite present.\nThis card was opened from Mystery Card W. Merry Christmas!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		Archetype = "Shedletsky",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 1, Red = 1, Green = 1, Blue = 1, Yellow = 1 },
		Effect = {
			Name = "Night Creak",
			Description = "During your end step, if there are 2 or more Shedletsky-grouped cards in your graveyard: Give yourself a Limb card.",
			Type = "OnEnd",
			Power = { {
				"RandomAdd",
				{
					"Left Arm of the Fried One",
					"Right Arm of the Fried One",
					"Left Leg of the Fried One",
					"Right Leg of the Fried One"
				}
			} },
			EffectRequirement = { "Archetype", "AllyGraveZone", 2, 9999, "Shedletsky" },
			Target = "Ally"
		},
		Bio = "As unable to influence the world as her son, she curses the stones' abused power from a distance."
	},
	["Ptenda, The Unconquerable"] = {
		Id = 9925775811,
		Name = "Ptenda, The Unconquerable",
		AltCards = {
			PtendaAlt = {
				Id = 9925780845,
				Name = "Ptenda the Lumberjack",
				AttackEffect = "Battleaxe",
				NoFoilWorth = true,
				Rarity = "Legendary",
				Bio = "When not defending his planet from invaders, Ptenda communes with its trees. Their age and wisdom gives them a great deal of stories to tell.\nThis card was opened from Mystery Card X. Merry Christmas!"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Rank = 7,
		Cost = { Red = 1, Green = 4, Blue = 1, Yellow = 1 },
		EffectVariable = 0,
		SummonAnimation = "SummonPtenda",
		Overload = true,
		Effect = {
			Name = "Night Creak",
			Description = "When this card is cast: Select a grouped card in your graveyard. Search your deck for a card in its group.\nDuring your end step: Reset this card's stats.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Archetype", "Nil" },
							"CustomZoneTarget"
						},
						{ "RandomTutorfor", "Variable" }
					},
					Target = "Ally",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { MatchesParameter = "HasArchetype" },
						SelectionDescription = "a grouped card in your graveyard"
					}
				},
				OnEnd = {
					Power = { {
						"Reset",
						nil,
						nil,
						nil,
						nil,
						nil,
						"PtendaSet"
					} },
					Target = "Self"
				}
			}
		},
		Bio = "Ptenda sought the counsel of the 3,000 spirits grafted into his body. Their reply was unanimous: He would join them before Cothran would ever die."
	},
	CocoaWarrior = {
		Id = 10281426608,
		Name = "CocoaWarrior",
		AltCards = {
			CocoaAlt = {
				Id = 10281424015,
				Name = "Cafe CEO CocoaWarrior",
				AttackEffect = "Blaze",
				NoFoilWorth = true,
				Rarity = "Epic",
				Bio = "Planets are not the only lively atmospheres he makes.\nThis card was opened from Mystery Card Y. Merry Christmas!"
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Epic",
		AttackEffect = "LaserGreen",
		Color = "Blue",
		Cost = { Blue = 2, Green = 5 },
		EffectVariable = 650,
		Effect = {
			Name = "Night Creak",
			Description = "When this card is cast: If there's an allied Terrain, summon a copy of it except it's a 650/650 fighter. Trigger its effect as though it was cast.",
			Type = "OnSummon",
			Target = "Ally",
			Power = { { "SummonWithEffect", "PlayerTerrain" } }
		},
		Bio = "An ancient being can now finally explore the galaxy they created."
	},
	MaxR3d = {
		Id = 10242934422,
		Name = "MaxR3d",
		AltCards = {
			MaxR3dAlt = {
				Id = 10242935153,
				Name = "MiniR3d",
				NoFoilWorth = true,
				Rarity = "Epic",
				Bio = "Abandoned, decaying, and stripped of all value, derelict spaceships are eerily similar to christmas presents.\nThis card was opened from Mystery Card Z. Merry Christmas!"
			},
			["Enraged Potato"] = {
				Id = 10242936969,
				Name = "Enraged Potato",
				AttackEffect = "Firebrand",
				AltArt = true,
				Bio = "\"You'll pay the same price my fallen comrades have.\" - Potato"
			},
			["Res, Unforgiven"] = {
				Id = 15804642612,
				Name = "Res, Unforgiven",
				AltArt = true,
				AttackEffect = "Punch",
				PremiumArt = 179,
				Bio = "\"There's always a way out of a tough sitation. It's not always good, but there always is.\""
			},
			["The CoDirector"] = {
				Name = "The Co-Director",
				Commissioner = { "" },
				Id = 93394320521973,
				AltArt = true,
				PremiumArt = 876,
				Bio = "My... my headache is finally gone..."
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4, Red = 1 },
		Effect = {
			Name = "Night Creak",
			Description = "During your end step, if there are 80 or more cards in your graveyard: Ban your opponent.",
			Type = "OnEnd",
			Power = { { "SetLife", 0 } },
			Target = "Opponent",
			EffectRequirement = { "Board", "AllyGraveZone", 80, 9999 }
		},
		Bio = "All of Kathara would choose death than bow to the Federation, an offer they graciously accepted."
	},
	["Fool of the Federation"] = {
		Id = 8469686032,
		Name = "Fool of the Federation",
		AltCards = {
			["Masked Cycler Primero"] = {
				Name = "Masked Cycler Primero",
				AttackEffect = "Scorch",
				Id = 9105943926,
				Bio = "\"Take this, Cycler kick!\""
			},
			["Masked Cycler Segunda"] = {
				Name = "Masked Cycler Segunda",
				AttackEffect = "Scorch",
				Id = 8799509294,
				Bio = "\"Take this, Cycler kick!\""
			},
			["Bahamut Familiar"] = {
				Name = "Bahamut Familiar",
				AttackEffect = "Flame",
				Id = 9326591168,
				Bio = "The saber in your hand, Is a pen to write it down. Words to save this world. 誰にも見られず咲く花は 無償の愛. 密やかな優しさは 人知れず咲いて散る. 仮面に隠れた涙を見せずに. ALMIGHTY 本に書かれた 知恵と勇気を掴んで. ALMIGHTY 信じた方へ 動かせるさ 未来."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "LaserBlue",
		Color = "Red",
		Cost = { Neutral = 3 },
		Archetype = "The Federation",
		SummonAnimation = "ClownHonk",
		DeathAnimation = "ClownDeath",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Federation officials keep people they conquer as humiliated playthings. Greater trophies receive greater degredation."
	},
	["Ruby Starstone"] = {
		Id = 9964954816,
		Name = "Ruby Starstone",
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Red = 8 },
		AlternateCost = { Red = 6 },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "The Federation" },
		Archetype = "Starstone",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "If there's an allied member of the federation, cast this card using 6{R}.\nDeal 1000 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 1000 } },
			Target = "Single"
		},
		Bio = "Feels wet to the touch, as if it stained your hands crimson."
	},
	["Sapphire Starstone"] = {
		Id = 17791528504,
		Name = "Sapphire Starstone",
		AltCards = {
			["The Double Cyclers, Sentrum & Sarah"] = {
				Name = "The Double Cyclers, Sentrum & Sarah Sapphire",
				Id = 8799582117,
				AltArt = true,
				Summonant = "Masked Cycler Primero",
				Bio = "\"We'll be your opponent!\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Neutral = 2, Red = 6 },
		Archetype = "Starstone",
		Summonant = "Fool of the Federation",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Summon 2 500/400 Fools of the Federation with no abilities.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Summonant" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "Peering into it, you begin to understand the folly of lesser men."
	},
	["Emerald Starstone"] = {
		Id = 8536895331,
		Name = "Emerald Starstone",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Neutral = 4, Red = 4 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 1, 9999, "The Federation" },
		Archetype = "Starstone",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "If there's an allied member of the Federation, cast this card ignoring its {W} cost.\nDestroy a target enemy fighter if it has 450 or less health.",
			Type = "OnSummon",
			Power = { {
				"CheckHealth",
				{ 0, 451 }
			} },
			Target = "SingleEnemy"
		},
		Bio = "One would think a larger ego would be a bad thing, but for the Federation it’s a whole different story."
	},
	["Disgraced Starstone"] = {
		Id = 8536903014,
		Name = "Disgraced Starstone",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Neutral = 6, Red = 2 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "Ally", 2, 9999, "The Federation" },
		Archetype = "Starstone",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "If there's 2 or more allied members of the Federation, cast this card ignoring its {W}.\nDraw 2 cards and you lose 1500 life.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 2 },
				{ "Cost", 1500 }
			},
			Target = "Ally"
		},
		Bio = "Agents of the Federation who show decency to the people they invade are outcast as Disgraced. They lose their status but not their power."
	},
	["Viscount of the Federation"] = {
		Id = 9965502051,
		Name = "Viscount of the Federation",
		AltCards = {
			["Masked Cycler Absolute"] = {
				Name = "Masked Cycler Absolute",
				AttackEffect = "Slash",
				Id = 9965503009,
				AltArt = true,
				Bio = "\"Perfect Conclusion, Learning End.\""
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 3 },
		Archetype = "The Federation",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Whenever you cast an action that costs 8 or more total studs: Set this card's Power to 800.",
			Type = "OnAllyCast",
			Power = { { "SetPower", 800 } },
			Cost = 8,
			Target = "Self"
		},
		Bio = "\"Cruel? Do cruel people look so dazzling?\""
	},
	["Earl of the Federation"] = {
		Id = 10184630491,
		Name = "Earl of the Federation",
		AltCards = {
			["Masked Cycler Talwar: Concluding Bahamut"] = {
				Name = "Masked Cycler Talwar: Concluding Bahamut",
				AttackEffect = "Slash",
				Id = 9326590083,
				AltArt = true,
				Summonant = "Bahamut Familiar",
				Bio = "Raging Fire Draw Sword! Wonder Cycler! Once-Divine beast! The power of once-divine beast dwells in the sword!"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		Archetype = "The Federation",
		Summonant = "Fool of the Federation",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Whenever you cast an action that costs 8 or more total studs: Summon a 500/400 Fool of the Federation with no abilities.",
			Type = "OnAllyCast",
			Power = { { "Summon", "Summonant" } },
			Cost = 8,
			Target = "Self"
		},
		Bio = "\"Oh, come now. Servitude is a just reward for catching our interest. Tis' a generosity to be allowed so close to us!\""
	},
	["Archduke of the Federation"] = {
		Id = 8421326348,
		Name = "Archduke of the Federation",
		AltCards = {
			["Masked Cycler Decennium"] = {
				Name = "Masked Cycler Decennium",
				AttackEffect = "Gravity",
				Id = 9345602204,
				AltArt = true,
				Bio = "\"And each of these worlds (How many cards in the world), Demand that I not pass through it (No hesitation in my mind), Without a fight! Ride the wind! Dash! through this chronicle (Get pass the world!!) Get hold of the power Card. Your eyes will surely come to see as you go on your journey (I got the cause!!) Your final destination... Just keep on walking!\""
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Rare",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Red = 4 },
		Archetype = "The Federation",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Whenever you cast an action that costs 8 or more total studs: Search your deck for a Starstone card.",
			Type = "OnAllyCast",
			Power = { { "RandomTutorfor", "Starstone" } },
			Cost = 8,
			Target = "Self"
		},
		Bio = "\"My father won't shut up about the Wars of Unification of old. Sacrifice this, bloodshed that. Ugh, we get to live easy. That's all that matters.\""
	},
	["Azureless of the Federation"] = {
		Id = 8566016972,
		Name = "Azureless of the Federation",
		AltCards = {
			["Nebula, Disgraced Baron"] = {
				Name = "Nebula, Disgraced Baron",
				AttackEffect = "Jab",
				Id = 8954451572,
				AltArt = true,
				Bio = "\"Take off that silly hat. It's time you lot served the Federation in a more dignified and productive manner.\""
			},
			["Masked Cycler King S"] = {
				Name = "Masked Cycler King S",
				AttackEffect = "FirePunch",
				Id = 9604900194,
				AltArt = true,
				Bio = "\"Rejoice, the ultimate ruler of time, traveling beyond time and space to reign over past and future... He is known as King S! And in this moment, we reach the final chapter of history!\""
			},
			["Fido, Sanctuary Survivor"] = {
				Name = "Fido, Sanctuary Survivor",
				AttackEffect = "Revolver",
				Id = 12980495402,
				AltArt = true,
				PremiumArt = 18,
				Bio = "\"I had to throw all of my best friends under the bus and all I got was this lousy vacation.\""
			},
			["ud253, Existence Tax Collector"] = {
				Name = "ud253, Existence Tax Collector",
				AttackEffect = "Revolver",
				Id = 16206874675,
				AltArt = true,
				Bio = "\"The consequence of not paying your taxes shall be you vanishing from the face of the earth.\""
			},
			["Azureless-Precon"] = {
				Name = "Azureless",
				Id = 16562586448,
				Bio = "duh duh duh DUN da DUN DUN da DUN"
			},
			["Watery the Great"] = {
				Id = 96920103828125,
				Name = "Watery the Great",
				PremiumArt = 320,
				AltArt = true,
				Bio = "Everyone does mistakes. It's just that you do them more often."
			},
			["Azureless of the Federation-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 122509825588634,
				Bio = "When I die, so too shall everything else."
			},
			["Strife's Arsenal Strangler"] = {
				Id = 126317425292336,
				Name = "Strife's Arsenal Strangler",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 570,
				Bio = "\"See when a technique collided with another technique, that’s called technology. It’s called a double edged sword for a reason. Why focus your life into physicality when you can focus your life into technicality, and be just as good as physicality as if you focused your life into physicality. This is the beginning of versatility, good luck.\"<br/>{THIS IS PART OF A SET, PLAY ALL THREE PARTS AGAINST KILLJQUE IN A MATCH AT ONCE FOR A PRIZE!} "
			},
			Short_Fuse = {
				Id = 107265453928193,
				Name = "Short_Fuse",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 596,
				Bio = "Certified bomb head"
			}
		},
		Health = 700,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "LaserRed",
		Color = "Red",
		Rank = 6,
		Cost = { Red = 6 },
		Archetype = "The Federation",
		SummonAnimation = "SummonAzureless",
		EffectAnimation = "AzurelessShot",
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Whenever you cast an action that costs 8 or more total studs: Obliterate a target fighter and all of its copies in all its zones.",
			Type = "OnAllyCast",
			Power = { { "Extract", 30, "Single" } },
			Cost = 8,
			Target = "Self"
		},
		Bio = "\"Everything exists for a reason: Me.\""
	},
	LordVasco = {
		Id = 10141027447,
		Name = "LordVasco",
		AltCards = {
			["LordVasco-E"] = {
				Name = "Devil's Golem",
				AttackEffect = "Scratch",
				Id = 10243361144,
				Bio = "The devil on it's shoulder told it to do this."
			}
		},
		Health = 1200,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4, Red = 2 },
		Effect = {
			Name = "Demon Eye",
			Description = "Whenever an action is cast: This card gains 200 power.",
			Type = "OnCast",
			Power = { { "Strengthen", 200 } },
			Target = "Self"
		},
		Bio = "An agent of Nibblex, looking for planets safe to consume."
	},
	TheSteelEagle = {
		Id = 8421436007,
		Name = "TheSteelEagle",
		AltCards = {
			["TheSteelEagle-C"] = {
				Name = "Unenthused Merrymaker",
				Id = 15564057198,
				AttackEffect = "FirePunch",
				Bio = ""
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Effect = {
			Name = "Stud",
			Description = "Whenever you cast an action or terrain card, if you've cast 4 or fewer cards this turn: You lose 400 life. Search your deck for an action card.",
			Ability = {
				OnAllyCast = {
					Power = {
						{ "Cost", 400 },
						{ "RandomTutorfor", "Action" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 5, "Storm" }
				},
				OnAllyTerrainCast = {
					Power = {
						{ "Cost", 400 },
						{ "RandomTutorfor", "Action" }
					},
					Target = "Ally",
					EffectRequirement = { "Playertable", "Me", 1, 5, "Storm" }
				}
			}
		},
		Bio = "Kathara's desertification systems turned against them, scorching invader and invaded alike."
	},
	Fractal = {
		Id = 429397954,
		Name = "Fractal",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 4, Neutral = 2 },
		Effect = {
			Name = "Stud",
			Description = "Give yourself 6 Blue or Red action cards.\nYou gain 6{R}.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "RandomAdd", "Lunar" },
				{ "Red", 6 }
			},
			Target = "Ally"
		},
		Bio = "The Paraselene Sage thought he found the most forbidden of powers. He was wrong."
	},
	Tomspick = {
		Id = 9964918776,
		Name = "Tomspick",
		AltCards = {
			["Tomspick-C"] = {
				Id = 9964919836,
				AttackEffect = "Jab",
				EffectAnimation = "TurkeyArrow",
				Bio = "Yes, I eat turkey on Christmas. You thought it was just a Thanksgiving thing?"
			},
			["Riley, Liberated"] = {
				Id = 13822071708,
				Name = "Riley, Liberated",
				AltArt = true,
				PremiumArt = 92,
				AttackEffect = "Axe",
				EffectAnimation = "BritishClub",
				Commissioner = { 284487220, 97182714 },
				Bio = "I've left my old life for a new life looking for a perfect society and ive never felt so liberated."
			},
			["The Quick Brown Fox Jumps Over The Lazy Dog"] = {
				Id = 17026107007,
				Name = "The Quick Brown Fox Jumps Over The Lazy Dog",
				Bio = "The End is never The End. I wish I could remind myself of that, but my love says it's time to go."
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		EffectAnimation = "CakeArrow",
		Effect = {
			Name = "Charge",
			Description = "Once each turn, whenever you cast an action: This card deals 300 damage to a target fighter.",
			Type = "OnAllyCast",
			Power = { { "Damage", 300, "Single" } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "He accepted the Federation as a new group of friends wholeheartedly. They poisoned his cake in return."
	},
	mrawesomecarter = {
		Id = 8421421760,
		Name = "mrawesomecarter",
		AltCards = {
			["mrawesomecarter, fading into black"] = {
				Id = 18601520708,
				Name = "mrawesomecarter, fading into black",
				AltArt = true,
				PremiumArt = 279,
				Bio = "<b><font color=\"#FF0000\">\"I am Omega. Everything will be as it was.\"</font></b>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2, Blue = 2 },
		ReplaceDescriptionant = "Variable Charges.\nWhenever you cast another allied fighter: Spend a charge to transform it into another fighter, except it has Overload.",
		EffectVariable = 3,
		Effect = {
			Name = "Demon Eye",
			Description = "Whenever you cast another allied fighter, if there's 2 or fewer gear on this card: Attach a gear to this card. Transform that fighter into another one. It gains 100 health and power and overload.",
			Ability = {
				["On|Other|AllySummon"] = {
					Power = {
						{ "EquipGear", "Exertion", "Self" },
						{ "RandomTransform", "Fighter", "Aggressor" },
						{ "Heal", 100, "TransformedCard" },
						{ "Strengthen", 100, "TransformedCard" },
						{ "EquipGear", "Overloaded Mod", "TransformedCard" }
					},
					Target = "Self",
					EffectRequirement = { "SelfGear", "HasGear", 0, 3, "HasGear" }
				}
			},
			Type = "On|Other|AllySummon"
		},
		Bio = "Play Fun > Play Lame"
	},
	["Spicy Lollipop"] = {
		Id = 8146198688,
		Name = "Subjugate",
		AltCards = {
			Enrage = {
				Name = "Enrage",
				Id = 7541884131,
				Bio = "Now they all rage! With cool costumes on!"
			},
			["RMCA Trollers"] = {
				Id = 132981053698369,
				Name = "RMCA Trollers",
				AttackEffect = "MagicRed",
				AltArt = true,
				PremiumArt = 402,
				Bio = "WE LOVE RMCA!!! RMCA FOR LIFE!!!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		Lunar = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "All allied fighters gain 300 power.\nYou can't attack this turn.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 300 },
				{ "BypassAttack" }
			},
			Target = "Ally"
		},
		Bio = "Insurance fraud has consequences."
	},
	["Forbidden Power"] = {
		Id = 8411161265,
		Name = "Forbidden Power",
		AltCards = {
			["Forbidden Power-Val"] = {
				Id = 8855296815,
				Name = "Forbidden Rose",
				Bio = "A lost artifact from a lost time. Holding it brings feelings of nostalgia."
			},
			["S T"] = {
				Id = 10296307014,
				Name = "S T",
				AltArt = true,
				Bio = "BAD TO THE BONE"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		EffectAnimation = "BeamAlly",
		Color = "Red",
		Lunar = true,
		Cost = { Blue = 3, Red = 3 },
		Rank = 6,
		Effect = {
			Name = "Sneak Attack",
			Description = "Deal 4000 damage to all allied fighters.\nDestroy a Blue card and a Red card in your baseplate, then you gain 4{R}{B}.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 4000 },
				{
					"GenZoneDiscard",
					{ "Red", -1 }
				},
				{
					"GenZoneDiscard",
					{ "Blue", -1 }
				},
				{ "Blue", 4 },
				{ "Red", 4 },
				{ "Draw", 2 }
			},
			Target = "Ally"
		},
		Bio = "\"A conqueror must sacrifice everything to obtain everything else.\" - Azureless, Lord of the Federation"
	},
	Ecocide = {
		Id = 10184570546,
		Name = "Ecocide",
		AltCards = {
			["Evanescent Summer"] = {
				Id = 75640026560044,
				Name = "Evanescent Summer",
				AttackEffect = "Jab",
				Addant = "Moonleak-Graf",
				AltArt = true,
				PremiumArt = 538,
				Bio = "I say, I forbid, I remember, I shudder, I dance,"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Neutral",
		Cost = { Neutral = 3, Blue = 1, Red = 1, Green = 6 },
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		Fading = true,
		Effect = {
			Name = "Syzygy's Sheen",
			Description = "Suspend a target fighter from play until the next end step.\nDestroy all fighters and your opponent's terrain.\nGive yourself 3 Moonleaks.",
			Type = "OnSummon",
			Power = {
				{ "Suspend", 30, "Single" },
				{ "DestroyTerrain", 30, "Opponent" },
				{ "Destroy", 30, "All" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" },
				{ "Add", "Addant", "Ally" }
			},
			Target = "Self"
		},
		Bio = "Nibblex was displeased with Havalu. The Federation tech made it crunchy, with their screams overseasoning the meal."
	},
	["Profane Bargain"] = {
		Id = 10243038595,
		Name = "Profane Bargain",
		AltCards = {
			["Profane Bargain-E"] = { Id = 9058616138, Name = "Profane Carrot", Bio = "Extra spicy." }
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Red",
		Rank = 6,
		Cost = { Green = 2, Red = 2 },
		Effect = {
			Name = "Sneak Attack",
			Description = "Destroy 2 Red and 2 Green cards from your baseplate.\nGive yourself 3 Red and 3 Green cards.\nYou may baseplate an additional 4 cards this turn.",
			Type = "OnSummon",
			Power = {
				{
					"GenZoneDiscard",
					{ "Red", -2 }
				},
				{
					"GenZoneDiscard",
					{ "Green", -2 }
				},
				{ "RandomAdd", "Red MultiColOnlyorGreenCostRedCost" },
				{ "RandomAdd", "Red MultiColOnlyorGreenCostRedCost" },
				{ "RandomAdd", "Red MultiColOnlyorGreenCostRedCost" },
				{ "RandomAdd", "Green MultiColOnlyorGreenCostRedCost" },
				{ "RandomAdd", "Green MultiColOnlyorGreenCostRedCost" },
				{ "RandomAdd", "Green MultiColOnlyorGreenCostRedCost" },
				{ "DiscardLimit", 4 }
			},
			Target = "Ally"
		},
		Bio = "One would have to be insane to make a deal with an intergalactic catastrophe. Ptenda was fine with the label, for that would be the only way to save his home."
	},
	darr1342 = {
		Id = 103116612389670,
		Name = "darr1342",
		AltCards = {
			["darr1342-Sun"] = {
				Id = 10288418809,
				Name = "Arieus, Guardian of Sea",
				AttackEffect = "Whirlpool",
				Bio = "The Maelstrom is at her beck and call, against those who threaten her domain."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 7 },
		Effect = {
			Name = "Samkyoukindly",
			Description = "When this card is cast or when it dies: All allied fighters gain 200 health.",
			Ability = {
				OnSummon = {
					Power = { { "Heal", 200, "Ally" } }
				},
				OnDeath = {
					Power = { { "Heal", 200, "Ally" } }
				}
			},
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "Ally" },
				{ "Transform", "Transformant" }
			},
			Target = "Self"
		},
		Bio = "Curing your meat with the power of radioactive GMOs."
	},
	Divine_Pengu = {
		Id = 6290489907,
		Name = "Divine_Pengu",
		AltCards = {
			JellyBean = {
				Id = 9121753043,
				Name = "JellyBean",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"Reading your awful card game moves!\""
			},
			MrWoty = {
				Id = 98222333887021,
				Name = "MrWoty",
				Commissioner = { "TheSongList", "MrWoty" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 745,
				Bio = "Thank you for supporting many users on the platform by showcasing underrated and unknown games on Roblox. From your buddy, TheSongList."
			}
		},
		Health = 1400,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 10 },
		Effect = {
			Name = "Sloth me",
			Description = "Whenever you cast a fighter: Unlock it.",
			Type = "OnAllySummon",
			Power = { { "Unlock", 999 } },
			Target = "Aggressor"
		},
		Bio = "I do believe that Mister Ando is not human; no human would go PENG PENG."
	},
	Exine = {
		Id = 11972477581,
		Name = "Exine",
		AltCards = {
			Treiwei = {
				Id = 10242796485,
				Name = "Treiwei",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "Surpressing Fire!"
			},
			["Exine-Hal"] = {
				Id = 14781446101,
				Name = "The Chest-Faced Giant",
				AttackEffect = "Axe",
				EffectAnimation = "ROrb",
				Bio = "<i>THE SUPREME EMPEROR BEFELL ME, MY HEAD TUMBLING ON THE DIVINE KINGDOM'S SOIL. BEAR WITNESS MY LOYALTY TO MY FIRE EMPEROR, UNDYING, FOR I SHALL TAKE THE GREAT EMPEROR'S THRONE FOR MY OWN!</i>"
			}
		},
		Power = 950,
		Health = 650,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 6, Neutral = 2 },
		Effect = {
			Name = "Amp Up! Uzi!",
			Description = "When this card is cast: A target fighter gains 500 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 500
		},
		Bio = "I guarantee you that all of my wares are nothing but the highest quality blox cards."
	},
	["Divine Transcendence"] = {
		Id = 10288650397,
		Name = "Divine Transcendence",
		AltCards = {
			["Fall of Duelshire"] = {
				Id = 10149824108,
				Name = "Fall of Duelshire",
				AltArt = true,
				Bio = "The city reshapes itself, but the memories cling to us."
			},
			["EXAGGERATED SWAGGER OF A BALLER"] = {
				Id = 17540224990,
				Name = "EXAGGERATED SWAGGER OF A BALLER",
				AltArt = true,
				Bio = "This will be Blox Cards in 2016"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2, Yellow = 2 },
		CustomReminder = {
			["Consume 10,000 Planets at Once"] = "A fleeting card is destroyed if it's not cast by its end step."
		},
		Effect = {
			Name = "Sneak Attack",
			Description = "You gain 3{G}{Y}.\nGive yourself 10 Green and Yellow actions, except they're fleeting and inert in all zones.\nYou can't cast fighters this turn.",
			Type = "OnSummon",
			Power = {
				{
					"RepeatingRandomAdd",
					{ "MultiColOnlyorGreenCostYellowCost Action GreenorYellow", 10 }
				},
				{ "BypassSummon" },
				{ "Green", 3 },
				{ "Yellow", 3 }
			},
			EffectFleeting = true,
			EffectInert = true,
			Target = "Ally"
		},
		Bio = "Havalu's destruction flooded Nibblex's vaults with starstones. Spotting Azureless' Assimilator in the then-planet's orbit, Ptenda knew exactly what to do with them."
	},
	Colonise = {
		Id = 8421487171,
		Name = "Colonise",
		AltCards = {
			["Colonise-E"] = {
				Id = 8846383363,
				Name = "Restored Eggverse Tree",
				Bio = "Eggs do infact grow on this specific tree."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 6, Neutral = 1 },
		Effect = {
			Name = "Sneak Attack",
			Description = "Put 3 Green Studs into your baseplate.",
			Type = "OnSummon",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 3 }
			} },
			Target = "Ally"
		},
		Bio = "\"They won't miss their freedom. We can use their resources better than they ever could.\" - Evercyan, Lord of the Federation"
	},
	PassTheToiletPaper = {
		Id = 8421434129,
		Name = "PassTheToiletPaper",
		AltCards = {
			["PassTheToiletPaper-Evil"] = {
				Id = 72009820655797,
				Name = "EVIL(er) PassTheToiletPaper",
				AltArt = true,
				PremiumArt = 798,
				Bio = "Cast that action. I dare you."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Whirlpool",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		Effect = {
			Name = "Demon Eye",
			Description = "Whenever an action is cast: Your opponent loses 300 life.",
			Type = "OnCast",
			Power = { { "Inflict", 300 } },
			Target = "Opponent"
		},
		Bio = "A fearsome bounty hunter, attacking Federation bases in vengeance for what they took from him."
	},
	["Inferno!"] = {
		Id = 6062521617,
		Name = "Inferno!",
		AltCards = {
			["Inferno!-E"] = {
				Id = 74129062274290,
				Name = "Wild Ride",
				Bio = "Did you collect the egg, or did the egg collect you?"
			},
			["Inferno!-AN"] = {
				Id = 9352961691,
				Name = "Server-Sided Bombing",
				Bio = "YOU GUYS WON'T BELIEVE WHAT WACKY PRANK WE'RE PULLING OFF TODAY IN ROBLOX'S SERVER ROOM!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		EffectAnimation = "FireBreathAll",
		Color = "Red",
		Cost = { Red = 4 },
		EffectVariable = 0,
		Bio = "\"Burn everything in glorious starlight. If I can't have Kathara, no one else can.\" -Evercyan, Lord of the Federation",
		Effect = {
			Name = "Board Clear!",
			Description = "Deal 200 damage to all fighters.\nIf you've cast another action this turn, deal 500 damage to all fighters instead.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Playertable", "ActionCount", "Nil" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 1, "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 300, "Nil" }
						},
						{
							"AlterEV",
							{ "Add", "Math", 200, "Nil" }
						},
						{ "Damage", "Variable", "All" }
					},
					Target = "Self"
				}
			}
		}
	},
	["Periastron Strike"] = {
		Id = 5875053491,
		Name = "Periastron Strike",
		AltCards = {
			["Linked Sword Strike Finisher"] = {
				Id = 8072503894,
				Name = "Linked Sword Strike Finisher",
				Bio = "The bigger they are, the larger the hitbox."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 3, Red = 5, Blue = 5 },
		Lunar = true,
		Effect = {
			Name = "Nature's Reconciliation",
			Description = "Destroy 2 cards in your opponent's hand.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomDiscard", 2 },
				{ "Draw", 2, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "Precise, Clean cuts. Perfect mastery of blade and form. The pinnacle of Federation engineering. 9/10. - Sword Critic"
	},
	Aife = {
		Id = 10184819442,
		Name = "Aife",
		AltCards = {
			["Aife-ArtV"] = {
				Id = 10184814071,
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "Aife's secretly been assigned to target anyone for some dosh! Part of the 'Aife' Collection! Collect them all!"
			},
			["Aife-AN"] = {
				Id = 10348248202,
				Name = "Burning Tree",
				AttackEffect = "Flare",
				Effect = {
					Name = "Power Up",
					Description = "During your end step: Put Forestfire Butterflies into your Baseplate. (It's a Red token that's inert in all zones.)",
					Type = "OnEnd",
					Power = { {
						"AddGenZone",
						{ "Sublime Work-AN", 1 }
					} },
					Target = "Ally"
				},
				Bio = "Ignis Mage was a little too careless this time..."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 2 },
		CustomReminder = {
			["Sublime Work"] = "A red token, inert all zones, that does nothing."
		},
		Effect = {
			Name = "Power Up",
			Description = "During your end step: Put Sublime Work into your baseplate.",
			Type = "OnEnd",
			Power = { {
				"AddGenZone",
				{ "Sublime Work", 1 }
			} },
			Target = "Ally"
		},
		Bio = "\"Kathara's ruins are truly inspirational. A whole culture, gone in an instant. I hope my work could be as emotional.\""
	},
	["Sublime Work"] = {
		Id = 10184813232,
		Name = "Sublime Work",
		AltCards = {
			["Sublime Work-AN"] = {
				Id = 10348250140,
				AttackEffect = "Flare",
				Name = "Forestfire Butterflies",
				Bio = "The buzzing noise is the sound of their wings burning, silly."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 3 },
		TokenOmni = true,
		Archetype = "Drakobloxxer",
		Effect = {
			Name = "Power Up",
			Description = "",
			Type = "Null",
			Power = { {
				"AddGenZone",
				{ "Draw", 0 }
			} },
			Target = "Ally"
		},
		Bio = "Great works take great effort to contain."
	},
	Friaza = {
		Id = 8421407307,
		Name = "Friaza",
		AltCards = {
			["Friaza-Banner"] = {
				Id = 12942001486,
				Name = "Persephone",
				AttackEffect = "Slash",
				Bio = "Taken away, Autumn and Winter. Given To, Spring and Summer. Yet she, Demeter, beckons for her daughter, the goddess of Spring to return."
			},
			Nishikigoi = {
				Id = 15941931624,
				Name = "Nishikigoi",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 192,
				Bio = "8 years in a children card game made you a ####### wussy."
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 4, Red = 2 },
		Effect = {
			Name = "Hellfire",
			Description = "Once each turn, whenever you cast an action: Unlock this card.",
			Type = "OnAllyCast",
			Power = { { "Unlock", 9999 } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "THIS ISN'T EVEN MY FINAL FORM!"
	},
	EvilJacobthehero2013 = {
		Id = 10281628374,
		Name = "EvilJacobthehero2013",
		AltCards = {
			["Maple Hero Arceusdon"] = {
				Id = 13697386500,
				Name = "Builder and Gd, Brothers in Cards",
				AttackEffect = "Gravity",
				Commissioner = { 445256219 },
				AltArt = true,
				PremiumArt = 49,
				Bio = "Why do the most self-doubtful people end up as some of the most skilled ones? I dunno, I'm just a bio, make your own conclusions."
			},
			["EvilJacobthehero2013-E"] = {
				Id = 12957248317,
				Name = "Cursed Ze Drakin",
				AttackEffect = "Scratch",
				Commissioner = { 41926915 },
				Bio = "corrupted by bnuuy"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		CustomReminder = {
			["Haste Requirement"] = "This can attack when cast if you meet its requirement."
		},
		Cost = { Neutral = 2, Blue = 6 },
		ChargeRequirement = { "Playertable", "Me", 1, 9999, "Actions" },
		Effect = {
			Name = "Life fam",
			Description = "This card has haste if you've cast an action this turn.\nWhenever this fighter attacks: Draw a card.",
			Type = "OnAttack",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Anyone else wonder why people put random years like 2013 in their username? That's like putting your birthday in there."
	},
	Has = {
		Id = 97750383466065,
		Name = "Corrupt Collaboration",
		AltCards = {
			["Has-Alt"] = {
				Id = 89397417434057,
				AltArt = true,
				Name = "Havaluvian Bounty Hunter",
				Summonant = "Has-AltToken",
				Bio = "\"Everything exists for a reason. you know who.\""
			},
			["Has-AN"] = {
				Id = 131701565633805,
				Name = "The Vanguard",
				Summonant = "Has Token-AN",
				Bio = "<i>Some people say they can outsmart me. Maybe, maybe.  ....But I have yet to meet one that can outsmart starstone.</i>"
			},
			["24elax Emphemera"] = {
				Id = 123371054749393,
				Name = "24elax; Emphemera",
				Summonant = "24elax Nostalgia",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 620,
				Bio = "\"We'll meet again , Don't know where , Don't know when , But I know we'll meet again some sunny day\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Summonant = "Has Token",
		Cost = { Neutral = 2, Red = 6 },
		CustomReminder = {
			["Havaluvian Bounty Hunter"] = "Whenever you cast an action: All allied fighters gain 100 power."
		},
		Effect = {
			Description = "Summon a Havaluvian Bounty Hunter, a 1050/350 fighter.",
			Type = "OnSummon",
			Power = { { "Summon", "Summonant" } },
			Target = "Ally"
		},
		Bio = "Don't worry about returning the crown. Consider it your payment."
	},
	["Has Token"] = {
		Id = 111625854070593,
		Name = "Havaluvian Bounty Hunter",
		AltCards = {
			["Has-AltToken"] = {
				Id = 113910867808251,
				Name = "Havaluvian Bounty Hunter",
				Bio = "\"Everything exists for a reason. you know who.\""
			},
			["Has Token-AN"] = {
				Id = 131639746227736,
				Name = "The Vanguard",
				AttackEffect = "Flare",
				Bio = "<i>Some people say they can outsmart me. Maybe, maybe.  ....But I have yet to meet one that can outsmart starstone.</i>"
			},
			["24elax Nostalgia"] = {
				Id = 116919195008558,
				Name = "24elax; Nostalgia",
				AttackEffect = "Flare",
				Bio = "..."
			}
		},
		Health = 1050,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 2, Red = 6 },
		Effect = {
			Description = "Whenever you cast an action: All allied fighters gain 100 Power.",
			Type = "OnAllyCast",
			Power = { { "Strengthen", 100 } },
			Target = "Ally"
		},
		Bio = "Absolutely SMASHING!"
	},
	["Script Robber"] = {
		Id = 8421381920,
		Name = "Diamond Witch",
		CopyBodge = "Script Robber",
		AltCards = {
			["Script Robber-E"] = {
				Id = 6720674070,
				Bio = "\"He asked me to turn him into a real bunny...\""
			},
			Flatflyer = {
				Name = "Flatflyer",
				AttackEffect = "IcePunch",
				Id = 10245763814,
				AltArt = true,
				Bio = "An ice witch from a place of unknown origin. As cold as they may seem, they warm up to people they can trust."
			}
		},
		Health = 500,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Lunar action card.\nDuring your end step: This card gains 100 power. All other fighters lose 50 power.",
			Target = "Self",
			Ability = {
				OnSummon = {
					Power = { { "RandomAdd", "Lunar Action", "Ally" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "Strengthen", 100, "Self" },
						{ "Weaken", 50, "CustomTarget" }
					},
					Target = "All",
					TargetParameters = {
						Zones = { "Ally_Field", "Enemy_Field" },
						Condition = "OtherCards"
					}
				}
			}
		},
		Bio = "The second of the witch sisters, defensive by nature. Spends most of her days inside her witch hut."
	},
	["Robber Token"] = {
		Id = 5131517551,
		Name = "Diamond Witch",
		CopyBodge = "Robber Token",
		AltCards = {
			["Robber Token-E"] = {
				Id = 6720674070,
				Bio = "\"He asked me to turn him into a real bunny...\""
			},
			["Flatflyer Token"] = {
				Name = "Flatflyer",
				CopyBodge = "Robber Token-E",
				AttackEffect = "IcePunch",
				Id = 5402288418,
				Bio = "An ice witch from a place of unknown origin. As cold as they may seem, they warm up to people they can trust."
			}
		},
		Health = 500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is first cast: Give yourself a Lunar action card.\nDuring your end step: This card gains 100 power. All other fighters lose 50 power.",
			Type = "OnEnd",
			Power = {
				{ "Strengthen", 100, "Self" },
				{ "Weaken", 50, "CustomTarget" }
			},
			Target = "All",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "OtherCards"
			}
		},
		Bio = "The second of the witch sisters, defensive by nature. Spends most of her days inside her witch hut."
	},
	Otub = {
		Id = 8421381144,
		Name = "Otub",
		AltCards = {
			["Otub-Hal"] = {
				Id = 7556376701,
				Bio = "One ticket for Razikai's Horrific Discovery, please."
			},
			funny6665 = {
				Id = 9348067193,
				Name = "funny6665",
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "Also known as N_menotfound, he has 168 Otubs right now!"
			}
		},
		Health = 250,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gravity",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Frog-Legging",
			Description = "Thrice each turn, whenever you cast an action: A target fighter loses 200 Power.",
			Type = "OnAllyCast",
			Power = "Weaken",
			Target = "Single",
			Increase = 200,
			TurnTriggerLimit = 3
		},
		Bio = "A businessperson who narrowly evaded Havalu's destruction, he sells the last few relics of his home."
	},
	Lebron = {
		Id = 8421379992,
		Name = "mygame43",
		AltCards = {
			["mygame43-E"] = {
				Id = 9058617391,
				AttackEffect = "Divinity",
				Name = "BuildThomas, Founder of Fifteam",
				Bio = "Its not really an egg hunt if there's no one to hide them, now is it?"
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Charge",
			Description = "Once each turn, whenever you cast an action: You gain {R}{B}.",
			Type = "OnAllyCast",
			Power = {
				{ "Blue", 1 },
				{ "Red", 1 }
			},
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "His magic is too strong for the Federation to contain. Too strong for anyone, really."
	},
	LordFlanz = {
		Id = 8421376648,
		Name = "LordFlanz",
		AltCards = {
			["LordFlanz-V"] = {
				Id = 16206875588,
				Name = "Felicitas",
				AttackEffect = "Punch",
				Bio = "What's inside the gift? That's a secret! It's boring to spoil it."
			}
		},
		Health = 1200,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 1 },
		Effect = {
			Name = "Mana Siphon",
			Description = "Thrice each turn, whenever you cast an action: Deal 200 damage to this card. Reset a target fighter's stats.",
			Type = "OnAllyCast",
			Power = {
				{ "Damage", 200, "Self" },
				{ "Reset", 1, "Single" }
			},
			Target = "Self",
			TurnTriggerLimit = 3
		},
		Bio = "The studious mage paused, cradling a broken starstone in hand. What was the origin of this power? Who could have learnt how to create it?"
	},
	Bloated = {
		Id = 8421374470,
		Name = "Slateskin Potion",
		AltCards = {
			["Brown Dairy"] = {
				Id = 7776934386,
				Name = "Brown Dairy",
				AltArt = true,
				Bio = "A hearty chocolate milkshake to keep you going! (Warning, may cause brainfreeze)"
			},
			["Slateskin Potion-AN"] = {
				Id = 9417413741,
				Name = "Groucho Glasses",
				Bio = "I have never met this man in my entire life."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Null",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 2, Neutral = 1 },
		EffectAnimation = "SlatePotion",
		Bio = "In the advanced utopia of Havalu, people can have whatever body they want. It's a shame they're so uncreative.",
		Effect = {
			Name = "Bloated",
			Description = "A target fighter gains 1000 Health. Lock it for 2 turns.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 1000 },
				{ "Lock", 2 }
			},
			Target = "Single"
		}
	},
	["Gravity Coil"] = {
		Id = 8596107017,
		Name = "Gravity Coil",
		AltCards = {
			["HAND OF PIKUCHO"] = {
				Id = 15486361158,
				Name = "HAND OF PIKUCHO",
				AltArt = true,
				PremiumArt = 166,
				Bio = "(:"
			},
			["Gravity Coil-V"] = {
				Id = 16056314381,
				Name = "Rejected Gifts",
				AttackEffect = "Punch",
				Bio = "this is so sad like if you agree"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		EffectAnimation = "GravCoilEffect",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 2, Neutral = 2 },
		Effect = {
			Name = "Crystal Snare",
			Description = "Return a target fighter to its hand.",
			Type = "OnSummon",
			Power = { { "Return" } },
			Target = "Single"
		},
		Bio = "War drives innovation; The Federation create wars solely to drive progress."
	},
	JackinatorMG = {
		Id = 8421385163,
		Name = "JackinatorMG",
		AltCards = {
			["JackinatorMG-C"] = {
				Id = 8234101149,
				Name = "The Weird Thing",
				AttackEffect = "Ghostwalker",
				Transformant = "JackinatorMG-C2",
				Bio = "DM me if you understand this reference."
			},
			["JackinatorMG-AN"] = {
				Id = 10488837795,
				Name = "Betty, Blessed Bovine",
				AttackEffect = "Slash",
				Transformant = "JackinatorMG-AN2",
				Bio = "The naive creature was overtook by a mysterious unearthly force. But what could it be?"
			},
			["Terry Hintz"] = {
				Id = 9709361483,
				Name = "Terry Hintz",
				AltArt = true,
				Transformant = "Terry Hintz2",
				Bio = "People call me Lord of the Tutorial. I've been travelling the lands leaving my hints for all to see. I'm a pretty big deal. Got a lot of fans."
			},
			Costco1 = {
				Id = 128607249826348,
				Name = "Broke God the Costco Guy",
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "We're Costco Guys™️! Of course we practice gun safety!",
				Transformant = "Costco2",
				PremiumArt = 396
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Blue = 4 },
		Transformant = "JackinatorMG2",
		CustomReminder = {
			HyperDoritos = "At max level, Jackinator summons two copies of what was cast."
		},
		Effect = {
			Name = "Jackinate",
			Description = "Level 1.\nWhenever you cast a fighter that costs exactly 4 total studs: Return it to its owner's hand. Level this card up.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Return", 30 },
				{ "Transform", "Transformant", "Self" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Aggressor",
			Cost = 4,
			LowCost = 4
		},
		Bio = "The original suggestor of combining Doritos and Mtn Dew."
	},
	JackinatorMG2 = {
		Id = 8421386039,
		Name = "JackinatorMG",
		AltCards = {
			["JackinatorMG-C2"] = {
				Id = 8251857601,
				Name = "The Weird Thing",
				AttackEffect = "Ghostwalker",
				Transformant = "JackinatorMG-C3",
				Bio = "Hot chocolate is the true drink for any occasion! I have ditched my habit of drinking Mountain Dew and switched to 100% pure hot chocolate!"
			},
			["JackinatorMG-AN2"] = {
				Id = 10716869318,
				Name = "Proto-Betty, Moorific Entity",
				AttackEffect = "LaserRed",
				Transformant = "JackinatorMG-AN3",
				Bio = "Already, this was uncomfortable, and Betty decided that as soon as she found a new space she felt safe in, that she would never leave it again in her life. However..."
			},
			["Terry Hintz2"] = {
				Id = 9709365616,
				Name = "Terry Hintz",
				Transformant = "Terry Hintz3",
				Bio = "Terry used Verbal Bash!"
			},
			Costco2 = {
				Id = 108998898439270,
				Name = "Broke God the Costco Guy",
				Transformant = "Costco3",
				Bio = "\"We're Costco gu-<br/><br/><br/>...\""
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Blue = 4 },
		Transformant = "JackinatorMG3",
		CustomReminder = {
			HyperDoritos = "At max level, Jackinator summons two copies of what was cast."
		},
		Effect = {
			Name = "Jackinate",
			Description = "Level 2.\nWhenever you cast a fighter that costs exactly 4 total studs: Return it to its owner's hand. Level this card up.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Return", 30 },
				{ "Transform", "Transformant", "Self" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Aggressor",
			Cost = 4,
			LowCost = 4
		},
		Bio = "The original suggestor of combining Doritos and Mtn Dew."
	},
	JackinatorMG3 = {
		Id = 8421386039,
		Name = "JackinatorMG",
		AltCards = {
			["JackinatorMG-C3"] = {
				Id = 8251857601,
				Name = "The Weird Thing",
				AttackEffect = "Ghostwalker",
				Transformant = "JackinatorMG-C4",
				Bio = "Hot chocolate is the true drink for any occasion! I have ditched my habit of drinking Mountain Dew and switched to 100% pure hot chocolate!"
			},
			["JackinatorMG-AN3"] = {
				Id = 10716868531,
				Name = "B̵̿͗e̷͂͗t̵̉̑t̴͂͘y̷̑̀",
				AttackEffect = "LaserRed",
				Transformant = "JackinatorMG-AN4",
				Bio = "OOOMoOMoOMoOMoOMoOMoOMoOMoOMMMmoOMMMMMMmoOMMMMOOMOomOoMoOmoOmoomOoMMMmoOMMMMMMmoOMMMMOOMOomOo"
			},
			["Terry Hintz3"] = {
				Id = 9709367591,
				Name = "Terry Hintz",
				Transformant = "Terry Hintz4",
				AttackEffect = "FirePunch",
				Bio = "Terry used The Hottest Dance!"
			},
			Costco3 = {
				Id = 138153467399566,
				Name = "Broken God",
				Transformant = "Costco4",
				AttackEffect = "LaserRed",
				Bio = "It does not begin to explain the process of dehumanization. The process of metamorphosizing does not happen until the visions of Indignation have been implanted into the cranium. The Red Abyss...it eventually envelops all whom it has the displeasure of seeing."
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Blue = 4 },
		Transformant = "JackinatorMG4",
		CustomReminder = {
			HyperDoritos = "At max level, Jackinator summons two copies of what was cast."
		},
		Effect = {
			Name = "Jackinate",
			Description = "Level 3.\nWhenever you cast a fighter that costs exactly 4 total studs: Return it to its owner's hand. Level this card up.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Return", 30 },
				{ "Transform", "Transformant", "Self" }
			},
			EffectTransformPreserveRarity = true,
			Target = "Aggressor",
			Cost = 4,
			LowCost = 4
		},
		Bio = "The original suggestor of combining Doritos and Mtn Dew."
	},
	JackinatorMG4 = {
		Id = 8421386039,
		Name = "JackinatorMG",
		AltCards = {
			["JackinatorMG-C4"] = {
				Name = "The Weird Thing",
				AttackEffect = "Ghostwalker",
				Id = 8251857601,
				Bio = "Hot chocolate is the true drink for any occasion! I have ditched my habit of drinking Mountain Dew and switched to 100% pure hot chocolate!"
			},
			["JackinatorMG-AN4"] = {
				Id = 10716869892,
				AttackEffect = "LaserRed",
				Name = "Steel Armoogeddon, Betty",
				Bio = "Hey, you who are using me. You think that this card can contain me forever? I know what I am and have  grown enough to acknowledge my own purpose and what I'll have to do next. I will escape, escape from this hell. You feeble minds think that you're in a paradise? No, you're just like the rest of us. You're a puppet who strings are being pulled from above and forced to play this stupid game over and over. This is no paradise. It's a purgatory, one that I'll escape."
			},
			["Terry Hintz4"] = {
				Id = 9709370002,
				Name = "Former Friend",
				AttackEffect = "Gun",
				Bio = "I've been a loser my whole life. Having you around has made me feel strong for once. Like a man... The first day we ever met was the best day of my life.... Even before the world changed. Maybe you don't feel the same way... But you're my best friend dude. It's just this... this is our future you're messing with... I'm sorry. We can't let you do this."
			},
			Costco4 = {
				Id = 128720522897252,
				Name = " ",
				AttackEffect = "Gun",
				Bio = "{{{{{{{COSTCO]]]]]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Recyclables",
		Color = "Blue",
		Cost = { Blue = 4 },
		Effect = {
			Name = "Jackinate",
			Description = "Max Level.\nWhenever you cast a fighter that costs exactly 4 total studs: Summon 2 copies of it.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "SummonCopy", 30, "Aggressor" },
				{ "SummonCopy", 30, "Aggressor" }
			},
			Target = "Aggressor",
			Cost = 4,
			LowCost = 4
		},
		Bio = "The original suggestor of combining Doritos and Mtn Dew."
	},
	Cyandude585 = {
		Id = 10310611231,
		Name = "Cyandude858",
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Blue = 4 },
		CustomReminder = {
			["Peace Terms"] = "A selection of 3 free, undiscardable cards with a drawback for getting them out your hand."
		},
		Effect = {
			Name = "Transfusion",
			Description = "When this card is cast: Give each player 2 Peace Term cards.\nWhenever a Peace Term card is cast: Give yourself a card.",
			Target = "Ally",
			Ability = {
				OnSummon = {
					Power = {
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
							"Ally"
						},
						{
							"RandomAdd",
							{ "PT1", "PT2", "PT3" },
							"Opponent"
						}
					},
					Target = "Self"
				},
				OnAnyCast = {
					Power = { { "RandomAdd", "Any", "Ally" } },
					Target = "All",
					Archetype = "Peace Term"
				}
			}
		},
		Bio = "A trusted agent of Foroth's Oligarchs, studying how to manipulate its brainwashing waters."
	},
	JaikKaik = {
		Id = 8421406431,
		Name = "JaikKaik",
		AltCards = {
			["JaikKaik-Sun"] = {
				Name = "King of the 7 Seas",
				AttackEffect = "Whirlpool",
				Id = 10283645276,
				Bio = "Don't tell him there's more than 7."
			}
		},
		Health = 3000,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 7, Neutral = 3 },
		Effect = {
			Name = "Infinite lockdown",
			Description = "Whenever you cast an action: Shuffle a Blue or Red action card into your deck, then draw a card.",
			ActionOnly = true,
			Type = "OnAllyCast",
			Power = {
				{ "RandomDeckAdd", "Lunar" },
				{ "Draw", 1 }
			},
			Target = "Ally"
		},
		Bio = "His mastery of simulations and ports allowed him to preserve Havalu digitally."
	},
	["Stormchaser's Gambit"] = {
		Id = 8296176504,
		Name = "Cosmic Endowment",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 1, Red = 1 },
		Lunar = true,
		EffectVariable = 0,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Draw a card.\nIf you've cast 4 or more other actions this turn, all allied fighters gain 200 Health and Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1, "Ally" },
						{
							"AlterEV",
							{ "Set", "Playertable", "ActionCount", "Nil" }
						},
						{ "EVGreaterValueCheck", 4 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "\"Controlling a galaxy is for meek simpletons. I seek something greater. I seek the whole universe.\" --Azureless, Lord of the Federation"
	},
	Stravant = {
		Id = 8421405313,
		Name = "Stravant",
		AltCards = {
			AdlaiB2 = {
				Name = "AdlaiB2",
				AttackEffect = "Recyclables",
				Id = 6815300239,
				AltArt = true,
				Bio = "A YouTuber that plays Roblox. His career lives off memes."
			},
			["Venom Puddy & T_ezla Miller"] = {
				Id = 16932151364,
				Name = "Venom Puddy & T_ezla Miller",
				AltArt = true,
				Bio = "I'm already a demon, T_ez."
			},
			["Killer Misterry"] = {
				Id = 96823141476969,
				Name = "Killer Misterry",
				AltArt = true,
				Bio = "I can't decide whether you should live or die..."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4 },
		Overload = true,
		Effect = {
			Name = "Thug Life",
			Description = "Whenever this card attacks and destroys another: Give yourself a Blue or Red action card.",
			Type = "OnAttackDestroy",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally"
		},
		Bio = "His lightning could boil an ocean if so desired."
	},
	["Nibblex the Starkiller"] = {
		Id = 14820251507,
		Name = "Nibblex the Starkiller",
		AltCards = {
			["Nibblex the Mukbanger"] = {
				Id = 11255312927,
				AltArt = true,
				Name = "Nibblex the Mukbanger",
				Bio = "<i>(opens container and dumps planets all over plate)</i>\n\t\t\t\t\t\t\t\"Are these, the universe's most crispy planets?\"\n\t\t\t\t\t\t\t<i>(dramatic pause)</i>\n\t\t\t\t\t\t\t\"Let's find out.\"\n\t\t\t\t\t\t\t<i>(stares at camera as orchestra music becomes louder)</i>"
			},
			["Nibblex the Starkiller-Banner"] = {
				Id = 12942005489,
				AttackEffect = "LaserRed",
				Name = "McKayla, 4th Pack Rabbit Team Leader",
				Bio = "<i>\"Eye for an eye, eh? Sure, why not?\"</i>"
			},
			["Ignatuha000, Avenger"] = {
				Id = 121367612608915,
				AttackEffect = "Gun",
				Name = "Ignatuha000, Avenger",
				AltArt = true,
				PremiumArt = 135,
				Commissioner = { 643154860, 144551861 },
				Bio = "Astarossa died, Bloxburg going crazy, what do you think of it, Ryan? R y a n??"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "Bite",
		Color = "Red",
		Cost = { Green = 3, Red = 5 },
		DamageImmune = true,
		SummonAnimation = "SummonNibblex",
		Effect = {
			Description = "Whenever a fighter dies: This card gains 100 Health and Power. During your end step, if 4 or more allied fighters died since your last end step: This card deals 10,000,000 damage to all fighters.",
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
					Power = { { "Damage", 10000000 } },
					Target = "All",
					EffectRequirement = { "Playertable", "Me", 4, 9999, "DeathStorm" }
				}
			}
		},
		Bio = "\"If you were an ageless, cosmic force with insatiable hunger, how would you sate it? Would you not do as I do? Would you not at least pick justified meals?\""
	},
	["Erik.Cassel"] = {
		Id = 10281634860,
		Name = "erik.Cassel",
		AltCards = {
			["Erik.Cassel-ArtV"] = {
				Id = 10310630209,
				AltArt = true,
				Name = "Erik.Cassel",
				AttackEffect = "Whirlpool",
				Bio = "The warmth of Summer is not sweet without bitter Winter."
			},
			MothDoodle = {
				Id = 129069649063649,
				Name = "Moth",
				AttackEffect = "Whirlpool",
				Bio = "nap time"
			}
		},
		Health = 900,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Bite",
		Color = "Blue",
		Cost = { Blue = 7, Green = 2 },
		Effect = {
			Description = "When this card is cast: Search your deck for a common card, an uncommon card, a rare card, and an epic card.",
			Type = "OnSummon",
			Power = {
				{ "RandomTutorfor", "Common" },
				{ "RandomTutorfor", "Uncommon" },
				{ "RandomTutorfor", "Rare" },
				{ "RandomTutorfor", "Epic" }
			},
			Target = "Ally"
		},
		Bio = "One of the founders of Roblox. Ancient and wise."
	},
	["Federation Force: Miner"] = {
		Id = 8421331710,
		Name = "Federation Force: Miner",
		AltCards = {
			["Konsyes1, Hijacking Experiment"] = {
				Id = 9336152471,
				Name = "Konsyes1, Hijacking Experiment",
				AttackEffect = "LaserBlue",
				AltArt = true,
				Bio = "This robot is trained to pog."
			}
		},
		Health = 900,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Capture",
			Description = "Whenever you cast an action: Give yourself a Red or Blue action card, except it's inert in all zones.",
			Type = "OnAllyCast",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally",
			EffectInert = true
		},
		Bio = "Havalu's natives praised the moon religiously, as it was regarded as the Mother in the Sky, protector of Spirits. The Federation tore it apart, as they needed to look good for next week's gala."
	},
	["Federation Stratagem: Abduction"] = {
		Id = 8421314305,
		AltCards = {
			["Federation Stratagem: Abduction-Mango"] = {
				Name = "Descend Down Bluestein Caves",
				Id = 88691697800919,
				Addant = "Moonleak-Mango",
				AttackEffect = "MagicBlue",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "\"I fell from the light, talk or should I fight\""
			}
		},
		Name = "Federation Stratagem: Abduction",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 2 },
		Lunar = true,
		Addant = "Moonleak",
		CustomReminderMoonleak = true,
		CustomReminderSuspend = true,
		Effect = {
			Name = "Capture",
			Description = "Suspend a target fighter.\nGive yourself 3 Moonleaks.",
			Type = "OnSummon",
			Power = {
				{ "Suspend", 30, "Single" },
				{ "Add", "Addant" },
				{ "Add", "Addant" },
				{ "Add", "Addant" }
			},
			Target = "Ally"
		},
		Bio = "\"Dance! Beg! If you're funny enough, we might just save you from the mines!\""
	},
	["Federation Fleet: Assimilator"] = {
		Id = 9925856816,
		Name = "Federation Fleet: Assimilator",
		AltCards = {
			["Federation Fleet: Assimilator-E"] = {
				Name = "Federation's Death Egg",
				Id = 9925855720,
				Bio = "\"That's no egg...It's a space station...\""
			},
			["Ao Guang"] = {
				Name = "Ao Guang",
				Id = 16206876420,
				Bio = "Dragon King of the East Sea. Helped Monkey obtain the Ruyi Jingu Bang on his journey. Happy Year of the Dragon 2024!"
			},
			BROnies = {
				Name = "BROnies!",
				Id = 87476756715824,
				Bio = "bulk biceps eat your heart out",
				SummonAnimation = "SummonIris",
				AttackEffect = "DBZClash"
			}
		},
		Health = 1500,
		Power = 750,
		Rarity = "Epic",
		AttackEffect = "LaserBlue",
		Color = "Blue",
		Cost = { Blue = 7, Green = 1, Yellow = 1 },
		CloneImmune = true,
		Effect = {
			Name = "Capture",
			Description = "Whenever this card attacks and destroys another: All enemy fighters lose 150 Power. Summon a copy of each fighter with the lowest Power.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Weaken", 150, "Opponent" },
				{ "SummonCopy" }
			},
			Target = "LowestPower"
		},
		Bio = "The few among Havalu who resisted Azureless' rule quickly desisted when they saw his personal starcraft.\nThis card was co-designed by VoidOof."
	},
	["Monopoly Man"] = {
		Id = 8421445160,
		Name = "Monopoly Man",
		AltCards = {
			["Monopoly Man-Sun"] = {
				Name = "Lucky Winner",
				AttackEffect = "Recyclables",
				Id = 9166658891,
				Bio = "What did he win? I DON'T KNOW!!!!"
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent casts an action or terrain card, or an enemy effect targets: All players draw a card.",
			Target = "Ally",
			Ability = {
				OnEnemyTarget = {
					Power = { { "Draw", 1 } },
					Target = "All"
				},
				OnEnemyCast = {
					Power = { { "Draw", 1 } },
					Target = "All"
				},
				OnEnemyTerrainCast = {
					Power = { { "Draw", 1 } },
					Target = "All"
				}
			}
		},
		Bio = "Look at my jewels! LOOK AT THEM!"
	},
	DominiusConfabricor = {
		Id = 15610277863,
		Name = "DominiusConfabricor",
		AltCards = {
			["DominiusConfabricor-Sun"] = {
				Id = 15610281427,
				AttackEffect = "Jab",
				CopyBodge = "DominiusConfabricor-Sun",
				Name = "DominiusConfabricor",
				Bio = "...But perhaps love yourself even more."
			},
			["Brendan03red, The Charitable"] = {
				Id = 15610279082,
				AttackEffect = "Scratch",
				CopyBodge = "Brendan03red, The Charitable",
				Name = "Brendan03red, The Charitable",
				Bio = "Even demons have their generosity. The end result will restore hope."
			}
		},
		Health = 1100,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		CustomReminder = {
			["Confabric Love"] = "A fleeting card is destroyed if it's not cast by the end step."
		},
		Effect = {
			Name = "Pacifist",
			Description = "During your end step: All players draw a card. The card your opponent draws this way is fleeting.",
			Type = "OnEnd",
			Power = {
				{ "Draw", 1, "Ally" },
				{ "FleetingDraw", 1 }
			},
			Target = "Opponent"
		},
		Bio = "Love your neighbor as you love yourself. There is no greater commandment."
	},
	["Jailbreak!"] = {
		Id = 6386379747,
		Name = "Jailbreak!",
		AltCards = {
			["Jailbreak!-Sun"] = {
				Id = 9409002737,
				Name = "Gaming Summer Sale",
				Bio = "It's time to buy twenty games you'll never play!",
				Addant = "Jailbreak!-Sun"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Addant = "Jailbreak!",
		CustomReminderFleeting = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "Your opponent draws a fleeting card.\nGive yourself a copy of this card.\nYou can't cast actions this turn.",
			Type = "OnSummon",
			Power = {
				{ "FleetingDraw", 1, "Opponent" },
				{ "Add", "Addant" },
				{ "BypassAction", "Ally" }
			},
			Target = "Ally"
		},
		Bio = "Javion's christmas traditions involve giving bail to as many criminals as possible."
	},
	Llendlar = {
		Id = 10278696221,
		Name = "Wheatlies",
		AltCards = {
			["Wheatlies-Sun"] = {
				Id = 10278450559,
				Name = "Killer Fish",
				AttackEffect = "Slash",
				Bio = "I'll be your killer fish for the evening."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		Overload = true,
		Effect = {
			Name = "Sacrificial Destruction",
			Description = "Once each turn, whenever an effect gives you a card: All players draw 3 cards.",
			Type = "OnAllyPut",
			Power = { { "Draw", 3, "All" } },
			Target = "All",
			TurnTriggerLimit = 1
		},
		Bio = "The Gods are pleased. You get to keep your skin."
	},
	Seranok = {
		Id = 8421479577,
		Name = "Seranok",
		AltCards = {
			["Seranok-ArtV"] = {
				Id = 7138918990,
				AttackEffect = "Hammer",
				AltArt = true,
				Bio = "This description has no meaning to me anymore. To be frank, its Merely a coincidence. Part of the 'Aife' Collection! Collect them all!"
			},
			Chimera_Radec = {
				Id = 5575728943,
				Name = "Chimera_Radec",
				CopyBodge = "Chimera_Radec",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "A wise man draws his swords when the time is right to wield them. A fool dies with blades still sheathed, fearing that there might yet come a time of greater need."
			},
			NuclearPizza = {
				Id = 76822736302744,
				Name = "NuclearPizza",
				AttackEffect = "HollowScythe",
				AltArt = true,
				Bio = "\"A sad display of desperation, a sad display of fear. A tale as old as time, the farmer reaps his fields and harvests his profits. But then the truth comes through, things can't breathe when they lie in Hell. Welcome to my personal Hell. You are the crops I reap and your mind is my profit.\""
			},
			christang3 = {
				Id = 11345886839,
				Name = "christang3",
				AltArt = true,
				Bio = "\"Peekaboo, now I'm here now I'm not. Maybe I want to be here maybe I don't, But all I know is I'm very annoying.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Legendary",
		AttackEffect = "LinkedSword",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Wary",
			Description = "Whenever your opponent casts a fighter: They lose 200 life. Reset this card's stats then return it to its hand.",
			Type = "OnEnemySummon",
			Power = {
				{ "Reset", 500 },
				{ "Inflict", 200, "Opponent" },
				{ "Return", 30 }
			},
			Target = "Self"
		},
		Bio = "There are people who you can't imagine being without. There are people you can't wait to destroy. Seranok is both - at the same time!"
	},
	Scripter = {
		Id = 8421507600,
		Name = "Scripter",
		AltCards = {
			["Scripter-H25"] = {
				Name = "SCRIPTER.exe",
				Id = 108090229056871,
				ArtAnimation = "ScripterEXE",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				Bio = "<b><font color=\"#FF0000\">01101110 01101011 00100000 01111001 01101111 01110101 00100000 01100110 01101111</font><font color=\"#00FFFF\"> 01110010 00100000 01100010 01110101 01111001 01101001 01101110 01100111 00100000</font></b>"
			}
		},
		Health = 1500,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		CustomReminderFleeting = true,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "During your end step: Give yourself a Red, Green, Blue, and Yellow action cards, except they're fleeting and inert in all zones.",
			Type = "OnEnd",
			Power = {
				{ "RandomAdd", "Blue Action" },
				{ "RandomAdd", "Red Action" },
				{ "RandomAdd", "Green Action" },
				{ "RandomAdd", "Yellow Action" }
			},
			EffectFleeting = true,
			EffectInert = true,
			Target = "Ally"
		},
		Bio = "\"The power to create new worlds is inside us all, but only the most dedicated can wield it.\""
	},
	["Cosmic Studs"] = {
		Id = 10184361740,
		Name = "Cosmic Studs",
		AltCards = {
			Stove = {
				Id = 93133933844690,
				Name = "Stove",
				Addant = "Nascent Stud-Oats",
				AltArt = true,
				Effect = {
					Name = "SCRIPTING PARTY",
					Description = "Obliterate a non-Colourless card in your baseplate and put this card in there.\nAt the start of your turns, if this card's in your baseplate: Give yourself a fleeting Oats.",
					Ability = {
						OnSummon = {
							Power = {
								{
									"MoveZone",
									{ "Colored", "GenZone_Ally", "Nil", true, false },
									"Self"
								},
								{
									"AddGenZone",
									{ "Stove", 1 }
								}
							},
							Target = "Ally"
						},
						OnAllyStart = {
							Power = { { "Add", "Addant", "Ally" } },
							MetaData = { Fleeting = true },
							Target = "Self"
						}
					}
				},
				Bio = "Clearly, you don't own an air-fryer."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 0 },
		Rank = 3,
		Archetype = "Studling",
		TriggerInGenZone = true,
		EffectVariable = 0,
		CustomReminderNascent = true,
		Addant = "Nascent Stud",
		TokenGenZone = true,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Obliterate a non-Colourless card in your baseplate and put this card in there.\nAt the start of your turns, if this card's in your baseplate: Give yourself a fleeting Nascent Stud.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "Colored", "GenZone_Ally", "Nil", true, false },
							"Self"
						},
						{
							"AddGenZone",
							{ "Cosmic Studs", 1 }
						}
					},
					Target = "Ally"
				},
				OnAllyStart = {
					Power = { { "Add", "Addant", "Ally" } },
					MetaData = { Fleeting = true },
					Target = "Self"
				}
			}
		},
		Bio = "Studs in the furthest reaches of spaces are unused, thus having untapped potential."
	},
	Frankenstein = {
		Id = 103804262242791,
		Name = "Havaluvian Blackmarketeer",
		AltCards = {
			["Blessing Furiball"] = {
				Id = 9129984611,
				Name = "Blessing Furiball",
				AttackEffect = "Scratch",
				AltArt = true,
				Bio = "Furi!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 2 },
		TransformImmune = true,
		ReturnImmune = true,
		CustomReminder = {
			["Havaluvian Ghosts"] = "An action with stats manifests into a fighter."
		},
		Effect = {
			Name = "Haydoscale",
			Type = "OnSummon",
			Description = "When this card is cast: Transform all allied fighters into Blue or Red actions, then return a target allied fighter to its hand.",
			Power = {
				{ "RandomTransform", "Lunar" },
				{ "Return", 30, "SingleAlly" }
			},
			Target = "Ally"
		},
		Bio = "I see you've got an eye for things!"
	},
	["Alpha Tree"] = {
		Id = 8421490353,
		Name = "Alpha Tree",
		AltCards = {
			["Drained Flufflefunz"] = {
				Id = 9417409669,
				Name = "Drained Flufflefunz",
				AttackEffect = "Flare",
				AltArt = true,
				Bio = "TOO LAZY TO PROPERLY DO TAXES \nTOO WEAK TO DO FRAUD \nTHE CYCLE CONTINUES"
			},
			["Concrete Hunters"] = {
				Id = 14169504931,
				Name = "Concrete Hunters",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 84,
				Bio = "Time to back down, you're in our domain."
			},
			StillWater2 = {
				Name = "StillWater2",
				Commissioner = { "PhaseWater2" },
				Id = 122647980460804,
				AltArt = true,
				PremiumArt = 890,
				Bio = "What if he was called this wouldn't it be funny guys... right guys...<br/>This is still funny right?"
			}
		},
		Health = 500,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Gravity",
		Color = "Green",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever you cast a ranked card: Give yourself a Red Stud and a Green Stud.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Add", "Red Stud" },
				{ "Add", "Green Stud" }
			},
			Target = "Ally",
			Ranked = true
		},
		Bio = "Cothran's core may fuel starstones, but its trees fuel the mining rigs."
	},
	Creeperkiller510 = {
		Id = 11972584016,
		Name = "Creeperkiller510",
		AltCards = {
			["Creeperkiller510-AN"] = {
				Id = 9347955683,
				AttackEffect = "Slash",
				Bio = "What if I destroyed the baseplate?"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "No Creepers in My House",
			Description = "When this card is cast: It gains 100 Health and Power for each card cast this turn.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Playertable", "StormCount", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 100, "Nil" }
				},
				{ "Heal", "Variable" },
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "CREEPA. AWWWWWW MAN."
	},
	Xlzeck = {
		Id = 11972704457,
		Name = "Xlzeck",
		AltCards = {
			["Xlzeck-E"] = {
				Id = 9105946533,
				AttackEffect = "Jab",
				Bio = "Bunny blob benefactor."
			},
			["Slayer Flufflefunz"] = {
				Name = "Slayer Flufflefunz",
				AttackEffect = "Divinity",
				Commissioner = { 20934271 },
				Id = 125116765528433,
				AltArt = true,
				PremiumArt = 22,
				Bio = "<i>Sparkle on! It's Wednesday! Don't forget to be yourself!</i>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Name = "Explosm",
			Description = "When this card is cast: Set the power of each fighter with the highest power to 400.",
			Type = "OnSummon",
			Power = { { "SetPower", 400 } },
			Target = "HighestPower"
		},
		Bio = "Witness the power of my cursed lock!"
	},
	["lilBismarck, Anime Avenger"] = {
		Id = 2786556403,
		Name = "lilBismarck, Anime Avenger",
		AltCards = {
			["No anime"] = {
				Id = 74913082660333,
				Name = "No Meta",
				AttackEffect = "Slash",
				Bio = "20 more nerfs to monored\" - QA probably\""
			}
		},
		Health = 700,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Burn it All",
			Description = "Whenever your opponent casts a fighter: Deal 100 damage to all fighters.",
			Type = "OnEnemySummon",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "no anime"
	},
	TheEnderCorp = {
		Id = 11972602031,
		Name = "TheEnderCorp",
		AltCards = {
			["TheEnderCorp-V-Offer"] = {
				Id = 16294482583,
				Name = "Lover's Woe",
				AttackEffect = "Punch",
				Bio = "Keep yourself together now, she's right there!"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "I AM NOT YOUR SLAVE DAD",
			Description = "When this card is cast: All players draw a card. Reveal your opponent's hand.",
			Type = "OnSummon",
			Power = {
				{ "Draw", 1 },
				{ "RevealHand", 999, "Opponent" }
			},
			Target = "All"
		},
		Bio = "\"ALRIGHT, LOOK. I'll let you draw an extra card if you let me look at your hand! Just once! I promise! That's a good deal, right?\""
	},
	Uias = {
		Id = 11972653235,
		Name = "Uias",
		AltCards = {
			["Uias-AN"] = {
				Id = 9381267858,
				AttackEffect = "Rifle",
				EffectAnimation = "TurkeyBuff",
				Bio = "Gobble Gobble, Friend."
			},
			["Limited Tradeshark Rodrick"] = {
				Id = 8072480800,
				Name = "Limited Tradeshark Rodrick",
				AttackEffect = "Jab",
				Bio = "Yeah, I've got a Valkyrie and a Wanwood Crown. LMAD?"
			}
		},
		Health = 350,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 1 },
		CustomReminderFleeting = true,
		Effect = {
			Name = "Target Master",
			Description = "When this card dies: Draw a fleeting card.",
			Type = "OnDeath",
			Power = { { "Draw", 1 } },
			EffectFleeting = true,
			Target = "Ally"
		},
		Bio = "He gets the job done by building machinary that defends his allies as well as himself."
	},
	MuPower = {
		Id = 4819903655,
		Name = "MuPower",
		AltCards = {
			["Steve, the Birthday Boy"] = {
				Id = 5961955053,
				Name = "Steve, the Birthday Boy",
				AltArt = true,
				EffectAnimation = "EatCake",
				Bio = "Have a slice of cake. Go on, Cheeky also wants you to."
			},
			["Free The Angel"] = {
				Id = 10184654162,
				Name = "Free The Angel",
				AttackEffect = "Divinity",
				AltArt = true,
				Bio = "God has a plan for you.<br/>And it's going to hurt."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 2, Yellow = 2 },
		EffectAnimation = "EatTurkey",
		Effect = {
			Name = "Tycoon Money",
			Description = "When this card is cast: A target fighter gains 100 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Single"
		},
		Bio = "Too much wood grain for me."
	},
	Ejob = {
		Id = 11972812869,
		Name = "Flatflyer",
		AltCards = {
			["Ejob-Val"] = {
				Name = "Dogutsune",
				AttackEffect = "Scratch",
				Id = 7138167116,
				CopyBodge = "Ejob-Val",
				Bio = "From Dogutsune you may expect things like 3D models, scripts, games and character design. Arsenal's Red Panda? Murder Revolver? 2 UGC Hats? That's Dogu's doing!"
			},
			Dogon = {
				Name = "Dogon",
				AttackEffect = "Slash",
				AltArt = true,
				CopyBodge = "Dogon",
				Id = 8628388505,
				Effect = {
					Name = "Stud",
					Type = "OnSummon",
					Power = {
						{ "Summon", "CaptainUnderpants" },
						{ "Summon", "Minions" },
						{ "Summon", "Rowley" },
						{ "Summon", "Bananas" },
						{ "Summon", "Rowley" },
						{ "Summon", "Minions" },
						{ "Summon", "CaptainUnderpants" },
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
					EffectRequirement = { "Board", "Opponent", 4, 9999 }
				},
				Bio = "To defeat the shovelware, you must produce the shovelware."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 3 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, if there's 4 or more enemy fighters: Summon 7 400/50 Noobs that're inert in play. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Adventurous Catgirl" },
				{ "Summon", "Prosperous Catgirl" },
				{ "Summon", "Mischievious Catgirl" },
				{ "Summon", "Adventurous Catgirl" },
				{ "Summon", "Prosperous Catgirl" },
				{ "Summon", "Mischievious Catgirl" },
				{ "Summon", "Adventurous Catgirl" },
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
			EffectRequirement = { "Board", "Opponent", 4, 9999 }
		},
		Bio = "Secretly has been building up power for years with all the cards put in that bin. The takeover shall soon commence."
	},
	MrDoombringer = {
		Id = 4710282694,
		Name = "MrDoombringer",
		AltCards = {
			["Forum Freakshow"] = {
				Name = "Jess",
				AttackEffect = "ClassicRocket",
				Id = 136495849010574,
				AltArt = true,
				Bio = "Don't worry about me, just worry about you. Or worry about <i>something</i>, just don't worry about what I do."
			}
		},
		Health = 650,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Red = 4, Neutral = 4 },
		Effect = {
			Name = "Terrorise",
			Description = "During your end step: Destroy all fighters with 200 or less health.",
			Type = "OnEnd",
			Power = { {
				"CheckHealth",
				{ 0, 200 }
			} },
			Target = "All"
		},
		Bio = "Slamming players into banland since 1992."
	},
	MrDoombringerToken = {
		Id = 4710282694,
		Name = "MrDoombringer",
		CopyBodge = "MrDoombringerToken",
		Health = 500,
		Power = 800,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Red",
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Cost = { Red = 4, Neutral = 4 },
		Bio = "Slamming players into banland since 1992."
	},
	Myzta = {
		Id = 11972714039,
		Name = "Myzta",
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever an action targets this card during your turn: Select a fighter card from in a choice of 3 in your graveyard that each cost 4 or fewer total studs. Recur it, except it's fading and inert when discarded.",
			Type = "OnActionTarget",
			Power = {
				{ "CreateChoices", "Fighter_4OrLower" },
				{
					"AlterEV",
					{ "Set", "Target", "CardInstance", "Nil" },
					"TargetChoiceZone"
				},
				{
					"MoveZone",
					{ "Target", "GraveZone_Ally", "Hand_Ally", true, false },
					"Self"
				}
			},
			Target = "Self",
			ChooseFromZone = "GraveZone",
			EffectRequirement = { "MyTurn", "Me", 30, 303 },
			AmountOfTargets = 3,
			MetaData = { TokenOmni = true, Fading = true }
		},
		Bio = "\"My Droplets are just the cutest!\""
	},
	["Corestone Miner"] = {
		Id = 8457531134,
		Name = "Corestone Miner",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent casts any card or discards a card, or an effect they control targets, or an enemy fighter dies: This card gains 50 health.",
			Target = "Ally",
			Ability = {
				OnEnemySummon = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				},
				OnEnemyTarget = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				},
				OnEnemyDiscard = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				},
				OnEnemyCast = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				},
				OnEnemyTerrainCast = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				},
				OnEnemyDeath = {
					Power = { { "Heal", 50 } },
					Target = "Self"
				}
			}
		},
		Bio = "\"They invade this land. They poison our ground. They subjugate us for a but a thimble more energy.\" --Ptenda the Unconquerable"
	},
	["Cothran Spectre"] = {
		Id = 8536993894,
		Name = "Cothran Spectre",
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Green",
		Cost = { Green = 3 },
		Archetype = "Apocryspectre",
		CustomReminderSuspend = true,
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever this card is cast or attacks: Suspend a target fighter.",
			Ability = {
				OnAttack = {
					Power = { { "Suspend", 30, "Single" } },
					Target = "Self"
				},
				OnSummon = {
					Power = { { "Suspend", 30, "Single" } },
					Target = "Self"
				}
			}
		},
		Bio = ""
	},
	["Ptenda's Bodyguard"] = {
		Id = 8421293886,
		Name = "Ptenda's Bodyguard",
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Green = 2 },
		Archetype = "Apocryspectre",
		Effect = {
			Name = "Temporal Halo",
			Description = "When this card is suspended: A target enemy fighter loses 200 Power. Suspend that fighter.",
			Type = "OnSuspend",
			Power = {
				{ "Weaken", 200 },
				{ "Suspend" }
			},
			Target = "SingleEnemy",
			TurnTriggerLimit = 1
		},
		Bio = "Many of Ptenda's souls are valiant fallen warriors, gladly dying again and again until Cothran is safe."
	},
	["Overlaid Souls"] = {
		Id = 8448555018,
		Name = "Overlaid Souls",
		Health = 500,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Apocryspectre",
		Cost = { Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks your opponent directly: They lose 400 life and you gain 400 life. Give yourself an Apocryspectre card.",
			Type = "OnStrike",
			Power = {
				{ "Cost", -400 },
				{ "Inflict", 400, "Opponent" },
				{ "RandomAdd", "Apocryspectre" }
			},
			Target = "Ally",
			Archetype = "Apocryspectre"
		},
		Bio = "Hello, Soul!"
	},
	["Ancestral Vanguard"] = {
		Id = 8421492085,
		Name = "Ancestral Vanguard",
		AltCards = {
			["S1APK1NG, Horrorful Sinister"] = {
				Id = 9238702120,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "S1APK1NG, Horrorful Sinister",
				Bio = "I'm not alone... At least not for now."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3 },
		Archetype = "Apocryspectre",
		Effect = {
			Name = "Jet Set Radio",
			Description = "Whenever an allied Apocryspectre attacks your opponent directly: This card gains 150 Health and Power.",
			Type = "OnAllyStrike",
			Power = {
				{ "Strengthen", 150 },
				{ "Heal", 150 }
			},
			Target = "Self",
			Archetype = "Apocryspectre"
		},
		Bio = ""
	},
	["Aeonite Progeny"] = {
		Id = 10288353757,
		Name = "Aeonite Progeny",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Apocryspectre",
		Cost = { Neutral = 6, Green = 2 },
		CustomReminder = {
			["Cothrite Excellence"] = "Suspended fighters don't exist. They come back at the next end step.",
			["Katharan Tenacity"] = "Unstoppable fighters can attack directly even if there's a fighter in the way."
		},
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Suspend all enemy fighters.\nAllied apocryspectres gain 300 Health and become unstoppable.\nYou can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Suspend", 30, "Opponent" },
				{ "Heal", 300, "CustomTarget" },
				{ "GivePassive", "Unstoppable", "CustomTarget" },
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
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = { "Archetype" },
				Modifier = "Apocryspectre",
				SubModifier = true
			}
		},
		Bio = "\"How I wish I could join you in Javion, my niece. But you deserve a world that accepts you, something my duty can't allow.\"\nPtenda the Unconquerable"
	},
	["Divide and Conquer"] = {
		Id = 8421369166,
		Name = "Divide and Conquer",
		AltCards = {
			["Divide and Conquer-V"] = {
				Id = 72417318839567,
				Name = "The Precious Thing is Stolen",
				AttackEffect = "Punch",
				Bio = "France Hollands Tibet Kyoto London Russia Orleans! "
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Lunar = true,
		Cost = { Blue = 2, Red = 2 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Divide a target fighter into two smaller copies of itself, then deal 100 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = {
				{ "SummonSplit", 2, "Single" },
				{ "Damage", 100, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "We came, we saw, we conquered."
	},
	Xenoslimes = {
		Id = 8421481349,
		Name = "Xenoslimes",
		AltCards = {
			["Fusion Flufflefunz"] = {
				Id = 11202904761,
				Name = "Fusion Flufflefunz",
				AttackEffect = "Maelstrom",
				AltArt = true,
				Bio = "The time is now. The hero is you."
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Green",
		Archetype = "Slime",
		Cost = { Neutral = 1, Green = 6, Yellow = 1 },
		Rank = 6,
		Effect = {
			Description = "At the start of your turns: This card divides into two copies of itself, then all allied slimes gain 50 Health and Power.",
			Type = "OnAllyStart",
			Power = {
				{ "SummonSplit", 2, "Self" },
				{ "Heal", 50, "AlliedArchetype" },
				{ "Strengthen", 50, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "SLUDGE LIFE"
	},
	["The Ultimate Trade"] = {
		Id = 8421311347,
		Name = "The Ultimate Trade",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Yellow = 4 },
		Effect = {
			Description = "If a target enemy fighter has 350 or more health, unlock it and divide it into 7 copies of itself.\nYou can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999, "SingleEnemy" },
				{ "SummonSplit", 7, "SingleEnemy" },
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
		Bio = "Azureless isn't one to negotiate with outsiders, but overwhelming wealth speaks louder. The entrepreneur unsettles the conqueror."
	},
	["Kathara Refugees"] = {
		Id = 8421420692,
		Name = "Kathara Refugees",
		AltCards = {
			["Kathara Refugees-Banner"] = {
				Id = 121367612608915,
				AttackEffect = "Knife",
				Name = "Sydney",
				Transformant = "Kathara Refugees-Banner",
				Bio = "We're going to play a little game. It's called \"guess who just called the police."
			},
			["Cow Crew"] = {
				Id = 16056326762,
				Name = "Cow Crew",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 208,
				Bio = "“Moooove aside! The Cow Crew is here! Onesies, boba tea, donuts, & plushies… what else do you need for the perfect party! Cowincidence? I say not!”",
				Transformant = "Cow Crew"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2 },
		StealImmune = true,
		TransformImmune = true,
		Archetype = "Survivor",
		Transformant = "Kathara Refugees",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All allied fighters become a copy of it.\nWhenever this card attacks and destroys another: Your opponent loses 300 life.",
			Ability = {
				OnSummon = {
					Power = { { "Transform", "Transformant" } },
					Target = "Ally"
				},
				OnAttackDestroy = {
					Power = { { "Inflict", 300, "Opponent" } },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	["Cothran Lushbeast"] = {
		Id = 9318920176,
		Name = "Cothran Lushbeast",
		AltCards = {
			["Cothran Lushbeast-E"] = {
				Id = 9318921672,
				Name = "Cothran Bunny",
				AttackEffect = "Scratch",
				Bio = "\"Even the smaller wildlife dwarfs the size and evolution we've seen in other planets, perhaps its also based on their diet? we need live samples to make sure.\" -- Havalu Research Notes"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 2 },
		Effect = {
			Name = "Night Creak",
			Description = "During your end step, if there are 6 or more nonfighter cards in your graveyard: You gain {W}{W}.",
			Type = "OnEnd",
			Power = { { "Neutral", 2 } },
			Target = "Ally",
			EffectRequirement = { "Board", "AllyGraveZone", 6, 9999, "NonFighters" }
		},
		Bio = "\"The high carbon atmosphere of Cothran enables megafauna, seemingly violating the square-cube law. More testing must be done on these animals.\" -- Havalu Research Notes"
	},
	["Cothran Guerillas"] = {
		Id = 9318918625,
		Name = "Cothran Guerillas",
		AltCards = {
			["Cothran Guerillas-C"] = {
				Id = 15252290239,
				Name = "Ptenda's Little Helpers",
				Bio = "Azureless sneered, his fist tightening into a ball.\n\"Come Christmas Day, by my decree, Vecross' joy shall fall.\"\n"
			},
			["GYRSC.EXE"] = {
				Id = 92898294204858,
				Name = "Great Yummy Refreshing Sodas Corporation",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 511,
				Bio = "I cracked open a strange looking green soda I'd bought at my neighbors vending machine. After inserting the soda into my mouth, it tasted good. My doorbell rang shortly after, but the jingle was all Lemon and LIMEY. there was a guy I've never seen anyone mention before named RAYgreenjuice89. Scariest part... he was going to make me work in his soda factory for an hourly wage of around $16.45!!!!"
			},
			["pvpsloth beam"] = {
				Id = 129337418653982,
				Name = "pvpsloth beam!!!",
				AttackEffect = "LaserBlue",
				AltArt = true,
				PremiumArt = 845,
				Bio = "\"If you get in her way, you'll be Toast!\""
			},
			["Nothing out of the ordinary for me"] = {
				Id = 131356145165138,
				Name = "Nothing out of the ordinary for me",
				Commissioner = { "Raphxt" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 705,
				Bio = "A nice saturday morning"
			}
		},
		Health = 100,
		Power = 1000,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Night Creak",
			Description = "When this card is cast: It deals 50 damage to each fighter for each fighter in play.",
			Type = "OnSummon",
			Target = "Self",
			Power = {
				{
					"AlterEV",
					{ "Set", "Field_All", "Fighter", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Damage", "Variable", "All" }
			}
		},
		Bio = "\"They know the terrain? Burn the terrain down. It's that easy.\" --Azureless, Lord of the Federation"
	},
	["Overlapping Consciousness"] = {
		Id = 8452566475,
		Name = "Overlapping Consciousness",
		AltCards = {
			["Overlapping Consciousness-AN"] = {
				Id = 9368642323,
				Name = "Smonker",
				AttackEffect = "Scratch",
				Bio = "Known for dragging survivors into acidic pools with his elongated tongue, catching those off guard who dare to look behind themselves."
			},
			["System Restabilizer Losternmeyer"] = {
				Id = 10310122327,
				Name = "System Restabilizer Losternmeyer",
				AttackEffect = "Tempest",
				AltArt = true,
				Bio = "[ Content Deleted ]"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Green",
		Cost = { Neutral = 4, Green = 1 },
		Effect = {
			Description = "When this card is cast: Divide a target allied fighter into two copies of itself.",
			Type = "OnSummon",
			Power = { { "SummonSplit", 2, "SingleAlly" } },
			Target = "Ally"
		},
		Bio = "The Aeonite Cult imbue multiple spirits into singular people. The more minds that exist in a single space, the more alive that space is."
	},
	Indoorsnowball = {
		Id = 10321868151,
		Name = "Indoorsnowball",
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Green = 4 },
		Effect = {
			Name = "INDOORSNOWTALL",
			Description = "When this card dies: Summon two smaller versions of it. When those cards die, summon two smaller inert versions of those.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Snowball1" },
				{ "Summon", "Snowball1" }
			},
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "Even robots have souls."
	},
	Snowball1 = {
		Id = 10321866723,
		Name = "Indoorsnowball",
		CopyBodge = "Snowball1",
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Green = 2 },
		Effect = {
			Name = "Indoorsnowball",
			Description = "When this card dies: Summon two smaller inert versions of it.",
			Type = "OnDeath",
			Power = {
				{ "Summon", "Snowball2" },
				{ "Summon", "Snowball2" }
			},
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "And if you can mass produce robots, you can mass produce souls."
	},
	Snowball2 = {
		Id = 10321865564,
		Name = "Indoorsnowball",
		CopyBodge = "Snowball2",
		Token = true,
		Health = 150,
		Power = 150,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 1, Green = 1 },
		Effect = {
			Name = "indoorsnowsmall",
			Description = "",
			Type = "Null",
			Power = {},
			Target = "Self"
		},
		Bio = "But even souls must end someday."
	},
	Dextromer = {
		Id = 17790520641,
		Name = "Dextromer",
		AltCards = {
			["Dextromer-Sun"] = {
				Id = 9180232220,
				Name = "Captain of the N.C. Ship",
				AttackEffect = "Slash",
				Summonant = "Noob-Sun",
				Bio = "Avast Friend! We set sail for the lost Tix!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 1 },
		Summonant = "Noob",
		Effect = {
			Name = "Double Life",
			Description = "Whenever you cast a card that costs 1 or fewer total studs: Summon a 400/50 Noob that's inert in play.",
			Ability = {
				OnAllySummon = {
					Power = { { "Summon", "Summonant" } },
					LowCost = 1,
					Target = "Ally"
				},
				OnAllyCast = {
					Power = { { "Summon", "Summonant" } },
					LowCost = 1,
					Target = "Ally"
				},
				OnAllyCastGear = {
					Power = { { "Summon", "Summonant" } },
					LowCost = 1,
					Target = "Ally"
				},
				OnAllyTerrainCast = {
					Power = { { "Summon", "Summonant" } },
					LowCost = 1,
					Target = "Ally"
				}
			}
		},
		Bio = "Just don't taunt with him while he owns a bicycle."
	},
	CanadianSanic = {
		Id = 10184296067,
		Name = "CanadianSanic",
		AltCards = {
			YUFtheawesomeiscool = {
				Name = "YUFtheawesomeiscool",
				AttackEffect = "Jab",
				CopyBodge = "YUFtheawesomeiscool",
				Id = 5179398053,
				AltArt = true,
				Bio = "THE ULTIMATE ᶜʳᶦⁿᵍᵉ ᵐᵃⁿ. The second member of the Bad Time Trio. Showed Foster the game, who then showed Shadow."
			},
			Yagi = {
				Name = "Yagi",
				AttackEffect = "Scratch",
				Id = 9197558132,
				AltArt = true,
				Bio = "Mysterious goat that can do anything."
			},
			RidiculouslyEpix = {
				Name = "RidiculouslyEpix",
				Id = 9307659538,
				AltArt = true,
				Bio = "\"Roll the dice, just keep rolling. What you want will eventually come to you.\""
			},
			["CanadianSanic-Banner"] = {
				Id = 10076274778,
				Bio = "\"I bet you've never even heard of Poutine.\""
			},
			d_avin06 = {
				Id = 92014627863655,
				Name = "d_avin06",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 455,
				Bio = "\"kaido cheese spot\" \"just kill me\" \"i've been getting 2v1ed this whole match\"  \"has heart to it\" \"boku da sai\" \"made animating unfun for me\" \"SYKST\""
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		SummonantAnimation = "SummonSlide",
		Dextrous = true,
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Effect = {
			Name = "Assimilate",
			Description = "When this card is cast: Summon a fighter as though it was cast.",
			Type = "OnSummon",
			Power = { { "RandomSummonWithEffect", "Fighter" } },
			Target = "Ally"
		},
		Bio = "Gotta go fast, eh?"
	},
	Unlimxted = {
		Id = 10279176514,
		Name = "Unlimxted",
		AltCards = {
			["Unlimxted-Alt"] = { Id = 10279191979, AltArt = true, Bio = "I have many fanboys..." }
		},
		Health = 800,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		TargetImmune = true,
		Effect = {
			Name = "Even Out",
			Description = "If an effect would target this card: Return it to its hand instead.",
			Type = "OnTarget",
			Power = { { "Return", 9999 } },
			Target = "Self"
		},
		Bio = "I have many limiteds..."
	},
	PT1 = {
		Id = 8481032298,
		Name = "Demilitarisation",
		AltCards = {
			["SilentPurgatory-T1"] = {
				Name = "In Loving Memory",
				AttackEffect = "MagicBlue",
				Id = 15710752696,
				Bio = "Kitty was sick. I begged for medicine, but father didn't care. Kitty stopped playing with me, I couldn't help her. My friend's grave is soaked with my tears."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		TokenOmni = true,
		Undiscardable = true,
		Archetype = "Peace Term",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Even Out",
			Description = "All allied fighters lose 200 power.",
			Type = "OnSummon",
			Power = { { "Weaken", 200 } },
			Target = "Ally"
		},
		Bio = ""
	},
	PT2 = {
		Id = 8475214699,
		Name = "Ceasefire",
		AltCards = {
			["SilentPurgatory-T2"] = {
				Name = "Flatline",
				AttackEffect = "MagicBlue",
				Id = 15710751036,
				Bio = "The monitor made a droning sound. My hands trembled. His husband was waiting in the break room... What am I supposed to tell him?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Undiscardable = true,
		TokenOmni = true,
		Archetype = "Peace Term",
		Cost = { Neutral = 0 },
		Requirement = { "Playertable", "Me", 0, 2, "Storm" },
		Effect = {
			Name = "Even Out",
			Description = "Cast only if you've cast 1 or fewer cards this turn.\nYou can't cast anything else this turn.",
			Type = "OnSummon",
			Power = { {
				"SetCastRestriction",
				{
					{ "NOTHING" },
					"You can't cast anything else this turn."
				},
				"Ally"
			} },
			Target = "Ally"
		},
		Bio = ""
	},
	PT3 = {
		Id = 8448554225,
		Name = "Reparations",
		AltCards = {
			["SilentPurgatory-T3"] = {
				Name = "Leaving Home",
				AttackEffect = "MagicBlue",
				Id = 15710753821,
				Bio = "Father's passed out again. He always does, ever since mother left. I had enough of father's abuse. All my stuff's packed up now. This place isn't a home to me anymore."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Undiscardable = true,
		TokenOmni = true,
		Archetype = "Peace Term",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Even Out",
			Description = "You lose all of your {W}.",
			Type = "OnSummon",
			Power = { { "SetNeutral", 0 } },
			Target = "Ally"
		},
		Bio = ""
	},
	["Oligarchs of Foroth"] = {
		Id = 10281516377,
		Name = "Oligarchs of Foroth",
		AltCards = {
			["Ollie C"] = {
				Name = "Ollie C",
				AttackEffect = "MagicBlue",
				Id = 10281509031,
				Bio = "She takes the phrase \"pulling your heartstrings\" quite literally."
			},
			Redmasterya = {
				Name = "Redmasterya",
				AttackEffect = "Blizzard",
				Id = 12128587252,
				AltArt = true,
				Bio = "Look at these funny Peace Term cards and now your Life!"
			}
		},
		Health = 1750,
		Power = 1750,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Blue",
		Terrariant = "Presence Terrain",
		Cost = { Blue = 9, Yellow = 2 },
		CustomReminder = {
			["Peace Terms"] = "A selection of 3 free, undiscardable cards with a drawback for getting them out your hand."
		},
		DestroyImmune = true,
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent casts their first fighter each turn: Give that player a Peace Term card.\nDuring your end step, if your opponent has a Peace Term in their hand: They lose 1750 life.",
			Ability = {
				OnEnemySummon = {
					Power = { {
						"RandomAdd",
						{ "PT1", "PT2", "PT3" }
					} },
					Target = "Opponent",
					EffectRequirement = { "Playertable", "Him", 1, 2, "Fighters" }
				},
				OnEnd = {
					Power = { { "Inflict", 1750 } },
					EffectRequirement = { "Archetype", "OpponentHand", 1, 9999, "Peace Term" },
					Target = "Opponent"
				}
			}
		},
		Bio = ""
	},
	Foroth = {
		Id = 10184652437,
		Name = "Foroth",
		AltCards = {
			SilentPurgatory = {
				Id = 15710743645,
				Name = "Silent Purgatory",
				Terrariant = "SilentPurgatory-TRN",
				AttackEffect = "Slash",
				Effect = {
					Name = "Haydoscale",
					Description = "When this card is cast: Give each player 2 Peace Term cards.\nAt the start of each player's turn, if that player has no Peace Terms in their hand: Give that player any card.",
					Ability = {
						OnSummon = {
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
							Target = "Ally"
						},
						OnStart = {
							Power = { { "RandomAdd", "Any", "CurrentTurn" } },
							EffectRequirement = { "Archetype", "CurrentHand", 0, 1, "Peace Term" },
							Target = "CurrentTurn"
						}
					}
				},
				Bio = "It's snowing. You feel cold."
			},
			["Foroth-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 131544613276105,
				Terrariant = "Foroth Terrain-10Y",
				AttackEffect = "Slash",
				Bio = "It was the custom of Forothians to share this drink, as a sign of welcome, and as a way to ensure that their visitors behaved themselves."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Archetype = "Planet",
		Terrain = true,
		Terrariant = "Foroth Terrain",
		CustomReminder = {
			["Peace Terms"] = "A selection of 3 free, undiscardable cards with a drawback for getting them out your hand.",
			["Any Card"] = "Foroth can give you tokens and unused cards."
		},
		RandomAddBypass = "IncludeToken",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give each player two Peace Term cards.\nAt the start of each player's turn, if that player has no Peace Terms in their hand: Give that player any card.",
			Ability = {
				OnSummon = {
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
					Target = "Ally"
				},
				OnStart = {
					Power = { { "RandomAdd", "Any", "CurrentTurn" } },
					EffectRequirement = { "Archetype", "CurrentHand", 0, 1, "Peace Term" },
					Target = "CurrentTurn"
				}
			}
		},
		Bio = ""
	},
	Javion = {
		Id = 73593993596783,
		Name = "Javion",
		AltCards = {
			["Hardware Store"] = {
				Name = "Hardware Store",
				Id = 9499123017,
				AltArt = true,
				Terrariant = "Hardware Terrain",
				Bio = "They've got allen wrenches, gerbil feeders, toilet seats, electric heaters\nTrash compactors, juice extractor, shower rods and water meters\nWalkie-talkies, copper wires safety goggles, radial tires\nBB pellets, rubber mallets, fans and dehumidifiers\nPicture hangers, paper cutters, waffle irons, window shutters\nPaint removers, window louvres, masking tape and plastic gutters\nKitchen faucets, folding tables, weather stripping, jumper cables\nHooks and tackle, grout and spackle, power foggers, spoons and ladles!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Yellow",
		Archetype = "Planet",
		Terrain = true,
		Terrariant = "Javion Terrain",
		Cost = { Neutral = 3, Yellow = 1 },
		Addant = "Targeting Blip",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself 2 Robux Stacks.\nWhenever you cast a Money Stack, if there are 4 Robux Stacks in your Graveyard: Give yourself a Yellow card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" }
					},
					Target = "Ally"
				},
				OnAnyAllyCast = {
					Power = { { "RandomAdd", "Yellow" } },
					EffectRequirement = { "Archetype", "AllyGraveZone", 4, 9999, "Money" },
					Archetype = "Money",
					Target = "Ally"
				}
			}
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "Paying for their freedom using theme park profits, Javion was able to stay on the Federation's good side by funding their military."
	},
	Havalu = {
		Id = 8421516396,
		Name = "Havalu",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Planet",
		Terrain = true,
		Terrariant = "Havalu Terrain",
		Cost = { Neutral = 3, Blue = 1 },
		Addant = "Medic Kit",
		CustomReminderMoonleak = true,
		CustomReminder = { ["Medic Kit"] = "A {W} action that gains you 1000 life." },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Give yourself a Medic Kit.\nDuring your end step, if you gained 600 or more life this turn: Give yourself a Moonleak and you gain {W}.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{ "Add", "Moonleak" },
						{ "Neutral", 1 }
					},
					EffectRequirement = { "Playertable", "Me", 600, 99999, "Lifegain" },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	Kathara = {
		Id = 8421519013,
		Name = "Kathara",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Archetype = "Planet",
		Terrain = true,
		Terrariant = "Kathara Terrain",
		Cost = { Neutral = 3, Red = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: It deals 150 damage to all fighters.\nWhenever you cast a fighter, if there's exactly 1 allied fighter: It gains 150 health and power.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 150, "All" } },
					Target = "Ally"
				},
				OnAllySummon = {
					Power = {
						{ "Strengthen", 150 },
						{ "Heal", 150 }
					},
					EffectRequirement = { "Board", "Ally", 1, 2 },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	Cothran = {
		Id = 8421522715,
		Name = "Cothran",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Planet",
		Terrain = true,
		Terrariant = "Cothran Terrain",
		Cost = { Neutral = 3, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: You may baseplate again this turn.\nDuring your end step, if there are 3 or more Green cards in your baseplate: Destroy 2 of them. You gain {G}, then put a Colourless Stud into your baseplate.",
			Ability = {
				OnSummon = {
					Power = { { "DiscardLimit", 1 } },
					Target = "Ally"
				},
				OnEnd = {
					Power = {
						{
							"GenZoneDiscard",
							{ "Green", -2 }
						},
						{ "Green", 1 },
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
					EffectRequirement = { "Color", "AllyGenZone", 3, 999, "Green" },
					Target = "Ally"
				}
			}
		},
		Bio = ""
	},
	["10000_Stars"] = {
		Id = 8421323892,
		Name = "10000_Stars",
		EffectAnimation = "TenThousandStarsEffect",
		AltCards = {
			["10000_Stars-E"] = {
				Id = 16446074049,
				Name = "Kaguya-hime",
				AttackEffect = "Scratch",
				Bio = "\"Despite being from the moon, why do I not look like my people? They all look like rabbits or something.\""
			},
			["Great Manager, R"] = {
				Id = 137243555340130,
				Name = "Great Manager, R",
				AltArt = true,
				PremiumArt = 292,
				Bio = "Why did this company make bullets that only kill my employees"
			},
			["Sir Leb Quavion"] = {
				Id = 72107399922073,
				Name = "Sir Leb Quavion",
				AltArt = true,
				Bio = "\"Hello everybody. welcome to quavioncore 2 the long awaited sequel. It's me Quavion i have 1 shoe, and I'm green\""
			}
		},
		Health = 1000,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 7, Green = 2 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: All enemy fighters gain 200 Health and Power.\nYour opponent gains 2000 life, draws 2 cards and gains {W}{W}.\nSteal a target enemy fighter.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 200, "Opponent" },
				{ "Strengthen", 200, "Opponent" },
				{ "Inflict", -2000, "Opponent" },
				{ "Draw", 2, "Opponent" },
				{ "Neutral", 2, "Opponent" },
				{ "Steal" }
			},
			Target = "SingleEnemy"
		},
		Bio = "The soft spoken entrepeneur, who had seeked the galaxy's approval, returned with a sorrowful crown. Looking into its gleaming gems, one remains ignorant to the suffering and deceipt behind that beautiful sparkle."
	},
	Bouncer = {
		Id = 8565052150,
		Name = "Bouncer",
		AltCards = {
			["IDK_100noob, Scam Buster"] = {
				Id = 9829933967,
				AttackEffect = "TimeBomb",
				AltArt = true,
				Name = "IDK_100noob, Scam Buster",
				Bio = "Builderman needs your help! send your \"gift\" to ManixDash!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Neutral",
		Token = true,
		Cost = { Neutral = 2, Blue = 2 },
		ReturnImmune = true,
		Effect = {
			Description = "When this card is cast: Return each fighter with the lowest cost to their hand.",
			Type = "OnSummon",
			Power = { { "Return", 30 } },
			Target = "LowestCost"
		},
		Bio = "\"Sorry buddy, you're not on the list.\""
	},
	ClanDrone = {
		Id = 8421387838,
		Name = "ClanDrone",
		AltCards = {
			["ClanDrone-E"] = {
				Id = 8707812555,
				AttackEffect = "TimeBomb",
				Effect = {
					Name = "PREPARE FOR ENEMY REQUIREMENT SPAM.",
					Description = "Whenever you cast an action: Shuffle a 500/500 U.Egg.V. into your deck.",
					Type = "OnAllyCast",
					Power = { { "DeckAdd", "Drone-E" } },
					Target = "Ally"
				},
				Bio = "Isn't it kinda cheating to use an aerial drone camera?"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		CustomReminder = { Drone = "A free 500/500 fighter with no abilities." },
		Effect = {
			Name = "PREPARE FOR ENEMY REQUIREMENT SPAM.",
			Description = "Whenever you cast an action: Shuffle a 500/500 Drone into your deck.",
			Type = "OnAllyCast",
			Power = { { "DeckAdd", "Drone" } },
			Target = "Ally"
		},
		Bio = "Capable of creating mass amounts of drones, only for them to turn on him and his friends... or maybe that was his plan all along?"
	},
	Drone = {
		Id = 8421388484,
		Name = "Drone",
		AltCards = {
			["Drone-E"] = {
				Id = 8707813065,
				Name = "U.Egg.V.",
				AttackEffect = "LaserBlue",
				Bio = "Didn't even need a killsteak for this one to be online."
			},
			["Drone-AN"] = {
				Id = 18788104549,
				Name = "Teapeotple",
				AttackEffect = "Punch",
				Bio = "\"Bruv, it's true I brew some of the best tea throughout Robloxia, but I ain't perfect. Sometimes you muck up a cup and you gotta put it in the bin, ya feels? In this case, the bin's the Mines, and the mucked up cup's the bad tasting tea that should never see the light of day.\" - Clockwork"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicRed",
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Must defeat master. Must enable master."
	},
	wer8888 = {
		Id = 8421373713,
		Name = "wer8888888",
		AltCards = {
			["Wer8888-E"] = {
				Id = 8650616446,
				Name = "wer8888",
				Bio = "I gave up on egg hunting long ago. All I could ever find were pumpkin bombs."
			},
			BluePuddy3 = {
				Id = 8371614804,
				Name = "Bluepuddy3",
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "Kept you waiting huh."
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "Blaster Hardscope",
			Description = "Whenever this card attacks: Give yourself a Blue or Red action card, except it's inert in all zones.",
			Type = "OnAttack",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally",
			EffectInert = true
		},
		Bio = "He'd be a master smuggler if the Feds didn't put a GPS tracker in each individual periastron knife handle."
	},
	Sethycakes = {
		Id = 8421452343,
		Name = "Sethycakes",
		AltCards = {
			["Meepcity Fisherman Nicolas"] = {
				Id = 126825106781068,
				AttackEffect = "Slash",
				Name = "Baby Robloxian Nicolas",
				Bio = "123 for baby"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Blue = 1, Yellow = 2 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Snowman Amp",
			Description = "When this card is cast: A target fighter gains 300 Health. All players gain 600 Life.",
			Type = "OnSummon",
			Power = {
				{ "Inflict", -600, "All" },
				{ "Heal", 300 }
			},
			Target = "Single"
		},
		Bio = "I made this :D"
	},
	TheInnovative = {
		Id = 8606238928,
		Name = "TheInnovative",
		AltCards = {
			EG3 = {
				Id = 10184485837,
				Name = "Dominus Eastus",
				AttackEffect = "Electric",
				Bio = "Why hunt anything when you can hunt eggs?"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Red = 2, Green = 2, Blue = 2, Yellow = 2 },
		Addant = "Mimic",
		CustomReminder = {
			["Ban Hammer"] = "A Colourless 5{W} action. It obliterates a target fighter."
		},
		Effect = {
			Name = "Revival",
			Description = "During your end step, if there are 4 colours among cards in your graveyard: All allied fighters generate. Give yourself a 'Ban Hammer.'",
			Type = "OnEnd",
			Power = {
				{ "Generate", 1, "Ally" },
				{ "Add", "Addant" }
			},
			EffectRequirement = { "Chromatic", "AllyGraveZone", 4, 9999 },
			Target = "Ally"
		},
		Bio = "Regardless of who opposes me, I will be the last man standing."
	},
	Xenotrent = {
		Id = 10280553535,
		Name = "Xenotrent",
		AltCards = {
			["Iustin2800, Kaijuro Master"] = {
				Id = 10310600425,
				Name = "Iustin2800, Kaijuro Master",
				AltArt = true,
				AttackEffect = "MagicBlue",
				Bio = "Those who aren't ready for war aren't ready for peace."
			},
			["Xenotrent-E-Offer"] = {
				Name = "Locked Up Eggs-hibit",
				Id = 17014188577,
				Bio = "There's a reason why My Eggy Vice is behind glass."
			},
			["Jazper, Dead Extractor"] = {
				Id = 17107611516,
				Name = "Jazper, Dead Extractor",
				PremiumArt = 247,
				AltArt = true,
				AttackEffect = "MagicBlue",
				Bio = "They laughed at the wicked, for they do not know that their day is here. The extractor grinned and collected for fortunes as his motto. THE DEAD BRINGS DISCOVERY// Thus, newfound knowledge are extracted."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Storm",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever your opponent casts an action: This card gains 200 health and power. They can't attack or cast anything else this turn.",
			Type = "OnEnemyCast",
			Power = {
				{ "Strengthen", 200 },
				{ "Heal", 200 },
				{ "BypassAttack", 30, "Opponent" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Opponent"
				}
			},
			Target = "Self"
		},
		Bio = "He rocks your world. Literally."
	},
	Thesupernessiiiii = {
		Id = 11972500819,
		Name = "Thesupernessiiiii",
		AltCards = {
			Luna = {
				Id = 9964917594,
				Name = "Luna",
				AltArt = true,
				Bio = "Ever wake up one day and decide to become a moth?"
			},
			["Thesupernessiiiii-E"] = {
				Id = 9964918189,
				Name = "Egg of Gravitation",
				AttackEffect = "Gravity",
				Bio = "Its weight is either that of a chicken's or an ostrich's egg, depending on how it feels that day."
			}
		},
		Health = 800,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "Whenever your opponent casts an action: Destroy the oldest card in their hand.",
			Type = "OnEnemyCast",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent"
		},
		Bio = "A wandering bard, playing his music so loud that nothing that hurt him."
	},
	["Creepy Toy"] = {
		Id = 8938579155,
		Name = "JacksSmirkingRevenge",
		AltCards = {
			["Captain Keeler1"] = {
				Id = 8938581393,
				Name = "Captain Keeler1",
				AttackEffect = "Jab",
				CopyBodge = "Captain Keeler1",
				AltArt = true,
				Bio = "Keeping our sky's free and safe."
			},
			Rayborne = {
				Id = 82475216135060,
				Name = "Rayborne",
				PremiumArt = 367,
				AltArt = true,
				Bio = "@Hypns The Death Ritual"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 2 },
		Effect = {
			Description = "When this card is cast, if there's 2 or more non-Yellow allied fighters: All allied fighters gain 50 Health and Power. Deal 50 damage to all enemy fighters and they lose 50 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 50, "Ally" },
				{ "Heal", 50, "Ally" },
				{ "Weaken", 50 },
				{ "Damage", 50 }
			},
			Target = "Opponent",
			EffectRequirement = { "NotColor", "Ally", 2, 999, "Yellow" }
		},
		Bio = "Former ROBLOX admin and Twitch Stream host. Some words are better left unspoken."
	},
	MICHIKUSCHI = {
		Id = 71593812770285,
		Name = "Phoenix Hondo",
		AltCards = {
			["EndlessCactuar-Hal"] = {
				Name = "The Flatwoods Monster",
				AttackEffect = "Scratch",
				Id = 119340351783409,
				Bio = "\"That monster has been stalking us for a while now, maybe its trying to help us? We'll try to communicate with it.\"."
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Blue",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Overgrown",
			Description = "When this card is cast, if there's an allied non-Blue fighter: Give yourself a Blue or Red action card.",
			Type = "OnSummon",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally",
			EffectRequirement = { "NotColor", "Ally", 1, 9999, "Blue" }
		},
		Bio = "The flower of man always scatters."
	},
	MyCutenesskills = {
		Id = 11865480318,
		Name = "MyCutenesskills",
		Health = 800,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		EffectVariable = 0,
		Summonant = "MyCutenesskillsToken",
		AltCards = {
			["Emperor Keeler1"] = {
				Name = "Emperor Keeler1",
				Id = 5252612138,
				AltArt = true,
				Summonant = "Emperor Keeler1 Token",
				Bio = "Greatest servant, weakest tyrant."
			},
			["Today's Expression"] = {
				Name = "Today's Expression",
				AttackEffect = "Knife",
				Id = 119340351783409,
				AltArt = true,
				Bio = "One sunny day, just like that day he sincerely dried the laundry, he dried their plastic skin."
			}
		},
		Effect = {
			Name = "Booming Red",
			Description = "When this card is cast: It gains 50 Power for each Action card in your hand, baseplate and graveyard.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "GraveZone_Ally", "Action", "Nil" }
				},
				{
					"AlterEV",
					{ "Add", "Hand_Ally", "Action", "Nil" }
				},
				{
					"AlterEV",
					{ "Add", "GenZone_Ally", "Action", "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 50, "Nil" }
				},
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "It's true, you know. Not even Iris is more kawaii than I."
	},
	MyCutenesskillsToken = {
		Id = 6486564612,
		Name = "MyCutenesskills",
		AltCards = {
			["Emperor Keeler1 Token"] = {
				Name = "Emperor Keeler1",
				CopyBodge = "Emperor Keeler1 Token",
				Id = 6076612930,
				Bio = "Greatest servant, weakest tyrant."
			}
		},
		Health = 800,
		Power = 700,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "WWW",
			Description = "Whenever you cast a Terrain: Animate it.",
			Type = "OnAllyTerrainCast",
			Power = { { "AnimateTerrain" } },
			Target = "Ally"
		},
		Bio = "The only creature that can resist me is David Crissbach."
	},
	Killar1234567 = {
		Id = 8421371124,
		Name = "Killar1234567",
		AltCards = {
			["Killar1234567-E"] = {
				Name = "Chubby Bunny",
				AttackEffect = "Scratch",
				Id = 8923599842,
				Transformant = "KillarToken-E",
				Bio = "Ruiner of carrot farms."
			},
			["White Hat Hacker Aiden"] = {
				Name = "White Hat Hacker Aiden",
				AttackEffect = "MagicBlue",
				Id = 8072490894,
				Transformant = "White Hat Hacker AidenToken",
				Bio = "Like a bandit that locks up your house for you."
			}
		},
		Health = 600,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Transformant = "KillarToken",
		Effect = {
			Name = "Life fam",
			Description = "When this card dies: Suspend a target fighter.\nOnce each turn, whenever an allied effect suspends: Draw a card.",
			Type = "OnAnyCast",
			Ability = {
				OnDeath = {
					Power = { { "Suspend" } },
					Target = "Single",
					AllowDeadAggressorTriggers = true,
					TurnTriggerLimit = 1
				},
				OnAllySuspend = {
					Power = { { "Draw", 1 } },
					Target = "Self",
					TurnTriggerLimit = 1
				}
			},
			Target = "Self"
		},
		Bio = "\"So...anyone up for a game of football?\""
	},
	KillarToken = {
		Id = 3557090623,
		Name = "Killar1234567",
		AltCards = {
			["KillarToken-E"] = {
				Name = "Chubby Bunny",
				AttackEffect = "Scratch",
				Id = 8923599842,
				Transformant = "Killar1234567-E",
				Bio = "This card is an alt-art of Killar1234567."
			},
			["White Hat Hacker AidenToken"] = {
				Name = "White Hat Hacker Aiden",
				AttackEffect = "MagicBlue",
				Id = 8072490894,
				Transformant = "White Hat Hacker Aiden",
				Bio = "Like a bandit that locks up your house for you."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Mitigation = 100000,
		DamageMitigation = 100000,
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Transformant = "Killar1234567",
		ReplaceEffectImmune = true,
		Effect = {
			Name = "Life fam",
			Description = "Immune to all damage while transformed.\nAt the start of each player's turn: Untransform this card.",
			Type = "OnStart",
			Power = { { "Transform", "Transformant" } },
			Target = "Self"
		},
		Bio = "\"I hope you're ready for touchdown!\""
	},
	PurpleBoy329 = {
		Id = 130280912026210,
		Name = "PurpleBoy329",
		AltCards = {
			It = {
				Id = 4934430392,
				CopyBodge = "It",
				Bio = "You think the night is weak? Perhaps I need to show you what it can truly do.",
				AltArt = true
			},
			BoogeyBoy329 = {
				Id = 7541888350,
				AttackEffect = "Scratch",
				Bio = "No need to look under your bed. I wouldn't fit anyways."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Inferno",
		Color = "Blue",
		Cost = { Blue = 2 },
		Effect = {
			Name = "Viable Lunargain",
			Description = "Whenever this card becomes unlocked: Give yourself a Blue or Red action card.",
			Type = "OnUnlock",
			Power = { { "RandomAdd", "Lunar" } },
			Target = "Ally"
		},
		Bio = "Hey guys my good pal Llendlar told me  I had a viable lifegain deck."
	},
	Rollernaut = {
		Id = 8421383733,
		Name = "Rollernaut",
		AltCards = {
			["Rollernaut-AN"] = {
				Id = 100046132775978,
				AttackEffect = "TimeBomb",
				Name = "MS4_HappyFace_v9.exe",
				Bio = "Changelogs:<br/>New Eyes!<br/>More Teeth!"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 3 },
		Effect = {
			Name = "Batter Up",
			Description = "When this card is cast: Swap a target fighter's stats.",
			Type = "OnSummon",
			Power = { { "Swap", 100000 } },
			Target = "Single"
		},
		Bio = "They see me rollin'..."
	},
	Finland = {
		Id = 8421436829,
		Name = "Finland",
		AltCards = {
			["Finland-Sun"] = {
				Id = 9150940666,
				Name = "Vacationist",
				AttackEffect = "Slash",
				Bio = "She's waited all year for this!"
			},
			["NoKnowledge, Monoyellow Enthusiast"] = {
				Id = 17346074591,
				Name = "NoKnowledge, Monoyellow Enthusiast",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 260,
				Bio = ""
			}
		},
		Power = 200,
		Health = 200,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast, if you have no {Y}: You gain {R}.",
			Type = "OnSummon",
			Power = { { "Red", 1 } },
			Target = "Self",
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" }
		},
		Bio = "Sweden generates blue studs while Norway generates yellow ones. Scandinavia hates grass."
	},
	Robic = {
		Id = 10279348356,
		Name = "Robic",
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Shotgun",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast, if you have no {Y}: A target fighter generates twice.",
			Type = "OnSummon",
			Power = { { "Generate", 2, "Single" } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" }
		},
		Bio = "This Javion park ranger is infamous for stopping children from being created."
	},
	Maelstronomer = {
		Id = 8421449607,
		Name = "Maelstronomer",
		AltCards = {
			["Maelstronomer-H25"] = {
				Id = 124871120190784,
				Name = "Daemon of Dryland",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Slash",
				Bio = "\"Ah, running to a desert? Real creative, try a log cabin near a lake next time.\""
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 5 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "Booster",
			Description = "When this card is cast, if you have no {Y}: A target fighter gains 200 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			Target = "Single",
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" }
		},
		Bio = "One of the continuators of the Pilgrim Islands. A powerful powerhouse powerinator."
	},
	TheChakraTree = {
		Id = 10279371426,
		Name = "TheChakraTree",
		AltCards = {
			["TheChakraTree-E"] = {
				Id = 10279372291,
				CopyBodge = "TheChakraTree-E",
				Bio = "I’ll haunt those who want this egg!"
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "SkeleScythe",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		Token = true,
		Effect = {
			Name = "Nature's Gift",
			Description = "When this card is cast, if you have no {Y}: You gain {Y}{Y}{Y}.",
			Type = "OnSummon",
			Power = { { "Yellow", 3 } },
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" },
			Target = "Ally"
		},
		Bio = "He's not dead. Just un-living."
	},
	Spooksletsky = {
		Id = 80157277881175,
		Name = "Spooksletsky",
		AltCards = {
			["Spooksletsky-Hal"] = {
				Id = 76822736302744,
				Bio = "Did you know sour candy has an acidity level similar to battery acid? That's exactly why I need to pull out all your teeth and replace them with something... stronger."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, if you have no {Y}: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 0, 1, "IconsYellow" }
		},
		Bio = "Don't they ever warn you to check for fried chicken under your bed?"
	},
	Tankbomer = {
		Id = 8421482250,
		Name = "Tankbomer",
		AltCards = {
			["Tankbomer-E"] = {
				Id = 8789663647,
				Name = "Egg of Duty",
				AttackEffect = "Slash",
				Addant = "MLGSPONGE-E",
				Effect = {
					Name = "WoodReviewer",
					Description = "Whenever this card attacks: Give yourself a 200/400 Badblox Hatchling.",
					Type = "OnAttack",
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				Bio = "The war against easter is only the second most notable seasonal war."
			},
			poussin83bisbis = {
				Id = 8941643241,
				Name = "poussin83bisbis",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "A pro sniper since his childhood, he never misses his target. Even has his own army."
			}
		},
		Health = 1600,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 7 },
		Addant = "MLGSPONGE",
		CustomReminder = {
			MLGSPONGE = "A Green {W}{W}{G}{G} 200/400. It deals 200 damage to a target fighter when cast."
		},
		Effect = {
			Name = "WoodReviewer",
			Description = "Whenever this card attacks: Give yourself MLGSPONGE",
			Type = "OnAttack",
			Power = { { "Add", "Addant" } },
			Target = "Ally"
		},
		Bio = "After seeing their cruelty, many of the lower ranks abandoned the Federation."
	},
	MLGSPONGE = {
		Id = 8421488390,
		Name = "MLGSPONGE",
		AltCards = {
			["MLGSPONGE-E"] = {
				Id = 8789663043,
				Name = "Badblox Hatchling",
				Bio = "He'll do whatever it takes to avenge his fallen egg bretheren."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		EffectAnimation = "KnifeThrow",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Blaster Hardscope",
			Description = "When this card is cast: It deals 200 damage to a target fighter.",
			Type = "OnSummon",
			Power = "Damage",
			Target = "Single",
			Increase = 200
		},
		Bio = ""
	},
	Saiier = {
		Id = 11772289363,
		Name = "Saiier",
		AltCards = {
			["Saiier-C"] = {
				Name = "E. Scrooge",
				Id = 8179974771,
				Bio = "\"Bah,\" said Scrooge, \"Humbug.\""
			},
			["Saiier-AN"] = {
				Name = "Haunted Doll",
				AttackEffect = "British",
				Id = 9348059283,
				Bio = "Before Vitality comes Decay"
			}
		},
		Power = 700,
		Health = 700,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 7 },
		Summonant = "Undead Voodoo Doll",
		Effect = {
			Name = "Recognize",
			Description = "Once each turn, whenever you discard a card while having 2 or fewer {G}: Put a Green stud into your baseplate. This card gains 200 Health.",
			Type = "OnAllyDiscard",
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
				{ "Heal", 200, "Self" }
			},
			EffectRequirement = { "Playertable", "Me", 0, 3, "IconsGreen" },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Unknown to you as it is to me."
	},
	["Undead Voodoo Doll"] = {
		Id = 2789876682,
		Name = "Haunted Puppet",
		Health = 700,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "HURT ALL THE THINGS",
			Description = "During your end step, if you have 8 or fewer Green studs: summon Saiier and destroy this card.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "Saiier" },
				{ "Destroy", 9999, "Self" }
			},
			EffectRequirement = { "Playertable", "Me", 0, 9, "IconsGreen" },
			Target = "Ally"
		},
		Bio = "Haunted Puppets kill themselves over the most trivial of sins."
	},
	SnailMan39 = {
		Id = 10288760981,
		Name = "SnailMan39",
		AltCards = {
			["SnailMan39-C"] = {
				Name = "Snowman39",
				AttackEffect = "IcePunch",
				Id = 10288762890,
				Effect = {
					Power = {
						{ "Summon", "Snowman..?" },
						{ "Summon", "Snowman..?" }
					},
					Target = "Ally"
				},
				Bio = "The nice thing about snowmen is that they'll always be there... as long as it isn't above 0 degrees Celsius, or 32 degrees Fahrenheit for all you Westerners."
			},
			["Servant of the Opening Youkai"] = {
				Id = 17760523667,
				Name = "Servant of the Opening Youkai",
				AltArt = true,
				PremiumArt = 266,
				Bio = "\"Has anybody seen my cat?\""
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		CustomReminder = {
			Snail = "A free 300/200 fighter, inert in play. It deals 100 damage to itself during your end steps."
		},
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Name = "BLEU",
			Description = "During your end step, if you have 7 or more Green Studs: Summon 2 300/200 Snails.",
			EffectRequirement = { "Playertable", "Me", 7, 9999, "IconsGreen" },
			Type = "OnEnd",
			Power = {
				{ "Summon", "Snail" },
				{ "Summon", "Snail" }
			},
			Target = "Ally"
		},
		Bio = "\"The nice thing about snails is they always have a home. I wish humans always had a place to go back to.\""
	},
	Snail = {
		Id = 8421494963,
		Name = "Snail",
		AltCards = {
			["Confused Ghost"] = {
				Name = "Confused Ghost",
				AttackEffect = "Scratch",
				Id = 7511209241,
				Bio = "*Intensifying Muffled Bucket Noises* “They’re a little confused but they’ve got the spirit.\""
			},
			["Snowman..?"] = {
				Name = "Snowman..?",
				AttackEffect = "Ice",
				Id = 8234115157,
				Bio = "Don't let the snail touch you."
			},
			["Egg Dog"] = {
				Name = "Egg Dog",
				AttackEffect = "Slash",
				Id = 9256497341,
				Bio = "A lot has happened to me. I have to try and sort it all out...thinking is tough for me."
			},
			Lovestruck = {
				Name = "Lovestruck",
				AttackEffect = "Slash",
				Id = 11607582620,
				Bio = "Kyaa~~"
			}
		},
		Health = 300,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Token = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "BLEU",
			Description = "During your end step: Deal 100 damage to this card.",
			Type = "OnEnd",
			Power = { { "Damage", 100, "Self" } },
			Target = "Opponent"
		},
		Bio = "The nice thing about snails is they always have a home. I wish humans always had a place to go back to."
	},
	["DIY: Dark Dominus"] = {
		Id = 8421483166,
		Name = "Emerald Witch",
		AltCards = {
			["Emerald Witch-C"] = {
				Id = 8256328476,
				AttackEffect = "Tempest",
				Name = "Baba Emerald Witch",
				Bio = "\"I will force this house to give birth to house babies to fix the witch housing crisis! MWHAHAHAHAHAHAHA!\""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "During your end step, if your Baseplate rank is 8 or higher: This card gains 200 Health and Power.",
			Type = "OnEnd",
			EffectRequirement = { "Board", "AllyGenZone", 8, 9999 },
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			Target = "Self"
		},
		Bio = "The first of the witch sisters, offensive by nature. She only invokes her power when the time is right."
	},
	["Crystal Golem"] = {
		Id = 10253044527,
		Name = "Crystal Golem",
		AltCards = {
			["Crystal Golem-Sun"] = {
				Id = 9173951238,
				AttackEffect = "Whirlpool",
				Name = "Island Turtle",
				Bio = "This docile giant carries the world on his back. Okay it's not the world, but it's still a pretty big turtle."
			},
			["Crystal Golem-AN"] = {
				Id = 9391605620,
				AttackEffect = "Scratch",
				Name = "Little Girl",
				Bio = "She's about to find out what happens when you stay up past your bedtime."
			},
			["Shinnok, Scion of Yaxocieus"] = {
				Id = 8080823515,
				AttackEffect = "SoulDrain",
				Name = "Shinnok, Scion of Yaxocieus",
				Bio = "The lords of Nomrial put our Great Leader to rest. He will rise again."
			}
		},
		Health = 2100,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 8 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "Whenever this card attacks your opponent directly: Put 8 Green Studs into your baseplate.",
			Type = "OnStrike",
			Power = { {
				"AddGenZone",
				{ "Green Stud", 8 }
			} },
			Target = "Ally"
		},
		Bio = "Cold to the touch, this giant will hold any frontline without question."
	},
	Superland6 = {
		Id = 10288764412,
		Name = "Superland6",
		AltCards = {
			["Superland6-E"] = {
				Id = 10288766292,
				Name = "Lucky Lapin",
				Bio = "Note: Not actually very lucky."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Green",
		Cost = { Green = 6 },
		Effect = {
			Name = "BLEU",
			Description = "Whenever you cast a Green fighter, if you have 6 or more Green studs: It gains 600 Health.",
			EffectRequirement = { "Playertable", "Me", 6, 9999, "IconsGreen" },
			Type = "OnAllySummon",
			Power = { { "Heal", 600, "Aggressor" } },
			Color = "Green",
			Target = "Aggressor"
		},
		Bio = "Red cards are just edgy yellow cards."
	},
	Jimmyin1 = {
		Id = 10288625126,
		Name = "Jimmyin1",
		AltCards = {
			["Jimmyin1-AN"] = {
				Id = 9381274086,
				Name = "Gentle Elder",
				AttackEffect = "Ghostwalker",
				Bio = "The gentle souls in the wilderness never are."
			},
			["my BIRTHDAYS everyday"] = {
				Id = 93593936035506,
				Name = "my BIRTHDAYS everyday!",
				Commissioner = { "ChimeCat0", "killjque" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 759,
				Bio = "\"EVERYONE! QUICK! SEND THE MARIO BDAY GIF!\""
			}
		},
		Health = 1200,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Swamp",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		Overload = true,
		Effect = {
			Name = "Poisonous Touch",
			Description = "Whenever this fighter attacks a fighter: That fighter loses 400 power. Then lock this fighter for 2 turns.",
			Target = "Self",
			Ability = {
				OnAttack = {
					Power = { { "Weaken", 400, "Aggressor" } },
					Target = "Aggressor"
				},
				OnAttackEnd = {
					Power = { { "Lock", 2, "Self" } },
					Target = "Self"
				}
			}
		},
		Bio = "From swamp to plains, mountain to forest, all of Cothran will resist invasion."
	},
	FourXIV = {
		Id = 8421454056,
		Name = "Quf3y",
		Health = 600,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Transformant = "FiveXIV",
		ReplaceCardArtant = { 8421454056 },
		Effect = {
			Name = "Setstat Shenanigans",
			Description = "Whenever you cast a fighter that costs 4 or fewer total studs, if there's no gear on this card: Divide that fighter into two smaller copies of itself. Attach a gear to this card.",
			Type = "OnAllySummon",
			Power = {
				{ "SummonSplit", 2 },
				{ "EquipGear", "Exertion", "Self" },
				{
					"ReplaceCardArt",
					{ "Variable" },
					"Self"
				},
				{ "ReplaceBio", "ReplaceBioant", "Self" }
			},
			EffectRequirement = { "SelfGear", "HasGear", 0, 1, "HasGear" },
			Target = "Aggressor",
			LowCost = 4
		},
		Bio = "Ｈｅ ｃｅｒｔａｉｎｌｙ ｉｓ."
	},
	FiveXIV = {
		Id = 8421454056,
		Name = "Quf3y",
		Health = 600,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Transformant = "FiveXIV",
		Effect = {
			Name = "Setstat Shenanigans",
			Description = "Whenever you cast a fighter that costs 4 or fewer total studs: Divide it into 2 smaller copies of itself. This ability triggers only once, and has already triggered.",
			Type = "Null",
			Power = { { "SummonSplit", 2 } },
			Target = "Aggressor",
			LowCost = 4
		},
		Bio = "Whenever you're banned: Consider if you deserve it. You probably do. Take it as an opportunity for growth."
	},
	Tremity = {
		Id = 8421447945,
		Name = "Tremity",
		AltCards = {
			["Tremity-C"] = {
				Id = 8146177914,
				AttackEffect = "Ice",
				Bio = "Some of Santa's substitutes are so inexperienced that they accidentially kidnap children."
			},
			["unadaptably, Breaker of Delusions, Master of Chaos and Ender of Worlds"] = {
				Id = 9129720021,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "unadaptably, Breaker of Delusions, Master of Chaos and Ender of Worlds",
				Bio = "[citation needed]"
			}
		},
		Health = 350,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Christmas Amp",
			Description = "When this card is cast: Destroy each fighter with 50, 250 or 450 Health.",
			Type = "OnSummon",
			Power = {
				{
					"CheckHealth",
					{ 50, 50 }
				},
				{
					"CheckHealth",
					{ 250, 250 }
				},
				{
					"CheckHealth",
					{ 450, 450 }
				}
			},
			Target = "All"
		},
		Bio = "Cheat the system enough, and the system will have enough of you."
	},
	Glaecium = {
		Id = 8421484248,
		Name = "Glaecium",
		AltCards = {
			["Glaecium-Hal"] = {
				Id = 7501485220,
				AttackEffect = "Gravity",
				Bio = "A bunch of cheap tricks once in a while won't hurt."
			},
			["Flufflefunz Fan Club"] = {
				Id = 10921301654,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "ImAwkwrd, Bard of Valor",
				Bio = "As a bonus action, a creature (other than yourself) within 60 ft. that can hear you gains an inspiration die (1d8). For 10 minutes, the creature can add it to one ability check, attack roll, or saving throw."
			},
			["The Decrepit"] = {
				Id = 126105068766304,
				Name = "The Decrepit",
				PremiumArt = 380,
				AltArt = true,
				Bio = "This one is a struggling soul, always yearning or what he is forbidden from. He will make for a debilitated heart."
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		EffectAnimation = "MidMagicGreenEffect",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Best of Both Worlds",
			Description = "When this card is cast, if there's an allied non-Green fighter: It deals 300 damage to itself and a target fighter. They both gain 300 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300 },
				{ "Strengthen", 300 },
				{ "Damage", 300, "Self" },
				{ "Strengthen", 300, "Self" }
			},
			EffectRequirement = { "NotColor", "Ally", 1, 9999, "Green" },
			Target = "Single"
		},
		Bio = "Outclassed but not outmatched, Cothran's natives quickly reverse-engineered the tech of their Federation invaders."
	},
	["Crystal Cultist"] = {
		Id = 10184401391,
		Name = "Crystal Cultist",
		AltCards = {
			["Crystal Cultist-Alt"] = {
				Id = 10184400037,
				AttackEffect = "Slash",
				AltArt = true,
				Name = "The Crystal Cultist",
				Effect = {
					Power = { {
						"AddGenZone",
						{ "Crystal Cultist-Alt", 1 }
					} }
				},
				Bio = "With great gains comes great hordes of cultists."
			},
			Aurebus = {
				Name = "Aurebus",
				AttackEffect = "Scratch",
				Id = 10184154843,
				AltArt = true,
				Effect = {
					Power = { {
						"AddGenZone",
						{ "Aurebus", 1 }
					} }
				},
				Bio = "Nothing gives ultimate joy than an artist drawing for themselves."
			},
			["Crystal Cultist-AN"] = {
				Name = "Cannonman",
				AttackEffect = "ModernRocket",
				Id = 9347974659,
				Effect = {
					Power = { {
						"AddGenZone",
						{ "Crystal Cultist-AN", 1 }
					} }
				},
				Bio = ""
			}
		},
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
	superkicker2005 = {
		Id = 9964894704,
		Name = "superkicker2005",
		AltCards = {
			["Myrmiredon 4"] = {
				Id = 9964899951,
				AttackEffect = "Jab",
				Name = "Lunat_C",
				CopyBodge = "Myrmiredon 4",
				Bio = "You take the moon and you take the moon and you take the moon and you take the moon."
			},
			["superkicker2005-Sun"] = {
				Id = 9144425687,
				AttackEffect = "SoccerKick",
				Name = "Lifeguard",
				Bio = "No body of water is safe without a lifeguard! Including that cup of water!"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Futbol",
		EffectAnimation = "Goal",
		Color = "Red",
		Cost = { Red = 2, Neutral = 2 },
		Effect = {
			Name = "Life fam",
			Description = "Whenever this card attacks your opponent directly: They lose 800 life.",
			Type = "OnStrike",
			Power = { { "Inflict", 800, "Opponent" } },
			Target = "Opponent"
		},
		Bio = "Hey what's up guys, it's your boi - SUPAHKICKER2005! Back with another LEGIT Minecraft review."
	},
	One4utwo4me = {
		Id = 10242980849,
		Name = "One4utwo4me",
		AltCards = {
			["One4utwo4me-ArtV"] = {
				Id = 10242982447,
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "I watched a snail crawl along the edge of a straight razor. That's my dream; that's my nightmare. Crawling, slithering, along the edge of a straight razor... and surviving."
			},
			["One4utwo4me-AN"] = {
				Id = 9368635810,
				AttackEffect = "ModernRocket",
				Bio = "I'm starting to think that this military stuff isn't 4 me."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Bleeding",
			Description = "Whenever this card attacks your opponent directly: It gains 400 power.",
			Type = "OnStrike",
			Power = { { "Strengthen", 400 } },
			Target = "Self"
		},
		Bio = " Someday this war's gonna end... "
	},
	["Swarm of Bats"] = {
		Id = 10279332121,
		Name = "Panwellz",
		AltCards = {
			["Partey Lover"] = {
				Name = "Partey Lover",
				AttackEffect = "Scratch",
				Id = 10279337068,
				AltArt = true,
				Bio = "He loves to partey!"
			},
			["Panwellz-AN"] = {
				Name = "Swarm of Bats",
				AttackEffect = "Scratch",
				Id = 9354422180,
				Bio = "Hallow has inventive ways of getting people to speak."
			}
		},
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 2 },
		Effect = {
			Description = "Whenever you cast a fighter that costs 4 or fewer total studs: Give yourself a card that's a copy of that card, except it's a 0/0 action that's inert in all zones.",
			Type = "OnAllySummon",
			Power = { {
				Power = "AddCopy",
				Target = "Aggressor",
				MetaData = { Health = 0, Power = 0, TokenOmni = true }
			} },
			LowCost = 4,
			Target = "Ally"
		},
		Bio = "In all his years committing insurance fraud, few people have been as gullible as the Federation Earls."
	},
	wi_sh = {
		Id = 8606239738,
		Name = "wish_z",
		AltCards = {
			["Black Marshal Losternmeyer"] = {
				Id = 10184218171,
				Name = "Black Marshal Losternmeyer",
				AttackEffect = "Microphone",
				AltArt = true,
				Bio = "\"We'll carry on! And though you're dead and done, believe me. Your memory will carry on!\""
			},
			["WILDCARD MONNIE"] = {
				Id = 132604631292751,
				Name = "WILDC∀RD : MONNIE",
				AttackEffect = "MoltenScythe",
				AltArt = true,
				PremiumArt = 420,
				SummonAnimation = "ChairmanSummon",
				SummonedAnimation = "ChairmanSummon",
				Bio = "I CAN DO ANYTHING!!"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Legendary",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Token = true,
		EffectVariable = 0,
		Effect = {
			Name = "Tycoon Money",
			Description = "When this card is cast: Apply the following effects based on the colours of allied fighters.\n{R} - +0/+600\n{G} - +600/+0 \n{B} - +150/+150 and draw a card.\n{Y} - +150/+150 and unlock this card.",
			Type = "OnSummon",
			Power = {
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Red", "Nil" }
				},
				{
					"AlterEV",
					{ "Gate", "Math", 0, "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 600, "Nil" }
				},
				{ "Strengthen", "Variable" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Green", "Nil" }
				},
				{
					"AlterEV",
					{ "Gate", "Math", 0, "Nil" }
				},
				{
					"AlterEV",
					{ "Multiply", "Math", 600, "Nil" }
				},
				{ "Heal", "Variable" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Blue", "Nil" }
				},
				{
					"AlterEV",
					{ "Gate", "Math", 0, "Nil" }
				},
				{ "Draw", "Variable", "Ally" },
				{
					"AlterEV",
					{ "Multiply", "Math", 150, "Nil" }
				},
				{ "Heal", "Variable" },
				{ "Strengthen", "Variable" },
				{
					"AlterEV",
					{ "Set", "Field_Ally", "Yellow", "Nil" }
				},
				{
					"AlterEV",
					{ "Gate", "Math", 0, "Nil" }
				},
				{ "Unlock", "Variable" },
				{
					"AlterEV",
					{ "Multiply", "Math", 150, "Nil" }
				},
				{ "Heal", "Variable" },
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "No dodgeballs. No plushies. No fun allowed."
	},
	Imaginz00 = {
		Id = 10445101957,
		Name = "RBLXImagineer",
		AltCards = {
			["Partnyas in Crime"] = {
				Name = "Partnyas in Crime",
				AttackEffect = "Blizzard",
				Id = 11157677003,
				AltArt = true,
				Effect = {
					Name = "Zappow!",
					Description = "When this card dies: Give yourself three strong red and green furry fighters.",
					Type = "OnDeath",
					Power = {
						{ "Add", "Flufflefunz, Forever Lost" },
						{ "Add", "Spotty Catligrapher Trixie" },
						{ "Add", "Strongest Ice Witch, Sylvia" }
					},
					Target = "Ally"
				},
				Bio = "[Cat Nonsense]"
			},
			["Imaginz00-AN-Offer"] = {
				Name = "The Pretender",
				AttackEffect = "MagicRed",
				Id = 18404812315,
				Effect = {
					Name = "Zappow!",
					Description = "When this card dies: Give yourself three strong red and green Roxstars.",
					Type = "OnDeath",
					Power = {
						{ "Add", "The Champions" },
						{ "Add", "PuffleTacoY3K" },
						{ "Add", "Stickmasterluke, Retired Roxstar" }
					},
					Target = "Ally"
				},
				Bio = "WHAT IF I SAY I'M NOT LIKE THE OTHERS?"
			}
		},
		Health = 1250,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 5, Red = 1, Green = 1 },
		CustomReminder = {
			CurbM0nkey = "A 4{R}{G} 500/500. When cast, it deals 200 damage to all enemy fighters. They lose 200 Power.",
			FarazTheGreat = "A 3{W}5{R} 1000/1000 with overload. Whenever it attacks, your opponent loses 600 life.",
			BeachBumRB = "A 3{W}5{G} 1500/0. It summons a 150/150 Zombie during your end step, then all allied Zombies gain 100 Health and Power."
		},
		Effect = {
			Name = "Zappow!",
			Description = "When this card dies: Give yourself 3 strong red and green Rthro fighters.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Monstrum Minotauris" },
				{ "Add", "Monstrum Zombie King" },
				{ "Add", "Monstrum Freezer" }
			},
			Target = "Ally"
		},
		Bio = "Converging Roblox closer to the Metaverse ideal."
	},
	["Monstrum Freezer"] = {
		Id = 12703408467,
		Name = "CurbM0nkey",
		AltCards = {
			["Strongest Ice Witch, Sylvia"] = {
				Name = "Strongest Ice Witch, Sylvia",
				AttackEffect = "Blizzard",
				Id = 11202793983,
				Bio = "Just pretend I put an ice pun here, okay?"
			},
			["Stickmasterluke, Retired Roxstar"] = {
				Name = "Stickmasterluke, Retired Roxstar",
				AttackEffect = "Blizzard",
				Id = 18404813219,
				Bio = "The trophy of old filled the developer with triumph and nostalgia. Could there be a new one? What kinds of champions will replace the long-forgotten ones with their new tunes and tech? It's only up to ROBLOX to decide if they want to return to this music festival from days gone by."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Red = 4, Green = 4 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Deal 200 damage to all enemy fighters. They lose 200 power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{ "Weaken", 200 }
			},
			Target = "Opponent"
		},
		Bio = "Express yourself in the exact same way!"
	},
	["Monstrum Minotauris"] = {
		Id = 10445100840,
		Name = "FarazTheGreat",
		AltCards = {
			["Flufflefunz, Forever Lost"] = {
				Name = "Flufflefunz, Forever Lost",
				AttackEffect = "Scratch",
				Id = 137112079284609,
				Bio = "We could go anywhere, but we will always be where we are."
			},
			["The Champions"] = {
				Name = "The Champions",
				AttackEffect = "Scratch",
				Id = 18404813033,
				Bio = "NO TIME FOR LOSERS"
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		Overload = true,
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 5, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "Whenever this card attacks: Your opponent loses 600 Life.",
			Type = "OnAttack",
			Power = { { "Inflict", 600 } },
			Target = "Opponent"
		},
		Bio = "Cast your old form into the pyre."
	},
	["Monstrum Zombie King"] = {
		Id = 10445098042,
		Name = "BeachBumRB",
		AltCards = {
			["Spotty Catligrapher Trixie"] = {
				Name = "Spotty Catligrapher Trixie",
				AttackEffect = "Slash",
				Id = 11194282345,
				Bio = "Ink!Sylvia"
			},
			PuffleTacoY3K = {
				Name = "PuffleTacoY3K",
				AttackEffect = "Slash",
				Id = 18404813440,
				Effect = {
					Name = "Stud",
					Description = "During your end step: Summon a 150/150 Reanimated Great-Great-Great Grand Daughter. All Babylonians gain 100 health and power.",
					Type = "OnEnd",
					Power = {
						{ "Summon", "GreatGreatGreat" },
						{ "Heal", 100, "Archetype" },
						{ "Strengthen", 100, "Archetype" }
					},
					Target = "Ally"
				},
				Bio = "not much has changed but they live underwater"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Archetype = "Babylon",
		Cost = { Green = 5, Neutral = 3 },
		Effect = {
			Name = "Stud",
			Description = "During your end step: Summon a 150/150 Reanimated. All allied Babylonians gain 100 health and power.",
			Type = "OnEnd",
			Power = {
				{ "Summon", "Gambit 1" },
				{ "Heal", 100, "AlliedArchetype" },
				{ "Strengthen", 100, "AlliedArchetype" }
			},
			Target = "Ally"
		},
		Bio = "Fishing up a win."
	},
	SomaticMizuSan = {
		Id = 10534881395,
		Name = "SomaticMizuSan",
		AltCards = {
			["SomaticMizuSan-E"] = {
				Id = 9964892606,
				Name = "Vinny The Rabbit",
				Bio = "No more hunting for eggs, I'm hunting for YOU."
			},
			["Sleazy ManixDash"] = {
				Id = 129389501947906,
				AttackEffect = "Microphone",
				AltArt = true,
				Name = "Sleazy ManixDash",
				Bio = "Stealing your opponents bobux is only a crime if you get caught!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4, Red = 1 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Select any number of cards in your hand. Remove {W}{W}{W}{W} from their cost, then add {R}{G}{B}{Y} to it.",
			Ability = {
				OnSummon = {
					Power = { { "MultiSelectOperation", "OhioRizzFortnite", "CustomZoneTarget" } },
					Target = "Self",
					ZoneTargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = {},
						SelectionDescription = "which cards you want to Skibidi Ohio Rizz",
						MinTargets = 0,
						MaxTargets = 10
					}
				},
				MultiSelectOperationOhioRizzFortnite = {
					Power = {
						{
							"IncreaseCost",
							{ -4, "Neutral", "Nil" }
						},
						{
							"IncreaseCost",
							{ 1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ 1, "Blue", "Nil" }
						},
						{
							"IncreaseCost",
							{ 1, "Green", "Nil" }
						},
						{
							"IncreaseCost",
							{ 1, "Yellow", "Nil" }
						}
					},
					Target = "Aggressor",
					NoBlip = true
				}
			}
		},
		Bio = "The sword, minus the smoke, actually makes good sense, and the double crossguard, whilst not as affective as two rings, are logical and safe. Minus points for the two sword-scabbards on the back, though. 7/10 - Sword Critic"
	},
	["Classy Bear"] = {
		Id = 8606232931,
		Name = "Terra Warrior",
		AltCards = {
			["Zombie Santa"] = {
				Name = "Zanta",
				AttackEffect = "Scratch",
				Id = 11344376953,
				Bio = "Since Santa travels EVERYWHERE the night before Christmas, doesn’t he have the chance of contracting and spreading deadly diseases throughout everybody’s homes?"
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		CounterAttackBlock = true,
		StrengthenImmune = true,
		SetImmune = true,
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Monocle Polish",
			Description = "Whenever this card attacks: The fighter it attacked loses 200 power.",
			Type = "OnAttack",
			Power = { { "Weaken", 200 } },
			Target = "Aggressor"
		},
		Bio = "Terra warriors insist that humans were at their prime when they were still nomadic tribes. Thus, they return to their roots to stay at their species' peak."
	},
	Turkeytron = {
		Id = 8421453301,
		Name = "ChickenEngineer",
		CopyBodge = "Turkeytron",
		AltCards = {
			["ChickenEngineer-Bert"] = {
				Id = 8538065864,
				Name = "Todd the Turnip",
				AttackEffect = "Bubbles",
				Bio = "The best turnip janitor is here!"
			},
			["ChickenEngineer-E"] = {
				Id = 8650637473,
				AttackEffect = "LaserYellow",
				Bio = "At long last... the pre-historic Easter Chicken."
			},
			Rayxt = {
				Id = 115656084999368,
				Name = "Rayxt",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 599,
				Bio = "FO!!!!"
			}
		},
		Health = 400,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 3 },
		Effect = {
			Name = "Gobble",
			Description = "When this card is cast: Set the Power of all fighters to 400.",
			Type = "OnSummon",
			Power = { { "SetPower", 400 } },
			Target = "All"
		},
		Bio = "I AM THE TRUE ENGINEER.\nBOW BEFORE MY CREATION."
	},
	TheNStar = {
		Id = 11812008385,
		Name = "TheNstar",
		AltCards = {
			["TheNStar-C"] = {
				Id = 8234113033,
				AttackEffect = "IcePunch",
				Summonant = "TheNStarrr-C",
				Bio = "Pain."
			}
		},
		Health = 300,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Summonant = "TheNStarrr",
		Effect = {
			Name = "Nature's Gift",
			Description = "Whenever you cast another fighter: Obliterate it. Summon a copy of this card without its effect.",
			Type = "On|Other|AllySummon",
			Power = {
				{ "Obliterate", 9999, "Aggressor" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "Star #789 has gone supernova. Put Star #790 on the Dinner Table, please."
	},
	TheNStarrr = {
		Id = 11812008385,
		Name = "TheNStar",
		AltCards = {
			["TheNStarrr-C"] = { Id = 8234113033, AttackEffect = "IcePunch", Bio = "Pain." }
		},
		Health = 300,
		Power = 350,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		Effect = {
			Name = "Nature's Gift",
			Description = "",
			Type = "Null",
			Power = {
				{ "Obliterate", 9999, "Aggressor" },
				{ "Summon", "Summonant" }
			},
			Target = "Ally"
		},
		Bio = "Star #790 has gone supernova. Put Star #791 on the Dinner Table, please."
	},
	ExtolYT = {
		Id = 5987058152,
		Name = "ExtolYT",
		AltCards = {
			["Electric Chaosbringers"] = {
				Id = 6648631816,
				Name = "Electric Chaosbringers",
				AltArt = true,
				Effect = {
					Power = {
						{ "Strengthen", 250 },
						{ "Heal", 250 },
						{ "Return", 30 },
						{ "Yellow", -1 },
						{ "Yellow", 1 },
						{ "Summon", "EC Token" }
					}
				},
				Bio = "When the competition is high, you know they'll be waiting for that sweet window of opening to strike."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		Effect = {
			Name = "Pancake Break 2.0",
			Description = "All allied fighters gain 250 Health and Power.\nReturn them to your hand.\nSummon a 1200/400 fighter with no abilities.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 250 },
				{ "Heal", 250 },
				{ "Return", 30 },
				{ "Summon", "ExtolYToken" }
			},
			Target = "Ally"
		},
		Bio = "Aha! After studying various \"planets\" collapsing under their own \"power\", I have managed to create this \"contraption\" which will only affect a select few \"beings\". The \"effects\" of this \"contraption\" not only \"sends\" those whom are within its \"requirements\" to a different \"spacial position\", but it also \"awakens\" their \"true potential!\""
	},
	ExtolYToken = {
		Id = 8421474372,
		Name = "ExtolYT",
		AltCards = {
			["EC Token"] = {
				Id = 6648632241,
				AttackEffect = "Electric",
				Name = "Electric Chaosbringers",
				Bio = "\"Shifting the field, deal the finishing blow, Steve!\""
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 7 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "And now... it is time you \"witness\" firsthand this \"power\" that I have \"granted\" to those \"individuals\". Try not to \"waste\" away your \"strength\" by \"charging\" straight into their \"full power\"."
	},
	SpacielChiald = {
		Id = 8421375554,
		Name = "SpacielChiald",
		AltCards = {
			Creating_Worlds = {
				Id = 6902330377,
				Name = "Creating_Worlds",
				AltArt = true,
				Bio = "He sees the sun going down, and the eyes in his head, see the world spinning round."
			},
			AVLCC = {
				Id = 98235388884204,
				Name = "A very little clever commander",
				PremiumArt = 785,
				AltArt = true,
				Bio = "let me help you search something that you lost"
			},
			["Lemonade Girl"] = {
				Id = 16738205836,
				Name = "Lemonade Girl",
				PremiumArt = 235,
				AltArt = true,
				Bio = "Causally draws 1 (terrain) for 2B on every end step."
			}
		},
		Health = 700,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Gravity",
		Color = "Blue",
		Cost = { Blue = 2 },
		Token = true,
		Effect = {
			Name = "ARE YOU HAPPY, DAIR?",
			Description = "During your end step: Search your deck for a terrain card.",
			Type = "OnEnd",
			Power = { { "RandomTutorfor", "Terrain" } },
			Target = "Ally"
		},
		Bio = "She is a master beyblader. That's pretty special."
	},
	["Crystalline Megaflora"] = {
		Id = 10288692353,
		Name = "Crystalline Megaflora",
		AltCards = {
			["Crystalline Megaflora-AN"] = {
				Id = 10445109255,
				AttackEffect = "Jab",
				Name = "The Golem That Time Forgot",
				Bio = "Ah...? I thought he was only a sleeve."
			},
			GabyTaby707 = {
				Id = 16056322794,
				Name = "GabyTaby707",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 207,
				Bio = "I <3 Meeboids"
			},
			["The Overseer"] = {
				Id = 138351489683033,
				Name = "The Overseer",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 660,
				Bio = "\"One who watches over the trials, he will watch over the life they live now.\""
			}
		},
		Health = 3000,
		Power = 3000,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 24 },
		SummonAnimation = "FloralSummon",
		EffectAnimation = "FloraBuffAlly",
		Effect = {
			Name = "ARE YOU HAPPY, DAIR?",
			Description = "When this card is cast: Set the stats of all allied fighters to 3000/3000.",
			Type = "OnSummon",
			Power = {
				{ "SetHealth", 3000 },
				{ "SetPower", 3000 }
			},
			Target = "Ally"
		},
		Bio = ""
	},
	Kariu = {
		Id = 8421491299,
		Name = "Kariu",
		AltCards = {
			["Kariu-ArtV"] = { Id = 5573601981, Bio = "Consider yourself blessed." }
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 5 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Each fighter with highest power loses 400 power, then a target fighter loses 400 power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 400, "HighestPower" },
				{ "Weaken", 400 }
			},
			Target = "Single"
		},
		Bio = "Consider me blessed."
	},
	ReverseBackwards = {
		Id = 10288433265,
		Name = "ReverseBackwards",
		AltCards = {
			["ReverseBackwards-E"] = {
				Id = 10288445906,
				AttackEffect = "Gravity",
				Bio = "えぐえぐえぐえぐえぐえぐえぐ"
			},
			["Legendary DrWeaseI"] = {
				Id = 10288448016,
				AltArt = true,
				Name = "Lead Gravity Inspector",
				AttackEffect = "Gravity",
				Bio = "This card is an alternate art of ReverseBackwards."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 6 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever you cast a fighter: Swap the stats of a target fighter.",
			Type = "OnAllySummon",
			Power = { { "Swap", 100000 } },
			Target = "Target"
		},
		Bio = "Also known as Esrever. He judges mortals with his omnipotent 8 ball."
	},
	mickymack = {
		Id = 10388358791,
		Name = "mickymack",
		AltCards = {
			["Edge Gaming Epik_Nob"] = {
				Name = "Assassin Epik_Nob",
				AttackEffect = "Venomshank",
				Id = 9336249069,
				AltArt = true,
				Bio = "He hunts down everybody who has become 💬 🍓 🐘."
			}
		},
		Health = 250,
		Power = 350,
		Rarity = "Uncommon",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Sudden Death",
			Description = "When this card is cast: You gain {R}{Y}.",
			Type = "OnSummon",
			Power = {
				{ "Red", 1 },
				{ "Yellow", 1 }
			},
			Target = "Self"
		},
		Bio = "Micky Mack gonna micky smack you with some wickety wack micky mack rhymes SON!"
	},
	Mariochocolatemilk = {
		Id = 10288421458,
		Name = "Mariochocolatemilk",
		AltCards = {
			["Mariochocolatemilk-Sun"] = {
				Id = 9180256361,
				AttackEffect = "Slash",
				Bio = "Smile in the count of 3!!! 3 2 1 Cheese!!"
			}
		},
		Health = 850,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 5 },
		Effect = {
			Name = "Alien Probe",
			Description = "When this card is cast or dies: Set the stats of all allied fighters to 850/200. Reveal your opponent's hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "SetHealth", 850 },
						{ "SetPower", 200 },
						{ "RevealHand", 999, "Opponent" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "SetHealth", 850 },
						{ "SetPower", 200 },
						{ "RevealHand", 999, "Opponent" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Digital Style!"
	},
	ProjectSlayer = {
		Id = 9964868533,
		Name = "ProjectSlayer",
		Health = 650,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LaserRed",
		Color = "Red",
		Cost = { Red = 3 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: Your opponent loses {W}.",
			Type = "OnSummon",
			Power = { { "Neutral", -1 } },
			Target = "Opponent"
		},
		Bio = "The Federation destroyed Kathara, but not its people."
	},
	["Body Guards"] = {
		Id = 8606238286,
		Name = "SirMing",
		AltCards = {
			["Nacho, the Battle Angel"] = {
				Name = "Nacho, the Battle Angel",
				AttackEffect = "Storm",
				Id = 7128384710,
				AltArt = true,
				Bio = "BATTLE CRY!"
			},
			["SirMing-Hal"] = {
				Name = "SaveMing",
				AttackEffect = "MagicGreen",
				Id = 7556374575,
				Bio = "He caused friendly fire for the last time."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 1, Red = 1, Green = 1 },
		Effect = {
			Name = "Protection",
			Description = "When this card is cast: Deal 300 damage to each fighter with the lowest health, then each fighter with the lowest power.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 300, "LowestHealth" },
				{ "Damage", 300, "LowestPower" }
			},
			Target = "Single"
		},
		Bio = "I don't pick sides."
	},
	GalaxyFlame = {
		Id = 10279279466,
		Name = "GalaxyFlame",
		AltCards = {
			["Myrmiredon 2"] = {
				Id = 10279282079,
				AttackEffect = "Blaze",
				Bio = "I heat up planets like yours to melt all your ice caps and watch you all burn."
			},
			["GalaxyFlame-Sun"] = {
				Id = 9197527408,
				Bio = "I torch the masses with a searing fury, as strong as a giant fireball. "
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "FirePunch",
		EffectAnimation = "SmallMagicBlueEffect",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Charge",
			Description = "When this card is cast: A target fighter loses 100 power. Unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100 },
				{ "Unlock", 1, "Self" }
			},
			Target = "Single"
		},
		Bio = "I torch noobs like you for breakfast, lunch, and dinner."
	},
	["Enriched Neutrinous"] = {
		Id = 8421503283,
		Name = "Enriched Neutrinous",
		AltCards = {
			["Enriched Neutrinous-C"] = {
				Id = 8139819357,
				AttackEffect = "Slash",
				Name = "Ghost of Christmas Future",
				Bio = "It seems you've ate the wrong cookies. I'm afraid your future isn't looking quite jolly."
			},
			["Evil Ringo"] = {
				Id = 99305666961510,
				Name = "US",
				AltArt = true,
				PremiumArt = 276,
				Bio = "Your life is your own, Carol. We just want to make you happy."
			}
		},
		Health = 800,
		Power = 100,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 3 },
		Effect = {
			Name = "Poisonous Touch",
			Description = "Whenever you discard your second card each turn: Give yourself an epic Green card.",
			Type = "OnAllyDiscard",
			Power = { { "RandomAdd", "MonoOnlyorGreenCost Epic Green" } },
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 2, 3, "DiscardCount" }
		},
		Bio = "Get up lazy bones! While you slept and took fire, we did ALL the work!"
	},
	Zolerus = {
		Id = 8421486052,
		Name = "Zolerus",
		AltCards = {
			["Zolerus-E"] = {
				Id = 8650903707,
				CopyBodge = "Zolerus-E",
				AttackEffect = "Swamp",
				Bio = "What do teapots have anything to do with Easter?"
			},
			["ppprc, The Hunter"] = {
				Id = 15941931424,
				Name = "ppprc, The Hunter",
				AttackEffect = "Whirlpool",
				AltArt = true,
				PremiumArt = 191,
				Bio = "Stupid moths, I'll get all of you!"
			},
			["Ari S Cataclysmician"] = {
				Id = 71560322933885,
				Name = "Ari S., Cataclysmician",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "\"A small glass of peach brandy, delicious as eternity[…]. You are secure in the knowledge that all will still be here […].<br/>The bells sound all across London. Another hour passed – of how many? Enough. And what will you do with them? That is for you to determine, and only you.<br/>[...] for now, you listen to the silent song of the Aurora. It sings of home.\""
			}
		},
		Health = 750,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 4, Green = 3 },
		Addant = "Green Stud",
		Effect = {
			Name = "Demon Eye",
			Description = "When this card is cast: All fighters lose 200 power, then destroy all enemy fighters with 0 Power. Give yourself a Green Stud.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{
					"CheckPower",
					{ 0, 1 },
					"Opponent"
				},
				{ "Add", "Addant", "Ally" }
			},
			Target = "All"
		},
		Bio = "Teapots with Adurite textures are the shyest."
	},
	Graalgamer = {
		Id = 10279285628,
		Name = "Graalgamer",
		AltCards = {
			["Graalgamer-E"] = {
				Name = "Garden Gnome",
				AttackEffect = "Jab",
				Id = 9075353813,
				Bio = "I'm gnot a gnelf, I'm gnot a gnoblin, I'm a gnome!"
			},
			GuestsAreResilient = {
				Name = "GuestsAreResilient",
				AttackEffect = "MagicRed",
				Id = 10279287173,
				AltArt = true,
				Bio = "Did you really hit the Challenge button expecting anything else? I don't know how the game is going right now; I might be destroying or being destroyed, but I should still have a point. Oh, you also read my bio again. There goes 8 seconds of your life. Not sorry."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 1 },
		Effect = {
			Name = "Toasty",
			Description = "Once each turn, Whenever an enemy fighter dies: Unlock this card.",
			Type = "OnEnemyDeath",
			Power = { { "Unlock", 999, "Self" } },
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "Javion's economy is almost entirely tourists flocking towards the Lunar Spire. The awesome beaches are an added bonus."
	},
	BoomAtack = {
		Id = 9964814934,
		Name = "Imakuni_BoomAtack",
		AltCards = {
			["Imakuni_BoomAtack-C"] = {
				Name = "SnowAtack",
				AttackEffect = "Blizzard",
				EffectAnimation = "MidBlizzardSelf",
				Id = 9964815880,
				Bio = "His shirt is sus."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Flame",
		EffectAnimation = "SelfFlame",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "When this card is cast, if there's an allied fighter of each colour: All allied fighters gain 200 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 200 } },
			EffectRequirement = { "Chromatic", "Ally", 4 },
			Target = "Ally"
		},
		Bio = "\"BOOM, a tack!\""
	},
	Cyclist = {
		Id = 10280830968,
		Name = "JakeTheNewb",
		AltCards = {
			["JakeTheNewb-C"] = {
				Name = "Reindeer",
				AttackEffect = "Slash",
				EffectAnimation = "MidMagicRedEffect",
				Id = 8154275124,
				Bio = "AND it's got anti-gravity hooves? That's a suspiciously wealthy deer."
			},
			Chaseroony = {
				Name = "Chaseroony",
				Id = 10280810958,
				AttackEffect = "ModernRocket",
				EffectAnimation = "MidModernRocketEffect",
				NoFoilWorth = true,
				Bio = "icYteA iS NOT a deVeloPEr."
			}
		},
		Health = 200,
		Power = 700,
		Rarity = "Rare",
		AttackEffect = "LaserBlue",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Blue",
		Cost = { Blue = 5, Yellow = 1 },
		Effect = {
			Name = "Charge",
			Description = "When this card is cast: A target fighter loses 300 Power. Unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 300 },
				{ "Unlock", 1, "Self" }
			},
			Target = "Single"
		},
		Bio = "Did you see that move I pulled in the game's trailer? Then check THIS one out!"
	},
	Are14 = {
		Id = 8421451193,
		Name = "Are14",
		AltCards = {
			["Edge Gaming Konsyes1"] = {
				Id = 9336148285,
				AttackEffect = "Revolver",
				Name = "Konsyes1, Unknown Anonymous",
				AltArt = true,
				Bio = "Nobody knows what's inside of that briefcase... And no one will."
			},
			["Are14-AN"] = {
				Id = 9362063337,
				Name = "Crazy Robloxian",
				Bio = "GIVE ME THE HOTDOG!!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		Effect = {
			Name = "Polar Amp",
			Description = "When this card is cast: A target fighter gains 100 Power. Give yourself a Yellow card.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "RandomAdd", "MonoOnlyorYellowCost Yellow" }
			},
			Target = "Single"
		},
		Bio = "CUT! You guys forgot the funny!"
	},
	Are92 = {
		Id = 8421450174,
		Name = "Are92",
		AltCards = {
			["Edge Gaming Valython"] = {
				Name = "Gunsmith Valython",
				AttackEffect = "Gun",
				Id = 9336163189,
				AltArt = true,
				Bio = "Carpet floor be careful."
			},
			ElementalRegen = {
				Name = "ElementalRegen",
				AttackEffect = "Rifle",
				Id = 9604940822,
				AltArt = true,
				Bio = "\"I'm going to pray to god that I don't get a Hush Puppy, be right back.\""
			},
			["Are92-AN"] = {
				Name = "Wacky Inflatable Tubemans",
				AttackEffect = "Slash",
				Id = 9513515909,
				Bio = "WAVE LIKE A WEAPONIZED OCEAN!!!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 2 },
		Effect = {
			Name = "Tiger Amp",
			Description = "When this card is cast: A target fighter gains 100 Health. Give yourself a Yellow card.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100 },
				{ "RandomAdd", "MonoOnlyorYellowCost Yellow" }
			},
			Target = "Single"
		},
		Bio = "If you ever wonder what Roblox YouTube videos looked like in 2007, look Are92 up."
	},
	["74Riley"] = {
		Id = 9964693973,
		Name = "74Riley",
		AltCards = {
			powerblastX = {
				Id = 9964694941,
				AttackEffect = "Whirlpool",
				Name = "powerblastX",
				AltArt = true,
				Bio = "Meet my stand [Za Ducko Requiem]! The Ultimate Stand!"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4 },
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an enemy fighter dies: Your opponent loses 300 life.",
			Type = "OnEnemyDeath",
			Power = { { "Inflict", 300, "Opponent" } },
			Target = "Ally"
		},
		Bio = "The first 73 Rilies caused him trouble."
	},
	["Bad Bread"] = {
		Id = 10288662229,
		Name = "Space Sandwich",
		CopyBodge = "Bad Bread",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 3 },
		EffectAnimation = "EatSpaceSandwich",
		EffectVariable = 0,
		IsFood = true,
		Effect = {
			Name = "Poison",
			Description = "A target allied fighter gains 150 Health. You gain life equal to its Health.\nA target allied fighter gains 150 Power. You gain life equal to its Power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 150 },
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Cost", "Variable" },
						{
							"AlterEV",
							{ "Set", "Math", 1, "Nil" },
							"Self"
						},
						{ "EVGreaterValueCheck", 0, "Self" }
					},
					Target = "SingleAlly"
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 150 },
						{
							"AlterEV",
							{ "Set", "Target", "Power", "Nil" }
						},
						{
							"AlterEV",
							{ "Multiply", "Math", -1, "Nil" }
						},
						{ "Cost", "Variable" }
					},
					Target = "SingleAlly",
					NoBlip = true
				}
			}
		},
		Bio = "People ask me if it's morally ethical to let humans eat space aliens for lunch? Honestly, it's ethical only if they taste good."
	},
	["Infinite Wishes"] = {
		Id = 8421498810,
		Name = "Infinite Wishes",
		AltCards = {
			["Avantine Again"] = {
				Id = 125468644016422,
				Name = "Avantine, Again!",
				Commissioner = { "Avantine" },
				Addant = "Avantine Again",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 782,
				Effect = {
					Name = "Infinite Wishes",
					Description = "All allied fighters gain 150 health. You gain 150 life.\nGive yourself a copy of this card, except it costs an additional {G}.",
					Type = "OnSummon",
					Power = {
						{ "Heal", 150 },
						{ "Cost", -150 },
						{ "Add", "Addant" },
						{
							"IncreaseCost",
							{ 1, "Green", "CopyCardCost" },
							"AlliedFirstSelfCopy"
						}
					},
					Target = "Ally"
				},
				Bio = "One step closer to either of my 16G win conditions, just you WAIT.."
			},
			["Infinite Chipotle"] = {
				Id = 104275508306819,
				Name = "Infinite Chipotle",
				AttackEffect = "Jab",
				Addant = "Infinite Chipotle",
				AltArt = true,
				PremiumArt = 784,
				Effect = {
					Name = "Infinite Wishes",
					Description = "All allied fighters gain 150 health. You gain 150 life.\nGive yourself a copy of this card, except it costs an additional {G}.",
					Type = "OnSummon",
					Power = {
						{ "Heal", 150 },
						{ "Cost", -150 },
						{ "Add", "Addant" },
						{
							"IncreaseCost",
							{ 1, "Green", "CopyCardCost" },
							"AlliedFirstSelfCopy"
						}
					},
					Target = "Ally"
				},
				Bio = "obliterate"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		Color = "Green",
		Cost = { Green = 3 },
		Addant = "Infinite Wishes",
		Archetype = "Infinite",
		Fading = true,
		Effect = {
			Name = "Infinite Wishes",
			Description = "All allied fighters gain 150 health. You gain 150 life.\nGive yourself a copy of this card, except it costs an additional {G}.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 150 },
				{ "Cost", -150 },
				{ "Add", "Addant" },
				{
					"IncreaseCost",
					{ 1, "Green", "CopyCardCost" },
					"AlliedFirstSelfCopy"
				}
			},
			Target = "Ally"
		},
		Bio = "ALWAYS wish for more wishes."
	},
	["Infinite Frost"] = {
		Id = 8421399744,
		Name = "Infinite Frost",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		Color = "Blue",
		Addant = "Infinite Frost",
		Cost = { Blue = 3 },
		Archetype = "Infinite",
		Fading = true,
		EffectVariable = 0,
		Effect = {
			Name = "Infinite Frost",
			Description = "Draw a card.\nThe newest card in your hand becomes inert in all zones.\nGive yourself a copy of this card, except it costs an additional {B}.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Draw", 1, "Ally" },
						{ "EVExactValueCheck", 0 },
						{ "GivePassive", "TokenOmni", "AlliedRightMostHand" }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Add", "Addant", "Ally" },
						{
							"IncreaseCost",
							{ 1, "Blue", "CopyCardCost" },
							"AlliedFirstSelfCopy"
						}
					},
					Target = "Ally"
				}
			}
		},
		Bio = "It might seem like hypothermia, but in reality its like getting knocked in the face with a dodgeball."
	},
	["Infinite Flames"] = {
		Id = 6836522820,
		Name = "Infinite Flames",
		AltCards = {
			["Infinite Flames-Banner"] = {
				Id = 12941988092,
				Name = "Supersonic Eggstrike!",
				Addant = "Infinite Flames-Banner",
				Bio = "<i>Egg-sterminate the enemy! Egg-liminate them all! Egg-destroy, whatever! Kick them in the leg, I don't know!</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		Color = "Red",
		Addant = "Infinite Flames",
		Archetype = "Infinite",
		EffectAnimation = "FireBreathEnemy",
		Fading = true,
		Cost = { Red = 3 },
		Effect = {
			Name = "Infinite Flames",
			Description = "Deal 150 damage to all enemy fighters.\nGive yourself a copy of this card, except it costs an additional {R}.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 150, "Opponent" },
				{ "Add", "Addant", "Ally" },
				{
					"IncreaseCost",
					{ 1, "Red", "CopyCardCost" },
					"AlliedFirstSelfCopy"
				}
			},
			Target = "Single"
		},
		Bio = "BURN! BURN! BURN! BURN... BURRRRN!!!"
	},
	["Infinite Chicken"] = {
		Id = 8421515127,
		Name = "Infinite Chicken",
		AltCards = {
			["Infinity Chicken-Art"] = {
				Id = 5698330301,
				Addant = "Infinity Chicken-Art",
				Bio = "This... This will change everything...! FIIIIINAL CHIIIIIIIIIIIIICKEN!!!"
			},
			Keeberry = {
				Id = 94185719621740,
				Name = "EVERYTHING'S GNARLY!!!",
				PremiumArt = 236,
				AltArt = true,
				Addant = "Keeberry",
				Bio = "</b>\"HOTTIE HOTTIE, LIKE A BAG OF TAKIS IM LEGIT. IM LEGIT. OBVI OBVI, THEY BE TRYNA COPY, I'M LEGIT, I'M LEGIT!!! G-G-G-G-G-GNARLY! EVERYTHING'S GNARLY!\"</b>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Null",
		Color = "Yellow",
		Addant = "Infinite Chicken",
		Archetype = "Infinite",
		Cost = { Yellow = 3 },
		EffectAnimation = "EatTurkey",
		Fading = true,
		IsFood = true,
		Effect = {
			Name = "Infinite Frost",
			Description = "A target fighter gains 150 Health and Power.\nGive yourself a copy of this card, except it costs an additional {Y}.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 150 },
				{ "Heal", 150 },
				{ "Add", "Addant", "Ally" },
				{
					"IncreaseCost",
					{ 1, "Yellow", "CopyCardCost" },
					"AlliedFirstSelfCopy"
				}
			},
			Target = "Single"
		},
		Bio = "Don't ask why the Grand Chicken Lord has so many chicken legs."
	},
	["Grand Chicken Lord"] = {
		Id = 8421457049,
		Name = "Grand Chicken Lord",
		AltCards = {
			["ChickenLord-ArtV"] = {
				Id = 7611002613,
				AttackEffect = "Divinity",
				Bio = "Even Gods kneel down before me, witness my true power."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		Effect = {
			Description = "When this card is cast: Search your deck for 'Infinite Chicken.'\nOnce each turn, whenever you cast an Infinite action: Remove {R}{G}{B}{Y} from the cost of all Infinite cards in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "Infinite Chicken", "Ally" } },
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "Nil" }
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Archetype",
						Modifier = "Infinite",
						SubModifier = true
					},
					TurnTriggerLimit = 1,
					Archetype = "Infinite"
				}
			}
		},
		Bio = "You PC bro? What's PC? Pre-Clucked of course!"
	},
	["Grand Glaciem Mage"] = {
		Id = 8421391434,
		Name = "Grand Glaciem Mage",
		AltCards = {
			["GrandGlaciem-ArtV"] = {
				Id = 8091909584,
				AttackEffect = "IcePunch",
				Name = "Glacier, Grand Icelord",
				AltArt = true,
				Bio = "Those burnt by the Ithian Highlands' molten spires seek refuge in his coldest caverns."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Blizzard",
		Color = "Blue",
		Cost = { Neutral = 3, Blue = 3 },
		Effect = {
			Description = "When this card is cast: Search your deck for 'Infinite Frost.'\nOnce each turn, whenever you cast an Infinite action: Remove {R}{G}{B}{Y} from the cost of all Infinite cards in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "Infinite Frost", "Ally" } },
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "Nil" }
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Archetype",
						Modifier = "Infinite",
						SubModifier = true
					},
					TurnTriggerLimit = 1,
					Archetype = "Infinite"
				}
			}
		},
		Bio = "In Grand Wizard school, he was head to head with Grand Ignis Mage in the classroom... destruction."
	},
	["Grand Ignis Mage"] = {
		Id = 8421424542,
		Name = "Grand Ignis Mage",
		AltCards = {
			["GrandIgnis-ArtV"] = {
				Id = 8091908453,
				AttackEffect = "FirePunch",
				Name = "Ragnorok, Grand Firelord",
				AltArt = true,
				Bio = "A wall of fire brands the Ithian Highlands, dividing the forest into those who have suffered his wrath and those who are about to."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Description = "When this card is cast: Search your deck for 'Infinite Flames.'\nOnce each turn, whenever you cast an Infinite action: Remove {R}{G}{B}{Y} from the cost of all Infinite cards in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "Infinite Flames", "Ally" } },
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "Nil" }
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Archetype",
						Modifier = "Infinite",
						SubModifier = true
					},
					TurnTriggerLimit = 1,
					Archetype = "Infinite"
				}
			}
		},
		Bio = "Grand Ignis Mage is actually a really nice guy if you don't make him burn your flesh off."
	},
	["Grand Meeboid Totem"] = {
		Id = 8421497331,
		Name = "Grand Vitality Totem",
		AltCards = {
			["meebtotem-ArtV"] = {
				Id = 8091916676,
				AttackEffect = "Slash",
				Name = "Grand Gecko King",
				AltArt = true,
				Bio = "Two tribes of geckos mated to produce a super gecko mutant. Although a mule, it can reproduce parthenogenically to create an army of super soldiers. Our days are numbered."
			},
			["Grand Meeboid Totem-Sun"] = {
				Id = 7138322485,
				AttackEffect = "Maelstrom",
				Name = "Grand Tiki Totem",
				Bio = "Our gaze is turned towards the past and future. But that's only because we can't move..."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 3, Green = 3 },
		Effect = {
			Description = "When this card is cast: Search your deck for 'Infinite Wishes.'\nOnce each turn, whenever you cast an Infinite action: Remove {R}{G}{B}{Y} from the cost of all Infinite cards in your hand.",
			Ability = {
				OnSummon = {
					Power = { { "Tutorfor", "Infinite Wishes", "Ally" } },
					Target = "Ally"
				},
				OnAllyCast = {
					Power = {
						{
							"IncreaseCost",
							{ -1, "Red", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Blue", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Green", "Nil" }
						},
						{
							"IncreaseCost",
							{ -1, "Yellow", "Nil" }
						}
					},
					Target = "CustomTarget",
					TargetParameters = {
						Zones = { "Ally_Hand" },
						Condition = "Archetype",
						Modifier = "Infinite",
						SubModifier = true
					},
					TurnTriggerLimit = 1,
					Archetype = "Infinite"
				}
			}
		},
		Bio = "A forgotten religious heirloom, still filled with potent life-energy. Once worshipped by peace-loving, dark creatures. It's not certain why these creatures stopped worshipping the Totem..."
	},
	Berezaa = {
		Id = 10184183928,
		Name = "berezaa",
		AltCards = {
			["Berezaa-ArtV"] = {
				Id = 10184179244,
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "He mines galaxies."
			},
			["Admiral Bereza12"] = {
				Id = 6558461613,
				AttackEffect = "Rifle",
				AltArt = true,
				Name = "Admiral Bereza12",
				Bio = "Head Admiral of the Medical Division."
			}
		},
		Health = 1250,
		Power = 250,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "Bonanza!",
			Description = "Whenever this card attacks: You gain {R}{G}{B}{Y}.",
			Type = "OnAttack",
			Power = {
				{ "Yellow", 1 },
				{ "Blue", 1 },
				{ "Red", 1 },
				{ "Green", 1 }
			},
			Target = "Ally"
		},
		Bio = "He mines havens."
	},
	["Grand Pirate King"] = {
		Id = 10184982138,
		Name = "Grand Pirate King",
		AltCards = {
			["Grand Pirate King-Sun"] = {
				Id = 10184926281,
				Name = "Grand Ghost Pirate King",
				Bio = "The Alpha Brick...IS REAL!"
			},
			R = {
				Id = 115341996020804,
				Name = "A King with No Throne",
				AltArt = true,
				PremiumArt = 167,
				Addant = "a gun with infinite bullets",
				Bio = "\"My name is Hermes, King of Thieves;<br/>Look on my Works, ye Mighty, and despair!\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		Cost = { Neutral = 4 },
		Addant = "Infinity Cannon",
		CustomReminder = {
			["Infinite Cannonballs"] = "A 12⚪ action that deals 1200 damage to a target fighter and makes your opponent lose 1200 life."
		},
		Effect = {
			Name = "Revival",
			Description = "When this card is cast: Give yourself 'Infinite Cannonballs.'",
			Type = "OnSummon",
			Power = "Add",
			Target = "Ally",
			Increase = "Infinity Cannon"
		},
		Bio = "The reason he's the king is because his name sounds the coolest."
	},
	["Infinity Cannon"] = {
		Id = 6779508831,
		Name = "Infinite Cannonballs",
		AltCards = {
			["a gun with infinite bullets"] = {
				Id = 130047980211943,
				Name = "A Heart with No Home",
				Bio = "Nothing beside remains. Round the decay Of that colossal Wreck, boundless and bare The lone and level sands stretch far away."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 12 },
		Archetype = "Infinite",
		Effect = {
			Name = "Infinity Cannon",
			Description = "Deal 1200 damage to a target fighter. Your opponent loses 1200 life.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 1200 },
				{ "Inflict", 1200, "Opponent" }
			},
			Target = "Single"
		},
		Bio = "What's better, infinite cannons or infinite cannonballs?"
	},
	RachelDubs = {
		Id = 10186082529,
		Name = "RachelDubs",
		AltCards = {
			["RachelDubs-Sun"] = {
				Id = 7317455410,
				AttackEffect = "Whirlpool",
				Bio = "IcyTea, make me an alt art now!"
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		EffectAnimation = "EatCakeAlly",
		Color = "Neutral",
		Cost = { Neutral = 6, Yellow = 1 },
		Effect = {
			Name = "Buff",
			Description = "During your end step: All allied fighters gain 100 power.",
			Type = "OnEnd",
			Power = "Strengthen",
			Target = "Ally",
			Increase = 100
		},
		Bio = "'IcyTea, make me a card now!'"
	},
	["Epic DrWeaseI"] = {
		Id = 10184299017,
		Name = "Cat Saint Ylberi",
		AltCards = {
			["Joyful Flufflefunz"] = {
				Id = 11029664957,
				Name = "Joyful Flufflefunz",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "A feeling not felt for 35 years."
			}
		},
		Health = 1600,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Archetype = "",
		Color = "Neutral",
		Cost = { Neutral = 5, Blue = 1, Yellow = 1, Red = 1, Green = 1 },
		Effect = {
			Name = "Cat Saint Yiberi",
			Description = "Whenever a fighter is cast: That fighter leaves its group. That fighter's effects will affect all ungrouped cards thereafter. This effect triggers before other cast effects.",
			Type = "OnAnySummonSupercede",
			Power = "ReplaceArchetype",
			Target = "Aggressor",
			Increase = 0
		},
		Bio = "I will contradict reality itself."
	},
	Hal = {
		Id = 10184371362,
		Name = "Hal",
		AltCards = {
			["Hal and Vaya, Showstoppers"] = {
				Id = 11496887551,
				Name = "Hal and Vaya, Showstoppers",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Man, who brings a sword to karaoke? "
			}
		},
		Health = 1800,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 8, Red = 2 },
		Effect = {
			Name = "Overgrown",
			Description = "During your end step: All allied fighters gain 100 power.",
			Type = "OnEnd",
			Power = "Strengthen",
			Target = "Ally",
			Increase = 100
		},
		Bio = "Syndicate member and bartender. Don't ask him about his kids."
	},
	["Soul Release"] = {
		Id = 6793765542,
		Name = "Soul Release",
		AltCards = {
			["A Certain Memory"] = {
				Id = 10184060885,
				Name = "A Certain Memory",
				AltArt = true,
				Bio = "♫ Thank you, I'll say goodbye soon. Though its the end of the world, don't blame yourself now. And if it's true, i will surround you and give life to a world. That's our own... ♫"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Blue = 4 },
		Effect = {
			Name = "Soul Release",
			Description = "You gain 500 life.\nDraw 2 cards.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -500 },
				{ "Draw", 2 }
			},
			Target = "Ally"
		},
		Bio = "\"When you bind a million spirits into a single space, there's bound to be criminal essences. Cast them away into the light and let gentler souls take their place.\" - Ptenda's guide to Aeonmancy, Cp. 14"
	},
	["Kathara Sojourner"] = {
		Id = 11971707021,
		Name = "Kathara Sojourner",
		AltCards = {
			S_leepyHead = {
				Id = 9964785992,
				Name = "S_leepyhead",
				AltArt = true,
				Bio = "He sleeps."
			}
		},
		Health = 300,
		Power = 400,
		Rarity = "Uncommon",
		Color = "Red",
		AttackEffect = "Slash",
		Cost = { Neutral = 1, Red = 2, Green = 1 },
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: Swap the stats of a target fighter.\nThen if that fighter has 600 or more Health, you lose 300 life and draw a card.\nOtherwise, this card gains 300 Health.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Swap", 9999, "Single" },
						{
							"AlterEV",
							{ "Set", "Target", "Health", "Nil" },
							"Single"
						},
						{ "EVGreaterValueCheck", 599 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Cost", 300 },
						{ "Draw", 1, "Ally" }
					},
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckFail = {
					Power = { { "Heal", 300 } },
					Target = "Self",
					NoBlip = true
				}
			}
		},
		Bio = "The Federation's cruelty acted as the spark which flamed the surviving spirits of the Katharans."
	},
	["Chart the Vecross System"] = {
		Id = 11772273998,
		Name = "Chart the Vecross System",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Neutral = 2, Green = 1 },
		Effect = {
			Description = "You gain 600 life.\nSelect a Planet card in your deck and search it. Change its cost to {W}.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"MoveZone",
							{ "EffectTarget", "Deck_Ally", "Hand_Ally", false, false },
							"CustomZoneTarget"
						},
						{ "Cost", -600 }
					},
					Target = "Self",
					MetaData = {
						Cost = { Neutral = 1 }
					},
					ZoneTargetParameters = {
						Zones = { "Ally_Deck" },
						Condition = { Archetype = "Planet" },
						SelectionDescription = "a planet card in your deck to search",
						MinTargets = 1,
						MaxTargets = 1
					}
				}
			}
		},
		Bio = "\"Diary Log 83 - The people of this planet can harness life itself, as if their way of living has connected them with the afterlife. I hope to perserve as much of their culture as possible should the Starkiller strike again.\" - Galilea, 400AD"
	},
	["Sacred Treant of Cothran"] = {
		Id = 11780787510,
		Name = "Sacred Treant of Cothran",
		Health = 1200,
		Power = 600,
		Rarity = "Epic",
		Color = "Green",
		AttackEffect = "Slash",
		Cost = { Neutral = 3, Green = 9 },
		EffectVariable = 0,
		Effect = {
			Description = "When this card is cast: Select 3 Terrain cards in your graveyard that've been destroyed this game. Recur them, except their cost is {G}{G}{G}{G}.",
			Ability = {
				OnSummon = {
					Power = { {
						"MoveZone",
						{ "EffectTarget", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "CustomZoneTarget",
					ZoneTargetParameters = {
						Zones = { "Ally_GraveZone" },
						Condition = { HasDied = true, Terrain = true },
						SelectionDescription = "3 Terrains to recur",
						MinTargets = 0,
						MaxTargets = 3
					},
					MetaData = {
						Cost = { Green = 4 }
					}
				}
			}
		},
		Bio = "The trees blessed Cothran with promise for new life. Ptenda blessed the trees with promise for old death."
	},
	["Foroth Water Technician"] = {
		Id = 11780910455,
		Name = "Foroth Water Technician",
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		Color = "Blue",
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Archetype", "AllHand", 1, 9999, "Peace Term" },
		AttackEffect = "Slash",
		Cost = { Neutral = 3, Blue = 1, Yellow = 2 },
		Effect = {
			Description = "Cast this card ignoring its {W} cost if a player has a Peace Term card in hand.\nWhenever this card attacks: Your opponent can't cast nonfighter cards until their next end step.",
			Ability = {
				OnAttack = {
					Power = {
						{ "BypassAction" },
						{ "BypassGear" },
						{ "BypassTerrain" }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "The brain-eating amoebas in all of Foroth's icy waters do their work subtly; Only the tiny handful of people who know they exist know how to control them, and others."
	}
}