





local utils = require(game.ReplicatedStorage.Utils)
local utilsClamp = utils.Clamp
local utilsNew = utils.New
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkClient = network.client
local LocalPlayer = game.Players.LocalPlayer
local inspection = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Inspection")
local effect = LocalPlayer.PlayerGui.VisGui.Effect
local userInputService: UserInputService = game:GetService("UserInputService")

LocalPlayer:GetMouse()

local fakemouse = require(script.Parent.FakeMouse).fakemouse
local config = require(game.ReplicatedStorage.CONFIG)
local configClr = config.CLR
local configClrtxt = config.CLRTXT
local configColororder = config.COLORORDER
local configLogos = config.LOGOS
local textFormat = require(script.Parent.TextFormat)
local u18 = false
local u19 = false
local t1: {[any]: any} = { Ally = nil, Enemy = nil }
local t2: {[any]: any} = { Ally = false, Enemy = false }
local engines = require(script.Parent.Engines).engines
local temp = require(script.Parent.Temp)

local function u24()
end

spawn(function()
	repeat
		task.wait(0.1)
	until temp.AmountOfIcons

	u24 = temp.AmountOfIcons
end)

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
local rulesSyntax = require(game.ReplicatedStorage.RulesSyntax)
local intoFormsARGText = require(game.ReplicatedStorage.IntoFormsARGText)
local t3: {[any]: any} = {
	"Hardy",
	"Lucky",
	"Efficient",
	"Living",
	"Immobile",
	"Godly",
	"Precise",
	"Glass Cannon",
	"Glass Bones",
	"Resilient",
	"Deer Hunter",
	"Overloading",
	"Pythagorean",
	"Charged",
	"World-Wide",
	"Regenerating",
	"Inconsistent",
	"Undead",
	"Pathetic",
	"Miracle",
	"Unwanted",
	"Inept",
	"Repetitive",
	"Chaotic",
	"Creepy",
	"Noobified",
	"Colourless",
	"Wide",
	"MZH-born",
	"Fried",
	"Unfortunate",
	"Treasure Hunting",
	"Echoing",
	"Traveller",
	"Platinum",
	"Heavy Hitter",
	"Flash",
	"Quick",
	"Old",
	"Weakling",
	"Tower Defender",
	"Counterspeller",
	"Planty",
	"Heavily Armored",
	"Masterpiece",
	"Humble One",
	"Attachable",
	"Defenseless"
}
local vector2New = Vector2.new
local uDim2New = UDim2.new
local color3New = Color3.new
local inspectionInspection = inspection.Inspection
local inspectionSecondary = inspection.Secondary
local inspectionInspectionIcons = inspectionInspection.Icons
local rank = inspectionInspection.Icons.Rank
local rankPosition = rank.Position
local u37 = vector2New()
local t4: {[any]: any} = {}
local t5: {[any]: any} = {}
local n1: number = 0
local n2: number = 1
local v42 = uDim2New(0, 16, 0, 16)

uDim2New(0, 18, 0, 18)
uDim2New(0, -1, 0, -1)

local inspectionInspectionIconsZIndex = inspectionInspectionIcons.ZIndex

for i = 1, 56 do
	if n1 == 8 then
		n1 = 0
		n2 += 1
	end

	local v45 = utilsNew("ImageLabel")
	local uDim2 = UDim2.new(0, n1 * 20 + 5 + 2, 1, -n2 * 20 + 2)
	local parent = v45({
		BackgroundTransparency = 1,
		Image = "rbxassetid://511406127",
		Visible = false,
		Position = uDim2,
		Size = v42,
		ZIndex = inspectionInspectionIconsZIndex + 1,
		Parent = inspectionInspectionIcons
	})

	parent.Name = i .. "(" .. n1 .. "/" .. n2 .. ")"

	local v48 = utilsNew("ImageLabel")
	local uDim22 = UDim2.new(0, n1 * 20 + 5 + 2, 1, -n2 * 20 + 3)
	local v50 = v48({
		BackgroundTransparency = 1,
		Image = "rbxassetid://511406127",
		Visible = false,
		ImageTransparency = 0.5,
		Position = uDim22,
		Size = v42,
		ZIndex = inspectionInspectionIconsZIndex,
		Parent = inspectionInspectionIcons,
		ImageColor3 = Color3.new(0, 0, 0)
	})

	v50.Name = i .. "(" .. n1 .. "/" .. n2 .. ") back"
	v50.Parent = inspectionInspectionIcons

	local studText = utilsNew("TextLabel")({
		BackgroundTransparency = 1,
		Visible = false,
		TextScaled = true,
		Position = UDim2.new(-0.175, 0, -0.175, 0),
		Size = UDim2.new(1.35, 0, 1.35, 0),
		ZIndex = inspectionInspectionIconsZIndex + 1,
		Parent = parent,
		Font = Enum.Font.SourceSansBold
	})

	studText.Name = "StudText"
	studText.Parent = parent
	n1 += 1
	t4[i] = parent
	t5[i] = v50
end

function stringToNumericValue(p1)
	local n1 = 0
	local lowerText = string.lower(p1)

	for i = 1, #lowerText do
		local v65 = string.sub(lowerText, i, i)
		local v66 = string.byte(v65)

		n1 += v66 - 97 + 1
	end

	return n1
