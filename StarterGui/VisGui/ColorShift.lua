



local handyNew: Instance = script.Parent:WaitForChild("HandyHolder"):WaitForChild("HandyNew")

for _, v in pairs(handyNew:GetChildren()) do
	if v.Name ~= "Events" and v.Name ~= "Hide" and v.Name ~= "Show" and v.Name ~= "StatsDisplay" then
		local u4: boolean = false
		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		local v7: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = v.Dark.Value })
		local v8: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = v.Default.Value })
		local v9: Tween = tweenService:Create(v, tweenInfo, { ImageColor3 = v.Light.Value })

		v.MouseEnter:Connect(function()
			u4 = true
			v8:Play()
		end)
		v.MouseLeave:Connect(function()
			u4 = false
			v9:Play()
		end)
		v.MouseButton1Down:Connect(function()
			v7:Play()
		end)
		v.MouseButton1Up:Connect(function()
			if not u4 then
				v9:Play()

				return
			end

			v8:Play()
		end)
	end
end
