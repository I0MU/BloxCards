



local function GetConnectedParts(p1)
	local v8 = p1:GetConnectedParts(true)

	v8[#v8 + 1] = p1

	return v8
end
local function GetCenterOfMass(p2)
	local n1 = 0
	local vectorValue = Vector3.new(0, 0, 0)

	for _, v in pairs(p2) do
		local v14 = v:GetMass()

		n1 += v14

		local v15 = v:GetMass()

		vectorValue += v15 * v.Position
	end

	return vectorValue / n1, n1
end
local function MomentOfInertia(p3, p4, p5)
	local v19 = p3.Size
	local v20 = p3:GetMass()
	local v21 = (p3.Position - p5):Cross(p4)
	local v22 = v21:Dot(v21)
	local n1 = v19 * v19

	v19 = (p3.CFrame - p3.Position):inverse() * p4

	local vector3 = Vector3.new(n1.y + n1.z, n1.z + n1.x, n1.x + n1.y)

	vector3 = vector3:Dot(v19 * v19)

	return v20 * v22 + vector3 * v20 / 12
end
local function BodyMomentOfInertia(p6, p7, p8)
	local n1 = 0

	for _, v in pairs(p6) do
		local v31 = MomentOfInertia(v, p7, p8)

		n1 += v31
	end

	return n1
end
local function ApplyForce(p9, p10, p11)
	local v35 = p9:GetConnectedParts(true)

	v35[#v35 + 1] = p9

	local v36, v37 = GetCenterOfMass(v35)
	local v38 = (v36 - (p11 or p9.Position)):Cross(p10)
	local v39 = BodyMomentOfInertia(v35, v38, v36)

	p9.RotVelocity = p9.RotVelocity + (v39 ~= 0 and v38 / v39 or Vector3.new(0, 0, 0))
	p9.Velocity = p9.Velocity + p10 / v37
end
local function AcceleratePart(p12, p13, p14)
	local v43 = p12:GetMass()
	local n1 = p14 * v43

	v43 = p12.Position
	ApplyForce(p12, n1, v43)
	ApplyForce(p13, -n1, v43)
end

return {
	GetConnectedParts = GetConnectedParts,
	getConnectedParts = GetConnectedParts,
	GetCenterOfMass = GetCenterOfMass,
	getCenterOfMass = GetCenterOfMass,
	MomentOfInertia = MomentOfInertia,
	momentOfInertia = MomentOfInertia,
	BodyMomentOfInertia = BodyMomentOfInertia,
	bodyMomentOfInertia = BodyMomentOfInertia,
	ApplyForce = ApplyForce,
	applyForce = ApplyForce,
	AcceleratePart = AcceleratePart,
	acceleratePart = AcceleratePart
}
