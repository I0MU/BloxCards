



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local proximityPromptService: ProximityPromptService = game:GetService("ProximityPromptService")
local contextActionService: ContextActionService = game:GetService("ContextActionService")
local LocalPlayer = game.Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local promise = require(replicatedStorage.Promise)
local animation = require(replicatedStorage.Animation)
local audioService = require(replicatedStorage.AudioService)
local handy = require(script.Parent.Handy)
local network = require(script.Parent.Network)
local transition = require(script.Parent.Transition)
local npcFuncs = require(script.NPCFuncs)
local data = require(script.Parent.Data)
local networkFireServer = network.FireServer
local networkClient = network.client
local visGui = playerGui:WaitForChild("VisGui")
local dialog2 = playerGui:WaitForChild("Dialog2")
local window = dialog2:WaitForChild("Window")
local textHolder = window:WaitForChild("TextHolder")
local optionHolder = window:WaitForChild("OptionHolder")
local title = window:WaitForChild("Title")
local lineTemplate = dialog2:WaitForChild("Templates"):WaitForChild("LineTemplate")
local optionTemplate = dialog2.Templates:WaitForChild("OptionTemplate")
local skip = window:WaitForChild("Backdrop"):WaitForChild("Skip")
local u25 = nil
local u26 = nil
local u27 = nil
local u28 = nil
local u29 = nil
local u30 = false
local oldHeadCFrames = require(script.OldHeadCFrames)
local n1 = 0
local u33: boolean = false

local function DestroyAllGuiObjectChildren(p1)
	for _, v in pairs(p1:GetChildren()) do
		if v:IsA("GuiObject") then
			v:Destroy()
		end
	end
end

local quips = require(game.ReplicatedStorage.Quips)
local u36 = nil

local t1: {[any]: any} = {
	["%playername"] = LocalPlayer.Name,
	["%banreason"] = data.BanReason,
	["%banquip"] = function()
		local v45 = data.BanReason()

		if quips[v45] then
			return quips[v45]
		end

		return "Couldn't keep up, huh?"
	end
}

u36 = function(p2)
	for k, v in pairs(t1) do
		p2 = if typeof(v) == "function" then p2:gsub("%" .. k, v() or " ") else p2:gsub("%" .. k, v)
	end

	return p2
end

local function closeDialog()
	contextActionService:UnbindAction("freezeMovement")

	if not u25 then
		return
	end

	local v49 = u26
	local v50 = u25
	local v51 = u27
	local dontOpenHandy = u25[v49].DontOpenHandy
	local v53 = u28
	local v54 = nil

	if v53 and v53:FindFirstChild("Duelist") and v53.Duelist:FindFirstChild("BotName") then
		v54 = v53.Duelist.BotName.Value
	end

	if oldHeadCFrames[v53] then
		animation.AnimateAsync(v53.Torso.Neck, { C0 = oldHeadCFrames[v53] }, 0.35, "Out", "Quart")
	end

	local npcIcon = v53 and v53:FindFirstChild("NPCIcon", true)

	if npcIcon then
		task.spawn(function()
			npcIcon.Enabled = true
			animation.Animate(npcIcon, { StudsOffset = Vector3.new(0, 2.5, 0) }, 0.4, "Out", "Quart")
		end)
	end

	n1 = tick()

	if v49 == "StartFight" then
		local text: string = tostring(LocalPlayer.userId)

		network.FireServer("RequestBattle", {
			Parent = true,
			Name = v54 or v51,
			userId = -999999 - text,
			Duelist = v51
		})
	elseif v49 == "StartTrade" then
		local text: string = tostring(LocalPlayer.userId)

		network.FireServer("RequestTrade", {
			Parent = true,
			Name = v54 or v51,
			userId = -999999 - text,
			Duelist = v51
		})
	elseif v49 == "StartPuzzle" then
		local text: string = tostring(LocalPlayer.userId)

		network.FireServer("RequestPuzzle", {
			Parent = true,
			Name = v54 or v51,
			userId = -999999 - text,
			Duelist = v51
		})
	elseif v50[v49] and v50[v49].ChallengePuzzle then
		network.FireServer("RequestPuzzle", {
			Parent = true,
			Name = v54 or v50[v49].ChallengePuzzle,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = v50[v49].ChallengePuzzle
		})
	elseif v50[v49] and v50[v49].ChallengeBattle then
		network.FireServer("RequestBattle", {
			Parent = true,
			Name = v54 or v50[v49].ChallengeBattle,
			userId = -999999 - tostring(LocalPlayer.userId),
			Duelist = v50[v49].ChallengeBattle
		})
	else
		u25 = nil

		local animationAnimateAsync = animation.AnimateAsync
		local v60 = UDim2.fromScale(0.5, 1.5)

		animationAnimateAsync(window, { Position = v60 }, 0.6, "In", "Quart")

		if not dontOpenHandy then
			handy.Show()
		end
	end

	u25 = nil
	u26 = nil
	u28 = nil

	if u29 then
		u29:cancel()
		u29 = nil
	end

	window.Visible = false
