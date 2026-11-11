





local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local utils = require(game.ReplicatedStorage.Utils)
local t1: {[any]: any} = {}
local v4, v5 = game:GetService("GuiService"):GetGuiInset()
local y = v4.Y

print("Finished loading " .. script.Name)

return {
	AddButton = function(name, p2, p3)
		local v10 = utils.New("ImageButton")
		local uDim2 = UDim2.new(0, 50, 0, y + 5)
		local uDim22 = UDim2.new(0, (#t1 + 1) * 45 + 5, 0, 0)
		local parent = v10({
			Image = "",
			ZIndex = 10,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Name = name,
			Size = uDim2,
			Position = uDim22
		})
		local v14 = utils.New("ImageLabel")({
			Name = "Icon",
			BackgroundTransparency = 1,
			ZIndex = 10,
			Size = UDim2.new(0, 28, 0, 27),
			Position = UDim2.new(0.5, -14, 0.5, -13),
			Image = p2,
			Parent = parent
		})

		parent.Parent = visGui.FakeTopBar
		t1[#t1 + 1] = { name, parent, p3 }
		parent.MouseButton1Down:Connect(function()
			p3()
		end)

		return parent, v14
	end
}
