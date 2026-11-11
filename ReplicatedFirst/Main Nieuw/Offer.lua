





local t1: {[any]: any} = {}
local network = require(script.Parent.Network)
local robuxService = require(script.Parent.RobuxService)
local data = require(script.Parent.Data)
local networkClient = network.client
local utils = require(game.ReplicatedStorage.Utils)
local utilsPlural = utils.Plural
local paperRipple = require(script.Parent.Nevermore).PaperRipple
local BloxBuxValue = game.ReplicatedStorage.Strings.BloxBux.Value

local module: {[any]: any} = {
	Active = t1,
	Map = {},
	CountdownLoop = function()
		while true do
			local timestamp = os.time()

			for _, v in pairs(t1) do
				v:Redraw(timestamp)
			end

			wait(1)
		end
	end
}

spawn(module.CountdownLoop)

function module.Purchase(p1, p2)
	if not p1.Hidden and (not p1.PriceInBloxBux or not (p1.PriceInBloxBux > data.Money())) then
		network.FireServer("OfferPrepare", "Offer", p2)

		return
	end

	robuxService.InsufficientFunds(p1.PriceInBloxBux)
end
function module.DisablePurchase(p3)
	p3.BestBefore = nil
end
function module.UpdateTimeLeft(p4, p5)
	p4.Physical.Purchase.Expires.Title.Text = p5
end

local t3: {[any]: any} = {
	{ "week", 604800 },
	{ "day", 86400 },
	{ "hour", 3600 },
	{ "minute", 60 }
}

function module.Redraw(p6, p7)
	local bestBefore = p6.BestBefore

	if not bestBefore then
		p6.Physical.Purchase.Expires.Visible = false

		return
	end

	if p7 > bestBefore then
		p6:DisablePurchase()
	end

	for _, v in pairs(t3) do
		local v26 = v[1]
		local floored = math.floor((bestBefore - p7) / v[2])

		if floored >= 1 then
			local v28 = utilsPlural(floored)

			p6:UpdateTimeLeft("Ends in " .. floored .. " " .. v26 .. (if v28 then "s" else "") .. "!")

			return
		end
	end
end
function module.GetPriceString(p8)
	if p8.PriceInRobux and p8.PriceInRobux > 0 then
		return utils.FormatNumber(p8.PriceInRobux) .. "R$"
	end

	if p8.PriceInBloxBux and p8.PriceInBloxBux > 0 then
		return utils.FormatNumber(p8.PriceInBloxBux) .. BloxBuxValue
	end
end

local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

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

	local v35 = object:GetPriceString()

	physical.Purchase.Title.Text = v35
	physical.Purchase.Title.Back.Text = v35
	paperRipple.FromParent(physical.Purchase)
	physical.Purchase.MouseButton1Click:connect(function()
		object:Purchase(p12)
	end)

	local u36 = nil

	physical.ViewContents.MouseButton1Click:connect(function()
		if not u36 then
			u36 = network.InvokeServer("GetOfferContents", "Offer", p12)
		end

		networkClient.QuickShowRewards(u36)
	end)
	t1[#t1 + 1] = object
	module.Map[p12] = object
	object:Redraw(os.time())

	return object
end
function module.DisableOffer(p13)
	local v38 = module.Map[p13]

	if not v38 then
		return
	end

	print("Disabling offer " .. p13)
	v38:DisablePurchase()
end

networkClient.DisableOffer = module.DisableOffer
print("Finished loading " .. script.Name)

return module
