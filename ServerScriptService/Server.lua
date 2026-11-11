--[[ ServerScriptService/Server  (Script)
Bootstraps the server: loads Network + PlayerData, then every ModuleScript in
ServerScriptService/Handlers. Each handler module returns a table with an
Init(Network, PlayerData) function that registers its actions.
]]
local ServerScriptService = game:GetService("ServerScriptService")

local Modules = ServerScriptService:WaitForChild("Modules")
local Handlers = ServerScriptService:WaitForChild("Handlers")

-- Studio only: the client's intro menu hides "Start" for a fresh profile (0 wins/losses) and forces the
-- tutorial, unless ReplicatedStorage.Testing exists. Delete this block to go back to the normal first-run flow.
if game:GetService("RunService"):IsStudio() then
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	if not ReplicatedStorage:FindFirstChild("Testing") then
		local testing = Instance.new("BoolValue")
		testing.Name = "Testing"
		testing.Parent = ReplicatedStorage
	end
end

local Network = require(Modules:WaitForChild("Network"))
local PlayerData = require(Modules:WaitForChild("PlayerData"))

PlayerData.Start()

for _, module in ipairs(Handlers:GetChildren()) do
	if module:IsA("ModuleScript") then
		local ok, handler = pcall(require, module)
		if ok and type(handler) == "table" and handler.Init then
			local ok2, err = pcall(handler.Init, Network, PlayerData)
			if not ok2 then
				warn("[Server] Handler failed to init:", module.Name, err)
			end
		else
			warn("[Server] Handler failed to load:", module.Name, handler)
		end
	end
end

print("[Server] Ready")