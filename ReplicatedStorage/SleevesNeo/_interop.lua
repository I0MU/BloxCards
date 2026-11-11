



local parent = require(script.Parent)

require(script.Parent._types)

function registerLegacyInterop(p1, p2)
	parent:AddIngestCallback(function(p3)
		for _, v in ipairs(p3) do
			local v7 = nil
			local u8: boolean = false

			for k, iterValue in pairs(p1) do
				if table.find(v.Tags, k:lower()) then
					v7 = k
				end

				if iterValue[v.Id] ~= nil then
					u8 = true

					break
				end
			end

			if not u8 then
				p1[v7 or p2][v.Id] = {
					v.AssetId,
					v.Costs and v.Costs.BloxBux or 0,
					v.Costs and v.Costs.Robux or 0,
					v.UnlockOnly
				}
			end
		end
	end, "LegacyIngest", true)
end

return registerLegacyInterop
