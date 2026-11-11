



local CurrentCamera: Camera = workspace.CurrentCamera
local u2 = nil

return {
	OnAddedParticles = function(_, _)
	end,
	ResetBattleBack = function()
		if u2 then
			u2:Cancel()
		end
	end,
	StartBattleBack = function()
		if CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
			return
		end

		local cameraPositionMerge: Instance = script.Parent:FindFirstChild("CameraPositionMerge")

		if not cameraPositionMerge then
			warn("No Cam Position found")

			return
		end

		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)

		u2 = tweenService:Create(CurrentCamera, tweenInfo, { CFrame = cameraPositionMerge.CFrame })
		u2:Play()
	end,
	MoveStoryCamera = function(p3)
		if CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
			return
		end

		if not p3 then
			return
		end

		local foundChild: Instance = script.Parent:FindFirstChild("CameraPosition" .. p3)

		if not foundChild then
			warn("No Cam Position found")

			return
		end

		local tweenService: TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)

		u2 = tweenService:Create(CurrentCamera, tweenInfo, { CFrame = foundChild.CFrame })
		u2:Play()
	end
}
