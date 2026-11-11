





local network = require(script.Parent.Network)
local data = require(script.Parent.Data)
local v3 = network.InvokeServer("GetCurrentOffers")
local v4 = network.InvokeServer("GetCurrentSetups")
local v5 = network.InvokeServer("GetCurrentPrebuilts")
local products = require(game.ReplicatedStorage:WaitForChild("Products"))
local LocalPlayer = game.Players.LocalPlayer
local marketplaceService: MarketplaceService = game:GetService("MarketplaceService")
local module: {[any]: any} = {
	CurrentOffers = v3,
	CurrentSetups = v4,
	CurrentPrebuilts = v5,
	Products = products
}

function InsufficientFunds(p1)
	if not network.InvokeServer("CanUseArtBox") then
		return
	end

	local v11 = data.Money()
	local absoluteValue = math.abs(p1 - v11)
	local n1 = math.huge
	local v14 = module.Products.BloxBux.Ids[1]

	for k, v in pairs(module.Products.BloxBux.Infos) do
		local vBloxBux = v.BloxBux
		local absoluteValue2 = math.abs(absoluteValue - vBloxBux)

		if n1 > absoluteValue2 and p1 <= v11 + vBloxBux then
			n1 = math.abs(absoluteValue - vBloxBux)
			v14 = k
		end
	end

	marketplaceService:PromptProductPurchase(LocalPlayer, v14)
end

module.InsufficientFunds = InsufficientFunds
print("Finished loading " .. script.Name)

return module
