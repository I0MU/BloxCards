





local CurrentCamera: Camera = workspace.CurrentCamera
local engines = require(script.Parent.Engines).engines
local character = require(script.Parent.Character)
local t1: {[any]: any} = {}
local clone = game.ReplicatedStorage.SnowBlock:Clone()

clone.Parent = workspace.Bin

local cloneSnowEmitter = clone.SnowEmitter

local module: {[any]: any} = {
	Indoors = function()
		if character.Indoors then
			return character.Indoors()
		end

		local ray = Ray.new(CurrentCamera.CFrame.p, Vector3.new(0, 24, 0))

		return (workspace:FindPartOnRayWithIgnoreList(ray, { workspace.Bin }, true))
	end
}

local function updateSnow()
	local n1 = CurrentCamera.CFrame.lookVector * Vector3.new(1, 0, 1)
	local n2 = CurrentCamera.CFrame.p + Vector3.new(0, 6, 0) + n1 * 16

	clone.CFrame = CFrame.new(n2, n2 + n1)
	cloneSnowEmitter.Enabled = not module.Indoors()
end

if game.Lighting:FindFirstChild("SnowEnabled") and game.Lighting.SnowEnabled.Value then
	engines.UpdateSnow = updateSnow
end

module.UpdateSnow = updateSnow
print("Finished loading " .. script.Name)

return module
