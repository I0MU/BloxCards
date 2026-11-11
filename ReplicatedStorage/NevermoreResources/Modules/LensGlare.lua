



local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local lighting: Lighting = game:GetService("Lighting")
local players: Players = game:GetService("Players")
local loadLibrary = require(replicatedStorage:WaitForChild("NevermoreEngine")).LoadLibrary
local v5 = loadLibrary("qSystems")
local v6 = loadLibrary("qGUI")

loadLibrary("qCFrame")

local v7 = loadLibrary("qMath")
local make = v5.Make
local class = v5.Class

local function IsNight()
	local v15: number = lighting:GetMinutesAfterMidnight()
	local u16: boolean = true

	if not (v15 <= 345) then
		u16 = v15 >= 1110
	end

	return u16
end
local function GetSunPositionOnScreenRelativeToCamera(p1, p2)
	local CoordinateFrame = p1.CoordinateFrame
	local cFrameNew = CFrame.new
	local coordinateFrameP = CoordinateFrame.p
	local v22 = CoordinateFrame.p
	local v23: Vector3 = lighting:GetSunDirection()
	local v24 = cFrameNew(coordinateFrameP, v22 + v23)
	local cFrame = CFrame.new(0, 0, -(p2 - 1))

	return v24 * cFrame
end

local v12 = class(function(p3, parent)
	local gui = make("Frame", {
		Archivable = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "LensGlare",
		Visible = true,
		ZIndex = 1,
		BackgroundColor3 = Color3.new(1, 1, 1),
		Parent = parent,
		Position = UDim2.new(0, 0, 0, -2),
		Size = UDim2.new(1, 0, 1, 2)
	})

	p3.Gui = gui

	function p3.Step(p5)
		local unit = (workspace.CurrentCamera.CoordinateFrame.p - workspace.CurrentCamera.Focus.p).unit
		local v53: Vector3 = lighting:GetSunDirection()
		local v54: number = lighting:GetMinutesAfterMidnight()
		local u55: boolean = true

		if not (v54 <= 345) then
			u55 = v54 >= 1110
		end

		if not u55 then
			local backgroundTransparency = 1.45 - (v53 - unit).magnitude / 3
			local CoordinateFrame: CFrame = workspace.CurrentCamera.CoordinateFrame
			local cFrameNew = CFrame.new
			local coordinateFrameP = CoordinateFrame.p
			local v60 = CoordinateFrame.p
			local v61: Vector3 = lighting:GetSunDirection()
			local cFrame = cFrameNew(coordinateFrameP, v60 + v61)
			local v63, v64, v65 = v6.WorldToScreen((cFrame * CFrame.new(0, 0, -9)).p, p5, workspace.CurrentCamera)

			if v63 then
				gui.BackgroundTransparency = backgroundTransparency

				return
			end

			gui.BackgroundTransparency = 1

			return
		end

		gui.BackgroundTransparency = 1
	end
end)

local pickRandomColor3 = v6.PickRandomColor3

