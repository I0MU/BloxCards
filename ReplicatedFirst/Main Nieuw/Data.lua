





local u1 = nil
local handy = require(script.Parent.Handy).handy

require(script.Parent.Contextualize)

local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local animation = require(replicatedStorage:WaitForChild("Animation"))
local network = require(script.Parent.Network)
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local sleeves = require(script.Parent.Sleeves)
local sleevesSleeves = sleeves.sleeves
local sleevesPrettysleeves = sleeves.prettysleeves
local utils = require(game.ReplicatedStorage.Utils)
local strings = game.ReplicatedStorage.Strings
local BloxBuxValue = strings.BloxBux.Value
local LevelValue = strings.Level.Value
local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local n1 = 0

LevelValue = function(p1)
	if game:GetService("RunService"):IsStudio() then
		print(p1)
	end
end

local module: {[any]: any} = {
	UpdateCallbacks = {}
}

function module.UpdateCallbacks.ApplyRankTable(_, p3)
	if p3.level > n1 then
		network.FireServer("LevelUp")
	end

	n1 = p3.level
end
function networkClient.RankUpdate(p4)
	for _, v in pairs(module.UpdateCallbacks) do
		pcall(function()
			v(u1, p4)
		end)
	end
end
local function ChangeMoney(value)
	animation.AnimateAsync(visGui.BloxBux, { Value = value }, 3, "Out", "Quint")
end

local handyStatsDisplay = handy.StatsDisplay
local utilsFormatNumber = utils.FormatNumber
local text: string = tostring(visGui.BloxBux.Value)
local v22 = utilsFormatNumber(text)

visGui.OmniShop.Title.Balance.Text = v22 .. BloxBuxValue
visGui.QuestMenu.Title.Balance.Text = v22 .. BloxBuxValue
handyStatsDisplay.Amount.Text = v22 .. BloxBuxValue
visGui.BloxBux.Changed:connect(function()
	local utilsFormatNumber = utils.FormatNumber
	local text2: string = tostring(visGui.BloxBux.Value)
	local v32 = utilsFormatNumber(text2)

	visGui.OmniShop.Title.Balance.Text = v32 .. BloxBuxValue
	visGui.QuestMenu.Title.Balance.Text = v32 .. BloxBuxValue
	handyStatsDisplay.Amount.Text = v32 .. BloxBuxValue
end)

function UpdateCashMoney()
	local v33 = module.Money()

	animation.AnimateAsync(visGui.BloxBux, { Value = v33 }, 3, "Out", "Quint")
	handyStatsDisplay.LevelDisplay.Text = "Lv" .. module.Level()

	local offerHolder = visGui.OmniShop.Charms.Offers.OfferHolder

	offerHolder.Feet.Stat.Exposition.Text = u1[8][1] .. " owned"
	offerHolder.Clover.Stat.Exposition.Text = u1[8][2] .. " owned"
	visGui.OmniShop.Title.BalanceHistoryCores.Text = u1[8][1] .. ""

	for _, v in pairs(visGui.OmniShop.Packs.SideBar.Cards:GetChildren()) do
		if not sleevesSleeves[u1[2]] then
			u1[2] = "Basic"
		end

		if v.Name == "Card" then
			v.Image = "rbxassetid://" .. sleevesSleeves[u1[2]][1]
		end
	end

	v33 = networkInvokeServer("GetAllRanks")
	networkClient.RankUpdate(v33)
end

module.UpdateCashMoney = UpdateCashMoney

function module.Settings()
	return u1[13]
end
function networkClient.ForceUpdate(p6)
	u1 = p6
	UpdateCashMoney()
end
function networkClient.SetData(p7)
	u1 = p7
	UpdateCashMoney()
end
function networkClient.SetLuck(p8)
	u1[8] = p8
	UpdateCashMoney()
end
function networkClient.MoneyUpdate(p9)
	u1[1] = p9
	UpdateCashMoney()
end
function networkClient.WinLossUpdate(list)
	u1[4] = list[1]
	u1[5] = list[2]
	UpdateCashMoney()
end

network.async.ForceUpdate = true
network.async.SetData = true
network.async.SetLuck = true
network.async.MoneyUpdate = true
network.async.WinLossUpdate = true

function module.WinLoss()
	return { module.Wins(), module.Losses() }
end
function module.Money()
	return u1[1]
end
function module.SetMoney(p11)
	u1[1] = p11
	UpdateCashMoney()
end
function module.OwnsSleeve(p12)
	local v44 = u1[6]

	for i = 1, #v44 do
		if p12 == v44[i] then
			return true
		end
	end

	return false
