





local engines = require(script.Parent.Engines).engines
local fakemouse = require(script.Parent.FakeMouse).fakemouse
local clamp = require(game.ReplicatedStorage.Utils).Clamp
local customscalings = require(script.Parent.CustomScalings).customscalings
local temp = require(script.Parent.Temp)

local function u6()
	return 0
end

spawn(function()
	repeat
		wait(0.1)
	until temp.InspectionHeight

	u6 = temp.InspectionHeight
end)

local LocalPlayer = game.Players.LocalPlayer
local visGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")
local mouse = LocalPlayer:GetMouse()
local visGuiDebugStats = visGui.DebugStats
local visGuiDebugStatsTitle = visGuiDebugStats.Title
local n1 = visGuiDebugStats.AbsoluteSize.X / 2
local n2 = visGuiDebugStatsTitle.TextBounds.Y + 12
local y = visGui.AbsoluteSize.Y
local x = visGui.AbsoluteSize.X
local u16 = nil
local uDim2New = UDim2.new

function engines.UpdateDebugStats()
	if not u16 then
		return
	end

	local n3 = mouse.Y + 32
	local v19 = u6()
	local v20 = clamp(0, y - n2, n3 + v19)

	v19 = clamp(0, x - n1 * 2, fakemouse.X - n1)
	visGuiDebugStats.Position = uDim2New(0, v19, 0, v20)
end
function customscalings.DebugStats()
	y = visGui.AbsoluteSize.Y
	x = visGui.AbsoluteSize.X
end

print("Finished loading " .. script.Name)

return {
	Update = function(p1)
		if p1 and p1 ~= "" then
			visGuiDebugStats.Title.Text = tostring(p1)
			n2 = visGuiDebugStatsTitle.TextBounds.Y + 12
			visGuiDebugStats.Size = uDim2New(0, visGuiDebugStatsTitle.TextBounds.X + 12, 0, n2)
			n1 = visGuiDebugStats.AbsoluteSize.X / 2
			u16 = true
			engines.UpdateDebugStats()
			visGuiDebugStats.Visible = true

			return
		end

		visGuiDebugStats.Visible = false
		u16 = false
	end
}
