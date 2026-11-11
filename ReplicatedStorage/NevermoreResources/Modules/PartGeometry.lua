



local function rightVector(p1)
	local v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17 = p1:components()
	local vector3 = Vector3.new(v9, v12, v15)

	return vector3
end
local function leftVector(p2)
	local v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31 = p2:components()
	local vector3 = Vector3.new(-v23, -v26, -v29)

	return vector3
end

leftVector = function(p3)
	local v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45 = p3:components()
	local vector3 = Vector3.new(v38, v41, v44)

	return vector3
end

local function bottomVector(p4)
	local v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59 = p4:components()
	local vector3 = Vector3.new(-v52, -v55, -v58)

	return vector3
end

bottomVector = function(p5)
	local v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73 = p5:components()
	local vector3 = Vector3.new(v67, v70, v73)

	return vector3
end

local function frontVector(p6)
	local v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87 = p6:components()
	local vector3 = Vector3.new(-v81, -v84, -v87)

	return vector3
end
function CFrameFromTopBack(p7, p8, p9)
	local v92 = p8:Cross(p9)

	return CFrame.new(p7.x, p7.y, p7.z, v92.x, p8.x, p9.x, v92.y, p8.y, p9.y, v92.z, p8.z, p9.z)
end
function IsSmoothPart(p10)
	return p10:IsA("Part") and p10.Shape == Enum.PartType.Ball
end
function GetShape(p11)
	for _, v in pairs(p11:GetChildren()) do
		if v:IsA("SpecialMesh") then
			local vScale = v.Scale

			if v.MeshType == Enum.MeshType.Brick then
				return "Brick", vScale
			end

			if v.MeshType == Enum.MeshType.CornerWedge then
				return "CornerWedge", vScale
			end

			if v.MeshType == Enum.MeshType.Cylinder then
				return "Round", vScale
			end

			if v.MeshType == Enum.MeshType.Wedge then
				return "Wedge", vScale
			end

			if v.MeshType == Enum.MeshType.Sphere then
				return "Round", vScale
			end

			warn("PartGeometry: Unsupported Mesh Type `" .. v.MeshType.Name .. "`, treating as a normal brick.")
		end
	end

	if p11:IsA("WedgePart") then
		return "Wedge", Vector3.new(1, 1, 1)
	end

	if p11:IsA("CornerWedgePart") then
		return "CornerWedge", Vector3.new(1, 1, 1)
	end

	if p11:IsA("Terrain") then
		return "Terrain", Vector3.new(1, 1, 1)
	end

	if p11:IsA("TrussPart") then
		return "Brick", Vector3.new(1, 1, 1)
	end

	if p11:IsA("UnionOperation") then
		return "Brick", Vector3.new(1, 1, 1)
	end

	if p11.Shape == Enum.PartType.Ball then
		return "Round", Vector3.new(1, 1, 1)
	end

	if p11.Shape == Enum.PartType.Cylinder then
		return "Round", Vector3.new(1, 1, 1)
	end

	if p11.Shape == Enum.PartType.Block then
		return "Brick", Vector3.new(1, 1, 1)
	end

	assert(false, "Unreachable")
