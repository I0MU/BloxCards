--[[ ServerScriptService/Modules/Config  (ModuleScript)
Every value marked ASSUMED is a design decision I had to guess. Change freely.
]]
return {
	DATASTORE_NAME = "PLCE_PlayerData_v1",
	AUTOSAVE_INTERVAL = 60,

	-- Decks
	DECK_SIZE = 40, -- client shows "x/40 Cards"
	MAX_DECK_SLOTS = 100, -- players can save up to 100 decks (was 10)
	RARITY_LIMITS = { Common = 4, Uncommon = 3, Rare = 2, Epic = 1, Legendary = 1, Token = 0 }, -- from client DeckWouldBeFull
	MAX_DECK_NAME_LENGTH = 30,

	-- When true, every profile that loads is topped up to a full playset of every card in CardLibrary
	-- (foils and alt arts included). Never removes cards. Set to false to go back to normal progression.
	UNLOCK_ALL_CARDS = true,

	-- Starter decks, picked on the first-join screen (Red/Blue/Green/Yellow).
	-- Fill in as { Red = { ["Card Name"] = copies, ... }, ... }.
	-- If a color is left out, DeckHandlers falls back to a guess built from StarterCard flags.
	STARTER_DECKS = {},

	-- New player defaults
	DEFAULT_MONEY = 0, -- ASSUMED
	DEFAULT_SLEEVE = "Basic",
	DEFAULT_BACKGROUND = "", -- "" is the free entry in BattleBackgrounds

	-- Factions (the Frames inside the client's FactionMenu). ASSUMED season id; bump it to start a new season.
	FACTION_SEASON_ID = 1,
	FACTIONS = { Leviathan = true, Conquerors = true },

	DEFAULT_SETTINGS = {
		["SFX Volume"] = 50, -- ASSUMED
		["Music Volume"] = 50, -- ASSUMED
		["Dark Mode"] = false,
		["Colorblind Mode"] = false,
		["Emoji Studs"] = false,
		["Disable Battle Reminders"] = false,
		["Disable Battle Animations"] = false,
		["Quicker Effect Pop-ups"] = false,
	},
	-- "slider" = number 0..100, "switch" = boolean (taken from the client Settings menu)
	SETTING_TYPES = {
		["SFX Volume"] = "slider",
		["Music Volume"] = "slider",
		["Dark Mode"] = "switch",
		["Colorblind Mode"] = "switch",
		["Emoji Studs"] = "switch",
		["Disable Battle Reminders"] = "switch",
		["Disable Battle Animations"] = "switch",
		["Quicker Effect Pop-ups"] = "switch",
	},
}