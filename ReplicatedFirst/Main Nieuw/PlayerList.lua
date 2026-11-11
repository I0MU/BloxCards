





local t1: {[any]: any} = {}
local t2: {[any]: any} = {}
local t3: {[any]: any} = {}
local t4 = {}
local LocalPlayer = game.Players.LocalPlayer
local module: {[any]: any} = {
	Visible = false,
	Incoming = t1,
	OutGoing = t2,
	Items = t3,
	Battles = t4
}
local network = require(script.Parent.Network)
local networkClient = network.client
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local audioService = require(game.ReplicatedStorage.AudioService)
local contextualize = require(script.Parent.Contextualize)
local data = require(script.Parent.Data)
local customscalings = require(script.Parent.CustomScalings).customscalings
local nevermore = require(script.Parent.Nevermore)
local nevermorePaperRipple = nevermore.PaperRipple
local nevermoreScrollingFrame = nevermore.ScrollingFrame
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy

require(game.ReplicatedStorage.Utils)

local animation = require(game.ReplicatedStorage.Animation)
local teleportService: TeleportService = game:GetService("TeleportService")
local stepped = game:GetService("RunService").Stepped
local LevelValue = game.ReplicatedStorage.Strings.Level.Value
local t6 = {}
local s1: string = ""
local playerList = LocalPlayer.PlayerGui.VisGui.HandyHolder.PlayerList
local battleWarning = LocalPlayer.PlayerGui.VisGui.BattleWarning
local scrollBit = playerList.ScrollHolder.ScrollBit

nevermoreScrollingFrame.new(playerList.ScrollHolder.ScrollBit)

local config = require(game.ReplicatedStorage.CONFIG)
local v30 = pairs
local u31: boolean = false
local color3 = Color3.fromRGB(161, 165, 162)

Color3.fromRGB(255, 255, 255)

local color32 = Color3.fromRGB(0, 200, 83)
local color33 = Color3.fromRGB(213, 0, 0)
local color34 = Color3.fromRGB(41, 98, 255)
local t7: {[any]: any} = {
	CancelOutGoing = color33,
	DeclineIncoming = color33,
	AcceptIncoming = color32,
	Challenge = color33,
	Spectate = color34,
	Trade = color32
}
local new = handy.handy.ChallengeNeu.New
local u38 = nil

function UpdateIncoming()
	local u49: boolean = not not next(t1)

	if u49 == u38 then
		return
	end

	if u49 then
		new.Visible = true
		new.ImageTransparency = 1
		new.Size = UDim2.new(0, 0, 0, 0)
		new.Title.TextTransparency = 1
		task.spawn(function()
			animation.AnimateAsync(new, { ImageTransparency = 0, Size = UDim2.new(3, 0, 0.4, 0) }, 0.2, "Out", "Quad")
			task.wait(0.15)
			animation.AnimateAsync(new.Title, { TextTransparency = 0 }, 0.2, "Out", "Quad")
		end)
	else
		task.spawn(function()
			animation.AnimateAsync(new.Title, { TextTransparency = 1 }, 0.2, "In", "Quad")
			animation.AnimateAsync(new, { ImageTransparency = 1 }, 0.2, "In", "Quad")
		end)
	end

	u38 = u49
end

local scrollBitScaler = scrollBit.Scaler
local clone = scrollBitScaler.PlayerBase:Clone()

scrollBitScaler.PlayerBase:Destroy()
print("PlayerListItem")

local t8: {[any]: any} = {}

