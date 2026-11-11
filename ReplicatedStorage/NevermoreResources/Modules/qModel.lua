



local replicatedStorage = game:GetService("ReplicatedStorage")

replicatedStorage = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary("qSystems").CallOnChildren

local function getCenteroidPoint(p2)
	local vector3 = Vector3.new()
	local n1: number = 0

	local function scan(p3)
		for _, v in pairs(p3) do
			if v:IsA("BasePart") then
				vector3 += v.Position
				n1 += 1
			end

			scan(v:GetChildren())
		end
	end

	scan(p2)

	return vector3 / n1
end

local module: {[any]: any} = {
	FindMesh = function(p1)
		local v11, v12 = p1:GetChildren()

		for iterKey, iterValue in next, v11, v12 do
			if iterValue:IsA("DataModelMesh") then
				return iterValue
			end
		end
	end
}

local t2: {[any]: any} = {
	TrussPart = true,
	VehicleSeat = true,
	CornerWedgePart = true,
	UnionOperation = true
}
local t3: {[any]: any} = {
	Symmetric = Vector3.new(1, 1, 1),
	Brick = Vector3.new(1, 1.2, 1),
	Plate = Vector3.new(1, 0.4, 1),
	Custom = Vector3.new(0.2, 0.2, 0.2),
	TrussPart = Vector3.new(2, 2, 2),
	VehicleSeat = Vector3.new(1, 1, 1),
	CornerWedgePart = Vector3.new(1, 1, 1),
	UnionOperation = Vector3.new(0, 0, 0)
}

function module.Scale(p4, p5, p6)
	for _, v in pairs(p4) do
		if v:IsA("BasePart") then
			local v20 = t3[t2[v.ClassName] and v.ClassName or v.FormFactor.Name]
			local n1 = v.Position - p6
			local n2 = v.CFrame - v.CFrame.p
			local v23, v24 = v:GetChildren()
			local v25: boolean = false
			local specialMesh

			for iterKey, iterValue in next, v23, v24 do
				if iterValue:IsA("DataModelMesh") then
					specialMesh = iterValue
					v25 = true

					break
				end
			end

			if not v25 then
				specialMesh = nil
			end

			local n3 = (specialMesh and v.Size * specialMesh.Scale or v.Size) * p5

			if not v:IsA("TrussPart") and not v:IsA("UnionOperation") and (n3.X < v20.X or n3.Y < v20.Y or n3.Z < v20.Z) and not specialMesh then
				specialMesh = Instance.new("SpecialMesh", v)

				if v:IsA("WedgePart") then
					specialMesh.MeshType = "Wedge"
				elseif v:IsA("CornerWedgePart") then
					specialMesh.MeshType = "CornerWedge"
				elseif v:IsA("Part") then
					if v.Shape.Name == "Ball" then
						specialMesh.MeshType = "Sphere"
					elseif v.Shape.Name == "Cylinder" then
						specialMesh.MeshType = "Cylinder"
					else
						specialMesh.MeshType = "Brick"
					end
				else
					specialMesh.MeshType = "Brick"
				end
			end

			v.Size = n3

			if specialMesh then
				specialMesh.Scale = n3 / v.Size
				specialMesh.Offset = specialMesh.Offset * p5

				if specialMesh.Scale == Vector3.new(1, 1, 1) and specialMesh.Offset == Vector3.new(0, 0, 0) then
					specialMesh:Destroy()
				end
			end

			v.CFrame = CFrame.new(p6 + n1 * p5) * n2
		end

		local scale = module.Scale
		local children = v:GetChildren()

		scale(children, p5, p6)
	end
end

return module
