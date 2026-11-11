




require(game.ReplicatedStorage.Animation)

local specialFilters = require(script.Parent.FilterToCard.SpecialFilters)
local audioService = require(game.ReplicatedStorage.AudioService)
local audioServicePlaySound = audioService.PlaySound

local function CopyTable(p1)
	local t3: {[any]: any} = {}

	for k, v in pairs(p1) do
		t3[k] = v
	end

	return t3
end

local u5 = nil
local u6 = nil
local u7 = nil
local u8 = nil
local userInputService: UserInputService = game:GetService("UserInputService")
local u10: boolean = true

if userInputService.TouchEnabled ~= true then
	u10 = userInputService.GamepadEnabled == true
end

local t1: {[any]: any} = { "Triggers", "Archetypes", "Misc" }
local u12 = nil

local module: {[any]: any} = {
	Show = function()
		if u10 == true then
			u5:TweenSize(UDim2.new(1.5, 0, -7, 0), "InOut", "Quad", 0.25, true)
		else
			u5:TweenSize(UDim2.new(1.1, 0, -5, 0), "InOut", "Quad", 0.25, true)
		end

		u12 = true
	end,
	Hide = function()
		if u10 == true then
			u5:TweenSize(UDim2.new(1.5, 0, 0, 0), "InOut", "Quad", 0.25, true)
		else
			u5:TweenSize(UDim2.new(1.1, 0, 0, 0), "InOut", "Quad", 0.25, true)
		end

		u12 = false
	end,
	Out = function()
		return u12
	end,
	Redraw = function()
		for _, v in pairs(t1) do
			local scrollingFrame = u5[v].ScrollingFrame
			local uiListLayout = scrollingFrame.Scaler:FindFirstChildOfClass("UIListLayout")

			if uiListLayout then
				scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + uiListLayout.Padding.Offset)
			end
		end
	end,
	SetBox = function(p2)
		u7 = p2
	end,
	SetUpdate = function(p3)
		u8 = p3
	end
}

