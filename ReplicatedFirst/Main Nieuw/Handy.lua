local paperRipple = require(script.Parent.Nevermore).PaperRipple
local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local dailyProgress = LocalPlayer.PlayerGui:WaitForChild("DailyProgress")
local battleWarning = visGui:WaitForChild("BattleWarning")
local battleNew = visGui:WaitForChild("BattleNew")
local userInputService: UserInputService = game:GetService("UserInputService")
local proximityPromptService: ProximityPromptService = game:GetService("ProximityPromptService")
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local allTasks = require(game.ReplicatedStorage.Quest.AllTasks)
local animation = require(game.ReplicatedStorage.Animation)
local u14: boolean = true

if userInputService.TouchEnabled ~= true then
	u14 = userInputService.GamepadEnabled == true
end

local u15 = if u14 then visGui.HandyTouch else visGui.HandyHolder.HandyNew
local network2 = require(script.Parent.Network)
local network2Client = network2.client
local network2FireServer = network2.FireServer
local module: {[any]: any} = { handy = u15, GlobalDebounce = false }
local uDim2New = UDim2.new
local t2: {[any]: any} = {}

function module.AddToHide(p1, p2)
	t2[p1] = p2
end

if not u14 then
	u15.Visible = true
end

local audioService = require(game.ReplicatedStorage.AudioService)

require(script.Parent.Engines)

local lerp = require(game.ReplicatedStorage.Utils).Lerp

-- FASTER MENU: the side menu slide used to take 0.4s per button with a 0.05s stagger between buttons (about 0.7s for the whole cascade, and
-- Hide() blocked for all of it). Shorter now. animGen stops a cascade that is still running when the opposite one starts (Hide then Show).
local SLIDE_TIME = 0.2
local STAGGER = 0.015
local animGen = 0

local function stagger(gen)
	task.wait(STAGGER)

	return animGen == gen
end
local t3: {[any]: any} = {}
local t4: {[any]: any} = {}
local t5: {[any]: any} = {}
local children = u15:GetChildren()

for _, v in pairs(children) do
	if v.Name ~= "TaskTemplate" then
		t3[v.Name] = v.Position
		t4[v.Name] = v.Position.Y.Scale
		t5[v.Name] = v.Position.X.Scale
	end
end

local u30 = nil
local u31 = nil
local u32 = true

function Visible()
	return u30
end

module.Visible = Visible

local t6: {[any]: any} = {
	"Party",
	"Quest",
	"StatsDisplay",
	"Shop",
	"HistoryChamber",
	"ChallengeNeu",
	"Deck",
	"Stats",
	"PatchNotes",
	"Show",
	"StarterQuests",
	"DSPrepEvent",
	"LimitedEvent"
}
local t7: {[any]: any} = { Show = true }
local u35: boolean = false
local u36 = false

function UpdateTasks()
	for _, v in pairs(u15.TasksHolder:GetChildren()) do
		if not v:IsA("UIListLayout") then
			v:Destroy()
		end
	end

	local n1: number = 0
	local v54 = networkInvokeServer("GetQuestInfo")

	for k, v in pairs(allTasks) do
		if v54[1] and v54[1][v.Stat] and v54[1][v.Stat] < v.Amount and n1 < 3 and (not v.Requirement or not allTasks[v.Requirement] or not v54[1][allTasks[v.Requirement].Stat] or not (v54[1][allTasks[v.Requirement].Stat] < allTasks[v.Requirement].Amount)) then
			local clone = u15:FindFirstChild("TaskTemplate"):FindFirstChild("Task"):Clone()

			clone.Parent = u15.TasksHolder
			clone.Name = k
			clone.Text = v.TaskInfo

			if v.TeleportLocation then
				clone.TeleportButton.MouseButton1Click:connect(function()
					if u36 == true then
						network2Client.WarningMsg("You cannot teleport to tasks while in a different world.")
					elseif u35 == false then
						task.spawn(function()
							u35 = true
							task.wait(1)
							u35 = false
						end)

						local black = LocalPlayer.PlayerGui:WaitForChild("Top").Black

						black.Visible = true
						audioService.PlaySound("Teleport")
						animation.Animate(black, { BackgroundTransparency = 0 }, 0.2, "Out", "Quad")

						local Character = LocalPlayer.Character
						local taskTeleports = game.ReplicatedStorage.TaskTeleports
						local text: string = tostring(v.TeleportLocation)
						local text2 = taskTeleports:FindFirstChild(text)

						Character:SetPrimaryPartCFrame(text2.CFrame)
						animation.Animate(black, { BackgroundTransparency = 1 }, 0.2, "In", "Quad")
						black.Visible = false
					end
				end)
			else
				clone.TeleportButton.Visible = false
			end

			clone.Visible = true
			n1 += 1
		end
	end

	if n1 == 0 then
		u15.TaskTitle.Visible = false

		return
	end

	u15.TaskTitle.Visible = true
end
local function expand()
	if battleNew.Visible then
		return
	end

	u31 = true
	animGen += 1

	local myGen = animGen

	task.spawn(function()
		local show = u15.Show
		local v84 = uDim2New(-1, 0, t4.Show, 0)

		show:TweenPosition(v84, "Out", "Quad", SLIDE_TIME, true)
		if not stagger(myGen) then return end

		for i = 1, #t6 do
			local v86 = t6[i]

			if not t7[v86] then
				u15[v86]:TweenPosition(t3[v86], "Out", "Quad", SLIDE_TIME, true)
				if not stagger(myGen) then return end
			end
		end

		u15.Hide:TweenPosition(t3.Hide, "Out", "Quad", SLIDE_TIME, true)
		if not stagger(myGen) then return end
	end)
