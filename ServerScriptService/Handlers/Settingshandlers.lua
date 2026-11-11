--[[ ServerScriptService/Handlers/SettingsHandlers  (ModuleScript)
Settings + the cosmetic "equip" calls (sleeve, battle background) + new-card flags.
]]
local Config = require(script.Parent.Parent.Modules.Config)

local SettingsHandlers = {}

function SettingsHandlers.Init(Network, PlayerData)
	Network.OnFire("SetSettingsData", function(player, name, value)
		local d = PlayerData.Get(player)
		local kind = type(name) == "string" and Config.SETTING_TYPES[name]
		if not d or not kind then
			return
		end
		if kind == "slider" then
			if type(value) ~= "number" or value ~= value then
				return
			end
			d.settings[name] = math.clamp(value, 0, 100)
		else
			if type(value) ~= "boolean" then
				return
			end
			d.settings[name] = value
		end
		PlayerData.MarkDirty(player)
	end)

	-- Equip a sleeve the player owns
	Network.OnFire("SetSleeve", function(player, name)
		local d = PlayerData.Get(player)
		if d and type(name) == "string" and table.find(d.sleeves, name) then
			d.sleeve = name
			PlayerData.MarkDirty(player)
		end
	end)

	-- Equip a battle background the player owns
	Network.OnFire("SetBackground", function(player, name)
		local d = PlayerData.Get(player)
		if d and type(name) == "string" and table.find(d.backgrounds, name) then
			d.background = name
			PlayerData.MarkDirty(player)
		end
	end)

	-- Client hovered a "NEW" card; clear its flag
	Network.OnFire("SawNewCard", function(player, card)
		local d = PlayerData.Get(player)
		if d and type(card) == "string" and d.newCards[card] then
			d.newCards[card] = nil
			PlayerData.MarkDirty(player)
		end
	end)
end

return SettingsHandlers