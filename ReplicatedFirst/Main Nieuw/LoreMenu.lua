



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("Chat")
game:GetService("RunService")

local animation = require(replicatedStorage.Animation)
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
require(game.ReplicatedStorage.FoilEffect)
require(script.Parent.NonGameCard)

local sleeves = require(script.Parent.Sleeves).sleeves

require(game.ReplicatedStorage.Packs)
require(game.ReplicatedStorage.CONFIG)
require(script.Parent.Contextualize)
require(script.Parent.RobuxService)

local loreCategory = require(game.ReplicatedStorage.LoreCategory)

require(replicatedStorage.spr)

local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local loreMenu = LocalPlayer.PlayerGui:WaitForChild("LoreMenu")
local listHolder = loreMenu:WaitForChild("ListHolder")
local buttonHolder = loreMenu:WaitForChild("ButtonHolder")
local entryHolder = loreMenu:WaitForChild("EntryHolder")
local loreMenuTemplates = loreMenu.Templates
local u19: boolean = false
local s1 = "Beckoned Masters"
local t1 = {}

local function GenerateLoreTab(p1)
	for _, v in pairs(listHolder:GetChildren()) do
		if not v:IsA("UIGridLayout") then
			v:Destroy()
		end
	end

	data.GetQuestStats()

	local loreEntries = require(game.ReplicatedStorage.LoreEntries)

	for k, v in pairs(loreCategory) do
		if k == p1 then
			for k2, iterValue in pairs(v.Entries) do
				local u33: boolean = true
				local clone = loreMenuTemplates.EntryTemplate:Clone()

				if iterValue.Card then
					local v35 = cardLibrary[iterValue.Card]

					if v35 then
						clone.ImageButton.CardTemplate.Image = "rbxassetid://" .. v35.Id

						if not t1[v35.LibraryIndex] then
							clone.ImageButton.Title.Text = "Locked"
							clone.ImageButton.BackgroundColor3 = Color3.new(0.364706, 0.109804, 0.113725)
							u33 = false
						else
							clone.ImageButton.Title.Text = k2
						end
					else
						warn(iterValue.Card .. " is not a valid card!")
						clone.ImageButton.Title.Text = "Locked"
						u33 = false
					end
				end

				clone.Parent = listHolder
				clone.Visible = true
				clone.LayoutOrder = iterValue.Order or 99
				clone.ImageButton.MouseEnter:Connect(function()
					audioService.PlaySound("Mouse Hover")
				end)
				clone.ImageButton.MouseButton1Down:Connect(function()
					if u19 == true then
						return
					end

					u19 = true

					if u33 == true then
						audioService.PlaySound("lock")

						local animationAnimateAsync = animation.AnimateAsync
						local v58 = UDim2.fromScale(0.05, -1.5)

						animationAnimateAsync(listHolder, { Position = v58 }, 0.6, "Out", "Quart")

						local animateAsync = animation.AnimateAsync

						v58 = UDim2.fromScale(0.05, -1.5)
						animateAsync(buttonHolder, { Position = v58 }, 0.6, "Out", "Quart")

						local v60 = animation.AnimateAsync

						v58 = UDim2.fromScale(0.05, 0.18)
						v60(entryHolder, { Position = v58 }, 0.6, "Out", "Quart")

						if loreEntries[k2] then
							entryHolder.Description.Text = tostring(loreEntries[k2])
						else
							entryHolder.Description.Text = "Somehow you got to an entry that doesn't actually exist. sorry :("
						end

						entryHolder.Card.Image = "rbxassetid://" .. cardLibrary[iterValue.Card].Id
					else
						audioService.PlaySound("DeniedSound")
					end

					print("Open Tab functionality here")
					task.spawn(function()
						task.wait(1)
						u19 = false
					end)
				end)
				clone.ImageButton.CardTemplate.MouseButton1Down:Connect(function()
					if u19 == true then
						return
					end

					u19 = true

					if u33 == true then
						audioService.PlaySound("lock")

						local animationAnimateAsync = animation.AnimateAsync
						local v62 = UDim2.fromScale(0.05, -1.5)

						animationAnimateAsync(listHolder, { Position = v62 }, 0.6, "Out", "Quart")

						local animateAsync = animation.AnimateAsync

						v62 = UDim2.fromScale(0.05, -1.5)
						animateAsync(buttonHolder, { Position = v62 }, 0.6, "Out", "Quart")

						local v64 = animation.AnimateAsync

						v62 = UDim2.fromScale(0.05, 0.18)
						v64(entryHolder, { Position = v62 }, 0.6, "Out", "Quart")

						if loreEntries[k2] then
							entryHolder.Description.Text = tostring(loreEntries[k2])
						else
							entryHolder.Description.Text = "Somehow you got to an entry that doesn't actually exist. sorry :("
						end

						entryHolder.Card.Image = "rbxassetid://" .. cardLibrary[iterValue.Card].Id
					else
						audioService.PlaySound("DeniedSound")
					end

					print("Open Tab functionality here")
					task.spawn(function()
						task.wait(1)
						u19 = false
					end)
				end)
			end
		end
	end

	s1 = p1

	local children = listHolder:GetChildren()

	listHolder.CanvasSize = UDim2.new(0, 0, #children / 4, 0)
end
local function GetAllCards(p2)
	local t2: {[any]: any} = {}

	for k, v in pairs(p2[3]) do
		if not cardLibrary[k] then
			warn("GetAllCards: no such card", k)
		else
			t2[k] = v["0"]
		end
	end

	return t2
end
local function HideMenu()
end

loreMenu.Title.Back.ButtonBackground.MouseEnter:Connect(function()
	audioService.PlaySound("Mouse Hover")
end)
loreMenu.Title.Back.ButtonBackground.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")
	transition.ToggleBlack(1, 0.3)
	audioService.ChangeSong("Lobby")
	client.UnmuteWorld()
	client.SetControlsEnabled(true)
	task.spawn(transition.HideBattleBack)
	loreMenu.Enabled = false
	task.spawn(function()
		transition.ToggleBlack(-1, 0.3)
		handy.Show()
		handy.Expand()
	end)
end)
entryHolder.Back.ButtonBackground.MouseEnter:Connect(function()
	audioService.PlaySound("Mouse Hover")
end)
entryHolder.Back.ButtonBackground.MouseButton1Click:Connect(function()
	audioService.PlaySound("lock")

	local animationAnimateAsync = animation.AnimateAsync
	local v42 = UDim2.fromScale(0.05, 0.275)

	animationAnimateAsync(listHolder, { Position = v42 }, 0.6, "Out", "Quart")

	local animateAsync = animation.AnimateAsync

	v42 = UDim2.fromScale(0.05, 0.17)
	animateAsync(buttonHolder, { Position = v42 }, 0.6, "Out", "Quart")

	local v44 = animation.AnimateAsync

	v42 = UDim2.fromScale(0.05, 2.18)
	v44(entryHolder, { Position = v42 }, 0.6, "Out", "Quart")
end)