end

npcFuncs.CloseDialog = closeDialog

local function ShowDialog(p3)
	if not u25 then
		return
	end

	local v62 = u25[p3]

	u30 = v62.CantSkip
	u26 = p3

	if not v62 then
		return
	end

	if v62.Owner then
		if v62.Owner == "%p" then
			title.Text = LocalPlayer.Name
		else
			title.Text = v62.Owner
		end
	end

	local emote = v62.Emote

	if v62.Destination then
		v62.Question = { { Text = "...", Destination = v62.Destination, NPCFunc = v62.NPCFunc } }
	end

	DestroyAllGuiObjectChildren(textHolder)
	DestroyAllGuiObjectChildren(optionHolder)

	local v64 = v62.Text
	local t2 = v62.Question
	local v66 = v62.TextVoice or "textblip"

	if typeof(v64) == "table" then
		local s1 = ""

		for k, v in pairs(v64) do
			s1 = if k == 1 then v else s1 .. " " .. v
		end

		v64 = s1
	end

	local v70 = u36(v64)
	local t3: {[any]: any} = {}
	local parts = string.split(v70, " ")
	local s2: string = ""
	local clone = lineTemplate:Clone()

	clone.Size = UDim2.fromScale(2, 0.275)
	clone.Parent = textHolder

	local function NewLine(p4)
		table.insert(t3, s2)

		if p4 then
			s2 = p4 .. " "
		end
	end

	for _, v in pairs(parts) do
		local s3: string = s2

		clone.Text = s3 .. v

		if clone.TextBounds.X > textHolder.AbsoluteSize.X then
			table.insert(t3, s2)

			if v then
				s2 = v .. " "
			end
		else
			s2 = clone.Text .. " "
		end
	end

	table.insert(t3, s2)

	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}

	for k, v in pairs(t3) do
		local clone2 = lineTemplate:Clone()

		if v62.TextScale then
			clone2.Size = UDim2.fromScale(0.98, v62.TextScale)
		end

		clone2.Text = v
		clone2.LayoutOrder = k
		clone2.MaxVisibleGraphemes = 0
		clone2.Visible = true
		clone2.Parent = textHolder
		table.insert(t4, clone2)
	end

	if v62.EndPoint then
		t2 = { { Text = "..." } }
	end

	local n1: number = 0

	for _, _ in pairs(t2) do
		n1 += 1
	end

	for _, v in pairs(t2) do
		if v.ConditionalDisplay then
			local v89 = network.InvokeServer("CheckForQuestDataRequirement", LocalPlayer, v.ConditionalDisplay, v.ConditionalDisplayValue or 1)

			print(v89)

			if v89 ~= true then
				continue
			end
		end

		local clone3 = optionTemplate:Clone()

		clone3.Size = UDim2.fromScale(1 / n1 - 0.05, 1)
		clone3.TextLabel.Text = v.Text
		clone3.Visible = false
		clone3.BackgroundTransparency = 1
		clone3.TextLabel.TextTransparency = 1

		if v.Destination == "StartFight" or v.StartFight then
			clone3.OptionIcon.Image = "rbxassetid://7544530540"
			clone3.OptionIcon.Visible = true
			clone3.TextLabel.AnchorPoint = Vector2.new(0, 0.5)
			clone3.TextLabel.Position = UDim2.fromScale(0.035, 0.5)
			clone3.TextLabel.Size = UDim2.fromScale(0.8, 0.7)
			clone3.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			clone3.BackgroundColor3 = Color3.fromRGB(255, 150, 30)
		end

		clone3.MouseButton1Click:Connect(function()
			if u33 == true then
				return
			end

			audioService.PlaySound("click1")
			clone3.Visible = false
			task.spawn(function()
				u33 = true
				task.wait(0.5)
				u33 = false
			end)

			if u25 and v.Destination then
				if v.NPCFunc then
					if typeof(v.NPCFunc[1]) == "table" then
						for i = 1, #v.NPCFunc do
							npcFuncs[v.NPCFunc[i][1]](u28, unpack(v.NPCFunc[i], 2))
						end
					else
						npcFuncs[v.NPCFunc[1]](u28, unpack(v.NPCFunc, 2))
					end
				end

				if v.Effect then
					local vEffect = v.Effect

					if not networkClient[vEffect.Type] then
						warn(vEffect.Type .. " doesn't exist!")

						return
					end

					if vEffect.Arguments then
						networkClient[vEffect.Type](unpack(vEffect.Arguments))
					else
						networkClient[vEffect.Type]()
					end

					ShowDialog(v.Destination)

					return
				end

				ShowDialog(v.Destination)

				return
			end

			if v62.EndPointEffect then
				local endPointEffect = v62.EndPointEffect

				if not networkClient[endPointEffect.Type] then
					warn(endPointEffect.Type .. " doesn't exist!")

					return
				end

				if endPointEffect.Arguments then
					networkClient[endPointEffect.Type](unpack(endPointEffect.Arguments))
				else
					networkClient[endPointEffect.Type]()
				end
			end

			if v62.NPCFunc then
				if typeof(v62.NPCFunc[1]) == "table" then
					for i = 1, #v62.NPCFunc do
						npcFuncs[v62.NPCFunc[i][1]](u28, unpack(v62.NPCFunc[i], 2))
					end
				else
					npcFuncs[v62.NPCFunc[1]](u28, unpack(v62.NPCFunc, 2))
				end
			end

			clone3.Visible = false
			closeDialog()
		end)
		clone3.Parent = optionHolder
		table.insert(t5, clone3)
	end

	npcFuncs.ShowDialog = ShowDialog
	u29 = promise.new(function(p5, _, _)
		for i = 1, #t3 do
			local n1: number = 0
			local v131 = t3[i]
			local v132 = t4[i]
			local v133 = string.len(v132.ContentText)

			for iterFirst, iterSecond in utf8.graphemes(v131) do
				v132.ContentText:sub(iterFirst, iterSecond)
				n1 += 1
				v132.MaxVisibleGraphemes = n1

				if v133 > v132.MaxVisibleGraphemes and n1 % 2 == 0 then
					audioService.PlaySound(v66)
				end

				task.wait(0.016)
			end
		end

		task.wait(0.2)

		if not u30 then
			for _, v in pairs(t5) do
				v.Visible = true
			end

			for _, v in pairs(t5) do
				animation.Animate(v, { BackgroundTransparency = 0 }, 0.2, "Out", "Quart")
				animation.AnimateAsync(v.TextLabel, { TextTransparency = 0 }, 0.2, "Out", "Quart")
			end
		end

		p5()
	end):finally(function(_, _, _)
		for i = 1, #t3 do
			t4[i].MaxVisibleGraphemes = -1
		end

		if not u30 then
			for _, v in pairs(t5) do
				if v.Parent then
					v.Visible = true
					v.BackgroundTransparency = 0
					v.TextLabel.TextTransparency = 0
				end
			end
		end

		u29 = nil
	end)
