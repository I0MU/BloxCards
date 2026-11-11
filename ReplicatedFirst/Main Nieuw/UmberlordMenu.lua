



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
game:GetService("RunService")
require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client
local cardLibrary = (function()
	local real = require(game.ReplicatedStorage.CardLibrary)
	return setmetatable({}, {
		__index = function(_, name)
			local c = real[name]
			if c == nil and type(name) == "string" then return { Id = 0, Name = name } end
			return c
		end,
		__pairs = function() return pairs(real) end,
	})
end)()

require(game.ReplicatedStorage.Maid)
require(game.ReplicatedStorage.FoilEffect)

local nonGameCard = require(script.Parent.NonGameCard)
local sleeves = require(script.Parent.Sleeves).sleeves

require(game.ReplicatedStorage.Packs)

local config = require(game.ReplicatedStorage.CONFIG)

require(script.Parent.Contextualize)
require(script.Parent.RobuxService)

local weeklyFloorRewards = require(game.ReplicatedStorage.FloorMode.WeeklyFloorRewards)
local permaFloorRewards = require(game.ReplicatedStorage.FloorMode.PermaFloorRewards)
local effects = require(game.ReplicatedStorage.Effects)
local v18 = require(game.ReplicatedStorage.Maid).new()
local spr = require(replicatedStorage.spr)
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local umberlordMenu = LocalPlayer.PlayerGui:WaitForChild("UmberlordMenu")
local menuHolder = umberlordMenu:WaitForChild("MenuHolder")
local templates = menuHolder.Parent.Templates

local function ConvertSecondsToStringDaysHoursMinutes(p1)
	if p1 >= 86400 then
		local floored = math.floor(p1 / 86400)
		local floored2 = math.floor(p1 % 86400 / 3600)

		return floored .. " Days " .. floored2 .. " Hours"
	end

	local floored = math.floor(p1 / 3600)
	local floored3 = math.floor(p1 % 3600 / 60)

	return floored .. " Hours " .. floored3 .. " Minutes"
