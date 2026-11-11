



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local make = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qSystems").Make

local function ParaD(p1, p2, p3)
	return ((p2 - p1).x * (p3 - p1).x + (p2 - p1).y * (p3 - p1).y + (p2 - p1).z * (p3 - p1).z) / (p1 - p2).magnitude
end
local function PerpD(p4, p5, p6)
	return (math.sqrt((p6 - p4).magnitude ^ 2 - (((p5 - p4).x * (p6 - p4).x + (p5 - p4).y * (p6 - p4).y + (p5 - p4).z * (p6 - p4).z) / (p4 - p5).magnitude) ^ 2))
end
local function MakeDefaultBrick(parent)
	return make("WedgePart", {
		FormFactor = "Custom",
		TopSurface = "Smooth",
		BottomSurface = "Smooth",
		Anchored = true,
		Size = Vector3.new(0.2, 7, 7),
		Name = "WedgePart",
		Parent = parent,
		CanCollide = false,
		make("SpecialMesh", { MeshType = "Wedge", Name = "Mesh" })
	})
end

local mathSqrt = math.sqrt
local cFrameNew = CFrame.new
local vector3New = Vector3.new
local dot = Vector3.new().Dot
local cross = Vector3.new().Cross
local vector3 = Vector3.new()

local function GetWedgeCFrames(p8, p9, p10, p11)
	local n1 = p8 - p9
	local n2 = p9 - p10
	local n3 = p10 - p8
	local v31 = n1.magnitude
	local magnitude = n2.magnitude
	local v33 = n3.magnitude

	if v31 < v33 and magnitude < v33 then
		local v34 = p10
		local v35 = p8

		p10 = p9
		p8 = v34
		p9 = v35
		v34 = n3
		v35 = n1
		n3 = n2
		n1 = v34
		n2 = v35
		v31 = v33
	elseif v31 < magnitude and magnitude > v33 then
		local v36 = p9

		p9 = p10
		p10 = p8
		p8 = v36
		v36 = n2
		n2 = n3
		n3 = n1
		n1 = v36
		v31 = magnitude
	end

	if p8 + p9 + p10 ~= vector3 then
		local n4 = -dot(n3, n1) / v31
		local n5 = p10 + n3 / -2
		local n6 = p9 + n2 / -2
		local n7 = -n1
		local v41 = cross(n7, n3)
		local v42 = v41.magnitude
		local n8 = v42 / v31
		local n9 = v41 / v42
		local unit = n7.unit
		local v46 = cross(unit, n9)
		local v47 = cFrameNew(n5.X, n5.Y, n5.Z, -n9.x, -v46.x, unit.x, -n9.Y, -v46.Y, unit.Y, -n9.Z, -v46.Z, unit.Z)
		local v48 = vector3New(p11, n8, n4)
		local v49 = cFrameNew(n6.X, n6.Y, n6.Z, n9.x, -v46.x, -unit.x, n9.Y, -v46.Y, -unit.Y, n9.Z, -v46.Z, -unit.Z)
		local v50 = vector3New(p11, n8, v31 - n4)

		return v47, v48, v49, v50
	end

	local v51 = cFrameNew(p8)
	local v52 = cFrameNew(p8)

	return v51, Vector3.new(0, 0, 0), v52, Vector3.new(0, 0, 0)