function t8.new(folder)
	if folder == nil then
		return
	end

	assert(not t3[folder.Name], "Player " .. folder.Name .. " already has an item.")

	local player = game.Players:WaitForChild(folder.Name, 5)
	local Players = game.Players
	local v53 = game.Players:GetUserIdFromNameAsync(folder.Name)
	local v54 = Players:GetUserThumbnailAsync(v53, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

	assert(LocalPlayer, "No such player.")

	local clone2 = clone:Clone()

	clone2.Name = folder.Name
	clone2.TopBit.PlayerIcon.Image = v54 or ""
	clone2.Parent = scrollBitScaler

	local object = setmetatable({}, { __index = t8 })

	print(LocalPlayer.DisplayName)
	object.Player = player
	object.DisplayName = player.DisplayName
	object.Folder = folder
	object.Physical = clone2
	object.State = folder.Value
	object.SubPlayer = folder.SubPlayer.Value

	local connections: {[any]: any} = {}

	object.Connections = connections
	object.Length = 1
	object:ChangeState(folder.Value)
	connections.ValueChanged = folder.Changed:connect(function(_)
		object:ChangeState(folder.Value)
	end)

	local bottomBit = object.Physical.BottomBit

	connections.Spectate = bottomBit.Spectate.MouseButton1Click:connect(function()
		if not object.Battle then
			return
		end

		audioService.PlaySound("lock")
		networkFireServer("HookIn", object.Battle.BattleId)
	end)
	connections.Spectate = bottomBit.Spectate.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	connections.Challenge = bottomBit.Challenge.MouseButton1Click:connect(function()
		if networkInvokeServer("GetPlayerLevelFromName", folder.Name) > 10 and data.Level() < 10 then
			t6 = object
			s1 = "Challenge"
			battleWarning.Visible = true

			return
		end

		audioService.PlaySound("PreSlash")
		object:Challenge()
	end)
	connections.Challenge = bottomBit.Challenge.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	connections.Trade = bottomBit.Trade.MouseButton1Click:connect(function()
		audioService.PlaySound("PreMagic")
		object:Trade()
	end)
	connections.Trade = bottomBit.Trade.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	connections.CancelOutGoing = bottomBit.Cancel.MouseButton1Click:connect(function()
		audioService.PlaySound("bass.wav")
		object:CancelOutGoing()
	end)
	connections.CancelOutGoing = bottomBit.Cancel.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	connections.AcceptIncoming = bottomBit.Accept.MouseButton1Click:connect(function()
		if networkInvokeServer("GetPlayerLevelFromName", folder.Name) > 10 and data.Level() < 10 then
			t6 = object
			s1 = "Accept"
			battleWarning.Visible = true

			return
		end

		audioService.PlaySound("Power Up")
		object:AcceptIncoming()
	end)
	connections.AcceptIncoming = bottomBit.Accept.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	connections.DeclineIncoming = bottomBit.Decline.MouseButton1Click:connect(function()
		audioService.PlaySound("Power Down")
		object:DeclineIncoming()
	end)
	connections.DeclineIncoming = bottomBit.Decline.MouseEnter:connect(function()
		audioService.PlaySound("Mouse Hover")
	end)
	object:SetupMiscConnections()
	object:UpdateLevelName()
	t3[folder.Name] = object

	return object
end

battleWarning.Accept.MouseButton1Click:Connect(function()
	if s1 == "Challenge" then
		audioService.PlaySound("PreSlash")
		t6:Challenge()
	elseif s1 == "Accept" then
		audioService.PlaySound("Power Up")
		t6:AcceptIncoming()
	end

	battleWarning.Visible = false
end)
battleWarning.Deny.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	battleWarning.Visible = false
end)

function t8.SetupMiscConnections(p3)
	local connections = p3.Connections
	local bottomBit = p3.Physical.BottomBit

	for iterFirst, iterSecond in v30({
		Challenge = { bottomBit.LeftBack, color33 },
		Trade = { bottomBit.CenterBack, color32 },
		Spectate = { bottomBit.RightBack, color34 },
		Accept = { bottomBit.CenterBack, color32 },
		Decline = { bottomBit.RightBack, color33 },
		Cancel = { bottomBit.RightBack, color33 }
	}) do
		local v64 = bottomBit[iterFirst]
		local v65 = iterSecond[1]
		local v66 = iterSecond[2]

		connections[iterFirst .. "Enter"] = v64.MouseEnter:connect(function()
			if not p3[iterFirst .. "Enabled"] or p3[iterFirst .. "Enabled"](p3) == true then
				v65.BackgroundColor3 = v66
				v65.BackgroundTransparency = 0.8
			end
		end)
		connections[iterFirst .. "Leave"] = v64.MouseLeave:connect(function()
			if not p3[iterFirst .. "Enabled"] or p3[iterFirst .. "Enabled"](p3) == true then
				animation.AnimateAsync(v65, { BackgroundTransparency = 1 }, 0.15, "In", "Quad")
			end
		end)
	end