end
function module.OwnsCard(p13)
	return module.Storage()[p13] or false
end
function module.OwnedCardCopies(p14)
	return module.Storage()[p14] or {}
end
function module.IsNewCard(p15)
	if not u1[12] then
		return false
	end

	return u1[12][p15]
end
function module.Storage()
	return u1[3]
end
function module.CurrentSleeveId()
	return sleevesSleeves[u1[2]][1]
end
function module.Wins()
	return u1[4]
end
function module.Losses()
	return u1[5]
end
function module.CurrentSleeveName()
	return u1[2]
end
function module.SetSleeve(p16)
	u1[2] = p16
end
function module.SleeveAmount()
	return #u1[6]
end
function module.AddSleeve(p17)
	table.insert(u1[6], p17)
end
function module.RankTable()
	return u1[9]
end
function module.RedeemedCodes()
	return u1[10] or {}
end
function module.Level()
	return n1 or 0
end
function module.PackTickets()
	return u1[14]
end
function module.DeckNames()
	return u1[11]
end
function networkClient.SetPackTickets(p18)
	u1[14] = p18
	networkClient.UpdatePackHolder()
end
function module.SetQuestStatsData(p19)
	if type(p19) == "table" and getmetatable(p19) == nil then
		-- unknown stat counters read as 0 (the server only stores stats once they are earned)
		setmetatable(p19, { __index = function(_, k)
			if type(k) == "string" and not k:find("^Viewed") and not k:find("^FirstTime") then return 0 end
		end })
	end
	u1[16] = p19
end
function module.GetQuestStats()
	return u1[16]
end
function module.SetTournamentDeck(p20)
	u1[17] = p20
end
function module.SetTournamentSideboard(p21)
	u1[18] = p21
end
function networkClient.SetLevelUpData(p22)
	u1[19] = p22
end
function networkClient.SetEventCurrency(p23)
	u1[20] = p23
	UpdateCashMoney()
end
function module.GetEventCurrency()
	return u1[20]
end
function networkClient.SetFactionScore(p24)
	if game:GetService("RunService"):IsStudio() then
		print(p24)
	end

	u1[21] = p24
end
function module.GetFactionScore()
	return u1[21]
end
function networkClient.SetEventPurchaseAmount(p25)
	if game:GetService("RunService"):IsStudio() then
		print(p25)
	end

	u1[22] = p25
end
function module.AllRunData()
	return u1[15]
end
function module.GetEventPurchaseAmount(p26)
	if not u1[22][p26] then
		return nil
	end

	return u1[22][p26]
end
function networkClient.SetAntiFarmTime(p27)
	u1[23] = p27
end
function networkClient.BackupData(p28, p29, p30)
	if not u1[24][p30] then
		u1[24][p30] = {}
		u1[24][p30].Cards = p28
		u1[24][p30].BloxBux = p29
		u1[24][p30].Loaded = false
	end
end
function networkClient.SetOwnedPacks(p31, p32)
	if not u1[25] then
		if game:GetService("RunService"):IsStudio() then
			print("Missing Pack Ownership data")
		end

		return
	end

	u1[25][p31] = p32
	networkClient.ShowPackUnlockAnimation(p31)
end
function module.GetOwnedPacks()
	if not u1[25] then
		if game:GetService("RunService"):IsStudio() then
			print("Missing Pack Ownership data")
		end

		return
	end

	return u1[25]
end
function module.OwnsPack(p33)
	return u1[25][p33] or false
end
function module.OwnsBackground(p34)
	local v68 = u1[26]

	for i = 1, #v68 do
		if p34 == v68[i] then
			return true
		end
	end

	return false
end
function module.CurrentBackgroundName()
	return u1[27]
end
function module.SetBackground(p35)
	u1[27] = p35
end
function module.GetRaidBoostTimer()
	return u1[32].RaidBoost
end
function networkClient.UpdateBoostTimers(p36)
	u1[32] = p36
end
function module.GetPurchases()
	return u1[31]
end
function module.BanReason()
	if not u1[13].Ban then
		return
	end

	return u1[13].Ban
end
function module.LevelRange()
	local floored = math.floor(n1 - n1 / 2)

	return (math.max(1, floored))
end
function module.IsInLevel(p37)
	local v74 = module.LevelRange()

	return p37 >= v74
end
function module.Load()
	u1 = networkInvokeServer("LoadData", true)
	UpdateCashMoney()

	return u1
end

module.Load()
print("Finished loading " .. script.Name)

return module
