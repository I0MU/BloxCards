



local httpService: HttpService = game:GetService("HttpService")
local copyTable = require(game.ReplicatedStorage.CopyTable)
local cardLibUpdate = require(game.ReplicatedStorage.CardLibUpdate)
local v4: boolean = game:GetService("RunService"):IsStudio()

local function dprint(...)
	if v4 then
		print(...)
	end
end

if _G.TrackEffects == nil then
	_G.TrackEffects = {
		{},
		{}
	}
end

local module: {[any]: any} = {}
local t2: {[any]: any} = {}
local v8 = type
local v9 = pairs
local stringSub = string.sub
local n1: number = 0
local n2: number = 0
local v13 = assert
local color3New = Color3.new
local color3 = color3New(0.25, 0.25, 1)
local v16 = color3New(1, 0.25, 0.25)
local v17 = color3New(0.25, 1, 0.25)
local v18 = color3New(1, 1, 0.25)
local v19 = color3New(1, 1, 1)
local t3: {[any]: any} = {
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Epic = 4,
	Legendary = 5,
	Token = 6,
	Shedletsky = 7
}
local v21: boolean = game:GetService("RunService"):IsServer()
local t4: {[any]: any} = { Blue = color3, Red = v16, Green = v17, Yellow = v18, Neutral = v19 }

local function TestCard(p1, original, p3)
	if v21 then
		v13(not p3[1], original .. " could be malformed.")
		v13(p3.Name, original .. " has missing name container.")
		v13(p3.Bio, original .. " has missing bio container.")

		local v46 = v8(p3.Id)

		v13(v46 == "number", original .. " id malformed.")

		if p3.Id == 543041104 then
			warn(original .. " has placeholder art.")
		end

		v13(not module[original], original .. " already exists.")
		v13(p3.Rarity, original .. " has missing rarity container.")
		v13(t3[p3.Rarity], original .. " has no real rarity.")
		v13(p3.Power and p3.Health and p3.Color, original .. " is missing health, power, or color container.")

		local v47 = p3.AttackEffect

		if not v47 then
			v47 = true

			if p3.Archetype ~= "Terrain" then
				v47 = false

				if p3.Health == 0 then
					v47 = p3.Power == 0
				end
			end
		end

		v13(v47, original .. " has no attack effect animation.")
		v13(p3.Color, original .. " has missing color container.")
		v13(t4[p3.Color], original .. " has no real color.")
		v13(p3.Cost, original .. " has a missing cost container.")

		for iterFirst, iterSecond in v9(p3.Cost) do
			local parts = string.split(iterFirst, " ")

			v13(t4[parts[1]], original .. " has an unreal color cost.")

			local v51 = v8(iterSecond)

			v13(v51 == "number", original .. " has a non-number cost.")
		end

		if p3.Effect then
			v13(p3.Effect.Description and p3.Effect.Type and p3.Effect.Power and p3.Effect.Target or p3.Effect.Ability, original .. " has an incomplete card effect.")
		end

		if p3.Original then
			v13(p1[p3.Original], original .. " has a non-existant Original card.")
		end
	end

	if p3.AltCards then
		for iterFirst2, iterSecond2 in v9(p3.AltCards) do
			for iterFirst3, iterSecond3 in v9(p3) do
				if not iterSecond2[iterFirst3] and iterFirst3 ~= "ArtAnimation" then
					iterSecond2[iterFirst3] = copyTable(iterSecond3)
				end
			end

			iterSecond2.AltCards = false
			iterSecond2.Original = original

			if iterSecond2.Effect then
				setmetatable(iterSecond2.Effect, { __index = p3.Effect })
			end

			t2[iterFirst2] = iterSecond2
		end
	end

	return true
end

local packs = require(game.ReplicatedStorage.Packs)
local t5: {[any]: any} = {
	"{\"Neutral\":1}",
	"{\"Neutral\":2}",
	"{\"Neutral\":3}",
	"{\"Neutral\":4}"
}

