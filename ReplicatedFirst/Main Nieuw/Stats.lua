local utils = require(game.ReplicatedStorage.Utils)
local utilsClamp = utils.Clamp
local data = require(script.Parent.Data)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local handyHandyStats = handyHandy.Stats
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local audioService = require(game.ReplicatedStorage.AudioService)
local scrollingFrame = require(script.Parent.Nevermore).ScrollingFrame
local customScalings = require(script.Parent.CustomScalings)

require(script.Parent.Contextualize)

local LevelValue = game.ReplicatedStorage.Strings.Level.Value
local handyHolder = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui").HandyHolder
local handyHolderStats = handyHolder.Stats
local handyHolderStatsScrollBit = handyHolderStats.ScrollBit
local handyHolderStatsScrollBitContent = handyHolderStatsScrollBit.Content
local handyHolderStatsScrollBitContentRanks = handyHolderStatsScrollBitContent.Ranks
local scaler = handyHolderStatsScrollBitContent.Stats.Scaler
local scalerBaseStat = scaler.BaseStat
local t1: {[any]: any} = {}
local BloxBuxValue = game.ReplicatedStorage.Strings.BloxBux.Value
local n1: number = 0
local n2: number = 0
local n3: number = 0
local n4: number = 0
local color3 = Color3.new(1, 1, 1)
local color32 = Color3.fromRGB(0, 150, 136)
local color33 = Color3.fromRGB(0, 0, 0)
local s1: string = ""
local cardLibrary = require(game.ReplicatedStorage.CardLibrary)

for _, v in pairs(cardLibrary) do
	if v.Rarity ~= "Token" and not v.PlayTest then
		if not v.AltArt and not v.Original then
			n1 += 1
		end

		if v.AltArt or v.Original and not v.Foil then
			if v.AltArt then
				n3 += 1
			end

			n2 += 1
		end
	end
end

local sleeves = require(game.ReplicatedStorage.Sleeves)

for _, v in pairs(sleeves) do
	for _, _ in pairs(v) do
		n4 += 1
	end
end

local t2: {[any]: any} = {
	rabbit = "Rabbit Charms",
	clover = "Clovers",
	battle = "battles (losses count as half)",
	artcards = "art cards",
	supporter = "Bloxbux",
	cards = "different cards"
}
local t3: {[any]: any} = {
	bunny = "rabbit charm",
	artcards = "art card",
	cards = "different card"
}

local function ReqString(p1, p2)
	if p2 == 1 then
		return t3[p1] or p1
	end

	return t2[p1] or p1
end

local t4: {[any]: any} = {
	rabbit = "Rabbit Charms",
	clover = "Four-leaf Clovers",
	battle = "Battling",
	artcards = "Art Card Collecting",
	supporter = "Supporting The Game",
	sleeves = "Sleeve Collecting",
	cards = "Card Collecting",
	cardsluck = "Collecting & Luck",
	battlecards = "Collecting & Battling",
	battleluck = "Battling & Lucky Charms",
	balanced = "General",
	special = "Special"
}

local function CategoryString(p3)
	return t4[p3] or p3
end

local v43 = scrollingFrame.new(handyHolderStatsScrollBitContentRanks.Clip.ScrollingFrame):AddScrollBar(handyHolderStatsScrollBitContentRanks.Clip.BarFrame)

v43.BarFrame.BackgroundColor3 = color32
v43.BarFrame.BackgroundTransparency = 0
v43.BarFrame.Backing.Visible = false

local v44 = handyHolderStatsScrollBitContentRanks.Clip.ScrollingFrame.Scaler
local clone = v44.BaseCategory:Clone()

clone.Visible = true

local clone2 = v44.BaseRank:Clone()

clone2.Visible = true

local clone3 = v44.BaseReq:Clone()

clone3.Visible = true

local n5: number = 0
local n6: number = 0

function CheckNewRanks()
	handyHandyStats.New.Visible = n6 ~= 0
end

local u50: boolean = true

