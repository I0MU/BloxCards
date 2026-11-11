



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("Signal")
local v3 = replicatedStorage("EffectGroup")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "TrackingEffectGroup"
setmetatable(module, v3)

function module.new()
	local v5 = v3.new()

	setmetatable(v5, module)
	v5.ActiveChanged = v2.new()

	return v5
end
function module.GetActive(p1)
	return p1.Active
end
function module.SetActive(p2, p3)
	if p3 ~= p2.Active then
		local active = p2.Active

		p2.Active = p3
		p2.ActiveChanged:fire(p3, active)
	end
end
function module.Update(p4, p5)
	local v12 = p4:FindFirstActive(p5)

	p4:SetActive(v12)
end

return module
