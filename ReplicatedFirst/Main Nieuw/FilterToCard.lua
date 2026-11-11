





local stringFind = string.find
local stringLower = string.lower

local function Find(p1, p2)
	local stringFind = string.find
	local lowerText = string.lower(p1)
	local lowerText2 = string.lower(p2)

	return stringFind(lowerText, lowerText2, 1, true)
end

local specialFilters = require(script.SpecialFilters)
local rulesSyntax = require(game.ReplicatedStorage.RulesSyntax)

-- "//" search: matches ONLY against a card's reminder text, i.e. the text box shown next to
-- the card when inspecting it (CustomReminder notes + the RulesSyntax keyword reminders).
local reminderCorpusCache = setmetatable({}, { __mode = "k" })

local function GetReminderCorpus(card)
	local cached = reminderCorpusCache[card]

	if cached then
		return cached
	end

	local parts: {string} = {}

	if type(card.CustomReminder) == "table" then
		for k, v in pairs(card.CustomReminder) do
			table.insert(parts, tostring(k))
			table.insert(parts, tostring(v))
		end
	end

	for k, v in pairs(rulesSyntax) do
		if type(v) == "table" and card[k] and not v.IgnoreInfobox then
			if v.InfoboxName then
				table.insert(parts, tostring(v.InfoboxName))
			end

			if v.ReminderText then
				table.insert(parts, tostring(v.ReminderText))
			end
		end
	end

	-- strip rich text tags like <b> so they can't break up a search word
	local corpus = string.lower((string.gsub(table.concat(parts, "\n"), "<[^>]*>", "")))

	reminderCorpusCache[card] = corpus

	return corpus
end

local function MatchesReminderSearch(card, query: string)
	local corpus = GetReminderCorpus(card)

	-- every word must appear somewhere in the reminder text
	for word in string.gmatch(string.lower(query), "%S+") do
		if not string.find(corpus, word, 1, true) then
			return false
		end
	end

	return true
end

