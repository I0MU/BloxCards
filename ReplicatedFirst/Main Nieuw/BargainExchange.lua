



local bargainExchange = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("BargainExchange")
local nonGameCard = require(script.Parent.NonGameCard)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
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
local config = require(game.ReplicatedStorage.CONFIG)
local audioService = require(game.ReplicatedStorage.AudioService)
local shopRotation = require(game.ReplicatedStorage.ShopRotation)
local contextualize = require(script.Parent.Contextualize)
local data = require(script.Parent.Data)

workspace:WaitForChild("RotationalShops"):GetChildren()
bargainExchange.PackContents.Voucher.MouseEnter:connect(function()
	contextualize(bargainExchange.PackContents.Voucher, config.EVENTCURRENCYCONTEXT["Hallow's Bargains Voucher"], nil, "BargainExchange")
end)

function UpdateContentDisplay(p1)
	if p1 == true then
		bargainExchange.PackContents:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "Out", "Quad", 0.8, true)
	end

	for _, v in pairs(bargainExchange.PackContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end

	bargainExchange.PackContents.ContentList.CanvasPosition = Vector2.new(0, 0)

	local templateCard = bargainExchange.PackContents.ContentList.TemplateCard
	local v16 = data.GetEventCurrency()
	local v17 = config.EVENTCURRENCYIMAGE["Hallow's Bargains Voucher"]

	bargainExchange.PackContents.Voucher.Image = "rbxassetid://" .. v17

	if v16["Hallow's Bargains Voucher"] then
		local owned = bargainExchange.PackContents.Voucher.Owned
		local text: string = tostring(v16["Hallow's Bargains Voucher"])

		owned.Text = text .. " Owned"
	else
		bargainExchange.PackContents.Voucher.Owned.Text = "0 Owned"
	end

	for _, v in pairs(shopRotation[1]) do
		if cardLibrary[v].Rarity ~= "Token" and not cardLibrary[v].PlayTest then
			local clone = templateCard:Clone()

			clone.CardImage.Image = "rbxassetid://" .. cardLibrary[v].Id
			clone.Name = cardLibrary[v].LibraryIndex
			clone.Parent = bargainExchange.PackContents.ContentList
			clone.Visible = true
			nonGameCard.BindInspect(clone.CardImage, cardLibrary[v])

			local v23 = data.OwnedCardCopies(v)
			local v24 = data.OwnedCardCopies(v .. "-Foil")

			if type(v23) == "table" and v23["0"] and v23["0"] > 0 or type(v24) == "table" and v24["0"] and v24["0"] > 0 then
				local cloneOwnCount = clone.OwnCount
				local text: string = tostring(v23["0"] or 0)

				cloneOwnCount.Text = "Owned x" .. text

				if type(v24) == "table" and v24["0"] and v24["0"] > 0 then
					local ownCount = clone.OwnCount
					local OwnCountText = clone.OwnCount.Text
					local text2: string = tostring(v24["0"])

					ownCount.Text = OwnCountText .. " (" .. text2 .. "★)"
				end
			else
				clone.OwnCount.Text = "Unowned"
			end

			if v16["Hallow's Bargains Voucher"] and v16["Hallow's Bargains Voucher"] > 0 then
				clone.OwnCount.BackgroundColor3 = Color3.fromRGB(0, 200, 83)
				clone.OwnCount.MouseButton1Click:Connect(function()
					networkInvokeServer("BuyWithVoucher", clone.Name)
					task.wait(2)
					UpdateContentDisplay()
				end)
			else
				clone.OwnCount.BackgroundColor3 = Color3.fromRGB(53, 53, 56)
			end

			clone.LayoutOrder = config.REVERSECOLORORDER[cardLibrary[v].Color]
		end
	end
end

bargainExchange.PackContents.Close.MouseButton1Click:Connect(function()
	audioService.PlaySound("Door_unlock")
	bargainExchange.PackContents:TweenPosition(UDim2.new(0.1, 0, -3.05, 0), "Out", "Quad", 0.8, true)

	for _, v in pairs(bargainExchange.PackContents.ContentList:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "TemplateCard" then
			v:Destroy()
		end
	end
end)

return { UpdateContentDisplay = UpdateContentDisplay }
