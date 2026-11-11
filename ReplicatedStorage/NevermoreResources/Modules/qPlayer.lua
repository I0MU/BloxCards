



local players: Players = game:GetService("Players")
local teams: Teams = game:GetService("Teams")
local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v4 = replicatedStorage("qSystems")
local v5 = replicatedStorage("qCFrame")
local checkCharacter = v4.CheckCharacter
local getCharacter = v4.GetCharacter

local function IsTeamMate(player, player2, p3)
	if player == player2 then
		return false
	end

	if player.Neutral ~= player2.Neutral then
		return false
	end

	if player.Neutral then
		return if p3 == nil then true else p3
	end

	return player.TeamColor.Name == player2.TeamColor.Name
end
local function GetTeamFromColorName(p4)
	for _, v in pairs(teams:GetTeams()) do
		if p4 == v.TeamColor.Name then
			return v
		end
	end
end
local function GetTeamFromPlayer(player)
	if player.Neutral then
		return nil
	end

	return GetTeamFromColorName(player.TeamColor.Name)
end
local function GetPlayerFromName(p6)
	local lowerText = p6:lower()
	local lowerText2: Instance = players:FindFirstChild(lowerText)

	if lowerText2 and lowerText2:IsA("Player") then
		return lowerText2
	end

	for _, v in pairs(players:GetPlayers()) do
		local lowerText3 = v.Name:lower()

		if lowerText == lowerText3 then
			return v
		end
	end
end
local function GetPlayersWithinRadius(p7, p8, p9)
	local t1: {[any]: any} = {}

	for _, v in pairs(p7) do
		if p9 >= (v.Character.Torso.Position - p8).magnitude then
			t1[#t1 + 1] = v
		end
	end

	return t1
end
local function GetPlayersWithinBlastRadius(p10, p11, p12, p13, p14, p15, p16)
	local typeName: string = type(p14)

	assert(typeName == "number")

	local t2: {[any]: any} = {}

	for _, v in pairs(p10) do
		local n1 = v.Character.Torso.Position - p11

		if p12 >= n1.magnitude then
			local ray = Ray.new(p11, n1.unit * p12)
			local v47, v48 = v5.AdvanceRaycast(ray, p13, p14, p15, if p16 == nil then true else p16)

			if v47:IsDescendantOf(v.Character) then
				t2[#t2 + 1] = v
			else
				print("Obstruction")
			end
		end
	end

	return t2
end
local function GetPlayersWithValidCharacters()
	local t3: {[any]: any} = {}

	for _, v in pairs(players:GetPlayers()) do
		if checkCharacter(v) then
			t3[#t3 + 1] = v
		end
	end

	return t3
end

return {
	IsTeamMate = IsTeamMate,
	isTeamMate = IsTeamMate,
	GetTeamFromColorName = GetTeamFromColorName,
	getTeamFromColorName = GetTeamFromColorName,
	GetTeamFromPlayer = GetTeamFromPlayer,
	GetTeamFromPlayer = GetTeamFromPlayer,
	GetPlayerFromName = GetPlayerFromName,
	getPlayerFromName = GetPlayerFromName,
	GetPlayersWithinRadius = GetPlayersWithinRadius,
	getPlayersWithinRadius = GetPlayersWithinRadius,
	GetPlayersWithinBlastRadius = GetPlayersWithinBlastRadius,
	getPlayersWithinBlastRadius = GetPlayersWithinBlastRadius,
	GetPlayersWithValidCharacters = GetPlayersWithValidCharacters,
	getPlayersWithValidCharacters = GetPlayersWithValidCharacters,
	GetPlayerWhoSatOnChair = function(p17)
		if not p17 or not p17.Parent or not p17.Parent or not p17:IsA("Weld") or p17.Name ~= "SeatWeld" then
			return
		end

		if p17.Part1 and p17.Part0 then
			local part1 = p17.Part1

			if part1:IsA("BasePart") then
				local v54, v55 = getCharacter(part1)

				if v54 and v55 and checkCharacter(v55) and v54.Humanoid.Health > 0 then
					return v55
				end

				return nil
			end

			warn("[GetPlayerWhoSatOnChair] - HumanoidRootPart was not a base part??!?")

			return nil
		end

		warn("[GetPlayerWhoSatOnChair] - Weld failed to have part1 or part0")

		return nil
	end,
	CheckIfPlayerStillSittingOnChair = function(p18, player)
		if p18:IsDescendantOf(game) and p18.Part1 and p18.Part0 and p18.Part0:IsDescendantOf(game) and p18.Part1:IsDescendantOf(game) then
			if player and player:IsDescendantOf(players) and checkCharacter(player) and player.Character.Humanoid.Health > 0 then
				local part1 = p18.Part1

				if part1:IsA("BasePart") and part1:IsDescendantOf(player.Character) then
					return true
				end

				return false
			end

			return false
		end

		return false
	end
}