end
function npcFuncs.ToggleDialogVisible(visible)
	window.Visible = visible
end
local function startDialogWithNPC(p12, p13, p14: string)
	if not u25 and not visGui.BattleNew.Visible and not transition.BattleBackVisible() then
		if not handy.Visible() and p12 and p12.Name ~= "ARGBoss" then
			return
		end

		local v95 = p13

		if not v95 then
			v95 = p12:FindFirstChild("Duelist") and p12.Duelist.Value or p12.Name
		end

		if not v95 then
			return
		end

		local v96 = network.InvokeServer("GetBotChallengeMessage", v95)

		if v96.Requirement then
			local Players = game.Players
			local subPlayer = LocalPlayer[LocalPlayer.Name]:FindFirstChild("SubPlayer")
			local subPlayerValue = Players:FindFirstChild(subPlayer.Value)

			if not network.InvokeServer("CheckForQuestDataRequirement", LocalPlayer, v96.Requirement.Type, v96.Requirement.Amount) then
				networkClient.Alert("You have not completed the required content to start this.")

				return
			end

			if subPlayerValue and not network.InvokeServer("CheckForQuestDataRequirement", subPlayerValue, v96.Requirement.Type, v96.Requirement.Amount) then
				networkClient.Alert("Your partner has not completed the required content to start this.")

				return
			end
		end

		if v96.ConditionalStartPoint and network.InvokeServer("CheckForQuestDataRequirement", LocalPlayer, v96.ConditionalStartPoint.RequirementType, v96.ConditionalStartPoint.RequirementAmount) then
			p14 = tostring(v96.ConditionalStartPoint.AlternateStart)
		end

		contextActionService:BindAction("freezeMovement", function()
			return Enum.ContextActionResult.Sink
		end, false, unpack(Enum.PlayerActions:GetEnumItems()))
		handy.Hide()
		proximityPromptService.Enabled = false
		DestroyAllGuiObjectChildren(textHolder)
		DestroyAllGuiObjectChildren(optionHolder)
		u25 = v96
		title.Text = v96.Owner
		window.Position = UDim2.fromScale(0.5, 1.5)

		local animationAnimateAsync = animation.AnimateAsync
		local v101 = UDim2.fromScale(0.5, 0.95)

		animationAnimateAsync(window, { Position = v101 }, 0.6, "Out", "Quint")
		window.Visible = true
		u27 = v95
		u28 = p12

		if p12 then
			if p12:FindFirstChild("Torso") and p12.PrimaryPart and LocalPlayer.Character and p12:FindFirstChild("HumanoidRootPart") and not v96.DontTurnHead and p12.HumanoidRootPart.CFrame:ToObjectSpace(LocalPlayer.Character.HumanoidRootPart.CFrame).Z < 8 then
				if not oldHeadCFrames[p12] then
					oldHeadCFrames[p12] = p12.Torso.Neck.C0
				end

				local animateAsync = animation.AnimateAsync
				local neck = p12.Torso.Neck
				local v104 = oldHeadCFrames[p12]
				local cFrameAngles = CFrame.Angles
				local v106 = (p12.Head.Position - LocalPlayer.Character.PrimaryPart.Position).Unit:Cross(p12.PrimaryPart.CFrame.LookVector)
				local cFrame = cFrameAngles(0, 0, v106.Y)

				animateAsync(neck, { C0 = v104 * cFrame }, 0.35, "Out", "Quart")
			end

			local foundChild = p12:FindFirstChild("NPCIcon", true)

			if foundChild then
				task.spawn(function()
					animation.Animate(foundChild, { StudsOffset = Vector3.new(0, 0, 0) }, 0.3, "In", "Quint")
					foundChild.Enabled = false
				end)
			end
		end

		if v96.StartFight and v96.Level then
			if v96.MaxLevel then
				window.Level.Text = "Lvl " .. v96.Level .. "-" .. v96.MaxLevel
			else
				window.Level.Text = "Lvl " .. v96.Level
			end

			if not v96.MaxLevel and data.LevelRange() >= v96.Level or v96.MaxLevel and data.LevelRange() >= v96.MaxLevel then
				window.Level.Text = window.Level.Text .. " <font color=\"#66FF00\">◈</font>"
			end

			window.Level.Visible = true
		else
			window.Level.Visible = false
		end

		if v96.NPCFunc then
			if typeof(v96.NPCFunc[1]) == "table" then
				for i = 1, #v96.NPCFunc do
					npcFuncs[v96.NPCFunc[i][1]](u28, unpack(v96.NPCFunc[i], 2))
				end
			else
				npcFuncs[v96.NPCFunc[1]](u28, unpack(v96.NPCFunc, 2))
			end
		end

		ShowDialog(p14 and v96[p14] and p14 or "Start")

		return
	end
