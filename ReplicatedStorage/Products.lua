



local module: {[any]: any} = {}

if game:GetService("RunService"):IsClient() then
	return module
end

module.Ready = false

local marketplaceService: MarketplaceService = game:GetService("MarketplaceService")
local port = game.ReplicatedStorage:WaitForChild("Port")
local BloxBuxValue = game.ReplicatedStorage.Strings.BloxBux.Value
local t2: {[any]: any} = {}
local t3: {[any]: any} = {
	43059346,
	3394034772,
	43059356,
	43059363,
	43059434,
	1350545538,
	43059371,
	1864102242,
	1349741390,
	1797469269,
	1229541584,
	1362563060,
	1225919929,
	1386365096,
	1775072581,
	1263943620,
	1351502027,
	1502682133,
	1351186187,
	1351186618,
	3482336137,
	3482335189
}
local t4: {[any]: any} = {}
local t5: {[any]: any} = {}

module.Offers = { Ids = t3, Infos = t4, ByPrice = t5 }

local t6: {[any]: any} = { 26013492, 26013495, 26013498, 26013497, 26013496, 26013489 }
local t7: {[any]: any} = {}

module.BloxBux = { Ids = t6, Infos = t7 }

local t8: {[any]: any} = { 1902077465, 1902077827, 1902079374, 1902083235 }
local t9: {[any]: any} = {}

module.RaidBoost = { Ids = t8, Infos = t9 }

local t10: {[any]: any} = { 29831631, 29831644 }
local t11: {[any]: any} = {}
local t12: {[any]: any} = {}

module.Charms = { Ids = t10, Infos = t11, SaveIndex = t12 }

local t13: {[any]: any} = {
	293451895,
	293452245,
	358277604,
	293551969,
	293179936,
	293180404,
	293179132,
	292156638,
	416961647,
	416961689,
	416961626
}
local t14: {[any]: any} = {}

module.Passes = {
	Ids = t13,
	Infos = t14,
	TypeBounds = {
		DLC = { 1, 4 },
		Cards = { 5, 8 },
		Cards2 = { 8, 10 },
		Aife = { 9, 11 }
	}
}

function module.RegisterCallback(p1)
	t2[p1] = p1
end
local function fetch()
	task.spawn(function()
		for k, v in pairs(t10) do
			local v30 = marketplaceService:GetProductInfo(v, Enum.InfoType.Product)

			t12[v] = k
			t11[v] = v30
		end

		for _, v in pairs(t6) do
			local v33 = marketplaceService:GetProductInfo(v, Enum.InfoType.Product)
			local v34 = nil
			local v35 = nil

			for iterValue in string.gmatch(v33.Name, "%d+") do
				if v34 then
					v35 = iterValue
				else
					v34 = iterValue
				end
			end

			v33.PercentOff = v35
			v33.BloxBux = v34
			v33.VendorString = v34 .. BloxBuxValue .. "\nfor " .. v33.PriceInRobux .. "R$" .. (v35 and "\n[" .. v35 .. "% EXTRA]" or "")
			t7[v] = v33
		end

		for _, v in pairs(t8) do
			local v39 = marketplaceService:GetProductInfo(v, Enum.InfoType.Product)
			local v40 = nil

			for iterValue2 in string.gmatch(v39.Name, "%d+") do
				v40 = iterValue2
			end

			v39.Duration = v40
			v39.VendorString = v39.PriceInRobux .. "R$"
			t9[v] = v39
		end

		for _, v in pairs(t3) do
			local v44 = marketplaceService:GetProductInfo(v, Enum.InfoType.Product)

			t4[v] = v44
			t5[v44.PriceInRobux] = t4[v]
		end

		for _, v in pairs(t13) do
			t14[v] = marketplaceService:GetProductInfo(v, Enum.InfoType.Asset)
		end

		for _, v in pairs(t2) do
			pcall(v)
		end

		module.Ready = true
		port:FireAllClients("UpdateProducts", module)
	end)
end

module.Fetch = fetch

local n1 = 0

repeat
	local v20 = pcall(fetch)
	local v21 = task.wait(0.1)

	n1 += v21
until not not v20 or n1 > 60

local ok, result = pcall(fetch)

task.spawn(function()
	while true do
		task.wait(300)
		n1 = 0

		repeat
			local v25 = pcall(fetch)
			local v26 = n1
			local v27 = task.wait(0.1)

			n1 = v26 + v27
		until not not v25 or n1 > 60
	end
end)

return module
