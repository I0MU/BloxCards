





local t1: {[any]: any} = {}
local network = require(script.Parent.Network)
local networkClient = network.client
local robuxService = require(script.Parent.RobuxService)
local data = require(script.Parent.Data)
local audioService = require(game.ReplicatedStorage.AudioService)
local utils = require(game.ReplicatedStorage.Utils)
local utilsPlural = utils.Plural
local paperRipple = require(script.Parent.Nevermore).PaperRipple
local BloxBuxValue = game.ReplicatedStorage.Strings.BloxBux.Value
local u11: boolean = false
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local module: {[any]: any} = {
	Active = t1,
	Purchase = function(p1, p2)
		if not p1.Hidden and (not p1.PriceInBloxBux or not (p1.PriceInBloxBux > data.Money())) then
			network.FireServer("OfferPrepare", "Prebuilt", p2)

			return
		end

		robuxService.InsufficientFunds(p1.PriceInBloxBux)
	end,
	GetPriceString = function(p3)
		if p3.PriceInRobux and p3.PriceInRobux > 0 then
			return utils.FormatNumber(p3.PriceInRobux) .. "R$"
		end

		if p3.PriceInBloxBux and p3.PriceInBloxBux > 0 then
			return utils.FormatNumber(p3.PriceInBloxBux) .. BloxBuxValue
		end
	end,
	GetNonFoilPriceString = function(p4)
		if p4.NonFoilCost and p4.NonFoilCost > 0 then
			return utils.FormatNumber(p4.NonFoilCost) .. BloxBuxValue
		end
	end
}

function module.new(physical, p6, _, p8)
	if replicatedStorage:FindFirstChild("ReservedServer") then
		print("Skip")

		return
	end

	local object = setmetatable(p6, { __index = module })

	physical.Title.Text = p6.Title
	physical.Title.Back.Text = p6.Title
	physical.SubTitle.Text = p6.SubTitle
	physical.SubTitle.Back.Text = p6.SubTitle
	physical.Image = p6.Image or "rbxassetid://530404369"
	object.Physical = physical

	local v23 = object:GetPriceString()

	physical.Purchase.Title.Text = v23
	physical.Purchase.Title.Back.Text = v23

	if not object.PriceInRobux then
		physical.Purchase.BackgroundColor3 = Color3.new(0.917647, 0.631373, 0.137255)
	end

	if object.NonFoilCost then
		local v24 = object:GetNonFoilPriceString()

		physical.PurchaseNonFoil.Title.Text = "Base Card Precon Deck: " .. v24
		physical.PurchaseNonFoil.Title.Back.Text = "Base Card Precon Deck: " .. v24
		physical.PurchaseNonFoil.Visible = true
		paperRipple.FromParent(physical.PurchaseNonFoil)
		physical.PurchaseNonFoil.MouseButton1Click:connect(function()
			if u11 ~= true then
				audioService.PlaySound("lock")
				object:Purchase(p8 .. "NonFoil")
			end
		end)
	end

	paperRipple.FromParent(physical.Purchase)
	physical.Purchase.MouseButton1Click:connect(function()
		if u11 ~= true then
			audioService.PlaySound("lock")
			object:Purchase(p8)
			u11 = true
			task.spawn(function()
				task.wait(2)
				u11 = false
			end)
		end
	end)

	local u25 = nil

	physical.ViewContents.MouseButton1Click:connect(function()
		if not u25 then
			u25 = network.InvokeServer("GetPrebuiltContents", "Prebuilt", p8)
		end

		networkClient.QuickShowRewards(u25)
	end)
	t1[#t1 + 1] = object

	return object
end

print("Finished loading " .. script.Name)

return module