end
local function autoStartDialog(p15, p16, p17)
	if p15.Requirement then
		local Players = game.Players
		local subPlayer = LocalPlayer[LocalPlayer.Name]:FindFirstChild("SubPlayer")
		local subPlayerValue = Players:FindFirstChild(subPlayer.Value)

		if not network.InvokeServer("CheckForQuestDataRequirement", LocalPlayer, p15.Requirement.Type, p15.Requirement.Amount) then
			networkClient.Alert("You have not completed the required content to start this.")

			return
		end

		if subPlayerValue and not network.InvokeServer("CheckForQuestDataRequirement", subPlayerValue, p15.Requirement.Type, p15.Requirement.Amount) then
			networkClient.Alert("Your partner has not completed the required content to start this.")

			return
		end
	end

	u28 = p16
	handy.Hide()
	proximityPromptService.Enabled = false
	DestroyAllGuiObjectChildren(textHolder)
	DestroyAllGuiObjectChildren(optionHolder)
	u25 = p15
	title.Text = p15.Owner
	window.Position = UDim2.fromScale(0.5, 1.5)

	local animationAnimateAsync = animation.AnimateAsync
	local v117 = UDim2.fromScale(0.5, 0.95)

	animationAnimateAsync(window, { Position = v117 }, 0.6, "Out", "Quint")
	window.Visible = true
	contextActionService:BindAction("freezeMovement", function()
		return Enum.ContextActionResult.Sink
	end, false, unpack(Enum.PlayerActions:GetEnumItems()))

	if p15.NPCFunc then
		if typeof(p15.NPCFunc[1]) == "table" then
			for i = 1, #p15.NPCFunc do
				npcFuncs[p15.NPCFunc[i][1]](u28, unpack(p15.NPCFunc[i], 2))
			end
		else
			npcFuncs[p15.NPCFunc[1]](u28, unpack(p15.NPCFunc, 2))
		end
	end

	ShowDialog(p17 or "Start")
end

npcFuncs.StartDialogWithNPC = startDialogWithNPC
npcFuncs.AutoStartDialog = autoStartDialog
skip.MouseButton1Click:Connect(function()
	if u29 and not u30 then
		u29:cancel()

		return
	end
end)

return {
	Start = autoStartDialog,
	StartDialogue = function(p18, p19)
		startDialogWithNPC(p18, _, p19)
	end
}
