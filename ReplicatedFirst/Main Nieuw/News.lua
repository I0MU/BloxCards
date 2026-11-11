



local t1: {[any]: any} = {}
local u2: boolean = false
local LocalPlayer = game.Players.LocalPlayer
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local newsGui = LocalPlayer.PlayerGui:WaitForChild("NewsGui")
local audioService = require(replicatedStorage.AudioService)
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
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local newPatchNotes = require(replicatedStorage.NewPatchNotes)
local animation = require(replicatedStorage.Animation)
local textFormat = require(script.Parent.TextFormat)

local function InitializePatchNotes(p1, p2)
	if p2 then
		p1 = newsGui
	end

	local news = p1:WaitForChild("News")
	local notesScroller = news:WaitForChild("NotesScroller")
	local patchNotesScroller = news:WaitForChild("PatchNotesScroller")

	function t1.Text(p3, layoutOrder, parent)
		local clone = p1.Templates.BlockText:Clone()

		clone.Parent = parent
		clone.TextLabel.Text = textFormat.FormatText(p3, true) .. "<br/>"
		clone.LayoutOrder = layoutOrder
		clone.Visible = true
	end
	function t1.Title(p6, layoutOrder, parent)
		local clone = p1.Templates.BlockTitle:Clone()

		clone.Parent = parent
		clone.TextLabel.Text = p6
		clone.LayoutOrder = layoutOrder
		clone.Visible = true
	end
	local function ConstructPatchNotes(p9)
		for _, v in pairs(patchNotesScroller:GetChildren()) do
			if v:IsA("GuiObject") then
				v:Destroy()
			end
		end

		for k, v in pairs(p9) do
			t1[v.Type or "Text"](v.Text, k, patchNotesScroller)
		end
	end

	for k, v in pairs(newPatchNotes) do
		local clone = p1.Templates.Template_Button:Clone()

		clone.Parent = notesScroller.NotesHolder
		clone.Title.Text = v.Title
		clone.Subtitle.Text = v.Subtitle
		clone.Date.Text = v.Date
		clone.Card.Image = "rbxassetid://" .. cardLibrary[v.Card or "TY3"].Id
		clone.MouseButton1Click:Connect(function()
			if not u2 then
				u2 = true
				ConstructPatchNotes(v["Patch Notes"])
				patchNotesScroller.CanvasPosition = Vector2.new(0, 0)
				audioService.PlaySound("Draw")

				local animationAnimateAsync = animation.AnimateAsync
				local v40 = UDim2.fromScale(-1, 0.1)

				animationAnimateAsync(notesScroller, { Position = v40 }, 0.3, "Out", "Quint")

				local animateAsync = animation.AnimateAsync

				v40 = UDim2.fromScale(0.05, 0.1)
				animateAsync(patchNotesScroller, { Position = v40 }, 0.3, "Out", "Quint")
			end
		end)
		clone.LayoutOrder = k * -1
		clone.Visible = true
	end

	news.Close.MouseButton1Click:Connect(function()
		if u2 then
			u2 = false
			audioService.PlaySound("Draw")

			local animationAnimateAsync = animation.AnimateAsync
			local v43 = UDim2.fromScale(0.05, 0.1)

			animationAnimateAsync(notesScroller, { Position = v43 }, 0.3, "Out", "Quint")

			local animationAnimate = animation.Animate

			v43 = UDim2.fromScale(1.1, 0.1)
			animationAnimate(patchNotesScroller, { Position = v43 }, 0.3, "Out", "Quint")

			return
		end

		if not p1.Parent:IsA("Part") then
			p1.Enabled = false
			audioService.PlaySound("click3")
			handy.Show()
		end
	end)
end

InitializePatchNotes(newsGui)

for _, v in pairs(workspace.PatchNotes:GetChildren()) do
	InitializePatchNotes(v.NewsGui)
end

local client = require(script.Parent.Network).client

handyHandy.PatchNotes.MouseButton1Click:Connect(function()
	if client.IsSubPlayer() then
		client.WarningMsg("You are in a party, you will enter the game when your party leader creates one.")

		return
	end

	newsGui.Enabled = true
	audioService.PlaySound("ClickSound")
	handy.Hide()
end)

return {}
