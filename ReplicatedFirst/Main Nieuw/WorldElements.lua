



return {
	{
		Stats = {
			BOT_WINS_Chromafex = 1,
			BOT_WINS_Ghashendex = 1,
			BOT_WINS_Erisyphia = 1,
			["BOT_WINS_Wanwood Dryad"] = 1
		},
		Duelists = { "Twobie 2" },
		RemoveDuelists = { "Twobie Finch, Child of 2x2" }
	},
	{
		StatsMustEqual = {
			StarterDeckProgress_R = 1,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			StoryProgress = 0
		},
		Duelists = { "Ptu_R" }
	},
	{
		ReversedRequirementsStats = true,
		Stats = {
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_R = 0
		},
		StatsMustEqual = {
			StoryProgress = 1,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0
		},
		Duelists = { "Tu_R" }
	},
	{
		Stats = {
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_R = 1,
			StoryProgress = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			NightTime = 0
		},
		Duelists = { "Tu_R2" },
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" }
	},
	{
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 1,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			StoryProgress = 0
		},
		Duelists = { "Ptu_G" }
	},
	{
		ReversedRequirementsStats = true,
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_G = 0
		},
		StatsMustEqual = {
			StoryProgress = 1,
			StarterDeckProgress_R = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0
		},
		Duelists = { "Tu_G" }
	},
	{
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_G = 1,
			StoryProgress = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			NightTime = 0
		},
		Duelists = { "Tu_G2" },
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" }
	},
	{
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 1,
			StarterDeckProgress_Y = 0,
			StoryProgress = 0
		},
		Duelists = { "Ptu_B" }
	},
	{
		ReversedRequirementsStats = true,
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_B = 0
		},
		StatsMustEqual = {
			StoryProgress = 1,
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_Y = 0
		},
		Duelists = { "Tu_B" }
	},
	{
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_Y = 1,
			StarterDeckProgress_B = 1,
			StoryProgress = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_Y = 0,
			NightTime = 0
		},
		Duelists = { "Tu_B2" },
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" }
	},
	{
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 1,
			StoryProgress = 0
		},
		Duelists = { "Ptu_Y" }
	},
	{
		ReversedRequirementsStats = true,
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			StarterDeckProgress_Y = 0
		},
		StatsMustEqual = {
			StoryProgress = 1,
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0
		},
		Duelists = { "Tu_Y" }
	},
	{
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			StarterDeckProgress_Y = 1,
			StoryProgress = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			NightTime = 0
		},
		Duelists = { "Tu_Y2" },
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" }
	},
	{
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			StoryProgress = 0
		},
		Duelists = { "Bouncer" }
	},
	{
		MinimumStatsFails = 2,
		ReversedRequirementsStats = true,
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			StoryProgress = 1
		},
		Duelists = { "Bouncer2" },
		RemoveDuelists = { "Tu_R", "Tu_G", "Tu_B", "Tu_Y" }
	},
	{
		MinimumStatsFails = 2,
		Stats = {
			BOT_WINS_EasyMage_R = 1,
			BOT_WINS_EasyMage_G = 1,
			BOT_WINS_EasyMage_B = 1,
			BOT_WINS_EasyMage_Y = 1,
			StoryProgress = 1
		},
		StatsMustEqual = {
			StarterDeckProgress_R = 0,
			StarterDeckProgress_G = 0,
			StarterDeckProgress_B = 0,
			StarterDeckProgress_Y = 0,
			NightTime = 0
		},
		Duelists = { "Bouncer3" },
		RemoveDuelists = { "Tu_R", "Tu_G", "Tu_B", "Tu_Y" },
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" }
	},
	{
		Stats = { BOT_WINS_EasyMage_R = 1 },
		StatsMustEqual = { NightTime = 0 },
		Duelists = { "Ren3" }
	},
	{
		Stats = { StoryProgress = 1 },
		StatsMustEqual = { BOT_WINS_EasyMage_R = 0, StarterDeckProgress_R = 0, NightTime = 0 },
		Duelists = { "Ren2" }
	},
	{
		Stats = { BOT_WINS_EasyMage_Y = 1 },
		Duelists = { "Yuki3" },
		StatsMustEqual = { NightTime = 0 },
		Objects = { "Boombox" }
	},
	{
		Stats = { StoryProgress = 1 },
		StatsMustEqual = { BOT_WINS_EasyMage_Y = 0, StarterDeckProgress_Y = 0, NightTime = 0 },
		Duelists = { "Yuki2" },
		Objects = { "Boombox" }
	},
	{
		Stats = { BOT_WINS_EasyMage_B = 1 },
		StatsMustEqual = { NightTime = 0 },
		Duelists = { "Braxton3" }
	},
	{
		Stats = { StoryProgress = 1 },
		StatsMustEqual = { BOT_WINS_EasyMage_B = 0, StarterDeckProgress_B = 0, NightTime = 0 },
		Duelists = { "Braxton2" }
	},
	{
		Stats = { BOT_WINS_EasyMage_G = 1 },
		StatsMustEqual = { NightTime = 0 },
		Duelists = { "Gaius3" }
	},
	{
		Stats = { StoryProgress = 1 },
		StatsMustEqual = { BOT_WINS_EasyMage_G = 0, StarterDeckProgress_G = 0, NightTime = 0 },
		Duelists = { "Gaius2" }
	},
	{
		ReversedRequirements = true,
		Stats = { BOT_WINS_Colo = 1 },
		Duelists = { "Colo1" }
	},
	{
		Stats = { BOT_WINS_Colo = 1 },
		StatsMustEqual = { StoryProgress = 1 },
		Duelists = { "Colo2", "Razar1" }
	},
	{
		StatsMustEqual = { StoryProgress = 2 },
		Duelists = { "Colo3" }
	},
	{
		Stats = { StoryProgress = 2 },
		StatsMustEqual = { NightTime = 0 },
		Duelists = { "flufflefunz", "weepiewoop73", "Spicy316", "EdgeTheTimelord", "Xeal" },
		Objects = { "BalloonsRed1", "BalloonsRed2", "BalloonsRed3" }
	},
	{
		StatsMustEqual = { StoryProgress = 1 },
		Objects = { "BloxParkBoundary", "BloxParkBoundary2" }
	},
	{
		StatsMustEqual = { NightTime = 0 },
		Objects = { "Billie", "Tess" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = { ["NPCPurchaseLord of Auctions"] = 0 },
		Duelists = { "Miser McBux" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = { ["NPCPurchaseLord of Auctions"] = 1, ["NPCPurchaseBored Mo"] = 0 },
		Duelists = { "Miser McBux2" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = { ["NPCPurchaseLord of Auctions"] = 1, ["NPCPurchaseMo's Dungeon"] = 0 },
		Duelists = { "Miser McBux3" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = {
			["NPCPurchaseLord of Auctions"] = 1,
			["NPCPurchaseI. Cosmogenesis"] = 0
		},
		Duelists = { "Miser McBux4" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = {
			["NPCPurchaseLord of Auctions"] = 1,
			["NPCPurchaseFragmented Creation"] = 0
		},
		Duelists = { "Miser McBux5" }
	},
	{
		Stats = { Level = 10 },
		StatsMustEqual = {
			["NPCPurchaseLord of Auctions"] = 1,
			NPCPurchaseSteveTheExplorerman = 0
		},
		Duelists = { "Miser McBux6" }
	},
	{
		StatsMustEqual = { NPCQuestTaggerActive = 0 },
		Duelists = { "Tyler" }
	},
	{
		StatsMustEqual = { NPCQuestTaggerActive = 1, BOT_WINS_Tagger = 0 },
		Duelists = { "Tyler2", "Tagger" }
	},
	{
		StatsMustEqual = { NPCQuestTaggerActive = 1, BOT_WINS_Tagger = 1 },
		Duelists = { "Tyler3", "Tagger2" }
	},
	{
		StatsMustEqual = { NPCQuestStartDoge = 0 },
		Duelists = { "Skater" }
	},
	{
		StatsMustEqual = { NPCQuestStartDoge = 1, ["BOT_WINS_Intel Doge"] = 0 },
		Duelists = { "Intel Doge" }
	},
	{
		StatsMustEqual = {
			NPCQuestDoge = 1,
			["BOT_WINS_Prince Doge"] = 0,
			NPCQuestPrinceDoge = 0
		},
		Duelists = { "Prince Doge" }
	},
	{
		StatsMustEqual = { ["BOT_WINS_Intel Doge"] = 1, NPCQuestPrinceDoge = 0 },
		Duelists = { "Intel Doge (Dead)" }
	},
	{
		StatsMustEqual = { ["BOT_WINS_Prince Doge"] = 1, NPCQuestPrinceDoge = 0 },
		Duelists = { "Prince Doge (Dead)" }
	},
	{
		StatsMustEqual = { ["BOT_WINS_Prince Doge"] = 1, NPCQuestPrinceDoge = 0 },
		Duelists = { "Prince Doge (Dead)" }
	},
	{
		StatsMustEqual = { NPCQuestAcceptRegan = 0 },
		Duelists = { "Head Professor Regan" }
	},
	{
		StatsMustEqual = { NPCQuestAcceptRegan = 1 },
		Duelists = { "Head Professor Regan2" }
	},
	{
		StatsMustEqual = { NPCQuestMerryswole = 0 },
		Duelists = { "MerryswoleNew" }
	},
	{
		StatsMustEqual = { NPCQuestMerryswole = 1 },
		Duelists = { "Merryswole" }
	},
	{
		StatsMustEqual = { NPCQuestPuzzleMaster = 1 },
		Duelists = { "PuzzleMaster2" }
	},
	{
		StatsMustEqual = { NPCQuestPuzzleMaster = 0 },
		Duelists = { "PuzzleMaster" }
	},
	{
		StatsMustEqual = { StartAct2 = 1 },
		Duelists = { "Duelest Researcher David2", "xxdemonninjaxx2" },
		RemoveDuelists = { "Duelest Researcher David" },
		RemoveObjects = { "DuelingBoundary" },
		Objects = { "BattleSimulator" }
	},
	{
		Stats = { BOT_WINS_demonninjaduelist = 1 },
		Duelists = { "Duelest Researcher Jeremy2", "xxdemonninjaxx3", "ColoTalk" },
		RemoveDuelists = { "xxdemonninjaxx2", "Duelest Researcher Jeremy" }
	},
	{
		Stats = { NPCQuestColoTalkedTo = 1 },
		RemoveDuelists = { "ColoTalk" },
		Duelists = { "SleepDoor" }
	},
	{
		Stats = { StoryProgress2 = 2 },
		Duelists = { "CafeDoor", "CafeDoor2", "NoteFromColo" },
		RemoveDuelists = { "SleepDoor" }
	},
	{
		Stats = { StoryProgress2 = 3 },
		Duelists = { "HCMerchant" },
		RemoveDuelists = { "ColoDate", "HCBarista", "NoteFromColo" }
	},
	{
		StatsMustEqual = { NPCQuestColosseumDevil = 1 },
		Duelists = { "Colosseum Demon2" }
	},
	{
		StatsMustEqual = { NPCQuestColosseumDevil = 0 },
		Duelists = { "Colosseum Demon" }
	},
	{
		StatsMustEqual = { ["NPCPurchaseJunior Permit"] = 0 },
		Duelists = { "Trash Bin" }
	},
	{
		MinimumStatsFails = 1,
		Stats = { ARGNoumenalPathUnlocked = 1, NoumenalPuzzleComplete = 1 },
		Duelists = { "ARGBoss" },
		Objects = { "ARGArea" }
	},
	{
		Stats = { ["BOT_WINS_?????"] = 0 },
		Duelists = {},
		Objects = { "ARGWall" }
	},
	{
		Stats = { ["BOT_WINS_?????"] = 1 },
		Duelists = { "Nyar" },
		Objects = { "ARGArea2" }
	},
	{
		Stats = { FinishAct1 = 1 },
		Duelists = { "Developer1", "Developer2" },
		Objects = { "HQBoundary", "HQBoundary2" }
	},
	{
		StatsMustEqual = { StoryProgress = 2 },
		Duelists = { "xxdemonninjaxx" }
	},
	{
		StatsMustEqual = { BOT_WINS_act1_Blockhead = 0, StoryProgress = 3 },
		Duelists = { "Titano", "Blockhead", "TestDummy" }
	},
	{
		StatsMustEqual = { BOT_WINS_act1_xxshadowslayerxx = 0, StoryProgress = 3 },
		Duelists = { "xxshadowslayerxx" }
	},
	{
		StatsMustEqual = { NinjaFoundS = 0 },
		Stats = { BOT_WINS_act1_xxshadowslayerxx = 1 },
		Duelists = { "xxshadowslayerxx2" }
	},
	{
		StatsMustEqual = { NinjaFoundS = 1, AllNinjaFound = 0 },
		Duelists = { "xxshadowslayerxx3" }
	},
	{
		StatsMustEqual = { NinjaFoundT = 1, AllNinjaFound = 0 },
		Duelists = { "xxdarksamuraixx2" }
	},
	{
		StatsMustEqual = { NinjaFoundG = 1, AllNinjaFound = 0 },
		Duelists = { "xxawesomeninjaxx2" }
	},
	{
		StatsMustEqual = { FinishSpeech = 0, AllNinjaFound = 1 },
		Duelists = { "xxawesomeninjaxx3", "xxdarksamuraixx3", "xxshadowslayerxx4" }
	},
	{
		Stats = { StoryProgress = 3 },
		RemoveObjects = { "VIP_Door" }
	},
	{
		StatsMustEqual = { SavedTitano = 0 },
		Stats = { BOT_WINS_act1_Blockhead = 1 },
		Duelists = { "Titano2" }
	},
	{
		StatsMustEqual = { HasGravityCoil = 0 },
		Stats = { BOT_WINS_act1_Blockhead = 1, SavedTitano = 1 },
		Duelists = { "Meeboid Cultist2" }
	},
	{
		Stats = { HasGravityCoil = 1, BOT_WINS_act1_Blockhead = 1, SavedTitano = 1 },
		Duelists = { "Meeboid Cultist3", "Seesaw" }
	},
	{
		StatsMustEqual = { NinjaFoundG = 0 },
		Stats = { HasGravityCoil = 1, BOT_WINS_act1_Blockhead = 1, SavedTitano = 1 },
		Duelists = { "xxawesomeninjaxx" }
	},
	{
		Stats = { BOT_WINS_act1_Noobloxxer = 1 },
		Duelists = { "NoobloxxerDead" }
	},
	{
		StatsMustEqual = { NinjaFoundT = 0 },
		Stats = { BOT_WINS_act1_Noobloxxer = 1 },
		Duelists = { "xxdarksamuraixx" }
	},
	{
		StatsMustEqual = { HasVIPShirt = 0 },
		Stats = { BOT_WINS_act1_Noobloxxer = 1 },
		Duelists = { "VIP_Door2" }
	},
	{
		StatsMustEqual = { NinjaFoundT = 0, BOT_WINS_act1_Noobloxxer = 0, StoryProgress = 3 },
		Duelists = { "VIP_Door1", "Noobloxxer" }
	},
	{
		StatsMustEqual = { SpawnNoobloxxer = 1, BOT_WINS_act1_Noobloxxer = 0 },
		Duelists = { "Noobloxxer" }
	},
	{
		StatsMustEqual = {
			FinishSpeech = 1,
			BOT_WINS_Act1StoryRaid = 0,
			BOT_PLAYS_Act1StoryRaid = 0
		},
		Duelists = { "HQ Basement" }
	},
	{
		Stats = { BOT_PLAYS_Act1StoryRaid = 1 },
		StatsMustEqual = { FinishSpeech = 1, PostTelamonBattle = 0 },
		Duelists = { "HQ BasementQuick" }
	},
	{
		StatsMustEqual = { PostTelamonBattle = 1, FinishAct1 = 0 },
		Duelists = { "Colo4" }
	},
	{
		StatsMustEqual = { StartAct2 = 0, FinishAct1 = 1 },
		Duelists = { "Colo5" }
	},
	{
		ReversedRequirementsStats = true,
		Stats = { BOT_WINS_act1_Blockhead = 1, SavedTitano = 1 },
		Duelists = { "Meeboid Cultist" }
	},
	{
		StatsMustEqual = { NightTime = 1 },
		Duelists = {
			"Razarevil",
			"BouncerNight",
			"BigChillin",
			"FatherTime",
			"TABLE NPC Night",
			"TABLE NPC 2 Night"
		},
		Objects = {
			"DoorBoundaryNight1",
			"DoorBoundaryNight2",
			"DoorBoundaryNight3",
			"RazarCutsceneBox"
		},
		RemoveObjects = { "BoundaryBouncer", "BoundaryBouncer2" },
		RemoveDuelists = {
			"TABLE NPC",
			"TABLE NPC 2",
			"Bobert",
			"Jonesy",
			"Wishnite",
			"Civ",
			"Alyssa",
			"DuelistDevil"
		}
	},
	{
		StatsMustEqual = { SideQuestProgress = 0 },
		Stats = { StoryProgress2 = 3, Level = 10 },
		Duelists = { "SaxophonistQuestGiver" },
		RemoveDuelists = { "Saxophonist" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 1 },
		Duelists = { "Phone" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 2, NightTime = 0 },
		Duelists = { "SleepDoor1" }
	},
	{
		Stats = { SideQuestProgress = 3 },
		Duelists = {
			"Teiygen4",
			"Razar4",
			"SearchSpot1",
			"SearchSpot2",
			"SearchSpot3",
			"Act2Computer",
			"JohnDoeDream"
		},
		Objects = { "RadChair", "TeiygenPhone" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 4 },
		Duelists = { "DoorBarrier" }
	},
	{
		Stats = { SideQuestProgress = 5 },
		RemoveDuelists = { "Teiygen4", "Razar4", "SearchSpot1", "SearchSpot2", "SearchSpot3" },
		RemoveObjects = { "RadChair", "TeiygenPhone", "DoorBoundary" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 5 },
		Duelists = { "Teiygen5", "Razar5" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 6 },
		Duelists = { "Teiygen6", "Razar6", "JohnDoeDream" },
		Objects = { "JohnCutsceneBox" }
	},
	{
		Stats = { SideQuestProgress = 6 },
		RemoveDuelists = { "Act2Computer" },
		RemoveObjects = { "EvilWall" }
	},
	{
		StatsMustEqual = { SideQuestProgress = 8, BOT_WINS_Act1SecretRaid = 0 },
		Duelists = { "TeiygenPreJohn", "RazarPreJohn", "John Doe Fight" }
	},
	{
		Stats = { BOT_WINS_Act1SecretRaid = 1 },
		Duelists = { "PostJohn" }
	},
	{
		Stats = { SideQuestProgress = 10 },
		Duelists = { "PostJohn2", "SaxophonistShopKeeper", "Razar7" },
		RemoveDuelists = { "PostJohn", "Saxophonist", "Trumpeteer" }
	},
	{
		Stats = { SideQuestProgress = 11 },
		RemoveDuelists = { "Razar7" }
	},
	{
		Stats = { SideQuestProgress = 1 },
		RemoveDuelists = {
			"TestDummy",
			"Blockhead",
			"Titano",
			"Meeboid Cultist3",
			"Guest 1800",
			"NoobNoob",
			"NoobloxxerDead",
			"BigEye",
			"Seesaw",
			"Developer1",
			"Developer2",
			"HQ BasementQuick",
			"Celestial"
		}
	},
	{
		StatsMustEqual = { CafeSpawns = 1 },
		Duelists = { "CafeBobert", "CafeJonesy", "CafeHarvard", "CafeMoth" }
	}
}