end
function getWrappedSubstring(p2, p3, p4)
	local s1: string = ""
	local n1: number = #p2

	for i = 0, p4 - 1 do
		local n2 = ((p3 - 1) % n1 + 1 + i - 1) % n1 + 1
		local v74 = string.sub(p2, n2, n2)

		s1 ..= v74
	end

	return s1
end
local function ShortenBio(p5, p6)
	local v77 = p5.Position and p5.Position ~= "Storage" and string.match(p6, "[%a?%s?\"?'?%*?&?]+[%.%?!]")

	if v77 then
		p6 = v77
	end

	return p6
end

local bindableEvent: BindableEvent = Instance.new("BindableEvent")
local module: {[any]: any} = {
	CurrentCard = nil,
	LastHealth = 0,
	LastPower = 0,
	LastIndex = nil,
	SecondaryEnabled = false,
	Event = bindableEvent
}
local n3 = 0
local inspectionPlayerMouse = inspection.PlayerMouse
local u57: boolean = false

function module.Inspect(currentCard, p8)
	if not currentCard or not currentCard.Name or not currentCard.LibraryIndex then
		return
	end

	if module.LastIndex and module.LastIndex >= currentCard.Physical.ZIndex and (currentCard ~= module.CurrentCard or module.CurrentCard.Health == module.LastHealth and module.CurrentCard.Power == module.LastPower) then
		return
	end

	module.LastIndex = currentCard.Physical.ZIndex

	local v80 = cardLibrary[currentCard.LibraryIndex]
	local t7 = nil

	if currentCard.EffectOrigin and not currentCard.ModifiedDescription then
		t7 = cardLibrary[currentCard.EffectOrigin]
	end

	if not v80 then
		return
	end

	if currentCard.ModifiedDescription then
		if t7 and t7.Effect then
			t7.Effect.Description = tostring(currentCard.ModifiedDescription)
		end

		if v80.Effect then
			t7 = {
				Effect = {}
			}
			t7.Effect.Description = tostring(currentCard.ModifiedDescription)
		end
	end

	if not inspectionInspection.Visible then
		inspectionInspection.Visible = true
	end

	n3 += 1
	u37 = vector2New(fakemouse.X, fakemouse.Y)

	if not module.CurrentCard or currentCard ~= module.CurrentCard or currentCard == module.CurrentCard and (module.CurrentCard.Health ~= module.LastHealth or module.CurrentCard.Power ~= module.LastPower) then
		if v80.Foil then
			inspectionInspection.CName.TextStrokeColor3 = configClr[currentCard.Color or v80.Color]

			if v80.Color == "Neutral" then
				inspectionInspection.CName.TextStrokeColor3 = Color3.fromRGB(169, 176, 186)
			end
		else
			inspectionInspection.CName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		end

		if effect:FindFirstChild(LocalPlayer.UserId .. "Scrambled") then
			currentCard.Name = "Fragment of the Noumenon"
		end

		inspectionInspection.CName.Text = currentCard.Name or v80.Name

		if p8 and p8.Name then
			local inspectionInspectionCName = inspectionInspection.CName

			inspectionInspectionCName.Text = inspectionInspectionCName.Text .. p8.Name
		end

		if config.APRIL_FOOL_MODE then
			for k, _ in pairs(currentCard) do
				if table.find(t3, k) then
					inspectionInspection.CName.Text = k .. " " .. inspectionInspection.CName.Text
				end
			end
		end

		inspectionInspection.CNameBack.Text = inspectionInspection.CName.Text

		local n1

		if v80.Archetype == nil and currentCard.Archetype == nil or v80.HideArchetype ~= nil then
			n1 = 0
			inspectionInspection.CArchetype.Text = ""
		else
			n1 = 13

			if v80.Archetype == "Terrain" then
				inspectionInspection.CArchetype.Text = "Terrain"
			else
				inspectionInspection.CArchetype.Text = "Group: " .. (currentCard.Archetype or v80.Archetype)
			end
		end

		inspectionInspection.CArchetypeBack.Text = inspectionInspection.CArchetype.Text

		local v86 = currentCard.Color or "Colourless"

		if v86 == "Neutral" then
			v86 = "Colourless"
		end

		local v87 = currentCard.Rarity or "Token"
		local s1 = "Fighter"
		local n2

		if currentCard.Health == 0 and not currentCard.AddHealth and not currentCard.AddPower then
			s1 = if currentCard.Terrain then "Terrain" else if currentCard.Gear then "Gear" else "Action"
			n2 = -32
			inspectionInspection.CHealth.Text = ""
			inspectionInspection.CPower.Text = ""
			inspectionInspection.CHealthSymbol.Visible = false
			inspectionInspection.CPowerSymbol.Visible = false
			inspectionInspection.CHealthSymbolBack.Visible = false
			inspectionInspection.CPowerSymbolBack.Visible = false
		else
			if currentCard.Gear then
				s1 = "Gear"
			elseif currentCard.Terrain then
				s1 = "Terrain"
			end

			n2 = 12
			inspectionInspection.CPower.TextSize = 24
			inspectionInspection.CHealth.Text = currentCard.Health or v80.Health
			inspectionInspection.CPower.Text = currentCard.Power or v80.Power

			if currentCard.AddHealth then
				if currentCard.AddHealth < 0 then
					inspectionInspection.CHealth.Text = currentCard.AddHealth or v80.AddHealth
				else
					inspectionInspection.CHealth.Text = "+" .. (currentCard.AddHealth or v80.AddHealth)
				end
			end

			if currentCard.AddPower then
				if currentCard.AddPower < 0 then
					inspectionInspection.CPower.Text = currentCard.AddPower or v80.AddPower
				else
					inspectionInspection.CPower.Text = "+" .. (currentCard.AddPower or v80.AddPower)
				end
			end

			inspectionInspection.CHealthSymbol.Visible = true
			inspectionInspection.CPowerSymbol.Visible = true
			inspectionInspection.CHealthSymbolBack.Visible = true
			inspectionInspection.CPowerSymbolBack.Visible = true

			if currentCard.ObscureStats then
				inspectionInspection.CHealth.Text = "???????"
				inspectionInspection.CPower.Text = "???????"
			end
		end

		inspectionInspection.CHealthBack.Text = inspectionInspection.CHealth.Text
		inspectionInspection.CPowerBack.Text = inspectionInspection.CPower.Text
		inspectionInspection.CAction.Visible = true
		inspectionInspection.CAction.Text = v87 .. " " .. v86 .. " " .. s1
		inspectionInspection.CActionBack.Text = inspectionInspection.CAction.Text
		s1 = currentCard.Bio or v80.Bio

		if currentCard.IsNightwatched then
			s1 = "What a worthless thing to steal."
		end

		if p8 and p8.Bio then
			s1 ..= p8.Bio
		end

		if effect:FindFirstChild(LocalPlayer.UserId .. "Scrambled") then
			s1 = "The universe doesn't care if its answers are simple, but we do."
		end

		inspectionInspection.CBio.Text = s1
		inspectionInspection.CBio.Bounds.Text = s1
		s1 = {}

		for k, v in pairs(rulesSyntax) do
			if currentCard[k] or v80[k] then
				table.insert(s1, v)
			end
		end

		v87 = ""

		if v80.Effect and (not not v80.Effect.Description or not not v80.Effect[1].Description) then
			v87 = v80.Effect.Description or v80.Effect[1].Description
		end

		if currentCard.IsNightwatched then
			v87 = "This card's identity has been stolen."
		end

		v86 = ""

		local t8: {[any]: any} = { "Token", "TokenGenZone", "TokenGraveZone", "TokenDiscard" }
		local s2 = ""
		local s3: string = ""
		local t9: {[any]: any} = {
			"TargetImmune",
			"DamageImmune",
			"HealImmune",
			"WeakenImmune",
			"StrengthenImmune",
			"LockImmune",
			"UnlockImmune",
			"ReturnImmune",
			"DestroyImmune",
			"TransformImmune",
			"StealImmune",
			"SuspendImmune",
			"DivideImmune",
			"InjectImmune",
			"SéanceImmune",
			"CloneImmune",
			"CopyImmune",
			"AlterImmune",
			"SetImmune",
			"SwapImmune",
			"ObliterateImmune"
		}
		local s4: string = ""

		local function CreateIncrementor(p9)
			local t14: {[any]: any} = {}

			for _, v in ipairs(p9) do
				if currentCard[v] and rulesSyntax[v] and rulesSyntax[v].RulesText then
					table.insert(t14, v)
				end
			end

			return t14
		end
		local function FilterDesc()
		end

		if currentCard.TokenOmni then
			s2 ..= rulesSyntax.TokenOmni.RulesText
		else
			local v99 = CreateIncrementor(t8)

			for i, v in ipairs(v99) do
				s2 = if i == 1 then s2 .. rulesSyntax[v].RulesText else if i == #v99 then s2 .. ", and" .. rulesSyntax[v].RulesText else s2 .. "," .. rulesSyntax[v].RulesText
			end
		end

		if s2 ~= "" then
			s2 = "Inert" .. s2 .. ". \n"
		end

		local v102 = CreateIncrementor({ "AttackBlock", "CounterBlock", "CounterAttackBlock" })

		for i, v in ipairs(v102) do
			s3 = if i == 1 then s3 .. rulesSyntax[v].RulesText else if i == #v102 then s3 .. ", or" .. rulesSyntax[v].RulesText else s3 .. "," .. rulesSyntax[v].RulesText
		end

		if s3 ~= "" then
			s3 = "This card can't" .. s3 .. ". \n"
		end

		if currentCard.OmniImmune then
			s4 = s4 .. rulesSyntax.OmniImmune.RulesText .. "\n"
		else
			local v105 = CreateIncrementor(t9)

			for i, v in ipairs(v105) do
				s4 = if i == 1 then s4 .. rulesSyntax[v].RulesText else if i == #v105 then s4 .. ", and" .. rulesSyntax[v].RulesText else s4 .. "," .. rulesSyntax[v].RulesText
			end

			if s4 ~= "" then
				s4 = "This card is immune to" .. s4 .. " card effects. \n"
			end
		end

		for _, v in pairs(s1) do
			if not v.IgnoreRulesText then
				v86 ..= v.RulesText .. "\n"
			end
		end

		if currentCard.Aspiration then
			local t10: {[any]: any} = {
				EnemyDeath = "Aspire: An enemy died this turn.",
				["1KPower"] = "Aspire: An ally has 1000 or more Power.",
				["6Studs"] = "Aspire: Spend 6 or more studs this turn."
			}

			for k, _ in pairs(currentCard.Aspiration) do
				if t10[k] then
					v86 = if currentCard.OriginalAspiration and k == currentCard.OriginalAspiration then v86 .. "<b>" .. t10[k] .. "</b>" .. "\n" else v86 .. t10[k] .. "\n"
				end
			end
		end

		local function hasDeckSearch(p11)
			if type(p11) ~= "table" then
				return false
			end

			if p11.MovezoneAsDraw == true then
				return false
			end

			for _, v in pairs(p11) do
				if type(v) == "table" then
					if type(v[1]) == "string" and (not not v[1]:find("Tutorfor") or not not v[1]:find("TutorOverdrive")) then
						return true
					end

					if v[1] == "MoveZone" and type(v[2] and v[2][2]) == "string" and type(v[2] and v[2][3]) == "string" and (v[2] and v[2][2]):find("Deck") and (v[2] and v[2][3]):find("Hand") then
						return true
					end

					if hasDeckSearch(v) then
						return true
					end
				end
			end

			return false
		end
		local function hasRecursion(p12)
			if type(p12) == "table" then
				for k, v in pairs(p12) do
					if type(v) == "table" then
						if v[1] == "MoveZone" and type(v[2]) == "table" and type(v[2][2]) == "string" and type(v[2][3]) == "string" and v[2][2]:find("Grave") and v[2][3]:find("Hand") then
							return true
						end

						if k == "OnAllyRecur" or k == "OnEnemyRecur" then
							return true
						end

						if hasRecursion(v) then
							return true
						end
					end
				end

				return false
			end

			return false
		end
		local function hasSeance(p13)
			if type(p13) == "table" then
				for k, v in pairs(p13) do
					if k == "OnAllySeance" or k == "OnEnemySeance" then
						return true
					end

					if type(v) == "table" and hasSeance(v) then
						return true
					end

					if type(v) == "string" and v == "Seance" then
						return true
					end
				end

				return false
			end

			return false
		end

		if string.find(v86, "&Soulmate&") then
			v86 = string.gsub(v86, "&Soulmate&", cardLibrary[currentCard.Soulbound].Name)
		end

		if string.find(v86, "&AdvanceCount&") then
			v86 = string.gsub(v86, "&AdvanceCount&", currentCard.Advanceable or cardLibrary[currentCard.Soulbound].Advanceable)
		end

		local n12: number = 60

		if not t7 and v80.Effect or t7 and t7.Effect then
			if t7 and t7.Effect then
				v87 = t7.Effect.Description or t7.Effect[1].Description
			end

			local v117 = textFormat.FormatText(v87, u19)

			inspectionInspection.CEffDescription.Text = s2 .. s4 .. s3 .. v86 .. v117
		else
			inspectionInspection.CEffDescription.Text = ""
			n12 = 40
		end

		if effect:FindFirstChild(LocalPlayer.UserId .. "Scrambled") then
			local mathRandom = math.random
			local v119 = string.len(intoFormsARGText)
			local v120 = mathRandom(1, v119 - 200)

			inspectionInspection.CEffDescription.Text = "..." .. string.sub(intoFormsARGText, v120, v120 + 200) .. "..."
		end

		inspectionInspection.CEffDescriptionBack.Text = inspectionInspection.CEffDescription.Text
		inspectionInspection.CEffDescription.Bounds.Text = inspectionInspection.CEffDescription.Text
		inspectionInspection.Icons.Back.Divider.BackgroundColor3 = config.RARECLR[currentCard.Rarity]
		inspectionInspection.Icons.Back.ImageColor3 = config.BGCLR[currentCard.Color]
		inspectionInspection.Frame.ImageColor3 = config.BGCLR[currentCard.Color]
		inspectionInspection.CAction.Position = uDim2New(0, 0, 0, 16 + n1)
		inspectionInspection.CActionBack.Position = uDim2New(0, 0, 0, 17 + n1)

		local n4 = n1 + n2

		inspectionInspection.CHealthSymbol.Position = uDim2New(0, 0, 0, 20 + n4)
		inspectionInspection.CHealthSymbolBack.Position = uDim2New(0, 0, 0, 21 + n4)
		inspectionInspection.CHealth.Position = uDim2New(0, inspectionInspection.CHealthSymbol.AbsoluteSize.X + 2, 0, inspectionInspection.CHealthSymbol.Position.Y.Offset + 1)
		inspectionInspection.CPowerSymbol.Position = uDim2New(0, 0, 0, 44 + n4)
		inspectionInspection.CPowerSymbolBack.Position = uDim2New(0, 0, 0, 45 + n4)
		inspectionInspection.CPower.Position = uDim2New(0, inspectionInspection.CPowerSymbol.AbsoluteSize.X + 2, 0, inspectionInspection.CPowerSymbol.Position.Y.Offset + 1)
		inspectionInspection.CHealthBack.Position = uDim2New(0, inspectionInspection.CHealthSymbol.AbsoluteSize.X + 2, 0, inspectionInspection.CHealthSymbol.Position.Y.Offset + 2)
		inspectionInspection.CPowerBack.Position = uDim2New(0, inspectionInspection.CPowerSymbol.AbsoluteSize.X + 2, 0, inspectionInspection.CPowerSymbol.Position.Y.Offset + 2)

		local y = inspectionInspection.CEffDescription.Bounds.TextBounds.Y

		inspectionInspection.CEffDescription.Size = uDim2New(1.15, 0, 0, y)
		inspectionInspection.CEffDescription.Position = uDim2New(0, 0, 0, 68 + n4)
		inspectionInspection.CEffDescriptionBack.Size = uDim2New(1.15, 0, 0, y)
		inspectionInspection.CEffDescriptionBack.Position = uDim2New(0, 0, 0, 69 + n4)
		inspectionInspection.CBio.Position = uDim2New(0, 0, 0, n12 + 12 + y + n4)

		local v123 = inspectionInspection.CBio.Bounds.TextBounds.Y

		inspectionInspection.CBio.Size = uDim2New(1.15, 0, 0, v123)
		s2 = y + v123

		if not v80.Pack and not v80.AltArt and not v80.PackDisplayOverride then
			inspectionInspection.CPack.Visible = false
		elseif not currentCard.IsNightwatched then
			local v124 = if v80.Foil then cardLibrary[string.split(v80.LibraryIndex, "-Foil")[1]] else v80

			inspectionInspection.CPack.Visible = true
			inspectionInspection.CPack.Text = "Obtained from " .. (if v124.AltArt then "the Art Box" else v124.PackDisplayOverride or v124.Pack or "")

			if p8 and p8.Pack then
				local inspectionInspectionCPack = inspectionInspection.CPack

				inspectionInspectionCPack.Text = inspectionInspectionCPack.Text .. p8.Pack
			end

			inspectionInspection.CPack.Position = uDim2New(0, 0, 0, n12 + 12 + s2 + n4)
			s2 += inspectionInspection.CPack.TextBounds.Y
		end

		if currentCard.Original then
			local v126 = cardLibrary[currentCard.Original]

			if v126.LibraryIndex .. "-Foil" == currentCard.LibraryIndex or currentCard.IsNightwatched or currentCard.ContainerAltBase and currentCard.ContainerAltBase .. "-Foil" == currentCard.LibraryIndex or v126.ContainerCard == true and not currentCard.ContainerAltBase then
				inspectionInspection.CAltSource.Visible = false
			else
				inspectionInspection.CAltSource.Visible = true

				if currentCard.ContainerAltBase then
					inspectionInspection.CAltSource.Text = "Alt-Art Of: " .. currentCard.ContainerAltBase
				else
					inspectionInspection.CAltSource.Text = "Alt-Art Of: " .. v126.Name
				end

				inspectionInspection.CAltSource.Position = uDim2New(0, 0, 0, n12 + 12 + s2 + n4)
				s2 += inspectionInspection.CAltSource.TextBounds.Y
			end
		else
			inspectionInspection.CAltSource.Visible = false
		end

		if currentCard.AddedBy then
			local v127 = cardLibrary[currentCard.AddedBy]

			inspectionInspection.CAddSource.Visible = true
			inspectionInspection.CAddSource.Text = "Added by: " .. v127.Name
			inspectionInspection.CAddSource.Position = uDim2New(0, 0, 0, n12 + 12 + s2 + n4)
			s2 += inspectionInspection.CAddSource.TextBounds.Y
		else
			inspectionInspection.CAddSource.Visible = false
		end

		if currentCard.Logo then
			inspectionInspection.Frame.BGIcon.Visible = true
			inspectionInspection.Frame.BGIcon.Image = "rbxassetid://" .. configLogos[currentCard.Logo]
		else
			inspectionInspection.Frame.BGIcon.Visible = false
		end

		inspectionInspection.PassivesFrame.Visible = false
		inspectionInspection.PassivesFrame.CPassives.TextSize = 18
		inspectionInspection.PassivesFrame.CPassives.Text = ""

		if currentCard.CustomReminder then
			for k, v in pairs(currentCard.CustomReminder) do
				inspectionInspection.PassivesFrame.CPassives.Text = inspectionInspection.PassivesFrame.CPassives.Text .. "<b>" .. k .. ":</b>\n" .. v .. "\n"
			end
		end

		local t11: {[any]: any} = {}

		local v131 = (function(p10)
			local n1: number = 0

			for _, v in ipairs(p10) do
				if not v.IgnoreInfobox and v.InfoboxName ~= "Baseplate Rank" and v ~= rulesSyntax.Seance and v ~= rulesSyntax.Search and v ~= rulesSyntax.Recur and v ~= rulesSyntax.Token and v ~= rulesSyntax.TokenGenZone and v ~= rulesSyntax.TokenGraveZone and v ~= rulesSyntax.TokenDiscard then
					n1 += 1
				end
			end

			return n1
		end)(s1)

		for _, v in ipairs(s1) do
			if not v.IgnoreInfobox and v.InfoboxName ~= "Baseplate Rank" and v ~= rulesSyntax.Seance and v ~= rulesSyntax.Recur and v ~= rulesSyntax.Search and v ~= rulesSyntax.Token and v ~= rulesSyntax.TokenGenZone and v ~= rulesSyntax.TokenGraveZone and v ~= rulesSyntax.TokenDiscard then
				table.insert(t11, v)
			end
		end

		for _, v in ipairs(s1) do
			if v.InfoboxName == "Baseplate Rank" then
				if not (v131 < 3) then
					break
				end

				table.insert(t11, v)
				v131 += 1

				break
			end
		end

		if currentCard.Effect and (not not currentCard.Effect.Seancing or not not hasSeance(currentCard.Effect)) and v131 < 3 then
			table.insert(t11, rulesSyntax.Seance)
			v131 += 1
		end

		if currentCard.Effect and hasRecursion(currentCard.Effect) and v131 < 3 then
			table.insert(t11, rulesSyntax.Recur)
			v131 += 1
		end

		local v136 = CreateIncrementor(t8)

		for _, v in ipairs(v136) do
			if v131 < 3 then
				table.insert(t11, rulesSyntax[v])
				v131 += 1
			end
		end

		if currentCard.Effect and hasDeckSearch(currentCard.Effect) and v131 < 2 then
			table.insert(t11, rulesSyntax.Search)

			local n5 = v131 + 1
		end

		inspectionInspection.PassivesFrame.CPassives.Text = ""

		if currentCard.CustomReminder then
			for k, v in pairs(currentCard.CustomReminder) do
				local cPassives = inspectionInspection.PassivesFrame.CPassives

				cPassives.Text = cPassives.Text .. "<b>" .. k .. ":</b>\n" .. v .. "\n"
			end
		end

		for _, v in ipairs(t11) do
			local v145 = inspectionInspection.PassivesFrame.CPassives

			v145.Text = v145.Text .. "<b>" .. v.InfoboxName .. ":</b>\n" .. v.ReminderText .. "\n"
		end

		if effect:FindFirstChild(LocalPlayer.UserId .. "Scrambled") then
			inspectionInspection.PassivesFrame.CPassives.Text = ""
		else
			inspectionInspection.PassivesFrame.CPassives.Text = textFormat.FormatText(inspectionInspection.PassivesFrame.CPassives.Text, u19)
		end

		if effect:FindFirstChild(LocalPlayer.UserId .. "Scrambled") then
			inspectionInspection.PassivesFrame.CPassives.Text = ""
		else
			inspectionInspection.PassivesFrame.CPassives.Text = textFormat.FormatText(inspectionInspection.PassivesFrame.CPassives.Text, u19)
		end

		if inspectionInspection.PassivesFrame.CPassives.TextBounds.Y > n12 + 12 + s2 + n4 then
			inspectionInspection.PassivesFrame.Size = uDim2New(1, -110, 1, 10 + (inspectionInspection.PassivesFrame.CPassives.TextBounds.Y - (n12 + 12 + s2 + n4)))
		else
			inspectionInspection.PassivesFrame.Size = uDim2New(1, -110, 1, 10)
		end

		inspectionInspection.Size = uDim2New(0, 280, 0, n12 + 12 + s2 + n4)

		if currentCard.AnimatesTerrain then
			local s5: string = if module.IsEnemy then "Enemy" else "Ally"

			if not t2[s5] then
				t1[s5] = network.InvokeServer("GetSelfBattleInfo", if module.IsEnemy then "EnemyTerrain" else "MyTerrain")
				task.spawn(function()
					t2[s5] = true
					task.wait(2)
					t2[s5] = false
				end)
			end

			local v147 = t1[s5]

			if v147 and v147.Terrariant then
				local v148 = cardLibrary[v147.Terrariant]

				inspectionSecondary.CName.Text = v148.Name
				inspectionSecondary.CNameBack.Text = v148.Name

				local n6 = 0
				local n7

				if v148.Archetype == nil or v148.HideArchetype ~= nil then
					n7 = 0
					inspectionSecondary.CArchetype.Text = ""
				else
					n7 = 13

					if v148.Archetype == "Terrain" then
						inspectionSecondary.CArchetype.Text = "Terrain"
					else
						inspectionSecondary.CArchetype.Text = "Group: " .. v148.Archetype
					end
				end

				inspectionSecondary.CArchetypeBack.Text = inspectionSecondary.CArchetype.Text

				if v148.Effect and (not not v148.Effect.Description or not not v148.Effect[1].Description) then
					inspectionSecondary.CEffDescription.Text = v148.Effect.Description or v148.Effect[1].Description
					inspectionSecondary.CEffDescriptionBack.Text = v148.Effect.Description or v148.Effect[1].Description
					n6 = inspectionSecondary.CEffDescription.TextBounds.Y
					print(inspectionSecondary.CEffDescription.Bounds.TextBounds)
					inspectionSecondary.CEffDescription.Size = uDim2New(1.15, 0, 0, n6)
					inspectionSecondary.CEffDescription.Position = uDim2New(0, 0, 0, 68 + n7)
					inspectionSecondary.CEffDescriptionBack.Size = uDim2New(1.15, 0, 0, n6)
					inspectionSecondary.CEffDescriptionBack.Position = uDim2New(0, 0, 0, 69 + n7)
				end

				inspectionSecondary.CHealth.Text = v148.Health
				inspectionSecondary.CHealthBack.Text = v148.Health
				inspectionSecondary.CPower.Text = v148.Power
				inspectionSecondary.CPowerBack.Text = v148.Power
				inspectionSecondary.CHealthSymbol.Position = uDim2New(0, 0, 0, 20 + n7)
				inspectionSecondary.CHealthSymbolBack.Position = uDim2New(0, 0, 0, 21 + n7)
				inspectionSecondary.CHealth.Position = uDim2New(0, inspectionSecondary.CHealthSymbol.AbsoluteSize.X + 2, 0, inspectionSecondary.CHealthSymbol.Position.Y.Offset + 1)
				inspectionSecondary.CPowerSymbol.Position = uDim2New(0, 0, 0, 44 + n7)
				inspectionSecondary.CPowerSymbolBack.Position = uDim2New(0, 0, 0, 45 + n7)
				inspectionSecondary.CPower.Position = uDim2New(0, inspectionSecondary.CPowerSymbol.AbsoluteSize.X + 2, 0, inspectionSecondary.CPowerSymbol.Position.Y.Offset + 1)
				inspectionSecondary.CHealthBack.Position = uDim2New(0, inspectionSecondary.CHealthSymbol.AbsoluteSize.X + 2, 0, inspectionSecondary.CHealthSymbol.Position.Y.Offset + 2)
				inspectionSecondary.CPowerBack.Position = uDim2New(0, inspectionSecondary.CPowerSymbol.AbsoluteSize.X + 2, 0, inspectionSecondary.CPowerSymbol.Position.Y.Offset + 2)
				inspectionSecondary.Frame.ImageColor3 = config.BGCLR[v148.Color]
				print(n6, n7)
				inspectionSecondary.Size = uDim2New(0, 280, 0, n6 + 62 + n7)
				module.SecondaryEnabled = true
			end
		else
			module.SecondaryEnabled = false
		end

		module.CurrentCard = currentCard
		module.LastHealth = currentCard.Health
		module.LastPower = currentCard.Power

		if module.SecondaryEnabled then
			inspectionSecondary.Visible = true
		else
			inspectionSecondary.Visible = false
		end
	end

	if currentCard.Locked and currentCard.Locked.IsLocked and currentCard.Locked.TurnsLeft > 0 then
		inspectionInspection.LockLength.Visible = true
		inspectionInspection.LockLength.Text = "Locked for " .. currentCard.Locked.TurnsLeft .. " more turn" .. (if currentCard.Locked.TurnsLeft > 1 then "s" else "")
	else
		inspectionInspection.LockLength.Visible = false
	end

	local function parseText(p14)
		local t15: {[any]: any} = {}

		if p14 ~= nil then
			while true do
				if not (string.len(p14) > 0) then
					break
				end

				local v205 = string.find(p14, " ")

				if v205 == nil then
					table.insert(t15, p14)
					p14 = ""
				else
					local v206 = string.sub(p14, 1, v205 - 1)

					table.insert(t15, v206)
					p14 = string.sub(p14, v205 + 1)
				end
			end
		end

		return t15
	end

	u57 = not u57

	local v152 = currentCard.Cost or v80.Cost
	local n8: number = 0
	local n9: number = 1
	local n10: number = 0
	local n11 = 0
	local t12: {[any]: any} = {}
	local t13: {[any]: any} = {}

	for k, v in pairs(v152) do
		for _ = 1, v do
			table.insert(t12, k)
		end
	end

	local v162 = (function(p15)
		local v208 = parseText("n r g b y z a c d e f h i j k l m o p q s t u v w x")
		local n1 = 0

		for _, v in pairs(p15) do
			local v212 = string.len(v)

			if n1 < v212 then
				n1 = string.len(v)
			end
		end

		local function getValue(p16)
			local n2 = 0

			for i = 1, string.len(p16) do
				for k, v in pairs(v208) do
					local stringLower = string.lower
					local v242 = string.sub(p16, i, i)
					local v243 = stringLower(v242)

					if v == v243 then
						local v244 = math.pow(10, (n1 + 1 - i) * 2)

						n2 += k * v244
					end
				end
			end

			return n2
		end

		local u214: boolean = false
		local t16: {[any]: any} = {}

		for _, v in pairs(p15) do
			local v218 = getValue(v)

			table.insert(t16, { v, v218 })
		end

		while u214 == false do
			u214 = true

			for k, v in pairs(t16) do
				for k2, iterValue in pairs(t16) do
					if v[2] < iterValue[2] and k > k2 then
						table.remove(t16, k)
						table.insert(t16, k2, v)
						u214 = false

						break
					end

					if u214 == false then
						break
					end
				end
			end
		end

		local t17: {[any]: any} = {}

		for _, v in pairs(t16) do
			table.insert(t17, v[1])
		end

		return t17
	end)(t12)

	for _, v in pairs(configColororder) do
		local v165 = v152[v]

		t13[v] = u24(v) or 0
	end

	for _, v in pairs(t4) do
		v.Visible = false
		v.ImageColor3 = Color3.new(0, 0, 0)
	end

	for _, v in pairs(t5) do
		v.Visible = false
	end

	for k, v in pairs(t4) do
		local v172 = v162[k]

		if v172 then
			local parts = string.split(v172, " ")
			local v174 = v152[v172]

			if n11 ~= v174 then
				n10 = 0
			end

			if n10 >= v174 then
				n10 = 0
			end

			n11 = v174

			if #parts == 1 then
				v.ImageColor3 = configClr[v172]

				if u18 == true then
					v.StudText.Text = configClrtxt[v172]
					v.StudText.Visible = true
				else
					v.StudText.Visible = false
				end

				v.ImageTransparency = if currentCard.Position == "Hand" and n10 >= t13[v172] then 0.5 else 0

				local u175: boolean = not u57

				coroutine.resume(coroutine.create(function()
					task.wait(0.1)

					if v.Visible and u57 == not u175 then
						v.ImageColor3 = configClr[v172]
					end
				end))
			else
				v.ImageColor3 = Color3.new(0, 0, 0)

				local u176: boolean = not u57

				coroutine.resume(coroutine.create(function()
					local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
					local t18: {[any]: any} = { ImageColor3 = Color3.new(1, 1, 1) }
					local v228 = time()
					local t19: {[any]: any} = {}

					for _, iterValue in pairs(parts) do
						table.insert(t19, configClr[iterValue])
					end

					local n1: number = 1
					local v233 = nil
					local u234: boolean = false

					while true do
						if not task.wait() or u234 ~= false then
							break
						end

						if v.Visible == false or u57 == u176 then
							u234 = true

							if v233 then
								v233:Cancel()
							end
						end

						local v235 = time()

						if v228 <= v235 and u234 == false then
							n1 += 1

							if n1 == #t19 + 1 then
								n1 = 1
							end

							t18.ImageColor3 = t19[n1]
							v233 = game.TweenService:Create(v, tweenInfo, t18)
							v233:Play()
							v228 = time() + 1.2
						end
					end
				end))
				v.ImageTransparency = 0.5

				for _, iterValue in pairs(parts) do
					v.ImageTransparency = currentCard.Position == "Hand" and n10 >= t13[iterValue] and v.ImageTransparency or 0
				end
			end

			if n8 == 8 then
				n8 = 0
				n9 += 1
			end

			n8 += 1
			v.Visible = true
			t5[k].Visible = true
			n10 += 1
		end
	end

	inspectionInspectionIcons.Size = UDim2.new(1, 60, 0, -8 - n9 * 20)

	if currentCard.Rank then
		rank.Size = UDim2.fromOffset(inspectionInspection.AbsoluteSize.X / 2.5, inspectionInspection.AbsoluteSize.X / 2.5)
		rank.Position = rankPosition
		rank.ImageColor3 = config.CLR[currentCard.Color]
		rank.Number.Text = "Rank " .. tostring(currentCard.Rank)
		rank.Visible = true
	else
		rank.Visible = false
	end

	if inspectionInspection.PassivesFrame.CPassives.Text ~= "" then
		task.wait(1.2)

		if inspectionInspection.PassivesFrame.CPassives.Text ~= "" then
			inspectionInspection.PassivesFrame.Visible = true
		end
	end

	bindableEvent:Fire(true)