local module: {[any]: any} = {
	ApplyRanks = function(p4, p5)
		if not p5 then
			return
		end

		local ranks = p5.ranks
		local getSpecialRanks = network.InvokeServer("GetSpecialRanks")
		local t6 = p4[9]

		if not t6 then
			t6 = {
				"balanced",
				1,
				{}
			}
		end

		ranks.special = t6[3]

		local pp = p5.pp
		local fornext = p5.fornext
		local v69 = ranks[t6[1]][t6[2]]

		n5 = 0

		for k, v in pairs(ranks) do
			local k3 = v44:FindFirstChild(k)

			if not k3 then
				k3 = clone:Clone()
			end

			k3.Name = k
			k3.Title.Text = t4[k] or k
			k3.Position = UDim2.new(0, 0, n5, 0)
			k3.Parent = v44
			n5 += 1

			for k2, iterValue in pairs(v) do
				if typeof(iterValue) == "string" then
					local foundChild
					local u76

					if getSpecialRanks[iterValue] then
						foundChild = v44:FindFirstChild(getSpecialRanks[iterValue].Text .. "Special")
						u76 = v44:FindFirstChild(getSpecialRanks[iterValue].Text .. "Special") or clone2:Clone()
						u76.Name = getSpecialRanks[iterValue].Text .. "Special"
					else
						foundChild = v44:FindFirstChild(iterValue)
						u76 = v44:FindFirstChild(iterValue) or clone2:Clone()
						u76.Name = iterValue
					end

					u76.Title.Text = iterValue
					u76.Position = UDim2.new(0, 0, n5, 0)
					u76.Parent = v44
					u76.Title.TextColor3 = iterValue == p5.rank and color32 or color33
					u76.Button.ImageTransparency = if iterValue == p5.rank then 0 else 0.75
					u76.Button.ImageColor3 = iterValue == p5.rank and color32 or color33

					if not foundChild then
						if not u50 then
							n6 += 1
							CheckNewRanks()
							u76.BackgroundColor3 = Color3.fromRGB(255, 235, 238)

							local u77 = nil

							u77 = u76.MouseEnter:connect(function()
								u77:disconnect()
								u76.BackgroundColor3 = color3
								n6 -= 1
								CheckNewRanks()
							end)
						end

						u76.Button.MouseButton1Click:connect(function()
							u76.Title.TextColor3 = color32
							u76.Button.ImageColor3 = color32
							u76.Button.ImageTransparency = 0
							networkFireServer("SelectRank", k, k2)
						end)
					end

					n5 += 1
				end
			end

			local v78 = fornext[k]
			local foundChild = v44:FindFirstChild(k .. "Hint")

			if not foundChild then
				foundChild = clone3:Clone()
			end

			if v78 == 0 then
				foundChild.Title.Text = "All ranks unlocked! Good job~"
			elseif v78 then
				local v80 = if v78 == 1 then t3[k] or k else t2[k] or k

				foundChild.Title.Text = "You need " .. v78 .. " " .. v80 .. " to unlock the next rank!"
			else
				foundChild.Title.Text = "Locked"
			end

			foundChild.Name = k .. "Hint"
			foundChild.Position = UDim2.new(0, 0, n5, 0)
			foundChild.Parent = v44
			n5 += 1
			n5 += 0.25
		end

		u50 = false
		v44.Parent.Size = UDim2.new(1, 0, 0, n5 * v44.AbsoluteSize.Y)
		s1 = LevelValue .. p5.level .. " " .. (p5.rank or "")
		handyHolder.HandyNew.StatsDisplay.LevelDisplay.Text = s1
	end
}

handyHandy.StatsDisplay.MouseEnter:connect(function()
end)
data.UpdateCallbacks.ApplyRanks = module.ApplyRanks

function customScalings.customscalings.RescaleRankHolder()
	v44.Parent.Size = UDim2.new(1, 0, 0, n5 * v44.AbsoluteSize.Y)
end
local function CardStats(p6)
	local n1: number = 0
	local n2 = 0
	local n3: number = 0
	local n4: number = 0

	for k, v in pairs(p6) do
		if cardLibrary[k] and not cardLibrary[k].PlayTest then
			if not cardLibrary[k].AltArt and not cardLibrary[k].Original and cardLibrary[k].Rarity ~= "Token" then
				n1 += 1
			end

			n2 += v["0"]

			if cardLibrary[k].AltArt or cardLibrary[k].Original and not cardLibrary[k].Foil and cardLibrary[k].Rarity ~= "Token" then
				if cardLibrary[k].AltArt then
					n4 += 1
				end

				n3 += 1
			end
		end
	end

	return n1, n2, n3, n4
end
local function CountSleeves(p7)
	local n1: number = -1

	for _, _ in pairs(p7) do
		n1 += 1
	end

	return n1
