



game:GetService("TweenService")

return {
	OnAddedParticles = function(p1, p2)
		print("Script fired")
		TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)

		for _, v in pairs(script.Parent:GetChildren()) do
			if v.Name == "Tornado Particle Effect" then
				print("Found")

				local swirl = v:FindFirstChild("A1"):FindFirstChild("Swirl")

				if swirl then
					print("particle found")
				end

				if p1 == "Red" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R + p2 / 1000, swirl.Color.Keypoints[1].Value.G, swirl.Color.Keypoints[1].Value.B))
				elseif p1 == "Green" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R, swirl.Color.Keypoints[1].Value.G + p2 / 1000, swirl.Color.Keypoints[1].Value.B))
				elseif p1 == "Blue" then
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R, swirl.Color.Keypoints[1].Value.G, swirl.Color.Keypoints[1].Value.B + p2 / 1000))
				else
					swirl.Color = ColorSequence.new(Color3.new(swirl.Color.Keypoints[1].Value.R + p2 / 1000, swirl.Color.Keypoints[1].Value.G + p2 / 1000, swirl.Color.Keypoints[1].Value.B))
				end
			end
		end
	end,
	ResetBattleBack = function()
	end,
	StartBattleBack = function()
	end
}
