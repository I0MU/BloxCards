math.randomseed(tick())

local runService: RunService = game:GetService("RunService")
local teleportService = game:GetService("TeleportService")
local userInputService: UserInputService = game:GetService("UserInputService")
local contentProvider: ContentProvider = game:GetService("ContentProvider")
local textChatService: TextChatService = game:GetService("TextChatService")
local tweenService: TweenService = game:GetService("TweenService")
local starterGui: StarterGui = game:GetService("StarterGui")
local replicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local mouse = LocalPlayer:GetMouse()
local uDim2New = UDim2.new
local color3New = Color3.new
local s1 = "DemonWarsAct1"
local clientReady: BoolValue = Instance.new("BoolValue")

clientReady.Name = "ClientReady"
clientReady.Value = false
clientReady.Parent = script

local u16 = nil
local u17: boolean = false
local s2 = "None"
local u19 = nil
local u20 = nil
local u21: boolean = false
local runService2: RunService = game:GetService("RunService")
local t1: {[any]: any} = {}
local u24: boolean = false

local function v25(...)
	if not runService2:IsStudio() then
		return
	end

	local v236, v237 = debug.info(2, "sl")
	local v238 = v236:match("([^%.]+)$")

	v238 = string.format("%s:%d", v238 or v236, v237)

	local v239 = table.pack(...)

	table.insert(t1, { args = v239, location = v238 })

	if u24 then
		return
	end

	u24 = true
	task.spawn(function()
		while #t1 > 0 do
			local v728 = table.remove(t1, 1)

			print(v728.location, table.unpack(v728.args, 1, v728.args.n))
			task.wait(0.125)
		end

		u24 = false
	end)
end

local v26: any = teleportService:GetLocalPlayerTeleportData()

teleportService = tick()
print(teleportService .. " start")

repeat
	task.wait()
until playerGui:FindFirstChild("VisGui") ~= nil

local u28 = playerGui:WaitForChild("VisGui")

task.spawn(function()
	starterGui.ResetPlayerGuiOnSpawn = false
end)
playerGui:SetTopbarTransparency(0)
print("Server UnReady")

local introNew = u28.IntroNew

workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

local v29 = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

v29:Disable()

local transition = require(script.Transition)

if not v26 then
	if s1 == "Doomspire" then
		transition.ShowNewBattleBack("LoomingSpire")
		introNew.Black.ImageTransparency = 1
		introNew.Logo.Image = "rbxassetid://97631383853570"
		introNew.Logo.Size = UDim2.fromScale(0.625, 0.275)
	elseif s1 == "TenAnniversary" then
		transition.ShowNewBattleBack("10thAnniversary")
		introNew.Black.ImageTransparency = 1
		introNew.Logo.Image = "rbxassetid://87500688585102"
		introNew.Logo.Size = UDim2.fromScale(0.625, 0.275)
	elseif s1 == "DoomspireAct2" then
		transition.ShowNewBattleBack("BreakingPoint")
		introNew.Black.ImageTransparency = 1
		introNew.Logo.Image = "rbxassetid://136588748513268"
		introNew.Logo.Size = UDim2.fromScale(0.525, 0.325)
		introNew.Logo.ImageTransparency = 0.4
		introNew.Start.BackgroundTransparency = 0.8
		introNew.Tutorial.BackgroundTransparency = 0.8
		introNew.SkipLoading.BackgroundTransparency = 0.8
	elseif s1 == "DemonWarsAct1" then
		transition.ShowNewBattleBack("HaxburySummer")
		introNew.Black.ImageTransparency = 1
		introNew.Logo.Image = "rbxassetid://105900842865883"
		introNew.Logo.Size = UDim2.fromScale(0.525, 0.3)
		introNew.Logo.ImageTransparency = 0.4
		introNew.Start.BackgroundTransparency = 0.8
		introNew.Tutorial.BackgroundTransparency = 0.8
		introNew.SkipLoading.BackgroundTransparency = 0.8
	else
		workspace.CurrentCamera.CFrame = CFrame.new(-733.227, 94.434, 507.668)
	end
elseif not v26.SecretTele then
	workspace.CurrentCamera.CFrame = CFrame.new(-1200, -600.0192223, -200, -0.711942375, -0.69359076, 0.109863296, -7.4505806E-9, 0.156447411, 0.987686276, -0.702237904, 0.703175724, -0.111381546)
else
	v29:Enable()
end

local function spawn(p1, ...)
	local v241 = coroutine.create(p1)

	coroutine.resume(v241, ...)

	return v241
end

local u32: boolean = true

if userInputService.TouchEnabled ~= true then
	u32 = userInputService.GamepadEnabled == true
end

local u33: boolean = userInputService.GamepadEnabled == true

if not v26 then
	introNew.Visible = true
else
	local runLoadingScreen = playerGui:WaitForChild("RunLoadingScreen")

	runLoadingScreen.Enabled = true

	if v26.Queue then
		runLoadingScreen.Frame.TextLabel.Text = "Queue opponent found!"
		runLoadingScreen.Frame.TextLabel2.Text = "Teleporting you to their server..."
	end
end

if replicatedStorage.Ready.Value ~= true and replicatedStorage.Ready.Value == false then
	replicatedStorage.Ready:GetPropertyChangedSignal("Value"):Wait()
end

introNew.Info.Text = "Blox Cards is now loading.. If it's taking too long, rejoin to speed it up!"
print("Server Ready")

-- FASTER LOAD: fire every server call the startup modules are about to make, all at once, BEFORE the long chain of requires below. Each module used to
-- make its own call while being required (Data, RobuxService x3, GetProducts, Shop x3, deck slot / names ...), so the Play button waited for the SUM of
-- those round trips; now they all travel together and each module just picks up its already-arrived answer (see Network.Prefetch / InvokeServer).
-- LoadData goes first because it is the slowest (the server may still be finishing the DataStore load).
do
	local prefetchNetwork = require(script.Network)
	local prefetch = prefetchNetwork.Prefetch

	prefetch("LoadData", true) -- Data.lua
	prefetch("GetAllRanks") -- Data.lua (right after LoadData)
	prefetch("GetCurrentOffers") -- RobuxService.lua
	prefetch("GetCurrentSetups")
	prefetch("GetCurrentPrebuilts")
	prefetch("GetProducts") -- below
	prefetch("GetCurrentEventItems") -- Shop.lua
	prefetch("GetEventShops")
	prefetch("GetPacksForSale")
	prefetch("GetCurrentDeckSlot") -- deck builder setup further down
	prefetch("GetDeckName")
end

local cardLibrary = require(replicatedStorage.CardLibrary)
local t2: {[any]: any} = {}

setmetatable(t2, {
	__index = function(p2, p3)
		local t23: {[any]: any} = { __index = cardLibrary[p3] }

		p2[p3] = t23

		return t23
	end
})

local config = require(replicatedStorage.CONFIG)

teleportService = config.CARDZINDEX

local configCardsize = config.CARDSIZE
local configClr = config.CLR
local configColororder = config.COLORORDER
local configRarities = config.RARITIES
local t3: {[any]: any} = { bbstring = "ʙʙ" }

require(replicatedStorage.Battle)

local sleeves = require(script.Sleeves)
local sleevesSleeves = sleeves.sleeves
local sleevesPrettysleeves = sleeves.prettysleeves
local robuxService = require(script.RobuxService)
local engines = require(script.Engines)
local enginesEngines = engines.engines
local utils = require(replicatedStorage.Utils)
local utilsNew = utils.New
local utilsClamp = utils.Clamp
local utilsSetZIndex = utils.SetZIndex
local utilsCopyTable = utils.CopyTable

sleeves = require(script.TargetArrow)

local fakeMouse = require(script.FakeMouse)
local fakeMouseMouseAwayFrom = fakeMouse.MouseAwayFrom
local nevermore = require(script.Nevermore)
local v57 = nevermore.ScrollingFrame
local nevermoreOs = nevermore.os
local contextualize = require(script.Contextualize)
local contextualizeInverse = require(script.ContextualizeInverse)
local customScalings = require(script.CustomScalings)
local customScalingsCustomscalings = customScalings.customscalings

require(script.Inspection)

