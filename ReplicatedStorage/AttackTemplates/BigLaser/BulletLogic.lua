



local runService: RunService = game:GetService("RunService")
local audioService = require(game.ReplicatedStorage.AudioService)
local scriptParent: Instance = script.Parent
local u4 = nil

local function OnRenderStepped(p1)
	local firedProjectiles: Instance = scriptParent:FindFirstChild("FiredProjectiles")

	for _, v in pairs(firedProjectiles:GetChildren()) do
		local n1: number = 1

		if v:FindFirstChild("Direction") and v:FindFirstChild("Direction").Value == "Right" then
			n1 = -1
		end

		local uDim2 = UDim2.new(n1 * 0.25 * p1, 0, 0, 0)

		v.Position = v.Position + uDim2
	end
end

return {
	GetCollisionGroup = function(p2)
		u4 = p2
	end,
	ActivatePattern = function()
		script.Parent.Parent.Parent:FindFirstChild("Move")

		local connection = runService.RenderStepped:Connect(OnRenderStepped)

		audioService.PlaySound("PortalSpawn")
		scriptParent.Portal.Size = UDim2.new(0, 0, scriptParent.Portal.Size.Y.Scale, 0)
		scriptParent.TargetLineAttack.Size = UDim2.new(0, 0, scriptParent.TargetLineAttack.Size.Y.Scale, 0)

		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local tweenService: TweenService = game:GetService("TweenService")
		local scriptParentPortal = scriptParent.Portal
		local uDim2 = UDim2.new(0.6, 0, scriptParent.Portal.Size.Y.Scale, 0)

		tweenService:Create(scriptParentPortal, tweenInfo, { Size = uDim2 }):Play()
		task.spawn(function()
			for _ = 1, 95 do
				scriptParent.Portal.Rotation = scriptParent.Portal.Rotation + 180
				task.wait(0.1)
			end
		end)
		task.wait(1.5)

		local u18 = nil

		if u4 then
			u18 = u4:addCollider(scriptParent.TargetLineAttack, false)
		end

		local damage: NumberValue = Instance.new("NumberValue")

		damage.Name = "Damage"
		damage.Value = 500
		damage.Parent = scriptParent.TargetLineAttack
		task.spawn(function()
			task.wait(8.5)
			audioService.PlaySound("Fade")

			local tweenService2: TweenService = game:GetService("TweenService")
			local scriptParentTargetLineAttack = scriptParent.TargetLineAttack
			local uDim22 = UDim2.new(0, 0, scriptParent.TargetLineAttack.Size.Y.Scale, 0)

			tweenService2:Create(scriptParentTargetLineAttack, tweenInfo, { Size = uDim22 }):Play()
			task.wait(0.5)

			local tweenService3: TweenService = game:GetService("TweenService")
			local scriptParentPortal = scriptParent.Portal
			local uDim23 = UDim2.new(0, 0, scriptParent.Portal.Size.Y.Scale - 0.2, 0)

			tweenService3:Create(scriptParentPortal, tweenInfo, { Size = uDim23 }):Play()
			task.wait(1.1)
			u4:removeCollider(u18.instance)
		end)

		local tweenService4: TweenService = game:GetService("TweenService")
		local scriptParentTargetLineAttack = scriptParent.TargetLineAttack
		local uDim24 = UDim2.new(0.3, 0, scriptParent.TargetLineAttack.Size.Y.Scale, 0)

		tweenService4:Create(scriptParentTargetLineAttack, tweenInfo, { Size = uDim24 }):Play()
		task.spawn(function()
			for _ = 1, 80 do
				scriptParent.TargetLineAttack.LaserImage.Rotation = scriptParent.TargetLineAttack.LaserImage.Rotation + 180
				task.wait(0.1)
			end
		end)
		audioService.PlaySound("velkozultslow")
		task.wait(1)
		task.spawn(function()
			local randomNumber = math.random(40, 50)

			for _ = 1, randomNumber do
				local clone = script.Parent.StoredProjectiles.Projectile1:Clone()

				clone.Parent = script.Parent.FiredProjectiles

				local uDim2New = UDim2.new
				local randomNumber2 = math.random(45, 83)

				clone.Position = uDim2New(0.5, 0, randomNumber2 / 100, 0)

				local randomNumber3 = math.random(0, 1)
				local direction: StringValue = Instance.new("StringValue")

				direction.Parent = clone
				direction.Name = "Direction"

				if randomNumber3 == 0 then
					direction.Value = "Left"
				else
					direction.Value = "Right"
				end

				local u38 = nil

				if u4 then
					u38 = u4:addCollider(clone, false)
				end

				local damage: NumberValue = Instance.new("NumberValue")

				damage.Name = "Damage"
				damage.Value = 200
				damage.Parent = clone
				audioService.PlaySound("SmallMagic")
				task.spawn(function()
					task.wait(4)
					clone:Destroy()
					u4:removeCollider(u38.instance)
				end)
				task.wait(7 / randomNumber)
			end
		end)
		task.wait(12)
		connection:Disconnect()
		script.Parent:Destroy()
	end
}
