



local LocalPlayer: Player = game:GetService("Players").LocalPlayer
local v2 = LocalPlayer and LocalPlayer:GetMouse()

warn("[ScreenGeometry] - Don't use me! Use screenspace instead!")

local module: {[any]: any} = {
	ViewSizeX = function()
		local viewSizeX = v2.ViewSizeX

		if viewSizeX == 0 then
			return 1024
		end

		return viewSizeX
	end,
	ViewSizeY = function()
		local viewSizeY = v2.ViewSizeY

		if viewSizeY == 0 then
			return 768
		end

		return viewSizeY
	end
}

function module.AspectRatio()
	local v9 = module.ViewSizeX()
	local v10 = module.ViewSizeY()

	return v9 / v10
end
function module.PointToScreenSpace(p1)
	local v12 = workspace.CurrentCamera.CoordinateFrame:pointToObjectSpace(p1)
	local v13 = module.AspectRatio()
	local v14 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v15 = math.tan(v14 / 2)
	local n1 = v12.x / v12.z / -(v13 * v15)
	local n2 = v12.y / v12.z / v15
	local vector2New = Vector2.new
	local v19 = module.ViewSizeX()
	local v20 = module.ViewSizeY()

	return vector2New(v19 * (0.5 + 0.5 * n1), v20 * (0.5 + 0.5 * n2))
end
function module.WidthToScreenSpace(p2, p3)
	local v23 = module.AspectRatio()
	local v24 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v25 = math.tan(v24 / 2)

	return module.ViewSizeX() * 0.5 * p3 / p2 / (v23 * v25)
end
function module.ScreenSpaceToWorld(p4, p5, p6)
	local v29 = module.AspectRatio()
	local v30 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v31 = math.tan(v30 / 2)
	local v32 = module.ViewSizeX()
	local v33 = module.ViewSizeY()
	local vector3 = Vector3.new((p4 / v32 * 2 - 1) * -(v29 * v31) * p6, (p5 / v33 * 2 - 1) * v31 * p6, p6)

	return vector3
end
function module.GetDepthForWidth(p7, p8)
	local v37 = module.AspectRatio()
	local v38 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v39 = math.tan(v38 / 2)

	return -0.5 * module.ViewSizeX() * p7 / (p8 * (v37 * v39))
end
function module.GetWidthForDepth(p9, p10)
	local v42 = module.AspectRatio()
	local v43 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v44 = math.tan(v43 / 2)
	local v45 = module.ViewSizeX()

	return -2 * p9 * p10 * (v42 * v44) / v45
end
function module.ScreenSpaceToWorldWithHeight(p11, p12, p13, p14)
	local v50 = module.AspectRatio()
	local v51 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v52 = math.tan(v51 / 2)
	local v53 = module.ViewSizeX()
	local v54 = module.ViewSizeY()
	local vector3 = Vector3.new((p11 / v53 * 2 - 1) * -(v50 * v52) * p14, (p12 / v54 * 2 - 1) * v52 * p14, p14)

	return vector3, -(p13 / v54) * 2 * v52 * p14
end
function module.HeightToScreenHeight(p15, p16)
	local v58 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v59 = math.tan(v58)

	v58 = module.ViewSizeY()

	return -p15 * v58 / (v59 * 2 * p16)
end

local mathAbs = math.abs
local mathMax = math.max
local mathTan = math.tan

function module.GetSideSlopes(p17, p18)
	local v62 = module.ViewSizeX()
	local v63 = module.ViewSizeY()
	local v64 = mathTan(workspace.CurrentCamera.FieldOfView * 3.141592653589793 / 360)

	return v64 * v62 / v63 * (1 - (p17 or 0) / v62), v64 * (1 - (p18 or 0) / v63)
end
function module.GetChangeInDepthForPoint(p19, p20, p21, p22)
	local v69 = p19:pointToObjectSpace(p20)
	local n1 = mathAbs(v69.x) / p21 - v69.z
	local v71 = mathAbs(v69.y)

	return (mathMax(n1, v71 / p22 - v69.z))
end

return module
