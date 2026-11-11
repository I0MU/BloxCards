



local scriptParent: Instance = script.Parent
local song: Instance = script.Parent:WaitForChild("Boombox"):WaitForChild("Song")

game:GetService("ReplicatedStorage")

local workspace: Workspace = game:GetService("Workspace")

scriptParent.AncestryChanged:Connect(function()
	if scriptParent.Parent == workspace.WorldElements then
		song:Play()

		return
	end

	song:Stop()
end)
