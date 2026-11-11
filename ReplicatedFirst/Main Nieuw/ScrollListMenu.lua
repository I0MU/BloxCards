



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
game:GetService("RunService")

local promise = require(game.ReplicatedStorage.Promise)

require(replicatedStorage.Animation)

local transition = require(script.Parent.Transition)
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local audioService = require(replicatedStorage.AudioService)
local data = require(script.Parent.Data)
local client = require(script.Parent.Network).client
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

local foilEffect = require(game.ReplicatedStorage.FoilEffect)
local nonGameCard = require(script.Parent.NonGameCard)
local sleeves = require(script.Parent.Sleeves).sleeves
local packs = require(game.ReplicatedStorage.Packs)

require(game.ReplicatedStorage.CONFIG)
require(script.Parent.Contextualize)
require(script.Parent.RobuxService)

local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer

require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local scrollMenu = LocalPlayer.PlayerGui:WaitForChild("ScrollMenu")
local holder = scrollMenu:WaitForChild("Holder")
local buttonHolder = scrollMenu:WaitForChild("ButtonHolder")
local window = scrollMenu:WaitForChild("Window")
local scrollMenuTemplates = scrollMenu.Templates
local u24: boolean = false
local module: {[any]: any} = {}

function module.OpenMenu(p1, p2, p3, p4, p5, p6, p7, p8)
	handy.Hide()
	client.SetControlsEnabled(false)
	client.MuteWorld()

	for _, v in pairs(holder:GetChildren()) do
		if not v:IsA("UIListLayout") then
			v:Destroy()
		end
	end

	for _, v in pairs(buttonHolder:GetChildren()) do
		if not v:IsA("UIGridLayout") then
			v:Destroy()
		end
	end

	if p1 == "Cafe" then
		module[p1](p2, p3, p4, p5, p6, p7, p8)

		return
	end

	module[p1]()
end
local function HideMenu()
end

scrollMenu.Title.Back.ButtonBackground.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")
	transition.ToggleBlack(1, 0.3)
	client.SetControlsEnabled(true)
	client.UnmuteWorld()
	audioService.ChangeSong("Lobby")
	task.spawn(transition.HideBattleBack)
	scrollMenu.Enabled = false
	task.spawn(function()
		transition.ToggleBlack(-1, 0.3)
		handy.Show()
		handy.Expand()
	end)
end)

local function DestroyAllGuiObjectChildren(p9)
	for _, v in pairs(p9:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end
end

local t2 = {}

local function menutext(p10, p11)
	if not p10 then
		print("no dialogue stupid")

		return
	end

	DestroyAllGuiObjectChildren(window.TextHolder)

	local t3: {[any]: any} = {}
	local parts = string.split(p10, " ")
	local s1: string = ""
	local clone = scrollMenuTemplates.LineTemplate:Clone()

	clone.Size = UDim2.fromScale(2, 0.275)
	clone.Parent = window.TextHolder

	local function NewLine(p12)
		table.insert(t3, s1)

		if p12 then
			s1 = p12 .. " "
		end
	end

	for _, v in pairs(parts) do
		local s2: string = s1

		clone.Text = s2 .. v

		if clone.TextBounds.X > window.TextHolder.AbsoluteSize.X then
			table.insert(t3, s1)

			if v then
				s1 = v .. " "
			end
		else
			s1 = clone.Text .. " "
		end
	end

	table.insert(t3, s1)

	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}

	for k, v in pairs(t3) do
		local clone2 = scrollMenuTemplates.LineTemplate:Clone()

		if p10.TextScale then
			clone2.Size = UDim2.fromScale(0.98, p10.TextScale)
		end

		clone2.Text = v
		clone2.LayoutOrder = k
		clone2.MaxVisibleGraphemes = 0
		clone2.Visible = true
		clone2.Parent = window.TextHolder
		table.insert(t4, clone2)
	end

	t2 = promise.new(function(p13, _, _)
		for i = 1, #t3 do
			local n1: number = 0
			local v117 = t3[i]
			local v118 = t4[i]
			local v119 = string.len(v118.ContentText)

			for iterFirst, iterSecond in utf8.graphemes(v117) do
				v118.ContentText:sub(iterFirst, iterSecond)
				n1 += 1
				v118.MaxVisibleGraphemes = n1

				if v119 > v118.MaxVisibleGraphemes and n1 % 2 == 0 then
					audioService.PlaySound(p11)
				end

				task.wait(0.016)
			end
		end

		task.wait(0.2)
		p13()
	end):finally(function(_, _, _)
		for i = 1, #t3 do
			t4[i].MaxVisibleGraphemes = -1
		end

		t2 = nil
	end)
