



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local copyTable = require(replicatedStorage.CopyTable)
local t1: {[any]: any} = {
	"CT_G_Empty Street",
	"CT_G_Rest Stop",
	"CT_G_NeFoCo Warehouse",
	"CT_G_Troubled Arkhivist",
	"CT_G_Plurral Hangout",
	"CT_G_The Shelters",
	"CT_G_Impish Photographer",
	"CT_G_Pothole",
	"CT_G_Old Lady",
	"CT_G_Lab",
	"CT_G_Firepit",
	"CT_G_Marketeer",
	"CT_G_Chairman"
}
local t2: {[any]: any} = { "CT_G_Empty Street", "CT_G_Rest Stop" }
t2 = {
	"CT_NE_2",
	"CT_AR_2",
	"CT_CR_2",
	"CT_PL_2",
	"CT_SM_2",
	"CT_LO_2",
	"CT_EX_2"
}
local t3: {[any]: any} = {
	"CT_NE_6",
	"CT_AR_6",
	"CT_CR_6",
	"CT_PL_6",
	"CT_SM_6",
	"CT_LO_6",
	"CT_EX_6"
}
local color3 = Color3.fromRGB(173, 71, 71)
local t4: {[any]: any} = {
	{
		Encounters = { "CT_PLL" },
		Events = t1
	},
	{ Encounters = t2, Events = t1 },
	{ Encounters = t2, Events = t1 },
	{
		Encounters = { "CT_AS_4", "CT_GR_4", "CT_NE_4", "CT_SK_4", "CT_ER_4", "CT_DJ_4" },
		Events = { "CT_Parking Lot" },
		NumEvents = 1
	},
	{ Encounters = t3, Events = t1 },
	{ Encounters = t3, Events = t1 },
	{
		Encounters = { "CT_FL_8", "CT_MC_8", "CT_AS_8", "CT_CA_8", "CT_KI_8", "CT_AP_8" }
	}
}
local v8 = copyTable(t4)
local color32 = Color3.fromRGB(231, 83, 199)
local v10 = copyTable(t4)
local color33 = Color3.fromRGB(0, 0, 185)
local v12 = copyTable(t4)
local color34 = Color3.fromRGB(255, 211, 33)
local v14 = copyTable(t4)
local color35 = Color3.fromRGB(0, 225, 255)
local v16 = copyTable(t4)
local color36 = Color3.fromRGB(55, 100, 55)
local v18 = copyTable(t4)

