





local config = require(game.ReplicatedStorage.CONFIG)
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
local configReversecolororder = config.REVERSECOLORORDER
local configRarities = config.RARITIES
local v5 = pairs
local tableInsert = table.insert

local function SortFunc(p1, p2)
	local v11 = cardLibrary[p1[1]]
	local v12 = cardLibrary[p2[1]]
	local v13 = v11.Original and cardLibrary[v11.Original] or v11
	local v14 = v12.Original and cardLibrary[v12.Original] or v12

	if v13.Name ~= v14.Name then
		return v13.Name < v14.Name
	end

	if v11.Original and v12.LibraryIndex == v11.Original then
		return false
	end

	if v12.Original and v11.LibraryIndex == v12.Original then
		return true
	end

	if v11.Name ~= v12.Name then
		return v11.Name < v12.Name
	end

	if v11.Foil then
		return false
	end

	if v12.Foil then
		return true
	end
end
local function GetCost(p3)
	if not p3.Cost then
		return 0
	end

	local n1 = 0
	local n2: number = 0

	for iterFirst, iterSecond in v5(p3.Cost) do
		if iterFirst ~= "Neutral" then
			n2 += 1
		end

		n1 += iterSecond
	end

	return n1 * 100 + n2
end

print("Finished loading " .. script.Name)

return function(p4, p5, p6)
	if not p6 then
		local t1: {[any]: any} = {}

		for iterFirst, iterSecond in v5(configReversecolororder) do
			t1[iterSecond] = {}

			for iterFirst2, iterSecond2 in v5(configRarities) do
				t1[iterSecond][iterSecond2] = {}
			end
		end

		for iterFirst3, iterSecond3 in v5(p4) do
			local v30 = cardLibrary[iterFirst3]

			if not v30 then
				warn(iterFirst3, v30)
			elseif v30 then
				local v31 = configReversecolororder[v30.Color]
				local v32 = configRarities[v30.Rarity]
				local n1

				if not v30.Cost then
					n1 = 0
				else
					local n2 = 0
					local n3: number = 0

					for iterFirst4, iterSecond4 in v5(v30.Cost) do
						if iterFirst4 ~= "Neutral" then
							n3 += 1
						end

						n2 += iterSecond4
					end

					n1 = n2 * 100 + n3
				end

				if not v31 or not v32 or not n1 then
					warn(iterFirst3, v30, v31, v32, n1, v30.Color, v30.Rarity)
				end

				t1[v31][v32].MaxCost = math.max(t1[v31][v32].MaxCost or 0, n1 or 0)

				if not t1[v31][v32][n1] then
					t1[v31][v32][n1] = {}
				end

				if v31 and v32 then
					tableInsert(t1[v31][v32][n1], { iterFirst3, iterSecond3 })
				else
					warn("orderedCards no such color or rarity", v30.Name, v30.Color, v30.Rarity)
				end
			end
		end

		for iterFirst5, iterSecond5 in v5(t1) do
			for iterFirst6, iterSecond6 in v5(iterSecond5) do
				for iterFirst7, iterSecond7 in v5(iterSecond6) do
					if typeof(iterSecond7) == "table" then
						table.sort(iterSecond7, SortFunc)
					end
				end
			end
		end

		for i = 1, #t1 do
			local v45 = t1[i]

			for j = 1, #v45 do
				local v47 = v45[j]

				if v47.MaxCost then
					for k = 0, v47.MaxCost do
						local v49 = v47[k]

						if v49 then
							for l = 1, #v49 do
								local v51 = v49[l]

								p5(v51[1], v51[2])
							end
						end
					end
				end
			end
		end

		return {}
	end

	local t2: {[any]: any} = {}
	t2 = {}

	for iterFirst8, iterSecond8 in v5(configReversecolororder) do
		t2[iterSecond8] = {}
	end

	for iterFirst9, iterSecond9 in v5(p4) do
		local v57 = cardLibrary[iterFirst9]

		if not v57 then
			warn(iterFirst9, v57)
		elseif v57 then
			local v58 = configReversecolororder[v57.Color]
			local n4

			if not v57.Cost then
				n4 = 0
			else
				local n5 = 0
				local n6: number = 0

				for iterFirst10, iterSecond10 in v5(v57.Cost) do
					if iterFirst10 ~= "Neutral" then
						n6 += 1
					end

					n5 += iterSecond10
				end

				n4 = n5 * 100 + n6
			end

			if not v58 or not n4 then
				warn(iterFirst9, v57, v58, n4, v57.Color)
			end

			t2[v58].MaxCost = math.max(t2[v58].MaxCost or 0, n4 or 0)

			if not t2[v58][n4] then
				t2[v58][n4] = {}
			end

			if not v58 then
				warn("orderedCards no such color or rarity", v57.Name, v57.Color)
			else
				tableInsert(t2[v58][n4], { iterFirst9, iterSecond9 })
			end
		end
	end

	for iterFirst11, iterSecond11 in v5(t2) do
		for iterFirst12, iterSecond12 in v5(iterSecond11) do
			if typeof(iterSecond12) == "table" then
				table.sort(iterSecond12, SortFunc)
			end
		end
	end

	for i = 1, #t2 do
		local v69 = t2[i]

		for j = 0, t2[i].MaxCost do
			local v71 = t2[i][j]

			if v71 then
				for k = 1, #v71 do
					local v73 = v71[k]
					local v74 = v73[1]

					p5(v74, v73[2])

					local v75 = cardLibrary[v74]
				end
			end
		end
	end
end
