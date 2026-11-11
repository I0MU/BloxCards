



local audioService = require(game.ReplicatedStorage.AudioService)

require(game.ReplicatedStorage.Animation)
require(game.ReplicatedStorage.CopyTable)

local audioServicePlaySound = audioService.PlaySound

game:GetService("RunService")

local tweenService: TweenService = game:GetService("TweenService")
local scriptPassiveImageTemplate = script.PassiveImageTemplate
local vector2New = Vector2.new

local function AbsolutePosition(p1)
	return vector2New(p1.Position.X.Offset, p1.Position.Y.Offset)
end

local uDim2New = UDim2.new

local function ApplyValues(p2, p3)
	for k, v in pairs(p3) do
		p2[k] = v
	end
end
local function CenterPos(p4)
	local uDim2 = UDim2.new(0, p4.AbsolutePosition.X, 0, p4.AbsolutePosition.Y)
	local uDim22 = UDim2.new(0, p4.AbsoluteSize.X * 0.5, 0, p4.AbsoluteSize.Y * 0.5)

	return uDim2 + uDim22
end
function NewImg(parent, p6)
	local imageLabel: ImageLabel = Instance.new("ImageLabel")

	imageLabel.AnchorPoint = vector2New(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://511406127"
	imageLabel.Size = uDim2New()
	imageLabel.Parent = parent

	for k, v in pairs(p6) do
		imageLabel[k] = v
	end

	return imageLabel
end

CenterPos = function(p7, p8, p9, p10, p11, p12, p13: string)
	if not p13 then
		p13 = "Out"
	end

	local tweenInfo = TweenInfo.new(p11, Enum.EasingStyle[p12], Enum.EasingDirection[p13])
	local v34: Tween = tweenService:Create(p7, tweenInfo, { [p8] = p10 })

	p7[p8] = p9
	v34:Play()
	v34.Completed:Wait()
	v34:Destroy()
end

local function TokenEffect(p16, _, p18)
	local physical = p16.Physical
	local clone = script.Token:Clone()
	local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
	local v41: Tween = tweenService:Create(clone, tweenInfo, { Offset = Vector2.new(0.25, 0) })
	local v42: Tween = tweenService:Create(clone, tweenInfo, { Offset = Vector2.new(-0.25, 0) })

	for _, v in pairs(physical:GetChildren()) do
		if v:IsA("UIGradient") then
			v:Destroy()
		end
	end

	clone.Parent = physical
	clone.Enabled = false
	task.spawn(function()
		if table.find(p18, p16.Position) then
			clone.Enabled = true

			while true do
				if not table.find(p18, p16.Position) then
					break
				end

				v41:Play()
				v41.Completed:Wait()
				v42:Play()
				v42.Completed:Wait()
			end
		else
			clone.Enabled = false
			v41:Cancel()
			v42:Cancel()
		end
	end)
	p16.Events.MoveTo:Connect(function()
		if table.find(p18, p16.Position) then
			clone.Enabled = true

			while true do
				if not table.find(p18, p16.Position) then
					break
				end

				v41:Play()
				v41.Completed:Wait()
				v42:Play()
				v42.Completed:Wait()
			end
		else
			clone.Enabled = false
			v41:Cancel()
			v42:Cancel()
		end
	end)
end
local function ColorChange(p29, _, p31)
	local physical = p29.Physical
	local clone = p31:Clone()
	local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0)
	local v51: Tween = tweenService:Create(clone, tweenInfo, { Rotation = 360 })

	for _, v in pairs(physical:GetChildren()) do
		if v:IsA("UIGradient") then
			v:Destroy()
		end
	end

	clone.Parent = physical
	clone.Enabled = true

	local t2: {[any]: any} = { "Hand", "Field", "Baseplate" }

	task.spawn(function()
		if table.find(t2, p29.Position) then
			clone.Enabled = true

			while true do
				if not table.find(t2, p29.Position) then
					break
				end

				clone.Rotation = 0
				v51:Play()
				v51.Completed:Wait()
			end
		else
			clone.Enabled = false
			v51:Cancel()
		end
	end)
	p29.Events.MoveTo:Connect(function()
		if table.find(t2, p29.Position) then
			clone.Enabled = true

			while true do
				if not table.find(t2, p29.Position) then
					break
				end

				clone.Rotation = 0
				v51:Play()
				v51.Completed:Wait()
			end
		else
			clone.Enabled = false
			v51:Cancel()
		end
	end)
end

