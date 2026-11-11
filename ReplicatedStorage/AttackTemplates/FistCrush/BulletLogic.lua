



local runService: RunService = game:GetService("RunService")
local audioService = require(game.ReplicatedStorage.AudioService)
local scriptParent: Instance = script.Parent
local u4 = nil
local move = nil
local s1: string = "Idle"

local function OnRenderStepped(_)
	if s1 == "Idle" then
	elseif s1 == "Follow" then
		local projectiles: Instance = scriptParent:FindFirstChild("Projectiles")

		for _, v in pairs(projectiles:GetChildren()) do
			if move then
				if v.Name == "TopFist" then
					v.Position = move.Position + UDim2.new(0, 0, -0.25, 0)
				elseif v.Name == "BottomFist" then
					v.Position = move.Position + UDim2.new(0, 0, 0.25, 0)
				end
			end
		end
	end
end

return {
	GetCollisionGroup = function(p2)
		u4 = p2
	end,
	ActivatePattern = function()
		move = script.Parent.Parent.Parent:FindFirstChild("Move")

		local projectiles: Instance = scriptParent:FindFirstChild("Projectiles")

		for _, v in pairs(projectiles:GetChildren()) do
			local u16 = nil

			if u4 then
				u16 = u4:addCollider(v, false)
			end

			local damage: NumberValue = Instance.new("NumberValue")

			damage.Name = "Damage"
			damage.Value = 300
			damage.Parent = v
			task.spawn(function()
				task.wait(20)
				v:Destroy()
				u4:removeCollider(u16.instance)
			end)
		end

		local connection = runService.RenderStepped:Connect(OnRenderStepped)
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local tweenInfo2 = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

		for i = 1, 3 do
			s1 = "Follow"
			move = script.Parent.Parent.Parent:FindFirstChild("Move")

			local v22 = nil
			local t1: {[any]: any} = {}

			if move then
				v22 = move.Position
			end

			task.wait(2)
			s1 = "Idle"

			local projectiles2: Instance = scriptParent:FindFirstChild("Projectiles")

			for _, v in pairs(projectiles2:GetChildren()) do
				t1[v.Name] = v.Position

				local n1: number = 0.1

				if v.Name == "TopFist" then
					n1 = -0.1
				end

				if v22 then
					local tweenService: TweenService = game:GetService("TweenService")
					local uDim2 = UDim2.new(t1[v.Name].X.Scale, 0, v22.Y.Scale + n1, v22.Y.Offset)

					tweenService:Create(v, tweenInfo2, { Position = uDim2 }):Play()
				end
			end

			audioService.PlaySound("LargePunch")
			task.wait(0.25)
			audioService.PlaySound("StaticGlitch")

			local clone = script.Parent.StoredProjectiles.DamageHole:Clone()

			clone.Parent = script.Parent.FiredProjectiles
			clone.Position = scriptParent:FindFirstChild("Projectiles"):FindFirstChild("TopFist").Position + UDim2.new(0, 0, 0.1, 0)

			local u31 = nil

			if u4 then
				task.spawn(function()
					task.wait(0.2)
					u31 = u4:addCollider(clone, false)
					task.wait(10 / i)
					u4:removeCollider(u31.instance)
				end)
			end

			local numberValue: NumberValue = Instance.new("NumberValue")

			numberValue.Name = "Damage"
			numberValue.Value = 300
			numberValue.Parent = clone
			task.spawn(function()
				task.wait(10 / i)

				local tweenService: TweenService = game:GetService("TweenService")
				local sparkle = clone:FindFirstChild("Sparkle")

				tweenService:Create(sparkle, tweenInfo, { ImageTransparency = 1 }):Play()
				task.wait(0.5)
				clone:Destroy()
			end)
			task.wait(0.1)

			local projectiles3: Instance = scriptParent:FindFirstChild("Projectiles")

			for _, v in pairs(projectiles3:GetChildren()) do
				if v22 then
					local v36: Tween = game:GetService("TweenService"):Create(v, tweenInfo2, { Position = t1[v.Name] })

					if i == 3 then
						local tweenService: TweenService = game:GetService("TweenService")
						local sparkle = v:FindFirstChild("Sparkle")

						tweenService:Create(sparkle, tweenInfo2, { ImageTransparency = 1 }):Play()
					end

					v36:Play()
				end
			end

			task.wait(0.25)
		end

		task.spawn(function()
			task.wait(10)
			script.Parent:Destroy()
			connection:Disconnect()
		end)
	end
}
