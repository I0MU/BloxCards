



local allQuests = require(game.ReplicatedStorage.AllQuests)
local buttons = script.Parent.Menu.Buttons
local questHolders = script.Parent.Menu.QuestHolders
local s1 = "Levels"
local tweenService: TweenService = game:GetService("TweenService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local t1: {[any]: any} = {}

function displayRewards(_)
end
function calculateDisplayScalar(_)
end
function pressDown(p3)
	if (t1[p3] == nil or t1[p3] ~= nil and t1[p3] <= time()) and s1 ~= p3.Parent.Name then
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true, 0.05)
		local v14: Tween = tweenService:Create(p3, tweenInfo, { Position = p3.Position + UDim2.new(0, 0, 0.07, 0) })

		t1[p3] = time() + 0.3
		v14:Play()
		script.ClickSound:Play()
	end
end
function shake(p4)
	if t1[p4] == nil or t1[p4] ~= nil and t1[p4] <= time() then
		p4.ImageColor3 = Color3.new(1, 0, 0)
		p4.Parent.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
		p4.Parent.Background.Value.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
		script.DeniedSound:Play()
		t1[p4] = time() + 0.55

		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		local v17: Tween = tweenService:Create(p4, tweenInfo, { Position = p4.Position + UDim2.new(0.1, 0, 0, 0.05) })

		v17:Play()
		v17.Completed:Wait()

		local tweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

		v17 = tweenService:Create(p4, tweenInfo2, { Position = p4.Position - UDim2.new(0.2, 0, 0, 0) })
		v17:Play()
		v17.Completed:Wait()

		local tweenInfo3 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

		v17 = tweenService:Create(p4, tweenInfo3, { Position = p4.Position + UDim2.new(0.1, 0, 0, 0) })
		v17:Play()
		v17.Completed:Wait()
		wait(0.15)
		p4.ImageColor3 = Color3.new(0, 0, 0)
		p4.Parent.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		p4.Parent.Background.Value.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
end
function clearQuests()
	for _, v in pairs(questHolders.QuestHolder:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
end
function update()
	clearQuests()
	questHolders.BackgroundColor3 = buttons.Buttons:FindFirstChild(s1).BackgroundColor3
	questHolders.QuestHolder.ScrollBarImageColor3 = buttons.ButtonBackDrops:FindFirstChild(s1).BackgroundColor3

	for i = 1, 6 do
		local clone = replicatedStorage.Table:Clone()

		clone.Name = "Table" .. i
		clone.Parent = questHolders.QuestHolder
	end

	if allQuests[s1] then
		for k, v in pairs(allQuests[s1]) do
			local clone2: Instance = replicatedStorage:FindFirstChild(v.Type):Clone()

			clone2.Outline.BackgroundColor3 = buttons.ButtonBackDrops:FindFirstChild(s1).BackgroundColor3
			clone2.Name = k
			clone2.Outline.WhiteInside.Title.Text = v.Name
			clone2.Outline.WhiteInside.LayoutOrder = v.DefaultSort

			if v.Type == "Scalar" then
				clone2.Outline.WhiteInside.Bar.Percent.Text = "0%"
			else
				clone2.Outline.WhiteInside.Objective.Text = v.Goal
			end

			for i = 1, 6 do
				if questHolders.QuestHolder:FindFirstChild("Table" .. i) ~= nil and #questHolders.QuestHolder:FindFirstChild("Table" .. i):GetChildren() <= 8 then
					clone2.Parent = questHolders.QuestHolder:FindFirstChild("Table" .. i)

					break
				end
			end
		end
	end

	warn("Add code the Requirement, Stat, and IsAddition stats. Display Scalar bar code, Rewards display, and loading all the stats from the client in a sudo server")
	warn("Completed quests are maunelly redeemable for rewards and title becomes the position of {{0.45, 0},{0.05, 0}} while objective becomes invisible and rewards becomes visible")
end

for _, v in pairs(buttons.Buttons:GetChildren()) do
	if v:FindFirstChild("Click") then
		v.Click.MouseButton1Click:Connect(function()
			if v.Name == "None" then
				shake(v.Icon)

				return
			end

			pressDown(v.Icon)
			s1 = v.Name
			wait()
			update()
		end)
	end
end

update()
print(script.Parent.Parent.AbsoluteSize)

if script.Parent.Parent.AbsoluteSize.X < 1366 then
	script.Parent.Menu.Size = UDim2.new(1, 0, 0.85, 0)
	script.Parent.Menu.Position = UDim2.new(0.5, 0, 0.49, 0)
	script.Parent.Menu.QuestHolders.Size = UDim2.new(0.891, 0, 0.962, 0)
	script.Parent.Menu.QuestHolders.Position = UDim2.new(0.1, 0, 0.503, 0)
	script.Parent.Menu.QuestHolders.QuestHolder.CanvasSize = UDim2.new(3.25, 0, 0, 0)
	script.Parent.Menu.Buttons.Size = UDim2.new(0.1, 0, 0.955, 0)
end
