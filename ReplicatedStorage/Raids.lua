



local color3 = Color3.fromRGB(71, 114, 255)
local color32 = Color3.fromRGB(184, 60, 255)
local color33 = Color3.fromRGB(0, 0, 255)
local color34 = Color3.fromRGB(255, 248, 57)
local color35 = Color3.fromRGB(255, 164, 17)
local color36 = Color3.fromRGB(6, 255, 14)
local color37 = Color3.fromRGB(255, 17, 21)
local color38 = Color3.fromRGB(255, 57, 100)
local color39 = Color3.fromRGB(255, 25, 29)
local color310 = Color3.fromRGB(71, 255, 102)
local color311 = Color3.fromRGB(68, 255, 16)
local color312 = Color3.fromRGB(255, 242, 67)
local color313 = Color3.fromRGB(255, 167, 66)
local color314 = Color3.fromRGB(60, 154, 255)
local color315 = Color3.fromRGB(28, 73, 121)
local color316 = Color3.fromRGB(60, 154, 255)
local color317 = Color3.fromRGB(28, 73, 121)
local color318 = Color3.fromRGB(255, 57, 100)
local color319 = Color3.fromRGB(255, 25, 29)
local color320 = Color3.fromRGB(71, 255, 102)
local color321 = Color3.fromRGB(68, 255, 16)
local color322 = Color3.fromRGB(255, 242, 67)
local color323 = Color3.fromRGB(255, 167, 66)
local color324 = Color3.fromRGB(140, 132, 49)
local color325 = Color3.fromRGB(140, 75, 38)
local color326 = Color3.fromRGB(140, 15, 15)
local color327 = Color3.fromRGB(191, 52, 42)
local color328 = Color3.fromRGB(57, 140, 13)
local color329 = Color3.fromRGB(59, 140, 106)
local color330 = Color3.fromRGB(140, 15, 128)
local color331 = Color3.fromRGB(5, 2, 7)

