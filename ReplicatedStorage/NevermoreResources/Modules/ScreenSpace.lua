



game:GetService("Players").LocalPlayer:GetMouse()

local module: {[any]: any} = {
	ViewSizeX = function()
		local x = workspace.CurrentCamera.ViewportSize.X

		if x == 0 then
			return 1024
		end

		return x
	end,
	ViewSizeY = function()
		local y = workspace.CurrentCamera.ViewportSize.Y

		if y == 0 then
			return 768
		end

		return y
	end
}

function module.AspectRatio()
	local v4 = module.ViewSizeX()
	local v5 = module.ViewSizeY()

	return v4 / v5
end
function module.ScreenToWorld(p1, p2, p3)
	local v9 = module.AspectRatio()
	local v10 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v11 = math.tan(v10 / 2)
	local v12 = module.ViewSizeX()
	local v13 = module.ViewSizeY()
	local vector3 = Vector3.new((p1 / v12 * 2 - 1) * -(v9 * v11) * p3, ((p2 + 34) / v13 * 2 - 1) * v11 * p3, p3)

	return vector3
end
function module.ScreenWidthToWorldWidth(p4, p5)
	local v17 = module.AspectRatio()
	local v18 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v19 = math.tan(v18 / 2)

	v18 = module.ViewSizeX()

	return -(p4 / v18) * 2 * (v17 * v19) * p5
end
function module.ScreenHeightToWorldHeight(p6, p7)
	local v22 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v23 = math.tan(v22 / 2)
	local v24 = module.ViewSizeY()

	return -(p6 / v24) * 2 * v23 * p7
end
function module.WorldWidthToScreenWidth(p8, p9)
	local v27 = module.AspectRatio()
	local v28 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v29 = math.tan(v28 / 2)

	v28 = module.ViewSizeX()

	return -(p8 * v28) / (2 * (v27 * v29) * p9)
end
function module.WorldHeightToScreenHeight(p10, p11)
	local v32 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v33 = math.tan(v32 / 2)
	local v34 = module.ViewSizeY()

	return -(p10 * v34) / (v33 * 2 * p11)
end
function module.GetDepthForWidth(p12, p13)
	local v37 = module.AspectRatio()
	local v38 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v39 = math.tan(v38 / 2)
	local v40 = module.ViewSizeX()

	module.ViewSizeY()

	return -(v40 * p13) / (p12 * 2 * (v37 * v39))
end
function module.GetDepthForHeight(p14, p15)
	local v43 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v44 = math.tan(v43 / 2)

	return -(module.ViewSizeY() * p15) / (p14 * 2 * v44)
end
function module.ScreenToWorldByHeightDepth(p16, p17, p18, p19)
	local v49 = module.AspectRatio()
	local v50 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v51 = math.tan(v50 / 2)
	local v52 = module.ViewSizeX()
	local v53 = module.ViewSizeY()
	local vector3 = Vector3.new((p16 / v52 * 2 - 1) * -(v49 * v51) * p19, (p17 / v53 * 2 - 1) * v51 * p19, p19)

	return vector3, -(p18 / v53) * 2 * v51 * p19
end
function module.ScreenToWorldByWidthDepth(p20, p21, p22, p23)
	local v59 = module.AspectRatio()
	local v60 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v61 = math.tan(v60 / 2)
	local n1 = v59 * v61

	v60 = module.ViewSizeX()

	local v63 = module.ViewSizeY()
	local vector3 = Vector3.new((p20 / v60 * 2 - 1) * -n1 * p23, ((p21 + 34) / v63 * 2 - 1) * v61 * p23, p23)

	return vector3, p22 / v60 * 2 * -n1 * p23
end
function module.ScreenToWorldByHeight(p24, p25, p26, p27)
	local v69 = module.AspectRatio()
	local v70 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v71 = math.tan(v70 / 2)
	local v72 = module.ViewSizeX()
	local v73 = module.ViewSizeY()
	local n1 = -(v73 * p27) / (p26 * 2 * v71)
	local vector3 = Vector3.new((p24 / v72 * 2 - 1) * -(v69 * v71) * n1, (p25 / v73 * 2 - 1) * v71 * n1, n1)

	return vector3
end
function module.ScreenToWorldByWidth(p28, p29, p30, p31)
	local v80 = module.AspectRatio()
	local v81 = math.rad(workspace.CurrentCamera.FieldOfView)
	local v82 = math.tan(v81 / 2)
	local n1 = v80 * v82

	v81 = module.ViewSizeX()

	local v84 = module.ViewSizeY()

	v80 = -(v81 * p31) / (p30 * 2 * n1)

	local vector3 = Vector3.new((p28 / v81 * 2 - 1) * -n1 * v80, (p29 / v84 * 2 - 1) * v82 * v80, v80)

	return vector3
end
function module.GetAdorneeData(p32, p33)
	local absoluteSize = p32.AbsoluteSize
	local n1 = p32.AbsolutePosition + absoluteSize / 2
	local v90 = module.GetDepthForWidth(absoluteSize.X, p33.Size.X)
	local v91 = module.ScreenToWorld(n1.X, n1.Y, v90)
	local CoordinateFrame: CFrame = workspace.CurrentCamera.CoordinateFrame
	local cFrame = CFrame.new(v91)
	local cFrame2 = CFrame.new(0, 0, -p33.Size.Z / 2)

	return CoordinateFrame * cFrame * cFrame2
end

return module