return {
	["City Trek"] = {
		Name = "City Trek",
		StartingTreasures = {
			["Extra Snacks"] = {
				Name = "Extra Snacks",
				Icon = "rbxassetid://14253659423",
				Description = "Whenever you cast a fighter: It gains 100 Health and Power.",
				LayoutOrder = 0
			},
			["Pocket Stud"] = {
				Name = "Pocket Stud",
				Icon = "rbxassetid://14253660341",
				Description = "Start the game with an extra stud of each colour in your baseplate.",
				LayoutOrder = 1
			},
			["Paraselene Pendant"] = {
				Name = "Paraselene Amulet",
				Icon = "rbxassetid://14253660583",
				Description = "The first action you cast each turn triggers twice. You lose 150 life when this triggers.",
				LayoutOrder = 2
			},
			["Hardcore Mode"] = {
				Name = "Hardcore Mode",
				Icon = "rbxassetid://14017071151",
				Description = "You start with half of your life and no starting gear.  Some events may be different. Good luck.",
				LayoutOrder = 3
			}
		},
		CustomBucketSizes = {
			Boardwipe = 1,
			["Big Boys"] = 2,
			["Action Power"] = 2,
			["Board Control"] = 2,
			["Lead By Example"] = 1,
			Angry = 2,
			["Draw those cards"] = 2
		},
		Characters = {
			McKayla = {
				Name = "McKayla",
				Subtitle = "The voice of the Lordbreakers.",
				LayoutOrder = 3,
				Color = color3,
				VNData = {
					Name = "McKayla",
					Images = { "rbxassetid://13817993974", "rbxassetid://13817993762" },
					Sound = "McKaylaTalk"
				},
				StartingDeck = {
					["Rebel Physician"] = 3,
					["Guardia Fallen"] = 3,
					["Katharan Rebuilder"] = 3,
					["Bloxburg Protestor"] = 3,
					["Acolyte of the Champions-CT"] = 3
				},
				ExcludeEncounters = { "CT_LO_2", "CT_LO_6", "CT_MC_8", "CT_ER_4" },
				ExcludeEvents = { "CT_G_Firepit" },
				PossibleLayout = v8,
				Buckets = {
					["Board Control"] = {
						"John Bomb",
						"Sorry",
						"Langz",
						"Golden Egg Beatings",
						"Body Guards",
						"Moded"
					},
					["Big Boys"] = {
						"APlayerOfGames",
						"Nibblex the Starkiller",
						"LordbreakersPrize",
						"Imaginz00"
					},
					Swappers = {
						"Satyr Nourisher",
						"Fractality",
						"TheShipArchitect",
						"Katharan Immigrant"
					},
					Angry = {
						"Rageborne Crane",
						"Rageborne Drill",
						"Rageborne Bike",
						"Rageborne Cement Mixer",
						"Rageborne Forest",
						"Rageborne Greenery"
					},
					Liberation = {
						"Direct Action",
						"Civilian Rebel",
						"Citizen's Militia",
						"Blunt Vigilantism",
						"Newman's Advocate",
						"The Lunar Arch",
						"United Front",
						"LordbreakersPrize"
					},
					Goodstuff = {
						"Fleskhjerta",
						"Guardia Fallen",
						"Katharan Immigrant",
						"Anaminus",
						"John Bomb"
					},
					["Action Power"] = {
						"Sorry",
						"Admin Abuse",
						"Mirror Man's Assault",
						"Life Potion",
						"Defiant March",
						"Changing Times"
					},
					["Sacrifices Must Be Made"] = {
						"Planet Salvager",
						"Cothran Treant",
						"Local Vigilante",
						"Katharan Mentor",
						"Scribels",
						"Lavatik"
					},
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1", "Ecocide" }
				},
				RareBuckets = {
					["Lead By Example"] = { "McKayla, Bane of Hierarchy" }
				}
			},
			Fl00fy_Bonez = {
				Name = "Fl00fy_Bonez",
				Subtitle = "queen of PLURRAL :3",
				LayoutOrder = 2,
				Color = color32,
				VNData = {
					Name = "Fl00fy_Bonez",
					Images = {
						"rbxassetid://14381564632",
						"rbxassetid://14381564778",
						"rbxassetid://14381564886"
					},
					Sound = "FloofyTalk"
				},
				StartingDeck = {
					["Last Dance Hedonist"] = 3,
					["Guardia Angel"] = 3,
					["Long-Lost Son"] = 3,
					["Pawesome Party"] = 3,
					["Acolyte of the Tribes-CT"] = 3
				},
				ExcludeEncounters = { "CT_PL_2", "CT_PL_6", "CT_FL_8", "CT_DJ_4" },
				ExcludeEvents = { "CT_G_Plurral Hangout" },
				PossibleLayout = v10,
				Buckets = {
					["Give or Take"] = {
						"mightybaseplate",
						"Peaspod",
						"Cothrite Immigrant",
						"Happy Clown",
						"Imaginz00LI"
					},
					["Big Boys"] = {
						"Xenoslimes",
						"Uncomfortably",
						"Indoorsnowball",
						"TheVoid_00f Commission"
					},
					["Board Control"] = { "Visleaf", "Langz", "Wrath of the Fried One", "Moded" },
					["Cat Girlz x3"] = {
						"Excited Bouncer",
						"Hunting Party",
						"Tear and Reshape",
						"Raving Rascal",
						"Animal Experimentation Kit"
					},
					["Let that sink in"] = { "Nexx", "CanadianSanic", "RachelDubs", "Mimic" },
					["Action Power"] = {
						"Deception Infection",
						"Sublime Purity",
						"Divine Transcendence",
						"Mirror Man's Assault"
					},
					["Token Support"] = {
						"Galilea, Faithful Explorer",
						"Imaginz00LI",
						"Animal Experimentation Kit"
					},
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1" }
				},
				RareBuckets = {
					["Lead By Example"] = { "Fl00fy_Bonez", "Catlyn Nyaxon, Hunter" }
				}
			},
			Astarossa = {
				Name = "Astarossa",
				Subtitle = "Representitive for the Committee for Rational Progress.",
				LayoutOrder = 4,
				Color = color33,
				VNData = {
					Name = "Astarossa",
					Images = { "rbxassetid://14359085231", "rbxassetid://14372232865" },
					Sound = "AstarossaTalk"
				},
				StartingDeck = {
					["Defender of Democracy"] = 3,
					["Guardia Custodian"] = 3,
					["Pent-up Pentagenarian"] = 3,
					["Booming Boomer"] = 3,
					["Acolyte of the Storm-CT"] = 3
				},
				ExcludeEncounters = { "CT_CR_2", "CT_CR_6", "CT_AS_8" },
				ExcludeEvents = { "CT_G_Old Lady" },
				PossibleLayout = v12,
				Buckets = {
					["Give or Take"] = {
						"SirAdurite",
						"PurpleBoy329",
						"Forothian Immigrant",
						"Eisenhower's Apprentice",
						"Loleris"
					},
					["Big Boys"] = {
						"Crazyblox",
						"Friaza",
						"Lua, Paraselene Evincar",
						"Memoir of the Evincar"
					},
					["Board Control"] = {
						"Burning_Soul_Blade",
						"Divide and Conquer",
						"AurebusMetaverse",
						"Drakobloxxer",
						"Moded"
					},
					["Committee of Rational Progress"] = {
						"Pent-up Pentagenarian",
						"Defender of Democracy",
						"Schism in the Party",
						"A Candid Conversation",
						"Absolute Authority"
					},
					["The Astral Faith"] = {
						"Committee Crony",
						"Join the Cause",
						"Disenfranchise",
						"Astral Faith Zealot"
					},
					["Action Power"] = {
						"Eye Spy",
						"Pumpkin Bomb",
						"Admin Abuse",
						"Mob Mentality",
						"Master Josue",
						"Crescendo, the Soul Stealer"
					},
					["Praise the Moon"] = {
						"Paraselene Sage",
						"Paraselene Moondog",
						"Paraselene Astrologist",
						"Lua, Paraselene Cadet"
					},
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1" }
				},
				RareBuckets = {
					["Lead By Example"] = { "Bloxburg Mayor Astarossa", "Astarossa Van Buren" }
				}
			},
			Kingrin = {
				Name = "Kingrin",
				Subtitle = "The gang leader of the Smiley Familey",
				LayoutOrder = 6,
				Color = color34,
				Life = 5000,
				VNData = {
					Name = "Kingrin",
					Images = { "rbxassetid://14377081697", "rbxassetid://14377085868" },
					Sound = "KingrinTalk"
				},
				StartingDeck = {
					["Hazing Ritual"] = 3,
					["Guardia Knight"] = 3,
					["Smiley Slasher"] = 3,
					["Laughing Stock"] = 3,
					["Hedonist Acolyte-CT"] = 3,
					Mag = 3,
					["Fashionable Citizen"] = 3
				},
				ExcludeEncounters = { "CT_SM_2", "CT_SM_6", "CT_SK_4", "CT_KI_8" },
				ExcludeEvents = { "CT_G_Empty Street" },
				PossibleLayout = v14,
				Buckets = {
					Goodstuff = {
						"Isaac0333",
						"Qdhxx",
						"Javionese Immigrant",
						"Person299",
						"Avectus",
						"Corrupt SoulSearch"
					},
					["Big Boys"] = {
						"Jaredvaldez4",
						"Hoshpup",
						"Steve, The Blazing Flare",
						"Grinning Goliath"
					},
					["Cheap Stuff"] = { "Zephu", "Happy Clown", "T3RB0H", "CAROLlNE", "Mohawk2275" },
					["Smiley Familey"] = {
						"Cackling Hell Biker",
						"Torturing Turncoat",
						"Hazing Ritual",
						"Found Familey",
						"Snickering Skewer",
						"Carnage Crowd",
						"Grinning Goliath"
					},
					["No Life"] = {
						"Julez_X",
						"YotamTiti",
						"Javionese Immigrant",
						"Julez_X",
						"YotamTiti"
					},
					["Action Power"] = {
						"Heaven Smiles",
						"Thanksgiving Feast",
						"Admin Abuse",
						"Wrath of the Fried One",
						"Consult the Archives"
					},
					["Draw!"] = {
						"Corrupt SoulSearch",
						"Aggressive Advertising",
						"StaceyD07",
						"Consult the Archives"
					},
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1" }
				},
				RareBuckets = {
					["Lead By Example"] = { "Kingrin, Surrounded by Familey" }
				}
			},
			Apollo = {
				Name = "Apollo",
				Subtitle = "Founder of the NecroForensic Corporation",
				LayoutOrder = 1,
				Color = color35,
				VNData = {
					Name = "Apollo",
					Images = { "rbxassetid://14377081034", "rbxassetid://14377085641" },
					Sound = "ApolloTalk"
				},
				StartingDeck = {
					["Morgue Merchant"] = 3,
					["Guardia Bladesmith"] = 3,
					["Hardboiled Detective"] = 3,
					["Lawyer of Last Moments"] = 3,
					["Fried One Cultist-CT"] = 3
				},
				ExcludeEncounters = { "CT_NE_2", "CT_NE_6", "CT_AP_8" },
				ExcludeEvents = { "CT_G_NeFoCo Warehouse" },
				PossibleLayout = v16,
				Buckets = {
					Goodstuff = {
						"Gasturas",
						"Cyclist",
						"amanda",
						"NearMiss TFW",
						"Wild Reporter Tracy",
						"Sethycakes"
					},
					["Big Boys"] = {
						"Matt Dusek",
						"Faith and Integrity, Twin Arms",
						"Deadly Dicey Duo",
						"Axle"
					},
					["Die Rough"] = { "Fashionable Citizen", "Undead Teddy", "Razikai", "Lorenzo77555" },
					["Draw those cards"] = { "Lightning_Splash", "Ravenshield", "NintendoZACHARY", "Luckymaxer" },
					["NecroForenisc Corporation"] = {
						"Hardboiled Detective",
						"Halogenic Sprayer",
						"Counsel Engine",
						"Insider Crook",
						"Say Goodbyes",
						"Organoid Officer"
					},
					["Full House"] = {
						"Steam Razikai",
						"Losternmeyer",
						"StaySpy",
						"Havaluvian Immigrant",
						"StaceyD07"
					},
					["Action Power"] = { "Eye Spy", "Hardboiled Detective", "Bowl of Greed", "Freaky Friday" },
					Smol = {
						"Bebee2",
						"destruction5033",
						"Morgue Merchant",
						"Insider Crook",
						"KonekoKitten"
					},
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1" }
				},
				RareBuckets = {
					["Lead By Example"] = { "Apollo Scott, Visionary", "Apollo, Fearless" }
				}
			},
			Caitlin = {
				Name = "Caitlin",
				Subtitle = "Arkhive Project Manager",
				LayoutOrder = 5,
				Color = color36,
				VNData = {
					Name = "Caitlin",
					Images = {
						"rbxassetid://14369465319",
						"rbxassetid://14369465400",
						"rbxassetid://14369465486"
					},
					Sound = "CaitlinTalk"
				},
				StartingDeck = {
					["Hive Terminal"] = 2,
					["Guardia Seeress"] = 3,
					["Observation Cam"] = 3,
					["Greenbelt Surveyor"] = 4,
					["Nyxian Acolyte-CT"] = 3
				},
				ExcludeEncounters = { "CT_AR_2", "CT_AR_6", "CT_GR_4", "CT_CA_8" },
				ExcludeEvents = { "CT_G_Troubled Arkhivist" },
				PossibleLayout = v18,
				Buckets = {
					Goodstuff = {
						"BelowNatural",
						"Inventor1116",
						"Robloxian Immigrant",
						"Offroad Mechabike",
						"Faultful",
						"Materking",
						"Febrezer"
					},
					["Big Boys"] = {
						"MesouricPhantom976",
						"DrTrayBlox",
						"Wellspring Guardian",
						"Razikai's Exploration",
						"Salvation",
						"Eisenhower Dwit"
					},
					Era = {
						"Alpha Brick's Bestowment",
						"Alpha Brick's Restoration",
						"Alpha Brick's Sealing"
					},
					["Sick Ramp"] = {
						"Wielder of the Ghostwalker",
						"Stranglevines",
						"Faultful",
						"Groucho Mask",
						"Valkyrie in Mystique"
					},
					["Arkhive Project"] = {
						"Hive Terminal",
						"Paleofeeder",
						"Portable Translator",
						"Scripture Scanner",
						"Offroad Mechabike"
					},
					["Board Control"] = { "Langz", "TypicalType", "Eye Spy", "Moded" },
					["Action Power"] = { "Mirror Man's Assault", "Eye Spy", "Gravity Coil", "Master Josue" },
					["Let that sink in"] = { "Febrezer", "SolarCrane", "CanadianSanic", "Mimic", "Rukiryo" },
					Boardwipe = { "Luck o The Lobsters", "Mzh3000", "Bobaman1", "Ecocide" }
				},
				RareBuckets = {
					["Lead By Example"] = { "Caitlin, Paladin of Nature", "Caitlin Nixon, Hunted" }
				}
			}
		}
	}
}
