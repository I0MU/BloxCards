--[[ ServerScriptService/Modules/Network  (ModuleScript)
Server side of the client's Network module.

Client -> server:  Remote:InvokeServer(name, ...)   -> Network.OnInvoke(name, fn)
                   Port:FireServer(name, ...)       -> Network.OnFire(name, fn)
Server -> client:  Network.Send(player, name, ...)  -> Port:FireClient(player, name, ...)

Handlers receive (player, ...). Errors are caught so one bad call can't kill the remote.
]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function getRemote(name, class)
	local r = ReplicatedStorage:FindFirstChild(name)
	if not r then
		r = Instance.new(class)
		r.Name = name
		r.Parent = ReplicatedStorage
	end
	return r
end

local Remote = getRemote("Remote", "RemoteFunction")
local Port = getRemote("Port", "RemoteEvent")

local Network = {}
local invokeHandlers = {}
local fireHandlers = {}
local warned = {}

local function warnOnce(kind, name)
	local key = kind .. ":" .. tostring(name)
	if not warned[key] then
		warned[key] = true
		warn(("[Network] No server handler for %s '%s'"):format(kind, tostring(name)))
	end
end

function Network.OnInvoke(name, fn)
	invokeHandlers[name] = fn
end

function Network.OnFire(name, fn)
	fireHandlers[name] = fn
end

-- Register the same function for both (some actions are sent either way by the client).
function Network.On(name, fn)
	invokeHandlers[name] = fn
	fireHandlers[name] = fn
end

function Network.Send(player, name, ...)
	if player and player.Parent then
		Port:FireClient(player, name, ...)
	end
end

function Network.SendAll(name, ...)
	Port:FireAllClients(name, ...)
end

Remote.OnServerInvoke = function(player, name, ...)
	if type(name) ~= "string" then
		return nil
	end
	local fn = invokeHandlers[name] or fireHandlers[name]
	if not fn then
		warnOnce("invoke", name)
		return nil
	end
	local results = table.pack(pcall(fn, player, ...))
	if not results[1] then
		warn(("[Network] Invoke '%s' errored: %s"):format(name, tostring(results[2])))
		return nil
	end
	return table.unpack(results, 2, results.n)
end

Port.OnServerEvent:Connect(function(player, name, ...)
	if type(name) ~= "string" then
		return
	end
	local fn = fireHandlers[name] or invokeHandlers[name]
	if not fn then
		warnOnce("fire", name)
		return
	end
	local ok, err = pcall(fn, player, ...)
	if not ok then
		warn(("[Network] Fire '%s' errored: %s"):format(name, tostring(err)))
	end
end)

return Network