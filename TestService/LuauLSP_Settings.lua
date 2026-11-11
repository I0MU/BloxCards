



local workspace: Workspace = game:GetService("Workspace")
local players: Players = game:GetService("Players")
local lighting: Lighting = game:GetService("Lighting")
local replicatedFirst: ReplicatedFirst = game:GetService("ReplicatedFirst")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local serverScriptService: ServerScriptService = game:GetService("ServerScriptService")
local serverStorage: ServerStorage = game:GetService("ServerStorage")
local starterGui: StarterGui = game:GetService("StarterGui")
local starterPack: StarterPack = game:GetService("StarterPack")
local starterPlayer: StarterPlayer = game:GetService("StarterPlayer")
local soundService: SoundService = game:GetService("SoundService")
local chat: Chat = game:GetService("Chat")
local localizationService: LocalizationService = game:GetService("LocalizationService")

return {
	port = 3667,
	startAutomatically = false,
	include = {
		workspace,
		players,
		lighting,
		replicatedFirst,
		replicatedStorage,
		serverScriptService,
		serverStorage,
		starterGui,
		starterPack,
		starterPlayer,
		soundService,
		chat,
		localizationService,
		game:GetService("TestService")
	}
}
