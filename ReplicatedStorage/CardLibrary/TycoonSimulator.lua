



return {
	TheGamer101 = {
		Id = 10318241081,
		Name = "TheGamer101",
		AltCards = {
			["Fey Yoshida"] = {
				Id = 8905388835,
				Name = "Fey Yoshida",
				AttackEffect = "Jab",
				Bio = "You're sure to find her artwork scattered throughout every major metropolitan area on the planet."
			},
			["Bearer Of Flames Alt"] = {
				Id = 8305306402,
				Name = "Bearer Of Flames",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "\"Unable to resist, utterly powerless to control his movements, he was diving headlong towards that ravening chaos, that age-old intelligence which was The Flame.\""
			}
		},
		Rarity = "Epic",
		Health = 250,
		Power = 250,
		AttackEffect = "Punch",
		Terrariant = "Starter Terrain",
		Color = "Yellow",
		CastTerrainRequirement = {
			"Rarities",
			"AllyGraveZone",
			10,
			9999,
			{ "Common", "Uncommon" }
		},
		Cost = { Neutral = 1, Yellow = 2 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Doctor's Bag",
			Description = "If there are 10 or more common or uncommon cards in your graveyard, cast this card as though it was a terrain.\nAt the start of your turns: A target allied fighter gains 100 health and power.",
			Type = "OnAllyStart",
			Power = {
				{ "Strengthen", 100 },
				{ "BoostHealth", 100 }
			},
			Target = "SingleAlly"
		},
		Bio = "After so much time forgotten, seeing this up and coming dev get the trophy angered the legendary swordfighter. He hates having his crowds stolen from him."
	},
	tbradm = {
		Id = 8923585180,
		Name = "tbradm",
		AltCards = {
			["AJ Striker"] = {
				Id = 8854903645,
				Name = "AJ Striker",
				AttackEffect = "LaserBlue",
				Bio = "He's participated in just about every battle throughout time. His cyborg arm is a trend of the 2100s: he created and attached it himself!"
			},
			parkerest = {
				Id = 5673310578,
				Name = "parkerest",
				AttackEffect = "Slash",
				Bio = "I wanna be the builderman, too!"
			}
		},
		Rarity = "Epic",
		Health = 250,
		Power = 250,
		AttackEffect = "Punch",
		Terrariant = "Starter Terrain",
		Cost = { Neutral = 1, Blue = 2 },
		CastTerrainRequirement = {
			"Rarities",
			"AllyGraveZone",
			8,
			9999,
			{ "Rare" }
		},
		Color = "Blue",
		EffectVariable = 0,
		Effect = {
			Name = "Doctor's Bag",
			Description = "If there are 8 or more rare cards in your graveyard, cast this card as though it was a terrain.\nAt the start of your turns: Select a card in your hand. Search your deck for a copy of it. ",
			Type = "OnAllyStart",
			Power = {
				{
					"AlterEV",
					{ "Set", "Target", "CardIndexOriginal", "Nil" },
					"TargetAllyHand"
				},
				{ "Tutorfor", "Variable" }
			},
			Target = "Ally"
		},
		Bio = "After so much time forgotten, hearing this up and coming dev get the trophy saddened the great beasttamer. A chance to be with another person, cut so cruelly short."
	},
	Taymaster = {
		Id = 75486233026973,
		Name = "Taymaster",
		AltCards = {
			["Sparks Kilowatt"] = {
				Id = 8854904427,
				Name = "Sparks Kilowatt",
				AttackEffect = "Gravity",
				Bio = "This ball of energetic star light is sure to put a smile on your face. If a simple 'Hello!'' doesn't send her through the roof, her rocket boots will!"
			},
			TaymasterAltArtV1 = {
				Name = "Taymaster",
				Id = 8475216230,
				AttackEffect = "Knife",
				AltArt = true,
				Bio = "At this point, running won't help."
			}
		},
		Rarity = "Epic",
		Health = 250,
		Power = 250,
		Terrariant = "Starter Terrain",
		AttackEffect = "Punch",
		CastTerrainRequirement = {
			"Rarities",
			"AllyGraveZone",
			6,
			9999,
			{ "Epic", "Legendary" }
		},
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Doctor's Bag",
			Description = "If there are 6 or more epic or legendary cards in your graveyard, cast this card as though it was a terrain.\nAt the start of your turns: Deal 100 damage to all enemy fighters.",
			Type = "OnAllyStart",
			Power = { { "Damage", 100 } },
			Target = "Opponent"
		},
		Bio = "After so much time forgotten, the legendary assassin plotted his revenge. No one takes his throne and survives to tell the tale."
	},
	Defaultio = {
		Id = 134103760908886,
		Name = "Defaultio",
		AltCards = {
			["Wren Brightblade"] = {
				Id = 8854903007,
				Name = "Wren Brightblade",
				AttackEffect = "Slash",
				Bio = "They are no stranger to a great adventure. If you've got a quest, you can bet on them to complete it!"
			}
		},
		Rarity = "Epic",
		Health = 250,
		Power = 250,
		Terrariant = "Starter Terrain",
		AttackEffect = "Axe",
		CastTerrainRequirement = {
			"Rarities",
			"AllyGraveZone",
			12,
			9999,
			{ "Token" }
		},
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Doctor's Bag",
			Description = "If there are 12 or more token cards in your graveyard, cast this card as though it was a terrain.\nAt the start of your turns: Put a Green Stud into your baseplate.",
			Type = "OnAllyStart",
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
		Bio = "While his other friends in obscurity riled up against their intruder, the chief forester gracefully let him pass. He had accepted obsolesence for so long, he's forgotten what his glory days were like."
	},
	["Police Combatant"] = {
		Id = 4536842567,
		Name = "Police Combatant",
		AltCards = {
			["Filmmaker Flufflefunz"] = {
				Id = 9173951637,
				AltArt = true,
				Name = "Filmmaker Flufflefunz",
				AttackEffect = "British",
				Addant = "Experimental Film",
				Bio = "A video is a memory. I want to remember everything. I look at life through a picture frame, as films can't hurt me. One single frame of a memory is a place where time has stopped."
			},
			["Kyno Buzzkill"] = {
				Id = 13947316033,
				AltArt = true,
				PremiumArt = 70,
				Name = "Kyno Buzzkill",
				Commissioner = { 51942320, 1082444751 },
				AttackEffect = "Minigun",
				SummonAnimation = "SWAT",
				Addant = "James O'Neil",
				Bio = "I AM THE INSTRUMENT OF DESTRUCTION, THEIR TORMENTOR, THE EMBODIMENT OF CHAOS, COMMANDED TO UNLEASH CARNAGE UPON OUR FOES, EMBRACING THE DARKNESS AS I PAINT THEIR DEMISE IN CRIMSON."
			}
		},
		Health = 600,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "Gun",
		SummonAnimation = "PoliceCall",
		Archetype = "Police",
		Color = "Blue",
		Addant = "Police Officer",
		Cost = { Neutral = 2, Blue = 3 },
		CustomReminder = {
			["Police Officer"] = "A Blue {W}{W} 300/150 Police. It locks then suspends a target fighter when cast."
		},
		Effect = {
			Name = "Police Policy",
			Description = "When this card is cast, if there's 3 or more allied Police: Lock all fighters that cost 6 or fewer total studs for 1 turn. Give yourself a 300/150 Police Officer.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1, "CustomTarget" },
				{ "Add", "Addant", "Ally" }
			},
			EffectRequirement = { "Archetype", "Ally", 3, 9999, "Police" },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally", "Enemy" },
				Condition = "TotalCostOrLess",
				Modifier = 6
			}
		},
		Bio = "This cop doesn't use pepper spray, it prefers mowing you down with bullets instead."
	},
	HatdaCat = {
		Id = 5945486362,
		Name = "HatdaCat",
		AltCards = {
			["HatdaCat-Hal"] = {
				Id = 14693018038,
				Name = "Mister Psycho",
				AttackEffect = "Rifle",
				SummonAnimation = "ClownHonk",
				DeathAnimation = "ClownDeath",
				Bio = "\"I prefer the name \"Monsieur Deranged\" Mr. Juno\""
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Venomshank",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		EffectVariable = 1,
		Effect = {
			Name = "Counter Strike",
			Description = "Once each turn, whenever your opponent discards a card: This card gains 100 health and power.",
			Ability = {
				OnEnemyDiscard = {
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
						{ "Heal", 100 },
						{ "Strengthen", 100 },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "The cops of the frozen north have their own culture."
	},
	["Police Officer"] = {
		Id = 4536844817,
		Name = "Police Officer",
		AltCards = {
			["Undead Cops"] = {
				Id = 7829889513,
				Name = "Undead Cops",
				AttackEffect = "Scratch",
				SummonAnimation = "PolicePrep",
				Bio = "To protect and sever."
			},
			Bingus = {
				Id = 9105954270,
				Name = "Bingus",
				AttackEffect = "Scratch",
				Bio = "I haven't looked at floppa for so long, I'd forgotten how much it hurts to."
			},
			["Experimental Film"] = {
				Id = 9173952295,
				Name = "Experimental Film",
				AttackEffect = "Slash",
				Bio = "Even though I can't explain it, I already know how great it is."
			},
			["James O'Neil"] = {
				Id = 13990515781,
				Name = "James O'Neil",
				AttackEffect = "Rifle",
				SummonAnimation = "PolicePrep",
				Commissioner = { 51942320, 1082444751 },
				Bio = "“Why am I always paired up with this psychopath?”"
			},
			Operator = {
				Id = 95243453049884,
				Name = "Operator",
				AttackEffect = "Rifle",
				Rarity = "Token",
				Commissioner = { 51942320, 1082444751 },
				Bio = "<i>\"Roger that, sir.\"</i>"
			}
		},
		Health = 300,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Punch",
		SummonAnimation = "PoliceCall",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Pepper Spray",
			Description = "When this card is cast: Lock a target fighter for 1 turn, then suspend it from play until the next end step.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Suspend", 1 }
			},
			Target = "Single"
		},
		Bio = "Jailing people for making bomb-clocks since 2015."
	},
	SwatPhantom = {
		Id = 126518601575590,
		Name = "SwatPhantom",
		AltCards = {
			FyrixWasTaken = {
				Id = 8295619320,
				AltArt = true,
				Name = "FyrixWasTaken",
				AttackEffect = "Gun",
				SummonAnimation = "PoliceCall",
				Bio = "I miss the good ol' days. The days when I COULD'VE LOCKED MY OPPONENT'S CARDS FOR 12 TURNS. Ah the good ol' days."
			},
			Deerbot = {
				Id = 9121743484,
				AltArt = true,
				Name = "Deerbot",
				AttackEffect = "LaserRed",
				SummonAnimation = "PolicePrep",
				Bio = "My first home was the circus. My second was a state institute. My next home will be yours. I will be the man who hides under your bed, in your closet, in your mind. When I win, you'll never be too far from me."
			},
			["Contracted Huntsman"] = {
				Id = 15121301114,
				AltArt = true,
				Name = "Contracted Huntsman",
				AttackEffect = "Minigun",
				PremiumArt = 141,
				Commissioner = { 51942320 },
				Bio = "\"Contracted work from the 13th Division is an easier gig than I originally thought.\""
			}
		},
		Health = 450,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Rifle",
		SummonAnimation = "SWAT",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2 },
		Effect = {
			Name = "FlySwatter",
			Description = "When this card is cast: All allied Police gain 250 power. Lock them for 2 turns.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 2 },
				{ "Strengthen", 250 }
			},
			Target = "AlliedArchetype"
		},
		Bio = "Professional fly swatting makes you some fair tix in Robloxia."
	},
	Luigifan103 = {
		Id = 11966567706,
		Name = "Luigifan103",
		AltCards = {
			["Fluffle & Dairing, Ace Detectives"] = {
				Id = 8234106477,
				Name = "Fluffle & Dairing, Ace Detectives",
				AttackEffect = "Jab",
				SummonAnimation = "PolicePrep",
				AltArt = true,
				Bio = "I thought investigators were supposed to solve manslaughter cases, not cause them..."
			},
			["Combat Medic"] = {
				Id = 13687959971,
				Name = "Combat Medic",
				AttackEffect = "Rifle",
				SummonAnimation = "SWAT",
				AltArt = true,
				PremiumArt = 50,
				Commissioner = { 51942320, 21564633 },
				Bio = "\"We are not just trained to save lives, we are willing to risk our own.\""
			},
			["Marcus Flintwood"] = {
				Id = 93243526981375,
				Name = "Marcus Flintwood",
				PremiumArt = 364,
				AltArt = true,
				Bio = "STOP HIDING BEHIND ME AND GO PATCH THE OTHERS"
			}
		},
		Health = 450,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		SummonAnimation = "PoliceCall",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Booster",
			Description = "Whenever this card gains locks: All allied Police gain 50 health.",
			Type = "OnLockIncrease",
			Power = { { "Heal", 50 } },
			Target = "AlliedArchetype"
		},
		Bio = "His secret identity is Mariofan103."
	},
	Aesthetical = {
		Id = 7473614698,
		Name = "Aesthetical",
		AltCards = {
			["Flufflefunz, Remembered"] = {
				Id = 9225662910,
				AttackEffect = "Jab",
				Name = "Flufflefunz, Remembered",
				SummonAnimation = "PoliceCall",
				AltArt = true,
				Bio = "No more shame, no more fear, no more dread. I am the truth."
			},
			["Aesthetical-PC"] = {
				Id = 11346234526,
				AttackEffect = "Gun",
				PackDisplayOverride = "Group Precon: Police"
			},
			["Sordman, Forgotten Soldier"] = {
				Id = 13628773438,
				Name = "Sordman, Forgotten Soldier",
				AttackEffect = "Rifle",
				AltArt = true,
				Commissioner = { 51942320, 21564633, 178399128 },
				Bio = "\"Abandoned and left behind, I stand alone, but not defenseless. I will gather my strength, fortify my position, and ready myself for the coming storm in the name of the 13th Division\""
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Rifle",
		SummonAnimation = "SWAT",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Blue = 6 },
		EffectVariable = 1,
		Effect = {
			Description = "Once each turn, whenever an effect locks this card: All allied Police gain 100 power. Search your deck for a Police card.",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEffectLock = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Strengthen", 100, "AlliedArchetype" },
						{ "RandomTutorfor", "Police", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0 }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Y'know, being on the front page for so many years is really special. I'd like to thank all those prisoners for their enjoyable gameplay!"
	},
	["Gravity Inspector"] = {
		Id = 3238119379,
		Name = "Gravity Inspector",
		AltCards = {
			["Gravity InspectorV2"] = {
				Id = 3299976206,
				Name = "ɹoʇɔǝdsuı ʎʇıʌɐɹƃ",
				Bio = "˙ןןɐɟ ǝɥʇ ǝsnɐɔ oʇ ˙ʎʇıʌɐɹb ʇɔǝdsuı oʇ"
			},
			["Indie Nerd Flufflefunz"] = {
				Id = 9121745713,
				AltArt = true,
				Name = "Indie Nerd Flufflefunz",
				AttackEffect = "Scratch",
				Bio = "Is it the chorus yet?"
			},
			["KalScrt, the Quartermaster"] = {
				Id = 14039161645,
				AltArt = true,
				PremiumArt = 81,
				Name = "KalScrt, the Quartermaster",
				Commissioner = { 51942320, 1082444751 },
				AttackEffect = "Rifle",
				Bio = "\"When our quartermaster perished during the recent Smiley raid, I noticed a civilian who had successfully evaded our security measures. Impressed by their skills, I extended an offer for them to assume the role of our new quartermaster. What unfolded next left me astounded.\"\n                            -Sordman"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		SummonAnimation = "PoliceCall",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 1,
		Effect = {
			Description = "Once each turn, whenever you cast a Police fighter: Unlock that fighter and a target allied fighter, then lock them for 1 turn.",
			Ability = {
				OnAllySummon = {
					Power = {
						{ "Unlock", 9999, "Aggressor" },
						{ "Unlock", 9999, "SingleAlly" },
						{ "Lock", 1, "Aggressor" },
						{ "Lock", 1, "SingleAlly" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						}
					},
					Target = "Self",
					Archetype = "Police",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "To inspect gravity. To cause the fall."
	},
	["Isaac0333-V2"] = {
		Id = 4975927274,
		Name = "Isaac0333",
		AltCards = {
			Zombie13270 = {
				Id = 7829888970,
				AltArt = true,
				Name = "Zombie13270",
				AttackEffect = "Tempest",
				Summonant = "Undead Cops",
				Bio = "Aren't police supposed to stop the undead and not raise them?"
			},
			["Bingus Addict Flufflefunz"] = {
				Id = 9105953803,
				AltArt = true,
				Name = "Bingus Addict Flufflefunz",
				AttackEffect = "Scratch",
				Summonant = "Bingus",
				Bio = "They were connected at the back of the head. They had a conduit - their minds were the same."
			},
			Sergeant = {
				Id = 14169530902,
				AltArt = true,
				PremiumArt = 83,
				Name = "Sergeant",
				AttackEffect = "Rifle",
				Commissioner = { 51942320, 14640960 },
				Summonant = "Operator",
				Bio = "Move quickly and stay alert, we need to secure this area before the enemy can regroup."
			}
		},
		Health = 300,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "Jab",
		SummonAnimation = "PolicePrep",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 1, Blue = 2 },
		Summonant = "Police Officer",
		Token = true,
		CustomReminder = {
			["Police Officer"] = "A Blue {W}{W} 300/150 Police. It locks then suspends a target fighter when cast."
		},
		Effect = {
			Name = "ASSEMBLE.",
			Description = "Whenever this card is cast, or attacks and destroys another: Summon a 300/150 Police Officer. Trigger effects as though it was cast.",
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
		Bio = "After saving a little robloxian from a horrible experiment, he's the talk of the city. He's hoping to win a bloxy award from his newfound popularity."
	},
	["Rapid Response"] = {
		Id = 8208663568,
		Name = "Rapid Response",
		AltCards = {
			["One Trait Fluffle"] = {
				Id = 9113380993,
				AltArt = true,
				Name = "One Trait Fluffle",
				AttackEffect = "Microphone",
				SummonAnimation = "PolicePrep",
				Bio = "I'm on a need to know basis."
			},
			["Eternal Cop"] = {
				Id = 9247129153,
				AltArt = true,
				Name = "Eternal Cop",
				AttackEffect = "Gun",
				SummonAnimation = "SWAT",
				Bio = "I am the purgatorial flames of this rotting hell-hole... ETERNAL COP!"
			},
			["Tactical Deployment"] = {
				Id = 15121300867,
				AltArt = true,
				Name = "Tactical Deployment",
				AttackEffect = "Gun",
				SummonAnimation = "PolicePrep",
				PremiumArt = 140,
				Commissioner = { 51942320 },
				Bio = "\"Good luck, fellas. I'll buy us the whole round of drinks if you all can make it out alive and unscated.\"\n-Sordman"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		SummonAnimation = "PoliceCar",
		Archetype = "Police",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast: Unlock all allied fighters, then lock them for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 1 }
			},
			Target = "Ally"
		},
		Bio = "If only the police were really like this..."
	},
	["Police Call Operator"] = {
		Id = 8208665396,
		Name = "Police Call Operator",
		AltCards = {
			["How To Leave Fluff"] = {
				Id = 9121741050,
				Name = "How To Leave Fluff",
				AttackEffect = "Scratch",
				AltArt = true,
				Transformant = "How To Leave Fluff-Token",
				Bio = "Hey, Space Cadet."
			},
			["The Armored Convoy"] = {
				Id = 13624437422,
				Name = "The Armored Convoy",
				AttackEffect = "Rifle",
				AltArt = true,
				PremiumArt = 39,
				Commissioner = { 51942320, 1082444751 },
				Transformant = "The Armored Convoy-Token",
				Bio = "<i>In battle, having reinforcements is like having an insurance policy for victory.</i>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		SummonAnimation = "PoliceCall",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Blue = 5 },
		Transformant = "PCO1",
		Charge = true,
		AttackBlock = true,
		EffectVariable = 2,
		Effect = {
			Name = "Booster",
			Description = "Twice each turn, whenever this card gains locks: Search your deck for a Police card.",
			Target = "Ally",
			Ability = {
				OnLockIncrease = {
					Power = { { "EVGreaterValueCheck", 0 } },
					Target = "Self",
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
						{ "RandomTutorfor", "Police", "Ally" },
						{
							"AlterEV",
							{ "Add", "Math", -1, "Nil" },
							"Self"
						}
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "A famous Robloxian did WHAT to you? We'll get a detective on the case immediately."
	},
	PCO1 = {
		Id = 6030769218,
		Name = "Police Call Operator",
		AltCards = {
			["How To Leave Fluff-Token"] = {
				Id = 9121741050,
				Name = "How To Leave Fluff",
				AttackEffect = "Scratch",
				Transformant = "How To Leave Fluff-Token2",
				Effect = {
					Name = "Booster",
					Description = "1 Charge.\nWhenever this card gains locks: Spend a charge and search your deck for a Police card.\nDuring your end step: This card regains a charge.",
					Target = "Ally",
					Ability = {
						OnLockIncrease = {
							Power = {
								{ "RandomTutorfor", "Police" },
								{ "Transform", "Transformant", "Self" }
							},
							Target = "Ally"
						},
						OnEnd = {
							Power = { { "Transform", "How To Leave Fluff", "Self" } },
							Target = "Ally"
						}
					}
				},
				Bio = "Hey, Space Cadet."
			},
			["The Armored Convoy-Token"] = {
				Id = 13624437422,
				Name = "The Armored Convoy",
				AttackEffect = "Rifle",
				Transformant = "The Armored Convoy-Token2",
				Effect = {
					Name = "Booster",
					Description = "1 Charge.\nWhenever this card gains locks: Spend a charge and search your deck for a Police card.\nDuring your end step: This card regains a charge.",
					Target = "Ally",
					Ability = {
						OnLockIncrease = {
							Power = {
								{ "RandomTutorfor", "Police" },
								{ "Transform", "Transformant", "Self" }
							},
							Target = "Ally"
						},
						OnEnd = {
							Power = { { "Transform", "The Armored Convoy", "Self" } },
							Target = "Ally"
						}
					}
				},
				Bio = "<i>In battle, having reinforcements is like having an insurance policy for victory.</i>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Blue = 5 },
		Transformant = "PCO2",
		Charge = true,
		AttackBlock = true,
		Effect = {
			Name = "Booster",
			Description = "1 Charge.\nWhenever this card gains locks: Spend a charge and search your deck for a Police card.\nDuring your end step: This card regains a charge.",
			Target = "Ally",
			Ability = {
				OnLockIncrease = {
					Power = {
						{ "RandomTutorfor", "Police" },
						{ "Transform", "Transformant", "Self" }
					},
					Target = "Ally"
				},
				OnEnd = {
					Power = { { "Transform", "Police Call Operator", "Self" } },
					Target = "Ally"
				}
			}
		},
		Bio = "A famous Robloxian did WHAT to you? We'll get a detective on the case immediately."
	},
	PCO2 = {
		Id = 6030769218,
		Name = "Police Call Operator",
		AltCards = {
			["How To Leave Fluff-Token2"] = {
				Id = 9121741050,
				Name = "How To Leave Fluff",
				AttackEffect = "Scratch",
				Transformant = "How To Leave Fluff",
				Bio = "Hey, Space Cadet."
			},
			["The Armored Convoy-Token2"] = {
				Id = 13624437422,
				Name = "The Armored Convoy",
				AttackEffect = "Rifle",
				Transformant = "The Armored Convoy",
				Bio = "<i>In battle, having reinforcements is like having an insurance policy for victory.</i>"
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Blue = 5 },
		Transformant = "Police Call Operator",
		Charge = true,
		AttackBlock = true,
		Effect = {
			Name = "Booster",
			Description = "0 Charges.\nDuring your end step: This card regains its charges.",
			Type = "OnEnd",
			Power = { { "Transform", "Transformant", "Self" } },
			Target = "Ally"
		},
		Bio = "A famous Robloxian did WHAT to you? We'll get a detective on the case immediately."
	},
	["Police Taskmaster"] = {
		Id = 8206465907,
		Name = "Police Taskmaster",
		AltCards = {
			["Hunted Flufflefunz"] = {
				Id = 9034078862,
				AltArt = true,
				Addant = "Venison",
				Name = "Hunted Flufflefunz",
				AttackEffect = "Revolver",
				Bio = "We've all had better times to die."
			},
			["Sordman, Hero of the 13th Division"] = {
				Id = 12128466921,
				Name = "Sordman, Hero of the 13th Division",
				AttackEffect = "Rifle",
				ArtAnimation = "sordMaster",
				Commissioner = { 51942320, 14640960, 114846707 },
				AltArt = true,
				Addant = "13th Infantry Division",
				Bio = "\"Every time you've slaughtered one of my officers, more shall come to take its place.\""
			},
			["Commander of the 13th Division"] = {
				Id = 127502113507390,
				Name = "Commander of the 13th Division",
				AttackEffect = "Rifle",
				ArtAnimation = "SordmanReanim",
				AltArt = true,
				Addant = "13th Infantry Division",
				PremiumArt = 435,
				Bio = "\"True heroism is not measured by medals or commendations, but by the unwavering respect and loyalty of those you lead, earned through selfless sacrifice and shared trials.\""
			},
			["Aang Khor, Upholder of the Law"] = {
				Id = 92253237991357,
				Name = "Aang Khor, Upholder of the Law",
				Commissioner = { "Gold3n_coin" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 764,
				Addant = "Bruce Williams, Fleet Admiral",
				Bio = "This is Officer Aang, requesting backup."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Gun",
		SummonAnimation = "SWAT",
		Color = "Blue",
		Archetype = "Police",
		Addant = "TaskmasterToken",
		Cost = { Neutral = 2, Blue = 4 },
		CustomReminder = {
			["Police Spec Ops"] = "A Blue 600/600 Police token that costs {W}{W}{B}{B}{B}. It has no abilities."
		},
		Effect = {
			Name = "D",
			Description = "Whenever this card gains locks, if there's 3 or more Police cards in your baseplate: Give yourself a 600/600 Police Spec Ops with no abilities.",
			Type = "OnLockIncrease",
			Power = { { "Add", "Addant" } },
			Target = "Ally",
			EffectRequirement = { "Archetype", "AllyGenZone", 3, 9999, "Police" }
		},
		Bio = "He cracks down on dodgy people and those that dodge the law."
	},
	TaskmasterToken = {
		Id = 8206467360,
		Name = "Police Spec Ops",
		AltCards = {
			Venison = {
				Id = 9034079501,
				Name = "Venison",
				AttackEffect = "Revolver",
				Bio = "No unsolicited demos."
			},
			["13th Infantry Division"] = {
				Id = 13278727848,
				Name = "13th Infantry Division",
				AttackEffect = "Rifle",
				Bio = "A soldier's strength lies not in their weapon, but in their courage to protect and serve their country, even in the face of danger and adversity."
			},
			["Bruce Williams, Fleet Admiral"] = {
				Id = 106756957427741,
				Name = "Bruce Williams, Fleet Admiral",
				AttackEffect = "Rifle",
				Bio = "OPEN FIRE!"
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 2, Blue = 4 },
		Effect = {
			Description = "When this card dies: Look up the history of policing in your country. I'm sure it'll be interesting!",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "He cracks down on dodgy people and those that dodge the law."
	},
	Case1 = {
		Id = 1724919808,
		Name = "Case #1: The Lowly Thug",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "I",
			Description = "Inert in hand. Summon three lowly thugs onto your opponent's board. You can't attack or cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "LowlyC" },
				{ "Summon", "LowlyB" },
				{ "Summon", "LowlyA" },
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
			Target = "Opponent"
		},
		Bio = "Multiple shootings, five dead, and money stolen, go after them, before more lives are taken…"
	},
	LowlyA = {
		Id = 1674211838,
		Name = "Lowly Thug A",
		CopyBodge = "LowlyA",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "S",
			Description = "During your end step: Give your opponent a Police Officer.",
			Type = "OnEnd",
			Power = { { "Add", "Police Officer" } },
			Target = "Opponent"
		},
		Bio = "If I don’t get ya, this car will."
	},
	LowlyB = {
		Id = 1674212257,
		Name = "Lowly Thug B",
		CopyBodge = "LowlyB",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "When this card dies: Give your opponent Case #2 and two Blue and Colourless studs. All allied fighters gain 100 power.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Case2" },
				{ "Blue", 2 },
				{ "Neutral", 2 },
				{ "Strengthen", 100, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "\"YEAAAAAAH! We made it! All those alarms and sirens but there's nothing ahead!\" - Bruce"
	},
	LowlyC = {
		Id = 1674212717,
		Name = "Lowly Thug C",
		CopyBodge = "LowlyC",
		Health = 1000,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Crime1",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "O",
			Description = "When this card dies: Your opponent draws two cards. All allied fighters gain 100 health.",
			Type = "OnDeath",
			Power = {
				{ "Draw", 2 },
				{ "Heal", 100, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "The Supreme-branded bags are probably worth more than the cash its holding."
	},
	Case2 = {
		Id = 1724921188,
		Name = "Case #2: The Crooked Cop",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Case",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "U",
			Description = "Your opponent summons The Crooked Cop and his Conflict of Interest. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "CrookedCop" },
				{ "Summon", "ConflictInterest" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Opponent"
		},
		Bio = "Either you die a hero or live long enough to see yourself become the villain."
	},
	CrookedCop = {
		Id = 1674211148,
		Name = "The Crooked Cop",
		CopyBodge = "CrookedCop",
		Health = 2000,
		Power = 100,
		Rarity = "Token",
		AttackEffect = "Gun",
		SummonAnimation = "PoliceCall",
		Color = "Blue",
		Archetype = "Crime2",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "N",
			Description = "When this card dies: Your opponent draws two cards and gains two Blue and two Colourless studs.",
			Type = "OnDeath",
			Power = {
				{ "Draw", 2 },
				{ "Blue", 2 },
				{ "Neutral", 2 }
			},
			Target = "Opponent"
		},
		Bio = "\"I'm sorry, I truly am. They found me. If I don't give The Chairman the Yakuza files...they'll... my family...\""
	},
	ConflictInterest = {
		Id = 1674210715,
		Name = "Conflict of Interest",
		CopyBodge = "ConflictInterest",
		Health = 800,
		Power = 500,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Crime2",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "T",
			Description = "When this card dies: The Crooked Cop gains 600 health and power. Unlock it. Shuffle Case #3 into your opponent's deck.",
			Type = "OnDeath",
			Power = {
				{ "Heal", 600 },
				{ "Strengthen", 600 },
				{ "Unlock", 9999 },
				{ "DeckAdd", "Case3", "Opponent" }
			},
			Target = "Archetype"
		},
		Bio = "He was a good cop, and a even better husband. The Chairman knew."
	},
	Case3 = {
		Id = 1724921891,
		Name = "Case #3: Ties to the Yakuza",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		TokenDiscard = true,
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "Inert in hand. Your opponent summons The Yakuza Underboss and his Underling. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "Yakuza Underboss" },
				{ "Summon", "Yakuza Underling" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Opponent"
		},
		Bio = "The Crooked Cop wasn't acting alone. He mentioned something about the Yakuza and a mysterious man. Just as the Police find themselves in a dead-end, a massacre begins in a nearby bio-lab. Rush to the scene!"
	},
	["Yakuza Underboss"] = {
		Id = 1674220846,
		Name = "Yakuza Underboss",
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		CounterAttackBlock = true,
		DamageImmune = true,
		Color = "Blue",
		Archetype = "Crime3",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "O",
			Description = "When this card dies: Shuffle Case #4 into your opponent's deck. All allied fighters gains 200 health and power.",
			Type = "OnDeath",
			Power = {
				{ "DeckAdd", "Case4" },
				{ "Heal", 200, "Ally" },
				{ "Strengthen", 200, "Ally" }
			},
			Target = "Opponent"
		},
		Bio = "Ｉ　ｍｕｓｔ　ｓｔｏｐ　ｈｉｍ．"
	},
	["Yakuza Underling"] = {
		Id = 1674221401,
		Name = "Yakuza Underling",
		Health = 800,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Crime3",
		DamageImmune = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "D",
			Description = "Whenever a fighter is cast: Summon a Yakuza Thug. Deal 100 damage to all enemy fighters,",
			Type = "OnAnySummon",
			Power = {
				{ "Summon", "Yakuza Thug" },
				{ "Damage", 100, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "(҂` ﾛ ´) ＨＹＡＡＡＡＡＡＡＡＡＡ！！！"
	},
	["Yakuza Thug"] = {
		Id = 1674220122,
		Name = "Yakuza Thug",
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Gun",
		Color = "Blue",
		Archetype = "Crime3",
		Cost = { Neutral = 0 },
		Shield = true,
		Effect = {
			Name = "E",
			Description = "When this card dies: Your opponent gains two Blue and two Colourless studs.",
			Type = "OnDeath",
			Power = {
				{ "Blue", 2, "Opponent" },
				{ "Neutral", 2, "Opponent" }
			},
			Target = "NotArchetype"
		},
		Bio = "╮( ˘ ､ ˘ )╭ Ｂｏｓｓ ｗａｎｔ ｂｒｅａｋ ｌａｂ。 Ｂｏｓｓ ｄｏｎ＇ｔ ｌｉｋｅ Ｃｈａｉｒｍａｎ。 Ｂｏｓｓ ｄｏｎ＇ｔ ｗａｎｔ ｙｏｕ ｅｉｔｈｅｒ。"
	},
	Case4 = {
		Id = 1724922793,
		Name = "Case #4: Organized Underworld",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Gun",
		TokenDiscard = true,
		Color = "Blue",
		Archetype = "Police",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "A",
			Description = "Inert in hand. Your opponent summons The Chairman and The Operative. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "The Chairman" },
				{ "Summon", "The Operative" },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Opponent"
		},
		Bio = "One last case. The end of the road. Find the truth about The Chairman."
	},
	["The Chairman"] = {
		Id = 1674219117,
		Name = "The Chairman",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Gun",
		WeakenImmune = true,
		SetImmune = true,
		DamageImmune = true,
		DestroyImmune = true,
		ReturnImmune = true,
		TargetImmune = true,
		TransformImmune = true,
		Color = "Blue",
		Archetype = "Crime4",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "C",
			Description = "When this card dies: You're arrested! Get banned.",
			Type = "OnDeath",
			Power = { { "Cost", 999999 } },
			Target = "Ally"
		},
		Bio = "He didn't kill himself. I did."
	},
	["The Operative"] = {
		Id = 1674219711,
		Name = "The Operative",
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Gun",
		SummonAnimation = "SWAT",
		CounterAttackBlock = true,
		Shield = true,
		Color = "Blue",
		Cost = { Neutral = 0 },
		Effect = {
			Name = "I",
			Description = "During your end step: Give your opponent 2 300/100 Police Officers. They gain two Blue and two Colourless studs.",
			Type = "OnEnd",
			Power = {
				{ "Add", "Police Officer" },
				{ "Add", "Police Officer" },
				{ "Blue", 2 },
				{ "Neutral", 2 }
			},
			Target = "Opponent"
		},
		Bio = "The Chairman's faithful second-in-command. Found the informant. Manipulated you into taking down the Yakuza for him. Now, you're the last loose end."
	},
	Kenami = {
		Id = 10243462842,
		Name = "Kenami",
		AltCards = {
			EdgelordAlt = {
				Id = 121367612608915,
				Name = "Edgelord",
				AttackEffect = "British",
				Bio = "I came seeking Hallow. All I found was you."
			},
			["The Ripper"] = {
				Id = 15716971539,
				Name = "The Ripper",
				AltArt = true,
				PremiumArt = 169,
				Bio = "<b>Calamity is coming. <br/> Calamity is not a force of good. <br/>  <font color=\"#FF0000\">Nor does it care about evil. </font></b>"
			},
			["Curious Kitsune with an Awesome Dagger"] = {
				Id = 101532510188145,
				Name = "Curious Kitsune with an Awesome Dagger",
				AttackEffect = "British",
				AltArt = true,
				PremiumArt = 530,
				Bio = "I came seeking you. All I found was this sharp thing."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Jab",
		Color = "Red",
		Cost = { Red = 2, Neutral = 4 },
		Effect = {
			Name = "Stud",
			Description = "Whenever an enemy effect targets a fighter: They lose 1000 life.",
			Type = "OnEnemyTarget",
			Power = { { "Inflict", 1000 } },
			Target = "Opponent"
		},
		Bio = "I came seeking a challenge. All I found was you."
	},
	Cowboy = {
		Id = 9964758177,
		Name = "Cowboy",
		AltCards = {
			Mcree = {
				Id = 9964756481,
				Name = "Cowboy",
				AltArt = true,
				Bio = "It wasn't us who changed."
			},
			CowboyV2 = {
				Id = 9964754961,
				CopyBodge = "CowboyV2",
				Bio = "A Cowboy from an alternate dimension who wants to practice his gunslinging skills.",
				Effect = { Name = "High Noon" }
			},
			scardman5 = {
				Id = 9964755862,
				Name = "scardman5",
				AltArt = true,
				Bio = "Just a new cowboy, that's all."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Revolver",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Pow!",
			Description = "When this card dies: All allied epic and legendary fighters gain 200 health and power.",
			Type = "OnDeath",
			Power = {
				{ "Heal", 200 },
				{ "Strengthen", 200 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Epic", "Legendary" }
				}
			}
		},
		Bio = "A cowboy from the ranch that wants to practice his aim."
	},
	TheSongList = {
		Id = 9964908710,
		Name = "TheSongList",
		AltCards = {
			["TheSongList-C"] = {
				Name = "Carol Singers",
				AttackEffect = "Jab",
				Id = 9964910546,
				Bio = "Jingle Bells\nZanzel Smells\nErys is a flesh-eating parasite!"
			},
			Mikgazer = {
				Name = "Mikgazer",
				AttackEffect = "Revolver",
				Id = 9964911309,
				AltArt = true,
				Bio = "A veteran virtual idol who has had enough!"
			}
		},
		Health = 1200,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 5 },
		Effect = {
			Name = "Pow!",
			Description = "When this card is cast: Unlock all allied epic and legendary fighters.",
			Type = "OnSummon",
			Power = { { "Unlock", 9999 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Epic", "Legendary" }
				}
			}
		},
		Bio = "A longtime ambassador to the game. Happy 1.6k!"
	},
	["Dwarvern Miner"] = {
		Id = 9964977654,
		AltCards = {
			["Degenerate Destroyer"] = {
				Name = "Degenerate Destroyer",
				AttackEffect = "MagicRed",
				Id = 9964810419,
				AltArt = true,
				Bio = "Harassing people who can cast magical energy beams is a terrible idea!"
			},
			["Malik the Diener"] = {
				Name = "Malik the Diener",
				AttackEffect = "Slash",
				Id = 9964810957,
				AltArt = true,
				Bio = "\nThis card is an alt-art of Hoosierdaddy22."
			}
		},
		Name = "Hoosierdaddy22",
		Health = 900,
		Power = 50,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 1 },
		Effect = {
			Name = "Dwarvern Heart",
			Description = "Whenever you cast an epic fighter: Give yourself a Red legendary card.",
			Type = "OnAllySummon",
			Power = { { "RandomAdd", "MonoOnlyorRedCost Legendary Red" } },
			Target = "Ally",
			Rarity = "Epic"
		},
		Bio = "It's all about them."
	},
	ChloeUrie = {
		Id = 10243421345,
		Name = "ChloeUrie",
		AltCards = {
			["Bishop Leviathan"] = {
				Name = "Bishop Leviathan",
				AttackEffect = "Gravity",
				Id = 10243422773,
				AltArt = true,
				Bio = "Worship is control."
			},
			["Pro Swordfighter Joe"] = {
				Name = "Pro Swordfighter Joe",
				AttackEffect = "LinkedSword",
				Id = 8072494611,
				Bio = "Try lagswitching out of this one, casual."
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 3, Neutral = 1 },
		EffectAnimation = "LinkedSwordFlagEffect",
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast: A target fighter gains 250 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 250 } },
			Target = "Single"
		},
		Bio = "She does YouTube."
	},
	["The Beast"] = {
		Id = 9964903156,
		Name = "The Beast",
		AltCards = {
			AceTheVeryFatCat = {
				Id = 9964905044,
				Name = "AceTheVeryFatCat",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "A few of his favorites include: Light It Up, Rum 'n' Bass, and Ghost."
			},
			["The Beast-Hal"] = {
				Id = 131750056649360,
				Name = "Gluttonous Teddy Bear",
				AttackEffect = "Scratch",
				Bio = "After being left abandoned by its owner, it has manifested into something more sinister.. it now roams the store eating everyone and everything in its rampant wrath so that none of the other teddy’s share the same fate as itself."
			},
			["Generous Donator Tige1111"] = {
				Id = 13488233224,
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 33,
				Commissioner = { 88316593, 41926915 },
				Name = "Generous Donator Tige1111",
				Bio = "nagging works"
			},
			["The Beast-E"] = {
				Id = 16446072720,
				Name = "Old Mac Donald",
				AttackEffect = "Scratch",
				Bio = "Old Mac Donald had a farm! E-I-E-I-O! <br/>Now, Old Mac Donald's filled with spite! E-I-E-I-O!"
			},
			["Fate of Destruction"] = {
				Id = 17251037753,
				AttackEffect = "Jab",
				AltArt = true,
				Name = "Fate of Destruction",
				Bio = "\"I wish that I could turn back time<br/>'Cause now the guilt is all mine<br/>Can't live without the trust from those you love\""
			}
		},
		Health = 1400,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "RedScythe",
		Color = "Red",
		Cost = { Neutral = 3, Red = 4 },
		Effect = {
			Name = "Haydoscale",
			Description = "During your end step: Destroy all fighters with exactly 500 health.",
			Type = "OnEnd",
			Power = { {
				"CheckHealth",
				{ 500, 501 }
			} },
			Target = "All"
		},
		Bio = "The Beast takes the form of man, because humans are the real monsters."
	},
	Banland = {
		Id = 9964957116,
		Name = "Banland",
		AltCards = {
			["Banland-Hal"] = {
				Id = 98258707034193,
				Name = "Kisaragi Station",
				Terrariant = "Banland Terrain-Hal",
				Bio = "\"I looked for a public phone, but there’s nothing. And no one else got off, so I’m alone now. It’s definitely called Kisaragi. Looking into it, apparently it’s written with the kanji for “Devil,” but it’s read “Kisaragi\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Punch",
		Field = 1549933495,
		Terrain = true,
		Terrariant = "Banland Terrain",
		Rank = 5,
		Color = "Red",
		Cost = { Red = 1, Green = 1, Yellow = 1 },
		Effect = {
			Name = "Stud",
			Description = "At the start of your turns: Destroy all fighters with 1000 or more health or power.",
			Type = "OnAllyStart",
			Power = {
				{
					"CheckHealth",
					{ 1000, 99999 }
				},
				{
					"CheckPower",
					{ 1000, 99999 }
				}
			},
			Target = "All"
		},
		Bio = "The graveyard of fame and popularity."
	},
	Fleskhjerta = {
		Id = 10184744222,
		Name = "Fleskhjerta",
		AltCards = {
			Khanbob = {
				Id = 10184748922,
				Name = "Khanbob",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "A strong-willed astronaut, often found wandering into esotheric lands, where the only company he has are semi-sentient spheres."
			},
			["Fleskhjerta-AN"] = {
				Id = 9368643617,
				Name = "Lumberjack",
				AttackEffect = "Axe",
				Bio = "I hate how government keeps taking my guns away. It's why I live in the forest!"
			},
			["Black Hat Hacker Marcus"] = {
				Id = 8072499572,
				Name = "Black Hat Hacker Marcus",
				AttackEffect = "MagicRed",
				Bio = "You forgot to add FilteringEnabled, nerd."
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 2, Green = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "During your end step: If the newest card in your hand is a fighter, it gains 200 health and power. Destroy the oldest card in your hand, then draw a card.",
			Type = "OnEnd",
			Power = {
				{ "HealTargetInHand", 200, "AlliedRightMostHand" },
				{ "StrengthenTargetInHand", 200, "AlliedRightMostHand" },
				{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
				{ "Draw", 1, "Ally" }
			},
			Target = "All"
		},
		Bio = "I, THE GREAT FLESKHJERTA, used to make ROBLOX videos and bloopers...."
	},
	["Malevolent Fanboy"] = {
		Id = 9964834014,
		Name = "Malevolent Fanboy",
		AltCards = {
			["Painful Dreamer Flufflefunz"] = {
				Id = 10572115816,
				Name = "Painful Dreamer Flufflefunz",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "If dreams can come true, then what does that say about nightmares?"
			},
			["Milk Girl"] = {
				Id = 10861871872,
				Name = "Milk Girl",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "...I can change things. After all, I was able to buy milk, you know?"
			}
		},
		Health = 600,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever a legendary fighter dies: This card gains 300 health and power.",
			Type = "OnAnyDeath",
			Power = {
				{ "Heal", 300 },
				{ "Strengthen", 300 }
			},
			Target = "Self",
			Rarity = "Legendary"
		},
		Bio = "I will make them love me!"
	},
	["Mafia Grunt"] = {
		Id = 105563742279949,
		Name = "chunchbunch",
		AltCards = {
			["Mafia Grunt-E"] = {
				Id = 10243645079,
				Name = "Mafia Grunt",
				AttackEffect = "Jab",
				Bio = "You come to me... on the day of my bunny's birthday... And ask me to destroy another person...?"
			},
			Azizapat = {
				Id = 10243646700,
				Name = "Azizapat",
				AttackEffect = "Rifle",
				AltArt = true,
				Bio = "Huh, kinda hard to keep your head from bopping when the road ahead is this bumpy."
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Gun",
		EffectAnimation = "LargeGunEffect",
		Color = "Red",
		Cost = { Red = 12 },
		AlternateCost = { Red = 4 },
		AlternateCostRequirement = { "EqualBoard", "Opponent", 2, 9999, "Greater" },
		Effect = {
			Name = "BANG BANG BANG!!!",
			Description = "If there's 3 more enemy fighters than allied ones, cast this card for {R}{R}{R}{R}.\nWhen this card is cast: Destroy a target fighter. You can't cast anything else this turn.",
			Type = "OnSummon",
			Power = {
				{ "Destroy", 0 },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "Single"
		},
		Bio = "Parry this!"
	},
	mothmage = {
		Id = 6377263831,
		Name = "mothmage",
		AltCards = {
			["mothmage-E"] = {
				Id = 9150927278,
				Name = "Eggle Scout",
				AttackEffect = "Scratch",
				Bio = "The highest rank of the Egg Scouts. What exactly that means? Not sure. But you do get a sweet merit badge sash!!"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		EffectAnimation = "MidMagicYellowEffect",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Effect = {
			Name = "Lion Amp",
			Description = "When this card is cast: A target allied fighter and a target enemy fighter loses 200 power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200, "SingleAlly" },
				{ "Weaken", 200, "SingleEnemy" }
			},
			Target = "Single",
			UniqueTargets = true
		},
		Bio = "MOTHS!"
	},
	SirAdurite = {
		Id = 5034552042,
		Name = "SirAdurite",
		AltCards = {
			n00bfreeperson = {
				Id = 14169507397,
				Name = "n00bfreeperson",
				AttackEffect = "Bat",
				Commissioner = { 51856959, 1082444751 },
				AltArt = true,
				PremiumArt = 85,
				Bio = "Don't put this card in a Yellow deck, I'll take it personally."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Knife",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2, Blue = 2 },
		Effect = {
			Name = "Render",
			Description = "Three times each turn, Whenever an effect targets this card: It gains 150 health. Give yourself a Blue or Red action card.",
			Type = "OnTarget",
			Power = {
				{ "RandomAdd", "Lunar" },
				{ "Heal", 150, "Self" }
			},
			Target = "Ally",
			TurnTriggerLimit = 3
		},
		Bio = "He doesn't even come close to KingAdurite."
	},
	PixelFlame = {
		Id = 4794340391,
		Name = "PixelFlame",
		AltCards = {
			PixelFlameV2 = {
				Id = 8563720013,
				Name = "Pixel Stickmin",
				CopyBodge = "Pixel Stickmin",
				AltArt = true,
				Bio = "Freedom is good. Volcanic apocalypse is bad."
			},
			Epik_Nob = {
				Id = 6877712514,
				AltArt = true,
				Name = "Epik_Nob",
				AttackEffect = "Slash",
				Bio = "Doge annihilator."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Uncommon",
		AttackEffect = "FirePunch",
		Color = "Red",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Conflux",
			Description = "Whenever you cast a fighter, if there's 2 or more allied fighters: You lose 250 life. This effect triggers before any other cast effects.",
			Type = "OnAllySummonSupercede",
			Power = { { "Cost", 250 } },
			Target = "Self",
			EffectRequirement = { "Board", "Ally", 2 }
		},
		Bio = "Freedom is good. Punching faces is bad."
	},
	Kinnis97 = {
		Id = 10243304254,
		Name = "Kinnis97",
		AltCards = {
			["Kinnis97-C"] = {
				Id = 10243349725,
				Name = "Master Sculptor Kinnis",
				AttackEffect = "Ice",
				AddGenZoneant = "Kinnis97-C",
				Bio = "Ice to beat you!"
			},
			["Anthology Of A Young Stag"] = {
				Id = 13278733612,
				Name = "Anthology Of A Young Stag",
				AttackEffect = "British",
				AddGenZoneant = "Anthology Of A Young Stag",
				AltArt = true,
				PremiumArt = 26,
				Bio = "\t\t\t\tWhen I was a kid going into elementary school\n\t\t\t\tRight before I went into elementary school\n\t\t\t\tI was afraid of everything\n\t\t\t\tLike, I couldn't listen to the radio; I was afraid of the radio\n\t\t\t\tAnd now that I'm going into college it's like the exact same thing:\n\t\t\t\tI am literally becoming afraid of everything, and it's-\n\t\t\t\t"
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 2 },
		AddGenZoneant = "Kinnis97",
		Effect = {
			Name = "Stop It, Slender!",
			Description = "When this card is cast, if you have any Colourless cards in your baseplate: Obliterate them all. Put 2 copies of this card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"GenZoneDiscard",
					{ "Neutral", 0 }
				},
				{
					"AddGenZone",
					{ "AddGenZoneant", 2 }
				}
			},
			Target = "Ally",
			EffectRequirement = { "Color", "AllyGenZone", 1, 9999, "Neutral" },
			GenZoneDiscardObliterate = true
		},
		Bio = "Pokemon battler, tarantula collector, mountain biker."
	},
	Qaeo = {
		Id = 8667432150,
		Name = "Qaeo",
		AltCards = {
			Swordsman03 = {
				Id = 6280829261,
				Name = "Swordsman03",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "With every mistake, every failure, and every death: I have grown stronger."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 6 },
		Effect = {
			Name = "Black Magic",
			Description = "When this card is cast: Select a non-Colourless card in your opponent's baseplate. Destroy it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"TargetEnemyColoredBaseplate"
						},
						{
							"MoveZone",
							{ "Target", "GenZone_Opponent", "GraveZone_Opponent", true, false }
						}
					},
					Target = "Self"
				}
			},
			AmountOfTargets = 1
		},
		Bio = "Okay, using black magic is cool and all, but can you at least give some other colors love? Why can't we use ORANGE magic? Do you have a problem with orange?"
	},
	ClanAtlas = {
		Id = 10243241493,
		Name = "ClanAtlas",
		AltCards = {
			Ellhor01 = {
				Id = 10243257267,
				Name = "Ellhor01",
				AttackEffect = "MagicRed",
				AltArt = true,
				Bio = "For my next trick I will make your cards disappear."
			},
			NotSoHumorousDejaun = {
				Name = "NotSoHumorousDejaun",
				Id = 13978712857,
				AttackEffect = "StudBlast",
				Commissioner = { 131263915, 30244924 },
				AltArt = true,
				PremiumArt = 73,
				Bio = "\"Its funny tho...atleast to me that is HAHAHAHA!!!\""
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Unique = true,
		Effect = {
			Name = "Infinite Army",
			Description = "Whenever an effect gives your opponent a card, if it's their turn: Destroy the oldest card in their hand.",
			Type = "OnEnemyPut",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent",
			EffectRequirement = { "TheirTurn", "Me", 30, 303 }
		},
		Bio = "You have violated the law. Your stolen goods are now forfeit."
	},
	Ellernate = {
		Id = 10243251365,
		Name = "Ellernate",
		AltCards = {
			["Unwanted Gift"] = {
				Id = 10243260331,
				Name = "Rampaging Santa Claus",
				AttackEffect = "ClassicRocket",
				Bio = "Hey, at least it wasn't coal."
			}
		},
		Health = 800,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Unique = true,
		Effect = {
			Name = "Infinite Army",
			Description = "Whenever an effect draws your opponent a card, if it's their turn: Destroy the oldest card in their hand.",
			Type = "OnEnemyDraw",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent",
			EffectRequirement = { "TheirTurn", "Me", 30, 303 }
		},
		Bio = "Just because the Terms of Service exist doesn't mean I can't choose to break them."
	},
	TheAmazeMan = {
		Id = 10243382263,
		Name = "TheAmazeMan",
		AltCards = {
			["TheAmazeMan-E"] = {
				Id = 10243385683,
				Bio = "\"I Survived the titanic and all I got was this egg.\""
			}
		},
		Health = 2000,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Neutral = 4, Red = 3 },
		Effect = {
			Name = "Twist",
			Description = "Whenever an effect targets this card: Deal 200 damage to it. It gains 200 power.",
			Type = "OnTarget",
			Power = {
				{ "Damage", 200 },
				{ "Strengthen", 200 }
			},
			Target = "Self"
		},
		Bio = "Nobody really knows whats so amazing about TheAmazeMan, is it his username?"
	},
	BUTQUNA = {
		Id = 10243238123,
		Name = "BUTQUNA",
		AltCards = {
			funnypdg = {
				Id = 10243240585,
				Name = "funnypdg",
				AttackEffect = "Gun",
				EffectAnimation = "SmallShootAll",
				AltArt = true,
				Bio = "Feel your inferiority and strengthen your senses. Oh and also morgana isn't here."
			}
		},
		Health = 650,
		Power = 650,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		EffectAnimation = "FireBreathEnemy",
		Color = "Red",
		Cost = { Neutral = 1, Red = 6 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Deal 150 damage to all enemy fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 150 } },
			Target = "Opponent"
		},
		Bio = "Power of fire compels me, as does BBQ sauce."
	},
	Sammeh = {
		Id = 9098469189,
		Name = "MrSammeh",
		Health = 400,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 1, Red = 2 },
		Effect = {
			Name = "Overload",
			Description = "During your end step: All allied rare fighters gain 100 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 100 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "MrSammeh loves his cheese, right?"
	},
	AMerryCan = {
		Id = 5948828035,
		Name = "AMerryCan",
		AltCards = {
			["AMerryCan-Sun"] = {
				Id = 9166668387,
				Bio = "Celebrate independence by blowing up half the state!",
				AttackEffect = "ClassicRocket"
			},
			["AMerryCan-Banner"] = {
				Id = 10069347211,
				Name = "George Washington",
				AttackEffect = "Rifle",
				Bio = "The founding father of massive stat buffs."
			},
			F1SH = {
				Id = 16361235706,
				AltArt = true,
				AttackEffect = "Whirlpool",
				PremiumArt = 217,
				Name = "F1SH",
				Bio = "You know what that means, FISH!"
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Red",
		Cost = { Neutral = 2, Red = 2, Blue = 2 },
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "When this card is cast: All allied Red fighters gain 100 power. All allied Blue fighters gain 100 health. All allied rare fighters gain 100 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "AlliedBlue" },
				{ "Strengthen", 100, "AlliedRed" },
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "You put ONE tax on tea, and then the next thing you know, the settlers in the New World start a revolution..."
	},
	["Duel Axe Monster"] = {
		Id = 9964888007,
		Name = "SlingshotJunkie",
		AltCards = {
			["Edge Gaming Flufflefunz"] = {
				Name = "Foil Collector Flufflefunz",
				AttackEffect = "Scratch",
				Id = 9964888600,
				AltArt = true,
				Bio = "Memories of an era long forgotten."
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "MagicGreen",
		Color = "Red",
		Cost = { Neutral = 1, Red = 3 },
		Rank = 6,
		Effect = {
			Name = "Subversion",
			Description = "Whenever you cast an allied fighter: Set its power to 200. Unlock it.",
			Type = "OnAllySummon",
			Power = {
				{ "SetPower", 200 },
				{ "Unlock", 9999 }
			},
			Target = "Aggressor"
		},
		Bio = "If he wanted to beat the opponent, why is he shooting medicine to heal them?"
	},
	AVote = {
		Id = 11973301360,
		Name = "AVote",
		AltCards = {
			["AVote-Sun"] = {
				Id = 10243079708,
				AttackEffect = "Microphone",
				Bio = "AVote for me is AVote for more OTKs!"
			},
			["AVote-Banner"] = { Id = 9840506785, Bio = "Partywrecker. Sick chainsaw though." },
			["MELAN_CHXLY, Ledan"] = {
				Id = 12128468496,
				Name = "MELAN_CHXLY, Ledan",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "<i>am I girl? or boy? maybe a third, secret gender?</i>"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Red",
		CustomReminder = { Unlock = "Remove all locks on a fighter, allowing it to attack." },
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
	["Sands of Purgatory"] = {
		Id = 4993618533,
		Name = "Roblox Titanic",
		AltCards = {
			["Roblox Titanic-AN"] = {
				Id = 9345618171,
				Name = "Sands of Purgatory",
				Terrariant = "Purgatory Terrain",
				Bio = "Nothing can survive here... besides Ultras."
			},
			["Roblox Titanic-Sun"] = {
				Id = 13688018134,
				Name = "The Festival",
				Terrariant = "The Festival Terrain",
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 1549933495,
		Terrain = true,
		Terrariant = "Sands Terrain",
		Color = "Red",
		Cost = { Red = 2, Neutral = 2 },
		CustomReminder = {
			["Sinking Ship"] = "This effect doesn't change the total stud cost of a card."
		},
		Effect = {
			Name = "Stud",
			Description = "At the start of each player's turn: Each card that player casts this turn using Colourless studs costs an additional {W}.",
			Type = "OnStart",
			Power = { { "Tax", 1 } },
			Target = "CurrentTurn"
		},
		Bio = "You can't escape the fate of the Titanic, but you can certainly outlive it."
	},
	UristMcSparks = {
		Id = 5832436717,
		Name = "UristMcSparks",
		AltCards = {
			["Eighth Barrier Sentrum1"] = {
				Id = 9873891909,
				Name = "Eighth Barrier Sentrum1",
				AttackEffect = "FirePunch",
				AltArt = true,
				Bio = "Build Up! Charge! Flow! Night Guy!"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 5 },
		WeakenImmune = true,
		DamageImmune = true,
		SetImmune = true,
		DestroyImmune = true,
		ReturnImmune = true,
		CopyImmune = true,
		Effect = {
			Name = "Double life",
			Description = "During your end step: Double the power of all allied fighters. You lose 1500 life.",
			Type = "OnEnd",
			Power = {
				{ "MultiplyPower", 2 },
				{ "Cost", 1500 }
			},
			Target = "Ally"
		},
		Bio = "UristMcSparks is a human being, contrary to popular belief. Treat him as such."
	},
	Connoisseur = {
		Id = 10243130464,
		Name = "myrkrwarrior",
		AltCards = {
			["Armoured Patrol War Tank"] = {
				Name = "Armored Patrol War Tank",
				AttackEffect = "ModernRocket",
				Id = 8072467885,
				Bio = "We've gotta take their base!"
			}
		},
		Health = 150,
		Power = 800,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Red",
		CounterBlock = true,
		CounterAttackBlock = true,
		Cost = { Red = 3 },
		Effect = {
			Name = "haha angry visleafs",
			Description = "",
			Type = "Null",
			Power = { { "Draw", 0 } },
			Target = "Ally"
		},
		Bio = "\"That's a pretty Zepellin you got there, wonder how it will look IN THE BOTTOM OF THE OCEAN AAAA\"- inaudible gunshot rattle-"
	},
	["The Vlad"] = {
		Id = 4800948832,
		Name = "DieSoft",
		AltCards = {
			["DieSoft-E"] = {
				Id = 8757372404,
				Name = "Easter Ripper",
				AttackEffect = "Slash",
				Bio = "Nobody suspects the cameraman."
			},
			["The Vlad-Alt"] = {
				Id = 9345602936,
				Name = "The Vlad",
				AttackEffect = "British",
				AltArt = true,
				Bio = "Critically claimed Greatest Film Ever on RottenBlox."
			}
		},
		Health = 600,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Neutral = 3, Red = 3 },
		Effect = {
			Name = "EzWinz",
			Description = "Whenever this card destroys another: Give yourself a Red legendary card.",
			Type = "OnDestroy",
			Power = "RandomAdd",
			Target = "Ally",
			Increase = "MonoOnlyorRedCost Legendary Red"
		},
		Bio = "Ex-owner of the Elite Builders of Robloxia group and a UGC creator, DieSoft is more than capable of bringing this match to an end."
	},
	Isaac0333 = {
		Id = 10243056798,
		Name = "Insane Isaac",
		AltCards = {
			["Isaac0333-Sun"] = {
				Id = 10242930933,
				AttackEffect = "Slash",
				Bio = "\"So, about that serve being 'out' earlier...\" "
			}
		},
		Health = 950,
		Power = 50,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Red",
		Cost = { Neutral = 1, Yellow = 2, Red = 2 },
		Effect = {
			Name = "Bucket of Pets",
			Description = "During your end step: Destroy each fighter with the lowest health.",
			Type = "OnEnd",
			Power = { { "Destroy" } },
			Target = "LowestHealth"
		},
		Bio = "The chance at fame tainted him. The popularity altered him. The Robots getting the trophy broke him."
	},
	MSE6 = {
		Id = 2903828893,
		Name = "MSE6",
		AltCards = {
			["Yang, Ultimate Survivalist"] = {
				Id = 10861853490,
				Name = "Yang, Ultimate Survivalist",
				AttackEffect = "Scratch",
				AltArt = true,
				Effect = {
					Ability = {
						OnAttackDestroy = {
							Power = { { "Summon", "Ying, The Innocent Victim" } },
							Target = "Opponent"
						},
						OnAnyDeath = {
							Power = {
								{ "Heal", 300 },
								{ "Strengthen", 300 }
							},
							Target = "Self",
							Archetype = "Innocent Woman"
						}
					},
					Bio = "\"Hey, you probably don't know me, but I know you. I'm you, no tricks, no actors, It's you. So, let's get it straight. You are the Ultimate Survivalist, and you have to survive, no matter what.\"<br/>\"No. Matter. What.\""
				}
			},
			["Endless Summoner Cactuar"] = {
				Name = "Fluffle & Leaf, Underpaid & Underappreciated",
				AltArt = true,
				Id = 10820973239,
				Bio = "I want to get off Mr. Bones' Wild Ride.",
				Effect = {
					Ability = {
						OnAttackDestroy = {
							Power = { { "Summon", "Unsuspecting Memer" } },
							Target = "Opponent"
						},
						OnAnyDeath = {
							Power = {
								{ "Heal", 300 },
								{ "Strengthen", 300 }
							},
							Target = "Self",
							Archetype = "Innocent Woman"
						}
					}
				}
			},
			["MSE6-Banner"] = {
				Name = "A.E.O Mischief",
				Id = 12941990107,
				Bio = "\"A little mischief here and there I can deal with, sure, but when that mischief ain't comin' from me, well...\"",
				Effect = {
					Ability = {
						OnAttackDestroy = {
							Power = { { "Summon", "Innocent Man-Banner" } },
							Target = "Opponent"
						},
						OnAnyDeath = {
							Power = {
								{ "Heal", 300 },
								{ "Strengthen", 300 }
							},
							Target = "Self",
							Archetype = "Innocent Woman"
						}
					}
				}
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		Color = "Red",
		Archetype = "MSE6",
		Cost = { Red = 4 },
		Effect = {
			Description = "Whenever this card attacks and destroys another: Your opponent summons a 200/200 Innocent Man that's inert in all zones.\n Whenever an Innocent Man dies: This card gains 300 health and power.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "Summon", "Innocent Man" } },
					Target = "Opponent"
				},
				OnAnyDeath = {
					Power = {
						{ "Heal", 300 },
						{ "Strengthen", 300 }
					},
					Target = "Self",
					Archetype = "Innocent Woman"
				}
			}
		},
		Bio = "The scourge of OT and S&I alike."
	},
	["Innocent Man"] = {
		Id = 5002415696,
		Name = "Innocent Man",
		AltCards = {
			["Unsuspecting Memer"] = {
				Id = 10820977191,
				Name = "Unsuspecting Memer",
				Bio = "What do you MEAN two week ban?? All I did was expose someone's entire extended family!"
			},
			["Ying, The Innocent Victim"] = {
				Id = 10861852807,
				Name = "Ying, The Innocent Victim",
				AttackEffect = "Slash",
				Bio = "...but it's Sunday, tommorrow is my day off-"
			},
			["Innocent Man-Banner"] = {
				Id = 12941988897,
				Name = "JUDGEMENT",
				AttackEffect = "Jab",
				Bio = "\"...Let's just say I like my omelettes seasoned with the shell left intact.\""
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "Innocent Woman",
		Cost = { Neutral = 0 },
		TokenOmni = true,
		Effect = {
			Description = "When this card dies: Cope.",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "\"Hey, kids! Today I'm at Builderman's flat, protesting the recent BC-only pla-\""
	},
	Chiefjustus = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis"] = {
				Id = 10184585595,
				Name = "Zeige Siksis",
				AttackEffect = "MagicRed",
				AltArt = true,
				Transformant = "Zeige Siksis-LVL2",
				EffectAnimation = "LargeHammer",
				Bio = "Quiet day today, might be able to sneak in some shuteye...."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Transformant = "Chiefjustuslv2",
		EffectAnimation = "LargeHammer",
		CustomReminder = {
			BANNED = "Cast a card of each rarity to level this up. At max level, it gains +1200/+1200 on your end steps."
		},
		Effect = {
			Name = "Master Blast",
			Description = "Level 1.\nWhenever you cast a common card: This card deals 300 damage to a target enemy fighter. Level this card up.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Damage", 300, "SingleEnemy" },
				{ "Transform", "Transformant" }
			},
			Rarity = "Common",
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Chiefjustuslv2 = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis-LVL2"] = {
				Id = 6055785499,
				Name = "Zeige Siksis",
				AttackEffect = "MagicRed",
				Transformant = "Zeige Siksis-LVL3",
				EffectAnimation = "LargeHammer",
				Bio = "Hm? A pipe leak on Section 2? Alright... I'll send someone to handle it."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Transformant = "Chiefjustuslv3",
		EffectAnimation = "LargeHammer",
		CustomReminder = {
			["IP BANNED"] = "Cast a card of each rarity to level this up. At max level, it gains +1200/+1200 on your end steps."
		},
		Effect = {
			Name = "Master Blast",
			Description = "Level 2.\nWhenever you cast an uncommon fighter: This card deals 300 damage to a target enemy fighter. Level this card up.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Damage", 300, "SingleEnemy" },
				{ "Transform", "Transformant" }
			},
			Rarity = "Uncommon",
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Chiefjustuslv3 = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis-LVL3"] = {
				Id = 10184587039,
				Name = "Zeige Siksis",
				AttackEffect = "MagicRed",
				Transformant = "Zeige Siksis-LVL4",
				EffectAnimation = "LargeHammer",
				Bio = "A low tier debt job? Well, just send it to the collectors, not <i>me</i>! <i>They're</i> the ones you're supposed to notify."
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Transformant = "Chiefjustuslv4",
		EffectAnimation = "LargeHammer",
		CustomReminder = {
			["HYPER BANNED"] = "Cast a card of each rarity to level this up. At max level, it gains +1200/+1200 on your end steps."
		},
		Effect = {
			Name = "Master Blast",
			Description = "Level 3.\nWhenever you cast a rare fighter: This card deals 300 damage to a target enemy fighter. Level this card up.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Damage", 300, "SingleEnemy" },
				{ "Transform", "Transformant" }
			},
			Rarity = "Rare",
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Chiefjustuslv4 = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis-LVL4"] = {
				Id = 10184587618,
				Name = "Zeige Siksis",
				AttackEffect = "MagicRed",
				Transformant = "Zeige Siksis-LVL5",
				EffectAnimation = "LargeHammer",
				Bio = "A <i>RAISE</i>?! Hey, you bring those topics to the higher-ups at the other department, not me! You're wasting my <i>time</i> here! And YOU, you're also supposed to send the jobs to the COLLECTORS, not to the manager! You ALL should know this by day <i>ONE</i>!"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Transformant = "Chiefjustuslv5",
		EffectAnimation = "LargeHammer",
		CustomReminder = {
			["ULTRA BANNED"] = "Cast a card of each rarity to level this up. At max level, it gains +1200/+1200 on your end steps."
		},
		Effect = {
			Name = "Master Blast",
			Description = "Level 4\nWhenever you cast an epic fighter: This card deals 300 damage to a target enemy fighter. Level this card up.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Damage", 300, "SingleEnemy" },
				{ "Transform", "Transformant" }
			},
			Rarity = "Epic",
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Chiefjustuslv5 = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis-LVL5"] = {
				Id = 6055788368,
				Name = "Zeige Siksis",
				AttackEffect = "MagicRed",
				Transformant = "Zeige Siksis-LVL6",
				EffectAnimation = "LargeHammer",
				Bio = "The rage of the once-almighty Zeige Siksis is beyond the comprehension of the cruelest of demons. Not many things cause it to boil to the fullest capacity, yet one of these things is <b><i>workplace incompetance.</i></b>"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		Transformant = "Chiefjustuslv6",
		EffectAnimation = "LargeHammer",
		CustomReminder = {
			["BANNED IRL"] = "Cast a card of each rarity to level this up. At max level, it gains +1200/+1200 on your end steps."
		},
		Effect = {
			Name = "Master Blast",
			Description = "Level 5.\nWhenever you cast a legendary fighter: This card deals 300 damage to a target enemy fighter. Level this card up.",
			Type = "OnAnyAllyCast",
			Power = {
				{ "Damage", 300, "SingleEnemy" },
				{ "Transform", "Transformant" }
			},
			Rarity = "Legendary",
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Chiefjustuslv6 = {
		Id = 10184577254,
		Name = "Chiefjustus",
		AltCards = {
			["Zeige Siksis-LVL6"] = {
				Id = 10184589243,
				Name = "666",
				AttackEffect = "MagicRed",
				EffectAnimation = "LargeHammer",
				Bio = "<b><i>Can you guess why wolves built heaven?</i></b>"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Token",
		AttackEffect = "Hammer",
		Color = "Red",
		Cost = { Neutral = 2, Red = 5 },
		DamageImmune = true,
		SwapImmune = true,
		EffectAnimation = "LargeHammer",
		Effect = {
			Name = "Master Blast",
			Description = "Max level.\nDuring your end step: This card gains 1200 Health and Power. Your opponent loses all of their {W}.",
			Type = "OnEnd",
			Power = {
				{ "Heal", 1200 },
				{ "Strengthen", 1200 },
				{ "SetNeutral", 0, "Opponent" }
			},
			Target = "Self",
			EffectTransformPreserveRarity = true
		},
		Bio = "He brings ROBLOX justice everywhere he goes!"
	},
	Nikilis = {
		Id = 10242943365,
		Name = "Nikilis",
		AltCards = {
			["Nikilis-E"] = {
				Id = 10242945614,
				AttackEffect = "FirePunch",
				EffectAnimation = "FireBreathSmall",
				Name = "Raging Rabbit",
				Bio = "Pathetic."
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Epic",
		AttackEffect = "Knife",
		EffectAnimation = "KnifeThrow",
		Color = "Red",
		Cost = { Neutral = 1, Red = 5 },
		Charge = true,
		Effect = {
			Name = "Knife Throw",
			Description = "When this card is cast: Deal 350 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 350 } },
			Target = "Single"
		},
		Bio = "He knows how to stop any potential murderer. Great for the festival."
	},
	["Bloxy Victory"] = {
		Id = 10242884932,
		Name = "Bloxy Victory",
		AltCards = {
			BloxyVictoryArtV1 = {
				Id = 10242888013,
				Name = "Classic Bloxy Victory",
				AltArt = true,
				Bio = "And the award for Best Play goes to..."
			},
			["Bloxy Victory-AN"] = {
				Id = 18298924438,
				AttackEffect = "Revolver",
				Name = "LAST RESORT : HOLY IGNITE",
				Bio = "I WON'T LET YOU CONQUER THIS WORLD!!!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Null",
		Color = "Red",
		Cost = { Red = 5 },
		Lunar = true,
		Bio = "A lifetime of hard work and difficulty, all for a useless trophy. Mewsitive had to break the cycle.",
		Effect = {
			Name = "Bloxy Victory",
			Description = "Deal 250 damage to all allied fighters.\nThey gain 600 power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 600 },
				{ "Damage", 250 }
			},
			Target = "Ally"
		}
	},
	Ozzypig = {
		Id = 6102897573,
		Name = "Ozzypig",
		AltCards = {
			["Rad, Flamma"] = {
				Id = 13628300627,
				Name = "Rad, Flamma",
				Commissioner = { 1652483038, 8289996 },
				AttackEffect = "FirePunch",
				AltArt = true,
				PremiumArt = 41,
				Bio = "Liquefacta et furit."
			},
			["Ozzypig-AWIH"] = {
				Id = 17600666140,
				Name = "Creepy Pasta Chef",
				AttackEffect = "Punch",
				Bio = "He may be unsettling, but he can cook a mean plate of noodles.",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 800,
		Power = 350,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Red",
		Cost = { Red = 3, Neutral = 4 },
		Effect = {
			Name = "EzWinz",
			Description = "Whenever this card attacks: Give yourself a Red legendary card.",
			Type = "OnAttack",
			Power = "RandomAdd",
			Target = "Ally",
			Increase = "MonoOnlyorRedCost Legendary Red"
		},
		Bio = "Fists or death!!"
	},
	Jayson13 = {
		Id = 4564777067,
		Name = "Mewsitive",
		AltCards = {
			FoxxoTrystan = {
				Id = 86209758463113,
				Name = "Burning Chicken",
				AttackEffect = "Bat",
				AltArt = true,
				Bio = "SQUAAAAAAAAAAAAAAAAAWK!"
			},
			["Bloxy Winner Mewsitive"] = {
				Id = 10242835465,
				Name = "Bloxy Winner Mewsitive",
				AttackEffect = "Scratch",
				Bio = "A prize worth fighting for."
			}
		},
		Health = 500,
		Power = 2000,
		Rarity = "Legendary",
		AttackEffect = "Darkheart",
		Color = "Red",
		Cost = { Neutral = 2, Red = 4 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Also known as 13Jayson. Mewsitive is the creator of The Robots, check it out!"
	},
	["Primal Gato"] = {
		Id = 11972964356,
		Name = "Primal Gato",
		AltCards = {
			["Primal Gato-Sun"] = { Id = 10242749361, Bio = "The apex predator." },
			Starved = {
				Id = 12326619756,
				Name = "Starved",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "a little famished"
			}
		},
		Health = 600,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Scratch",
		Color = "Red",
		Cost = { Neutral = 2, Red = 1 },
		Effect = {
			Name = "Starting Slow",
			Description = "During your end step: This card gains 250 power.",
			Type = "OnEnd",
			Power = "Strengthen",
			Target = "Self",
			Increase = 250
		},
		Bio = "GRAWR!"
	},
	Sibs = {
		Id = 10242866476,
		Name = "Sibs",
		AltCards = {
			["Sibs-ArtV"] = {
				Id = 10242866918,
				AltArt = true,
				Bio = "...And they still work so well together."
			}
		},
		Health = 500,
		Power = 900,
		Rarity = "Legendary",
		AttackEffect = "Gun",
		Color = "Red",
		Cost = { Neutral = 3, Red = 7 },
		EffectAnimation = "EatCake",
		Effect = {
			Name = "Motivate",
			Description = "When this card is cast: Set the health of a target fighter to 1000.",
			Type = "OnSummon",
			Power = { { "SetHealth", 1000 } },
			Target = "Single"
		},
		Bio = "Eternal love can destroy any obstacle."
	},
	["Gato Luz"] = {
		Id = 3238116635,
		Name = "Gato Luz",
		AltCards = {
			["Gato Luz-Val"] = {
				Id = 7138173739,
				Name = "Gato Luz",
				CopyBodge = "Gato Luz-Val",
				Bio = "The warmest robotic cat you'll ever love."
			},
			["Gato Luz-Alt"] = {
				Id = 8269904776,
				Name = "Gato Luz",
				AltArt = true,
				Bio = "Waiting for his master's return, the Gato gently slumbers."
			},
			["Levi Thatcher"] = {
				Id = 15941937390,
				Name = "Levi Thatcher",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 203,
				Bio = "<b><font color=\"#BF0A30\">\"Patrol duty is nothing more than a tiresome dance with danger and uncertainty that I've grown to despise.\"</font></b>"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Scratch",
		Color = "Blue",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Booting",
			Description = "When this card is cast or dies: Unlock a target allied fighter, then lock it for 1 turn. Reveal your opponent's hand.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Unlock", 9999, "SingleAlly" },
						{ "Lock", 1, "SingleAlly" },
						{ "RevealHand", 1 }
					},
					Target = "Opponent"
				},
				OnDeath = {
					Power = {
						{ "Unlock", 9999, "SingleAlly" },
						{ "Lock", 1, "SingleAlly" },
						{ "RevealHand", 1 }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "This robotic cat is basically the mascot of 'The robots'. Don't worry, you won't be in the darkness when you're with it."
	},
	Fenrier = {
		Id = 4789701945,
		Name = "Fenrier",
		AltCards = {
			["Fenrier-Sun"] = {
				Id = 7236317333,
				Name = "Fenrier",
				AttackEffect = "Jab",
				Bio = "The sun is flat. Wake up, sheeple!"
			}
		},
		Health = 700,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Blue = 4 },
		Effect = {
			Name = "4691 Irradiated Haggis",
			Description = "Once each turn, whenever an allied effect suspends a fighter: Unlock a target fighter and it gains 200 Health.",
			Ability = {
				OnAllySuspend = {
					Power = {
						{ "Unlock", 99999 },
						{ "Heal", 200 }
					},
					Target = "Single",
					TurnTriggerLimit = 1
				}
			}
		},
		Bio = "Spark the eternal strife, and turn summer into the next year's snow."
	},
	Ehj236 = {
		Id = 5832354645,
		Name = "Ehj236",
		AltCards = {
			["Ehj236-Sun"] = {
				Id = 9150929356,
				AttackEffect = "Scratch",
				Bio = "Lobsters don't feel pain, but they sure feel anger."
			},
			dark = {
				Id = 15310036371,
				Name = "dark",
				AltArt = true,
				PremiumArt = 157,
				AttackEffect = "Scratch",
				Bio = "bury me with my money"
			}
		},
		Health = 1000,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		Fading = true,
		Effect = {
			Name = "Life fam",
			Description = "Whenever an allied fighter dies: Summon a copy of it. Destroy this card.",
			Type = "OnAllyDeath",
			Power = {
				{ "LastDeath" },
				{ "Destroy", 0, "Self" }
			},
			Target = "Ally",
			BypassFavorCheck = true
		},
		Bio = "A butler's duty is to protect the duties of others, sir."
	},
	Round4 = {
		Id = 5832354645,
		Name = "Ehj236",
		CopyBodge = "Round3",
		Health = 1000,
		Power = 300,
		Rarity = "Token",
		Fading = true,
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 5 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "A butler's duty is to protect the duties of others, sir."
	},
	litozinnamon = {
		Id = 136258516393632,
		Name = "Pentinent Paragon",
		AltCards = {
			["litozinnamon-C"] = {
				Id = 10281394724,
				Name = "Belsnickel",
				AttackEffect = "Slash",
				EffectAnimation = "MidMagicBlueEffect",
				Bio = "The monstrously large fish of the Ithian Highlands can be defeated only with a monstrously larger than life personality."
			},
			SylviaLitoz = {
				Id = 14545729726,
				Name = "Sylvia",
				AttackEffect = "IcePunch",
				EffectAnimation = "Freeze",
				PremiumArt = 107,
				AltArt = true
			},
			["litozinnamon-Mango"] = {
				Name = "Bum Prime",
				Id = 140710769663740,
				AttackEffect = "Punch",
				ArtAnimation = "Prime",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "Of all the mechanical endeavors the Man-Gos took to save their city from crumbling under their own <b>Pride</b>, none came close to the perfection and power of Bum Prime."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Gun",
		EffectAnimation = "MidRifleEffect",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 2 },
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "When this card is cast: A target fighter loses 150 power. Lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Weaken", 150 }
			},
			Target = "Single"
		},
		Bio = ""
	},
	Lohit = {
		Id = 10184554884,
		Name = "Lohit",
		AltCards = {
			Madotsuki = {
				Id = 10184575433,
				Name = "Madotsuki",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Last night I dreamed I had to tell my parents about us. When I woke up, I was crying."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		Effect = {
			Name = "Teamwork",
			Description = "Once each turn, whenever an effect locks this card: Draw a card.",
			Type = "OnEffectLock",
			Power = { { "Draw", 1 } },
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Chop!"
	},
	Icerain = {
		Id = 10184489137,
		Name = "Icerain",
		AltCards = {
			["Icerain-C"] = {
				Name = "Jack Frost",
				AttackEffect = "IcePunch",
				Id = 8161557900,
				Bio = "Not the Hee-Ho kind..."
			},
			Smashdown = {
				Name = "Smashdown",
				AttackEffect = "Jab",
				Id = 8553612359,
				AltArt = true,
				Bio = "The monster quarterback with a blitz attack. He will punch you into the endzone. Go wild for Smashdown!"
			},
			["Fireteam Bravo"] = {
				Id = 16562310724,
				Name = "Fireteam Bravo",
				AttackEffect = "Punch",
				AltArt = true,
				PremiumArt = 196,
				Bio = "\"You're the worst, Levi.\""
			}
		},
		Health = 1000,
		Power = 600,
		Rarity = "Common",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 4 },
		Effect = {
			Name = "Life fam",
			Description = "After this card attacks: Lock it for 6 turns.",
			Type = "OnAttackEnd",
			Power = { { "Lock", 6, "Self" } },
			Target = "All"
		},
		Bio = "It's a shame there's no way to make unlocking cards faster in this game, eh?"
	},
	tertiarick = {
		Id = 14556005888,
		Name = "7Solstice7",
		AltCards = {
			["tertiarick-Val"] = {
				Id = 14557501144,
				Name = "Solstice",
				AttackEffect = "Jab",
				Bio = "Do you wanna test me now my love?"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Uncommon",
		AttackEffect = "Freeze",
		Color = "Blue",
		Cost = { Blue = 3 },
		EffectVariable = 1,
		Effect = {
			Name = "Life fam",
			Description = "Once each turn, whenever an allied effect targets: You gain 600 life.",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnAllyTarget = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Cost", -600 },
						{
							"AlterEV",
							{ "Set", "Math", 0 }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "AQUA REGIA"
	},
	Darklord1506 = {
		Id = 6030850801,
		Name = "Darklord1506",
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Ruinate Time",
			Description = "When this card is cast: Unlock a target fighter, then lock it for 1 turn. It gains 300 health.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 1 },
				{ "Heal", 300 }
			},
			Target = "Single"
		},
		Bio = "Many people are scared of the dark. If you're one of these people, just remember that darkness is just a lack of photons bouncing into your eyes. That's a pretty silly thing to be scared of."
	},
	Wesker202 = {
		Id = 119426129407610,
		Name = "John Deathedge",
		AltCards = {
			Wesker202Art = {
				Id = 114852685781782,
				Name = "Timeline: E, JOHN THOUGHT DEMON MASTER OMEGA",
				AttackEffect = "Scratch",
				CopyBodge = "Wesker202Art",
				Bio = "After stealing the Alpha brick, John used its powers to take down the strongest warriors and beasts in robloxia. He unfortunately didn't last long. This card is from another timeline."
			}
		},
		Health = 250,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 4 },
		Addant = "Eye of Rapture",
		CustomReminder = {
			["God Move : Lock & Key"] = "A free Blue token action. It locks all allied fighters for 1 turn, then readies them once."
		},
		Effect = {
			Description = "When this card is cast: Give yourself your 'GOD MOVE : LOCK & KEY !'\nWhenever this card becomes locked: It gains 200 health.",
			Ability = {
				OnSummon = {
					Power = { { "Add", "Addant" } },
					Target = "Ally"
				},
				OnLock = {
					Power = { { "Heal", 200 } },
					Target = "Self"
				}
			}
		},
		Bio = "Younger brother of the uncontested worst Alpha Brick wielder of all time. Also a full-time anime powerscaler and LARPer."
	},
	["Eye of Rapture"] = {
		Id = 121478738245943,
		Name = "God Move : Lock & Key",
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		TokenGenZone = true,
		Cost = { Neutral = 0 },
		Effect = {
			Name = "Lens Blip",
			Description = "Lock all allied fighters, then readies them once.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 1 },
				{ "Unlock", 1 }
			},
			Target = "Ally"
		},
		Bio = "BAHAHAHAHA! I UNLEASH MY ULTIMATE ATTACK! I'D LIKE TO SEE YOU TRY AND WEASEL YOUR WAY OUT OF THIS ONE!"
	},
	Mlgloga = {
		Id = 10280796315,
		Name = "Mlgloga",
		AltCards = {
			["Mlgloga-E"] = {
				Id = 8650632362,
				CopyBodge = "Mlgloga-E",
				AttackEffect = "Jab",
				Bio = "Place your bets on who gets the egg first."
			},
			Gibbous = {
				Id = 137412839773878,
				Name = "Deep Sea Horror",
				AttackEffect = "Gravity",
				Commissioner = { 41926915 },
				AltArt = true,
				PremiumArt = 21,
				Bio = "An unmoving ancient robloxian creature that glides with the waves of the sea. Rumored to be around 6000 (or 7000) years old. The greatest horror to the sailors of the ocean. Has now been reduced to a mere tourist attraction."
			}
		},
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
	CinematicMind = {
		Id = 10280893841,
		Name = "CinematicMind",
		AltCards = {
			["CinematicMind-E"] = {
				Id = 8822687452,
				Name = "Maddy Hatter",
				AttackEffect = "Flame",
				Bio = "And now for my next trick, your pet rabbit will dissapear!"
			}
		},
		Health = 450,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 1 },
		Effect = {
			Name = "ability to force people to watch a movie, and use his CinematicMind as a projector",
			Description = "When this card is cast: Unlock a target fighter, then lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 1 }
			},
			Target = "Single"
		},
		Bio = "Note: Cannot compute radio signals."
	},
	KnightDude = {
		Id = 6670739644,
		Name = "knightdude",
		AltCards = {
			wildygamer = {
				Id = 7268115497,
				Name = "wildygamer",
				AttackEffect = "Gun",
				AltArt = true,
				Bio = "He's wild and a gamer. What more could you want?"
			}
		},
		Health = 350,
		Power = 350,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 2 },
		Effect = {
			Name = "Parry",
			Description = "Once each turn, whenever an effect targets this card: It gains 150 health and power.",
			Type = "OnTarget",
			Power = {
				{ "Strengthen", 150 },
				{ "Heal", 150 }
			},
			Target = "Self",
			TurnTriggerLimit = 1
		},
		Bio = "A popular forumer, he is known to sword fight in an excellent manner."
	},
	Hideaki = {
		Id = 4930678390,
		Name = "Hideaki",
		AltCards = {
			Orbit = {
				Id = 9347937576,
				Name = "Orbit",
				AttackEffect = "Storm",
				AltArt = true,
				Bio = "\"Hailing from parts unknown, it's the People's Champion! Here's... Orbit!\""
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Katana",
		Color = "Blue",
		Cost = { Blue = 4, Neutral = 1 },
		CustomReminder = {
			["Big Distraction"] = "A fighter with defender must be attacked before all others."
		},
		Effect = {
			Name = "Haydoscale",
			Description = "When this card is cast, if there's 2 or more allied rare fighters: A target fighter gains defender.",
			Type = "OnSummon",
			Power = { { "GivePassive", "Shield" } },
			Target = "Single",
			EffectRequirement = { "Rarity", "Ally", 2, 9999, "Rare" }
		},
		Bio = "Hideaki is the master of disguise, you probably didn't even know this card existed until now!"
	},
	["Metal Bloxxer"] = {
		Id = 10281033955,
		Name = "ChadTheCreator",
		AltCards = {
			["ChadTheCreator-Hal"] = {
				Id = 128919684756610,
				AttackEffect = "Storm",
				Bio = "He should have read the fine print on his organ donor register."
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 3 },
		SummonAnimation = "DancePotionAll",
		Effect = {
			Name = "Even Out",
			Description = "When this card is cast: Set the health of all fighters to 500.",
			Type = "OnSummon",
			Power = { { "SetHealth", 500 } },
			Target = "All"
		},
		Bio = "Welcome to Club Boates. Can I get you a drink of skeletal marrow?"
	},
	["Tiny Tank"] = {
		Id = 10281138727,
		Name = "Tiny Tank",
		Health = 800,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "ModernRocket",
		Color = "Blue",
		Cost = { Blue = 3 },
		Effect = {
			Name = "Shell Shock",
			Description = "Whenever this card gains locks: It gains 100 health and power.",
			Type = "OnLockIncrease",
			Power = {
				{ "Heal", 100 },
				{ "Strengthen", 100 }
			},
			Target = "Self"
		},
		Bio = "Check out Tiny Tanks by Sharksie if you like fun games like this one!"
	},
	WildSpeedy = {
		Id = 10280519346,
		Name = "WildSpeedy",
		AltCards = {
			["WildSpeedy-C"] = {
				Id = 8122073194,
				Name = "SantaSpeedy",
				AttackEffect = "Jab",
				Bio = "He certainly is."
			}
		},
		Health = 500,
		Power = 100,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Blue",
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
	["The Famous Destruction5033"] = {
		Id = 10281273840,
		Name = "The Famous Destruction5033",
		AltCards = {
			Grimblox = {
				Name = "Grimblox",
				AttackEffect = "Slash",
				Id = 8036109288,
				Bio = "It would enjoy a supple neck such as your own."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Neutral = 1, Blue = 2, Yellow = 2, Red = 2 },
		ReturnImmune = true,
		Effect = {
			Name = "FA-FA-FA-FAMOUS",
			Description = "When this card is cast, if you have no Green cards in your baseplate: Return a target enemy fighter to its hand. Destroy the oldest card in that hand.",
			Type = "OnSummon",
			Power = {
				{ "Return" },
				{ "SpecificDiscard", 1, "EnemyLeftMostHand" }
			},
			Target = "SingleEnemy",
			EffectRequirement = { "Color", "AllyGenZone", 0, 1, "Green" }
		},
		Bio = "He's the most FAMOUSEST person in Blox Cards ... FAMOUSEST person?"
	},
	Sharksie = {
		Id = 10281316728,
		Name = "Sharksie",
		AltCards = {
			OrganicComb = {
				Id = 12863205184,
				AltArt = true,
				Name = "OrganicComb",
				AttackEffect = "LaserBlue",
				Bio = "\"wyd fight back\"."
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Epic",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 7 },
		Effect = {
			Name = "Always wear a burkini",
			Description = "Whenever your opponent casts a fighter that costs 4 or fewer total studs: Lock that fighter for 2 turns.",
			Type = "OnEnemySummon",
			Power = { { "Lock", 2 } },
			Target = "Aggressor",
			LowCost = 4
		},
		Bio = "A few tiny tanks won't hurt anyone, right?"
	},
	FabulousMettaton123 = {
		Id = 10243125671,
		Name = "FabulousMettaton123",
		Health = 1200,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Red",
		Charge = true,
		Archetype = "FabulousMettaton123",
		Requirement = { "Archetype", "Ally", 1, 9999, "FabulousMettaton123" },
		Cost = { Neutral = 2, Red = 5 },
		AddBlock = true,
		Effect = {
			Name = "Moonlight Butterfly Dance",
			Description = "Cast only if you have KennedyLeDog in play.\nDuring your end step: Deal 150 damage to all enemy fighters.",
			Type = "OnEnd",
			Power = { { "Damage", 150 } },
			Target = "Opponent"
		},
		Bio = "More fabulous than a drab chair!"
	},
	FabulousBench = {
		Id = 10280885659,
		Name = "FabulousBench",
		AltCards = {
			["FabulousBench-ArtV"] = {
				Id = 10280882428,
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "My elegance in combat is unparalleled!"
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Blue",
		Archetype = "FabulousBench",
		Requirement = { "Archetype", "Ally", 1, 9999, "FabulousBench" },
		Charge = true,
		Cost = { Neutral = 2, Blue = 5 },
		AddBlock = true,
		Effect = {
			Name = "Trout Slap",
			Description = "Cast only if you have Hamstermon in play.\nDuring your end step:  All enemy fighters lose 150 power.",
			Type = "OnEnd",
			Power = { { "Weaken", 150 } },
			Target = "Opponent"
		},
		Bio = "More fabulous than an inelegant robot!"
	},
	KennedyLeDog = {
		Id = 10242907865,
		Name = "KennedyLeDog",
		Health = 800,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Red",
		Archetype = "FabulousMettaton123",
		Cost = { Neutral = 2, Red = 3 },
		EffectAnimation = "SmallRecyclablesEffectEnemy",
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: Deal 250 damage to all fighters that cost 2 or fewer total studs.",
			Type = "OnSummon",
			Power = { { "Damage", 250 } },
			TargetParameters = {
				Zones = { "Ally_Field", "Enemy_Field" },
				Condition = "TotalCostOrLess",
				Modifier = 2
			},
			Target = "CustomTarget"
		},
		Bio = "My dance has a certain elegance!"
	},
	Hamstermon = {
		Id = 4992126764,
		Name = "Hamstermon",
		AltCards = {
			["Hamstermon-Val"] = {
				Name = "Lovestermon",
				Id = 10280888755,
				CopyBodge = "Hamstermon-Val",
				Bio = "It's time to add some love to this battlefield!"
			}
		},
		Health = 750,
		Power = 350,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Neutral = 2, Blue = 3 },
		Archetype = "FabulousBench",
		Effect = {
			Name = "Sugar Taste",
			Description = "When this card is cast: All enemy fighters lose 100 power.",
			Type = "OnSummon",
			Power = { { "Weaken", 100 } },
			Target = "Opponent"
		},
		Bio = "It's time to add some color to this battlefield!"
	},
	SuperCloud9 = {
		Id = 10281194713,
		Name = "SupernalNine",
		AltCards = {
			["SuperCloud9-Val"] = {
				Id = 10281277008,
				Name = "SupernalHarp",
				AttackEffect = "MagicBlue",
				Bio = "Is a lover always innocent?"
			}
		},
		Health = 500,
		Power = 600,
		Rarity = "Epic",
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
	["Frozen Phoenix"] = {
		Id = 10280951349,
		Name = "Frozen Phoenix",
		AltCards = {
			["Frozen Phoenix-C"] = {
				Id = 10280943446,
				Name = "Yuki Onna",
				AttackEffect = "MagicBlue",
				Bio = "At least she's not Ren Onna."
			},
			["Degenerate Defroster"] = {
				Id = 10280940973,
				Name = "Degenerate Defroster",
				AttackEffect = "Ice",
				AltArt = true,
				Bio = "I told him if he keeps making weird faces it'll freeze that way. He didn't know I was being literal."
			}
		},
		Health = 2000,
		Power = 1200,
		Rarity = "Rare",
		AttackEffect = "Ice",
		Color = "Blue",
		Cost = { Blue = 12 },
		Rank = 9,
		TargetImmune = true,
		ReturnImmune = true,
		Effect = {
			Name = "Revival",
			Description = "Whenever this card attacks and destroys another: Unlock this card. Return all fighters to their owner's hands.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Unlock", 999, "Self" },
				{ "Return", 30 }
			},
			Target = "All"
		},
		Bio = "Renders wildfires meaningless."
	},
	Teaism = {
		Id = 6119873602,
		Name = "Teaism",
		AltCards = {
			Teadaddy = {
				Name = "Iceful",
				Id = 16446074179,
				AltArt = true,
				Addant = "Beedaddy",
				Bio = "I could really use a wish right now, wish right now, wish right now."
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "IcePunch",
		SummonAnimation = "FrostySummon",
		SummonedAnimation = "FrostySummon",
		Color = "Blue",
		Cost = { Neutral = 7, Blue = 3 },
		Addant = "Beeism",
		CustomReminder = {
			Soulful = "A Green {W}{W}{G}{G}{G}{G}{G}{G} 900/500. It gives you a copy of Teaism when cast."
		},
		Effect = {
			Name = "T2B",
			Description = "When this card is cast: Give yourself Soulful. Put a copy of that card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{
					"AddGenZone",
					{ "Beeism", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "The Tea to the... Soul? This scheme doesn't work anymore..."
	},
	Beeism = {
		Id = 16446071465,
		Name = "Soulful",
		AltCards = {
			Beedaddy = {
				Id = 16446071571,
				AltArt = true,
				Addant = "Teadaddy",
				AttackEffect = "LaserGreen",
				Bio = "Can we pretend that airplanes in the night sky are like shootin' stars?"
			}
		},
		Health = 900,
		Power = 500,
		Rarity = "Legendary",
		SummonAnimation = "Soulful",
		SummonedAnimation = "Soulful",
		AttackEffect = "MzhLaser",
		Color = "Green",
		Cost = { Neutral = 2, Green = 6 },
		Addant = "Teaism",
		CustomReminder = {
			Teaism = "A Blue {W}{W}{W}{W}{W}{W}{W}{B}{B}{B} 1200/400. It gives you Soulful when cast."
		},
		Effect = {
			Name = "B2T",
			Description = "When this card is cast: Give yourself Teaism. Put a copy of that card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{
					"AddGenZone",
					{ "Teaism", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "Yes, I can confirm it DID hurt when I fell from heaven."
	},
	Alexnewtron = {
		Id = 94288849572556,
		Name = "FutonJohn",
		AltCards = {
			["Alexnewtron-E"] = {
				Id = 10281705789,
				Name = "First Chicken",
				AttackEffect = "Scratch",
				Bio = "Guess we know which came first."
			},
			["Pioneer Flufflefunz"] = {
				Id = 11525314982,
				Name = "Pioneer Flufflefunz",
				AttackEffect = "Slash",
				ArtAnimation = "FlufflefunzPioneer",
				AltArt = true,
				Bio = "My card's attention, and I am an addict."
			},
			["Alexnewtron-Mango"] = {
				Name = "Rockhead Enforcer",
				Id = 111738439640443,
				AttackEffect = "Punch",
				PackDisplayOverride = "CRiMP Alt Art Bundle",
				Bio = "You are one step from the gates; the guard will test you, but you have completed their sacred trials. You will pass through into the Forge, and will spend the rest of your life among the Rockheads."
			}
		},
		Health = 700,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Blue = 3, Neutral = 2 },
		Effect = {
			Name = "Confusion Strike",
			Description = "When this card is cast: Swap the stats of all enemy fighters, then all enemy fighters lose 150 power.",
			Type = "OnSummon",
			Power = {
				{ "Swap", 100000 },
				{ "Weaken", 150 }
			},
			Target = "Opponent"
		},
		Bio = "\"Huh?\""
	},
	JackInTheBlox = {
		Id = 10281552630,
		Name = "JackInTheBlox",
		AltCards = {
			TheDarkenedCrow = {
				Id = 10281549827,
				AttackEffect = "Jab",
				AltArt = true,
				CopyBodge = "TheDarkenedCrow",
				Name = "TheDarkenedCrow",
				Bio = "I am Smug Dimmadome, and I have a dream to become a Texan Star!"
			}
		},
		Health = 1500,
		Power = 300,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Blue",
		Cost = { Neutral = 4, Blue = 4 },
		Effect = {
			Name = "TNL Blessing",
			Description = "When this card is cast: You gain 1500 life.",
			Type = "OnSummon",
			Power = { { "Cost", -1500 } },
			Target = "Opponent"
		},
		Bio = "Known as the livestream host for ROBLOX's 'The Next Level,' Jack with his purple hair is the staple to any deck affiliated with its trait."
	},
	Mrbeanbean2 = {
		Id = 3164494036,
		Name = "Mrbeanbean2",
		AltCards = {
			ManixDash = {
				Id = 8645458667,
				AttackEffect = "Microphone",
				AltArt = true,
				CopyBodge = "ManixDash",
				Name = "ManixDash",
				Bio = "Wrong Answer = Death"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Common",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Knockdown",
			Description = "When this card is cast, if there's an allied non-Green fighter: Give yourself a rare card.",
			Type = "OnSummon",
			Power = { { "RandomAdd", "Rare" } },
			Target = "Ally",
			EffectRequirement = { "NotColor", "Ally", 1, 9999, "Green" }
		},
		Bio = "Uh Oh! You silly moron. You just got BEANED!!! Add this card to your deck to totally BEAN! your opponents!"
	},
	rhomlevko = {
		Id = 6565013690,
		Name = "rhomlevko",
		Health = 700,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 2, Neutral = 1 },
		EffectAnimation = "EatCheez",
		Effect = {
			Name = "IT'S BAAAAAAAAAAAAAAAAAAAAAAAAAAD!",
			Description = "When this card is cast: A target fighter gains 100 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 100 } },
			Target = "Single"
		},
		Bio = "Green is love. Green is life."
	},
	Ayzria = {
		Id = 5152661687,
		Name = "Ayzria",
		AltCards = {
			["Ayzria-E"] = {
				Id = 9058703203,
				Name = "King of Easter",
				AttackEffect = "Divinity",
				Bio = "He honestly just kinda walked in like this, said he was king, and we accepted it."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 4 },
		Addant = "Targeting Blip",
		CustomReminderMONEY = true,
		EffectVariable = 1,
		Effect = {
			Name = "Temporal Halo",
			Description = "Once each turn, whenever your opponent discards a card: Give yourself 2 Robux Stack cards.",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnEnemyDiscard = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Add", "Addant" },
						{ "Add", "Addant" },
						{
							"AlterEV",
							{ "Set", "Math", 0 }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "Hello!~ Welcome to my log cabin vlog in the middle of nowhere!"
	},
	WebGL3D = {
		Id = 5251382996,
		Name = "WebGL3D",
		AltCards = {
			["WebGL3D-C"] = { Name = "Putrid Present", Id = 15407460617, Bio = "" }
		},
		Health = 400,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "Thug life",
			Description = "When this card dies: Search your deck for a copy of it.",
			Type = "OnDeath",
			Power = { { "Tutorfor", "WebGL3D" } },
			Target = "Ally"
		},
		Bio = "Creator of the Roblox+Google Extention. He likes searching the web."
	},
	DerpDerpyness = {
		Id = 3299963629,
		Name = "DerpDerpyness",
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "LinkedSword",
		Color = "Green",
		Cost = { Green = 4 },
		EffectAnimation = "LinkedSwordFlagEffect",
		Effect = {
			Name = "Arms up!",
			Description = "When this card is cast: A target allied fighter gains 300 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 300 } },
			Target = "SingleAlly"
		},
		Bio = "Take my sword!"
	},
	Boogerguy123 = {
		Id = 6578852801,
		Name = "Boogerguy123",
		AltCards = {
			["Boogerguy123-C"] = {
				Id = 8139783996,
				Bio = "And so he turned himself into a pile of snow\nFunniest stuff I've ever seen"
			},
			FrenchFryMessiah = {
				Id = 88236664797975,
				Name = "FrenchFryMessiah",
				PremiumArt = 361,
				AltArt = true,
				Bio = "ur not you when ur hungry<br/><br/>here, have a french fry"
			}
		},
		Health = 300,
		Power = 100,
		Rarity = "Common",
		AttackEffect = "LinkedSword",
		Color = "Green",
		Cost = { Neutral = 1 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Amp",
			Description = "Once each turn, whenever you cast another fighter: A target fighter gains 100 health.",
			Type = "On|Other|AllySummon",
			Power = { { "Heal", 100 } },
			TurnTriggerLimit = 1,
			Target = "Single"
		},
		Bio = "We fight with real... swords."
	},
	EvilArtist = {
		Id = 4815667402,
		Name = "EvilArtist",
		AltCards = {
			Frostbitten = {
				Id = 104038240514967,
				Name = "Misplaced Misfortune",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 32,
				Bio = "ok rice i know you just lost your sketchbook so i popped my last cupcake to make sure you win this spring tenno sho i’m sure nothing will go wrong"
			}
		},
		Health = 500,
		Power = 250,
		Rarity = "Common",
		AttackEffect = "Punch",
		EffectAnimation = "LargeMagicGreenEffect",
		Color = "Green",
		Cost = { Neutral = 2, Green = 2 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast: A target fighter loses 200 power. Destroy that fighter if it has no power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{
					"CheckPower",
					{ 0, 1 }
				}
			},
			Target = "Single"
		},
		Bio = "My next creation? You, of course!"
	},
	GreenHearted = {
		Id = 4899343186,
		Name = "GreenHearted",
		AltCards = {
			["GreenHearted-C"] = {
				Name = "ColdHearted",
				Id = 15564058465,
				AttackEffect = "FirePunch",
				Bio = ""
			},
			["GreenHearted-ARR"] = {
				Id = 96197252260297,
				Name = "Emerald, Queen of Souls",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "They think they can just come into MY mine, take MY riches, and steal MY people?!"
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Venomshank",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Sudden Death",
			Description = "Whenever this card destroys another: Give yourself a rare card.",
			Type = "OnDestroy",
			Power = "RandomAdd",
			Target = "Ally",
			Increase = "Rare"
		},
		Bio = "Why does he have a green heart you may ask? Serious medical condition."
	},
	CLINTEN = {
		Id = 86511024440631,
		Name = "CLINTEN",
		AltCards = {
			["CLINTEN-Hal"] = {
				Name = "Triffid",
				AttackEffect = "Slash",
				Id = 7480398175,
				Bio = "\"And there's certainly intelligence there, of a kind. Have you noticed that when they attack they always go for the unprotected parts? Almost always the head—but sometimes the hands. And another thing: if you look at the statistics of casualties, just take notice of the proportion that has been stung across the eyes and blinded. It's remarkable—and significant.\""
			},
			["Jetpack Maniac"] = {
				Name = "Jetpack Maniac",
				AttackEffect = "LaserRed",
				Id = 9513523521,
				AltArt = true,
				Bio = "\"Who said Jetpacks are a great Invention for modern day Robloxians? They just come right at you not thinking about it twice!\""
			},
			RBurn = {
				Id = 73111106018707,
				Name = "R**Burn",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 543,
				Bio = "With one knife it might have been a challenge but I have two now. Fear me, as there is no upper limit for knives."
			}
		},
		Health = 700,
		Power = 0,
		Rarity = "Common",
		Charge = true,
		AttackEffect = "Knife",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "EqualBoard", "Opponent", 1, 9999, "Greater" },
		Effect = {
			Name = "Let It Grow",
			Description = "Cast this card ignoring its Colourless cost if there's 2 more enemy fighters than allied ones.\nWhenever this card attacks: Destroy it and the fighter it's attacking.",
			Type = "OnAttack",
			Power = {
				{ "Destroy", 30, "Aggressor" },
				{ "Destroy" }
			},
			Target = "Self"
		},
		Bio = "The gentle souls in Zanzel's wilderness never are."
	},
	spotco = {
		Id = 4720404514,
		Name = "spotco",
		AltCards = {
			["spotco-AN"] = {
				Id = 9381266329,
				Name = "Camo Joe",
				AttackEffect = "Knife",
				Bio = "Lurking in places you will never find him, which is your old shoe almost exclusively."
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 4, Green = 4 },
		AlternateCost = { IgnoreColor = "Neutral" },
		AlternateCostRequirement = { "Playertable", "Me", 2, 999999, "TargetCount" },
		Effect = {
			Name = "Blow Dart",
			Description = "If 2 or more effects have targeted this turn, cast this card ignoring its Colourless cost. \nWhen this card dies: You gain 1000 life.",
			Type = "OnDeath",
			Power = { { "Cost", -1000 } },
			Target = "Ally"
		},
		Bio = "24/7 Chill Lo-Fi Ro-Beats to Dance and FC to."
	},
	Liz = {
		Id = 6119846863,
		Name = "Liz",
		Health = 400,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "LaserBlue",
		Color = "Neutral",
		CantAICast = true,
		Cost = { Neutral = 3, Blue = 1 },
		Effect = {
			Description = "At the start of each player's turn: They can't cast tokens this turn.",
			Type = "OnStart",
			Power = { {
				"SetCastRestriction",
				{
					{ "Token" },
					"Liz stops you casting tokens."
				}
			} },
			Target = "CurrentTurn"
		},
		Bio = "An enforcer sent to neutralize escapees in a prison station, but she might just neutralize you for her daily quota."
	},
	EfanPlayz = {
		Id = 5193260614,
		Name = "EfanPlayz",
		AltCards = {
			EfanPlayzv2 = {
				Id = 7650356330,
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "What is his favorite color, you ask? Purple."
			},
			["Apiri and Baconaitor, Efan OTKers"] = {
				Id = 15804644555,
				Name = "Apiri and Baconaitor, Efan OTKers",
				AltArt = true,
				Bio = "hehe burn go brrr"
			}
		},
		Health = 800,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Neutral = 3, Green = 2 },
		Effect = {
			Name = "Twist",
			Description = "Three times each turn, Whenever an effect targets this card: Your opponent loses 350 life.",
			Type = "OnTarget",
			Power = { { "Inflict", 350 } },
			Target = "Opponent",
			TurnTriggerLimit = 3
		},
		Bio = "What does he play, you ask? You."
	},
	["Bloxy Announcer"] = {
		Id = 5942314589,
		Name = "Bloxy Announcer",
		AltCards = {
			["Bloxy Announcer-V"] = {
				Id = 16206875860,
				Name = "Charismatic Host",
				AttackEffect = "Punch",
				Bio = "Dropped out of acting school for this."
			},
			Gabrielcastros_ghost = {
				Name = "Gebbo07",
				AltArt = true,
				Id = 18404813741,
				AttackEffect = "Jab",
				Bio = "chat the winrate is currently 0.75 we're moving up in the world guys"
			}
		},
		Health = 1500,
		Power = 200,
		Rarity = "Uncommon",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 2, Green = 10 },
		StrengthenImmune = true,
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever you cast a fighter: A target fighter gains 300 power. Attach overload to it.",
			Type = "OnAllySummon",
			Power = {
				{ "Strengthen", 300 },
				{ "EquipGear", "Overloaded Mod" }
			},
			Target = "Single"
		},
		Bio = "PREEEEEEEEEEEEEESENTING!"
	},
	ThePestilentOne = {
		Id = 15706306646,
		Name = "iPxstilence",
		AltCards = {
			["ThePestilentOne-Hal"] = {
				Id = 7472045629,
				AttackEffect = "Slash",
				Bio = "The cure is worse than the disease. But hey, at least it works!"
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		CustomReminderMONEY = true,
		Effect = {
			Name = "Tombstone",
			Description = "When this card is cast: You gain 550 life. Give yourself 2 Robux Stacks.",
			Type = "OnSummon",
			Power = {
				{ "Cost", -550 },
				{ "Add", "Targeting Blip" },
				{ "Add", "Targeting Blip" }
			},
			Target = "Ally"
		},
		Bio = "Sold my soul to the Reaper, <br/> As I don't need it no more. <br/> Sold my soul to the Reaper, <br/> So that I can eventually go home."
	},
	V_yriss = {
		Id = 4789958147,
		Name = "V_yriss",
		AltCards = {
			["Faron the Stringed"] = {
				Id = 7556375580,
				Name = "Faron the Stringed",
				AttackEffect = "Scratch",
				Bio = "\"No strings attached, trust me.\" -Merchant."
			}
		},
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicGreenEffect",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Vyriss",
			Description = "Once, when there's as many allied fighters as enemy ones: A target fighter loses 300 power.",
			Type = "OnAnyTrigger",
			Power = { { "Weaken", 300 } },
			Target = "Single",
			EffectRequirement = { "EqualBoard", "Opponent", 0, 0, "Equal" },
			TotalTriggerLimit = 1
		},
		Bio = "Survive THIS!"
	},
	Luchador = {
		Id = 4790255241,
		Name = "Blotnik",
		Health = 400,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Bubbles",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Haydoscale",
			Description = "Whenever this card attacks: it gains 200 health.",
			Type = "OnAttack",
			Power = { { "Heal", 200 } },
			Target = "Self"
		},
		Bio = "Talented original clothing maker, Blotnik can patch up his own armor on the fly!"
	},
	BadBreadMaker = {
		Id = 7550901692,
		Name = "BadBreadMaker",
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 1, Green = 2 },
		Effect = {
			Name = "Render",
			Description = "Whenever an allied effect targets: This card gains 100 power, then the oldest card in your hand gains 100 power.",
			Type = "OnAllyTarget",
			Power = {
				{ "Strengthen", 100 },
				{ "StrengthenTargetInHand", 100, "AlliedLeftMostHand" }
			},
			Target = "Self"
		},
		Bio = "Even the worst bread is nutritious."
	},
	PhireFox = {
		Id = 7550918613,
		Name = "PhireFox",
		AltCards = {
			["PhireFox-E"] = {
				Id = 9050071444,
				Name = "Brix The Rabbit",
				AttackEffect = "Scratch",
				Bio = "Silly rabbit, Brix are for kids!"
			},
			Raykura = {
				Id = 78121701635214,
				Name = "Raykura",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 555,
				Bio = "This robot is so cute, espesically its stinger!"
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "Superball",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Amp",
			Description = "Once each turn, whenever an effect targets this card: You gain {G}{Y}.",
			Type = "OnTarget",
			Power = {
				{ "Green", 1 },
				{ "Yellow", 1 }
			},
			Target = "Ally",
			TurnTriggerLimit = 1
		},
		Bio = "Part time Roblox pundit. Part time Harambe slayer."
	},
	BonesMcCormick = {
		Id = 96070249618902,
		Name = "BonesMcCormick",
		AltCards = {
			["BonesMcCormick-C"] = {
				Id = 8224306692,
				Name = "Mari Lwyd",
				AttackEffect = "Scratch",
				Bio = "It haunts Llanfairpwllgwyngyllgogerychwyrndrobwyllllantysiliogogogoch. Only an offering from the wassail bowl may give it repose."
			}
		},
		Health = 600,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3 },
		EffectVariable = 1,
		Effect = {
			Name = "moo",
			Description = "Once each turn, whenever an effect targets this card: It gains 200 health and power.",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnTarget = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Heal", "200" },
						{ "Strengthen", "200" },
						{
							"AlterEV",
							{ "Set", "Math", 0 }
						}
					},
					Target = "Self"
				}
			}
		},
		Bio = "His gum is as strong as his bones!"
	},
	Roundawsome = {
		Id = 4922412776,
		Name = "roundawsome",
		AltCards = {
			["Roundawsome-AN"] = {
				Id = 9408918310,
				AttackEffect = "Slash",
				Bio = "\"Over the nine mountains, the eight seas and this earthly realm, gathering a thousand realms as \"The Minor Thousand Realms\", then gather a thousand of these realms and a thousand after, there is nothing that cannot be cut by me. Three-Sword Style Esoteric Technique! Billion-fold World Trichiliocosm!\""
			}
		},
		Health = 750,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		TargetImmune = true,
		Effect = {
			Name = "Life fam",
			Description = "When this card is cast: It deals 150 damage to all fighters.\nIf an effect would target this card: Return it to your hand instead.",
			Ability = {
				OnSummon = {
					Power = { { "Damage", 150 } },
					Target = "All"
				},
				OnTarget = {
					Power = { { "Return" } },
					Target = "Self"
				}
			}
		},
		Bio = "Cut to Ribbons. Slash and burn."
	},
	Round2 = {
		Id = 4922412776,
		Name = "roundawsome",
		CopyBodge = "Round2",
		Health = 750,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Life fam",
			Description = "When this card is first cast: Deal 150 damage to all fighters. Whenever an effect targets this card: Give yourself a copy of it. Destroy this card.",
			-- FIX: the cast damage in the description had no matching trigger (only OnTarget existed), so it never dealt damage
			Ability = {
				OnSummon = {
					Power = { { "Damage", 150 } },
					Target = "All"
				},
				OnTarget = {
					Power = {
						{ "Add", "Roundawsome" },
						{ "Destroy", 9999, "Self" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Slash and Burn!"
	},
	JJ5x5 = {
		Id = 10288709453,
		Name = "JJ5x5",
		AltCards = {
			["JJ5x5-E"] = {
				Id = 10288712465,
				CopyBodge = "JJ5x5-E",
				AttackEffect = "MagicGreen",
				Bio = "Just a fellow, playing with his pet rabbit and running from the weirdo... he is the hat of course."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever this card destroys another: It gains 150 health and power.",
			Type = "OnDestroy",
			Power = {
				{ "Heal", 150 },
				{ "Strengthen", 150 }
			},
			Target = "Self"
		},
		Bio = "Yo! I made Thrillville on ROBLOX and some other silly ROBLOX videos..."
	},
	Picopicoman = {
		Id = 5673443858,
		Name = "Picopicoman",
		AltCards = {
			["Druid Nacho"] = {
				Id = 7019732575,
				Name = "Druid Nacho",
				AttackEffect = "Maelstrom",
				AltArt = true,
				Bio = "My potions are too strong for you, traveler!"
			},
			SheMekaX = {
				Id = 8789666613,
				Name = "SheMekaX",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "If it breathes, I will adopt it!"
			},
			["Picopicoman-C"] = {
				Id = 11727986954,
				Name = "picklepickleman",
				AttackEffect = "Slash",
				Addant = "Targeting Blip-C",
				Bio = "Found it!"
			}
		},
		Health = 450,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Green",
		Addant = "Targeting Blip",
		Cost = { Neutral = 2, Green = 4 },
		CustomReminderMONEY = true,
		Effect = {
			Name = "Hyper Cannon",
			Description = "When this card is cast: Deal 200 damage to a target fighter. Give yourself a Robux Stack.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant", "Ally" },
				{ "Damage", 200, "Single" }
			},
			Target = "All"
		},
		Bio = "Dear hearts and gentle people...~~ Who live in my hometown!..~~"
	},
	Wizardguy34 = {
		Id = 10239995552,
		Name = "Wizardguy34",
		AltCards = {
			["Dundle, Keeper of the Doodlehole"] = {
				Id = 17107613302,
				Name = "Dundle, Keeper of the Doodlehole",
				PremiumArt = 249,
				AltArt = true,
				AttackEffect = "MagicBlue",
				Bio = "<b><font color=\"#33ffeb\">\"heya friendo!!! welcome to the dundle's poolzapallizium prankster gangster swagatron doodlehole™️! (or just the doodlehole for short), here we sell all kinda lil' trinkets, doodads, oddities, thingamajigs, thingamabobs, and whatchamacallits! ...just don't question where some items come from, unless you wanna join the plushie shelf. happy shoppin'!!!!! :D\"</font></b>"
			},
			["Wizardguy34-ARR"] = {
				Id = 81613148116126,
				Name = "Wavering Warlock",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Tending to the wounded or attacking our aggressors? I choose both."
			},
			Kusanali = {
				Id = 123380890523616,
				Name = "Kusanali",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 463,
				Bio = "What they say is true: You have to see the world for yourself to appreciate how beautiful it is."
			}
		},
		Health = 500,
		Power = 100,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Green = 2, Neutral = 1 },
		Effect = {
			Name = "Life fam",
			Description = "During your end step: All allied rare fighters gain 100 health. Deal 100 damage to all non-Rare fighters.",
			Type = "OnEnd",
			Power = {
				{ "Damage", 100, "NotRare" },
				{ "Heal", 100 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "Use the force, Harry! Else you shall not pass!"
	},
	CorgiParade = {
		Id = 6055779994,
		Name = "CorgiParade",
		AltCards = {
			Boombox = {
				Id = 13697391210,
				Name = "Boombox",
				AttackEffect = "Microphone",
				EffectAnimation = "SaxophoneBuff",
				AltArt = true,
				PremiumArt = 48,
				Commissioner = { 108983732, 41926915 },
				Bio = "<i>Let's lay down THE BEAT!!</i>"
			},
			["Gone Guru Flufflefunz"] = {
				Id = 113464433106214,
				Name = "Gone Guru Flufflefunz",
				SummonAnimation = "DeadRising",
				SummonAnimationEffect = true,
				AltArt = true,
				PremiumArt = 290,
				Bio = "WEEEEEEEEEEEEEEEEELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL..."
			},
			["CorgiParade-ARR"] = {
				Id = 130855192262580,
				Name = "Exubillent Enforcer",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "DEFEND, PROTECT, AND SERVE."
			},
			["dose gilbert, pilgrammedpilled"] = {
				Id = 109849994755535,
				Name = "dose gilbert, pilgrammedpilled",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 414,
				Bio = "From a roblox rpg game where you actually need to have sheer amounts of regen and defense buffs instead of parrying, dodging, blocking"
			}
		},
		Health = 250,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Neutral = 2, Green = 3 },
		Effect = {
			Name = "Thug life",
			Description = "When this card is cast: All allied rare fighters gain 100 Health and Power.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Heal", 100 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "What kind of parade is a corgi parade?"
	},
	Yoshilove574 = {
		Id = 10288663650,
		Name = "AIex_Dreemurr",
		CopyBodge = "Yoshilove574",
		Health = 250,
		Power = 250,
		Rarity = "Rare",
		AttackEffect = "Gravity",
		Color = "Green",
		Cost = { Green = 4, Neutral = 1 },
		EffectAnimation = "EatTurkey",
		Effect = {
			Name = "Alex_Dreemurr",
			Description = "When this card is cast: A target fighter gains 250 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 250 },
				{ "Strengthen", 250 }
			},
			Target = "Single"
		},
		Bio = "\"I may not be strong on my own, but me alongside my friends makes me unstoppable!\""
	},
	Tl_rd = {
		Id = 7282118338,
		Name = "ttarproject",
		AltCards = {
			["ttarproject-AN"] = { Id = 9391599959, Bio = "" },
			["ttarproject-ARR"] = {
				Name = "Royal Recruiter",
				Id = 133306190976120,
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "These little runts keep sneaking into our mines. Keep. Them. Out."
			},
			Gyro = {
				Id = 105609629484616,
				Name = "Gyro",
				AttackEffect = "Punch",
				Bio = "spawn in<br/>kill the weak<br/>opponent casts a counter<br/>leave",
				AltArt = true,
				PremiumArt = 395
			}
		},
		Health = 500,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "BEANAENAED",
			Description = "Whenever this card attacks: Give yourself a rare card.\nWhenever this card attacks and destroys another: Give yourself a rare card.",
			Ability = {
				OnAttackDestroy = {
					Power = { { "RandomAdd", "Rare" } },
					Target = "Ally"
				},
				OnAttack = {
					Power = { { "RandomAdd", "Rare" } },
					Target = "Ally"
				}
			}
		},
		Bio = "its funny tho"
	},
	HasTheHero = {
		Id = 99714994354281,
		Name = "Danika the Envious",
		AltCards = {
			["HasTheHero-ArtV2"] = {
				Id = 73358874617512,
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "They say I'm green with envy, I say those people shouldn't judge by skin tone."
			},
			["HasTheHero-ArtV"] = {
				Id = 122371149197494,
				AltArt = true,
				Name = "Danika, Elder Vitality Demon",
				AttackEffect = "Gun",
				Bio = "In one timeline of note, Danika's mere envy of Alex mutated into obsessive, spiteful entitlement. After taking the brick from him, she morphed and transformed Robloxia into a series of beautiful, incomprehensively complex fractals -- to make everyone finally appreciate her divine work."
			},
			["HasTheHero-Hal"] = {
				Id = 84175934386467,
				Name = "Danika the Terrified",
				AttackEffect = "Gun",
				Bio = "I MADE THIS GAME WAY TOO SCARY AAAAAAAAAAAAAA"
			}
		},
		Health = 800,
		Power = 600,
		Rarity = "Epic",
		AttackEffect = "Recyclables",
		Color = "Green",
		Cost = { Green = 4, Neutral = 3 },
		TargetImmune = true,
		Effect = {
			Name = "Knockdown",
			Description = "Whenever an effect targets this card: Remove {G} from this card's cost. Reset its stats and return it to its hand.",
			Type = "OnTarget",
			Power = {
				{
					"IncreaseCost",
					{ -1, "Green", "Nil" },
					"Self"
				},
				{ "GivePassive", "Charge" },
				{ "Reset" },
				{ "Return", 30 }
			},
			Target = "Self"
		},
		Bio = "An extremely talented builder and designer, cheated out of her rightful nomination in the Bloxy Awards by Alex's terrible low effort \"experiences\". Her disappointment is immeasurable, and her life is ruined."
	},
	brickmason = {
		Id = 10288491502,
		Name = "brickmason",
		AltCards = {
			["brickmason-Sun"] = {
				Id = 9208874830,
				AttackEffect = "Jab",
				Bio = "Dig holes and get paid!"
			}
		},
		Health = 500,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Neutral = 3, Green = 5 },
		Effect = {
			Name = "Yarr..",
			Description = "When this card is cast: All fighters loses 300 power and generate thrice.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 300 },
				{ "Generate", 3 }
			},
			Target = "All"
		},
		Bio = "Both ROBLOX's first friend, and a professional pirate."
	},
	StickMasterLuke = {
		Id = 10288626060,
		Name = "StickMasterLuke",
		AltCards = {
			StickMasterLukeV2 = {
				Id = 10288658809,
				Name = "MintMasterLuke",
				CopyBodge = "StickMasterLukeV2",
				Bio = "Colder than breath, deeper than sky."
			},
			["Vyn, Drifting Blade of Hongyuan"] = {
				Id = 70409129148486,
				Name = "Vyn, Drifting Blade of Hongyuan",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 588,
				Bio = "What else remains for me to cut down when I have already failed the one I was meant to protect?"
			}
		},
		Health = 1000,
		Power = 300,
		Rarity = "Epic",
		AttackEffect = "MagicGreen",
		EffectAnimation = "BloxyBuff",
		Color = "Green",
		Cost = { Green = 5, Neutral = 1 },
		Effect = {
			Name = "Disaster",
			Description = "After this fighter attacks: It gains 200 health, then deals 200 damage to a target fighter.",
			Type = "OnAttackEnd",
			Power = {
				{ "Heal", 200, "Self" },
				{ "Damage", 200, "Single" }
			},
			Target = "Single"
		},
		Bio = "Most likely accident prone worker at ROBLOX. He made it there from scripting, so can you!"
	},
	WaddleTom = {
		Id = 10288381990,
		Name = "WaddleTom",
		AltCards = {
			["WaddleTom-E"] = {
				Id = 9034080148,
				Name = "Good Knight",
				Bio = "Here, ye! Here, ye! May I presenteth, the Good Knight Egg! Given his title and rank by a strange lady, who threw a sword at him from yonder pond!"
			}
		},
		Health = 1000,
		Power = 250,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 5 },
		EffectAnimation = "DrinkBloxy",
		Effect = {
			Name = "Overgrowth",
			Description = "When this card is cast: A target fighter gains 500 health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "Single",
			Increase = 500
		},
		Bio = "Just a friendly ROBLOXian like many others. He sure won't attack you with his wooden sword, would he?"
	},
	AII_Duck = {
		Id = 10288476009,
		Name = "all_duck",
		AltCards = {
			["AII_Duck-E"] = {
				Id = 10288477721,
				AttackEffect = "Jab",
				Bio = "His favourite eggs to hunt are those hidden in plain sight."
			}
		},
		Health = 750,
		Power = 200,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Green",
		Cost = { Green = 3, Neutral = 4 },
		Effect = {
			Name = "All_Duck",
			Description = "During your end step: Your opponent loses {W}. You gain {W}.",
			Type = "OnEnd",
			Power = {
				{ "Neutral", 1 },
				{ "Neutral", -1, "Opponent" }
			},
			Target = "Ally"
		},
		Bio = "Hiding in plain sight has never been easier! Time to rob this vending machine."
	},
	Ripull = {
		Id = 9499170153,
		Name = "Friendly Salesdevil",
		AltCards = {
			RipullV2 = {
				Id = 9499172322,
				Name = "Drippin' Devils",
				AttackEffect = "FirePunch",
				Bio = "\"Drip or Drown in a vat of sulfuric acid!\""
			}
		},
		Health = 700,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4 },
		Effect = {
			Name = "Minigame Start!",
			Description = "Whenever an allied effect targets a fighter for the second time each turn: You gain 300 life and gain {W}{W}.",
			Type = "OnAllyTarget",
			Power = {
				{ "Cost", -300 },
				{ "Neutral", 2 }
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 2, 3, "TargetCount" }
		},
		Bio = "\"Come one, come all! Visit the greatest show of all time, featuring your favorite Roblox™️ Developers and Influencers!\""
	},
	Biostream = {
		Id = 10288388090,
		Name = "Biostream",
		AltCards = {
			CandyStream = {
				Id = 10288391123,
				AttackEffect = "Slash",
				CopyBodge = "CandyStream",
				Effect = {
					Name = "Please stop eating all that candy.",
					Power = {
						{ "Add", "Lollipop Hammer" },
						{ "Add", "Jawbreaker" },
						{ "Add", "Sticky Gum" }
					}
				},
				Bio = "With all that candy, he's certain to get bloated."
			}
		},
		Health = 1000,
		Power = 350,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		Color = "Green",
		Cost = { Neutral = 4, Green = 5 },
		CustomReminder = {
			["Attack Modifier! Debuff!"] = "A target fighter loses 300 power.",
			["Attack Modifier! Buff!"] = "A target fighter gains 300 power.",
			["Defence Modifier! Buff!"] = "A target fighter gains 300 health."
		},
		Effect = {
			Name = "Hexaria Booster Pack",
			Description = "When this card is cast: Give yourself 3 Hexaria actions. They each cost {G}{G}.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Defense Modifier! Buff!" },
				{ "Add", "Attack Modifier! Debuff!" },
				{ "Add", "Attack Modifier! Buff!" }
			},
			Target = "Ally"
		},
		Bio = "The scripter of Hexaria, one of the best games on ROBLOX!"
	},
	["Attack Modifier! Debuff!"] = {
		Id = 10288399688,
		Name = "Attack Modifier! Debuff!",
		AltCards = {
			["Sticky Gum"] = {
				Id = 10288396160,
				Name = "Gum Golem's Curse",
				Bio = "This certainly is turning into a bit of a gooey scenario."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 2 },
		EffectAnimation = "HexagonDebuff",
		Effect = {
			Name = "Attack Modifier! Debuff!",
			Description = "A target fighter loses 300 power.",
			Type = "OnSummon",
			Power = "Weaken",
			Target = "Single",
			Increase = 300
		},
		Bio = "A general utility card in Hexaria. Helps weaken some nasty Meta Card buff combos."
	},
	["Attack Modifier! Buff!"] = {
		Id = 10288397611,
		Name = "Attack Modifier! Buff!",
		AltCards = {
			["Lollipop Hammer"] = {
				Id = 10288393586,
				Name = "Lollipop King's Gift",
				Bio = "Not as spicy as a certain other lollipop, but eh, it'll do."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 2 },
		EffectAnimation = "HexagonBuff",
		Effect = {
			Name = "Attack Modifier! Buff!",
			Description = "A target fighter gains 300 power.",
			Type = "OnSummon",
			Power = "Strengthen",
			Target = "Single",
			Increase = 300
		},
		Bio = "Alongside this card, Precision is bae."
	},
	["Defense Modifier! Buff!"] = {
		Id = 10288398519,
		Name = "Defense Modifier! Buff!",
		AltCards = {
			Jawbreaker = {
				Id = 10288394899,
				Name = "Jaw Fairy's Blessing",
				Bio = "Hopefully this won't give you tooth decay."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "MagicYellow",
		Color = "Green",
		Cost = { Green = 2 },
		EffectAnimation = "HexagonBuff",
		Effect = {
			Name = "Defense Modifier! Buff!",
			Description = "A target fighter gains 300 health.",
			Type = "OnSummon",
			Power = "Heal",
			Target = "Single",
			Increase = 300
		},
		Bio = "Like attack debuff but you can use it on yourself. Take that, cavemen rocks!"
	},
	PolyHexV2 = {
		Id = 10288352712,
		Name = "PolyHex",
		CopyBodge = "PolyHexV2",
		AltCards = {
			PolyHex = {
				Id = 10288471856,
				AttackEffect = "ModernRocket",
				Bio = "The truest form of PolyHex, also known as TylerMcBride. They are quite fortunate that they are a 2-D character ready to drop explosives on unsuspecting survivors."
			},
			["Nastrond's Creation"] = {
				Id = 91010957498645,
				Name = "Nastrond's Creation",
				AttackEffect = "MagicGreen",
				Effect = {
					Name = "Explosive Spoils!",
					Description = "When this card is cast: Put a Colourless Stud and a Green Stud into your baseplate.",
					Type = "OnSummon",
					Power = {
						{
							"AddGenZone",
							{ "StudNastrond", 1 }
						},
						{
							"AddGenZone",
							{ "Green StudNastrond", 1 }
						}
					},
					Target = "Ally"
				},
				AltArt = true,
				PremiumArt = 406,
				Bio = "<b><font color=\"#4ffe41\">Forged in the depths of Nastrond, where the unworthy perish and the relentless rise, Nastrond’s Creation embodies the remnants of vanquished souls.</font></b>"
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Legendary",
		AttackEffect = "TimeBomb",
		Color = "Green",
		Cost = { Neutral = 5, Green = 5 },
		Effect = {
			Name = "Explosive Spoils!",
			Description = "When this card is cast: Put a Colourless Stud and a Green Stud into your baseplate.",
			Type = "OnSummon",
			Power = {
				{
					"AddGenZone",
					{ "Stud", 1 }
				},
				{
					"AddGenZone",
					{ "Green Stud", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "Creator of Super Bomb Survival, will you survive their wrath of missiles and bombs? Probably not."
	},
	Kago = {
		Id = 6537608436,
		Name = "kahgo",
		AltCards = {
			TheLostFright = {
				Name = "TheLostFright",
				AttackEffect = "Divinity",
				Id = 7386165360,
				AltArt = true,
				Bio = "OVAAAAAAAAAAAAHCLOCK-"
			},
			["kahgo-AN"] = {
				Name = "Kago",
				AttackEffect = "Slash",
				Id = 9352963154,
				Bio = "KAGOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
			},
			["Matt Berker"] = {
				Name = "Matt Berker",
				AttackEffect = "Katana",
				EffectAnimation = "NinjaBuff",
				AltArt = true,
				PremiumArt = 124,
				Commissioner = { 415344320, 41926915 },
				Id = 14959556904,
				Bio = "MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATTT"
			}
		},
		Health = 100,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 1 },
		Effect = {
			Name = "Amp",
			Description = "Whenever an effect targets this card: Give yourself a common card.",
			Type = "OnTarget",
			Power = { { "RandomAdd", "Common" } },
			Target = "Ally"
		},
		Bio = "KAhGOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0oOOOOOOOOOOOOOOO"
	},
	BrandonOccult = {
		Id = 5034526419,
		Name = "BrandonOccult",
		Health = 800,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 4 },
		CustomReminder = {
			["15 Minutes of Fame"] = "A fleeting card is destroyed if it's not cast by your next end step."
		},
		EffectVariable = 2,
		Effect = {
			Name = "befriending of scaly mutts",
			Description = "Twice each turn, whenever an allied fighter targets: Draw a fleeting card.",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 2 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnFighterAllyTarget = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{ "Draw", 1, "Ally" },
						{
							"AlterEV",
							{ "Add", "Math", -1, "Nil" }
						}
					},
					MetaData = { Fleeting = true },
					Target = "Self"
				}
			},
			EffectFleeting = true
		},
		Bio = "Come to the dark side. We have famous people."
	},
	["Mister Tea"] = {
		Id = 6431443302,
		Name = "Mister Tea",
		AltCards = {
			Tetrisraptor = {
				Id = 7236318013,
				AltArt = true,
				Name = "Tetrisraptor",
				AttackEffect = "Rifle",
				Bio = "An absolute history fanatic."
			},
			["Mister Tea-E"] = {
				Id = 8999514218,
				Name = "Sir Fancypants",
				AttackEffect = "Jab",
				Bio = "Sir Fancypants of Eggington at your service! Am I the only one who finds it ironic that Sir Fancypants isn't wearing any?"
			}
		},
		Health = 900,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		ReturnImmune = true,
		Cost = { Neutral = 2, Yellow = 3 },
		EffectVariable = 1,
		Effect = {
			Name = "Assimilate",
			Description = "Once each turn, whenever an allied effect targets: A target fighter gains 50 health and power.",
			Type = "OnAllyTarget",
			Target = "Single",
			Ability = {
				OnAnyEnd = {
					Power = { {
						"AlterEV",
						{ "Set", "Math", 1 }
					} },
					Target = "Self",
					NoBlip = true
				},
				OnAllyTarget = {
					Power = { { "EVGreaterValueCheck", 0, "Self" } },
					Target = "Self",
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{
							"Heal",
							50,
							"Single",
							nil,
							nil,
							nil,
							"DrinkMug"
						},
						{ "Strengthen", 50, "Single" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "He never runs late for a tea party."
	},
	Renaud800 = {
		Id = 10279346946,
		Name = "Renaud800",
		Health = 600,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "MagicRed",
		Color = "Yellow",
		Cost = { Neutral = 4 },
		CustomReminderMONEY = true,
		Effect = {
			Name = "Stud",
			Description = "When this card is cast or dies: Give yourself 2 Robux Stacks.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Add", "Targeting Blip" },
						{ "Add", "Targeting Blip" }
					},
					Target = "Ally"
				},
				OnDeath = {
					Power = {
						{ "Add", "Targeting Blip" },
						{ "Add", "Targeting Blip" }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Her fame on the court is so great that people spend millions just to recruit her!"
	},
	DracoSwordMaster = {
		Id = 10279233700,
		Name = "DracoSwordMaster",
		AltCards = {
			Icebeamed123 = {
				Id = 10279237097,
				AttackEffect = "Scratch",
				AltArt = true,
				Name = "Icebeamed123",
				Bio = "Prepare to face my deck."
			}
		},
		Health = 800,
		Power = 200,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Stud",
			Description = "Whenever a fighter dies: This card gains 100 power. Deal 50 damage to all fighters.",
			Type = "OnAnyDeath",
			Power = {
				{ "Strengthen", 100 },
				{ "Damage", 50, "All" }
			},
			Target = "Self"
		},
		Bio = "Another user implicated in the 2012 April Fools incident. Search his username to find out his fate."
	},
	["Bread Factory"] = {
		Id = 5949077458,
		Name = "Bread Factory",
		AltCards = {
			["Market Freeze"] = {
				Id = 9881124940,
				Name = "Market Freeze",
				Terrariant = "Market Freeze Terrain",
				Bio = "\"It's only a dip, it's only a dip... Give it a day and it'll recover... Diamond hands, man....\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Field = 300976005,
		Color = "Yellow",
		Cost = { Yellow = 2 },
		Terrain = true,
		Terrariant = "Bread Terrain",
		Effect = {
			Name = "Stud",
			Description = "At the start of each player's turn: Unlock all allied fighters.",
			Type = "OnStart",
			Power = "Unlock",
			Target = "Ally",
			Increase = 9999
		},
		Bio = "Bread Factory helps deal with Bread decks. How do you work that out?"
	},
	["Friend Request Spammer"] = {
		Id = 6030820899,
		Name = "Friend Request Spammer",
		AltCards = {
			["Spam-O-Tron"] = {
				Id = 9121744076,
				Name = "Spam-O-Tron",
				AttackEffect = "Microphone",
				AltArt = true,
				Bio = "\"HELLo HElLo hELLo\" \"waNna Be FRIends\" \"GiVE bloxBUx Pl0X\" \"MakE mE A luNA\" \"ratIo\" \"iCyTeA IS NOT a dEv\" \"sKIll issUe\"  \"aDD LsPlASh\" \"wHY caN'T sTAyblue ATTaCk\" \"WIKI is OUtdATEd\" \"IT's fuNNY THO\""
			},
			["Friend Request Spammer-Sun"] = {
				Id = 9145286144,
				Name = "Besties",
				AttackEffect = "Jab",
				Bio = "Sure, you can be annoying sometimes... But besties stick together."
			},
			["Oliver. S"] = {
				Id = 12070332867,
				Name = "Oliver. S",
				AttackEffect = "Slash",
				AltArt = true,
				Bio = "<i>We've been through this loop for as long as we can remember, time and time again, since that backwater street at '84.</i>"
			}
		},
		Health = 350,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE",
			Description = "When this card is cast: Your opponent draws 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Opponent"
		},
		Bio = "PLEASE PLEASE PLEASE PLEASE PLEASE BE MY FRIEND PLEASE PLEASE PLEASE I'LL DO ANYTHING PLEASE"
	},
	KasoduS = {
		Id = 10279316415,
		Name = "KasoduS",
		AltCards = {
			["KasoduS-Sun"] = {
				Id = 10279318193,
				AttackEffect = "Whirlpool",
				Bio = "I promise it's not acid."
			}
		},
		Health = 700,
		Power = 550,
		Rarity = "Common",
		AttackEffect = "Gun",
		Color = "Yellow",
		CustomReminderMoney = true,
		Effect = {
			Name = "Dancing Jail",
			Description = "When this card is cast: A target fighter gains 400 health. Give yourself 2 Robux Stacks.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 400 },
				{ "Add", "Targeting Blip", "Ally" },
				{ "Add", "Targeting Blip", "Ally" }
			},
			Target = "Single"
		},
		Cost = { Neutral = 5, Yellow = 2 },
		Bio = "Try some of my factory new Kasoda!"
	},
	TheCoderBunny = {
		Id = 10279373179,
		Name = "TheCoderBunny",
		AltCards = {
			["TheCoderBunny-E"] = {
				Id = 10279373877,
				AttackEffect = "Scratch",
				Transformant = "TCB-E token",
				Bio = "Has ChuChu met his match?"
			}
		},
		Health = 750,
		Power = 450,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 5 },
		Transformant = "Cringeleafff",
		TargetImmune = true,
		Effect = {
			Name = "Pyrotechnics",
			Description = "If an effect would target this card: All fighters gain 200 power instead, then this card transforms to lose all abilities.",
			Type = "OnTarget",
			Power = {
				{ "Strengthen", 200, "All" },
				{ "TransformWithRarity", "Transformant", "Self" }
			},
			Target = "Self"
		},
		Bio = "Bunnybros should stick together, right?"
	},
	Cringeleafff = {
		Id = 5673434188,
		Name = "TheCoderBunny",
		AltCards = {
			["TCB-E token"] = {
				Id = 8650634647,
				AttackEffect = "Scratch",
				Bio = "Has ChuChu met his match?"
			}
		},
		Health = 750,
		Power = 750,
		Rarity = "Token",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 5 },
		Effect = {
			Description = "",
			Type = "Nill",
			Power = { { "Cost", 700 } },
			Target = "Self"
		},
		Bio = "Bunnybros should stick together, right?"
	},
	Koopa = {
		Id = 17790582378,
		Name = "Koopa",
		AltCards = {
			gniRobSC = {
				Id = 6189820027,
				Name = "gniRobSC",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Mashup artist known for his eccentric works, and being a member of way too many backrooms."
			},
			["Waltzel, Physician"] = {
				Id = 75858824091935,
				Name = "Raise Dastaike",
				AltArt = true,
				PremiumArt = 176,
				Bio = "“Dont be a 🟦 and be a 🟡”"
			}
		},
		Health = 400,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Charge = true,
		Cost = { Neutral = 5, Yellow = 2 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2 } },
			Target = "Ally"
		},
		Bio = "One of ROBLOX's earliest players. Won some of the first contests, awarding him many coveted items such as the Domino Crown, Eerie Pumpkin Head, Black Iron Crown of Pwnage and The Kleos Aphthiton."
	},
	JParty = {
		Id = 6599291914,
		Name = "JParty",
		AltCards = {
			["Plushie Mummy-E"] = {
				Id = 8650636655,
				CopyBodge = "Plushies Mummy-E",
				AttackEffect = "Scratch",
				Bio = "Okay, this is DEFINITELY not a Bloxy. I'll keep it."
			}
		},
		Health = 200,
		Power = 300,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Target Master",
			Description = "When this card is cast: A target fighter gains 100 health, then generates for each time an allied effect has targeted this turn.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 100, "Single" },
				{
					"AlterEV",
					{ "Set", "Playertable", "TargetCount", "Nil" },
					"Self"
				},
				{ "Generate", "Variable" }
			},
			Target = "Single"
		},
		Bio = "Oh man. You guys are NOT going to believe who won the award for 'Best Bloxxies Host'."
	},
	mrflimflam = {
		Id = 10279328784,
		Name = "mrflimflam",
		AltCards = {
			["mrflimflam-Alt"] = {
				Id = 10279330368,
				Name = "mrflimflam",
				AttackEffect = "Jab",
				AltArt = true,
				CopyBodge = "mrflimflam-Alt",
				Bio = "Always shredding the wackiest waves."
			},
			["mrflimflam-AN"] = {
				Id = 9347947182,
				Name = "Alberts",
				AttackEffect = "Slash",
				Bio = "Lets not look at that page."
			},
			noob45312 = {
				Name = "noob45312",
				AttackEffect = "Rifle",
				Id = 6648631432,
				Bio = "\"Some people say I'm insane. I agree.\".",
				AltArt = true,
				PremiumArt = 37
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 5 },
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast: Deal 100 damage to all enemy fighters and they lose 100 power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 100 },
				{ "Damage", 100 }
			},
			Target = "Opponent"
		},
		Bio = "Still Chill."
	},
	poke631 = {
		Id = 18915000733,
		Name = "poke631",
		Health = 400,
		Power = 600,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2 },
		Effect = {
			Name = "GO! DOGE HOUND!",
			Description = "When this card is cast, if there's an enemy terrain: Destroy it. They draw a card.",
			Type = "OnSummon",
			Power = {
				{ "DestroyTerrain" },
				{ "Draw", 1 }
			},
			Target = "Opponent",
			EffectRequirement = { "HasAnyTerrain", "Him", 0, 0 }
		},
		Bio = "An exile from Brick Bronze. Can still tame a good pocket monster."
	},
	Lyv = {
		Id = 4720323035,
		Name = "Lyv",
		AltCards = {
			["Lyv-E"] = {
				Id = 8650635691,
				AttackEffect = "Jab",
				CopyBodge = "Lyv-E",
				Bio = "Do cats eat eggs? That’s a good question. I love good questions. Imagine, me and this egg, sitting alone on a beach, discussing the universe…"
			}
		},
		Power = 300,
		Health = 300,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		CustomReminderMONEY = true,
		Effect = {
			Name = "Revival",
			Description = "When this card is cast: Give yourself a Robux Stack.",
			Type = "OnSummon",
			Power = { { "Add", "Targeting Blip" } },
			Target = "Ally"
		},
		Bio = "Whatever she triggers should help you Lyv for just a little while longer."
	},
	Radello = {
		Id = 5673379629,
		Name = "Radello",
		Health = 500,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3 },
		CustomReminderMONEY = true,
		Effect = {
			Name = "Stagefright, OPPONENT!!!",
			Description = "Whenever an allied effect targets a fighter for the third time each turn: Give yourself a random Green card, a random Yellow card, and a Robux stack.",
			Type = "OnAllyTarget",
			Power = {
				{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Yellow" },
				{ "RandomAdd", "MultiColOnlyorGreenCostYellowCost Green" },
				{
					"RandomAdd",
					{ "Targeting Blip" }
				}
			},
			Target = "Ally",
			EffectRequirement = { "Playertable", "Me", 3, 4, "TargetCount" }
		},
		CustomReminder = {
			["Money Stack"] = "A {W} action that is inert in all zones. Tix Stacks give 50 power, and Robux Stacks give 50 health."
		},
		Bio = "It's pronounced as 'RA-DAY-YOH' my Spanish-speaking prodigies."
	},
	Builderman = {
		Id = 5673405446,
		Name = "Builderman",
		AltCards = {
			["Builderman-AN"] = {
				Id = 9362070150,
				AttackEffect = "Hammer",
				Bio = "He will always go bottom."
			}
		},
		Health = 200,
		Power = 400,
		Rarity = "Uncommon",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 2 },
		TargetImmune = true,
		Effect = {
			Name = "Friendship",
			Description = "Whenever an effect targets this card: All allied fighters gain 100 health. Return this card to your hand.",
			Type = "OnTarget",
			Power = {
				{ "Heal", 100 },
				{ "Return", 30, "Self" }
			},
			Target = "Ally"
		},
		Bio = "He is everyone's friend, unless you unfriend him, and that isn't nice."
	},
	Miked = {
		Id = 4204439814,
		Name = "miked",
		AltCards = {
			FreeThePolarBear = {
				Id = 18200035468,
				Name = "Free The Jabberwocky",
				AttackEffect = "Gun",
				Bio = "What fun is there in making sense?"
			},
			["Miked-AN"] = {
				Id = 18199520578,
				AttackEffect = "TimeBomb",
				Name = "Boom Boom",
				Bio = "HERE COMES THE BOOM BOOM!!!"
			}
		},
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
	badcc = {
		Id = 5673414652,
		Name = "badcc",
		AltCards = {
			["badcc-Sun"] = {
				Id = 9150939327,
				AttackEffect = "Jab",
				Bio = "Tax evasion? Why, that's crazy talk, I love paying taxes! Here's 50k, officer."
			},
			["Cluster XII"] = {
				Id = 12520756231,
				Name = "Cluster XII",
				AttackEffect = "Divinity",
				Commissioner = { 6983584 },
				AltArt = true,
				Bio = "\t\t\t\t\"You choose when I exist\n\t\t\t\t You write me and angels swirl\n\t\t\t\t Plucking heart feathered harps\n\t\t\t \t Fading forever\"\n\t\t\t\t\t"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Uncommon",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 3 },
		Effect = {
			Name = "Bleeding",
			Description = "Whenever your opponent casts a fighter: They draw 2 cards.",
			Type = "OnEnemySummon",
			Power = { { "Draw", 2 } },
			Target = "Opponent"
		},
		Bio = "badimo."
	},
	["Cluck Buck"] = {
		Id = 5848954566,
		Name = "DevRolve",
		AltCards = {
			["Cluck Buck-E"] = {
				Id = 8765170126,
				AttackEffect = "Bat",
				Name = "Cluck Buck",
				Bio = "Bawk."
			},
			["Cluck Buck-ARR"] = {
				Id = 84369575702443,
				AttackEffect = "Bat",
				Name = "Reveling Rascals",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "If they don't like us playing with their gems, then why do they make such cool noises when they hit the ground?"
			}
		},
		Health = 150,
		Power = 150,
		Rarity = "Rare",
		AttackEffect = "Gun",
		Color = "Yellow",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Yarrge",
			Description = "When this card is cast: Summon an inert copy of it with this card's current stats.",
			Type = "OnSummon",
			Power = { { "SummonCopy" } },
			EffectSummonCopyPreserveStats = true,
			MetaData = { TokenOmni = true },
			Target = "Self"
		},
		Bio = "CEO of ROLVe. Source Engine, move over."
	},
	Maplestick = {
		Id = 4538080625,
		Name = "Maplestick",
		Health = 1000,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 3, Yellow = 4 },
		Effect = {
			Name = "Amp",
			Description = "Once each turn, whenever an effect targets this card: Each allied fighter with the lowest power gains 250 power.",
			Type = "OnTarget",
			Power = { { "Strengthen", 250 } },
			Target = "AlliedLowestPower",
			TurnTriggerLimit = 1
		},
		Bio = "HEY MAPLESTICK IS THAT A.... *faints from the stabs*"
	},
	["Iron Cafe"] = {
		Id = 10186695003,
		Name = "Iron Café",
		AltCards = {
			["Iron Cafe-Sun"] = {
				Id = 9238698716,
				Name = "Tropical Mall",
				Terrariant = "Mall Terrain",
				Bio = "Hang with friends! Spend all your money! Cry about it!"
			},
			["Café Theobroma"] = {
				Id = 9709347698,
				AltArt = true,
				Name = "Café Theobroma",
				Terrariant = "Theobroma Terrain",
				Addant = "Theobroma Special",
				Bio = "Time to make drinks and change lives."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Field = 4993617972,
		Color = "Neutral",
		Terrain = true,
		Terrariant = "Xor's Terrain",
		Cost = { Yellow = 2 },
		CustomReminderMONEY = true,
		Addant = "Targeting Blip",
		Effect = {
			Name = "Stud",
			Description = "During each players' end step: Give that player a Robux Stack.",
			Type = "OnAnyEnd",
			Power = { { "Add", "Addant" } },
			Target = "CurrentTurn"
		},
		Bio = "Crack open a cold Bloxy Cola with the boys."
	},
	Dun_Goof = {
		Id = 6155846276,
		Name = "Dun_Goof",
		AltCards = {
			["Dun_Goof-AN"] = {
				Id = 9391618119,
				Name = "Cyclist",
				AttackEffect = "Slash",
				Bio = "Living life on the speedway on my way."
			},
			Antithesis = {
				Id = 9791895593,
				Name = "Antithesis",
				AttackEffect = "LaserYellow",
				Bio = "Born from the juxtaposition of developers wanting to make good games and wanting good money, it wreaks havoc upon the world by turning things into iron sand, only to reabsorb them to fuel its power."
			},
			["Dun_Goof-ARR"] = {
				Id = 113324333769950,
				Name = "Dynamic Demonlishoner",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Who cares about their defenses? Pfft, just blow 'em up and get to the shinies!"
			}
		},
		Health = 250,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 1 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast, if there's another allied rare fighter: All allied rare fighters gain 100 power. Unlock this card.",
			Type = "OnSummon",
			Power = {
				{ "Strengthen", 100 },
				{ "Unlock", 9999, "Self" }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			},
			EffectRequirement = { "Rarity", "Ally", 2, 9999, "Rare" }
		},
		Bio = "Name your favourite card arts. Some of them were made by this guy!"
	},
	Blitzwolfer = {
		Id = 4974017922,
		Name = "Blitzwolfer",
		AltCards = {
			Noobwolfer = {
				Id = 3482098980,
				CopyBodge = "Noobwolfer",
				AttackEffect = "Slash",
				Bio = "I'm sorry, but there's no swearing allowed on my christian Blox Cards server. I'm gonna have to ask you to leave."
			},
			["Blitzwolfer-ArtV"] = {
				Id = 5690736579,
				AltArt = true,
				CopyBodge = "Blitzwolfer-ArtV",
				AttackEffect = "Slash",
				Bio = "I'm as strong as an ant. If an ant was THIS big!"
			},
			["Blitzwolfer-ARR"] = {
				Id = 118854867198259,
				Name = "Hermes, King of Thieves",
				AttackEffect = "Slash",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Excellent job so far gang, but if we wanna make it out of this, we gotta dig deeper."
			}
		},
		Health = 500,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		Effect = {
			Name = "Helping Out",
			Description = "During your end step: All allied rare fighters gain 100 health.",
			Type = "OnEnd",
			Power = { { "Heal", 100 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "A BLOX CARDS contributor. A BLOX CARDS artist. A BLOX CARDS Wikia owner. A BLOX CARDS Hero."
	},
	Helperbot = {
		Id = 5019701505,
		Name = "Helperbot",
		Health = 600,
		Power = 300,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 1 },
		Effect = {
			Name = "Helping Out",
			Description = "During your end step: All allied rare fighters gain 100 power.",
			Type = "OnEnd",
			Power = { { "Strengthen", 100 } },
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Rare" }
				}
			}
		},
		Bio = "Hello there robloxian, what do you need help with?"
	},
	Uberubert = {
		Id = 4564769786,
		Name = "Uberubert",
		AltCards = {
			["Uberubert-ARR"] = { Id = 122786958577319, Name = "Cheery Cart-Chap", Bio = "Yippee!" }
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Yellow",
		Cost = { Yellow = 2, Green = 2 },
		Effect = {
			Name = "Stud",
			Description = "Whenever this card attacks and destroys another: All players draw 3 cards. You can't cast anything else this turn.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Draw", 3 },
				{
					"SetCastRestriction",
					{
						{ "NOTHING" },
						"You can't cast anything else this turn."
					},
					"Ally"
				}
			},
			Target = "All"
		},
		Bio = "Inventor of the Tycoon Genre on ROBLOX."
	},
	["Alpha Brick's Discovery"] = {
		Id = 6234671257,
		Name = "Alpha Brick's Discovery",
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Archetype = "Era",
		Cost = { Neutral = 2 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Each fighter's rarity becomes token.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "ReplaceRarity", "Token" },
				{ "Draw", 1, "Ally" }
			},
			Target = "All"
		},
		Bio = "The awakened Primordials stared at Alex with disgust. They had to keep the ancient brick safe in this modern world."
	},
	Zaquille = {
		Id = 5024477772,
		Name = "Zaquille",
		AltCards = {
			["Zaquille-E"] = {
				Id = 8715864933,
				AttackEffect = "Scratch",
				Bio = "Bunnies are made to be pet."
			}
		},
		Health = 900,
		Power = 550,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 3, Neutral = 5 },
		Effect = {
			Name = "He can't fix it after all",
			Description = "When this card is cast, if there are 2 or more enemy fighters: Your opponent draws 2 cards and loses all {W}.",
			Type = "OnSummon",
			Power = {
				{ "SetNeutral", 0, "Opponent" },
				{ "Draw", 2 }
			},
			Target = "Opponent",
			EffectRequirement = { "Board", "Opponent", 2, 9999 }
		},
		Bio = "Laws and bones are made to be broken."
	},
	XiaoXiaoMan = {
		Id = 12367575660,
		Name = "EarlGrey",
		AltCards = {
			["XiaoXiaoMan-C"] = { Id = 12367576281, Bio = "What is this, a Tea Tower?" }
		},
		Health = 650,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Illumina",
		Color = "Yellow",
		Cost = { Neutral = 2, Yellow = 4 },
		Effect = {
			Name = "Hellfire",
			Description = "Whenever you cast an epic fighter: All allied epic and legendary fighters gain 150 power.",
			Type = "OnAllySummon",
			Power = {
				{ "Strengthen", 150 },
				{ "Strengthen", 150, "AlliedLegendary" }
			},
			Target = "AlliedEpic",
			Rarity = "Epic"
		},
		Bio = "Some ROBLOXians feel more comfortable traversing the world under more anonymous ways. As do gods."
	},
	MinePix110 = {
		Id = 5019918403,
		Name = "MinePix110",
		AltCards = {
			["Fluffle & Venon"] = {
				Name = "Fluffle & Venon",
				Id = 73259330239545,
				AttackEffect = "Gun",
				AltArt = true,
				PremiumArt = 89,
				Addant = "Commissioner's Call",
				Commissioner = { 14640960 },
				Bio = "Subdue the regret. Dust yourself off, proceed. You'll get it in the next life, where you don't make mistakes. Do what you can with this one, while you're alive."
			},
			["MinePix110-H25"] = {
				Id = 83845859799704,
				Name = "MinePix110",
				PackDisplayOverride = "Halloween Art Collection Bundle",
				AttackEffect = "Jab",
				Bio = "Cave1.ogg"
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 3 },
		Addant = "Targeting Blip",
		CustomReminderMONEY = true,
		Effect = {
			Name = "Silence I keel you!",
			Description = "Whenever this card attacks and destroys another: Draw a card. Give yourself a Robux Stack.",
			Type = "OnAttackDestroy",
			Power = {
				{ "Draw", 1 },
				{ "Add", "Targeting Blip" }
			},
			Target = "Ally"
		},
		Bio = "Mining for more cards."
	},
	NewFissy = {
		Id = 8923574261,
		Name = "NewFissy",
		AltCards = {
			["NewFissy-E"] = {
				Id = 8923576100,
				AttackEffect = "Scratch",
				Bio = "Roblox servers shudder when a new Adopt Me pet drops."
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 5 },
		EffectAnimation = "EatCake",
		Effect = {
			Name = "Un-Animate",
			Description = "When this card is cast: A target fighter gains 1000 health. Set its power to 0.",
			Type = "OnSummon",
			Power = {
				{ "SetPower", 0 },
				{ "Heal", 1000 }
			},
			Target = "Single"
		},
		Bio = "Hi, I'm the scripter of Roblox Plague, TreeLands, and Adopt M-HEY! Stop it, that tickles!"
	},
	BrightEyes = {
		Id = 6533886863,
		Name = "BrightEyes",
		AltCards = {
			["BrightEyes-ArtV"] = {
				Id = 7138922528,
				AttackEffect = "MagicYellow",
				AltArt = true,
				Bio = "Shedletsky would be elated. Part of the 'Aife' Collection! Collect them all!"
			},
			["BrightEyes-AN"] = {
				Id = 9345607242,
				AttackEffect = "LinkedSword",
				Name = "John",
				Bio = "Blame Shed."
			},
			Jenny = {
				Id = 10943003151,
				AttackEffect = "Jab",
				Name = "Jenny",
				AltArt = true,
				Bio = "<i>♫\"It's not much of a life you're living\n\t\t\t\t\t\t\tIt's not just something you take, it's given\"♫,</i>"
			}
		},
		Health = 800,
		Power = 250,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Neutral = 4, Yellow = 4 },
		CustomReminder = {
			["IT'S FREE"] = "A terrified fighter is obliterated during its end step."
		},
		Effect = {
			Name = "Sudden Death",
			Description = "When this card is cast: Summon a copy of all allied epic and legendary fighters, except they're terrified. Unlock all allied epic and legendary fighters.",
			Type = "OnSummon",
			Power = {
				{ "SummonCopy" },
				{ "Unlock", 999 }
			},
			Target = "CustomTarget",
			TargetParameters = {
				Zones = { "Ally_Field" },
				Condition = "Rarities",
				Modifier = {
					Rarities = { "Epic", "Legendary" }
				}
			},
			MetaData = { Terrified = true }
		},
		Bio = "Shedletsky would be proud."
	},
	BLOXER787 = {
		Id = 4934300137,
		Name = "BLOXER787",
		AltCards = {
			["Crowned Guest"] = {
				Id = 14039155426,
				Name = "Crowned Guest",
				AltArt = true,
				PremiumArt = 53,
				AttackEffect = "Hammer",
				Bio = "No one knows where this Guest originated from nor how they seized the royal throne. What matters is that fighters from all over Robloxia and beyond go to them to receive their lifelong blessing."
			},
			["BLOXER787-AN"] = {
				Id = 18771311874,
				AttackEffect = "Slash",
				Name = "Silly Guitar",
				Bio = "Plays a nice silly tune for you - or crashes the server you're in!"
			}
		},
		Health = 1050,
		Power = 350,
		Rarity = "Legendary",
		AttackEffect = "Punch",
		Color = "Yellow",
		Cost = { Yellow = 2, Neutral = 5 },
		Effect = {
			Name = "EzWinz",
			Description = "Whenever this card attacks: Give yourself a Yellow legendary card.",
			Type = "OnAttack",
			Power = "RandomAdd",
			Target = "Ally",
			Increase = "MonoOnlyorYellowCost Legendary Yellow"
		},
		Bio = "You're way out of his league."
	},
	Merely = {
		Id = 10101110535,
		Name = "Merely",
		AltCards = {
			["Merely-Sun"] = {
				Id = 9208885309,
				Name = "Pirates Of The Carribloxians",
				Bio = "The fiercest pirate crew in all the seas. Don't ask the captain what Pirate Juice is."
			}
		},
		Health = 1200,
		Power = 400,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 8 },
		Effect = {
			Name = "Thug life",
			Description = "Whenever an effect targets this card: Give yourself a Yellow legendary card.",
			Type = "OnTarget",
			Power = { { "RandomAdd", "MonoOnlyorYellowCost Legendary Yellow" } },
			Target = "Ally"
		},
		Bio = "Creator of Trade Hangout. May the biggest shark win!"
	},
	ROBLOX = {
		Id = 9709425399,
		Name = "ROBLOX",
		AltCards = {
			["ROBLOX-C"] = {
				Id = 1247642009,
				Bio = "Giving the gift of Yellow cards since 1980.",
				AltArt = true
			},
			["IcyTea, Homesteader"] = {
				Id = 13573847341,
				Name = "IcyTea, Homesteader",
				ArtAnimation = "IcyTeaHomesteader",
				Commissioner = { 90658630, 8289996, 320659945 },
				EffectAnimation = "SelfIce",
				AttackEffect = "Blizzard",
				SummonAnimation = "FrostySummon",
				Bio = "\"Despite everything: IcyTea is IcyTea\""
			},
			["Jean, Motivated Hero"] = {
				Id = 15941933049,
				Name = "Jean, Motivated Hero",
				AttackEffect = "Katana",
				SummonAnimation = "BlackmooreSummon",
				AltArt = true,
				Bio = "Bury the light!"
			},
			["ROBLOX-AWIH"] = {
				Id = 17600800848,
				Name = "Delightful Diva Devil",
				AttackEffect = "MagicYellow",
				Bio = "She's a Star! (Not the Archetype)",
				PackDisplayOverride = "A Walk in Hell Alt-Art Bundle"
			}
		},
		Health = 500,
		Power = 100,
		Token = true,
		Rarity = "Legendary",
		AttackEffect = "ClassicRocket",
		Color = "Yellow",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "ROBLOX(Card)",
			Description = "During your end step: Give yourself a Yellow card.",
			Type = "OnEnd",
			Power = { { "RandomAdd", "MonoOnlyorYellowCost Yellow" } },
			Target = "Ally"
		},
		Bio = "ROBLOX, with bold plans on helping its company grow even more since 2004."
	},
	Jeeeeesus = {
		Id = 4899361887,
		Name = "Jeeeeesus",
		AltCards = {
			["Jeeeeesus-E"] = {
				Id = 8650641434,
				CopyBodge = "Jeeeeesus-E",
				Bio = "I tried to teach them peace… and I will teach them again… BY FORCE!"
			},
			["Fire-Raiser Jojobinks"] = {
				Id = 11194345464,
				Name = "Fire-Raiser Jojobinks",
				AttackEffect = "Firebrand",
				AltArt = true,
				Bio = "\"That's the spirit. Never forget: the whole world's a house of cards, and you're a goddamn flamethrower\""
			}
		},
		Health = 222,
		Power = 2222,
		Rarity = "Legendary",
		AttackEffect = "Minigun",
		Color = "Yellow",
		Cost = { Yellow = 5 },
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: Your opponent draws 5 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 5 } },
			Target = "Opponent"
		},
		Bio = "Christ!"
	},
	Minish = {
		Id = 6445849801,
		Name = "Minish",
		AltCards = {
			Moonbell = {
				Id = 10570700251,
				AltArt = true,
				Name = "Moonbell",
				AttackEffect = "Jab",
				Bio = "\"Talk about near-death experience.\""
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 4, Neutral = 4 },
		Effect = {
			Name = "Stud",
			Description = "Whenever this card attacks: Set its stats to 750/750.",
			Type = "OnAttack",
			Power = {
				{ "SetPower", 750 },
				{ "SetHealth", 750 }
			},
			Target = "Self"
		},
		Bio = "Doregriffons don't understand humans. If they didn't want to be eaten, why are they made out of meat and treasure?"
	},
	wowwow2211 = {
		Id = 5031876827,
		Name = "wowwow2211",
		AltCards = {
			["Colesans, Rainbow Guardian of Icon"] = {
				Id = 10184336415,
				Name = "Colesans, Rainbow Guardian of Icon",
				AttackEffect = "StudBlast",
				AltArt = true,
				Bio = "Before the Stud, there was the Icon. No matter what shape they take, a true warrior always knows how to control their might."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Neutral",
		Cost = { Yellow = 1, Blue = 1, Green = 1, Red = 1, Neutral = 3 },
		Effect = {
			Name = "Police Brutality",
			Description = "Whenever an effect targets this card: You gain {R}{G}{B}{Y}.",
			Type = "OnTarget",
			Power = {
				{ "Blue", 1 },
				{ "Green", 1 },
				{ "Yellow", 1 },
				{ "Red", 1 }
			},
			Target = "Ally"
		},
		Bio = "WOW!"
	},
	Usering = {
		Id = 4899466464,
		Name = "Usering",
		AltCards = {
			["Usering-Sun"] = {
				Id = 9208876572,
				Name = "Muffy, Fifth Form",
				AttackEffect = "FirePunch",
				Effect = {
					Description = "When this card is cast: Give yourself a Helping Hand. It can be used 8 times."
				},
				Addant = "Super Blip1-Sun",
				Bio = "I feel like anything's possible now... I can keep fighting a bit longer. My heartbeat sounds funny!!"
			}
		},
		Health = 1250,
		Power = 750,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 12 },
		Charge = true,
		Addant = "Super Blip1",
		Effect = {
			Name = "Revival",
			Description = "When this card is cast: All allied fighters generate twice. Give yourself a Robux Bundle.",
			Type = "OnSummon",
			Power = {
				{ "Add", "Addant" },
				{ "Generate", 2 }
			},
			Target = "Ally"
		},
		CustomReminder = {
			["Robux Bundle"] = "A {W} action that is inert in all zones. It gives a target fighter 50 health, and can be used eight times."
		},
		Bio = "Even Pokemon can make good games."
	},
	["Bloxikin Horde"] = {
		Id = 10184236371,
		Name = "Bloxikin Horde",
		AltCards = {
			["Killercade16, Herald of Heroes"] = {
				Id = 17540223816,
				Name = "Killercade16, Herald of Heroes",
				AltArt = true,
				PremiumArt = 264,
				Bio = "Simple concept, complex execution, and endless possibilites. Live, Laugh, Heroes."
			},
			["Bloxkin Horde-Sun-Offer"] = {
				Id = 17717382123,
				Name = "The Sun",
				AttackEffect = "MagicYellow",
				Bio = ">:("
			},
			["Bloxikin Horde-ARR"] = {
				Id = 136366451266495,
				AttackEffect = "MagicGreen",
				Name = "Proficient Profiteer",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "I wonder when these dummies are gonna realize how they keep restocking their armies?"
			}
		},
		Health = 200,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Horde-Caller",
			Description = "When this card is cast: All allied rare fighters gain 100 health and power. If there's 6 or more rare cards in your baseplate and/or graveyard, deal 100 damage to all enemy fighters and they lose 100 power.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 100, "AlliedRare" },
						{ "Strengthen", 100, "AlliedRare" },
						{
							"AlterEV",
							{ "Set", "GraveZone_Ally", "Rarity", "Rare" }
						},
						{
							"AlterEV",
							{ "Add", "GenZone_Ally", "Rarity", "Rare" }
						},
						{ "EVGreaterValueCheck", 5 }
					},
					Target = "Self"
				},
				OnEVCheckPass = {
					Power = {
						{ "Weaken", 100 },
						{ "Damage", 100 }
					},
					Target = "Opponent",
					NoBlip = true
				}
			}
		},
		Bio = "FOR THE HORDE!!"
	},
	DrPepperSlayer = {
		Id = 6073521300,
		Name = "LordJurrd",
		AltCards = {
			["DrPepperSlayer-AN"] = {
				Id = 99075950846891,
				Name = "DrPepperSlayer",
				Bio = "Yeah, yeah, shameless advertising is shameless. I'll give you a hug if you shut up about it."
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "BloxyBuff",
		Color = "Neutral",
		Cost = { Neutral = 4, Red = 1 },
		Effect = {
			Name = "AAAAAAAAAAAAAAAAAA",
			Description = "When this card is cast, if there's 3 or more allied rare fighters: It gains 500 health and power.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "Strengthen", 500 }
			},
			Target = "Self",
			EffectRequirement = { "Rarity", "Ally", 3, 9999, "Rare" }
		},
		Bio = "Yeah, yeah, shameless advertising is shameless. I'll give you a hug if you shut up about it."
	},
	Haggie125 = {
		Id = 4984402210,
		Name = "Haggie125",
		AltCards = {
			["Haggie125-ARR"] = {
				Id = 100870881761639,
				Name = "Monetary Mecha",
				AttackEffect = "Blaze",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "One man's treasure is another man's juggernaut."
			}
		},
		Health = 600,
		Power = 600,
		Requirement = { "Rarity", "Ally", 2, 9999, "Rare" },
		Rarity = "Rare",
		AttackEffect = "Superball",
		Color = "Neutral",
		Cost = { Neutral = 4, Yellow = 1 },
		Effect = {
			Name = "Harassing Talons",
			Description = "Cast only if there's 2 or more allied rare fighters.\nWhen this card dies: Draw 2 cards.",
			Type = "OnDeath",
			Power = { { "Draw", 2 } },
			Target = "Ally"
		},
		Bio = "Give me money...NOW!"
	},
	Tomarty = {
		Id = 5832433614,
		Name = "Tomarty",
		AltCards = {
			["Tomarty-ARR"] = {
				Id = 123880022173099,
				Name = "Glittering Goliath",
				Effect = {
					Name = " Plushie Amp",
					Description = "Cast only if there's 2 or more allied rare fighters.\nWhen this card is cast: Summon a copy of this card from your baseplate, then put a copy of this card into your baseplate.",
					Type = "OnSummon",
					Power = {
						{ "SummonGenZone", "Tomarty-ARR" },
						{
							"AddGenZone",
							{ "Tomarty-ARR", 1 }
						}
					},
					Target = "Ally"
				},
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "They think they can just keep pushing us back? Well, they should know the strongest gems are made under pressure."
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Rare",
		AttackEffect = "MagicGreen",
		Color = "Neutral",
		Requirement = { "Rarity", "Ally", 2, 9999, "Rare" },
		Cost = { Neutral = 4, Green = 1 },
		Effect = {
			Name = " Plushie Amp",
			Description = "Cast only if there's 2 or more allied rare fighters.\nWhen this card is cast: Summon a copy of this card from your baseplate, then put a copy of this card into your baseplate.",
			Type = "OnSummon",
			Power = {
				{ "SummonGenZone", "Tomarty" },
				{
					"AddGenZone",
					{ "Tomarty", 1 }
				}
			},
			Target = "Ally"
		},
		Bio = "\"It’s a mistake to say turtles hide in their shells. They merely need time to contemplate how best to bite your head off.\""
	},
	Wsly = {
		Id = 5832439577,
		Name = "Wsly",
		AltCards = {
			["Wsly-AN"] = {
				Id = 10318275216,
				Name = "Northern Hero Marissa",
				AttackEffect = "Ice",
				EffectAnimation = "MidBlizzardEffect",
				Bio = "Frost incantations fill her mind, the biting cold a reminder of the past."
			},
			Aspen = {
				Id = 100671749424089,
				Name = "Aspen",
				Commissioner = { "Waltzel", "Remvolt" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 718,
				Bio = "If they catch you, they will kill you.<br/>But first, they must catch you."
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		EffectAnimation = "MidMagicBlueEffect",
		Color = "Neutral",
		Cost = { Neutral = 4, Blue = 1 },
		Effect = {
			Name = " Plushie Amp",
			Description = "Whenever you cast a rare fighter, if there's 3 or more allied rare fighters: That fighter and this card gain 100 health. A target fighter loses 100 power.",
			Type = "OnAllySummon",
			Power = {
				{ "Heal", 100, "Self" },
				{ "Heal", 100, "Aggressor" },
				{ "Weaken", 100, "Single" }
			},
			Target = "Self",
			EffectRequirement = { "Rarity", "Ally", 3, 9999, "Rare" },
			Rarity = "Rare"
		},
		Bio = "Running from the death."
	},
	Nexx = {
		Id = 4789688861,
		Name = "Nexx",
		AltCards = {
			["Vibe Connoisseur Latchula"] = {
				Id = 6189818077,
				Name = "Vibe Connoisseur Latchula",
				AttackEffect = "Jab",
				AltArt = true,
				Bio = "Tell me, boy, now wouldn't that be sweet?"
			}
		},
		Health = 700,
		Power = 700,
		Rarity = "Epic",
		AttackEffect = "MagicYellow",
		Color = "Neutral",
		Cost = { Neutral = 7, Yellow = 1 },
		Effect = {
			Name = "Competition",
			Description = "When this card is cast: Draw 2 cards.",
			Type = "OnSummon",
			Power = { { "Draw", 2, "Ally" } },
			Target = "Opponent"
		},
		Bio = "A web contractor and a card developer too!"
	},
	radiogamer = {
		Id = 9926100053,
		Name = "radiogamer",
		AltCards = {
			["Raymoo Kurei"] = {
				Id = 9926063786,
				Name = "Raymoo Kurei",
				AttackEffect = "Gravity",
				AltArt = true,
				Bio = "The Shrine Maiden of Paradise has joined the Spellcard battle!"
			},
			["freethe...?"] = {
				Id = 15706307256,
				Name = "freethe...?",
				AltArt = true,
				PremiumArt = 172,
				Bio = "\"huh, did someone say something\""
			},
			["radiogamer-V-Offer"] = {
				Id = 16319185590,
				Name = "Valentine Vocaloid",
				ArtAnimation = "Vocaloid",
				Bio = "please have a good day. If your day is not good yet, meybe it will be good later, or maybe your tomorrow will be a good day. Thank you"
			}
		},
		Health = 800,
		Power = 400,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 5, Red = 1 },
		EffectAnimation = "DestroyEnemyHandSingle",
		Effect = {
			Name = "Explosm",
			Description = "When this card is cast: Destroy the oldest card in your opponent's hand.",
			Type = "OnSummon",
			Power = { { "SpecificDiscard", 1, "EnemyLeftMostHand" } },
			Target = "Opponent"
		},
		Bio = "The Goddess of Light had nothing on this glove."
	},
	Rukiryo = {
		Id = 5029503081,
		Name = "Rukiryo",
		AltCards = {
			["Rukiryo-ArtV"] = {
				Id = 7650352075,
				AltArt = true,
				Bio = "Disputed Deity of ROBLOX MMORPGs."
			}
		},
		Health = 500,
		Power = 700,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Blue = 1, Neutral = 6 },
		Effect = {
			Name = "Warriors Intimidation",
			Description = "When this card is cast: All enemy fighters lose 200 power. Lock a target fighter for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 200 },
				{ "Lock", 1, "Single" }
			},
			Target = "Opponent",
			Increase = 1
		},
		Bio = "Disputed King of ROBLOX MMORPGs."
	},
	Kmansong2 = {
		Id = 10184235493,
		Name = "Blox Watch",
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 8, Green = 1 },
		Effect = {
			Name = "Mana Siphon",
			Description = "When this card is cast: Deal 300 damage to all non-colourless fighters. They lose 300 power.",
			Type = "OnSummon",
			Power = {
				{ "Weaken", 300, "ColorBlue" },
				{ "Damage", 300, "ColorBlue" },
				{ "Weaken", 300, "ColorGreen" },
				{ "Damage", 300, "ColorGreen" },
				{ "Weaken", 300, "ColorYellow" },
				{ "Damage", 300, "ColorYellow" },
				{ "Weaken", 300, "ColorRed" },
				{ "Damage", 300, "ColorRed" }
			},
			Target = "All"
		},
		Bio = "A watchful gaze, brighter than any star. Legend has it that if you stare back..."
	},
	Games = {
		Id = 10184711407,
		Name = "Games",
		AltCards = {
			["Games-AN"] = {
				Id = 18771316302,
				AttackEffect = "Slash",
				Name = "Armored Games",
				Bio = "The Shard Armor set completed, in all its glory."
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "LinkedSword",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Token = true,
		CustomReminder = {
			["ROBLOX Gears"] = "{W}{W}{W} Colourless actions, each with different effects."
		},
		Effect = {
			Name = "Roblox",
			Description = "When this card is cast, or when it dies: Give yourself a Classic Roblox Tool card.",
			Ability = {
				OnSummon = {
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
					Target = "Ally"
				},
				OnDeath = {
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
					Target = "Ally"
				}
			},
			Type = "OnSummon",
			Target = "Ally"
		},
		Bio = "He loves games."
	},
	["Linked Sword"] = {
		Id = 5983839531,
		Name = "Linked Sword",
		AltCards = {
			["A Single Corndog"] = {
				Id = 10224492845,
				Name = "A Single Corndog",
				Bio = "I've only got enough money for only one thing we can share."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Archetype = "Classic",
		EffectAnimation = "LinkedSwordFlagEffect",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Power Up",
			Description = "A target fighter gains 300 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 300 } },
			Target = "Single"
		},
		Bio = "This sword goes WAY back."
	},
	Trowel = {
		Id = 5983841478,
		Name = "Trowel",
		AltCards = {
			["Not Rex"] = {
				Id = 10224493923,
				Name = "Not Rex",
				Bio = "Anything that isn't Rex is Rex except Rex."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Archetype = "Classic",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Power Up",
			Description = "A target fighter gains 500 health. Lock it for 1 turn.",
			Type = "OnSummon",
			Power = {
				{ "Heal", 500 },
				{ "Lock", 1 }
			},
			Target = "Single"
		},
		Bio = "Trowel hops between doomspires are an advanced strat."
	},
	["Rocket Launcher"] = {
		Id = 5983868463,
		Name = "Rocket Launcher",
		AltCards = {
			["Tiny Robot! Whiplash"] = {
				Id = 10224495016,
				Name = "Tiny Robot! Whiplash",
				Bio = "This game blows!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "ClassicRocket",
		Color = "Neutral",
		Archetype = "Classic",
		Cost = { Neutral = 3 },
		EffectAnimation = "MidClassicRocketEffect",
		Effect = {
			Name = "Power Up",
			Description = "Deal 400 damage to a target fighter.\nAll players lose 400 life.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 400 },
				{ "Cost", 400 },
				{ "Inflict", 400 }
			},
			Target = "Single"
		},
		Bio = "TFW you blow yourself up."
	},
	Superball = {
		Id = 5983845041,
		Name = "Superball",
		AltCards = {
			ThrowCrash = {
				Id = 10224496600,
				Name = "ThrowCrash",
				Effect = {
					Power = {
						{ "Damage", 100 },
						{ "Add", "ThrowCrash", "Ally" }
					},
					Target = "Single"
				},
				Bio = "Why do I have so many copies of ThrowCrash... and why are they all wet?!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Stealth = true,
		Archetype = "Classic",
		Cost = { Neutral = 3 },
		EffectAnimation = "SuperballEffect",
		Effect = {
			Name = "Power Up",
			Description = "Deal 100 damage to a target fighter.\nGive yourself a copy of this card.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 100 },
				{ "Add", "Superball", "Ally" }
			},
			Target = "Single"
		},
		Bio = "Boioioingggg."
	},
	Slingshot = {
		Id = 5984363874,
		Name = "Slingshot",
		AltCards = {
			["John 08"] = {
				Id = 10224533071,
				Name = "John 08",
				Bio = "Look, if you like anything else other than John 08 in the John series. You are just scum of the earth, aren't you?"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Token",
		AttackEffect = "Null",
		Color = "Neutral",
		Archetype = "Classic",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Power Up",
			Description = "Deal 200 damage to a target fighter.\nDraw a card.",
			Type = "OnSummon",
			Power = {
				{ "Damage", 200 },
				{ "Draw", 1, "Ally" }
			},
			Target = "Single"
		},
		Bio = "Your basic weapon. Now comes in rubber."
	},
	MiniToon = {
		Id = 10185649422,
		Name = "MiniToon",
		AltCards = {
			["MiniToon-Hal"] = {
				Id = 139690726412223,
				AttackEffect = "Axe",
				Bio = "\"Ahoy! Wanna star in the next Book?\""
			},
			["Dr. Boomer"] = {
				Id = 10184531905,
				AttackEffect = "TimeBomb",
				AltArt = true,
				Name = "Dr. Boomer",
				Bio = "Mad genius!"
			}
		},
		Health = 300,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		CustomReminder = {
			["Bear Trap"] = "A Colourless 100/100 fighter that costs ⚪, inert in all zones. It deals 100 damage to all fighters when it dies."
		},
		Effect = {
			Name = "Rope, Lamp Oil, Bombs",
			Description = "When this card dies: Give yourself 2 Bear Traps.",
			Type = "OnDeath",
			Power = {
				{ "Add", "Remote Mine" },
				{ "Add", "Remote Mine" }
			},
			Target = "Ally"
		},
		Bio = "Creator of the Cinematic Piggy Universe."
	},
	["Remote Mine"] = {
		Id = 10184164002,
		Name = "Bear Trap",
		AltCards = {
			["Bear Trap-Hal"] = {
				Id = 136304558951917,
				AttackEffect = "Axe",
				Bio = "\"Here, let me spoil how it ends!\""
			},
			Boomers = { Id = 10184252767, Name = "Boomers", Bio = "Will explode!" }
		},
		Health = 100,
		Power = 100,
		Rarity = "Token",
		TokenDiscard = true,
		Token = true,
		AttackEffect = "TimeBomb",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Effect = {
			Name = "Explosion",
			Description = "When this card dies: Deal 100 damage to all fighters.",
			Type = "OnDeath",
			Power = { { "Damage", 100 } },
			Target = "All"
		},
		Bio = "Huh, that's weird. I see a bear trap but no actual bears around h-BONK!"
	},
	["Calamity Box"] = {
		Id = 10184294207,
		Name = "Calamity Box",
		AltCards = {
			["Pandora's Box"] = {
				Name = "Pandora's Box",
				AttackEffect = "Gravity",
				Id = 10185901976,
				Bio = "It has been 10 years since Pandora Box was discovered on Mars and caused the Sky Wall tragedy. Our country was divided into Touto, Seito and Hokuto, resulting in untold chaos."
			},
			["Calamity Box-ARR"] = {
				Id = 77913075904517,
				Name = "Debonair Dealer",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Yep, totally real gemstones, nothing suspect here. Just keep buying!"
			}
		},
		Health = 1000,
		Power = 200,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		EffectAnimation = "Pandora",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "Stud",
			Description = "When this card is cast, or during your end step: Give yourself a rare card.",
			Ability = {
				OnEnd = {
					Power = { { "RandomAdd", "Rare" } },
					Target = "Ally"
				},
				OnSummon = {
					Power = { { "RandomAdd", "Rare" } },
					Target = "Ally"
				}
			}
		},
		Bio = "Imagine the stalker dying to an army of NICCOs spawned from this. 50k bloxbux to the first person who manages to do it."
	},
	Cheezburger = {
		Id = 10279106934,
		Name = "Cheezburger",
		AltCards = {
			["Slice of Nin's Pizza"] = {
				Name = "Slice of Nin's Pizza",
				Id = 10279108931,
				AltArt = true,
				EffectAnimation = "EatPizza",
				Bio = "Mmmmmm Pizzaaaa."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Null",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 2, Red = 1 },
		EffectAnimation = "EatCheez",
		CustomReminder = { ["High Cholestrol"] = "This card doesn't deal damage." },
		IsFood = true,
		Effect = {
			Name = "Cheeseburger",
			Description = "You lose 600 life.\nDouble the power of a target fighter, then half its health.",
			Type = "OnSummon",
			Power = {
				{ "Cost", 600, "Ally" },
				{ "MultiplyPower", 2 },
				{ "MultiplyHealth", 0.5 }
			},
			Target = "Single"
		},
		Bio = "and i luv cheezburger 2!!!"
	},
	Spectrabox = {
		Id = 10186565421,
		Name = "Spectrabox",
		AltCards = {
			OhMYSciencegamer = {
				Id = 6599294053,
				Name = "OhMYSciencegamer",
				AttackEffect = "LaserBlue",
				AltArt = true,
				Bio = "You only need to know that this card is an alt-art of Spectrabox."
			},
			["Spectrabox-AN"] = {
				Id = 9513590695,
				Name = "Retro Gangster",
				AttackEffect = "LaserGreen",
				Bio = "What the 20's looked like in 8-bit."
			}
		},
		Health = 650,
		Power = 300,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Neutral",
		Token = true,
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Thug life",
			Description = "When this card dies: Search your deck for a Colourless card that isn't 'Spectrabox'.",
			Type = "OnDeath",
			Power = { {
				"MoveZone",
				{
					"NotIndexOrSpectrabox_Neutral",
					"Deck_Ally",
					"Hand_Ally",
					true,
					false
				},
				"Self"
			} },
			Target = "Ally",
			AllowDeadAggressorTriggers = true
		},
		Bio = "Alongside Gorbachelli, he stands as the first pioneer of the Fantastic Frontier."
	},
	kickertoken = {
		Id = 7696544748,
		Name = "VoxTrigati",
		AltCards = {
			["L'Geo"] = {
				Name = "L'Geo",
				Id = 6306595222,
				AttackEffect = "MagicBlue",
				AltArt = true,
				Bio = "\"The most powerful Green board ever recorded is Bloxy Announcer pass.\""
			},
			["VoxTrigati-Sun"] = {
				Name = "Fire Fighter",
				AttackEffect = "Whirlpool",
				Id = 9166659380,
				Bio = "Only YOU can prevent your opponent from having fun."
			}
		},
		Health = 550,
		Power = 550,
		Rarity = "Uncommon",
		AttackEffect = "Arcane",
		Color = "Blue",
		Cost = { Blue = 4 },
		Effect = {
			Name = "Blow Dart",
			Description = "After this card attacks: Unlock a target fighter, then lock it for 2 turns.",
			Type = "OnAttackEnd",
			Power = {
				{ "Unlock", 9999 },
				{ "Lock", 2 }
			},
			Target = "Single"
		},
		Bio = "Shining bright, smacking you with all her might!"
	},
	["Assist Trophy"] = {
		Id = 10184147479,
		Name = "Assist Trophy",
		AltCards = {
			["Ravcade-Retro Candy"] = {
				Id = 10184145816,
				Name = "Retro Candy",
				Bio = "Pokémon Reference inbound."
			},
			Hellraiser = {
				Name = "Hellraiser",
				Commissioner = { "uraniummuncjer" },
				Id = 111992391987417,
				AltArt = true,
				PremiumArt = 873,
				Bio = "blue is allowed this right"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Null",
		Color = "Neutral",
		Cost = { Neutral = 3 },
		Effect = {
			Name = "Assist Trophy!",
			Description = "A target fighter gains 500 power.",
			Type = "OnSummon",
			Power = { { "Strengthen", 500 } },
			Target = "Single"
		},
		Bio = "\"I need no assistance. I am victory! - Alex\""
	},
	FancyFame = {
		Id = 10184591448,
		Name = "FancyFame",
		AltCards = {
			["Waltzel, Dogwalker"] = {
				Id = 99753178576589,
				Name = "Waltzel, Dogwalker",
				Commissioner = { "Waltzel", "Remvolt" },
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 689,
				Bio = "Every other day, I'm wondering<br/>\"What's a human being gotta be like?<br/>What's a way to just be competent?\""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 3, Blue = 2 },
		Effect = {
			Name = "Revenue",
			Description = "When this card is cast: Draw a card.",
			Type = "OnSummon",
			Power = { { "Draw", 1 } },
			Target = "Ally"
		},
		Bio = "Fame and fortune are only given to the fanciest of fighters."
	},
	Robot = {
		Id = 10186169303,
		Name = "Robot",
		AltCards = {
			["Robot-Banner"] = {
				Id = 9791891234,
				Addant = "Robot-Banner",
				AttackEffect = "Jab",
				Bio = "Mass Production. Mass Extinction."
			},
			["The Looper"] = {
				Id = 108771272132072,
				Name = "The Looper",
				Addant = "The Looper",
				PremiumArt = 314,
				AltArt = true,
				Bio = "over and over and over and over and over <b><font color=\"#FF0000\">Again</font></b>"
			}
		},
		Health = 100,
		Power = 100,
		Rarity = "Rare",
		Token = true,
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 1 },
		Addant = "Robot",
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
					{ "UnderCap", "Math", 0, "Nil" },
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
	Giftsplosion = {
		Id = 10184867309,
		Name = "Giftsplosion",
		AltCards = {
			BCTrophy2nd = {
				Id = 10184227779,
				Name = "Silver Blox Cards Trophy",
				Bio = "Proof of determination. Never underestimate someone with this card."
			},
			["Giftsplosion-ARR"] = {
				Id = 119442653054583,
				Name = "Clashing Calamity",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "When pitting two absolute powerhouses against one another, widespread chaos is bound to come."
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Punch",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		Effect = {
			Name = "WoodReviewer",
			Description = "Give yourself 6 rare cards.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" },
				{ "RandomAdd", "Rare" }
			},
			Target = "Ally"
		},
		Bio = "Christmas is for December despite advertisements starting in August; It's time to rebel against the system!"
	},
	["Headless Horseman"] = {
		Id = 8057685426,
		Name = "Headless Horseman",
		AltCards = {
			FreckledTurtle = {
				Id = 8057684089,
				Name = "FreckledTurtle",
				CopyBodge = "FreckledTurtle",
				AltArt = true,
				Bio = "It ain't over till it's over, and it ain't over yet."
			},
			["Horseless Headless Horseman"] = {
				Id = 121367612608915,
				Name = "Horseless Headless Horseman",
				AttackEffect = "Slash",
				Bio = "You'd think they'd be weaker without the horse, but no."
			}
		},
		Health = 450,
		Power = 450,
		Rarity = "Rare",
		AttackEffect = "MagicRed",
		Color = "Red",
		Cost = { Red = 3 },
		EffectAnimation = "MidSlashEffect",
		Effect = {
			Name = "Pyrotechnics",
			Description = "When this card is cast, if you have 2000 or less life: It deals 450 damage to a target fighter.",
			Type = "OnSummon",
			Power = { { "Damage", 450 } },
			EffectRequirement = { "Playertable", "Me", 0, 2001, "Life" },
			Target = "Single"
		},
		Bio = "\"Wandering around the Ruins of Bloxburg for victims, they truly are enigmatic specimens. Try not to alert these fiends.\" - David Crissbach"
	},
	["John and Jane"] = {
		Id = 5984357526,
		Name = "John Doe & Jane Doe",
		CopyBodge = "John and Jane",
		AltCards = {
			["John and Jane-ArtV"] = {
				Id = 7650358270,
				Name = "John Doe",
				AltArt = true,
				Effect = {
					Name = "March 18",
					Type = "OnSummon",
					Power = {
						{ "Summon", "John and Jane-ArtV token" },
						{ "Summon", "John and Jane-ArtV token2" }
					},
					Target = "Ally"
				},
				Bio = "3/18..."
			},
			["Garf Gang"] = {
				Id = 11255293755,
				Name = "Garf Gang",
				AltArt = true,
				Effect = {
					Name = "March 18",
					Type = "OnSummon",
					Power = {
						{ "Summon", "JonTron" },
						{ "Summon", "QuintoNEO" }
					},
					Target = "Ally"
				},
				Bio = "Although they got literal opposite bracket rankings, these two can come together over their shared obsession with a certain funny orange cat."
			},
			["Fierce Battle by Design"] = {
				Id = 18771314621,
				Name = "Fierce Battle by Design",
				AltArt = true,
				PremiumArt = 285,
				Effect = {
					Name = "March 18",
					Type = "OnSummon",
					Power = {
						{ "Summon", "Fowl Springfield" },
						{ "Summon", "Mr. Crowley" }
					},
					Target = "Ally"
				},
				Bio = "The two face each other in a tense showdown in the wastelands far beyond... Who will come out victorious? <br/>Find out in the next episode of Blox Cards: A Fowl, Shadowy Legacy!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "LinkedSword",
		Color = "Yellow",
		CustomReminder = {
			["John Doe"] = "Whenever this card gains locks: Your opponent loses 400 life.",
			["Jane Doe"] = "Whenever this card gains locks: Destroy the oldest card in your hand. Draw a card."
		},
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "Summon John Doe and Jane Doe, each 300/300 fighters with a different effect. They're inert in play.",
			Type = "OnSummon",
			Power = {
				{ "Summon", "John and Jane token" },
				{ "Summon", "Jane token" }
			},
			Target = "Ally"
		},
		Bio = "Hello. Friend."
	},
	["John and Jane token"] = {
		Id = 2857411042,
		Name = "John Doe",
		AltCards = {
			["John and Jane-ArtV token"] = {
				Name = "John Doe",
				AttackEffect = "Electric",
				Id = 7650359367,
				Bio = "3/18..."
			},
			JonTron = {
				Name = "JonTron",
				AttackEffect = "LaserBlue",
				Id = 11255294716,
				Bio = "V2h5IGRvIHRoZXkgY2FsbCBpdCBvdmVuIHdoZW4geW91IG9mIGluIHRoZSBjb2xkIGZvb2Qgb2Ygb3V0IGhvdCBlYXQgdGhlIGZvb2Q/"
			},
			["Fowl Springfield"] = {
				Name = "Fowl Springfield",
				AttackEffect = "LaserBlue",
				Id = 18771313703,
				Bio = "Even without my badges, your efforts won't stop my ascension to even greater heights!"
			},
			["John and Jane-ArtV token2"] = {
				Name = "John Doe",
				Id = 7650359367,
				Effect = {
					Name = "Knockdown",
					Description = "Whenever this card gains locks: Destroy the oldest card in your hand. Draw a card.",
					Type = "OnLockIncrease",
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				},
				Bio = "3/18..."
			},
			QuintoNEO = {
				Name = "QuintoNEO",
				AttackEffect = "LaserYellow",
				Id = 11255296887,
				Effect = {
					Name = "Knockdown",
					Description = "Whenever this card gains locks: Destroy the oldest card in your hand. Draw a card.",
					Type = "OnLockIncrease",
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				},
				Bio = "Just remember me when it turns out right."
			},
			["Mr. Crowley"] = {
				Name = "Mr. Crowley",
				AttackEffect = "LaserYellow",
				Id = 18771313340,
				Effect = {
					Name = "Knockdown",
					Description = "Whenever this card gains locks: Destroy the oldest card in your hand. Draw a card.",
					Type = "OnLockIncrease",
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				},
				Bio = "Fear is death that brings total obliteration. But with due time Ms. Springfield, you will come to fear ME."
			},
			["Jane token"] = {
				Name = "Jane Doe",
				Id = 2857409855,
				Effect = {
					Name = "Knockdown",
					Description = "Whenever this card gains locks: Destroy the oldest card in your hand. Draw a card.",
					Type = "OnLockIncrease",
					Power = {
						{ "SpecificDiscard", 1, "AlliedLeftMostHand" },
						{ "Draw", 1 }
					},
					Target = "Ally"
				},
				Bio = "Friend."
			}
		},
		Token = true,
		Health = 300,
		Power = 300,
		Rarity = "Token",
		AttackEffect = "LinkedSword",
		Color = "Yellow",
		Cost = { Neutral = 1, Yellow = 3 },
		Effect = {
			Name = "Knockdown",
			Description = "Whenever this card gains locks: Your opponent loses 400 life.",
			Type = "OnLockIncrease",
			Power = { { "Inflict", 400 } },
			Target = "Opponent"
		},
		Bio = "Hello."
	},
	["Bloxy Tea Party"] = {
		Id = 10184237613,
		Name = "Bloxy Tea Party",
		AltCards = {
			["Boston Tea Party"] = {
				Name = "Boston Tea Party",
				Id = 10184255263,
				AltArt = true,
				CopyBodge = "Boston Tea Party",
				Bio = "\"This is the most magnificent movement of all….There is a dignity, a majesty, a sublimity in this last effort of the Patriots I greatly admire.”"
			},
			["Boston Tea Party-Banner"] = {
				Name = "The Last Dinner",
				Id = 11727995817,
				Bio = "\"One of us isn't Christmas-themed.\""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
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
	["Plushie Dino"] = {
		Id = 9098467383,
		Name = "r0cu",
		AltCards = {
			["Ruination Flufflefunz"] = {
				Id = 10843469981,
				AltArt = true,
				Name = "Ruination Flufflefunz",
				AttackEffect = "Maelstrom",
				Transformant = "Ruination Flufflefunz token",
				Bio = "It's my world, and I'm ruining it."
			},
			F4ILURE = {
				Id = 14693014450,
				AltArt = true,
				Name = "F4ILURE",
				PremiumArt = 110,
				AttackEffect = "Microphone",
				Transformant = "F4ILURE token",
				Bio = "\"Economic downfall? Extinction of all humanity in a single day? What do you mean my stocks are plummeting! Get them back to an acceptable rate!\""
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Yellow",
		Transformant = "Plushie Dino token",
		Cost = { Yellow = 5, Neutral = 4 },
		Effect = {
			Name = "Plushie Amp",
			Description = "Whenever an effect targets this card: Until your next end step, this card can't counter or be countered.",
			Ability = {
				OnTarget = {
					Power = {
						{ "GivePassive", "CounterAttackBlock" },
						{ "GivePassive", "CounterBlock" }
					},
					Target = "Self"
				},
				OnEnd = {
					Power = {
						{ "RemovePassive", "CounterAttackBlock" },
						{ "RemovePassive", "CounterBlock" }
					},
					Target = "Self"
				}
			}
		},
		Bio = "Venisti, vidisti, vicisti. Et ad victorem spolia!"
	},
	["Plushie Dino token"] = {
		Id = 9238682855,
		Name = "Triumphant r0cu",
		AltCards = {
			["Ruination Flufflefunz token"] = {
				Id = 10843470770,
				AltArt = true,
				Name = "Ruin Nation Flufflefunz",
				AttackEffect = "Maelstrom",
				Transformant = "Ruination Flufflefunz",
				Bio = "Um, acktually, it can't be your world! No man nor country can lay claim to a whole celestial body like that."
			},
			["F4ILURE token"] = {
				Id = 14693016208,
				Name = "F4ILURE",
				AttackEffect = "LaserYellow",
				Transformant = "F4ILURE",
				Bio = "\"Woe is me, the one who is filled with greed.\""
			}
		},
		Health = 1000,
		Power = 1000,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Yellow",
		TargetImmune = true,
		CounterBlock = true,
		CounterAttackBlock = true,
		Transformant = "Plushie Dino",
		Cost = { Yellow = 5, Neutral = 4 },
		Effect = {
			Name = "Plushie Amp",
			Description = "This effect lasts until your next end step.",
			Type = "OnEnd",
			Power = { { "Transform", "Transformant" } },
			EffectTransformPreserveRarity = true,
			Target = "Self"
		},
		Bio = "VENISTI! VIDISTI! VICISTI! ET AD VICTOREM SPOLIA!"
	},
	["ROBLOXADOR!!"] = {
		Id = 119073924903643,
		Name = "Hallowed Reliquary",
		CopyBodge = "ROBLOXADOR!!",
		AltCards = {
			["david.baszucki-Alt"] = {
				Id = 102624455777469,
				Name = "The Faceless Angel",
				CopyBodge = "david.baszucki-Alt",
				AltArt = true,
				Bio = "It sat motionless as it watched the world erode in front of its decaying weeds."
			},
			Matt = {
				Id = 137995670760310,
				Name = "Father's Day!",
				CopyBodge = "Matt",
				Bio = "A cool kid hanging out with his cool dad? Well, you know what they say: Like father, like son!"
			}
		},
		Health = 1500,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "ModernRocket",
		Color = "Red",
		Cost = { Neutral = 4, Red = 5 },
		EffectVariable = 0,
		Effect = {
			Name = "POWER",
			Description = "When this card is cast: It gains 250 power for each enemy fighter.",
			Type = "OnSummon",
			Power = {
				{ "SetVariable", "EnemyField" },
				{
					"AlterEV",
					{ "Multiply", "Math", 250, "Nil" }
				},
				{ "Strengthen", "Variable" }
			},
			Target = "Self"
		},
		Bio = "Even in death, the Savior oversees his people through his watchful eyes."
	},
	NobleDragon = {
		Id = 5002321299,
		Name = "NobleDragon",
		AltCards = {
			["NobleDragon-ArtV"] = {
				Id = 7864569615,
				AttackEffect = "Flare",
				AltArt = true,
				CopyBodge = "NobleDragon-ArtV",
				Bio = "Known as the livestream host for ROBLOX's 'The Next Level,' Bob with his Noble Dragon is the staple to any deck affiliated with its trait. Part of the 'Aife' Collection! Collect them all!"
			},
			["The Giant"] = {
				Name = "The Giant",
				Id = 15176633829,
				AttackEffect = "Bite",
				AltArt = true,
				PremiumArt = 148,
				Bio = "We're back."
			}
		},
		Health = 900,
		Power = 250,
		Rarity = "Legendary",
		AttackEffect = "MagicBlue",
		Color = "Blue",
		Cost = { Blue = 6 },
		Dextrous = true,
		Effect = {
			Name = "TNL Finale",
			Description = "Whenever this card attacks: Your opponent draws a card. All fighters in their hand loses 100 power.",
			Type = "OnAttack",
			Power = {
				{ "Draw", 1 },
				{ "StrengthenHand", -100, "Opponent" }
			},
			Target = "Opponent"
		},
		Bio = "I think it's time to take this game to the next level. Don't you?"
	},
	lando64000 = {
		Id = 8923580251,
		Name = "lando64000",
		AltCards = {
			lando64000V2 = {
				Id = 10281524703,
				AttackEffect = "MagicBlue",
				AltArt = true,
				Name = "Professor lando64000"
			},
			["Star Sworn Protector Sylvia"] = {
				Id = 11547502498,
				AttackEffect = "LaserBlue",
				AltArt = true,
				Name = "Star Sworn Protector, Sylvia",
				ArtAnimation = "Star Sworn Protector Sylvia",
				Bio = "On wings of hope, you rise up through the night,\nHigher, oh higher,\nCarrying our song cradled fast within your arms that its chorus might ring for all."
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Legendary",
		AttackEffect = "MagicGreen",
		EffectAnimation = "Freeze",
		Color = "Blue",
		Cost = { Neutral = 4, Green = 1, Blue = 4 },
		Effect = {
			Name = "Roar of Time",
			Description = "When this card is cast: Lock a target fighter for 8 turns, It loses 400 power.",
			Type = "OnSummon",
			Power = {
				{ "Lock", 8 },
				{ "Weaken", 400 }
			},
			Target = "Single"
		},
		Bio = "Creator of a Pirate's life. Also the creator of Pokémon Brick Bronze before Nintendo fired their moon lasers. Check out his newest project, Loomian Legacy!"
	},
	Tinfoilbot = {
		Id = 4974017682,
		Name = "Tinfoilbot",
		AltCards = {
			["Tinfoilbot-E"] = {
				Id = 9159870867,
				Name = "Last Egg",
				AttackEffect = "Gravity",
				Bio = "The last egg... Or is it?"
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Epic",
		AttackEffect = "Jab",
		Color = "Neutral",
		Cost = { Neutral = 5 },
		DamageImmune = true,
		Effect = {
			Name = "Infinite lockdown",
			Description = "When this card is cast: It deals 200 damage to a target fighter. Then deal another 200,000 damage to it if it's Colourless.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Damage", 200 },
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "Card" }
						},
						{
							"AlterEV",
							{ "Set", "Target", "ConvertColor", "Nil" }
						},
						{ "EVExactValueCheck", 5, "Self" }
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
						{ "Damage", 200000 }
					},
					Target = "EVCard"
				}
			}
		},
		Bio = "Only 90's kids will remember this ROBLOXian."
	},
	SaxoAttack = {
		Id = 138373643274303,
		Name = "SaxoAttack",
		AltCards = {
			["Bogg Zaron The Dreadful"] = {
				Id = 10184251518,
				Name = "Bogg Zaron, The Dreadful",
				AttackEffect = "Maelstrom",
				AltArt = true,
				Bio = "Wheel not included."
			},
			["SaxoAttack-ARR"] = {
				Id = 140496973779642,
				Name = "Mandela, Concluding Conflict",
				AttackEffect = "MagicGreen",
				PackDisplayOverride = "A Rare Rivalry Alt-Art Bundle",
				Bio = "Can you two leave each other alone for 5 seconds?! Please!"
			}
		},
		Health = 800,
		Power = 800,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Neutral",
		Cost = { Neutral = 8 },
		Effect = {
			Name = "Conflux",
			Description = "When this card is cast: Give yourself a rare card of each colour.",
			Type = "OnSummon",
			Power = {
				{ "RandomAdd", "Blue Rare" },
				{ "RandomAdd", "Red Rare" },
				{ "RandomAdd", "Green Rare" },
				{ "RandomAdd", "Yellow Rare" }
			},
			Target = "Ally"
		},
		Bio = "I would criticise the spear, but then he'd come out to get me. ;-;/10 - Sword Critic"
	},
	HatHelper = {
		Id = 4720307476,
		Name = "HatHelper",
		AltCards = {
			EG1 = {
				Id = 9783226591,
				AttackEffect = "TimeBomb",
				Name = "Master Art-Egg-San Hathelper",
				Bio = "A master of their craft knows just the right balance of detail to perfect their art."
			}
		},
		Health = 400,
		Power = 200,
		Rarity = "Legendary",
		AttackEffect = "MagicRed",
		Color = "Neutral",
		Cost = { Neutral = 4 },
		Effect = {
			Name = "SCRIPTING PARTY",
			Description = "When this card is cast: It deals 200 damage to all non-Colourless fighters.",
			Type = "OnSummon",
			Power = { { "Damage", 200, "NotColorNeutral" } },
			Target = "Self"
		},
		Bio = "The late ROBLOXian who helped with free models such as hat helper scripts and his notable strategy game."
	},
	["Admin Abuse"] = {
		Id = 11778065824,
		Name = "Admin Abuse",
		Health = 0,
		Power = 0,
		Rarity = "Uncommon",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 1 },
		Lunar = true,
		EffectVariable = 0,
		EffectAnimation = "AdminAbuse",
		Effect = {
			Name = "Reincarnation",
			Description = "Destroy a target fighter if it has exactly 500 health.\nOtherwise, deal 150 damage to it.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"CheckHealth",
							{ 499, 500 }
						},
						{ "Damage", 150 }
					},
					Target = "Single"
				}
			}
		},
		Bio = "Infatuated by the brick's power, Alex succumbed to his inner #####."
	},
	["Super Fans"] = {
		Id = 11778395844,
		Name = "Super Fans",
		AltCards = {
			["Super Fans-E"] = {
				Name = "Eggician",
				AttackEffect = "MagicGreen",
				Id = 12957242847,
				Bio = ""
			},
			["Seven Assoc South Section 4 Fixer"] = {
				Id = 74235526367709,
				Name = "Seven Assoc. South Section 4 Fixer",
				AttackEffect = "Slash",
				AltArt = true,
				PremiumArt = 653,
				Bio = "\"-I can't afford to damage these files any further! Please...! Just get away!\""
			}
		},
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 4, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Twice each turn, whenever a fighter targets this card: Recur an allied card, except it's fading.",
			Ability = {
				OnFighterTarget = {
					Power = { {
						"MoveZone",
						{ "Any", "GraveZone_Ally", "Hand_Ally", true, false }
					} },
					Target = "Self",
					MetaData = { Fading = true },
					TurnTriggerLimit = 2
				}
			}
		},
		Bio = "WE LOVE YOU!!! GIVE US MORE UPDATES PLEASE!!! :DDD"
	},
	["News Reporter"] = {
		Id = 11772220326,
		Name = "News Reporter",
		AltCards = {
			["News Reporter-Banner"] = {
				Id = 11769918277,
				Name = "J. Donaldson",
				AttackEffect = "Gun",
				Bio = "\"If you can, somehow, and I envy you if you can... have a peaceful night.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 1, Neutral = 4 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast a non-colourless epic or legendary fighter: Put a copy of it into your baseplate.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"Aggressor"
						},
						{
							"AddGenZone",
							{ "Variable", 1 },
							"Ally"
						}
					},
					Target = "Self",
					NotColor = "Neutral",
					Rarities = { "Epic", "Legendary" }
				}
			}
		},
		Bio = "Now ain't that legendary? I'd say it's pretty epic!"
	},
	["Autograph Harasser"] = {
		Id = 11769945809,
		Name = "Autograph Harasser",
		AltCards = {
			["Autograph Harasser-Banner"] = {
				Id = 11778055365,
				AttackEffect = "Knife",
				Name = "Yori",
				Bio = "\"I want you all to myself, and I will be only yours.\""
			}
		},
		Health = 500,
		Power = 500,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast, if effects have targeted thrice this turn: Set the Power of a target fighter to 0.",
			Ability = {
				OnSummon = {
					Power = { { "SetPower", 0 } },
					Target = "Single",
					EffectRequirement = { "Playertable", "Me", 3, 9999, "TargetCount" }
				}
			}
		},
		Bio = "The signature handwriting of every Roblox Developer shall be mine, and MINE alone!"
	},
	["Alpha Excavation"] = {
		Id = 11769899758,
		Name = "Alpha Excavation",
		Health = 0,
		Power = 0,
		Rarity = "Epic",
		AttackEffect = "Slash",
		Color = "Green",
		Archetype = "Era",
		Cost = { Green = 3, Yellow = 3, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a card in your graveyard from a choice of 3. Recur that card and obliterate the others.\nRepeat this effect twice.",
			Ability = {
				OnSummon = {
					Power = {
						{ "CreateChoices", "Any" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "CreateChoices", "Any" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" },
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" }
						},
						{ "CreateChoices", "Any" },
						{
							"AlterEV",
							{ "Set", "Target", "CardIndex", "Nil" },
							"TargetChoiceZone"
						},
						{ "Add", "Variable", "Ally" }
					},
					Target = "Self",
					UniqueTargets = true
				}
			},
			ChooseFromZone = "GraveZone",
			AmountOfTargets = 3,
			ObliterateChosenCards = true,
			AddAsRecur = true
		},
		Bio = "The Bloxy Stadium was built on top of a tombstone. It was never to be disturbed."
	},
	["Alex, Developer Depraved"] = {
		Id = 11769897935,
		Name = "Alex, Developer Depraved",
		AltCards = {
			["Alex, Developer Depraved-Offer"] = {
				Id = 14278847402,
				Name = "Protagonist",
				AttackEffect = "Jab",
				CustomReminder = {
					["Hero's Journey"] = "What kind of hero will you be?",
					["+3 charges"] = "Gains the ability \"Whenever a fighter targets: All allied fighters gain 300 health and power.\"",
					["-3 charges"] = "Gains the ability \"Whenever an action targets: Destroy all enemy fighters with 500 or less health, then deal 150 damage to all enemy fighters.\""
				},
				Effect = {
					Name = "Reincarnation",
					Description = "0 Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, become a Hero.",
					Ability = {
						OnActionAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformBadCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, become a Hero.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "OverGate", "Math", -2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "The Inner #####-Offer", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						},
						OnTerrainAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformBadCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, become a Hero.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "OverGate", "Math", -2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "The Inner #####-Offer", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						},
						OnGearAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformBadCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, become a Hero.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "OverGate", "Math", -2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "The Inner #####-Offer", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						},
						OnFighterAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformGoodCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, become a Hero.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "Gate", "Math", 2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "Elder Vitality Demon-Offer", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						}
					}
				},
				Bio = "<i>Think you're so tough? Some sorta main character? Well, go get 100 Stars and defeat the Lord of Darkness then, tough guy!</i>"
			},
			["Alex, Developer Depraved-10Y"] = {
				PackDisplayOverride = "10th Anniversary Art Collection",
				Id = 77706326904049,
				Effect = {
					Name = "Reincarnation",
					Description = "0 Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
					Ability = {
						OnActionAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformBadCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "OverGate", "Math", -2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "The Inner #####-10Y", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						},
						OnFighterAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformGoodCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "Gate", "Math", 2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "Elder Vitality Demon-10Y", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						}
					}
				},
				Bio = "You think you can beat ME?! Heh, I'd like to see you try! After all, I bought Super VIP!!"
			},
			["Brix, File Embezzler"] = {
				Id = 113287514595387,
				Name = "Brix, File Embezzler",
				Effect = {
					Name = "Reincarnation",
					Description = "0 Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
					Ability = {
						OnActionAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Subtract", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformBadCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "OverGate", "Math", -2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "The Inner #####-Brix", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						},
						OnFighterAnyTarget = {
							Power = {
								{ "Heal", 100 },
								{
									"AlterEV",
									{ "Add", "Math", 1, "Nil" },
									nil,
									nil,
									nil,
									"AlexTransformGoodCheck"
								},
								{
									"ReplaceDescription",
									"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
									"Self"
								},
								{
									"AlterEV",
									{ "Save", "EffectVariable", "nil", "ChargeCount" }
								},
								{
									"AlterEV",
									{ "Gate", "Math", 2, "Nil" }
								},
								{
									"TransformOnGreaterEV",
									{ "Elder Vitality Demon-Brix", 0 }
								},
								{
									"AlterEV",
									{ "Load", "Math", "Nil", "ChargeCount" }
								}
							},
							Target = "Self",
							EffectTransformPreserveRarity = true
						}
					}
				},
				Bio = ""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		SummonAnimation = "SummonAlex",
		SummonedAnimation = "SummonAlex",
		Color = "Green",
		Cost = { Green = 7, Neutral = 1 },
		EffectVariable = 0,
		CustomReminder = {
			["#####"] = "He can be ur angle or ur devil...",
			["+3 charges"] = "Gains the ability \"Whenever a fighter targets: All allied fighters gain 300 health and power.\"",
			["-3 charges"] = "Gains the ability \"Whenever an action targets: Destroy all enemy fighters with 500 or less health, then deal 150 damage to all enemy fighters.\""
		},
		Effect = {
			Name = "Reincarnation",
			Description = "0 Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
			Ability = {
				OnActionAnyTarget = {
					Power = {
						{ "Heal", 100 },
						{
							"AlterEV",
							{ "Subtract", "Math", 1, "Nil" },
							nil,
							nil,
							nil,
							"AlexTransformBadCheck"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "ChargeCount" }
						},
						{
							"AlterEV",
							{ "OverGate", "Math", -2, "Nil" }
						},
						{
							"TransformOnGreaterEV",
							{ "The Inner #####", 0 }
						},
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "ChargeCount" }
						}
					},
					Target = "Self",
					EffectTransformPreserveRarity = true
				},
				OnFighterAnyTarget = {
					Power = {
						{ "Heal", 100 },
						{
							"AlterEV",
							{ "Add", "Math", 1, "Nil" },
							nil,
							nil,
							nil,
							"AlexTransformGoodCheck"
						},
						{
							"ReplaceDescription",
							"Variable Charges.\nWhenever an effect targets: This card gains 100 health. It gains a charge if an effect of a fighter targeted, otherwise it loses a charge.\nThen if this card has 3 or negative 3 charges on it, #####.",
							"Self"
						},
						{
							"AlterEV",
							{ "Save", "EffectVariable", "nil", "ChargeCount" }
						},
						{
							"AlterEV",
							{ "Gate", "Math", 2, "Nil" }
						},
						{
							"TransformOnGreaterEV",
							{ "Elder Vitality Demon", 0 }
						},
						{
							"AlterEV",
							{ "Load", "Math", "Nil", "ChargeCount" }
						}
					},
					Target = "Self",
					EffectTransformPreserveRarity = true
				}
			}
		},
		Bio = "18 | Senior | Half Demon | Half ##### | Depressed | Brick powers"
	},
	["Elder Vitality Demon"] = {
		Id = 11769898541,
		Name = "Elder Vitality Demon",
		AltCards = {
			["Elder Vitality Demon-Offer"] = {
				Id = 14278851759,
				Name = "The Savior",
				AttackEffect = "LaserYellow",
				Bio = "<b><font color=\"#FFA500\">The Guiding Light that saves the World from destruction!</font></b>"
			},
			["Elder Vitality Demon-10Y"] = { Id = 75797111927856, Bio = "Nihil." },
			["Elder Vitality Demon-Brix"] = {
				Id = 102638048265201,
				Name = "Brixzee, Harbinger of Malfunction",
				Bio = ""
			}
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 7, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever a fighter targets: All allied fighters gain 300 health and power.",
			Ability = {
				OnFighterAnyTarget = {
					Power = {
						{ "Strengthen", 300 },
						{ "Heal", 300 }
					},
					Target = "Ally"
				}
			}
		},
		Bio = "Alex's edgy immaturity always wanted to be omnipotent; To have control over life and death itself. Realising the stakes of the brick, he soon grew up."
	},
	["The Inner #####"] = {
		Id = 11772740774,
		Name = "The Inner #####",
		AltCards = {
			["The Inner #####-Offer"] = {
				Id = 14278849282,
				Name = "The Guardian",
				AttackEffect = "LaserYellow",
				Bio = "<b><font color=\"#FFA500\">The Shining Blade that repels all Evil from this world!</font></b>"
			},
			["The Inner #####-10Y"] = { Id = 119740707582596, Bio = "ABC for eternal servitude" },
			["The Inner #####-Brix"] = { Id = 116040238213970, Name = "Brixzee, [ERROR 404]", Bio = "" }
		},
		Health = 600,
		Power = 600,
		Rarity = "Token",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 7, Neutral = 1 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever an action targets: Destroy all enemy fighters with 500 or less health, then deal 150 damage to all enemy fighters.",
			Ability = {
				OnActionAnyTarget = {
					Power = {
						{
							"CheckHealth",
							{ 0, 500 }
						},
						{ "Damage", 150 }
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "| <b><i> the will of ####### will b# ######, th |</b> </i>"
	},
	["Award Ceremony"] = {
		Id = 11769900822,
		Name = "Award Ceremony",
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		Color = "Green",
		Cost = { Green = 3, Neutral = 3, Red = 3, Blue = 3, Yellow = 3 },
		EffectVariable = 0,
		CustomReminder = {
			["Claim the Spotlight"] = "A fighter with defender must be attacked before all others."
		},
		Effect = {
			Name = "Reincarnation",
			Description = "A target fighter gains 1000 health and power and defender. Effects can no longer target that card.",
			Ability = {
				OnSummon = {
					Power = {
						{ "Heal", 1000 },
						{ "Strengthen", 1000 },
						{ "GivePassive", "Shield" },
						{ "GivePassive", "TargetImmune" }
					},
					Target = "Single"
				}
			}
		},
		Bio = "And the award for Best Sound Design goes tooooo..."
	},
	Godmodding = {
		Id = 11769924515,
		Name = "Godmodding",
		AltCards = {
			["Yakuman Riichi"] = {
				Id = 104940533859239,
				Name = "Yakuman Riichi",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 549,
				Bio = ""
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Legendary",
		AttackEffect = "Slash",
		EffectAnimation = "Godmode",
		Color = "Green",
		Cost = { Green = 3, Neutral = 4 },
		EffectVariable = 0,
		CustomReminder = { ["Fail Roleplay"] = "Fighters stay at 50 health if they would die." },
		Effect = {
			Name = "Reincarnation",
			Description = "Until the end of your next turn, allied fighters can't die or be destroyed.",
			Ability = {
				OnSummon = {
					Power = { { "BypassCardDeath", 2 } },
					Target = "Ally"
				}
			}
		},
		Bio = "Millenia-old developers, with centuries of experience, defeated in seconds by a brat saying \"<i>(dodges)</i>\""
	},
	["Censor-Bot"] = {
		Id = 11972293666,
		Name = "Censor-Bot",
		Health = 600,
		Power = 400,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Cost = { Blue = 2, Neutral = 3 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever your opponent casts a fighter: They can't cast nonfighter cards until their next end step.\nWhenever your opponent casts a nonfighter card: They can't cast fighters until their next end step.",
			Ability = {
				OnEnemyCast = {
					Power = { { "BypassSummon" } },
					Target = "Opponent"
				},
				OnEnemySummon = {
					Power = {
						{ "BypassAction" },
						{ "BypassTerrain" },
						{ "BypassGear" },
						1
					},
					Target = "Opponent"
				}
			}
		},
		Bio = "<b>MILD PROFANITY DETECTED - LETHAL FORCE AUTHORISED</b>"
	},
	["Secure the Event"] = {
		Id = 11769943680,
		Name = "Secure the Event",
		AltCards = {
			["Flufflefunz Is Officially Out Of Ideas"] = {
				Id = 92543142812767,
				AltArt = true,
				Commissioner = { 41926915 },
				Name = "Closedparentheses Semicolon Enter Closedbrace",
				Bio = "Welcome to the true man's world."
			},
			["Avenge the Fallen"] = {
				Id = 135908631493523,
				AltArt = true,
				PremiumArt = 66,
				Commissioner = { 51942320, 21564633 },
				Name = "Avenge the Fallen",
				Bio = "<i>I couldn't just stand by and watch as the Smiley Familey wreaked havoc on the people of Bloxburg and the murder of their mayor. It's time for the 13th Division to intervene.</i>"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Blue",
		Archetype = "Police",
		Cost = { Blue = 3, Neutral = 2 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Choose a target fighter.\nAll allied Police gain 50 health and power for each lock that fighter has.\nThey can't gain more than 500 health and power this way.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Locks", "Nil" },
							"Single"
						},
						{
							"AlterEV",
							{ "Multiply", "Math", 50, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Cap", "Math", 500, "Nil" },
							"Self"
						},
						{ "Heal", "Variable" },
						{ "Strengthen", "Variable" }
					},
					Target = "AlliedArchetype"
				}
			}
		},
		Bio = "Facing bomb threats and ghostly developers, the event's security had to step up their game."
	},
	["Flagrant Piracy"] = {
		Id = 11769922767,
		Name = "Flagrant Piracy",
		AltCards = {
			["Flagrant Netdecking"] = {
				Id = 17107613166,
				Name = "Flagrant Netdecking",
				PremiumArt = 248,
				AltArt = true,
				AttackEffect = "MagicBlue",
				Bio = "Sure hope your deck is public now!"
			}
		},
		Health = 0,
		Power = 0,
		Rarity = "Rare",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 6 },
		EffectVariable = 0,
		Effect = {
			Name = "Reincarnation",
			Description = "Select a card in your opponent's deck. Search that card and all copies of it in their deck into your hand.",
			Ability = {
				OnSummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"TargetEnemyDeck"
						},
						{
							"MoveZone",
							{ "Variable", "Deck_Opponent", "Hand_Ally", true, false, 10 },
							"Self"
						}
					},
					Target = "Opponent"
				}
			},
			DontCheckArchetype = true
		},
		Bio = "You should've kept your place copylocked."
	},
	["Roblox Hall Of Fame"] = {
		Id = 111345055001996,
		Name = "Roblox Hall Of Fame",
		Health = 0,
		Power = 0,
		Terrain = true,
		Rarity = "Uncommon",
		Terrariant = "The Winner's Chamber",
		AttackEffect = "Slash",
		Color = "Red",
		Cost = { Red = 4, Neutral = 1 },
		EffectVariable = 1,
		Effect = {
			Name = "Reincarnation",
			Description = "Whenever you cast an epic card: A target fighter gains 200 power.\nWhenever you cast a legendary card: Deal 200 damage to a target fighter.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", "Epic" }
					},
					Target = "Self",
					Rarities = { "Epic", "Legendary" },
					NoBlip = true
				},
				OnAllyCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", "Epic" }
					},
					Target = "Self",
					Rarities = { "Epic", "Legendary" },
					NoBlip = true
				},
				OnAllyTerrainCast = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "Rarity", "Nil" },
							"Aggressor"
						},
						{ "EVExactValueCheck", "Epic" }
					},
					Target = "Self",
					Rarities = { "Epic", "Legendary" },
					NoBlip = true
				},
				OnEVCheckPass = {
					Power = { { "Strengthen", 200 } },
					Target = "Single"
				},
				OnEVCheckFail = {
					Power = { { "Damage", 200 } },
					Target = "Single"
				}
			}
		},
		Bio = "The Primordials were not without pride: If he could best all four of them at winning the fabled award, the Brick would be all his without strife."
	},
	["The Temple of Telamon"] = {
		Id = 11769945213,
		Name = "The Temple of Telamon",
		AltCards = {
			["The Temple of Telamon-AN"] = {
				Id = 13893836543,
				Name = "Sentrum's Jank & Junk For Nerds",
				Terrariant = "Order of the Limb-AN",
				Bio = "Come get your thingamajigs! Only 29.99$ for these thingamajigs!"
			},
			["Philabob's Misanthropy"] = {
				Name = "Philabob's Misanthropy",
				AttackEffect = "DoomStorm",
				Terrariant = "Philabob's Philanthropy",
				Id = 16446072522,
				AltArt = true,
				Bio = "From the moment I understood the weakness without Temple, it disgusted me. I craved the strength and certainty of Temple. I aspired to the purity of the Blessed Temple.<br/>One day the crude board wipe you call  bread will fail you, and you will beg my Temple to save you.<br/>But I am already saved...even in death I serve the Temple."
			},
			["Houses of Me Bucket & Cat"] = {
				Name = "Houses of Me Bucket & Me",
				AttackEffect = "DoomStorm",
				Terrariant = "The Adventures of Gent Manic",
				Id = 107132165281378,
				AltArt = true,
				Bio = "ah good ol home"
			},
			["Closet of Ties"] = {
				Id = 73386824236395,
				Name = "Origin 0: Closet of Ties",
				Commissioner = { "TheTiesWhite" },
				Terrariant = "TheTiesUltimateSelf",
				AttackEffect = "Jab",
				AltArt = true,
				PremiumArt = 714,
				Bio = "This. This is my closet. A few ties, hundreds spent, All of it to contain vaarious fedoras too made with love by that lovely tailor."
			}
		},
		Health = 0,
		Power = 0,
		Terrain = true,
		Terrariant = "Order of the Limb",
		Rarity = "Common",
		AttackEffect = "Slash",
		Color = "Yellow",
		Cost = { Yellow = 8, Neutral = 4 },
		EffectVariable = 0,
		Rank = 6,
		Effect = {
			Name = "Reincarnation",
			Description = "When this card is cast: A target allied fighter and its adjacent fighters gain 200 health and power.\nWhenever you cast a fighter: Search your deck for a copy of it.",
			Ability = {
				OnAllySummon = {
					Power = {
						{
							"AlterEV",
							{ "Set", "Target", "CardIndexOriginal", "Nil" },
							"Aggressor"
						},
						{ "Tutorfor", "Variable", "Ally" }
					},
					Target = "Ally"
				},
				OnSummon = {
					Power = {
						{ "Heal", 200 },
						{ "Strengthen", 200 },
						{
							"AlterEV",
							{ "Set", "Target", "CardInstance", "Nil" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "ChosenCard" },
							"SingleAlly"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "LeftChosenCard" },
							"AdjacentEVTargetLeft"
						},
						{
							"AlterEV",
							{ "Save", "Target", "CardInstance", "RightChosenCard" },
							"AdjacentEVTargetRight"
						},
						{
							"AlterEV",
							{ "Set", "Math", 0, "Nil" },
							"Self"
						},
						{
							"AlterEV",
							{ "Load", "Target", "CardInstance", "ChosenCard" },
							"Self"
						},
						{ "Heal", 200, "AdjacentEVTarget" },
						{ "Strengthen", 200, "AdjacentEVTarget" }
					},
					Target = "SingleAlly"
				}
			}
		},
		Bio = "No sole person should wield the power of gods, especially not arrogant manchildren. The miracle of eons past taught this."
	}
}
