



local tweenService: TweenService = game:GetService("TweenService")

return {
	OnAddedParticles = function(p1, p2)
		local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
		local wall = script.parent:FindFirstChild("Wall")

		for _, v in pairs(wall:GetChildren()) do
			if p1 == "Red" then
				local color3New = Color3.new
				local v9 = math.clamp(v.Color.R + p2 / 200, 0, 1)
				local v10 = math.clamp(v.Color.G - p2 / 200, 0, 1)
				local v11 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local color3 = color3New(v9, v10, v11)

				tweenService:Create(v, tweenInfo, { Color = color3 }):Play()
			elseif p1 == "Green" then
				local v13 = Color3.new
				local v14 = math.clamp(v.Color.R - p2 / 200, 0, 1)
				local v15 = math.clamp(v.Color.G + p2 / 200, 0, 1)
				local v16 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local v17 = v13(v14, v15, v16)

				tweenService:Create(v, tweenInfo, { Color = v17 }):Play()
			elseif p1 == "Blue" then
				local v18 = Color3.new
				local v19 = math.clamp(v.Color.R - p2 / 200, 0, 1)
				local v20 = math.clamp(v.Color.G - p2 / 200, 0, 1)
				local v21 = math.clamp(v.Color.B + p2 / 100, 0, 1)
				local v22 = v18(v19, v20, v21)

				tweenService:Create(v, tweenInfo, { Color = v22 }):Play()
			else
				local v23 = Color3.new
				local v24 = math.clamp(v.Color.R + p2 / 200, 0, 1)
				local v25 = math.clamp(v.Color.G + p2 / 200, 0, 1)
				local v26 = math.clamp(v.Color.B - p2 / 200, 0, 1)
				local v27 = v23(v24, v25, v26)

				tweenService:Create(v, tweenInfo, { Color = v27 }):Play()
			end
		end
	end,
	ResetBattleBack = function()
		local wall = script.parent:FindFirstChild("Wall")

		for _, v in pairs(wall:GetChildren()) do
			v.Color = Color3.new(0.929412, 0.917647, 0.917647)
		end
	end,
	StartBattleBack = function()
	end
}
