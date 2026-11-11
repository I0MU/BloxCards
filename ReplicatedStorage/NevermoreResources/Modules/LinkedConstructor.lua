



local module: {[any]: any} = { ClassName = "LinkedConstructor" }

module.__index = module
module.IsLinkedConstructor = true

function module.new()
	local t2: {[any]: any} = {}

	setmetatable(t2, module)

	return t2
end
function module.Construct(_, _)
	error("Shoud be overridden")
end
function module.TryToConstruct(p3, p4, p5)
	local t3 = p5 or {}

	if p3:ShouldConstruct(p4) then
		local v9 = p3:Construct(p4) or error("[LinkedConstructor] - The linked constructor must construct something if it ShouldConstruct is true")

		table.insert(t3, v9)
	end

	if p3.Next then
		return p3.Next:TryToConstruct(p4, t3)
	end

	return t3
end
function module.ShouldConstruct(_, _)
	error("[LinkedConstructor] - Should be overridden")
end
function module.SetNext(p8, next)
	assert(next.IsLinkedConstructor, "[LinkedConstructor] - Next should be a LinkedConstructor")
	p8.Next = next
end

return module
