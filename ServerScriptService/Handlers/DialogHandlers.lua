local DialogHandlers = {}

-- "act1_Guest 1800" -> "Guest 1800"
local function prettyName(duelist)
	local name = tostring(duelist)
	name = name:gsub("^act%d+_", "")
	return name
end

local function buildDialog(duelist)
	local owner = prettyName(duelist)
	return {
		Owner = owner,
		Start = {
			Text = "Want to duel?",
			Question = {
				{ Text = "Duel!", Destination = "StartFight", StartFight = true },
				{ Text = "Not now" },
			},
		},
		-- Closing this node is what makes the client send RequestBattle.
		StartFight = {
			Text = "Let's go!",
			EndPoint = true,
		},
	}
end

-- Bouncer: no dialogue, straight to one button per battle mode.
-- The buttons call BouncerBattle / BouncerDismiss, which live in NPCFuncs.
local function buildBouncerDialog(duelist)
	return {
		Owner = prettyName(duelist),
		Start = {
			Text = "",
			DontOpenHandy = true,
			Question = {
				{ Text = "Duel!", Destination = "Start", StartFight = true, NPCFunc = { "BouncerBattle", "Normal" } },
				{ Text = "Test Mode", Destination = "Start", StartFight = true, NPCFunc = { "BouncerBattle", "Test" } },
				{ Text = "Not now", Destination = "Start", NPCFunc = { "BouncerDismiss" } },
			},
		},
	}
end

function DialogHandlers.Init(Network, PlayerData)
	Network.OnInvoke("GetBotChallengeMessage", function(player, duelist)
		if type(duelist) ~= "string" or duelist == "" then
			return buildDialog("Opponent")
		end
		if duelist:match("^Bouncer") then
			return buildBouncerDialog(duelist)
		end
		return buildDialog(duelist)
	end)

	Network.OnInvoke("CheckForQuestDataRequirement", function()
		return true
	end)
end

return DialogHandlers
