



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local deferred = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("Deferred")

local function WaitForChild(p1, p2, p3)
	assert(p1 ~= nil, "Parent is nil")

	local typeName: string = type(p2)

	assert(typeName == "string", "Name is not a string.")

	local foundChild = p1:FindFirstChild(p2)
	local timestamp = tick()
	local u11: boolean = false

	while not foundChild do
		wait(0)
		foundChild = p1:FindFirstChild(p2)

		if not u11 and timestamp + (p3 or 5) <= tick() then
			u11 = true

			local v12 = p1:GetFullName()

			warn("[WaitForChild] - Infinite yield possible for WaitForChild(" .. v12 .. ", " .. p2 .. ")")

			if p3 then
				return p1:FindFirstChild(p2)
			end
		end
	end

	return foundChild
end
local function YieldPromiseChild(p4, p5, p6)
	local v16 = deferred.new()

	spawn(function()
		while v16.state == 0 do
			local foundChild = p4:FindFirstChild(p5)

			if foundChild then
				v16:resolve(foundChild)
			end

			wait(0.05)
		end
	end)
	delay(p6, function()
		v16:reject("[PromiseBoat] - Timed out on yield for child.")
	end)

	return v16
end

return function(p7, p8, p9)
	assert(p7 ~= nil, "Parent is nil")

	local typeName: string = type(p8)

	assert(typeName == "string", "Name is not a string.")
	assert(p9, "TimeOut is nil")

	local foundChild = p7:FindFirstChild(p8)

	if foundChild then
		local v22 = deferred.new()

		v22:resolve(foundChild)

		return v22
	end

	return (YieldPromiseChild(p7, p8, p9))
end