local function TestPartLibrary(p4, p5, p6, _, p8, _)
	for iterFirst, iterSecond in v9(p5) do
		local ok, result = pcall(TestCard, p6 or p5, iterFirst, iterSecond)

		if p8 then
			for iterFirst2, iterSecond2 in v9(p8) do
				iterSecond[iterFirst2] = iterSecond2
			end
		end

		if table.find(t5, httpService:JSONEncode(iterSecond.Cost)) ~= nil and iterSecond.Health ~= 0 and iterSecond.Color ~= "Neutral" then
			iterSecond.StarterCard = true
		end

		for iterFirst3, iterSecond3 in v9(packs) do
			if iterSecond3.Library ~= nil and p5 == require(iterSecond3.Library) and (iterSecond.Rarity ~= "Token" or iterSecond.InPacks) then
				iterSecond.Pack = iterSecond3.Name

				break
			end
		end

		if not iterSecond.Pack then
			for iterFirst4, iterSecond4 in v9(packs) do
				if iterSecond4.Cards and table.find(iterSecond4.Cards, iterFirst) then
					iterSecond.Pack = iterSecond4.Name

					break
				end
			end
		end

		iterSecond.LibraryIndex = iterFirst

		if ok then
			module[iterFirst] = iterSecond
			n1 += 1
		else
			warn(p4.Name, result)
		end
	end
end

for iterFirst, iterSecond in v9(script:GetChildren()) do
	local v29 = require(iterSecond)
	local v30 = iterSecond:FindFirstChild("Settings") and require(iterSecond.Settings) or nil

	TestPartLibrary(iterSecond, v29, nil, nil, v30)
end

TestPartLibrary({ Name = "AltCards" }, t2, module)

local t6: {[any]: any} = {}
local t7: {[any]: any} = {
	"Summonant",
	"Addant",
	"GenZoneSummonant",
	"Terrariant",
	"Transformant"
}

for iterFirst2, iterSecond2 in v9(module) do
	if iterSecond2.Foil ~= true then
		local v35 = copyTable(iterSecond2)

		for iterFirst3, iterSecond3 in v9(iterSecond2) do
			v35[iterFirst3] = iterSecond3
		end

		v35.Name = iterSecond2.Name .. " ★"
		v35.Effect = iterSecond2.Effect
		v35.Cost = iterSecond2.Cost or { Neutral = 9 }
		v35.Color = iterSecond2.Color or "Neutral"
		v35.Rarity = iterSecond2.Rarity or "Common"
		v35.Id = iterSecond2.Id or 0
		v35.Health = iterSecond2.Health or 0
		v35.Power = iterSecond2.Power or 0
		v35.Bio = iterSecond2.Bio or "Foil Not Loaded..."
		v35.LibraryIndex = iterFirst2 .. "-Foil"
		v35.Foil = true
		v35.AttackEffect = iterSecond2.AttackEffect or "Slash"

		if iterSecond2.AltArt then
			v35.Pack = "the Art Box"
		end

		v35.AltArt = false
		v35.AltCards = false
		v35.Original = iterSecond2.Original or iterFirst2
		v35.UnfoiledIndex = iterFirst2

		if iterSecond2.Original then
			module[iterSecond2.Original].AltCards[iterFirst2 .. "-Foil"] = v35
		elseif module[iterFirst2].AltCards then
			module[iterFirst2].AltCards[iterFirst2 .. "-Foil"] = v35
		else
			module[iterFirst2].AltCards = { [iterFirst2 .. "-Foil"] = v35 }
		end

		for iterFirst4, iterSecond4 in v9(t7) do
			if v35[iterSecond4] then
				v35[iterSecond4] = v35[iterSecond4] .. "-Foil"
			end
		end

		if v35.Effect then
			if v35.Effect.Type and v8(v35.Effect.Type) ~= "table" and table.find(_G.TrackEffects[1], v35.Effect.Type) == nil then
				table.insert(_G.TrackEffects[1], v35.Effect.Type)
			end

			if v35.Effect.Power and v8(v35.Effect.Power) == "table" then
				for iterFirst5, iterSecond5 in v9(v35.Effect.Power) do
					if table.find(_G.TrackEffects[2], iterSecond5[1]) == nil then
						table.insert(_G.TrackEffects[2], iterSecond5[1])
					end
				end
			end
		end

		t6[iterFirst2 .. "-Foil"] = v35
		n2 += 1
	end
end

TestPartLibrary({ Name = "Foils" }, t6, module)

local n3: number = n1

dprint("Cards:" .. n3)
dprint("Foils:" .. n2)
dprint("Types/Powers:", _G.TrackEffects)

function UpdateCardLibrary(p10)
	for iterFirst, iterSecond in v9(module) do
		if p10 then
			for iterFirst2, iterSecond2 in v9(p10) do
				if iterFirst == iterFirst2 or iterSecond.Original and iterFirst2 == iterSecond.Original then
					print(iterFirst2)

					for iterFirst3, iterSecond3 in v9(iterSecond2) do
						iterSecond[iterFirst3] = iterSecond3
					end
				end
			end
		end
	end
end

cardLibUpdate.UpdateCardLibrary = UpdateCardLibrary

return module