end
function GetGeometry(p12, p13, _)
	local cFrame = p12.CFrame
	local cFrameP = cFrame.p
	local n1 = p12.Size.x / 2
	local n2 = p12.Size.y / 2
	local n3 = p12.Size.z / 2
	local v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117 = cFrame:components()
	local vector3 = Vector3.new(v109, v112, v115)
	local v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130 = cFrame:components()
	local vector32 = Vector3.new(v123, v126, v129)
	local v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143 = cFrame:components()
	local vector33 = Vector3.new(v137, v140, v143)
	local t1 = nil
	local t2 = nil
	local t3 = nil
	local v148 = nil
	local v149, v150 = GetShape(p12)
	local n4 = n1 * v150.X
	local n5 = n2 * v150.Y
	local n6 = n3 * v150.Z

	if v149 == "Brick" then
		t1 = {
			cFrameP + vector3 * n4 + vector32 * n5 + vector33 * n6,
			cFrameP + vector3 * n4 + vector32 * n5 - vector33 * n6,
			cFrameP - vector3 * n4 + vector32 * n5 + vector33 * n6,
			cFrameP - vector3 * n4 + vector32 * n5 - vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 - vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 - vector33 * n6
		}
		local v154 = t1[1]
		local v155 = t1[2]
		local v156 = math.min(2 * n4, 2 * n5)
		local v157 = t1[3]
		local v158 = t1[4]
		local v159 = math.min(2 * n4, 2 * n5)
		local v160 = t1[1]
		local v161 = t1[3]
		local v162 = math.min(2 * n5, 2 * n6)
		local v163 = t1[2]
		local v164 = t1[4]
		local v165 = math.min(2 * n5, 2 * n6)
		local v166 = t1[5]
		local v167 = t1[6]
		local v168 = math.min(2 * n4, 2 * n5)
		local v169 = t1[7]
		local v170 = t1[8]
		local v171 = math.min(2 * n4, 2 * n5)
		local v172 = t1[5]
		local v173 = t1[7]
		local v174 = math.min(2 * n5, 2 * n6)
		local v175 = t1[6]
		local v176 = t1[8]
		local v177 = math.min(2 * n5, 2 * n6)
		local v178 = t1[1]
		local v179 = t1[5]
		local v180 = math.min(2 * n4, 2 * n6)
		local v181 = t1[2]
		local v182 = t1[6]
		local v183 = math.min(2 * n4, 2 * n6)
		local v184 = t1[3]
		local v185 = t1[7]
		local v186 = math.min(2 * n4, 2 * n6)
		local v187 = t1[4]
		local v188 = t1[8]
		local v189 = math.min(2 * n4, 2 * n6)
		t2 = {
			{ v154, v155, v156 },
			{ v157, v158, v159 },
			{ v160, v161, v162 },
			{ v163, v164, v165 },
			{ v166, v167, v168 },
			{ v169, v170, v171 },
			{ v172, v173, v174 },
			{ v175, v176, v177 },
			{ v178, v179, v180 },
			{ v181, v182, v183 },
			{ v184, v185, v186 },
			{ v187, v188, v189 }
		}
		t3 = {
			{
				t1[1],
				vector3,
				vector33,
				{ t1[1], t1[2], t1[6], t1[5] }
			},
			{
				t1[3],
				-vector3,
				vector33,
				{ t1[3], t1[4], t1[8], t1[7] }
			},
			{
				t1[1],
				vector32,
				vector3,
				{ t1[1], t1[2], t1[4], t1[3] }
			},
			{
				t1[5],
				-vector32,
				vector3,
				{ t1[5], t1[6], t1[8], t1[7] }
			},
			{
				t1[1],
				vector33,
				vector3,
				{ t1[1], t1[3], t1[7], t1[5] }
			},
			{
				t1[2],
				-vector33,
				vector3,
				{ t1[2], t1[4], t1[8], t1[6] }
			}
		}
	elseif v149 == "Round" then
		t1 = { p13 }
		t2 = {}
		local unit = (p13 - cFrameP).unit
		local v191 = unit:Cross(Vector3.new(0, 1, 0))
		t3 = { {
			p13,
			unit,
			v191.unit,
			{}
		} }
	elseif v149 == "CornerWedge" then
		t1 = {
			cFrameP + vector3 * n4 + vector32 * n5 - vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 - vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 - vector33 * n6
		}
		t2 = {
			{ t1[2], t1[3], 0 },
			{ t1[3], t1[5], 0 },
			{ t1[5], t1[4], 0 },
			{ t1[4], t1[1], 0 },
			{ t1[1], t1[3], 0 },
			{ t1[1], t1[2], 0 },
			{ t1[1], t1[5], 0 },
			{ t1[1], t1[4], 0 }
		}
		t3 = {
			{
				t1[2],
				-vector32,
				vector3,
				{ t1[2], t1[3], t1[5], t1[4] }
			},
			{
				t1[1],
				vector3,
				-vector32,
				{ t1[1], t1[3], t1[2] }
			},
			{
				t1[1],
				-vector33,
				-vector32,
				{ t1[1], t1[3], t1[5] }
			},
			{
				t1[1],
				(vector33 * n5 + vector32 * n6).unit,
				vector3,
				{ t1[1], t1[2], t1[4] }
			},
			{
				t1[1],
				(-vector3 * n5 + vector32 * n4).unit,
				vector33,
				{ t1[1], t1[5], t1[4] }
			}
		}
	elseif v149 == "Wedge" then
		local v192 = (-vector33 * n5 + vector32 * n6).unit
		t1 = {
			cFrameP + vector3 * n4 + vector32 * n5 + vector33 * n6,
			cFrameP - vector3 * n4 + vector32 * n5 + vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP + vector3 * n4 - vector32 * n5 - vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 + vector33 * n6,
			cFrameP - vector3 * n4 - vector32 * n5 - vector33 * n6
		}
		local v193 = t1[1]
		local v194 = t1[2]
		local v195 = math.min(2 * n5, 2 * n6)
		local v196 = t1[1]
		local v197 = t1[4]
		local v198 = math.min(2 * n5, 2 * n6)
		local v199 = t1[2]
		local v200 = t1[6]
		local v201 = math.min(2 * n5, 2 * n6)
		local v202 = t1[3]
		local v203 = t1[4]
		local v204 = math.min(2 * n4, 2 * n5)
		local v205 = t1[5]
		local v206 = t1[6]
		local v207 = math.min(2 * n4, 2 * n5)
		local v208 = t1[3]
		local v209 = t1[5]
		local v210 = math.min(2 * n5, 2 * n6)
		local v211 = t1[4]
		local v212 = t1[6]
		local v213 = math.min(2 * n5, 2 * n6)
		local v214 = t1[1]
		local v215 = t1[3]
		local v216 = math.min(2 * n4, 2 * n6)
		local v217 = t1[2]
		local v218 = t1[5]
		local v219 = math.min(2 * n4, 2 * n6)
		t2 = {
			{ v193, v194, v195 },
			{ v196, v197, v198 },
			{ v199, v200, v201 },
			{ v202, v203, v204 },
			{ v205, v206, v207 },
			{ v208, v209, v210 },
			{ v211, v212, v213 },
			{ v214, v215, v216 },
			{ v217, v218, v219 }
		}
		v193 = t1[1]
		v202 = { t1[1], t1[4], t1[3] }
		v196 = t1[2]
		v205 = { t1[2], t1[6], t1[5] }
		v199 = t1[3]
		v208 = { t1[3], t1[4], t1[6], t1[5] }
		v200 = t1[1]
		v211 = { t1[1], t1[2], t1[5], t1[3] }
		v203 = t1[2]
		v209 = v192:Cross(vector3)
		t3 = {
			{ v193, vector3, vector33, v202 },
			{ v196, -vector3, vector33, v205 },
			{ v199, -vector32, vector3, v208 },
			{ v200, vector33, vector3, v211 },
			{
				v203,
				v192,
				v209,
				{ t1[2], t1[1], t1[4], t1[6] }
			}
		}
	elseif v149 == "Terrain" then
		local v220 = game.Workspace.Terrain:WorldToCellPreferSolid(p13)
		local v221, v222, v223 = game.Workspace.Terrain:GetCell(v220.x, v220.y, v220.z)
		local v224: Vector3 = game.Workspace.Terrain:CellCenterToWorld(v220.x, v220.y, v220.z)

		v148 = 4
		v220 = {
			[Enum.CellOrientation.NegZ] = 0,
			[Enum.CellOrientation.X] = 1,
			[Enum.CellOrientation.Z] = 2,
			[Enum.CellOrientation.NegX] = 3
		}
		local lookVector = CFrame.Angles(0, 1.5707963267948966 * (v220[v223] - 1), 0).lookVector
		local v226 = lookVector:Cross(Vector3.new(0, 1, 0))

		if v222 == Enum.CellBlock.Solid then
			t1 = {
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 + Vector3.new(0, 2, 0) + v226 * 2,
				v224 - lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2
			}
			t2 = {
				{ t1[1], t1[2], 4 },
				{ t1[3], t1[4], 4 },
				{ t1[1], t1[3], 4 },
				{ t1[2], t1[4], 4 },
				{ t1[5], t1[6], 4 },
				{ t1[7], t1[8], 4 },
				{ t1[5], t1[7], 4 },
				{ t1[6], t1[8], 4 },
				{ t1[1], t1[5], 4 },
				{ t1[2], t1[6], 4 },
				{ t1[3], t1[7], 4 },
				{ t1[4], t1[8], 4 }
			}
			t3 = {
				{
					v224 + lookVector * 2,
					lookVector,
					v226,
					{ t1[1], t1[2], t1[6], t1[5] }
				},
				{
					v224 - lookVector * 2,
					-lookVector,
					v226,
					{ t1[3], t1[4], t1[8], t1[7] }
				},
				{
					v224 + Vector3.new(0, 2, 0),
					Vector3.new(0, 1, 0),
					lookVector,
					{ t1[1], t1[2], t1[4], t1[3] }
				},
				{
					v224 - Vector3.new(0, 2, 0),
					Vector3.new(-0, -1, -0),
					lookVector,
					{ t1[5], t1[6], t1[8], t1[7] }
				},
				{
					v224 + v226 * 2,
					v226,
					lookVector,
					{ t1[1], t1[3], t1[7], t1[5] }
				},
				{
					v224 - v226 * 2,
					-v226,
					lookVector,
					{ t1[2], t1[4], t1[8], t1[6] }
				}
			}
		elseif v222 == Enum.CellBlock.VerticalWedge then
			local n7 = -v226
			local n8 = -lookVector
			local v229 = (-n7 * 2 + Vector3.new(0, 2, 0)).unit
			t1 = {
				v224 + n8 * 2 + Vector3.new(0, 2, 0) + n7 * 2,
				v224 - n8 * 2 + Vector3.new(0, 2, 0) + n7 * 2,
				v224 + n8 * 2 - Vector3.new(0, 2, 0) + n7 * 2,
				v224 + n8 * 2 - Vector3.new(0, 2, 0) - n7 * 2,
				v224 - n8 * 2 - Vector3.new(0, 2, 0) + n7 * 2,
				v224 - n8 * 2 - Vector3.new(0, 2, 0) - n7 * 2
			}
			t2 = {
				{ t1[1], t1[2], 4 },
				{ t1[1], t1[4], 4 },
				{ t1[2], t1[6], 4 },
				{ t1[3], t1[4], 4 },
				{ t1[5], t1[6], 4 },
				{ t1[3], t1[5], 4 },
				{ t1[4], t1[6], 4 },
				{ t1[1], t1[3], 4 },
				{ t1[2], t1[5], 4 }
			}
			local t4: {[any]: any} = { t1[1], t1[4], t1[3] }
			local t5: {[any]: any} = { t1[2], t1[6], t1[5] }
			local t6: {[any]: any} = { t1[3], t1[4], t1[6], t1[5] }
			local t7: {[any]: any} = { t1[1], t1[2], t1[5], t1[3] }
			local v234 = v229:Cross(n8)
			t3 = {
				{ v224 + n8 * 2, n8, n7, t4 },
				{ v224 - n8 * 2, -n8, n7, t5 },
				{ v224 - Vector3.new(0, 2, 0), Vector3.new(-0, -1, -0), n8, t6 },
				{ v224 + n7 * 2, n7, n8, t7 },
				{
					v224,
					v229,
					v234,
					{ t1[2], t1[1], t1[4], t1[6] }
				}
			}
		elseif v222 == Enum.CellBlock.CornerWedge then
			t1 = {
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2
			}
			t2 = {
				{ t1[1], t1[2], 3 },
				{ t1[1], t1[3], 3 },
				{ t1[1], t1[4], 3 },
				{ t1[2], t1[3], 3 },
				{ t1[2], t1[4], 3 },
				{ t1[3], t1[4], 3 }
			}
			local n9 = ((t1[3] + t1[4]) / 2 + t1[2]) / 2
			local vector34 = Vector3.new(n9.x, v224.y, n9.z)
			t3 = {
				{
					n9,
					Vector3.new(-0, -1, -0),
					lookVector,
					{ t1[2], t1[3], t1[4] }
				},
				{
					v224 + lookVector * 2,
					lookVector,
					Vector3.new(0, 1, 0),
					{ t1[1], t1[2], t1[3] }
				},
				{
					v224 - v226 * 2,
					-v226,
					Vector3.new(0, 1, 0),
					{ t1[1], t1[2], t1[4] }
				},
				{
					vector34,
					((v226 - lookVector).unit * 2 + Vector3.new(0, 1.4142135, 0)).unit,
					(lookVector + v226).unit,
					{ t1[1], t1[3], t1[4] }
				}
			}
		elseif v222 == Enum.CellBlock.InverseCornerWedge then
			t1 = {
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2
			}
			t2 = {
				{ t1[1], t1[2], 4 },
				{ t1[2], t1[3], 4 },
				{ t1[4], t1[5], 4 },
				{ t1[6], t1[7], 4 },
				{ t1[4], t1[6], 4 },
				{ t1[5], t1[7], 4 },
				{ t1[1], t1[4], 4 },
				{ t1[2], t1[5], 4 },
				{ t1[3], t1[7], 4 },
				{ t1[1], t1[3], 2.5 },
				{ t1[1], t1[6], 2.5 },
				{ t1[3], t1[6], 2.5 }
			}
			local n10 = ((t1[4] + t1[7]) / 2 + t1[6]) / 2
			local vector35 = Vector3.new(n10.x, v224.y, n10.z)
			t3 = {
				{
					v224 + lookVector * 2,
					lookVector,
					v226,
					{ t1[1], t1[2], t1[5], t1[4] }
				},
				{
					v224 - lookVector * 2,
					-lookVector,
					v226,
					{ t1[3], t1[7], t1[6] }
				},
				{
					v224 + Vector3.new(0, 2, 0),
					Vector3.new(0, 1, 0),
					lookVector,
					{ t1[1], t1[2], t1[3] }
				},
				{
					v224 - Vector3.new(0, 2, 0),
					Vector3.new(-0, -1, -0),
					lookVector,
					{ t1[4], t1[5], t1[7], t1[6] }
				},
				{
					v224 + v226 * 2,
					v226,
					lookVector,
					{ t1[1], t1[6], t1[4] }
				},
				{
					v224 - v226 * 2,
					-v226,
					lookVector,
					{ t1[2], t1[3], t1[7], t1[5] }
				},
				{
					vector35,
					((v226 - lookVector).unit * 2 + Vector3.new(0, 1.4142135, 0)).unit,
					(lookVector + v226).unit,
					{ t1[1], t1[3], t1[6] }
				}
			}
		elseif v222 == Enum.CellBlock.HorizontalWedge then
			t1 = {
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 + Vector3.new(0, 2, 0) - v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) + v226 * 2,
				v224 + lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2,
				v224 - lookVector * 2 - Vector3.new(0, 2, 0) - v226 * 2
			}
			t2 = {
				{ t1[1], t1[2], 4 },
				{ t1[2], t1[3], 4 },
				{ t1[4], t1[5], 4 },
				{ t1[5], t1[6], 4 },
				{ t1[1], t1[4], 4 },
				{ t1[2], t1[5], 4 },
				{ t1[3], t1[6], 4 },
				{ t1[1], t1[3], 2.5 },
				{ t1[4], t1[6], 2.5 }
			}
			t3 = {
				{
					v224 + lookVector * 2,
					lookVector,
					v226,
					{ t1[1], t1[2], t1[5], t1[4] }
				},
				{
					v224 + Vector3.new(0, 2, 0),
					Vector3.new(0, 1, 0),
					lookVector,
					{ t1[1], t1[2], t1[3] }
				},
				{
					v224 - Vector3.new(0, 2, 0),
					Vector3.new(-0, -1, -0),
					lookVector,
					{ t1[4], t1[5], t1[6] }
				},
				{
					v224 - v226 * 2,
					-v226,
					lookVector,
					{ t1[2], t1[3], t1[6], t1[5] }
				},
				{
					v224,
					(v226 - lookVector).unit,
					Vector3.new(0, 1, 0),
					{ t1[1], t1[3], t1[4], t1[6] }
				}
			}
		else
			assert(false, "unreachable")
		end
	else
		assert(false, "Bad shape: " .. v149)
	end

	local t8: {[any]: any} = { part = p12, vertices = t1, edges = t2, faces = t3 }
	local n11 = v148

	if not n11 then
		n11 = math.min(n4, n5, n6) * 2
	end

	t8.vertexMargin = n11
	v148 = 0

	for _, v in pairs(t3) do
		v148 += 1
		v.id = v148
		v.point = v[1]
		v.normal = v[2]
		v.direction = v[3]
		v.vertices = v[4]
		v.part = p12
		v.type = "Face"
		v[1] = nil
		v[2] = nil
		v[3] = nil
		v[4] = nil
	end

	for _, v in pairs(t2) do
		v148 += 1
		v.id = v148

		local v245 = v[2]

		v.a = v[1]
		v.b = v245
		v.direction = (v.b - v.a).unit
		v.length = (v.b - v.a).magnitude
		v.edgeMargin = v[3]
		v.part = p12
		v.vertexMargin = t8.vertexMargin
		v.type = "Edge"
		v[1] = nil
		v[2] = nil
		v[3] = nil
	end

	for k, v in pairs(t1) do
		v148 += 1

		local v248 = IsSmoothPart(p12)

		t1[k] = { type = "Vertex", position = v, id = v148, ignoreUnlessNeeded = v248 }
	end

	return t8
end

return {
	GetGeometry = GetGeometry,
	getNormal = function(p15)
		return p15.normal
	end,
	close = function(p16, p17)
		return (p16 - p17).magnitude < 0.001
	end
}
