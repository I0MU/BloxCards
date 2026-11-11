



local t1: {[any]: any} = {}
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game.Players.LocalPlayer
local animation = require(replicatedStorage.Animation)
local audioService = require(replicatedStorage.AudioService)
local children = workspace.Interactables:GetChildren()

task.spawn(function()
	local crazyRobloxian = workspace.Duelists:WaitForChild("Crazy Robloxian")
	local animation2: Animation = Instance.new("Animation")

	animation2.AnimationId = "rbxassetid://104782763765571"

	local animationTrack = crazyRobloxian.Humanoid.Animator:LoadAnimation(animation2)
	local billboardGui = crazyRobloxian.Head.BillboardGui

	animation2:Destroy()

	local u13: boolean = false

	function t1.NiceJump()
		if u13 then
			return
		end

		print("activated")
		u13 = true
		billboardGui.TextLabel.BackgroundTransparency = 1
		billboardGui.TextLabel.TextTransparency = 1
		billboardGui.TextLabel.Position = UDim2.fromScale(0, 0.5)
		task.wait(1.25)
		audioService.PlaySound("StarDing")
		billboardGui.Enabled = true
		billboardGui.TextLabel.Visible = true
		animation.AnimateAsync(billboardGui.TextLabel, { BackgroundTransparency = 0, TextTransparency = 0 }, 0.5, "Out", "Quart")

		local animationAnimateAsync = animation.AnimateAsync
		local billboardGuiTextLabel = billboardGui.TextLabel
		local v17 = UDim2.fromScale(0, 0.25)

		animationAnimateAsync(billboardGuiTextLabel, { Position = v17 }, 1, "Out", "Quart")
		animationTrack:Play()
		crazyRobloxian.Head.Decal.Texture = "rbxassetid://127673838635103"
		task.wait(2)
		crazyRobloxian.Head.Decal.Texture = "rbxassetid://103110891951590"
		animation.AnimateAsync(billboardGui.TextLabel, { BackgroundTransparency = 1, TextTransparency = 1 }, 0.5, "Out", "Quart")
		task.wait(1)
		billboardGui.Enabled = false
		billboardGui.TextLabel.Visible = false
		u13 = false
	end
end)

for _, v in pairs(children) do
	if t1[v.Name] then
		v.Touched:Connect(function(p1)
			if p1.Parent == LocalPlayer.Character then
				t1[v.Name]()
			end
		end)
	end
end

return {}
