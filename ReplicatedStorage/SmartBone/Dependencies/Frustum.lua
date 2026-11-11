



--!native
local scriptParent: Instance = script.Parent
local config = require(scriptParent:WaitForChild("Config"))
local utilities = require(scriptParent:WaitForChild("Utilities"))

local module: {[any]: any} = {
	GetCFrames = function(p1, p2)
		debug.profilebegin("Frustum::GetCFrames")

		local v7 = p1.CFrame
		local v8 = v7.Position
		local rightVector = v7.RightVector
		local upVector = v7.UpVector
		local n1 = p2 * 0.5
		local n2 = math.tan((p1.FieldOfView + 5) * 0.5 * 0.017453) * p2
		local n3 = n2 * (p1.ViewportSize.X / p1.ViewportSize.Y)
		local cFrame = CFrame.new(0, 0, -p2)
		local n4 = v7 * cFrame
		local vector3 = Vector3.new(n3, n2, 0)
		local vector32 = Vector3.new(-n3, -n2, 0)
		local vector33 = Vector3.new(n3, -n2, 0)
		local n5 = n4 * vector33
		local cFrame2 = CFrame.new(0, 0, -n1)
		local v21 = (v7 * cFrame2):Inverse()
		local unit = upVector:Cross(n5 - v8).Unit
		local v23 = upVector:Cross(n4 * vector32 - v8).Unit
		local v24 = rightVector:Cross(v8 - n4 * vector3).Unit
		local v25 = rightVector:Cross(v8 - n5).Unit

		debug.profileend()

		return v21, n3, n2, n1, unit, v23, v24, v25, v7
	end,
	InViewFrustum = function(p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
		debug.profilebegin("Frustum::InViewFrustum")

		local n1 = p4 * p3

		if p5 < n1.X or n1.X < -p5 or p6 < n1.Y or n1.Y < -p6 or p7 < n1.Z or n1.Z < -p7 then
			debug.profileend()

			return false
		end

		n1 = p3 - p12.Position

		if p8:Dot(n1) < 0 or p9:Dot(n1) > 0 or p10:Dot(n1) < 0 or p11:Dot(n1) > 0 then
			debug.profileend()

			return false
		end

		debug.profileend()

		return true
	end
}

function module.ObjectInFrustum(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
	local cFrame = p13.CFrame
	local v48 = p13.Size
	local n1 = config.FAR_PLANE * 0.5
	local v50 = utilities.ClosestPointOnLine(p22.Position + p22.LookVector * n1, p22.LookVector, n1, cFrame.Position)
	local v51, v52 = utilities.ClosestPointInBox(cFrame, v48, v50)

	if v51 then
		return true
	end

	if module.InViewFrustum(v52, p14, p15, p16, p17, p18, p19, p20, p21, p22) then
		return true
	end

	return false
end

return module
