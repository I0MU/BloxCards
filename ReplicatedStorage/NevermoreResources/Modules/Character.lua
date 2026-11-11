



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("RawCharacter")
local v3 = replicatedStorage("qSystems")
local v4 = replicatedStorage("Type")
local checkCharacter = v3.CheckCharacter
v3 = {}

for k, v in pairs(v2) do
	if type(k) ~= "string" then
		local text: string = tostring(k)
		local v9 = v4.GetType(k)

		error("[Character] - functionName '" .. text .. "' a '" .. v9 .. "' value should be a string")
	end

	if type(v) == "function" and k:lower() ~= "import" then
		v3[k] = function(p1, ...)
			if checkCharacter(p1) then
				v(p1, ...)

				return
			end

			error("[Character] - The character did not have a correct head, torso, or humanoid, so '" .. k .. "' could not execute")
		end
	end
end

return v3