end
function t8.Destroy(p4)
	local FolderName = p4.Folder.Name

	p4.Physical:Destroy()

	for iterFirst, iterSecond in v30(p4) do
		p4[iterFirst] = nil
	end

	t1[FolderName] = nil
	t2[FolderName] = nil
	t3[FolderName] = nil
end
function t8.GetSpectatorList(p5)
	if not p5.Battle then
		return ""
	end

	if not p5.Battle.Spectators then
		return ""
	end

	return table.concat(p5.Battle.Spectators, ", ")
end
function t8.UpdateLevelName(p6)
	if p6.Physical then
		local ok, result = pcall(function()
			if p6.SubPlayer and p6.SubPlayer ~= "" then
				p6.Physical.TopBit.PlayerName.Text = p6.Player.DisplayName .. " & " .. p6.SubPlayer
			else
				p6.Physical.TopBit.PlayerName.Text = p6.Player.DisplayName
			end

			local v198 = networkInvokeServer("GetPlayerLevelFromName", p6.Player.Name)

			networkInvokeServer("GetPlayerFactionFromName", p6.Player.Name)
			data.GetFactionScore()
			p6.Physical.TopBit.Level.Text = LevelValue .. (v198 or 1)
		end)

		if not ok then
			warn(result)
		end
	end
end
function t8.UpdateTopLevelStatus(p7)
	local ok, result = pcall(function()
		if p7.State == "Spectating" or p7.State == "Battling" or p7.State == "Trading" or p7.State == "Puzzling" or p7.State == "Partying" then
			local s1: string = " with "

			if p7.State == "Spectating" then
				s1 = " "
			end

			p7.Physical.BottomBit.PlayerName.Text = p7.State .. s1 .. p7.Folder.OtherPlayer.Value

			return
		end

		if p7.State == "" or p7.State == "Roaming" then
			p7.Physical.BottomBit.PlayerName.Text = ""

			return
		end

		if p7.State == "Inventory" then
			p7.Physical.BottomBit.PlayerName.Text = "In Deck Builder"

			return
		end

		p7.Physical.BottomBit.PlayerName.Text = p7.State
	end)

	if not ok then
		warn(result)
	end
end
local function PlayerToStatsString(p8)
	return "H/F/D: " .. p8.Hand .. "/" .. p8.Field .. "/" .. p8.DeckLeft
end

