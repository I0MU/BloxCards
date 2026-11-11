



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("KeyIcon")
local v3 = replicatedStorage("LabeledKeyIcon")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "KeyIconProvider"
module.KeyCodeToText = {
	[Enum.KeyCode.Zero] = "0",
	[Enum.KeyCode.One] = "1",
	[Enum.KeyCode.Two] = "2",
	[Enum.KeyCode.Three] = "3",
	[Enum.KeyCode.Four] = "4",
	[Enum.KeyCode.Five] = "5",
	[Enum.KeyCode.Six] = "6",
	[Enum.KeyCode.Seven] = "7",
	[Enum.KeyCode.Eight] = "8",
	[Enum.KeyCode.Nine] = "9",
	[Enum.KeyCode.LeftControl] = "CTRL",
	[Enum.KeyCode.RightControl] = "CTRL"
}
module.ImageMap = {
	[Enum.UserInputType.MouseButton1] = { Default = "rbxassetid://314340595", Fill = "rbxassetid://314357774" }
}

function module.new(p1)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.DefaultIconBar = p1 or error("No DefaultIconBar")

	return t2
end
function module.GetIconBar(p2)
	return p2.DefaultIconBar
end
function module.GetKeycodeText(p3, p4)
	return p3.KeyCodeToText[p4] or p4.Name
end
function module.GetIcon(p5, p6, p7)
	local v13 = (p7 or p5.DefaultIconBar or error("No KeyIconBar")):GetHeight()

	if module.ImageMap[p6] then
		return (v2.NewDefault(v13, module.ImageMap[p6]))
	end

	local v14 = p5:GetKeycodeText(p6):upper()
	local v15 = v2.NewDefault(v13)

	v15.GUI.Text = v14
	v15:RescaleWidth()

	return v15
end
function module.GetLabeledKey(p8, p9, p10, p11)
	local v20 = p11 or p8.DefaultIconBar or error("No KeyIconBar")

	v20 = p8:GetIcon(p9, v20)

	local v21 = v3.FromKeyIcon(v20, p10)

	v21.GUI.Name = p9.Name .. "_" .. v21.GUI.Name

	return v21
end

return module
