



local color3 = Color3.fromRGB(55, 85, 255)
local color32 = Color3.fromRGB(255, 0, 55)
local color33 = Color3.fromRGB(0, 255, 55)
local color34 = Color3.fromRGB(255, 255, 55)
local color35 = Color3.fromRGB(255, 255, 255)
local t1: {[any]: any} = { Blue = "B", Red = "R", Green = "G", Yellow = "Y", Neutral = "C" }
local t2: {[any]: any} = { "Neutral", "Red", "Green", "Blue", "Yellow" }
local autoCost = game.ReplicatedStorage.UI.AutoCost
local t3: {[any]: any} = {
	Blue = color3,
	Red = color32,
	Green = color33,
	Yellow = color34,
	Neutral = color35
}

return function(parent, p2, p3)
	local clone = autoCost.StudHolder:Clone()

	clone.ZIndex = parent.ZIndex + 10
	clone.Parent = parent

	local n1 = 0
	local n2: number = 0

	for _, v in pairs(p2) do
		if v > 0 then
			n1 += v
			n2 += 1
		end
	end

	if p3 then
		clone.Size = UDim2.fromScale(0.65, 0.06)
		clone.Position = UDim2.fromScale(0.07, 0.95)
		clone.AnchorPoint = Vector2.new(0, 1)
		clone.AutomaticSize = Enum.AutomaticSize.X
		clone.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		clone.TextHolder.CostText.TextXAlignment = Enum.TextXAlignment.Left

		if n1 <= 9 then
			local clone2 = autoCost.Buffer:Clone()

			clone2.Parent = clone
		end
	end

	if n1 == 0 then
		clone.TextHolder.CostText.Text = "Free"
		clone.TextHolder.CostText.ZIndex = clone.ZIndex + 1
		clone.TextHolder.CostText.Visible = true

		return clone
	end

	if p3 then
		n1 += 1
	end

	if n1 <= 10 then
		for _, v in pairs(t2) do
			if p2[v] then
				for _ = 1, p2[v] do
					local clone3 = autoCost.StudTemplate:Clone()

					clone3.Parent = clone
					clone3.ImageColor3 = t3[v]
					clone3.ZIndex = clone.ZIndex + 1
					clone3.Visible = true
				end
			end
		end
	else
		local s1: string = ""

		for _, v in pairs(t2) do
			if p2[v] and p2[v] ~= 0 then
				local floored = math.floor(t3[v].R * 255)
				local floored2 = math.floor(t3[v].G * 255)
				local floored3 = math.floor(t3[v].B * 255)

				s1 = s1 .. "<font color=\"rgb(" .. floored .. "," .. floored2 .. "," .. floored3 .. ")\">" .. p2[v] .. t1[v] .. "</font> "
			end
		end

		clone.TextHolder.CostText.Text = s1
		clone.TextHolder.CostText.ZIndex = clone.ZIndex + 1
		clone.TextHolder.CostText.Visible = true
	end

	if p3 and not clone:FindFirstChild("EndBuffer") then
		local clone4 = autoCost.Buffer:Clone()

		clone4.Name = "EndBuffer"
		clone4.Parent = clone
		clone4.LayoutOrder = 2
	end

	return clone
end
