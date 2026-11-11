



local t1: {[any]: any} = {
	Blue = Color3.new(0.25, 0.25, 1),
	Red = Color3.new(1, 0.25, 0.25),
	Green = Color3.new(0.175, 0.9, 0.175),
	Yellow = Color3.new(1, 1, 0.25),
	Neutral = Color3.new(1, 1, 1)
}
local t2: {[any]: any} = {
	Blue = Color3.new(0.06, 0.06, 0.23),
	Red = Color3.new(0.23, 0.06, 0.06),
	Green = Color3.new(0.06, 0.23, 0.06),
	Yellow = Color3.new(0.46, 0.31, 0.07),
	Neutral = Color3.new(0.23, 0.23, 0.23)
}
local color3 = Color3.fromRGB(255, 255, 255)
local color32 = Color3.fromRGB(108, 255, 246)
local color33 = Color3.fromRGB(192, 103, 255)
local color34 = Color3.fromRGB(255, 47, 47)
local color35 = Color3.fromRGB(255, 217, 80)
local color36 = Color3.fromRGB(82, 120, 117)
local module: {[any]: any} = {
	-- Set to true to bring the tutorial lady back (intro tutorial, deck builder/shop/quest/battle tutorials).
	TUTOR_LADY_ENABLED = false,
	CURRENT_BALANCE_PATCH = 13,
	CURRENT_OFFER = {
		"BargainsAd",
		"BowlBundle",
		"Halloween25Bundle",
		"HalloweenBundle",
		"BoothGameBundle",
		"CrimpBundle",
		"DemonWarsAct1",
		"StarterBundle",
		"GraceBundle",
		"Testers2Bundle",
		"CombatInitiationBundle",
		"LunarImpactBundle",
		"LunarImpactVIPBundle",
		"BlacksiteBundle",
		"DoomspireAct2",
		"DTTBundle",
		"GelatinVariety",
		"MushipBundle",
		"UGCAd"
	},
	DEBUGMODE = true,
	AUTOSAVE_TIME = 20,
	NOTICES = {
		Decks = "Bowls on sale here!",
		Sets = "Consigners cards on sale here!",
		Crossovers = "Booth Game cards on sale here!",
		EventShop = "Exchange Faction Points for rewards here!",
		Packs = "Hallows Tales seasonal pack now available!"
	},
	CARDSIZE = Vector2.new(470, 750),
	CARDZINDEX = 2,
	CLR = t1,
	CLRTXT = { Blue = "B", Red = "R", Green = "G", Yellow = "Y", Neutral = "C" },
	BGCLR = t2,
	RARECLR = {
		Common = color3,
		Uncommon = color32,
		Rare = color33,
		Epic = color34,
		Legendary = color35,
		Token = color36
	},
	LOGOS = {
		Arkhive = "11761899005",
		Smiley = "11761919783",
		Plurral = "11761920206",
		Nefoco = "11761920150",
		Lordbreaker = "11761920519",
		Astral = "11761920421",
		Vitality = "73806116824053",
		Conquerors = "114331350319813"
	},
	EVENTCURRENCYICON = {
		Necroenzyme = "🧪",
		Balloons = "🎈",
		HallowTreat = "🍬",
		["Leviathan Crest"] = "🟢"
	},
	EVENTCURRENCYIMAGE = {
		Necroenzyme = "12522605621",
		["History Core"] = "128053981504827",
		["Apocryphic Sigil"] = "15637148660",
		["Spire Shards"] = "18425887832",
		["Forgemaster Figure"] = "104878280890105",
		["Wonktooth Figure"] = "129934904551849",
		["Thyyrinyr Figure"] = "125822507396541",
		["Animus Figure"] = "91350965986105",
		["Hallow's Bargains Voucher"] = "98265966163907",
		["Candy Cane"] = "90310508218522",
		["Rainbow Titan Essence"] = "140537017974304",
		Balloons = "109105395656736",
		HallowTreat = "83117134131385",
		["Corrupted Crest"] = "118251627456879",
		["Ceramic Fish"] = "132829321842106",
		["Bloomed Flower"] = "132015459879959",
		["Technician Fragment"] = "134426589315070",
		["Leviathan Crest"] = "139589068491952"
	},
	EVENTCURRENCYCONTEXT = {
		Necroenzyme = "Obtained from Queue battles during the Syndicate Brawl event, Can be exchanged for rewards in the exchange shop.",
		["History Core"] = "Obtained from progressing throughout the story of Blox Cards, Can be sold for a lot of Bloxbux in the exchange shop.",
		["Apocryphic Sigil"] = "Obtained from completing the Zanzel, Perfected Raid, Can be exchanged for rewards in the exchange shop.",
		["Spire Shards"] = "Obtained from weekly and seasonal quest rewards during the Doomspire Preparation event, Can be exchanged for rewards in the exchange shop.",
		["Forgemaster Figure"] = "Obtained from completing the UNIT_4_FORGEMASTER Raid in Doomspire's story mode, Can be exchanged for rewards in the exchange shop.",
		["Wonktooth Figure"] = "Obtained from completing the Prince Wonktooth Raid in Doomspire's story mode, Can be exchanged for rewards in the exchange shop.",
		["Thyyrinyr Figure"] = "Obtained from completing the Thyyrinyr Raid in Doomspire's story mode, Can be exchanged for rewards in the exchange shop.",
		["Animus Figure"] = "Obtained from completing the Animus Raid in Doomspire's story mode, Can be exchanged for rewards in the exchange shop.",
		["Hallow's Bargains Voucher"] = "Obtained from Weekly quests, Can be exchanged for any card from the Hallow's Bargains shop! Expires when weekly quests reset.",
		["Candy Cane"] = "Obtained from the seasonal Krampus raid on the Christmas island, Can be exchanged for rewards in the exchange shop.",
		["Rainbow Titan Essence"] = "Obtained from the Telamon raid, Can be exchanged for rewards in the exchange shop.",
		Balloons = "Obtained from Queue battles and Weekly quests during the 10th anniversary event, Can be exchanged in the exchange shop.",
		HallowTreat = "Obtained from Queue battles during the Halloween event, Can be exchanged in the exchange shop.",
		["Corrupted Crest"] = "Obtained from completing a Challenge Battle Raid which can be unlocked from Doomspire Act 2's Story mode, Can be exchanged for rewards in the exchange shop.",
		["Ceramic Fish"] = "Obtained from completing a Challenge Battle Raid which can be unlocked from Doomspire Act 2's Story mode, Can be exchanged for rewards in the exchange shop.",
		["Bloomed Flower"] = "Obtained from completing a Challenge Battle Raid which can be unlocked from Doomspire Act 2's Story mode, Can be exchanged for rewards in the exchange shop.",
		["Technician Fragment"] = "Obtained from completing a Challenge Battle Raid which can be unlocked from Doomspire Act 2's Story mode, Can be exchanged for rewards in the exchange shop.",
		["Leviathan Crest"] = "Obtained from Battle Queue during the first act of the Demon Wars Faction event, Can be exchanged for rewards in the exchange shop."
	},
	COLORORDER = { "Neutral", "Red", "Green", "Blue", "Yellow" },
	REVERSECOLORORDER = { Neutral = 1, Red = 2, Green = 3, Blue = 4, Yellow = 5 },
	RARITIES = {
		Common = 1,
		Uncommon = 2,
		Rare = 3,
		Epic = 4,
		Legendary = 5,
		Token = 6,
		Shedletsky = 7
	},
	RARITYORDER = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Token",
		"Shedletsky"
	},
	DEFAULT_SETTINGS = {
		["Dark Mode"] = false,
		["Colorblind Mode"] = false,
		["Emoji Studs"] = true,
		["Disable Battle Reminders"] = false,
		["Disable Battle Animations"] = false,
		["Music Volume"] = 50,
		["SFX Volume"] = 50,
		["Quicker Effect Pop-ups"] = false
	},
	DRAFT_ORDER = {
		"Early",
		"Buildarounds",
		"Early",
		"Ramp",
		"Early",
		"Meme",
		"Early",
		"Buildarounds",
		"Control",
		"Early",
		"Ramp",
		"Meme",
		"Early",
		"Buildarounds",
		"Early",
		"Meme"
	},
	DRAFT_CULL_AMOUNT = 8,
	EASY_QUEST_BB = 100,
	HARD_QUEST_BB = 200,
	BB_COST_PER_ROTATION_CARD = 250,
	BARGAINS_ROBUX_PRICE = 100,
	EVENT_CURRENCY_START_AMOUNT = 5,
	FIRST_TICK = 1672916400,
	DAILY_RESET_TICK = 28800,
	WEEKLY_RESET_TICK = 604800,
	ANTI_FORFEIT = 1.25,
	ANTI_TIME = 60,
	ANTI_FARMING_ON = true,
	MIN_PLAYERS_MATCHMAKING = 1,
	APRIL_FOOL_MODE = false,
	RANDOM_CRITS_ENABLED = false,
	APRIL_TIME_TRAVEL = false
}

module.DRAFT_SELECTIONS = #module.DRAFT_ORDER

return module
