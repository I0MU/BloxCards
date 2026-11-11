



local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local debugUI = playerGui:WaitForChild("DebugUI")
local serverInformation = playerGui:WaitForChild("ServerInformation")
local userInputService: UserInputService = game:GetService("UserInputService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local console = require(script.Console)
local network = require(script.Parent.Parent.Network)
local transition = require(script.Parent.Parent.Transition)
local handy = require(script.Parent.Parent.Handy)

require(script.Parent.Parent.DuelMenu)

local umberlordMenu = require(script.Parent.Parent.UmberlordMenu)
local simulatorMenu = require(script.Parent.Parent.SimulatorMenu)

require(replicatedStorage.Animation)

local cardLibrary = require(replicatedStorage.CardLibrary)
local config = require(game.ReplicatedStorage.CONFIG)

require(script.Parent.Parent.Dialog2)
require(script.Parent.Parent.RaidMenu)
client = network.client

local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer

require(replicatedStorage.AudioService)
require(script.Parent.Parent.ScrollListMenu)
require(script.Parent.Parent.LoreMenu)

local dsa2StoryMenu = require(script.Parent.Parent.DSA2StoryMenu)
local creditsHandler = require(script.Parent.Parent.CreditsHandler)
local playerGuiConsole = playerGui:WaitForChild("Console")
local t1 = {
	cardname = {}
}

for k, v in pairs(cardLibrary) do
	if not v.Foil then
		t1.cardname[k] = v.Name
	end
end

local t2: {[any]: any} = {
	draw = function(p1)
		network.FireServer("DebugFunc", "draw", client.battleId, p1)
	end,
	drawopponent = function(p2)
		network.FireServer("DebugFunc", "drawopponent", client.battleId, p2)
	end,
	summon = function(p3)
		network.FireServer("DebugFunc", "summon", client.battleId, p3)
	end,
	summonopponent = function(p4)
		network.FireServer("DebugFunc", "summonopponent", client.battleId, p4)
	end,
	summonterrain = function(p5)
		network.FireServer("DebugFunc", "summonterrain", client.battleId, p5)
	end,
	summonopponentterrain = function(p6)
		network.FireServer("DebugFunc", "summonopponentterrain", client.battleId, p6)
	end,
	give = function(p7)
		network.FireServer("DebugFunc", "give", client.battleId, p7)
	end,
	giveopponent = function(p8)
		network.FireServer("DebugFunc", "giveopponent", client.battleId, p8)
	end,
	baseplate = function(p9)
		network.FireServer("DebugFunc", "baseplate", client.battleId, p9)
	end,
	baseplateopponent = function(p10)
		network.FireServer("DebugFunc", "baseplateopponent", client.battleId, p10)
	end
}

local t3: {[any]: any} = {
	draw = { "number" },
	drawopponent = { "number" },
	summon = { "cardname" },
	summonopponent = { "cardname" },
	summonterrain = { "cardname" },
	summonopponentterrain = { "cardname" },
	give = { "cardname" },
	giveopponent = { "cardname" },
	baseplate = { "cardname" },
	baseplateopponent = { "cardname" }
}

console.Init(playerGuiConsole.ConsoleBar.Box, playerGuiConsole.ConsoleBar, t3, t1)

function console.FireDebugFunc(p11, p12: number?)
	if not t2[p11] then
		return
	end

	if t3[p11] and t3[p11][1] == "number" then
		p12 = tonumber(p12)
	end

	t2[p11](p12)
end

userInputService.InputEnded:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.KeyCode == Enum.KeyCode.RightShift then
		playerGuiConsole.Enabled = not playerGuiConsole.Enabled

		if playerGuiConsole.Enabled then
			playerGuiConsole.ConsoleBar.Box:CaptureFocus()

			return
		end

		playerGuiConsole.ConsoleBar.Box:ReleaseFocus()

		return
	end

	if input.KeyCode == Enum.KeyCode.RightControl then
		local text: string = tostring(LocalPlayer.userId)

		network.FireServer("RequestBattle", {
			Name = "Goldfish",
			Parent = true,
			Duelist = "Goldfish",
			QuickIntro = true,
			userId = -999999 - text
		})

		return
	end

	if input.KeyCode == Enum.KeyCode.PageUp then
		local text: string = tostring(LocalPlayer.userId)

		network.FireServer("RequestBattle", {
			Name = "Zanzel",
			Parent = true,
			Duelist = "ZanzelRaid",
			QuickIntro = true,
			userId = -999999 - text
		})

		return
	end

	if input.KeyCode ~= Enum.KeyCode.PageDown then
		return
	end

	if debugUI.Enabled == true then
		debugUI.Enabled = false
		serverInformation.Enabled = false

		return
	end

	debugUI.Enabled = true
	serverInformation.Enabled = true
end)
debugUI.Enabled = true
debugUI.Genderfluid.MouseButton1Click:Connect(function()
	debugUI.ScrollingFrame.Visible = not debugUI.ScrollingFrame.Visible
end)
t1 = function(name, p16)
	local clone = debugUI.ScrollingFrame.Template:Clone()

	clone.Text = name
	clone.Name = name
	clone.MouseButton1Click:Connect(p16)
	clone.Parent = debugUI.ScrollingFrame
	clone.Visible = true