local nonGameCard = require(script.NonGameCard)
local handy = require(script.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local network = require(script.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local networkClientAlert = networkClient.Alert

require(script.DebugStats)
require(script.Character)
require(script.PlayerList)
require(script.Tutorial)

local animation = require(replicatedStorage.Animation)
local data = require(script.Data)
local dataUpdateCashMoney = data.UpdateCashMoney

require(script.MainClient2)

local foilEffect = require(replicatedStorage.FoilEffect)
local cardAnim = require(replicatedStorage.CardAnim)

require(replicatedStorage.Signal)
require(replicatedStorage.PassiveEffects)

local effects = require(replicatedStorage.Effects)
local promoRewards = require(replicatedStorage.PromoRewards)

nevermore = require(replicatedStorage.Maid)

local autocomplete = require(script.Autocomplete)

require(replicatedStorage.RogueStuff.Rogue)
require(script.RaidMenu)
require(replicatedStorage.VisualNovel)

local bargainExchange = require(script.BargainExchange)
local getChatNameColor = require(script.GetChatNameColor)
local battleTutorial = require(replicatedStorage.BattleTutorial)

nevermore.new()

if not u32 then
	require(replicatedStorage:WaitForChild("SmartBone")).Start()
end

robuxService.Products = networkInvokeServer("GetProducts")

if u28:FindFirstChild("StartingGameMessage") then
	u28.StartingGameMessage.Visible = true
end

local questMenu = u28:WaitForChild("QuestMenu")

customScalings.UpdateScalings()
sleeves.Initializes()

function networkClient.RepairOldSaveData()
	audioService.PlaySound("Power Down")
	introNew.Info.Text = "We found old data and attempted to repair it. Please rejoin the game to continue playing. Sorry for the inconvenience!"
end

print("IntroNew")

if not v26 then
	function networkClient.DisplayIntro(p4, p5)
		local audio = game.ReplicatedStorage.Audio
		local introNewLogo = introNew.Logo

		if p4 then
			introNew.Visible = true
		end

		if p5 then
			s1 = p5
		end

		if p5 and p5 == "DoomspireAct2" then
			introNew.Black.ImageTransparency = 1
			introNew.Logo.Image = "rbxassetid://136588748513268"
			introNew.Logo.Size = UDim2.fromScale(0.525, 0.325)
			introNew.Logo.ImageTransparency = 0
			introNew.Start.BackgroundTransparency = 0
			introNew.Tutorial.BackgroundTransparency = 0
			introNew.SkipLoading.BackgroundTransparency = 0
		end

		coroutine.resume(coroutine.create(function()
			-- always one of these two (the Friday / Sunday messages were removed)
			local t47 = {
				"DIE",
				"Wanted Trend",
			}
			local v731 = t47[math.random(#t47)]

			local info = introNewLogo:WaitForChild("Info")

			info.Text = v731
		end))

		local introNewStart = introNew.Start
		local introNewStartPosition = introNewStart.Position
		local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local shineGradient = introNewStart.ShineImage.ShineGradient

		introNewStart.MouseEnter:Connect(function()
			audioService.PlaySound("click1")
			shineGradient.Offset = Vector2.new(-3.3, 0)
			tweenService:Create(shineGradient, tweenInfo, { Offset = Vector2.new(2.4, 0) }):Play()
		end)
		introNewStart.Position = introNewStartPosition - UDim2.new(0.5, 0, 0, 0)
		introNewStart.Visible = false

		local introNewTutorial = introNew.Tutorial
		local introNewTutorialPosition = introNewTutorial.Position
		local v255 = introNewTutorial.ShineImage.ShineGradient

		introNewTutorial.MouseEnter:Connect(function()
			audioService.PlaySound("click1")
			v255.Offset = Vector2.new(3.3, 0)
			tweenService:Create(v255, tweenInfo, { Offset = Vector2.new(-2.4, 0) }):Play()
		end)
		introNewTutorial.Position = introNewTutorialPosition + UDim2.new(0.5, 0, 0, 0)
		introNewTutorial.Visible = config.TUTOR_LADY_ENABLED == true

		local introNewSkipLoading = introNew.SkipLoading
		local v257 = introNewSkipLoading.Position

		introNewSkipLoading.Position = v257 + UDim2.new(0, 0, 0.4, 0)
		introNewSkipLoading.Visible = false

		if u33 == true then
			introNew.ConsoleWarning.Visible = true
		end

		task.spawn(function()
			local n1 = 0
			local introNewLogoSize = introNewLogo.Size
			local u735: boolean = false
			local n2 = 0
			local u737: boolean = false
			local t48: {[any]: any} = {
				"SmallPunch",
				"bass.wav",
				"splat.wav",
				"snap.wav",
				"Kerplunk.wav",
				"Short spring sound.wav"
			}

			introNewLogo.MouseButton1Down:Connect(function()
				u735 = true
				introNewLogo:TweenSize(introNewLogoSize - UDim2.new(0.1, 0, 0.04285714285714286, 0), "Out", "Back", 0.1, true)
			end)
			introNewLogo.MouseButton1Click:Connect(function()
				if u737 then
					return
				end

				u737 = true

				local randomNumber = math.random(#t48)

				audioService.PlaySound(t48[randomNumber])
				n1 = 600
				introNewLogo:TweenSize(introNewLogoSize, "Out", "Back", 0.1, true)
				task.wait(0.1)
				u737 = false
			end)

			function enginesEngines.LogoSway(p6)
				n1 -= n1 * 1.2 * p6
				n2 += n1 * p6 * 0.1
				introNewLogo.Rotation = math.sin(n2) * 15
			end
		end)

		local function HideIntro()
			audioService.PlaySound("confirmed")
			-- FASTER LOAD: shorter fades (were 0.25s each way); the screen is black while the background swaps, so the battleback hide / show skip their
			-- blur and blocking fade (see Transition.HideBattleBack / ShowNewBattleBack)
			transition.ToggleBlack(1, 0.12)

			local transitionChangeBattleBackground = transition.ChangeBattleBackground
			local v740 = data.CurrentBackgroundName()

			transitionChangeBattleBackground(v740 or "")
			transition.HideBattleBack(true)

			if u32 then
				handyHandy.Visible = true
			end

			introNew.Visible = false

			if networkClient.ClaimLoginRewardsBool then
				transition.ShowBattleBack(nil, true)
				questMenu.Visible = true

				if u32 then
					handy.Hide()
				end
			else
				handy.Show()
			end

			transition.ToggleBlack(-1, 0.15)
			audioService.ChangeSong("Lobby")
		end

		-- FASTER LOAD: the Start button no longer waits for downloads. It used to sit behind a fixed pause plus a loop that polled
		-- ContentProvider.RequestQueueSize (up to 3s) before the "Done!" state, so a slow connection / phone showed no Play button until the queue
		-- calmed down. Everything the intro needs is already in memory at this point (data, config, sleeves), and the downloads simply keep going in
		-- the background while the player is on the start screen (the four intro assets below, then the card art preloader at the end of this
		-- script).
		task.spawn(function()
			contentProvider:PreloadAsync({
				"rbxassetid://" .. 506132167,
				"rbxassetid://" .. 6315321209,
				"rbxassetid://" .. 511406127,
				"rbxassetid://" .. 245854775
			})
		end)

		v257 = {
			":D",
			"'u'",
			"c:",
			"'U'",
			"'v'",
			"o_o",
			"O_o",
			"o_O",
			":)",
			"C:",
			"'O'"
		}
		local introNewInfo = introNew.Info
		local randomNumber = math.random(#v257)

		introNewInfo.Text = "Done! " .. v257[randomNumber]
		coroutine.resume(coroutine.create(function()
			if s1 == "Doomspire" then
				audioService.ChangeSong("IntroDoomspire", { TimePosition = 6, Volume = 0.7 })
			elseif s1 == "TenAnniversary" then
				audioService.ChangeSong("IntroAnniversary", { TimePosition = 6, Volume = 0.7 })
			elseif s1 == "DoomspireAct2" then
				audioService.ChangeSong("DS2Title", { TimePosition = 0, Volume = 0.7 })
			elseif s1 == "DemonWarsAct1" then
				audioService.ChangeSong("DWA1Title", { TimePosition = 0, Volume = 0.7 })
			else
				audioService.ChangeSong("Intro", { TimePosition = 6 })
			end

			introNewLogo.ImageColor3 = color3New(1, 1, 1)
			engines.RemoveEngine("LogoSway")

			repeat
				introNewLogo.Rotation = introNewLogo.Rotation * 0.9
				runService.Stepped:Wait()
			until math.abs(introNewLogo.Rotation) < 3

			introNewLogo.Rotation = 0
		end))

		local connection2 = nil
		local connection = nil

		introNewTutorial.Visible = config.TUTOR_LADY_ENABLED == true
		introNewTutorial:TweenPosition(introNewTutorialPosition, "Out", "Quad", 1, true)
		connection = introNewTutorial.MouseButton1Down:Connect(function()
			audioService.PlaySound("confirmed")

			if connection2 then
				connection2:Disconnect()
			end

			connection:Disconnect()

			repeat
				task.wait(0.1)
			until networkClient.StartTutorial and clientready

			transition.ToggleBlack(1)

			local transitionChangeBattleBackground = transition.ChangeBattleBackground
			local v742 = data.CurrentBackgroundName()

			transitionChangeBattleBackground(v742 or "")
			transition.HideBattleBack()
			introNew.Visible = false

			if u32 then
				task.delay(1, function()
					handyHandy.Visible = true
					handy.Hide()
				end)
			end

			networkClient.StartTutorial()
		end)
		v257 = data.WinLoss()

		local v265 = data.GetQuestStats()

		if config.TUTOR_LADY_ENABLED and (v257[1] == 0 and v257[2] == 0 or not (v265.GotStarterDeck >= 1)) and not game.ReplicatedStorage:FindFirstChild("Testing") and game.PlaceId ~= 140727857606297 and game.PlaceId ~= 127324915809735 then
			introNewTutorial:TweenPosition(introNewTutorialPosition - UDim2.new(0.26, 0, 0, 0), "Out", "Quad", 1, true)
		else
			introNewStart.Visible = true
			introNewStart:TweenPosition(introNewStartPosition, "Out", "Quad", 1, true)
			connection2 = introNewStart.MouseButton1Down:Connect(function()
				connection2:Disconnect()
				connection:Disconnect()
				workspace.CurrentCamera.CameraType = "Custom"
				workspace.CurrentCamera.CameraSubject = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
				networkFireServer("RedeemCompensation")
				v29:Enable()
				HideIntro()
			end)
		end
	end

	networkClient.DisplayIntro()
else
	if v26.Queue then
		LocalPlayer.PlayerGui.RunLoadingScreen.Enabled = false
		task.spawn(function()
			while not clientready do
				task.wait(0.1)
			end

			task.wait(3)
			networkFireServer("ReadyQueueFromOtherServer", v26.Queue)
			task.delay(5, function()
				handyHandy.Visible = true
			end)
		end)
	end

	if v26.Mode then
		while not game.ReplicatedStorage.RunReady.Value do
			task.wait(0.1)
		end

		networkFireServer("ContinueRun", v26.Mode)
	end

	if v26.SecretTele then
		LocalPlayer.PlayerGui.RunLoadingScreen.Enabled = false
		task.spawn(function()
			while not clientready do
				task.wait(0.1)
			end

			LocalPlayer.Character:SetPrimaryPartCFrame(game.ReplicatedStorage.ARGTeleport.CFrame)
			workspace.CurrentCamera.CameraType = "Custom"
			workspace.CurrentCamera.CameraSubject = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
		end)
	end
end

print("BattleIntro, Outro")

local u84: boolean = false
local afterBattle = u28.AfterBattle
local tweenInfo = TweenInfo.new(8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local shineGradient = afterBattle.Title.ImageLabel.ShineImage.ShineGradient
local v88 = afterBattle.EnemyTitle.ImageLabel.ShineImage.ShineGradient
local children = afterBattle:GetChildren()
local t4: {[any]: any} = {
	"Title",
	"EnemyTitle",
	"VictoryLoss",
	"Winnings",
	"LevelBar",
	"Close"
}

nevermore = uDim2New(-1.5, 0, 0.1, 0)
sleeves = uDim2New(1.5, 0, 0.3, 0)
replicatedStorage = uDim2New(0, 0, 0.45, 0)

local v91 = uDim2New(-1, 0, 0.7, 0)
local v92 = uDim2New(1, 0, 0.7, 0)
local v93 = uDim2New(0.2, 0, 1.2, 0)
local t5: {[any]: any} = {
	Title = nevermore,
	EnemyTitle = sleeves,
	VictoryLoss = replicatedStorage,
	Winnings = v91,
	Close = v92,
	LevelBar = v93
}
local t6: {[any]: any} = {}

for _, v in pairs(children) do
	t6[v.Name] = v.Position
end

local function RewardsToText(p7)
	if not p7 then
		return ""
	end

	local t24: {[any]: any} = {}

	if p7.BloxBux then
		t24[#t24 + 1] = "+" .. p7.BloxBux .. "ʙʙ"
	end

	if p7.EventCurrency and p7.EventCurrency > 0 and p7.EventCurrencyType and p7.EventCurrencyType ~= "None" then
		t24[#t24 + 1] = "+" .. p7.EventCurrency .. config.EVENTCURRENCYICON[p7.EventCurrencyType]
	end

	if p7.Packs then
		for k, v in pairs(p7.Packs) do
			t24[#t24 + 1] = "+" .. k .. " (x" .. v .. ")"
		end
	end

	if p7.Cards then
		for k, v in pairs(p7.Cards) do
			t24[#t24 + 1] = "+" .. cardLibrary[k].Name .. " (x" .. v .. ")"
		end
	end

	if p7.Charms then
		local t25: {[any]: any} = { "Rabbit Charms", "Clovers" }

		for k, v in pairs(p7.Charms) do
			if v > 0 then
				t24[#t24 + 1] = "+" .. v .. " " .. t25[k]
			end
		end
	end

	return table.concat(t24, " : ")
end
function networkClient.ShowBattleOutro(p8, p9, p10, p11, p12, p13)
	if u84 then
		return
	end

	if p9 and p8 then
		u84 = true

		local v281 = networkInvokeServer("GetPlayerLevelFromName", p8.Name)
		local v282 = networkInvokeServer("GetPlayerExperienceFromName", p8.Name, p10)
		local v283 = networkInvokeServer("GetPlayerExperienceFromName", p8.Name)

		afterBattle.LevelBar.LevelReminder.Text = " "

		if p13 then
			v282 = v283
			afterBattle.LevelBar.LevelReminder.Text = "Play against stronger bots or other players to get XP!"
		end

		if string.match(p11, "(Played round too fast, removed rewards)") then
			v282 = v283
		end

		for _, v in pairs({
			{ p8, "" },
			{ p9, "Enemy" }
			}) do
			local v286 = v[2]
			local v287 = v[1]

			if v287.SubPhysical then
				afterBattle[v286 .. "Title"].Title.Text = v287.VisualName .. " & " .. v287.SubPhysical.Name
			else
				afterBattle[v286 .. "Title"].Title.Text = v287.VisualName
			end

			afterBattle[v286 .. "Title"].BackgroundTransparency = 1
			afterBattle[v286 .. "Title"].Title.TextTransparency = 0
			afterBattle.EnemyTitle.ImageLabel.ImageColor3 = Color3.fromRGB(162, 47, 48)
			afterBattle.EnemyTitle.ImageLabel.ShineImage.ImageColor3 = Color3.fromRGB(168, 49, 51)
			afterBattle.Title.ImageLabel.ImageColor3 = Color3.fromRGB(0, 87, 193)
			afterBattle.Title.ImageLabel.ShineImage.ImageColor3 = Color3.fromRGB(0, 95, 203)
		end

		afterBattle.VictoryLoss.Title.Text = p10
		afterBattle.VictoryLoss.Via.Text = p11 == "You've already completed this puzzle. No rewards." and p11 or "Via " .. p11

		local s1: string = ""

		if p10 == "Victory" then
			s1 = "Enemy"
		elseif p10 == "Tie" or p10 == "Undecided" then
			s1 = "Neither"
		end

		afterBattle.Winnings.Title.Text = RewardsToText(p12)

		if v282 < 0 then
			afterBattle.LevelBar.LevelFrom.Text = "Level " .. tostring(v281 - 1)
			afterBattle.LevelBar.LevelTo.Text = "Level " .. tostring(v281)
		else
			afterBattle.LevelBar.LevelFrom.Text = "Level " .. tostring(v281)
			afterBattle.LevelBar.LevelTo.Text = "Level " .. tostring(v281 + 1)
		end

		afterBattle.VictoryLoss.BackgroundTransparency = 1
		afterBattle.VictoryLoss.Title.TextTransparency = 1
		afterBattle.VictoryLoss.Via.TextTransparency = 1

		for _, v in pairs(children) do
			v.Position = t5[v.Name]
		end

		afterBattle.Visible = true
		transition.ToggleBlack(-1)
		shineGradient.Offset = Vector2.new(-2.8, 0)
		tweenService:Create(shineGradient, tweenInfo, { Offset = Vector2.new(1.5, 0) }):Play()
		task.wait(0.5)
		v88.Offset = Vector2.new(2.5, 0)
		tweenService:Create(v88, tweenInfo, { Offset = Vector2.new(-1.3, 0) }):Play()

		for _, v in pairs(t4) do
			if v == "VictoryLoss" then
				audioService.PlaySound(p10)

				if p10 == "Victory" then
					audioService.PlaySound("Cheer")
				end

				animation.AnimateAsync(afterBattle[v], { BackgroundTransparency = 0.5 }, 0.3, "Out", "Quad")
				task.wait(0.1)
				animation.AnimateAsync(afterBattle[v].Title, { TextTransparency = 0 }, 0.3, "Out", "Quad")
				animation.Animate(afterBattle[v].Via, { TextTransparency = 0 }, 0.3, "Out", "Quad")
			elseif v == "Close" then
				task.wait(0.1)
				afterBattle[v]:TweenPosition(t6[v], "Out", "Quad", 2, true)
			elseif v ~= "LevelBar" then
				afterBattle[v]:TweenPosition(t6[v], "Out", "Quad", 1, true)

				if v == s1 .. "Title" then
					task.wait(0.7)
					animation.AnimateAsync(afterBattle[v].Title, { TextTransparency = 0.2 }, 0.5, "Out", "Quad")

					local animationAnimateAsync = animation.AnimateAsync
					local imageLabel = afterBattle[v].ImageLabel
					local color3 = Color3.fromRGB(86, 86, 86)

					animationAnimateAsync(imageLabel, { ImageColor3 = color3 }, 1, "Out", "Quad")

					local animateAsync = animation.AnimateAsync
					local shineImage = afterBattle[v].ImageLabel.ShineImage
					local color32 = Color3.fromRGB(120, 120, 120)

					animateAsync(shineImage, { ImageColor3 = color32 }, 1, "Out", "Quad")
				end
			elseif p12.BloxBux or p12.Cards then
				afterBattle[v]:TweenPosition(t6[v], "Out", "Quad", 0.5, true)

				if not p13 then
					if v282 < 0 then
						afterBattle[v].LevelIncrease.Position = uDim2New(v282, 0, 0, 0)
						task.wait(0.5)

						if v282 ~= v283 then
							audioService.PlaySound("GainXP")
						end

						local levelIncrease = afterBattle[v].LevelIncrease
						local v300 = uDim2New(0, 0, 0, 0)

						levelIncrease:TweenPosition(v300, "Out", "Quad", 3, true)
						task.wait(3)
						audioService.PlaySound("victoryfanfare.wav")
					else
						afterBattle[v].LevelIncrease.Position = uDim2New(v282 - 1, 0, 0, 0)
						task.wait(0.5)

						if v282 ~= v283 then
							audioService.PlaySound("GainXP")
						end

						local v301 = afterBattle[v].LevelIncrease
						local v302 = uDim2New(v283 - 1, 0, 0, 0)

						v301:TweenPosition(v302, "Out", "Quad", 3, true)
					end

					if p8.SubPhysical and p8.SubPhysical.userId == LocalPlayer.userId then
						networkInvokeServer("CheckForLevelUp", LocalPlayer.Name)
					else
						networkInvokeServer("CheckForLevelUp", p8.Name)
					end
				end
			end
		end

		afterBattle.Close.MouseButton1Click:wait()

		-- FIX: closing used to slide the elements off one at a time (0.8s tween + ~0.4s of waiting each), so it took seconds.
		-- Now everything slides off together and quickly.
		for _, v in pairs(t4) do
			afterBattle[v]:TweenPosition(t5[v], "In", "Quad", 0.25, true)

			if v == "VictoryLoss" then
				task.spawn(function()
					animation.AnimateAsync(afterBattle[v].Title, { TextTransparency = 1 }, 0.15, "In", "Quad")
					animation.AnimateAsync(afterBattle[v].Via, { TextTransparency = 1 }, 0.15, "In", "Quad")
					animation.AnimateAsync(afterBattle[v], { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
				end)
			end
		end

		networkClient.SetControlsEnabled(true)
		task.spawn(function()
			task.wait(0.3)
			afterBattle.Visible = false
			u84 = false
		end)

		return
	end

	warn("ShowBattleOutro No player1 or enemy.")
end

local preBattle = playerGui:WaitForChild("Intro"):WaitForChild("PreBattle")
local v100 = preBattle:GetChildren()
local t7: {[any]: any} = { "BGPattern", "EnemyBGPattern", "VS", "Title", "EnemyTitle" }

v93 = uDim2New(-1.5, 0, 0.28, 0)
v92 = uDim2New(1.5, 0, 0.67, 0)
v91 = uDim2New(1, 0, 0.87, 0)
replicatedStorage = uDim2New(-0.25, 0, 0.48, 0)
sleeves = uDim2New(-1, 0, 0, 0)
nevermore = uDim2New(1, 0, 0, 0)

local t8: {[any]: any} = {
	Title = v93,
	EnemyTitle = v92,
	EnemyWinLoss = v91,
	WinLoss = replicatedStorage,
	BGPattern = sleeves,
	EnemyBGPattern = nevermore
}
local t9: {[any]: any} = {}

for _, v in pairs(v100) do
	t9[v.Name] = v.Position
end

function networkClient.ShowBattleIntro(p14, p15)
	spawn(function()
		transition.ToggleBlack(1)
		TweenInfo.new(7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		TweenInfo.new(6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

		local tweenInfo2 = TweenInfo.new(8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local tweenInfo3 = TweenInfo.new(11, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local shineGradient = preBattle.Title.ImageLabel.ShineImage.ShineGradient
		local v746 = preBattle.Title.ImageLabel.ShineImage2.ShineGradient
		local v747 = preBattle.EnemyTitle.ImageLabel.ShineImage.ShineGradient
		local v748 = preBattle.EnemyTitle.ImageLabel.ShineImage2.ShineGradient
		local v749 = preBattle.VS.Versus.ShineImage.ShineGradient

		for _, v in pairs({
			{ p14, "" },
			{ p15, "Enemy" }
			}) do
			local v752 = v[2]
			local v753 = v[1]

			if v753.SubPhysical then
				local SubPhysicalName = v753.SubPhysical.Name

				if game.Players:FindFirstChild(v753.SubPhysical.Name) then
					SubPhysicalName = game.Players:FindFirstChild(v753.SubPhysical.Name).DisplayName
				end

				preBattle[v752 .. "Title"].Title.Text = v753.VisualName .. " & " .. SubPhysicalName
				preBattle[v752 .. "BGPattern"].SubPlayerImage.Image = "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userId=" .. v753.SubPhysical.userId
			else
				preBattle[v752 .. "Title"].Title.Text = v753.VisualName
				preBattle[v752 .. "BGPattern"].SubPlayerImage.Image = ""
			end

			preBattle[v752 .. "Title"].Rank.Text = networkInvokeServer("GetPlayerRankFromName", v753.Name) or "AAAAAAAAA"

			if v753.PlayerImageId then
				preBattle[v752 .. "BGPattern"].PlayerImage.Image = "rbxassetid://" .. v753.PlayerImageId
			else
				preBattle[v752 .. "BGPattern"].PlayerImage.Image = "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&userId=" .. v753.userId
			end

			shineGradient.Offset = Vector2.new(-3.3, 0)
			v746.Offset = Vector2.new(-3.1, 0)
			tweenService:Create(shineGradient, tweenInfo2, { Offset = Vector2.new(2.4, 0) }):Play()
			tweenService:Create(v746, tweenInfo2, { Offset = Vector2.new(2.1, 0) }):Play()
			v747.Offset = Vector2.new(3.3, 0)
			v748.Offset = Vector2.new(3.1, 0)
			tweenService:Create(v747, tweenInfo2, { Offset = Vector2.new(-2.4, 0) }):Play()
			tweenService:Create(v748, tweenInfo2, { Offset = Vector2.new(-2.1, 0) }):Play()
			v749.Offset = Vector2.new(-2.8, 0)
			tweenService:Create(v749, tweenInfo3, { Offset = Vector2.new(2.3, 0) }):Play()

			local v755 = preBattle[v752 .. "WinLoss"]

			v752 = networkInvokeServer("GetPlayerWinLoss", v753.Name)
			v755.WinNumber.Text = v752[1]
			v755.LossNumber.Text = v752[2]
			v755.WinTitle.Text = if utils.Plural(v752[1]) then "Wins" else "Win"
			v755.LossTitle.Text = if utils.Plural(v752[2]) then "Losses" else "Loss"
		end

		for _, v in pairs(v100) do
			if v.Name == "VS" then
				preBattle.VS.BackgroundTransparency = 1
				preBattle.VS.Versus.ImageTransparency = 0
				preBattle.VS.Versus.Position = uDim2New(0.5, 0, 0.9, 0)
			else
				v.Position = t8[v.Name]
			end
		end

		preBattle.Visible = true
		audioService.PlaySound("PreBattle")

		for _, v in pairs(t7) do
			if v == "VS" then
				animation.Animate(preBattle.VS, { BackgroundTransparency = 1 }, 0.15, "Out", "Quad")

				local versus = preBattle.VS.Versus
				local v761 = uDim2New(0.5, 0, -0.1, 0)

				versus:TweenPosition(v761, "Out", "Quad", 0.4, true)
			else
				preBattle[v]:TweenPosition(t9[v], "Out", "Quad", 0.7, true)
			end

			task.wait(0.2)
		end

		task.wait(2.1)

		for _, v in pairs(t7) do
			if v == "VS" then
				animation.AnimateAsync(preBattle.VS, { BackgroundTransparency = 1 }, 0.1, "Out", "Quad")
				animation.AnimateAsync(preBattle.VS.Versus, { ImageTransparency = 1 }, 0.1, "Out", "Quad")

				local v764 = preBattle.VS.Versus
				local v765 = uDim2New(0.5, 0, 0.9, 0)

				v764:TweenPosition(v765, "Out", "Quad", 0.2, true)
			else
				preBattle[v]:TweenPosition(t8[v], "Out", "Quad", 0.5, true)
			end

			task.wait(0.2)
		end

		task.wait(2.1)

		for _, v in pairs(preBattle:GetDescendants()) do
			if v:IsA("GuiBase2d") then
				animation.AnimateAsync(v, {}, 0.3, "Out", "Quart")
			end
		end

		preBattle.Visible = false
	end)
end

nevermore = {}

for _, v in pairs(require(script.FilterToCard.SpecialFilters)) do
	nevermore[">" .. v] = "Special Filter (Meets this condition)"
	nevermore["<" .. v] = "Special Filter (Does not meet this condition)"

	if string.find(v, ":") and (not not string.find(v, "CardCostsExactly") or not not string.find(v, "CardCostIncludes")) then
		nevermore[">" .. v] = "Special Filter - Use W,R,G,B,Y to specify color costs"
		nevermore["<" .. v] = "Special Filter - Use W,R,G,B,Y to specify color costs"
	end
end

local function validOrigin(p16)
	return type(p16) == "string" and p16 ~= "" and p16 or nil
end

for _, v in pairs(cardLibrary) do
	if v.Rarity ~= "Token" and not v.PlayTest and not nevermore[v.Name] and not v.Foil then
		if not v.Original then
			nevermore[v.Name] = "Card"
		else
			nevermore[v.Name] = "Alt-Art"
		end

		if v.Archetype and not nevermore[v.Archetype] then
			nevermore[v.Archetype] = "Archetype"
		end

		local vPackDisplayOverride = v.PackDisplayOverride
		local v112 = type(vPackDisplayOverride) == "string" and vPackDisplayOverride ~= "" and vPackDisplayOverride or nil

		if not v112 then
			local vPack = v.Pack

			v112 = type(vPack) == "string" and vPack ~= "" and vPack or nil
		end

		if v112 and not nevermore[v112] then
			nevermore[v112] = "Origin"
		end
	end
end

autocomplete.Init(u28.DeckBuilder3.Search.SearchBar.Box, u28.DeckBuilder3.Search.SearchBar, nevermore)
print("DeckNeu")

local t10: {[any]: any} = {
	Common = 4,
	Uncommon = 3,
	Rare = 2,
	Epic = 1,
	Legendary = 1,
	Token = 0
}
local stringLower = string.lower
local stringFind = string.find
local stringSub = string.sub
local deckBuilder3 = u28.DeckBuilder3
local deckBuilder3Trade = deckBuilder3.Trade
local tradeConfirm = u28.TradeConfirm
local v121 = v57.new(deckBuilder3.Deck.Clip.ScrollingFrame)
local scaler = deckBuilder3.Deck.Clip.ScrollingFrame.Scaler
local amount = deckBuilder3.Deck.Amount
local amountStarter = deckBuilder3.Deck.AmountStarter
local deckBuilder3Search = deckBuilder3.Search
local deckBuilder3DeckSharing = deckBuilder3.DeckSharing
local clip = deckBuilder3.Storage.Clip
local t11: {[any]: any} = { 0, 0 }
local clone = clip:Clone()

minzoom = 70
maxzoom = 470

local u130: boolean = true
local n1 = clip.AbsoluteSize.X - 16

nevermore = clip.AbsoluteSize.X - 16
autocomplete = math.ceil((clip.AbsoluteSize.X - 16) / (clip.AbsoluteSize.Y / 2) * (configCardsize.X / configCardsize.Y))

local n2 = nevermore / autocomplete / 2 - 1
n1 = {}
local u133 = true
local t12 = {}
local t13 = {}
local t14: {[any]: any} = {}
local t15: {[any]: any} = {}
local n3 = 0
local u139 = networkInvokeServer("GetCurrentDeckSlot")
local u140 = nil
local u141 = nil
local u142 = nil
local u143 = nil
local u144 = nil
local u145 = nil
local u146 = nil
local deckBuilder3Storage = deckBuilder3.Storage
local t16 = {}
local n4 = 0

local function RemoveCurrentStorage(p17)
	local v309 = clip

	for k, _ in pairs(t15) do
		t15[k]:Destroy()
		t15[k] = nil
	end

	t15 = {}
	v309:Destroy()
	clip = clone:Clone()
	clip.Position = uDim2New(if p17 < 0 then -0.05 else 0.05, 0, 0.9, 0)
	clip.Parent = deckBuilder3.Storage

	local v312 = clip
	local v313 = uDim2New(0, 0, 0.9, 0)

	v312:TweenPosition(v313, "Out", "Quad", if p17 == 0 then 0 else 0.125, true)
end

u144 = function(p18, p19, p20)
	local v317 = p18 or t16

	t16 = v317

	local n1 = clip.AbsoluteSize.X - 14
	local roundedUp = math.ceil(n1 / n2)
	local v320 = math.max(3, roundedUp)
	local n5 = n1 / v320 - 14

	n1 = n5 * (configCardsize.Y / configCardsize.X)

	local v322 = uDim2New(0, n5, 0, n1)
	local v323 = uDim2New(0, n5 + 14, 0, 3 + n1)
	local floored = math.floor((clip.AbsoluteSize.Y - 6) / v323.Y.Offset)
	local v325 = math.max(1, floored)

	if t11[1] == v320 and v325 == t11[2] and p20 then
		return
	end

	t11[1] = v320
	t11[2] = v325

	local n6 = (clip.AbsoluteSize.Y - v325 * v323.Y.Offset) / v325
	local n7 = v320 * v325

	v325 = n3

	local roundedUp2 = math.ceil(#v317 / n7)

	n3 = p19 or math.ceil(v325 / n4 * roundedUp2)
	n4 = roundedUp2
	n3 = math.min(n3, roundedUp2 - 1)
	deckBuilder3Storage.Pages.Text = n3 + 1 .. "/" .. roundedUp2
	RemoveCurrentStorage(n3 - (v325 or 0))

	for i = 0, n7 - 1 do
		local v330 = v317[n3 * n7 + i + 1]

		if not v330 then
			break
		end

		local v331 = data.IsNewCard(v330)

		v331 = t15[v330] or NewStorageCard(v330, n7, v331)
		t15[v330] = v331

		local physical = v331.Physical

		physical.Size = v322

		local floored2 = math.floor(i / v320)

		physical.Position = uDim2New(0, 8 + i % v320 * (n5 + 14), 0, 3 + floored2 * (n1 + 3 + n6), 0)
		task.spawn(function()
			physical.StudHolder.AutomaticSize = Enum.AutomaticSize.None
			task.wait()

			if physical:FindFirstChild("StudHolder") then
				physical.StudHolder.AutomaticSize = Enum.AutomaticSize.X
			end
		end)
	end
end

function customScalingsCustomscalings.RedrawDeckBuilder()
	if deckBuilder3.Visible then
		u144(nil, nil)
	end
end
function importDeck(p21)
	local t26: {[any]: any} = {}

	while true do
		if not (string.len(p21) > 0) then
			break
		end

		local v336 = string.find(p21, "|")

		if v336 == nil then
			table.insert(t26, p21)
			p21 = ""
		else
			local v337 = string.sub(p21, 1, v336 - 1)

			table.insert(t26, v337)
			p21 = string.sub(p21, v336 + 1)
		end
	end

	return t26
end

local u151: boolean = false

local function ResolveCard(p22, p23)
	local function OwnsCard(p24)
		return t12[p24] and t12[p24] > 0
	end

	if cardLibrary[p22] and t12[p22] and t12[p22] > 0 then
		table.insert(p23, p22)
		AddCardToDeck(p22)

		return true
	end

	local v341 = cardLibrary[p22]

	if string.find(p22, "-Foil") then
		local v342 = string.gsub(p22, "-Foil", "")

		if cardLibrary[v342] and t12[v342] and t12[v342] > 0 then
			table.insert(p23, v342)
			AddCardToDeck(v342)

			return true
		end
	end

	if v341 and v341.Original then
		local original = v341.Original

		if cardLibrary[original] and t12[original] and t12[original] > 0 then
			table.insert(p23, original)
			AddCardToDeck(original)

			return true
		end
	end

	for k, v in pairs(cardLibrary) do
		if p22 == v.Original and t12[k] and t12[k] > 0 then
			table.insert(p23, k)
			AddCardToDeck(k)

			return true
		end

		if k == p22 .. "-Foil" and t12[k] and t12[k] > 0 then
			table.insert(p23, k)
			AddCardToDeck(k)

			return true
		end
	end

	return false
end
function LoadCards()
	if u151 then
		return { skipped = true, removedInvalid = false }
	end

	u151 = true
	u130 = false

	local t27: {[any]: any} = { skipped = false, removedInvalid = false }
	local v347 = importDeck(deckBuilder3DeckSharing.Share.Text)

	for k, v in pairs(t13) do
		for _ = 1, v * 2 do
			RemoveCardFromDeck(k)
		end
	end

	local t28: {[any]: any} = {}

	for _, v in ipairs(v347) do
		if v and not ResolveCard(v, t28) then
			if cardLibrary[v] then
				print("[Deck Import] Skipped due to Deck Limit:", v)
			else
				print("[Deck Import] Invalid or Unowned Card ID:", v)
				t27.removedInvalid = true
			end
		end
	end

	deckBuilder3DeckSharing.Share.Text = table.concat(t28, "|")
	u130 = true
	u151 = false

	if game.PlaceId == 7105900056 then
		v25(t13)
	end

	return t27
end

u145 = function(_, _, _)
	audioService.PlaySound("click1")
	u144(nil, n3 + 1)
end
u146 = function(_, _, _)
	audioService.PlaySound("click1")

	local v360 = u144
	local v361 = math.max(0, n3 - 1)

	v360(nil, v361)
end
deckBuilder3DeckSharing.Import.MouseButton1Click:Connect(function()
	deckBuilder3.ImportConfirm.Visible = not deckBuilder3.ImportConfirm.Visible
	audioService.PlaySound("Rubber band sling shot.wav")
	deckBuilder3.DeckSharing.Visible = false
end)
deckBuilder3.ImportConfirm.Confirm.MouseButton1Click:connect(LoadCards)
deckBuilder3DeckSharing.Revert.MouseButton1Down:connect(function()
	local text = deckBuilder3DeckSharing.Share.Text

	if text and text ~= "" then
		if not u16 then
			u16 = text
		end

		local v363: boolean = u130

		u130 = false

		local v364 = importDeck(text)
		local t29: {[any]: any} = {}
		local u366: boolean = false
		local u367: boolean = false

		for _, v in ipairs(v364) do
			if v then
				local v370 = cardLibrary[v]
				local v371 = nil

				if v370 then
					if v370.Original then
						local original = v370.Original

						if cardLibrary[original] then
							v371 = original
						else
							v371 = v
							u366 = true
						end
					else
						v371 = v
					end
				end

				if not v371 then
					v25("[Deck Revert] Removed invalid card ID:", v)
					u367 = true
				else
					table.insert(t29, v371)
				end
			end
		end

		deckBuilder3DeckSharing.Share.Text = table.concat(t29, "|")
		u130 = v363

		if u367 then
			networkClientAlert("Some invalid cards were removed.")
		elseif u366 then
			networkClientAlert("Some cards were not reverted.")
		end

		v25("[Deck Revert] Reverted string:", deckBuilder3DeckSharing.Share.Text)

		return
	end
end)
deckBuilder3DeckSharing.Close.MouseButton1Down:Connect(function()
	if u16 then
		deckBuilder3DeckSharing.Share.Text = u16
		u16 = nil
	end
end)
deckBuilder3Storage.MouseButton1Click:connect(u146)
deckBuilder3Storage.MouseButton2Click:connect(u145)
deckBuilder3Storage.Next.MouseButton1Down:connect(u145)
deckBuilder3Storage.Previous.MouseButton1Down:connect(u146)
deckBuilder3Storage.TouchSwipe:connect(function(p31, _)
	if p31 == Enum.SwipeDirection.Left then
		u146()
	elseif p31 == Enum.SwipeDirection.Right then
		u145()
	end
end)
deckBuilder3Storage.MouseWheelBackward:connect(u145)
deckBuilder3Storage.MouseWheelForward:connect(u146)
deckBuilder3Storage.InputChanged:connect(function(_)
end)

local t17: {[any]: any} = { "One", "Two", "Three", "Four", "Five" }
local t18: {[any]: any} = { "Neutral", "Blue", "Red", "Green", "Yellow" }

local function BindDeckActions()
	fakeMouse.BindInputBegan("NextPage", u145, Enum.KeyCode.D)
	fakeMouse.BindInputBegan("PreviousPage", u146, Enum.KeyCode.A)

	local n1: number = 1

	for _, v in pairs(t18) do
		fakeMouse.BindInputBegan("Toggle" .. v, function()
			u140 = nil
		end, Enum.KeyCode[t17[n1]])
		n1 += 1
	end
end
local function UnbindDeckActions()
	fakeMouse.UnbindInputBegan("NextPage")
	fakeMouse.UnbindInputBegan("PreviousPage")

	local n1: number = 1

	for _, v in pairs(t18) do
		fakeMouse.UnbindInputBegan("Toggle" .. v, function()
			u140(v)
		end, Enum.KeyCode[t17[n1]])
		n1 += 1
	end
end
local function CountCards(p34)
	local n1 = 0
	local n2 = 0

	if u130 then
		local n3: number = 1
		local s1 = ""

		deckBuilder3DeckSharing.Share.Text = ""

		for k, v in pairs(t13) do
			for _ = 1, v do
				s1 = if n3 == 1 then k else s1 .. "|" .. k
				n3 += 1
			end

			if cardLibrary[k].StarterCard then
				n2 += v
			end
		end

		deckBuilder3DeckSharing.Share.Text = s1
	end

	if not p34 then
		return n1
	end

	for _, v in pairs(p34) do
		n1 += v
	end

	return n1, n2
end

amountStarter.MouseEnter:connect(function()
	contextualize(amountStarter, "A deck should play 5-8 starters. 8 starters guarantees one in your opening hand, helping your early turns.", nil)
end)

local function UpdateCardCount()
	local v392, v393 = CountCards(t13)

	amount.Text = v392 .. "/40" .. " Cards"
	amount.Back.Text = amount.Text
	amountStarter.Text = v393 .. " starters 🌱"
end
local function CanSaveDeck()
	if CountCards(t13) == 40 or game.ReplicatedStorage:FindFirstChild("Testing") then
		return true
	end

	networkClientAlert("You need exactly 40 cards in your deck. Save failed.")
	audioService.PlaySound("DeniedSound")
	contextualize(amount, "You need to have exactly 40 cards in your deck.", fakeMouseMouseAwayFrom(deckBuilder3.Deck.Exit))

	for _ = 1, 5 do
		amount.TextColor3 = configClr.Red
		task.wait(0.1)
		amount.TextColor3 = configClr.Neutral
		task.wait(0.1)
	end

	return false
end

local v160 = string.find

local function DeckWouldBeFull(p35)
	local v396 = cardLibrary[p35]

	if v396 == nil then
		warn("DeckWouldBeFull, invalid card found: " .. (p35 or ""))

		return true
	end

	local v397 = t10[v396.Rarity]
	local v398 = t13[p35] or 0
	local v399 = v396.Original or p35

	if p35 ~= v399 then
		v398 += t13[v399] or 0
	end

	v396 = cardLibrary[v399]

	if v396.AltCards then
		for k, _ in pairs(v396.AltCards) do
			if k ~= p35 then
				v398 += t13[k] or 0
			end
		end
	end

	return v397 <= v398
end

local u162 = nil
local u163 = nil

local function CheckReady()
	deckBuilder3Trade.Trigger.TextTransparency = if u162.Ready and u163.Ready then 0 else 0.5
end

autocomplete = {
	Redraw = function(p36)
		local n1: number = 1

		for _, v in pairs(p36.Cards) do
			v.Physical.Position = uDim2New(0, 0, n1, 0)
			n1 += 1
		end
	end,
	RemoveCard = function(p37, p38)
		if not p37.Deck[p38] then
			local text: string = tostring(p38)

			warn("[Offer:RemoveCard] Attempted to remove a card that isn't in the offer: " .. text)

			return
		end

		p37.Deck[p38] = (p37.Deck[p38] or 0) - 1

		local v409 = p37.Cards[p38]

		if v409 then
			v409.Physical.Amount.Text = p37.Deck[p38]
		end

		if p37.Deck[p38] <= 0 then
			p37.Cards[p38].Physical:Destroy()
			p37.Cards[p38] = nil
			p37:Redraw()
		end

		v409 = p37.TellServer and t15[p38]

		if v409 then
			v409.Physical.Amount.Text = t12[p38] - (t13[p38] or 0) - (p37.Deck[p38] or 0)
		end

		if p37.Deck[p38] == 0 then
			p37.Deck[p38] = nil
		end
	end,
	AddCard = function(p39, p40, p41)
		if p39.TellServer and (t12[p40] <= 0 or p39.Deck[p40] and t12[p40] - p39.Deck[p40] <= 0) then
			return
		end

		p39.Deck[p40] = (p39.Deck[p40] or 0) + 1

		local v413 = p39.Cards[p40] or NewDeckCard(p40, not p39.TellServer, p39.Scaler)

		v413.Physical.MaxAmount.Visible = false
		p39.Cards[p40] = v413
		v413.Physical.Amount.Text = p39.Deck[p40]
		v413 = p39.TellServer and t15[p40]

		if v413 then
			v413.Physical.Amount.Text = t12[p40] - (t13[p40] or 0) - (p39.Deck[p40] or 0)
		end

		if not p41 then
			p39:Redraw()
		end
	end,
	ChangeBloxBux = function(p42, bloxBux)
		p42.BloxBux = bloxBux
		p42.Scaler._BloxBux.Amount.Text = p42.BloxBux .. "ʙʙ"
	end,
	SetReady = function(p44, ready)
		p44.Ready = ready
		p44:Update(false, p44.Ready, false)
		deckBuilder3Trade.Trigger.TextTransparency = if u162.Ready and u163.Ready then 0 else 0.5
	end,
	Update = function(p46, p47, ready, p49, p50)
		p46.BloxBux = p47 or p46.BloxBux

		if p49 then
			p46:ClearDeck()

			for k, v in pairs(p49) do
				for i = 1, v do
					p46:AddCard(k, i ~= v)
				end
			end
		end

		p46:ChangeBloxBux(p46.BloxBux)

		if p50 then
			p46.Physical.Value.Text = "Total Value: " .. p50 .. "BB"
		else
			p46.Physical.Value.Text = "Total Value: 0BB"
		end

		p46.Ready = ready
		p46.Physical.Accept.Text = deckBuilder3Trade["CheckBox" .. (if p46.Ready then "Filled" else "Empty")].Value .. "Ready"
		deckBuilder3Trade.Trigger.TextTransparency = if u162.Ready and u163.Ready then 0 else 0.5
	end,
	ClearDeck = function(p51)
		for k, v in pairs(p51.Deck) do
			for _ = 1, v do
				p51:RemoveCard(k)
			end
		end
	end,
	Clear = function(p52)
		p52:SetReady(false)
		p52:ClearDeck()
		p52:ChangeBloxBux(0)
		deckBuilder3Trade.Trigger.TextTransparency = if u162.Ready and u163.Ready then 0 else 0.5
	end
}
local t19: {[any]: any} = { __index = autocomplete }

function autocomplete.new(physical, tellServer)
	local t30: {[any]: any} = {}

	setmetatable(t30, t19)
	t30.BloxBux = 0
	t30.Ready = false
	t30.Cards = {}
	t30.Deck = {}
	t30.TellServer = tellServer
	t30.Physical = physical
	t30.Scaler = t30.Physical.Clip.ScrollingFrame.Scaler
	customScalingsCustomscalings["Update" .. physical.Name .. "OfferScrollyBit"] = function()
		t30:Redraw()
	end

	if tellServer then
		t30.Physical.Accept.MouseButton1Down:connect(function()
			networkFireServer("UpdateReadyTrade", u20, not t30.Ready)
		end)
	end

	return t30
end

u162 = autocomplete.new(deckBuilder3Trade.Their, false)
u163 = autocomplete.new(deckBuilder3Trade.Your, true)

function networkClient.FullOfferUpdate(p55, _)
	local Cards = nil
	local Ready = nil
	local n1 = 0
	local n2 = 0
	local v440 = nil
	local v441 = nil
	local n3 = 0

	for _, v in pairs(p55) do
		if v.Physical == game.Players.LocalPlayer then
			Cards = v.Cards
			Ready = v.Ready
			n1 = v.Value
		else
			n2 = v.BloxBux
			v440 = v.Cards
			v441 = v.Ready
			n3 = v.Value
		end
	end

	u163:Update(0, Ready, Cards, n1)
	u162:Update(n2, v441, v440, n3)
end
function CheckDeckConditions()
	local u445: boolean = false

	for k, _ in pairs(t13) do
		local v448 = cardLibrary[k]

		if v448.StartGameRequirement then
			local u449: boolean = false
			local u450: boolean = true
			local startGameRequirement = v448.StartGameRequirement
			local v452 = startGameRequirement[3] or 0

			v452 = startGameRequirement[4] or 9999

			if startGameRequirement[1] == "Highlander" then
				u445 = true
				u449 = true

				local n1: number = 0
				local t31: {[any]: any} = {}
				local t32: {[any]: any} = {}

				for k2, v in pairs(t13) do
					if v > 0 then
						if t14[k2] and t14[k2].Physical then
							t14[k2].FailedRequirement = false
						end

						if v > 1 then
							u450 = false

							if t14[k2] and t14[k2].Physical then
								t14[k2].FailedRequirement = true
							end
						end

						local v458 = cardLibrary[k2]

						if v458.Archetype and v458.Archetype == "Gladiator" then
							n1 += 1

							if n1 >= 3 then
								u450 = false

								if t14[k2] and t14[k2].Physical then
									t14[k2].FailedRequirement = true
								end
							end
						end

						if v458.Original and not v458.ContainerCard then
							if t31[v458.Original] then
								u450 = false

								if t32[v458.Original] then
									for k3, _ in pairs(t32[v458.Original]) do
										if t14[k3] and t14[k3].Physical then
											t14[k3].FailedRequirement = true
											t14[k3].Physical.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
										end
									end
								end

								if t14[k2] and t14[k2].Physical then
									t14[k2].FailedRequirement = true
									t14[k2].Physical.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
								end

								if t14[v458.Original] and t14[v458.Original].Physical then
									t14[v458.Original].FailedRequirement = true
									t14[v458.Original].Physical.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
								end
							elseif v > 0 then
								t31[v458.Original] = true

								if not t32[v458.Original] then
									t32[v458.Original] = {}
								end

								t32[v458.Original][k2] = true
							end
						elseif t31[k2] or t31[v458.ContainerAltBase] then
							u450 = false

							if t14[k2] and t14[k2].Physical then
								t14[k2].FailedRequirement = true
							end
						elseif v > 0 then
							t31[k2] = true
						end

						if not t14[k2] or t14[k2].FailedRequirement ~= true then
							if t14[k2] and t14[k2].Physical then
								t14[k2].Physical.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
						elseif t14[k2] and t14[k2].Physical then
							t14[k2].Physical.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
						end
					end
				end
			end

			if t14[k] and t14[k].Physical and u449 then
				local physical = t14[k].Physical

				if u450 == false then
					if string.find(physical.Title.Text, "✅") then
						physical.Title.Text = string.split(physical.Title.Text, "✅")[1] .. "❌"
					elseif not string.find(physical.Title.Text, "❌") then
						physical.Title.Text = physical.Title.Text .. " " .. "❌"
					end
				elseif string.find(physical.Title.Text, "❌") then
					physical.Title.Text = string.split(physical.Title.Text, "❌")[1] .. "✅"
				elseif not string.find(physical.Title.Text, "✅") then
					physical.Title.Text = physical.Title.Text .. " " .. "✅"
				end
			end
		end
	end

	if u445 == false then
		for k, _ in pairs(t13) do
			if t14[k] and t14[k].Physical then
				t14[k].Physical.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			end
		end
	end
end
function AddCardToDeck(p57, p58)
	if not DeckWouldBeFull(p57) then
		local v466 = t12[p57]
		local v467 = t13[p57] or 0

		if type(v466) == "number" then
			if s2 == "Simulator" and not p58 then
				local v468 = p57

				if cardLibrary[p57].Original then
					v468 = cardLibrary[p57].Original
				end

				if u19 and u19[9].UsedCards[v468] then
					networkClient.WarningMsg("You have already used this card in a previous fight!")
				end
			end

			if v466 <= 0 then
				return
			end

			if v466 - v467 <= 0 then
				return
			end

			t13[p57] = (t13[p57] or 0) + 1

			local v469 = t14[p57]

			if not v469 then
				v469 = NewDeckCard(p57)
				t14[p57] = v469
				customScalingsCustomscalings.Update(nil, nil, "DeckLine")
			end

			CheckDeckConditions()

			local physical = v469.Physical
			local color3 = Color3.fromRGB(0, 255, 0)

			AnimateDeckCardColor(physical, color3, t14[p57].FailedRequirement)
			v469.Physical.Amount.Text = t13[p57]
			v469 = t15[p57]

			if v469 then
				v469.Physical.Amount.Text = t12[p57]

				if t13[p57] then
					v469.Physical.Amount.Text = t12[p57] - t13[p57]
				end
			end

			local v472, v473 = CountCards(t13)

			amount.Text = v472 .. "/40" .. " Cards"
			amount.Back.Text = amount.Text
			amountStarter.Text = v473 .. " starters 🌱"

			return true
		end

		v25("AddCardToDeck skipped invalid card:", p57)

		return false
	end
end
function RemoveCardFromDeck(p59)
	t13[p59] = math.max(0, (t13[p59] or 0) - 1)

	if not t14[p59] then
		return
	end

	local physical = t14[p59].Physical

	physical.Amount.Text = t13[p59]

	if t13[p59] <= 0 then
		t13[p59] = nil
		t14[p59] = nil
		physical:Destroy()
		UpdateDeckSlotDisplay(u139)
		customScalingsCustomscalings.Update(nil, nil, "DeckLine")
		CheckDeckConditions()
	else
		CheckDeckConditions()

		local color3 = Color3.fromRGB(255, 0, 0)

		AnimateDeckCardColor(physical, color3, t14[p59].FailedRequirement)
	end

	local v477 = t15[p59]

	if v477 then
		v477.Physical.Amount.Text = t12[p59]

		if t13[p59] then
			v477.Physical.Amount.Text = t12[p59] - t13[p59]
		end
	end

	local v478, v479 = CountCards(t13)

	amount.Text = v478 .. "/40" .. " Cards"
	amount.Back.Text = amount.Text
	amountStarter.Text = v479 .. " starters 🌱"
	UpdateDeckSlotDisplay(u139)
end
local function u166()
	return deckBuilder3.DeckSelection.Clip.Visible or deckBuilder3.DeckSharing.Visible or deckBuilder3.DeleteConfirm.Visible or deckBuilder3.ImportConfirm.Visible
end

autocomplete = Instance.new("ImageButton")
autocomplete.BackgroundTransparency = 1
autocomplete.ZIndex = teleportService
nevermore = Instance.new("TextLabel", autocomplete)
nevermore.Name = "Amount"
nevermore.Size = UDim2.fromScale(0.5, 0.3)
nevermore.Position = UDim2.fromScale(0.4, 0.6)
nevermore.BackgroundTransparency = 1
nevermore.TextColor3 = Color3.new(1, 1, 1)
nevermore.TextStrokeTransparency = 0.5
nevermore.TextScaled = true
nevermore.ZIndex = teleportService + 10
nevermore.TextXAlignment = Enum.TextXAlignment.Right
nevermore.Font = "SourceSansBold"
v57 = Instance.new("UIStroke")
v57.Thickness = 2
v57.Transparency = 0.2
v57.Parent = nevermore
v57 = Instance.new("TextLabel", autocomplete)
v57.Name = "MaxAmount"
v57.Size = uDim2New(0.4, 0, 0.3, 0)
v57.Position = uDim2New(0, 0, 0.7, 0)
v57.BackgroundTransparency = 1
v57.TextColor3 = Color3.new(1, 1, 1)
v57.TextStrokeTransparency = 0.5
v57.TextScaled = true
v57.ZIndex = teleportService + 10
v57.Font = "SourceSansBold"
v57.Visible = false

local u167 = autocomplete

local function DestroyStorageCard(p60)
	setmetatable(p60, nil)

	if p60.Physical then
		p60.Physical:Destroy()
		p60.Physical = nil
	end

	p60.LibraryIndex = nil
	p60.Position = nil

	if p60.EventAdd then
		p60.EventAdd:disconnect()
		p60.EventAdd = nil
	end

	if p60.EventRemove then
		p60.EventRemove:disconnect()
		p60.EventRemove = nil
	end

	if p60.EventEdit then
		p60.EventEdit:disconnect()
		p60.EventEdit = nil
	end

	p60.Add = nil
	p60.Remove = nil
	p60.Edit = nil
end
local function NewThing(parent)
	local new: ImageLabel = Instance.new("ImageLabel")

	new.Name = "New"
	new.Image = "rbxassetid://485595241"
	new.BackgroundTransparency = 1
	new.SizeConstraint = "RelativeXX"
	new.Size = uDim2New(0.5, 0, 0.5, 0)
	new.Position = uDim2New(-0.1, 0, -0.05, 0)
	new.Visible = true
	new.Rotation = -10
	new.Parent = parent
	new.ZIndex = parent.ZIndex + 1

	return new
end

v57 = Color3.fromRGB(255, 255, 255)
autocomplete = Color3.fromRGB(108, 255, 246)
teleportService = Color3.fromRGB(192, 103, 255)
nevermore = Color3.fromRGB(255, 47, 47)
sleeves = Color3.fromRGB(255, 217, 80)
replicatedStorage = Color3.fromRGB(82, 120, 117)

local t20: {[any]: any} = {
	Common = v57,
	Uncommon = autocomplete,
	Rare = teleportService,
	Epic = nevermore,
	Legendary = sleeves,
	Token = replicatedStorage
}

function NewStorageCard(name, p63, p64)
	local t33: {[any]: any} = { Position = "Storage", LibraryIndex = name }

	setmetatable(t33, t2[name])
	t33.Physical = u167:Clone()
	t33.Physical.Name = name
	t33.Physical.Image = "rbxassetid://" .. t33.Id
	t33.Physical.Amount.Text = (t12[name] or 0) - (t13[name] or 0) - (u163.Deck[name] or 0)
	t33.Physical.Amount.TextColor3 = t20[t33.Rarity]

	if t12[name] <= 0 or s2 == "Simulator" and u19 and (not not u19[9].UsedCards[name] or not not cardLibrary[name].Original and not not u19[9].UsedCards[cardLibrary[name].Original]) then
		t33.Physical.ImageColor3 = Color3.fromRGB(141, 141, 141)
		t33.Physical.Amount.TextColor3 = Color3.fromRGB(71, 79, 94)
		t33.Physical.MaxAmount.TextColor3 = Color3.fromRGB(71, 79, 94)
	end

	t33.Physical.MaxAmount.Text = stringSub(t33.Rarity, 1, 1)
	networkClient.AutoCost(t33.Physical, t33.Cost, true)
	t33.Physical.Parent = clip

	if p64 then
		local v487 = NewThing(t33.Physical)

		t33.Physical.MouseLeave:connect(function()
			networkFireServer("SawNewCard", name)
			animation.Animate(v487, { ImageTransparency = 1 }, 0.2, "Out", "Quad")
			v487:Destroy()
		end)
	end

	if t33.Foil then
		foilEffect(t33.Physical, t33.LibraryIndex, p63 > 18)
	end

	if t33.ArtAnimation then
		cardAnim(t33.Physical, t33.ArtAnimation, t33.Foil, p63 > 18)
	end

	t33.Destroy = DestroyStorageCard
	nonGameCard.BindInspect(t33.Physical, t33, u166)

	function t33.Add()
		if u141(name) then
			audioService.PlaySound("Draw")
		end
	end
	function t33.Remove()
		audioService.PlaySound("UI-MouseOver Pop HD")
		u142(name)
	end

	t33.EventAdd = t33.Physical.MouseButton1Click:connect(t33.Add)

	if u143 then
		function t33.Edit()
			u143(name, t33.Physical)
		end
	end

	if t33.Edit then
		t33.EventEdit = t33.Physical.TouchLongPress:connect(t33.Edit)
		t33.EventRemove = t33.Physical.MouseButton2Click:connect(t33.Edit)

		return t33
	end

	t33.EventRemove = t33.Physical.MouseButton2Click:connect(t33.Remove)

	return t33
end

local deckBuilder3Preview = deckBuilder3.Preview

local function HideInventoryPreview()
	deckBuilder3Preview.Visible = false
end

deckBuilder3.Storage.MouseEnter:connect(HideInventoryPreview)
deckBuilder3Search.MouseEnter:Connect(HideInventoryPreview)

local function InventoryPreview(p65, p66)
	if not p65 then
		return HideInventoryPreview()
	end

	for _, v in pairs(deckBuilder3Preview:GetChildren()) do
		v:Destroy()
	end

	deckBuilder3Preview.Image = "rbxassetid://" .. p65.Id
	deckBuilder3Preview.Visible = true
	deckBuilder3Preview.ZIndex = 21

	if p65.Foil then
		foilEffect(deckBuilder3Preview, p65.LibraryIndex)
	end

	if p65.ArtAnimation then
		cardAnim(deckBuilder3Preview, p65.ArtAnimation, p65.Foil)
	end

	deckBuilder3Preview.Position = uDim2New(0.75, 0, 0, utilsClamp(0, u28.AbsoluteSize.Y * 0.9 - deckBuilder3Preview.AbsoluteSize.Y, p66))
end

local u174 = scaler.DeckBase

if u32 then
	u174 = scaler.DeckBaseMobile
end

function AnimateDeckCardColor(p67, backgroundColor3, p69)
	p67.BackgroundColor3 = backgroundColor3

	if p69 and p69 == true then
		local animationAnimateAsync = animation.AnimateAsync
		local color3 = Color3.fromRGB(170, 0, 0)

		animationAnimateAsync(p67, { BackgroundColor3 = color3 }, 0.6, "Out", "Quart")

		return
	end

	local animateAsync = animation.AnimateAsync
	local color3 = Color3.fromRGB(0, 0, 0)

	animateAsync(p67, { BackgroundColor3 = color3 }, 0.6, "Out", "Quart")
end
function NewDeckCard(name, p71, p72)
	local t34: {[any]: any} = { Position = "Storage", LibraryIndex = name }

	setmetatable(t34, t2[name])

	local clone2 = u174:Clone()

	clone2.Title.Text = t34.Name .. (if t34.StarterCard then " 🌱" else "")
	clone2.Title.Text = clone2.Title.Text .. (if t34.Original then " ◉" else "")
	clone2.Color.BackgroundColor3 = configClr[t34.Color]
	clone2.Amount.Text = "##"
	clone2.MaxAmount.Text = "/" .. t10[t34.Rarity]
	clone2.Name = name

	for _, v in pairs(t34.Cost) do
		clone2.LayoutOrder = clone2.LayoutOrder + v
	end

	t34.Physical = clone2

	if t34.Foil then
		clone2.Title.TextStrokeColor3 = configClr[t34.Color]
		clone2.Title.TextStrokeTransparency = 0

		if t34.Color == "Neutral" then
			clone2.Title.TextStrokeColor3 = Color3.fromRGB(169, 176, 186)
		end
	end

	local clone2BackgroundTransparency = clone2.BackgroundTransparency

	clone2.BackgroundTransparency = 1
	clone2.Amount.TextTransparency = 1
	clone2.Title.TextTransparency = 1

	if u32 then
		networkClient.AutoCostDeckCard(clone2.StudHolder, t34.Cost, true)
	end

	clone2.Visible = true
	clone2.Parent = p72 or scaler

	if clone2.Parent ~= scaler then
		local clone2Size = clone2.Size
		local v508 = UDim2.fromScale(0, 0.045)

		clone2.Size = clone2Size + v508
	end

	UpdateDeckSlotDisplay(u139)
	nonGameCard.BindInspect(clone2, t34)
	spawn(function()
		animation.AnimateAsync(clone2, { BackgroundTransparency = clone2BackgroundTransparency }, 0.15, "Out", "Quad")
		animation.AnimateAsync(clone2.Amount, { TextTransparency = 0 }, 0.15, "Out", "Quad")
		animation.AnimateAsync(clone2.Title, { TextTransparency = 0 }, 0.15, "Out", "Quad")
	end)
	clone2.MouseEnter:Connect(function()
		audioService.PlaySound("click2")
		animation.Animate(clone2, { BackgroundTransparency = 0 }, 0, "In", "Linear")
		InventoryPreview(t34, clone2.AbsolutePosition.Y)
	end)
	clone2.MouseLeave:Connect(function()
		animation.Animate(clone2, { BackgroundTransparency = clone2BackgroundTransparency }, 0.1, "In", "Quad")
	end)

	if not p71 then
		clone2.MouseButton1Click:Connect(function()
			audioService.PlaySound("UI-MouseOver Pop HD")
			u142(name)
		end)
		clone2.MouseButton2Click:Connect(function()
			audioService.PlaySound("Draw")
			u141(name)
		end)
	end

	return t34
end

local s3 = ""
local t21: {[any]: any} = { Red = true, Green = true, Blue = true, Yellow = true, Neutral = true }

replicatedStorage = require(script.FilterToCard)

local replicatedStorageFilterToCard = replicatedStorage.FilterToCard
local replicatedStorageSpecialFilters = replicatedStorage.SpecialFilters
local u179: boolean = true -- Show Base Card: on by default
local v180 = require(script.SearchPanel).Init(deckBuilder3Search.Panel, cardLibrary)

customScalingsCustomscalings.RedrawSearchPanel = v180.Redraw
u166 = function()
	return deckBuilder3.DeckSelection.Clip.Visible or v180.Out() or deckBuilder3.DeckSharing.Visible or deckBuilder3.DeleteConfirm.Visible or deckBuilder3.ImportConfirm.Visible
end

local u181 = time()

local function ApplyFilter()
	local v509 = u181
	local v510 = time()

	if v509 <= v510 then
		local u511: boolean = #s3 > 0
		local t35: {[any]: any} = {}

		for _, v in pairs(orderedstoragecards) do
			if replicatedStorageFilterToCard(v, cardLibrary[v], u511, s3, t21, u179) then
				table.insert(t35, v)
			end
		end

		u144(t35, 0)
	end
end
local function ClearStorage()
	for _, v in pairs(clip:GetChildren()) do
		if not t12[v.Name] then
			t15[v.Name] = nil
			v:Destroy()
		end
	end
end
local function ClearVisualDeck()
	for _, v in pairs(scaler:GetChildren()) do
		if not t13[v.Name] and v.Name ~= "DeckBase" and v.Name ~= "DeckBaseMobile" and not not v:IsA("GuiObject") then
			t14[v.Name] = nil
			v:Destroy()
		end
	end
end

local orderedCards = require(script.OrderedCards)

local function LoadAndSetStorage()
	v25("LoadAndSetStorage")

	if s2 == "Simulator" then
		u19 = networkInvokeServer("GetQuestInfo")
	end

	orderedstoragecards = {}
	orderedCards(t12, function(p73)
		table.insert(orderedstoragecards, p73)
	end, not u133)

	local v519: {[any]: any} = t13
	t13 = {}

	for k, v in pairs(v519) do
		if t12[k] then
			spawn(function()
				for _ = 1, v do
					AddCardToDeck(k, true)
				end
			end)
		end
	end

	orderedCards(t13, function(p74, p75)
		if cardLibrary[p74] then
			local v773 = t14[p74] or NewDeckCard(p74)

			v773.Physical.Amount.Text = p75
			t14[p74] = v773
		end
	end)
	-- FASTER OPEN: the storage page was built TWICE: u144 made every card of the page (clones, foil effects, art animations, inspect bindings),
	-- then ApplyFilter immediately tore them all down and made them again. ApplyFilter's build is the one that stays, so it is the only one now.
	-- (If a search edit has the filter on cooldown, ApplyFilter would do nothing, so build the page directly then.)
	if time() >= u181 then
		ApplyFilter()
	else
		u144(orderedstoragecards, nil)
	end
end

print("Deck Slot Color Display")

local function CountCardsInOtherDeck(p76)
	local t36 = data.Storage() or {}
	local n1 = 0

	for _, v in pairs(t36) do
		n1 += v[p76] or 0
	end

	return n1
end
function DrawColorPercent(p77, text, p79)
	local t37 = data.Storage() or {}
	local n1 = 0
	local n2 = 0
	local t38: {[any]: any} = {}

	for _, v in pairs(configColororder) do
		t38[v] = 0
	end

	if text then
		n2 = CountCardsInOtherDeck(text)

		for k, v in pairs(t37) do
			local v538 = v[text]

			if v538 then
				local v539 = cardLibrary[k].Color

				t38[v539] = t38[v539] + v538
			end
		end
	elseif p79 then
		for k, v in pairs(p79) do
			local v542 = cardLibrary[k].Color

			t38[v542] = t38[v542] + v
			n2 += v
		end
	end

	for _, v in pairs(configColororder) do
		local n3 = t38[v] / n2
		local v546 = p77[v]
		local v547 = uDim2New(n3, 0, 1, 0)
		local v548 = uDim2New(n1, 0, 0, 0)

		v546:TweenSizeAndPosition(v547, v548, "Out", "Quad", 0.2, true)
		n1 += n3
	end
end
function UpdateDeckSlotDisplay(p80)
	local text: string = tostring(p80)
	local text2 = deckBuilder3.DeckSelection.Clip.DeckHolder:FindFirstChild(text)

	if text2 then
		DrawColorPercent(text2.ColorPercentage, text)
	end
end

networkClient.UpdateDeckSlotDisplay = UpdateDeckSlotDisplay

local function LoadStorage(skipDataReload)
	-- FASTER OPEN: ShowInventory already fetched the save data a moment ago (in parallel); reloading it here was a second serial server round trip
	if not skipDataReload then
		data.Load()
	end
	ClearStorage()
	ClearVisualDeck()
	LoadAndSetStorage()

	local v552, v553 = CountCards(t13)

	amount.Text = v552 .. "/40" .. " Cards"
	amount.Back.Text = amount.Text
	amountStarter.Text = v553 .. " starters 🌱"
	UpdateDeckSlotDisplay(u139)

	local v554 = data.DeckNames()
	local text: string = tostring(u139)

	SetCurrentDeckName(v554[text])

	if customScalingsCustomscalings.Update then
		customScalingsCustomscalings.Update(nil, nil, "DeckLine")
		v121:ScrollToTop()
	end
end

print("Deck Slots")

local t22: {[any]: any} = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K"
}
local mathAbs = math.abs
local timestamp = tick()

local function changeDeckName()
end
local function HideSelector()
	deckBuilder3.DeckSelection.Clip.Visible = false
	nonGameCard.SetInspectDisabled(false)
	animation.AnimateAsync(deckBuilder3.DeckSelection.OpenDeckSelection.OpenButton, { Rotation = 0 }, 0.8, "Out", "Quint")
end

replicatedStorage = function()
	if deckBuilder3.DeckSelection.Clip.Visible then
		HideSelector()

		return
	end

	nonGameCard.SetInspectDisabled(true)
	deckBuilder3.DeckSelection.Clip.DeckHolder.Position = UDim2.fromScale(0.5, 1)
	deckBuilder3.DeckSelection.Clip.Visible = true
	deckBuilder3.DeleteConfirm.Visible = false
	deckBuilder3.ImportConfirm.Visible = false
	deckBuilder3.DeckSharing.Visible = false
	deckBuilder3.Blocker.Visible = false

	local animationAnimateAsync = animation.AnimateAsync
	local deckHolder = deckBuilder3.DeckSelection.Clip.DeckHolder
	local v558 = UDim2.fromScale(0.5, 0)

	animationAnimateAsync(deckHolder, { Position = v558 }, 0.5, "Out", "Quint")
	animation.AnimateAsync(deckBuilder3.DeckSelection.OpenDeckSelection.OpenButton, { Rotation = 180 }, 0.8, "Out", "Quint")
end
deckBuilder3.DeckSelection.OpenDeckSelection.MouseButton1Click:Connect(replicatedStorage)
deckBuilder3.DeckSelection.OpenDeckSelection.OpenButton.MouseButton1Click:Connect(replicatedStorage)
deckBuilder3.Storage.TopBar.EditName.MouseButton1Click:Connect(function()
	local u559 = nil
	local deckNameInput = deckBuilder3.Storage.TopBar.DeckNameHolder.DeckNameInput

	deckNameInput.Text = ""
	deckNameInput.Visible = true
	deckBuilder3.Storage.TopBar.DeckNameHolder.DeckName.Visible = false
	deckNameInput:CaptureFocus()
	u559 = deckNameInput.FocusLost:connect(function(p81)
		if p81 then
			local deckNameInputText = deckNameInput.Text
			local text: string = tostring(u139)
			local v777 = networkInvokeServer("SaveDeckName", text, deckNameInputText)

			audioService.PlaySound("Target Or Select")
			deckBuilder3.Storage.TopBar.DeckNameHolder.DeckName.Text = v777
			deckBuilder3.DeckSelection.Clip.DeckHolder[u139].TextLabel.Text = v777
			data.Load()
		end

		deckNameInput.Visible = false
		deckBuilder3.Storage.TopBar.DeckNameHolder.DeckName.Visible = true
		u559:Disconnect()
	end)
end)
deckBuilder3.Storage.TopBar.Share.MouseButton1Click:Connect(function()
	deckBuilder3.DeckSharing.Visible = not deckBuilder3.DeckSharing.Visible
	audioService.PlaySound("click4")
	HideSelector()
	deckBuilder3.Blocker.Visible = true
	deckBuilder3.DeleteConfirm.Visible = false
end)
deckBuilder3.DeckSharing.Revert.MouseButton1Click:Connect(function()
	audioService.PlaySound("button.wav")
end)
deckBuilder3.DeckSharing.Close.MouseButton1Click:Connect(function()
	deckBuilder3.DeckSharing.Visible = false
	deckBuilder3.Blocker.Visible = false
	audioService.PlaySound("click3")
end)
deckBuilder3.Storage.TopBar.Clear.MouseButton1Click:Connect(function()
	deckBuilder3.DeleteConfirm.Visible = not deckBuilder3.DeleteConfirm.Visible
	audioService.PlaySound("clickfast.wav")
	HideSelector()
	deckBuilder3.DeckSharing.Visible = false
	deckBuilder3.Blocker.Visible = true
end)
deckBuilder3.DeleteConfirm.Confirm.MouseButton1Click:Connect(function()
	audioService.PlaySound("collide.wav")
	deckBuilder3.DeleteConfirm.Visible = false
	deckBuilder3.Blocker.Visible = false
	networkClientAlert("You've cleared your deck.")
end)
deckBuilder3.DeleteConfirm.Deny.MouseButton1Click:Connect(function()
	audioService.PlaySound("click3")
	deckBuilder3.DeleteConfirm.Visible = false
	deckBuilder3.Blocker.Visible = false
end)
deckBuilder3.ImportConfirm.Confirm.MouseButton1Click:Connect(function()
	audioService.PlaySound("bass.wav")
	deckBuilder3.ImportConfirm.Visible = false
	deckBuilder3.Blocker.Visible = false

	if LoadCards().removedInvalid then
		networkClientAlert("Deck replaced, but some invalid cards were removed.")

		return
	end

	networkClientAlert("You've replaced your deck.")
end)
deckBuilder3.ImportConfirm.Deny.MouseButton1Click:Connect(function()
	audioService.PlaySound("click3")
	deckBuilder3.ImportConfirm.Visible = false
	deckBuilder3.Blocker.Visible = false

	if u16 then
		deckBuilder3DeckSharing.Share.Text = u16
		u16 = nil
	end
end)

function SetCurrentDeckName(p82)
	deckBuilder3.Storage.TopBar.DeckNameHolder.DeckName.Visible = true
	deckBuilder3.Storage.TopBar.DeckNameHolder.DeckName.Text = p82 or ""
end
function OnSlotPick(_, p84, p85, p86)
	pickslotdebounce = true
	v25("PickSlot")
	tick()

	if not p86 then
		networkInvokeServer("SaveDeck", t13, u139)
	end

	t13 = networkInvokeServer("GetDeck", p84)
	u139 = p84
	LoadStorage()

	if not p85 then
		local deckHolder = deckBuilder3.DeckSelection.Clip.DeckHolder
		local text: string = tostring(p84)

		p85 = deckHolder:FindFirstChild(text)
	end

	local v568 = data.DeckNames()
	local text: string = tostring(u139)
	local v570 = v568[text]

	if p85 then
		p85.TextLabel.Text = v570
	end

	SetCurrentDeckName(v570)
	HideSelector()
	pickslotdebounce = false
end
local function PickSlot(p87, p88, _)
	if tick() - p87 < 1 then
		return
	end

	if tick() - 0.5 < timestamp then
		return
	end

	if pickslotdebounce then
		return
	end

	OnSlotPick(p87, p88)
end

local deckHolder = deckBuilder3.DeckSelection.Clip.DeckHolder

do
	-- Slot buttons are named "1".."100" and ordered by LayoutOrder (= slot number); make sure the list layout sorts by that and not by name.
	local slotLayout = deckHolder:FindFirstChildWhichIsA("UIGridStyleLayout")

	if slotLayout then
		slotLayout.SortOrder = Enum.SortOrder.LayoutOrder
	end
end

function networkClient.AddDeckSlot(p90, p91, p92)
	data.Load()

	local n1 = 0
	local clone3 = deckHolder.Parent.Deck:Clone()

	clone3.LayoutOrder = tonumber(p90) or 0 -- numeric order (up to 100 deck slots: "10" must not sort before "2")
	clone3.Parent = deckHolder
	clone3.Name = tostring(p90)
	clone3.TextLabel.Text = p91
	clone3.MouseButton1Down:connect(function()
		local v778: number = n1

		if tick() - v778 < 1 then
			return
		end

		if tick() - 0.5 < timestamp then
			return
		end

		if pickslotdebounce then
			return
		end

		OnSlotPick(v778, p90)
	end)

	if userInputService.GamepadEnabled == true then
		clone3.InputBegan:Connect(function(input)
			v25(input.UserInputType)

			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and userInputService.GamepadEnabled == true then
				v25("Pick slot controller")

				local v780: number = n1

				if tick() - v780 < 1 then
					return
				end

				if tick() - 0.5 < timestamp then
					return
				end

				if pickslotdebounce then
					return
				end

				OnSlotPick(v780, p90)

				return
			end
		end)
	end

	clone3.Visible = true

	if p92 then
		return
	end

	pickslotdebounce = true
	v25("PickSlot")
	n1 = tick()
	networkInvokeServer("SaveDeck", t13, u139)
	t13 = networkInvokeServer("GetDeck", p90)
	LoadStorage()
	u139 = p90
	UpdateDeckSlotDisplay(p90)
	SetCurrentDeckName(p91)
	HideSelector()
	pickslotdebounce = false
end;

(function(p94)
	for k, v in pairs(p94) do
		local clone4 = deckHolder.Parent.Deck:Clone()

		clone4.LayoutOrder = tonumber(k) or 0 -- numeric order (up to 100 deck slots)
		clone4.Parent = deckHolder
		clone4.Name = k
		clone4.TextLabel.Text = v
		DrawColorPercent(clone4.ColorPercentage, k)
		clone4.MouseButton1Down:connect(function()
			local numberValue: number? = tonumber(k)

			if tick() - 0 < 1 then
				return
			end

			if tick() - 0.5 < timestamp then
				return
			end

			if pickslotdebounce then
				return
			end

			OnSlotPick(0, numberValue)
		end)

		if userInputService.GamepadEnabled == true then
			clone4.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and userInputService.GamepadEnabled == true then
					v25("Pick slot controller")

					if tick() - 0 < 1 then
						return
					end

					if tick() - 0.5 < timestamp then
						return
					end

					if pickslotdebounce then
						return
					end

					OnSlotPick(0, k)

					return
				end
			end)
		end

		clone4.Visible = true
	end
end)(networkInvokeServer("GetDeckName"))
replicatedStorage = deckHolder.Parent.Deck:Clone()
replicatedStorage.Parent = deckHolder
replicatedStorage.Name = "CreateDeck"
replicatedStorage.TextLabel.Text = "Create New Deck"
replicatedStorage.TextLabel.Font = Enum.Font.SourceSansBold
replicatedStorage.BackgroundColor3 = Color3.fromRGB(37, 94, 63)
replicatedStorage.LayoutOrder = 999
replicatedStorage.MouseButton1Down:connect(function()
	if pickslotdebounce then
		return
	end

	pickslotdebounce = true

	if not networkInvokeServer("CreateDeck") then
		pickslotdebounce = false
	end
end)
replicatedStorage.ColorPercentage.Visible = false
replicatedStorage.Visible = true
-- FASTER LOAD: result was discarded, but the call still stalled the rest of startup for a full round trip
task.spawn(networkInvokeServer, "GetCurrentDeckSlot")

local function StartDeckBuilderTutorial()
	u17 = true
	nonGameCard.SetInspectDisabled(true)
	battleTutorial.SetSpritesheet("rbxassetid://121407898586909", 3)
	battleTutorial.SetFace(9)
	battleTutorial.SetVisible(true)
	battleTutorial.ShowText("I saw you digging through your pockets looking confused… you don't know how to build a deck yet, do you?")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("Let me show you the basics of deck building!")
	battleTutorial.SetFace(3)

	local effectsBriecreategui = effects.briecreategui
	local color3 = Color3.fromRGB(0, 0, 0)
	local color33 = Color3.fromRGB(255, 0, 0)

	effectsBriecreategui("borderguh", "Border", UDim2.new(0.245, 0, 0.9, 0), UDim2.new(0.75, 0, 0, 0), UDim2.new(0.75, 0, 0, 0), 0, 0, color3, 1, 0, 1000, color33, 10)
	battleTutorial.ShowText("First, this is your current deck.")
	battleTutorial.SetFace(2)
	battleTutorial.ShowText("These are the cards you'll start battles with. You can remove cards from it by simply tapping or clicking them!")
	battleTutorial.SetFace(3)

	local effectsBriealtergui = effects.briealtergui
	local color34 = Color3.fromRGB(0, 0, 0)

	effectsBriealtergui("borderguh", UDim2.new(0.01, 0, 0.1, 0), UDim2.new(0.73, 0, 0.65, 0), 0, 1, color34, 1, 0.5)
	battleTutorial.ShowText("This is your inventory. Every card you own appears here. You can click or tap on any cards to add them to your deck.")
	battleTutorial.SetFace(2)

	local v588 = effects.briealtergui
	local color35 = Color3.fromRGB(0, 0, 0)

	v588("borderguh", UDim2.new(0.01, 0, 0.91, 0), UDim2.new(0.41, 0, 0.08, 0), 0, 1, color35, 1, 0.5)
	battleTutorial.ShowText("Use these colour filters and the search bar to find specific cards.")
	battleTutorial.SetFace(9)

	local v590 = effects.briealtergui
	local color36 = Color3.fromRGB(0, 0, 0)

	v590("borderguh", UDim2.new(0.63, 0, 0.91, 0), UDim2.new(0.11, 0, 0.08, 0), 0, 1, color36, 1, 0.5)
	battleTutorial.ShowText("This shows your Deck size and starter count. Your Deck must have exactly 40 cards.")
	battleTutorial.SetFace(4)
	battleTutorial.ShowText("Starters are cards you can always play on turn one! Starters are marked with a 🌱 symbol in your deck.")
	battleTutorial.SetFace(1)
	battleTutorial.ShowText("Your starting hand has a higher chance of drawing starters. Having 7–8 almost guarantees one in your hand.")
	battleTutorial.SetFace(8)
	battleTutorial.ShowText("So please. Put them in your decks. Don't ignore them and then complain that you cannot cast anything at the start of a battle.")
	battleTutorial.SetFace(9)
	battleTutorial.ShowText("Anyway, that's the important stuff! The rest you can figure out!")

	local v592 = effects.briealtergui
	local color37 = Color3.fromRGB(0, 0, 0)

	v592("borderguh", UDim2.new(0.761, 0, 0.922, 0), UDim2.new(0.23, 0, 0.06, 0), 0, 1, color37, 1, 0.5)
	battleTutorial.SetFace(4)
	battleTutorial.ShowText("When you're done, click Save & Exit. Have fun!")
	networkFireServer("FirstTimeViewProgress", "DeckBuilder")
	effects.briedestroygui("borderguh", 0)
	networkClient.UpdateStatsData()
	battleTutorial.SetVisible(false)
	nonGameCard.SetInspectDisabled(false)
	u17 = false
end

changeDeckName = function(p96)
	if p96 == u133 then
		return
	end

	u133 = p96

	if p96 then
		deckBuilder3.Storage.TopBar.Sort.Rarity.BackgroundColor3 = Color3.fromRGB(51, 67, 75)
		deckBuilder3.Storage.TopBar.Sort.Cost.BackgroundColor3 = Color3.fromRGB(38, 50, 56)
	else
		deckBuilder3.Storage.TopBar.Sort.Cost.BackgroundColor3 = Color3.fromRGB(51, 67, 75)
		deckBuilder3.Storage.TopBar.Sort.Rarity.BackgroundColor3 = Color3.fromRGB(38, 50, 56)
	end

	LoadAndSetStorage()
end
deckBuilder3.Storage.TopBar.Sort.Rarity.MouseButton1Click:Connect(function()
	audioService.PlaySound("locksoft")

	if u133 == true then
		return
	end

	u133 = true
	deckBuilder3.Storage.TopBar.Sort.Rarity.BackgroundColor3 = Color3.fromRGB(51, 67, 75)
	deckBuilder3.Storage.TopBar.Sort.Cost.BackgroundColor3 = Color3.fromRGB(38, 50, 56)
	LoadAndSetStorage()
end)
deckBuilder3.Storage.TopBar.Sort.Cost.MouseButton1Click:Connect(function()
	audioService.PlaySound("locksoft")

	if u133 == false then
		return
	end

	u133 = false
	deckBuilder3.Storage.TopBar.Sort.Cost.BackgroundColor3 = Color3.fromRGB(51, 67, 75)
	deckBuilder3.Storage.TopBar.Sort.Rarity.BackgroundColor3 = Color3.fromRGB(38, 50, 56)
	LoadAndSetStorage()
end)

local function GetAllCardsNotOwned(p97)
	local t39: {[any]: any} = {}
	local v597 = p97[3]

	for k, v in pairs(cardLibrary) do
		if v597[k] then
			t39[k] = v597[k]["0"]
		elseif v.Rarity ~= "Token" and v.PlayTest ~= true or utils.IsPBE() then
			t39[k] = 0
		end
	end

	return t39
end
local function GetAllCards(p98)
	local t40: {[any]: any} = {}

	if showall then
		return (GetAllCardsNotOwned(p98))
	end

	for k, v in pairs(p98[3]) do
		if cardLibrary[k] then
			local u604: boolean = false

			for _, iterValue in pairs(v) do
				if iterValue ~= 0 then
					u604 = true
				end
			end

			if u604 then
				t40[k] = v["0"]
			end
		end
	end

	return t40
end
local function ShowInventory(p99)
	BindDeckActions()
	handy.Hide()

	-- FASTER OPEN: ask the server for the current deck RIGHT AWAY. It used to be requested only after the fade, the battleback and the song change
	-- had all finished, so its round trip was waited out on top of them. Now it travels while the screen fades / the background loads.
	local deckFetched, fetchedOk, fetchedDeck = false, false, nil
	-- FASTER OPEN: the save data (data.Load = LoadData round trip) was loaded AFTER the fade and background, and LoadStorage then loaded it a
	-- second time. It now travels in parallel with the deck request, and LoadStorage reuses it.
	local savedFetched, savedData = false, nil

	task.spawn(function()
		fetchedOk, fetchedDeck = pcall(networkInvokeServer, "GetCurrentDeck")
		deckFetched = true
	end)
	task.spawn(function()
		local okSave, loaded = pcall(data.Load)

		if okSave then
			savedData = loaded
		end

		savedFetched = true
	end)

	if p99 == "Simulator" then
		transition.ToggleBlack(1, 0.15)
	else
		transition.ToggleBlack(1, 0.15)
		transition.ShowBattleBack(nil, true) -- screen is black now: skip the (invisible) 0.4s blur-in wait
		-- FASTER OPEN: ChangeSong fades the old track out with a BLOCKING tween (about 1.5s), and the whole deck builder waited for it behind a black
		-- screen. The song change now runs on its own thread.
		task.spawn(audioService.ChangeSong, "DeckBuilder")
	end

	while not savedFetched do
		task.wait()
	end

	local v608 = savedData

	if not v608 then
		warn("Failed to load savedata")

		return
	end

	s2 = if p99 then p99 else "None"

	local v609 = GetAllCards(v608)

	while not deckFetched do
		task.wait()
	end

	if not fetchedOk then
		error(fetchedDeck)
	end

	local v610 = fetchedDeck

	t12 = v609
	t13 = v610
	LoadStorage(true)
	deckBuilder3.Visible = true
	customScalings.UpdateScalings()
	transition.ToggleBlack(-1, 0.15)
end
local function HideInventory()
	UnbindDeckActions()
	audioService.PlaySound("Toot")
	-- FASTER CLOSE: shorter fades (they were 0.25s each way), HideBattleBack skips its blur / blocking fade-out because the screen is black
	-- (see Transition.HideBattleBack), and the music revert no longer holds up the reveal (below).
	transition.ToggleBlack(1, 0.12)
	deckBuilder3.Visible = false
	transition.HideBattleBack(true)

	if s2 == "Simulator" then
		networkClient.ReturnToSimulationMenu()

		return
	end

	transition.ToggleBlack(-1, 0.15)
	handy.Show()
	-- FASTER CLOSE: audioService.Revert fades the deck builder song out with a BLOCKING tween (like ChangeSong when opening), and handy.Expand
	-- (the HUD buttons sliding in) waited for it after the reveal. Handy.Show already resets ModalEnabled itself.
	task.spawn(audioService.Revert)
	handy.Expand()
end

deckBuilder3.Storage.TopBar.Hide.ButtonShow.MouseButton1Click:Connect(function()
	showall = not showall
	deckBuilder3.Storage.TopBar.Hide.ButtonShow.Text = if showall then "✅" else "❎"
	audioService.PlaySound("locksoft")
	t12 = GetAllCards(data.Load())
	LoadStorage()
end)
deckBuilder3.Storage.TopBar.Base.ButtonShow.Text = if u179 then "✅" else "❎"
deckBuilder3.Storage.TopBar.Base.ButtonShow.MouseButton1Click:Connect(function()
	u179 = not u179
	deckBuilder3.Storage.TopBar.Base.ButtonShow.Text = if u179 then "✅" else "❎"
	audioService.PlaySound("locksoft")
	ApplyFilter()
end)
replicatedStorage = function(p100)
	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	if not handy.Visible() and p100 ~= "Simulator" then
		return
	end

	if handy.GlobalDebounce == true then
		return
	end

	handy.GlobalDebounce = true
	audioService.PlaySound("Toot")

	-- FASTER OPEN: the quest stats (GetQuestInfo) were fetched first and waited for before anything else happened. They are only needed for the
	-- first-time tutorial check after the deck builder is up, so they load in parallel with it now.
	local statsDone = false

	task.spawn(function()
		local okStats, errStats = pcall(networkClient.UpdateStatsData)

		if not okStats then
			warn("[DeckBuilder] UpdateStatsData failed:", errStats)
		end

		statsDone = true
	end)

	deckBuilder3Trade.Visible = false
	deckBuilder3.TradeReminder.Visible = false
	deckBuilder3.Deck.Visible = true
	deckBuilder3.DeckSelection.Visible = true
	deckBuilder3.Storage.TopBar.Visible = true
	u141 = AddCardToDeck
	u142 = RemoveCardFromDeck
	u143 = nil
	ShowInventory(p100)

	while not statsDone do
		task.wait()
	end

	local v612 = data.GetQuestStats()

	if config.TUTOR_LADY_ENABLED and v612 and v612.FirstTimeViewedDeckBuilder == 0 then
		StartDeckBuilderTutorial()
	end

	networkFireServer("EnterInventory")
	handy.GlobalDebounce = false
end
networkClient.OpenDeckbuilder = replicatedStorage

local function SaveDeck()
	networkFireServer("SaveDeck", t13, u139)
end

SaveDeck = function()
	for k, v in pairs(t13) do
		coroutine.resume(coroutine.create(function()
			for _ = 1, v * 2 do
				RemoveCardFromDeck(k)
			end
		end))
		task.wait()
	end
end

local u202: boolean = false
local u203 = nil

local connection = game.Players.PlayerRemoving:Connect(function(player)
	if u203 and player.userId == u203.userId then
		networkFireServer("CancelTrade", u203, u20)
	end
end)

local function ShowTradeContext(p102, p103)
	local u618 = nil
	local tradeContext = u28.Contexts.TradeContext

	tradeContext.Size = UDim2.fromOffset(p103.AbsoluteSize.X, p103.AbsoluteSize.X / 5)
	tradeContext.Position = UDim2.fromOffset(p103.AbsolutePosition.X, p103.AbsolutePosition.Y + p103.AbsoluteSize.Y)
	tradeContext.Visible = true
	tradeContext.Amount:CaptureFocus()
	u618 = tradeContext.Amount.FocusLost:connect(function(p104)
		local v785 = p104 and tonumber(tradeContext.Amount.Text)

		if v785 then
			local v786 = math.min((t12[p102] or 0) - (t13[p102] or 0) - (u163.Deck[p102] or 0), v785)

			networkFireServer("UpdateTrade", u20, p102, v786)
		end

		tradeContext.Visible = false
		tradeContext.Amount.Text = ""
		u618:Disconnect()
	end)
end
local function ShowTrade(otherPlayer)
	deckBuilder3Trade.Their.Title.Text = otherPlayer.Name
	deckBuilder3.DeckSharing.Visible = false
	deckBuilder3.DeleteConfirm.Visible = false
	deckBuilder3.Blocker.Visible = false

	if u32 then
		deckBuilder3.TradeReminder.Text = "Long tap a card to add a select amount."
	else
		deckBuilder3.TradeReminder.Text = "Right click a card to add a select amount."
	end

	deckBuilder3.TradeReminder.Visible = true
	deckBuilder3.Storage.TopBar.Visible = false

	if typeof(otherPlayer) == "table" then
		deckBuilder3Trade.Their.Clip.ScrollingFrame.Scaler._BloxBux.Visible = true
	else
		deckBuilder3Trade.Their.Clip.ScrollingFrame.Scaler._BloxBux.Visible = false
	end

	u163.OtherPlayer = otherPlayer
	u162.OtherPlayer = LocalPlayer
	u141 = function(...)
		if u21 then
			return
		end

		spawn(function()
			u21 = true
			task.wait(0.25)
			u21 = false
		end)

		local v787, v788 = ...

		networkFireServer("UpdateTrade", u20, v787, 1)
	end
	u142 = function(...)
		if u21 then
			return
		end

		spawn(function()
			u21 = true
			task.wait(0.25)
			u21 = false
		end)

		local v789, v790 = ...

		networkFireServer("UpdateTrade", u20, v789, -1)
	end
	u143 = ShowTradeContext
	ShowInventory()
	deckBuilder3Trade.Visible = true
	deckBuilder3.Deck.Visible = false
	deckBuilder3.DeckSelection.Visible = false
end
function networkClient.WarnTrade(_)
	tradeConfirm.Visible = true
	tradeConfirm.Confirm.MouseButton1Down:connect(function()
		tradeConfirm.Visible = false
		networkFireServer("UpdateReadyTrade", u20, true, false, true)
	end)
	tradeConfirm.Deny.MouseButton1Down:connect(function()
		tradeConfirm.Visible = false
	end)
end
local function HideTrade()
	u162:Clear()
	u163:Clear()
	HideInventory()
	u20 = nil
	connection:Disconnect()
	connection = nil
end
function networkClient.StartTrade(p107, p108)
	u20 = p108
	u203 = p107
	ShowTrade(p107)
end
function networkClient.CancelTrade(_)
	networkClientAlert("Trade was cancelled...")
	u162:Clear()
	u163:Clear()
	HideInventory()
	u20 = nil
	connection:Disconnect()
	connection = nil
end
function networkClient.ErrorTrade(_)
	networkClientAlert("You can't do this if you unlocked the game.")
end
function networkClient.TradeFinalize(_)
	networkClientAlert("Finalizing trade, do not leave the game!")
end
function networkClient.UntradeableCard(_)
	networkClientAlert("This card cannot be traded.")
end
function networkClient.EndTrade()
	networkClientAlert("Trade completed!")
	u162:Clear()
	u163:Clear()
	HideInventory()
	u20 = nil
	connection:Disconnect()
	connection = nil
end
function networkClient.GetOffer()
	local deck = u163.Deck
	local bloxBux = u163.BloxBux
	local ready = u163.Ready

	u163:SetReady(false)

	return { Deck = deck, BloxBux = bloxBux, Ready = ready }
end

deckBuilder3Trade.Exit.MouseButton1Click:connect(function()
	networkFireServer("CancelTrade", u203, u20)
	connection:Disconnect()
	connection = nil
end)
deckBuilder3Trade.Trigger.MouseButton1Click:connect(function()
	if not u163.Ready then
		return
	end

	if not u162.Ready then
		return
	end

	networkFireServer("CompleteTrade", u203, u20)
end)
deckBuilder3.Deck.Exit.MouseButton1Click:connect(function()
	if u17 then
		return
	end

	if not CanSaveDeck() then
		return
	end

	networkFireServer("SaveDeck", t13, u139)
	deckBuilder3.DeleteConfirm.Visible = false
	deckBuilder3.DeckSharing.Visible = false
	deckBuilder3.Blocker.Visible = false
	HideInventory()
	networkFireServer("LeaveInventory")
end)
deckBuilder3.DeleteConfirm.Confirm.MouseButton1Click:connect(function()
	if u202 then
		return
	end

	u202 = true

	local text: string = tostring(u139)
	local v632 = networkInvokeServer("DeleteDeck", text)

	if v632 then
		local deckHolder = deckBuilder3.DeckSelection.Clip.DeckHolder
		local text3: string = tostring(u139)

		deckHolder[text3]:Destroy()

		local numberValue: number? = tonumber(v632)

		OnSlotPick(0, numberValue, nil, true)
	end

	u202 = false
end)
deckBuilder3.Deck.Exit.MouseEnter:connect(function()
	contextualize(deckBuilder3.Deck.Exit, "Exit & Save this deck, use this deck as your current deck.", nil)
end)
deckBuilder3.Storage.TopBar.Clear.MouseEnter:connect(function()
	contextualizeInverse(deckBuilder3.Storage.TopBar.Clear, "Deletes the entire deck slot. Moves cards to your inventory.", nil)
end)
deckBuilder3.Storage.TopBar.Share.MouseEnter:connect(function()
	contextualizeInverse(deckBuilder3.Storage.TopBar.Share, "Let's you export or import various decks.", nil)
end)
handyHandy.Deck.MouseButton1Down:connect(replicatedStorage)
handyHandy.Deck.MouseEnter:connect(function()
	contextualize(handyHandy.Deck, "Edit your current deck, or check card inventory!", nil)
end)

local function ToggleColorSort(p113)
	local v637 = deckBuilder3Search.ColorHolder[p113]

	t21[p113] = not t21[p113]
	v637.ImageTransparency = if t21[p113] then 0 else 0.75
	ApplyFilter()
end

replicatedStorage = deckBuilder3Search.ColorHolder:GetChildren()

for _, v in pairs(replicatedStorage) do
	if v.Active then
		v.MouseButton1Click:connect(function()
			audioService.PlaySound("locksoft")

			local vName = v.Name
			local v639 = deckBuilder3Search.ColorHolder[vName]

			t21[vName] = not t21[vName]
			v639.ImageTransparency = if t21[vName] then 0 else 0.75
			ApplyFilter()
		end)
	end
end

print("SearchTerm")

local deckBuilder3SearchSearchBar = deckBuilder3Search.SearchBar
local deckBuilder3SearchSearchBarBox = deckBuilder3SearchSearchBar.Box
local deckBuilder3SearchSearchBarBoxText = deckBuilder3SearchSearchBarBox.Text
local deckBuilder3SearchSearchBarImageColor3 = deckBuilder3SearchSearchBar.ImageColor3
local configClrNeutral = configClr.Neutral
local u216: boolean = false

local function WaitToHide()
	if u216 then
		return
	end

	u216 = true

	local n1: number = 5

	if u32 == true then
		n1 = 7
	end

	local deckBuilder3SearchAbsolutePosition = deckBuilder3Search.AbsolutePosition
	local vector2 = Vector2.new(0, deckBuilder3Search.AbsoluteSize.Y * n1)
	local deckBuilder3SearchAbsoluteSize = deckBuilder3Search.AbsoluteSize
	local vector22 = Vector2.new(deckBuilder3Search.Panel.AbsoluteSize.X - deckBuilder3Search.AbsoluteSize.X, deckBuilder3Search.AbsoluteSize.Y * n1)
	local v645 = fakeMouseMouseAwayFrom({
		AbsolutePosition = deckBuilder3SearchAbsolutePosition - vector2,
		AbsoluteSize = deckBuilder3SearchAbsoluteSize + vector22
	}, 10)

	repeat
		task.wait()
	until not (not v645() and v180.Out())

	if v180.Out() then
		nonGameCard.SetInspectDisabled(false)
		v180.Hide()
	end

	u216 = false
end

v180.SetBox(deckBuilder3SearchSearchBarBox)
deckBuilder3SearchSearchBarBox.Focused:connect(function()
	if deckBuilder3SearchSearchBarBox.Text == deckBuilder3SearchSearchBarBoxText then
		deckBuilder3SearchSearchBarBox.Text = ""
	end

	deckBuilder3SearchSearchBar.ImageColor3 = configClrNeutral
	v180.Show()
	nonGameCard.SetInspectDisabled(true)
	WaitToHide()
end)
deckBuilder3Search.FilterButton.MouseButton1Click:Connect(function()
	audioService.PlaySound("click2")

	if deckBuilder3SearchSearchBarBox.Text == deckBuilder3SearchSearchBarBoxText then
		deckBuilder3SearchSearchBarBox.Text = ""
	end

	v180.Show()
	nonGameCard.SetInspectDisabled(true)
end)
replicatedStorage = function(_)
	task.wait()
	deckBuilder3SearchSearchBar.ImageColor3 = deckBuilder3SearchSearchBarImageColor3

	local v647: string = s3

	s3 = deckBuilder3SearchSearchBarBox.Text

	if s3 ~= v647 then
		ApplyFilter()
	end

	u181 = time() + 0.25
end
deckBuilder3SearchSearchBarBox.MouseEnter:connect(function()
	if deckBuilder3SearchSearchBarBox.Text == "Search" then
		deckBuilder3SearchSearchBarBox.Text = ""
	end

	v180.Show()
	nonGameCard.SetInspectDisabled(true)
	WaitToHide()
end)
deckBuilder3Search.Panel.Close.MouseButton1Click:connect(function()
	audioService.PlaySound("click3")
	nonGameCard.SetInspectDisabled(false)
end)
deckBuilder3SearchSearchBarBox.FocusLost:connect(replicatedStorage)
v180.SetUpdate(replicatedStorage)
deckBuilder3SearchSearchBar.Cross.MouseButton1Click:connect(function()
	audioService.PlaySound("ClickSound")

	if s3 == "" then
		v180.Hide()
		nonGameCard.SetInspectDisabled(false)
	end

	s3 = ""
	deckBuilder3SearchSearchBarBox.Text = ""
	ApplyFilter()
end)
print("Deckzoom")

local deckBuilder3Zoom = deckBuilder3.Zoom
local deckBuilder3ZoomBar = deckBuilder3Zoom.Bar
local deckBuilder3ZoomBarFill = deckBuilder3ZoomBar.Fill
local deckBuilder3ZoomStick = deckBuilder3Zoom.Stick
local u222: boolean = false

local function MouseOutOfRange()
	return math.abs(mouse.Y + deckBuilder3Zoom.AbsoluteSize.Y * 0.5 - deckBuilder3Zoom.AbsolutePosition.Y) > deckBuilder3Zoom.AbsoluteSize.Y * 1.5
end

replicatedStorage = function()
	u222 = false
end
fakeMouse.RegisterMouseUp(replicatedStorage)
deckBuilder3ZoomStick.MouseButton1Up:Connect(replicatedStorage)

local u224 = nil

local function ApplyZoom(p115)
	local n1 = (p115 - minzoom) / (maxzoom - minzoom)

	if u224 and math.abs(n1 - u224) < 0.005 then
		return
	end

	u224 = n1
	deckBuilder3ZoomStick.Position = UDim2.new(n1 * 0.9 + 0.05 - deckBuilder3Zoom.AbsoluteSize.Y / deckBuilder3Zoom.AbsoluteSize.X * deckBuilder3ZoomStick.Size.X.Scale / 2, 0, 0.6 - deckBuilder3ZoomStick.Size.Y.Scale / 2, 0)
	deckBuilder3ZoomBarFill.Size = UDim2.new(n1, 0, 1, 0)
	u144(nil, nil, true)
end

deckBuilder3ZoomStick.MouseButton1Down:Connect(function()
	u222 = true

	repeat
		n2 = utilsClamp(0, 1, (fakeMouse.fakemouse.X - deckBuilder3ZoomBar.AbsolutePosition.X) / deckBuilder3ZoomBar.AbsoluteSize.X) * (maxzoom - minzoom) + minzoom
		ApplyZoom(n2)
		mouse.Move:wait()
	until math.abs(mouse.Y + deckBuilder3Zoom.AbsoluteSize.Y * 0.5 - deckBuilder3Zoom.AbsolutePosition.Y) > deckBuilder3Zoom.AbsoluteSize.Y * 1.5 or not scaler.Visible or not u222
end)
ApplyZoom(n2)
print("World Things/Vendors")
task.spawn(function()
	repeat
		task.wait(0.2)
	until robuxService.Products.Ready == true

	local infos = robuxService.Products.BloxBux.Infos

	tick()

	local t41: {[any]: any} = {}
	local vendorGuis = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VendorGuis")
	local t42: {[any]: any} = { x = 0.05, y = 0.05 }
	local vendorGuisSelected = vendorGuis.Selected
	local n1 = 0

	vendorGuisSelected.AncestryChanged:Connect(function()
		n1 = 0
	end)

	local function SetupFrame(parent)
		local parentName = parent.Name
		local ParentName = parent.Parent.Parent.Name
		local v794 = vendorGuis[ParentName .. "Base"].ButtonHolder[parent.Name].Position
		local v795 = vendorGuis[ParentName .. "Base"].ButtonHolder[parent.Name].Size
		local textHolder = parent:FindFirstChild("TextHolder")

		if not textHolder then
			textHolder = vendorGuis.TextHolder:Clone()
		end

		if not parent:FindFirstChild("TextHolder") then
			textHolder.Text = infos[parent.Name].VendorString
			textHolder.Parent = parent
		end

		parent.MouseLeave:Connect(function()
			parent:TweenSizeAndPosition(v795, v794, "Out", "Quad", 0.5, true)
			vendorGuisSelected.BackgroundColor3 = Color3.new(1, 1, 1)
			textHolder.TextColor3 = Color3.new(1, 1, 1)
			task.wait()

			if vendorGuisSelected.Parent == parent then
				vendorGuisSelected.Parent = vendorGuis
				parent.ZIndex = 1
			end
		end)
		parent.MouseEnter:Connect(function()
			n1 = 0
			parent.ZIndex = 3
			vendorGuisSelected.Parent = parent

			local uDim2 = UDim2.new(v795.X.Scale + 0.05, 0, v795.Y.Scale + 0.05, 0)
			local uDim22 = UDim2.new(v794.X.Scale - 0.025, 0, v794.Y.Scale - 0.025, 0)

			parent:TweenSizeAndPosition(uDim2, uDim22, "Out", "Quad", 0.5, true)
		end)
		parent.MouseButton1Click:Connect(function()
			if not networkInvokeServer("CanUseArtBox") then
				networkClient.WarningMsg("Due to regional restrictions, you cannot purchase this, sorry!")

				return
			end

			vendorGuisSelected.BackgroundColor3 = parent.BorderColor3
			textHolder.TextColor3 = parent.BorderColor3
			game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, parentName)
		end)
	end

	print("Auction")

	local u657: boolean = false
	local auctionNotification = u28.AuctionNotification
	local CurrentCardValue = game.ReplicatedStorage.Auction.CurrentCard.Value
	local u660: boolean = false
	local auction = game.ReplicatedStorage.Auction
	local t43: {[any]: any} = {}
	local endOfAuctionNotification = u28.EndOfAuctionNotification

	local function NotifyLostLastBid()
		auctionNotification.Flavor.Text = "You have been outbid by " .. auction.CurrentBidder.Value .. " for " .. auction.CurrentBid.Value .. "ʙʙ" .. "!"
		v25("Lost that bid")
		auctionNotification.Bid.Title.Text = "Bid " .. auction.CurrentBid.Value + auction.CurrentBidIncrease.Value
		u660 = false
		auctionNotification:TweenPosition(UDim2.new(0.7, 0, 0.3, 0), "Out", "Quad", 1, true)
	end
	local function PlaceBid()
		if not u660 then
			endOfAuctionNotification:TweenPosition(UDim2.new(1, 2, 0.3, 0), "In", "Linear", 1, true)

			if networkInvokeServer("PlaceBid") then
				u660 = true
				u657 = true
			end
		end
	end
	local function SetupAuctionBoard(p117)
		nonGameCard.BindInspect(p117.Card, function()
			return CurrentCardValue
		end)

		local bidButton = p117.BidButton

		bidButton.MouseButton1Click:Connect(PlaceBid)
		bidButton.MouseLeave:Connect(function()
			task.wait()

			if vendorGuisSelected.Parent == bidButton then
				vendorGuisSelected.Parent = vendorGuis
			end
		end)
		bidButton.MouseEnter:Connect(function()
			vendorGuisSelected.Parent = bidButton
		end)
		foilEffect(p117.Card)
		table.insert(t43, p117)
	end

	endOfAuctionNotification.Okay.MouseButton1Click:Connect(function()
		endOfAuctionNotification:TweenPosition(UDim2.new(1, 2, 0.3, 0), "In", "Linear", 1, true)
	end)
	auctionNotification.Bid.MouseButton1Click:Connect(function()
		u660 = true
		networkFireServer("PlaceBid", true)
		auctionNotification:TweenPosition(UDim2.new(1, 2, 0.3, 0), "In", "Linear", 1, true)
	end)
	auctionNotification.Cancel.MouseButton1Click:Connect(function()
		auctionNotification:TweenPosition(UDim2.new(1, 2, 0.3, 0), "In", "Linear", 1, true)
	end)
	game.ReplicatedStorage.Auction.CurrentCard.Changed:Connect(function()
		CurrentCardValue = game.ReplicatedStorage.Auction.CurrentCard.Value
	end)

	local function UpdateAuctionStuff()
		local CurrentBidderValue = auction.CurrentBidder.Value

		if u660 and CurrentBidderValue ~= LocalPlayer.Name and u657 and CurrentBidderValue ~= "" then
			u660 = false
			NotifyLostLastBid()
		end

		CurrentBidderValue = auction.TimeLeft.Value

		local floored = math.floor(CurrentBidderValue / 60)
		local formattedText = string.format("%02d", CurrentBidderValue % 60)
		local s1: string = floored .. ":" .. formattedText

		for _, v in pairs(t43) do
			v.AuctionClosed.Visible = not auction.CanAuctionsHappen.Value
			v.NoobShield.Visible = data.Level() < 7

			if auction.CurrentCard.Value == "" then
				v.Card.Image = ""
				v.Card.BackgroundTransparency = 0
			else
				v.Card.BackgroundTransparency = 1
				v.Card.Image = "rbxassetid://" .. cardLibrary[auction.CurrentCard.Value].Id
				v.Card.CardFoilGradient.Enabled = cardLibrary[auction.CurrentCard.Value].Foil
			end

			local v805 = (data.Storage()[auction.CurrentCard.Value] or {})["0"] or "not"

			v.Owned.Text = v805 .. " owned"
			auctionNotification.TimeLeft.Text = "Time Left: " .. s1
			v.TimeLeft.Text = s1
			v.CurrentBidder.Text = auction.CurrentBidder.Value
			v.BidButton.BidLabel.Text = "Bid for " .. auction.CurrentBid.Value + auction.CurrentBidIncrease.Value .. "ʙʙ" .. "!"
		end
	end

	data.UpdateCallbacks.UpdateAuctionStuff = UpdateAuctionStuff
	auction.CanAuctionsHappen.HowMany.Changed:Connect(function()
		if networkInvokeServer("GetServerType") == "VIPServer" then
			for _, v in pairs(t43) do
				v.AuctionClosed.Text = "Auctions are disabled on private servers."
			end

			return
		end

		for _, v in pairs(t43) do
			v.AuctionClosed.Text = "There need to be at least 6 players who can bid for the auction to start. \nRight now there's " .. auction.CanAuctionsHappen.HowMany.Value .. "/6."
		end
	end)
	auction.CurrentCard.Changed:Connect(function()
		auctionNotification:TweenPosition(UDim2.new(1, 2, 0.3, 0), "In", "Linear", 1, true)

		local v810 = cardLibrary[auction.OldCard.Value].Name

		if u657 then
			if auction.CurrentBidder.Value == LocalPlayer.Name then
				endOfAuctionNotification.Flavor.Text = "You bought " .. v810 .. " for only " .. auction.CurrentBid.Value .. "ʙʙ" .. "! Congrats!"
				data.Load()
				dataUpdateCashMoney()
			else
				endOfAuctionNotification.Flavor.Text = auction.CurrentBidder.Value .. " bought " .. v810 .. " for " .. auction.CurrentBid.Value .. "ʙʙ" .. "."
			end

			endOfAuctionNotification:TweenPosition(UDim2.new(0.7, 0, 0.3, 0), "Out", "Quad", 1, true)
		end

		u660 = false
		u657 = false
		UpdateAuctionStuff()
	end)
	auction.CurrentBidder.Changed:Connect(UpdateAuctionStuff)
	auction.TimeLeft.Changed:Connect(UpdateAuctionStuff)

	local function SetupVendor(p118)
		p118:WaitForChild("VendorBoard")

		local clone5

		if p118.Name == "AuctionVendor" then
			clone5 = vendorGuis.AuctionGuiBase:Clone()
			clone5.Name = "AuctionGui"
			SetupAuctionBoard(clone5)
		else
			clone5 = (p118.Name == "EventOreo" and vendorGuis.DemocracyGuiBase or vendorGuis.VendorGuiBase):Clone()
			clone5.Name = if p118.Name == "EventOreo" then "DemocracyGui" else "VendorGui"

			for _, v in pairs(clone5.ButtonHolder:GetChildren()) do
				SetupFrame(v)
			end
		end

		clone5.Parent = p118.VendorBoard

		local vendorBoard = p118.VendorBoard

		clone5.Adornee = vendorBoard
		table.insert(t41, vendorBoard)
	end

	for _, v in pairs(workspace.Vendors:GetChildren()) do
		SetupVendor(v)
	end

	UpdateAuctionStuff()

	local t44: {[any]: any} = {}
	local cFrameNew = CFrame.new

	local function UpdateBoard(p119, p120)
		p119.CFrame = cFrameNew(p119.Position, p119.Position - (p119.Position - p120) * Vector3.new(1, 0, 1))
	end
	local function UpdateBoards(p121)
		for _, v in pairs(t41) do
			v.CFrame = cFrameNew(v.Position, v.Position - (v.Position - p121) * Vector3.new(1, 0, 1))
		end
	end

	workspace.CurrentCamera.Changed:Connect(function()
		local p = workspace.CurrentCamera.CFrame.p

		for _, v in pairs(t41) do
			v.CFrame = cFrameNew(v.Position, v.Position - (v.Position - p) * Vector3.new(1, 0, 1))
		end
	end)

	local mathCos = math.cos

	function enginesEngines.AuctionSelectedUpdate(p122)
		if vendorGuisSelected.Parent ~= vendorGuis then
			local v825 = mathCos(n1 * 3.141592653589793)
			local v826 = mathCos(n1 * 3.141592653589793)
			local t49: {[any]: any} = { x = v825 * 0.05 + 0.075, y = v826 * 0.05 + 0.075 }

			vendorGuisSelected.Size = UDim2.new(1 + t49.x, 0, 1 + t49.y, 0)
			vendorGuisSelected.Position = UDim2.new(-t49.x * 0.5, 0, -t49.y * 0.5, 0)
			n1 += p122
		end
	end

	local basePassBoardElement = playerGui.VendorGuis.BasePassBoardElement

	local t45: {[any]: any} = {
		PassBoard = function(parent)
			parent.Transparency = 1

			local v829 = parent:FindFirstChild("Type") and parent.Type.Value or "DLC"
			local v830, v831 = unpack(robuxService.Products.Passes.TypeBounds[v829])
			local surfaceGui: SurfaceGui = Instance.new("SurfaceGui")

			surfaceGui.CanvasSize = Vector2.new(800, 400)
			surfaceGui.Face = "Left"
			surfaceGui.Name = v829 .. "PassGui"
			surfaceGui.Parent = parent

			for i = v830, v831 do
				local v834 = robuxService.Products.Passes.Ids[i]
				local v835 = robuxService.Products.Passes.Infos[v834]
				local clone6 = basePassBoardElement:Clone()

				clone6.Thumbnail.Image = "https://www.roblox.com/Thumbs/Asset.ashx?Width=420&Height=420&AssetID=" .. v835.AssetId
				clone6.Title.Text = v835.Name
				clone6.Purchase.Title.Text = utils.FormatNumber(v835.PriceInRobux) .. "R$"

				local floored = math.floor(i / 2)

				clone6.Position = UDim2.new(i % 2 * 0.5, 0, floored * 0.5, 0)
				clone6.Parent = surfaceGui
				clone6.Purchase.MouseButton1Click:Connect(function()
					if not handy.Visible() then
						return
					end

					game:GetService("MarketplaceService"):PromptPurchase(LocalPlayer, v834)
				end)
			end
		end
	}

	for _, v in pairs(workspace.Scripted:GetChildren()) do
		if t45[v.Name] then
			t45[v.Name](v)
		end
	end
end)

function textChatService.OnChatWindowAdded(p124)
	local t46: {[any]: any} = {
		ICT = "#00cccc",
		Founders = "#ffb200",
		Moderators = "#8000ff",
		Overlord = "#bf0000",
		Builders = "#40bf26",
		Premium = "#e5e559"
	}
	local players: Players = game:GetService("Players")
	local textSource = p124.TextSource
	local u684: boolean = false
	local v685 = textSource and players:GetPlayerByUserId(textSource.UserId)

	if v685 then
		local v686 = textChatService.ChatWindowConfiguration:DeriveNewMessageProperties()

		v686.PrefixText = p124.PrefixText
		v686.Text = p124.Text

		local function color3torgb(p125)
			return p125.R * 255, p125.G * 255, p125.B * 255
		end

		for k, v in pairs(t46) do
			if v685:GetAttribute(k) == true then
				u684 = true

				local v690 = getChatNameColor:GetNameColor(v685.Name)

				if k == "Moderators" then
					k = "Mod"
				end

				local n1 = v690.G * 255
				local n2 = v690.B * 255
				local stringFormat = string.format
				local rounded = math.round(v690.R * 255)
				local text: string = tostring(rounded)
				local rounded2 = math.round(n1)
				local text4: string = tostring(rounded2)
				local rounded3 = math.round(n2)
				local text5: string = tostring(rounded3)

				v686.PrefixText = stringFormat("<font color='" .. v .. "'>[" .. k .. "]</font> <font color='rgb(" .. text .. "," .. text4 .. "," .. text5 .. ")'>%s</font>", v686.PrefixText)
			end
		end

		if u684 == false then
			local v700 = getChatNameColor:GetNameColor(v685.Name)
			local n3 = v700.G * 255
			local n4 = v700.B * 255
			local v703 = string.format
			local rounded = math.round(v700.R * 255)
			local text: string = tostring(rounded)
			local rounded4 = math.round(n3)
			local text6: string = tostring(rounded4)
			local rounded5 = math.round(n4)
			local text7: string = tostring(rounded5)

			v686.PrefixText = v703("<font color='rgb(" .. text .. "," .. text6 .. "," .. text7 .. ")'>%s</font>", v686.PrefixText)
		end

		if v685:GetAttribute("Muted") == true then
			v686.PrefixText = ""
			v686.Text = "<font color='#ff0000'>You have been muted. Your message will not be seen by other players.</font>"
		end

		return v686
	end

	return nil
end

local teaserBoard: Instance = workspace:WaitForChild("TeaserBoard")

teaserBoard.SurfaceGui.Frame.MainSelection.Frame.ChildAdded:Connect(function(p126)
	if p126:IsA("GuiObject") then
		local nonGameCardBindInspect = nonGameCard.BindInspect
		local card = p126:WaitForChild("Card")

		nonGameCardBindInspect(card, cardLibrary[p126.Name])
	end
end)
task.spawn(function()
	for _, v in pairs(teaserBoard.SurfaceGui.Frame.MainSelection.Frame:GetChildren()) do
		if v:IsA("GuiObject") then
			nonGameCard.BindInspect(v.Card, cardLibrary[v.Name])
		end
	end
end)
task.spawn(function()
	local ugcItems: Instance = workspace:WaitForChild("UGCItems")

	for _, v in pairs(ugcItems:GetChildren()) do
		local screen = v:FindFirstChild("Board"):FindFirstChild("Screen")

		if promoRewards[v.Name] and promoRewards[v.Name].Bundle then
			screen.BuyButton.Text = "Buy"
			screen.BuyButton.MouseButton1Click:Connect(function()
				local marketplaceService: MarketplaceService = game:GetService("MarketplaceService")
				local numberValue: number? = tonumber(v.Name)

				marketplaceService:PromptBundlePurchase(LocalPlayer, numberValue)
			end)
			screen.BonusButton.MouseButton1Click:Connect(function()
				if promoRewards[v.Name] then
					networkClient.QuickShowRewards(promoRewards[v.Name].Rewards)
				end
			end)
		elseif tonumber(v.Name) and game:GetService("MarketplaceService"):GetProductInfo((tonumber(v.Name))) then
			local marketplaceService: MarketplaceService = game:GetService("MarketplaceService")
			local numberValue: number? = tonumber(v.Name)
			local productInfo = marketplaceService:GetProductInfo(numberValue)

			if productInfo.IsForSale == false then
				screen.BuyButton.Text = "Not Available Yet :("
			else
				screen.BuyButton.Text = "Buy (" .. productInfo.PriceInRobux .. " R$)"
				screen.BuyButton.MouseButton1Click:Connect(function()
					local marketplaceService2: MarketplaceService = game:GetService("MarketplaceService")
					local numberValue2: number? = tonumber(v.Name)

					marketplaceService2:PromptPurchase(LocalPlayer, numberValue2)
				end)
			end

			screen.BonusButton.MouseButton1Click:Connect(function()
				if promoRewards[v.Name] then
					networkClient.QuickShowRewards(promoRewards[v.Name].Rewards)
				end
			end)
		else
			warn("No UGC item found with ID of " .. v.Name)
			screen.BuyButton.Text = "Not Available Yet :("
		end
	end
end)
replicatedStorage = workspace:WaitForChild("RotationalShops"):GetChildren()

local u227: boolean = false

for _, v in pairs(replicatedStorage) do
	for _, iterValue in pairs(v.SurfaceGui.Frame.NewestOffer.Offer.Cards:GetChildren()) do
		iterValue:IsA("GuiObject")
	end

	for i = 1, 8 do
		foilEffect(v.SurfaceGui.Frame.MainSelection.Frame[i].Card)

		local libraryIndex = v.SurfaceGui.Frame.MainSelection.Frame[i]:WaitForChild("LibraryIndex")

		local function SetFoil(p127)
			local v723 = cardLibrary[p127]

			if v723 and v723.Foil then
				v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = true

				return
			end

			v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = false
		end

		libraryIndex.Changed:Connect(function(p128)
			local v725 = cardLibrary[p128]

			if v725 and v725.Foil then
				v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = true

				return
			end

			v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = false
		end)

		local v235 = cardLibrary[libraryIndex.Value]

		if v235 and v235.Foil then
			v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = true
		else
			v.SurfaceGui.Frame.MainSelection.Frame[i].Card.CardFoilGradient.Enabled = false
		end

		nonGameCard.BindInspect(v.SurfaceGui.Frame.MainSelection.Frame[i].Card, function()
			return libraryIndex.Value
		end)
		v.SurfaceGui.Frame.MainSelection.Frame[i].Buy.MouseButton1Click:Connect(function()
			if u227 then
				return
			end

			audioService.PlaySound("Target Or Select Low")
			u227 = true
			networkFireServer("PurchaseFromRotationShop", i)
			task.wait(2)
			u227 = false
		end)
	end

	v.SurfaceGui.Frame.NewestOffer.Offer.Buy.MouseButton1Click:Connect(function()
		if u227 then
			return
		end

		audioService.PlaySound("Target Or Select Low")
		u227 = true
		networkFireServer("PurchaseOfferFromRotationShop")
		task.wait(2)
		u227 = false
	end)
	v.SurfaceGui.Frame.NewestOffer.Offer.BuyFoil.MouseButton1Click:Connect(function()
		networkFireServer("OfferPrepare", "Offer", "NewestRotationalShopItems")
	end)
	v.SurfaceGui.Frame.NewestOffer.Offer.ViewAll.MouseButton1Click:Connect(function()
		local v726 = network.InvokeServer("GetOfferContents", "Offer", "NewestRotationalShopItemsNoFoil")

		networkClient.QuickShowRewards(v726)
	end)
	v.SurfaceGui.Frame.Exchange.MouseButton1Click:Connect(function()
		audioService.PlaySound("lock")
		bargainExchange.UpdateContentDisplay(true)
	end)
end

function networkClient.ReturnToMenuFromQueue()
	local CurrentCamera: Camera = workspace.CurrentCamera

	transition.ToggleBlack(1, 0.3)
	CurrentCamera.CameraType = "Custom"
	CurrentCamera.CameraSubject = (LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()):WaitForChild("Humanoid")
	handy.Show()
	v29:Enable()
	transition.ToggleBlack(-1, 0.3)
	networkClient.Alert("Your opponent left.")
end

-- FASTER LOAD / NO BLANK CARD ART: nothing ever downloaded card art ahead of time, so the first time a card showed up (the deck, the first storage
-- page, the shop...) its image was still being fetched and the card appeared blank for a moment. This warms the cache in the background instead,
-- in the order the player will actually look at things: 1) the cards in the current deck, 2) the first pages of the storage list (same sort
-- order the deck builder uses), 3) the rest of what they own up to a cap. It is deliberately gentle so it never competes with anything urgent:
-- small batches, it pauses while the download queue is busy, and the cap is lower on touch devices (phones / tablets) to save memory and data.
task.spawn(function()
	local ids: {[any]: any} = {}
	local seen: {[any]: any} = {}
	local storage = data.Storage() or {}
	local deckSlot = tostring(u139)
	local limit = if userInputService.TouchEnabled then 120 else 400

	local function add(cardName)
		if #ids >= limit then
			return
		end

		local ok, card = pcall(function()
			return cardLibrary[cardName]
		end)
		local id = ok and card and card.Id

		if id and id ~= 0 and not seen[id] then
			seen[id] = true
			ids[#ids + 1] = "rbxassetid://" .. tostring(id)
		end
	end

	-- 1) current deck
	for cardName, copies in pairs(storage) do
		if type(copies) == "table" and (copies[deckSlot] or 0) > 0 then
			add(cardName)
		end
	end

	-- 2) + 3) everything owned, in storage-list order
	local owned: {[any]: any} = {}

	for cardName, copies in pairs(storage) do
		if type(copies) == "table" and (copies["0"] or 0) > 0 then
			owned[cardName] = copies["0"]
		end
	end

	pcall(function()
		orderedCards(owned, function(cardName)
			add(cardName)
		end, false)
	end)

	local BATCH = 12
	local index = 1

	while index <= #ids do
		-- let urgent downloads (the lobby, whatever the player just opened) go first
		local waited = 0

		while contentProvider.RequestQueueSize > 6 and waited < 5 do
			task.wait(0.1)
			waited += 0.1
		end

		local batch: {[any]: any} = {}

		for i = index, math.min(index + BATCH - 1, #ids) do
			batch[#batch + 1] = ids[i]
		end

		index += BATCH
		pcall(function()
			contentProvider:PreloadAsync(batch)
		end)
		task.wait()
	end
end)

-- FASTER LOAD: ResetQuest's result is ignored; don't hold up "Client Ready" (and the tutorial gate that waits on it) for a round trip
task.spawn(networkInvokeServer, "ResetQuest", "NightTime")
networkClient.UpdateWorld()
clientReady.Value = true
clientready = true
print("Client Ready")
replicatedStorage = tick()
print(replicatedStorage .. " end")