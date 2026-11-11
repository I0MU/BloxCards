



local runService: RunService = game:GetService("RunService")
local audioService = require(game.ReplicatedStorage.AudioService)
local scriptParent: Instance = script.Parent
local u4 = nil
local t1: {[any]: any} = {
	UDim2.new(1, 0, -0.65, 0),
	UDim2.new(-1, 0, 0.65, 0),
	UDim2.new(0.65, 0, 1, 0),
	UDim2.new(-0.85, 0, -1, 0),
	UDim2.new(1, 0, 0.65, 0),
	UDim2.new(-1, 0, -0.65, 0),
	UDim2.new(0.65, 0, -1, 0),
	(UDim2.new(-0.65, 0, 1, 0))
}

local function OnRenderStepped(p1)
	local firedProjectiles: Instance = scriptParent:FindFirstChild("FiredProjectiles")

	for _, v in pairs(firedProjectiles:GetChildren()) do
		local directionNum = v:FindFirstChild("DirectionNum")
		local v12 = t1[directionNum.Value]
		local uDim2 = UDim2.new(v12.X.Scale * 0.25 * p1, 0, v12.Y.Scale * 0.25 * p1, 0)

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

		audioService.PlaySound("MagicSummonDeep")
		scriptParent.BigProjectile.Position = UDim2.new(0.5, -0.5)

		local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

		task.spawn(function()
			while true do
				if not scriptParent:FindFirstChild("BigProjectile") then
					break
				end

				scriptParent.BigProjectile.Rotation = scriptParent.BigProjectile.Rotation + 3
				task.wait(0.01)
			end
		end)

		local v17 = nil

		if u4 then
			v17 = u4:addCollider(scriptParent.BigProjectile, false)
		end

		local damage: NumberValue = Instance.new("NumberValue")

		damage.Name = "Damage"
		damage.Value = 200
		damage.Parent = scriptParent.BigProjectile
		task.spawn(function()
			audioService.PlaySound("MagicLoop")
		end)

		local n1: number = 1

		for _ = 1, math.random(6, 7) do
			local n2

			if n1 == 1 then
				n2 = 0.5 - math.random(10, 30) / 100
				n1 = 0
			else
				n2 = 0.5 + math.random(10, 30) / 100
				n1 = 1
			end

			task.wait(0.5)
			audioService.PlaySound("MagicImpact")
			audioService.PlaySound("MagicDirect")

			local tweenService: TweenService = game:GetService("TweenService")
			local scriptParentBigProjectile = scriptParent.BigProjectile
			local uDim2New = UDim2.new
			local randomNumber = math.random(40, 90)
			local uDim2 = uDim2New(n2, 0, randomNumber / 100, 0)

			tweenService:Create(scriptParentBigProjectile, tweenInfo, { Position = uDim2 }):Play()
			task.wait(1.5)

			for j = 1, 8 do
				local clone = script.Parent.StoredProjectiles.Projectile1:Clone()

				clone.Parent = script.Parent.FiredProjectiles
				clone.Position = scriptParent.BigProjectile.Position

				local directionNum: NumberValue = Instance.new("NumberValue")

				directionNum.Parent = clone
				directionNum.Name = "DirectionNum"
				directionNum.Value = j

				local u30 = nil

				if u4 then
					u30 = u4:addCollider(clone, false)
				end

				local numberValue: NumberValue = Instance.new("NumberValue")

				numberValue.Name = "Damage"
				numberValue.Value = 200
				numberValue.Parent = clone
				task.spawn(function()
					task.wait(4)
					clone:Destroy()
					u4:removeCollider(u30.instance)
				end)
			end

			audioService.PlaySound("MidMagic")
		end

		task.wait(0.5)
		audioService.PlaySound("MagicImpact")
		audioService.PlaySound("MagicDirect")
		game:GetService("TweenService"):Create(scriptParent.BigProjectile, tweenInfo, { Position = UDim2.new(0.5, 0, -0.5, 0) }):Play()
		task.wait(2.5)
		u4:removeCollider(v17.instance)
		scriptParent.BigProjectile:Destroy()
		connection:Disconnect()
		script.Parent:Destroy()
	end
}