end

local timestamp = tick()

function module.Move()
	u37 = vector2New(fakemouse.X, fakemouse.Y)
	timestamp = tick()

	if not inspectionInspection.Visible then
		inspectionInspection.Visible = true
	end

	u37 = vector2New(fakemouse.X, fakemouse.Y)
end
function engines.CheckForInspectionHideMovePlayerMouse(_, p18)
	local n1: number = if userInputService.TouchEnabled then 30 else 0

	if module.CurrentCard then
		if (vector2New(fakemouse.X, fakemouse.Y) - u37).magnitude > 15 and timestamp - p18 > 0.2 then
			module.Hide()
		end

		local v182 = utilsClamp(8, inspection.AbsoluteSize.X - 280, fakemouse.X - inspectionInspection.AbsoluteSize.X / 2)
		local absoluteValue = math.abs(inspectionInspection.Icons.AbsoluteSize.Y)

		inspectionInspection.Position = uDim2New(0, v182, 0, utilsClamp(absoluteValue, inspection.AbsoluteSize.Y - inspectionInspection.AbsoluteSize.Y, fakemouse.Y - inspectionInspection.AbsoluteSize.Y + 24 - n1))

		if inspectionInspection.AbsolutePosition.X > inspection.AbsoluteSize.X / 8 then
			inspectionInspection.PassivesFrame.Position = uDim2New(0, -185, 0, -2)
		else
			inspectionInspection.PassivesFrame.Position = uDim2New(0, 340, 0, -2)
		end

		if module.SecondaryEnabled and inspectionInspection.Visible then
			inspectionSecondary.Position = uDim2New(0, inspectionInspection.AbsolutePosition.X, 0, inspectionInspection.AbsolutePosition.Y - (inspectionSecondary.AbsoluteSize.Y + 48))

			if not inspectionSecondary.Visible then
				inspectionSecondary.Visible = true

				return
			end
		else
			inspectionSecondary.Visible = false
		end

		return
	end
end
function module.Hide()
	n3 = math.max(0, n3 - 1)
	module.LastIndex = nil
	inspectionInspection.Visible = false
	inspectionSecondary.Visible = false
	inspectionInspection.Position = uDim2New(1, 0, 1, 0)
	userInputService.MouseIconEnabled = true
	inspectionPlayerMouse.Visible = false
	bindableEvent:Fire(false)
end
function temp.InspectionHeight()
	if not inspectionInspection.Visible then
		return 0
	end

	return -60 + inspectionInspection.AbsoluteSize.Y - 20
end
function module.ClearStack()
	n3 = 0
	module.Hide()
end
function module.SetCBMode(p19)
	u18 = p19
end
function module.SetEmojiMode(p20)
	u19 = p20
end

for _, v in pairs(inspectionInspection:GetDescendants()) do
	if v:IsA("GuiObject") then
		v.ZIndex = v.ZIndex + 300000
	end
end

print("Finished loading " .. script.Name)

return module
