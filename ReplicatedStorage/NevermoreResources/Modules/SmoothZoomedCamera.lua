



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local v4 = replicatedStorage("qMath")
local v5 = replicatedStorage("SpringPhysics")
local clampNumber = v4.ClampNumber
local module: {[any]: any} = { ClassName = "SmoothZoomedCamera", _MaxZoom = 100, _MinZoom = 0.5 }

function module.new()
	local object = setmetatable({}, module)

	object.Spring = v5.NumberSpring.New()
	object.Speed = 15

	return object
end
function module.ZoomIn(p1, p2, p3, p4)
	if not p3 and not p4 then
		p1.Zoom = p1.Zoom - p2

		return
	end

	local zoom = p1.Zoom
	local v14 = clampNumber(p2, p3 or -math.huge, p4 or math.huge)

	p1.Zoom = zoom - v14
end
function module.Impulse(p5, p6)
	p5.Spring:Impulse(p6)
end
function module.__add(p7, p8)
	return v3.new(p7, p8)
end
function module.__newindex(p9, p10, p11)
	if p10 == "TargetZoom" or p10 == "Target" then
		local v22 = clampNumber(p11, p9.MinZoom, p9.MaxZoom)

		p9.Spring.Target = v22

		if p11 > v22 then
			p9:Impulse(p9.MaxZoom)

			return
		end

		if p11 < v22 then
			p9:Impulse(-p9.MinZoom)

			return
		end
	else
		if p10 == "Damper" then
			p9.Spring.Damper = p11

			return
		end

		if p10 == "Value" or p10 == "Zoom" then
			p9.Spring.Value = clampNumber(p11, p9.MinZoom, p9.MaxZoom)

			return
		end

		if p10 == "Speed" then
			p9.Spring.Speed = p11

			return
		end

		if p10 == "MaxZoom" then
			assert(p11 > p9.MinZoom, "MaxZoom can't be less than MinZoom")
			p9._MaxZoom = p11
			p9.Zoom = p9.Zoom

			return
		end

		if p10 == "MinZoom" then
			assert(p11 < p9.MaxZoom, "MinZoom can't be greater than MinZoom")
			p9._MinZoom = p11
			p9.Zoom = p9.Zoom

			return
		end

		rawset(p9, p10, p11)
	end
end
function module.__index(p12, p13)
	if p13 == "State" or p13 == "CameraState" or p13 == "Camera" then
		local v25 = v2.new()

		v25.qPosition = Vector3.new(0, 0, p12.Zoom)

		return v25
	end

	if p13 == "Zoom" or p13 == "Value" then
		return p12.Spring.Value
	end

	if p13 == "MaxZoom" then
		return p12._MaxZoom
	end

	if p13 == "MinZoom" then
		return p12._MinZoom
	end

	if p13 == "Damper" then
		return p12.Spring.Damper
	end

	if p13 == "Speed" then
		return p12.Spring.Speed
	end

	if p13 == "Target" or p13 == "TargetZoom" then
		return p12.Spring.Target
	end

	if p13 == "Velocity" then
		return p12.Spring.Velocity
	end

	if p13 == "HasReachedTarget" then
		local u26: boolean = false

		if math.abs(p12.Value - p12.Target) < 0.0001 then
			u26 = math.abs(p12.Velocity) < 0.0001
		end

		return u26
	end

	return module[p13]
end

return module