return {
	OpenMenu = function(_)
		transition.ToggleBlack(1, 0.3)
		client.MuteWorld()
		transition.SetCameraPosition("LoreCamera")
		audioService.ChangeSong("HistoryMenu")
		loreMenu.Enabled = true
		handy.Hide()
		client.SetControlsEnabled(false)

		for _, v in pairs(listHolder:GetChildren()) do
			if not v:IsA("UIGridLayout") then
				v:Destroy()
			end
		end

		for _, v in pairs(buttonHolder:GetChildren()) do
			if not v:IsA("UIGridLayout") then
				v:Destroy()
			end
		end

		for k, v in pairs(loreCategory) do
			local clone = loreMenuTemplates.TabButtonTemplate:Clone()

			clone.Text = tostring(k)
			clone.Name = tostring(k)
			clone.LayoutOrder = v.Order or 99
			clone.Visible = true
			clone.Parent = buttonHolder
			clone.MouseEnter:Connect(function()
				audioService.PlaySound("Mouse Hover")
			end)
			clone.MouseButton1Down:Connect(function()
				if u19 == true then
					return
				end

				audioService.PlaySound("lock")
				u19 = true

				local text: string = tostring(clone.Name)

				GenerateLoreTab(text)
				task.spawn(function()
					task.wait(1)
					u19 = false
				end)
			end)
		end

		t1 = GetAllCards(data.Load())

		local animationAnimateAsync = animation.AnimateAsync
		local v54 = UDim2.fromScale(0.05, 0.275)

		animationAnimateAsync(listHolder, { Position = v54 }, 0.6, "Out", "Quart")

		local animateAsync = animation.AnimateAsync

		v54 = UDim2.fromScale(0.05, 0.17)
		animateAsync(buttonHolder, { Position = v54 }, 0.6, "Out", "Quart")

		local v56 = animation.AnimateAsync

		v54 = UDim2.fromScale(0.05, 2.18)
		v56(entryHolder, { Position = v54 }, 0.6, "Out", "Quart")
		GenerateLoreTab(s1)
		transition.ToggleBlack(-1, 0.3)
	end
}