local module: {[any]: any} = {
	Fleeting = function(p14, _)
		local physical = p14.Physical

		p14.Fleeting = true

		local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
		local color3 = Color3.fromRGB(90, 123, 166)
		local v60: Tween = tweenService:Create(physical, tweenInfo, { ImageTransparency = 0.35, ImageColor3 = color3 })
		local color32 = Color3.fromRGB(117, 171, 186)
		local v62: Tween = tweenService:Create(physical, tweenInfo, { ImageTransparency = 0, ImageColor3 = color32 })

		task.spawn(function()
			if p14.Position == "Hand" then
				while p14.Position == "Hand" and p14.Fleeting == true do
					v60:Play()
					v60.Completed:Wait()
					v62:Play()
					v62.Completed:Wait()
				end

				if not p14.Fleeting then
					v60:Cancel()
					v62:Cancel()
					physical.ImageTransparency = 0
					physical.ImageColor3 = Color3.fromRGB(255, 255, 255)

					return
				end
			else
				v60:Cancel()
				v62:Cancel()
				physical.ImageTransparency = 0
				physical.ImageColor3 = Color3.fromRGB(255, 255, 255)
			end
		end)
		p14.Events.MoveTo:Connect(function()
			if p14.Position == "Hand" then
				while p14.Position == "Hand" and p14.Fleeting == true do
					v60:Play()
					v60.Completed:Wait()
					v62:Play()
					v62.Completed:Wait()
				end

				if not p14.Fleeting then
					v60:Cancel()
					v62:Cancel()
					physical.ImageTransparency = 0
					physical.ImageColor3 = Color3.fromRGB(255, 255, 255)

					return
				end
			else
				v60:Cancel()
				v62:Cancel()
				physical.ImageTransparency = 0
				physical.ImageColor3 = Color3.fromRGB(255, 255, 255)
			end
		end)
	end,
	Token = function(p19, p20)
		TokenEffect(p19, p20, { "Field" })
	end,
	TokenDiscard = function(p21, p22)
		TokenEffect(p21, p22, { "Hand" })
	end,
	Hidden = function(p23, _)
		local physical = p23.Physical

		p23.PhysicalHealth.Visible = false
		p23.PhysicalPower.Visible = false
		task.spawn(function()
			while p23 do
				if not p23.Hidden then
					p23.PhysicalHealth.Visible = true
					p23.PhysicalPower.Visible = true

					return
				end

				task.wait(1)
			end
		end)
	end,
	Zombified = function(p25, _)
		local physical = p25.Physical
		local clone = script.Zombified:Clone()
		local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0)
		local v75: Tween = tweenService:Create(clone, tweenInfo, { Rotation = 360 })

		for _, v in pairs(physical:GetChildren()) do
			if v:IsA("UIGradient") then
				v:Destroy()
			end
		end

		clone.Parent = physical
		clone.Enabled = true

		local t3: {[any]: any} = { "Hand", "Field" }

		p25.PhysicalHealth.TextColor3 = Color3.fromRGB(111, 157, 103)
		p25.PhysicalPower.TextColor3 = Color3.fromRGB(94, 97, 157)
		task.spawn(function()
			if table.find(t3, p25.Position) then
				clone.Enabled = true

				while true do
					if not table.find(t3, p25.Position) then
						break
					end

					clone.Rotation = 0
					v75:Play()
					v75.Completed:Wait()
				end
			else
				clone.Enabled = false
				v75:Cancel()
			end
		end)
		p25.Events.MoveTo:Connect(function()
			if table.find(t3, p25.Position) then
				clone.Enabled = true

				while true do
					if not table.find(t3, p25.Position) then
						break
					end

					clone.Rotation = 0
					v75:Play()
					v75.Completed:Wait()
				end
			else
				clone.Enabled = false
				v75:Cancel()
			end
		end)
	end,
	Gilded = function(p27, _)
		local physical = p27.Physical
		local clone = script.Gilded:Clone()
		local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0)
		local v84: Tween = tweenService:Create(clone, tweenInfo, { Rotation = 360 })

		for _, v in pairs(physical:GetChildren()) do
			if v:IsA("UIGradient") then
				v:Destroy()
			end
		end

		clone.Parent = physical
		clone.Enabled = true

		local t4: {[any]: any} = { "Hand", "Field" }

		p27.PhysicalHealth.TextColor3 = Color3.fromRGB(196, 243, 27)
		p27.PhysicalPower.TextColor3 = Color3.fromRGB(243, 200, 30)
		task.spawn(function()
			if table.find(t4, p27.Position) then
				clone.Enabled = true

				while true do
					if not table.find(t4, p27.Position) then
						break
					end

					clone.Rotation = 0
					v84:Play()
					v84.Completed:Wait()
				end
			else
				clone.Enabled = false
				v84:Cancel()
			end
		end)
		p27.Events.MoveTo:Connect(function()
			if table.find(t4, p27.Position) then
				clone.Enabled = true

				while true do
					if not table.find(t4, p27.Position) then
						break
					end

					clone.Rotation = 0
					v84:Play()
					v84.Completed:Wait()
				end
			else
				clone.Enabled = false
				v84:Cancel()
			end
		end)
	end,
	Red = function(p32, p33)
		ColorChange(p32, p33, script.Red)
	end,
	Blue = function(p34, p35)
		ColorChange(p34, p35, script.Blue)
	end,
	Yellow = function(p36, p37)
		ColorChange(p36, p37, script.Yellow)
	end,
	Green = function(p38, p39)
		ColorChange(p38, p39, script.Green)
	end,
	Neutral = function(p40, p41)
		ColorChange(p40, p41, script.Neutral)
	end,
	Dominant = function(p42, p43)
		ColorChange(p42, p43, script.Red)
	end,
	Perceptive = function(p44, p45)
		ColorChange(p44, p45, script.Blue)
	end,
	Sociable = function(p46, p47)
		ColorChange(p46, p47, script.Yellow)
	end,
	Prosperous = function(p48, p49)
		ColorChange(p48, p49, script.Green)
	end
};

