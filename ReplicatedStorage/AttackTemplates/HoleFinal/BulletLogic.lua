



local runService: RunService = game:GetService("RunService")
local audioService = require(game.ReplicatedStorage.AudioService)
local replicatedFirst: ReplicatedFirst = game:GetService("ReplicatedFirst")
local client = require(replicatedFirst["Main Nieuw"].Network).client
local scriptParent: Instance = script.Parent
local u6 = nil
local n1: number = 1
local s1: string = "Idle"
local t1: {[any]: any} = {}

local function OnRenderStepped(p1)
	if s1 == "TravelToHole" then
		local firedProjectiles: Instance = scriptParent:FindFirstChild("FiredProjectiles")

		for _, v in pairs(firedProjectiles:GetChildren()) do
			local vector2 = Vector2.new(0, 0)

			if scriptParent.BigProjectile then
				vector2 = Vector2.new(scriptParent.BigProjectile.Position.X.Scale - v.Position.X.Scale, scriptParent.BigProjectile.Position.Y.Scale - v.Position.Y.Scale).Unit
			end

			local uDim2 = UDim2.new(vector2.X * 0.25 * p1, 0, vector2.Y * 0.25 * p1, 0)

			v.Position = v.Position + uDim2
		end

		return
	end

	local firedProjectiles: Instance = scriptParent:FindFirstChild("FiredProjectiles")

	for _, v in pairs(firedProjectiles:GetChildren()) do
		local v21 = v:FindFirstChild("DirectionNum").Value

		v21 = t1[v.Name]

		local uDim2 = UDim2.new(v21.X.Scale * 0.25 * p1, 0, v21.Y.Scale * 0.25 * p1, 0)

		v.Position = v.Position + uDim2
	end
end

local t2: {[any]: any} = {
	UDim2.new(1, 0, -1, 0),
	UDim2.new(-1, 0, 1, 0),
	UDim2.new(0.65, 0, 1, 0),
	UDim2.new(-0.85, 0, -1, 0),
	UDim2.new(1, 0, 1, 0),
	UDim2.new(-1, 0, -1, 0),
	UDim2.new(0.65, 0, -1, 0),
	UDim2.new(-0.65, 0, 1, 0),
	UDim2.new(0.25, 0, -1, 0),
	UDim2.new(-0.25, 0, 1, 0),
	UDim2.new(0.25, 0, 1, 0),
	UDim2.new(-0.5, 0, -1, 0),
	UDim2.new(0, 0, 1, 0),
	UDim2.new(-1, 0, -1, 0),
	UDim2.new(0, 0, -1, 0),
	UDim2.new(-1, 0, 1, 0),
	UDim2.new(0.85, 0, 1, 0),
	UDim2.new(-0.85, 0, -1, 0),
	UDim2.new(0.85, 0, -1, 0),
	UDim2.new(-0.85, 0, 1, 0),
	UDim2.new(0.15, 0, 1, 0),
	UDim2.new(-0.15, 0, -1, 0),
	UDim2.new(0.15, 0, -1, 0),
	UDim2.new(-0.15, 0, 1, 0),
	UDim2.new(0.35, 0, 1, 0),
	UDim2.new(-0.35, 0, -1, 0),
	UDim2.new(0.35, 0, -1, 0),
	UDim2.new(-0.35, 0, 1, 0),
	UDim2.new(1, 0, 0.15, 0),
	UDim2.new(-1, 0, -0.15, 0),
	UDim2.new(1, 0, -0.15, 0),
	UDim2.new(-1, 0, 0.15, 0),
	UDim2.new(1, 0, 0.35, 0),
	UDim2.new(-1, 0, -0.35, 0),
	UDim2.new(1, 0, -0.35, 0),
	UDim2.new(-1, 0, 0.35, 0),
	UDim2.new(1, 0, 0.85, 0),
	UDim2.new(-1, 0, -0.85, 0),
	UDim2.new(1, 0, -0.85, 0),
	(UDim2.new(-1, 0, 0.85, 0))
}