local function ToggleBox(p4)
	local v28, v29 = string.find(u7.Text, p4, nil, true)

	if v28 and v29 then
		local v30 = u7
		local v31 = string.sub(u7.Text, 0, v28 - 2)
		local v32 = string.sub(u7.Text, v29 + 1, #u7.Text)

		v30.Text = v31 .. v32
	else
		u7.Text = u7.Text .. " " .. p4
	end

	u8(true)
end
local function RedrawLabel(p5, p6)
	p5.Title.TextColor3 = string.find(u7.Text, p6, nil, true) and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
end
local function CreateLabel(parent, name)
	local clone = u6:Clone()

	clone.Parent = parent
	clone.Title.Text = name
	clone.Name = name
	clone.Visible = true
	clone.Size = UDim2.new(1, 0, 0, 32)

	if not clone:FindFirstChildOfClass("UIScale") then
		local uiScale: UIScale = Instance.new("UIScale")

		uiScale.Parent = clone
		uiScale.Scale = 1
	end

	clone.MouseButton1Click:Connect(function()
		audioService.PlaySound("click2")
		ToggleBox(name)
		RedrawLabel(clone, name)
		u7:ReleaseFocus()
	end)
	clone.MouseEnter:Connect(function()
		RedrawLabel(clone, name)
	end)
	clone.MouseLeave:Connect(function()
		clone.Title.TextColor3 = Color3.new(1, 1, 1)
	end)
end
function module.Init(p9, p10)
	local function Alphabetize(p11)
		table.sort(p11, function(p12, p13)
			return p12 < p13
		end)
	end

	local t4: {[any]: any} = {}
	local t5: {[any]: any} = {}
	local t6: {[any]: any} = {}
	local t7: {[any]: any} = {}
	local t8: {[any]: any} = {
		Dwarf = true,
		Component = true,
		["Capital $ity"] = true,
		["The Federation"] = true,
		Starstone = true
	}
	local t9: {[any]: any} = {
		Alliance = true,
		BadNews = true,
		Bewitched = true,
		Case = true,
		Classic = true,
		Combine = true,
		Crime1 = true,
		Crime2 = true,
		Crime3 = true,
		Crime4 = true,
		Crystal = true,
		CrystalEnabler = true,
		FabulousBench = true,
		FabulousMettaton123 = true,
		Godbeast = true,
		Greed = true,
		Guess = true,
		Rageborn = true,
		MSE6 = true,
		Money = true,
		Monkey = true,
		Morblox = true,
		MuPower = true,
		Nenjas = true,
		Void = true,
		Normal = true,
		Permafrost = true,
		Pilot = true,
		Rage = true,
		Skull = true,
		Slime = true,
		Spatial = true,
		Terrarian = true,
		Tree = true,
		Ultoris = true,
		Manifestation = true,
		darr1342 = true
	}
	local t10: {[any]: any} = {
		LibraryIndex = true,
		Id = true,
		Name = true,
		Health = true,
		Power = true,
		Rarity = true,
		AttackEffect = true,
		AddGenZoneant = true,
		Addant = true,
		Archetype = true,
		Cloneant = true,
		CopyBodge = true,
		ContainerCard = true,
		ContainerAltBase = true,
		Effect = true,
		EffectAnimation = true,
		EffectVariable = true,
		Field = true,
		Mitigation = true,
		InPacks = true,
		IsBotCard = true,
		NoFoilWorth = true,
		Pack = true,
		PackDisplayOverride = true,
		Requirement = true,
		SpecialEffectAnimation = true,
		RandomAddBypass = true,
		StartGameRequirement = true,
		HideArchetype = true,
		FT = true,
		GenZoneSummonant = true,
		TriggerInField = true,
		TriggerInHand = true,
		TriggerInGenZone = true,
		AlternateCostRequirement = true,
		Summonant = true,
		SkipOnImmune = true,
		TokenDiscard = true,
		SummonAnimation = true,
		Transformant = true,
		Terrariant = true,
		Color = true,
		Cost = true,
		Bio = true,
		RansackCount = true,
		SearchTerms = true
	}
	local t11: {[any]: any} = {}
	local t12: {[any]: any} = {}
	local stringFind = string.find

	for _, v in pairs(p10) do
		if not v.PlayTest then
			t7[v.Rarity] = true

			if v.Effect and v.Effect.Type and v.Effect.Type ~= "Nil" and v.Effect.Type ~= "Nill" and v.Effect.Type ~= "Null" then
				t4[v.Effect.Type] = true
			end

			if v.Archetype and not t9[v.Archetype] and not v.Original and v.Rarity ~= "Token" then
				t6[v.Archetype] = (t6[v.Archetype] or 0) + 1

				if t6[v.Archetype] >= 3 or t8[v.Archetype] then
					t5[v.Archetype] = true
				end
			end

			for k, iterValue in pairs(v) do
				if not t10[k] then
					if stringFind(k, "Block") or stringFind(k, "Immune") then
						t12[k] = true
					elseif k ~= "AltCards" or iterValue == true then
						t11[k] = true
					end
				end
			end
		end
	end

	u5 = p9
	u6 = u5.BaseButton

	local function BuildSortedList(p14)
		local t13: {[any]: any} = {}

		for k, _ in pairs(p14) do
			table.insert(t13, k)
		end

		table.sort(t13, function(p12, p13)
			return p12 < p13
		end)

		return t13
	end

	local v57 = BuildSortedList(t4)
	local v58 = BuildSortedList(t5)
	local v59 = BuildSortedList(t7)
	local v60 = BuildSortedList(t11)
	local v61 = BuildSortedList(t12)
	BuildSortedList = {}

	for _, v in pairs(specialFilters) do
		table.insert(BuildSortedList, ">" .. v)
		table.insert(BuildSortedList, "<" .. v)
	end

	for _, v in pairs({
		{
			u5.Triggers.ScrollingFrame.Scaler,
			{ v57 }
		},
		{
			u5.Archetypes.ScrollingFrame.Scaler,
			{ v58 }
		},
		{
			u5.Misc.ScrollingFrame.Scaler,
			{ BuildSortedList, v59, v60, v61 }
		}
	}) do
		local parent, v67 = unpack(v)

		if not parent:FindFirstChildOfClass("UIListLayout") then
			local uiListLayout: UIListLayout = Instance.new("UIListLayout")

			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0, 4)
			uiListLayout.Parent = parent
		end

		parent.Size = UDim2.new(1, 0, 0, 0)
		parent.AutomaticSize = Enum.AutomaticSize.Y

		for _, iterValue2 in pairs(v67) do
			for _, iterValue3 in pairs(iterValue2) do
				CreateLabel(parent, iterValue3)
			end
		end
	end

	u5.Close.MouseButton1Click:Connect(module.Hide)
	module.Redraw()

	return module
end

print("Finished loading " .. script.Name)

return module