end

local t4: {[any]: any} = { "R", "G", "B", "Y", "" }
local clone = debugUI.ScrollingFrame.Template:Clone()

clone.Text = "ResetProgressToColo"
clone.Name = "ResetProgressToColo"
clone.MouseButton1Click:Connect(function()
	networkInvokeServer("DebugResetStoryProgressSpecific", {
		StoryProgress = 1,
		BOT_WINS_EasyMage_R = 1,
		BOT_WINS_EasyMage_G = 1,
		BOT_WINS_Colo = 0
	})
	transition.ToggleBlack(1, 0.3)
	client.UpdateWorld()
	transition.ToggleBlack(-1, 0.3)
end)
clone.Parent = debugUI.ScrollingFrame
clone.Visible = true

local clone2 = debugUI.ScrollingFrame.Template:Clone()

clone2.Text = "ResetWeek"
clone2.Name = "ResetWeek"
clone2.MouseButton1Click:Connect(function()
	local networkFireServer = network.FireServer
	local timestamp = os.time()
	local floored = math.floor((timestamp - config.FIRST_TICK) / config.WEEKLY_RESET_TICK)

	networkFireServer("WeekReset", floored)
end)
clone2.Parent = debugUI.ScrollingFrame
clone2.Visible = true

local clone3 = debugUI.ScrollingFrame.Template:Clone()

clone3.Text = "ResetStoryProgress"
clone3.Name = "ResetStoryProgress"
clone3.MouseButton1Click:Connect(function()
	networkInvokeServer("DebugResetStoryProgressSpecific", {
		StoryProgress = 0,
		BOT_WINS_EasyMage_R = 0,
		BOT_WINS_EasyMage_G = 0,
		BOT_WINS_EasyMage_Y = 0,
		BOT_WINS_Colo = 0,
		SavedTitano = 0,
		HasGravityCoil = 0,
		SpawnNoobloxxer = 0,
		HasVIPShirt = 0,
		NinjaFoundG = 0,
		NinjaFoundT = 0,
		NinjaFoundS = 0,
		AllNinjaFound = 0,
		FinishSpeech = 0,
		FinishPostSpeech = 0,
		PostTelamonBattle = 0,
		BOT_WINS_act1_xxshadowslayerxx = 0,
		BOT_WINS_act1_Noobloxxer = 0,
		BOT_WINS_act1_Blockhead = 0,
		BOT_PLAYS_Act1StoryRaid = 0,
		BOT_WINS_Act1StoryRaid = 0,
		FinishAct1 = 0,
		StartAct2 = 0,
		NightTime = 0,
		BOT_WINS_demonninjaduelist = 0,
		NPCQuestColoTalkedTo = 0,
		StoryProgress2 = 0,
		SideQuestProgress = 0,
		BOT_WINS_Act1SecretRaid = 0
	})
	client.UpdateWorld()
end)
clone3.Parent = debugUI.ScrollingFrame
clone3.Visible = true

local clone4 = debugUI.ScrollingFrame.Template:Clone()

