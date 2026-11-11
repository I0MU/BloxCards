



local mathCos = math.cos
local mathSin = math.sin
local mathSqrt = math.sqrt
local mathAtan2 = math.atan2
local mathMax = math.max

local function Qmul(list, list2)
	local v14 = list[1]
	local v15 = list[2]
	local v16 = list[3]
	local v17 = list[4]
	local v18 = list2[1]
	local v19 = list2[2]
	local v20 = list2[3]
	local v21 = list2[4]

	return {
		v14 * v18 - v15 * v19 - v16 * v20 - v17 * v21,
		v14 * v19 + v15 * v18 + v16 * v21 - v17 * v20,
		v14 * v20 - v15 * v21 + v16 * v18 + v17 * v19,
		v14 * v21 + v15 * v20 - v16 * v19 + v17 * v18
	}
end
local function Qinv(list)
	local v23 = list[1]
	local v24 = list[2]
	local v25 = list[3]
	local v26 = list[4]
	local n1 = v23 * v23 + v24 * v24 + v25 * v25 + v26 * v26

	if n1 > 0 then
		return { v23 / n1, -v24 / n1, -v25 / n1, -v26 / n1 }
	end

	return { 0, 0, 0, 0 }
end
local function Qpow(list, p5, p6)
	local v31 = list[1]
	local v32 = list[2]
	local v33 = list[3]
	local v34 = list[4]
	local n1 = v32 * v32 + v33 * v33 + v34 * v34

	if n1 > 0 then
		local v36 = mathSqrt(n1)
		local n2 = (v31 * v31 + n1) ^ (0.5 * p5)
		local v38 = mathAtan2(v36, v31)
		local n3 = p5 * (v38 + 6.283185307179586 * (p6 or 0))
		local v40 = mathSin(n3)
		local n4 = n2 * v40 / v36
		local v42 = mathCos(n3)

		return { n2 * v42, v32 * n4, v33 * n4, v34 * n4 }
	end

	if v31 < 0 then
		local n5 = (-v31) ^ p5
		local v44 = mathSin(3.141592653589793 * p5)
		local n6 = n5 * v44 * 1.7320508075688772 / 3

		v44 = mathCos(3.141592653589793 * p5)

		return { n5 * v44, n6, n6, n6 }
	end

	return { v31 ^ p5, 0, 0, 0 }
end
local function QuaternionFromCFrame(p7)
	local v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58 = p7:components()
	local n1 = v50 + v54 + v58

	if n1 > 0 then
		local v60 = mathSqrt(1 + n1)
		local n2 = 0.5 / v60

		return v60 * 0.5, (v57 - v55) * n2, (v52 - v56) * n2, (v53 - v51) * n2
	end

	local v62 = mathMax(v50, v54, v58)

	if v50 == v62 then
		local v63 = mathSqrt(1 + v50 - v54 - v58)
		local n3 = 0.5 / v63

		return (v57 - v55) * n3, v63 * 0.5, (v53 + v51) * n3, (v52 + v56) * n3
	end

	if v62 == v54 then
		local v65 = mathSqrt(1 - v50 + v54 - v58)
		local n4 = 0.5 / v65

		return (v52 - v56) * n4, (v53 + v51) * n4, v65 * 0.5, (v57 + v55) * n4
	end

	if v62 == v58 then
		local v67 = mathSqrt(1 - v50 - v54 + v58)
		local n5 = 0.5 / v67

		return (v53 - v51) * n5, (v52 + v56) * n5, (v57 + v55) * n5, v67 * 0.5
	end
end
local function QuaternionToCFrame(list)
	local v70 = list[1]
	local v71 = list[2]
	local v72 = list[3]
	local v73 = list[4]
	local n1 = v71 + v71
	local n2 = v72 + v72
	local n3 = v73 + v73
	local n4 = v70 * n1
	local n5 = v70 * n2
	local n6 = v70 * n3
	local n7 = v71 * n1
	local n8 = v71 * n2
	local n9 = v71 * n3
	local n10 = v72 * n2
	local n11 = v72 * n3
	local n12 = v73 * n3

	return 1 - (n10 + n12), n8 - n6, n9 + n5, n8 + n6, 1 - (n7 + n12), n11 - n4, n9 - n5, n11 + n4, 1 - (n7 + n10)
end

local module: {[any]: any} = { ClassName = "CameraState" }

function module.__index(p9, p10)
	if p10 == "CoordinateFrame" then
		return CFrame.new(p9.qPosition.x, p9.qPosition.y, p9.qPosition.z, QuaternionToCFrame(p9.qCoordinateFrame))
	end

	return module[p10]
end
function module.__newindex(p11, p12, p13)
	if p12 == "CoordinateFrame" then
		p11.qPosition = p13.p
		p11.qCoordinateFrame = { QuaternionFromCFrame(p13) }

		return
	end

	rawset(p11, p12, p13)
end

module.FieldOfView = 0
module.qCoordinateFrame = { QuaternionFromCFrame(CFrame.new()) }
module.qPosition = Vector3.new()

function module.new(p14)
	local object = setmetatable({}, module)

	if p14 then
		object.FieldOfView = p14.FieldOfView
		object.CoordinateFrame = p14.CoordinateFrame
	end

	return object
end
function module.__add(p15, p16)
	local v95 = module.new(p15)

	v95.FieldOfView = p15.FieldOfView + p16.FieldOfView
	v95.qPosition = v95.qPosition + p16.qPosition
	v95.qCoordinateFrame = Qmul(p15.qCoordinateFrame, p16.qCoordinateFrame)

	return v95
end
function module.__sub(p17, p18)
	local v98 = module.new(p17)

	v98.FieldOfView = p17.FieldOfView - p18.FieldOfView
	v98.qPosition = v98.qPosition - p18.qPosition

	local qCoordinateFrame = p17.qCoordinateFrame
	local v100 = Qinv(p18.qCoordinateFrame)

	v98.qCoordinateFrame = Qmul(qCoordinateFrame, v100)

	return v98
end
function module.__unm(p19)
	local v102 = module.new(p19)

	v102.FieldOfView = -p19.FieldOfView
	v102.qPosition = -p19.qPosition
	v102.qCoordinateFrame = Qinv(p19.qCoordinateFrame)

	return v102
end
function module.__mul(p20, p21)
	local v105 = module.new(p20)

	if type(p21) == "number" then
		v105.FieldOfView = p20.FieldOfView * p21
		v105.qCoordinateFrame = Qpow(p20.qCoordinateFrame, p21)
		v105.qPosition = p20.qPosition * p21

		return v105
	end

	error("Invalid other")

	return v105
end
function module.Set(p22, p23)
	local v108 = p23 or workspace.CurrentCamera

	v108.FieldOfView = p22.FieldOfView
	v108.CoordinateFrame = p22.CoordinateFrame
end

return module
