



local tweenService: TweenService = game:GetService("TweenService")

return {
	SetupMovement = function()
		local userInputService: UserInputService = game:GetService("UserInputService")
		local scriptParent: Instance = script.Parent
		local card: Instance = scriptParent:FindFirstChild("CardModel"):FindFirstChild("Card")
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		local v6: Tween = tweenService:Create(card, tweenInfo, { Orientation = Vector3.new(0, 0, 0) })

		scriptParent.MouseMoved:connect(function()
			local n1 = userInputService:GetMouseLocation() - Vector2.new(0, 36)
			local vector2 = Vector2.new(scriptParent.AbsolutePosition.X + scriptParent.AbsoluteSize.X * 0.5 - n1.X, scriptParent.AbsolutePosition.Y + scriptParent.AbsoluteSize.Y * 0.5 - n1.Y)

			print(vector2.X, vector2.Y)

			local v9 = math.clamp(vector2.Y / 2, -15, 15)
			local v10 = math.clamp(vector2.X * -1 / 2, -30, 30)

			card.Orientation = Vector3.new(v9, v10, 0)
		end)
		scriptParent.MouseLeave:connect(function()
			v6:Play()
		end)
	end
}