end
local function DrawTriangle(p12, p13, p14, p15, p16)
	local v58 = p12 or MakeDefaultBrick(workspace)
	local v59 = p13 or MakeDefaultBrick(workspace)
	local v60 = nil
	local v61 = nil
	local v62 = nil
	local magnitude = (p14 - p15).magnitude
	local v64 = (p15 - p16).magnitude
	local v65 = (p16 - p14).magnitude
	local v66 = math.max(magnitude, v64, v65)

	if magnitude == v66 then
		v60 = p14
		v61 = p15
		v62 = p16
	elseif v64 == v66 then
		v60 = p15
		v61 = p16
		v62 = p14
	elseif v65 == v66 then
		v60 = p16
		v61 = p14
		v62 = p15
	end

	local squareRoot = math.sqrt((v62 - v60).magnitude ^ 2 - (((v61 - v60).x * (v62 - v60).x + (v61 - v60).y * (v62 - v60).y + (v61 - v60).z * (v62 - v60).z) / (v60 - v61).magnitude) ^ 2)
	local n1 = ((v61 - v60).x * (v62 - v60).x + (v61 - v60).y * (v62 - v60).y + (v61 - v60).z * (v62 - v60).z) / (v60 - v61).magnitude
	local n2 = (v60 - v61).magnitude - n1

	if squareRoot == 0 then
		print("[Triangle] - Impossible triangle, rendering has half failed.")
		v58.Mesh.Scale = Vector3.new(0, 0, 0)
		v59.Mesh.Scale = Vector3.new(0, 0, 0)
		v58.Size = Vector3.new(0.2, 0.2, (v61 - v60).magnitude)
		v59.Size = Vector3.new(0.2, 0.2, (v61 - v60).magnitude)

		local cFrameNew = CFrame.new
		local vector32 = Vector3.new(v61, v60)

		v58.CFrame = cFrameNew(v61 + vector32 / 2, v60)

		local v72 = CFrame.new
		local vector33 = Vector3.new(v61, v60)

		v59.CFrame = v72(v61 + vector33 / 2, v60)

		return v58, v59
	end

	v58.Mesh.Scale = Vector3.new(0.1, 1, 1)
	v58.Size = Vector3.new(0.2, squareRoot, n1)
	v58.CFrame = CFrame.new(v61, v60)

	local v74 = v58.CFrame
	local v75 = CFrame.Angles(1.5707963267948966, 0, 0)
	local lookVector = (v74 * v75).lookVector
	local cFrame = CFrame.new(v60, v61)
	local v78 = CFrame.new(v60 + cFrame.lookVector * n1, v62).lookVector
	local v79 = math.min(1, lookVector.x * v78.x + lookVector.y * v78.y + lookVector.z * v78.z)
	local v80 = math.max(-1, v79)
	local v81 = v58.CFrame
	local cFrameAngles = CFrame.Angles
	local v83 = math.acos(v80)

	v79 = cFrameAngles(0, 0, v83)
	v58.CFrame = v81 * v79

	local v84 = v58.CFrame
	local v85 = CFrame.Angles(1.5707963267948966, 0, 0)

	if ((v84 * v85).lookVector - v78).magnitude > 0.01 then
		local v86 = v58.CFrame
		local angles = CFrame.Angles
		local v88 = math.acos(v80)
		local v89 = angles(0, 0, v88 * -2)

		v58.CFrame = v86 * v89
	end

	local v90 = v58.CFrame
	local cFrame2 = CFrame.new(0, squareRoot / 2, -(n2 + n1 / 2))

	v58.CFrame = v90 * cFrame2
	v59.Mesh.Scale = Vector3.new(0, 1, 1)
	v59.Size = Vector3.new(0.2, squareRoot, n2)

	local cFrame3 = CFrame.new(v61, v60)
	local v93 = CFrame.Angles
	local v94 = math.acos(v80)

	v85 = v93(0, 0, v94)
	v79 = CFrame.Angles(0, 3.141592653589793, 0)
	v59.CFrame = cFrame3 * v85 * v79

	local v95 = v59.CFrame

	v85 = CFrame.Angles(1.5707963267948966, 0, 0)

	if ((v95 * v85).lookVector - v78).magnitude > 0.01 then
		local v96 = v59.CFrame
		local v97 = CFrame.Angles
		local v98 = math.acos(v80)
		local v99 = v97(0, 0, v98 * 2)

		v59.CFrame = v96 * v99
	end

	local v100 = v59.CFrame
	local cFrame4 = CFrame.new(0, squareRoot / 2, n2 / 2)

	v59.CFrame = v100 * cFrame4

	return v58, v59
end
local function GetWedgeCFramesTwo(p17, p18, p19, p20)
	local magnitude = (p17 - p18).magnitude
	local v107 = (p18 - p19).magnitude
	local v108 = (p19 - p17).magnitude
	local v109
	local v110
	local v111

	if magnitude > v107 and magnitude > v108 then
		v109 = p18
		v110 = p19
		v111 = p17
	elseif v107 > v108 then
		v109 = p19
		v110 = p17
		v111 = p18
	else
		v109 = p17
		v110 = p18
		v111 = p19
	end

	local n1 = (v111 - v109).unit:Dot(v110 - v109) * (v111 - v109).unit + v109
	local unit = (v111 - v109).unit
	local v114 = unit:Cross(v110 - v109).unit
	local v115 = unit:Cross(v114)
	local v116 = v109:Lerp(v110, 0.5)
	local v117 = v111:Lerp(v110, 0.5)
	local cFrame = CFrame.new(v116.x, v116.y, v116.z, -v114.x, -v115.x, unit.x, -v114.y, -v115.y, unit.y, -v114.z, -v115.z, unit.z)
	local cFrame5 = CFrame.new(p20 / 2, 0, 0)
	local vector34 = Vector3.new(p20, (n1 - v110).magnitude, (n1 - v109).magnitude)
	local cFrame6 = CFrame.new(v117.x, v117.y, v117.z, v114.x, -v115.x, -unit.x, v114.y, -v115.y, -unit.y, v114.z, -v115.z, -unit.z)
	local cFrame7 = CFrame.new(-p20 / 2, 0, 0)
	local vector35 = Vector3.new(p20, (n1 - v110).magnitude, (n1 - v111).magnitude)

	return cFrame * cFrame5, vector34, cFrame6 * cFrame7, vector35
