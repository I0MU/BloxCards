



return {
	Act2_FindColo = {
		Stat = "StoryProgress2",
		Amount = 3,
		Requirement = "Act2_Sleep",
		TaskInfo = "Find Colo"
	},
	Act2_Sleep = {
		Stat = "StoryProgress2",
		Amount = 2,
		Requirement = "Act2_FindNinja",
		TaskInfo = "Take a snooze"
	},
	Act2_FindNinja = {
		Stat = "NPCQuestColoTalkedTo",
		Amount = 1,
		Requirement = "CompleteAct1",
		TaskInfo = "Find Demon Ninja and talk to Colo about it"
	},
	PlayTrials = {
		Stat = "BOT_PLAYS_UmberlordTrial",
		Amount = 1,
		Requirement = "FinishTutorial",
		TaskInfo = "Play a match of Umberlord's Trials at the Colosseum",
		TeleportLocation = "TrialsTeleport"
	},
	TalkToPuzzleMaster = {
		Stat = "NPCQuestPuzzleMaster",
		Amount = 1,
		Requirement = "FinishTutorial",
		TaskInfo = "Talk to the Puzzlemaster",
		TeleportLocation = "PuzzlesTeleport"
	},
	CompleteAct1 = {
		Stat = "FinishAct1",
		Amount = 1,
		Requirement = "FinishTutorial",
		TaskInfo = "Use the History Cannon to travel through time and find Razar",
		TeleportLocation = "HistoryCannonTeleport"
	},
	PlayBattleSim = {
		Stat = "BattleSimWonRound",
		Amount = 1,
		Requirement = "CompleteAct1",
		TaskInfo = "Play and win one round of Battle Simulator in the Dueling Research building",
		TeleportLocation = "BattleSimTeleport"
	},
	ViewDoomspire = {
		Stat = "ViewedDoomspireStory",
		Amount = 1,
		Requirement = "FinishTutorial",
		TaskInfo = "Open the menu for Doomspire's Story mode in the Travel menu"
	},
	ReachLevel10 = {
		Stat = "Level",
		Amount = 10,
		Requirement = "FinishTutorial",
		TaskInfo = "Reach level 10 by battling with NPCs or players to unlock trading"
	},
	FinishTutorial = {
		Stat = "StoryProgress",
		Amount = 2,
		TaskInfo = "Enter the HQ and earn your license",
		TeleportLocation = "TutorialTeleport"
	}
}
