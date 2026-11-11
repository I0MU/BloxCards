



local players: Players = game:GetService("Players")

local function RoundNumber(p1, p2)
	local v8 = p2 or 1

	return math.floor(p1 / v8 + 0.5) * v8
end
local function Modify(parent, p4)
	local typeName: string = type(p4)

	assert(typeName == "table", "Values is not a table")

	for k, v in pairs(p4) do
		if type(k) == "number" then
			v.Parent = parent
		else
			parent[k] = v
		end
	end

	return parent
end
local function CallOnChildren(p10, p11)
	p11(p10)

	local v16, v17 = p10:GetChildren()

	for iterKey, iterValue in next, v16, v17 do
		CallOnChildren(iterValue, p11)
	end
end
local function GetCharacter(p15)
	local v21 = p15
	local v22: Player = players:GetPlayerFromCharacter(v21)

	while not v22 do
		if not v21.Parent then
			return nil
		end

		v21 = v21.Parent
		v22 = players:GetPlayerFromCharacter(v21)
	end

	return v21, v22
end

return {
	RoundNumber = RoundNumber,
	Round = RoundNumber,
	Modify = Modify,
	Make = function(className, p6)
		local v25 = Instance.new(className)

		return (Modify(v25, p6))
	end,
	WaitForChild = function(p7, p8, p9)
		assert(p7, "Parent is nil")

		local typeName: string = type(p8)

		assert(typeName == "string", "Name is not a string.")

		local foundChild = p7:FindFirstChild(p8)
		local timestamp = tick()
		local u32: boolean = false

		while not foundChild do
			wait()
			foundChild = p7:FindFirstChild(p8)

			if not u32 and timestamp + (p9 or 5) <= tick() then
				u32 = true

				local v33 = p7:GetFullName()
				local v34 = debug.traceback()

				warn("[WaitForChild] - Infinite yield possible for WaitForChild(" .. v33 .. ", " .. p8 .. ")\n" .. v34)

				if p9 then
					return p7:FindFirstChild(p8)
				end
			end
		end

		return foundChild
	end,
	CallOnChildren = CallOnChildren,
	GetNearestParent = function(p12, p13)
		local v37 = p12

		while true do
			v37 = v37.Parent

			if v37 == nil then
				break
			end

			if v37:IsA(p13) then
				return v37
			end
		end

		return nil
	end,
	GetHumanoid = function(p14)
		while true do
			while true do
				local humanoid = p14:FindFirstChild("Humanoid")

				if not humanoid then
					break
				end

				if humanoid:IsA("Humanoid") then
					return humanoid
				end

				for _, v in pairs(p14:GetChildren()) do
					if v.Name == "Humanoid" and v:IsA("Humanoid") then
						return v
					end
				end
			end

			if not p14.Parent or not p14:IsDescendantOf(workspace) then
				return nil
			end

			p14 = p14.Parent

			continue
		end
	end,
	GetCharacter = GetCharacter,
	GetPlayerFromCharacter = GetCharacter,
	CheckPlayer = function(p16)
		return p16 and p16:IsA("Player") and p16:IsDescendantOf(players)
	end,
	CheckCharacter = function(player)
		if player and player:IsA("Player") and player:IsDescendantOf(players) then
			local Character = player.Character

			if Character then
				return Character.Parent and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Torso") and Character:FindFirstChild("Head") and Character.Humanoid:IsA("Humanoid") and Character.Head:IsA("BasePart") and Character.Torso:IsA("BasePart") and true
			end
		else
			warn("[CheckCharacter] - Character Check failed!")
		end

		return nil
	end,
	GetIndexByValue = function(p18, p19)
		for k, v in pairs(p18) do
			if p19 == v then
				return k
			end
		end

		return nil
	end,
	Class = function(p20, p21)
		if p21 then
			return function(...)
				local t1: {[any]: any} = {}

				setmetatable(t1, p21)

				return t1, unpack({ p20(t1, ...) })
			end
		end

		return function(...)
			local t2: {[any]: any} = {}

			return t2, unpack({ p20(t2, ...) })
		end
	end,
	Sign = function(p22)
		if p22 == 0 then
			return 0
		end

		if p22 > 0 then
			return 1
		end

		return -1
	end
}
