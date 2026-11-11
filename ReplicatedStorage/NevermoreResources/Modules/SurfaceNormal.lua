



local mathSqrt = math.sqrt
local workspaceTerrain: Terrain = workspace.Terrain
local workspaceTerrainGetCell = workspaceTerrain.GetCell
local workspaceTerrainCellCenterToWorld = workspaceTerrain.CellCenterToWorld
local workspaceTerrainWorldToCellPreferSolid = workspaceTerrain.WorldToCellPreferSolid
local vector3New = Vector3.new
local vector3 = vector3New()
local vector3Dot = vector3.Dot
local vector3Cross = vector3.Cross
local cFrameNew = CFrame.new
local cFrame = cFrameNew()
local cFramePointToObjectSpace = cFrame.pointToObjectSpace
local cFrameVectorToWorldSpace = cFrame.vectorToWorldSpace
local v14 = cFrameNew(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, -1, 0)
local v15 = cFrameNew(0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0)
local v16 = cFrameNew(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0)
local v17 = cFrameNew(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local v18 = cFrameNew(0, 0, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
local v19 = cFrameNew(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
local v20 = cFrameNew(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0)
local v21 = cFrameNew(0, 0, 0, 0, -1, -1, 1, 0, 1, 1, 1, 0)
local v22 = cFrameNew(0, 0, 0, 0, -1, -1, 1, 0, 1, 1, 1, 0)
local v23 = cFrameNew(0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0)

local function ClosestNormalVector(p1, p2)
	local n1 = -math.huge
	local v33 = nil

	for i = 1, #p2 do
		local v35 = p2[i]
		local v36 = vector3Dot(v35[1], p1 - v35[2])

		if n1 < v36 then
			v33 = i
			n1 = v36
		end
	end

	return v33
end

local t1: {[any]: any} = {
	WedgePart = {
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, 1), Vector3.new(0, 0, 0.5) },
		{ v14, Vector3.new(0, 0, 0) },
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(-1, 0, 0), Vector3.new(-0.5, 0, 0) }
	},
	CornerWedgePart = {
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) },
		{ v15, Vector3.new(0, 0, 0) },
		{ v16, Vector3.new(0, 0, 0) }
	},
	Part = {
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, 1, 0), Vector3.new(0, 0.5, 0) },
		{ Vector3.new(0, 0, 1), Vector3.new(0, 0, 0.5) },
		{ Vector3.new(-1, 0, 0), Vector3.new(-0.5, 0, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) }
	}
}
local t2: {[any]: any} = { [0] = v17, v18, v19, cFrameNew(0, 0, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0) }
local t3: {[any]: any} = {
	[0] = {
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, 1, 0), Vector3.new(0, 0.5, 0) },
		{ Vector3.new(0, 0, 1), Vector3.new(0, 0, 0.5) },
		{ Vector3.new(-1, 0, 0), Vector3.new(-0.5, 0, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) }
	},
	{
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(-1, 0, 0), Vector3.new(-0.5, 0, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) },
		{ v20, Vector3.new(0, 0, 0) }
	},
	{
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) },
		{ v21, Vector3.new(0.16666667, -0.16666667, -0.16666667) }
	},
	{
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, 1, 0), Vector3.new(0, 0.5, 0) },
		{ Vector3.new(0, 0, 1), Vector3.new(0, 0, 0.5) },
		{ Vector3.new(-1, 0, 0), Vector3.new(-0.5, 0, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) },
		{ v22, Vector3.new(-0.16666667, 0.16666667, 0.16666667) }
	},
	{
		{ Vector3.new(1, 0, 0), Vector3.new(0.5, 0, 0) },
		{ Vector3.new(0, 1, 0), Vector3.new(0, 0.5, 0) },
		{ Vector3.new(0, -1, 0), Vector3.new(0, -0.5, 0) },
		{ Vector3.new(0, 0, -1), Vector3.new(0, 0, -0.5) },
		{ v23, Vector3.new(0, 0, 0) }
	}
}

local function ConvexPlaneMesh(p3, p4)
	local v39 = p3.CFrame
	local v40 = p3.Size
	local v41

	if p3.ClassName == "Terrain" then
		local v42 = vector3New(p4.x, p4.y - 0.00001, p4.z)
		local v43 = workspaceTerrainWorldToCellPreferSolid(p3, v42)
		local v44, v45, v46 = workspaceTerrainGetCell(p3, v43.x, v43.y, v43.z)

		v41 = t3[v45.Value]

		local v47 = t2[v46.Value]
		local v48 = workspaceTerrainCellCenterToWorld(p3, v43.x, v43.y, v43.z)

		v39 = v47 + v48
		v40 = Vector3.new(4, 4, 4)
	else
		v41 = t1[p3.ClassName] or t1.Part
	end

	local t4: {[any]: any} = {}

	for i = 1, #v41 do
		local v51 = v41[i]

		t4[i] = { (v51[1] * v40).unit, v51[2] * v40 }
	end

	return t4, v39, v40
