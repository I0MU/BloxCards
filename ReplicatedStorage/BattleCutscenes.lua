



local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
local t1: {[any]: any} = {
	CFrame = CFrame.new(Vector3.new(854.039, -1.268, -762.611), Vector3.new(860.779, -5.62, -756.539))
}
local t2: {[any]: any} = {
	ModelName = "TestModelAnimation",
	ModelPosition = CFrame.new(Vector3.new(860.779, -5.62, -756.539)),
	AnimationName = "Idle",
	AnimationType = "Looped"
}
local tweenInfo2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
local t3: {[any]: any} = {
	CFrame = CFrame.new(Vector3.new(877.863, -2.604, -732.229), Vector3.new(860.779, -5.62, -756.539))
}
local tweenInfo3 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
local t4: {[any]: any} = {
	CFrame = CFrame.new(Vector3.new(830.429, 8.144, -720.027), Vector3.new(860.779, -5.62, -756.539))
}
local color3 = Color3.fromRGB(236, 243, 255)
local CurrentCamera: Camera = workspace.CurrentCamera
local battleCutsceneUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("BattleCutsceneUI")
local replicatedFirst: ReplicatedFirst = game:GetService("ReplicatedFirst")
local backgroundModels = require(replicatedFirst["Main Nieuw"].BackgroundModels)
local cutsceneModelStorage: Instance = workspace:WaitForChild("CutsceneModelStorage")
local replicatedFirst2: ReplicatedFirst = game:GetService("ReplicatedFirst")
local transition = require(replicatedFirst2["Main Nieuw"].Transition)
local CFrame2 = nil

local function waitForEvent(p1)
	local v20 = coroutine.running()

	p1:Once(function(...)
		if coroutine.status(v20) ~= "dead" then
			task.spawn(v20, ...)
		end
	end)
	coroutine.yield()
end

local t5: {[any]: any} = {
	Test = {
		{
			ToggleBlackScreen = { Enabled = false, Duration = 0.5 },
			CameraTween = { TweenInfo = tweenInfo, TweenDetails = t1 },
			SpawnModel = t2
		},
		{
			CameraTween = { TweenInfo = tweenInfo2, TweenDetails = t3 },
			DisplayBossText = {
				BossName = "Red Box",
				BossTitle = "Intimidating Cube",
				DisplayTime = 4
			},
			DisplayBossDialogue = { Text = "oooo I am evil oooo", DisplayTime = 3, DisplayDelay = 1.5 }
		},
		{
			CameraTween = { TweenInfo = tweenInfo3, TweenDetails = t4 },
			PlayAnimation = { { ModelName = "TestModelAnimation", AnimationName = "Attack" } }
		},
		{
			ToggleBlackScreen = { Enabled = true, Duration = 0.3, ScreenColor = color3 }
		}
	}
}

