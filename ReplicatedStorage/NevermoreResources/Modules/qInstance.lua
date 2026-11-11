



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local callOnChildren = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qSystems").CallOnChildren

local function GetBricks(p1)
	local t1: {[any]: any} = {}

	callOnChildren(p1, function(p2)
		if p2:IsA("BasePart") then
			t1[#t1 + 1] = p2
		end
	end)

	return t1
end
local function GetBricksWithIgnore(p5, p6)
	local t2: {[any]: any} = {}

	callOnChildren(p5, function(p7)
		if p7:IsA("BasePart") and p7 ~= p6 then
			t2[#t2 + 1] = p7
		end
	end)

	return t2
end
local function GetBricksWithIgnoreFunction(p8, p9)
	local t3: {[any]: any} = {}

	callOnChildren(p8, function(p10)
		if p10:IsA("BasePart") and not p9(p10) then
			t3[#t3 + 1] = p10
		end
	end)

	return t3
end
local function GetPartVolume(p11, p12)
	local v17 = p11.Size

	if not p11:IsA("Part") and not p12 then
		if p11:IsA("WedgePart") then
			return v17.X * v17.Y * v17.Z / 2
		end

		if p11:IsA("CornerWedgePart") then
			return v17.X * v17.Y * v17.Z / 3
		end

		error("[GetPartVolume] - Not a part")

		return
	end

	return v17.X * v17.Y * v17.Z
end

return {
	GetBricks = GetBricks,
	get_bricks = GetBricks,
	getBricks = GetBricks,
	GetSeats = function(p3)
		local t4: {[any]: any} = {}

		callOnChildren(p3, function(p4)
			if p4:IsA("Seat") or p4:IsA("VehicleSeat") then
				t4[#t4 + 1] = p4
			end
		end)

		return t4
	end,
	GetBricksWithIgnore = GetBricksWithIgnore,
	getBricksWithIgnore = GetBricksWithIgnore,
	GetBricksWithIgnoreFunction = GetBricksWithIgnoreFunction,
	getBricksWithIgnoreFunction = GetBricksWithIgnoreFunction,
	GetPartVolume = GetPartVolume,
	getPartVolume = GetPartVolume,
	get_part_volume = GetPartVolume
}