end
local function GeneratePuzzleTab(p19)
	for _, v in pairs(holder:GetChildren()) do
		if not v:IsA("UIListLayout") then
			v:Destroy()
		end
	end

	client.UpdateStatsData()
	data.GetQuestStats()

	local n1: number = 0
	local v66

	repeat
		task.wait(0.1)
		n1 += 1
		v66 = data.GetQuestStats()
	until not not v66 or n1 >= 10

	local puzzles = require(game.ReplicatedStorage.Puzzles)
	local n2: number = 0

	for k, v in pairs(puzzles) do
		if k == p19 then
			for _, iterValue in pairs(v) do
				local clone = scrollMenuTemplates.PuzzleTemplate:Clone()

				if iterValue.Card then
					local v74 = cardLibrary[iterValue.Card]

					if v74 then
						clone.CardTemplate.Image = "rbxassetid://" .. v74.Id
						nonGameCard.BindInspect(clone.CardTemplate, v74)

						if v66 and v66["BOT_WINS_" .. iterValue.PuzzleDuelist] and v66["BOT_WINS_" .. iterValue.PuzzleDuelist] >= 1 then
							clone.Completed.Visible = true
							n2 += 1
						end
					else
						warn(iterValue.Card .. " is not a valid card!")
					end
				elseif iterValue.Pack then
					for _, iterValue2 in pairs(packs) do
						local u77: boolean = false
						local v78 = nil
						local parts = string.split(iterValue.Pack, "-Foil")

						if iterValue2.Name == iterValue.Pack then
							v78 = iterValue2
						end

						if iterValue2.Name == parts[1] and string.find(iterValue.Pack, "-Foil") then
							v78 = iterValue2
							u77 = true
						end

						if v78 then
							clone.CardTemplate.Image = "rbxassetid://" .. v78.CardPackId

							if u77 then
								foilEffect(clone.CardTemplate)
							end
						end

						if v66["BOT_WINS_" .. iterValue.PuzzleDuelist] and v66["BOT_WINS_" .. iterValue.PuzzleDuelist] >= 1 then
							clone.Completed.Visible = true
						end
					end
				end

				clone.Description.Text = iterValue.Description
				clone.Parent = holder

				if iterValue.Order then
					clone.LayoutOrder = iterValue.Order
				end

				clone.Visible = true
				clone.Start.MouseEnter:Connect(function()
					audioService.PlaySound("click2")
				end)
				clone.Start.MouseButton1Down:Connect(function()
					if u24 == true then
						return
					end

					audioService.PlaySound("click1")
					u24 = true

					local name = iterValue.PuzzleName
					local text: string = tostring(LocalPlayer.userId)

					network.FireServer("RequestPuzzle", {
						Parent = true,
						Name = name,
						userId = -999999 - text,
						Duelist = iterValue.PuzzleDuelist
					})
					scrollMenu.Enabled = false
					transition.HideBattleBack()
					task.spawn(function()
						task.wait(5)
						u24 = false
					end)
				end)
			end
		end
	end

	local children = holder:GetChildren()

	holder.CanvasSize = UDim2.new(0, 0, #children / 4, 0)

	local connection

	if p19 == "Card Puzzles" then
		print("Card puzzles tab")

		local clone = scrollMenuTemplates.PuzzleCompleteReward:Clone()

		clone.Parent = scrollMenu
		clone.Visible = true
		clone.Name = "PuzzleCompleteReward"

		local v83 = cardLibrary["Blox Cards"]

		clone.CardTemplate.Image = "rbxassetid://" .. v83.Id
		nonGameCard.BindInspect(clone.CardTemplate, v83)

		if n2 >= 20 then
			clone.Start.Visible = true
			clone.CompleteCount.Visible = false

			if v66 and v66.ClaimedCardPuzzlesReward and v66.ClaimedCardPuzzlesReward >= 1 then
				clone.Start.Text = "Claimed!"
				clone.Start.BackgroundColor3 = Color3.new(0.243137, 0.505882, 0.129412)
				clone.Completed.Visible = true

				return
			end

			connection = nil
			connection = clone.Start.MouseButton1Down:Connect(function()
				audioService.PlaySound("click1")

				if networkInvokeServer("QuestAward", "CompletedCardPuzzles") then
					clone.Start.Text = "Claimed!"
					clone.Start.BackgroundColor3 = Color3.new(0.243137, 0.505882, 0.129412)
					clone.Completed.Visible = true
					client.ShowRewards({
						Cards = { ["Blox Cards"] = 1 }
					})
					connection:Disconnect()
				end
			end)
			clone.Start.MouseEnter:Connect(function()
				audioService.PlaySound("click2")
			end)

			return
		end

		connection = clone.CompleteCount
		connection.Text = n2 .. "/20"

		return
	end

	connection = scrollMenu

	for _, v in pairs(connection:GetChildren()) do
		if v.Name == "PuzzleCompleteReward" then
			v:Destroy()
		end
	end
end
local function GenerateCafeTab(p20, p21, p22)
	for _, v in pairs(holder:GetChildren()) do
		if not v:IsA("UIListLayout") then
			v:Destroy()
		end
	end

	client.UpdateStatsData()
	data.GetQuestStats()

	local n1: number = 0

	repeat
		task.wait(0.1)
		n1 += 1
	until not not data.GetQuestStats() or n1 >= 10

	local drinks = require(game.ReplicatedStorage.Drinks)

	for k, v in pairs(drinks) do
		if k == p20 then
			menutext(v.Dialog, "BartenderTalk")

			for _, iterValue in pairs(v) do
				local clone = scrollMenuTemplates.CafeTemplate:Clone()

				if iterValue.Card then
					local v98 = cardLibrary[iterValue.Card]

					if v98 then
						clone.CardTemplate.Image = "rbxassetid://" .. v98.Id
						nonGameCard.BindInspect(clone.CardTemplate, v98)
					else
						warn(iterValue.Card .. " is not a valid card!")
					end

					clone.Description.Text = iterValue.Description
					clone.Start.Text = iterValue.Cost .. " BB"
					clone.Parent = holder
				end

				if iterValue.Order then
					clone.LayoutOrder = iterValue.Order
				end

				clone.Visible = true
				clone.Start.MouseEnter:Connect(function()
					audioService.PlaySound("click2")
				end)
				clone.Start.MouseButton1Down:Connect(function()
					if u24 == true then
						return
					end

					audioService.PlaySound("click1")
					u24 = true

					local v128 = networkInvokeServer("PurchaseCardFromNPC", iterValue.Card)

					task.spawn(function()
						if v128 == true then
							menutext(iterValue.PurchaseText, p21)

							return
						end

						menutext(p22, p21)
					end)
					task.spawn(function()
						task.wait(2)
						u24 = false
					end)
				end)
			end
		end
	end

	local children = holder:GetChildren()

	holder.CanvasSize = UDim2.new(0, 0, #children / 4, 0)
end
function module.Puzzles()
	transition.ToggleBlack(1, 0.3)
	transition.SetCameraPosition("PuzzleCamera")
	audioService.ChangeSong("HistoryMenu")
	scrollMenu.Enabled = true
	scrollMenu.Title.Title.Text = "Puzzles"

	local puzzles = require(game.ReplicatedStorage.Puzzles)

	for k, _ in pairs(puzzles) do
		local clone = scrollMenuTemplates.TabButtonTemplate:Clone()

		clone.Text = k
		clone.Name = k
		clone.Visible = true
		clone.Parent = buttonHolder
		clone.MouseEnter:Connect(function()
			audioService.PlaySound("click2")
		end)
		clone.MouseButton1Down:Connect(function()
			if u24 == true then
				return
			end

			audioService.PlaySound("click1")
			u24 = true

			local text: string = tostring(clone.Name)

			GeneratePuzzleTab(text)
			task.spawn(function()
				task.wait(2)
				u24 = false
			end)
		end)
	end

	GeneratePuzzleTab("Card Puzzles")
	transition.ToggleBlack(-1, 0.3)
end
function module.Cafe(p23, p24, p25, p26, p27, p28, p29)
	transition.ToggleBlack(1, 0.3)
	transition.SetCameraPosition(p28)
	scrollMenu.Enabled = true
	scrollMenu.Title.Title.Text = p25
	window.Visible = true
	window.Title.Text = p24
	require(game.ReplicatedStorage.Drinks)
	GenerateCafeTab(p23, p27, p29)
	menutext(p26, p27)
	transition.ToggleBlack(-1, 0.3)
end

return module
