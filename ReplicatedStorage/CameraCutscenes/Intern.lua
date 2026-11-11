



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioService = require(replicatedStorage.AudioService)
local module: {[any]: any} = {
	Funcs = {}
}
local funcs = module.Funcs

module.Model = game.Workspace.Duelists:WaitForChild("Friendly Devil")
module.Animator = game.Workspace.Duelists["Friendly Devil"].Humanoid.Animator
module.Camera = game:GetService("ReplicatedStorage").CameraAngles.InternCamera
module.Id = 9593391254

local t2: {[any]: any} = {
	Intern_Blink = "rbxassetid://9575294610",
	Intern_OpenEyes = "rbxassetid://9575293216",
	Intern_Smile = "rbxassetid://9575303450",
	Intern_OpenSmile = "rbxassetid://9575297233",
	Intern_TeethSmile = "rbxassetid://9575296227"
}

function funcs.Eyes(p1)
	module.Model.Head.Eyes.Texture = t2[p1]
end
function funcs.Mouth(p2)
	module.Model.Head.Mouth.Texture = t2[p2]
end
function funcs.Sound(p3)
	audioService.PlaySound(p3)
end

return module
