



local lighting: Lighting = game:GetService("Lighting")
local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v3 = replicatedStorage("qGUI")
local v4 = replicatedStorage("qMath")
local u5 = nil

local function TweenTimeOfDay(p1, p2, p3)
	u5 += 1

	local v13 = u5

	spawn(function()
		lighting.TimeOfDay = p2

		local v27: number = lighting:GetMinutesAfterMidnight()

		lighting.TimeOfDay = p1

		local v28: number = lighting:GetMinutesAfterMidnight()
		local timestamp = tick()

		while v13 == u5 do
			local timestamp2 = tick()

			if timestamp + p3 <= timestamp2 then
				lighting:SetMinutesAfterMidnight(v27)
				u5 += 1
			else
				local timestamp3 = tick()

				lighting:SetMinutesAfterMidnight(v4.LerpNumber(v28, v27, (timestamp3 - timestamp) / p3))
			end

			wait()
		end

		if v13 == u5 then
			lighting.TimeOfDay = p2
		end
	end)
end

local t1: {[any]: any} = {
	FogColor = true,
	Ambient = true,
	ColorShift_Bottom = true,
	ColorShift_Top = true,
	OutdoorAmbient = true,
	ShadowColor = true
}
local t2: {[any]: any} = { Outlines = true, GlobalShadows = true }
local t3: {[any]: any} = { FogEnd = true, FogStart = true, Brightness = true }

return {
	TweenProperties = function(p4, p5)
		local v16 = p5 or 0
		local t4: {[any]: any} = {}
		local u18: boolean = false
		local t5: {[any]: any} = {}
		local u20: boolean = false

		for k, v in pairs(p4) do
			if t1[k] then
				t4[k] = v
				u18 = true
			elseif t3[k] then
				t5[k] = v
				u20 = true
			elseif t2[k] then
				lighting[k] = v
			elseif k == "TimeOfDay" then
				TweenTimeOfDay(lighting.TimeOfDay, v, v16)
			else
				error("No property with the value " .. k .. " that is tweenable")
			end
		end

		if u18 and v16 > 0 then
			v3.TweenColor3(lighting, t4, v16, true)
		else
			for k, v in pairs(t4) do
				lighting[k] = v
			end
		end

		if u20 and v16 > 0 then
			v3.TweenTransparency(lighting, t5, v16, true)

			return
		end

		for k, v in pairs(t5) do
			lighting[k] = v
		end
	end
}
