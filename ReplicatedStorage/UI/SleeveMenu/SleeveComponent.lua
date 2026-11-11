



local replicatedFirst: ReplicatedFirst = game:GetService("ReplicatedFirst")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

require(replicatedStorage.SleevesNeo._types)

local utils = require(replicatedStorage.Utils)
local BloxBuxValue = replicatedStorage.Strings.BloxBux.Value
local nevermoreEngine = require(replicatedStorage.NevermoreEngine)
local data = require(replicatedFirst["Main Nieuw"].Data)
local dataUpdateCashMoney = data.UpdateCashMoney
local network = require(replicatedFirst["Main Nieuw"].Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local robuxService = require(replicatedFirst["Main Nieuw"].RobuxService)
local paperRipple = nevermoreEngine.LoadLibrary("PaperRipple")
local baseSleeve: Instance = script.Parent:WaitForChild("base"):WaitForChild("BaseSleeve")
local u14 = nil
local connection = nil
local u16: boolean = false

local function CheckForSleeveBadge()
	if data.SleeveAmount() >= 5 and not u16 then
		print("Sent sleevebadge request")
		networkFireServer("GimmeSleeveBadge")
		u16 = true
	end
end
local function DeselectSleeve(p1)
	if not u14 then
		return
	end

	u14.Button.Title.Text = "Select"
	u14.Button.Title.Back.Text = u14.Button.Title.Text

	if p1 and p1.Hidden then
		p1.Physical.ImageColor3 = Color3.new(0, 0, 0)
	end

	if connection ~= nil then
		connection:Disconnect()
	end
end
local function SelectSleeve(p2, p3)
	local v26 = p2.Name
	local v27 = data.CurrentSleeveName()

	if v26 == v27 and p3 ~= true then
		return
	end

	DeselectSleeve(p2)
	data.SetSleeve(p2.Name)
	networkFireServer("SetSleeve", p2.Name)

	if p2 then
		p2.Button.Title.Text = "Selected"
		p2.Button.Title.Back.Text = p2.Button.Title.Text
		p2.Physical.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end

	u14 = p2
	connection = p2.Physical.Destroying:Connect(function()
		if u14 == p2 then
			u14 = nil
		end

		connection = nil
	end)
	dataUpdateCashMoney()
end
local function UpdateViewSleeve(p4, p5)
	p4.Button.ImageTransparency = 0
	p4.Button.ImageColor3 = data.CurrentSleeveName() == p4.Name and Color3.fromRGB(224, 64, 251) or p4.Owned and Color3.fromRGB(0, 176, 255) or p4.Hidden and Color3.new(0.5, 0.5, 0.5) or Color3.fromRGB(0, 200, 83)

	if p4.Hidden and p5 == false then
		p4.Physical.ImageColor3 = Color3.new(0, 0, 0)
	elseif p4.Hidden and data.CurrentSleeveName() == p4.Name and p5 ~= false and p4.Owned then
		p4.Physical.ImageColor3 = Color3.new(255, 255, 255)
	end

	if p4.Owned and data.CurrentSleeveName() ~= p4.Name then
		p4.Button.ImageColor3 = Color3.new(1, 1, 1)
		p4.Button.Title.Text = "Select"
		p4.Button.Title.Back.Text = p4.Button.Title.Text
	elseif p4.Owned and data.CurrentSleeveName() == p4.Name then
		p4.Button.Title.Text = "Selected"
		p4.Button.Title.Back.Text = p4.Button.Title.Text
		p4.Physical.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end
end
local function PurchaseSleeve(p6, p7)
	if not p7.Costs then
		return
	end

	if not (data.Money() >= p7.Costs.BloxBux) then
		robuxService.InsufficientFunds(p7.Costs.BloxBux)
	elseif networkInvokeServer("BuySleeve", p6.Name) then
		SelectSleeve(p6)
		p6.Owned = true
		UpdateViewSleeve(p6)

		if data.SleeveAmount() >= 5 and not u16 then
			print("Sent sleevebadge request")
			networkFireServer("GimmeSleeveBadge")
			u16 = true

			return
		end
	end
end
local function HandleSleeveButton(p8, p9)
	if p8.Owned then
		SelectSleeve(p8)
	elseif p8.Hidden == false then
		PurchaseSleeve(p8, p9)
	end
end

return {
	new = function(p10, parent)
		local data2 = p10.data
		local clone: Instance = baseSleeve:Clone()

		clone.Name = data2.Id
		clone.Image = "rbxassetid://" .. data2.AssetId

		local button: Instance = clone:FindFirstChild("Button")
		local name: Instance = clone:FindFirstChild("Name")
		local t1: {[any]: any} = {
			Name = data2.Id,
			Physical = clone,
			Cost = data2.Costs and data2.Costs.BloxBux or nil,
			Id = data2.AssetId,
			Button = button,
			Hidden = if data2.UnlockOnly == true then true else false,
			Number = p10.idx ~= nil and p10.idx or -1,
			Owned = data2.Owned or data.OwnsSleeve(data2.Id)
		}
		local title = nil

		if button then
			title = button:FindFirstChild("Title")
			paperRipple.FromParent(button)
		end

		if name then
			name.Text = data2.Name
		end

		if title then
			local back = title:FindFirstChild("Back")

			title.Text = if t1.Owned then "Select" else utils.FormatNumber((tostring(data2.Costs and data2.Costs.BloxBux or 1234))) .. BloxBuxValue

			if t1.Owned and data.CurrentSleeveName() == t1.Name then
				title.Text = "Selected"
				u14 = t1
				connection = clone.Destroying:Connect(function()
					if u14 == t1 then
						u14 = nil
					end

					connection = nil
				end)
			end

			if t1.Hidden then
				if t1.Owned then
					clone.ImageColor3 = Color3.new(1, 1, 1)
					title.Text = "Select"

					if data.CurrentSleeveName() == t1.Name then
						title.Text = "Selected"
					end
				else
					clone.ImageColor3 = Color3.new(0.356863, 0.356863, 0.356863)
					title.Text = "Unlock This!"
				end
			end

			if back then
				back.Text = title.Text
			end
		end

		clone.Visible = true

		if typeof(parent) == "Instance" then
			clone.Parent = parent
		end

		t1.Button.MouseButton1Click:Connect(function()
			local v43: {[any]: any} = t1

			if v43.Owned then
				SelectSleeve(v43)
			elseif v43.Hidden == false then
				PurchaseSleeve(v43, data2)
			end

			if typeof(p10.onButtonClick) == "function" then
				p10.onButtonClick(t1)
			end

			UpdateViewSleeve(t1)
		end)

		return t1
	end
}
