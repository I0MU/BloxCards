



return {
	Achievements = {
		OpenCardPack = {
			Name = "Fresh Meat",
			Goal = "Open a card pack!",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "CardPacksOpened",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CompleteACardPack = {
			Name = "A Full Timeline",
			Goal = "100% a card pack!",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "CompetedCardPacks",
			Amount = 1,
			Requirement = "OpenCardPack",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ObtainAltArt = {
			Name = "Give us money. : )",
			Goal = "Use the Art Box.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "CollectedAltArt",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "THANK YOU." }
			}
		},
		ObtainAltArt20 = {
			Name = "Homelessness Prevention Clinic",
			Goal = "Obtain 20 alternate art cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CollectedAltArt",
			Amount = 20,
			Requirement = "ObtainAltArt",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Charitable Saviour" }
			}
		},
		RObtainFoilCard = {
			Name = "shiny...",
			Goal = "Obtain a Foil card.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "FoilsObtained",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Charms = { 5, 0 },
				Ranks = { "Sparkles like Glitter" }
			}
		},
		RObtainFoilCard2 = {
			Name = "Start of The Collection",
			Goal = "Obtain 10 Foil cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "FoilsObtained",
			Amount = 10,
			Requirement = "RObtainFoilCard",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Charms = { 10, 0 },
				Ranks = {}
			}
		},
		RObtainFoilCard3 = {
			Name = "Foil Fan",
			Goal = "Obtain 50 Foil cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "FoilsObtained",
			Amount = 50,
			Requirement = "RObtainFoilCard2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Charms = { 15, 0 },
				Ranks = { "Foil Fan" }
			}
		},
		RObtainFoilCard4 = {
			Name = "Dripping Dragon",
			Goal = "Obtain 100 Foil cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "FoilsObtained",
			Amount = 100,
			Requirement = "RObtainFoilCard3",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Charms = { 20, 0 },
				Ranks = { "Dripping Dragon" }
			}
		},
		RObtainFoilCard5 = {
			Name = "You Absolute Magpie.",
			Goal = "Obtain 1000 Foil cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "FoilsObtained",
			Amount = 1000,
			Requirement = "RObtainFoilCard4",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Charms = { 60, 0 },
				Ranks = { "Absolute Magpie" }
			}
		},
		ObtainLegendaryCard = {
			Name = "Wow! Legendary!",
			Goal = "Obtain a Legendary card!",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "LegendariesObtained",
			Amount = 1,
			Requirement = "OpenCardPack",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "EXTREEEEEEEEEMELY LEGENDARY" }
			}
		},
		CompleteAllCardPack = {
			Name = "Unlocked the Game",
			Goal = "100% 12 packs.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "CompetedCardPacks",
			Amount = 12,
			Requirement = "OpenCardPack",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 1,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Harvester of Souls" }
			}
		},
		CastAction = {
			Name = "Take Action!",
			Goal = "Cast 10 action cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 10,
			Requirement = "Level3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastAction2 = {
			Name = "'Active' Player",
			Goal = "Cast 50 action cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 50,
			Requirement = "CastAction",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastAction3 = {
			Name = "Who needs fighters anyways?",
			Goal = "Cast 100 action cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 100,
			Requirement = "CastAction2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastAction4 = {
			Name = "Spellbender",
			Goal = "Cast 500 action cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 500,
			Requirement = "CastAction3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Spellbender" }
			}
		},
		RCastAction5 = {
			Name = "Play Lame Win Game",
			Goal = "Cast 5000 action cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 5000,
			Requirement = "RCastAction4",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 5000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Play Lame Win Game" }
			}
		},
		RCastAction6 = {
			Name = "The way Garfield intended",
			Goal = "Cast 51,993 action cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 51993,
			Requirement = "RCastAction5",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 5000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastGear = {
			Name = "My First Weapon",
			Goal = "Cast 10 Gear cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 10,
			Requirement = "Level3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastGear2 = {
			Name = "Well Equipped",
			Goal = "Cast 50 Gear cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 50,
			Requirement = "CastGear",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastGear3 = {
			Name = "Open The Armoury",
			Goal = "Cast 100 Gear cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 100,
			Requirement = "CastGear2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastGear4 = {
			Name = "Gear Maniac",
			Goal = "Cast 500 Gear cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 500,
			Requirement = "CastGear3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Gear Maniac" }
			}
		},
		RCastGear5 = {
			Name = "Robloxian Of 5000 Blades",
			Goal = "Cast 5000 Gear cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 5000,
			Requirement = "RCastGear4",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 5000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Robloxian Of 5000 Blades" }
			}
		},
		RCastGear6 = {
			Name = "Who Are You Even Putting All Of This On?",
			Goal = "Cast 50,000 Gear cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedGearCards",
			Amount = 50000,
			Requirement = "RCastGear5",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 5000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastFighter = {
			Name = "Minion Recruiter",
			Goal = "Cast 10 fighter cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 10,
			Requirement = "Level3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastFighter2 = {
			Name = "Natural Leader",
			Goal = "Cast 50 fighter cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 50,
			Requirement = "CastFighter",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastFighter3 = {
			Name = "Cardmancer",
			Goal = "Cast 100 fighter cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 100,
			Requirement = "CastFighter2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastFighter4 = {
			Name = "Master of Minions",
			Goal = "Cast 1000 fighter cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 1000,
			Requirement = "CastFighter3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Master of Minions" }
			}
		},
		RCastFighter5 = {
			Name = "Endless Hordes",
			Goal = "Cast 10,000 fighter cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 10000,
			Requirement = "RCastFighter4",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastFighter6 = {
			Name = "Mass Mobilisation",
			Goal = "Cast 100,000 fighter cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 100000,
			Requirement = "RCastFighter5",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastFighter7 = {
			Name = "You've sent an entire country to die.",
			Goal = "Cast 1,000,000 fighter cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedCards",
			Amount = 1000000,
			Requirement = "RCastFighter6",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 40000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 5 },
				Sleeves = {},
				Ranks = { "Omnicidal Maniac" }
			}
		},
		CastTerrain = {
			Name = "Set the Scene",
			Goal = "Cast 5 terrain cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedTerrainCard",
			Amount = 5,
			Requirement = "Level3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastTerrain2 = {
			Name = "Recursive Value",
			Goal = "Cast 25 terrain cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedTerrainCard",
			Amount = 25,
			Requirement = "CastTerrain",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastTerrain3 = {
			Name = "Lay of the Land",
			Goal = "Cast 100 terrain cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedTerrainCard",
			Amount = 100,
			Requirement = "CastTerrain2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RCastTerrain4 = {
			Name = "Planet Tourer",
			Goal = "Cast 500 terrain cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedTerrainCard",
			Amount = 500,
			Requirement = "CastTerrain3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "PlanetTourer" }
			}
		},
		RCastTerrain5 = {
			Name = "Geomancer's Specialty",
			Goal = "Cast 2500 terrain cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedTerrainCard",
			Amount = 2500,
			Requirement = "RCastTerrain4",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 2500,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Geomancer" }
			}
		},
		CastDoge = {
			Name = "Much Gameplay",
			Goal = "Cast 10 Doge cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeDoge",
			Amount = 10,
			Requirement = "Level2",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Strife's Arsenal"] = 1 }
			}
		},
		CastDoge2 = {
			Name = "Many Woofs",
			Goal = "Cast 100 Doge cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeDoge",
			Amount = 100,
			Requirement = "CastDoge",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "Doge" },
				Ranks = { "Peepster" },
				Packs = { ["Strife's Arsenal"] = 2 }
			}
		},
		CastRedcliff = {
			Name = "Serve and Protect",
			Goal = "Cast 10 Redcliff cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeRedcliff",
			Amount = 10,
			Requirement = "Level2",
			DefaultSort = 12,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Strife's Arsenal"] = 1 }
			}
		},
		CastRedcliff2 = {
			Name = "Chivalrous Knight",
			Goal = "Cast 100 Redcliff cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeRedcliff",
			Amount = 100,
			Requirement = "CastRedcliff",
			DefaultSort = 12,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "Obvious" },
				Ranks = { "Redcliff Elite Commander" },
				Packs = { ["Strife's Arsenal"] = 2 }
			}
		},
		CastKorblox = {
			Name = "Cold Hearted",
			Goal = "Cast 10 Korblox cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeKorblox",
			Amount = 10,
			Requirement = nil,
			DefaultSort = 13,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Strife's Arsenal"] = 1 }
			}
		},
		CastKorblox2 = {
			Name = "Ice Queen",
			Goal = "Cast 100 Korblox cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeKorblox",
			Amount = 100,
			Requirement = "CastKorblox",
			DefaultSort = 13,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "Korblox" },
				Ranks = { "Korblox Deathknight" },
				Packs = { ["Strife's Arsenal"] = 2 }
			}
		},
		CastOverseer = {
			Name = "Growth Ritual",
			Goal = "Cast 10 Overseer cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeOverseer",
			Amount = 10,
			Requirement = "Level2",
			DefaultSort = 14,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Strife's Arsenal"] = 1 }
			}
		},
		CastOverseer2 = {
			Name = "The Beholder",
			Goal = "Cast 100 Overseer cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeOverseer",
			Amount = 100,
			Requirement = "CastOverseer",
			DefaultSort = 14,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "Overseer" },
				Ranks = { "Overseer Godhand" },
				Packs = { ["Strife's Arsenal"] = 2 }
			}
		},
		CastAlar = {
			Name = "Aetherborn",
			Goal = "Cast 20 Alar cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeAlar",
			Amount = 20,
			Requirement = "Level2",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Ultimate Power"] = 1 }
			}
		},
		CastAlar2 = {
			Name = "Genesis",
			Goal = "Cast 100 Alar cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeAlar",
			Amount = 100,
			Requirement = "CastAlar",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "Aether" },
				Ranks = { "Elysian" },
				Packs = { ["Ultimate Power"] = 2 }
			}
		},
		CastUltra = {
			Name = "Otherworldly Force",
			Goal = "Cast 20 Ultra cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeUltra",
			Amount = 20,
			Requirement = "Level2",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Ancient Stirrings"] = 1 }
			}
		},
		CastUltra2 = {
			Name = "Beyond The Gate",
			Goal = "Cast 200 Ultra cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeUltra",
			Amount = 200,
			Requirement = "CastUltra",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "UltraObliterator" },
				Ranks = { "Ultra" },
				Packs = { ["Ancient Stirrings"] = 2 }
			}
		},
		CastAcolyte = {
			Name = "Cult Of Personality",
			Goal = "Cast 10 Acolyte cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeAcolyte",
			Amount = 10,
			Requirement = "Level2",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Beckoned Masters"] = 1 }
			}
		},
		CastAcolyte2 = {
			Name = "All Will Be Nevemore",
			Goal = "Cast 100 Acolyte cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeAcolyte",
			Amount = 100,
			Requirement = "CastAcolyte",
			DefaultSort = 17,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = { "LunarAcol" },
				Ranks = { "Acolyte Prodigy" },
				Packs = { ["Beckoned Masters"] = 2 }
			}
		},
		CastOrinthian = {
			Name = "They Came From Outer Space",
			Goal = "Cast 10 Orinthian cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesCastArchetypeOrinthian",
			Amount = 10,
			Requirement = "Level2",
			DefaultSort = 16,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Temporal Halo"] = 1 }
			}
		},
		CastOrinthian2 = {
			Name = "The Mastermind",
			Goal = "Cast 100 Orinthian cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastArchetypeOrinthian",
			Amount = 100,
			Requirement = "CastOrinthian",
			DefaultSort = 16,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Sleeves = {},
				Ranks = { "The Mastermind" },
				Packs = { ["Temporal Halo"] = 2 }
			}
		},
		CastOrinthian3 = {
			Name = "The Master Mastermind",
			Goal = "Cast 200 Orinthian cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastArchetypeOrinthian",
			Amount = 200,
			Requirement = "CastOrinthian2",
			DefaultSort = 16,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Sleeves = { "Digimon" },
				Ranks = {},
				Packs = { ["Temporal Halo"] = 1 }
			}
		},
		CastGladiator = {
			Name = "Pits Newcomer",
			Goal = "Cast a Gladiator card.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "TimesCastArchetypeGladiator",
			Amount = 1,
			Requirement = "Level5",
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = { ["Tag Team Tactics"] = 1 },
				Sleeves = {},
				Ranks = {},
				Packs = { ["Pits of the Umberlords"] = 1 }
			}
		},
		CastGladiator2 = {
			Name = "Highlander Pro",
			Goal = "Cast 10 Gladiator cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastArchetypeGladiator",
			Amount = 10,
			Requirement = "CastGladiator",
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = { Sorcus = 1 },
				Sleeves = {},
				Ranks = {},
				Packs = { ["Pits of the Umberlords"] = 3 }
			}
		},
		CastGladiator3 = {
			Name = "The Umberlord's Favourite",
			Goal = "Cast 50 Gladiator cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastArchetypeGladiator",
			Amount = 50,
			Requirement = "CastGladiator2",
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Pits of the Umberlords"] = 5 }
			}
		},
		CastGladiator4 = {
			Name = "Pits Champion",
			Goal = "Cast 100 Gladiator cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastArchetypeGladiator",
			Amount = 100,
			Requirement = "CastGladiator3",
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 1500,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Packs = { ["Pits of the Umberlords"] = 10 }
			}
		},
		CastGladiator5 = {
			Name = "Absolutely Gladpilled",
			Goal = "Cast 300 Gladiator cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastArchetypeGladiator",
			Amount = 300,
			Requirement = "CastGladiator4",
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Sleeves = {},
				Ranks = { "Gladpilled" },
				Packs = {}
			}
		},
		Masochism = {
			Name = "You have no free will.",
			Goal = "Cast 'Baseplate' 666 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastBaseplate",
			Amount = 666,
			Requirement = "Level50",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = -100,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RecycleCard = {
			Name = "Eco-Friendly",
			Goal = "Recycle a card at the Recycle Bin.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "CardsRecycled",
			Amount = 1,
			Requirement = "Level2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RecycleCard2 = {
			Name = "Going Green",
			Goal = "Recycle 50 cards at the Recycle Bin.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsRecycled",
			Amount = 50,
			Requirement = "RecycleCard",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RecycleCard3 = {
			Name = "Metal Bin Hugger",
			Goal = "Recycle 500 cards at the Recycle Bin.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CardsRecycled",
			Amount = 500,
			Requirement = "RecycleCard2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RecycleCard4 = {
			Name = "Cat Girl Summoning Ritual Assistant",
			Goal = "Recycle 10,000 cards at the Recycle Bin.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardsRecycled",
			Amount = 10000,
			Requirement = "RecycleCard3",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Ritual Assistant" }
			}
		},
		TradeCard = {
			Name = "It's A Trading Card Game, After all.",
			Goal = "Trade a card to another player!",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "CardsTraded",
			Amount = 1,
			Requirement = "Level10",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		TradeCard2 = {
			Name = "Master Of The Deal",
			Goal = "Trade 20 cards to other players!",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsTraded",
			Amount = 1,
			Requirement = "TradeCard",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Master Of The Deal" }
			}
		},
		RecycleFlatflyer = {
			Name = "This has some weird implications.",
			Goal = "Give the recycling bin an identity crisis.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "TimesRecycledEjob-Foil",
			Amount = 1,
			Requirement = "RecycleCard2",
			DefaultSort = 99,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Catgirlception" }
			}
		},
		CastCommon = {
			Name = "Common Caster",
			Goal = "Cast 10 Common cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedCommonCards",
			Amount = 10,
			Requirement = "Level4",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastCommon2 = {
			Name = "Common Denominator",
			Goal = "Cast 100 Common cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedCommonCards",
			Amount = 10,
			Requirement = "CastCommon",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "House of Commons" }
			}
		},
		CastRare = {
			Name = "Rare Opportunity",
			Goal = "Cast 10 Rare cards.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "CastedRareCards",
			Amount = 10,
			Requirement = "Level4",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastRare2 = {
			Name = "Herald Of Heroes",
			Goal = "Cast 100 Rare cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedRareCards",
			Amount = 100,
			Requirement = "CastRare",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Herald Of Heroes" }
			}
		},
		CastLegendary = {
			Name = "Fame and Fortune",
			Goal = "Cast 10 Legendary cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedLegendaryCards",
			Amount = 10,
			Requirement = "Level4",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastLegendary2 = {
			Name = "Legendary Summoner",
			Goal = "Cast 100 Legendary cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedLegendaryCards",
			Amount = 100,
			Requirement = "CastLegendary",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Legendary Summoner" }
			}
		},
		CastToken = {
			Name = "Token Fodder",
			Goal = "Cast 10 Token cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedTokenCards",
			Amount = 10,
			Requirement = nil,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastToken2 = {
			Name = "Tokens Aplenty",
			Goal = "Cast 50 Token cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedTokenCards",
			Amount = 50,
			Requirement = "CastToken",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastToken3 = {
			Name = "Tokenstorm",
			Goal = "Cast 200 Token cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedTokenCards",
			Amount = 200,
			Requirement = "CastToken2",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Tokenised" }
			}
		},
		Targets = {
			Name = "Sharp Aim",
			Goal = "Have effects target 8 times.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "EffectsTargeted",
			Amount = 8,
			Requirement = "Level4",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Targets2 = {
			Name = "Sharper Aim",
			Goal = "Have effects target 58 times.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "EffectsTargeted",
			Amount = 58,
			Requirement = "Targets",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Targets3 = {
			Name = "Sharpest Aim",
			Goal = "Have effects target 585 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "EffectsTargeted",
			Amount = 585,
			Requirement = "Targets2",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = { ["Targeting Blip-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = { "King of Archery" }
			}
		},
		CastBD = {
			Name = "Curiosity Killed The Cat",
			Goal = "Cast ?????",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "TimesCastBroken Dreams",
			Amount = 1,
			Requirement = "Level50",
			DefaultSort = 99,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Curious Feline" }
			}
		},
		CastEOH = {
			Name = "Eye Of Judgement",
			Goal = "Cast 'Eye Of Heaven.'",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "TimesCastEye of Heaven",
			Amount = 1,
			Requirement = "Level20",
			DefaultSort = 99,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Heavenly Being" }
			}
		},
		CastMZH = {
			Name = "Denied!",
			Goal = "Cast 'Mzh3000.'",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "TimesCastMzh3000",
			Amount = 1,
			Requirement = "Level10",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CastForgotten = {
			Name = "Titanomachy",
			Goal = "Cast 'The Forgotten One.'",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "TimesCastThe Forgotten One",
			Amount = 1,
			Requirement = "Level10",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Ultimate Power"] = 3 },
				Sleeves = {},
				Ranks = { "Titan" }
			}
		},
		CastBargain = {
			Name = "Bargainer",
			Goal = "Cast 'Hallow's Bargain' 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastHallow's Bargain",
			Amount = 20,
			Requirement = "RLevel7",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = { ["Ancient Stirrings"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastBargain2 = {
			Name = "Definitely Fundebted At This Point",
			Goal = "Cast 'Hallow's Bargain' 200 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastHallow's Bargain",
			Amount = 200,
			Requirement = "CastBargain",
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "'It'll work this time i swear" }
			}
		},
		SummonPustule = {
			Name = "How Did We Get Here?",
			Goal = "Summon ????",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "PustuleSummons",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 99,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Blightborn" }
			}
		},
		NoumenalComplete = {
			Name = "Beyond",
			Goal = "???",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "NoumenalRunComplete",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 100,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = { ["DS Mystery Gift - Colourless1"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = { "<font color=\"#4a1857\">Witness Of Beyond</font>" }
			}
		},
		NoumenalPuzzle = {
			Name = "Observer",
			Goal = "A secret in Noumenal.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "NoumenalPuzzleComplete",
			Amount = 1,
			Requirement = "NoumenalComplete",
			DefaultSort = 100,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = { ["DS Mystery Gift - Colourless1-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = { "<font color=\"#4a174a\">Observer Of Beyond</font>" }
			}
		},
		TelamonRaidSecret = {
			Name = "Godslayer",
			Goal = "Fully defeat the Act 1 Boss on Extreme.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BeatTelamonRaidSecret",
			Amount = 1,
			Requirement = "Act1Complete",
			DefaultSort = 100,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Ultimate Power-Foil"] = 3 },
				Sleeves = {},
				Ranks = { "<font color=\"#fcf762\">Godslayer</font>" }
			}
		},
		FlawsEquip = {
			Name = "Minor Flaw",
			Goal = "Attach Flaws to cards 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "EquippedFlaws",
			Amount = 50,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		FlawsEquip2 = {
			Name = "Major Flaw",
			Goal = "Attach Flaws to cards 200 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "EquippedFlaws",
			Amount = 200,
			Requirement = "FlawsEquip",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Doomspire = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		FlawsEquip3 = {
			Name = "Flawed In Every Way",
			Goal = "Attach Flaws to cards 400 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "EquippedFlaws",
			Amount = 400,
			Requirement = "FlawsEquip2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { Doomspire = 3 },
				Sleeves = {},
				Ranks = { "Flawed" }
			}
		},
		ContinuedDeath = {
			Name = "Rooted",
			Goal = "Have Continued fighters die 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "ContinuedCardDeaths",
			Amount = 10,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		ContinuedDeath2 = {
			Name = "Blooming Forever",
			Goal = "Have Continued fighters die 40 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "ContinuedCardDeaths",
			Amount = 40,
			Requirement = "ContinuedDeath",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Doomspire = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		ContinuedDeath3 = {
			Name = "Fully Disregarded",
			Goal = "Have Continued fighters die 120 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "ContinuedCardDeaths",
			Amount = 120,
			Requirement = "ContinuedDeath2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { Doomspire = 3 },
				Sleeves = {},
				Ranks = { "Continued" }
			}
		},
		CastShiny = {
			Name = "My Precious",
			Goal = "Seek and Cast Shinies 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedShinies",
			Amount = 20,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastShiny2 = {
			Name = "All That Glitters",
			Goal = "Seek and Cast Shinies 40 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CastedShinies",
			Amount = 40,
			Requirement = "CastShiny",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Doomspire = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CastShiny3 = {
			Name = "Loot Hoarder",
			Goal = "Seek and Cast Shinies 120 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedShinies",
			Amount = 120,
			Requirement = "CastShiny2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { Doomspire = 3 },
				Sleeves = {},
				Ranks = { "Shiny Seeker" }
			}
		},
		Spiral = {
			Name = "Emotionally Unstable",
			Goal = "Spiral 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesSpiraled",
			Amount = 20,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Spiral2 = {
			Name = "THE DOWNWARDS SPIRAL",
			Goal = "Spiral 60 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesSpiraled",
			Amount = 60,
			Requirement = "Spiral",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Doomspire = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Spiral3 = {
			Name = "Spiraling Out Of Control",
			Goal = "Spiral 200 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesSpiraled",
			Amount = 200,
			Requirement = "Spiral2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { Doomspire = 3 },
				Sleeves = {},
				Ranks = { "Gilmuraig" }
			}
		},
		Cracks = {
			Name = "Just a Little Duct Tape Will Fix It",
			Goal = "Clean up a Cosmic Crack.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CracksRemoved",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Doomspire = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Cracks2 = {
			Name = "You're Cracked",
			Goal = "Clean up 50 Cosmic Cracks.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CracksRemoved",
			Amount = 50,
			Requirement = "Cracks",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Doomspire = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Cracks3 = {
			Name = "Noumenal Janitor",
			Goal = "Clean up 200 Cosmic Cracks.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CracksRemoved",
			Amount = 200,
			Requirement = "Cracks2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { Doomspire = 3 },
				Sleeves = {},
				Ranks = { "Noumenal Janitor" }
			}
		},
		BattleSimComplete = {
			Name = "Virtual Fighter",
			Goal = "Complete all 8 fights in Battle Simulator.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "CompletedBattleSim",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 5 },
				Sleeves = {},
				Ranks = { "Virtual Fighter" },
				BattleBackground = { "BattleSimulator" }
			}
		},
		BattleSimLowComplete = {
			Name = "Data Efficient",
			Goal = "Complete all 8 fights in Battle Simulator while using 120 or less unique cards.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BattleSimLowCardCompletion",
			Requirement = "BattleSimComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 10 },
				Sleeves = {},
				Ranks = { "Datascape Brawler" }
			}
		},
		BattleSimHighComplete = {
			Name = "Simulated All Possibilities",
			Goal = "Complete all 8 fights in Battle Simulator while using 320 unique cards.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BattleSimHighCardCompletion",
			Requirement = "BattleSimComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 10 },
				Sleeves = {},
				Ranks = { "Digital Duelist" }
			}
		},
		TerrorTrigger = {
			Name = "Peep The Terrors",
			Goal = "Trigger Terror effects 10 times using the Winter Horrorland deck.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesTriggeredTerrorTrigger",
			Amount = 10,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		TerrorTrigger2 = {
			Name = "Frozen In Fear",
			Goal = "Trigger Terror effects 25 times using the Winter Horrorland deck",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesTriggeredTerrorTrigger",
			Amount = 25,
			Requirement = "TerrorTrigger",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Frozen In Fear" }
			}
		},
		CastElements = {
			Name = "Master The Flames Of Fate",
			Goal = "Cast Element cards from Team Dimensionia cards 20 times. Complete this quest to unlock a reward in Devil Beater!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastArchetypeElement",
			Amount = 20,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Sky of the Lion" }
			}
		},
		DBCrossOver = {
			Name = "Advent Adventure",
			Goal = "Complete the Blox Cards Advent in the Roblox Experience: Devil Beater.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "DevilBeaterCrossOverComplete",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = { ["Nick Nebula"] = 2, ["Nick Nebula-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RemixCrossOver = {
			Name = "YOU'RE IN MY WAY!!!!!!",
			Goal = "Obtained from the Roblox Experience: Project Remix.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "ProjectRemixCrossOverComplete",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {
					["Arms Dealer Cami-CROSSOVERBADGE"] = 1,
					["Arms Dealer Cami-CROSSOVERBADGE-Foil"] = 1
				},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RemixBadge = {
			Name = "Master Markswoman",
			Goal = "Win a match with the fatal blow being from overloaded damage dealt by Arms Dealer Cami. Complete this quest to unlock a reward in Project Remix!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "CamiOverloadKill",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "MY DECK IS PERFECT" }
			}
		},
		RorvikCrossOver = {
			Name = "Lab Rat's Assistant",
			Goal = "Obtained by completing the Blox Cards quest in the Roblox Experience: Rorvik!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "RorvikCrossOverComplete",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = { ["Hard Cheese-Badge"] = 3, ["Hard Cheese-Badge-Foil"] = 3 },
				Packs = {},
				Sleeves = { "Rorvik" },
				Ranks = {}
			}
		},
		RorvikBadge = {
			Name = "Extoredinare",
			Goal = "In a match, Have 5 or more Giant Ores in your opponent's graveyard at once. Complete this quest to unlock a reward in Rorvik!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "5GiantOres",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "John Monored" }
			}
		},
		SEWHBadge = {
			Name = "Something Evil Happened",
			Goal = "Survive 10 disasters from your own Something Evil Will Happen terrain across games.  Complete this quest to unlock a reward in Something Evil Will Happen!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "DisastersSurvived",
			Amount = 10,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Disaster Survivalist" }
			}
		},
		SEWHCrossover = {
			Name = "Kind of a Disaster",
			Goal = "Obtained by earning the crossover badge in the Roblox Experience: Something Evil Will Happen!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "SEWHCrossOverComplete",
			Amount = 1,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {
					["Something Evil Will Happen-Badge"] = 2,
					["Something Evil Will Happen-Badge-Foil"] = 2
				},
				Packs = {},
				Sleeves = {},
				Ranks = { "things still hurt just feels like less" }
			}
		},
		DoDBadge = {
			Name = "Comédie Burlesque",
			Goal = "Win 1 match with at least 3 unique cards from the Die of Death Cross-World Series.  Complete this quest to unlock a reward in Die of Death!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "WinWithDoDCards",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Asymmetrical Horror Enjoyer" }
			}
		},
		DoDCrossover = {
			Name = "Died of Death",
			Goal = "Obtained by earning the crossover badge in the Roblox Experience: Die of Death!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "DoDCrossOverComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {
					["Saucefy10-Badge"] = 1,
					["Saucefy10-Badge-Foil"] = 1,
					["Artful-Badge"] = 1,
					["Artful-Badge-Foil"] = 1,
					["Killdroid-Badge"] = 3,
					["Killdroid-Badge-Foil"] = 3
				},
				Packs = {},
				Sleeves = {},
				Ranks = { "Died of death." }
			}
		},
		AfternightBadge = {
			Name = "Perfect Combo",
			Goal = "Win 1 match with a card from the Project Afternight Cross-World Series.  Complete this quest to unlock a reward in Project Afternight!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "WinWithAfternightCards",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Perfect Combo!" }
			}
		},
		AfternightCrossover = {
			Name = "Dream To The Beat",
			Goal = "Obtained by earning the crossover badge in the Roblox Experience: Project Afternight!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "AfternightCrossOverComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {
					["Dawndreamer Developers-Badge"] = 2,
					["Dawndreamer Developers-Badge-Foil"] = 2
				},
				Packs = {},
				Sleeves = {},
				Ranks = { "Keyboard Smasher" }
			}
		},
		WTDBadge = {
			Name = "The Best Defense",
			Goal = "Station cards with Awesome Weapons Guys 20 times across games.  Complete this quest to unlock a reward in World Tower Defense!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesStationed",
			Amount = 20,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Kindler" }
			}
		},
		WTDCrossover = {
			Name = "...Is a Strong Offense.",
			Goal = "Obtained by earning the crossover badge in the Roblox Experience: World Tower Defense!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "WTDCrossOverComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = { DeivyDoesTutorials33 = 1, ["DeivyDoesTutorials33-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = { "World Defender" }
			}
		},
		DTTBadge = {
			Name = "Here Comes The Pain Train",
			Goal = "Win 1 match with atleast 6 unique cards from the Dubious group. Complete this quest to unlock a reward in Defend The Train!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "WinWithDubiousCards",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Train Conductor" }
			}
		},
		DTTCrossover = {
			Name = "Task Fulfiller",
			Goal = "Obtained by earning the crossover badge in the Roblox Experience: Defend The Train!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "DTTCrossOverComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {
					["Overworked Engineers-Offer"] = 3,
					["Overworked Engineers-Offer-Foil"] = 3
				},
				Packs = {},
				Sleeves = {},
				Ranks = { "Top of Several Lists" }
			}
		},
		CIBadge = {
			Name = "Initiator",
			Goal = "Win 1 match with at least 2 unique cards from the Combat Initiation Cross-World Series.  Complete this quest to unlock a reward in Combat Initiation!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "WinWithCICards",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "XTREME!!!" }
			}
		},
		CICrossover1 = {
			Name = "Combat Initiation: CROSSROADS",
			Goal = "Obtained by completing Stage 1 in the Roblox Experience: Combat Initiation!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "CICrossOverComplete1",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = { ["Vagabond-Badge"] = 2, ["Vagabond-Badge-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CICrossover2 = {
			Name = "Combat Initiation: CHAOS CANYON",
			Goal = "Obtained by completing Stage 2 in the Roblox Experience: Combat Initiation!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "CICrossOverComplete2",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = { ["King-Badge"] = 2, ["King-Badge-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CICrossover3 = {
			Name = "Combat Initiation: GLASS HOUSES",
			Goal = "Obtained by completing Stage 3 in the Roblox Experience: Combat Initiation!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "CICrossOverComplete3",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {
					["Great Drakobloxxer-Badge"] = 2,
					["Great Drakobloxxer-Badge-Foil"] = 2
				},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BoothBadge = {
			Name = "Boothers Game",
			Goal = "Win 1 match with at least 2 unique cards from the Booth Game Cross-World Series.  Complete this quest to unlock a reward in Booth Game!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "WinWithBoothCards",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BoothCrossover = {
			Name = "I Rate Your Cards",
			Goal = "Obtained from the crossover badge in the Roblox Experience: Booth Game!",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "BoothCrossOverComplete",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = { ["ALL EYES ON SCRIPT"] = 1, ["ALL EYES ON SCRIPT-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SummonZeitgeist = {
			Name = "Time Distortion",
			Goal = "Summon 10 Zeitgeists",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "SummonedZeitgeists",
			Amount = 10,
			Requirement = "Level10",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Temporal Halo"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		SummonZeitgeist2 = {
			Name = "Master Of Distortion",
			Goal = "Summon 100 Zeitgeists",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "SummonedZeitgeists",
			Amount = 100,
			Requirement = "SummonZeitgeist",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Temporal Halo"] = 5 },
				Sleeves = {},
				Ranks = { "Shattered Across Time" }
			}
		},
		AnthrestGain = {
			Name = "Beautiful Creature",
			Goal = "Advance your Anthrestation 20 times across games.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "AnthrestationGained",
			Amount = 20,
			Requirement = "Level10",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Temporal Halo"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		AnthrestGain2 = {
			Name = "Anthrest Apocalypse",
			Goal = "Advance your Anthrestation 60 times across games.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "AnthrestationGained",
			Amount = 60,
			Requirement = "AnthrestGain",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Temporal Halo"] = 5 },
				Sleeves = {},
				Ranks = {}
			}
		},
		AnthrestGain3 = {
			Name = "Perfect Skin",
			Goal = "Advance your Anthrestation 200 times across games.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "AnthrestationGained",
			Amount = 200,
			Requirement = "AnthrestGain2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Peak of Perfection" }
			}
		},
		DragonGain = {
			Name = "Dragon Force Z",
			Goal = "Gain 200,000,000 DRAGONFORCE across games",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "DragonForceGained",
			Amount = 200,
			Requirement = nil,
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Temporal Halo"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		DragonGain2 = {
			Name = "Power of NEOdragons",
			Goal = "Gain 600,000,000 DRAGONFORCE across games",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "DragonForceGained",
			Amount = 600,
			Requirement = "DragonGain",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Temporal Halo"] = 5 },
				Sleeves = {},
				Ranks = {}
			}
		},
		DragonGain3 = {
			Name = "NEODRAGON SUPER ULTRA SUPPORTER EX SUPREME DOUBLE CROSS",
			Goal = "Gain 2,000,000,000 DRAGONFORCE across games",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "DragonForceGained",
			Amount = 2000,
			Requirement = "DragonGain2",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "NEODRAGON EX SUPREME" }
			}
		},
		LifeDamage = {
			Name = "Face Off",
			Goal = "Deal 12,000 damage to your opponent's life across games.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "LifeDamageDealt",
			Amount = 12000,
			Requirement = "Level2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LifeDamage2 = {
			Name = "Burn!!!!",
			Goal = "Deal 120,000 damage to your opponent's life across games.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "LifeDamageDealt",
			Amount = 120000,
			Requirement = "LifeDamage",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = { ["Inferno!"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LifeDamage3 = {
			Name = "BURN!!!!!!!!!",
			Goal = "Deal 1,200,000 damage to your opponent's life across games.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "LifeDamageDealt",
			Amount = 1200000,
			Requirement = "LifeDamage2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = { ["Inferno!-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = { "Fiery Fury" }
			}
		},
		OneShotPlayer = {
			Name = "One Punch!!!!!!",
			Goal = "Defeat an opponent by dealing over 4000 combat damage to them in a single attack.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "OneShotPlayer",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = { ["One BLOX Man"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = { "Anime Superhero" }
			}
		},
		BlessingGain = {
			Name = "Answered Prayer",
			Goal = "Apply a Blessing to a card space.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsGiven",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingGain2 = {
			Name = "Casual Worshipper",
			Goal = "Apply 20 Blessings to card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsGiven",
			Amount = 20,
			Requirement = "BlessingGain",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingGain3 = {
			Name = "Bless you.",
			Goal = "Apply 100 Blessings to card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsGiven",
			Amount = 100,
			Requirement = "BlessingGain2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingGain4 = {
			Name = "Favored By The Eldritch",
			Goal = "Apply 500 Blessings to card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsGiven",
			Amount = 500,
			Requirement = "BlessingGain3",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = { "Blessed" }
			}
		},
		BlessingUse = {
			Name = "Gift From The Gods",
			Goal = "Cast a card from a Blessed card space.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsUsed",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingUse2 = {
			Name = "Otherworldy Power",
			Goal = "Cast 20 cards from Blessed card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsUsed",
			Amount = 20,
			Requirement = "BlessingUse",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingUse3 = {
			Name = "Glow Up",
			Goal = "Cast 50 cards from Blessed card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsUsed",
			Amount = 50,
			Requirement = "BlessingUse2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BlessingUse4 = {
			Name = "Maximum Enhancement",
			Goal = "Cast 100 cards from Blessed card spaces.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BlessingsUsed",
			Amount = 100,
			Requirement = "BlessingUse3",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = { "Farseeker Researcher" }
			}
		},
		RageGain = {
			Name = "Mildly Agitated",
			Goal = "Enter Rage for your first time.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RageGained",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RageGain2 = {
			Name = "Rage Against The Machine",
			Goal = "Enter Rage 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RageGained",
			Amount = 10,
			Requirement = "RageGain",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { ["Lunar Impact"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RageGain3 = {
			Name = "Anger Management Issues",
			Goal = "Enter Rage 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RageGained",
			Amount = 50,
			Requirement = "RageGain2",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RageGain4 = {
			Name = "Average Blox Card's Player's Saltiness",
			Goal = "Enter Rage 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RageGained",
			Amount = 100,
			Requirement = "RageGain3",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = { "Enraged" }
			}
		},
		MultiRage = {
			Name = "Can You Calm Down Please?",
			Goal = "Gain 6 stacks of Rage in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "6RageInTurn",
			Amount = 1,
			Requirement = "RageGain",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 400,
				Cards = {},
				Packs = { ["Lunar Impact"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Ransack1 = {
			Name = "Arson Apprentice",
			Goal = "Ransack a card.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Ransack2 = {
			Name = "Burn It All!",
			Goal = "Ransack 20 cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Requirement = "Ransack1",
			Amount = 20,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Ransack3 = {
			Name = "Greedy Grinner",
			Goal = "Ransack 100 cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Requirement = "Ransack2",
			Amount = 100,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Ransack4 = {
			Name = "Part Of The Familey",
			Goal = "Ransack 1000 cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Requirement = "Ransack3",
			Amount = 1000,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Part Of The Familey" }
			}
		},
		Seance1 = {
			Name = "From The Grave",
			Goal = "Seance a card.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Seance2 = {
			Name = "Last Farewell",
			Goal = "Seance a card 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Requirement = "Seance1",
			Amount = 10,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Seance3 = {
			Name = "Undead Conversationalist",
			Goal = "Seance a card 40 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Requirement = "Seance2",
			Amount = 40,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Seance4 = {
			Name = "Brain Transplanter",
			Goal = "Seance a card 100 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Requirement = "Seance3",
			Amount = 100,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Seance5 = {
			Name = "Undead Visionary",
			Goal = "Seance a card 400 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Requirement = "Seance4",
			Amount = 400,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Undead Visionary" }
			}
		},
		Liberate1 = {
			Name = "Protestor",
			Goal = "Liberate a card.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Liberate2 = {
			Name = "Rebel",
			Goal = "Liberate a card 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Requirement = "Liberate1",
			Amount = 10,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Liberate3 = {
			Name = "Uprising",
			Goal = "Liberate a card 40 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Requirement = "Liberate2",
			Amount = 40,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Liberate4 = {
			Name = "Leader Of The Rebellion",
			Goal = "Liberate a card 100 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Requirement = "Liberate3",
			Amount = 100,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Liberate5 = {
			Name = "True Anarchist",
			Goal = "Liberate a card 400 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Requirement = "Liberate4",
			Amount = 400,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "True Anarchist" }
			}
		},
		Bliss1 = {
			Name = "No Pain, No Gain",
			Goal = "Enter Bliss.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesBlissed",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Bliss2 = {
			Name = "Hewwo!",
			Goal = "Enter Bliss 5 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesBlissed",
			Requirement = "Bliss1",
			Amount = 5,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Bliss3 = {
			Name = "Catgirl Sacrifant",
			Goal = "Enter Bliss 15 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesBlissed",
			Requirement = "Bliss2",
			Amount = 15,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Bliss4 = {
			Name = "UwU",
			Goal = "Enter Bliss 60 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesBlissed",
			Requirement = "Bliss3",
			Amount = 60,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "UwU" }
			}
		},
		Recur1 = {
			Name = "Recycler",
			Goal = "Recur a card.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "TimesRecurred",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 150,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Recur2 = {
			Name = "Recursive Writer",
			Goal = "Recur a card 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesRecurred",
			Requirement = "Recur1",
			Amount = 20,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Recur3 = {
			Name = "It's Like A Second Deck!",
			Goal = "Recur a card 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesRecurred",
			Requirement = "Recur2",
			Amount = 100,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Recur4 = {
			Name = "And They Dont Stop Coming",
			Goal = "Recur a card 500 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesRecurred",
			Requirement = "Recur3",
			Amount = 500,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Recur5 = {
			Name = "Arkhivist",
			Goal = "Recur a card 1000 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesRecurred",
			Requirement = "Recur4",
			Amount = 1000,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Arkhivist" }
			}
		},
		Immortal1 = {
			Name = ":Sword Me",
			Goal = "Draw a card from the Immortal Swords deck.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "ImmortalDraws",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Immortal2 = {
			Name = "Experienced Bladesmith",
			Goal = "Draw 20 cards from the Immortal Swords deck.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "ImmortalDraws",
			Requirement = "Immortal1",
			Amount = 20,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Immortal3 = {
			Name = "Immortal Wielder",
			Goal = "Draw 100 cards from the Immortal Swords deck.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "ImmortalDraws",
			Requirement = "Immortal2",
			Amount = 100,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Immortal Wielder" }
			}
		},
		ImmortalChaos = {
			Name = "Chaos, Chaos!",
			Goal = "Draw a card from the Immortal Sword deck with no Immortal Swords left.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "ImmortalChaosDraws",
			Requirement = "Immortal1",
			Amount = 1,
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatBot = {
			Name = "Skynet is no more",
			Goal = "Defeat any NPC.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "BotGamesWon",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 6,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatBot7 = {
			Name = "Seven Samurai",
			Goal = "Defeat any 7 NPCs.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "UniqueBotWins",
			Amount = 7,
			Requirement = "BeatBot",
			DefaultSort = 6,
			IsAddition = false,
			Rewards = {
				BloxBux = 77,
				Cards = { ["Samurai Shock"] = 7 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RBeatBotAll = {
			Name = "Uncontested",
			Goal = "Defeat any 20 NPCs.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "UniqueBotWins",
			Amount = 20,
			Requirement = "BeatBot7",
			DefaultSort = 6,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Hallow's Champion" }
			}
		},
		DSA2Wraiths = {
			Name = "Injustice League",
			Goal = "Defeat the Wraiths Challenge battle on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_InjusticeRaidN",
			Amount = 1,
			DefaultSort = 7,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Corrupted Crest"] = 20 },
				Sleeves = {},
				Ranks = {}
			}
		},
		DSA2Invasion = {
			Name = "Breakwater",
			Goal = "Defeat the Invasion Challenge battle on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_InvasionRaidN",
			Amount = 1,
			DefaultSort = 7,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Ceramic Fish"] = 20 },
				Sleeves = {},
				Ranks = {}
			}
		},
		DSA2Deidre = {
			Name = "Blind Hatred",
			Goal = "Defeat the Vengeful Machine Challenge battle on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_DeidreRaidN",
			Amount = 1,
			DefaultSort = 7,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Bloomed Flower"] = 20 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatGoldfish = {
			Name = "Completely Defenceless",
			Goal = "Defeat the Goldfish.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "BOT_WINS_Goldfish",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 7,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = { "Go Fish" }
			}
		},
		BeatKiwami = {
			Name = "The Definition of Insanity.",
			Goal = "Defeat Goldfish Kiwami.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_GoldfishKiwami",
			Amount = 1,
			Requirement = "BeatBot7",
			DefaultSort = 10,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = { ["Darken the Skies"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = { "Fishy Flagellator" }
			}
		},
		BeatCooler = {
			Name = "Vaporized",
			Goal = "Defeat an intimidating foe.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_Bublert",
			Amount = 1,
			Requirement = "BeatBot7",
			DefaultSort = 10,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Refreshed" }
			}
		},
		BeatConfusion = {
			Name = "ZOMGLOLXDUWU",
			Goal = "Defeat Confusion Elemental.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "BOT_WINS_Confusion Elemental",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = { ["Confusion Elemental?"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatWishNite = {
			Name = "Wishnite Upon A Star",
			Goal = "Solve Wishnite's Puzzle.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "BOT_WINS_Wishnite",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 350,
				Cards = { WishNite = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDeer = {
			Name = "Foil Market In Shambles",
			Goal = "Defeat The Suspiciously Wealthy Deer.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "BOT_WINS_Suspiciously Wealthy Deer",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = { Flufflefunz = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = { "Oh Deer." }
			}
		},
		BeatDeerEX = {
			Name = "Stock Breaker",
			Goal = "Defeat Hardmode Suspiciously Wealthy Deer.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_Flufflefunz EX",
			Amount = 1,
			Requirement = "BeatDeer",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 800,
				Cards = { ["Market Freeze"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = { "Fawnd Of Foils" }
			}
		},
		Beatttarbot = {
			Name = "Squabble Master",
			Goal = "Defeat Ttar bot.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_ttar Bot",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = { ["Lord Crimsonwrath"] = 1, Tl_rd = 2 },
				Packs = { ["Tycoon Simulator"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatTagger = {
			Name = "Magic Marker",
			Goal = "Help Tyler out.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Tagger",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				BloxBux = 300,
				Cards = {},
				Packs = { ["Temporal Halo"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatFangirl = {
			Name = "Iris's #2 Fan",
			Goal = "Defeat The Fangirl.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_Iris Fangirl",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 9,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = { SCP2Y = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ZanzelPWin = {
			Name = "Un-Apocryphased",
			Goal = "Defeat Zanzel, Perfected on Normal difficulty.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "BOT_WINS_ZanzelRaid",
			Amount = 1,
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Apocryphic Sigil"] = 10 },
				Sleeves = {},
				Ranks = {}
			}
		},
		ZanzelPEXWin = {
			Name = "Pefectionist",
			Goal = "Defeat Zanzel, Perfected on Extreme difficulty.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "BOT_WINS_ZanzelRaidEX",
			Amount = 1,
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Apocryphic Sigil"] = 30 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Win1 = {
			Name = "ggwp",
			Goal = "Win against a player!",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "GamesWon",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Win10 = {
			Name = "Duelist",
			Goal = "Win 10 matches.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "GamesWon",
			Amount = 10,
			Requirement = "Win1",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 100,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Win21 = {
			Name = "9 + 10 = 21",
			Goal = "Win 21 matches.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "GamesWon",
			Amount = 21,
			Requirement = "Win10",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 210,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Win50 = {
			Name = "Accomplished Duelist",
			Goal = "Win 50 matches.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "GamesWon",
			Amount = 50,
			Requirement = "Win21",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Powerful" }
			}
		},
		Win100 = {
			Name = "The Card Player",
			Goal = "Win 100 total matches.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "GamesWon",
			Amount = 100,
			Requirement = "Win50",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Slaughterer" }
			}
		},
		Win1000 = {
			Name = "God fears you.",
			Goal = "Win 1000 matches.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "GamesWon",
			Amount = 1000,
			Requirement = "Win100",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "King of Games" }
			}
		},
		Level2 = {
			Name = "The first hurdle",
			Goal = "Get to level 2!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 2,
			Requirement = nil,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Level3 = {
			Name = "Learning The Ropes",
			Goal = "Get to level 3!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 3,
			Requirement = "Level2",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Level4 = {
			Name = "A Legend Appears",
			Goal = "Get to level 4!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 4,
			Requirement = "Level3",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Level5 = {
			Name = "Rising Star",
			Goal = "Get to level 5!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 5,
			Requirement = "Level4",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Level6 = {
			Name = "A Penultimate Test",
			Goal = "Get to level 6!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 6,
			Requirement = "Level5",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 250,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		RLevel7 = {
			Name = "Graduation Ceremony",
			Goal = "Get to level 7!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 7,
			Requirement = "Level6",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Cards = {},
				Packs = { ["Strife's Arsenal"] = 5, ["Strife's Arsenal-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Accomplished Player" }
			}
		},
		Level10 = {
			Name = "Postgraduate Studies",
			Goal = "Get to level 10!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Level20 = {
			Name = "Cardshark Heavyweight",
			Goal = "Get to level 20!",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "Level",
			Amount = 20,
			Requirement = "Level10",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 1500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RLevel30 = {
			Name = "Professional Battler",
			Goal = "Get to level 30!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 30,
			Requirement = "Level20",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = { ["Variety Pack-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Level40 = {
			Name = "Champion",
			Goal = "Get to level 40!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 40,
			Requirement = "RLevel30",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 2500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RLevel50 = {
			Name = "Grandmaster",
			Goal = "Get to level 50!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 50,
			Requirement = "Level40",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 3000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 3 },
				Sleeves = {},
				Ranks = { "Devoted Grandmaster" }
			}
		},
		Level60 = {
			Name = "The Fish Swims Upwards",
			Goal = "Get to level 60!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 60,
			Requirement = "RLevel50",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 3500,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Level70 = {
			Name = "Halfway to Divinity",
			Goal = "Get to level 70!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 70,
			Requirement = "Level60",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 4000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RLevel80 = {
			Name = "Top of the Mountain",
			Goal = "Get to level 80!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 80,
			Requirement = "Level70",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 4500,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 5 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Level90 = {
			Name = "One Step from Divinity",
			Goal = "Get to level 90!",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "Level",
			Amount = 90,
			Requirement = "RLevel80",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 5000,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RLevel100 = {
			Name = "Celestial Deity",
			Goal = "Get to level 100!",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "Level",
			Amount = 100,
			Requirement = "Level90",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 10000,
				Cards = {},
				Packs = { ["Variety Pack-Foil"] = 10 },
				Sleeves = {},
				Ranks = { "Celestial Deity" }
			}
		},
		Level150 = {
			Name = "What is wrong with you?",
			Goal = "Grind to level 150!",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "Level",
			Amount = 150,
			Requirement = "RLevel100",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "Unhealthy Work-Life Balance" }
			}
		},
		Level200 = {
			Name = "Ultimate Gamer",
			Goal = "Grind to level 200!",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "Level",
			Amount = 200,
			Requirement = "Level150",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = { "<font color=\"#E5A33E\"><b>Ultimate Gamer</b></font>" }
			}
		}
	},
	Story = {
		BeatDSRed = {
			Name = "[DS] Reforged",
			Goal = "Defeat UNIT_4_FORGEMASTER on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_DSRedRaid",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Forgemaster Figure"] = 10 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSRedEX = {
			Name = "[DS] Through The Fire And Flames",
			Goal = "Defeat UNIT_4_FORGEMASTER on Extreme mode.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_DSRedRaidEX",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Forgemaster Figure"] = 40 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSBlue = {
			Name = "[DS] A New Champion",
			Goal = "Defeat Prince Wonktooth on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_DSBlueRaid",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Wonktooth Figure"] = 10 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSBlueEX = {
			Name = "[DS] Usurper Of The Sea",
			Goal = "Defeat Prince Wonktooth on Extreme mode.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_DSBlueRaidEX",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Wonktooth Figure"] = 40 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSGreen = {
			Name = "[DS] Death Defying",
			Goal = "Defeat Thyyrinyr on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_DSGreenRaid",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Thyyrinyr Figure"] = 10 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSGreenEX = {
			Name = "[DS] Continued Forever",
			Goal = "Defeat Thyyrinyr on Extreme mode.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_DSGreenRaidEX",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Thyyrinyr Figure"] = 40 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSYellow = {
			Name = "[DS] Fearless",
			Goal = "Defeat The Animus on Normal mode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_DSYellowRaid",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Animus Figure"] = 10 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDSYellowEX = {
			Name = "[DS] Justice City Hero",
			Goal = "Defeat The Animus on Extreme mode.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "BOT_WINS_DSYellowRaidEX",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = {},
				EventCurrency = { ["Animus Figure"] = 40 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatDoomspire = {
			Name = "[DS] Spire Delver",
			Goal = "Unlock all Story Chapters in Doomspire Act 1.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "DoomspireAct1StoryComplete",
			Amount = 1,
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Hidden = true,
				Cards = { ["Systems Collapse"] = 1 },
				Packs = { ["Doomspire-Foil"] = 3 },
				Sleeves = {},
				Ranks = { "<font color=\"#7f32a8\">Spire's Witness</font>" }
			}
		},
		BeatDoomspireAct2 = {
			Name = "[DS] Seen The End",
			Goal = "Complete Doomspire Act 2's story mode.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "ViewedVN_DS2_17",
			Amount = 1,
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Hidden = true,
				Cards = { ["MMMMDCCCLXXXIII. Finito"] = 1 },
				Packs = { ["Doomspire-Foil"] = 5 },
				Sleeves = {},
				Ranks = {}
			}
		},
		DekkadDelveQuest = {
			Name = "[DS] Rat In The Walls",
			Goal = "Ｄｅｃｉｐｈｅｒ． Ｄｅｌｖｅ． Ａｓｃｅｎｄ．",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_?????",
			Amount = 1,
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Hidden = true,
				Cards = { ["Dekkad Deckard"] = 1 },
				Packs = { ["Doomspire-Foil"] = 3 },
				Sleeves = {},
				Ranks = { "<font color=\"#7900a8\">Spiredelver</font>" }
			}
		},
		BeatDryad = {
			Name = "[TH] Wooden Warrior",
			Goal = "Defeat The Wanwood Dryad.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Wanwood Dryad",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 11,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { THC4 = 1 },
				Packs = { ["Temporal Halo"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatEris = {
			Name = "[TH] Only Skin Deep",
			Goal = "Defeat Erisyphia.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Erisyphia",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 12,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { THC1 = 1 },
				Packs = { ["Temporal Halo"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatGhas = {
			Name = "[TH] Guide of the Misguided",
			Goal = "Defeat Ghashendex.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Ghashendex",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 13,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { THC2 = 1 },
				Packs = { ["Temporal Halo"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatChroma = {
			Name = "[TH] Sentry Down!",
			Goal = "Defeat Chromafex.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Chromafex",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 14,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { THC3 = 1 },
				Packs = { ["Temporal Halo"] = 3 },
				Sleeves = {},
				Ranks = {}
			}
		},
		BeatTemporalHalo = {
			Name = "[TH] Savior of 2x2",
			Goal = "Defeat all bosses in Temporal Halo.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = {
				BOT_WINS_Chromafex = 1,
				BOT_WINS_Ghashendex = 1,
				BOT_WINS_Erisyphia = 1,
				["BOT_WINS_Wanwood Dryad"] = 1
			},
			DefaultSort = 15,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = {},
				Packs = { ["Temporal Halo"] = 3 },
				Sleeves = {},
				Ranks = { "<font color=\"#00FFFF\">Savior</font>" }
			}
		},
		BeatAdreti = {
			Name = "[LI] Calm Against The Storm",
			Goal = "Defeat The Rageborne Archangel.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_Adreti, Rageborne's Judgment",
			Amount = 1,
			Requirement = "BeatBot",
			DefaultSort = 9,
			IsAddition = false,
			Rewards = {
				BloxBux = 2000,
				Cards = {},
				Packs = { ["Lunar Impact"] = 3 },
				Sleeves = {},
				Ranks = { "<font color=\"#FF0000\">Rageborne</font>" }
			}
		},
		CTComplete = {
			Name = "[NS] City Trekker",
			Goal = "Complete a successful run of City Trek.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = { "City Trekker" }
			}
		},
		CTCompleteAll = {
			Name = "[NS] City Traveller",
			Goal = "Complete a successful run of City Trek as every character.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = {
				["Run_City Trek_RunsCompleted_McKayla"] = 1,
				["Run_City Trek_RunsCompleted_Astarossa"] = 1,
				["Run_City Trek_RunsCompleted_Kingrin"] = 1,
				["Run_City Trek_RunsCompleted_Fl00fy_Bonez"] = 1,
				["Run_City Trek_RunsCompleted_Caitlin"] = 1,
				["Run_City Trek_RunsCompleted_Apollo"] = 1
			},
			DefaultSort = 1,
			IsAddition = false,
			Requirement = "CTComplete",
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "<stroke color=\"#032609\" joins=\"miter\" thickness=\"2\" transparency=\"0.4\"><font color =\"#46d61e\" >City Trekker</font></stroke>" }
			}
		},
		CTCompleteAllHard = {
			Name = "[NS] City's Champion",
			Goal = "Complete a successful run of City Trek as every character on Hardmode.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = {
				["Run_City Trek_RunsCompletedHardcore_McKayla"] = 1,
				["Run_City Trek_RunsCompletedHardcore_Astarossa"] = 1,
				["Run_City Trek_RunsCompletedHardcore_Kingrin"] = 1,
				["Run_City Trek_RunsCompletedHardcore_Fl00fy_Bonez"] = 1,
				["Run_City Trek_RunsCompletedHardcore_Caitlin"] = 1,
				["Run_City Trek_RunsCompletedHardcore_Apollo"] = 1
			},
			DefaultSort = 2,
			IsAddition = false,
			Requirement = "CTCompleteHard",
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Necrosyndicates-Foil"] = 2 },
				Sleeves = {},
				Ranks = { "<stroke color=\"#032609\" joins=\"miter\" thickness=\"2\" transparency=\"0.4\"><font color =\"#46d61e\" >City Conqueror</font></stroke>" }
			}
		},
		CTLose = {
			Name = "[NS] Ate Pavement",
			Goal = "Lose a run of City Trek.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "Run_City Trek_RunsLost",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 50,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteMckayla = {
			Name = "[NS] City Liberator",
			Goal = "Complete a successful run of City Trek as McKayla.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_McKayla",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteAstarossa = {
			Name = "[NS] City Stroll",
			Goal = "Complete a successful run of City Trek as Astarossa.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_Astarossa",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteKingrin = {
			Name = "[NS] City's Familey",
			Goal = "Complete a successful run of City Trek as Kingrin.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_Kingrin",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteFl00fy_Bonez = {
			Name = "[NS] City Party Animal",
			Goal = "Complete a successful run of City Trek as Fl00fy_Bonez.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_Fl00fy_Bonez",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteCaitlin = {
			Name = "[NS] City Arkhivist",
			Goal = "Complete a successful run of City Trek as Caitlin.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_Caitlin",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteApollo = {
			Name = "[NS] City Innovator",
			Goal = "Complete a successful run of City Trek as Apollo.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted_Apollo",
			Requirement = "CTComplete",
			Amount = 1,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteHard = {
			Name = "[NS] City Conqueror",
			Goal = "Complete a successful run of City Trek on Hardmode.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 3 },
				Sleeves = {},
				Ranks = { "City Conqueror" }
			}
		},
		CTCompleteMckaylaHard = {
			Name = "[NS] Leader of Liberation",
			Goal = "Complete a successful run of City Trek on Hardmode as McKayla.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_McKayla",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteAstarossaHard = {
			Name = "[NS] Leader of Faith",
			Goal = "Complete a successful run of City Trek on Hardmode as Astarossa.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_Astarossa",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteKingrinHard = {
			Name = "[NS] Leader of The Familey",
			Goal = "Complete a successful run of City Trek on Hardmode as Kingrin.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_Kingrin",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteFl00fy_BonezHard = {
			Name = "[NS] Leader of Bliss",
			Goal = "Complete a successful run of City Trek on Hardmode as Fl00fy_Bonez.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_Fl00fy_Bonez",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteCaitlinHard = {
			Name = "[NS] Leader of The Arkhive",
			Goal = "Complete a successful run of City Trek on Hardmode as Caitlin.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_Caitlin",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteApolloHard = {
			Name = "[NS] Leader of Ingenuity",
			Goal = "Complete a successful run of City Trek on Hardmode as Apollo.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompletedHardcore_Apollo",
			Requirement = "CTCompleteHard",
			Amount = 1,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteEncounters = {
			Name = "[NS] A Chance Encounter",
			Goal = "Complete 10 Encounters in City Trek.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_EncountersDefeated",
			Amount = 10,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTCompleteEncounters2 = {
			Name = "[NS] Brawl In The City",
			Goal = "Complete 100 Encounters in City Trek.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "Run_City Trek_EncountersDefeated",
			Requirement = "CTCompleteEncounters",
			Amount = 100,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		CTPhotoSecret = {
			Name = "[NS] Professional Photographer",
			Goal = "Take a picture of something Substantial in City Trek.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "Run_City Trek_PhotoDelivered",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = { "Professional Photographer" }
			}
		},
		CTDroneSecret = {
			Name = "[NS] Drone Delivery",
			Goal = "Rescue the lost Drone in City Trek.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "Run_City Trek_DroneSaved",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = { "Drone Buddy" }
			}
		},
		CTRecruitTheKiller = {
			Name = "[NS] Murder Pals",
			Goal = "Recruit The Killer.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "Run_City Trek_RecruitTheKiller",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 2 },
				Sleeves = {},
				Ranks = { "Me and Bestie" }
			}
		},
		CT6Exhausted = {
			Name = "[NS] Mistakes Were Made",
			Goal = "Obtain 3 treasures from a single NeFoCo Warehouse.",
			Difficulty = "Easy",
			Type = "Objective",
			Stat = "Run_City Trek_6Exhausted",
			Amount = 1,
			DefaultSort = 3,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { Necrosyndicates = 1 },
				Sleeves = {},
				Ranks = { "I clicked Sure 3 times." }
			}
		},
		BotDuelists1 = {
			Name = "Duelist Devil",
			Goal = "Accept the Duelist Devil's quest!",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "NPCQuestDuelistDevil",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				Ranks = { "It's time to D-D-D-D-Duel!" }
			}
		},
		BotDuelists2 = {
			Name = "Mysterious Opponents",
			Goal = "Defeat the 9 hidden bots in queue.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = {
				BOT_WINS_QueueBotAC = 1,
				BOT_WINS_QueueBotB = 1,
				BOT_WINS_QueueBotBG = 1,
				BOT_WINS_QueueBotG = 1,
				BOT_WINS_QueueBotR = 1,
				BOT_WINS_QueueBotR2 = 1,
				BOT_WINS_QueueBotRY = 1,
				BOT_WINS_QueueBotY1 = 1,
				BOT_WINS_QueueBotY2 = 1
			},
			Amount = 1,
			Requirement = "BotDuelists1",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 1000,
				Ranks = {
					"Thrall to a Higher Will",
					"Slow and Steady",
					"Friendly",
					"Hail Redcliff!",
					"The Razor",
					"Burning",
					"Yellow Duelist Supreme",
					"All In",
					"Scrub Killer"
				}
			}
		},
		BotDuelists3 = {
			Name = "Throwdown Showdown",
			Goal = "Defeat the duelists who beat the Duelist Devil!",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = {
				BOT_WINS_EdgeTheTimelord = 1,
				BOT_WINS_weepiewoop = 1,
				BOT_WINS_Spicy316 = 1,
				BOT_WINS_BuffGains = 1,
				BOT_WINS_RichardTheKing = 1,
				BOT_WINS_Xeal = 1,
				BOT_WINS_Stars321 = 1,
				BOT_WINS_JimmyTheGamer = 1,
				BOT_WINS_Cultist = 1
			},
			Amount = 1,
			Requirement = "BotDuelists2",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 1500,
				Ranks = {
					"Thine True Razor",
					"that meebly beebly",
					"Chill like Chili",
					"OH YEAAAHHHHHH",
					"Truth of Legend",
					"I am better than you in every possible facet.",
					"fermented wheat bun",
					"the One true bacon",
					"Exalted"
				},
				Stat = { NPCQuestQueueBot = 1 }
			}
		},
		BeatRoundy = {
			Name = "Monster Slayer",
			Goal = "Defeate Roundy.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { BOT_WINS_act1_Blockhead = 1 },
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Packs = { ["Ultimate Power"] = 2 }
			}
		},
		BeatNoobloxxer = {
			Name = "Pwned",
			Goal = "Defeate Noobloxxer.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { BOT_WINS_act1_Noobloxxer = 1 },
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Packs = { ["Ultimate Power"] = 2 }
			}
		},
		BeatShadowslayer = {
			Name = "Shadows Slain",
			Goal = "Defeate xxshadowslayerxx.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { BOT_WINS_act1_xxshadowslayerxx = 1 },
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Packs = { ["Ultimate Power"] = 2 }
			}
		},
		PuzzleMaster = {
			Name = "Brain Melter",
			Goal = "Find and talk to the mysterious Puzzle Master",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "NPCQuestPuzzleMaster",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				Ranks = { "i really loik puzzles baybee" }
			}
		},
		ColosseumDevil = {
			Name = "Bloodstained",
			Goal = "Find and talk to the obnoxious Colosseum Devil",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "NPCQuestColosseumDevil",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				Ranks = { "Get your game on!" }
			}
		}
	},
	Seasonals = {
		Summer2026Wins = {
			Name = "Summer Challenger",
			Goal = "Win 10 matches during the Summer event.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "GamesWonSummer2026",
			Amount = 10,
			Requirement = nil,
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Summer Salt"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Summer2026Wins2 = {
			Name = "Summer Warrior",
			Goal = "Win 25 matches during the Summer event.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "GamesWonSummer2026",
			Amount = 25,
			Requirement = "Summer2026Wins",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Summer Salt"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		Summer2026Wins3 = {
			Name = "Summer Champion",
			Goal = "Win 50 matches during the Summer event.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "GamesWonSummer2026",
			Amount = 50,
			Requirement = "Summer2026Wins2",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Summer Salt-Foil"] = 1 },
				Sleeves = {},
				Ranks = { "Sunburned" }
			}
		},
		["2026HallowWins"] = {
			Name = "Trick or Treater",
			Goal = "Win 10 matches during the Halloween event.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "GamesWonHalloween2026",
			Amount = 10,
			Requirement = nil,
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Hallow's Tales"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		["2026HallowWins2"] = {
			Name = "Spooked",
			Goal = "Win 25 matches during the Halloween event.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "GamesWonHalloween2026",
			Amount = 25,
			Requirement = "2026HallowWins",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Hallow's Tales"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		["2026HallowWins3"] = {
			Name = "Candy Collector",
			Goal = "Win 50 matches during the Halloween event.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "GamesWonHalloween2026",
			Amount = 50,
			Requirement = "2026HallowWins2",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Hallow's Tales"] = 1 },
				Sleeves = {},
				Ranks = { "Candy Collector" }
			}
		},
		["2026HallowWins4"] = {
			Name = "Lord Of The Hallow",
			Goal = "Win 100 matches during the Halloween event.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "GamesWonHalloween2026",
			Amount = 100,
			Requirement = "2026HallowWins3",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Hallow's Tales-Foil"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		JoinDWFaction = {
			Name = "Drafted",
			Goal = "Join a Side in the faction war.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "JoinedDWFaction",
			Amount = 1,
			Requirement = nil,
			DefaultSort = 1,
			IsAddition = true,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		EarnDWCurrency1 = {
			Name = "Footsoldier",
			Goal = "Earn 25 points from battles during Demon War's Faction wars.",
			Difficulty = "Easy",
			Type = "Scalar",
			Stat = "DWCurrencyEarned",
			Amount = 25,
			Requirement = "JoinDWFaction",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Demon Wars"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		EarnDWCurrency2 = {
			Name = "Dependable Squire",
			Goal = "Earn 100 points from battles during Demon War's Faction wars.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "DWCurrencyEarned",
			Amount = 100,
			Requirement = "EarnDWCurrency1",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Demon Wars"] = 2 },
				Sleeves = {},
				Ranks = {}
			}
		},
		EarnDWCurrency3 = {
			Name = "Earl of Demons",
			Goal = "Earn 1,000 points from battles during Demon War's Faction wars.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "DWCurrencyEarned",
			Amount = 1000,
			Requirement = "EarnDWCurrency2",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Demon Wars"] = 5 },
				Sleeves = {},
				Ranks = {}
			}
		},
		EarnDWCurrency4 = {
			Name = "Warmonger",
			Goal = "Earn 5,000 points from battles during Demon War's Faction wars.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "DWCurrencyEarned",
			Amount = 5000,
			Requirement = "EarnDWCurrency3",
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Demon Wars-Foil"] = 1 },
				Sleeves = {},
				Ranks = {}
			}
		},
		EarnDWCurrency5 = {
			Name = "Elder Demon",
			Goal = "Earn 10,000 points from battles during Demon War's Faction wars.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "DWCurrencyEarned",
			Amount = 10000,
			DefaultSort = 6,
			IsAddition = true,
			Rewards = {
				BloxBux = 0,
				Cards = {},
				Packs = { ["Demon Wars-Foil"] = 5 },
				Sleeves = {},
				Ranks = { "<font color=\"#022058\">Elder Demon</font>" }
			}
		}
	},
	Metaverse = {
		Lostern = {
			Name = "Full House",
			Goal = "Cast a card while having a full hand 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastFromFullHand",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Losternmeyer = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LosternFoil = {
			Name = "Lost Among Many",
			Goal = "Cast 'Losternmeyer' 50 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TimesCastLosternmeyer",
			Amount = 50,
			Requirement = "Lostern",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Losternmeyer-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JackanFor = {
			Name = "Jack and the Greenstalk",
			Goal = "Have effects give you 50 cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "AddedCards",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { JackanFor = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JackanForFoil = {
			Name = "Bountiful Cardvest",
			Goal = "Have effects give you 500 cards.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "AddedCards",
			Amount = 500,
			Requirement = "JackanFor",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["JackanFor-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Fluffle = {
			Name = "Thawed out",
			Goal = "Lock allied fighters with effects 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "EffectLockAllies",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Fluffle = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		FluffleFoil = {
			Name = "World's Fastest Deer",
			Goal = "Lock Allied fighters with effects 500 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "EffectLockAllies",
			Amount = 500,
			Requirement = "Fluffle",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Fluffle-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Unc, At The End"] = {
			Name = "The Power of Uncreativity",
			Goal = "Deal 12,300 damage to targeted fighters using effects.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TargetEffectDamage",
			Amount = 12300,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, At The End"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Unc, At The EndFoil"] = {
			Name = "Master Of Uncreation",
			Goal = "Deal 123,000 damage to targeted fighters using effects.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "TargetEffectDamage",
			Amount = 123000,
			Requirement = "Unc, At The End",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, At The End-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		TheVoid_00f = {
			Name = "Icon of Void",
			Goal = "Generate studs using effects 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "GeneratedStuds",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["TheVoid_00f Commission"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		TheVoid_00fFoil = {
			Name = "The Best Generation",
			Goal = "Generate studs using effects 1,000 times.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "GeneratedStuds",
			Amount = 1000,
			Requirement = "TheVoid_00f",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["TheVoid_00f Commission-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		MouthKala = {
			Name = "Kala's Chosen",
			Goal = "Have 500 Allied fighters die across games.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "OwnCardsDied",
			Amount = 500,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Mouth of Kala"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		MouthKalaFoil = {
			Name = "It's Okay, They're Just Paper.",
			Goal = "Have 10,000 Allied fighters die across games.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "OwnCardsDied",
			Amount = 10000,
			Requirement = "MouthKala",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Mouth of Kala-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		AviaChipQuest = {
			Name = "Warrior's Spirit",
			Goal = "Attack with Fighters 500 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesAttacked",
			Amount = 500,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { AviaChipLuna = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		AviaChipFoilQuest = {
			Name = "Unlimited Fighting Energy",
			Goal = "Attack with Fighters 10,000 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesAttacked",
			Amount = 10000,
			Requirement = "AviaChipQuest",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["AviaChipLuna-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Pikucho = {
			Name = "Mini Card Roulette",
			Goal = "Cast Happy Clown 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastHappy Clown",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { xXdespayeetoXx = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		PikuchoFoil = {
			Name = "Mega Card Roulette",
			Goal = "Cast Pikucho_de 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastxXdespayeetoXx",
			Amount = 100,
			Requirement = "Pikucho",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["xXdespayeetoXx-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Speen = {
			Name = "Master Of The Minions",
			Goal = "Summon Fighters via effects 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "FightersSummoned",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { SpeenChannel = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SpeenFoil = {
			Name = "Super King Grand Overlord Supreme Of The Minions",
			Goal = "Summon Fighters via effects 5,000 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "FightersSummoned",
			Amount = 5000,
			Requirement = "Speen",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SpeenChannel-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BucketWarrior = {
			Name = "Robot Revolution",
			Goal = "Cast Robot 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastRobot",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["BucketWarriors, Robot Overlord"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BucketWarriorFoil = {
			Name = "The Undying Machine",
			Goal = "Trigger BucketWarriors, Robot Overlord's Effect 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BucketWarriorsTriggers",
			Amount = 20,
			Requirement = "BucketWarrior",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["BucketWarriors, Robot Overlord-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Chanler = {
			Name = "Mosquito Swatter",
			Goal = "Have fighters attack and destroy 50 Token fighters.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TokensAttackDestroyed",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Chanler16 = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ChanlerFoil = {
			Name = "The Good, The Bad, And The Chanler",
			Goal = "Have 300 Copies of Chanler16, Good Chan and Evil Chan be destroyed across games.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "ChanlerCardsDied",
			Amount = 300,
			Requirement = "Chanler",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Chanler16-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ScribeOfEpochs = {
			Name = "Writer Of The Common Man",
			Goal = "Cast 100 Common Cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedCommonCards",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, Scribe of Epochs"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ScribeOfEpochsFoil = {
			Name = "Writer Of Uncommon Events",
			Goal = "Cast 300 Uncommon Cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedUncommonCards",
			Amount = 300,
			Requirement = "ScribeOfEpochs",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, Scribe of Epochs-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Salvation = {
			Name = "Honeymoon Gifts",
			Goal = "Add 6 or more cards to your hand in a single turn through effects 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "6OrMoreAddedCards",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Salvation = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SalvationFoil = {
			Name = "Okay This Is Too Many Gifts Please Help",
			Goal = "Add 6 or more cards to your hand in a single turn through effects 100 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "6OrMoreAddedCards",
			Amount = 100,
			Requirement = "Salvation",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Salvation-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ChairLord = {
			Name = "Take a seat!",
			Goal = "Cast 50 Chair cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeChair",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Master of Chairs"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ChairLordFoil = {
			Name = "The Chairman",
			Goal = "Cast 500 Chair cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastArchetypeChair",
			Amount = 500,
			Requirement = "ChairLord",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Master of Chairs-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RichMcMoney = {
			Name = "Feeder Of Developers",
			Goal = "Cast 60 Cash Grabs.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeCash Grab",
			Amount = 60,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Rich McMoneybags"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RichMcMoneyFoil = {
			Name = "CEO Of Money",
			Goal = "Cast 600 Cash Grabs.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastArchetypeCash Grab",
			Amount = 600,
			Requirement = "RichMcMoney",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Rich McMoneybags-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LastFluffle = {
			Name = "Ascent To Godhood",
			Goal = "Reach Max Level on Chiefjustus.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "MaxJustus",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Last Flufflefunz"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LastFluffleFoil = {
			Name = "Descent To Madness",
			Goal = "Attack and Destroy 50 fighters with The Freest Flufflefunz.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "FreestFluffleAttackDestroys",
			Amount = 50,
			Requirement = "LastFluffle",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Last Flufflefunz-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ChipTrone = {
			Name = "Power Struggle",
			Goal = "Increase a fighter's power beyond 3000 power.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "BuffPowerAbove3000",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ChipTrone = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		ChipTroneFoil = {
			Name = "Stronger Of The Two?",
			Goal = "Increase 10 fighter's power beyond 3000 power.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "BuffPowerAbove3000",
			Amount = 10,
			Requirement = "ChipTrone",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["ChipTrone-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SentGraf = {
			Name = "Graveyard Shift",
			Goal = "Reach 40 cards in your graveyard in a single game.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "40Grave",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["unadapt-ONE & Shadow Sentrum1"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SentGrafFoil = {
			Name = "Knee Deep In The Grave",
			Goal = "Reach 80 cards in your graveyard in a single game.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = "80Grave",
			Amount = 1,
			Requirement = "SentGraf",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["unadapt-ONE & Shadow Sentrum1-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		UncConsult = {
			Name = "Imposter Syndrome",
			Goal = "Summon copies of fighters 30 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CopySummons",
			Amount = 30,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, The Consultant"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["UncConsult-Foil"] = {
			Name = "Do Not Take This Quest If You Suffer From These Conditions:",
			Goal = "Summon copies of fighters 300 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CopySummons",
			Amount = 300,
			Requirement = "UncConsult",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, The Consultant-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Miles = {
			Name = "Miles Per Hour",
			Goal = "Draw 10 cards in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "10AllyDraw",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Miles = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Miles-Foil"] = {
			Name = "Now You're Thinking With Tunnels",
			Goal = "Draw 20 cards in a single turn.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "20AllyDraw",
			Amount = 1,
			Requirement = "Miles",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Miles-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		TerraLex = {
			Name = "Going Green",
			Goal = "Give yourself 20 cards in a single duel.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "20AddsInDuel",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { TerraLex = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["TerraLex-Foil"] = {
			Name = "Overgrowth",
			Goal = "Give yourself 60 cards in a single duel.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "60AddsInDuel",
			Amount = 1,
			Requirement = "TerraLex",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["TerraLex-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		RobloxServers = {
			Name = "Bane Of Developers",
			Goal = "Cast the Corrupted Burrito.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastCorrupted Burrito",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Roblox's Servers"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["RobloxServers-Foil"] = {
			Name = "Just Your Average Saturday",
			Goal = "Cast the Corrupted Burrito 10 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastCorrupted Burrito",
			Amount = 10,
			Requirement = "RobloxServers",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Roblox's Servers-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		PuyoSiang = {
			Name = "Color Lord Supreme",
			Goal = "Put 400 cards into your baseplate.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "BaseplatedCards",
			Amount = 400,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { PuyoSiang = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["PuyoSiang-Foil"] = {
			Name = "Grand Rabbit Caster",
			Goal = "Put 4444 cards into your baseplate.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "BaseplatedCards",
			Amount = 4444,
			Requirement = "PuyoSiang",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["PuyoSiang-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		FreakyFriday = {
			Name = "Hijinks Ensue",
			Goal = "Cast Hallow's Bargain 30 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastHallow's Bargain",
			Amount = 30,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Freaky Friday"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["FreakyFriday-Foil"] = {
			Name = "Freaky Fever",
			Goal = "Summon 1337 fighters",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "FightersSummoned",
			Amount = 1337,
			Requirement = "FreakyFriday",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Freaky Friday-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		DeersconnectedFromReality = {
			Name = "Lost In The Pile",
			Goal = "Shuffle 100 cards into your deck.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsShuffled",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Deersconnected From Reality"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["DeersconnectedFromReality-Foil"] = {
			Name = "800 Card Pickup",
			Goal = "Shuffle 800 cards into your deck.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardsShuffled",
			Amount = 800,
			Requirement = "DeersconnectedFromReality",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Deersconnected From Reality-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Axle = {
			Name = "Tunnel Tester",
			Goal = "Return fighters with effects 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsReturned",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Axle = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Axle-Foil"] = {
			Name = "This Is The Part Where He Returns You",
			Goal = "Return fighters with effects 200 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardsReturned",
			Amount = 200,
			Requirement = "Axle",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Axle-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Vaporwave = {
			Name = "Empty Aesthetic",
			Goal = "Have 8 or more colored Actions in your Baseplate in a single match.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "8ActionsBaseplated",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Vaporwave Plaza"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Vaporwave-Foil"] = {
			Name = "Ascendance",
			Goal = "Have 8 or more Terrains in your Baseplate in a single match.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "8TerrainsBaseplated",
			Amount = 1,
			Requirement = "Vaporwave",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Vaporwave Plaza-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JulezPerfection = {
			Name = "Perfect Skin",
			Goal = "Cast 30 Anthrest Cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastArchetypeAnthrest",
			Amount = 30,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez, Seeker of Perfection"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["JulezPerfection-Foil"] = {
			Name = "Adjacent To Perfection",
			Goal = "Have effects target Adjacent fighters 30 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "AdjacentFieldTargetting",
			Amount = 30,
			Requirement = "JulezPerfection",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez, Seeker of Perfection-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Crossover Arena Quest"] = {
			Name = "The Ultimate Crossover",
			Goal = "Cast a Redcliff, Korblox, Overseer, Doge, Lycanthrope, Police, Meeboid and Toy card.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = {
				TimesCastArchetypeDoge = 1,
				TimesCastArchetypeKorblox = 1,
				TimesCastArchetypeRedcliff = 1,
				TimesCastArchetypeOverseer = 1,
				TimesCastArchetypeMeeboid = 1,
				TimesCastArchetypeToy = 1,
				TimesCastArchetypePolice = 1,
				TimesCastArchetypeLycanthrope = 1
			},
			Requirement = "RLevel7",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Crossover Arena"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Crossover Arena-Foil"] = {
			Name = "Of Ultimate Destiny",
			Goal = "Cast 20 Redcliff, Korblox, Overseer, Doge, Lycanthrope, Police, Meeboid and Toy cards.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = {
				TimesCastArchetypeDoge = 20,
				TimesCastArchetypeKorblox = 20,
				TimesCastArchetypeRedcliff = 20,
				TimesCastArchetypeOverseer = 20,
				TimesCastArchetypeMeeboid = 20,
				TimesCastArchetypeToy = 20,
				TimesCastArchetypePolice = 20,
				TimesCastArchetypeLycanthrope = 20
			},
			Requirement = "Crossover Arena Quest",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Crossover Arena-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		NNickel = {
			Name = "Cross Commander",
			Goal = "Cast a Ninja, Alar, Sinister and Infurnished card.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = {
				TimesCastArchetypeNinja = 1,
				TimesCastArchetypeAlar = 1,
				TimesCastArchetypeSinister = 1,
				TimesCastArchetypeInfurnished = 1
			},
			Requirement = "RLevel7",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { NNickel = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["NNickel-Foil"] = {
			Name = "Collaborative Effort",
			Goal = "Cast 20 Ninja, Alar, Sinister and Infurnished cards.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = {
				TimesCastArchetypeNinja = 20,
				TimesCastArchetypeAlar = 20,
				TimesCastArchetypeSinister = 20,
				TimesCastArchetypeInfurnished = 20
			},
			Requirement = "NNickel",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["NNickel-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Solomon = {
			Name = "Burn Bright Like A",
			Goal = "Cast Frozen Phoenix and Burning Phoenix.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { ["TimesCastFrozen Phoenix"] = 1, ["TimesCastBurning Phoenix"] = 1 },
			Requirement = "RLevel7",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Solomon, the Phoenix Whisperer"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Solomon-Foil"] = {
			Name = "Legends Reborn",
			Goal = "Cast 200 Epic and 200 Legendary cards.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { CastedEpicCards = 200, CastedLegendaryCards = 200 },
			Requirement = "Solomon",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Solomon, the Phoenix Whisperer-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SirVenon2 = {
			Name = "Worm Food",
			Goal = "Have Effects cause your opponent to lose life 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "LifeDamageTriggers",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SirVenon the Golden"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["SirVenon-Foil2"] = {
			Name = "Gilded Worm Food",
			Goal = "Have Effects cause your opponent to lose life 300 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "LifeDamageTriggers",
			Amount = 300,
			Requirement = "SirVenon2",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SirVenon the Golden-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Ethyrias = {
			Name = "Titanic Creations",
			Goal = "Add Titanic Studs to your hand 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TitanicStudAdds",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Ethyrias = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Ethyrias-Foil"] = {
			Name = "Fluff's Best Friend",
			Goal = "Add Titanic Studs to your hand 500 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TitanicStudAdds",
			Amount = 500,
			Requirement = "Ethyrias",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Ethyrias-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Mind Of Fluffle"] = {
			Name = "Looking To The Moon",
			Goal = "Cast 10 Moonleaks.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastMoonleak",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Inside The Mind of Fluffle"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Mind Of Fluffle-Foil"] = {
			Name = "Absolute Insanity",
			Goal = "Cast 100 Moonleaks.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastMoonleak",
			Amount = 100,
			Requirement = "Mind Of Fluffle",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Inside The Mind of Fluffle-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Quackhead tige1111"] = {
			Name = "Ducks In A Line",
			Goal = "Add 20 Ducks to your hand.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesAddedArchetypeRubber Duck",
			Amount = 20,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Quackhead tige1111"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Quackhead tige1111-Foil"] = {
			Name = "Average Duck Enjoyer",
			Goal = "Add 200 Ducks to your hand.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesAddedArchetypeRubber Duck",
			Amount = 200,
			Requirement = "Quackhead tige1111",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Quackhead tige1111-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		BruhGang = {
			Name = "Bruh Moment",
			Goal = "Cast 200 Epic cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedEpicCards",
			Amount = 200,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["De Bruh Gang"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["BruhGang-Foil"] = {
			Name = "Live Legendary Cast Reaction",
			Goal = "Cast 200 Legendary cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedLegendaryCards",
			Amount = 200,
			Requirement = "BruhGang",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["De Bruh Gang-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SpeenEXE = {
			Name = "Hacked By Not SoulSearch",
			Goal = "Transform fighters 200 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TransformedFighters",
			Amount = 200,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SpeenChannel.EXE"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["SpeenEXE-Foil"] = {
			Name = "The Creepiest Pasta",
			Goal = "Transform fighters 400 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TransformedFighters",
			Amount = 400,
			Requirement = "SpeenEXE",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SpeenChannel.EXE-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Razar = {
			Name = "False Historian",
			Goal = "Open 1000 packs",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardPacksOpened",
			Amount = 1000,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Razar, Rebel Revel Devil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Razar-Foil"] = {
			Name = "Rewriten History",
			Goal = "Open 10000 packs",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardPacksOpened",
			Amount = 10000,
			Requirement = "Razar",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Razar, Rebel Revel Devil-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Iris Luna"] = {
			Name = "Power Of A Studmaster!",
			Goal = "Cast a card of each color in a single turn",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RainbowCastInTurn",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Iris, Imperishable Rainbow"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Iris Luna-Foil"] = {
			Name = "Colors Of The Rainbow",
			Goal = "Cast a card of each color in a single turn 10 times",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "RainbowCastInTurn",
			Amount = 10,
			Requirement = "Iris Luna",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Iris, Imperishable Rainbow-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Wacky Fluffle"] = {
			Name = "Funny Cat Enjoyer",
			Goal = "Destroy fighters with effects that destroy fighters with 0 power 50 times",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "Destroyed0Powers",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Wacky and Uncharacteristic Flufflefunz"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Wacky Fluffle-Foil"] = {
			Name = "Get Dusted",
			Goal = "Destroy fighters with effects that destroy fighters with 0 power 500 times",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "Destroyed0Powers",
			Amount = 500,
			Requirement = "Wacky Fluffle",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Wacky and Uncharacteristic Flufflefunz-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Snubcube = {
			Name = "Costly Caster",
			Goal = "Cast fighters that cost 4 total studs 200 times",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastCardCost4",
			Amount = 200,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["snubcube-Luna"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Snubcube-Foil"] = {
			Name = "Seeing NStars",
			Goal = "Cast fighters that cost 4 total studs 600 times",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesCastCardCost4",
			Amount = 600,
			Requirement = "Snubcube",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["snubcube-Luna-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JulezRebel = {
			Name = "Discarded Fate",
			Goal = "Discard 500 cards",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsDiscarded",
			Amount = 500,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Rebel of Wickedness"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["JulezRebel-Foil"] = {
			Name = "Duckstorm",
			Goal = "Discard 2000 cards",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardsDiscarded",
			Amount = 2000,
			Requirement = "JulezRebel",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Rebel of Wickedness-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Delegation = {
			Name = "Shuffled Stories",
			Goal = "Shuffle cards into decks 200 times",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CardsShuffled",
			Amount = 200,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, Unheard Unknown Intern"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Delegation-Foil"] = {
			Name = "Bearer Of Buried Secrets",
			Goal = "Shuffle cards into decks 400 times",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CardsShuffled",
			Amount = 400,
			Requirement = "Delegation",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unc, Unheard Unknown Intern-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Starseeker = {
			Name = "Astrologian",
			Goal = "Search cards from your deck 60 times",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesTutored",
			Amount = 60,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Starseeker Jojobinks"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Starseeker-Foil"] = {
			Name = "When The Stars Align",
			Goal = "Search cards from your deck 250 times",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesTutored",
			Amount = 250,
			Requirement = "Starseeker",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Starseeker Jojobinks-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Scroom = {
			Name = "Into The Grave",
			Goal = "Cast 100 Colourless Cards",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedNeutralCards",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SCR0OM-Luna"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Scroom-Foil"] = {
			Name = "Studs From Below",
			Goal = "Cast 500 Colourless Cards",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedNeutralCards",
			Amount = 500,
			Requirement = "Scroom",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SCR0OM-Luna-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Sinz = {
			Name = "Nightmarish",
			Goal = "Cast 50 Token Actions",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedTokenActionCards",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Nah'rack Sinz"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Sinz-Foil"] = {
			Name = "Egotist's Apprentice",
			Goal = "Cast 200 Token Actions",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedTokenActionCards",
			Amount = 200,
			Requirement = "Sinz",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Nah'rack Sinz-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Dustin = {
			Name = "welcome to the v...",
			Goal = "Suspend 6 fighters in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "6SuspendInTurn",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Dustin = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Dustin-Foil"] = {
			Name = "oid",
			Goal = "Suspend 6 fighters in a single turn 10 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "6SuspendInTurn",
			Amount = 10,
			Requirement = "Dustin",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dustin-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		AbyssBarons = {
			Name = "Conspiciunt In Abyssum",
			Goal = "Obliterate 10 or more cards in your graveyard in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "10Obliterates",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Abyss Barons"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["AbyssBarons-Foil"] = {
			Name = "Abyssus Aspicit Retro",
			Goal = "Obliterate 10 or more cards in your graveyard in a single turn 10 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "10Obliterates",
			Amount = 10,
			Requirement = "AbyssBarons",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Abyss Barons-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		DairingCrit = {
			Name = "Just Get Lucky",
			Goal = "Complete this quest randomly when an allied fighter deals combat damage",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "RandomAttack",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Critical Hero"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["DairingCrit-Foil"] = {
			Name = "Believe In The RNG",
			Goal = "Land 100 Critical hits.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CritHits",
			Amount = 100,
			Requirement = "DairingCrit",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Critical Hero-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Shattering = {
			Name = "Smash and Grab",
			Goal = "Cast 100 Actions that cost 6 or more total studs.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "Casted6orMoreCostActionCards",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Absolute Shattering"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Shattering-Foil"] = {
			Name = "In Pieces",
			Goal = "Cast 400 Actions that cost 6 or more total studs.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "Casted6orMoreCostActionCards",
			Amount = 400,
			Requirement = "Shattering",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Absolute Shattering-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Mac Iris"] = {
			Name = "Corporate Uprising",
			Goal = "Cast Iris, Master of Studs.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesCastHighlanderW",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Mac Iris"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Mac Iris-Foil"] = {
			Name = "Fan Meetup",
			Goal = "Defeat Iris Fangirl with Iris, Master Of Studs in your deck.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "BeatFangirlWithIris",
			Amount = 1,
			Requirement = "Mac Iris",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Mac Iris-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		StrifeLorekeeper = {
			Name = "War Enthusiast",
			Goal = "Cast 200 cards from Strife's Arsenal",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedStrife's ArsenalCards",
			Amount = 200,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Lorekeeper of Strife"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["StrifeLorekeeper-Foil"] = {
			Name = "Veteran Of Strife",
			Goal = "Cast 600 cards from Strife's Arsenal",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "CastedStrife's ArsenalCards",
			Amount = 600,
			Requirement = "StrifeLorekeeper",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Lorekeeper of Strife-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SigSweeper = {
			Name = "Gotta Sweep!",
			Goal = "Ransack 100 cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Sig, Street Sweepin Savant"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["SigSweeper-Foil"] = {
			Name = "Clean Sweep",
			Goal = "Ransack 500 cards.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "TimesRansacked",
			Amount = 500,
			Requirement = "SigSweeper",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Sig, Street Sweepin Savant-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JulezTemperance = {
			Name = "Tempered Expectations",
			Goal = "Discard 2 cards in a single turn 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "DoubleDiscards",
			Amount = 10,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Creator of Temperance"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["JulezTemperance-Foil"] = {
			Name = "Multi-Discard Master",
			Goal = "Discard 2 cards in a single turn 100 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "DoubleDiscards",
			Amount = 100,
			Requirement = "JulezTemperance",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Creator of Temperance-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JojoCreditor2 = {
			Name = "Loan Shark",
			Goal = "Make your opponent draw cards 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "EnemyDraws",
			Amount = 20,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Jojobinks, Apex Creditor"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["JojoCreditor-Foil2"] = {
			Name = "Crippling Debt",
			Goal = "Make your opponent draw cards 200 times.",
			Difficulty = "Insane",
			Type = "Scalar",
			Stat = "EnemyDraws",
			Amount = 200,
			Requirement = "JojoCreditor2",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Jojobinks, Apex Creditor-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["The Uncommonwealth"] = {
			Name = "For The Common Man",
			Goal = "Cast 100 Common and 100 Uncommon cards",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { CastedUncommonCards = 100, CastedCommonCards = 100 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Uncommonwealth"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["The Uncommonwealth-Foil"] = {
			Name = "Uncommon Obsession",
			Goal = "Cast 500 Common and 500 Uncommon cards",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { CastedUncommonCards = 500, CastedCommonCards = 500 },
			Requirement = "The Uncommonwealth",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The Uncommonwealth-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Unworld = {
			Name = "Inverse The Reverse",
			Goal = "Reduce fighters power with effects 50 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { WeakenCard = 50 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Unworld = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Unworld-Foil"] = {
			Name = "Overwhelming Weakness",
			Goal = "Increase fighters power with effects 100 times.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { StrengthenCard = 100 },
			Requirement = "Unworld",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Unworld-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Cruizictant Veteran"] = {
			Name = "Marked For Demolition",
			Goal = "Mark fighters 50 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { MarkedFighters = 50 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Cruizictant Veteran"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Cruizictant Veteran-Foil"] = {
			Name = "Bomb Rush Cruizictant",
			Goal = "Mark fighters 200 times.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { MarkedFighters = 200 },
			Requirement = "Cruizictant Veteran",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Cruizictant Veteran-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Carl & Xhartyr - Galactic Explorers"] = {
			Name = "To Appraise The Blade",
			Goal = "Cast 10 fighters that cost four different colors.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { TimesCastRainbowCost = 10 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Carl & Xhartyr - Galactic Explorers"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Carl & Xhartyr - Galactic Explorers-Foil"] = {
			Name = "To Wield The Blade",
			Goal = "Cast 100 fighters that cost four different colors.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { TimesCastRainbowCost = 100 },
			Requirement = "Carl & Xhartyr - Galactic Explorers",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Carl & Xhartyr - Galactic Explorers-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Histor, Seeker of Wisdom"] = {
			Name = "Beyond The Deck",
			Goal = "Take Fatigue damage 10 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { TakeFatigue = 10 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Histor, Seeker of Wisdom"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Histor, Seeker of Wisdom-Foil"] = {
			Name = "Tired",
			Goal = "Take 1300 Fatigue damage at once.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { Take1300Fatigue = 1 },
			Requirement = "Histor, Seeker of Wisdom",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Histor, Seeker of Wisdom-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Very Peaceful and Reasonable Person"] = {
			Name = "Me When My Opponent Plays Cards",
			Goal = "Witness your opponents cast 200 cards.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { TimesOpponentCastCard = 200 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Very Peaceful and Reasonable Person"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Very Peaceful and Reasonable Person-Foil"] = {
			Name = "Unreasonably Angry Over This",
			Goal = "Witness your opponents cast 2000 cards.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { TimesOpponentCastCard = 2000 },
			Requirement = "Very Peaceful and Reasonable Person",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Very Peaceful and Reasonable Person-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Dairing of the Rift"] = {
			Name = "Suspension Of Belief",
			Goal = "Suspend cards 30 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { TimesSuspending = 30 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing of the Rift"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Dairing of the Rift-Foil"] = {
			Name = "Rift Apart",
			Goal = "Suspend cards 100 times.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { TimesSuspending = 100 },
			Requirement = "Dairing of the Rift",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing of the Rift-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		IrisStargazer = {
			Name = "The Dark Rainbow",
			Goal = "Destroy allied fighters with effects 20 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { TimesDestroyedAlly = 20 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Iris, Stargazer"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["IrisStargazer-Foil"] = {
			Name = "Universal Collapse",
			Goal = "Destroy allied fighters with effects 50 times.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { TimesDestroyedAlly = 50 },
			Requirement = "IrisStargazer",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Iris, Stargazer-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Arach = {
			Name = "Webspinner",
			Goal = "Lock enemy fighters with effects 50 times.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { EffectLockEnemies = 50 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Arach Vadis"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Arach-Foil"] = {
			Name = "Arachnophobia",
			Goal = "Lock enemy fighters with effects 200 times.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { EffectLockEnemies = 200 },
			Requirement = "Arach",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Arach Vadis-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		darkkyraki = {
			Name = "Viable Lifegain Deck (for them)",
			Goal = "Cause opponents to gain 3000 life across games.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = { OpponentLifegain = 3000 },
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { darkkyraki = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["darkkyraki-Foil"] = {
			Name = "You know the goal is to make their life 0, right?",
			Goal = "Cause opponents to gain 10000 life across games.",
			Difficulty = "Insane",
			Type = "Objective",
			Stat = { OpponentLifegain = 10000 },
			Requirement = "darkkyraki",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["darkkyraki-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		JulezParent = {
			Name = "Parental Supervision",
			Goal = "Discard 2 cards in a single turn 15 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "DoubleDiscards",
			Amount = 15,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Parent of Possibilities"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["JulezParent-Foil2"] = {
			Name = "Building Their Future",
			Goal = "Discard 2 cards in a single turn 150 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "DoubleDiscards",
			Amount = 150,
			Requirement = "JulezParent",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Julez - Parent of Possibilities-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		LordbreakersPrize = {
			Name = "The Newman Way",
			Goal = "Liberate a card 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesLiberated",
			Amount = 50,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { LordbreakersPrize = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		DairingSpeed = {
			Name = "Cataclysm",
			Goal = "Multiply a fighter's power above 10,000 power.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "MultipliedAbove10000",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing At The Speed Of Light"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["DairingSpeed-Foil"] = {
			Name = "BloodBath",
			Goal = "Multiply a fighter's power above 100,000 power.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "MultipliedAbove100000",
			Amount = 1,
			Requirement = "DairingSpeed",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing At The Speed Of Light-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		FluffleHouse = {
			Name = "The House Always Wins",
			Goal = "Cast exactly 7 cards in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "7ExactStorm",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The FluffleFunhouse"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["FluffleHouse-Foil"] = {
			Name = "Eat The Rich",
			Goal = "Cast exactly 7 cards in a single turn 7 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "7ExactStorm",
			Amount = 7,
			Requirement = "FluffleHouse",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["The FluffleFunhouse-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Disregardian = {
			Name = "The Mindset",
			Goal = "Obliterate 40 cards in one match.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "40TotalObliterates",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Disregardian = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Disregardian-Foil"] = {
			Name = "The Grindset",
			Goal = "Obliterate 80 cards in one match.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "80TotalObliterates",
			Amount = 1,
			Requirement = "Disregardian",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Disregardian-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		DairOp = {
			Name = "Small Adjustments",
			Goal = "Target cards with effects 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "EffectsTargeted",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Operation Evolution"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["DairOp-Foil"] = {
			Name = "Maximized Performance",
			Goal = "Target cards with effects 1000 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "EffectsTargeted",
			Amount = 1000,
			Requirement = "DairOp",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Dairing, Operation Evolution-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		SSSGraded = {
			Name = "Power In Numbers",
			Goal = "Cast 300 Fighter cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedFighterCards",
			Amount = 300,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { SSSGraded = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["SSSGraded-Foil"] = {
			Name = "Brute Force Brute",
			Goal = "Cast 1000 Fighter cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedFighterCards",
			Amount = 1000,
			Requirement = "SSSGraded",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["SSSGraded-Foil"] = 4 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Instinct = {
			Name = "Adapt.",
			Goal = "Heal cards with effects 100 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "HealCard",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Instinct = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Instinct-Foil"] = {
			Name = "Overcome.",
			Goal = "Heal cards with effects 400 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "HealCard",
			Amount = 400,
			Requirement = "Instinct",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Instinct-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Munch = {
			Name = "The Trolling Problem",
			Goal = "Cast 100 actions.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Munchhausen Trilemma"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Munch-Foil"] = {
			Name = "Everywhere Everytime All At Once",
			Goal = "Cast 500 actions.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "CastedActionCards",
			Amount = 500,
			Requirement = "Munch",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Munchhausen Trilemma-Foil"] = 2 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["snubccube & P1N_Z, Creator Curators"] = {
			Name = "Tokens of Appreciation",
			Goal = "Summon 30 Token Fighters.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "SummonedTokens",
			Amount = 30,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["snubccube & P1N_Z, Creator Curators"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["snubccube & P1N_Z, Creator Curators-Foil"] = {
			Name = "Creative Curations",
			Goal = "Summon 100 Token Fighters.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "SummonedTokens",
			Amount = 100,
			Requirement = "snubccube & P1N_Z, Creator Curators",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["snubccube & P1N_Z, Creator Curators-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Tacky = {
			Name = "Multi-Striker",
			Goal = "Attack with a fighter three times in one turn without it leaving the field.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TripleCardAttackInOneTurn",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Tacky = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Tacky-Foil"] = {
			Name = "Stop! Stop! He's already dead!",
			Goal = "Attack with a fighter five times in one turn without it leaving the field.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "5CardAttackInOneTurn",
			Amount = 1,
			Requirement = "Tacky",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Tacky-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Brutal Justice"] = {
			Name = "Make Justice Not War",
			Goal = "Seance 100 cards.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "TimesSeanced",
			Amount = 100,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Brutal Justice Mk.III"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		Rapport = {
			Name = "Quick Rally",
			Goal = "Cast fighters with haste 20 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "HasteCardsCast",
			Amount = 20,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { Rapport = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Rapport-Foil"] = {
			Name = "Speedy Signup",
			Goal = "Cast fighters with haste 50 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "HasteCardsCast",
			Amount = 50,
			Requirement = "Rapport",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Rapport-Foil"] = 3 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Fut_re, Ablaze"] = {
			Name = "Burning Passion",
			Goal = "Have 4 or more enemy fighters die in a single turn.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "4EnemyDeathsInTurn",
			Amount = 1,
			Requirement = "RLevel7",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Fut_re, Ablaze"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		},
		["Fut_re, Ablaze-Foil"] = {
			Name = "Up In Smoke",
			Goal = "Have 4 or more enemy fighters die in a single turn 10 times.",
			Difficulty = "Medium",
			Type = "Scalar",
			Stat = "4EnemyDeathsInTurn",
			Amount = 10,
			Requirement = "Fut_re, Ablaze",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				BloxBux = 0,
				Cards = { ["Fut_re, Ablaze-Foil"] = 1 },
				Packs = {},
				Sleeves = {},
				Ranks = {}
			}
		}
	},
	Milestones = {},
	Progression = {
		HonoraryArchaeologist = {
			Name = "Honorary Archaeologist",
			Goal = "Pass Colo's test.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_Colo",
			Amount = 1,
			Requirement = nil,
			DefaultSort = -1,
			IsAddition = false,
			CantRedeem = true,
			Rewards = {
				Cards = { ["Junior Permit"] = 1 },
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 },
				Stat = { StoryProgress = 1 }
			}
		},
		Act1Complete = {
			Name = "Blast From The Past",
			Goal = "Complete Act 1 of the main story.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "FinishAct1",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 3000,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		Act2Start = {
			Name = "One Step Forward",
			Goal = "Talk to Colo and start the next act of the main story!",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "StartAct2",
			Amount = 1,
			Requirement = "Act1Complete",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = {}
			}
		},
		Sleep = {
			Name = "Catch some Z's",
			Goal = "Take a nap.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "StoryProgress2",
			Amount = 2,
			Requirement = "Act2Start",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 200,
				Ranks = { "eepy" }
			}
		},
		ColoDate = {
			Name = "Lore Dump",
			Goal = "Meet Colo in a secret location.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "StoryProgress2",
			Amount = 3,
			Requirement = "Sleep",
			DefaultSort = 1,
			IsAddition = false,
			Rewards = {
				BloxBux = 500,
				Packs = { Doomspire = 2 }
			}
		},
		DogeQuest = {
			Name = "Much Conspiracy.",
			Goal = "Talk to the Skater and investigate the mysterious dog.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_Prince Doge",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 3,
			IsAddition = false,
			CantRedeem = true,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 },
				Stat = { NPCQuestPrinceDoge = 1 }
			}
		},
		Level8 = {
			Name = "Honed Duelist",
			Goal = "Reach Level 8.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = "Level",
			Amount = 8,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 2,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		DoomspireRaids = {
			Name = "Spire Slayer",
			Goal = "Complete all four Doomspire raid bosses on Normal difficulty.",
			Difficulty = "Legendary",
			Type = "Scalar",
			Stat = {
				BOT_WINS_DSYellowRaid = 1,
				BOT_WINS_DSRedRaid = 1,
				BOT_WINS_DSBlueRaid = 1,
				BOT_WINS_DSGreenRaid = 1
			},
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		ZanzelPerfectedCompleted = {
			Name = "Perfectionist",
			Goal = "Complete the Zanzel, Perfected raid on Normal mode.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = "BOT_WINS_ZanzelRaid",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 4,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		CityTrekRunCompleted = {
			Name = "Enzyme Runner",
			Goal = "Complete a successful run of City Trek.",
			Difficulty = "Medium",
			Type = "Objective",
			Stat = "Run_City Trek_RunsCompleted",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 5,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		LunarImpactComplete = {
			Name = "Look to la luna",
			Goal = "Defeat the Rageborne Archangel in the Lunar Impact region.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "BOT_WINS_Adreti, Rageborne's Judgment",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 6,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		CompletePack = {
			Name = "Gotta Collect Them All",
			Goal = "Fully collect a card pack.",
			Difficulty = "Hard",
			Type = "Objective",
			Stat = "CompetedCardPacks",
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 7,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		["20QueueWins"] = {
			Name = "Professional Duelist",
			Goal = "Win 20 battles from the battle queue.",
			Difficulty = "Hard",
			Type = "Scalar",
			Stat = "QueueMatchesWon",
			Amount = 20,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 8,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		},
		TemporalHaloCompleted = {
			Name = "Shard Savior",
			Goal = "Complete all four battles in the Temporal Halo region.",
			Difficulty = "Legendary",
			Type = "Objective",
			Stat = {
				BOT_WINS_Chromafex = 1,
				BOT_WINS_Ghashendex = 1,
				BOT_WINS_Erisyphia = 1,
				["BOT_WINS_Wanwood Dryad"] = 1
			},
			Amount = 1,
			Requirement = "HonoraryArchaeologist",
			DefaultSort = 9,
			IsAddition = false,
			Rewards = {
				Cards = {},
				Sleeves = {},
				Ranks = {},
				Currency = { ["History Core"] = 1 }
			}
		}
	},
	Hidden = {
		TalkToMage = {
			Stat = "StoryProgress",
			Amount = -1,
			Rewards = {
				Stat = { StoryProgress = 1 }
			}
		},
		TalkToXDNFirstTime = {
			Stat = "StoryProgress",
			Amount = 2,
			Rewards = {
				Stat = { StoryProgress = 1 }
			}
		},
		SaveTitano = {
			Stat = "BOT_WINS_act1_Blockhead",
			Amount = 1,
			Rewards = {
				Stat = { SavedTitano = 1 }
			}
		},
		GetGravityCoil = {
			Stat = "SavedTitano",
			Amount = 1,
			Rewards = {
				Stat = { HasGravityCoil = 1 }
			}
		},
		FindNinjaG = {
			Stat = "HasGravityCoil",
			Amount = 1,
			Rewards = {
				Stat = { NinjaFoundG = 1 }
			}
		},
		VIPShirtNeeded = {
			Stat = "StoryProgress",
			Amount = 3,
			Rewards = {
				Stat = { SpawnNoobloxxer = 1 }
			}
		},
		VIPShirtObtained = {
			Stat = "BOT_WINS_act1_Noobloxxer",
			Amount = 1,
			Rewards = {
				Stat = { HasVIPShirt = 1 }
			}
		},
		FindNinjaT = {
			Stat = "HasVIPShirt",
			Amount = 1,
			Rewards = {
				Stat = { NinjaFoundT = 1 }
			}
		},
		FindNinjaS = {
			Stat = "BOT_WINS_act1_xxshadowslayerxx",
			Amount = 1,
			Rewards = {
				Stat = { NinjaFoundS = 1 }
			}
		},
		FindAllNinja = {
			Stat = { NinjaFoundS = 1, NinjaFoundT = 1, NinjaFoundG = 1 },
			IsAddition = false,
			Rewards = {
				Stat = { AllNinjaFound = 1 }
			}
		},
		FinishSpeech = {
			Stat = "StoryProgress",
			Amount = 2,
			Rewards = {
				Stat = { FinishSpeech = 1 }
			}
		},
		FinishPostSpeech = {
			Stat = "FinishSpeech",
			Amount = 1,
			Rewards = {
				Stat = { FinishPostSpeech = 1 }
			}
		},
		PostAct1Boss = {
			Stat = "BOT_WINS_Act1StoryRaid",
			Amount = 1,
			Rewards = {
				Stat = { PostTelamonBattle = 1 }
			}
		},
		FinishAct1 = {
			Stat = "BOT_WINS_Act1StoryRaid",
			Amount = 1,
			Rewards = {
				Stat = { FinishAct1 = 1 }
			}
		},
		StartAct2 = {
			Stat = "BOT_WINS_Act1StoryRaid",
			Amount = 1,
			Rewards = {
				Stat = { StartAct2 = 1 }
			}
		},
		CompletedCardPuzzles = {
			Stat = {
				["BOT_WINS_Fluffle Puzzle 1"] = 1,
				["BOT_WINS_Fluffle Puzzle 2"] = 1,
				["BOT_WINS_Fluffle Puzzle 3"] = 1,
				["BOT_WINS_Fluffle Puzzle 4"] = 1,
				["BOT_WINS_Fluffle Puzzle 5"] = 1,
				["BOT_WINS_Fluffle Puzzle 6"] = 1,
				["BOT_WINS_Fluffle Puzzle 7"] = 1,
				["BOT_WINS_Fluffle Puzzle 8"] = 1,
				["BOT_WINS_Fluffle Puzzle 9"] = 1,
				["BOT_WINS_Fluffle Puzzle 10"] = 1,
				["BOT_WINS_Fluffle Puzzle 11"] = 1,
				["BOT_WINS_Fluffle Puzzle 12"] = 1,
				["BOT_WINS_Fluffle Puzzle 13"] = 1,
				["BOT_WINS_Fluffle Puzzle 14"] = 1,
				["BOT_WINS_Fluffle Puzzle 15"] = 1,
				["BOT_WINS_Fluffle Puzzle 16"] = 1,
				["BOT_WINS_Fluffle Puzzle 17"] = 1,
				["BOT_WINS_Fluffle Puzzle 18"] = 1,
				["BOT_WINS_Fluffle Puzzle 19"] = 1,
				["BOT_WINS_Fluffle Puzzle 20"] = 1
			},
			Rewards = {
				Cards = { ["Blox Cards"] = 1 },
				Stat = { ClaimedCardPuzzlesReward = 1 }
			}
		},
		StarterDeckR_1 = {
			Stat = "StarterDeckProgress_R",
			Amount = 1,
			Rewards = {
				Packs = { ["Strife's Arsenal: Red"] = 5 },
				Stat = { StarterDeckProgress_R = 1 }
			}
		},
		StarterDeckR_2 = {
			Stat = "StarterDeckProgress_R",
			Amount = 2,
			Rewards = {
				Packs = { ["Strife's Arsenal: Red"] = 5 },
				Stat = { StarterDeckProgress_R = 1 }
			}
		},
		StarterDeckR_3 = {
			Stat = "StarterDeckProgress_R",
			Amount = 3,
			Rewards = {
				Packs = { ["Strife's Arsenal: Red"] = 10 },
				Stat = { StarterDeckProgress_R = 1 }
			}
		},
		StarterDeckG_1 = {
			Stat = "StarterDeckProgress_G",
			Amount = 1,
			Rewards = {
				Packs = { ["Strife's Arsenal: Green"] = 5 },
				Stat = { StarterDeckProgress_G = 1 }
			}
		},
		StarterDeckG_2 = {
			Stat = "StarterDeckProgress_G",
			Amount = 2,
			Rewards = {
				Packs = { ["Strife's Arsenal: Green"] = 5 },
				Stat = { StarterDeckProgress_G = 1 }
			}
		},
		StarterDeckG_3 = {
			Stat = "StarterDeckProgress_G",
			Amount = 3,
			Rewards = {
				Packs = { ["Strife's Arsenal: Green"] = 10 },
				Stat = { StarterDeckProgress_G = 1 }
			}
		},
		StarterDeckB_1 = {
			Stat = "StarterDeckProgress_B",
			Amount = 1,
			Rewards = {
				Packs = { ["Strife's Arsenal: Blue"] = 5 },
				Stat = { StarterDeckProgress_B = 1 }
			}
		},
		StarterDeckB_2 = {
			Stat = "StarterDeckProgress_B",
			Amount = 2,
			Rewards = {
				Packs = { ["Strife's Arsenal: Blue"] = 5 },
				Stat = { StarterDeckProgress_B = 1 }
			}
		},
		StarterDeckB_3 = {
			Stat = "StarterDeckProgress_B",
			Amount = 3,
			Rewards = {
				Packs = { ["Strife's Arsenal: Blue"] = 10 },
				Stat = { StarterDeckProgress_B = 1 }
			}
		},
		StarterDeckY_1 = {
			Stat = "StarterDeckProgress_Y",
			Amount = 1,
			Rewards = {
				Packs = { ["Strife's Arsenal: Yellow"] = 5 },
				Stat = { StarterDeckProgress_Y = 1 }
			}
		},
		StarterDeckY_2 = {
			Stat = "StarterDeckProgress_Y",
			Amount = 2,
			Rewards = {
				Packs = { ["Strife's Arsenal: Yellow"] = 5 },
				Stat = { StarterDeckProgress_Y = 1 }
			}
		},
		StarterDeckY_3 = {
			Stat = "StarterDeckProgress_Y",
			Amount = 3,
			Rewards = {
				Packs = { ["Strife's Arsenal: Yellow"] = 10 },
				Stat = { StarterDeckProgress_Y = 1 }
			}
		},
		CivPitTrap = {
			Stat = "StoryProgress",
			Amount = 1,
			Rewards = {
				Cards = { ["Unwanted Trend-Civ"] = 1 }
			}
		},
		InviteQuest1 = {
			Stat = "PlayersInvited",
			Amount = 1,
			Rewards = {
				BloxBux = 1000,
				Cards = { ["Claw Machine"] = 2 },
				Ranks = { "Double Trouble" }
			}
		},
		InviteQuest2 = {
			Stat = "PlayersInvited",
			Amount = 2,
			Rewards = {
				BloxBux = 1000,
				Packs = { ["Variety Pack"] = 10 },
				Sleeves = { "RazarsInvitation" }
			}
		},
		InviteQuest3 = {
			Stat = "PlayersInvited",
			Amount = 3,
			Rewards = {
				BloxBux = 1000,
				Cards = { ["Claw Machine-Foil"] = 2 },
				Ranks = { "Party Host" }
			}
		},
		InviteQuest4 = {
			Stat = "PlayersInvited",
			Amount = 4,
			Rewards = {
				BloxBux = 1000,
				Packs = { ["Variety Pack-Foil"] = 3 }
			}
		},
		InviteQuest5 = {
			Stat = "PlayersInvited",
			Amount = 5,
			Rewards = {
				BloxBux = 1000,
				Packs = { ["Variety Pack-Foil"] = 7 },
				Ranks = { "The One Everyone Else Knows" }
			}
		}
	}
}