clone4.Text = "StartAct2"
clone4.Name = "StartAct2"
clone4.MouseButton1Click:Connect(function()
	networkInvokeServer("DebugResetStoryProgressSpecific", {
		StoryProgress = 3,
		BOT_WINS_EasyMage_R = 1,
		BOT_WINS_EasyMage_G = 1,
		BOT_WINS_EasyMage_Y = 1,
		BOT_WINS_Colo = 1,
		SavedTitano = 1,
		HasGravityCoil = 1,
		SpawnNoobloxxer = 1,
		HasVIPShirt = 1,
		NinjaFoundG = 1,
		NinjaFoundT = 1,
		NinjaFoundS = 1,
		AllNinjaFound = 1,
		FinishSpeech = 1,
		FinishPostSpeech = 1,
		PostTelamonBattle = 1,
		BOT_WINS_act1_xxshadowslayerxx = 1,
		BOT_WINS_act1_Noobloxxer = 1,
		BOT_WINS_act1_Blockhead = 1,
		BOT_PLAYS_Act1StoryRaid = 1,
		BOT_WINS_Act1StoryRaid = 1,
		FinishAct1 = 1,
		StartAct2 = 1,
		NightTime = 0,
		BOT_WINS_demonninjaduelist = 0,
		NPCQuestColoTalkedTo = 0,
		StoryProgress2 = 0,
		SideQuestProgress = 0,
		BOT_WINS_Act1SecretRaid = 0
	})
	client.UpdateWorld()
end)
clone4.Parent = debugUI.ScrollingFrame
clone4.Visible = true

local clone5 = debugUI.ScrollingFrame.Template:Clone()

clone5.Text = "John Fight"
clone5.Name = "John Fight"
clone5.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "john",
		Parent = true,
		Duelist = "Act1SecretRaid",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone5.Parent = debugUI.ScrollingFrame
clone5.Visible = true

local clone6 = debugUI.ScrollingFrame.Template:Clone()

clone6.Text = "RazarPostBattle"
clone6.Name = "RazarPostBattle"
clone6.MouseButton1Click:Connect(function()
	client.PostRazarFight()
end)
clone6.Parent = debugUI.ScrollingFrame
clone6.Visible = true

local clone7 = debugUI.ScrollingFrame.Template:Clone()

clone7.Text = "TPAct2SidequestMap"
clone7.Name = "TPAct2SidequestMap"
clone7.MouseButton1Click:Connect(function()
	LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Markers.Act2_TeiygenCutsceneSpawn.CFrame
end)
clone7.Parent = debugUI.ScrollingFrame
clone7.Visible = true

local clone8 = debugUI.ScrollingFrame.Template:Clone()

clone8.Text = "UmberlordsTrial"
clone8.Name = "UmberlordsTrial"
clone8.MouseButton1Click:Connect(function()
	umberlordMenu.OpenMenu()
end)
clone8.Parent = debugUI.ScrollingFrame
clone8.Visible = true

local clone9 = debugUI.ScrollingFrame.Template:Clone()

clone9.Text = "BattleSimulator"
clone9.Name = "BattleSimulator"
clone9.MouseButton1Click:Connect(function()
	simulatorMenu.OpenMenu()
end)
clone9.Parent = debugUI.ScrollingFrame
clone9.Visible = true

local clone10 = debugUI.ScrollingFrame.Template:Clone()

clone10.Text = "TestBattlePositions"
clone10.Name = "TestBattlePositions"
clone10.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Test",
		Parent = true,
		Duelist = "TestCustomPositions",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone10.Parent = debugUI.ScrollingFrame
clone10.Visible = true

local clone11 = debugUI.ScrollingFrame.Template:Clone()

clone11.Text = "DS2_0 VN"
clone11.Name = "DS2_0 VN"
clone11.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_0")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone11.Parent = debugUI.ScrollingFrame
clone11.Visible = true

local clone12 = debugUI.ScrollingFrame.Template:Clone()

clone12.Text = "DS2_1 VN"
clone12.Name = "DS2_1 VN"
clone12.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_1")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone12.Parent = debugUI.ScrollingFrame
clone12.Visible = true

local clone13 = debugUI.ScrollingFrame.Template:Clone()

clone13.Text = "DS2_2 VN"
clone13.Name = "DS2_2 VN"
clone13.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_2")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone13.Parent = debugUI.ScrollingFrame
clone13.Visible = true

local clone14 = debugUI.ScrollingFrame.Template:Clone()

clone14.Text = "DS2_3 VN"
clone14.Name = "DS2_3 VN"
clone14.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_3")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone14.Parent = debugUI.ScrollingFrame
clone14.Visible = true

local clone15 = debugUI.ScrollingFrame.Template:Clone()

clone15.Text = "DS2_4 VN"
clone15.Name = "DS2_4 VN"
clone15.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_4")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone15.Parent = debugUI.ScrollingFrame
clone15.Visible = true

local clone16 = debugUI.ScrollingFrame.Template:Clone()