end

module.Expand = expand
u15.Show.MouseButton1Click:connect(expand)

local function inpand()
	u31 = false
	animGen += 1

	local myGen = animGen

	local hide = u15.Hide
	local v59 = uDim2New(-1.4, 0, t4.Hide, 0)

	hide:TweenPosition(v59, "Out", "Quad", SLIDE_TIME, true)
	if not stagger(myGen) then return end

	for i = 1, #t6 do
		local v61 = t6[#t6 - i + 1]

		if not t7[v61] then
			local v62 = u15[v61]
			local v63 = uDim2New(-1.4, 0, t4[v61], 0)

			v62:TweenPosition(v63, "Out", "Quad", SLIDE_TIME, true)
			if not stagger(myGen) then return end
		end
	end

	u15.Show:TweenPosition(t3.Show, "Out", "Quad", SLIDE_TIME, true)
end
local function InpandTouch()
	u31 = false
	animGen += 1

	local myGen = animGen

	for i = 1, #t6 do
		local v65 = t6[#t6 - i + 1]

		if not t7[v65] then
			local v66 = u15[v65]
			local v67 = uDim2New(t5[v65], 0, 1.5, 0)

			v66:TweenPosition(v67, "Out", "Quad", SLIDE_TIME, true)
			if not stagger(myGen) then return end
		end
	end
end

if u14 then
	module.Inpand = InpandTouch
else
	module.Inpand = inpand
end

for _, v in pairs(visGui.HandyHolder.HandyNew:GetChildren()) do
	if v:IsA("GuiButton") then
		paperRipple.FromParent(v)

		local darken = v:WaitForChild("Darken")
		local default = v:WaitForChild("Default")
		local light = v:WaitForChild("Light")
		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		local v47: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = darken.Value })
		local v48: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = default.Value })

		tweenService:Create(v, tweenInfo, { ImageColor3 = light.Value })

		if v.Name ~= "Events" and v.Name ~= "Hide" and v.Name ~= "Show" and v.Name ~= "StatsDisplay" and v.Name ~= "PatchNotes" and v.Name ~= "StarterQuests" then
			if v:FindFirstChild("Title") then
				v.MouseButton1Click:connect(function()
					v47:Play()
					print(v.Name)
				end)
			end

			v.MouseEnter:connect(function()
				v68:Play()
				audioService.PlaySound("click2")
			end)
			v.MouseLeave:connect(function()
				v48:Play()
			end)
		end
	end
end

u15.Hide.MouseButton1Click:connect(module.Inpand)

function Show()
	if battleNew.Visible then
		return
	end

	if network2Client.IsSubPlayer() then
		network2FireServer("EnterParty")
	end

	if not u14 then
		local v69 = u15
		local v70 = uDim2New(0, 0, 0, 0)

		v69:TweenPosition(v70, "Out", "Quad", SLIDE_TIME, true)
	else
		u32 = true

		local v71 = u15
		local v72 = uDim2New(0.5, 0, 1, 0)

		v71:TweenPosition(v72, "Out", "Quad", SLIDE_TIME, true)
	end

	u30 = true
	userInputService.ModalEnabled = false
	UpdateTasks()
	u15.TasksHolder.Visible = true

	if not battleNew.Visible then
		u31 = true
		animGen += 1

		local myGen = animGen

		task.spawn(function()
			local show = u15.Show
			local v88 = uDim2New(-1, 0, t4.Show, 0)

			show:TweenPosition(v88, "Out", "Quad", SLIDE_TIME, true)
			if not stagger(myGen) then return end

			for i = 1, #t6 do
				local v90 = t6[i]

				if not t7[v90] then
					u15[v90]:TweenPosition(t3[v90], "Out", "Quad", SLIDE_TIME, true)
					if not stagger(myGen) then return end
				end
			end

			u15.Hide:TweenPosition(t3.Hide, "Out", "Quad", SLIDE_TIME, true)
			if not stagger(myGen) then return end
		end)
	end

	proximityPromptService.Enabled = true
end

module.Show = Show

function Hide(p3)
	u32 = u31
	u30 = false
	userInputService.ModalEnabled = true
	proximityPromptService.Enabled = false
	-- FASTER MENU: don't wait for the cascade; callers (Stats, Releases...) open their own menu right away
	task.spawn(module.Inpand)

	if not p3 then
		for _, v in pairs(t2) do
			v(true)
		end
	end

	local v76 = u14 and uDim2New(0.5, 0, 1.5, 0) or uDim2New(-1.4, 0, 0, 0)

	u15:TweenPosition(v76, "Out", "Quad", SLIDE_TIME, true)
	dailyProgress.Enabled = false
	battleWarning.Visible = false
	u15.TaskTitle.Visible = false
	u15.TasksHolder.Visible = false
end

module.Hide = Hide

function DisableTaskButtons(p4)
	u36 = p4
end

module.DisableTaskButtons = DisableTaskButtons
print("Finished loading " .. script.Name)

return module