return {
	["Zanzel, Perfected"] = {
		Name = "Zanzel, Perfected",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Battle against a Zanzel from a false reality, where the world bent to the promised one's will. Will you triumph, or become purified like the rest?</stroke>",
		Stages = {
			Normal = {
				Duelist = "ZanzelRaid",
				ButtonColor = color3,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 4 },
					Cards = { ["Zanzel, Perfected-Alt"] = 1, ["Apocryphic Seeker"] = 1 },
					Packs = { ["Variety Pack"] = 1 },
					Ranks = { "Perfected" }
				},
				RewardRates = {
					["Apocryphic Sigil"] = 1,
					["Apocryphic Seeker"] = 0.2,
					["Zanzel, Perfected-Alt"] = 0.15,
					["Variety Pack"] = 0.15,
					Perfected = 0.1
				}
			},
			Extreme = {
				Duelist = "ZanzelRaidEX",
				ButtonColor = color32,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 10 },
					Cards = {
						["Zanzel, Perfected-Alt"] = 1,
						["Zanzel, Perfected-Alt-Foil"] = 1,
						["Apocryphic Seeker"] = 1,
						["Apocryphic Seeker-Foil"] = 1
					},
					BattleBackground = { "Apocrypha" },
					Packs = { ["Variety Pack"] = 1, ["Variety Pack-Foil"] = 1 },
					Ranks = { "<stroke color=\"#d723e7\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Perfected</font></stroke>" }
				},
				RewardRates = {
					["Apocryphic Sigil"] = 1,
					["Apocryphic Seeker"] = 0.4,
					["Apocryphic Seeker-Foil"] = 0.05,
					["Zanzel, Perfected-Alt"] = 0.2,
					["Zanzel, Perfected-Alt-Foil"] = 0.05,
					["Variety Pack"] = 0.25,
					["Variety Pack-Foil"] = 0.08,
					Apocrypha = 0.01,
					["<stroke color=\"#d723e7\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Perfected</font></stroke>"] = 0.1
				}
			}
		}
	},
	AprilFool = {
		Name = "Recycling bin!!!1!!11!",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Are you prepared for a task most arduous?</stroke>",
		Stages = {
			["Blue..."] = {
				Duelist = "FoolRaidEX",
				ButtonColor = color33,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 },
					Ranks = { "f ool" }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1, ["f ool"] = 1 }
			}
		}
	},
	Telamon = {
		Name = "Telamon",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Fend off Telamon and his titans in this recreation of your previous encounter with the god of robloxia!</stroke>",
		Stages = {
			Normal = {
				Duelist = "TelamonRaid",
				ButtonColor = color34,
				Rewards = {
					EventCurrency = { ["Rainbow Titan Essence"] = 4 },
					Cards = {
						["DeathETM-RaidAct1"] = 1,
						["Ninja Combatant-RaidAct1"] = 1,
						["Noob Gunner-RaidAct1"] = 1,
						xxdemonninjaxx = 1
					},
					Packs = { ["Ultimate Power"] = 1 },
					Ranks = { "Overworked" }
				},
				RewardRates = {
					["Rainbow Titan Essence"] = 1,
					xxdemonninjaxx = 0.2,
					["DeathETM-RaidAct1"] = 0.1,
					["Ninja Combatant-RaidAct1"] = 0.1,
					["Noob Gunner-RaidAct1"] = 0.1,
					["Ultimate Power"] = 0.15,
					Overworked = 0.1
				}
			},
			Extreme = {
				Duelist = "TelamonRaidEX",
				ButtonColor = color35,
				Rewards = {
					EventCurrency = { ["Rainbow Titan Essence"] = 10 },
					Cards = {
						["DeathETM-RaidAct1"] = 1,
						["Ninja Combatant-RaidAct1"] = 1,
						["Noob Gunner-RaidAct1"] = 1,
						["DeathETM-RaidAct1-Foil"] = 1,
						["Ninja Combatant-RaidAct1-Foil"] = 1,
						["Noob Gunner-RaidAct1-Foil"] = 1,
						xxdemonninjaxx = 1,
						["xxdemonninjaxx-Foil"] = 1
					},
					BattleBackground = { "TelamonBasement" },
					Packs = { ["Ultimate Power"] = 1, ["Ultimate Power-Foil"] = 1 },
					Ranks = { "<stroke color=\"#fcf762\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Overworked</font></stroke>" }
				},
				RewardRates = {
					["Rainbow Titan Essence"] = 1,
					["DeathETM-RaidAct1"] = 0.2,
					xxdemonninjaxx = 0.4,
					["xxdemonninjaxx-Foil"] = 0.05,
					["Ninja Combatant-RaidAct1"] = 0.2,
					["Noob Gunner-RaidAct1"] = 0.2,
					["DeathETM-RaidAct1-Foil"] = 0.05,
					["Ninja Combatant-RaidAct1-Foil"] = 0.05,
					["Noob Gunner-RaidAct1-Foil"] = 0.05,
					["Ultimate Power"] = 0.25,
					["Ultimate Power-Foil"] = 0.08,
					TelamonBasement = 0.01,
					["<stroke color=\"#fcf762\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Overworked</font></stroke>"] = 0.1
				}
			}
		}
	},
	Krampus = {
		Name = "Krampus",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">The evil Krampus is attempting to spread misery to all celebrating the holidays with his army of evil toys and hellhail underlings! Can you save Christmas?</stroke>",
		Stages = {
			Normal = {
				Duelist = "XmasRaid",
				ButtonColor = color36,
				Rewards = {
					EventCurrency = { ["Candy Cane"] = 4 },
					Cards = { CocoaAlt = 1, PtendaAlt = 1, MaxR3dAlt = 1, ["FILTHY PRANKS"] = 1 },
					Packs = { ["Teaism's Gifts"] = 1 },
					Ranks = { "Festive Savior" }
				},
				RewardRates = {
					["Candy Cane"] = 1,
					CocoaAlt = 0.1,
					PtendaAlt = 0.1,
					MaxR3dAlt = 0.1,
					["FILTHY PRANKS"] = 0.1,
					["Teaism's Gifts"] = 0.15,
					["Festive Savior"] = 0.1
				}
			},
			Extreme = {
				Duelist = "XmasRaidEX",
				ButtonColor = color37,
				Rewards = {
					EventCurrency = { ["Candy Cane"] = 10 },
					Cards = {
						CocoaAlt = 1,
						PtendaAlt = 1,
						MaxR3dAlt = 1,
						["FILTHY PRANKS"] = 1,
						["CocoaAlt-Foil"] = 1,
						["PtendaAlt-Foil"] = 1,
						["MaxR3dAlt-Foil"] = 1,
						["FILTHY PRANKS-Foil"] = 1
					},
					BattleBackground = { "Festive" },
					Packs = { ["Teaism's Gifts"] = 1, ["Teaism's Gifts-Foil"] = 1 },
					Ranks = { "<stroke color=\"#8c0303\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#c96565\">Joy Ruiner</font></stroke>" }
				},
				RewardRates = {
					["Candy Cane"] = 1,
					CocoaAlt = 0.2,
					PtendaAlt = 0.2,
					MaxR3dAlt = 0.2,
					["FILTHY PRANKS"] = 0.2,
					["CocoaAlt-Foil"] = 0.04,
					["PtendaAlt-Foil"] = 0.04,
					["MaxR3dAlt-Foil"] = 0.04,
					["FILTHY PRANKS-Foil"] = 0.04,
					["Teaism's Gifts"] = 0.15,
					["Teaism's Gifts-Foil"] = 0.06,
					Festive = 0.01,
					["<stroke color=\"#8c0303\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#c96565\">Joy Ruiner</font></stroke>"] = 0.1
				}
			}
		}
	},
	DSTesting = {
		Name = "Doomspire Testing",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Description goes here</stroke>",
		Stages = {
			["Normal Red"] = {
				Duelist = "DSRedRaid",
				ButtonColor = color38,
				Extreme = "Extreme Red",
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Extreme Red"] = {
				Duelist = "DSRedRaidEX",
				ButtonColor = color39,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Normal Green"] = {
				Duelist = "DSGreenRaid",
				ButtonColor = color310,
				Extreme = "Extreme Green",
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Extreme Green"] = {
				Duelist = "DSGreenRaidEX",
				ButtonColor = color311,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Normal Yellow"] = {
				Duelist = "DSYellowRaid",
				ButtonColor = color312,
				Extreme = "Extreme Yellow",
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Extreme Yellow"] = {
				Duelist = "DSYellowRaidEX",
				ButtonColor = color313,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Normal Blue"] = {
				Duelist = "DSBlueRaid",
				ButtonColor = color314,
				Extreme = "Extreme Blue",
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			},
			["Extreme Blue"] = {
				Duelist = "DSBlueRaidEX",
				ButtonColor = color315,
				Rewards = {
					EventCurrency = { ["Apocryphic Sigil"] = 1 }
				},
				RewardRates = { ["Apocryphic Sigil"] = 1 }
			}
		}
	},
	["Prince Wonktooth"] = {
		Name = "Prince Wonktooth",
		Description = "The rift reveals a twisted version of Kralosa, An aggressive Prince Wonktooth sees anyone who approaches him as a threat to his princehood, and challenges them to a duel on sight.",
		Cutscene = "DS_B_1",
		Stages = {
			Normal = {
				Duelist = "DSBlueRaid",
				ButtonColor = color316,
				Extreme = "Extreme Blue",
				Rewards = {
					EventCurrency = { ["Wonktooth Figure"] = 8 },
					Packs = { Doomspire = 1 },
					Cards = { ["Shedarian Treasurekeeper"] = 1 },
					Ranks = { "Prince Regent" }
				},
				RewardRates = {
					["Wonktooth Figure"] = 1,
					Doomspire = 0.05,
					["Shedarian Treasurekeeper"] = 0.15,
					["Prince Regent"] = 0.1
				}
			},
			Extreme = {
				Duelist = "DSBlueRaidEX",
				ButtonColor = color317,
				Rewards = {
					EventCurrency = { ["Wonktooth Figure"] = 35 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = {
						["Shedarian Treasurekeeper"] = 1,
						["Shedarian Treasurekeeper-Foil"] = 1
					},
					BattleBackground = { "WonktoothsThroneroom" },
					Ranks = { "<stroke color=\"#2f22e6\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Prince Regent</font></stroke>" }
				},
				RewardRates = {
					["Wonktooth Figure"] = 1,
					Doomspire = 0.15,
					["Doomspire-Foil"] = 0.05,
					["Shedarian Treasurekeeper"] = 0.25,
					["Shedarian Treasurekeeper-Foil"] = 0.05,
					WonktoothsThroneroom = 0.01,
					["<stroke color=\"#2f22e6\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Prince Regent</font></stroke>"] = 0.05
				}
			}
		}
	},
	UNIT_4_FORGEMASTER = {
		Name = "UNIT_4_FORGEMASTER",
		Description = "The rift reveals a twisted version of Imperium Ultima, A colossal Kilnkin never previously recorded was found, seemingly capable of producing new, more hostile kilnkin out of its own body.",
		Cutscene = "DS_R_1",
		Stages = {
			Normal = {
				Duelist = "DSRedRaid",
				ButtonColor = color318,
				Extreme = "Extreme Red",
				Rewards = {
					EventCurrency = { ["Forgemaster Figure"] = 8 },
					Packs = { Doomspire = 1 },
					Cards = { ["Kilnkin Rampager"] = 1 },
					Ranks = { "FORGEMASTER" }
				},
				RewardRates = {
					["Forgemaster Figure"] = 1,
					Doomspire = 0.05,
					["Kilnkin Rampager"] = 0.15,
					FORGEMASTER = 0.1
				}
			},
			Extreme = {
				Duelist = "DSRedRaidEX",
				ButtonColor = color319,
				Rewards = {
					EventCurrency = { ["Forgemaster Figure"] = 35 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Kilnkin Rampager"] = 1, ["Kilnkin Rampager-Foil"] = 1 },
					BattleBackground = { "Ultima" },
					Ranks = { "<stroke color=\"#e63322\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">FORGEMASTER</font></stroke>" }
				},
				RewardRates = {
					["Forgemaster Figure"] = 1,
					Ultima = 0.01,
					Doomspire = 0.15,
					["Doomspire-Foil"] = 0.05,
					["Kilnkin Rampager"] = 0.25,
					["Kilnkin Rampager-Foil"] = 0.04,
					["<stroke color=\"#e63322\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">FORGEMASTER</font></stroke>"] = 0.05
				}
			}
		}
	},
	Thyyrinyr = {
		Name = "Thyyrinyr",
		Description = "The rift reveals a twisted version of Disregard, After being caged by Deidre, an enraged Thyyrinyr lashes out against the world, creating a deadly plague that spreads across all of Disregard.",
		Cutscene = "DS_G_1",
		Stages = {
			Normal = {
				Duelist = "DSGreenRaid",
				ButtonColor = color320,
				Extreme = "Extreme Green",
				Rewards = {
					EventCurrency = { ["Thyyrinyr Figure"] = 8 },
					Packs = { Doomspire = 1 },
					Cards = { ["Snapthorn Beast"] = 1 },
					Ranks = { "Sealed" }
				},
				RewardRates = {
					["Thyyrinyr Figure"] = 1,
					Doomspire = 0.05,
					["Snapthorn Beast"] = 0.15,
					Sealed = 0.1
				}
			},
			Extreme = {
				Duelist = "DSGreenRaidEX",
				ButtonColor = color321,
				Rewards = {
					EventCurrency = { ["Thyyrinyr Figure"] = 35 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Snapthorn Beast"] = 1, ["Snapthorn Beast-Foil"] = 1 },
					BattleBackground = { "MistsofDisregard" },
					Ranks = { "<stroke color=\"#22e633\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Sealed</font></stroke>" }
				},
				RewardRates = {
					["Thyyrinyr Figure"] = 1,
					MistsofDisregard = 0.01,
					Doomspire = 0.15,
					["Doomspire-Foil"] = 0.05,
					["Snapthorn Beast"] = 0.25,
					["Snapthorn Beast-Foil"] = 0.05,
					["<stroke color=\"#22e633\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Sealed</font></stroke>"] = 0.05
				}
			}
		}
	},
	["The Animus"] = {
		Name = "The Animus",
		Description = "The rift reveals a twisted version of Justice City, A massive Gilamuraig filled with the emotions of all of the people living inside forms, called \"The Animus\". Can you save Justice City?",
		Cutscene = "DS_Y_1",
		Stages = {
			Normal = {
				Duelist = "DSYellowRaid",
				ButtonColor = color322,
				Extreme = "Extreme Yellow",
				Rewards = {
					EventCurrency = { ["Animus Figure"] = 8 },
					Packs = { Doomspire = 1 },
					Cards = { Animites = 1 },
					Ranks = { "Angelic Horror" }
				},
				RewardRates = {
					["Animus Figure"] = 1,
					Doomspire = 0.05,
					Animites = 0.15,
					["Angelic Horror"] = 0.1
				}
			},
			Extreme = {
				Duelist = "DSYellowRaidEX",
				ButtonColor = color323,
				Rewards = {
					EventCurrency = { ["Animus Figure"] = 35 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { Animites = 1, ["Animites-Foil"] = 1 },
					BattleBackground = { "GreatJusticeCity" },
					Ranks = { "<stroke color=\"#e6be22\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Angelic Horror</font></stroke>" }
				},
				RewardRates = {
					["Animus Figure"] = 1,
					GreatJusticeCity = 0.01,
					Doomspire = 0.15,
					["Doomspire-Foil"] = 0.05,
					Animites = 0.25,
					["Animites-Foil"] = 0.05,
					["<stroke color=\"#e6be22\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#f0f0f0\">Angelic Horror</font></stroke>"] = 0.05
				}
			}
		}
	},
	["Wraiths of Injustice"] = {
		Name = "Wraiths Of Injustice",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Stop the Wraiths of Injustice from sending the Doomspire spiraling into despair!</stroke>",
		Stages = {
			Normal = {
				Duelist = "InjusticeRaidN",
				ButtonColor = color324,
				Rewards = {
					EventCurrency = { ["Corrupted Crest"] = 4 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { Wraithzord = 1 },
					BattleBackground = { "NoumenChambers" },
					Ranks = { "Wraith" }
				},
				RewardRates = {
					["Corrupted Crest"] = 1,
					Doomspire = 0.1,
					["Doomspire-Foil"] = 0.04,
					NoumenChambers = 0.01,
					Wraithzord = 0.15,
					Wraith = 0.1
				}
			},
			Extreme = {
				Duelist = "InjusticeRaidEX",
				ButtonColor = color325,
				Rewards = {
					EventCurrency = { ["Corrupted Crest"] = 10 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { Wraithzord = 1, ["Wraithzord-Foil"] = 1 },
					BattleBackground = { "NoumenChambers" },
					Ranks = { "<stroke color=\"#f5da42\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Wraith</font></stroke>" }
				},
				RewardRates = {
					["Corrupted Crest"] = 1,
					Doomspire = 0.2,
					["Doomspire-Foil"] = 0.08,
					NoumenChambers = 0.02,
					Wraithzord = 0.25,
					["Wraithzord-Foil"] = 0.05,
					["<stroke color=\"#f5da42\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Wraith</font></stroke>"] = 0.1
				}
			}
		}
	},
	["Imperium Invasion"] = {
		Name = "Imperium Invasion",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">The Shedarians and Consulate Plantae march upon Imperium Ultima to steal the Toolbox, Can you take on their army?</stroke>",
		Stages = {
			Normal = {
				Duelist = "InvasionRaidN",
				ButtonColor = color326,
				Rewards = {
					EventCurrency = { ["Ceramic Fish"] = 4 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Shedarian Bubblemancer"] = 1 },
					BattleBackground = { "ImperiumCity", "Toolbox" },
					Ranks = { "Army of One" }
				},
				RewardRates = {
					["Ceramic Fish"] = 1,
					Doomspire = 0.1,
					["Doomspire-Foil"] = 0.04,
					ImperiumCity = 0.01,
					Toolbox = 0.01,
					["Shedarian Bubblemancer"] = 0.15,
					["Army of One"] = 0.1
				}
			},
			Extreme = {
				Duelist = "InvasionRaidEX",
				ButtonColor = color327,
				Rewards = {
					EventCurrency = { ["Ceramic Fish"] = 10 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Shedarian Bubblemancer"] = 1, ["Shedarian Bubblemancer-Foil"] = 1 },
					BattleBackground = { "ImperiumCity", "Toolbox" },
					Ranks = { "<stroke color=\"#8f0000\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Army of One</font></stroke>" }
				},
				RewardRates = {
					["Ceramic Fish"] = 1,
					Doomspire = 0.2,
					["Doomspire-Foil"] = 0.08,
					ImperiumCity = 0.02,
					Toolbox = 0.02,
					["Shedarian Bubblemancer"] = 0.25,
					["Shedarian Bubblemancer-Foil"] = 0.05,
					["<stroke color=\"#8f0000\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Army of One</font></stroke>"] = 0.1
				}
			}
		}
	},
	["Vengeful Machine"] = {
		Name = "Deidre",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">Reincarnated into a Putrid Gnat, Deidre now only seeks two things: To get vengence on her Granddaughter, and to defend the spire that created the fiction that treated her like royalty. With a heavily armed machine as a gift from the Shedarians, She defends the entrance to the base of the Doomspire.</stroke>",
		Stages = {
			Normal = {
				Duelist = "DeidreRaidN",
				ButtonColor = color328,
				Rewards = {
					EventCurrency = { ["Bloomed Flower"] = 4 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Sprouting Belladonna"] = 1 },
					BattleBackground = { "SpireSanctum", "NoumenalChasm" },
					Ranks = { "Sacrifice" }
				},
				RewardRates = {
					["Bloomed Flower"] = 1,
					Doomspire = 0.1,
					["Doomspire-Foil"] = 0.04,
					SpireSanctum = 0.01,
					NoumenalChasm = 0.01,
					["Sprouting Belladonna"] = 0.15,
					Sacrifice = 0.1
				}
			},
			Extreme = {
				Duelist = "DeidreRaidEX",
				ButtonColor = color329,
				Rewards = {
					EventCurrency = { ["Bloomed Flower"] = 10 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = { ["Sprouting Belladonna"] = 1, ["Sprouting Belladonna-Foil"] = 1 },
					BattleBackground = { "SpireSanctum", "NoumenalChasm" },
					Ranks = { "<stroke color=\"#5da66b\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Sacrifice</font></stroke>" }
				},
				RewardRates = {
					["Bloomed Flower"] = 1,
					Doomspire = 0.2,
					["Doomspire-Foil"] = 0.08,
					SpireSanctum = 0.02,
					NoumenalChasm = 0.02,
					["Sprouting Belladonna"] = 0.25,
					["Sprouting Belladonna-Foil"] = 0.05,
					["<stroke color=\"#5da66b\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Sacrifice</font></stroke>"] = 0.1
				}
			}
		}
	},
	["The Grand Overseer"] = {
		Name = "Nyarlhotep",
		Description = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.25\">As its schemes to obtain freedom come to fruition, The Grand Overseer waits as the baseplate of the Doomspire. Will you set this humble one free?</stroke>",
		Stages = {
			Normal = {
				Duelist = "NyarlRaidN",
				ButtonColor = color330,
				Rewards = {
					EventCurrency = { ["Technician Fragment"] = 4 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = {
						["Ark of Survival"] = 1,
						["The Cataclysm"] = 1,
						["Nyarlthotep's Easing"] = 1,
						["Gaunt Antiguardian"] = 1
					},
					BattleBackground = { "SpireBaseplate" },
					Ranks = { "Ｈｕｍｂｌｅ Ｏｎｅ" }
				},
				RewardRates = {
					["Technician Fragment"] = 1,
					Doomspire = 0.1,
					["Doomspire-Foil"] = 0.04,
					SpireBaseplate = 0.01,
					["Ark of Survival"] = 0.15,
					["The Cataclysm"] = 0.15,
					["Nyarlthotep's Easing"] = 0.2,
					["Gaunt Antiguardian"] = 0.1,
					["Ｈｕｍｂｌｅ Ｏｎｅ"] = 0.1
				}
			},
			Extreme = {
				Duelist = "NyarlRaidEX",
				ButtonColor = color331,
				Rewards = {
					EventCurrency = { ["Technician Fragment"] = 10 },
					Packs = { Doomspire = 1, ["Doomspire-Foil"] = 1 },
					Cards = {
						["Ark of Survival"] = 1,
						["The Cataclysm"] = 1,
						["Ark of Survival-Foil"] = 1,
						["The Cataclysm-Foil"] = 1,
						["Nyarlthotep's Easing"] = 1,
						["Gaunt Antiguardian"] = 1,
						["Nyarlthotep's Easing-Foil"] = 1,
						["Gaunt Antiguardian-Foil"] = 1
					},
					BattleBackground = { "SpireBaseplate" },
					Ranks = { "<stroke color=\"#553b5b\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Ｈｕｍｂｌｅ Ｏｎｅ</font></stroke>" }
				},
				RewardRates = {
					["Technician Fragment"] = 1,
					Doomspire = 0.2,
					["Doomspire-Foil"] = 0.08,
					SpireBaseplate = 0.03,
					["Ark of Survival"] = 0.25,
					["The Cataclysm"] = 0.25,
					["Ark of Survival-Foil"] = 0.05,
					["The Cataclysm-Foil"] = 0.05,
					["Nyarlthotep's Easing"] = 0.3,
					["Gaunt Antiguardian"] = 0.2,
					["Nyarlthotep's Easing-Foil"] = 0.1,
					["Gaunt Antiguardian-Foil"] = 0.05,
					["<stroke color=\"#553b5b\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color =\"#000000\">Ｈｕｍｂｌｅ Ｏｎｅ</font></stroke>"] = 0.1
				}
			}
		}
	}
}
