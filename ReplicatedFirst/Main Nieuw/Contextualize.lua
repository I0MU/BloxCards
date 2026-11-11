





local clamp = require(game.ReplicatedStorage.Utils).Clamp
local mouseAwayFrom = require(script.Parent.FakeMouse).MouseAwayFrom
local animation = require(game.ReplicatedStorage.Animation)
local LocalPlayer = game.Players.LocalPlayer
local contexts = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VisGui").Contexts
local contextsContext = contexts.Context
local t1: {[any]: any} = {}
local timestamp = tick()
local u9 = nil
local stepped = game:GetService("RunService").Stepped

print("Finished loading " .. script.Name)

return function(p1, p2, p3, p4)
	spawn(function()
		if t1[p1.Name] then
			return
		end

		if type(p2) == "function" then
			p2 = p2()
		end

		u9 = p1
		t1[p1.Name] = true
		timestamp = tick()

		local v15 = timestamp
		local clone = contextsContext:Clone()

		clone.Visible = true
		clone.Name = p1.Name .. " Context"
		clone.Text = p2
		clone.Size = UDim2.new(0, 1024, 0, 1024)
		clone.Parent = contexts
		clone.AutomaticSize = Enum.AutomaticSize.Y

		if p4 then
			clone.Parent = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild(p4)
		end

		local v17 = clamp(96, p1.AbsoluteSize.X, clone.TextBounds.x + 12)

		clone.Size = UDim2.new(0, v17, 0, 128)

		local n1 = clone.TextBounds.y + 10

		clone.Context.ImageTransparency = 1
		clone.TextTransparency = 1
		clone.Position = UDim2.new(0, p1.AbsolutePosition.x + p1.AbsoluteSize.x / 2 - v17 / 2, 0, p1.AbsolutePosition.y - n1 / 2)
		clone.Context.ImageTransparency = 1
		clone.Size = UDim2.new(0, v17, 0, n1)

		local uDim2 = UDim2.new(0, p1.AbsolutePosition.x + p1.AbsoluteSize.x / 2 - v17 / 2, 0, p1.AbsolutePosition.y - n1 - 4)

		clone:TweenPosition(uDim2, "Out", "Sine", 0.26999999999999996)
		clone.Visible = true
		animation.AnimateAsync(clone.Context, { ImageTransparency = 0 }, 0.2, "Out", "Quad")
		task.wait(0.1)
		animation.AnimateAsync(clone, { TextTransparency = 0 }, 0.1, "Out", "Quad")
		task.wait(0.1)

		if not p3 then
			p3 = mouseAwayFrom(u9, 10)
		end

		repeat
			stepped:wait()
			clone.Position = UDim2.new(0, p1.AbsolutePosition.x + p1.AbsoluteSize.x / 2 - v17 / 2, 0, p1.AbsolutePosition.y - n1 - 4)
		until not not p3() or u9 ~= p1 or v15 ~= timestamp

		clone.Context.Arrow:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 1, -20), "In", "Sine", 0.05399999999999999)
		animation.Animate(clone, { TextTransparency = 1 }, 0.1, "InOut", "Quad")
		clone.Context.Arrow.Visible = false
		animation.Animate(clone.Context, { ImageTransparency = 1 }, 0.1, "InOut", "Quad")
		t1[p1.Name] = nil
		clone.Visible = false
		clone:Destroy()
	end)
end