PlayerToStatsString = function(p9)
	local t11: {[any]: any} = {}

	for iterFirst, iterSecond in v30(p9) do
		t11[#t11 + 1] = string.sub(iterFirst, 1, 1)
		t11[#t11 + 1] = iterSecond
	end

	return table.concat(t11, " ")
end
PlayerToStatsString = { "Player1", "Player2" }

function t8.UpdateBattleStatus(p10, battle)
	p10.Battle = battle
end
function t8.UpdateSpectateEnabled(p12)
	local v86 = p12:SpectateEnabled()

	animation.AnimateAsync(p12.Physical.BottomBit.Spectate, { TextColor3 = v86 and color34 or color3 }, 0, "Out", "Linear")
	animation.AnimateAsync(p12.Physical.BottomBit.RightBack, { BackgroundTransparency = 1 }, 0, "Out", "Linear")
end
function t8.UpdateTradeEnabled(p13)
	if p13.Physical == nil or p13.Physical.BottomBit == nil or p13.Physical.BottomBit.Trade == nil or p13.Physical.BottomBit.CenterBack == nil then
		return
	end

	local u88: boolean = p13:TradeEnabled() == true

	local ok, result = pcall(function()
		animation.AnimateAsync(p13.Physical.BottomBit.Trade, { TextColor3 = u88 and color32 or color3 }, 0, "Out", "Linear")
		animation.AnimateAsync(p13.Physical.BottomBit.CenterBack, { BackgroundTransparency = 1 }, 0, "Out", "Linear")
	end)

	if not ok then
		warn(result)
	end
end

PlayerToStatsString = {
	"Battling",
	"Spectating",
	"Puzzling",
	"Trading",
	"Shopping",
	"Roaming",
	"",
	"Tutorial",
	"Inventory",
	"Partying",
	"Waiting"
}

function t8.ChallengeEnabled(p14)
	local u92: boolean = true

	if p14.State ~= "Waiting" then
		u92 = p14.State == "Roaming"
	end

	return u92
end
function networkClient.DeckWarning()
	audioService.PlaySound("toonybeep")
	networkClient.CreateNotice("DeckWarning", "Large", "SW", "Hey!", "An update may have affected your current selected deck as it does not have the required amount of cards to play. Update your deck in the Deck Builder!", true)
	networkClient.TweenMessage("DeckWarning", nil, "SE")
end
function t8.Challenge(p15)
	if not p15:ChallengeEnabled() then
		return
	end

	if not networkInvokeServer("CheckDeckLegality", LocalPlayer) then
		networkClient.DeckWarning()

		return
	end

	p15:OutGoing("Battle")
end
function t8.SpectateEnabled(p16)
	local u95: boolean = true

	if p16.State ~= "Spectating" then
		u95 = p16.State == "Battling"
	end

	return u95
end
function t8.Spectate(p17)
	if not p17:SpectateEnabled() then
		return
	end

	p17:OutGoing("Spectate")
end

local t9: {[any]: any} = {
	1681415257,
	22625175,
	493589317,
	195876149,
	3797449195,
	1260607397,
	10417127978,
	117852135,
	1558025854,
	11303387919,
	3885989732
}

function t8.TradeEnabled(p18, p19)
	if p18.State == "Trading" or p18.State == "Spectating" or p18.State == "Battling" then
		return false
	end

	if game.ReplicatedStorage:FindFirstChild("Testing") then
		return true
	end

	if p19 then
		if (networkInvokeServer("GetPlayerLevelFromName", p18.Player.Name) or 0) < 10 then
			return "Players need to be level 10 to trade!"
		end

		if networkInvokeServer("GetUTGFromName", p18.Player.Name) then
			return "That player can't trade."
		end

		if table.find(t9, game.Players:GetUserIdFromNameAsync(p18.Player.Name)) then
			return "That player is banned from trading."
		end
	end

	if table.find(t9, game.Players:GetUserIdFromNameAsync(LocalPlayer.Name)) then
		return "You're banned from trading."
	end

	if networkInvokeServer("GetUTGFromName", LocalPlayer.Name) then
		return "You unlocked the game! You don't need to trade :)"
	end

	if not networkInvokeServer("Tradable", LocalPlayer.Name) then
		return "You cannot trade due to regional restrictions."
	end

	if p18.Player == nil or p18.Player.Name == nil or networkInvokeServer("Tradable", p18.Player.Name) then
		if data.Level() < 10 then
			return "Reach level 10 to unlock trading!"
		end

		return true
	end

	return "That player cannot trade."
end
function t8.Trade(p20)
	local v100 = p20:TradeEnabled(true)

	if v100 == true then
		p20:OutGoing("Trade")
	elseif v100 ~= false then
		contextualize(p20.Physical.BottomBit.Trade, v100)
	end
end
function networkClient.CancelOutGoing(p21)
	local v102 = t3[p21]

	if not v102 then
		return
	end

	v102:CancelOutGoing()
end
function networkClient.ClearIncoming(p22)
	local v104 = t3[p22]

	if not v104 then
		return
	end

	v104:DeclineIncoming()
end
function networkClient.RequestTrade(p23)
	t3[p23.Name]:Incoming("Trade")
end
function networkClient.CanTrade()
	return module.Visible
end
function networkClient.CanBattle()
	return module.Visible
end
function networkClient.RequestBattle(p24)
	t3[p24.Name]:Incoming("Battle")
end
function CancelRequestGeneric(p25)
	t3[p25.Name]:DeclineIncoming()
end

networkClient.CancelRequestTrade = CancelRequestGeneric
networkClient.CancelRequestBattle = CancelRequestGeneric

function GenericAnswer(p26, p27)
	if p27 == false then
		t3[p26.Name]:CancelOutGoing()
	end
end

networkClient.AnswerRequestTrade = GenericAnswer
networkClient.AnswerRequestBattle = GenericAnswer

function module.CancelOutGoing()
	for iterFirst, iterSecond in v30(t2) do
		iterSecond:CancelOutGoing()
	end
end
function module.DeclineIncoming()
	for iterFirst, iterSecond in v30(t1) do
		iterSecond:DeclineIncoming()
	end
end
function t8.OutGoing(p28, outGoingRequestType)
	p28.OutGoingRequest = true
	p28.OutGoingRequestType = outGoingRequestType
	t2[p28.Folder.Name] = p28

	local bottomBit = p28.Physical.BottomBit

	bottomBit.Cancel.Visible = true
	bottomBit.Cancel.TextColor3 = color33
	bottomBit.Spectate.Visible = false
	networkFireServer("Request" .. p28.OutGoingRequestType, p28.Player)
	p28.Physical.BottomBit.PlayerName.Text = "Requested " .. outGoingRequestType
	p28:HideAllButSpectate()
end
function t8.CancelOutGoing(p30)
	if not p30.OutGoingRequest then
		return
	end

	if not p30.OutGoingRequestType then
		return
	end

	if not p30.Folder then
		return
	end

	networkFireServer("CancelRequest" .. p30.OutGoingRequestType, p30.Player)
	p30.OutGoingRequest = false

	local bottomBit = p30.Physical.BottomBit

	bottomBit.Cancel.Visible = false
	bottomBit.Spectate.Visible = true
	p30:ChangeState(p30.State)
	p30.IncomingRequestType = nil
	t2[p30.Folder.Name] = nil
end
function t8.Incoming(p31, incomingRequestType)
	print("Incoming", incomingRequestType)
	p31.IncomingRequest = true
	p31.IncomingRequestType = incomingRequestType
	t1[p31.Folder.Name] = p31
	UpdateIncoming()

	local bottomBit = p31.Physical.BottomBit

	bottomBit.Decline.Visible = true
	bottomBit.Decline.TextColor3 = color33
	bottomBit.Accept.Visible = true
	bottomBit.Accept.TextColor3 = color32
	bottomBit.Spectate.Visible = false
	bottomBit.Trade.Visible = false
	p31.Physical.BottomBit.PlayerName.Text = incomingRequestType .. "?"
	p31:HideBattle()
end
function t8.ClearIncoming(p33)
	if not p33.IncomingRequest then
		return
	end

	p33.IncomingRequest = false
	p33.IncomingRequestType = nil
	t1[p33.Folder.Name] = nil
	UpdateIncoming()

	local bottomBit = p33.Physical.BottomBit

	bottomBit.Decline.Visible = false
	bottomBit.Accept.Visible = false
	bottomBit.Spectate.Visible = true
	p33:UpdateSpectateEnabled()
	bottomBit.Trade.Visible = true
	p33:UpdateTradeEnabled()
	p33:ChangeState(p33.State)
end
function t8.AcceptIncoming(p34)
	if not p34.IncomingRequestType then
		return
	end

	networkFireServer("AnswerRequest" .. p34.IncomingRequestType, p34.Player, true)
	p34:ClearIncoming()
end
function t8.DeclineIncoming(p35)
	if not p35.IncomingRequestType then
		return
	end

	networkFireServer("AnswerRequest" .. p35.IncomingRequestType, p35.Player, false)
	p35:ClearIncoming()
end
function t8.TweenPlayerNameTransparency(p36)
	task.wait(0.2)
	animation.AnimateAsync(p36.Physical.BottomBit.PlayerName, { TextTransparency = 0 }, 0.16, "Out", "Quad")
end
function t8.TweenPlayerNameTransparencyOut(p37)
	animation.AnimateAsync(p37.Physical.BottomBit.PlayerName, { TextTransparency = 1 }, 0.16, "In", "Quad")
end
function t8.NormalSize(p38)
	p38.Physical.BottomBit:TweenSize(UDim2.new(1, 0, 0.5, 0), "InOut", "Quad", 0.25, true)
	p38.Length = 1
	module.Redraw()
end
function t8.HideBattle(p39)
	p39.Physical.BottomBit.PlayerName.TextTransparency = 1
	p39.Physical.BottomBit.PlayerName.Visible = true
	p39.Physical.BottomBit.PlayerName:TweenSize(UDim2.new(0.35, 0, 1, 0), "Out", "Quad", 0.25, true)
	p39:TweenPlayerNameTransparency()
	p39:NormalSize()
end
function t8.HideAllButSpectate(p40)
	p40.Physical.BottomBit.PlayerName.TextTransparency = 1
	p40.Physical.BottomBit.PlayerName.Visible = true
	p40.Physical.BottomBit.PlayerName:TweenSize(UDim2.new(0.65, 0, 1, 0), "Out", "Quad", 0.25, true)
	p40:TweenPlayerNameTransparency()
	p40:NormalSize()
end
function t8.HideAll(p41)
	p41.Physical.BottomBit.PlayerName.TextTransparency = 1
	p41.Physical.BottomBit.PlayerName.Visible = true
	p41.Physical.BottomBit.PlayerName:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.25, true)
	p41:TweenPlayerNameTransparency()
	p41.Physical.BottomBit:TweenSize(UDim2.new(1, 0, 0, 0), "InOut", "Quad", 0.25, true)
	p41.Length = 0.5
end
function t8.HideNone(p42)
	p42:TweenPlayerNameTransparencyOut()
	p42.Physical.BottomBit.PlayerName:TweenSize(UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.25, true, function(p43)
		if p43 == Enum.TweenStatus.Canceled then
			return
		end

		p42.Physical.BottomBit.PlayerName.Visible = false
	end)
	p42:UpdateLevelName()
	p42:NormalSize()
end
function t8.Battling(p44)
	p44:HideAllButSpectate()
end
function t8.Spectating(p45)
	p45:HideAllButSpectate()
end
function t8.Trading(p46)
	p46:HideAll()
end
function t8.Shopping(p47)
	p47:HideAll()
end
function t8.Roaming(p48)
	p48:HideNone()
end
function t8.Partying(p49)
	p49:HideAll()
end

t8[""] = t8.Roaming

function t8.Puzzling(p50)
	p50:HideAllButSpectate()
end
function t8.Tutorial(p51)
	p51:HideAll()
end
function t8.Watching(p52)
	p52:HideAll()
end
function t8.Inventory(p53)
	p53:HideAll()
end
function t8.Waiting(p54)
	p54:HideNone()
end
function t8.ChangeState(p55, p56: string)
	if not p55.Physical then
		warn("No Physical for this playerlist item")

		return
	end

	assert(t8[p56], "Invalid state " .. p56 .. ".")

	local state = p55.State

	if p56 == "" then
		p56 = "Roaming"
	end

	p55.State = p56
	p55:UpdateTopLevelStatus()
	p55:UpdateLevelName()
	p55:UpdateSpectateEnabled(p56)

	local length = p55.Length

	p55[p56](p55)

	if p56 ~= "Battling" and p56 ~= "Spectating" and p56 ~= "Puzzling" then
		p55.Battle = nil
	end

	if p56 == "Waiting" or p56 == "Roaming" then
		p55:UpdateTradeEnabled()
	else
		p55:CancelOutGoing()
		p55:DeclineIncoming()
	end

	module.Redraw()
end
function module.Redraw()
	if not module.Visible then
		return
	end

	local t12: {[any]: any} = {}
	local scrollBitScalerMatchmaking = scrollBitScaler.Matchmaking
	local uDim2 = UDim2.new(0, 0, 0, 0)

	scrollBitScalerMatchmaking:TweenPosition(uDim2, "InOut", "Quad", 0.25, true)

	local n1: number = 0 + 2

	if config.MIN_PLAYERS_MATCHMAKING > game.Players.NumPlayers or networkInvokeServer("GetServerType") == "VIPServer" then
		scrollBitScaler.Matchmaking.PlayerCountBlock.Visible = true

		if networkInvokeServer("GetServerType") == "VIPServer" then
			scrollBitScaler.Matchmaking.PlayerCountBlock.Notice.Text = "Queue is disabled for private servers."
		end
	else
		scrollBitScaler.Matchmaking.PlayerCountBlock.Visible = false
	end

	local scrollBitScalerSearch = scrollBitScaler.Search
	local uDim22 = UDim2.new(0, 0, n1, 0)

	scrollBitScalerSearch:TweenPosition(uDim22, "InOut", "Quad", 0.25, true)

	local n2 = n1 + 1

	data.LevelRange()

	local function Redraw(p57, p58)
		if not p58 then
			return
		end

		if t12[p57] then
			return
		end

		if p58.HideInList and p58.HideInList == true then
			p58.Physical.Visible = false
		else
			p58.Physical.Visible = true

			local physical = p58.Physical
			local uDim23 = UDim2.new(0, 0, n2, 0)

			physical:TweenPosition(uDim23, "InOut", "Quad", 0.25, true)
			n2 += p58.Length
		end

		t12[p57] = true
	end
	local function AlphaSort(p59)
		local t13: {[any]: any} = {}
		local n1: number = 1

		for iterFirst, iterSecond in v30(p59) do
			t13[n1] = iterFirst
			n1 += 1
		end

		table.sort(t13)

		return t13
	end

	local v157 = AlphaSort(t1)

	for iterFirst, iterSecond in v30(v157) do
		Redraw(iterSecond, t1[iterSecond])
	end

	v157 = AlphaSort(t3)

	for iterFirst2, iterSecond2 in v30(v157) do
		local v162 = t3[iterSecond2]

		if v162.State == "Waiting" or v162.State == "Roaming" or v162.State == "" then
			Redraw(iterSecond2, v162)
		end
	end

	for iterFirst3, iterSecond3 in v30(v157) do
		local v165 = t3[iterSecond3]

		if v165.State == "Battling" then
			if v165.Battle and t4[v165.Battle.BattleId] then
				local v166 = t4[v165.Battle.BattleId]

				Redraw(v166.Player1, t3[v166.Player1])
				Redraw(v166.Player2, t3[v166.Player2])

				for iterFirst4, iterSecond4 in v30(v166.Spectators) do
					Redraw(iterSecond4, t3[iterSecond4])
				end
			else
				Redraw(iterSecond3, v165)
			end
		end
	end

	for iterFirst5, iterSecond5 in v30(v157) do
		Redraw(iterSecond5, t3[iterSecond5])
	end

	local v171 = scrollBitScaler["Ratings Aren't Broken"]
	local uDim24 = UDim2.new(0, 0, n2, 0)

	v171:TweenPosition(uDim24, "InOut", "Quad", 0.25, true)
	n2 += 1
	scrollBit.Size = UDim2.new(1, 0, 0, n2 * scrollBitScaler.AbsoluteSize.Y)
end

customscalings.RedrawPlayerList = module.Redraw

local function PlayerAdded(p60)
	if p60.Name == game.Players.LocalPlayer.Name then
		return
	end

	local v174 = p60:WaitForChild(p60.Name, math.huge)

	t8.new(v174)
	module.Redraw()
end

game.Players.PlayerAdded:Connect(PlayerAdded)
game.Players.PlayerRemoving:Connect(function(player)
	if player.Name == game.Players.LocalPlayer.Name then
		return
	end

	if not t3[player.Name] then
		return
	end

	t3[player.Name]:Destroy()
	module.Redraw()
end)

for _, v in ipairs(game.Players:GetPlayers()) do
	task.spawn(PlayerAdded, v)
end

local function GetBattleFromPlayerName(p62, p63)
	for iterFirst, iterSecond in v30(p62) do
		if p63 == iterSecond.Player1.Name then
			return iterSecond, iterSecond.Player2.Name
		end

		if p63 == iterSecond.Player2.Name then
			return iterSecond, iterSecond.Player1.Name
		end
	end
end
function module.ItemFromSpectatorList(p64)
	for iterFirst, iterSecond in v30(p64.Spectators) do
		if module.Items[iterSecond] then
			return module.Items[iterSecond]
		end
	end

	return nil
end
function module.FindAndUpdateBattle(p65, p66)
	local v185 = module.Items[p65]

	if v185 then
		v185:UpdateBattleStatus(p66)
	end
end
function module.UpdateBattles()
	t4 = networkInvokeServer("GetBattles", true)

	for iterFirst, iterSecond in v30(t4) do
		module.FindAndUpdateBattle(iterSecond.Player1.Name, iterSecond)
		module.FindAndUpdateBattle(iterSecond.Player2.Name, iterSecond)

		for iterFirst2, iterSecond2 in v30(iterSecond.Spectators) do
			module.FindAndUpdateBattle(iterSecond2, iterSecond)
		end
	end
end

task.spawn(function()
	while true do
		if module.Visible then
			module.UpdateBattles()
		end

		task.wait(5)

		continue
	end
end)

local playerSearchInput = scrollBitScaler.Search.PlayerSearchInput

playerSearchInput:GetPropertyChangedSignal("Text"):Connect(function()
	local text: string = tostring(playerSearchInput.Text)

	if text then
		for iterFirst, iterSecond in v30(t3) do
			local stringFind = string.find
			local lowerText = string.lower(t3[iterFirst].DisplayName)

			if not stringFind(lowerText, string.lower(text)) then
				t3[iterFirst].HideInList = true
			else
				t3[iterFirst].HideInList = false
			end
		end

		module.Redraw()
	end
end)
scrollBitScaler.Matchmaking.JoinButton.MouseButton1Click:connect(function()
	audioService.PlaySound("click1")

	local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

	teleportService:SetTeleportGui(replicatedStorage.QueueLoadingScreen)
	task.wait(0.5)

	if playerList.Visible == false then
		return
	end

	if u31 == false then
		scrollBitScaler.Matchmaking.JoinButton.BackgroundColor3 = Color3.fromRGB(229, 62, 65)
		scrollBitScaler.Matchmaking.JoinButton.ButtonText.Text = "In Queue: Click to Cancel"
		u31 = true
		networkFireServer("EnterQueue2")

		return
	end

	scrollBitScaler.Matchmaking.JoinButton.BackgroundColor3 = Color3.fromRGB(72, 229, 82)
	scrollBitScaler.Matchmaking.JoinButton.ButtonText.Text = "Enter Queue"
	u31 = false
	networkFireServer("LeaveQueue2")
end)

function module.Show()
	handy.Hide(true)
	playerList:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.5, true)
	playerList.Visible = true
	module.Visible = true
	networkFireServer("EnterPlayerList")
	module.Redraw()
