



local module: {[any]: any} = {}

module.__index = module
module.ClassName = "EffectFence"

function module.new(p1)
	local unnamed: {[any]: any} = {}

	setmetatable(unnamed, module)
	unnamed.Region = p1 or error("No region")
	unnamed.Name = "Unnamed"

	return unnamed
end
function module.PointInFence(p2, p3)
	return p2.Region:CastPoint(p3)
end
function module.__tostring(p4)
	return p4.Name
end

return module