clone16.Text = "DS2_5 VN"
clone16.Name = "DS2_5 VN"
clone16.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_5")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone16.Parent = debugUI.ScrollingFrame
clone16.Visible = true

local clone17 = debugUI.ScrollingFrame.Template:Clone()

clone17.Text = "DS2_6 VN"
clone17.Name = "DS2_6 VN"
clone17.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_6")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone17.Parent = debugUI.ScrollingFrame
clone17.Visible = true

local clone18 = debugUI.ScrollingFrame.Template:Clone()

clone18.Text = "DS2_7 VN"
clone18.Name = "DS2_7 VN"
clone18.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_7")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone18.Parent = debugUI.ScrollingFrame
clone18.Visible = true

local clone19 = debugUI.ScrollingFrame.Template:Clone()

clone19.Text = "DS2_7_2 VN"
clone19.Name = "DS2_7_2 VN"
clone19.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_7_2")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone19.Parent = debugUI.ScrollingFrame
clone19.Visible = true

local clone20 = debugUI.ScrollingFrame.Template:Clone()

clone20.Text = "DS2_8 VN"
clone20.Name = "DS2_8 VN"
clone20.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_8")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone20.Parent = debugUI.ScrollingFrame
clone20.Visible = true

local clone21 = debugUI.ScrollingFrame.Template:Clone()

clone21.Text = "DS2_9 VN"
clone21.Name = "DS2_9 VN"
clone21.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_9")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone21.Parent = debugUI.ScrollingFrame
clone21.Visible = true

local clone22 = debugUI.ScrollingFrame.Template:Clone()

clone22.Text = "DS2_9_2 VN"
clone22.Name = "DS2_9_2 VN"
clone22.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_9_2")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone22.Parent = debugUI.ScrollingFrame
clone22.Visible = true

local clone23 = debugUI.ScrollingFrame.Template:Clone()

clone23.Text = "DS2_10 VN"
clone23.Name = "DS2_10 VN"
clone23.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_10")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone23.Parent = debugUI.ScrollingFrame
clone23.Visible = true

local clone24 = debugUI.ScrollingFrame.Template:Clone()

clone24.Text = "DS2_10_2 VN"
clone24.Name = "DS2_10_2 VN"
clone24.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_10_2")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone24.Parent = debugUI.ScrollingFrame
clone24.Visible = true

local clone25 = debugUI.ScrollingFrame.Template:Clone()

clone25.Text = "DS2_11 VN"
clone25.Name = "DS2_11 VN"
clone25.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_11")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone25.Parent = debugUI.ScrollingFrame
clone25.Visible = true

local clone26 = debugUI.ScrollingFrame.Template:Clone()

clone26.Text = "DS2_11_2 VN"
clone26.Name = "DS2_11_2 VN"
clone26.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_11_2")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone26.Parent = debugUI.ScrollingFrame
clone26.Visible = true

local clone27 = debugUI.ScrollingFrame.Template:Clone()

clone27.Text = "DS2_12 VN"
clone27.Name = "DS2_12 VN"
clone27.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_12")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone27.Parent = debugUI.ScrollingFrame
clone27.Visible = true

local clone28 = debugUI.ScrollingFrame.Template:Clone()

clone28.Text = "DS2_14 VN"
clone28.Name = "DS2_14 VN"
clone28.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_14")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone28.Parent = debugUI.ScrollingFrame
clone28.Visible = true

local clone29 = debugUI.ScrollingFrame.Template:Clone()

clone29.Text = "DS2_15 VN"
clone29.Name = "DS2_15 VN"
clone29.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_15")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone29.Parent = debugUI.ScrollingFrame
clone29.Visible = true

local clone30 = debugUI.ScrollingFrame.Template:Clone()

clone30.Text = "DS2_16 VN"
clone30.Name = "DS2_16 VN"
clone30.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_16")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone30.Parent = debugUI.ScrollingFrame
clone30.Visible = true

local clone31 = debugUI.ScrollingFrame.Template:Clone()

clone31.Text = "DS2_17 VN"
clone31.Name = "DS2_17 VN"
clone31.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_17")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone31.Parent = debugUI.ScrollingFrame
clone31.Visible = true

local clone32 = debugUI.ScrollingFrame.Template:Clone()

clone32.Text = "DS2_18 VN"
clone32.Name = "DS2_18 VN"
clone32.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	transition.ShowBattleBack()
	client.StartVNScene("DS2_18")
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	handy.Show()
end)
clone32.Parent = debugUI.ScrollingFrame
clone32.Visible = true

