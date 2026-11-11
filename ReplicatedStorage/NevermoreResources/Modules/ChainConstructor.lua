



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local linkedConstructor = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("LinkedConstructor")
local module: {[any]: any} = {}

module.__index = module
module.ClassName = "ChainConstructor"
setmetatable(module, linkedConstructor)

function module.new()
	local v4 = linkedConstructor.new()

	setmetatable(v4, module)

	return v4
end
function module.TryToConstruct(p1, p2)
	if p1:ShouldConstruct(p2) then
		return p1:Construct(p2) or error("[ChainConstructor] - Must construct something")
	end

	if p1.Next then
		return p1.Next:TryToConstruct(p2)
	end

	error("[ChainConstructor] - Unable to construct anything")

	return nil
end

return module
