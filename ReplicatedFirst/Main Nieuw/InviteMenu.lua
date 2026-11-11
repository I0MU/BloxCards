



local socialService: SocialService = game:GetService("SocialService")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local newFakeTopBar = require(replicatedStorage.NewFakeTopBar)
local network = require(script.Parent.Network)
local networkFireServer = network.FireServer
local networkInvokeServer = network.InvokeServer
local networkClient = network.client

require(game.ReplicatedStorage.Effects)

local allQuests = require(replicatedStorage.Quest.AllQuests)
local audioService = require(replicatedStorage.AudioService)
local v10 = require(game.ReplicatedStorage.Maid).new()
local LocalPlayer = game.Players.LocalPlayer
local inviteUI = LocalPlayer.PlayerGui:WaitForChild("InviteUI")
local inviteMenu = inviteUI:FindFirstChild("InviteMenu")
local rewardsHolder = inviteMenu:FindFirstChild("RewardsHolder")

local function UpdateMenu()
	local v17 = networkInvokeServer("GetQuestInfo")
	local playersInvited = v17[1].PlayersInvited

	v10:DoCleaning()

	for _, v in pairs(rewardsHolder:GetChildren()) do
		if string.find(v.Name, "Challenge") then
			local parts = string.split(v.Name, "Challenge")
			local numberValue: number? = tonumber(parts[2])

			if playersInvited >= numberValue and v17[2]["InviteQuest" .. tostring(parts[2])] and v17[2]["InviteQuest" .. tostring(parts[2])][3] then
				local vName = rewardsHolder:FindFirstChild(v.Name)

				vName.BackgroundColor3 = Color3.fromRGB(117, 221, 124)

				local vName2 = rewardsHolder:FindFirstChild(v.Name)

				v10:GiveTask(vName2.Button.MouseButton1Click:Connect(function()
					local text: string = tostring(parts[2])

					if networkInvokeServer("QuestAward", "InviteQuest" .. text) then
						local networkClientShowRewards = networkClient.ShowRewards
						local allQuestsHidden = allQuests.Hidden
						local text2: string = tostring(parts[2])

						networkClientShowRewards(allQuestsHidden["InviteQuest" .. text2].Rewards, true)
						UpdateMenu()
					end
				end))

				local timestamp = tick()
				local runService: RunService = game:GetService("RunService")

				v10:GiveTask(runService.RenderStepped:Connect(function()
					if tick() - timestamp > 1 and inviteUI.Enabled == true then
						timestamp = tick()
					end
				end))
			else
				local vName = rewardsHolder:FindFirstChild(v.Name)

				v10:GiveTask(vName.Button.MouseButton1Click:Connect(function()
					local networkClientQuickShowRewards = networkClient.QuickShowRewards
					local allQuestsHidden = allQuests.Hidden
					local text: string = tostring(parts[2])

					networkClientQuickShowRewards(allQuestsHidden["InviteQuest" .. text].Rewards)
				end))

				local numberValue2: number? = tonumber(parts[2])

				if playersInvited >= numberValue2 then
					rewardsHolder:FindFirstChild(v.Name).IsClaimed.Visible = true

					local vName3 = rewardsHolder:FindFirstChild(v.Name)

					vName3.BackgroundColor3 = Color3.fromRGB(31, 32, 107)
				else
					rewardsHolder:FindFirstChild(v.Name).IsClaimed.Visible = false

					local vName4 = rewardsHolder:FindFirstChild(v.Name)

					vName4.BackgroundColor3 = Color3.fromRGB(74, 77, 255)
				end
			end

			local vName = rewardsHolder:FindFirstChild(v.Name)

			v10:GiveTask(vName.Button.MouseEnter:Connect(function()
				audioService.PlaySound("click2")

				local vName5 = rewardsHolder:FindFirstChild(v.Name)

				vName5.Button.ImageColor3 = Color3.fromRGB(117, 117, 117)
			end))

			local vName6 = rewardsHolder:FindFirstChild(v.Name)

			v10:GiveTask(vName6.Button.MouseLeave:Connect(function()
				local vName7 = rewardsHolder:FindFirstChild(v.Name)

				vName7.Button.ImageColor3 = Color3.fromRGB(255, 255, 255)
			end))
		end
	end
end

newFakeTopBar.new():setImage(77249337634299):bindEvent("deselected", function()
	if inviteUI.Enabled == true then
		inviteUI.Enabled = false

		return
	end

	UpdateMenu()
	inviteUI.Enabled = true
end):oneClick()

local function canSendGameInvite(p1)
	local ok, result = pcall(function()
		return socialService:CanSendGameInviteAsync(p1)
	end)

	return ok and result
end

inviteMenu.Invite.MouseButton1Click:Connect(function()
	audioService.PlaySound("click1")

	local v36 = LocalPlayer

	local ok, result = pcall(function()
		return socialService:CanSendGameInviteAsync(v36)
	end)

	if ok and result then
		socialService:PromptGameInvite(LocalPlayer)
	end
end)
inviteMenu.Invite.MouseEnter:Connect(function()
	audioService.PlaySound("click2")
end)

return {}
