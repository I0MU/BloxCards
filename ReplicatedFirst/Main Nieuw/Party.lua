





local players: Players = game:GetService("Players")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local animation = require(replicatedStorage.Animation)
local playSound = require(replicatedStorage.AudioService).PlaySound
local handy = require(script.Parent.Handy)
local handyHandy = handy.handy
local network = require(script.Parent.Network)
local networkClient = network.client
local networkFireServer = network.FireServer
local handyHandyParty = handyHandy.Party
local inviteTemplate = handyHandyParty.Templates.InviteTemplate
local playerTemplate = handyHandyParty.Templates.PlayerTemplate
local handyHandyPartyInviteHolder = handyHandyParty.InviteHolder
local handyHandyPartyPartyHolder = handyHandyParty.PartyHolder
local playerHolder = handyHandyParty.Invite.PlayerHolder
local u16 = nil
local u17: boolean = false
local u18: boolean = false

local function PlayerAdded(player)
	if player == game.Players.LocalPlayer then
		return
	end

	if playerHolder:FindFirstChild(player.Name) then
		return
	end

	local clone = playerTemplate:Clone()

	clone.Name = player.Name
	clone.TextLabel.Text = player.Name

	local v23, v24 = players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

	clone.ImageLabel.Image = v24 and v23 or ""
	clone.MouseButton1Click:Connect(function()
		if not handy.Visible() then
			return
		end

		networkFireServer("PartyInvitePlayer", player.Name)
	end)
	clone.Parent = playerHolder
	clone.Visible = true
end
local function updatePartyHolder(player, player2)
	local userId = player.UserId
	local headShot = Enum.ThumbnailType.HeadShot
	local size420x420 = Enum.ThumbnailSize.Size420x420

	task.spawn(function()
		local v47, v48 = players:GetUserThumbnailAsync(userId, headShot, size420x420)

		handyHandyPartyPartyHolder.Leader.Image = v48 and v47 or ""
	end)
	u17 = player ~= game.Players.LocalPlayer

	if player2 then
		u16 = player2

		for _, v in pairs(handyHandyPartyInviteHolder:GetChildren()) do
			if v:IsA("GuiObject") then
				v:Destroy()
			end
		end

		local playerUserId = player2.UserId
		local v33 = Enum.ThumbnailType.HeadShot
		local v34 = Enum.ThumbnailSize.Size420x420

		task.spawn(function()
			local v49, v50 = players:GetUserThumbnailAsync(playerUserId, v33, v34)

			handyHandyPartyPartyHolder.Sub.Image = v50 and v49 or ""
		end)
		handyHandyPartyPartyHolder.Sub.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		handyHandyParty.Leave.Visible = true
		handyHandyParty.Invite.Visible = false
		playSound("chat enter")

		local animationAnimateAsync = animation.AnimateAsync
		local handyHandyPartyTopBar = handyHandyParty.TopBar
		local color3 = Color3.fromRGB(90, 177, 118)

		animationAnimateAsync(handyHandyPartyTopBar, { BackgroundColor3 = color3 }, 1, "Out", "Quart")

		return
	end

	u16 = nil
	handyHandyPartyPartyHolder.Sub.Image = "rbxassetid://12072054746"
	handyHandyPartyPartyHolder.Sub.BackgroundColor3 = Color3.fromRGB(78, 88, 97)
	handyHandyParty.Leave.Visible = false

	local animateAsync = animation.AnimateAsync
	local topBar = handyHandyParty.TopBar
	local color3 = Color3.fromRGB(40, 49, 59)

	animateAsync(topBar, { BackgroundColor3 = color3 }, 1, "Out", "Quart")
end
function networkClient.UpdateLockIcon(p5)
	if p5 then
		handyHandyParty.TopBar.Lock.Image = "rbxassetid://12060512624"
		playSound("Locked")
		task.spawn(function()
			networkClient.Alert("Opening invites from friends only.")
		end)

		return
	end

	handyHandyParty.TopBar.Lock.Image = "rbxassetid://15691145068"
	playSound("Door_unlock")
	task.spawn(function()
		networkClient.Alert("Opening invites from everyone.")
	end)
end

networkClient.UpdatePartyHolder = updatePartyHolder

function networkClient.PartyRecieveInvite(p6)
	local clone = inviteTemplate:Clone()

	clone.TextLabel.Text = "Invite from: " .. p6.Name
	clone.Accept.MouseButton1Click:Connect(function()
		task.spawn(function()
			u18 = true
			task.wait(0.5)
			u18 = false
		end)
		networkFireServer("PartyAcceptInvite", p6)
		clone:Destroy()
	end)
	clone.Decline.MouseButton1Click:Connect(function()
		networkFireServer("PartyDeclineInvite", p6)
		clone:Destroy()
	end)
	clone.Parent = handyHandyPartyInviteHolder
	clone.Visible = true
end
function networkClient.IsSubPlayer()
	return u18 or u17
end

handyHandyParty.TopBar.Lock.MouseButton1Click:Connect(function()
	networkFireServer("PartyChangeAccess")
end)
players.PlayerAdded:Connect(PlayerAdded)
players.PlayerRemoving:Connect(function(player: Player)
	if not playerHolder:FindFirstChild(player.Name) then
		return
	end

	playerHolder[player.Name]:Destroy()
end)
handyHandyPartyPartyHolder.Sub.MouseButton1Click:Connect(function()
	if u16 then
		return
	end

	handyHandyParty.Invite.Visible = true
end)
handyHandyParty.Invite.TopBar.Close.MouseButton1Click:Connect(function()
	handyHandyParty.Invite.Visible = false
end)
handyHandyParty.Leave.MouseButton1Click:Connect(function()
	networkFireServer("PartyLeave")
end)
task.spawn(function()
	handyHandyParty.Invite.TopBar.TextLabel.Text = "Invite (loading...)"

	for _, v in pairs(players:GetPlayers()) do
		PlayerAdded(v)
	end

	handyHandyParty.Invite.TopBar.TextLabel.Text = "Invite"
end)
updatePartyHolder(game.Players.LocalPlayer)
networkFireServer("PartyLoaded")
print("Finished loading " .. script.Name)

return {}
