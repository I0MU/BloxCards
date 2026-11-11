



local runService: RunService = game:GetService("RunService")
local audioService = require(game.ReplicatedStorage.AudioService)
local scriptParent: Instance = script.Parent
local n1: number = 0.2
local u5 = nil
local move = nil
local s1: string = "Idle"
local t1: {[any]: any} = {}

local function OnRenderStepped(p1)
	if s1 == "Idle" then
		return
	end

	if s1 == "Homing" then
		local projectiles: Instance = scriptParent:FindFirstChild("Projectiles")

		for _, v in pairs(projectiles:GetChildren()) do
			local vector2 = Vector2.new(0, 0)

			if move then
				vector2 = Vector2.new(move.Position.X.Scale - v.Position.X.Scale, move.Position.Y.Scale - v.Position.Y.Scale).Unit
			end

			local uDim2 = UDim2.new(vector2.X * n1 * p1, 0, vector2.Y * n1 * p1, 0)

			v.Position = v.Position + uDim2
			t1[v.Name] = vector2.Unit
		end
	end

	if s1 == "Travel" then
		local projectiles: Instance = scriptParent:FindFirstChild("Projectiles")

		for _, v in pairs(projectiles:GetChildren()) do
			local uDim2 = UDim2.new(t1[v.Name].X * n1 * p1, 0, t1[v.Name].Y * n1 * p1, 0)

			v.Position = v.Position + uDim2
		end
	end
end

local t2: {[any]: any} = {
	Projectile1 = UDim2.new(0.06, 0, -0.15, 0),
	Projectile2 = UDim2.new(0.086, 0, 0.093, 0),
	Projectile3 = UDim2.new(0, 0, 0.18, 0),
	Projectile4 = UDim2.new(-0.086, 0, 0.093, 0),
	Projectile5 = UDim2.new(-0.06, 0, -0.15, 0)
}

return {
	GetCollisionGroup = function(p2)
		u5 = p2
	end,
	ActivatePattern = function()
		move = script.Parent.Parent.Parent:FindFirstChild("Move")

		local connection = runService.RenderStepped:Connect(OnRenderStepped)

		for i = 1, 3 do
			local projectiles: Instance = scriptParent:FindFirstChild("Projectiles")

			for _, v in pairs(projectiles:GetChildren()) do
				v.Visible = false
			end

			local projectiles2: Instance = scriptParent:FindFirstChild("Projectiles")

			for _, v in pairs(projectiles2:GetChildren()) do
				if move then
					v.Position = move.Position + t2[v.Name]
				end

				local u30 = nil

				if u5 then
					u30 = u5:addCollider(v, false)
				end

				local damage: NumberValue = Instance.new("NumberValue")

				damage.Name = "Damage"
				damage.Value = 200
				damage.Parent = v

				if i == 3 then
					task.spawn(function()
						task.wait(5)
						v:Destroy()
						u5:removeCollider(u30.instance)
					end)
				end

				audioService.PlaySound("MagicSummon")
				v.Visible = true
				task.wait(0.1)
			end

			task.wait(1)
			audioService.PlaySound("MagicFire")
			n1 = 0.1
			s1 = "Homing"
			task.wait(0.1)
			n1 = 0.3
			s1 = "Travel"
			task.wait(0.5)
			n1 = 0.7
			task.wait(2)
			s1 = "Idle"
		end

		task.wait(3)
		script.Parent:Destroy()
		connection:Disconnect()
	end
}