local v14 = class(function(p6, parent)
	local t1: {[any]: any} = {
		SunFlareSizeMax = 80,
		SunFlareEndSizeMax = 60,
		SmallPieces = 5,
		SmallPieceSizeMin = 40,
		SmallPieceSizeMax = 60,
		MaxTransparency = 0.7
	}
	local v32 = v6.NewColor3(170, 170, 255)
	local v33 = v6.NewColor3(170, 255, 127)
	local v34 = v6.NewColor3(255, 170, 127)
	local v35 = v6.NewColor3(255, 170, 255)
	local v36 = v6.NewColor3(255, 255, 127)
	local v37 = v6.NewColor3(255, 255, 255)
	local t2 = {
		v32,
		v33,
		v34,
		v35,
		v36,
		v37,
		v6.NewColor3(255, 170, 0)
	}
	v32 = {
		Container = make("Frame", {
			Archivable = false,
			BackgroundTransparency = 1,
			Name = "qLensFlare",
			Visible = true,
			BackgroundColor3 = Color3.new(1, 1, 1),
			Parent = parent,
			Size = UDim2.new(1, 0, 1, 0)
		})
	}
	local t3: {[any]: any} = {}
	local cartisian2ToVector = v7.Cartisian2ToVector

	v35 = function(p8, p9, p10)
		local v69 = v6.GetHalfSize(p8)

		return { Gui = p8, Size = p9, PositionFactor = p10, HalfSize = v69 }
	end

	for i = 1, 5 do
		local randomNumber = math.random(40, 60)
		local v43 = pickRandomColor3(t2)
		local container = v32.Container
		local uDim2 = UDim2.new(0, randomNumber, 0, randomNumber)
		local v46 = make("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = true,
			BackgroundColor3 = v43,
			Name = "SmallGuyInbetweenFlare" .. i,
			Parent = container,
			Size = uDim2
		})

		v43 = v6.GetHalfSize(v46)
		t3[i] = {
			Gui = v46,
			Size = randomNumber,
			PositionFactor = 1 - (i / 7 + 0.2) * 2,
			HalfSize = v43
		}
	end

	local v47 = pickRandomColor3(t2)

	v36 = make("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "LargeLensFlare",
		Visible = true,
		ZIndex = 2,
		BackgroundColor3 = v47,
		Parent = v32.Container,
		Size = UDim2.new(0, 80, 0, 80)
	})
	v47 = v6.GetHalfSize(v36)
	t3[#t3 + 1] = { Size = 80, PositionFactor = 1, Gui = v36, HalfSize = v47 }
	v47 = pickRandomColor3(t2)
	v36 = make("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "LargeLensFlareEnd",
		Visible = true,
		BackgroundColor3 = v47,
		Parent = v32.Container,
		Size = UDim2.new(0, 60, 0, 60)
	})
	v47 = v6.GetHalfSize(v36)
	t3[#t3 + 1] = { Size = 60, PositionFactor = -1, Gui = v36, HalfSize = v47 }
	p6.Guis = v32
	v35 = function(p11, p12, p13, p14, p15)
		local n1 = p14 * p13

		p11.Transparency = 1 - p13 * 0.30000000000000004
		p11.Size = UDim2.new(0, n1, 0, n1)
		p11.Position = v6.UDim2OffsetFromVector2(p12) - p15
	end

	local function Render(p16, p17)
		local n1 = Vector2.new(p17.ViewSizeX, p17.ViewSizeY) / 2
		local n2 = 1 - math.min(1, (n1 - p16).magnitude / (p17.ViewSizeX / 2))
		local v80 = v7.Vector2ToCartisian(p16, n1)

		v7.InvertCartisian2(v80)

		for _, v in pairs(t3) do
			local v83 = cartisian2ToVector(v80 * v.PositionFactor, n1)
			local vGui = v.Gui
			local vHalfSize = v.HalfSize
			local n3 = v.Size * n2

			vGui.Transparency = 1 - n2 * 0.30000000000000004
			vGui.Size = UDim2.new(0, n3, 0, n3)
			vGui.Position = v6.UDim2OffsetFromVector2(v83) - vHalfSize
		end
	end

	t2 = function()
		for _, v in pairs(t3) do
			v.Gui.BackgroundTransparency = 1
		end
	end

	local u49: boolean = false
	local worldToScreen = v6.WorldToScreen

	function p6.Step(p18)
		local CurrentCamera: Camera = workspace.CurrentCamera
		local CoordinateFrame: CFrame = CurrentCamera.CoordinateFrame
		local CoordinateFrame2: CFrame = CurrentCamera.CoordinateFrame
		local cFrameNew = CFrame.new
		local coordinateFrame2P = CoordinateFrame2.p
		local v95 = CoordinateFrame2.p
		local v96: Vector3 = lighting:GetSunDirection()
		local p = (cFrameNew(coordinateFrame2P, v95 + v96) * CFrame.new(0, 0, -899)).p
		local v98, v99, v100 = worldToScreen(p, p18, CurrentCamera)

		if v98 then
			local ray = Ray.new(CoordinateFrame.p, p - CoordinateFrame.p)
			local v102, v103 = workspace:FindPartOnRay(ray, players.LocalPlayer.Character)

			if not v102 then
				u49 = true
				Render(v99, p18, v98)

				return
			end

			if u49 then
				u49 = false

				for _, v in pairs(t3) do
					v.Gui.BackgroundTransparency = 1
				end

				return
			end
		elseif u49 then
			u49 = false

			for _, v in pairs(t3) do
				v.Gui.BackgroundTransparency = 1
			end
		end
	end
end)

return {
	GetSunPositionOnScreenRelativeToCamera = GetSunPositionOnScreenRelativeToCamera,
	getSunPositionOnScreenRelativeToCamera = GetSunPositionOnScreenRelativeToCamera,
	MakeLensGlare = v12,
	makeLensGlare = v12,
	MakeLensFlare = v14,
	makeLensFlare = v14
}
