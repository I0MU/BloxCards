





local t1: {[any]: any} = {}
local visGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui")

local module: {[any]: any} = {
	customscalings = t1,
	UpdateScalings = function()
		wait()

		for _, v in pairs(t1) do
			v()
		end
	end
}

visGui.Changed:connect(module.UpdateScalings)

function Update(_, _, p3)
	wait()

	if not p3 or type(p3) == "string" and (p3 == "Deck" or p3 == "Trade") or p3 == "DeckLine" then
		local scaler = visGui.DeckBuilderNew.Deck.Clip.ScrollingFrame.Scaler
		local n1: number = 0

		for _, v in pairs(scaler:GetChildren()) do
			if v.Visible then
				v.Position = UDim2.new(0, 0, n1, 0)
				n1 += 1
			end
		end

		scaler.Parent.Size = UDim2.new(1, 0, 0, (n1 + 0.1) * scaler.AbsoluteSize.Y)
	end
end

t1.Update = Update
print("Finished loading " .. script.Name)

return module