local t1: {[any]: any} = {
	Action = function(p3)
		if p3.Health > 0 or p3.Power > 0 or not not p3.Terrain or not not p3.Gear then
			return false
		end

		return true
	end,
	Fighter = function(p4)
		if (p4.Health or 0) + (p4.Power or 0) <= 0 then
		elseif not p4.Gear and not p4.Terrain then
			return true
		end

		return false
	end,
	Terrain = function(p5)
		return p5.Terrain
	end,
	Gear = function(p6)
		if not p6.Gear then
			return false
		end

		return true
	end,
	CostsColourless = function(p7)
		if p7.Cost.Neutral and p7.Cost.Neutral > 0 then
			return true
		end

		return false
	end,
	CostsRed = function(p8)
		if p8.Cost.Red and p8.Cost.Red > 0 then
			return true
		end

		return false
	end,
	CostsBlue = function(p9)
		if p9.Cost.Blue and p9.Cost.Blue > 0 then
			return true
		end

		return false
	end,
	CostsYellow = function(p10)
		if p10.Cost.Yellow and p10.Cost.Yellow > 0 then
			return true
		end

		return false
	end,
	CostsGreen = function(p11)
		if p11.Cost.Green and p11.Cost.Green > 0 then
			return true
		end

		return false
	end,
	AltArt = function(p12)
		if p12.Original and (not p12.UnfoiledIndex or not not p12.UnfoiledIndex and p12.UnfoiledIndex ~= p12.Original) then
			return true
		end

		return false
	end,
	NotAltArt = function(p13)
		local u23: boolean = true

		if p13.Original ~= nil then
			u23 = false

			if p13.UnfoiledIndex ~= nil then
				u23 = p13.UnfoiledIndex == p13.Original
			end
		end

		return u23
	end,
	Foil = function(p14)
		return p14.Foil == true
	end,
	RegularArt = function(p15)
		return p15.Original == nil
	end,
	Grouped = function(p16)
		return p16.Archetype
	end,
	Renamed = function(p17)
		return p17.SearchTerms or p17.Name == p17.LibraryIndex
	end,
	NotFoil = function(p18)
		return not p18.Foil
	end,
	Ranked = function(p19)
		local u30: boolean = false

		if type(p19.Rank) == "number" then
			u30 = p19.Rank >= 1
		end

		return u30
	end,
	Animated = function(p20)
		return p20.ArtAnimation or false
	end,
	PlayTest = function(p)
		return p.PlayTest == true
	end,
	Picant = function(p21)
		return p21.Health + p21.Power <= 500 and p21.Health + p21.Power ~= 0
	end,
	Gigant = function(p22)
		return p22.Health + p22.Power >= 1500
	end,
	Starter = function(p23)
		return p23.StarterCard
	end,
	HasGroup = function(p24)
		return p24.Archetype
	end,
	["CardCostsExactly:"] = function(p25, p26)
		if not p26 then
			return true
		end

		local parts = string.split(p26, "")
		local t2: {[any]: any} = { Neutral = 0, Red = 0, Green = 0, Yellow = 0, Blue = 0 }

		for i = 1, #parts do
			if parts[i] == "R" then
				t2.Red = t2.Red + 1
			elseif parts[i] == "G" then
				t2.Green = t2.Green + 1
			elseif parts[i] == "B" then
				t2.Blue = t2.Blue + 1
			elseif parts[i] == "Y" then
				t2.Yellow = t2.Yellow + 1
			elseif parts[i] == "W" or parts[i] == "C" then
				t2.Neutral = t2.Neutral + 1
			end
		end

		local u41: boolean = true

		for k, v in pairs(t2) do
			if not (v > 0) then
				if p25.Cost[k] and p25.Cost[k] ~= 0 then
					u41 = false
				end
			elseif not p25.Cost[k] or v ~= p25.Cost[k] then
				u41 = false
			end
		end

		if u41 then
			return true
		end

		return false
	end,
	["CardCostIncludes:"] = function(p27, p28)
		if not p28 then
			return true
		end

		local parts = string.split(p28, "")
		local t3: {[any]: any} = { Neutral = 0, Red = 0, Green = 0, Yellow = 0, Blue = 0 }

		for i = 1, #parts do
			if parts[i] == "R" then
				t3.Red = t3.Red + 1
			elseif parts[i] == "G" then
				t3.Green = t3.Green + 1
			elseif parts[i] == "B" then
				t3.Blue = t3.Blue + 1
			elseif parts[i] == "Y" then
				t3.Yellow = t3.Yellow + 1
			elseif parts[i] == "W" or parts[i] == "C" then
				t3.Neutral = t3.Neutral + 1
			end
		end

		local u49: boolean = true

		for k, v in pairs(t3) do
			if v > 0 and (not p27.Cost[k] or not (v <= p27.Cost[k])) then
				u49 = false
			end
		end

		if u49 then
			return true
		end

		return false
	end,
	["Power:"] = function(p29, p30)
		if not tonumber(p30) then
			return true
		end

		if p29.Power and p29.Power >= tonumber(p30) then
			return true
		end

		return false
	end,
	["Health:"] = function(p31, p32)
		if not tonumber(p32) then
			return true
		end

		if p31.Health and p31.Health >= tonumber(p32) then
			return true
		end

		return false
	end,
	["TotalCost:"] = function(p33, p34)
		if not tonumber(p34) then
			return true
		end

		local n1 = 0

		for _, v in pairs(p33.Cost) do
			n1 += v
		end

		local numberValue: number? = tonumber(p34)

		if n1 >= numberValue then
			return true
		end

		return false
	end
}

print("Finished loading " .. script.Name)

