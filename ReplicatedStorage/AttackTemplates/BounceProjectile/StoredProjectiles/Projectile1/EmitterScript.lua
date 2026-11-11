



while script.Parent do
	local frame: Frame = Instance.new("Frame")
	local clone = script.Parent.Sparkle:Clone()

	clone.Parent = frame
	frame.Size = UDim2.new(script.Parent.Size.X.Scale / 1.2, 0, script.Parent.Size.Y.Scale / 1.2, 0)

	local color3FromRGB = Color3.fromRGB
	local randomNumber = math.random(100, 255)
	local randomNumber2 = math.random(100, 255)

	clone.ImageColor3 = color3FromRGB(randomNumber, randomNumber2, math.random(100, 255))
	frame.BackgroundTransparency = 1
	clone.ImageTransparency = 0.3
	frame.ZIndex = script.Parent.ZIndex + 1
	frame.Parent = script.Parent.Parent.Parent
	frame.AnchorPoint = Vector2.new(0.5, 0.5)

	local ParentPosition = script.Parent.Position
	local uDim2New = UDim2.new
	local randomNumber3 = math.random(-15, 15)
	local randomNumber4 = math.random(-15, 15)
	local uDim2 = uDim2New(randomNumber3 / 1000, 0, randomNumber4 / 1000, 0)

	frame.Position = ParentPosition + uDim2
	task.spawn(function()
		task.wait(0.4)
		frame:Destroy()
	end)
	task.wait(0.05)
end