local clone33 = debugUI.ScrollingFrame.Template:Clone()

clone33.Text = "DS Credits"
clone33.Name = "DS Credits"
clone33.MouseButton1Click:Connect(function()
	handy.Hide()
	transition.ToggleBlack(1, 0.3)
	creditsHandler.PlayCredits()
end)
clone33.Parent = debugUI.ScrollingFrame
clone33.Visible = true

local clone34 = debugUI.ScrollingFrame.Template:Clone()

clone34.Text = "TestDS2Technician"
clone34.Name = "TestDS2Technician"
clone34.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Noumenal Warden",
		Parent = true,
		Duelist = "DS2S_Technician",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone34.Parent = debugUI.ScrollingFrame
clone34.Visible = true

local clone35 = debugUI.ScrollingFrame.Template:Clone()

clone35.Text = "TestDS2Chiyou"
clone35.Name = "TestDS2Chiyou"
clone35.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Yang-Chiyou",
		Parent = true,
		Duelist = "DS2S_Chiyou",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone35.Parent = debugUI.ScrollingFrame
clone35.Visible = true

local clone36 = debugUI.ScrollingFrame.Template:Clone()

clone36.Text = "TestDS2Tainted"
clone36.Name = "TestDS2Tainted"
clone36.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "The Tainted",
		Parent = true,
		Duelist = "DS2S_Tainted",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone36.Parent = debugUI.ScrollingFrame
clone36.Visible = true

local clone37 = debugUI.ScrollingFrame.Template:Clone()

clone37.Text = "TestDS2Sentries"
clone37.Name = "TestDS2Sentries"
clone37.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Nyarlhotep",
		Parent = true,
		Duelist = "DS2S_Sentries",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone37.Parent = debugUI.ScrollingFrame
clone37.Visible = true

local clone38 = debugUI.ScrollingFrame.Template:Clone()

clone38.Text = "DS2 Raid 1"
clone38.Name = "DS2 Raid 1"
clone38.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Wraiths Of Injustice",
		Parent = true,
		Duelist = "DS2S_Injustice",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone38.Parent = debugUI.ScrollingFrame
clone38.Visible = true

local clone39 = debugUI.ScrollingFrame.Template:Clone()

clone39.Text = "DS2 Raid 2"
clone39.Name = "DS2 Raid 2"
clone39.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Imperium Invasion",
		Parent = true,
		Duelist = "DS2S_Invasion",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone39.Parent = debugUI.ScrollingFrame
clone39.Visible = true

local clone40 = debugUI.ScrollingFrame.Template:Clone()

clone40.Text = "DS2 Raid 3"
clone40.Name = "DS2 Raid 3"
clone40.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Shinkaioh Suit EX",
		Parent = true,
		Duelist = "DS2S_Deidre",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone40.Parent = debugUI.ScrollingFrame
clone40.Visible = true

local clone41 = debugUI.ScrollingFrame.Template:Clone()

clone41.Text = "DS2 Raid 4"
clone41.Name = "DS2 Raid 4"
clone41.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Nyarlhotep",
		Parent = true,
		Duelist = "DS2S_Nyarl1",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone41.Parent = debugUI.ScrollingFrame
clone41.Visible = true

local clone42 = debugUI.ScrollingFrame.Template:Clone()

clone42.Text = "DS2 Raid 5"
clone42.Name = "DS2 Raid 5"
clone42.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Nyarlhotep",
		Parent = true,
		Duelist = "DS2S_Nyarl2",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone42.Parent = debugUI.ScrollingFrame
clone42.Visible = true

local clone43 = debugUI.ScrollingFrame.Template:Clone()

clone43.Text = "DS2 Raid 6"
clone43.Name = "DS2 Raid 6"
clone43.MouseButton1Click:Connect(function()
	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "???",
		Parent = true,
		Duelist = "DS2S_Auteur",
		QuickIntro = true,
		userId = -999999 - text
	})
end)
clone43.Parent = debugUI.ScrollingFrame
clone43.Visible = true

local clone44 = debugUI.ScrollingFrame.Template:Clone()

clone44.Text = "DS2 Story Menu"
clone44.Name = "DS2 Story Menu"
clone44.MouseButton1Click:Connect(function()
	dsa2StoryMenu.OpenDSA2StoryMenu()
end)
clone44.Parent = debugUI.ScrollingFrame
clone44.Visible = true

return {}
