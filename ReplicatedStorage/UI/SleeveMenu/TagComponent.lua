



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local paperRipple = require(replicatedStorage.NevermoreEngine).LoadLibrary("PaperRipple")
local baseTagButton: Instance = script.Parent:WaitForChild("base"):WaitForChild("BaseTagButton")
local sleevesNeo: Instance = replicatedStorage:WaitForChild("SleevesNeo")
local _tagDisplayName = require(sleevesNeo:WaitForChild("_tagDisplayName"))
local module: {[any]: any} = {}

module.__index = module

function module.new(p1)
	local clone: Instance = baseTagButton:Clone()

	clone.TagName.Text = _tagDisplayName:Get(p1.tagName)
	clone.Name = p1.tagName
	clone.Visible = true
	clone.ClipsDescendants = true
	paperRipple.new(clone)

	local object = setmetatable({
		tagName = p1.tagName,
		onChange = p1.onChange,
		state = p1.state,
		Physical = clone
	}, module)

	local function v10()
		object:Toggle()
	end

	clone.MouseButton1Click:Connect(v10)
	clone.TouchTap:Connect(v10)

	return object
end
function module.Toggle(p2)
	p2.state = not p2.state

	local selected = p2.Physical:FindFirstChild("Selected")
	local tagName = p2.Physical:FindFirstChild("TagName")

	if p2.state then
		selected.Visible = true
		tagName.TextColor3 = Color3.new(0, 0, 0)
	else
		selected.Visible = false
		tagName.TextColor3 = Color3.new(1, 1, 1)
	end

	if typeof(p2.onChange) == "function" then
		p2.onChange(p2, p2.state)
	end

	return p2.state
end

return module