(function(p50)
	for k, v in pairs(p50) do
		module[k] = function(p51, _)
			local physicalPassives = p51.PhysicalPassives

			if physicalPassives and physicalPassives:FindFirstChild(k) then
				return
			end

			local clone = scriptPassiveImageTemplate:Clone()

			clone.Image = v
			clone.ZIndex = physicalPassives.ZIndex + 1
			clone.Parent = physicalPassives
			clone.Name = k

			if k == "Hunt" then
				clone.Visible = false

				local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0)
				local color3 = Color3.fromRGB(0, 38, 255)
				local v115: Tween = tweenService:Create(clone, tweenInfo, { ImageTransparency = 0, ImageColor3 = color3 })
				local color33 = Color3.fromRGB(255, 255, 255)
				local v117: Tween = tweenService:Create(clone, tweenInfo, { ImageTransparency = 0, ImageColor3 = color33 })

				task.spawn(function()
					while clone do
						v115:Play()
						v115.Completed:Wait()
						v117:Play()
						v117.Completed:Wait()
					end
				end)
			end
		end
	end
end)({
	Shield = "rbxassetid://12283053551",
	Fading = "rbxassetid://12939355194",
	Terrified = "rbxassetid://12939354334",
	Fearful = "rbxassetid://12939354334",
	TriggerInGraveZone = "rbxassetid://7292973261",
	Terror = "rbxassetid://89586549004291",
	Drafted = "rbxassetid://98141907162219",
	Liberate = "rbxassetid://12282724081",
	Nurtured = "rbxassetid://13832720194",
	Overload = "rbxassetid://12283033877",
	Regen = "rbxassetid://13832954003",
	Decaying = "rbxassetid://13833595330",
	Dextrous = "rbxassetid://13832721630",
	StrengthenImmune = "rbxassetid://12289574257",
	WeakenImmune = "rbxassetid://12289588796",
	CounterAttackBlock = "rbxassetid://12289549491",
	CounterBlock = "rbxassetid://12289551104",
	AttackBlock = "rbxassetid://12283057492",
	DestroyImmune = "rbxassetid://12289554949",
	TargetImmune = "rbxassetid://12289583943",
	DamageImmune = "rbxassetid://12289552634",
	ReturnImmune = "rbxassetid://12289576921",
	TransformImmune = "rbxassetid://12289585594",
	SwapImmune = "rbxassetid://12289582211",
	SuspendImmune = "rbxassetid://12289580114",
	Moonward = "rbxassetid://12283046148",
	UnlockImmune = "rbxassetid://12289587132",
	LockImmune = "rbxassetid://12296360063",
	HealImmune = "rbxassetid://12289563930",
	DivideImmune = "rbxassetid://12289560110",
	StealImmune = "rbxassetid://12289578338",
	SetImmune = "rbxassetid://12289571121",
	Unique = "rbxassetid://12282724081",
	Element = "rbxassetid://72493679658854",
	Hunt = "rbxassetid://74907711310957",
	Aspiration = "rbxassetid://4019301113"
})

return module
