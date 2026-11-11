



local battleBackModelStorage: Instance = game:GetService("ReplicatedStorage"):WaitForChild("BattleBackModelStorage")
local cutsceneModelStorage: Instance = workspace:WaitForChild("CutsceneModelStorage")
local module: {[any]: any} = {}

function module.SummonModel(p1, p2, p3)
	print("Summoning new model")

	local v7 = nil
	local battleback: Instance = workspace:FindFirstChild("Battleback")

	if not battleback:FindFirstChild("ModelLocations") then
		print("Tried to place model on background without valid model locations")

		return
	end

	local modelLocations: Instance = battleback:FindFirstChild("ModelLocations")

	for _, v in pairs(modelLocations:GetChildren()) do
		print(v.Name)

		local parts = string.split(v.Name, "Card")

		print(p2)
		print(parts)

		local numberValue: number? = tonumber(parts[2])

		print(numberValue)

		local numberValue2: number? = tonumber(p2)

		print(numberValue2)

		local numberValue3: number? = tonumber(parts[2])
		local numberValue4: number? = tonumber(p2)

		if numberValue3 == numberValue4 then
			v7 = v
		end
	end

	if not battleBackModelStorage:FindFirstChild(p1) then
		print("Could not find valid model for " .. p1)

		return
	end

	if not v7 then
		warn("No Summon Location found")

		return
	end

	local clone: Instance = battleBackModelStorage:FindFirstChild(p1):Clone()

	if p1 == "FillerCard" then
		clone.Card.BackDecal.Texture = p3
		clone.Card.FrontDecal.Texture = p3
	end

	clone.Parent = v7

	local cFrame = v7.CFrame
	local pivot = clone:GetPivot()

	clone:PivotTo(cFrame * pivot.Rotation)

	if clone:FindFirstChild("Animations") and clone:FindFirstChild("Animations"):FindFirstChild("Summon") then
		local playAnimation = module.PlayAnimation
		local animations: Instance = clone:FindFirstChild("Animations")

		playAnimation(clone, animations:FindFirstChild("Summon"))
	end

	if clone:FindFirstChild("Animations") and clone:FindFirstChild("Animations"):FindFirstChild("Idle") then
		local v22 = module.PlayAnimation
		local idle: Instance = clone:FindFirstChild("Animations"):FindFirstChild("Idle")

		v22(clone, idle, "DefaultIdle")
	end
end
function module.RemoveModel(p4)
	local v25 = nil
	local battleback: Instance = workspace:FindFirstChild("Battleback")

	if not battleback:FindFirstChild("ModelLocations") then
		print("Tried to place model on background without valid model locations")

		return
	end

	local modelLocations: Instance = battleback:FindFirstChild("ModelLocations")

	for _, v in pairs(modelLocations:GetChildren()) do
		local parts = string.split(v.Name, "Card")

		if p4 == parts[2] then
			v25 = v
		end
	end

	for _, v in pairs(v25:GetChildren()) do
		v:Destroy()
	end
end
function module.PlayAnimation(p5, p6, p7)
	if not p5:FindFirstChild("Humanoid") then
		warn("No Humanoid found on model")

		return
	end

	local humanoid = p5:WaitForChild("Humanoid")

	if not humanoid:FindFirstChild("Animator") then
		warn("No Animator found on humanoid")

		return
	end

	local animator = humanoid:WaitForChild("Animator")
	local animation: Animation = Instance.new("Animation")

	animation.AnimationId = p6.AnimationId

	local animationTrack = animator:LoadAnimation(animation)

	if p7 == "DefaultIdle" then
		animationTrack.Priority = Enum.AnimationPriority.Idle
		animationTrack.Looped = true
	elseif p7 == "Looped" then
		animationTrack.Priority = Enum.AnimationPriority.Movement
		animationTrack.Looped = true
	else
		animationTrack.Priority = Enum.AnimationPriority.Action
		animationTrack.Looped = false
	end

	animationTrack:Play()
end
function module.GetModelByName(p8)
	local v41 = nil
	local battleback: Instance = workspace:FindFirstChild("Battleback")

	if not battleback:FindFirstChild("ModelLocations") then
		print("Tried to search for model on background without valid model locations")

		return
	end

	local modelLocations: Instance = battleback:FindFirstChild("ModelLocations")

	for _, v in pairs(modelLocations:GetChildren()) do
		for _, iterValue in pairs(v:GetChildren()) do
			if p8 == iterValue.Name then
				v41 = iterValue
			end
		end
	end

	if not v41 then
		warn("No Matching Model found")
	end

	return v41
end
function module.SummonModelCutscene(p9, p10, p11, p12)
	print("Summoning new model")

	if not battleBackModelStorage:FindFirstChild(p9) then
		print("Could not find valid model for " .. p9)

		return
	end

	if not p10 then
		warn("No Summon Location found")

		return
	end

	local clone: Instance = battleBackModelStorage:FindFirstChild(p9):Clone()

	clone.Parent = cutsceneModelStorage

	local pivot = clone:GetPivot()

	clone:PivotTo(p10 * pivot.Rotation)

	if p11 and clone:FindFirstChild("Animations") and clone:FindFirstChild("Animations"):FindFirstChild(p11) then
		local playAnimation = module.PlayAnimation
		local foundChild: Instance = clone:FindFirstChild("Animations"):FindFirstChild(p11)

		playAnimation(clone, foundChild, p12)
	end
end
function module.RemoveModelCutscene(p13)
	local v57 = nil

	for _, v in pairs(cutsceneModelStorage:GetChildren()) do
		if p13 == v.Name then
			v57 = v

			break
		end
	end

	if v57 then
		v57:Destroy()
	end
end

return module