end
local function UpdateMenu()
	local v34 = networkInvokeServer("GetQuestInfo")
	local v35 = cardLibrary[v34[8].WeekModifier]
	local weekDeck = v34[8].WeekDeck
	local weekFloorReached = v34[8].WeekFloorReached
	local permaFloorReached = v34[8].PermaFloorReached

	if not v35 then
		warn("Mod does not exist as a card")

		return
	end

	menuHolder.ModFrame.Card.Image = "rbxassetid://" .. tostring(v35.Id)
	nonGameCard.BindInspect(menuHolder.ModFrame.Card, v35)
	menuHolder.DeckFrame.Card.Image = "rbxassetid://" .. tostring(data.CurrentSleeveId())
	menuHolder.DeckFrame.Card.DeckName.Text = weekDeck.Name
	menuHolder.DeckFrame.Card.MouseButton1Click:Connect(function()
		networkClient.QuickShowRewards({ Cards = weekDeck.Deck })
	end)
	v18:DoCleaning()
	v35 = {
		None = "127637595259633",
		Bronze = "116098550081413",
		Silver = "125158669027084",
		Gold = "93322696559702",
		Diamond = "87245129587780",
		Rainbow = "105686556264454"
	}
	menuHolder.WeekWaveCounter.Text = "Highest wave reached this week: " .. tostring(weekFloorReached)
	menuHolder.WaveCounter.Text = "(Highest wave reached overall: " .. tostring(permaFloorReached) .. ")"

	local s1: string = "None"

	if weekFloorReached >= 25 then
		s1 = "Rainbow"
	elseif weekFloorReached >= 20 then
		s1 = "Diamond"
	elseif weekFloorReached >= 15 then
		s1 = "Gold"
	elseif weekFloorReached >= 10 then
		s1 = "Silver"
	elseif weekFloorReached >= 5 then
		s1 = "Bronze"
	end

	menuHolder.Medal.Image = "rbxassetid://" .. tostring(v35[s1])

	local MedalSize = menuHolder.Medal.Size

	if weekFloorReached >= 5 then
		v18:GiveTask(menuHolder.Medal.MouseButton1Down:Connect(function()
			audioService.PlaySound("FlickCoin")

			if weekFloorReached >= 25 then
				local randomNumber = math.random(1, 3)

				audioService.PlaySound("Foil" .. randomNumber)
			end

			spr.stop(menuHolder.Medal)

			local sprTarget = spr.target
			local menuHolderMedal = menuHolder.Medal
			local v65 = UDim2.fromScale(MedalSize.X.Scale * 1.2, MedalSize.Y.Scale * 1.2)
			local randomNumber = math.random(-20, 20)

			sprTarget(menuHolderMedal, 0.1, 1, { Size = v65, Rotation = randomNumber })
			task.wait(0.4)
			spr.target(menuHolder.Medal, 0.2, 1, { Rotation = 0, Size = MedalSize })
		end))
	end

	for k, v in pairs(v34[8].PermaRedeemed) do
		if permaFloorReached >= k * 5 and not v then
			menuHolder.PermaRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(117, 221, 124)
			v18:GiveTask(menuHolder.PermaRewards["Challenge" .. k].Button.MouseButton1Click:Connect(function()
				if networkInvokeServer("RedeemPermaFloorReward", k) then
					UpdateMenu()
				end
			end))

			local timestamp = tick()
			local runService: RunService = game:GetService("RunService")

			v18:GiveTask(runService.RenderStepped:Connect(function()
				if tick() - timestamp > 1 and umberlordMenu.Enabled == true then
					timestamp = tick()
					effects.Pulse(umberlordMenu.Effect, nil, menuHolder.PermaRewards["Challenge" .. k].Button)
				end
			end))
		else
			v18:GiveTask(menuHolder.PermaRewards["Challenge" .. k].Button.MouseButton1Click:Connect(function()
				networkClient.QuickShowRewards(permaFloorRewards[k])
			end))

			if permaFloorReached >= k * 5 then
				menuHolder.PermaRewards["Challenge" .. k].IsClaimed.Visible = true
				menuHolder.PermaRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(0, 81, 255)
			else
				menuHolder.PermaRewards["Challenge" .. k].IsClaimed.Visible = false
				menuHolder.PermaRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(0, 176, 255)
			end
		end

		v18:GiveTask(menuHolder.PermaRewards["Challenge" .. k].Button.MouseEnter:Connect(function()
			audioService.PlaySound("click2")
			menuHolder.PermaRewards["Challenge" .. k].Button.ImageColor3 = Color3.fromRGB(117, 117, 117)
		end))
		v18:GiveTask(menuHolder.PermaRewards["Challenge" .. k].Button.MouseLeave:Connect(function()
			menuHolder.PermaRewards["Challenge" .. k].Button.ImageColor3 = Color3.fromRGB(255, 255, 255)
		end))
	end

	for k, v in pairs(v34[8].WeekRedeemed) do
		if weekFloorReached >= k * 5 and not v then
			menuHolder.WeeklyRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(117, 221, 124)
			v18:GiveTask(menuHolder.WeeklyRewards["Challenge" .. k].Button.MouseButton1Click:Connect(function()
				if networkInvokeServer("RedeemWeeklyFloorReward", k) then
					UpdateMenu()
				end
			end))

			local timestamp = tick()
			local runService: RunService = game:GetService("RunService")

			v18:GiveTask(runService.RenderStepped:Connect(function()
				if tick() - timestamp > 1 and umberlordMenu.Enabled == true then
					timestamp = tick()
					effects.Pulse(umberlordMenu.Effect, nil, menuHolder.WeeklyRewards["Challenge" .. k].Button)
				end
			end))
		else
			v18:GiveTask(menuHolder.WeeklyRewards["Challenge" .. k].Button.MouseButton1Click:Connect(function()
				networkClient.QuickShowRewards(weeklyFloorRewards[k])
			end))

			if weekFloorReached >= k * 5 then
				menuHolder.WeeklyRewards["Challenge" .. k].IsClaimed.Visible = true
				menuHolder.WeeklyRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(131, 59, 0)
			else
				menuHolder.WeeklyRewards["Challenge" .. k].IsClaimed.Visible = false
				menuHolder.WeeklyRewards["Challenge" .. k].BackgroundColor3 = Color3.fromRGB(255, 136, 0)
			end
		end

		v18:GiveTask(menuHolder.WeeklyRewards["Challenge" .. k].Button.MouseEnter:Connect(function()
			audioService.PlaySound("click2")
			menuHolder.WeeklyRewards["Challenge" .. k].Button.ImageColor3 = Color3.fromRGB(117, 117, 117)
		end))
		v18:GiveTask(menuHolder.WeeklyRewards["Challenge" .. k].Button.MouseLeave:Connect(function()
			menuHolder.WeeklyRewards["Challenge" .. k].Button.ImageColor3 = Color3.fromRGB(255, 255, 255)
		end))
	end

	local n1 = config.FIRST_TICK + config.WEEKLY_RESET_TICK * (v34[3].LastLoginWeek + 1)
	local menuHolderNextWeekTimer = menuHolder.NextWeekTimer
	local timestamp = os.time()
	local n2 = n1 - timestamp
	local s2

	if n2 >= 86400 then
		local floored = math.floor(n2 / 86400)
		local floored4 = math.floor(n2 % 86400 / 3600)

		s2 = floored .. " Days " .. floored4 .. " Hours"
	else
		local floored = math.floor(n2 / 3600)
		local floored5 = math.floor(n2 % 3600 / 60)

		s2 = floored .. " Hours " .. floored5 .. " Minutes"
	end

	menuHolderNextWeekTimer.Text = "New Trial in: " .. s2