end
function module.ApplyStats(list, p9)
	if not p9 then
		return
	end

	local v94, v95, v96, v97 = CardStats(list[3])
	local utilsFormatNumber = utils.FormatNumber
	local text: string = tostring(v95)
	local v100 = utilsFormatNumber(text)
	local formatNumber = utils.FormatNumber
	local text2: string = tostring(list[1])
	local v103 = formatNumber(text2)
	local floored = math.floor((if list[4] == 0 or list[5] == 0 then 0 else list[4] / list[5]) * 100)
	local t7: {[any]: any} = { "Wins/Losses", list[4] .. "/" .. list[5] .. " : " .. floored / 100 }
	local t8: {[any]: any} = { "Cards", v94 .. "/" .. n1 }
	local t9: {[any]: any} = { "Alt Arts", v96 .. "/" .. n2 }
	local t10: {[any]: any} = { "Box Arts", v97 .. "/" .. n3 }
	local n5: number = -1

	for _, _ in pairs(list[6]) do
		n5 += 1
	end

	local n6: number = 0

	for _, v in pairs({
		{ "BloxBux", v103 .. BloxBuxValue },
		{ "Total Cards", v100 },
		t7,
		t8,
		t9,
		t10,
		{ "Sleeves", n5 .. "/" .. n4 }
		}) do
		local name = v[1]
		local v116 = v[2]
		local foundChild = scaler:FindFirstChild(name)

		if not foundChild then
			foundChild = scalerBaseStat:Clone()
		end

		foundChild.Name = name
		foundChild.Title.Text = name
		foundChild.Stat.Text = v116
		foundChild.Position = UDim2.new(0, 0, n6, 0)
		foundChild.Visible = true
		foundChild.Parent = scaler
		n6 += 1
	end
end

data.UpdateCallbacks.ApplyStats = module.ApplyStats

local handyHolderStatsScrollBitButtons = handyHolderStatsScrollBit.Buttons
local handyHolderStatsScrollBitButtonsSelector = handyHolderStatsScrollBitButtons.Selector

local function ToRanks()
	audioService.PlaySound("lock")
	handyHolderStatsScrollBitButtonsSelector:TweenPosition(handyHolderStatsScrollBitButtons.Ranks.Position + UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitContent.Stats:TweenPosition(UDim2.new(1.1, 0, 0, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitContent.Ranks:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitButtons.Ranks.TextColor3 = color32
	handyHolderStatsScrollBitButtons.Stats.TextColor3 = color33
end
local function ToStats()
	audioService.PlaySound("lock")
	handyHolderStatsScrollBitButtonsSelector:TweenPosition(handyHolderStatsScrollBitButtons.Stats.Position + UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitContent.Stats:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitContent.Ranks:TweenPosition(UDim2.new(-1.1, 0, 0, 0), "Out", "Quad", 0.25, true)
	handyHolderStatsScrollBitButtons.Stats.TextColor3 = color32
	handyHolderStatsScrollBitButtons.Ranks.TextColor3 = color33
end

handyHolderStatsScrollBitButtons.Ranks.MouseButton1Down:connect(ToRanks)
handyHolderStatsScrollBitButtons.Stats.MouseButton1Down:connect(ToStats)
module.Buttons = handyHolderStatsScrollBitButtons
handyHolderStatsScrollBit.TouchSwipe:connect(function(p10)
	if p10 == Enum.SwipeDirection.Left then
		ToStats()
	elseif p10 == Enum.SwipeDirection.Right then
		ToRanks()
	end
end)

local u58 = nil

handy.handy.Stats.MouseButton1Click:connect(function()
	if not handy.Visible() then
		return
	end

	audioService.PlaySound("lock")
	handy.Hide(true)
	-- FASTER MENU: Hide no longer waits for the side menu cascade, and the panel slides take 0.3s instead of 0.5s
	handyHolderStats:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.3, true)
	handyHolderStats.Visible = true
	u58 = true
end)
handyHolderStats.TopBit.Back.MouseButton1Click:connect(function()
	handyHolderStats:TweenPosition(UDim2.new(-1.5, 0, 1, 0), "Out", "Quad", 0.3, true)
	u58 = false
	handy.Show()
end)
handy.AddToHide("Stats", function(p11)
	handyHolderStats:TweenPosition(UDim2.new(-1.5, 0, 1, 0), "Out", "Quad", 0.3, true)
	u58 = false

	if p11 ~= true then
		handy.Show()
	end
end)
data.UpdateCashMoney()
print("Finished loading " .. script.Name)

return module