



local runService: RunService = game:GetService("RunService")

print("Utils")

local mathMax = math.max
local mathMin = math.min

local function AddZIndexHealthPower(p8, zIndex)
	p8.ZIndex = zIndex

	for _, v in pairs(p8:GetChildren()) do
		if v:IsA("GuiObject") then
			AddZIndexHealthPower(v, zIndex - 1)
		end
	end
end
local function SetZIndex(p10, zIndex)
	for _, v in pairs(p10:GetChildren()) do
		if not v:IsA("GuiObject") then
			if v:IsA("Folder") then
				for _, iterValue in pairs(v:GetChildren()) do
					SetZIndex(iterValue, zIndex)
				end
			end
		elseif v.Name == "Health" or v.Name == "Power" then
			AddZIndexHealthPower(v, zIndex + 10)
		else
			SetZIndex(v, v.ZIndex - p10.ZIndex + zIndex)
		end
	end

	p10.ZIndex = zIndex
end

local copyTable = require(game.ReplicatedStorage.CopyTable)

return {
	Plural = function(p1)
		return math.abs(p1) ~= 1
	end,
	Clamp = function(p2, p3, p4)
		local v21 = mathMin(p3, p4)

		return (mathMax(p2, v21))
	end,
	Lerp = function(p5, p6, p7)
		return p5 * (1 - p7) + p6 * p7
	end,
	SetZIndex = SetZIndex,
	CopyTable = copyTable,
	New = function(className)
		local v26 = Instance.new(className)

		return function(p13)
			for k, v in pairs(p13) do
				v26[k] = v
			end

			return v26
		end
	end,
	FormatNumber = function(p14: number)
		if not p14 then
			warn("Utils.FormatNumber: called without number")
			p14 = 0
		end

		local v28, v29, v30 = string.match(p14, "^([^%d]*%d)(%d*)(.-)$")
		local v31 = v29:reverse():gsub("(%d%d%d)", "%1,"):reverse()

		return v28 .. v31
	end,
	IsPBE = function()
		return runService:IsStudio() or game.PlaceId == 7105900056
	end
}
