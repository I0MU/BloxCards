





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
local u11 = false
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local module: {[any]: any} = {
	Active = t1,
	Purchase = function(p1, p2)
		if not p1.Hidden and (not p1.PriceInBloxBux or not (p1.PriceInBloxBux > data.Money())) then
			network.FireServer("OfferPrepare", "Sets", p2)

			return
		end

		robuxService.InsufficientFunds(p1.PriceInBloxBux)
	end,
	PurchaseSingle = function(p3, p4)
		u11 = true
		networkClient.OpenSinglePurchaseMenu(p3, p4)
	end,
	GetPriceString = function(p5)
		if p5.PriceInRobux and p5.PriceInRobux > 0 then
			return utils.FormatNumber(p5.PriceInRobux) .. "R$"
		end

		if p5.PriceInBloxBux and p5.PriceInBloxBux > 0 then
			return utils.FormatNumber(p5.PriceInBloxBux) .. BloxBuxValue
		end
	end,
	GetSinglePriceString = function(p6)
		if p6.SingleCost and p6.SingleCost > 0 then
			return utils.FormatNumber(p6.SingleCost) .. BloxBuxValue
		end
	end,
	GetNonFoilPriceString = function(p7)
		if p7.NonFoilCost and p7.NonFoilCost > 0 then
			return utils.FormatNumber(p7.NonFoilCost) .. BloxBuxValue
		end
	end,
	DisableButtons = function(p8)
		u11 = p8
	end
}

function module.new(physical, p10, _, p12)
	if replicatedStorage:FindFirstChild("ReservedServer") then
		print("Skip")

		return
	end

	local object = setmetatable(p10, { __index = module })

	physical.Title.Text = p10.Title
	physical.Title.Back.Text = p10.Title
	physical.SubTitle.Text = p10.SubTitle
	physical.SubTitle.Back.Text = p10.SubTitle
	physical.Image = p10.Image or "rbxassetid://530404369"
	object.Physical = physical

	local v27 = object:GetPriceString()

	physical.Purchase.Title.Text = v27
	physical.Purchase.Title.Back.Text = v27

	if not object.PriceInRobux then
		physical.Purchase.BackgroundColor3 = Color3.new(0.917647, 0.631373, 0.137255)
	end

	if object.SingleCost then
		local v28 = object:GetSinglePriceString()

		physical.PurchaseSingle.Title.Text = "Buy Single Card: " .. v28
		physical.PurchaseSingle.Title.Back.Text = "Buy Single Card: " .. v28
		physical.PurchaseSingle.Visible = true
		paperRipple.FromParent(physical.PurchaseSingle)
		physical.PurchaseSingle.MouseButton1Click:connect(function()
			if u11 ~= true then
				audioService.PlaySound("lock")
				object:PurchaseSingle(p12)
			end
		end)
	end

	if object.NonFoilCost then
		local v29 = object:GetNonFoilPriceString()

		if object.Preconstructed then
			physical.PurchaseNonFoil.Title.Text = "Base Card Precon Deck: " .. v29
			physical.PurchaseNonFoil.Title.Back.Text = "Base Card Precon Deck: " .. v29
		else
			physical.PurchaseNonFoil.Title.Text = "Base Cards: " .. v29
			physical.PurchaseNonFoil.Title.Back.Text = "Base Cards: " .. v29
		end

		physical.PurchaseNonFoil.Visible = true
		paperRipple.FromParent(physical.PurchaseNonFoil)
		physical.PurchaseNonFoil.MouseButton1Click:connect(function()
			if u11 ~= true then
				audioService.PlaySound("lock")
				object:Purchase(p12 .. "NonFoil")
				u11 = true
				task.spawn(function()
					task.wait(2)
					u11 = false
				end)
			end
		end)
	end

	paperRipple.FromParent(physical.Purchase)
	physical.Purchase.MouseButton1Click:connect(function()
		if u11 ~= true then
			audioService.PlaySound("lock")
			object:Purchase(p12)
			u11 = true
			task.spawn(function()
				task.wait(2)
				u11 = false
			end)
		end
	end)

	local u30 = nil

	physical.ViewContents.MouseButton1Click:connect(function()
		if not u30 then
			u30 = network.InvokeServer("GetSetsContents", "Sets", p12)
		end

		networkClient.QuickShowRewards(u30)
	end)
	t1[#t1 + 1] = object

	return object
end

print("Finished loading " .. script.Name)

return module
