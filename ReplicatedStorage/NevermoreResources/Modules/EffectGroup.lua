



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "EffectGroup"

function module.new()
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.Fences = {}

	return t2
end
function module.AddEffectFence(p1, p2)
	assert(p2, "Must send Fence")
	p1.Fences[p2] = true
end
function module.RemoveFence(p3, p4)
	assert(p4, "Must send Fence")
	assert(p3.Fences[p4], "Fence must already be added to the group")
	p3.Fences[p4] = nil
end
function module.FindFirstActive(p5, p6)
	assert(p6, "Need point to cast")

	for k, _ in pairs(p5.Fences) do
		if k:PointInFence(p6) then
			return k
		end
	end

	return nil
end

return module
