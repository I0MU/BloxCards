--[[ ReplicatedStorage/NevermoreEngine  (ModuleScript)
Replacement for the original, which failed to decompile (it came out empty, so
`require` on it returned nothing). Rebuilt from how the game uses it:
  LoadLibrary("qSystems") etc. -> requires ReplicatedStorage.NevermoreResources.Modules.<name>
  GetRemoteEvent / GetRemoteFunction -> NevermoreResources.RemoteEvents / RemoteFunctions
Works whether called with "." or ":".
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Engine = {}
local resources = ReplicatedStorage:WaitForChild("NevermoreResources")
local modules = resources:WaitForChild("Modules")
local cache = {}

-- allow Engine.Func(name) and Engine:Func(name)
local function nameArg(a, b)
	if a == Engine then
		return b
	end
	return a
end

function Engine.LoadLibrary(a, b)
	local name = nameArg(a, b)
	if cache[name] ~= nil then
		return cache[name]
	end
	local module = modules:WaitForChild(name, 10)
	if not module then
		error("[NevermoreEngine] Library not found: " .. tostring(name), 2)
	end
	local lib = require(module)
	cache[name] = lib
	return lib
end
Engine.loadLibrary = Engine.LoadLibrary

function Engine.GetRemoteEvent(a, b)
	local name = nameArg(a, b)
	return resources:WaitForChild("RemoteEvents"):WaitForChild(name)
end

function Engine.GetRemoteFunction(a, b)
	local name = nameArg(a, b)
	return resources:WaitForChild("RemoteFunctions"):WaitForChild(name)
end

return Engine