return {
	FilterToCard = function(_, p36, p37, p38, p39, p40)
		if p40 and p36.Original ~= nil then
			return false
		end

		if not p39[p36.Color] then
			return false
		end

		if p37 then
			-- "//" prefix: search reminder text only
			local reminderQuery = string.match(p38, "^%s*//(.*)$")

			if reminderQuery then
				return MatchesReminderSearch(p36, reminderQuery)
			end

			local u68 = false

			for iterValue in string.gmatch(p38, "%S+") do
				if string.sub(iterValue, 1, 1) == ">" then
					for _, v in pairs(specialFilters) do
						local v72 = string.sub(iterValue, 2)

						if v == v72 then
							u68 = t1[v](p36)
						end

						if string.find(iterValue, ":") then
							local parts = string.split(iterValue, ":")

							if v == string.sub(parts[1], 2) .. ":" then
								u68 = t1[v](p36, parts[2])
							end
						end
					end
				elseif string.sub(iterValue, 1, 1) == "<" then
					for _, v in pairs(specialFilters) do
						local v76 = string.sub(iterValue, 2)

						if v == v76 then
							u68 = not t1[v](p36)
						end

						if string.find(iterValue, ":") then
							local parts = string.split(iterValue, ":")

							if v == string.sub(parts[1], 2) .. ":" then
								u68 = not t1[v](p36, parts[2])
							end
						end
					end
				else
					local stringFind = string.find
					local lowerText = string.lower(p36.Name)
					local lowerText3 = string.lower(iterValue)
					local v81 = stringFind(lowerText, lowerText3, 1, true)

					if not v81 then
						v81 = true

						if iterValue ~= p36.Rarity then
							v81 = p36.Archetype and string.find(string.lower(p36.Archetype), string.lower(iterValue), 1, true) or p36[iterValue] or p36.Pack and string.find(string.lower(p36.Pack), string.lower(iterValue), 1, true)

							if not v81 then
								v81 = p36.PackDisplayOverride

								if v81 then
									local v82 = string.find
									local lowerText4 = string.lower(p36.PackDisplayOverride)
									local lowerText5 = string.lower(iterValue)

									v81 = v82(lowerText4, lowerText5, 1, true)
								end
							end
						end
					end

					u68 = v81

					if p36.Effect then
						local v85 = u68

						if not v85 then
							local v86 = string.find
							local lowerText6 = string.lower(p36.Effect.Description)
							local lowerText7 = string.lower(iterValue)

							v85 = v86(lowerText6, lowerText7, 1, true)
						end

						u68 = v85

						if p36.Ability then
							for k, _ in pairs(p36.Ability) do
								u68 = u68 or k == iterValue
							end
						elseif p36.Effect.Type then
							u68 = u68 or iterValue == p36.Effect.Type
						end
					end

					if p36.Original then
						local u91 = u68

						if not u91 then
							local v92 = string.find
							local lowerText8 = string.lower(p36.Original)
							local lowerText9 = string.lower(iterValue)

							u91 = v92(lowerText8, lowerText9, 1, true)
						end

						u68 = u91
					end

					if p36.SearchTerms then
						if type(p36.SearchTerms) == "table" then
							for _, v in pairs(p36.SearchTerms) do
								local v97 = u68

								if not v97 then
									local v98 = string.find
									local lowerText10 = string.lower(v)
									local lowerText11 = string.lower(iterValue)

									v97 = v98(lowerText10, lowerText11, 1, true)
								end

								u68 = v97
							end
						else
							local v101 = u68

							if not v101 then
								local v102 = string.find
								local lowerText12 = string.lower(p36.SearchTerms)
								local lowerText13 = string.lower(iterValue)

								v101 = v102(lowerText12, lowerText13, 1, true)
							end

							u68 = v101
						end
					end

					for k, v in pairs(rulesSyntax) do
						if p36[k] then
							if v.InfoboxName then
								local v107 = u68

								if not v107 then
									local v108 = string.find
									local lowerText14 = string.lower(v.InfoboxName)
									local lowerText15 = string.lower(iterValue)

									v107 = v108(lowerText14, lowerText15, 1, true)
								end

								u68 = v107
							end

							if v.ReminderText then
								local v111 = u68

								if not v111 then
									local v112 = string.find
									local lowerText16 = string.lower(v.ReminderText)
									local lowerText17 = string.lower(iterValue)

									v111 = v112(lowerText16, lowerText17, 1, true)
								end

								u68 = v111
							end
						end
					end
				end

				if not u68 then
					return false
				end
			end
		elseif p39[p36.Color] then
			return true
		end

		return true
	end,
	SpecialFilters = t1
}
