



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
replicatedStorage("CameraState")

local v2 = replicatedStorage("SpringPhysics")

replicatedStorage("SummedCamera")

local module: {[any]: any} = { ClassName = "FadingCamera" }

function module.new(p1)
	local object = setmetatable({}, module)

	object.Spring = v2.NumberSpring.New()
	object.Camera = p1 or error("No camera")
	object.Damper = 1
	object.Speed = 15

	return object
end
function module.__newindex(p2, p3, value)
	if p3 == "Damper" then
		p2.Spring.Damper = value

		return
	end

	if p3 == "Value" then
		p2.Spring.Value = value

		return
	end

	if p3 == "Speed" then
		p2.Spring.Speed = value

		return
	end

	if p3 == "Target" then
		p2.Spring.Target = value

		return
	end

	if p3 == "Spring" or p3 == "Camera" then
		rawset(p2, p3, value)

		return
	end

	error(p3 .. " is not a valid member of fading camera")
end
function module.__index(p5, p6)
	if p6 == "State" or p6 == "CameraState" or p6 == "Camera" then
		return (p5.Camera.CameraState or p5.Camera) * p5.Spring.Value
	end

	if p6 == "Damper" then
		return p5.Spring.Damper
	end

	if p6 == "Value" then
		return p5.Spring.Value
	end

	if p6 == "Speed" then
		return p5.Spring.Speed
	end

	if p6 == "Target" then
		return p5.Spring.Target
	end

	if p6 == "Velocity" then
		return p5.Spring.Velocity
	end

	if p6 == "HasReachedTarget" then
		local u11: boolean = false

		if math.abs(p5.Value - p5.Target) < 0.0001 then
			u11 = math.abs(p5.Velocity) < 0.0001
		end

		return u11
	end

	return module[p6]
end

return module
