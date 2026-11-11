



local module: {[any]: any} = {}
local color3 = Color3.fromRGB(106, 46, 46)
local color32 = Color3.fromRGB(58, 70, 120)
local color33 = Color3.fromRGB(65, 120, 62)
local color34 = Color3.fromRGB(204, 192, 121)
local color35 = Color3.fromRGB(204, 204, 204)

for k, v in pairs({
	["Imperium Ultima"] = {
		Letter = "R",
		Order = 1,
		Color = color3,
		Cards = {
			"The Purifier",
			"Impossible Standards",
			"Burn Impurities",
			"Kilnkin Outfitter",
			"The Architect's Workshop",
			"The Epic Katana"
		}
	},
	Kralosa = {
		Letter = "B",
		Order = 2,
		Color = color32,
		Cards = {
			"The Auteur",
			"Cultural Exchange",
			"Prince's Treaty",
			"Descend Down Kralosa",
			"His Masterpiece",
			"Into Forms Unrecognisable"
		}
	},
	Disregard = {
		Letter = "G",
		Order = 3,
		Color = color33,
		Cards = {
			"The Sacrifice",
			"Culture Shock",
			"Domain Renovation",
			"Lifeless Rebirth",
			"Stairway to Heaven",
			"Crisis of Faith"
		}
	},
	["Justice City"] = {
		Letter = "Y",
		Order = 4,
		Color = color34,
		Cards = {
			"The Tainted",
			"Ultra Justice Strike!",
			"Emotion Explosion",
			"Invented Evil",
			"Gattai!",
			"Transcendental Hug"
		}
	},
	["Act 1"] = {
		Letter = "N",
		Order = 5,
		Color = color35,
		Cards = { "Systems Collapse" }
	}
}) do
	for k2, iterValue in pairs(v.Cards) do
		module["DS_" .. v.Letter .. "_" .. k2] = {
			LayoutOrder = v.Order * 100 + k2,
			Title = iterValue,
			Subtitle = if k2 == 1 and not (k == "Act 1") then k .. ": Prologue" else if k2 == 6 or k == "Act 1" then k .. ": Finale" else k .. ": Part " .. k2,
			Color = v.Color,
			Card = iterValue
		}
	end
end

return module
