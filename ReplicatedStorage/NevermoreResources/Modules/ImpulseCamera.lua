



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SpringPhysics")
local v4 = replicatedStorage("SummedCamera")
local module: {[any]: any} = { ClassName = "ImpulseCamera" }

function module.new()
	local object = setmetatable({}, module)

	object.Spring = v3.VectorSpring.New()
	object.Damper = 0.5
	object.Speed = 20

	return object
end
function module.__newindex(p1, p2, p3)
	if p2 == "Damper" then
		p1.Spring.Damper = p3

		return
	end

	if p2 == "Speed" then
		p1.Spring.Speed = p3

		return
	end

	if p2 == "Spring" then
		rawset(p1, p2, p3)

		return
	end

	error(p2 .. " is not a valid member of impulse camera")
end
function module.Impulse(p4, p5)
	p4.Spring:Impulse(p5)
end
function module.__add(p6, p7)
	return v4.new(p6, p7)
end
function module.__index(p8, p9)
	if p9 == "State" or p9 == "CameraState" or p9 == "Camera" then
		local v16 = v2.new()
		local SpringValue = p8.Spring.Value
		local v18 = CFrame.Angles(0, SpringValue.y, 0)
		local v19 = CFrame.Angles(SpringValue.x, 0, 0)
		local v20 = CFrame.Angles(0, 0, SpringValue.z)

		v16.CoordinateFrame = v18 * v19 * v20

		return v16
	end

	if p9 == "Damper" then
		return p8.Spring.Damper
	end

	if p9 == "Speed" then
		return p8.Spring.Speed
	end

	return module[p9]
end

return module