return {
	GetCollisionGroup = function(p2)
		u6 = p2
	end,
	ActivatePattern = function()
		script.Parent.Parent.Parent:FindFirstChild("Move")

		local connection = runService.RenderStepped:Connect(OnRenderStepped)
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

		game:GetService("TweenService"):Create(scriptParent.BigProjectile.Star, tweenInfo, { Size = UDim2.new(3, 0, 3, 0) }):Play()
		audioService.PlaySound("FireBlast")
		task.wait(0.5)
		task.spawn(function()
			while true do
				if not scriptParent:FindFirstChild("BigProjectile") then
					break
				end

				scriptParent.BigProjectile.Rotation = scriptParent.BigProjectile.Rotation + 180
				task.wait(0.1)
			end
		end)

		local v26 = nil

		if u6 then
			v26 = u6:addCollider(scriptParent.BigProjectile, false)
		end

		local damage: NumberValue = Instance.new("NumberValue")

		damage.Name = "Damage"
		damage.Value = 500
		damage.Parent = scriptParent.BigProjectile

		for _ = 1, math.random(11, 12) do
			task.wait(1)
			audioService.PlaySound("FireballShoot")

			for j = 1, 40 do
				local clone = script.Parent.StoredProjectiles.Projectile1:Clone()

				clone.Parent = script.Parent.FiredProjectiles
				clone.Position = scriptParent.BigProjectile.Position
				clone.Name = "Projectile" .. n1
				n1 += 1

				local directionNum: NumberValue = Instance.new("NumberValue")

				directionNum.Parent = clone
				directionNum.Name = "DirectionNum"
				directionNum.Value = j

				local randomNumber = math.random(-10, 10)
				local cloneName = clone.Name
				local v34 = t2[j]
				local uDim2 = UDim2.new(randomNumber / 10, 0, 0, 0)

				t1[cloneName] = v34 + uDim2

				local u36 = nil

				if u6 then
					u36 = u6:addCollider(clone, false)
				end

				local numberValue: NumberValue = Instance.new("NumberValue")

				numberValue.Name = "Damage"
				numberValue.Value = 200
				numberValue.Parent = clone
				task.spawn(function()
					while true do
						if not scriptParent:FindFirstChild("BigProjectile") then
							break
						end

						task.wait(0.05)
					end

					clone:Destroy()
					u6:removeCollider(u36.instance)
				end)
			end
		end

		task.wait(2)
		game:GetService("TweenService"):Create(scriptParent.BigProjectile.Star, tweenInfo, { Size = UDim2.new(3, 0, 0, 0) }):Play()
		task.wait(0.4)
		audioService.PlaySound("BlackholeAppear")
		audioService.DimSongs(0.1)
		game:GetService("TweenService"):Create(scriptParent.BigProjectile.Hole, tweenInfo, { Size = UDim2.new(3, 0, 3, 0) }):Play()
		task.wait(0.2)
		game:GetService("TweenService"):Create(scriptParent.DarkScreen, tweenInfo, { BackgroundTransparency = 0 }):Play()

		if script.Parent.Parent.Parent:FindFirstChild("BorderBot") then
			client.SetDodgeOutOfBoundsAllowed(true)

			local borderBot: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderBot")

			borderBot.Position = UDim2.new(10, 0, 10, 0)

			local borderTop: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderTop")

			borderTop.Position = UDim2.new(10, 0, 10, 0)

			local borderLeft: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderLeft")

			borderLeft.Position = UDim2.new(10, 0, 10, 0)

			local borderRight: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderRight")

			borderRight.Position = UDim2.new(10, 0, 10, 0)
		end

		task.spawn(function()
			audioService.PlaySound("BlackholeAmbience")
			task.wait(6.3)
			audioService.PlaySound("BlackholeAmbience")
		end)

		local tweenInfo2 = TweenInfo.new(13, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

		game:GetService("TweenService"):Create(scriptParent.BigProjectile, tweenInfo2, { Size = UDim2.new(0.4, 0, 0.8, 0) }):Play()
		s1 = "TravelToHole"
		task.wait(13)
		audioService.PlaySound("Fade")

		local tweenInfo3 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

		game:GetService("TweenService"):Create(scriptParent.BigProjectile.Hole, tweenInfo3, { Size = UDim2.new(8, 0, 8, 0) }):Play()
		task.wait(1.1)
		audioService.UndimSongs()

		if script.Parent.Parent.Parent:FindFirstChild("BorderBot") then
			local borderBot: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderBot")

			borderBot.Position = UDim2.new(0.15, 0, 0.786, 0)

			local borderTop: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderTop")

			borderTop.Position = UDim2.new(0.15, 0, 0.451, 0)

			local borderLeft: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderLeft")

			borderLeft.Position = UDim2.new(0.109, 0, 0.451, 0)

			local borderRight: Instance = script.Parent.Parent.Parent:FindFirstChild("BorderRight")

			borderRight.Position = UDim2.new(0.849, 0, 0.451, 0)

			local move: Instance = script.Parent.Parent.Parent:FindFirstChild("Move")

			move.Position = UDim2.new(0.5, 0, 0.627, 0)
			client.SetDodgeOutOfBoundsAllowed(false)
		end

		u6:removeCollider(v26.instance)
		scriptParent.BigProjectile:Destroy()
		scriptParent.DarkScreen:Destroy()
		connection:Disconnect()
		task.wait(0.1)
		script.Parent:Destroy()
	end
}
