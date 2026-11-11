



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary

local v2 = replicatedStorage("CameraState")
local v3 = replicatedStorage("SummedCamera")
local clampNumber = replicatedStorage("qMath").ClampNumber
local module: {[any]: any} = {
	ClassName = "ZoomedCamera",
	_MaxZoom = 100,
	_MinZoom = 0.5,
	_Zoom = 10
}

function module.new()
	return (setmetatable({}, module))
end
function module.ZoomIn(p1, p2, p3, p4)
	if not p3 and not p4 then
		p1.Zoom = p1.Zoom - p2

		return
	end

	local zoom = p1.Zoom
	local v11 = clampNumber(p2, p3 or -math.huge, p4 or math.huge)

	p1.Zoom = zoom - v11
end
function module.__add(p5, p6)
	return v3.new(p5, p6)
end
function module.__newindex(p7, p8, p9)
	if p8 == "Zoom" or p8 == "TargetZoom" then
		p7._Zoom = clampNumber(p9, p7.MinZoom, p7.MaxZoom)

		return
	end

	if p8 == "MaxZoom" then
		assert(p9 > p7.MinZoom, "MaxZoom can't be less than MinZoom")
		p7._MaxZoom = p9
		p7.Zoom = p7.Zoom

		return
	end

	if p8 == "MinZoom" then
		assert(p9 < p7.MaxZoom, "MinZoom can't be greater than MinZoom")
		p7._MinZoom = p9
		p7.Zoom = p7.Zoom

		return
	end

	rawset(p7, p8, p9)
end
function module.__index(p10, p11)
	if p11 == "State" or p11 == "CameraState" or p11 == "Camera" then
		local v19 = v2.new()

		v19.qPosition = Vector3.new(0, 0, p10.Zoom)

		return v19
	end

	if p11 == "Zoom" or p11 == "TargetZoom" then
		return p10._Zoom
	end

	if p11 == "MaxZoom" then
		return p10._MaxZoom
	end

	if p11 == "MinZoom" then
		return p10._MinZoom
	end

	return module[p11]
end

return module
