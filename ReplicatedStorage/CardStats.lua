



return {
	Stats = function()
		local config = require(game.ReplicatedStorage.CONFIG)
		local cardLibrary = require(game.ReplicatedStorage.CardLibrary)
		local packs = require(game.ReplicatedStorage.Packs)

		for _, v in pairs(packs) do
			if v.Library ~= nil then
				local library = require(v.Library)

				for k, iterValue in pairs(library) do
					if v.Cards[k] == nil and iterValue.Rarity ~= "Token" then
						table.insert(v.Cards, k)
					end
				end
			end
		end

		local function Percent(p1, p2)
			if p1 == 0 or p2 == 0 then
				return "0%"
			end

			return math.floor(p1 / p2 * 1000) / 10 .. "%"
		end

		local configColororder = config.COLORORDER
		local configRarityorder = config.RARITYORDER
		local t1: {[any]: any} = {}

		for _, v in pairs(packs) do
			local t2: {[any]: any} = {}
			local t3: {[any]: any} = {}
			local t4: {[any]: any} = {}
			local t5: {[any]: any} = {}

			for _, iterValue2 in pairs(configColororder) do
				t2[iterValue2] = {}
				t5[iterValue2] = {}
				t3[iterValue2] = 0

				for _, iterValue3 in pairs(configRarityorder) do
					t2[iterValue2][iterValue3] = 0
					t5[iterValue2][iterValue3] = {}
					t4[iterValue3] = 0
				end
			end

			local n1: number = 0

			for _, iterValue4 in pairs(v.Cards) do
				local v26 = cardLibrary[iterValue4]

				if v26 then
					local v27 = v26.Color
					local rarity = v26.Rarity

					t2[v27][rarity] = t2[v27][rarity] + 1
					t3[v27] = t3[v27] + 1
					t4[rarity] = t4[rarity] + 1
					table.insert(t5[v27][rarity], iterValue4)
					n1 += 1
				end
			end

			print(v.Name)
			print("COLOR & RARITY\t# OF CARDS\tPACK PERCENTAGE\tCOLOR + RARITY PERCENTAGE\tLIST OF CARDS")

			for _, iterValue5 in pairs(configColororder) do
				local v31 = t3[iterValue5]
				local v32 = t3[iterValue5]
				local s1: string = if v32 == 0 or n1 == 0 then "0%" else math.floor(v32 / n1 * 1000) / 10 .. "%"

				print(iterValue5 .. " cards\t" .. v31 .. "\t" .. s1 .. "\t" .. "% of cards as this rarity is " .. iterValue5)

				for _, iterValue6 in pairs(configRarityorder) do
					local v36 = t2[iterValue5][iterValue6]
					local v37 = t2[iterValue5][iterValue6]
					local s2: string = if v37 == 0 or n1 == 0 then "0%" else math.floor(v37 / n1 * 1000) / 10 .. "%"
					local v39 = t2[iterValue5][iterValue6]
					local v40 = t4[iterValue6]
					local s3: string = if v39 == 0 or v40 == 0 then "0%" else math.floor(v39 / v40 * 1000) / 10 .. "%"

					v40 = table.concat(t5[iterValue5][iterValue6], ", ")
					print(iterValue5 .. " " .. iterValue6 .. "\t" .. v36 .. "\t" .. s2 .. "\t" .. s3 .. "\t" .. v40)
				end
			end

			print("TOTAL\t" .. n1)
		end
	end
}
