



local function tableGenerator(p1, p2)
	local t1: {[any]: any} = {}

	for i = 1, p2 do
		table.insert(t1, p1 .. i)
	end

	return t1
end

local v2 = tableGenerator("CT_Treasure_", 9)
local v3 = tableGenerator("CT_LesserTreasure_", 17)
local color3 = Color3.fromRGB(255, 200, 96)
local color32 = Color3.fromRGB(255, 200, 96)
local color33 = Color3.fromRGB(90, 225, 255)
local color34 = Color3.fromRGB(255, 60, 60)

return {
	["CT_Parking Lot"] = {
		Name = "Parking Lot",
		Cutscene = "Parking Lot",
		Color = color3,
		Path = {
			Start = {
				ChooseCard = {
					{ "Choose1From3Cards", v2 },
					{ "End" }
				},
				ChooseNothing = { { "End" } }
			}
		}
	},
	["CT_Parking Lot_HM"] = {
		Name = "Parking Lot",
		Cutscene = "Parking Lot_HM",
		Color = color32,
		Path = {
			Start = {
				ChooseCard = {
					{
						"Choose1From3Cards",
						{
							"CT_StartingTreasure_1",
							"CT_StartingTreasure_2",
							"CT_StartingTreasure_3"
						}
					},
					{ "GoTo", "Start2" }
				},
				ChooseNothing = { { "GoTo", "Start2" } }
			},
			Start2 = {
				Proceed = {
					{ "AddCard", "CT_Bad_4" },
					{ "End" }
				}
			}
		}
	},
	["CT_G_NeFoCo Warehouse"] = {
		Name = "NeFoCo Warehouse",
		Cutscene = "NeFoCo Warehouse",
		Path = {
			Start = {
				Rummage1 = {
					{ "AddCard", "CT_Bad_2" },
					{ "GoTo", "FirstTreasure" }
				},
				Leave = { { "End" } }
			},
			FirstTreasure = {
				Proceed = {
					{ "AddRandomTreasure", v3 },
					{ "GoTo", "Second" }
				}
			},
			Second = {
				Rummage2 = {
					{ "AddCard", "CT_Bad_2" },
					{ "AddCard", "CT_Bad_2" },
					{ "GoTo", "SecondTreasure" }
				},
				Leave = { { "End" } }
			},
			SecondTreasure = {
				Proceed = {
					{ "AddRandomTreasure", v3 },
					{ "GoTo", "Third" }
				}
			},
			Third = {
				Rummage3 = {
					{ "AddCard", "CT_Bad_2" },
					{ "AddCard", "CT_Bad_2" },
					{ "AddCard", "CT_Bad_2" },
					{
						"ModifyRunData",
						{ ExhaustedWarehouse = true }
					},
					{ "GoTo", "ThirdTreasure" }
				},
				Leave = { { "End" } }
			},
			ThirdTreasure = {
				Proceed = {
					{ "AddRandomTreasure", v3 },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Plurral Hangout"] = {
		Name = "Plurral Hangout",
		Cutscene = "Plurral Hangout",
		Path = {
			Start = {
				Rummage1 = {
					{ "Choose1From3Cards", v3 },
					{ "GoTo", "FirstTreasure" }
				},
				Leave = { { "End" } }
			},
			FirstTreasure = {
				Proceed = {
					{ "AddCard", "CT_Bad_5" },
					{ "GoTo", "Second" }
				}
			},
			Second = {
				Rummage2 = {
					{ "Choose1From3Cards", v3 },
					{ "GoTo", "SecondTreasure" }
				},
				Leave = { { "End" } }
			},
			SecondTreasure = {
				Proceed = {
					{ "AddCard", "CT_Bad_5" },
					{ "AddCard", "CT_Bad_5" },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Rest Stop"] = {
		Name = "Rest Stop",
		Cutscene = "Rest Stop",
		Path = {
			Start = {
				Rest = {
					{ "IncrementLife", 1000 },
					{ "RemoveCard", "CT_Bad_1" },
					{ "RemoveCard", "CT_Bad_2" },
					{ "RemoveCard", "CT_Bad_3" },
					{ "End" }
				},
				Scavenge = {
					{ "AddRandomTreasure", v3 },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Empty Street"] = {
		Name = "Empty Street",
		Cutscene = "Empty Street",
		Path = {
			Start = {
				Save = {
					{ "AddCard", "CT_ObtainableToken_1" },
					{ "End" }
				},
				Finish = {
					{ "AddCard", "CT_Bad_1" },
					{ "GoTo", "Finish2" }
				}
			},
			Finish2 = {
				Proceed = {
					{ "AddRandomTreasure", v3 },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Troubled Arkhivist"] = {
		Name = "Troubled Arkhivist",
		Cutscene = "Troubled Arkhivist",
		Path = {
			Start = {
				Proceed = {
					{ "AddToOpponentDeck", "CT_ObtainableToken_2_Token" },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Troubled Arkhivist_2"] = {
		Name = "Troubled Arkhivist",
		Color = color33,
		Cutscene = "Troubled Arkhivist_2",
		Path = {
			Start = {
				Proceed = {
					{ "RemoveCard", "CT_ObtainableToken_2" },
					{ "GoTo", "Start2" }
				}
			},
			Start2 = {
				Proceed = {
					{
						"ModifyRunData",
						{ DroneSaved = true }
					},
					{ "Choose1From3Cards", v2 },
					{ "End" }
				}
			}
		}
	},
	["CT_G_The Shelters"] = {
		Name = "The Shelters",
		Cutscene = "The Shelters",
		Path = {
			Start = {
				Proceed = {
					{ "ChooseRemoveCardsFromDeck", 3 },
					{ "End" }
				},
				Leave = { { "End" } }
			}
		}
	},
	["CT_G_Impish Photographer"] = {
		Name = "Impish Photographer",
		Cutscene = "Impish Photographer",
		Path = {
			Start = {
				Proceed = {
					{ "AddCard", "CT_ObtainableToken_3" },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Impish Photographer_2"] = {
		Name = "Impish Photographer",
		Color = color34,
		Cutscene = "Impish Photographer_2",
		Path = {
			Start = {
				Proceed = {
					{ "RemoveCard", "CT_ObtainableToken_3_Token" },
					{ "RemoveCard", "CT_ObtainableToken_3_Token" },
					{ "RemoveCard", "CT_ObtainableToken_3_Token" },
					{ "GoTo", "Start2" }
				}
			},
			Start2 = {
				Proceed = {
					{
						"ModifyRunData",
						{ PhotoDelivered = true }
					},
					{ "Choose1From3Cards", v2 },
					{ "End" }
				}
			}
		}
	},
	CT_G_Pothole = {
		Name = "Pothole",
		Cutscene = "Pothole",
		Path = {
			Start = {
				Proceed = {
					{ "AddCard", "CT_Bad_1" },
					{ "AddCard", "CT_Bad_2" },
					{ "AddCard", "CT_Bad_3" },
					{ "GoTo", "Start2" }
				}
			},
			Start2 = {
				Proceed = {
					{ "AddRandomTreasureNoChoice", v2 },
					{ "End" }
				}
			}
		}
	},
	CT_G_Lab = {
		Name = "Lab",
		Cutscene = "Lab",
		Path = {
			Start = {
				Proceed = {
					{ "AddCard", "CT_ObtainableToken_4" },
					{ "AddCard", "CT_ObtainableToken_4" },
					{ "End" }
				}
			}
		}
	},
	["CT_G_Old Lady"] = {
		Name = "Old Lady",
		Cutscene = "Old Lady",
		Path = {
			Start = {
				Proceed = {
					{
						"Choose1From3Cards",
						{ "CT_Candy_1", "CT_Candy_2", "CT_Candy_3", "CT_Candy_4" }
					},
					{ "End" }
				},
				Leave = {
					{
						"ModifyRunData",
						{ OldLadyIgnored = true }
					},
					{ "End" }
				}
			}
		}
	},
	CT_G_Firepit = {
		Name = "Firepit",
		Cutscene = "Firepit",
		Path = {
			Start = {
				Proceed = {
					{ "ChooseRemoveNormalCardsFromDeck", 6 },
					{ "End" }
				},
				Leave = { { "End" } }
			}
		}
	},
	CT_G_Marketeer = {
		Name = "Marketeer",
		Cutscene = "Marketeer",
		Path = {
			Start = {
				Proceed = {
					{ "GoTo", "Start2" },
					{ "ChooseRemoveTreasureFromDeck", 1 }
				},
				Leave = { { "End" } }
			},
			Start2 = {
				Proceed = {
					{
						"ChooseMultipleFrom8",
						{
							{
								"Neodragon Container",
								"Crow of Eternal Torment",
								"Bird of Eternal Paradise",
								"Parrot of Eternal Dominion",
								"Eternal Tweety",
								"Drager's Disgust",
								"TR6",
								"TB5",
								"TG2",
								"ZanzelApocryphantasm",
								"Love Note",
								"Hallow's Bargain-CE",
								"SCAM_CHEAT",
								"SCAM1",
								"DRRegimen",
								"DROfficer",
								"Lezus 1",
								"Spatial Soul",
								"Havaluvian Chop Suey",
								"Robloxian Trowel",
								"Crystal of Death's Vengence",
								"Crystal of Intellect's Scheme",
								"Telamon",
								"Despacito 2",
								"CT_Bad_4",
								"Bored Mo",
								"K card",
								"Glaurung",
								"MotorcyclistTerrain",
								"Bunny Token"
							},
							3
						}
					},
					{ "End" }
				},
				Poor = { { "End" } }
			}
		}
	},
	CT_G_Chairman = {
		Name = "The Chairman",
		Cutscene = "Chairman",
		Path = {
			Start = {
				Proceed = {
					{ "AddCard", "Tag Team Tactics" },
					{ "AddCard", "CT_ObtainableToken_5" },
					{ "GoTo", "Start2" }
				},
				Leave = { { "End" } }
			},
			Start2 = {
				Proceed = {
					{
						"AddRandomTreasureNoChoice",
						{
							"Emotionless Oddsmaker",
							"Insane Oddsmaker",
							"Pathetic Oddsmaker",
							"Ailing Oddsmaker"
						}
					},
					{
						"AddRandomTreasureNoChoice",
						{
							"Emotionless Oddsmaker",
							"Insane Oddsmaker",
							"Pathetic Oddsmaker",
							"Ailing Oddsmaker"
						}
					},
					{ "RemoveAllDuplicates" },
					{ "End" }
				}
			}
		}
	}
}