end
local function ClosestPointOnCPM(p7, p8)
	local n1 = -math.huge
	local v55 = nil
	local n2: number = 0
	local t5: {[any]: any} = {}
	local t6: {[any]: any} = {}
	local t7: {[any]: any} = {}
	local t8: {[any]: any} = {}

	for i = 1, #p8 do
		local v62 = p8[i]
		local v63 = v62[1]
		local v64 = vector3Dot(v63, p7 - v62[2])

		if n1 < v64 then
			v55 = i
			n1 = v64
		end

		if v64 > 0 then
			n2 += 1
			t5[n2] = v62
			t6[n2] = i
			t7[n2] = v64
			t8[n2] = p7 - v63 * v64
		end
	end

	if #t5 > 0 then
		local t9: {[any]: any} = {}

		for i = 1, n2 do
			local v67 = t8[i]
			local u68: boolean = true

			for j = 1, n2 do
				if i ~= j then
					local v70 = t5[j]

					if not (vector3Dot(v70[1], v67 - v70[2]) > 0) then
						continue
					end

					u68 = false

					break
				end
			end

			local v71 = t7[i]

			if u68 then
				return v67, v71, t6[i]
			end

			local u72: boolean = true

			for j = #t9, 1, -1 do
				local v74 = t9[j]

				if v71 > v74[2] then
					if not (j < 3) then
						continue
					end

					t9[j + 1] = v74

					continue
				end

				u72 = false
				t9[j + 1] = { t6[i], v71 }

				break
			end

			if u72 then
				t9[1] = { t6[i], v71 }
			end
		end

		if #t9 == 2 then
			local v75 = t9[1]
			local v76 = t9[2]
			local v77 = p8[v75[1]]
			local v78 = p8[v76[1]]
			local v79 = v77[1]
			local v80 = v78[1]
			local v81 = v75[2]
			local v82 = v76[2]

			v76 = vector3Dot(v79, v80)

			local v83 = vector3Cross(v79, v80)
			local v84 = vector3Dot(v79, v77[2])
			local v85 = vector3Dot(v80, v78[2])
			local v86 = vector3Dot(v83, p7)
			local v87 = vector3Dot(v83, v83)
			local v88 = mathSqrt((v81 * v81 + v82 * v82 - 2 * v76 * v81 * v82) / (1 - v76 * v76))

			return (v84 * (v79 - v80 * v76) + v85 * (v80 - v79 * v76) + v86 * v83) / v87, v88, v75[1]
		end

		if #t9 == 3 then
			local v89 = t9[1]
			local v90 = p8[v89[1]]
			local v91 = p8[t9[2][1]]
			local v92 = p8[t9[3][1]]
			local v93 = v90[1]
			local v94 = v91[1]
			local v95 = v92[1]
			local v96 = vector3Dot(v93, v90[2])
			local v97 = vector3Cross(v94, v95)
			local v98 = vector3Dot(v94, v91[2])
			local v99 = vector3Cross(v95, v93)
			local v100 = vector3Dot(v95, v92[2])
			local v101 = vector3Cross(v93, v94)
			local n3 = (v96 * v97 + v98 * v99 + v100 * v101) / (v93.x * v94.y * v95.z - v93.x * v95.y * v94.z - v94.x * v93.y * v95.z + v94.x * v95.y * v93.z + v95.x * v93.y * v94.z - v95.x * v94.y * v93.z)

			return n3, (p7 - n3).magnitude, v89[1]
		end

		print("This should never run")

		return p7 - p8[t9[1][1]] * t9[1][2], t9[1][2], t9[1][1]
	end

	return p7 - p8[v55][1] * n1, n1, v55
end

v14 = function(_, _)
end

return {
	ClosestNormalVector = ClosestNormalVector,
	ConvexPlaneMesh = ConvexPlaneMesh,
	NormalVector = function(p5, p6)
		if p5.ClassName == "Part" and (p5.Shape == Enum.PartType.Ball or p5.Shape == Enum.PartType.Cylinder) then
			local cFrame = p5.CFrame
			local v108 = cFramePointToObjectSpace(p5.CFrame, p6)

			return cFrameVectorToWorldSpace(cFrame, v108.unit)
		end

		local v109, v110 = ConvexPlaneMesh(p5, p6)
		local v111 = cFramePointToObjectSpace(v110, p6)
		local v112 = ClosestNormalVector(v111, v109)

		if v112 then
			return cFrameVectorToWorldSpace(v110, v109[v112][1])
		end

		return vector3
	end,
	GetSurfaceIdFromNormalRelativeToCFrame = function(p9, p10)
		local v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126 = p9:components()
		local vector3 = Vector3.new(v118, v121, v124)
		local vector32 = Vector3.new(v119, v122, v125)
		local vector33 = Vector3.new(v120, v123, v126)

		if p10 == vector3 then
			return Enum.NormalId.Right, 1
		end

		if -vector3 == p10 then
			return Enum.NormalId.Left, -1
		end

		if vector32 == p10 then
			return Enum.NormalId.Top, 1
		end

		if -vector32 == p10 then
			return Enum.NormalId.Bottom, -1
		end

		if vector33 == p10 then
			return Enum.NormalId.Back, 1
		end

		if -vector33 == p10 then
			return Enum.NormalId.Front, -1
		end

		return nil
	end,
	ClosestPointOnPart = function(p11, p12)
		if p11.ClassName == "Part" and (p11.Shape == Enum.PartType.Ball or p11.Shape == Enum.PartType.Cylinder) then
			local unit = cFramePointToObjectSpace(p11.CFrame, p12).unit
			local n1 = p11.CFrame * (unit * p11.Size)
			local magnitude = (p12 - n1).magnitude
			local v135 = cFrameVectorToWorldSpace(p11.CFrame, unit)

			return n1, magnitude, v135, { unit, n1 }
		end

		local v136, v137 = ConvexPlaneMesh(p11, p12)
		local v138 = cFramePointToObjectSpace(v137, p12)
		local v139, v140, v141 = ClosestPointOnCPM(v138, v136)
		local v142 = cFrameVectorToWorldSpace(v137, v136[v141][1])

		return v137 * v139, v140, v142, v136[v141]
	end
}