end
local function CFrameFromTopBack(p21, p22, p23)
	local v127 = p22:Cross(p23)

	return CFrame.new(p21.x, p21.y, p21.z, v127.x, p22.x, p23.x, v127.y, p22.y, p23.y, v127.z, p22.z, p23.z)
end
local function GetWedgeCFramesThree(p24, p25, p26, p27)
	local v132 = (p26 - p24):Dot((p25 - p24).unit)
	local v133 = (p24 - p25):Dot((p26 - p25).unit)
	local v134 = (p25 - p26):Dot((p24 - p26).unit)

	if not (v132 <= (p25 - p24).magnitude) or not (v132 >= 0) then
		if v133 <= (p26 - p25).magnitude and v133 >= 0 then
			local v135 = p25

			p25 = p26
			p26 = p24
			p24 = v135
		elseif v134 <= (p24 - p26).magnitude and v134 >= 0 then
			local v136 = p26
			local v137 = p24

			p26 = p25
			p24 = v136
			p25 = v137
		else
			error("unreachable")
		end
	end

	v134 = (p26 - p24):Dot((p25 - p24).unit)
	v133 = (p25 - p24).magnitude - v134

	local magnitude = (p24 + (p25 - p24).unit * v134 - p26).magnitude
	local unit = (p25 - p24):Cross(p26 - p25).unit
	local n1 = -(p25 - p24).unit
	local v141 = unit:Cross(n1)
	local cFrame = CFrame.new(p24.x, p24.y, p24.z, v141.x, unit.x, n1.x, v141.y, unit.y, n1.y, v141.z, unit.z, n1.z)

	if v134 > 0.2 and v133 > 0.2 then
		local v143 = CFrame.Angles(3.141592653589793, 0, 1.5707963267948966)
		local cFrame8 = CFrame.new(0, magnitude / 2, v134 / 2)
		local vector36 = Vector3.new(p27, magnitude, v134)
		local v146 = CFrame.Angles(3.141592653589793, 3.141592653589793, -1.5707963267948966)
		local cFrame9 = CFrame.new(0, magnitude / 2, -v134 - v133 / 2)
		local vector37 = Vector3.new(0.2, magnitude, v133)

		return cFrame * v143 * cFrame8, vector36, cFrame * v146 * cFrame9, vector37
	end

	if v133 > 0.2 then
		local v149 = CFrame.Angles(3.141592653589793, 3.141592653589793, -1.5707963267948966)
		local cFrame10 = CFrame.new(0, magnitude / 2, -v134 - v133 / 2)
		local n2 = cFrame * v149 * cFrame10
		local vector38 = Vector3.new(0.2, magnitude, v133)

		return n2, vector38, n2, vector38
	end

	if v134 > 0.2 then
		local v153 = CFrame.Angles(3.141592653589793, 0, 1.5707963267948966)
		local cFrame11 = CFrame.new(0, magnitude / 2, v134 / 2)
		local n3 = cFrame * v153 * cFrame11
		local vector39 = Vector3.new(0.2, magnitude, v134)

		return n3, vector39, n3, vector39
	end

	print("Triangle fail")
	n1 = CFrame.Angles(3.141592653589793, 0, 1.5707963267948966)

	local cFrame12 = CFrame.new(0, magnitude / 2, v134 / 2)
	local n4 = cFrame * n1 * cFrame12
	local vector310 = Vector3.new(0.2, magnitude, v134)

	return n4, vector310, n4, vector310
end

return {
	GetWedgeCFrames = GetWedgeCFrames,
	getWedgeCFrames = GetWedgeCFrames,
	DrawTriangle = DrawTriangle,
	drawTriangle = DrawTriangle,
	GetWedgeCFramesTwo = GetWedgeCFramesTwo,
	getWedgeCFramesTwo = GetWedgeCFramesTwo,
	GetWedgeCFramesThree = GetWedgeCFramesThree,
	getWedgeCFramesThree = GetWedgeCFramesThree
}