end
function module.Hide(p67)
	playerList:TweenPosition(UDim2.new(-1.5, 0, 1, 0), "In", "Quad", 0.5, true)
	playerList.Visible = false
	module.Visible = false
	battleWarning.Visible = false
	module.CancelOutGoing()
	module.DeclineIncoming()
	networkFireServer("LeavePlayerList")

	if u31 == true then
		scrollBitScaler.Matchmaking.JoinButton.BackgroundColor3 = Color3.fromRGB(72, 229, 82)
		scrollBitScaler.Matchmaking.JoinButton.ButtonText.Text = "Enter Queue"
		u31 = false
		networkFireServer("LeaveQueue2")
	end

	if p67 ~= true then
		handy.Show()
	end
end

handy.AddToHide("PlayerList", module.Hide)
handyHandy.ChallengeNeu.MouseButton1Down:connect(function()
	if not handy.Visible() then
		return
	end

	if networkClient.IsSubPlayer() then
		networkClient.WarningMsg("You are in a party, you will enter the game when your party leader enters one.")

		return
	end

	audioService.PlaySound("lock")
	module.Show()
end)
handyHandy.ChallengeNeu.MouseEnter:connect(function()
	contextualize(handyHandy.ChallengeNeu, "Battle, spectate, and trade!")
end)
playerList.TopBit.Back.MouseButton1Click:connect(module.Hide)
print("Finished loading " .. script.Name)

return module
