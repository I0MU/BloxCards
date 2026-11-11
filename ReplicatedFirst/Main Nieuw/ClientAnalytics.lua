



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local config = require(replicatedStorage.CONFIG)
local userInputService: UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local cardLibrary = (function()
	local real = require(replicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()
local network = require(script.Parent.Network)
local networkClient = network.client
local networkInvokeServer = network.InvokeServer
local networkFireServer = network.FireServer
local analyticsGui = LocalPlayer.PlayerGui.AnalyticsGui
local cardTemplate = analyticsGui.Window.Templates.CardTemplate
local cards = analyticsGui.Window.Cards
local misc = analyticsGui.Window.Misc

local function decimalToPercentage(p1)
	return math.round(p1 * 100 * 100) / 100
end
local function LoadAnalytics(p2)
	for _, v in pairs(cards.Stuff:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end

	local t1: {[any]: any} = {}

	for k, v in pairs(p2.Cards) do
		local v24 = cardLibrary[k]

		if v24 then
			local clone = cardTemplate:Clone()

			table.insert(t1, { TextLabel = clone, Text = v24.Name })
			clone.Title.Text = v24.Name
			clone.Index.Text = k

			local v26 = v.W or 0
			local v27 = v.L or 0
			local n1 = v27 > 0 and math.round(v26 / (v26 + v27) * 100 * 100) / 100 or 100

			clone.WinrateValue.Value = n1 * 100
			clone.Winrate.Text = n1
			clone.PlayCountValue.Value = v26 + v27
			clone.PlayCount.Text = v26 + v27
			clone.UniqueUsersValue.Value = v.Users or 0
			clone.UniqueUsers.Text = v.Users or 0
			clone.Parent = cards.Stuff
			clone.Visible = true
		end
	end

	table.sort(t1, function(p3, p4)
		return p3.Text < p4.Text
	end)

	for k, v in pairs(t1) do
		v.TextLabel.AlphabeticalValue.Value = k * -1
	end

	local v31 = misc["1v1Total"]
	local text: string = tostring(p2.Misc["1v1FirstW"] + p2.Misc["1v1FirstL"])

	v31.Text = "1v1 total games: " .. text
	v31 = misc["1v2Total"]

	local text2: string = tostring(p2.Misc["1v2FirstW"] + p2.Misc["1v2FirstL"])

	v31.Text = "1v2 total games: " .. text2
	v31 = misc["2v2Total"]

	local text3: string = tostring(p2.Misc["2v2FirstW"] + p2.Misc["2v2FirstL"])

	v31.Text = "2v2 total games: " .. text3

	local miscTotal = misc.Total
	local text4: string = tostring(p2.Misc["1v1FirstW"] + p2.Misc["1v1FirstL"] + p2.Misc["1v2FirstW"] + p2.Misc["1v2FirstL"] + p2.Misc["2v2FirstW"] + p2.Misc["2v2FirstL"])

	miscTotal.Text = "total games: " .. text4
	v31 = misc["1v1FirstWinrate"]

	local v37 = p2.Misc["1v1FirstL"] > 0 and tostring(math.round(p2.Misc["1v1FirstW"] / (p2.Misc["1v1FirstW"] + p2.Misc["1v1FirstL"]) * 100 * 100) / 100) or 0

	v31.Text = "1v1 first winrate: " .. v37 .. "%"
	v31 = misc["2v2FirstWinrate"]
	v37 = p2.Misc["2v2FirstL"] > 0 and tostring(math.round(p2.Misc["2v2FirstW"] / (p2.Misc["2v2FirstW"] + p2.Misc["2v2FirstL"]) * 100 * 100) / 100) or 0
	v31.Text = "2v2 first winrate: " .. v37 .. "%"
	v31 = misc["1v2FirstWinrate"]
	v37 = p2.Misc["1v2FirstL"] > 0 and tostring(math.round(p2.Misc["1v2FirstW"] / (p2.Misc["1v2FirstW"] + p2.Misc["1v2FirstL"]) * 100 * 100) / 100) or 0
	v31.Text = "1v2 first winrate: " .. v37 .. "%"
	v31 = misc["1v2SoloWinrate"]
	v37 = p2.Misc["1v2SoloL"] > 0 and tostring(math.round(p2.Misc["1v2SoloW"] / (p2.Misc["1v2SoloW"] + p2.Misc["1v2SoloL"]) * 100 * 100) / 100) or 0
	v31.Text = "1v2 solo winrate: " .. v37 .. "%"
	v31 = misc["1v2SoloFirstWinrate"]
	v37 = p2.Misc["1v2FirstSoloL"] > 0 and tostring(math.round(p2.Misc["1v2FirstSoloW"] / (p2.Misc["1v2FirstSoloW"] + p2.Misc["1v2FirstSoloL"]) * 100 * 100) / 100) or 0
	v31.Text = "1v2 solo while first winrate: " .. v37 .. "%"
end

userInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Delete then
		local v40 = networkInvokeServer("GetAnalytics", config.CURRENT_BALANCE_PATCH)

		print("Got data")

		if v40 then
			LoadAnalytics(v40)
			analyticsGui.Enabled = true
		end
	end
end)
analyticsGui.Window.ShowCards.MouseButton1Click:Connect(function()
	cards.Visible = true
	misc.Visible = false
end)
analyticsGui.Window.ShowMisc.MouseButton1Click:Connect(function()
	misc.Visible = true
	cards.Visible = false
end)
analyticsGui.Window.Close.MouseButton1Click:Connect(function()
	analyticsGui.Enabled = false
end)

local function SortCardsByValue(p7)
	for _, v in pairs(cards.Stuff:GetChildren()) do
		if v:IsA("GuiObject") then
			v.LayoutOrder = v[p7].Value * -1
		end
	end
end

cards.Header.Title.MouseButton1Click:Connect(function()
	SortCardsByValue("AlphabeticalValue")
end)
cards.Header.PlayCount.MouseButton1Click:Connect(function()
	SortCardsByValue("PlayCountValue")
end)
cards.Header.Winrate.MouseButton1Click:Connect(function()
	SortCardsByValue("WinrateValue")
end)
cards.Header.UniqueUsers.MouseButton1Click:Connect(function()
	SortCardsByValue("UniqueUsersValue")
end)

return {}
