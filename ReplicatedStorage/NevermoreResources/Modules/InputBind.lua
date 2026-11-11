



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("Signal")
local v3 = replicatedStorage("BindableAction")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "InputBind"

function module.new()
	local t2: {[any]: any} = {}

	setmetatable(t2, module)
	t2.BoundActions = {}
	t2.AllActions = {}
	t2.IsCurrentlyBound = false
	t2.ActionBound = v2.new()
	t2.ActionUnbound = v2.new()

	return t2
end
function module.GetActions(p1)
	return p1.AllActions
end
function module.AddAction(p2, p3)
	local allActions = p2.AllActions
	local v10 = p3:GetName()

	allActions[v10] = p3

	if p2:IsBound() then
		p2:BindAction(p3)
	end

	return p3
end
function module.GetAction(p4, p5)
	return p4.AllActions[p5]
end
function module.Add(p6, p7, p8, p9, ...)
	return p6:AddAction(v3.FromUsualInput(p7, p8, p9, ...))
end
function module.AddFromData(p10, p11)
	local v19 = v3.FromData(p11)

	p10:AddAction(v19)

	return v19
end
function module.IsBound(p12)
	return p12.IsCurrentlyBound
end
function module.BindInput(p13)
	assert(not p13.IsCurrentlyBound, "Already bound")
	p13.IsCurrentlyBound = true

	for _, v in pairs(p13.AllActions) do
		local boundActions = p13.BoundActions
		local v25 = v:GetName()

		if not boundActions[v25] then
			p13:BindAction(v)
		end
	end
end
function module.UnbindInput(p14)
	assert(p14.IsCurrentlyBound, "Already unbound")
	p14.IsCurrentlyBound = false

	for k, _ in pairs(p14.BoundActions) do
		p14:UnbindAction(k)
	end
end
function module.BindAction(p15, p16)
	local boundActions = p15.BoundActions
	local v32 = p16:GetName()

	assert(not boundActions[v32], "Action is already bound")
	p16:Bind()

	local v33 = p15.BoundActions
	local v34 = p16:GetName()

	v33[v34] = p16
	p15.ActionBound:fire(p16)
end
function module.UnbindAction(p17, p18)
	local v37 = p17.BoundActions[p18]

	assert(v37, "Action '" .. p18 .. "' is not bound")
	v37:Unbind()
	p17.BoundActions[p18] = nil
	p17.ActionUnbound:fire(v37)
end

return module
