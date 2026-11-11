



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)

require(script.Parent.Contextualize)

local dialog2 = require(script.Parent.Dialog2)
local client = require(script.Parent.Network).client
local LocalPlayer = game.Players.LocalPlayer

return {
	[2] = function()
		local dialog2Start = dialog2.Start
		local firstCannonDialog = require(replicatedStorage.Dialogue.FirstCannonDialog)

		dialog2Start(firstCannonDialog, workspace.Duelists.Colo3)
	end,
	[3] = function()
		local u12: boolean = false

		task.spawn(function()
			client.DoHistoryCannonPortalAnimation()
			u12 = true
		end)
		client.SetStoryData({
			Sky = "Act1Sky",
			SpawnLocation = "Act1SpawnLocation",
			LightingProfile = "Act1"
		})
		LocalPlayer.Character:PivotTo(workspace.Spawns.Act1SpawnLocation.CFrame * CFrame.new(0, 2, 0))

		local v13 = data.GetQuestStats()

		if not v13.FinishSpeech or v13.FinishSpeech == 0 then
			if v13.SavedTitano and v13.SavedTitano > 0 then
				client.XdnFollowYou(true)
			else
				client.XdnFollowYou(false)
			end
		end

		repeat
			task.wait(0.1)
		until u12 == true

		client.EnterZone("Robloxia", "2164 BC")
		audioService.SetLobbyTheme("Act1Area")
		audioService.ChangeSong("Act1Area")
		transition.ToggleBlack(-1, 0.5)
		handy.Show()
	end,
	[4] = function()
		local u14: boolean = false

		task.spawn(function()
			client.DoHistoryCannonPortalAnimation()
			u14 = true
		end)
		client.SetStoryData({ SpawnLocation = "NightSpawnPos", Sky = "NightSky" })
		LocalPlayer.Character:PivotTo(workspace.Spawns.TeiygenSpawnPos.CFrame)
		data.GetQuestStats()

		repeat
			task.wait(0.1)
		until u14 == true

		client.EnterZone("???", "2164 BC")
		audioService.SetLobbyTheme("HorrorTheme")
		audioService.ChangeSong("HorrorTheme")
		transition.ToggleBlack(-1, 0.5)
		handy.Show()
	end
}
