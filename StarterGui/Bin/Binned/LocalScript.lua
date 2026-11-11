



local function has_property(p1, p2)
	local clone = nil

	local ok, result = pcall(function()
		clone = p1:Clone()
	end)

	if result then
		return
	end

	if not clone then
		return
	end

	clone:ClearAllChildren()

	return (pcall(function()
		return clone[p2]
	end))
end

wait(5)

local function createWindow(image, p4)
	local clone = script.Parent.Templete:Clone()

	clone.Parent = script.Parent.Frame
	clone.TextLabel.Text = p4

	if image == "rbxassetid://5623934809" then
		clone.TextLabel.TextColor3 = Color3.fromRGB(255, 10, 10)
	end

	clone.Image = image
	clone.Visible = true
end

for _, v in pairs(workspace:GetDescendants()) do
	if v:IsA("Decal") and v.Parent:IsA("BasePart") then
		local vTexture = v.Texture
		local text: string = tostring(v.Parent.Position)
		local clone = script.Parent.Templete:Clone()

		clone.Parent = script.Parent.Frame
		clone.TextLabel.Text = text

		if vTexture == "rbxassetid://5623934809" then
			clone.TextLabel.TextColor3 = Color3.fromRGB(255, 10, 10)
		end

		clone.Image = vTexture
		clone.Visible = true
	end

	if has_property(v, "Image") then
		local vImage = v.Image
		local vName = v.Name
		local clone = script.Parent.Templete:Clone()

		clone.Parent = script.Parent.Frame
		clone.TextLabel.Text = vName

		if vImage == "rbxassetid://5623934809" then
			clone.TextLabel.TextColor3 = Color3.fromRGB(255, 10, 10)
		end

		clone.Image = vImage
		clone.Visible = true
	end
end
