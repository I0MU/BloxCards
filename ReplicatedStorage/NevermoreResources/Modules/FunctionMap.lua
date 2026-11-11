



local function Map(p1, p2, ...)
	for _, v in pairs(p1) do
		p2(v, ...)
	end
end

local module: {[any]: any} = { ClassName = "FunctionMap" }

module.__index = module

function module.new(p3, p4)
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.Objects = p3 or error("No Objects")
	t2.MapFuncton = p4 or error("No MapFuncton")
	t2.Children = {}

	return t2
end
function module.AddChild(p5, p6)
	p5.Children[p6] = true
end
function module.Map(p7, ...)
	Map(p7.Objects, p7.MapFuncton, ...)

	for k, _ in pairs(p7.Children) do
		k:Map(...)
	end
end

return module
