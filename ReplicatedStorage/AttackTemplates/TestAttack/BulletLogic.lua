



local runService: RunService = game:GetService("RunService")
local scriptParent: Instance = script.Parent
local u3 = nil

local function OnRenderStepped(p1)
	local v6 = Vector2.new(0, 1).X * 0.1 * p1
	local v7 = Vector2.new(0, 1).Y * 0.1 * p1
	local uDim2 = UDim2.new(v6, 0, v7, 0)
	local v9: Instance = scriptParent

	v9.Position = v9.Position + uDim2
end

return {
	GetCollisionGroup = function(p2)
		u3 = p2
	end,
	ActivatePattern = function()
		local u11 = nil

		if u3 then
			u11 = u3:addCollider(script.Parent, false)
		end

		local damage: NumberValue = Instance.new("NumberValue")

		damage.Name = "Damage"
		damage.Value = 500
		damage.Parent = script.Parent
		task.spawn(function()
			task.wait(6)
			script.Parent:Destroy()
			u3:removeCollider(u11.instance)
		end)
		runService.RenderStepped:Connect(OnRenderStepped)
	end
}
