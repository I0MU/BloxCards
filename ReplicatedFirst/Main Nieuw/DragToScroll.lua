




print("Finished loading " .. script.Name)

return function(p1, p2)
	local userInputService: UserInputService = game:GetService("UserInputService")
	local u4: boolean = false
	local n1 = 0
	local n2 = 0
	local n3 = 0
	local v8 = p2 or 1
	local vector2New = Vector2.new
	local mathMin = math.min
	local mathMax = math.max

	local function Clamp(p3, p4, p5)
		local v16 = mathMax(p3, p5)

		return (mathMin(p4, v16))
	end

	userInputService.InputEnded:connect(function(input)
		if u4 and input.UserInputType == Enum.UserInputType.MouseButton3 then
			u4 = false
		end
	end)
	userInputService.InputChanged:connect(function(input)
		if u4 and input.UserInputType == Enum.UserInputType.MouseMovement then
			local v19: number = n3
			local v20 = mathMax(0, n2 - (input.Position.Y - n1) * v8)
			local v21 = mathMin(v19, v20)

			p1.CanvasPosition = vector2New(0, v21)
			n1 = input.Position.Y
			n2 = p1.CanvasPosition.Y
		end
	end)
	p1.InputBegan:connect(function(input)
		if not u4 and input.UserInputType == Enum.UserInputType.MouseButton3 then
			u4 = true
			n1 = input.Position.Y
			n2 = p1.CanvasPosition.Y
			n3 = p1.CanvasSize.Y.Offset - p1.AbsoluteSize.Y
		end
	end)
end