end
local function HideMenu()
	if umberlordMenu.Enabled == false then
		return
	end

	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	umberlordMenu.Enabled = false
	transition.HideBattleBack()
	transition.ToggleBlack(-1, 0.3)
	audioService.ChangeSong("Lobby")
	handy.Show()
end

menuHolder.Start.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")

	local text: string = tostring(LocalPlayer.userId)

	network.FireServer("RequestBattle", {
		Name = "Umberlord's Trial",
		Parent = true,
		Duelist = "UmberlordTrial",
		QuickIntro = true,
		FloorBattle = true,
		userId = -999999 - text
	})
	umberlordMenu.Enabled = false
	transition.HideBattleBack()
end)
menuHolder.Start.MouseEnter:Connect(function()
	audioService.PlaySound("click2")
end)

local CardSize = menuHolder.DeckFrame.Card.Size

menuHolder.DeckFrame.Card.MouseEnter:Connect(function()
	audioService.PlaySound("ui_hover")
	spr.stop(menuHolder.DeckFrame.Card)

	local sprTarget = spr.target
	local card = menuHolder.DeckFrame.Card
	local v61 = UDim2.fromScale(CardSize.X.Scale * 1.1, CardSize.Y.Scale * 1.1)

	sprTarget(card, 0.1, 4, { Size = v61 })
end)
menuHolder.DeckFrame.Card.MouseLeave:Connect(function()
	spr.stop(menuHolder.DeckFrame.Card)
	spr.target(menuHolder.DeckFrame.Card, 0.2, 4, { Size = CardSize })
end)
umberlordMenu.Title.Back.MouseButton1Click:Connect(HideMenu)

return {
	OpenMenu = function()
		audioService.PlaySound("click1")
		task.spawn(handy.Hide)
		UpdateMenu()
		transition.ToggleBlack(1, 0.3)
		transition.ShowBattleBack("UmberlordsMenu")
		audioService.ChangeSong("UmberMenu")
		umberlordMenu.Enabled = true
		transition.ToggleBlack(-1, 0.3)
	end,
	HideMenu = HideMenu
}