return {
	BattleCutscenes = function(p2)
		local v22 = t5[p2]

		if not v22 then
			warn("No Cutscene found")

			return
		end

		repeat
			task.wait()
			CurrentCamera.CameraType = Enum.CameraType.Scriptable
		until CurrentCamera.CameraType == Enum.CameraType.Scriptable

		CFrame2 = CurrentCamera.CFrame

		for i = 1, #v22 do
			if v22[i].ToggleBlackScreen then
				local n1: number = 1

				if v22[i].ToggleBlackScreen.Enabled == false then
					n1 = -1
				end

				if v22[i].ToggleBlackScreen.ScreenColor then
					transition.ToggleBlackColor(v22[i].ToggleBlackScreen.ScreenColor)
				end

				transition.ToggleBlack(n1, v22[i].ToggleBlackScreen.Duration)
			end

			if v22[i].DisplayBossText then
				task.spawn(function()
					local tweenService: TweenService = game:GetService("TweenService")
					local bossName = battleCutsceneUI.BossTitle.BossName
					local tweenInfo4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v39: Tween = tweenService:Create(bossName, tweenInfo4, { TextTransparency = 0 })
					local title = battleCutsceneUI.BossTitle.Title
					local tweenInfo5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v42: Tween = tweenService:Create(title, tweenInfo5, { TextTransparency = 0 })
					local line = battleCutsceneUI.BossTitle.Line
					local tweenInfo6 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v45: Tween = tweenService:Create(line, tweenInfo6, { BackgroundTransparency = 0 })

					battleCutsceneUI.BossTitle.BossName.Text = v22[i].DisplayBossText.BossName
					battleCutsceneUI.BossTitle.Title.Text = v22[i].DisplayBossText.BossTitle

					if v22[i].DisplayBossText.DisplayDelay then
						task.wait(v22[i].DisplayBossDialogue.DisplayDelay)
					end

					battleCutsceneUI.BossTitle.Visible = true
					v39:Play()
					v42:Play()
					v45:Play()
					task.wait(v22[i].DisplayBossText.DisplayTime)

					local v46 = battleCutsceneUI.BossTitle.BossName
					local tweenInfo7 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)

					v45 = tweenService:Create(v46, tweenInfo7, { TextTransparency = 1 })

					local v48 = battleCutsceneUI.BossTitle.Title
					local tweenInfo8 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v50: Tween = tweenService:Create(v48, tweenInfo8, { TextTransparency = 1 })
					local v51 = battleCutsceneUI.BossTitle.Line
					local tweenInfo9 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v53: Tween = tweenService:Create(v51, tweenInfo9, { BackgroundTransparency = 1 })

					v45:Play()
					v50:Play()
					v53:Play()

					local completed = v45.Completed
					local v55 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v55) ~= "dead" then
							task.spawn(v55, ...)
						end
					end)
					coroutine.yield()
					battleCutsceneUI.BossTitle.Visible = false
				end)
			end

			if v22[i].DisplayBossDialogue then
				task.spawn(function()
					local tweenService: TweenService = game:GetService("TweenService")
					local battleCutsceneUIBossTalk = battleCutsceneUI.BossTalk
					local tweenInfo10 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
					local v59: Tween = tweenService:Create(battleCutsceneUIBossTalk, tweenInfo10, { TextTransparency = 0 })

					battleCutsceneUI.BossTalk.Text = v22[i].DisplayBossDialogue.Text

					if v22[i].DisplayBossDialogue.DisplayDelay then
						task.wait(v22[i].DisplayBossDialogue.DisplayDelay)
					end

					battleCutsceneUI.BossTalk.Visible = true
					v59:Play()
					task.wait(v22[i].DisplayBossDialogue.DisplayTime)

					local bossTalk = battleCutsceneUI.BossTalk
					local tweenInfo11 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)

					v59 = tweenService:Create(bossTalk, tweenInfo11, { TextTransparency = 1 })
					v59:Play()

					local completed = v59.Completed
					local v63 = coroutine.running()

					completed:Once(function(...)
						if coroutine.status(v63) ~= "dead" then
							task.spawn(v63, ...)
						end
					end)
					coroutine.yield()
					battleCutsceneUI.BossTalk.Visible = false
				end)
			end

			if v22[i].SpawnModel then
				backgroundModels.SummonModelCutscene(v22[i].SpawnModel.ModelName, v22[i].SpawnModel.ModelPosition, v22[i].SpawnModel.AnimationName, v22[i].SpawnModel.AnimationType)
			end

			if v22[i].RemoveModel then
				backgroundModels.RemoveModelCutscene(v22[i].SpawnModel.ModelName)
			end

			if v22[i].PlayAnimation then
				for j = 1, #v22[i].PlayAnimation do
					local v26 = nil

					for _, v in pairs(cutsceneModelStorage:GetChildren()) do
						if v.Name == v22[i].PlayAnimation[j].ModelName then
							v26 = v

							break
						end
					end

					local backgroundModelsPlayAnimation = backgroundModels.PlayAnimation
					local foundChild = v26:FindFirstChild("Animations"):FindFirstChild(v22[i].PlayAnimation[j].AnimationName)

					backgroundModelsPlayAnimation(v26, foundChild, v22[i].PlayAnimation[j].AnimationType)
				end
			end

			if v22[i].CameraTween then
				local v31: Tween = game:GetService("TweenService"):Create(CurrentCamera, v22[i].CameraTween.TweenInfo, v22[i].CameraTween.TweenDetails)

				v31:Play()

				local completed = v31.Completed
				local v33 = coroutine.running()

				completed:Once(function(...)
					if coroutine.status(v33) ~= "dead" then
						task.spawn(v33, ...)
					end
				end)
				coroutine.yield()
			end
		end

		if CFrame2 then
			CurrentCamera.CFrame = CFrame2
		end

		for _, v in pairs(cutsceneModelStorage:GetChildren()) do
			v:Destroy()
		end
	end,
	CutsceneData = t5
}
