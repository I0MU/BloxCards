



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local runService: RunService = game:GetService("RunService")
local serverInfoEvent: Instance = replicatedStorage:WaitForChild("ServerInfoEvent")

game:GetService("HttpService")

local serverInfoFrame: Instance = script.Parent:WaitForChild("ServerInfoFrame")
local time: Instance = serverInfoFrame:WaitForChild("Time")
local gameVersion: Instance = serverInfoFrame:WaitForChild("GameVersion")
local serverRegion: Instance = serverInfoFrame:WaitForChild("ServerRegion")

gameVersion.Text = "Version: " .. tostring(game.PlaceVersion)
gameVersion.TextScaled = true
serverInfoFrame.Visible = true

local ServerStartTime = nil

local function formatTime(p1)
	local floored = math.floor(p1 / 3600)
	local floored2 = math.floor(p1 % 3600 / 60)

	return string.format("%d:%02d:%02d", floored, floored2, p1 % 60)
end

if runService:IsStudio() then
	local v10: number = workspace:GetServerTimeNow()

	ServerStartTime = math.floor(v10) - 123
else
	serverInfoEvent.OnClientEvent:Connect(function(p2)
		ServerStartTime = p2.ServerStartTime

		local text: string = tostring(p2.ServerRegion)
		local text2: string = tostring(p2.ServerCountry)

		serverRegion.Text = "Region:" .. text .. "," .. text2
		serverRegion.TextScaled = true
	end)
end

task.spawn(function()
	local v17
	local floored
	local v19
	local floored3
	local floored4
	local formattedText

	while true do
		if ServerStartTime then
			v17 = workspace:GetServerTimeNow()
			floored = math.floor(v17 - ServerStartTime)
			v19 = time
			floored3 = math.floor(floored / 3600)
			floored4 = math.floor(floored % 3600 / 60)
			formattedText = string.format("%d:%02d:%02d", floored3, floored4, floored % 60)
			v19.Text = formattedText
			time.TextScaled = true
		end

		task.wait(1)

		continue
	end
end)
